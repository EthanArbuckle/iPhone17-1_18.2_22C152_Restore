@interface AIAudiogramAssetManager
- (AIAudiogramAssetManager)initWithDelegate:(id)a3;
- (AIAudiogramAssetManagerDelegate)delegate;
- (AXAsset)latestDownloadedAsset;
- (AXAssetController)assetController;
- (BOOL)didForceCatalogRefresh;
- (void)_refreshAssetsByForceUpdatingCatalog:(BOOL)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetDidUpdateWithError:(id)a3;
- (void)refreshAssets;
- (void)setAssetController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidForceCatalogRefresh:(BOOL)a3;
- (void)setLatestDownloadedAsset:(id)a3;
@end

@implementation AIAudiogramAssetManager

- (AIAudiogramAssetManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AIAudiogramAssetManager;
  v5 = [(AIAudiogramAssetManager *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(AIAudiogramAssetManager *)v5 setDelegate:v4];
    v7 = [MEMORY[0x263F21158] policy];
    v8 = [MEMORY[0x263F21140] assetControllerWithPolicy:v7 qosClass:25];
    [(AIAudiogramAssetManager *)v6 setAssetController:v8];

    v9 = [(AIAudiogramAssetManager *)v6 assetController];
    [v9 setUserInitiated:1];

    v10 = [(AIAudiogramAssetManager *)v6 assetController];
    [v10 addObserver:v6];
  }
  return v6;
}

- (void)refreshAssets
{
}

- (void)_refreshAssetsByForceUpdatingCatalog:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getAXSettingsClass_softClass;
  uint64_t v13 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAXSettingsClass_block_invoke;
    v15 = &unk_265058588;
    v16 = &v10;
    __getAXSettingsClass_block_invoke((uint64_t)buf);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7 = objc_msgSend(v6, "sharedInstance", v10);
  [v7 setAudiogramIngestionLastModelAccess:CFAbsoluteTimeGetCurrent()];

  if (v3) {
    [(AIAudiogramAssetManager *)self setDidForceCatalogRefresh:1];
  }
  v8 = AXLogAudiogram();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v3;
    _os_log_impl(&dword_23F0D7000, v8, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Initiating refresh with catalog force update %d", buf, 0x12u);
  }

  v9 = [(AIAudiogramAssetManager *)self assetController];
  [v9 refreshAssetsByForceUpdatingCatalog:v3 updatingCatalogIfNeeded:1 catalogRefreshOverrideTimeout:0 completion:0];
}

- (void)assetDidUpdateWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AXLogAudiogram();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(AIAudiogramAssetManager *)self latestDownloadedAsset];
    int v13 = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Asset Did Update:\n%@", (uint8_t *)&v13, 0x16u);
  }
  v7 = [(AIAudiogramAssetManager *)self delegate];
  v8 = [(AIAudiogramAssetManager *)self latestDownloadedAsset];
  v9 = [v8 localURL];
  uint64_t v10 = [(AIAudiogramAssetManager *)self latestDownloadedAsset];
  v11 = [v10 properties];
  uint64_t v12 = [(AIAudiogramAssetManager *)self latestDownloadedAsset];
  objc_msgSend(v7, "modelDidUpdate:assetProperties:assetVersion:withError:", v9, v11, objc_msgSend(v12, "contentVersion"), v4);
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v7 && [v11 count])
  {
    int v13 = [v11 lastObject];
    v14 = AXLogAudiogram();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = self;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl(&dword_23F0D7000, v14, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Refreshed Assets:\n%@", buf, 0x16u);
    }

    if ([v13 isInstalled])
    {
      __int16 v15 = AXLogAudiogram();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_impl(&dword_23F0D7000, v15, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Newest asset already installed:\n%@", buf, 0x16u);
      }

      [(AIAudiogramAssetManager *)self setLatestDownloadedAsset:v13];
    }
    else
    {
      uint64_t v16 = [(AIAudiogramAssetManager *)self latestDownloadedAsset];
      if (!v16
        || (uint64_t v17 = (void *)v16,
            unint64_t v18 = [v13 contentVersion],
            [(AIAudiogramAssetManager *)self latestDownloadedAsset],
            v19 = objc_claimAutoreleasedReturnValue(),
            unint64_t v20 = [v19 contentVersion],
            v19,
            v17,
            v18 > v20))
      {
        v21 = [(AIAudiogramAssetManager *)self assetController];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
        v25[3] = &unk_265059570;
        v25[4] = self;
        id v26 = v11;
        id v27 = v12;
        [v21 downloadAssets:v26 successStartBlock:v25];

LABEL_24:
        goto LABEL_25;
      }
      v23 = AXLogAudiogram();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = [(AIAudiogramAssetManager *)self latestDownloadedAsset];
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2112;
        id v31 = v24;
        _os_log_impl(&dword_23F0D7000, v23, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Latest asset up to date - keeping:\n%@", buf, 0x16u);
      }
    }
    [(AIAudiogramAssetManager *)self assetDidUpdateWithError:0];
    goto LABEL_24;
  }
  if (!v12)
  {
    if ([v11 count])
    {
      id v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "ax_errorWithDomain:description:", @"Audiogram model download error", @"No assets found");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (![(AIAudiogramAssetManager *)self didForceCatalogRefresh]) {
        [(AIAudiogramAssetManager *)self _refreshAssetsByForceUpdatingCatalog:1];
      }
    }
  }
  v22 = AXLogAudiogram();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v29 = self;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_error_impl(&dword_23F0D7000, v22, OS_LOG_TYPE_ERROR, "[%@]: Audiogram Ingestion Model loading: Error refresing assets %@:\n%@", buf, 0x20u);
  }

  [(AIAudiogramAssetManager *)self assetDidUpdateWithError:v12];
LABEL_25:
}

void __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = AXLogAudiogram();
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
      _os_log_impl(&dword_23F0D7000, v5, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Downloading Assets:\n%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(a1, v5);
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = AXLogAudiogram();
  int v13 = v12;
  if (v8)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      __int16 v15 = self;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_23F0D7000, v13, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model loading: Downloaded Asset:\n%@", (uint8_t *)&v14, 0x16u);
    }

    [(AIAudiogramAssetManager *)self setLatestDownloadedAsset:v10];
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AIAudiogramAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]((uint64_t)self, (uint64_t)v11, v13);
    }
  }
  [(AIAudiogramAssetManager *)self assetDidUpdateWithError:v11];
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  BOOL v9 = a7;
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v13 = AXLogAudiogram();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v17 = 138413314;
    uint64_t v18 = self;
    __int16 v19 = 2048;
    int64_t v20 = a5;
    __int16 v21 = 2048;
    int64_t v22 = a6;
    __int16 v23 = 1024;
    BOOL v24 = v9;
    __int16 v25 = 2048;
    double v26 = a8;
    _os_log_impl(&dword_23F0D7000, v13, OS_LOG_TYPE_INFO, "[%@]: Audiogram Ingestion Model progress %lli %lli %d %f", (uint8_t *)&v17, 0x30u);
  }

  if (a6 < 1) {
    float v14 = 0.0;
  }
  else {
    float v14 = (float)a5 / (float)a6;
  }
  __int16 v15 = [(AIAudiogramAssetManager *)self delegate];
  *(float *)&double v16 = v14;
  [v15 modelDownloadProgressDidUpdate:v16];
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (AXAsset)latestDownloadedAsset
{
  return self->_latestDownloadedAsset;
}

- (void)setLatestDownloadedAsset:(id)a3
{
}

- (AIAudiogramAssetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AIAudiogramAssetManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didForceCatalogRefresh
{
  return self->_didForceCatalogRefresh;
}

- (void)setDidForceCatalogRefresh:(BOOL)a3
{
  self->_didForceCatalogRefresh = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_latestDownloadedAsset, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

void __89__AIAudiogramAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_23F0D7000, a2, OS_LOG_TYPE_ERROR, "[%@]: Audiogram Ingestion Model loading: Error starting asset download:\n%@", (uint8_t *)&v4, 0x16u);
}

- (void)assetController:(os_log_t)log didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_23F0D7000, log, OS_LOG_TYPE_ERROR, "[%@]: Audiogram Ingestion Model loading: Download failed:\n%@", (uint8_t *)&v3, 0x16u);
}

@end