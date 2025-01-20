@interface SL
@end

@implementation SL

void __48__SL_OOPAWebViewController_setAuthFlowDelegate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _didFinishWithSuccess:a2 response:v10 error:v7];
  }
}

void __40__SL_OOPAWebViewController__loadWebView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 1032);
  id v9 = v3;
  if (v4) {
    [v4 requestForAuthURL:v3];
  }
  else {
  v5 = [MEMORY[0x1E4F28E88] requestWithURL:v3 cachePolicy:1 timeoutInterval:30.0];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 976);
  if (v7) {
    id v8 = (id)[v7 loadRequest:v5];
  }
  else {
    [*(id *)(v6 + 984) loadRequest:v5];
  }
}

void __40__SL_OOPAWebViewController__loadWebView__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__SL_OOPAWebViewController__loadWebView__block_invoke_3;
  v10[3] = &unk_1E64679A8;
  id v11 = v5;
  id v7 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v7;
  uint64_t v12 = *(void *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __40__SL_OOPAWebViewController__loadWebView__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 40) _didFinishWithSuccess:0 response:0 error:*(void *)(a1 + 48)];
  }
}

uint64_t __49__SL_OOPAWebViewController_webViewDidFinishLoad___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _evaluateDocumentTitleForUIWebView:*(void *)(a1 + 40) retryCount:5 completion:a2];
}

uint64_t __85__SL_OOPAWebViewController__evaluateDocumentTitleForUIWebView_retryCount_completion___block_invoke(void *a1)
{
  _SLLog(v1, 3, @"No title for webview, re-trying...");
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7] - 1;

  return [v3 _evaluateDocumentTitleForUIWebView:v4 retryCount:v6 completion:v5];
}

uint64_t __56__SL_OOPAWebViewController_webView_didFinishNavigation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _evaluateDocumentTitleForWebView:*(void *)(a1 + 40) retryCount:5 completion:a2];
}

void __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length])
  {
    _SLLog(v3, 3, @"Found title for webview");
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (v7) {
      _SLLog(v3, 3, @"Error evaluating document title: %@");
    }
    dispatch_time_t v8 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke_2;
    block[3] = &unk_1E6467A20;
    id v9 = (void *)a1[5];
    block[4] = a1[4];
    id v10 = v9;
    uint64_t v12 = (void *)a1[6];
    uint64_t v11 = a1[7];
    id v14 = v10;
    uint64_t v16 = v11;
    id v15 = v12;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __83__SL_OOPAWebViewController__evaluateDocumentTitleForWebView_retryCount_completion___block_invoke_2(void *a1)
{
  _SLLog(v1, 7, @"No title for webview, re-trying...");
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7] - 1;

  return [v3 _evaluateDocumentTitleForWebView:v4 retryCount:v6 completion:v5];
}

@end