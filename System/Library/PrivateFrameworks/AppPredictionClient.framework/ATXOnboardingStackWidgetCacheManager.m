@interface ATXOnboardingStackWidgetCacheManager
- (ATXOnboardingStackWidgetCacheManager)init;
- (ATXOnboardingStackWidgetCacheManager)initWithPath:(id)a3 appLaunchStream:(id)a4 max3PWidgetsToSerialize:(unint64_t)a5;
- (BOOL)_writeOnboardingWidgetStackCache:(id)a3 withError:(id *)a4;
- (id)_mapDescriptorsToAppLaunchData:(id)a3 error:(id *)a4;
- (id)_sortAndFilterOutLeastUsed3PWidgets:(id)a3;
- (id)_splitDescriptorsIntoFirstPartyAndThirdParty:(id)a3;
- (id)_stackCache;
- (id)fetchOnboardingStackWidgetCacheWithError:(id *)a3;
- (id)updateCacheWithActivity:(id)a3;
- (void)_sortWidgetsByDistinctDaysAppWasLaunched:(id)a3 withAppLaunchDictionary:(id)a4;
@end

@implementation ATXOnboardingStackWidgetCacheManager

- (ATXOnboardingStackWidgetCacheManager)init
{
  v3 = [MEMORY[0x1E4F4B650] onboardingStackWidgetCacheFilePath];
  v4 = BiomeLibrary();
  v5 = [v4 App];
  v6 = [v5 InFocus];
  v7 = [(ATXOnboardingStackWidgetCacheManager *)self initWithPath:v3 appLaunchStream:v6 max3PWidgetsToSerialize:100];

  return v7;
}

- (ATXOnboardingStackWidgetCacheManager)initWithPath:(id)a3 appLaunchStream:(id)a4 max3PWidgetsToSerialize:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXOnboardingStackWidgetCacheManager;
  v10 = [(ATXOnboardingStackWidgetCacheManager *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    cachePath = v10->_cachePath;
    v10->_cachePath = (NSString *)v11;

    objc_storeStrong((id *)&v10->_appLaunchStream, a4);
    v10->_max3PWidgetsToSerialize = a5;
  }

  return v10;
}

- (id)updateCacheWithActivity:(id)a3
{
  id v4 = a3;
  if (![v4 didDefer])
  {
    v5 = +[ATXWidgetDescriptorCache sharedInstance];
    v7 = [v5 homeScreenDescriptors];
    id v21 = 0;
    id v8 = [(ATXOnboardingStackWidgetCacheManager *)self _mapDescriptorsToAppLaunchData:v7 error:&v21];
    id v9 = v21;
    if (v8)
    {
      if (![v4 didDefer])
      {
        uint64_t v11 = (void *)MEMORY[0x1AD0D3C30]();
        v12 = NSNumber;
        v13 = objc_opt_new();
        v10 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "hasiCloudFamily"));

        if ([v4 didDefer])
        {
          objc_super v14 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A790D000, v14, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackWidgetCacheManager: Activity was deferred after fetching iCloud family state, stopping early", buf, 2u);
          }
          v6 = 0;
          id v15 = v9;
        }
        else
        {
          objc_super v14 = [(ATXOnboardingStackWidgetCacheManager *)self _sortAndFilterOutLeastUsed3PWidgets:v8];
          v16 = [ATXOnboardingStackWidgetCache alloc];
          uint64_t v17 = objc_opt_new();
          v6 = [(ATXOnboardingStackWidgetCache *)v16 initWithAppLaunchDictionary:v14 cacheUpdateDate:v17 hasiCloudFamily:v10];

          id v20 = v9;
          LOBYTE(v17) = [(ATXOnboardingStackWidgetCacheManager *)self _writeOnboardingWidgetStackCache:v6 withError:&v20];
          id v15 = v20;

          if ((v17 & 1) == 0)
          {
            v18 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[ATXOnboardingStackWidgetCacheManager updateCacheWithActivity:]((uint64_t)v15, v18);
            }
          }
        }

        id v9 = v15;
        goto LABEL_21;
      }
      v10 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackWidgetCacheManager: Activity was deferred after fetching app launch data, stopping early", buf, 2u);
      }
    }
    else
    {
      v10 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXOnboardingStackWidgetCacheManager updateCacheWithActivity:]((uint64_t)v9, v10);
      }
    }
    v6 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXOnboardingStackWidgetCacheManager: Activity was deferred, stopping early", buf, 2u);
  }
  v6 = 0;
LABEL_22:

  return v6;
}

- (id)_sortAndFilterOutLeastUsed3PWidgets:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 allKeys];
  v6 = [(ATXOnboardingStackWidgetCacheManager *)self _splitDescriptorsIntoFirstPartyAndThirdParty:v5];

  v7 = [v6 second];
  id v8 = (void *)[v7 mutableCopy];

  [(ATXOnboardingStackWidgetCacheManager *)self _sortWidgetsByDistinctDaysAppWasLaunched:v8 withAppLaunchDictionary:v4];
  unint64_t v9 = [v8 count];
  unint64_t max3PWidgetsToSerialize = self->_max3PWidgetsToSerialize;
  if (v9 > max3PWidgetsToSerialize) {
    objc_msgSend(v8, "removeObjectsInRange:", max3PWidgetsToSerialize, objc_msgSend(v8, "count") - self->_max3PWidgetsToSerialize);
  }
  uint64_t v11 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v12 = [v6 first];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v18 = [v4 objectForKeyedSubscript:v17];
        [v11 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        v25 = objc_msgSend(v4, "objectForKeyedSubscript:", v24, (void)v27);
        [v11 setObject:v25 forKeyedSubscript:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  return v11;
}

- (void)_sortWidgetsByDistinctDaysAppWasLaunched:(id)a3 withAppLaunchDictionary:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__ATXOnboardingStackWidgetCacheManager__sortWidgetsByDistinctDaysAppWasLaunched_withAppLaunchDictionary___block_invoke;
  v7[3] = &unk_1E5D04DE0;
  id v8 = v5;
  id v6 = v5;
  [a3 sortWithOptions:16 usingComparator:v7];
}

uint64_t __105__ATXOnboardingStackWidgetCacheManager__sortWidgetsByDistinctDaysAppWasLaunched_withAppLaunchDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 objectForKeyedSubscript:a2];
  double v8 = (double)(unint64_t)[v7 uniqueDaysLaunched];

  unint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  double v10 = (double)(unint64_t)[v9 uniqueDaysLaunched];
  uint64_t v11 = -1;
  if (v8 <= v10) {
    uint64_t v11 = 1;
  }
  if (v8 == v10) {
    return 0;
  }
  else {
    return v11;
  }
}

- (id)_splitDescriptorsIntoFirstPartyAndThirdParty:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "extensionBundleIdentifier", (void)v18);
        uint64_t v13 = v12;
        if (!v12 || (char v14 = [v12 hasPrefix:@"com.apple."], v15 = v4, (v14 & 1) == 0)) {
          uint64_t v15 = v5;
        }
        [v15 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v4 second:v5];

  return v16;
}

- (id)_mapDescriptorsToAppLaunchData:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(v5, "_pas_mappedSetWithTransform:", &__block_literal_global);
  uint64_t v7 = [[ATXAppLaunches alloc] initWithStream:self->_appLaunchStream];
  uint64_t v8 = [(ATXAppLaunches *)v7 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v6];

  uint64_t v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "extensionIdentity", (void)v20);
        uint64_t v17 = [v16 containerBundleIdentifier];

        if (v17)
        {
          long long v18 = [v8 objectForKeyedSubscript:v17];
          [v9 setObject:v18 forKeyedSubscript:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  return v9;
}

id __77__ATXOnboardingStackWidgetCacheManager__mapDescriptorsToAppLaunchData_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 extensionIdentity];
  id v3 = [v2 containerBundleIdentifier];

  return v3;
}

- (id)_stackCache
{
  id v3 = objc_alloc(MEMORY[0x1E4F4B638]);
  cachePath = self->_cachePath;
  id v5 = __atxlog_handle_home_screen();
  id v6 = (void *)[v3 initWithCacheFilePath:cachePath loggingHandle:v5 debugName:@"onboarding widget stacks"];

  return v6;
}

- (BOOL)_writeOnboardingWidgetStackCache:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(ATXOnboardingStackWidgetCacheManager *)self _stackCache];
  LOBYTE(a4) = [v7 storeSecureCodedObject:v6 error:a4];

  return (char)a4;
}

- (id)fetchOnboardingStackWidgetCacheWithError:(id *)a3
{
  id v4 = [(ATXOnboardingStackWidgetCacheManager *)self _stackCache];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 readSecureCodedObjectWithMaxValidAge:v8 allowableClasses:a3 error:-1.0];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchStream, 0);

  objc_storeStrong((id *)&self->_cachePath, 0);
}

- (void)updateCacheWithActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXOnboardingStackWidgetCacheManager: Unable to map descriptors to app launch data with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateCacheWithActivity:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "ATXOnboardingStackWidgetCacheManager: Unable to write onboarding widget stack cache with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end