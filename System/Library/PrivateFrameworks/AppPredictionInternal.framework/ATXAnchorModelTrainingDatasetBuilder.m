@interface ATXAnchorModelTrainingDatasetBuilder
+ (id)fetchAnchorEvents:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (ATXAnchorModelTrainingDatasetBuilder)init;
- (ATXAnchorModelTrainingDatasetBuilder)initWithActivity:(id)a3;
- (ATXAnchorModelTrainingDatasetBuilder)initWithXPCActivity:(id)a3 dataStoreWrapper:(id)a4 harvester:(id)a5;
- (BOOL)anchorOccurredLongEnoughAgo:(id)a3 anchor:(id)a4;
- (double)secondsAfterAnchorToCollectPositiveSamples:(id)a3;
- (id)actionCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromActions:(id)a4;
- (id)anchorsToIncludeInTrainingData;
- (id)appCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromAppLaunches:(id)a4;
- (id)appLaunchEventsFromNowPlayingStreamForAnchor:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)candidateIdSetFromAppIntentEvents:(id)a3;
- (id)candidateIdSetFromAppLaunchDuetEvents:(id)a3;
- (id)candidateIdSetFromLinkActionEvents:(id)a3;
- (id)candidateIdSetFromModeEvents:(id)a3;
- (id)featurizeActionEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeAppEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5;
- (id)featurizeLinkActionEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5;
- (id)featurizeModeEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5;
- (id)fetchNegativeActionEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveActionEvents:(id)a5;
- (id)fetchNegativeAppEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveAppEvents:(id)a5;
- (id)fetchNegativeLinkActionEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveLinkActionEvents:(id)a5;
- (id)fetchNegativeModeEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveModeEvents:(id)a5;
- (id)fetchNewAnchorEventsForAnchor:(id)a3;
- (id)fetchPositiveActionEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4;
- (id)fetchPositiveAppEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5;
- (id)fetchPositiveLinkActionEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5;
- (id)fetchPositiveModeEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5;
- (id)linkActionCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromLinkActions:(id)a4;
- (id)modeCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromModes:(id)a4;
- (id)queryStartDateForAnchor:(id)a3;
- (id)targetedNegativeActionSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5;
- (id)targetedNegativeAppSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5;
- (id)targetedNegativeLinkActionSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5;
- (id)targetedNegativeModeSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5;
- (int64_t)addActionEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4;
- (int64_t)addAppEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4;
- (int64_t)addCandidateTrainingSamplesToDatabaseForAnchor:(id)a3 anchorEvents:(id)a4;
- (int64_t)addFeaturizedActionToDatabase:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (int64_t)addFeaturizedAppToDatabase:(id)a3 featurizedApp:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (int64_t)addFeaturizedLinkActionToDatabase:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (int64_t)addFeaturizedModeToDatabase:(id)a3 featurizedMode:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8;
- (int64_t)addLinkActionEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4;
- (int64_t)addModeEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4;
- (int64_t)addNewTrainingSamplesToDatabase;
- (int64_t)addNewTrainingSamplesToDatabaseForAnchor:(id)a3;
- (int64_t)addNewTrainingSamplesToDatabaseForAnchorEvent:(id)a3 anchor:(id)a4;
- (unint64_t)cleanupDatasetForPrivacyPreservation;
- (void)addAnchorEventToDatabase:(id)a3 anchor:(id)a4;
- (void)cleanupDatasetForPrivacyPreservation;
@end

@implementation ATXAnchorModelTrainingDatasetBuilder

- (ATXAnchorModelTrainingDatasetBuilder)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self initWithXPCActivity:0 dataStoreWrapper:v3 harvester:v4];

  return v5;
}

- (ATXAnchorModelTrainingDatasetBuilder)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXAnchorModelTrainingDatasetBuilder *)self initWithXPCActivity:v4 dataStoreWrapper:v5 harvester:v6];

  return v7;
}

- (ATXAnchorModelTrainingDatasetBuilder)initWithXPCActivity:(id)a3 dataStoreWrapper:(id)a4 harvester:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXAnchorModelTrainingDatasetBuilder;
  v12 = [(ATXAnchorModelTrainingDatasetBuilder *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_xpcActivity, a3);
    objc_storeStrong((id *)&v13->_dataStoreWrapper, a4);
    objc_storeStrong((id *)&v13->_harvester, a5);
  }

  return v13;
}

- (id)anchorsToIncludeInTrainingData
{
  v2 = +[ATXAnchorModelHyperParameters sharedInstance];
  v3 = [v2 enabledAnchors];
  id v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_180);

  return v4;
}

id __70__ATXAnchorModelTrainingDatasetBuilder_anchorsToIncludeInTrainingData__block_invoke(int a1, NSString *aClassName)
{
  NSClassFromString(aClassName);
  v2 = objc_opt_new();
  return v2;
}

- (unint64_t)cleanupDatasetForPrivacyPreservation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)os_transaction_create();
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "AnchorModel: Cleaning up Anchor Model Database for Privacy Preservation...", (uint8_t *)&v11, 2u);
  }

  unint64_t v5 = [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper deleteSamplesThatAreMoreThan28DaysOld];
  v6 = +[_ATXAppIconState sharedInstance];
  v7 = [v6 allInstalledAppsKnownToSpringBoard];

  if ([v7 count])
  {
    v5 += [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper deleteSamplesForBundleIdsNotInList:v7];
  }
  else
  {
    v8 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelTrainingDatasetBuilder cleanupDatasetForPrivacyPreservation]();
    }
  }
  id v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    unint64_t v12 = v5;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "AnchorModel: Done cleaning up Anchor Model Database for Privacy Preservation. Deleted %lu samples in total.", (uint8_t *)&v11, 0xCu);
  }

  return v5;
}

- (int64_t)addNewTrainingSamplesToDatabase
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)os_transaction_create();
  id v4 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "AnchorModel: Harvesting new training samples for Anchor Model and adding them to the database.", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self anchorsToIncludeInTrainingData];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v8 += [(ATXAnchorModelTrainingDatasetBuilder *)self addNewTrainingSamplesToDatabaseForAnchor:v11];
        if ([(ATXXPCActivity *)self->_xpcActivity didDefer])
        {
          unint64_t v12 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v11;
            _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "Deferring adding new training samples right after processing anchor %@ because XPC activity asked for deferral. Not going to process any other anchors for now.", buf, 0xCu);
          }

          goto LABEL_16;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v8 = 0;
  }
LABEL_16:

  return v8;
}

- (int64_t)addNewTrainingSamplesToDatabaseForAnchor:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    int64_t v11 = (int64_t)v4;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "[START] ============= \nAnchorModel: Harvesting training data for %@.", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v6 = [(ATXAnchorModelTrainingDatasetBuilder *)self fetchNewAnchorEventsForAnchor:v4];
  int64_t v7 = [(ATXAnchorModelTrainingDatasetBuilder *)self addCandidateTrainingSamplesToDatabaseForAnchor:v4 anchorEvents:v6];
  int64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    int64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "AnchorModel: Added %ld new samples for %@. \n============= [END]", (uint8_t *)&v10, 0x16u);
  }

  return v7;
}

- (int64_t)addCandidateTrainingSamplesToDatabaseForAnchor:(id)a3 anchorEvents:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x1D25F6CC0]();
        if ([(ATXAnchorModelTrainingDatasetBuilder *)self shouldCreateTrainingSamplesForAnchorEvent:v13 anchor:v6])
        {
          v10 += [(ATXAnchorModelTrainingDatasetBuilder *)self addNewTrainingSamplesToDatabaseForAnchorEvent:v13 anchor:v6];
          if ([(ATXXPCActivity *)self->_xpcActivity shouldDefer])
          {
            long long v16 = __atxlog_handle_anchor();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v24 = v6;
              __int16 v25 = 2048;
              int64_t v26 = v10;
              __int16 v27 = 2112;
              v28 = v13;
              _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "Deferring adding new training samples while processing anchor %@ because XPC activity asked for deferral. Not going to finish processing this anchor or other anchors for now. We added %lu training samples for this anchor, and the last anchor event we processed was: %@.", buf, 0x20u);
            }

            goto LABEL_19;
          }
        }
        else
        {
          long long v15 = __atxlog_handle_anchor();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v13;
            _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Anchor event does not qualify for producing training samples. Anchor event: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v10 = 0;
  }
LABEL_19:

  return v10;
}

- (BOOL)anchorOccurredLongEnoughAgo:(id)a3 anchor:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [(ATXAnchorModelTrainingDatasetBuilder *)self secondsAfterAnchorToCollectPositiveSamples:v7];
  double v12 = v10 - v11;
  id v13 = objc_opt_class();

  uint64_t v14 = [v13 anchorOccurenceDateFromDuetEvent:v8];

  [v14 timeIntervalSinceReferenceDate];
  double v16 = v15;

  return v16 < v12;
}

- (id)fetchNewAnchorEventsForAnchor:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self queryStartDateForAnchor:v4];
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  id v8 = [v6 fetchAnchorEvents:v4 startDate:v5 endDate:v7];

  return v8;
}

- (int64_t)addNewTrainingSamplesToDatabaseForAnchorEvent:(id)a3 anchor:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Adding new training samples based on anchor event %@", (uint8_t *)&v14, 0xCu);
  }

  int64_t v9 = [(ATXAnchorModelTrainingDatasetBuilder *)self addActionEventsToDatabaseAfterAnchorEvent:v6 anchor:v7];
  int64_t v10 = [(ATXAnchorModelTrainingDatasetBuilder *)self addAppEventsToDatabaseAfterAnchorEvent:v6 anchor:v7];
  int64_t v11 = [(ATXAnchorModelTrainingDatasetBuilder *)self addModeEventsToDatabaseAfterAnchorEvent:v6 anchor:v7];
  int64_t v12 = [(ATXAnchorModelTrainingDatasetBuilder *)self addLinkActionEventsToDatabaseAfterAnchorEvent:v6 anchor:v7];
  [(ATXAnchorModelTrainingDatasetBuilder *)self addAnchorEventToDatabase:v6 anchor:v7];

  return v10 + v9 + v11 + v12;
}

- (void)addAnchorEventToDatabase:(id)a3 anchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder addAnchorEventToDatabase:anchor:]();
  }

  int64_t v9 = objc_opt_new();
  int64_t v10 = [v9 featurizeAnchorEvent:v6 anchor:v7];

  [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper updateOrInsertAnchorEvent:v6 anchor:v7 featureMetadata:v10];
}

+ (id)fetchAnchorEvents:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 earlierDate:v9];

  if (v10 == v8)
  {
    int64_t v12 = [(id)objc_opt_class() fetchAnchorOccurrencesBetweenStartDate:v8 endDate:v9];
  }
  else
  {
    int64_t v11 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "Skipping operation to fetch anchor events since the query startDate (%@) occurred on or after the query endDate (%@).", (uint8_t *)&v14, 0x16u);
    }

    int64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)queryStartDateForAnchor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(ATXAnchorModelDataStoreWrapperProtocol *)self->_dataStoreWrapper timestampOfMostRecentRecordedAnchorOccurrenceForAnchor:v4];
  if (v5 == 0.0)
  {
    id v6 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2048;
      uint64_t v14 = 1296000;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "When computing the query start date for anchor %@, we were unable to fetch the most recent recorded anchor occurrence timestamp. Starting by adding anchor events that were at most %lu seconds ago.", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-1296000.0];
  }
  else
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v5 + 1.0];
  }
  id v8 = (void *)v7;
  id v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = (uint64_t)v8;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Query start date for anchor %@ is %@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (double)secondsAfterAnchorToCollectPositiveSamples:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() secondsOfInfluence];
  double v5 = v4;
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(ATXAnchorModelTrainingDatasetBuilder *)(uint64_t)v3 secondsAfterAnchorToCollectPositiveSamples:v5];
  }

  return v5;
}

- (int64_t)addActionEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  uint64_t v7 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = (uint64_t)v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Adding new action training samples based on anchor event %@", buf, 0xCu);
  }

  uint64_t v8 = [(id)objc_opt_class() candidateQueryStartDateFromDuetEvent:v6];
  id v9 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v6];
  [(id)objc_opt_class() durationOfAnchorEvent:v6];
  v33 = (void *)v8;
  id v10 = -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveActionEventsAfterAnchorDate:durationOfAnchorEvent:](self, "fetchPositiveActionEventsAfterAnchorDate:durationOfAnchorEvent:", v8);
  int v11 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v12;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive action events after the anchor.", buf, 0xCu);
  }
  __int16 v13 = v6;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v10;
  uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    int64_t v16 = 0;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        long long v20 = (void *)MEMORY[0x1D25F6CC0]();
        long long v21 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeActionEvent:v19 anchorOccurrenceDate:v9];
        v16 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedActionToDatabase:v19 featurizedAction:v21 actionOccurred:1 actionEngaged:0 anchorEvent:v13 anchor:v36];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v15);
  }
  else
  {
    int64_t v16 = 0;
  }

  long long v22 = [(ATXAnchorModelTrainingDatasetBuilder *)self fetchNegativeActionEventsAfterAnchorDate:v33 anchor:v36 positiveActionEvents:obj];
  v23 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = [v22 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v24;
    _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative action events after the anchor.", buf, 0xCu);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v34 = v22;
  uint64_t v25 = [v34 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v34);
        }
        uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v30 = (void *)MEMORY[0x1D25F6CC0]();
        v31 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeActionEvent:v29 anchorOccurrenceDate:v9];
        v16 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedActionToDatabase:v29 featurizedAction:v31 actionOccurred:0 actionEngaged:0 anchorEvent:v13 anchor:v36];
      }
      uint64_t v26 = [v34 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v26);
  }

  return v16;
}

- (int64_t)addFeaturizedActionToDatabase:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  return 1;
}

- (id)fetchPositiveActionEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4
{
  harvester = self->_harvester;
  id v6 = a3;
  uint64_t v7 = [(ATXAnchorModelEventHarvester *)harvester fetchEventsAfterAnchorOccurrenceDate:v6 withDuetDataProviderClass:objc_opt_class() limit:100000 maxSecondsBeforeAnchor:0 maxSecondsAfterAnchor:(uint64_t)a4 predicates:0];

  return v7;
}

- (id)fetchNegativeActionEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveActionEvents:(id)a5
{
  double v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self targetedNegativeActionSamplesForAnchor:a4 anchorOccurrenceDate:a3 eventsToExclude:a5];
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeActionEventsAfterAnchorDate:anchor:positiveActionEvents:]();
  }

  return v5;
}

- (id)targetedNegativeActionSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8 = a4;
  id v9 = [(ATXAnchorModelTrainingDatasetBuilder *)self actionCandidateIdsToTargetForAnchor:a3 excludeCandidateIdsFromActions:a5];
  id v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:]();
  }

  dataStoreWrapper = self->_dataStoreWrapper;
  uint64_t v12 = [v9 allObjects];
  __int16 v13 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper appIntentDuetEventsFromCandidateIds:v12 date:v8];

  return v13;
}

- (id)actionCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromActions:(id)a4
{
  dataStoreWrapper = self->_dataStoreWrapper;
  id v7 = a4;
  id v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:a3 candidateType:@"action" minOccurrences:2];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder actionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromActions:](v9);
  }

  int v11 = [(ATXAnchorModelTrainingDatasetBuilder *)self candidateIdSetFromAppIntentEvents:v7];

  [v9 minusSet:v11];
  return v9;
}

- (id)candidateIdSetFromAppIntentEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        uint64_t v12 = +[ATXAnchorModelDataStoreWrapper candidateIdFromAppIntentDuetEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromAppIntentDuetEvent:", v10, (void)v14);
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)candidateIdSetFromAppLaunchDuetEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        uint64_t v12 = +[ATXAnchorModelDataStoreWrapper candidateIdFromAppLaunchDuetEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromAppLaunchDuetEvent:", v10, (void)v14);
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (id)featurizeActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v7 setShouldComputeLaunchHistoryForAppLaunches:0];
  [v7 setShouldComputeLaunchHistoryForActionKeyLaunches:0];
  [v7 setShouldComputeLaunchHistoryForActionUUIDLaunches:1];
  uint64_t v8 = [v7 featurizeActionEvent:v6 anchorOccurrenceDate:v5];

  uint64_t v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();
  }

  uint64_t v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.4(v8);
  }

  int v11 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:](v8);
  }

  uint64_t v12 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:](v8);
  }

  __int16 v13 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:]();
  }

  return v8;
}

- (int64_t)addAppEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v38 = v7;
  uint64_t v9 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = (uint64_t)v6;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Adding new app training samples based on anchor event %@", buf, 0xCu);
  }

  uint64_t v10 = [(id)objc_opt_class() candidateQueryStartDateFromDuetEvent:v6];
  int v11 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v6];
  [(id)objc_opt_class() durationOfAnchorEvent:v6];
  v35 = (void *)v10;
  uint64_t v12 = -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveAppEventsAfterAnchorDate:durationOfAnchorEvent:anchor:](self, "fetchPositiveAppEventsAfterAnchorDate:durationOfAnchorEvent:anchor:", v10, v38);
  __int16 v13 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v12 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v14;
    _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive app events after the anchor.", buf, 0xCu);
  }

  long long v15 = objc_opt_new();
  [v15 warmLaunchHistoryForAppEvents:v12 anchorOccurrenceDate:v11];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v12;
  uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    int64_t v18 = 0;
    uint64_t v19 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        long long v22 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeAppEvent:v21 anchorOccurrenceDate:v11 eventFeaturizer:v15];
        v18 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedAppToDatabase:v21 featurizedApp:v22 appWasLaunched:1 appEngaged:0 anchorEvent:v8 anchor:v38];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v17);
  }
  else
  {
    int64_t v18 = 0;
  }
  long long v37 = v8;

  v23 = [(ATXAnchorModelTrainingDatasetBuilder *)self fetchNegativeAppEventsAfterAnchorDate:v35 anchor:v38 positiveAppEvents:obj];
  uint64_t v24 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v23 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v50 = v25;
    _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative app events after the anchor.", buf, 0xCu);
  }

  uint64_t v26 = objc_opt_new();
  [v26 warmLaunchHistoryForAppEvents:v23 anchorOccurrenceDate:v11];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v27 = v23;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v39 + 1) + 8 * j);
        v33 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeAppEvent:v32 anchorOccurrenceDate:v11 eventFeaturizer:v26];
        v18 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedAppToDatabase:v32 featurizedApp:v33 appWasLaunched:0 appEngaged:0 anchorEvent:v37 anchor:v38];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v29);
  }

  return v18;
}

- (int64_t)addFeaturizedAppToDatabase:(id)a3 featurizedApp:(id)a4 appWasLaunched:(BOOL)a5 appEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  return 1;
}

- (id)fetchPositiveAppEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  harvester = self->_harvester;
  id v10 = a5;
  int v11 = [(ATXAnchorModelEventHarvester *)harvester fetchAppLaunchEventsAfterAnchorOccurrenceDate:v8 limit:100000 maxSecondsBeforeAnchor:0 maxSecondsAfterAnchor:(uint64_t)a4 isIncluded:&__block_literal_global_25_2];
  uint64_t v12 = [(ATXAnchorModelTrainingDatasetBuilder *)self appLaunchEventsFromNowPlayingStreamForAnchor:v10 anchorOccurrenceDate:v8];

  __int16 v13 = objc_opt_new();
  [v13 addObjectsFromArray:v11];
  [v13 addObjectsFromArray:v12];
  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v27[0] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v16 = [v13 sortedArrayUsingDescriptors:v15];
  uint64_t v17 = (void *)[v16 mutableCopy];

  int64_t v18 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v19 = v8;
  long long v20 = (void *)[[v18 alloc] initWithTimeInterval:v19 sinceDate:a4];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v19 endDate:v20];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __107__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveAppEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke_2;
  v25[3] = &unk_1E68ACA18;
  id v26 = v21;
  id v22 = v21;
  v23 = objc_msgSend(v17, "_pas_filteredArrayWithTest:", v25);

  return v23;
}

BOOL __107__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveAppEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 endDate];
  double v4 = [v2 startDate];

  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 >= 2.0;

  return v6;
}

uint64_t __107__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveAppEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 startDate];
  uint64_t v4 = [v2 containsDate:v3];

  return v4;
}

- (id)appLaunchEventsFromNowPlayingStreamForAnchor:(id)a3 anchorOccurrenceDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v8 = a3;
  id v9 = [v7 alloc];
  [(ATXAnchorModelTrainingDatasetBuilder *)self secondsAfterAnchorToCollectPositiveSamples:v8];
  double v11 = v10;

  uint64_t v12 = (void *)[v9 initWithTimeInterval:v6 sinceDate:v11];
  __int16 v13 = objc_opt_new();
  uint64_t v14 = [v13 playbackEventsAfterSecondsOfInactivity:v6 betweenStartDate:v12 endDate:600.0];
  long long v15 = [v13 convertNowPlayingEventsToAppLaunchEvents:v14];
  uint64_t v16 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v18 = 134217984;
    uint64_t v19 = [v15 count];
    _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "Generated %lu App Launch Events from Now Playing Events.", (uint8_t *)&v18, 0xCu);
  }

  return v15;
}

- (id)fetchNegativeAppEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveAppEvents:(id)a5
{
  double v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self targetedNegativeAppSamplesForAnchor:a4 anchorOccurrenceDate:a3 eventsToExclude:a5];
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeAppEventsAfterAnchorDate:anchor:positiveAppEvents:]();
  }

  return v5;
}

- (id)targetedNegativeAppSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8 = a4;
  id v9 = [(ATXAnchorModelTrainingDatasetBuilder *)self appCandidateIdsToTargetForAnchor:a3 excludeCandidateIdsFromAppLaunches:a5];
  double v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeAppSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:]();
  }

  dataStoreWrapper = self->_dataStoreWrapper;
  uint64_t v12 = [v9 allObjects];
  __int16 v13 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper appLaunchDuetEventsFromCandidateIds:v12 date:v8];

  return v13;
}

- (id)appCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromAppLaunches:(id)a4
{
  dataStoreWrapper = self->_dataStoreWrapper;
  id v7 = a4;
  id v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:a3 candidateType:@"app" minOccurrences:2];
  id v9 = (void *)[v8 mutableCopy];

  double v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder actionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromActions:](v9);
  }

  double v11 = [(ATXAnchorModelTrainingDatasetBuilder *)self candidateIdSetFromAppLaunchDuetEvents:v7];

  [v9 minusSet:v11];
  return v9;
}

- (id)featurizeAppEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = [v7 arrayWithObjects:&v18 count:1];

  uint64_t v12 = objc_msgSend(v8, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v11, v9, v18, v19);

  __int16 v13 = [v12 objectAtIndexedSubscript:0];

  uint64_t v14 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();
  }

  long long v15 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:]();
  }

  uint64_t v16 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:]();
  }

  return v13;
}

- (int64_t)addModeEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  id v7 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = (uint64_t)v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Adding new mode training samples based on anchor event %@", buf, 0xCu);
  }

  uint64_t v8 = [(id)objc_opt_class() candidateQueryStartDateFromDuetEvent:v6];
  v35 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v6];
  [(id)objc_opt_class() durationOfAnchorEvent:v6];
  uint64_t v32 = (void *)v8;
  id v9 = -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveModeEventsAfterAnchorDate:durationOfAnchorEvent:anchor:](self, "fetchPositiveModeEventsAfterAnchorDate:durationOfAnchorEvent:anchor:", v8, v36);
  id v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v11;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive mode events after the anchor.", buf, 0xCu);
  }

  uint64_t v12 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int64_t v15 = 0;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v19 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v20 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeModeEvent:v18 anchorOccurrenceDate:v35 eventFeaturizer:v12];
        v15 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedModeToDatabase:v18 featurizedMode:v20 modeOccurred:1 modeEngaged:0 anchorEvent:v6 anchor:v36];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v14);
  }
  else
  {
    int64_t v15 = 0;
  }

  uint64_t v21 = [(ATXAnchorModelTrainingDatasetBuilder *)self fetchNegativeModeEventsAfterAnchorDate:v32 anchor:v36 positiveModeEvents:obj];
  id v22 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v21 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v23;
    _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative activity change events after the anchor.", buf, 0xCu);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v33 = v21;
  uint64_t v24 = [v33 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v33);
        }
        uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v29 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v30 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeModeEvent:v28 anchorOccurrenceDate:v35 eventFeaturizer:v12];
        v15 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedModeToDatabase:v28 featurizedMode:v30 modeOccurred:0 modeEngaged:0 anchorEvent:v6 anchor:v36];
      }
      uint64_t v25 = [v33 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v25);
  }

  return v15;
}

- (id)fetchPositiveModeEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5
{
  id v7 = a3;
  uint64_t v8 = BiomeLibrary();
  id v9 = [v8 UserFocus];
  id v10 = [v9 ComputedMode];
  uint64_t v11 = objc_msgSend(v10, "atx_publisherFromStartDate:", v7);

  uint64_t v12 = [(ATXAnchorModelEventHarvester *)self->_harvester fetchEventsAfterAnchorOccurenceDate:v7 withBiomePublisher:v11 maxSecondsBeforeAnchor:5 maxSecondsAfterAnchor:(uint64_t)a4];

  return v12;
}

- (id)featurizeModeEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5
{
  double v5 = [a5 featurizeModeEvent:a3 anchorOccurrenceDate:a4];
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();
  }

  id v7 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:]();
  }

  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:]();
  }

  return v5;
}

- (int64_t)addFeaturizedModeToDatabase:(id)a3 featurizedMode:(id)a4 modeOccurred:(BOOL)a5 modeEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  return 1;
}

- (id)fetchNegativeModeEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveModeEvents:(id)a5
{
  double v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self targetedNegativeModeSamplesForAnchor:a4 anchorOccurrenceDate:a3 eventsToExclude:a5];
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeModeEventsAfterAnchorDate:anchor:positiveModeEvents:]();
  }

  return v5;
}

- (id)targetedNegativeModeSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8 = a4;
  id v9 = [(ATXAnchorModelTrainingDatasetBuilder *)self modeCandidateIdsToTargetForAnchor:a3 excludeCandidateIdsFromModes:a5];
  id v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeModeSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:]();
  }

  dataStoreWrapper = self->_dataStoreWrapper;
  uint64_t v12 = [v9 allObjects];
  uint64_t v13 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper modeBiomeEventsFromCandidateIds:v12 date:v8];

  return v13;
}

- (id)modeCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromModes:(id)a4
{
  dataStoreWrapper = self->_dataStoreWrapper;
  id v7 = a4;
  id v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:a3 candidateType:@"mode" minOccurrences:2];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder modeCandidateIdsToTargetForAnchor:excludeCandidateIdsFromModes:](v9);
  }

  uint64_t v11 = [(ATXAnchorModelTrainingDatasetBuilder *)self candidateIdSetFromModeEvents:v7];

  [v9 minusSet:v11];
  return v9;
}

- (id)candidateIdSetFromModeEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        uint64_t v12 = +[ATXAnchorModelDataStoreWrapper candidateIdFromModeBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromModeBiomeEvent:", v10, (void)v14);
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (int64_t)addLinkActionEventsToDatabaseAfterAnchorEvent:(id)a3 anchor:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v36 = a4;
  uint64_t v7 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = (uint64_t)v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Adding new Link action training samples based on anchor event %@", buf, 0xCu);
  }

  uint64_t v8 = [(id)objc_opt_class() candidateQueryStartDateFromDuetEvent:v6];
  v35 = [(id)objc_opt_class() anchorOccurenceDateFromDuetEvent:v6];
  [(id)objc_opt_class() durationOfAnchorEvent:v6];
  uint64_t v32 = (void *)v8;
  uint64_t v9 = -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:](self, "fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:", v8, v36);
  uint64_t v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v11;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Inserting %lu positive Link action events after the anchor.", buf, 0xCu);
  }

  uint64_t v12 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    int64_t v15 = 0;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v19 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v20 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeLinkActionEvent:v18 anchorOccurrenceDate:v35 eventFeaturizer:v12];
        v15 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedLinkActionToDatabase:v18 featurizedAction:v20 actionOccurred:1 actionEngaged:0 anchorEvent:v6 anchor:v36];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v14);
  }
  else
  {
    int64_t v15 = 0;
  }

  uint64_t v21 = [(ATXAnchorModelTrainingDatasetBuilder *)self fetchNegativeLinkActionEventsAfterAnchorDate:v32 anchor:v36 positiveLinkActionEvents:obj];
  id v22 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v21 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v23;
    _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Inserting %lu negative activity change events after the anchor.", buf, 0xCu);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v33 = v21;
  uint64_t v24 = [v33 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v33);
        }
        uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        uint64_t v29 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v30 = [(ATXAnchorModelTrainingDatasetBuilder *)self featurizeLinkActionEvent:v28 anchorOccurrenceDate:v35 eventFeaturizer:v12];
        v15 += [(ATXAnchorModelTrainingDatasetBuilder *)self addFeaturizedLinkActionToDatabase:v28 featurizedAction:v30 actionOccurred:0 actionEngaged:0 anchorEvent:v6 anchor:v36];
      }
      uint64_t v25 = [v33 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v25);
  }

  return v15;
}

- (id)fetchPositiveLinkActionEventsAfterAnchorDate:(id)a3 durationOfAnchorEvent:(double)a4 anchor:(id)a5
{
  id v7 = a3;
  id v13 = 0;
  uint64_t v8 = +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:v7 toDate:0 error:&v13];
  id v9 = v13;
  if (v9)
  {
    uint64_t v10 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXAnchorModelTrainingDatasetBuilder fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:]();
    }

    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v11 = [(ATXAnchorModelEventHarvester *)self->_harvester fetchEventsAfterAnchorOccurenceDate:v7 withBiomePublisher:v8 maxSecondsBeforeAnchor:5 maxSecondsAfterAnchor:(uint64_t)a4 isIncluded:&__block_literal_global_37_0];
  }

  return v11;
}

BOOL __114__ATXAnchorModelTrainingDatasetBuilder_fetchPositiveLinkActionEventsAfterAnchorDate_durationOfAnchorEvent_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 eventBody];
  id v3 = [v2 predictions];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)featurizeLinkActionEvent:(id)a3 anchorOccurrenceDate:(id)a4 eventFeaturizer:(id)a5
{
  id v5 = [a5 featurizeLinkActionEvent:a3 anchorOccurrenceDate:a4];
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:].cold.5();
  }

  id v7 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:]();
  }

  uint64_t v8 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder featurizeActionEvent:anchorOccurrenceDate:]();
  }

  return v5;
}

- (int64_t)addFeaturizedLinkActionToDatabase:(id)a3 featurizedAction:(id)a4 actionOccurred:(BOOL)a5 actionEngaged:(BOOL)a6 anchorEvent:(id)a7 anchor:(id)a8
{
  return 1;
}

- (id)fetchNegativeLinkActionEventsAfterAnchorDate:(id)a3 anchor:(id)a4 positiveLinkActionEvents:(id)a5
{
  id v5 = [(ATXAnchorModelTrainingDatasetBuilder *)self targetedNegativeLinkActionSamplesForAnchor:a4 anchorOccurrenceDate:a3 eventsToExclude:a5];
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder fetchNegativeLinkActionEventsAfterAnchorDate:anchor:positiveLinkActionEvents:]();
  }

  return v5;
}

- (id)targetedNegativeLinkActionSamplesForAnchor:(id)a3 anchorOccurrenceDate:(id)a4 eventsToExclude:(id)a5
{
  id v8 = a4;
  id v9 = [(ATXAnchorModelTrainingDatasetBuilder *)self linkActionCandidateIdsToTargetForAnchor:a3 excludeCandidateIdsFromLinkActions:a5];
  uint64_t v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder targetedNegativeLinkActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:]();
  }

  dataStoreWrapper = self->_dataStoreWrapper;
  uint64_t v12 = [v9 allObjects];
  id v13 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper linkActionBiomeEventsFromCandidateIds:v12 date:v8];

  return v13;
}

- (id)linkActionCandidateIdsToTargetForAnchor:(id)a3 excludeCandidateIdsFromLinkActions:(id)a4
{
  dataStoreWrapper = self->_dataStoreWrapper;
  id v7 = a4;
  id v8 = [(ATXAnchorModelDataStoreWrapperProtocol *)dataStoreWrapper uniqueCandidateIdsThatOccurredAfterAnchor:a3 candidateType:@"linkaction" minOccurrences:2];
  id v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelTrainingDatasetBuilder linkActionCandidateIdsToTargetForAnchor:excludeCandidateIdsFromLinkActions:](v9);
  }

  uint64_t v11 = [(ATXAnchorModelTrainingDatasetBuilder *)self candidateIdSetFromLinkActionEvents:v7];

  [v9 minusSet:v11];
  return v9;
}

- (id)candidateIdSetFromLinkActionEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        uint64_t v12 = +[ATXAnchorModelDataStoreWrapper candidateIdFromLinkActionBiomeEvent:](ATXAnchorModelDataStoreWrapper, "candidateIdFromLinkActionBiomeEvent:", v10, (void)v14);
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_harvester, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
}

- (void)cleanupDatasetForPrivacyPreservation
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "Not deleting samples for uninstalled apps in Anchor Model because list of installed apps known to SpringBoard was empty.", v1, 2u);
}

- (void)addAnchorEventToDatabase:anchor:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_DEBUG, "AnchorModel: Adding anchor event to database %@ for anchor %@", v2, 0x16u);
}

- (void)secondsAfterAnchorToCollectPositiveSamples:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Seconds of influence for anchor %@ is %.02f", (uint8_t *)&v3, 0x16u);
}

- (void)fetchNegativeActionEventsAfterAnchorDate:anchor:positiveActionEvents:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v0 = +[ATXAnchorModelEventHarvester idsFromDuetEvents:](ATXAnchorModelEventHarvester, "idsFromDuetEvents:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Selected negative action events: %@", v3, v4, v5, v6, v7);
}

- (void)targetedNegativeActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these actions.", v2);
}

- (void)actionCandidateIdsToTargetForAnchor:(void *)a1 excludeCandidateIdsFromActions:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "%lu action events have happened after the anchor historically.", v3, v4, v5, v6, v7);
}

- (void)featurizeActionEvent:anchorOccurrenceDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "========================================================================== (end)", v2, v3, v4, v5, v6);
}

- (void)featurizeActionEvent:(void *)a1 anchorOccurrenceDate:.cold.2(void *a1)
{
  uint64_t v1 = [a1 appLaunchMetadata];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "Featurized action - app launch: %@", v4, v5, v6, v7, v8);
}

- (void)featurizeActionEvent:(void *)a1 anchorOccurrenceDate:.cold.3(void *a1)
{
  uint64_t v1 = [a1 actionKeyMetadata];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v2, v3, "Featurized action - action key: %@", v4, v5, v6, v7, v8);
}

- (void)featurizeActionEvent:(void *)a1 anchorOccurrenceDate:.cold.4(void *a1)
{
  uint64_t v1 = [a1 actionUUIDMetadatas];
  uint64_t v2 = [v1 objectAtIndexedSubscript:0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v3, v4, "Featurized action - action UUID: %@", v5, v6, v7, v8, v9);
}

- (void)featurizeActionEvent:anchorOccurrenceDate:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_4(&dword_1D0FA3000, v0, v1, "========================================================================== (start)", v2, v3, v4, v5, v6);
}

- (void)fetchNegativeAppEventsAfterAnchorDate:anchor:positiveAppEvents:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v0 = +[ATXAnchorModelEventHarvester idsFromDuetEvents:](ATXAnchorModelEventHarvester, "idsFromDuetEvents:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Selected negative app events: %@", v3, v4, v5, v6, v7);
}

- (void)targetedNegativeAppSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these apps.", v2);
}

- (void)featurizeAppEvent:anchorOccurrenceDate:eventFeaturizer:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Featurized app - app launch: %@", v2);
}

- (void)featurizeModeEvent:anchorOccurrenceDate:eventFeaturizer:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Featurized mode event: %@", v2);
}

- (void)fetchNegativeModeEventsAfterAnchorDate:anchor:positiveModeEvents:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  uint64_t v0 = +[ATXAnchorModelEventHarvester idsFromBiomeEvents:](ATXAnchorModelEventHarvester, "idsFromBiomeEvents:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Selected negative mode events: %@", v3, v4, v5, v6, v7);
}

- (void)targetedNegativeModeSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these modes.", v2);
}

- (void)modeCandidateIdsToTargetForAnchor:(void *)a1 excludeCandidateIdsFromModes:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "%lu mode events have happened after the anchor historically.", v3, v4, v5, v6, v7);
}

- (void)fetchPositiveLinkActionEventsAfterAnchorDate:durationOfAnchorEvent:anchor:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "Error when fetching Link transcript publisher: %@", v1, 0xCu);
}

- (void)featurizeLinkActionEvent:anchorOccurrenceDate:eventFeaturizer:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Featurized Link action event: %@", v2);
}

- (void)fetchNegativeLinkActionEventsAfterAnchorDate:anchor:positiveLinkActionEvents:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  os_log_t v0 = +[ATXAnchorModelEventHarvester idsFromBiomeEvents:](ATXAnchorModelEventHarvester, "idsFromBiomeEvents:");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "Selected negative Link action events: %@", v3, v4, v5, v6, v7);
}

- (void)targetedNegativeLinkActionSamplesForAnchor:anchorOccurrenceDate:eventsToExclude:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_1(&dword_1D0FA3000, v0, v1, "Candidate Ids that didn't happen after this anchor occurrence: %@. Going to generate negative samples for these Link actions.", v2);
}

- (void)linkActionCandidateIdsToTargetForAnchor:(void *)a1 excludeCandidateIdsFromLinkActions:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v1, v2, "%lu Link action events have happened after the anchor historically.", v3, v4, v5, v6, v7);
}

@end