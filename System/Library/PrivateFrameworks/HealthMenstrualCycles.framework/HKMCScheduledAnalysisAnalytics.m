@interface HKMCScheduledAnalysisAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (void)submitMetricWithDateComponents:(id)a3;
@end

@implementation HKMCScheduledAnalysisAnalytics

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
  v2 = +[HKMCScheduledAnalysisMetric eventName];
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

+ (void)submitMetricWithDateComponents:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 shouldSubmit])
  {
    uint64_t v5 = (uint64_t)(ceil((double)[v4 minute] / 15.0) * 15.0);
    uint64_t v6 = [v4 hour];
    if (v5 == 60) {
      uint64_t v7 = v6 + 1;
    }
    else {
      uint64_t v7 = v6;
    }
    if (v5 == 60) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v5;
    }
    if (v7 == 24) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 100 * v7;
    }
    v10 = [[HKMCScheduledAnalysisMetric alloc] initWithTimeSuccessful:v9 + v8];
    v11 = +[HKMCScheduledAnalysisMetric eventName];
    v12 = [(HKMCScheduledAnalysisMetric *)v10 eventPayload];
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x263F09930];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_opt_class();
      id v16 = v15;
      v17 = HKSensitiveLogItem();
      int v20 = 138543618;
      id v21 = v15;
      __int16 v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_2249E9000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v20, 0x16u);
    }
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v18;
    int v20 = 138543362;
    id v21 = (id)objc_opt_class();
    id v19 = v21;
    _os_log_impl(&dword_2249E9000, &v10->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric.", (uint8_t *)&v20, 0xCu);

LABEL_15:
  }
}

@end