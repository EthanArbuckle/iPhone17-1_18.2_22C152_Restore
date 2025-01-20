@interface ATXHomeScreenWidgetDiscoverabilityLogHarvester
- (ATXHomeScreenWidgetDiscoverabilityLogHarvester)init;
- (BOOL)_isRegularlyUsedApp:(id)a3;
- (BOOL)_shouldConsiderWidgetWhenCalculatingRankBasedMetricsWithFamilyMask:(unint64_t)a3;
- (id)_appLaunchCountForAppBundleId:(id)a3;
- (id)_fetchStackSuggestionsWithDefaultStack:(id)a3;
- (id)_generateSummaryMetricsWithDescriptorCache:(id)a3 withActivity:(id)a4;
- (id)_globalPopularityDictionary;
- (id)_initializeMetricsAccumulatorWithKeys:(id)a3;
- (id)_installed3PAppsSortedByUsage;
- (id)_installed3PAppsWithWidgetsSortedByUsage;
- (id)_installedAppsSortedByAppUsage;
- (id)_setOfTopTwentyInstalled3PApps;
- (id)_shortDescriptionForAlgorithm:(int)a3;
- (id)_topTwentyInstalled3PAppsSortedByUsage;
- (id)_uniqueDaysAppHasBeenLaunchedOverLast28Days:(id)a3;
- (id)dryRunResult;
- (void)_generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer:(id)a3 descriptors:(id)a4 appMetrics:(id)a5 algorithm:(int)a6;
- (void)_globalPopularityDictionary;
- (void)_logAdblClassificationForUser;
- (void)_logRankBasedMetricsWithOnboardingStacks:(id)a3 algorithm:(int)a4;
- (void)_populateDistributionBasedMetricsWithAppMetrics:(id)a3;
- (void)_populateRankBasedGlobalPopularityMetricsForWidgetPersonality:(id)a3 withRank:(id)a4 adoptionScore:(id)a5;
- (void)_populateRankBasedMetricsForUsageWithRank:(id)a3 appBundleId:(id)a4 mostRegularlyUsedApp:(id)a5 secondMostRegularlyUsedApp:(id)a6;
- (void)_populateRankBasedTimelineAdoptionMetricsForWidgetPersonality:(id)a3 withRank:(id)a4 adoptionScore:(id)a5;
- (void)_queryAppUsageForAllInstalledApps;
- (void)generateWidgetDiscoverabilityMetricsWithActivity:(id)a3;
- (void)sendToCoreAnalytics;
@end

@implementation ATXHomeScreenWidgetDiscoverabilityLogHarvester

- (ATXHomeScreenWidgetDiscoverabilityLogHarvester)init
{
  v21.receiver = self;
  v21.super_class = (Class)ATXHomeScreenWidgetDiscoverabilityLogHarvester;
  v2 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)&v21 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    widgetDiscoverabilityDictionaries = v2->_widgetDiscoverabilityDictionaries;
    v2->_widgetDiscoverabilityDictionaries = (NSMutableDictionary *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v6 = [v5 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v6;

    v8 = BiomeLibrary();
    v9 = [v8 App];
    uint64_t v10 = [v9 InFocus];
    appLaunchStream = v2->_appLaunchStream;
    v2->_appLaunchStream = (BMStream *)v10;

    uint64_t v12 = objc_opt_new();
    appUsageDictionary = v2->_appUsageDictionary;
    v2->_appUsageDictionary = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    timelineRelevanceAdoptionHelper = v2->_timelineRelevanceAdoptionHelper;
    v2->_timelineRelevanceAdoptionHelper = (ATXTimelineRelevanceAdoption *)v14;

    uint64_t v16 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)v2 _globalPopularityDictionary];
    globalPopularityDictionary = v2->_globalPopularityDictionary;
    v2->_globalPopularityDictionary = (NSDictionary *)v16;

    v2->_isiPad = [MEMORY[0x1E4F93B08] isiPad];
    uint64_t v18 = objc_opt_new();
    metricsPerAlgorithm = v2->_metricsPerAlgorithm;
    v2->_metricsPerAlgorithm = (NSMutableArray *)v18;
  }
  return v2;
}

- (id)_globalPopularityDictionary
{
  v2 = [MEMORY[0x1E4F4AF08] dictionaryFromLazyPlistForClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKeyedSubscript:@"widgetGlobalPopularityStack"];
    if (v4) {
      goto LABEL_9;
    }
    id v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)v5 _globalPopularityDictionary];
    }
  }
  else
  {
    id v5 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)v5 _globalPopularityDictionary];
    }
    v4 = 0;
  }

LABEL_9:
  return v4;
}

- (void)generateWidgetDiscoverabilityMetricsWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4B430] sharedInstance];
  id v19 = 0;
  uint64_t v6 = [v5 fetchHomeScreenWidgetDescriptorMetadataWithError:&v19];
  id v7 = v19;
  if (v7)
  {
    uint64_t v8 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester generateWidgetDiscoverabilityMetricsWithActivity:]((uint64_t)v7, v8);
    }
  }
  else
  {
    uint64_t v9 = +[_ATXAppLaunchHistogramManager sharedInstance];
    uint64_t v8 = [v9 histogramForLaunchType:1];

    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [v10 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

    id v12 = objc_alloc(MEMORY[0x1E4F4AF90]);
    uint64_t v13 = [v5 homeScreenDescriptors];
    uint64_t v14 = (void *)[v12 initWithDescriptors:v13 descriptorInstallDates:v6 homeScreenConfig:MEMORY[0x1E4F1CBF0] isDayZeroExperience:0 isiPad:self->_isiPad spotlightAppLaunchHistogram:v8 adblDrainClassification:1 appLaunchCounts:v11];

    uint64_t v15 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _generateSummaryMetricsWithDescriptorCache:v6 withActivity:v4];
    if (v15 && ([v4 didDefer] & 1) == 0)
    {
      uint64_t v17 = 0;
      do
      {
        [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer:v14 descriptors:v6 appMetrics:v15 algorithm:v17];
        uint64_t v17 = (v17 + 1);
      }
      while (v17 != 4);
    }
    else
    {
      uint64_t v16 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Deferring metric harvesting for default stacks.", buf, 2u);
      }
    }
  }
}

- (id)_shortDescriptionForAlgorithm:(int)a3
{
  id v4 = [MEMORY[0x1E4F4AF98] stringForAlgorithmType:*(void *)&a3];
  uint64_t v5 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x1E4F4B720]];
  uint64_t v6 = (void *)v5;
  id v7 = @"(onboarding_outcome_unset)";
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  uint64_t v9 = [NSString stringWithFormat:@"%@:%@", v4, v8];

  return v9;
}

- (void)_generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer:(id)a3 descriptors:(id)a4 appMetrics:(id)a5 algorithm:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = (NSMutableDictionary *)objc_opt_new();
  widgetDiscoverabilityDictionaries = self->_widgetDiscoverabilityDictionaries;
  self->_widgetDiscoverabilityDictionaries = v11;

  uint64_t v13 = [v10 personalizedOnboardingStacksWithRankingAlgorithm:v6];

  uint64_t v14 = [v13 stack1];
  v20[0] = v14;
  uint64_t v15 = [v13 stack2];
  v20[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  uint64_t v17 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _shortDescriptionForAlgorithm:v6];
  [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v17 forKeyedSubscript:@"algorithm"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke;
  v19[3] = &unk_1E68ACE88;
  v19[4] = self;
  [v16 enumerateObjectsUsingBlock:v19];
  uint64_t v18 = [v13 sortedThirdPartyWidgets];
  [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _logRankBasedMetricsWithOnboardingStacks:v18 algorithm:v6];

  [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries addEntriesFromDictionary:v9];
  [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _logAdblClassificationForUser];
  [(NSMutableArray *)self->_metricsPerAlgorithm addObject:self->_widgetDiscoverabilityDictionaries];
}

void __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) _fetchStackSuggestionsWithDefaultStack:a2];
  if ([v5 count] != 4)
  {
    uint64_t v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v9 = 4;
      __int16 v10 = 2048;
      uint64_t v11 = [v5 count];
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Expected default stack to contain %lu widgets. %lu widgets found", buf, 0x16u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke_154;
  v7[3] = &unk_1E68ACE60;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __147__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateWidgetDiscoverabilityMetricsWithHomeScreenItemProducer_descriptors_appMetrics_algorithm___block_invoke_154(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = NSString;
  uint64_t v5 = *(void *)(a1 + 40) + 1;
  uint64_t v6 = a3 + 1;
  id v7 = a2;
  objc_msgSend(v4, "stringWithFormat:", @"kStack%luWidget%luKey", v5, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)MEMORY[0x1E4F4B440];
  uint64_t v9 = [v7 avocadoDescriptor];
  __int16 v10 = [v9 extensionBundleIdentifier];
  uint64_t v11 = [v7 avocadoDescriptor];

  uint64_t v12 = [v11 kind];
  uint64_t v13 = [v8 stringRepresentationForExtensionBundleId:v10 kind:v12];

  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v13 forKeyedSubscript:v14];
}

- (void)_logAdblClassificationForUser
{
  uint64_t v3 = NSNumber;
  id v5 = [MEMORY[0x1E4F4AF18] sharedInstance];
  id v4 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "fetchADBLDrainClassification"));
  [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v4 forKeyedSubscript:@"adblClassificationForUser"];
}

- (id)_fetchStackSuggestionsWithDefaultStack:(id)a3
{
  if (self->_isiPad) {
    [a3 mediumDefaultStack];
  }
  else {
  uint64_t v3 = [a3 smallDefaultStack];
  }
  return v3;
}

- (id)_initializeMetricsAccumulatorWithKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_opt_new();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10, (void)v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_generateSummaryMetricsWithDescriptorCache:(id)a3 withActivity:(id)a4
{
  v32[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32[0] = @"howMany3PAppsHaveWidgets";
  v32[1] = @"howManyAppsHaveWidgets";
  v32[2] = @"howManyRegularlyUsed3PAppsHaveWidgets";
  v32[3] = @"howManyRegularlyUsedAppsHaveWidgets";
  v32[4] = @"howManyRegularlyUsed3PAppsAdoptedTimelineRelevance";
  v32[5] = @"howManyTop20AppsHaveWidgets";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:6];
  uint64_t v9 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _initializeMetricsAccumulatorWithKeys:v8];
  appMetricsAccumulator = self->_appMetricsAccumulator;
  self->_appMetricsAccumulator = v9;

  [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _queryAppUsageForAllInstalledApps];
  if ([v7 didDefer])
  {
    uint64_t v11 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Deferring metric harvesting for default stacks.", buf, 2u);
    }

    uint64_t v12 = 0;
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke;
    v29[3] = &unk_1E68ACEB0;
    v29[4] = self;
    id v24 = v6;
    [v6 enumerateKeysAndObjectsUsingBlock:v29];
    uint64_t v12 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v23 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v19 = NSNumber;
          v20 = [(NSMutableDictionary *)self->_appMetricsAccumulator objectForKeyedSubscript:v18];
          objc_super v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
          [v12 setObject:v21 forKeyedSubscript:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v15);
    }

    [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _populateDistributionBasedMetricsWithAppMetrics:v12];
    id v6 = v24;
    uint64_t v8 = v23;
  }

  return v12;
}

void __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 containerBundleId];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [v6 containerBundleId];
    if (!+[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:v9])
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"howMany3PAppsHaveWidgets"];
      [v10 addObject:v9];

      if ([*(id *)(a1 + 32) _isRegularlyUsedApp:v9])
      {
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"howManyRegularlyUsed3PAppsHaveWidgets"];
        [v11 addObject:v9];

        uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
        id v13 = [v5 extensionBundleId];
        uint64_t v14 = [v5 kind];
        uint64_t v15 = [v12 globalDiverseSchemaRawNumber:v13 kind:v14];

        if (v15)
        {
          uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"howManyRegularlyUsed3PAppsAdoptedTimelineRelevance"];
          [v16 addObject:v9];
        }
      }
    }
    uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"howManyAppsHaveWidgets"];
    [v17 addObject:v9];

    if ([*(id *)(a1 + 32) _isRegularlyUsedApp:v9])
    {
      uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"howManyRegularlyUsedAppsHaveWidgets"];
      [v18 addObject:v9];
    }
    id v19 = [*(id *)(a1 + 32) _setOfTopTwentyInstalled3PApps];
    int v20 = [v19 containsObject:v9];

    if (v20)
    {
      objc_super v21 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:@"howManyTop20AppsHaveWidgets"];
      [v21 addObject:v9];
    }
  }
  else
  {
    v22 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke_cold_1(v5, v22);
    }

    uint64_t v9 = 0;
  }
}

- (void)_queryAppUsageForAllInstalledApps
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4AED0]) initWithStream:self->_appLaunchStream];
  id v4 = [v3 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForAllApps];

  [(NSMutableDictionary *)self->_appUsageDictionary addEntriesFromDictionary:v4];
}

- (void)_populateDistributionBasedMetricsWithAppMetrics:(id)a3
{
  id v14 = a3;
  id v4 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _installed3PAppsWithWidgetsSortedByUsage];
  unint64_t v5 = [v4 count];
  if (v5 >= 0x14) {
    uint64_t v6 = 20;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6);
  if ([v7 count])
  {
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _uniqueDaysAppHasBeenLaunchedOverLast28Days:v8];
    [v14 setObject:v9 forKeyedSubscript:@"maxNumberOfUniqueDaysLaunchedForTop20"];

    uint64_t v10 = [v7 lastObject];
    uint64_t v11 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _uniqueDaysAppHasBeenLaunchedOverLast28Days:v10];
    [v14 setObject:v11 forKeyedSubscript:@"minNumberOfUniqueDaysLaunchedForTop20"];

    uint64_t v12 = objc_msgSend(v7, "objectAtIndex:", (unint64_t)objc_msgSend(v7, "count") >> 1);
    id v13 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _uniqueDaysAppHasBeenLaunchedOverLast28Days:v12];
    [v14 setObject:v13 forKeyedSubscript:@"medianNumberOfUniqueDaysLaunchedForTop20"];
  }
}

- (BOOL)_shouldConsiderWidgetWhenCalculatingRankBasedMetricsWithFamilyMask:(unint64_t)a3
{
  if ((a3 & 4) != 0 && self->_isiPad) {
    LOBYTE(v3) = 1;
  }
  else {
    return !self->_isiPad & (a3 >> 1);
  }
  return v3;
}

- (void)_logRankBasedMetricsWithOnboardingStacks:(id)a3 algorithm:(int)a4
{
  id v6 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke;
  void v20[3] = &unk_1E68ACED8;
  v20[4] = self;
  id v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v20];
  uint64_t v8 = [v6 filteredArrayUsingPredicate:v7];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [MEMORY[0x1E4F4AF98] filterOutDuplicateWidgetsFromSameAppBundleId:v9];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  BOOL v19 = a4 == 3;
  uint64_t v10 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _installed3PAppsWithWidgetsSortedByUsage];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__9;
  v16[4] = __Block_byref_object_dispose__9;
  uint64_t v11 = (void *)[v10 count];
  if (v11)
  {
    uint64_t v11 = [v10 firstObject];
  }
  id v17 = v11;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__9;
  v14[4] = __Block_byref_object_dispose__9;
  if ((unint64_t)[v10 count] < 2)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v10 objectAtIndex:1];
  }
  id v15 = v12;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke_168;
  v13[3] = &unk_1E68ACF00;
  v13[4] = self;
  v13[5] = v18;
  v13[6] = v16;
  v13[7] = v14;
  [v9 enumerateObjectsUsingBlock:v13];
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
}

uint64_t __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 avocadoDescriptor];
  uint64_t v4 = objc_msgSend(v2, "_shouldConsiderWidgetWhenCalculatingRankBasedMetricsWithFamilyMask:", objc_msgSend(v3, "supportedFamilies"));

  return v4;
}

void __101__ATXHomeScreenWidgetDiscoverabilityLogHarvester__logRankBasedMetricsWithOnboardingStacks_algorithm___block_invoke_168(void *a1, void *a2, uint64_t a3)
{
  id v24 = a2;
  unint64_t v5 = *(void **)(a1[4] + 40);
  id v6 = [v24 avocadoDescriptor];
  id v7 = [v6 extensionBundleIdentifier];
  uint64_t v8 = [v24 avocadoDescriptor];
  uint64_t v9 = [v8 kind];
  uint64_t v10 = [v5 globalDiverseSchemaRawNumber:v7 kind:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F4B440];
  uint64_t v12 = [v24 avocadoDescriptor];
  id v13 = [v12 extensionBundleIdentifier];
  id v14 = [v24 avocadoDescriptor];
  id v15 = [v14 kind];
  uint64_t v16 = [v11 stringRepresentationForExtensionBundleId:v13 kind:v15];

  id v17 = (void *)a1[4];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:a3];
  [v17 _populateRankBasedTimelineAdoptionMetricsForWidgetPersonality:v16 withRank:v18 adoptionScore:v10];

  BOOL v19 = (void *)a1[4];
  int v20 = [NSNumber numberWithUnsignedInteger:a3];
  [v19 _populateRankBasedGlobalPopularityMetricsForWidgetPersonality:v16 withRank:v20 adoptionScore:v10];

  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    objc_super v21 = (void *)a1[4];
    v22 = [NSNumber numberWithUnsignedInteger:a3];
    v23 = [v24 appBundleId];
    [v21 _populateRankBasedMetricsForUsageWithRank:v22 appBundleId:v23 mostRegularlyUsedApp:*(void *)(*(void *)(a1[6] + 8) + 40) secondMostRegularlyUsedApp:*(void *)(*(void *)(a1[7] + 8) + 40)];
  }
}

- (void)_populateRankBasedTimelineAdoptionMetricsForWidgetPersonality:(id)a3 withRank:(id)a4 adoptionScore:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_13;
  }
  if ([v9 isEqualToNumber:&unk_1F27F0198])
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"firstWidgetThatIsGoodTimelineRelevanceAdopter"];

    widgetDiscoverabilityDictionaries = self->_widgetDiscoverabilityDictionaries;
    if (!v11)
    {
      [(NSMutableDictionary *)widgetDiscoverabilityDictionaries setObject:v19 forKeyedSubscript:@"firstWidgetThatIsGoodTimelineRelevanceAdopter"];
      id v14 = @"rankForFirstWidgetThatIsGoodTimelineRelevanceAdopter";
      goto LABEL_7;
    }
    id v13 = [(NSMutableDictionary *)widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"secondWidgetThatIsGoodTimelineRelevanceAdopter"];

    if (!v13)
    {
      [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v19 forKeyedSubscript:@"secondWidgetThatIsGoodTimelineRelevanceAdopter"];
      id v14 = @"rankForSecondWidgetThatIsGoodTimelineRelevanceAdopter";
LABEL_7:
      [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v8 forKeyedSubscript:v14];
    }
  }
  id v15 = @"firstWidgetThatIsTimelineRelevanceAdopter";
  uint64_t v16 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"firstWidgetThatIsTimelineRelevanceAdopter"];

  if (v16)
  {
    id v15 = @"secondWidgetThatIsTimelineRelevanceAdopter";
    id v17 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"secondWidgetThatIsTimelineRelevanceAdopter"];

    if (v17) {
      goto LABEL_13;
    }
    uint64_t v18 = @"rankForSecondWidgetThatIsTimelineRelevanceAdopter";
  }
  else
  {
    uint64_t v18 = @"rankForFirstWidgetThatIsTimelineRelevanceAdopter";
  }
  [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v19 forKeyedSubscript:v15];
  [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v8 forKeyedSubscript:v18];
LABEL_13:
}

- (void)_populateRankBasedGlobalPopularityMetricsForWidgetPersonality:(id)a3 withRank:(id)a4 adoptionScore:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = [(NSDictionary *)self->_globalPopularityDictionary objectForKeyedSubscript:v18];

  if (!v9) {
    goto LABEL_13;
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"firstWidgetThatIsGloballyPopular"];

  widgetDiscoverabilityDictionaries = self->_widgetDiscoverabilityDictionaries;
  if (!v10)
  {
    [(NSMutableDictionary *)widgetDiscoverabilityDictionaries setObject:v18 forKeyedSubscript:@"firstWidgetThatIsGloballyPopular"];
    id v13 = @"rankForFirstWidgetThatIsGloballyPopular";
    goto LABEL_6;
  }
  uint64_t v12 = [(NSMutableDictionary *)widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"secondWidgetThatIsGloballyPopular"];

  if (!v12)
  {
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v18 forKeyedSubscript:@"secondWidgetThatIsGloballyPopular"];
    id v13 = @"rankForSecondWidgetThatIsGloballyPopular";
LABEL_6:
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v8 forKeyedSubscript:v13];
  }
  if (!a5) {
    goto LABEL_13;
  }
  id v14 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"firstWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"];

  id v15 = self->_widgetDiscoverabilityDictionaries;
  if (v14)
  {
    uint64_t v16 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:@"secondWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"];

    if (v16) {
      goto LABEL_13;
    }
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v18 forKeyedSubscript:@"secondWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"];
    id v17 = @"rankForSecondWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular";
  }
  else
  {
    [(NSMutableDictionary *)v15 setObject:v18 forKeyedSubscript:@"firstWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular"];
    id v17 = @"rankForFirstWidgetThatIsTimelineRelevanceAdopterAndGloballyPopular";
  }
  [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v8 forKeyedSubscript:v17];
LABEL_13:
}

- (void)_populateRankBasedMetricsForUsageWithRank:(id)a3 appBundleId:(id)a4 mostRegularlyUsedApp:(id)a5 secondMostRegularlyUsedApp:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"mostRegularlyUsedAppWithWidget"];
  if (v13)
  {
  }
  else if ([v11 isEqualToString:v10])
  {
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v10 forKeyedSubscript:@"mostRegularlyUsedAppWithWidget"];
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v15 forKeyedSubscript:@"rankForMostRegularlyUsedAppWithWidget"];
  }
  id v14 = [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries objectForKeyedSubscript:@"secondMostRegularlyUsedAppWithWidget"];
  if (v14)
  {
  }
  else if ([v12 isEqualToString:v10])
  {
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v10 forKeyedSubscript:@"secondMostRegularlyUsedAppWithWidget"];
    [(NSMutableDictionary *)self->_widgetDiscoverabilityDictionaries setObject:v15 forKeyedSubscript:@"rankForSecondMostRegularlyUsedAppWithWidget"];
  }
}

- (void)sendToCoreAnalytics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: sending logs to Core Analytics", buf, 2u);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v4 = self->_metricsPerAlgorithm;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        AnalyticsSendEvent();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)dryRunResult
{
  v6[1] = *MEMORY[0x1E4F143B8];
  metricsPerAlgorithm = self->_metricsPerAlgorithm;
  uint64_t v5 = @"data";
  v6[0] = metricsPerAlgorithm;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)_uniqueDaysAppHasBeenLaunchedOverLast28Days:(id)a3
{
  BOOL v3 = NSNumber;
  uint64_t v4 = [(NSMutableDictionary *)self->_appUsageDictionary objectForKeyedSubscript:a3];
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "uniqueDaysLaunched"));

  return v5;
}

- (id)_appLaunchCountForAppBundleId:(id)a3
{
  BOOL v3 = NSNumber;
  uint64_t v4 = [(NSMutableDictionary *)self->_appUsageDictionary objectForKeyedSubscript:a3];
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "rawLaunchCount"));

  return v5;
}

- (BOOL)_isRegularlyUsedApp:(id)a3
{
  if (a3)
  {
    BOOL v3 = -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _uniqueDaysAppHasBeenLaunchedOverLast28Days:](self, "_uniqueDaysAppHasBeenLaunchedOverLast28Days:");
    unint64_t v4 = [v3 integerValue];
    BOOL v5 = v4 >= *MEMORY[0x1E4F4B560];
  }
  else
  {
    uint64_t v6 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenWidgetDiscoverabilityLogHarvester _isRegularlyUsedApp:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    return 0;
  }
  return v5;
}

- (id)_installedAppsSortedByAppUsage
{
  BOOL v3 = +[_ATXAppIconState sharedInstance];
  unint64_t v4 = [v3 allInstalledAppsKnownToSpringBoard];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installedAppsSortedByAppUsage__block_invoke;
  v7[3] = &unk_1E68ACBF8;
  v7[4] = self;
  BOOL v5 = [v4 sortedArrayUsingComparator:v7];

  return v5;
}

uint64_t __80__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installedAppsSortedByAppUsage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _uniqueDaysAppHasBeenLaunchedOverLast28Days:v5];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [*(id *)(a1 + 32) _uniqueDaysAppHasBeenLaunchedOverLast28Days:v6];
  uint64_t v10 = [v9 integerValue];

  if (v8 == v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) _appLaunchCountForAppBundleId:v5];
    uint64_t v12 = [v11 integerValue];

    uint64_t v13 = [*(id *)(a1 + 32) _appLaunchCountForAppBundleId:v6];
    uint64_t v14 = [v13 integerValue];

    uint64_t v15 = -1;
    if (v12 <= v14) {
      uint64_t v15 = 1;
    }
    if (v12 == v14) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v15;
    }
  }
  else if (v8 > v10)
  {
    uint64_t v16 = -1;
  }
  else
  {
    uint64_t v16 = 1;
  }

  return v16;
}

- (id)_installed3PAppsSortedByUsage
{
  thirdPartyAppsSortedByUsage = self->_thirdPartyAppsSortedByUsage;
  if (!thirdPartyAppsSortedByUsage)
  {
    unint64_t v4 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _installedAppsSortedByAppUsage];
    id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_25];
    id v6 = [v4 filteredArrayUsingPredicate:v5];
    uint64_t v7 = self->_thirdPartyAppsSortedByUsage;
    self->_thirdPartyAppsSortedByUsage = v6;

    thirdPartyAppsSortedByUsage = self->_thirdPartyAppsSortedByUsage;
  }
  uint64_t v8 = thirdPartyAppsSortedByUsage;
  return v8;
}

uint64_t __79__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installed3PAppsSortedByUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXHomeScreenLogUploaderUtilities isFirstPartyApp:a2] ^ 1;
}

- (id)_topTwentyInstalled3PAppsSortedByUsage
{
  v2 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _installed3PAppsSortedByUsage];
  unint64_t v3 = [v2 count];
  if (v3 >= 0x14) {
    uint64_t v4 = 20;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = objc_msgSend(v2, "subarrayWithRange:", 0, v4);

  return v5;
}

- (id)_setOfTopTwentyInstalled3PApps
{
  topTwentyInstalled3PApps = self->_topTwentyInstalled3PApps;
  if (!topTwentyInstalled3PApps)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _topTwentyInstalled3PAppsSortedByUsage];
    id v6 = [v4 setWithArray:v5];
    uint64_t v7 = self->_topTwentyInstalled3PApps;
    self->_topTwentyInstalled3PApps = v6;

    topTwentyInstalled3PApps = self->_topTwentyInstalled3PApps;
  }
  uint64_t v8 = topTwentyInstalled3PApps;
  return v8;
}

- (id)_installed3PAppsWithWidgetsSortedByUsage
{
  uint64_t v3 = [(NSMutableDictionary *)self->_appMetricsAccumulator objectForKeyedSubscript:@"howManyAppsHaveWidgets"];
  if (v3
    && (uint64_t v4 = (void *)v3,
        -[NSMutableDictionary objectForKeyedSubscript:](self->_appMetricsAccumulator, "objectForKeyedSubscript:", @"howManyAppsHaveWidgets"), id v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 count], v5, v4, v6))
  {
    uint64_t v7 = [(ATXHomeScreenWidgetDiscoverabilityLogHarvester *)self _installed3PAppsSortedByUsage];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installed3PAppsWithWidgetsSortedByUsage__block_invoke;
    v11[3] = &unk_1E68ACED8;
    v11[4] = self;
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:v11];
    uint64_t v9 = [v7 filteredArrayUsingPredicate:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v9;
}

uint64_t __90__ATXHomeScreenWidgetDiscoverabilityLogHarvester__installed3PAppsWithWidgetsSortedByUsage__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 64);
  id v3 = a2;
  uint64_t v4 = [v2 objectForKeyedSubscript:@"howManyAppsHaveWidgets"];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topTwentyInstalled3PApps, 0);
  objc_storeStrong((id *)&self->_metricsPerAlgorithm, 0);
  objc_storeStrong((id *)&self->_appMetricsAccumulator, 0);
  objc_storeStrong((id *)&self->_thirdPartyAppsSortedByUsage, 0);
  objc_storeStrong((id *)&self->_globalPopularityDictionary, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceAdoptionHelper, 0);
  objc_storeStrong((id *)&self->_appUsageDictionary, 0);
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_widgetDiscoverabilityDictionaries, 0);
}

- (void)_globalPopularityDictionary
{
}

- (void)generateWidgetDiscoverabilityMetricsWithActivity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: Error when attempting to fetch widget descriptors with additional data - %{public}@", (uint8_t *)&v2, 0xCu);
}

void __106__ATXHomeScreenWidgetDiscoverabilityLogHarvester__generateSummaryMetricsWithDescriptorCache_withActivity___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 extensionBundleId];
  uint64_t v5 = [a1 kind];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXHomeScreenWidgetDiscoverabilityLogHarvester: unable to get bundleId for extensionBundleId: %@, kind: %@", (uint8_t *)&v6, 0x16u);
}

- (void)_isRegularlyUsedApp:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end