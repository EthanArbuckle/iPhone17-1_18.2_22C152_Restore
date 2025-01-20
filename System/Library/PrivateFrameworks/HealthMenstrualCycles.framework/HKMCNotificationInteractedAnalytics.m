@interface HKMCNotificationInteractedAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (void)submitMetricForCategory:(id)a3 action:(id)a4;
@end

@implementation HKMCNotificationInteractedAnalytics

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
  v2 = +[HKMCNotificationInteractedMetric eventName];
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

+ (void)submitMetricForCategory:(id)a3 action:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([a1 shouldSubmit])
  {
    v8 = [[HKMCNotificationInteractedMetric alloc] initWithCategory:v6 action:v7];
    v9 = +[HKMCNotificationInteractedMetric eventName];
    v10 = [(HKMCNotificationInteractedMetric *)v8 eventPayload];
    AnalyticsSendEvent();

    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x263F09930];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_8;
    }
    v12 = v11;
    v13 = objc_opt_class();
    id v14 = v13;
    v15 = HKSensitiveLogItem();
    int v21 = 138543618;
    v22 = v13;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_impl(&dword_2249E9000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v21, 0x16u);

LABEL_6:
    goto LABEL_7;
  }
  _HKInitializeLogging();
  v16 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v16;
    v17 = objc_opt_class();
    v18 = NSNumber;
    v12 = v17;
    v19 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
    v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
    int v21 = 138543874;
    v22 = v17;
    __int16 v23 = 2114;
    v24 = v19;
    __int16 v25 = 2114;
    v26 = v20;
    _os_log_impl(&dword_2249E9000, &v8->super, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", (uint8_t *)&v21, 0x20u);

    goto LABEL_6;
  }
LABEL_8:
}

@end