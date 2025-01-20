@interface _GCAgentClientProxy
+ (id)clientProxyWithConnection:(id)a3 server:(id)a4 userDefaultsProxy:(id)a5;
- (GCRemoteUserDefaultsProxy)userDefaultsProxy;
- (NSArray)invalidationHandlers;
- (_GCAgentClientProxy)init;
- (id)_initWithConnection:(id)a3 server:(id)a4 userDefaultsProxy:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (void)_invalidate;
- (void)connectToUserDefaultsXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)connectToVideoRelocationXPCProxyServiceWithClient:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)getTheLastGeneratedURLWithReply:(id)a3;
- (void)observeUserDefaultsValueForKeyPath:(id)a3 change:(id)a4;
- (void)pingWithReply:(id)a3;
- (void)setInvalidationHandlers:(id)a3;
- (void)userDefaultsCheckIn:(id)a3;
@end

@implementation _GCAgentClientProxy

+ (id)clientProxyWithConnection:(id)a3 server:(id)a4 userDefaultsProxy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) _initWithConnection:v10 server:v9 userDefaultsProxy:v8];

  return v11;
}

- (id)_initWithConnection:(id)a3 server:(id)a4 userDefaultsProxy:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_GCAgentClientProxy;
  v12 = [(_GCAgentClientProxy *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_server, a4);
    objc_storeStrong((id *)&v13->_connection, a3);
    objc_storeWeak((id *)&v13->_userDefaultsProxy, v11);
    uint64_t v14 = objc_opt_new();
    invalidationHandlers = v13->_invalidationHandlers;
    v13->_invalidationHandlers = (NSArray *)v14;

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __68___GCAgentClientProxy__initWithConnection_server_userDefaultsProxy___block_invoke;
    v24[3] = &unk_26D22A8C0;
    v16 = v13;
    v25 = v16;
    v17 = (void *)MEMORY[0x223C6E420](v24);
    uint64_t v18 = [(_GCIPCIncomingConnection *)v13->_connection addInvalidationHandler:v17];
    id connectionInvalidationRegistration = v16->_connectionInvalidationRegistration;
    v16->_id connectionInvalidationRegistration = (id)v18;

    uint64_t v20 = [(_GCIPCIncomingConnection *)v13->_connection addInterruptionHandler:v17];
    id connectionInterruptedRegistration = v16->_connectionInterruptedRegistration;
    v16->_id connectionInterruptedRegistration = (id)v20;

    if (gc_isInternalBuild())
    {
      v23 = getGCLogger();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[_GCAgentClientProxy _initWithConnection:server:userDefaultsProxy:]((uint64_t)v16, v23);
      }
    }
  }

  return v13;
}

- (_GCAgentClientProxy)init
{
  return 0;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    v5 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v5 handleFailureInMethod:a2, self, @"GCAgentClientProxy.m", 77, @"%@ is being deallocated, but is still valid.", self object file lineNumber description];
  }
  [(_GCAgentClientProxy *)self _invalidate];
  v6.receiver = self;
  v6.super_class = (Class)_GCAgentClientProxy;
  [(_GCAgentClientProxy *)&v6 dealloc];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v4) {
    v5 = " (invalid)";
  }
  else {
    v5 = "";
  }
  objc_super v6 = [(_GCIPCIncomingConnection *)self->_connection process];
  uint64_t v7 = [v6 processIdentifier];
  id v8 = [(_GCIPCIncomingConnection *)self->_connection process];
  id v9 = [v8 bundleIdentifier];
  id v10 = +[NSString stringWithFormat:@"<%@%s client.pid: %i, client.bundleIdentifier: %@>", v3, v5, v7, v9];

  return v10;
}

- (id)redactedDescription
{
  uint64_t v3 = objc_opt_class();
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v4) {
    v5 = " (invalid)";
  }
  else {
    v5 = "";
  }
  objc_super v6 = [(_GCIPCIncomingConnection *)self->_connection process];
  uint64_t v7 = [v6 processIdentifier];
  id v8 = [(_GCIPCIncomingConnection *)self->_connection process];
  id v9 = [v8 bundleIdentifier];
  id v10 = +[NSString stringWithFormat:@"<%@%s client.pid: %i, client.bundleIdentifier: %@>", v3, v5, v7, v9];

  return v10;
}

- (id)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  unsigned __int8 v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_invalid);
  if (v5) {
    objc_super v6 = " (invalid)";
  }
  else {
    objc_super v6 = "";
  }
  uint64_t v7 = [(_GCIPCIncomingConnection *)self->_connection process];
  uint64_t v8 = [v7 processIdentifier];
  id v9 = [(_GCIPCIncomingConnection *)self->_connection process];
  id v10 = [v9 bundleIdentifier];
  id v11 = +[NSString stringWithFormat:@"<%@ %p%s client.pid: %i, client.bundleIdentifier: %@>", v4, self, v6, v8, v10];

  return v11;
}

- (void)_invalidate
{
  p_invalid = &self->_invalid;
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalid);
  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = self;
    objc_sync_enter(v4);
    atomic_store(1u, (unsigned __int8 *)p_invalid);
    unsigned __int8 v5 = [(_GCAgentClientProxy *)v4 invalidationHandlers];
    objc_sync_exit(v4);

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v6 = objc_msgSend(v5, "reverseObjectEnumerator", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v7);
    }

    if (gc_isInternalBuild())
    {
      v15 = getGCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "Agent client proxy invalidated: %@", buf, 0xCu);
      }
    }
    id connectionInterruptedRegistration = v4->_connectionInterruptedRegistration;
    v4->_id connectionInterruptedRegistration = 0;

    id connectionInvalidationRegistration = v4->_connectionInvalidationRegistration;
    v4->_id connectionInvalidationRegistration = 0;

    connection = v4->_connection;
    p_connection = (void **)&v4->_connection;
    [(_GCIPCIncomingConnection *)connection invalidate];
    uint64_t v14 = *p_connection;
    *p_connection = 0;
  }
}

- (void)pingWithReply:(id)a3
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __37___GCAgentClientProxy_pingWithReply___block_invoke;
  activity_block[3] = &unk_26D22C018;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_220998000, "(App Client) Ping", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToUserDefaultsXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __76___GCAgentClientProxy_connectToUserDefaultsXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'User Defaults XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)connectToVideoRelocationXPCProxyServiceWithClient:(id)a3 reply:(id)a4
{
  id v6 = a3;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = __79___GCAgentClientProxy_connectToVideoRelocationXPCProxyServiceWithClient_reply___block_invoke;
  activity_block[3] = &unk_26D22C468;
  id v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  _os_activity_initiate(&dword_220998000, "(App Client) Connect 'Video Relocation XPC Proxy Service'", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (NSArray)invalidationHandlers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInvalidationHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationHandlers, 0);
  objc_destroyWeak((id *)&self->_userDefaultsProxy);
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)getTheLastGeneratedURLWithReply:(id)a3
{
}

- (void)userDefaultsCheckIn:(id)a3
{
  p_userDefaultsProxy = &self->_userDefaultsProxy;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userDefaultsProxy);
  objc_msgSend(WeakRetained, "userDefaultsCheckIn:effectiveUserIdentifier:", v5, -[_GCIPCIncomingConnection peerEffectiveUserIdentifier](self->_connection, "peerEffectiveUserIdentifier"));
}

- (void)observeUserDefaultsValueForKeyPath:(id)a3 change:(id)a4
{
  p_userDefaultsProxy = &self->_userDefaultsProxy;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_userDefaultsProxy);
  [WeakRetained observeUserDefaultsValueForKeyPath:v7 change:v6];
}

- (GCRemoteUserDefaultsProxy)userDefaultsProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefaultsProxy);

  return (GCRemoteUserDefaultsProxy *)WeakRetained;
}

- (void)_initWithConnection:(uint64_t)a1 server:(NSObject *)a2 userDefaultsProxy:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "Agent client proxy created: %@", (uint8_t *)&v2, 0xCu);
}

@end