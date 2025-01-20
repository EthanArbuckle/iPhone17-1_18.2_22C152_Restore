@interface DNDRemoteAppConfigurationServiceConnection
+ (id)sharedInstance;
- (DNDRemoteAppConfigurationServiceConnection)init;
- (id)_queue_remoteTarget;
- (void)_queue_createConnection;
- (void)_queue_invalidateConnection;
- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
- (void)invalidateAppContextForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5;
@end

@implementation DNDRemoteAppConfigurationServiceConnection

uint64_t __60__DNDRemoteAppConfigurationServiceConnection_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (DNDRemoteAppConfigurationServiceConnection)init
{
  v11.receiver = self;
  v11.super_class = (Class)DNDRemoteAppConfigurationServiceConnection;
  v2 = [(DNDRemoteAppConfigurationServiceConnection *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F50BE0] userInitiated];
    queuePriority = v3->_queuePriority;
    v3->_queuePriority = (BSServiceQuality *)v4;

    v6 = [MEMORY[0x1E4F4F730] serial];
    v7 = objc_msgSend(v6, "serviceClass:relativePriority:", -[BSServiceQuality serviceClass](v3->_queuePriority, "serviceClass"), -[BSServiceQuality relativePriority](v3->_queuePriority, "relativePriority"));
    uint64_t v8 = BSDispatchQueueCreate();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;
  }
  return v3;
}

void __69__DNDRemoteAppConfigurationServiceConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  [v4 setServiceQuality:v3];
  [v4 setInterface:*(void *)(a1 + 40)];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  [v4 setActivationHandler:&__block_literal_global_59];
  [v4 setInterruptionHandler:&__block_literal_global_62];
  [v4 setInvalidationHandler:&__block_literal_global_65];
}

void __129__DNDRemoteAppConfigurationServiceConnection_getCurrentAppConfigurationForActionIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 getCurrentAppConfigurationForActionIdentifier:*(void *)(a1 + 40) withRequestDetails:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __129__DNDRemoteAppConfigurationServiceConnection_getCurrentAppConfigurationForActionIdentifier_withRequestDetails_completionHandler___block_invoke;
  v15[3] = &unk_1E5911598;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__DNDRemoteAppConfigurationServiceConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  id v2 = (void *)sharedInstance_sharedInstance_1;
  return v2;
}

- (id)_queue_remoteTarget
{
  BSDispatchQueueAssert();
  uint64_t v3 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  if (!v3)
  {
    [(DNDRemoteAppConfigurationServiceConnection *)self _queue_invalidateConnection];
    [(DNDRemoteAppConfigurationServiceConnection *)self _queue_createConnection];
    uint64_t v3 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  }
  return v3;
}

- (void)_queue_invalidateConnection
{
  BSDispatchQueueAssert();
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    [(BSServiceConnection *)queue_connection invalidate];
    id v4 = self->_queue_connection;
    self->_queue_connection = 0;
  }
}

- (void)_queue_createConnection
{
  BSDispatchQueueAssert();
  uint64_t v3 = DNDRemoteAppConfigurationServiceServerInterface();
  id v4 = (void *)MEMORY[0x1E4F50BB8];
  v5 = [v3 identifier];
  v6 = [v4 endpointForMachName:@"com.apple.donotdisturb.appconfiguration.service" service:v5 instance:0];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
    queue_connection = self->_queue_connection;
    self->_queue_connection = v7;

    id v9 = self->_queue_connection;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __69__DNDRemoteAppConfigurationServiceConnection__queue_createConnection__block_invoke;
    id v13 = &unk_1E5911850;
    id v14 = self;
    id v15 = v3;
    [(BSServiceConnection *)v9 configureConnection:&v10];
    [(BSServiceConnection *)self->_queue_connection activate];
  }
}

void __69__DNDRemoteAppConfigurationServiceConnection__queue_createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was activated: connection=%p", (uint8_t *)&v4, 0xCu);
  }
}

void __69__DNDRemoteAppConfigurationServiceConnection__queue_createConnection__block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was interrupted: connection=%p", (uint8_t *)&v4, 0xCu);
  }
}

void __69__DNDRemoteAppConfigurationServiceConnection__queue_createConnection__block_invoke_63(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = DNDLogRemoteConnection;
  if (os_log_type_enabled((os_log_t)DNDLogRemoteConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    id v5 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "XPC request connection was invalidated, cannot recover: connection=%p", (uint8_t *)&v4, 0xCu);
  }
}

- (void)invalidateAppContextForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __123__DNDRemoteAppConfigurationServiceConnection_invalidateAppContextForActionIdentifier_withRequestDetails_completionHandler___block_invoke;
  v15[3] = &unk_1E5911598;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(queue, v15);
}

void __123__DNDRemoteAppConfigurationServiceConnection_invalidateAppContextForActionIdentifier_withRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 invalidateAppContextForActionIdentifier:*(void *)(a1 + 40) withRequestDetails:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuePriority, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
}

@end