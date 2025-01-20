@interface _DRCConnectionState
+ (id)sharedConnectionState;
- (BOOL)hasConnection;
- (BOOL)sendMessage:(id)a3;
- (OS_dispatch_queue)connectionQueue;
- (OS_xpc_object)connection;
- (_DRCConnectionState)init;
- (id)sendMessageWithReplySync:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation _DRCConnectionState

+ (id)sharedConnectionState
{
  if (sharedConnectionState_onceToken_0 != -1) {
    dispatch_once(&sharedConnectionState_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedConnectionState_connectionState_0;

  return v2;
}

- (BOOL)hasConnection
{
  v2 = [(_DRCConnectionState *)self connection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_DRCConnectionState)init
{
  v17.receiver = self;
  v17.super_class = (Class)_DRCConnectionState;
  v2 = [(_DRCConnectionState *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DiagnosticRequest service connection queue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = [(_DRCConnectionState *)v2 connectionQueue];
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.service", v5, 0);
    connection = v2->_connection;
    v2->_connection = mach_service;

    v8 = [(_DRCConnectionState *)v2 connection];

    if (v8)
    {
      v9 = [(_DRCConnectionState *)v2 connection];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __27___DRCConnectionState_init__block_invoke;
      handler[3] = &unk_1E6C2AC50;
      v10 = v2;
      v16 = v10;
      xpc_connection_set_event_handler(v9, handler);

      v11 = [(_DRCConnectionState *)v10 connection];
      xpc_connection_set_context(v11, v10);

      v12 = [(_DRCConnectionState *)v10 connection];
      xpc_connection_set_finalizer_f(v12, (xpc_finalizer_t)_DRCConnectionStateFinalizer);

      v13 = [(_DRCConnectionState *)v10 connection];
      xpc_connection_activate(v13);
    }
  }
  return v2;
}

- (BOOL)sendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(_DRCConnectionState *)self connectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___DRCConnectionState_sendMessage___block_invoke;
  block[3] = &unk_1E6C2AC78;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)sendMessageWithReplySync:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  char v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v5 = [(_DRCConnectionState *)self connectionQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48___DRCConnectionState_sendMessageWithReplySync___block_invoke;
  v9[3] = &unk_1E6C2ACA0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v5, v9);

  id v6 = (_xpc_connection_s *)v11[5];
  if (v6) {
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v6, v4);
  }
  else {
    xpc_object_t v7 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end