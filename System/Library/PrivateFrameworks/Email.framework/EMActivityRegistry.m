@interface EMActivityRegistry
+ (NSXPCInterface)observerInterface;
+ (NSXPCInterface)remoteInterface;
- (EMActivityRegistry)initWithRemoteConnection:(id)a3;
- (EMRemoteConnection)connection;
- (id)registerActivityObserver:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation EMActivityRegistry

+ (NSXPCInterface)remoteInterface
{
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A86750];
  v4 = [a1 observerInterface];
  [v3 setInterface:v4 forSelector:sel_registerActivityObserver_completion_ argumentIndex:0 ofReply:0];

  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A64B98];
  [v3 setInterface:v5 forSelector:sel_registerActivityObserver_completion_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v3 setClasses:v8 forSelector:sel_registerActivityObserver_completion_ argumentIndex:1 ofReply:1];

  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)observerInterface
{
  return (NSXPCInterface *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A64CB0];
}

void __47__EMActivityRegistry_registerActivityObserver___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  v2 = (os_unfair_lock_s *)(*(void *)(a1 + 40) + 16);
  os_unfair_lock_lock(v2);
  [*(id *)(*(void *)(a1 + 40) + 8) removeObjectForKey:*(void *)(a1 + 48)];
  os_unfair_lock_unlock(v2);
}

- (id)registerActivityObserver:(id)a3
{
  id v4 = a3;
  v5 = [_EMActivityRegistryObserverWrapper alloc];
  v6 = [(EMActivityRegistry *)self connection];
  uint64_t v7 = [(_EMActivityRegistryObserverWrapper *)v5 initWithConnection:v6 registry:self observer:v4];

  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_observerWrappersByObserver setObject:v7 forKey:v4];
  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)MEMORY[0x1E4F60D40];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__EMActivityRegistry_registerActivityObserver___block_invoke;
  v13[3] = &unk_1E63E2848;
  v9 = v7;
  v14 = v9;
  v15 = self;
  id v10 = v4;
  id v16 = v10;
  v11 = [v8 tokenWithCancelationBlock:v13];
  [(_EMActivityRegistryObserverWrapper *)v9 _startObservingIfNecessary];

  return v11;
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 24, 1);
}

- (EMActivityRegistry)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMActivityRegistry;
  v6 = [(EMActivityRegistry *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observerWrappersByObserver = v7->_observerWrappersByObserver;
    v7->_observerWrappersByObserver = (NSMapTable *)v8;
  }
  return v7;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observerWrappersByObserver, 0);
}

@end