CFStringRef sub_4718(uint64_t a1, void *a2)
{
  id v2;
  CFStringRef v3;

  v2 = a2;
  self;
  if ([v2 isEqualToString:HKQuantityTypeIdentifierActiveEnergyBurned])
  {
    v3 = @"demoEnergyBurned";
  }
  else if ([v2 isEqualToString:HKQuantityTypeIdentifierAppleExerciseTime])
  {
    v3 = @"demoExerciseMinutes";
  }
  else if ([v2 isEqualToString:HKCategoryTypeIdentifierAppleStandHour])
  {
    v3 = @"demoStandHours";
  }
  else if ([v2 isEqualToString:HKQuantityTypeIdentifierStepCount])
  {
    v3 = @"demoSteps";
  }
  else if ([v2 isEqualToString:HKQuantityTypeIdentifierPushCount])
  {
    v3 = @"demoPushes";
  }
  else if ([v2 isEqualToString:HKQuantityTypeIdentifierDistanceWalkingRunning])
  {
    v3 = @"demoDistance";
  }
  else if ([v2 isEqualToString:HKQuantityTypeIdentifierFlightsClimbed])
  {
    v3 = @"demoFlightsClimbed";
  }
  else if ([v2 isEqualToString:HKQuantityTypeIdentifierAppleMoveTime])
  {
    v3 = @"demoAppleMoveTime";
  }
  else if ([v2 isEqualToString:_HKCategoryTypeIdentifierActivityMoveModeChange])
  {
    v3 = @"demoActivityMoveMode";
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_4C80(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) profile];
  v2 = [v3 currentActivitySummaryHelper];
  [v2 addObserver:*(void *)(a1 + 32)];
}

void sub_4EE4(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a2;
  [a3 doubleValue];
  objc_msgSend(v4, "startDataCollectionForType:observer:collectionInterval:", v6, v5);
}

id sub_5030(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stopDataCollectionForType:a2 observer:*(void *)(a1 + 40)];
}

id sub_5654(uint64_t a1)
{
  if (a1)
  {
    v49 = +[HKUnit kilocalorieUnit];
    v43 = +[HKUnit minuteUnit];
    v41 = +[HKUnit countUnit];
    uint64_t v1 = +[HKUnit meterUnit];
    id v2 = objc_alloc_init((Class)HKActivitySummary);
    uint64_t v3 = +[NSDate date];
    v4 = +[NSCalendar currentCalendar];
    uint64_t v5 = [v4 startOfDayForDate:v3];
    id v6 = [v4 dateByAddingUnit:16 value:1 toDate:v5 options:0];
    v29 = _HKActivityCacheDateComponentsFromDate();
    [v2 _setActivitySummaryIndex:_HKCacheIndexFromDateComponents()];
    [v2 _setStartDate:v5];
    [v2 _setEndDate:v6];
    v7 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:_HKCategoryTypeIdentifierActivityMoveModeChange];
    v50 = (void *)v1;
    v31 = v4;
    v32 = (void *)v3;
    if (![v7 integerValue])
    {

      v7 = &off_35430;
    }
    v48 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    v47 = +[HDActivityDemoDataStore demoValueForKey:@".goal" withDataTypeIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    v46 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierAppleMoveTime];
    v45 = +[HDActivityDemoDataStore demoValueForKey:@".goal" withDataTypeIdentifier:HKQuantityTypeIdentifierAppleMoveTime];
    uint64_t v8 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierAppleExerciseTime];
    v9 = +[HDActivityDemoDataStore demoValueForKey:@".goal" withDataTypeIdentifier:HKQuantityTypeIdentifierAppleExerciseTime];
    v44 = (void *)v8;
    if (![v9 integerValue])
    {
      uint64_t v10 = +[NSNumber numberWithInteger:_HKDefaultDailyBriskMinutesGoal];

      v9 = (void *)v10;
    }
    v42 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKCategoryTypeIdentifierAppleStandHour];
    v11 = +[HDActivityDemoDataStore demoValueForKey:@".goal" withDataTypeIdentifier:HKCategoryTypeIdentifierAppleStandHour];
    v12 = v7;
    v30 = (void *)v5;
    v13 = v9;
    if (![v11 integerValue])
    {
      uint64_t v14 = +[NSNumber numberWithInteger:_HKDefaultDailyActiveHoursGoal];
      v15 = v11;
      v11 = (void *)v14;
    }
    v40 = v11;
    v27 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierStepCount];
    v26 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierPushCount];
    v39 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning];
    v38 = +[HDActivityDemoDataStore demoValueForKey:@".current" withDataTypeIdentifier:HKQuantityTypeIdentifierFlightsClimbed];
    id v33 = [v12 integerValue];
    [v48 doubleValue];
    v37 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v49);
    [v47 doubleValue];
    v35 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v49);
    [v46 doubleValue];
    v36 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v43);
    [v45 doubleValue];
    v25 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v43);
    [v44 doubleValue];
    v16 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v43);
    v28 = v12;
    [v13 doubleValue];
    v24 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v43);
    [v42 doubleValue];
    v23 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v41);
    [v11 doubleValue];
    v17 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v41);
    [v27 doubleValue];
    v22 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v41);
    [v26 doubleValue];
    v21 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v41);
    [v39 doubleValue];
    v18 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v50);
    [v38 doubleValue];
    v19 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v41);
    [v2 setActivityMoveMode:v33];
    [v2 setActiveEnergyBurned:v37];
    [v2 setActiveEnergyBurnedGoal:v35];
    [v2 setAppleMoveTime:v36];
    [v2 setAppleMoveTimeGoal:v25];
    [v2 setAppleExerciseTime:v16];
    [v2 setExerciseTimeGoal:v24];
    [v2 setAppleStandHours:v23];
    [v2 setStandHoursGoal:v17];
    [v2 setStepCount:v22];
    [v2 _setPushCount:v21];
    [v2 setDistanceWalkingRunning:v18];
    id v34 = v2;
    [v2 _setFlightsClimbed:v19];
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

void sub_6198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak((id *)(v22 - 128));

  _Unwind_Resume(a1);
}

void sub_6260(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = +[HDDaemonTransaction transactionWithOwner:WeakRetained activityName:@"ActivityCacheUpdate"];

  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
    sub_22AEC();
  }
  id v4 = objc_loadWeakRetained(v1);
  sub_6330((uint64_t)v4);

  [v3 invalidate];
}

void sub_6308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6330(uint64_t a1)
{
  if (a1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    sub_ABEC(a1);
    sub_ADE0(a1);
    sub_AED0(a1);
    sub_999C(a1);
    sub_9414(a1);
    sub_8614(a1);
    sub_9FD4(a1);
    sub_7FDC((id *)a1);
    sub_B378(a1);
    sub_6D18(a1);
    sub_7970(a1);
    sub_7D00((id *)a1);
    _HKInitializeLogging();
    uint64_t v3 = HKLogActivityCache;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 134218240;
      uint64_t v6 = v4;
      __int16 v7 = 2048;
      double v8 = CFAbsoluteTimeGetCurrent() - Current;
      _os_log_impl(&def_E6CC, v3, OS_LOG_TYPE_DEFAULT, "Updated today (%lld) and yesterday caches in %.3f seconds", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_646C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6484(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = +[HDDaemonTransaction transactionWithOwner:WeakRetained activityName:@"ActivityCacheRebuild"];

  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
    sub_22B20();
  }
  id v4 = objc_loadWeakRetained(v1);
  int v5 = v4;
  if (v4)
  {
    sub_BA08((uint64_t)v4);
    sub_6330((uint64_t)v5);
  }

  [v3 invalidate];
}

void sub_653C(_Unwind_Exception *a1)
{
  id v2 = v1;

  _Unwind_Resume(a1);
}

void sub_66B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)HDActivityCacheManager;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_6710(void *a1)
{
}

void sub_6808(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 304), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 312), *(id *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    sub_BA08(*(void *)(a1 + 32));
    sub_6330(v2);
  }
  if (*(void *)(a1 + 56))
  {
    _HKDispatchAsyncOnGlobalConcurrentQueue(21);
  }
}

BOOL sub_6884(uint64_t a1)
{
  if (!a1
    || !*(unsigned char *)(a1 + 88)
    || !*(unsigned char *)(a1 + 56)
    || !*(unsigned char *)(a1 + 232)
    || !*(unsigned char *)(a1 + 248)
    || !*(void *)(a1 + 72))
  {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 136) targetDayStatisticsBuilder];
  BOOL v2 = v1 != 0;

  return v2;
}

id *sub_68F0(uint64_t a1)
{
  uint64_t v3 = (id *)a1;
  if (a1)
  {
    if (sub_6884(a1) && sub_6A70((uint64_t)v3))
    {
      id v4 = [v3[23] objectForKeyedSubscript:@"HDActivityCacheManagerTodayCalorieGoal"];
      int v5 = [v4 quantity];
      [v5 _value];
      double v7 = v6;
      if (v6 <= 0.0
        && ([v3[23] objectForKeyedSubscript:@"HDActivityCacheManagerTodayMoveMinuteGoal"],
            uint64_t v1 = objc_claimAutoreleasedReturnValue(),
            [v1 quantity],
            BOOL v2 = objc_claimAutoreleasedReturnValue(),
            [v2 _value],
            v8 <= 0.0))
      {
        uint64_t v3 = 0;
      }
      else
      {
        v9 = [v3[17] activeDevicePairedDate];
        uint64_t v10 = [v3[9] endDate];
        uint64_t v3 = (id *)objc_msgSend(v9, "hk_isBeforeOrEqualToDate:", v10);

        if (v7 > 0.0) {
          goto LABEL_11;
        }
      }

LABEL_11:
      return v3;
    }
    return 0;
  }
  return v3;
}

void sub_6A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_6A70(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  BOOL v2 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayCalorieGoal"];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayMoveMinuteGoal"];

  if (!v3 || !sub_83E4(a1)) {
    return 0;
  }

  return sub_8470(a1);
}

id *sub_6B04(uint64_t a1)
{
  uint64_t v3 = (id *)a1;
  if (a1)
  {
    if (sub_6884(a1) && sub_6C84((uint64_t)v3))
    {
      id v4 = [v3[23] objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayCalorieGoal"];
      int v5 = [v4 quantity];
      [v5 _value];
      double v7 = v6;
      if (v6 <= 0.0
        && ([v3[23] objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayMoveMinuteGoal"],
            uint64_t v1 = objc_claimAutoreleasedReturnValue(),
            [v1 quantity],
            BOOL v2 = objc_claimAutoreleasedReturnValue(),
            [v2 _value],
            v8 <= 0.0))
      {
        uint64_t v3 = 0;
      }
      else
      {
        v9 = [v3[17] activeDevicePairedDate];
        uint64_t v10 = [v3[10] endDate];
        uint64_t v3 = (id *)objc_msgSend(v9, "hk_isBeforeOrEqualToDate:", v10);

        if (v7 > 0.0) {
          goto LABEL_11;
        }
      }

LABEL_11:
      return v3;
    }
    return 0;
  }
  return v3;
}

void sub_6C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_6C84(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  BOOL v2 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayCalorieGoal"];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayMoveMinuteGoal"];

  if (!v3 || !sub_84FC(a1)) {
    return 0;
  }

  return sub_8588(a1);
}

BOOL sub_6D18(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if ((sub_68F0(a1) & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
      sub_22B54();
    }
    return 0;
  }
  v15 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayCalorieGoal"];
  v16 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayMoveMinuteGoal"];
  BOOL v2 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayExerciseGoal"];
  uint64_t v3 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayStandGoal"];
  id v4 = *(void **)(a1 + 216);
  if (v4) {
    id v5 = [v4 value];
  }
  else {
    id v5 = &def_E6CC + 1;
  }
  double v7 = *(void **)(a1 + 104);
  int v8 = *(unsigned __int8 *)(a1 + 249);
  v9 = *(void **)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = [*(id *)(a1 + 136) targetDayStatisticsBuilder];
  v12 = sub_6F40(a1, v9, v15, v16, v2, v3, v10, v7, v11, *(void *)(a1 + 288), (uint64_t)v5, v8 != 0, 0);

  BOOL v6 = v12 == 0;
  if (v12)
  {
    objc_storeStrong((id *)(a1 + 104), v12);
    v13 = [*(id *)(a1 + 272) allObjects];
    sub_7830(a1, v13);
  }
  return v6;
}

void sub_6EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_6F30()
{
}

void sub_6F38()
{
}

id sub_6F40(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, char a13)
{
  id v73 = a2;
  id v78 = a3;
  id v77 = a4;
  id v75 = a5;
  id v76 = a6;
  id v19 = a8;
  id v20 = a9;
  if (a1)
  {
    v21 = [v19 UUID];
    uint64_t v22 = v21;
    if (v21)
    {
      id v74 = v21;
    }
    else
    {
      id v74 = +[NSUUID UUID];
    }

    if (v19) {
      v23 = (char *)[v19 sequence] + 1;
    }
    else {
      v23 = (unsigned char *)(&def_E6CC + 1);
    }
    v24 = [v73 startDate];
    uint64_t v25 = [v73 endDate];
    v26 = _HKActivityCacheDateComponentsFromCacheIndex();
    v27 = +[HKActivityCache _activityCacheWithUUID:v74 startDate:v24 endDate:v25 dateComponents:v26 sequence:v23];

    v28 = [v20 activeEnergyValue];
    [v27 _setEnergyBurned:v28];

    v29 = [v78 quantity];
    [v27 _setEnergyBurnedGoal:v29];

    v30 = [v78 endDate];
    [v27 _setEnergyBurnedGoalDateOnly:v30];

    objc_msgSend(v27, "_setMoveMinutes:", (double)(uint64_t)objc_msgSend(v20, "moveMinuteValue"));
    v31 = [v77 quantity];
    [v27 _setMoveMinutesGoal:v31];

    v32 = [v77 endDate];
    [v27 _setMoveMinutesGoalDateOnly:v32];

    id v33 = [v20 distanceWalkingValue];
    [v27 _setWalkingAndRunningDistance:v33];

    id v34 = +[_HKBehavior sharedBehavior];
    LOBYTE(v25) = [v34 isStandalonePhoneFitnessMode];

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v27, "_setActiveHours:", (double)(uint64_t)objc_msgSend(v20, "standHourValue"));
      v35 = [v76 quantity];
      [v27 _setActiveHoursGoal:v35];

      v36 = [v76 startDate];
      [v36 timeIntervalSinceReferenceDate];
      double v38 = v37;
      v39 = +[NSDate distantPast];
      [v39 timeIntervalSinceReferenceDate];
      double v41 = v40;

      if (v38 != v41)
      {
        v42 = [v76 startDate];
        [v27 _setActiveHoursGoalDateOnly:v42];
      }
      objc_msgSend(v27, "_setBriskMinutes:", (double)(uint64_t)objc_msgSend(v20, "exerciseMinuteValue"));
      v43 = [v75 quantity];
      [v27 _setBriskMinutesGoal:v43];

      v44 = [v75 startDate];
      [v44 timeIntervalSinceReferenceDate];
      double v46 = v45;
      v47 = +[NSDate distantPast];
      [v47 timeIntervalSinceReferenceDate];
      double v49 = v48;

      if (v46 != v49)
      {
        v50 = [v75 startDate];
        [v27 _setBriskMinutesGoalDateOnly:v50];
      }
    }
    objc_msgSend(v27, "_setPushCount:", objc_msgSend(v20, "pushCountValue"));
    [v27 _setWheelchairUse:a10];
    objc_msgSend(v27, "_setStepCount:", objc_msgSend(v20, "stepCountValue"));
    [v20 deepBreathingDurationValue];
    objc_msgSend(v27, "_setDeepBreathingDuration:");
    objc_msgSend(v27, "_setFlightsClimbed:", objc_msgSend(v20, "flightsClimbedValue"));
    [v27 _setActivityMoveMode:a11];
    [v27 _setPaused:a12];
    unsigned int v51 = [v27 _isEqualToActivityCache:v19];
    unsigned int v52 = v51;
    if (a13)
    {
      if (![v19 hasDailyEnergyBurnedStatistics]
        || (v52 & [v19 hasDailyBriskMinutesStatistics] & 1) == 0)
      {
        id v53 = objc_alloc_init((Class)NSDateComponents);
        [v53 setMinute:kHKDailyStatisticsIntervalInMinutes];
        v54 = +[NSCalendar currentCalendar];
        v55 = [v20 createMoveStatisticsWithIntervalComponents:v53 calendar:v54];
        v56 = [v20 createMoveMinuteStatisticsWithIntervalComponents:v53 calendar:v54];
        v57 = [v20 createExerciseStatisticsWithIntervalComponents:v53 calendar:v54];
        [v27 _setDailyEnergyBurnedStatistics:v55];
        [v27 _setDailyMoveMinutesStatistics:v56];
        [v27 _setDailyBriskMinutesStatistics:v57];

LABEL_23:
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        v62 = [WeakRetained dataProvenanceManager];
        v63 = [v62 defaultLocalDataProvenance];

        if (v63)
        {
          id v64 = objc_loadWeakRetained((id *)(a1 + 8));
          v65 = [v64 dataManager];
          v84 = v27;
          v66 = +[NSArray arrayWithObjects:&v84 count:1];
          id v79 = 0;
          unsigned int v67 = [v65 insertDataObjects:v66 withProvenance:v63 creationDate:&v79 error:CFAbsoluteTimeGetCurrent()];
          id v68 = v79;

          if (v67)
          {
            _HKInitializeLogging();
            v69 = HKLogActivityCache;
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              id v70 = [v27 cacheIndex];
              *(_DWORD *)buf = 134218242;
              id v81 = v70;
              __int16 v82 = 2112;
              v83 = v27;
              _os_log_impl(&def_E6CC, v69, OS_LOG_TYPE_DEFAULT, "Saved activity cache (%ld): %@", buf, 0x16u);
            }

            v71 = v27;
          }
          else
          {
            _HKInitializeLogging();
            if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
              sub_22C10();
            }
            v71 = 0;
          }
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
            sub_22BD0();
          }
          v71 = 0;
        }
        id v60 = v71;

LABEL_36:
        goto LABEL_37;
      }
    }
    else if (!v51)
    {
      goto LABEL_23;
    }
    _HKInitializeLogging();
    v58 = (void *)HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG))
    {
      v59 = v58;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
        sub_22B88(buf, (uint64_t)[v27 cacheIndex], v59);
      }
    }
    id v60 = v19;
    goto LABEL_36;
  }
  id v60 = 0;
LABEL_37:

  return v60;
}

void sub_76B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_7830(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (*(void *)(a1 + 104))
    {
      id v5 = [v3 copy];
      id v6 = *(id *)(a1 + 104);
      double v7 = *(NSObject **)(a1 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_CAB8;
      block[3] = &unk_34A88;
      id v12 = v5;
      uint64_t v13 = a1;
      id v14 = v6;
      id v8 = v6;
      id v9 = v5;
      dispatch_async(v7, block);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v10 = HKLogActivityCache;
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_E6CC, v10, OS_LOG_TYPE_INFO, "Not alerting activity cache observers, _existingTodayActivityCache is nil", buf, 2u);
      }
    }
  }
}

void sub_795C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_7970(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  if ((sub_6B04(a1) & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
      sub_22C78();
    }
    return 0;
  }
  id v2 = *(id *)(a1 + 288);
  if ([*(id *)(a1 + 96) hasWheelchairUse]) {
    id v2 = [*(id *)(a1 + 96) wheelchairUse];
  }
  v16 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayCalorieGoal"];
  v15 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayMoveMinuteGoal"];
  v17 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayExerciseGoal"];
  id v3 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayStandGoal"];
  id v4 = *(void **)(a1 + 224);
  if (v4) {
    id v5 = [v4 value];
  }
  else {
    id v5 = &def_E6CC + 1;
  }
  int v7 = *(unsigned __int8 *)(a1 + 250);
  id v8 = *(void **)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(a1 + 96);
  v11 = [*(id *)(a1 + 136) previousDayStatisticsBuilder];
  id v12 = sub_6F40(a1, v8, v16, v15, v17, v3, v9, v10, v11, (uint64_t)v2, (uint64_t)v5, v7 != 0, 1);

  BOOL v6 = v12 == 0;
  if (v12)
  {
    objc_storeStrong((id *)(a1 + 96), v12);
    uint64_t v13 = [*(id *)(a1 + 272) allObjects];
    sub_7BC0(a1, v13);
  }
  return v6;
}

void sub_7B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_7BB0()
{
}

void sub_7BB8()
{
}

void sub_7BC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (*(void *)(a1 + 96))
    {
      id v5 = [v3 copy];
      id v6 = *(id *)(a1 + 96);
      int v7 = *(NSObject **)(a1 + 24);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_CBF4;
      block[3] = &unk_34A88;
      id v12 = v5;
      uint64_t v13 = a1;
      id v14 = v6;
      id v8 = v6;
      id v9 = v5;
      dispatch_async(v7, block);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v10 = HKLogActivityCache;
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_E6CC, v10, OS_LOG_TYPE_INFO, "Not alerting activity cache observers, _existingYesterdayActivityCache is nil", buf, 2u);
      }
    }
  }
}

void sub_7CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7D00(id *a1)
{
  if (a1)
  {
    id v6 = [a1[34] allObjects];
    id v2 = [a1[17] targetDayHeartRateStatisticsBuilder];
    id v3 = [v2 heartRateSummary];

    if (v3 && ([a1[14] isEqual:v3] & 1) == 0)
    {
      objc_storeStrong(a1 + 14, v3);
      sub_7E64((uint64_t)a1, v6, v3);
    }
    id v4 = [a1[17] previousDayHeartRateStatisticsBuilder];
    id v5 = [v4 heartRateSummary];

    if (v5 && ([a1[15] isEqual:v5] & 1) == 0)
    {
      objc_storeStrong(a1 + 15, v5);
      sub_7E64((uint64_t)a1, v6, v5);
    }
  }
}

void sub_7E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7E64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (a1)
  {
    if (v6)
    {
      id v8 = [v5 copy];
      id v9 = [v7 deepCopy];
      uint64_t v10 = *(NSObject **)(a1 + 24);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_CD6C;
      v14[3] = &unk_34AB0;
      id v15 = v7;
      uint64_t v16 = a1;
      id v17 = v8;
      id v18 = v9;
      id v11 = v9;
      id v12 = v8;
      dispatch_async(v10, v14);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v13 = HKLogHeartRate;
      if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_E6CC, v13, OS_LOG_TYPE_INFO, "not alerting activity cache observers, heartRateSummary is nil", buf, 2u);
      }
    }
  }
}

void sub_7FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id *sub_7FDC(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*((unsigned char *)result + 56))
    {
      id v2 = result[17];
      if (!v2)
      {
        id v3 = [HDActivityCacheDataSource alloc];
        id WeakRetained = objc_loadWeakRetained(v1 + 1);
        id v5 = [(HDActivityCacheDataSource *)v3 initWithProfile:WeakRetained observedQuantityTypes:v1[22] updateOperation:v1[32] rebuildOperation:v1[33] queue:v1[2]];
        id v6 = v1[17];
        v1[17] = v5;

        [v1[17] setTargetDayStatisticsBuilderTag:@"Today"];
        [v1[17] setPreviousDayStatisticsBuilderTag:@"Yesterday"];
        [v1[17] setTargetDayDateInterval:v1[9]];
        [v1[17] setPreviousDayDateInterval:v1[10]];
        [v1[17] setTargetDayCacheIndex:v1[4]];
        [v1[17] setPreviousDayCacheIndex:v1[5]];
        id v2 = v1[17];
      }
      return (id *)[v2 updateWithError:0];
    }
  }
  return result;
}

void sub_80D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_80E4(uint64_t a1)
{
  if (a1
    && (+[_HKBehavior sharedBehavior],
        id v2 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v3 = [v2 isStandalonePhoneFitnessMode],
        v2,
        (v3 & 1) == 0))
  {
    id v5 = *(void **)(a1 + 216);
    if (v5)
    {
      id v6 = (char *)[v5 value];
      int v7 = (uint64_t *)&_HKDefaultTinkerDailyBriskMinutesGoal;
      if (v6 != (unsigned char *)&def_E6CC + 2) {
        int v7 = (uint64_t *)&_HKDefaultDailyBriskMinutesGoal;
      }
    }
    else
    {
      int v7 = (uint64_t *)&_HKDefaultDailyBriskMinutesGoal;
    }
    double v8 = (double)*v7;
    uint64_t v9 = *(void *)(a1 + 160);
    uint64_t v10 = +[HKUnit minuteUnit];
    id v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:v8];
    id v12 = +[NSDate distantPast];
    uint64_t v13 = +[NSDate distantPast];
    id v4 = +[HKQuantitySample quantitySampleWithType:v9 quantity:v11 startDate:v12 endDate:v13];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_822C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_8264(uint64_t a1)
{
  if (a1
    && (+[_HKBehavior sharedBehavior],
        id v2 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v3 = [v2 isStandalonePhoneFitnessMode],
        v2,
        (v3 & 1) == 0))
  {
    id v5 = *(void **)(a1 + 216);
    if (v5)
    {
      id v6 = (char *)[v5 value];
      int v7 = (uint64_t *)&_HKDefaultTinkerDailyActiveHoursGoal;
      if (v6 != (unsigned char *)&def_E6CC + 2) {
        int v7 = (uint64_t *)&_HKDefaultDailyActiveHoursGoal;
      }
    }
    else
    {
      int v7 = (uint64_t *)&_HKDefaultDailyActiveHoursGoal;
    }
    double v8 = (double)*v7;
    uint64_t v9 = *(void *)(a1 + 168);
    uint64_t v10 = +[HKUnit countUnit];
    id v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:v8];
    id v12 = +[NSDate distantPast];
    uint64_t v13 = +[NSDate distantPast];
    id v4 = +[HKQuantitySample quantitySampleWithType:v9 quantity:v11 startDate:v12 endDate:v13];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_83AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_83E4(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayExerciseGoal"];
  if (v1)
  {
    id v2 = &def_E6CC + 1;
  }
  else
  {
    unsigned __int8 v3 = +[_HKBehavior sharedBehavior];
    id v2 = [v3 isStandalonePhoneFitnessMode];
  }
  return v2;
}

void sub_8460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_8470(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerTodayStandGoal"];
  if (v1)
  {
    id v2 = &def_E6CC + 1;
  }
  else
  {
    unsigned __int8 v3 = +[_HKBehavior sharedBehavior];
    id v2 = [v3 isStandalonePhoneFitnessMode];
  }
  return v2;
}

void sub_84EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_84FC(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayExerciseGoal"];
  if (v1)
  {
    id v2 = &def_E6CC + 1;
  }
  else
  {
    unsigned __int8 v3 = +[_HKBehavior sharedBehavior];
    id v2 = [v3 isStandalonePhoneFitnessMode];
  }
  return v2;
}

void sub_8578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_8588(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 184) objectForKeyedSubscript:@"HDActivityCacheManagerYesterdayStandGoal"];
  if (v1)
  {
    id v2 = &def_E6CC + 1;
  }
  else
  {
    unsigned __int8 v3 = +[_HKBehavior sharedBehavior];
    id v2 = [v3 isStandalonePhoneFitnessMode];
  }
  return v2;
}

void sub_8604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8614(uint64_t a1)
{
  if (a1 && (sub_6A70(a1) & 1) == 0)
  {
    sub_8688(a1, *(void **)(a1 + 144));
    sub_8688(a1, *(void **)(a1 + 152));
    sub_8688(a1, *(void **)(a1 + 160));
    id v2 = *(void **)(a1 + 168);
    sub_8688(a1, v2);
  }
}

void sub_8688(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isEqual:*(void *)(a1 + 144)])
    {
      id v5 = +[HKUnit kilocalorieUnit];
      CFStringRef v6 = @"HDActivityCacheManagerTodayCalorieGoal";
      CFStringRef v7 = @"HDActivityCacheManagerYesterdayCalorieGoal";
    }
    else if ([v4 isEqual:*(void *)(a1 + 152)])
    {
      id v5 = +[HKUnit minuteUnit];
      CFStringRef v6 = @"HDActivityCacheManagerTodayMoveMinuteGoal";
      CFStringRef v7 = @"HDActivityCacheManagerYesterdayMoveMinuteGoal";
    }
    else if ([v4 isEqual:*(void *)(a1 + 160)])
    {
      id v5 = +[HKUnit minuteUnit];
      CFStringRef v6 = @"HDActivityCacheManagerTodayExerciseGoal";
      CFStringRef v7 = @"HDActivityCacheManagerYesterdayExerciseGoal";
    }
    else
    {
      id v5 = +[HKUnit countUnit];
      CFStringRef v6 = @"HDActivityCacheManagerTodayStandGoal";
      CFStringRef v7 = @"HDActivityCacheManagerYesterdayStandGoal";
    }
    double v8 = [*(id *)(a1 + 72) endDate];
    id v35 = 0;
    uint64_t v9 = sub_8D44(a1, v4, v8, (uint64_t)&v35);
    uint64_t v10 = v35;
    [*(id *)(a1 + 184) setObject:v9 forKeyedSubscript:v6];

    if (v10)
    {
      sub_8E30((void *)a1, v4);
      goto LABEL_11;
    }
    id v11 = [*(id *)(a1 + 184) objectForKeyedSubscript:v6];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      if (([v4 isEqual:*(void *)(a1 + 144)] & 1) != 0
        || [v4 isEqual:*(void *)(a1 + 152)])
      {
        v21 = +[HKQuantity quantityWithUnit:v5 doubleValue:0.0];
        uint64_t v22 = +[NSDate distantPast];
        v23 = +[NSDate distantPast];
        v24 = +[HKQuantitySample quantitySampleWithType:v4 quantity:v21 startDate:v22 endDate:v23];
        [*(id *)(a1 + 184) setObject:v24 forKeyedSubscript:v6];
      }
      else
      {
        if ([v4 isEqual:*(void *)(a1 + 160)]) {
          sub_80E4(a1);
        }
        else {
        v21 = sub_8264(a1);
        }
        [*(id *)(a1 + 184) setObject:v21 forKeyedSubscript:v6];
      }

      id v20 = [*(id *)(a1 + 184) objectForKeyedSubscript:v6];
      [*(id *)(a1 + 184) setObject:v20 forKeyedSubscript:v7];
      goto LABEL_23;
    }
    uint64_t v13 = [*(id *)(a1 + 184) objectForKeyedSubscript:v6];
    id v14 = [v13 endDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;
    id v17 = [*(id *)(a1 + 80) endDate];
    [v17 timeIntervalSinceReferenceDate];
    BOOL v19 = v16 < v18;

    if (v19)
    {
      id v20 = [*(id *)(a1 + 184) objectForKeyedSubscript:v6];
      [*(id *)(a1 + 184) setObject:v20 forKeyedSubscript:v7];
LABEL_23:

      goto LABEL_24;
    }
    v30 = [*(id *)(a1 + 80) endDate];
    id v34 = 0;
    v31 = sub_8D44(a1, v4, v30, (uint64_t)&v34);
    uint64_t v10 = v34;
    [*(id *)(a1 + 184) setObject:v31 forKeyedSubscript:v7];

    v32 = [*(id *)(a1 + 184) objectForKeyedSubscript:v7];
    LODWORD(v30) = v32 == 0;

    if (v30)
    {
      if ([v4 isEqual:*(void *)(a1 + 160)])
      {
        id v33 = sub_80E4(a1);
        [*(id *)(a1 + 184) setObject:v33 forKeyedSubscript:v7];
      }
      else
      {
        if (![v4 isEqual:*(void *)(a1 + 168)]) {
          goto LABEL_40;
        }
        id v33 = sub_8264(a1);
        [*(id *)(a1 + 184) setObject:v33 forKeyedSubscript:v7];
      }
    }
LABEL_40:
    if (v10)
    {
LABEL_11:
      sub_8E30((void *)a1, v4);
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
        sub_22CAC();
      }
      goto LABEL_13;
    }
LABEL_24:
    _HKInitializeLogging();
    uint64_t v25 = (void *)HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = [*(id *)(a1 + 184) objectForKeyedSubscript:v6];
        *(_DWORD *)buf = 138543618;
        double v37 = v4;
        __int16 v38 = 2112;
        v39 = v27;
        _os_log_impl(&def_E6CC, v26, OS_LOG_TYPE_INFO, "Primed today's %{public}@ goal: %@", buf, 0x16u);
      }
    }
    _HKInitializeLogging();
    v28 = (void *)HKLogActivityCache;
    if (!os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    uint64_t v10 = v28;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v29 = [*(id *)(a1 + 184) objectForKeyedSubscript:v7];
      *(_DWORD *)buf = 138543618;
      double v37 = v4;
      __int16 v38 = 2112;
      v39 = v29;
      _os_log_impl(&def_E6CC, v10, OS_LOG_TYPE_INFO, "Primed yesterday's %{public}@ goal: %@", buf, 0x16u);
    }
LABEL_13:

LABEL_14:
  }
}

void sub_8C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_8D44(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = HDSampleEntityPredicateForStartDate();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v11 = +[HDSampleEntity mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:v9 anchor:0 error:a4];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void sub_8E0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8E30(void *a1, void *a2)
{
  id v10 = a2;
  if (a1)
  {
    if ([v10 isEqual:a1[18]])
    {
      id v4 = (void *)a1[23];
      id v3 = (id *)(a1 + 23);
      [v4 setObject:0 forKeyedSubscript:@"HDActivityCacheManagerTodayCalorieGoal"];
      CFStringRef v5 = @"HDActivityCacheManagerYesterdayCalorieGoal";
    }
    else if ([v10 isEqual:a1[19]])
    {
      CFStringRef v6 = (void *)a1[23];
      id v3 = (id *)(a1 + 23);
      [v6 setObject:0 forKeyedSubscript:@"HDActivityCacheManagerTodayMoveMinuteGoal"];
      CFStringRef v5 = @"HDActivityCacheManagerYesterdayMoveMinuteGoal";
    }
    else
    {
      unsigned int v7 = [v10 isEqual:a1[20]];
      uint64_t v9 = (void *)a1[23];
      id v3 = (id *)(a1 + 23);
      id v8 = v9;
      if (v7)
      {
        [v8 setObject:0 forKeyedSubscript:@"HDActivityCacheManagerTodayExerciseGoal"];
        CFStringRef v5 = @"HDActivityCacheManagerYesterdayExerciseGoal";
      }
      else
      {
        [v8 setObject:0 forKeyedSubscript:@"HDActivityCacheManagerTodayStandGoal"];
        CFStringRef v5 = @"HDActivityCacheManagerYesterdayStandGoal";
      }
    }
    [*v3 setObject:0 forKeyedSubscript:v5];
  }
}

void sub_8F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_8F44(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v15 = v3;
  if (a1 && (id v4 = v3, (sub_6A70(a1) & 1) != 0))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = [v9 sampleType];
          id v11 = (uint32_t *)[v10 code];

          BOOL v12 = (unint64_t)v11 - 67 > 0x26 || ((1 << (v11 - 67)) & 0x6000000001) == 0;
          if (!v12 || v11 == &stru_68.reserved3)
          {
            uint64_t v13 = sub_9118(a1, v9);
            goto LABEL_20;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v13 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
LABEL_20:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void sub_90D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_9118(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 quantityType];
    unsigned __int8 v6 = [v5 isEqual:*(void *)(a1 + 144)];

    if (v6)
    {
      CFStringRef v7 = @"HDActivityCacheManagerYesterdayCalorieGoal";
      CFStringRef v8 = @"HDActivityCacheManagerTodayCalorieGoal";
    }
    else
    {
      uint64_t v9 = [v4 quantityType];
      unsigned __int8 v10 = [v9 isEqual:*(void *)(a1 + 152)];

      if (v10)
      {
        CFStringRef v7 = @"HDActivityCacheManagerYesterdayMoveMinuteGoal";
        CFStringRef v8 = @"HDActivityCacheManagerTodayMoveMinuteGoal";
      }
      else
      {
        id v11 = [v4 quantityType];
        unsigned int v12 = [v11 isEqual:*(void *)(a1 + 160)];

        BOOL v13 = v12 == 0;
        if (v12) {
          CFStringRef v8 = @"HDActivityCacheManagerTodayExerciseGoal";
        }
        else {
          CFStringRef v8 = @"HDActivityCacheManagerTodayStandGoal";
        }
        if (v13) {
          CFStringRef v7 = @"HDActivityCacheManagerYesterdayStandGoal";
        }
        else {
          CFStringRef v7 = @"HDActivityCacheManagerYesterdayExerciseGoal";
        }
      }
    }
    id v14 = [v4 startDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;

    long long v17 = [v4 _creationDate];
    [v17 timeIntervalSinceReferenceDate];
    double v19 = v18;

    id v20 = [*(id *)(a1 + 184) objectForKeyedSubscript:v7];
    v21 = [v20 startDate];
    [v21 timeIntervalSinceReferenceDate];
    double v23 = v22;

    v24 = [*(id *)(a1 + 184) objectForKeyedSubscript:v8];
    uint64_t v25 = [v24 startDate];
    [v25 timeIntervalSinceReferenceDate];
    double v27 = v26;

    v28 = [*(id *)(a1 + 184) objectForKeyedSubscript:v8];
    v29 = [v28 _creationDate];
    [v29 timeIntervalSinceReferenceDate];
    double v31 = v30;

    if (v16 > v27 || (uint64_t v32 = 0, v16 == v27) && v19 > v31)
    {
      id v33 = [*(id *)(a1 + 72) endDate];
      [v33 timeIntervalSinceReferenceDate];
      double v35 = v34;

      if (v16 >= v35)
      {
        uint64_t v32 = 0;
      }
      else
      {
        [*(id *)(a1 + 184) setObject:v4 forKeyedSubscript:v8];
        uint64_t v32 = 1;
      }
    }
    if (v16 > v23)
    {
      v36 = [*(id *)(a1 + 80) endDate];
      [v36 timeIntervalSinceReferenceDate];
      double v38 = v37;

      if (v16 < v38)
      {
        [*(id *)(a1 + 184) setObject:v4 forKeyedSubscript:v7];
        uint64_t v32 = 1;
      }
    }
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

void sub_9398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9414(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 232))
  {
    _HKInitializeLogging();
    id v2 = HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_E6CC, v2, OS_LOG_TYPE_DEFAULT, "Loading activity move mode samples", buf, 2u);
    }
    *(unsigned char *)(a1 + 232) = 1;
    id v3 = *(void **)(a1 + 208);
    id v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)*(uint64_t *)(a1 + 48)];
    id v14 = 0;
    uint64_t v5 = sub_8D44(a1, v3, v4, (uint64_t)&v14);
    id v6 = v14;
    CFStringRef v7 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = v5;

    if (!*(void *)(a1 + 216) && v6)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
        sub_22D88();
      }
      *(unsigned char *)(a1 + 232) = 0;
    }

    CFStringRef v8 = *(void **)(a1 + 208);
    uint64_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)*(uint64_t *)(a1 + 32)];
    id v13 = 0;
    uint64_t v10 = sub_8D44(a1, v8, v9, (uint64_t)&v13);
    id v11 = v13;
    unsigned int v12 = *(void **)(a1 + 224);
    *(void *)(a1 + 224) = v10;

    if (!*(void *)(a1 + 224) && v11)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
        sub_22D20();
      }
      *(unsigned char *)(a1 + 232) = 0;
    }
  }
}

void sub_95DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_95FC(uint64_t a1, void *a2)
{
  id v35 = a2;
  if (a1 && *(unsigned char *)(a1 + 232))
  {
    id v3 = *(void **)(a1 + 224);
    location = (id *)(a1 + 224);
    if (v3) {
      objc_msgSend(v3, "startDate", v35);
    }
    else {
    id v4 = +[NSDate distantPast];
    }
    [v4 timeIntervalSinceReferenceDate];
    double v7 = v6;

    if (*location) {
      [*location _creationDate];
    }
    else {
    CFStringRef v8 = +[NSDate distantPast];
    }
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;

    unsigned int v12 = (id *)(a1 + 216);
    id v11 = *(void **)(a1 + 216);
    if (v11) {
      [v11 startDate];
    }
    else {
    id v13 = +[NSDate distantPast];
    }
    [v13 timeIntervalSinceReferenceDate];
    double v15 = v14;

    if (*v12) {
      [*v12 _creationDate];
    }
    else {
    double v16 = +[NSDate distantPast];
    }
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v19 = v35;
    char v5 = 0;
    id v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v19);
          }
          double v23 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v24 = [v23 sampleType];
          uint64_t v25 = (char *)[v24 code];

          if (v25 == &stru_B8.sectname[6])
          {
            double v26 = [v23 startDate];
            [v26 timeIntervalSinceReferenceDate];
            double v28 = v27;

            v29 = [v23 _creationDate];
            [v29 timeIntervalSinceReferenceDate];
            double v31 = v30;

            BOOL v32 = v31 <= v18 || v28 < v15;
            if (!v32 && v28 < (double)*(uint64_t *)(a1 + 48))
            {
              objc_storeStrong((id *)(a1 + 216), v23);
              char v5 = 1;
            }
            BOOL v33 = v31 <= v10 || v28 < v7;
            if (!v33 && v28 < (double)*(uint64_t *)(a1 + 32))
            {
              objc_storeStrong(location, v23);
              char v5 = 1;
            }
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v20);
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

void sub_98F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_999C(uint64_t a1)
{
  if (a1 && *(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 248))
  {
    id v2 = +[_HKBehavior sharedBehavior];
    id v3 = [v2 features];
    unsigned __int8 v4 = [v3 pauseRings];

    if (v4)
    {
      _HKInitializeLogging();
      char v5 = HKLogActivityCache;
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_E6CC, v5, OS_LOG_TYPE_DEFAULT, "Loading pause ring samples", buf, 2u);
      }
      double v6 = HDPauseRingsScheduleEntityPredicateForCacheIndexRange();
      double v7 = +[HKSampleType pauseRingsScheduleType];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      double v9 = +[HDPauseRingsScheduleEntity entityEnumeratorWithType:v7 profile:WeakRetained];

      [v9 setPredicate:v6];
      double v10 = +[HDSQLiteOrderingTerm orderingTermWithProperty:HDPauseRingsScheduleEntityPropertyEndDateIndex entityClass:objc_opt_class() ascending:0];
      double v23 = v10;
      id v11 = +[NSArray arrayWithObjects:&v23 count:1];
      [v9 setOrderingTerms:v11];

      *(void *)buf = 0;
      id v20 = buf;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      uint64_t v15 = 0;
      double v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      v13[6] = buf;
      id v14 = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_9D04;
      v13[3] = &unk_348E8;
      v13[4] = a1;
      v13[5] = &v15;
      LODWORD(v11) = [v9 enumerateWithError:&v14 handler:v13];
      id v12 = v14;
      if (v11)
      {
        *(unsigned char *)(a1 + 250) = *((unsigned char *)v16 + 24);
        *(unsigned char *)(a1 + 249) = v20[24];
        *(unsigned char *)(a1 + 248) = 1;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
          sub_22DF0();
        }
      }
      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      *(unsigned char *)(a1 + 248) = 1;
    }
  }
}

void sub_9C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_9D04(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1[4] + 40);
  if (v4 >= (uint64_t)[v3 startDateIndex])
  {
    uint64_t v5 = *(void *)(a1[4] + 40);
    if (v5 < (uint64_t)[v3 endDateIndex]) {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    }
  }
  uint64_t v6 = *(void *)(a1[4] + 32);
  if (v6 >= (uint64_t)[v3 startDateIndex])
  {
    uint64_t v7 = *(void *)(a1[4] + 32);
    if (v7 < (uint64_t)[v3 endDateIndex]) {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
  }

  return 1;
}

void sub_9DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_9DD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 248))
  {
    uint64_t v4 = +[_HKBehavior sharedBehavior];
    uint64_t v5 = [v4 features];
    unsigned __int8 v6 = [v5 pauseRings];

    if (v6)
    {
      uint64_t v7 = objc_msgSend(v3, "hk_filter:", &stru_34928);
      CFStringRef v8 = [v7 lastObject];
      double v9 = v8;
      if (!v8)
      {
        BOOL v13 = 0;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v10 = *(void *)(a1 + 40);
      if (v10 < (uint64_t)[v8 startDateIndex]
        || (uint64_t v11 = *(void *)(a1 + 40), v11 >= (uint64_t)[v9 endDateIndex]))
      {
        char v12 = 0;
      }
      else
      {
        char v12 = 1;
        *(unsigned char *)(a1 + 250) = 1;
      }
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14 >= (uint64_t)[v9 startDateIndex])
      {
        uint64_t v16 = *(void *)(a1 + 32);
        id v17 = [v9 endDateIndex];
        BOOL v15 = v16 < (uint64_t)v17;
        if (v16 < (uint64_t)v17) {
          char v18 = 1;
        }
        else {
          char v18 = v12;
        }
        if (v18) {
          goto LABEL_23;
        }
      }
      else if (v12)
      {
        BOOL v15 = 0;
LABEL_23:
        BOOL v13 = 1;
LABEL_25:
        *(unsigned char *)(a1 + 249) = v15;
        goto LABEL_26;
      }
      BOOL v15 = 0;
      BOOL v13 = *(unsigned char *)(a1 + 249) != 0;
      goto LABEL_25;
    }
    if (*(unsigned char *)(a1 + 249)) {
      BOOL v13 = 1;
    }
    else {
      BOOL v13 = *(unsigned char *)(a1 + 250) != 0;
    }
    *(_WORD *)(a1 + 249) = 0;
  }
  else
  {
    BOOL v13 = 0;
  }
LABEL_27:

  return v13;
}

void sub_9F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_9F84(id a1, HKSample *a2)
{
  id v2 = [(HKSample *)a2 sampleType];
  BOOL v3 = [v2 code] == (char *)&stru_108.addr + 4;

  return v3;
}

void sub_9FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9FD4(uint64_t a1)
{
  if (!a1 || *(unsigned char *)(a1 + 200) || !sub_6A70(a1)) {
    return;
  }
  id v2 = +[_HKBehavior sharedBehavior];
  BOOL v3 = [v2 features];
  unsigned __int8 v4 = [v3 scheduledGoals];

  if ((v4 & 1) == 0)
  {
    *(unsigned char *)(a1 + 200) = 1;
    return;
  }
  uint64_t v5 = *(void *)(a1 + 192);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  double v41 = +[HDSampleEntity entityEnumeratorWithType:v5 profile:WeakRetained];

  id v53 = 0;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_A614;
  v51[3] = &unk_34950;
  id v40 = objc_alloc_init((Class)NSMutableArray);
  id v52 = v40;
  [v41 enumerateWithError:&v53 handler:v51];
  id v39 = v53;
  if (v39)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
      sub_22EC0();
    }
    goto LABEL_32;
  }
  long long v38 = -[HDActivityCacheManager calendar]_0((void *)a1);
  uint64_t v7 = sub_A6DC((void *)a1);
  CFStringRef v8 = [v38 startOfDayForDate:v7];

  id v42 = objc_alloc_init((Class)NSMutableArray);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v40;
  id v9 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (!v9) {
    goto LABEL_27;
  }
  uint64_t v44 = *(void *)v48;
  do
  {
    id v45 = v9;
    for (i = 0; i != v45; i = (char *)i + 1)
    {
      if (*(void *)v48 != v44) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      char v12 = sub_A724((void *)a1, v11);
      BOOL v13 = sub_A8FC(a1, v11);
      uint64_t v14 = [v13 startDate];
      [v14 timeIntervalSinceReferenceDate];
      double v16 = v15;
      [v8 timeIntervalSinceReferenceDate];
      double v18 = v17;

      id v19 = [v11 startDate];
      [v19 timeIntervalSinceReferenceDate];
      double v21 = v20;
      [v8 timeIntervalSinceReferenceDate];
      if (v21 >= v22)
      {
        v24 = [v11 _creationDate];
        [v24 timeIntervalSinceReferenceDate];
        double v26 = v25;
        double v27 = [v13 _creationDate];
        [v27 timeIntervalSinceReferenceDate];
        BOOL v23 = v26 >= v28;
      }
      else
      {
        BOOL v23 = 0;
      }

      v29 = [v13 quantity];
      [v29 _value];
      double v31 = v30;
      [v12 _value];
      if (v31 == v32) {
        goto LABEL_24;
      }
      if (v16 < v18) {
        BOOL v23 = 1;
      }

      if (v23)
      {
        v29 = sub_A9C4((void *)a1, v11);
        BOOL v33 = +[HKQuantitySample quantitySampleWithType:v29 quantity:v12 startDate:v8 endDate:v8];
        _HKInitializeLogging();
        double v34 = HKLogActivityCache;
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v55 = v33;
          _os_log_impl(&def_E6CC, v34, OS_LOG_TYPE_DEFAULT, "Saving new scheduled goal: %@", buf, 0xCu);
        }
        [v42 addObject:v33];

LABEL_24:
      }
    }
    id v9 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  }
  while (v9);
LABEL_27:

  id v35 = objc_loadWeakRetained((id *)(a1 + 8));
  v36 = [v35 dataManager];

  id v46 = 0;
  LOBYTE(v35) = [v36 insertDataObjects:v42 error:&v46];
  id v37 = v46;
  if (v35)
  {
    *(unsigned char *)(a1 + 200) = 1;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
      sub_22E58();
    }
  }

LABEL_32:
}

void sub_A4D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  _Unwind_Resume(a1);
}

uint64_t sub_A614(uint64_t a1, uint64_t a2)
{
  return 1;
}

void sub_A6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_A6DC(void *a1)
{
  if (a1)
  {
    id v2 = (void *)a1[38];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = +[NSDate date];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_A724(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    unsigned __int8 v4 = -[HDActivityCacheManager calendar]_0(a1);
    uint64_t v5 = sub_A6DC(a1);
    unsigned __int8 v6 = [v4 startOfDayForDate:v5];

    switch((unint64_t)[v4 component:512 fromDate:v6])
    {
      case 1uLL:
        uint64_t v7 = [v3 sundayGoal];
        goto LABEL_13;
      case 2uLL:
        uint64_t v7 = [v3 mondayGoal];
        goto LABEL_13;
      case 3uLL:
        uint64_t v7 = [v3 tuesdayGoal];
        goto LABEL_13;
      case 4uLL:
        uint64_t v7 = [v3 wednesdayGoal];
        goto LABEL_13;
      case 5uLL:
        uint64_t v7 = [v3 thursdayGoal];
        goto LABEL_13;
      case 6uLL:
        uint64_t v7 = [v3 fridayGoal];
        goto LABEL_13;
      case 7uLL:
        uint64_t v7 = [v3 saturdayGoal];
LABEL_13:
        CFStringRef v8 = (void *)v7;
        break;
      default:
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
          sub_22F28();
        }
        CFStringRef v8 = 0;
        break;
    }
  }
  else
  {
    CFStringRef v8 = 0;
  }

  return v8;
}

void sub_A8A8(_Unwind_Exception *a1)
{
  unsigned __int8 v4 = v3;

  _Unwind_Resume(a1);
}

id sub_A8FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = v3;
  if (a1)
  {
    unint64_t v5 = (unint64_t)[v3 goalType];
    if (v5 < 4)
    {
      unsigned __int8 v6 = [*(id *)(a1 + 184) objectForKeyedSubscript:off_34AD0[v5]];
      goto LABEL_7;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
      sub_22F90();
    }
  }
  unsigned __int8 v6 = 0;
LABEL_7:

  return v6;
}

void sub_A9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_A9C4(void *a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = v3;
  if (a1)
  {
    switch((unint64_t)[v3 goalType])
    {
      case 0uLL:
        unint64_t v5 = (void *)a1[18];
        break;
      case 1uLL:
        unint64_t v5 = (void *)a1[19];
        break;
      case 2uLL:
        unint64_t v5 = (void *)a1[20];
        break;
      case 3uLL:
        unint64_t v5 = (void *)a1[21];
        break;
      default:
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
          sub_22F90();
        }
        goto LABEL_6;
    }
    id v6 = v5;
  }
  else
  {
LABEL_6:
    id v6 = 0;
  }

  return v6;
}

void sub_AAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_AAC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    unsigned __int8 v4 = +[_HKBehavior sharedBehavior];
    unint64_t v5 = [v4 features];
    unsigned __int8 v6 = [v5 scheduledGoals];

    if ((v6 & 1) != 0 && *(unsigned char *)(a1 + 200))
    {
      uint64_t v7 = objc_msgSend(v3, "hk_firstObjectPassingTest:", &stru_34970);
      a1 = v7 != 0;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void sub_AB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_AB9C(id a1, HKSample *a2)
{
  id v2 = [(HKSample *)a2 sampleType];
  BOOL v3 = [v2 code] == (char *)&stru_108.addr + 3;

  return v3;
}

void sub_ABDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ABEC(uint64_t a1)
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      id v2 = -[HDActivityCacheManager calendar]_0((void *)a1);
      uint64_t v3 = [v2 timeZone];
      unsigned __int8 v4 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v3;

      unint64_t v5 = sub_A6DC((void *)a1);
      unsigned __int8 v6 = [v2 startOfDayForDate:v5];

      uint64_t v7 = [v2 dateByAddingUnit:16 value:-1 toDate:v6 options:0];
      CFStringRef v8 = [v2 startOfDayForDate:v7];

      id v9 = [v2 dateByAddingUnit:16 value:1 toDate:v6 options:0];
      uint64_t v10 = [v2 startOfDayForDate:v9];

      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v16 = 0;
      sub_B504(a1, &v18, &v17, &v16, v6, v8, v10, v2);
      id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v6 endDate:v10];
      char v12 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v11;

      id v13 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v8 endDate:v6];
      uint64_t v14 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v13;

      uint64_t v15 = v17;
      *(void *)(a1 + 32) = v18;
      *(void *)(a1 + 40) = v15;
      *(void *)(a1 + 48) = v16;
      *(unsigned char *)(a1 + 56) = 1;
    }
  }
}

void sub_AD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_ADE0(uint64_t a1)
{
  if (a1 && !*(void *)(a1 + 128))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v3 = [WeakRetained sourceManager];
    id v7 = 0;
    uint64_t v4 = [v3 localDeviceSourceWithError:&v7];
    id v5 = v7;
    unsigned __int8 v6 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    if (v5)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
        sub_22FF8();
      }
    }
  }
}

void sub_AEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AED0(uint64_t a1)
{
  if (a1 && !*(unsigned char *)(a1 + 88) && *(unsigned char *)(a1 + 56) && *(void *)(a1 + 128))
  {
    uint64_t v14 = HDActivityCacheEntityPredicateForCacheIndex();
    id v2 = HDActivityCacheEntityPredicateForCacheIndex();
    uint64_t v3 = HDActivityCacheEntityPredicateForCacheIndex();
    uint64_t v4 = HDDataEntityPredicateForSourceEntity();
    v36[0] = v14;
    v36[1] = v2;
    v36[2] = v3;
    id v5 = +[NSArray arrayWithObjects:v36 count:3];
    unsigned __int8 v6 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v5];

    id v7 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v6 otherPredicate:v4];
    uint64_t v29 = 0;
    double v30 = &v29;
    uint64_t v31 = 0x3032000000;
    double v32 = sub_B680;
    BOOL v33 = sub_B690;
    id v34 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    double v26 = sub_B680;
    double v27 = sub_B690;
    id v28 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    double v20 = sub_B680;
    double v21 = sub_B690;
    id v22 = 0;
    CFStringRef v8 = +[HKSampleType activityCacheType];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v10 = +[HDActivityCacheEntity entityEnumeratorWithType:v8 profile:WeakRetained];

    [v10 setPredicate:v7];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_B698;
    v15[3] = &unk_34998;
    v15[4] = a1;
    v15[5] = &v29;
    v15[6] = &v23;
    v15[7] = &v17;
    id v16 = 0;
    LODWORD(WeakRetained) = [v10 enumerateWithError:&v16 handler:v15];
    id v11 = v16;
    if (WeakRetained)
    {
      objc_storeStrong((id *)(a1 + 104), (id)v30[5]);
      objc_storeStrong((id *)(a1 + 96), (id)v24[5]);
      *(unsigned char *)(a1 + 88) = 1;
      if (!v18[5])
      {
LABEL_13:
        sub_B84C((id *)a1);

        _Block_object_dispose(&v17, 8);
        _Block_object_dispose(&v23, 8);

        _Block_object_dispose(&v29, 8);
        return;
      }
      uint64_t v35 = v18[5];
      char v12 = +[NSArray arrayWithObjects:&v35 count:1];
      sub_B740(a1, v12);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
        sub_23060();
      }
      *(unsigned char *)(a1 + 88) = 0;
      id v13 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;

      char v12 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = 0;
    }

    goto LABEL_13;
  }
}

void sub_B298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);

  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_B378(uint64_t a1)
{
  if (a1)
  {
    id v2 = +[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierWheelchairUse];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v4 = [WeakRetained userCharacteristicsManager];
    id v7 = 0;
    id v5 = [v4 userCharacteristicForType:v2 error:&v7];
    id v6 = v7;

    if (v5)
    {
      *(void *)(a1 + 288) = [v5 integerValue];
    }
    else if (v6)
    {
      if (objc_msgSend(v6, "hk_isDatabaseAccessibilityError"))
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
          sub_230FC();
        }
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
          sub_23170();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
        sub_230C8();
      }
    }
  }
}

void sub_B4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B504(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a1)
  {
    id v24 = v15;
    uint64_t v18 = _HKActivityCacheDateComponentsFromDate();
    uint64_t v19 = _HKActivityCacheDateComponentsFromDate();
    double v20 = _HKActivityCacheDateComponentsFromDate();
    uint64_t v21 = _HKCacheIndexFromDateComponents();
    uint64_t v22 = _HKCacheIndexFromDateComponents();
    uint64_t v23 = _HKCacheIndexFromDateComponents();
    if (a2) {
      *a2 = v21;
    }
    if (a3) {
      *a3 = v22;
    }
    if (a4) {
      *a4 = v23;
    }

    id v15 = v24;
  }
}

void sub_B630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_B678()
{
}

uint64_t sub_B680(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_B690(uint64_t a1)
{
}

uint64_t sub_B698(void *a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 cacheIndex];
  id v6 = (void *)a1[4];
  if (v5 == (id)v6[4])
  {
    uint64_t v7 = a1[5];
LABEL_7:
    objc_storeStrong((id *)(*(void *)(v7 + 8) + 40), a2);
    goto LABEL_8;
  }
  if (v5 == (id)v6[5])
  {
    uint64_t v7 = a1[6];
    goto LABEL_7;
  }
  if (v5 == (id)v6[6])
  {
    uint64_t v7 = a1[7];
    goto LABEL_7;
  }
LABEL_8:

  return 1;
}

void sub_B72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B740(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && [v3 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v6 = [WeakRetained dataManager];
    id v9 = 0;
    unsigned __int8 v7 = [v6 deleteDataObjects:v4 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:&v9];
    id v8 = v9;

    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
        sub_231D8();
      }
    }
  }
}

void sub_B818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B84C(id *a1)
{
  if (a1)
  {
    if (a1[12] && a1[10])
    {
      id v2 = objc_alloc((Class)NSDateInterval);
      id v14 = [a1[12] startDate];
      id v3 = [a1[10] endDate];
      id v4 = [v2 initWithStartDate:v14 endDate:v3];
      id v5 = a1[10];
      a1[10] = v4;
    }
    if (a1[13] && a1[9])
    {
      id v6 = objc_alloc((Class)NSDateInterval);
      id v15 = [a1[13] startDate];
      unsigned __int8 v7 = [a1[9] endDate];
      id v8 = [v6 initWithStartDate:v15 endDate:v7];
      id v9 = a1[9];
      a1[9] = v8;
    }
    if (a1[10] && a1[9])
    {
      id v10 = objc_alloc((Class)NSDateInterval);
      id v16 = [a1[10] startDate];
      id v11 = [a1[9] startDate];
      id v12 = [v10 initWithStartDate:v16 endDate:v11];
      id v13 = a1[10];
      a1[10] = v12;
    }
  }
}

void sub_B9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_BA08(uint64_t a1)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 88) = 0;
    id v2 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;

    id v3 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    *(unsigned char *)(a1 + 56) = 0;
    sub_8E30((void *)a1, *(void **)(a1 + 144));
    sub_8E30((void *)a1, *(void **)(a1 + 152));
    sub_8E30((void *)a1, *(void **)(a1 + 160));
    sub_8E30((void *)a1, *(void **)(a1 + 168));
    id v4 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = 0;

    id v5 = *(void **)(a1 + 224);
    *(void *)(a1 + 224) = 0;

    *(unsigned char *)(a1 + 232) = 0;
    *(unsigned char *)(a1 + 250) = 0;
    *(_WORD *)(a1 + 248) = 0;
    *(unsigned char *)(a1 + 200) = 0;
    id v6 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;
  }
}

void *sub_BAC0(void *a1)
{
  if (a1)
  {
    id v2 = (void *)a1[39];
    if (v2)
    {
      a1 = v2;
    }
    else
    {
      a1 = +[NSTimeZone systemTimeZone];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_BBA0(uint64_t a1)
{
  if (sub_AAC8(*(void *)(a1 + 32), *(void **)(a1 + 40)))
  {
    _HKInitializeLogging();
    id v2 = HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_E6CC, v2, OS_LOG_TYPE_DEFAULT, "Goal schedules changed, rebuilding caches", buf, 2u);
    }
    uint64_t v3 = 264;
    return [*(id *)(*(void *)(a1 + 32) + v3) execute];
  }
  if ((sub_8F44(*(void *)(a1 + 32), *(void **)(a1 + 40)) & 1) != 0
    || (sub_95FC(*(void *)(a1 + 32), *(void **)(a1 + 40)) & 1) != 0
    || (id result = (id)sub_9DD4(*(void *)(a1 + 32), *(void **)(a1 + 40)), result))
  {
    _HKInitializeLogging();
    id v5 = HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&def_E6CC, v5, OS_LOG_TYPE_DEFAULT, "Goals, paused state, or move mode changed, updating caches", v6, 2u);
    }
    uint64_t v3 = 256;
    return [*(id *)(*(void *)(a1 + 32) + v3) execute];
  }
  return result;
}

void sub_BDB4(_Unwind_Exception *exception_object)
{
}

id sub_BDCC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 264) execute];
}

void sub_BDD8(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v3 = [WeakRetained dataManager];

    [v3 addObserver:a1 forDataType:*(void *)(a1 + 144)];
    [v3 addObserver:a1 forDataType:*(void *)(a1 + 152)];
    [v3 addObserver:a1 forDataType:*(void *)(a1 + 160)];
    [v3 addObserver:a1 forDataType:*(void *)(a1 + 168)];
    [v3 addObserver:a1 forDataType:*(void *)(a1 + 208)];
    [v3 addObserver:a1 forDataType:*(void *)(a1 + 240)];
    [v3 addObserver:a1 forDataType:*(void *)(a1 + 192)];
  }
}

void sub_BEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BED4(uint64_t a1)
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 280))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)a1, (CFNotificationCallback)sub_C034, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      id v3 = +[NSNotificationCenter defaultCenter];
      [v3 addObserver:a1 selector:"_didReceiveSignificantTimeChangeNotification" name:NSCalendarDayChangedNotification object:0];

      objc_initWeak(&location, (id)a1);
      id v4 = *(NSObject **)(a1 + 16);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_C03C;
      v5[3] = &unk_34A10;
      objc_copyWeak(&v6, &location);
      notify_register_dispatch("HDActivityCacheForceRebuild", (int *)(a1 + 296), v4, v5);
      *(unsigned char *)(a1 + 280) = 1;
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

void sub_C00C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_C034(uint64_t a1, void *a2)
{
  return [a2 _didReceiveSignificantTimeChangeNotification];
}

void sub_C03C(uint64_t a1)
{
  _HKInitializeLogging();
  id v2 = HKLogActivityCache;
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&def_E6CC, v2, OS_LOG_TYPE_DEFAULT, "Forcing cache rebuild", v5, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    sub_BA08((uint64_t)WeakRetained);
    sub_6330((uint64_t)v4);
  }
}

void sub_C0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C1A4(uint64_t a1)
{
}

void sub_C1AC(uint64_t a1)
{
  if (a1)
  {
    id v2 = -[HDActivityCacheManager calendar]_0((void *)a1);
    id v3 = [v2 timeZone];
    id v4 = sub_A6DC((void *)a1);
    id v5 = _HKActivityCacheDateComponentsFromDate();
    uint64_t v6 = _HKCacheIndexFromDateComponents();
    if (v6 == *(void *)(a1 + 32))
    {
      if ([v3 isEqual:*(void *)(a1 + 64)])
      {
LABEL_10:

        return;
      }
      _HKInitializeLogging();
      unsigned __int8 v7 = HKLogActivityCache;
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 64);
        int v11 = 138543618;
        uint64_t v12 = v8;
        __int16 v13 = 2114;
        uint64_t v14 = (uint64_t)v3;
        _os_log_impl(&def_E6CC, v7, OS_LOG_TYPE_DEFAULT, "Time zone changed (%{public}@ -> %{public}@), rebuilding caches", (uint8_t *)&v11, 0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v9 = HKLogActivityCache;
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v11 = 134218240;
        uint64_t v12 = v10;
        __int16 v13 = 2048;
        uint64_t v14 = v6;
        _os_log_impl(&def_E6CC, v9, OS_LOG_TYPE_DEFAULT, "Day changed (%lld -> %lld), rebuilding caches", (uint8_t *)&v11, 0x16u);
      }
      [*(id *)(a1 + 136) reportTargetDayHeartRateAnalytics];
    }
    [*(id *)(a1 + 264) execute];
    goto LABEL_10;
  }
}

void sub_C364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C5C0(uint64_t a1)
{
}

void sub_C6C4(uint64_t a1)
{
}

void sub_C780(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = a1[4];
  if (v2 == *(void *)(v3 + 32))
  {
    uint64_t v4 = [*(id *)(v3 + 136) targetDayStatisticsBuilder];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if (v2 == *(void *)(v3 + 40))
  {
    uint64_t v4 = [*(id *)(v3 + 136) previousDayStatisticsBuilder];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:
  id v6 = v5;
  (*(void (**)(void))(a1[5] + 16))();
}

void sub_C820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C914(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 272) addObject:*(void *)(a1 + 40)];
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
    sub_23274();
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = +[NSArray arrayWithObjects:&v3 count:1];
  sub_7830(*(void *)(a1 + 32), v2);
  sub_7BC0(*(void *)(a1 + 32), v2);
  sub_7E64(*(void *)(a1 + 32), v2, *(void **)(*(void *)(a1 + 32) + 112));
  sub_7E64(*(void *)(a1 + 32), v2, *(void **)(*(void *)(a1 + 32) + 120));
}

void sub_C9FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_CAAC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 272) removeObject:*(void *)(a1 + 40)];
}

void sub_CAB8(uint64_t a1)
{
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
    sub_232A8();
  }
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * (void)v5), "activityCacheManager:changedTodayActivityCache:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v6);
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_CBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CBF4(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        long long v6 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v5);
        _HKInitializeLogging();
        long long v7 = HKLogActivityCache;
        if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEBUG)) {
          sub_232DC(&v8, v9, v7);
        }
        if (objc_opt_respondsToSelector()) {
          [v6 activityCacheManager:*(void *)(a1 + 40) changedYesterdayActivityCache:*(void *)(a1 + 48)];
        }
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void sub_CD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CD6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activityCacheIndex];
  id v3 = *(id *)(*(void *)(a1 + 40) + 32);
  _HKInitializeLogging();
  uint64_t v4 = HKLogHeartRate;
  if (os_log_type_enabled(HKLogHeartRate, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 48);
    if (v2 == v3) {
      CFStringRef v5 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v6;
    _os_log_impl(&def_E6CC, v4, OS_LOG_TYPE_DEFAULT, "heart rate summary changed, is today = %{public}@, notifying observers: %{public}@", buf, 0x16u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 48);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v11, "activityCacheManager:changedHeartRateSummary:isToday:", *(void *)(a1 + 40), *(void *)(a1 + 56), v2 == v3, (void)v12);
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

void sub_CF2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_CFC0(uint64_t a1)
{
}

void sub_D168(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_D184(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_D1B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t HDActivityCacheActiveSource::HDActivityCacheActiveSource(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(double *)a1 = a4;
  *(void *)(a1 + 8) = a2;
  if (a1 + 16 != a3) {
    sub_DB9C((char *)(a1 + 16), *(char **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
  }
  return a1;
}

void sub_D24C(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

BOOL HDActivityCacheActiveSource::operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL HDActivityCacheActiveSource::operator>(double *a1, double *a2)
{
  return *a1 > *a2;
}

BOOL HDActivityCacheActiveSource::operator<=(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL HDActivityCacheActiveSource::operator>=(double *a1, double *a2)
{
  return *a1 >= *a2;
}

void sub_D9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (a2 == 1)
  {
    id v16 = __cxa_begin_catch(a1);
    _HKInitializeLogging();
    id v17 = (void *)HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_233C8((uint64_t)v16, v17);
    }
    __cxa_rethrow();
  }
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_DA9C()
{
}

void sub_DB28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_DB9C(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  id v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *id v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      sub_DCEC();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    id result = sub_DCA8(v7, v11);
    long long v13 = (char *)v7[1];
    long long v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      CFStringRef v18 = v9;
      __int16 v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v12 = (void **)(result + 8);
  long long v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  id v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    id result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    CFStringRef v18 = v9;
    __int16 v19 = v16;
LABEL_18:
    id result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

char *sub_DCA8(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_DCEC();
  }
  id result = (char *)sub_DD04((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_DCEC()
{
}

void *sub_DD04(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_DDCC();
  }
  return operator new(8 * a2);
}

void sub_DD3C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_DD98(exception, a1);
}

void sub_DD84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_DD98(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_DDCC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

char *sub_DE00(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  id v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 6)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *id v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 58) {
      sub_DCEC();
    }
    uint64_t v10 = v8 >> 5;
    if (v8 >> 5 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    id result = sub_DF0C(v7, v11);
    long long v13 = (char *)v7[1];
    long long v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      CFStringRef v18 = v9;
      __int16 v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v12 = (void **)(result + 8);
  long long v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 6;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  id v16 = &__src[64 * v15];
  if (v14 != v9)
  {
    id result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    CFStringRef v18 = v9;
    __int16 v19 = v16;
LABEL_18:
    id result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

char *sub_DF0C(void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    sub_DCEC();
  }
  id result = (char *)sub_DF50((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *sub_DF50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    sub_DDCC();
  }
  return operator new(a2 << 6);
}

void sub_DF88(uint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = (uint64_t)(a1 + 2);
  uint64_t v9 = *a1;
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 3) < a4)
  {
    sub_E110(a1);
    if (a4 > 0x666666666666666) {
      sub_DCEC();
    }
    unint64_t v10 = 0x999999999999999ALL * ((a1[2] - *a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 3) >= 0x333333333333333) {
      unint64_t v11 = 0x666666666666666;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_E14C(a1, v11);
    uint64_t v12 = sub_E1A0(v8, a2, a3, a1[1]);
    goto LABEL_11;
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[1] - v9) >> 3) < a4)
  {
    uint64_t v13 = a2 + 8 * ((a1[1] - v9) >> 3);
    sub_E358((uint64_t)&v18, a2, v13, v9);
    uint64_t v12 = sub_E1A0(v8, v13, a3, a1[1]);
LABEL_11:
    a1[1] = v12;
    return;
  }
  sub_E358((uint64_t)&v19, a2, a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = a1[1];
  if (v16 != v14)
  {
    do
    {
      size_t v17 = *(void **)(v16 - 24);
      if (v17)
      {
        *(void *)(v16 - 16) = v17;
        operator delete(v17);
      }
      v16 -= 40;
    }
    while (v16 != v15);
  }
  a1[1] = v15;
}

void sub_E100(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_E108(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_E110(uint64_t *a1)
{
  if (*a1)
  {
    sub_E3D0(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_E14C(void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_DCEC();
  }
  id result = (char *)sub_E420((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

uint64_t sub_E1A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v6;
      *(void *)(v4 + 24) = 0;
      *(void *)(v4 + 32) = 0;
      *(void *)(v4 + 16) = 0;
      sub_E25C((void *)(v4 + 16), *(const void **)(v6 + 16), *(void *)(v6 + 24), (uint64_t)(*(void *)(v6 + 24) - *(void *)(v6 + 16)) >> 3);
      uint64_t v4 = v11 + 40;
      v11 += 40;
      v6 += 40;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_E2D8((uint64_t)v8);
  return v4;
}

void sub_E248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_E25C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    id result = sub_DCA8(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      id result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_E2BC(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_E2D8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_E310(a1);
  }
  return a1;
}

void sub_E310(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    id v3 = *(void **)(v1 - 24);
    if (v3)
    {
      *(void *)(v1 - 16) = v3;
      operator delete(v3);
    }
    v1 -= 40;
  }
}

uint64_t sub_E358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      *(_OWORD *)a4 = *(_OWORD *)v5;
      if (v5 != a4) {
        sub_DB9C((char *)(a4 + 16), *(char **)(v5 + 16), *(void *)(v5 + 24), (uint64_t)(*(void *)(v5 + 24) - *(void *)(v5 + 16)) >> 3);
      }
      v5 += 40;
      a4 += 40;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_E3D0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void *sub_E420(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_DDCC();
  }
  return operator new(40 * a2);
}

void *sub_E468(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_DDCC();
  }
  return operator new(24 * a2);
}

void sub_E4B0(uint64_t a1, __n128 *a2, uint64_t a3, uint64_t a4, char a5, __n128 a6)
{
LABEL_1:
  uint64_t v12 = (double *)a1;
LABEL_2:
  uint64_t v13 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v12;
    uint64_t v14 = v13;
    uint64_t v15 = (char *)a2 - (char *)v12;
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v12) >> 3);
    if (!(!v7 & v6))
    {
      switch(v16)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          double v28 = a2[-2].n128_f64[1];
          double v27 = &a2[-2].n128_f64[1];
          if (v28 < *v12)
          {
            uint64_t v38 = *((void *)v12 + 2);
            long long v35 = *(_OWORD *)v12;
            long long v29 = *(_OWORD *)v27;
            v12[2] = v27[2];
            *(_OWORD *)uint64_t v12 = v29;
            *(_OWORD *)double v27 = v35;
            *((void *)v27 + 2) = v38;
          }
          break;
        case 3uLL:
          sub_E9AC((long long *)v12, (long long *)(v12 + 3), (long long *)&a2[-2].n128_i8[8]);
          break;
        case 4uLL:
          sub_EE64((uint64_t)v12, (uint64_t)(v12 + 3), (uint64_t)(v12 + 6), &a2[-2].n128_u64[1]);
          break;
        case 5uLL:
          sub_EF38((__n128 *)v12, (__n128 *)(v12 + 3), (__n128 *)v12 + 3, (unint64_t *)v12 + 9, &a2[-2].n128_u64[1]);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v15 <= 575) {
      break;
    }
    if (v14 == 1)
    {
      if (v12 != (double *)a2)
      {
        sub_F048((uint64_t)v12, a2, a2, a3, a6);
      }
      return;
    }
    unint64_t v17 = v16 >> 1;
    char v18 = &v12[3 * (v16 >> 1)];
    if ((unint64_t)v15 >= 0xC01)
    {
      sub_E9AC((long long *)v12, (long long *)&v12[3 * (v16 >> 1)], (long long *)&a2[-2].n128_i8[8]);
      uint64_t v19 = 3 * v17;
      uint64_t v20 = (long long *)&v12[3 * v17 - 3];
      sub_E9AC((long long *)(v12 + 3), v20, (long long *)&a2[-3]);
      uint64_t v21 = (long long *)(v12 + 6);
      uint64_t v22 = (long long *)&v12[v19 + 3];
      sub_E9AC(v21, v22, (long long *)&a2[-5].n128_i8[8]);
      sub_E9AC(v20, (long long *)v18, v22);
      uint64_t v37 = *(void *)(a1 + 16);
      long long v34 = *(_OWORD *)a1;
      long long v23 = *(_OWORD *)v18;
      *(double *)(a1 + 16) = v18[2];
      *(_OWORD *)a1 = v23;
      *((void *)v18 + 2) = v37;
      *(_OWORD *)char v18 = v34;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_E9AC((long long *)&v12[3 * (v16 >> 1)], (long long *)v12, (long long *)&a2[-2].n128_i8[8]);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (*(double *)(a1 - 24) >= *(double *)a1)
    {
      uint64_t v12 = sub_EAB8((double *)a1, a2->n128_f64);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v24 = sub_EBA0(a1, (unint64_t)a2);
    if ((v25 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v26 = sub_EC88(a1, v24);
    uint64_t v12 = (double *)(v24 + 24);
    if (sub_EC88(v24 + 24, (uint64_t)a2))
    {
      a4 = -v14;
      a2 = (__n128 *)v24;
      if (v26) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v13 = v14 + 1;
    if (!v26)
    {
LABEL_16:
      sub_E4B0(a1, v24, a3, -v14, a5 & 1);
      uint64_t v12 = (double *)(v24 + 24);
LABEL_18:
      a5 = 0;
      a4 = -v14;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_E90C((uint64_t)v12, (uint64_t)a2);
  }
  else if (v12 != (double *)a2)
  {
    double v30 = v12 + 3;
    while (v30 != (double *)a2)
    {
      uint64_t v31 = (uint64_t)v30;
      double v32 = *(double *)(a1 + 24);
      if (v32 < *(double *)a1)
      {
        long long v36 = *(_OWORD *)(a1 + 32);
        do
        {
          *(_OWORD *)double v30 = *(_OWORD *)(v30 - 3);
          v30[2] = *(v30 - 1);
          double v33 = *(v30 - 6);
          v30 -= 3;
        }
        while (v32 < v33);
        double *v30 = v32;
        *(_OWORD *)(v30 + 1) = v36;
      }
      double v30 = (double *)(v31 + 24);
      a1 = v31;
    }
  }
}

  uint64_t v11 = (long long *)a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = (uint64_t)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    uint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          if (*((double *)a2 - 1) < *((double *)v11 + 2))
          {
            long long v35 = *((void *)v11 + 2);
            double v32 = *v11;
            BOOL v26 = *(long long *)((char *)a2 - 24);
            *((void *)v11 + 2) = *((void *)a2 - 1);
            void *v11 = v26;
            *(long long *)((char *)a2 - 24) = v32;
            *((void *)a2 - 1) = v35;
          }
          break;
        case 3uLL:
          sub_1F510(v11, (double *)v11 + 3, (double *)a2 - 3);
          break;
        case 4uLL:
          sub_1FAB0((uint64_t)v11, (uint64_t)v11 + 24, (uint64_t)(v11 + 3), (uint64_t)a2 - 24);
          break;
        case 5uLL:
          sub_1FB84((__n128 *)v11, (__n128 *)((char *)v11 + 24), (__n128 *)v11 + 3, (__n128 *)((char *)v11 + 72), (__n128 *)((char *)a2 - 24));
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 575) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        sub_1FC94((uint64_t)v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    unint64_t v17 = (double *)v11 + 3 * (v15 >> 1);
    if ((unint64_t)v14 >= 0xC01)
    {
      sub_1F510(v11, (double *)v11 + 3 * (v15 >> 1), (double *)a2 - 3);
      char v18 = 3 * v16;
      uint64_t v19 = (double *)v11 + 3 * v16 - 3;
      sub_1F510((long long *)((char *)v11 + 24), v19, (double *)a2 - 6);
      uint64_t v20 = v11 + 3;
      uint64_t v21 = (double *)v11 + v18 + 3;
      sub_1F510(v20, v21, (double *)a2 - 9);
      sub_1F510((long long *)v19, v17, v21);
      long long v34 = *(void *)(a1 + 16);
      uint64_t v31 = *(_OWORD *)a1;
      uint64_t v22 = *(_OWORD *)v17;
      *(double *)(a1 + 16) = v17[2];
      *(_OWORD *)a1 = v22;
      *((void *)v17 + 2) = v34;
      *(_OWORD *)unint64_t v17 = v31;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_1F510((long long *)((char *)v11 + 24 * (v15 >> 1)), (double *)v11, (double *)a2 - 3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (*(double *)(a1 - 8) >= *(double *)(a1 + 16))
    {
      uint64_t v11 = sub_1F61C((long long *)a1, (double *)a2);
      goto LABEL_18;
    }
LABEL_13:
    long long v23 = sub_1F764((double *)a1, (unint64_t)a2);
    if ((v24 & 1) == 0) {
      goto LABEL_16;
    }
    char v25 = sub_1F8A8(a1, (uint64_t)v23);
    uint64_t v11 = (long long *)(v23 + 3);
    if (sub_1F8A8((uint64_t)(v23 + 3), (uint64_t)a2))
    {
      a4 = -v13;
      a2 = (long long *)v23;
      if (v25) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v25)
    {
LABEL_16:
      sub_1EF40(a1, v23, a3, -v13, a5 & 1);
      uint64_t v11 = (long long *)(v23 + 3);
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_1F438((uint64_t)v11, a2);
  }
  else if (v11 != a2)
  {
    while ((long long *)(a1 + 24) != a2)
    {
      double v28 = *(double *)(a1 + 40);
      long long v29 = *(double *)(a1 + 16);
      double v27 = a1 + 24;
      a1 += 24;
      if (v28 < v29)
      {
        double v33 = *(_OWORD *)v27;
        do
        {
          *(_OWORD *)double v27 = *(_OWORD *)(v27 - 24);
          *(void *)(v27 + 16) = *(void *)(v27 - 8);
          double v30 = *(double *)(v27 - 32);
          v27 -= 24;
        }
        while (v28 < v30);
        *(_OWORD *)double v27 = v33;
        *(double *)(v27 + 16) = v28;
      }
    }
  }
}

uint64_t sub_E90C(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 24;
    if (result + 24 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        uint64_t v5 = v2;
        double v6 = *(double *)(v4 + 24);
        if (v6 < *(double *)v4)
        {
          long long v10 = *(_OWORD *)(v4 + 32);
          uint64_t v7 = v3;
          while (1)
          {
            uint64_t v8 = result + v7;
            *(_OWORD *)(v8 + 24) = *(_OWORD *)(result + v7);
            *(void *)(v8 + 40) = *(void *)(result + v7 + 16);
            if (!v7) {
              break;
            }
            v7 -= 24;
            if (v6 >= *(double *)(v8 - 24))
            {
              uint64_t v9 = result + v7 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v9 = result;
LABEL_10:
          *(double *)uint64_t v9 = v6;
          *(_OWORD *)(v9 + 8) = v10;
        }
        uint64_t v2 = v5 + 24;
        v3 += 24;
        uint64_t v4 = v5;
      }
      while (v5 + 24 != a2);
    }
  }
  return result;
}

uint64_t sub_E9AC(long long *a1, long long *a2, long long *a3)
{
  double v3 = *(double *)a2;
  double v4 = *(double *)a3;
  if (*(double *)a2 < *(double *)a1)
  {
    if (v4 < v3)
    {
      uint64_t v5 = *((void *)a1 + 2);
      long long v6 = *a1;
      uint64_t v7 = *((void *)a3 + 2);
      *a1 = *a3;
      *((void *)a1 + 2) = v7;
      *a3 = v6;
      *((void *)a3 + 2) = v5;
      return 1;
    }
    uint64_t v14 = *((void *)a1 + 2);
    long long v15 = *a1;
    uint64_t v16 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v16;
    *a2 = v15;
    *((void *)a2 + 2) = v14;
    if (*(double *)a3 >= *(double *)a2) {
      return 1;
    }
    uint64_t v17 = *((void *)a2 + 2);
    long long v18 = *a2;
    uint64_t v19 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v19;
    *a3 = v18;
    *((void *)a3 + 2) = v17;
    return 2;
  }
  if (v4 < v3)
  {
    uint64_t v8 = *((void *)a2 + 2);
    long long v9 = *a2;
    uint64_t v10 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v10;
    *a3 = v9;
    *((void *)a3 + 2) = v8;
    if (*(double *)a2 >= *(double *)a1) {
      return 1;
    }
    uint64_t v11 = *((void *)a1 + 2);
    long long v12 = *a1;
    uint64_t v13 = *((void *)a2 + 2);
    *a1 = *a2;
    *((void *)a1 + 2) = v13;
    *a2 = v12;
    *((void *)a2 + 2) = v11;
    return 2;
  }
  return 0;
}

double *sub_EAB8(double *a1, double *a2)
{
  double v2 = *a1;
  if (*a1 >= *(a2 - 3))
  {
    uint64_t v5 = (long long *)(a1 + 3);
    do
    {
      double v3 = (double *)v5;
      if (v5 >= (long long *)a2) {
        break;
      }
      uint64_t v5 = (long long *)((char *)v5 + 24);
    }
    while (v2 >= *v3);
  }
  else
  {
    double v3 = a1;
    do
    {
      double v4 = v3[3];
      v3 += 3;
    }
    while (v2 >= v4);
  }
  if (v3 < a2)
  {
    do
    {
      double v6 = *(a2 - 3);
      a2 -= 3;
    }
    while (v2 < v6);
  }
  while (v3 < a2)
  {
    uint64_t v14 = *((void *)v3 + 2);
    long long v13 = *(_OWORD *)v3;
    long long v7 = *(_OWORD *)a2;
    v3[2] = a2[2];
    *(_OWORD *)double v3 = v7;
    *((void *)a2 + 2) = v14;
    *(_OWORD *)a2 = v13;
    do
    {
      double v8 = v3[3];
      v3 += 3;
    }
    while (v2 >= v8);
    do
    {
      double v9 = *(a2 - 3);
      a2 -= 3;
    }
    while (v2 < v9);
  }
  if (v3 - 3 != a1)
  {
    long long v10 = *(_OWORD *)(v3 - 3);
    a1[2] = *(v3 - 1);
    *(_OWORD *)a1 = v10;
  }
  *(v3 - 3) = v2;
  *((_OWORD *)v3 - 1) = v12;
  return v3;
}

uint64_t sub_EBA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = 0;
  double v3 = *(double *)a1;
  do
  {
    double v4 = *(double *)(a1 + v2 + 24);
    v2 += 24;
  }
  while (v4 < v3);
  unint64_t v5 = a1 + v2;
  if (v2 == 24)
  {
    do
    {
      if (v5 >= a2) {
        break;
      }
      double v7 = *(double *)(a2 - 24);
      a2 -= 24;
    }
    while (v7 >= v3);
  }
  else
  {
    do
    {
      double v6 = *(double *)(a2 - 24);
      a2 -= 24;
    }
    while (v6 >= v3);
  }
  double v8 = (long long *)(a1 + v2);
  if (v5 < a2)
  {
    unint64_t v9 = a2;
    do
    {
      long long v10 = *v8;
      uint64_t v11 = *((void *)v8 + 2);
      uint64_t v12 = *(void *)(v9 + 16);
      *double v8 = *(_OWORD *)v9;
      *((void *)v8 + 2) = v12;
      *(void *)(v9 + 16) = v11;
      *(_OWORD *)unint64_t v9 = v10;
      do
      {
        double v13 = *((double *)v8 + 3);
        double v8 = (long long *)((char *)v8 + 24);
      }
      while (v13 < v3);
      do
      {
        double v14 = *(double *)(v9 - 24);
        v9 -= 24;
      }
      while (v14 >= v3);
    }
    while ((unint64_t)v8 < v9);
  }
  if ((long long *)((char *)v8 - 24) != (long long *)a1)
  {
    long long v15 = *(long long *)((char *)v8 - 24);
    *(void *)(a1 + 16) = *((void *)v8 - 1);
    *(_OWORD *)a1 = v15;
  }
  *((double *)v8 - 3) = v3;
  *(v8 - 1) = v17;
  return (uint64_t)v8 - 24;
}

BOOL sub_EC88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      double v6 = (long long *)(a2 - 24);
      if (*(double *)(a2 - 24) < *(double *)a1)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(void *)(a1 + 16) = v9;
        *double v6 = v8;
        *(void *)(a2 - 8) = v7;
      }
      return result;
    case 3uLL:
      sub_E9AC((long long *)a1, (long long *)(a1 + 24), (long long *)(a2 - 24));
      return 1;
    case 4uLL:
      sub_EE64(a1, a1 + 24, a1 + 48, (unint64_t *)(a2 - 24));
      return 1;
    case 5uLL:
      sub_EF38((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (unint64_t *)(a1 + 72), (unint64_t *)(a2 - 24));
      return 1;
    default:
      long long v10 = (double *)(a1 + 48);
      sub_E9AC((long long *)a1, (long long *)(a1 + 24), (long long *)(a1 + 48));
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    double v14 = *(double *)v11;
    if (*(double *)v11 < *v10)
    {
      long long v18 = *(_OWORD *)(v11 + 8);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)(a1 + v15 + 48);
        *(void *)(v16 + 88) = *(void *)(a1 + v15 + 64);
        if (v15 == -48) {
          break;
        }
        v15 -= 24;
        if (v14 >= *(double *)(v16 + 24))
        {
          uint64_t v17 = a1 + v15 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v17 = a1;
LABEL_12:
      *(double *)uint64_t v17 = v14;
      *(_OWORD *)(v17 + 8) = v18;
      if (++v13 == 8) {
        return v11 + 24 == a2;
      }
    }
    long long v10 = (double *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 sub_EE64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  sub_E9AC((long long *)a1, (long long *)a2, (long long *)a3);
  result.n128_u64[0] = *a4;
  if (*(double *)a4 < *(double *)a3)
  {
    unint64_t v9 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    unint64_t v10 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    a4[2] = v9;
    result.n128_u64[0] = *(void *)a3;
    if (*(double *)a3 < *(double *)a2)
    {
      uint64_t v11 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v11;
      result.n128_u64[0] = *(void *)a2;
      if (*(double *)a2 < *(double *)a1)
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v13;
      }
    }
  }
  return result;
}

__n128 sub_EF38(__n128 *a1, __n128 *a2, __n128 *a3, unint64_t *a4, unint64_t *a5)
{
  sub_EE64((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4);
  result.n128_u64[0] = *a5;
  if (*(double *)a5 < *(double *)a4)
  {
    unint64_t v11 = a4[2];
    __n128 result = *(__n128 *)a4;
    unint64_t v12 = a5[2];
    *(_OWORD *)a4 = *(_OWORD *)a5;
    a4[2] = v12;
    *(__n128 *)a5 = result;
    a5[2] = v11;
    result.n128_u64[0] = *a4;
    if (*(double *)a4 < a3->n128_f64[0])
    {
      unint64_t v13 = a3[1].n128_u64[0];
      __n128 result = *a3;
      unint64_t v14 = a4[2];
      *a3 = *(__n128 *)a4;
      a3[1].n128_u64[0] = v14;
      *(__n128 *)a4 = result;
      a4[2] = v13;
      result.n128_u64[0] = a3->n128_u64[0];
      if (a3->n128_f64[0] < a2->n128_f64[0])
      {
        unint64_t v15 = a2[1].n128_u64[0];
        __n128 result = *a2;
        unint64_t v16 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v16;
        *a3 = result;
        a3[1].n128_u64[0] = v15;
        result.n128_u64[0] = a2->n128_u64[0];
        if (a2->n128_f64[0] < a1->n128_f64[0])
        {
          unint64_t v17 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v18 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v18;
          *a2 = result;
          a2[1].n128_u64[0] = v17;
        }
      }
    }
  }
  return result;
}

__n128 *sub_F048(uint64_t a1, __n128 *a2, __n128 *a3, uint64_t a4, __n128 a5)
{
  if ((__n128 *)a1 != a2)
  {
    uint64_t v7 = a2;
    uint64_t v9 = (uint64_t)a2 - a1;
    uint64_t v10 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v11 = (unint64_t)(v10 - 2) >> 1;
      unint64_t v12 = v11 + 1;
      unint64_t v13 = (long long *)(a1 + 24 * v11);
      do
      {
        a5 = sub_F264(a1, a5, a4, v10, v13);
        unint64_t v13 = (long long *)((char *)v13 - 24);
        --v12;
      }
      while (v12);
    }
    unint64_t v14 = v7;
    if (v7 != a3)
    {
      unint64_t v15 = v7;
      do
      {
        if (v15->n128_f64[0] < *(double *)a1)
        {
          unint64_t v16 = v15[1].n128_u64[0];
          __n128 v17 = *v15;
          unint64_t v18 = *(void *)(a1 + 16);
          __n128 *v15 = *(__n128 *)a1;
          v15[1].n128_u64[0] = v18;
          *(__n128 *)a1 = v17;
          *(void *)(a1 + 16) = v16;
          sub_F264(a1, v17, a4, v10, (long long *)a1);
        }
        unint64_t v15 = (__n128 *)((char *)v15 + 24);
      }
      while (v15 != a3);
      unint64_t v14 = a3;
    }
    if (v9 >= 25)
    {
      int64_t v19 = v9 / 0x18uLL;
      do
      {
        uint64_t v20 = 0;
        __n128 v29 = *(__n128 *)a1;
        unint64_t v30 = *(void *)(a1 + 16);
        uint64_t v21 = a1;
        do
        {
          uint64_t v22 = v21;
          v21 += 24 * v20 + 24;
          uint64_t v23 = 2 * v20;
          uint64_t v20 = (2 * v20) | 1;
          int64_t v24 = v23 + 2;
          if (v24 < v19 && *(double *)v21 < *(double *)(v21 + 24))
          {
            v21 += 24;
            uint64_t v20 = v24;
          }
          long long v25 = *(_OWORD *)v21;
          *(void *)(v22 + 16) = *(void *)(v21 + 16);
          *(_OWORD *)uint64_t v22 = v25;
        }
        while (v20 <= (uint64_t)((unint64_t)(v19 - 2) >> 1));
        uint64_t v7 = (__n128 *)((char *)v7 - 24);
        if ((__n128 *)v21 == v7)
        {
          *(void *)(v21 + 16) = v30;
          *(__n128 *)uint64_t v21 = v29;
        }
        else
        {
          __n128 v26 = *v7;
          *(void *)(v21 + 16) = v7[1].n128_u64[0];
          *(__n128 *)uint64_t v21 = v26;
          *uint64_t v7 = v29;
          v7[1].n128_u64[0] = v30;
          sub_F364(a1, v21 + 24, v29, a4, 0xAAAAAAAAAAAAAAABLL * ((v21 + 24 - a1) >> 3));
        }
      }
      while (v19-- > 2);
    }
    return v14;
  }
  return a3;
}

__n128 sub_F264(uint64_t a1, __n128 result, uint64_t a3, uint64_t a4, long long *a5)
{
  if (a4 >= 2)
  {
    int64_t v5 = (unint64_t)(a4 - 2) >> 1;
    if (v5 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a5 - a1) >> 3)))
    {
      uint64_t v6 = (0x5555555555555556 * (((uint64_t)a5 - a1) >> 3)) | 1;
      uint64_t v7 = (long long *)(a1 + 24 * v6);
      if (0x5555555555555556 * (((uint64_t)a5 - a1) >> 3) + 2 < a4 && *(double *)v7 < *((double *)v7 + 3))
      {
        uint64_t v7 = (long long *)((char *)v7 + 24);
        uint64_t v6 = 0x5555555555555556 * (((uint64_t)a5 - a1) >> 3) + 2;
      }
      result.n128_u64[0] = *(void *)a5;
      if (*(double *)v7 >= *(double *)a5)
      {
        __n128 v12 = *(__n128 *)((char *)a5 + 8);
        do
        {
          long long v8 = a5;
          a5 = v7;
          long long v9 = *v7;
          *((void *)v8 + 2) = *((void *)v7 + 2);
          *long long v8 = v9;
          if (v5 < v6) {
            break;
          }
          uint64_t v10 = 2 * v6;
          uint64_t v6 = (2 * v6) | 1;
          uint64_t v7 = (long long *)(a1 + 24 * v6);
          uint64_t v11 = v10 + 2;
          if (v11 < a4 && *(double *)v7 < *((double *)v7 + 3))
          {
            uint64_t v7 = (long long *)((char *)v7 + 24);
            uint64_t v6 = v11;
          }
        }
        while (*(double *)v7 >= result.n128_f64[0]);
        *(void *)a5 = result.n128_u64[0];
        __n128 result = v12;
        *(long long *)((char *)a5 + 8) = (__int128)v12;
      }
    }
  }
  return result;
}

__n128 sub_F364(uint64_t a1, uint64_t a2, __n128 result, uint64_t a4, uint64_t a5)
{
  if (a5 >= 2)
  {
    unint64_t v5 = (unint64_t)(a5 - 2) >> 1;
    uint64_t v6 = (long long *)(a1 + 24 * v5);
    uint64_t v7 = (long long *)(a2 - 24);
    result.n128_u64[0] = *(void *)(a2 - 24);
    if (*(double *)v6 < result.n128_f64[0])
    {
      __n128 v10 = *(__n128 *)(a2 - 16);
      do
      {
        long long v8 = v7;
        uint64_t v7 = v6;
        long long v9 = *v6;
        *((void *)v8 + 2) = *((void *)v6 + 2);
        *long long v8 = v9;
        if (!v5) {
          break;
        }
        unint64_t v5 = (v5 - 1) >> 1;
        uint64_t v6 = (long long *)(a1 + 24 * v5);
      }
      while (*(double *)v6 < result.n128_f64[0]);
      *(void *)uint64_t v7 = result.n128_u64[0];
      __n128 result = v10;
      *(long long *)((char *)v7 + 8) = (__int128)v10;
    }
  }
  return result;
}

uint64_t sub_F3E4(uint64_t *a1, double *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x666666666666666) {
    sub_DCEC();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v5) >> 3);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x333333333333333) {
    unint64_t v13 = 0x666666666666666;
  }
  else {
    unint64_t v13 = v7;
  }
  uint64_t v21 = a1 + 2;
  if (v13) {
    unint64_t v14 = (char *)sub_E420(v11, v13);
  }
  else {
    unint64_t v14 = 0;
  }
  __n128 v17 = v14;
  unint64_t v18 = &v14[40 * v6];
  uint64_t v20 = &v14[40 * v13];
  sub_F504((uint64_t)v18, a2, a3, a4);
  int64_t v19 = v18 + 40;
  sub_F59C(a1, &v17);
  uint64_t v15 = a1[1];
  sub_F748((uint64_t)&v17);
  return v15;
}

void sub_F4F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_F748((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_F504(uint64_t a1, double *a2, uint64_t *a3, uint64_t a4)
{
  double v5 = *a2;
  uint64_t v6 = *a3;
  long long v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  sub_E25C(&__p, *(const void **)a4, *(void *)(a4 + 8), (uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3);
  HDActivityCacheActiveSource::HDActivityCacheActiveSource(a1, v6, (uint64_t)&__p, v5);
  if (__p)
  {
    long long v9 = __p;
    operator delete(__p);
  }
  return a1;
}

void sub_F580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_F59C(uint64_t *a1, void *a2)
{
  uint64_t result = sub_F614((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_F614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v13 = a6;
  *((void *)&v13 + 1) = a7;
  long long v12 = v13;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  if (a3 == a5)
  {
    uint64_t v8 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - 8) = *(void *)(a3 - 8);
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      uint64_t v7 = *((void *)&v13 + 1) - 40;
      *((void *)&v13 + 1) -= 40;
      a3 -= 40;
    }
    while (a3 != a5);
    uint64_t v8 = v13;
  }
  char v11 = 1;
  sub_F6C8((uint64_t)v10);
  return v8;
}

uint64_t sub_F6C8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_F700(a1);
  }
  return a1;
}

void sub_F700(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    double v3 = *(void **)(v1 + 16);
    if (v3)
    {
      *(void *)(v1 + 24) = v3;
      operator delete(v3);
    }
    v1 += 40;
  }
}

uint64_t sub_F748(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_F780(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 40;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 40;
    }
  }
}

uint64_t sub_F7DC(uint64_t *a1, double *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *a1;
  unint64_t v6 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0x666666666666666) {
    sub_DCEC();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v5) >> 3);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x333333333333333) {
    unint64_t v13 = 0x666666666666666;
  }
  else {
    unint64_t v13 = v7;
  }
  uint64_t v21 = a1 + 2;
  if (v13) {
    unint64_t v14 = (char *)sub_E420(v11, v13);
  }
  else {
    unint64_t v14 = 0;
  }
  __n128 v17 = v14;
  unint64_t v18 = &v14[40 * v6];
  uint64_t v20 = &v14[40 * v13];
  sub_F8FC((uint64_t)v18, a2, a3, a4);
  int64_t v19 = v18 + 40;
  sub_F59C(a1, &v17);
  uint64_t v15 = a1[1];
  sub_F748((uint64_t)&v17);
  return v15;
}

void sub_F8E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_F748((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_F8FC(uint64_t a1, double *a2, uint64_t *a3, uint64_t a4)
{
  double v5 = *a2;
  uint64_t v6 = *a3;
  long long v9 = 0;
  uint64_t v10 = 0;
  __p = 0;
  sub_E25C(&__p, *(const void **)a4, *(void *)(a4 + 8), (uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3);
  HDActivityCacheActiveSource::HDActivityCacheActiveSource(a1, v6, (uint64_t)&__p, v5);
  if (__p)
  {
    long long v9 = __p;
    operator delete(__p);
  }
  return a1;
}

void sub_F978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_F994(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_E3D0((uint64_t *)v2);
    double v3 = **a1;
    operator delete(v3);
  }
}

uint64_t sub_F9E8()
{
  return v0;
}

void sub_F9FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_FB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FBAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FC28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FD74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_FF74(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = [v7 createMoveStatisticsWithIntervalComponents:*(void *)(*(void *)(a1 + 40) + 8) calendar:*(void *)(*(void *)(a1 + 40) + 16)];
  [*(id *)(a1 + 32) setActiveEnergyResults:v3];

  uint64_t v4 = [v7 createMoveMinuteStatisticsWithIntervalComponents:*(void *)(*(void *)(a1 + 40) + 8) calendar:*(void *)(*(void *)(a1 + 40) + 16)];
  [*(id *)(a1 + 32) setAppleMoveTimeResults:v4];

  double v5 = [v7 createExerciseStatisticsWithIntervalComponents:*(void *)(*(void *)(a1 + 40) + 8) calendar:*(void *)(*(void *)(a1 + 40) + 16)];
  [*(id *)(a1 + 32) setAppleExerciseTimeResults:v5];

  uint64_t v6 = [v7 createStandStatisticsWithCalendar:*(void *)(*(void *)(a1 + 40) + 16)];
  [*(id *)(a1 + 32) setAppleStandHourResults:v6];
}

void sub_10078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10420(uint64_t a1, uint64_t a2, void *a3)
{
  id v27 = a3;
  if (a1)
  {
    double v5 = +[HDActivityDemoDataStore demoStatisticsDataForTypeIdentifier:a2];
    id v26 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v6 = +[NSCalendar currentCalendar];
    id v7 = +[NSDate date];
    long long v25 = v6;
    uint64_t v8 = [v6 startOfDayForDate:v7];

    id v9 = v8;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v5;
    id v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    uint64_t v11 = v9;
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v29;
      uint64_t v14 = 1;
      uint64_t v11 = v9;
      do
      {
        uint64_t v15 = 0;
        uint64_t v23 = v14;
        uint64_t v16 = 30 * v14;
        __n128 v17 = v11;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(obj);
          }
          unint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v15);
          uint64_t v11 = [v25 dateByAddingUnit:64 value:v16 toDate:v9 options:0];
          id v19 = [objc_alloc((Class)_HKActivityStatisticsQuantityInfo) initWithStartDate:v17 endDate:v11];
          [v18 doubleValue];
          uint64_t v20 = +[HKQuantity quantityWithUnit:doubleValue:](HKQuantity, "quantityWithUnit:doubleValue:", v27);
          [v19 setQuantityValue:v20];
          [v26 addObject:v19];

          uint64_t v15 = (char *)v15 + 1;
          v16 += 30;
          __n128 v17 = v11;
        }
        while (v12 != v15);
        id v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v14 = (uint64_t)v15 + v23;
      }
      while (v12);
    }

    id v21 = [v26 copy];
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

id sub_1069C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = +[HDActivityDemoDataStore demoStatisticsDataForTypeIdentifier:HKCategoryTypeIdentifierAppleStandHour];
    id v2 = objc_alloc_init((Class)NSMutableArray);
    double v3 = +[NSCalendar currentCalendar];
    uint64_t v4 = +[NSDate date];
    double v5 = [v3 startOfDayForDate:v4];

    id v6 = v5;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v1;
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    id v9 = v6;
    if (!v8) {
      goto LABEL_14;
    }
    id v10 = v8;
    uint64_t v11 = *(void *)v21;
    uint64_t v12 = 1;
    id v9 = v6;
    while (1)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v9;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        unsigned int v15 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v13), "intValue", (void)v20);
        [v14 timeIntervalSinceReferenceDate];
        if (v15 == 1)
        {
          uint64_t v17 = 0;
        }
        else
        {
          if (v15 != 2) {
            goto LABEL_12;
          }
          uint64_t v17 = 1;
        }
        id v18 = [objc_alloc((Class)_HKActivityStatisticsStandHourInfo) initWithTimeStamp:v17 state:v16];
        [v2 addObject:v18];

LABEL_12:
        id v9 = [v3 dateByAddingUnit:32 value:(char *)v13 + v12 toDate:v6 options:0];

        uint64_t v13 = (char *)v13 + 1;
        uint64_t v14 = v9;
      }
      while (v10 != v13);
      id v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v12 += (uint64_t)v13;
      if (!v10)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
  }
  id v2 = 0;
LABEL_15:

  return v2;
}

void sub_10BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10F9C(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    if (!*(void *)(result + 360) || *(unsigned char *)(result + 32)) {
      return 1;
    }
    uint64_t v4 = sub_11A3C(result);
    double v5 = [v4 startDate];
    id v6 = HDSampleEntityPredicateForStartDate();

    uint64_t v7 = *(void *)(v2 + 96);
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 320));
    id v31 = 0;
    id v9 = +[HDSampleEntity mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:v6 anchor:0 error:&v31];
    id v10 = v31;

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_12974;
    v30[3] = &unk_34B20;
    v30[4] = v2;
    uint64_t v11 = objc_retainBlock(v30);
    uint64_t v12 = (void (**)(void, void, void))v11;
    if (v10)
    {
      ((void (*)(void *, id, const __CFString *))v11[2])(v11, v10, @"Activation Sample error");
      id v13 = v10;
    }
    else
    {
      if (v9)
      {
        id v15 = objc_loadWeakRetained((id *)(v2 + 320));
        id v29 = 0;
        id v27 = +[HDSampleEntity dataEntityForObject:v9 profile:v15 error:&v29];
        id v16 = v29;

        if (!v27)
        {
          ((void (**)(void, id, const __CFString *))v12)[2](v12, v16, @"Sample Entity lookup failure");
          id v25 = v16;
          id v13 = v25;
          if (v25)
          {
            if (a2) {
              *a2 = v25;
            }
            else {
              _HKLogDroppedError();
            }
          }

          BOOL v32 = v13 == 0;
          goto LABEL_19;
        }
        uint64_t v17 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v27 persistentID]);
        id v18 = objc_loadWeakRetained((id *)(v2 + 320));
        id v28 = v16;
        id v19 = +[HDSampleEntity sourceIDForObjectID:v17 type:1 profile:v18 errorOut:&v28];
        id v20 = v28;

        if (!v19)
        {
          ((void (**)(void, id, const __CFString *))v12)[2](v12, v20, @"Source ID lookup failure");
          id v26 = v20;
          id v13 = v26;
          if (v26)
          {
            if (a2) {
              *a2 = v26;
            }
            else {
              _HKLogDroppedError();
            }
          }

          BOOL v32 = v13 == 0;
          goto LABEL_19;
        }
        [v9 _startTimestamp];
        double v22 = v21;
        [v9 _endTimestamp];
        HDActivityCacheStatisticsBuilderSample::HDActivityCacheStatisticsBuilderSample(&buf, v22, v23, 0.0, (int64_t)[v19 longLongValue]);
        HDActivityCacheStatisticsBuilderSample __src = buf;
        sub_160E0((char *)(v2 + 8), (char *)&__src, (uint64_t)&buf, 1uLL);
      }
      else
      {
        id v20 = 0;
        sub_160E0((char *)(v2 + 8), 0, 0, 0);
      }
      _HKInitializeLogging();
      int64_t v24 = HKLogActivityCache;
      char v14 = 1;
      if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.var0) = 138412290;
        *(void *)((char *)&buf.var0 + 4) = v9;
        _os_log_impl(&def_E6CC, v24, OS_LOG_TYPE_INFO, "Successfully primed previous activation log entry %@", (uint8_t *)&buf, 0xCu);
      }
      *(unsigned char *)(v2 + 32) = 1;
      id v13 = v20;
      if (!v13)
      {
LABEL_18:

        BOOL v32 = v14;
LABEL_19:

        return v32;
      }
    }
    if (a2)
    {
      id v13 = v13;
      char v14 = 0;
      *a2 = v13;
    }
    else
    {
      _HKLogDroppedError();
      char v14 = 0;
    }
    goto LABEL_18;
  }
  return result;
}

void sub_113E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

BOOL sub_114A8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = +[NRPairedDeviceRegistry sharedInstance];
    double v3 = [v2 getActivePairedDevice];

    uint64_t v4 = [v3 valueForProperty:NRDevicePropertyPairedDate];
    double v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = +[NSDate distantPast];
    }
    uint64_t v7 = *(void **)(a1 + 408);
    *(void *)(a1 + 408) = v6;
  }
  return a1 != 0;
}

void sub_1154C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1156C(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 360) || !*(unsigned char *)(a1 + 32)) {
    return 1;
  }
  if (!*(void *)(a1 + 328))
  {
    sub_11B04((void *)a1);
    uint64_t v4 = [[HDActivityCacheStatisticsBuilder alloc] initWithDateInterval:*(void *)(a1 + 360) loggingName:*(void *)(a1 + 392)];
    double v5 = *(void **)(a1 + 328);
    *(void *)(a1 + 328) = v4;

    id v6 = [[HDActivityCacheHeartRateStatisticsBuilder alloc] initWithDateInterval:*(void *)(a1 + 360) activityCacheIndex:*(void *)(a1 + 376)];
    uint64_t v7 = *(void **)(a1 + 344);
    *(void *)(a1 + 344) = v6;

    if (*(void *)(a1 + 368))
    {
      id v8 = [[HDActivityCacheStatisticsBuilder alloc] initWithDateInterval:*(void *)(a1 + 368) loggingName:*(void *)(a1 + 400)];
      id v9 = *(void **)(a1 + 336);
      *(void *)(a1 + 336) = v8;

      id v10 = [[HDActivityCacheHeartRateStatisticsBuilder alloc] initWithDateInterval:*(void *)(a1 + 368) activityCacheIndex:*(void *)(a1 + 384)];
      uint64_t v11 = *(void **)(a1 + 352);
      *(void *)(a1 + 352) = v10;
    }
    else
    {
      uint64_t v11 = *(void **)(a1 + 336);
      *(void *)(a1 + 336) = 0;
    }

    [*(id *)(a1 + 328) setSourceDelegate:a1];
    [*(id *)(a1 + 336) setSourceDelegate:a1];
    if (*(void *)(a1 + 16) != *(void *)(a1 + 8))
    {
      [*(id *)(a1 + 328) addActivationLogSamples:a1 + 8];
      [*(id *)(a1 + 336) addActivationLogSamples:a1 + 8];
    }
  }
  id v13 = +[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 320));
  id v15 = [WeakRetained userCharacteristicsManager];
  id v32 = 0;
  id v16 = [v15 userCharacteristicForType:v13 error:&v32];
  id v17 = v32;

  if (v16)
  {
    [*(id *)(a1 + 344) setDateOfBirthComponents:v16];
    [*(id *)(a1 + 352) setDateOfBirthComponents:v16];
  }
  else if (v17)
  {
    _HKInitializeLogging();
    id v18 = HKLogActivityCache;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      *(_DWORD *)HDActivityCacheStatisticsBuilderSample buf = 138543874;
      long long v34 = v19;
      __int16 v35 = 2082;
      long long v36 = "-[HDActivityCacheDataSource _updateStatisticsBuildersWithError:]";
      __int16 v37 = 2114;
      id v38 = v17;
      id v20 = v19;
      _os_log_impl(&def_E6CC, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@.%{public}s] Error fetching date of birth components: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 344) setDateOfBirthComponents:0];
    [*(id *)(a1 + 352) setDateOfBirthComponents:0];
  }
  long long v30 = 0;
  id v31 = 0;
  id v29 = 0;
  id v12 = sub_11B60(a1, (uint64_t)&v29, &v30);
  id v21 = v29;
  double v22 = v21;
  if (v12)
  {
    id v28 = v21;
    id v12 = sub_12438((id *)a1, (uint64_t)&v28, &v31);
    id v23 = v28;

    double v22 = v23;
  }
  _HKInitializeLogging();
  int64_t v24 = HKLogActivityCache;
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)HDActivityCacheStatisticsBuilderSample buf = 134218240;
    long long v34 = v31;
    __int16 v35 = 2048;
    long long v36 = v30;
    _os_log_impl(&def_E6CC, v24, OS_LOG_TYPE_INFO, "Updated statistics builders with %ld quantity samples and %ld non-quantity samples", buf, 0x16u);
  }
  if ((v12 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
      sub_23514();
    }
    sub_11B04((void *)a1);
  }
  id v25 = v22;
  id v26 = v25;
  if (v25)
  {
    if (a2) {
      *a2 = v25;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return (uint64_t)v12;
}

void sub_11958(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23474();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

id sub_11A3C(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 368) startDate];
    double v3 = v2;
    if (v2)
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [*(id *)(a1 + 360) startDate];
    }
    double v5 = v4;

    id v6 = [*(id *)(a1 + 360) endDate];
    id v7 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_11AE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_11B04(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[41];
    a1[41] = 0;

    double v3 = (void *)a1[42];
    a1[42] = 0;

    id v4 = (void *)a1[43];
    a1[43] = 0;

    double v5 = (void *)a1[44];
    a1[44] = 0;

    a1[5] = 0;
    a1[6] = 0;
  }
}

id sub_11B60(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 96);
  uint64_t v118 = *(void *)(a1 + 88);
  long long v119 = *(_OWORD *)(a1 + 72);
  uint64_t v120 = v6;
  long long v34 = +[NSArray arrayWithObjects:&v118 count:4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 320));
  id v8 = [WeakRetained daemon];
  id v9 = [v8 behavior];
  id v10 = [v9 features];
  unsigned int v11 = [v10 maskRestingHeartRateSamplesWithSleepSamples];

  if (v11)
  {
    uint64_t v12 = [v34 arrayByAddingObject:*(void *)(a1 + 104)];

    id v13 = (void *)v12;
  }
  else
  {
    id v13 = v34;
  }
  __int16 v35 = v13;
  double v33 = sub_12CD4(a1, v13);
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x4812000000;
  v112 = sub_12FF0;
  v113 = sub_13014;
  v114 = &unk_29485;
  v116 = 0;
  uint64_t v117 = 0;
  v115 = 0;
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x4812000000;
  v103 = sub_12FF0;
  v104 = sub_13014;
  v105 = &unk_29485;
  uint64_t v108 = 0;
  v106 = 0;
  v107 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x4812000000;
  v94 = sub_1302C;
  v95 = sub_13050;
  v96 = &unk_29485;
  uint64_t v99 = 0;
  v97 = 0;
  v98 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x4812000000;
  v85 = sub_1302C;
  v86 = sub_13050;
  v87 = &unk_29485;
  v89 = 0;
  uint64_t v90 = 0;
  v88 = 0;
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x4812000000;
  id v76 = sub_13068;
  id v77 = sub_1308C;
  id v78 = &unk_29485;
  v80 = 0;
  uint64_t v81 = 0;
  id v79 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x4812000000;
  unsigned int v67 = sub_13068;
  id v68 = sub_1308C;
  v69 = &unk_29485;
  v71 = 0;
  uint64_t v72 = 0;
  id v70 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x4812000000;
  v58 = sub_130A4;
  v59 = sub_130C8;
  id v60 = &unk_29485;
  v62 = 0;
  uint64_t v63 = 0;
  __p = 0;
  id v32 = objc_alloc_init((Class)HKDateIntervalTree);
  char v14 = [*(id *)(a1 + 360) startDate];
  [v14 timeIntervalSinceReferenceDate];
  uint64_t v16 = v15;

  id v31 = +[NSCalendar hk_gregorianCalendarWithUTCTimeZone];
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 0;
  id v17 = objc_loadWeakRetained((id *)(a1 + 320));
  uint64_t v18 = a2;
  id v19 = [v17 database];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_130E0;
  void v36[3] = &unk_34B98;
  id v20 = v33;
  id v37 = v20;
  id v30 = v35;
  id v38 = v30;
  uint64_t v39 = a1;
  uint64_t v50 = v16;
  id v42 = &v100;
  v43 = &v109;
  uint64_t v44 = &v82;
  id v45 = &v91;
  id v46 = &v64;
  long long v47 = &v73;
  id v21 = v31;
  id v40 = v21;
  long long v48 = &v55;
  id v22 = v32;
  id v41 = v22;
  long long v49 = &v51;
  id v23 = +[HDDataEntity performReadTransactionWithHealthDatabase:v19 error:v18 block:v36];

  if (a3) {
    *a3 = v52[3];
  }
  if (v23)
  {
    if (v56[7] != v56[6])
    {
      objc_msgSend(*(id *)(a1 + 328), "addActivationLogSamples:", v56 + 6, v30);
      [*(id *)(a1 + 336) addActivationLogSamples:v56 + 6];
    }
    if (v110[7] != v110[6])
    {
      [*(id *)(a1 + 328) addWorkouts:v110 + 6];
      [*(id *)(a1 + 344) addWorkouts:v110 + 6];
    }
    if (v101[7] != v101[6])
    {
      [*(id *)(a1 + 336) addWorkouts:v101 + 6];
      [*(id *)(a1 + 352) addWorkouts:v101 + 6];
    }
    if (v74[7] != v74[6]) {
      [*(id *)(a1 + 344) addBreatheSessions:v74 + 6];
    }
    if (v65[7] != v65[6]) {
      [*(id *)(a1 + 352) addBreatheSessions:v65 + 6];
    }
    if (v92[7] != v92[6]) {
      [*(id *)(a1 + 328) addStandHourSamples:v92 + 6];
    }
    if (v83[7] != v83[6]) {
      [*(id *)(a1 + 336) addStandHourSamples:v83 + 6];
    }
    id v24 = objc_loadWeakRetained((id *)(a1 + 320));
    id v25 = [v24 daemon];
    id v26 = [v25 behavior];
    id v27 = [v26 features];
    unsigned int v28 = [v27 maskRestingHeartRateSamplesWithSleepSamples];

    if (v28)
    {
      [*(id *)(a1 + 344) addAsleepTimeIntervals:v22];
      [*(id *)(a1 + 352) addAsleepTimeIntervals:v22];
    }
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  if (__p)
  {
    v62 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v64, 8);
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  _Block_object_dispose(&v73, 8);
  if (v79)
  {
    v80 = v79;
    operator delete(v79);
  }
  _Block_object_dispose(&v82, 8);
  if (v88)
  {
    v89 = v88;
    operator delete(v88);
  }
  _Block_object_dispose(&v91, 8);
  if (v97)
  {
    v98 = v97;
    operator delete(v97);
  }
  _Block_object_dispose(&v100, 8);
  if (v106)
  {
    v107 = v106;
    operator delete(v106);
  }
  _Block_object_dispose(&v109, 8);
  if (v115)
  {
    v116 = v115;
    operator delete(v115);
  }

  return v23;
}

void sub_12254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *__p,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  if (__p)
  {
    a43 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose(&a45, 8);
  if (a51)
  {
    a52 = (uint64_t)a51;
    operator delete(a51);
  }
  _Block_object_dispose(&a54, 8);
  if (a60)
  {
    a61 = (uint64_t)a60;
    operator delete(a60);
  }
  _Block_object_dispose(&a63, 8);
  if (a69)
  {
    a70 = (uint64_t)a69;
    operator delete(a69);
  }
  _Block_object_dispose(&a72, 8);
  id v78 = (void *)STACK[0x228];
  if (STACK[0x228])
  {
    STACK[0x230] = (unint64_t)v78;
    operator delete(v78);
  }
  _Block_object_dispose(&STACK[0x240], 8);
  id v79 = (void *)STACK[0x270];
  if (STACK[0x270])
  {
    STACK[0x278] = (unint64_t)v79;
    operator delete(v79);
  }
  _Block_object_dispose((const void *)(v76 - 216), 8);
  v80 = *(void **)(v76 - 168);
  if (v80)
  {
    *(void *)(v76 - 160) = v80;
    operator delete(v80);
  }

  _Unwind_Resume(a1);
}

id sub_12438(id *a1, uint64_t a2, void *a3)
{
  if (!a1) {
    return 0;
  }
  id v23 = [a1[15] allObjects];
  uint64_t v6 = +[_HKBehavior sharedBehavior];
  id v7 = [v6 features];
  unsigned __int8 v8 = [v7 workoutSeriesAggregation];

  id v9 = sub_140C8((uint64_t)a1, v23);
  id v10 = objc_msgSend(a1[45], "startDate", v9);
  [v10 timeIntervalSinceReferenceDate];
  uint64_t v12 = v11;
  id v24 = a3;

  [a1[51] timeIntervalSinceReferenceDate];
  uint64_t v14 = v13;
  uint64_t v54 = 0;
  uint64_t v55 = &v54;
  uint64_t v56 = 0x4812000000;
  uint64_t v57 = sub_1457C;
  v58 = sub_145A0;
  v59 = &unk_29485;
  v61 = 0;
  uint64_t v62 = 0;
  id v60 = 0;
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x4812000000;
  long long v48 = sub_1457C;
  long long v49 = sub_145A0;
  uint64_t v50 = &unk_29485;
  id v52 = 0;
  uint64_t v53 = 0;
  __p = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0xFFEFFFFFFFFFFFFFLL;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0x8000000000000000;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_145B8;
  v38[3] = &unk_34BC0;
  v38[5] = v12;
  v38[4] = a1;
  uint64_t v15 = objc_retainBlock(v38);
  id WeakRetained = objc_loadWeakRetained(a1 + 40);
  id v17 = [WeakRetained database];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_146FC;
  v25[3] = &unk_34C80;
  id v18 = v9;
  id v26 = v18;
  id v19 = v23;
  id v27 = v19;
  unsigned int v28 = a1;
  unsigned __int8 v37 = v8;
  uint64_t v35 = v14;
  uint64_t v36 = v12;
  id v30 = &v45;
  id v31 = &v54;
  id v32 = v44;
  id v20 = v15;
  id v29 = v20;
  double v33 = v43;
  long long v34 = &v39;
  id v21 = +[HDDataEntity performReadTransactionWithHealthDatabase:v17 error:a2 block:v25];

  if (v24) {
    void *v24 = v40[3];
  }
  if (v21)
  {
    if (v55[7] != v55[6]) {
      [a1[43] addHeartRateSamples:v55 + 6];
    }
    if (v46[7] != v46[6]) {
      [a1[44] addHeartRateSamples:v46 + 6];
    }
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v45, 8);
  if (__p)
  {
    id v52 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v54, 8);
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }

  return v21;
}

void sub_127EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *__p,uint64_t a55)
{
  uint64_t v57 = v55;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  if (__p)
  {
    a55 = (uint64_t)__p;
    operator delete(__p);
  }
  _Block_object_dispose((const void *)(v56 - 192), 8);
  id v60 = *(void **)(v56 - 144);
  if (v60)
  {
    *(void *)(v56 - 136) = v60;
    operator delete(v60);
  }

  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23588();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_12974(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  sub_160E0((char *)(*(void *)(a1 + 32) + 8), 0, 0, 0);
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
    sub_23628();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
}

void sub_12A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_12A94(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) execute];
}

void sub_12BB0(_Unwind_Exception *exception_object)
{
}

id sub_12BC8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) execute];
}

uint64_t sub_12BDC(uint64_t a1, uint64_t a2, double a3, double a4)
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 0;
  if (a2 > 74)
  {
    if (a2 <= 112)
    {
      if (a2 == 75)
      {
LABEL_16:
        id v7 = +[_HKBehavior sharedBehavior];
        uint64_t v6 = [v7 isStandalonePhoneFitnessMode] ^ 1;
LABEL_17:

        return v6;
      }
      if (a2 != 101) {
        return v6;
      }
LABEL_13:
      id v7 = +[_HKBehavior sharedBehavior];
      unsigned int v8 = [v7 isStandalonePhoneFitnessMode];
      if (a4 < a3) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = v8;
      }
      goto LABEL_17;
    }
    if (a2 == 113 || a2 == 179) {
      goto LABEL_13;
    }
  }
  else if ((unint64_t)(a2 - 7) <= 0x3F)
  {
    if (((1 << (a2 - 7)) & 0x2B) == 0)
    {
      if (a2 != 70) {
        return v6;
      }
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  return v6;
}

void sub_12CC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_12CD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 56);
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      id v7 = sub_12F58(a1, (uint64_t)[v3 count]);
      unsigned int v8 = +[HDSampleEntity disambiguatedDatabaseTable];
      id v9 = +[HDDataEntity disambiguatedDatabaseTable];
      id v10 = +[HDDataProvenanceEntity disambiguatedDatabaseTable];
      uint64_t v11 = +[HDCategorySampleEntity disambiguatedDatabaseTable];
      uint64_t v12 = +[HDWorkoutActivityEntity disambiguatedDatabaseTable];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT o.%@, o.%@, s.%@, s.%@, s.%@, object_provenances.%@, (object_provenances.%@ LIKE '%%Watch%%'), object_provenances.%@, c.%@, activity.activity_type FROM %@ s INNER JOIN %@ o USING (%@) INNER JOIN %@ object_provenances on (o.%@ = object_provenances.rowid) LEFT JOIN %@ c USING (%@) LEFT JOIN %@ activity ON (o.%@ = activity.%@ AND activity.%@)WHERE o.%@ = ? AND s.%@ IN (%@) AND s.%@ > ? AND s.%@ < ? AND s.%@ > ? AND +o.%@ > ? GROUP BY o.%@ ORDER BY s.%@ ASC, o.%@ ASC;",
        HDDataEntityPropertyDataID,
        HDDataEntityPropertyUUID,
        HDSampleEntityPropertyDataType,
        HDSampleEntityPropertyStartDate,
        HDSampleEntityPropertyEndDate,
        HDDataProvenanceEntityPropertySourceID,
        HDDataProvenanceEntityPropertyOriginProductType,
        HDDataProvenanceEntityPropertyDeviceID,
        HDCategorySampleEntityPropertyValue,
        v8,
        v9,
        HDDataEntityPropertyDataID,
        v10,
        HDDataEntityPropertyProvenance,
        v11,
        HDDataEntityPropertyDataID,
        v12,
        HDDataEntityPropertyDataID,
        HDWorkoutActivityEntityPropertyOwnerID,
        HDWorkoutActivityEntityPropertyIsPrimaryActivity,
        HDDataEntityPropertyType,
        HDSampleEntityPropertyDataType,
        v7,
        HDSampleEntityPropertyEndDate,
        HDSampleEntityPropertyStartDate,
        HDSampleEntityPropertyStartDate,
        HDDataEntityPropertyDataID,
        HDDataEntityPropertyDataID,
        HDSampleEntityPropertyStartDate,
      uint64_t v13 = HDDataEntityPropertyDataID);
      uint64_t v14 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v13;

      id v6 = *(id *)(a1 + 56);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_12F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_12F58(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = objc_alloc_init((Class)NSMutableString);
    if (a2 >= 1)
    {
      do
      {
        if (a2 == 1) {
          CFStringRef v4 = @"?";
        }
        else {
          CFStringRef v4 = @"?, ";
        }
        [v3 appendString:v4];
        --a2;
      }
      while (a2);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_12FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_12FF0(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_13014(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

__n128 sub_1302C(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_13050(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

__n128 sub_13068(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_1308C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

__n128 sub_130A4(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_130C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

id sub_130E0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 protectedDatabase];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1326C;
  v24[3] = &unk_34B48;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v25 = v7;
  uint64_t v26 = v8;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_13488;
  v15[3] = &unk_34B70;
  v15[4] = v8;
  uint64_t v23 = *(void *)(a1 + 136);
  long long v18 = *(_OWORD *)(a1 + 72);
  long long v19 = *(_OWORD *)(a1 + 88);
  long long v20 = *(_OWORD *)(a1 + 104);
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 120);
  id v16 = v9;
  uint64_t v21 = v10;
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 128);
  id v17 = v11;
  uint64_t v22 = v12;
  id v13 = [v5 executeSQL:v6 error:a3 bindingHandler:v24 enumerationHandler:v15];

  return v13;
}

void sub_13244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1326C(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    int v7 = 2;
    do
    {
      uint64_t v8 = 0;
      int v9 = v7;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_int64(a2, v9 + v8, (sqlite3_int64)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v8), "code", (void)v18));
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      int v7 = v9 + v8;
    }
    while (v5);
    int v10 = v9 + v8;
  }
  else
  {
    int v10 = 2;
  }

  id v11 = sub_11A3C(*(void *)(a1 + 40));
  uint64_t v12 = [v11 startDate];
  [v12 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v10, v13);

  uint64_t v14 = [v11 endDate];
  [v14 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v10 + 1, v15);

  uint64_t v16 = [v11 startDate];
  [v16 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v10 + 2, v17 + -259200.0);

  sqlite3_bind_int64(a2, v10 + 3, *(void *)(*(void *)(a1 + 40) + 48));
}

void sub_13440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_13488(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsUUID();
  id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = HDSQLiteColumnAsInt64();
  HDSQLiteColumnAsDouble();
  double v8 = v7;
  HDSQLiteColumnAsDouble();
  double v10 = v9;
  uint64_t v11 = HDSQLiteColumnAsInt64();
  char v12 = HDSQLiteColumnAsBoolean();
  unint64_t v13 = HDSQLiteColumnAsInt64();
  unsigned int v14 = HDSQLiteColumnAsInt64();
  uint64_t v83 = HDSQLiteColumnAsInt64();
  uint64_t v15 = sub_13C00(*(void *)(a1 + 32), v11, (uint64_t)a3);
  if (!v15) {
    goto LABEL_23;
  }
  unsigned int v82 = v14;
  uint64_t v84 = v4;
  v85 = v5;
  double v16 = *(double *)(a1 + 120);
  uint64_t v17 = *(void *)(a1 + 32);
  if (v8 >= v16)
  {
    uint64_t v81 = (void **)(*(void *)(*(void *)(a1 + 64) + 8) + 48);
    long long v18 = (void **)(*(void *)(*(void *)(a1 + 80) + 8) + 48);
    long long v19 = (void **)(*(void *)(*(void *)(a1 + 96) + 8) + 48);
    uint64_t v20 = 328;
  }
  else
  {
    uint64_t v81 = (void **)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
    long long v18 = (void **)(*(void *)(*(void *)(a1 + 72) + 8) + 48);
    long long v19 = (void **)(*(void *)(*(void *)(a1 + 88) + 8) + 48);
    uint64_t v20 = 336;
  }
  if (v6 == 99)
  {
    id v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v10, v81);
    id v31 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v8];
    [v30 timeIntervalSinceDate:v31];
    double v33 = v32;

    [*(id *)(v17 + v20) addDeepBreathingSessionDuration:v33];
    id v5 = v85;
    HDActivityCacheStatisticsBuilderBreatheSample::HDActivityCacheStatisticsBuilderBreatheSample((HDActivityCacheStatisticsBuilderBreatheSample *)&v87, v8, v10, v85);
    unint64_t v34 = (unint64_t)v19[2];
    uint64_t v35 = v19[1];
    if ((unint64_t)v35 >= v34)
    {
      uint64_t v45 = ((char *)v35 - (unsigned char *)*v19) >> 5;
      unint64_t v46 = v45 + 1;
      if ((unint64_t)(v45 + 1) >> 59) {
        sub_DCEC();
      }
      uint64_t v47 = v34 - (void)*v19;
      if (v47 >> 4 > v46) {
        unint64_t v46 = v47 >> 4;
      }
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v48 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v48 = v46;
      }
      if (v48) {
        long long v49 = (char *)sub_16230((uint64_t)(v19 + 2), v48);
      }
      else {
        long long v49 = 0;
      }
      id v60 = &v49[32 * v45];
      v61 = &v49[32 * v48];
      long long v62 = *(_OWORD *)&v87.var2;
      *(_OWORD *)id v60 = *(_OWORD *)&v87.var0;
      *((_OWORD *)v60 + 1) = v62;
      unsigned __int8 v37 = v60 + 32;
      uint64_t v64 = (char *)*v19;
      uint64_t v63 = (char *)v19[1];
      if (v63 != *v19)
      {
        do
        {
          long long v65 = *((_OWORD *)v63 - 1);
          *((_OWORD *)v60 - 2) = *((_OWORD *)v63 - 2);
          *((_OWORD *)v60 - 1) = v65;
          v60 -= 32;
          v63 -= 32;
        }
        while (v63 != v64);
        uint64_t v63 = (char *)*v19;
      }
      void *v19 = v60;
      v19[1] = v37;
      v19[2] = v61;
      if (v63) {
        operator delete(v63);
      }
    }
    else
    {
      long long v36 = *(_OWORD *)&v87.var2;
      _OWORD *v35 = *(_OWORD *)&v87.var0;
      v35[1] = v36;
      unsigned __int8 v37 = v35 + 2;
    }
    v19[1] = v37;
    uint64_t v22 = v84;
    goto LABEL_73;
  }
  if (v6 == 70)
  {
    id v5 = v85;
    long long v21 = *(void **)(a1 + 40);
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v8, v81);
    v23 = uint64_t v22 = v84;
    id v24 = [v21 components:48 fromDate:v23];

    unsigned int v25 = [v24 day];
    unsigned int v26 = [v24 hour];
    id v27 = (char *)v18[2];
    unsigned int v28 = (char *)v18[1];
    if (v28 >= v27)
    {
      unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * ((v28 - (unsigned char *)*v18) >> 3);
      unint64_t v41 = v40 + 1;
      if (v40 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_DCEC();
      }
      unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((v27 - (unsigned char *)*v18) >> 3);
      if (2 * v42 > v41) {
        unint64_t v41 = 2 * v42;
      }
      if (v42 >= 0x555555555555555) {
        unint64_t v43 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v43 = v41;
      }
      if (v43) {
        uint64_t v44 = (char *)sub_E468((uint64_t)(v18 + 2), v43);
      }
      else {
        uint64_t v44 = 0;
      }
      uint64_t v55 = &v44[24 * v40];
      uint64_t v56 = &v44[24 * v43];
      *(_DWORD *)uint64_t v55 = v25;
      *((_DWORD *)v55 + 1) = v26;
      *((_DWORD *)v55 + 2) = v82;
      *((_DWORD *)v55 + 3) = 0;
      *((double *)v55 + 2) = v8;
      id v29 = v55 + 24;
      v58 = (char *)*v18;
      uint64_t v57 = (char *)v18[1];
      if (v57 != *v18)
      {
        do
        {
          long long v59 = *(_OWORD *)(v57 - 24);
          *((void *)v55 - 1) = *((void *)v57 - 1);
          *(_OWORD *)(v55 - 24) = v59;
          v55 -= 24;
          v57 -= 24;
        }
        while (v57 != v58);
        uint64_t v57 = (char *)*v18;
      }
      NSObject *v18 = v55;
      v18[1] = v29;
      v18[2] = v56;
      if (v57) {
        operator delete(v57);
      }
    }
    else
    {
      *(_DWORD *)unsigned int v28 = v25;
      *((_DWORD *)v28 + 1) = v26;
      *((void *)v28 + 1) = v82;
      id v29 = v28 + 24;
      *((double *)v28 + 2) = v8;
    }
    v18[1] = v29;

    goto LABEL_73;
  }
  uint64_t v22 = v84;
  id v5 = v85;
  if (!v17 || (v12 & 1) != 0)
  {
    if (v6 == 63)
    {
      if (_HKCategoryValueSleepAnalysisIsAsleep()) {
        objc_msgSend(*(id *)(a1 + 48), "insertIntervalWithStartTime:endTime:", v8, v10, v81);
      }
      goto LABEL_73;
    }
    if (v6 != 79)
    {
      if (v6 != 68) {
        goto LABEL_73;
      }
LABEL_40:
      HDActivityCacheStatisticsBuilderSample::HDActivityCacheStatisticsBuilderSample(&v87, v8, v10, 0.0, v11);
      uint64_t v50 = *(void **)(*(void *)(a1 + 104) + 8);
      uint64_t v51 = (_OWORD *)v50[7];
      unint64_t v52 = v50[8];
      if ((unint64_t)v51 >= v52)
      {
        uint64_t v66 = v50[6];
        uint64_t v67 = ((uint64_t)v51 - v66) >> 5;
        unint64_t v68 = v67 + 1;
        if ((unint64_t)(v67 + 1) >> 59) {
          sub_DCEC();
        }
        uint64_t v69 = v52 - v66;
        if (v69 >> 4 > v68) {
          unint64_t v68 = v69 >> 4;
        }
        if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v70 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v70 = v68;
        }
        if (v70) {
          v71 = (char *)sub_16230((uint64_t)(v50 + 8), v70);
        }
        else {
          v71 = 0;
        }
        uint64_t v72 = &v71[32 * v67];
        uint64_t v73 = &v71[32 * v70];
        long long v74 = *(_OWORD *)&v87.var2;
        *(_OWORD *)uint64_t v72 = *(_OWORD *)&v87.var0;
        *((_OWORD *)v72 + 1) = v74;
        uint64_t v54 = v72 + 32;
        uint64_t v76 = (char *)v50[6];
        uint64_t v75 = (char *)v50[7];
        if (v75 != v76)
        {
          do
          {
            long long v77 = *((_OWORD *)v75 - 1);
            *((_OWORD *)v72 - 2) = *((_OWORD *)v75 - 2);
            *((_OWORD *)v72 - 1) = v77;
            v72 -= 32;
            v75 -= 32;
          }
          while (v75 != v76);
          uint64_t v75 = (char *)v50[6];
        }
        v50[6] = v72;
        v50[7] = v54;
        v50[8] = v73;
        if (v75) {
          operator delete(v75);
        }
      }
      else
      {
        long long v53 = *(_OWORD *)&v87.var2;
        *uint64_t v51 = *(_OWORD *)&v87.var0;
        v51[1] = v53;
        uint64_t v54 = v51 + 2;
      }
      v50[7] = v54;
      goto LABEL_73;
    }
LABEL_19:
    uint64_t v38 = sub_13DA4(v17, v13, a3);
    if (v38)
    {
      HDActivityCacheStatisticsBuilderWorkoutSample::HDActivityCacheStatisticsBuilderWorkoutSample((HDActivityCacheStatisticsBuilderWorkoutSample *)&v87, v8, v10, v83, v15 == 1, v38 == 1, v11, v84, v85);
      sub_13FC4(v81, (long long *)&v87);
      if (v8 < v16 && v10 >= *(double *)(a1 + 120)) {
        sub_13FC4((void **)(*(void *)(*(void *)(a1 + 64) + 8) + 48), (long long *)&v87);
      }
      goto LABEL_73;
    }
LABEL_23:
    uint64_t v39 = 0;
    goto LABEL_76;
  }
  if (v6 == 68) {
    goto LABEL_40;
  }
  if (v6 == 79) {
    goto LABEL_19;
  }
LABEL_73:
  uint64_t v78 = *(void *)(a1 + 32);
  uint64_t v79 = *(void *)(v78 + 48);
  if (v79 <= v22) {
    uint64_t v79 = v22;
  }
  *(void *)(v78 + 48) = v79;
  ++*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24);
  uint64_t v39 = 1;
LABEL_76:

  return v39;
}

void sub_13B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23690();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

void sub_13BA8()
{
}

void sub_13BD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  JUMPOUT(0x13BF8);
}

void sub_13BE4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_6710(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_13C00(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v13 = a2;
  if (result)
  {
    uint64_t v4 = result;
    unsigned __int8 v12 = 0;
    uint64_t v5 = result + 144;
    uint64_t v6 = sub_170F8((void *)(result + 144), &v13);
    if (v6)
    {
      double v7 = (unsigned __int8 *)(v6 + 3);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 320));
      double v9 = [WeakRetained sourceManager];
      double v10 = +[NSNumber numberWithLongLong:v13];
      uint64_t v11 = [v9 clientSourceForPersistentID:v10 error:a3];

      if (!v11) {
        return 0;
      }
      unsigned __int8 v12 = [v11 _isAppleWatch];
      sub_171AC(v5, &v13, &v13, &v12);

      double v7 = &v12;
    }
    if (*v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

void sub_13CFC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23730();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_13DA4(uint64_t result, unint64_t a2, void *a3)
{
  unint64_t v18 = a2;
  if (result)
  {
    uint64_t v4 = result;
    unsigned __int8 v17 = 0;
    uint64_t v5 = result + 224;
    uint64_t v6 = sub_170F8((void *)(result + 224), &v18);
    if (v6)
    {
      double v7 = (unsigned __int8 *)(v6 + 3);
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 320));
    double v9 = [WeakRetained deviceManager];
    double v10 = +[NSNumber numberWithLongLong:v18];
    id v16 = 0;
    uint64_t v11 = [v9 deviceForPersistentID:v10 error:&v16];
    id v12 = v16;

    if (v11 || !v12)
    {
      uint64_t v15 = [v11 localIdentifier];
      unsigned __int8 v17 = [v15 isEqualToString:HKDeviceConnectedGymIdentifier];

      sub_171AC(v5, &v18, &v18, &v17);
      double v7 = &v17;
LABEL_9:
      if (*v7) {
        return 1;
      }
      else {
        return 2;
      }
    }
    id v13 = v12;
    unsigned int v14 = v13;
    if (a3) {
      *a3 = v13;
    }
    else {
      _HKLogDroppedError();
    }

    return 0;
  }
  return result;
}

void sub_13F08(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_237D0();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_13FC4(void **a1, long long *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  double v7 = *(_OWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v12 = ((char *)v7 - (unsigned char *)*a1) >> 6;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 58) {
      sub_DCEC();
    }
    uint64_t v14 = v5 - (void)*a1;
    if (v14 >> 5 > v13) {
      unint64_t v13 = v14 >> 5;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      id v16 = (char *)sub_DF50(v4, v15);
    }
    else {
      id v16 = 0;
    }
    unsigned __int8 v17 = &v16[64 * v12];
    unint64_t v18 = &v16[64 * v15];
    long long v19 = *a2;
    long long v20 = a2[1];
    long long v21 = a2[3];
    *((_OWORD *)v17 + 2) = a2[2];
    *((_OWORD *)v17 + 3) = v21;
    *(_OWORD *)unsigned __int8 v17 = v19;
    *((_OWORD *)v17 + 1) = v20;
    uint64_t v11 = v17 + 64;
    uint64_t v23 = (char *)*a1;
    uint64_t v22 = (char *)a1[1];
    if (v22 != *a1)
    {
      do
      {
        long long v24 = *((_OWORD *)v22 - 4);
        long long v25 = *((_OWORD *)v22 - 3);
        long long v26 = *((_OWORD *)v22 - 1);
        *((_OWORD *)v17 - 2) = *((_OWORD *)v22 - 2);
        *((_OWORD *)v17 - 1) = v26;
        *((_OWORD *)v17 - 4) = v24;
        *((_OWORD *)v17 - 3) = v25;
        v17 -= 64;
        v22 -= 64;
      }
      while (v22 != v23);
      uint64_t v22 = (char *)*a1;
    }
    *a1 = v17;
    a1[1] = v11;
    a1[2] = v18;
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    long long v8 = *a2;
    long long v9 = a2[1];
    long long v10 = a2[3];
    v7[2] = a2[2];
    v7[3] = v10;
    *double v7 = v8;
    v7[1] = v9;
    uint64_t v11 = v7 + 4;
  }
  a1[1] = v11;
}

id sub_140C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 64);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v36 = v3;
      unint64_t v6 = +[_HKBehavior sharedBehavior];
      double v7 = [v6 features];
      unsigned int v8 = [v7 workoutSeriesAggregation];

      unsigned __int8 v37 = sub_12F58(a1, (uint64_t)[v3 count]);
      if (v8)
      {
        CFStringRef v35 = +[NSString stringWithFormat:@", qss.%@", HDQuantitySampleSeriesEntityPropertyInsertionEra];
      }
      else
      {
        CFStringRef v35 = &stru_35258;
      }
      uint64_t v9 = +[HDQuantitySampleEntity disambiguatedDatabaseTable];
      uint64_t v10 = +[HDSampleEntity disambiguatedDatabaseTable];
      uint64_t v11 = +[HDDataEntity disambiguatedDatabaseTable];
      uint64_t v33 = a1;
      uint64_t v12 = +[HDDataProvenanceEntity disambiguatedDatabaseTable];
      unint64_t v13 = +[HDQuantitySampleSeriesEntity disambiguatedDatabaseTable];
      uint64_t v34 = +[HDAssociationEntity disambiguatedDatabaseTable];
      uint64_t v14 = +[HDDataEntity disambiguatedDatabaseTable];
      uint64_t v15 = +[HDMetadataValueEntity disambiguatedDatabaseTable];
      uint64_t v16 = +[HDMetadataKeyEntity disambiguatedDatabaseTable];
      unsigned __int8 v17 = (void *)v16;
      if (v8)
      {
        CFStringRef v18 = &stru_35258;
        id v31 = (__CFString *)v16;
      }
      else
      {
        id v31 = +[NSString stringWithFormat:@"qss.%@ IS NULL AND", HDQuantitySampleSeriesEntityPropertyInsertionEra];
        CFStringRef v18 = v31;
      }
      uint64_t v29 = v9;
      long long v19 = (__CFString *)v9;
      long long v20 = (__CFString *)v35;
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT o.%@, s.%@, workout_objects.rowid, s.%@, s.%@, qs.%@, qss.%@, object_provenances.%@, metadata_values.numerical_value as hr_context %@ FROM %@ qs INNER JOIN %@ s USING (%@) INNER JOIN %@ o USING (%@) INNER JOIN %@ object_provenances on (o.%@ = object_provenances.rowid) LEFT JOIN %@ qss USING (%@) LEFT JOIN %@ c on (c.%@ = o.%@) LEFT JOIN %@ workout_objects on (workout_objects.rowid = c.%@) LEFT JOIN %@ metadata_values on ((metadata_values.%@ = qs.%@) AND (metadata_values.key_id IN (SELECT rowid FROM %@ WHERE %@ = ?)))WHERE o.%@ = ? AND s.%@ IN (%@) AND s.%@ > ? AND s.%@ < ? AND s.%@ > ? AND %@ +qs.%@ > ? ORDER BY s.%@ ASC, o.%@ ASC;",
        HDDataEntityPropertyDataID,
        HDSampleEntityPropertyDataType,
        HDSampleEntityPropertyStartDate,
        HDSampleEntityPropertyEndDate,
        HDQuantitySampleEntityPropertyQuantity,
        HDQuantitySampleSeriesEntityPropertyHFDKey,
        HDDataProvenanceEntityPropertySourceID,
        v35,
        v29,
        v10,
        HDDataEntityPropertyDataID,
        v11,
        HDDataEntityPropertyDataID,
        v12,
        HDDataEntityPropertyProvenance,
        v13,
        HDDataEntityPropertyDataID,
        v34,
        HDAssociationEntityPropertySourceObjectID,
        HDDataEntityPropertyDataID,
        v14,
        HDAssociationEntityPropertyDestinationObjectID,
        v15,
        HDMetadataValueEntityPropertyObjectID,
        HDDataEntityPropertyDataID,
        v17,
        HDMetadataKeyEntityPropertyKey,
        HDDataEntityPropertyType,
        HDSampleEntityPropertyDataType,
        v37,
        HDSampleEntityPropertyEndDate,
        HDSampleEntityPropertyStartDate,
        HDSampleEntityPropertyStartDate,
        v18,
        HDDataEntityPropertyDataID,
        HDSampleEntityPropertyStartDate,
      uint64_t v21 = HDDataEntityPropertyDataID);
      uint64_t v22 = *(void **)(v33 + 64);
      *(void *)(v33 + 64) = v21;

      if (v8) {
        unsigned __int8 v17 = (void *)v15;
      }
      uint64_t v23 = (void *)v14;
      if (v8) {
        long long v24 = (void *)v14;
      }
      else {
        long long v24 = (void *)v15;
      }
      id v30 = v24;
      if (v8) {
        uint64_t v23 = (void *)v34;
      }
      double v32 = v23;
      if (v8) {
        long long v25 = v13;
      }
      else {
        long long v25 = (void *)v34;
      }
      uint64_t v38 = v25;
      if (v8)
      {
        unint64_t v13 = v12;
        uint64_t v12 = (void *)v11;
        long long v26 = (void *)v10;
      }
      else
      {
        long long v26 = (void *)v11;
      }
      if (v8) {
        id v27 = v19;
      }
      else {
        id v27 = (void *)v10;
      }
      if (!v8) {
        long long v20 = v19;
      }

      id v5 = *(id *)(v33 + 64);
      id v3 = v36;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_14494(_Unwind_Exception *a1)
{
  if (*(_DWORD *)(v9 - 96)) {
  _Unwind_Resume(a1);
  }
}

__n128 sub_1457C(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_145A0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

double *sub_145B8(double *result, uint64_t a2, int64_t a3, int64_t a4, char a5, int a6, int a7, int a8, double a9, double a10, double a11)
{
  uint64_t v16 = result;
  double v17 = result[5];
  uint64_t v18 = *((void *)result + 4);
  if (v17 > a9) {
    uint64_t v19 = 336;
  }
  else {
    uint64_t v19 = 328;
  }
  if (a5)
  {
    if (!a8) {
      goto LABEL_14;
    }
  }
  else if ((a6 | a7) != 1 || (a8 & 1) == 0)
  {
    goto LABEL_14;
  }
  HDActivityCacheStatisticsBuilderSample::HDActivityCacheStatisticsBuilderSample(&v30, a9, a10, a11, a3);
  long long v20 = *(void **)(v18 + v19);
  HDActivityCacheStatisticsBuilderSample v29 = v30;
  __n128 result = (double *)[v20 addDeviceSample:&v29 typeCode:a2];
  if (v17 > a9 && v17 <= a10)
  {
    uint64_t v22 = *(void **)(*((void *)v16 + 4) + 328);
    HDActivityCacheStatisticsBuilderSample v28 = v30;
    __n128 result = (double *)[v22 addDeviceSample:&v28 typeCode:a2];
  }
LABEL_14:
  if (a4)
  {
    HDActivityCacheStatisticsBuilderSample::HDActivityCacheStatisticsBuilderSample(&v30, a9, a10, a11, a4);
    uint64_t v23 = *(void **)(v18 + v19);
    HDActivityCacheStatisticsBuilderSample v27 = v30;
    __n128 result = (double *)[v23 addWorkoutSample:&v27 typeCode:a2];
    if (v17 > a9 && v17 <= a10)
    {
      long long v25 = *(void **)(*((void *)v16 + 4) + 328);
      HDActivityCacheStatisticsBuilderSample v26 = v30;
      return (double *)[v25 addWorkoutSample:&v26 typeCode:a2];
    }
  }
  return result;
}

id sub_146FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = [v5 protectedDatabase];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_14A44;
  v34[3] = &unk_34B48;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v35 = v8;
  uint64_t v36 = v9;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_14C88;
  v26[3] = &unk_34C30;
  v26[4] = v9;
  char v33 = *(unsigned char *)(a1 + 120);
  long long v32 = *(_OWORD *)(a1 + 104);
  long long v29 = *(_OWORD *)(a1 + 64);
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 80);
  id v27 = v10;
  uint64_t v30 = v11;
  id v28 = *(id *)(a1 + 56);
  long long v31 = *(_OWORD *)(a1 + 88);
  id v12 = [v6 executeSQL:v7 error:a3 bindingHandler:v34 enumerationHandler:v26];

  if (*(unsigned char *)(a1 + 120)) {
    char v13 = (char)v12;
  }
  else {
    char v13 = 0;
  }
  if (v13)
  {
    uint64_t v14 = (char *)[*(id *)(*(void *)(a1 + 48) + 304) count];
    if (v14)
    {
      id v21 = v5;
      uint64_t v15 = v14 - 1;
      do
      {
        uint64_t v16 = objc_msgSend(*(id *)(*(void *)(a1 + 48) + 304), "objectAtIndexedSubscript:", v15, v21);
        double v17 = [v16 predicateForSeries];
        id v25 = 0;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1596C;
        v22[3] = &unk_34C58;
        id v18 = v16;
        id v23 = v18;
        id v24 = *(id *)(a1 + 56);
        +[HDQuantitySeriesDataEntity enumerateWithTransaction:v10 predicate:v17 error:&v25 handler:v22];
        id v19 = v25;

        if ([v18 didFreeze]) {
          [*(id *)(*(void *)(a1 + 48) + 304) removeObjectAtIndex:v15];
        }

        --v15;
      }
      while (v15 != (char *)-1);
    }
    id v12 = &def_E6CC + 1;
  }

  return v12;
}

void sub_14994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_14A44(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_text(a2, 1, (const char *)[_HKPrivateMetadataKeyHeartRateContext UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(a2, 2, 1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    int v7 = 3;
    do
    {
      id v8 = 0;
      int v9 = v7;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v4);
        }
        sqlite3_bind_int64(a2, v9 + v8, (sqlite3_int64)objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v8), "code", (void)v18));
        id v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      int v7 = v9 + v8;
    }
    while (v5);
    int v10 = v9 + v8;
  }
  else
  {
    int v10 = 3;
  }

  uint64_t v11 = sub_11A3C(*(void *)(a1 + 40));
  id v12 = [v11 startDate];
  [v12 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v10, v13);

  uint64_t v14 = [v11 endDate];
  [v14 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v10 + 1, v15);

  uint64_t v16 = [v11 startDate];
  [v16 timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v10 + 2, v17 + -259200.0);

  sqlite3_bind_int64(a2, v10 + 3, *(void *)(*(void *)(a1 + 40) + 40));
}

void sub_14C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_14C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = HDSQLiteColumnAsInt64();
  uint64_t v6 = HDSQLiteColumnAsInt64();
  uint64_t v7 = HDSQLiteColumnAsInt64();
  unint64_t v8 = HDSQLiteColumnAsInt64();
  uint64_t result = sub_13C00(*(void *)(a1 + 32), v8, a3);
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  uint64_t result = sub_15270(*(void *)(a1 + 32), v8, a3);
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  uint64_t result = sub_15414(*(void *)(a1 + 32), v8, a3);
  if (!result) {
    return result;
  }
  uint64_t v12 = result;
  uint64_t v45 = v5;
  HDSQLiteColumnAsDouble();
  double v14 = v13;
  HDSQLiteColumnAsDouble();
  double v16 = v15;
  uint64_t v17 = *(void *)(a1 + 32);
  BOOL v18 = v17 != 0;
  if (v10 != 1 && v17) {
    BOOL v18 = v6 == 10 && v7 != 0;
  }
  HIDWORD(v44) = sub_12BDC(v17, v6, *(double *)(a1 + 96), v15);
  if (*(unsigned char *)(a1 + 112)) {
    int v20 = HDSQLiteColumnIsNull() ^ 1;
  }
  else {
    int v20 = 0;
  }
  if (v11 != 1 && !(v18 | HIDWORD(v44))) {
    goto LABEL_46;
  }
  int v21 = v20;
  HDSQLiteColumnAsDouble();
  double v23 = v22;
  BOOL v25 = v10 == 1 || v12 == 1;
  if (v6 != 5 || !v25)
  {
    uint64_t v29 = v45;
    if (*(unsigned char *)(a1 + 112))
    {
      uint64_t v30 = HDSQLiteColumnAsInt64();
      if (v30)
      {
        uint64_t v31 = v30;
        long long v32 = *(void **)(*(void *)(a1 + 32) + 304);
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_15938;
        v46[3] = &unk_34C08;
        v46[4] = v31;
        char v33 = objc_msgSend(v32, "hk_firstObjectPassingTest:", v46);
        uint64_t v34 = v33;
        if (v21)
        {
          if (!v33)
          {
            LOBYTE(v44) = BYTE4(v44);
            id v35 = [[HDACUnfrozenSeriesCacheEntry alloc] initWithSeriesId:v31 timestamp:v6 dataTypeCode:v7 workoutSourceIdentifier:v8 sourceIdentifier:v10 == 1 isWatchSource:v11 == 1 isConnectedGymSource:v14 typeIsValidForAllDayFromCompanion:v44];
            [*(id *)(*(void *)(a1 + 32) + 304) addObject:v35];
          }
        }
        else if (v33)
        {
          [v33 setFrozen];

LABEL_45:
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v29;
LABEL_46:
          uint64_t v40 = *(void *)(a1 + 32);
          uint64_t v41 = *(void *)(v40 + 40);
          if (v41 <= v45) {
            uint64_t v41 = v45;
          }
          *(void *)(v40 + 40) = v41;
          ++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
          return 1;
        }
      }
    }
    (*(void (**)(void, uint64_t, unint64_t, uint64_t, BOOL, void, BOOL, BOOL, double, double, double))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6, v8, v7, v10 == 1, HIDWORD(v44), v11 == 1, v45 != *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v14, v16, v23);
    goto LABEL_45;
  }
  if (v21) {
    return 1;
  }
  double v26 = *(double *)(a1 + 104);
  uint64_t v27 = HDSQLiteColumnAsInt64();
  if (v14 >= v26) {
    uint64_t v28 = *(void *)(a1 + 64);
  }
  else {
    uint64_t v28 = *(void *)(a1 + 56);
  }
  uint64_t v36 = (void **)(*(void *)(v28 + 8) + 48);
  uint64_t v29 = v45;
  if (HDSQLiteColumnIsNull())
  {
    if (v23 >= 0.0)
    {
      HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::HDActivityCacheHeartRateStatisticsBuilderHeartRateSample((HDActivityCacheHeartRateStatisticsBuilderHeartRateSample *)&v52, v14, v23, v27);
      if (v14 <= *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        long long v60 = v52;
        int v61 = v53;
        sub_158AC(&v48, &v60, 1uLL);
        sub_156BC((char **)&v48, (uint64_t)v36);
        if (v48)
        {
          long long v49 = v48;
          operator delete(v48);
        }
      }
      else
      {
        sub_15784(v36, &v52);
      }
      uint64_t v42 = *(void *)(*(void *)(a1 + 72) + 8);
      double v43 = *(double *)(v42 + 24);
      if (v43 < v14) {
        double v43 = v14;
      }
      *(double *)(v42 + 24) = v43;
    }
    goto LABEL_45;
  }
  uint64_t v37 = HDSQLiteColumnAsInt64();
  *(void *)&long long v52 = 0;
  *((void *)&v52 + 1) = &v52;
  uint64_t v53 = 0x4812000000;
  uint64_t v54 = sub_1457C;
  uint64_t v55 = sub_145A0;
  uint64_t v56 = &unk_29485;
  v58 = 0;
  uint64_t v59 = 0;
  __p = 0;
  unint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x2020000000;
  double v51 = v14;
  uint64_t v38 = *(void *)(a1 + 40);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_155B8;
  v47[3] = &unk_34BE8;
  uint64_t v39 = *(void *)(a1 + 72);
  v47[4] = &v48;
  v47[5] = v39;
  v47[6] = &v52;
  v47[7] = v27;
  if (+[HDQuantitySampleSeriesEntity enumerateRawDataWithTransaction:v38 HFDKey:v37 error:a3 handler:v47])
  {
    sub_156BC((char **)(*((void *)&v52 + 1) + 48), (uint64_t)v36);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
    if (__p)
    {
      v58 = __p;
      operator delete(__p);
    }
    goto LABEL_45;
  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);
  if (__p)
  {
    v58 = __p;
    operator delete(__p);
  }
  return 0;
}

void sub_15204(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_15270(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v13 = a2;
  if (result)
  {
    uint64_t v4 = result;
    unsigned __int8 v12 = 0;
    uint64_t v5 = result + 184;
    uint64_t v6 = sub_170F8((void *)(result + 184), &v13);
    if (v6)
    {
      uint64_t v7 = (unsigned __int8 *)(v6 + 3);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 320));
      int v9 = [WeakRetained sourceManager];
      uint64_t v10 = +[NSNumber numberWithLongLong:v13];
      uint64_t v11 = [v9 clientSourceForPersistentID:v10 error:a3];

      if (!v11) {
        return 0;
      }
      unsigned __int8 v12 = [v11 _isConnectedGymSource];
      sub_171AC(v5, &v13, &v13, &v12);

      uint64_t v7 = &v12;
    }
    if (*v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

void sub_1536C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23870();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_15414(uint64_t result, unint64_t a2, uint64_t a3)
{
  unint64_t v13 = a2;
  if (result)
  {
    uint64_t v4 = result;
    unsigned __int8 v12 = 0;
    uint64_t v5 = result + 264;
    uint64_t v6 = sub_170F8((void *)(result + 264), &v13);
    if (v6)
    {
      uint64_t v7 = (unsigned __int8 *)(v6 + 3);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v4 + 320));
      int v9 = [WeakRetained sourceManager];
      uint64_t v10 = +[NSNumber numberWithLongLong:v13];
      uint64_t v11 = [v9 clientSourceForPersistentID:v10 error:a3];

      if (!v11) {
        return 0;
      }
      unsigned __int8 v12 = [v11 _isBTLEServer];
      sub_171AC(v5, &v13, &v13, &v12);

      uint64_t v7 = &v12;
    }
    if (*v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return result;
}

void sub_15510(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23910();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

uint64_t sub_155B8(void *a1, double a2, double a3, float a4)
{
  double v5 = a2;
  double v17 = a3;
  float v7 = _HDQuantitySampleSeriesEntityNilDuration;
  if (_HDQuantitySampleSeriesEntityNilDuration == a4) {
    a2 = *(double *)(*(void *)(a1[4] + 8) + 24);
  }
  double v16 = a2;
  if (a3 >= 0.0)
  {
    uint64_t v8 = *(void *)(a1[5] + 8);
    double v9 = *(double *)(v8 + 24);
    if (v9 < a2) {
      double v9 = a2;
    }
    *(double *)(v8 + 24) = v9;
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = (int *)(a1 + 7);
    unint64_t v12 = *(void *)(v10 + 56);
    if (v12 >= *(void *)(v10 + 64))
    {
      unint64_t v13 = sub_16268((void **)(v10 + 48), &v16, &v17, v11);
    }
    else
    {
      HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::HDActivityCacheHeartRateStatisticsBuilderHeartRateSample(*(HDActivityCacheHeartRateStatisticsBuilderHeartRateSample **)(v10 + 56), a2, a3, *v11);
      unint64_t v13 = (void *)(v12 + 24);
      *(void *)(v10 + 56) = v12 + 24;
    }
    *(void *)(v10 + 56) = v13;
  }
  double v14 = a4;
  if (v7 == a4) {
    double v14 = -0.0;
  }
  *(double *)(*(void *)(a1[4] + 8) + 24) = v14 + v5;
  return 1;
}

void sub_156B4(_Unwind_Exception *a1)
{
  *(void *)(v2 + 56) = v1;
  _Unwind_Resume(a1);
}

void sub_156BC(char **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  id v3 = a1[1];
  if (v3 != *a1)
  {
    uint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
    uint64_t v6 = *(long long **)a2;
    float v7 = *(long long **)(a2 + 8);
    uint64_t v9 = (char *)v7 - (char *)v6;
    if (v7 == v6)
    {
      sub_164DC(a2, (uint64_t)v6, v2, v3, v5);
    }
    else
    {
      sub_16404((void **)a2, v5 - 0x5555555555555555 * (v9 >> 3));
      sub_164DC(a2, *(void *)(a2 + 8), *a1, a1[1], 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
      sub_16864(*(long long **)a2, (double *)(*(void *)a2 + v9), *(long long **)(a2 + 8), (uint64_t)&v11);
    }
  }
}

void sub_15784(void **a1, long long *a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= (unint64_t)v6)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_DCEC();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      double v14 = (char *)sub_E468(v4, v13);
    }
    else {
      double v14 = 0;
    }
    double v15 = &v14[24 * v10];
    double v16 = &v14[24 * v13];
    long long v17 = *a2;
    *((void *)v15 + 2) = *((void *)a2 + 2);
    *(_OWORD *)double v15 = v17;
    uint64_t v9 = v15 + 24;
    long long v19 = (char *)*a1;
    BOOL v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 24);
        *((_DWORD *)v15 - 2) = *((_DWORD *)v18 - 2);
        *(_OWORD *)(v15 - 24) = v20;
        v15 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      BOOL v18 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v9;
    a1[2] = v16;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    uint64_t v9 = (char *)(v7 + 24);
  }
  a1[1] = v9;
}

void *sub_158AC(void *a1, const void *a2, unint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a3)
  {
    sub_163B0(a1, a3);
    uint64_t v6 = 3 * a3;
    uint64_t v7 = 24 * a3;
    long long v8 = (char *)a1[1];
    memmove(v8, a2, v7 - 4);
    a1[1] = &v8[8 * v6];
  }
  return a1;
}

void sub_1591C(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_15938(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "series_identifier") == *(id *)(a1 + 32);
}

uint64_t sub_1596C(uint64_t a1, double a2, double a3, double a4)
{
  return 1;
}

void sub_15B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15C38(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23A8C();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

void sub_15DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_15E18(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) execute];
}

void sub_15E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

char *sub_160E0(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 5)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 59) {
      sub_DCEC();
    }
    uint64_t v10 = v8 >> 4;
    if (v8 >> 4 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_161EC(v7, v11);
    unint64_t v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      BOOL v18 = v9;
      long long v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v12 = (void **)(result + 8);
  double v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 5;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  double v16 = &__src[32 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    BOOL v18 = v9;
    long long v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

char *sub_161EC(void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_DCEC();
  }
  uint64_t result = (char *)sub_16230((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *sub_16230(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_DDCC();
  }
  return operator new(32 * a2);
}

void *sub_16268(void **a1, double *a2, double *a3, int *a4)
{
  uint64_t v5 = (char *)*a1;
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 3);
  unint64_t v7 = v6 + 1;
  if (v6 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_DCEC();
  }
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - v5) >> 3);
  if (2 * v12 > v7) {
    unint64_t v7 = 2 * v12;
  }
  if (v12 >= 0x555555555555555) {
    unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v13 = v7;
  }
  if (v13)
  {
    double v14 = (char *)sub_E468(v11, v13);
    uint64_t v16 = v15;
  }
  else
  {
    double v14 = 0;
    uint64_t v16 = 0;
  }
  HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::HDActivityCacheHeartRateStatisticsBuilderHeartRateSample((HDActivityCacheHeartRateStatisticsBuilderHeartRateSample *)&v14[24 * v6], *a2, *a3, *a4);
  BOOL v18 = v17 + 24;
  long long v20 = (char *)*a1;
  long long v19 = (char *)a1[1];
  if (v19 != *a1)
  {
    do
    {
      long long v21 = *(_OWORD *)(v19 - 24);
      *((_DWORD *)v17 - 2) = *((_DWORD *)v19 - 2);
      *(_OWORD *)(v17 - 24) = v21;
      v17 -= 24;
      v19 -= 24;
    }
    while (v19 != v20);
    long long v19 = (char *)*a1;
  }
  *a1 = v17;
  a1[1] = v18;
  a1[2] = &v14[24 * v16];
  if (v19) {
    operator delete(v19);
  }
  return v18;
}

void sub_16398(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

char *sub_163B0(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_DCEC();
  }
  uint64_t result = (char *)sub_E468((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_16404(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      sub_DCEC();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v6 = (char *)sub_E468(v3, a2);
    unint64_t v7 = &v6[v5];
    uint64_t v9 = &v6[24 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((_DWORD *)v12 - 2) = *((_DWORD *)v10 - 2);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

char *sub_164DC(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  int64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  unint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    long long v13 = *(void **)a1;
    unint64_t v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 > 0xAAAAAAAAAAAAAAALL) {
      sub_DCEC();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((__dst - (uint64_t)v13) >> 3);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - (uint64_t)v13) >> 3);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v14) {
      uint64_t v17 = v14;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v17;
    }
    uint64_t v37 = v9;
    if (v18) {
      long long v19 = (char *)sub_E468(v9, v18);
    }
    else {
      long long v19 = 0;
    }
    uint64_t v28 = &v19[24 * v15];
    __p = v19;
    uint64_t v34 = v28;
    uint64_t v36 = &v19[24 * v18];
    uint64_t v29 = &v28[24 * a5];
    uint64_t v30 = 24 * a5;
    do
    {
      long long v31 = *(_OWORD *)v7;
      *((void *)v28 + 2) = *((void *)v7 + 2);
      *(_OWORD *)uint64_t v28 = v31;
      v28 += 24;
      v7 += 24;
      v30 -= 24;
    }
    while (v30);
    id v35 = v29;
    int64_t v5 = (char *)sub_16780((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      id v35 = &v34[(v35 - v34 - 24) % 0x18uLL];
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v20 = v12 - __dst;
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - __dst) >> 3)) >= a5)
  {
    long long v21 = &__src[24 * a5];
    double v23 = *(unsigned char **)(v9 - 8);
LABEL_17:
    uint64_t v24 = &v5[24 * a5];
    BOOL v25 = &v23[-24 * a5];
    double v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      double v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        *((void *)v26 + 2) = *((void *)v25 + 2);
        *(_OWORD *)double v26 = v27;
        v26 += 24;
        v25 += 24;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(v24, v5, v23 - v24 - 4);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7 - 4);
    }
    return v5;
  }
  long long v21 = &__src[8 * ((uint64_t)(v12 - __dst) >> 3)];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * ((uint64_t)(v12 - __dst) >> 3)], v22 - 4);
  }
  double v23 = (unsigned char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v20 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_16734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_16780(void **a1, uint64_t a2, char *__src)
{
  int64_t v5 = *(void **)(a2 + 8);
  unint64_t v6 = (char *)*a1;
  unint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *(_OWORD *)(v8 - 24);
      unint64_t v7 = (void *)(v9 - 24);
      *(_DWORD *)(v9 - 8) = *((_DWORD *)v8 - 2);
      *(_OWORD *)(v9 - 24) = v10;
      v8 -= 24;
      v9 -= 24;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(a2 + 16);
  int64_t v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v13 - 4);
    unint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v12 + v13;
  unint64_t v14 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v14;
  unint64_t v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v15;
  unint64_t v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v16;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void sub_16864(long long *a1, double *a2, long long *a3, uint64_t a4)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  uint64_t v9 = ((char *)a3 - (char *)a2) >> 3;
  uint64_t v10 = 0xAAAAAAAAAAAAAAABLL * v9;
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * v9) >= v8) {
    uint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  }
  else {
    uint64_t v11 = 0xAAAAAAAAAAAAAAABLL * v9;
  }
  uint64_t v12 = (char *)sub_16944(v11);
  sub_169B0(a1, a2, a3, a4, v8, v10, v12, v13);
  if (v12)
  {
    operator delete(v12);
  }
}

void sub_1692C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_16944(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x555555555555555) {
    unint64_t v1 = 0x555555555555555;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    uint64_t result = operator new(24 * v1, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

__n128 sub_169B0(long long *a1, double *a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v47 = a6;
  if (a6)
  {
    while (v47 > a8 && a5 > a8)
    {
      if (!a5) {
        return result;
      }
      uint64_t v13 = 0;
      uint64_t v14 = -a5;
      while (1)
      {
        unint64_t v15 = (long long *)((char *)a1 + v13);
        if (HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<(a2, (double *)((char *)a1 + v13))) {
          break;
        }
        v13 += 24;
        if (__CFADD__(v14++, 1)) {
          return result;
        }
      }
      uint64_t v18 = -v14;
      uint64_t v19 = v47;
      uint64_t v43 = a8;
      uint64_t v44 = a7;
      if (-v14 >= v47)
      {
        if (v14 == -1)
        {
          uint64_t v39 = (char *)a1 + v13;
          uint64_t v50 = *(void *)((char *)a1 + v13 + 16);
          __n128 v49 = *(__n128 *)((char *)a1 + v13);
          long long v40 = *(_OWORD *)a2;
          *((_DWORD *)v39 + 4) = *((_DWORD *)a2 + 4);
          *(_OWORD *)uint64_t v39 = v40;
          __n128 result = v49;
          *(__n128 *)a2 = v49;
          *((_DWORD *)a2 + 4) = v50;
          return result;
        }
        if (v14 > 0) {
          uint64_t v18 = 1 - v14;
        }
        uint64_t v25 = v18 >> 1;
        double v23 = (double *)((char *)a1 + 24 * (v18 >> 1) + v13);
        int64_t v22 = a2;
        if (a2 != (double *)a3)
        {
          uint64_t v42 = v18 >> 1;
          unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3);
          int64_t v22 = a2;
          do
          {
            long long v27 = &v22[3 * (v26 >> 1)];
            BOOL v28 = HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<(v27, v23);
            if (v28) {
              v26 += ~(v26 >> 1);
            }
            else {
              v26 >>= 1;
            }
            if (v28) {
              int64_t v22 = v27 + 3;
            }
          }
          while (v26);
          uint64_t v19 = v47;
          uint64_t v25 = v42;
        }
        uint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (v22 - a2);
      }
      else
      {
        if (v47 >= 0) {
          uint64_t v20 = v47;
        }
        else {
          uint64_t v20 = v47 + 1;
        }
        uint64_t v21 = v20 >> 1;
        int64_t v22 = &a2[3 * (v20 >> 1)];
        double v23 = a2;
        if ((char *)a2 - (char *)a1 != v13)
        {
          uint64_t v41 = v20 >> 1;
          unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1 - v13) >> 3);
          double v23 = (double *)((char *)a1 + v13);
          do
          {
            if (HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<(v22, &v23[3 * (v24 >> 1)]))
            {
              v24 >>= 1;
            }
            else
            {
              v23 += 3 * (v24 >> 1) + 3;
              v24 += ~(v24 >> 1);
            }
          }
          while (v24);
          uint64_t v19 = v47;
          uint64_t v21 = v41;
        }
        uint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - (char *)a1 - v13) >> 3);
      }
      a5 = -v25 - v14;
      *(void *)unint64_t v48 = v19 - v21;
      uint64_t v29 = (long long *)a2;
      uint64_t v30 = v19;
      uint64_t v31 = v25;
      long long v32 = sub_16EC0((char *)v23, v29, (long long *)v22);
      uint64_t v33 = v21;
      uint64_t v34 = v32;
      if (v31 + v33 >= v30 - (v31 + v33) - v14)
      {
        uint64_t v38 = v31;
        uint64_t v37 = v33;
        a7 = v44;
        sub_169B0(v32, v22, a3, a4, a5, *(void *)v48, v44, v43);
        a2 = v23;
        a8 = v43;
        a5 = v38;
        a3 = v34;
      }
      else
      {
        id v35 = v23;
        uint64_t v36 = v31;
        a7 = v44;
        a8 = v43;
        sub_169B0((char *)a1 + v13, v35, v32, a4, v36, v33, v44, v43);
        unint64_t v15 = v34;
        a2 = v22;
        uint64_t v37 = *(void *)v48;
      }
      uint64_t v47 = v37;
      a1 = v15;
      if (!v37) {
        return result;
      }
    }
    sub_16CEC(a1, (long long *)a2, a3, a4, a5, v47, a7);
  }
  return result;
}

long long *sub_16CEC(long long *__dst, long long *a2, long long *a3, int a4, uint64_t a5, uint64_t a6, char *__src)
{
  uint64_t v9 = a2;
  uint64_t v10 = __dst;
  if (a5 <= a6)
  {
    if (__dst != a2)
    {
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = &__src[v18];
        long long v20 = *(long long *)((char *)__dst + v18);
        *((void *)v19 + 2) = *(void *)((char *)__dst + v18 + 16);
        *(_OWORD *)uint64_t v19 = v20;
        v18 += 24;
      }
      while ((long long *)((char *)__dst + v18) != a2);
      if (v18)
      {
        uint64_t v21 = &__src[v18];
        int64_t v22 = (double *)__src;
        while (v9 != a3)
        {
          __dst = (long long *)HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<((double *)v9, v22);
          if (__dst)
          {
            long long v23 = *v9;
            *((_DWORD *)v10 + 4) = *((_DWORD *)v9 + 4);
            *uint64_t v10 = v23;
            uint64_t v9 = (long long *)((char *)v9 + 24);
          }
          else
          {
            long long v24 = *(_OWORD *)v22;
            *((_DWORD *)v10 + 4) = *((_DWORD *)v22 + 4);
            *uint64_t v10 = v24;
            v22 += 3;
          }
          uint64_t v10 = (long long *)((char *)v10 + 24);
          if (v21 == (char *)v22) {
            return __dst;
          }
        }
        return (long long *)memmove(v10, v22, __src - (char *)v22 + v18 - 4);
      }
    }
  }
  else if (a2 != a3)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = &__src[v11];
      long long v13 = *(long long *)((char *)a2 + v11);
      *((void *)v12 + 2) = *(void *)((char *)a2 + v11 + 16);
      *(_OWORD *)uint64_t v12 = v13;
      v11 += 24;
    }
    while ((long long *)((char *)a2 + v11) != a3);
    if (v11)
    {
      uint64_t v14 = (double *)&__src[v11];
      uint64_t v15 = (uint64_t)a3 - 24;
      while (v9 != v10)
      {
        __dst = (long long *)HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<(v14 - 3, (double *)v9 - 3);
        if (__dst) {
          unint64_t v16 = (char *)v9 - 24;
        }
        else {
          unint64_t v16 = (char *)(v14 - 3);
        }
        if (__dst) {
          uint64_t v9 = (long long *)((char *)v9 - 24);
        }
        int v17 = *((_DWORD *)v16 + 4);
        if (!__dst) {
          v14 -= 3;
        }
        *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
        *(_DWORD *)(v15 + 16) = v17;
        v15 -= 24;
        if (v14 == (double *)__src) {
          return __dst;
        }
      }
      uint64_t v25 = 0;
      do
      {
        uint64_t v26 = v15 + v25 * 8;
        long long v27 = *(_OWORD *)&v14[v25 - 3];
        *(_DWORD *)(v26 + 16) = LODWORD(v14[v25 - 1]);
        *(_OWORD *)uint64_t v26 = v27;
        v25 -= 3;
      }
      while (&v14[v25] != (double *)__src);
    }
  }
  return __dst;
}

long long *sub_16EC0(char *__src, long long *a2, long long *a3)
{
  BOOL v3 = a3;
  if (__src != (char *)a2)
  {
    if (a2 == a3)
    {
      return (long long *)__src;
    }
    else if (__src + 24 == (char *)a2)
    {
      long long v7 = *(_OWORD *)__src;
      uint64_t v9 = *((void *)__src + 2);
      int64_t v5 = (char *)a3 - (char *)a2;
      memmove(__src, a2, (char *)a3 - (char *)a2 - 4);
      BOOL v3 = (long long *)&__src[v5];
      *BOOL v3 = v7;
      *((_DWORD *)v3 + 4) = v9;
    }
    else if ((long long *)((char *)a2 + 24) == a3)
    {
      BOOL v3 = (long long *)(__src + 24);
      long long v8 = *(long long *)((char *)a3 - 24);
      uint64_t v10 = *((void *)a3 - 1);
      if ((char *)a3 - 24 != __src) {
        memmove(__src + 24, __src, (char *)a3 - 24 - __src - 4);
      }
      *(_OWORD *)HDActivityCacheStatisticsBuilderSample __src = v8;
      *((_DWORD *)__src + 4) = v10;
    }
    else
    {
      return sub_16FC0((long long *)__src, a2, a3);
    }
  }
  return v3;
}

long long *sub_16FC0(long long *a1, long long *a2, long long *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  if (v3 == 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3))
  {
    if (a1 != a2 && a2 != a3)
    {
      uint64_t v4 = (long long *)((char *)a1 + 24);
      int64_t v5 = (long long *)((char *)a2 + 24);
      do
      {
        long long v6 = *(long long *)((char *)v4 - 24);
        uint64_t v7 = *((void *)v4 - 1);
        int v8 = *((_DWORD *)v5 - 2);
        *(long long *)((char *)v4 - 24) = *(long long *)((char *)v5 - 24);
        *((_DWORD *)v4 - 2) = v8;
        *((_DWORD *)v5 - 2) = v7;
        *(long long *)((char *)v5 - 24) = v6;
        if (v4 == a2) {
          break;
        }
        uint64_t v4 = (long long *)((char *)v4 + 24);
        BOOL v9 = v5 == a3;
        int64_t v5 = (long long *)((char *)v5 + 24);
      }
      while (!v9);
    }
  }
  else
  {
    uint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)a2) >> 3);
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
    do
    {
      uint64_t v12 = v11;
      unint64_t v11 = v10;
      uint64_t v10 = v12 % v10;
    }
    while (v10);
    if (v11)
    {
      long long v13 = (long long *)((char *)a1 + 24 * v11);
      do
      {
        long long v14 = *(long long *)((char *)v13 - 24);
        uint64_t v15 = *((void *)v13 - 1);
        long long v13 = (long long *)((char *)v13 - 24);
        long long v26 = v14;
        int v27 = v15;
        unint64_t v16 = (long long *)((char *)v13 + 8 * (((char *)a2 - (char *)a1) >> 3));
        int v17 = v13;
        do
        {
          uint64_t v18 = v16;
          long long v19 = *v16;
          *((_DWORD *)v17 + 4) = *((_DWORD *)v16 + 4);
          long long *v17 = v19;
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)a3 - (char *)v16) >> 3);
          unint64_t v16 = (long long *)((char *)v16 + 8 * (((char *)a2 - (char *)a1) >> 3));
          BOOL v21 = __OFSUB__(v3, v20);
          uint64_t v23 = v3 - v20;
          char v22 = (v23 < 0) ^ v21;
          long long v24 = (long long *)((char *)a1 + 24 * v23);
          if (!v22) {
            unint64_t v16 = v24;
          }
          int v17 = v18;
        }
        while (v16 != v13);
        *((_DWORD *)v18 + 4) = v27;
        long long *v18 = v26;
      }
      while (v13 != a1);
    }
    return (long long *)((char *)a1 + 8 * (((char *)a3 - (char *)a2) >> 3));
  }
  return a2;
}

void *sub_170F8(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  long long v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  __n128 result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      __n128 result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *sub_171AC(uint64_t a1, unint64_t *a2, void *a3, unsigned char *a4)
{
  unint64_t v8 = *a2;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v11)
    {
      uint64_t v12 = *v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v8)
          {
            if (v12[2] == v8) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v4) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v12 = operator new(0x20uLL);
  void *v12 = 0;
  v12[1] = v8;
  v12[2] = *a3;
  *((unsigned char *)v12 + 24) = *a4;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_173DC(a1, v19);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v4 = v8 % v9;
      }
      else {
        unint64_t v4 = v8;
      }
    }
    else
    {
      unint64_t v4 = (v9 - 1) & v8;
    }
  }
  uint64_t v20 = *(void *)a1;
  BOOL v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *v12 = *v21;
LABEL_38:
    void *v21 = v12;
    goto LABEL_39;
  }
  void *v12 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v12;
  *(void *)(v20 + 8 * v4) = a1 + 16;
  if (*v12)
  {
    unint64_t v22 = *(void *)(*v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }
    else
    {
      v22 &= v9 - 1;
    }
    BOOL v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v12;
}

void sub_173C8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_173DC(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_174CC(a1, prime);
    }
  }
}

void sub_174CC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_DDCC();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t sub_17628(uint64_t a1)
{
  int8x8_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      int8x8_t v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::HDActivityCacheHeartRateStatisticsBuilderHeartRateSample(HDActivityCacheHeartRateStatisticsBuilderHeartRateSample *this, double a2, double a3, int a4)
{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((_DWORD *)this + 4) = a4;
}

{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((_DWORD *)this + 4) = a4;
}

BOOL HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator>(double *a1, double *a2)
{
  return *a1 > *a2;
}

BOOL HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator<=(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL HDActivityCacheHeartRateStatisticsBuilderHeartRateSample::operator>=(double *a1, double *a2)
{
  return *a1 >= *a2;
}

void sub_178A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_179B0(void *a1, int a2, _DWORD *a3, _DWORD *a4)
{
  if (a1)
  {
    uint64_t v7 = a1;
    unint64_t v8 = (void *)a1[19];
    if (v8)
    {
      uint8x8_t v9 = +[NSDate date];
      id v10 = objc_msgSend(v8, "hk_ageWithCurrentDate:", v9);
      uint64_t v11 = kHKHeartAgeGatingAge;

      if ((uint64_t)v10 < v11)
      {
        a1 = 0;
        goto LABEL_72;
      }
    }
    unint64_t v12 = (void *)v7[9];
    if (v12) {
      goto LABEL_71;
    }
    __p = 0;
    unint64_t v48 = 0;
    __n128 v49 = 0;
    unint64_t v13 = (double *)v7[3];
    float v14 = (double *)v7[4];
    if (v13 == v14)
    {
      int v27 = 0;
      BOOL v28 = 0;
    }
    else
    {
      do
      {
        if (*((_DWORD *)v13 + 4) == 3)
        {
          uint64_t v15 = *((void *)v13 + 1);
          BOOL v16 = (void *)v7[20];
          if (!v16 || ([v16 hasOverlapWithStartTime:*v13 endTime:*v13] & 1) == 0)
          {
            unint64_t v17 = v48;
            if (v48 >= (double *)v49)
            {
              size_t v19 = __p;
              uint64_t v20 = v48 - __p;
              unint64_t v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 61) {
                sub_DCEC();
              }
              uint64_t v22 = v49 - (char *)__p;
              if ((v49 - (char *)__p) >> 2 > v21) {
                unint64_t v21 = v22 >> 2;
              }
              if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v23 = v21;
              }
              if (v23)
              {
                long long v24 = (char *)sub_DD04((uint64_t)&v49, v23);
                size_t v19 = __p;
                unint64_t v17 = v48;
              }
              else
              {
                long long v24 = 0;
              }
              uint64_t v25 = &v24[8 * v20];
              *(void *)uint64_t v25 = v15;
              unint64_t v18 = (double *)(v25 + 8);
              while (v17 != v19)
              {
                uint64_t v26 = *((void *)v17-- - 1);
                *((void *)v25 - 1) = v26;
                v25 -= 8;
              }
              __p = (double *)v25;
              __n128 v49 = &v24[8 * v23];
              if (v19) {
                operator delete(v19);
              }
            }
            else
            {
              *(void *)unint64_t v48 = v15;
              unint64_t v18 = v48 + 1;
            }
            unint64_t v48 = v18;
          }
        }
        v13 += 3;
      }
      while (v13 != v14);
      int v27 = __p;
      BOOL v28 = v48;
    }
    uint64_t v29 = (char *)v28 - (char *)v27;
    uint64_t v30 = v28 - v27;
    if (a3) {
      *a3 = (unint64_t)v29 >> 3;
    }
    if (v30 >= a2)
    {
      std::__sort<std::__less<double,double> &,double *>();
      if (v29 <= 160)
      {
        int v27 = v48;
      }
      else
      {
        unint64_t v31 = (unint64_t)v30 >> 1;
        long long v32 = __p;
        if ((v29 & 8) != 0) {
          double v33 = __p[v31];
        }
        else {
          double v33 = (__p[v31 - 1] + __p[v31]) * 0.5;
        }
        int v27 = v48;
        if (__p == v48)
        {
          int v27 = __p;
        }
        else
        {
          double v34 = v33 * 0.7;
          double v35 = v33 * 1.4;
          while (v34 < *v32 && v35 > *v32)
          {
            if (++v32 == v48) {
              goto LABEL_60;
            }
          }
          if (v32 != v48)
          {
            for (uint64_t i = v32 + 1; i != v48; ++i)
            {
              double v38 = *i;
              if (v34 < *i && v35 > v38) {
                *v32++ = v38;
              }
            }
            if (v32 != v48) {
              int v27 = v32;
            }
          }
        }
      }
LABEL_60:
      if (a4) {
        *a4 = (unint64_t)((char *)v27 - (char *)__p) >> 3;
      }
      if (v29 <= 167)
      {
        uint64_t v40 = (char *)v27 - (char *)__p;
        unint64_t v41 = 1;
LABEL_66:
        if (v41 >= v40 >> 3) {
          sub_1A474();
        }
        double v42 = __p[v41];
        uint64_t v43 = +[HKUnit _countPerSecondUnit];
        uint64_t v44 = +[HKQuantity quantityWithUnit:v43 doubleValue:v42];
        uint64_t v45 = (void *)v7[9];
        v7[9] = v44;

        int v27 = __p;
        goto LABEL_68;
      }
      uint64_t v40 = (char *)v27 - (char *)__p;
      if (v27 != __p)
      {
        unint64_t v41 = vcvtmd_s64_f64((double)(int)((unint64_t)v40 >> 3) * 0.05);
        goto LABEL_66;
      }
    }
LABEL_68:
    if (v27) {
      operator delete(v27);
    }
    unint64_t v12 = (void *)v7[9];
LABEL_71:
    a1 = v12;
  }
LABEL_72:

  return a1;
}

void sub_17D44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23B2C();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_17DDC()
{
}

id sub_17DF0(uint64_t a1)
{
  if (!a1 || (int8x8_t v2 = *(double **)(a1 + 24), *(double **)(a1 + 32) == v2))
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*v2];
    int8x8_t v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)(a1 + 32) - 24)];
    id v5 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v3 endDate:v4];
  }

  return v5;
}

void sub_17E98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_17EB4(void *a1)
{
  if (a1)
  {
    unint64_t v1 = a1;
    int8x8_t v2 = (void *)a1[10];
    if (v2)
    {
LABEL_69:
      a1 = v2;
      goto LABEL_70;
    }
    unint64_t v48 = 0;
    __n128 v49 = 0;
    uint64_t v50 = 0;
    unint64_t v3 = (long long *)a1[6];
    int8x8_t v4 = (long long *)a1[7];
    if (v3 != v4)
    {
      id v5 = 0;
      do
      {
        long long v47 = *v3;
        uint64_t v6 = *((void *)v3 + 2);
        long long v7 = *(long long *)((char *)v3 + 40);
        *(_OWORD *)__p = *(long long *)((char *)v3 + 24);
        long long v52 = v7;
        uint64_t v53 = *((void *)v3 + 7);
        if (v6 == 52)
        {
          if (v5 >= v50)
          {
            uint64_t v10 = (v5 - (char *)v48) >> 6;
            if ((unint64_t)(v10 + 1) >> 58) {
              sub_DCEC();
            }
            unint64_t v11 = (v50 - (char *)v48) >> 5;
            if (v11 <= v10 + 1) {
              unint64_t v11 = v10 + 1;
            }
            if ((unint64_t)(v50 - (char *)v48) >= 0x7FFFFFFFFFFFFFC0) {
              unint64_t v12 = 0x3FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v12 = v11;
            }
            if (v12) {
              unint64_t v13 = (char *)sub_DF50((uint64_t)&v50, v12);
            }
            else {
              unint64_t v13 = 0;
            }
            float v14 = &v13[64 * v10];
            *(_OWORD *)float v14 = v47;
            *((void *)v14 + 2) = 52;
            *(_OWORD *)(v14 + 24) = *(_OWORD *)__p;
            *(_OWORD *)(v14 + 40) = v52;
            *((void *)v14 + 7) = v53;
            uint64_t v15 = v49;
            BOOL v16 = v14;
            if (v49 != v48)
            {
              do
              {
                long long v17 = *((_OWORD *)v15 - 4);
                long long v18 = *((_OWORD *)v15 - 3);
                long long v19 = *((_OWORD *)v15 - 1);
                *((_OWORD *)v16 - 2) = *((_OWORD *)v15 - 2);
                *((_OWORD *)v16 - 1) = v19;
                *((_OWORD *)v16 - 4) = v17;
                *((_OWORD *)v16 - 3) = v18;
                v16 -= 64;
                v15 -= 8;
              }
              while (v15 != v48);
              uint64_t v15 = v48;
            }
            id v5 = v14 + 64;
            unint64_t v48 = (double *)v16;
            uint64_t v50 = &v13[64 * v12];
            if (v15) {
              operator delete(v15);
            }
          }
          else
          {
            *(_OWORD *)id v5 = *v3;
            *((void *)v5 + 2) = 52;
            uint64_t v8 = v53;
            long long v9 = v52;
            *(_OWORD *)(v5 + 24) = *(_OWORD *)__p;
            *(_OWORD *)(v5 + 40) = v9;
            *((void *)v5 + 7) = v8;
            v5 += 64;
          }
          __n128 v49 = (double *)v5;
        }
        v3 += 4;
      }
      while (v3 != v4);
    }
    __p[0] = 0;
    __p[1] = 0;
    *(void *)&long long v52 = 0;
    uint64_t v20 = v1[3];
    uint64_t v21 = v1[4];
    if (v20 == v21)
    {
      double v38 = 0;
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      do
      {
        unint64_t v23 = v48;
        if (v48 == v49)
        {
          char v24 = 0;
        }
        else
        {
          char v24 = 0;
          double v25 = *(double *)v20;
          do
          {
            BOOL v26 = v25 >= *v23;
            if (v25 >= v23[1]) {
              BOOL v26 = 0;
            }
            v24 |= v26;
            if (v26) {
              break;
            }
            v23 += 8;
          }
          while (v23 != v49);
        }
        uint64_t v27 = *(void *)(v20 + 8);
        if ((v24 & 1) != 0 || *(_DWORD *)(v20 + 16) == 4)
        {
          if ((unint64_t)v22 >= (unint64_t)v52)
          {
            uint64_t v29 = (char *)__p[0];
            uint64_t v30 = (v22 - (char *)__p[0]) >> 3;
            unint64_t v31 = v30 + 1;
            if ((unint64_t)(v30 + 1) >> 61) {
              sub_DCEC();
            }
            uint64_t v32 = v52 - (unint64_t)__p[0];
            if ((uint64_t)(v52 - (unint64_t)__p[0]) >> 2 > v31) {
              unint64_t v31 = v32 >> 2;
            }
            if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v33 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v33 = v31;
            }
            if (v33)
            {
              unint64_t v33 = (unint64_t)sub_DD04((uint64_t)&v52, v33);
              uint64_t v35 = v34;
              uint64_t v29 = (char *)__p[0];
              uint64_t v22 = (char *)__p[1];
            }
            else
            {
              uint64_t v35 = 0;
            }
            uint64_t v36 = (void *)(v33 + 8 * v30);
            void *v36 = v27;
            BOOL v28 = v36 + 1;
            while (v22 != v29)
            {
              uint64_t v37 = *((void *)v22 - 1);
              v22 -= 8;
              *--uint64_t v36 = v37;
            }
            __p[0] = v36;
            __p[1] = v28;
            *(void *)&long long v52 = v33 + 8 * v35;
            if (v29) {
              operator delete(v29);
            }
          }
          else
          {
            *(void *)uint64_t v22 = v27;
            BOOL v28 = v22 + 8;
          }
          __p[1] = v28;
          uint64_t v22 = (char *)v28;
        }
        v20 += 24;
      }
      while (v20 != v21);
      double v38 = __p[0];
    }
    uint64_t v39 = v22 - v38;
    if (v22 - v38 <= 0)
    {
LABEL_64:
      if (v38)
      {
        __p[1] = v38;
        operator delete(v38);
      }
      if (v48) {
        operator delete(v48);
      }
      int8x8_t v2 = (void *)v1[10];
      goto LABEL_69;
    }
    std::__sort<std::__less<double,double> &,double *>();
    unint64_t v40 = (unint64_t)(v39 >> 3) >> 1;
    unint64_t v41 = ((char *)__p[1] - (char *)__p[0]) >> 3;
    if ((v39 & 8) != 0)
    {
      if (v41 > v40)
      {
        double v42 = *((double *)__p[0] + v40);
        goto LABEL_63;
      }
    }
    else if (v41 > v40 && v41 > v40 - 1)
    {
      double v42 = (*((double *)__p[0] + v40) + *((double *)__p[0] + v40 - 1)) * 0.5;
LABEL_63:
      uint64_t v43 = +[HKUnit _countPerSecondUnit];
      uint64_t v44 = +[HKQuantity quantityWithUnit:v43 doubleValue:v42];
      uint64_t v45 = (void *)v1[10];
      v1[10] = v44;

      double v38 = __p[0];
      goto LABEL_64;
    }
    sub_1A474();
  }
LABEL_70:

  return a1;
}

void sub_182CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  long long v17 = v16;

  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23BCC();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1836C(_Unwind_Exception *a1)
{
}

void sub_18374(_Unwind_Exception *a1)
{
}

void sub_18380(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x18388);
  }
  sub_6710(a1);
}

void sub_18538(uint64_t a1, double **a2)
{
  if (a1)
  {
    id v4 = +[NSMutableArray arrayWithObject:*(void *)(a1 + 88)];
    [v4 addObjectsFromArray:*(void *)(a1 + 96)];
    [v4 addObjectsFromArray:*(void *)(a1 + 104)];
    [v4 addObjectsFromArray:*(void *)(a1 + 112)];
    sub_185E8((id *)a1, a2, v4);
  }
}

void sub_185D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_185E8(id *a1, double **a2, void *a3)
{
  id v20 = a3;
  if (a1)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 512, objc_msgSend(v20, "count"));
    long long v7 = *a2;
    uint64_t v6 = a2[1];
    long long v19 = v6;
    while (v7 != v6)
    {
      double v8 = v7[1];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v20;
      id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10)
      {
        double v11 = v8 * 60.0;
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v9);
            }
            float v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v15 = [v14 dateInterval];
            unsigned int v16 = objc_msgSend(v15, "hk_containsTime:", *v7);

            if (v16)
            {
              [v14 addHeartRateInBeatsPerMinute:v11 forTime:*v7];
              long long v17 = [v14 sessionUUID];
              BOOL v18 = v17 == 0;

              if (!v18) {
                sub_188A4((uint64_t)a1, v14, v7[1], *v7);
              }
              [v5 addObject:v14];
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v10);
      }

      v7 += 3;
      uint64_t v6 = v19;
    }
    sub_18C48(a1, v5);
  }
}

void sub_187E8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23D0C();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

void sub_188A4(uint64_t a1, void *a2, double a3, double a4)
{
  id v20 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v7 = sub_19030(a1, v20);
      [v7 addSampleValue:0 startTime:0 endTime:a3 sourceID:a4 error:a4];
LABEL_7:

      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v7 = sub_191AC(a1, v20);
      id v8 = objc_alloc((Class)HKHeartRateSummaryReading);
      id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
      id v10 = +[HKUnit _countPerSecondUnit];
      double v11 = +[HKQuantity quantityWithUnit:v10 doubleValue:a3];
      id v12 = [v8 initWithDate:v9 quantity:v11];

      [v7 addObject:v12];
LABEL_6:

      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v13 = *(void **)(a1 + 144);
      float v14 = [v20 sessionUUID];
      long long v7 = [v13 objectForKeyedSubscript:v14];

      if (!objc_msgSend(v7, "hk_containsTime:", a4)) {
        goto LABEL_7;
      }
      sub_19288(a1, v20);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = objc_alloc((Class)HKHeartRateSummaryReading);
      unsigned int v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
      long long v17 = +[HKUnit _countPerSecondUnit];
      BOOL v18 = +[HKQuantity quantityWithUnit:v17 doubleValue:a3];
      id v19 = [v15 initWithDate:v16 quantity:v18];

      [v12 addObject:v19];
      goto LABEL_6;
    }
  }
LABEL_8:
}

void sub_18B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  float v14 = v11;

  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23DAC();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

void sub_18C48(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = a1[12];
    id v5 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v28 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v3 containsObject:v8]) {
            sub_19364((uint64_t)a1, v8);
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v5);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = a1[13];
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v24;
      do
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v9);
          }
          unint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          if ([v3 containsObject:v13]) {
            sub_19460((uint64_t)a1, v13);
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v10);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = a1[14];
    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      do
      {
        for (k = 0; k != v15; k = (char *)k + 1)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          BOOL v18 = *(void **)(*((void *)&v19 + 1) + 8 * (void)k);
          if (objc_msgSend(v3, "containsObject:", v18, (void)v19)) {
            sub_195B8((uint64_t)a1, v18);
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }
      while (v15);
    }
  }
}

void sub_18EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19030(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 sessionUUID];
    uint64_t v6 = [*(id *)(a1 + 120) objectForKeyedSubscript:v5];
    if (!v6)
    {
      long long v7 = +[HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
      uint64_t v6 = +[HDStatisticsCollectionCalculator calculatorForQuantityType:v7 intervalCollection:0 options:14 mergeStrategy:1 computationMethod:3];

      [*(id *)(a1 + 120) setObject:v6 forKeyedSubscript:v5];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_19118(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23E4C();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

id sub_191AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 sessionUUID];
    uint64_t v6 = [*(id *)(a1 + 128) objectForKeyedSubscript:v5];
    if (!v6)
    {
      uint64_t v6 = +[NSMutableArray array];
      [*(id *)(a1 + 128) setObject:v6 forKeyedSubscript:v5];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_19260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_19288(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 sessionUUID];
    uint64_t v6 = [*(id *)(a1 + 136) objectForKeyedSubscript:v5];
    if (!v6)
    {
      uint64_t v6 = +[NSMutableArray array];
      [*(id *)(a1 + 136) setObject:v6 forKeyedSubscript:v5];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_1933C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19364(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v9 = v3;
    id v4 = sub_19030(a1, v3);
    id v5 = [v4 currentStatistics];
    uint64_t v6 = v5;
    if (v5)
    {
      long long v7 = [v5 averageQuantity];
      [v9 _setAverageHeartRate:v7];

      id v8 = [v6 maximumQuantity];
      [v9 _setMaximumHeartRate:v8];
    }
    id v3 = v9;
  }
}

void sub_19420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_19460(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v10 = v3;
    id v4 = sub_191AC(a1, v3);
    id v5 = sub_19CF0(a1, v4);

    uint64_t v6 = [v10 dateInterval];
    long long v7 = [v6 startDate];
    id v8 = +[_HKHeartRateRecoveryQueryUtility perMinuteWorkoutRecoveryHeartRateFromReadings:v5 workoutEndDate:v7];

    [v10 _setPerMinuteReadings:v8];
    id v9 = [v8 allValues];
    [v10 _setHighlightedReadings:v9];

    id v3 = v10;
  }
}

void sub_1955C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_195B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_19288(a1, v3);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = 0;
    id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v8);
          if (!v5
            || (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v8), "date", (void)v14),
                id v10 = objc_claimAutoreleasedReturnValue(),
                [v5 date],
                uint64_t v11 = objc_claimAutoreleasedReturnValue(),
                unsigned int v12 = objc_msgSend(v10, "hk_isAfterDate:", v11),
                v11,
                v10,
                v12))
          {
            id v13 = v9;

            id v5 = v13;
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [v3 _setFinalReading:v5];
    [v3 _setHighlightedReadings:v4];
  }
}

void sub_19744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_198D0(uint64_t a1, uint64_t *a2)
{
  if (a1)
  {
    long long v25 = +[NSMutableArray array];
    uint64_t v4 = *a2;
    uint64_t v23 = a2[1];
    if (*a2 != v23)
    {
      double v5 = kHKWorkoutHeartRateRecoveryDisplayInterval;
      do
      {
        id v26 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v4 + 48];
        id v6 = objc_alloc((Class)NSDateInterval);
        uint64_t v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)v4];
        id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)(v4 + 8)];
        id v9 = [v6 initWithStartDate:v7 endDate:v8];

        id v10 = objc_alloc((Class)HKHeartRateSummaryWorkoutStatistics);
        id v24 = [v10 initWithDateInterval:v9 numberOfBuckets:HDActivityCacheHeartRateStatisticsBuilderNumberOfHeartRateBuckets workoutUUID:v26 workoutActivityType:*(void *)(v4 + 16)];
        [*(id *)(a1 + 96) addObject:v24];
        [v25 addObject:v24];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v11 = *(id *)(a1 + 104);
        id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v11);
              }
              long long v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              long long v16 = objc_msgSend(v15, "dateInterval", v23);
              unsigned int v17 = [v16 intersectsDateInterval:v9];

              if (v17) {
                sub_19460(a1, v15);
              }
            }
            id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v12);
        }

        id v18 = objc_alloc((Class)NSDateInterval);
        long long v19 = [v9 endDate];
        id v20 = [v18 initWithStartDate:v19 duration:v5];

        id v21 = objc_alloc((Class)HKHeartRateSummaryWorkoutRecoveryStatistics);
        id v22 = [v21 initWithDateInterval:v20 numberOfBuckets:HDActivityCacheHeartRateStatisticsBuilderNumberOfHeartRateBuckets workoutUUID:v26 workoutActivityType:*(void *)(v4 + 16)];
        [*(id *)(a1 + 104) addObject:v22];
        [v25 addObject:v22];

        v4 += 64;
      }
      while (v4 != v23);
    }
    sub_185E8((id *)a1, (double **)(a1 + 24), v25);
  }
}

void sub_19BAC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_23F8C();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

id sub_19CF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 96), "hk_map:", &stru_34CC0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_19E24;
    v7[3] = &unk_34CE8;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = v8;
    double v5 = objc_msgSend(v3, "hk_filter:", v7);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

void sub_19DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_19DF4(id a1, HKHeartRateSummaryWorkoutStatistics *a2)
{
  int8x8_t v2 = [(HKHeartRateSummaryWorkoutStatistics *)a2 dateInterval];

  return v2;
}

uint64_t sub_19E24(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v7);
        id v9 = objc_msgSend(v3, "date", (void)v12);
        LOBYTE(v8) = [v8 containsDate:v9];

        if (v8)
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

void sub_19F5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_2402C();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1A334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A474()
{
}

void sub_1A48C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1A4E8(exception, a1);
}

void sub_1A4D4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1A4E8(std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1A51C(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 6)
  {
    if (a2 >> 58) {
      sub_DCEC();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_DF50(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFC0];
    id v9 = &v6[64 * v8];
    id v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    long long v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 4);
        long long v14 = *((_OWORD *)v10 - 3);
        long long v15 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v15;
        *((_OWORD *)v12 - 4) = v13;
        *((_OWORD *)v12 - 3) = v14;
        v12 -= 64;
        v10 -= 64;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

char *sub_1A5D4(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  int64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 6)
  {
    long long v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 6);
    if (v14 >> 58) {
      sub_DCEC();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 6;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 5 > v14) {
      unint64_t v14 = v16 >> 5;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v17 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v41 = v9;
    if (v17) {
      id v18 = (char *)sub_DF50(v9, v17);
    }
    else {
      id v18 = 0;
    }
    long long v30 = &v18[64 * v15];
    __p = v18;
    double v38 = v30;
    unint64_t v40 = &v18[64 * v17];
    uint64_t v31 = a5 << 6;
    uint64_t v32 = &v30[64 * a5];
    do
    {
      long long v33 = *(_OWORD *)v7;
      long long v34 = *((_OWORD *)v7 + 1);
      long long v35 = *((_OWORD *)v7 + 3);
      *((_OWORD *)v30 + 2) = *((_OWORD *)v7 + 2);
      *((_OWORD *)v30 + 3) = v35;
      *(_OWORD *)long long v30 = v33;
      *((_OWORD *)v30 + 1) = v34;
      v30 += 64;
      v7 += 64;
      v31 -= 64;
    }
    while (v31);
    uint64_t v39 = v32;
    int64_t v5 = (char *)sub_1A7FC((void **)a1, (uint64_t)&__p, v5);
    if (v39 != v38) {
      v39 += (v38 - v39 + 63) & 0xFFFFFFFFFFFFFFC0;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 6;
  if (v20 >= a5)
  {
    id v21 = &__src[64 * a5];
    uint64_t v23 = *(char **)(v9 - 8);
LABEL_17:
    id v24 = &v5[64 * a5];
    long long v25 = &v23[-64 * a5];
    id v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      id v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        long long v28 = *((_OWORD *)v25 + 1);
        long long v29 = *((_OWORD *)v25 + 3);
        *((_OWORD *)v26 + 2) = *((_OWORD *)v25 + 2);
        *((_OWORD *)v26 + 3) = v29;
        *(_OWORD *)id v26 = v27;
        *((_OWORD *)v26 + 1) = v28;
        v26 += 64;
        v25 += 64;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-64 * ((v23 - v24) >> 6)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  id v21 = &__src[64 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[64 * v20], a4 - v21);
  }
  uint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_1A7C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1A7FC(void **a1, uint64_t a2, char *__src)
{
  int64_t v5 = *(void **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *((_OWORD *)v8 - 4);
      long long v11 = *((_OWORD *)v8 - 3);
      long long v12 = *((_OWORD *)v8 - 1);
      uint64_t v7 = (void *)(v9 - 64);
      *(_OWORD *)(v9 - 32) = *((_OWORD *)v8 - 2);
      *(_OWORD *)(v9 - 16) = v12;
      *(_OWORD *)(v9 - 64) = v10;
      *(_OWORD *)(v9 - 48) = v11;
      v8 -= 64;
      v9 -= 64;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  long long v13 = a1[1];
  uint64_t v14 = *(void *)(a2 + 16);
  int64_t v15 = v13 - __src;
  if (v13 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v13 - __src);
    uint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v14 + v15;
  uint64_t v16 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v16;
  unint64_t v17 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v17;
  id v18 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v18;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void sub_1A8DC(double *a1, double *a2, long long *a3, uint64_t a4)
{
  uint64_t v8 = ((char *)a2 - (char *)a1) >> 6;
  uint64_t v9 = ((char *)a3 - (char *)a2) >> 6;
  if (v9 >= v8) {
    uint64_t v10 = ((char *)a2 - (char *)a1) >> 6;
  }
  else {
    uint64_t v10 = ((char *)a3 - (char *)a2) >> 6;
  }
  long long v11 = (char *)sub_1A9AC(v10);
  sub_1AA10(a1, a2, a3, a4, v8, v9, v11, v12);
  if (v11)
  {
    operator delete(v11);
  }
}

void sub_1A994(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1A9AC(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x1FFFFFFFFFFFFFFLL) {
    unint64_t v1 = 0x1FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    __n128 result = operator new(v1 << 6, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

__n128 sub_1AA10(double *a1, double *a2, long long *a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v49 = a6;
  if (a6)
  {
    while (v49 > a8 && a5 > a8)
    {
      if (!a5) {
        return result;
      }
      unint64_t v14 = 0;
      uint64_t v15 = -a5;
      while (1)
      {
        uint64_t v16 = &a1[v14 / 8];
        if (HDActivityCacheStatisticsBuilderWorkoutSample::operator<(a2, &a1[v14 / 8])) {
          break;
        }
        v14 += 64;
        if (__CFADD__(v15++, 1)) {
          return result;
        }
      }
      uint64_t v19 = -v15;
      uint64_t v20 = v49;
      uint64_t v45 = a8;
      unint64_t v46 = a7;
      long long v47 = a3;
      if (-v15 >= v49)
      {
        if (v15 == -1)
        {
          uint64_t v39 = &a1[v14 / 8];
          __n128 v53 = *(__n128 *)&a1[v14 / 8 + 4];
          long long v54 = *(_OWORD *)&a1[v14 / 8 + 6];
          long long v51 = *(_OWORD *)&a1[v14 / 8];
          long long v52 = *(_OWORD *)&a1[v14 / 8 + 2];
          long long v40 = *(_OWORD *)a2;
          long long v41 = *((_OWORD *)a2 + 1);
          long long v42 = *((_OWORD *)a2 + 3);
          *((_OWORD *)v39 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)v39 + 3) = v42;
          *(_OWORD *)uint64_t v39 = v40;
          *((_OWORD *)v39 + 1) = v41;
          *(_OWORD *)a2 = v51;
          *((_OWORD *)a2 + 1) = v52;
          __n128 result = v53;
          *((__n128 *)a2 + 2) = v53;
          *((_OWORD *)a2 + 3) = v54;
          return result;
        }
        if (v15 > 0) {
          uint64_t v19 = 1 - v15;
        }
        uint64_t v26 = v19 >> 1;
        id v24 = &a1[8 * (v19 >> 1) + v14 / 8];
        uint64_t v23 = a2;
        if (a2 != (double *)a3)
        {
          uint64_t v44 = v19 >> 1;
          unint64_t v27 = ((char *)a3 - (char *)a2) >> 6;
          uint64_t v23 = a2;
          do
          {
            long long v28 = &v23[8 * (v27 >> 1)];
            BOOL v29 = HDActivityCacheStatisticsBuilderWorkoutSample::operator<(v28, v24);
            if (v29) {
              v27 += ~(v27 >> 1);
            }
            else {
              v27 >>= 1;
            }
            if (v29) {
              uint64_t v23 = v28 + 8;
            }
          }
          while (v27);
          uint64_t v20 = v49;
          uint64_t v26 = v44;
        }
        uint64_t v22 = ((char *)v23 - (char *)a2) >> 6;
      }
      else
      {
        if (v49 >= 0) {
          uint64_t v21 = v49;
        }
        else {
          uint64_t v21 = v49 + 1;
        }
        uint64_t v22 = v21 >> 1;
        uint64_t v23 = &a2[8 * (v21 >> 1)];
        id v24 = a2;
        if ((char *)a2 - (char *)a1 != v14)
        {
          uint64_t v43 = v21 >> 1;
          unint64_t v25 = (uint64_t)((char *)a2 - (char *)a1 - v14) >> 6;
          id v24 = &a1[v14 / 8];
          do
          {
            if (HDActivityCacheStatisticsBuilderWorkoutSample::operator<(v23, &v24[8 * (v25 >> 1)]))
            {
              v25 >>= 1;
            }
            else
            {
              v24 += 8 * (v25 >> 1) + 8;
              v25 += ~(v25 >> 1);
            }
          }
          while (v25);
          uint64_t v20 = v49;
          uint64_t v22 = v43;
        }
        uint64_t v26 = (uint64_t)((char *)v24 - (char *)a1 - v14) >> 6;
      }
      a5 = -v26 - v15;
      *(void *)uint64_t v50 = v20 - v22;
      long long v30 = (char *)a2;
      uint64_t v31 = v20;
      uint64_t v32 = v26;
      long long v33 = sub_1AF1C((char *)v24, v30, (char *)v23);
      uint64_t v34 = v22;
      a3 = (long long *)v33;
      if (v32 + v34 >= v31 - (v32 + v34) - v15)
      {
        uint64_t v38 = v32;
        uint64_t v37 = v34;
        a7 = v46;
        sub_1AA10(v33, v23, v47, a4, a5, *(void *)v50, v46, v45);
        a2 = v24;
        a8 = v45;
        a5 = v38;
      }
      else
      {
        long long v35 = v24;
        uint64_t v36 = v32;
        a8 = v45;
        a7 = v46;
        sub_1AA10(&a1[v14 / 8], v35, v33, a4, v36, v34, v46, v45);
        uint64_t v16 = (double *)a3;
        a2 = v23;
        a3 = v47;
        uint64_t v37 = *(void *)v50;
      }
      uint64_t v49 = v37;
      a1 = v16;
      if (!v37) {
        return result;
      }
    }
    sub_1AD50(a1, (long long *)a2, a3, a4, a5, v49, a7);
  }
  return result;
}

double *sub_1AD50(double *__dst, long long *a2, long long *a3, int a4, uint64_t a5, uint64_t a6, char *__src)
{
  uint64_t v9 = (double *)a2;
  uint64_t v10 = __dst;
  if (a5 <= a6)
  {
    if (__dst != (double *)a2)
    {
      uint64_t v22 = 0;
      do
      {
        uint64_t v23 = &__src[v22 * 8];
        long long v24 = *(_OWORD *)&__dst[v22];
        long long v25 = *(_OWORD *)&__dst[v22 + 2];
        long long v26 = *(_OWORD *)&__dst[v22 + 6];
        *((_OWORD *)v23 + 2) = *(_OWORD *)&__dst[v22 + 4];
        *((_OWORD *)v23 + 3) = v26;
        *(_OWORD *)uint64_t v23 = v24;
        *((_OWORD *)v23 + 1) = v25;
        v22 += 8;
      }
      while (&__dst[v22] != (double *)a2);
      if (v22 * 8)
      {
        unint64_t v27 = &__src[v22 * 8];
        long long v28 = (double *)__src;
        while (v9 != (double *)a3)
        {
          __dst = (double *)HDActivityCacheStatisticsBuilderWorkoutSample::operator<(v9, v28);
          if (__dst)
          {
            long long v29 = *(_OWORD *)v9;
            long long v30 = *((_OWORD *)v9 + 1);
            long long v31 = *((_OWORD *)v9 + 3);
            *((_OWORD *)v10 + 2) = *((_OWORD *)v9 + 2);
            *((_OWORD *)v10 + 3) = v31;
            *(_OWORD *)uint64_t v10 = v29;
            *((_OWORD *)v10 + 1) = v30;
            v9 += 8;
          }
          else
          {
            long long v32 = *(_OWORD *)v28;
            long long v33 = *((_OWORD *)v28 + 1);
            long long v34 = *((_OWORD *)v28 + 3);
            *((_OWORD *)v10 + 2) = *((_OWORD *)v28 + 2);
            *((_OWORD *)v10 + 3) = v34;
            *(_OWORD *)uint64_t v10 = v32;
            *((_OWORD *)v10 + 1) = v33;
            v28 += 8;
          }
          v10 += 8;
          if (v27 == (char *)v28) {
            return __dst;
          }
        }
        return (double *)memmove(v10, v28, __src - (char *)v28 + v22 * 8);
      }
    }
  }
  else if (a2 != a3)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = &__src[v11 * 16];
      long long v13 = a2[v11];
      long long v14 = a2[v11 + 1];
      long long v15 = a2[v11 + 3];
      *((_OWORD *)v12 + 2) = a2[v11 + 2];
      *((_OWORD *)v12 + 3) = v15;
      *(_OWORD *)uint64_t v12 = v13;
      *((_OWORD *)v12 + 1) = v14;
      v11 += 4;
    }
    while (&a2[v11] != a3);
    if (v11 * 16)
    {
      uint64_t v16 = (double *)&__src[v11 * 16];
      unint64_t v17 = a3 - 4;
      while (v9 != v10)
      {
        __dst = (double *)HDActivityCacheStatisticsBuilderWorkoutSample::operator<(v16 - 8, v9 - 8);
        if (__dst) {
          id v18 = (char *)(v9 - 8);
        }
        else {
          id v18 = (char *)(v16 - 8);
        }
        if (__dst) {
          v9 -= 8;
        }
        else {
          v16 -= 8;
        }
        long long v19 = *((_OWORD *)v18 + 3);
        long long v21 = *(_OWORD *)v18;
        long long v20 = *((_OWORD *)v18 + 1);
        v17[2] = *((_OWORD *)v18 + 2);
        v17[3] = v19;
        long long *v17 = v21;
        v17[1] = v20;
        v17 -= 4;
        if (v16 == (double *)__src) {
          return __dst;
        }
      }
      unint64_t v35 = 0;
      do
      {
        uint64_t v36 = &v17[v35 / 2];
        long long v37 = *(_OWORD *)&v16[v35 - 8];
        long long v38 = *(_OWORD *)&v16[v35 - 6];
        long long v39 = *(_OWORD *)&v16[v35 - 2];
        v36[2] = *(_OWORD *)&v16[v35 - 4];
        void v36[3] = v39;
        long long *v36 = v37;
        v36[1] = v38;
        v35 -= 8;
      }
      while (&v16[v35] != (double *)__src);
    }
  }
  return __dst;
}

char *sub_1AF1C(char *__src, char *a2, char *a3)
{
  id v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if (__src + 64 == a2)
    {
      long long v9 = *(_OWORD *)__src;
      long long v11 = *((_OWORD *)__src + 1);
      long long v13 = *((_OWORD *)__src + 2);
      long long v15 = *((_OWORD *)__src + 3);
      int64_t v6 = a3 - a2;
      memmove(__src, a2, a3 - a2);
      id v4 = &__src[v6];
      *(_OWORD *)id v4 = v9;
      *((_OWORD *)v4 + 1) = v11;
      *((_OWORD *)v4 + 2) = v13;
      *((_OWORD *)v4 + 3) = v15;
    }
    else if (a2 + 64 == a3)
    {
      id v4 = __src + 64;
      long long v10 = *((_OWORD *)a3 - 4);
      long long v12 = *((_OWORD *)a3 - 3);
      long long v14 = *((_OWORD *)a3 - 2);
      long long v16 = *((_OWORD *)a3 - 1);
      size_t v7 = a3 - 64 - __src;
      if (a3 - 64 != __src) {
        memmove(__src + 64, __src, v7);
      }
      *(_OWORD *)HDActivityCacheStatisticsBuilderSample __src = v10;
      *((_OWORD *)__src + 1) = v12;
      *((_OWORD *)__src + 2) = v14;
      *((_OWORD *)__src + 3) = v16;
    }
    else
    {
      return sub_1B044(__src, a2, a3);
    }
  }
  return v4;
}

char *sub_1B044(char *a1, char *a2, char *a3)
{
  uint64_t v3 = (a2 - a1) >> 6;
  if (v3 == (a3 - a2) >> 6)
  {
    if (a1 != a2 && a2 != a3)
    {
      id v4 = a1 + 64;
      int64_t v5 = a2 + 64;
      do
      {
        long long v7 = *((_OWORD *)v4 - 2);
        long long v6 = *((_OWORD *)v4 - 1);
        long long v9 = *((_OWORD *)v4 - 4);
        long long v8 = *((_OWORD *)v4 - 3);
        long long v10 = *((_OWORD *)v5 - 1);
        long long v12 = *((_OWORD *)v5 - 4);
        long long v11 = *((_OWORD *)v5 - 3);
        *((_OWORD *)v4 - 2) = *((_OWORD *)v5 - 2);
        *((_OWORD *)v4 - 1) = v10;
        *((_OWORD *)v4 - 4) = v12;
        *((_OWORD *)v4 - 3) = v11;
        *((_OWORD *)v5 - 4) = v9;
        *((_OWORD *)v5 - 3) = v8;
        *((_OWORD *)v5 - 2) = v7;
        *((_OWORD *)v5 - 1) = v6;
        if (v4 == a2) {
          break;
        }
        v4 += 64;
        BOOL v13 = v5 == a3;
        v5 += 64;
      }
      while (!v13);
    }
  }
  else
  {
    uint64_t v14 = (a3 - a2) >> 6;
    uint64_t v15 = (a2 - a1) >> 6;
    do
    {
      uint64_t v16 = v15;
      uint64_t v15 = v14;
      uint64_t v14 = v16 % v14;
    }
    while (v14);
    if (v15)
    {
      unint64_t v17 = &a1[64 * v15];
      do
      {
        long long v18 = *((_OWORD *)v17 - 4);
        long long v19 = *((_OWORD *)v17 - 3);
        long long v20 = *((_OWORD *)v17 - 2);
        long long v21 = *((_OWORD *)v17 - 1);
        v17 -= 64;
        long long v34 = v18;
        long long v35 = v19;
        long long v36 = v21;
        uint64_t v22 = &v17[64 * v3];
        uint64_t v23 = v17;
        do
        {
          long long v24 = v22;
          long long v25 = *(_OWORD *)v22;
          long long v26 = *((_OWORD *)v22 + 1);
          long long v27 = *((_OWORD *)v22 + 3);
          *((_OWORD *)v23 + 2) = *((_OWORD *)v22 + 2);
          *((_OWORD *)v23 + 3) = v27;
          *(_OWORD *)uint64_t v23 = v25;
          *((_OWORD *)v23 + 1) = v26;
          uint64_t v28 = a3 - v22;
          v22 += 64 * v3;
          BOOL v29 = __OFSUB__(v3, v28 >> 6);
          uint64_t v31 = v3 - (v28 >> 6);
          char v30 = (v31 < 0) ^ v29;
          long long v32 = &a1[64 * v31];
          if (!v30) {
            uint64_t v22 = v32;
          }
          uint64_t v23 = v24;
        }
        while (v22 != v17);
        *((_OWORD *)v24 + 2) = v20;
        *((_OWORD *)v24 + 3) = v36;
        *(_OWORD *)long long v24 = v34;
        *((_OWORD *)v24 + 1) = v35;
      }
      while (v17 != a1);
    }
    return &a1[64 * ((a3 - a2) >> 6)];
  }
  return a2;
}

void HDActivityCacheStatisticsBuilderSample::HDActivityCacheStatisticsBuilderSample(HDActivityCacheStatisticsBuilderSample *this, double a2, double a3, double a4, int64_t a5)
{
  this->var0 = a2;
  this->var1 = a3;
  this->var2 = a4;
  this->var3 = a5;
}

{
  this->var0 = a2;
  this->var1 = a3;
  this->var2 = a4;
  this->var3 = a5;
}

BOOL HDActivityCacheStatisticsBuilderSample::operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL HDActivityCacheStatisticsBuilderSample::operator>(double *a1, double *a2)
{
  return *a1 > *a2;
}

BOOL HDActivityCacheStatisticsBuilderSample::operator<=(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL HDActivityCacheStatisticsBuilderSample::operator>=(double *a1, double *a2)
{
  return *a1 >= *a2;
}

void HDActivityCacheStatisticsBuilderWorkoutSample::HDActivityCacheStatisticsBuilderWorkoutSample(HDActivityCacheStatisticsBuilderWorkoutSample *this, double a2, double a3, uint64_t a4, char a5, char a6, uint64_t a7, uint64_t a8, NSUUID *a9)
{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((void *)this + 2) = a4;
  *((unsigned char *)this + 24) = a5;
  *((unsigned char *)this + 25) = a6;
  *((void *)this + 4) = a7;
  *((void *)this + 5) = a8;
  [(NSUUID *)a9 getUUIDBytes:(char *)this + 48];
}

{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  *((void *)this + 2) = a4;
  *((unsigned char *)this + 24) = a5;
  *((unsigned char *)this + 25) = a6;
  *((void *)this + 4) = a7;
  *((void *)this + 5) = a8;
  [(NSUUID *)a9 getUUIDBytes:(char *)this + 48];
}

BOOL HDActivityCacheStatisticsBuilderWorkoutSample::operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL HDActivityCacheStatisticsBuilderWorkoutSample::operator>(double *a1, double *a2)
{
  return *a1 > *a2;
}

BOOL HDActivityCacheStatisticsBuilderWorkoutSample::operator<=(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL HDActivityCacheStatisticsBuilderWorkoutSample::operator>=(double *a1, double *a2)
{
  return *a1 >= *a2;
}

void HDActivityCacheStatisticsBuilderBreatheSample::HDActivityCacheStatisticsBuilderBreatheSample(HDActivityCacheStatisticsBuilderBreatheSample *this, double a2, double a3, NSUUID *a4)
{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  [(NSUUID *)a4 getUUIDBytes:(char *)this + 16];
}

{
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  [(NSUUID *)a4 getUUIDBytes:(char *)this + 16];
}

BOOL HDActivityCacheStatisticsBuilderBreatheSample::operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL HDActivityCacheStatisticsBuilderBreatheSample::operator>(double *a1, double *a2)
{
  return *a1 > *a2;
}

BOOL HDActivityCacheStatisticsBuilderBreatheSample::operator<=(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL HDActivityCacheStatisticsBuilderBreatheSample::operator>=(double *a1, double *a2)
{
  return *a1 >= *a2;
}

BOOL HDActivityCacheStatisticsBuilderStandHourSample::operator<(_DWORD *a1, _DWORD *a2)
{
  BOOL v2 = *a1 < *a2;
  if (*a1 == *a2) {
    return a1[1] < a2[1];
  }
  return v2;
}

BOOL HDActivityCacheStatisticsBuilderStandHourSample::operator>(_DWORD *a1, _DWORD *a2)
{
  BOOL v2 = *a1 <= *a2;
  if (*a1 == *a2) {
    BOOL v2 = a1[1] <= a2[1];
  }
  return !v2;
}

BOOL HDActivityCacheStatisticsBuilderStandHourSample::operator<=(_DWORD *a1, _DWORD *a2)
{
  BOOL v2 = *a1 <= *a2;
  if (*a1 == *a2) {
    return a1[1] <= a2[1];
  }
  return v2;
}

BOOL HDActivityCacheStatisticsBuilderStandHourSample::operator>=(_DWORD *a1, _DWORD *a2)
{
  BOOL v2 = *a1 < *a2;
  if (*a1 == *a2) {
    BOOL v2 = a1[1] < a2[1];
  }
  return !v2;
}

void sub_1B4FC(_Unwind_Exception *a1)
{
  int64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5C4(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a1)
  {
    uint64_t v7 = +[HKObjectType dataTypeWithCode:a2];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
    uint64_t v28 = (void *)v7;
    long long v9 = [WeakRetained activityCacheStatisticsBuilder:a1 sourceOrderForObjectType:v7];
    context = v6;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "longLongValue", context);
          id v15 = v14;
          unint64_t v17 = a3[1];
          unint64_t v16 = (unint64_t)a3[2];
          if ((unint64_t)v17 >= v16)
          {
            long long v19 = *a3;
            uint64_t v20 = (v17 - *a3) >> 3;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 61) {
              sub_DCEC();
            }
            uint64_t v22 = v16 - (void)v19;
            if (v22 >> 2 > v21) {
              unint64_t v21 = v22 >> 2;
            }
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v23 = v21;
            }
            if (v23)
            {
              long long v24 = (char *)sub_DD04((uint64_t)(a3 + 2), v23);
              long long v19 = *a3;
              unint64_t v17 = a3[1];
            }
            else
            {
              long long v24 = 0;
            }
            long long v25 = &v24[8 * v20];
            *(void *)long long v25 = v15;
            long long v18 = v25 + 8;
            while (v17 != v19)
            {
              uint64_t v26 = *((void *)v17 - 1);
              v17 -= 8;
              *((void *)v25 - 1) = v26;
              v25 -= 8;
            }
            *a3 = v25;
            a3[1] = v18;
            a3[2] = &v24[8 * v23];
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            *(void *)unint64_t v17 = v14;
            long long v18 = v17 + 8;
          }
          a3[1] = v18;
        }
        id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }
  }
}

void sub_1B7EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_240CC();
    }
    __cxa_rethrow();
  }
  uint64_t v12 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + 8) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B87C()
{
}

void sub_1B898(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_6710(a1);
  }
  _Unwind_Resume(a1);
}

void sub_1B9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

double sub_1BA1C(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0.0;
  }
  long long v6 = +[NSDate distantPast];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  long long v9 = +[NSDate distantFuture];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  __p = 0;
  id v15 = 0;
  uint64_t v16 = 0;
  sub_E25C(&__p, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
  double v12 = sub_1D67C(a1, a2, (uint64_t)&__p, v8, v11);
  if (__p)
  {
    id v15 = __p;
    operator delete(__p);
  }
  return v12;
}

void sub_1BAF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BC14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1BEA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BFCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C0F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t HDActivityCacheStatisticsBuilderStandHoursStatisticsForSamples(uint64_t *a1)
{
  double v8 = 0;
  uint64_t v9 = 0;
  double v7 = (uint64_t *)&v8;
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1 == v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    do
    {
      uint64_t v6 = *(void *)v1;
      if (!*(_DWORD *)(v1 + 8)) {
        sub_21618(&v7, (int *)&v6, &v6);
      }
      v1 += 24;
    }
    while (v1 != v2);
    uint64_t v3 = v8;
    uint64_t v4 = v9;
  }
  sub_20374((uint64_t)&v7, v3);
  return v4;
}

void sub_1C378(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1C3B8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (uint64_t *)(a1 + 152);
    if (*(void *)(a1 + 160) == *(void *)(a1 + 152))
    {
      __p = 0;
      long long v33 = 0;
      long long v34 = 0;
      uint64_t v3 = *(long long **)(a1 + 8);
      uint64_t v4 = *(long long **)(a1 + 16);
      if (v3 != v4)
      {
        int64_t v5 = 0;
        do
        {
          if (*((unsigned char *)v3 + 24)) {
            BOOL v6 = *((unsigned char *)v3 + 25) == 0;
          }
          else {
            BOOL v6 = 0;
          }
          if (!v6)
          {
            if (v5 >= v34)
            {
              double v10 = (char *)__p;
              uint64_t v11 = (v5 - (unsigned char *)__p) >> 6;
              unint64_t v12 = v11 + 1;
              if ((unint64_t)(v11 + 1) >> 58) {
                sub_DCEC();
              }
              uint64_t v13 = v34 - (unsigned char *)__p;
              if ((v34 - (unsigned char *)__p) >> 5 > v12) {
                unint64_t v12 = v13 >> 5;
              }
              if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFC0) {
                unint64_t v14 = 0x3FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v14 = v12;
              }
              if (v14)
              {
                id v15 = (char *)sub_DF50((uint64_t)&v34, v14);
                double v10 = (char *)__p;
                int64_t v5 = v33;
              }
              else
              {
                id v15 = 0;
              }
              uint64_t v16 = &v15[64 * v11];
              long long v17 = *v3;
              long long v18 = v3[1];
              long long v19 = v3[3];
              *((_OWORD *)v16 + 2) = v3[2];
              *((_OWORD *)v16 + 3) = v19;
              *(_OWORD *)uint64_t v16 = v17;
              *((_OWORD *)v16 + 1) = v18;
              if (v5 == v10)
              {
                long long v24 = &v15[64 * v11];
              }
              else
              {
                uint64_t v20 = &v15[64 * v11];
                do
                {
                  long long v21 = *((_OWORD *)v5 - 4);
                  long long v22 = *((_OWORD *)v5 - 3);
                  long long v23 = *((_OWORD *)v5 - 1);
                  long long v24 = v20 - 64;
                  *((_OWORD *)v20 - 2) = *((_OWORD *)v5 - 2);
                  *((_OWORD *)v20 - 1) = v23;
                  *((_OWORD *)v20 - 4) = v21;
                  *((_OWORD *)v20 - 3) = v22;
                  v5 -= 64;
                  v20 -= 64;
                }
                while (v5 != v10);
              }
              int64_t v5 = v16 + 64;
              __p = v24;
              long long v33 = v16 + 64;
              long long v34 = &v15[64 * v14];
              if (v10) {
                operator delete(v10);
              }
            }
            else
            {
              long long v7 = *v3;
              long long v8 = v3[1];
              long long v9 = v3[3];
              *((_OWORD *)v5 + 2) = v3[2];
              *((_OWORD *)v5 + 3) = v9;
              *(_OWORD *)int64_t v5 = v7;
              *((_OWORD *)v5 + 1) = v8;
              v5 += 64;
            }
            long long v33 = v5;
          }
          v3 += 4;
        }
        while (v3 != v4);
      }
      long long v25 = objc_alloc_init(HDActivityCacheActiveSourceCalculator);
      uint64_t v26 = +[_HKBehavior sharedBehavior];
      unsigned int v27 = [v26 isStandalonePhoneFitnessMode];

      if (v27)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 232));
        id v29 = [WeakRetained localDeviceSourceIdentifier];

        [(HDActivityCacheActiveSourceCalculator *)v25 setLocalDeviceSourceIdentifier:v29];
      }
      [(HDActivityCacheActiveSourceCalculator *)v25 setWorkouts:&__p];
      [(HDActivityCacheActiveSourceCalculator *)v25 setActivationLogEntries:a1 + 56];
      if (v25)
      {
        [(HDActivityCacheActiveSourceCalculator *)v25 createActiveSourceLog];
      }
      else
      {
        long long v30 = 0uLL;
        uint64_t v31 = 0;
      }
      sub_E110(v2);
      *(_OWORD *)(a1 + 152) = v30;
      *(void *)(a1 + 168) = v31;
      uint64_t v31 = 0;
      long long v30 = 0uLL;
      long long v35 = (void **)&v30;
      sub_F994(&v35);

      if (__p)
      {
        long long v33 = (char *)__p;
        operator delete(__p);
      }
    }
  }
}

void sub_1C60C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
}

void sub_1C6A4()
{
}

void sub_1C6B8(void *a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  if (a2 <= 69)
  {
    switch(a2)
    {
      case 7:
        uint64_t v2 = (void *)a1[14];
        a1[14] = 0;
        goto LABEL_17;
      case 8:
        uint64_t v2 = (void *)a1[12];
        a1[12] = 0;
        goto LABEL_17;
      case 10:
        uint64_t v2 = (void *)a1[10];
        a1[10] = 0;
        goto LABEL_17;
      case 12:
        uint64_t v2 = (void *)a1[13];
        a1[13] = 0;
        goto LABEL_17;
      default:
        goto LABEL_20;
    }
  }
  if (a2 > 100)
  {
    if (a2 == 101)
    {
      uint64_t v2 = (void *)a1[15];
      a1[15] = 0;
      goto LABEL_17;
    }
    if (a2 == 179)
    {
      uint64_t v2 = (void *)a1[11];
      a1[11] = 0;
      goto LABEL_17;
    }
  }
  else
  {
    if (a2 == 70)
    {
      uint64_t v2 = (void *)a1[16];
      a1[16] = 0;
      goto LABEL_17;
    }
    if (a2 == 75)
    {
      uint64_t v2 = (void *)a1[17];
      a1[17] = 0;
LABEL_17:

      return;
    }
  }
LABEL_20:
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_ERROR)) {
    sub_242AC();
  }
}

void sub_1C7F8(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[10];
    a1[10] = 0;

    uint64_t v3 = (void *)a1[11];
    a1[11] = 0;

    uint64_t v4 = (void *)a1[12];
    a1[12] = 0;

    int64_t v5 = (void *)a1[13];
    a1[13] = 0;

    BOOL v6 = (void *)a1[14];
    a1[14] = 0;

    long long v7 = (void *)a1[15];
    a1[15] = 0;

    long long v8 = (void *)a1[16];
    a1[16] = 0;

    long long v9 = (void *)a1[17];
    a1[17] = 0;
  }
}

void sub_1CB54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_24460();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1CBD4(uint64_t a1@<X0>, double **a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a1)
  {
    uint64_t v3 = *a2;
    uint64_t v4 = a2[1];
    if (*a2 != v4)
    {
      uint64_t v6 = (uint64_t)(a3 + 2);
      do
      {
        double v7 = *v3;
        uint64_t v8 = *((void *)v3 + 3);
        uint64_t v20 = 0;
        long long v21 = 0;
        uint64_t v22 = 0;
        HDActivityCacheActiveSource::HDActivityCacheActiveSource(&v23, v8, &v20, v7);
        unint64_t v9 = a3[1];
        unint64_t v10 = a3[2];
        if (v9 >= v10)
        {
          unint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v9 - *a3) >> 3);
          unint64_t v12 = v11 + 1;
          if (v11 + 1 > 0x666666666666666) {
            sub_DCEC();
          }
          unint64_t v13 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v10 - *a3) >> 3);
          if (2 * v13 > v12) {
            unint64_t v12 = 2 * v13;
          }
          if (v13 >= 0x333333333333333) {
            unint64_t v14 = 0x666666666666666;
          }
          else {
            unint64_t v14 = v12;
          }
          v26[4] = v6;
          id v15 = (char *)sub_E420(v6, v14);
          uint64_t v16 = &v15[40 * v11];
          v26[0] = v15;
          v26[1] = v16;
          v26[3] = &v15[40 * v17];
          *(_OWORD *)uint64_t v16 = v23;
          *((void *)v16 + 3) = 0;
          *((void *)v16 + 4) = 0;
          *((void *)v16 + 2) = 0;
          *((_OWORD *)v16 + 1) = *(_OWORD *)__p;
          *((void *)v16 + 4) = v25;
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v25 = 0;
          v26[2] = v16 + 40;
          sub_F59C(a3, v26);
          uint64_t v18 = a3[1];
          sub_F748((uint64_t)v26);
          long long v19 = __p[0];
          a3[1] = v18;
          if (v19)
          {
            __p[1] = v19;
            operator delete(v19);
          }
        }
        else
        {
          *(_OWORD *)unint64_t v9 = v23;
          *(void *)(v9 + 24) = 0;
          *(void *)(v9 + 32) = 0;
          *(void *)(v9 + 16) = 0;
          *(_OWORD *)(v9 + 16) = *(_OWORD *)__p;
          *(void *)(v9 + 32) = v25;
          __p[0] = 0;
          __p[1] = 0;
          uint64_t v25 = 0;
          a3[1] = v9 + 40;
        }
        if (v20)
        {
          long long v21 = v20;
          operator delete(v20);
        }
        v3 += 4;
      }
      while (v3 != v4);
    }
  }
}

void sub_1CD90(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_1CE28()
{
}

double *sub_1CEC4(double *result, uint64_t a2, uint64_t *a3, int a4)
{
  if (result)
  {
    double v7 = result;
    double v8 = result[25];
    double v9 = *(double *)(a2 + 8);
    if (*(double *)a2 >= v8) {
      double v10 = *(double *)a2;
    }
    else {
      double v10 = result[25];
    }
    double v11 = result[28];
    uint64_t v12 = vcvtmd_s64_f64((v10 - v8) / v11);
    if (result[26] >= v9) {
      double v13 = *(double *)(a2 + 8);
    }
    else {
      double v13 = result[26];
    }
    uint64_t v14 = vcvtmd_s64_f64((v13 - v8) / v11);
    if (v14 == v12)
    {
      return (double *)sub_1E948(a3, v12, *(void *)(a2 + 24), a4, *(double *)(a2 + 16));
    }
    else
    {
      uint64_t v15 = v14 - v12;
      if (v14 >= v12)
      {
        uint64_t v16 = 0;
        double v17 = (double)v14;
        double v18 = *(double *)(a2 + 16) / (v9 - *(double *)a2);
        do
        {
          if (v16)
          {
            if (v15 == v16) {
              double v19 = v13 - (v7[25] + v17 * v7[28]);
            }
            else {
              double v19 = v7[28];
            }
          }
          else
          {
            double v19 = v7[25] + (double)(v12 + 1) * v7[28] - v10;
          }
          __n128 result = (double *)sub_1E948(a3, v12 + v16++, *(void *)(a2 + 24), a4, v18 * v19);
        }
        while (v15 + 1 != v16);
      }
    }
  }
  return result;
}

void sub_1D000(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_245A0();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

double *sub_1D0E4(double *result, long long **a2, uint64_t *a3, int a4)
{
  if (result)
  {
    uint64_t v4 = *a2;
    int64_t v5 = a2[1];
    if (*a2 != v5)
    {
      double v8 = result;
      do
      {
        long long v9 = *v4;
        long long v10 = v4[1];
        v4 += 2;
        v11[0] = v9;
        v11[1] = v10;
        __n128 result = sub_1CEC4(v8, (uint64_t)v11, a3, a4);
      }
      while (v4 != v5);
    }
  }
  return result;
}

void sub_1D4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_24640();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

double sub_1D628(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v2 = (void *)(a2 + 8);
  uint64_t v3 = v4;
  if (v4)
  {
    do
    {
      int64_t v5 = v3;
      uint64_t v3 = (void *)v3[1];
    }
    while (v3);
  }
  else
  {
    do
    {
      int64_t v5 = (void *)v2[2];
      BOOL v6 = *v5 == (void)v2;
      uint64_t v2 = v5;
    }
    while (v6);
  }
  return *(double *)(a1 + 200) + (double)(v5[4] + 1) * *(double *)(a1 + 224);
}

double sub_1D67C(uint64_t a1, void *a2, uint64_t a3, double a4, double a5)
{
  double v5 = 0.0;
  if (a1)
  {
    sub_1C3B8(a1);
    double v13 = (void *)*a2;
    double v11 = a2 + 1;
    uint64_t v12 = v13;
    if (v13 != v11)
    {
      double v14 = *(double *)(a1 + 200);
      double v15 = *(double *)(a1 + 224);
      int64_t v16 = vcvtmd_s64_f64((a4 - v14) / v15);
      int64_t v17 = vcvtmd_s64_f64((a5 - v14) / v15);
      double v19 = *(double **)(a1 + 152);
      double v18 = *(double **)(a1 + 160);
      uint64_t v20 = &v19[5 * (v19 != v18)];
      while (1)
      {
        uint64_t v21 = v12[4];
        if (v21 >= v16) {
          break;
        }
        uint64_t v22 = (void *)v12[1];
        if (v22)
        {
          do
          {
            uint64_t v12 = v22;
            uint64_t v22 = (void *)*v22;
          }
          while (v22);
        }
        else
        {
          do
          {
            long long v23 = v12;
            uint64_t v12 = (void *)v12[2];
          }
          while ((void *)*v12 != v23);
        }
LABEL_99:
        if (v12 == v11) {
          return v5;
        }
      }
      if (v21 > v17) {
        return v5;
      }
      double v24 = *(double *)(a1 + 200);
      double v25 = *(double *)(a1 + 224);
      if (v16 == v17)
      {
        double v26 = (a5 - a4) / v25;
      }
      else
      {
        double v27 = v24 + (double)v21 * v25;
        if (v21 == v16)
        {
          double v26 = 1.0 - (a4 - v27) / v25;
        }
        else
        {
          double v26 = 1.0;
          if (v21 == v17) {
            double v26 = (a5 - v27) / v25;
          }
        }
      }
      if (v20 == v18)
      {
        uint64_t v20 = v18;
      }
      else
      {
        double v28 = v24 + (double)(v21 + 1) * v25;
        if (v28 >= *v20)
        {
          id v29 = v20 + 5;
          while (1)
          {
            long long v30 = v29;
            if (v29 == v18) {
              break;
            }
            v29 += 5;
            if (v28 < *v30)
            {
              uint64_t v20 = v30;
              goto LABEL_25;
            }
          }
          uint64_t v20 = v18;
LABEL_25:
          double v19 = v30 - 5;
        }
      }
      __p = 0;
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      sub_E25C(&__p, *(const void **)a3, *(void *)(a3 + 8), (uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 3);
      long long v32 = (uint64_t *)*((void *)v19 + 2);
      uint64_t v31 = (uint64_t *)*((void *)v19 + 3);
      if (v31 == v32)
      {
LABEL_38:
        long long v39 = (double *)(v12 + 6);
        uint64_t v40 = v12[6];
        if (!v40) {
          goto LABEL_48;
        }
        uint64_t v41 = *((void *)v19 + 1);
        long long v34 = (double *)(v12 + 6);
        long long v42 = (void *)v12[6];
        do
        {
          uint64_t v43 = v42[4];
          BOOL v44 = v43 < v41;
          if (v43 >= v41) {
            uint64_t v45 = v42;
          }
          else {
            uint64_t v45 = v42 + 1;
          }
          if (!v44) {
            long long v34 = (double *)v42;
          }
          long long v42 = (void *)*v45;
        }
        while (*v45);
        if (v34 == v39 || v41 < *((void *)v34 + 4))
        {
LABEL_48:
          unint64_t v46 = (uint64_t *)__p;
          if (__p == v69)
          {
LABEL_71:
            uint64_t v57 = (double *)v12[5];
            double v58 = 0.0;
            if (v57 != v39)
            {
              do
              {
                if (v58 < v57[5]) {
                  double v58 = v57[5];
                }
                uint64_t v59 = (double *)*((void *)v57 + 1);
                if (v59)
                {
                  do
                  {
                    long long v60 = v59;
                    uint64_t v59 = *(double **)v59;
                  }
                  while (v59);
                }
                else
                {
                  do
                  {
                    long long v60 = (double *)*((void *)v57 + 2);
                    BOOL v61 = *(void *)v60 == (void)v57;
                    uint64_t v57 = v60;
                  }
                  while (!v61);
                }
                uint64_t v57 = v60;
              }
              while (v60 != v39);
            }
            long long v62 = (double *)v12[8];
            if (v62 != (double *)(v12 + 9))
            {
              do
              {
                if (v58 < v62[5]) {
                  double v58 = v62[5];
                }
                uint64_t v63 = (double *)*((void *)v62 + 1);
                if (v63)
                {
                  do
                  {
                    uint64_t v64 = v63;
                    uint64_t v63 = *(double **)v63;
                  }
                  while (v63);
                }
                else
                {
                  do
                  {
                    uint64_t v64 = (double *)*((void *)v62 + 2);
                    BOOL v61 = *(void *)v64 == (void)v62;
                    long long v62 = v64;
                  }
                  while (!v61);
                }
                long long v62 = v64;
              }
              while (v64 != (double *)(v12 + 9));
            }
            goto LABEL_91;
          }
          long long v47 = (uint64_t *)__p;
          while (1)
          {
            uint64_t v48 = *v47;
            if (v40)
            {
              long long v34 = (double *)(v12 + 6);
              uint64_t v49 = (void *)v12[6];
              do
              {
                uint64_t v50 = v49[4];
                BOOL v51 = v50 < v48;
                if (v50 >= v48) {
                  long long v52 = v49;
                }
                else {
                  long long v52 = v49 + 1;
                }
                if (!v51) {
                  long long v34 = (double *)v49;
                }
                uint64_t v49 = (void *)*v52;
              }
              while (*v52);
              if (v34 != v39 && v48 >= *((void *)v34 + 4)) {
                break;
              }
            }
            if (v12[9])
            {
              long long v34 = (double *)(v12 + 9);
              __n128 v53 = (void *)v12[9];
              do
              {
                uint64_t v54 = v53[4];
                BOOL v55 = v54 < v48;
                if (v54 >= v48) {
                  uint64_t v56 = v53;
                }
                else {
                  uint64_t v56 = v53 + 1;
                }
                if (!v55) {
                  long long v34 = (double *)v53;
                }
                __n128 v53 = (void *)*v56;
              }
              while (*v56);
              if (v34 != (double *)(v12 + 9) && v48 >= *((void *)v34 + 4)) {
                break;
              }
            }
            if (++v47 == v69) {
              goto LABEL_71;
            }
          }
        }
      }
      else
      {
        while (1)
        {
          --v31;
          if (v12[9])
          {
            uint64_t v33 = *v31;
            long long v34 = (double *)(v12 + 9);
            long long v35 = (void *)v12[9];
            do
            {
              uint64_t v36 = v35[4];
              BOOL v37 = v36 < v33;
              if (v36 >= v33) {
                long long v38 = v35;
              }
              else {
                long long v38 = v35 + 1;
              }
              if (!v37) {
                long long v34 = (double *)v35;
              }
              long long v35 = (void *)*v38;
            }
            while (*v38);
            if (v34 != (double *)(v12 + 9) && v33 >= *((void *)v34 + 4)) {
              break;
            }
          }
          if (v31 == v32) {
            goto LABEL_38;
          }
        }
      }
      double v58 = v34[5];
      unint64_t v46 = (uint64_t *)__p;
LABEL_91:
      if (v46)
      {
        uint64_t v69 = v46;
        operator delete(v46);
      }
      long long v65 = (void *)v12[1];
      if (v65)
      {
        do
        {
          uint64_t v66 = v65;
          long long v65 = (void *)*v65;
        }
        while (v65);
      }
      else
      {
        do
        {
          uint64_t v66 = (void *)v12[2];
          BOOL v61 = *v66 == (void)v12;
          uint64_t v12 = v66;
        }
        while (!v61);
      }
      double v5 = v5 + v58 * v26;
      uint64_t v12 = v66;
      goto LABEL_99;
    }
  }
  return v5;
}

void sub_1DA94(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(exception_object);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_246E0();
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id sub_1DAF8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v43 = v7;
    id v44 = v8;
    id v46 = objc_alloc_init((Class)NSMutableArray);
    id v52 = [v7 code];
    uint64_t v45 = [v7 canonicalUnit];
    sub_1B5C4(a1, (uint64_t)v52, (char **)&v50);
    long long v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 200)];
    double v11 = [v9 dateByAddingComponents:v8 toDate:v10 options:0];
    uint64_t v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 208)];
    __n128 v53 = &v52;
    double v13 = sub_20488((uint64_t **)(a1 + 176), (uint64_t *)&v52, (uint64_t)&std::piecewise_construct, (uint64_t **)&v53);
    uint64_t v42 = v13[7];
    if (v42)
    {
      double v14 = v13 + 5;
      uint64_t v17 = v13[6];
      double v15 = v13 + 6;
      int64_t v16 = (uint64_t *)v17;
      double v18 = *(double *)(a1 + 200);
      double v19 = *(double *)(a1 + 224);
      double v20 = (double)*(uint64_t *)(*(v15 - 1) + 32);
      if (v17)
      {
        do
        {
          uint64_t v21 = v16;
          int64_t v16 = (uint64_t *)v16[1];
        }
        while (v16);
      }
      else
      {
        do
        {
          uint64_t v21 = (uint64_t *)v15[2];
          BOOL v22 = *v21 == (void)v15;
          double v15 = v21;
        }
        while (v22);
      }
      double v23 = v18 + v20 * v19;
      double v24 = v18 + (double)(v21[4] + 1) * v19;
      while (1)
      {
        [v10 timeIntervalSinceReferenceDate];
        double v26 = v25;
        [v12 timeIntervalSinceReferenceDate];
        if (v26 >= v27) {
          break;
        }
        [v10 timeIntervalSinceReferenceDate];
        double v29 = v28;
        [v11 timeIntervalSinceReferenceDate];
        if (v29 >= v24) {
          break;
        }
        double v31 = v30;
        if (v30 > v23)
        {
          __p = 0;
          uint64_t v48 = 0;
          uint64_t v49 = 0;
          sub_E25C(&__p, v50, (uint64_t)v51, (v51 - (unsigned char *)v50) >> 3);
          double v32 = sub_1D67C(a1, v14, (uint64_t)&__p, v29, v31);
          if (__p)
          {
            uint64_t v48 = __p;
            operator delete(__p);
          }
          id v33 = objc_alloc((Class)_HKActivityStatisticsQuantityInfo);
          long long v34 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v29];
          long long v35 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v31];
          id v36 = [v33 initWithStartDate:v34 endDate:v35];

          id v8 = v44;
          BOOL v37 = +[HKQuantity quantityWithUnit:v45 doubleValue:v32];
          [v36 setQuantityValue:v37];

          [v46 addObject:v36];
        }
        id v38 = v11;

        uint64_t v39 = [v9 dateByAddingComponents:v8 toDate:v38 options:0];

        double v11 = (void *)v39;
        long long v10 = v38;
      }
    }

    if (v50)
    {
      BOOL v51 = v50;
      operator delete(v50);
    }

    id v7 = v43;
    if (v42)
    {
      uint64_t v40 = +[NSArray arrayWithArray:v46];
    }
    else
    {
      uint64_t v40 = &__NSArray0__struct;
    }
  }
  else
  {
    uint64_t v40 = 0;
  }

  return v40;
}

void sub_1DE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  _Unwind_Resume(a1);
}

void sub_1E070(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E128(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1E600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_FAULT)) {
      sub_24820();
    }
    __cxa_rethrow();
  }

  _Unwind_Resume(a1);
}

void sub_1E6AC()
{
}

void sub_1E8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_1E948(uint64_t *result, uint64_t a2, uint64_t a3, int a4, double a5)
{
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  if (a5 >= 0.0)
  {
    long long v10 = &v9;
    id v7 = sub_200AC((uint64_t **)result, &v9, (uint64_t)&std::piecewise_construct, &v10);
    long long v10 = &v8;
    if (a4) {
      __n128 result = sub_203C8((uint64_t **)v7 + 8, &v8, (uint64_t)&std::piecewise_construct, &v10);
    }
    else {
      __n128 result = sub_203C8((uint64_t **)v7 + 5, &v8, (uint64_t)&std::piecewise_construct, &v10);
    }
    *((double *)result + 5) = *((double *)result + 5) + a5;
  }
  return result;
}

char *sub_1EBC4(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  double v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  id v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 3)) < a5)
  {
    double v13 = *(void **)a1;
    unint64_t v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 > 0xAAAAAAAAAAAAAAALL) {
      sub_DCEC();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((__dst - (uint64_t)v13) >> 3);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - (uint64_t)v13) >> 3);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v14) {
      uint64_t v17 = v14;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v18 = v17;
    }
    uint64_t v37 = v9;
    if (v18) {
      double v19 = (char *)sub_E468(v9, v18);
    }
    else {
      double v19 = 0;
    }
    double v28 = &v19[24 * v15];
    __p = v19;
    long long v34 = v28;
    id v36 = &v19[24 * v18];
    double v29 = &v28[24 * a5];
    uint64_t v30 = 24 * a5;
    do
    {
      long long v31 = *(_OWORD *)v7;
      *((void *)v28 + 2) = *((void *)v7 + 2);
      *(_OWORD *)double v28 = v31;
      v28 += 24;
      v7 += 24;
      v30 -= 24;
    }
    while (v30);
    long long v35 = v29;
    double v5 = (char *)sub_1EE60((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      long long v35 = &v34[(v35 - v34 - 24) % 0x18uLL];
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v20 = v12 - __dst;
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - __dst) >> 3)) >= a5)
  {
    uint64_t v21 = &__src[24 * a5];
    double v23 = *(char **)(v9 - 8);
LABEL_17:
    double v24 = &v5[24 * a5];
    double v25 = &v23[-24 * a5];
    double v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      double v26 = v23;
      do
      {
        long long v27 = *(_OWORD *)v25;
        *((void *)v26 + 2) = *((void *)v25 + 2);
        *(_OWORD *)double v26 = v27;
        v26 += 24;
        v25 += 24;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v5[24 * a5], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[8 * ((uint64_t)(v12 - __dst) >> 3)];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * ((uint64_t)(v12 - __dst) >> 3)], a4 - v21);
  }
  double v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v20 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_1EE14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1EE60(void **a1, uint64_t a2, char *__src)
{
  double v5 = *(void **)(a2 + 8);
  BOOL v6 = (char *)*a1;
  id v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *(_OWORD *)(v8 - 24);
      id v7 = (void *)(v9 - 24);
      *(void *)(v9 - 8) = *((void *)v8 - 1);
      *(_OWORD *)(v9 - 24) = v10;
      v8 -= 24;
      v9 -= 24;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(a2 + 16);
  int64_t v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v11 - __src);
    id v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v12 + v13;
  unint64_t v14 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v14;
  unint64_t v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v15;
  unint64_t v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v16;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void sub_1EF40(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4, char a5)
{
uint64_t sub_1F438(uint64_t result, _OWORD *a2)
{
  if ((_OWORD *)result != a2)
  {
    uint64_t v2 = (_OWORD *)(result + 24);
    if ((_OWORD *)(result + 24) != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = (_OWORD *)result;
      do
      {
        double v5 = *((double *)v4 + 5);
        double v6 = *((double *)v4 + 2);
        uint64_t v4 = v2;
        if (v5 < v6)
        {
          long long v10 = *v2;
          uint64_t v7 = v3;
          while (1)
          {
            uint64_t v8 = result + v7;
            *(_OWORD *)(v8 + 24) = *(_OWORD *)(result + v7);
            *(void *)(v8 + 40) = *(void *)(result + v7 + 16);
            if (!v7) {
              break;
            }
            v7 -= 24;
            if (v5 >= *(double *)(v8 - 8))
            {
              uint64_t v9 = result + v7 + 24;
              goto LABEL_10;
            }
          }
          uint64_t v9 = result;
LABEL_10:
          *(_OWORD *)uint64_t v9 = v10;
          *(double *)(v9 + 16) = v5;
        }
        uint64_t v2 = (_OWORD *)((char *)v4 + 24);
        v3 += 24;
      }
      while ((_OWORD *)((char *)v4 + 24) != a2);
    }
  }
  return result;
}

uint64_t sub_1F510(long long *a1, double *a2, double *a3)
{
  double v3 = a2[2];
  double v4 = a3[2];
  if (v3 < *((double *)a1 + 2))
  {
    if (v4 < v3)
    {
      uint64_t v5 = *((void *)a1 + 2);
      long long v6 = *a1;
      uint64_t v7 = *((void *)a3 + 2);
      *a1 = *(_OWORD *)a3;
      *((void *)a1 + 2) = v7;
      *(_OWORD *)a3 = v6;
      *((void *)a3 + 2) = v5;
      return 1;
    }
    uint64_t v14 = *((void *)a1 + 2);
    long long v15 = *a1;
    uint64_t v16 = *((void *)a2 + 2);
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v16;
    *(_OWORD *)a2 = v15;
    *((void *)a2 + 2) = v14;
    if (a3[2] >= a2[2]) {
      return 1;
    }
    uint64_t v17 = *((void *)a2 + 2);
    long long v18 = *(_OWORD *)a2;
    uint64_t v19 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *((void *)a2 + 2) = v19;
    *(_OWORD *)a3 = v18;
    *((void *)a3 + 2) = v17;
    return 2;
  }
  if (v4 < v3)
  {
    uint64_t v8 = *((void *)a2 + 2);
    long long v9 = *(_OWORD *)a2;
    uint64_t v10 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *((void *)a2 + 2) = v10;
    *(_OWORD *)a3 = v9;
    *((void *)a3 + 2) = v8;
    if (a2[2] >= *((double *)a1 + 2)) {
      return 1;
    }
    uint64_t v11 = *((void *)a1 + 2);
    long long v12 = *a1;
    uint64_t v13 = *((void *)a2 + 2);
    *a1 = *(_OWORD *)a2;
    *((void *)a1 + 2) = v13;
    *(_OWORD *)a2 = v12;
    *((void *)a2 + 2) = v11;
    return 2;
  }
  return 0;
}

long long *sub_1F61C(long long *a1, double *a2)
{
  long long v18 = *a1;
  double v2 = *((double *)a1 + 2);
  if (v2 >= *(a2 - 1))
  {
    long long v6 = (long long *)((char *)a1 + 24);
    do
    {
      double v4 = v6;
      if (v6 >= (long long *)a2) {
        break;
      }
      double v7 = *((double *)v6 + 2);
      long long v6 = (long long *)((char *)v6 + 24);
    }
    while (v2 >= v7);
  }
  else
  {
    double v3 = a1;
    do
    {
      double v4 = (long long *)((char *)v3 + 24);
      double v5 = *((double *)v3 + 5);
      double v3 = (long long *)((char *)v3 + 24);
    }
    while (v2 >= v5);
  }
  if (v4 >= (long long *)a2)
  {
    uint64_t v8 = a2;
  }
  else
  {
    do
    {
      uint64_t v8 = a2 - 3;
      double v9 = *(a2 - 1);
      a2 -= 3;
    }
    while (v2 < v9);
  }
  while (v4 < (long long *)v8)
  {
    uint64_t v17 = *((void *)v4 + 2);
    long long v16 = *v4;
    long long v10 = *(_OWORD *)v8;
    *((double *)v4 + 2) = v8[2];
    long long *v4 = v10;
    *((void *)v8 + 2) = v17;
    *(_OWORD *)uint64_t v8 = v16;
    do
    {
      double v11 = *((double *)v4 + 5);
      double v4 = (long long *)((char *)v4 + 24);
    }
    while (v2 >= v11);
    do
    {
      double v12 = *(v8 - 1);
      v8 -= 3;
    }
    while (v2 < v12);
  }
  uint64_t v13 = (long long *)((char *)v4 - 24);
  if ((long long *)((char *)v4 - 24) != a1)
  {
    long long v14 = *v13;
    *((void *)a1 + 2) = *((void *)v4 - 1);
    *a1 = v14;
  }
  long long *v13 = v18;
  *((double *)v4 - 1) = v2;
  return v4;
}

double *sub_1F764(double *a1, unint64_t a2)
{
  uint64_t v2 = 0;
  long long v19 = *(_OWORD *)a1;
  double v3 = a1[2];
  do
  {
    double v4 = a1[v2 + 5];
    v2 += 3;
  }
  while (v4 < v3);
  unint64_t v5 = (unint64_t)&a1[v2];
  if (v2 == 3)
  {
    while (v5 < a2)
    {
      unint64_t v6 = a2 - 24;
      double v8 = *(double *)(a2 - 8);
      a2 -= 24;
      if (v8 < v3) {
        goto LABEL_9;
      }
    }
    unint64_t v6 = a2;
  }
  else
  {
    do
    {
      unint64_t v6 = a2 - 24;
      double v7 = *(double *)(a2 - 8);
      a2 -= 24;
    }
    while (v7 >= v3);
  }
LABEL_9:
  double v9 = &a1[v2];
  if (v5 < v6)
  {
    unint64_t v10 = v6;
    do
    {
      long long v11 = *(_OWORD *)v9;
      uint64_t v12 = *((void *)v9 + 2);
      uint64_t v13 = *(void *)(v10 + 16);
      *(_OWORD *)double v9 = *(_OWORD *)v10;
      *((void *)v9 + 2) = v13;
      *(void *)(v10 + 16) = v12;
      *(_OWORD *)unint64_t v10 = v11;
      do
      {
        double v14 = v9[5];
        v9 += 3;
      }
      while (v14 < v3);
      do
      {
        double v15 = *(double *)(v10 - 8);
        v10 -= 24;
      }
      while (v15 >= v3);
    }
    while ((unint64_t)v9 < v10);
  }
  long long v16 = (long long *)(v9 - 3);
  if (v9 - 3 != a1)
  {
    long long v17 = *v16;
    a1[2] = *(v9 - 1);
    *(_OWORD *)a1 = v17;
  }
  long long *v16 = v19;
  *(v9 - 1) = v3;
  return v9 - 3;
}

BOOL sub_1F8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(double *)(a2 - 8) < *(double *)(a1 + 16))
      {
        uint64_t v6 = *(void *)(a1 + 16);
        long long v7 = *(_OWORD *)a1;
        uint64_t v8 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 24);
        *(void *)(a1 + 16) = v8;
        *(_OWORD *)(a2 - 24) = v7;
        *(void *)(a2 - 8) = v6;
      }
      return result;
    case 3uLL:
      sub_1F510((long long *)a1, (double *)(a1 + 24), (double *)(a2 - 24));
      return 1;
    case 4uLL:
      sub_1FAB0(a1, a1 + 24, a1 + 48, a2 - 24);
      return 1;
    case 5uLL:
      sub_1FB84((__n128 *)a1, (__n128 *)(a1 + 24), (__n128 *)(a1 + 48), (__n128 *)(a1 + 72), (__n128 *)(a2 - 24));
      return 1;
    default:
      uint64_t v9 = a1 + 48;
      sub_1F510((long long *)a1, (double *)(a1 + 24), (double *)(a1 + 48));
      uint64_t v10 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    double v13 = *(double *)(v10 + 16);
    if (v13 < *(double *)(v9 + 16))
    {
      long long v17 = *(_OWORD *)v10;
      uint64_t v14 = v11;
      while (1)
      {
        uint64_t v15 = a1 + v14;
        *(_OWORD *)(v15 + 72) = *(_OWORD *)(a1 + v14 + 48);
        *(void *)(v15 + 88) = *(void *)(a1 + v14 + 64);
        if (v14 == -48) {
          break;
        }
        v14 -= 24;
        if (v13 >= *(double *)(v15 + 40))
        {
          uint64_t v16 = a1 + v14 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v16 = a1;
LABEL_12:
      *(_OWORD *)uint64_t v16 = v17;
      *(double *)(v16 + 16) = v13;
      if (++v12 == 8) {
        return v10 + 24 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 24;
    v10 += 24;
    if (v10 == a2) {
      return 1;
    }
  }
}

__n128 sub_1FAB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1F510((long long *)a1, (double *)a2, (double *)a3);
  result.n128_u64[0] = *(void *)(a4 + 16);
  if (result.n128_f64[0] < *(double *)(a3 + 16))
  {
    uint64_t v9 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    uint64_t v10 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v9;
    result.n128_u64[0] = *(void *)(a3 + 16);
    if (result.n128_f64[0] < *(double *)(a2 + 16))
    {
      uint64_t v11 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v11;
      result.n128_u64[0] = *(void *)(a2 + 16);
      if (result.n128_f64[0] < *(double *)(a1 + 16))
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v13;
      }
    }
  }
  return result;
}

__n128 sub_1FB84(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5)
{
  sub_1FAB0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4);
  result.n128_u64[0] = a5[1].n128_u64[0];
  if (result.n128_f64[0] < a4[1].n128_f64[0])
  {
    unint64_t v11 = a4[1].n128_u64[0];
    __n128 result = *a4;
    unint64_t v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    result.n128_u64[0] = a4[1].n128_u64[0];
    if (result.n128_f64[0] < a3[1].n128_f64[0])
    {
      unint64_t v13 = a3[1].n128_u64[0];
      __n128 result = *a3;
      unint64_t v14 = a4[1].n128_u64[0];
      *a3 = *a4;
      a3[1].n128_u64[0] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      result.n128_u64[0] = a3[1].n128_u64[0];
      if (result.n128_f64[0] < a2[1].n128_f64[0])
      {
        unint64_t v15 = a2[1].n128_u64[0];
        __n128 result = *a2;
        unint64_t v16 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v16;
        *a3 = result;
        a3[1].n128_u64[0] = v15;
        result.n128_u64[0] = a2[1].n128_u64[0];
        if (result.n128_f64[0] < a1[1].n128_f64[0])
        {
          unint64_t v17 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v18 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v18;
          *a2 = result;
          a2[1].n128_u64[0] = v17;
        }
      }
    }
  }
  return result;
}

long long *sub_1FC94(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  if ((long long *)a1 != a2)
  {
    uint64_t v6 = a2;
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) / 24;
    if ((uint64_t)a2 - a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = (double *)(a1 + 24 * v10);
      do
      {
        sub_1FEB0(a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    unint64_t v13 = v6;
    if (v6 != a3)
    {
      unint64_t v14 = v6;
      do
      {
        if (*((double *)v14 + 2) < *(double *)(a1 + 16))
        {
          uint64_t v15 = *((void *)v14 + 2);
          long long v16 = *v14;
          uint64_t v17 = *(void *)(a1 + 16);
          *unint64_t v14 = *(_OWORD *)a1;
          *((void *)v14 + 2) = v17;
          *(_OWORD *)a1 = v16;
          *(void *)(a1 + 16) = v15;
          sub_1FEB0(a1, a4, v9, (double *)a1);
        }
        unint64_t v14 = (long long *)((char *)v14 + 24);
      }
      while (v14 != a3);
      unint64_t v13 = a3;
    }
    if (v8 >= 25)
    {
      int64_t v18 = v8 / 0x18uLL;
      do
      {
        uint64_t v19 = 0;
        long long v29 = *(_OWORD *)a1;
        uint64_t v30 = *(void *)(a1 + 16);
        uint64_t v20 = a1;
        do
        {
          uint64_t v21 = v20;
          uint64_t v22 = v19 + 1;
          v20 += 24 * (v19 + 1);
          uint64_t v23 = 2 * v19;
          uint64_t v19 = (2 * v19) | 1;
          int64_t v24 = v23 + 2;
          if (v24 < v18 && *(double *)(v21 + 24 * v22 + 16) < *(double *)(v20 + 40))
          {
            v20 += 24;
            uint64_t v19 = v24;
          }
          long long v25 = *(_OWORD *)v20;
          *(void *)(v21 + 16) = *(void *)(v20 + 16);
          *(_OWORD *)uint64_t v21 = v25;
        }
        while (v19 <= (uint64_t)((unint64_t)(v18 - 2) >> 1));
        uint64_t v6 = (long long *)((char *)v6 - 24);
        if ((long long *)v20 == v6)
        {
          *(void *)(v20 + 16) = v30;
          *(_OWORD *)uint64_t v20 = v29;
        }
        else
        {
          long long v26 = *v6;
          *(void *)(v20 + 16) = *((void *)v6 + 2);
          *(_OWORD *)uint64_t v20 = v26;
          *uint64_t v6 = v29;
          *((void *)v6 + 2) = v30;
          sub_1FFF0(a1, v20 + 24, a4, 0xAAAAAAAAAAAAAAABLL * ((v20 + 24 - a1) >> 3));
        }
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_1FEB0(uint64_t result, uint64_t a2, uint64_t a3, double *a4)
{
  if (a3 >= 2)
  {
    int64_t v4 = (unint64_t)(a3 - 2) >> 1;
    if (v4 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3)))
    {
      uint64_t v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
      uint64_t v6 = (long long *)(result + 24 * v5);
      if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 < a3
        && *(double *)(result + 24 * v5 + 16) < *((double *)v6 + 5))
      {
        uint64_t v6 = (long long *)((char *)v6 + 24);
        uint64_t v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
      }
      double v7 = a4[2];
      if (*((double *)v6 + 2) >= v7)
      {
        long long v12 = *(_OWORD *)a4;
        do
        {
          uint64_t v8 = a4;
          a4 = (double *)v6;
          long long v9 = *v6;
          v8[2] = *((double *)v6 + 2);
          *(_OWORD *)uint64_t v8 = v9;
          if (v4 < v5) {
            break;
          }
          uint64_t v10 = (2 * v5) | 1;
          uint64_t v6 = (long long *)(result + 24 * v10);
          uint64_t v11 = 2 * v5 + 2;
          if (v11 < a3 && *(double *)(result + 24 * v10 + 16) < *((double *)v6 + 5))
          {
            uint64_t v6 = (long long *)((char *)v6 + 24);
            uint64_t v10 = v11;
          }
          uint64_t v5 = v10;
        }
        while (*((double *)v6 + 2) >= v7);
        *(_OWORD *)a4 = v12;
        a4[2] = v7;
      }
    }
  }
  return result;
}

uint64_t sub_1FFF0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    double v5 = *(double *)(a2 - 8);
    if (*(double *)(result + 24 * v4 + 16) < v5)
    {
      uint64_t v6 = (long long *)(a2 - 24);
      long long v9 = *(_OWORD *)(a2 - 24);
      do
      {
        double v7 = v6;
        uint64_t v6 = (long long *)(result + 24 * v4);
        long long v8 = *v6;
        *((void *)v7 + 2) = *((void *)v6 + 2);
        *double v7 = v8;
        if (!v4) {
          break;
        }
        unint64_t v4 = (v4 - 1) >> 1;
      }
      while (*(double *)(result + 24 * v4 + 16) < v5);
      *uint64_t v6 = v9;
      *((double *)v6 + 2) = v5;
    }
  }
  return result;
}

uint64_t *sub_200AC(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  double v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        double v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        double v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x58uLL);
    uint64_t v12 = **a4;
    v11[6] = 0;
    v11[4] = v12;
    v11[5] = (uint64_t)(v11 + 6);
    v11[10] = 0;
    v11[9] = 0;
    v11[7] = 0;
    v11[8] = (uint64_t)(v11 + 9);
    sub_20184(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *sub_20184(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  double v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = sub_201DC(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_201DC(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      double v3 = (uint64_t *)v2[2];
      unint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), double v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            long long v9 = (uint64_t **)a2[2];
          }
          else
          {
            long long v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              double v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            double *v9 = v2;
            v2[2] = (uint64_t)v9;
            double v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *double v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), double v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            double v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          double v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *double v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_20374(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_20374(a1, *a2);
    sub_20374(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *sub_203C8(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    sub_20184(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *sub_20488(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x40uLL);
    uint64_t v12 = **a4;
    v11[7] = 0;
    v11[6] = 0;
    v11[4] = v12;
    v11[5] = (uint64_t)(v11 + 6);
    sub_20184(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void sub_20554(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_20554(a1, *a2);
    sub_20554(a1, a2[1]);
    sub_20374((uint64_t)(a2 + 8), (void *)a2[9]);
    sub_20374((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

uint64_t sub_205C4(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      sub_DCEC();
    }
    uint64_t v5 = a1[1] - *a1;
    void v7[4] = result;
    v7[0] = sub_E420(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 40 * v6;
    sub_F59C(a1, v7);
    return sub_F748((uint64_t)v7);
  }
  return result;
}

void sub_20664(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_F748((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_20678(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 3)) >= a5)
    {
      uint64_t v20 = v12 - a2;
      if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - a2) >> 3)) >= a5)
      {
        uint64_t v21 = a3 + 40 * a5;
      }
      else
      {
        uint64_t v21 = a3 + 8 * ((uint64_t)(v12 - a2) >> 3);
        a1[1] = sub_209FC(v9, v21, a4, *(void *)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }
      sub_20840((uint64_t)a1, v5, v12, v5 + 40 * a5);
      sub_E358((uint64_t)&v23, a3, v21, v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *a1) >> 3);
      if (v14 > 0x666666666666666) {
        sub_DCEC();
      }
      unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - v13) >> 3);
      unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - v13) >> 3);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x333333333333333) {
        unint64_t v18 = 0x666666666666666;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v27 = v9;
      if (v18) {
        uint64_t v19 = (char *)sub_E420(v9, v18);
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v23 = v19;
      int64_t v24 = &v19[40 * v15];
      long long v25 = v24;
      long long v26 = &v19[40 * v18];
      sub_208AC(&v23, a3, a5);
      uint64_t v5 = sub_20948(a1, &v23, v5);
      sub_F748((uint64_t)&v23);
    }
  }
  return v5;
}

void sub_20820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

uint64_t sub_20840(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
      *(void *)(v8 + 24) = 0;
      *(void *)(v8 + 32) = 0;
      *(void *)(v8 + 16) = 0;
      *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
      *(void *)(v8 + 32) = *(void *)(v9 + 32);
      *(void *)(v9 + 16) = 0;
      *(void *)(v9 + 24) = 0;
      *(void *)(v9 + 32) = 0;
      v8 += 40;
      v9 += 40;
    }
    while (v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return sub_20AB8(a2, v7, v6);
}

void *sub_208AC(void *result, uint64_t a2, uint64_t a3)
{
  double v3 = result;
  uint64_t v4 = result[2];
  if (a3)
  {
    uint64_t v6 = v4 + 40 * a3;
    unint64_t v7 = (void *)(v4 + 16);
    uint64_t v8 = 40 * a3;
    do
    {
      *((_OWORD *)v7 - 1) = *(_OWORD *)a2;
      v7[1] = 0;
      v7[2] = 0;
      *unint64_t v7 = 0;
      uint64_t result = sub_E25C(v7, *(const void **)(a2 + 16), *(void *)(a2 + 24), (uint64_t)(*(void *)(a2 + 24) - *(void *)(a2 + 16)) >> 3);
      v7 += 5;
      a2 += 40;
      v8 -= 40;
    }
    while (v8);
  }
  else
  {
    uint64_t v6 = result[2];
  }
  v3[2] = v6;
  return result;
}

void sub_2093C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2 - 16;
  _Unwind_Resume(a1);
}

uint64_t sub_20948(uint64_t *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = (uint64_t)(a1 + 2);
  sub_F614((uint64_t)(a1 + 2), a3, a3, *a1, *a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_20B80(v7, a3, a1[1], a2[2]);
  uint64_t v9 = *a1;
  *a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = a1[1];
  a1[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = a1[2];
  a1[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t sub_209FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v6;
      *(void *)(v4 + 24) = 0;
      *(void *)(v4 + 32) = 0;
      *(void *)(v4 + 16) = 0;
      sub_E25C((void *)(v4 + 16), *(const void **)(v6 + 16), *(void *)(v6 + 24), (uint64_t)(*(void *)(v6 + 24) - *(void *)(v6 + 16)) >> 3);
      uint64_t v4 = v11 + 40;
      v11 += 40;
      v6 += 40;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  sub_E2D8((uint64_t)v8);
  return v4;
}

void sub_20AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_20AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a1)
  {
    uint64_t v5 = a2;
    do
    {
      uint64_t v6 = v5 - 40;
      uint64_t v7 = a3 - 40;
      *(_OWORD *)(a3 - 40) = *(_OWORD *)(v5 - 40);
      sub_20B2C(a3 - 24, (__n128 *)(v5 - 24));
      a3 = v7;
      uint64_t v5 = v6;
    }
    while (v6 != a1);
  }
  return a2;
}

__n128 sub_20B2C(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

uint64_t sub_20B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v9 = a4;
  uint64_t v8 = a4;
  v6[0] = a1;
  v6[1] = &v8;
  v6[2] = &v9;
  if (a2 != a3)
  {
    do
    {
      *(_OWORD *)uint64_t v4 = *(_OWORD *)a2;
      *(void *)(v4 + 24) = 0;
      *(void *)(v4 + 32) = 0;
      *(void *)(v4 + 16) = 0;
      *(_OWORD *)(v4 + 16) = *(_OWORD *)(a2 + 16);
      *(void *)(v4 + 32) = *(void *)(a2 + 32);
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      v4 += 40;
      a2 += 40;
    }
    while (a2 != a3);
    uint64_t v9 = v4;
  }
  char v7 = 1;
  sub_E2D8((uint64_t)v6);
  return v4;
}

void sub_20C18(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t a4)
{
  uint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)a1) >> 3);
  uint64_t v9 = ((char *)a3 - (char *)a2) >> 3;
  uint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * v9;
  if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * v9) >= v8) {
    uint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)a1) >> 3);
  }
  else {
    uint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * v9;
  }
  unint64_t v12 = (__n128 *)sub_20CF8(v11);
  sub_20D64(a1, a2, a3, a4, v8, v10, v12, v13);
  if (v12)
  {
    operator delete(v12);
  }
}

void sub_20CE0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *sub_20CF8(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x333333333333333) {
    unint64_t v1 = 0x333333333333333;
  }
  else {
    unint64_t v1 = a1;
  }
  while (1)
  {
    __n128 result = operator new(40 * v1, &std::nothrow);
    if (result) {
      break;
    }
    BOOL v3 = v1 > 1;
    v1 >>= 1;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

void sub_20D64(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, __n128 *a7, uint64_t a8)
{
  id v44 = a2;
  if (a6)
  {
    uint64_t v8 = a8;
    unint64_t v12 = a2;
    unint64_t v14 = v44;
    unint64_t v15 = a2;
    while (a6 > v8 && a5 > v8)
    {
      if (!a5) {
        goto LABEL_45;
      }
      uint64_t v43 = a6;
      unint64_t v16 = 0;
      uint64_t v17 = -a5;
      while (1)
      {
        unint64_t v18 = (__n128 *)((char *)a1 + v16);
        if (HDActivityCacheActiveSource::operator<(v15->n128_f64, &a1->n128_f64[v16 / 8])) {
          break;
        }
        v16 += 40;
        if (__CFADD__(v17++, 1)) {
          goto LABEL_45;
        }
      }
      uint64_t v45 = (__n128 *)((char *)a1 + v16);
      uint64_t v20 = -v17;
      uint64_t v21 = v43;
      if (-v17 >= v43)
      {
        if (v17 == -1)
        {
          id v44 = v14;
          sub_211FC(&v45, &v44);
          return;
        }
        if (v17 > 0) {
          uint64_t v20 = 1 - v17;
        }
        uint64_t v27 = v20 >> 1;
        double v28 = (char *)a1 + 40 * (v20 >> 1);
        unint64_t v26 = v27;
        unint64_t v12 = (__n128 *)&v28[v16];
        unint64_t v14 = a3;
        if (a3 != v15)
        {
          unint64_t v40 = v27;
          unint64_t v29 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)v15) >> 3);
          unint64_t v14 = v15;
          do
          {
            uint64_t v30 = &v14->n128_f64[5 * (v29 >> 1)];
            BOOL v31 = HDActivityCacheActiveSource::operator<(v30, v12->n128_f64);
            if (v31) {
              v29 += ~(v29 >> 1);
            }
            else {
              v29 >>= 1;
            }
            if (v31) {
              unint64_t v14 = (__n128 *)(v30 + 5);
            }
          }
          while (v29);
          unint64_t v26 = v40;
          uint64_t v21 = v43;
        }
        uint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v14 - (char *)v15) >> 3);
      }
      else
      {
        if (v43 >= 0) {
          uint64_t v22 = v43;
        }
        else {
          uint64_t v22 = v43 + 1;
        }
        uint64_t v23 = v22 >> 1;
        unint64_t v14 = (__n128 *)((char *)v12 + 40 * (v22 >> 1));
        uint64_t v24 = (char *)v12 - (char *)a1 - v16;
        if (v24)
        {
          uint64_t v38 = v22 >> 1;
          uint64_t v39 = a7;
          unint64_t v25 = 0xCCCCCCCCCCCCCCCDLL * (v24 >> 3);
          unint64_t v12 = (__n128 *)((char *)a1 + v16);
          do
          {
            if (HDActivityCacheActiveSource::operator<(v14->n128_f64, &v12->n128_f64[5 * (v25 >> 1)]))
            {
              v25 >>= 1;
            }
            else
            {
              unint64_t v12 = (__n128 *)((char *)v12 + 40 * (v25 >> 1) + 40);
              v25 += ~(v25 >> 1);
            }
          }
          while (v25);
          a7 = v39;
          uint64_t v21 = v43;
          uint64_t v23 = v38;
        }
        unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)((char *)v12 - (char *)a1 - v16) >> 3);
      }
      if (v12 == v15)
      {
        uint64_t v34 = v14;
      }
      else if (v15 == v14)
      {
        uint64_t v34 = v12;
      }
      else
      {
        uint64_t v32 = v23;
        long long v33 = sub_21504(v12, v15, v14);
        uint64_t v23 = v32;
        uint64_t v21 = v43;
        uint64_t v34 = v33;
      }
      a5 = -(uint64_t)(v26 + v17);
      uint64_t v35 = v21 - v23;
      if ((uint64_t)(v26 + v23) >= (uint64_t)(v21 - (v26 + v23) - v17))
      {
        uint64_t v8 = a8;
        uint64_t v36 = a5;
        uint64_t v37 = v23;
        sub_20D64(v34, v14, a3, a4, v36, v21 - v23, a7, a8);
        unint64_t v14 = v12;
        uint64_t v35 = v37;
        a5 = v26;
        a3 = v34;
      }
      else
      {
        uint64_t v8 = a8;
        sub_20D64(v18, v12, v34, a4, v26, v23, a7, a8);
        uint64_t v45 = v34;
        unint64_t v18 = v34;
        unint64_t v12 = v14;
      }
      unint64_t v15 = v14;
      a1 = v18;
      a6 = v35;
      if (!v35)
      {
LABEL_45:
        id v44 = v14;
        return;
      }
    }
    id v44 = v14;
    sub_210A0(a1, v15, a3, a4, a5, a6, a7);
  }
}

void sub_210A0(__n128 *a1, __n128 *a2, __n128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, __n128 *a7)
{
  if (a5 <= a6)
  {
    if (a1 == a2)
    {
      unint64_t v14 = 0;
      uint64_t v15 = (uint64_t)a7;
    }
    else
    {
      unint64_t v14 = 0;
      uint64_t v15 = (uint64_t)a7;
      unint64_t v16 = a1;
      do
      {
        *(__n128 *)uint64_t v15 = *v16;
        *(void *)(v15 + 24) = 0;
        *(void *)(v15 + 32) = 0;
        *(void *)(v15 + 16) = 0;
        *(__n128 *)(v15 + 16) = v16[1];
        *(void *)(v15 + 32) = v16[2].n128_u64[0];
        v16[1].n128_u64[0] = 0;
        v16[1].n128_u64[1] = 0;
        v16[2].n128_u64[0] = 0;
        ++v14;
        v15 += 40;
        unint64_t v16 = (__n128 *)((char *)v16 + 40);
      }
      while (v16 != a2);
    }
    unint64_t v17 = v14;
    sub_21278(a7, v15, a2, a3, a1);
  }
  else
  {
    if (a2 == a3)
    {
      unint64_t v11 = 0;
      uint64_t v12 = (uint64_t)a7;
    }
    else
    {
      unint64_t v11 = 0;
      uint64_t v12 = (uint64_t)a7;
      uint64_t v13 = a2;
      do
      {
        *(__n128 *)uint64_t v12 = *v13;
        *(void *)(v12 + 24) = 0;
        *(void *)(v12 + 32) = 0;
        *(void *)(v12 + 16) = 0;
        *(__n128 *)(v12 + 16) = v13[1];
        *(void *)(v12 + 32) = v13[2].n128_u64[0];
        v13[1].n128_u64[0] = 0;
        v13[1].n128_u64[1] = 0;
        v13[2].n128_u64[0] = 0;
        ++v11;
        v12 += 40;
        uint64_t v13 = (__n128 *)((char *)v13 + 40);
      }
      while (v13 != a3);
    }
    unint64_t v17 = v11;
    sub_21360(v12, (uint64_t)a7, (uint64_t)a2, (uint64_t)a1, (uint64_t)a3);
  }
  if (a7) {
    sub_214A8(&v17, (uint64_t)a7);
  }
}

void sub_211DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unint64_t a10)
{
  if (v10) {
    sub_214A8(&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_211FC(__n128 **a1, __n128 **a2)
{
  BOOL v3 = *a2;
  __n128 v4 = **a1;
  uint64_t v2 = *a1;
  __n128 v6 = (*a1)[1];
  uint64_t v5 = *a1 + 1;
  __n128 v10 = v6;
  __n128 v11 = v4;
  uint64_t v7 = v2[2].n128_i64[0];
  v5->n128_u64[0] = 0;
  v2[1].n128_u64[1] = 0;
  v2[2].n128_u64[0] = 0;
  __n128 *v2 = *v3;
  sub_20B2C((uint64_t)v5, v3 + 1);
  *BOOL v3 = v11;
  uint64_t v8 = (void *)v3[1].n128_u64[0];
  if (v8)
  {
    v3[1].n128_u64[1] = (unint64_t)v8;
    operator delete(v8);
  }
  __n128 result = v10;
  v3[1] = v10;
  v3[2].n128_u64[0] = v7;
  return result;
}

void sub_21278(__n128 *a1, uint64_t a2, __n128 *a3, __n128 *a4, _OWORD *a5)
{
  if (a1 != (__n128 *)a2)
  {
    uint64_t v5 = a5;
    uint64_t v9 = a1;
    uint64_t v10 = (uint64_t)(a5 + 1);
    while (a3 != a4)
    {
      __n128 v11 = (__n128 *)(v10 - 16);
      if (HDActivityCacheActiveSource::operator<(a3->n128_f64, v9->n128_f64))
      {
        __n128 *v11 = *a3;
        sub_20B2C(v10, a3 + 1);
        a3 = (__n128 *)((char *)a3 + 40);
      }
      else
      {
        __n128 *v11 = *v9;
        sub_20B2C(v10, v9 + 1);
        uint64_t v9 = (__n128 *)((char *)v9 + 40);
      }
      uint64_t v5 = (_OWORD *)((char *)v5 + 40);
      v10 += 40;
      if (v9 == (__n128 *)a2) {
        return;
      }
    }
    sub_21438((uint64_t)v9, a2, v5);
  }
}

void sub_21360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1 != a2)
  {
    uint64_t v8 = a1;
    uint64_t v9 = (_OWORD *)(a5 - 40);
    while (a3 != a4)
    {
      BOOL v10 = HDActivityCacheActiveSource::operator<((double *)(v8 - 40), (double *)(a3 - 40));
      uint64_t v11 = (uint64_t)(v9 + 1);
      if (v10) {
        uint64_t v12 = (_OWORD *)(a3 - 40);
      }
      else {
        uint64_t v12 = (_OWORD *)(v8 - 40);
      }
      if (v10) {
        uint64_t v13 = a3;
      }
      else {
        uint64_t v13 = v8;
      }
      if (v10) {
        a3 -= 40;
      }
      else {
        v8 -= 40;
      }
      _OWORD *v9 = *v12;
      uint64_t v9 = (_OWORD *)((char *)v9 - 40);
      sub_20B2C(v11, (__n128 *)(v13 - 24));
      if (v8 == a2) {
        return;
      }
    }
    uint64_t v14 = 0;
    do
    {
      *(_OWORD *)((char *)v9 + v14) = *(_OWORD *)(v8 + v14 - 40);
      sub_20B2C((uint64_t)v9 + v14 + 16, (__n128 *)(v8 + v14 - 24));
      v14 -= 40;
    }
    while (v8 + v14 != a2);
  }
}

uint64_t sub_21438(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  BOOL v3 = a3;
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    __n128 v6 = a3;
    do
    {
      *__n128 v6 = *(_OWORD *)v4;
      sub_20B2C((uint64_t)(v6 + 1), (__n128 *)(v4 + 16));
      BOOL v3 = (_OWORD *)((char *)v3 + 40);
      v4 += 40;
      __n128 v6 = (_OWORD *)((char *)v6 + 40);
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void sub_214A8(unint64_t *a1, uint64_t a2)
{
  unint64_t v2 = *a1;
  if (*a1)
  {
    unint64_t v4 = 0;
    uint64_t v5 = (void *)(a2 + 24);
    do
    {
      __n128 v6 = (void *)*(v5 - 1);
      if (v6)
      {
        *uint64_t v5 = v6;
        operator delete(v6);
        unint64_t v2 = *a1;
      }
      ++v4;
      v5 += 5;
    }
    while (v4 < v2);
  }
}

__n128 *sub_21504(__n128 *a1, __n128 *a2, __n128 *a3)
{
  unint64_t v4 = a2;
  BOOL v10 = a2;
  uint64_t v11 = a1;
  while (1)
  {
    sub_211FC(&v11, &v10);
    uint64_t v5 = (__n128 *)((char *)v11 + 40);
    __n128 v6 = (__n128 *)((char *)v10 + 40);
    BOOL v10 = v6;
    uint64_t v11 = (__n128 *)((char *)v11 + 40);
    if (v6 == a3) {
      break;
    }
    if (v5 == v4) {
      unint64_t v4 = v6;
    }
  }
  if (v5 != v4)
  {
    do
    {
      BOOL v10 = v4;
      while (1)
      {
        sub_211FC(&v11, &v10);
        uint64_t v7 = (__n128 *)((char *)v11 + 40);
        uint64_t v8 = (__n128 *)((char *)v10 + 40);
        BOOL v10 = v8;
        uint64_t v11 = (__n128 *)((char *)v11 + 40);
        if (v8 == a3) {
          break;
        }
        if (v7 == v4) {
          unint64_t v4 = v8;
        }
      }
    }
    while (v7 != v4);
  }
  return v5;
}

void sub_215B8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_215B8(a1, *a2);
    sub_215B8(a1, a2[1]);
    sub_20554((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

uint64_t *sub_21618(uint64_t **a1, int *a2, uint64_t *a3)
{
  uint64_t v5 = sub_2169C((uint64_t)a1, &v9, a2);
  __n128 v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    __n128 v6 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v6 + 28) = *a3;
    sub_20184(a1, v9, v7, v6);
  }
  return v6;
}

uint64_t *sub_2169C(uint64_t a1, void *a2, int *a3)
{
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  __n128 result = (uint64_t *)(a1 + 8);
  unint64_t v4 = v5;
  if (v5)
  {
    int v6 = *a3;
    int v7 = a3[1];
    while (1)
    {
      uint64_t v8 = v4;
      int v9 = *((_DWORD *)v4 + 7);
      if (v6 == v9)
      {
        int v10 = *((_DWORD *)v8 + 8);
        if (v7 >= v10)
        {
          BOOL v11 = v10 == v7;
          if (v10 >= v7) {
            char v12 = 1;
          }
          else {
            char v12 = -1;
          }
          if (v11) {
            char v12 = 0;
          }
          if ((v12 & 0x80) == 0) {
            goto LABEL_22;
          }
          goto LABEL_19;
        }
LABEL_13:
        unint64_t v4 = (uint64_t *)*v8;
        __n128 result = v8;
        if (!*v8) {
          goto LABEL_22;
        }
      }
      else
      {
        if (v6 < v9) {
          goto LABEL_13;
        }
        if (v9 >= v6) {
          char v13 = 1;
        }
        else {
          char v13 = -1;
        }
        if ((v13 & 0x80) == 0) {
          goto LABEL_22;
        }
LABEL_19:
        __n128 result = v8 + 1;
        unint64_t v4 = (uint64_t *)v8[1];
        if (!v4) {
          goto LABEL_22;
        }
      }
    }
  }
  uint64_t v8 = result;
LABEL_22:
  *a2 = v8;
  return result;
}

void sub_21A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HKInitializeLogging();
    unint64_t v2 = HKLogActivityCache;
    if (os_log_type_enabled(HKLogActivityCache, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&def_E6CC, v2, OS_LOG_TYPE_DEFAULT, "HealthActivityCacheProfileExtension did receive HKStandalonePhoneFitnessModeDidUpdateNotification notification", v5, 2u);
    }
    uint64_t v3 = [WeakRetained _activityCacheManager];
    unint64_t v4 = (void *)WeakRetained[2];
    WeakRetained[2] = v3;
  }
}

void sub_22080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v27);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_22108(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_22164(WeakRetained);
}

void sub_22150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22164(void *a1)
{
  if (a1 && [a1 queryState] == (char *)&def_E6CC + 2)
  {
    sub_22448(a1);
    id v4 = 0;
    unint64_t v2 = sub_225D0((uint64_t)a1, (uint64_t)&v4);
    id v3 = v4;
    if (v2) {
      sub_228E4(a1, v2);
    }
    else {
      sub_22834(a1, v3);
    }
  }
}

void sub_221F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2220C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_22268(WeakRetained);
}

void sub_22254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22268(void *a1)
{
  if (a1)
  {
    unint64_t v2 = (void *)a1[9];
    a1[9] = 0;

    sub_22164(a1);
  }
}

id sub_22358(uint64_t a1)
{
  if (a1)
  {
    unint64_t v1 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned];
    unint64_t v2 = +[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleMoveTime];
    id v3 = +[HKObjectType briskMinuteDataType];
    id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, 0);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_22420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22448(void *a1)
{
  if (a1 && !a1[9])
  {
    unint64_t v2 = [HDActivityCacheDataSource alloc];
    id v10 = [a1 profile];
    id v3 = sub_22358((uint64_t)a1);
    uint64_t v4 = a1[3];
    uint64_t v5 = a1[4];
    int v6 = [a1 queryQueue];
    int v7 = [(HDActivityCacheDataSource *)v2 initWithProfile:v10 observedQuantityTypes:v3 updateOperation:v4 rebuildOperation:v5 queue:v6];
    uint64_t v8 = (void *)a1[9];
    a1[9] = v7;

    int v9 = (void *)a1[9];
    id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:a1[5] endDate:a1[6]];
    objc_msgSend(v9, "setTargetDayDateInterval:");
  }
}

void sub_225A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_225D0(uint64_t a1, uint64_t a2)
{
  if (a1 && [*(id *)(a1 + 72) updateWithError:a2])
  {
    id v3 = [*(id *)(a1 + 56) calendar];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = +[NSCalendar currentCalendar];
    }
    int v7 = v5;

    id v6 = objc_alloc_init((Class)_HKActivityStatisticsQueryResult);
    uint64_t v8 = [*(id *)(a1 + 72) targetDayStatisticsBuilder];
    int v9 = [v8 createMoveStatisticsWithIntervalComponents:*(void *)(a1 + 56) calendar:v7];
    [v6 setActiveEnergyResults:v9];

    id v10 = [*(id *)(a1 + 72) targetDayStatisticsBuilder];
    id v11 = [v10 createMoveMinuteStatisticsWithIntervalComponents:*(void *)(a1 + 56) calendar:v7];
    [v6 setAppleMoveTimeResults:v11];

    char v12 = [*(id *)(a1 + 72) targetDayStatisticsBuilder];
    char v13 = [v12 createExerciseStatisticsWithIntervalComponents:*(void *)(a1 + 64) calendar:v7];
    [v6 setAppleExerciseTimeResults:v13];

    uint64_t v14 = [*(id *)(a1 + 72) targetDayStatisticsBuilder];
    uint64_t v15 = [v14 createStandStatisticsWithCalendar:v7];
    [v6 setAppleStandHourResults:v15];

    unint64_t v16 = [*(id *)(a1 + 72) targetDayStatisticsBuilder];
    unint64_t v17 = [v16 workoutSamplesWithSourceManager:*(void *)(a1 + 80)];
    [v6 setWorkoutResults:v17];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_227E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22834(void *a1, void *a2)
{
  id v5 = a2;
  if (a1)
  {
    id v3 = [a1 clientProxy];
    uint64_t v4 = [a1 queryUUID];
    objc_msgSend(v3, "client_deliverError:forQuery:", v5, v4);
  }
}

void sub_228B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v12 = v11;

  _Unwind_Resume(a1);
}

void sub_228E4(void *a1, void *a2)
{
  id v5 = a2;
  if (a1)
  {
    id v3 = [a1 clientProxy];
    uint64_t v4 = [a1 queryUUID];
    objc_msgSend(v3, "client_deliverResult:query:", v5, v4);
  }
}

void sub_22964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  char v12 = v11;

  _Unwind_Resume(a1);
}

void sub_22A74(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&def_E6CC, a2, OS_LOG_TYPE_DEBUG, "Calling query client with todayActivitySummary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_22AEC()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Update caches operation invoked", v2, v3, v4, v5, v6);
}

void sub_22B20()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Rebuild caches operation invoked", v2, v3, v4, v5, v6);
}

void sub_22B54()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Not saving today cache because not ready to save today caches", v2, v3, v4, v5, v6);
}

void sub_22B88(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)HDActivityCacheStatisticsBuilderSample buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&def_E6CC, log, OS_LOG_TYPE_DEBUG, "Suppressing save because caches are the same (%ld).", buf, 0xCu);
}

void sub_22BD0()
{
  sub_D1AC();
  _os_log_error_impl(&def_E6CC, v0, OS_LOG_TYPE_ERROR, "Provenance nil, cannot store activity cache", v1, 2u);
}

void sub_22C10()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error saving activity cache: %{public}@", v2, v3, v4, v5, v6);
}

void sub_22C78()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Not saving yesterday cache because not ready to save yesterday caches", v2, v3, v4, v5, v6);
}

void sub_22CAC()
{
  sub_D1A0();
  sub_D1B8(&def_E6CC, v0, v1, "Error fetching daily %{public}@ goal: %{public}@");
}

void sub_22D20()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error loading activity move mode change sample for yesterday: %{public}@", v2, v3, v4, v5, v6);
}

void sub_22D88()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error loading activity move mode change sample for today: %{public}@", v2, v3, v4, v5, v6);
}

void sub_22DF0()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error enumerating paused ring schedules: %{public}@", v2, v3, v4, v5, v6);
}

void sub_22E58()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error saving new goals from schedule: %@", v2, v3, v4, v5, v6);
}

void sub_22EC0()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error loading existing goal schedules: %@", v2, v3, v4, v5, v6);
}

void sub_22F28()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Unexpected weekday looking for scheduled goal: %ld", v2, v3, v4, v5, v6);
}

void sub_22F90()
{
  sub_D1D8();
  sub_D1B8(&def_E6CC, v0, v1, "Unexpected goal type (%ld) for goal schedule: %@");
}

void sub_22FF8()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error fetching local source: %{public}@", v2, v3, v4, v5, v6);
}

void sub_23060()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error enumarating activity cache: %{public}@", v2, v3, v4, v5, v6);
}

void sub_230C8()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Wheelchair use characteristic is nil", v2, v3, v4, v5, v6);
}

void sub_230FC()
{
  sub_D1A0();
  _os_log_debug_impl(&def_E6CC, v0, OS_LOG_TYPE_DEBUG, "Failed to fetch wheelchair use: %{public}@", v1, 0xCu);
}

void sub_23170()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Failed to fetch wheelchair use: %{public}@", v2, v3, v4, v5, v6);
}

void sub_231D8()
{
  sub_D1A0();
  sub_D168(&def_E6CC, v0, v1, "Error deleting future activity caches: %{public}@", v2, v3, v4, v5, v6);
}

void sub_23240()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Adding Activity Cache Observer", v2, v3, v4, v5, v6);
}

void sub_23274()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Activity Cache Observer Added, Notifying with activity caches", v2, v3, v4, v5, v6);
}

void sub_232A8()
{
  sub_D1AC();
  sub_D184(&def_E6CC, v0, v1, "Alerting observers that Today Activity Cache Changed", v2, v3, v4, v5, v6);
}

void sub_232DC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *HDActivityCacheStatisticsBuilderSample buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&def_E6CC, log, OS_LOG_TYPE_DEBUG, "Alerting observers that Yesterday Activity Cache Changed", buf, 2u);
}

void sub_2331C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)a1 + 16);
  id v4 = a2;
  uint64_t v5 = sub_F9E8();
  v3(v5);
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, 2u);
}

void sub_233C8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)a1 + 16);
  id v4 = a2;
  uint64_t v5 = sub_F9E8();
  v3(v5);
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, 2u);
}

void sub_23474()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23514()
{
  sub_D1A0();
  _os_log_error_impl(&def_E6CC, v0, OS_LOG_TYPE_ERROR, "Error priming statistics builder: %{public}@", v1, 0xCu);
}

void sub_23588()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23628()
{
  sub_17684();
  sub_D1B8(&def_E6CC, v0, v1, "Error priming previous activation log entry due to %{public}@: %{public}@");
}

void sub_23690()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23730()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_237D0()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23870()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23910()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_239B0()
{
  sub_D1A0();
  _os_log_error_impl(&def_E6CC, v0, OS_LOG_TYPE_ERROR, "Error fetching local device source identifier; defaulting to default base source identifier: %{public}@",
    v1,
    0xCu);
}

void sub_23A24()
{
  sub_17684();
  sub_D1B8(&def_E6CC, v0, v1, "Error fetching ordered sources for %{public}@, defaulting to largest wins strategy: %{public}@");
}

void sub_23A8C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23B2C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23BCC()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23C6C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23D0C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23DAC()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23E4C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23EEC()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_23F8C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_2402C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_240CC()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_2416C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_2420C()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_242AC()
{
  sub_D1A0();
  _os_log_error_impl(&def_E6CC, v0, OS_LOG_TYPE_ERROR, "Unsupported data type encountered: %ld", v1, 0xCu);
}

void sub_24320()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_243C0()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_24460()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_24500()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_245A0()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_24640()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_246E0()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_24780()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_24820()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

void sub_248C0()
{
  sub_17674();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = sub_F9E8();
  v2(v5);
  sub_D1A0();
  sub_F9FC(&def_E6CC, v6, v7, "Unexpected C++ exception: %{public}s", v8, v9, v10, v11, v12);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t HDActivityCacheEntityPredicateForCacheIndex()
{
  return _HDActivityCacheEntityPredicateForCacheIndex();
}

uint64_t HDDataEntityPredicateForSourceEntity()
{
  return _HDDataEntityPredicateForSourceEntity();
}

uint64_t HDPauseRingsScheduleEntityPredicateForCacheIndexRange()
{
  return _HDPauseRingsScheduleEntityPredicateForCacheIndexRange();
}

uint64_t HDSQLiteColumnAsBoolean()
{
  return _HDSQLiteColumnAsBoolean();
}

uint64_t HDSQLiteColumnAsDouble()
{
  return _HDSQLiteColumnAsDouble();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return _HDSQLiteColumnAsInt64();
}

uint64_t HDSQLiteColumnAsUUID()
{
  return _HDSQLiteColumnAsUUID();
}

uint64_t HDSQLiteColumnIsNull()
{
  return _HDSQLiteColumnIsNull();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return _HDSampleEntityPredicateForStartDate();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return _HKCreateSerialDispatchQueue();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return __HKActivityCacheDateComponentsFromCacheIndex();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return __HKActivityCacheDateComponentsFromDate();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return __HKCacheIndexFromDateComponents();
}

uint64_t _HKCategoryValueSleepAnalysisIsAsleep()
{
  return __HKCategoryValueSleepAnalysisIsAsleep();
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _HKLogDroppedError()
{
  return __HKLogDroppedError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return std::__sort<std::__less<double,double> &,double *>();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__activityCacheManager(void *a1, const char *a2, ...)
{
  return [a1 _activityCacheManager];
}

id objc_msgSend__countPerMinuteUnit(void *a1, const char *a2, ...)
{
  return [a1 _countPerMinuteUnit];
}

id objc_msgSend__countPerSecondUnit(void *a1, const char *a2, ...)
{
  return [a1 _countPerSecondUnit];
}

id objc_msgSend__creationDate(void *a1, const char *a2, ...)
{
  return [a1 _creationDate];
}

id objc_msgSend__endTimestamp(void *a1, const char *a2, ...)
{
  return [a1 _endTimestamp];
}

id objc_msgSend__isAppleWatch(void *a1, const char *a2, ...)
{
  return [a1 _isAppleWatch];
}

id objc_msgSend__isBTLEServer(void *a1, const char *a2, ...)
{
  return [a1 _isBTLEServer];
}

id objc_msgSend__isConnectedGymSource(void *a1, const char *a2, ...)
{
  return [a1 _isConnectedGymSource];
}

id objc_msgSend__startTimestamp(void *a1, const char *a2, ...)
{
  return [a1 _startTimestamp];
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return [a1 _value];
}

id objc_msgSend_activeDevicePairedDate(void *a1, const char *a2, ...)
{
  return [a1 activeDevicePairedDate];
}

id objc_msgSend_activeEnergyValue(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyValue];
}

id objc_msgSend_activityCacheIndex(void *a1, const char *a2, ...)
{
  return [a1 activityCacheIndex];
}

id objc_msgSend_activityCacheInterface(void *a1, const char *a2, ...)
{
  return [a1 activityCacheInterface];
}

id objc_msgSend_activityCacheType(void *a1, const char *a2, ...)
{
  return [a1 activityCacheType];
}

id objc_msgSend_activityGoalScheduleType(void *a1, const char *a2, ...)
{
  return [a1 activityGoalScheduleType];
}

id objc_msgSend_activityMoveModeChangeType(void *a1, const char *a2, ...)
{
  return [a1 activityMoveModeChangeType];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_analyticsSubmissionCoordinator(void *a1, const char *a2, ...)
{
  return [a1 analyticsSubmissionCoordinator];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_averageQuantity(void *a1, const char *a2, ...)
{
  return [a1 averageQuantity];
}

id objc_msgSend_behavior(void *a1, const char *a2, ...)
{
  return [a1 behavior];
}

id objc_msgSend_briskMinuteDataType(void *a1, const char *a2, ...)
{
  return [a1 briskMinuteDataType];
}

id objc_msgSend_cacheIndex(void *a1, const char *a2, ...)
{
  return [a1 cacheIndex];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_calorieGoal(void *a1, const char *a2, ...)
{
  return [a1 calorieGoal];
}

id objc_msgSend_canonicalUnit(void *a1, const char *a2, ...)
{
  return [a1 canonicalUnit];
}

id objc_msgSend_clientProxy(void *a1, const char *a2, ...)
{
  return [a1 clientProxy];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionIntervals(void *a1, const char *a2, ...)
{
  return [a1 collectionIntervals];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countUnit(void *a1, const char *a2, ...)
{
  return [a1 countUnit];
}

id objc_msgSend_createActiveSourceLog(void *a1, const char *a2, ...)
{
  return [a1 createActiveSourceLog];
}

id objc_msgSend_currentActivitySummaryHelper(void *a1, const char *a2, ...)
{
  return [a1 currentActivitySummaryHelper];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentStatistics(void *a1, const char *a2, ...)
{
  return [a1 currentStatistics];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_dataCollectionManager(void *a1, const char *a2, ...)
{
  return [a1 dataCollectionManager];
}

id objc_msgSend_dataManager(void *a1, const char *a2, ...)
{
  return [a1 dataManager];
}

id objc_msgSend_dataProvenanceManager(void *a1, const char *a2, ...)
{
  return [a1 dataProvenanceManager];
}

id objc_msgSend_dataTypeCode(void *a1, const char *a2, ...)
{
  return [a1 dataTypeCode];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return [a1 dateInterval];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_deepBreathingDurationValue(void *a1, const char *a2, ...)
{
  return [a1 deepBreathingDurationValue];
}

id objc_msgSend_deepBreathingSessionType(void *a1, const char *a2, ...)
{
  return [a1 deepBreathingSessionType];
}

id objc_msgSend_deepCopy(void *a1, const char *a2, ...)
{
  return [a1 deepCopy];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultLocalDataProvenance(void *a1, const char *a2, ...)
{
  return [a1 defaultLocalDataProvenance];
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return [a1 deviceManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didFreeze(void *a1, const char *a2, ...)
{
  return [a1 didFreeze];
}

id objc_msgSend_disambiguatedDatabaseTable(void *a1, const char *a2, ...)
{
  return [a1 disambiguatedDatabaseTable];
}

id objc_msgSend_distanceWalkingValue(void *a1, const char *a2, ...)
{
  return [a1 distanceWalkingValue];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endDateIndex(void *a1, const char *a2, ...)
{
  return [a1 endDateIndex];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return [a1 execute];
}

id objc_msgSend_exerciseGoal(void *a1, const char *a2, ...)
{
  return [a1 exerciseGoal];
}

id objc_msgSend_exerciseIntervalComponents(void *a1, const char *a2, ...)
{
  return [a1 exerciseIntervalComponents];
}

id objc_msgSend_exerciseMinuteValue(void *a1, const char *a2, ...)
{
  return [a1 exerciseMinuteValue];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fitnessMode(void *a1, const char *a2, ...)
{
  return [a1 fitnessMode];
}

id objc_msgSend_flightsClimbedValue(void *a1, const char *a2, ...)
{
  return [a1 flightsClimbedValue];
}

id objc_msgSend_fridayGoal(void *a1, const char *a2, ...)
{
  return [a1 fridayGoal];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_goalType(void *a1, const char *a2, ...)
{
  return [a1 goalType];
}

id objc_msgSend_hasDailyBriskMinutesStatistics(void *a1, const char *a2, ...)
{
  return [a1 hasDailyBriskMinutesStatistics];
}

id objc_msgSend_hasDailyEnergyBurnedStatistics(void *a1, const char *a2, ...)
{
  return [a1 hasDailyEnergyBurnedStatistics];
}

id objc_msgSend_hasWheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 hasWheelchairUse];
}

id objc_msgSend_heartRateSummary(void *a1, const char *a2, ...)
{
  return [a1 heartRateSummary];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppleWatch(void *a1, const char *a2, ...)
{
  return [a1 isAppleWatch];
}

id objc_msgSend_isConnectedGymSource(void *a1, const char *a2, ...)
{
  return [a1 isConnectedGymSource];
}

id objc_msgSend_isStandalonePhoneFitnessMode(void *a1, const char *a2, ...)
{
  return [a1 isStandalonePhoneFitnessMode];
}

id objc_msgSend_isWatchSource(void *a1, const char *a2, ...)
{
  return [a1 isWatchSource];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_localDeviceSourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localDeviceSourceIdentifier];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_maskRestingHeartRateSamplesWithSleepSamples(void *a1, const char *a2, ...)
{
  return [a1 maskRestingHeartRateSamplesWithSleepSamples];
}

id objc_msgSend_maximumQuantity(void *a1, const char *a2, ...)
{
  return [a1 maximumQuantity];
}

id objc_msgSend_mergedIntervals(void *a1, const char *a2, ...)
{
  return [a1 mergedIntervals];
}

id objc_msgSend_meterUnit(void *a1, const char *a2, ...)
{
  return [a1 meterUnit];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return [a1 minuteUnit];
}

id objc_msgSend_mondayGoal(void *a1, const char *a2, ...)
{
  return [a1 mondayGoal];
}

id objc_msgSend_moveIntervalComponents(void *a1, const char *a2, ...)
{
  return [a1 moveIntervalComponents];
}

id objc_msgSend_moveMinuteGoal(void *a1, const char *a2, ...)
{
  return [a1 moveMinuteGoal];
}

id objc_msgSend_moveMinuteValue(void *a1, const char *a2, ...)
{
  return [a1 moveMinuteValue];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_pauseRings(void *a1, const char *a2, ...)
{
  return [a1 pauseRings];
}

id objc_msgSend_pauseRingsScheduleType(void *a1, const char *a2, ...)
{
  return [a1 pauseRingsScheduleType];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_predicateForSeries(void *a1, const char *a2, ...)
{
  return [a1 predicateForSeries];
}

id objc_msgSend_previousDayHeartRateStatisticsBuilder(void *a1, const char *a2, ...)
{
  return [a1 previousDayHeartRateStatisticsBuilder];
}

id objc_msgSend_previousDayStatisticsBuilder(void *a1, const char *a2, ...)
{
  return [a1 previousDayStatisticsBuilder];
}

id objc_msgSend_profile(void *a1, const char *a2, ...)
{
  return [a1 profile];
}

id objc_msgSend_profileType(void *a1, const char *a2, ...)
{
  return [a1 profileType];
}

id objc_msgSend_protectedDatabase(void *a1, const char *a2, ...)
{
  return [a1 protectedDatabase];
}

id objc_msgSend_pushCountValue(void *a1, const char *a2, ...)
{
  return [a1 pushCountValue];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_quantityType(void *a1, const char *a2, ...)
{
  return [a1 quantityType];
}

id objc_msgSend_queryQueue(void *a1, const char *a2, ...)
{
  return [a1 queryQueue];
}

id objc_msgSend_queryState(void *a1, const char *a2, ...)
{
  return [a1 queryState];
}

id objc_msgSend_queryUUID(void *a1, const char *a2, ...)
{
  return [a1 queryUUID];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_reportTargetDayHeartRateAnalytics(void *a1, const char *a2, ...)
{
  return [a1 reportTargetDayHeartRateAnalytics];
}

id objc_msgSend_sampleType(void *a1, const char *a2, ...)
{
  return [a1 sampleType];
}

id objc_msgSend_saturdayGoal(void *a1, const char *a2, ...)
{
  return [a1 saturdayGoal];
}

id objc_msgSend_scheduledGoals(void *a1, const char *a2, ...)
{
  return [a1 scheduledGoals];
}

id objc_msgSend_sequence(void *a1, const char *a2, ...)
{
  return [a1 sequence];
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return [a1 sessionUUID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setFrozen(void *a1, const char *a2, ...)
{
  return [a1 setFrozen];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldDeactivateAfterInitialResults(void *a1, const char *a2, ...)
{
  return [a1 shouldDeactivateAfterInitialResults];
}

id objc_msgSend_shouldObserveActivityCache(void *a1, const char *a2, ...)
{
  return [a1 shouldObserveActivityCache];
}

id objc_msgSend_shouldShowActivityDemoData(void *a1, const char *a2, ...)
{
  return [a1 shouldShowActivityDemoData];
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceIdentifier];
}

id objc_msgSend_sourceManager(void *a1, const char *a2, ...)
{
  return [a1 sourceManager];
}

id objc_msgSend_sourceOrderManager(void *a1, const char *a2, ...)
{
  return [a1 sourceOrderManager];
}

id objc_msgSend_standGoal(void *a1, const char *a2, ...)
{
  return [a1 standGoal];
}

id objc_msgSend_standHourValue(void *a1, const char *a2, ...)
{
  return [a1 standHourValue];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startDateIndex(void *a1, const char *a2, ...)
{
  return [a1 startDateIndex];
}

id objc_msgSend_statisticsIntervalComponents(void *a1, const char *a2, ...)
{
  return [a1 statisticsIntervalComponents];
}

id objc_msgSend_stepCountValue(void *a1, const char *a2, ...)
{
  return [a1 stepCountValue];
}

id objc_msgSend_sundayGoal(void *a1, const char *a2, ...)
{
  return [a1 sundayGoal];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_targetDayHeartRateStatisticsBuilder(void *a1, const char *a2, ...)
{
  return [a1 targetDayHeartRateStatisticsBuilder];
}

id objc_msgSend_targetDayStatisticsBuilder(void *a1, const char *a2, ...)
{
  return [a1 targetDayStatisticsBuilder];
}

id objc_msgSend_thursdayGoal(void *a1, const char *a2, ...)
{
  return [a1 thursdayGoal];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_tuesdayGoal(void *a1, const char *a2, ...)
{
  return [a1 tuesdayGoal];
}

id objc_msgSend_typeIsValidForAllDayFromCompanion(void *a1, const char *a2, ...)
{
  return [a1 typeIsValidForAllDayFromCompanion];
}

id objc_msgSend_updateInterval(void *a1, const char *a2, ...)
{
  return [a1 updateInterval];
}

id objc_msgSend_userCharacteristicsManager(void *a1, const char *a2, ...)
{
  return [a1 userCharacteristicsManager];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_watchActivationType(void *a1, const char *a2, ...)
{
  return [a1 watchActivationType];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_wednesdayGoal(void *a1, const char *a2, ...)
{
  return [a1 wednesdayGoal];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUse];
}

id objc_msgSend_workoutSeriesAggregation(void *a1, const char *a2, ...)
{
  return [a1 workoutSeriesAggregation];
}

id objc_msgSend_workoutSourceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 workoutSourceIdentifier];
}

id objc_msgSend_workoutType(void *a1, const char *a2, ...)
{
  return [a1 workoutType];
}