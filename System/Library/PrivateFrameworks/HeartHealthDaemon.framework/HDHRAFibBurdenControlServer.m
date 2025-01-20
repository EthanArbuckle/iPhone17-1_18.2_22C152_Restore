@interface HDHRAFibBurdenControlServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (HDHRAFibBurdenControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 scheduler:(id)a7 notificationManager:(id)a8;
- (id)_clientRemoteObjectProxy;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(double)a5 chanceOfWrite:(double)a6 minutesBetweenSamples:(int64_t)a7 startingHour:(int64_t)a8 endingHour:(int64_t)a9 completion:(id)a10;
- (void)remote_addTachogramClassificationForSampleUUID:(id)a3 hasAFib:(BOOL)a4 completion:(id)a5;
- (void)remote_addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(id)a5 chanceOfWrite:(id)a6 minutesBetweenSamples:(id)a7 startingHour:(id)a8 endingHour:(id)a9 completion:(id)a10;
- (void)remote_deleteAllTachogramClassificationsWithCompletion:(id)a3;
- (void)remote_deleteTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4;
- (void)remote_determineIfAnalysisCanRunWithFeatureStatus:(id)a3 completion:(id)a4;
- (void)remote_determineMajorityTimeZoneForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5;
- (void)remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:(id)a3;
- (void)remote_injectBurdenValues:(id)a3 completion:(id)a4;
- (void)remote_performAnalysisForWeekContainingDayIndex:(int64_t)a3 completion:(id)a4;
- (void)remote_queryAllTachogramClassificationsWithCompletion:(id)a3;
- (void)remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:(int64_t)a3 completion:(id)a4;
- (void)remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday:(int64_t)a3 completion:(id)a4;
- (void)remote_queryEligibleTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5;
- (void)remote_queryTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4;
- (void)remote_sendNotificationWithMode:(id)a3 completion:(id)a4;
- (void)remote_triggerAnalysis;
@end

@implementation HDHRAFibBurdenControlServer

- (HDHRAFibBurdenControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 scheduler:(id)a7 notificationManager:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)HDHRAFibBurdenControlServer;
  v17 = [(HDStandardTaskServer *)&v20 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_scheduler, a7);
    objc_storeStrong((id *)&v18->_notificationManager, a8);
  }

  return v18;
}

- (void)remote_triggerAnalysis
{
}

- (void)remote_determineIfAnalysisCanRunWithFeatureStatus:(id)a3 completion:(id)a4
{
  v6 = NSNumber;
  scheduler = self->_scheduler;
  id v8 = a4;
  objc_msgSend(v6, "numberWithBool:", -[HKHRAFibBurdenSevenDayAnalysisScheduling _shouldAllowFeatureStatus:](scheduler, "_shouldAllowFeatureStatus:", a3));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a4 + 2))(v8, v9, 0);
}

- (void)remote_addTachogramClassificationForSampleUUID:(id)a3 hasAFib:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F65BE8];
  v10 = (void *)MEMORY[0x1E4F2B498];
  v11 = (void (**)(id, void, id))a5;
  v12 = [v10 heartbeatSeriesType];
  v13 = [(HDStandardTaskServer *)self profile];
  uint64_t v37 = *MEMORY[0x1E4F659B8];
  v38[0] = MEMORY[0x1E4F1CC38];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v15 = HDDataEntityPredicateForDataUUID();
  id v36 = 0;
  id v16 = [v9 mostRecentSampleWithType:v12 profile:v13 encodingOptions:v14 predicate:v15 anchor:0 error:&v36];
  id v17 = v36;

  if (v16)
  {
    if (v17)
    {
      _HKInitializeLogging();
      v18 = HKHRAFibBurdenLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[HDHRAFibBurdenControlServer remote_addTachogramClassificationForSampleUUID:hasAFib:completion:]((uint64_t)self, (uint64_t)v17, v18);
      }
    }
    id v19 = objc_alloc(MEMORY[0x1E4F67E10]);
    id v20 = objc_alloc(MEMORY[0x1E4F28C18]);
    v21 = [v16 startDate];
    v22 = [v16 endDate];
    v23 = (void *)[v20 initWithStartDate:v21 endDate:v22];
    [v16 _timeZone];
    v24 = id v32 = v17;
    v25 = (void *)[v19 initWithSampleUUID:v8 classification:v6 sampleDateInterval:v23 sampleTimeZone:v24];

    v26 = [(HDStandardTaskServer *)self profile];
    v27 = [v26 database];
    id v34 = v25;
    id v35 = 0;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __97__HDHRAFibBurdenControlServer_remote_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke;
    v33[3] = &unk_1E69B4D68;
    id v28 = v25;
    BOOL v29 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v27 error:&v35 block:v33];
    id v30 = v35;

    BOOL v31 = v29;
    id v17 = v32;
    v11[2](v11, v31, v30);

    v11 = (void (**)(id, void, id))v30;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"No sample found for given UUID %@", v8);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v28);
  }
}

BOOL __97__HDHRAFibBurdenControlServer_remote_addTachogramClassificationForSampleUUID_hasAFib_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = +[HDHRSampleClassificationEntity insertSampleClassification:*(void *)(a1 + 32) transaction:a2 error:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)remote_queryAllTachogramClassificationsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void *, id))a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__5;
  id v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  v5 = [(HDStandardTaskServer *)self profile];
  BOOL v6 = [v5 database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__HDHRAFibBurdenControlServer_remote_queryAllTachogramClassificationsWithCompletion___block_invoke;
  v11[3] = &unk_1E69B4D90;
  v11[4] = &v13;
  id v12 = 0;
  BOOL v7 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v6 error:&v12 block:v11];
  id v8 = v12;

  if (v7)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F67E18]);
    v10 = (void *)[v9 initWithClassifications:v14[5] dayIndex:0 majorityTimeZone:0];
  }
  else
  {
    v10 = 0;
  }
  v4[2](v4, v10, v8);
  if (v7) {

  }
  _Block_object_dispose(&v13, 8);
}

BOOL __85__HDHRAFibBurdenControlServer_remote_queryAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDHRSampleClassificationEntity allSampleClassificationsWithTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (void)remote_queryTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, id))a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__5;
  v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__HDHRAFibBurdenControlServer_remote_queryTachogramClassificationForSampleUUID_completion___block_invoke;
  v14[3] = &unk_1E69B4C30;
  id v16 = &v18;
  id v17 = 0;
  id v10 = v6;
  id v15 = v10;
  BOOL v11 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v9 error:&v17 block:v14];
  id v12 = v17;

  if (v11) {
    uint64_t v13 = v19[5];
  }
  else {
    uint64_t v13 = 0;
  }
  v7[2](v7, v13, v12);

  _Block_object_dispose(&v18, 8);
}

BOOL __91__HDHRAFibBurdenControlServer_remote_queryTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDHRSampleClassificationEntity sampleClassificationWithSampleUUID:*(void *)(a1 + 32) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (void)remote_deleteAllTachogramClassificationsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, BOOL, id))a3;
  uint64_t v5 = [(HDStandardTaskServer *)self profile];
  id v6 = [v5 database];
  id v9 = 0;
  BOOL v7 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v6 error:&v9 block:&__block_literal_global_13];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

BOOL __86__HDHRAFibBurdenControlServer_remote_deleteAllTachogramClassificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDHRSampleClassificationEntity deleteAllClassificationsWithTransaction:a2 error:a3];
}

- (void)remote_deleteTachogramClassificationForSampleUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, BOOL, id))a4;
  id v8 = [(HDStandardTaskServer *)self profile];
  id v9 = [v8 database];
  id v14 = v6;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__HDHRAFibBurdenControlServer_remote_deleteTachogramClassificationForSampleUUID_completion___block_invoke;
  v13[3] = &unk_1E69B4D68;
  id v10 = v6;
  BOOL v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v9 error:&v15 block:v13];
  id v12 = v15;

  v7[2](v7, v11, v12);
}

BOOL __92__HDHRAFibBurdenControlServer_remote_deleteTachogramClassificationForSampleUUID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDHRSampleClassificationEntity deleteClassificationWithSampleUUID:*(void *)(a1 + 32) transaction:a2 error:a3];
}

- (void)remote_determineMajorityTimeZoneForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  BOOL v29 = (void (**)(id, id, id))a5;
  id v8 = [HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer alloc];
  id v9 = [(HDStandardTaskServer *)self profile];
  id v10 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  BOOL v11 = [(HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *)v8 initWithProfile:v9 calendarCache:v10];

  id v39 = 0;
  id v28 = v11;
  id v12 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:](v11, "determineJulianDayToMajorityTimeZoneForRange:error:", a3, a4 - a3 + 1, &v39);
  id v27 = v39;
  id v34 = v12;
  uint64_t v13 = objc_msgSend(v12, "hk_sortedKeys");
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v14 setTimeStyle:0];
  id v32 = v14;
  [v14 setDateStyle:1];
  BOOL v31 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v13;
  uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v20 = [v34 objectForKeyedSubscript:v19];
        v21 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_noonWithDayIndex:calendar:", objc_msgSend(v19, "integerValue"), v31);
        v22 = NSString;
        id v23 = [v32 stringFromDate:v21];
        v24 = [v20 name];
        v25 = [v20 abbreviationForDate:v21];
        v26 = [v22 stringWithFormat:@"Day index: %@, Date: %@, Majority Time Zone: %@ (%@)", v19, v23, v24, v25];

        [v33 addObject:v26];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v16);
  }

  v29[2](v29, v33, v27);
}

- (void)remote_queryEligibleTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void *, id))a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  id v10 = [HKHRAFibBurdenTachogramClassificationsRetriever alloc];
  BOOL v11 = [(HDStandardTaskServer *)self profile];
  id v12 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)v10 initWithProfile:v11 calendarCache:v9];

  uint64_t v13 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
  id v14 = [(HKHRAFibBurdenTachogramClassifierFactory *)v13 createTachogramClassifier];
  id v25 = 0;
  uint64_t v15 = -[HKHRAFibBurdenTachogramClassificationsRetriever tachogramClassificationsDayIndexRange:tachogramClassifier:error:](v12, "tachogramClassificationsDayIndexRange:tachogramClassifier:error:", a3, a4 - a3 + 1, v14, &v25);
  id v16 = v25;

  if (v15)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __101__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke;
    id v23 = &unk_1E69B4DF8;
    id v24 = v9;
    uint64_t v17 = objc_msgSend(v15, "hk_map:", &v20);
    id v18 = objc_alloc(MEMORY[0x1E4F67E20]);
    id v19 = objc_msgSend(v18, "initWithClassificationCollections:", v17, v20, v21, v22, v23);
  }
  else
  {
    id v19 = 0;
  }
  v8[2](v8, v19, v16);
}

id __101__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 sampleClassification];

    id v6 = NSNumber;
    BOOL v7 = [v5 sampleDateInterval];
    id v8 = [v7 startDate];
    id v9 = *(void **)(a1 + 32);
    id v10 = [v5 sampleTimeZone];
    BOOL v11 = [v9 calendarForTimeZone:v10];
    id v12 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = objc_msgSend(v3, "hk_map:", &__block_literal_global_308);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F67E18]) initWithClassifications:v13 dayIndex:v12 majorityTimeZone:0];

  return v14;
}

uint64_t __101__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForStartDayIndex_endDayIndex_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sampleClassification];
}

- (void)remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  id v8 = [HKHRAFibBurdenTachogramClassificationsRetriever alloc];
  id v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)v8 initWithProfile:v9 calendarCache:v7];

  BOOL v11 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
  id v12 = [(HKHRAFibBurdenTachogramClassifierFactory *)v11 createTachogramClassifier];
  id v23 = 0;
  uint64_t v13 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)v10 tachogramClassificationsForLastSixWeeksOfWeekday:a3 tachogramClassifier:v12 error:&v23];
  id v14 = v23;

  if (v13)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __102__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke;
    uint64_t v21 = &unk_1E69B4DF8;
    id v22 = v7;
    uint64_t v15 = objc_msgSend(v13, "hk_map:", &v18);
    id v16 = objc_alloc(MEMORY[0x1E4F67E20]);
    uint64_t v17 = objc_msgSend(v16, "initWithClassificationCollections:", v15, v18, v19, v20, v21);
  }
  else
  {
    uint64_t v17 = 0;
  }
  v6[2](v6, v17, v14);
}

id __102__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 sampleClassification];

    id v6 = NSNumber;
    id v7 = [v5 sampleDateInterval];
    id v8 = [v7 startDate];
    id v9 = *(void **)(a1 + 32);
    id v10 = [v5 sampleTimeZone];
    BOOL v11 = [v9 calendarForTimeZone:v10];
    id v12 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = objc_msgSend(v3, "hk_map:", &__block_literal_global_312);
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F67E18]) initWithClassifications:v13 dayIndex:v12 majorityTimeZone:0];

  return v14;
}

uint64_t __102__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForWeekday_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sampleClassification];
}

- (void)remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  id v8 = [HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer alloc];
  id v9 = [(HDStandardTaskServer *)self profile];
  id v10 = [(HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer *)v8 initWithProfile:v9 calendarCache:v7];

  BOOL v11 = [HKHRAFibBurdenTachogramClassificationsRetriever alloc];
  id v12 = [(HDStandardTaskServer *)self profile];
  uint64_t v13 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)v11 initWithProfile:v12 calendarCache:v7];

  id v14 = [v7 currentCalendar];
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  id v16 = [v14 startOfDayForDate:v15];

  uint64_t v17 = [v7 currentCalendar];
  uint64_t v18 = objc_msgSend(v16, "hk_dayIndexWithCalendar:", v17);

  id v34 = 0;
  uint64_t v19 = -[HKHRAFibBurdenJulianDayMajorityTimeZoneDeterminer determineJulianDayToMajorityTimeZoneForRange:error:](v10, "determineJulianDayToMajorityTimeZoneForRange:error:", v18 - 42, 42, &v34);
  id v20 = v34;
  if (v20)
  {
    id v21 = v20;
    v6[2](v6, 0, v20);
  }
  else
  {
    id v22 = objc_alloc_init(HKHRAFibBurdenTachogramClassifierFactory);
    id v23 = [(HKHRAFibBurdenTachogramClassifierFactory *)v22 createTachogramClassifier];
    id v33 = 0;
    id v24 = [(HKHRAFibBurdenTachogramClassificationsRetriever *)v13 tachogramClassificationsForLastSixWeeksOfHoursFrom:4 * a3 to:4 * a3 + 4 julianDayToMajorityTimeZone:v19 tachogramClassifier:v23 error:&v33];
    id v21 = v33;

    if (v24)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __110__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke;
      v30[3] = &unk_1E69B4E20;
      id v31 = v7;
      id v32 = v19;
      objc_msgSend(v24, "hk_map:", v30);
      BOOL v29 = v10;
      id v25 = v13;
      id v27 = v26 = v22;
      id v28 = (void *)[objc_alloc(MEMORY[0x1E4F67E20]) initWithClassificationCollections:v27];

      id v22 = v26;
      uint64_t v13 = v25;
      id v10 = v29;
    }
    else
    {
      id v28 = 0;
    }
    ((void (**)(id, void *, id))v6)[2](v6, v28, v21);
  }
}

id __110__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v3 objectAtIndexedSubscript:0];
    uint64_t v5 = [v4 sampleClassification];

    id v6 = NSNumber;
    id v7 = [v5 sampleDateInterval];
    id v8 = [v7 startDate];
    id v9 = *(void **)(a1 + 32);
    id v10 = [v5 sampleTimeZone];
    BOOL v11 = [v9 calendarForTimeZone:v10];
    id v12 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));

    uint64_t v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
    id v14 = [v13 abbreviation];
  }
  else
  {
    id v12 = 0;
    id v14 = 0;
  }
  uint64_t v15 = objc_msgSend(v3, "hk_map:", &__block_literal_global_314);
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F67E18]) initWithClassifications:v15 dayIndex:v12 majorityTimeZone:v14];

  return v16;
}

uint64_t __110__HDHRAFibBurdenControlServer_remote_queryEligibleTachogramsForPreviousSixWeeksForTimeOfDayBucket_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sampleClassification];
}

- (void)remote_addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(id)a5 chanceOfWrite:(id)a6 minutesBetweenSamples:(id)a7 startingHour:(id)a8 endingHour:(id)a9 completion:(id)a10
{
  id v31 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = (void (**)(id, void, void *))a10;
  if (a4 < a3)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    id v22 = @"End day index must be greater than or equal to start day index";
LABEL_25:
    id v30 = objc_msgSend(v21, "hk_error:description:", 3, v22);
    v20[2](v20, 0, v30);

    goto LABEL_26;
  }
  if (!v31)
  {
    double v24 = 0.5;
    if (v16) {
      goto LABEL_7;
    }
LABEL_14:
    double v26 = 1.0;
    if (v17) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  [v31 doubleValue];
  if (v23 < 0.0 || (double v24 = v23, v23 > 1.0))
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    id v22 = @"Chance of AFib must be between 0 and 1";
    goto LABEL_25;
  }
  if (!v16) {
    goto LABEL_14;
  }
LABEL_7:
  [v16 doubleValue];
  if (v25 < 0.0 || (double v26 = v25, v25 > 1.0))
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    id v22 = @"Chance of write must be between 0 and 1";
    goto LABEL_25;
  }
  if (v17)
  {
LABEL_10:
    uint64_t v27 = [v17 integerValue];
    if (v18) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v28 = 0;
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v27 = 15;
  if (!v18) {
    goto LABEL_16;
  }
LABEL_11:
  unint64_t v28 = [v18 integerValue];
  if (v28 >= 0x19)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    id v22 = @"Starting hour must be between 0 and 24";
    goto LABEL_25;
  }
LABEL_17:
  if (v19)
  {
    unint64_t v29 = [v19 integerValue];
    if (v29 >= 0x18)
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      id v22 = @"Ending hour must be between 0 and 24";
      goto LABEL_25;
    }
  }
  else
  {
    unint64_t v29 = 23;
  }
  if (v29 < v28)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    id v22 = @"Ending hour must be on or after starting hour";
    goto LABEL_25;
  }
  -[HDHRAFibBurdenControlServer _addTachogramsForStartDayIndex:endDayIndex:chanceOfAFib:chanceOfWrite:minutesBetweenSamples:startingHour:endingHour:completion:](self, "_addTachogramsForStartDayIndex:endDayIndex:chanceOfAFib:chanceOfWrite:minutesBetweenSamples:startingHour:endingHour:completion:", a3, a4, v27, v28, v24, v26);
LABEL_26:
}

- (void)_addTachogramsForStartDayIndex:(int64_t)a3 endDayIndex:(int64_t)a4 chanceOfAFib:(double)a5 chanceOfWrite:(double)a6 minutesBetweenSamples:(int64_t)a7 startingHour:(int64_t)a8 endingHour:(int64_t)a9 completion:(id)a10
{
  id v18 = (void (**)(id, uint64_t, id))a10;
  id v19 = [(HDStandardTaskServer *)self profile];
  id v20 = [v19 database];
  id v21 = [MEMORY[0x1E4F65B08] contextForWritingProtectedData];
  v24[11] = a9;
  id v25 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __158__HDHRAFibBurdenControlServer__addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke;
  v24[3] = &unk_1E69B4E48;
  v24[6] = a4;
  v24[7] = a8;
  v24[8] = a7;
  *(double *)&v24[9] = a6;
  *(double *)&v24[10] = a5;
  v24[4] = self;
  v24[5] = a3;
  uint64_t v22 = [v20 performTransactionWithContext:v21 error:&v25 block:v24 inaccessibilityHandler:0];
  id v23 = v25;

  v18[2](v18, v22, v23);
}

uint64_t __158__HDHRAFibBurdenControlServer__addTachogramsForStartDayIndex_endDayIndex_chanceOfAFib_chanceOfWrite_minutesBetweenSamples_startingHour_endingHour_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F2AC98]);
  uint64_t v7 = *MEMORY[0x1E4F2BAB0];
  v34[0] = *MEMORY[0x1E4F2BB50];
  v34[1] = v7;
  v35[0] = &unk_1F2B42BB0;
  v35[1] = &unk_1F2B42BC8;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  unint64_t v29 = [MEMORY[0x1E4F2AEF8] localDevice];
  id v8 = [v6 currentCalendar];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9 <= *(void *)(a1 + 48))
  {
    id v25 = a3;
    id v26 = v6;
    id v27 = v5;
    id v10 = 0;
    while (2)
    {
      uint64_t v28 = v9;
      id v12 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDayIndex:calendar:", v9, v8, v25);
      [v12 setHour:*(void *)(a1 + 56)];
      uint64_t v13 = [v8 dateFromComponents:v12];
      id v31 = v12;
      do
      {
        id v14 = [v8 dateByAddingUnit:64 value:*(void *)(a1 + 64) toDate:v13 options:0];
        if (arc4random_uniform(0x64u) >= (uint64_t)(*(double *)(a1 + 72) * 100.0))
        {
          uint64_t v15 = v13;
        }
        else
        {
          if (arc4random_uniform(0x64u) >= (uint64_t)(*(double *)(a1 + 80) * 100.0)) {
            [MEMORY[0x1E4F2B108] _nonAFibSeriesSampleWithStartDate:v13 device:v29 metadata:v30];
          }
          else {
          uint64_t v15 = [MEMORY[0x1E4F2B108] _aFibSeriesSampleWithStartDate:v13 device:v29 metadata:v30];
          }
          id v16 = [*(id *)(a1 + 32) profile];
          id v17 = [v16 dataManager];
          id v33 = v15;
          id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          id v32 = v10;
          char v19 = [v17 insertDataObjects:v18 error:&v32];
          id v20 = v32;
          id v21 = v10;
          id v10 = v20;

          if ((v19 & 1) == 0)
          {
            id v23 = v10;
            id v10 = v23;
            if (v23)
            {
              if (v25) {
                void *v25 = v23;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v11 = 0;
            goto LABEL_21;
          }

          id v12 = v31;
        }

        uint64_t v22 = [v8 component:16 fromDate:v14];
        if (v22 != [v12 day]) {
          break;
        }
        uint64_t v13 = v14;
      }
      while ([v8 component:32 fromDate:v14] <= *(void *)(a1 + 88));

      uint64_t v9 = v28 + 1;
      if (v28 < *(void *)(a1 + 48)) {
        continue;
      }
      break;
    }
    uint64_t v11 = 1;
LABEL_21:
    id v6 = v26;
    id v5 = v27;
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = 1;
  }

  return v11;
}

- (void)remote_performAnalysisForWeekContainingDayIndex:(int64_t)a3 completion:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F2AC98];
  uint64_t v7 = (void (**)(id, void *, id))a4;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = [v8 currentCalendar];
  uint64_t v11 = objc_msgSend(v9, "hk_dateOnDayIndex:atHour:calendar:", a3 + 7, 0, v10);

  id v12 = [HKHRAFibBurdenSevenDayAnalysisManager alloc];
  uint64_t v13 = [(HDStandardTaskServer *)self profile];
  id v14 = [HKHRStubbedAFibBurdenSevenDayAnalysisModeDeterminer alloc];
  uint64_t v15 = [(HDStandardTaskServer *)self profile];
  id v16 = [(HKHRAFibBurdenSevenDayAnalysisModeDeterminer *)v14 initWithProfile:v15 calendarCache:v8];
  id v17 = [HKHRAFibBurdenAnalyzer alloc];
  id v18 = [(HDStandardTaskServer *)self profile];
  char v19 = [(HKHRAFibBurdenAnalyzer *)v17 initWithProfile:v18];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __90__HDHRAFibBurdenControlServer_remote_performAnalysisForWeekContainingDayIndex_completion___block_invoke;
  v28[3] = &unk_1E69B4E70;
  id v29 = v11;
  id v20 = v11;
  id v21 = [(HKHRAFibBurdenSevenDayAnalysisManager *)v12 initWithProfile:v13 modeDeterminer:v16 analyzer:v19 calendarCache:v8 dateGenerator:v28];

  id v22 = objc_alloc(MEMORY[0x1E4F2B060]);
  id v23 = (void *)[objc_alloc(MEMORY[0x1E4F2B050]) initWithOnboardingState:1 onboardingCompletion:0 featureSettings:0];
  double v24 = (void *)[v22 initWithOnboardingRecord:v23 requirementsEvaluationByContext:MEMORY[0x1E4F1CC08]];

  id v27 = 0;
  id v25 = [(HKHRAFibBurdenSevenDayAnalysisManager *)v21 analyzePreviousCalendarWeekWithFeatureStatus:v24 shouldSaveSampleToDatabase:0 breadcrumbManager:0 error:&v27];
  id v26 = v27;
  v7[2](v7, v25, v26);
}

id __90__HDHRAFibBurdenControlServer_remote_performAnalysisForWeekContainingDayIndex_completion___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)remote_injectBurdenValues:(id)a3 completion:(id)a4
{
  v43 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v44 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  v48 = (void *)v6;
  uint64_t v8 = HKHRAFibBurdenPreviousWeekDayIndexRange();
  uint64_t v10 = v9;

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v45 = v5;
  id obj = [v5 reverseObjectEnumerator];
  uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v54;
    uint64_t v47 = *MEMORY[0x1E4F2A5F0];
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v54 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "burdenPercentage", v43);

        if (v14)
        {
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v8, 0, v48);
          id v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "hk_dateOnDayIndex:atHour:calendar:", v8 + v10, 0, v48);
          id v17 = [v13 burdenPercentage];
          uint64_t v18 = [v17 integerValue];

          uint64_t v19 = 100;
          if (v18 < 100) {
            uint64_t v19 = v18;
          }
          if (v19 <= 2) {
            uint64_t v20 = 2;
          }
          else {
            uint64_t v20 = v19;
          }
          id v21 = (void *)MEMORY[0x1E4F2B370];
          id v22 = [MEMORY[0x1E4F2B618] percentUnit];
          id v23 = [v21 quantityWithUnit:v22 doubleValue:(double)v20 / 100.0];

          double v24 = [v13 timeZone];
          id v25 = HKHRAFibBurdenSevenDayAnalysisMetadataWithTimeZoneAndWasClamped();

          id v26 = (void *)MEMORY[0x1E4F2B388];
          id v27 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:v47];
          [MEMORY[0x1E4F2AEF8] localDevice];
          v29 = uint64_t v28 = v11;
          id v30 = [v26 quantitySampleWithType:v27 quantity:v23 startDate:v15 endDate:v16 device:v29 metadata:v25];

          id v11 = v28;
          [v28 addObject:v30];
        }
        v8 -= 7;
        uint64_t v10 = 7;
      }
      uint64_t v10 = 7;
      uint64_t v50 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    }
    while (v50);
  }

  id v31 = [(HDStandardTaskServer *)v43 profile];
  id v32 = [v31 deviceManager];
  id v52 = 0;
  id v33 = [v32 currentDeviceEntityWithError:&v52];
  id v34 = v52;

  if (v33)
  {
    long long v35 = [(HDStandardTaskServer *)v43 profile];
    long long v36 = [v35 dataProvenanceManager];
    long long v37 = [v36 defaultLocalDataProvenanceWithDeviceEntity:v33];

    long long v38 = [(HDStandardTaskServer *)v43 profile];
    id v39 = [v38 dataManager];
    id v51 = v34;
    uint64_t v40 = [v39 insertDataObjects:v11 withProvenance:v37 creationDate:&v51 error:CFAbsoluteTimeGetCurrent()];
    id v41 = v51;

    v42 = v44;
    (*((void (**)(id, uint64_t, id))v44 + 2))(v44, v40, v41);

    id v34 = v41;
  }
  else
  {
    v42 = v44;
    (*((void (**)(id, void, id))v44 + 2))(v44, 0, v34);
  }
}

- (void)remote_sendNotificationWithMode:(id)a3 completion:(id)a4
{
}

- (void)remote_fetchSevenDayAnalysisBreadcrumbsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, id))a3;
  id v5 = [HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager alloc];
  uint64_t v6 = [(HDStandardTaskServer *)self profile];
  uint64_t v7 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)v5 initWithProfile:v6];

  id v10 = 0;
  uint64_t v8 = [(HDHRAFibBurdenSevenDayAnalysisBreadcrumbManager *)v7 fetchBreadcrumbsWithError:&v10];
  id v9 = v10;
  v4[2](v4, v8, v9);
}

- (id)_clientRemoteObjectProxy
{
  v2 = [(HDStandardTaskServer *)self client];
  id v3 = [v2 connection];
  uint64_t v4 = [v3 remoteObjectProxy];

  return v4;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v13 profile];
  id v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x1E4F67D70]];

  if (v16)
  {
    id v17 = [v16 aFibBurdenComponents];
    uint64_t v18 = [v17 notificationManager];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = v18;
    }
    else
    {
      double v24 = [HDHRAFibBurdenNotificationManager alloc];
      id v25 = [v13 profile];
      uint64_t v20 = [(HDHRAFibBurdenNotificationManager *)v24 initWithProfile:v25];
    }
    id v26 = [HDHRAFibBurdenControlServer alloc];
    id v22 = [v16 aFibBurdenComponents];
    id v27 = [(HDHRAFibBurdenNotificationManager *)v22 sevenDayAnalysisScheduler];
    id v23 = [(HDHRAFibBurdenControlServer *)v26 initWithUUID:v11 configuration:v12 client:v13 delegate:v14 scheduler:v27 notificationManager:v20];

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
  id v21 = (HDHRAFibBurdenNotificationManager *)(id)objc_claimAutoreleasedReturnValue();
  id v22 = v21;
  if (v21)
  {
    if (a7)
    {
      id v22 = v21;
      id v23 = 0;
      *a7 = v22;
      uint64_t v20 = v22;
      goto LABEL_11;
    }
    _HKLogDroppedError();
  }
  id v23 = 0;
  uint64_t v20 = v22;
LABEL_11:

  return v23;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F41216A8](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F41216A0](self, a2);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F67D30];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationManager, 0);

  objc_storeStrong((id *)&self->_scheduler, 0);
}

- (void)remote_addTachogramClassificationForSampleUUID:(uint64_t)a1 hasAFib:(uint64_t)a2 completion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D3AC6000, log, OS_LOG_TYPE_ERROR, "[%@] Error while inserting tachogram classification: %@", (uint8_t *)&v3, 0x16u);
}

@end