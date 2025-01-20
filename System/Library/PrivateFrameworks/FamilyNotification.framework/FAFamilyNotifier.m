@interface FAFamilyNotifier
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FAFamilyNotificationDelegate)delegate;
- (FAFamilyNotifier)initWithIdentifier:(id)a3 machServiceName:(id)a4;
- (NSString)identifier;
- (NSString)serviceName;
- (id)_pendingNotificationsForAllClients;
- (id)_pendingNotificationsWithClientIdentifier:(id)a3;
- (id)agentConnection;
- (id)pendingNotifications;
- (void)_agentConnectionFailedToBootstrap;
- (void)_agentConnectionWasInterrupted;
- (void)_agentConnectionWasInvalidated;
- (void)deliverNotification:(id)a3;
- (void)didActivateNotification:(id)a3;
- (void)didClearNotification:(id)a3;
- (void)didDismissNotification:(id)a3;
- (void)removeAllNotifications;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FAFamilyNotifier

- (FAFamilyNotifier)initWithIdentifier:(id)a3 machServiceName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(FAFamilyNotifier *)self init];
  if (v9)
  {
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    connLock = v9->_connLock;
    v9->_connLock = v10;

    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_serviceName, a4);
    if (v9->_serviceName)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:v8];
      listener = v9->_listener;
      v9->_listener = (NSXPCListener *)v12;

      [(NSXPCListener *)v9->_listener setDelegate:v9];
      [(NSXPCListener *)v9->_listener resume];
    }
    v14 = v9;
  }

  return v9;
}

- (void)deliverNotification:(id)a3
{
  id v4 = a3;
  v5 = [(FAFamilyNotifier *)self agentConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__FAFamilyNotifier_deliverNotification___block_invoke;
  v8[3] = &unk_264597588;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 deliverNotificaton:v6];
}

void __40__FAFamilyNotifier_deliverNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[FAFamilyNotifier deliverNotification:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2211DC000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error delivering notification %@ - %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FAFamilyNotifier *)self agentConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__FAFamilyNotifier_removeNotificationWithIdentifier___block_invoke;
  v8[3] = &unk_264597588;
  id v9 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v8];

  [v7 removeNotificationWithIdentifier:v6];
}

void __53__FAFamilyNotifier_removeNotificationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[FAFamilyNotifier removeNotificationWithIdentifier:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_2211DC000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error removing notification with identifier %@ - %@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)removeAllNotifications
{
  v2 = [(FAFamilyNotifier *)self agentConnection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_0];

  [v3 removeAllNotifications];
}

void __42__FAFamilyNotifier_removeAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[FAFamilyNotifier removeAllNotifications]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_2211DC000, v3, OS_LOG_TYPE_DEFAULT, "%s: XPC error removing all notifications - %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)_pendingNotificationsWithClientIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  __int16 v6 = [(FAFamilyNotifier *)self agentConnection];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke;
  v21[3] = &unk_264597588;
  id v7 = v5;
  v22 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v21];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke_2;
  v12[3] = &unk_2645975D0;
  v14 = &v15;
  uint64_t v9 = v7;
  v13 = v9;
  [v8 pendingNotificationsWithIdentifier:v4 replyBlock:v12];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "-[FAFamilyNotifier _pendingNotificationsWithClientIdentifier:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_2211DC000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error removing all notifications - %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __62__FAFamilyNotifier__pendingNotificationsWithClientIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)pendingNotifications
{
  id v3 = [(FAFamilyNotifier *)self identifier];
  id v4 = [(FAFamilyNotifier *)self _pendingNotificationsWithClientIdentifier:v3];

  return v4;
}

- (id)_pendingNotificationsForAllClients
{
  return [(FAFamilyNotifier *)self _pendingNotificationsWithClientIdentifier:0];
}

- (id)agentConnection
{
  [(NSLock *)self->_connLock lock];
  if (!self->_conn)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.familynotification.agent" options:4096];
    conn = self->_conn;
    self->_conn = v3;

    int v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D30E528];
    __int16 v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    [v5 setClasses:v8 forSelector:sel_pendingNotificationsWithIdentifier_replyBlock_ argumentIndex:0 ofReply:1];

    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    void v21[4] = __Block_byref_object_dispose_;
    uint64_t v9 = self;
    v22 = v9;
    id v10 = self->_conn;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __35__FAFamilyNotifier_agentConnection__block_invoke;
    v20[3] = &unk_2645975F8;
    v20[4] = v21;
    [(NSXPCConnection *)v10 setInterruptionHandler:v20];
    id v11 = self->_conn;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __35__FAFamilyNotifier_agentConnection__block_invoke_2;
    v19[3] = &unk_2645975F8;
    v19[4] = v21;
    [(NSXPCConnection *)v11 setInvalidationHandler:v19];
    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:v5];
    uint64_t v12 = self->_conn;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__FAFamilyNotifier_agentConnection__block_invoke_3;
    v18[3] = &unk_264597620;
    v18[4] = v21;
    v13 = [(NSXPCConnection *)v12 remoteObjectProxyWithErrorHandler:v18];
    v14 = [(FAFamilyNotifier *)v9 identifier];
    [v13 setClientIdentifier:v14];

    uint64_t v15 = [(FAFamilyNotifier *)v9 serviceName];
    [v13 setDelegateMachServiceName:v15];

    [(NSXPCConnection *)self->_conn resume];
    _Block_object_dispose(v21, 8);
  }
  [(NSLock *)self->_connLock unlock];
  v16 = self->_conn;
  return v16;
}

uint64_t __35__FAFamilyNotifier_agentConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _agentConnectionWasInterrupted];
}

uint64_t __35__FAFamilyNotifier_agentConnection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _agentConnectionWasInvalidated];
}

void __35__FAFamilyNotifier_agentConnection__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "-[FAFamilyNotifier agentConnection]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_2211DC000, v4, OS_LOG_TYPE_DEFAULT, "%s: XPC error bootstrapping remote client interface - %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _agentConnectionFailedToBootstrap];
}

- (void)_agentConnectionWasInterrupted
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_connLock lock];
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "-[FAFamilyNotifier _agentConnectionWasInterrupted]";
    _os_log_impl(&dword_2211DC000, v3, OS_LOG_TYPE_DEFAULT, "%s: agent connection interrupted. Disposing of connection.", (uint8_t *)&v5, 0xCu);
  }

  conn = self->_conn;
  self->_conn = 0;

  [(NSLock *)self->_connLock unlock];
}

- (void)_agentConnectionWasInvalidated
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_connLock lock];
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "-[FAFamilyNotifier _agentConnectionWasInvalidated]";
    _os_log_impl(&dword_2211DC000, v3, OS_LOG_TYPE_DEFAULT, "%s: agent connection invalidated. Disposing of connection.", (uint8_t *)&v5, 0xCu);
  }

  conn = self->_conn;
  self->_conn = 0;

  [(NSLock *)self->_connLock unlock];
}

- (void)_agentConnectionFailedToBootstrap
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_connLock lock];
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    __int16 v6 = "-[FAFamilyNotifier _agentConnectionFailedToBootstrap]";
    _os_log_impl(&dword_2211DC000, v3, OS_LOG_TYPE_DEFAULT, "%s: agent connection failed to bootstrap. Disposing of connection.", (uint8_t *)&v5, 0xCu);
  }

  conn = self->_conn;
  self->_conn = 0;

  [(NSLock *)self->_connLock unlock];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  int v5 = (void *)MEMORY[0x263F08D80];
  id v6 = a4;
  uint64_t v7 = [v5 interfaceWithProtocol:&unk_26D30D698];
  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)didActivateNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(FAFamilyNotifier *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(FAFamilyNotifier *)self delegate];
    [v6 didActivateFamilyNotification:v7];
  }
}

- (void)didDismissNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(FAFamilyNotifier *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(FAFamilyNotifier *)self delegate];
    [v6 didDismissFamilyNotification:v7];
  }
}

- (void)didClearNotification:(id)a3
{
  id v7 = a3;
  id v4 = [(FAFamilyNotifier *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(FAFamilyNotifier *)self delegate];
    [v6 didClearFamilyNotification:v7];
  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (FAFamilyNotificationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FAFamilyNotificationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connLock, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

@end