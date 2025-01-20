@interface DMXPCConnection
- (BOOL)hasEntitlement:(id)a3;
- (DMXPCConnection)initWithConnection:(id)a3;
- (DMXPCConnection)initWithServiceName:(id)a3;
- (OS_xpc_object)connection;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)messageHandler;
- (id)sendMessageSync:(id)a3;
- (void)_handleMessage:(id)a3;
- (void)invalidate;
- (void)resume;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)targetForegroundUserSessionIfNecessary;
@end

@implementation DMXPCConnection

uint64_t __38__DMXPCConnection_initWithConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleMessage:a2];
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setInterruptionHandler:(id)a3
{
}

uint64_t __39__DMXPCConnection_initWithServiceName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleMessage:a2];
}

- (void)_handleMessage:(id)a3
{
  id v6 = a3;
  uint64_t v4 = MEMORY[0x1E01944D0]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    messageHandler = (void (**)(id, id))self->_messageHandler;
    if (!messageHandler)
    {
      [(DMXPCConnection *)self handleMessage:v6];
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v4 != MEMORY[0x1E4F145A8]) {
    goto LABEL_11;
  }
  if (v6 == (id)MEMORY[0x1E4F14520])
  {
    messageHandler = (void (**)(id, id))self->_interruptionHandler;
    if (!messageHandler) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v6 == (id)MEMORY[0x1E4F14528])
  {
    messageHandler = (void (**)(id, id))self->_invalidationHandler;
    if (messageHandler) {
LABEL_10:
    }
      messageHandler[2](messageHandler, v6);
  }
LABEL_11:

  MEMORY[0x1F41817F8]();
}

- (DMXPCConnection)initWithConnection:(id)a3
{
  v5 = (_xpc_connection_s *)a3;
  v13.receiver = self;
  v13.super_class = (Class)DMXPCConnection;
  id v6 = [(DMXPCConnection *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.dmxpcservice.client", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    xpc_connection_set_target_queue(v5, (dispatch_queue_t)v7->_queue);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __38__DMXPCConnection_initWithConnection___block_invoke;
    handler[3] = &unk_1E6C1E170;
    v12 = v7;
    xpc_connection_set_event_handler(v5, handler);
  }
  return v7;
}

- (void)invalidate
{
}

- (id)sendMessageSync:(id)a3
{
  id v4 = a3;
  v5 = [(DMXPCConnection *)self connection];
  xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v5, v4);

  return v6;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)resume
{
}

- (void)targetForegroundUserSessionIfNecessary
{
  if (xpc_user_sessions_enabled())
  {
    xpc_user_sessions_get_foreground_uid();
    _DMLogFunc(v2, 7, @"targeting foreground user session for uid %d");
    xpc_connection_set_target_user_session_uid();
  }
}

- (DMXPCConnection)initWithServiceName:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DMXPCConnection;
  xpc_object_t v6 = [(DMXPCConnection *)&v24 init];
  if (v6)
  {
    v7 = v6;
    dispatch_queue_t v8 = [NSString stringWithFormat:@"com.apple.dmxpcservice.%@", v5];
    v9 = [NSString stringWithFormat:@"com.apple.dmxpcservice.reply.%@", v5];
    id v10 = v8;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    id v13 = v9;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v14;

    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v5 UTF8String], (dispatch_queue_t)v7->_queue, 0);
    connection = v7->_connection;
    v7->_connection = mach_service;

    _DMLogFunc(v3, 7, @"DMXPCConnection created connection %p");
    v18 = v7->_connection;
    if (v18)
    {
      xpc_connection_set_target_queue(v18, (dispatch_queue_t)v7->_queue);
      v19 = v7->_connection;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __39__DMXPCConnection_initWithServiceName___block_invoke;
      handler[3] = &unk_1E6C1E170;
      v20 = v7;
      v23 = v20;
      xpc_connection_set_event_handler(v19, handler);
      v7 = v23;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  dispatch_queue_t v8 = [(DMXPCConnection *)self connection];
  replyQueue = self->_replyQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__DMXPCConnection_sendMessage_replyHandler___block_invoke;
  handler[3] = &unk_1E6C1E198;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(v8, v7, replyQueue, handler);
}

uint64_t __44__DMXPCConnection_sendMessage_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasEntitlement:(id)a3
{
  id v5 = (__CFString *)a3;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(DMXPCConnection *)self connection];
  xpc_connection_get_audit_token();

  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
  memset(&token, 0, sizeof(token));
  dispatch_queue_t v8 = SecTaskCreateWithAuditToken(v7, &token);
  if (v8)
  {
    v9 = v8;
    *(void *)token.val = 0;
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, v5, (CFErrorRef *)&token);
    if (*(void *)token.val) {
      _DMLogFunc(v3, 3, @"hasEntitlement: %@ did fail to copy value with error %@");
    }
    if (v10)
    {
      CFTypeID v11 = CFGetTypeID(v10);
      BOOL v12 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v10) != 0;
      CFRelease(v10);
      _DMLogFunc(v3, 7, @"hasEntitlement: %@ did get value %d");
    }
    else
    {
      BOOL v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    _DMLogFunc(v3, 3, @"hasEntitlement: %@ did fail to create SecTask");
    BOOL v12 = 0;
  }

  return v12;
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)messageHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setMessageHandler:(id)a3
{
}

@end