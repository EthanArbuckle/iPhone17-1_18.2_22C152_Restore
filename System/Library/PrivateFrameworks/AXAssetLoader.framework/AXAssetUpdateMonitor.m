@interface AXAssetUpdateMonitor
+ (id)assetMonitorWithPolicy:(id)a3;
+ (id)assetMonitorWithPolicy:(id)a3 qosClass:(unsigned int)a4;
+ (id)assetMonitorWithPolicy:(id)a3 qosClass:(unsigned int)a4 targetQueue:(id)a5;
- (AXAssetController)assetController;
- (AXAssetPolicy)assetPolicy;
- (BOOL)hasInProgressDownloads;
- (BOOL)userInitiated;
- (NSString)description;
- (id)_initWithAssetPolicy:(id)a3 qosClass:(unsigned int)a4 targetQueue:(id)a5;
- (id)_purgeUnneededAssetsFromInstalledAssets:(id)a3;
- (void)_performWithinLock:(id)a3;
- (void)_updateCachedInstalledAssets:(id)a3;
- (void)_workerQueue_refreshAssetsAfterDelay:(double)a3 canRefreshCatalog:(BOOL)a4;
- (void)addUpdateObserver:(id)a3;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)logInfo:(id)a3;
- (void)refreshAssetsAfterDelay:(double)a3;
- (void)removeUpdateObserver:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)stop;
@end

@implementation AXAssetUpdateMonitor

+ (id)assetMonitorWithPolicy:(id)a3
{
  id v3 = a3;
  v4 = [AXAssetUpdateMonitor alloc];
  id v5 = [(AXAssetUpdateMonitor *)v4 _initWithAssetPolicy:v3 qosClass:33 targetQueue:MEMORY[0x1E4F14428]];

  return v5;
}

+ (id)assetMonitorWithPolicy:(id)a3 qosClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [AXAssetUpdateMonitor alloc];
  id v7 = [(AXAssetUpdateMonitor *)v6 _initWithAssetPolicy:v5 qosClass:v4 targetQueue:MEMORY[0x1E4F14428]];

  return v7;
}

+ (id)assetMonitorWithPolicy:(id)a3 qosClass:(unsigned int)a4 targetQueue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[AXAssetUpdateMonitor alloc] _initWithAssetPolicy:v8 qosClass:v5 targetQueue:v7];

  return v9;
}

- (id)_initWithAssetPolicy:(id)a3 qosClass:(unsigned int)a4 targetQueue:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AXAssetUpdateMonitor;
  v10 = [(AXAssetUpdateMonitor *)&v21 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    updateObservers = v10->_updateObservers;
    v10->_updateObservers = (NSHashTable *)v11;

    uint64_t v13 = +[AXAssetController assetControllerWithPolicy:v8 qosClass:v6];
    assetController = v10->_assetController;
    v10->_assetController = (AXAssetController *)v13;

    [(AXAssetController *)v10->_assetController addObserver:v10];
    if (v9)
    {
      v15 = (OS_dispatch_queue *)v9;
      workerQueue = v10->_workerQueue;
      v10->_workerQueue = v15;
    }
    else
    {
      v17 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)v6, 0);
      workerQueue = dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

      dispatch_queue_t v18 = dispatch_queue_create("AXAssetUpdateMonitor", workerQueue);
      v19 = v10->_workerQueue;
      v10->_workerQueue = (OS_dispatch_queue *)v18;
    }
    [(AXAssetUpdateMonitor *)v10 logInfo:@"setting up asset update monitor"];
  }

  return v10;
}

- (void)logInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AXLogAssetLoader();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(AXAssetUpdateMonitor *)self assetPolicy];
    id v7 = [v6 assetType];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "[%@]: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(AXAssetUpdateMonitor *)self assetPolicy];
  uint64_t v5 = [v3 stringWithFormat:@"AXAssetUpdateMonitor<%p>, %@", self, v4];

  return (NSString *)v5;
}

- (AXAssetPolicy)assetPolicy
{
  return [(AXAssetController *)self->_assetController assetPolicy];
}

- (BOOL)userInitiated
{
  return [(AXAssetController *)self->_assetController userInitiated];
}

- (void)setUserInitiated:(BOOL)a3
{
}

- (BOOL)hasInProgressDownloads
{
  return [(AXAssetController *)self->_assetController hasInProgressDownloads];
}

- (void)refreshAssetsAfterDelay:(double)a3
{
  workerQueue = self->_workerQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__AXAssetUpdateMonitor_refreshAssetsAfterDelay___block_invoke;
  v4[3] = &unk_1E6C42040;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workerQueue, v4);
}

uint64_t __48__AXAssetUpdateMonitor_refreshAssetsAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workerQueue_refreshAssetsAfterDelay:canRefreshCatalog:", 1, *(double *)(a1 + 40));
}

- (void)stop
{
  [(AXAssetUpdateMonitor *)self logInfo:@"stopping refresh timer"];
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__AXAssetUpdateMonitor_stop__block_invoke;
  block[3] = &unk_1E6C42068;
  block[4] = self;
  dispatch_async(workerQueue, block);
}

uint64_t __28__AXAssetUpdateMonitor_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) cancel];
}

- (void)addUpdateObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy_;
    v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__AXAssetUpdateMonitor_addUpdateObserver___block_invoke;
    v7[3] = &unk_1E6C42090;
    v7[4] = self;
    id v6 = v4;
    id v8 = v6;
    id v9 = &v10;
    [(AXAssetUpdateMonitor *)self _performWithinLock:v7];
    [(AXAssetController *)self->_assetController addObserver:v6];
    if (v11[5]) {
      objc_msgSend(v6, "assetUpdateMonitor:installedAssetsDidChange:", self);
    }

    _Block_object_dispose(&v10, 8);
  }
}

void __42__AXAssetUpdateMonitor_addUpdateObserver___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) addObject:a1[5]];
  v2 = *(void **)(a1[4] + 24);
  id v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (void)removeUpdateObserver:(id)a3
{
  id v4 = a3;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __45__AXAssetUpdateMonitor_removeUpdateObserver___block_invoke;
  id v9 = &unk_1E6C420B8;
  uint64_t v10 = self;
  id v11 = v4;
  id v5 = v4;
  [(AXAssetUpdateMonitor *)self _performWithinLock:&v6];
  -[AXAssetController removeObserver:](self->_assetController, "removeObserver:", v5, v6, v7, v8, v9, v10);
}

uint64_t __45__AXAssetUpdateMonitor_removeUpdateObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (void)_updateCachedInstalledAssets:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v17 = 0;
  dispatch_queue_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  objc_super v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__AXAssetUpdateMonitor__updateCachedInstalledAssets___block_invoke;
  v14[3] = &unk_1E6C42090;
  v14[4] = self;
  id v5 = v4;
  id v15 = v5;
  v16 = &v17;
  [(AXAssetUpdateMonitor *)self _performWithinLock:v14];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v18[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "assetUpdateMonitor:installedAssetsDidChange:", self, v5, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v23 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __53__AXAssetUpdateMonitor__updateCachedInstalledAssets___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  return MEMORY[0x1F41817F8]();
}

- (void)_performWithinLock:(id)a3
{
  if (a3)
  {
    p_assetsLock = &self->_assetsLock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_assetsLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_assetsLock);
  }
}

- (void)_workerQueue_refreshAssetsAfterDelay:(double)a3 canRefreshCatalog:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workerQueue);
  refreshDispatchTimer = self->_refreshDispatchTimer;
  if (!refreshDispatchTimer)
  {
    uint64_t v8 = (AXDispatchTimer *)[objc_alloc(MEMORY[0x1E4F48318]) initWithTargetSerialQueue:0];
    uint64_t v9 = self->_refreshDispatchTimer;
    self->_refreshDispatchTimer = v8;

    refreshDispatchTimer = self->_refreshDispatchTimer;
  }
  [(AXDispatchTimer *)refreshDispatchTimer cancel];
  long long v10 = objc_msgSend(NSString, "stringWithFormat:", @"refreshing assets after delay: %.1f seconds", *(void *)&a3);
  [(AXAssetUpdateMonitor *)self logInfo:v10];

  objc_initWeak(&location, self);
  long long v11 = self->_refreshDispatchTimer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__AXAssetUpdateMonitor__workerQueue_refreshAssetsAfterDelay_canRefreshCatalog___block_invoke;
  v12[3] = &unk_1E6C420E0;
  objc_copyWeak(&v13, &location);
  BOOL v14 = a4;
  [(AXDispatchTimer *)v11 afterDelay:v12 processBlock:a3];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __79__AXAssetUpdateMonitor__workerQueue_refreshAssetsAfterDelay_canRefreshCatalog___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained assetController];
  [v2 refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:*(unsigned __int8 *)(a1 + 40) catalogRefreshOverrideTimeout:0 completion:0];
}

- (id)_purgeUnneededAssetsFromInstalledAssets:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"installed assets: %@", v5];
  [(AXAssetUpdateMonitor *)self logInfo:v6];

  uint64_t v7 = [(AXAssetUpdateMonitor *)self assetPolicy];
  uint64_t v8 = [v7 assetsToPurgeFromInstalledAssets:v5];

  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];

  [v9 removeObjectsInArray:v8];
  long long v10 = [NSString stringWithFormat:@"keeping assets: %@", v9];
  [(AXAssetUpdateMonitor *)self logInfo:v10];

  long long v11 = [NSString stringWithFormat:@"purging assets: %@", v8];
  [(AXAssetUpdateMonitor *)self logInfo:v11];

  if ([v8 count]) {
    [(AXAssetController *)self->_assetController purgeAssets:v8 completion:0];
  }

  return v9;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    id v13 = objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
    BOOL v14 = [(AXAssetUpdateMonitor *)self _purgeUnneededAssetsFromInstalledAssets:v13];

    [(AXAssetUpdateMonitor *)self _updateCachedInstalledAssets:v14];
    id v15 = [(AXAssetUpdateMonitor *)self assetPolicy];
    v16 = [v15 assetsToDownloadFromRefreshedAssets:v11];

    uint64_t v17 = [NSString stringWithFormat:@"assets to download: %@", v16];
    [(AXAssetUpdateMonitor *)self logInfo:v17];

    uint64_t v18 = [v16 count];
    uint64_t v19 = [(AXAssetController *)self->_assetController assetPolicy];
    v20 = v19;
    if (v18)
    {
      [v19 downloadRetryInterval];
      id v22 = v21;

      objc_initWeak(&location, self);
      assetController = self->_assetController;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __86__AXAssetUpdateMonitor_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2;
      v24[3] = &unk_1E6C42108;
      objc_copyWeak(v25, &location);
      v25[1] = v22;
      [(AXAssetController *)assetController downloadAssets:v16 successStartBlock:v24];
      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
    }
    else
    {
      [v19 updateInterval];
      -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:");
    }
  }
  else
  {
    BOOL v14 = [(AXAssetController *)self->_assetController assetPolicy];
    [v14 refreshRetryInterval];
    -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:");
  }
}

uint64_t __86__AXAssetUpdateMonitor_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled];
}

void __86__AXAssetUpdateMonitor_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained refreshAssetsAfterDelay:*(double *)(a1 + 40)];
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v9 = a5;
  id v15 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!a7)
  {
    if (v9)
    {
      [(AXAssetUpdateMonitor *)self refreshAssetsAfterDelay:0.0];
    }
    else
    {
      BOOL v14 = [(AXAssetController *)self->_assetController assetPolicy];
      [v14 refreshRetryInterval];
      -[AXAssetUpdateMonitor refreshAssetsAfterDelay:](self, "refreshAssetsAfterDelay:");
    }
  }
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_refreshDispatchTimer, 0);
  objc_storeStrong((id *)&self->_cachedInstalledAssets, 0);
  objc_storeStrong((id *)&self->_updateObservers, 0);
}

@end