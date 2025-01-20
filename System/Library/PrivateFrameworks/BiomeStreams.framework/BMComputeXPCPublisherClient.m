@interface BMComputeXPCPublisherClient
+ (id)shared;
+ (id)sharedWithQueue:(id)a3 domain:(unint64_t)a4;
+ (void)_setQueue:(id)a3 domain:(unint64_t)a4;
+ (void)initializeSharedClientWithQueue:(id)a3 domain:(unint64_t)a4;
- (BMComputeXPCPublisherClient)initWithQueue:(id)a3 configuration:(id)a4 listenerEndpoint:(id)a5 localComputePublisher:(id)a6;
- (BMComputeXPCPublisherClient)initWithQueue:(id)a3 domain:(unint64_t)a4 listenerEndpoint:(id)a5 localComputePublisher:(id)a6;
- (BOOL)isRegisteredForRelaunchNotification;
- (NSMutableDictionary)pendingEvents;
- (NSMutableDictionary)subscriptions;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)computePublisherObjectWithErrorHandler:(id)a3;
- (unint64_t)numberOfExistingNonWakingSubscriptions;
- (void)_handleEventWithPayload:(id)a3;
- (void)_setXPCEvent:(id)a3 identifier:(id)a4;
- (void)dealloc;
- (void)handleBiomeRelaunch;
- (void)receiveInputForIdentifier:(id)a3 streamIdentifier:(id)a4 storeEvent:(id)a5;
- (void)registerBiomeLaunchNotification;
- (void)subscribe:(id)a3;
- (void)subscribeViaNSXPC:(id)a3;
- (void)subscribeViaXPCEvent:(id)a3;
- (void)unregisterBiomeLaunchNotification;
- (void)unsubscribeWithIdentifier:(id)a3;
@end

@implementation BMComputeXPCPublisherClient

void __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x192FB19F0]();
  v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  free(v4);
  [(id)_computeXPCPublisherClient _handleEventWithPayload:v3];
}

- (void)receiveInputForIdentifier:(id)a3 streamIdentifier:(id)a4 storeEvent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BMComputeXPCPublisherClient *)self queue];
  dispatch_assert_queue_V2(v11);

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeXPCPublisherClient receiveInputForIdentifier:streamIdentifier:storeEvent:]((uint64_t)v8, v13);
  }

  if (v8)
  {
    os_unfair_lock_lock(&self->_lock);
    v14 = [(BMComputeXPCPublisherClient *)self subscriptions];
    v15 = [v14 objectForKeyedSubscript:v8];

    os_unfair_lock_unlock(p_lock);
    if (v15)
    {
      v16 = [v15 block];
      ((void (**)(void, NSObject *, id, id))v16)[2](v16, v15, v9, v10);
    }
  }
  else
  {
    v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherClient receiveInputForIdentifier:streamIdentifier:storeEvent:](v15);
    }
  }
}

- (void)_handleEventWithPayload:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BMComputeXPCPublisherClient *)self queue];
  dispatch_assert_queue_V2(v5);

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v7 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "identifier"));
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_INFO, "BMComputeXPCPublisherClient handle event for subscription with identifier %@", buf, 0xCu);
  }

  id v9 = [(BMComputeXPCPublisherClient *)self subscriptions];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (v10)
  {
    string = (char *)xpc_dictionary_get_string(v4, "stream");
    if (string) {
      string = (char *)[[NSString alloc] initWithUTF8String:string];
    }
    size_t length = 0;
    data = (void *)xpc_dictionary_get_data(v4, "event", &length);
    if (data)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      v14 = (void *)[v13 initWithBytes:data length:length];
      id v25 = 0;
      data = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v25];
      id v15 = v25;
      if (v15)
      {
        v16 = (void *)MEMORY[0x192FB19F0](v4);
        v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCPublisherClient _handleEventWithPayload:]();
        }

        free(v16);
      }
      else
      {
        v19 = __biome_log_for_category();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = NSNumber;
          [data timestamp];
          v24 = objc_msgSend(v20, "numberWithDouble:");
          uint64_t v21 = [data eventBody];
          *(_DWORD *)buf = 138412802;
          v28 = data;
          __int16 v29 = 2112;
          v30 = v24;
          __int16 v31 = 2112;
          uint64_t v32 = v21;
          v22 = (void *)v21;
          _os_log_impl(&dword_18E67D000, v19, OS_LOG_TYPE_INFO, "Handling store event from xpc_event publisher %@ %@ %@", buf, 0x20u);
        }
      }
    }
    os_unfair_lock_unlock(p_lock);
    v23 = [v10 block];
    ((void (**)(void, void *, char *, void *))v23)[2](v23, v10, string, data);
  }
  else
  {
    v18 = [(BMComputeXPCPublisherClient *)self pendingEvents];
    [v18 setObject:v4 forKeyedSubscript:v7];

    os_unfair_lock_unlock(p_lock);
  }
}

- (NSMutableDictionary)subscriptions
{
  return self->_subscriptions;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (void)_setQueue:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_computeXPCPublisherClientLock);
  os_unfair_lock_lock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
  if (!_computeXPCPublisherClient) {
    [a1 initializeSharedClientWithQueue:v6 domain:a4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
}

+ (id)shared
{
  id v3 = [MEMORY[0x1E4F4FB80] current];
  uint64_t v4 = [v3 isRunningInUserContext] ^ 1;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.BMComputeXPCPublisherClient.queue", v5);

  v7 = [a1 sharedWithQueue:v6 domain:v4];

  return v7;
}

+ (id)sharedWithQueue:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&_computeXPCPublisherClientLock);
  os_unfair_lock_lock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
  if (!_computeXPCPublisherClient) {
    [a1 initializeSharedClientWithQueue:v6 domain:a4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_computeXPCPublisherClientLock);
  id v7 = (id)_computeXPCPublisherClient;

  return v7;
}

+ (void)initializeSharedClientWithQueue:(id)a3 domain:(unint64_t)a4
{
  v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_computeXPCPublisherClientLock);
  id v6 = [[BMComputeXPCPublisherClientDomainConfiguration alloc] initWithDomain:a4];
  uint64_t v7 = [objc_alloc((Class)objc_opt_class()) initWithQueue:v5 configuration:v6 listenerEndpoint:0 localComputePublisher:0];
  id v8 = (void *)_computeXPCPublisherClient;
  _computeXPCPublisherClient = v7;

  id v9 = [MEMORY[0x1E4F4FB80] current];
  int v10 = [v9 isManagedByLaunchd];

  if (v10)
  {
    id v11 = [(BMComputeXPCPublisherClientDomainConfiguration *)v6 XPCPublisherStreamName];
    v12 = (const char *)[v11 UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke;
    handler[3] = &unk_1E55D8688;
    id v15 = v11;
    id v13 = v11;
    xpc_set_event_stream_handler(v12, v5, handler);
  }
}

- (BMComputeXPCPublisherClient)initWithQueue:(id)a3 domain:(unint64_t)a4 listenerEndpoint:(id)a5 localComputePublisher:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[BMComputeXPCPublisherClientDomainConfiguration alloc] initWithDomain:a4];
  v14 = [(BMComputeXPCPublisherClient *)self initWithQueue:v12 configuration:v13 listenerEndpoint:v11 localComputePublisher:v10];

  return v14;
}

- (BMComputeXPCPublisherClient)initWithQueue:(id)a3 configuration:(id)a4 listenerEndpoint:(id)a5 localComputePublisher:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BMComputeXPCPublisherClient;
  id v15 = [(BMComputeXPCPublisherClient *)&v22 init];
  v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_queue, a3);
    objc_storeStrong((id *)&v16->_listenerEndpoint, a5);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subscriptions = v16->_subscriptions;
    v16->_subscriptions = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingEvents = v16->_pendingEvents;
    v16->_pendingEvents = v19;

    objc_storeStrong((id *)&v16->_configuration, a4);
    objc_storeStrong((id *)&v16->_localComputePublisher, a6);
    v16->_token = -1;
  }

  return v16;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(BMComputeXPCPublisherClient *)self unregisterBiomeLaunchNotification];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BMComputeXPCPublisherClient;
  [(BMComputeXPCPublisherClient *)&v5 dealloc];
}

- (NSXPCConnection)connection
{
  os_unfair_lock_assert_owner(&self->_lock);
  connection = self->_connection;
  if (!connection)
  {
    if (self->_listenerEndpoint)
    {
      uint64_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_listenerEndpoint];
      objc_super v5 = self->_connection;
      self->_connection = v4;
    }
    else
    {
      [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration domain];
      id v6 = objc_alloc(MEMORY[0x1E4F29268]);
      objc_super v5 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration machServiceName];
      uint64_t v7 = (NSXPCConnection *)[v6 initWithMachServiceName:v5 options:0];
      id v8 = self->_connection;
      self->_connection = v7;
    }
    id v9 = self->_connection;
    id v10 = [(BMComputeXPCPublisherClient *)self queue];
    [(NSXPCConnection *)v9 _setQueue:v10];

    id v11 = BMComputePublisherInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v11];

    id v12 = BMComputePublishingInterface();
    [(NSXPCConnection *)self->_connection setExportedInterface:v12];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_connection);
    id v13 = self->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__BMComputeXPCPublisherClient_connection__block_invoke;
    v19[3] = &unk_1E55D74A0;
    objc_copyWeak(&v20, &from);
    [(NSXPCConnection *)v13 setInterruptionHandler:v19];
    id v14 = self->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__BMComputeXPCPublisherClient_connection__block_invoke_34;
    v16[3] = &unk_1E55D74C8;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    [(NSXPCConnection *)v14 setInvalidationHandler:v16];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __41__BMComputeXPCPublisherClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_18E67D000, v2, OS_LOG_TYPE_DEFAULT, "BMComputePublisherServiceClient connection %@ interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void __41__BMComputeXPCPublisherClient_connection__block_invoke_34(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 _xpcConnection];

    if (v5)
    {
      uint64_t v6 = [v4 _xpcConnection];
      uint64_t v7 = (void *)xpc_connection_copy_invalidation_reason();

      if (v7)
      {
        id v5 = [NSString stringWithUTF8String:v7];
      }
      else
      {
        id v5 = @"<unknown>";
      }
      free(v7);
    }
  }
  else
  {
    id v5 = 0;
  }
  id v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v4;
    __int16 v24 = 2114;
    id v25 = v5;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_INFO, "BMComputePublisherServiceClient connection %@ invalidated because %{public}@", buf, 0x16u);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = objc_msgSend(*((id *)WeakRetained + 8), "copy", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v15 = [*((id *)WeakRetained + 8) objectForKeyedSubscript:v14];
          if (([v15 waking] & 1) == 0) {
            [*((id *)WeakRetained + 8) removeObjectForKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v16 = (void *)*((void *)WeakRetained + 2);
    *((void *)WeakRetained + 2) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  }
}

- (id)computePublisherObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  localComputePublisher = self->_localComputePublisher;
  if (localComputePublisher)
  {
    uint64_t v6 = localComputePublisher;
  }
  else
  {
    uint64_t v7 = [(BMComputeXPCPublisherClient *)self connection];
    uint64_t v6 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v6;
}

- (BOOL)isRegisteredForRelaunchNotification
{
  return self->_token != -1;
}

- (void)registerBiomeLaunchNotification
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Failed to register for biomed re-launch notification, status: %@", buf, 0xCu);
}

void __62__BMComputeXPCPublisherClient_registerBiomeLaunchNotification__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v4 = [WeakRetained queue];
    dispatch_assert_queue_V2(v4);

    id WeakRetained = v5;
    if (v5[6] == a2)
    {
      [v5 handleBiomeRelaunch];
      id WeakRetained = v5;
    }
  }
}

- (void)unregisterBiomeLaunchNotification
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "Unregistering for biomed re-launch notification", v1, 2u);
}

- (void)handleBiomeRelaunch
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(BMComputeXPCPublisherClient *)self queue];
  dispatch_assert_queue_V2(v3);

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18E67D000, v4, OS_LOG_TYPE_INFO, "Handling biomed re-launch notification", buf, 2u);
  }

  id v5 = [(BMComputeXPCPublisherClient *)self subscriptions];
  uint64_t v6 = [v5 allValues];
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_19];
  id v8 = [v6 filteredArrayUsingPredicate:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v14;
          _os_log_impl(&dword_18E67D000, v15, OS_LOG_TYPE_DEFAULT, "re-subscribing subscription after biomed re-launch %@", buf, 0xCu);
        }

        [(BMComputeXPCPublisherClient *)self subscribeViaNSXPC:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __50__BMComputeXPCPublisherClient_handleBiomeRelaunch__block_invoke(uint64_t a1, void *a2)
{
  return [a2 waking] ^ 1;
}

- (void)subscribe:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration machServiceName];
    uint64_t v7 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration XPCPublisherStreamName];
    localComputePublisher = self->_localComputePublisher;
    int v13 = 138413058;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    long long v16 = v7;
    __int16 v17 = 2112;
    long long v18 = localComputePublisher;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_18E67D000, v5, OS_LOG_TYPE_INFO, "BMComputeXPCPublisherClient subscribe with connection name: %@, publisher stream name: %@, localPublisher: %@, subscription: %@", (uint8_t *)&v13, 0x2Au);
  }
  if (v4)
  {
    id v9 = [v4 identifier];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      os_unfair_lock_lock(&self->_lock);
      if (!-[BMComputeXPCPublisherClient numberOfExistingNonWakingSubscriptions](self, "numberOfExistingNonWakingSubscriptions")&& ([v4 waking] & 1) == 0)
      {
        [(BMComputeXPCPublisherClient *)self registerBiomeLaunchNotification];
      }
      uint64_t v11 = [(BMComputeXPCPublisherClient *)self subscriptions];
      uint64_t v12 = [v4 identifier];
      [v11 setObject:v4 forKeyedSubscript:v12];

      if ([v4 waking]) {
        [(BMComputeXPCPublisherClient *)self subscribeViaXPCEvent:v4];
      }
      else {
        [(BMComputeXPCPublisherClient *)self subscribeViaNSXPC:v4];
      }
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)subscribeViaXPCEvent:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (([v5 waking] & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherClient.m", 371, @"Invalid parameter not satisfying: %@", @"subscription.waking" object file lineNumber description];
  }
  uint64_t v6 = [(BMComputeXPCPublisherClient *)self pendingEvents];
  uint64_t v7 = [v5 identifier];
  id v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = [(BMComputeXPCPublisherClient *)self pendingEvents];
  BOOL v10 = [v5 identifier];
  [v9 removeObjectForKey:v10];

  if (v8)
  {
    uint64_t v11 = [(BMComputeXPCPublisherClient *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke;
    block[3] = &unk_1E55D68C8;
    block[4] = self;
    id v16 = v8;
    dispatch_async(v11, block);
  }
  uint64_t v12 = [v5 XPCEvent];
  int v13 = [v5 identifier];
  [(BMComputeXPCPublisherClient *)self _setXPCEvent:v12 identifier:v13];
}

uint64_t __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke(uint64_t a1)
{
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 32) _handleEventWithPayload:*(void *)(a1 + 40)];
}

- (void)subscribeViaNSXPC:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v5 waking])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherClient.m", 391, @"Invalid parameter not satisfying: %@", @"!subscription.waking" object file lineNumber description];
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke;
  v9[3] = &unk_1E55D86F8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v10 = v6;
  uint64_t v7 = [(BMComputeXPCPublisherClient *)self computePublisherObjectWithErrorHandler:v9];
  [v7 subscribe:v6];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = __biome_log_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke_cold_1(a1);
  }

  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    id v6 = *(void **)&WeakRetained[16]._os_unfair_lock_opaque;
    uint64_t v7 = [*(id *)(a1 + 32) identifier];
    [v6 setObject:0 forKeyedSubscript:v7];

    os_unfair_lock_unlock(WeakRetained + 2);
  }
}

- (void)unsubscribeWithIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration machServiceName];
    id v8 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration XPCPublisherStreamName];
    localComputePublisher = self->_localComputePublisher;
    *(_DWORD *)buf = 138413058;
    id v20 = v7;
    __int16 v21 = 2112;
    objc_super v22 = v8;
    __int16 v23 = 2112;
    __int16 v24 = localComputePublisher;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_18E67D000, v6, OS_LOG_TYPE_INFO, "BMComputeXPCPublisherClient unsubscribe with connection name: %@, publisher stream name: %@, localPublisher: %@, identifier: %@", buf, 0x2Au);
  }
  id v10 = [(BMComputeXPCPublisherClient *)self subscriptions];
  id v11 = [v10 objectForKeyedSubscript:v4];

  if (!v11)
  {
    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BMComputeXPCPublisherClient unsubscribeWithIdentifier:]();
    }
    goto LABEL_11;
  }
  uint64_t v12 = [(BMComputeXPCPublisherClient *)self subscriptions];
  [v12 removeObjectForKey:v4];

  if (![v11 waking])
  {
    if (![(BMComputeXPCPublisherClient *)self numberOfExistingNonWakingSubscriptions])[(BMComputeXPCPublisherClient *)self unregisterBiomeLaunchNotification]; {
    v17[0] = MEMORY[0x1E4F143A8];
    }
    v17[1] = 3221225472;
    v17[2] = __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke;
    v17[3] = &unk_1E55D7588;
    __int16 v15 = v4;
    long long v18 = v15;
    id v16 = [(BMComputeXPCPublisherClient *)self computePublisherObjectWithErrorHandler:v17];
    [v16 unsubscribeWithIdentifier:v15];

    uint64_t v14 = v18;
LABEL_11:

    goto LABEL_12;
  }
  int v13 = [(BMComputeXPCPublisherClient *)self pendingEvents];
  [v13 removeObjectForKey:v4];

  [(BMComputeXPCPublisherClient *)self _setXPCEvent:0 identifier:v4];
LABEL_12:

  os_unfair_lock_unlock(p_lock);
}

void __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke_cold_1(a1);
  }
}

- (unint64_t)numberOfExistingNonWakingSubscriptions
{
  v2 = [(BMComputeXPCPublisherClient *)self subscriptions];
  id v3 = [v2 allValues];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_56];
  id v5 = [v3 filteredArrayUsingPredicate:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

uint64_t __69__BMComputeXPCPublisherClient_numberOfExistingNonWakingSubscriptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 waking] ^ 1;
}

- (void)_setXPCEvent:(id)a3 identifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v6) {
    goto LABEL_12;
  }
  if ([(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration domain] == 1)
  {
    id v8 = +[BMDaemon userComputePublisherStreamName];
    if (!v8) {
      goto LABEL_12;
    }
  }
  else
  {
    if ([(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration domain]) {
      goto LABEL_12;
    }
    id v8 = +[BMDaemon systemComputePublisherStreamName];
    if (!v8) {
      goto LABEL_12;
    }
  }
  id v9 = v8;
  [v9 UTF8String];
  id v10 = v7;
  [v10 UTF8String];
  id v11 = (void *)xpc_copy_event();
  if (v11)
  {
    id v12 = v9;
    [v12 UTF8String];
    id v13 = v10;
    [v13 UTF8String];
    xpc_set_event();
    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration XPCPublisherStreamName];
      int v23 = 138412802;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_18E67D000, v14, OS_LOG_TYPE_DEFAULT, "Cancelled existing xpc event subscription: %@ to stream: %@ because of new subscription to stream: %@", (uint8_t *)&v23, 0x20u);
    }
  }

LABEL_12:
  id v16 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration XPCPublisherStreamName];
  [v16 UTF8String];
  id v17 = v7;
  [v17 UTF8String];
  long long v18 = (void *)xpc_copy_event();

  if (v6) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  int v20 = v19;
  if (v6 && v18 && !xpc_equal(v6, v18))
  {
    __int16 v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherClient _setXPCEvent:identifier:]();
    }
  }
  if (v20)
  {
    id v22 = [(BMComputeXPCPublisherClientDomainConfiguration *)self->_configuration XPCPublisherStreamName];
    [v22 UTF8String];
    [v17 UTF8String];
    xpc_set_event();
  }
}

- (NSMutableDictionary)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localComputePublisher, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __70__BMComputeXPCPublisherClient_initializeSharedClientWithQueue_domain___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "Received new event on '%@' %s", (uint8_t *)&v4, 0x16u);
}

void __52__BMComputeXPCPublisherClient_subscribeViaXPCEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) XPCPublisherStreamName];
  OUTLINED_FUNCTION_7();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Forwarding pending event on '%@' %@", v5, 0x16u);
}

void __49__BMComputeXPCPublisherClient_subscribeViaNSXPC___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v1, v2, "BMComputePublisherServiceClient XPC error in subscribe:%@, %@", (void)v3, DWORD2(v3));
}

- (void)unsubscribeWithIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_18E67D000, v0, OS_LOG_TYPE_DEBUG, "Unable to unsubscribe, missing subscription for identifier %@", v1, 0xCu);
}

void __57__BMComputeXPCPublisherClient_unsubscribeWithIdentifier___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v1, v2, "BMComputePublisherServiceClient XPC error in unsubscribeWithIdentifier:%@, %@", (void)v3, DWORD2(v3));
}

- (void)receiveInputForIdentifier:(os_log_t)log streamIdentifier:storeEvent:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "BMComputeXPCPublisherServer dropping receiveInputForIdentifier: due to nil identifier", v1, 2u);
}

- (void)receiveInputForIdentifier:(uint64_t)a1 streamIdentifier:(NSObject *)a2 storeEvent:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  long long v3 = "-[BMComputeXPCPublisherClient receiveInputForIdentifier:streamIdentifier:storeEvent:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v2, 0x16u);
}

- (void)_handleEventWithPayload:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v0, v1, "Failed to unarchive store event from payload %s %@");
}

- (void)_setXPCEvent:identifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Error attempting to modify subscription with identifier %@ without first unsubscribing", v1, 0xCu);
}

@end