@interface GTURLAccessProviderXPCProxy
- (BOOL)respondsToSelector:(SEL)a3;
- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4;
- (id)makeURL:(id)a3;
- (id)urlForPath:(id)a3;
- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4;
- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5;
@end

@implementation GTURLAccessProviderXPCProxy

- (GTURLAccessProviderXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = &unk_26EFBD7A0;
  v9 = [v7 protocolName];
  v10 = NSStringFromProtocol((Protocol *)v8);
  int v11 = [v9 isEqualToString:v10];

  if (v11)
  {
    v23.receiver = self;
    v23.super_class = (Class)GTURLAccessProviderXPCProxy;
    v12 = [(GTURLAccessProviderXPCProxy *)&v23 init];
    if (v12)
    {
      v13 = [GTServiceConnection alloc];
      v14 = [v7 deviceUDID];
      uint64_t v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, [v7 servicePort]);
      connection = v12->_connection;
      v12->_connection = (GTXPCConnection *)v15;

      v17 = +[GTServiceProperties protocolMethods:v8];
      v18 = [v7 protocolMethods];
      uint64_t v19 = newSetWithArrayMinusArray(v17, v18);
      ignoreMethods = v12->_ignoreMethods;
      v12->_ignoreMethods = (NSSet *)v19;
    }
    self = v12;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

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
    v9.super_class = (Class)GTURLAccessProviderXPCProxy;
    BOOL v7 = [(GTURLAccessProviderXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v8);

  *(_OWORD *)task_info_out = 0u;
  long long v17 = 0u;
  mach_msg_type_number_t task_info_outCnt = 8;
  if (!task_info(*MEMORY[0x263EF8960], 0xFu, task_info_out, &task_info_outCnt)) {
    xpc_dictionary_set_data(empty, "auditToken", task_info_out, 0x20uLL);
  }
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__GTURLAccessProviderXPCProxy_securityScopedURLFromSandboxID_completionHandler___block_invoke;
  v13[3] = &unk_264E28B60;
  id v14 = v7;
  id v12 = v7;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v13];
}

void __80__GTURLAccessProviderXPCProxy_securityScopedURLFromSandboxID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(xdict, "url", v3);
    v5 = nsobject;
    if (nsobject
      && ([nsobject path],
          id v6 = objc_claimAutoreleasedReturnValue(),
          uint64_t v7 = [v6 length],
          v6,
          v7))
    {
      string = xpc_dictionary_get_string(xdict, "sandboxExtension");
      if (string)
      {
        objc_super v9 = [MEMORY[0x263EFF8F8] dataWithBytes:string length:strlen(string) + 1];
        MEMORY[0x23ECD9C40](v5, v9);
      }
      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v10();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)makeURL:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v5);
  id v8 = [(GTXPCConnection *)self->_connection connection];
  xpc_connection_get_audit_token();

  id v9 = v5;
  [v9 fileSystemRepresentation];

  v10 = (const char *)sandbox_extension_issue_file_to_process();
  if (v10)
  {
    int v11 = (char *)v10;
    xpc_dictionary_set_string(empty, "sandboxExtension", v10);
    free(v11);
  }
  id v12 = -[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, 0, 0, 0, 0, 0);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v12, "identifier", v13);
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  id v14 = v10;
  uint64_t v15 = (const char *)[v14 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __77__GTURLAccessProviderXPCProxy_transferIdentifier_toDevice_completionHandler___block_invoke;
  v18[3] = &unk_264E28B60;
  id v19 = v9;
  id v17 = v9;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v18];
}

void __77__GTURLAccessProviderXPCProxy_transferIdentifier_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v5, "url", v3);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "identifier", (uint64_t)v11);

  id v14 = v10;
  uint64_t v15 = (const char *)[v14 UTF8String];

  xpc_dictionary_set_string(empty, "deviceUDID", v15);
  connection = self->_connection;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__GTURLAccessProviderXPCProxy_copyIdentifier_toDevice_completionHandler___block_invoke;
  v18[3] = &unk_264E28B60;
  id v19 = v9;
  id v17 = v9;
  [(GTXPCConnection *)connection sendMessage:empty replyHandler:v18];
}

void __73__GTURLAccessProviderXPCProxy_copyIdentifier_toDevice_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)urlForPath:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = v5;
  id v9 = (const char *)[v8 UTF8String];

  xpc_dictionary_set_string(empty, "path", v9);
  id v10 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    nsobject = xpc_dictionary_get_nsobject(v10, "result", v11);
    string = xpc_dictionary_get_string(v10, "sandboxExtension");
    if (string)
    {
      id v14 = [MEMORY[0x263EFF8F8] dataWithBytes:string length:strlen(string) + 1];
      MEMORY[0x23ECD9C40](nsobject, v14);
    }
  }
  else
  {
    nsobject = 0;
  }

  return nsobject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end