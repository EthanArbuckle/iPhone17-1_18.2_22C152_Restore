@interface MSCustomProtocolURLSchemeHandler
+ (MSCustomProtocolURLSchemeHandler)sharedHandler;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation MSCustomProtocolURLSchemeHandler

+ (MSCustomProtocolURLSchemeHandler)sharedHandler
{
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedHandler_handler;
  return (MSCustomProtocolURLSchemeHandler *)v2;
}

void __49__MSCustomProtocolURLSchemeHandler_sharedHandler__block_invoke()
{
  v0 = objc_alloc_init(MSCustomProtocolURLSchemeHandler);
  v1 = (void *)sharedHandler_handler;
  sharedHandler_handler = (uint64_t)v0;
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x1E4F290E0] sharedSession];
  v6 = [v4 request];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke;
  v9[3] = &unk_1E63FE9D0;
  id v7 = v4;
  id v10 = v7;
  v8 = [v5 dataTaskWithRequest:v6 completionHandler:v9];

  objc_setAssociatedObject(v7, (const void *)taskKey, v8, (void *)0x301);
  [v8 resume];
}

void __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke_2;
  v13[3] = &unk_1E63FE9A8;
  id v14 = *(id *)(a1 + 32);
  id v15 = v8;
  id v16 = v7;
  id v17 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __63__MSCustomProtocolURLSchemeHandler_webView_startURLSchemeTask___block_invoke_2(uint64_t a1)
{
  v2 = objc_getAssociatedObject(*(id *)(a1 + 32), (const void *)taskKey);

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      objc_msgSend(v3, "didReceiveResponse:");
      [*(id *)(a1 + 32) didReceiveData:*(void *)(a1 + 48)];
      id v4 = *(void **)(a1 + 32);
      [v4 didFinish];
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 56);
      [v3 didFailWithError:v5];
    }
  }
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id object = a4;
  id v4 = objc_getAssociatedObject(object, (const void *)taskKey);
  objc_setAssociatedObject(object, (const void *)taskKey, 0, (void *)0x301);
  [v4 cancel];
}

@end