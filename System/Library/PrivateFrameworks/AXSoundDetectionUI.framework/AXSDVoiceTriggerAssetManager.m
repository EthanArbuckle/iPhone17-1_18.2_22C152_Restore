@interface AXSDVoiceTriggerAssetManager
- (AXAsset)latestDownloadedAsset;
- (AXAssetController)assetController;
- (AXSDVoiceTriggerAssetManager)initWithDelegate:(id)a3;
- (AXSDVoiceTriggerAssetManagerDelegate)delegate;
- (AXVoiceTriggerAssetPolicy)assetPolicy;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetDidUpdateWithError:(id)a3;
- (void)setAssetController:(id)a3;
- (void)setAssetPolicy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLatestDownloadedAsset:(id)a3;
@end

@implementation AXSDVoiceTriggerAssetManager

- (AXSDVoiceTriggerAssetManager)initWithDelegate:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXSDVoiceTriggerAssetManager;
  v5 = [(AXSDVoiceTriggerAssetManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x263F21190] policy];
    assetPolicy = v6->_assetPolicy;
    v6->_assetPolicy = (AXVoiceTriggerAssetPolicy *)v7;

    v9 = (void *)MEMORY[0x263F21140];
    v10 = [(AXSDVoiceTriggerAssetManager *)v6 assetPolicy];
    uint64_t v11 = [v9 assetControllerWithPolicy:v10 qosClass:25];
    assetController = v6->_assetController;
    v6->_assetController = (AXAssetController *)v11;

    [(AXAssetController *)v6->_assetController setUserInitiated:1];
    [(AXAssetController *)v6->_assetController addObserver:v6];
    v13 = AXLogSoundActions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_226F20000, v13, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading: Initiating refresh", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v14 = (void *)getAXSettingsClass_softClass;
    uint64_t v22 = getAXSettingsClass_softClass;
    if (!getAXSettingsClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v24 = __getAXSettingsClass_block_invoke;
      v25 = &unk_2647F4778;
      v26 = &v19;
      __getAXSettingsClass_block_invoke((uint64_t)&buf);
      v14 = (void *)v20[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v19, 8);
    v16 = [v15 sharedInstance];
    [v16 setSoundActionsLastModelAccess:CFAbsoluteTimeGetCurrent()];

    [(AXAssetController *)v6->_assetController refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:1 catalogRefreshOverrideTimeout:0 completion:0];
  }

  return v6;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  if (v7)
  {
    uint64_t v11 = [v9 lastObject];
    v12 = AXLogSoundActions();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      v24 = (AXAsset *)v9;
      _os_log_impl(&dword_226F20000, v12, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Refreshed Assets:\n%@", buf, 0x16u);
    }

    if ([v11 isInstalled])
    {
      v13 = AXLogSoundActions();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        v24 = (AXAsset *)v9;
        _os_log_impl(&dword_226F20000, v13, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Newst asset already installed:\n%@", buf, 0x16u);
      }

      objc_storeStrong((id *)&self->_latestDownloadedAsset, v11);
      [(AXSDVoiceTriggerAssetManager *)self assetDidUpdateWithError:0];
    }
    else if (self->_latestDownloadedAsset {
           && (unint64_t v14 = [v11 contentVersion],
    }
               v14 <= [(AXAsset *)self->_latestDownloadedAsset contentVersion]))
    {
      v16 = AXLogSoundActions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        latestDownloadedAsset = self->_latestDownloadedAsset;
        *(_DWORD *)long long buf = 138412546;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        v24 = latestDownloadedAsset;
        _os_log_impl(&dword_226F20000, v16, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Latest asset up to date - keeping:\n%@", buf, 0x16u);
      }
    }
    else
    {
      assetController = self->_assetController;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
      v18[3] = &unk_2647F4750;
      v18[4] = self;
      id v19 = v9;
      id v20 = v10;
      [(AXAssetController *)assetController downloadAssets:v19 successStartBlock:v18];
    }
  }
  else
  {
    uint64_t v11 = AXLogSoundActions();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXSDVoiceTriggerAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]();
    }
  }
}

void __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = AXLogSoundActions();
  v5 = v4;
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
      _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloading Assets:\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v5);
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = AXLogSoundActions();
  latestDownloadedAsset = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_226F20000, latestDownloadedAsset, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Downloaded Asset:\n%@", (uint8_t *)&v15, 0x16u);
    }

    unint64_t v14 = (AXAsset *)v10;
    latestDownloadedAsset = self->_latestDownloadedAsset;
    self->_latestDownloadedAsset = v14;
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[AXSDVoiceTriggerAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]();
  }

  [(AXSDVoiceTriggerAssetManager *)self assetDidUpdateWithError:v11];
}

- (void)assetDidUpdateWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AXLogSoundActions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    latestDownloadedAsset = self->_latestDownloadedAsset;
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = latestDownloadedAsset;
    _os_log_impl(&dword_226F20000, v5, OS_LOG_TYPE_INFO, "[%@]: Voice Trigger Model loading:  Asset Did Update:\n%@", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v8 = [(AXAsset *)self->_latestDownloadedAsset localURL];
  objc_msgSend(WeakRetained, "modelDidUpdate:assetVersion:withError:", v8, -[AXAsset contentVersion](self->_latestDownloadedAsset, "contentVersion"), v4);
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (AXVoiceTriggerAssetPolicy)assetPolicy
{
  return self->_assetPolicy;
}

- (void)setAssetPolicy:(id)a3
{
}

- (AXAsset)latestDownloadedAsset
{
  return self->_latestDownloadedAsset;
}

- (void)setLatestDownloadedAsset:(id)a3
{
}

- (AXSDVoiceTriggerAssetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXSDVoiceTriggerAssetManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestDownloadedAsset, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226F20000, v0, v1, "[%@]: Voice Trigger Model loading:  Error refresing assets:\n%@");
}

void __94__AXSDVoiceTriggerAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "[%@]: Voice Trigger Model loading:  Error starting asset download:\n%@", (uint8_t *)&v4, 0x16u);
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226F20000, v0, v1, "[%@]: Voice Trigger Model loading: Download failed:\n%@");
}

@end