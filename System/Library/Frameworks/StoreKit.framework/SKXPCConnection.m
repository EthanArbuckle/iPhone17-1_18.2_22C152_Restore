@interface SKXPCConnection
- (SKXPCConnection)init;
- (SKXPCConnection)initWithServiceName:(id)a3;
- (SKXPCConnection)initWithXPCConnection:(id)a3;
- (id)_initSKXPCConnection;
- (id)createXPCEndpoint;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
@end

@implementation SKXPCConnection

- (id)_initSKXPCConnection
{
  v6.receiver = self;
  v6.super_class = (Class)SKXPCConnection;
  v2 = [(SKXPCConnection *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreKit.SKXPCConnection", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (SKXPCConnection)init
{
  return [(SKXPCConnection *)self initWithServiceName:0];
}

- (SKXPCConnection)initWithServiceName:(id)a3
{
  if (a3) {
    v4 = (const char *)[a3 UTF8String];
  }
  else {
    v4 = 0;
  }
  xpc_connection_t v5 = xpc_connection_create(v4, 0);
  xpc_connection_set_legacy();
  objc_super v6 = [(SKXPCConnection *)self initWithXPCConnection:v5];

  return v6;
}

- (SKXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(SKXPCConnection *)self _initSKXPCConnection];
  v7 = (SKXPCConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    [(SKXPCConnection *)v7 _reloadEventHandler];
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (id)createXPCEndpoint
{
  return xpc_endpoint_create(self->_connection);
}

- (id)disconnectBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SKXPCConnection_disconnectBlock__block_invoke;
  v5[3] = &unk_1E5FAA490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  dispatch_queue_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __34__SKXPCConnection_disconnectBlock__block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)messageBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SKXPCConnection_messageBlock__block_invoke;
  v5[3] = &unk_1E5FAA490;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  uint64_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __31__SKXPCConnection_messageBlock__block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  connection = self->_connection;
  v7 = dispatch_get_global_queue(0, 0);
  xpc_connection_send_message_with_reply(connection, a3, v7, a4);
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SKXPCConnection_sendSynchronousMessage_withReply___block_invoke;
  v11[3] = &unk_1E5FAA4B8;
  dispatch_semaphore_t v12 = v8;
  id v13 = v6;
  v9 = v8;
  id v10 = v6;
  [(SKXPCConnection *)self sendMessage:v7 withReply:v11];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __52__SKXPCConnection_sendSynchronousMessage_withReply___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

- (void)setDisconnectBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__SKXPCConnection_setDisconnectBlock___block_invoke;
  v7[3] = &unk_1E5FAA4E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void *__38__SKXPCConnection_setDisconnectBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 24) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    id v7 = *(void **)(a1 + 32);
    return (void *)[v7 _reloadEventHandler];
  }
  return result;
}

- (void)setMessageBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SKXPCConnection_setMessageBlock___block_invoke;
  v7[3] = &unk_1E5FAA4E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void *__35__SKXPCConnection_setMessageBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (*(void **)(v3 + 32) != result)
  {
    uint64_t v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    id v7 = *(void **)(a1 + 32);
    return (void *)[v7 _reloadEventHandler];
  }
  return result;
}

- (void)_reloadEventHandler
{
  uint64_t v3 = _Block_copy(self->_disconnectBlock);
  uint64_t v4 = _Block_copy(self->_messageBlock);
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SKXPCConnection__reloadEventHandler__block_invoke;
  v8[3] = &unk_1E5FAA530;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  xpc_connection_set_event_handler(connection, v8);
}

void __38__SKXPCConnection__reloadEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
  else if (MEMORY[0x1B3E927C0](v3) == MEMORY[0x1E4F14578])
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__SKXPCConnection__reloadEventHandler__block_invoke_2;
    handler[3] = &unk_1E5FAA508;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v7 = v4;
    id v9 = v7;
    xpc_connection_set_event_handler((xpc_connection_t)v7, handler);
    xpc_connection_resume((xpc_connection_t)v7);
  }
}

uint64_t __38__SKXPCConnection__reloadEventHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528])
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (!v6) {
      goto LABEL_10;
    }
  }
  id v8 = v4;
  uint64_t v6 = (*(uint64_t (**)(void))(v6 + 16))();
  id v4 = v8;
LABEL_10:

  return MEMORY[0x1F41817F8](v6, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageBlock, 0);
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end