@interface LPRawURLContentsFetcher
- (NSURL)URL;
- (void)_completedWithData:(id)a3 MIMEType:(id)a4 error:(id)a5;
- (void)_failedWithErrorCode:(int64_t)a3 underlyingError:(id)a4;
- (void)cancel;
- (void)dataTask:(id)a3 didCompleteWithError:(id)a4;
- (void)dataTask:(id)a3 didReceiveData:(id)a4;
- (void)dataTask:(id)a3 didReceiveResponse:(id)a4 decisionHandler:(id)a5;
- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setURL:(id)a3;
@end

@implementation LPRawURLContentsFetcher

- (void)fetchWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ([v6 fetchIsNotUserInitiated])
  {
    v8 = [LPFetcherErrorResponse alloc];
    v9 = makeLPError(5, 0);
    v10 = [(LPFetcherErrorResponse *)v8 initWithError:v9 fetcher:self];
    v7[2](v7, v10);
  }
  else
  {
    v11 = [v6 rootEvent];
    v12 = [v11 childWithType:2 subtitle:0];
    [(LPFetcher *)self set_event:v12];

    URL = self->_URL;
    v14 = [(LPFetcher *)self _event];
    [v14 setURL:URL];

    v15 = _Block_copy(v7);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v15;

    v17 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[LPRawURLContentsFetcher fetchWithConfiguration:completionHandler:]((uint64_t)v31, [(LPFetcher *)self _loggingID]);
    }

    v18 = [(LPRawURLContentsFetcher *)self URL];
    v19 = objc_msgSend(v18, "_lp_requestWithAttribution:", objc_msgSend(v6, "loadingIsNonAppInitiated"));

    v20 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[LPRawURLContentsFetcher fetchWithConfiguration:completionHandler:]((uint64_t)v30, [(LPFetcher *)self _loggingID]);
    }

    v21 = [v6 webViewForProcessSharing];
    if (!v21)
    {
      v22 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[LPRawURLContentsFetcher fetchWithConfiguration:completionHandler:]((uint64_t)v29, [(LPFetcher *)self _loggingID]);
      }

      id v23 = objc_alloc(MEMORY[0x1E4F466F0]);
      id v24 = +[LPMetadataProvider _copyDefaultWebViewConfiguration];
      v25 = (WKWebView *)objc_msgSend(v23, "initWithFrame:configuration:", v24, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      webView = self->_webView;
      self->_webView = v25;

      v27 = +[LPMetadataProvider _defaultUserAgent];
      [(WKWebView *)self->_webView setCustomUserAgent:v27];

      v21 = self->_webView;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __68__LPRawURLContentsFetcher_fetchWithConfiguration_completionHandler___block_invoke;
    v28[3] = &unk_1E5B06898;
    v28[4] = self;
    [(WKWebView *)v21 _dataTaskWithRequest:v19 runAtForegroundPriority:1 completionHandler:v28];
  }
}

uint64_t __68__LPRawURLContentsFetcher_fetchWithConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

- (void)dataTask:(id)a3 didReceiveResponse:(id)a4 decisionHandler:(id)a5
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = (void (**)(id, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    if (objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(v9, "statusCode")))
    {
      v10 = (id)LPLogChannelFetching();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[LPRawURLContentsFetcher dataTask:didReceiveResponse:decisionHandler:]((uint64_t)v22, -[LPFetcher _loggingID](self, "_loggingID"), [v9 statusCode]);
      }

      v8[2](v8, 0);
      [(LPRawURLContentsFetcher *)self _failedWithErrorCode:2 underlyingError:0];

      goto LABEL_19;
    }
  }
  Class v11 = [(LPFetcher *)self responseClass];
  v12 = [v7 MIMEType];
  LOBYTE(v11) = [(objc_class *)v11 isValidMIMEType:v12];

  if (v11)
  {
    uint64_t v13 = [v7 expectedContentLength];
    if (v13 == -1) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v13;
    }
    if (v14 <= 10485760)
    {
      v18 = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:v14];
      data = self->_data;
      self->_data = v18;

      v20 = [v7 MIMEType];
      MIMEType = self->_MIMEType;
      self->_MIMEType = v20;

      v8[2](v8, 1);
      goto LABEL_19;
    }
    v15 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[LPRawURLContentsFetcher dataTask:didReceiveResponse:decisionHandler:]((uint64_t)v22, -[LPFetcher _loggingID](self, "_loggingID"), [v7 expectedContentLength]);
    }
  }
  else
  {
    v15 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = [(LPFetcher *)self _loggingID];
      v17 = [v7 MIMEType];
      -[LPRawURLContentsFetcher dataTask:didReceiveResponse:decisionHandler:](v17, (uint64_t)v22, v16, v15);
    }
  }

  v8[2](v8, 0);
  [(LPRawURLContentsFetcher *)self _failedWithErrorCode:2 underlyingError:0];
LABEL_19:
}

- (void)dataTask:(id)a3 didReceiveData:(id)a4
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  NSUInteger v8 = [(NSMutableData *)self->_data length];
  unint64_t v9 = [v7 length] + v8;
  if (v9 <= 0xA00000)
  {
    [(NSMutableData *)self->_data appendData:v7];
  }
  else
  {
    v10 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[LPRawURLContentsFetcher dataTask:didReceiveData:]((uint64_t)v11, [(LPFetcher *)self _loggingID], v9);
    }

    [v6 cancel];
    [(LPRawURLContentsFetcher *)self _failedWithErrorCode:2 underlyingError:0];
  }
}

- (void)dataTask:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    NSUInteger v8 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = [(LPFetcher *)self _loggingID];
      v10 = [v7 domain];
      v11[0] = 67109891;
      v11[1] = v9;
      __int16 v12 = 2112;
      uint64_t v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v7 code];
      __int16 v16 = 2117;
      id v17 = v7;
      _os_log_error_impl(&dword_1A35DC000, v8, OS_LOG_TYPE_ERROR, "LPRawURLContentsFetcher<%d>: subresource load completed with error: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v11, 0x26u);
    }
    [(LPRawURLContentsFetcher *)self _failedWithErrorCode:2 underlyingError:v7];
  }
  else
  {
    [(LPRawURLContentsFetcher *)self _completedWithData:self->_data MIMEType:self->_MIMEType error:0];
  }
}

- (void)cancel
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPRawURLContentsFetcher<%d>: cancelling subresource load explicitly", v4);
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
        v10 = [v6 domain];
        v11[0] = 67109891;
        v11[1] = v9;
        __int16 v12 = 2112;
        uint64_t v13 = v10;
        __int16 v14 = 2048;
        uint64_t v15 = [v6 code];
        __int16 v16 = 2117;
        id v17 = v6;
        _os_log_error_impl(&dword_1A35DC000, v7, OS_LOG_TYPE_ERROR, "LPRawURLContentsFetcher<%d>: failed subresource load: Domain=%@ Code=%ld Error=%{sensitive}@", (uint8_t *)v11, 0x26u);
      }
    }
    NSUInteger v8 = makeLPError(a3, v6);
    [(LPRawURLContentsFetcher *)self _completedWithData:0 MIMEType:0 error:v8];
  }
}

- (void)_completedWithData:(id)a3 MIMEType:(id)a4 error:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    __int16 v12 = (void (**)(void *, LPFetcherErrorResponse *))_Block_copy(completionHandler);
    id v13 = self->_completionHandler;
    self->_id completionHandler = 0;

    if (!v8) {
      goto LABEL_6;
    }
    __int16 v14 = (id)LPLogChannelFetching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[LPRawURLContentsFetcher _completedWithData:MIMEType:error:]((uint64_t)v21, [(LPFetcher *)self _loggingID]);
    }

    uint64_t v15 = [(objc_class *)[(LPFetcher *)self responseClass] responseForFetcher:self withData:v8 MIMEType:v9];
    if (!v15) {
LABEL_6:
    }
      uint64_t v15 = [[LPFetcherErrorResponse alloc] initWithError:v10 fetcher:self];
    [(WKWebView *)self->_webView _close];
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__8;
    v19[4] = __Block_byref_object_dispose__8;
    v20 = self->_webView;
    webView = self->_webView;
    self->_webView = 0;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__LPRawURLContentsFetcher__completedWithData_MIMEType_error___block_invoke;
    block[3] = &unk_1E5B04EB8;
    block[4] = v19;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v17 = [(LPFetcher *)self _event];
    objc_msgSend(v17, "didCompleteWithErrorCode:", objc_msgSend(v10, "code"));

    v12[2](v12, v15);
    _Block_object_dispose(v19, 8);
  }
}

void __61__LPRawURLContentsFetcher__completedWithData_MIMEType_error___block_invoke(uint64_t a1)
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
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_webView, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPRawURLContentsFetcher<%d>: allocating fallback web view, did not have webViewForProcessSharing", v4);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.2(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPRawURLContentsFetcher<%d>: using WKDataTask", v4);
}

- (void)fetchWithConfiguration:(uint64_t)a1 completionHandler:(int)a2 .cold.3(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPRawURLContentsFetcher<%d>: starting subresource load", v4);
}

- (void)dataTask:(uint64_t)a1 didReceiveResponse:(int)a2 decisionHandler:(uint64_t)a3 .cold.1(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_2(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2_1(&dword_1A35DC000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to error status code: %ld", v3, v4);
}

- (void)dataTask:(uint64_t)a1 didReceiveResponse:(int)a2 decisionHandler:(uint64_t)a3 .cold.2(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_2(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2_1(&dword_1A35DC000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to excessive size: %lld", v3, v4);
}

- (void)dataTask:(int)a3 didReceiveResponse:(NSObject *)a4 decisionHandler:.cold.3(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(void *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_2_1(&dword_1A35DC000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to unknown MIME type: \"%@\"", (uint8_t *)a2, a4);
}

- (void)dataTask:(uint64_t)a3 didReceiveData:.cold.1(uint64_t a1, int a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_2(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_2_1(&dword_1A35DC000, "LPRawURLContentsFetcher<%d>: cancelling subresource load due to excessive size (during load): %lu", v3, v4);
}

- (void)_completedWithData:(uint64_t)a1 MIMEType:(int)a2 error:.cold.1(uint64_t a1, int a2)
{
  OUTLINED_FUNCTION_0(a1, a2, 1.5047e-36);
  OUTLINED_FUNCTION_1(&dword_1A35DC000, v2, v3, "LPRawURLContentsFetcher<%d>: successfully finished subresource load", v4);
}

@end