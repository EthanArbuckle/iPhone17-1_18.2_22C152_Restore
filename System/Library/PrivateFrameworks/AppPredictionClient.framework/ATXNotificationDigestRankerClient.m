@interface ATXNotificationDigestRankerClient
- (ATXNotificationDigestRankerClient)init;
- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(unint64_t)a3 reply:(id)a4;
- (void)dealloc;
- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6;
- (void)generateDigestForNotificationStacks:(id)a3 reply:(id)a4;
- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3;
@end

@implementation ATXNotificationDigestRankerClient

- (ATXNotificationDigestRankerClient)init
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)ATXNotificationDigestRankerClient;
  v2 = [(ATXNotificationDigestRankerClient *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.NotificationDigest.xpc" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE1E3A0];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v8 = [v6 setWithArray:v7];
    [v5 setClasses:v8 forSelector:sel_generateDigestForNotificationStacks_reply_ argumentIndex:0 ofReply:0];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    v11 = [v9 setWithArray:v10];
    [v5 setClasses:v11 forSelector:sel_generateDigestForNotificationStacks_reply_ argumentIndex:0 ofReply:1];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v14 = [v12 setWithArray:v13];
    [v5 setClasses:v14 forSelector:sel_appsSortedByNotificationsReceivedInPreviousNumDays_reply_ argumentIndex:0 ofReply:1];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v17 = [v15 setWithArray:v16];
    [v5 setClasses:v17 forSelector:sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_ argumentIndex:0 ofReply:0];

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v20 = [v18 setWithArray:v19];
    [v5 setClasses:v20 forSelector:sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_75];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_72];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __41__ATXNotificationDigestRankerClient_init__block_invoke()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __41__ATXNotificationDigestRankerClient_init__block_invoke_cold_1(v0);
  }
}

void __41__ATXNotificationDigestRankerClient_init__block_invoke_70()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A790D000, v0, OS_LOG_TYPE_INFO, "[ATXNotificationDigestRankerClient] Invalidation Handler Called", v1, 2u);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXNotificationDigestRankerClient;
  [(ATXNotificationDigestRankerClient *)&v3 dealloc];
}

- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v12 = (void (**)(id, void, void *))a6;
  if (!v12)
  {
    v16 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = NSStringFromSelector(a2);
    [v17 raise:v18, @"[%@] No reply handler provided for %@", v20, v21 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.proactive.NotificationDigest.xpc" logHandle:0] & 1) == 0)
  {
    objc_super v22 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v24 = *MEMORY[0x1E4F285A8];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Missing entitlement for digest generation.  Not calling XPC service.";
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v20 = (void *)[v23 initWithDomain:v24 code:1 userInfo:v25];

    v12[2](v12, 0, v20);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke;
  v26[3] = &unk_1E5D05770;
  v26[4] = self;
  SEL v28 = a2;
  v14 = v12;
  id v27 = v14;
  v15 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v26];
  [v15 generateDigestForAppGroupedNotificationStacks:v11 maxGlobalMarqueeGroups:a4 maxAppMarqueeGroups:a5 reply:v14];

LABEL_11:
}

void __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateDigestForNotificationStacks:(id)a3 reply:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a4;
  if (!v8)
  {
    v12 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromSelector(a2);
    [v13 raise:v14, @"[%@] No reply handler provided for %@", v16, v17 format];

    goto LABEL_10;
  }
  if (([MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.proactive.NotificationDigest.xpc" logHandle:0] & 1) == 0)
  {
    uint64_t v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F285A8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @"Missing entitlement for digest generation.  Not calling XPC service.";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v16 = (void *)[v19 initWithDomain:v20 code:1 userInfo:v21];

    v8[2](v8, 0, v16);
LABEL_10:

    goto LABEL_11;
  }
  xpcConnection = self->_xpcConnection;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __79__ATXNotificationDigestRankerClient_generateDigestForNotificationStacks_reply___block_invoke;
  v22[3] = &unk_1E5D05770;
  v22[4] = self;
  SEL v24 = a2;
  v10 = v8;
  id v23 = v10;
  id v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v22];
  [v11 generateDigestForNotificationStacks:v7 reply:v10];

LABEL_11:
}

void __79__ATXNotificationDigestRankerClient_generateDigestForNotificationStacks_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(unint64_t)a3 reply:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (!v7)
  {
    uint64_t v14 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3B8];
    v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    id v19 = NSStringFromSelector(a2);
    [v15 raise:v16, @"[%@] No reply handler provided for %@", v18, v19 format];

    goto LABEL_12;
  }
  char v8 = [MEMORY[0x1E4F93B28] hasTrueBooleanEntitlement:@"com.apple.proactive.NotificationDigest.xpc" logHandle:0];
  v9 = __atxlog_handle_notification_management();
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerClient generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F285A8];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29[0] = @"Missing entitlement for apps sorted by notifications.  Not calling XPC service.";
    objc_super v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v18 = (void *)[v20 initWithDomain:v21 code:1 userInfo:v22];

    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v18);
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ATXNotificationDigestRankerClient appsSortedByNotificationsReceivedInPreviousNumDays:reply:]();
  }

  xpcConnection = self->_xpcConnection;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke;
  v25[3] = &unk_1E5D05770;
  v25[4] = self;
  SEL v27 = a2;
  id v12 = v7;
  id v26 = v12;
  v13 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke_89;
  v23[3] = &unk_1E5D09778;
  id v24 = v12;
  [v13 appsSortedByNotificationsReceivedInPreviousNumDays:a3 reply:v23];

LABEL_13:
}

void __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __94__ATXNotificationDigestRankerClient_appsSortedByNotificationsReceivedInPreviousNumDays_reply___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__ATXNotificationDigestRankerClient_numberOfActiveNotificationsWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5D05770;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v7 = v5;
  char v8 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v9];
  [v8 numberOfActiveNotificationsWithCompletionHandler:v7];
}

void __86__ATXNotificationDigestRankerClient_numberOfActiveNotificationsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

void __41__ATXNotificationDigestRankerClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "[ATXNotificationDigestRankerClient] Interruption Handler Called", v1, 2u);
}

- (void)generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  v1 = (objc_class *)objc_opt_class();
  v2 = NSStringFromClass(v1);
  id v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_2(&dword_1A790D000, v4, v5, "[%@] No reply handler provided for %@", v6, v7, v8, v9, v10);
}

- (void)generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1A790D000, v0, v1, "Not attempting XPC service call on connection %@ without entitlement %@", v2, v3, v4, v5, v6);
}

void __132__ATXNotificationDigestRankerClient_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (objc_class *)OUTLINED_FUNCTION_7_2();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_9_1();
  uint64_t v3 = NSStringFromSelector(v2);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v4, v5, "[%@] Error in %@: %@", v6, v7, v8, v9, v10);
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:reply:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = (id)objc_opt_class();
  uint64_t v3 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_4();
  _os_log_debug_impl(&dword_1A790D000, v0, OS_LOG_TYPE_DEBUG, "[%@ %@] Fetching sorted apps", v4, 0x16u);
}

@end