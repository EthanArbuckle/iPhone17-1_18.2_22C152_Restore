@interface ATXGlobalAppScorePredictor
+ (id)sharedInstance;
- (ATXGlobalAppScorePredictor)init;
- (id)globalPopularitiesAtTimeOfDay:(int)a3 atDayOfWeek:(int)a4 atLocation:(int)a5 withLastAppLaunched:(id)a6;
- (id)globalPopularitiesForBundleIds:(id)a3 atTimeOfDayIndex:(int)a4 atDayOfWeekIndex:(int)a5 atLocationIndex:(int)a6;
- (id)globalPopularitiesForBundleIds:(id)a3 atTimeOfDayIndex:(int)a4 atDayOfWeekIndex:(int)a5 atLocationIndex:(int)a6 withLastAppLaunched:(id)a7;
- (id)globalPopularityForBundleIds:(id)a3 atDate:(id)a4 atLocation:(int64_t)a5 withLastAppLaunched:(id)a6;
- (id)globalPopularityForBundleIdsGivenTimeDayAndLocation:(id)a3 context:(id)a4;
- (id)globalPopularityForBundleIdsGivenTimeDayLocationAndLastApp:(id)a3 context:(id)a4;
- (id)globalPopularityPredictor;
@end

@implementation ATXGlobalAppScorePredictor

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_37 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_37, &__block_literal_global_195);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_48;
  return v2;
}

void __44__ATXGlobalAppScorePredictor_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_48;
  sharedInstance__pasExprOnceResult_48 = v1;
}

- (ATXGlobalAppScorePredictor)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXGlobalAppScorePredictor;
  v2 = [(ATXGlobalAppScorePredictor *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[ATXGlobalAppScoresUtil initializeTrieAtPath:@"ATXGlobalAppSignalsIndex"];
    index = v2->_index;
    v2->_index = (_PASCFBurstTrie *)v3;

    uint64_t v5 = +[ATXGlobalAppScoresUtil initializeTrieAtPath:@"ATXGlobalAppSignalsHistogram"];
    signalsTrie = v2->_signalsTrie;
    v2->_signalsTrie = (_PASCFBurstTrie *)v5;
  }
  return v2;
}

- (id)globalPopularityPredictor
{
  return +[ATXGlobalAppScoresUtil loadCoreMLModelWithName:@"ATXGlobalAppSignals"];
}

- (id)globalPopularitiesAtTimeOfDay:(int)a3 atDayOfWeek:(int)a4 atLocation:(int)a5 withLastAppLaunched:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  v35[4] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v11 = [(ATXGlobalAppScorePredictor *)self globalPopularityPredictor];
  if (v11 && (index = self->_index) != 0)
  {
    uint64_t v13 = [(_PASCFBurstTrie *)index payloadForString:v10];
    v34[0] = @"TimeOfDay";
    v14 = [NSNumber numberWithInt:v8];
    v35[0] = v14;
    v34[1] = @"DayOfWeek";
    v15 = [NSNumber numberWithInt:v7];
    v35[1] = v15;
    v34[2] = @"Location";
    v16 = [NSNumber numberWithInt:v6];
    v35[2] = v16;
    v34[3] = @"LastApp";
    v17 = [NSNumber numberWithInt:v13];
    v35[3] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];

    v19 = objc_opt_new();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __103__ATXGlobalAppScorePredictor_globalPopularitiesAtTimeOfDay_atDayOfWeek_atLocation_withLastAppLaunched___block_invoke;
    v32[3] = &unk_1E68B49D8;
    id v20 = v19;
    id v33 = v20;
    [v18 enumerateKeysAndObjectsUsingBlock:v32];
    id v31 = 0;
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1E930]) initWithDictionary:v20 error:&v31];
    id v22 = v31;
    if (v22)
    {
      v23 = __atxlog_handle_app_prediction();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ATXGlobalAppScorePredictor globalPopularitiesAtTimeOfDay:atDayOfWeek:atLocation:withLastAppLaunched:]((uint64_t)v22, v23);
      }
    }
    id v30 = v22;
    v24 = [v11 predictionFromFeatures:v21 error:&v30];
    id v25 = v30;

    if (v25)
    {
      v26 = __atxlog_handle_app_prediction();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ATXGlobalAppScorePredictor globalPopularitiesAtTimeOfDay:atDayOfWeek:atLocation:withLastAppLaunched:]((uint64_t)v25, v26);
      }
    }
    v27 = [v24 featureValueForName:@"output"];
    v28 = [v27 multiArrayValue];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __103__ATXGlobalAppScorePredictor_globalPopularitiesAtTimeOfDay_atDayOfWeek_atLocation_withLastAppLaunched___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1E9A8];
  id v6 = a3;
  id v7 = a2;
  id v10 = 0;
  uint64_t v8 = (void *)[[v5 alloc] initWithShape:&unk_1F27F37C8 dataType:65600 error:&v10];
  id v9 = v10;
  [v8 setObject:v6 atIndexedSubscript:0];

  [*(id *)(a1 + 32) setObject:v8 forKey:v7];
}

- (id)globalPopularityForBundleIdsGivenTimeDayLocationAndLastApp:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 locationMotionContext];
  id v9 = [v8 currentLOI];

  if (v9) {
    uint64_t v10 = [v9 type];
  }
  else {
    uint64_t v10 = -1;
  }
  v11 = [v6 userContext];
  v12 = [v11 lastAppLaunch];

  uint64_t v13 = [v6 timeContext];

  v14 = [v13 date];

  v15 = [(ATXGlobalAppScorePredictor *)self globalPopularityForBundleIds:v7 atDate:v14 atLocation:v10 withLastAppLaunched:v12];

  return v15;
}

- (id)globalPopularityForBundleIds:(id)a3 atDate:(id)a4 atLocation:(int64_t)a5 withLastAppLaunched:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = +[ATXGlobalAppScoresUtil locationTypeIndexFromRTLocationOfInterestType:a5];
  uint64_t v14 = +[ATXGlobalAppScoresUtil timeOfDayIndexFromDate:v11];
  uint64_t v15 = +[ATXGlobalAppScoresUtil dayOfWeekIndexFromDate:v11];

  v16 = [(ATXGlobalAppScorePredictor *)self globalPopularitiesForBundleIds:v12 atTimeOfDayIndex:v14 atDayOfWeekIndex:v15 atLocationIndex:v13 withLastAppLaunched:v10];

  return v16;
}

- (id)globalPopularitiesForBundleIds:(id)a3 atTimeOfDayIndex:(int)a4 atDayOfWeekIndex:(int)a5 atLocationIndex:(int)a6 withLastAppLaunched:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v14 = &stru_1F2740B58;
  if (a7) {
    uint64_t v14 = (__CFString *)a7;
  }
  uint64_t v15 = v14;
  v16 = [(ATXGlobalAppScorePredictor *)self globalPopularitiesAtTimeOfDay:v10 atDayOfWeek:v9 atLocation:v8 withLastAppLaunched:v15];
  v17 = v16;
  if (v16)
  {
    v18 = [v16 objectAtIndexedSubscript:0];
    v19 = objc_opt_new();
    id v38 = v13;
    v39 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = v13;
    uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    v37 = v15;
    if (v20)
    {
      uint64_t v21 = v20;
      SEL v36 = a2;
      uint64_t v22 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v25 = (int)[(_PASCFBurstTrie *)self->_index payloadForString:v24];
          if ([v17 count] <= v25)
          {
            v28 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v36, self, @"ATXGlobalAppScorePredictor.m", 157, @"ATXGlobalSignals: BundleId index %d exceeded the output layer size %lu", v25, objc_msgSend(v17, "count"));
          }
          if ((int)v25 < 1)
          {
            [v39 addObject:v24];
          }
          else
          {
            v26 = [v17 objectAtIndexedSubscript:v25];
            [v19 setObject:v26 forKeyedSubscript:v24];
            if ([v18 compare:v26] == 1)
            {
              id v27 = v26;

              v18 = v27;
            }
          }
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v21);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v29 = v39;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
    id v13 = v38;
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v29);
          }
          [v19 setObject:v18 forKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * j)];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v31);
    }

    v34 = +[ATXGlobalAppScoresUtil normalizeValues:v19];

    uint64_t v15 = v37;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)globalPopularityForBundleIdsGivenTimeDayAndLocation:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 locationMotionContext];
  uint64_t v9 = [v8 currentLOI];

  if (v9) {
    uint64_t v10 = [v9 type];
  }
  else {
    uint64_t v10 = -1;
  }
  id v11 = [v6 timeContext];
  id v12 = [v11 date];

  id v13 = [(ATXGlobalAppScorePredictor *)self globalPopularitiesForBundleIds:v7 atTimeOfDayIndex:+[ATXGlobalAppScoresUtil timeOfDayIndexFromDate:](ATXGlobalAppScoresUtil, "timeOfDayIndexFromDate:", v12) atDayOfWeekIndex:+[ATXGlobalAppScoresUtil dayOfWeekIndexFromDate:](ATXGlobalAppScoresUtil, "dayOfWeekIndexFromDate:", v12) atLocationIndex:+[ATXGlobalAppScoresUtil locationTypeIndexFromRTLocationOfInterestType:v10]];

  return v13;
}

- (id)globalPopularitiesForBundleIds:(id)a3 atTimeOfDayIndex:(int)a4 atDayOfWeekIndex:(int)a5 atLocationIndex:(int)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (self->_signalsTrie)
  {
    uint64_t v10 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v20 = v9;
    obuint64_t j = v9;
    uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v16 = +[ATXGlobalAppScoresUtil getContextKeyForTimeOfDayIndex:v7 dayOfWeekIndex:v6 locationIndex:a6 bundleIdIndex:[(_PASCFBurstTrie *)self->_index payloadForString:v15]];
          v17 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[_PASCFBurstTrie payloadForString:](self->_signalsTrie, "payloadForString:", v16)/ 100000.0);
          [v10 setObject:v17 forKeyedSubscript:v15];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    v18 = +[ATXGlobalAppScoresUtil normalizeValues:v10];

    id v9 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalsTrie, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

- (void)globalPopularitiesAtTimeOfDay:(uint64_t)a1 atDayOfWeek:(NSObject *)a2 atLocation:withLastAppLaunched:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXGlobalSignals - Error during inference on the CoreMLModel: %@", (uint8_t *)&v2, 0xCu);
}

- (void)globalPopularitiesAtTimeOfDay:(uint64_t)a1 atDayOfWeek:(NSObject *)a2 atLocation:withLastAppLaunched:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXGlobalSignals - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", (uint8_t *)&v2, 0xCu);
}

@end