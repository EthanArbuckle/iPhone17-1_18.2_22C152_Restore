@interface ATXLockScreenNotificationRankerServer
+ (id)sharedInstance;
- (ATXLockScreenNotificationRankerServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 reply:(id)a6;
- (void)rankNotificationArrays:(id)a3 reply:(id)a4;
@end

@implementation ATXLockScreenNotificationRankerServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_44 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_44, &__block_literal_global_255);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_59;
  return v2;
}

void __55__ATXLockScreenNotificationRankerServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_59;
  sharedInstance__pasExprOnceResult_59 = v1;
}

- (ATXLockScreenNotificationRankerServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXLockScreenNotificationRankerServer;
  v2 = [(ATXLockScreenNotificationRankerServer *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x1E4F4B550]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F4B550];
  v9 = [v7 valueForEntitlement:*MEMORY[0x1E4F4B550]];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && ([v9 BOOLValue] & 1) != 0)
  {
    v10 = ATXLockScreenNotificationRankerXPCInterface();
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:self];
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke;
    v19[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v20, &location);
    [v7 setInterruptionHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_14;
    v17[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v18, &location);
    [v7 setInvalidationHandler:v17];
    [v7 resume];
    v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = objc_loadWeakRetained(&location);
      v13 = objc_opt_class();
      [(ATXLockScreenNotificationRankerServer *)v13 listener:v11 shouldAcceptNewConnection:v12];
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    BOOL v14 = 1;
  }
  else
  {
    v15 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationDigestRankerServer listener:shouldAcceptNewConnection:]((uint64_t)v7, v8, v15);
    }

    BOOL v14 = 0;
  }

  return v14;
}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(a1);
  }
}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_14(uint64_t a1)
{
  v2 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_14_cold_1(a1);
  }
}

- (void)rankNotificationArrays:(id)a3 reply:(id)a4
{
  id v7 = (void (**)(id, void *, id))a4;
  if (v7)
  {
    id v14 = 0;
    uint64_t v8 = +[ATXLockScreenNotificationRanker rankNotificationArrays:a3 error:&v14];
    id v9 = v14;
    v7[2](v7, v8, v9);
  }
  else
  {
    v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXLockScreenNotificationRankerServer rankNotificationArrays:reply:]((uint64_t)self, a2);
    }

    v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3B8];
    uint64_t v13 = objc_opt_class();
    NSStringFromSelector(a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [v11 raise:v12, @"[%@] No reply handler provided for %@", v13, v9 format];
  }
}

- (void)rankNewNotificationIntoNotificationArrays:(id)a3 newNotification:(id)a4 notificationArrayIndex:(unint64_t)a5 reply:(id)a6
{
  v11 = (void (**)(id, uint64_t, uint64_t, void *))a6;
  if (v11)
  {
    id v23 = 0;
    uint64_t v12 = +[ATXLockScreenNotificationRanker rankNewNotificationIntoNotificationArrays:a3 newNotification:a4 notificationArrayIndex:a5 error:&v23];
    id v13 = v23;
    id v14 = v13;
    if (v12)
    {
      v15 = [v12 first];
      uint64_t v16 = [v15 unsignedIntegerValue];
      v17 = [v12 second];
      v11[2](v11, v16, [v17 unsignedIntegerValue], v14);
    }
    else
    {
      if (!v13)
      {
        v22 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          -[ATXLockScreenNotificationRankerServer rankNewNotificationIntoNotificationArrays:newNotification:notificationArrayIndex:reply:]((uint64_t)self, v22);
        }
      }
      v11[2](v11, 0, 0, v14);
    }
  }
  else
  {
    id v18 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXLockScreenNotificationRankerServer rankNotificationArrays:reply:]((uint64_t)self, a2);
    }

    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    uint64_t v21 = objc_opt_class();
    id v14 = NSStringFromSelector(a2);
    [v19 raise:v20, @"[%@] No reply handler provided for %@", v21, v14 format];
  }
}

- (void).cxx_destruct
{
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:(void *)a4 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  id v7 = a1;
  _os_log_debug_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_DEBUG, "[%@] Connection established", (uint8_t *)a2, 0xCu);
}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v3, v4, "[%@] Connection interrupted", v5, v6, v7, v8, 2u);
}

void __76__ATXLockScreenNotificationRankerServer_listener_shouldAcceptNewConnection___block_invoke_14_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_6(&dword_1D0FA3000, v3, v4, "[%@] Connection invalidated", v5, v6, v7, v8, 2u);
}

- (void)rankNotificationArrays:(uint64_t)a1 reply:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  id v3 = (id)objc_opt_class();
  uint64_t v4 = NSStringFromSelector(a2);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_1_3(&dword_1D0FA3000, v5, v6, "[%@] No reply handler provided for %@", v7, v8, v9, v10, v11);
}

- (void)rankNewNotificationIntoNotificationArrays:(uint64_t)a1 newNotification:(NSObject *)a2 notificationArrayIndex:reply:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "[%@] Programming error. Both result and error are nil.", (uint8_t *)&v4, 0xCu);
}

@end