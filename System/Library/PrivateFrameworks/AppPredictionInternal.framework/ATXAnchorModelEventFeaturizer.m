@interface ATXAnchorModelEventFeaturizer
+ (id)locationOfInterestForAnchorOccurrenceDate:(id)a3;
+ (unint64_t)getMinTemporalDistanceFromAnchorDate:(id)a3 toTimeRange:(_NSRange)a4;
+ (void)setHourofDayAndDayOfWeekFromDate:(id)a3 anchorMetadata:(id)a4;
+ (void)setLocationAndLocationTypeOnDate:(id)a3 anchorMetadata:(id)a4;
+ (void)setMonthAndDayOfMonthFromDate:(id)a3 anchorMetadata:(id)a4;
- (ATXAnchorModelEventFeaturizer)init;
- (BOOL)shouldComputeLaunchHistoryForActionKeyLaunches;
- (BOOL)shouldComputeLaunchHistoryForActionUUIDLaunches;
- (BOOL)shouldComputeLaunchHistoryForAppLaunches;
- (id)earliestDate:(id)a3;
- (id)featurizeActionEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeActionKeyForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeActionUUIDForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeAnchorEvent:(id)a3 anchor:(id)a4;
- (id)featurizeAppLaunchEvents:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeAppLaunchForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeLinkActionEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)featurizeModeEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)historyForActionUUIDWithAppIntentDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)historyForAppLaunchDuetEvents:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)historyForLinkActionChangeEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)historyForModeChangeEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)numAppLaunchesForBundleIds:(id)a3 endDate:(id)a4 dateBuckets:(id)a5;
- (id)numEventsForEventIds:(id)a3 dateBuckets:(id)a4 biomePublisher:(id)a5;
- (id)numModeChangesForModeCandidateId:(id)a3 endDate:(id)a4 dateBuckets:(id)a5;
- (id)numModeChangesForModeCandidateIds:(id)a3 endDate:(id)a4 dateBuckets:(id)a5;
- (id)recentHistoryForActionUUIDWithAppIntentDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)recentHistoryForAppLaunchDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (id)recentHistoryForModeWithModeEvent:(id)a3 anchorOccurrenceDate:(id)a4;
- (void)setShouldComputeLaunchHistoryForActionKeyLaunches:(BOOL)a3;
- (void)setShouldComputeLaunchHistoryForActionUUIDLaunches:(BOOL)a3;
- (void)setShouldComputeLaunchHistoryForAppLaunches:(BOOL)a3;
- (void)warmLaunchHistoryForAppEvents:(id)a3 anchorOccurrenceDate:(id)a4;
@end

@implementation ATXAnchorModelEventFeaturizer

- (ATXAnchorModelEventFeaturizer)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXAnchorModelEventFeaturizer;
  result = [(ATXAnchorModelEventFeaturizer *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_shouldComputeLaunchHistoryForAppLaunches = 257;
    result->_shouldComputeLaunchHistoryForActionUUIDLaunches = 1;
  }
  return result;
}

+ (void)setHourofDayAndDayOfWeekFromDate:(id)a3 anchorMetadata:(id)a4
{
  id v10 = a4;
  v5 = +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:a3 timeZone:0];
  v6 = [v5 first];
  if (([v6 integerValue] & 0x8000000000000000) == 0)
  {
    v7 = [v5 second];
    uint64_t v8 = [v7 integerValue];

    if (v8 < 0) {
      goto LABEL_5;
    }
    v9 = [v5 first];
    objc_msgSend(v10, "setHourOfDay:", objc_msgSend(v9, "unsignedIntValue") / 0xE10uLL);

    v6 = [v5 second];
    objc_msgSend(v10, "setDayOfWeek:", objc_msgSend(v6, "unsignedIntValue") + 1);
  }

LABEL_5:
}

+ (void)setMonthAndDayOfMonthFromDate:(id)a3 anchorMetadata:(id)a4
{
  id v10 = a4;
  v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a3;
  id v7 = [v5 alloc];
  uint64_t v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v9 = [v8 components:24 fromDate:v6];

  if (([v9 month] & 0x8000000000000000) == 0 && (objc_msgSend(v9, "day") & 0x8000000000000000) == 0)
  {
    objc_msgSend(v10, "setMonth:", objc_msgSend(v9, "month"));
    objc_msgSend(v10, "setDayOfMonth:", objc_msgSend(v9, "day"));
  }
}

+ (void)setLocationAndLocationTypeOnDate:(id)a3 anchorMetadata:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() locationOfInterestForAnchorOccurrenceDate:v5];

  if (v6)
  {
    id v7 = [v6 uuid];
    uint64_t v8 = [v7 UUIDString];
    [v11 setLocationIdentifier:v8];

    unint64_t v9 = [v6 type];
    if (v9 > 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = dword_1D142B250[v9];
    }
    [v11 setLocationType:v10];
  }
}

- (id)featurizeAnchorEvent:(id)a3 anchor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  objc_msgSend(v7, "setAnchorType:", objc_msgSend((id)objc_opt_class(), "anchorType"));
  uint64_t v8 = [v6 identifier];
  [v7 setAnchorEventIdentifier:v8];

  objc_msgSend(v7, "setAnchorEventType:", objc_msgSend((id)objc_opt_class(), "pbAnchorEventTypeFromDuetEvent:", v6));
  unint64_t v9 = objc_opt_class();

  uint64_t v10 = [v9 anchorOccurenceDateFromDuetEvent:v6];

  [(id)objc_opt_class() setHourofDayAndDayOfWeekFromDate:v10 anchorMetadata:v7];
  [(id)objc_opt_class() setMonthAndDayOfMonthFromDate:v10 anchorMetadata:v7];
  [(id)objc_opt_class() setLocationAndLocationTypeOnDate:v10 anchorMetadata:v7];

  return v7;
}

+ (unint64_t)getMinTemporalDistanceFromAnchorDate:(id)a3 toTimeRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  int64_t location = a4.location;
  id v6 = a3;
  [v6 timeIntervalSinceReferenceDate];
  if (v7 >= (double)location)
  {
    uint64_t v9 = location + length;
    [v6 timeIntervalSinceReferenceDate];
    if (v10 <= (double)v9)
    {
      unint64_t v12 = 0;
      goto LABEL_7;
    }
    [v6 timeIntervalSinceReferenceDate];
    int64_t location = (uint64_t)v11;
  }
  else
  {
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v9 = (uint64_t)v8;
  }
  unint64_t v12 = location - v9;
LABEL_7:

  return v12;
}

+ (id)locationOfInterestForAnchorOccurrenceDate:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v35 = [MEMORY[0x1E4F935D0] sharedInstance];
  [v3 timeIntervalSinceNow];
  if (v4 <= -120.0 || ([v3 timeIntervalSinceNow], v5 >= 0.0))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v9 = [v3 dateByAddingTimeInterval:-115200.0];
    double v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    uint64_t v11 = [v8 initWithStartDate:v9 endDate:v10];

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__7;
    v52 = __Block_byref_object_dispose__7;
    id v53 = 0;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __75__ATXAnchorModelEventFeaturizer_locationOfInterestForAnchorOccurrenceDate___block_invoke;
    v45[3] = &unk_1E68AC9A8;
    v47 = &v48;
    v13 = v12;
    v46 = v13;
    v34 = (void *)v11;
    [v35 fetchLocationsOfInterestVisitedDuring:v11 handler:v45];
    if ([MEMORY[0x1E4F93B18] waitForSemaphore:v13 timeoutSeconds:2.0])
    {
      v14 = __atxlog_handle_anchor();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "LOI fetch near anchor timed out", buf, 2u);
      }
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v14 = (id)v49[5];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v55 count:16];
      if (v15)
      {
        v16 = 0;
        uint64_t v17 = *(void *)v42;
        unint64_t v18 = 900;
        v33 = v14;
        uint64_t v30 = *(void *)v42;
        do
        {
          uint64_t v19 = 0;
          uint64_t v31 = v15;
          do
          {
            if (*(void *)v42 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v32 = v19;
            v20 = *(void **)(*((void *)&v41 + 1) + 8 * v19);
            v21 = [v20 visits];
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v54 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v38;
              while (2)
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v38 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = [*(id *)(*((void *)&v37 + 1) + 8 * i) rangeValue];
                  unint64_t v28 = +[ATXAnchorModelEventFeaturizer getMinTemporalDistanceFromAnchorDate:toTimeRange:](ATXAnchorModelEventFeaturizer, "getMinTemporalDistanceFromAnchorDate:toTimeRange:", v3, v26, v27);
                  if (v28 < v18)
                  {
                    id v7 = v20;

                    if (!v28)
                    {

                      v14 = v33;
                      goto LABEL_29;
                    }
                    v16 = v7;
                    unint64_t v18 = v28;
                  }
                }
                uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v54 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }

            uint64_t v19 = v32 + 1;
            v14 = v33;
            uint64_t v17 = v30;
          }
          while (v32 + 1 != v31);
          uint64_t v15 = [v33 countByEnumeratingWithState:&v41 objects:v55 count:16];
        }
        while (v15);
        id v7 = v16;
        goto LABEL_29;
      }
    }
    id v7 = 0;
LABEL_29:

    _Block_object_dispose(&v48, 8);
    goto LABEL_30;
  }
  id v6 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[ATXAnchorModelEventFeaturizer locationOfInterestForAnchorOccurrenceDate:](v6);
  }

  v34 = [v35 previousLOIAndCurrentLOI];
  id v7 = [v34 second];
LABEL_30:

  return v7;
}

void __75__ATXAnchorModelEventFeaturizer_locationOfInterestForAnchorOccurrenceDate___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)warmLaunchHistoryForAppEvents:(id)a3 anchorOccurrenceDate:(id)a4
{
  v37[6] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = (NSMutableDictionary *)objc_opt_new();
  bundleIdToLaunchHistoryDict = self->_bundleIdToLaunchHistoryDict;
  self->_bundleIdToLaunchHistoryDict = v8;

  uint64_t v27 = [v6 dateByAddingTimeInterval:-2419201.0];
  uint64_t v26 = [v6 dateByAddingTimeInterval:-1209601.0];
  double v10 = [v6 dateByAddingTimeInterval:-604801.0];
  uint64_t v11 = [v6 dateByAddingTimeInterval:-172801.0];
  dispatch_semaphore_t v12 = [v6 dateByAddingTimeInterval:-86401.0];
  v13 = [v6 dateByAddingTimeInterval:-43201.0];
  v37[0] = v27;
  v37[1] = v26;
  v37[2] = v10;
  v37[3] = v11;
  v37[4] = v12;
  v37[5] = v13;
  unint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
  v14 = [v6 dateByAddingTimeInterval:-1.0];

  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v16 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_22);

  uint64_t v17 = [v15 initWithArray:v16];
  unint64_t v18 = (void *)v17;
  uint64_t v19 = [(ATXAnchorModelEventFeaturizer *)self numAppLaunchesForBundleIds:v17 endDate:v14 dateBuckets:v28];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __84__ATXAnchorModelEventFeaturizer_warmLaunchHistoryForAppEvents_anchorOccurrenceDate___block_invoke_2;
  v29[3] = &unk_1E68AC9F0;
  id v30 = v27;
  id v31 = v26;
  id v32 = v10;
  id v33 = v11;
  id v34 = v12;
  id v35 = v13;
  v36 = self;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  id v24 = v26;
  id v25 = v27;
  [v19 enumerateKeysAndObjectsUsingBlock:v29];
}

uint64_t __84__ATXAnchorModelEventFeaturizer_warmLaunchHistoryForAppEvents_anchorOccurrenceDate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

void __84__ATXAnchorModelEventFeaturizer_warmLaunchHistoryForAppEvents_anchorOccurrenceDate___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v13 = (id)objc_opt_new();
  id v7 = [v5 objectForKeyedSubscript:a1[4]];
  objc_msgSend(v13, "setLaunchesInLast28Days:", objc_msgSend(v7, "unsignedIntValue"));

  id v8 = [v5 objectForKeyedSubscript:a1[5]];
  objc_msgSend(v13, "setLaunchesInLast14Days:", objc_msgSend(v8, "unsignedIntValue"));

  uint64_t v9 = [v5 objectForKeyedSubscript:a1[6]];
  objc_msgSend(v13, "setLaunchesInLast7Days:", objc_msgSend(v9, "unsignedIntValue"));

  double v10 = [v5 objectForKeyedSubscript:a1[7]];
  objc_msgSend(v13, "setLaunchesInLast48Hours:", objc_msgSend(v10, "unsignedIntValue"));

  uint64_t v11 = [v5 objectForKeyedSubscript:a1[8]];
  objc_msgSend(v13, "setLaunchesInLast24Hours:", objc_msgSend(v11, "unsignedIntValue"));

  dispatch_semaphore_t v12 = [v5 objectForKeyedSubscript:a1[9]];

  objc_msgSend(v13, "setLaunchesInLast12Hours:", objc_msgSend(v12, "unsignedIntValue"));
  [*(id *)(a1[10] + 8) setObject:v13 forKeyedSubscript:v6];
}

- (id)historyForAppLaunchDuetEvents:(id)a3 anchorOccurrenceDate:(id)a4
{
  v58[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __84__ATXAnchorModelEventFeaturizer_historyForAppLaunchDuetEvents_anchorOccurrenceDate___block_invoke;
  v56[3] = &unk_1E68ACA18;
  v56[4] = self;
  long long v44 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", v56);
  uint64_t v8 = objc_msgSend(v44, "_pas_mappedArrayWithTransform:", &__block_literal_global_29);
  uint64_t v9 = [v7 dateByAddingTimeInterval:-2419201.0];
  uint64_t v10 = [v7 dateByAddingTimeInterval:-1209601.0];
  uint64_t v11 = [v7 dateByAddingTimeInterval:-604801.0];
  uint64_t v12 = [v7 dateByAddingTimeInterval:-172801.0];
  uint64_t v13 = [v7 dateByAddingTimeInterval:-86401.0];
  uint64_t v14 = [v7 dateByAddingTimeInterval:-43201.0];
  v45 = v7;
  uint64_t v15 = [v7 dateByAddingTimeInterval:-1.0];
  uint64_t v50 = (void *)v10;
  v51 = (void *)v9;
  v58[0] = v9;
  v58[1] = v10;
  uint64_t v48 = (void *)v12;
  v49 = (void *)v11;
  v58[2] = v11;
  v58[3] = v12;
  v46 = (void *)v14;
  v47 = (void *)v13;
  v58[4] = v13;
  v58[5] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:6];
  long long v43 = (void *)v8;
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
  long long v41 = (void *)v16;
  long long v42 = (void *)v15;
  unint64_t v18 = [(ATXAnchorModelEventFeaturizer *)self numAppLaunchesForBundleIds:v17 endDate:v15 dateBuckets:v16];

  uint64_t v19 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v53 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        bundleIdToLaunchHistoryDict = self->_bundleIdToLaunchHistoryDict;
        uint64_t v27 = [v25 bundleId];
        unint64_t v28 = [(NSMutableDictionary *)bundleIdToLaunchHistoryDict objectForKeyedSubscript:v27];

        if (v28)
        {
          v29 = self->_bundleIdToLaunchHistoryDict;
          id v30 = [v25 bundleId];
          id v31 = [(NSMutableDictionary *)v29 objectForKeyedSubscript:v30];
          id v32 = v31;
        }
        else
        {
          id v31 = objc_opt_new();
          id v33 = [v25 bundleId];
          id v32 = [v18 objectForKeyedSubscript:v33];

          id v34 = [v32 objectForKeyedSubscript:v51];
          objc_msgSend(v31, "setLaunchesInLast28Days:", objc_msgSend(v34, "unsignedIntValue"));

          id v35 = [v32 objectForKeyedSubscript:v50];
          objc_msgSend(v31, "setLaunchesInLast14Days:", objc_msgSend(v35, "unsignedIntValue"));

          v36 = [v32 objectForKeyedSubscript:v49];
          objc_msgSend(v31, "setLaunchesInLast7Days:", objc_msgSend(v36, "unsignedIntValue"));

          long long v37 = [v32 objectForKeyedSubscript:v48];
          objc_msgSend(v31, "setLaunchesInLast48Hours:", objc_msgSend(v37, "unsignedIntValue"));

          long long v38 = [v32 objectForKeyedSubscript:v47];
          objc_msgSend(v31, "setLaunchesInLast24Hours:", objc_msgSend(v38, "unsignedIntValue"));

          long long v39 = [v32 objectForKeyedSubscript:v46];
          objc_msgSend(v31, "setLaunchesInLast12Hours:", objc_msgSend(v39, "unsignedIntValue"));

          id v30 = v31;
        }
        [v19 addObject:v31];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v22);
  }

  return v19;
}

BOOL __84__ATXAnchorModelEventFeaturizer_historyForAppLaunchDuetEvents_anchorOccurrenceDate___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [a2 bundleId];
  id v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

uint64_t __84__ATXAnchorModelEventFeaturizer_historyForAppLaunchDuetEvents_anchorOccurrenceDate___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

- (id)historyForModeChangeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  v27[6] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = [v5 dateByAddingTimeInterval:-2419201.0];
  uint64_t v9 = [v5 dateByAddingTimeInterval:-1209601.0];
  uint64_t v10 = [v5 dateByAddingTimeInterval:-604801.0];
  uint64_t v22 = [v5 dateByAddingTimeInterval:-172801.0];
  id v24 = [v5 dateByAddingTimeInterval:-86401.0];
  uint64_t v11 = [v5 dateByAddingTimeInterval:-43201.0];
  uint64_t v26 = (void *)v8;
  v27[0] = v8;
  v27[1] = v9;
  v27[2] = v10;
  v27[3] = v22;
  v27[4] = v24;
  v27[5] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:6];
  uint64_t v13 = [v5 dateByAddingTimeInterval:-1.0];

  id v25 = +[ATXAnchorModelDataStoreWrapper candidateIdFromModeBiomeEvent:v6];

  uint64_t v14 = [(ATXAnchorModelEventFeaturizer *)self numModeChangesForModeCandidateId:v25 endDate:v13 dateBuckets:v12];
  uint64_t v15 = [v14 objectForKeyedSubscript:v8];
  objc_msgSend(v7, "setLaunchesInLast28Days:", objc_msgSend(v15, "unsignedIntValue"));

  uint64_t v16 = [v14 objectForKeyedSubscript:v9];
  objc_msgSend(v7, "setLaunchesInLast14Days:", objc_msgSend(v16, "unsignedIntValue"));

  uint64_t v17 = [v14 objectForKeyedSubscript:v10];
  objc_msgSend(v7, "setLaunchesInLast7Days:", objc_msgSend(v17, "unsignedIntValue"));

  unint64_t v18 = [v14 objectForKeyedSubscript:v22];
  objc_msgSend(v7, "setLaunchesInLast48Hours:", objc_msgSend(v18, "unsignedIntValue"));

  uint64_t v19 = [v14 objectForKeyedSubscript:v24];
  objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v19, "unsignedIntValue"));

  id v20 = [v14 objectForKeyedSubscript:v11];
  objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v20, "unsignedIntValue"));

  return v7;
}

- (id)historyForLinkActionChangeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  v42[6] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = [v6 dateByAddingTimeInterval:-2419201.0];
  uint64_t v9 = [v6 dateByAddingTimeInterval:-1209601.0];
  uint64_t v10 = [v6 dateByAddingTimeInterval:-604801.0];
  uint64_t v11 = [v6 dateByAddingTimeInterval:-172801.0];
  uint64_t v12 = [v6 dateByAddingTimeInterval:-86401.0];
  [v6 dateByAddingTimeInterval:-43201.0];
  long long v38 = (void *)v9;
  long long v39 = (void *)v8;
  v42[0] = v8;
  v42[1] = v9;
  v36 = uint64_t v13 = (void *)v12;
  long long v37 = (void *)v10;
  v42[2] = v10;
  v42[3] = v11;
  v42[4] = v12;
  v42[5] = v36;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:6];
  uint64_t v15 = [v6 dateByAddingTimeInterval:-1.0];
  uint64_t v16 = [(ATXAnchorModelEventFeaturizer *)self earliestDate:v14];
  id v41 = 0;
  uint64_t v17 = +[ATXLinkTranscriptUtil systemLinkTranscriptPublisherFromDate:v16 toDate:v15 error:&v41];
  id v18 = v41;

  uint64_t v35 = (uint64_t)v18;
  if (v18)
  {
    uint64_t v19 = (void *)v36;
    id v20 = v13;
    uint64_t v21 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = (void *)v35;
      -[ATXAnchorModelEventFeaturizer historyForLinkActionChangeEvent:anchorOccurrenceDate:](v35, v21);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v21 = +[ATXAnchorModelDataStoreWrapper candidateIdFromLinkActionBiomeEvent:v40];
    uint64_t v23 = (void *)MEMORY[0x1D25F6CC0]();
    id v34 = v11;
    id v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v21, 0);
    id v25 = [(ATXAnchorModelEventFeaturizer *)self numEventsForEventIds:v24 dateBuckets:v14 biomePublisher:v17];
    uint64_t v26 = [v25 objectForKeyedSubscript:v21];

    uint64_t v11 = v34;
    uint64_t v27 = [v26 objectForKeyedSubscript:v39];
    objc_msgSend(v7, "setLaunchesInLast28Days:", objc_msgSend(v27, "unsignedIntValue"));

    unint64_t v28 = [v26 objectForKeyedSubscript:v38];
    objc_msgSend(v7, "setLaunchesInLast14Days:", objc_msgSend(v28, "unsignedIntValue"));

    v29 = [v26 objectForKeyedSubscript:v37];
    objc_msgSend(v7, "setLaunchesInLast7Days:", objc_msgSend(v29, "unsignedIntValue"));

    id v30 = [v26 objectForKeyedSubscript:v34];
    objc_msgSend(v7, "setLaunchesInLast48Hours:", objc_msgSend(v30, "unsignedIntValue"));

    id v31 = [v26 objectForKeyedSubscript:v13];
    objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v31, "unsignedIntValue"));

    id v32 = [v26 objectForKeyedSubscript:v36];
    objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v32, "unsignedIntValue"));

    id v20 = v13;
    uint64_t v19 = (void *)v36;
  }
  uint64_t v22 = (void *)v35;
LABEL_6:

  return v7;
}

- (id)recentHistoryForAppLaunchDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v6 dateByAddingTimeInterval:-86401.0];
  uint64_t v10 = [v6 dateByAddingTimeInterval:-43201.0];
  v22[0] = v9;
  v22[1] = v10;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v11 = [v6 dateByAddingTimeInterval:-1.0];

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v13 = [v7 bundleId];
  uint64_t v14 = objc_msgSend(v12, "initWithObjects:", v13, 0);
  uint64_t v15 = [(ATXAnchorModelEventFeaturizer *)self numAppLaunchesForBundleIds:v14 endDate:v11 dateBuckets:v21];
  uint64_t v16 = [v7 bundleId];

  uint64_t v17 = [v15 objectForKeyedSubscript:v16];

  id v18 = [v17 objectForKeyedSubscript:v9];
  objc_msgSend(v8, "setLaunchesInLast24Hours:", objc_msgSend(v18, "unsignedIntValue"));

  uint64_t v19 = [v17 objectForKeyedSubscript:v10];
  objc_msgSend(v8, "setLaunchesInLast12Hours:", objc_msgSend(v19, "unsignedIntValue"));

  return v8;
}

- (id)recentHistoryForModeWithModeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [v6 dateByAddingTimeInterval:-86401.0];
  uint64_t v10 = [v6 dateByAddingTimeInterval:-43201.0];
  v18[0] = v9;
  v18[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  id v12 = [v6 dateByAddingTimeInterval:-1.0];

  uint64_t v13 = +[ATXAnchorModelDataStoreWrapper candidateIdFromBiomeEvent:v7];

  uint64_t v14 = [(ATXAnchorModelEventFeaturizer *)self numModeChangesForModeCandidateId:v13 endDate:v12 dateBuckets:v11];

  uint64_t v15 = [v14 objectForKeyedSubscript:v9];
  objc_msgSend(v8, "setLaunchesInLast24Hours:", objc_msgSend(v15, "unsignedIntValue"));

  uint64_t v16 = [v14 objectForKeyedSubscript:v10];
  objc_msgSend(v8, "setLaunchesInLast12Hours:", objc_msgSend(v16, "unsignedIntValue"));

  return v8;
}

- (id)numAppLaunchesForBundleIds:(id)a3 endDate:(id)a4 dateBuckets:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BiomeLibrary();
  id v12 = [v11 App];
  uint64_t v13 = [v12 InFocus];
  uint64_t v14 = [(ATXAnchorModelEventFeaturizer *)self earliestDate:v8];
  uint64_t v15 = objc_msgSend(v13, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v9, 0, 0, 0);

  uint64_t v16 = [v15 filterWithIsIncluded:&__block_literal_global_35];

  uint64_t v17 = [(ATXAnchorModelEventFeaturizer *)self numEventsForEventIds:v10 dateBuckets:v8 biomePublisher:v16];

  return v17;
}

uint64_t __80__ATXAnchorModelEventFeaturizer_numAppLaunchesForBundleIds_endDate_dateBuckets___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  uint64_t v3 = [v2 starting];

  return v3;
}

- (id)numModeChangesForModeCandidateId:(id)a3 endDate:(id)a4 dateBuckets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1D25F6CC0]();
  id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0, 0);
  uint64_t v13 = [(ATXAnchorModelEventFeaturizer *)self numModeChangesForModeCandidateIds:v12 endDate:v9 dateBuckets:v10];
  uint64_t v14 = [v13 objectForKeyedSubscript:v8];

  return v14;
}

- (id)numModeChangesForModeCandidateIds:(id)a3 endDate:(id)a4 dateBuckets:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BiomeLibrary();
  id v12 = [v11 UserFocus];
  uint64_t v13 = [v12 ComputedMode];
  uint64_t v14 = [(ATXAnchorModelEventFeaturizer *)self earliestDate:v8];
  uint64_t v15 = objc_msgSend(v13, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v9, 0, 0, 0);

  uint64_t v16 = [(ATXAnchorModelEventFeaturizer *)self numEventsForEventIds:v10 dateBuckets:v8 biomePublisher:v15];

  return v16;
}

- (id)numEventsForEventIds:(id)a3 dateBuckets:(id)a4 biomePublisher:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  if (v10)
  {
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke;
    void v22[3] = &unk_1E68ACA40;
    objc_copyWeak(&v23, &location);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke_2;
    void v18[3] = &unk_1E68ACA68;
    id v19 = v8;
    id v20 = v9;
    id v12 = v11;
    id v21 = v12;
    id v13 = (id)[v10 sinkWithCompletion:v22 receiveInput:v18];
    uint64_t v14 = v21;
    id v15 = v12;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v16 = __atxlog_handle_anchor();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:](v16);
    }
  }
  return v11;
}

void __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

void __81__ATXAnchorModelEventFeaturizer_numEventsForEventIds_dateBuckets_biomePublisher___block_invoke_2(id *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[ATXAnchorModelDataStoreWrapper candidateIdFromBiomeEvent:v3];
  if (v4 && [a1[4] containsObject:v4])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    id v22 = v3;
    [v3 timestamp];
    id v6 = objc_msgSend(v5, "initWithTimeIntervalSinceReferenceDate:");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = a1[5];
    uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = [v6 earlierDate:v10];

          if (v11 != v6)
          {
            id v12 = [a1[6] objectForKeyedSubscript:v4];

            if (!v12)
            {
              id v13 = objc_opt_new();
              [a1[6] setObject:v13 forKeyedSubscript:v4];
            }
            uint64_t v14 = [a1[6] objectForKeyedSubscript:v4];
            id v15 = [v14 objectForKeyedSubscript:v10];

            if (!v15)
            {
              uint64_t v16 = [a1[6] objectForKeyedSubscript:v4];
              [v16 setObject:&unk_1F27F00C0 forKeyedSubscript:v10];
            }
            uint64_t v17 = NSNumber;
            id v18 = [a1[6] objectForKeyedSubscript:v4];
            id v19 = [v18 objectForKeyedSubscript:v10];
            id v20 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v19, "integerValue") + 1);
            id v21 = [a1[6] objectForKeyedSubscript:v4];
            [v21 setObject:v20 forKeyedSubscript:v10];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    id v3 = v22;
  }
}

- (id)earliestDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
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
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "earlierDate:", v4, (void)v14);

        if (v11 == v10)
        {
          id v12 = v10;

          id v4 = v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)featurizeAppLaunchEvents:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_shouldComputeLaunchHistoryForAppLaunches)
  {
    uint64_t v8 = [(ATXAnchorModelEventFeaturizer *)self historyForAppLaunchDuetEvents:v6 anchorOccurrenceDate:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = objc_opt_new();
  if ([v6 count])
  {
    unint64_t v10 = 0;
    v29 = v8;
    do
    {
      uint64_t v11 = [v6 objectAtIndexedSubscript:v10];
      id v12 = objc_opt_new();
      id v13 = [v11 bundleId];
      [v12 setBundleId:v13];

      long long v14 = [v11 startDate];
      [v14 timeIntervalSinceDate:v7];
      [v12 setRelativeTimeSinceAnchorInSeconds:(int)v15];

      long long v16 = +[_ATXAppInfoManager sharedInstance];
      long long v17 = [v11 bundleId];
      id v18 = [v16 appInfoForBundleId:v17];

      uint64_t v19 = [v18 installDate];
      if (v19)
      {
        [v7 timeIntervalSinceDate:v19];
        BOOL v21 = v20 < 172800.0;
      }
      else
      {
        BOOL v21 = 0;
      }
      [v12 setAppInstalledInLast48Hours:v21];
      id v22 = [v18 genreId];
      id v23 = v22;
      if (v22) {
        objc_msgSend(v12, "setGenreId:", objc_msgSend(v22, "longLongValue"));
      }
      objc_msgSend(v12, "setApp2VecCluster:", objc_msgSend(&unk_1F27F00C0, "longLongValue"));
      if (v8 && [v8 count] > v10)
      {
        [v8 objectAtIndexedSubscript:v10];
        id v24 = v6;
        id v25 = v7;
        v27 = long long v26 = v9;
        [v12 setAppLaunchHistory:v27];

        id v9 = v26;
        id v7 = v25;
        id v6 = v24;
        uint64_t v8 = v29;
      }
      [v9 addObject:v12];

      ++v10;
    }
    while ([v6 count] > v10);
  }

  return v9;
}

- (id)featurizeActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  id v9 = [(ATXAnchorModelEventFeaturizer *)self featurizeAppLaunchForActionEvent:v7 anchorOccurrenceDate:v6];
  [v8 setAppLaunchMetadata:v9];

  unint64_t v10 = [(ATXAnchorModelEventFeaturizer *)self featurizeActionKeyForActionEvent:v7 anchorOccurrenceDate:v6];
  [v8 setActionKeyMetadata:v10];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  id v12 = [(ATXAnchorModelEventFeaturizer *)self featurizeActionUUIDForActionEvent:v7 anchorOccurrenceDate:v6];

  id v13 = [v11 arrayWithObject:v12];
  [v8 setActionUUIDMetadatas:v13];

  return v8;
}

- (id)featurizeModeEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  id v9 = [v7 eventBody];
  unint64_t v10 = [v9 mode];
  [v8 setModeId:v10];

  uint64_t v11 = [v7 eventBody];
  objc_msgSend(v8, "setIsStart:", objc_msgSend(v11, "starting"));

  [v7 timestamp];
  double v13 = v12;
  [v6 timeIntervalSinceReferenceDate];
  [v8 setRelativeTimeSinceAnchorInSeconds:(int)(v13 - v14)];
  double v15 = [(ATXAnchorModelEventFeaturizer *)self historyForModeChangeEvent:v7 anchorOccurrenceDate:v6];

  [v8 setModeHistory:v15];
  return v8;
}

- (id)featurizeLinkActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  id v9 = [v7 eventBody];
  unint64_t v10 = [v9 bundleIdentifier];
  [v8 setBundleId:v10];

  uint64_t v11 = [v7 eventBody];
  double v12 = [v11 action];
  double v13 = [v12 identifier];
  [v8 setActionId:v13];

  [v7 timestamp];
  double v15 = v14;
  [v6 timeIntervalSinceReferenceDate];
  [v8 setRelativeTimeSinceAnchorInSeconds:(int)(v15 - v16)];
  long long v17 = [(ATXAnchorModelEventFeaturizer *)self historyForLinkActionChangeEvent:v7 anchorOccurrenceDate:v6];

  [v8 setActionHistory:v17];
  return v8;
}

- (id)featurizeAppLaunchForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [ATXAppLaunchDuetEvent alloc];
  id v9 = [v7 bundleId];
  unint64_t v10 = [v7 startDate];
  uint64_t v11 = [v7 endDate];

  double v12 = [(ATXAppLaunchDuetEvent *)v8 initWithBundleId:v9 startDate:v10 endDate:v11];
  v17[0] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v14 = [(ATXAnchorModelEventFeaturizer *)self featurizeAppLaunchEvents:v13 anchorOccurrenceDate:v6];

  double v15 = [v14 objectAtIndexedSubscript:0];

  return v15;
}

- (id)featurizeActionKeyForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  id v9 = [v6 actionType];
  [v8 setActionType:v9];

  if (self->_shouldComputeLaunchHistoryForActionKeyLaunches)
  {
    unint64_t v10 = objc_opt_new();
    id v11 = [NSString alloc];
    double v12 = [v6 bundleId];
    double v13 = [v6 actionType];
    double v14 = (void *)[v11 initWithFormat:@"%@:%@", v12, v13];

    double v15 = [v7 dateByAddingTimeInterval:-1.0];
    double v16 = (void *)MEMORY[0x1D25F6CC0]();
    long long v17 = [v15 dateByAddingTimeInterval:-2419201.0];
    id v18 = +[_ATXDataStore sharedInstance];
    objc_msgSend(v10, "setLaunchesInLast28Days:", objc_msgSend(v18, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v17, v15));

    uint64_t v19 = (void *)MEMORY[0x1D25F6CC0]();
    double v20 = [v15 dateByAddingTimeInterval:-1209601.0];
    BOOL v21 = +[_ATXDataStore sharedInstance];
    objc_msgSend(v10, "setLaunchesInLast14Days:", objc_msgSend(v21, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v20, v15));

    id v22 = (void *)MEMORY[0x1D25F6CC0]();
    id v23 = [v15 dateByAddingTimeInterval:-604801.0];
    id v24 = +[_ATXDataStore sharedInstance];
    objc_msgSend(v10, "setLaunchesInLast7Days:", objc_msgSend(v24, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v23, v15));

    id v25 = (void *)MEMORY[0x1D25F6CC0]();
    long long v26 = [v15 dateByAddingTimeInterval:-172801.0];
    long long v27 = +[_ATXDataStore sharedInstance];
    objc_msgSend(v10, "setLaunchesInLast48Hours:", objc_msgSend(v27, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v26, v15));

    long long v28 = (void *)MEMORY[0x1D25F6CC0]();
    v29 = [v15 dateByAddingTimeInterval:-86401.0];
    uint64_t v30 = +[_ATXDataStore sharedInstance];
    objc_msgSend(v10, "setLaunchesInLast24Hours:", objc_msgSend(v30, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v29, v15));

    id v31 = (void *)MEMORY[0x1D25F6CC0]();
    id v32 = [v15 dateByAddingTimeInterval:-43201.0];
    id v33 = +[_ATXDataStore sharedInstance];
    objc_msgSend(v10, "setLaunchesInLast12Hours:", objc_msgSend(v33, "numActionKeyOccurrencesForActionKey:startDate:endDate:", v14, v32, v15));

    [v8 setActionKeyLaunchHistory:v10];
  }
  return v8;
}

- (id)featurizeActionUUIDForActionEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  id v9 = [v6 parameterHashes];
  unint64_t v10 = [v9 firstObject];
  objc_msgSend(v8, "setActionUUID:", objc_msgSend(v10, "longLongValue"));

  id v11 = [v6 slotSetHashes];
  double v12 = [v11 firstObject];
  objc_msgSend(v8, "setSlotHash:", objc_msgSend(v12, "longLongValue"));

  double v13 = [v6 paramCount];
  objc_msgSend(v8, "setParamCount:", objc_msgSend(v13, "unsignedIntValue"));

  if (self->_shouldComputeLaunchHistoryForActionUUIDLaunches)
  {
    double v14 = [(ATXAnchorModelEventFeaturizer *)self historyForActionUUIDWithAppIntentDuetEvent:v6 anchorOccurrenceDate:v7];
    [v8 setActionUUIDLaunchHistory:v14];
  }
  return v8;
}

- (id)historyForActionUUIDWithAppIntentDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = [NSString alloc];
  id v9 = [v5 bundleId];
  unint64_t v10 = [v5 actionType];
  id v11 = (void *)[v8 initWithFormat:@"%@:%@", v9, v10];

  double v12 = [v5 parameterHashes];
  double v13 = [v12 firstObject];
  uint64_t v14 = [v13 unsignedIntegerValue];

  double v15 = [v6 dateByAddingTimeInterval:-1.0];
  double v16 = (void *)MEMORY[0x1D25F6CC0]();
  long long v17 = [v15 dateByAddingTimeInterval:-2419201.0];
  id v18 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast28Days:", objc_msgSend(v18, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v17, v15));

  uint64_t v19 = (void *)MEMORY[0x1D25F6CC0]();
  double v20 = [v15 dateByAddingTimeInterval:-1209601.0];
  BOOL v21 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast14Days:", objc_msgSend(v21, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v20, v15));

  id v22 = (void *)MEMORY[0x1D25F6CC0]();
  id v23 = [v15 dateByAddingTimeInterval:-604801.0];
  id v24 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast7Days:", objc_msgSend(v24, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v23, v15));

  id v25 = (void *)MEMORY[0x1D25F6CC0]();
  long long v26 = [v15 dateByAddingTimeInterval:-172801.0];
  long long v27 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast48Hours:", objc_msgSend(v27, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v26, v15));

  long long v28 = (void *)MEMORY[0x1D25F6CC0]();
  v29 = [v15 dateByAddingTimeInterval:-86401.0];
  uint64_t v30 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v30, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v29, v15));

  id v31 = (void *)MEMORY[0x1D25F6CC0]();
  id v32 = [v15 dateByAddingTimeInterval:-43201.0];
  id v33 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v33, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v32, v15));

  return v7;
}

- (id)recentHistoryForActionUUIDWithAppIntentDuetEvent:(id)a3 anchorOccurrenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  id v8 = [NSString alloc];
  id v9 = [v5 bundleId];
  unint64_t v10 = [v5 actionType];
  id v11 = (void *)[v8 initWithFormat:@"%@:%@", v9, v10];

  double v12 = [v5 parameterHashes];
  double v13 = [v12 firstObject];
  uint64_t v14 = [v13 unsignedIntegerValue];

  double v15 = [v6 dateByAddingTimeInterval:-1.0];
  double v16 = (void *)MEMORY[0x1D25F6CC0]();
  long long v17 = [v15 dateByAddingTimeInterval:-86401.0];
  id v18 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast24Hours:", objc_msgSend(v18, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v17, v15));

  uint64_t v19 = (void *)MEMORY[0x1D25F6CC0]();
  double v20 = [v15 dateByAddingTimeInterval:-43201.0];
  BOOL v21 = +[_ATXDataStore sharedInstance];
  objc_msgSend(v7, "setLaunchesInLast12Hours:", objc_msgSend(v21, "numActionParameterHashOccurrencesForActionKey:parameterHash:startDate:endDate:", v11, v14, v20, v15));

  return v7;
}

- (BOOL)shouldComputeLaunchHistoryForAppLaunches
{
  return self->_shouldComputeLaunchHistoryForAppLaunches;
}

- (void)setShouldComputeLaunchHistoryForAppLaunches:(BOOL)a3
{
  self->_shouldComputeLaunchHistoryForAppLaunches = a3;
}

- (BOOL)shouldComputeLaunchHistoryForActionKeyLaunches
{
  return self->_shouldComputeLaunchHistoryForActionKeyLaunches;
}

- (void)setShouldComputeLaunchHistoryForActionKeyLaunches:(BOOL)a3
{
  self->_shouldComputeLaunchHistoryForActionKeyLaunches = a3;
}

- (BOOL)shouldComputeLaunchHistoryForActionUUIDLaunches
{
  return self->_shouldComputeLaunchHistoryForActionUUIDLaunches;
}

- (void)setShouldComputeLaunchHistoryForActionUUIDLaunches:(BOOL)a3
{
  self->_shouldComputeLaunchHistoryForActionUUIDLaunches = a3;
}

- (void).cxx_destruct
{
}

+ (void)locationOfInterestForAnchorOccurrenceDate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Accessing the current location from ATXLocationManager during anchor event featurization since anchor occurred less than 2 minutes ago.", v1, 2u);
}

- (void)historyForLinkActionChangeEvent:(uint64_t)a1 anchorOccurrenceDate:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error when fetching Link transcript publisher: %@", (uint8_t *)&v2, 0xCu);
}

- (void)numEventsForEventIds:(os_log_t)log dateBuckets:biomePublisher:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "-[ATXAnchorModelEventFeaturizer numEventsForEventIds:dateBuckets:biomePublisher:]";
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "%s: could not access biome publisher", (uint8_t *)&v1, 0xCu);
}

@end