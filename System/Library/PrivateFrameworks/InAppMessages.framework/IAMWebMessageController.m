@interface IAMWebMessageController
- (IAMWebMessageController)init;
- (IAMWebMessageControllerDelegate)delegate;
- (IAMWebView)webView;
- (NSArray)contentPages;
- (id)loadCompletion;
- (void)_callLoadCompletionWithError:(id)a3;
- (void)_checkReadyForLoadCompletion;
- (void)_createJSOContentPages:(id)a3 fromMessageEntry:(id)a4 withBlock:(id)a5;
- (void)loadMessageFromMessageEntry:(id)a3 withWebArchiveURL:(id)a4 completionHandler:(id)a5;
- (void)setContentPages:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLoadCompletion:(id)a3;
- (void)unregisterExportedObjectInterface;
- (void)webProcessJSODidCallClose;
- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4;
- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4;
- (void)webProcessJSODidReportEvent:(id)a3;
- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame;
- (void)webProcessPlugInDidCreateBrowserContextController;
- (void)webProcessPlugInWillDestroyBrowserContextController;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation IAMWebMessageController

- (IAMWebMessageController)init
{
  v3.receiver = self;
  v3.super_class = (Class)IAMWebMessageController;
  result = [(IAMWebMessageController *)&v3 init];
  if (result) {
    *(_WORD *)&result->_isGlobalJSOAvailable = 0;
  }
  return result;
}

- (IAMWebView)webView
{
  webView = self->_webView;
  if (!webView)
  {
    v4 = [IAMWebView alloc];
    v5 = [MEMORY[0x263F1FA60] sharedMessagesConfiguration];
    v6 = -[IAMWebView initWithFrame:configuration:](v4, "initWithFrame:configuration:", v5, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v7 = self->_webView;
    self->_webView = v6;

    [(IAMWebView *)self->_webView setNavigationDelegate:self];
    v8 = [MEMORY[0x263F1FAB8] remoteObjectInterfaceWithProtocol:&unk_26CA24888];
    remoteObjectInterface = self->_remoteObjectInterface;
    self->_remoteObjectInterface = v8;

    v10 = [(IAMWebView *)self->_webView _remoteObjectRegistry];
    [v10 registerExportedObject:self interface:self->_remoteObjectInterface];

    webView = self->_webView;
  }

  return webView;
}

- (void)setContentPages:(id)a3
{
  v5 = (NSArray *)a3;
  p_contentPages = &self->_contentPages;
  if (self->_contentPages != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_contentPages, a3);
    if (self->_isGlobalJSOAvailable && !self->_hasSentContentPages)
    {
      p_contentPages = (NSArray **)[(IAMWebProcessProxy *)self->_webProcessProxy setWebProcessJSOContentPages:v7];
      self->_hasSentContentPages = 1;
    }
  }

  MEMORY[0x270F9A790](p_contentPages);
}

- (void)loadMessageFromMessageEntry:(id)a3 withWebArchiveURL:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(IAMWebMessageController *)self webView];
  [(IAMWebMessageController *)self setLoadCompletion:v11];

  objc_storeStrong((id *)&self->_messageEntry, a3);
  if (!v10)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 1;
LABEL_10:
    v16 = [v19 errorWithDomain:@"IAMWebMessageErrorDomain" code:v20 userInfo:0];
    [(IAMWebMessageController *)self _callLoadCompletionWithError:v16];
    goto LABEL_11;
  }
  if (([v10 isFileURL] & 1) == 0)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 2;
    goto LABEL_10;
  }
  v13 = [v10 pathExtension];
  char v14 = [v13 isEqualToString:@"webarchive"];

  if ((v14 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = 3;
    goto LABEL_10;
  }
  v15 = [(ICInAppMessageEntry *)self->_messageEntry applicationMessage];
  v16 = [v15 contentPages];

  if (v16)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __91__IAMWebMessageController_loadMessageFromMessageEntry_withWebArchiveURL_completionHandler___block_invoke;
    v21[3] = &unk_264342248;
    v21[4] = self;
    [(IAMWebMessageController *)self _createJSOContentPages:v16 fromMessageEntry:v9 withBlock:v21];
  }
  v17 = [v10 URLByDeletingLastPathComponent];
  id v18 = (id)[v12 loadFileURL:v10 allowingReadAccessToURL:v17];

LABEL_11:
}

uint64_t __91__IAMWebMessageController_loadMessageFromMessageEntry_withWebArchiveURL_completionHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setContentPages:a2];
  }
  return result;
}

- (void)unregisterExportedObjectInterface
{
  id v3 = [(IAMWebView *)self->_webView _remoteObjectRegistry];
  [v3 unregisterExportedObject:self interface:self->_remoteObjectInterface];
}

- (void)_callLoadCompletionWithError:(id)a3
{
  id v6 = a3;
  v4 = [(IAMWebMessageController *)self loadCompletion];

  if (v4)
  {
    v5 = [(IAMWebMessageController *)self loadCompletion];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(IAMWebMessageController *)self setLoadCompletion:0];
  }
}

- (void)_createJSOContentPages:(id)a3 fromMessageEntry:(id)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__IAMWebMessageController__createJSOContentPages_fromMessageEntry_withBlock___block_invoke;
  block[3] = &unk_264341E60;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __77__IAMWebMessageController__createJSOContentPages_fromMessageEntry_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:*(void *)(a1 + 32) copyItems:1];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    v21 = v2;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v5 imagesCount])
        {
          v24 = v5;
          uint64_t v25 = i;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v6 = [v5 images];
          uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v8; ++j)
              {
                if (*(void *)v27 != v9) {
                  objc_enumerationMutation(v6);
                }
                id v11 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                if ([v11 hasIdentifier] && objc_msgSend(v11, "hasURL"))
                {
                  id v12 = *(void **)(a1 + 40);
                  id v13 = [v11 identifier];
                  char v14 = [v12 cachedLocationForResourceWithIdentifier:v13];

                  if (v14)
                  {
                    id v15 = [NSURL fileURLWithPath:v14 isDirectory:0];
                    id v16 = [v15 absoluteString];
                    [v11 setURL:v16];
                  }
                }
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v8);
          }

          v2 = v21;
          v5 = v24;
          uint64_t i = v25;
        }
        id v17 = [v5 dictionaryRepresentationWithReportableMetricsEvents];
        [v2 addObject:v17];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  if (*(void *)(a1 + 48) && [v2 count])
  {
    uint64_t v18 = *(void *)(a1 + 48);
    v19 = (void *)[v2 copy];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
}

- (void)_checkReadyForLoadCompletion
{
  if (self->_didMainNavigationFinish && self->_isGlobalJSOAvailable) {
    [(IAMWebMessageController *)self _callLoadCompletionWithError:0];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  self->_didMainNavigationFinish = 1;
  [(IAMWebMessageController *)self _checkReadyForLoadCompletion];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
}

- (void)webProcessPlugInDidCreateBrowserContextController
{
  id v6 = [MEMORY[0x263F1FAB8] remoteObjectInterfaceWithProtocol:&unk_26CA2B3C8];
  id v3 = [(IAMWebView *)self->_webView _remoteObjectRegistry];
  v4 = [v3 remoteObjectProxyWithInterface:v6];
  webProcessProxy = self->_webProcessProxy;
  self->_webProcessProxy = v4;
}

- (void)webProcessPlugInWillDestroyBrowserContextController
{
  id v3 = [(IAMWebView *)self->_webView _remoteObjectRegistry];
  [v3 unregisterExportedObject:self interface:self->_remoteObjectInterface];
}

- (void)webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame
{
  id v3 = [(IAMWebMessageController *)self contentPages];
  uint64_t v4 = [v3 count];

  if (v4 && !self->_hasSentContentPages)
  {
    webProcessProxy = self->_webProcessProxy;
    id v6 = [(IAMWebMessageController *)self contentPages];
    [(IAMWebProcessProxy *)webProcessProxy setWebProcessJSOContentPages:v6];

    self->_hasSentContentPages = 1;
  }
  self->_isGlobalJSOAvailable = 1;
}

- (void)webProcessJSODidReportEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(IAMWebMessageController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(IAMWebMessageController *)self delegate];
    [v6 webMessageControllerWebViewDidReportEvent:self event:v7];
  }
}

- (void)webProcessJSODidCallPerformAction:(id)a3 options:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(IAMWebMessageController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(IAMWebMessageController *)self delegate];
    [v9 webMessageControllerWebViewDidRequestAction:self actionConfiguration:v10 options:v6];
  }
}

- (void)webProcessJSODidCallOpen:(id)a3 options:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(IAMWebMessageController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(IAMWebMessageController *)self delegate];
    id v10 = [NSURL URLWithString:v11];
    [v9 webMessageControllerWebViewDidRequestOpenURL:self url:v10 options:v6];
  }
}

- (void)webProcessJSODidCallClose
{
  id v3 = [(IAMWebMessageController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(IAMWebMessageController *)self delegate];
    [v5 webMessageControllerWebViewDidRequestClose:self];
  }
}

- (IAMWebMessageControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IAMWebMessageControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)contentPages
{
  return self->_contentPages;
}

- (id)loadCompletion
{
  return self->_loadCompletion;
}

- (void)setLoadCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadCompletion, 0);
  objc_storeStrong((id *)&self->_contentPages, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_messageEntry, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);

  objc_storeStrong((id *)&self->_webProcessProxy, 0);
}

@end