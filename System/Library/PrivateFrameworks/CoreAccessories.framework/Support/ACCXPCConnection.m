@interface ACCXPCConnection
- (ACCXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4;
- (ACCXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4;
- (id)_initACCXPCConnection:(id)a3;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation ACCXPCConnection

- (id)_initACCXPCConnection:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCXPCConnection;
  v5 = [(ACCXPCConnection *)&v10 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->isValid = 257;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (ACCXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4
{
  id v4 = self;
  v5 = 0;
  if (a3 && a4)
  {
    *(_WORD *)&self->isValid = 257;
    id v7 = a3;
    id v8 = a4;
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v7 UTF8String], 0, 0);
    objc_super v10 = [(ACCXPCConnection *)v4 initWithXPCConnection:mach_service queueName:v8];

    id v4 = v10;
    v5 = v4;
  }

  return v5;
}

- (ACCXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4
{
  id v7 = a3;
  id v8 = [(ACCXPCConnection *)self _initACCXPCConnection:a4];
  v9 = v8;
  if (v8)
  {
    *(_WORD *)&v8->isValid = 257;
    objc_storeStrong((id *)&v8->_connection, a3);
    [(ACCXPCConnection *)v9 _reloadEventHandler];
    xpc_connection_resume(v9->_connection);
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ACCXPCConnection;
  [(ACCXPCConnection *)&v2 dealloc];
}

- (id)disconnectBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  objc_super v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __35__ACCXPCConnection_disconnectBlock__block_invoke;
  v5[3] = &unk_100217040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __35__ACCXPCConnection_disconnectBlock__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 24));

  return _objc_release_x1();
}

- (id)messageBlock
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  objc_super v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __32__ACCXPCConnection_messageBlock__block_invoke;
  v5[3] = &unk_100217040;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __32__ACCXPCConnection_messageBlock__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 40));

  return _objc_release_x1();
}

- (void)sendMessage:(id)a3
{
  if (self->isValid) {
    xpc_connection_send_message(self->_connection, a3);
  }
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  if (self->isValid) {
    xpc_connection_send_message_with_reply(self->_connection, a3, (dispatch_queue_t)self->_replyQueue, a4);
  }
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, xpc_object_t))a4;
  if (self->isValid)
  {
    uint64_t v8 = v6;
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
    if (v8) {
      v8[2](v8, v7);
    }

    uint64_t v6 = v8;
  }
}

- (void)setDisconnectBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __39__ACCXPCConnection_setDisconnectBlock___block_invoke;
  v7[3] = &unk_100217068;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

id __39__ACCXPCConnection_setDisconnectBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id result = *(id *)(a1 + 40);
  if (*(id *)(v3 + 24) != result)
  {
    id v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    xpc_object_t v7 = *(void **)(a1 + 32);
    return [v7 _reloadEventHandler];
  }
  return result;
}

- (void)setMessageBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __36__ACCXPCConnection_setMessageBlock___block_invoke;
  v7[3] = &unk_100217068;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

id __36__ACCXPCConnection_setMessageBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id result = *(id *)(a1 + 40);
  if (*(id *)(v3 + 40) != result)
  {
    id v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    xpc_object_t v7 = *(void **)(a1 + 32);
    return [v7 _reloadEventHandler];
  }
  return result;
}

- (void)setReplyQueue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __34__ACCXPCConnection_setReplyQueue___block_invoke;
  v7[3] = &unk_100215968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

void __34__ACCXPCConnection_setReplyQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 32);
  id v4 = (id *)(v2 + 32);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setTargetQueue:(id)a3
{
  queue = a3;
  dispatch_set_target_queue((dispatch_object_t)self->_dispatchQueue, queue);
  replyQueue = self->_replyQueue;
  if (replyQueue) {
    dispatch_set_target_queue(replyQueue, queue);
  }
}

- (void)_reloadEventHandler
{
  id v3 = objc_retainBlock(self->_disconnectBlock);
  id v4 = objc_retainBlock(self->_messageBlock);
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __39__ACCXPCConnection__reloadEventHandler__block_invoke;
  handler[3] = &unk_1002170B8;
  handler[4] = self;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  xpc_connection_set_event_handler(connection, handler);
}

void __39__ACCXPCConnection__reloadEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == &_xpc_error_connection_invalid)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  }
  else if (v3 != &_xpc_error_connection_interrupted)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = __39__ACCXPCConnection__reloadEventHandler__block_invoke_2;
      v9[3] = &unk_100217090;
      id v7 = *(void **)(a1 + 40);
      v9[4] = *(void *)(a1 + 32);
      id v11 = v7;
      id v12 = *(id *)(a1 + 48);
      id v8 = v4;
      id v10 = v8;
      xpc_connection_set_event_handler((xpc_connection_t)v8, v9);
      xpc_connection_resume((xpc_connection_t)v8);
    }
    else if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5) {
        (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, *(void *)(*(void *)(a1 + 32) + 8));
      }
    }
    goto LABEL_12;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 49))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
LABEL_12:
}

uint64_t __39__ACCXPCConnection__reloadEventHandler__block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (v3 == &_xpc_error_connection_invalid)
  {
    *(unsigned char *)(a1[4] + 48) = 0;
  }
  else if (v3 != &_xpc_error_connection_interrupted)
  {
    uint64_t v4 = a1[7];
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1[4] + 49))
  {
    uint64_t v4 = a1[6];
    if (v4) {
LABEL_8:
    }
      (*(void (**)(void))(v4 + 16))();
  }
LABEL_9:

  return _objc_release_x1();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageBlock, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end