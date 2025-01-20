@interface ATXUsageInsightsServer
+ (id)sharedInstance;
- (ATXUsageInsightsServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)fetchAllContinuousUsageSessionsWithCompletion:(id)a3;
- (void)fetchAllDeliveredNotificationsWithCompletion:(id)a3;
- (void)fetchAllInterruptingAppSessionsWithCompletion:(id)a3;
- (void)fetchAllMindlessCyclingSessionsWithCompletion:(id)a3;
- (void)fetchAllPhubbingSessionsWithCompletion:(id)a3;
- (void)fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:(id)a3;
- (void)fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:(id)a3;
- (void)fetchUsageInsightsInferredATXModeEventsWithCompletion:(id)a3;
@end

@implementation ATXUsageInsightsServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_7 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_7, &__block_literal_global_64);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_9;
  return v2;
}

void __40__ATXUsageInsightsServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_9;
  sharedInstance__pasExprOnceResult_9 = v1;
}

- (ATXUsageInsightsServer)init
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)ATXUsageInsightsServer;
  v2 = [(ATXUsageInsightsServer *)&v8 init];
  if (v2)
  {
    v3 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXUsageInsightsServer: launched", buf, 2u);
    }

    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.proactive.UsageInsights"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v6 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[ATXUsageInsightsServer init]";
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%s: Listening for connections", buf, 0xCu);
    }
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[ATXUsageInsightsServer listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "%s: Connection attempted", buf, 0xCu);
  }

  v9 = [v7 valueForEntitlement:@"com.apple.proactive.UsageInsights"];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && ([v9 BOOLValue] & 1) != 0)
  {
    v10 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[ATXUsageInsightsServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "%s: Connection established", buf, 0xCu);
    }

    uint64_t v11 = ATXUsageInsightsInterface();
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:self];
    objc_initWeak((id *)buf, v7);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke;
    v26[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v27, (id *)buf);
    [v7 setInterruptionHandler:v26];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_17;
    v24 = &unk_1E68AC2D0;
    objc_copyWeak(&v25, (id *)buf);
    [v7 setInvalidationHandler:&v21];
    objc_msgSend(v7, "resume", v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    BOOL v12 = 1;
  }
  else
  {
    v13 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXUsageInsightsServer listener:shouldAcceptNewConnection:]((uint64_t)v7, v13, v14, v15, v16, v17, v18, v19);
    }

    BOOL v12 = 0;
  }

  return v12;
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = __atxlog_handle_usage_insights();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_17_cold_1();
  }
}

- (void)fetchAllDeliveredNotificationsWithCompletion:(id)a3
{
  v3 = (void (**)(id, void *, void))a3;
  id v8 = (id)objc_opt_new();
  [v8 successfullyAccumulatedNotificationEvents];
  id v4 = objc_alloc(MEMORY[0x1E4F4B008]);
  v5 = [v8 allDeliveredNotifications];
  id v6 = (void *)[v4 initWithAllDeliveredNotifications:v5 allInterruptingAppSessions:0];

  id v7 = [v6 allDeliveredNotifications];
  v3[2](v3, v7, 0);
}

- (void)fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__ATXUsageInsightsServer_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke;
  v6[3] = &unk_1E68AEC38;
  id v7 = v3;
  id v5 = v3;
  [v4 suggestedBundleIDsForAllowListWithCompletion:v6];
}

uint64_t __87__ATXUsageInsightsServer_fetchSuggestedBundleIDsForAllowListForAllModesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__ATXUsageInsightsServer_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke;
  v6[3] = &unk_1E68AEC38;
  id v7 = v3;
  id v5 = v3;
  [v4 suggestedBundleIDsForDenyListWithCompletion:v6];
}

uint64_t __86__ATXUsageInsightsServer_fetchSuggestedBundleIDsForDenyListForAllModesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchUsageInsightsInferredATXModeEventsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v5 = (id)objc_opt_new();
  id v4 = [v5 usageInsightsInferredATXModeEvents];
  v3[2](v3, v4, 0);
}

- (void)fetchAllInterruptingAppSessionsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v8 = (id)objc_opt_new();
  [v8 successfullyAccumulatedInterruptingSessions];
  id v4 = objc_alloc(MEMORY[0x1E4F4B008]);
  id v5 = [v8 allInterruptingAppSessions];
  id v6 = (void *)[v4 initWithAllDeliveredNotifications:0 allInterruptingAppSessions:v5];

  id v7 = [v6 allInterruptingAppSessions];
  v3[2](v3, v7, 0);
}

- (void)fetchAllPhubbingSessionsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v8 = (id)objc_opt_new();
  [v8 successfullyAccumulatedPhubbingEvents];
  id v4 = objc_alloc(MEMORY[0x1E4F4B258]);
  id v5 = [v8 phubbingSessions];
  id v6 = (void *)[v4 initWithPhubbingSessions:v5];

  id v7 = [v6 phubbingSessions];
  v3[2](v3, v7, 0);
}

- (void)fetchAllMindlessCyclingSessionsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v8 = (id)objc_opt_new();
  [v8 accumulateMindlessCyclingEvents];
  id v4 = objc_alloc(MEMORY[0x1E4F4AFC0]);
  id v5 = [v8 mindlessCyclingEvents];
  id v6 = (void *)[v4 initWithContinuousDeviceUsageEvent:0 mindlessCyclingEvents:v5];

  id v7 = [v6 mindlessCyclingEvents];
  v3[2](v3, v7, 0);
}

- (void)fetchAllContinuousUsageSessionsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, void *, void))a3;
  id v8 = (id)objc_opt_new();
  [v8 successfullyAccumulatedContinuousUseEvents];
  id v4 = objc_alloc(MEMORY[0x1E4F4AFC0]);
  id v5 = [v8 continuousUseSessions];
  id v6 = (void *)[v4 initWithContinuousDeviceUsageEvent:v5 mindlessCyclingEvents:0];

  id v7 = [v6 continuousDeviceUsageEvents];
  v3[2](v3, v7, 0);
}

- (void).cxx_destruct
{
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Unexpected Interruption: %@", v2, v3, v4, v5, 2u);
}

void __61__ATXUsageInsightsServer_listener_shouldAcceptNewConnection___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "%s: Connection invalidated: %@", v2, v3, v4, v5, 2u);
}

@end