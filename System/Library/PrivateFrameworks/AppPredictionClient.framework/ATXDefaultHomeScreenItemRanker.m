@interface ATXDefaultHomeScreenItemRanker
+ (BOOL)_shouldDownrankWidget:(id)a3;
+ (id)stringForAlgorithmType:(int)a3;
+ (int64_t)_downrankComparator:(id)a3 widget2:(id)a4;
+ (void)filterOutDuplicateWidgetsFromSameAppBundleId:(id)a3;
- (ATXDefaultHomeScreenItemRanker)initWithCachedWidgetPersonalityToAppScore:(id)a3 spotlightAppLaunchHistogram:(id)a4 appLaunchCounts:(id)a5;
- (double)_rawLaunchScoreForWidget:(id)a3;
- (double)_uniqueDaysLaunchedScoreForWidget:(id)a3;
- (id)_globalPopularityPlistStringKey:(int)a3;
- (id)_rankerPlistToDictionary:(int)a3;
- (id)_scoreForWidget:(id)a3 withGlobalPopularityDictionary:(id)a4;
- (id)_timelineRelevanceAdoptionHelper:(int)a3;
- (id)_widgetsBySortingAndFilteringWidgets:(id)a3 byAppLaunchAndRankerPlist:(int)a4 regularlyUsedThreshold:(double)a5;
- (id)widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:(id)a3 algorithm:(int)a4 regularlyUsedThreshold:(double)a5;
- (id)widgetsBySortingAndFilteringWidgetsUsingPersonalizedGalleryAlgorithm:(id)a3 rankerPlistType:(int)a4 regularlyUsedThreshold:(double)a5;
- (id)widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:(id)a3;
- (int64_t)_rankerDictionaryComparator:(id)a3 timelineRelevanceAdoptionHelper:(id)a4 widget1:(id)a5 widget2:(id)a6;
- (int64_t)_uniqueDaysLaunchedComparatorForWidget1:(id)a3 widget2:(id)a4;
- (unint64_t)_appUsageFrequencyForWidget:(id)a3 regularlyUsedThreshold:(double)a4;
- (void)_filterOutWidgetsFromProtectedApps:(id)a3;
- (void)_filterOutWidgetsNotFromTopLaunchedApps:(id)a3;
- (void)_filterOutWidgetsThatAreNotRegularlyUsed:(id)a3 regularlyUsedThreshold:(double)a4;
- (void)_sortWidgets:(id)a3 byRankerPlist:(int)a4 shouldDownRankAlreadyInstalledWidgets:(BOOL)a5;
- (void)_sortWidgetsByDistinctDaysAppWasLaunched:(id)a3 shouldDownRankAlreadyInstalledWidgets:(BOOL)a4;
- (void)_sortWidgetsByRawLaunchCounts:(id)a3 shouldDownRankAlreadyInstalledWidgets:(BOOL)a4;
@end

@implementation ATXDefaultHomeScreenItemRanker

- (ATXDefaultHomeScreenItemRanker)initWithCachedWidgetPersonalityToAppScore:(id)a3 spotlightAppLaunchHistogram:(id)a4 appLaunchCounts:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXDefaultHomeScreenItemRanker;
  v12 = [(ATXDefaultHomeScreenItemRanker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cachedWidgetPersonalityToAppScore, a3);
    objc_storeStrong((id *)&v13->_spotlightAppLaunchHistogram, a4);
    objc_storeStrong((id *)&v13->_appLaunchCounts, a5);
  }

  return v13;
}

+ (int64_t)_downrankComparator:(id)a3 widget2:(id)a4
{
  id v6 = a4;
  int v7 = [a1 _shouldDownrankWidget:a3];
  unsigned int v8 = [a1 _shouldDownrankWidget:v6];

  if (v7 ^ 1 | v8) {
    return (uint64_t)((unint64_t)((v7 ^ 1) & v8) << 63) >> 63;
  }
  else {
    return 1;
  }
}

+ (BOOL)_shouldDownrankWidget:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 rankType] == 4 || objc_msgSend(v3, "rankType") == 6;

  return v4;
}

- (int64_t)_rankerDictionaryComparator:(id)a3 timelineRelevanceAdoptionHelper:(id)a4 widget1:(id)a5 widget2:(id)a6
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a5;
  id v13 = a6;
  if (!(v10 | v11))
  {
    v26 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ATXDefaultHomeScreenItemRanker _rankerDictionaryComparator:timelineRelevanceAdoptionHelper:widget1:widget2:](v26);
    }

    goto LABEL_9;
  }
  if (v11)
  {
    v14 = [v12 avocadoDescriptor];
    objc_super v15 = [v14 extensionBundleIdentifier];
    id v28 = v12;
    v16 = [v12 avocadoDescriptor];
    v17 = [v16 kind];
    uint64_t v18 = [(id)v11 globalDiverseSchemaRawNumber:v15 kind:v17];

    v19 = [v13 avocadoDescriptor];
    v20 = [v19 extensionBundleIdentifier];
    v21 = [v13 avocadoDescriptor];
    [v21 kind];
    v23 = v22 = self;
    uint64_t v24 = [(id)v11 globalDiverseSchemaRawNumber:v20 kind:v23];

    self = v22;
    if (v18) {
      goto LABEL_4;
    }
LABEL_19:
    id v12 = v28;
    goto LABEL_10;
  }
  if (!v10)
  {
LABEL_9:
    uint64_t v24 = 0;
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  id v28 = v12;
  uint64_t v18 = [(ATXDefaultHomeScreenItemRanker *)self _scoreForWidget:v12 withGlobalPopularityDictionary:v10];
  uint64_t v24 = [(ATXDefaultHomeScreenItemRanker *)self _scoreForWidget:v13 withGlobalPopularityDictionary:v10];
  if (!v18) {
    goto LABEL_19;
  }
LABEL_4:
  id v12 = v28;
  if (v24)
  {
    int64_t v25 = [(id)v24 compare:v18];
LABEL_15:

    goto LABEL_16;
  }
LABEL_10:
  if (v18 | v24)
  {
    if (v18) {
      int64_t v25 = -1;
    }
    else {
      int64_t v25 = 1;
    }
    goto LABEL_15;
  }
  int64_t v25 = [(ATXDefaultHomeScreenItemRanker *)self _uniqueDaysLaunchedComparatorForWidget1:v12 widget2:v13];
LABEL_16:

  return v25;
}

- (id)_scoreForWidget:(id)a3 withGlobalPopularityDictionary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v6 avocadoDescriptor];
  unsigned int v8 = [v7 extensionBundleIdentifier];
  id v9 = [v6 avocadoDescriptor];

  unint64_t v10 = [v9 kind];
  unint64_t v11 = +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:v8 kind:v10];

  id v12 = [v5 objectForKeyedSubscript:v11];

  return v12;
}

- (double)_uniqueDaysLaunchedScoreForWidget:(id)a3
{
  id v4 = a3;
  id v5 = [v4 avocadoDescriptor];
  id v6 = [v5 extensionBundleIdentifier];
  int v7 = [v4 avocadoDescriptor];
  unsigned int v8 = [v7 kind];
  id v9 = +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:v6 kind:v8];

  unint64_t v10 = [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore objectForKeyedSubscript:v9];

  if (!v10)
  {
    unint64_t v11 = [[ATXDefaultHomeScreenItemAppLaunchScorer alloc] initWithWidget:v4 appLaunchHistogram:self->_spotlightAppLaunchHistogram];
    id v12 = [(ATXDefaultHomeScreenItemAppLaunchScorer *)v11 scoreWithCachedAppLaunchData:self->_appLaunchCounts];
    [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore setObject:v12 forKeyedSubscript:v9];
  }
  id v13 = [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore objectForKeyedSubscript:v9];
  double v14 = (double)(unint64_t)[v13 uniqueDaysLaunched];

  return v14;
}

- (double)_rawLaunchScoreForWidget:(id)a3
{
  id v4 = a3;
  id v5 = [v4 avocadoDescriptor];
  id v6 = [v5 extensionBundleIdentifier];
  int v7 = [v4 avocadoDescriptor];
  unsigned int v8 = [v7 kind];
  id v9 = +[ATXWidgetPersonality stringRepresentationForExtensionBundleId:v6 kind:v8];

  unint64_t v10 = [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore objectForKeyedSubscript:v9];

  if (!v10)
  {
    unint64_t v11 = [[ATXDefaultHomeScreenItemAppLaunchScorer alloc] initWithWidget:v4 appLaunchHistogram:self->_spotlightAppLaunchHistogram];
    id v12 = [(ATXDefaultHomeScreenItemAppLaunchScorer *)v11 scoreWithCachedAppLaunchData:self->_appLaunchCounts];
    [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore setObject:v12 forKeyedSubscript:v9];
  }
  id v13 = [(NSMutableDictionary *)self->_cachedWidgetPersonalityToAppScore objectForKeyedSubscript:v9];
  double v14 = (double)(unint64_t)[v13 rawLaunchCount];

  return v14;
}

- (int64_t)_uniqueDaysLaunchedComparatorForWidget1:(id)a3 widget2:(id)a4
{
  id v6 = a4;
  [(ATXDefaultHomeScreenItemRanker *)self _uniqueDaysLaunchedScoreForWidget:a3];
  double v8 = v7;
  [(ATXDefaultHomeScreenItemRanker *)self _uniqueDaysLaunchedScoreForWidget:v6];
  double v10 = v9;

  int64_t v11 = -1;
  if (v8 <= v10) {
    int64_t v11 = 1;
  }
  if (v8 == v10) {
    return 0;
  }
  else {
    return v11;
  }
}

- (void)_sortWidgetsByRawLaunchCounts:(id)a3 shouldDownRankAlreadyInstalledWidgets:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__ATXDefaultHomeScreenItemRanker__sortWidgetsByRawLaunchCounts_shouldDownRankAlreadyInstalledWidgets___block_invoke;
  v4[3] = &unk_1E5D09B60;
  BOOL v5 = a4;
  v4[4] = self;
  [a3 sortWithOptions:16 usingComparator:v4];
}

uint64_t __102__ATXDefaultHomeScreenItemRanker__sortWidgetsByRawLaunchCounts_shouldDownRankAlreadyInstalledWidgets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 40) || (uint64_t v7 = [(id)objc_opt_class() _downrankComparator:v5 widget2:v6]) == 0)
  {
    [*(id *)(a1 + 32) _rawLaunchScoreForWidget:v5];
    double v9 = v8;
    [*(id *)(a1 + 32) _rawLaunchScoreForWidget:v6];
    uint64_t v11 = -1;
    if (v9 <= v10) {
      uint64_t v11 = 1;
    }
    if (v9 == v10) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v11;
    }
  }

  return v7;
}

- (void)_sortWidgetsByDistinctDaysAppWasLaunched:(id)a3 shouldDownRankAlreadyInstalledWidgets:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __113__ATXDefaultHomeScreenItemRanker__sortWidgetsByDistinctDaysAppWasLaunched_shouldDownRankAlreadyInstalledWidgets___block_invoke;
  v4[3] = &unk_1E5D09B60;
  BOOL v5 = a4;
  v4[4] = self;
  [a3 sortWithOptions:16 usingComparator:v4];
}

uint64_t __113__ATXDefaultHomeScreenItemRanker__sortWidgetsByDistinctDaysAppWasLaunched_shouldDownRankAlreadyInstalledWidgets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 40) || (uint64_t v7 = [(id)objc_opt_class() _downrankComparator:v5 widget2:v6]) == 0) {
    uint64_t v7 = [*(id *)(a1 + 32) _uniqueDaysLaunchedComparatorForWidget1:v5 widget2:v6];
  }

  return v7;
}

- (void)_sortWidgets:(id)a3 byRankerPlist:(int)a4 shouldDownRankAlreadyInstalledWidgets:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  double v9 = [(ATXDefaultHomeScreenItemRanker *)self _rankerPlistToDictionary:v6];
  double v10 = [(ATXDefaultHomeScreenItemRanker *)self _timelineRelevanceAdoptionHelper:v6];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __99__ATXDefaultHomeScreenItemRanker__sortWidgets_byRankerPlist_shouldDownRankAlreadyInstalledWidgets___block_invoke;
  v13[3] = &unk_1E5D09B88;
  BOOL v16 = a5;
  v13[4] = self;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [v8 sortWithOptions:16 usingComparator:v13];
}

uint64_t __99__ATXDefaultHomeScreenItemRanker__sortWidgets_byRankerPlist_shouldDownRankAlreadyInstalledWidgets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 56) || (uint64_t v7 = [(id)objc_opt_class() _downrankComparator:v5 widget2:v6]) == 0) {
    uint64_t v7 = [*(id *)(a1 + 32) _rankerDictionaryComparator:*(void *)(a1 + 40) timelineRelevanceAdoptionHelper:*(void *)(a1 + 48) widget1:v5 widget2:v6];
  }

  return v7;
}

- (id)_timelineRelevanceAdoptionHelper:(int)a3
{
  if (a3 == 6)
  {
    id v4 = objc_opt_new();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_rankerPlistToDictionary:(int)a3
{
  if (a3 > 5) {
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)&a3;
  id v5 = self->_cachedRankerDictionary;
  if (v5
    || (+[ATXAssets2 dictionaryFromLazyPlistForClass:objc_opt_class()], id v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(), cachedRankerDictionary = self->_cachedRankerDictionary, self->_cachedRankerDictionary = v6, cachedRankerDictionary, (v5 = self->_cachedRankerDictionary) != 0))
  {
    id v8 = [(ATXDefaultHomeScreenItemRanker *)self _globalPopularityPlistStringKey:v3];
    double v9 = [(NSDictionary *)v5 objectForKeyedSubscript:v8];
    double v10 = v9;
    if (v9) {
      id v11 = v9;
    }
  }
  else
  {
LABEL_7:
    double v10 = 0;
  }

  return v10;
}

- (id)widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__ATXDefaultHomeScreenItemRanker_widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm___block_invoke;
  v6[3] = &unk_1E5D09BB0;
  v6[4] = self;
  [v4 sortWithOptions:16 usingComparator:v6];

  return v4;
}

uint64_t __86__ATXDefaultHomeScreenItemRanker_widgetsBySortingWidgetsUsingDayZeroGalleryAlgorithm___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() _downrankComparator:v5 widget2:v4];

  return v6;
}

- (id)widgetsBySortingAndFilteringWidgetsUsingPersonalizedGalleryAlgorithm:(id)a3 rankerPlistType:(int)a4 regularlyUsedThreshold:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)[a3 mutableCopy];
  double v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v10 = objc_msgSend(v8, "copy", 0);
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
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v15 rankType] == 2)
        {
          [v9 addObject:v15];
          [v8 removeObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  BOOL v16 = [(ATXDefaultHomeScreenItemRanker *)self _widgetsBySortingAndFilteringWidgets:v8 byAppLaunchAndRankerPlist:v6 regularlyUsedThreshold:a5];
  v17 = [(ATXDefaultHomeScreenItemRanker *)self _widgetsBySortingAndFilteringWidgets:v9 byAppLaunchAndRankerPlist:v6 regularlyUsedThreshold:a5];
  uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v17, "count"));
  [v16 insertObjects:v17 atIndexes:v18];

  return v16;
}

- (id)widgetsBySortingAndFilteringWidgetsUsingOnboardingStacksAlgorithm:(id)a3 algorithm:(int)a4 regularlyUsedThreshold:(double)a5
{
  id v8 = (void *)[a3 mutableCopy];
  switch(a4)
  {
    case 0:
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgetsByRawLaunchCounts:v8 shouldDownRankAlreadyInstalledWidgets:0];
      goto LABEL_4;
    case 1:
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v8 byRankerPlist:6 shouldDownRankAlreadyInstalledWidgets:0];
LABEL_4:
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgetsByDistinctDaysAppWasLaunched:v8 shouldDownRankAlreadyInstalledWidgets:0];
      goto LABEL_7;
    case 2:
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v8 byRankerPlist:6 shouldDownRankAlreadyInstalledWidgets:0];
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgetsByDistinctDaysAppWasLaunched:v8 shouldDownRankAlreadyInstalledWidgets:0];
      break;
    case 3:
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgetsByDistinctDaysAppWasLaunched:v8 shouldDownRankAlreadyInstalledWidgets:0];
      [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v8 byRankerPlist:6 shouldDownRankAlreadyInstalledWidgets:0];
LABEL_7:
      [(ATXDefaultHomeScreenItemRanker *)self _filterOutWidgetsThatAreNotRegularlyUsed:v8 regularlyUsedThreshold:a5];
      break;
    default:
      break;
  }
  [(ATXDefaultHomeScreenItemRanker *)self _filterOutWidgetsFromProtectedApps:v8];

  return v8;
}

- (void)_filterOutWidgetsFromProtectedApps:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  uint64_t v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  double v9 = (void *)[v4 initWithArray:v8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v10 = (void *)[v28 copy];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v30;
    *(void *)&long long v12 = 136315394;
    long long v27 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v10);
        }
        BOOL v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "appBundleId", v27);

        if (v17)
        {
          uint64_t v18 = [v16 appBundleId];
          int v19 = [v9 containsObject:v18];

          if (v19)
          {
            long long v20 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              long long v21 = [v16 appBundleId];
              *(_DWORD *)buf = 136315650;
              v34 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:]";
              __int16 v35 = 2112;
              v36 = v16;
              __int16 v37 = 2112;
              v38 = v21;
              _os_log_impl(&dword_1A790D000, v20, OS_LOG_TYPE_DEFAULT, "%s: filtering out widget descriptor: %@. Reason: Show on Homescreen is disabled for the parent bundleId %@", buf, 0x20u);
            }
            [v28 removeObject:v16];
          }
          long long v22 = [v16 appBundleId];
          int v23 = [v3 bundleIdIsLockedOrHiddenByUserPreference:v22];

          if (v23)
          {
            uint64_t v24 = __atxlog_handle_home_screen();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = [v16 appBundleId];
              *(_DWORD *)buf = 136315650;
              v34 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:]";
              __int16 v35 = 2112;
              v36 = v16;
              __int16 v37 = 2112;
              v38 = v25;
              _os_log_impl(&dword_1A790D000, v24, OS_LOG_TYPE_DEFAULT, "%s: filtering out widget descriptor: %@. Reason: the parent bundleId %@ is locked or hidden by user preference", buf, 0x20u);
            }
            [v28 removeObject:v16];
          }
        }
        else
        {
          v26 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v27;
            v34 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsFromProtectedApps:]";
            __int16 v35 = 2112;
            v36 = v16;
            _os_log_impl(&dword_1A790D000, v26, OS_LOG_TYPE_DEFAULT, "%s: No parent bundleId for Widget descriptor: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v13);
  }
}

- (void)_filterOutWidgetsThatAreNotRegularlyUsed:(id)a3 regularlyUsedThreshold:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = (void *)[v6 copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v19;
    *(void *)&long long v9 = 136315650;
    long long v17 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        -[ATXDefaultHomeScreenItemRanker _uniqueDaysLaunchedScoreForWidget:](self, "_uniqueDaysLaunchedScoreForWidget:", v13, v17);
        if (v14 < a4)
        {
          double v15 = v14;
          BOOL v16 = __atxlog_handle_home_screen();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            int v23 = "-[ATXDefaultHomeScreenItemRanker _filterOutWidgetsThatAreNotRegularlyUsed:regularlyUsedThreshold:]";
            __int16 v24 = 2048;
            double v25 = v15;
            __int16 v26 = 2112;
            uint64_t v27 = v13;
            _os_log_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEFAULT, "%s: filtering out 3P widget because it is not regularly used (days launched: %f): %@", buf, 0x20u);
          }

          [v6 removeObject:v13];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v10);
  }
}

- (void)_filterOutWidgetsNotFromTopLaunchedApps:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __74__ATXDefaultHomeScreenItemRanker__filterOutWidgetsNotFromTopLaunchedApps___block_invoke;
  uint64_t v11 = &unk_1E5D09BD8;
  id v5 = v4;
  id v12 = v5;
  uint64_t v13 = &v14;
  [v3 enumerateObjectsUsingBlock:&v8];
  uint64_t v6 = v15[3];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(v3, "count", v8, v9, v10, v11);
    objc_msgSend(v3, "removeObjectsInRange:", v6, v7 - v15[3]);
  }

  _Block_object_dispose(&v14, 8);
}

void __74__ATXDefaultHomeScreenItemRanker__filterOutWidgetsNotFromTopLaunchedApps___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = [v10 appBundleId];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v10 appBundleId];
    [v8 addObject:v9];
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 0x15)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

+ (void)filterOutDuplicateWidgetsFromSameAppBundleId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "copy", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 appBundleId];

        if (v11)
        {
          id v12 = [v10 appBundleId];
          int v13 = [v4 containsObject:v12];

          if (v13)
          {
            [v3 removeObject:v10];
          }
          else
          {
            uint64_t v14 = [v10 appBundleId];
            [v4 addObject:v14];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)_widgetsBySortingAndFilteringWidgets:(id)a3 byAppLaunchAndRankerPlist:(int)a4 regularlyUsedThreshold:(double)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  id v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * v16);
        char v18 = [(id)objc_opt_class() _shouldDownrankWidget:v17];
        long long v19 = v11;
        if (v18) {
          goto LABEL_7;
        }
        unint64_t v20 = [(ATXDefaultHomeScreenItemRanker *)self _appUsageFrequencyForWidget:v17 regularlyUsedThreshold:a5];
        if (!v20)
        {
          long long v19 = v10;
LABEL_7:
          [v19 addObject:v17];
          goto LABEL_8;
        }
        unint64_t v21 = v20;
        long long v19 = v8;
        if (v21 == 2) {
          goto LABEL_7;
        }
        long long v19 = v9;
        if (v21 == 1) {
          goto LABEL_7;
        }
LABEL_8:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v22 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v14 = v22;
    }
    while (v22);
  }

  [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v8 byRankerPlist:a4 shouldDownRankAlreadyInstalledWidgets:1];
  [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v9 byRankerPlist:a4 shouldDownRankAlreadyInstalledWidgets:1];
  [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v10 byRankerPlist:a4 shouldDownRankAlreadyInstalledWidgets:1];
  [(ATXDefaultHomeScreenItemRanker *)self _sortWidgets:v11 byRankerPlist:a4 shouldDownRankAlreadyInstalledWidgets:1];
  int v23 = [v8 arrayByAddingObjectsFromArray:v9];
  __int16 v24 = [v23 arrayByAddingObjectsFromArray:v10];
  double v25 = [v24 arrayByAddingObjectsFromArray:v11];
  __int16 v26 = (void *)[v25 mutableCopy];

  [(id)objc_opt_class() filterOutDuplicateWidgetsFromSameAppBundleId:v26];
  [(ATXDefaultHomeScreenItemRanker *)self _filterOutWidgetsFromProtectedApps:v26];

  return v26;
}

- (unint64_t)_appUsageFrequencyForWidget:(id)a3 regularlyUsedThreshold:(double)a4
{
  [(ATXDefaultHomeScreenItemRanker *)self _uniqueDaysLaunchedScoreForWidget:a3];
  if (v5 >= a4) {
    return 2;
  }
  else {
    return v5 >= 1.0;
  }
}

- (id)_globalPopularityPlistStringKey:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_1E5D09BF8[a3];
  }
}

+ (id)stringForAlgorithmType:(int)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5D09C28[a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLaunchCounts, 0);
  objc_storeStrong((id *)&self->_spotlightAppLaunchHistogram, 0);
  objc_storeStrong((id *)&self->_cachedRankerDictionary, 0);

  objc_storeStrong((id *)&self->_cachedWidgetPersonalityToAppScore, 0);
}

- (void)_rankerDictionaryComparator:(os_log_t)log timelineRelevanceAdoptionHelper:widget1:widget2:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXDefaultHomeScreenItemRanker _rankerDictionaryComparator:timelineRelevanceAdoptionHelper:widget1:widget2:]";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: please pass in either a non-nil ranker dictionary or non-nil timeline relevance adoption helper", (uint8_t *)&v1, 0xCu);
}

@end