@interface GEOXPCConnection
+ (OS_dispatch_queue)defaultXPCServerConnectionQueue;
+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 eventHandler:(id)a5;
+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 eventHandler:(id)a6;
+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 reconnectBlock:(id)a6 eventHandler:(id)a7;
+ (id)daemonXPCConnectionCreationBlock;
+ (void)setDaemonXPCConnectionCreationBlock:(id)a3;
+ (void)setDefaultXPCServerConnectionQueue:(id)a3;
- (BOOL)initiateBarrierIfNecessary:(id)a3 delegate:(id)a4;
- (BOOL)isConnected;
- (BOOL)reconnectAutomatically;
- (GEOXPCConnection)initWithClientConnection:(id)a3 debugIdentifier:(id)a4;
- (NSString)debugIdentifier;
- (OS_xpc_object)xpcConnection;
- (id)initServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 creationBlock:(id)a6 reconnectBlock:(id)a7 eventHandler:(id)a8;
- (id)reconnectBlock;
- (id)sendDictionaryWithMessageReplySync:(id)a3 error:(id *)a4;
- (id)sendDictionaryWithReplySync:(id)a3 error:(id *)a4;
- (id)sendMessageWithReplySync:(id)a3;
- (unint64_t)serverType;
- (void)_barrierIsReady;
- (void)_reconnectIsolated;
- (void)_sendGreetingIfNeeded:(id)a3;
- (void)close;
- (void)dealloc;
- (void)reconnect;
- (void)sendDictionary:(id)a3;
- (void)sendDictionary:(id)a3 withReply:(id)a4 handler:(id)a5;
- (void)sendDictionarySync:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4 handler:(id)a5;
- (void)sendMessageReporingProgress:(id)a3 withReply:(id)a4 handler:(id)a5;
- (void)sendMessageSync:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setReconnectAutomatically:(BOOL)a3;
- (void)setReconnectBlock:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation GEOXPCConnection

uint64_t __35__GEOXPCConnection__barrierIsReady__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) geoXPCConnectionIsReadyToSend:*(void *)(a1 + 40)];
}

uint64_t __108__GEOXPCConnection_initServerConnectionFor_debugIdentifier_queue_creationBlock_reconnectBlock_eventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconnectIsolated];
}

void __38__GEOXPCConnection__reconnectIsolated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_9;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_73);
  }
  else if (v3 != (id)MEMORY[0x1E4F14528])
  {
    goto LABEL_7;
  }
  geo_isolate_sync_data();
LABEL_7:
  uint64_t v5 = WeakRetained[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
LABEL_9:
}

- (void)setDebugIdentifier:(id)a3
{
}

void __35__GEOXPCConnection__barrierIsReady__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 64));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
}

- (BOOL)initiateBarrierIfNecessary:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __56__GEOXPCConnection_initiateBarrierIfNecessary_delegate___block_invoke;
  location[4] = &unk_1E53E1400;
  location[5] = self;
  id v8 = v6;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  v18 = &v19;
  geo_isolate_sync_data();
  if (*((unsigned char *)v20 + 24)
    && ([(GEOXPCConnection *)self xpcConnection],
        (v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_initWeak(location, self);
    objc_copyWeak(&v14, location);
    v11 = geo_dispatch_block_clean_copy();
    xpc_connection_send_barrier(v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);

    BOOL v12 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)sendMessageWithReplySync:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(GEOXPCConnection *)self xpcConnection];
    if (v5)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v5];
      xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v5, v4);
    }
    else
    {
      xpc_object_t v6 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", v8, 2u);
    }
    xpc_object_t v6 = 0;
  }

  return v6;
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(GEOXPCConnection *)self xpcConnection];
    if (v5)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v5];
      queue = self->_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __32__GEOXPCConnection_sendMessage___block_invoke;
      handler[3] = &unk_1E53E1380;
      handler[4] = self;
      xpc_connection_send_message_with_reply(v5, v4, queue, handler);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", buf, 2u);
  }
}

- (OS_xpc_object)xpcConnection
{
  xpc_object_t v6 = self->_connectionIsolater;
  _geo_isolate_lock_data();
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    xpcConnection = self->_creationBlock;
    if (xpcConnection)
    {
      if (self->_reconnectAutomatically)
      {
        [(GEOXPCConnection *)self _reconnectIsolated];
        xpcConnection = self->_xpcConnection;
      }
      else
      {
        xpcConnection = 0;
      }
    }
  }
  id v4 = xpcConnection;
  _geo_isolate_unlock();

  return (OS_xpc_object *)v4;
}

- (void)_sendGreetingIfNeeded:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: connection != ((void *)0)", buf, 2u);
    }
    goto LABEL_10;
  }
  if (self->_greetingSent || !self->_creationBlock)
  {
LABEL_10:

    return;
  }
  self->_greetingSent = 1;
  uint64_t v5 = GEOXPCServerIdentifierForType();
  if ([v5 length])
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    id v7 = v5;
    xpc_dictionary_set_string(v6, "peer_server_identifier", (const char *)[v7 UTF8String]);
    if ([(NSString *)self->_debugIdentifier length]) {
      xpc_dictionary_set_string(v6, "peer_debug_identifier", [(NSString *)self->_debugIdentifier UTF8String]);
    }
    xpc_connection_send_message((xpc_connection_t)v4, v6);
    if (self->_reconnectBlock)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__GEOXPCConnection__sendGreetingIfNeeded___block_invoke;
      block[3] = &unk_1E53D79D8;
      block[4] = self;
      dispatch_async(queue, block);
    }

    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: serverIdentifier.length > 0", buf, 2u);
  }
  __break(1u);
}

void __56__GEOXPCConnection_initiateBarrierIfNecessary_delegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _barrierIsReady];
}

- (void)_barrierIsReady
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__36;
  v24 = __Block_byref_object_dispose__36;
  id v25 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __35__GEOXPCConnection__barrierIsReady__block_invoke;
  id v17 = &unk_1E53D89C0;
  v18 = self;
  uint64_t v19 = &v20;
  geo_isolate_sync_data();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)v21[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [(id)v21[5] objectForKey:v7];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __35__GEOXPCConnection__barrierIsReady__block_invoke_2;
        v9[3] = &unk_1E53D8998;
        v9[4] = v7;
        v9[5] = self;
        dispatch_async(v8, v9);
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v26 count:16];
    }
    while (v4);
  }

  _Block_object_dispose(&v20, 8);
}

void __25__GEOXPCConnection_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    xpc_connection_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;
  }
}

- (void)dealloc
{
  [(GEOXPCConnection *)self close];
  v3.receiver = self;
  v3.super_class = (Class)GEOXPCConnection;
  [(GEOXPCConnection *)&v3 dealloc];
}

- (void)close
{
  if (self->_xpcConnection) {
    geo_isolate_sync();
  }
}

- (GEOXPCConnection)initWithClientConnection:(id)a3 debugIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GEOXPCConnection;
  id v9 = [(GEOXPCConnection *)&v16 init];
  if (v9)
  {
    uint64_t v10 = geo_isolater_create();
    connectionIsolater = v9->_connectionIsolater;
    v9->_connectionIsolater = (geo_isolater *)v10;

    v9->_serverType = 0;
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    uint64_t v12 = [v8 copy];
    debugIdentifier = v9->_debugIdentifier;
    v9->_debugIdentifier = (NSString *)v12;

    uint64_t v14 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reconnectBlock, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_barrierDelegates, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_connectionIsolater, 0);

  objc_storeStrong(&self->_creationBlock, 0);
}

- (void)sendMessageReporingProgress:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    long long v11 = [(GEOXPCConnection *)self xpcConnection];
    if (v11)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v11];
      id v12 = [MEMORY[0x1E4F28F90] currentProgress];

      if (v12)
      {
        long long v13 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
        id v17 = 0;
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F90], "_geo_mirroredProgressForReceivingOverXPC:", &v17);
        id v12 = v17;
        [v13 addChild:v14 withPendingUnitCount:1];

        if (v12) {
          xpc_dictionary_set_value(v8, "progress_observer_endpoint", v12);
        }
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke_2;
      v15[3] = &unk_1E53E13D8;
      v15[4] = self;
      id v16 = v10;
      xpc_connection_send_message_with_reply(v11, v8, v9, v15);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke;
      block[3] = &unk_1E53DA028;
      id v19 = v10;
      dispatch_async(v9, block);
      id v12 = v19;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", buf, 2u);
  }
}

uint64_t __42__GEOXPCConnection__sendGreetingIfNeeded___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 96) + 16))();
}

uint64_t __29__GEOXPCConnection_reconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reconnectIsolated];
}

- (void)sendDictionary:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(GEOXPCConnection *)self xpcConnection];
  if (v11)
  {
    [(GEOXPCConnection *)self _sendGreetingIfNeeded:v11];
    id v12 = (id)_CFXPCCreateXPCObjectFromCFObject();
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke_2;
    handler[3] = &unk_1E53E13D8;
    handler[4] = self;
    id v15 = v10;
    id v13 = v10;
    xpc_connection_send_message_with_reply(v11, v12, v9, handler);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke;
    block[3] = &unk_1E53DA028;
    id v17 = v10;
    id v12 = v10;
    dispatch_async(v9, block);
    id v13 = v17;
  }
}

- (void)sendMessage:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    long long v11 = [(GEOXPCConnection *)self xpcConnection];
    if (v11)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v11];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke_2;
      handler[3] = &unk_1E53E13D8;
      handler[4] = self;
      id v14 = v10;
      xpc_connection_send_message_with_reply(v11, v8, v9, handler);
      id v12 = v14;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke;
      block[3] = &unk_1E53DA028;
      id v16 = v10;
      dispatch_async(v9, block);
      id v12 = v16;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", buf, 2u);
  }
}

+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 reconnectBlock:(id)a6 eventHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = (void *)[objc_alloc((Class)a1) initServerConnectionFor:a3 debugIdentifier:v15 queue:v14 creationBlock:0 reconnectBlock:v13 eventHandler:v12];

  return v16;
}

+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 eventHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = (void *)[objc_alloc((Class)a1) initServerConnectionFor:a3 debugIdentifier:v12 queue:v11 creationBlock:0 reconnectBlock:0 eventHandler:v10];

  return v13;
}

+ (id)createServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 eventHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initServerConnectionFor:a3 debugIdentifier:v9 queue:0 creationBlock:0 reconnectBlock:0 eventHandler:v8];

  return v10;
}

+ (OS_dispatch_queue)defaultXPCServerConnectionQueue
{
  id v7 = daemonXPCUtilIsolater();
  _geo_isolate_lock_data();
  uint64_t v2 = (void *)_defaultXPCServerConnectionQueue;
  if (!_defaultXPCServerConnectionQueue)
  {
    uint64_t v3 = MEMORY[0x18C11FE60]("com.apple.geo.XPCServer");
    uint64_t v4 = (void *)_defaultXPCServerConnectionQueue;
    _defaultXPCServerConnectionQueue = v3;

    uint64_t v2 = (void *)_defaultXPCServerConnectionQueue;
  }
  id v5 = v2;
  _geo_isolate_unlock();

  return (OS_dispatch_queue *)v5;
}

- (id)initServerConnectionFor:(unint64_t)a3 debugIdentifier:(id)a4 queue:(id)a5 creationBlock:(id)a6 reconnectBlock:(id)a7 eventHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v38.receiver = self;
  v38.super_class = (Class)GEOXPCConnection;
  id v19 = [(GEOXPCConnection *)&v38 init];
  if (v19)
  {
    id v20 = v14;
    [v20 UTF8String];
    uint64_t v21 = geo_isolater_create();
    connectionIsolater = v19->_connectionIsolater;
    v19->_connectionIsolater = (geo_isolater *)v21;

    v19->_serverType = a3;
    uint64_t v23 = [v20 copy];
    debugIdentifier = v19->_debugIdentifier;
    v19->_debugIdentifier = (NSString *)v23;

    if (v15)
    {
      id v25 = (OS_dispatch_queue *)v15;
    }
    else
    {
      id v25 = +[GEOXPCConnection defaultXPCServerConnectionQueue];
    }
    queue = v19->_queue;
    v19->_queue = v25;

    uint64_t v27 = [v18 copy];
    id eventHandler = v19->_eventHandler;
    v19->_id eventHandler = (id)v27;

    if (v16)
    {
      uint64_t v29 = MEMORY[0x18C120660](v16);
      creationBlock = v19->_creationBlock;
      v19->_creationBlock = (id)v29;
    }
    else
    {
      creationBlock = +[GEOXPCConnection daemonXPCConnectionCreationBlock];
      uint64_t v31 = MEMORY[0x18C120660]();
      id v32 = v19->_creationBlock;
      v19->_creationBlock = (id)v31;
    }
    uint64_t v33 = [v17 copy];
    id reconnectBlock = v19->_reconnectBlock;
    v19->_id reconnectBlock = (id)v33;

    v37 = v19;
    geo_isolate_sync();
    v35 = v37;
  }
  return v19;
}

+ (id)daemonXPCConnectionCreationBlock
{
  xpc_object_t v6 = daemonXPCUtilIsolater();
  _geo_isolate_lock_data();
  if (!_daemonXPCConnectionCreationBlock)
  {
    uint64_t v2 = [&__block_literal_global_366 copy];
    uint64_t v3 = (void *)_daemonXPCConnectionCreationBlock;
    _daemonXPCConnectionCreationBlock = v2;
  }
  uint64_t v4 = (void *)MEMORY[0x18C120660]();
  _geo_isolate_unlock();

  return v4;
}

- (void)_reconnectIsolated
{
  geo_assert_isolated();
  if (!self->_xpcConnection)
  {
    creationBlock = (void (**)(id, OS_dispatch_queue *, const char *))self->_creationBlock;
    if (creationBlock)
    {
      creationBlock[2](creationBlock, self->_queue, "com.apple.geod");
      uint64_t v4 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue();
      xpcConnection = self->_xpcConnection;
      self->_xpcConnection = v4;

      if (self->_xpcConnection)
      {
        objc_initWeak(&location, self);
        xpc_object_t v6 = self->_xpcConnection;
        uint64_t v7 = MEMORY[0x1E4F143A8];
        uint64_t v8 = 3221225472;
        id v9 = __38__GEOXPCConnection__reconnectIsolated__block_invoke;
        id v10 = &unk_1E53DF960;
        objc_copyWeak(&v11, &location);
        xpc_connection_set_event_handler(v6, &v7);
        xpc_connection_activate(self->_xpcConnection);
        -[GEOXPCConnection _sendGreetingIfNeeded:](self, "_sendGreetingIfNeeded:", self->_xpcConnection, v7, v8, v9, v10);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)setReconnectAutomatically:(BOOL)a3
{
  if (self->_creationBlock)
  {
    self->_reconnectAutomatically = a3;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _creationBlock != ((void *)0)", v3, 2u);
  }
}

void __56__GEOXPCConnection_initiateBarrierIfNecessary_delegate___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 64);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v4 = a1[4];
    id v5 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v3;

    uint64_t v2 = *(void **)(a1[4] + 64);
  }
  uint64_t v6 = a1[5];
  if (v6)
  {
    [v2 setObject:v6 forKey:a1[6]];
  }
  else
  {
    global_queue = (void *)geo_get_global_queue();
    [v2 setObject:global_queue forKey:a1[6]];
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = *(unsigned char *)(a1[4] + 56) ^ 1;
  *(unsigned char *)(a1[4] + 56) = 1;
}

void __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v3, a2);
}

void __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = GEOXPCErrorFromReply(v3);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138477827;
      id v11 = v3;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Received xpc error: %{private}@", (uint8_t *)&v10, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 objectForKey:@"userInfo"];
      uint64_t v6 = objc_msgSend(v9, "_geo_errorForKey:", @"err");
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unexpected response from geod"];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)reconnect
{
  if (self->_creationBlock)
  {
    geo_isolate_sync();
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _creationBlock != ((void *)0)", buf, 2u);
  }
}

- (void)sendDictionary:(id)a3
{
  id v4 = (id)_CFXPCCreateXPCObjectFromCFObject();
  [(GEOXPCConnection *)self sendMessage:v4];
}

void __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v3, a2);
}

+ (void)setDaemonXPCConnectionCreationBlock:(id)a3
{
  id v3 = a3;
  id v4 = daemonXPCUtilIsolater();
  uint64_t v6 = v3;
  id v5 = v3;
  geo_isolate_sync_data();
}

void __56__GEOXPCConnection_setDaemonXPCConnectionCreationBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) copy];
  uint64_t v2 = (void *)_daemonXPCConnectionCreationBlock;
  _daemonXPCConnectionCreationBlock = v1;
}

+ (void)setDefaultXPCServerConnectionQueue:(id)a3
{
  id v3 = a3;
  id v4 = daemonXPCUtilIsolater();
  uint64_t v6 = v3;
  id v5 = v3;
  geo_isolate_sync_data();
}

void __55__GEOXPCConnection_setDefaultXPCServerConnectionQueue___block_invoke(uint64_t a1)
{
}

void __38__GEOXPCConnection__reconnectIsolated__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"GEODaemonCommunicationInterruptedNotification" object:0];
}

uint64_t __38__GEOXPCConnection__reconnectIsolated__block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = 0;
  return result;
}

void __38__GEOXPCConnection__reconnectIsolated__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
}

- (BOOL)isConnected
{
  uint64_t v2 = self;
  id v4 = self->_connectionIsolater;
  _geo_isolate_lock_data();
  LOBYTE(v2) = v2->_xpcConnection != 0;
  _geo_isolate_unlock();

  return (char)v2;
}

- (void)setXpcConnection:(id)a3
{
  id v4 = (OS_xpc_object *)a3;
  uint64_t v7 = self->_connectionIsolater;
  _geo_isolate_lock_data();
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;
  uint64_t v6 = v4;

  _geo_isolate_unlock();
}

- (void)setReconnectBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_creationBlock)
  {
    uint64_t v6 = (void *)[v4 copy];
    id reconnectBlock = self->_reconnectBlock;
    self->_id reconnectBlock = v6;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _creationBlock != ((void *)0)", v8, 2u);
  }
}

uint64_t __50__GEOXPCConnection_sendMessage_withReply_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__GEOXPCConnection_sendMessageReporingProgress_withReply_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMessageSync:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(GEOXPCConnection *)self xpcConnection];
    if (v5)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v5];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: message != ((void *)0)", v6, 2u);
  }
}

void __53__GEOXPCConnection_sendDictionary_withReply_handler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-301];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)sendDictionarySync:(id)a3
{
  id v4 = (id)_CFXPCCreateXPCObjectFromCFObject();
  [(GEOXPCConnection *)self sendMessageSync:v4];
}

- (id)sendDictionaryWithReplySync:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(GEOXPCConnection *)self xpcConnection];
  uint64_t v8 = (_xpc_connection_s *)v7;
  if (!a4 || v7)
  {
    if (v7)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v7];
      int v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(v8, v10);
      uint64_t v12 = GEOXPCErrorFromReply(v11);
      if (v12)
      {
        id v13 = (id)v12;
        id v14 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138477827;
          id v19 = v11;
          _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_ERROR, "Received xpc error: %{private}@", (uint8_t *)&v18, 0xCu);
        }

        if (a4)
        {
          id v13 = v13;
          id v9 = 0;
          *a4 = v13;
        }
        else
        {
          id v9 = 0;
        }
      }
      else
      {
        id v15 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v15;
          id v13 = 0;
        }
        else
        {
          id v13 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:@"Unexpected response from geod"];
          id v16 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            int v18 = 138477827;
            id v19 = v13;
            _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_ERROR, "xpc error: %{private}@", (uint8_t *)&v18, 0xCu);
          }

          if (a4)
          {
            id v13 = v13;
            id v9 = 0;
            *a4 = v13;
          }
          else
          {
            id v9 = 0;
          }
        }
      }
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-301];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)sendDictionaryWithMessageReplySync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(GEOXPCConnection *)self xpcConnection];
  uint64_t v8 = (_xpc_connection_s *)v7;
  if (!a4 || v7)
  {
    if (v7)
    {
      [(GEOXPCConnection *)self _sendGreetingIfNeeded:v7];
      int v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v8, v10);
    }
    else
    {
      xpc_object_t v9 = 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-301];
    xpc_object_t v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (unint64_t)serverType
{
  return self->_serverType;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (BOOL)reconnectAutomatically
{
  return self->_reconnectAutomatically;
}

- (id)reconnectBlock
{
  return self->_reconnectBlock;
}

@end