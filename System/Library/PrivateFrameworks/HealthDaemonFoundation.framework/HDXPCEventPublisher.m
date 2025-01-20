@interface HDXPCEventPublisher
- (HDXPCEventPublisher)initWithStream:(const char *)a3 entitlement:(const char *)a4;
- (void)_handleEventAction:(uint64_t)a3 token:(void *)a4 descriptor:;
- (void)_queue_addSubscriberForToken:(void *)a3 descriptor:;
- (void)_queue_removeSubscriberForToken:(uint64_t)a1;
- (void)_queue_sendEventWithXPCObject:(uint64_t)a1;
- (void)_queue_sendPendingEvents;
- (void)broadcastEvent:(id)a3;
@end

@implementation HDXPCEventPublisher

- (HDXPCEventPublisher)initWithStream:(const char *)a3 entitlement:(const char *)a4
{
  v19.receiver = self;
  v19.super_class = (Class)HDXPCEventPublisher;
  v5 = [(HDXPCEventPublisher *)&v19 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingEvents = v5->_pendingEvents;
    v5->_pendingEvents = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingSubscribers = v5->_pendingSubscribers;
    v5->_pendingSubscribers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    subscribers = v5->_subscribers;
    v5->_subscribers = v12;

    v5->_requiredEntitlement = a4;
    if ((HDIsUnitTesting() & 1) == 0)
    {
      uint64_t v14 = xpc_event_publisher_create();
      publisher = v5->_publisher;
      v5->_publisher = (OS_xpc_event_publisher *)v14;

      objc_initWeak(&location, v5);
      objc_copyWeak(&v17, &location);
      xpc_event_publisher_set_handler();
      xpc_event_publisher_set_error_handler();
      xpc_event_publisher_activate();
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return v5;
}

void __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  -[HDXPCEventPublisher _handleEventAction:token:descriptor:]((uint64_t)WeakRetained, a2, a3, v7);
}

- (void)_handleEventAction:(uint64_t)a3 token:(void *)a4 descriptor:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    v8 = HKLogInfrastructure();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      v10 = HKLogInfrastructure();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = a1;
        __int16 v18 = 1024;
        int v19 = a2;
        __int16 v20 = 2048;
        uint64_t v21 = a3;
        _os_log_impl(&dword_21BFB4000, v10, OS_LOG_TYPE_INFO, "%{public}@: Handling XPC event action %d for %llu", buf, 0x1Cu);
      }
    }
    v11 = *(NSObject **)(a1 + 8);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__HDXPCEventPublisher__handleEventAction_token_descriptor___block_invoke;
    v12[3] = &unk_2643D46F0;
    int v15 = a2;
    v12[4] = a1;
    uint64_t v14 = a3;
    id v13 = v7;
    dispatch_async(v11, v12);
  }
}

void __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke_2(uint64_t a1, int a2)
{
  _HKInitializeLogging();
  v3 = HKLogInfrastructure();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke_2_cold_1(a2, v3);
  }
}

void __59__HDXPCEventPublisher__handleEventAction_token_descriptor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    -[HDXPCEventPublisher _queue_sendPendingEvents](v8);
  }
  else if (v2 == 1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    -[HDXPCEventPublisher _queue_removeSubscriberForToken:](v6, v7);
  }
  else if (v2)
  {
    _HKInitializeLogging();
    BOOL v9 = HKLogInfrastructure();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(_DWORD *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 48);
      v12[0] = 67109376;
      v12[1] = v10;
      __int16 v13 = 2048;
      uint64_t v14 = v11;
      _os_log_impl(&dword_21BFB4000, v9, OS_LOG_TYPE_DEFAULT, "Unexpected XPC event action %d from %llu", (uint8_t *)v12, 0x12u);
    }
  }
  else
  {
    v4 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    -[HDXPCEventPublisher _queue_addSubscriberForToken:descriptor:](v5, v3, v4);
  }
}

- (void)_queue_addSubscriberForToken:(void *)a3 descriptor:
{
  id v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a2];
    [v6 addObject:v7];

    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    id v9 = v5;
    xpc_event_publisher_fire_with_reply();
  }
}

- (void)_queue_removeSubscriberForToken:(uint64_t)a1
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithUnsignedLongLong:a2];
    [v4 removeObject:v5];

    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a2];
    [v6 removeObjectForKey:v7];

    _HKInitializeLogging();
    xpc_object_t v8 = HKLogInfrastructure();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = a2;
      _os_log_impl(&dword_21BFB4000, v8, OS_LOG_TYPE_DEFAULT, "Removed XPC event subscriber %llu", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_queue_sendPendingEvents
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = *(id *)(a1 + 24);
    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[HDXPCEventPublisher _queue_sendEventWithXPCObject:](a1, *(void **)(*((void *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke(void *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogInfrastructure();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    uint64_t v6 = HKLogInfrastructure();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = a1[6];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_21BFB4000, v6, OS_LOG_TYPE_INFO, "Received XPC event reply from %llu", buf, 0xCu);
    }
  }
  uint64_t v8 = a1 + 6;
  long long v9 = *(void **)(a1[4] + 32);
  long long v10 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  LOBYTE(v9) = [v9 containsObject:v10];

  if (v9)
  {
    long long v11 = *(void **)(a1[4] + 32);
    long long v12 = [NSNumber numberWithUnsignedLongLong:a1[6]];
    [v11 removeObject:v12];

    uint64_t v13 = MEMORY[0x21D49FD90](v3);
    if (v13 != MEMORY[0x263EF8708])
    {
      uint64_t v14 = (const _xpc_type_s *)v13;
      uint64_t v15 = (const _xpc_type_s *)MEMORY[0x263EF8720];
      _HKInitializeLogging();
      v16 = HKLogInfrastructure();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v14 == v15)
      {
        if (v17) {
          __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_2((int)v8, v3);
        }
      }
      else if (v17)
      {
        __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_3((int)v8, v14);
      }
LABEL_19:

      goto LABEL_27;
    }
    *(_OWORD *)buf = 0u;
    long long v36 = 0u;
    xpc_dictionary_get_audit_token();
    __int16 v20 = (void *)xpc_copy_code_signing_identity_for_token();
    uint64_t v21 = (void *)xpc_copy_entitlement_for_token();
    uint64_t v22 = v21;
    if (v21)
    {
      if (xpc_BOOL_get_value(v21))
      {
        v23 = objc_msgSend(NSDictionary, "hd_dictionaryFromXPCObject:", a1[5]);
        v24 = *(void **)(a1[4] + 40);
        v25 = [NSNumber numberWithUnsignedLongLong:a1[6]];
        [v24 setObject:v23 forKeyedSubscript:v25];

        _HKInitializeLogging();
        v26 = HKLogInfrastructure();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = *v8;
          int v31 = 136315394;
          v32 = v20;
          __int16 v33 = 2048;
          uint64_t v34 = v27;
          v28 = "Registered XPC event subscriber %s:%llu";
LABEL_25:
          _os_log_impl(&dword_21BFB4000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v31, 0x16u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else
    {
      _HKInitializeLogging();
      v29 = HKLogInfrastructure();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_1((uint64_t)v20, v8, v29);
      }
    }
    _HKInitializeLogging();
    v26 = HKLogInfrastructure();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *v8;
      int v31 = 136315394;
      v32 = v20;
      __int16 v33 = 2048;
      uint64_t v34 = v30;
      v28 = "XPC event client %s:%llu is not entitled for subscription";
      goto LABEL_25;
    }
LABEL_26:

    free(v20);
    goto LABEL_27;
  }
  _HKInitializeLogging();
  __int16 v18 = HKLogInfrastructure();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    v16 = HKLogInfrastructure();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_4(a1 + 6, v16);
    }
    goto LABEL_19;
  }
LABEL_27:
}

- (void)_queue_sendEventWithXPCObject:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [*(id *)(a1 + 40) allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v5) {
      goto LABEL_17;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 134218240;
    long long v18 = v6;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        objc_msgSend(v10, "intValue", v18);
        int v11 = xpc_event_publisher_fire();
        _HKInitializeLogging();
        long long v12 = HKLogInfrastructure();
        uint64_t v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            int v16 = [v10 intValue];
            *(_DWORD *)buf = v18;
            uint64_t v24 = v16;
            __int16 v25 = 1024;
            int v26 = v11;
            _os_log_error_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_ERROR, "Failed to publish XPC event for %ld with error: %d", buf, 0x12u);
          }
LABEL_10:

          goto LABEL_11;
        }
        BOOL v14 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

        if (v14)
        {
          uint64_t v13 = HKLogInfrastructure();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v15 = [v10 intValue];
            *(_DWORD *)buf = 134217984;
            uint64_t v24 = v15;
            _os_log_impl(&dword_21BFB4000, v13, OS_LOG_TYPE_INFO, "Published XPC event for %ld", buf, 0xCu);
          }
          goto LABEL_10;
        }
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v17 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      uint64_t v7 = v17;
      if (!v17)
      {
LABEL_17:

        break;
      }
    }
  }
}

- (void)broadcastEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HDXPCEventPublisher_broadcastEvent___block_invoke;
  v7[3] = &unk_2643D45C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __38__HDXPCEventPublisher_broadcastEvent___block_invoke(uint64_t a1)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x263F0A068], 1);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v2 + 24))
  {
    id v4 = *(void **)(v2 + 24);
    [v4 addObject:v3];
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    -[HDXPCEventPublisher _queue_sendEventWithXPCObject:](v2, v5);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_pendingSubscribers, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_publisher, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_ERROR, "Received XPC event error %d", (uint8_t *)v2, 8u);
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_21BFB4000, log, OS_LOG_TYPE_ERROR, "XPC event entitlement not found for %s:%llu", (uint8_t *)&v4, 0x16u);
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_2(int a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21BFB4000, v2, v3, "XPC event client %llu replied with error: %s", v4, v5, v6, v7, v8);
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_3(int a1, xpc_type_t type)
{
  xpc_type_get_name(type);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21BFB4000, v2, v3, "XPC event client %llu replied with unexpected type %s", v4, v5, v6, v7, v8);
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_4(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21BFB4000, a2, OS_LOG_TYPE_DEBUG, "XPC event client %llu unsubscribed before replying to ping", (uint8_t *)&v3, 0xCu);
}

@end