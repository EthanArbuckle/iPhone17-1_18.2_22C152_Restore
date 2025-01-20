@interface DNDRemoteAvailabilityServiceConnection
+ (id)sharedInstance;
- (DNDRemoteAvailabilityServiceConnection)init;
- (id)_queue_remoteTarget;
- (void)_queue_createConnection;
- (void)_queue_invalidateConnection;
- (void)getIsLocalUserAvailableWithRequestDetails:(id)a3 completionHandler:(id)a4;
@end

@implementation DNDRemoteAvailabilityServiceConnection

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DNDRemoteAvailabilityServiceConnection_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __56__DNDRemoteAvailabilityServiceConnection_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (DNDRemoteAvailabilityServiceConnection)init
{
  v11.receiver = self;
  v11.super_class = (Class)DNDRemoteAvailabilityServiceConnection;
  uint64_t v2 = [(DNDRemoteAvailabilityServiceConnection *)&v11 init];
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

- (id)_queue_remoteTarget
{
  BSDispatchQueueAssert();
  v3 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  if (!v3)
  {
    [(DNDRemoteAvailabilityServiceConnection *)self _queue_invalidateConnection];
    [(DNDRemoteAvailabilityServiceConnection *)self _queue_createConnection];
    v3 = [(BSServiceConnection *)self->_queue_connection remoteTarget];
  }
  return v3;
}

- (void)_queue_createConnection
{
  BSDispatchQueueAssert();
  v3 = DNDRemoteAvailabilityServiceServerInterface();
  uint64_t v4 = (void *)MEMORY[0x1E4F50BB8];
  v5 = [v3 identifier];
  v6 = [v4 endpointForMachName:@"com.apple.donotdisturb.availability.service" service:v5 instance:0];

  if (v6)
  {
    v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
    queue_connection = self->_queue_connection;
    self->_queue_connection = v7;

    v9 = self->_queue_connection;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke;
    v13 = &unk_1E5911850;
    v14 = self;
    id v15 = v3;
    [(BSServiceConnection *)v9 configureConnection:&v10];
    [(BSServiceConnection *)self->_queue_connection activate];
  }
}

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
  id v4 = a2;
  [v4 setServiceQuality:v3];
  [v4 setInterface:*(void *)(a1 + 40)];
  [v4 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 32)];
  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  [v4 setActivationHandler:&__block_literal_global_57];
  [v4 setInterruptionHandler:&__block_literal_global_60];
  [v4 setInvalidationHandler:&__block_literal_global_63];
}

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke_2(uint64_t a1, void *a2)
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

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke_58(uint64_t a1, void *a2)
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

void __65__DNDRemoteAvailabilityServiceConnection__queue_createConnection__block_invoke_61(uint64_t a1, void *a2)
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

- (void)_queue_invalidateConnection
{
  BSDispatchQueueAssert();
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    [(BSServiceConnection *)queue_connection invalidate];
    int v4 = self->_queue_connection;
    self->_queue_connection = 0;
  }
}

- (void)getIsLocalUserAvailableWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__DNDRemoteAvailabilityServiceConnection_getIsLocalUserAvailableWithRequestDetails_completionHandler___block_invoke;
  block[3] = &unk_1E5911030;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __102__DNDRemoteAvailabilityServiceConnection_getIsLocalUserAvailableWithRequestDetails_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTarget");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 getIsLocalUserAvailableWithRequestDetails:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuePriority, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
}

@end