@interface HKMCProjectionAccuracyAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (id)_closestProjectionToLoggedDayIndex:(int64_t)a3 analysis:(id)a4;
+ (id)_isSleepConfiguredForWristTemperatureMeasurementsWithError:(id *)a3;
+ (void)submitMetricWithDayIndex:(int64_t)a3 oldMenstrualFlow:(int64_t)a4 newMenstrualFlow:(int64_t)a5 analysis:(id)a6 isLoggingMultipleDays:(BOOL)a7 periodPredictionEnabled:(BOOL)a8 heartRateBasedPredictionEnabled:(BOOL)a9 wristTemperatureBasedPredictionEnabled:(BOOL)a10 isWristTemperatureInputDelivered:(BOOL)a11 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a12 cycles:(id)a13;
@end

@implementation HKMCProjectionAccuracyAnalytics

+ (BOOL)shouldSubmit
{
  int v3 = [a1 _isMetricEnabled];
  if (v3)
  {
    LOBYTE(v3) = [a1 _isAllowed];
  }
  return v3;
}

+ (BOOL)_isMetricEnabled
{
  v2 = +[HKMCProjectionAccuracyMetric eventName];
  if (AnalyticsIsEventUsed())
  {
    char v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x263EFFA40], "hkmc_menstrualCyclesDefaults");
    char v3 = objc_msgSend(v4, "hkmc_analyticsDebugModeEnabled");
  }
  return v3;
}

+ (BOOL)_isAllowed
{
  return MEMORY[0x270EF3710](a1, a2);
}

+ (id)_closestProjectionToLoggedDayIndex:(int64_t)a3 analysis:(id)a4
{
  v5 = [a4 menstruationProjections];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__HKMCProjectionAccuracyAnalytics__closestProjectionToLoggedDayIndex_analysis___block_invoke;
  v8[3] = &__block_descriptor_40_e24_d16__0__HKMCProjection_8l;
  v8[4] = a3;
  v6 = objc_msgSend(v5, "hk_firstObjectWithMinimumValueUsingEvaluationBlock:", v8);

  return v6;
}

double __79__HKMCProjectionAccuracyAnalytics__closestProjectionToLoggedDayIndex_analysis___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mostLikelyDays] - *(void *)(a1 + 32);
  if (v2 < 0) {
    return (double)-v2;
  }
  return (double)v2;
}

+ (void)submitMetricWithDayIndex:(int64_t)a3 oldMenstrualFlow:(int64_t)a4 newMenstrualFlow:(int64_t)a5 analysis:(id)a6 isLoggingMultipleDays:(BOOL)a7 periodPredictionEnabled:(BOOL)a8 heartRateBasedPredictionEnabled:(BOOL)a9 wristTemperatureBasedPredictionEnabled:(BOOL)a10 isWristTemperatureInputDelivered:(BOOL)a11 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a12 cycles:(id)a13
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v17 = a6;
  id v18 = a13;
  if ([a1 shouldSubmit])
  {
    BOOL v76 = a7;
    BOOL v77 = a8;
    v19 = [v17 menstruationProjections];
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __301__HKMCProjectionAccuracyAnalytics_submitMetricWithDayIndex_oldMenstrualFlow_newMenstrualFlow_analysis_isLoggingMultipleDays_periodPredictionEnabled_heartRateBasedPredictionEnabled_wristTemperatureBasedPredictionEnabled_isWristTemperatureInputDelivered_internalLiveOnCycleFactorOverrideEnabled_cycles___block_invoke;
    v84[3] = &__block_descriptor_40_e24_B16__0__HKMCProjection_8l;
    v84[4] = a3;
    v20 = objc_msgSend(v19, "hk_firstObjectPassingTest:", v84);

    int64_t v21 = [v20 mostLikelyDays];
    BOOL v24 = a3 >= v21 && a3 - v21 < v22;
    BOOL v75 = v24;
    v25 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v74 = HKMCTodayIndex(v25);

    if (v18)
    {
      id v26 = a1;
      v27 = v20;
      v28 = NSNumber;
      uint64_t v29 = [v18 count];
      if (v29)
      {
        v20 = [v18 firstObject];
        a1 = [v20 menstruationSegment];
        BOOL v30 = a3 - [a1 days] < 11;
      }
      else
      {
        BOOL v30 = 0;
      }
      v82 = [v28 numberWithInt:v30];
      if (v29)
      {
      }
      v20 = v27;
      a1 = v26;
      if (v27) {
        goto LABEL_20;
      }
    }
    else
    {
      v82 = 0;
      if (v20)
      {
LABEL_20:
        id v39 = v20;
        goto LABEL_21;
      }
    }
    id v39 = [a1 _closestProjectionToLoggedDayIndex:a3 analysis:v17];
    if (!v39)
    {
      v40 = 0;
      v79 = 0;
      v80 = 0;
      v81 = 0;
LABEL_26:
      v49 = NSStringFromPredictionPrimarySource([v39 predictionPrimarySource]);
      [v39 allDays];
      uint64_t v51 = v50;
      unsigned int v73 = [v39 isPartiallyLogged];
      id v83 = 0;
      v52 = [a1 _isSleepConfiguredForWristTemperatureMeasurementsWithError:&v83];
      id v53 = v83;
      v78 = v53;
      if (v52 || !v53)
      {
        id v72 = v18;
        v71 = v20;
        v55 = v40;
        BOOL v69 = v20 != 0;
        BOOL v68 = v20 == 0;
        v56 = [HKMCProjectionAccuracyMetric alloc];
        v57 = HKMCActiveWatchPairedProductType();
        v70 = v52;
        BYTE3(v67) = a12;
        BYTE2(v67) = [v52 BOOLValue];
        LOWORD(v67) = __PAIR16__(a11, a10);
        BYTE2(v66) = v76;
        BYTE1(v66) = a9;
        LOBYTE(v66) = v77;
        v58 = -[HKMCProjectionAccuracyMetric initWithOverlapMostLikelyDays:overlapProjectedDays:overlapNone:predictionPrimarySource:totalDayRange:partiallyLogged:periodPredictionEnabled:heartRateBasedPredictionEnabled:isLoggingMultipleDays:daysAgoLogged:isOngoingPeriod:activePairedWatchProductType:daysFromMostLikelyStart:daysFromMostLikelyEnd:daysFromProjectedStart:daysFromProjectedEnd:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:isSleepConfiguredForWristTemperatureMeasurements:internalLiveOnCycleFactorOverrideEnabled:](v56, "initWithOverlapMostLikelyDays:overlapProjectedDays:overlapNone:predictionPrimarySource:totalDayRange:partiallyLogged:periodPredictionEnabled:heartRateBasedPredictionEnabled:isLoggingMultipleDays:daysAgoLogged:isOngoingPeriod:activePairedWatchProductType:daysFromMostLikelyStart:daysFromMostLikelyEnd:daysFromProjectedStart:daysFromProjectedEnd:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:isSleepConfiguredForWristTemperatureMeasurements:internalLiveOnCycleFactorOverrideEnabled:", v75, v69, v68, v49, v51, v73, v66, v74 - a3, v82, v57, v81, v80, v79,
                v55,
                v67);

        v59 = +[HKMCProjectionAccuracyMetric eventName];
        v60 = [(HKMCProjectionAccuracyMetric *)v58 eventPayload];
        AnalyticsSendEvent();

        _HKInitializeLogging();
        v61 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
        {
          v62 = v61;
          v63 = objc_opt_class();
          id v64 = v63;
          v65 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543618;
          v86 = v63;
          __int16 v87 = 2114;
          v88 = v65;
          _os_log_impl(&dword_2249E9000, v62, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", buf, 0x16u);
        }
        id v18 = v72;
        v52 = v70;
        v20 = v71;
        v40 = v55;
      }
      else
      {
        _HKInitializeLogging();
        v54 = (void *)*MEMORY[0x263F09930];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
          +[HKMCProjectionAccuracyAnalytics submitMetricWithDayIndex:oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:periodPredictionEnabled:heartRateBasedPredictionEnabled:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:internalLiveOnCycleFactorOverrideEnabled:cycles:](v54);
        }
      }

      goto LABEL_34;
    }
LABEL_21:
    v81 = objc_msgSend(NSNumber, "numberWithInteger:", a3 - objc_msgSend(v39, "mostLikelyDays"));
    v41 = NSNumber;
    uint64_t v42 = [v39 mostLikelyDays];
    uint64_t v44 = v43 + v42 - 1;
    if (v43 <= 0) {
      uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v80 = [v41 numberWithInteger:a3 - v44];
    v79 = objc_msgSend(NSNumber, "numberWithInteger:", a3 - objc_msgSend(v39, "allDays"));
    v45 = NSNumber;
    uint64_t v46 = [v39 allDays];
    uint64_t v48 = v47 + v46 - 1;
    if (v47 <= 0) {
      uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v40 = [v45 numberWithInteger:a3 - v48];
    goto LABEL_26;
  }
  _HKInitializeLogging();
  v31 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = objc_opt_class();
    v34 = NSNumber;
    id v35 = v33;
    v36 = objc_msgSend(v34, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
    v38 = id v37 = v18;
    *(_DWORD *)buf = 138543874;
    v86 = v33;
    __int16 v87 = 2114;
    v88 = v36;
    __int16 v89 = 2114;
    v90 = v38;
    _os_log_impl(&dword_2249E9000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);

    id v18 = v37;
  }
LABEL_34:
}

BOOL __301__HKMCProjectionAccuracyAnalytics_submitMetricWithDayIndex_oldMenstrualFlow_newMenstrualFlow_analysis_isLoggingMultipleDays_periodPredictionEnabled_heartRateBasedPredictionEnabled_wristTemperatureBasedPredictionEnabled_isWristTemperatureInputDelivered_internalLiveOnCycleFactorOverrideEnabled_cycles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 allDays];
  return v2 >= v3 && v2 - v3 < v4;
}

+ (id)_isSleepConfiguredForWristTemperatureMeasurementsWithError:(id *)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F75EA8]) initWithIdentifier:@"HKMCProjectionAccuracyAnalytics" healthStore:0 options:2];
  id v18 = 0;
  v5 = [v4 currentSleepEventRecordWithError:&v18];
  id v6 = v18;
  v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8)
  {
    v9 = [v5 sleepCoachingOnboardingFirstCompletedDate];
    uint64_t v10 = [v5 sleepTrackingOnboardingFirstCompletedDate];
    v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = [v4 hasSleepFocusMode];
    }
    v15 = [NSNumber numberWithBool:v16];
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_ERROR)) {
      +[HKMCProjectionAccuracyAnalytics _isSleepConfiguredForWristTemperatureMeasurementsWithError:](v13);
    }
    if (a3)
    {
      v15 = 0;
      *a3 = v7;
    }
    else
    {
      _HKLogDroppedError();
      v15 = 0;
    }
  }

  return v15;
}

+ (void)submitMetricWithDayIndex:(void *)a1 oldMenstrualFlow:newMenstrualFlow:analysis:isLoggingMultipleDays:periodPredictionEnabled:heartRateBasedPredictionEnabled:wristTemperatureBasedPredictionEnabled:isWristTemperatureInputDelivered:internalLiveOnCycleFactorOverrideEnabled:cycles:.cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v4, v5, "[%{public}@] Error computing if sleep is configured for wrist temperature: %{public}@", v6, v7, v8, v9, v10);
}

+ (void)_isSleepConfiguredForWristTemperatureMeasurementsWithError:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_opt_class();
  id v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_2249E9000, v4, v5, "[%{public}@] Error retrieving sleep event record: %{public}@", v6, v7, v8, v9, v10);
}

@end