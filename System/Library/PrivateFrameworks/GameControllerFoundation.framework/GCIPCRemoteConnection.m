@interface GCIPCRemoteConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)peerAuditToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConnection:(id)a3;
- (BOOL)isInvalid;
- (GCIPCRemoteConnection)init;
- (GCIPCRemoteConnection)initWithConnection:(id)a3;
- (NSArray)interruptionHandlers;
- (NSArray)invalidationHandlers;
- (NSString)peerBundleIdentifier;
- (NSXPCConnection)connection;
- (id)addInterruptionHandler:(id)a3;
- (id)addInvalidationHandler:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)peerValueForEntitlement:(id)a3;
- (id)redactedDescription;
- (id)remoteProxy;
- (id)remoteProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteProxyWithErrorHandler:(id)a3;
- (int)peerAuditSessionIdentifier;
- (int)peerProcessIdentifier;
- (unint64_t)hash;
- (unsigned)peerEffectiveGroupIdentifier;
- (unsigned)peerEffectiveUserIdentifier;
- (void)invalidate;
- (void)resume;
- (void)scheduleSendBarrierBlock:(id)a3;
- (void)setConnection:(id)a3;
- (void)setInterruptionHandlers:(id)a3;
- (void)setInvalidationHandlers:(id)a3;
- (void)suspend;
@end

@implementation GCIPCRemoteConnection

- (GCIPCRemoteConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GCIPCRemoteConnection;
  v6 = [(GCIPCRemoteConnection *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = objc_opt_new();
    interruptionHandlers = v7->_interruptionHandlers;
    v7->_interruptionHandlers = (NSArray *)v8;

    uint64_t v10 = objc_opt_new();
    invalidationHandlers = v7->_invalidationHandlers;
    v7->_invalidationHandlers = (NSArray *)v10;

    atomic_store(0, (unsigned __int8 *)&v7->_invalid);
    v12 = v7;
    connection = v7->_connection;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __44__GCIPCRemoteConnection_initWithConnection___block_invoke;
    v20[3] = &unk_26BEC3CA8;
    v14 = v12;
    v21 = v14;
    [(NSXPCConnection *)connection setInterruptionHandler:v20];
    v15 = v7->_connection;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __44__GCIPCRemoteConnection_initWithConnection___block_invoke_1;
    v18[3] = &unk_26BEC3CA8;
    v19 = v14;
    v16 = v14;
    [(NSXPCConnection *)v15 setInvalidationHandler:v18];
  }
  return v7;
}

void __44__GCIPCRemoteConnection_initWithConnection___block_invoke(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_20AD04000, "[IPC] Connection Interrupted", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_20AD04000, v3, OS_LOG_TYPE_INFO, "Connection interrupted: %@", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "interruptionHandlers", 0);
  v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }

  os_activity_scope_leave(&state);
}

void __44__GCIPCRemoteConnection_initWithConnection___block_invoke_1(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_20AD04000, "[IPC] Connection Invalidated", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);
  v3 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_20AD04000, v3, OS_LOG_TYPE_INFO, "Connection invalidated: %@", buf, 0xCu);
  }

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 8));
  v6 = [*(id *)(a1 + 32) invalidationHandlers];
  objc_sync_exit(v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v7 = objc_msgSend(v6, "reverseObjectEnumerator", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }

  os_activity_scope_leave(&state);
}

- (GCIPCRemoteConnection)init
{
  return 0;
}

- (void)resume
{
}

- (void)suspend
{
}

- (void)invalidate
{
}

- (BOOL)isInvalid
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalid);
  return v2 & 1;
}

- (id)addInterruptionHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if (v6)
  {
    objc_sync_exit(v5);

    long long v11 = 0;
  }
  else
  {
    uint64_t v7 = [(GCIPCRemoteConnection *)v5 interruptionHandlers];
    uint64_t v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = _Block_copy(v4);
    [v8 addObject:v9];

    [(GCIPCRemoteConnection *)v5 setInterruptionHandlers:v8];
    objc_sync_exit(v5);

    uint64_t v10 = [_GCDisposable alloc];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __48__GCIPCRemoteConnection_addInterruptionHandler___block_invoke;
    v13[3] = &unk_26BEC42B8;
    v13[4] = v5;
    id v14 = v4;
    long long v11 = [(_GCDisposable *)v10 initWithCleanupHandler:v13];
  }

  return v11;
}

void __48__GCIPCRemoteConnection_addInterruptionHandler___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  unsigned __int8 v2 = [*(id *)(a1 + 32) interruptionHandlers];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = _Block_copy(*(const void **)(a1 + 40));
  [v3 removeObject:v4];

  [*(id *)(a1 + 32) setInterruptionHandlers:v3];
  objc_sync_exit(obj);
}

- (id)addInvalidationHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v5->_invalid);
  if (v6)
  {
    objc_sync_exit(v5);

    long long v11 = 0;
  }
  else
  {
    uint64_t v7 = [(GCIPCRemoteConnection *)v5 invalidationHandlers];
    uint64_t v8 = (void *)[v7 mutableCopy];

    uint64_t v9 = _Block_copy(v4);
    [v8 addObject:v9];

    [(GCIPCRemoteConnection *)v5 setInvalidationHandlers:v8];
    objc_sync_exit(v5);

    uint64_t v10 = [_GCDisposable alloc];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __48__GCIPCRemoteConnection_addInvalidationHandler___block_invoke;
    v13[3] = &unk_26BEC42B8;
    v13[4] = v5;
    id v14 = v4;
    long long v11 = [(_GCDisposable *)v10 initWithCleanupHandler:v13];
  }

  return v11;
}

void __48__GCIPCRemoteConnection_addInvalidationHandler___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  unsigned __int8 v2 = [*(id *)(a1 + 32) invalidationHandlers];
  v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = _Block_copy(*(const void **)(a1 + 40));
  [v3 removeObject:v4];

  [*(id *)(a1 + 32) setInvalidationHandlers:v3];
  objc_sync_exit(obj);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)peerAuditToken
{
  uint64_t v4 = [(GCIPCRemoteConnection *)self connection];
  if (v4)
  {
    unsigned __int8 v6 = v4;
    [v4 auditToken];
    uint64_t v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (int)peerAuditSessionIdentifier
{
  unsigned __int8 v2 = [(GCIPCRemoteConnection *)self connection];
  int v3 = [v2 auditSessionIdentifier];

  return v3;
}

- (int)peerProcessIdentifier
{
  unsigned __int8 v2 = [(GCIPCRemoteConnection *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (unsigned)peerEffectiveUserIdentifier
{
  unsigned __int8 v2 = [(GCIPCRemoteConnection *)self connection];
  unsigned int v3 = [v2 effectiveUserIdentifier];

  return v3;
}

- (unsigned)peerEffectiveGroupIdentifier
{
  unsigned __int8 v2 = [(GCIPCRemoteConnection *)self connection];
  unsigned int v3 = [v2 effectiveGroupIdentifier];

  return v3;
}

- (NSString)peerBundleIdentifier
{
  unsigned __int8 v2 = [(GCIPCRemoteConnection *)self connection];
  unsigned int v3 = -[NSXPCConnection gc_peerBundleIdentifier]();

  return (NSString *)v3;
}

- (id)peerValueForEntitlement:(id)a3
{
  id v4 = a3;
  id v5 = [(GCIPCRemoteConnection *)self connection];
  unsigned __int8 v6 = [v5 valueForEntitlement:v4];

  return v6;
}

- (void)scheduleSendBarrierBlock:(id)a3
{
}

- (id)remoteProxy
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxy];
}

- (id)remoteProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (id)synchronousRemoteProxyWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (BOOL)isEqualToConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(GCIPCRemoteConnection *)self connection];
  unsigned __int8 v6 = [v4 connection];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GCIPCRemoteConnection *)self isEqualToConnection:v4];

  return v5;
}

- (unint64_t)hash
{
  unsigned __int8 v2 = [(GCIPCRemoteConnection *)self connection];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v4) {
    BOOL v5 = " (invalid)";
  }
  else {
    BOOL v5 = "";
  }
  return +[NSString stringWithFormat:@"<%@%s remote.pid: %i>", v3, v5, [(NSXPCConnection *)self->_connection processIdentifier]];
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v4) {
    BOOL v5 = " (invalid)";
  }
  else {
    BOOL v5 = "";
  }
  return +[NSString stringWithFormat:@"<%@%s remote.pid: %i>", v3, v5, [(NSXPCConnection *)self->_connection processIdentifier]];
}

- (id)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v5) {
    unsigned __int8 v6 = " (invalid)";
  }
  else {
    unsigned __int8 v6 = "";
  }
  uint64_t v7 = +[NSString stringWithFormat:@"<%@ %p%s remote.pid: %i>", v4, self, v6, [(NSXPCConnection *)self->_connection processIdentifier]];

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSArray)interruptionHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInterruptionHandlers:(id)a3
{
}

- (NSArray)invalidationHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInvalidationHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_storeStrong((id *)&self->_interruptionHandlers, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end