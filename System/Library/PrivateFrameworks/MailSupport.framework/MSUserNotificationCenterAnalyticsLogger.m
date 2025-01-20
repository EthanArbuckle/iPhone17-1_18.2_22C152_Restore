@interface MSUserNotificationCenterAnalyticsLogger
- (BOOL)generatedSummarySupported;
- (EFScheduler)scheduler;
- (EMCoreAnalyticsCollector)coreAnalytics;
- (MSUserNotificationCenterAnalyticsLogger)initWithCoreAnalyticsCollector:(id)a3;
- (NSMutableDictionary)notificationIntervals;
- (void)messageAddedWithNotificationIDs:(id)a3;
- (void)messageSummaryAddedForNotificationID:(id)a3 isGeneratedSummary:(BOOL)a4;
- (void)notificationRemovedWithNotificationIDs:(id)a3;
- (void)notificationSummaryUpdatedForNotificationID:(id)a3;
- (void)notificationWithSummaryPostedForNotificationID:(id)a3;
- (void)notificationWithoutSummaryPostedForNotificationID:(id)a3;
- (void)setCoreAnalytics:(id)a3;
- (void)setGeneratedSummarySupported:(BOOL)a3;
- (void)setNotificationIntervals:(id)a3;
@end

@implementation MSUserNotificationCenterAnalyticsLogger

void ___ef_log_MSUserNotificationCenterAnalyticsLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "MSUserNotificationCenterAnalyticsLogger");
  v1 = (void *)_ef_log_MSUserNotificationCenterAnalyticsLogger_log;
  _ef_log_MSUserNotificationCenterAnalyticsLogger_log = (uint64_t)v0;
}

- (MSUserNotificationCenterAnalyticsLogger)initWithCoreAnalyticsCollector:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSUserNotificationCenterAnalyticsLogger;
  v6 = [(MSUserNotificationCenterAnalyticsLogger *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreAnalytics, a3);
    uint64_t v8 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mail.analytics.notification" qualityOfService:9];
    scheduler = v7->_scheduler;
    v7->_scheduler = (EFScheduler *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    notificationIntervals = v7->_notificationIntervals;
    v7->_notificationIntervals = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)messageAddedWithNotificationIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v5 = [(MSUserNotificationCenterAnalyticsLogger *)self scheduler];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__MSUserNotificationCenterAnalyticsLogger_messageAddedWithNotificationIDs___block_invoke;
    v6[3] = &unk_1E63FF098;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [v5 performBlock:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75__MSUserNotificationCenterAnalyticsLogger_messageAddedWithNotificationIDs___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v4 = v3;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v23;
      *(void *)&long long v7 = 138543618;
      long long v21 = v7;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
          v11 = objc_msgSend(WeakRetained, "notificationIntervals", v21, (void)v22);
          v12 = [v11 objectForKeyedSubscript:v10];
          BOOL v13 = v12 == 0;

          if (v13)
          {
            v14 = _ef_log_MSUserNotificationCenterAnalyticsLogger();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v21;
              uint64_t v29 = v10;
              __int16 v30 = 2048;
              double v31 = v4;
              _os_log_debug_impl(&dword_1BF36E000, v14, OS_LOG_TYPE_DEBUG, "Message added: %{public}@, initialDate: %f", buf, 0x16u);
            }

            v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v4];
            v16 = [WeakRetained notificationIntervals];
            [v16 setObject:v15 forKeyedSubscript:v10];

            v26[0] = @"type";
            v26[1] = @"generatedSummarySupported";
            v27[0] = &unk_1F1AA9068;
            v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(WeakRetained, "generatedSummarySupported"));
            v27[1] = v17;
            v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

            v19 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.notification.add" collectionData:v18];
            v20 = [WeakRetained coreAnalytics];
            [v20 logOneTimeEvent:v19];
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v6);
    }
  }
}

- (void)notificationRemovedWithNotificationIDs:(id)a3
{
  id v4 = a3;
  id v5 = _ef_log_MSUserNotificationCenterAnalyticsLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MSUserNotificationCenterAnalyticsLogger notificationRemovedWithNotificationIDs:]((uint64_t)v4, v5);
  }

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v6 = [(MSUserNotificationCenterAnalyticsLogger *)self scheduler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__MSUserNotificationCenterAnalyticsLogger_notificationRemovedWithNotificationIDs___block_invoke;
  v8[3] = &unk_1E63FF098;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 performBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __82__MSUserNotificationCenterAnalyticsLogger_notificationRemovedWithNotificationIDs___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    double v3 = [WeakRetained notificationIntervals];
    [v3 removeObjectsForKeys:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)notificationWithoutSummaryPostedForNotificationID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSUserNotificationCenterAnalyticsLogger.m" lineNumber:81 description:@"notificationID cannot be nil"];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v6 = [(MSUserNotificationCenterAnalyticsLogger *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__MSUserNotificationCenterAnalyticsLogger_notificationWithoutSummaryPostedForNotificationID___block_invoke;
  v9[3] = &unk_1E63FF098;
  objc_copyWeak(&v11, &location);
  id v7 = v5;
  id v10 = v7;
  [v6 performBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __93__MSUserNotificationCenterAnalyticsLogger_notificationWithoutSummaryPostedForNotificationID___block_invoke(uint64_t a1)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained notificationIntervals];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v5 doubleValue];
    double v7 = v6;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v9 = v8 - v7;
    id v10 = _ef_log_MSUserNotificationCenterAnalyticsLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __93__MSUserNotificationCenterAnalyticsLogger_notificationWithoutSummaryPostedForNotificationID___block_invoke_cold_1();
    }

    v16[0] = @"messageSummaryPresent";
    v16[1] = @"type";
    v17[0] = MEMORY[0x1E4F1CC28];
    v17[1] = &unk_1F1AA9080;
    v16[2] = @"generatedSummarySupported";
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "generatedSummarySupported"));
    v17[2] = v11;
    v16[3] = @"notificationPostDuration";
    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    v17[3] = v12;
    BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.notification.add" collectionData:v13];
    v15 = [v3 coreAnalytics];
    [v15 logOneTimeEvent:v14];
  }
}

- (void)notificationWithSummaryPostedForNotificationID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSUserNotificationCenterAnalyticsLogger.m" lineNumber:102 description:@"notificationID cannot be nil"];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v6 = [(MSUserNotificationCenterAnalyticsLogger *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__MSUserNotificationCenterAnalyticsLogger_notificationWithSummaryPostedForNotificationID___block_invoke;
  v9[3] = &unk_1E63FF098;
  objc_copyWeak(&v11, &location);
  id v7 = v5;
  id v10 = v7;
  [v6 performBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __90__MSUserNotificationCenterAnalyticsLogger_notificationWithSummaryPostedForNotificationID___block_invoke(uint64_t a1)
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained notificationIntervals];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v5 doubleValue];
    double v7 = v6;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v9 = v8 - v7;
    id v10 = _ef_log_MSUserNotificationCenterAnalyticsLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __90__MSUserNotificationCenterAnalyticsLogger_notificationWithSummaryPostedForNotificationID___block_invoke_cold_1();
    }

    v16[0] = @"messageSummaryPresent";
    v16[1] = @"type";
    v17[0] = MEMORY[0x1E4F1CC38];
    v17[1] = &unk_1F1AA9080;
    v16[2] = @"generatedSummarySupported";
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "generatedSummarySupported"));
    v17[2] = v11;
    v16[3] = @"notificationPostDuration";
    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    v17[3] = v12;
    BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.notification.add" collectionData:v13];
    v15 = [v3 coreAnalytics];
    [v15 logOneTimeEvent:v14];
  }
}

- (void)notificationSummaryUpdatedForNotificationID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MSUserNotificationCenterAnalyticsLogger.m" lineNumber:123 description:@"notificationID cannot be nil"];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v6 = [(MSUserNotificationCenterAnalyticsLogger *)self scheduler];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__MSUserNotificationCenterAnalyticsLogger_notificationSummaryUpdatedForNotificationID___block_invoke;
  v9[3] = &unk_1E63FF098;
  objc_copyWeak(&v11, &location);
  id v7 = v5;
  id v10 = v7;
  [v6 performBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __87__MSUserNotificationCenterAnalyticsLogger_notificationSummaryUpdatedForNotificationID___block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained notificationIntervals];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v5 doubleValue];
    double v7 = v6;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v9 = v8 - v7;
    id v10 = _ef_log_MSUserNotificationCenterAnalyticsLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __87__MSUserNotificationCenterAnalyticsLogger_notificationSummaryUpdatedForNotificationID___block_invoke_cold_1();
    }

    v17[0] = &unk_1F1AA9098;
    v16[0] = @"type";
    v16[1] = @"generatedSummarySupported";
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "generatedSummarySupported"));
    v17[1] = v11;
    v16[2] = @"notificationPostDuration";
    v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
    v17[2] = v12;
    BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.notification.add" collectionData:v13];
    v15 = [v3 coreAnalytics];
    [v15 logOneTimeEvent:v14];
  }
}

- (void)messageSummaryAddedForNotificationID:(id)a3 isGeneratedSummary:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MSUserNotificationCenterAnalyticsLogger.m" lineNumber:143 description:@"notificationID cannot be nil"];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v8 = [(MSUserNotificationCenterAnalyticsLogger *)self scheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__MSUserNotificationCenterAnalyticsLogger_messageSummaryAddedForNotificationID_isGeneratedSummary___block_invoke;
  v11[3] = &unk_1E63FF0C0;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  BOOL v14 = a4;
  [v8 performBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __99__MSUserNotificationCenterAnalyticsLogger_messageSummaryAddedForNotificationID_isGeneratedSummary___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained notificationIntervals];
    id v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v5)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v7 = v6;
      [v5 doubleValue];
      double v9 = v7 - v8;
      id v10 = _ef_log_MSUserNotificationCenterAnalyticsLogger();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = *(unsigned __int8 *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        uint64_t v22 = v17;
        __int16 v23 = 1024;
        int v24 = v18;
        __int16 v25 = 2048;
        double v26 = v9;
        _os_log_debug_impl(&dword_1BF36E000, v10, OS_LOG_TYPE_DEBUG, "Summary updated: %{public}@, isGeneratedSummary: %{BOOL}d, duration: %f", buf, 0x1Cu);
      }

      id v11 = &unk_1F1AA90B0;
      if (!*(unsigned char *)(a1 + 48)) {
        id v11 = &unk_1F1AA90C8;
      }
      v20[0] = v11;
      id v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v3, "generatedSummarySupported", @"type", @"generatedSummarySupported"));
      v20[1] = v12;
      v19[2] = @"messageSummaryAddedDuration";
      id v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v9];
      v20[2] = v13;
      BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];

      v15 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.notification.add" collectionData:v14];
      v16 = [v3 coreAnalytics];
      [v16 logOneTimeEvent:v15];
    }
  }
}

- (BOOL)generatedSummarySupported
{
  return self->_generatedSummarySupported;
}

- (void)setGeneratedSummarySupported:(BOOL)a3
{
  self->_generatedSummarySupported = a3;
}

- (EMCoreAnalyticsCollector)coreAnalytics
{
  return self->_coreAnalytics;
}

- (void)setCoreAnalytics:(id)a3
{
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (NSMutableDictionary)notificationIntervals
{
  return self->_notificationIntervals;
}

- (void)setNotificationIntervals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationIntervals, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_coreAnalytics, 0);
}

- (void)notificationRemovedWithNotificationIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BF36E000, a2, OS_LOG_TYPE_DEBUG, "Notifications removed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __93__MSUserNotificationCenterAnalyticsLogger_notificationWithoutSummaryPostedForNotificationID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BF36E000, v0, v1, "Notification without summary added: %{public}@, duration: %f", v2, v3, v4, v5, v6);
}

void __90__MSUserNotificationCenterAnalyticsLogger_notificationWithSummaryPostedForNotificationID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BF36E000, v0, v1, "Notification with summary added: %{public}@, duration: %f", v2, v3, v4, v5, v6);
}

void __87__MSUserNotificationCenterAnalyticsLogger_notificationSummaryUpdatedForNotificationID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BF36E000, v0, v1, "Notification with summary updated: %{public}@, duration: %f", v2, v3, v4, v5, v6);
}

@end