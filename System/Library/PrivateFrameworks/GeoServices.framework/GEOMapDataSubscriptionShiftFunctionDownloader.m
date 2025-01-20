@interface GEOMapDataSubscriptionShiftFunctionDownloader
+ (NSString)loggingDescription;
- (GEOMapDataSubscription)subscription;
- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate;
- (GEOMapDataSubscriptionShiftFunctionDownloader)initWithSubscription:(id)a3 shifter:(id)a4 cache:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 log:(id)a8 logPrefix:(id)a9;
- (NSProgress)progress;
- (void)_downloadNextShiftFunction;
- (void)_fetchShiftFunctionFor:(id)a3 completion:(id)a4;
- (void)_finishWithError:(id)a3;
- (void)_prepare:(id)a3;
- (void)cancel;
- (void)pause;
- (void)resume;
@end

@implementation GEOMapDataSubscriptionShiftFunctionDownloader

- (GEOMapDataSubscriptionShiftFunctionDownloader)initWithSubscription:(id)a3 shifter:(id)a4 cache:(id)a5 delegate:(id)a6 delegateQueue:(id)a7 log:(id)a8 logPrefix:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v46 = a7;
  id v45 = a8;
  id v20 = a9;
  v48.receiver = self;
  v48.super_class = (Class)GEOMapDataSubscriptionShiftFunctionDownloader;
  uint64_t v21 = [(GEOMapDataSubscriptionShiftFunctionDownloader *)&v48 self];

  if (!v21)
  {
LABEL_16:
    v43 = 0;
    v33 = v45;
    v39 = v46;
    goto LABEL_13;
  }
  if (v17)
  {
    id v22 = v17;
  }
  else
  {
    id v22 = +[GEOLocationShifter _proxy];
  }
  v23 = *(void **)(v21 + 32);
  *(void *)(v21 + 32) = v22;

  if (([*(id *)(v21 + 32) conformsToProtocol:&unk_1ED835F30] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [_shifter conformsToProtocol:@protocol(_GEOLocationShifterProxyInternal)]", buf, 2u);
    }
    goto LABEL_16;
  }
  objc_storeStrong((id *)(v21 + 8), a3);
  objc_storeWeak((id *)(v21 + 16), v19);
  objc_storeStrong((id *)(v21 + 24), a7);
  if (v18)
  {
    id v24 = v18;
  }
  else
  {
    _GEOGetSharedTileDB();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v24;

  objc_storeStrong((id *)(v21 + 48), a8);
  uint64_t v26 = [v20 copy];
  v27 = *(void **)(v21 + 56);
  *(void *)(v21 + 56) = v26;

  uint64_t v28 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
  v29 = *(void **)(v21 + 96);
  *(void *)(v21 + 96) = v28;

  uint64_t v30 = geo_dispatch_queue_create_with_qos();
  v31 = *(void **)(v21 + 64);
  *(void *)(v21 + 64) = v30;

  v32 = [v16 _originatingBundleIdentifier];
  v33 = v45;
  if ([v32 length])
  {
    v34 = [GEOApplicationAuditToken alloc];
    v35 = [v16 _originatingBundleIdentifier];
    uint64_t v36 = [(GEOApplicationAuditToken *)v34 initWithProxiedApplicationBundleId:v35];
    v37 = *(void **)(v21 + 72);
    *(void *)(v21 + 72) = v36;
  }
  else
  {
    uint64_t v38 = +[GEOApplicationAuditToken currentProcessAuditToken];
    v35 = *(void **)(v21 + 72);
    *(void *)(v21 + 72) = v38;
  }
  v39 = v46;

  v40 = +[GEOMapService sharedService];
  uint64_t v41 = [v40 defaultTraits];
  v42 = *(void **)(v21 + 80);
  *(void *)(v21 + 80) = v41;

  v43 = (GEOMapDataSubscriptionShiftFunctionDownloader *)(id)v21;
LABEL_13:

  return v43;
}

- (NSProgress)progress
{
  return self->_progress;
}

+ (NSString)loggingDescription
{
  return (NSString *)@"shiftFxns";
}

- (void)_fetchShiftFunctionFor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  cache = self->_cache;
  [v6 coordinate];
  double v10 = v9;
  double v12 = v11;
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke;
  v16[3] = &unk_1E53E1B20;
  objc_copyWeak(&v20, &location);
  id v14 = v7;
  id v19 = v14;
  id v15 = v6;
  id v17 = v15;
  id v18 = self;
  -[GEOTileDB findShiftResponseForCoordinate:withinRadius:queue:completion:](cache, "findShiftResponseForCoordinate:withinRadius:queue:completion:", workQueue, v16, v10, v12, 0.1);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v7
      && (int v10 = [v7 version],
          v10 == [*((id *)WeakRetained + 4) locationShiftFunctionVersion]))
    {
      [*((id *)WeakRetained + 5) linkShiftResponse:a3 toSubscription:*((void *)WeakRetained + 1)];
      double v11 = *((void *)WeakRetained + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_2;
      block[3] = &unk_1E53D95B8;
      id v23 = *(id *)(a1 + 48);
      id v21 = v7;
      id v22 = v8;
      dispatch_async(v11, block);

      double v12 = v23;
    }
    else
    {
      v13 = (void *)*((void *)WeakRetained + 4);
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(v14 + 72);
      uint64_t v16 = *(void *)(v14 + 80);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_3;
      v18[3] = &unk_1E53E1AF8;
      v18[4] = WeakRetained;
      id v19 = *(id *)(a1 + 48);
      [v13 _doNetworkRequestForLatLng:v15 reduceRadius:v16 traits:v17 auditToken:0 shouldCache:v18 completionHandler:0.0];
      double v12 = v19;
    }
  }
}

uint64_t __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [*(id *)(*(void *)(a1 + 32) + 40) storeShiftResponse:v5 forSubscription:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_4;
  block[3] = &unk_1E53D95B8;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__GEOMapDataSubscriptionShiftFunctionDownloader__fetchShiftFunctionFor_completion___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)pause
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__GEOMapDataSubscriptionShiftFunctionDownloader_pause__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __54__GEOMapDataSubscriptionShiftFunctionDownloader_pause__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = 0;
  return result;
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GEOMapDataSubscriptionShiftFunctionDownloader_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

void __55__GEOMapDataSubscriptionShiftFunctionDownloader_cancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-2 reason:0];
  [v1 _finishWithError:v2];
}

- (void)resume
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke_2;
  v3[3] = &unk_1E53D79D8;
  v3[4] = v1;
  return [v1 _prepare:v3];
}

uint64_t __55__GEOMapDataSubscriptionShiftFunctionDownloader_resume__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadNextShiftFunction];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  self->_isRunning = 0;
  needCoordinates = self->_needCoordinates;
  self->_needCoordinates = 0;

  [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress totalUnitCount]];
  delegateQueue = self->_delegateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__GEOMapDataSubscriptionShiftFunctionDownloader__finishWithError___block_invoke;
  v8[3] = &unk_1E53D8998;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(delegateQueue, v8);
}

void __66__GEOMapDataSubscriptionShiftFunctionDownloader__finishWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained downloader:*(void *)(a1 + 32) didFinishWithError:*(void *)(a1 + 40)];
}

- (void)_prepare:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if ([(NSMutableArray *)self->_needCoordinates count])
  {
    v4[2](v4);
  }
  else
  {
    shifter = self->_shifter;
    id v6 = [(GEOMapDataSubscription *)self->_subscription region];
    LOBYTE(shifter) = [(_GEOLocationShifterProxyInternal *)shifter isLocationShiftRequiredForRegion:v6];

    if (shifter)
    {
      objc_initWeak(&location, self);
      id v7 = [GEOLatLng alloc];
      id v8 = [(GEOMapDataSubscription *)self->_subscription region];
      [v8 centerLat];
      double v10 = v9;
      double v11 = [(GEOMapDataSubscription *)self->_subscription region];
      [v11 centerLng];
      id v13 = [(GEOLatLng *)v7 initWithLatitude:v10 longitude:v12];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke;
      v14[3] = &unk_1E53E1B48;
      v14[4] = self;
      objc_copyWeak(&v16, &location);
      uint64_t v15 = v4;
      [(GEOMapDataSubscriptionShiftFunctionDownloader *)self _fetchShiftFunctionFor:v13 completion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      [(GEOMapDataSubscriptionShiftFunctionDownloader *)self _finishWithError:0];
    }
  }
}

void __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64));
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke_2;
    block[3] = &unk_1E53D7F70;
    void block[4] = v7;
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
  }
  else
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Could not fetch center"];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _finishWithError:v6];
  }
}

uint64_t __58__GEOMapDataSubscriptionShiftFunctionDownloader__prepare___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) region];
  [*(id *)(a1 + 40) radius];
  double v4 = v3;
  id v5 = v2;
  double v6 = sqrt((v4 + v4) * (v4 + v4) * 0.5);
  double v7 = v6 * 0.5;
  [v5 spanLng];
  double v9 = v8;
  [v5 spanLat];
  double v11 = v6 * ceil(v10 / v6) * 0.5;
  [v5 centerLng];
  double v13 = v12;
  [v5 centerLng];
  double v15 = v14;
  [v5 centerLat];
  double v17 = -90.0;
  if (v6 * 0.5 + v16 - v11 > -90.0)
  {
    [v5 centerLat];
    double v17 = v7 + v18 - v11;
  }
  [v5 centerLat];
  BOOL v20 = v11 + v19 - v7 < 90.0;
  double v21 = 90.0;
  if (v20)
  {
    objc_msgSend(v5, "centerLat", 90.0);
    double v21 = v11 + v22 - v7;
  }
  double v23 = v21;
  id v24 = [MEMORY[0x1E4F1CA48] array];
  if (v17 - v23 < 0.00000000999999994)
  {
    double v25 = v6 * ceil(v9 / v6) * 0.5;
    double v26 = v7 + v13 - v25;
    double v27 = v15 + v25 - v7;
    double v36 = v26;
    double v37 = v26 - v27;
    while (v37 >= 0.00000000999999994)
    {
LABEL_16:
      double v17 = v6 + v17;
      if (v17 - v23 >= 0.00000000999999994) {
        goto LABEL_17;
      }
    }
    double v28 = v36;
    while (v28 >= -180.0)
    {
      double v30 = v28;
      if (v28 > 180.0)
      {
        double v29 = -360.0;
        goto LABEL_14;
      }
LABEL_15:
      v31 = -[GEOLatLng initWithCoordinate:]([GEOLatLng alloc], "initWithCoordinate:", v17, v30);
      [v24 addObject:v31];

      double v28 = v6 + v28;
      if (v28 - v27 >= 0.00000000999999994) {
        goto LABEL_16;
      }
    }
    double v29 = 360.0;
LABEL_14:
    double v30 = v28 + v29;
    goto LABEL_15;
  }
LABEL_17:

  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 104);
  *(void *)(v32 + 104) = v24;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "setTotalUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "count") + 1);
  [*(id *)(*(void *)(a1 + 32) + 96) setCompletedUnitCount:1];
  v34 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v34();
}

- (void)_downloadNextShiftFunction
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_isRunning)
  {
    double v3 = [(NSMutableArray *)self->_needCoordinates lastObject];
    [(NSMutableArray *)self->_needCoordinates removeLastObject];
    if (v3)
    {
      objc_initWeak(&location, self);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __75__GEOMapDataSubscriptionShiftFunctionDownloader__downloadNextShiftFunction__block_invoke;
      v4[3] = &unk_1E53E1B70;
      v4[4] = self;
      objc_copyWeak(&v5, &location);
      [(GEOMapDataSubscriptionShiftFunctionDownloader *)self _fetchShiftFunctionFor:v3 completion:v4];
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
    else
    {
      [(GEOMapDataSubscriptionShiftFunctionDownloader *)self _finishWithError:0];
    }
  }
}

void __75__GEOMapDataSubscriptionShiftFunctionDownloader__downloadNextShiftFunction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 64));
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 88))
  {
    objc_msgSend(*(id *)(v5 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(v5 + 96), "completedUnitCount") + 1);
    if (a2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained _downloadNextShiftFunction];
    }
    else
    {
      uint64_t v7 = (uint64_t)v8;
      if (!v8)
      {
        uint64_t v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"Could not fetch function"];
      }
      id v8 = (id)v7;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained _finishWithError:v8];
    }
  }
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (GEOMapDataSubscriptionDataDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GEOMapDataSubscriptionDataDownloaderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needCoordinates, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_shifter, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_subscription, 0);
}

@end