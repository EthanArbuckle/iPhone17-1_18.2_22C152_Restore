@interface GTLaunchServiceXPCProxy
- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4;
- (BOOL)launchReplayService:(id)a3 error:(id *)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4;
- (GTLaunchServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4;
- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation GTLaunchServiceXPCProxy

- (GTLaunchServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)GTLaunchServiceXPCProxy;
  v8 = [(GTLaunchServiceXPCProxy *)&v23 init];
  if (v8)
  {
    v9 = &unk_26EFBE210;
    v10 = [v7 protocolName];
    v11 = NSStringFromProtocol((Protocol *)v9);
    int v12 = [v10 isEqualToString:v11];

    if (!v12)
    {

      v21 = 0;
      goto LABEL_6;
    }
    v13 = [GTServiceConnection alloc];
    v14 = [v7 deviceUDID];
    uint64_t v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, [v7 servicePort]);
    connection = v8->_connection;
    v8->_connection = (GTXPCConnection *)v15;

    v17 = +[GTServiceProperties protocolMethods:v9];
    v18 = [v7 protocolMethods];
    uint64_t v19 = newSetWithArrayMinusArray(v17, v18);
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v19;
  }
  v21 = v8;
LABEL_6:

  return v21;
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
    v9.super_class = (Class)GTLaunchServiceXPCProxy;
    BOOL v7 = [(GTLaunchServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (BOOL)launchReplayService:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = [v7 environment];
  objc_super v9 = (void *)[v8 mutableCopy];

  v10 = [v7 sessionUUID];
  v11 = [v10 UUIDString];
  [v9 setObject:v11 forKeyedSubscript:@"GT_LAUNCH_UUID"];

  int v12 = (void *)[v9 copy];
  [v7 setEnvironment:v12];

  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v7);

  uint64_t v15 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  v16 = (void *)v15;
  if (v15)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v15, "error");
    v18 = nserror;
    BOOL v19 = nserror == 0;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)foregroundService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  uint64_t v10 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    v13 = nserror;
    BOOL v14 = nserror == 0;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)resumeService:(unint64_t)a3 error:(id *)a4
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  uint64_t v10 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  v11 = (void *)v10;
  if (v10)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v10, "error");
    v13 = nserror;
    BOOL v14 = nserror == 0;
    if (a4 && nserror) {
      *a4 = nserror;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)symbolicatorForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__GTLaunchServiceXPCProxy_symbolicatorForService_completionHandler___block_invoke;
  v12[3] = &unk_264E28B60;
  id v13 = v7;
  id v11 = v7;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v12];
}

void __68__GTLaunchServiceXPCProxy_symbolicatorForService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id nsdata = (id)xpc_dictionary_get_nsdata(a2, "signature");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

- (void)processStateForService:(unint64_t)a3 completionHandler:(id)a4
{
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "servicePort", a3);
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__GTLaunchServiceXPCProxy_processStateForService_completionHandler___block_invoke;
  v12[3] = &unk_264E28B60;
  id v13 = v7;
  id v11 = v7;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v12];
}

void __68__GTLaunchServiceXPCProxy_processStateForService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v3, "error");
    if (nserror)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      id v6 = xpc_dictionary_get_dictionary(v4, "processState");
      if (v6)
      {
        id v7 = objc_alloc_init(GTProcessState);
        [(GTProcessState *)v7 setIsSuspended:xpc_dictionary_get_BOOL(v6, "isSuspended")];
      }
      else
      {
        v8 = (void *)MEMORY[0x263F087E8];
        objc_super v9 = [NSString stringWithFormat:@"Deserialization failed for %@", @"processState", *MEMORY[0x263F08320]];
        v12[0] = v9;
        uint64_t v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
        id v7 = [v8 errorWithDomain:@"com.apple.gputools.transport" code:10 userInfo:v10];
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end