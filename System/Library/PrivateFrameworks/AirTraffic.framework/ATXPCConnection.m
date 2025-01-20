@interface ATXPCConnection
- (ATXPCConnection)initWithServiceName:(id)a3 onQueue:(id)a4;
- (ATXPCConnection)initWithXPCConnection:(id)a3;
- (BOOL)assertionHeld;
- (NSString)serviceName;
- (id)context;
- (id)disconnectHandler;
- (id)eventQueue;
- (id)lockdownHandler;
- (id)messageHandler;
- (unint64_t)_outstandingMessages;
- (void)_handleLockdownMessage:(void *)a3;
- (void)_handleXPCError:(id)a3;
- (void)_handleXPCMessage:(id)a3;
- (void)_registerMessage:(id)a3;
- (void)_removeMessage:(id)a3;
- (void)_sendMessage:(id)a3 handler:(id)a4;
- (void)_setEventHandlerOnConnection:(id)a3;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)setAssertionHeld:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setLockdownHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)shutdown;
@end

@implementation ATXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_lockdownHandler, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setAssertionHeld:(BOOL)a3
{
  self->_assertionHeld = a3;
}

- (BOOL)assertionHeld
{
  return self->_assertionHeld;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setMessageHandler:(id)a3
{
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setLockdownHandler:(id)a3
{
}

- (id)lockdownHandler
{
  return self->_lockdownHandler;
}

- (unint64_t)_outstandingMessages
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(ATXPCConnection *)self eventQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__ATXPCConnection__outstandingMessages__block_invoke;
  v6[3] = &unk_2642813F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__ATXPCConnection__outstandingMessages__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_removeMessage:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPCConnection *)self eventQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ATXPCConnection__removeMessage___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __34__ATXPCConnection__removeMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)_registerMessage:(id)a3
{
  id v4 = a3;
  v5 = [(ATXPCConnection *)self eventQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ATXPCConnection__registerMessage___block_invoke;
  v7[3] = &unk_2642813C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __36__ATXPCConnection__registerMessage___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)_setEventHandlerOnConnection:(id)a3
{
  uint64_t v4 = (_xpc_connection_s *)a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__1679;
  v6[4] = __Block_byref_object_dispose__1680;
  uint64_t v7 = self;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __48__ATXPCConnection__setEventHandlerOnConnection___block_invoke;
  handler[3] = &unk_2642813A0;
  handler[4] = v6;
  xpc_connection_set_event_handler(v4, handler);
  _Block_object_dispose(v6, 8);
}

void __48__ATXPCConnection__setEventHandlerOnConnection___block_invoke(uint64_t a1, void *a2)
{
  cf[3] = *(CFTypeRef *)MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x2166CE550]();
  if (v4 == MEMORY[0x263EF8720])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleXPCError:v3];
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x263EF8708])
    {
      cf[0] = 0;
      int v7 = lockdown_copy_checkin_info();
      id v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      if (v7)
      {
        [v8 _handleXPCMessage:v3];
      }
      else
      {
        [v8 _handleLockdownMessage:cf[0]];
        CFRelease(cf[0]);
      }
    }
    else
    {
      uint64_t v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(cf[0]) = 136315138;
        *(CFTypeRef *)((char *)cf + 4) = _StringForXPCType(v5);
        _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring unexpected event of type %s", (uint8_t *)cf, 0xCu);
      }
    }
  }
}

- (void)_handleLockdownMessage:(void *)a3
{
  lockdownHandler = (void (**)(id, void *))self->_lockdownHandler;
  if (lockdownHandler) {
    lockdownHandler[2](lockdownHandler, a3);
  }
}

- (void)_handleXPCMessage:(id)a3
{
  if (self->_messageHandler)
  {
    id v4 = a3;
    id v5 = [[ATXPCMessage alloc] _initWithXPCMessage:v4 onConnection:self];

    (*((void (**)(void))self->_messageHandler + 2))();
  }
}

- (void)shutdown
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v7 = self;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "Shutdown called on XPC connection %{public}@", buf, 0xCu);
  }

  conn = self->_conn;
  if (conn)
  {
    barrier[0] = MEMORY[0x263EF8330];
    barrier[1] = 3221225472;
    barrier[2] = __27__ATXPCConnection_shutdown__block_invoke;
    barrier[3] = &unk_264281378;
    barrier[4] = self;
    xpc_connection_send_barrier(conn, barrier);
  }
}

void __27__ATXPCConnection_shutdown__block_invoke(uint64_t a1)
{
}

- (void)_handleXPCError:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 == (id)MEMORY[0x263EF86A0])
  {
    uint64_t v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v13 = 138543362;
    v14 = self;
    uint64_t v10 = "XPC Connection interrupted %{public}@";
    goto LABEL_11;
  }
  id v5 = (id)MEMORY[0x263EF86A8];
  uint64_t v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v4 != v5)
  {
    if (v7)
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
      uint64_t v9 = "Unknown error";
      if (string) {
        uint64_t v9 = string;
      }
      int v13 = 136315138;
      v14 = (ATXPCConnection *)v9;
      _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_ERROR, "Error: %s", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_14;
  }
  if (v7)
  {
    int v13 = 138543362;
    v14 = self;
    uint64_t v10 = "XPC Connection invalid %{public}@";
LABEL_11:
    _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0xCu);
  }
LABEL_12:

  disconnectHandler = (void (**)(id, void))self->_disconnectHandler;
  if (disconnectHandler)
  {
    disconnectHandler[2](disconnectHandler, v11);
    uint64_t v6 = self->_disconnectHandler;
    self->_disconnectHandler = 0;
LABEL_14:
  }
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      v12 = __41__ATXPCConnection_sendMessage_withReply___block_invoke;
      int v13 = &unk_264281350;
      v14 = self;
      id v15 = v7;
      uint64_t v9 = MEMORY[0x2166CE2A0](&v10);
    }
    else
    {
      uint64_t v9 = 0;
    }
    -[ATXPCConnection _sendMessage:handler:](self, "_sendMessage:handler:", v6, v9, v10, v11, v12, v13);
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2164B1000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring request to send a nil message", buf, 2u);
    }
  }
}

void __41__ATXPCConnection_sendMessage_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x2166CE550]();
  if (v4 == MEMORY[0x263EF8720])
  {
    id v7 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
      uint64_t v9 = "Unknown error";
      if (string) {
        uint64_t v9 = string;
      }
      int v11 = 136315138;
      v12 = v9;
      _os_log_impl(&dword_2164B1000, v7, OS_LOG_TYPE_ERROR, "Reply Error: %s", (uint8_t *)&v11, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 == MEMORY[0x263EF8708])
    {
      id v10 = [[ATXPCMessage alloc] _initWithXPCMessage:v3 onConnection:*(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        v12 = _StringForXPCType(v5);
        _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring unexpected event of type %s", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

- (void)sendMessage:(id)a3
{
}

- (void)_sendMessage:(id)a3 handler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 name];

  if (!v9)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"ATXPCConnection.m" lineNumber:99 description:@"Message must have a name"];
  }
  if (self->_conn)
  {
    id v10 = [v7 _createXPCMessage];
    if (v10)
    {
      conn = self->_conn;
      if (v8)
      {
        v12 = dispatch_get_global_queue(2, 0);
        xpc_connection_send_message_with_reply(conn, v10, v12, v8);
      }
      else
      {
        xpc_connection_send_message(conn, v10);
      }
    }
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_2164B1000, v13, OS_LOG_TYPE_ERROR, "Sending message without a connection: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)eventQueue
{
  eventQueue = self->_eventQueue;
  if (!eventQueue)
  {
    uint64_t v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.atc.XPCEvent", 0);
    uint64_t v5 = self->_eventQueue;
    self->_eventQueue = v4;

    eventQueue = self->_eventQueue;
  }
  return eventQueue;
}

- (NSString)serviceName
{
  conn = self->_conn;
  if (conn)
  {
    conn = [NSString stringWithUTF8String:xpc_connection_get_name(conn)];
  }
  return (NSString *)conn;
}

- (void)dealloc
{
  id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_DEFAULT, "ATXPCConnection dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)ATXPCConnection;
  [(ATXPCConnection *)&v4 dealloc];
}

- (ATXPCConnection)initWithXPCConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ATXPCConnection.m" lineNumber:72 description:@"Must have xpc_connection"];
  }
  v13.receiver = self;
  v13.super_class = (Class)ATXPCConnection;
  id v7 = [(ATXPCConnection *)&v13 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_conn, a3);
    conn = v8->_conn;
    id v10 = [(ATXPCConnection *)v8 eventQueue];
    xpc_connection_set_target_queue(conn, v10);

    [(ATXPCConnection *)v8 _setEventHandlerOnConnection:v8->_conn];
    xpc_connection_resume(v8->_conn);
  }

  return v8;
}

- (ATXPCConnection)initWithServiceName:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXPCConnection;
  id v8 = [(ATXPCConnection *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventQueue, a4);
    id v10 = (const char *)[v6 UTF8String];
    int v11 = [(ATXPCConnection *)v9 eventQueue];
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v10, v11, 0);
    conn = v9->_conn;
    v9->_conn = mach_service;

    [(ATXPCConnection *)v9 _setEventHandlerOnConnection:v9->_conn];
    xpc_connection_resume(v9->_conn);
  }

  return v9;
}

@end