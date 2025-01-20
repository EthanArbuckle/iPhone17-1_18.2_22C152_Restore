@interface GEOProactiveTileDownloader
+ (BOOL)_canUseBGST;
+ (BOOL)shouldDownloadTileType:(int)a3;
+ (unint64_t)maximumDownloadBatchSize;
- (GEOProactiveTileDownloader)init;
- (GEOProactiveTileDownloader)initWithDelegate:(id)a3 delegateQueue:(id)a4 diskCache:(id)a5 tileRequesterClasses:(id)a6 backgroundTask:(id)a7;
- (GEOProactiveTileDownloader)initWithDelegate:(id)a3 delegateQueue:(id)a4 diskCache:(id)a5 tileRequesterClasses:(id)a6 manifestManager:(id)a7 requestCounter:(id)a8 downloaders:(id)a9 policyEnabledOverrides:(id)a10 backgroundTask:(id)a11;
- (void)_clearPowerAssertion;
- (void)_dispatchExpirationHandlerToIsolationQueue;
- (void)_finish;
- (void)_start;
- (void)_startNextDownloader;
- (void)_submitBGST;
- (void)_takePowerAssertionIfNecessary;
- (void)_taskFired;
- (void)cancel;
- (void)dataSourceDidFinish:(id)a3;
- (void)start;
- (void)taskFired:(id)a3;
@end

@implementation GEOProactiveTileDownloader

+ (unint64_t)maximumDownloadBatchSize
{
  return GEOConfigGetUInteger(GeoServicesConfig_CellSaverBatchSize, (uint64_t)off_1E9114188);
}

+ (BOOL)_canUseBGST
{
  return 1;
}

+ (BOOL)shouldDownloadTileType:(int)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%i", *(void *)&a3);
  v5 = _getValue(GeoServicesConfig_CellSaverTileTypeEnabled, (uint64_t)off_1E9114838, 1, 0, 0, 0);
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 1;
    if ((a3 > 0x3D || ((1 << a3) & 0x3C60800040500802) == 0)
      && ((a3 - 66) > 0x1C || ((1 << (a3 - 66)) & 0x1000F387) == 0))
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (GEOProactiveTileDownloader)init
{
  result = (GEOProactiveTileDownloader *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOProactiveTileDownloader)initWithDelegate:(id)a3 delegateQueue:(id)a4 diskCache:(id)a5 tileRequesterClasses:(id)a6 backgroundTask:(id)a7
{
  return [(GEOProactiveTileDownloader *)self initWithDelegate:a3 delegateQueue:a4 diskCache:a5 tileRequesterClasses:a6 manifestManager:0 requestCounter:0 downloaders:0 policyEnabledOverrides:0 backgroundTask:a7];
}

- (GEOProactiveTileDownloader)initWithDelegate:(id)a3 delegateQueue:(id)a4 diskCache:(id)a5 tileRequesterClasses:(id)a6 manifestManager:(id)a7 requestCounter:(id)a8 downloaders:(id)a9 policyEnabledOverrides:(id)a10 backgroundTask:(id)a11
{
  id v17 = a3;
  id v44 = a4;
  id v43 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v42 = a9;
  id v21 = a10;
  id v41 = a11;
  v48.receiver = self;
  v48.super_class = (Class)GEOProactiveTileDownloader;
  v22 = [(GEOProactiveTileDownloader *)&v48 init];
  if (v22)
  {
    v40 = v21;
    v23 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v24 = [v23 UUIDString];
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSString *)v24;

    uint64_t v26 = geo_dispatch_queue_create_with_workloop_qos();
    isolationQueue = v22->_isolationQueue;
    v22->_isolationQueue = (OS_dispatch_queue *)v26;

    uint64_t v28 = geo_isolater_create();
    activityIsolation = v22->_activityIsolation;
    v22->_activityIsolation = (geo_isolater *)v28;

    objc_storeWeak((id *)&v22->_delegate, v17);
    objc_storeStrong((id *)&v22->_delegateQueue, a4);
    objc_storeStrong((id *)&v22->_diskCache, a5);
    uint64_t v30 = [v18 copy];
    tileRequesterClasses = v22->_tileRequesterClasses;
    v22->_tileRequesterClasses = (NSMapTable *)v30;

    if (v19)
    {
      v32 = (GEOResourceManifestManager *)v19;
    }
    else
    {
      v32 = +[GEOResourceManifestManager modernManager];
    }
    manifestManager = v22->_manifestManager;
    v22->_manifestManager = v32;

    id v21 = v40;
    if (v20)
    {
      v34 = (GEORequestCounter *)v20;
    }
    else
    {
      v34 = +[GEORequestCounter sharedCounter];
    }
    requestCounter = v22->_requestCounter;
    v22->_requestCounter = v34;

    objc_storeStrong((id *)&v22->_testDownloaders, a9);
    uint64_t v36 = [v40 copy];
    testPolicyEnabledOverrides = v22->_testPolicyEnabledOverrides;
    v22->_testPolicyEnabledOverrides = (NSDictionary *)v36;

    v22->_didStart.lock._os_unfair_lock_opaque = 0;
    v22->_didStart.didRun = 0;
    v22->_didFinish.lock._os_unfair_lock_opaque = 0;
    v22->_didFinish.didRun = 0;
    v22->_didSubmitBGST.lock._os_unfair_lock_opaque = 0;
    v22->_didSubmitBGST.didRun = 0;
    objc_storeStrong((id *)&v22->_taskToComplete, a11);
    if (v22->_taskToComplete)
    {
      objc_initWeak(&location, v22);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __173__GEOProactiveTileDownloader_initWithDelegate_delegateQueue_diskCache_tileRequesterClasses_manifestManager_requestCounter_downloaders_policyEnabledOverrides_backgroundTask___block_invoke;
      v45[3] = &unk_1E53D7B90;
      objc_copyWeak(&v46, &location);
      [(BGSystemTask *)v22->_taskToComplete setExpirationHandler:v45];
      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
    }
    v38 = v22;
  }

  return v22;
}

void __173__GEOProactiveTileDownloader_initWithDelegate_delegateQueue_diskCache_tileRequesterClasses_manifestManager_requestCounter_downloaders_policyEnabledOverrides_backgroundTask___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchExpirationHandlerToIsolationQueue];
}

- (void)_takePowerAssertionIfNecessary
{
  if (GEOConfigGetBOOL(GeoServicesConfig_CellSaverShouldTakePowerAssertion, (uint64_t)off_1E9114198))
  {
    v3 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Taking power assertion", v7, 2u);
    }

    v4 = [GEOPowerAssertion alloc];
    v5 = [(GEOPowerAssertion *)v4 initWithType:1 identifier:@"com.apple.geod.OpportunisticTileDownload" timeout:GEOConfigGetDouble(GeoServicesConfig_CellSaverPowerAssertionTimeout, (uint64_t)off_1E91141A8)];
    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = v5;
  }
}

- (void)_clearPowerAssertion
{
  if (self->_powerAssertion)
  {
    v3 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Clearing power assertion", v5, 2u);
    }

    powerAssertion = self->_powerAssertion;
    self->_powerAssertion = 0;
  }
}

- (void)start
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __35__GEOProactiveTileDownloader_start__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didStart, v2);
}

void __35__GEOProactiveTileDownloader_start__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__GEOProactiveTileDownloader_start__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __35__GEOProactiveTileDownloader_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__GEOProactiveTileDownloader_cancel__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didFinish, v2);
}

void __36__GEOProactiveTileDownloader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__GEOProactiveTileDownloader_cancel__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __36__GEOProactiveTileDownloader_cancel__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearPowerAssertion];
  [*(id *)(*(void *)(a1 + 32) + 112) cancel];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__GEOProactiveTileDownloader_cancel__block_invoke_3;
  block[3] = &unk_1E53D79D8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __36__GEOProactiveTileDownloader_cancel__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained proactiveTileDownloaderDidFinish:*(void *)(a1 + 32)];
}

- (void)_submitBGST
{
  if (BackgroundSystemTasksLibraryCore())
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__GEOProactiveTileDownloader__submitBGST__block_invoke;
    v3[3] = &unk_1E53D79D8;
    v3[4] = self;
    GEOOnce((uint64_t)&self->_didSubmitBGST, v3);
  }
}

void __41__GEOProactiveTileDownloader__submitBGST__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [getBGSystemTaskSchedulerClass() sharedScheduler];
  uint64_t v1 = [v0 taskRequestForIdentifier:@"com.apple.geod.OpportunisticTileDownloader"];
  uint64_t v2 = (void *)[objc_alloc((Class)getBGNonRepeatingSystemTaskRequestClass()) initWithIdentifier:@"com.apple.geod.OpportunisticTileDownloader"];
  [v2 setPriority:1];
  [v2 setRequiresExternalPower:1];
  [v2 setRequiresUserInactivity:1];
  [v2 setExpectedDuration:300.0];
  if (GEOConfigGetBOOL(GeoServicesConfig_ProactiveDataLoadingDiskIntensive, (uint64_t)off_1E91141C8)) {
    [v2 setResourceIntensive:1];
  }
  [v2 setRequiresProtectionClass:3];
  [v2 setRequiresNetworkConnectivity:1];
  [v2 setRequiresInexpensiveNetworkConnectivity:1];
  if ((unint64_t)GEOConfigGetUInteger(GeoServicesConfig_ProactiveDataLoadingMinBatteryLevel, (uint64_t)off_1E91141D8) > 0x63)
  {
    uint64_t UInteger = 100;
    goto LABEL_7;
  }
  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_ProactiveDataLoadingMinBatteryLevel, (uint64_t)off_1E91141D8);
  if (UInteger) {
LABEL_7:
  }
    [v2 setRequiresMinimumBatteryLevel:UInteger];
  [v2 setNetworkDownloadSize:20971520];
  if (v1)
  {
    v11 = 0;
    char v4 = [v0 updateTaskRequest:v2 error:&v11];
    v5 = v11;
  }
  else
  {
    v10 = 0;
    char v4 = [v0 submitTaskRequest:v2 error:&v10];
    v5 = v10;
  }
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    char v7 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = "update";
      if (!v1) {
        v8 = "submit";
      }
      v9 = @"Unknown";
      if (v6) {
        v9 = v6;
      }
      *(_DWORD *)buf = 136315394;
      v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "Failed to %s nonrepeating task with error: %@", buf, 0x16u);
    }
  }
}

- (void)_dispatchExpirationHandlerToIsolationQueue
{
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__GEOProactiveTileDownloader__dispatchExpirationHandlerToIsolationQueue__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

void __72__GEOProactiveTileDownloader__dispatchExpirationHandlerToIsolationQueue__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = GEOGetProactiveTileDownloadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "BGST received expiration notice. Pausing until criteria are met again.", buf, 2u);
  }

  [*(id *)(a1 + 32) _clearPowerAssertion];
  [*(id *)(*(void *)(a1 + 32) + 112) pause];
  v3 = *(void **)(*(void *)(a1 + 32) + 144);
  id v9 = 0;
  char v4 = [v3 setTaskExpiredWithRetryAfter:&v9 error:0.0];
  id v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Failed to set retry with error %@.", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 144) setTaskCompleted];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 144);
    *(void *)(v7 + 144) = 0;
  }
}

- (void)taskFired:(id)a3
{
  id v5 = a3;
  if (self->_taskToComplete && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    LOWORD(location[0]) = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _taskToComplete == nil", (uint8_t *)location, 2u);
  }
  objc_storeStrong((id *)&self->_taskToComplete, a3);
  objc_initWeak(location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__GEOProactiveTileDownloader_taskFired___block_invoke;
  v8[3] = &unk_1E53D7B90;
  objc_copyWeak(&v9, location);
  [(BGSystemTask *)self->_taskToComplete setExpirationHandler:v8];
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__GEOProactiveTileDownloader_taskFired___block_invoke_2;
  v7[3] = &unk_1E53D79D8;
  v7[4] = self;
  dispatch_async_and_wait(isolationQueue, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

void __40__GEOProactiveTileDownloader_taskFired___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchExpirationHandlerToIsolationQueue];
}

uint64_t __40__GEOProactiveTileDownloader_taskFired___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _taskFired];
}

- (void)_taskFired
{
  v3 = GEOGetProactiveTileDownloadLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_INFO, "XPC activity's criteria have been met. Starting/resuming downloads", v5, 2u);
  }

  [(GEOProactiveTileDownloader *)self _takePowerAssertionIfNecessary];
  currentDownloader = self->_currentDownloader;
  if (currentDownloader) {
    [(GEOOpportunisticDataSource *)currentDownloader resume];
  }
  else {
    [(GEOProactiveTileDownloader *)self _startNextDownloader];
  }
}

- (void)_start
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableArray *)[&unk_1ED73EC98 mutableCopy];
  remainingPolicies = self->_remainingPolicies;
  self->_remainingPolicies = v3;

  *(_WORD *)self->_policyEnabled = 0;
  policyEnabled = self->_policyEnabled;
  self->_policyEnabled[2] = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v6 = self->_remainingPolicies;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = [*(id *)(*((void *)&v36 + 1) + 8 * v10) unsignedIntegerValue];
        if (v11 >= 3)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: policy < GEOProactiveTileDownloadPolicyCount", buf, 2u);
          }
        }
        else
        {
          uint64_t v12 = v11;
          testPolicyEnabledOverrides = self->_testPolicyEnabledOverrides;
          __int16 v14 = [NSNumber numberWithUnsignedInteger:v11];
          v15 = [(NSDictionary *)testPolicyEnabledOverrides objectForKeyedSubscript:v14];

          if (v15)
          {
            uint64_t v16 = self->_testPolicyEnabledOverrides;
            id v17 = [NSNumber numberWithUnsignedInteger:v12];
            id v18 = [(NSDictionary *)v16 objectForKeyedSubscript:v17];
            policyEnabled[v12] = [v18 BOOLValue];
          }
          else
          {
            policyEnabled[v12] = GEOProactiveTileDownloadPolicyIsEnabled(v12);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v19 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v36 objects:v43 count:16];
      uint64_t v8 = v19;
    }
    while (v19);
  }

  id v20 = GEOGetProactiveTileDownloadLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

  if (v21)
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = self->_remainingPolicies;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v33 != v26) {
            objc_enumerationMutation(v23);
          }
          unint64_t v28 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "unsignedIntegerValue", (void)v32);
          if (policyEnabled[v28])
          {
            v29 = GEOProactiveTileDownloadPolicyAsString(v28);
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v25);
    }

    uint64_t v30 = [v22 componentsJoinedByString:@" + "];
    v31 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v41 = v30;
      _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_DEBUG, "Will download tiles with the following policies: %{public}@", buf, 0xCu);
    }
  }
  if (+[GEOProactiveTileDownloader _canUseBGST]
    && !self->_taskToComplete)
  {
    [(GEOProactiveTileDownloader *)self _submitBGST];
  }
  else
  {
    [(GEOProactiveTileDownloader *)self _startNextDownloader];
  }
}

- (void)_finish
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__GEOProactiveTileDownloader__finish__block_invoke;
  v2[3] = &unk_1E53D79D8;
  v2[4] = self;
  GEOOnce((uint64_t)&self->_didFinish, v2);
}

void __37__GEOProactiveTileDownloader__finish__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearPowerAssertion];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__GEOProactiveTileDownloader__finish__block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = v2;
  dispatch_async(v3, block);
}

void __37__GEOProactiveTileDownloader__finish__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = GEOGetProactiveTileDownloadLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v2, OS_LOG_TYPE_INFO, "Done.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained proactiveTileDownloaderDidFinish:*(void *)(a1 + 32)];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__GEOProactiveTileDownloader__finish__block_invoke_31;
  block[3] = &unk_1E53D79D8;
  block[4] = v4;
  dispatch_async(v5, block);
}

void __37__GEOProactiveTileDownloader__finish__block_invoke_31(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 144) setTaskCompleted];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;
}

- (void)_startNextDownloader
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_remainingPolicies count]) {
    goto LABEL_5;
  }
  while (1)
  {
    v3 = [(NSMutableArray *)self->_remainingPolicies firstObject];
    unint64_t v4 = [v3 unsignedIntegerValue];
    [(NSMutableArray *)self->_remainingPolicies removeObjectAtIndex:0];
    if (v4 <= 2 && self->_policyEnabled[v4]) {
      break;
    }

    if (![(NSMutableArray *)self->_remainingPolicies count]) {
      goto LABEL_5;
    }
  }
  if (v3)
  {
    v6 = self->_tileRequesterClasses;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__GEOProactiveTileDownloader__startNextDownloader__block_invoke;
    v15[3] = &unk_1E53DF070;
    uint64_t v7 = v6;
    uint64_t v16 = v7;
    uint64_t v8 = (void *)MEMORY[0x18C120660](v15);
    uint64_t v9 = [v3 unsignedIntegerValue];
    uint64_t v10 = [(NSDictionary *)self->_testDownloaders objectForKeyedSubscript:v3];
    if (v10
      || (_GEOCreateOpportunisticDataSource(v9, self->_uniqueIdentifier, self->_manifestManager, self->_diskCache, self->_requestCounter, v8), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [v10 setDelegate:self];
      [v10 setDelegateQueue:self->_isolationQueue];
      unint64_t v11 = GEOGetProactiveTileDownloadLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = GEOProactiveTileDownloadPolicyAsString(v9);
        *(_DWORD *)buf = 138543618;
        id v18 = v12;
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_INFO, "Starting download for policy: %{public}@ (%{public}@)", buf, 0x16u);
      }
      currentDownloader = self->_currentDownloader;
      self->_currentPolicy = v9;
      self->_currentDownloader = (GEOOpportunisticDataSource *)v10;
      id v14 = v10;

      [(GEOOpportunisticDataSource *)self->_currentDownloader resume];
    }
    else
    {
      [(GEOProactiveTileDownloader *)self _startNextDownloader];
    }
  }
  else
  {
LABEL_5:
    id v5 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_INFO, "No remaining download policies. Finished.", buf, 2u);
    }

    [(GEOProactiveTileDownloader *)self _finish];
  }
}

objc_class *__50__GEOProactiveTileDownloader__startNextDownloader__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void **)(a1 + 32);
  v13 = [NSNumber numberWithUnsignedInt:a2];
  id v14 = (objc_class *)[v12 objectForKey:v13];

  if (v14) {
    id v14 = (objc_class *)[[v14 alloc] initWithTileRequest:v9 delegateQueue:v10 delegate:v11];
  }

  return v14;
}

- (void)dataSourceDidFinish:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_currentDownloader == a3)
  {
    unint64_t v4 = GEOGetProactiveTileDownloadLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = GEOProactiveTileDownloadPolicyAsString(self->_currentPolicy);
      currentDownloader = self->_currentDownloader;
      int v8 = 138543618;
      id v9 = v5;
      __int16 v10 = 2114;
      id v11 = currentDownloader;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_INFO, "Finished downloads for policy: %{public}@ (%{public}@)", (uint8_t *)&v8, 0x16u);
    }
    uint64_t v7 = self->_currentDownloader;
    self->_currentDownloader = 0;

    [(GEOProactiveTileDownloader *)self _startNextDownloader];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIsolation, 0);
  objc_storeStrong((id *)&self->_testPolicyEnabledOverrides, 0);
  objc_storeStrong((id *)&self->_taskToComplete, 0);
  objc_storeStrong((id *)&self->_tileRequesterClasses, 0);
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_currentDownloader, 0);
  objc_storeStrong((id *)&self->_remainingPolicies, 0);
  objc_storeStrong((id *)&self->_testDownloaders, 0);
  objc_storeStrong((id *)&self->_requestCounter, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end