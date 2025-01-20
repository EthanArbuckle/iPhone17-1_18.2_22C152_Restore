@interface _DRCTaskingConnectionState
+ (id)sharedConnectionState;
- (BOOL)isClosed;
- (BOOL)sendMessage:(id)a3;
- (OS_dispatch_queue)connectionQueue;
- (OS_xpc_object)connection;
- (_DRCTaskingConnectionState)init;
- (id)sendMessageWithReplySync:(id)a3;
- (void)cleanupState;
@end

@implementation _DRCTaskingConnectionState

- (id)sendMessageWithReplySync:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(_DRCTaskingConnectionState *)self connectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___DRCTaskingConnectionState_sendMessageWithReplySync___block_invoke;
  block[3] = &unk_1E6C2ACA0;
  block[4] = self;
  block[5] = &v11;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v12 + 24))
  {
    v6 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MessageSendFailed", "Message send failed due to closed connection to tasking service", v9, 2u);
    }
    xpc_object_t v7 = 0;
  }
  else
  {
    v6 = [(_DRCTaskingConnectionState *)self connection];
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v6, v4);
  }

  _Block_object_dispose(&v11, 8);

  return v7;
}

- (_DRCTaskingConnectionState)init
{
  v17.receiver = self;
  v17.super_class = (Class)_DRCTaskingConnectionState;
  v2 = [(_DRCTaskingConnectionState *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DiagnosticRequest tasking service connection queue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = [(_DRCTaskingConnectionState *)v2 connectionQueue];
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.diagnosticpipeline.tasking.service", v5, 0);
    connection = v2->_connection;
    v2->_connection = mach_service;

    v2->_isClosed = 0;
    v8 = [(_DRCTaskingConnectionState *)v2 connection];

    if (v8)
    {
      v9 = [(_DRCTaskingConnectionState *)v2 connection];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __34___DRCTaskingConnectionState_init__block_invoke;
      handler[3] = &unk_1E6C2AC50;
      v10 = v2;
      v16 = v10;
      xpc_connection_set_event_handler(v9, handler);

      uint64_t v11 = [(_DRCTaskingConnectionState *)v10 connection];
      xpc_connection_set_context(v11, v10);

      v12 = [(_DRCTaskingConnectionState *)v10 connection];
      xpc_connection_set_finalizer_f(v12, (xpc_finalizer_t)_DRCTaskingConnectionStateFinalizer);

      uint64_t v13 = [(_DRCTaskingConnectionState *)v10 connection];
      xpc_connection_activate(v13);
    }
  }
  return v2;
}

+ (id)sharedConnectionState
{
  if (sharedConnectionState_onceToken != -1) {
    dispatch_once(&sharedConnectionState_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedConnectionState_connectionState;

  return v2;
}

- (void)cleanupState
{
  if (![(_DRCTaskingConnectionState *)self isClosed])
  {
    self->_isClosed = 1;
    dispatch_queue_t v3 = [(_DRCTaskingConnectionState *)self connection];
    xpc_connection_cancel(v3);

    connection = self->_connection;
    self->_connection = 0;
  }
}

- (BOOL)sendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(_DRCTaskingConnectionState *)self connectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___DRCTaskingConnectionState_sendMessage___block_invoke;
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

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (OS_xpc_object)connection
{
  return self->_connection;
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