@interface GCXPCEventPublisher
- (BOOL)isStatefulEventPublisher;
- (BOOL)receivedInitialBarrier;
- (GCXPCEventPublisher)initWithStreamName:(id)a3;
- (GCXPCEventPublisher)initWithStreamName:(id)a3 isStatefulEventPublisher:(BOOL)a4;
- (NSMutableArray)pendingSendEvents;
- (NSMutableSet)tokens;
- (NSString)streamName;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (OS_xpc_object)stateEvent;
- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 toSubscriber:(id)a4;
- (void)setPendingSendEvents:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivedInitialBarrier:(BOOL)a3;
- (void)setStateEvent:(id)a3;
- (void)setStatefulEventPublisher:(BOOL)a3;
- (void)setStreamName:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation GCXPCEventPublisher

- (GCXPCEventPublisher)initWithStreamName:(id)a3
{
  return [(GCXPCEventPublisher *)self initWithStreamName:a3 isStatefulEventPublisher:0];
}

- (GCXPCEventPublisher)initWithStreamName:(id)a3 isStatefulEventPublisher:(BOOL)a4
{
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GCXPCEventPublisher;
  v8 = [(GCXPCEventPublisher *)&v26 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_streamName, a3);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create([(NSString *)v9->_streamName UTF8String], v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    id v13 = v7;
    [v13 UTF8String];
    uint64_t v14 = xpc_event_publisher_create();
    publisher = v9->_publisher;
    v9->_publisher = (OS_xpc_event_publisher *)v14;

    uint64_t v16 = +[NSMutableSet set];
    tokens = v9->_tokens;
    v9->_tokens = (NSMutableSet *)v16;

    v9->_statefulEventPublisher = a4;
    if (!a4)
    {
      uint64_t v18 = +[NSMutableArray array];
      pendingSendEvents = v9->_pendingSendEvents;
      v9->_pendingSendEvents = (NSMutableArray *)v18;
    }
    if (v9->_publisher)
    {
      objc_initWeak(&location, v9);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke;
      v23[3] = &unk_26D22BE60;
      objc_copyWeak(&v24, &location);
      v20 = (void *)MEMORY[0x223C6E420](v23);
      xpc_event_publisher_set_handler();
      id v22 = v13;
      xpc_event_publisher_set_error_handler();
      xpc_event_publisher_activate();

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
  return v9;
}

void __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained handleEventWithAction:a2 token:a3 descriptor:v7];
}

void __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (gc_isInternalBuild())
  {
    v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke_2_cold_1(a1, a2, v4);
    }
  }
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x223C6E8D0](v8);
    if (!gc_isInternalBuild())
    {
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_4;
    }
    v21 = getGCLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      streamName = self->_streamName;
      *(_DWORD *)buf = 138544130;
      v33 = streamName;
      __int16 v34 = 1024;
      unsigned int v35 = a3;
      __int16 v36 = 2048;
      unint64_t v37 = a4;
      __int16 v38 = 2080;
      v39 = v10;
      _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu: %s", buf, 0x26u);
    }

    if (v10) {
LABEL_4:
    }
      free(v10);
  }
  else if (gc_isInternalBuild())
  {
    v23 = getGCLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = self->_streamName;
      *(_DWORD *)buf = 138543874;
      v33 = v24;
      __int16 v34 = 1024;
      unsigned int v35 = a3;
      __int16 v36 = 2048;
      unint64_t v37 = a4;
      _os_log_impl(&dword_220998000, v23, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu", buf, 0x1Cu);
    }
  }
LABEL_6:
  if (a3)
  {
    if (a3 == 1)
    {
      tokens = self->_tokens;
      id v14 = +[NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableSet *)tokens removeObject:v14];
      goto LABEL_25;
    }
    if (a3 == 2)
    {
      if (gc_isInternalBuild())
      {
        v25 = getGCLogger();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_super v26 = self->_streamName;
          *(_DWORD *)buf = 138543362;
          v33 = v26;
          _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ received initial barrier", buf, 0xCu);
        }
      }
      self->_receivedInitialBarrier = 1;
      if (self->_statefulEventPublisher && self->_stateEvent)
      {
        -[GCXPCEventPublisher sendEvent:](self, "sendEvent:");
        goto LABEL_26;
      }
      uint64_t v16 = (void *)[(NSMutableArray *)self->_pendingSendEvents copy];
      [(NSMutableArray *)self->_pendingSendEvents removeAllObjects];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v16;
      uint64_t v17 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v14);
            }
            -[GCXPCEventPublisher sendEvent:](self, "sendEvent:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
          }
          uint64_t v18 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v18);
      }

LABEL_25:
    }
  }
  else
  {
    dispatch_queue_t v11 = self->_tokens;
    v12 = +[NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableSet *)v11 addObject:v12];

    if (self->_statefulEventPublisher)
    {
      stateEvent = self->_stateEvent;
      if (stateEvent)
      {
        id v14 = +[NSNumber numberWithUnsignedLongLong:a4];
        [(GCXPCEventPublisher *)self sendEvent:stateEvent toSubscriber:v14];
        goto LABEL_25;
      }
    }
  }
LABEL_26:
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __33__GCXPCEventPublisher_sendEvent___block_invoke;
  v7[3] = &unk_26D22A8E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __33__GCXPCEventPublisher_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    objc_storeStrong((id *)(v2 + 48), *(id *)(a1 + 40));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  int v3 = *(unsigned __int8 *)(v2 + 9);
  int isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      v15 = getGCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(void **)(a1 + 40);
        uint64_t v18 = *(void *)(v16 + 24);
        int v19 = [*(id *)(v16 + 56) count];
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v18;
        __int16 v29 = 2114;
        long long v30 = v17;
        __int16 v31 = 1024;
        LODWORD(v32) = v19;
        _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ sending xpc event %{public}@ to %u clients", buf, 0x1Cu);
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 56);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
          [v10 unsignedLongLongValue];
          if (xpc_event_publisher_fire() && gc_isInternalBuild())
          {
            dispatch_queue_t v11 = getGCLogger();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 24);
              uint64_t v12 = xpc_strerror();
              *(_DWORD *)buf = 138543874;
              uint64_t v28 = v22;
              __int16 v29 = 2112;
              long long v30 = v10;
              __int16 v31 = 2080;
              uint64_t v32 = v12;
              _os_log_error_impl(&dword_220998000, v11, OS_LOG_TYPE_ERROR, "Failed to send event to XPC event stream %{public}@ for token %@: %s", buf, 0x20u);
            }
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v13 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
        uint64_t v7 = v13;
      }
      while (v13);
    }
  }
  else
  {
    if (isInternalBuild)
    {
      v20 = getGCLogger();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v21;
        _os_log_impl(&dword_220998000, v20, OS_LOG_TYPE_INFO, "Have not received initial barrier; not sending %@",
          buf,
          0xCu);
      }
    }
    uint64_t v14 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v14 + 8)) {
      [*(id *)(v14 + 40) addObject:*(void *)(a1 + 40)];
    }
  }
}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__GCXPCEventPublisher_sendEvent_toSubscriber___block_invoke;
  block[3] = &unk_26D22B618;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __46__GCXPCEventPublisher_sendEvent_toSubscriber___block_invoke(void *a1)
{
  if (*(unsigned char *)(a1[4] + 9))
  {
    if (gc_isInternalBuild())
    {
      uint64_t v2 = getGCLogger();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = a1[5];
        uint64_t v4 = *(void *)(a1[4] + 24);
        uint64_t v5 = a1[6];
        *(_DWORD *)buf = 138543874;
        uint64_t v11 = v4;
        __int16 v12 = 2114;
        uint64_t v13 = v3;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        _os_log_impl(&dword_220998000, v2, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ sending xpc event %{public}@ to client %@", buf, 0x20u);
      }
    }
    [(id)a1[6] unsignedLongLongValue];
    if (xpc_event_publisher_fire() && gc_isInternalBuild())
    {
      id v6 = getGCLogger();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1[4] + 24);
        uint64_t v8 = a1[6];
        uint64_t v9 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        uint64_t v15 = v9;
        _os_log_error_impl(&dword_220998000, v6, OS_LOG_TYPE_ERROR, "Failed to send event to XPC event stream %{public}@ for token %@: %s", buf, 0x20u);
      }
    }
  }
}

- (BOOL)isStatefulEventPublisher
{
  return self->_statefulEventPublisher;
}

- (void)setStatefulEventPublisher:(BOOL)a3
{
  self->_statefulEventPublisher = a3;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
}

- (OS_xpc_object)stateEvent
{
  return self->_stateEvent;
}

- (void)setStateEvent:(id)a3
{
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (BOOL)receivedInitialBarrier
{
  return self->_receivedInitialBarrier;
}

- (void)setReceivedInitialBarrier:(BOOL)a3
{
  self->_receivedInitialBarrier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_stateEvent, 0);
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);

  objc_storeStrong((id *)&self->_publisher, 0);
}

void __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 2080;
  uint64_t v8 = xpc_strerror();
  _os_log_error_impl(&dword_220998000, a3, OS_LOG_TYPE_ERROR, "Unexpected error from XPC event publisher for stream %{public}@: %s", (uint8_t *)&v5, 0x16u);
}

@end