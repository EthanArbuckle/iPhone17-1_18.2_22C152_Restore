@interface GTServiceProviderXPCDispatcher
- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)allServices:(id)a3 replyConnection:(id)a4;
- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4;
- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4;
- (void)deregisterService_:(id)a3 replyConnection:(id)a4;
- (void)registerObserver_:(id)a3 replyConnection:(id)a4;
- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4;
- (void)setConnections:(id)a3;
- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)waitForService_error_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTServiceProviderXPCDispatcher

- (GTServiceProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v9 = (void *)[v8 mutableCopy];

  [v9 addObject:@"broadcastDisconnect"];
  v13.receiver = self;
  v13.super_class = (Class)GTServiceProviderXPCDispatcher;
  v10 = [(GTXPCDispatcher *)&v13 initWithProtocolMethods:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_serviceProvider, a3);
  }

  return v11;
}

- (void)setConnections:(id)a3
{
}

- (void)allServices:(id)a3 replyConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GTServiceProvider *)self->_serviceProvider allServices];
  v9 = gt_xpc_dictionary_create_reply(v6);
  if (([v7 isTrusted] & 1) == 0)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v8 copyItems:1];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v10;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v8);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "serviceProperties", (void)v16);
          [v15 setDeviceUDID:0];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  xpc_dictionary_set_nsobject(v9, "returnValue", (uint64_t)v8);
  [v7 sendMessage:v9];
}

- (void)registerService_forProcess_:(id)a3 replyConnection:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v6, "serviceProperties", v9);
  if (nsobject)
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = xpc_dictionary_get_nsobject(v6, "processInfo", v11);
    if (!v12)
    {
      long long v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      v20 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTServiceProvider", @"Invalid processInfo argument passed to registerService"];
      v24 = v20;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v22 = [v19 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v21];

      xpc_dictionary_set_nserror(v8, "error", v22);
      [v7 sendMessage:v8];

      goto LABEL_7;
    }
    [(GTServiceProvider *)self->_serviceProvider registerService:nsobject forProcess:v12];
    registeredConnections = self->_registeredConnections;
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(nsobject, "servicePort"));
    [(NSMutableDictionary *)registeredConnections setObject:v7 forKeyedSubscript:v14];

    id v15 = [nsobject deviceUDID];
    xpc_dictionary_set_string(v8, "deviceUDID", (const char *)[v15 UTF8String]);

    xpc_dictionary_set_uint64(v8, "servicePort", [nsobject servicePort]);
  }
  else
  {
    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F08320];
    long long v17 = [NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTServiceProvider", @"Invalid serviceProperties argument passed to registerService"];
    v26[0] = v17;
    long long v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v12 = [v16 errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v18];

    xpc_dictionary_set_nserror(v8, "error", v12);
  }
  [v7 sendMessage:v8];
LABEL_7:
}

- (void)waitForService_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = gt_xpc_dictionary_create_reply(v7);
  string = (void *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
  {
    string = [NSString stringWithUTF8String:string];
  }
  serviceProvider = self->_serviceProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__GTServiceProviderXPCDispatcher_waitForService_completionHandler__replyConnection___block_invoke;
  v13[3] = &unk_264E28CF0;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  [(GTServiceProvider *)serviceProvider waitForService:string completionHandler:v13];
}

uint64_t __84__GTServiceProviderXPCDispatcher_waitForService_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void)waitForService_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = gt_xpc_dictionary_create_reply(v7);
  string = (void *)xpc_dictionary_get_string(v7, "protocolName");

  if (string)
  {
    string = [NSString stringWithUTF8String:string];
  }
  serviceProvider = self->_serviceProvider;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__GTServiceProviderXPCDispatcher_waitForService_error__replyConnection___block_invoke;
  v13[3] = &unk_264E28CF0;
  id v14 = v8;
  id v15 = v6;
  id v11 = v6;
  id v12 = v8;
  [(GTServiceProvider *)serviceProvider waitForService:string completionHandler:v13];
}

uint64_t __72__GTServiceProviderXPCDispatcher_waitForService_error__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(void *)(a1 + 32), "error", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void)deregisterService_:(id)a3 replyConnection:(id)a4
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "servicePort");
  [(GTServiceProvider *)self->_serviceProvider deregisterService:uint64];
  registeredConnections = self->_registeredConnections;
  id v7 = [NSNumber numberWithUnsignedLongLong:uint64];
  [(NSMutableDictionary *)registeredConnections removeObjectForKey:v7];
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10 = [(GTServiceObserver *)[GTServiceProviderObserver alloc] initWithMessage:v7 notifyConnection:v6];
  uint64_t v8 = [(GTServiceProvider *)self->_serviceProvider registerObserver:v10];
  uint64_t v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  [v6 sendMessage:v9];
}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GTServiceProvider *)self->_serviceProvider deregisterObserver:xpc_dictionary_get_uint64(v7, "observerId")];
  gt_xpc_dictionary_create_reply(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v6 sendMessage:v8];
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GTServiceProvider *)self->_serviceProvider deregisterObserversForConnection:v6 path:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredConnections, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
}

@end