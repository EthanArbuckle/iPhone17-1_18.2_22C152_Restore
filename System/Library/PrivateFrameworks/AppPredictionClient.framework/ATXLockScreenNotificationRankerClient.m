@interface ATXLockScreenNotificationRankerClient
- (ATXLockScreenNotificationRankerClient)init;
- (void)dealloc;
- (void)init;
- (void)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 reply:(id)a6;
- (void)rankNotificationArrays:(id)a3 reply:(id)a4;
@end

@implementation ATXLockScreenNotificationRankerClient

- (ATXLockScreenNotificationRankerClient)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)ATXLockScreenNotificationRankerClient;
  v2 = [(ATXLockScreenNotificationRankerClient *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.proactive.LockScreenNotificationRanking.xpc" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = v2->_xpcConnection;
    v6 = ATXLockScreenNotificationRankerXPCInterface();
    [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

    objc_initWeak(&location, v2);
    v7 = v2->_xpcConnection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __45__ATXLockScreenNotificationRankerClient_init__block_invoke;
    v15[3] = &unk_1E5D05748;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v7 setInterruptionHandler:v15];
    v8 = v2->_xpcConnection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__ATXLockScreenNotificationRankerClient_init__block_invoke_61;
    v13[3] = &unk_1E5D05748;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInvalidationHandler:v13];
    [(NSXPCConnection *)v2->_xpcConnection resume];
    v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = objc_loadWeakRetained(&location);
      v11 = objc_opt_class();
      [(ATXLockScreenNotificationRankerClient *)v11 init];
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__ATXLockScreenNotificationRankerClient_init__block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__ATXLockScreenNotificationRankerClient_init__block_invoke_cold_1(a1, v2);
  }
}

void __45__ATXLockScreenNotificationRankerClient_init__block_invoke_61(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138412290;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_1A790D000, v2, OS_LOG_TYPE_INFO, "[%@] Connection invalidated", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXLockScreenNotificationRankerClient;
  [(ATXLockScreenNotificationRankerClient *)&v3 dealloc];
}

- (void)rankNotificationArrays:(id)a3 reply:(id)a4
{
  id v7 = a4;
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke;
  v12[3] = &unk_1E5D05770;
  id v13 = v7;
  SEL v14 = a2;
  v12[4] = self;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 rankNotificationArrays:v10 reply:v9];
}

void __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 reply:(id)a6
{
  id v11 = a6;
  xpcConnection = self->_xpcConnection;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __128__ATXLockScreenNotificationRankerClient_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply___block_invoke;
  v17[3] = &unk_1E5D05770;
  id v18 = v11;
  SEL v19 = a2;
  v17[4] = self;
  id v13 = v11;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v17];
  [v16 rankNewNotificationIntoNotificationArrays:v15 newNotification:v14 notificationArrayIndex:a5 reply:v13];
}

void __128__ATXLockScreenNotificationRankerClient_rankNewNotificationIntoNotificationArrays_newNotification_notificationArrayIndex_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke_cold_1(a1);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v7 = a1;
  _os_log_debug_impl(&dword_1A790D000, a3, OS_LOG_TYPE_DEBUG, "[%@] Connection established", (uint8_t *)a2, 0xCu);
}

void __45__ATXLockScreenNotificationRankerClient_init__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = 138412290;
  id v6 = (id)objc_opt_class();
  id v4 = v6;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "[%@] Connection interrupted", (uint8_t *)&v5, 0xCu);
}

void __70__ATXLockScreenNotificationRankerClient_rankNotificationArrays_reply___block_invoke_cold_1(uint64_t a1)
{
  v2 = objc_opt_class();
  id v3 = *(const char **)(a1 + 48);
  id v4 = v2;
  int v5 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1A790D000, v6, v7, "[%@] Error in %@: %@", v8, v9, v10, v11, v12);
}

@end