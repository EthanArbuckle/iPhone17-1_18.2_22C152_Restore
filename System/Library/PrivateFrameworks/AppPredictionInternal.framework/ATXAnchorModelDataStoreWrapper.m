@interface ATXAnchorModelDataStoreWrapper
+ (id)actionCandidateFeaturesFromActionEvent:(id)a3 actionMetadata:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6;
+ (id)actionDetailsFromActionCandidateId:(id)a3;
+ (id)actionKeyFromActionCandidateId:(id)a3;
+ (id)anchorFeaturesForAnchorOccurrence:(id)a3 anchor:(id)a4 anchorMetadata:(id)a5;
+ (id)appCandidateFeaturesFromAppLaunchEvent:(id)a3 appMetadata:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6;
+ (id)candidateIdFromAppIntentDuetEvent:(id)a3;
+ (id)candidateIdFromAppLaunchBiomeEvent:(id)a3;
+ (id)candidateIdFromAppLaunchDuetEvent:(id)a3;
+ (id)candidateIdFromBiomeEvent:(id)a3;
+ (id)candidateIdFromLinkActionBiomeEvent:(id)a3;
+ (id)candidateIdFromModeBiomeEvent:(id)a3;
+ (id)linkActionCandidateFeaturesFromLinkActionEvent:(id)a3 actionMetadata:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6;
+ (id)linkActionDetailsFromLinkActionCandidateId:(id)a3;
+ (id)modeCandidateFeaturesFromModeEvent:(id)a3 modeMetadata:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6;
+ (id)modeDetailsFromModeCandidateId:(id)a3;
+ (id)populateCandidateOccurrencesForFeatures:(id)a3 withLaunchHistoryMetadata:(id)a4;
+ (int64_t)dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:(int)a3;
+ (int64_t)isWeekendFromATXAnchorModelPBDayOfWeek:(int)a3;
- (ATXAnchorModelDataStoreWrapper)init;
- (ATXAnchorModelDataStoreWrapper)initWithDataStore:(id)a3;
- (double)timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:(id)a3;
- (id)appIntentDuetEventFromCandidateId:(id)a3 date:(id)a4;
- (id)appIntentDuetEventsFromCandidateIds:(id)a3 date:(id)a4;
- (id)appLaunchDuetEventFromCandidateId:(id)a3 date:(id)a4;
- (id)appLaunchDuetEventsFromCandidateIds:(id)a3 date:(id)a4;
- (id)candidateIdFromActionMetadata:(id)a3;
- (id)candidateTypeForCandidateId:(id)a3;
- (id)dateAnchorModelWasLastTrainedForAnchor:(id)a3;
- (id)dateOfFirstPositiveCandidateOccurrence:(id)a3 anchor:(id)a4 startDate:(id)a5 limit:(unint64_t)a6;
- (id)historicalAnchorOccurrenceDatesForAnchor:(id)a3;
- (id)linkActionBiomeEventFromCandidateId:(id)a3 date:(id)a4;
- (id)linkActionBiomeEventsFromCandidateIds:(id)a3 date:(id)a4;
- (id)minSlotResolutionParametersFromALogId:(int64_t)a3 paramHash:(int64_t)a4;
- (id)modeBiomeEventFromCandidateId:(id)a3 date:(id)a4;
- (id)modeBiomeEventsFromCandidateIds:(id)a3 date:(id)a4;
- (id)scoredActionFromAnchorModelPrediction:(id)a3;
- (id)secondsAfterAnchorWhenCandidateOccurredForAnchor:(id)a3 candidateId:(id)a4 onlyConsiderFirstOccurrencePerAnchor:(BOOL)a5;
- (id)trainingDataForCandidate:(id)a3 anchor:(id)a4 replacementStringForNilStringValues:(id)a5;
- (id)trainingResultsForAnchor:(id)a3;
- (id)uniqueAnchorEventIdentifiersForAnchor:(id)a3;
- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3;
- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3 candidateType:(id)a4;
- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3 candidateType:(id)a4 minOccurrences:(int64_t)a5;
- (int64_t)latestAlogIdForCandidateId:(id)a3;
- (int64_t)numActionOccurrencesInAllContexts;
- (int64_t)numActionOccurrencesInAllContextsForActionId:(id)a3;
- (int64_t)numAppLaunchOccurrencesInAllContexts;
- (int64_t)numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:(id)a3;
- (int64_t)numCandidateIdOccurrencesInJointAnchorContext:(id)a3 anchor:(id)a4 anchorMetadata:(id)a5;
- (int64_t)numCandidateOccurrencesInAllContextsForCandidate:(id)a3;
- (int64_t)numCandidateOccurrencesInAllContextsForCandidateType:(id)a3;
- (int64_t)numCandidateOccurrencesInAnchorContextForCandidate:(id)a3 anchor:(id)a4;
- (int64_t)numCandidateOccurrencesInAnchorContextForCandidateType:(id)a3 anchor:(id)a4;
- (int64_t)numLinkActionOccurrencesInAllContexts;
- (int64_t)numLinkActionOccurrencesInAllContextsForCandidateId:(id)a3;
- (int64_t)numModeOccurrencesInAllContexts;
- (int64_t)numModeOccurrencesInAllContextsForModeId:(id)a3;
- (int64_t)numUniqueAnchorOccurrencesForAnchor:(id)a3 candidateId:(id)a4;
- (int64_t)numUniqueAnchorOccurrencesForGenericCandidateId:(id)a3 anchor:(id)a4;
- (int64_t)numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId:(id)a3 anchor:(id)a4;
- (unint64_t)deleteSamplesForBundleIdsNotInList:(id)a3;
- (unint64_t)deleteSamplesThatAreMoreThan28DaysOld;
- (void)assignMetricsForTrainingResult:(id)a3 anchorType:(id)a4 anchorEventIdentifier:(id)a5 candidateId:(id)a6;
- (void)insertAnchorOccurrence:(id)a3 anchor:(id)a4 featureMetadata:(id)a5;
- (void)insertAnchorSuggestionOutcome:(unint64_t)a3 date:(id)a4 anchorType:(id)a5 anchorEventIdentifier:(id)a6 candidateId:(id)a7;
- (void)populateCachedCountsForCandidateIds:(id)a3;
- (void)updateOrInsertActionTrainingSample:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (void)updateOrInsertAnchorEvent:(id)a3 anchor:(id)a4 featureMetadata:(id)a5;
- (void)updateOrInsertAnchorModelTrainingResults:(id)a3 anchor:(id)a4;
- (void)updateOrInsertAnchorType:(id)a3;
- (void)updateOrInsertAppTrainingSample:(id)a3 featurizedApp:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (void)updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:(id)a3 anchor:(id)a4 anchorEvent:(id)a5;
- (void)updateOrInsertLinkActionTrainingSample:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (void)updateOrInsertLocation:(id)a3;
- (void)updateOrInsertModeTrainingSample:(id)a3 featurizedMode:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
@end

@implementation ATXAnchorModelDataStoreWrapper

- (ATXAnchorModelDataStoreWrapper)init
{
  v3 = +[_ATXDataStore sharedInstance];
  v4 = [(ATXAnchorModelDataStoreWrapper *)self initWithDataStore:v3];

  return v4;
}

- (ATXAnchorModelDataStoreWrapper)initWithDataStore:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelDataStoreWrapper;
  v6 = [(ATXAnchorModelDataStoreWrapper *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-1814400.0];
    twentyOneDaysAgo = v7->_twentyOneDaysAgo;
    v7->_twentyOneDaysAgo = (NSDate *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    v11 = +[ATXAnchorModelHyperParameters sharedInstance];
    [v11 maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction];
    uint64_t v13 = [v10 initWithTimeIntervalSinceNow:-v12];
    dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration = v7->_dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration;
    v7->_dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration = (NSDate *)v13;

    uint64_t v15 = objc_opt_new();
    numCandidateOccurrencesInAllContextsForCandidateTypeCache = v7->_numCandidateOccurrencesInAllContextsForCandidateTypeCache;
    v7->_numCandidateOccurrencesInAllContextsForCandidateTypeCache = (NSMutableDictionary *)v15;
  }
  return v7;
}

- (double)timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelDataStoreWrapper timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:]();
  }

  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  store = self->_store;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke;
  v10[3] = &unk_1E68AD278;
  v10[4] = self;
  id v7 = v4;
  id v11 = v7;
  double v12 = &v13;
  [(_ATXDataStore *)store _doSync:v10];
  double v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT MAX(anchorDate) FROM anchorOccurrence where anchorType=?" onPrep:v6 onRow:v5 onError:v3];
}

void __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 anchorTypeString];
  [v3 bindParam:1 toNSString:v4];
}

uint64_t __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "getIntegerForColumn:", 0));
  [v3 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)updateOrInsertActionTrainingSample:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a7;
  objc_super v18 = [v14 alogId];

  if (!v18)
  {
    v19 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper updateOrInsertActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:]();
    }
  }
  v20 = +[ATXAnchorModelDataStoreWrapper actionCandidateFeaturesFromActionEvent:v14 actionMetadata:v15 actionOccurred:v11 actionEngaged:v10];
  [(ATXAnchorModelDataStoreWrapper *)self updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:v20 anchor:v16 anchorEvent:v17];
}

- (void)updateOrInsertAppTrainingSample:(id)a3 featurizedApp:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = +[ATXAnchorModelDataStoreWrapper appCandidateFeaturesFromAppLaunchEvent:a3 appMetadata:a4 appWasLaunched:v10 appEngaged:v9];
  [(ATXAnchorModelDataStoreWrapper *)self updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:v16 anchor:v14 anchorEvent:v15];
}

- (void)updateOrInsertModeTrainingSample:(id)a3 featurizedMode:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = +[ATXAnchorModelDataStoreWrapper modeCandidateFeaturesFromModeEvent:a3 modeMetadata:a4 modeOccurred:v10 modeEngaged:v9];
  [(ATXAnchorModelDataStoreWrapper *)self updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:v16 anchor:v14 anchorEvent:v15];
}

- (void)updateOrInsertLinkActionTrainingSample:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v16 = a7;
  id v14 = a8;
  id v15 = +[ATXAnchorModelDataStoreWrapper linkActionCandidateFeaturesFromLinkActionEvent:a3 actionMetadata:a4 actionOccurred:v10 actionEngaged:v9];
  if (v15) {
    [(ATXAnchorModelDataStoreWrapper *)self updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:v15 anchor:v14 anchorEvent:v16];
  }
}

- (void)updateOrInsertCandidateEventToDatabaseWithCandidateFeatures:(id)a3 anchor:(id)a4 anchorEvent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  store = self->_store;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke;
  v15[3] = &unk_1E68AC3B8;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_ATXDataStore *)store _doAsync:v15];
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke(uint64_t a1)
{
  id v2 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_2();
  }

  id v3 = [*(id *)(*(void *)(a1 + 40) + 8) db];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_40;
  v13[3] = &unk_1E68AED38;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = a1 + 32;
  id v16 = v5;
  [v3 prepAndRunQuery:@"INSERT INTO anchorModelTrainingData (anchorType, anchorDate, candidateType, candidateId, candidateOccurrencesInLast12Hours, candidateOccurrencesInLast24Hours, candidateOccurrencesInLast48Hours, candidateOccurrencesInLast7Days, candidateOccurrencesInLast14Days, candidateOccurrencesInLast28Days, candidatePerformed, candidateEngaged, secondsSinceAnchor, candidateLocation, candidateOccurrenceId) VALUES (:anchorType, :anchorDate, :candidateType, :candidateId, :candidateOccurrencesInLast12Hours, :candidateOccurrencesInLast24Hours, :candidateOccurrencesInLast48Hours, :candidateOccurrencesInLast7Days, :candidateOccurrencesInLast14Days, :candidateOccurrencesInLast28Days, :candidatePerformed, :candidateEngaged, :secondsSinceAnchor, :candidateLocation, :candidateOccurrenceId)", v13, 0, &__block_literal_global_200 onPrep onRow onError];

  v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
  }
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_40(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) anchorTypeString];
  [v3 bindNamedParam:":anchorType" toNSString:v5];

  v6 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:*(void *)(a1 + 40)];
  [v6 timeIntervalSince1970];
  [v3 bindNamedParam:":anchorDate" toInt64:(uint64_t)v7];
  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v8 = (id *)(a1 + 48);
  uint64_t v10 = [v9 objectForKeyedSubscript:@"candidateType"];
  [v3 bindNamedParam:":candidateType" toNSString:v10];

  uint64_t v11 = [*v8 objectForKeyedSubscript:@"candidateId"];
  [v3 bindNamedParam:":candidateId" toNSString:v11];

  uint64_t v12 = [*v8 objectForKey:@"candidateOccurrenceId"];
  id v13 = v12;
  if (v12)
  {
    objc_msgSend(v3, "bindNamedParam:toInt64:", ":candidateOccurrenceId", objc_msgSend(v12, "longLongValue"));
    id v14 = [*v8 objectForKeyedSubscript:@"candidateOccurrencesInLast12Hours"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast12Hours", objc_msgSend(v14, "integerValue"));

    id v15 = [*v8 objectForKeyedSubscript:@"candidateOccurrencesInLast24Hours"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast24Hours", objc_msgSend(v15, "integerValue"));

    id v16 = [*v8 objectForKeyedSubscript:@"candidateOccurrencesInLast48Hours"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast48Hours", objc_msgSend(v16, "integerValue"));

    id v17 = [*v8 objectForKeyedSubscript:@"candidateOccurrencesInLast7Days"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast7Days", objc_msgSend(v17, "integerValue"));

    id v18 = [*v8 objectForKeyedSubscript:@"candidateOccurrencesInLast14Days"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast14Days", objc_msgSend(v18, "integerValue"));

    id v19 = [*v8 objectForKeyedSubscript:@"candidateOccurrencesInLast28Days"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateOccurrencesInLast28Days", objc_msgSend(v19, "integerValue"));

    v20 = [*v8 objectForKeyedSubscript:@"candidatePerformed"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidatePerformed", objc_msgSend(v20, "integerValue"));

    v21 = [*v8 objectForKeyedSubscript:@"candidateEngaged"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":candidateEngaged", objc_msgSend(v21, "integerValue"));

    v22 = [*v8 objectForKeyedSubscript:@"secondsSinceAnchor"];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v22, "integerValue"));

    v23 = [*v8 objectForKey:@"candidateLocation"];
    if (v23) {
      [v3 bindNamedParam:":candidateLocation" toNSString:v23];
    }
    else {
      [v3 bindNamedParamToNull:":candidateLocation"];
    }
  }
  else
  {
    v24 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_40_cold_1(v8, v4, v24);
    }
  }
}

uint64_t __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_95(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_95_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)updateOrInsertAnchorModelTrainingResults:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  store = self->_store;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke;
  v11[3] = &unk_1E68AC320;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(_ATXDataStore *)store _doAsync:v11];
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_2;
  v4[3] = &unk_1E68AC320;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  [v2 writeTransaction:v4];
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_3;
  v18[3] = &unk_1E68AD200;
  id v19 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM anchorModelTrainingResults WHERE anchorType LIKE :anchorType" onPrep:v18 onRow:0 onError:&__block_literal_global_100_0];

  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1 + 48);
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1D25F6CC0]();
        id v10 = [*(id *)(*(void *)(a1 + 32) + 8) db];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_104;
        v12[3] = &unk_1E68AD1B0;
        v12[4] = v8;
        id v13 = v3;
        [v10 prepAndRunQuery:@"INSERT INTO anchorModelTrainingResults (trainingDate, anchorType, anchorEventIdentifier, candidateType, candidateId, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, posteriorProbability, classConditionalProbability, classifierType, trainedClassifier, classifierDescription, startSecondsAfterAnchor, endSecondsAfterAnchor, standardDeviationOfOffsetFromAnchor, launchesInLast28Days, launchesInLast14Days, launchesInLast7Days, launchesInLast48Hours, launchesInLast24Hours, launchesInLast12Hours, launchesInLast2Hours, anchorPopularity, globalPopularity) VALUES (:trainingDate, :anchorType, :anchorEventIdentifier, :candidateType, :candidateId, :numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, :posteriorProbability, :classConditionalProbability, :classifierType, :trainedClassifier, :classifierDescription, :startSecondsAfterAnchor, :endSecondsAfterAnchor, :standardDeviationOfOffsetFromAnchor, :launchesInLast28Days, :launchesInLast14Days, :launchesInLast7Days, :launchesInLast48Hours, :launchesInLast24Hours, :launchesInLast12Hours, :launchesInLast2Hours, :anchorPopularity, :globalPopularity)", v12, 0, &__block_literal_global_129_0 onPrep onRow onError];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 anchorTypeString];
  [v3 bindNamedParam:":anchorType" toNSString:v4];
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_95_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_104(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  +[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier configureKeyedArchiver:v5];
  uint64_t v6 = (id *)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 32) candidateClassifier];
  [v5 encodeObject:v7 forKey:*MEMORY[0x1E4F284E8]];

  [v5 finishEncoding];
  uint64_t v8 = [v5 encodedData];
  id v9 = [v5 error];

  if (v8)
  {
    [v3 bindNamedParam:":trainedClassifier" toNSData:v8];
    [*(id *)(a1 + 40) timeIntervalSince1970];
    [v3 bindNamedParam:":trainingDate" toInt64:(uint64_t)v10];
    uint64_t v11 = [*(id *)(a1 + 32) anchor];
    id v12 = [v11 anchorTypeString];
    [v3 bindNamedParam:":anchorType" toNSString:v12];

    id v13 = [*(id *)(a1 + 32) anchor];
    long long v14 = [v13 anchorEventIdentifier];

    if (v14)
    {
      long long v15 = [*v6 anchor];
      long long v16 = [v15 anchorEventIdentifier];
      [v3 bindNamedParam:":anchorEventIdentifier" toNSString:v16];
    }
    else
    {
      [v3 bindNamedParamToNull:":anchorEventIdentifier"];
    }
    id v18 = [*v6 candidateType];
    [v3 bindNamedParam:":candidateType" toNSString:v18];

    id v19 = [*v6 candidateId];
    [v3 bindNamedParam:":candidateId" toNSString:v19];

    v20 = [*v6 phase1TrainingResult];
    objc_msgSend(v3, "bindNamedParam:toInteger:", ":numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence", objc_msgSend(v20, "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence"));

    uint64_t v21 = [*v6 phase1TrainingResult];
    [v21 posteriorProbability];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":posteriorProbability");

    v22 = [*v6 phase1TrainingResult];
    [v22 classConditionalProbability];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":classConditionalProbability");

    objc_msgSend(v3, "bindNamedParam:toInteger:", ":classifierType", objc_msgSend(*v6, "candidateClassifierType"));
    v23 = [*v6 candidateClassifier];
    v24 = [v23 description];
    [v3 bindNamedParam:":classifierDescription" toNSString:v24];

    v25 = [*v6 offsetFromAnchorToShowPrediction];
    [v25 startSecondsAfterAnchor];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":startSecondsAfterAnchor");

    v26 = [*v6 offsetFromAnchorToShowPrediction];
    [v26 endSecondsAfterAnchor];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":endSecondsAfterAnchor");

    v27 = [*v6 phase1TrainingResult];
    [v27 standardDeviationOfOffsetFromAnchor];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":standardDeviationOfOffsetFromAnchor");

    v28 = [*v6 phase1TrainingResult];
    long long v17 = [v28 launchHistory];

    if ([v17 hasLaunchesInLast28Days]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast28Days", -[NSObject launchesInLast28Days](v17, "launchesInLast28Days"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast28Days"];
    }
    if ([v17 hasLaunchesInLast14Days]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast14Days", -[NSObject launchesInLast14Days](v17, "launchesInLast14Days"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast14Days"];
    }
    if ([v17 hasLaunchesInLast7Days]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast7Days", -[NSObject launchesInLast7Days](v17, "launchesInLast7Days"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast7Days"];
    }
    if ([v17 hasLaunchesInLast48Hours]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast48Hours", -[NSObject launchesInLast48Hours](v17, "launchesInLast48Hours"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast48Hours"];
    }
    if ([v17 hasLaunchesInLast24Hours]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast24Hours", -[NSObject launchesInLast24Hours](v17, "launchesInLast24Hours"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast12Hours"];
    }
    if ([v17 hasLaunchesInLast12Hours]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast12Hours", -[NSObject launchesInLast12Hours](v17, "launchesInLast12Hours"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast24Hours"];
    }
    if ([v17 hasLaunchesInLast2Hours]) {
      objc_msgSend(v3, "bindNamedParam:toInteger:", ":launchesInLast2Hours", -[NSObject launchesInLast2Hours](v17, "launchesInLast2Hours"));
    }
    else {
      [v3 bindNamedParamToNull:":launchesInLast2Hours"];
    }
    v29 = [*v6 phase1TrainingResult];
    [v29 anchorPopularity];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":anchorPopularity");

    v30 = [*v6 phase1TrainingResult];
    [v30 globalPopularity];
    objc_msgSend(v3, "bindNamedParam:toDouble:", ":globalPopularity");
  }
  else
  {
    long long v17 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_104_cold_1(v6, (uint64_t)v9, v17);
    }
  }
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_127(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_95_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)insertAnchorSuggestionOutcome:(unint64_t)a3 date:(id)a4 anchorType:(id)a5 anchorEventIdentifier:(id)a6 candidateId:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v16 = v15;
  if (!v13)
  {
    id v18 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:]();
    }
    goto LABEL_8;
  }
  if (!v15)
  {
    id v18 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:]();
    }
LABEL_8:

    goto LABEL_9;
  }
  store = self->_store;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke;
  v19[3] = &unk_1E68B4B48;
  v19[4] = self;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  id v23 = v16;
  unint64_t v24 = a3;
  [(_ATXDataStore *)store _doAsync:v19];

LABEL_9:
}

void __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_2;
  v5[3] = &unk_1E68B10B8;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  id v9 = v3;
  uint64_t v10 = v4;
  [v2 prepAndRunQuery:@"INSERT INTO anchorModelSuggestionOutcomes (anchorType, date, anchorEventIdentifier, candidateId, outcome) VALUES (:anchorType, :date, :anchorEventIdentifier, :candidateId, :outcome)", v5, 0, &__block_literal_global_136 onPrep onRow onError];
}

void __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 bindNamedParam:":anchorType" toNSString:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":date" toInt64:(uint64_t)v3];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v4, "bindNamedParam:toNSString:", ":anchorEventIdentifier");
  }
  else {
    [v4 bindNamedParamToNull:":anchorEventIdentifier"];
  }
  [v4 bindNamedParam:":candidateId" toNSString:*(void *)(a1 + 56)];
  [v4 bindNamedParam:":outcome" toInt64:*(void *)(a1 + 64)];
}

uint64_t __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)assignMetricsForTrainingResult:(id)a3 anchorType:(id)a4 anchorEventIdentifier:(id)a5 candidateId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (!v11)
  {
    long long v17 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:]();
    }
    goto LABEL_8;
  }
  if (!v13)
  {
    long long v17 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:]();
    }
LABEL_8:

    goto LABEL_9;
  }
  id v15 = malloc_type_calloc(8uLL, 4uLL, 0x30F39D97uLL);
  store = self->_store;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke;
  v18[3] = &unk_1E68AE738;
  void v18[4] = self;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  id v22 = v15;
  [(_ATXDataStore *)store _doSync:v18];
  [v10 setNumShownSuggestions:v15[1]];
  [v10 setNumEngagedSuggestions:v15[2]];
  [v10 setNumRejectedSuggestion:v15[3]];
  free(v15);

LABEL_9:
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_2;
  v4[3] = &unk_1E68AED38;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3;
  v3[3] = &__block_descriptor_40_e49___PASDBIterAction__B_16__0___PASSqliteStatement_8l;
  void v3[4] = *(void *)(a1 + 64);
  [v2 prepAndRunQuery:@"SELECT outcome, COUNT(*) FROM anchorModelSuggestionOutcomes WHERE anchorType = :anchorType AND anchorEventIdentifier = :anchorEventIdentifier AND candidateId = :candidateId GROUP BY outcome", v4, v3, &__block_literal_global_143 onPrep onRow onError];
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 bindNamedParam:":anchorType" toNSString:v3];
  if (a1[5]) {
    objc_msgSend(v4, "bindNamedParam:toNSString:", ":anchorEventIdentifier");
  }
  else {
    [v4 bindNamedParamToNull:":anchorEventIdentifier"];
  }
  [v4 bindNamedParam:":candidateId" toNSString:a1[6]];
}

uint64_t __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 getIntegerForColumn:1];
  if (v4 < 0)
  {
    id v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1();
    }
  }
  else
  {
    uint64_t v5 = v4;
    unint64_t v6 = [v3 getIntegerForColumnName:"outcome" table:0];
    if (v6 < 4)
    {
      *(void *)(*(void *)(a1 + 32) + 8 * v6) += v5;
      goto LABEL_9;
    }
    id v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_2();
    }
  }

LABEL_9:
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_141(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_141_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)trainingResultsForAnchor:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  unint64_t v6 = [v4 anchorEventIdentifier];

  id v7 = @"SELECT trainingDate, anchorType, candidateType, candidateId, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, posteriorProbability, classConditionalProbability, classifierType, trainedClassifier, startSecondsAfterAnchor, endSecondsAfterAnchor, standardDeviationOfOffsetFromAnchor, launchesInLast28Days, launchesInLast14Days, launchesInLast7Days, launchesInLast48Hours, launchesInLast24Hours, launchesInLast12Hours, launchesInLast2Hours FROM anchorModelTrainingResults WHERE anchorType=:anchorType AND anchorEventIdentifier=:anchorEventIdentifier";
  BOOL v8 = v6 == 0;
  store = self->_store;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke;
  v31[3] = &unk_1E68AC3B8;
  if (v8) {
    id v7 = @"SELECT trainingDate, anchorType, candidateType, candidateId, numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence, posteriorProbability, classConditionalProbability, classifierType, trainedClassifier, startSecondsAfterAnchor, endSecondsAfterAnchor, standardDeviationOfOffsetFromAnchor, launchesInLast28Days, launchesInLast14Days, launchesInLast7Days, launchesInLast48Hours, launchesInLast24Hours, launchesInLast12Hours, launchesInLast2Hours FROM anchorModelTrainingResults WHERE anchorType=:anchorType AND anchorEventIdentifier IS NULL";
  }
  v31[4] = self;
  v32 = v7;
  id v10 = v4;
  id v33 = v10;
  id v11 = v5;
  id v34 = v11;
  [(_ATXDataStore *)store _doSync:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v18 = objc_msgSend(v17, "phase1TrainingResult", (void)v27);
        id v19 = [v10 anchorTypeString];
        id v20 = [v10 anchorEventIdentifier];
        id v21 = [v17 candidateId];
        [(ATXAnchorModelDataStoreWrapper *)self assignMetricsForTrainingResult:v18 anchorType:v19 anchorEventIdentifier:v20 candidateId:v21];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v14);
  }

  id v22 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v12 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v36 = v23;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Recovered %lu training results for anchor %@", buf, 0x16u);
  }

  unint64_t v24 = v34;
  id v25 = v12;

  return v25;
}

void __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_2;
  v9[3] = &unk_1E68AD200;
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_3;
  v6[3] = &unk_1E68AEB98;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_179;
  v4[3] = &unk_1E68AD250;
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v9 onRow:v6 onError:v4];
}

void __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) anchorTypeString];
  [v6 bindNamedParam:":anchorType" toNSString:v3];

  id v4 = [*(id *)(a1 + 32) anchorEventIdentifier];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) anchorEventIdentifier];
    [v6 bindNamedParam:":anchorEventIdentifier" toNSString:v5];
  }
  else
  {
    [v6 bindNamedParamToNull:":anchorEventIdentifier"];
  }
}

uint64_t __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v2, "getInt64ForColumnName:table:", "trainingDate", "anchorModelTrainingResults"));
  uint64_t v33 = [v2 getNSStringForColumnName:"anchorType" table:"anchorModelTrainingResults"];
  uint64_t v32 = [v2 getNSStringForColumnName:"candidateType" table:"anchorModelTrainingResults"];
  uint64_t v3 = [v2 getNSStringForColumnName:"candidateId" table:"anchorModelTrainingResults"];
  id v4 = objc_opt_new();
  __int16 v37 = (void *)v3;
  [v4 setCandidateId:v3];
  objc_msgSend(v4, "setNumUniqueAnchorOccurrencesWithUniqueCandidateOccurrence:", objc_msgSend(v2, "getIntegerForColumnName:table:", "numUniqueAnchorOccurrencesWithUniqueCandidateOccurrence", "anchorModelTrainingResults"));
  [v2 getDoubleForColumnName:"posteriorProbability" table:"anchorModelTrainingResults"];
  objc_msgSend(v4, "setPosteriorProbability:");
  [v2 getDoubleForColumnName:"classConditionalProbability" table:"anchorModelTrainingResults"];
  objc_msgSend(v4, "setClassConditionalProbability:");
  [v2 getDoubleForColumnName:"standardDeviationOfOffsetFromAnchor" table:"anchorModelTrainingResults"];
  objc_msgSend(v4, "setStandardDeviationOfOffsetFromAnchor:");
  if (([v2 isNullForColumnName:"launchesInLast28Days" table:"anchorModelTrainingResults"] & 1) == 0)
  {
    id v5 = objc_opt_new();
    objc_msgSend(v5, "setLaunchesInLast28Days:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast28Days", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast14Days:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast14Days", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast7Days:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast7Days", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast48Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast48Hours", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast24Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast24Hours", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast12Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast12Hours", "anchorModelTrainingResults"));
    objc_msgSend(v5, "setLaunchesInLast2Hours:", objc_msgSend(v2, "getIntegerForColumnName:table:", "launchesInLast2Hours", "anchorModelTrainingResults"));
    [v4 setLaunchHistory:v5];
  }
  uint64_t v31 = [v2 getIntegerForColumnName:"classifierType" table:"anchorModelTrainingResults"];
  uint64_t v6 = [v2 getNSDataForColumnName:"trainedClassifier" table:"anchorModelTrainingResults"];
  id v7 = (void *)MEMORY[0x1D25F6CC0]();
  id v38 = 0;
  v35 = (void *)v6;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v6 error:&v38];
  id v9 = v38;
  [v8 setRequiresSecureCoding:1];
  [v8 setDecodingFailurePolicy:1];
  id v10 = (void *)MEMORY[0x1D25F6CC0](+[ATXGamePlayKitDecisionTreeAnchorModelCandidateClassifier configureKeyedUnarchiver:v8]);
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
  uint64_t v15 = [v8 decodeObjectOfClasses:v14 forKey:*MEMORY[0x1E4F284E8]];

  [v8 finishDecoding];
  long long v16 = [v8 error];

  if (!v15 || v9 || v16)
  {
    long long v28 = __atxlog_handle_anchor();
    long long v27 = (void *)v33;
    unint64_t v24 = (void *)v34;
    id v21 = (void *)v32;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      if (v9) {
        uint64_t v30 = (uint64_t)v9;
      }
      else {
        uint64_t v30 = (uint64_t)v16;
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v40 = v30;
      __int16 v41 = 2112;
      uint64_t v42 = v33;
      __int16 v43 = 2112;
      uint64_t v44 = v34;
      __int16 v45 = 2112;
      v46 = v37;
      _os_log_fault_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_FAULT, "Failed to unarchive trained classifier from anchorModelTrainingResults with error: %{public}@. Anchor: %@, trainingDate: %@, candidateId: %@", buf, 0x2Au);
    }

    [*(id *)(a1 + 32) removeAllObjects];
    uint64_t v26 = *MEMORY[0x1E4F93C10];
  }
  else
  {
    [v2 getDoubleForColumnName:"startSecondsAfterAnchor" table:"anchorModelTrainingResults"];
    double v18 = v17;
    [v2 getDoubleForColumnName:"endSecondsAfterAnchor" table:"anchorModelTrainingResults"];
    id v20 = [[ATXAnchorModelPredictionOffsetFromAnchorOccurrence alloc] initWithStartSecondsAfterAnchor:v18 endSecondsAfterAnchor:v19];
    id v21 = (void *)v32;
    id v22 = [[ATXAnchorModelTrainingResult alloc] initWithAnchor:*(void *)(a1 + 40) candidateId:v37 candidateType:v32 phase1TrainingResult:v4 candidateClassifier:v15 candidateClassifierType:v31 offsetFromAnchorToShowPrediction:v20];
    uint64_t v23 = __atxlog_handle_anchor();
    unint64_t v24 = (void *)v34;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = v34;
      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Recovered training result that was added on %@", buf, 0xCu);
    }

    id v25 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v40 = (uint64_t)v22;
      _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_DEFAULT, "Training result: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v22];
    uint64_t v26 = *MEMORY[0x1E4F93C08];

    long long v27 = (void *)v33;
  }

  return v26;
}

uint64_t __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_179(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_179_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)dateAnchorModelWasLastTrainedForAnchor:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  store = self->_store;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke;
  long long v16 = &unk_1E68AC3B8;
  double v17 = self;
  double v18 = @"SELECT trainingDate FROM anchorModelTrainingResults WHERE anchorType=:anchorType";
  id v7 = v4;
  id v19 = v7;
  id v8 = v5;
  id v20 = v8;
  [(_ATXDataStore *)store _doSync:&v13];
  if ((unint64_t)objc_msgSend(v8, "count", v13, v14, v15, v16, v17) < 2)
  {
    if ([v8 count])
    {
      uint64_t v10 = [v8 anyObject];
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper dateAnchorModelWasLastTrainedForAnchor:]();
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_8:
  id v11 = (void *)v10;

  return v11;
}

void __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_2;
  v8[3] = &unk_1E68AD200;
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_3;
  v6[3] = &unk_1E68AE948;
  id v7 = *(id *)(a1 + 56);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_4;
  v4[3] = &unk_1E68AD250;
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v8 onRow:v6 onError:v4];
}

void __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 anchorTypeString];
  [v3 bindNamedParam:":anchorType" toNSString:v4];
}

uint64_t __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)objc_msgSend(a2, "getInt64ForColumnName:table:", "trainingDate", "anchorModelTrainingResults"));
  [*(id *)(a1 + 32) addObject:v3];
  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v4;
}

uint64_t __73__ATXAnchorModelDataStoreWrapper_dateAnchorModelWasLastTrainedForAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_179_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

+ (id)actionCandidateFeaturesFromActionEvent:(id)a3 actionMetadata:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = +[ATXAnchorModelDataStoreWrapper candidateIdFromAppIntentDuetEvent:v10];
  [v12 setObject:v13 forKeyedSubscript:@"candidateId"];

  uint64_t v14 = [v10 alogId];

  if (v14)
  {
    uint64_t v15 = [v10 alogId];
    [v12 setObject:v15 forKeyedSubscript:@"candidateOccurrenceId"];
  }
  else
  {
    [v12 setObject:&unk_1F27F21F0 forKeyedSubscript:@"candidateOccurrenceId"];
  }
  [v12 setObject:@"action" forKeyedSubscript:@"candidateType"];
  long long v16 = [NSNumber numberWithBool:v7];
  [v12 setObject:v16 forKeyedSubscript:@"candidatePerformed"];

  double v17 = [NSNumber numberWithBool:v6];
  [v12 setObject:v17 forKeyedSubscript:@"candidateEngaged"];

  double v18 = NSNumber;
  id v19 = [v11 appLaunchMetadata];
  id v20 = objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "relativeTimeSinceAnchorInSeconds"));
  [v12 setObject:v20 forKeyedSubscript:@"secondsSinceAnchor"];

  id v21 = [v11 actionUUIDMetadatas];

  id v22 = [v21 objectAtIndexedSubscript:0];
  uint64_t v23 = [v22 actionUUIDLaunchHistory];
  unint64_t v24 = [a1 populateCandidateOccurrencesForFeatures:v12 withLaunchHistoryMetadata:v23];

  return v24;
}

+ (id)appCandidateFeaturesFromAppLaunchEvent:(id)a3 appMetadata:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = +[ATXAnchorModelDataStoreWrapper candidateIdFromAppLaunchDuetEvent:v11];
  [v12 setObject:v13 forKeyedSubscript:@"candidateId"];

  uint64_t v14 = NSNumber;
  uint64_t v15 = [v11 startDate];

  [v15 timeIntervalSince1970];
  long long v16 = objc_msgSend(v14, "numberWithDouble:");
  [v12 setObject:v16 forKeyedSubscript:@"candidateOccurrenceId"];

  [v12 setObject:@"app" forKeyedSubscript:@"candidateType"];
  double v17 = [NSNumber numberWithBool:v7];
  [v12 setObject:v17 forKeyedSubscript:@"candidatePerformed"];

  double v18 = [NSNumber numberWithBool:v6];
  [v12 setObject:v18 forKeyedSubscript:@"candidateEngaged"];

  id v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "relativeTimeSinceAnchorInSeconds"));
  [v12 setObject:v19 forKeyedSubscript:@"secondsSinceAnchor"];

  id v20 = [v10 appLaunchHistory];

  id v21 = [a1 populateCandidateOccurrencesForFeatures:v12 withLaunchHistoryMetadata:v20];

  return v21;
}

+ (id)modeCandidateFeaturesFromModeEvent:(id)a3 modeMetadata:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [a1 candidateIdFromModeBiomeEvent:v11];
  [v12 setObject:v13 forKeyedSubscript:@"candidateId"];

  uint64_t v14 = NSNumber;
  id v15 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v11 timestamp];
  double v17 = v16;

  double v18 = (void *)[v15 initWithTimeIntervalSinceReferenceDate:v17];
  [v18 timeIntervalSince1970];
  id v19 = objc_msgSend(v14, "numberWithDouble:");
  [v12 setObject:v19 forKeyedSubscript:@"candidateOccurrenceId"];

  [v12 setObject:@"mode" forKeyedSubscript:@"candidateType"];
  id v20 = [NSNumber numberWithBool:v7];
  [v12 setObject:v20 forKeyedSubscript:@"candidatePerformed"];

  id v21 = [NSNumber numberWithBool:v6];
  [v12 setObject:v21 forKeyedSubscript:@"candidateEngaged"];

  id v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "relativeTimeSinceAnchorInSeconds"));
  [v12 setObject:v22 forKeyedSubscript:@"secondsSinceAnchor"];

  uint64_t v23 = [v10 modeHistory];

  unint64_t v24 = [a1 populateCandidateOccurrencesForFeatures:v12 withLaunchHistoryMetadata:v23];

  return v24;
}

+ (id)linkActionCandidateFeaturesFromLinkActionEvent:(id)a3 actionMetadata:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (id)objc_opt_new();
  uint64_t v13 = [a1 candidateIdFromLinkActionBiomeEvent:v10];
  if (v13)
  {
    [v12 setObject:v13 forKeyedSubscript:@"candidateId"];
    uint64_t v14 = NSNumber;
    id v15 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v10 timestamp];
    double v16 = objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
    [v16 timeIntervalSince1970];
    double v17 = objc_msgSend(v14, "numberWithDouble:");
    [v12 setObject:v17 forKeyedSubscript:@"candidateOccurrenceId"];

    [v12 setObject:@"linkaction" forKeyedSubscript:@"candidateType"];
    double v18 = [NSNumber numberWithBool:v7];
    [v12 setObject:v18 forKeyedSubscript:@"candidatePerformed"];

    id v19 = [NSNumber numberWithBool:v6];
    [v12 setObject:v19 forKeyedSubscript:@"candidateEngaged"];

    id v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "relativeTimeSinceAnchorInSeconds"));
    [v12 setObject:v20 forKeyedSubscript:@"secondsSinceAnchor"];

    id v21 = [v11 actionHistory];
    id v22 = [a1 populateCandidateOccurrencesForFeatures:v12 withLaunchHistoryMetadata:v21];

    id v12 = v22;
    uint64_t v23 = v12;
  }
  else
  {
    unint64_t v24 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[ATXAnchorModelDataStoreWrapper linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:]();
    }

    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)populateCandidateOccurrencesForFeatures:(id)a3 withLaunchHistoryMetadata:(id)a4
{
  id v5 = a3;
  BOOL v6 = NSNumber;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast12Hours"));
  [v5 setObject:v8 forKeyedSubscript:@"candidateOccurrencesInLast12Hours"];

  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast24Hours"));
  [v5 setObject:v9 forKeyedSubscript:@"candidateOccurrencesInLast24Hours"];

  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast48Hours"));
  [v5 setObject:v10 forKeyedSubscript:@"candidateOccurrencesInLast48Hours"];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast7Days"));
  [v5 setObject:v11 forKeyedSubscript:@"candidateOccurrencesInLast7Days"];

  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "launchesInLast14Days"));
  [v5 setObject:v12 forKeyedSubscript:@"candidateOccurrencesInLast14Days"];

  uint64_t v13 = NSNumber;
  uint64_t v14 = [v7 launchesInLast28Days];

  id v15 = [v13 numberWithUnsignedInt:v14];
  [v5 setObject:v15 forKeyedSubscript:@"candidateOccurrencesInLast28Days"];

  double v16 = [v5 objectForKeyedSubscript:@"candidateOccurrencesInLast12Hours"];
  uint64_t v17 = [v16 integerValue];
  uint64_t v18 = MEMORY[0x1E4F1CC28];
  uint64_t v19 = MEMORY[0x1E4F1CC38];
  if (v17 <= 0) {
    uint64_t v20 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v20 = MEMORY[0x1E4F1CC38];
  }
  [v5 setObject:v20 forKeyedSubscript:@"candidateOccurredInLast12Hours"];

  id v21 = [v5 objectForKeyedSubscript:@"candidateOccurrencesInLast24Hours"];
  if ([v21 integerValue] <= 0) {
    uint64_t v22 = v18;
  }
  else {
    uint64_t v22 = v19;
  }
  [v5 setObject:v22 forKeyedSubscript:@"candidateOccurredInLast24Hours"];

  uint64_t v23 = [v5 objectForKeyedSubscript:@"candidateOccurrencesInLast48Hours"];
  if ([v23 integerValue] <= 0) {
    uint64_t v24 = v18;
  }
  else {
    uint64_t v24 = v19;
  }
  [v5 setObject:v24 forKeyedSubscript:@"candidateOccurredInLast48Hours"];

  id v25 = [v5 objectForKeyedSubscript:@"candidateOccurrencesInLast7Days"];
  if ([v25 integerValue] <= 0) {
    uint64_t v26 = v18;
  }
  else {
    uint64_t v26 = v19;
  }
  [v5 setObject:v26 forKeyedSubscript:@"candidateOccurredInLast7Days"];

  long long v27 = [v5 objectForKeyedSubscript:@"candidateOccurrencesInLast14Days"];
  if ([v27 integerValue] <= 0) {
    uint64_t v28 = v18;
  }
  else {
    uint64_t v28 = v19;
  }
  [v5 setObject:v28 forKeyedSubscript:@"candidateOccurredInLast14Days"];

  long long v29 = [v5 objectForKeyedSubscript:@"candidateOccurrencesInLast28Days"];
  if ([v29 integerValue] <= 0) {
    uint64_t v30 = v18;
  }
  else {
    uint64_t v30 = v19;
  }
  [v5 setObject:v30 forKeyedSubscript:@"candidateOccurredInLast28Days"];

  return v5;
}

- (void)updateOrInsertAnchorEvent:(id)a3 anchor:(id)a4 featureMetadata:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412802;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_debug_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEBUG, "AnchorModel: ATXDATASTORE. Adding anchor event to database %@ for anchor %@, featureMetadata: %@", (uint8_t *)&v12, 0x20u);
  }

  [(ATXAnchorModelDataStoreWrapper *)self updateOrInsertAnchorType:v9];
  [(ATXAnchorModelDataStoreWrapper *)self updateOrInsertLocation:v10];
  [(ATXAnchorModelDataStoreWrapper *)self insertAnchorOccurrence:v8 anchor:v9 featureMetadata:v10];
}

- (void)updateOrInsertAnchorType:(id)a3
{
  id v4 = a3;
  id v5 = [v4 anchorTypeString];
  BOOL v6 = objc_opt_class();

  id v7 = [v6 longDescription];
  store = self->_store;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke;
  v11[3] = &unk_1E68AC320;
  v11[4] = self;
  id v12 = v5;
  id v13 = v7;
  id v9 = v7;
  id v10 = v5;
  [(_ATXDataStore *)store _doAsync:v11];
}

void __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_2;
  v3[3] = &unk_1E68AD1B0;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO anchorType (name, description) VALUES (:name, :description)", v3, 0, &__block_literal_global_209_0 onPrep onRow onError];
}

void __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindNamedParam:":name" toNSString:v3];
  [v4 bindNamedParam:":description" toNSString:*(void *)(a1 + 40)];
}

uint64_t __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_3_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)updateOrInsertLocation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 locationIdentifier];

  if (v5)
  {
    store = self->_store;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke;
    v7[3] = &unk_1E68AB870;
    v7[4] = self;
    id v8 = v4;
    [(_ATXDataStore *)store _doAsync:v7];
  }
}

void __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_2;
  v3[3] = &unk_1E68AD200;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO locations (uuid, type, description, lat, long) VALUES (:uuid, :type, :description, :lat, :long)", v3, 0, &__block_literal_global_218 onPrep onRow onError];
}

void __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) locationIdentifier];
  [v6 bindNamedParam:":uuid" toNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 32) locationType];
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E68B4C20[(int)v4];
  }
  [v6 bindNamedParam:":type" toNSString:v5];

  [v6 bindNamedParamToNull:":description"];
  [v6 bindNamedParamToNull:":lat"];
  [v6 bindNamedParamToNull:":long"];
}

uint64_t __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)insertAnchorOccurrence:(id)a3 anchor:(id)a4 featureMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  store = self->_store;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke;
  v15[3] = &unk_1E68AC3B8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(_ATXDataStore *)store _doAsync:v15];
}

void __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_2;
  v4[3] = &unk_1E68B1040;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 prepAndRunQuery:@"INSERT OR REPLACE INTO anchorOccurrence (anchorType, anchorDate, anchorLocalHour, anchorLocalDoW, anchorLocalIsWeekend, anchorLocation, anchorEventIdentifier) VALUES (:anchorType, :anchorDate, :anchorLocalHour, :anchorLocalDoW, :anchorLocalIsWeekend, :anchorLocation, :anchorEventIdentifier)", v4, 0, &__block_literal_global_245 onPrep onRow onError];
}

void __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = [(id)objc_opt_class() anchorFeaturesForAnchorOccurrence:*(void *)(a1 + 40) anchor:*(void *)(a1 + 48) anchorMetadata:*(void *)(a1 + 56)];
  uint64_t v4 = [v11 objectForKeyedSubscript:@"anchorType"];
  [v3 bindNamedParam:":anchorType" toNSString:v4];

  id v5 = [v11 objectForKeyedSubscript:@"anchorDate"];
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":anchorDate", objc_msgSend(v5, "longLongValue"));

  id v6 = [v11 objectForKeyedSubscript:@"anchorLocalHour"];
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":anchorLocalHour", objc_msgSend(v6, "integerValue"));

  id v7 = [v11 objectForKeyedSubscript:@"anchorLocalDoW"];
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":anchorLocalDoW", objc_msgSend(v7, "integerValue"));

  id v8 = [v11 objectForKeyedSubscript:@"anchorLocalIsWeekend"];
  objc_msgSend(v3, "bindNamedParam:toInteger:", ":anchorLocalIsWeekend", objc_msgSend(v8, "integerValue"));

  id v9 = [v11 objectForKeyedSubscript:@"anchorLocation"];
  [v3 bindNamedParam:":anchorLocation" toNSString:v9];

  id v10 = [*(id *)(a1 + 40) identifier];
  [v3 bindNamedParam:":anchorEventIdentifier" toNSString:v10];
}

uint64_t __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_3_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (unint64_t)deleteSamplesThatAreMoreThan28DaysOld
{
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Deleting Anchor Model samples that are more than 28 days old.", buf, 2u);
  }

  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2419200.0];
  *(void *)buf = 0;
  uint64_t v20 = buf;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  store = self->_store;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke;
  v9[3] = &unk_1E68B4B90;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = buf;
  id v12 = &v15;
  id v13 = v14;
  [(_ATXDataStore *)store _doSync:v9];
  unint64_t v7 = v16[3];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(buf, 8);

  return v7;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2;
  v4[3] = &unk_1E68B4B90;
  id v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  [v2 writeTransaction:v4];
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_3;
  v21[3] = &unk_1E68AD200;
  id v22 = *(id *)(a1 + 40);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_4;
  v20[3] = &unk_1E68AD228;
  v20[4] = *(void *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM anchorOccurrence WHERE anchorDate < :anchorDateCutoff" onPrep:v21 onRow:v20 onError:&__block_literal_global_252];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_256;
  v18[3] = &unk_1E68AD200;
  id v19 = *(id *)(a1 + 40);
  [v3 prepAndRunQuery:@"DELETE FROM anchorOccurrence WHERE anchorDate < :anchorDateCutoff" onPrep:v18 onRow:0 onError:&__block_literal_global_259];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_263;
  v16[3] = &unk_1E68AD200;
  id v17 = *(id *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_264;
  v15[3] = &unk_1E68AD228;
  void v15[4] = *(void *)(a1 + 56);
  [v4 prepAndRunQuery:@"SELECT COUNT(*) FROM anchorModelTrainingData WHERE anchorDate < :anchorDateCutoff" onPrep:v16 onRow:v15 onError:&__block_literal_global_267];

  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_271;
  v13[3] = &unk_1E68AD200;
  id v14 = *(id *)(a1 + 40);
  [v5 prepAndRunQuery:@"DELETE FROM anchorModelTrainingData WHERE anchorDate < :anchorDateCutoff" onPrep:v13 onRow:0 onError:&__block_literal_global_274];

  long long v6 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_278;
  v11[3] = &unk_1E68AD200;
  id v12 = *(id *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_280;
  v10[3] = &unk_1E68AD228;
  v10[4] = *(void *)(a1 + 64);
  [v6 prepAndRunQuery:@"SELECT COUNT(*) FROM anchorModelSuggestionOutcomes WHERE date < :suggestionDateCutoff" onPrep:v11 onRow:v10 onError:&__block_literal_global_283];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_287;
  v8[3] = &unk_1E68AD200;
  id v9 = *(id *)(a1 + 40);
  [v7 prepAndRunQuery:@"DELETE FROM anchorModelSuggestionOutcomes WHERE date < :suggestionDateCutoff" onPrep:v8 onRow:0 onError:&__block_literal_global_290];
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSince1970];
  [v4 bindNamedParam:":anchorDateCutoff" toInt64:(uint64_t)v3];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Removing %lu samples from anchorOccurrence table because the samples are more than 28 days old.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_250(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_250_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_256(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSince1970];
  [v4 bindNamedParam:":anchorDateCutoff" toInt64:(uint64_t)v3];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_257(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_257_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_263(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSince1970];
  [v4 bindNamedParam:":anchorDateCutoff" toInt64:(uint64_t)v3];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_264(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Removing %lu samples from anchorModelTrainingData table because the samples are more than 28 days old.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_265(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_265_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_271(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSince1970];
  [v4 bindNamedParam:":anchorDateCutoff" toInt64:(uint64_t)v3];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_272(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_272_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_278(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":suggestionDateCutoff" toInt64:(uint64_t)v3];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_280(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Removing %lu outcomes from anchorModelSuggestionOutcomes table because the samples are more than 28 days old.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_281(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_281_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_287(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 timeIntervalSinceReferenceDate];
  [v4 bindNamedParam:":suggestionDateCutoff" toInt64:(uint64_t)v3];
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_288(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_288_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (unint64_t)deleteSamplesForBundleIdsNotInList:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Deleting Anchor Model samples for apps that are uninstalled.", buf, 2u);
  }

  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
  *(void *)buf = 0;
  uint64_t v15 = buf;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  store = self->_store;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke;
  v11[3] = &unk_1E68AD278;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = buf;
  [(_ATXDataStore *)store _doSync:v11];
  unint64_t v9 = *((void *)v15 + 3);

  _Block_object_dispose(buf, 8);
  return v9;
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_2;
  v6[3] = &unk_1E68AD278;
  double v3 = (void *)a1[5];
  void v6[4] = a1[4];
  id v4 = v3;
  uint64_t v5 = a1[6];
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 writeTransaction:v6];
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_3;
  v5[3] = &unk_1E68AD200;
  id v6 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"DELETE FROM anchorModelTrainingData WHERE (CASE WHEN INSTR(candidateId, ':') IS 0 THEN candidateId ELSE SUBSTR(candidateId, 1, INSTR(candidateId, ':')-1) END) NOT IN _pas_nsset(:installedBundleIds)", v5, 0, &__block_literal_global_296 onPrep onRow onError];

  double v3 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_300;
  v4[3] = &unk_1E68AD228;
  void v4[4] = *(void *)(a1 + 48);
  [v3 prepAndRunQuery:@"SELECT changes()" onPrep:0 onRow:v4 onError:&__block_literal_global_303];
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":installedBundleIds" toNSSet:*(void *)(a1 + 32)];
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_300(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Removed %ld samples from anchorModelTrainingData because the associated apps were uninstalled.", (uint8_t *)&v6, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_301(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_301_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

+ (id)anchorFeaturesForAnchorOccurrence:(id)a3 anchor:(id)a4 anchorMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_opt_new();
  id v12 = [v10 anchorTypeString];
  [v11 setObject:v12 forKeyedSubscript:@"anchorType"];

  id v13 = objc_opt_class();
  id v14 = [v13 anchorOccurenceDateFromDuetEvent:v8];
  uint64_t v15 = NSNumber;
  [v14 timeIntervalSince1970];
  uint64_t v16 = objc_msgSend(v15, "numberWithDouble:");
  [v11 setObject:v16 forKeyedSubscript:@"anchorDate"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "hourOfDay"));
  [v11 setObject:v17 forKeyedSubscript:@"anchorLocalHour"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:", objc_msgSend(v9, "dayOfWeek")));
  [v11 setObject:v18 forKeyedSubscript:@"anchorLocalDoW"];

  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "isWeekendFromATXAnchorModelPBDayOfWeek:", objc_msgSend(v9, "dayOfWeek")));
  [v11 setObject:v19 forKeyedSubscript:@"anchorLocalIsWeekend"];

  uint64_t v20 = [v9 locationIdentifier];

  if (v20)
  {
    uint64_t v21 = [v9 locationIdentifier];
    [v11 setObject:v21 forKeyedSubscript:@"anchorLocation"];
  }
  id v22 = [v8 identifier];
  [v11 setObject:v22 forKeyedSubscript:@"anchorEventIdentifier"];

  return v11;
}

+ (int64_t)isWeekendFromATXAnchorModelPBDayOfWeek:(int)a3
{
  return a3 == 1 || a3 == 7;
}

+ (int64_t)dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:(int)a3
{
  if (a3 > 7) {
    return 1;
  }
  else {
    return qword_1D142BB60[a3];
  }
}

- (id)historicalAnchorOccurrenceDatesForAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__96;
  uint64_t v16 = __Block_byref_object_dispose__96;
  id v17 = (id)objc_opt_new();
  store = self->_store;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke;
  v9[3] = &unk_1E68AD278;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(_ATXDataStore *)store _doSync:v9];
  uint64_t v7 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "prepAndRunQuery:onPrep:onRow:onError:", @"SELECT anchorDate FROM anchorOccurrence WHERE anchorType=:anchorType ORDER BY anchorDate DESC LIMIT 30;",
    v6,
    v5,
    v3);
}

void __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 anchorTypeString];
  [v3 bindNamedParam:":anchorType" toNSString:v4];
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 getInt64ForColumnName:"anchorDate" table:"anchorOccurrence"];

  id v7 = (void *)[v5 initWithTimeIntervalSince1970:(double)v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  id v8 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v8;
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)uniqueAnchorEventIdentifiersForAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__96;
  uint64_t v16 = __Block_byref_object_dispose__96;
  id v17 = (id)objc_opt_new();
  store = self->_store;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke;
  v9[3] = &unk_1E68AD278;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(_ATXDataStore *)store _doSync:v9];
  id v7 = (void *)[(id)v13[5] copy];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_2;
  v8[3] = &unk_1E68AD1B0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_317;
  v5[3] = &unk_1E68AD250;
  id v6 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT DISTINCT anchorEventIdentifier FROM anchorOccurrence WHERE anchorType=:anchorType AND anchorDate>:oldestAllowedAnchorDate" onPrep:v8 onRow:v7 onError:v5];
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v4 = [v3 anchorTypeString];
  [v6 bindNamedParam:":anchorType" toNSString:v4];

  [*(id *)(*(void *)(a1 + 40) + 16) timeIntervalSince1970];
  [v6 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v5];
}

uint64_t __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 getNSStringForColumnName:"anchorEventIdentifier" table:"anchorOccurrence"];
  if (v3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
  else
  {
    uint64_t v4 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3_cold_1();
    }
  }
  double v5 = (unsigned __int8 *)MEMORY[0x1E4F93C08];

  return *v5;
}

uint64_t __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_317(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_317_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (int64_t)numUniqueAnchorOccurrencesForAnchor:(id)a3 candidateId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  id v8 = [(ATXAnchorModelDataStoreWrapper *)self dateOfFirstPositiveCandidateOccurrence:v7 anchor:v6 startDate:self->_twentyOneDaysAgo limit:9999999];
  store = self->_store;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke;
  v14[3] = &unk_1E68B0E08;
  void v14[4] = self;
  id v10 = v6;
  id v15 = v10;
  id v11 = v8;
  id v16 = v11;
  id v17 = &v18;
  [(_ATXDataStore *)store _doSync:v14];
  int64_t v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_2;
  v6[3] = &unk_1E68AD1B0;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 56);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(*) FROM anchorOccurrence WHERE anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND anchorDate >= :oldestAllowedAnchorDate" onPrep:v6 onRow:v5 onError:v3];
}

void __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v9 = a2;
  id v4 = [v3 anchorTypeString];
  [v9 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) anchorEventIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v9 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  [*(id *)(a1 + 40) timeIntervalSince1970];
  [v9 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v8];
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (int64_t)numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke;
  v13[3] = &unk_1E68B0E08;
  void v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v16 = &v17;
  [(_ATXDataStore *)store _doSync:v13];
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_2;
  v8[3] = &unk_1E68AED38;
  id v9 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_3;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4;
  v5[3] = &unk_1E68AD250;
  id v6 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT COUNT( DISTINCT dates) FROM (SELECT anchorOccurrence.anchorDate AS dates FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND candidatePerformed=1 AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate GROUP BY candidateOccurrenceId)" onPrep:v8 onRow:v7 onError:v5];
}

void __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v12 = a2;
  uint64_t v4 = [v3 anchorEventIdentifier];
  uint64_t v5 = (void *)v4;
  id v6 = @"%";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  [v12 bindNamedParam:":candidateId" toNSString:*(void *)(a1 + 40)];
  double v8 = [*(id *)(a1 + 32) anchorTypeString];
  [v12 bindNamedParam:":anchorType" toNSString:v8];

  [v12 bindNamedParam:":anchorEventIdentifier" toNSString:v7];
  id v9 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v10, "integerValue"));

  [*(id *)(*(void *)(a1 + 48) + 16) timeIntervalSince1970];
  [v12 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v11];
}

uint64_t __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (int64_t)numUniqueAnchorOccurrencesForGenericCandidateId:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke;
  v13[3] = &unk_1E68B0E08;
  void v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v16 = &v17;
  [(_ATXDataStore *)store _doSync:v13];
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_2;
  v8[3] = &unk_1E68AED38;
  id v9 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_3;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_4;
  v5[3] = &unk_1E68AD250;
  id v6 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:@"SELECT COUNT(DISTINCT anchorOccurrence.anchorDate) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND candidatePerformed=1 AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate >= :oldestAllowedAnchorDate" onPrep:v8 onRow:v7 onError:v5];
}

void __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v12 = a2;
  uint64_t v4 = [v3 anchorEventIdentifier];
  uint64_t v5 = (void *)v4;
  id v6 = @"%";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  [v12 bindNamedParam:":candidateId" toNSString:*(void *)(a1 + 40)];
  double v8 = [*(id *)(a1 + 32) anchorTypeString];
  [v12 bindNamedParam:":anchorType" toNSString:v8];

  [v12 bindNamedParam:":anchorEventIdentifier" toNSString:v7];
  id v9 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v10, "integerValue"));

  [*(id *)(*(void *)(a1 + 48) + 16) timeIntervalSince1970];
  [v12 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v11];
}

uint64_t __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __89__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForGenericCandidateId_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)candidateTypeForCandidateId:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__96;
  uint64_t v17 = __Block_byref_object_dispose__96;
  id v18 = (id)objc_opt_new();
  store = self->_store;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke;
  v10[3] = &unk_1E68AD278;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v12 = &v13;
  [(_ATXDataStore *)store _doSync:v10];
  if ((unint64_t)[(id)v14[5] count] < 2)
  {
    double v8 = [(id)v14[5] firstObject];
  }
  else
  {
    id v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper candidateTypeForCandidateId:]();
    }

    double v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT DISTINCT candidateType FROM anchorModelTrainingData WHERE candidateId = ?" onPrep:v6 onRow:v5 onError:v3];
}

uint64_t __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 getNSStringForColumn:0];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (void)populateCachedCountsForCandidateIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
  id v6 = BiomeLibrary();
  id v7 = [v6 App];
  double v8 = [v7 InFocus];
  id v9 = objc_msgSend(v8, "atx_publisherFromStartDate:", v5);
  id v10 = [v9 mapWithTransform:&__block_literal_global_335];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_2;
  v30[3] = &unk_1E68B0200;
  id v11 = v4;
  id v31 = v11;
  id v12 = [v10 filterWithIsIncluded:v30];

  uint64_t v13 = [[ATXCachedCandidateCounter alloc] initWithCandidateIdPublisher:v12];
  cachedAppLaunchCounter = self->_cachedAppLaunchCounter;
  self->_cachedAppLaunchCounter = v13;

  [(ATXCachedCandidateCounter *)self->_cachedAppLaunchCounter populateCache];
  uint64_t v15 = BiomeLibrary();
  id v16 = [v15 UserFocus];
  uint64_t v17 = [v16 ComputedMode];
  id v18 = objc_msgSend(v17, "atx_publisherFromStartDate:", v5);
  uint64_t v19 = [v18 mapWithTransform:&__block_literal_global_339];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  long long v27 = __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_4;
  uint64_t v28 = &unk_1E68B0200;
  id v29 = v11;
  id v20 = v11;
  uint64_t v21 = [v19 filterWithIsIncluded:&v25];

  id v22 = [ATXCachedCandidateCounter alloc];
  uint64_t v23 = -[ATXCachedCandidateCounter initWithCandidateIdPublisher:](v22, "initWithCandidateIdPublisher:", v21, v25, v26, v27, v28);
  cachedModeCounter = self->_cachedModeCounter;
  self->_cachedModeCounter = v23;

  [(ATXCachedCandidateCounter *)self->_cachedModeCounter populateCache];
}

id __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXAnchorModelDataStoreWrapper candidateIdFromAppLaunchBiomeEvent:a2];
}

uint64_t __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

id __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[ATXAnchorModelDataStoreWrapper candidateIdFromModeBiomeEvent:a2];
}

uint64_t __70__ATXAnchorModelDataStoreWrapper_populateCachedCountsForCandidateIds___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (int64_t)numCandidateOccurrencesInAllContextsForCandidate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXAnchorModelDataStoreWrapper *)self candidateTypeForCandidateId:v4];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isEqualToString:@"action"])
    {
      id v7 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:]();
      }

      int64_t v8 = [(ATXAnchorModelDataStoreWrapper *)self numActionOccurrencesInAllContextsForActionId:v4];
LABEL_22:
      int64_t v10 = v8;
      goto LABEL_23;
    }
    if ([v6 isEqualToString:@"app"])
    {
      id v11 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:]();
      }

      int64_t v8 = [(ATXAnchorModelDataStoreWrapper *)self numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:v4];
      goto LABEL_22;
    }
    if ([v6 isEqualToString:@"mode"])
    {
      id v12 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.4();
      }

      int64_t v8 = [(ATXAnchorModelDataStoreWrapper *)self numModeOccurrencesInAllContextsForModeId:v4];
      goto LABEL_22;
    }
    int v13 = [v6 isEqualToString:@"linkaction"];
    id v14 = __atxlog_handle_anchor();
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.5();
      }

      int64_t v8 = [(ATXAnchorModelDataStoreWrapper *)self numLinkActionOccurrencesInAllContextsForCandidateId:v4];
      goto LABEL_22;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.6();
    }
  }
  else
  {
    id v9 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:]();
    }
  }
  int64_t v10 = 0;
LABEL_23:

  return v10;
}

- (int64_t)numCandidateOccurrencesInAllContextsForCandidateType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"action"])
  {
    uint64_t v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:]();
    }

    int64_t v6 = [(ATXAnchorModelDataStoreWrapper *)self numActionOccurrencesInAllContexts];
LABEL_17:
    int64_t v12 = v6;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"app"])
  {
    id v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:]();
    }

    int64_t v6 = [(ATXAnchorModelDataStoreWrapper *)self numAppLaunchOccurrencesInAllContexts];
    goto LABEL_17;
  }
  if ([v4 isEqualToString:@"mode"])
  {
    int64_t v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.4();
    }

    int64_t v6 = [(ATXAnchorModelDataStoreWrapper *)self numModeOccurrencesInAllContexts];
    goto LABEL_17;
  }
  int v9 = [v4 isEqualToString:@"linkaction"];
  int64_t v10 = __atxlog_handle_anchor();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidate:].cold.4();
    }

    int64_t v6 = [(ATXAnchorModelDataStoreWrapper *)self numLinkActionOccurrencesInAllContexts];
    goto LABEL_17;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[ATXAnchorModelDataStoreWrapper numCandidateOccurrencesInAllContextsForCandidateType:].cold.5();
  }

  int64_t v12 = 0;
LABEL_18:

  return v12;
}

- (int64_t)numActionOccurrencesInAllContextsForActionId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  int64_t v6 = [v5 dateByAddingTimeInterval:-1814400.0];
  id v7 = +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:v4];
  if (v7)
  {
    store = self->_store;
    id v9 = [NSString alloc];
    int64_t v10 = [v7 bundleId];
    id v11 = [v7 actionType];
    int64_t v12 = (void *)[v9 initWithFormat:@"%@:%@", v10, v11];
    int64_t v13 = -[_ATXDataStore numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:](store, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v12, [v7 paramHash], v6, v5);
  }
  else
  {
    id v14 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper numActionOccurrencesInAllContextsForActionId:]();
    }

    int64_t v13 = 0;
  }

  return v13;
}

- (int64_t)numActionOccurrencesInAllContexts
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache objectForKeyedSubscript:@"action"];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    int64_t v6 = objc_opt_new();
    id v7 = [v6 dateByAddingTimeInterval:-1814400.0];
    int64_t v8 = [(_ATXDataStore *)self->_store numActionKeyOccurrencesBetweenStartDate:v7 endDate:v6];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int64_t v5 = 0;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          int64_t v13 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          v5 += [v13 integerValue];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    else
    {
      int64_t v5 = 0;
    }
    id v14 = [NSNumber numberWithInteger:v5];
    [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache setObject:v14 forKeyedSubscript:@"action"];
  }
  return v5;
}

- (int64_t)numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  cachedAppLaunchCounter = self->_cachedAppLaunchCounter;
  id v4 = a3;
  if (cachedAppLaunchCounter)
  {
    int64_t v5 = [(ATXCachedCandidateCounter *)cachedAppLaunchCounter countForCandidate:v4];
  }
  else
  {
    int64_t v6 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:]();
    }

    id v7 = objc_opt_new();
    int64_t v8 = [v7 dateByAddingTimeInterval:-1814400.0];
    uint64_t v9 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:v4];
    uint64_t v10 = objc_opt_new();
    v14[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    int64_t v12 = [v10 fetchEventIdentifierCountsBetweenStartDate:v8 andEndDate:v7 withPredicates:v11];
    int64_t v5 = [v12 countForObject:v4];

    id v4 = v7;
  }

  return v5;
}

- (int64_t)numAppLaunchOccurrencesInAllContexts
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache objectForKeyedSubscript:@"app"];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    int64_t v6 = objc_opt_new();
    id v7 = [v6 dateByAddingTimeInterval:-1814400.0];
    int64_t v8 = objc_opt_new();
    uint64_t v9 = [v8 fetchEventIdentifierCountsBetweenStartDate:v7 andEndDate:v6 withPredicates:MEMORY[0x1E4F1CBF0]];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      int64_t v5 = 0;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v5 += objc_msgSend(v10, "countForObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    else
    {
      int64_t v5 = 0;
    }

    uint64_t v15 = [NSNumber numberWithInteger:v5];
    [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache setObject:v15 forKeyedSubscript:@"app"];
  }
  return v5;
}

- (int64_t)numModeOccurrencesInAllContextsForModeId:(id)a3
{
  id v4 = a3;
  cachedModeCounter = self->_cachedModeCounter;
  if (cachedModeCounter)
  {
    int64_t v6 = [(ATXCachedCandidateCounter *)cachedModeCounter countForCandidate:v4];
  }
  else
  {
    id v7 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper numModeOccurrencesInAllContextsForModeId:]();
    }

    int64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
    uint64_t v9 = +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:v4];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    id v10 = BiomeLibrary();
    uint64_t v11 = [v10 UserFocus];
    uint64_t v12 = [v11 ComputedMode];
    uint64_t v13 = objc_msgSend(v12, "atx_publisherFromStartDate:", v8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke;
    v19[3] = &unk_1E68AF140;
    id v14 = v9;
    id v20 = v14;
    uint64_t v15 = [v13 filterWithIsIncluded:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke_3;
    v18[3] = &unk_1E68AC690;
    void v18[4] = &v21;
    id v16 = (id)[v15 sinkWithCompletion:&__block_literal_global_350 receiveInput:v18];

    int64_t v6 = v22[3];
    _Block_object_dispose(&v21, 8);
  }
  return v6;
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  int64_t v5 = [v4 mode];
  int64_t v6 = [*(id *)(a1 + 32) modeUUID];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [v3 eventBody];
    int v8 = [v7 starting];
    uint64_t v9 = v8 ^ [*(id *)(a1 + 32) isStart] ^ 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __75__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContextsForModeId___block_invoke_3(uint64_t result)
{
  return result;
}

- (int64_t)numModeOccurrencesInAllContexts
{
  id v3 = [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache objectForKeyedSubscript:@"mode"];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    int64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    id v7 = BiomeLibrary();
    int v8 = [v7 UserFocus];
    uint64_t v9 = [v8 ComputedMode];
    id v10 = objc_msgSend(v9, "atx_publisherFromStartDate:", v6);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __65__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContexts__block_invoke_2;
    v14[3] = &unk_1E68AC690;
    void v14[4] = &v15;
    id v11 = (id)[v10 sinkWithCompletion:&__block_literal_global_353_0 receiveInput:v14];

    uint64_t v12 = [NSNumber numberWithInteger:v16[3]];
    [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache setObject:v12 forKeyedSubscript:@"mode"];

    int64_t v5 = v16[3];
    _Block_object_dispose(&v15, 8);
  }
  return v5;
}

uint64_t __65__ATXAnchorModelDataStoreWrapper_numModeOccurrencesInAllContexts__block_invoke_2(uint64_t result)
{
  return result;
}

- (int64_t)numLinkActionOccurrencesInAllContextsForCandidateId:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
  int64_t v5 = +[ATXAnchorModelDataStoreWrapper linkActionDetailsFromLinkActionCandidateId:v3];
  id v20 = 0;
  int64_t v6 = +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:v4 toDate:0 error:&v20];
  id v7 = v20;
  if (v7)
  {
    int v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXAnchorModelDataStoreWrapper numLinkActionOccurrencesInAllContextsForCandidateId:]();
    }

    int64_t v9 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke;
    v14[3] = &unk_1E68AF140;
    id v15 = v5;
    id v10 = [v6 filterWithIsIncluded:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke_3;
    v13[3] = &unk_1E68AC690;
    void v13[4] = &v16;
    id v11 = (id)[v10 sinkWithCompletion:&__block_literal_global_356 receiveInput:v13];

    int64_t v9 = v17[3];
    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

uint64_t __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  int64_t v5 = [v4 bundleIdentifier];

  int64_t v6 = [v3 eventBody];

  id v7 = [v6 action];
  int v8 = [v7 identifier];

  int64_t v9 = [*(id *)(a1 + 32) bundleId];
  if ([v5 isEqualToString:v9])
  {
    id v10 = [*(id *)(a1 + 32) actionId];
    uint64_t v11 = [v8 isEqualToString:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __86__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContextsForCandidateId___block_invoke_3(uint64_t result)
{
  return result;
}

- (int64_t)numLinkActionOccurrencesInAllContexts
{
  id v3 = [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache objectForKeyedSubscript:@"mode"];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 integerValue];
  }
  else
  {
    int64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1814400.0];
    id v18 = 0;
    id v7 = +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:v6 toDate:0 error:&v18];
    id v8 = v18;
    if (v8)
    {
      int64_t v9 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXAnchorModelDataStoreWrapper numLinkActionOccurrencesInAllContextsForCandidateId:]();
      }

      int64_t v5 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      id v15 = &v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __71__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContexts__block_invoke_2;
      v13[3] = &unk_1E68AC690;
      void v13[4] = &v14;
      id v10 = (id)[v7 sinkWithCompletion:&__block_literal_global_358 receiveInput:v13];
      uint64_t v11 = [NSNumber numberWithInteger:v15[3]];
      [(NSMutableDictionary *)self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache setObject:v11 forKeyedSubscript:@"mode"];

      int64_t v5 = v15[3];
      _Block_object_dispose(&v14, 8);
    }
  }
  return v5;
}

uint64_t __71__ATXAnchorModelDataStoreWrapper_numLinkActionOccurrencesInAllContexts__block_invoke_2(uint64_t result)
{
  return result;
}

- (int64_t)numCandidateOccurrencesInAnchorContextForCandidate:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke;
  v13[3] = &unk_1E68B0E08;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v16 = &v17;
  [(_ATXDataStore *)store _doSync:v13];
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_2;
  v8[3] = &unk_1E68AED38;
  id v9 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_3;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4;
  v5[3] = &unk_1E68AD250;
  id v6 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate" onPrep:v8 onRow:v7 onError:v5];
}

void __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = a2;
  [v11 bindNamedParam:":candidateId" toNSString:v3];
  uint64_t v4 = [*(id *)(a1 + 40) anchorTypeString];
  [v11 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 40) anchorEventIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v11 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  id v8 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  [*(id *)(*(void *)(a1 + 48) + 16) timeIntervalSince1970];
  [v11 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v10];
}

uint64_t __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (int64_t)numCandidateOccurrencesInAnchorContextForCandidateType:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  store = self->_store;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke;
  v13[3] = &unk_1E68B0E08;
  void v13[4] = self;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v16 = &v17;
  [(_ATXDataStore *)store _doSync:v13];
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_2;
  v8[3] = &unk_1E68AED38;
  id v9 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_3;
  v7[3] = &unk_1E68AD228;
  v7[4] = *(void *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4;
  v5[3] = &unk_1E68AD250;
  id v6 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE candidateType=:candidateType AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate" onPrep:v8 onRow:v7 onError:v5];
}

void __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = a2;
  [v11 bindNamedParam:":candidateType" toNSString:v3];
  uint64_t v4 = [*(id *)(a1 + 40) anchorTypeString];
  [v11 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 40) anchorEventIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v11 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  id v8 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  [*(id *)(*(void *)(a1 + 48) + 16) timeIntervalSince1970];
  [v11 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v10];
}

uint64_t __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(ATXAnchorModelDataStoreWrapper *)self uniqueCandidateIdsThatOccurredAfterAnchor:v4 candidateType:@"action"];
  id v7 = [(ATXAnchorModelDataStoreWrapper *)self uniqueCandidateIdsThatOccurredAfterAnchor:v4 candidateType:@"app"];
  id v8 = [(ATXAnchorModelDataStoreWrapper *)self uniqueCandidateIdsThatOccurredAfterAnchor:v4 candidateType:@"mode"];
  id v9 = [(ATXAnchorModelDataStoreWrapper *)self uniqueCandidateIdsThatOccurredAfterAnchor:v4 candidateType:@"linkaction"];

  double v10 = [v6 allObjects];
  [v5 addObjectsFromArray:v10];

  id v11 = [v7 allObjects];
  [v5 addObjectsFromArray:v11];

  uint64_t v12 = [v8 allObjects];
  [v5 addObjectsFromArray:v12];

  uint64_t v13 = [v9 allObjects];
  [v5 addObjectsFromArray:v13];

  return v5;
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3 candidateType:(id)a4
{
  return [(ATXAnchorModelDataStoreWrapper *)self uniqueCandidateIdsThatOccurredAfterAnchor:a3 candidateType:a4 minOccurrences:3];
}

- (id)uniqueCandidateIdsThatOccurredAfterAnchor:(id)a3 candidateType:(id)a4 minOccurrences:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__96;
  uint64_t v25 = __Block_byref_object_dispose__96;
  id v26 = (id)objc_opt_new();
  store = self->_store;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke;
  v15[3] = &unk_1E68B4BD8;
  void v15[4] = self;
  uint64_t v16 = @"SELECT candidateId FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType=anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate=anchorOccurrence.anchorDate WHERE anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND candidatePerformed=1 AND secondsSinceAnchor<:secondsSinceAnchor AND candidateType=:candidateType AND anchorOccurrence.anchorDate>:anchorDate GROUP BY candidateId HAVING COUNT(candidateId) >= :minOccurrences";
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  uint64_t v19 = &v21;
  int64_t v20 = a5;
  id v18 = v12;
  [(_ATXDataStore *)store _doSync:v15];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_2;
  v9[3] = &unk_1E68AE710;
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v5;
  uint64_t v13 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_3;
  v8[3] = &unk_1E68AD228;
  void v8[4] = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4;
  v6[3] = &unk_1E68AD250;
  id v7 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v9 onRow:v8 onError:v6];
}

void __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v11 = a2;
  id v4 = [v3 anchorTypeString];
  [v11 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 32) anchorEventIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v11 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  id v8 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  [v11 bindNamedParam:":candidateType" toNSString:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 48) + 24) timeIntervalSince1970];
  [v11 bindNamedParam:":anchorDate" toInt64:(uint64_t)v10];
  [v11 bindNamedParam:":minOccurrences" toInteger:*(void *)(a1 + 56)];
}

uint64_t __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v3 = [a2 getNSStringForColumn:0];
  [v2 addObject:v3];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)secondsAfterAnchorWhenCandidateOccurredForAnchor:(id)a3 candidateId:(id)a4 onlyConsiderFirstOccurrencePerAnchor:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__96;
  uint64_t v25 = __Block_byref_object_dispose__96;
  id v26 = (id)objc_opt_new();
  double v10 = @"SELECT secondsSinceAnchor FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate ORDER BY secondsSinceAnchor ASC";
  store = self->_store;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke;
  v16[3] = &unk_1E68B1090;
  if (v5) {
    double v10 = @"SELECT secondsSinceAnchor FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorOccurrence.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate GROUP BY anchorOccurrence.anchorDate ORDER BY secondsSinceAnchor ASC";
  }
  void v16[4] = self;
  id v17 = v10;
  id v12 = v9;
  id v18 = v12;
  id v13 = v8;
  id v19 = v13;
  int64_t v20 = &v21;
  [(_ATXDataStore *)store _doSync:v16];
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_2;
  v9[3] = &unk_1E68AED38;
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_3;
  v8[3] = &unk_1E68AD228;
  void v8[4] = *(void *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4;
  v6[3] = &unk_1E68AD250;
  id v7 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v9 onRow:v8 onError:v6];
}

void __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v11 = a2;
  [v11 bindNamedParam:":candidateId" toNSString:v3];
  id v4 = [*(id *)(a1 + 40) anchorTypeString];
  [v11 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 40) anchorEventIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v11 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  id v8 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  objc_msgSend(v11, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v9, "integerValue"));

  [*(id *)(*(void *)(a1 + 48) + 16) timeIntervalSince1970];
  [v11 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v10];
}

uint64_t __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 getIntegerForColumn:0];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [NSNumber numberWithInteger:v3 & ~(v3 >> 63)];
  [v4 addObject:v5];

  return *MEMORY[0x1E4F93C08];
}

uint64_t __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)scoredActionFromAnchorModelPrediction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 candidateType];
  int v6 = [v5 isEqualToString:@"action"];

  if (!v6)
  {
    id v18 = 0;
    goto LABEL_15;
  }
  id v7 = [v4 candidateId];
  id v8 = +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:v7];

  if (v8)
  {
    uint64_t v9 = [v8 paramHash];
    double v10 = [v4 candidateId];
    int64_t v11 = [(ATXAnchorModelDataStoreWrapper *)self latestAlogIdForCandidateId:v10];

    uint64_t v12 = [(ATXAnchorModelDataStoreWrapper *)self minSlotResolutionParametersFromALogId:v11 paramHash:v9];
    if (v12)
    {
      id v13 = [v4 candidateId];
      id v14 = +[ATXAnchorModelDataStoreWrapper actionKeyFromActionCandidateId:v13];

      if (v14)
      {
        id v15 = [ATXActionPredictionContainer alloc];
        [v4 score];
        *(float *)&double v16 = v16;
        id v17 = [(ATXActionPredictionContainer *)v15 initWithMinimalSlotResolutionParameters:v12 score:v14 actionKey:v16];
        id v18 = [(ATXActionPredictionContainer *)v17 scoredAction];
      }
      else
      {
        id v19 = __atxlog_handle_anchor();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          -[ATXAnchorModelDataStoreWrapper scoredActionFromAnchorModelPrediction:](v4);
        }

        id v18 = 0;
      }

      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v12 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelDataStoreWrapper scoredActionFromAnchorModelPrediction:](v4);
    }
  }
  id v18 = 0;
LABEL_14:

LABEL_15:
  return v18;
}

- (int64_t)latestAlogIdForCandidateId:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  store = self->_store;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke;
  v9[3] = &unk_1E68AD278;
  void v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  int64_t v11 = &v12;
  [(_ATXDataStore *)store _doSync:v9];
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_2;
  v6[3] = &unk_1E68AD200;
  id v7 = *(id *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_3;
  v5[3] = &unk_1E68AD228;
  void v5[4] = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT candidateOccurrenceId FROM anchorModelTrainingData WHERE candidateId=? AND candidatePerformed=1 ORDER BY ID DESC" onPrep:v6 onRow:v5 onError:v3];
}

uint64_t __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bindParam:1 toNSString:*(void *)(a1 + 32)];
}

uint64_t __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [a2 getInt64ForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)minSlotResolutionParametersFromALogId:(int64_t)a3 paramHash:(int64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int64_t v11 = __Block_byref_object_copy__96;
  uint64_t v12 = __Block_byref_object_dispose__96;
  id v13 = 0;
  store = self->_store;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke;
  v7[3] = &unk_1E68AEAF8;
  v7[6] = a3;
  v7[7] = a4;
  v7[4] = self;
  void v7[5] = &v8;
  [(_ATXDataStore *)store _doSync:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) db];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_2;
  v6[3] = &__block_descriptor_48_e29_v16__0___PASSqliteStatement_8l;
  uint64_t v3 = a1[7];
  uint64_t v7 = a1[6];
  uint64_t v8 = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3;
  v5[3] = &unk_1E68B4C00;
  void v5[4] = a1[5];
  void v5[5] = v7;
  v5[6] = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_385;
  v4[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
  void v4[4] = v7;
  [v2 prepAndRunQuery:@"SELECT uuid, slotHash, paramCount FROM slotSetKey WHERE alogId=? AND paramHash=? LIMIT 1", v6, v5, v4 onPrep onRow onError];
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindParam:1 toInt64:v3];
  [v4 bindParam:2 toInt64:*(void *)(a1 + 40)];
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 getNSDataForColumn:0];
  if ([v4 length] == 16)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));
    uint64_t v6 = [v3 getInt64ForColumn:1];
    uint64_t v7 = [v3 getInt64ForColumn:2];
    uint64_t v24 = [ATXMinimalSlotResolutionParameters alloc];
    uint64_t v8 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    uint64_t v9 = [v8 unsignedIntegerValue];
    uint64_t v10 = [NSNumber numberWithLongLong:v6];
    uint64_t v11 = [v10 unsignedIntegerValue];
    uint64_t v12 = [NSNumber numberWithLongLong:v7];
    uint64_t v13 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:](v24, "initWithParameterHash:slotHash:uuid:paramCount:", v9, v11, v5, [v12 unsignedIntegerValue]);
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    id v5 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3_cold_1(a1, v5, v16, v17, v18, v19, v20, v21);
    }
  }

  uint64_t v22 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v22;
}

uint64_t __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_385(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_385_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (int64_t)numCandidateIdOccurrencesInJointAnchorContext:(id)a3 anchor:(id)a4 anchorMetadata:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v11 = [v10 locationIdentifier];
  uint64_t v12 = @"SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate AND anchorLocalHour=:anchorLocalHour AND anchorLocalDoW=:anchorLocalDoW AND anchorLocation=:anchorLocation";
  if (!v11) {
    uint64_t v12 = @"SELECT COUNT(DISTINCT candidateOccurrenceId) FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorOccurrence.anchorType = anchorModelTrainingData.anchorType AND anchorOccurrence.anchorDate = anchorModelTrainingData.anchorDate WHERE candidateId=:candidateId AND candidatePerformed=1 AND anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND secondsSinceAnchor<:secondsSinceAnchor AND anchorOccurrence.anchorDate>:oldestAllowedAnchorDate AND anchorLocalHour=:anchorLocalHour AND anchorLocalDoW=:anchorLocalDoW AND anchorLocation IS NULL";
  }
  uint64_t v13 = v12;

  store = self->_store;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke;
  v21[3] = &unk_1E68B1068;
  void v21[4] = self;
  uint64_t v15 = v13;
  uint64_t v22 = v15;
  id v16 = v8;
  id v23 = v16;
  id v17 = v9;
  id v24 = v17;
  id v18 = v10;
  id v25 = v18;
  id v26 = &v27;
  [(_ATXDataStore *)store _doSync:v21];
  int64_t v19 = v28[3];

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_2;
  v9[3] = &unk_1E68B1040;
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = *(id *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_3;
  v8[3] = &unk_1E68AD228;
  void v8[4] = *(void *)(a1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4;
  v6[3] = &unk_1E68AD250;
  id v7 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v9 onRow:v8 onError:v6];
}

void __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  [v12 bindNamedParam:":candidateId" toNSString:*(void *)(a1 + 32)];
  uint64_t v3 = [*(id *)(a1 + 40) anchorTypeString];
  [v12 bindNamedParam:":anchorType" toNSString:v3];

  uint64_t v4 = [*(id *)(a1 + 40) anchorEventIdentifier];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = @"%";
  }
  [v12 bindNamedParam:":anchorEventIdentifier" toNSString:v6];

  id v7 = NSNumber;
  [(id)objc_opt_class() secondsOfInfluence];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":secondsSinceAnchor", objc_msgSend(v8, "integerValue"));

  [*(id *)(*(void *)(a1 + 48) + 16) timeIntervalSince1970];
  [v12 bindNamedParam:":oldestAllowedAnchorDate" toInt64:(uint64_t)v9];
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":anchorLocalHour", objc_msgSend(*(id *)(a1 + 56), "hourOfDay"));
  objc_msgSend(v12, "bindNamedParam:toInteger:", ":anchorLocalDoW", objc_msgSend((id)objc_opt_class(), "dayOfWeekIntegerFromATXAnchorModelPBDayOfWeek:", objc_msgSend(*(id *)(a1 + 56), "dayOfWeek")));
  id v10 = [*(id *)(a1 + 56) locationIdentifier];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 56) locationIdentifier];
    [v12 bindNamedParam:":anchorLocation" toNSString:v11];
  }
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_3(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)trainingDataForCandidate:(id)a3 anchor:(id)a4 replacementStringForNilStringValues:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v13 = [(ATXAnchorModelDataStoreWrapper *)self dateOfFirstPositiveCandidateOccurrence:v8 anchor:v9 startDate:v12 limit:30];

  store = self->_store;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke;
  v23[3] = &unk_1E68B0D48;
  v23[4] = self;
  id v24 = v8;
  id v25 = v9;
  id v26 = v13;
  id v27 = v10;
  id v15 = v11;
  id v28 = v15;
  id v16 = v10;
  id v17 = v13;
  id v18 = v9;
  id v19 = v8;
  [(_ATXDataStore *)store _doSync:v23];
  uint64_t v20 = v28;
  id v21 = v15;

  return v21;
}

void __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_2;
  v8[3] = &unk_1E68AED38;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_3;
  v5[3] = &unk_1E68AEB98;
  id v6 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4;
  v3[3] = &unk_1E68AD250;
  id v4 = *(id *)(a1 + 40);
  [v2 prepAndRunQuery:@"SELECT candidateOccurrencesInLast12Hours, candidateOccurrencesInLast24Hours, candidateOccurrencesInLast48Hours, candidateOccurrencesInLast7Days, candidateOccurrencesInLast14Days, candidateOccurrencesInLast28Days, anchorLocalHour, anchorLocalDoW, anchorLocalIsWeekend, anchorLocation, anchorEventIdentifier, candidatePerformed FROM anchorModelTrainingData INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType = anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate = anchorOccurrence.anchorDate WHERE candidateId=:candidateId AND anchorModelTrainingData.anchorType=:anchorType AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier AND anchorOccurrence.anchorDate >= :dateOfFirstPositiveCandidateOccurrence GROUP BY anchorModelTrainingData.anchorDate ORDER BY anchorModelTrainingData.anchorDate DESC LIMIT 30", v8, v5, v3 onPrep onRow onError];
}

void __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = a2;
  [v9 bindNamedParam:":candidateId" toNSString:v3];
  id v4 = [*(id *)(a1 + 40) anchorTypeString];
  [v9 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 40) anchorEventIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v9 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  [*(id *)(a1 + 48) timeIntervalSince1970];
  [v9 bindNamedParam:":dateOfFirstPositiveCandidateOccurrence" toInt64:(uint64_t)v8];
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 0));
  [v4 setObject:v5 forKeyedSubscript:@"candidateOccurrencesInLast12Hours"];

  uint64_t v6 = [v3 getIntegerForColumn:0];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  uint64_t v8 = MEMORY[0x1E4F1CC38];
  if (v6 <= 0) {
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
  }
  [v4 setObject:v9 forKeyedSubscript:@"candidateOccurredInLast12Hours"];
  id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 1));
  [v4 setObject:v10 forKeyedSubscript:@"candidateOccurrencesInLast24Hours"];

  if ([v3 getIntegerForColumn:1] <= 0) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = v8;
  }
  [v4 setObject:v11 forKeyedSubscript:@"candidateOccurredInLast24Hours"];
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 2));
  [v4 setObject:v12 forKeyedSubscript:@"candidateOccurrencesInLast48Hours"];

  if ([v3 getIntegerForColumn:2] <= 0) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = v8;
  }
  [v4 setObject:v13 forKeyedSubscript:@"candidateOccurredInLast48Hours"];
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 3));
  [v4 setObject:v14 forKeyedSubscript:@"candidateOccurrencesInLast7Days"];

  if ([v3 getIntegerForColumn:3] <= 0) {
    uint64_t v15 = v7;
  }
  else {
    uint64_t v15 = v8;
  }
  [v4 setObject:v15 forKeyedSubscript:@"candidateOccurredInLast7Days"];
  id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 4));
  [v4 setObject:v16 forKeyedSubscript:@"candidateOccurrencesInLast14Days"];

  if ([v3 getIntegerForColumn:4] <= 0) {
    uint64_t v17 = v7;
  }
  else {
    uint64_t v17 = v8;
  }
  [v4 setObject:v17 forKeyedSubscript:@"candidateOccurredInLast14Days"];
  id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 5));
  [v4 setObject:v18 forKeyedSubscript:@"candidateOccurrencesInLast28Days"];

  if ([v3 getIntegerForColumn:5] <= 0) {
    uint64_t v19 = v7;
  }
  else {
    uint64_t v19 = v8;
  }
  [v4 setObject:v19 forKeyedSubscript:@"candidateOccurredInLast28Days"];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 6));
  [v4 setObject:v20 forKeyedSubscript:@"anchorLocalHour"];

  id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 7));
  [v4 setObject:v21 forKeyedSubscript:@"anchorLocalDoW"];

  uint64_t v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 8));
  [v4 setObject:v22 forKeyedSubscript:@"anchorLocalIsWeekend"];

  id v23 = [v3 getNSStringForColumn:9];
  id v24 = v23;
  if (!v23) {
    id v24 = *(void **)(a1 + 32);
  }
  [v4 setObject:v24 forKeyedSubscript:@"anchorLocation"];

  id v25 = [v3 getNSStringForColumn:10];
  id v26 = v25;
  if (!v25) {
    id v26 = *(void **)(a1 + 32);
  }
  [v4 setObject:v26 forKeyedSubscript:@"anchorEventIdentifier"];

  id v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "getIntegerForColumn:", 11));
  [v4 setObject:v27 forKeyedSubscript:@"candidatePerformed"];

  id v28 = *(void **)(a1 + 40);
  uint64_t v29 = (void *)[v4 copy];
  [v28 addObject:v29];

  uint64_t v30 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v30;
}

uint64_t __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4_cold_1();
  }

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)dateOfFirstPositiveCandidateOccurrence:(id)a3 anchor:(id)a4 startDate:(id)a5 limit:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v27 = 0;
  id v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__96;
  id v31 = __Block_byref_object_dispose__96;
  id v32 = 0;
  store = self->_store;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke;
  v20[3] = &unk_1E68B10E0;
  v20[4] = self;
  id v21 = @"SELECT MIN(dates)     FROM(        SELECT anchorOccurrence.anchorDate as dates, candidatePerformed as candidatePerformed         FROM anchorModelTrainingData         INNER JOIN anchorOccurrence ON anchorModelTrainingData.anchorType = anchorOccurrence.anchorType AND anchorModelTrainingData.anchorDate = anchorOccurrence.anchorDate         WHERE candidateId=:candidateId         AND anchorModelTrainingData.anchorType=:anchorType         AND anchorOccurrence.anchorEventIdentifier LIKE :anchorEventIdentifier         AND anchorOccurrence.anchorDate >= :startDateTimeInterval         GROUP BY anchorModelTrainingData.anchorDate         ORDER BY anchorModelTrainingData.anchorDate DESC LIMIT :limit        )     WHERE candidatePerformed=1";
  id v14 = v10;
  id v22 = v14;
  id v15 = v11;
  id v23 = v15;
  id v16 = v12;
  id v25 = &v27;
  unint64_t v26 = a6;
  id v24 = v16;
  [(_ATXDataStore *)store _doSync:v20];
  id v17 = v28[5];
  if (!v17)
  {
    objc_storeStrong(v28 + 5, a5);
    id v17 = v28[5];
  }
  id v18 = v17;

  _Block_object_dispose(&v27, 8);
  return v18;
}

void __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) db];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_2;
  v9[3] = &unk_1E68AE710;
  uint64_t v3 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v4 = *(id *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 80);
  id v12 = v4;
  uint64_t v13 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_3;
  v8[3] = &unk_1E68AD228;
  void v8[4] = *(void *)(a1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_4;
  v6[3] = &unk_1E68AD250;
  id v7 = *(id *)(a1 + 48);
  [v2 prepAndRunQuery:v3 onPrep:v9 onRow:v8 onError:v6];
}

void __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = a2;
  [v9 bindNamedParam:":candidateId" toNSString:v3];
  id v4 = [*(id *)(a1 + 40) anchorTypeString];
  [v9 bindNamedParam:":anchorType" toNSString:v4];

  uint64_t v5 = [*(id *)(a1 + 40) anchorEventIdentifier];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"%";
  }
  [v9 bindNamedParam:":anchorEventIdentifier" toNSString:v7];

  [*(id *)(a1 + 48) timeIntervalSince1970];
  [v9 bindNamedParam:":startDateTimeInterval" toInt64:(uint64_t)v8];
  [v9 bindNamedParam:":limit" toInteger:*(void *)(a1 + 56)];
}

uint64_t __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = (double)[a2 getIntegerForColumn:0];
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v3 + -1.0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *MEMORY[0x1E4F93C10];
}

uint64_t __96__ATXAnchorModelDataStoreWrapper_dateOfFirstPositiveCandidateOccurrence_anchor_startDate_limit___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4_cold_1();
  }

  uint64_t v4 = (unsigned __int8 *)MEMORY[0x1E4F93C10];
  return *v4;
}

- (id)appIntentDuetEventFromCandidateId:(id)a3 date:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:v6];
  if (v8)
  {
    id v9 = -[ATXAnchorModelDataStoreWrapper minSlotResolutionParametersFromALogId:paramHash:](self, "minSlotResolutionParametersFromALogId:paramHash:", -[ATXAnchorModelDataStoreWrapper latestAlogIdForCandidateId:](self, "latestAlogIdForCandidateId:", v6), [v8 paramHash]);
    id v18 = [ATXAppIntentDuetEvent alloc];
    id v17 = [v8 bundleId];
    id v16 = [v8 actionType];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "paramHash"));
    v21[0] = v19;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "slotHash"));
    uint64_t v20 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "paramCount"));
    id v14 = [(ATXAppIntentDuetEvent *)v18 initWithBundleId:v17 actionType:v16 parameterHashes:v10 slotSetHashes:v12 paramCount:v13 startDate:v7 endDate:v7 alogId:&unk_1F27F21F0];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)appLaunchDuetEventFromCandidateId:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[ATXAppLaunchDuetEvent alloc] initWithBundleId:v6 startDate:v5 endDate:v5];

  return v7;
}

- (id)modeBiomeEventFromCandidateId:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() modeDetailsFromModeCandidateId:v6];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F50188]);
    id v9 = [v7 modeUUID];
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isStart"));
    id v11 = (void *)[v8 initWithMode:v9 starting:v10 updateReason:0 semanticType:0 updateSource:0 semanticModeIdentifier:0];

    id v12 = objc_alloc(MEMORY[0x1E4F50280]);
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v13 = objc_msgSend(v12, "initWithEventBody:timestamp:", v11);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)linkActionBiomeEventFromCandidateId:(id)a3 date:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() linkActionDetailsFromLinkActionCandidateId:v6];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F72DE0]);
    id v9 = [v7 bundleId];
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v7 linkAction];
    id v12 = [v7 linkAction];
    uint64_t v13 = (void *)[v8 initWithBundleIdentifier:v9 source:0 clientLabel:0 executionUUID:v10 executionDate:v5 action:v11 resolvedAction:v12 actionOutput:0 predictions:MEMORY[0x1E4F1CBF0]];

    id v14 = objc_alloc(MEMORY[0x1E4F50280]);
    [v5 timeIntervalSinceReferenceDate];
    id v15 = objc_msgSend(v14, "initWithEventBody:timestamp:", v13);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)appIntentDuetEventsFromCandidateIds:(id)a3 date:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[ATXAnchorModelDataStoreWrapper appIntentDuetEventFromCandidateId:date:](self, "appIntentDuetEventFromCandidateId:date:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)appLaunchDuetEventsFromCandidateIds:(id)a3 date:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[ATXAnchorModelDataStoreWrapper appLaunchDuetEventFromCandidateId:date:](self, "appLaunchDuetEventFromCandidateId:date:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)modeBiomeEventsFromCandidateIds:(id)a3 date:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[ATXAnchorModelDataStoreWrapper modeBiomeEventFromCandidateId:date:](self, "modeBiomeEventFromCandidateId:date:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)linkActionBiomeEventsFromCandidateIds:(id)a3 date:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[ATXAnchorModelDataStoreWrapper linkActionBiomeEventFromCandidateId:date:](self, "linkActionBiomeEventFromCandidateId:date:", *(void *)(*((void *)&v16 + 1) + 8 * i), v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)actionKeyFromActionCandidateId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 componentsSeparatedByString:@":"];
  if ([v4 count] == 3)
  {
    id v5 = [NSString alloc];
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v4 objectAtIndexedSubscript:1];
    id v8 = (void *)[v5 initWithFormat:@"%@:%@", v6, v7];
  }
  else
  {
    id v9 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[ATXAnchorModelDataStoreWrapper actionKeyFromActionCandidateId:]();
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)actionDetailsFromActionCandidateId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 componentsSeparatedByString:@":"];
  if ([v4 count] == 3)
  {
    id v5 = [ATXAnchorModelActionDetails alloc];
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v4 objectAtIndexedSubscript:1];
    id v8 = [v4 objectAtIndexedSubscript:2];
    id v9 = -[ATXAnchorModelActionDetails initWithBundleId:actionType:paramHash:](v5, "initWithBundleId:actionType:paramHash:", v6, v7, [v8 longLongValue]);
  }
  else
  {
    uint64_t v10 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[ATXAnchorModelDataStoreWrapper actionDetailsFromActionCandidateId:]();
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)modeDetailsFromModeCandidateId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 componentsSeparatedByString:@":"];
  if ([v4 count] == 2)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v4 objectAtIndexedSubscript:1];
    uint64_t v7 = [v6 BOOLValue];

    id v8 = [[ATXAnchorModelModeDetails alloc] initWithModeUUID:v5 isStart:v7];
  }
  else
  {
    id v9 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:]();
    }

    id v8 = 0;
  }

  return v8;
}

+ (id)linkActionDetailsFromLinkActionCandidateId:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 componentsSeparatedByString:@":"];
  if ([v4 count] == 3)
  {
    id v5 = [ATXAnchorModelLinkActionDetails alloc];
    id v6 = [v4 objectAtIndexedSubscript:0];
    uint64_t v7 = [v4 objectAtIndexedSubscript:1];
    id v8 = [v4 objectAtIndexedSubscript:2];
    id v9 = [(ATXAnchorModelLinkActionDetails *)v5 initWithBundleID:v6 actionId:v7 linkActionEncodedString:v8];
  }
  else
  {
    uint64_t v10 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      +[ATXAnchorModelDataStoreWrapper linkActionDetailsFromLinkActionCandidateId:]();
    }

    id v9 = 0;
  }

  return v9;
}

+ (id)candidateIdFromAppIntentDuetEvent:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 bundleId];
  uint64_t v7 = [v4 actionType];
  id v8 = [v4 parameterHashes];

  id v9 = [v8 firstObject];
  uint64_t v10 = (void *)[v5 initWithFormat:@"%@:%@:%lld", v6, v7, objc_msgSend(v9, "longLongValue")];

  return v10;
}

- (id)candidateIdFromActionMetadata:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 appLaunchMetadata];
  uint64_t v7 = [v6 bundleId];
  id v8 = [v4 actionKeyMetadata];
  id v9 = [v8 actionType];
  uint64_t v10 = [v4 actionUUIDMetadatas];

  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = (void *)[v5 initWithFormat:@"%@:%@:%lld", v7, v9, objc_msgSend(v11, "actionUUID")];

  return v12;
}

+ (id)candidateIdFromAppLaunchDuetEvent:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 bundleId];

  uint64_t v7 = (void *)[v5 initWithFormat:@"%@", v6];
  return v7;
}

+ (id)candidateIdFromAppLaunchBiomeEvent:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 eventBody];

  uint64_t v7 = [v6 bundleID];
  id v8 = (void *)[v5 initWithFormat:@"%@", v7];

  return v8;
}

+ (id)candidateIdFromModeBiomeEvent:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 eventBody];
  uint64_t v7 = [v6 mode];
  id v8 = NSNumber;
  id v9 = [v4 eventBody];

  uint64_t v10 = objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "starting"));
  uint64_t v11 = (void *)[v5 initWithFormat:@"%@:%@", v7, v10];

  return v11;
}

+ (id)candidateIdFromLinkActionBiomeEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 eventBody];
  id v5 = [v4 action];
  id v6 = +[ATXAnchorModelLinkActionDetails encodedStringForLinkAction:v5];

  if (v6)
  {
    id v7 = [NSString alloc];
    id v8 = [v3 eventBody];
    id v9 = [v8 bundleIdentifier];
    uint64_t v10 = [v3 eventBody];
    uint64_t v11 = [v10 action];
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = (void *)[v7 initWithFormat:@"%@:%@:%@", v9, v12, v6];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)candidateIdFromBiomeEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v7 = [a1 candidateIdFromModeBiomeEvent:v4];
LABEL_7:
    uint64_t v12 = (__CFString *)v7;
    goto LABEL_8;
  }
  id v8 = [v4 eventBody];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  uint64_t v10 = [v4 eventBody];
  uint64_t v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 bundleID];

    goto LABEL_8;
  }
  objc_opt_class();
  char v13 = objc_opt_isKindOfClass();

  if (v13)
  {
    uint64_t v7 = [a1 candidateIdFromLinkActionBiomeEvent:v4];
    goto LABEL_7;
  }
  id v15 = __atxlog_handle_blending();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    +[ATXAnchorModelDataStoreWrapper candidateIdFromBiomeEvent:]();
  }

  uint64_t v12 = &stru_1F2740B58;
LABEL_8:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModeCounter, 0);
  objc_storeStrong((id *)&self->_cachedAppLaunchCounter, 0);
  objc_storeStrong((id *)&self->_numCandidateOccurrencesInAllContextsForCandidateTypeCache, 0);
  objc_storeStrong((id *)&self->_dateOfOldestAllowedCandidateOccurrenceForCandidateGeneration, 0);
  objc_storeStrong((id *)&self->_twentyOneDaysAgo, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "AnchorModel: ATXDATASTORE. Fetching the most recent recorded anchor event for the following anchor: %@", v2, v3, v4, v5, v6);
}

void __89__ATXAnchorModelDataStoreWrapper_timestampOfMostRecentRecordedAnchorOccurrenceForAnchor___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the most recent recorded event for the following anchor: %@. Error: %@");
}

- (void)updateOrInsertActionTrainingSample:featurizedAction:actionOccurred:actionEngaged:anchorEvent:anchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "AnchorModel: Trying to add action event to anchorModelTrainingData table with an actionEvent that doesn't have an associated alogId. actionEvent: %@", v2, v3, v4, v5, v6);
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "AnchorModel: ATXDATASTORE. Running insertion query! candidateFeatures:%@", v2, v3, v4, v5, 2u);
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_40_cold_1(id *a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 objectForKeyedSubscript:@"candidateId"];
  uint8_t v6 = [*a2 anchorTypeString];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "Inserting action training sample for anchor model. candidateOccurrenceId must not be nil. candidateId: %@, anchorType: %@", (uint8_t *)&v7, 0x16u);
}

void __113__ATXAnchorModelDataStoreWrapper_updateOrInsertCandidateEventToDatabaseWithCandidateFeatures_anchor_anchorEvent___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error inserting training sample record: %{public}@", v2, v3, v4, v5, v6);
}

void __82__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorModelTrainingResults_anchor___block_invoke_104_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [*a1 anchor];
  int v7 = [v6 anchorTypeString];
  id v8 = [*a1 candidateId];
  uint64_t v9 = [*a1 candidateClassifierType];
  int v10 = 138413058;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  char v13 = v8;
  __int16 v14 = 2048;
  uint64_t v15 = v9;
  __int16 v16 = 2112;
  uint64_t v17 = a2;
  _os_log_fault_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_FAULT, "Skipping writing Anchor Model training result to ATXDataStore because of error while archiving candidate classifier. Anchor: %@, CandidateId: %@, Classifier Type: %ld. Error: %@", (uint8_t *)&v10, 0x2Au);
}

- (void)insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Anchor type is nil", v2, v3, v4, v5, v6);
}

- (void)insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Candidate id is nil", v2, v3, v4, v5, v6);
}

void __114__ATXAnchorModelDataStoreWrapper_insertAnchorSuggestionOutcome_date_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error inserting anchorModelSuggestionOutcomes record: %{public}@", v2, v3, v4, v5, v6);
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "anchorModelSuggestionOutcomes returned a negative count", v2, v3, v4, v5, v6);
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "anchorModelSuggestionOutcomes returned an out-of-bounds outcome", v2, v3, v4, v5, v6);
}

void __110__ATXAnchorModelDataStoreWrapper_assignMetricsForTrainingResult_anchorType_anchorEventIdentifier_candidateId___block_invoke_141_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error fetching anchorModelSuggestionOutcomes: %{public}@", v2, v3, v4, v5, v6);
}

void __59__ATXAnchorModelDataStoreWrapper_trainingResultsForAnchor___block_invoke_179_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the trainingResultsForAnchor: %@. Error: %@");
}

- (void)dateAnchorModelWasLastTrainedForAnchor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Recovered more than 1 unique training date from the training results for the following anchor: %@", v2, v3, v4, v5, v6);
}

+ (void)linkActionCandidateFeaturesFromLinkActionEvent:actionMetadata:actionOccurred:actionEngaged:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "AnchorModel: ATXDATASTORE. Candidate ID was nil, so returning no features", v2, v3, v4, v5, v6);
}

void __59__ATXAnchorModelDataStoreWrapper_updateOrInsertAnchorType___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error inserting anchor event record: %{public}@", v2, v3, v4, v5, v6);
}

void __57__ATXAnchorModelDataStoreWrapper_updateOrInsertLocation___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error inserting location record: %{public}@", v2, v3, v4, v5, v6);
}

void __80__ATXAnchorModelDataStoreWrapper_insertAnchorOccurrence_anchor_featureMetadata___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error inserting anchor occurrence record: %{public}@", v2, v3, v4, v5, v6);
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_250_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error fetching how many samples we're going to delete the anchorOccurrence table: %{public}@", v2, v3, v4, v5, v6);
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_257_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error deleting samples from the anchorOccurrence table: %{public}@", v2, v3, v4, v5, v6);
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_265_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error fetching how many samples we're going to delete the anchorModelTrainingData table: %{public}@", v2, v3, v4, v5, v6);
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_272_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error deleting samples from the anchorModelTrainingData table: %{public}@", v2, v3, v4, v5, v6);
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_281_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error fetching how many outcomes we're going to delete the anchorModelSuggestionOutcomes table: %{public}@", v2, v3, v4, v5, v6);
}

void __71__ATXAnchorModelDataStoreWrapper_deleteSamplesThatAreMoreThan28DaysOld__block_invoke_2_288_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error deleting suggestion outcomes from the anchorModelSuggestionOutcomes table: %{public}@", v2, v3, v4, v5, v6);
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error deleting bundleIds from anchorModelTrainingData: %{public}@", v2, v3, v4, v5, v6);
}

void __69__ATXAnchorModelDataStoreWrapper_deleteSamplesForBundleIdsNotInList___block_invoke_301_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "error fetching how many samples were deleted due to uninstalled apps: %{public}@", v2, v3, v4, v5, v6);
}

void __75__ATXAnchorModelDataStoreWrapper_historicalAnchorOccurrenceDatesForAnchor___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the historicalAnchorOccurrenceDatesForAnchor: %@. Error: %@");
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "Missing anchor event identifier while in uniqueAnchorEventIdentifiersForAnchor.", v1, 2u);
}

void __72__ATXAnchorModelDataStoreWrapper_uniqueAnchorEventIdentifiersForAnchor___block_invoke_317_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the uniqueAnchorEventIdentifiersForAnchor: %@. Error: %@");
}

void __82__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesForAnchor_candidateId___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the numUniqueAnchorOccurrencesForAnchor: %@. Error: %@");
}

void __118__ATXAnchorModelDataStoreWrapper_numUniqueAnchorOccurrencesWithUniqueCandidateOccurrenceForGenericCandidateId_anchor___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the numUniqueAnchorOccurrencesForCandidate: %@. Error: %@");
}

- (void)candidateTypeForCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Encountered candidateId that is associated with multiple candidate types. candidateId: %@, candidateTypes: %@");
}

void __62__ATXAnchorModelDataStoreWrapper_candidateTypeForCandidateId___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the candidateTypeForCandidateId: %@. Error: %@");
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Unable to determine candidateType for candidate: %@", v2, v3, v4, v5, v6);
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Fetching action occurrences in all contexts", v2, v3, v4, v5, v6);
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Fetching app launch occurrences in all contexts", v2, v3, v4, v5, v6);
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Fetching mode changes in all contexts", v2, v3, v4, v5, v6);
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "Fetching Link actions in all contexts", v2, v3, v4, v5, v6);
}

- (void)numCandidateOccurrencesInAllContextsForCandidate:.cold.6()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "Returning 0 for numCandidateOccurrencesInAllContextsForCandidate: %@ because the candidateType was not a known value. candidateType: %@", v2, 0x16u);
}

- (void)numCandidateOccurrencesInAllContextsForCandidateType:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Returning 0 for numCandidateOccurrencesInAllContextsForCandidateType because the candidateType was not a known value. candidateType: %@", v2, v3, v4, v5, v6);
}

- (void)numActionOccurrencesInAllContextsForActionId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Unable to get actionDetails for candidateId: %@", v2, v3, v4, v5, v6);
}

- (void)numAppLaunchOccurrencesInAllContextsForAppLaunchCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "App Launch Cached Counter is unexpectedly nil. Falling back to CoreDuet", v2, v3, v4, v5, v6);
}

- (void)numModeOccurrencesInAllContextsForModeId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Focus Mode Cached Counter is unexpectedly nil. Falling back to Biome", v2, v3, v4, v5, v6);
}

- (void)numLinkActionOccurrencesInAllContextsForCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error when fetching Link transcript publisher: %@", v2, v3, v4, v5, v6);
}

void __92__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidate_anchor___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the numCandidateOccurrencesInAnchorContextForCandidate: %@. Error: %@");
}

void __96__ATXAnchorModelDataStoreWrapper_numCandidateOccurrencesInAnchorContextForCandidateType_anchor___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the numCandidateOccurrencesInAnchorContextForCandidateType: %@. Error: %@");
}

void __105__ATXAnchorModelDataStoreWrapper_uniqueCandidateIdsThatOccurredAfterAnchor_candidateType_minOccurrences___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the uniqueCandidateIdsThatOccurredAfterAnchor: %@. Error: %@");
}

void __132__ATXAnchorModelDataStoreWrapper_secondsAfterAnchorWhenCandidateOccurredForAnchor_candidateId_onlyConsiderFirstOccurrencePerAnchor___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the secondsAfterAnchorWhenCandidateOccurredForAnchor: %@. Error: %@");
}

- (void)scoredActionFromAnchorModelPrediction:(void *)a1 .cold.1(void *a1)
{
  os_log_t v1 = [a1 candidateId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to get actionDetails for candidateId: %@", v4, v5, v6, v7, v8);
}

- (void)scoredActionFromAnchorModelPrediction:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 candidateId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D0FA3000, v2, v3, "Unable to get actionKey for candidateId: %@", v4, v5, v6, v7, v8);
}

void __61__ATXAnchorModelDataStoreWrapper_latestAlogIdForCandidateId___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the latestAlogIdForCandidateId: %@. Error: %@");
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__ATXAnchorModelDataStoreWrapper_minSlotResolutionParametersFromALogId_paramHash___block_invoke_385_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Unable to fetch minimalSlotResolutionParametersFromALogId %lld. Error: %@");
}

void __102__ATXAnchorModelDataStoreWrapper_numCandidateIdOccurrencesInJointAnchorContext_anchor_anchorMetadata___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the numCandidateIdOccurrencesInJointAnchorContext: %@. Error %@");
}

void __102__ATXAnchorModelDataStoreWrapper_trainingDataForCandidate_anchor_replacementStringForNilStringValues___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "Error fetching the trainingDataForCandidate: %@. Error: %@");
}

+ (void)actionKeyFromActionCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get ActionKey from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
}

+ (void)actionDetailsFromActionCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get actionDetails from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
}

+ (void)modeDetailsFromModeCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get modeDetails from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
}

+ (void)linkActionDetailsFromLinkActionCandidateId:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D0FA3000, v0, v1, "Anchor Model Data Store Wrapper: Attempted to get linkActionDetails from candidateId that didn't have 3 components. CandidateId: %@", v2, v3, v4, v5, v6);
}

+ (void)candidateIdFromBiomeEvent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0FA3000, v0, v1, "Unknown biome event type, cannot fetch candidateId", v2, v3, v4, v5, v6);
}

@end