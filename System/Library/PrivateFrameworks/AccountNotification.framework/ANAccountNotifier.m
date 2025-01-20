@interface ANAccountNotifier
- (ANAccountNotifier)init;
- (ANAccountNotifier)initWithCallbackMachService:(id)a3;
- (ANAccountNotifierDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_createDaemonConnection;
- (id)_daemonConnection;
- (void)_daemonConnectionWasInterrupted;
- (void)_daemonConnectionWasInvalidated;
- (void)_disconnectFromDaemon;
- (void)_startNotificationCallbackListenerWithMachServiceName:(id)a3;
- (void)_stopNotificationCallbackListener;
- (void)addNotification:(id)a3;
- (void)dealloc;
- (void)notificationWasActivated:(id)a3;
- (void)notificationWasCleared:(id)a3;
- (void)notificationWasDismissed:(id)a3;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)removeNotificationsWithEventIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ANAccountNotifier

- (ANAccountNotifier)init
{
  return [(ANAccountNotifier *)self initWithCallbackMachService:0];
}

- (ANAccountNotifier)initWithCallbackMachService:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ANAccountNotifier;
  v5 = [(ANAccountNotifier *)&v10 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 copy];
    callbackMachService = v6->_callbackMachService;
    v6->_callbackMachService = (NSString *)v7;

    [(ANAccountNotifier *)v6 _startNotificationCallbackListenerWithMachServiceName:v4];
  }

  return v6;
}

- (void)dealloc
{
  [(ANAccountNotifier *)self _stopNotificationCallbackListener];
  [(ANAccountNotifier *)self _disconnectFromDaemon];
  v3.receiver = self;
  v3.super_class = (Class)ANAccountNotifier;
  [(ANAccountNotifier *)&v3 dealloc];
}

- (void)addNotification:(id)a3
{
  id v4 = a3;
  v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ANAccountNotifier addNotification:]();
  }

  if (self->_callbackMachService)
  {
    v6 = _ANLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ANAccountNotifier addNotification:]();
    }

    [v4 setCallbackMachService:self->_callbackMachService];
  }
  uint64_t v7 = [(ANAccountNotifier *)self _daemonConnection];
  v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__ANAccountNotifier_addNotification___block_invoke_3;
  v10[3] = &unk_2645BB108;
  id v11 = v4;
  id v9 = v4;
  [v8 addNotification:v9 withCompletion:v10];
}

void __37__ANAccountNotifier_addNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = _ANLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __37__ANAccountNotifier_addNotification___block_invoke_cold_1();
    }
  }
}

void __37__ANAccountNotifier_addNotification___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ANLogSystem();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      v8 = "-[ANAccountNotifier addNotification:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 79;
      _os_log_impl(&dword_221622000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification added successfully!\"", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __37__ANAccountNotifier_addNotification___block_invoke_3_cold_1();
  }
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ANAccountNotifier removeNotificationWithIdentifier:]();
  }

  v6 = [(ANAccountNotifier *)self _daemonConnection];
  int v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_7;
  v9[3] = &unk_2645BB108;
  id v10 = v4;
  id v8 = v4;
  [v7 removeNotificationWithID:v8 completion:v9];
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = _ANLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_cold_1();
    }
  }
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ANLogSystem();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[ANAccountNotifier removeNotificationWithIdentifier:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 98;
      _os_log_impl(&dword_221622000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification removed successfully!\"", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_7_cold_1();
  }
}

- (void)removeNotificationsWithEventIdentifier:(id)a3
{
  id v4 = a3;
  v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ANAccountNotifier removeNotificationsWithEventIdentifier:]();
  }

  v6 = [(ANAccountNotifier *)self _daemonConnection];
  int v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_9];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_10;
  v9[3] = &unk_2645BB108;
  id v10 = v4;
  id v8 = v4;
  [v7 removeNotificationsWithEventID:v8 completion:v9];
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = _ANLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_cold_1();
    }
  }
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_10(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _ANLogSystem();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[ANAccountNotifier removeNotificationsWithEventIdentifier:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 117;
      _os_log_impl(&dword_221622000, v6, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notifications removed successfully!\"", (uint8_t *)&v7, 0x12u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_10_cold_1();
  }
}

- (id)_daemonConnection
{
  daemonConnection = self->_daemonConnection;
  if (!daemonConnection)
  {
    id v4 = [(ANAccountNotifier *)self _createDaemonConnection];
    v5 = self->_daemonConnection;
    self->_daemonConnection = v4;

    daemonConnection = self->_daemonConnection;
  }
  return daemonConnection;
}

- (id)_createDaemonConnection
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = _ANLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[ANAccountNotifier _createDaemonConnection]";
    __int16 v16 = 1024;
    int v17 = 137;
    _os_log_impl(&dword_221622000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Starting new connection...\"", buf, 0x12u);
  }

  id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.and.xpc" options:0];
  v5 = +[ANDaemonInterface XPCInterface];
  [v4 setRemoteObjectInterface:v5];

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__ANAccountNotifier__createDaemonConnection__block_invoke;
  v12[3] = &unk_2645BB130;
  objc_copyWeak(&v13, (id *)buf);
  [v4 setInvalidationHandler:v12];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  __int16 v9 = __44__ANAccountNotifier__createDaemonConnection__block_invoke_2;
  int v10 = &unk_2645BB130;
  objc_copyWeak(&v11, (id *)buf);
  [v4 setInterruptionHandler:&v7];
  objc_msgSend(v4, "resume", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  return v4;
}

void __44__ANAccountNotifier__createDaemonConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _daemonConnectionWasInvalidated];
    id WeakRetained = v2;
  }
}

void __44__ANAccountNotifier__createDaemonConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _daemonConnectionWasInterrupted];
    id WeakRetained = v2;
  }
}

- (void)_disconnectFromDaemon
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_221622000, v0, v1, "%s (%d) \"called\"", v2, v3, v4, v5, 2u);
}

- (void)_daemonConnectionWasInterrupted
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_221622000, v0, v1, "%s (%d) \"Interrupted!\"", v2, v3, v4, v5, 2u);
}

- (void)_daemonConnectionWasInvalidated
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ANLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    v6 = "-[ANAccountNotifier _daemonConnectionWasInvalidated]";
    __int16 v7 = 1024;
    int v8 = 179;
    _os_log_impl(&dword_221622000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v5, 0x12u);
  }

  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = 0;
}

- (void)_startNotificationCallbackListenerWithMachServiceName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  bulletinResponseListener = self->_bulletinResponseListener;
  v6 = _ANLogSystem();
  __int16 v7 = v6;
  if (bulletinResponseListener)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      id v11 = "-[ANAccountNotifier _startNotificationCallbackListenerWithMachServiceName:]";
      __int16 v12 = 1024;
      int v13 = 190;
      _os_log_impl(&dword_221622000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Notification response listener is already running!\"", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ANAccountNotifier _startNotificationCallbackListenerWithMachServiceName:]();
    }

    int v8 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v4];
    uint64_t v9 = self->_bulletinResponseListener;
    self->_bulletinResponseListener = v8;

    [(NSXPCListener *)self->_bulletinResponseListener setDelegate:self];
    [(NSXPCListener *)self->_bulletinResponseListener resume];
  }
}

- (void)_stopNotificationCallbackListener
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_221622000, v0, v1, "%s (%d) \"called\"", v2, v3, v4, v5, 2u);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.and.manager"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = _ANLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ANAccountNotifier listener:shouldAcceptNewConnection:]();
    }
    goto LABEL_10;
  }
  if (([v6 BOOLValue] & 1) == 0)
  {
    int v8 = _ANLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ANAccountNotifier listener:shouldAcceptNewConnection:]();
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  __int16 v7 = +[ANClientCallbackInterface XPCInterface];
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  [v5 resume];
  int v8 = _ANLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[ANAccountNotifier listener:shouldAcceptNewConnection:]";
    __int16 v13 = 1024;
    int v14 = 227;
    _os_log_impl(&dword_221622000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Accepted new connection.\"", (uint8_t *)&v11, 0x12u);
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)notificationWasActivated:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[ANAccountNotifier notificationWasActivated:]";
    __int16 v11 = 1024;
    int v12 = 234;
    _os_log_impl(&dword_221622000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v9, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 accountNotifier:self didActivateNotification:v4];
  }
}

- (void)notificationWasDismissed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[ANAccountNotifier notificationWasDismissed:]";
    __int16 v11 = 1024;
    int v12 = 243;
    _os_log_impl(&dword_221622000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v9, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 accountNotifier:self didDismissNotification:v4];
  }
}

- (void)notificationWasCleared:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ANLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[ANAccountNotifier notificationWasCleared:]";
    __int16 v11 = 1024;
    int v12 = 252;
    _os_log_impl(&dword_221622000, v5, OS_LOG_TYPE_DEFAULT, "%s (%d) \"called\"", (uint8_t *)&v9, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 accountNotifier:self didClearNotification:v4];
  }
}

- (ANAccountNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ANAccountNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_callbackMachService, 0);
  objc_storeStrong((id *)&self->_bulletinResponseListener, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

- (void)addNotification:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_221622000, v0, v1, "%s (%d) \"Setting callback Mach service for notification to %@\"", v2, v3, v4, v5, 2u);
}

- (void)addNotification:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_221622000, v0, v1, "%s (%d) \"%@\"", v2, v3, v4, v5, 2u);
}

void __37__ANAccountNotifier_addNotification___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_221622000, v0, v1, "%s (%d) \"XPC error while calling addNotification! %@\"", v2, v3, v4, v5, 2u);
}

void __37__ANAccountNotifier_addNotification___block_invoke_3_cold_1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_221622000, v0, v1, "%s (%d) \"Failed to add notification %@! Error: %@\"", v2);
}

- (void)removeNotificationWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_221622000, v0, v1, "%s (%d) \"%@\"", v2, v3, v4, v5, 2u);
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_221622000, v0, v1, "%s (%d) \"XPC error while calling removeNotificationWithID! %@\"", v2, v3, v4, v5, 2u);
}

void __54__ANAccountNotifier_removeNotificationWithIdentifier___block_invoke_7_cold_1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_221622000, v0, v1, "%s (%d) \"Failed to remove notification %@! Error: %@\"", v2);
}

- (void)removeNotificationsWithEventIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_221622000, v0, v1, "%s (%d) \"%@\"", v2, v3, v4, v5, 2u);
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_221622000, v0, v1, "%s (%d) \"XPC error while calling removeNotificationsWithEventID! %@\"", v2, v3, v4, v5, 2u);
}

void __60__ANAccountNotifier_removeNotificationsWithEventIdentifier___block_invoke_10_cold_1()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_221622000, v0, v1, "%s (%d) \"Failed to remove notifications with event ID %@! Error: %@\"", v2);
}

- (void)_startNotificationCallbackListenerWithMachServiceName:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_221622000, v0, v1, "%s (%d) \"Starting Notification response listener...\"", v2, v3, v4, v5, 2u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_221622000, v0, v1, "%s (%d) \"Rejecting connection because of bad/missing entitlement.\"", v2, v3, v4, v5, 2u);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_221622000, v0, v1, "%s (%d) \"Rejecting connection because of bad/missing entitlement.\"", v2, v3, v4, v5, 2u);
}

@end