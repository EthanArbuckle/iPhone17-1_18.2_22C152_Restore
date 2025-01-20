@interface GEOMapDataSubscriptionOfflineDownloader
+ (NSString)loggingDescription;
- (GEOMapDataSubscription)subscription;
- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate;
- (GEOMapDataSubscriptionOfflineDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 manifestManager:(id)a5 requestOptions:(unint64_t)a6 auditToken:(id)a7 keySelectors:(id)a8 requiredLayers:(id)a9 delegate:(id)a10 delegateQueue:(id)a11 log:(id)a12 logPrefix:(id)a13;
- (NSProgress)progress;
- (void)_addMoreRequestsToListIfNeeded:(void *)a3 completionHandler:;
- (void)_cancelInProgressRequests;
- (void)_finishWithError:(uint64_t)a1;
- (void)_requestNextBatch;
- (void)_startRequests:(uint64_t)a1;
- (void)cancel;
- (void)offlineRequester:(id)a3 didFailWithError:(id)a4;
- (void)offlineRequester:(id)a3 didFinishWithData:(id)a4 withETag:(id)a5 containingDataKeys:(id)a6;
- (void)pause;
- (void)resume;
@end

@implementation GEOMapDataSubscriptionOfflineDownloader

+ (NSString)loggingDescription
{
  return (NSString *)@"offline data";
}

- (GEOMapDataSubscriptionOfflineDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 manifestManager:(id)a5 requestOptions:(unint64_t)a6 auditToken:(id)a7 keySelectors:(id)a8 requiredLayers:(id)a9 delegate:(id)a10 delegateQueue:(id)a11 log:(id)a12 logPrefix:(id)a13
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v49 = a4;
  id v18 = a5;
  id v45 = a7;
  id v50 = a7;
  id v19 = a8;
  id v53 = a9;
  id v20 = a10;
  id v48 = a11;
  id v52 = a12;
  v21 = v18;
  id v22 = a13;
  v54.receiver = self;
  v54.super_class = (Class)GEOMapDataSubscriptionOfflineDownloader;
  v23 = [(GEOMapDataSubscriptionOfflineDownloader *)&v54 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_subscription, a3);
    objc_storeStrong((id *)&v24->_diskCache, a4);
    if (v21)
    {
      v25 = v21;
    }
    else
    {
      v25 = +[GEOResourceManifestManager modernManager];
    }
    manifestManager = v24->_manifestManager;
    v24->_manifestManager = v25;

    v24->_requestOptions = a6;
    objc_storeStrong((id *)&v24->_auditToken, v45);
    uint64_t v27 = [v53 copy];
    requiredLayers = v24->_requiredLayers;
    v24->_requiredLayers = (NSArray *)v27;

    dispatch_group_t v29 = dispatch_group_create();
    preparationGroup = v24->_preparationGroup;
    v24->_preparationGroup = (OS_dispatch_group *)v29;

    v24->_prepared.lock._os_unfair_lock_opaque = 0;
    v24->_prepared.didRun = 0;
    uint64_t v31 = [v22 stringByAppendingString:@" [Offline]"];
    logPrefix = v24->_logPrefix;
    v24->_logPrefix = (NSString *)v31;

    if (v19)
    {
      uint64_t v33 = [v19 copy];
    }
    else
    {
      v34 = [[GEOMapDataSubscriptionOfflineDataKeySelector alloc] initWithSubscription:v51 requestOptions:a6 auditToken:v50 requiredLayers:v53 log:v52 logPrefix:v24->_logPrefix];
      offlineKeySelector = v24->_offlineKeySelector;
      v24->_offlineKeySelector = v34;

      v55[0] = v24->_offlineKeySelector;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    }
    keySelectors = v24->_keySelectors;
    v24->_keySelectors = (NSArray *)v33;

    id v37 = v20;
    objc_storeWeak((id *)&v24->_delegate, v20);
    objc_storeStrong((id *)&v24->_delegateQueue, a11);
    objc_storeStrong((id *)&v24->_log, a12);
    uint64_t v38 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    progress = v24->_progress;
    v24->_progress = (NSProgress *)v38;

    uint64_t v40 = geo_dispatch_queue_create_with_qos();
    workQueue = v24->_workQueue;
    v24->_workQueue = (OS_dispatch_queue *)v40;

    v24->_finished.lock._os_unfair_lock_opaque = 0;
    v24->_finished.didRun = 0;
    uint64_t UInteger = 1;
    v24->_paused = 1;
    if ((unint64_t)GEOConfigGetUInteger(GeoOfflineConfig_BatchParallelDownloads, (uint64_t)off_1E9115928) >= 2) {
      uint64_t UInteger = GEOConfigGetUInteger(GeoOfflineConfig_BatchParallelDownloads, (uint64_t)off_1E9115928);
    }
    v24->_numberOfParallelRequests = UInteger;
    v43 = v24;
    id v20 = v37;
  }

  return v24;
}

- (NSProgress)progress
{
  return self->_progress;
}

void __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v14 = a4;
  if (v14)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void *)(v8 + 40);
    v9 = (id *)(v8 + 40);
    if (!v10) {
      objc_storeStrong(v9, a4);
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a2;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  if (a3 == -1)
  {
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v12 = *(void *)(v11 + 24);
    if (v12 == -1) {
      goto LABEL_9;
    }
    uint64_t v13 = v12 + a3;
  }
  *(void *)(v11 + 24) = v13;
LABEL_9:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke_2(void *a1)
{
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v2 = a1[4];
    if (*(void *)(*(void *)(a1[7] + 8) + 24) == -1)
    {
      *(void *)(v2 + 136) = 0;
      uint64_t v5 = a1[8];
    }
    else
    {
      *(void *)(v2 + 136) = 1;
      [*(id *)(a1[4] + 128) setKind:*MEMORY[0x1E4F28898]];
      [*(id *)(a1[4] + 128) setFileOperationKind:*MEMORY[0x1E4F28858]];
      v3 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[8] + 8) + 24)];
      [*(id *)(a1[4] + 128) setFileTotalCount:v3];

      v4 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[7] + 8) + 24)];
      [*(id *)(a1[4] + 128) setByteTotalCount:v4];

      [*(id *)(a1[4] + 128) setFileCompletedCount:&unk_1ED73D5B8];
      [*(id *)(a1[4] + 128) setByteCompletedCount:&unk_1ED73D5B8];
      uint64_t v5 = a1[7];
    }
    [*(id *)(a1[4] + 128) setTotalUnitCount:*(void *)(*(void *)(v5 + 8) + 24)];
  }
  v6 = *(uint64_t (**)(void))(a1[5] + 16);

  return v6();
}

void __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(v3 + 48) layerVersions];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CC08];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_2;
  v8[3] = &unk_1E53DA960;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  [WeakRetained offlineDownloader:v3 willUseDataVersions:v6 completionHandler:v8];
}

void __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 80);
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(v3 + 88);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ Latest data versions are acceptable", buf, 0xCu);
    }
    uint64_t v6 = 0;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(v3 + 88);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v7;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Latest data versions are not acceptable", buf, 0xCu);
    }
    uint64_t v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-28];
  }
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_13;
  v11[3] = &unk_1E53D7C50;
  id v9 = *(id *)(a1 + 40);
  id v12 = v6;
  id v13 = v9;
  id v10 = v6;
  dispatch_async(v8, v11);
}

uint64_t __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    id v10 = __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke_2;
    uint64_t v11 = &unk_1E53D8C88;
    uint64_t v12 = v3;
    id v13 = *(id *)(a1 + 40);
    uint64_t v4 = v9;
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v3 + 64));

      if (WeakRetained)
      {
        uint64_t v6 = *(NSObject **)(v3 + 80);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = *(void *)(v3 + 88);
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v7;
          _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_INFO, "%{public}@ Asking delegate if download should continue with latest data versions", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v8 = *(NSObject **)(v3 + 72);
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v15 = __77__GEOMapDataSubscriptionOfflineDownloader__validateDataVersionsWithCallback___block_invoke;
        uint64_t v16 = &unk_1E53D7ED0;
        uint64_t v17 = v3;
        id v18 = v4;
        dispatch_async(v8, &buf);
      }
      else
      {
        ((void (*)(void *, void))v10)(v4, 0);
      }
    }
  }
}

uint64_t __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resume
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke;
  v6[3] = &unk_1E53D79D8;
  v6[4] = self;
  GEOOnce((uint64_t)&self->_prepared, v6);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_3;
  v5[3] = &unk_1E53D79D8;
  v5[4] = self;
  dispatch_group_notify(preparationGroup, workQueue, v5);
}

void __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 112));
  uint64_t v2 = *(void *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_2;
  v16[3] = &unk_1E53D9070;
  v16[4] = v2;
  uint64_t v3 = v16;
  if (v2)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__GEOMapDataSubscriptionOfflineDownloader__prepareWithCallback___block_invoke;
    v17[3] = &unk_1E53D8C88;
    v17[4] = v2;
    id v13 = v3;
    id v18 = v3;
    uint64_t v4 = v17;
    uint64_t v5 = dispatch_group_create();
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__7;
    v35[4] = __Block_byref_object_dispose__7;
    id v36 = 0;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = *(id *)(v2 + 40);
    uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    id v14 = v4;
    if (v6)
    {
      uint64_t v7 = *(void *)v30;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
          dispatch_group_enter(v5);
          uint64_t v10 = *(void *)(v2 + 96);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke;
          v24[3] = &unk_1E53DA910;
          v26 = v35;
          uint64_t v27 = v34;
          v28 = v33;
          v25 = v5;
          [v9 determineTotalCountWithCallbackQueue:v10 callback:v24];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v6);
    }

    uint64_t v11 = *(NSObject **)(v2 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__GEOMapDataSubscriptionOfflineDownloader__configureProgressCountsWithCallback___block_invoke_2;
    block[3] = &unk_1E53DA938;
    v21 = v35;
    id v22 = v33;
    block[4] = v2;
    v23 = v34;
    id v12 = v14;
    id v20 = v12;
    dispatch_group_notify(v5, v11, block);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v35, 8);

    uint64_t v3 = v13;
  }
}

void __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), a2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 120);
  if (v5)
  {
    -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v4, v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  dispatch_group_leave(*(dispatch_group_t *)(v4 + 112));
}

- (void)_finishWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    uint64_t v4 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;

    -[GEOMapDataSubscriptionOfflineDownloader _cancelInProgressRequests](a1);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke;
    v5[3] = &unk_1E53D8998;
    id v6 = v3;
    uint64_t v7 = a1;
    GEOOnce(a1 + 144, v5);
  }
}

void __49__GEOMapDataSubscriptionOfflineDownloader_resume__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 152) && !*(void *)(v1 + 120))
  {
    *(unsigned char *)(v1 + 152) = 0;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 160) count];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v5 = *(void **)(v4 + 160);
      -[GEOMapDataSubscriptionOfflineDownloader _startRequests:](v4, v5);
    }
    else
    {
      -[GEOMapDataSubscriptionOfflineDownloader _requestNextBatch](v4);
    }
  }
}

- (void)_startRequests:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    uint64_t v4 = *(NSObject **)(a1 + 80);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 88);
      id v6 = v4;
      *(_DWORD *)long long buf = 138543618;
      uint64_t v31 = v5;
      __int16 v32 = 2048;
      uint64_t v33 = [v3 count];
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ Starting %llu requests", buf, 0x16u);
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__GEOMapDataSubscriptionOfflineDownloader__startRequests___block_invoke;
    v28[3] = &unk_1E53DA988;
    v28[4] = a1;
    uint64_t v7 = objc_msgSend(v3, "_geo_compactMap:", v28);
    if ([v7 count])
    {
      uint64_t v8 = *(void **)(a1 + 168);
      if (!v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v10 = *(void **)(a1 + 168);
        *(void *)(a1 + 168) = v9;

        uint64_t v8 = *(void **)(a1 + 168);
      }
      [v8 addObjectsFromArray:v7];
      uint64_t v11 = *(void **)(a1 + 160);
      if (!v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
        id v13 = *(void **)(a1 + 160);
        *(void *)(a1 + 160) = v12;

        uint64_t v11 = *(void **)(a1 + 160);
      }
      [v11 addObjectsFromArray:v3];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = v7;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            objc_msgSend(v19, "setDelegate:", a1, (void)v24);
            [v19 start];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v16);
      }
    }
    else
    {
      id v20 = *(NSObject **)(a1 + 80);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = *(void *)(a1 + 88);
        id v22 = v20;
        uint64_t v23 = [v3 count];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v31 = v21;
        __int16 v32 = 2048;
        uint64_t v33 = v23;
        _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ %llu requests resulted in zero requesters", buf, 0x16u);
      }
      -[GEOMapDataSubscriptionOfflineDownloader _requestNextBatch](a1);
    }
  }
}

- (void)_requestNextBatch
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    if (!*(unsigned char *)(a1 + 154))
    {
      unint64_t v2 = *(void *)(a1 + 176);
      if (v2 >= [*(id *)(a1 + 40) count])
      {
        if (![*(id *)(a1 + 160) count])
        {
          uint64_t v7 = *(NSObject **)(a1 + 80);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            uint64_t v8 = *(void *)(a1 + 88);
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v8;
            _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "%{public}@ No remaining keys to fetch", (uint8_t *)&buf, 0xCu);
          }
          -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](a1, 0);
        }
      }
      else
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        void v9[2] = __60__GEOMapDataSubscriptionOfflineDownloader__requestNextBatch__block_invoke;
        v9[3] = &unk_1E53DA9B0;
        v9[4] = a1;
        id v3 = v9;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
        *(unsigned char *)(a1 + 154) = 1;
        uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v11 = __63__GEOMapDataSubscriptionOfflineDownloader__determineNextBatch___block_invoke;
        uint64_t v12 = &unk_1E53DA9D8;
        uint64_t v13 = a1;
        uint64_t v5 = v3;
        id v14 = v4;
        id v15 = v5;
        id v6 = v4;
        -[GEOMapDataSubscriptionOfflineDownloader _addMoreRequestsToListIfNeeded:completionHandler:](a1, v6, &buf);
      }
    }
  }
}

- (void)pause
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GEOMapDataSubscriptionOfflineDownloader_pause__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __48__GEOMapDataSubscriptionOfflineDownloader_pause__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 152))
  {
    *(unsigned char *)(v1 + 152) = 1;
    -[GEOMapDataSubscriptionOfflineDownloader _cancelInProgressRequests](*(void *)(a1 + 32));
  }
}

- (void)_cancelInProgressRequests
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    unint64_t v2 = (void *)[*(id *)(a1 + 168) copy];
    if ([v2 count])
    {
      id v3 = *(NSObject **)(a1 + 80);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 88);
        uint64_t v5 = v3;
        *(_DWORD *)long long buf = 138543618;
        uint64_t v18 = v4;
        __int16 v19 = 2048;
        uint64_t v20 = [v2 count];
        _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "%{public}@ Canceling %llu requests", buf, 0x16u);
      }
      id v6 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = 0;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = v2;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "cancel", (void)v12);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__GEOMapDataSubscriptionOfflineDownloader_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __49__GEOMapDataSubscriptionOfflineDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
  -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v1, v2);
}

void __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = (void *)v3[6];
    if (v4)
    {
      uint64_t v5 = v3[10];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = v3[11];
        id v7 = v5;
        uint64_t v8 = [v4 layerVersions];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v30 = v6;
        __int16 v31 = 2048;
        uint64_t v32 = [v8 count];
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_INFO, "%{public}@ Marking subscription as fully-loaded for %llu layers", buf, 0x16u);

        uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 48);
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v9 = [v4 layerVersions];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            long long v15 = [*(id *)(*(void *)(a1 + 40) + 48) layerVersions];
            uint64_t v16 = [v15 objectForKeyedSubscript:v14];

            uint64_t v17 = *(void *)(a1 + 40);
            uint64_t v18 = *(void **)(v17 + 16);
            __int16 v19 = [*(id *)(v17 + 8) identifier];
            objc_msgSend(v18, "setSubscriptionWithIdentifier:isFullyLoaded:forDataType:dataSubtype:version:", v19, 1, 1024, objc_msgSend(v14, "unsignedIntValue"), objc_msgSend(v16, "unsignedLongLongValue"));
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }

      id v2 = *(void **)(a1 + 32);
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = *(NSObject **)(v20 + 72);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke_16;
  v22[3] = &unk_1E53D8998;
  v22[4] = v20;
  id v23 = v2;
  dispatch_async(v21, v22);
}

void __60__GEOMapDataSubscriptionOfflineDownloader__finishWithError___block_invoke_16(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained downloader:*(void *)(a1 + 32) didFinishWithError:*(void *)(a1 + 40)];
}

GEOOfflineDataRequester *__58__GEOMapDataSubscriptionOfflineDownloader__startRequests___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    uint64_t v4 = [[GEOOfflineDataRequester alloc] initWithRequest:v3 requestOptions:v2[23] auditToken:v2[4] log:v2[10] logPrefix:v2[11]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __60__GEOMapDataSubscriptionOfflineDownloader__requestNextBatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 96));
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v9 = [v5 count];
    uint64_t v10 = *(void *)(a1 + 32);
    if (v9)
    {
      -[GEOMapDataSubscriptionOfflineDownloader _startRequests:](v10, v5);
      goto LABEL_7;
    }
    if ([*(id *)(v10 + 160) count]) {
      goto LABEL_7;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(NSObject **)(v11 + 80);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(v11 + 88);
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "%{public}@ No more keys to request. Finished.", (uint8_t *)&v14, 0xCu);
      uint64_t v11 = *(void *)(a1 + 32);
    }
    uint64_t v7 = v11;
    uint64_t v8 = 0;
  }
  -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v7, v8);
LABEL_7:
}

uint64_t __63__GEOMapDataSubscriptionOfflineDownloader__determineNextBatch___block_invoke(void *a1, uint64_t a2)
{
  *(unsigned char *)(a1[4] + 154) = 0;
  uint64_t v3 = a1[6];
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, a1[5]);
  }
}

- (void)_addMoreRequestsToListIfNeeded:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 96));
    uint64_t v7 = [v5 count];
    if ((unint64_t)([*(id *)(a1 + 160) count] + v7) >= *(void *)(a1 + 192)
      || (unint64_t v8 = *(void *)(a1 + 176), v8 >= [*(id *)(a1 + 40) count]))
    {
      v6[2](v6, 0);
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 192);
      uint64_t v10 = [v5 count];
      uint64_t v11 = v9 - v10 - [*(id *)(a1 + 160) count];
      uint64_t v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(a1 + 176)];
      uint64_t v13 = *(void *)(a1 + 96);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke;
      v14[3] = &unk_1E53DAA28;
      v14[4] = a1;
      uint64_t v16 = v6;
      id v15 = v5;
      [v12 determineNextRequestsWithMaximumCount:v11 callbackQueue:v13 callback:v14];
    }
  }
}

void __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(NSObject **)(v7 + 80);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(v7 + 88);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v44 = v9;
      __int16 v45 = 2114;
      id v46 = v6;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Key selection returned error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else if ([v5 count])
  {
    long long v26 = 0;
    uint64_t v10 = dispatch_group_create();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v27 = v5;
    id obj = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v29 = *(void *)v39;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
          dispatch_group_enter(v10);
          id v15 = *(void **)(*(void *)(a1 + 32) + 16);
          if (v14)
          {
            id v16 = *(id *)(v14 + 8);
            uint64_t v17 = *(void *)(v14 + 32);
          }
          else
          {
            id v16 = 0;
            uint64_t v17 = 0;
          }
          uint64_t v18 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "identifier", v26);
          uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 96);
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_21;
          v33[3] = &unk_1E53DAA00;
          id v34 = *(id *)(a1 + 40);
          uint64_t v35 = v14;
          uint64_t v36 = *(void *)(a1 + 32);
          id v37 = v10;
          [v15 determineIfOfflineDataBatchExistsForKey:v16 version:v17 associatingWithSubscriptionIdentifier:v18 callbackQueue:v19 callback:v33];

          ++v13;
        }
        while (v12 != v13);
        uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        uint64_t v12 = v20;
      }
      while (v20);
    }

    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(NSObject **)(v21 + 96);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_2;
    block[3] = &unk_1E53D7F70;
    block[4] = v21;
    id v31 = *(id *)(a1 + 40);
    id v32 = *(id *)(a1 + 48);
    dispatch_group_notify(v10, v22, block);

    id v6 = v26;
    id v5 = v27;
  }
  else
  {
    id v23 = *(void **)(a1 + 32);
    long long v24 = v23[10];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v25 = v23[11];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v44 = v25;
      _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ Key selector yielded additional zero keys. Moving to next selector (if any)", buf, 0xCu);
      id v23 = *(void **)(a1 + 32);
    }
    ++v23[22];
    -[GEOMapDataSubscriptionOfflineDownloader _addMoreRequestsToListIfNeeded:completionHandler:](*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
}

void __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_21(uint64_t a1, char a2, void *a3, void *a4)
{
  id v20 = a3;
  id v7 = a4;
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(v8 + 136);
    if (v9 == 1)
    {
      uint64_t v10 = [*(id *)(v8 + 128) completedUnitCount];
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        uint64_t v11 = *(void *)(v11 + 24);
      }
      [*(id *)(*(void *)(a1 + 48) + 128) setCompletedUnitCount:v11 + v10];
      uint64_t v12 = NSNumber;
      uint64_t v13 = [*(id *)(*(void *)(a1 + 48) + 128) byteCompletedCount];
      uint64_t v14 = [v13 unsignedIntegerValue];
      uint64_t v15 = *(void *)(a1 + 40);
      if (v15) {
        uint64_t v15 = *(void *)(v15 + 24);
      }
      id v16 = [v12 numberWithUnsignedInteger:v15 + v14];
      [*(id *)(*(void *)(a1 + 48) + 128) setByteCompletedCount:v16];

      uint64_t v17 = NSNumber;
      uint64_t v18 = [*(id *)(*(void *)(a1 + 48) + 128) fileCompletedCount];
      uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
      [*(id *)(*(void *)(a1 + 48) + 128) setFileCompletedCount:v19];
    }
    else if (!v9)
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 128), "setCompletedUnitCount:", objc_msgSend(*(id *)(v8 + 128), "completedUnitCount") + 1);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __92__GEOMapDataSubscriptionOfflineDownloader__addMoreRequestsToListIfNeeded_completionHandler___block_invoke_2(void *a1)
{
  return -[GEOMapDataSubscriptionOfflineDownloader _addMoreRequestsToListIfNeeded:completionHandler:](a1[4], a1[5], a1[6]);
}

- (void)offlineRequester:(id)a3 didFinishWithData:(id)a4 withETag:(id)a5 containingDataKeys:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v11 = a5;
  id v12 = a6;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    logPrefix = self->_logPrefix;
    uint64_t v15 = log;
    uint64_t v16 = [v10 request];
    uint64_t v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = *(void **)(v16 + 8);
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;
    *(_DWORD *)long long buf = 138543875;
    long long v39 = logPrefix;
    __int16 v40 = 2113;
    id v41 = v19;
    __int16 v42 = 2050;
    uint64_t v43 = [v12 count];
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ Loaded batch key %{private}@ containing %{public}llu data keys", buf, 0x20u);
  }
  uint64_t v33 = v12;
  diskCache = self->_diskCache;
  uint64_t v21 = [v10 request];
  id v22 = (void *)v21;
  id v23 = v11;
  if (v21) {
    long long v24 = *(void **)(v21 + 8);
  }
  else {
    long long v24 = 0;
  }
  id v25 = v24;
  uint64_t v26 = [v10 request];
  id v27 = (void *)v26;
  if (v26) {
    uint64_t v28 = *(void *)(v26 + 32);
  }
  else {
    uint64_t v28 = 0;
  }
  uint64_t v29 = [(GEOMapDataSubscription *)self->_subscription identifier];
  [(GEOTileDB *)diskCache addData:v34 forOfflineDataBatchKey:v25 version:v28 etag:v23 containedKeys:v33 forSubscriptionIdentifier:v29];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFinishWithData_withETag_containingDataKeys___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v36 = v10;
  id v37 = v34;
  id v31 = v34;
  id v32 = v10;
  dispatch_async(workQueue, block);
}

void __106__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFinishWithData_withETag_containingDataKeys___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) length];
  if (v1)
  {
    uint64_t v4 = v3;
    id v5 = *(NSObject **)(v1 + 96);
    id v6 = v2;
    dispatch_assert_queue_V2(v5);
    [*(id *)(v1 + 168) removeObject:v6];
    id v7 = *(void **)(v1 + 160);
    uint64_t v8 = [v6 request];

    [v7 removeObject:v8];
    uint64_t v9 = *(void *)(v1 + 136);
    if (v9 == 1)
    {
      objc_msgSend(*(id *)(v1 + 128), "setCompletedUnitCount:", objc_msgSend(*(id *)(v1 + 128), "completedUnitCount") + v4);
      id v10 = NSNumber;
      id v11 = [*(id *)(v1 + 128) byteCompletedCount];
      id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue") + v4);
      [*(id *)(v1 + 128) setByteCompletedCount:v12];

      uint64_t v13 = NSNumber;
      uint64_t v14 = [*(id *)(v1 + 128) fileCompletedCount];
      uint64_t v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);
      [*(id *)(v1 + 128) setFileCompletedCount:v15];
    }
    else if (!v9)
    {
      objc_msgSend(*(id *)(v1 + 128), "setCompletedUnitCount:", objc_msgSend(*(id *)(v1 + 128), "completedUnitCount") + 1);
    }
    uint64_t v16 = *(NSObject **)(v1 + 80);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *(void *)(v1 + 88);
      int v18 = 138543362;
      uint64_t v19 = v17;
      _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ Requester finished. Starting additional batch(es) (if possible)", (uint8_t *)&v18, 0xCu);
    }
    -[GEOMapDataSubscriptionOfflineDownloader _requestNextBatch](v1);
  }
}

- (void)offlineRequester:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFailWithError___block_invoke;
  block[3] = &unk_1E53D99F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __77__GEOMapDataSubscriptionOfflineDownloader_offlineRequester_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 96));
    id v5 = *(NSObject **)(v1 + 80);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(v1 + 88);
      id v7 = v5;
      uint64_t v8 = [v3 request];
      id v9 = (void *)v8;
      if (v8) {
        id v10 = *(void **)(v8 + 8);
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;
      int v14 = 138543875;
      uint64_t v15 = v6;
      __int16 v16 = 2113;
      id v17 = v11;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error downloading key %{private}@: %{public}@. Failing...", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(v1 + 168) removeObject:v3];
    id v12 = *(void **)(v1 + 160);
    id v13 = [v3 request];
    [v12 removeObject:v13];

    -[GEOMapDataSubscriptionOfflineDownloader _finishWithError:](v1, v4);
  }
}

- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionDataDownloaderDelegate *)WeakRetained;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressRequesters, 0);
  objc_storeStrong((id *)&self->_remainingCurrentBatchRequests, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_preparationError, 0);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requiredLayers, 0);
  objc_storeStrong((id *)&self->_offlineKeySelector, 0);
  objc_storeStrong((id *)&self->_keySelectors, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end