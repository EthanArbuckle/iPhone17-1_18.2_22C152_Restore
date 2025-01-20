@interface ATXNotificationDigestRankerServer
+ (id)sharedInstance;
- (ATXNotificationDigestRankerServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(unint64_t)a3 reply:(id)a4;
- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6;
- (void)generateDigestForNotificationStacks:(id)a3 reply:(id)a4;
- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3;
@end

@implementation ATXNotificationDigestRankerServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_9 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_9, &__block_literal_global_74);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_11;
  return v2;
}

void __51__ATXNotificationDigestRankerServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_11;
  sharedInstance__pasExprOnceResult_11 = v1;
}

- (ATXNotificationDigestRankerServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXNotificationDigestRankerServer;
  v2 = [(ATXNotificationDigestRankerServer *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F4B558]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F4B558];
  objc_super v7 = [v5 valueForEntitlement:*MEMORY[0x1E4F4B558]];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2842700];
    v17 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v19 = [v17 setWithArray:v18];
    [v16 setClasses:v19 forSelector:sel_generateDigestForNotificationStacks_reply_ argumentIndex:0 ofReply:0];

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v37 = objc_opt_class();
    BOOL v21 = 1;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    v23 = [v20 setWithArray:v22];
    [v16 setClasses:v23 forSelector:sel_generateDigestForNotificationStacks_reply_ argumentIndex:0 ofReply:1];

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    v26 = [v24 setWithArray:v25];
    [v16 setClasses:v26 forSelector:sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_ argumentIndex:0 ofReply:0];

    v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v35 = objc_opt_class();
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    v29 = [v27 setWithArray:v28];
    [v16 setClasses:v29 forSelector:sel_generateDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_reply_ argumentIndex:0 ofReply:1];

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v32 = [v30 setWithArray:v31];
    [v16 setClasses:v32 forSelector:sel_appsSortedByNotificationsReceivedInPreviousNumDays_reply_ argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v16];
    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_77_0];
    [v5 setInvalidationHandler:&__block_literal_global_80];
    [v5 resume];
  }
  else
  {
    v16 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v6, v16);
    }
    BOOL v21 = 0;
  }

  return v21;
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_78()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_78_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)generateDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 reply:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (void (**)(id, void *, id))a6;
  if (v11)
  {
    uint64_t v12 = objc_opt_new();
    id v24 = 0;
    uint64_t v13 = [v12 createDigestForAppGroupedNotificationStacks:v10 maxGlobalMarqueeGroups:a4 maxAppMarqueeGroups:a5 outError:&v24];
    id v14 = v24;

    uint64_t v15 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      v18 = [v13 uuid];
      v19 = [v18 UUIDString];
      *(_DWORD *)buf = 138412802;
      v26 = v17;
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "[%@] Returning digest with UUID %@ and err %@", buf, 0x20u);
    }
    v11[2](v11, v13, v14);
  }
  else
  {
    v20 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    BOOL v21 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v22 = *MEMORY[0x1E4F1C3B8];
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = NSStringFromSelector(a2);
    [v21 raise:v22, @"[%@] No reply handler provided for %@", v14, v13 format];
  }
}

- (void)generateDigestForNotificationStacks:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    v8 = objc_opt_new();
    id v20 = 0;
    uint64_t v9 = [v8 createDigestForNotificationStacks:v6 outError:&v20];
    id v10 = v20;

    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      id v14 = [v9 uuid];
      uint64_t v15 = [v14 UUIDString];
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      id v26 = v10;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "[%@] Returning digest with UUID %@ and err %@", buf, 0x20u);
    }
    v7[2](v7, v9, v10);
  }
  else
  {
    v16 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = NSStringFromSelector(a2);
    [v17 raise:v18, @"[%@] No reply handler provided for %@", v10, v9 format];
  }
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:(unint64_t)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, uint64_t, uint64_t, void))a4;
  uint64_t v7 = __atxlog_handle_notification_management();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ATXNotificationDigestRankerServer appsSortedByNotificationsReceivedInPreviousNumDays:reply:]();
    }

    uint64_t v9 = objc_opt_new();
    id v10 = [v9 appsSortedByNumOfNotificationsGivenNumOfDays:a3];
    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "[%@] Returning apps sorted by number of notifications", buf, 0xCu);
    }
    v6[2](v6, v10, [v9 containsMessageAndTimeSensitiveData], objc_msgSend(v9, "numDaysOfData"), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:]();
    }

    id v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v16);
    id v10 = NSStringFromSelector(a2);
    [v14 raise:v15, @"[%@] No reply handler provided for %@", v9, v10 format];
  }
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_opt_new();
  [v4 numberOfActiveNotificationsWithCompletionHandler:v3];
}

- (void).cxx_destruct
{
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Rejecting connection %@ without entitlement %@", (uint8_t *)&v3, 0x16u);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__ATXNotificationDigestRankerServer_listener_shouldAcceptNewConnection___block_invoke_78_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)generateDigestForAppGroupedNotificationStacks:maxGlobalMarqueeGroups:maxAppMarqueeGroups:reply:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  int v3 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v4, v5, "[%@] No reply handler provided for %@", v6, v7, v8, v9, v10);
}

- (void)appsSortedByNotificationsReceivedInPreviousNumDays:reply:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = (id)objc_opt_class();
  int v3 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_6();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "[%@ %@] Fetching sorted apps", v4, 0x16u);
}

@end