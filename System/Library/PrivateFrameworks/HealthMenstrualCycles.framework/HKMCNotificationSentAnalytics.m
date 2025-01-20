@interface HKMCNotificationSentAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (void)submitMetricForCategory:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a5;
+ (void)submitMetricForCategory:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4 numberOfDaysShiftedForFertileWindow:(id)a5 numberOfDaysOffsetFromFertileWindowEnd:(id)a6 numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:(id)a7 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a8;
@end

@implementation HKMCNotificationSentAnalytics

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
  v2 = +[HKMCNotificationSentMetric eventName];
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

+ (void)submitMetricForCategory:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4 numberOfDaysShiftedForFertileWindow:(id)a5 numberOfDaysOffsetFromFertileWindowEnd:(id)a6 numberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:(id)a7 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a4;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ([a1 shouldSubmit])
  {
    v18 = [HKMCNotificationSentMetric alloc];
    v19 = [NSNumber numberWithBool:v12];
    v20 = [(HKMCNotificationSentMetric *)v18 initWithCategory:v14 areHealthNotificationsAuthorized:v19];

    [(HKMCNotificationSentMetric *)v20 setNumberOfDaysShiftedForFertileWindow:v15];
    [(HKMCNotificationSentMetric *)v20 setNumberOfDaysOffsetFromFertileWindowEnd:v16];
    [(HKMCNotificationSentMetric *)v20 setNumberOfDaysWithWristTemp45DaysBeforeOvulationConfirmedNotification:v17];
    v21 = [NSNumber numberWithBool:v8];
    [(HKMCNotificationSentMetric *)v20 setInternalLiveOnCycleFactorOverrideEnabled:v21];

    v22 = +[HKMCNotificationSentMetric eventName];
    v23 = [(HKMCNotificationSentMetric *)v20 eventPayload];
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      v26 = objc_opt_class();
      id v27 = v26;
      v28 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543618;
      v37 = v26;
      __int16 v38 = 2114;
      v39 = v28;
      _os_log_impl(&dword_2249E9000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      v31 = objc_opt_class();
      v32 = NSNumber;
      id v33 = v31;
      v34 = objc_msgSend(v32, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
      v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
      *(_DWORD *)buf = 138543874;
      v37 = v31;
      __int16 v38 = 2114;
      v39 = v34;
      __int16 v40 = 2114;
      v41 = v35;
      _os_log_impl(&dword_2249E9000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);
    }
  }
}

+ (void)submitMetricForCategory:(id)a3 areHealthNotificationsAuthorized:(BOOL)a4 internalLiveOnCycleFactorOverrideEnabled:(BOOL)a5
{
}

@end