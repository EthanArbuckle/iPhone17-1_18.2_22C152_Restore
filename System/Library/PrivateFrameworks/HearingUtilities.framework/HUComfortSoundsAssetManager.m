@interface HUComfortSoundsAssetManager
- (AXAssetController)assetController;
- (HUComfortSoundsAssetManager)init;
- (HUComfortSoundsAssetManagerDelegate)delegate;
- (NSArray)availableAssets;
- (NSDictionary)assetDownloadProgress;
- (id)assetWithId:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)downloadAssetWithId:(id)a3;
- (void)refreshAssets;
- (void)removeAssetWithId:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setAssetDownloadProgress:(id)a3;
- (void)setAvailableAssets:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HUComfortSoundsAssetManager

- (HUComfortSoundsAssetManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)HUComfortSoundsAssetManager;
  v2 = [(HUComfortSoundsAssetManager *)&v10 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F21140];
    v4 = [MEMORY[0x263F21160] policy];
    uint64_t v5 = [v3 assetControllerWithPolicy:v4 qosClass:25];
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v5;

    [(AXAssetController *)v2->_assetController setUserInitiated:1];
    [(AXAssetController *)v2->_assetController addObserver:v2];
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    assetDownloadProgress = v2->_assetDownloadProgress;
    v2->_assetDownloadProgress = (NSMutableDictionary *)v7;

    [(HUComfortSoundsAssetManager *)v2 refreshAssets];
  }
  return v2;
}

- (void)refreshAssets
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  v3 = [NSString stringWithFormat:@"Refreshing assets"];
  v4 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager refreshAssets]", 44, v3];
  uint64_t v5 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](self->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", [MEMORY[0x263F472B0] isInternalInstall], 1, 0, 0);
}

- (NSDictionary)assetDownloadProgress
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableDictionary *)v2->_assetDownloadProgress copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)assetWithId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HUComfortSoundsAssetManager *)self availableAssets];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__HUComfortSoundsAssetManager_assetWithId___block_invoke;
  v11[3] = &unk_2640FCA28;
  id v6 = v4;
  id v12 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v11];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = [(HUComfortSoundsAssetManager *)self availableAssets];
    v8 = [v9 objectAtIndex:v7];
  }

  return v8;
}

uint64_t __43__HUComfortSoundsAssetManager_assetWithId___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 assetId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)downloadAssetWithId:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HUComfortSoundsAssetManager *)self assetWithId:a3];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    assetController = self->_assetController;
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__HUComfortSoundsAssetManager_downloadAssetWithId___block_invoke;
    v8[3] = &unk_2640FCA50;
    id v9 = v5;
    [(AXAssetController *)assetController downloadAssets:v7 successStartBlock:v8];
  }
}

void __51__HUComfortSoundsAssetManager_downloadAssetWithId___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CSInitializeLogging();
  v2 = [NSString stringWithFormat:@"Started downloading %@", *(void *)(a1 + 32)];
  v3 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager downloadAssetWithId:]_block_invoke", 78, v2];
  uint64_t v4 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = [v5 UTF8String];
    _os_log_impl(&dword_20CC86000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)removeAssetWithId:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HUComfortSoundsAssetManager *)self assetWithId:a3];
  id v5 = (void *)v4;
  if (v4)
  {
    assetController = self->_assetController;
    v8[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [(AXAssetController *)assetController purgeAssets:v7 completion:0];
  }
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  CSInitializeLogging();
  if (v10 || !v7)
  {
    v17 = [NSString stringWithFormat:@"Error loading assets %d = %@", v7, v10];
    v18 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]", 106, v17];
    v19 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v18;
      v21 = v19;
      *(_DWORD *)buf = 136446210;
      uint64_t v23 = [v20 UTF8String];
      _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Found Assets %@", v9];
    id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]", 98, v11];
    v13 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      uint64_t v23 = [v14 UTF8String];
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    v16 = [v9 sortedArrayUsingComparator:&__block_literal_global_0];
    [(HUComfortSoundsAssetManager *)self setAvailableAssets:v16];

    v17 = [(HUComfortSoundsAssetManager *)self delegate];
    [v17 availableAssetsDidUpdate];
  }
}

uint64_t __93__HUComfortSoundsAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 properties];
  id v6 = [v5 valueForKey:@"SoundGroup"];
  BOOL v7 = [v4 properties];

  uint64_t v8 = [v7 valueForKey:@"SoundGroup"];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v19 = a3;
  id v12 = a4;
  v13 = self;
  objc_sync_enter(v13);
  *(float *)&double v14 = (float)a5 / (float)a6;
  v15 = [NSNumber numberWithFloat:v14];
  assetDownloadProgress = v13->_assetDownloadProgress;
  v17 = [v12 assetId];
  [(NSMutableDictionary *)assetDownloadProgress setObject:v15 forKeyedSubscript:v17];

  objc_sync_exit(v13);
  v18 = [(HUComfortSoundsAssetManager *)v13 delegate];
  [v18 assetDownloadDidUpdate];
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v40 = a6;
  double v13 = 0.0;
  if (v8)
  {
    double v14 = +[HUComfortSound comfortSoundWithAsset:v12];
    v15 = +[HUComfortSoundsSettings sharedInstance];
    v16 = [v15 selectedComfortSound];
    uint64_t v17 = [v16 soundGroup];
    if (v17 == [v14 soundGroup])
    {
      v18 = +[HUComfortSoundsSettings sharedInstance];
      id v19 = [v18 selectedComfortSound];
      char v20 = [v14 isEqual:v19];

      if ((v20 & 1) == 0)
      {
        v21 = +[HUComfortSoundsSettings sharedInstance];
        [v21 setSelectedComfortSound:v14];

        CSInitializeLogging();
        v22 = [NSString stringWithFormat:@"Resetting selected bg sound %@", v14];
        uint64_t v23 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]", 127, v22, v40];
        uint64_t v24 = (void *)*MEMORY[0x263F47288];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v23;
          v26 = v24;
          *(_DWORD *)buf = 136446210;
          uint64_t v42 = [v25 UTF8String];
          _os_log_impl(&dword_20CC86000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }
    }
    else
    {
    }
    double v13 = 1.0;
  }
  v27 = self;
  objc_sync_enter(v27);
  v28 = [NSNumber numberWithDouble:v13];
  assetDownloadProgress = v27->_assetDownloadProgress;
  v30 = [v12 assetId];
  [(NSMutableDictionary *)assetDownloadProgress setObject:v28 forKeyedSubscript:v30];

  objc_sync_exit(v27);
  v31 = [(HUComfortSoundsAssetManager *)v27 delegate];
  [v31 assetDownloadDidUpdate];

  CSInitializeLogging();
  v32 = NSString;
  v33 = +[HUComfortSound comfortSoundWithAsset:v12];
  v34 = [v32 stringWithFormat:@"Finished downloading asset %@ - %@", v12, v33];

  v35 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]", 137, v34];
  v36 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v37 = v35;
    v38 = v36;
    uint64_t v39 = [v37 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v42 = v39;
    _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  CSInitializeLogging();
  BOOL v8 = [NSString stringWithFormat:@"Finished purging assets %@", v7];

  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[HUComfortSoundsAssetManager assetController:didFinishPurgingAssets:wasSuccessful:error:]", 142, v8];
  id v10 = (void *)*MEMORY[0x263F47288];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)buf = 136446210;
    uint64_t v15 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  double v13 = [(HUComfortSoundsAssetManager *)self delegate];
  [v13 availableAssetsDidUpdate];
}

- (NSArray)availableAssets
{
  return self->_availableAssets;
}

- (void)setAvailableAssets:(id)a3
{
}

- (void)setAssetDownloadProgress:(id)a3
{
}

- (HUComfortSoundsAssetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUComfortSoundsAssetManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableAssets, 0);

  objc_storeStrong((id *)&self->_assetDownloadProgress, 0);
}

@end