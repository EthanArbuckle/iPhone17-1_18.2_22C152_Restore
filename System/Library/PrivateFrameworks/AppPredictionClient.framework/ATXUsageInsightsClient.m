@interface ATXUsageInsightsClient
- (ATXUsageInsightsClient)init;
- (void)fetchAllContinuousUsageSessionsWithCompletion:(id)a3;
- (void)fetchAllDeliveredNotificationsWithCompletion:(id)a3;
- (void)fetchAllInterruptingAppSessionsWithCompletion:(id)a3;
- (void)fetchAllMindlessCyclingSessionsWithCompletion:(id)a3;
- (void)fetchAllPhubbingSessionsWithCompletion:(id)a3;
- (void)fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:(id)a3;
- (void)fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:(id)a3;
- (void)fetchUsageInsightsInferredATXModeEventsWithCompletion:(id)a3;
@end

@implementation ATXUsageInsightsClient

- (ATXUsageInsightsClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXUsageInsightsClient;
  v2 = [(ATXUsageInsightsClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.UsageInsights" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = ATXUsageInsightsInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v2];
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_44];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_4_2];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __30__ATXUsageInsightsClient_init__block_invoke()
{
  v0 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __30__ATXUsageInsightsClient_init__block_invoke_cold_1(v0);
  }
}

void __30__ATXUsageInsightsClient_init__block_invoke_2()
{
  v0 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __30__ATXUsageInsightsClient_init__block_invoke_2_cold_1(v0);
  }
}

- (void)fetchAllDeliveredNotificationsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__ATXUsageInsightsClient_fetchAllDeliveredNotificationsWithCompletion___block_invoke;
    v16[3] = &unk_1E5D05770;
    SEL v18 = a2;
    v16[4] = self;
    id v8 = v5;
    id v17 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
    [v9 fetchAllDeliveredNotificationsWithCompletion:v8];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __71__ATXUsageInsightsClient_fetchAllDeliveredNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__ATXUsageInsightsClient_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke;
    v16[3] = &unk_1E5D05770;
    SEL v18 = a2;
    v16[4] = self;
    id v8 = v5;
    id v17 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
    [v9 fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:v8];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __87__ATXUsageInsightsClient_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__ATXUsageInsightsClient_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke;
    v16[3] = &unk_1E5D05770;
    SEL v18 = a2;
    v16[4] = self;
    id v8 = v5;
    id v17 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
    [v9 fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:v8];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __86__ATXUsageInsightsClient_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchUsageInsightsInferredATXModeEventsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __80__ATXUsageInsightsClient_fetchUsageInsightsInferredATXModeEventsWithCompletion___block_invoke;
    v16[3] = &unk_1E5D05770;
    SEL v18 = a2;
    v16[4] = self;
    id v8 = v5;
    id v17 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v16];
    [v9 fetchUsageInsightsInferredATXModeEventsWithCompletion:v8];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __80__ATXUsageInsightsClient_fetchUsageInsightsInferredATXModeEventsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchAllInterruptingAppSessionsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke;
    v18[3] = &unk_1E5D05770;
    SEL v20 = a2;
    v18[4] = self;
    id v8 = v5;
    id v19 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke_10;
    v16[3] = &unk_1E5D04F78;
    id v17 = v8;
    [v9 fetchAllInterruptingAppSessionsWithCompletion:v16];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__ATXUsageInsightsClient_fetchAllInterruptingAppSessionsWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllPhubbingSessionsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke;
    v18[3] = &unk_1E5D05770;
    SEL v20 = a2;
    v18[4] = self;
    id v8 = v5;
    id v19 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke_12;
    v16[3] = &unk_1E5D04F78;
    id v17 = v8;
    [v9 fetchAllPhubbingSessionsWithCompletion:v16];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __65__ATXUsageInsightsClient_fetchAllPhubbingSessionsWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllMindlessCyclingSessionsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke;
    v18[3] = &unk_1E5D05770;
    SEL v20 = a2;
    v18[4] = self;
    id v8 = v5;
    id v19 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke_13;
    v16[3] = &unk_1E5D04F78;
    id v17 = v8;
    [v9 fetchAllMindlessCyclingSessionsWithCompletion:v16];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__ATXUsageInsightsClient_fetchAllMindlessCyclingSessionsWithCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchAllContinuousUsageSessionsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    xpcConnection = self->_xpcConnection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke;
    v18[3] = &unk_1E5D05770;
    SEL v20 = a2;
    v18[4] = self;
    id v8 = v5;
    id v19 = v8;
    v9 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v18];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke_14;
    v16[3] = &unk_1E5D04F78;
    id v17 = v8;
    [v9 fetchAllContinuousUsageSessionsWithCompletion:v16];
  }
  else
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    v13 = NSStringFromSelector(a2);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v11 raise:v12, @"No completion handler provided for %@ in %@", v13, v15 format];
  }
}

void __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__ATXUsageInsightsClient_fetchAllContinuousUsageSessionsWithCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __30__ATXUsageInsightsClient_init__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXUsageInsightsClient init]_block_invoke";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: Interruption handler called", (uint8_t *)&v1, 0xCu);
}

void __30__ATXUsageInsightsClient_init__block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXUsageInsightsClient init]_block_invoke";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: Invalidation handler called", (uint8_t *)&v1, 0xCu);
}

@end