@interface MUWebPlacecardBridge
- (MUWebPlacecardBridge)initWithConfiguration:(id)a3 delegate:(id)a4;
- (WKProcessPool)pool;
- (WKWebView)webView;
- (id)_newConfiguredWebView;
- (void)callMethod:(id)a3 arguments:(id)a4;
- (void)dealloc;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation MUWebPlacecardBridge

- (MUWebPlacecardBridge)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUWebPlacecardBridge;
  v9 = [(MUWebPlacecardBridge *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bridgeConfiguration, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = [(MUWebPlacecardBridge *)v10 _newConfiguredWebView];
    webView = v10->_webView;
    v10->_webView = (WKWebView *)v11;
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(WKWebViewConfiguration *)self->_webViewConfiguration userContentController];
  v4 = [(MUWebPlacecardBridgeConfiguration *)self->_bridgeConfiguration nativeControllerName];
  v5 = [MEMORY[0x1E4F46678] pageWorld];
  [v3 removeScriptMessageHandlerForName:v4 contentWorld:v5];

  v6.receiver = self;
  v6.super_class = (Class)MUWebPlacecardBridge;
  [(MUWebPlacecardBridge *)&v6 dealloc];
}

- (id)_newConfiguredWebView
{
  v3 = [MUWebPlacecardMessageHandlerWithReply alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [(MUWebPlacecardMessageHandlerWithReply *)v3 initWithDelegate:WeakRetained];

  objc_super v6 = (WKWebViewConfiguration *)objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v7 = [(MUWebPlacecardBridge *)self pool];
  [(WKWebViewConfiguration *)v6 setProcessPool:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F466A0]);
  [(WKWebViewConfiguration *)v6 setUserContentController:v8];

  [(WKWebViewConfiguration *)v6 setValue:@"TRUE" forKey:@"allowUniversalAccessFromFileURLs"];
  v9 = [(WKWebViewConfiguration *)v6 userContentController];
  v10 = [MEMORY[0x1E4F46678] pageWorld];
  uint64_t v11 = [(MUWebPlacecardBridgeConfiguration *)self->_bridgeConfiguration nativeControllerName];
  [v9 addScriptMessageHandlerWithReply:v5 contentWorld:v10 name:v11];

  webViewConfiguration = self->_webViewConfiguration;
  self->_webViewConfiguration = v6;
  v13 = v6;

  id v14 = objc_alloc(MEMORY[0x1E4F466F0]);
  v15 = objc_msgSend(v14, "initWithFrame:configuration:", v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setNavigationDelegate:self];
  v16 = [v15 scrollView];
  [v16 setScrollsToTop:0];

  v17 = [v15 scrollView];
  [v17 setMaximumZoomScale:1.0];

  v18 = [v15 scrollView];
  [v18 setMinimumZoomScale:1.0];

  [v15 setOpaque:0];
  return v15;
}

- (WKProcessPool)pool
{
  pool = self->_pool;
  if (!pool)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F46780]);
    [v4 setUsesSingleWebProcess:1];
    v5 = (WKProcessPool *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v4];
    objc_super v6 = self->_pool;
    self->_pool = v5;

    pool = self->_pool;
  }
  return pool;
}

- (void)callMethod:(id)a3 arguments:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  [v9 setObject:v6 forKeyedSubscript:@"name"];
  [v9 setObject:v8 forKeyedSubscript:@"arguments"];

  id v23 = 0;
  v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:0 error:&v23];
  id v11 = v23;
  if ([v10 length]) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v13 = MUGetMUWebContentLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v11;
      _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "Error serializing json into string: %@", buf, 0xCu);
    }
  }
  id v14 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  v15 = NSString;
  v16 = [(MUWebPlacecardBridgeConfiguration *)self->_bridgeConfiguration webControllerName];
  v17 = [v15 stringWithFormat:@"return window.%@.receiveMessage(%@)", v16, v14];

  v18 = [(MUWebPlacecardBridge *)self webView];
  v19 = [MEMORY[0x1E4F46678] pageWorld];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__MUWebPlacecardBridge_callMethod_arguments___block_invoke;
  v21[3] = &unk_1E574ED40;
  id v22 = v6;
  id v20 = v6;
  [v18 callAsyncJavaScript:v17 arguments:0 inFrame:0 inContentWorld:v19 completionHandler:v21];
}

void __45__MUWebPlacecardBridge_callMethod_arguments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MUGetMUWebContentLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      id v9 = "Calling JavaScript message %@ failed with error %@";
      v10 = v7;
      uint32_t v11 = 22;
LABEL_4:
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, v11);
    }
  }
  else
  {
    if (v5) {
      goto LABEL_7;
    }
    id v7 = MUGetMUWebContentLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138412290;
      uint64_t v14 = v12;
      id v9 = "Calling JavaScript message %@ returned a nil object from web module";
      v10 = v7;
      uint32_t v11 = 12;
      goto LABEL_4;
    }
  }

LABEL_7:
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_currentNavigation == a4)
  {
    v10 = MUGetMUWebContentLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218242;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v12, 0x16u);
    }

    uint32_t v11 = [(MUWebPlacecardBridge *)self webView];
    [v11 stopLoading];
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (self->_currentNavigation == a4)
  {
    v10 = MUGetMUWebContentLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218242;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "<WKWebView: %p> failed to load content with error %@", (uint8_t *)&v12, 0x16u);
    }

    uint32_t v11 = [(MUWebPlacecardBridge *)self webView];
    [v11 stopLoading];
  }
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_currentNavigation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webViewConfiguration, 0);
  objc_storeStrong((id *)&self->_bridgeConfiguration, 0);
}

@end