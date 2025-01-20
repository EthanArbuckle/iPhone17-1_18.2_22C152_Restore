@interface ACHMobileAssetProvider
- (ACHMobileAssetProvider)init;
- (ACHMobileAssetProvider)initWithMobileAssetDownloadManager:(id)a3;
- (BOOL)_assetIsInstalled:(id)a3;
- (NSUserDefaults)nanoUserDefaults;
- (_HKMobileAssetDownloadManager)mobileAssetDownloadManager;
- (double)_downloadDelay;
- (double)downloadDelayOverride;
- (id)_assetsGroupedByUniqueNameAndType:(id)a3;
- (id)_compatibilityVersionQueryParameters;
- (id)remoteDownloadCompleteCompletion;
- (int64_t)downloadedAssetDiskUsageInBytes;
- (int64_t)purgeAllDownloadedAssets;
- (void)_downloadAssets:(id)a3 withCompletion:(id)a4;
- (void)_downloadDelay;
- (void)_downloadRemoteAssets:(id)a3 installedAssets:(id)a4;
- (void)_downloadRemoteCatalogAndAssets;
- (void)_fetchLocalAssetsWithCompletion:(id)a3;
- (void)_getCurrentAsssetAndOlderAssetsFromAssets:(id)a3 completion:(id)a4;
- (void)_processAssets:(id)a3 completion:(id)a4;
- (void)_removeAssets:(id)a3;
- (void)availableAssetsWithCompletion:(id)a3;
- (void)downloadRemoteCatalog;
- (void)setDownloadDelayOverride:(double)a3;
- (void)setMobileAssetDownloadManager:(id)a3;
- (void)setNanoUserDefaults:(id)a3;
- (void)setRemoteDownloadCompleteCompletion:(id)a3;
@end

@implementation ACHMobileAssetProvider

- (ACHMobileAssetProvider)initWithMobileAssetDownloadManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ACHMobileAssetProvider;
  v6 = [(ACHMobileAssetProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mobileAssetDownloadManager, a3);
    id v8 = objc_alloc(MEMORY[0x263EFFA40]);
    uint64_t v9 = [v8 initWithSuiteName:*MEMORY[0x263F23588]];
    nanoUserDefaults = v7->_nanoUserDefaults;
    v7->_nanoUserDefaults = (NSUserDefaults *)v9;

    v7->_downloadDelayOverride = -1.0;
  }

  return v7;
}

- (ACHMobileAssetProvider)init
{
  id v3 = objc_alloc(MEMORY[0x263F0AA08]);
  uint64_t v4 = *MEMORY[0x263F236F0];
  id v5 = HKCreateSerialDispatchQueue();
  v6 = (void *)[v3 initWithMobileAssetTypeName:v4 queue:v5];

  [v6 setShouldAutoDownloadRemoteAssets:0];
  [v6 setMobileAssetDownloadCompletionHandler:&__block_literal_global_1];
  [v6 setErrorHandler:&__block_literal_global_285];
  v7 = [(ACHMobileAssetProvider *)self initWithMobileAssetDownloadManager:v6];

  return v7;
}

void __30__ACHMobileAssetProvider_init__block_invoke()
{
  v0 = ACHLogAssets();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __30__ACHMobileAssetProvider_init__block_invoke_cold_1(v0);
  }
}

void __30__ACHMobileAssetProvider_init__block_invoke_282(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = ACHLogAssets();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__ACHMobileAssetProvider_init__block_invoke_282_cold_1();
  }
}

- (void)availableAssetsWithCompletion:(id)a3
{
  [(ACHMobileAssetProvider *)self _fetchLocalAssetsWithCompletion:a3];
  [(ACHMobileAssetProvider *)self _downloadRemoteCatalogAndAssets];
}

- (int64_t)downloadedAssetDiskUsageInBytes
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v3 = [(ACHMobileAssetProvider *)self _compatibilityVersionQueryParameters];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(ACHMobileAssetProvider *)self mobileAssetDownloadManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke;
  v9[3] = &unk_264515FE8;
  v9[4] = self;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  [v5 fetchAssetsWithQueryParams:v3 onlyLocal:1 completion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int64_t v7 = ACHLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke_cold_1();
    }
  }
  v20 = v6;
  id v8 = ACHLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu local assets for CacheDelete disk usage reporting", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    uint64_t v13 = *MEMORY[0x263F558A0];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) _assetIsInstalled:v15])
        {
          v16 = [v15 attributes];
          v17 = [v16 objectForKeyedSubscript:v13];
          uint64_t v18 = [v17 longLongValue];

          v19 = ACHLogAssets();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v26 = v18;
            __int16 v27 = 2112;
            v28 = v15;
            _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Adding %ld bytes disk usage reporting for asset %@", buf, 0x16u);
          }

          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v11);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int64_t)purgeAllDownloadedAssets
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v3 = [(ACHMobileAssetProvider *)self _compatibilityVersionQueryParameters];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(ACHMobileAssetProvider *)self mobileAssetDownloadManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke;
  v9[3] = &unk_264515FE8;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  uint64_t v10 = v6;
  [v5 fetchAssetsWithQueryParams:v3 onlyLocal:1 completion:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int64_t v7 = ACHLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_cold_1();
    }
  }
  id v8 = ACHLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu local assets for CacheDelete purging", buf, 0xCu);
  }
  long long v21 = v6;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    uint64_t v13 = *MEMORY[0x263F558A0];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) _assetIsInstalled:v15])
        {
          v16 = [v15 attributes];
          v17 = [v16 objectForKeyedSubscript:v13];
          uint64_t v18 = [v17 longLongValue];

          v19 = ACHLogAssets();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v29 = (uint64_t)v15;
            __int16 v30 = 2048;
            uint64_t v31 = v18;
            _os_log_impl(&dword_21F5DA000, v19, OS_LOG_TYPE_DEFAULT, "Purging asset (%@) to reclaim %ld bytes of disk usage.", buf, 0x16u);
          }

          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v18;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v11);
  }

  v20 = [*(id *)(a1 + 32) mobileAssetDownloadManager];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_287;
  v22[3] = &unk_264516010;
  id v23 = *(id *)(a1 + 40);
  [v20 removeMobileAssets:v9 completion:v22];
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_287(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = ACHLogAssets();
  int64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21F5DA000, v7, OS_LOG_TYPE_DEFAULT, "Successfully purged assets for CacheDelete", v8, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_287_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_assetIsInstalled:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 state] == 2 || objc_msgSend(v3, "state") == 3 || objc_msgSend(v3, "state") == 4;

  return v4;
}

- (void)_downloadRemoteCatalogAndAssets
{
  [(ACHMobileAssetProvider *)self _downloadDelay];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  id v5 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ACHMobileAssetProvider__downloadRemoteCatalogAndAssets__block_invoke;
  block[3] = &unk_264515DB8;
  block[4] = self;
  dispatch_after(v4, v5, block);
}

uint64_t __57__ACHMobileAssetProvider__downloadRemoteCatalogAndAssets__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadRemoteCatalog];
}

- (double)_downloadDelay
{
  uint32_t v3 = arc4random_uniform(0xE10u);
  dispatch_time_t v4 = [(NSUserDefaults *)self->_nanoUserDefaults objectForKey:@"MobileAssetDownloadDelayOverride"];

  if (v4)
  {
    [(NSUserDefaults *)self->_nanoUserDefaults doubleForKey:@"MobileAssetDownloadDelayOverride"];
    double downloadDelayOverride = v5;
  }
  else if (self->_downloadDelayOverride >= 0.0)
  {
    double downloadDelayOverride = self->_downloadDelayOverride;
  }
  else
  {
    double downloadDelayOverride = (double)(v3 + 1);
  }
  int64_t v7 = ACHLogAssets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACHMobileAssetProvider *)v7 _downloadDelay];
  }

  return downloadDelayOverride;
}

- (void)_fetchLocalAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(ACHMobileAssetProvider *)self _compatibilityVersionQueryParameters];
  id v6 = [(ACHMobileAssetProvider *)self mobileAssetDownloadManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke;
  v8[3] = &unk_264516060;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchAssetsWithQueryParams:v5 onlyLocal:1 completion:v8];
}

void __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ACHLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_cold_1();
    }
  }
  id v8 = ACHLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu local assets", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v5 count]) {
    [v9 addObjectsFromArray:v5];
  }
  uint64_t v10 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_291;
  v11[3] = &unk_264516038;
  v11[4] = v10;
  id v12 = *(id *)(a1 + 40);
  [v10 _processAssets:v9 completion:v11];
}

void __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_291(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ACHLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    uint64_t v12 = [v9 count];
    __int16 v13 = 2048;
    uint64_t v14 = [v7 count];
    __int16 v15 = 2048;
    uint64_t v16 = [v8 count];
    _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "%lu assets are installed, %lu assets are not downloaded, removing %lu old assets", (uint8_t *)&v11, 0x20u);
  }

  [*(id *)(a1 + 32) _removeAssets:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)downloadRemoteCatalog
{
  uint32_t v3 = [(ACHMobileAssetProvider *)self _compatibilityVersionQueryParameters];
  objc_initWeak(&location, self);
  id v4 = [(ACHMobileAssetProvider *)self mobileAssetDownloadManager];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke;
  v5[3] = &unk_2645160B0;
  objc_copyWeak(&v6, &location);
  [v4 fetchAssetsWithQueryParams:v3 onlyLocal:0 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ACHLogAssets();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_cold_1();
    }
  }
  id v8 = ACHLogAssets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = [v5 count];
    _os_log_impl(&dword_21F5DA000, v8, OS_LOG_TYPE_DEFAULT, "Query returned %lu remote assets", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v5 count]) {
    [v9 addObjectsFromArray:v5];
  }
  uint64_t v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_293;
  v12[3] = &unk_264516088;
  objc_copyWeak(&v13, v10);
  [WeakRetained _processAssets:v9 completion:v12];

  objc_destroyWeak(&v13);
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_293(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ACHLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218496;
    uint64_t v15 = [v7 count];
    __int16 v16 = 2048;
    uint64_t v17 = [v8 count];
    __int16 v18 = 2048;
    uint64_t v19 = [v9 count];
    _os_log_impl(&dword_21F5DA000, v10, OS_LOG_TYPE_DEFAULT, "Downloading %lu assets, removing %lu assets, %lu assets already installed", (uint8_t *)&v14, 0x20u);
  }

  int v11 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v11);
  [WeakRetained _removeAssets:v8];

  if ([v7 count])
  {
    id v13 = objc_loadWeakRetained(v11);
    [v13 _downloadRemoteAssets:v7 installedAssets:v9];
  }
  else
  {
    id v13 = ACHLogAssets();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_293_cold_1(v13);
    }
  }
}

- (void)_downloadRemoteAssets:(id)a3 installedAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ACHMobileAssetProvider *)self _downloadDelay];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  uint64_t v10 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke;
  block[3] = &unk_264516100;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_after(v9, v10, block);
}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2;
  v3[3] = &unk_2645160D8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 48);
  [v1 _downloadAssets:v2 withCompletion:v3];
}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) remoteDownloadCompleteCompletion];

  if (v7)
  {
    double v8 = [*(id *)(a1 + 32) remoteDownloadCompleteCompletion];
    v8[2]();
  }
  dispatch_time_t v9 = ACHLogAssets();
  uint64_t v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_1(a1, v5);
  }
}

- (void)_downloadAssets:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    double v8 = [(ACHMobileAssetProvider *)self mobileAssetDownloadManager];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke;
    v10[3] = &unk_264516128;
    id v11 = v7;
    [v8 downloadMobileAssets:v6 completion:v10];
  }
  else
  {
    dispatch_time_t v9 = ACHLogAssets();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACHMobileAssetProvider _downloadAssets:withCompletion:](v9);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x263EFFA68], 0);
  }
}

void __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = ACHLogAssets();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke_cold_1(v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_removeAssets:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v4 = [(ACHMobileAssetProvider *)self mobileAssetDownloadManager];
    [v4 removeMobileAssets:v5 completion:&__block_literal_global_295];
  }
}

void __40__ACHMobileAssetProvider__removeAssets___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = ACHLogAssets();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __40__ACHMobileAssetProvider__removeAssets___block_invoke_cold_1();
    }
  }
}

- (void)_processAssets:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v16 = a3;
  uint64_t v17 = (void (**)(id, id, id, id))a4;
  uint64_t v20 = self;
  id v23 = [(ACHMobileAssetProvider *)self _assetsGroupedByUniqueNameAndType:v16];
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [v23 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v7)
  {
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(obj);
        }
        dispatch_time_t v9 = [v23 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__1;
        v39 = __Block_byref_object_dispose__1;
        id v40 = 0;
        uint64_t v29 = 0;
        __int16 v30 = &v29;
        uint64_t v31 = 0x3032000000;
        v32 = __Block_byref_object_copy__1;
        uint64_t v33 = __Block_byref_object_dispose__1;
        id v34 = 0;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __52__ACHMobileAssetProvider__processAssets_completion___block_invoke;
        v28[3] = &unk_264516170;
        v28[4] = &v35;
        v28[5] = &v29;
        [(ACHMobileAssetProvider *)v20 _getCurrentAsssetAndOlderAssetsFromAssets:v9 completion:v28];
        if ([(id)v36[5] state] == 2) {
          uint64_t v10 = v21;
        }
        else {
          uint64_t v10 = v22;
        }
        [v10 addObject:v36[5]];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = (id)v30[5];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v45 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v11);
              }
              id v15 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              if ([v15 state] == 2) {
                [v6 addObject:v15];
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v45 count:16];
          }
          while (v12);
        }

        _Block_object_dispose(&v29, 8);
        _Block_object_dispose(&v35, 8);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v7);
  }

  if (v17) {
    v17[2](v17, v22, v6, v21);
  }
}

void __52__ACHMobileAssetProvider__processAssets_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_assetsGroupedByUniqueNameAndType:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v19 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x263F23708];
    uint64_t v8 = *MEMORY[0x263F236F8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [v10 attributes];
        uint64_t v12 = [v11 objectForKeyedSubscript:v7];

        uint64_t v13 = [v10 attributes];
        id v14 = [v13 objectForKeyedSubscript:v8];

        id v15 = [NSString stringWithFormat:@"%@-%@", v12, v14];
        id v16 = [v4 objectForKeyedSubscript:v15];
        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v4 setObject:v16 forKeyedSubscript:v15];
        }
        [v16 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)_getCurrentAsssetAndOlderAssetsFromAssets:(id)a3 completion:(id)a4
{
  uint64_t v10 = (void (**)(id, void *, void *))a4;
  id v5 = a3;
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_304];
  uint64_t v7 = [MEMORY[0x263EFF9C0] setWithArray:v5];

  uint64_t v8 = [v6 lastObject];
  if (v8) {
    [v7 removeObject:v8];
  }
  if (v10)
  {
    uint64_t v9 = [v7 allObjects];
    v10[2](v10, v8, v9);
  }
}

uint64_t __79__ACHMobileAssetProvider__getCurrentAsssetAndOlderAssetsFromAssets_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 attributes];
  uint64_t v7 = *MEMORY[0x263F55868];
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F55868]];
  uint64_t v9 = [v8 integerValue];

  uint64_t v10 = [v4 attributes];
  id v11 = [v10 objectForKeyedSubscript:v7];
  uint64_t v12 = [v11 integerValue];

  uint64_t v13 = [v5 attributes];
  uint64_t v14 = *MEMORY[0x263F55880];
  id v15 = [v13 objectForKeyedSubscript:*MEMORY[0x263F55880]];
  uint64_t v16 = [v15 integerValue];

  uint64_t v17 = [v4 attributes];
  __int16 v18 = [v17 objectForKeyedSubscript:v14];
  uint64_t v19 = [v18 integerValue];

  long long v20 = [v5 attributes];

  uint64_t v21 = *MEMORY[0x263F55898];
  long long v22 = [v20 objectForKeyedSubscript:*MEMORY[0x263F55898]];
  uint64_t v23 = [v22 integerValue];

  long long v24 = [v4 attributes];

  uint64_t v25 = [v24 objectForKeyedSubscript:v21];
  uint64_t v26 = [v25 integerValue];

  if (v9 < v12) {
    return -1;
  }
  if (v9 > v12) {
    return 1;
  }
  if (v16 < v19) {
    return -1;
  }
  if (v16 > v19) {
    return 1;
  }
  if (v23 >= v26) {
    return v23 > v26;
  }
  else {
    return -1;
  }
}

- (id)_compatibilityVersionQueryParameters
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  for (uint64_t i = 3; i != 8; ++i)
  {
    id v4 = [NSNumber numberWithInteger:i];
    id v5 = [v4 stringValue];
    [v2 addObject:v5];
  }
  uint64_t v8 = *MEMORY[0x263F55868];
  v9[0] = v2;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return v6;
}

- (_HKMobileAssetDownloadManager)mobileAssetDownloadManager
{
  return self->_mobileAssetDownloadManager;
}

- (void)setMobileAssetDownloadManager:(id)a3
{
}

- (NSUserDefaults)nanoUserDefaults
{
  return self->_nanoUserDefaults;
}

- (void)setNanoUserDefaults:(id)a3
{
}

- (double)downloadDelayOverride
{
  return self->_downloadDelayOverride;
}

- (void)setDownloadDelayOverride:(double)a3
{
  self->_double downloadDelayOverride = a3;
}

- (id)remoteDownloadCompleteCompletion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRemoteDownloadCompleteCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteDownloadCompleteCompletion, 0);
  objc_storeStrong((id *)&self->_nanoUserDefaults, 0);
  objc_storeStrong((id *)&self->_mobileAssetDownloadManager, 0);
}

void __30__ACHMobileAssetProvider_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Default asset download completion handler called. This is unexpected.", v1, 2u);
}

void __30__ACHMobileAssetProvider_init__block_invoke_282_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error with mobile assets: %@", v2, v3, v4, v5, v6);
}

void __57__ACHMobileAssetProvider_downloadedAssetDiskUsageInBytes__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error querying local assets for CacheDelete disk usage reporting: %{public}@.", v2, v3, v4, v5, v6);
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error querying local assets for CacheDelete purging: %{public}@.", v2, v3, v4, v5, v6);
}

void __50__ACHMobileAssetProvider_purgeAllDownloadedAssets__block_invoke_287_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error purging assets for CacheDelete: %@", v2, v3, v4, v5, v6);
}

- (void)_downloadDelay
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_21F5DA000, log, OS_LOG_TYPE_DEBUG, "Mobile Assets download delay is %f", (uint8_t *)&v2, 0xCu);
}

void __58__ACHMobileAssetProvider__fetchLocalAssetsWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error querying local assets: %{public}@.", v2, v3, v4, v5, v6);
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error querying remote assets: %{public}@. Going ahead to attempt processing local assets", v2, v3, v4, v5, v6);
}

void __47__ACHMobileAssetProvider_downloadRemoteCatalog__block_invoke_293_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21F5DA000, log, OS_LOG_TYPE_DEBUG, "No remote assets to download.", v1, 2u);
}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 40) count];
  [a2 count];
  OUTLINED_FUNCTION_2(&dword_21F5DA000, v3, v4, "Combining installed assets count %lu with downloaded assets count: %lu", v5, v6, v7, v8, 0);
}

void __64__ACHMobileAssetProvider__downloadRemoteAssets_installedAssets___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error downloading assets: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_downloadAssets:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21F5DA000, log, OS_LOG_TYPE_DEBUG, "No assets to download, calling completion with empty array and returning early", v1, 2u);
}

void __57__ACHMobileAssetProvider__downloadAssets_withCompletion___block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21F5DA000, v1, v2, "Received downloaded asset count %lu, error: %@", v3, v4, v5, v6, v7);
}

void __40__ACHMobileAssetProvider__removeAssets___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21F5DA000, v0, v1, "Error removing assets: %@", v2, v3, v4, v5, v6);
}

@end