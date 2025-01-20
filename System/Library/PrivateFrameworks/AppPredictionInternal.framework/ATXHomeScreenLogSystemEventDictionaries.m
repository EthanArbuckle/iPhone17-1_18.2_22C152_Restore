@interface ATXHomeScreenLogSystemEventDictionaries
+ (id)_suggestionReasonToWidgetEventDictionariesProactiveWidgetRotationsKey:(int)a3;
+ (id)systemLevelDictionaryAccumulatorKeys;
+ (id)systemLevelDictionaryAccumulatorSplitByLocationKeys;
- (ATXHomeScreenLogSystemEventDictionaries)init;
- (id)_createNewSystemLevelDictionary;
- (id)_getOnboardingResultStringAndUpdateStackRemovedDateIfNeededWithDefaults:(id)a3;
- (id)dryRunResult;
- (void)_addKey:(id)a3 splitByLocation:(unint64_t)a4 toAggregateKey:(id)a5;
- (void)_populateSystemLevelDictionaryWithWidgetCohortAdoptionMetrics:(id)a3;
- (void)populateHasBehavioralData;
- (void)populateLifetimeNPlusOneStatistics;
- (void)populateUnlockSessionEngagementSummaryFromManager:(id)a3;
- (void)populateUsedKettle;
- (void)sendToCoreAnalytics;
- (void)updateNPlusOneLifetimeMetricsWithRotationSession:(id)a3;
- (void)updateSystemLevelSummaryForHomeScreenEvent:(id)a3;
- (void)updateSystemLevelSummaryForHomeScreenPages:(id)a3 startDate:(id)a4;
- (void)updateSystemLevelSummaryForWidgetPseudoTapWithStackShownEvent:(id)a3;
- (void)updateSystemLevelSummaryTotalUnlockSessions:(unint64_t)a3;
- (void)updateSystemLevelSummaryWithRotationSession:(id)a3;
- (void)updateSystemLevelUnlockSessionsWithWidgetDwell:(id)a3;
@end

@implementation ATXHomeScreenLogSystemEventDictionaries

- (ATXHomeScreenLogSystemEventDictionaries)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXHomeScreenLogSystemEventDictionaries;
  v2 = [(ATXHomeScreenLogSystemEventDictionaries *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    unique3PWidgetsOnHS = v2->_unique3PWidgetsOnHS;
    v2->_unique3PWidgetsOnHS = (NSMutableSet *)v3;

    uint64_t v5 = [(ATXHomeScreenLogSystemEventDictionaries *)v2 _createNewSystemLevelDictionary];
    systemLevelEventDictionary = v2->_systemLevelEventDictionary;
    v2->_systemLevelEventDictionary = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)systemLevelDictionaryAccumulatorKeys
{
  if (systemLevelDictionaryAccumulatorKeys_onceToken != -1) {
    dispatch_once(&systemLevelDictionaryAccumulatorKeys_onceToken, &__block_literal_global_77);
  }
  v2 = (void *)systemLevelDictionaryAccumulatorKeys_array;
  return v2;
}

void __79__ATXHomeScreenLogSystemEventDictionaries_systemLevelDictionaryAccumulatorKeys__block_invoke()
{
  v2[13] = *MEMORY[0x1E4F143B8];
  v2[0] = @"MeanWidgetsPerStack";
  v2[1] = @"NumberOfFirstPartyWidgets";
  v2[2] = @"NumberOfThirdPartyWidgets";
  v2[3] = @"NumberOfLockUnlockSessions";
  v2[4] = @"NumberOfLockUnlockSessionsWithWidgetDwell";
  v2[5] = @"NumberOfProactiveWidgetRotationsDueToShortcutConversion";
  v2[6] = @"NumberOfProactiveWidgetRotationsDueToWidgetHeuristic";
  v2[7] = @"NumberOfProactiveWidgetRotationsDueToStalenessRotation";
  v2[8] = @"NumberOfProactiveWidgetRotationsDueToTimelineDonationNonStaleness";
  v2[9] = @"NumberOfProactiveWidgetRotationsDueToTimelineDonationStaleness";
  v2[10] = @"NumberOfProactiveWidgetRotationsDueToSuggestionWidget";
  v2[11] = @"NumberOfProactiveWidgetRotationsDueToOtherReasons";
  v2[12] = @"NumberOfHomeScreenPages";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:13];
  v1 = (void *)systemLevelDictionaryAccumulatorKeys_array;
  systemLevelDictionaryAccumulatorKeys_array = v0;
}

+ (id)systemLevelDictionaryAccumulatorSplitByLocationKeys
{
  if (systemLevelDictionaryAccumulatorSplitByLocationKeys_onceToken != -1) {
    dispatch_once(&systemLevelDictionaryAccumulatorSplitByLocationKeys_onceToken, &__block_literal_global_207_0);
  }
  v2 = (void *)systemLevelDictionaryAccumulatorSplitByLocationKeys_array;
  return v2;
}

void __94__ATXHomeScreenLogSystemEventDictionaries_systemLevelDictionaryAccumulatorSplitByLocationKeys__block_invoke()
{
  v2[22] = *MEMORY[0x1E4F143B8];
  v2[0] = @"NumberOfSmartStacksOn";
  v2[1] = @"NumberOfDegenerateSmartStacksOn";
  v2[2] = @"NumberOfRegularStacksOn";
  v2[3] = @"NumberOfPinnedWidgetsOn";
  v2[4] = @"NumberOfUserScrollsOn";
  v2[5] = @"NumberOfUserScrollPseudoTappedRotationsOn";
  v2[6] = @"NumberOfUserScrollTappedRotationsOn";
  v2[7] = @"NumberOfUserScrollFinalOutcomePseudoTappedOn";
  v2[8] = @"NumberOfProactiveRotationsOn";
  v2[9] = @"NumberOfProactiveViewedRotationsOn";
  v2[10] = @"NumberOfProactivePseudoTappedRotationsOn";
  v2[11] = @"NumberOfProactiveTappedRotationsOn";
  v2[12] = @"NumberOfProactiveViewsOn";
  v2[13] = @"NumberOfProactivePseudoTapsOn";
  void v2[14] = @"NumberOfProactiveTapsByLocationOn";
  v2[15] = @"NumberOfViewsForStackWidgetsOn";
  v2[16] = @"NumberOfPseudoTapsForStackWidgetsOn";
  v2[17] = @"NumberOfTapsForStackWidgetsOn";
  v2[18] = @"NumberOfViewsForPinnedWidgetsOn";
  v2[19] = @"NumberOfPseudoTapsForPinnedWidgetsOn";
  v2[20] = @"NumberOfTapsForPinnedWidgetsOn";
  v2[21] = @"NumberOfLockUnlockSessionsWithWidgetDwellOn";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:22];
  v1 = (void *)systemLevelDictionaryAccumulatorSplitByLocationKeys_array;
  systemLevelDictionaryAccumulatorSplitByLocationKeys_array = v0;
}

- (id)_createNewSystemLevelDictionary
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  v4 = +[ATXHomeScreenLogUploaderUtilities abGroup];
  [v3 setObject:v4 forKeyedSubscript:@"ABGroup"];

  [(ATXHomeScreenLogSystemEventDictionaries *)self _populateSystemLevelDictionaryWithWidgetCohortAdoptionMetrics:v3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [(id)objc_opt_class() systemLevelDictionaryAccumulatorKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 setObject:&unk_1F27F0CA8 forKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v10 = objc_msgSend((id)objc_opt_class(), "systemLevelDictionaryAccumulatorSplitByLocationKeys", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = 0;
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
        do
        {
          v17 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v16 withLocation:v15];
          [v3 setObject:&unk_1F27F0CA8 forKeyedSubscript:v17];

          ++v15;
        }
        while (v15 != 6);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }

  return v3;
}

- (id)_getOnboardingResultStringAndUpdateStackRemovedDateIfNeededWithDefaults:(id)a3
{
  id v3 = a3;
  if (![v3 BOOLForKey:*MEMORY[0x1E4F4B6F8]])
  {
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F4B078]);
  uint64_t v5 = [v4 numOnboardingStacksOnTheHomeScreen];

  if (v5 == 1)
  {
    uint64_t v11 = [v3 stringForKey:*MEMORY[0x1E4F4B720]];
    v10 = v11;
    uint64_t v12 = @"_One";
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = *MEMORY[0x1E4F4B698];
      uint64_t v7 = [v3 objectForKey:*MEMORY[0x1E4F4B698]];
      uint64_t v8 = @"rejected";
      char v9 = [v7 isEqualToString:@"rejected"];

      if (v9) {
        goto LABEL_11;
      }
      [v3 setObject:@"rejected" forKey:v6];
      v10 = [MEMORY[0x1E4F1C9C8] now];
      [v3 setObject:v10 forKey:*MEMORY[0x1E4F4B718]];
      goto LABEL_10;
    }
    uint64_t v11 = [v3 stringForKey:*MEMORY[0x1E4F4B720]];
    v10 = v11;
    uint64_t v12 = @"_Multiple";
  }
  uint64_t v8 = [v11 stringByAppendingString:v12];
LABEL_10:

LABEL_11:
  return v8;
}

- (void)_populateSystemLevelDictionaryWithWidgetCohortAdoptionMetrics:(id)a3
{
  id v26 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CB18]);
  uint64_t v5 = (void *)[v4 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F4B700]];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F4B6A0]];
  uint64_t v8 = [v5 objectForKey:*MEMORY[0x1E4F4B718]];
  char v9 = objc_opt_new();
  v10 = v9;
  if (!v6)
  {
    [v26 setObject:0 forKeyedSubscript:@"skyUpdateDate"];
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    [v26 setObject:0 forKeyedSubscript:@"becameActiveDate"];
    goto LABEL_6;
  }
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v9 reduceGranularityToWeekOfYear:v6];
  [v12 timeIntervalSinceReferenceDate];
  uint64_t v13 = objc_msgSend(v11, "numberWithDouble:");
  [v26 setObject:v13 forKeyedSubscript:@"skyUpdateDate"];

  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  v14 = NSNumber;
  uint64_t v15 = [v10 reduceGranularityToWeekOfYear:v7];
  [v15 timeIntervalSinceReferenceDate];
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
  [v26 setObject:v16 forKeyedSubscript:@"becameActiveDate"];

LABEL_6:
  v17 = [(ATXHomeScreenLogSystemEventDictionaries *)self _getOnboardingResultStringAndUpdateStackRemovedDateIfNeededWithDefaults:v5];
  [v26 setObject:v17 forKeyedSubscript:@"onboardingResult"];

  if (v6 && v8)
  {
    v18 = NSNumber;
    [v10 convertDate:v8 toDeltaFromSkyUpdateDate:v6];
    long long v19 = objc_msgSend(v18, "numberWithDouble:");
    [v26 setObject:v19 forKeyedSubscript:@"dateRemovedOnboardingStacks"];
  }
  else
  {
    [v26 setObject:0 forKeyedSubscript:@"dateRemovedOnboardingStacks"];
  }
  long long v20 = [v5 objectForKey:*MEMORY[0x1E4F4B698]];
  [v26 setObject:v20 forKeyedSubscript:@"azulUsageStatus"];

  long long v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E4F4B6F8]));
  [v26 setObject:v21 forKeyedSubscript:@"sawOnboarding"];

  long long v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E4F4B728]));
  [v26 setObject:v22 forKeyedSubscript:@"onboardingWasPersonalized"];

  if ([v5 BOOLForKey:*MEMORY[0x1E4F4B6A8]])
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F4B078]);
    int v24 = [v23 hasWidgetsOnTheHomeScreen];

    if (v24) {
      long long v25 = @"active";
    }
    else {
      long long v25 = @"abandoned";
    }
  }
  else
  {
    long long v25 = @"neverUsed";
  }
  [v26 setObject:v25 forKeyedSubscript:@"currentUsageStatus"];
}

- (void)sendToCoreAnalytics
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    systemLevelEventDictionary = self->_systemLevelEventDictionary;
    int v7 = 138412290;
    uint64_t v8 = systemLevelEventDictionary;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: System level dictionary: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unlockSessionEngagementDictionary = self->_unlockSessionEngagementDictionary;
    int v7 = 138412290;
    uint64_t v8 = unlockSessionEngagementDictionary;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "ATXHomeScreenLogUploader: Engagement summary dictionary: %@", (uint8_t *)&v7, 0xCu);
  }

  AnalyticsSendEvent();
  AnalyticsSendEvent();
}

- (id)dryRunResult
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"System Level Dictionary";
  v5[1] = @"Engagement Summary Dictionary";
  unlockSessionEngagementDictionary = self->_unlockSessionEngagementDictionary;
  v6[0] = self->_systemLevelEventDictionary;
  v6[1] = unlockSessionEngagementDictionary;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)populateUnlockSessionEngagementSummaryFromManager:(id)a3
{
  id v4 = [a3 summarizeCompletedSessions];
  uint64_t v5 = (NSMutableDictionary *)[v4 mutableCopy];
  unlockSessionEngagementDictionary = self->_unlockSessionEngagementDictionary;
  self->_unlockSessionEngagementDictionary = v5;

  int v7 = [(NSMutableDictionary *)self->_systemLevelEventDictionary objectForKeyedSubscript:@"NumberOfLockUnlockSessionsWithWidgetDwell"];
  [(NSMutableDictionary *)self->_unlockSessionEngagementDictionary setObject:v7 forKeyedSubscript:@"NumberOfLockUnlockSessionsWithWidgetDwell"];

  id v8 = +[ATXHomeScreenLogUploaderUtilities abGroup];
  [(NSMutableDictionary *)self->_unlockSessionEngagementDictionary setObject:v8 forKeyedSubscript:@"ABGroup"];
}

- (void)updateSystemLevelSummaryTotalUnlockSessions:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v4 forKeyedSubscript:@"NumberOfLockUnlockSessions"];
}

- (void)updateSystemLevelUnlockSessionsWithWidgetDwell:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17 = self;
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:self->_systemLevelEventDictionary forKey:@"NumberOfLockUnlockSessionsWithWidgetDwell"];
  uint64_t v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * v10) stackLocation];
        uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
        char v13 = [v5 containsObject:v12];

        if ((v13 & 1) == 0)
        {
          systemLevelEventDictionary = v17->_systemLevelEventDictionary;
          uint64_t v15 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:@"NumberOfLockUnlockSessionsWithWidgetDwellOn" withLocation:v11];
          +[ATXHomeScreenLogUploaderUtilities incrementDictionary:systemLevelEventDictionary forKey:v15];

          uint64_t v16 = [NSNumber numberWithUnsignedInteger:v11];
          [v5 addObject:v16];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
}

- (void)updateSystemLevelSummaryForHomeScreenEvent:(id)a3
{
  id v9 = a3;
  if ([v9 stackKind] == 1)
  {
    id v4 = [v9 eventTypeString];
    if (([v4 isEqualToString:@"Unknown"] & 1) == 0
      && ([v4 isEqualToString:@"HomeScreenPageShown"] & 1) == 0
      && ([v4 isEqualToString:@"HomeScreenDisappeared"] & 1) == 0
      && ([v4 isEqualToString:@"StackChanged"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"WidgetTapped"])
      {

        uint64_t v5 = [v9 stackLocation];
        systemLevelEventDictionary = self->_systemLevelEventDictionary;
        uint64_t v7 = @"NumberOfTapsForPinnedWidgetsOn";
LABEL_8:
        uint64_t v8 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v7 withLocation:v5];
        +[ATXHomeScreenLogUploaderUtilities incrementDictionary:systemLevelEventDictionary forKey:v8];

        goto LABEL_29;
      }
      if (([v4 isEqualToString:@"WidgetLongLook"] & 1) == 0
        && ([v4 isEqualToString:@"WidgetUserFeedback"] & 1) == 0
        && ([v4 isEqualToString:@"UserStackConfigChanged"] & 1) == 0
        && ([v4 isEqualToString:@"DeviceLocked"] & 1) == 0
        && ([v4 isEqualToString:@"DeviceUnlocked"] & 1) == 0
        && ([v4 isEqualToString:@"PinnedWidgetAdded"] & 1) == 0
        && ([v4 isEqualToString:@"PinnedWidgetDeleted"] & 1) == 0
        && ([v4 isEqualToString:@"SpecialPageAppeared"] & 1) == 0
        && ([v4 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0)
      {
        if ([v4 isEqualToString:@"StackShown"])
        {

          uint64_t v5 = [v9 stackLocation];
          systemLevelEventDictionary = self->_systemLevelEventDictionary;
          uint64_t v7 = @"NumberOfViewsForPinnedWidgetsOn";
          goto LABEL_8;
        }
        if (([v4 isEqualToString:@"StackDisappeared"] & 1) == 0
          && ([v4 isEqualToString:@"StackCreated"] & 1) == 0
          && ([v4 isEqualToString:@"StackDeleted"] & 1) == 0
          && ([v4 isEqualToString:@"WidgetAddedToStack"] & 1) == 0
          && ([v4 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0
          && ([v4 isEqualToString:@"StackVisibilityChanged"] & 1) == 0
          && ([v4 isEqualToString:@"AppAdded"] & 1) == 0)
        {
          [v4 isEqualToString:@"AppRemoved"];
        }
      }
    }

    [v9 stackLocation];
  }
LABEL_29:
}

- (void)updateSystemLevelSummaryForHomeScreenPages:(id)a3 startDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(ATXDegenerateStackAnalyzer);
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryForHomeScreenPages_startDate___block_invoke;
  v13[3] = &unk_1E68AFAB0;
  v13[4] = self;
  uint64_t v16 = &v22;
  v17 = &v18;
  id v9 = v8;
  v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [v6 enumerateObjectsUsingBlock:v13];
  unint64_t v11 = v23[3];
  if (v11)
  {
    uint64_t v12 = [NSNumber numberWithDouble:(double)(unint64_t)v19[3] / (double)v11];
    [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v12 forKeyedSubscript:@"MeanWidgetsPerStack"];
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __96__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryForHomeScreenPages_startDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v42 = a2;
  uint64_t v3 = ATXStackLocationForPageAndIndex();
  id v4 = off_1E68A9000;
  if (ATXStackLocationIsHomeScreen()) {
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"NumberOfHomeScreenPages"];
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v5 = v42;
  id v6 = objc_msgSend(v42, "stacks", v42);
  id v7 = [v5 panels];
  uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

  obuint64_t j = v8;
  uint64_t v46 = [v8 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v54;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v54 != v45) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v53 + 1) + 8 * v9);
        unint64_t v11 = [v10 widgets];
        uint64_t v12 = [v11 count];

        uint64_t v47 = v9;
        if (v12 == 1)
        {
          char v13 = v4[35];
          uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
          id v15 = v13;
          uint64_t v16 = @"NumberOfPinnedWidgetsOn";
        }
        else
        {
          ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          uint64_t v20 = [v10 widgets];
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v20 count];

          int v21 = [v10 allowsSmartRotate];
          uint64_t v22 = v4[35];
          uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
          if (!v21)
          {
            v17 = [(__objc2_class *)v4[35] keyByConcatenatingAccumulatorKey:@"NumberOfRegularStacksOn" withLocation:v3];
            uint64_t v18 = v22;
            uint64_t v19 = v23;
            goto LABEL_15;
          }
          uint64_t v24 = [(__objc2_class *)v4[35] keyByConcatenatingAccumulatorKey:@"NumberOfSmartStacksOn" withLocation:v3];
          [(__objc2_class *)v22 incrementDictionary:v23 forKey:v24];

          if (![*(id *)(a1 + 40) isSmartStackPossiblyDegenerate:v10 onPage:v43 usingTimelineEntriesSinceDate:*(void *)(a1 + 48)])goto LABEL_16; {
          char v13 = v4[35];
          }
          uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
          id v15 = v13;
          uint64_t v16 = @"NumberOfDegenerateSmartStacksOn";
        }
        v17 = [(__objc2_class *)v15 keyByConcatenatingAccumulatorKey:v16 withLocation:v3];
        uint64_t v18 = v13;
        uint64_t v19 = v14;
LABEL_15:
        [(__objc2_class *)v18 incrementDictionary:v19 forKey:v17];

LABEL_16:
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v48 = [v10 widgets];
        uint64_t v25 = [v48 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v50 != v27) {
                objc_enumerationMutation(v48);
              }
              uint64_t v29 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              v30 = v4[35];
              v31 = [v29 extensionBundleId];
              LOBYTE(v30) = [(__objc2_class *)v30 isFirstPartyApp:v31];

              v32 = @"NumberOfFirstPartyWidgets";
              if ((v30 & 1) == 0)
              {
                int IsHomeScreen = ATXStackLocationIsHomeScreen();
                v32 = @"NumberOfThirdPartyWidgets";
                if (IsHomeScreen)
                {
                  v34 = *(void **)(*(void *)(a1 + 32) + 24);
                  v35 = (void *)MEMORY[0x1E4F4B440];
                  [v29 extensionBundleId];
                  v36 = v4;
                  v38 = uint64_t v37 = v3;
                  v39 = [v29 widgetKind];
                  v40 = [v35 stringRepresentationForExtensionBundleId:v38 kind:v39];
                  [v34 addObject:v40];

                  uint64_t v3 = v37;
                  id v4 = v36;
                  v41 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
                  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v41 forKeyedSubscript:@"Num3PWidgetsOnHS"];

                  v32 = @"NumberOfThirdPartyWidgets";
                }
              }
              [(__objc2_class *)v4[35] incrementDictionary:*(void *)(*(void *)(a1 + 32) + 8) forKey:v32];
            }
            uint64_t v26 = [v48 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v26);
        }

        uint64_t v9 = v47 + 1;
      }
      while (v47 + 1 != v46);
      uint64_t v46 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v46);
  }
}

- (void)updateNPlusOneLifetimeMetricsWithRotationSession:(id)a3
{
  id v6 = a3;
  if ([v6 engagementStatus] == 5)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v4 = *MEMORY[0x1E4F4B688];
    uint64_t v5 = (void *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", @"LifetimeNPlusOnesDismissed") + 1, @"LifetimeNPlusOnesDismissed");
    if ([v6 engagementStatus] != 6) {
      goto LABEL_9;
    }
    if (v5)
    {
LABEL_8:
      objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", @"LifetimeNPlusOnesNeverShown") + 1, @"LifetimeNPlusOnesNeverShown");
LABEL_9:
      if ([v6 engagementStatus] != 7) {
        goto LABEL_17;
      }
      if (v5) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
LABEL_7:
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v4];
    goto LABEL_8;
  }
  if ([v6 engagementStatus] == 6)
  {
    uint64_t v4 = *MEMORY[0x1E4F4B688];
    goto LABEL_7;
  }
  if ([v6 engagementStatus] == 7)
  {
    uint64_t v4 = *MEMORY[0x1E4F4B688];
LABEL_14:
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v4];
LABEL_15:
    objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(v5, "integerForKey:", @"LifetimeNPlusOnesAddedToStack") + 1, @"LifetimeNPlusOnesAddedToStack");
    goto LABEL_17;
  }
  uint64_t v5 = 0;
LABEL_17:
}

- (void)populateLifetimeNPlusOneStatistics
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v7 = (id)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerForKey:", @"LifetimeNPlusOnesDismissed"));
  [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v4 forKeyedSubscript:@"LifetimeNPlusOnesDismissed"];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerForKey:", @"LifetimeNPlusOnesNeverShown"));
  [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v5 forKeyedSubscript:@"LifetimeNPlusOnesNeverShown"];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerForKey:", @"LifetimeNPlusOnesAddedToStack"));
  [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v6 forKeyedSubscript:@"LifetimeNPlusOnesAddedToStack"];
}

- (void)updateSystemLevelSummaryWithRotationSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 startingStackChangeEvent];
  uint64_t v6 = [v5 stackLocation];

  BOOL v7 = +[ATXHomeScreenLogUploaderUtilities isRotationSessionDueToProactive:v4];
  BOOL v8 = +[ATXHomeScreenLogUploaderUtilities isRotationSessionDueToUserScroll:v4];
  BOOL v21 = v8;
  if (v7)
  {
    systemLevelEventDictionary = self->_systemLevelEventDictionary;
    id v10 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:@"NumberOfProactiveRotationsOn" withLocation:v6];
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:systemLevelEventDictionary forKey:v10];

    unint64_t v11 = objc_opt_class();
    uint64_t v12 = [v4 systemSuggestSuggestionLayout];
    char v13 = objc_msgSend(v11, "_suggestionReasonToWidgetEventDictionariesProactiveWidgetRotationsKey:", +[ATXHomeScreenLogUploaderUtilities suggestionReasonForSuggestionLayout:](ATXHomeScreenLogUploaderUtilities, "suggestionReasonForSuggestionLayout:", v12));

    uint64_t v14 = self->_systemLevelEventDictionary;
  }
  else
  {
    if (!v8) {
      goto LABEL_6;
    }
    id v15 = self->_systemLevelEventDictionary;
    char v13 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:@"NumberOfUserScrollsOn" withLocation:v6];
    uint64_t v14 = v15;
  }
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v14 forKey:v13];

LABEL_6:
  if ([v4 isNPlusOneRotation]) {
    [(ATXHomeScreenLogSystemEventDictionaries *)self updateNPlusOneLifetimeMetricsWithRotationSession:v4];
  }
  uint64_t v16 = +[ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker keyTrackerForRotationSessionStackEngagementStatus:](ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker, "keyTrackerForRotationSessionStackEngagementStatus:", [v4 engagementStatus]);
  v17 = self->_systemLevelEventDictionary;
  uint64_t v18 = [v16 userScrollFinalOutcomeKey];
  uint64_t v19 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v18 withLocation:v6];
  +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v17 forKey:v19];

  uint64_t v20 = +[ATXHomeScreenLogUploaderUtilities countsForRotationEngagementStatusHistory:v4];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryWithRotationSession___block_invoke;
  v22[3] = &unk_1E68AFAD8;
  v22[4] = self;
  v22[5] = v6;
  BOOL v23 = v7;
  BOOL v24 = v21;
  [v20 enumerateKeysAndObjectsUsingBlock:v22];
}

void __87__ATXHomeScreenLogSystemEventDictionaries_updateSystemLevelSummaryWithRotationSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntValue];
  unsigned int v7 = [v5 unsignedIntValue];

  BOOL v8 = +[ATXHomeScreenLogSystemEventRotationSessionEngagementKeyTracker keyTrackerForRotationSessionStackEngagementStatus:v6];
  if (v8) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v20 = v8;
    unint64_t v11 = [v8 statusAggregationKey];
    uint64_t v12 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v11 withLocation:*(void *)(a1 + 40)];
    +[ATXHomeScreenLogUploaderUtilities add:v7 toDictionary:v10 forKey:v12];

    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = [v20 proactiveStatusAggregationKey];
      id v15 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v14 withLocation:*(void *)(a1 + 40)];
      +[ATXHomeScreenLogUploaderUtilities add:v7 toDictionary:v13 forKey:v15];

      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v17 = [v20 proactiveStatusBooleanKey];
    }
    else
    {
      BOOL v8 = v20;
      if (!*(unsigned char *)(a1 + 49)) {
        goto LABEL_10;
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v17 = [v20 userScrollStatusBooleanKey];
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:v17 withLocation:*(void *)(a1 + 40)];
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:v16 forKey:v19];

    BOOL v8 = v20;
  }
LABEL_10:
}

- (void)updateSystemLevelSummaryForWidgetPseudoTapWithStackShownEvent:(id)a3
{
  id v7 = a3;
  if ([v7 stackKind] == 1)
  {
    uint64_t v4 = [v7 stackLocation];
    systemLevelEventDictionary = self->_systemLevelEventDictionary;
    uint64_t v6 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:@"NumberOfPseudoTapsForPinnedWidgetsOn" withLocation:v4];
    +[ATXHomeScreenLogUploaderUtilities incrementDictionary:systemLevelEventDictionary forKey:v6];
  }
}

+ (id)_suggestionReasonToWidgetEventDictionariesProactiveWidgetRotationsKey:(int)a3
{
  if ((a3 - 1) > 7) {
    return @"NumberOfProactiveWidgetRotationsDueToStalenessRotation";
  }
  else {
    return off_1E68AFAF8[a3 - 1];
  }
}

- (void)_addKey:(id)a3 splitByLocation:(unint64_t)a4 toAggregateKey:(id)a5
{
  systemLevelEventDictionary = self->_systemLevelEventDictionary;
  id v9 = a5;
  uint64_t v10 = +[ATXHomeScreenLogUploaderUtilities keyByConcatenatingAccumulatorKey:a3 withLocation:a4];
  id v11 = [(NSMutableDictionary *)systemLevelEventDictionary objectForKeyedSubscript:v10];

  +[ATXHomeScreenLogUploaderUtilities add:toDictionary:forKey:](ATXHomeScreenLogUploaderUtilities, "add:toDictionary:forKey:", [v11 unsignedIntValue], self->_systemLevelEventDictionary, v9);
}

- (void)populateHasBehavioralData
{
  id v3 = NSNumber;
  id v6 = (id)objc_opt_new();
  [v6 uniqueAppsLaunchedOverLast28Days];
  id v5 = [v3 numberWithInt:v4 > 15.0];
  [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v5 forKeyedSubscript:@"HasBehavioralData"];
}

- (void)populateUsedKettle
{
  id v3 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  double v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  id v6 = [v4 dateByAddingUnit:16 value:-28 toDate:v5 options:0];

  id v7 = BiomeLibrary();
  BOOL v8 = [v7 UserFocus];
  id v9 = [v8 ComputedMode];
  uint64_t v10 = objc_msgSend(v9, "atx_publisherFromStartDate:", v6);

  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__ATXHomeScreenLogSystemEventDictionaries_populateUsedKettle__block_invoke_2;
  v13[3] = &unk_1E68AC8E8;
  v13[4] = &v14;
  id v11 = (id)[v10 sinkWithCompletion:&__block_literal_global_250 shouldContinue:v13];
  uint64_t v12 = [NSNumber numberWithBool:*((unsigned __int8 *)v15 + 24)];
  [(NSMutableDictionary *)self->_systemLevelEventDictionary setObject:v12 forKeyedSubscript:@"UsedKettle"];

  _Block_object_dispose(&v14, 8);
}

uint64_t __61__ATXHomeScreenLogSystemEventDictionaries_populateUsedKettle__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  if ([v3 semanticType] == 2 || !objc_msgSend(v3, "updateReason"))
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = 1;
    if ([v3 updateSource])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unique3PWidgetsOnHS, 0);
  objc_storeStrong((id *)&self->_unlockSessionEngagementDictionary, 0);
  objc_storeStrong((id *)&self->_systemLevelEventDictionary, 0);
}

@end