@interface ATXNotificationCategorizationClient
- (ATXNotificationCategorizationClient)init;
- (void)collectCoreAnalyticsJsonForNotification:(id)a3 completion:(id)a4;
- (void)collectDynamicBreakthroughFeaturesForNotification:(id)a3 completion:(id)a4;
- (void)fetchContextForMailWithRequest:(id)a3 completion:(id)a4;
- (void)fetchContextForMessageWithRequest:(id)a3 completion:(id)a4;
- (void)fetchContextForNotificationWithRequest:(id)a3 completion:(id)a4;
- (void)rankUserNotificationWithRequest:(id)a3 completion:(id)a4;
@end

@implementation ATXNotificationCategorizationClient

- (ATXNotificationCategorizationClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXNotificationCategorizationClient;
  v2 = [(ATXNotificationCategorizationClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.personalization.notificationCategorization" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = ATXNotificationCategorizationXPCInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v2];
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_14];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_4_0];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __43__ATXNotificationCategorizationClient_init__block_invoke()
{
  v0 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__ATXNotificationCategorizationClient_init__block_invoke_cold_1(v0);
  }
}

void __43__ATXNotificationCategorizationClient_init__block_invoke_2()
{
  v0 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __43__ATXNotificationCategorizationClient_init__block_invoke_2_cold_1(v0);
  }
}

- (void)collectDynamicBreakthroughFeaturesForNotification:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]";
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke;
    v21[3] = &unk_1E5D05770;
    SEL v23 = a2;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_10;
    v19[3] = &unk_1E5D05E98;
    id v20 = v11;
    [v12 collectDynamicBreakthroughFeaturesForNotification:v7 completion:v19];
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No completion handler provided for %@ in %@", v16, v18 format];
  }
}

void __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)collectCoreAnalyticsJsonForNotification:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXNotificationCategorizationClient collectCoreAnalyticsJsonForNotification:completion:]";
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke;
    v21[3] = &unk_1E5D05770;
    SEL v23 = a2;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke_12;
    v19[3] = &unk_1E5D05EC0;
    id v20 = v11;
    [v12 collectCoreAnalyticsJsonForNotification:v7 completion:v19];
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No completion handler provided for %@ in %@", v16, v18 format];
  }
}

void __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __90__ATXNotificationCategorizationClient_collectCoreAnalyticsJsonForNotification_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient collectCoreAnalyticsJsonForNotification:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rankUserNotificationWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXNotificationCategorizationClient rankUserNotificationWithRequest:completion:]";
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke;
    v21[3] = &unk_1E5D05770;
    SEL v23 = a2;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke_14;
    v19[3] = &unk_1E5D05EE8;
    id v20 = v11;
    [v12 rankUserNotificationWithRequest:v7 completion:v19];
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No completion handler provided for %@ in %@", v16, v18 format];
  }
}

void __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __82__ATXNotificationCategorizationClient_rankUserNotificationWithRequest_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient rankUserNotificationWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchContextForNotificationWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXNotificationCategorizationClient fetchContextForNotificationWithRequest:completion:]";
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Fetching notification context %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke;
    v21[3] = &unk_1E5D05770;
    SEL v23 = a2;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke_16;
    v19[3] = &unk_1E5D05F10;
    id v20 = v11;
    [v12 fetchContextForNotificationWithRequest:v7 completion:v19];
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No completion handler provided for %@ in %@", v16, v18 format];
  }
}

void __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __89__ATXNotificationCategorizationClient_fetchContextForNotificationWithRequest_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient fetchContextForNotificationWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchContextForMailWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXNotificationCategorizationClient fetchContextForMailWithRequest:completion:]";
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Fetching mail context %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke;
    v21[3] = &unk_1E5D05770;
    SEL v23 = a2;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke_18;
    v19[3] = &unk_1E5D05F38;
    id v20 = v11;
    [v12 fetchContextForMailWithRequest:v7 completion:v19];
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No completion handler provided for %@ in %@", v16, v18 format];
  }
}

void __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__ATXNotificationCategorizationClient_fetchContextForMailWithRequest_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient fetchContextForMailWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchContextForMessageWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[ATXNotificationCategorizationClient fetchContextForMessageWithRequest:completion:]";
    _os_log_impl(&dword_1A790D000, v9, OS_LOG_TYPE_DEFAULT, "Fetching message context %s", buf, 0xCu);
  }

  if (v8)
  {
    xpcConnection = self->_xpcConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke;
    v21[3] = &unk_1E5D05770;
    SEL v23 = a2;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke_20;
    v19[3] = &unk_1E5D05F60;
    id v20 = v11;
    [v12 fetchContextForMessageWithRequest:v7 completion:v19];
  }
  else
  {
    v13 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationCategorizationClient collectDynamicBreakthroughFeaturesForNotification:completion:]();
    }

    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = NSStringFromSelector(a2);
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v14 raise:v15, @"No completion handler provided for %@ in %@", v16, v18 format];
  }
}

void __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __84__ATXNotificationCategorizationClient_fetchContextForMessageWithRequest_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[ATXNotificationCategorizationClient fetchContextForMessageWithRequest:completion:]_block_invoke";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: finished", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __43__ATXNotificationCategorizationClient_init__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXNotificationCategorizationClient init]_block_invoke";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: Interruption handler called", (uint8_t *)&v1, 0xCu);
}

void __43__ATXNotificationCategorizationClient_init__block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[ATXNotificationCategorizationClient init]_block_invoke";
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "%s: Invalidation handler called", (uint8_t *)&v1, 0xCu);
}

- (void)collectDynamicBreakthroughFeaturesForNotification:completion:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_8();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v4, v5, "No completion handler provided for %@ in %@", v6, v7, v8, v9, v10);
}

void __100__ATXNotificationCategorizationClient_collectDynamicBreakthroughFeaturesForNotification_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  v2 = (const char *)OUTLINED_FUNCTION_7(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_6();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v5, v6, "%@ in %@ xpc error:%@", v7, v8, v9, v10, v11);
}

@end