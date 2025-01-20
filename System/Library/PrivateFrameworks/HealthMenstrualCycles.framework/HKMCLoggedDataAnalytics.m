@interface HKMCLoggedDataAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (void)submitMetricForMethod:(id)a3 loggedDayIndex:(int64_t)a4 currentDayIndex:(int64_t)a5;
@end

@implementation HKMCLoggedDataAnalytics

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
  v2 = +[HKMCLoggedDataMetric eventName];
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

+ (void)submitMetricForMethod:(id)a3 loggedDayIndex:(int64_t)a4 currentDayIndex:(int64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([a1 shouldSubmit])
  {
    v9 = [[HKMCLoggedDataMetric alloc] initWithMethod:v8];
    v10 = [NSNumber numberWithInteger:a5 - a4];
    [(HKMCLoggedDataMetric *)v9 setDayIndexLoggingOffset:v10];

    v11 = +[HKMCLoggedDataMetric eventName];
    v12 = [(HKMCLoggedDataMetric *)v9 eventPayload];
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F09930];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    v14 = v13;
    v15 = objc_opt_class();
    id v16 = v15;
    v17 = HKSensitiveLogItem();
    int v23 = 138543618;
    v24 = v15;
    __int16 v25 = 2114;
    v26 = v17;
    _os_log_impl(&dword_2249E9000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v23, 0x16u);

LABEL_6:
    goto LABEL_7;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v18;
    v19 = objc_opt_class();
    v20 = NSNumber;
    v14 = v19;
    v21 = objc_msgSend(v20, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
    v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
    int v23 = 138543874;
    v24 = v19;
    __int16 v25 = 2114;
    v26 = v21;
    __int16 v27 = 2114;
    v28 = v22;
    _os_log_impl(&dword_2249E9000, &v9->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", (uint8_t *)&v23, 0x20u);

    goto LABEL_6;
  }
LABEL_8:
}

@end