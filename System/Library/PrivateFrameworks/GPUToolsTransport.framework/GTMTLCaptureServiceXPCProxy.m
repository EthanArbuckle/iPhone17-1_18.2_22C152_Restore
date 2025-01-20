@interface GTMTLCaptureServiceXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTMTLCaptureServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (GTServiceProperties)serviceProperties;
- (id)createCaptureDescriptor;
- (id)query:(id)a3;
- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4;
- (id)update:(id)a3;
- (unint64_t)nextRequestID;
- (unint64_t)registerObserver:(id)a3;
- (void)abort;
- (void)deregisterObserver:(unint64_t)a3;
- (void)resume;
- (void)stop;
@end

@implementation GTMTLCaptureServiceXPCProxy

- (GTMTLCaptureServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GTMTLCaptureServiceXPCProxy;
  v8 = [(GTMTLCaptureServiceXPCProxy *)&v23 init];
  if (v8)
  {
    v9 = &unk_26EFBC368;
    v10 = [GTServiceConnection alloc];
    v11 = [v7 deviceUDID];
    uint64_t v12 = -[GTServiceConnection initWithConnection:device:port:](v10, "initWithConnection:device:port:", v6, v11, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v12;

    v14 = +[GTServiceProperties protocolMethods:v9];
    v15 = [v7 protocolMethods];
    uint64_t v16 = newSetWithArrayMinusArray(v14, v15);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v16;

    uint64_t v18 = [MEMORY[0x263EFFA78] mutableCopy];
    observerIdToPort = v8->_observerIdToPort;
    v8->_observerIdToPort = (NSMutableDictionary *)v18;

    os_log_t v20 = os_log_create("com.apple.gputools.transport", "CaptureProxy");
    log = v8->_log;
    v8->_log = (OS_os_log *)v20;

    objc_storeStrong((id *)&v8->_serviceProperties, a4);
  }

  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  id v6 = NSStringFromSelector(a3);
  if ([(NSSet *)ignoreMethods containsObject:v6])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTMTLCaptureServiceXPCProxy;
    BOOL v7 = [(GTMTLCaptureServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (unint64_t)registerObserver:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v8 = [[GTMTLCaptureServiceReplyStream alloc] initWithObserver:v5];

  unint64_t v9 = [(GTServiceConnection *)self->_connection registerDispatcher:v8];
  connection = self->_connection;
  id v18 = 0;
  v11 = [(GTServiceConnection *)connection sendMessageWithReplySync:empty replyStreamId:v9 error:&v18];
  id v12 = v18;
  if (v11)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v11, "observerId");
    v14 = [NSNumber numberWithUnsignedLongLong:v9];
    observerIdToPort = self->_observerIdToPort;
    uint64_t v16 = [NSNumber numberWithUnsignedLongLong:uint64];
    [(NSMutableDictionary *)observerIdToPort setObject:v14 forKeyedSubscript:v16];
  }
  else
  {
    uint64_t uint64 = 0;
  }

  return uint64;
}

- (void)deregisterObserver:(unint64_t)a3
{
  observerIdToPort = self->_observerIdToPort;
  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  v8 = [(NSMutableDictionary *)observerIdToPort objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 unsignedLongValue];

  v10 = self->_observerIdToPort;
  v11 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  id v13 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:xdict error:0];
  [(GTServiceConnection *)self->_connection deregisterDispatcher:v9];
}

- (void)abort
{
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  [(GTServiceConnection *)self->_connection sendMessage:xdict];
}

- (void)resume
{
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  [(GTServiceConnection *)self->_connection sendMessage:xdict];
}

- (void)stop
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "stop", v1, 2u);
}

- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = -[GTCaptureRequestToken initWithCaptureService:andTokenId:]([GTCaptureRequestToken alloc], "initWithCaptureService:andTokenId:", self, [v7 requestID]);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[GTMTLCaptureServiceXPCProxy startWithDescriptor:completionHandler:]((uint64_t)v7, log);
    }
    xpc_object_t empty = xpc_dictionary_create_empty();
    Name = sel_getName(a2);
    xpc_dictionary_set_string(empty, "_cmd", Name);
    xpc_dictionary_set_nsobject(empty, "descriptor", (uint64_t)v7);
    connection = self->_connection;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke;
    v17[3] = &unk_264E289A8;
    id v20 = v8;
    v14 = v9;
    id v18 = v14;
    v19 = self;
    [(GTServiceConnection *)connection sendMessage:empty replyHandler:v17];
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v35[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = v7;
  if (v5)
  {
    uint64_t v9 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v5, "response", v9);
    v11 = [nsobject error];

    if (v11)
    {
      id v12 = *(NSObject **)(*(void *)(a1 + 40) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_2(v12);
      }
      uint64_t v13 = *MEMORY[0x263F08348];
      v34[0] = *MEMORY[0x263F08320];
      v34[1] = v13;
      v35[0] = @"Capture Service serialization issue";
      v35[1] = @"Failure to encode data from requested";
      v14 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
      v15 = [MEMORY[0x263F087E8] errorWithDomain:@"GTCaptureService" code:54 userInfo:v14];
      [v8 setError:v15];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 32) completed];
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x263EFFA08]);
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      v14 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, v20, objc_opt_class(), 0);
      v21 = (void *)MEMORY[0x263F08928];
      v22 = [nsobject data];
      id v31 = v6;
      objc_super v23 = [v21 unarchivedObjectOfClasses:v14 fromData:v22 error:&v31];
      id v24 = v31;

      if (v23)
      {
        v25 = [v23 objectForKeyedSubscript:@"archiveURL"];
        [v8 setArchiveURL:v25];

        v26 = [v23 objectForKeyedSubscript:@"error"];
        [v8 setError:v26];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        [*(id *)(a1 + 32) completed];
      }
      else
      {
        v27 = *(NSObject **)(*(void *)(a1 + 40) + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_1(v27);
        }
        uint64_t v28 = *MEMORY[0x263F08348];
        v32[0] = *MEMORY[0x263F08320];
        v32[1] = v28;
        v33[0] = @"Capture Service deserialization issue";
        v33[1] = @"Failure to decode data from requested";
        v29 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
        v30 = [MEMORY[0x263F087E8] errorWithDomain:@"GTCaptureService" code:54 userInfo:v29];
        [v8 setError:v30];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        [*(id *)(a1 + 32) completed];
      }
      id v6 = v24;
    }
  }
  else
  {
    [v7 setError:v6];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) completed];
  }
}

- (id)update:(id)a3
{
  connection = self->_connection;
  id v6 = a3;
  Name = sel_getName(a2);
  id v8 = ProxyCaptureBatchRequest(connection, self, v6, Name);

  return v8;
}

- (id)query:(id)a3
{
  connection = self->_connection;
  id v6 = a3;
  Name = sel_getName(a2);
  id v8 = ProxyCaptureBatchRequest(connection, self, v6, Name);

  return v8;
}

- (unint64_t)nextRequestID
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v6 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  id v7 = v6;
  if (v6) {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "requestID");
  }
  else {
    uint64_t uint64 = 0;
  }

  return uint64;
}

- (id)createCaptureDescriptor
{
  v3 = [[GTCaptureDescriptor alloc] initWithRequestID:[(GTMTLCaptureServiceXPCProxy *)self nextRequestID]];
  v4 = [(GTMTLCaptureServiceXPCProxy *)self serviceProperties];
  unint64_t v5 = [v4 version];

  if (v5 <= 2) {
    [(GTCaptureDescriptor *)v3 setSessionID:0];
  }
  return v3;
}

- (GTServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)startWithDescriptor:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23C048000, a2, OS_LOG_TYPE_DEBUG, "StartWithDescriptor: %@", (uint8_t *)&v2, 0xCu);
}

void __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "deserialization error", v1, 2u);
}

void __69__GTMTLCaptureServiceXPCProxy_startWithDescriptor_completionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "serialization error", v1, 2u);
}

@end