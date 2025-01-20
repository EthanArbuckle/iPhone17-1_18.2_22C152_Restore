@interface SFSearchEngineController
@end

@implementation SFSearchEngineController

void __62___SFSearchEngineController__postDefaultSearchEngineDidChange__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SearchEngineControllerDefaultSearchEngineDidChange" object:*(void *)(a1 + 32)];

  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", @"PrivateSearchEngineStringSetting");
  [v3 postNotificationName:v4 object:0 userInfo:0 deliverImmediately:1];

  id v6 = [MEMORY[0x1E4F28C40] defaultCenter];
  v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", @"SearchEngineStringSetting");
  [v6 postNotificationName:v5 object:0 userInfo:0 deliverImmediately:1];
}

uint64_t __51___SFSearchEngineController__populateSearchEngines__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 shortName];
  v4 = [*(id *)(a1 + 32) shortName];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __51___SFSearchEngineController__populateSearchEngines__block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 56) = _SFDeviceIsPad();
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "_web_preferredLanguageCode");
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  [*(id *)(a1 + 32) _setEngines:0 defaultSearchEngineIndex:0x7FFFFFFFFFFFFFFFLL forPrivateBrowsing:0];
  [*(id *)(a1 + 32) _setEngines:0 defaultSearchEngineIndex:0x7FFFFFFFFFFFFFFFLL forPrivateBrowsing:1];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
  id v6 = [v5 objectForKey:@"SearchEngineStringSetting"];
  v35 = v5;
  uint64_t v7 = [v5 objectForKey:@"PrivateSearchEngineStringSetting"];
  id v8 = (id)v7;
  if (v6)
  {
LABEL_4:
    if (v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (useBaiduAsPresetDefaultSearchEngine)
  {
    id v6 = (id)*MEMORY[0x1E4F995C0];
    goto LABEL_4;
  }
  id v6 = 0;
  if (!v7) {
LABEL_5:
  }
    id v8 = v6;
LABEL_6:
  [*(id *)(a1 + 32) _loadSystemPropertiesForSearchEngine:v6];
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  [v9 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F995C8]];
  v34 = v8;
  [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F995D0]];
  v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1 + 32) _addAllWebSearchEngineInfosToArray:v11 andAddUserVisibleWebSearchEngineInfosToArray:v10];
  v32 = [MEMORY[0x1E4F98E20] sharedRecorder];
  v33 = (void *)v11;
  [v32 setSearchProviders:v11];
  id v12 = v10;
  if (_SFDeviceRegionCodeIsChina())
  {
    v13 = (uint64_t *)MEMORY[0x1E4F99618];
    v14 = (uint64_t *)MEMORY[0x1E4F995E8];
    v15 = (uint64_t *)MEMORY[0x1E4F99610];
    v16 = (uint64_t *)MEMORY[0x1E4F995F8];
    v17 = (uint64_t *)MEMORY[0x1E4F995E0];
    uint64_t v39 = *MEMORY[0x1E4F995D8];
    v18 = (uint64_t *)MEMORY[0x1E4F99600];
    v19 = (uint64_t *)MEMORY[0x1E4F99608];
  }
  else
  {
    v13 = (uint64_t *)MEMORY[0x1E4F99600];
    v14 = (uint64_t *)MEMORY[0x1E4F99608];
    v15 = (uint64_t *)MEMORY[0x1E4F995E8];
    v16 = (uint64_t *)MEMORY[0x1E4F99618];
    v17 = (uint64_t *)MEMORY[0x1E4F995D8];
    uint64_t v39 = *MEMORY[0x1E4F995F8];
    v18 = (uint64_t *)MEMORY[0x1E4F995E0];
    v19 = (uint64_t *)MEMORY[0x1E4F99610];
  }
  uint64_t v20 = *v18;
  uint64_t v40 = *v19;
  uint64_t v41 = v20;
  uint64_t v21 = *v16;
  uint64_t v42 = *v17;
  uint64_t v43 = v21;
  uint64_t v22 = *v14;
  uint64_t v44 = *v15;
  uint64_t v45 = v22;
  uint64_t v23 = *MEMORY[0x1E4F995F0];
  uint64_t v46 = *v13;
  uint64_t v47 = v23;
  v48 = @"Wikipedia";
  v24 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  v25 = +[WBSSearchProvider sortedSearchProvidersInArray:v12 usingShortNameOrder:v24];

  v26 = +[WBSSearchProvider defaultProviderInUserVisibleProviders:v25 usingSettings:v9 forPrivateBrowsing:0];
  v27 = +[WBSSearchProvider defaultProviderInUserVisibleProviders:v25 usingSettings:v9 forPrivateBrowsing:1];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke_2;
  v37[3] = &unk_1E5C75B48;
  id v38 = v25;
  id v28 = v25;
  v29 = (uint64_t (**)(void, void))MEMORY[0x1AD0C36A0](v37);
  uint64_t v30 = ((uint64_t (**)(void, void *))v29)[2](v29, v26);
  [*(id *)(a1 + 32) _setEngines:v28 defaultSearchEngineIndex:v30 forPrivateBrowsing:0];
  objc_msgSend(*(id *)(a1 + 32), "_setEngines:defaultSearchEngineIndex:forPrivateBrowsing:", v28, ((uint64_t (**)(void, void *))v29)[2](v29, v27), 1);
  v31 = [v28 objectAtIndexedSubscript:v30];
  [v32 setDefaultSearchProvider:v31];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke_4;
  block[3] = &unk_1E5C724D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51___SFSearchEngineController__populateSearchEngines__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___SFSearchEngineController__populateSearchEngines__block_invoke_3;
  v8[3] = &unk_1E5C75B20;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v8];

  return v6;
}

void __85___SFSearchEngineController__getEngines_defaultSearchEngineIndex_forPrivateBrowsing___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = 40;
    if (!*(unsigned char *)(a1 + 56)) {
      uint64_t v3 = 16;
    }
    void *v2 = *(void *)(*(void *)(a1 + 32) + v3);
  }
}

void __51___SFSearchEngineController__populateSearchEngines__block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"SearchEngineControllerInstanceDidFinishPopulatingSearchEngines" object:*(void *)(a1 + 32)];
}

uint64_t __54___SFSearchEngineController_sharedInstanceIfAvailable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeSharedInstance];
}

uint64_t __71___SFSearchEngineController_setDefaultSearchEngine_forPrivateBrowsing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDefaultSearchEngine:*(void *)(a1 + 40) forPrivateBrowsing:*(unsigned __int8 *)(a1 + 48)];
}

void __72___SFSearchEngineController__setDefaultSearchEngine_forPrivateBrowsing___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  id v8 = [v14 shortName];
  if (![v8 caseInsensitiveCompare:*(void *)(a1 + 32)])
  {
    uint64_t v9 = 40;
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v9 = 16;
    }
    *(void *)(*(void *)(a1 + 40) + v9) = a3;
    v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
    uint64_t v11 = v10;
    id v12 = &_SFPrivateSearchEngineStringDefaultsKey;
    if (!*(unsigned char *)(a1 + 48)) {
      id v12 = _SFSearchEngineStringDefaultsKey;
    }
    [v10 setObject:*(void *)(a1 + 32) forKey:*v12];

    os_unfair_lock_lock(&defaultSearchEngineLock);
    uint64_t v13 = 48;
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v13 = 32;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + v13), a2);
    os_unfair_lock_unlock(&defaultSearchEngineLock);
    [*(id *)(a1 + 40) _postDefaultSearchEngineDidChange];
    *a4 = 1;
  }
}

void __43___SFSearchEngineController_engineInfoFor___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingEngineInfoFor:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __69___SFSearchEngineController_enginesAvailableForUnifiedFieldSearching__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 shortName];
  uint64_t v3 = [v2 isEqualToString:@"Wikipedia"] ^ 1;

  return v3;
}

@end