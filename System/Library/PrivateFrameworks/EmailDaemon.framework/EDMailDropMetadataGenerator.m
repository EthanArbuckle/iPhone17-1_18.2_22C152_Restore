@interface EDMailDropMetadataGenerator
- (BOOL)_shouldSearchForMailDropNodesInFileURL:(id)a3;
- (EFPromise)activePromise;
- (NSMutableArray)scriptHandlers;
- (WKWebView)webView;
- (id)withTimeout:(double)a3 do:(id)a4 completion:(id)a5;
- (void)_addScriptHandlerForKey:(id)a3 handler:(id)a4;
- (void)_findMailDropNodesInFileURL:(id)a3 promise:(id)a4;
- (void)dealloc;
- (void)generateMailDropMetadataForContentURL:(id)a3 completionHandler:(id)a4;
- (void)insertMailDropAttachmentViewForContentURL:(id)a3 HTMLByContentID:(id)a4 completionHandler:(id)a5;
- (void)setActivePromise:(id)a3;
- (void)setScriptHandlers:(id)a3;
- (void)setWebView:(id)a3;
- (void)tearDownWebView;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation EDMailDropMetadataGenerator

void ___ef_log_EDMailDropMetadataGenerator_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDMailDropMetadataGenerator");
  v1 = (void *)_ef_log_EDMailDropMetadataGenerator_log;
  _ef_log_EDMailDropMetadataGenerator_log = (uint64_t)v0;
}

- (void)dealloc
{
  [(EDMailDropMetadataGenerator *)self tearDownWebView];
  v3.receiver = self;
  v3.super_class = (Class)EDMailDropMetadataGenerator;
  [(EDMailDropMetadataGenerator *)&v3 dealloc];
}

- (id)withTimeout:(double)a3 do:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, void *))a4;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F60E18] promise];
  id v10 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  v11 = [v9 future];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke;
  v28[3] = &unk_1E6C01C58;
  id v12 = v10;
  id v29 = v12;
  id v13 = v8;
  id v30 = v13;
  [v11 addSuccessBlock:v28];

  v14 = [v9 future];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_2;
  v25[3] = &unk_1E6C01C80;
  id v15 = v12;
  id v26 = v15;
  id v16 = v13;
  id v27 = v16;
  [v14 addFailureBlock:v25];

  v7[2](v7, v9);
  v17 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_3;
  v23[3] = &unk_1E6BFF2F0;
  id v18 = v9;
  id v24 = v18;
  v19 = [v17 afterDelay:v23 performBlock:a3];
  [v15 addCancelable:v19];

  v20 = v24;
  id v21 = v18;

  return v21;
}

void __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__EDMailDropMetadataGenerator_withTimeout_do_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ef_timeoutError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithError:");
}

- (void)generateMailDropMetadataForContentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __87__EDMailDropMetadataGenerator_generateMailDropMetadataForContentURL_completionHandler___block_invoke;
  id v12 = &unk_1E6C01CA8;
  id v13 = self;
  id v7 = v6;
  id v14 = v7;
  id v8 = [(EDMailDropMetadataGenerator *)self withTimeout:&v9 do:a4 completion:5.0];
  -[EDMailDropMetadataGenerator setActivePromise:](self, "setActivePromise:", v8, v9, v10, v11, v12, v13);
}

uint64_t __87__EDMailDropMetadataGenerator_generateMailDropMetadataForContentURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _findMailDropNodesInFileURL:*(void *)(a1 + 40) promise:a2];
}

- (void)tearDownWebView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(EDMailDropMetadataGenerator *)self webView];
  v4 = [v3 configuration];
  v5 = [v4 userContentController];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(EDMailDropMetadataGenerator *)self scriptHandlers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * v9) name];
        [v5 removeScriptMessageHandlerForName:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = [(EDMailDropMetadataGenerator *)self scriptHandlers];
  [v11 removeAllObjects];

  id v12 = [(EDMailDropMetadataGenerator *)self webView];
  [v12 _close];

  [(EDMailDropMetadataGenerator *)self setWebView:0];
}

- (BOOL)_shouldSearchForMailDropNodesInFileURL:(id)a3
{
  id v3 = a3;
  v4 = [NSString stringWithContentsOfURL:v3 encoding:4 error:0];
  v5 = v4;
  if (!v4)
  {
    uint64_t v7 = _ef_log_EDMailDropMetadataGenerator();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EDMailDropMetadataGenerator _shouldSearchForMailDropNodesInFileURL:]((uint64_t)v3, v7);
    }
    goto LABEL_7;
  }
  int v6 = [v4 containsString:*MEMORY[0x1E4F5FD58]];
  uint64_t v7 = _ef_log_EDMailDropMetadataGenerator();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      BOOL v9 = 1;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "HTML file seems to contain Mail Drop tags; proceeding with node search",
        buf,
        2u);
      goto LABEL_11;
    }
LABEL_7:
    BOOL v9 = 1;
    goto LABEL_11;
  }
  if (v8)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "HTML file does not contain Mail Drop tags; skipping node search",
      v11,
      2u);
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)_findMailDropNodesInFileURL:(id)a3 promise:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(EDMailDropMetadataGenerator *)self _shouldSearchForMailDropNodesInFileURL:v6])
  {
    BOOL v8 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke;
    v9[3] = &unk_1E6BFF7A8;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [v8 performBlock:v9];
  }
  else
  {
    [v7 finishWithResult:MEMORY[0x1E4F1CBF0]];
  }
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  [v2 _setAllowsJavaScriptMarkup:0];
  [v2 _setClientNavigationsRunAtForegroundPriority:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2;
  block[3] = &unk_1E6BFF2F0;
  block[4] = a1[4];
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, block);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F466A8]);
  v4 = (void *)[v3 initWithSource:_block_invoke_mailDropSupportSource injectionTime:1 forMainFrameOnly:0];
  v5 = [v2 userContentController];
  [v5 addUserScript:v4];

  id v6 = [a1[4] webView];
  LODWORD(v5) = v6 == 0;

  if (v5)
  {
    _ef_log_EDMailDropMetadataGenerator();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [a1[5] lastPathComponent];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v8;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Creating a webview for parsing MailDrop nodes for HTML file %@", buf, 0xCu);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F466F0]);
    id v10 = objc_msgSend(v9, "initWithFrame:configuration:", v2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [a1[4] setWebView:v10];

    id v11 = a1[4];
    id v12 = [v11 webView];
    [v12 setNavigationDelegate:v11];
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, a1[4]);
  id v13 = a1[4];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_21;
  v16[3] = &unk_1E6C01CD0;
  objc_copyWeak(&v18, (id *)buf);
  id v17 = a1[6];
  [v13 _addScriptHandlerForKey:@"FinishedParsingMailDropNodes" handler:v16];
  long long v14 = [a1[4] webView];
  id v15 = (id)[v14 loadFileURL:a1[5] allowingReadAccessToURL:a1[5]];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"EDMailDropSupport" ofType:@"js"];

  id v7 = 0;
  uint64_t v2 = [[NSString alloc] initWithContentsOfFile:v1 encoding:4 error:&v7];
  id v3 = v7;
  v4 = (void *)_block_invoke_mailDropSupportSource;
  _block_invoke_mailDropSupportSource = v2;

  if (!_block_invoke_mailDropSupportSource)
  {
    _ef_log_EDMailDropMetadataGenerator();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(v3, "ef_publicDescription");
      __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2_cold_1(v6, (uint64_t)v8, v5);
    }
  }
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = _ef_log_EDMailDropMetadataGenerator();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "MailDrop: Received Script message Finished MailDrop %@", (uint8_t *)&v11, 0xCu);
  }

  id v6 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = objc_msgSend(v6, "ef_all:", &__block_literal_global_173);

    if (v7)
    {
      [*(id *)(a1 + 32) finishWithResult:v6];
      goto LABEL_10;
    }
  }
  else
  {
  }
  BOOL v8 = _ef_log_EDMailDropMetadataGenerator();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_21_cold_1(v8);
  }

  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2049 userInfo:0];
  [v9 finishWithError:v10];

  [WeakRetained tearDownWebView];
LABEL_10:
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  v4 = _ef_log_EDMailDropMetadataGenerator();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[EDMailDropMetadataGenerator webViewWebContentProcessDidTerminate:](v4);
  }

  v5 = [(EDMailDropMetadataGenerator *)self activePromise];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2049 userInfo:0];
  [v5 finishWithError:v6];

  [(EDMailDropMetadataGenerator *)self tearDownWebView];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  _ef_log_EDMailDropMetadataGenerator();
  int v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    BOOL v8 = objc_msgSend(v6, "ef_publicDescription");
    -[EDMailDropMetadataGenerator webView:didFailProvisionalNavigation:withError:](v8, (uint64_t)v10, v7);
  }

  uint64_t v9 = [(EDMailDropMetadataGenerator *)self activePromise];
  [v9 finishWithError:v6];

  [(EDMailDropMetadataGenerator *)self tearDownWebView];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _ef_log_EDMailDropMetadataGenerator();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 URL];
    int v7 = 138412290;
    BOOL v8 = v6;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_INFO, "MailDrop: Finished loading webview for URL %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)insertMailDropAttachmentViewForContentURL:(id)a3 HTMLByContentID:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke;
    v16[3] = &unk_1E6C01CA8;
    id v17 = v7;
    id v18 = self;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_30;
    uint64_t v13 = &unk_1E6C01D20;
    long long v14 = self;
    id v15 = v8;
    uint64_t v9 = [(EDMailDropMetadataGenerator *)self withTimeout:v16 do:&v10 completion:5.0];
    -[EDMailDropMetadataGenerator setActivePromise:](self, "setActivePromise:", v9, v10, v11, v12, v13, v14);
  }
  else
  {
    [(EDMailDropMetadataGenerator *)self tearDownWebView];
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:*(void *)(a1 + 32) options:0 error:0];
  v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  id v6 = [*(id *)(a1 + 40) webView];
  id v7 = [v6 URL];

  id v8 = [NSString stringWithFormat:@"replaceNodeWithIdWithHTML(%@);", v5];
  uint64_t v9 = [*(id *)(a1 + 40) webView];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E6C01CF8;
  id v10 = v7;
  uint64_t v11 = *(void *)(a1 + 40);
  id v14 = v10;
  uint64_t v15 = v11;
  id v12 = v3;
  id v16 = v12;
  [v9 evaluateJavaScript:v8 completionHandler:v13];
}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    uint64_t v7 = *(void *)(a1 + 32);
    id v17 = 0;
    char v8 = [v5 writeToURL:v7 atomically:1 encoding:4 error:&v17];
    id v9 = v17;
    id v6 = v9;
    if (v8)
    {
      id v10 = v9;
      goto LABEL_15;
    }
    _ef_log_EDMailDropMetadataGenerator();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend(v6, "ef_publicDescription");
      __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2_cold_1(v13, (uint64_t)v22, v12);
    }

    if (v6)
    {
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      id v21 = v6;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2049 userInfo:v11];
  }
  else
  {
    if (v6)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      id v19 = v6;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5FCD0] code:2049 userInfo:v11];
  }
  id v10 = (void *)v14;

LABEL_15:
  [*(id *)(a1 + 40) tearDownWebView];
  uint64_t v15 = *(void **)(a1 + 48);
  if (v10)
  {
    [v15 finishWithError:v10];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CA98] null];
    [v15 finishWithResult:v16];
  }
}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) tearDownWebView];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_addScriptHandlerForKey:(id)a3 handler:(id)a4
{
  id v16 = a3;
  id v7 = a4;
  char v8 = [(EDMailDropMetadataGenerator *)self webView];
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"EDMailDropMetadataGenerator.m", 244, @"Invalid parameter not satisfying: %@", @"webView" object file lineNumber description];
  }
  if (!self->_scriptHandlers)
  {
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    scriptHandlers = self->_scriptHandlers;
    self->_scriptHandlers = v9;
  }
  uint64_t v11 = objc_alloc_init(EDMailDropWebViewScriptHandler);
  [(EDMailDropWebViewScriptHandler *)v11 setName:v16];
  [(EDMailDropWebViewScriptHandler *)v11 setWebView:v8];
  [(EDMailDropWebViewScriptHandler *)v11 setHandler:v7];
  [(NSMutableArray *)self->_scriptHandlers addObject:v11];
  id v12 = [v8 configuration];
  uint64_t v13 = [v12 userContentController];
  uint64_t v14 = [(EDMailDropWebViewScriptHandler *)v11 name];
  [v13 addScriptMessageHandler:v11 name:v14];
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSMutableArray)scriptHandlers
{
  return self->_scriptHandlers;
}

- (void)setScriptHandlers:(id)a3
{
}

- (EFPromise)activePromise
{
  return self->_activePromise;
}

- (void)setActivePromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePromise, 0);
  objc_storeStrong((id *)&self->_scriptHandlers, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)_shouldSearchForMailDropNodesInFileURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Could not load contents of URL %@ for pre-screening; proceeding with node search",
    (uint8_t *)&v2,
    0xCu);
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1DB39C000, a2, a3, "could not load the mail drop support javascript resource: %{public}@", (uint8_t *)a2);
}

void __67__EDMailDropMetadataGenerator__findMailDropNodesInFileURL_promise___block_invoke_21_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "MailDrop: Script message finished with a non-array value", v1, 2u);
}

- (void)webViewWebContentProcessDidTerminate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "MailDrop: WebView terminated", v1, 2u);
}

- (void)webView:(void *)a1 didFailProvisionalNavigation:(uint64_t)a2 withError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1DB39C000, a2, a3, "MailDrop: Failed to load WebView Error %{public}@", (uint8_t *)a2);
}

void __107__EDMailDropMetadataGenerator_insertMailDropAttachmentViewForContentURL_HTMLByContentID_completionHandler___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6(&dword_1DB39C000, a2, a3, "Unable to rewrite HTML with updated maildrop nodes. Error: %{public}@", (uint8_t *)a2);
}

@end