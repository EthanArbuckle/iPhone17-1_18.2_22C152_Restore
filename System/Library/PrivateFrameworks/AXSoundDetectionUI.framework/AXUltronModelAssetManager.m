@interface AXUltronModelAssetManager
+ (AXUltronModelAssetManager)sharedInstance;
- (AXUltronModelAssetManager)init;
- (BOOL)hasInProgressDownloads;
- (BOOL)isAssetCatalogInstalled;
- (BOOL)isAssetDownloadStalled;
- (BOOL)isKShotAsset:(id)a3;
- (BOOL)isKShotUsingSoundPrint;
- (NSMutableArray)cachedAXAssets;
- (OS_dispatch_queue)assetDownloadQueue;
- (id)_filterAssetsToCache:(id)a3;
- (id)_supportedTypesFromAssets:(id)a3;
- (id)localPathForKShotGeneralApplianceDetector;
- (id)localPathForKShotHallucinator;
- (id)localPathForKShotModelWeights;
- (id)localURLForDetector:(id)a3;
- (int64_t)_expectedCurrentlyDownloadingSize;
- (int64_t)_totalBytesOfAllAssetsWritten;
- (int64_t)_totalExpectedTimeOfAllAssets;
- (int64_t)assetStatus;
- (int64_t)expectedDownloadSize;
- (int64_t)previousReportedSize;
- (int64_t)totalSizeExpected;
- (int64_t)totalSizeOccupied;
- (void)_cacheAsset:(id)a3;
- (void)_downloadAssets;
- (void)_resetDownloadTracking;
- (void)_updateDownloadingAsset:(id)a3 totalBytesWritten:(int64_t)a4 isStalled:(BOOL)a5 expectedTimeRemaining:(double)a6;
- (void)addObserver:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)downloadAssets:(id)a3;
- (void)notifyAssetsNotReady;
- (void)notifyAssetsReady;
- (void)notifyAssetsState;
- (void)notifyDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 totalRemainingTime:(double)a5 isStalled:(BOOL)a6;
- (void)notifyPurgeAssets:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5;
- (void)notifyRefreshAssets:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5;
- (void)purgeAssets:(id)a3;
- (void)refresh;
- (void)refreshAssetsUpdatingCatalogIfNeeded:(BOOL)a3;
- (void)removeObserver:(id)a3;
- (void)setAssetDownloadQueue:(id)a3;
- (void)setCachedAXAssets:(id)a3;
- (void)setExpectedDownloadSize:(int64_t)a3;
- (void)setPreviousReportedSize:(int64_t)a3;
- (void)stopDownloadingAssets;
@end

@implementation AXUltronModelAssetManager

+ (AXUltronModelAssetManager)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1) {
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance__Shared;
  return (AXUltronModelAssetManager *)v2;
}

uint64_t __43__AXUltronModelAssetManager_sharedInstance__block_invoke()
{
  sharedInstance__Shared = objc_alloc_init(AXUltronModelAssetManager);
  return MEMORY[0x270F9A758]();
}

- (AXUltronModelAssetManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)AXUltronModelAssetManager;
  v2 = [(AXUltronModelAssetManager *)&v22 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetsTotalBytesWritten = v2->_assetsTotalBytesWritten;
    v2->_assetsTotalBytesWritten = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetsTotalTimeExpected = v2->_assetsTotalTimeExpected;
    v2->_assetsTotalTimeExpected = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetDownloadStalled = v2->_assetDownloadStalled;
    v2->_assetDownloadStalled = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetsDownloading = v2->_assetsDownloading;
    v2->_assetsDownloading = v11;

    v2->_previousReportedSize = 0;
    v2->_expectedDownloadSize = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedAssets = v2->_cachedAssets;
    v2->_cachedAssets = v13;

    v15 = (void *)MEMORY[0x263F21140];
    v16 = [MEMORY[0x263F21188] policy];
    uint64_t v17 = [v15 assetControllerWithPolicy:v16 qosClass:25];
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v17;

    [(AXAssetController *)v2->_assetController addObserver:v2];
    [(AXAssetController *)v2->_assetController setUserInitiated:1];
    dispatch_queue_t v19 = dispatch_queue_create("AXUltronModelAssetManagerDownloadQueue", 0);
    assetDownloadQueue = v2->_assetDownloadQueue;
    v2->_assetDownloadQueue = (OS_dispatch_queue *)v19;
  }
  return v2;
}

- (void)_resetDownloadTracking
{
  [(NSMutableDictionary *)self->_assetDownloadStalled removeAllObjects];
  [(NSMutableDictionary *)self->_assetsTotalTimeExpected removeAllObjects];
  [(NSMutableDictionary *)self->_assetsTotalBytesWritten removeAllObjects];
  assetsDownloading = self->_assetsDownloading;
  [(NSMutableDictionary *)assetsDownloading removeAllObjects];
}

- (BOOL)isKShotAsset:(id)a3
{
  id v3 = a3;
  v4 = [v3 ultronModelName];
  if ([v4 isEqualToString:*MEMORY[0x263F21CF8]])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v3 ultronModelName];
    if ([v6 isEqualToString:*MEMORY[0x263F21D00]])
    {
      char v5 = 1;
    }
    else
    {
      v7 = [v3 ultronModelName];
      char v5 = [v7 isEqualToString:*MEMORY[0x263F21CF0]];
    }
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  char v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXUltronModelAssetManager addObserver:]();
  }

  if (([(NSMutableArray *)self->_observers containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_observers addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_observers, "containsObject:")) {
    [(NSMutableArray *)self->_observers removeObject:v4];
  }
}

- (void)notifyAssetsReady
{
  [*(id *)(a1 + 8) count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v1, v2, "Notifying Assets Ready to %lu observers", v3, v4, v5, v6, v7);
}

- (void)notifyAssetsNotReady
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_observers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "assetsNotReadyForUltronManager:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)notifyDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 totalRemainingTime:(double)a5 isStalled:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v11 = self->_observers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "assetManager:totalSizeExpected:downloadProgressTotalWritten:remainingTimeExpected:isStalled:", self, a4, a3, v6, a5, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  self->_previousReportedSize = a3;
  self->_expectedDownloadSize = a4;
}

- (void)notifyRefreshAssets:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  long long v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AXUltronModelAssetManager notifyAssetsReady]((uint64_t)self);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v11 = self->_observers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "assetManager:didFinishRefreshingAssets:wasSuccessful:error:", self, v8, v6, v9, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)notifyPurgeAssets:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  long long v10 = AXLogUltron();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AXUltronModelAssetManager notifyPurgeAssets:wasSuccessful:error:]((uint64_t)self);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v11 = self->_observers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "assetManager:didFinishPurgingAssets:wasSuccessful:error:", self, v8, v6, v9, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)notifyAssetsState
{
  switch([(AXUltronModelAssetManager *)self assetStatus])
  {
    case 0:
    case 1:
      [(AXUltronModelAssetManager *)self notifyAssetsNotReady];
      break;
    case 2:
      int64_t v3 = [(AXUltronModelAssetManager *)self _totalBytesOfAllAssetsWritten];
      if (v3 <= self->_previousReportedSize) {
        int64_t previousReportedSize = self->_previousReportedSize;
      }
      else {
        int64_t previousReportedSize = v3;
      }
      int64_t v5 = [(AXUltronModelAssetManager *)self _expectedCurrentlyDownloadingSize];
      int64_t expectedDownloadSize = self->_expectedDownloadSize;
      if (v5 > expectedDownloadSize) {
        int64_t expectedDownloadSize = v5;
      }
      if (expectedDownloadSize <= 1) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = expectedDownloadSize;
      }
      if (previousReportedSize / v7 > 0) {
        int64_t previousReportedSize = v7 - 1;
      }
      double v8 = (double)[(AXUltronModelAssetManager *)self _totalExpectedTimeOfAllAssets];
      BOOL v9 = [(AXUltronModelAssetManager *)self isAssetDownloadStalled];
      [(AXUltronModelAssetManager *)self notifyDownloadProgress:previousReportedSize totalSizeExpected:v7 totalRemainingTime:v9 isStalled:v8];
      break;
    case 3:
      [(AXUltronModelAssetManager *)self _resetDownloadTracking];
      int64_t v10 = [(AXUltronModelAssetManager *)self totalSizeOccupied];
      [(AXUltronModelAssetManager *)self notifyDownloadProgress:v10 totalSizeExpected:v10 totalRemainingTime:0 isStalled:0.0];
      [(AXUltronModelAssetManager *)self notifyAssetsReady];
      break;
    default:
      return;
  }
}

- (id)localURLForDetector:(id)a3
{
  int64_t v3 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:a3];
  uint64_t v4 = [v3 localURL];

  return v4;
}

- (id)localPathForKShotHallucinator
{
  uint64_t v2 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:*MEMORY[0x263F21CF8]];
  int64_t v3 = [v2 localURL];

  uint64_t v4 = [v3 URLByAppendingPathComponent:*MEMORY[0x263F21CD0]];

  return v4;
}

- (id)localPathForKShotModelWeights
{
  uint64_t v2 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:*MEMORY[0x263F21D00]];
  int64_t v3 = [v2 localURL];

  uint64_t v4 = [v3 URLByAppendingPathComponent:*MEMORY[0x263F21CE8]];

  return v4;
}

- (id)localPathForKShotGeneralApplianceDetector
{
  uint64_t v2 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:*MEMORY[0x263F21CF0]];
  int64_t v3 = [v2 localURL];

  uint64_t v4 = [v3 URLByAppendingPathComponent:*MEMORY[0x263F21CC8]];

  return v4;
}

- (BOOL)isKShotUsingSoundPrint
{
  uint64_t v2 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:*MEMORY[0x263F21CF0]];
  char v3 = [v2 isUsingSoundPrint];

  return v3;
}

- (int64_t)totalSizeOccupied
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v3 = [(NSMutableDictionary *)self->_cachedAssets allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        int64_t v10 = [v9 unarchivedFileSize];
        v6 += [v10 longLongValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)totalSizeExpected
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v3 = [(NSMutableDictionary *)self->_cachedAssets allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        BOOL v9 = [(NSMutableDictionary *)self->_cachedAssets objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        int64_t v10 = [v9 downloadSize];
        v6 += [v10 longLongValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isAssetCatalogInstalled
{
  return [(AXAssetController *)self->_assetController isAssetCatalogInstalled];
}

- (BOOL)hasInProgressDownloads
{
  return [(AXAssetController *)self->_assetController hasInProgressDownloads];
}

- (void)stopDownloadingAssets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v3 = [(NSMutableDictionary *)self->_cachedAssets allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 isDownloading])
        {
          assetController = self->_assetController;
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke;
          v10[3] = &unk_2647F4D28;
          v10[4] = v8;
          [(AXAssetController *)assetController stopDownloadAsset:v8 completion:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke(uint64_t a1)
{
  uint64_t v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke_cold_1(a1, v2);
  }
}

- (void)downloadAssets:(id)a3
{
  if (([(AXAssetController *)self->_assetController hasInProgressDownloads] & 1) == 0)
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_cachedAssets allValues];
    uint64_t v5 = [(AXUltronModelAssetManager *)self assetDownloadQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__AXUltronModelAssetManager_downloadAssets___block_invoke;
    v7[3] = &unk_2647F4A58;
    id v8 = v4;
    BOOL v9 = self;
    id v6 = v4;
    dispatch_async(v5, v7);
  }
}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F21188] assetsToDownloadFromAssets:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2;
  v6[3] = &unk_2647F4D50;
  id v7 = v2;
  uint64_t v8 = v3;
  id v5 = v2;
  [v4 downloadAssets:v5 successStartBlock:v6];
}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2_cold_1(a1);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    id v7 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __44__AXUltronModelAssetManager_downloadAssets___block_invoke_278;
        v10[3] = &unk_2647F4A58;
        v10[4] = *(void *)(a1 + 40);
        void v10[5] = v9;
        dispatch_async(v7, v10);
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke_278(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 48);
  id v2 = [*(id *)(a1 + 40) ultronModelName];
  [v1 setObject:MEMORY[0x263EFFA88] forKey:v2];
}

- (void)_downloadAssets
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "ultronModelName");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_3_2(&dword_226F20000, v5, v6, "Tried to assign total bytes written to an asset type that we don't currently support - should not happen! %@");
}

void __44__AXUltronModelAssetManager__downloadAssets__block_invoke(uint64_t a1)
{
  id v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2_cold_1(a1);
  }
}

- (void)purgeAssets:(id)a3
{
}

- (void)_updateDownloadingAsset:(id)a3 totalBytesWritten:(int64_t)a4 isStalled:(BOOL)a5 expectedTimeRemaining:(double)a6
{
  BOOL v7 = a5;
  int64_t v10 = NSNumber;
  id v11 = a3;
  long long v12 = [v10 numberWithLongLong:a4];
  [(NSMutableDictionary *)self->_assetsTotalBytesWritten setObject:v12 forKeyedSubscript:v11];

  long long v13 = [NSNumber numberWithLongLong:(uint64_t)a6];
  [(NSMutableDictionary *)self->_assetsTotalTimeExpected setObject:v13 forKeyedSubscript:v11];

  id v14 = [NSNumber numberWithBool:v7];
  [(NSMutableDictionary *)self->_assetDownloadStalled setObject:v14 forKeyedSubscript:v11];
}

- (int64_t)_totalBytesOfAllAssetsWritten
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableDictionary *)self->_assetsTotalBytesWritten allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_assetsTotalBytesWritten objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        v6 += [v9 longLongValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)_expectedCurrentlyDownloadingSize
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(NSMutableDictionary *)self->_cachedAssets allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        assetsDownloading = self->_assetsDownloading;
        long long v11 = [v9 ultronModelName];
        long long v12 = [(NSMutableDictionary *)assetsDownloading objectForKey:v11];

        if (v12)
        {
          long long v13 = [v9 downloadSize];
          v6 += [v13 longLongValue];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)_totalExpectedTimeOfAllAssets
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableDictionary *)self->_assetsTotalTimeExpected allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_assetsTotalTimeExpected objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        v6 += [v9 longLongValue];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isAssetDownloadStalled
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(NSMutableDictionary *)self->_assetDownloadStalled allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(NSMutableDictionary *)self->_assetDownloadStalled objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        int v9 = [v8 BOOLValue];

        if (!v9)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (int64_t)assetStatus
{
  if (![(NSMutableDictionary *)self->_cachedAssets count]) {
    return 0;
  }
  id v3 = [(NSMutableDictionary *)self->_cachedAssets allValues];
  uint64_t v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_285);

  uint64_t v5 = [v4 count];
  if (v5 == [(NSMutableDictionary *)self->_cachedAssets count])
  {
    int64_t v6 = 3;
  }
  else
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_assetsDownloading allValues];
    int v8 = [v7 containsObject:MEMORY[0x263EFFA88]];

    if (v8) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

uint64_t __40__AXUltronModelAssetManager_assetStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled];
}

- (void)_cacheAsset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 ultronModelName];
  int64_t v6 = AXSDSoundDetectionTypeForIdentifier();

  if (v6 == (void *)*MEMORY[0x263F21D78] || v6 == (void *)*MEMORY[0x263F21D68])
  {
    if (![(AXUltronModelAssetManager *)self isKShotAsset:v4])
    {
      uint64_t v17 = AXLogUltron();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[AXUltronModelAssetManager _cacheAsset:](v4);
      }

      goto LABEL_19;
    }
    int v8 = [v4 ultronModelName];
    int v9 = [(NSMutableDictionary *)self->_cachedAssets objectForKey:v6];

    cachedAssets = self->_cachedAssets;
    if (v9)
    {
      long long v11 = [(NSMutableDictionary *)cachedAssets objectForKey:v6];
      int v12 = [v11 isOlderThanAsset:v4];

      if (!v12)
      {
LABEL_11:

        goto LABEL_19;
      }
      cachedAssets = self->_cachedAssets;
    }
    [(NSMutableDictionary *)cachedAssets setObject:v4 forKey:v8];
    goto LABEL_11;
  }
  long long v13 = [(NSMutableDictionary *)self->_cachedAssets objectForKey:v6];

  long long v14 = self->_cachedAssets;
  if (!v13) {
    goto LABEL_15;
  }
  long long v15 = [(NSMutableDictionary *)v14 objectForKey:v6];
  int v16 = [v15 isOlderThanAsset:v4];

  if (v16)
  {
    long long v14 = self->_cachedAssets;
LABEL_15:
    [(NSMutableDictionary *)v14 setObject:v4 forKey:v6];
  }
LABEL_19:
}

- (void)refresh
{
}

- (void)refreshAssetsUpdatingCatalogIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F21DA0] sharedInstance];
  uint64_t v6 = [v5 soundDetectionState];

  if (v6)
  {
    uint64_t v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_DEFAULT, "Updating Sound Detection last model access time: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x2050000000;
    int v9 = (void *)getAXSettingsClass_softClass_0;
    uint64_t v15 = getAXSettingsClass_softClass_0;
    if (!getAXSettingsClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v17 = __getAXSettingsClass_block_invoke_0;
      long long v18 = &unk_2647F4778;
      long long v19 = &v12;
      __getAXSettingsClass_block_invoke_0((uint64_t)&buf);
      int v9 = (void *)v13[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v12, 8);
    long long v11 = objc_msgSend(v10, "sharedInstance", v12);
    [v11 setSoundDetectionLastModelAccess:CFAbsoluteTimeGetCurrent()];
  }
  [(AXAssetController *)self->_assetController refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:v3 catalogRefreshOverrideTimeout:0 completion:0];
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  id v7 = a4;
  id v10 = a6;
  id v8 = v10;
  id v9 = v7;
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __91__AXUltronModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(a1 + 56))
  {
    id v8 = AXLogUltron();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __91__AXUltronModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v8);
    }
    goto LABEL_15;
  }
  id v2 = [*(id *)(a1 + 32) _filterAssetsToCache:*(void *)(a1 + 40)];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _cacheAsset:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  id v7 = AXLogUltron();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_INFO, "Done refreshing assets and was successful", v12, 2u);
  }

  [*(id *)(a1 + 32) setExpectedDownloadSize:0];
  id v8 = [*(id *)(a1 + 32) _supportedTypesFromAssets:*(void *)(a1 + 40)];

  if (v8)
  {
    id v9 = [MEMORY[0x263F21DA0] sharedInstance];
    id v10 = [v8 allObjects];
    [v9 setSupportedSoundDetectionTypes:v10];

LABEL_15:
  }
  [*(id *)(a1 + 32) notifyRefreshAssets:*(void *)(a1 + 40) wasSuccessful:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) notifyAssetsState];
}

- (id)_filterAssetsToCache:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = v4;
  uint64_t v6 = [MEMORY[0x263F21188] compatibleAssetsFromRefreshedAssets:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        if (!AXIsSoundDetectionMedinaSupportEnabled()
          || [(AXUltronModelAssetManager *)self isKShotAsset:v11])
        {
          uint64_t v12 = AXLogUltron();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            long long v13 = [v11 ultronModelName];
            *(_DWORD *)long long buf = 138412546;
            v21 = v13;
            __int16 v22 = 2112;
            v23 = v11;
            _os_log_debug_impl(&dword_226F20000, v12, OS_LOG_TYPE_DEBUG, "Caching asset with name: %@. Asset: %@", buf, 0x16u);
          }
          [v5 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_supportedTypesFromAssets:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v5 = AXSDSoundDetectionCategories();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v10 = AXSDSoundDetectionTypesForCategory();
          uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v35 != v13) {
                  objc_enumerationMutation(v10);
                }
                [v4 addObject:*(void *)(*((void *)&v34 + 1) + 8 * j)];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
            }
            while (v12);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v7);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v28 = v3;
  long long v15 = [MEMORY[0x263F21188] compatibleAssetsFromRefreshedAssets:v3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    long long v19 = (void **)MEMORY[0x263F21D78];
    uint64_t v20 = (void **)MEMORY[0x263F21D68];
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v22 = *(void **)(*((void *)&v30 + 1) + 8 * k);
        v23 = [v22 ultronModelName];
        v24 = AXSDSoundDetectionTypeForIdentifier();

        if (v24 == *v19 || v24 == *v20)
        {
          if (![(AXUltronModelAssetManager *)self isKShotAsset:v22])
          {
            v26 = AXLogUltron();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
              -[AXUltronModelAssetManager _supportedTypesFromAssets:]((uint64_t)v42, (uint64_t)v22);
            }
          }
        }
        else
        {
          [v4 addObject:v24];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }

  return v4;
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v9 = a4;
  id v8 = v9;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke(uint64_t a1)
{
  id v2 = AXLogUltron();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_2(a1, v2);
  }

  [*(id *)(a1 + 40) _cacheAsset:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 32) ultronModelName];
  id v4 = AXSDSoundDetectionTypeForIdentifier();

  uint64_t v5 = *(void **)(a1 + 40);
  if (v4 == (void *)*MEMORY[0x263F21D78] || v4 == (void *)*MEMORY[0x263F21D68])
  {
    if ([v5 isKShotAsset:*(void *)(a1 + 32)])
    {
      uint64_t v7 = *(void **)(a1 + 40);
      id v8 = [*(id *)(a1 + 32) ultronModelName];
      [v7 _updateDownloadingAsset:v8 totalBytesWritten:*(void *)(a1 + 48) isStalled:*(unsigned __int8 *)(a1 + 72) expectedTimeRemaining:*(double *)(a1 + 64)];
    }
    else
    {
      id v8 = AXLogUltron();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_1((id *)(a1 + 32));
      }
    }
  }
  else
  {
    [v5 _updateDownloadingAsset:v4 totalBytesWritten:*(void *)(a1 + 48) isStalled:*(unsigned __int8 *)(a1 + 72) expectedTimeRemaining:*(double *)(a1 + 64)];
  }
  id v9 = *(void **)(*(void *)(a1 + 40) + 48);
  uint64_t v10 = [*(id *)(a1 + 32) ultronModelName];
  [v9 setObject:MEMORY[0x263EFFA88] forKey:v10];

  [*(id *)(a1 + 40) notifyAssetsState];
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  id v8 = a4;
  id v11 = a6;
  id v9 = v11;
  id v10 = v8;
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 40;
  [*(id *)(a1 + 32) _cacheAsset:*(void *)(a1 + 40)];
  if (*(unsigned char *)(v2 + 16))
  {
    id v3 = [*(id *)v2 ultronModelName];
    id v4 = AXSDSoundDetectionTypeForIdentifier();

    if (v4 == *MEMORY[0x263F21D78] || v4 == *MEMORY[0x263F21D68])
    {
      if ([*(id *)(a1 + 32) isKShotAsset:*(void *)(a1 + 40)])
      {
        uint64_t v6 = [*(id *)v2 downloadSize];
        uint64_t v7 = [v6 longLongValue];

        id v8 = AXLogUltron();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          int v27 = *(unsigned __int8 *)(a1 + 56);
          int v28 = *(unsigned __int8 *)(a1 + 57);
          int v29 = 138413058;
          long long v30 = v4;
          __int16 v31 = 1024;
          *(_DWORD *)long long v32 = v27;
          *(_WORD *)&v32[4] = 2048;
          *(void *)&v32[6] = v7;
          *(_WORD *)&v32[14] = 1024;
          *(_DWORD *)&v32[16] = v28;
          _os_log_debug_impl(&dword_226F20000, v8, OS_LOG_TYPE_DEBUG, "Finished downloading asset: (%@). successful: %d. total size: %lld, hasRemainingDownloads: %d", (uint8_t *)&v29, 0x22u);
        }

        id v9 = *(void **)(a1 + 32);
        id v10 = [*(id *)(a1 + 40) ultronModelName];
        [v9 _updateDownloadingAsset:v10 totalBytesWritten:v7 isStalled:0 expectedTimeRemaining:0.0];
      }
      else
      {
        long long v15 = AXLogUltron();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_2((id *)v2);
        }
      }
    }
    else
    {
      id v11 = [*(id *)v2 downloadSize];
      uint64_t v12 = [v11 longLongValue];

      uint64_t v13 = AXLogUltron();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __int16 v22 = [*(id *)(a1 + 40) ultronModelName];
        uint64_t v23 = [*(id *)(a1 + 40) compatibilityVersion];
        uint64_t v24 = [*(id *)(a1 + 40) contentVersion];
        int v25 = *(unsigned __int8 *)(a1 + 56);
        int v26 = *(unsigned __int8 *)(a1 + 57);
        int v29 = 138413570;
        long long v30 = v22;
        __int16 v31 = 2048;
        *(void *)long long v32 = v23;
        *(_WORD *)&v32[8] = 2048;
        *(void *)&v32[10] = v24;
        *(_WORD *)&v32[18] = 1024;
        int v33 = v25;
        __int16 v34 = 2048;
        uint64_t v35 = v12;
        __int16 v36 = 1024;
        int v37 = v26;
        _os_log_debug_impl(&dword_226F20000, v13, OS_LOG_TYPE_DEBUG, "Finished downloading asset: (%@ - CV: %lu - V: %lu). successful: %d. total size: %lld, hasRemainingDownloads: %d", (uint8_t *)&v29, 0x36u);
      }
      [*(id *)(a1 + 32) _updateDownloadingAsset:v4 totalBytesWritten:v12 isStalled:0 expectedTimeRemaining:0.0];
    }
  }
  else
  {
    id v4 = AXLogUltron();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_1(a1, v4);
    }
  }

  [*(id *)(a1 + 32) _cacheAsset:*(void *)(a1 + 40)];
  uint64_t v16 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v17 = [*(id *)(a1 + 40) ultronModelName];
  uint64_t v18 = [v16 objectForKey:v17];

  if (v18)
  {
    long long v19 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v20 = [*(id *)(a1 + 40) ultronModelName];
    [v19 setObject:MEMORY[0x263EFFA80] forKey:v20];
  }
  return [*(id *)(a1 + 32) notifyAssetsState];
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  id v11 = AXLogUltron();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_226F20000, v11, OS_LOG_TYPE_INFO, "Did purge assets: (%@). result: %@", (uint8_t *)&v12, 0x16u);
  }

  [(AXUltronModelAssetManager *)self notifyPurgeAssets:v9 wasSuccessful:v7 error:v10];
}

- (int64_t)previousReportedSize
{
  return self->_previousReportedSize;
}

- (void)setPreviousReportedSize:(int64_t)a3
{
  self->_int64_t previousReportedSize = a3;
}

- (int64_t)expectedDownloadSize
{
  return self->_expectedDownloadSize;
}

- (void)setExpectedDownloadSize:(int64_t)a3
{
  self->_int64_t expectedDownloadSize = a3;
}

- (NSMutableArray)cachedAXAssets
{
  return self->_cachedAXAssets;
}

- (void)setCachedAXAssets:(id)a3
{
}

- (OS_dispatch_queue)assetDownloadQueue
{
  return self->_assetDownloadQueue;
}

- (void)setAssetDownloadQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadQueue, 0);
  objc_storeStrong((id *)&self->_cachedAXAssets, 0);
  objc_storeStrong((id *)&self->_cachedAssets, 0);
  objc_storeStrong((id *)&self->_assetsDownloading, 0);
  objc_storeStrong((id *)&self->_assetDownloadStalled, 0);
  objc_storeStrong((id *)&self->_assetsTotalTimeExpected, 0);
  objc_storeStrong((id *)&self->_assetsTotalBytesWritten, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)addObserver:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_226F20000, v0, OS_LOG_TYPE_DEBUG, "Asset Manager add observer: %@", v1, 0xCu);
}

- (void)notifyPurgeAssets:(uint64_t)a1 wasSuccessful:error:.cold.1(uint64_t a1)
{
  [*(id *)(a1 + 8) count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v1, v2, "Notifying Assets Purged to %lu observers", v3, v4, v5, v6, v7);
}

void __50__AXUltronModelAssetManager_stopDownloadingAssets__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) ultronModelName];
  uint64_t v5 = [*(id *)(a1 + 32) assetId];
  int v6 = 138412546;
  uint8_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "successfully stopped downloading asset: %@ - id: %@", (uint8_t *)&v6, 0x16u);
}

void __44__AXUltronModelAssetManager_downloadAssets___block_invoke_2_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 32) count];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_226F20000, v1, v2, "Successfully started downloading %lu assets", v3, v4, v5, v6, v7);
}

- (void)_cacheAsset:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 ultronModelName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_3(&dword_226F20000, v2, v3, "Attempted to cache an asset type that we don't currently support - should not happen! %@", v4, v5, v6, v7, v8);
}

void __91__AXUltronModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Error refreshing assets: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_supportedTypesFromAssets:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "ultronModelName");
  _DWORD *v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_3_2(&dword_226F20000, v5, v6, "Received an asset type that we don't currently support - should not happen! %@");
}

void __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 ultronModelName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_3(&dword_226F20000, v2, v3, "Tried to update total bytes written for an asset type that we don't currently support - should not happen! %@", v4, v5, v6, v7, v8);
}

void __126__AXUltronModelAssetManager_assetController_asset_downloadProgressTotalWritten_totalExpected_isStalled_expectedTimeRemaining___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  int v6 = 138413058;
  uint64_t v7 = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "Downloading asset: (%@). bytes written: %lld of %lld. stalled: %ld", (uint8_t *)&v6, 0x2Au);
}

void __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Error downloading asset: %@", (uint8_t *)&v3, 0xCu);
}

void __113__AXUltronModelAssetManager_assetController_didFinishDownloadingAsset_wasSuccessful_error_hasRemainingDownloads___block_invoke_cold_2(id *a1)
{
  uint64_t v1 = [*a1 ultronModelName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_3(&dword_226F20000, v2, v3, "Attemped to mark download complete for an asset type that we don't currently support - should not happen! %@", v4, v5, v6, v7, v8);
}

@end