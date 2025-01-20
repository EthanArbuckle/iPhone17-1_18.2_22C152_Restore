@interface XAMObserver
+ (XAMObserver)sharedInstance;
+ (void)resetSharedObserver;
- (BOOL)automationModeRequiresAuthentication;
- (BOOL)currentAutomationModeEnabledStateFromDaemon;
- (BOOL)isAutomationModeEnabled;
- (NSString)changeNotificationName;
- (OS_dispatch_queue)queue;
- (XAMObserver)initWithChangeNotificationName:(id)a3 readerConnectionFactory:(id)a4;
- (id)readerConnectionFactory;
- (id)registerAutomationModeChangeHandlerOnQueue:(id)a3 withBlock:(id)a4;
- (void)_listenForAutomationModeChangeNotifications;
- (void)_notifyHandlers;
- (void)dealloc;
- (void)unregisterAutomationModeChangeHandler:(id)a3;
@end

@implementation XAMObserver

+ (void)resetSharedObserver
{
  id obj = self;
  objc_sync_enter(obj);
  v0 = (void *)XAMSharedObserver;
  XAMSharedObserver = 0;

  objc_sync_exit(obj);
}

+ (XAMObserver)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!XAMSharedObserver)
  {
    v3 = [XAMObserver alloc];
    v4 = XAMAutomationModeStateChangedNotificationName();
    uint64_t v5 = [(XAMObserver *)v3 initWithChangeNotificationName:v4 readerConnectionFactory:&__block_literal_global_1];
    v6 = (void *)XAMSharedObserver;
    XAMSharedObserver = v5;
  }
  objc_sync_exit(v2);

  v7 = (void *)XAMSharedObserver;
  return (XAMObserver *)v7;
}

id __29__XAMObserver_sharedInstance__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = XAMAutomationModeReaderMachServiceName();
  v1 = XAMLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = v0;
    _os_log_impl(&dword_23C1A0000, v1, OS_LOG_TYPE_DEFAULT, "XAM shared observer connecting to %{public}@", (uint8_t *)&v5, 0xCu);
  }

  id v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v0 options:0];
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EFDD850];
  [v2 setRemoteObjectInterface:v3];

  [v2 resume];
  return v2;
}

- (XAMObserver)initWithChangeNotificationName:(id)a3 readerConnectionFactory:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)XAMObserver;
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [(XAMObserver *)&v17 init];
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.dt.automationmode-reader", 0);
  queue = v7->_queue;
  v7->_queue = (OS_dispatch_queue *)v8;

  uint64_t v10 = objc_opt_new();
  handlers = v7->_handlers;
  v7->_handlers = (NSMutableDictionary *)v10;

  v7->_observationToken = -1;
  uint64_t v12 = objc_msgSend(v6, "copy", v17.receiver, v17.super_class);

  changeNotificationName = v7->_changeNotificationName;
  v7->_changeNotificationName = (NSString *)v12;

  uint64_t v14 = [v5 copy];
  id readerConnectionFactory = v7->_readerConnectionFactory;
  v7->_id readerConnectionFactory = (id)v14;

  [(XAMObserver *)v7 _listenForAutomationModeChangeNotifications];
  return v7;
}

- (void)dealloc
{
  int observationToken = self->_observationToken;
  if (observationToken != -1) {
    notify_cancel(observationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)XAMObserver;
  [(XAMObserver *)&v4 dealloc];
}

- (BOOL)currentAutomationModeEnabledStateFromDaemon
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (*((void (**)(void))self->_readerConnectionFactory + 2))();
  objc_super v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_13];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_14;
  v7[3] = &unk_264E368E8;
  v7[4] = &v8;
  [v4 requestAutomationModeEnabledStateWithReply:v7];
  [v3 invalidate];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = XAMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

uint64_t __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_14(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_listenForAutomationModeChangeNotifications
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_23C1A0000, a2, OS_LOG_TYPE_FAULT, "Failed to register for notifications of Automation Mode, status: %d", (uint8_t *)v2, 8u);
}

void __58__XAMObserver__listenForAutomationModeChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = XAMLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [WeakRetained changeNotificationName];
    int v4 = 138543362;
    char v5 = v3;
    _os_log_impl(&dword_23C1A0000, v2, OS_LOG_TYPE_DEFAULT, "Handling posted change notification (%{public}@)", (uint8_t *)&v4, 0xCu);
  }
  [WeakRetained _notifyHandlers];
}

- (void)_notifyHandlers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v3 = [(XAMObserver *)self currentAutomationModeEnabledStateFromDaemon];
  int v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAutomationModeEnabled = self->_isAutomationModeEnabled;
    *(_DWORD *)buf = 67109376;
    BOOL v23 = isAutomationModeEnabled;
    __int16 v24 = 1024;
    BOOL v25 = v3;
    _os_log_impl(&dword_23C1A0000, v4, OS_LOG_TYPE_DEFAULT, "Comparing previous enabled state (%d) to current enabled state (%d)", buf, 0xEu);
  }

  if (!self->_hasReceivedAutomationModeEnabledState || self->_isAutomationModeEnabled != v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(NSMutableDictionary *)self->_handlers allValues];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          if (v12) {
            Property = objc_getProperty(*(id *)(*((void *)&v17 + 1) + 8 * v11), v8, 8, 1);
          }
          else {
            Property = 0;
          }
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __30__XAMObserver__notifyHandlers__block_invoke;
          v15[3] = &unk_264E36938;
          v15[4] = v12;
          BOOL v16 = v3;
          dispatch_async(Property, v15);
          ++v11;
        }
        while (v9 != v11);
        uint64_t v14 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v14;
      }
      while (v14);
    }
  }
  self->_BOOL isAutomationModeEnabled = v3;
  self->_hasReceivedAutomationModeEnabledState = 1;
}

uint64_t __30__XAMObserver__notifyHandlers__block_invoke(uint64_t a1, const char *a2)
{
  Property = *(void **)(a1 + 32);
  if (Property) {
    Property = objc_getProperty(Property, a2, 16, 1);
  }
  BOOL v3 = (uint64_t (*)(void))Property[2];
  return v3();
}

- (id)registerAutomationModeChangeHandlerOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F08C38];
  uint64_t v8 = a3;
  uint64_t v9 = [v7 UUID];
  uint64_t v10 = -[XAMHandlerRecord initWithQueue:block:]([XAMHandlerRecord alloc], v8, v6);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke;
  block[3] = &unk_264E36960;
  block[4] = self;
  id v12 = v9;
  id v23 = v12;
  __int16 v24 = v10;
  v13 = v10;
  dispatch_sync(queue, block);
  BOOL v14 = [(XAMObserver *)self isAutomationModeEnabled];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke_2;
  v19[3] = &unk_264E36988;
  id v20 = v6;
  BOOL v21 = v14;
  id v15 = v6;
  dispatch_async(v8, v19);

  BOOL v16 = v20;
  id v17 = v12;

  return v17;
}

uint64_t __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

uint64_t __68__XAMObserver_registerAutomationModeChangeHandlerOnQueue_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)unregisterAutomationModeChangeHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__XAMObserver_unregisterAutomationModeChangeHandler___block_invoke;
  v7[3] = &unk_264E369B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __53__XAMObserver_unregisterAutomationModeChangeHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (BOOL)isAutomationModeEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__XAMObserver_isAutomationModeEnabled__block_invoke;
  v5[3] = &unk_264E369D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

unsigned char *__38__XAMObserver_isAutomationModeEnabled__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[17])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = [result currentAutomationModeEnabledStateFromDaemon];
    *(unsigned char *)(*(void *)(a1 + 32) + 17) = 1;
    result = *(unsigned char **)(a1 + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result[16];
  return result;
}

- (BOOL)automationModeRequiresAuthentication
{
  id v2 = (*((void (**)(void))self->_readerConnectionFactory + 2))();
  char v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_21];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__XAMObserver_automationModeRequiresAuthentication__block_invoke_22;
  v6[3] = &unk_264E368E8;
  v6[4] = &v7;
  [v3 requestAutomationModeRequiresAuthenticationWithReply:v6];
  [v2 invalidate];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__XAMObserver_automationModeRequiresAuthentication__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = XAMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

uint64_t __51__XAMObserver_automationModeRequiresAuthentication__block_invoke_22(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)readerConnectionFactory
{
  return objc_getProperty(self, a2, 24, 1);
}

- (NSString)changeNotificationName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_changeNotificationName, 0);
  objc_storeStrong(&self->_readerConnectionFactory, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

void __58__XAMObserver_currentAutomationModeEnabledStateFromDaemon__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C1A0000, a2, OS_LOG_TYPE_ERROR, "XPC error: %@", (uint8_t *)&v2, 0xCu);
}

@end