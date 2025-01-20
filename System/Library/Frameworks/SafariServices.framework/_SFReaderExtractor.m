@interface _SFReaderExtractor
- (_SFReaderExtractor)init;
- (id)_configuration;
- (id)_processPool;
- (void)_finishWithContent:(id)a3 error:(id)a4;
- (void)_invalidateTimers;
- (void)_scheduleLoadingTimeout;
- (void)_scheduleReaderDataExtractionTimeout;
- (void)_setUpReaderController;
- (void)getExtractedDataForURL:(id)a3 withCompletion:(id)a4;
- (void)getExtractedDataForURL:(id)a3 withData:(id)a4 withCompletion:(id)a5;
- (void)readerController:(id)a3 didCollectArticleContent:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewWebContentProcessDidTerminate:(id)a3;
@end

@implementation _SFReaderExtractor

- (_SFReaderExtractor)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFReaderExtractor;
  v2 = [(_SFReaderExtractor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_SFReaderExtractor *)v2 _setUpReaderController];
    v4 = v3;
  }

  return v3;
}

- (id)_processPool
{
  processPool = self->_processPool;
  if (processPool)
  {
    v3 = processPool;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F46780]);
    objc_super v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 builtInPlugInsURL];
    v8 = [v7 URLByAppendingPathComponent:@"SafariServices.wkbundle" isDirectory:1];
    [v5 setInjectedBundleURL:v8];

    v9 = (WKProcessPool *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v5];
    v10 = self->_processPool;
    self->_processPool = v9;

    v3 = self->_processPool;
  }

  return v3;
}

- (id)_configuration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  v4 = [(_SFReaderExtractor *)self _processPool];
  [v3 setProcessPool:v4];

  id v5 = objc_msgSend(MEMORY[0x1E4F46710], "safari_nonPersistentDataStore");
  [v3 setWebsiteDataStore:v5];

  [v3 _setClientNavigationsRunAtForegroundPriority:1];

  return v3;
}

- (void)_setUpReaderController
{
  id v3 = objc_alloc(MEMORY[0x1E4F466F0]);
  v4 = [(_SFReaderExtractor *)self _configuration];
  id v5 = (WKWebView *)objc_msgSend(v3, "initWithFrame:configuration:", v4, 0.0, 0.0, 1264.0, 760.0);
  webView = self->_webView;
  self->_webView = v5;

  v7 = _SFMacSafariUserAgentString();
  [(WKWebView *)self->_webView _setCustomUserAgent:v7];

  [(WKWebView *)self->_webView setNavigationDelegate:self];
  [(WKWebView *)self->_webView setInspectable:0];
  v8 = [[_SFReaderController alloc] initWithWebView:self->_webView];
  readerController = self->_readerController;
  self->_readerController = v8;

  v10 = self->_readerController;

  [(_SFReaderController *)v10 setDelegate:self];
}

- (void)_finishWithContent:(id)a3 error:(id)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(_SFReaderExtractor *)self _invalidateTimers];
  v8 = (void (**)(void, void, void))MEMORY[0x1AD0C36A0](self->_completionHandler);
  v9 = self->_currentURL;
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  currentURL = self->_currentURL;
  self->_currentURL = 0;

  if (v8)
  {
    if (v7)
    {
      ((void (**)(void, void, id))v8)[2](v8, 0, v7);
    }
    else
    {
      if ([v6 count])
      {
        uint64_t v12 = [v6 objectForKeyedSubscript:@"error"];
        v13 = (void *)v12;
        if (v12)
        {
          v20[0] = @"error";
          v20[1] = @"stack";
          v21[0] = v12;
          uint64_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:");
          v15 = (void *)v14;
          v16 = @"No stack trace";
          if (v14) {
            v16 = (__CFString *)v14;
          }
          v21[1] = v16;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

          v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.safariservices.readerExtractorErrorDomain" code:2 userInfo:v17];
          ((void (**)(void, void, void *))v8)[2](v8, 0, v18);

          v19 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[_SFReaderExtractor _finishWithContent:error:]((uint64_t)v9, (uint64_t)v13, v19);
          }
        }
        else
        {
          v17 = [[_SFReaderExtractedData alloc] initWithReaderContent:v6 url:v9];
          ((void (**)(void, _SFReaderExtractedData *, void))v8)[2](v8, v17, 0);
        }
      }
      else
      {
        v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.safariservices.readerExtractorErrorDomain" code:1 userInfo:0];
        ((void (**)(void, void, void *))v8)[2](v8, 0, v13);
      }
    }
  }
}

- (void)_invalidateTimers
{
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  if (loadingTimeoutTimer)
  {
    [(NSTimer *)loadingTimeoutTimer invalidate];
    v4 = self->_loadingTimeoutTimer;
    self->_loadingTimeoutTimer = 0;
  }
  readerExtractionTimer = self->_readerExtractionTimer;
  if (readerExtractionTimer)
  {
    [(NSTimer *)readerExtractionTimer invalidate];
    id v6 = self->_readerExtractionTimer;
    self->_readerExtractionTimer = 0;
  }
}

- (void)_scheduleLoadingTimeout
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F1CB00];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___SFReaderExtractor__scheduleLoadingTimeout__block_invoke;
  v6[3] = &unk_1E5C733A8;
  objc_copyWeak(&v7, &location);
  v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:30.0];
  loadingTimeoutTimer = self->_loadingTimeoutTimer;
  self->_loadingTimeoutTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_scheduleReaderDataExtractionTimeout
{
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F1CB00];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58___SFReaderExtractor__scheduleReaderDataExtractionTimeout__block_invoke;
  v6[3] = &unk_1E5C733A8;
  objc_copyWeak(&v7, &location);
  v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:10.0];
  readerExtractionTimer = self->_readerExtractionTimer;
  self->_readerExtractionTimer = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)getExtractedDataForURL:(id)a3 withCompletion:(id)a4
{
  id v12 = a3;
  id v7 = (void *)MEMORY[0x1AD0C36A0](a4);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v7;

  objc_storeStrong((id *)&self->_currentURL, a3);
  webView = self->_webView;
  v10 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v12);
  id v11 = [(WKWebView *)webView loadRequest:v10];

  [(_SFReaderExtractor *)self _scheduleLoadingTimeout];
}

- (void)getExtractedDataForURL:(id)a3 withData:(id)a4 withCompletion:(id)a5
{
  id v13 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1AD0C36A0](a5);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v10;

  objc_storeStrong((id *)&self->_currentURL, a3);
  id v12 = [(WKWebView *)self->_webView loadData:v9 MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:self->_currentURL];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  [(_SFReaderExtractor *)self _invalidateTimers];
  id v5 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_DEFAULT, "Collecting article content after finishing navigation", v6, 2u);
  }
  [(_SFReaderController *)self->_readerController collectArticleContent];
  [(_SFReaderExtractor *)self _scheduleReaderDataExtractionTimeout];
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v6 = a5;
  id v7 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[_SFReaderExtractor webView:didFailProvisionalNavigation:withError:](v7, v6);
  }
  [(_SFReaderExtractor *)self _finishWithContent:0 error:v6];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = [v6 code];
  v8 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  id v9 = v8;
  if (v7 == -999)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      id v11 = objc_msgSend(v6, "safari_privacyPreservingDescription");
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1A690B000, v10, OS_LOG_TYPE_DEFAULT, "Failed navigation but ignoring error: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_SFReaderExtractor webView:didFailNavigation:withError:](v9, v6);
    }
    [(_SFReaderExtractor *)self _finishWithContent:0 error:v6];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v11 = (void (**)(id, BOOL))a5;
  id v7 = a4;
  uint64_t v8 = [v7 response];
  id v9 = [(id)v8 URL];

  LOBYTE(v8) = [v7 isForMainFrame];
  BOOL v10 = (v8 & 1) != 0
     || !objc_msgSend(v9, "safari_isHTTPFamilyURL")
     || objc_msgSend(v9, "safari_hasSameOriginAsURL:", self->_currentURL);
  v11[2](v11, v10);
}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  v4 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_SFReaderExtractor webViewWebContentProcessDidTerminate:](v4);
  }
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.safariservices.readerExtractorErrorDomain" code:3 userInfo:0];
  [(_SFReaderExtractor *)self _finishWithContent:0 error:v5];
}

- (void)readerController:(id)a3 didCollectArticleContent:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138739971;
    id v8 = v5;
    _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Did collect article content: %{sensitive}@", (uint8_t *)&v7, 0xCu);
  }
  [(_SFReaderExtractor *)self _finishWithContent:v5 error:0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_readerExtractionTimer, 0);
  objc_storeStrong((id *)&self->_loadingTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_readerController, 0);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_readerWebView, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)_finishWithContent:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138740227;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1A690B000, log, OS_LOG_TYPE_FAULT, "Encountered error on %{sensitive}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)webView:(void *)a1 didFailProvisionalNavigation:(void *)a2 withError:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Failed provisional navigation: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)webView:(void *)a1 didFailNavigation:(void *)a2 withError:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A690B000, v5, v6, "Failed navigation: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)webViewWebContentProcessDidTerminate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Web content process crashed", v1, 2u);
}

@end