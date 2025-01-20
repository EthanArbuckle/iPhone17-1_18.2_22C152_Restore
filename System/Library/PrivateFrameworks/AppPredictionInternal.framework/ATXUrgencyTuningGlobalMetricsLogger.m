@interface ATXUrgencyTuningGlobalMetricsLogger
- (ATXUrgencyTuningGlobalMetricsLogger)init;
- (void)logCountForNotificationWithBundleId:(id)a3 isTimeSensitiveNotification:(BOOL)a4 isEngagedTimeSensitiveNotification:(BOOL)a5 count:(double)a6 xpcActivity:(id)a7;
- (void)logUrgencyTuningGlobalMetrics;
- (void)logUrgencyTuningGlobalMetricsWithXPCActivity:(id)a3;
@end

@implementation ATXUrgencyTuningGlobalMetricsLogger

- (ATXUrgencyTuningGlobalMetricsLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXUrgencyTuningGlobalMetricsLogger;
  v2 = [(ATXUrgencyTuningGlobalMetricsLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    eventTrackerLogger = v2->_eventTrackerLogger;
    v2->_eventTrackerLogger = (ATXPETEventTracker2Logger *)v3;
  }
  return v2;
}

- (void)logUrgencyTuningGlobalMetrics
{
}

- (void)logUrgencyTuningGlobalMetricsWithXPCActivity:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4 + -86400.0;
  objc_super v6 = objc_opt_new();
  v31 = [v6 engagementStatusOfActiveAndProminentNotificationsWithUrgency:1 sinceTimestamp:v5];
  if ([v3 didDefer])
  {
    v7 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      v39 = v9;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", buf, 0xCu);
    }
  }
  else
  {
    v7 = [v6 totalNotificationsPerAppFromStartTime:v5 toEndTime:CFAbsoluteTimeGetCurrent()];
    if ([v3 didDefer])
    {
      v10 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412290;
        v39 = v12;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", buf, 0xCu);
      }
      v13 = v10;
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v13 = v7;
      uint64_t v32 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v32)
      {
        v27 = v7;
        v28 = v6;
        uint64_t v29 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v13);
            }
            uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v16 = objc_msgSend(v31, "objectForKeyedSubscript:", v15, v27, v28);
            v17 = [v16 second];

            v18 = [v13 objectForKeyedSubscript:v15];
            uint64_t v19 = [v18 unsignedIntegerValue];

            if (v17)
            {
              v20 = [v17 first];
              v21 = v13;
              uint64_t v22 = [v20 unsignedIntegerValue];
              v23 = [v17 second];
              unint64_t v24 = [v23 unsignedIntegerValue] + v22;

              v25 = [v17 first];
              unint64_t v26 = [v25 unsignedIntegerValue];

              v13 = v21;
            }
            else
            {
              unint64_t v24 = 0;
              unint64_t v26 = 0;
            }
            [(ATXUrgencyTuningGlobalMetricsLogger *)self logCountForNotificationWithBundleId:v15 isTimeSensitiveNotification:1 isEngagedTimeSensitiveNotification:1 count:v3 xpcActivity:(double)v26];
            [(ATXUrgencyTuningGlobalMetricsLogger *)self logCountForNotificationWithBundleId:v15 isTimeSensitiveNotification:1 isEngagedTimeSensitiveNotification:0 count:v3 xpcActivity:(double)v24];
            [(ATXUrgencyTuningGlobalMetricsLogger *)self logCountForNotificationWithBundleId:v15 isTimeSensitiveNotification:0 isEngagedTimeSensitiveNotification:0 count:v3 xpcActivity:(double)(v19 - v24)];
          }
          uint64_t v32 = [v13 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v32);
        v7 = v27;
        objc_super v6 = v28;
      }
    }
  }
}

- (void)logCountForNotificationWithBundleId:(id)a3 isTimeSensitiveNotification:(BOOL)a4 isEngagedTimeSensitiveNotification:(BOOL)a5 count:(double)a6 xpcActivity:(id)a7
{
  uint64_t v8 = a5;
  BOOL v9 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v12 = a7;
  id v13 = a3;
  v14 = objc_opt_new();
  [v14 setBundleId:v13];

  [v14 setIsTimeSensitiveNotification:v9];
  [v14 setIsTimeSensitiveAndEngagedNotification:v8];
  [(ATXPETEventTracker2Logger *)self->_eventTrackerLogger trackScalarForMessage:v14 count:(int)a6];
  LODWORD(v8) = [v12 didDefer];

  if (v8)
  {
    uint64_t v15 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      int v18 = 138412290;
      uint64_t v19 = v17;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "%@ - XPC Activity deferred, terminating.", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
}

@end