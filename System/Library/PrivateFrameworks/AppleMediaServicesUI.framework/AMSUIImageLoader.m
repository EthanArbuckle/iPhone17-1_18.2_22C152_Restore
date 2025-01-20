@interface AMSUIImageLoader
+ (id)defaultLoader;
- (AMSUIAssetQueue)fetchQueue;
- (AMSUIImageLoader)init;
- (BOOL)_isURLBundleResource:(id)a3;
- (BOOL)_isURLEngagementContent:(id)a3;
- (BOOL)_isURLSystemImage:(id)a3;
- (NSCache)imageCache;
- (NSURLSession)urlSession;
- (OS_dispatch_queue)workQueue;
- (id)_fetchImageFromCacheWithURL:(id)a3;
- (id)_fetchImageWithURL:(id)a3 searchBundles:(id)a4 atPriority:(int64_t)a5;
- (id)_makeOperationForImageWithURL:(id)a3 searchBundles:(id)a4 error:(id *)a5;
- (id)_makeSystemImageFetchOperationForSystemURL:(id)a3 error:(id *)a4;
- (id)_performLowLatencyOperation:(id)a3;
- (id)fetchImageWithURL:(id)a3;
- (id)fetchImageWithURL:(id)a3 searchBundles:(id)a4;
- (void)_cacheImage:(id)a3 withURL:(id)a4;
- (void)setFetchQueue:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation AMSUIImageLoader

- (AMSUIImageLoader)init
{
  v17.receiver = self;
  v17.super_class = (Class)AMSUIImageLoader;
  v2 = [(AMSUIImageLoader *)&v17 init];
  if (v2)
  {
    v3 = objc_alloc_init(AMSUIAssetQueue);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

    v7 = (void *)MEMORY[0x263F08BF8];
    v8 = objc_msgSend(MEMORY[0x263F08C00], "ams_imageConfiguration");
    uint64_t v9 = [v7 sessionWithConfiguration:v8];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.AppleMediaServicesUI.ImageLoader.workQueue", MEMORY[0x263EF83A8]);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v11;

    v13 = [(AMSUIImageLoader *)v2 fetchQueue];
    [v13 setName:@"com.apple.AppleMediaServicesUI.ImageLoader.fetchQueue"];

    v14 = [(AMSUIImageLoader *)v2 fetchQueue];
    [v14 setMaxConcurrentOperationCount:4];

    v15 = [(AMSUIImageLoader *)v2 fetchQueue];
    [v15 setQualityOfService:9];
  }
  return v2;
}

+ (id)defaultLoader
{
  if (defaultLoader_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&defaultLoader_ams_once_token___COUNTER__, &__block_literal_global_7);
  }
  v2 = (void *)defaultLoader_ams_once_object___COUNTER__;
  return v2;
}

uint64_t __33__AMSUIImageLoader_defaultLoader__block_invoke()
{
  defaultLoader_ams_once_object___COUNTER__ = objc_alloc_init(AMSUIImageLoader);
  return MEMORY[0x270F9A758]();
}

- (id)fetchImageWithURL:(id)a3
{
  return [(AMSUIImageLoader *)self fetchImageWithURL:a3 searchBundles:0];
}

- (id)fetchImageWithURL:(id)a3 searchBundles:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    id v6 = a3;
    v7 = [(AMSUIImageLoader *)self _fetchImageWithURL:v6 searchBundles:a4 atPriority:0];
  }
  else
  {
    v8 = (void *)MEMORY[0x263F086E0];
    id v9 = a3;
    v10 = [v8 mainBundle];
    v13[0] = v10;
    dispatch_queue_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v7 = [(AMSUIImageLoader *)self _fetchImageWithURL:v9 searchBundles:v11 atPriority:0];
  }
  return v7;
}

- (id)_fetchImageWithURL:(id)a3 searchBundles:(id)a4 atPriority:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263F27E10]);
  dispatch_queue_t v11 = [(AMSUIImageLoader *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke;
  block[3] = &unk_2643E3CC0;
  block[4] = self;
  id v19 = v8;
  id v12 = v10;
  id v21 = v9;
  int64_t v22 = a5;
  id v20 = v12;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  v15 = v21;
  id v16 = v12;

  return v16;
}

void __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) _fetchImageFromCacheWithURL:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 48) finishWithResult:v2];
  }
  else
  {
    v3 = [*(id *)(a1 + 32) fetchQueue];
    v4 = [v3 operationWithKey:*(void *)(a1 + 40)];

    if (v4)
    {
      v5 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v5)
      {
        v5 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = objc_opt_class();
        id v8 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v7;
        __int16 v24 = 2114;
        v25 = v8;
        __int16 v26 = 2114;
        v27 = v4;
        _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Reprioritizing operation key %{public}@", buf, 0x20u);
      }
      if ([v4 queuePriority] < *(void *)(a1 + 64)) {
        objc_msgSend(v4, "setQueuePriority:");
      }
      id v9 = *(void **)(a1 + 48);
      id v10 = [v4 operationPromise];
      [v9 finishWithPromise:v10];
    }
    else
    {
      dispatch_queue_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 56);
      id v21 = 0;
      id v14 = [v11 _makeOperationForImageWithURL:v12 searchBundles:v13 error:&v21];
      id v10 = v21;
      if (v10)
      {
        [*(id *)(a1 + 48) finishWithError:v10];
      }
      else
      {
        [v14 setOperationPromise:*(void *)(a1 + 48)];
        if ([v14 isLowLatency])
        {
          v15 = *(void **)(a1 + 48);
          id v16 = [*(id *)(a1 + 32) _performLowLatencyOperation:v14];
          [v15 finishWithPromise:v16];
        }
        else
        {
          [v14 setQueuePriority:*(void *)(a1 + 64)];
          id v16 = [*(id *)(a1 + 32) fetchQueue];
          [v16 addOperation:v14 withKey:*(void *)(a1 + 40)];
        }

        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        objc_super v17 = *(void **)(a1 + 48);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_20;
        v18[3] = &unk_2643E3C98;
        v18[4] = *(void *)(a1 + 32);
        objc_copyWeak(&v20, (id *)buf);
        id v19 = *(id *)(a1 + 40);
        [v17 addSuccessBlock:v18];

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_20(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_2;
  block[3] = &unk_2643E3C70;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = v3;
  id v8 = a1[5];
  id v5 = v3;
  dispatch_barrier_async(v4, block);

  objc_destroyWeak(&v9);
}

void __64__AMSUIImageLoader__fetchImageWithURL_searchBundles_atPriority___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _cacheImage:*(void *)(a1 + 32) withURL:*(void *)(a1 + 40)];
}

- (id)_performLowLatencyOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIImageLoader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x263F27E10]);
  [v4 setOperationPromise:v6];
  [v4 main];

  return v6;
}

- (BOOL)_isURLBundleResource:(id)a3
{
  id v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"resource"];

  return v4;
}

- (BOOL)_isURLEngagementContent:(id)a3
{
  id v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"amsc"];

  return v4;
}

- (id)_makeSystemImageFetchOperationForSystemURL:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(AMSUIImageLoader *)self _isURLSystemImage:v6])
  {
    id v7 = [v6 host];
    id v8 = [v7 stringByRemovingPercentEncoding];

    if (v8)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v6 resolvingAgainstBaseURL:0];
      id v10 = v9;
      if (v9)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        dispatch_queue_t v11 = [v9 queryItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          __int16 v24 = v10;
          uint64_t v14 = *(void *)v26;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              objc_super v17 = [v16 name];
              int v18 = [v17 isEqualToString:@"variableValue"];

              if (v18)
              {
                id v21 = objc_alloc(NSNumber);
                int64_t v22 = [v16 value];
                [v22 doubleValue];
                id v19 = objc_msgSend(v21, "initWithDouble:");

                goto LABEL_17;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          id v19 = 0;
LABEL_17:
          id v10 = v24;
        }
        else
        {
          id v19 = 0;
        }
      }
      else
      {
        id v19 = 0;
      }
      id v20 = [[AMSUISystemImageFetchOperation alloc] initWithSystemImageName:v8 variableValue:v19 compatibleWithTraitCollection:0];
    }
    else if (a4)
    {
      AMSError();
      id v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)_makeOperationForImageWithURL:(id)a3 searchBundles:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(AMSUIImageLoader *)self _isURLEngagementContent:v8])
  {
    id v10 = [[AMSUIContentImageFetchOperation alloc] initWithURL:v8];
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __70__AMSUIImageLoader__makeOperationForImageWithURL_searchBundles_error___block_invoke;
    v22[3] = &unk_2643E3CE8;
    objc_copyWeak(&v24, &location);
    id v23 = v9;
    [(AMSUIContentImageFetchOperation *)v10 setFallbackBlock:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  if ([(AMSUIImageLoader *)self _isURLSystemImage:v8])
  {
    id v10 = [(AMSUIImageLoader *)self _makeSystemImageFetchOperationForSystemURL:v8 error:a5];
    goto LABEL_14;
  }
  if ([(AMSUIImageLoader *)self _isURLBundleResource:v8])
  {
    dispatch_queue_t v11 = [v8 host];
    uint64_t v12 = [v11 stringByRemovingPercentEncoding];

    if (!v12)
    {
      if (a5)
      {
        AMSError();
        id v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = 0;
      }
      goto LABEL_13;
    }
    uint64_t v13 = [[AMSUIBundleImageFetchOperation alloc] initWithImageName:v12 searchBundles:v9 compatibleWithTraitCollection:0];
LABEL_12:
    id v10 = (AMSUIContentImageFetchOperation *)v13;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v14 = [v8 scheme];
  if ([v14 isEqualToString:@"http"])
  {

LABEL_11:
    objc_super v17 = [AMSUINetworkImageFetchOperation alloc];
    uint64_t v12 = [(AMSUIImageLoader *)self urlSession];
    uint64_t v13 = [(AMSUINetworkImageFetchOperation *)v17 initWithURL:v8 URLSession:v12];
    goto LABEL_12;
  }
  v15 = [v8 scheme];
  char v16 = [v15 isEqualToString:@"https"];

  if (v16) {
    goto LABEL_11;
  }
  if (a5)
  {
    id v19 = NSString;
    id v20 = [v8 scheme];
    id v21 = [v19 stringWithFormat:@"%@ scheme is unsupported", v20];
    AMSError();
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v10 = 0;
LABEL_14:

  return v10;
}

id __70__AMSUIImageLoader__makeOperationForImageWithURL_searchBundles_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained _fetchImageWithURL:v4 searchBundles:*(void *)(a1 + 32) atPriority:0];

  return v6;
}

- (void)_cacheImage:(id)a3 withURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSUIImageLoader *)self imageCache];
  [v8 setObject:v7 forKey:v6];
}

- (id)_fetchImageFromCacheWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIImageLoader *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(AMSUIImageLoader *)self imageCache];
  id v7 = [v6 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_isURLSystemImage:(id)a3
{
  id v3 = [a3 scheme];
  char v4 = [v3 isEqualToString:@"systemimage"];

  return v4;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (AMSUIAssetQueue)fetchQueue
{
  return self->_fetchQueue;
}

- (void)setFetchQueue:(id)a3
{
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end