@interface HKMedicationNotificationAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (void)submitMetricForType:(int64_t)a3 areHealthNotificationsAuthorizedStatus:(id)a4 interactionType:(int64_t)a5 dataSource:(id)a6;
+ (void)submitNotificationInterationMetricForType:(int64_t)a3 withHealthNotificationsAuthorizedStatus:(id)a4 dataSource:(id)a5;
+ (void)submitNotificationSentMetricWithHealthNotificationsAuthorizedStatus:(BOOL)a3 dataSource:(id)a4;
@end

@implementation HKMedicationNotificationAnalytics

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
  v2 = +[HKMedicationNotificationMetric eventName];
  char IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

+ (BOOL)_isAllowed
{
  return MEMORY[0x1F40E7D50](a1, a2);
}

+ (void)submitNotificationSentMetricWithHealthNotificationsAuthorizedStatus:(BOOL)a3 dataSource:(id)a4
{
  BOOL v4 = a3;
  v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [a1 submitMetricForType:1 areHealthNotificationsAuthorizedStatus:v8 interactionType:0 dataSource:v7];
}

+ (void)submitNotificationInterationMetricForType:(int64_t)a3 withHealthNotificationsAuthorizedStatus:(id)a4 dataSource:(id)a5
{
}

+ (void)submitMetricForType:(int64_t)a3 areHealthNotificationsAuthorizedStatus:(id)a4 interactionType:(int64_t)a5 dataSource:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if ([a1 shouldSubmit])
  {
    v12 = HKMedicationsSharedAnalyticsQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __123__HKMedicationNotificationAnalytics_submitMetricForType_areHealthNotificationsAuthorizedStatus_interactionType_dataSource___block_invoke;
    block[3] = &unk_1E62EB020;
    int64_t v24 = a3;
    v22 = v10;
    id v23 = v11;
    int64_t v25 = a5;
    id v26 = a1;
    dispatch_async(v12, block);

    v13 = v22;
LABEL_6:

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v14 = HKLogMedication();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

  if (v15)
  {
    v13 = HKLogMedication();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = objc_opt_class();
      v17 = NSNumber;
      id v18 = v16;
      v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
      v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
      *(_DWORD *)buf = 138543874;
      v28 = v16;
      __int16 v29 = 2114;
      v30 = v19;
      __int16 v31 = 2114;
      v32 = v20;
      _os_log_impl(&dword_1BCB4A000, v13, OS_LOG_TYPE_INFO, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __123__HKMedicationNotificationAnalytics_submitMetricForType_areHealthNotificationsAuthorizedStatus_interactionType_dataSource___block_invoke(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [[HKMedicationNotificationMetric alloc] initWithType:a1[6] areHealthNotificationsAuthorized:a1[4] dataSource:a1[5]];
  [(HKMedicationNotificationMetric *)v2 setInteractionType:a1[7]];
  int v3 = +[HKMedicationNotificationMetric eventName];
  BOOL v4 = [(HKMedicationNotificationMetric *)v2 eventPayload];
  AnalyticsSendEvent();

  _HKInitializeLogging();
  v5 = HKLogMedication();
  LODWORD(v4) = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v4)
  {
    v6 = HKLogMedication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = objc_opt_class();
      id v8 = v7;
      v9 = HKSensitiveLogItem();
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1BCB4A000, v6, OS_LOG_TYPE_INFO, "[%{public}@] Submitted metric %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

@end