@interface PKUserNotificationsRemoteNotificationServiceConnection
+ (id)sharedInstance;
- (BOOL)allowsRemoteNotifications;
- (NSMutableSet)registries;
- (NSString)bundleIdentifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)callOutQueue;
- (OS_dispatch_queue)queue;
- (PKUserNotificationsRemoteNotificationServiceConnection)init;
- (PKUserNotificationsRemoteNotificationServiceConnection)initWithBundleIdentifier:(id)a3;
- (id)_queue_ensureConnection;
- (void)_invalidate;
- (void)_queue_interruptedConnection;
- (void)_queue_invalidatedConnection;
- (void)_queue_remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4;
- (void)_queue_remoteUserNotificationsRegistrationSucceededWithDeviceToken:(id)a3;
- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)registerPushRegistry:(id)a3 completionHandler:(id)a4;
- (void)remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setCallOutQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistries:(id)a3;
- (void)unregisterPushRegistry:(id)a3;
@end

@implementation PKUserNotificationsRemoteNotificationServiceConnection

uint64_t __100__PKUserNotificationsRemoteNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_remoteUserNotificationsRegistrationSucceededWithDeviceToken:", *(void *)(a1 + 40));
}

uint64_t __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __100__PKUserNotificationsRemoteNotificationServiceConnection_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  v8[3] = &unk_26418E808;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_5;
  block[3] = &unk_26418E790;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __72__PKUserNotificationsRemoteNotificationServiceConnection_sharedInstance__block_invoke()
{
  v0 = [PKUserNotificationsRemoteNotificationServiceConnection alloc];
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v4 bundleIdentifier];
  uint64_t v2 = [(PKUserNotificationsRemoteNotificationServiceConnection *)v0 initWithBundleIdentifier:v1];
  v3 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  uint64_t v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

- (void)registerPushRegistry:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    char v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PKUserNotificationsRemoteNotificationServiceConnection.m", 58, @"Invalid parameter not satisfying: %@", @"registry != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke;
  block[3] = &unk_26418E7E0;
  void block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(queue, block);
}

- (void)_queue_remoteUserNotificationsRegistrationSucceededWithDeviceToken:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_registries;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "remoteUserNotificationRegistrationSucceededWithDeviceToken:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __81__PKUserNotificationsRemoteNotificationServiceConnection_unregisterPushRegistry___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v3 remoteObjectProxy];
    [v2 invalidateTokenForRemoteNotificationsForBundleIdentifier:*(void *)(*(void *)(a1 + 32) + 40)];
  }
}

id __83__PKUserNotificationsRemoteNotificationServiceConnection_initWithBundleIdentifier___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
}

void __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_2;
    v8[3] = &unk_26418E768;
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_4;
    v6[3] = &unk_26418E7B8;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 48);
    [v3 requestTokenForRemoteNotificationsForBundleIdentifier:v5 withCompletionHandler:v6];
  }
}

- (id)_queue_ensureConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.usernotifications.remotenotificationservice" options:0];
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C399B40];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    uint64_t v8 = self->_connection;
    id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C3986A8];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    long long v10 = self->_connection;
    id v11 = objc_loadWeakRetained(&location);
    [(NSXPCConnection *)v10 setExportedObject:v11];

    objc_initWeak(&from, self->_queue);
    long long v12 = self->_connection;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke;
    v21[3] = &unk_26418E8C8;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v21];
    long long v13 = self->_connection;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_3;
    v18 = &unk_26418E8C8;
    objc_copyWeak(&v19, &from);
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:&v15];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

- (PKUserNotificationsRemoteNotificationServiceConnection)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PKUserNotificationsRemoteNotificationServiceConnection.m", 41, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PKUserNotificationsRemoteNotificationServiceConnection;
  uint64_t v6 = [(PKUserNotificationsRemoteNotificationServiceConnection *)&v22 init];
  if (v6)
  {
    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    registries = v6->_registries;
    v6->_registries = v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.usernotifications.PKUserNotificationsRemoteNotificationServiceConnection", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    long long v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.usernotifications.PKUserNotificationsRemoteNotificationServiceConnection.call-out", v12);
    callOutQueue = v6->_callOutQueue;
    v6->_callOutQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v15;

    v17 = v6->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__PKUserNotificationsRemoteNotificationServiceConnection_initWithBundleIdentifier___block_invoke;
    block[3] = &unk_26418E718;
    v21 = v6;
    dispatch_async(v17, block);
  }
  return v6;
}

- (void)unregisterPushRegistry:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PKUserNotificationsRemoteNotificationServiceConnection.m", 81, @"Invalid parameter not satisfying: %@", @"registry != nil" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection_unregisterPushRegistry___block_invoke;
  block[3] = &unk_26418E808;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (PKUserNotificationsRemoteNotificationServiceConnection)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PKUserNotificationsRemoteNotificationServiceConnection.m" lineNumber:36 description:@"use +sharedInstance"];

  return 0;
}

void __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_3;
  v7[3] = &unk_26418E740;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __97__PKUserNotificationsRemoteNotificationServiceConnection_registerPushRegistry_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

- (BOOL)allowsRemoteNotifications
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke;
  v5[3] = &unk_26418E878;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  char v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke_3;
  v5[3] = &unk_26418E850;
  v5[4] = *(void *)(a1 + 40);
  [v3 getAllowsRemoteNotificationsForBundleIdentifier:v4 withCompletionHandler:v5];
}

uint64_t __83__PKUserNotificationsRemoteNotificationServiceConnection_allowsRemoteNotifications__block_invoke_3(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__PKUserNotificationsRemoteNotificationServiceConnection_remoteUserNotificationPayloadReceived_completionHandler___block_invoke;
  block[3] = &unk_26418E7E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __114__PKUserNotificationsRemoteNotificationServiceConnection_remoteUserNotificationPayloadReceived_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_remoteUserNotificationPayloadReceived:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setExportedObject:0];

  [(PKUserNotificationsRemoteNotificationServiceConnection *)self setConnection:0];
}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_2;
    block[3] = &unk_26418E8A0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }
}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_interruptedConnection");
}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_4;
    block[3] = &unk_26418E8A0;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }
}

void __81__PKUserNotificationsRemoteNotificationServiceConnection__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnection");
}

- (void)_queue_interruptedConnection
{
}

- (void)_queue_invalidatedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);

  [(PKUserNotificationsRemoteNotificationServiceConnection *)self _invalidate];
}

- (void)_queue_remoteUserNotificationPayloadReceived:(id)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v16 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self->_registries;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        dispatch_group_enter(v7);
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke;
        v19[3] = &unk_26418E718;
        id v20 = v7;
        [v13 remoteUserNotificationPayloadReceived:v6 completionHandler:v19];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  id v14 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke_2;
  block[3] = &unk_26418E8F0;
  id v18 = v16;
  id v15 = v16;
  dispatch_group_notify(v7, v14, block);
}

void __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke(uint64_t a1)
{
}

uint64_t __121__PKUserNotificationsRemoteNotificationServiceConnection__queue_remoteUserNotificationPayloadReceived_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSMutableSet)registries
{
  return self->_registries;
}

- (void)setRegistries:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_registries, 0);
}

@end