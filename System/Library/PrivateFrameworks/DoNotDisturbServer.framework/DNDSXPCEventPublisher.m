@interface DNDSXPCEventPublisher
- (DNDSXPCEventPublisher)initWithStream:(const char *)a3;
- (void)_handleEventAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)_queue_addSubscriberForToken:(unint64_t)a3 descriptor:(id)a4;
- (void)_queue_removeSubscriberForToken:(unint64_t)a3;
- (void)_queue_sendEventWithXPCObject:(id)a3;
- (void)_queue_sendPendingEvents;
- (void)broadcastEvent:(id)a3;
@end

@implementation DNDSXPCEventPublisher

- (DNDSXPCEventPublisher)initWithStream:(const char *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DNDSXPCEventPublisher;
  v3 = [(DNDSXPCEventPublisher *)&v15 init];
  if (v3)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    uint64_t v6 = xpc_event_publisher_create();
    publisher = v3->_publisher;
    v3->_publisher = (OS_xpc_event_publisher *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingEvents = v3->_pendingEvents;
    v3->_pendingEvents = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    subscribers = v3->_subscribers;
    v3->_subscribers = v10;

    objc_initWeak(&location, v3);
    objc_copyWeak(&v13, &location);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__DNDSXPCEventPublisher_initWithStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleEventAction:a2 token:a3 descriptor:v7];
}

void __40__DNDSXPCEventPublisher_initWithStream___block_invoke_2(uint64_t a1, int a2)
{
  v3 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_ERROR)) {
    __40__DNDSXPCEventPublisher_initWithStream___block_invoke_2_cold_1(a2, v3);
  }
}

- (void)_handleEventAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_INFO, "%{public}@: Handling XPC event action %d for %llu", buf, 0x1Cu);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__DNDSXPCEventPublisher__handleEventAction_token_descriptor___block_invoke;
  v12[3] = &unk_1E6974D40;
  unsigned int v15 = a3;
  id v13 = v8;
  unint64_t v14 = a4;
  v12[4] = self;
  id v11 = v8;
  dispatch_async(queue, v12);
}

void __61__DNDSXPCEventPublisher__handleEventAction_token_descriptor___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 2)
  {
    id v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "_queue_sendPendingEvents");
  }
  else if (v2 == 1)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 48);
    objc_msgSend(v6, "_queue_removeSubscriberForToken:", v7);
  }
  else if (v2)
  {
    v9 = DNDSLogXPCEventPublisher;
    if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(_DWORD *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 48);
      v12[0] = 67109376;
      v12[1] = v10;
      __int16 v13 = 2048;
      uint64_t v14 = v11;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Unexpected XPC event action %d from %llu", (uint8_t *)v12, 0x12u);
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "_queue_addSubscriberForToken:descriptor:", v3, v4);
  }
}

- (void)_queue_addSubscriberForToken:(unint64_t)a3 descriptor:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6 || MEMORY[0x1D9430DD0](v6) != MEMORY[0x1E4F14590])
  {
LABEL_3:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  uint64_t v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v7)
  {
    uint64_t v11 = DNDSLogXPCEventPublisher;
    if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_ERROR)) {
      -[DNDSXPCEventPublisher _queue_addSubscriberForToken:descriptor:](v11);
    }
    goto LABEL_3;
  }
LABEL_4:
  subscribers = self->_subscribers;
  v9 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)subscribers setObject:v7 forKeyedSubscript:v9];

  int v10 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    unint64_t v13 = a3;
    _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Registered XPC event subscriber %llu", (uint8_t *)&v12, 0xCu);
  }
}

- (void)_queue_removeSubscriberForToken:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  subscribers = self->_subscribers;
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)subscribers removeObjectForKey:v6];

  uint64_t v7 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Removed XPC event subscriber %llu", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_queue_sendPendingEvents
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = self->_pendingEvents;
  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = v3;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[DNDSXPCEventPublisher _queue_sendEventWithXPCObject:](self, "_queue_sendEventWithXPCObject:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_queue_sendEventWithXPCObject:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = [(NSMutableDictionary *)self->_subscribers allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 134218240;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "intValue", v19);
        int v12 = xpc_event_publisher_fire();
        long long v13 = (void *)DNDSLogXPCEventPublisher;
        if (v12)
        {
          int v14 = v12;
          if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = v13;
            int v16 = [v11 intValue];
            *(_DWORD *)buf = v19;
            uint64_t v25 = v16;
            __int16 v26 = 1024;
            int v27 = v14;
            _os_log_error_impl(&dword_1D3052000, v15, OS_LOG_TYPE_ERROR, "Failed to publish XPC event for %ld with error: %d", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_INFO))
        {
          v17 = v13;
          int v18 = [v11 intValue];
          *(_DWORD *)buf = 134217984;
          uint64_t v25 = v18;
          _os_log_impl(&dword_1D3052000, v17, OS_LOG_TYPE_INFO, "Published XPC event for %ld", buf, 0xCu);
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)broadcastEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__DNDSXPCEventPublisher_broadcastEvent___block_invoke;
  v7[3] = &unk_1E69735B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __40__DNDSXPCEventPublisher_broadcastEvent___block_invoke(uint64_t a1)
{
  int v2 = *(id **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[3]) {
    return [v2[3] addObject:v3];
  }
  else {
    return objc_msgSend(v2, "_queue_sendEventWithXPCObject:", v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__DNDSXPCEventPublisher_initWithStream___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Received XPC event error %d", (uint8_t *)v2, 8u);
}

- (void)_queue_addSubscriberForToken:(os_log_t)log descriptor:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Failed to convert XPC dictionary to CF dictionary", v1, 2u);
}

@end