@interface ATXDemoAppLibraryProvider
+ (BOOL)isAppLibraryDemoModeEnabled;
+ (id)_parseCategory:(id)a3 realCategories:(id)a4;
+ (id)bundleIdsForCategoryWithName:(id)a3 in:(id)a4;
+ (id)demoAppCategoriesForRealAppCategories:(id)a3;
+ (id)demoAppLibraryPath;
+ (id)demoSuggestionsAndRecents;
+ (id)loadCategoriesFromDisk;
+ (void)demoSuggestionsAndRecents;
+ (void)loadCategoriesFromDisk;
@end

@implementation ATXDemoAppLibraryProvider

+ (BOOL)isAppLibraryDemoModeEnabled
{
  if (![MEMORY[0x1E4F93B08] isInternalBuild]) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v4 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  if ([v4 BOOLForKey:@"ATXAppLibraryDemoModeEnabled"])
  {
    v5 = [a1 demoAppLibraryPath];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v7 = [v6 fileExistsAtPath:v5];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)demoAppLibraryPath
{
  return (id)[MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"AppLibraryDemo.json"];
}

+ (id)loadCategoriesFromDisk
{
  v2 = [a1 demoAppLibraryPath];
  id v11 = 0;
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v2 options:0 error:&v11];
  id v4 = v11;
  if (v3)
  {
    id v10 = v4;
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:&v10];
    id v6 = v10;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v5;
      char v7 = v5;
    }
    else
    {
      v8 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[ATXDemoAppLibraryProvider loadCategoriesFromDisk];
      }

      char v7 = 0;
    }
  }
  else
  {
    v5 = __atxlog_handle_app_library();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXDemoAppLibraryProvider loadCategoriesFromDisk];
    }
    char v7 = 0;
    id v6 = v4;
  }

  return v7;
}

+ (id)bundleIdsForCategoryWithName:(id)a3 in:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "objectForKeyedSubscript:", @"name", (void)v16);
        char v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          v14 = [v11 objectForKeyedSubscript:@"apps"];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

+ (id)demoSuggestionsAndRecents
{
  id v3 = __atxlog_handle_app_library();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1A790D000, v3, OS_LOG_TYPE_INFO, "[Demo] Demo suggestions and recents requested", v11, 2u);
  }

  if ([a1 isAppLibraryDemoModeEnabled])
  {
    id v4 = [a1 loadCategoriesFromDisk];
    if ((unint64_t)[v4 count] > 1)
    {
      uint64_t v7 = [ATXAppDirectoryResponse alloc];
      id v5 = [a1 bundleIdsForCategoryWithName:@"Recents" in:v4];
      uint64_t v8 = [a1 bundleIdsForCategoryWithName:@"Suggestions" in:v4];
      uint64_t v9 = [a1 bundleIdsForCategoryWithName:@"Hidden" in:v4];
      id v6 = [(ATXAppDirectoryResponse *)v7 initWithoutDedupingForRecents:v5 predictedApps:v8 hiddenApps:v9 error:0];
    }
    else
    {
      id v5 = __atxlog_handle_app_library();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[ATXDemoAppLibraryProvider demoSuggestionsAndRecents](v5);
      }
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_parseCategory:(id)a3 realCategories:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"apps"];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"name"];
  if (([v9 isEqualToString:@"Suggestions"] & 1) != 0
    || ([v9 isEqualToString:@"Recents"] & 1) != 0)
  {
    id v10 = 0;
  }
  else
  {
    unint64_t v11 = 0x1E5D03000uLL;
    if (([v9 isEqualToString:@"Arcade"] & 1) != 0
      || [v9 isEqualToString:@"Apple Arcade"])
    {
      v12 = [[ATXAppDirectoryCategory alloc] initWithCategoryID:2 appBundleIDs:v8];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = v6;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        v33 = v12;
        uint64_t v16 = *(void *)v39;
LABEL_8:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
          if ([v18 categoryID] == 2) {
            break;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
            if (v15) {
              goto LABEL_8;
            }
            goto LABEL_24;
          }
        }
LABEL_26:
        v12 = v18;

        unint64_t v11 = 0x1E5D03000uLL;
      }
    }
    else
    {
      v12 = [[ATXAppDirectoryCategory alloc] initWithCategoryID:1 appBundleIDs:v8 localizedName:v9];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v19 = v6;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        id v32 = v6;
        v33 = v12;
        uint64_t v22 = *(void *)v35;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v35 != v22) {
              objc_enumerationMutation(v19);
            }
            long long v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v24 = objc_msgSend(v18, "localizedStringForCategoryID:", objc_msgSend(v18, "categoryID", v32));
            char v25 = [v9 isEqualToString:v24];

            if (v25)
            {
              id v6 = v32;
              goto LABEL_26;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v21) {
            continue;
          }
          break;
        }
        id v6 = v32;
LABEL_24:
        unint64_t v11 = 0x1E5D03000;
        v12 = v33;
      }
    }

    v26 = [(ATXAppDirectoryCategory *)v12 appBundleIDs];
    v27 = (void *)[v26 mutableCopy];

    [v27 removeObjectsInArray:v8];
    [v8 addObjectsFromArray:v27];
    id v28 = objc_alloc(*(Class *)(v11 + 2536));
    uint64_t v29 = [(ATXAppDirectoryCategory *)v12 categoryID];
    v30 = [(ATXAppDirectoryCategory *)v12 localizedName];
    id v10 = (void *)[v28 initWithCategoryID:v29 appBundleIDs:v8 localizedName:v30];
  }

  return v10;
}

+ (id)demoAppCategoriesForRealAppCategories:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 isAppLibraryDemoModeEnabled])
  {
    id v5 = objc_opt_new();
    id v6 = [a1 loadCategoriesFromDisk];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unint64_t v11 = [a1 _parseCategory:*(void *)(*((void *)&v13 + 1) + 8 * i) realCategories:v4];
          if (v11) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)loadCategoriesFromDisk
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "[Demo] Could not parse demo app library: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)demoSuggestionsAndRecents
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "[Demo] Not enough categories for special pods", v1, 2u);
}

@end