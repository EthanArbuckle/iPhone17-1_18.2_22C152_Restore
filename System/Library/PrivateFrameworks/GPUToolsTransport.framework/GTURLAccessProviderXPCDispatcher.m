@interface GTURLAccessProviderXPCDispatcher
- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)makeURL_:(id)a3 replyConnection:(id)a4;
- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)urlForPath_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTURLAccessProviderXPCDispatcher

- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v11.receiver = self;
  v11.super_class = (Class)GTURLAccessProviderXPCDispatcher;
  v9 = [(GTXPCDispatcher *)&v11 initWithProtocolMethods:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v6, "identifier", v8);
  long long v23 = 0u;
  long long v24 = 0u;
  size_t length = 0;
  data = (long long *)xpc_dictionary_get_data(v6, "auditToken", &length);
  if (data && length == 32)
  {
    long long v11 = data[1];
    long long v23 = *data;
    long long v24 = v11;
  }
  else
  {
    v12 = [v7 connection];
    xpc_connection_get_audit_token();
  }
  v13 = gt_xpc_dictionary_create_reply(v6);
  service = self->_service;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __102__GTURLAccessProviderXPCDispatcher_securityScopedURLFromSandboxID_completionHandler__replyConnection___block_invoke;
  v17[3] = &unk_264E28B88;
  id v18 = v7;
  id v19 = v13;
  long long v20 = v23;
  long long v21 = v24;
  id v15 = v13;
  id v16 = v7;
  [(GTURLAccessProvider *)service securityScopedURLFromSandboxID:nsobject completionHandler:v17];
}

void __102__GTURLAccessProviderXPCDispatcher_securityScopedURLFromSandboxID_completionHandler__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    int v5 = [v3 startAccessingSecurityScopedResource];
    xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "url", (uint64_t)v4);
    id v6 = v4;
    [v6 fileSystemRepresentation];
    long long v9 = *(_OWORD *)(a1 + 48);
    long long v10 = *(_OWORD *)(a1 + 64);
    id v7 = (const char *)sandbox_extension_issue_file_to_process();
    if (v7)
    {
      uint64_t v8 = (char *)v7;
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), "sandboxExtension", v7);
      free(v8);
    }
    if (v5) {
      objc_msgSend(v6, "stopAccessingSecurityScopedResource", v9, v10);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "sendMessage:", *(void *)(a1 + 40), v9, v10);
}

- (void)makeURL_:(id)a3 replyConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  id v7 = gt_xpc_dictionary_create_reply(xdict);
  uint64_t v8 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(xdict, "url", v8);
  if (nsobject)
  {
    string = xpc_dictionary_get_string(xdict, "sandboxExtension");
    if (string)
    {
      long long v11 = [MEMORY[0x263EFF8F8] dataWithBytes:string length:strlen(string) + 1];
      MEMORY[0x23ECD9C40](nsobject, v11);
    }
    v12 = [(GTURLAccessProvider *)self->_service makeURL:nsobject];
    if (([v6 isTrusted] & 1) == 0)
    {
      v13 = [MEMORY[0x263F08BA0] componentsWithURL:v12 resolvingAgainstBaseURL:1];
      [v13 setHost:@"localhost"];
      uint64_t v14 = [v13 URL];

      v12 = (void *)v14;
    }
    xpc_dictionary_set_nsobject(v7, "identifier", (uint64_t)v12);
  }
  [v6 sendMessage:v7];
}

- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v9);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && ([NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    service = self->_service;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __99__GTURLAccessProviderXPCDispatcher_transferIdentifier_toDevice_completionHandler__replyConnection___block_invoke;
    v15[3] = &unk_264E28BB0;
    id v16 = v8;
    id v17 = v6;
    [(GTURLAccessProvider *)service transferIdentifier:nsobject toDevice:v13 completionHandler:v15];
  }
  else
  {
    [v6 sendMessage:v8];
  }
}

uint64_t __99__GTURLAccessProviderXPCDispatcher_transferIdentifier_toDevice_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "url", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v9);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && ([NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    service = self->_service;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __95__GTURLAccessProviderXPCDispatcher_copyIdentifier_toDevice_completionHandler__replyConnection___block_invoke;
    v18[3] = &unk_264E28BD8;
    id v19 = v8;
    id v20 = v6;
    [(GTURLAccessProvider *)service copyIdentifier:nsobject toDevice:v13 completionHandler:v18];
  }
  else
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    id v16 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTURLAccessProviderXPCDispatcher", @"Invalid device UDID passed to copyIdentifier"];
    v22[0] = v16;
    id v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v13 = [v15 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v17];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v6 sendMessage:v8];
  }
}

uint64_t __95__GTURLAccessProviderXPCDispatcher_copyIdentifier_toDevice_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", v6);

  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  return [v7 sendMessage:v8];
}

- (void)urlForPath_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v7);
  string = xpc_dictionary_get_string(v7, "path");

  if (string
    && ([NSString stringWithUTF8String:string],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v11 = (void *)v10;
    uint64_t v12 = [(GTURLAccessProvider *)self->_service urlForPath:v10];
    int v13 = [v12 startAccessingSecurityScopedResource];
    xpc_dictionary_set_nsobject(v8, "result", (uint64_t)v12);
    uint64_t v14 = [v6 connection];
    xpc_connection_get_audit_token();

    id v15 = v12;
    [v15 fileSystemRepresentation];
    long long v18 = 0u;
    long long v19 = 0u;
    id v16 = (const char *)sandbox_extension_issue_file_to_process();
    if (v16)
    {
      id v17 = (char *)v16;
      xpc_dictionary_set_string(v8, "sandboxExtension", v16);
      free(v17);
    }
    if (v13) {
      objc_msgSend(v15, "stopAccessingSecurityScopedResource", 0, 0, 0, 0);
    }
    objc_msgSend(v6, "sendMessage:", v8, v18, v19);
  }
  else
  {
    [v6 sendMessage:v8];
  }
}

- (void).cxx_destruct
{
}

@end