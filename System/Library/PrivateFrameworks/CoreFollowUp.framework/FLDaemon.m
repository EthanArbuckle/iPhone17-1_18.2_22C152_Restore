@interface FLDaemon
+ (id)daemonWithErrorHandler:(id)a3;
+ (id)sharedInstance;
- (FLDaemon)daemonWithErrorHandler:(id)a3;
- (FLDaemon)init;
- (NSXPCListenerEndpoint)daemonXPCEndpoint;
- (id)connection;
- (id)remoteObjectInterface;
- (id)synchronousDaemonWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)invalidateConnection;
- (void)setDaemonXPCEndpoint:(id)a3;
@end

@implementation FLDaemon

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(FLDaemon *)self connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)connection
{
  [(NSLock *)self->_connLock lock];
  conn = self->_conn;
  if (!conn)
  {
    daemonXPCEndpoint = self->_daemonXPCEndpoint;
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    if (daemonXPCEndpoint) {
      v6 = (NSXPCConnection *)[v5 initWithListenerEndpoint:self->_daemonXPCEndpoint];
    }
    else {
      v6 = (NSXPCConnection *)[v5 initWithMachServiceName:@"com.apple.corefollowup.agent" options:0];
    }
    v7 = self->_conn;
    self->_conn = v6;

    v8 = self->_conn;
    v9 = [(FLDaemon *)self remoteObjectInterface];
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__2;
    v16[4] = __Block_byref_object_dispose__2;
    v17 = self;
    v10 = self->_conn;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __22__FLDaemon_connection__block_invoke;
    v15[3] = &unk_1E637AFD8;
    v15[4] = v16;
    [(NSXPCConnection *)v10 setInterruptionHandler:v15];
    v11 = self->_conn;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __22__FLDaemon_connection__block_invoke_6;
    v14[3] = &unk_1E637AFD8;
    v14[4] = v16;
    [(NSXPCConnection *)v11 setInvalidationHandler:v14];
    [(NSXPCConnection *)self->_conn resume];
    _Block_object_dispose(v16, 8);

    conn = self->_conn;
  }
  v12 = conn;
  [(NSLock *)self->_connLock unlock];

  return v12;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance_instance_0;

  return v2;
}

- (id)remoteObjectInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18DCE60];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_pendingFollowUpItemsForClientIdentifier_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

uint64_t __26__FLDaemon_sharedInstance__block_invoke()
{
  sharedInstance_instance_0 = objc_alloc_init(FLDaemon);

  return MEMORY[0x1F41817F8]();
}

- (FLDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLDaemon;
  v2 = [(FLDaemon *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    connLock = v2->_connLock;
    v2->_connLock = v3;
  }
  return v2;
}

+ (id)daemonWithErrorHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[FLDaemon sharedInstance];
  uint64_t v5 = [v4 daemonWithErrorHandler:v3];

  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_conn invalidate];
  v3.receiver = self;
  v3.super_class = (Class)FLDaemon;
  [(FLDaemon *)&v3 dealloc];
}

uint64_t __22__FLDaemon_connection__block_invoke(uint64_t result)
{
  uint64_t v1 = result + 32;
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    v2 = _FLLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __34__FLUIHelperController_connection__block_invoke_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 16) lock];
    [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 8) invalidate];
    uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 8) + 40);
    uint64_t v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    return [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 16) unlock];
  }
  return result;
}

uint64_t __22__FLDaemon_connection__block_invoke_6(uint64_t result)
{
  uint64_t v1 = result + 32;
  if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 40))
  {
    v2 = _FLLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __34__FLUIHelperController_connection__block_invoke_9_cold_1();
    }

    [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 16) lock];
    uint64_t v3 = *(void *)(*(void *)(*(void *)v1 + 8) + 40);
    uint64_t v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = 0;

    return [*(id *)(*(void *)(*(void *)(*(void *)v1 + 8) + 40) + 16) unlock];
  }
  return result;
}

- (void)setDaemonXPCEndpoint:(id)a3
{
  uint64_t v4 = (NSXPCListenerEndpoint *)a3;
  [(FLDaemon *)self invalidateConnection];
  [(NSLock *)self->_connLock lock];
  daemonXPCEndpoint = self->_daemonXPCEndpoint;
  self->_daemonXPCEndpoint = v4;
  objc_super v6 = v4;

  [(NSLock *)self->_connLock unlock];
}

- (void)invalidateConnection
{
  [(NSLock *)self->_connLock lock];
  [(NSXPCConnection *)self->_conn invalidate];
  conn = self->_conn;
  self->_conn = 0;

  connLock = self->_connLock;

  [(NSLock *)connLock unlock];
}

- (FLDaemon)daemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FLDaemon *)self connection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return (FLDaemon *)v6;
}

- (NSXPCListenerEndpoint)daemonXPCEndpoint
{
  return self->_daemonXPCEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_connLock, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

@end