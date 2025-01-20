@interface ATXAlarmsDataSource
- (ATXAlarmsDataSource)initWithDevice:(id)a3;
- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5;
@end

@implementation ATXAlarmsDataSource

- (ATXAlarmsDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXAlarmsDataSource;
  v6 = [(ATXAlarmsDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)alarmsFromDate:(id)a3 toDate:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((ATXHeuristicCanLearnFromApp(&unk_1F27272F0) & 1) == 0)
  {
    v20 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v20, OS_LOG_TYPE_DEFAULT, "Learn from Clock is disabled. Can't fetch alarms", buf, 2u);
    }

    goto LABEL_7;
  }
  [v7 timeIntervalSinceReferenceDate];
  double v11 = v10;
  [v8 timeIntervalSinceReferenceDate];
  if (v11 > v12)
  {
LABEL_7:
    (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0], 0);
    goto LABEL_8;
  }
  v13 = +[ATXHeuristicDevice sharedAlarmManager];
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v30 = buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  id v34 = 0;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
  v16 = [v13 nextAlarmsInRange:v15 maxCount:100 includeSleepAlarm:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke;
  v26[3] = &unk_1E68A52C8;
  v28 = buf;
  v17 = v14;
  v27 = v17;
  id v18 = (id)[v16 addCompletionBlock:v26];

  v19 = (void *)MEMORY[0x1E4F93B18];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_10;
  v23[3] = &unk_1E68A52F0;
  id v24 = v9;
  v25 = buf;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2;
  v21[3] = &unk_1E68A5318;
  id v22 = v24;
  [v19 waitForSemaphore:v17 timeoutSeconds:v23 onAcquire:v21 onTimeout:5.0];

  _Block_object_dispose(buf, 8);
LABEL_8:
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  else
  {
    id v22 = 0;
    uint64_t v23 = a1;
    id v24 = v5;
    id v8 = v5;
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v8;
    uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v39[0] = v10;
          v38[0] = @"MTAlarm";
          v38[1] = @"alarmID";
          v33 = objc_msgSend(v10, "alarmID", v22, v23, v24);
          v32 = [v33 UUIDString];
          v39[1] = v32;
          v38[2] = @"displayTitle";
          uint64_t v31 = [v10 displayTitle];
          v39[2] = v31;
          v38[3] = @"lastModifiedTS";
          double v11 = NSNumber;
          v30 = [v10 lastModifiedDate];
          [v30 timeIntervalSinceReferenceDate];
          v29 = objc_msgSend(v11, "numberWithDouble:");
          v39[3] = v29;
          v38[4] = @"hour";
          double v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "hour"));
          v39[4] = v12;
          v38[5] = @"minute";
          v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "minute"));
          v39[5] = v13;
          v38[6] = @"isEnabled";
          dispatch_semaphore_t v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isEnabled"));
          v39[6] = v14;
          v38[7] = @"isRepeating";
          v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "repeats"));
          v39[7] = v15;
          v39[8] = MEMORY[0x1E4F1CC38];
          v38[8] = @"playsOnThisDevice";
          v38[9] = @"isSleepAlarm";
          v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isSleepAlarm"));
          v39[9] = v16;
          v38[10] = @"bedtimeHour";
          v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "bedtimeHour"));
          v39[10] = v17;
          v38[11] = @"bedtimeMinute";
          id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "bedtimeMinute"));
          v39[11] = v18;
          v38[12] = @"bedtimeReminderMinutes";
          v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "bedtimeReminderMinutes"));
          v39[12] = v19;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:13];
          [v27 addObject:v20];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v28);
    }

    a1 = v23;
    id v5 = v24;
    uint64_t v21 = *(void *)(*(void *)(v23 + 40) + 8);
    id v7 = *(NSObject **)(v21 + 40);
    *(void *)(v21 + 40) = v27;
    id v6 = v22;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2_cold_1(v2);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:1 userInfo:MEMORY[0x1E4F1CC08]];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

- (void).cxx_destruct
{
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Fetching alarms failed: %@", (uint8_t *)&v2, 0xCu);
}

void __63__ATXAlarmsDataSource_alarmsFromDate_toDate_completionHandler___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "XPC call to MobileTimer timed out.", v1, 2u);
}

@end