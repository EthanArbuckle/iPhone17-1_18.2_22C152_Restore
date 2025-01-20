@interface HKMedicationLoggingAnalytics
+ (BOOL)_isAllowed;
+ (BOOL)_isMetricEnabled;
+ (BOOL)shouldSubmit;
+ (int64_t)_detailedScheduleLoggingContextForScheduleType:(int64_t)a3;
+ (int64_t)_extractCommonScheduleTypeForMedicationSchedules:(id)a3;
+ (int64_t)_unitTesting_detailedLoggingContextForLoggingContext:(int64_t)a3 schedules:(id)a4;
+ (void)submitLogMetricWithHealthStore:(id)a3 actions:(int64_t)a4 provenance:(int64_t)a5 context:(int64_t)a6 medicationIdentifiers:(id)a7 loggingMultipleMeds:(BOOL)a8 hoursAgoLoggedForMax:(id)a9 hoursAgoLoggedForMin:(id)a10 hoursFromScheduledTimeLoggedMax:(id)a11 hoursFromScheduledTimeLoggedMin:(id)a12 hoursFromScheduledToTakenOrSkippedMax:(id)a13 hoursFromScheduledToTakenOrSkippedMin:(id)a14 isPartiallyLoggingScheduledMeds:(id)a15 dataSource:(id)a16;
@end

@implementation HKMedicationLoggingAnalytics

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
  v2 = +[HKMedicationLogMetric eventName];
  char IsEventUsed = AnalyticsIsEventUsed();

  return IsEventUsed;
}

+ (BOOL)_isAllowed
{
  return MEMORY[0x1F40E7D50](a1, a2);
}

+ (void)submitLogMetricWithHealthStore:(id)a3 actions:(int64_t)a4 provenance:(int64_t)a5 context:(int64_t)a6 medicationIdentifiers:(id)a7 loggingMultipleMeds:(BOOL)a8 hoursAgoLoggedForMax:(id)a9 hoursAgoLoggedForMin:(id)a10 hoursFromScheduledTimeLoggedMax:(id)a11 hoursFromScheduledTimeLoggedMin:(id)a12 hoursFromScheduledToTakenOrSkippedMax:(id)a13 hoursFromScheduledToTakenOrSkippedMin:(id)a14 isPartiallyLoggingScheduledMeds:(id)a15 dataSource:(id)a16
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v18 = a7;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  v46 = v20;
  v47 = v19;
  v44 = v22;
  v45 = v21;
  if ([a1 shouldSubmit])
  {
    HKMedicationsSharedAnalyticsQueue();
    v42 = v24;
    v28 = v27 = v23;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke;
    block[3] = &unk_1E62EBAD0;
    v50 = v48;
    id v51 = v18;
    id v60 = a1;
    int64_t v61 = a6;
    int64_t v62 = a4;
    int64_t v63 = a5;
    BOOL v64 = a8;
    id v52 = v19;
    id v53 = v20;
    id v54 = v21;
    id v55 = v22;
    id v56 = v27;
    id v57 = v42;
    id v58 = v25;
    id v59 = v26;
    dispatch_async(v28, block);

    id v23 = v27;
    id v24 = v42;

    v29 = v50;
    v30 = v48;
    v31 = v18;
LABEL_6:

    goto LABEL_7;
  }
  _HKInitializeLogging();
  v32 = HKLogMedication();
  BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);

  v30 = v48;
  v31 = v18;
  if (v33)
  {
    v29 = HKLogMedication();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v34 = objc_opt_class();
      v35 = NSNumber;
      id v43 = v34;
      v36 = objc_msgSend(v35, "numberWithBool:", objc_msgSend(a1, "_isMetricEnabled"));
      v37 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_isAllowed"));
      *(_DWORD *)buf = 138543874;
      v66 = v34;
      v30 = v48;
      __int16 v67 = 2114;
      v68 = v36;
      __int16 v69 = 2114;
      v70 = v37;
      _os_log_impl(&dword_1BCB4A000, v29, OS_LOG_TYPE_INFO, "[%{public}@] Skipping submitting metric. isMetricEnabled: %{public}@, isHealthDataSubmissionAllowed: %{public}@", buf, 0x20u);

      v31 = v18;
    }
    goto LABEL_6;
  }
LABEL_7:
}

void __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke(uint64_t a1)
{
  v2 = [[HKMedicationScheduleControl alloc] initWithHealthStore:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke_2;
  v4[3] = &unk_1E62EBAA8;
  uint64_t v13 = *(void *)(a1 + 112);
  long long v14 = *(_OWORD *)(a1 + 120);
  uint64_t v15 = *(void *)(a1 + 136);
  char v16 = *(unsigned char *)(a1 + 144);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v10 = *(id *)(a1 + 88);
  id v11 = *(id *)(a1 + 96);
  id v12 = *(id *)(a1 + 104);
  [(HKMedicationScheduleControl *)v2 fetchSchedulesWithMedicationIdentifiers:v3 completion:v4];
}

void __357__HKMedicationLoggingAnalytics_submitLogMetricWithHealthStore_actions_provenance_context_medicationIdentifiers_loggingMultipleMeds_hoursAgoLoggedForMax_hoursAgoLoggedForMin_hoursFromScheduledTimeLoggedMax_hoursFromScheduledTimeLoggedMin_hoursFromScheduledToTakenOrSkippedMax_hoursFromScheduledToTakenOrSkippedMin_isPartiallyLoggingScheduledMeds_dataSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 96), "_unitTesting_detailedLoggingContextForLoggingContext:schedules:", *(void *)(a1 + 104), a2);
  v4 = [[HKMedicationLogMetric alloc] initWithActions:*(void *)(a1 + 112) provenance:*(void *)(a1 + 120) context:v3 loggingMultipleMeds:*(unsigned __int8 *)(a1 + 128) hoursAgoLoggedForMax:*(void *)(a1 + 32) hoursAgoLoggedForMin:*(void *)(a1 + 40) hoursFromScheduledTimeLoggedMax:*(void *)(a1 + 48) hoursFromScheduledTimeLoggedMin:*(void *)(a1 + 56) hoursFromScheduledToTakenOrSkippedMax:*(void *)(a1 + 64) hoursFromScheduledToTakenOrSkippedMin:*(void *)(a1 + 72) isPartiallyLoggingScheduledMeds:*(void *)(a1 + 80) dataSource:*(void *)(a1 + 88)];
  id v5 = +[HKMedicationLogMetric eventName];
  id v6 = [(HKMedicationLogMetric *)v4 eventPayload];
  AnalyticsSendEvent();

  _HKInitializeLogging();
  id v7 = HKLogMedication();
  LODWORD(v6) = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

  if (v6)
  {
    id v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      id v11 = HKSensitiveLogItem();
      id v12 = HKStringFromMedicationLoggingContext(v3);
      *(_DWORD *)buf = 138543874;
      long long v14 = v9;
      __int16 v15 = 2114;
      char v16 = v11;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_1BCB4A000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Submitted metric %{public}@ with context: %{public}@", buf, 0x20u);
    }
  }
}

+ (int64_t)_unitTesting_detailedLoggingContextForLoggingContext:(int64_t)a3 schedules:(id)a4
{
  if (a3 != 1) {
    return a3;
  }
  uint64_t v6 = [a1 _extractCommonScheduleTypeForMedicationSchedules:a4];
  return [a1 _detailedScheduleLoggingContextForScheduleType:v6];
}

+ (int64_t)_detailedScheduleLoggingContextForScheduleType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 1;
  }
  else {
    return qword_1BCB6BFE8[a3 - 1];
  }
}

+ (int64_t)_extractCommonScheduleTypeForMedicationSchedules:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "scheduleType", (void)v11);
        if (v6)
        {
          if (v6 != v9) {
            goto LABEL_13;
          }
        }
        else
        {
          int64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
LABEL_13:
    int64_t v6 = 0;
  }

  return v6;
}

@end