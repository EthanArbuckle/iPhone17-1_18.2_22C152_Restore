@interface AXAuditAssetManager
+ (AXAuditAssetManager)shared;
- (AXAuditAssetManager)init;
- (AXElementVisionModelAssetPolicy)_elementVisionModelAssetPolicy;
- (AXIconVisionModelAssetPolicy)_iconVisionModelAssetPolicy;
- (NSArray)_assetControllers;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)downloadAssetsIfNecessary;
- (void)set_assetControllers:(id)a3;
- (void)set_elementVisionModelAssetPolicy:(id)a3;
- (void)set_iconVisionModelAssetPolicy:(id)a3;
@end

@implementation AXAuditAssetManager

+ (AXAuditAssetManager)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AXAuditAssetManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_instance;

  return (AXAuditAssetManager *)v2;
}

uint64_t __29__AXAuditAssetManager_shared__block_invoke()
{
  shared_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXAuditAssetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AXAuditAssetManager;
  v2 = [(AXAuditAssetManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F21170] policy];
    iconVisionModelAssetPolicy = v2->__iconVisionModelAssetPolicy;
    v2->__iconVisionModelAssetPolicy = (AXIconVisionModelAssetPolicy *)v3;

    uint64_t v5 = [MEMORY[0x263F21168] policy];
    elementVisionModelAssetPolicy = v2->__elementVisionModelAssetPolicy;
    v2->__elementVisionModelAssetPolicy = (AXElementVisionModelAssetPolicy *)v5;
  }
  return v2;
}

- (void)downloadAssetsIfNecessary
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  v1 = "-[AXAuditAssetManager downloadAssetsIfNecessary]";
  _os_log_debug_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v0, 0xCu);
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v12 = [v9 assetPolicy];
    *(_DWORD *)buf = 136315394;
    v30 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: for policy: %@", buf, 0x16u);
  }
  if (a5)
  {
    if ([v10 count])
    {
      v22 = v9;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
        __int16 v31 = 2112;
        id v32 = v10;
        _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: Found assets: %@", buf, 0x16u);
      }
      v23 = objc_msgSend(MEMORY[0x263EFF980], "array", v11);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v21 = v10;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        v17 = &_os_log_internal;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if ([v19 isInstalled])
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v30 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
                __int16 v31 = 2112;
                id v32 = v19;
                _os_log_impl(&dword_247247000, v17, OS_LOG_TYPE_INFO, "%s: Asset already downloaded! Asset: %@", buf, 0x16u);
              }
            }
            else if (([v19 isInstalled] & 1) == 0 && (objc_msgSend(v19, "isDownloading") & 1) == 0)
            {
              [v23 addObject:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }

      id v9 = v22;
      id v11 = v20;
      if ([v23 count])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
          __int16 v31 = 2112;
          id v32 = v23;
          _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: Need to download assets: %@", buf, 0x16u);
        }
        [v22 downloadAssets:v23 successStartBlock:&__block_literal_global_21];
      }

      id v10 = v21;
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]();
  }
}

void __85__AXAuditAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v2 = 136315138;
      uint64_t v3 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]_block_invoke";
      _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: Successfully downloaded assets!", (uint8_t *)&v2, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __85__AXAuditAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1();
  }
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[AXAuditAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]";
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: asset successfully installed! %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[AXAuditAssetManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]();
  }
}

- (AXIconVisionModelAssetPolicy)_iconVisionModelAssetPolicy
{
  return self->__iconVisionModelAssetPolicy;
}

- (void)set_iconVisionModelAssetPolicy:(id)a3
{
}

- (AXElementVisionModelAssetPolicy)_elementVisionModelAssetPolicy
{
  return self->__elementVisionModelAssetPolicy;
}

- (void)set_elementVisionModelAssetPolicy:(id)a3
{
}

- (NSArray)_assetControllers
{
  return self->__assetControllers;
}

- (void)set_assetControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetControllers, 0);
  objc_storeStrong((id *)&self->__elementVisionModelAssetPolicy, 0);

  objc_storeStrong((id *)&self->__iconVisionModelAssetPolicy, 0);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  v1 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]";
  _os_log_error_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: did not find any assets", (uint8_t *)&v0, 0xCu);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: asset refresh was not successful. Error: %@", (uint8_t *)v0, 0x16u);
}

void __85__AXAuditAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  uint64_t v1 = "-[AXAuditAssetManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]_block_invoke";
  _os_log_error_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Asset download failed!", (uint8_t *)&v0, 0xCu);
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v3 = v0;
  uint64_t v4 = v1;
  _os_log_error_impl(&dword_247247000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: asset download was not successful: error: %@, asset: %@", (uint8_t *)v2, 0x20u);
}

@end