@interface ASDRequestBroker
+ (id)interface;
- (ASDRequestBroker)init;
- (id)activeRequests;
- (id)description;
- (void)cancelAllRequestsWithErrorHandler:(id)a3;
- (void)markRequestAsActive:(void *)a1;
- (void)markRequestAsComplete:(void *)a1;
- (void)submitRequest:(id)a3 withReplyHandler:(id)a4;
@end

@implementation ASDRequestBroker

- (ASDRequestBroker)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASDRequestBroker;
  v2 = [(ASDRequestBroker *)&v7 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appstored.xpc.request" options:4096];
    [v3 setInvalidationHandler:&__block_literal_global_25];
    [v3 setInterruptionHandler:&__block_literal_global_42];
    v4 = +[ASDRequestBroker interface];
    [v3 setRemoteObjectInterface:v4];

    [v3 resume];
    objc_setProperty_atomic(v2, v5, v3, 16);
  }
  return v2;
}

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C698];
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C6F8];
  [v2 setInterface:v3 forSelector:sel_submitRequest_delegate_withReplyHandler_ argumentIndex:0 ofReply:1];

  v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC58888];
  [v2 setInterface:v4 forSelector:sel_submitRequest_delegate_withReplyHandler_ argumentIndex:1 ofReply:0];

  return v2;
}

uint64_t __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)markRequestAsActive:(void *)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    SEL v5 = -[ASDRequestBroker activeRequests](v4);
    v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v3;
      id v8 = v10;
      _os_log_debug_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@]: Marking request active: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    objc_super v7 = [v3 requestID];
    [v5 setObject:v3 forKeyedSubscript:v7];

    objc_sync_exit(v4);
  }
}

- (void)markRequestAsComplete:(void *)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = a1;
    objc_sync_enter(v4);
    SEL v5 = -[ASDRequestBroker activeRequests](v4);
    v6 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v3;
      id v8 = v10;
      _os_log_debug_impl(&dword_19BF6A000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@]: Marking request completed: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    objc_super v7 = [v3 requestID];
    [v5 setObject:0 forKeyedSubscript:v7];

    objc_sync_exit(v4);
  }
}

- (id)activeRequests
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    v2 = (void *)v1[1];
    if (!v2)
    {
      uint64_t v3 = objc_opt_new();
      id v4 = (void *)v1[1];
      v1[1] = v3;

      v2 = (void *)v1[1];
    }
    id v5 = v2;
    objc_sync_exit(v1);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)submitRequest:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 conformsToProtocol:&unk_1EEC58888] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Request %@ is expected to be a ASDRequestDelegate", v6 format];
  }
  if (self) {
    self = (ASDRequestBroker *)objc_getProperty(self, v8, 16, 1);
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke;
  v14[3] = &unk_1E58B2CB8;
  id v9 = v7;
  id v15 = v9;
  id v10 = [(ASDRequestBroker *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke_2;
  v12[3] = &unk_1E58B4B90;
  id v13 = v9;
  id v11 = v9;
  [v10 submitRequest:v6 delegate:v6 withReplyHandler:v12];
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)ASDRequestBroker;
  uint64_t v3 = [(ASDRequestBroker *)&v16 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendString:@" {"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = -[ASDRequestBroker activeRequests](self);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v4 appendFormat:@"\n\t%@", v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 appendString:@"\n}"];
  return v4;
}

- (void)cancelAllRequestsWithErrorHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    self = (ASDRequestBroker *)objc_getProperty(self, v4, 16, 1);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke;
  v11[3] = &unk_1E58B2CB8;
  id v6 = v5;
  id v12 = v6;
  uint64_t v7 = [(ASDRequestBroker *)self remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke_2;
  v9[3] = &unk_1E58B2CB8;
  id v10 = v6;
  id v8 = v6;
  [v7 cancelAllRequestsWithErrorHandler:v9];
}

uint64_t __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __54__ASDRequestBroker_cancelAllRequestsWithErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __51__ASDRequestBroker_submitRequest_withReplyHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
}

@end