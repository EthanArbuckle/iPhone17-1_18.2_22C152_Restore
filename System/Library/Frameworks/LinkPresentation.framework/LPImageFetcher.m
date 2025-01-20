@interface LPImageFetcher
+ (id)imageFetcherForConfiguration:(id)a3;
- (NSURL)URL;
- (void)_completedWithImage:(id)a3 error:(id)a4;
- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4;
- (void)cancel;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setURL:(id)a3;
@end

@implementation LPImageFetcher

+ (id)imageFetcherForConfiguration:(id)a3
{
  id v3 = a3;
  int v4 = [v3 fetchIsNotUserInitiated];
  v5 = off_1E5B044C8;
  if (!v4) {
    v5 = off_1E5B04590;
  }
  id v6 = objc_alloc_init(*v5);

  return v6;
}

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 rootEvent];
  v9 = [v8 childWithType:2 subtitle:0];
  [(LPFetcher *)self set_event:v9];

  URL = self->_URL;
  v11 = [(LPFetcher *)self _event];
  [v11 setURL:URL];

  v12 = _Block_copy(v7);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v12;

  v14 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[LPImageFetcher fetchWithConfiguration:completionHandler:]((uint64_t)v28, [(LPFetcher *)self _loggingID]);
  }

  v15 = [(LPImageFetcher *)self URL];
  v16 = objc_msgSend(v15, "_lp_requestWithAttribution:", objc_msgSend(v6, "loadingIsNonAppInitiated"));

  v17 = [v6 webViewForProcessSharing];
  if (!v17)
  {
    v18 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[LPImageFetcher fetchWithConfiguration:completionHandler:]((uint64_t)v27, [(LPFetcher *)self _loggingID]);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F466F0]);
    id v20 = +[LPMetadataProvider _copyDefaultWebViewConfiguration];
    v21 = (WKWebView *)objc_msgSend(v19, "initWithFrame:configuration:", v20, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    webView = self->_webView;
    self->_webView = v21;

    v23 = +[LPMetadataProvider _defaultUserAgent];
    [(WKWebView *)self->_webView setCustomUserAgent:v23];

    v17 = self->_webView;
  }
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__LPImageFetcher_fetchWithConfiguration_completionHandler___block_invoke;
  v24[3] = &unk_1E5B06608;
  objc_copyWeak(&v25, &location);
  -[WKWebView _loadAndDecodeImage:constrainedToSize:maximumBytesFromNetwork:completionHandler:](v17, "_loadAndDecodeImage:constrainedToSize:maximumBytesFromNetwork:completionHandler:", v16, 10485760, v24, 1024.0, 1024.0);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __59__LPImageFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = [v8 _loggingID];
        v11 = [v6 domain];
        v12[0] = 67109891;
        v12[1] = v10;
        __int16 v13 = 2112;
        v14 = v11;
        __int16 v15 = 2048;
        uint64_t v16 = [v6 code];
        __int16 v17 = 2117;
        id v18 = v6;
        _os_log_error_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_ERROR, "LPImageFetcher<%d>: subresource load completed with error: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v12, 0x26u);
      }
      [v8 _failedWithErrorCode:2 underlyingError:v6];
    }
    else
    {
      [WeakRetained _completedWithImage:v5 error:0];
    }
  }
}

- (void)cancel
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPImageFetcher<%d>: cancelling subresource load explicitly", v4);
}

- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_completionHandler)
  {
    if (a3 != 3)
    {
      id v7 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = [(LPFetcher *)self _loggingID];
        int v10 = [v6 domain];
        v11[0] = 67109891;
        v11[1] = v9;
        __int16 v12 = 2112;
        __int16 v13 = v10;
        __int16 v14 = 2048;
        uint64_t v15 = [v6 code];
        __int16 v16 = 2117;
        id v17 = v6;
        _os_log_error_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_ERROR, "LPImageFetcher<%d>: failed subresource load: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v11, 0x26u);
      }
    }
    v8 = makeLPError(a3, v6);
    [(LPImageFetcher *)self _completedWithImage:0 error:v8];
  }
}

- (void)_completedWithImage:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    unsigned int v9 = (void (**)(void *, LPFetcherErrorResponse *))_Block_copy(completionHandler);
    id v10 = self->_completionHandler;
    self->_id completionHandler = 0;

    if (!v6) {
      goto LABEL_8;
    }
    v11 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[LPImageFetcher _completedWithImage:error:]((uint64_t)v19, [(LPFetcher *)self _loggingID]);
    }

    __int16 v12 = [(LPFetcher *)self responseClass];
    if (!v12) {
      __int16 v12 = (objc_class *)objc_opt_class();
    }
    __int16 v13 = [(objc_class *)v12 responseForFetcher:self withImage:v6];
    if (!v13) {
LABEL_8:
    }
      __int16 v13 = [[LPFetcherErrorResponse alloc] initWithError:v7 fetcher:self];
    [(WKWebView *)self->_webView _close];
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__5;
    v17[4] = __Block_byref_object_dispose__5;
    uint64_t v18 = self->_webView;
    webView = self->_webView;
    self->_webView = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__LPImageFetcher__completedWithImage_error___block_invoke;
    block[3] = &unk_1E5B04EB8;
    block[4] = v17;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v15 = [(LPFetcher *)self _event];
    objc_msgSend(v15, "didCompleteWithErrorCode:", objc_msgSend(v7, "code"));

    v9[2](v9, v13);
    _Block_object_dispose(v17, 8);
  }
}

void __44__LPImageFetcher__completedWithImage_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPImageFetcher<%d>: allocating fallback web view, did not have webViewForProcessSharing", v4);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.2(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPImageFetcher<%d>: starting subresource load", v4);
}

- (void)_completedWithImage:(uint64_t)a1 error:(int)a2 .cold.1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPImageFetcher<%d>: successfully finished load", v4);
}

@end