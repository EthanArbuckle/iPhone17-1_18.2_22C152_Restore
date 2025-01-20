@interface GEOMapDataSubscriptionDownloader
- (GEOApplicationAuditToken)auditToken;
- (GEOMapDataSubscription)subscription;
- (GEOMapDataSubscriptionDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 requiredOfflineLayers:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 reason:(unsigned __int8)a8 requestOptions:(unint64_t)a9 auditToken:(id)a10 manifestManager:(id)a11 log:(id)a12 logPrefix:(id)a13 tileRequesterCreationBlock:(id)a14 tileDownloader:(id)a15 offlineDownloader:(id)a16 updateType:(int64_t)a17;
- (GEOMapDataSubscriptionDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 requiredOfflineLayers:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 reason:(unsigned __int8)a8 requestOptions:(unint64_t)a9 auditToken:(id)a10 manifestManager:(id)a11 log:(id)a12 logPrefix:(id)a13 tileRequesterCreationBlock:(id)a14 tileDownloader:(id)a15 offlineDownloader:(id)a16 updateType:(int64_t)a17 dataTypeMask:(unint64_t)a18;
- (GEOMapDataSubscriptionDownloaderDelegate)delegate;
- (NSProgress)progress;
- (unint64_t)bytesDownloaded;
- (unint64_t)failedTiles;
- (unint64_t)numberOfTilesAttempted;
- (unint64_t)numberOfTilesConsidered;
- (unint64_t)successfulTiles;
- (void)_finishWithError:(id)a3;
- (void)cancel;
- (void)downloader:(id)a3 didFinishWithError:(id)a4;
- (void)offlineDownloader:(id)a3 willUseDataVersions:(id)a4 completionHandler:(id)a5;
- (void)pause;
- (void)resume;
@end

@implementation GEOMapDataSubscriptionDownloader

- (GEOMapDataSubscriptionDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 requiredOfflineLayers:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 reason:(unsigned __int8)a8 requestOptions:(unint64_t)a9 auditToken:(id)a10 manifestManager:(id)a11 log:(id)a12 logPrefix:(id)a13 tileRequesterCreationBlock:(id)a14 tileDownloader:(id)a15 offlineDownloader:(id)a16 updateType:(int64_t)a17
{
  return [(GEOMapDataSubscriptionDownloader *)self initWithSubscription:a3 diskCache:a4 requiredOfflineLayers:a5 delegate:a6 delegateQueue:a7 reason:a8 requestOptions:a9 auditToken:a10 manifestManager:a11 log:a12 logPrefix:a13 tileRequesterCreationBlock:a14 tileDownloader:a15 offlineDownloader:a16 updateType:a17 dataTypeMask:-1];
}

- (GEOMapDataSubscriptionDownloader)initWithSubscription:(id)a3 diskCache:(id)a4 requiredOfflineLayers:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 reason:(unsigned __int8)a8 requestOptions:(unint64_t)a9 auditToken:(id)a10 manifestManager:(id)a11 log:(id)a12 logPrefix:(id)a13 tileRequesterCreationBlock:(id)a14 tileDownloader:(id)a15 offlineDownloader:(id)a16 updateType:(int64_t)a17 dataTypeMask:(unint64_t)a18
{
  unsigned int v51 = a8;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v56 = a4;
  id v54 = a5;
  id obj = a6;
  id v62 = a7;
  id v59 = a10;
  id v60 = a11;
  id v63 = a12;
  id v22 = a13;
  id v55 = a14;
  id v58 = a15;
  id v57 = a16;
  v74.receiver = self;
  v74.super_class = (Class)GEOMapDataSubscriptionDownloader;
  v23 = [(GEOMapDataSubscriptionDownloader *)&v74 init];
  if (v23)
  {
    uint64_t v24 = geo_dispatch_queue_create_with_target();
    workQueue = v23->_workQueue;
    v23->_workQueue = (OS_dispatch_queue *)v24;

    objc_storeWeak((id *)&v23->_delegate, obj);
    objc_storeStrong((id *)&v23->_delegateQueue, a7);
    objc_storeStrong((id *)&v23->_subscription, a3);
    objc_storeStrong((id *)&v23->_auditToken, a10);
    objc_storeStrong((id *)&v23->_diskCache, a4);
    objc_storeStrong((id *)&v23->_manifestManager, a11);
    v23->_updateType = a17;
    objc_storeStrong((id *)&v23->_log, a12);
    uint64_t v26 = [v22 copy];
    logPrefix = v23->_logPrefix;
    v23->_logPrefix = (NSString *)v26;

    uint64_t v28 = [v64 dataTypes];
    if ((v28 & 0x400) != 0
      && GEOConfigGetBOOL(GeoOfflineConfig_DownloadShouldFetchRegionalResources, (uint64_t)off_1E9115968))
    {
      v28 |= 0x800uLL;
    }
    v29 = [MEMORY[0x1E4F1CA48] array];
    v30 = [MEMORY[0x1E4F1CA48] array];
    __int16 v31 = v28 & a18;
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x2020000000;
    char v73 = 0;
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __259__GEOMapDataSubscriptionDownloader_initWithSubscription_diskCache_requiredOfflineLayers_delegate_delegateQueue_reason_requestOptions_auditToken_manifestManager_log_logPrefix_tileRequesterCreationBlock_tileDownloader_offlineDownloader_updateType_dataTypeMask___block_invoke;
    v69[3] = &unk_1E53DE0A8;
    v69[4] = &v70;
    v69[5] = v28 & a18;
    _GEOEnumerateMapDataSubscriptionTileDataTypes(v69);
    if (*((unsigned char *)v71 + 24))
    {
      if (v58)
      {
        p_tileDownloader = &v23->_tileDownloader;
        objc_storeStrong((id *)&v23->_tileDownloader, a15);
        [(GEOMapDataSubscriptionTileDownloader *)v23->_tileDownloader setDelegate:v23];
        [(GEOMapDataSubscriptionTileDownloader *)v23->_tileDownloader setDelegateQueue:v23->_workQueue];
      }
      else
      {
        v33 = [[GEOMapDataSubscriptionTileDownloader alloc] initWithSubscription:v64 diskCache:v56 reason:v51 requestOptions:a9 auditToken:v59 manifestManager:v60 delegate:v23 delegateQueue:v23->_workQueue log:v63 logPrefix:v22 tileRequesterCreationBlock:v55];
        p_tileDownloader = &v23->_tileDownloader;
        tileDownloader = v23->_tileDownloader;
        v23->_tileDownloader = v33;
      }
      [(NSMutableArray *)v29 addObject:*p_tileDownloader];
      v35 = [(GEOMapDataSubscriptionTileDownloader *)v23->_tileDownloader progress];
      if (v35) {
        [v30 addObject:v35];
      }
    }
    if ((v31 & 0x800) != 0)
    {
      v36 = [[GEOMapDataSubscriptionResourcesDownloader alloc] initWithSubscription:v64 manifestManager:v60 requestOptions:a9 auditToken:v59 delegate:v23 delegateQueue:v23->_workQueue log:v63 logPrefix:v22];
      [(NSMutableArray *)v29 addObject:v36];
      if (([v64 dataTypes] & 0x800) != 0)
      {
        v37 = [(GEOMapDataSubscriptionResourcesDownloader *)v36 progress];
        if (v37) {
          [v30 addObject:v37];
        }
      }
    }
    if ((v31 & 0x400) != 0)
    {
      v38 = (GEOMapDataSubscriptionOfflineDownloader *)v57;
      if (!v38) {
        v38 = [[GEOMapDataSubscriptionOfflineDownloader alloc] initWithSubscription:v64 diskCache:v56 manifestManager:v60 requestOptions:a9 auditToken:v59 keySelectors:0 requiredLayers:v54 delegate:v23 delegateQueue:v23->_workQueue log:v63 logPrefix:v22];
      }
      [(NSMutableArray *)v29 addObject:v38];
      v39 = [(GEOMapDataSubscriptionOfflineDownloader *)v38 progress];
      if (v39) {
        [v30 addObject:v39];
      }
      v40 = [[GEOMapDataSubscriptionShiftFunctionDownloader alloc] initWithSubscription:v64 shifter:0 cache:v23->_diskCache delegate:v23 delegateQueue:v23->_workQueue log:v63 logPrefix:v22];
      [(NSMutableArray *)v29 addObject:v40];
    }
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_progressAggregatingChildrenWithTotalUnitCount:", objc_msgSend(v30, "count"));
    progress = v23->_progress;
    v23->_progress = (NSProgress *)v41;

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v43 = v30;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v66 != v45) {
            objc_enumerationMutation(v43);
          }
          [(NSProgress *)v23->_progress addChild:*(void *)(*((void *)&v65 + 1) + 8 * i) withPendingUnitCount:1];
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v44);
    }

    [(NSProgress *)v23->_progress setUserInfoObject:&unk_1ED73D888 forKey:*MEMORY[0x1E4F288A0]];
    unint64_t v47 = v23->_updateType - 1;
    if (v47 < 3) {
      [(NSProgress *)v23->_progress setUserInfoObject:*off_1E53DE0C8[v47] forKey:@"GEOMapDataSubscriptionDownloadReasonKey"];
    }
    remainingDownloaders = v23->_remainingDownloaders;
    v23->_remainingDownloaders = v29;

    v23->_finished.lock._os_unfair_lock_opaque = 0;
    v23->_finished.didRun = 0;
    v23->_paused = 1;
    v49 = v23;
    _Block_object_dispose(&v70, 8);
  }
  return v23;
}

uint64_t __259__GEOMapDataSubscriptionDownloader_initWithSubscription_diskCache_requiredOfflineLayers_delegate_delegateQueue_reason_requestOptions_auditToken_manifestManager_log_logPrefix_tileRequesterCreationBlock_tileDownloader_offlineDownloader_updateType_dataTypeMask___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if ((*(void *)(result + 40) & a2) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  *a3 = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)resume
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GEOMapDataSubscriptionDownloader_resume__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __42__GEOMapDataSubscriptionDownloader_resume__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 144))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 144) = 0;
    v3 = [GEOPowerAssertion alloc];
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.geod.SubscriptionDownload.%p", *(void *)(v2 + 32));
    uint64_t v5 = [(GEOPowerAssertion *)v3 initWithType:0 identifier:v4 timeout:GEOConfigGetDouble(GeoServicesConfig_SubscriptionDownloadPowerAssertionTimeout, (uint64_t)off_1E9114E48)];
    uint64_t v6 = *(void *)(v2 + 32);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v17 = *(void *)(v2 + 32);
    uint64_t v8 = _GEOCreateTransaction();
    uint64_t v9 = *(void *)(v2 + 32);
    v10 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = v8;

    uint64_t v11 = *(void *)(v2 + 32);
    if (!*(void *)(v11 + 112))
    {
      uint64_t v12 = objc_msgSend(*(id *)(v11 + 120), "count", v17);
      uint64_t v11 = *(void *)(v2 + 32);
      if (v12)
      {
        uint64_t v13 = [*(id *)(v11 + 120) firstObject];
        uint64_t v14 = *(void *)(v2 + 32);
        v15 = *(void **)(v14 + 112);
        *(void *)(v14 + 112) = v13;

        [*(id *)(*(void *)(v2 + 32) + 120) removeObjectAtIndex:0];
        uint64_t v11 = *(void *)(v2 + 32);
      }
    }
    if (*(void *)(v11 + 112))
    {
      v16 = *(void **)(v11 + 112);
      return [v16 resume];
    }
    else
    {
      return [(id)v11 _finishWithError:0];
    }
  }
  return result;
}

- (void)pause
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__GEOMapDataSubscriptionDownloader_pause__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __41__GEOMapDataSubscriptionDownloader_pause__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 144) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 112);

  return [v6 pause];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  GEOOnce((uint64_t)&self->_finished, v8);
  powerAssertion = self->_powerAssertion;
  self->_powerAssertion = 0;

  transaction = self->_transaction;
  self->_transaction = 0;
}

void __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "totalUnitCount"));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke_2;
  v4[3] = &unk_1E53D8998;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);
}

void __53__GEOMapDataSubscriptionDownloader__finishWithError___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 subscriptionDownloader:*(void *)(a1 + 32) didFinishWithError:*(void *)(a1 + 40)];
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  [*(id *)(*(void *)(a1 + 32) + 112) cancel];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "totalUnitCount"));
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_3;
  block[3] = &unk_1E53D79D8;
  block[4] = v6;
  dispatch_async(v7, block);
}

void __42__GEOMapDataSubscriptionDownloader_cancel__block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
  [v4 subscriptionDownloader:v2 didFinishWithError:v3];
}

- (unint64_t)numberOfTilesConsidered
{
  return [(GEOMapDataSubscriptionTileDownloader *)self->_tileDownloader numberOfTilesConsidered];
}

- (unint64_t)numberOfTilesAttempted
{
  return [(GEOMapDataSubscriptionTileDownloader *)self->_tileDownloader numberOfTilesAttempted];
}

- (unint64_t)successfulTiles
{
  return [(GEOMapDataSubscriptionTileDownloader *)self->_tileDownloader successfulTiles];
}

- (unint64_t)failedTiles
{
  return [(GEOMapDataSubscriptionTileDownloader *)self->_tileDownloader failedTiles];
}

- (unint64_t)bytesDownloaded
{
  return [(GEOMapDataSubscriptionTileDownloader *)self->_tileDownloader bytesDownloaded];
}

- (void)downloader:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (GEOMapDataSubscriptionDataDownloader *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7)
  {
    uint64_t v8 = self;
    id v9 = v7;
LABEL_3:
    [(GEOMapDataSubscriptionDownloader *)v8 _finishWithError:v9];
    goto LABEL_9;
  }
  if (self->_currentDownloader == v6)
  {
    if (![(NSMutableArray *)self->_remainingDownloaders count])
    {
      currentDownloader = self->_currentDownloader;
      self->_currentDownloader = 0;

      uint64_t v8 = self;
      id v9 = 0;
      goto LABEL_3;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      logPrefix = self->_logPrefix;
      uint64_t v12 = log;
      uint64_t v13 = [(id)objc_opt_class() loggingDescription];
      uint64_t v14 = [(NSMutableArray *)self->_remainingDownloaders firstObject];
      v15 = [(id)objc_opt_class() loggingDescription];
      int v19 = 138543874;
      v20 = logPrefix;
      __int16 v21 = 2114;
      id v22 = v13;
      __int16 v23 = 2114;
      uint64_t v24 = v15;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_INFO, "%{public}@ Finished downloading %{public}@. Starting download of %{public}@.", (uint8_t *)&v19, 0x20u);
    }
    v16 = [(NSMutableArray *)self->_remainingDownloaders firstObject];
    uint64_t v17 = self->_currentDownloader;
    self->_currentDownloader = v16;

    [(NSMutableArray *)self->_remainingDownloaders removeObjectAtIndex:0];
    [(GEOMapDataSubscriptionDataDownloader *)self->_currentDownloader resume];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v19) = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloader == _currentDownloader", (uint8_t *)&v19, 2u);
  }
LABEL_9:
}

- (void)offlineDownloader:(id)a3 willUseDataVersions:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__GEOMapDataSubscriptionDownloader_offlineDownloader_willUseDataVersions_completionHandler___block_invoke;
    block[3] = &unk_1E53D7F70;
    block[4] = self;
    id v13 = v7;
    id v14 = v8;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

void __92__GEOMapDataSubscriptionDownloader_offlineDownloader_willUseDataVersions_completionHandler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained subscriptionDownloader:a1[4] willUseOfflineDataVersions:a1[5] completionHandler:a1[6]];
}

- (GEOMapDataSubscriptionDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionDownloaderDelegate *)WeakRetained;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingDownloaders, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_tileDownloader, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end