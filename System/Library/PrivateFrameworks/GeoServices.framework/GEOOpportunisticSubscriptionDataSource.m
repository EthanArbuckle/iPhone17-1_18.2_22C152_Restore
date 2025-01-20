@interface GEOOpportunisticSubscriptionDataSource
+ (unint64_t)policy;
- (GEOOpportunisticDataSourceDelegate)delegate;
- (GEOOpportunisticSubscriptionDataSource)initWithSessionIdentifier:(id)a3 diskCache:(id)a4 subscriptionManager:(id)a5 manifestManager:(id)a6 requestCounter:(id)a7 requestCounterPolicy:(unsigned __int8)a8 tileRequesterCreationBlock:(id)a9;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)bytesDownloaded;
- (void)_finish;
- (void)_startNextSubscriptionIfPossible;
- (void)cancel;
- (void)pause;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)subscriptionDownloader:(id)a3 didFinishWithError:(id)a4;
@end

@implementation GEOOpportunisticSubscriptionDataSource

+ (unint64_t)policy
{
  return 0;
}

- (GEOOpportunisticSubscriptionDataSource)initWithSessionIdentifier:(id)a3 diskCache:(id)a4 subscriptionManager:(id)a5 manifestManager:(id)a6 requestCounter:(id)a7 requestCounterPolicy:(unsigned __int8)a8 tileRequesterCreationBlock:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v35.receiver = self;
  v35.super_class = (Class)GEOOpportunisticSubscriptionDataSource;
  v20 = [(GEOOpportunisticSubscriptionDataSource *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    sessionIdentifier = v20->_sessionIdentifier;
    v20->_sessionIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v20->_diskCache, a4);
    if (v16)
    {
      v23 = (GEOMapDataSubscriptionManager *)v16;
    }
    else
    {
      v23 = +[GEOMapDataSubscriptionManager sharedManager];
    }
    subscriptionManager = v20->_subscriptionManager;
    v20->_subscriptionManager = v23;

    if (v17)
    {
      v25 = (GEOResourceManifestManager *)v17;
    }
    else
    {
      v25 = +[GEOResourceManifestManager modernManager];
    }
    manifestManager = v20->_manifestManager;
    v20->_manifestManager = v25;

    objc_storeStrong((id *)&v20->_requestCounter, a7);
    uint64_t v27 = [v19 copy];
    id tileRequesterCreationBlock = v20->_tileRequesterCreationBlock;
    v20->_id tileRequesterCreationBlock = (id)v27;

    v20->_currentSubscriptionIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v29 = geo_dispatch_queue_create_with_workloop_qos();
    workQueue = v20->_workQueue;
    v20->_workQueue = (OS_dispatch_queue *)v29;

    dispatch_group_t v31 = dispatch_group_create();
    preparationGroup = v20->_preparationGroup;
    v20->_preparationGroup = (OS_dispatch_group *)v31;

    v20->_started.lock._os_unfair_lock_opaque = 0;
    v20->_started.didRun = 0;
    v20->_finished.lock._os_unfair_lock_opaque = 0;
    v20->_finished.didRun = 0;
    v20->_paused = 1;
    v33 = v20;
  }

  return v20;
}

- (void)resume
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke;
  v8[3] = &unk_1E53D79D8;
  v8[4] = self;
  GEOOnce((uint64_t)&self->_started, v8);
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  preparationGroup = self->_preparationGroup;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2_6;
  v5[3] = &unk_1E53D93B8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  dispatch_group_notify(preparationGroup, workQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 152));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  uint64_t v4 = *(void *)(v2 + 144);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2;
  v6[3] = &unk_1E53DA9B0;
  v6[4] = v2;
  return [v3 fetchAllSubscriptionsWithCallbackQueue:v4 completionHandler:v6];
}

void __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "[Subscription] Failed to fetch subscriptions: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend(v5, "_geo_filtered:", &__block_literal_global_139);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 120);
  *(void *)(v9 + 120) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 152));
}

unint64_t __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 policy] == 1
    && GEOConfigGetBOOL(GeoOfflineConfig_DownloadShouldFetchRegionalResources, (uint64_t)off_1E9115968)
    && GEOConfigGetBOOL(GeoOfflineConfig_OpportunisticFetchOfflineRegionalResources, (uint64_t)off_1E9115978))
  {
    unint64_t v3 = ((unint64_t)[v2 dataTypes] >> 10) & 1;
  }
  else
  {
    unint64_t v3 = [v2 policy] == 0;
  }

  return v3;
}

void __48__GEOOpportunisticSubscriptionDataSource_resume__block_invoke_2_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v3 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 177) && *((unsigned char *)WeakRetained + 176))
  {
    *((unsigned char *)WeakRetained + 176) = 0;
    uint64_t v4 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 120) count];
      int v10 = 134349056;
      uint64_t v11 = v5;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "[Subscription] Resuming download of %{public}llu subscriptions", (uint8_t *)&v10, 0xCu);
    }

    id v6 = *(void **)(a1 + 32);
    if (v6[17])
    {
      v7 = GEOGetProactiveTileDownloadLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 136) subscription];
        uint64_t v9 = [v8 identifier];
        int v10 = 138477827;
        uint64_t v11 = (uint64_t)v9;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "[Subscription] Resuming download of %{private}@", (uint8_t *)&v10, 0xCu);
      }
      [*(id *)(*(void *)(a1 + 32) + 136) resume];
    }
    else
    {
      [v6 _startNextSubscriptionIfPossible];
    }
  }
}

- (void)pause
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__GEOOpportunisticSubscriptionDataSource_pause__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __47__GEOOpportunisticSubscriptionDataSource_pause__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 136) pause];
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 144);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 177) = 1;
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 136);
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = 0;

    v7 = [v4 subscription];
    uint64_t v8 = [v7 policy];

    if (!v8)
    {
      uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 40);
      int v10 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
      [v9 _externallyManagedDownloaderDidFinish:v4 withError:v10];
    }
    [v4 cancel];

    uint64_t v1 = *(void *)(a1 + 32);
  }
  uint64_t v11 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_3;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_async(v11, block);
}

void __48__GEOOpportunisticSubscriptionDataSource_cancel__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained dataSourceDidFinish:*(void *)(a1 + 32)];
}

- (void)_startNextSubscriptionIfPossible
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  unint64_t currentSubscriptionIndex = self->_currentSubscriptionIndex;
  if (currentSubscriptionIndex == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = currentSubscriptionIndex + 1;
  }
  self->_unint64_t currentSubscriptionIndex = v4;
  while (1)
  {
    unint64_t v5 = self->_currentSubscriptionIndex;
    NSUInteger v6 = [(NSArray *)self->_subscriptionsToLoad count];
    if (v5 >= v6) {
      break;
    }
    v7 = [(NSArray *)self->_subscriptionsToLoad objectAtIndexedSubscript:self->_currentSubscriptionIndex];
    uint64_t v8 = [v7 _originatingBundleIdentifier];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      unsigned __int8 v39 = 0;
      int v10 = +[GEOSystemMonitor sharedInstance];
      uint64_t v11 = [v7 _originatingBundleIdentifier];
      char v12 = [v10 isBackgroundAppRefreshEnabledForBundleIdentifier:v11 isDisabledGlobally:&v39];

      if ((v12 & 1) == 0)
      {
        int v14 = v39;
        id v15 = GEOGetProactiveTileDownloadLog();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
        if (v14)
        {
          if (v16)
          {
            id v17 = [v7 identifier];
            *(_DWORD *)buf = 138477827;
            uint64_t v41 = (uint64_t)v17;
            _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "[Subscription] Skipping subscription '%{private}@' because background app refresh is disabled", buf, 0xCu);
            goto LABEL_14;
          }
        }
        else if (v16)
        {
          id v17 = [v7 identifier];
          id v18 = [v7 _originatingBundleIdentifier];
          *(_DWORD *)buf = 138478083;
          uint64_t v41 = (uint64_t)v17;
          __int16 v42 = 2114;
          v43 = v18;
          _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "[Subscription] Skipping subscription '%{private}@' because background app refresh is disabled for bundle %{public}@", buf, 0x16u);

LABEL_14:
        }

        id v13 = 0;
        ++self->_currentSubscriptionIndex;
        goto LABEL_16;
      }
    }
    id v13 = v7;
LABEL_16:

    if (v13) {
      goto LABEL_19;
    }
  }
  id v13 = 0;
LABEL_19:
  unint64_t v19 = self->_currentSubscriptionIndex;
  NSUInteger v20 = [(NSArray *)self->_subscriptionsToLoad count];
  if (v5 >= v6 || v19 >= v20)
  {
    currentDownloader = self->_currentDownloader;
    self->_currentDownloader = 0;

    [(GEOOpportunisticSubscriptionDataSource *)self _finish];
  }
  else
  {
    id v23 = v13;
    uint64_t v24 = [v23 policy];
    if (v24)
    {
      if (v24 == 1)
      {
        if (([v23 dataTypes] & 0x400) != 0)
        {
          uint64_t v25 = 2048;
          goto LABEL_33;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: 0 != (subscription.dataTypes & GEOMapDataSubscriptionDataTypeOffline)", buf, 2u);
        }
      }
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v25 = -1;
    }
LABEL_33:

    v26 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [v23 identifier];
      v28 = [v23 _originatingBundleIdentifier];
      *(_DWORD *)buf = 134218499;
      uint64_t v41 = v25;
      __int16 v42 = 2113;
      v43 = v27;
      __int16 v44 = 2114;
      v45 = v28;
      _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_INFO, "[Subscription] Starting download (mask=%llu) of subscription '%{private}@' on behalf of bundle %{public}@", buf, 0x20u);
    }
    v37 = [GEOMapDataSubscriptionDownloader alloc];
    diskCache = self->_diskCache;
    uint64_t v29 = +[GEOOfflineDataConfiguration sharedConfiguration];
    v30 = [v29 requiredLayers];
    workQueue = self->_workQueue;
    manifestManager = self->_manifestManager;
    v33 = GEOGetProactiveTileDownloadLog();
    v34 = objc_msgSend(NSString, "stringWithFormat:", @"[Subscription] [%llu]", self->_currentSubscriptionIndex);
    objc_super v35 = [(GEOMapDataSubscriptionDownloader *)v37 initWithSubscription:v23 diskCache:diskCache requiredOfflineLayers:v30 delegate:self delegateQueue:workQueue reason:2 requestOptions:112 auditToken:0 manifestManager:manifestManager log:v33 logPrefix:v34 tileRequesterCreationBlock:self->_tileRequesterCreationBlock tileDownloader:0 offlineDownloader:0 updateType:1 dataTypeMask:v25];
    v36 = self->_currentDownloader;
    self->_currentDownloader = v35;

    if (![v23 policy]) {
      [(GEOMapDataSubscriptionManager *)self->_subscriptionManager _registerExternallyManagedDownloader:self->_currentDownloader];
    }
    [(GEOMapDataSubscriptionDownloader *)self->_currentDownloader resume];
  }
}

- (void)_finish
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_finished, v2);
}

void __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = GEOGetProactiveTileDownloadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v3 + 96);
    uint64_t v4 = *(void *)(v3 + 104);
    *(_DWORD *)buf = 134218240;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v4;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "[Subscription] Finished. Successfully downloaded %llu tiles, failed to download %llu tiles", buf, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  [*(id *)(v6 + 56) finishedProactiveTileDownloadForIdentifier:*(void *)(v6 + 24) policy:*(unsigned __int8 *)(v6 + 64) tilesConsidered:*(unsigned int *)(v6 + 80) tileDownloadAttempts:*(unsigned int *)(v6 + 88) successes:*(unsigned int *)(v6 + 96) failures:*(unsigned int *)(v6 + 104) bytesDownloaded:*(void *)(v6 + 112)];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke_13;
  block[3] = &unk_1E53D79D8;
  block[4] = v7;
  dispatch_async(v8, block);
}

void __49__GEOOpportunisticSubscriptionDataSource__finish__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained dataSourceDidFinish:*(void *)(a1 + 32)];
}

- (void)subscriptionDownloader:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v6 = (GEOMapDataSubscriptionDownloader *)a3;
  id v7 = a4;
  if (self->_currentDownloader == v6)
  {
    uint64_t v8 = [(GEOMapDataSubscriptionDownloader *)v6 subscription];
    uint64_t v9 = [v8 policy];

    if (!v9) {
      [(GEOMapDataSubscriptionManager *)self->_subscriptionManager _externallyManagedDownloaderDidFinish:v6 withError:v7];
    }
    self->_numberOfTilesOriginallyConsidered += [(GEOMapDataSubscriptionDownloader *)v6 numberOfTilesConsidered];
    self->_numberOfTilesAttempted += [(GEOMapDataSubscriptionDownloader *)v6 numberOfTilesAttempted];
    self->_successfulTiles += [(GEOMapDataSubscriptionDownloader *)v6 successfulTiles];
    self->_failedTiles += [(GEOMapDataSubscriptionDownloader *)v6 failedTiles];
    self->_bytesDownloaded += [(GEOMapDataSubscriptionDownloader *)v6 bytesDownloaded];
    if (!v7) {
      notify_post(GEOMapDataSubscriptionManagerFullyDownloadedSubscriptionsDidChangeDarwinNotification);
    }
    if (!self->_canceled) {
      [(GEOOpportunisticSubscriptionDataSource *)self _startNextSubscriptionIfPossible];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: downloader == _currentDownloader", v10, 2u);
  }
}

- (GEOOpportunisticDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOOpportunisticDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_subscriptionsToLoad, 0);
  objc_storeStrong(&self->_tileRequesterCreationBlock, 0);
  objc_storeStrong((id *)&self->_requestCounter, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end