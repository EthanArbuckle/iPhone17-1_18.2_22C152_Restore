@interface GEOMetroRegionAssetProvider
+ (id)_maQueryForAssetCode:(id)a3;
+ (id)sharedProvider;
+ (void)_downloadAsset:(id)a3 completion:(id)a4;
+ (void)_downloadCatalogIfNeededThen:(id)a3;
+ (void)_unavailableAssetForAssetCode:(id)a3 completion:(id)a4;
+ (void)_updateCatalogWithResult:(id)a3;
+ (void)preloadAssetForCountryCode:(id)a3 preloadQueue:(id)a4 completion:(id)a5;
- (GEOMetroRegionAssetProvider)init;
- (id)_acceptListForCountryCode:(id)a3 name:(id)a4;
- (id)_bestAvailableAssetForAssetCode:(id)a3;
- (id)homeCountryCodeAcceptList;
- (id)homeMetroAcceptListForCountryCode:(id)a3;
- (id)urlForInstalledCountryCode:(id)a3;
- (void)_catalogDownloadFinishedWithResult:(int64_t)a3;
- (void)_updateCatalogAfterDelay:(double)a3;
@end

@implementation GEOMetroRegionAssetProvider

- (GEOMetroRegionAssetProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMetroRegionAssetProvider;
  v2 = [(GEOMetroRegionAssetProvider *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    fileURLCache = v2->_fileURLCache;
    v2->_fileURLCache = v3;

    [(NSCache *)v2->_fileURLCache setName:@"metro regions file URL cache"];
    [(GEOMetroRegionAssetProvider *)v2 _updateCatalogAfterDelay:5.0];
  }
  return v2;
}

+ (id)sharedProvider
{
  if (qword_26B201BC8 != -1) {
    dispatch_once(&qword_26B201BC8, &__block_literal_global_13);
  }
  v2 = (void *)_MergedGlobals_14;
  return v2;
}

uint64_t __45__GEOMetroRegionAssetProvider_sharedProvider__block_invoke()
{
  _MergedGlobals_14 = objc_alloc_init(GEOMetroRegionAssetProvider);
  return MEMORY[0x270F9A758]();
}

+ (void)_downloadAsset:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)getMADownloadOptionsClass());
  [v7 setAllowsCellularAccess:GEOConfigGetBOOL()];
  objc_msgSend(v7, "setAllowsExpensiveAccess:", objc_msgSend(v7, "allowsCellularAccess"));
  [v7 setRequiresPowerPluggedIn:GEOConfigGetBOOL() ^ 1];
  [v7 setDiscretionary:GEOConfigGetBOOL()];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__GEOMetroRegionAssetProvider__downloadAsset_completion___block_invoke;
  v10[3] = &unk_265345FD8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v9 startDownload:v7 then:v10];
}

uint64_t __57__GEOMetroRegionAssetProvider__downloadAsset_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = GEOGetMetroRegionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) getLocalUrl];
    int v7 = 134218242;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_24FE56000, v4, OS_LOG_TYPE_INFO, "Got the asset download reply: %ld, and %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

+ (id)_maQueryForAssetCode:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getMAAssetQueryClass_softClass;
  uint64_t v12 = getMAAssetQueryClass_softClass;
  if (!getMAAssetQueryClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getMAAssetQueryClass_block_invoke;
    v8[3] = &unk_265345620;
    v8[4] = &v9;
    __getMAAssetQueryClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = (void *)[[v5 alloc] initWithType:@"com.apple.MobileAsset.GeoPolygonDataAssets"];
  [v6 returnTypes:2];
  [v6 setDoNotBlockBeforeFirstUnlock:1];
  [v6 addKeyValuePair:@"Type" with:@"Metro"];
  [v6 addKeyValuePair:@"FormatVersion" with:@"1"];
  [v6 addKeyValuePair:@"MetrosInCountry" with:v3];

  return v6;
}

+ (void)_unavailableAssetForAssetCode:(id)a3 completion:(id)a4
{
  id v6 = a4;
  int v7 = [a1 _maQueryForAssetCode:a3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__GEOMetroRegionAssetProvider__unavailableAssetForAssetCode_completion___block_invoke;
  v10[3] = &unk_265346000;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  [v8 queryMetaDataWithError:v10];
}

void __72__GEOMetroRegionAssetProvider__unavailableAssetForAssetCode_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = GEOGetMetroRegionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_24FE56000, v6, OS_LOG_TYPE_ERROR, "MA query error : (%@)", buf, 0xCu);
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = objc_msgSend(*(id *)(a1 + 32), "results", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * v10) state] == 1)
          {
            (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

            goto LABEL_14;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:
}

- (id)_bestAvailableAssetForAssetCode:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [(id)objc_opt_class() _maQueryForAssetCode:v3];
  uint64_t v5 = [v4 queryMetaDataSync];
  id v6 = GEOGetMetroRegionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v5;
    _os_log_impl(&dword_24FE56000, v6, OS_LOG_TYPE_INFO, "query result : %ld", buf, 0xCu);
  }

  uint64_t v7 = [v4 results];

  if (!v7)
  {
    uint64_t v8 = GEOGetMetroRegionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v3;
      _os_log_impl(&dword_24FE56000, v8, OS_LOG_TYPE_INFO, "query for '%@' has no results", buf, 0xCu);
    }
    goto LABEL_19;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = objc_msgSend(v4, "results", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v9)
  {
LABEL_19:
    long long v11 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  long long v11 = 0;
  uint64_t v12 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v8);
      }
      long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      [v14 logAsset];
      if ([v14 state] == 1)
      {
        [(id)objc_opt_class() _downloadAsset:v14 completion:0];
      }
      else
      {
        if ([v14 state] == 2)
        {
          id v16 = v14;

          long long v11 = v16;
          goto LABEL_21;
        }
        if ([v14 state] == 3)
        {
          id v15 = v14;

          long long v11 = v15;
        }
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_21:

  return v11;
}

- (id)urlForInstalledCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSCache *)self->_fileURLCache objectForKey:v4];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    uint64_t v7 = [(GEOMetroRegionAssetProvider *)self _bestAvailableAssetForAssetCode:v4];
    uint64_t v8 = [v7 getLocalFileUrl];
    if (v8) {
      [(NSCache *)self->_fileURLCache setObject:v8 forKey:v4];
    }
    id v6 = v8;
  }
  return v6;
}

- (id)_acceptListForCountryCode:(id)a3 name:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(GEOMetroRegionAssetProvider *)self urlForInstalledCountryCode:a3];
  uint64_t v8 = NSDictionary;
  uint64_t v9 = [v7 URLByAppendingPathComponent:@"AcceptLists.plist"];
  id v15 = 0;
  uint64_t v10 = [v8 dictionaryWithContentsOfURL:v9 error:&v15];
  id v11 = v15;

  if (v11)
  {
    uint64_t v12 = GEOGetMetroRegionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_24FE56000, v12, OS_LOG_TYPE_ERROR, "query result : %@", buf, 0xCu);
    }

    long long v13 = 0;
  }
  else
  {
    long long v13 = [v10 objectForKeyedSubscript:v6];
  }

  return v13;
}

- (id)homeMetroAcceptListForCountryCode:(id)a3
{
  return [(GEOMetroRegionAssetProvider *)self _acceptListForCountryCode:a3 name:@"metros"];
}

- (id)homeCountryCodeAcceptList
{
  return [(GEOMetroRegionAssetProvider *)self _acceptListForCountryCode:@"CCALLOW" name:@"countries"];
}

+ (void)_downloadCatalogIfNeededThen:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [a1 _maQueryForAssetCode:@"CCALLOW"];
  if ([v5 isCatalogFetchedWithinThePastFewDays:1])
  {
    v4[2](v4);
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__GEOMetroRegionAssetProvider__downloadCatalogIfNeededThen___block_invoke;
    v6[3] = &unk_265346028;
    uint64_t v7 = v4;
    [a1 _updateCatalogWithResult:v6];
  }
}

uint64_t __60__GEOMetroRegionAssetProvider__downloadCatalogIfNeededThen___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateCatalogAfterDelay:(double)a3
{
  uint64_t v5 = dispatch_get_global_queue(9, 0);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke;
  block[3] = &unk_2653454E0;
  block[4] = self;
  dispatch_after(v6, v5, block);
}

uint64_t __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke_2;
  v4[3] = &unk_265346050;
  v4[4] = *(void *)(a1 + 32);
  return [v2 _updateCatalogWithResult:v4];
}

uint64_t __56__GEOMetroRegionAssetProvider__updateCatalogAfterDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _catalogDownloadFinishedWithResult:a2];
}

+ (void)_updateCatalogWithResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)getMADownloadOptionsClass());
  [v4 setAllowsCellularAccess:GEOConfigGetBOOL()];
  objc_msgSend(v4, "setAllowsExpensiveAccess:", objc_msgSend(v4, "allowsCellularAccess"));
  [v4 setRequiresPowerPluggedIn:GEOConfigGetBOOL() ^ 1];
  [v4 setDiscretionary:GEOConfigGetBOOL()];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  uint64_t v5 = (void *)getMAAssetClass_softClass;
  uint64_t v11 = getMAAssetClass_softClass;
  if (!getMAAssetClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getMAAssetClass_block_invoke;
    v7[3] = &unk_265345620;
    v7[4] = &v8;
    __getMAAssetClass_block_invoke((uint64_t)v7);
    uint64_t v5 = (void *)v9[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v8, 8);
  [v6 startCatalogDownload:@"com.apple.MobileAsset.GeoPolygonDataAssets" options:v4 then:v3];
}

- (void)_catalogDownloadFinishedWithResult:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = GEOGetMetroRegionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    int64_t v12 = a3;
    _os_log_impl(&dword_24FE56000, v5, OS_LOG_TYPE_INFO, "catalog download reply: %ld", (uint8_t *)&v11, 0xCu);
  }

  if (a3)
  {
    unsigned int catalogLoadRetryMultiplier = self->_catalogLoadRetryMultiplier;
    if (catalogLoadRetryMultiplier <= 0xB) {
      self->_unsigned int catalogLoadRetryMultiplier = ++catalogLoadRetryMultiplier;
    }
    double v7 = (double)(600 * catalogLoadRetryMultiplier);
  }
  else
  {
    double v7 = 1800.0;
  }
  [(GEOMetroRegionAssetProvider *)self _updateCatalogAfterDelay:v7];
  uint64_t v8 = [MEMORY[0x263F41770] sharedConfiguration];
  uint64_t v9 = [v8 countryCode];

  id v10 = [(GEOMetroRegionAssetProvider *)self urlForInstalledCountryCode:v9];
}

+ (void)preloadAssetForCountryCode:(id)a3 preloadQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  dispatch_group_t v11 = dispatch_group_create();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 1;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke;
  v18[3] = &unk_2653460C8;
  id v12 = v8;
  id v19 = v12;
  uint64_t v13 = v11;
  long long v21 = v23;
  id v22 = a1;
  long long v20 = v13;
  [a1 _downloadCatalogIfNeededThen:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_4;
  v15[3] = &unk_2653460F0;
  id v16 = v10;
  id v17 = v23;
  id v14 = v10;
  dispatch_group_notify(v13, v9, v15);

  _Block_object_dispose(v23, 8);
}

void __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", *(void *)(a1 + 32), @"CCALLOW", 0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        uint64_t v9 = *(void **)(a1 + 56);
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_2;
        v10[3] = &unk_2653460A0;
        id v11 = *(id *)(a1 + 40);
        long long v12 = *(_OWORD *)(a1 + 48);
        [v9 _unavailableAssetForAssetCode:v8 completion:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 48);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_3;
    v7[3] = &unk_265346078;
    long long v6 = *(_OWORD *)(a1 + 32);
    id v4 = (id)v6;
    long long v8 = v6;
    [v3 _downloadAsset:a2 completion:v7];
  }
  else
  {
    uint64_t v5 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v5);
  }
}

void __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  atomic_fetch_and((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), a2 == 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __82__GEOMetroRegionAssetProvider_preloadAssetForCountryCode_preloadQueue_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(v1, v2 & 1);
}

- (void).cxx_destruct
{
}

@end