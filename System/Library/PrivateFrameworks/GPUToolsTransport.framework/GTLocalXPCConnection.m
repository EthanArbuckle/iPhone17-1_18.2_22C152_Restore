@interface GTLocalXPCConnection
- (BOOL)isTrusted;
- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4;
- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4;
- (OS_xpc_object)connection;
- (OS_xpc_object)error;
- (id)sendMessageWithReplySync:(id)a3;
- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4;
- (unint64_t)registerDispatcher:(id)a3;
- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4;
- (void)cancel;
- (void)deregisterDispatcher:(unint64_t)a3;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageAndWaitForDelivery:(id)a3;
- (void)setError:(id)a3;
@end

@implementation GTLocalXPCConnection

- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTLocalXPCConnection;
  v9 = [(GTLocalXPCConnection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
  }

  return v10;
}

- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GTLocalXPCConnection;
  v9 = [(GTLocalXPCConnection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
    uint64_t v13 = os_transaction_create();
    transaction = v10->_transaction;
    v10->_transaction = (OS_os_transaction *)v13;
  }
  return v10;
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
  id v6 = a3;
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__GTLocalXPCConnection_registerDispatcher_forPort___block_invoke;
  block[3] = &unk_264E291A0;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(messageQueue, block);
}

void __51__GTLocalXPCConnection_registerDispatcher_forPort___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    uint64_t v2 = a1[5];
    id v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
    [v1 setObject:v2 forKeyedSubscript:v3];
  }
}

- (unint64_t)registerDispatcher:(id)a3
{
  id v4 = a3;
  unint64_t add = atomic_fetch_add(&registerDispatcher__nextStreamId, 1uLL);
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__GTLocalXPCConnection_registerDispatcher___block_invoke;
  block[3] = &unk_264E291A0;
  id v10 = v4;
  unint64_t v11 = add;
  block[4] = self;
  id v7 = v4;
  dispatch_async(messageQueue, block);

  return add;
}

void __43__GTLocalXPCConnection_registerDispatcher___block_invoke(void *a1)
{
  v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    uint64_t v2 = a1[5];
    id v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
    [v1 setObject:v2 forKeyedSubscript:v3];
  }
}

- (void)deregisterDispatcher:(unint64_t)a3
{
  messageQueue = self->_messageQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__GTLocalXPCConnection_deregisterDispatcher___block_invoke;
  v4[3] = &unk_264E291C8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(messageQueue, v4);
}

void __45__GTLocalXPCConnection_deregisterDispatcher___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v1)
  {
    id v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v1 removeObjectForKey:v2];
  }
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__GTLocalXPCConnection_dispatchMessage_replyConnection___block_invoke;
  block[3] = &unk_264E28ED0;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(messageQueue, block);
}

void __56__GTLocalXPCConnection_dispatchMessage_replyConnection___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (xpc_dictionary_get_flag(*(void **)(a1 + 32), "_flags", 1))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 40) + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (IsServicePort([v7 unsignedLongLongValue]))
          {
            id v8 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v7];
            [v8 dispatchMessage:*(void *)(a1 + 32) replyConnection:*(void *)(a1 + 48)];
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "_port");
    id v10 = *(void **)(*(void *)(a1 + 40) + 32);
    unint64_t v11 = [NSNumber numberWithUnsignedLongLong:uint64];
    id v12 = [v10 objectForKeyedSubscript:v11];

    [v12 dispatchMessage:*(void *)(a1 + 32) replyConnection:*(void *)(a1 + 48)];
  }
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = dispatch_get_global_queue(0, 0);
  connection = self->_connection;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __49__GTLocalXPCConnection_sendMessage_replyHandler___block_invoke;
  handler[3] = &unk_264E291F0;
  id v11 = v6;
  id v9 = v6;
  xpc_connection_send_message_with_reply(connection, a3, v7, handler);
}

void __49__GTLocalXPCConnection_sendMessage_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = 0;
  BOOL IsValid = MessageIsValid(v3, &v6);
  id v5 = v6;
  if (!IsValid)
  {

    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sendMessageWithReplySync:(id)a3
{
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
  return v3;
}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  id v5 = [(GTLocalXPCConnection *)self sendMessageWithReplySync:a3];
  if (MessageIsValid(v5, a4)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  [(GTLocalXPCConnection *)self sendMessage:a3];
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  connection = self->_connection;
  barrier[0] = MEMORY[0x263EF8330];
  barrier[1] = 3221225472;
  barrier[2] = __54__GTLocalXPCConnection_sendMessageAndWaitForDelivery___block_invoke;
  barrier[3] = &unk_264E28838;
  id v9 = v4;
  id v6 = v4;
  xpc_connection_send_barrier(connection, barrier);
  dispatch_time_t v7 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v6, v7);
}

void __54__GTLocalXPCConnection_sendMessageAndWaitForDelivery___block_invoke(uint64_t a1)
{
}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke;
  v11[3] = &unk_264E29240;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  xpc_connection_set_event_handler(connection, v11);
  xpc_connection_activate(self->_connection);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[3];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke_2;
    v7[3] = &unk_264E29218;
    id v8 = v3;
    id v9 = v5;
    id v10 = a1[4];
    id v11 = a1[5];
    dispatch_async(v6, v7);
  }
}

uint64_t __67__GTLocalXPCConnection_activateWithMessageHandler_andErrorHandler___block_invoke_2(uint64_t a1)
{
  if (MEMORY[0x23ECDA660](*(void *)(a1 + 32)) == MEMORY[0x263EF8720])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 40), *(id *)(a1 + 32));
    uint64_t v2 = a1 + 48;
  }
  else
  {
    uint64_t v2 = a1 + 56;
  }
  id v3 = *(uint64_t (**)(void))(*(void *)v2 + 16);
  return v3();
}

- (void)cancel
{
  xpc_connection_cancel(self->_connection);
  messageQueue = self->_messageQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__GTLocalXPCConnection_cancel__block_invoke;
  block[3] = &unk_264E28838;
  void block[4] = self;
  dispatch_async(messageQueue, block);
}

void __30__GTLocalXPCConnection_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (BOOL)isTrusted
{
  return 1;
}

- (OS_xpc_object)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dispatchers, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end