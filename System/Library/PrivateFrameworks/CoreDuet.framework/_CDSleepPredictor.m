@interface _CDSleepPredictor
+ (id)array:(id)a3 filter:(id)a4;
+ (id)array:(id)a3 map:(id)a4;
+ (id)array:(id)a3 reduce:(id)a4 withInitialValue:(id)a5;
+ (id)arrayWithObject:(id)a3 repeated:(unint64_t)a4;
+ (id)fetchDeviceInUseDateIntervalsFromStore:(id)a3 whichIntersectInterval:(id)a4;
+ (id)fetchFirstEventDateIntervalFromStore:(id)a3 forStream:(id)a4 sortDateAscending:(BOOL)a5 intersectingInterval:(id)a6;
+ (id)findAllSleepPeriodsInDayStarting:(id)a3 FromActivityProbabilities:(id)a4;
+ (id)findSleepPeriodInDayStarting:(id)a3 FromActivityProbabilities:(id)a4;
+ (id)gatherBitmapHistoryFromStore:(id)a3 forPeriod:(id)a4;
+ (id)generateActivityBitmapFor:(id)a3 unlockedIntervals:(id)a4 eventsAvailableInterval:(id)a5;
+ (id)indexSetFromUnionOf:(id)a3;
+ (id)predicateForInUseVaue;
+ (void)mutableArray:(id)a3 replaceObjectsAtIndexes:(id)a4 withObjectFromBlock:(id)a5;
@end

@implementation _CDSleepPredictor

+ (id)array:(id)a3 reduce:(id)a4 withInitialValue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  id v9 = a5;
  id v21 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51___CDSleepPredictor_array_reduce_withInitialValue___block_invoke;
  v13[3] = &unk_1E560E080;
  v15 = &v16;
  id v10 = v8;
  id v14 = v10;
  [v7 enumerateObjectsUsingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (id)indexSetFromUnionOf:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28E60];
  id v5 = a3;
  v6 = [v4 indexSet];
  id v7 = [a1 array:v5 reduce:&__block_literal_global_12 withInitialValue:v6];

  return v7;
}

+ (id)arrayWithObject:(id)a3 repeated:(unint64_t)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4)
  {
    uint64_t v7 = 0;
    do
      [v6 setObject:v5 atIndexedSubscript:v7++];
    while (a4 != v7);
  }
  id v8 = (void *)[v6 copy];

  return v8;
}

+ (id)array:(id)a3 map:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31___CDSleepPredictor_array_map___block_invoke;
  v14[3] = &unk_1E560E0C8;
  id v9 = v8;
  id v15 = v9;
  id v16 = v5;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

+ (id)array:(id)a3 filter:(id)a4
{
  id v5 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34___CDSleepPredictor_array_filter___block_invoke;
  v11[3] = &unk_1E560E0F0;
  id v12 = v5;
  id v6 = v5;
  id v7 = a3;
  id v8 = [v7 indexesOfObjectsPassingTest:v11];
  id v9 = [v7 objectsAtIndexes:v8];

  return v9;
}

+ (void)mutableArray:(id)a3 replaceObjectsAtIndexes:(id)a4 withObjectFromBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78___CDSleepPredictor_mutableArray_replaceObjectsAtIndexes_withObjectFromBlock___block_invoke;
  v11[3] = &unk_1E560E118;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [a4 enumerateIndexesUsingBlock:v11];
}

+ (id)generateActivityBitmapFor:(id)a3 unlockedIntervals:(id)a4 eventsAvailableInterval:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 duration];
  unint64_t v12 = (uint64_t)(v11 / 900.0);
  id v13 = [NSNumber numberWithInt:0];
  id v14 = [a1 arrayWithObject:v13 repeated:v12];

  v31 = v14;
  id v15 = (void *)[v14 mutableCopy];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke;
  v38[3] = &unk_1E560E140;
  id v16 = v8;
  id v39 = v16;
  unint64_t v40 = v12;
  v17 = (void *)MEMORY[0x192FB31A0](v38);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __89___CDSleepPredictor_generateActivityBitmapFor_unlockedIntervals_eventsAvailableInterval___block_invoke_2;
  v34[3] = &unk_1E560E168;
  id v18 = v17;
  id v36 = v18;
  id v30 = v16;
  id v35 = v30;
  unint64_t v37 = v12;
  v33 = v9;
  v29 = [a1 array:v9 map:v34];
  v28 = objc_msgSend(a1, "indexSetFromUnionOf:");
  objc_msgSend(a1, "mutableArray:replaceObjectsAtIndexes:withObjectFromBlock:", v15);
  v19 = [v10 startDate];
  v32 = v10;
  v20 = [v10 endDate];
  uint64_t v21 = (*((uint64_t (**)(id, void *))v18 + 2))(v18, v19);
  uint64_t v22 = (*((uint64_t (**)(id, void *))v18 + 2))(v18, v20);
  if (v21)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      v24 = [NSNumber numberWithInt:0xFFFFFFFFLL];
      [v15 setObject:v24 atIndexedSubscript:i];
    }
  }
  uint64_t v25 = v22 + 1;
  if (v22 + 1 < v12)
  {
    do
    {
      v26 = [NSNumber numberWithInt:0xFFFFFFFFLL];
      [v15 setObject:v26 atIndexedSubscript:v25];

      ++v25;
    }
    while (v12 != v25);
  }

  return v15;
}

+ (id)predicateForInUseVaue
{
  v2 = +[_DKBoolCategory no];
  v3 = +[_DKQuery predicateForEventsWithCategoryValue:v2];

  return v3;
}

+ (id)fetchDeviceInUseDateIntervalsFromStore:(id)a3 whichIntersectInterval:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(_DKEventQuery);
  id v8 = [NSString stringWithUTF8String:"_CDSleepPredictor.m"];
  id v9 = objc_msgSend(v8, "stringByAppendingFormat:", @":%d", 166);
  [(_DKQuery *)v7 setClientName:v9];

  [(_DKQuery *)v7 setTracker:&__block_literal_global_20];
  id v10 = +[_DKSystemEventStreams deviceInUseProxyStream];
  v30[0] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [(_DKEventQuery *)v7 setEventStreams:v11];

  [(_DKEventQuery *)v7 setOffset:0];
  [(_DKEventQuery *)v7 setLimit:0];
  unint64_t v12 = +[_DKQuery startDateSortDescriptorAscending:1];
  v29 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [(_DKEventQuery *)v7 setSortDescriptors:v13];

  id v14 = [v6 startDate];
  id v15 = [v6 endDate];
  id v16 = +[_DKQuery predicateForEventsIntersectingDateRangeFrom:v14 to:v15];

  v17 = +[_CDSleepPredictor predicateForInUseVaue];
  id v18 = (void *)MEMORY[0x1E4F28BA0];
  v28[0] = v16;
  v28[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v20 = [v18 andPredicateWithSubpredicates:v19];
  [(_DKEventQuery *)v7 setPredicate:v20];

  [(_DKEventQuery *)v7 setResultType:2];
  uint64_t v21 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    +[_CDSleepPredictor fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:]();
  }

  id v27 = 0;
  uint64_t v22 = [v5 executeQuery:v7 error:&v27];
  id v23 = v27;
  if (v23)
  {
    v24 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[_CDSleepPredictor fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:]();
    }

    id v25 = 0;
  }
  else
  {
    id v25 = v22;
  }

  return v25;
}

+ (id)fetchFirstEventDateIntervalFromStore:(id)a3 forStream:(id)a4 sortDateAscending:(BOOL)a5 intersectingInterval:(id)a6
{
  BOOL v7 = a5;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  unint64_t v12 = objc_alloc_init(_DKEventQuery);
  id v13 = [NSString stringWithUTF8String:"_CDSleepPredictor.m"];
  id v14 = objc_msgSend(v13, "stringByAppendingFormat:", @":%d", 201);
  [(_DKQuery *)v12 setClientName:v14];

  [(_DKQuery *)v12 setTracker:&__block_literal_global_27];
  v38[0] = v10;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  [(_DKEventQuery *)v12 setEventStreams:v15];

  [(_DKEventQuery *)v12 setOffset:0];
  [(_DKEventQuery *)v12 setLimit:1];
  id v16 = +[_DKQuery startDateSortDescriptorAscending:v7];
  unint64_t v37 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [(_DKEventQuery *)v12 setSortDescriptors:v17];

  id v18 = [v11 startDate];
  v19 = [v11 endDate];
  v20 = +[_DKQuery predicateForEventsIntersectingDateRangeFrom:v18 to:v19];
  [(_DKEventQuery *)v12 setPredicate:v20];

  [(_DKEventQuery *)v12 setResultType:2];
  uint64_t v21 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    id v27 = @"last";
    *(_DWORD *)buf = 138413058;
    if (v7) {
      id v27 = @"first";
    }
    id v30 = v27;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    _os_log_debug_impl(&dword_18ECEB000, v21, OS_LOG_TYPE_DEBUG, "Executing query for %@ event in stream %@ on store %@ in date range %@", buf, 0x2Au);
  }

  id v28 = 0;
  uint64_t v22 = [v9 executeQuery:v12 error:&v28];
  id v23 = v28;
  if (v23)
  {
    v24 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[_CDSleepPredictor fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:]();
    }

    id v25 = 0;
  }
  else
  {
    id v25 = [v22 firstObject];
  }

  return v25;
}

+ (id)gatherBitmapHistoryFromStore:(id)a3 forPeriod:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_DKSystemEventStreams deviceInUseProxyStream];
  id v9 = [a1 fetchFirstEventDateIntervalFromStore:v6 forStream:v8 sortDateAscending:1 intersectingInterval:v7];

  if (v9)
  {
    id v10 = +[_DKSystemEventStreams deviceInUseProxyStream];
    id v11 = [a1 fetchFirstEventDateIntervalFromStore:v6 forStream:v10 sortDateAscending:0 intersectingInterval:v7];

    if (v11)
    {
      unint64_t v12 = [a1 fetchDeviceInUseDateIntervalsFromStore:v6 whichIntersectInterval:v7];
      id v13 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:](v12, v13);
      }

      id v14 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v15 = [v9 startDate];
      id v16 = [v11 endDate];
      v17 = (void *)[v14 initWithStartDate:v15 endDate:v16];

      id v18 = [a1 generateActivityBitmapFor:v7 unlockedIntervals:v12 eventsAvailableInterval:v17];
    }
    else
    {
      unint64_t v12 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:](v12);
      }
      id v18 = 0;
    }
  }
  else
  {
    id v11 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[_CDSleepPredictor gatherBitmapHistoryFromStore:forPeriod:](v11);
    }
    id v18 = 0;
  }

  return v18;
}

+ (id)findSleepPeriodInDayStarting:(id)a3 FromActivityProbabilities:(id)a4
{
  v4 = [a1 findAllSleepPeriodsInDayStarting:a3 FromActivityProbabilities:a4];
  if (![v4 count])
  {
    id v8 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v9 = "Sleep Prediction: final stage: no sleep periods predicted";
      id v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    id v11 = 0;
    goto LABEL_10;
  }
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 duration];
  double v7 = v6;

  if (v7 < 14400.0)
  {
    id v8 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = 0;
      id v9 = "Sleep Prediction: final stage: detected sleep too short";
      id v10 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  id v11 = [v4 objectAtIndexedSubscript:0];
LABEL_10:

  return v11;
}

+ (id)findAllSleepPeriodsInDayStarting:(id)a3 FromActivityProbabilities:(id)a4
{
  id v6 = a3;
  double v7 = [a1 array:a4 map:&__block_literal_global_36];
  id v8 = [v7 indexesOfObjectsPassingTest:&__block_literal_global_39];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_3;
  v21[3] = &unk_1E560E1F0;
  id v22 = v9;
  id v10 = v9;
  [v8 enumerateRangesUsingBlock:v21];
  id v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_44];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __80___CDSleepPredictor_findAllSleepPeriodsInDayStarting_FromActivityProbabilities___block_invoke_5;
  v19 = &unk_1E560E238;
  id v20 = v6;
  id v12 = v6;
  __int16 v13 = (void *)MEMORY[0x192FB31A0](&v16);
  id v14 = objc_msgSend(a1, "array:map:", v11, v13, v16, v17, v18, v19);

  return v14;
}

+ (void)fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Sleep Prediction: executeQuery returned %@", v1, 0xCu);
}

+ (void)fetchDeviceInUseDateIntervalsFromStore:whichIntersectInterval:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_DEBUG, "Executing query for unlock events on store %@ in date range %@", v2, 0x16u);
}

+ (void)gatherBitmapHistoryFromStore:(os_log_t)log forPeriod:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Sleep Prediction: No data returned for screen lock in period of interest", v1, 2u);
}

+ (void)gatherBitmapHistoryFromStore:(os_log_t)log forPeriod:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "We should have found an event given we got here!", v1, 2u);
}

+ (void)gatherBitmapHistoryFromStore:(void *)a1 forPeriod:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Obtained %lu screen unlock events", v3, 0xCu);
}

@end