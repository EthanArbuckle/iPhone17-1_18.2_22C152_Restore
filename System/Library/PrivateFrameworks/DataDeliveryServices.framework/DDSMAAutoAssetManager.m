@interface DDSMAAutoAssetManager
+ (BOOL)isAutoAssetType:(id)a3;
- (DDSAssetQueryResultCache)assetQueryResultsCache;
- (DDSMAAutoAssetManager)init;
- (DDSMAAutoAssetManager)initWithProvider:(id)a3 dataSource:(id)a4;
- (DDSMAAutoAssetManagerDataSource)dataSource;
- (DDSMAAutoAssetProvider)provider;
- (id)assetsAvailableOnDeviceForQuery:(id)a3;
- (id)assetsForQuery:(id)a3;
- (id)autoAssetSelectorsForQuery:(id)a3;
- (id)autoAssetTypeForAsserType:(id)a3;
- (id)autoAssetsForQuery:(id)a3;
- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4;
- (void)lockAssetsForQuery:(id)a3;
- (void)registerInterestInContentForQuery:(id)a3;
- (void)serverDidUpdateAssetsWithType:(id)a3;
- (void)unregisterInterestInContentForAssetSelector:(id)a3;
- (void)updateAssetForQuery:(id)a3 callback:(id)a4;
@end

@implementation DDSMAAutoAssetManager

- (id)assetsForQuery:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DDSMAAutoAssetManager *)self assetQueryResultsCache];
  v6 = [v5 cachedAssetsForQuery:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else if ([v4 cachedOnly])
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v7 = [(DDSMAAutoAssetManager *)self assetsAvailableOnDeviceForQuery:v4];
    v8 = [(DDSMAAutoAssetManager *)self assetQueryResultsCache];
    [v8 cacheAssets:v7 forQuery:v4];

    v9 = QueryLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = +[DDSAsset debuggingIDsForAssets:v7];
      int v15 = 138544130;
      id v16 = v4;
      __int16 v17 = 2114;
      v18 = v10;
      __int16 v19 = 1024;
      BOOL v20 = 0;
      __int16 v21 = 1024;
      int v22 = [v4 cachedOnly];
      _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Updated cache for query: %{public}@ assets: %{public}@ was cached: %d, cachedOnly: %d", (uint8_t *)&v15, 0x22u);
    }
  }
  v11 = QueryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = +[DDSAsset debuggingIDsForAssets:v7];
    int v13 = [v4 cachedOnly];
    int v15 = 138544130;
    id v16 = v4;
    __int16 v17 = 2114;
    v18 = v12;
    __int16 v19 = 1024;
    BOOL v20 = v6 != 0;
    __int16 v21 = 1024;
    int v22 = v13;
    _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "assetsForQuery: %{public}@ final result: %{public}@ was cached: %d, cachedOnly: %d", (uint8_t *)&v15, 0x22u);
  }
  return v7;
}

- (DDSAssetQueryResultCache)assetQueryResultsCache
{
  return self->_assetQueryResultsCache;
}

- (DDSMAAutoAssetManager)init
{
  v3 = objc_alloc_init(DDSMAAutoAssetProvider);
  id v4 = objc_alloc_init(DDSMAAutoAssetManagerDataSource);
  v5 = [(DDSMAAutoAssetManager *)self initWithProvider:v3 dataSource:v4];

  return v5;
}

- (DDSMAAutoAssetManager)initWithProvider:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DDSMAAutoAssetManager;
  v9 = [(DDSMAAutoAssetManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = objc_alloc_init(DDSAssetQueryResultCache);
    assetQueryResultsCache = v10->_assetQueryResultsCache;
    v10->_assetQueryResultsCache = v11;
  }
  return v10;
}

+ (BOOL)isAutoAssetType:(id)a3
{
  return [a3 isEqualToString:@"com.apple.MobileAsset.LinguisticDataAuto"];
}

- (id)autoAssetTypeForAsserType:(id)a3
{
  id v4 = a3;
  v5 = [(DDSMAAutoAssetManager *)self dataSource];
  char v6 = [v5 shouldDownloadAutoAsset];

  if (v6)
  {
    if ([v4 isEqualToString:@"com.apple.MobileAsset.LinguisticData"])
    {
      id v7 = @"com.apple.MobileAsset.LinguisticDataAuto";
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = AutoAssetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "AutoAsset support is disabled", v10, 2u);
    }
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (id)autoAssetSelectorsForQuery:(id)a3
{
  id v4 = a3;
  v5 = [(DDSMAAutoAssetManager *)self dataSource];
  char v6 = [v5 shouldDownloadAutoAsset];

  if (v6)
  {
    id v7 = [(DDSMAAutoAssetManager *)self dataSource];
    id v8 = [v7 supportedAutoAssetSpecifiers];
    v9 = +[DDSMAAutoAssetSelector createWithQuery:v4 supportedAssetSpecifiers:v8];
  }
  else
  {
    v10 = AutoAssetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "AutoAsset support is disabled", v12, 2u);
    }

    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)autoAssetsForQuery:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  char v6 = [(DDSMAAutoAssetManager *)self autoAssetSelectorsForQuery:v4];
  if ([v6 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      __int16 v17 = v6;
      id v18 = v4;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v13 = [(DDSMAAutoAssetManager *)self provider];
          objc_super v14 = [v13 autoAssetForAssetSelector:v12];

          if (v14)
          {
            [v5 addObject:v14];
          }
          else
          {
            int v15 = AutoAssetLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v25 = v12;
              _os_log_impl(&dword_1E41D6000, v15, OS_LOG_TYPE_DEFAULT, "Auto asset object cannot be created for asset selector: %{public}@", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
      char v6 = v17;
      id v4 = v18;
    }
  }
  else
  {
    id v7 = AutoAssetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v4;
      _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset is not supported for query: %{public}@", buf, 0xCu);
    }
  }

  return v5;
}

- (void)registerInterestInContentForQuery:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = AutoAssetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Register interest in auto assets for query: %{public}@", buf, 0xCu);
  }

  [(DDSMAAutoAssetManager *)self autoAssetsForQuery:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [(DDSMAAutoAssetManager *)self provider];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke;
        v13[3] = &unk_1E6E3AAA8;
        v13[4] = v10;
        v13[5] = self;
        objc_super v14 = @"dds-add-assertion-lock";
        [v11 interestInContentForAutoAsset:v10 completion:v13];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

void __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    v3 = AutoAssetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 32) assetSelector];
      *(_DWORD *)buf = 138543362;
      v11 = v4;
      _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Interest in auto asset: %{public}@ submitted, now lock the auto asset to download the content", buf, 0xCu);
    }
    v5 = [*(id *)(a1 + 40) provider];
    uint64_t v6 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke_8;
    v7[3] = &unk_1E6E3AA80;
    long long v8 = *(_OWORD *)(a1 + 32);
    id v9 = v6;
    [v5 lockAutoAsset:(void)v8 forReason:v9 withTimeout:-1 completion:v7];
  }
}

void __59__DDSMAAutoAssetManager_registerInterestInContentForQuery___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = AutoAssetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      long long v8 = [*(id *)(a1 + 32) assetSelector];
      int v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Auto asset content is downloaded now unlock the auto asset: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v6 = [*(id *)(a1 + 40) provider];
    [v6 unlockAutoAsset:*(void *)(a1 + 32) forReason:*(void *)(a1 + 48)];
  }
  else if (v7)
  {
    id v9 = [*(id *)(a1 + 32) assetSelector];
    int v10 = 138543618;
    v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Auto asset lock failed for asset: %{public}@ with error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)unregisterInterestInContentForAssetSelector:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AutoAssetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Eliminate interest in content for asset selector: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [(DDSMAAutoAssetManager *)self provider];
  BOOL v7 = [v4 assetSelector];
  [v6 eliminateInterestForAutoAsset:v7];
}

- (void)lockAssetsForQuery:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AutoAssetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Locking auto asset for query: %{public}@", buf, 0xCu);
  }

  [(DDSMAAutoAssetManager *)self autoAssetsForQuery:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [(DDSMAAutoAssetManager *)self provider];
        id v19 = 0;
        __int16 v12 = [v11 lockAutoAssetSync:v10 forReason:@"dds-periodic-update-lock" error:&v19];
        id v13 = v19;

        uint64_t v14 = AutoAssetLog();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v15)
          {
            long long v16 = [v10 assetSelector];
            *(_DWORD *)buf = 138543362;
            id v25 = v16;
            _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "Unlocking auto asset: %{public}@", buf, 0xCu);
          }
          uint64_t v14 = [(DDSMAAutoAssetManager *)self provider];
          [v14 unlockAutoAsset:v10 forReason:@"dds-periodic-update-lock"];
        }
        else if (v15)
        {
          long long v17 = [v10 assetSelector];
          *(_DWORD *)buf = 138543618;
          id v25 = v17;
          __int16 v26 = 2114;
          id v27 = v13;
          _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "Failed to lock the auto asset: %{public}@, with error: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v7);
  }
}

- (id)assetsAvailableOnDeviceForQuery:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = (id)objc_opt_new();
  [(DDSMAAutoAssetManager *)self autoAssetsForQuery:v19];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v8 = [(DDSMAAutoAssetManager *)self provider];
        id v23 = 0;
        id v9 = [v8 lockAutoAssetSync:v7 forReason:@"dds-asset-for-query" error:&v23];
        id v10 = v23;

        if (v9)
        {
          uint64_t v11 = [v9 compatibilityVersion];
          __int16 v12 = [(DDSMAAutoAssetManager *)self dataSource];
          uint64_t v13 = [v12 linguisticAssetCompatabilityVersion];

          if (v11 == v13)
          {
            [v20 addObject:v9];
            uint64_t v14 = [(DDSMAAutoAssetManager *)self provider];
            [v14 unlockAutoAsset:v7 forReason:@"dds-asset-for-query"];
          }
          else
          {
            uint64_t v14 = AutoAssetLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = [v7 assetSelector];
              uint64_t v17 = [v9 contentVersion];
              *(_DWORD *)buf = 138543618;
              uint64_t v29 = v16;
              __int16 v30 = 2048;
              uint64_t v31 = v17;
              _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "Skip auto asset: %{public}@ with content version: %lu due to mismatch in compatibility version", buf, 0x16u);
            }
          }
        }
        else
        {
          uint64_t v14 = AutoAssetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v15 = [v7 assetSelector];
            *(_DWORD *)buf = 138543618;
            uint64_t v29 = v15;
            __int16 v30 = 2114;
            uint64_t v31 = (uint64_t)v10;
            _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "Failed to lock the auto asset: %{public}@, with error: %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }

  return v20;
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AutoAssetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Updated the assets for asset type: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(DDSMAAutoAssetManager *)self assetQueryResultsCache];
  [v6 clearCacheForAssetType:v4];
}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v15 = a4;
  uint64_t v5 = AutoAssetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Fetch asset update status for query: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  __int16 v12 = [(DDSMAAutoAssetManager *)self autoAssetsForQuery:v11];
  if ([v12 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    uint64_t v32 = [v12 count];
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    char v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 1;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v12;
    uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
          id v10 = [(DDSMAAutoAssetManager *)self provider];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke;
          v16[3] = &unk_1E6E3AAD0;
          p_long long buf = &buf;
          id v19 = v27;
          v16[4] = v9;
          id v20 = v25;
          id v17 = v15;
          [v10 fetchUpdateStatusForAutoAsset:v9 completion:v16];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v6);
    }

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
  }
}

void __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke(void *a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  --*(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v7 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = 1;
  }
  else {
    char v8 = a2;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v5 && [v5 code] != 6201)
  {
    uint64_t v9 = AutoAssetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1((uint64_t)a1, (uint64_t)v6, v9);
    }

    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(a1[8] + 8) + 24))
    {
      (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      uint64_t v10 = a1[5];
      id v11 = DDSAssetDownloadUIError((void *)4);
      (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
    }
  }
}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v15 = a4;
  uint64_t v6 = AutoAssetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Update auto asset for query: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v13 = [(DDSMAAutoAssetManager *)self autoAssetsForQuery:v12];
  if ([v13 count])
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v26 = [v13 count];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x3032000000;
    __int16 v30 = __Block_byref_object_copy__6;
    uint64_t v31 = __Block_byref_object_dispose__6;
    id v32 = (id)MEMORY[0x1E4F1CC38];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = v13;
    uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
          id v11 = [(DDSMAAutoAssetManager *)self provider];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __54__DDSMAAutoAssetManager_updateAssetForQuery_callback___block_invoke;
          v16[3] = &unk_1E6E3AAF8;
          v16[4] = v10;
          void v16[5] = self;
          id v19 = v25;
          p_long long buf = &buf;
          id v17 = @"dds-asset-download-ui-lock";
          id v18 = v15;
          [v11 updateAutoAsset:v10 forReason:@"dds-asset-download-ui-lock" completion:v16];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v7);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v25, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, MEMORY[0x1E4F1CC38], 0);
  }
}

void __54__DDSMAAutoAssetManager_updateAssetForQuery_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  --*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  uint64_t v7 = AutoAssetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) assetSelector];
      int v14 = 138543362;
      id v15 = v9;
      _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset content is updated, now unlock the auto asset: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v10 = [*(id *)(a1 + 40) provider];
    [v10 unlockAutoAsset:*(void *)(a1 + 32) forReason:*(void *)(a1 + 48)];
    goto LABEL_5;
  }
  if (v8)
  {
    id v12 = [*(id *)(a1 + 32) assetSelector];
    int v14 = 138543618;
    id v15 = v12;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset lock failed for asset: %{public}@ with error: %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (v6 && [v6 code] != 6201)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v10 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = MEMORY[0x1E4F1CC28];
LABEL_5:
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      id v11 = 0;
    }
    else
    {
      id v11 = DDSAssetDownloadUIError((void *)2);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (DDSMAAutoAssetProvider)provider
{
  return self->_provider;
}

- (DDSMAAutoAssetManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetQueryResultsCache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __65__DDSMAAutoAssetManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) assetSelector];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1E41D6000, a3, OS_LOG_TYPE_ERROR, "Fetch auto asset update status failed for asset: %{public}@ with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end