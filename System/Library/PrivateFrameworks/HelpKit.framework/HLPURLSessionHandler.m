@interface HLPURLSessionHandler
+ (id)sharedInstance;
+ (void)setRootViewController:(id)a3;
- (BOOL)URLSessionManagerShouldCoalesceRequest:(id)a3;
- (BOOL)respectCachingForRequest:(id)a3;
- (BOOL)shouldCacheToDiskForSessionTask:(id)a3;
- (BOOL)shouldDisallowOffsiteRedirects;
- (BOOL)shouldIgnoreInMemoryCaching;
- (HLPURLSessionHandler)init;
- (NSIndexSet)excludeCachingDataTypes;
- (id)URLSessionManagerSessionConfiguration:(id)a3;
- (id)URLSessionManagerSessionOperationQueue:(id)a3;
- (id)cacheControllerForDataType:(int64_t)a3;
- (id)processJSONFormattedDataForCDSError:(id)a3;
- (void)URLSessionManagerDidReceiveChallenge:(id)a3 completionHandler:(id)a4;
- (void)URLSessionManagerRequestCompleted:(id)a3 sessionTask:(id)a4;
- (void)URLSessionManagerRequestResumed:(id)a3 sessionTask:(id)a4;
- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4;
- (void)sessionTask:(id)a3 didFinishDownloadingToURL:(id)a4;
- (void)sessionTask:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)sessionTask:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5;
- (void)sessionTask:(id)a3 willCacheResponse:(id)a4 completionHandler:(id)a5;
- (void)sessionTask:(id)a3 willPerformHTTPRedirection:(id)a4 newRequest:(id)a5 completionHandler:(id)a6;
- (void)setExcludeCachingDataTypes:(id)a3;
- (void)setShouldDisallowOffsiteRedirects:(BOOL)a3;
- (void)setShouldIgnoreInMemoryCaching:(BOOL)a3;
@end

@implementation HLPURLSessionHandler

+ (void)setRootViewController:(id)a3
{
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_1 != -1) {
    dispatch_once(&sharedInstance_predicate_1, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_gHLPURLSessionHandler;
  return v2;
}

uint64_t __38__HLPURLSessionHandler_sharedInstance__block_invoke()
{
  sharedInstance_gHLPURLSessionHandler = objc_alloc_init(HLPURLSessionHandler);
  return MEMORY[0x270F9A758]();
}

- (HLPURLSessionHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)HLPURLSessionHandler;
  v2 = [(HLPURLSessionHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088D0] indexSetWithIndex:1];
    excludeCachingDataTypes = v2->_excludeCachingDataTypes;
    v2->_excludeCachingDataTypes = (NSIndexSet *)v3;
  }
  return v2;
}

- (id)cacheControllerForDataType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(__objc2_class *)*off_2645795F8[a3 - 1] sharedInstance];
  }
  return v5;
}

- (id)URLSessionManagerSessionOperationQueue:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A48]);
  [v3 setMaxConcurrentOperationCount:4];
  return v3;
}

- (id)URLSessionManagerSessionConfiguration:(id)a3
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F08B98]) initWithMemoryCapacity:0 diskCapacity:26214400 diskPath:@"com.apple.helpkit"];
  [MEMORY[0x263F08B98] setSharedURLCache:v3];
  uint64_t v4 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v4 setURLCache:v3];

  return v4;
}

- (BOOL)URLSessionManagerShouldCoalesceRequest:(id)a3
{
  return 0;
}

- (void)URLSessionManagerRequestResumed:(id)a3 sessionTask:(id)a4
{
}

- (void)URLSessionManagerRequestCompleted:(id)a3 sessionTask:(id)a4
{
  if (gNetworkActivityIndicatorCount >= 1) {
    --gNetworkActivityIndicatorCount;
  }
}

- (void)sessionTask:(id)a3 willCacheResponse:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  v8 = (void (**)(id, void))a5;
  if (-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", [a3 dataType])) {
    id v9 = v10;
  }
  else {
    id v9 = 0;
  }
  ((void (**)(id, id))v8)[2](v8, v9);
}

- (void)sessionTask:(id)a3 willPerformHTTPRedirection:(id)a4 newRequest:(id)a5 completionHandler:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (self->_shouldDisallowOffsiteRedirects
    && ([v12 URL],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 host],
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v15 hasSuffix:@".apple.com"],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    v18 = HLPLogForCategory(1uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v12 URL];
      v20 = [v19 absoluteString];
      int v23 = 138412290;
      v24 = v20;
      _os_log_impl(&dword_220BD8000, v18, OS_LOG_TYPE_DEFAULT, "Rejecting off-site redirect: %@", (uint8_t *)&v23, 0xCu);
    }
    v21 = [NSURL URLWithString:@"about:blank"];
    v22 = [MEMORY[0x263F08BD8] requestWithURL:v21];
    v13[2](v13, v22);
  }
  else
  {
    v17 = HLPLogForCategory(1uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[HLPURLSessionHandler sessionTask:willPerformHTTPRedirection:newRequest:completionHandler:](v11, v12, v17);
    }

    v13[2](v13, v12);
  }
}

- (BOOL)shouldCacheToDiskForSessionTask:(id)a3
{
  return !-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", [a3 dataType]);
}

- (id)processJSONFormattedDataForCDSError:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"errorDetail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 objectForKey:@"errorCode"];
      uint64_t v6 = [v5 integerValue];

      uint64_t v7 = [v4 objectForKey:@"errorMessage"];
      v8 = (void *)v7;
      id v9 = 0;
      if (v6 >= 1 && v7)
      {
        id v9 = [MEMORY[0x263F087E8] errorWithDomain:v7 code:v6 userInfo:0];
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)sessionTask:(id)a3 didFinishDownloadingToURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dataType];
  id v9 = [(HLPURLSessionHandler *)self cacheControllerForDataType:v8];
  id v10 = [v6 identifier];
  id v11 = [v9 dataCacheForIdentifier:v10];
  uint64_t v12 = [v6 downloadTaskTotalBytes];
  if (!v9)
  {
    v19 = (void *)MEMORY[0x263EFF8F8];
    v20 = [v7 path];
    v21 = [v19 dataWithContentsOfFile:v20];

    goto LABEL_23;
  }
  uint64_t v13 = v12;
  v29 = v11;
  v14 = [v6 response];
  uint64_t v15 = [v14 statusCode];

  id v16 = v7;
  id v28 = v7;
  if (v8 != 1)
  {
    v17 = 0;
    v18 = 0;
LABEL_7:
    if (v15 != 200)
    {
      v18 = [MEMORY[0x263F087E8] errorWithDomain:@"Unknown error" code:v15 userInfo:0];
    }
    goto LABEL_9;
  }
  v17 = [v9 formattedDataWithFileURL:v16];
  v18 = [(HLPURLSessionHandler *)self processJSONFormattedDataForCDSError:v17];
  if (!v18) {
    goto LABEL_7;
  }
LABEL_9:
  if (v18)
  {
    [v6 setDataError:v18];
    v21 = v17;
    v22 = v16;
    id v11 = v29;
  }
  else
  {
    uint64_t v27 = v13;
    if ([(HLPURLSessionHandler *)self shouldCacheToDiskForSessionTask:v6])
    {
      uint64_t v23 = [v6 lastModified];
      uint64_t v24 = v13;
      uint64_t v25 = (void *)v23;
      v22 = [v9 saveFileURL:v16 identifier:v10 fileSize:v24 lastModified:v23 dataCache:v29];

      v26 = HLPLogForCategory(1uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        -[HLPURLSessionHandler sessionTask:didFinishDownloadingToURL:]((uint64_t)v22, v26);
      }
    }
    else
    {
      v22 = v16;
    }
    id v11 = v29;
    if (v8 == 1)
    {
      v21 = v17;
    }
    else
    {
      v21 = [v9 formattedDataWithFileURL:v22];

      if (v8 == 4 && !self->_shouldIgnoreInMemoryCaching)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 addInMemoryCacheForImage:v21 identifier:v10 cost:v27];
        }
      }
    }
  }

  id v7 = v28;
LABEL_23:
  [v6 setFormattedData:v21];
}

- (void)sessionTask:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, uint64_t))a5;
  uint64_t v11 = [v8 dataType];
  BOOL v12 = [(HLPURLSessionHandler *)self shouldCacheToDiskForSessionTask:v8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    [v8 setResponse:v13];
    v14 = [v8 task];
    uint64_t v15 = [v14 currentRequest];
    BOOL v16 = [(HLPURLSessionHandler *)self respectCachingForRequest:v15];

    if (v12 && v16)
    {
      v17 = [v13 allHeaderFields];
      v18 = [v17 objectForKeyedSubscript:@"Last-Modified"];

      [v8 setLastModified:v18];
      if (v18 && ![(NSIndexSet *)self->_excludeCachingDataTypes containsIndex:v11])
      {
        v19 = [(HLPURLSessionHandler *)self cacheControllerForDataType:v11];
        v20 = [v8 identifier];
        v21 = [v19 dataCacheForIdentifier:v20];

        if (v21)
        {
          v22 = [v21 lastModified];
          int v23 = [v22 isEqualToString:v18];

          if (v23)
          {
            uint64_t v24 = HLPLogForCategory(2uLL);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[HLPURLSessionHandler sessionTask:didReceiveResponse:completionHandler:](v21, v24);
            }

            uint64_t v25 = [v19 cacheFileURLForDataCache:v21];
            v26 = [v19 formattedDataWithFileURL:v25];
            [v8 setFormattedData:v26];

            uint64_t v27 = 1;
            [v8 setIsCacheData:1];
            v33[0] = MEMORY[0x263EF8330];
            v33[1] = 3221225472;
            v33[2] = __73__HLPURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke;
            v33[3] = &unk_264578F50;
            id v34 = v21;
            id v35 = v19;
            id v28 = v19;
            id v29 = v21;
            dispatch_async(MEMORY[0x263EF83A0], v33);

LABEL_19:
            uint64_t v30 = 0;
            goto LABEL_14;
          }
        }
      }
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 4
        || ([v13 allHeaderFields],
            uint64_t v31 = objc_claimAutoreleasedReturnValue(),
            [(id)v31 objectForKeyedSubscript:@"Content-Type"],
            v32 = objc_claimAutoreleasedReturnValue(),
            (id)v31,
            LOBYTE(v31) = [v32 containsString:@"text/html"],
            v32,
            (v31 & 1) == 0))
      {

        uint64_t v27 = 0;
        uint64_t v30 = 2;
        goto LABEL_14;
      }
      uint64_t v27 = 0;
      goto LABEL_19;
    }
  }
  uint64_t v27 = 0;
  if (v12) {
    uint64_t v30 = 2;
  }
  else {
    uint64_t v30 = 1;
  }
LABEL_14:
  v10[2](v10, v30, v27);
}

uint64_t __73__HLPURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF910] date];
  [*(id *)(a1 + 32) setUpdatedDate:v2];

  id v3 = *(void **)(a1 + 40);
  return [v3 updateCache];
}

- (BOOL)respectCachingForRequest:(id)a3
{
  uint64_t v3 = [a3 cachePolicy];
  return v3 != 1 && v3 != 4;
}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 task];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 response];
    uint64_t v10 = [v9 statusCode];

    uint64_t v11 = [v8 response];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v13 = [v8 response];
      v14 = [v13 allHeaderFields];
      uint64_t v15 = [v14 objectForKeyedSubscript:@"Last-Modified"];
      [v6 setLastModified:v15];
    }
    else
    {
      id v13 = 0;
    }
    BOOL v16 = [v6 dataTaskData];
    v17 = [v6 task];
    v18 = [v17 originalRequest];

    BOOL v19 = [(HLPURLSessionHandler *)self respectCachingForRequest:v18];
    if (v6 && v19 && [v13 statusCode] != 404)
    {
      BOOL v20 = [v13 statusCode] == 200 && v7 == 0;
      if (!v20 && v18)
      {
        v43 = self;
        v21 = v16;
        v22 = [MEMORY[0x263F08B98] sharedURLCache];
        int v23 = [v22 cachedResponseForRequest:v18];

        uint64_t v24 = [v23 response];
        objc_opt_class();
        char v25 = objc_opt_isKindOfClass();

        if (v25)
        {
          v26 = [v23 response];

          if ([v26 statusCode] == 200)
          {
            uint64_t v27 = [v23 data];

            if (v27)
            {
              uint64_t v10 = [v26 statusCode];
              id v28 = HLPLogForCategory(1uLL);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = [v18 URL];
                *(_DWORD *)buf = 138412290;
                v49 = v29;
                _os_log_impl(&dword_220BD8000, v28, OS_LOG_TYPE_DEFAULT, "Using cache data for request: %@", buf, 0xCu);
              }
              uint64_t v30 = (void *)MEMORY[0x263EFF990];
              uint64_t v31 = [v23 data];
              uint64_t v32 = [v30 dataWithData:v31];

              [v6 setDataTaskData:v32];
              [v6 setIsCacheData:v32 != 0];
              v21 = (void *)v32;
            }
          }
        }
        else
        {
          v26 = v13;
        }

        id v13 = v26;
        BOOL v16 = v21;
        self = v43;
      }
    }
    if (v10 == 200)
    {
      v33 = 0;
      if (!v6) {
        goto LABEL_37;
      }
    }
    else
    {
      v33 = [MEMORY[0x263F087E8] errorWithDomain:@"Unknown error" code:v10 userInfo:0];
      if (!v6)
      {
LABEL_37:
        [v6 setDataError:v33];

        goto LABEL_38;
      }
    }
    if ([v16 length])
    {
      v44 = v16;
      uint64_t v34 = [v6 dataType];
      id v35 = [v6 dataError];

      if (!v35 || v34 == 1)
      {
        uint64_t v36 = [v6 dataType];
        v42 = [(HLPURLSessionHandler *)self cacheControllerForDataType:v36];
        v37 = [v42 formattedDataWithData:v44];
        if (v34 == 1)
        {
          uint64_t v38 = [(HLPURLSessionHandler *)self processJSONFormattedDataForCDSError:v37];

          v33 = (void *)v38;
        }
        if (v36 == 4 && !self->_shouldIgnoreInMemoryCaching)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v39 = [v6 identifier];
            objc_msgSend(v42, "addInMemoryCacheForImage:identifier:cost:", v37, v39, objc_msgSend(v44, "length"));
          }
        }

        if (v37)
        {
          [v6 setFormattedData:v37];
        }
      }
      BOOL v16 = v44;
    }
    goto LABEL_37;
  }
LABEL_38:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__HLPURLSessionHandler_sessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_264578F50;
  id v46 = v7;
  id v47 = v8;
  id v40 = v8;
  id v41 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __57__HLPURLSessionHandler_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 code] != -999)
    {
      uint64_t v3 = HLPLogForCategory(1uLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = [*(id *)(a1 + 40) currentRequest];
        v5 = [v4 URL];
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v10 = v5;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_impl(&dword_220BD8000, v3, OS_LOG_TYPE_DEFAULT, "URLSession %@ failed with error, %@", buf, 0x16u);
      }
      id v7 = +[HLPReachabilityManager defaultManager];
      [v7 startNotifier];
    }
  }
  else
  {
    id v8 = +[HLPReachabilityManager defaultManager];
    [v8 stopNotifier];
  }
}

- (void)URLSessionManagerDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, uint64_t, void))a4;
  if (+[HLPCommonDefines isInternalBuild]
    && [v9 previousFailureCount] < 4)
  {
    uint64_t v6 = [v9 proposedCredential];
    if (v6)
    {
      uint64_t v7 = 0;
      id v8 = v6;
    }
    else
    {
      uint64_t v7 = 1;
      id v8 = 0;
    }
    ((void (**)(id, uint64_t, void *))v5)[2](v5, v7, v8);
  }
  else
  {
    v5[2](v5, 3, 0);
  }
}

- (void)sessionTask:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_2645795D8;
  id v15 = v7;
  id v16 = v9;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke(id *a1)
{
  if (+[HLPCommonDefines isInternalBuild])
  {
    v2 = [a1[4] protectionSpace];
    uint64_t v3 = [v2 authenticationMethod];

    if (([v3 isEqualToString:*MEMORY[0x263F08530]] & 1) == 0
      && ![v3 isEqualToString:*MEMORY[0x263F08540]])
    {
      goto LABEL_15;
    }
    if ([a1[4] previousFailureCount] > 3)
    {
      id v10 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Authentication Failed" message:@"Please try again later." preferredStyle:1];
      id v11 = (void *)MEMORY[0x263F1C3F0];
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_6;
      char v25 = &unk_264579588;
      id v26 = a1[6];
      id v12 = [v11 actionWithTitle:@"OK" style:1 handler:&v22];
      objc_msgSend(v10, "addAction:", v12, v22, v23, v24, v25);

      uint64_t v13 = v26;
    }
    else
    {
      uint64_t v4 = [a1[4] proposedCredential];
      if (v4)
      {
        v5 = (void *)v4;
        uint64_t v6 = [a1[4] previousFailureCount];

        if (v6 <= 1)
        {
          id v7 = (void (**)(id, void, void *))a1[6];
          id v8 = [a1[4] proposedCredential];
          v7[2](v7, 0, v8);

LABEL_15:
          return;
        }
      }
      id v14 = [a1[5] task];
      id v15 = [v14 currentRequest];
      id v16 = [v15 URL];
      uint64_t v13 = [v16 host];

      v17 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:@"Authentication Required" message:v13 preferredStyle:1];
      [v17 addTextFieldWithConfigurationHandler:&__block_literal_global_62];
      [v17 addTextFieldWithConfigurationHandler:&__block_literal_global_67];
      v18 = (void *)MEMORY[0x263F1C3F0];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_4;
      v30[3] = &unk_264579588;
      id v31 = a1[6];
      BOOL v19 = [v18 actionWithTitle:@"Cancel" style:1 handler:v30];
      [v17 addAction:v19];

      BOOL v20 = (void *)MEMORY[0x263F1C3F0];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_5;
      v27[3] = &unk_2645795B0;
      id v10 = v17;
      id v28 = v10;
      id v29 = a1[6];
      v21 = [v20 actionWithTitle:@"Login In" style:0 handler:v27];
      [v10 addAction:v21];
    }
    if (v10)
    {
      [(id)gHLPRootViewController presentViewController:v10 animated:1 completion:0];
    }
    goto LABEL_15;
  }
  id v9 = (void (*)(void))*((void *)a1[6] + 2);
  v9();
}

uint64_t __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setPlaceholder:@"Name"];
}

void __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPlaceholder:@"Password"];
  [v2 setSecureTextEntry:1];
}

uint64_t __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textFields];
  id v9 = [v2 firstObject];

  uint64_t v3 = [*(id *)(a1 + 32) textFields];
  uint64_t v4 = [v3 lastObject];

  id v5 = objc_alloc(MEMORY[0x263F08BB8]);
  uint64_t v6 = [v9 text];
  id v7 = [v4 text];
  id v8 = (void *)[v5 initWithUser:v6 password:v7 persistence:2];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __74__HLPURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldIgnoreInMemoryCaching
{
  return self->_shouldIgnoreInMemoryCaching;
}

- (void)setShouldIgnoreInMemoryCaching:(BOOL)a3
{
  self->_shouldIgnoreInMemoryCaching = a3;
}

- (BOOL)shouldDisallowOffsiteRedirects
{
  return self->_shouldDisallowOffsiteRedirects;
}

- (void)setShouldDisallowOffsiteRedirects:(BOOL)a3
{
  self->_shouldDisallowOffsiteRedirects = a3;
}

- (NSIndexSet)excludeCachingDataTypes
{
  return self->_excludeCachingDataTypes;
}

- (void)setExcludeCachingDataTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)sessionTask:(NSObject *)a3 willPerformHTTPRedirection:newRequest:completionHandler:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = [a1 URL];
  uint64_t v6 = [v5 absoluteURL];
  id v7 = [a2 URL];
  id v8 = [v7 absoluteString];
  int v9 = 138412546;
  id v10 = v6;
  __int16 v11 = 2112;
  id v12 = v8;
  _os_log_debug_impl(&dword_220BD8000, a3, OS_LOG_TYPE_DEBUG, "willPerform HTTP Redirect. Original: %@. Redirected: %@", (uint8_t *)&v9, 0x16u);
}

- (void)sessionTask:(uint64_t)a1 didFinishDownloadingToURL:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = @"Fail to save ";
  if (a1) {
    id v2 = @"Saved";
  }
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_220BD8000, a2, OS_LOG_TYPE_DEBUG, "%@ %@. ", (uint8_t *)&v3, 0x16u);
}

- (void)sessionTask:(void *)a1 didReceiveResponse:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = [a1 identifier];
  int v4 = 138412290;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_220BD8000, a2, OS_LOG_TYPE_DEBUG, "Data cache Last-Modified did not change, cancel request and use cache %@", (uint8_t *)&v4, 0xCu);
}

@end