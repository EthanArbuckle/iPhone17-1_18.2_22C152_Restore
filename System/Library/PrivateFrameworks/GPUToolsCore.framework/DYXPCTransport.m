@interface DYXPCTransport
- (BOOL)_packMessage:(id)a3 error:(id *)a4;
- (BOOL)connected;
- (BOOL)isNewTransport;
- (DYXPCTransport)initWithAMDIdentifier:(id)a3;
- (id)connect;
- (int64_t)_sendMessage:(id)a3 error:(id *)a4;
- (void)_invalidate;
- (void)process_message_from_compat_daemon:(id)a3;
@end

@implementation DYXPCTransport

- (DYXPCTransport)initWithAMDIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DYXPCTransport;
  v5 = [(DYTransport *)&v8 init];
  if (v5)
  {
    id v6 = v4;
    [v6 UTF8String];
    objc_storeStrong((id *)&v5->_amdIdentifier, v6);
  }

  return v5;
}

- (id)connect
{
  if ([(DYXPCTransport *)self connected])
  {
    v3 = +[DYFuture future];
    [(DYFuture *)v3 setResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    future = self->_future;
    if (future)
    {
      v3 = future;
    }
    else
    {
      v5 = (DYFuture *)objc_opt_new();
      id v6 = self->_future;
      self->_future = v5;

      v7 = xpc_connection_create("com.apple.gputools.GPUToolsCompatService", (dispatch_queue_t)self->super._queue);
      connection = self->_connection;
      self->_connection = v7;

      xpc_connection_set_target_queue(self->_connection, (dispatch_queue_t)self->super._queue);
      v9 = self->_connection;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __25__DYXPCTransport_connect__block_invoke;
      handler[3] = &unk_265336D98;
      handler[4] = self;
      xpc_connection_set_event_handler(v9, handler);
      xpc_connection_activate(self->_connection);
      v10 = xpc_connection_create("com.apple.gputools.GPUToolsAgentService", (dispatch_queue_t)self->super._queue);
      xpc_connection_set_event_handler(v10, &__block_literal_global_9);
      xpc_connection_activate(v10);
      xpc_endpoint_t v11 = xpc_endpoint_create(v10);
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(empty, "main_agent_endpoint", v11);
      v13 = self->_connection;
      if (v13)
      {
        xpc_connection_send_message(v13, empty);

        v10 = (_xpc_connection_s *)xpc_dictionary_create_empty();
        xpc_dictionary_set_string(v10, "_cmd", "connect");
        amdIdentifier = self->_amdIdentifier;
        if (amdIdentifier) {
          xpc_dictionary_set_string(v10, "amdIdentifier", [(NSString *)amdIdentifier UTF8String]);
        }
        v15 = self->_connection;
        if (v15)
        {
          queue = self->super._queue;
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __25__DYXPCTransport_connect__block_invoke_3;
          v20[3] = &unk_265336D98;
          v20[4] = self;
          xpc_connection_send_message_with_reply(v15, v10, queue, v20);
          v3 = self->_future;
        }
        else
        {
          v18 = self->_future;
          self->_future = 0;

          v3 = +[DYFuture future];
          [(DYFuture *)v3 setResult:MEMORY[0x263EFFA80]];
        }
      }
      else
      {
        v17 = self->_future;
        self->_future = 0;

        v3 = +[DYFuture future];
        [(DYFuture *)v3 setResult:MEMORY[0x263EFFA80]];
      }
    }
  }

  return v3;
}

uint64_t __25__DYXPCTransport_connect__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "process_message_from_compat_daemon:", a2);
}

void __25__DYXPCTransport_connect__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 128))
  {
    id v12 = v3;
    uint64_t v4 = MEMORY[0x253361D90]();
    if (v4 != MEMORY[0x263EF8720] && v4 == MEMORY[0x263EF8708])
    {
      nserror = (void *)xpc_dictionary_get_nserror(v12, "_error");
      uint64_t v8 = *(void *)(a1 + 32);
      if (nserror) {
        *(unsigned char *)(v8 + 128) = 0;
      }
      else {
        *(unsigned char *)(v8 + 128) = 1;
      }
      v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128)];
      [*(id *)(*(void *)(a1 + 32) + 120) setResult:v9];

      uint64_t v10 = *(void *)(a1 + 32);
      xpc_endpoint_t v11 = *(void **)(v10 + 120);
      *(void *)(v10 + 120) = 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
      v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 128)];
      [*(id *)(*(void *)(a1 + 32) + 120) setResult:v5];

      uint64_t v6 = *(void *)(a1 + 32);
      nserror = *(void **)(v6 + 120);
      *(void *)(v6 + 120) = 0;
    }

    id v3 = v12;
  }
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)_invalidate
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    self->_connected = 0;
    uint64_t v4 = self->_connection;
    self->_connection = 0;

    future = self->_future;
    if (future)
    {
      [(DYFuture *)future setResult:MEMORY[0x263EFFA80]];
      uint64_t v6 = self->_future;
      self->_future = 0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)DYXPCTransport;
  [(DYTransport *)&v7 _invalidate];
}

- (BOOL)isNewTransport
{
  return 1;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 attributes];

  if (!v6) {
    goto LABEL_4;
  }
  objc_super v7 = (void *)MEMORY[0x253361500]();
  uint64_t v8 = (void *)MEMORY[0x263F08AC0];
  v9 = [v5 attributes];
  id v15 = 0;
  uint64_t v10 = [v8 dataWithPropertyList:v9 format:200 options:0 error:&v15];
  id v6 = v15;

  if (v10)
  {
    [v5 setEncodedAttributes:v10];

    id v6 = (id)v10;
LABEL_4:
    int v11 = [v6 length];
    id v12 = [v5 payload];
    a4 = (id *)([v12 length] + v11);

    [v5 _setTransportSize:a4];
    LOBYTE(a4) = 1;
    goto LABEL_5;
  }
  if (a4)
  {
    v14 = [NSDictionary dictionaryWithObject:v6 forKey:*MEMORY[0x263F08608]];
    *a4 = +[DYError errorWithDomain:@"DYErrorDomain" code:36 userInfo:v14];

    LOBYTE(a4) = 0;
  }
LABEL_5:

  return (char)a4;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  id v6 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v9 = empty;
  id v10 = v6;
  xpc_dictionary_set_uint64(v9, "kind", [v10 kind]);
  xpc_dictionary_set_uint64(v9, "serial", [v10 serial]);
  xpc_dictionary_set_uint64(v9, "replySerial", [v10 replySerial]);
  int v11 = [v10 attributes];

  if (v11)
  {
    id v12 = [v10 encodedAttributes];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v15 = (void *)MEMORY[0x263F08AC0];
      v16 = [v10 attributes];
      id v25 = 0;
      id v14 = [v15 dataWithPropertyList:v16 format:200 options:0 error:&v25];
      id v17 = v25;
    }
    id v18 = v14;
    xpc_dictionary_set_data(v9, "attributes", (const void *)[v18 bytes], objc_msgSend(v18, "length"));
  }
  v19 = [v10 payload];

  if (v19)
  {
    id v20 = [v10 payload];
    v21 = (const void *)[v20 bytes];
    v22 = [v10 payload];
    xpc_dictionary_set_data(v9, "payload", v21, [v22 length]);
  }
  [v10 setEncodedAttributes:0];
  xpc_connection_send_message(self->_connection, v9);
  int64_t v23 = [v10 transportSize];

  return v23;
}

- (void)process_message_from_compat_daemon:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x253361D90]() == MEMORY[0x263EF8708])
  {
    id v5 = v4;
    id v6 = self;
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "kind");
    size_t length = 0;
    data = (void *)xpc_dictionary_get_data(v5, "attributes", &length);
    if (data)
    {
      id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v10 = (void *)[v9 initWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v15 = 0;
      data = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:&v15];
    }
    size_t length = 0;
    int v11 = (void *)xpc_dictionary_get_data(v5, "payload", &length);
    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x263EFF8F8]);
      int v11 = (void *)[v12 initWithBytes:v11 length:length];
    }
    v13 = +[DYTransportMessage messageWithKind:uint64 attributes:data payload:v11];
    uint64_t v14 = xpc_dictionary_get_uint64(v5, "serial");
    objc_msgSend(v13, "_setSerial:replySerial:transport:", v14, xpc_dictionary_get_uint64(v5, "replySerial"), v6);

    [(DYTransport *)v6 _dispatchMessage:v13];
  }
  else
  {
    [(DYTransport *)self invalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_amdIdentifier, 0);
}

@end