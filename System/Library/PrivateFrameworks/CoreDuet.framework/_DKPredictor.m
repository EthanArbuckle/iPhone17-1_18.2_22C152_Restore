@interface _DKPredictor
+ (id)defaultPeriodAtDate:(uint64_t)a1;
+ (id)deviceActivityLikelihoodQueryPredicate;
+ (id)predictorLog;
+ (id)predictorWithKnowledgeStore:(id)a3;
- (id)deviceActivityLikelihood;
- (id)displayOnLikelihood;
- (id)expectedInBedPeriod;
- (id)initWithKnowledgeStore:(id *)a1;
- (id)launchLikelihoodForTopNApplications:(int64_t)a3 withLikelihoodGreaterThan:(double)a4 withTemporalResolution:(int)a5;
- (id)launchLikelihoodPredictionForApp:(id)a3;
- (id)localInBedPeriod;
- (id)pluginLikelihood;
- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5;
- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5 asOfDate:(id)a6;
- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5 withDataPartitionType:(unint64_t)a6 asOfDate:(id)a7;
- (id)predictionForStreamsWithNames:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5;
- (void)deviceActivityLikelihood;
- (void)displayOnLikelihood;
- (void)pluginLikelihood;
- (void)predictionForStreamsWithNames:(void *)a3 withPredicate:(uint64_t)a4 withPredictionType:(uint64_t)a5 withDataPartitionType:(void *)a6 asOfDate:;
- (void)predictionForStreamsWithNames:(void *)a3 withPredicate:(uint64_t)a4 withPredictionType:(void *)a5 asOfDate:;
@end

@implementation _DKPredictor

- (id)pluginLikelihood
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v3 = _os_activity_create(&dword_18ECEB000, "Duet: pluginLikelihood", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  v4 = +[_DKQuery predicateForEventsWithIntegerValue:1];
  v5 = +[_DKEventQuery predicateForEventsOfMinimumDuration:300.0];
  v6 = (void *)MEMORY[0x1E4F28BA0];
  v26[0] = v4;
  v26[1] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v8 = [v6 andPredicateWithSubpredicates:v7];

  v9 = +[_DKSystemEventStreams deviceIsPluggedInStream];
  v10 = +[_DKPredictionQuery predictionQueryForStream:v9 withPredicate:v8 withPredictionType:1];

  knowledgeStore = self->_knowledgeStore;
  id v24 = 0;
  v12 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v10 error:&v24];
  id v13 = v24;
  if (v13)
  {
    objc_opt_class();
    v14 = +[_DKPredictor predictorLog]();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(_DKPredictor *)(uint64_t)v13 pluginLikelihood];
    }

    id v21 = +[_DKPredictionTimeline predictionUnavailable];
  }
  else
  {
    id v21 = v12;
  }
  v22 = v21;

  return v22;
}

- (id)initWithKnowledgeStore:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_DKPredictor;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

+ (id)predictorWithKnowledgeStore:(id)a3
{
  id v4 = a3;
  v5 = -[_DKPredictor initWithKnowledgeStore:]((id *)objc_alloc((Class)a1), v4);

  return v5;
}

+ (id)predictorLog
{
  self;
  if (predictorLog_onceToken != -1) {
    dispatch_once(&predictorLog_onceToken, &__block_literal_global_68);
  }
  v0 = (void *)predictorLog_predictorLog;
  return v0;
}

- (id)launchLikelihoodPredictionForApp:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _os_activity_create(&dword_18ECEB000, "Duet: launchLikelihoodPredictionForApp", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  if (v4)
  {
    v6 = +[_DKQuery predicateForEventsWithStringValue:v4];
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = +[_DKEventQuery predicateForEventsOfMinimumDuration:5.0];
  v8 = (void *)v7;
  if (v6)
  {
    v26[0] = v6;
    v26[1] = v7;
    v9 = (void *)MEMORY[0x1E4F1C978];
    v10 = v26;
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v25 = v7;
    v9 = (void *)MEMORY[0x1E4F1C978];
    v10 = &v25;
    uint64_t v11 = 1;
  }
  v12 = [v9 arrayWithObjects:v10 count:v11];
  id v13 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
  v14 = +[_DKSystemEventStreams appInFocusStream];
  uint64_t v15 = +[_DKPredictionQuery predictionQueryForStream:v14 withPredicate:v13 withPredictionType:0];

  knowledgeStore = self->_knowledgeStore;
  id v23 = 0;
  uint64_t v17 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v15 error:&v23];
  id v18 = v23;
  if (v18)
  {
    objc_opt_class();
    uint64_t v19 = +[_DKPredictor predictorLog]();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DKPredictor launchLikelihoodPredictionForApp:]();
    }

    id v20 = +[_DKPredictionTimeline predictionUnavailable];
  }
  else
  {
    id v20 = v17;
  }
  id v21 = v20;

  return v21;
}

- (id)launchLikelihoodForTopNApplications:(int64_t)a3 withLikelihoodGreaterThan:(double)a4 withTemporalResolution:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v36[2] = *MEMORY[0x1E4F143B8];
  v9 = _os_activity_create(&dword_18ECEB000, "Duet: launchLikelihoodForTopNApplications", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  *(void *)os_activity_scope_state_s state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v10 = +[_DKEventQuery predicateForEventsOfMinimumDuration:5.0];
  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  v12 = +[_DKApplicationMetadataKey extensionHostIdentifier];
  id v13 = +[_DKQuery predicateForObjectsWithMetadataKey:v12];
  v14 = [v11 notPredicateWithSubpredicate:v13];

  uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
  v36[0] = v10;
  v36[1] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v17 = [v15 andPredicateWithSubpredicates:v16];

  id v18 = +[_DKSystemEventStreams appInFocusStream];
  uint64_t v19 = +[_DKPredictionQuery topNPredictionQueryForStream:v18 withPredicate:v17 withTopN:a3 withMinLikelihood:a4];

  [v19 setReadMetadata:1];
  [v19 setSlotDuration:v5];
  knowledgeStore = self->_knowledgeStore;
  id v30 = 0;
  id v21 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v19 error:&v30];
  id v22 = v30;
  if (v22)
  {
    objc_opt_class();
    id v23 = +[_DKPredictor predictorLog]();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v27 = [NSNumber numberWithInteger:a3];
      v28 = [NSNumber numberWithDouble:a4];
      v29 = [NSNumber numberWithInt:v5];
      *(_DWORD *)os_activity_scope_state_s state = 138413058;
      *(void *)&state[4] = v27;
      *(_WORD *)&state[12] = 2112;
      *(void *)&state[14] = v28;
      __int16 v32 = 2112;
      v33 = v29;
      __int16 v34 = 2112;
      id v35 = v22;
      _os_log_error_impl(&dword_18ECEB000, v23, OS_LOG_TYPE_ERROR, "Error executing top %@ query > %@ / %@: %@", state, 0x2Au);
    }
    id v24 = +[_DKPredictionTimeline predictionUnavailable];
  }
  else
  {
    id v24 = v21;
  }
  uint64_t v25 = v24;

  return v25;
}

- (id)displayOnLikelihood
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v3 = _os_activity_create(&dword_18ECEB000, "Duet: displayOnLikelihood", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  id v4 = +[_DKQuery predicateForEventsWithIntegerValue:1];
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  v25[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

  v8 = +[_DKSystemEventStreams displayIsBacklit];
  v9 = +[_DKPredictionQuery predictionQueryForStream:v8 withPredicate:v7 withPredictionType:0];

  knowledgeStore = self->_knowledgeStore;
  id v23 = 0;
  uint64_t v11 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v9 error:&v23];
  id v12 = v23;
  if (v12)
  {
    objc_opt_class();
    id v13 = +[_DKPredictor predictorLog]();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(_DKPredictor *)(uint64_t)v12 displayOnLikelihood];
    }

    id v20 = +[_DKPredictionTimeline predictionUnavailable];
  }
  else
  {
    id v20 = v11;
  }
  id v21 = v20;

  return v21;
}

+ (id)deviceActivityLikelihoodQueryPredicate
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = _os_activity_create(&dword_18ECEB000, "Duet: deviceActivityLikelihoodQueryPredicate", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  v3 = +[_DKQuery predicateForEventsExcludingIntegerValue:0];
  id v4 = +[_DKQuery predicateForEventsExcludingIntegerValue:8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  v10[0] = v3;
  v10[1] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v7 = [v5 andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)deviceActivityLikelihood
{
  v3 = _os_activity_create(&dword_18ECEB000, "Duet: deviceActivityLikelihood", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  id v4 = [(id)objc_opt_class() deviceActivityLikelihoodQueryPredicate];
  uint64_t v5 = +[_DKSystemEventStreams deviceActivityLevelStream];
  v6 = +[_DKPredictionQuery predictionQueryForStream:v5 withPredicate:v4 withPredictionType:0];

  [v6 setMinimumDaysOfHistory:3];
  [v6 setSlotDuration:900];
  [v6 setPartitionType:2];
  [v6 setUseHistoricalHistogram:1];
  knowledgeStore = self->_knowledgeStore;
  id v23 = 0;
  v8 = [(_DKKnowledgeQuerying *)knowledgeStore executeQuery:v6 error:&v23];
  id v9 = v23;
  if (v9)
  {
    objc_opt_class();
    v10 = +[_DKPredictor predictorLog]();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(_DKPredictor *)(uint64_t)v9 deviceActivityLikelihood];
    }

    id v17 = +[_DKPredictionTimeline predictionUnavailable];
  }
  else
  {
    uint64_t v18 = objc_alloc_init(_DKPredictionQueryFeedback);
    uint64_t v19 = self->_knowledgeStore;
    id v20 = [v8 startHistogram];
    id v21 = [v8 endHistogram];
    [(_DKPredictionQueryFeedback *)v18 logPredictionQueryFeedback:v20 endHistogram:v21 withStorage:v19];

    [v8 setStartHistogram:0];
    [v8 setEndHistogram:0];
    id v17 = v8;
  }
  return v17;
}

- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 arrayWithObjects:&v15 count:1];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v15, v16);

  uint64_t v13 = -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:asOfDate:](self, v11, v9, a5, v12);

  return v13;
}

- (void)predictionForStreamsWithNames:(void *)a3 withPredicate:(uint64_t)a4 withPredictionType:(void *)a5 asOfDate:
{
  if (a1)
  {
    a1 = -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:](a1, a2, a3, a4, 1, a5);
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)predictionForStreamsWithNames:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5
{
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v8 date];
  uint64_t v12 = -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:asOfDate:](self, v10, v9, a5, v11);

  return v12;
}

- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5 asOfDate:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = a3;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 arrayWithObjects:v17 count:1];

  id v15 = -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:asOfDate:](self, v14, v12, a5, v11);

  return v15;
}

- (id)predictionForStreamWithName:(id)a3 withPredicate:(id)a4 withPredictionType:(unint64_t)a5 withDataPartitionType:(unint64_t)a6 asOfDate:(id)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v19[0] = a3;
  id v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [v12 arrayWithObjects:v19 count:1];

  id v17 = -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:](self, v16, v14, a5, a6, v13);

  return v17;
}

- (void)predictionForStreamsWithNames:(void *)a3 withPredicate:(uint64_t)a4 withPredictionType:(uint64_t)a5 withDataPartitionType:(void *)a6 asOfDate:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  if (a1)
  {
    id v12 = _os_activity_create(&dword_18ECEB000, "Duet: predictionForStreamsWithNames", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v12, &state);
    os_activity_scope_leave(&state);

    context = (void *)MEMORY[0x192FB2F20]();
    id v13 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = +[_DKEventStream eventStreamWithName:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v16);
    }

    id v20 = (void *)[v13 copy];
    id v21 = v10;
    id v22 = +[_DKPredictionQuery predictionQueryForStreams:v20 withPredicate:v10 withPredictionType:a4];

    [v22 setAsOfDate:v11];
    [v22 setPartitionType:a5];
    id v23 = (void *)a1[1];
    id v32 = 0;
    id v24 = [v23 executeQuery:v22 error:&v32];
    id v25 = v32;
    if (v25)
    {
      objc_opt_class();
      v26 = +[_DKPredictor predictorLog]();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_DKPredictor predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:]();
      }

      v27 = +[_DKPredictionTimeline predictionUnavailable];
    }
    else
    {
      v27 = v24;
    }
    a1 = v27;
  }
  else
  {
    id v21 = v10;
  }

  return a1;
}

+ (id)defaultPeriodAtDate:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 components:32 fromDate:v2];
  if ([v4 hour] <= 6)
  {
    uint64_t v5 = [v2 dateByAddingTimeInterval:-86400.0];

    id v2 = (id)v5;
  }
  v6 = [v3 startOfDayForDate:v2];
  uint64_t v7 = [v6 dateByAddingTimeInterval:72000.0];

  v8 = [v7 dateByAddingTimeInterval:39600.0];
  id v9 = +[_CDDateRange periodWithStart:v7 end:v8];

  return v9;
}

- (id)localInBedPeriod
{
  v3 = _os_activity_create(&dword_18ECEB000, "Duet: localInBedPeriod", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v3, &v8);
  os_activity_scope_leave(&v8);

  id v4 = [(_DKPredictor *)self deviceActivityLikelihood];
  if ([v4 isUnavailable])
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    v6 = +[_DKPredictor defaultPeriodAtDate:]((uint64_t)_DKPredictor, v5);
  }
  else
  {
    v6 = [v4 largestDateRangeWithValuesBetween:0.0 and:0.1 ofMinimumDuration:21600.0];
  }

  return v6;
}

- (id)expectedInBedPeriod
{
  v3 = _os_activity_create(&dword_18ECEB000, "Duet: expectedInBedPeriod", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  id v4 = [(_DKPredictor *)self localInBedPeriod];
  return v4;
}

- (void).cxx_destruct
{
}

- (void)launchLikelihoodPredictionForApp:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v0, v1, "Error executing timeline query for likelihood of %@ launch: %@");
}

- (void)pluginLikelihood
{
}

- (void)displayOnLikelihood
{
}

- (void)deviceActivityLikelihood
{
}

- (void)predictionForStreamsWithNames:withPredicate:withPredictionType:withDataPartitionType:asOfDate:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_18ECEB000, v0, v1, "Error executing timeline query: %@ (%@)");
}

@end