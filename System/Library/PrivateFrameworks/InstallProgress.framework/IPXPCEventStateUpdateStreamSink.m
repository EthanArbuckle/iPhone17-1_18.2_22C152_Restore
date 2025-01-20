@interface IPXPCEventStateUpdateStreamSink
- (IPXPCEventStateUpdateStreamSink)initWithQueue:(id)a3 streamName:(id)a4;
- (void)_queue_processPublisherEventAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)resume;
- (void)sendUpdateMessage:(id)a3;
- (void)subscriber:(id)a3 firePayload:(id)a4;
- (void)subscriber:(id)a3 firePayload:(id)a4 withReply:(id)a5;
- (void)subscriberFailedHandshake:(id)a3;
@end

@implementation IPXPCEventStateUpdateStreamSink

- (IPXPCEventStateUpdateStreamSink)initWithQueue:(id)a3 streamName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IPXPCEventStateUpdateStreamSink;
  v9 = [(IPXPCEventStateUpdateStreamSink *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    streamName = v9->_streamName;
    v9->_streamName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    [v8 UTF8String];
    uint64_t v12 = xpc_event_publisher_create();
    publisher = v9->_publisher;
    v9->_publisher = (OS_xpc_event_publisher *)v12;

    objc_initWeak(&location, v9);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    subscribers = v9->_subscribers;
    v9->_subscribers = v14;

    objc_copyWeak(&v17, &location);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_queue_processPublisherEventAction:token:descriptor:", a2, a3, v7);
}

void __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke_2(uint64_t a1, int a2)
{
  v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke_2_cold_1(a2, v3);
  }
}

- (void)_queue_processPublisherEventAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = _IPServerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)IPXPCCopyDescription((uint64_t)v8);
    int v21 = 134218498;
    uint64_t v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_252AA9000, v9, OS_LOG_TYPE_DEFAULT, "event action: %lld token: %llu descriptor: %@", (uint8_t *)&v21, 0x20u);
  }
  if (a3 == 1)
  {
    subscribers = self->_subscribers;
    id v17 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableDictionary *)subscribers setObject:0 forKeyedSubscript:v17];
LABEL_11:

    goto LABEL_12;
  }
  if (!a3)
  {
    v11 = self->_subscribers;
    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:a4];
    v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];

    if (v13)
    {
      v14 = _IPServerLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[IPXPCEventStateUpdateStreamSink _queue_processPublisherEventAction:token:descriptor:](a4, v14);
      }

      v15 = self->_subscribers;
      v16 = [NSNumber numberWithUnsignedLongLong:a4];
      [(NSMutableDictionary *)v15 setObject:0 forKeyedSubscript:v16];
    }
    id v17 = [[IPXPCEventStateUpdateStreamSubscriber alloc] initWithToken:a4];
    [(IPXPCEventStateUpdateStreamSubscriber *)v17 setDelegate:self];
    v18 = self->_subscribers;
    objc_super v19 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

    [(IPXPCEventStateUpdateStreamSubscriber *)v17 beginHandshake];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)resume
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  self->_resumed = 1;
  v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    streamName = self->_streamName;
    int v5 = 138412290;
    v6 = streamName;
    _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "Activating publisher for %@", (uint8_t *)&v5, 0xCu);
  }

  xpc_event_publisher_activate();
}

- (void)sendUpdateMessage:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__IPXPCEventStateUpdateStreamSink_sendUpdateMessage___block_invoke;
  v7[3] = &unk_26538F700;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __53__IPXPCEventStateUpdateStreamSink_sendUpdateMessage___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) sendOrEnqueueUpdateMessage:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)subscriber:(id)a3 firePayload:(id)a4 withReply:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [a3 token];
  xpc_event_publisher_fire_with_reply();
}

- (void)subscriber:(id)a3 firePayload:(id)a4
{
  id v5 = a4;
  [a3 token];
  xpc_event_publisher_fire();
}

- (void)subscriberFailedHandshake:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _IPServerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v4 token];
    _os_log_impl(&dword_252AA9000, v5, OS_LOG_TYPE_DEFAULT, "Subscriber for token %llu failed handshake! Removing tracking.", (uint8_t *)&v8, 0xCu);
  }

  subscribers = self->_subscribers;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "token"));
  [(NSMutableDictionary *)subscribers setObject:0 forKeyedSubscript:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_streamName, 0);
}

void __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_252AA9000, a2, OS_LOG_TYPE_FAULT, "Error on XPC event publisher! %{darwin.errno}d", (uint8_t *)v2, 8u);
}

- (void)_queue_processPublisherEventAction:(uint64_t)a1 token:(NSObject *)a2 descriptor:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_252AA9000, a2, OS_LOG_TYPE_FAULT, "already have a client with token %llu!", (uint8_t *)&v2, 0xCu);
}

@end