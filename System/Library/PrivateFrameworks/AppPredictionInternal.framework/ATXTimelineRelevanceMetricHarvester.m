@interface ATXTimelineRelevanceMetricHarvester
+ (double)roundNumber:(id)a3 toSignificantFigures:(unint64_t)a4;
+ (int)PBClientModelFromString:(id)a3;
+ (int)PBTimelineEntrySuggestionMappingReasonFrom:(int64_t)a3;
+ (int)PBTimelineRelevanceAbuseControlOutcomeTypeFrom:(int64_t)a3;
+ (int)PBTimelineRelevanceEngagementFromATXStackRotationEngagementStatus:(unint64_t)a3;
+ (int)PBTimelineRelevanceRotationEventTypeFromReason:(id)a3;
+ (int)PBWidgetFamilyFromCHSWidgetFamily:(int64_t)a3;
- (ATXTimelineRelevanceMetricHarvester)init;
- (ATXTimelineRelevanceMetricHarvester)initWithInformationStore:(id)a3;
- (BOOL)_shouldLogHomeScreenEvent:(id)a3 widgetBundleId:(id)a4 appBundleId:(id)a5 widgetKind:(id)a6 widgetFamily:(int64_t)a7;
- (BOOL)_shouldProcessEvent:(id)a3;
- (BOOL)addTimelineRelevanceScoresToTimelineRelevanceContainer:(id)a3 forWidget:(id)a4 withDistributionsLogged:(unint64_t)a5 updatingDictionary:(id)a6 anonymizeTimestampsRelativeTo:(double)a7;
- (BOOL)isFirstParty:(id)a3;
- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4;
- (id)fetchStackConfigSummaryForWidgetBundleId:(id)a3 appBundleId:(id)a4 widgetKind:(id)a5 widgetSize:(int64_t)a6 withPBTimelineRelevanceContainer:(id)a7 anonymizeTimestampsRelativeTo:(double)a8;
- (id)timeOfLatestMetricsSubmission;
- (id)widgetsForDataCollection:(id)a3;
- (void)_addAbuseControlOutcomesForSuggestionId:(id)a3 withPBTimelineRelevanceSuggestion:(id)a4 anonymizeTimestampsRelativeTo:(double)a5;
- (void)_addRotationHistoryForWidgetBundleId:(id)a3 appBundleId:(id)a4 widgetKind:(id)a5 widgetSize:(int64_t)a6 withPBTimelineRelevanceContainer:(id)a7 anonymizeTimestampsRelativeTo:(double)a8;
- (void)_updateMetricsSubmissionDateTo:(id)a3;
- (void)_updateTimelineEntriesDictionaryWithEntries:(id)a3 withKey:(id)a4 withScoreEntry:(id)a5;
- (void)addFeatureVectorToTimelineRelevanceContainer:(id)a3;
- (void)addRotationsToContainer:(id)a3 withStackRotationSesssion:(id)a4 anonymizeTimestampsRelativeTo:(double)a5;
- (void)addStackConfigSummaryToTimelineRelevanceContainer:(id)a3 withStackConfigSummary:(id)a4;
- (void)addTimelineRelevanceSuggestionsToContainer:(id)a3 withTimelineEntries:(id)a4 anonymizeTimestampsRelativeTo:(double)a5;
- (void)harvestWithActivity:(id)a3;
@end

@implementation ATXTimelineRelevanceMetricHarvester

- (ATXTimelineRelevanceMetricHarvester)init
{
  v3 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "Initializing ATXTimelineRelevanceMetricHarvester.", buf, 2u);
  }

  v16.receiver = self;
  v16.super_class = (Class)ATXTimelineRelevanceMetricHarvester;
  v4 = [(ATXTimelineRelevanceMetricHarvester *)&v16 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F4B0E8] sharedInstance];
    informationStore = v4->_informationStore;
    v4->_informationStore = (ATXInformationStore *)v5;

    v7 = [(ATXTimelineRelevanceMetricHarvester *)v4 timeOfLatestMetricsSubmission];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
      loggingStartDate = v4->_loggingStartDate;
      v4->_loggingStartDate = v9;
    }
    else
    {
      loggingStartDate = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v11 = [loggingStartDate dateByAddingTimeInterval:-604800.0];
      v12 = v4->_loggingStartDate;
      v4->_loggingStartDate = (NSDate *)v11;
    }
    uint64_t v13 = objc_opt_new();
    abuseControlConfig = v4->_abuseControlConfig;
    v4->_abuseControlConfig = (ATXTimelineAbuseControlConfig *)v13;
  }
  return v4;
}

- (ATXTimelineRelevanceMetricHarvester)initWithInformationStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimelineRelevanceMetricHarvester;
  v6 = [(ATXTimelineRelevanceMetricHarvester *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_informationStore, a3);
  }

  return v7;
}

- (BOOL)isFirstParty:(id)a3
{
  return [a3 hasPrefix:@"com.apple."];
}

- (id)widgetsForDataCollection:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v11 extensionIdentity];
        uint64_t v13 = [v12 extensionBundleIdentifier];
        BOOL v14 = [(ATXTimelineRelevanceMetricHarvester *)self isFirstParty:v13];

        if (v14) {
          v15 = v5;
        }
        else {
          v15 = v6;
        }
        [v15 addObject:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  objc_super v16 = objc_opt_new();
  v17 = objc_msgSend(v5, "_pas_shuffledArrayUsingRng:", v16);

  unint64_t v18 = (unint64_t)[v6 count] >> 1;
  unint64_t v19 = [v5 count];
  if (v18 >= v19) {
    unint64_t v18 = v19;
  }
  v20 = objc_msgSend(v17, "subarrayWithRange:", 0, v18);
  [v6 addObjectsFromArray:v20];
  v21 = objc_opt_new();
  v22 = objc_msgSend(v6, "_pas_shuffledArrayUsingRng:", v21);

  v23 = objc_msgSend(v17, "subarrayWithRange:", v18, objc_msgSend(v17, "count") - v18);
  v24 = [v22 arrayByAddingObjectsFromArray:v23];

  return v24;
}

- (void)harvestWithActivity:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    loggingStartDate = self->_loggingStartDate;
    *(_DWORD *)buf = 138412290;
    uint64_t v67 = (uint64_t)loggingStartDate;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: fetching Timeline Relevance donations since last metric submission date: %@", buf, 0xCu);
  }

  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v8 = [(ATXInformationStore *)self->_informationStore fetchDistinctWidgetsIgnoringIntentSinceDate:self->_loggingStartDate];
  uint64_t v9 = [(ATXTimelineRelevanceMetricHarvester *)self widgetsForDataCollection:v8];
  int v10 = [v4 didDefer];
  uint64_t v11 = __atxlog_handle_timeline();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, "ATXTimelineRelevanceMetricHarvester: Deferring harvesting activity", buf, 2u);
    }
  }
  else
  {
    v53 = v7;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v67 = v13;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Logging metrics for %ld widget(s)", buf, 0xCu);
    }
    v52 = v8;

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v51 = v9;
    v12 = v9;
    uint64_t v58 = [v12 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v58)
    {
      unint64_t v14 = 0;
      uint64_t v56 = *(void *)v62;
      id v54 = v4;
      v55 = v12;
      v57 = self;
      while (2)
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v62 != v56) {
            objc_enumerationMutation(v12);
          }
          objc_super v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          context = (void *)MEMORY[0x1D25F6CC0]();
          v17 = objc_opt_new();
          unint64_t v18 = [v16 extensionIdentity];
          unint64_t v19 = [v18 extensionBundleIdentifier];
          [v17 setWidgetBundleId:v19];

          v20 = [v16 kind];
          [v17 setWidgetKind:v20];

          v21 = [v16 extensionIdentity];
          uint64_t v22 = [v21 containerBundleIdentifier];
          v23 = (void *)v22;
          if (v22) {
            v24 = (__CFString *)v22;
          }
          else {
            v24 = &stru_1F2740B58;
          }
          objc_msgSend(v17, "setContainerBundleIdentifier:", v24, v51);

          objc_msgSend(v17, "setWidgetFamily:", objc_msgSend((id)objc_opt_class(), "PBWidgetFamilyFromCHSWidgetFamily:", objc_msgSend(v16, "family")));
          [v17 setTimelineDonationNilCount:0];
          [v17 setAtLeastOnePositiveTimelineRelevanceScore:0];
          v25 = [(ATXTimelineAbuseControlConfig *)self->_abuseControlConfig timelineRelevanceABGroup];
          [v17 setAbGroup:v25];

          v26 = [MEMORY[0x1E4F1C9C8] now];
          long long v27 = [v26 dateByAddingTimeInterval:-604800.0];
          [v27 timeIntervalSinceReferenceDate];
          double v29 = v28;

          long long v30 = objc_opt_new();
          if ([(ATXTimelineRelevanceMetricHarvester *)self addTimelineRelevanceScoresToTimelineRelevanceContainer:v17 forWidget:v16 withDistributionsLogged:v14 updatingDictionary:v30 anonymizeTimestampsRelativeTo:v29])
          {
            unint64_t v59 = v14;
            v31 = [v16 extensionIdentity];
            uint64_t v32 = [v31 extensionBundleIdentifier];
            v33 = [v16 extensionIdentity];
            [v33 containerBundleIdentifier];
            v35 = v34 = self;
            v36 = [v16 kind];
            v37 = -[ATXTimelineRelevanceMetricHarvester fetchStackConfigSummaryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:](v34, "fetchStackConfigSummaryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:", v32, v35, v36, [v16 family], v17, v29);

            v38 = [v37 lastObject];
            if ([v38 hasSmartStacksWithWidget])
            {
              int v39 = 1;
            }
            else
            {
              v40 = [v37 lastObject];
              int v39 = [v40 hasNonSmartStacksWithWidget];
            }
            self = v57;
            v12 = v55;
            unint64_t v14 = v59;
            if (v39 && v59 <= 4)
            {
              [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
              [v17 setTimestamp:(uint64_t)(v41 - v29)];
              [(ATXTimelineRelevanceMetricHarvester *)v57 addTimelineRelevanceSuggestionsToContainer:v17 withTimelineEntries:v30 anonymizeTimestampsRelativeTo:v29];
              v42 = [v16 extensionIdentity];
              v43 = [v42 extensionBundleIdentifier];
              v44 = [v16 extensionIdentity];
              v45 = [v44 containerBundleIdentifier];
              v46 = [v16 kind];
              -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:](v57, "_addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:", v43, v45, v46, [v16 family], v17, v29);

              v12 = v55;
              self = v57;

              [(ATXTimelineRelevanceMetricHarvester *)v57 addStackConfigSummaryToTimelineRelevanceContainer:v17 withStackConfigSummary:v37];
              [(ATXTimelineRelevanceMetricHarvester *)v57 addFeatureVectorToTimelineRelevanceContainer:v17];
              unint64_t v14 = v59 + 1;
            }
            id v4 = v54;
          }
          else
          {
            v37 = 0;
          }
          v47 = [MEMORY[0x1E4F93728] sharedInstance];
          [v47 logMessage:v17];

          if ([v4 didDefer])
          {
            v50 = __atxlog_handle_timeline();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0FA3000, v50, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Asked to defer activity", buf, 2u);
            }

            uint64_t v7 = v53;
            [(ATXTimelineRelevanceMetricHarvester *)self _updateMetricsSubmissionDateTo:v53];

            goto LABEL_33;
          }
        }
        uint64_t v58 = [v12 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v58) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = v53;
    [(ATXTimelineRelevanceMetricHarvester *)self _updateMetricsSubmissionDateTo:v53];
    [(ATXInformationStore *)self->_informationStore clearOldAbuseControlOutcomeData];
    [(ATXInformationStore *)self->_informationStore deleteExpiredProactiveStackRotations];
    informationStore = self->_informationStore;
    v49 = [MEMORY[0x1E4F4B448] startDateOfDismissHistoryConsidered];
    [(ATXInformationStore *)informationStore clearWidgetRemovalHistoryOlderThan:v49];

    v12 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Finished logging Timeline Relevance metrics.", buf, 2u);
    }
LABEL_33:
    uint64_t v9 = v51;
    uint64_t v8 = v52;
  }
}

- (BOOL)addTimelineRelevanceScoresToTimelineRelevanceContainer:(id)a3 forWidget:(id)a4 withDistributionsLogged:(unint64_t)a5 updatingDictionary:(id)a6 anonymizeTimestampsRelativeTo:(double)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  int v39 = self;
  id v40 = a6;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v38 = v13;
  id obj = [(ATXInformationStore *)self->_informationStore fetchTimelineEntriesForWidget:v13 sinceDate:self->_loggingStartDate];
  uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v41 = 0;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        unint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        unint64_t v19 = (void *)MEMORY[0x1D25F6CC0]();
        v20 = [v18 timelineEntry];
        v21 = [v20 relevance];

        if (v21)
        {
          uint64_t v22 = objc_opt_new();
          objc_msgSend(v22, "setSuggestionMappingReason:", +[ATXTimelineRelevanceMetricHarvester PBTimelineEntrySuggestionMappingReasonFrom:](ATXTimelineRelevanceMetricHarvester, "PBTimelineEntrySuggestionMappingReasonFrom:", objc_msgSend(v18, "suggestionMappingReason")));
          v23 = [v18 timelineEntry];
          v24 = [v23 relevance];
          [v24 score];
          objc_msgSend(v22, "setRelevanceScore:");

          if (([v12 atLeastOnePositiveTimelineRelevanceScore] & 1) == 0)
          {
            v25 = [v18 timelineEntry];
            v26 = [v25 relevance];
            [v26 score];
            double v28 = v27;

            if (v28 > 0.0) {
              [v12 setAtLeastOnePositiveTimelineRelevanceScore:1];
            }
          }
          if (a5 <= 4)
          {
            double v29 = [v18 timelineEntry];
            long long v30 = [v29 date];
            [v30 timeIntervalSinceReferenceDate];
            [v22 setTimestamp:(uint64_t)(v31 - a7)];

            uint64_t v32 = [v18 timelineEntry];
            v33 = [v32 relevance];
            [v33 duration];
            [v22 setDuration:(uint64_t)v34];

            v35 = [v18 suggestionId];

            if (v35)
            {
              v36 = [v18 suggestionId];
              [(ATXTimelineRelevanceMetricHarvester *)v39 _updateTimelineEntriesDictionaryWithEntries:v40 withKey:v36 withScoreEntry:v22];
            }
            char v41 = 1;
          }
        }
        else
        {
          objc_msgSend(v12, "setTimelineDonationNilCount:", objc_msgSend(v12, "timelineDonationNilCount") + 1);
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v15);
  }
  else
  {
    char v41 = 0;
  }

  return v41 & 1;
}

- (void)addStackConfigSummaryToTimelineRelevanceContainer:(id)a3 withStackConfigSummary:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addStackConfigSummary:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)addTimelineRelevanceSuggestionsToContainer:(id)a3 withTimelineEntries:(id)a4 anonymizeTimestampsRelativeTo:(double)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v7 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
        long long v13 = (void *)MEMORY[0x1D25F6CC0]();
        long long v14 = objc_opt_new();
        [(ATXTimelineRelevanceMetricHarvester *)self _addAbuseControlOutcomesForSuggestionId:v12 withPBTimelineRelevanceSuggestion:v14 anonymizeTimestampsRelativeTo:a5];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v15 = [v7 objectForKeyedSubscript:v12];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              [v14 addTimelineRelevanceScoreEntry:*(void *)(*((void *)&v23 + 1) + 8 * v19++)];
            }
            while (v17 != v19);
            uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v17);
        }

        [v22 addTimelineRelevanceSuggestion:v14];
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }
}

- (void)_addAbuseControlOutcomesForSuggestionId:(id)a3 withPBTimelineRelevanceSuggestion:(id)a4 anonymizeTimestampsRelativeTo:(double)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(ATXInformationStore *)self->_informationStore fetchAbuseControlOutcomesForSuggestion:v8 sinceDate:self->_loggingStartDate];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * v14);
      uint64_t v16 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v17 = objc_opt_new();
      [v15 timestamp];
      [v17 setTimestamp:(uint64_t)(v18 - a5)];
      objc_msgSend(v17, "setOutcomeType:", +[ATXTimelineRelevanceMetricHarvester PBTimelineRelevanceAbuseControlOutcomeTypeFrom:](ATXTimelineRelevanceMetricHarvester, "PBTimelineRelevanceAbuseControlOutcomeTypeFrom:", objc_msgSend(v15, "abuseControlOutcome")));
      [v9 addAbuseControlOutcome:v17];
      unint64_t v19 = [v9 abuseControlOutcomesCount];

      if (v19 > 0x1F3) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addFeatureVectorToTimelineRelevanceContainer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 widgetBundleId];
  id v6 = [v3 widgetKind];
  long long v20 = v3;
  id v7 = [v3 containerBundleIdentifier];
  unint64_t v19 = v4;
  id v8 = [v4 featurizeTimelineWithWidgetBundleId:v5 widgetKind:v6 appBundleIdentifier:v7];

  id v9 = objc_opt_new();
  id v10 = [v8 dictionaryRepresentation];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(NSString **)(*((void *)&v21 + 1) + 8 * i);
        NSSelectorFromString(v15);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = NSNumber;
          uint64_t v17 = [v10 objectForKeyedSubscript:v15];
          +[ATXTimelineRelevanceMetricHarvester roundNumber:v17 toSignificantFigures:2];
          double v18 = objc_msgSend(v16, "numberWithDouble:");

          [v9 setValue:v18 forKey:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
  [v20 setFeatureVector:v9];
}

- (void)_updateTimelineEntriesDictionaryWithEntries:(id)a3 withKey:(id)a4 withScoreEntry:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v12 objectForKeyedSubscript:v7];

  if (!v9)
  {
    id v10 = objc_opt_new();
    [v12 setObject:v10 forKeyedSubscript:v7];
  }
  uint64_t v11 = [v12 objectForKeyedSubscript:v7];
  [v11 addObject:v8];
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)[a3 orderedMergeWithOthers:a4 comparator:&__block_literal_global_211];
}

uint64_t __84__ATXTimelineRelevanceMetricHarvester__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 timestamp];
  double v7 = v6;
  [v5 timestamp];
  if (v7 >= v8)
  {
    [v4 timestamp];
    double v11 = v10;
    [v5 timestamp];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (void)_addRotationHistoryForWidgetBundleId:(id)a3 appBundleId:(id)a4 widgetKind:(id)a5 widgetSize:(int64_t)a6 withPBTimelineRelevanceContainer:(id)a7 anonymizeTimestampsRelativeTo:(double)a8
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v46 = a7;
  uint64_t v62 = 0;
  long long v63 = (double *)&v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  objc_initWeak(&location, self);
  uint64_t v16 = objc_opt_new();
  [(NSDate *)self->_loggingStartDate timeIntervalSinceReferenceDate];
  long long v43 = objc_msgSend(v16, "genericEventPublisherFromStartTime:");

  uint64_t v17 = objc_opt_new();
  [(NSDate *)self->_loggingStartDate timeIntervalSinceReferenceDate];
  v42 = objc_msgSend(v17, "publisherFromStartTime:");

  v67[0] = v42;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:1];
  char v41 = [(ATXTimelineRelevanceMetricHarvester *)self _timeBasedMergePublisher:v43 withOtherPublishers:v18];

  unint64_t v19 = objc_opt_new();
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke;
  v60[3] = &unk_1E68AF140;
  v60[4] = self;
  long long v20 = [v41 filterWithIsIncluded:v60];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_137;
  v55[3] = &unk_1E68B5198;
  id v44 = v13;
  id v56 = v44;
  id v21 = v14;
  id v57 = v21;
  id v22 = v15;
  id v58 = v22;
  int64_t v59 = a6;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_139;
  v51[3] = &unk_1E68B51C0;
  int v39 = &v54;
  objc_copyWeak(&v54, &location);
  v53 = &v62;
  id v40 = v19;
  id v52 = v40;
  id v23 = (id)[v20 sinkWithCompletion:v55 receiveInput:v51];

  double v24 = v63[3];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if (v24 >= v25)
  {
    long long v27 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:]();
    }
  }
  else
  {
    uint64_t v26 = __atxlog_handle_home_screen();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[ATXTimelineRelevanceMetricHarvester _addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:]();
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v27 = objc_msgSend(v40, "removeAndReturnCompletedSessions", &v54);
    uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v66 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v48;
LABEL_6:
      uint64_t v30 = 0;
      while (1)
      {
        if (*(void *)v48 != v29) {
          objc_enumerationMutation(v27);
        }
        double v31 = *(void **)(*((void *)&v47 + 1) + 8 * v30);
        uint64_t v32 = [v31 sessionEndDate];
        [v32 timeIntervalSinceReferenceDate];
        double v34 = v33;
        [(NSDate *)self->_loggingStartDate timeIntervalSinceReferenceDate];
        BOOL v36 = v34 < v35;

        if (v36) {
          break;
        }
        v37 = [v31 startingStackChangeEvent];
        BOOL v38 = [(ATXTimelineRelevanceMetricHarvester *)self _shouldLogHomeScreenEvent:v37 widgetBundleId:v44 appBundleId:v21 widgetKind:v22 widgetFamily:a6];

        if (!v38) {
          break;
        }
        [(ATXTimelineRelevanceMetricHarvester *)self addRotationsToContainer:v46 withStackRotationSesssion:v31 anonymizeTimestampsRelativeTo:a8];
        if ((unint64_t)[v46 rotationsCount] > 0x1F3) {
          break;
        }
        if (v28 == ++v30)
        {
          uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v66 count:16];
          if (v28) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
  }

  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v62, 8);
}

uint64_t __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];

  if (v4)
  {
    id v5 = [v3 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v7 = *(void **)(a1 + 32);
      double v8 = [v3 eventBody];
      uint64_t v9 = [v7 _shouldProcessEvent:v8];
    }
    else
    {
      double v11 = [v3 eventBody];
      int v12 = [v11 conformsToProtocol:&unk_1F28AC4C0];

      uint64_t v9 = v12 ^ 1u;
    }
  }
  else
  {
    double v10 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_cold_1();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_137(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  id v5 = __atxlog_handle_timeline();
  double v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_137_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v9 = a1[6];
    double v10 = NSStringFromWidgetFamily();
    int v11 = 138413058;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    double v18 = v10;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "ATXTimelineRelevanceMetricHarvester: Successfully fetched rotation events from Biome for widgetBundleId: %@, appBundleId: %@, widgetKind: %@, widgetFamily: %@", (uint8_t *)&v11, 0x2Au);
  }
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_139(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v4 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [v14 timestamp];
    if (v4 >= v5) {
      double v5 = v4;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
    double v6 = [v14 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v14 eventBody];
      [v8 updateWithUIEvent:v9];
    }
    double v10 = [v14 eventBody];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      __int16 v13 = [v14 eventBody];
      [v12 updateWithBlendingUICacheUpdate:v13];
    }
  }
}

- (void)addRotationsToContainer:(id)a3 withStackRotationSesssion:(id)a4 anonymizeTimestampsRelativeTo:(double)a5
{
  id v28 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v7 sessionStartDate];
  [v9 timeIntervalSinceReferenceDate];
  [v8 setTimestamp:(uint64_t)(v10 - a5)];

  char v11 = [v7 sessionEndDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;
  id v14 = [v7 sessionStartDate];
  [v14 timeIntervalSinceReferenceDate];
  [v8 setDuration:(uint64_t)(v13 - v15)];

  objc_msgSend(v8, "setEngagement:", objc_msgSend((id)objc_opt_class(), "PBTimelineRelevanceEngagementFromATXStackRotationEngagementStatus:", objc_msgSend(v7, "engagementStatus")));
  uint64_t v16 = objc_opt_class();
  __int16 v17 = [v7 startingStackChangeEvent];
  double v18 = [v17 reason];
  objc_msgSend(v8, "setRotationEventType:", objc_msgSend(v16, "PBTimelineRelevanceRotationEventTypeFromReason:", v18));

  uint64_t v19 = [v7 systemSuggestSuggestionLayout];

  if (v19)
  {
    long long v20 = [v7 systemSuggestSuggestionLayout];
    objc_msgSend(v8, "setIsMediumOrHighConfidence:", objc_msgSend(v20, "isLowConfidenceStackRotationForStaleStack") ^ 1);

    id v21 = [v7 systemSuggestSuggestionLayout];
    id v22 = [v21 allSuggestionsInLayout];
    id v23 = [v22 firstObject];

    if (v23)
    {
      double v24 = [v23 clientModelSpecification];

      if (v24)
      {
        double v25 = objc_opt_class();
        uint64_t v26 = [v23 clientModelSpecification];
        long long v27 = [v26 clientModelId];
        objc_msgSend(v8, "setClientModelId:", objc_msgSend(v25, "PBClientModelFromString:", v27));
      }
    }
  }
  [v28 addRotation:v8];
}

- (BOOL)_shouldLogHomeScreenEvent:(id)a3 widgetBundleId:(id)a4 appBundleId:(id)a5 widgetKind:(id)a6 widgetFamily:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11) {
    goto LABEL_11;
  }
  double v15 = [v11 widgetBundleId];
  if (![v15 isEqualToString:v12])
  {
    BOOL v19 = 0;
LABEL_16:

    goto LABEL_17;
  }
  id v16 = [v11 appBundleId];
  if (![v16 isEqualToString:v13])
  {
LABEL_14:
    BOOL v19 = 0;
    goto LABEL_15;
  }
  __int16 v17 = [v11 widgetKind];
  if (([v17 isEqualToString:v14] & 1) == 0)
  {

    goto LABEL_14;
  }
  [v11 widgetSize];
  uint64_t v18 = CHSWidgetFamilyFromATXStackLayoutSize();

  if (v18 == a7)
  {
    id v16 = [v11 eventTypeString];
    if (([v16 isEqualToString:@"Unknown"] & 1) == 0
      && ([v16 isEqualToString:@"HomeScreenPageShown"] & 1) == 0
      && ([v16 isEqualToString:@"HomeScreenDisappeared"] & 1) == 0)
    {
      if ([v16 isEqualToString:@"StackChanged"])
      {
        BOOL v19 = 1;
        goto LABEL_10;
      }
      if (([v16 isEqualToString:@"WidgetTapped"] & 1) == 0
        && ([v16 isEqualToString:@"WidgetLongLook"] & 1) == 0
        && ([v16 isEqualToString:@"WidgetUserFeedback"] & 1) == 0
        && ([v16 isEqualToString:@"UserStackConfigChanged"] & 1) == 0
        && ([v16 isEqualToString:@"DeviceLocked"] & 1) == 0
        && ([v16 isEqualToString:@"DeviceUnlocked"] & 1) == 0
        && ([v16 isEqualToString:@"PinnedWidgetAdded"] & 1) == 0
        && ([v16 isEqualToString:@"PinnedWidgetDeleted"] & 1) == 0
        && ([v16 isEqualToString:@"SpecialPageAppeared"] & 1) == 0
        && ([v16 isEqualToString:@"SpecialPageDisappeared"] & 1) == 0
        && ([v16 isEqualToString:@"StackShown"] & 1) == 0
        && ([v16 isEqualToString:@"StackDisappeared"] & 1) == 0
        && ([v16 isEqualToString:@"StackCreated"] & 1) == 0
        && ([v16 isEqualToString:@"StackDeleted"] & 1) == 0
        && ([v16 isEqualToString:@"WidgetAddedToStack"] & 1) == 0
        && ([v16 isEqualToString:@"WidgetRemovedFromStack"] & 1) == 0
        && ([v16 isEqualToString:@"StackVisibilityChanged"] & 1) == 0
        && ([v16 isEqualToString:@"AppAdded"] & 1) == 0)
      {
        [v16 isEqualToString:@"AppRemoved"];
      }
    }
    BOOL v19 = 0;
LABEL_10:
    double v15 = v16;
LABEL_15:

    goto LABEL_16;
  }
LABEL_11:
  BOOL v19 = 0;
LABEL_17:

  return v19;
}

- (id)fetchStackConfigSummaryForWidgetBundleId:(id)a3 appBundleId:(id)a4 widgetKind:(id)a5 widgetSize:(int64_t)a6 withPBTimelineRelevanceContainer:(id)a7 anonymizeTimestampsRelativeTo:(double)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v27 = v14;
  __int16 v17 = [(ATXInformationStore *)self->_informationStore fetchStackConfigStatisticsForWidgetBundleId:v13 widgetKind:v15 containerBundleIdentifier:v14 widgetFamily:a6];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v23 = objc_opt_new();
        double v24 = [v22 timestamp];
        [v24 timeIntervalSinceReferenceDate];
        [v23 setTimestamp:(uint64_t)(v25 - a8)];

        if ([v22 countOfSmartStacksWithWidget] >= 1) {
          objc_msgSend(v23, "setSmartStacksWithWidget:", objc_msgSend(v22, "countOfSmartStacksWithWidget"));
        }
        if ([v22 countOfNonSmartStacksWithWidget] >= 1) {
          objc_msgSend(v23, "setNonSmartStacksWithWidget:", objc_msgSend(v22, "countOfNonSmartStacksWithWidget"));
        }
        if ([v22 countOfStandaloneWidgets] >= 1) {
          objc_msgSend(v23, "setStandaloneWidgets:", objc_msgSend(v22, "countOfStandaloneWidgets"));
        }
        if ([v22 countOfWidgetsWithUnknownStackKind] >= 1) {
          objc_msgSend(v23, "setWidgetsWithUnknownStackKind:", objc_msgSend(v22, "countOfWidgetsWithUnknownStackKind"));
        }
        [v16 addObject:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v19);
  }

  return v16;
}

- (BOOL)_shouldProcessEvent:(id)a3
{
  double v4 = [a3 homeScreenEvent];
  double v5 = [v4 date];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [(NSDate *)self->_loggingStartDate timeIntervalSinceReferenceDate];
  LOBYTE(self) = v7 > v8;

  return (char)self;
}

+ (double)roundNumber:(id)a3 toSignificantFigures:(unint64_t)a4
{
  id v5 = a3;
  double v6 = 0.0;
  if (([v5 isEqualToNumber:&unk_1F27F2268] & 1) == 0)
  {
    if (a4)
    {
      [v5 doubleValue];
      double v8 = log10(v7);
      double v9 = __exp10((double)a4 - ceil(v8));
      [v5 doubleValue];
      double v6 = round(v9 * v10) / v9;
    }
    else
    {
      id v11 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[ATXTimelineRelevanceMetricHarvester roundNumber:toSignificantFigures:]();
      }
    }
  }

  return v6;
}

+ (int)PBClientModelFromString:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F93940];
  id v4 = a3;
  id v5 = [v3 clientModelIdFromClientModelType:19];
  int v6 = [v4 isEqualToString:v5];

  return v6 ^ 1;
}

+ (int)PBTimelineRelevanceEngagementFromATXStackRotationEngagementStatus:(unint64_t)a3
{
  if (a3 > 4) {
    return 1;
  }
  else {
    return dword_1D142BBC8[a3];
  }
}

+ (int)PBWidgetFamilyFromCHSWidgetFamily:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return dword_1D142BBDC[a3 - 1];
  }
}

+ (int)PBTimelineEntrySuggestionMappingReasonFrom:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return dword_1D142BBF0[a3];
  }
}

+ (int)PBTimelineRelevanceRotationEventTypeFromReason:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  id v5 = NSStringForATXHomeScreenStackChangeReason();
  char v6 = [v3 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    long double v7 = NSStringForATXHomeScreenStackChangeReason();
    char v8 = [v3 isEqualToString:v7];

    if (v8)
    {
      int v4 = 0;
    }
    else
    {
      double v9 = NSStringForATXHomeScreenStackChangeReason();
      char v10 = [v3 isEqualToString:v9];

      if (v10)
      {
        int v4 = 2;
      }
      else
      {
        id v11 = NSStringForATXHomeScreenStackChangeReason();
        char v12 = [v3 isEqualToString:v11];

        if (v12)
        {
          int v4 = 3;
        }
        else
        {
          id v13 = NSStringForATXHomeScreenStackChangeReason();
          char v14 = [v3 isEqualToString:v13];

          if (v14)
          {
            int v4 = 4;
          }
          else
          {
            id v15 = NSStringForATXHomeScreenStackChangeReason();
            char v16 = [v3 isEqualToString:v15];

            if (v16)
            {
              int v4 = 5;
            }
            else
            {
              __int16 v17 = NSStringForATXHomeScreenStackChangeReason();
              char v18 = [v3 isEqualToString:v17];

              if (v18)
              {
                int v4 = 6;
              }
              else
              {
                uint64_t v19 = NSStringForATXHomeScreenStackChangeReason();
                int v20 = [v3 isEqualToString:v19];

                if (v20) {
                  int v4 = 7;
                }
                else {
                  int v4 = 8;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

+ (int)PBTimelineRelevanceAbuseControlOutcomeTypeFrom:(int64_t)a3
{
  if ((unint64_t)a3 > 0x17) {
    return 1;
  }
  else {
    return dword_1D142BC0C[a3];
  }
}

- (id)timeOfLatestMetricsSubmission
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  int v4 = (NSUserDefaults *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B690]];
  defaults = self->_defaults;
  self->_defaults = v4;

  char v6 = self->_defaults;
  return [(NSUserDefaults *)v6 objectForKey:@"timeOfLatestMetricsSubmissionForTimelineRelevance"];
}

- (void)_updateMetricsSubmissionDateTo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_loggingStartDate, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
}

- (void)_addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "ATXHomeScreenLogUploader: Verified Biome timestamps, proceeding to upload", v1, 2u);
}

- (void)_addRotationHistoryForWidgetBundleId:appBundleId:widgetKind:widgetSize:withPBTimelineRelevanceContainer:anonymizeTimestampsRelativeTo:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXHomeScreenLogUploader: Malformed stream - there seem to be future events. Bailing on log upload", v2, v3, v4, v5, v6);
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ATXTimelineRelevanceMetricHarvester: Error BMStoreEvent.eventBody is nil", v2, v3, v4, v5, v6);
}

void __173__ATXTimelineRelevanceMetricHarvester__addRotationHistoryForWidgetBundleId_appBundleId_widgetKind_widgetSize_withPBTimelineRelevanceContainer_anonymizeTimestampsRelativeTo___block_invoke_137_cold_1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  char v8 = NSStringFromWidgetFamily();
  double v9 = [a2 error];
  int v10 = 138413314;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2112;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  __int16 v17 = v8;
  __int16 v18 = 2112;
  uint64_t v19 = v9;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "ATXTimelineRelevanceMetricHarvester: Error encountered while fetching rotation events from Biome for widgetBundleId: %@, appBundleId: %@, widgetKind: %@, widgetFamily:%@: %@", (uint8_t *)&v10, 0x34u);
}

+ (void)roundNumber:toSignificantFigures:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Error when calling roundNumber:toSignificantFigures: number of significant figures must be a positive integer", v2, v3, v4, v5, v6);
}

@end