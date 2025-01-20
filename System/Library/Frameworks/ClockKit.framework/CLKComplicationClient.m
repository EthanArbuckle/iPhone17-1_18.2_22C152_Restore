@interface CLKComplicationClient
- (CLKComplicationClient)initWithConnection:(id)a3;
- (CLKComplicationClientDelegate)delegate;
- (NSNumber)pid;
- (NSSet)activeComplications;
- (NSString)clientBundlePath;
- (NSString)clientIdentifier;
- (id)checkinHandler;
- (id)invalidationHandler;
- (void)_handleConnectionInvalidated;
- (void)addInvalidationObserver:(id)a3;
- (void)checkinWithClientIdentifier:(id)a3 bundlePath:(id)a4;
- (void)extendTimelineForComplication:(id)a3;
- (void)getAlwaysOnTemplateForComplication:(id)a3 withHandler:(id)a4;
- (void)getComplicationDescriptorsWithHandler:(id)a3;
- (void)getCurrentTimelineEntryForComplication:(id)a3 withHandler:(id)a4;
- (void)getLocalizableSampleTemplateForComplication:(id)a3 withHandler:(id)a4;
- (void)getNextRequestedUpdateDateWithHandler:(id)a3;
- (void)getPrivacyBehaviorForComplication:(id)a3 withHandler:(id)a4;
- (void)getTimelineAnimationBehaviorForComplication:(id)a3 withHandler:(id)a4;
- (void)getTimelineEndDateForComplication:(id)a3 withHandler:(id)a4;
- (void)getTimelineEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6;
- (void)getWidgetMigrationConfigurationFrom:(id)a3 withHandler:(id)a4;
- (void)handleSharedComplicationDescriptors:(id)a3;
- (void)invalidate;
- (void)notifyDebugTimeoutWithCharging:(BOOL)a3;
- (void)reloadComplicationDescriptors;
- (void)reloadTimelineForComplication:(id)a3;
- (void)removeInvalidationObserver:(id)a3;
- (void)requestedUpdateBudgetExhausted;
- (void)requestedUpdateDidBegin;
- (void)setActiveComplications:(id)a3;
- (void)setCheckinHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CLKComplicationClient

- (CLKComplicationClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CLKComplicationClient;
  v6 = [(CLKComplicationClient *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "processIdentifier"));
    pid = v7->_pid;
    v7->_pid = (NSNumber *)v8;

    connection = v7->_connection;
    v11 = CLKComplicationClientInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v11];

    v12 = v7->_connection;
    v13 = CLKComplicationServerInterface();
    [(NSXPCConnection *)v12 setExportedInterface:v13];

    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    objc_initWeak(&location, v7);
    v14 = v7->_connection;
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __44__CLKComplicationClient_initWithConnection___block_invoke;
    v23 = &unk_26440DAC8;
    objc_copyWeak(&v24, &location);
    [(NSXPCConnection *)v14 setInvalidationHandler:&v20];
    uint64_t v15 = objc_msgSend(MEMORY[0x263F088B0], "hashTableWithOptions:", 517, v20, v21, v22, v23);
    invalidationObservers = v7->_invalidationObservers;
    v7->_invalidationObservers = (NSHashTable *)v15;

    v17 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    invalidationObserversLock = v7->_invalidationObserversLock;
    v7->_invalidationObserversLock = v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __44__CLKComplicationClient_initWithConnection___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CLKComplicationClient_initWithConnection___block_invoke_2;
  block[3] = &unk_26440DAC8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __44__CLKComplicationClient_initWithConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionInvalidated];
}

- (void)setActiveComplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeComplications, a3);
  id v5 = a3;
  id v6 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v6 setActiveComplications:v5];
}

- (void)addInvalidationObserver:(id)a3
{
  invalidationObserversLock = self->_invalidationObserversLock;
  id v5 = a3;
  [(NSLock *)invalidationObserversLock lock];
  [(NSHashTable *)self->_invalidationObservers addObject:v5];

  id v6 = self->_invalidationObserversLock;

  [(NSLock *)v6 unlock];
}

- (void)removeInvalidationObserver:(id)a3
{
  invalidationObserversLock = self->_invalidationObserversLock;
  id v5 = a3;
  [(NSLock *)invalidationObserversLock lock];
  [(NSHashTable *)self->_invalidationObservers removeObject:v5];

  id v6 = self->_invalidationObserversLock;

  [(NSLock *)v6 unlock];
}

- (void)invalidate
{
}

- (void)_handleConnectionInvalidated
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(NSXPCConnection *)self->_connection setExportedObject:0];
    connection = self->_connection;
    self->_connection = 0;

    invalidationHandler = (void (**)(id, CLKComplicationClient *))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, self);
      id v5 = self->_invalidationHandler;
    }
    else
    {
      id v5 = 0;
    }
    self->_invalidationHandler = 0;

    id checkinHandler = self->_checkinHandler;
    self->_id checkinHandler = 0;

    [(NSLock *)self->_invalidationObserversLock lock];
    v7 = [(NSHashTable *)self->_invalidationObservers allObjects];
    [(NSLock *)self->_invalidationObserversLock unlock];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "complicationClientInvalidated:", self, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [(NSLock *)self->_invalidationObserversLock lock];
    [(NSHashTable *)self->_invalidationObservers removeAllObjects];
    [(NSLock *)self->_invalidationObserversLock unlock];
  }
}

- (void)checkinWithClientIdentifier:(id)a3 bundlePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CLKComplicationClient_checkinWithClientIdentifier_bundlePath___block_invoke;
  block[3] = &unk_26440E900;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__CLKComplicationClient_checkinWithClientIdentifier_bundlePath___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 48));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = 0;
  }
}

- (void)reloadTimelineForComplication:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CLKComplicationClient_reloadTimelineForComplication___block_invoke;
  v6[3] = &unk_26440E608;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __55__CLKComplicationClient_reloadTimelineForComplication___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21C599000, v2, OS_LOG_TYPE_DEFAULT, "Requesting timeline reload for %@", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  [WeakRetained complicationClient:*(void *)(a1 + 40) reloadTimelineForComplication:*(void *)(a1 + 32)];
}

- (void)extendTimelineForComplication:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CLKComplicationClient_extendTimelineForComplication___block_invoke;
  v6[3] = &unk_26440E608;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __55__CLKComplicationClient_extendTimelineForComplication___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21C599000, v2, OS_LOG_TYPE_DEFAULT, "Requesting timeline extension for %@", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 64));
  [WeakRetained complicationClient:*(void *)(a1 + 40) extendTimelineForComplication:*(void *)(a1 + 32)];
}

- (void)reloadComplicationDescriptors
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CLKComplicationClient_reloadComplicationDescriptors__block_invoke;
  block[3] = &unk_26440E580;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__CLKComplicationClient_reloadComplicationDescriptors__block_invoke(uint64_t a1)
{
  uint64_t v2 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C599000, v2, OS_LOG_TYPE_DEFAULT, "Requesting complication descriptor reload", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  [WeakRetained reloadComplicationDescriptorsForComplicationClient:*(void *)(a1 + 32)];
}

- (void)getTimelineEndDateForComplication:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  [v8 getTimelineEndDateForComplication:v7 withHandler:v6];
}

void __71__CLKComplicationClient_getTimelineEndDateForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__CLKComplicationClient_getTimelineEndDateForComplication_withHandler___block_invoke_cold_1();
  }
}

- (void)getPrivacyBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_5];
  [v8 getPrivacyBehaviorForComplication:v7 withHandler:v6];
}

void __71__CLKComplicationClient_getPrivacyBehaviorForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __71__CLKComplicationClient_getPrivacyBehaviorForComplication_withHandler___block_invoke_cold_1();
  }
}

- (void)getAlwaysOnTemplateForComplication:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_7];
  [v8 getAlwaysOnTemplateForComplication:v7 withHandler:v6];
}

void __72__CLKComplicationClient_getAlwaysOnTemplateForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __72__CLKComplicationClient_getAlwaysOnTemplateForComplication_withHandler___block_invoke_cold_1();
  }
}

- (void)getTimelineAnimationBehaviorForComplication:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_9];
  [v8 getTimelineAnimationBehaviorForComplication:v7 withHandler:v6];
}

void __81__CLKComplicationClient_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __81__CLKComplicationClient_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_cold_1();
  }
}

- (void)getCurrentTimelineEntryForComplication:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_11];
  [v8 getCurrentTimelineEntryForComplication:v7 withHandler:v6];
}

void __76__CLKComplicationClient_getCurrentTimelineEntryForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__CLKComplicationClient_getCurrentTimelineEntryForComplication_withHandler___block_invoke_cold_1();
  }
}

- (void)getTimelineEntriesForComplication:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5 withHandler:(id)a6
{
  connection = self->_connection;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_13];
  [v13 getTimelineEntriesForComplication:v12 afterDate:v11 limit:a5 withHandler:v10];
}

void __87__CLKComplicationClient_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __87__CLKComplicationClient_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_cold_1();
  }
}

- (void)getNextRequestedUpdateDateWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_15];
  [v5 getNextRequestedUpdateDateWithHandler:v4];
}

void __63__CLKComplicationClient_getNextRequestedUpdateDateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__CLKComplicationClient_getNextRequestedUpdateDateWithHandler___block_invoke_cold_1();
  }
}

- (void)requestedUpdateDidBegin
{
  id v2 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v2 requestedUpdateDidBegin];
}

- (void)requestedUpdateBudgetExhausted
{
  id v2 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v2 requestedUpdateBudgetExhausted];
}

- (void)getLocalizableSampleTemplateForComplication:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_17];
  [v8 getLocalizableSampleTemplateForComplication:v7 withHandler:v6];
}

void __81__CLKComplicationClient_getLocalizableSampleTemplateForComplication_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __81__CLKComplicationClient_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_cold_1();
  }
}

- (void)getComplicationDescriptorsWithHandler:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_19_0];
  [v5 getComplicationDescriptorsWithHandler:v4];
}

void __63__CLKComplicationClient_getComplicationDescriptorsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__CLKComplicationClient_getComplicationDescriptorsWithHandler___block_invoke_cold_1();
  }
}

- (void)handleSharedComplicationDescriptors:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_21];
  [v5 handleSharedComplicationDescriptors:v4];
}

void __61__CLKComplicationClient_handleSharedComplicationDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __61__CLKComplicationClient_handleSharedComplicationDescriptors___block_invoke_cold_1();
  }
}

- (void)notifyDebugTimeoutWithCharging:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_23];
  [v4 notifyDebugTimeoutWithCharging:v3];
}

void __56__CLKComplicationClient_notifyDebugTimeoutWithCharging___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__CLKComplicationClient_notifyDebugTimeoutWithCharging___block_invoke_cold_1();
  }
}

- (void)getWidgetMigrationConfigurationFrom:(id)a3 withHandler:(id)a4
{
  connection = self->_connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_25_0];
  [v8 getWidgetMigrationConfigurationFrom:v7 withHandler:v6];
}

void __73__CLKComplicationClient_getWidgetMigrationConfigurationFrom_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = CLKLoggingObjectForDomain(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__CLKComplicationClient_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1();
  }
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)clientBundlePath
{
  return self->_clientBundlePath;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (CLKComplicationClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLKComplicationClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)activeComplications
{
  return self->_activeComplications;
}

- (id)checkinHandler
{
  return self->_checkinHandler;
}

- (void)setCheckinHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_checkinHandler, 0);
  objc_storeStrong((id *)&self->_activeComplications, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_clientBundlePath, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_invalidationObserversLock, 0);
  objc_storeStrong((id *)&self->_invalidationObservers, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__CLKComplicationClient_getTimelineEndDateForComplication_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getTimelineEndDate error: %@", v2, v3, v4, v5, v6);
}

void __71__CLKComplicationClient_getPrivacyBehaviorForComplication_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getPrivacyBehavior error: %@", v2, v3, v4, v5, v6);
}

void __72__CLKComplicationClient_getAlwaysOnTemplateForComplication_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getAlwaysOnTemplateForComplication error: %@", v2, v3, v4, v5, v6);
}

void __81__CLKComplicationClient_getTimelineAnimationBehaviorForComplication_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getTimelineAnimationBehavior error: %@", v2, v3, v4, v5, v6);
}

void __76__CLKComplicationClient_getCurrentTimelineEntryForComplication_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getCurrentTimelineEntry error: %@", v2, v3, v4, v5, v6);
}

void __87__CLKComplicationClient_getTimelineEntriesForComplication_afterDate_limit_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getTimelineEntriesAfterDate error: %@", v2, v3, v4, v5, v6);
}

void __63__CLKComplicationClient_getNextRequestedUpdateDateWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getNextRequestedUpdate error: %@", v2, v3, v4, v5, v6);
}

void __81__CLKComplicationClient_getLocalizableSampleTemplateForComplication_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getLocalizableSampleTemplate error: %@", v2, v3, v4, v5, v6);
}

void __63__CLKComplicationClient_getComplicationDescriptorsWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getComplicationDescriptorsWithHandler error: %@", v2, v3, v4, v5, v6);
}

void __61__CLKComplicationClient_handleSharedComplicationDescriptors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient handleSharedComplicationDescriptors error: %@", v2, v3, v4, v5, v6);
}

void __56__CLKComplicationClient_notifyDebugTimeoutWithCharging___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient notifyDebugTimeoutWithCharging error: %@", v2, v3, v4, v5, v6);
}

void __73__CLKComplicationClient_getWidgetMigrationConfigurationFrom_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_21C599000, v0, v1, "CLKComplicationClient getWidgetConfigurationFrom:withHandler: error: %@", v2, v3, v4, v5, v6);
}

@end