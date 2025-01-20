@interface ATXAppIconState
@end

@implementation ATXAppIconState

uint64_t __45___ATXAppIconState_allAppsKnownToSpringBoard__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) allKeys];
  return MEMORY[0x1F41817F8]();
}

void __34___ATXAppIconState_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [_ATXAppIconState alloc];
  v2 = objc_opt_new();
  v3 = objc_msgSend(MEMORY[0x1E4FA6AC8], "atx_sharedInstance");
  uint64_t v4 = [(_ATXAppIconState *)v1 initWithHomeScreenConfigCache:v2 sbsHomeScreenService:v3];
  v5 = (void *)sharedInstance__pasExprOnceResult_23;
  sharedInstance__pasExprOnceResult_23 = v4;
}

void __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _reload];
  }
  else
  {
    v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_cold_1();
    }
  }
}

void __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_39(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[14] runAfterDelaySeconds:0 coalescingBehavior:0.1];
  }
  else
  {
    v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_cold_1();
    }
  }
}

uint64_t __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __27___ATXAppIconState__reload__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v17;
  if (isKindOfClass)
  {
    v9 = [v17 bundleId];
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D58]), "initWithIndex:", objc_msgSend(*(id *)(a1 + 32), "pageIndex"));
    v11 = [v10 indexPathByAddingIndex:a3];

    if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = [v11 indexPathByAddingIndex:a4];

      v13 = *(void **)(a1 + 40);
      v14 = [NSNumber numberWithUnsignedInteger:a4];
      [v13 addObject:v14];

      v11 = (void *)v12;
    }
    v15 = -[_ATXIconLocation initWithIndexPath:isOnDock:existsInAppLibraryOnly:isInstalled:]([_ATXIconLocation alloc], "initWithIndexPath:isOnDock:existsInAppLibraryOnly:isInstalled:", v11, 0, 0, [*(id *)(a1 + 56) containsObject:v9] ^ 1);
    [*(id *)(a1 + 48) setObject:v15 forKeyedSubscript:v9];

    id v8 = v17;
  }
  return MEMORY[0x1F41817F8](isKindOfClass, v8);
}

void __27___ATXAppIconState__reload__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = (void *)MEMORY[0x1D25F6CC0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v5 folderPages];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __27___ATXAppIconState__reload__block_invoke_3;
    v8[3] = &unk_1E68B1C18;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = a3;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __27___ATXAppIconState__reload__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(a2, "contents", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

void __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke_2;
  v2[3] = &unk_1E68B1C68;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isInstalled]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __33___ATXAppIconState_allDockedApps__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33___ATXAppIconState_allDockedApps__block_invoke_2;
  v2[3] = &unk_1E68B1C68;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __33___ATXAppIconState_allDockedApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isOnDock]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __33___ATXAppIconState_allFolderApps__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33___ATXAppIconState_allFolderApps__block_invoke_2;
  v2[3] = &unk_1E68B1C68;
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void __33___ATXAppIconState_allFolderApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 indexPath];
  uint64_t v6 = [v5 length];

  if (v6 == 3) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __42___ATXAppIconState_appOnDockWithBundleId___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isOnDock];
}

void __44___ATXAppIconState_appInFolderWithBundleId___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  id v2 = [v3 indexPath];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 length] == 3;
}

uint64_t __53___ATXAppIconState_springboardPageNumberForBundleId___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __55___ATXAppIconState_springboardPageLocationForBundleId___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __48___ATXAppIconState_folderPageNumberForBundleId___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 64) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __35___ATXAppIconState_numberOfFolders__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

uint64_t __33___ATXAppIconState_numberOfPages__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

void __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke_2;
  v18[3] = &unk_1E68B1C90;
  id v4 = v2;
  id v19 = v4;
  id v20 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10, (void)v14);

        if (!v11)
        {
          uint64_t v12 = objc_opt_new();
          [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v10];
        }
        uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
        [v13 addObjectsFromArray:v4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v21 count:16];
    }
    while (v7);
  }
}

void __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if ([v5 isOnDock])
  {
    [*(id *)(a1 + 32) addObject:v14];
  }
  else
  {
    uint64_t v6 = [v5 indexPath];
    uint64_t v7 = [v6 length];

    if (v7 == 2)
    {
      uint64_t v8 = NSNumber;
      long long v9 = [v5 indexPath];
      uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "indexAtPosition:", 0));

      long long v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];

      if (!v11)
      {
        uint64_t v12 = objc_opt_new();
        [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
      [v13 addObject:v14];
    }
  }
}

void __44___ATXAppIconState_getFirstVisiblePageIndex__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 88) firstObject];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 unsignedIntegerValue];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
  }
}

uint64_t __65___ATXAppIconState_springboardPageNumbersWithAppPredictionPanels__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __64___ATXAppIconState_springboardPageNumbersWithSuggestionsWidgets__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXAppIconState: couldn't perform reload operation because swelf is nil", v2, v3, v4, v5, v6);
}

@end