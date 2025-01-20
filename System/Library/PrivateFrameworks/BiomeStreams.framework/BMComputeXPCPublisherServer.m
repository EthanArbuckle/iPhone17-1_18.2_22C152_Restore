@interface BMComputeXPCPublisherServer
- (BMComputeSubscriptionMarkerManager)subscriptionMarkerManager;
- (BMComputeXPCPublisherServer)initWithQueue:(id)a3 domain:(unint64_t)a4 delegate:(id)a5;
- (BMComputeXPCPublisherServer)initWithQueue:(id)a3 listener:(id)a4 domain:(unint64_t)a5 delegate:(id)a6 computePublisherStreamName:(id)a7;
- (BMComputeXPCPublisherServerDelegate)delegate;
- (BMComputeXPCPublisherStorage)storage;
- (BMComputeXPCPublisherStorage)systemStorage;
- (BMComputeXPCPublisherStorage)userStorage;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)subscriptions;
- (NSString)description;
- (NSXPCInterface)interface;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (id)activationCompletion;
- (id)subscriptionsForStream:(id)a3;
- (unint64_t)domain;
- (void)_addSubscription:(id)a3;
- (void)_handlePublisherAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)_removeActiveSubscriptionMarkersForSubscription:(id)a3;
- (void)_removeSubscriptionWithIdentifier:(id)a3 client:(id)a4;
- (void)_removeSubscriptionWithToken:(unint64_t)a3;
- (void)activateWithCompletion:(id)a3;
- (void)receiveInputForSubscription:(id)a3 streamIdentifier:(id)a4 storeEvent:(id)a5;
- (void)setActivationCompletion:(id)a3;
- (void)subscribe:(id)a3;
- (void)unsubscribeWithIdentifier:(id)a3;
@end

@implementation BMComputeXPCPublisherServer

uint64_t __54__BMComputeXPCPublisherServer_subscriptionsForStream___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 postMigrationStreamIdentifiers];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (void)receiveInputForSubscription:(id)a3 streamIdentifier:(id)a4 storeEvent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v12);

  if (!v9)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherServer.m", 488, @"Invalid parameter not satisfying: %@", @"subscription" object file lineNumber description];
  }
  v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeXPCPublisherServer receiveInputForSubscription:streamIdentifier:storeEvent:]();
  }

  v14 = 0;
  if (v10)
  {
    if (v11)
    {
      id v27 = 0;
      v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v27];
      id v15 = v27;
      if (v15)
      {
        empty = v15;
        v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCPublisherServer receiveInputForSubscription:streamIdentifier:storeEvent:]();
        }
LABEL_14:

        goto LABEL_18;
      }
    }
  }
  if ([v9 waking])
  {
    empty = xpc_dictionary_create_empty();
    id v18 = [v9 identifier];
    xpc_dictionary_set_string(empty, "identifier", (const char *)[v18 UTF8String]);

    if (v14)
    {
      id v19 = v14;
      xpc_dictionary_set_data(empty, "event", (const void *)[v19 bytes], objc_msgSend(v19, "length"));
      xpc_dictionary_set_string(empty, "stream", (const char *)[v10 UTF8String]);
    }
    v17 = [(BMComputeXPCPublisherServer *)self publisher];
    [v9 token];
    xpc_event_publisher_fire();
    goto LABEL_14;
  }
  empty = [v9 connection];
  if (empty)
  {
    v20 = [v9 connection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke;
    v25[3] = &unk_1E55D7588;
    id v21 = v9;
    id v26 = v21;
    v22 = [v20 remoteObjectProxyWithErrorHandler:v25];

    v23 = [v21 identifier];
    [v22 receiveInputForIdentifier:v23 streamIdentifier:v10 storeEvent:v11];
  }
  else
  {
    [v9 setPendingDemand:1];
  }
LABEL_18:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (id)subscriptionsForStream:(id)a3
{
  id v5 = a3;
  v6 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherServer.m", 476, @"Invalid parameter not satisfying: %@", @"streamIdentifier" object file lineNumber description];
  }
  v7 = [(BMComputeXPCPublisherServer *)self subscriptions];
  v8 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__BMComputeXPCPublisherServer_subscriptionsForStream___block_invoke;
  v14[3] = &unk_1E55D7560;
  id v15 = v5;
  id v9 = v5;
  id v10 = [v8 predicateWithBlock:v14];
  id v11 = [v7 filteredArrayUsingPredicate:v10];

  return v11;
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (unint64_t)domain
{
  return self->_domain;
}

- (BMComputeXPCPublisherServer)initWithQueue:(id)a3 domain:(unint64_t)a4 delegate:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (a4 == 2)
  {
    v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BMComputeXPCPublisherServer initWithQueue:domain:delegate:]();
    }

    id v5 = +[BMDaemon systemComputePublisherServiceName];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v5];
    id v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BMComputeXPCPublisherServer initWithQueue:domain:delegate:]();
    }

    goto LABEL_11;
  }
  if (a4 == 1)
  {
    id v5 = +[BMDaemon systemComputePublisherServiceName];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v5];
LABEL_11:
    uint64_t v13 = +[BMDaemon systemComputePublisherStreamName];
    goto LABEL_12;
  }
  if (a4)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29290]), "initWithMachServiceName:");
    goto LABEL_14;
  }
  id v5 = +[BMDaemon userComputePublisherServiceName];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v5];
  uint64_t v13 = +[BMDaemon userComputePublisherStreamName];
LABEL_12:
  v6 = (void *)v13;
LABEL_14:
  v16 = [(BMComputeXPCPublisherServer *)self initWithQueue:v10 listener:v12 domain:a4 delegate:v11 computePublisherStreamName:v6];

  return v16;
}

- (BMComputeXPCPublisherServer)initWithQueue:(id)a3 listener:(id)a4 domain:(unint64_t)a5 delegate:(id)a6 computePublisherStreamName:(id)a7
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = a3;
  id v40 = a4;
  id v14 = a6;
  id v15 = a7;
  dispatch_assert_queue_V2(v13);
  v44.receiver = self;
  v44.super_class = (Class)BMComputeXPCPublisherServer;
  v16 = [(BMComputeXPCPublisherServer *)&v44 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_queue, a3);
    v17->_domain = a5;
    id v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subscriptions = v17->_subscriptions;
    v17->_subscriptions = v18;

    v20 = [BMComputeXPCPublisherStorage alloc];
    uint64_t v21 = *MEMORY[0x1E4F4FB08];
    uint64_t v22 = [(BMComputeXPCPublisherStorage *)v20 initWithUseCase:*MEMORY[0x1E4F4FB08] domain:1 isClient:0];
    systemStorage = v17->_systemStorage;
    v17->_systemStorage = (BMComputeXPCPublisherStorage *)v22;

    v24 = [[BMComputeXPCPublisherStorage alloc] initWithUseCase:v21 domain:0 isClient:0];
    userStorage = v17->_userStorage;
    v17->_userStorage = v24;

    id v26 = [[BMComputeSubscriptionMarkerManager alloc] initWithUserStorage:v17->_userStorage systemStorage:v17->_systemStorage domain:v17->_domain];
    subscriptionMarkerManager = v17->_subscriptionMarkerManager;
    v17->_subscriptionMarkerManager = v26;

    v28 = [(BMComputeXPCPublisherServer *)v17 storage];
    id v43 = 0;
    v29 = [v28 readNonWakingSubscriptions:&v43];
    id v30 = v43;

    if (v29)
    {
      [(NSMutableArray *)v17->_subscriptions addObjectsFromArray:v29];
    }
    else
    {
      v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherServer initWithQueue:listener:domain:delegate:computePublisherStreamName:]();
      }
    }
    objc_storeWeak((id *)&v17->_delegate, v14);
    id v32 = v15;
    [v32 UTF8String];
    uint64_t v33 = xpc_event_publisher_create();
    publisher = v17->_publisher;
    v17->_publisher = (OS_xpc_event_publisher *)v33;

    objc_initWeak(&location, v17);
    objc_copyWeak(&v41, &location);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    objc_storeStrong((id *)&v17->_listener, a4);
    [(NSXPCListener *)v17->_listener _setQueue:v13];
    [(NSXPCListener *)v17->_listener setDelegate:v17];
    uint64_t v35 = BMComputePublisherInterface();
    interface = v17->_interface;
    v17->_interface = (NSXPCInterface *)v35;

    v37 = __biome_log_for_category();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = [v40 serviceName];
      -[BMComputeXPCPublisherServer initWithQueue:listener:domain:delegate:computePublisherStreamName:]((uint64_t)v32, v38, buf, v37);
    }

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v17;
}

void __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handlePublisherAction:a2 token:a3 descriptor:v7];
}

void __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke_2()
{
  xpc_strerror();
  v0 = __biome_log_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke_2_cold_1();
  }
}

- (BMComputeXPCPublisherStorage)storage
{
  return self->_userStorage;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [MEMORY[0x1E4F4FB80] processWithXPCConnection:v7];
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v9 executableName];
    *(_DWORD *)buf = 138412546;
    id v30 = v11;
    __int16 v31 = 1024;
    int v32 = [v9 pid];
    _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_INFO, "BMComputePublisherServiceServer received new connection request from %@(%d)", buf, 0x12u);
  }
  v12 = [MEMORY[0x1E4F4FB38] policyForProcess:v9 connectionFlags:0 useCase:*MEMORY[0x1E4F4FB08]];
  char v13 = [v12 allowsConnectionToComputePublisherService];
  id v14 = __biome_log_for_category();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BMComputeXPCPublisherServer listener:shouldAcceptNewConnection:](v9);
    }

    v16 = [(BMComputeXPCPublisherServer *)self queue];
    [v7 _setQueue:v16];

    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v7);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke;
    v26[3] = &unk_1E55D74A0;
    objc_copyWeak(&v27, &location);
    [v7 setInterruptionHandler:v26];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    uint64_t v22 = __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke_10;
    v23 = &unk_1E55D74C8;
    objc_copyWeak(&v24, (id *)buf);
    objc_copyWeak(&v25, &location);
    [v7 setInvalidationHandler:&v20];
    v17 = [(BMComputeXPCPublisherServer *)self interface];
    [v7 setExportedInterface:v17];

    [v7 setExportedObject:self];
    id v18 = BMComputePublishingInterface();
    [v7 setRemoteObjectInterface:v18];

    [v7 resume];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherServer listener:shouldAcceptNewConnection:](v9, v15);
    }
  }
  return v13;
}

void __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_18E67D000, v2, OS_LOG_TYPE_DEFAULT, "BMComputePublisherServiceServer connection %@ interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void __66__BMComputeXPCPublisherServer_listener_shouldAcceptNewConnection___block_invoke_10(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 _xpcConnection];

    if (v5)
    {
      uint64_t v6 = [v4 _xpcConnection];
      id v7 = (void *)xpc_connection_copy_invalidation_reason();

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
  v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v41 = v4;
    __int16 v42 = 2114;
    id v43 = v5;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_INFO, "BMComputePublisherServiceServer connection %@ invalidated because %{public}@", buf, 0x16u);
  }
  v29 = v5;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = [WeakRetained subscriptions];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v16 = [v15 connection];

        if (v16 == v4)
        {
          id v17 = objc_alloc(MEMORY[0x1E4F50248]);
          id v18 = [v15 identifier];
          id v19 = [v15 client];
          uint64_t v20 = (void *)[v17 initWithFirst:v18 second:v19];

          [v9 addObject:v20];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v21 = v9;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        id v27 = [v26 first];
        v28 = [v26 second];
        [WeakRetained _removeSubscriptionWithIdentifier:v27 client:v28];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v23);
  }
}

- (void)subscribe:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeXPCPublisherServer subscribe:].cold.6();
  }

  if (v4)
  {
    id v7 = [v4 identifier];
    char IsPathSafe = BMIdentifierIsPathSafe();

    if (IsPathSafe)
    {
      id v9 = [MEMORY[0x1E4F4FA38] currentProcessValidator];
      id v10 = [v4 graph];
      char v11 = [v9 isExecutionAllowedForGraph:v10];

      if (v11)
      {
        uint64_t v12 = [MEMORY[0x1E4F29268] currentConnection];
        if (!v12)
        {
          uint64_t v13 = __biome_log_for_category();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[BMComputeXPCPublisherServer subscribe:](v13);
          }
          goto LABEL_36;
        }
        uint64_t v13 = [MEMORY[0x1E4F4FB80] processWithXPCConnection:v12];
        id v14 = (void *)MEMORY[0x1E4F4FB38];
        id v15 = [v4 useCase];
        v16 = [v14 policyForProcess:v13 connectionFlags:0 useCase:v15];

        id v17 = [v4 postMigrationStreamIdentifiers];
        char v18 = [v16 allowsComputePublisherAccessToStreams:v17];

        if ((v18 & 1) == 0)
        {
          long long v35 = __biome_log_for_category();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[BMComputeXPCPublisherServer subscribe:](v4);
          }

          goto LABEL_35;
        }
        id v19 = [v13 identifier];
        [v4 setClient:v19];

        [v4 setConnection:v12];
        if (([v4 waking] & 1) == 0)
        {
          uint64_t v20 = [(BMComputeXPCPublisherServer *)self subscriptions];
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __41__BMComputeXPCPublisherServer_subscribe___block_invoke;
          v47[3] = &unk_1E55D74F0;
          id v21 = v4;
          id v48 = v21;
          uint64_t v22 = [v20 indexesOfObjectsPassingTest:v47];

          if ([v22 count])
          {
            long long v37 = v16;
            v38 = v13;
            uint64_t v23 = __biome_log_for_category();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v21 client];
              id v25 = [v21 identifier];
              *(_DWORD *)buf = 138412546;
              v51 = v24;
              __int16 v52 = 2112;
              v53 = v25;
              _os_log_impl(&dword_18E67D000, v23, OS_LOG_TYPE_DEFAULT, "Found matching unclaimed subscription for %@:%@", buf, 0x16u);
            }
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v26 = [(BMComputeXPCPublisherServer *)self subscriptions];
            long long v36 = v22;
            id v27 = [v26 objectsAtIndexes:v22];

            uint64_t v28 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v44;
              do
              {
                for (uint64_t i = 0; i != v29; ++i)
                {
                  if (*(void *)v44 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  long long v32 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                  [v32 setConnection:v12];
                  if ([v32 pendingDemand])
                  {
                    long long v33 = [(BMComputeXPCPublisherServer *)self queue];
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __41__BMComputeXPCPublisherServer_subscribe___block_invoke_16;
                    block[3] = &unk_1E55D6878;
                    id v40 = v21;
                    id v41 = self;
                    __int16 v42 = v32;
                    dispatch_async(v33, block);
                  }
                  long long v34 = [(BMComputeXPCPublisherServer *)self delegate];
                  [v34 publisherServer:self didClaimSubscription:v32];
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
              }
              while (v29);
            }

            uint64_t v13 = v38;
            v16 = v37;
            goto LABEL_35;
          }
        }
        [(BMComputeXPCPublisherServer *)self _addSubscription:v4];
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherServer subscribe:].cold.4(v4);
      }
    }
    else
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[BMComputeXPCPublisherServer subscribe:].cold.5(v4);
      }
    }
  }
  else
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherServer subscribe:]();
    }
  }
LABEL_37:
}

uint64_t __41__BMComputeXPCPublisherServer_subscribe___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isUnclaimed])
  {
    id v4 = [v3 identifier];
    id v5 = [*(id *)(a1 + 32) identifier];
    if ([v4 isEqualToString:v5])
    {
      uint64_t v6 = [v3 client];
      id v7 = [*(id *)(a1 + 32) client];
      uint64_t v8 = [v6 isEqualToString:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __41__BMComputeXPCPublisherServer_subscribe___block_invoke_16(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_18E67D000, v2, OS_LOG_TYPE_DEFAULT, "Notify subscriber that there was pending demand from new events while subscription was unclaimed: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) receiveInputForSubscription:*(void *)(a1 + 48) streamIdentifier:0 storeEvent:0];
}

- (void)unsubscribeWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeXPCPublisherServer unsubscribeWithIdentifier:]();
  }

  if (v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F4FB80];
    uint64_t v8 = [MEMORY[0x1E4F29268] currentConnection];
    id v9 = [v7 processWithXPCConnection:v8];

    id v10 = [v9 identifier];
    char v11 = [(BMComputeXPCPublisherServer *)self storage];
    [v11 removeNonWakingSubscriptionWithIdentifier:v4 client:v10];

    [(BMComputeXPCPublisherServer *)self _removeSubscriptionWithIdentifier:v4 client:v10];
  }
  else
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMComputeXPCPublisherServer unsubscribeWithIdentifier:]();
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeXPCPublisherServer activateWithCompletion:](self);
  }

  [(BMComputeXPCPublisherServer *)self setActivationCompletion:v4];
  uint64_t v7 = [(BMComputeXPCPublisherServer *)self listener];
  [v7 activate];

  uint64_t v8 = [(BMComputeXPCPublisherServer *)self publisher];
  xpc_event_publisher_activate();
}

- (void)_handlePublisherAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v9);

  switch(a3)
  {
    case 2u:
      id v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_18E67D000, v17, OS_LOG_TYPE_INFO, "BMComputeXPCPublisher initial barrier", (uint8_t *)&v23, 2u);
      }

      char v18 = [(BMComputeXPCPublisherServer *)self activationCompletion];

      if (v18)
      {
        id v19 = [(BMComputeXPCPublisherServer *)self activationCompletion];
        v19[2]();

        [(BMComputeXPCPublisherServer *)self setActivationCompletion:0];
      }
      break;
    case 1u:
      uint64_t v20 = __biome_log_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [NSNumber numberWithUnsignedLongLong:a4];
        int v23 = 138412290;
        uint64_t v24 = v21;
        _os_log_impl(&dword_18E67D000, v20, OS_LOG_TYPE_INFO, "BMComputeXPCPublisher remove publisher for token %@", (uint8_t *)&v23, 0xCu);
      }
      [(BMComputeXPCPublisherServer *)self _removeSubscriptionWithToken:a4];
      break;
    case 0u:
      id v10 = (void *)MEMORY[0x192FB19F0](v8);
      char v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a4];
        int v23 = 138412546;
        uint64_t v24 = v12;
        __int16 v25 = 2080;
        id v26 = v10;
        _os_log_impl(&dword_18E67D000, v11, OS_LOG_TYPE_INFO, "BMComputeXPCPublisher add publisher for token %@ descriptor: %s", (uint8_t *)&v23, 0x16u);
      }
      uint64_t v13 = [[BMComputeXPCSubscription alloc] initWithToken:a4 descriptor:v8];
      if (v13)
      {
        id v14 = [MEMORY[0x1E4F4FA38] currentProcessValidator];
        id v15 = [(BMComputeXPCSubscription *)v13 graph];
        int v16 = [v14 isExecutionAllowedForGraph:v15];

        if (v16)
        {
          [(BMComputeXPCPublisherServer *)self _addSubscription:v13];
LABEL_21:
          free(v10);

          break;
        }
        uint64_t v22 = __biome_log_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCPublisherServer subscribe:].cold.4(v13);
        }
      }
      else
      {
        uint64_t v22 = __biome_log_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[BMComputeXPCPublisherServer _handlePublisherAction:token:descriptor:]();
        }
      }

      goto LABEL_21;
  }
}

- (void)_addSubscription:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherServer.m", 383, @"Invalid parameter not satisfying: %@", @"subscription" object file lineNumber description];
  }
  uint64_t v7 = [(BMComputeXPCPublisherServer *)self subscriptions];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __48__BMComputeXPCPublisherServer__addSubscription___block_invoke;
  v45[3] = &unk_1E55D74F0;
  id v8 = v5;
  id v46 = v8;
  id v9 = [v7 indexesOfObjectsPassingTest:v45];

  if ([v9 count])
  {
    id v10 = [(BMComputeXPCPublisherServer *)self subscriptions];
    char v11 = [v10 objectsAtIndexes:v9];

    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v8 identifier];
      *(_DWORD *)buf = 138412546;
      id v50 = v13;
      __int16 v51 = 2112;
      __int16 v52 = v11;
      _os_log_impl(&dword_18E67D000, v12, OS_LOG_TYPE_DEFAULT, "Warning: clearing unexpected subscriptions for identifier %@ while adding new subscription. %@", buf, 0x16u);
    }
    id v14 = [(BMComputeXPCPublisherServer *)self storage];
    id v15 = [v8 identifier];
    int v16 = [v8 client];
    [v14 removeBookmarkFileForSubscriptionWithIdentifier:v15 client:v16];

    id v17 = [(BMComputeXPCPublisherServer *)self subscriptions];
    [v17 removeObjectsAtIndexes:v9];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    char v18 = [v8 postMigrationStreamIdentifiers];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v24 = [(BMComputeXPCPublisherServer *)self subscriptionMarkerManager];
          [v24 removeSubscriptionWithStreamIdentifier:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v20);
    }
  }
  __int16 v25 = [(BMComputeXPCPublisherServer *)self subscriptions];
  [v25 addObject:v8];

  if (([v8 waking] & 1) == 0)
  {
    id v26 = [(BMComputeXPCPublisherServer *)self storage];
    [v26 writeNonWakingSubscription:v8];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v27 = [v8 postMigrationStreamIdentifiers];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        long long v33 = [(BMComputeXPCPublisherServer *)self subscriptionMarkerManager];
        [v33 addSubscriptionWithStreamIdentifier:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v29);
  }

  long long v34 = [(BMComputeXPCPublisherServer *)self delegate];
  [v34 publisherServer:self didAddSubscription:v8];

  long long v35 = __biome_log_for_category();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v8;
    _os_log_impl(&dword_18E67D000, v35, OS_LOG_TYPE_DEFAULT, "_addSubscription added subscription: %@", buf, 0xCu);
  }
}

uint64_t __48__BMComputeXPCPublisherServer__addSubscription___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) identifier];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [v3 client];
    uint64_t v7 = [*(id *)(a1 + 32) client];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_removeSubscriptionWithToken:(unint64_t)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(BMComputeXPCPublisherServer *)self subscriptions];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __60__BMComputeXPCPublisherServer__removeSubscriptionWithToken___block_invoke;
  v37[3] = &__block_descriptor_40_e41_B32__0__BMComputeXPCSubscription_8Q16_B24l;
  v37[4] = a3;
  uint64_t v7 = [v6 indexesOfObjectsPassingTest:v37];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v8 = [(BMComputeXPCPublisherServer *)self subscriptions];
  id v9 = [v8 objectsAtIndexes:v7];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
        id v15 = [(BMComputeXPCPublisherServer *)self storage];
        int v16 = [v14 identifier];
        id v17 = [v14 client];
        [v15 removeBookmarkFileForSubscriptionWithIdentifier:v16 client:v17];

        [(BMComputeXPCPublisherServer *)self _removeActiveSubscriptionMarkersForSubscription:v14];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v11);
  }

  char v18 = [(BMComputeXPCPublisherServer *)self subscriptions];
  uint64_t v19 = [v18 objectsAtIndexes:v7];

  uint64_t v20 = [(BMComputeXPCPublisherServer *)self subscriptions];
  [v20 removeObjectsAtIndexes:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v29 + 1) + 8 * v25);
        uint64_t v27 = [(BMComputeXPCPublisherServer *)self delegate];
        [v27 publisherServer:self didRemoveSubscription:v26];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v23);
  }

  uint64_t v28 = __biome_log_for_category();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v21;
    _os_log_impl(&dword_18E67D000, v28, OS_LOG_TYPE_DEFAULT, "_removeSubscriptionWithToken removed subscriptions: %@", buf, 0xCu);
  }
}

BOOL __60__BMComputeXPCPublisherServer__removeSubscriptionWithToken___block_invoke(uint64_t a1, void *a2)
{
  return [a2 token] == *(void *)(a1 + 32);
}

- (void)_removeSubscriptionWithIdentifier:(id)a3 client:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v9);

  if (!v7)
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherServer.m", 442, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v10 = [(BMComputeXPCPublisherServer *)self subscriptions];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __72__BMComputeXPCPublisherServer__removeSubscriptionWithIdentifier_client___block_invoke;
  v41[3] = &unk_1E55D7538;
  id v11 = v7;
  id v42 = v11;
  id v12 = v8;
  id v43 = v12;
  uint64_t v13 = [v10 indexesOfObjectsPassingTest:v41];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = [(BMComputeXPCPublisherServer *)self subscriptions];
  id v15 = [v14 objectsAtIndexes:v13];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v38;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v15);
        }
        [(BMComputeXPCPublisherServer *)self _removeActiveSubscriptionMarkersForSubscription:*(void *)(*((void *)&v37 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v17);
  }

  uint64_t v20 = [(BMComputeXPCPublisherServer *)self storage];
  [v20 removeBookmarkFileForSubscriptionWithIdentifier:v11 client:v12];

  id v21 = [(BMComputeXPCPublisherServer *)self subscriptions];
  uint64_t v22 = [v21 objectsAtIndexes:v13];

  uint64_t v23 = [(BMComputeXPCPublisherServer *)self subscriptions];
  [v23 removeObjectsAtIndexes:v13];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v34;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v34 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v33 + 1) + 8 * v28);
        long long v30 = [(BMComputeXPCPublisherServer *)self delegate];
        [v30 publisherServer:self didRemoveSubscription:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v26);
  }

  long long v31 = __biome_log_for_category();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v24;
    _os_log_impl(&dword_18E67D000, v31, OS_LOG_TYPE_DEFAULT, "_removeSubscriptionWithIdentifier removed subscriptions: %@", buf, 0xCu);
  }
}

uint64_t __72__BMComputeXPCPublisherServer__removeSubscriptionWithIdentifier_client___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 client];
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_removeActiveSubscriptionMarkersForSubscription:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(BMComputeXPCPublisherServer *)self queue];
  dispatch_assert_queue_V2(v6);

  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BMComputeXPCPublisherServer.m", 465, @"Invalid parameter not satisfying: %@", @"subscription" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v5 postMigrationStreamIdentifiers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        uint64_t v13 = [(BMComputeXPCPublisherServer *)self subscriptionMarkerManager];
        [v13 removeSubscriptionWithStreamIdentifier:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

void __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke_cold_1();
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = BMStringForServiceDomain();
  id v7 = [(BMComputeXPCPublisherServer *)self listener];
  uint64_t v8 = [v7 serviceName];
  uint64_t v9 = (void *)[v3 initWithFormat:@"%@ for domain: %@, listener: %@", v5, v6, v8];

  return (NSString *)v9;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (BMComputeSubscriptionMarkerManager)subscriptionMarkerManager
{
  return self->_subscriptionMarkerManager;
}

- (id)activationCompletion
{
  return self->_activationCompletion;
}

- (void)setActivationCompletion:(id)a3
{
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (BMComputeXPCPublisherServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BMComputeXPCPublisherServerDelegate *)WeakRetained;
}

- (BMComputeXPCPublisherStorage)systemStorage
{
  return self->_systemStorage;
}

- (BMComputeXPCPublisherStorage)userStorage
{
  return self->_userStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorage, 0);
  objc_storeStrong((id *)&self->_systemStorage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong(&self->_activationCompletion, 0);
  objc_storeStrong((id *)&self->_subscriptionMarkerManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithQueue:domain:delegate:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_18E67D000, v0, OS_LOG_TYPE_FAULT, "BMComputePublisherStreamNameForDomain could not determine publisher stream name for BMServiceDomainCount", v1, 2u);
}

- (void)initWithQueue:domain:delegate:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_18E67D000, v0, OS_LOG_TYPE_FAULT, "BMComputePublisherStreamNameForDomain could not determine publisher server mach service name for BMServiceDomainCount", v1, 2u);
}

- (void)initWithQueue:(uint8_t *)buf listener:(os_log_t)log domain:delegate:computePublisherStreamName:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "BMComputePublisherServiceServer publisherName: %@, listenerName: %@", buf, 0x16u);
}

- (void)initWithQueue:listener:domain:delegate:computePublisherStreamName:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMComputeXPCPublisherServer failed to read non-waking subscriptions on init, %@", v1, 0xCu);
}

void __97__BMComputeXPCPublisherServer_initWithQueue_listener_domain_delegate_computePublisherStreamName___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = [NSNumber numberWithInt:v1];
  id v3 = [NSString stringWithUTF8String:v0];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v4, v5, "BMComputeXPCPublisher xpc publisher error: %@ %@", v6, v7, v8, v9, v10);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  uint64_t v2 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x12u);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  os_log_t v4 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMComputePublisherServiceServer refusing connection from %{public}@(%d), process lacks entitlements", v5, 0x12u);
}

- (void)subscribe:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMComputeXPCPublisherServer dropping subscribe: due to nil subscription", v1, 2u);
}

- (void)subscribe:(os_log_t)log .cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "BMComputeXPCPublisherServer dropping subscribe: due to dead connection %@", (uint8_t *)&v1, 0xCu);
}

- (void)subscribe:(void *)a1 .cold.3(void *a1)
{
  int v1 = [a1 streamIdentifiers];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "Rejecting subscribe: due to lacking read entitlements for streams %@", v4, v5, v6, v7, v8);
}

- (void)subscribe:(void *)a1 .cold.4(void *a1)
{
  int v1 = [a1 graph];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMComputeXPCSubscription cannot execute graph: %@", v4, v5, v6, v7, v8);
}

- (void)subscribe:(void *)a1 .cold.5(void *a1)
{
  int v1 = [a1 identifier];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMComputeXPCPublisherServer dropping subscribe: invalid identifier %@", v4, v5, v6, v7, v8);
}

- (void)subscribe:.cold.6()
{
  OUTLINED_FUNCTION_4();
  int v1 = [*(id *)(v0 + 24) serviceName];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x20u);
}

- (void)unsubscribeWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "BMComputePublisherServiceServerConnection dropping unsubscribeWithIdentifier: due to nil identifier", v1, 2u);
}

- (void)unsubscribeWithIdentifier:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_18E67D000, v0, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)v1, 0x16u);
}

- (void)activateWithCompletion:(void *)a1 .cold.1(void *a1)
{
  int v1 = [a1 listener];
  uint64_t v2 = [v1 serviceName];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0xCu);
}

- (void)_handlePublisherAction:token:descriptor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  int v1 = [NSNumber numberWithUnsignedLongLong:v0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_18E67D000, v2, v3, "BMComputeXPCSubscription cannot be initialized with provided token %@ and descriptor: %s", v4, v5, v6, v7, v8);
}

- (void)receiveInputForSubscription:streamIdentifier:storeEvent:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18E67D000, v1, OS_LOG_TYPE_ERROR, "Failed to archive store event for stream %@ %@", v2, 0x16u);
}

- (void)receiveInputForSubscription:streamIdentifier:storeEvent:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_18E67D000, v0, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)v1, 0x16u);
}

void __87__BMComputeXPCPublisherServer_receiveInputForSubscription_streamIdentifier_storeEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [*(id *)(v2 + 32) connection];
  OUTLINED_FUNCTION_2_2();
  __int16 v6 = v4;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_18E67D000, v0, OS_LOG_TYPE_ERROR, "Error notifying client for subscription %@ with connection %@ error: %@", v5, 0x20u);
}

@end