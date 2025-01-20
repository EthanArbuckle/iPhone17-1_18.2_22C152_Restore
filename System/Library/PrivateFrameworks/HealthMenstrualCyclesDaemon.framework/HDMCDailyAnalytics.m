@interface HDMCDailyAnalytics
+ (BOOL)shouldSubmit;
+ (id)_countDeviationSamplesInPastYearOfType:(int64_t)a3 profile:(id)a4 calendar:(id)a5 error:(id *)a6;
+ (id)_daysWithWristTemperatureSamplesInDayIndexRange:(id)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6;
+ (id)_getDeviationDetectedCountForDeviationType:(int64_t)a3 gregorianCalendar:(id)a4 domain:(id)a5 error:(id *)a6;
+ (id)_hasConfirmedDeviationInPastMonthOfType:(int64_t)a3 profile:(id)a4 calendar:(id)a5 error:(id *)a6;
+ (id)_setCycleFactorRelatedFieldsInMetric:(id)a3 analysis:(id)a4 appProtectedKeyValueDomain:(id)a5 error:(id *)a6;
+ (id)_setCycleStatisticsFieldsInMetric:(id)a3 analysis:(id)a4 keyValueDomain:(id)a5 fertileWindowNotificationKeyValueDomain:(id)a6 todayDayIndex:(int64_t)a7 todayAsDate:(id)a8 gregorianCalendar:(id)a9 error:(id *)a10;
+ (id)_setDetectedDeviationFieldsInMetric:(id)a3 gregorianCalendar:(id)a4 deviationDetectionAnalyticsKeyValueDomain:(id)a5 todayDayIndex:(int64_t)a6 error:(id *)a7;
+ (id)_setDeviationSampleFieldsInMetric:(id)a3 profile:(id)a4 userCalendar:(id)a5 error:(id *)a6;
+ (id)_setDiagnosticOnboardingFieldsInMetric:(id)a3 keyValueDomain:(id)a4 heartRateInputFeatureStatus:(id)a5 deviationDetectionFeatureStatus:(id)a6 wristTemperatureInputFeatureStatus:(id)a7 gregorianCalendar:(id)a8 error:(id *)a9;
+ (id)_setFertileWindowFieldsInMetric:(id)a3 analysis:(id)a4 profile:(id)a5 todayDayIndex:(int64_t)a6 error:(id *)a7;
+ (id)_setPregnancyPropertiesInMetric:(id)a3 manager:(id)a4 todayAsDate:(id)a5 gregorianCalendar:(id)a6 error:(id *)a7;
- (BOOL)_collectDiagnosticFieldsForMetric:(id)a3 settingsManager:(id)a4 heartRateInputFeatureStatus:(id)a5 deviationDetectionFeatureStatus:(id)a6 wristTemperatureInputFeatureStatus:(id)a7 gregorianCalendar:(id)a8 error:(id *)a9;
- (BOOL)_collectSensitiveFieldsForMetric:(id)a3 settingsManager:(id)a4 menstrualCyclesSettings:(id)a5 heartRateInputFeatureStatus:(id)a6 deviationDetectionSettings:(id)a7 wristTemperatureInputFeatureStatus:(id)a8 gregorianCalendar:(id)a9 error:(id *)a10;
- (BOOL)submitMetricWithError:(id *)a3;
- (HDMCDailyAnalytics)initWithProfile:(id)a3 analysis:(id)a4 heartRateFeatureAvailabilityManager:(id)a5 deviationDetectionFeatureAvailabilityManager:(id)a6 wristTemperatureInputFeatureAvailabilityManager:(id)a7 pregnancyManager:(id)a8;
- (id)_eligibleCyclesStartPastDayIndex:(int64_t)a3;
- (id)_predicateForFirstPartySleepDataFromPast48HoursWithCalendar:(id)a3;
- (id)_predicateForSleepDataFromPast45DaysWithCalendar:(id)a3;
- (id)_predicateForSleepDataFromPast48HoursWithCalendar:(id)a3;
- (int64_t)_daysWithSleepSamples:(id)a3 calendar:(id)a4;
@end

@implementation HDMCDailyAnalytics

+ (id)_setDiagnosticOnboardingFieldsInMetric:(id)a3 keyValueDomain:(id)a4 heartRateInputFeatureStatus:(id)a5 deviationDetectionFeatureStatus:(id)a6 wristTemperatureInputFeatureStatus:(id)a7 gregorianCalendar:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v48 = a7;
  id v49 = a8;
  id v51 = 0;
  v18 = objc_msgSend(v15, "hdmc_legacyOnboardingVersionCompletedWithError:", &v51);
  id v19 = v51;
  v20 = v19;
  if (!v18 && v19)
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      +[HDMCDailyAnalytics(Onboarding) _setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](v21);
      if (a9) {
        goto LABEL_5;
      }
    }
    else if (a9)
    {
LABEL_5:
      id v22 = v20;
      id v23 = 0;
      *a9 = v22;
LABEL_21:
      v27 = v48;
      goto LABEL_22;
    }
    _HKLogDroppedError();
    id v23 = 0;
    id v22 = v20;
    goto LABEL_21;
  }
  v47 = v16;
  v24 = [NSNumber numberWithInt:v18 != 0];
  [v14 setOnboardingCompleted:v24];

  [v14 setOnboardedVersion:v18];
  id v50 = v20;
  v25 = objc_msgSend(v15, "hdmc_legacyOnboardingFirstCompletedDateWithError:", &v50);
  id v22 = v50;

  if (v25 || !v22)
  {
    if (v25)
    {
      v28 = NSNumber;
      v29 = [MEMORY[0x263EFF910] date];
      v30 = [v28 _weeksBetweenStartDate:v25 endDate:v29 calendar:v49];
      [v14 setWeeksSinceOnboarded:v30];
    }
    v31 = [MEMORY[0x263F57730] sharedInstance];
    v32 = [v31 getActivePairedDevice];

    if (v32)
    {
      v33 = NSNumber;
      v34 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"02979F49-FAFA-49CC-8478-C2562BC81FB6"];
      v35 = objc_msgSend(v33, "numberWithBool:", objc_msgSend(v32, "supportsCapability:", v34));
      [v14 setHasCompatiblePairedAppleWatch:v35];

      v36 = NSNumber;
      v37 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CBC78224-8F5E-4D43-8666-69ADBE2A6277"];
      v38 = objc_msgSend(v36, "numberWithBool:", objc_msgSend(v32, "supportsCapability:", v37));
      [v14 setHasWristTemperatureCompatiblePairedWatch:v38];

      v39 = [NSNumber numberWithBool:HKMCIsAlgorithmsVersionSameOnPairedDevice()];
      [v14 setHasSameAlgorithmVersionOnPairedWatch:v39];
    }
    uint64_t v40 = [v47 isOnboardingRecordPresent];
    v41 = [NSNumber numberWithBool:v40];
    [v14 setWasHeartRateInputDelivered:v41];

    uint64_t v42 = [v17 isOnboardingRecordPresent];
    v43 = [NSNumber numberWithBool:v42];
    [v14 setWasDeviationDetectionDelivered:v43];

    v27 = v48;
    uint64_t v44 = [v48 isOnboardingRecordPresent];
    v45 = [NSNumber numberWithBool:v44];
    [v14 setWasWristTemperatureInputDelivered:v45];

    id v23 = v14;
  }
  else
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x263F09930];
    v27 = v48;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCDailyAnalytics(Onboarding) _setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](v26);
    }
    if (a9)
    {
      id v23 = 0;
      *a9 = v22;
    }
    else
    {
      _HKLogDroppedError();
      id v23 = 0;
    }
  }

  id v16 = v47;
LABEL_22:

  return v23;
}

+ (id)_setDeviationSampleFieldsInMetric:(id)a3 profile:(id)a4 userCalendar:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v57 = 0;
  v12 = +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:1 profile:v10 calendar:v11 error:&v57];
  id v13 = v57;
  if (!v13)
  {
    v53 = [v12 objectForKeyedSubscript:@"countPastYear"];
    id v16 = [v12 objectForKeyedSubscript:@"hasConfirmedInThePastMonth"];
    id v56 = 0;
    id v17 = +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:2 profile:v10 calendar:v11 error:&v56];
    id v18 = v56;
    if (v18)
    {
      id v14 = v18;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:]();
        if (a6) {
          goto LABEL_8;
        }
      }
      else if (a6)
      {
LABEL_8:
        id v14 = v14;
        id v15 = 0;
        *a6 = v14;
LABEL_41:

        goto LABEL_42;
      }
      _HKLogDroppedError();
      id v15 = 0;
      goto LABEL_41;
    }
    id v50 = v16;
    id v51 = [v17 objectForKeyedSubscript:@"countPastYear"];
    v52 = [v17 objectForKeyedSubscript:@"hasConfirmedInThePastMonth"];
    id v55 = 0;
    id v19 = +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:3 profile:v10 calendar:v11 error:&v55];
    id v20 = v55;
    if (!v20)
    {
      [v19 objectForKeyedSubscript:@"countPastYear"];
      id v48 = v47 = v19;
      id v49 = [v19 objectForKeyedSubscript:@"hasConfirmedInThePastMonth"];
      id v54 = 0;
      v21 = +[HDMCDailyAnalytics _countDeviationSamplesInPastYearOfType:0 profile:v10 calendar:v11 error:&v54];
      id v14 = v54;
      v46 = v21;
      if (v14)
      {
        id v22 = v48;
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:]();
        }
        if (a6)
        {
          id v15 = 0;
          *a6 = v14;
        }
        else
        {
          _HKLogDroppedError();
          id v15 = 0;
        }
        uint64_t v42 = v49;
        v41 = v46;
      }
      else
      {
        id v23 = [v21 objectForKeyedSubscript:@"countPastYear"];
        v45 = [v21 objectForKeyedSubscript:@"hasConfirmedInThePastMonth"];
        [v9 setCountConfirmedSpottingDeviationPastYear:v53];
        [v9 setCountConfirmedIrregularDeviationPastYear:v51];
        [v9 setCountConfirmedInfrequentDeviationPastYear:v48];
        uint64_t v44 = v23;
        [v9 setCountConfirmedProlongedDeviationPastYear:v23];
        uint64_t v24 = [v53 integerValue];
        uint64_t v25 = [v51 integerValue] + v24;
        uint64_t v26 = [v48 integerValue];
        uint64_t v27 = [v23 integerValue];
        v28 = [NSNumber numberWithInteger:v25 + v26 + v27];
        [v9 setCountTotalConfirmedDeviationsPastYear:v28];

        uint64_t v29 = [v50 integerValue];
        uint64_t v30 = [v52 integerValue] + v29;
        uint64_t v31 = [v45 integerValue];
        uint64_t v32 = [v49 integerValue];
        v33 = [NSNumber numberWithInteger:v30 + v31 + v32];
        [v9 setCountTotalConfirmedDeviationsPastMonth:v33];

        uint64_t v34 = [v50 integerValue];
        uint64_t v35 = MEMORY[0x263EFFA80];
        uint64_t v36 = MEMORY[0x263EFFA88];
        if (v34 == 1) {
          uint64_t v37 = MEMORY[0x263EFFA88];
        }
        else {
          uint64_t v37 = MEMORY[0x263EFFA80];
        }
        [v9 setHasConfirmedSpottingDeviationPastMonth:v37];
        if ([v52 integerValue] == 1) {
          uint64_t v38 = v36;
        }
        else {
          uint64_t v38 = v35;
        }
        [v9 setHasConfirmedIrregularDeviationPastMonth:v38];
        if ([v49 integerValue] == 1) {
          uint64_t v39 = v36;
        }
        else {
          uint64_t v39 = v35;
        }
        [v9 setHasConfirmedInfrequentDeviationPastMonth:v39];
        if ([v45 integerValue] == 1) {
          uint64_t v40 = v36;
        }
        else {
          uint64_t v40 = v35;
        }
        [v9 setHasConfirmedProlongedDeviationPastMonth:v40];
        id v15 = v9;

        v41 = v46;
        id v22 = v48;
        uint64_t v42 = v49;
      }

      id v19 = v47;
      goto LABEL_40;
    }
    id v14 = v20;
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:]();
      if (a6) {
        goto LABEL_12;
      }
    }
    else if (a6)
    {
LABEL_12:
      id v14 = v14;
      id v15 = 0;
      *a6 = v14;
LABEL_40:

      id v16 = v50;
      goto LABEL_41;
    }
    _HKLogDroppedError();
    id v15 = 0;
    goto LABEL_40;
  }
  id v14 = v13;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
  {
    +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:].cold.4();
    if (a6) {
      goto LABEL_4;
    }
  }
  else if (a6)
  {
LABEL_4:
    id v14 = v14;
    id v15 = 0;
    *a6 = v14;
    goto LABEL_42;
  }
  _HKLogDroppedError();
  id v15 = 0;
LABEL_42:

  return v15;
}

+ (id)_countDeviationSamplesInPastYearOfType:(int64_t)a3 profile:(id)a4 calendar:(id)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  v12 = HKCategoryTypeFromDeviationType();
  id v13 = [MEMORY[0x263EFF910] date];
  v31[0] = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
  id v15 = objc_msgSend(v11, "hd_predicateForSamplesWithTypes:endingAfterDate:minusDays:", v14, v13, 365);

  id v26 = 0;
  uint64_t v16 = [MEMORY[0x263F43318] countOfSamplesWithType:v12 profile:v10 matchingPredicate:v15 withError:&v26];
  id v17 = v26;
  if (!v17)
  {
    if (v16 < 1)
    {
      v27[0] = @"countPastYear";
      id v18 = [NSNumber numberWithInteger:v16];
      v27[1] = @"hasConfirmedInThePastMonth";
      v28[0] = v18;
      v28[1] = &unk_26D8EE7D0;
      id v19 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      goto LABEL_15;
    }
    id v25 = 0;
    id v20 = [a1 _hasConfirmedDeviationInPastMonthOfType:a3 profile:v10 calendar:v11 error:&v25];
    id v21 = v25;
    id v18 = v21;
    if (v20)
    {
      v29[0] = @"countPastYear";
      id v22 = [NSNumber numberWithInteger:v16];
      v29[1] = @"hasConfirmedInThePastMonth";
      v30[0] = v22;
      v30[1] = v20;
      id v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
LABEL_14:

      goto LABEL_15;
    }
    id v23 = v21;
    id v22 = v23;
    if (v23)
    {
      if (a6)
      {
        id v22 = v23;
        id v19 = 0;
        *a6 = v22;
        goto LABEL_14;
      }
      _HKLogDroppedError();
    }
    id v19 = 0;
    goto LABEL_14;
  }
  id v18 = v17;
  if (a6)
  {
    id v18 = v17;
    id v19 = 0;
    *a6 = v18;
  }
  else
  {
    _HKLogDroppedError();
    id v19 = 0;
  }
LABEL_15:

  return v19;
}

+ (id)_hasConfirmedDeviationInPastMonthOfType:(int64_t)a3 profile:(id)a4 calendar:(id)a5 error:(id *)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = HKCategoryTypeFromDeviationType();
  id v23 = 0;
  id v11 = [MEMORY[0x263F43318] mostRecentSampleWithType:v10 profile:v9 encodingOptions:0 predicate:0 anchor:0 error:&v23];

  id v12 = v23;
  id v13 = v12;
  if (v11) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  if (v14)
  {
    id v15 = &unk_26D8EE7D0;
    if (v11)
    {
      uint64_t v16 = [v11 _creationDate];
      id v17 = [MEMORY[0x263EFF910] date];
      id v18 = objc_msgSend(v8, "hk_startOfDateByAddingDays:toDate:", -30, v17);
      int v19 = objc_msgSend(v16, "hk_isAfterOrEqualToDate:", v18);
      id v20 = &unk_26D8EE7E8;
      if (!v19) {
        id v20 = &unk_26D8EE7D0;
      }
      id v15 = v20;
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCDailyAnalytics(Deviation) _setDeviationSampleFieldsInMetric:profile:userCalendar:error:]();
    }
    if (a6)
    {
      id v15 = 0;
      *a6 = v13;
    }
    else
    {
      _HKLogDroppedError();
      id v15 = 0;
    }
  }

  return v15;
}

+ (id)_setDetectedDeviationFieldsInMetric:(id)a3 gregorianCalendar:(id)a4 deviationDetectionAnalyticsKeyValueDomain:(id)a5 todayDayIndex:(int64_t)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v53 = 0;
  BOOL v14 = +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:1 gregorianCalendar:v12 domain:v13 error:&v53];
  id v15 = v53;
  if (!v15)
  {
    id v48 = [v14 objectForKeyedSubscript:@"countPastYear"];
    objc_msgSend(v11, "setCountDetectedSpottingDeviationsPastYear:");
    id v52 = 0;
    id v18 = +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:2 gregorianCalendar:v12 domain:v13 error:&v52];
    id v19 = v52;
    if (v19)
    {
      id v16 = v19;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:]();
        if (a7) {
          goto LABEL_8;
        }
      }
      else if (a7)
      {
LABEL_8:
        id v16 = v16;
        id v17 = 0;
        *a7 = v16;
LABEL_39:

        goto LABEL_40;
      }
      _HKLogDroppedError();
      id v17 = 0;
      goto LABEL_39;
    }
    v47 = v18;
    v46 = [v18 objectForKeyedSubscript:@"countPastYear"];
    objc_msgSend(v11, "setCountDetectedIrregularDeviationsInPastYear:");
    id v51 = 0;
    id v20 = +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:3 gregorianCalendar:v12 domain:v13 error:&v51];
    id v21 = v51;
    if (v21)
    {
      id v16 = v21;
      id v22 = v20;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
      {
        +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:]();
        if (a7) {
          goto LABEL_12;
        }
      }
      else if (a7)
      {
LABEL_12:
        id v23 = v46;
        id v16 = v16;
        id v17 = 0;
        *a7 = v16;
LABEL_33:
        id v18 = v47;
LABEL_38:

        goto LABEL_39;
      }
      id v23 = v46;
      _HKLogDroppedError();
      id v17 = 0;
      goto LABEL_33;
    }
    uint64_t v44 = [v20 objectForKeyedSubscript:@"countPastYear"];
    objc_msgSend(v11, "setCountDetectedInfrequentDeviationsPastYear:");
    id v50 = 0;
    uint64_t v24 = +[HDMCDailyAnalytics _getDeviationDetectedCountForDeviationType:0 gregorianCalendar:v12 domain:v13 error:&v50];
    id v25 = v50;
    v45 = v24;
    if (v25)
    {
      id v16 = v25;
      id v22 = v20;
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:]();
      }
      id v23 = v46;
      if (a7)
      {
        id v16 = v16;
        id v17 = 0;
        *a7 = v16;
      }
      else
      {
        _HKLogDroppedError();
        id v17 = 0;
      }
      id v18 = v47;
      goto LABEL_37;
    }
    id v26 = [v24 objectForKeyedSubscript:@"countPastYear"];
    [v11 setCountDetectedProlongedDeviationsPastYear:v26];
    uint64_t v42 = NSNumber;
    uint64_t v40 = [v48 integerValue];
    uint64_t v38 = [v46 integerValue] + v40;
    v41 = v26;
    uint64_t v27 = objc_msgSend(v42, "numberWithInteger:", v38 + objc_msgSend(v44, "integerValue") + objc_msgSend(v26, "integerValue"));
    [v11 setCountTotalDetectedDeviationsPastYear:v27];

    v28 = [v14 objectForKeyedSubscript:@"countPastMonth"];
    v43 = v20;
    uint64_t v29 = [v20 objectForKeyedSubscript:@"countPastMonth"];
    uint64_t v30 = [v47 objectForKeyedSubscript:@"countPastMonth"];
    uint64_t v36 = [v45 objectForKeyedSubscript:@"countPastMonth"];
    uint64_t v37 = v28;
    uint64_t v39 = v29;
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v29, "integerValue")+ objc_msgSend(v28, "integerValue")+ objc_msgSend(v30, "integerValue")+ objc_msgSend(v36, "integerValue"));
    [v11 setCountTotalDetectedDeviationsPastMonth:v31];

    uint64_t v32 = *MEMORY[0x263F450F8];
    id v49 = 0;
    v33 = [v13 numberForKey:v32 error:&v49];
    id v16 = v49;
    if (!v16)
    {
      if (v33)
      {
        uint64_t v34 = objc_msgSend(NSNumber, "numberWithInteger:", a6 - objc_msgSend(v33, "integerValue"));
        [v11 setDaysSinceDeviationTilePosted:v34];
      }
      id v23 = v46;
      id v17 = v11;
      goto LABEL_36;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:]();
      if (a7) {
        goto LABEL_23;
      }
    }
    else if (a7)
    {
LABEL_23:
      id v23 = v46;
      id v17 = 0;
      *a7 = v16;
LABEL_36:

      id v18 = v47;
      id v22 = v43;
LABEL_37:

      goto LABEL_38;
    }
    id v23 = v46;
    _HKLogDroppedError();
    id v17 = 0;
    goto LABEL_36;
  }
  id v16 = v15;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
  {
    +[HDMCDailyAnalytics(Deviation) _setDetectedDeviationFieldsInMetric:gregorianCalendar:deviationDetectionAnalyticsKeyValueDomain:todayDayIndex:error:]();
    if (a7) {
      goto LABEL_4;
    }
  }
  else if (a7)
  {
LABEL_4:
    id v16 = v16;
    id v17 = 0;
    *a7 = v16;
    goto LABEL_40;
  }
  _HKLogDroppedError();
  id v17 = 0;
LABEL_40:

  return v17;
}

+ (id)_getDeviationDetectedCountForDeviationType:(int64_t)a3 gregorianCalendar:(id)a4 domain:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = HKMCDeviationDetectionAnalyticsKeyFromDeviationType();
  id v25 = 0;
  id v11 = [v9 propertyListValueForKey:v10 error:&v25];

  id v12 = v25;
  id v13 = v12;
  if (v11 || !v12)
  {
    uint64_t v16 = HKMCTodayIndex();
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __107__HDMCDailyAnalytics_Deviation___getDeviationDetectedCountForDeviationType_gregorianCalendar_domain_error___block_invoke;
    v24[3] = &__block_descriptor_40_e18_B16__0__NSNumber_8l;
    v24[4] = v16 - 30;
    id v17 = objc_msgSend(v11, "hk_filter:", v24);
    v26[0] = @"countPastYear";
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v26[1] = @"countPastMonth";
    v27[0] = v18;
    id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
    v27[1] = v19;
    id v15 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  }
  else
  {
    _HKInitializeLogging();
    BOOL v14 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
    {
      id v21 = v14;
      id v22 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v22;
      __int16 v30 = 2114;
      uint64_t v31 = v10;
      __int16 v32 = 2114;
      v33 = v13;
      id v23 = v22;
      _os_log_error_impl(&dword_225722000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@: %{public}@", buf, 0x20u);
    }
    if (a6)
    {
      id v15 = 0;
      *a6 = v13;
    }
    else
    {
      _HKLogDroppedError();
      id v15 = 0;
    }
  }

  return v15;
}

BOOL __107__HDMCDailyAnalytics_Deviation___getDeviationDetectedCountForDeviationType_gregorianCalendar_domain_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] > *(void *)(a1 + 32);
}

+ (id)_setCycleFactorRelatedFieldsInMetric:(id)a3 analysis:(id)a4 appProtectedKeyValueDomain:(id)a5 error:(id *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = [a4 ongoingCycleFactors];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    uint64_t v15 = MEMORY[0x263EFFA88];
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v16), "hkmc_cycleFactor");
        if ((unint64_t)(v17 - 3) >= 7)
        {
          if (v17 == 2)
          {
            [v9 setOngoingPregnancy:v15];
          }
          else if (v17 == 1)
          {
            [v9 setOngoingLactation:v15];
          }
        }
        else
        {
          [v9 setOngoingContraception:v15];
        }
        ++v16;
      }
      while (v13 != v16);
      uint64_t v18 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v13 = v18;
    }
    while (v18);
  }

  uint64_t v19 = *MEMORY[0x263F44F20];
  id v27 = 0;
  id v20 = [v10 numberForKey:v19 error:&v27];
  id v21 = v27;
  id v22 = v21;
  if (v20) {
    BOOL v23 = 1;
  }
  else {
    BOOL v23 = v21 == 0;
  }
  if (v23)
  {
    [v9 setIsEligibleForCycleFactorsReminder:v20];
    id v24 = v9;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCDailyAnalytics(Deviation) _setCycleFactorRelatedFieldsInMetric:analysis:appProtectedKeyValueDomain:error:]();
    }
    if (a6)
    {
      id v24 = 0;
      *a6 = v22;
    }
    else
    {
      _HKLogDroppedError();
      id v24 = 0;
    }
  }

  return v24;
}

+ (BOOL)shouldSubmit
{
  v2 = +[HDMCDailyMetric eventName];
  char IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

- (HDMCDailyAnalytics)initWithProfile:(id)a3 analysis:(id)a4 heartRateFeatureAvailabilityManager:(id)a5 deviationDetectionFeatureAvailabilityManager:(id)a6 wristTemperatureInputFeatureAvailabilityManager:(id)a7 pregnancyManager:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v40.receiver = self;
  v40.super_class = (Class)HDMCDailyAnalytics;
  id v21 = [(HDMCDailyAnalytics *)&v40 init];
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    objc_storeStrong((id *)&v22->_analysis, a4);
    uint64_t v23 = objc_msgSend(MEMORY[0x263F43218], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v22->_profile);
    keyValueDomain = v22->_keyValueDomain;
    v22->_keyValueDomain = (HDKeyValueDomain *)v23;

    uint64_t v25 = objc_msgSend(MEMORY[0x263F43218], "hdmc_syncedUnprotectedDomainWithProfile:", v22->_profile);
    fertileWindowNotificationKeyValueDomain = v22->_fertileWindowNotificationKeyValueDomain;
    v22->_fertileWindowNotificationKeyValueDomain = (HDKeyValueDomain *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v17 healthDataSource:v15];
    heartRateFeatureStatusManager = v22->_heartRateFeatureStatusManager;
    v22->_heartRateFeatureStatusManager = (HKFeatureStatusManager *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v18 healthDataSource:v15];
    deviationDetectionFeatureStatusManager = v22->_deviationDetectionFeatureStatusManager;
    v22->_deviationDetectionFeatureStatusManager = (HKFeatureStatusManager *)v29;

    uint64_t v31 = objc_msgSend(MEMORY[0x263F43218], "hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:", v22->_profile);
    deviationDetectionAnalyticsKeyValueDomain = v22->_deviationDetectionAnalyticsKeyValueDomain;
    v22->_deviationDetectionAnalyticsKeyValueDomain = (HDKeyValueDomain *)v31;

    uint64_t v33 = objc_msgSend(MEMORY[0x263F43218], "hdmc_appProtectedSyncedMenstrualCyclesDefaultsDomainWithProfile:", v22->_profile);
    appProtectedKeyValueDomain = v22->_appProtectedKeyValueDomain;
    v22->_appProtectedKeyValueDomain = (HDKeyValueDomain *)v33;

    uint64_t v35 = [objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v19 healthDataSource:v15];
    wristTemperatureInputFeatureStatusManager = v22->_wristTemperatureInputFeatureStatusManager;
    v22->_wristTemperatureInputFeatureStatusManager = (HKFeatureStatusManager *)v35;

    objc_storeStrong((id *)&v22->_pregnancyManager, a8);
    uint64_t v37 = [objc_alloc(MEMORY[0x263F75EA8]) initWithIdentifier:@"HDMCDailyAnalytics" healthStore:0 options:2];
    sleepStore = v22->_sleepStore;
    v22->_sleepStore = (HKSPSleepStore *)v37;
  }
  return v22;
}

- (BOOL)submitMetricWithError:(id *)a3
{
  v5 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
  v6 = [[HDMCDailyMetric alloc] initWithImproveHealthAndActivityAllowed:HKImproveHealthAndActivityAnalyticsAllowed()];
  v7 = [(HDProfile *)self->_profile featureSettingsManager];
  uint64_t v8 = *MEMORY[0x263F09798];
  id v39 = 0;
  id v9 = [v7 featureSettingsForFeatureIdentifier:v8 error:&v39];
  id v10 = v39;

  if (v9)
  {
    heartRateFeatureStatusManager = self->_heartRateFeatureStatusManager;
    id v38 = v10;
    id v12 = [(HKFeatureStatusManager *)heartRateFeatureStatusManager featureStatusWithError:&v38];
    id v13 = v38;

    uint64_t v35 = v6;
    if (v12)
    {
      deviationDetectionFeatureStatusManager = self->_deviationDetectionFeatureStatusManager;
      id v37 = v13;
      id v15 = [(HKFeatureStatusManager *)deviationDetectionFeatureStatusManager featureStatusWithError:&v37];
      id v16 = v37;

      uint64_t v34 = v5;
      if (v15)
      {
        id v17 = (id)[objc_alloc(MEMORY[0x263F451E0]) initWithObservationEnabled:0];
        wristTemperatureInputFeatureStatusManager = self->_wristTemperatureInputFeatureStatusManager;
        id v36 = v16;
        id v19 = [(HKFeatureStatusManager *)wristTemperatureInputFeatureStatusManager featureStatusWithError:&v36];
        id v20 = v36;

        BOOL v21 = v19 != 0;
        if (v19)
        {
          if (![(HDMCDailyAnalytics *)self _collectDiagnosticFieldsForMetric:v35 settingsManager:v17 heartRateInputFeatureStatus:v12 deviationDetectionFeatureStatus:v15 wristTemperatureInputFeatureStatus:v19 gregorianCalendar:v34 error:a3])goto LABEL_23; {
          uint64_t v33 = [v15 onboardingRecord];
          }
          uint64_t v22 = [v33 featureSettings];
          uint64_t v23 = self;
          id v24 = (void *)v22;
          BOOL v25 = [(HDMCDailyAnalytics *)v23 _collectSensitiveFieldsForMetric:v35 settingsManager:v17 menstrualCyclesSettings:v9 heartRateInputFeatureStatus:v12 deviationDetectionSettings:v22 wristTemperatureInputFeatureStatus:v19 gregorianCalendar:v34 error:a3];

          if (!v25)
          {
LABEL_23:
            BOOL v21 = 0;
LABEL_37:

            goto LABEL_38;
          }
          id v26 = [(id)objc_opt_class() eventName];
          uint64_t v27 = [(HDMCDailyMetric *)v35 eventPayload];
          AnalyticsSendEvent();
        }
        else
        {
          _HKInitializeLogging();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
            -[HDMCDailyAnalytics submitMetricWithError:].cold.4();
          }
          id v31 = v20;
          id v26 = v31;
          if (v31)
          {
            if (a3)
            {
              id v26 = v31;
              *a3 = v26;
            }
            else
            {
              _HKLogDroppedError();
            }
          }
        }

        goto LABEL_37;
      }
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        -[HDMCDailyAnalytics submitMetricWithError:]();
      }
      id v30 = v16;
      id v17 = v30;
      if (v30)
      {
        if (a3)
        {
          id v17 = v30;
          BOOL v21 = 0;
          *a3 = v17;
          id v20 = v17;
LABEL_38:

          v5 = v34;
          goto LABEL_39;
        }
        _HKLogDroppedError();
      }
      BOOL v21 = 0;
      id v20 = v17;
      goto LABEL_38;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCDailyAnalytics submitMetricWithError:]();
    }
    id v29 = v13;
    id v15 = v29;
    if (v29)
    {
      if (a3)
      {
        id v15 = v29;
        BOOL v21 = 0;
        *a3 = v15;
        id v20 = v15;
LABEL_39:

        v6 = v35;
        goto LABEL_40;
      }
      _HKLogDroppedError();
    }
    BOOL v21 = 0;
    id v20 = v15;
    goto LABEL_39;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    -[HDMCDailyAnalytics submitMetricWithError:]();
  }
  id v28 = v10;
  id v12 = v28;
  if (!v28) {
    goto LABEL_30;
  }
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_30:
    BOOL v21 = 0;
    id v20 = v12;
    goto LABEL_40;
  }
  id v12 = v28;
  BOOL v21 = 0;
  *a3 = v12;
  id v20 = v12;
LABEL_40:

  return v21;
}

- (BOOL)_collectDiagnosticFieldsForMetric:(id)a3 settingsManager:(id)a4 heartRateInputFeatureStatus:(id)a5 deviationDetectionFeatureStatus:(id)a6 wristTemperatureInputFeatureStatus:(id)a7 gregorianCalendar:(id)a8 error:(id *)a9
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v73 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  keyValueDomain = self->_keyValueDomain;
  id v91 = 0;
  v69 = v16;
  v70 = v17;
  v71 = v18;
  id v74 = v19;
  BOOL v21 = +[HDMCDailyAnalytics _setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](HDMCDailyAnalytics, "_setDiagnosticOnboardingFieldsInMetric:keyValueDomain:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:", v15, keyValueDomain, v16, v17, v18, &v91);
  id v22 = v91;
  if (v21)
  {
    id v23 = v21;

    sleepStore = self->_sleepStore;
    id v90 = v22;
    id v25 = [(HKSPSleepStore *)sleepStore currentSleepEventRecordWithError:&v90];
    id v26 = v90;

    v68 = [v25 sleepCoachingOnboardingFirstCompletedDate];
    v65 = [v25 sleepTrackingOnboardingFirstCompletedDate];
    uint64_t v27 = 0;
    if (v68 && v65) {
      uint64_t v27 = [(HKSPSleepStore *)self->_sleepStore hasSleepFocusMode];
    }
    id v28 = [NSNumber numberWithBool:v27];
    [v23 setIsSleepConfiguredToAllowWristTemperatureMeasurements:v28];

    v66 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
    id v29 = [MEMORY[0x263EFF910] date];
    uint64_t v30 = objc_msgSend(v29, "hk_morningIndexWithCalendar:", v74);

    id v72 = objc_alloc_init(MEMORY[0x263F0A130]);
    LOBYTE(v63) = 1;
    v67 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", self->_profile, v72, v30 - 45, 45, 1, 0, v63);
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x2020000000;
    uint64_t v89 = 0;
    uint64_t v80 = 0;
    v81 = &v80;
    uint64_t v82 = 0x3032000000;
    v83 = __Block_byref_object_copy__2;
    v84 = __Block_byref_object_dispose__2;
    id v85 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v78[5] = &v80;
    id v79 = v26;
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke;
    v78[3] = &unk_2647509F0;
    v78[4] = &v86;
    LOBYTE(v30) = [(HDMCDaySummaryEnumerator *)v67 enumerateWithError:&v79 handler:v78];
    id v31 = v79;

    if (v30)
    {
      __int16 v32 = [NSNumber numberWithInteger:v87[3]];
      [v23 setDaysWithWristTempInPast45Days:v32];

      uint64_t v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v81[5], "count"));
      [v23 setCountWatchesWithWristTempMeasurementDataInLast45Days:v33];
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v33 = (id)*MEMORY[0x263F09930];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v36 = objc_opt_class();
        -[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](v36, (uint64_t)v31, (uint64_t)v93);
      }
    }

    id v37 = (void *)MEMORY[0x263F43318];
    profile = self->_profile;
    id v39 = [(HDMCDailyAnalytics *)self _predicateForSleepDataFromPast45DaysWithCalendar:v74];
    id v77 = v31;
    objc_super v40 = [v37 samplesWithType:v66 profile:profile encodingOptions:MEMORY[0x263EFFA78] predicate:v39 limit:0 anchor:0 error:&v77];
    id v41 = v77;

    if ([v40 count])
    {
      int64_t v42 = [(HDMCDailyAnalytics *)self _daysWithSleepSamples:v40 calendar:v74];
      v43 = [NSNumber numberWithInteger:v42];
      [v23 setDaysWornWatchToSleepInLast45Days:v43];
    }
    uint64_t v44 = [(HKMCAnalysis *)self->_analysis fertileWindowProjections];
    BOOL v45 = [v44 count] == 0;

    if (v45)
    {
      id v53 = v67;
      id v55 = v41;
    }
    else
    {
      v46 = [(HKMCAnalysis *)self->_analysis fertileWindowProjections];
      v47 = [v46 firstObject];
      uint64_t v48 = [v47 allDays];
      uint64_t v50 = v49;

      id v51 = [HDMCDaySummaryEnumerator alloc];
      if (v50 <= 0) {
        uint64_t v52 = 0x7FFFFFFFFFFFFFD3;
      }
      else {
        uint64_t v52 = v50 + v48 - 45;
      }
      LOBYTE(v64) = 1;
      id v53 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v51, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", self->_profile, v72, v52, 45, 1, 0, v64);

      v87[3] = 0;
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke_297;
      v75[3] = &unk_264750A18;
      v75[4] = &v86;
      id v76 = v41;
      BOOL v54 = [(HDMCDaySummaryEnumerator *)v53 enumerateWithError:&v76 handler:v75];
      id v55 = v76;

      if (v54)
      {
        id v56 = [NSNumber numberWithInteger:v87[3]];
        [v23 setDaysWithWristTempIn45DaysBeforeFertileWindowEnd:v56];
      }
      else
      {
        _HKInitializeLogging();
        id v56 = (id)*MEMORY[0x263F09930];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          id v57 = objc_opt_class();
          -[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](v57, (uint64_t)v55, (uint64_t)v92);
        }
      }
    }
    v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v73, "internalCycleFactorsOverrideEnabled"));
    [v23 setInternalLiveOnCycleFactorOverrideEnabled:v58];

    v59 = NSNumber;
    v60 = [(HDProfile *)self->_profile notificationManager];
    v61 = objc_msgSend(v59, "numberWithBool:", objc_msgSend(v60, "areHealthNotificationsAuthorized"));
    [v23 setAreHealthNotificationsAuthorized:v61];

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v86, 8);

    id v15 = v23;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v34 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      -[HDMCDailyAnalytics _collectDiagnosticFieldsForMetric:settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:](v34, (uint64_t)self, (uint64_t)v22);
    }
    id v35 = v22;
    id v25 = v35;
    if (v35)
    {
      if (a9)
      {
        id v25 = v35;
        *a9 = v25;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    id v55 = v25;
  }

  return v21 != 0;
}

void __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 wristTemperature];

  if (v3)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v5 = [v7 wristTemperature];
    v6 = [v5 watchBundleIdentifier];
    [v4 addObject:v6];
  }
}

void __191__HDMCDailyAnalytics__collectDiagnosticFieldsForMetric_settingsManager_heartRateInputFeatureStatus_deviationDetectionFeatureStatus_wristTemperatureInputFeatureStatus_gregorianCalendar_error___block_invoke_297(uint64_t a1, void *a2)
{
  v3 = [a2 wristTemperature];

  if (v3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (BOOL)_collectSensitiveFieldsForMetric:(id)a3 settingsManager:(id)a4 menstrualCyclesSettings:(id)a5 heartRateInputFeatureStatus:(id)a6 deviationDetectionSettings:(id)a7 wristTemperatureInputFeatureStatus:(id)a8 gregorianCalendar:(id)a9 error:(id *)a10
{
  uint64_t v300 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = v16;
  if ([v16 isImproveHealthAndActivityAllowed])
  {
    v274 = v21;
    id v264 = (id)HKMCTodayIndex();
    v275 = [MEMORY[0x263EFF910] date];
    id v24 = [(HDProfile *)self->_profile deviceContextManager];
    id v294 = 0;
    id v25 = [v24 numberOfDeviceContextsPerDeviceType:&v294];
    id v26 = v294;

    if (v25)
    {
      v269 = v20;
      uint64_t v27 = [v25 objectForKeyedSubscript:&unk_26D8EE800];
      if (v27)
      {
        id v28 = [v25 objectForKeyedSubscript:&unk_26D8EE800];
        [v23 setCountPairediPhone:v28];
      }
      else
      {
        [v23 setCountPairediPhone:&unk_26D8EE818];
      }

      id v38 = [v25 objectForKeyedSubscript:&unk_26D8EE830];
      if (v38)
      {
        id v39 = [v25 objectForKeyedSubscript:&unk_26D8EE830];
        [v23 setCountPairediPad:v39];
      }
      else
      {
        [v23 setCountPairediPad:&unk_26D8EE818];
      }

      objc_super v40 = [v25 objectForKeyedSubscript:&unk_26D8EE848];
      id v271 = v22;
      if (v40)
      {
        id v41 = [v25 objectForKeyedSubscript:&unk_26D8EE848];
        [v23 setCountPairedWatch:v41];
      }
      else
      {
        [v23 setCountPairedWatch:&unk_26D8EE818];
      }
      v267 = v17;

      int64_t v42 = [v25 objectForKeyedSubscript:&unk_26D8EE860];
      v268 = v19;
      v270 = self;
      id v43 = v18;
      if (v42)
      {
        uint64_t v44 = [v25 objectForKeyedSubscript:&unk_26D8EE860];
        [v23 setCountPairedVisionPro:v44];
      }
      else
      {
        [v23 setCountPairedVisionPro:&unk_26D8EE818];
      }

      uint64_t v45 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:*MEMORY[0x263F09468]];
      v46 = [(HDProfile *)self->_profile userCharacteristicsManager];
      id v293 = v26;
      v266 = (void *)v45;
      uint64_t v47 = [v46 userCharacteristicForType:v45 error:&v293];
      id v37 = v293;

      v272 = (void *)v47;
      if (v47 || !v37)
      {
        if (v47)
        {
          uint64_t v48 = NSNumber;
          uint64_t v49 = [MEMORY[0x263EFF910] date];
          uint64_t v50 = [v48 _yearsBetweenStartDateComponents:v47 endDate:v49 calendar:v271];

          if (!v50)
          {
            _HKInitializeLogging();
            id v51 = (void *)*MEMORY[0x263F09930];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
              -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]6(v51);
            }
          }
          [v23 setAge:v50];
        }
        uint64_t v52 = [MEMORY[0x263F0A598] characteristicTypeForIdentifier:*MEMORY[0x263F09458]];
        id v53 = [(HDProfile *)self->_profile userCharacteristicsManager];
        id v292 = v37;
        v263 = (void *)v52;
        uint64_t v54 = [v53 userCharacteristicForType:v52 error:&v292];
        id v55 = v292;

        id v56 = (void *)v54;
        if (v54 || !v55)
        {
          v261 = (void *)v54;
          v262 = v43;
          [v23 setBiologicalSex:v54];
          uint64_t v57 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
          v58 = (void *)MEMORY[0x263F43318];
          profile = self->_profile;
          v60 = [(HDMCDailyAnalytics *)self _predicateForSleepDataFromPast48HoursWithCalendar:v271];
          id v291 = v55;
          v61 = [v58 samplesWithType:v57 profile:profile encodingOptions:MEMORY[0x263EFFA78] predicate:v60 limit:0 anchor:0 error:&v291];
          id v62 = v291;

          v259 = v61;
          v260 = (void *)v57;
          if (v61)
          {
            uint64_t v63 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v61, "count") != 0);
            [v23 setHasSleepSamplesPast48Hours:v63];

            uint64_t v64 = (void *)MEMORY[0x263F43318];
            v65 = self->_profile;
            v66 = [(HDMCDailyAnalytics *)self _predicateForFirstPartySleepDataFromPast48HoursWithCalendar:v271];
            id v290 = v62;
            v67 = [v64 samplesWithType:v57 profile:v65 encodingOptions:MEMORY[0x263EFFA78] predicate:v66 limit:0 anchor:0 error:&v290];
            id v68 = v290;

            id v258 = v67;
            if (v67)
            {
              v69 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v67, "count") != 0);
              [v23 setHasFirstPartySleepSamplesPast48Hours:v69];

              analysis = self->_analysis;
              keyValueDomain = self->_keyValueDomain;
              fertileWindowNotificationKeyValueDomain = self->_fertileWindowNotificationKeyValueDomain;
              id v289 = v68;
              id v73 = +[HDMCDailyAnalytics _setCycleStatisticsFieldsInMetric:v23 analysis:analysis keyValueDomain:keyValueDomain fertileWindowNotificationKeyValueDomain:fertileWindowNotificationKeyValueDomain todayDayIndex:v264 todayAsDate:v275 gregorianCalendar:v271 error:&v289];
              id v74 = v289;

              id v17 = v267;
              id v257 = v73;
              if (v73)
              {
                v253 = v74;
                id v75 = v73;

                id v76 = [v262 numberForKey:*MEMORY[0x263F44F10]];
                [v75 setPeriodPredictionEnabled:v76];

                id v77 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v267, "menstruationNotificationsEnabled"));
                [v75 setPeriodNotificationEnabled:v77];

                v78 = [v262 numberForKey:*MEMORY[0x263F44F08]];
                [v75 setFertilityPredictionEnabled:v78];

                id v79 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v267, "fertileWindowNotificationsEnabled"));
                [v75 setFertilityNotificationEnabled:v79];

                uint64_t v80 = [v268 onboardingRecord];
                v81 = [v80 featureSettings];
                uint64_t v82 = *MEMORY[0x263F09820];
                v83 = [v81 numberForKey:*MEMORY[0x263F09820]];
                [v75 setSensorBasedPredictionEnabled:v83];

                v84 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 1));
                [v75 setDeviationDetectionSpottingEnabled:v84];

                id v85 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 2));
                [v75 setDeviationDetectionIrregularEnabled:v85];

                uint64_t v86 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 3));
                [v75 setDeviationDetectionInfrequentEnabled:v86];

                v87 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v269, "deviationDetectionEnabledForType:", 0));
                [v75 setDeviationDetectionProlongedEnabled:v87];

                uint64_t v88 = [v274 onboardingRecord];
                uint64_t v89 = [v88 featureSettings];
                id v90 = [v89 numberForKey:v82];
                [v75 setWristTemperatureBasedPredictionEnabled:v90];

                id v19 = v268;
                id v91 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F70]));
                [v75 setLogFactorsEnabled:v91];

                v92 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44FA8]));
                [v75 setLogSymptomsEnabled:v92];

                v93 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F78]));
                [v75 setLogSpottingEnabled:v93];

                uint64_t v94 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44FA0]));
                [v75 setLogSexualActivityEnabled:v94];

                v95 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F68]));
                [v75 setLogCervicalMucusQualityEnabled:v95];

                v96 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F50]));
                [v75 setLogBasalBodyTemperatureEnabled:v96];

                v97 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F88]));
                [v75 setLogOvulationTestResultEnabled:v97];

                v98 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F90]));
                [v75 setLogPregnancyTestResultEnabled:v98];

                v99 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v262, "isLoggingVisibleForDisplayTypeIdentifier:", *MEMORY[0x263F44F98]));
                [v75 setLogProgesteroneTestResultEnabled:v99];

                id v18 = v262;
                if ([v268 isOnboardingRecordPresent])
                {
                  v100 = [v268 onboardingRecord];
                  v101 = [v100 onboardingCompletion];
                  v102 = [v101 countryCode];
                  [v75 setHeartRateInputDeliveryCountryCode:v102];

                  id v19 = v268;
                }
                uint64_t v103 = [MEMORY[0x263EFF8F0] currentCalendar];
                v104 = self->_profile;
                v288[1] = v253;
                id v252 = (id)v103;
                v105 = +[HDMCDailyAnalytics _setDeviationSampleFieldsInMetric:profile:userCalendar:error:](HDMCDailyAnalytics, "_setDeviationSampleFieldsInMetric:profile:userCalendar:error:", v75, v104);
                id v106 = v253;

                if (v105)
                {
                  v251 = v105;
                  id v107 = v105;

                  deviationDetectionAnalyticsKeyValueDomain = self->_deviationDetectionAnalyticsKeyValueDomain;
                  v288[0] = v106;
                  v109 = +[HDMCDailyAnalytics _setDetectedDeviationFieldsInMetric:v107 gregorianCalendar:v271 deviationDetectionAnalyticsKeyValueDomain:deviationDetectionAnalyticsKeyValueDomain todayDayIndex:v264 error:v288];
                  id v110 = v288[0];

                  v250 = v109;
                  if (v109)
                  {
                    id v111 = v109;

                    v112 = self->_analysis;
                    appProtectedKeyValueDomain = self->_appProtectedKeyValueDomain;
                    id v287 = v110;
                    id v114 = +[HDMCDailyAnalytics _setCycleFactorRelatedFieldsInMetric:v111 analysis:v112 appProtectedKeyValueDomain:appProtectedKeyValueDomain error:&v287];
                    id v115 = v287;

                    if (v114)
                    {
                      id v248 = v114;
                      id v249 = v114;

                      sleepStore = self->_sleepStore;
                      id v286 = v115;
                      id v117 = [(HKSPSleepStore *)sleepStore currentSleepEventRecordWithError:&v286];
                      id v118 = v286;

                      if (v117)
                      {
                        id v247 = [v117 sleepCoachingOnboardingFirstCompletedDate];
                        v246 = [v117 sleepTrackingOnboardingFirstCompletedDate];
                        v119 = self->_sleepStore;
                        id v285 = v118;
                        v120 = [(HKSPSleepStore *)v119 currentSleepSettingsWithError:&v285];
                        id v121 = v285;

                        v244 = v120;
                        if (v120)
                        {
                          v122 = objc_msgSend(NSNumber, "numberWithInt:", (objc_msgSend(v120, "sleepModeOptions") >> 14) & 1);
                          [v249 setIsSleepScreenEnabled:v122];
                        }
                        else
                        {
                          _HKInitializeLogging();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]5();
                          }
                          [v249 setIsSleepScreenEnabled:*MEMORY[0x263F091A8]];
                        }
                        v132 = self->_sleepStore;
                        id v284 = v121;
                        v133 = [(HKSPSleepStore *)v132 currentSleepScheduleWithError:&v284];
                        id v134 = v284;

                        v243 = v133;
                        if (v133)
                        {
                          v135 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v133, "isEnabled"));
                          [v249 setIsSleepScheduleEnabled:v135];
                        }
                        else
                        {
                          _HKInitializeLogging();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]4();
                          }
                          [v249 setIsSleepScheduleEnabled:*MEMORY[0x263F091A8]];
                        }
                        [(HDProfile *)self->_profile featureAvailabilityProvidingForFeatureIdentifier:*MEMORY[0x263F097F8]];
                        v242 = id v283 = v134;
                        uint64_t v136 = [v242 featureOnboardingRecordWithError:&v283];
                        id v137 = v283;

                        v138 = &off_264750000;
                        v245 = (void *)v136;
                        if (v136)
                        {
                          int v139 = [v274 isOnboardingRecordPresent];
                          id v241 = v117;
                          id v140 = v271;
                          v141 = v249;
                          if (v139)
                          {
                            v142 = [v274 onboardingRecord];
                            v143 = [v142 onboardingCompletion];
                            [v143 countryCode];
                            v145 = id v144 = v137;
                            [v249 setWristTemperatureInputDeliveryCountryCode:v145];

                            id v137 = v144;
                            v141 = v249;

                            id v140 = v271;
                            id v19 = v268;
                          }
                          if (v247)
                          {
                            if (v246)
                            {
                              if ((v139 & [(HKSPSleepStore *)self->_sleepStore hasSleepFocusMode]) == 1)
                              {
                                v146 = [v245 onboardingCompletion];

                                if (v146)
                                {
                                  v147 = [v245 onboardingCompletion];
                                  v148 = [v147 completionDate];

                                  if ([v148 compare:v246] == -1) {
                                    v149 = v246;
                                  }
                                  else {
                                    v149 = v148;
                                  }
                                  id v150 = v149;
                                  v151 = NSNumber;
                                  uint64_t v152 = [MEMORY[0x263EFF910] date];
                                  id v153 = v140;
                                  v154 = v150;
                                  v155 = (void *)v152;
                                  v156 = [v151 _weeksBetweenStartDate:v154 endDate:v152 calendar:v153];
                                  [v249 setWeeksSinceOnboardedWristTemperatureOvulationPrediction:v156];

                                  v157 = [(HKMCAnalysis *)self->_analysis cycles];
                                  unint64_t v158 = [v157 count];

                                  if (v158 >= 2)
                                  {
                                    _HKInitializeLogging();
                                    v159 = (void *)*MEMORY[0x263F09930];
                                    v239 = v154;
                                    v240 = v148;
                                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
                                    {
                                      v160 = v159;
                                      v161 = objc_opt_class();
                                      id v162 = v137;
                                      v163 = NSNumber;
                                      v164 = self->_analysis;
                                      id v254 = v161;
                                      v165 = [(HKMCAnalysis *)v164 cycles];
                                      v166 = objc_msgSend(v163, "numberWithUnsignedInteger:", objc_msgSend(v165, "count"));
                                      *(_DWORD *)buf = 138543618;
                                      id v297 = v161;
                                      __int16 v298 = 2112;
                                      v299 = v166;
                                      _os_log_impl(&dword_225722000, v160, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of historical cycles: %@", buf, 0x16u);

                                      id v137 = v162;
                                      v154 = v239;

                                      v148 = v240;
                                    }
                                    v167 = -[HDMCDailyAnalytics _eligibleCyclesStartPastDayIndex:](self, "_eligibleCyclesStartPastDayIndex:", objc_msgSend(v154, "hk_dayIndexWithCalendar:", v271));
                                    if ([v167 count])
                                    {
                                      v237 = v167;
                                      id v238 = v137;
                                      v236 = v25;
                                      long long v281 = 0u;
                                      long long v282 = 0u;
                                      long long v279 = 0u;
                                      long long v280 = 0u;
                                      id v168 = v167;
                                      uint64_t v169 = [v168 countByEnumeratingWithState:&v279 objects:v295 count:16];
                                      if (v169)
                                      {
                                        uint64_t v170 = v169;
                                        uint64_t v171 = 0;
                                        uint64_t v172 = 0;
                                        uint64_t v173 = 0;
                                        uint64_t v174 = 0;
                                        uint64_t v175 = 0;
                                        uint64_t v255 = *(void *)v280;
                                        do
                                        {
                                          for (uint64_t i = 0; i != v170; ++i)
                                          {
                                            if (*(void *)v280 != v255) {
                                              objc_enumerationMutation(v168);
                                            }
                                            v177 = *(void **)(*((void *)&v279 + 1) + 8 * i);
                                            uint64_t v178 = [v177 ovulationConfirmationType];
                                            if (v178 == 1) {
                                              uint64_t v179 = v174 + 1;
                                            }
                                            else {
                                              uint64_t v179 = v174;
                                            }
                                            if (v178 == 2) {
                                              ++v175;
                                            }
                                            else {
                                              uint64_t v174 = v179;
                                            }
                                            uint64_t v180 = [v177 ovulationConfirmationFailure];
                                            switch(v180)
                                            {
                                              case 3:
                                                ++v172;
                                                break;
                                              case 2:
                                                ++v171;
                                                break;
                                              case 1:
                                                ++v173;
                                                break;
                                            }
                                          }
                                          uint64_t v170 = [v168 countByEnumeratingWithState:&v279 objects:v295 count:16];
                                        }
                                        while (v170);
                                      }
                                      else
                                      {
                                        uint64_t v171 = 0;
                                        uint64_t v172 = 0;
                                        uint64_t v173 = 0;
                                        uint64_t v174 = 0;
                                        uint64_t v175 = 0;
                                      }

                                      if (v174 >= 15) {
                                        uint64_t v184 = 15;
                                      }
                                      else {
                                        uint64_t v184 = v174;
                                      }
                                      v185 = [NSNumber numberWithInteger:v184];
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_ConfirmedWristTemp:", v185);

                                      if (v175 >= 15) {
                                        uint64_t v186 = 15;
                                      }
                                      else {
                                        uint64_t v186 = v175;
                                      }
                                      v187 = [NSNumber numberWithInteger:v186];
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_ConfirmedOPK:", v187);

                                      if (v173 >= 15) {
                                        uint64_t v188 = 15;
                                      }
                                      else {
                                        uint64_t v188 = v173;
                                      }
                                      v189 = [NSNumber numberWithInteger:v188];
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_FailedAvailability:", v189);

                                      if (v171 >= 15) {
                                        uint64_t v190 = 15;
                                      }
                                      else {
                                        uint64_t v190 = v171;
                                      }
                                      v191 = [NSNumber numberWithInteger:v190];
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_FailedNoise:", v191);

                                      if (v172 >= 15) {
                                        uint64_t v192 = 15;
                                      }
                                      else {
                                        uint64_t v192 = v172;
                                      }
                                      v193 = [NSNumber numberWithInteger:v192];
                                      objc_msgSend(v249, "setCountWristTempEligibleHistoricalCycles_FailedOther:", v193);

                                      v194 = NSNumber;
                                      unint64_t v195 = [v168 count];
                                      if (v195 >= 0xF) {
                                        uint64_t v196 = 15;
                                      }
                                      else {
                                        uint64_t v196 = v195;
                                      }
                                      v197 = [v194 numberWithUnsignedInteger:v196];
                                      [v249 setCountWristTempEligibleHistoricalCycles:v197];

                                      id v17 = v267;
                                      v138 = &off_264750000;
                                      self = v270;
                                      id v25 = v236;
                                      v167 = v237;
                                      id v137 = v238;
                                      v154 = v239;
                                      v148 = v240;
                                    }
                                  }
                                  id v19 = v268;
                                  v141 = v249;
                                }
                              }
                            }
                          }
                          v198 = v138[51];
                          v200 = self->_profile;
                          v199 = self->_analysis;
                          id v278 = v137;
                          id v182 = [v198 _setFertileWindowFieldsInMetric:v141 analysis:v199 profile:v200 todayDayIndex:v264 error:&v278];
                          id v256 = v278;

                          BOOL v36 = v182 != 0;
                          if (v182)
                          {
                            id v273 = v182;
                            id v201 = v182;

                            v202 = [(HKMCAnalysis *)self->_analysis menstruationProjections];
                            uint64_t v203 = [v202 count];

                            if (v203)
                            {
                              v204 = [(HKMCAnalysis *)self->_analysis menstruationProjections];
                              v205 = [v204 firstObject];

                              if ([v205 isPartiallyLogged])
                              {
                                v206 = [(HKMCAnalysis *)self->_analysis menstruationProjections];
                                unint64_t v207 = [v206 count];

                                v208 = v201;
                                if (v207 >= 2)
                                {
                                  v209 = [(HKMCAnalysis *)self->_analysis menstruationProjections];
                                  uint64_t v210 = [v209 objectAtIndexedSubscript:1];

                                  v205 = (void *)v210;
                                }
                              }
                              else
                              {
                                v208 = v201;
                              }
                              uint64_t v212 = [v205 mostLikelyDays] - (void)v264;
                              uint64_t v213 = [v205 daysOffsetFromCalendarMethod];
                              v214 = [NSNumber numberWithInteger:v212];
                              [v208 setDaysBeforeMostLikelyPeriodPredictionStart:v214];

                              v215 = [NSNumber numberWithInteger:v213];
                              [v208 setDaysFirstPeriodPredictionShifted:v215];

                              v216 = [NSNumber numberWithInt:v213 != 0];
                              [v208 setDidFirstPeriodPredictionShift:v216];

                              [v205 predictionPrimarySource];
                              v217 = NSStringFromPredictionPrimarySource();
                              [v208 setPredictionPrimarySourceTypeFirstPeriodPrediction:v217];
                            }
                            v218 = [(HKMCAnalysis *)self->_analysis cycles];
                            uint64_t v219 = [v218 count];

                            if (v219)
                            {
                              uint64_t v220 = HKMCTodayIndex();
                              v221 = [(HKMCAnalysis *)self->_analysis cycles];
                              v222 = [v221 firstObject];
                              v223 = [v222 menstruationSegment];
                              uint64_t v224 = v220 - [v223 days];

                              v225 = [NSNumber numberWithInteger:v224];
                              [v201 setDaysSinceCycleStart:v225];
                            }
                            id v265 = [MEMORY[0x263F57730] sharedInstance];
                            v226 = [v265 getActivePairedDevice];
                            v227 = [v226 valueForProperty:*MEMORY[0x263F57628]];
                            [v201 setActiveWatchProductType:v227];

                            pregnancyManager = self->_pregnancyManager;
                            uint64_t v277 = 0;
                            id v229 = +[HDMCDailyAnalytics _setPregnancyPropertiesInMetric:v201 manager:pregnancyManager todayAsDate:v275 gregorianCalendar:v271 error:&v277];

                            v230 = [(HDProfile *)self->_profile medicalIDDataManager];
                            id v276 = 0;
                            v231 = [v230 fetchMedicalIDIfSetUpWithError:&v276];
                            id v55 = v276;

                            if (v231)
                            {
                              v232 = [v231 pregnancyEstimatedDueDate];
                              v233 = [NSNumber numberWithInt:v232 != 0];
                              [v229 setHasPregnancyInMedicalID:v233];
                            }
                            else
                            {
                              if (v55)
                              {
                                _HKInitializeLogging();
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                                  -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]2();
                                }
                              }
                              [v229 setHasPregnancyInMedicalID:MEMORY[0x263EFFA80]];
                            }
                            id v19 = v268;

                            id v249 = v229;
                            id v35 = v266;
                            id v17 = v267;
                            id v18 = v262;
                            id v182 = v273;
                            id v211 = v265;
                          }
                          else
                          {
                            _HKInitializeLogging();
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                              -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]3();
                            }
                            id v211 = v256;
                            if (v211)
                            {
                              id v35 = v266;
                              if (a10)
                              {
                                id v211 = v211;
                                *a10 = v211;
                                id v55 = v211;
                              }
                              else
                              {
                                id v235 = v211;
                                _HKLogDroppedError();
                                id v211 = v235;
                                id v55 = v235;
                              }
                            }
                            else
                            {
                              id v55 = 0;
                              id v35 = v266;
                            }
                          }

                          id v114 = v248;
                          id v117 = v241;
                        }
                        else
                        {
                          _HKInitializeLogging();
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]1();
                          }
                          id v181 = v137;
                          id v182 = v181;
                          if (v181)
                          {
                            id v35 = v266;
                            if (a10)
                            {
                              id v182 = v181;
                              BOOL v36 = 0;
                              *a10 = v182;
                            }
                            else
                            {
                              _HKLogDroppedError();
                              BOOL v36 = 0;
                            }
                            id v55 = v182;
                          }
                          else
                          {
                            BOOL v36 = 0;
                            id v55 = 0;
                            id v35 = v266;
                          }
                          id v114 = v248;
                        }

                        id v131 = v247;
                      }
                      else
                      {
                        _HKInitializeLogging();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                          -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]0();
                        }
                        id v131 = v118;
                        if (v131)
                        {
                          id v35 = v266;
                          if (a10)
                          {
                            id v131 = v131;
                            BOOL v36 = 0;
                            *a10 = v131;
                            id v55 = v131;
                          }
                          else
                          {
                            id v183 = v131;
                            _HKLogDroppedError();
                            id v131 = v183;
                            BOOL v36 = 0;
                            id v55 = v183;
                          }
                        }
                        else
                        {
                          BOOL v36 = 0;
                          id v55 = 0;
                          id v35 = v266;
                        }
                        id v114 = v248;
                      }

                      id v107 = v249;
                    }
                    else
                    {
                      _HKInitializeLogging();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                        -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.9();
                      }
                      id v130 = v115;
                      if (v130)
                      {
                        id v35 = v266;
                        id v107 = v111;
                        if (a10)
                        {
                          id v117 = v130;
                          BOOL v36 = 0;
                          *a10 = v117;
                        }
                        else
                        {
                          id v117 = v130;
                          _HKLogDroppedError();
                          BOOL v36 = 0;
                        }
                        id v55 = v117;
                      }
                      else
                      {
                        BOOL v36 = 0;
                        id v55 = 0;
                        id v35 = v266;
                        id v107 = v111;
                        id v117 = 0;
                      }
                    }
                  }
                  else
                  {
                    _HKInitializeLogging();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                      -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.8();
                    }
                    id v128 = v110;
                    id v114 = v128;
                    if (v128)
                    {
                      id v35 = v266;
                      if (a10)
                      {
                        id v129 = v128;
                        BOOL v36 = 0;
                        *a10 = v129;
                        id v114 = v129;
                        id v55 = v129;
                      }
                      else
                      {
                        id v114 = v128;
                        _HKLogDroppedError();
                        BOOL v36 = 0;
                        id v55 = v114;
                      }
                    }
                    else
                    {
                      BOOL v36 = 0;
                      id v55 = 0;
                      id v35 = v266;
                    }
                  }

                  id v75 = v107;
                  id v127 = v250;
                  v105 = v251;
                }
                else
                {
                  _HKInitializeLogging();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                    -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.7();
                  }
                  id v127 = v106;
                  if (v127)
                  {
                    id v35 = v266;
                    if (a10)
                    {
                      id v127 = v127;
                      BOOL v36 = 0;
                      *a10 = v127;
                      id v55 = v127;
                    }
                    else
                    {
                      id v55 = v127;
                      _HKLogDroppedError();
                      id v127 = v55;
                      BOOL v36 = 0;
                    }
                  }
                  else
                  {
                    BOOL v36 = 0;
                    id v55 = 0;
                    id v35 = v266;
                  }
                }

                id v23 = v75;
                id v56 = v261;
                id v126 = v252;
                id v22 = v271;
              }
              else
              {
                id v22 = v271;
                id v18 = v262;
                _HKInitializeLogging();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                  -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.6();
                }
                id v126 = v74;
                id v19 = v268;
                if (v126)
                {
                  id v35 = v266;
                  id v56 = v261;
                  if (a10)
                  {
                    id v126 = v126;
                    BOOL v36 = 0;
                    *a10 = v126;
                    id v55 = v126;
                  }
                  else
                  {
                    id v55 = v126;
                    _HKLogDroppedError();
                    id v126 = v55;
                    BOOL v36 = 0;
                  }
                }
                else
                {
                  BOOL v36 = 0;
                  id v55 = 0;
                  id v35 = v266;
                  id v56 = v261;
                }
              }

              id v125 = v257;
            }
            else
            {
              _HKInitializeLogging();
              id v17 = v267;
              id v18 = v262;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
                -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.5();
              }
              id v124 = v68;
              id v55 = v124;
              id v19 = v268;
              id v22 = v271;
              if (v124)
              {
                id v35 = v266;
                id v56 = v261;
                if (a10)
                {
                  id v125 = v124;
                  BOOL v36 = 0;
                  *a10 = v125;
                  id v55 = v125;
                }
                else
                {
                  _HKLogDroppedError();
                  BOOL v36 = 0;
                  id v125 = v55;
                }
              }
              else
              {
                BOOL v36 = 0;
                id v125 = 0;
                id v35 = v266;
                id v56 = v261;
              }
            }

            id v123 = v258;
          }
          else
          {
            _HKInitializeLogging();
            id v19 = v268;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
              -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:].cold.4();
            }
            id v123 = v62;
            id v17 = v267;
            id v18 = v262;
            id v22 = v271;
            if (v123)
            {
              id v35 = v266;
              id v56 = v261;
              if (a10)
              {
                id v123 = v123;
                BOOL v36 = 0;
                *a10 = v123;
                id v55 = v123;
              }
              else
              {
                id v55 = v123;
                _HKLogDroppedError();
                id v123 = v55;
                BOOL v36 = 0;
              }
            }
            else
            {
              BOOL v36 = 0;
              id v55 = 0;
              id v35 = v266;
              id v56 = v261;
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          id v22 = v271;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
            -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]();
          }
          id v19 = v268;
          id v18 = v43;
          if (a10)
          {
            id v55 = v55;
            BOOL v36 = 0;
            *a10 = v55;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v36 = 0;
          }
          id v35 = v266;
          id v17 = v267;
        }

        id v37 = v55;
        id v20 = v269;
      }
      else
      {
        _HKInitializeLogging();
        id v20 = v269;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]();
        }
        if (a10)
        {
          id v37 = v37;
          BOOL v36 = 0;
          *a10 = v37;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v36 = 0;
        }
        id v18 = v43;
        id v35 = v266;
        id v17 = v267;
      }

      goto LABEL_213;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09960], OS_LOG_TYPE_ERROR)) {
      -[HDMCDailyAnalytics _collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:]();
    }
    id v34 = v26;
    id v35 = v34;
    if (v34)
    {
      if (a10)
      {
        id v35 = v34;
        BOOL v36 = 0;
        *a10 = v35;
        id v37 = v35;
LABEL_213:

        id v21 = v274;
        BOOL v33 = v36;
        goto LABEL_214;
      }
      _HKLogDroppedError();
    }
    BOOL v36 = 0;
    id v37 = v35;
    goto LABEL_213;
  }
  id v29 = v22;
  _HKInitializeLogging();
  uint64_t v30 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    id v31 = v30;
    *(_DWORD *)buf = 138543362;
    id v297 = (id)objc_opt_class();
    id v32 = v297;
    _os_log_impl(&dword_225722000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping collecting metrics due to IH&A not allowed", buf, 0xCu);
  }
  BOOL v33 = 1;
  id v22 = v29;
LABEL_214:

  return v33;
}

- (id)_eligibleCyclesStartPastDayIndex:(int64_t)a3
{
  v5 = [(HKMCAnalysis *)self->_analysis cycles];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__HDMCDailyAnalytics__eligibleCyclesStartPastDayIndex___block_invoke;
  v8[3] = &unk_264750A40;
  v8[4] = self;
  v8[5] = a3;
  v6 = objc_msgSend(v5, "hk_map:", v8);

  return v6;
}

id __55__HDMCDailyAnalytics__eligibleCyclesStartPastDayIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 lastDayIndex];

  if (!v4) {
    goto LABEL_5;
  }
  v5 = [v3 lastDayIndex];
  uint64_t v6 = [v5 integerValue];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) cycles];
  uint64_t v8 = [v7 firstObject];
  if ([v3 isEqual:v8])
  {

LABEL_5:
    id v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(a1 + 40);

  if (v9 > v6) {
    goto LABEL_5;
  }
  id v10 = v3;
LABEL_6:

  return v10;
}

- (int64_t)_daysWithSleepSamples:(id)a3 calendar:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "startDate", (void)v18);
        uint64_t v14 = objc_msgSend(v13, "hk_morningIndexWithCalendar:", v6);

        id v15 = [NSNumber numberWithInteger:v14];
        [v7 addObject:v15];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  int64_t v16 = [v7 count];
  return v16;
}

- (id)_predicateForSleepDataFromPast45DaysWithCalendar:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F0A158];
  uint64_t v4 = *MEMORY[0x263F09410];
  id v5 = a3;
  id v6 = [v3 categoryTypeForIdentifier:v4];
  id v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = objc_msgSend(v7, "hk_morningIndexWithCalendar:", v5);

  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF910], "hk_sleepDayStartForMorningIndex:calendar:", v8, v5);
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF910], "hk_sleepDayStartForMorningIndex:calendar:", v8 - 46, v5);

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v10 endDate:v9];
  uint64_t v12 = HDSampleEntityPredicateForDateInterval();

  id v13 = _HKCategoryValueSleepAnalysisAsleepValues();
  uint64_t v14 = HDCategorySampleEntityPredicateEqualToValues();

  id v15 = (void *)MEMORY[0x263F434A8];
  v20[0] = v12;
  int64_t v16 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v20[1] = v16;
  v20[2] = v14;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:3];
  long long v18 = objc_msgSend(v15, "predicateMatchingAllPredicates:", v17, v20[0]);

  return v18;
}

- (id)_predicateForSleepDataFromPast48HoursWithCalendar:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  id v5 = [v4 dateByAddingTimeInterval:-172800.0];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:v4];
  id v7 = HDSampleEntityPredicateForDateInterval();

  uint64_t v8 = _HKCategoryValueSleepAnalysisAsleepValues();
  uint64_t v9 = HDCategorySampleEntityPredicateEqualToValues();

  uint64_t v10 = (void *)MEMORY[0x263F434A8];
  v14[0] = v7;
  v14[1] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  uint64_t v12 = [v10 predicateMatchingAllPredicates:v11];

  return v12;
}

- (id)_predicateForFirstPartySleepDataFromPast48HoursWithCalendar:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = [(HDMCDailyAnalytics *)self _predicateForSleepDataFromPast48HoursWithCalendar:a3];
  uint64_t v4 = (void *)MEMORY[0x263F434A8];
  v9[0] = v3;
  id v5 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v9[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  id v7 = [v4 predicateMatchingAllPredicates:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_storeStrong((id *)&self->_pregnancyManager, 0);
  objc_storeStrong((id *)&self->_wristTemperatureInputFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_appProtectedKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_deviationDetectionAnalyticsKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_deviationDetectionFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_heartRateFeatureStatusManager, 0);
  objc_storeStrong((id *)&self->_fertileWindowNotificationKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

+ (id)_setFertileWindowFieldsInMetric:(id)a3 analysis:(id)a4 profile:(id)a5 todayDayIndex:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = [v13 fertileWindowProjections];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
    id v45 = 0;
LABEL_16:
    id v46 = v12;
    goto LABEL_58;
  }
  id v57 = a1;
  id v17 = [v13 fertileWindowProjections];
  long long v18 = [v17 firstObject];
  uint64_t v19 = [v18 allDays];
  if (v20 <= 0) {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v21 = v20 + v19 - 1;
  }

  uint64_t v22 = v21 - a6;
  uint64_t v23 = [v13 fertileWindowProjections];
  id v24 = [v23 firstObject];
  uint64_t v25 = [v24 daysOffsetFromCalendarMethod];

  id v26 = [NSNumber numberWithInteger:v22];
  [v12 setDaysBeforeFertileWindowEnd:v26];

  uint64_t v27 = [NSNumber numberWithInteger:v25];
  [v12 setDaysFertileWindowShifted:v27];

  id v28 = [v13 fertileWindowProjections];
  id v29 = [v28 firstObject];
  [v29 predictionPrimarySource];
  uint64_t v30 = NSStringFromPredictionPrimarySource();
  [v12 setPredictionPrimarySourceTypeFertileWindow:v30];

  id v31 = [v13 fertileWindowProjections];
  id v32 = [v31 firstObject];
  uint64_t v33 = [v32 allDays];
  uint64_t v35 = v34 + v33 - 1;
  if (v34 <= 0) {
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v36 = v35 - v25;

  id v37 = objc_alloc_init(MEMORY[0x263F0A130]);
  if (v36 >= a6)
  {
    id v45 = 0;
LABEL_15:

    goto LABEL_16;
  }
  id v56 = a7;
  id v62 = 0;
  id v38 = objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 - 5, 6, v14, v37, &v62);
  id v39 = v62;
  if (!v38)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:]();
    }
    id v47 = v39;
    id v38 = v47;
    if (v47)
    {
      if (v56) {
        *id v56 = v47;
      }
      else {
        _HKLogDroppedError();
      }
    }
    id v45 = v38;
    goto LABEL_57;
  }
  [v12 setDaysWithWristTempIn6DaysBeforeCalendarOvulation:v38];
  id v61 = v39;
  uint64_t v40 = objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 - 9, 10, v14, v37, &v61);
  id v41 = v61;

  int64_t v42 = (void *)v40;
  if (v40)
  {
    id v55 = (void *)v40;
    [v12 setDaysWithWristTempIn10DaysBeforeCalendarOvulation:v40];
    if (v36 + 3 >= a6)
    {
      id v44 = v41;
    }
    else
    {
      id v60 = v41;
      id v43 = objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 + 1, 3, v14, v37, &v60);
      id v44 = v60;

      if (!v43)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:]();
        }
        id v52 = v44;
        id v45 = v52;
        if (v52)
        {
          if (v56)
          {
            id v45 = v52;
            *id v56 = v45;
          }
          else
          {
            _HKLogDroppedError();
          }
        }
        int64_t v42 = v55;
        goto LABEL_56;
      }
      [v12 setDaysWithWristTempIn3DaysAfterCalendarOvulation:v43];
    }
    if (v36 + 6 >= a6)
    {
      id v50 = v44;
    }
    else
    {
      id v59 = v44;
      uint64_t v49 = objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 + 1, 6, v14, v37, &v59);
      id v50 = v59;

      if (!v49)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.4();
        }
        id v45 = v50;
        int64_t v42 = v55;
        id v53 = v56;
        if (!v45) {
          goto LABEL_56;
        }
        if (!v56) {
          goto LABEL_53;
        }
LABEL_48:
        id v45 = v45;
        id *v53 = v45;
        goto LABEL_56;
      }
      [v12 setDaysWithWristTempIn6DaysAfterCalendarOvulation:v49];
    }
    int64_t v42 = v55;
    if (v36 + 10 >= a6)
    {
      id v45 = v50;
      goto LABEL_36;
    }
    id v58 = v50;
    id v51 = objc_msgSend(v57, "_daysWithWristTemperatureSamplesInDayIndexRange:profile:calendarCache:error:", v36 + 1, 10, v14, v37, &v58);
    id v45 = v58;

    if (v51)
    {
      [v12 setDaysWithWristTempIn10DaysAfterOvulation:v51];

LABEL_36:
      goto LABEL_15;
    }
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:].cold.5();
    }
    id v45 = v45;
    id v53 = v56;
    if (!v45) {
      goto LABEL_56;
    }
    if (!v56)
    {
LABEL_53:
      _HKLogDroppedError();
      goto LABEL_56;
    }
    goto LABEL_48;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
    +[HDMCDailyAnalytics(Analysis) _setFertileWindowFieldsInMetric:analysis:profile:todayDayIndex:error:]();
  }
  id v48 = v41;
  id v45 = v48;
  if (!v48) {
    goto LABEL_56;
  }
  if (!v56) {
    goto LABEL_53;
  }
  id v45 = v48;
  *id v56 = v45;
LABEL_56:

LABEL_57:
  id v46 = 0;
LABEL_58:

  return v46;
}

+ (id)_setCycleStatisticsFieldsInMetric:(id)a3 analysis:(id)a4 keyValueDomain:(id)a5 fertileWindowNotificationKeyValueDomain:(id)a6 todayDayIndex:(int64_t)a7 todayAsDate:(id)a8 gregorianCalendar:(id)a9 error:(id *)a10
{
  id v14 = a10;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v57 = a8;
  id v19 = a9;
  uint64_t v20 = [v16 statistics];
  uint64_t v21 = [v20 cycleLengthMedian];

  if (!v21 || ([v21 doubleValue], v22 <= 0.0))
  {
    id v56 = v17;
    id v30 = 0;
LABEL_11:
    id v32 = v30;
    id v58 = v30;
    id v31 = v18;
    uint64_t v33 = objc_msgSend(v18, "hdmc_updatedFertileWindowNotificationFireDateWithError:", &v58);
    id v30 = v58;

    if (v33 || !v30)
    {
      if (v33)
      {
        int64_t v36 = objc_msgSend(NSNumber, "numberWithInteger:", a7 - objc_msgSend(v33, "hk_dayIndexWithCalendar:", v19));
        [v15 setNumberOfDaysSinceLastFiredUpdateFertileWindowNotification:v36];
      }
      id v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "numberOfDailySleepHeartRateStatisticsForPast100Days"));
      [v15 setNumberOfDailySleepHeartRateStatisticsForPast100Days:v37];

      id v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "numberOfDailyAwakeHeartRateStatisticsForPast100Days"));
      [v15 setNumberOfDailyAwakeHeartRateStatisticsForPast100Days:v38];

      id v14 = (id *)v15;
      id v17 = v56;
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
        +[HDMCDailyAnalytics(Analysis) _setCycleStatisticsFieldsInMetric:analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:]();
      }
      id v17 = v56;
      if (v14)
      {
        id v34 = v30;
        uint64_t v35 = v14;
        id v14 = 0;
        id *v35 = v34;
      }
      else
      {
        _HKLogDroppedError();
      }
    }

    goto LABEL_22;
  }
  double v23 = v22;
  id v54 = v18;
  id v24 = [v16 lastLoggedDayIndex];

  if (v24)
  {
    uint64_t v25 = [v16 lastLoggedDayIndex];
    uint64_t v26 = [v25 integerValue];

    uint64_t v27 = [NSNumber numberWithDouble:(double)(a7 - v26) / v23];
    [v15 setNumberOfCyclesSinceLastDayOfLogging:v27];
  }
  id v59 = 0;
  id v28 = objc_msgSend(v17, "hdmc_lastLoggedInCycleTrackingDateWithError:", &v59);
  id v29 = v59;
  id v30 = v29;
  if (v28 || !v29)
  {
    if (v28)
    {
      uint64_t v40 = [v19 components:16 fromDate:v28 toDate:v57 options:0];
      id v41 = v40;
      if (v40)
      {
        int64_t v42 = objc_msgSend(NSNumber, "numberWithDouble:", (double)objc_msgSend(v40, "day") / v23);
        [v15 setNumberOfCyclesSinceLastDayOfLoggingInCycleTracking:v42];

        id v14 = a10;
      }
    }
    id v43 = v14;
    id v56 = v17;
    id v44 = [v16 statistics];
    id v45 = [v44 cycleLengthLowerPercentile];

    if (v45)
    {
      id v46 = NSNumber;
      [v45 doubleValue];
      id v48 = [v46 numberWithDouble:v47 / v23];
      [v15 setCycleLengthVariationLowerPercentile:v48];
    }
    uint64_t v49 = [v16 statistics];
    id v50 = [v49 cycleLengthUpperPercentile];

    if (v50)
    {
      id v51 = NSNumber;
      [v50 doubleValue];
      id v53 = [v51 numberWithDouble:v52 / v23];
      [v15 setCycleLengthVariationUpperPercentile:v53];
    }
    id v18 = v54;
    id v14 = v43;
    goto LABEL_11;
  }
  _HKInitializeLogging();
  id v31 = v54;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR))
  {
    +[HDMCDailyAnalytics(Analysis) _setCycleStatisticsFieldsInMetric:analysis:keyValueDomain:fertileWindowNotificationKeyValueDomain:todayDayIndex:todayAsDate:gregorianCalendar:error:]();
    if (a10) {
      goto LABEL_9;
    }
  }
  else if (a10)
  {
LABEL_9:
    id v30 = v30;
    id v14 = 0;
    *a10 = v30;
    goto LABEL_22;
  }
  _HKLogDroppedError();
LABEL_22:

  return v14;
}

+ (id)_setPregnancyPropertiesInMetric:(id)a3 manager:(id)a4 todayAsDate:(id)a5 gregorianCalendar:(id)a6 error:(id *)a7
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a4 getCurrentPregnancyModel];
  id v14 = v13;
  if (v13)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "state"));
    [v10 setPregnancyModeState:v15];

    id v16 = [v14 sample];

    if (v16)
    {
      id v17 = (void *)MEMORY[0x263F0A480];
      id v18 = [v14 sample];
      id v19 = [v18 startDate];
      uint64_t v20 = [MEMORY[0x263EFFA18] localTimeZone];
      uint64_t v21 = [v20 name];
      double v22 = [v17 gestationalAgeInComponentsOnDate:v11 pregnancyStartDate:v19 startTimeZoneName:v21];

      double v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "weekOfMonth"));
      [v10 setGestationalAge:v23];
    }
    id v24 = [v14 educationalStepsCompletedDate];

    uint64_t v25 = [NSNumber numberWithBool:v24 != 0];
    [v10 setHasOnboardedPregnancyMode:v25];

    if (v24)
    {
      uint64_t v26 = [v14 educationalStepsCompletedDate];
      uint64_t v27 = [MEMORY[0x263EFF910] now];
      id v28 = [v12 components:0x2000 fromDate:v26 toDate:v27 options:0];

      id v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v28, "weekOfYear"));
      [v10 setWeeksSinceOnboardedPregnancyMode:v29];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v30 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v30;
      *(_DWORD *)id v34 = 138543362;
      *(void *)&v34[4] = objc_opt_class();
      id v32 = *(id *)&v34[4];
      _os_log_impl(&dword_225722000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] PregnancyProvider could not return a pregnancyModel", v34, 0xCu);
    }
    objc_msgSend(v10, "setHasOnboardedPregnancyMode:", MEMORY[0x263EFFA80], *(_OWORD *)v34);
  }

  return v10;
}

+ (id)_daysWithWristTemperatureSamplesInDayIndexRange:(id)a3 profile:(id)a4 calendarCache:(id)a5 error:(id *)a6
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v10 = a4;
  id v11 = a5;
  LOBYTE(v20) = 1;
  id v12 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:]([HDMCDaySummaryEnumerator alloc], "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v10, v11, var0, var1, 1, 0, v20);
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v21[4] = &v23;
  id v22 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __108__HDMCDailyAnalytics_Analysis___daysWithWristTemperatureSamplesInDayIndexRange_profile_calendarCache_error___block_invoke;
  v21[3] = &unk_264750A18;
  BOOL v13 = [(HDMCDaySummaryEnumerator *)v12 enumerateWithError:&v22 handler:v21];
  id v14 = v22;
  id v15 = v14;
  if (v13)
  {
    id v16 = [NSNumber numberWithInteger:v24[3]];
  }
  else
  {
    id v17 = v14;
    id v18 = v17;
    if (v17)
    {
      if (a6) {
        *a6 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v16 = 0;
  }
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __108__HDMCDailyAnalytics_Analysis___daysWithWristTemperatureSamplesInDayIndexRange_profile_calendarCache_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 wristTemperature];

  if (v3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
}

- (void)submitMetricWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature settings for menstrual cycles: %{public}@", v7, v8, v9, v10, v11);
}

- (void)submitMetricWithError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature status for prediction improvements: %{public}@", v7, v8, v9, v10, v11);
}

- (void)submitMetricWithError:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature status for deviation detection: %{public}@", v7, v8, v9, v10, v11);
}

- (void)submitMetricWithError:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature status for wrist temperature input: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectDiagnosticFieldsForMetric:(uint64_t)a3 settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v3 = OUTLINED_FUNCTION_1_1(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v4, v5, "[%{public}@] Error computing days with wrist temperature samples 45 days before fertile window end: %{public}@");
}

- (void)_collectDiagnosticFieldsForMetric:(uint64_t)a3 settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  id v3 = OUTLINED_FUNCTION_1_1(a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_1(&dword_225722000, v4, v5, "[%{public}@] Error computing days with wrist temperature samples 45 days before now and different bundle identifiers within the past 45 days: %{public}@");
}

- (void)_collectDiagnosticFieldsForMetric:(uint64_t)a3 settingsManager:heartRateInputFeatureStatus:deviationDetectionFeatureStatus:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_6_0();
  uint64_t v8 = a3;
  id v6 = v5;
  _os_log_error_impl(&dword_225722000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving diagnostic onboarding metrics: %{public}@", v7, 0x16u);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_225722000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get device contexts dictionary for HealthMenstrualCycles daily analytics: %{public}@", v2, 0x16u);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to read date of birth with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to read biological sex with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to read anySleepSamplesPast48Hours with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.5()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to read firstPartySleepSamplesPast48Hours with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.6()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Failed to set statistics and Heart Rate fields with error: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.7()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving deviation sample metrics: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.8()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving deviation detected metrics: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.9()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error setting cycle factor reminder metrics: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.10()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving sleep event record: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.11()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving feature status for sleeping wrist temperature: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.12()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving medical ID data: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.13()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error setting fertile window fields in metric: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.14()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving sleep screen enabled status: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.15()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  uint64_t v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_225722000, v5, v6, "[%{public}@] Error retrieving current sleep settings: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_collectSensitiveFieldsForMetric:(void *)a1 settingsManager:menstrualCyclesSettings:heartRateInputFeatureStatus:deviationDetectionSettings:wristTemperatureInputFeatureStatus:gregorianCalendar:error:.cold.16(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_225722000, v1, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to convert date of birth to a date", (uint8_t *)&v3, 0xCu);
}

@end