@interface SoundActionsAssetsDownloadManager
+ (id)sharedInstance;
- (AXAsset)latestAsset;
- (SoundActionsAssetsDownloadManager)init;
- (SoundActionsAssetsDownloadManagerDelegate)delegate;
- (void)_updateLatestAsset:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)refreshAssets;
- (void)setDelegate:(id)a3;
- (void)setLatestAsset:(id)a3;
@end

@implementation SoundActionsAssetsDownloadManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_52);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

void __51__SoundActionsAssetsDownloadManager_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(SoundActionsAssetsDownloadManager);
  uint64_t v2 = sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (SoundActionsAssetsDownloadManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SoundActionsAssetsDownloadManager;
  uint64_t v2 = [(SoundActionsAssetsDownloadManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[AXVoiceTriggerAssetPolicy policy];
    assetPolicy = v2->_assetPolicy;
    v2->_assetPolicy = (AXVoiceTriggerAssetPolicy *)v3;

    uint64_t v5 = +[AXAssetController assetControllerWithPolicy:v2->_assetPolicy qosClass:25];
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v5;

    [(AXAssetController *)v2->_assetController setUserInitiated:1];
    [(AXAssetController *)v2->_assetController addObserver:v2];
  }
  return v2;
}

- (void)refreshAssets
{
}

- (void)_updateLatestAsset:(id)a3
{
  [(SoundActionsAssetsDownloadManager *)self setLatestAsset:a3];
  id v5 = [(SoundActionsAssetsDownloadManager *)self delegate];
  v4 = [(SoundActionsAssetsDownloadManager *)self latestAsset];
  [v5 latestAssetDidUpdate:v4];
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  if (v7)
  {
    v11 = [v9 lastObject];
    v12 = AXLogSoundActions();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2112;
      id v31 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Refreshed Assets:\n%@", buf, 0x16u);
    }

    if ([v11 isInstalled])
    {
      v13 = AXLogSoundActions();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2112;
        id v31 = v9;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Newest asset already installed:\n%@", buf, 0x16u);
      }

      [(SoundActionsAssetsDownloadManager *)self _updateLatestAsset:v11];
    }
    else
    {
      uint64_t v14 = [(SoundActionsAssetsDownloadManager *)self latestAsset];
      if (v14
        && (v15 = (void *)v14,
            id v16 = [v11 contentVersion],
            [(SoundActionsAssetsDownloadManager *)self latestAsset],
            v17 = objc_claimAutoreleasedReturnValue(),
            id v18 = [v17 contentVersion],
            v17,
            v15,
            v16 <= v18))
      {
        v22 = AXLogSoundActions();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [(SoundActionsAssetsDownloadManager *)self latestAsset];
          *(_DWORD *)buf = 138412546;
          v29 = self;
          __int16 v30 = 2112;
          id v31 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Latest asset up to date - keeping:\n%@", buf, 0x16u);
        }
      }
      else
      {
        v27 = v11;
        v19 = +[NSArray arrayWithObjects:&v27 count:1];
        assetController = self->_assetController;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = __99__SoundActionsAssetsDownloadManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
        v24[3] = &unk_20A968;
        v24[4] = self;
        id v25 = v19;
        id v26 = v10;
        id v21 = v19;
        [(AXAssetController *)assetController downloadAssets:v21 successStartBlock:v24];
      }
    }
  }
  else
  {
    v11 = AXLogSoundActions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SoundActionsAssetsDownloadManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]();
    }
  }
}

void __99__SoundActionsAssetsDownloadManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
{
  v4 = AXLogSoundActions();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloading Assets:\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __99__SoundActionsAssetsDownloadManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v5);
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  id v10 = a4;
  id v11 = a6;
  v12 = AXLogSoundActions();
  v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloaded Asset:\n%@", (uint8_t *)&v14, 0x16u);
    }

    [(SoundActionsAssetsDownloadManager *)self _updateLatestAsset:v10];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SoundActionsAssetsDownloadManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]();
    }
  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  id v11 = a4;
  v12 = AXLogSoundActions();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = 138413058;
    int v14 = self;
    __int16 v15 = 2112;
    id v16 = v11;
    __int16 v17 = 2048;
    int64_t v18 = a5;
    __int16 v19 = 2048;
    int64_t v20 = a6;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloading Asset:\n%@ %lld written, %lld expected.", (uint8_t *)&v13, 0x2Au);
  }
}

- (AXAsset)latestAsset
{
  return self->_latestAsset;
}

- (void)setLatestAsset:(id)a3
{
}

- (SoundActionsAssetsDownloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SoundActionsAssetsDownloadManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestAsset, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);

  objc_storeStrong((id *)&self->_assetController, 0);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_0, v0, v1, "[%@]: Voice Trigger Model loading:  Error refresing assets:\n%@");
}

void __99__SoundActionsAssetsDownloadManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[%@]: Voice Trigger Model loading:  Error starting asset download:\n%@", (uint8_t *)&v4, 0x16u);
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_3(&dword_0, v0, v1, "[%@]: Voice Trigger Model loading: Download failed:\n%@");
}

@end