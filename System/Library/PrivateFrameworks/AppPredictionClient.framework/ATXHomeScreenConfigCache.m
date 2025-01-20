@interface ATXHomeScreenConfigCache
+ (BOOL)appPredictionPanelExistsInPage:(id)a3;
+ (BOOL)hasWidgetsOnTheHomeScreenWithHomeScreenPages:(id)a3;
+ (BOOL)suggestionsWidgetExistsInPage:(id)a3;
- (ATXHomeScreenConfigCache)init;
- (ATXHomeScreenConfigCache)initWithPath:(id)a3;
- (BOOL)hasWidgetsOnTheHomeScreen;
- (BOOL)writeDockAppList:(id)a3 error:(id *)a4;
- (BOOL)writeHomeScreenPageConfigurations:(id)a3 error:(id *)a4;
- (BOOL)writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 error:(id *)a5;
- (id)_filePathForDockConfig;
- (id)_filePathForHomeScreenPageConfig;
- (id)_filePathForTodayPage;
- (id)homeScreenWidgetPersonalities;
- (id)loadDockAppListWithError:(id *)a3;
- (id)loadHomeScreenAndTodayPageConfigurationsFromJSONAtPath:(id)a3 error:(id *)a4;
- (id)loadHomeScreenAndTodayPageConfigurationsIncludingHidden:(BOOL)a3 error:(id *)a4;
- (id)loadHomeScreenAndTodayPageConfigurationsWithError:(id *)a3;
- (id)loadHomeScreenPageConfigurationsIncludingHidden:(BOOL)a3 error:(id *)a4;
- (id)loadHomeScreenPageConfigurationsWithError:(id *)a3;
- (id)loadTodayStacksAndPanelsAsHomeScreenPageWithError:(id *)a3;
- (id)prettyPrintedJSON;
- (int64_t)numOnboardingStacksOnTheHomeScreen;
- (int64_t)pageIndexOfAppPredictionPanelWithIdentifier:(id)a3;
@end

@implementation ATXHomeScreenConfigCache

- (ATXHomeScreenConfigCache)init
{
  v3 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"CachedHomeScreenConfig"];
  v4 = [(ATXHomeScreenConfigCache *)self initWithPath:v3];

  return v4;
}

- (ATXHomeScreenConfigCache)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXHomeScreenConfigCache;
  id v5 = [(ATXHomeScreenConfigCache *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v9 = [v8 createDirectoryAtPath:*((void *)v5 + 1) withIntermediateDirectories:1 attributes:0 error:0];

    if ((v9 & 1) == 0)
    {
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenConfigCache initWithPath:]((uint64_t *)v5 + 1, v10);
      }
    }
    id v11 = v5;
  }

  return (ATXHomeScreenConfigCache *)v5;
}

- (id)_filePathForHomeScreenPageConfig
{
  return [(NSString *)self->_rootPath stringByAppendingPathComponent:@"HomeScreenPages"];
}

- (id)loadHomeScreenAndTodayPageConfigurationsWithError:(id *)a3
{
  return [(ATXHomeScreenConfigCache *)self loadHomeScreenAndTodayPageConfigurationsIncludingHidden:0 error:a3];
}

- (id)loadHomeScreenAndTodayPageConfigurationsIncludingHidden:(BOOL)a3 error:(id *)a4
{
  uint64_t v6 = -[ATXHomeScreenConfigCache loadHomeScreenPageConfigurationsIncludingHidden:error:](self, "loadHomeScreenPageConfigurationsIncludingHidden:error:", a3);
  if (v6)
  {
    v7 = [(ATXHomeScreenConfigCache *)self loadTodayStacksAndPanelsAsHomeScreenPageWithError:a4];
    if (v7)
    {
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v6];
      [v8 addObject:v7];
    }
    else
    {
      char v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenConfigCache loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:]();
      }

      id v8 = v6;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)loadHomeScreenPageConfigurationsWithError:(id *)a3
{
  return [(ATXHomeScreenConfigCache *)self loadHomeScreenPageConfigurationsIncludingHidden:0 error:a3];
}

- (id)loadHomeScreenPageConfigurationsIncludingHidden:(BOOL)a3 error:(id *)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v8 = [(ATXHomeScreenConfigCache *)self _filePathForHomeScreenPageConfig];
  char v9 = __atxlog_handle_home_screen();
  v10 = (void *)[v7 initWithCacheFilePath:v8 loggingHandle:v9 debugName:@"Home Screens"];

  id v11 = (void *)MEMORY[0x1AD0D3C30]();
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
  id v20 = 0;
  v15 = [v10 readSecureCodedObjectWithMaxValidAge:v14 allowableClasses:&v20 error:-1.0];
  id v16 = v20;

  if (a4 && [v16 code] != 2) {
    *a4 = v16;
  }
  if (a3)
  {
    id v17 = v15;
  }
  else
  {
    objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_47);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

uint64_t __82__ATXHomeScreenConfigCache_loadHomeScreenPageConfigurationsIncludingHidden_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (BOOL)writeHomeScreenPageConfigurations:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ATXHomeScreenConfigCache *)self loadHomeScreenPageConfigurationsIncludingHidden:1 error:0];
  if (v7 && [v6 isEqualToArray:v7])
  {
    id v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Avoiding unnecessary write of home screen pages", v15, 2u);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    v10 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenConfigCache writeHomeScreenPageConfigurations:error:]();
    }

    id v11 = objc_alloc(MEMORY[0x1E4F4B638]);
    id v12 = [(ATXHomeScreenConfigCache *)self _filePathForHomeScreenPageConfig];
    uint64_t v13 = __atxlog_handle_home_screen();
    id v8 = [v11 initWithCacheFilePath:v12 loggingHandle:v13 debugName:@"Home Screens"];

    int v9 = [v8 storeSecureCodedObject:v6 error:a4];
    if (v9) {
      notify_post((const char *)[@"com.apple.duetexpertd.homeScreenPageConfigCacheUpdate" UTF8String]);
    }
  }

  return v9;
}

- (id)homeScreenWidgetPersonalities
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = [(ATXHomeScreenConfigCache *)self loadHomeScreenPageConfigurationsIncludingHidden:1 error:0];
  v3 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v2;
  uint64_t v21 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v35;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v4;
        id v5 = *(void **)(*((void *)&v34 + 1) + 8 * v4);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v23 = [v5 stacks];
        uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v25)
        {
          uint64_t v24 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v31 != v24) {
                objc_enumerationMutation(v23);
              }
              id v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              long long v26 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              id v8 = [v7 widgets];
              uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
              if (v9)
              {
                uint64_t v10 = v9;
                uint64_t v11 = *(void *)v27;
                do
                {
                  for (uint64_t j = 0; j != v10; ++j)
                  {
                    if (*(void *)v27 != v11) {
                      objc_enumerationMutation(v8);
                    }
                    uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                    v14 = [ATXWidgetPersonality alloc];
                    v15 = [v13 extensionBundleId];
                    id v16 = [v13 widgetKind];
                    id v17 = [(ATXWidgetPersonality *)v14 initWithExtensionBundleId:v15 kind:v16];
                    [v3 addObject:v17];
                  }
                  uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v38 count:16];
                }
                while (v10);
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v25);
        }

        uint64_t v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v21);
  }

  return v3;
}

- (BOOL)hasWidgetsOnTheHomeScreen
{
  v2 = [(ATXHomeScreenConfigCache *)self loadHomeScreenPageConfigurationsWithError:0];
  char v3 = [(id)objc_opt_class() hasWidgetsOnTheHomeScreenWithHomeScreenPages:v2];

  return v3;
}

+ (BOOL)hasWidgetsOnTheHomeScreenWithHomeScreenPages:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "stacks", (void)v15);
        uint64_t v10 = [v9 count];

        if (!v10)
        {
          uint64_t v11 = [v8 panels];
          uint64_t v12 = [v11 count];

          if (!v12) {
            continue;
          }
        }
        BOOL v13 = 1;
        goto LABEL_13;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      BOOL v13 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_13:

  return v13;
}

- (int64_t)numOnboardingStacksOnTheHomeScreen
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  [(ATXHomeScreenConfigCache *)self loadHomeScreenPageConfigurationsWithError:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  int64_t v2 = 0;
  if (v19)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v5 = [v4 stacks];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v25 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              long long v20 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              long long v23 = 0u;
              uint64_t v11 = [v10 widgets];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v21;
                while (2)
                {
                  for (uint64_t k = 0; k != v13; ++k)
                  {
                    if (*(void *)v21 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    if ([*(id *)(*((void *)&v20 + 1) + 8 * k) isOnboardingWidget])
                    {
                      ++v2;
                      goto LABEL_21;
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
                  if (v13) {
                    continue;
                  }
                  break;
                }
              }
LABEL_21:
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
          }
          while (v7);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v19);
  }

  return v2;
}

- (int64_t)pageIndexOfAppPredictionPanelWithIdentifier:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1AD0D3C30]();
  [(ATXHomeScreenConfigCache *)self loadHomeScreenAndTodayPageConfigurationsIncludingHidden:1 error:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v7 = *(void *)v27;
    uint64_t v19 = *(void *)v27;
    long long v20 = v5;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v9 panels];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v22 + 1) + 8 * j) identifier];
              char v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                int64_t v17 = [v9 pageIndex];

                uint64_t v5 = v20;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v19;
      }
      int64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v5 = v20;
      uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    int64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_19:

  return v17;
}

- (id)_filePathForDockConfig
{
  return [(NSString *)self->_rootPath stringByAppendingPathComponent:@"DockApps"];
}

- (id)loadDockAppListWithError:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v6 = [(ATXHomeScreenConfigCache *)self _filePathForDockConfig];
  uint64_t v7 = __atxlog_handle_home_screen();
  uint64_t v8 = (void *)[v5 initWithCacheFilePath:v6 loggingHandle:v7 debugName:@"Dock apps"];

  uint64_t v9 = (void *)MEMORY[0x1AD0D3C30]();
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  id v16 = 0;
  uint64_t v13 = [v8 readSecureCodedObjectWithMaxValidAge:v12 allowableClasses:&v16 error:-1.0];
  id v14 = v16;

  if (a3 && [v14 code] != 2) {
    *a3 = v14;
  }

  return v13;
}

- (BOOL)writeDockAppList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ATXHomeScreenConfigCache *)self loadDockAppListWithError:0];
  if (v7 && [v6 isEqualToSet:v7])
  {
    uint64_t v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl(&dword_1A790D000, v8, OS_LOG_TYPE_DEFAULT, "Avoiding unnecessary write of dock apps", v15, 2u);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    id v10 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenConfigCache writeDockAppList:error:]();
    }

    id v11 = objc_alloc(MEMORY[0x1E4F4B638]);
    uint64_t v12 = [(ATXHomeScreenConfigCache *)self _filePathForDockConfig];
    uint64_t v13 = __atxlog_handle_home_screen();
    uint64_t v8 = [v11 initWithCacheFilePath:v12 loggingHandle:v13 debugName:@"Dock apps"];

    int v9 = [v8 storeSecureCodedObject:v6 error:a4];
    if (v9) {
      notify_post((const char *)[@"com.apple.duetexpertd.dockAppListCacheUpdate" UTF8String]);
    }
  }

  return v9;
}

- (id)_filePathForTodayPage
{
  return [(NSString *)self->_rootPath stringByAppendingPathComponent:@"TodayPage"];
}

- (id)loadTodayStacksAndPanelsAsHomeScreenPageWithError:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F4B638]);
  id v6 = [(ATXHomeScreenConfigCache *)self _filePathForTodayPage];
  uint64_t v7 = __atxlog_handle_home_screen();
  uint64_t v8 = (void *)[v5 initWithCacheFilePath:v6 loggingHandle:v7 debugName:@"Today page"];

  int v9 = (void *)MEMORY[0x1AD0D3C30]();
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
  id v14 = 0;
  id v11 = [v8 readSecureCodedObjectWithMaxValidAge:v10 allowableClasses:&v14 error:-1.0];
  id v12 = v14;

  if (a3 && [v12 code] != 2) {
    *a3 = v12;
  }

  return v11;
}

- (BOOL)writeTodayPageStacks:(id)a3 appPredictionPanels:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(ATXHomeScreenConfigCache *)self loadTodayStacksAndPanelsAsHomeScreenPageWithError:0];
  id v11 = objc_opt_new();
  [v11 setPageIndex:20000];
  [v11 setStacks:v9];

  [v11 setPanels:v8];
  LODWORD(v9) = [v10 isEqual:v11];
  id v12 = __atxlog_handle_home_screen();
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "Avoiding unnecessary write of today page", v19, 2u);
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ATXHomeScreenConfigCache writeTodayPageStacks:appPredictionPanels:error:]();
    }

    id v15 = objc_alloc(MEMORY[0x1E4F4B638]);
    id v16 = [(ATXHomeScreenConfigCache *)self _filePathForTodayPage];
    int64_t v17 = __atxlog_handle_home_screen();
    uint64_t v13 = [v15 initWithCacheFilePath:v16 loggingHandle:v17 debugName:@"Today page"];

    int v14 = [v13 storeSecureCodedObject:v11 error:a5];
    if (v14) {
      notify_post((const char *)[@"com.apple.duetexpertd.todayPageConfigCacheUpdate" UTF8String]);
    }
  }

  return v14;
}

- (id)loadHomeScreenAndTodayPageConfigurationsFromJSONAtPath:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:0 error:a4];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:a4];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = [v7 objectForKeyedSubscript:@"Page configurations"];
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            id v16 = [ATXHomeScreenPage alloc];
            id v17 = -[ATXHomeScreenPage initFromDictionaryRepresentation:](v16, "initFromDictionaryRepresentation:", v15, (void)v19);
            if (v17) {
              [v9 addObject:v17];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)prettyPrintedJSON
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int64_t v2 = objc_alloc_init(ATXHomeScreenConfigCache);
  id v3 = [(ATXHomeScreenConfigCache *)v2 loadDockAppListWithError:0];
  id v4 = [v3 allObjects];

  id v5 = [(ATXHomeScreenConfigCache *)v2 loadHomeScreenAndTodayPageConfigurationsIncludingHidden:1 error:0];
  id v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentationForIntrospection", (void)v17);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v13 = objc_opt_new();
  [v13 setObject:v6 forKeyedSubscript:@"Page configurations"];
  [v13 setObject:v4 forKeyedSubscript:@"Dock apps"];
  int v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:1 error:0];
  if (v14) {
    uint64_t v15 = (__CFString *)[[NSString alloc] initWithData:v14 encoding:4];
  }
  else {
    uint64_t v15 = @"{ \"error\": \"Error formatting json\" }";
  }

  return v15;
}

+ (BOOL)appPredictionPanelExistsInPage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = [v3 panels];
    uint64_t v24 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v6 = *(void *)v31;
      uint64_t v7 = *MEMORY[0x1E4F4B590];
      uint64_t v22 = *(void *)v31;
      long long v23 = v4;
      long long v25 = v5;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v10 = objc_msgSend(v9, "widgets", v22);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                id v16 = [v15 extensionBundleId];
                if ([v16 isEqualToString:v7])
                {
                  long long v17 = [v15 widgetKind];
                  long long v18 = ATXSpecialWidgetKindAppPredictions();
                  char v19 = [v17 isEqualToString:v18];

                  if (v19)
                  {

                    BOOL v20 = 1;
                    id v4 = v23;
                    id v5 = v25;
                    goto LABEL_23;
                  }
                }
                else
                {
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v12);
          }

          id v5 = v25;
          uint64_t v6 = v22;
        }
        BOOL v20 = 0;
        id v4 = v23;
        uint64_t v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }
    else
    {
      BOOL v20 = 0;
    }
LABEL_23:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)suggestionsWidgetExistsInPage:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = [v3 stacks];
    uint64_t v24 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v24)
    {
      uint64_t v6 = *(void *)v31;
      uint64_t v7 = *MEMORY[0x1E4F4B5F8];
      uint64_t v22 = *(void *)v31;
      long long v23 = v4;
      long long v25 = v5;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          uint64_t v10 = objc_msgSend(v9, "widgets", v22);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v27 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                id v16 = [v15 extensionBundleId];
                if ([v16 isEqualToString:v7])
                {
                  long long v17 = [v15 widgetKind];
                  long long v18 = ATXSpecialWidgetKindSiriSuggestions();
                  char v19 = [v17 isEqualToString:v18];

                  if (v19)
                  {

                    BOOL v20 = 1;
                    id v4 = v23;
                    id v5 = v25;
                    goto LABEL_23;
                  }
                }
                else
                {
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v12);
          }

          id v5 = v25;
          uint64_t v6 = v22;
        }
        BOOL v20 = 0;
        id v4 = v23;
        uint64_t v24 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v24);
    }
    else
    {
      BOOL v20 = 0;
    }
LABEL_23:
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
}

- (void)initWithPath:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Couldn't create directory %@", (uint8_t *)&v3, 0xCu);
}

- (void)loadHomeScreenAndTodayPageConfigurationsIncludingHidden:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A790D000, v0, OS_LOG_TYPE_ERROR, "Missing today page config when trying to load home screen and today page configs", v1, 2u);
}

- (void)writeHomeScreenPageConfigurations:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "Will write home screen pages", v2, v3, v4, v5, v6);
}

- (void)writeDockAppList:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "Will write dock apps", v2, v3, v4, v5, v6);
}

- (void)writeTodayPageStacks:appPredictionPanels:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1A790D000, v0, v1, "Will write today page", v2, v3, v4, v5, v6);
}

@end