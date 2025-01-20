@interface ATXAnchorModelEventHarvester
+ (id)deduplicatedActionEventsByIdFromActionEvents:(id)a3;
+ (id)idsFromBiomeEvents:(id)a3;
+ (id)idsFromDuetEvents:(id)a3;
+ (id)negativeAppsGivenAllAppIds:(id)a3 positiveAppIds:(id)a4;
+ (id)randomSampleFromArray:(id)a3 sampleSize:(unint64_t)a4;
- (id)fetchAppLaunchEventsAfterAnchorOccurrenceDate:(id)a3 limit:(unint64_t)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6 isIncluded:(id)a7;
- (id)fetchEventsAfterAnchorOccurenceDate:(id)a3 withBiomePublisher:(id)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6;
- (id)fetchEventsAfterAnchorOccurenceDate:(id)a3 withBiomePublisher:(id)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6 isIncluded:(id)a7;
- (id)fetchEventsAfterAnchorOccurrenceDate:(id)a3 withDuetDataProviderClass:(Class)a4 limit:(unint64_t)a5 maxSecondsBeforeAnchor:(int64_t)a6 maxSecondsAfterAnchor:(int64_t)a7 predicates:(id)a8;
- (id)negativeActionsOnAnchorOccurrenceDate:(id)a3 positiveActionEvents:(id)a4;
- (id)negativeActionsOnAnchorOccurrenceDate:(id)a3 positiveActionIds:(id)a4;
@end

@implementation ATXAnchorModelEventHarvester

- (id)fetchEventsAfterAnchorOccurrenceDate:(id)a3 withDuetDataProviderClass:(Class)a4 limit:(unint64_t)a5 maxSecondsBeforeAnchor:(int64_t)a6 maxSecondsAfterAnchor:(int64_t)a7 predicates:(id)a8
{
  double v11 = (double)-a6;
  id v12 = a8;
  id v13 = a3;
  v14 = [v13 dateByAddingTimeInterval:v11];
  v15 = [v13 dateByAddingTimeInterval:(double)a7];

  v16 = objc_opt_new();
  v17 = [v16 fetchEventsBetweenStartDate:v14 andEndDate:v15 withPredicates:v12];

  if ([v17 count] <= a5) {
    a5 = [v17 count];
  }
  v18 = objc_msgSend(v17, "subarrayWithRange:", 0, a5);

  return v18;
}

- (id)fetchEventsAfterAnchorOccurenceDate:(id)a3 withBiomePublisher:(id)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6
{
  return [(ATXAnchorModelEventHarvester *)self fetchEventsAfterAnchorOccurenceDate:a3 withBiomePublisher:a4 maxSecondsBeforeAnchor:a5 maxSecondsAfterAnchor:a6 isIncluded:&__block_literal_global_30];
}

uint64_t __132__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor___block_invoke()
{
  return 1;
}

- (id)fetchEventsAfterAnchorOccurenceDate:(id)a3 withBiomePublisher:(id)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6 isIncluded:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a4;
  v14 = objc_opt_new();
  v15 = [v11 dateByAddingTimeInterval:(double)-a5];
  v16 = [v11 dateByAddingTimeInterval:(double)a6];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke;
  v32[3] = &unk_1E68AD388;
  id v33 = v15;
  id v34 = v16;
  id v35 = v12;
  id v17 = v12;
  id v18 = v16;
  id v19 = v15;
  v20 = [v13 filterWithIsIncluded:v32];

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2;
  v29[3] = &unk_1E68AD3B0;
  id v30 = v14;
  id v31 = v11;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_13;
  v27[3] = &unk_1E68ABB70;
  id v21 = v30;
  id v28 = v21;
  id v22 = v11;
  id v23 = (id)[v20 sinkWithCompletion:v29 receiveInput:v27];

  v24 = v28;
  id v25 = v21;

  return v25;
}

uint64_t __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  double v5 = v4;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  if (v5 >= v6
    && ([v3 timestamp],
        double v8 = v7,
        [*(id *)(a1 + 40) timeIntervalSinceReferenceDate],
        v8 <= v9))
  {
    uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  double v5 = __atxlog_handle_anchor();
  double v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(a1, v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events after anchor on %@", (uint8_t *)&v9, 0x16u);
  }
}

uint64_t __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)fetchAppLaunchEventsAfterAnchorOccurrenceDate:(id)a3 limit:(unint64_t)a4 maxSecondsBeforeAnchor:(int64_t)a5 maxSecondsAfterAnchor:(int64_t)a6 isIncluded:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  uint64_t v13 = [v12 dateByAddingTimeInterval:(double)-a5];
  v14 = [v12 dateByAddingTimeInterval:(double)a6];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke;
  v28[3] = &unk_1E68AD3D8;
  id v29 = v11;
  id v15 = v11;
  v16 = +[ATXAppLaunchDuetDataProvider biomePublisher:v13 andEndDate:v14 isIncluded:v28];
  id v17 = objc_opt_new();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2;
  v26[3] = &unk_1E68AD400;
  id v27 = v17;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_17;
  v23[3] = &unk_1E68AD428;
  id v18 = v27;
  id v24 = v18;
  unint64_t v25 = a4;
  id v19 = (id)[v16 sinkWithCompletion:v26 shouldContinue:v23];
  v20 = v24;
  id v21 = v18;

  return v21;
}

uint64_t __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  double v5 = __atxlog_handle_anchor();
  double v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(v3, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events", (uint8_t *)&v8, 0xCu);
  }
}

BOOL __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [*(id *)(a1 + 32) count];
  unint64_t v5 = *(void *)(a1 + 40);
  if (v4 < v5) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v4 < v5;
}

+ (id)negativeAppsGivenAllAppIds:(id)a3 positiveAppIds:(id)a4
{
  id v5 = a4;
  double v6 = (void *)[a3 mutableCopy];
  [v6 minusSet:v5];

  return v6;
}

- (id)negativeActionsOnAnchorOccurrenceDate:(id)a3 positiveActionEvents:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(id)objc_opt_class() idsFromDuetEvents:v6];

  int v9 = [(ATXAnchorModelEventHarvester *)self negativeActionsOnAnchorOccurrenceDate:v7 positiveActionIds:v8];

  return v9;
}

+ (id)idsFromDuetEvents:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1D25F6CC0](v6);
        id v12 = objc_msgSend(v10, "identifier", (void)v15);
        [v4 addObject:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  uint64_t v13 = (void *)[v4 copy];
  return v13;
}

+ (id)idsFromBiomeEvents:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1D25F6CC0]();
        id v12 = [NSString alloc];
        [v10 timestamp];
        v14 = objc_msgSend(v12, "initWithFormat:", @"%f", v13);
        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v4 copy];
  return v15;
}

+ (id)deduplicatedActionEventsByIdFromActionEvents:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
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
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1D25F6CC0](v7);
        uint64_t v13 = objc_msgSend(v11, "identifier", (void)v18);
        char v14 = [v5 containsObject:v13];

        if ((v14 & 1) == 0)
        {
          long long v15 = [v11 identifier];
          [v5 addObject:v15];

          [v4 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  long long v16 = (void *)[v4 copy];
  return v16;
}

- (id)negativeActionsOnAnchorOccurrenceDate:(id)a3 positiveActionIds:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[ATXAnchorModelHyperParameters sharedInstance];
  [v7 maxSecondsSinceCandidateOccurrenceToConsiderCandidateForPrediction];
  double v9 = v8;

  uint64_t v10 = +[_ATXDataStore sharedInstance];
  id v11 = [v5 dateByAddingTimeInterval:-v9];
  id v12 = [v10 appIntentDuetEventsForActionsBetweenStartDate:v11 endDate:v5];

  uint64_t v13 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelEventHarvester negativeActionsOnAnchorOccurrenceDate:positiveActionIds:](v12, v13, v9);
  }

  char v14 = objc_opt_new();
  if ([v12 count])
  {
    unint64_t v15 = 0;
    do
    {
      long long v16 = [v12 objectAtIndexedSubscript:v15];
      long long v17 = [v16 identifier];
      char v18 = [v6 containsObject:v17];

      if ((v18 & 1) == 0) {
        [v14 addIndex:v15];
      }

      ++v15;
    }
    while ([v12 count] > v15);
  }
  long long v19 = [v12 objectsAtIndexes:v14];
  long long v20 = __atxlog_handle_anchor();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[ATXAnchorModelEventHarvester negativeActionsOnAnchorOccurrenceDate:positiveActionIds:](v19, v20);
  }

  return v19;
}

+ (id)randomSampleFromArray:(id)a3 sampleSize:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  uint64_t v7 = objc_msgSend(v5, "_pas_shuffledArrayUsingRng:", v6);

  if ([v7 count] <= a4)
  {
    id v8 = v7;
  }
  else
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v9 = v8;

  return v9;
}

void __143__ATXAnchorModelEventHarvester_fetchEventsAfterAnchorOccurenceDate_withBiomePublisher_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [a2 error];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome for after the anchor event on date %@: %@", (uint8_t *)&v6, 0x16u);
}

void __140__ATXAnchorModelEventHarvester_fetchAppLaunchEventsAfterAnchorOccurrenceDate_limit_maxSecondsBeforeAnchor_maxSecondsAfterAnchor_isIncluded___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome: %@", (uint8_t *)&v4, 0xCu);
}

- (void)negativeActionsOnAnchorOccurrenceDate:(void *)a1 positiveActionIds:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Producing negative samples: %lu negative actions remain after filtering out positive actions.", (uint8_t *)&v3, 0xCu);
}

- (void)negativeActionsOnAnchorOccurrenceDate:(double)a3 positiveActionIds:.cold.2(void *a1, NSObject *a2, double a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Producing negative samples: fetched %lu actions that were received in the last %.2f seconds.", (uint8_t *)&v5, 0x16u);
}

@end