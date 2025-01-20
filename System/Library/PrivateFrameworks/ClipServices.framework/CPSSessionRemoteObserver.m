@interface CPSSessionRemoteObserver
+ (id)observerWithXPCProxy:(id)a3;
- (CPSSessionRemoteObserver)initWithXPCProxy:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation CPSSessionRemoteObserver

+ (id)observerWithXPCProxy:(id)a3
{
  id v3 = a3;
  v4 = [[CPSSessionRemoteObserver alloc] initWithXPCProxy:v3];

  return v4;
}

- (CPSSessionRemoteObserver)initWithXPCProxy:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSSessionRemoteObserver;
  v6 = [(CPSSessionRemoteObserver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcProxy, a3);
    v8 = v7;
  }

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return (id)[(NSXPCProxyCreating *)self->_xpcProxy remoteObjectProxyWithErrorHandler:&__block_literal_global_4];
}

void __56__CPSSessionRemoteObserver_forwardingTargetForSelector___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__CPSSessionRemoteObserver_forwardingTargetForSelector___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void).cxx_destruct
{
}

void __56__CPSSessionRemoteObserver_forwardingTargetForSelector___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "An error occurred when requesting remote proxy object for session proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end