@interface GEOMapDataSubscriptionResourcesDownloader
+ (NSString)loggingDescription;
- (GEOMapDataSubscription)subscription;
- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate;
- (GEOMapDataSubscriptionResourcesDownloader)initWithSubscription:(id)a3 manifestManager:(id)a4 requestOptions:(unint64_t)a5 auditToken:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 log:(id)a9 logPrefix:(id)a10;
- (NSProgress)progress;
- (void)_finishWithError:(uint64_t)a1;
- (void)cancel;
- (void)pause;
- (void)resume;
@end

@implementation GEOMapDataSubscriptionResourcesDownloader

+ (NSString)loggingDescription
{
  return (NSString *)@"resources";
}

- (GEOMapDataSubscriptionResourcesDownloader)initWithSubscription:(id)a3 manifestManager:(id)a4 requestOptions:(unint64_t)a5 auditToken:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 log:(id)a9 logPrefix:(id)a10
{
  id v36 = a3;
  id v16 = a4;
  id v35 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v37.receiver = self;
  v37.super_class = (Class)GEOMapDataSubscriptionResourcesDownloader;
  v21 = [(GEOMapDataSubscriptionResourcesDownloader *)&v37 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_subscription, a3);
    if (v16)
    {
      v23 = (GEOResourceManifestManager *)v16;
    }
    else
    {
      v23 = +[GEOResourceManifestManager modernManager];
    }
    manifestManager = v22->_manifestManager;
    v22->_manifestManager = v23;

    objc_storeStrong((id *)&v22->_auditToken, a6);
    dispatch_group_t v25 = dispatch_group_create();
    preparationGroup = v22->_preparationGroup;
    v22->_preparationGroup = (OS_dispatch_group *)v25;

    v22->_prepared.lock._os_unfair_lock_opaque = 0;
    v22->_prepared.didRun = 0;
    objc_storeWeak((id *)&v22->_delegate, v17);
    objc_storeStrong((id *)&v22->_delegateQueue, a8);
    objc_storeStrong((id *)&v22->_log, a9);
    uint64_t v27 = [v20 stringByAppendingString:@" [Resources]"];
    logPrefix = v22->_logPrefix;
    v22->_logPrefix = (NSString *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
    progress = v22->_progress;
    v22->_progress = (NSProgress *)v29;

    uint64_t v31 = geo_dispatch_queue_create_with_qos();
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v31;

    v22->_finished.lock._os_unfair_lock_opaque = 0;
    v22->_finished.didRun = 0;
    v22->_paused = 1;
    v33 = v22;
  }

  return v22;
}

- (NSProgress)progress
{
  return self->_progress;
}

void __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) activeTileGroup];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "activeScalesCount"));
  if ([v2 activeScalesCount])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "activeScaleAtIndex:", v4));
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [v2 activeScalesCount]);
  }
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "activeScenariosCount"));
  if ([v2 activeScenariosCount])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v2, "activeScenarioAtIndex:", v7));
      [v6 addObject:v8];

      ++v7;
    }
    while (v7 < [v2 activeScenariosCount]);
  }
  v9 = [*(id *)(*(void *)(a1 + 32) + 8) region];
  v35[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_2;
  v28[3] = &unk_1E53EBCC8;
  id v29 = v3;
  id v30 = v6;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_3;
  dispatch_group_t v25 = &unk_1E53EBCC8;
  id v11 = v29;
  id v26 = v11;
  id v12 = v30;
  id v27 = v12;
  uint64_t v13 = [v2 regionalResourcesForMapRegions:v10 resourceFilter:v28 attributionFilter:&v22];
  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 120);
  *(void *)(v14 + 120) = v13;

  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = *(NSObject **)(v16 + 48);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(v16 + 56);
    id v19 = *(void **)(v16 + 120);
    id v20 = v17;
    uint64_t v21 = objc_msgSend(v19, "count", v22, v23, v24, v25, v26);
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v18;
    __int16 v33 = 2048;
    uint64_t v34 = v21;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_INFO, "%{public}@ Will ensure %llu regional resources are cached", buf, 0x16u);

    uint64_t v16 = *(void *)(a1 + 32);
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setTotalUnitCount:", objc_msgSend(*(id *)(v16 + 120), "count", v22, v23, v24, v25));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_geo_isRelevantForScales:scenarios:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_geo_isRelevantForScales:scenarios:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)resume
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke;
  v6[3] = &unk_1E53D79D8;
  v6[4] = self;
  GEOOnce((uint64_t)&self->_prepared, v6);
  preparationGroup = self->_preparationGroup;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_3;
  v5[3] = &unk_1E53D79D8;
  v5[4] = self;
  dispatch_group_notify(preparationGroup, workQueue, v5);
}

void __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 80));
  uint64_t v2 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_2;
  v6[3] = &unk_1E53D9070;
  v6[4] = v2;
  v3 = v6;
  unint64_t v4 = v3;
  if (v2)
  {
    v5 = *(NSObject **)(v2 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__GEOMapDataSubscriptionResourcesDownloader__prepareWithCallback___block_invoke;
    block[3] = &unk_1E53D7ED0;
    block[4] = v2;
    v8 = v3;
    dispatch_async(v5, block);
  }
}

void __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a2);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  if (v5)
  {
    -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](v4, v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  dispatch_group_leave(*(dispatch_group_t *)(v4 + 80));
}

- (void)_finishWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 64));
    uint64_t v4 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 96), "totalUnitCount"));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke;
    v5[3] = &unk_1E53D8998;
    v5[4] = a1;
    id v6 = v3;
    GEOOnce(a1 + 104, v5);
  }
}

void __51__GEOMapDataSubscriptionResourcesDownloader_resume__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 112))
  {
    if (!*(void *)(v1 + 88))
    {
      *(unsigned char *)(v1 + 112) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
      if (v2)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 64));
        if ([*(id *)(v2 + 120) count])
        {
          id v3 = +[GEOResourceRequester sharedRequester];
          uint64_t v4 = *(void *)(v2 + 120);
          v5 = *(void **)(v2 + 24);
          id v6 = v5;
          if (!v5)
          {
            id v6 = +[GEOApplicationAuditToken currentProcessAuditToken];
          }
          uint64_t v7 = *(void *)(v2 + 64);
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __68__GEOMapDataSubscriptionResourcesDownloader__startRemainingRequests__block_invoke;
          v8[3] = &unk_1E53DA9B0;
          v8[4] = v2;
          [v3 fetchResources:v4 force:0 manifestConfiguration:0 auditToken:v6 queue:v7 handler:v8];
          if (!v5) {
        }
          }
        else
        {
          -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](v2, 0);
        }
      }
    }
  }
}

- (void)pause
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__GEOMapDataSubscriptionResourcesDownloader_pause__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __50__GEOMapDataSubscriptionResourcesDownloader_pause__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 112)) {
    *(unsigned char *)(v1 + 112) = 1;
  }
  return result;
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__GEOMapDataSubscriptionResourcesDownloader_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __51__GEOMapDataSubscriptionResourcesDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
  -[GEOMapDataSubscriptionResourcesDownloader _finishWithError:](v1, v2);
}

void __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke_2;
  v3[3] = &unk_1E53D8998;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __62__GEOMapDataSubscriptionResourcesDownloader__finishWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  [WeakRetained downloader:*(void *)(a1 + 32) didFinishWithError:*(void *)(a1 + 40)];
}

void __68__GEOMapDataSubscriptionResourcesDownloader__startRemainingRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
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
  objc_storeStrong((id *)&self->_resourcesToFetch, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_preparationError, 0);
  objc_storeStrong((id *)&self->_preparationGroup, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end