@interface ATXNotificationsLoggingClient
+ (id)sharedInstance;
- (ATXNotificationsLoggingClient)init;
- (void)_processActiveSuggestionsRequests;
- (void)activeSuggestionsWithReply:(id)a3;
- (void)dealloc;
- (void)logNotificationDeliveryUI:(unint64_t)a3 notificationUUIDs:(id)a4;
- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4;
- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5;
- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5 interactionUI:(unint64_t)a6;
- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4;
- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4 timestamp:(id)a5;
- (void)logSuggestionEvent:(int64_t)a3 suggestionType:(int64_t)a4 suggestionIdentifier:(id)a5 timestamp:(id)a6;
@end

@implementation ATXNotificationsLoggingClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __47__ATXNotificationsLoggingClient_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXNotificationsLoggingClient;
  [(ATXNotificationsLoggingClient *)&v3 dealloc];
}

- (ATXNotificationsLoggingClient)init
{
  v23.receiver = self;
  v23.super_class = (Class)ATXNotificationsLoggingClient;
  v2 = [(ATXNotificationsLoggingClient *)&v23 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    activeSuggestionsRequests = v2->_activeSuggestionsRequests;
    v2->_activeSuggestionsRequests = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ATXNotificationsLoggingClient.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    objc_initWeak(&location, v2);
    id v8 = objc_alloc(MEMORY[0x263F61E98]);
    v9 = v2->_queue;
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __37__ATXNotificationsLoggingClient_init__block_invoke;
    v20 = &unk_264E3B8D8;
    objc_copyWeak(&v21, &location);
    uint64_t v10 = [v8 initWithQueue:v9 operation:&v17];
    coalescingTimer = v2->_coalescingTimer;
    v2->_coalescingTimer = (_PASSimpleCoalescingTimer *)v10;

    id v12 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v13 = objc_msgSend(v12, "initWithMachServiceName:options:", @"com.apple.notifications.logging", 0, v17, v18, v19, v20);
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v13;

    v15 = ATXNotificationsLoggingInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v15];
    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_62_0];
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:&__block_literal_global_65_0];
    [(NSXPCConnection *)v2->_xpcConnection resume];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__ATXNotificationsLoggingClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processActiveSuggestionsRequests];
}

void __37__ATXNotificationsLoggingClient_init__block_invoke_2()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __37__ATXNotificationsLoggingClient_init__block_invoke_2_cold_1();
  }
}

void __37__ATXNotificationsLoggingClient_init__block_invoke_63()
{
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23C26F000, v0, OS_LOG_TYPE_INFO, "ATXNotificationsLoggingClient invalidation handler called", v1, 2u);
  }
}

- (void)_processActiveSuggestionsRequests
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke;
  v12[3] = &unk_264E3B928;
  v12[4] = self;
  uint64_t v3 = (void *)MEMORY[0x23ECDF320](v12, a2);
  xpcConnection = self->_xpcConnection;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_69;
  uint64_t v10 = &unk_264E3B950;
  id v11 = v3;
  id v5 = v3;
  dispatch_queue_t v6 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&v7];
  objc_msgSend(v6, "activeSuggestionsWithReply:", v5, v7, v8, v9, v10);
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2;
  v12[3] = &unk_264E3B900;
  v12[4] = v8;
  id v10 = v5;
  id v13 = v10;
  id v11 = v6;
  id v14 = v11;
  [v9 enumerateObjectsUsingBlock:v12];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];

  objc_sync_exit(v7);
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1[4] + 24) count] - 1 == a3)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, a1[5], a1[6]);
  }
  else
  {
    id v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2_cold_1();
    }

    id v7 = [MEMORY[0x263F087E8] errorWithDomain:ATXNotificationsLoggingClientErrorDomain code:1 userInfo:0];
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v7);
  }
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_69_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activeSuggestionsWithReply:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_notification_management();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_23C26F000, v6, OS_LOG_TYPE_DEFAULT, "activeSuggestionsWithReply: queued request", v10, 2u);
    }

    id v7 = self;
    objc_sync_enter(v7);
    activeSuggestionsRequests = v7->_activeSuggestionsRequests;
    v9 = (void *)MEMORY[0x23ECDF320](v4);
    [(NSMutableArray *)activeSuggestionsRequests addObject:v9];

    objc_sync_exit(v7);
    [(_PASSimpleCoalescingTimer *)v7->_coalescingTimer runAfterDelaySeconds:1 coalescingBehavior:0.5];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationsLoggingClient activeSuggestionsWithReply:]();
    }
  }
}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5 interactionUI:(unint64_t)a6
{
  id v10 = a4;
  id v11 = [v10 uuid];

  if (v11)
  {
    id v12 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_72];
    [v12 logNotificationEvent:a3 notification:v10 reason:a5 interactionUI:a6];
  }
  else
  {
    id v13 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:]();
    }
  }
}

void __88__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason_interactionUI___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __88__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason_interactionUI___block_invoke_cold_1();
  }
}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4
{
  id v6 = a4;
  id v7 = [v6 uuid];

  if (v7)
  {
    uint64_t v8 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_74_0];
    [v8 logNotificationEvent:a3 notification:v6 reason:0 interactionUI:5];
  }
  else
  {
    v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:]();
    }
  }
}

void __67__ATXNotificationsLoggingClient_logNotificationEvent_notification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__ATXNotificationsLoggingClient_logNotificationEvent_notification___block_invoke_cold_1();
  }
}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5
{
  id v8 = a4;
  v9 = [v8 uuid];

  if (v9)
  {
    id v10 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_76];
    [v10 logNotificationEvent:a3 notification:v8 reason:a5 interactionUI:5];
  }
  else
  {
    id v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXNotificationsLoggingClient logNotificationEvent:notification:reason:interactionUI:]();
    }
  }
}

void __74__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __74__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason___block_invoke_cold_1();
  }
}

- (void)logSuggestionEvent:(int64_t)a3 suggestionType:(int64_t)a4 suggestionIdentifier:(id)a5 timestamp:(id)a6
{
  xpcConnection = self->_xpcConnection;
  id v10 = a6;
  id v11 = a5;
  id v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_78];
  [v12 logSuggestionEvent:a3 suggestionType:a4 suggestionIdentifier:v11 timestamp:v10];
}

void __98__ATXNotificationsLoggingClient_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __98__ATXNotificationsLoggingClient_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp___block_invoke_cold_1();
  }
}

- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4 timestamp:(id)a5
{
  xpcConnection = self->_xpcConnection;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_80_0];
  [v10 logNotificationGroupEvent:a3 eventIdentifier:v9 timestamp:v8];
}

void __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke_cold_1();
  }
}

- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4
{
  xpcConnection = self->_xpcConnection;
  id v6 = a4;
  id v8 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_82];
  id v7 = [MEMORY[0x263EFF910] now];
  [v8 logNotificationGroupEvent:a3 eventIdentifier:v6 timestamp:v7];
}

void __75__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke_cold_1();
  }
}

- (void)logNotificationDeliveryUI:(unint64_t)a3 notificationUUIDs:(id)a4
{
  id v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXNotificationsLoggingClient logNotificationDeliveryUI:notificationUUIDs:]((uint64_t)v6, v8);
    }
  }
  else
  {
    id v7 = [(NSXPCConnection *)self->_xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_85];
    [v7 logNotificationDeliveryUI:a3 notificationUUIDs:v6];
  }
}

void __77__ATXNotificationsLoggingClient_logNotificationDeliveryUI_notificationUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__ATXNotificationsLoggingClient_logNotificationDeliveryUI_notificationUUIDs___block_invoke_cold_1();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_activeSuggestionsRequests, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __37__ATXNotificationsLoggingClient_init__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_23C26F000, v0, v1, "ATXNotificationsLoggingClient interruption handler called", v2, v3, v4, v5, v6);
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_23C26F000, v0, v1, "activeSuggestionsWithReply: throttling request from client side", v2, v3, v4, v5, v6);
}

void __66__ATXNotificationsLoggingClient__processActiveSuggestionsRequests__block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "activeSuggestionsWithReply: XPC error: %@", v2, v3, v4, v5, v6);
}

- (void)activeSuggestionsWithReply:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_23C26F000, v0, v1, "activeSuggestionsWithReply: called with no callback", v2, v3, v4, v5, v6);
}

- (void)logNotificationEvent:notification:reason:interactionUI:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_23C26F000, v0, v1, "Nullability violation: notification.uuid is nil", v2, v3, v4, v5, v6);
}

void __88__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason_interactionUI___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "logNotificationEvent:notification:reason:interactionUI XPC error: %@", v2, v3, v4, v5, v6);
}

void __67__ATXNotificationsLoggingClient_logNotificationEvent_notification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "logNotificationEvent:notification XPC error: %@", v2, v3, v4, v5, v6);
}

void __74__ATXNotificationsLoggingClient_logNotificationEvent_notification_reason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "logNotificationEvent:notification:reason XPC error: %@", v2, v3, v4, v5, v6);
}

void __98__ATXNotificationsLoggingClient_logSuggestionEvent_suggestionType_suggestionIdentifier_timestamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "logSuggestionEvent:suggestionType:suggestionType:timestamp XPC error: %@", v2, v3, v4, v5, v6);
}

void __85__ATXNotificationsLoggingClient_logNotificationGroupEvent_eventIdentifier_timestamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "logNotificationGroupEvent:eventIdentifier:timestamp XPC error: %@", v2, v3, v4, v5, v6);
}

- (void)logNotificationDeliveryUI:(uint64_t)a1 notificationUUIDs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_23C26F000, a2, OS_LOG_TYPE_FAULT, "-logNotificationDeliveryUI:notificationUUIDs: was passed an object that is not an array: %{public}@", v5, 0xCu);
}

void __77__ATXNotificationsLoggingClient_logNotificationDeliveryUI_notificationUUIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C26F000, v0, v1, "-logNotificationDeliveryUI:notificationUUIDs: XPC error: %@", v2, v3, v4, v5, v6);
}

@end