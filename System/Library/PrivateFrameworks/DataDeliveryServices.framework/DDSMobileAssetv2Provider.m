@interface DDSMobileAssetv2Provider
+ (id)latestAssetsOnlyFromAssets:(id)a3;
+ (id)latestBetweenAssetA:(id)a3 AssetB:(id)a4;
+ (id)platformVersion;
+ (void)platformVersion;
- (BOOL)shouldMatchAttributeValue:(id)a3 givenValue:(id)a4;
- (DDSAssetProvidingDelegate)delegate;
- (DDSAssetQueryResultCache)assetQueryResultsCache;
- (DDSMobileAssetv2Provider)init;
- (DDSMobileAssetv2Provider)initWithDataSource:(id)a3;
- (DDSMobileAssetv2ProviderDataSource)dataSource;
- (NSMutableDictionary)compatabilityVersionByAssetType;
- (NSMutableDictionary)downloadStateByAssetID;
- (id)allContentItemsMatchingQuery:(id)a3 error:(id *)a4;
- (id)assetsForQuery:(id)a3 errorPtr:(id *)a4;
- (id)assetsInCalalogForQuery:(id)a3 errorPtr:(id *)a4;
- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4;
- (id)downloadOptionsForCatalogWithType:(id)a3 discretionaryDownload:(BOOL)a4;
- (id)downloadOptionsForPolicy:(id)a3 discretionaryDownload:(BOOL)a4;
- (id)updatableAssetsForAssertion:(id)a3;
- (int64_t)compatabilityVersionForAssetType:(id)a3;
- (void)beginDownloadForAssertion:(id)a3 discretionaryDownload:(BOOL)a4 handler:(id)a5;
- (void)beginDownloadForAssertions:(id)a3 discretionaryDownload:(BOOL)a4;
- (void)beginDownloadForAssets:(id)a3 withPolicy:(id)a4 discretionaryDownload:(BOOL)a5 error:(id *)a6 handler:(id)a7;
- (void)didChangeDownloadState:(unint64_t)a3 forAsset:(id)a4;
- (void)didCompleteDownloadForAssertion:(id)a3 error:(id)a4;
- (void)didUpdateCatalogWithAssetType:(id)a3 error:(id)a4;
- (void)removeAssets:(id)a3;
- (void)removeAssetsForAssertions:(id)a3;
- (void)removeOldAssetsForAssertions:(id)a3;
- (void)serverDidUpdateAssetsWithType:(id)a3;
- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4;
- (void)setDelegate:(id)a3;
- (void)startCatalogDownloadForAssetType:(id)a3 withDownloadOptions:(id)a4 withCompletion:(id)a5;
- (void)startDownloadForAsset:(id)a3 withOptions:(id)a4 progress:(id)a5 handler:(id)a6;
- (void)updateCatalogForAssetType:(id)a3 discretionaryDownload:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation DDSMobileAssetv2Provider

- (id)allContentItemsMatchingQuery:(id)a3 error:(id *)a4
{
  v6 = -[DDSMobileAssetv2Provider assetsForQuery:errorPtr:](self, "assetsForQuery:errorPtr:", a3);
  if (*a4)
  {
    v7 = QueryLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DDSMobileAssetv2Provider allContentItemsMatchingQuery:error:]((uint64_t)a4, v7, v8, v9, v10, v11, v12, v13);
    }

    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v14 = [(DDSMobileAssetv2Provider *)self contentItemsFromAssets:v6 matchingFilter:0];
  }

  return v14;
}

- (id)contentItemsFromAssets:(id)a3 matchingFilter:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 attributes];
        v14 = [v13 objectForKeyedSubscript:@"Contents"];
        v15 = [v6 filters];
        v16 = +[DDSContentItemMatcher assetContentItemsMatching:v15 contentItems:v14 parentAsset:v12];

        [v7 addObjectsFromArray:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)assetsForQuery:(id)a3 errorPtr:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(DDSMobileAssetv2Provider *)self assetQueryResultsCache];
  uint64_t v8 = [v7 cachedAssetsForQuery:v6];

  if (v8)
  {
    id v9 = v8;
  }
  else if ([v6 cachedOnly])
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v9 = [(DDSMobileAssetv2Provider *)self assetsInCalalogForQuery:v6 errorPtr:a4];
    uint64_t v10 = [(DDSMobileAssetv2Provider *)self assetQueryResultsCache];
    [v10 cacheAssets:v9 forQuery:v6];
  }
  uint64_t v11 = QueryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = +[DDSAsset debuggingIDsForAssets:v9];
    int v14 = 138544130;
    id v15 = v6;
    __int16 v16 = 2114;
    v17 = v12;
    __int16 v18 = 1024;
    BOOL v19 = v8 != 0;
    __int16 v20 = 1024;
    int v21 = [v6 cachedOnly];
    _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "assetsForQuery: %{public}@ final result: %{public}@ was cached: %d, cachedOnly: %d", (uint8_t *)&v14, 0x22u);
  }
  return v9;
}

- (DDSAssetQueryResultCache)assetQueryResultsCache
{
  return self->_assetQueryResultsCache;
}

- (id)assetsInCalalogForQuery:(id)a3 errorPtr:(id *)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(DDSMobileAssetv2Provider *)self dataSource];
  id v7 = [v5 assetType];
  int64_t v8 = [(DDSMobileAssetv2Provider *)self compatabilityVersionForAssetType:v7];
  v53 = self;
  id v9 = [(id)objc_opt_class() platformVersion];
  uint64_t v10 = [v6 maAssetQueryForDDSAssetQuery:v5 compatabilityVersion:v8 platformVersion:v9 internalInstall:DDS_IS_INTERNAL_INSTALL()];

  [v10 returnTypes:2];
  v43 = v10;
  if ([v10 queryMetaDataSync])
  {
    uint64_t v11 = QueryLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.5();
    }
  }
  uint64_t v12 = QueryLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:].cold.4();
  }

  uint64_t v13 = [v5 filter];
  int v14 = [v13 filters];
  id v15 = objc_msgSend(v14, "objectForKeyedSubscript:");
  __int16 v16 = [v15 allObjects];

  v17 = QueryLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:]();
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = [v43 results];
  uint64_t v49 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v49)
  {
    uint64_t v19 = *(void *)v60;
    v46 = v16;
    v47 = v5;
    uint64_t v44 = *(void *)v60;
    id v45 = v18;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(obj);
        }
        int v21 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:]();
          }
          v50 = v21;
          uint64_t v51 = i;
          uint64_t v22 = [v21 attributes];
          v23 = [v22 objectForKeyedSubscript:@"AssetRegion"];

          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v52 = v16;
          uint64_t v24 = [v52 countByEnumeratingWithState:&v55 objects:v67 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            BOOL v26 = 0;
            uint64_t v54 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v56 != v54) {
                  objc_enumerationMutation(v52);
                }
                v28 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  -[DDSMobileAssetv2Provider assetsInCalalogForQuery:errorPtr:]();
                }
                v29 = [v28 objectForKeyedSubscript:@"Country"];
                v30 = [v23 objectForKeyedSubscript:@"Country"];
                BOOL v31 = [(DDSMobileAssetv2Provider *)v53 shouldMatchAttributeValue:v29 givenValue:v30];

                v32 = [v28 objectForKeyedSubscript:@"Province"];
                v33 = [v23 objectForKeyedSubscript:@"Province"];
                BOOL v34 = [(DDSMobileAssetv2Provider *)v53 shouldMatchAttributeValue:v32 givenValue:v33];

                v35 = [v28 objectForKeyedSubscript:@"City"];
                v36 = [v23 objectForKeyedSubscript:@"City"];
                BOOL v37 = [(DDSMobileAssetv2Provider *)v53 shouldMatchAttributeValue:v35 givenValue:v36];

                if (!v26 && v31) {
                  BOOL v26 = v34 && v37;
                }
                v38 = QueryLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  v64 = v23;
                  __int16 v65 = 1024;
                  int v66 = v26;
                  _os_log_debug_impl(&dword_1E41D6000, v38, OS_LOG_TYPE_DEBUG, "Found asset region: %{private}@ didMatch: %d", buf, 0x12u);
                }
              }
              uint64_t v25 = [v52 countByEnumeratingWithState:&v55 objects:v67 count:16];
            }
            while (v25);
          }
          else
          {
            BOOL v26 = 0;
          }

          id v5 = v47;
          if (([v47 installedOnly] & 1) == 0)
          {
            id v18 = v45;
            __int16 v16 = v46;
            uint64_t v19 = v44;
            int v21 = v50;
            uint64_t i = v51;
            if (!v26) {
              continue;
            }
LABEL_38:
            v39 = [[DDSMAAsset alloc] initWithMAAsset:v21];
            [v18 addObject:v39];

            continue;
          }
          id v18 = v45;
          __int16 v16 = v46;
          uint64_t v19 = v44;
          int v21 = v50;
          uint64_t i = v51;
          if (!v26) {
            continue;
          }
        }
        else if (([v5 installedOnly] & 1) == 0)
        {
          goto LABEL_38;
        }
        if ([v21 state] == 2 || objc_msgSend(v21, "state") == 3) {
          goto LABEL_38;
        }
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v49);
  }

  if ([v5 latestOnly])
  {
    id v40 = [(id)objc_opt_class() latestAssetsOnlyFromAssets:v18];
  }
  else
  {
    id v40 = v18;
  }
  v41 = v40;

  return v41;
}

- (DDSMobileAssetv2ProviderDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setCompatabilityVersion:(int64_t)a3 forAssetType:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v10 = [v6 numberWithInteger:a3];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v9 = [(DDSMobileAssetv2Provider *)self compatabilityVersionByAssetType];
  [v9 setObject:v10 forKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)compatabilityVersionForAssetType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"com.apple.MobileAsset.LinguisticData"])
  {
    id v5 = [(DDSMobileAssetv2Provider *)self dataSource];
    uint64_t v6 = [v5 linguisticAssetCompatabilityVersion];
LABEL_7:
    int64_t v9 = v6;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"com.apple.MobileAsset.MecabraDictionaryRapidUpdates"])
  {
    id v5 = [(DDSMobileAssetv2Provider *)self dataSource];
    uint64_t v6 = [v5 mecabraDictionaryRapidUpdatesAssetCompatabilityVersion];
    goto LABEL_7;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v8 = [(DDSMobileAssetv2Provider *)self compatabilityVersionByAssetType];
  id v5 = [v8 objectForKey:v4];

  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    uint64_t v6 = [v5 integerValue];
    goto LABEL_7;
  }
  uint64_t v11 = QueryLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[DDSMobileAssetv2Provider compatabilityVersionForAssetType:]();
  }

  int64_t v9 = -1;
LABEL_8:

  return v9;
}

- (NSMutableDictionary)compatabilityVersionByAssetType
{
  return self->_compatabilityVersionByAssetType;
}

+ (id)platformVersion
{
  v2 = (void *)MGCopyAnswer();
  int v3 = [v2 intValue];
  if (v2) {
    CFRelease(v2);
  }
  int v4 = v3 - 1;
  if (v3 - 1) < 0xB && ((0x52Fu >> v4)) {
    return off_1E6E3A740[v4];
  }
  id v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[DDSMobileAssetv2Provider platformVersion];
  }

  return 0;
}

+ (id)latestAssetsOnlyFromAssets:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "uniqueIdentifier", (void)v17);
        uint64_t v12 = [v4 objectForKeyedSubscript:v11];

        if (v12)
        {
          uint64_t v13 = [v4 objectForKeyedSubscript:v11];
          int v14 = [(id)objc_opt_class() latestBetweenAssetA:v13 AssetB:v10];
          [v4 setObject:v14 forKeyedSubscript:v11];
        }
        else
        {
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = [v4 allValues];

  return v15;
}

- (DDSMobileAssetv2Provider)init
{
  id v3 = objc_alloc_init(DDSMobileAssetv2ProviderDataSource);
  id v4 = [(DDSMobileAssetv2Provider *)self initWithDataSource:v3];

  return v4;
}

- (DDSMobileAssetv2Provider)initWithDataSource:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DDSMobileAssetv2Provider;
  uint64_t v6 = [(DDSMobileAssetv2Provider *)&v14 init];
  if (v6)
  {
    uint64_t v7 = objc_alloc_init(DDSAssetQueryResultCache);
    assetQueryResultsCache = v6->_assetQueryResultsCache;
    v6->_assetQueryResultsCache = v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    downloadStateByAssetID = v6->_downloadStateByAssetID;
    v6->_downloadStateByAssetID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    compatabilityVersionByAssetType = v6->_compatabilityVersionByAssetType;
    v6->_compatabilityVersionByAssetType = (NSMutableDictionary *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

- (BOOL)shouldMatchAttributeValue:(id)a3 givenValue:(id)a4
{
  id v5 = a3;
  char v6 = DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)a4);
  char v7 = [v5 isEqualToString:&stru_1F3FA8828];

  if (v5) {
    char v8 = 1;
  }
  else {
    char v8 = v7;
  }
  if (a4) {
    char v8 = 0;
  }
  return v8 | v6;
}

- (void)beginDownloadForAssertions:(id)a3 discretionaryDownload:(BOOL)a4
{
  BOOL v16 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = DefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v5 count];
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Begin download for %lu assertions", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = [MEMORY[0x1E4F28D30] hashTableWithOptions:512];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&buf + 1) + 40) addObject:*(void *)(*((void *)&v27 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v7 allObjects];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * v14);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke;
        v17[3] = &unk_1E6E3A5E0;
        v17[4] = self;
        p_long long buf = &buf;
        long long v20 = v25;
        id v18 = v7;
        [(DDSMobileAssetv2Provider *)self beginDownloadForAssertion:v15 discretionaryDownload:v16 handler:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v12);
  }

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&buf, 8);
}

void __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_2();
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObject:v5];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  if (v6)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(unsigned char *)(v9 + 24)) {
      *(unsigned char *)(v9 + 24) = 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v10 = UpdateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_1();
  }

  if (!v8)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v11 = [NSString stringWithFormat:@"Error updating assertions"];
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = ErrorDomainv2;
      long long v17 = @"message";
      v18[0] = v11;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v15 = [v12 errorWithDomain:v13 code:1 userInfo:v14];
    }
    else
    {
      uint64_t v15 = 0;
    }
    BOOL v16 = [*(id *)(a1 + 32) delegate];
    [v16 didCompleteDownloadForAssertions:*(void *)(a1 + 40) error:v15];
  }
}

- (void)beginDownloadForAssertion:(id)a3 discretionaryDownload:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = DefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "Begin download for assertion: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v11 = [v8 query];
  if ([v11 installedOnly])
  {
  }
  else
  {
    uint64_t v12 = [v8 query];
    int v13 = [v12 localOnly];

    if (!v13) {
      goto LABEL_9;
    }
  }
  uint64_t v14 = DefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[DDSMobileAssetv2Provider beginDownloadForAssertion:discretionaryDownload:handler:](v8, v14);
  }

LABEL_9:
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke;
  v28[3] = &unk_1E6E3A608;
  v28[4] = self;
  id v15 = v9;
  id v29 = v15;
  BOOL v16 = (void (**)(void, void, void))MEMORY[0x1E4E7D2C0](v28);
  long long v17 = [v8 query];
  id v27 = 0;
  id v18 = [(DDSMobileAssetv2Provider *)self assetsInCalalogForQuery:v17 errorPtr:&v27];
  id v19 = v27;

  if (v19 || ![v18 count])
  {
    ((void (**)(void, id, id))v16)[2](v16, v8, v19);
  }
  else
  {
    long long v20 = DefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = +[DDSAsset debuggingIDsForAssets:v18];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_1E41D6000, v20, OS_LOG_TYPE_DEFAULT, "Downloading assets %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    id v34 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v18];
    long long v22 = [v8 policy];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_297;
    v23[3] = &unk_1E6E3A630;
    p_long long buf = &buf;
    uint64_t v25 = v16;
    id v24 = v8;
    [(DDSMobileAssetv2Provider *)self beginDownloadForAssets:v18 withPolicy:v22 discretionaryDownload:v6 error:0 handler:v23];

    _Block_object_dispose(&buf, 8);
  }
}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) didCompleteDownloadForAssertion:v7 error:v5];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_297(uint64_t a1, void *a2, uint64_t a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = DefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_297_cold_2();
  }

  if ((unint64_t)(a3 - 9) > 1)
  {
    if (a3 == 11)
    {
      id v8 = NSString;
      id v9 = [v5 debuggingID];
      uint64_t v10 = [v8 stringWithFormat:@"Error downloading asset: %@", v9];

      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = ErrorDomainv2;
      id v15 = @"message";
      v16[0] = v10;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      uint64_t v14 = [v11 errorWithDomain:v12 code:1 userInfo:v13];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_12;
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObject:v5];
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
    {
      id v7 = DefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_297_cold_1(a1 + 48);
      }
    }
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_12:
}

- (void)startDownloadForAsset:(id)a3 withOptions:(id)a4 progress:(id)a5 handler:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [a3 maAsset];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke;
  v17[3] = &unk_1E6E3A658;
  id v18 = v9;
  id v13 = v9;
  [v12 attachProgressCallBack:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke_2;
  v15[3] = &unk_1E6E3A680;
  id v16 = v10;
  id v14 = v10;
  [v12 startDownload:v11 then:v15];
}

uint64_t __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __79__DDSMobileAssetv2Provider_startDownloadForAsset_withOptions_progress_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)beginDownloadForAssets:(id)a3 withPolicy:(id)a4 discretionaryDownload:(BOOL)a5 error:(id *)a6 handler:(id)a7
{
  BOOL v19 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v18 = [(DDSMobileAssetv2Provider *)self downloadOptionsForPolicy:v11 discretionaryDownload:v19];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke;
        v22[3] = &unk_1E6E3A6A8;
        v22[4] = self;
        v22[5] = v17;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2;
        v20[3] = &unk_1E6E3A6D0;
        v20[4] = v17;
        v20[5] = self;
        id v21 = v12;
        [(DDSMobileAssetv2Provider *)self startDownloadForAsset:v17 withOptions:v18 progress:v22 handler:v20];
        [(DDSMobileAssetv2Provider *)self didChangeDownloadState:1 forAsset:v17];
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }
}

void __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isStalled])
  {
    uint64_t v3 = 4;
  }
  else if ([v5 totalWritten] < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v4 = [v5 totalWritten];
    if (v4 >= [v5 totalExpected]) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = 3;
    }
  }
  [*(id *)(a1 + 32) didChangeDownloadState:v3 forAsset:*(void *)(a1 + 40)];
}

uint64_t __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2 > 22)
  {
    if (a2 == 23 || a2 == 36)
    {
      uint64_t v2 = 10;
      goto LABEL_12;
    }
  }
  else
  {
    if (!a2)
    {
      uint64_t v2 = 9;
      goto LABEL_12;
    }
    if (a2 == 10) {
      goto LABEL_12;
    }
  }
  uint64_t v4 = DefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2_cold_1(a1, v2, v4);
  }

  uint64_t v2 = 11;
LABEL_12:
  [*(id *)(a1 + 40) didChangeDownloadState:v2 forAsset:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), v2);
  }
  return result;
}

- (id)downloadOptionsForPolicy:(id)a3 discretionaryDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = (objc_class *)MEMORY[0x1E4F77FE8];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setAllowsCellularAccess:1];
  [v7 setAllowsExpensiveAccess:0];
  int v8 = [v6 downloadWithoutPower];

  [v7 setRequiresPowerPluggedIn:v8 ^ 1u];
  [v7 setDiscretionary:v4];
  return v7;
}

- (id)downloadOptionsForCatalogWithType:(id)a3 discretionaryDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
  [v5 setAllowsCellularAccess:1];
  [v5 setAllowsExpensiveAccess:0];
  [v5 setRequiresPowerPluggedIn:0];
  [v5 setDiscretionary:v4];
  return v5;
}

- (void)startCatalogDownloadForAssetType:(id)a3 withDownloadOptions:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  int v8 = (void *)MEMORY[0x1E4F77FB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__DDSMobileAssetv2Provider_startCatalogDownloadForAssetType_withDownloadOptions_withCompletion___block_invoke;
  v10[3] = &unk_1E6E3A680;
  id v11 = v7;
  id v9 = v7;
  [v8 startCatalogDownload:a3 options:a4 then:v10];
}

uint64_t __96__DDSMobileAssetv2Provider_startCatalogDownloadForAssetType_withDownloadOptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateCatalogForAssetType:(id)a3 discretionaryDownload:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = UpdateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v20 = v8;
    _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "Updating catalog for asset type %{public}@", buf, 0xCu);
  }

  id v11 = [(DDSMobileAssetv2Provider *)self downloadOptionsForCatalogWithType:v8 discretionaryDownload:v6];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke;
  v15[3] = &unk_1E6E3A6D0;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  [(DDSMobileAssetv2Provider *)self startCatalogDownloadForAssetType:v13 withDownloadOptions:v11 withCompletion:v15];
  uint64_t v14 = [(DDSMobileAssetv2Provider *)self delegate];
  [v14 didBeginUpdateCatalog];
}

void __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = UpdateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"Fail";
    if (!a2) {
      id v5 = @"Success";
    }
    *(_DWORD *)long long buf = 138543618;
    id v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    _os_log_impl(&dword_1E41D6000, v4, OS_LOG_TYPE_DEFAULT, "Updated catalog result %{public}@ (result: %lu)", buf, 0x16u);
  }

  if (a2)
  {
    BOOL v6 = [NSString stringWithFormat:@"Error updating catalog for %@: %lu", *(void *)(a1 + 32), a2];
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = ErrorDomainv2;
    id v13 = @"message";
    uint64_t v14 = v6;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v10 = [v7 errorWithDomain:v8 code:1 userInfo:v9];

    id v11 = UpdateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke_cold_1();
    }
  }
  else
  {
    id v10 = 0;
  }
  [*(id *)(a1 + 40) didUpdateCatalogWithAssetType:*(void *)(a1 + 32) error:v10];
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v10);
  }
}

+ (id)latestBetweenAssetA:(id)a3 AssetB:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 compatibilityVersion];
  uint64_t v8 = [v6 compatibilityVersion];
  id v9 = v5;
  if (v7 <= v8)
  {
    id v9 = v6;
    if (v8 <= v7)
    {
      uint64_t v10 = [v5 contentVersion];
      uint64_t v11 = [v6 contentVersion];
      if (v11 <= v10) {
        id v12 = v5;
      }
      else {
        id v12 = v6;
      }
      if (v10 <= v11) {
        id v9 = v12;
      }
      else {
        id v9 = v5;
      }
    }
  }
  id v13 = v9;

  return v13;
}

- (void)removeAssetsForAssertions:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke;
  v3[3] = &unk_1E6E3A6F8;
  v3[4] = self;
  [a3 enumerateObjectsUsingBlock:v3];
}

void __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 query];
  BOOL v4 = (void *)[v3 copy];

  [v4 setInstalledOnly:1];
  [v4 setLocalOnly:1];
  [v4 setLatestOnly:0];
  id v5 = *(void **)(a1 + 32);
  id v9 = 0;
  id v6 = [v5 assetsForQuery:v4 errorPtr:&v9];
  id v7 = v9;
  if (v7)
  {
    uint64_t v8 = UpdateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) removeAssets:v6];
  }
}

- (void)removeOldAssetsForAssertions:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Removing old assets for assertions: %{public}@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__DDSMobileAssetv2Provider_removeOldAssetsForAssertions___block_invoke;
  v6[3] = &unk_1E6E3A6F8;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __57__DDSMobileAssetv2Provider_removeOldAssetsForAssertions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 query];
  id v4 = (void *)[v3 copy];

  [v4 setInstalledOnly:1];
  [v4 setLocalOnly:1];
  [v4 setLatestOnly:0];
  id v5 = *(void **)(a1 + 32);
  id v19 = 0;
  id v6 = [v5 assetsInCalalogForQuery:v4 errorPtr:&v19];
  id v7 = v19;
  id v8 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
  uint64_t v9 = UpdateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = +[DDSAsset debuggingIDsForAssets:v6];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v21 = v10;
    _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "All assets being evaluated for removal: %{public}@", buf, 0xCu);
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = [(id)objc_opt_class() latestAssetsOnlyFromAssets:v6];
  id v13 = [v11 setWithArray:v12];

  uint64_t v14 = UpdateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v13 allObjects];
    id v16 = +[DDSAsset debuggingIDsForAssets:v15];
    *(_DWORD *)long long buf = 138543362;
    uint64_t v21 = v16;
    _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "Latest assets not eligible for removal: %{public}@", buf, 0xCu);
  }
  [v8 minusSet:v13];
  __int16 v17 = *(void **)(a1 + 32);
  uint64_t v18 = [v8 allObjects];
  [v17 removeAssets:v18];
}

- (void)removeAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = UpdateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[DDSAsset debuggingIDsForAssets:v3];
    *(_DWORD *)long long buf = 138543362;
    id v20 = v5;
    _os_log_impl(&dword_1E41D6000, v4, OS_LOG_TYPE_DEFAULT, "Removing assets: %{public}@", buf, 0xCu);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [v11 maAsset];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __41__DDSMobileAssetv2Provider_removeAssets___block_invoke;
        v13[3] = &unk_1E6E3A720;
        v13[4] = v11;
        [v12 purge:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

void __41__DDSMobileAssetv2Provider_removeAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = DefaultLog();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__DDSMobileAssetv2Provider_removeAssets___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) debuggingID];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Purged asset (%{public}@) successfully", (uint8_t *)&v7, 0xCu);
  }
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSMobileAssetv2Provider *)self assetQueryResultsCache];
  [v5 clearCacheForAssetType:v4];
}

- (void)didChangeDownloadState:(unint64_t)a3 forAsset:(id)a4
{
  id v16 = a4;
  id v6 = [(DDSMobileAssetv2Provider *)self downloadStateByAssetID];
  int v7 = [v16 uniqueIdentifier];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (v9 != a3)
  {
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v11 = [(DDSMobileAssetv2Provider *)self downloadStateByAssetID];
    id v12 = [v16 uniqueIdentifier];
    [v11 setObject:v10 forKeyedSubscript:v12];

    if (a3 - 9 <= 2)
    {
      id v13 = [(DDSMobileAssetv2Provider *)self downloadStateByAssetID];
      long long v14 = [v16 uniqueIdentifier];
      [v13 removeObjectForKey:v14];
    }
    long long v15 = [(DDSMobileAssetv2Provider *)self delegate];
    [v15 didChangeDownloadState:a3 forAsset:v16];
  }
}

- (void)didCompleteDownloadForAssertion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DDSMobileAssetv2Provider didCompleteDownloadForAssertion:error:]();
  }

  uint64_t v9 = [(DDSMobileAssetv2Provider *)self delegate];
  [v9 didCompleteDownloadForAssertion:v6 error:v7];
}

- (void)didUpdateCatalogWithAssetType:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = DefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DDSMobileAssetv2Provider didUpdateCatalogWithAssetType:error:]((uint64_t)v6, (uint64_t)v7, v8);
  }

  uint64_t v9 = [(DDSMobileAssetv2Provider *)self delegate];
  [v9 didUpdateCatalogWithAssetType:v6 error:v7];
}

- (id)updatableAssetsForAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 query];
  id v15 = 0;
  id v6 = [(DDSMobileAssetv2Provider *)self assetsForQuery:v5 errorPtr:&v15];
  id v7 = v15;

  uint64_t v8 = [v4 query];

  uint64_t v9 = (void *)[v8 copy];
  [v9 setInstalledOnly:1];
  [v9 setLocalOnly:1];
  [v9 setLatestOnly:0];
  uint64_t v14 = 0;
  uint64_t v10 = [(DDSMobileAssetv2Provider *)self assetsInCalalogForQuery:v9 errorPtr:&v14];
  uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
  id v12 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
  [v11 minusSet:v12];

  return v11;
}

- (DDSAssetProvidingDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)downloadStateByAssetID
{
  return self->_downloadStateByAssetID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_compatabilityVersionByAssetType, 0);
  objc_storeStrong((id *)&self->_downloadStateByAssetID, 0);
  objc_storeStrong((id *)&self->_assetQueryResultsCache, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

- (void)compatabilityVersionForAssetType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Missing compatability version for asset type: %@", v2, v3, v4, v5, v6);
}

- (void)allContentItemsMatchingQuery:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.1()
{
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.2()
{
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.3()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [v0 filter];
  uint64_t v2 = [v1 filters];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1E41D6000, v3, v4, "Searching for regions in filters: %@, found allowed regions: %@", v5, v6, v7, v8, v9);
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.4()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [v0 results];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1E41D6000, v2, v3, "assetsForQuery raw results: %{public}@, result value: %{public}lu", v4, v5, v6, v7, v8);
}

- (void)assetsInCalalogForQuery:errorPtr:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Error for queryMetaDataSync: %{public}lu", v2, v3, v4, v5, v6);
}

void __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEBUG, "Downloading assertions remaining: %lu", v1, 0xCu);
}

void __77__DDSMobileAssetv2Provider_beginDownloadForAssertions_discretionaryDownload___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Encountered error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)beginDownloadForAssertion:(void *)a1 discretionaryDownload:(NSObject *)a2 handler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 query];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Unexpected installedOnly/localOnly YES value on assertion's query: %@.  Are you really, really sure you meant that?", v4, 0xCu);
}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_297_cold_1(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) count];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_2(&dword_1E41D6000, v1, v2, "Remaining: %ld in set: %{public}@", v3, v4, v5, v6, v7);
}

void __84__DDSMobileAssetv2Provider_beginDownloadForAssertion_discretionaryDownload_handler___block_invoke_297_cold_2()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [v0 debuggingID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_1E41D6000, v2, v3, "handling asset: %{public}@, state: %ld", v4, v5, v6, v7, 2u);
}

void __98__DDSMobileAssetv2Provider_beginDownloadForAssets_withPolicy_discretionaryDownload_error_handler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E41D6000, log, OS_LOG_TYPE_ERROR, "Unexpected error downloading asset %{public}@, result: %ld", (uint8_t *)&v4, 0x16u);
}

void __91__DDSMobileAssetv2Provider_updateCatalogForAssetType_discretionaryDownload_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void __54__DDSMobileAssetv2Provider_removeAssetsForAssertions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = +[DDSAsset debuggingIDsForAssets:v0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1E41D6000, v2, v3, "Error removing assets (%{public}@) for query: %{public}@", v4, v5, v6, v7, 2u);
}

void __41__DDSMobileAssetv2Provider_removeAssets___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = [*(id *)(v0 + 32) debuggingID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1E41D6000, v2, v3, "Failed to purged asset (%{public}@) with result: %lu", v4, v5, v6, v7, 2u);
}

- (void)didCompleteDownloadForAssertion:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1E41D6000, v0, OS_LOG_TYPE_DEBUG, "didCompleteDownloadForAssertion: %{public}@", v1, 0xCu);
}

- (void)didUpdateCatalogWithAssetType:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1E41D6000, log, OS_LOG_TYPE_DEBUG, "didUpdateCatalogWithAssetType for asset type: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)platformVersion
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Unrecognized device class: %d", (uint8_t *)v2, 8u);
}

@end