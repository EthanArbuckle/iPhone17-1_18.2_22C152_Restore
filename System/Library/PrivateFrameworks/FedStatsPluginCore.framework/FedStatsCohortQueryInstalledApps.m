@interface FedStatsCohortQueryInstalledApps
+ (id)cohortInstance;
+ (void)initialize;
- (BOOL)_isSupportedIntentMediaApp:(id)a3 :(id)a4 :(id)a5;
- (FedStatsCohortQueryInstalledApps)init;
- (NSDictionary)domainToInstalledApps;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
- (unint64_t)numOfMediaApps;
- (unint64_t)numOfPhoneApps;
- (void)applyFilteringForMediaDomain;
- (void)lsAppRecords;
- (void)lsPluginKitExtensions;
- (void)resolveDomainToBundleIds;
- (void)setDomainToInstalledApps:(id)a3;
@end

@implementation FedStatsCohortQueryInstalledApps

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_270012798];
    v3 = (void *)INTENT_MEDIA_SUPPORTED_CATEGORIES;
    INTENT_MEDIA_SUPPORTED_CATEGORIES = v2;

    v4 = (void *)MEMORY[0x263EFFA08];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = objc_msgSend(v4, "setWithObjects:", v14, v7, v9, v11, 0);
    v13 = (void *)INTENT_MEDIA_SUPPORTED_INTENTS;
    INTENT_MEDIA_SUPPORTED_INTENTS = v12;
  }
}

- (FedStatsCohortQueryInstalledApps)init
{
  v12[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)FedStatsCohortQueryInstalledApps;
  uint64_t v2 = [(FedStatsCohortQueryInstalledApps *)&v10 init];
  if (v2)
  {
    v11[0] = @"media";
    v3 = [MEMORY[0x263EFF9C0] set];
    v11[1] = @"phone";
    v12[0] = v3;
    v4 = [MEMORY[0x263EFF9C0] set];
    v12[1] = v4;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    domainToInstalledApps = v2->_domainToInstalledApps;
    v2->_domainToInstalledApps = (NSDictionary *)v5;

    [(FedStatsCohortQueryInstalledApps *)v2 resolveDomainToBundleIds];
    v7 = [(NSDictionary *)v2->_domainToInstalledApps objectForKeyedSubscript:@"media"];
    v2->_numOfMediaApps = [v7 count];

    v8 = [(NSDictionary *)v2->_domainToInstalledApps objectForKeyedSubscript:@"phone"];
    v2->_numOfPhoneApps = [v8 count];
  }
  return v2;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  if (a4)
  {
    *a4 = +[FedStatsPluginError errorWithCode:300 description:@"Invalid call to FedStatsCohortQueryInstalledApps#.cohortKeyForParameters"];
  }
  return 0;
}

+ (id)cohortInstance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void)resolveDomainToBundleIds
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_24DF73000, v3, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds start.", (uint8_t *)&v11, 2u);
  }

  v4 = [MEMORY[0x263EFF910] date];
  [(FedStatsCohortQueryInstalledApps *)self lsAppRecords];
  [(FedStatsCohortQueryInstalledApps *)self lsPluginKitExtensions];
  [(FedStatsCohortQueryInstalledApps *)self applyFilteringForMediaDomain];
  uint64_t v5 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    domainToInstalledApps = self->_domainToInstalledApps;
    int v11 = 138412290;
    uint64_t v12 = domainToInstalledApps;
    _os_log_impl(&dword_24DF73000, v5, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds resolved domain to bundle ids: %@", (uint8_t *)&v11, 0xCu);
  }

  v7 = [MEMORY[0x263EFF910] date];
  [v7 timeIntervalSinceDate:v4];
  v9 = v8;

  objc_super v10 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 134217984;
    uint64_t v12 = v9;
    _os_log_impl(&dword_24DF73000, v10, OS_LOG_TYPE_INFO, "FedStatsCohortQueryInstalledApps#resolveDomainToBundleIds complete in %fms", (uint8_t *)&v11, 0xCu);
  }
}

- (void)lsAppRecords
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v6 = (void *)v4;
    unint64_t v7 = 0x265312000uLL;
    *(void *)&long long v5 = 138412802;
    long long v23 = v5;
    v24 = v3;
    do
    {
      v8 = objc_msgSend(v6, "bundleIdentifier", v23);
      if (v8)
      {
        v9 = (void *)MEMORY[0x263EFFA08];
        objc_super v10 = [v6 supportedIntentMediaCategories];
        int v11 = [v9 setWithArray:v10];

        uint64_t v12 = [v6 supportedIntents];
        if ([(FedStatsCohortQueryInstalledApps *)self _isSupportedIntentMediaApp:v8 :v11 :v12])
        {
          uint64_t v13 = [InstalledApp alloc];
          id v14 = [v6 supportedIntentMediaCategories];
          [v6 localizedName];
          v15 = self;
          v17 = unint64_t v16 = v7;
          v18 = [(InstalledApp *)v13 initWithBundleIdentifier:v8 supportedMediaCategories:v14 supportedIntents:v12 appName:v17];

          unint64_t v7 = v16;
          self = v15;

          v19 = [(NSDictionary *)v15->_domainToInstalledApps objectForKeyedSubscript:@"media"];
          [v19 addObject:v18];

          v20 = [*(id *)(v7 + 536) logger];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v22 = [v6 supportedIntentMediaCategories];
            *(_DWORD *)buf = v23;
            v26 = v8;
            __int16 v27 = 2112;
            v28 = v12;
            __int16 v29 = 2112;
            v30 = v22;
            _os_log_debug_impl(&dword_24DF73000, v20, OS_LOG_TYPE_DEBUG, "bundle record: %@ has supported intent %@ and supported media categories: %@", buf, 0x20u);
          }
          v3 = v24;
        }
      }
      else
      {
        int v11 = [*(id *)(v7 + 536) logger];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v6;
          _os_log_error_impl(&dword_24DF73000, v11, OS_LOG_TYPE_ERROR, "Error enumerating app records; app record: %@ has nil bundle identifier",
            buf,
            0xCu);
        }
      }

      uint64_t v21 = [v3 nextObject];

      v6 = (void *)v21;
    }
    while (v21);
  }
}

- (void)lsPluginKitExtensions
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = [(id)INTENT_MEDIA_SUPPORTED_INTENTS allObjects];
  uint64_t v4 = *MEMORY[0x263F0F770];
  uint64_t v5 = *MEMORY[0x263F0F748];
  v12[0] = *MEMORY[0x263F07FF8];
  v12[1] = v5;
  v13[0] = v4;
  v13[1] = v3;
  v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  unint64_t v7 = [MEMORY[0x263F01880] defaultWorkspace];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke;
  v9[3] = &unk_2653123A8;
  id v10 = v6;
  int v11 = self;
  id v8 = v6;
  [v7 enumeratePluginsMatchingQuery:v8 withBlock:v9];
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_2(a1, v6, v7);
    }
  }
  else
  {
    id v8 = [v5 containingBundle];
    unint64_t v7 = [v8 bundleIdentifier];

    if (v7)
    {
      v9 = [MEMORY[0x263EFF8C0] arrayWithObject:v5];
      id v10 = INSupportedMediaCategories();
      int v11 = [v5 objectForInfoDictionaryKey:*MEMORY[0x263F0F750] ofClass:objc_opt_class() inScope:0];
      if ([*(id *)(a1 + 40) _isSupportedIntentMediaApp:v7 :v10 :v11])
      {
        uint64_t v12 = [InstalledApp alloc];
        uint64_t v13 = [v10 allObjects];
        id v14 = [(InstalledApp *)v12 initWithBundleIdentifier:v7 supportedMediaCategories:v13 supportedIntents:v11 appName:0];

        v15 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:@"media"];
        [v15 addObject:v14];

        unint64_t v16 = +[FedStatsPluginLog logger];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = [v5 bundleIdentifier];
          int v18 = 138412802;
          v19 = v17;
          __int16 v20 = 2112;
          uint64_t v21 = v11;
          __int16 v22 = 2112;
          long long v23 = v10;
          _os_log_debug_impl(&dword_24DF73000, v16, OS_LOG_TYPE_DEBUG, "pluginkit record: %@ has supported intent %@ and supported media categories: %@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
    else
    {
      v9 = +[FedStatsPluginLog logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_1((uint64_t)v5, v9);
      }
    }
  }
}

- (BOOL)_isSupportedIntentMediaApp:(id)a3 :(id)a4 :(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v7 isEqualToString:@"com.apple.Music"] & 1) != 0
    || ([v7 isEqualToString:@"com.apple.podcasts"] & 1) != 0)
  {
    BOOL v10 = 1;
  }
  else if ([v8 count])
  {
    uint64_t v12 = [MEMORY[0x263EFF9C0] setWithSet:INTENT_MEDIA_SUPPORTED_CATEGORIES];
    [v12 intersectSet:v8];
    if ([v12 count] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v13 = [MEMORY[0x263EFF9C0] setWithSet:INTENT_MEDIA_SUPPORTED_INTENTS];
      id v14 = [MEMORY[0x263EFFA08] setWithArray:v9];
      [v13 intersectSet:v14];

      BOOL v10 = [v13 count] != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)applyFilteringForMediaDomain
{
  id v2 = [(FedStatsCohortQueryInstalledApps *)self domainToInstalledApps];
  id v6 = [v2 objectForKeyedSubscript:@"media"];

  v3 = [v6 objectsPassingTest:&__block_literal_global_0];
  uint64_t v4 = [v3 objectsPassingTest:&__block_literal_global_115];

  id v5 = [v4 objectsPassingTest:&__block_literal_global_117];

  [v6 setSet:v5];
}

uint64_t __64__FedStatsCohortQueryInstalledApps_applyFilteringForMediaDomain__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 bundleIdentifier];
  uint64_t v3 = [&unk_270012780 containsObject:v2] ^ 1;

  return v3;
}

uint64_t __64__FedStatsCohortQueryInstalledApps_applyFilteringForMediaDomain__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 supportedIntents];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

uint64_t __64__FedStatsCohortQueryInstalledApps_applyFilteringForMediaDomain__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 supportedMediaCategories];
  uint64_t v3 = [v2 containsObject:@"INMediaCategoryVideo"] ^ 1;

  return v3;
}

- (unint64_t)numOfMediaApps
{
  return self->_numOfMediaApps;
}

- (unint64_t)numOfPhoneApps
{
  return self->_numOfPhoneApps;
}

- (NSDictionary)domainToInstalledApps
{
  return self->_domainToInstalledApps;
}

- (void)setDomainToInstalledApps:(id)a3
{
}

- (void).cxx_destruct
{
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24DF73000, a2, OS_LOG_TYPE_ERROR, "Error enumerating plugins; missing containing bundle of plugin: %@",
    (uint8_t *)&v2,
    0xCu);
}

void __57__FedStatsCohortQueryInstalledApps_lsPluginKitExtensions__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_24DF73000, a3, OS_LOG_TYPE_ERROR, "Error enumerating plugins; matching query: %@, error: %@",
    (uint8_t *)&v6,
    0x16u);
}

@end