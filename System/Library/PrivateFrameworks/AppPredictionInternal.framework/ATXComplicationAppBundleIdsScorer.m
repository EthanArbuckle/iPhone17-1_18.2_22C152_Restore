@interface ATXComplicationAppBundleIdsScorer
- (ATXComplicationAppBundleIdsScorer)init;
- (id)_scoredComplicationBundleIdsForModularSet:(id)a3 bundleIdToAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 bundleIdToPriors:(id)a6 widgetAppBundleIdsOnHomeScreen:(id)a7 complicationBundleIdCountsOnWatch:(id)a8;
- (id)_widgetAppBundleIdsOnHomeScreen;
- (id)inputDescriptionForSignal:(id)a3 complicationAppBundleIds:(id)a4;
- (id)rankedComplicationAppBundleIdsGivenComplicationAppBundleIds:(id)a3 bundleIdToAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 bundleIdToPriors:(id)a6 widgetAppBundleIdsOnHomeScreen:(id)a7;
- (id)scoredComplicationBundleIdsForModularSet:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5;
@end

@implementation ATXComplicationAppBundleIdsScorer

- (ATXComplicationAppBundleIdsScorer)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXComplicationAppBundleIdsScorer;
  v2 = [(ATXComplicationAppBundleIdsScorer *)&v14 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    v4 = [v3 App];
    uint64_t v5 = [v4 InFocus];
    appLaunchStream = v2->_appLaunchStream;
    v2->_appLaunchStream = (BMStream *)v5;

    uint64_t v7 = +[ATXComplicationSuggestionParameters sharedInstance];
    parameters = v2->_parameters;
    v2->_parameters = (ATXComplicationSuggestionParameters *)v7;

    uint64_t v9 = objc_opt_new();
    hsCache = v2->_hsCache;
    v2->_hsCache = (ATXHomeScreenConfigCache *)v9;

    uint64_t v11 = [MEMORY[0x1E4F4B428] sharedInstance];
    watchFaceConfiguration = v2->_watchFaceConfiguration;
    v2->_watchFaceConfiguration = (ATXWatchFaceConfigurationCollector *)v11;
  }
  return v2;
}

- (id)inputDescriptionForSignal:(id)a3 complicationAppBundleIds:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  uint64_t v9 = v8;
  if ([v6 isEqualToString:@"appLaunchUniqueDays"])
  {
    id v34 = v6;
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F4AED0]) initWithStream:self->_appLaunchStream];
    uint64_t v11 = [v10 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v7];

    [v8 appendString:@"Number of unique days bundleId was launched on:\n"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v33 = v7;
    obuint64_t j = v7;
    uint64_t v12 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v17 = [v11 objectForKeyedSubscript:v16];
          v18 = [NSString stringWithFormat:@"%@: %lu\n", v16, objc_msgSend(v17, "uniqueDaysLaunched")];
          v8 = v9;
          [v9 appendString:v18];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v13);
    }
LABEL_18:

    id v7 = v33;
    id v6 = v34;
    goto LABEL_28;
  }
  if ([v6 isEqualToString:@"appLaunchTotalCount"])
  {
    id v34 = v6;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F4AED0]) initWithStream:self->_appLaunchStream];
    uint64_t v11 = [v19 rawLaunchCountAndDistinctDaysLaunchedOverLast28DaysForApps:v7];

    [v8 appendString:@"Number of bundleId launches:\n"];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v33 = v7;
    obuint64_t j = v7;
    uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          v25 = [v11 objectForKeyedSubscript:v24];
          v26 = [NSString stringWithFormat:@"%@: %lu\n", v24, objc_msgSend(v25, "rawLaunchCount")];
          v8 = v9;
          [v9 appendString:v26];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v21);
    }
    goto LABEL_18;
  }
  if ([v6 isEqualToString:@"preConfiguredWidgets"])
  {
    v27 = [(ATXComplicationAppBundleIdsScorer *)self _widgetAppBundleIdsOnHomeScreen];
    v28 = @"Widget app bundleIds configured on HomeScreen:\n";
LABEL_23:
    [v8 appendString:v28];
    uint64_t v29 = [v27 description];
    v30 = (void *)v29;
    if (v29) {
      v31 = (__CFString *)v29;
    }
    else {
      v31 = &stru_1F2740B58;
    }
    [v8 appendString:v31];

    goto LABEL_28;
  }
  if ([v6 isEqualToString:@"appPriors"])
  {
    v27 = [(ATXComplicationSuggestionParameters *)self->_parameters appsToPriorsMapping];
    v28 = @"Prior values for bundleIds:\n";
    goto LABEL_23;
  }
  [v8 appendString:@"Unrecognized Signal"];
LABEL_28:

  return v8;
}

- (id)scoredComplicationBundleIdsForModularSet:(id)a3 aggregatedAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  v8 = [(ATXComplicationAppBundleIdsScorer *)self _widgetAppBundleIdsOnHomeScreen];
  uint64_t v9 = [(ATXComplicationSuggestionParameters *)self->_parameters appsToPriorsMapping];
  v10 = [(ATXWatchFaceConfigurationCollector *)self->_watchFaceConfiguration watchFaces];
  uint64_t v11 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      v17 = v11;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = [*(id *)(*((void *)&v25 + 1) + 8 * v16) complications];
        uint64_t v11 = [v17 arrayByAddingObjectsFromArray:v18];

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28BD0]) initWithArray:v11];
  uint64_t v20 = [(ATXComplicationAppBundleIdsScorer *)self _scoredComplicationBundleIdsForModularSet:v24 bundleIdToAppLaunchData:v23 bundleIdToCompanionBundleId:v22 bundleIdToPriors:v9 widgetAppBundleIdsOnHomeScreen:v8 complicationBundleIdCountsOnWatch:v19];

  return v20;
}

- (id)rankedComplicationAppBundleIdsGivenComplicationAppBundleIds:(id)a3 bundleIdToAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 bundleIdToPriors:(id)a6 widgetAppBundleIdsOnHomeScreen:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_opt_new();
  v18 = [(ATXComplicationAppBundleIdsScorer *)self _scoredComplicationBundleIdsForModularSet:v16 bundleIdToAppLaunchData:v15 bundleIdToCompanionBundleId:v14 bundleIdToPriors:v13 widgetAppBundleIdsOnHomeScreen:v12 complicationBundleIdCountsOnWatch:v17];

  v19 = [v18 keysSortedByValueUsingComparator:&__block_literal_global_153];

  return v19;
}

uint64_t __197__ATXComplicationAppBundleIdsScorer_rankedComplicationAppBundleIdsGivenComplicationAppBundleIds_bundleIdToAppLaunchData_bundleIdToCompanionBundleId_bundleIdToPriors_widgetAppBundleIdsOnHomeScreen___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)_scoredComplicationBundleIdsForModularSet:(id)a3 bundleIdToAppLaunchData:(id)a4 bundleIdToCompanionBundleId:(id)a5 bundleIdToPriors:(id)a6 widgetAppBundleIdsOnHomeScreen:(id)a7 complicationBundleIdCountsOnWatch:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v34 = a7;
  id v14 = a8;
  id v35 = (id)objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v20 = [v38 objectForKeyedSubscript:v19];
        uint64_t v21 = [v36 objectForKeyedSubscript:v19];
        int v22 = [v34 containsObject:v19];
        id v23 = [v37 objectForKeyedSubscript:v19];
        double v24 = (double)(unint64_t)[v14 countForObject:v19];
        if (v23) {
          double v24 = v24 + (double)(unint64_t)[v14 countForObject:v23];
        }
        long long v25 = NSNumber;
        double v26 = (double)(unint64_t)[v20 uniqueDaysLaunched];
        double v27 = (double)(unint64_t)[v20 rawLaunchCount] / 5.0 + v26;
        [v21 doubleValue];
        double v29 = v28 / 100.0 + v27;
        if (v22) {
          double v30 = 3.0;
        }
        else {
          double v30 = 0.0;
        }
        v31 = [v25 numberWithDouble:v30 + v29 + v24 * 2.0];
        [v35 setObject:v31 forKeyedSubscript:v19];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v16);
  }

  return v35;
}

- (id)_widgetAppBundleIdsOnHomeScreen
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(ATXHomeScreenConfigCache *)self->_hsCache loadHomeScreenPageConfigurationsWithError:0];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v38;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v4;
        uint64_t v5 = *(void **)(*((void *)&v37 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1D25F6CC0]();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v6 = [v5 stacks];
        id v7 = [v5 panels];
        v8 = [v6 arrayByAddingObjectsFromArray:v7];

        id v28 = v8;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v28);
              }
              id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              id v14 = [v13 widgets];
              uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v41 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v30;
                do
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v30 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v19 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                    uint64_t v20 = [v19 appBundleId];

                    if (v20)
                    {
                      uint64_t v21 = [v19 appBundleId];
                      [v3 addObject:v21];
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v41 count:16];
                }
                while (v16);
              }
            }
            uint64_t v10 = [v28 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v27 + 1;
      }
      while (v27 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v25);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaceConfiguration, 0);
  objc_storeStrong((id *)&self->_hsCache, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_appLaunchStream, 0);
}

@end