@interface DPCManager
- (DPCManager)initWithDelegate:(id)a3;
- (DPCWatchPresenceDelegate)delegate;
- (void)dealloc;
- (void)registerForWatchPresence;
- (void)setDelegate:(id)a3;
- (void)setStreamingMode:(BOOL)a3;
- (void)setWatchNewEvent:(unint64_t)a3;
- (void)setupWatchPresenceDetection;
- (void)setupXPCConnection;
- (void)startWatchPresenceUpdate;
- (void)stopWatchPresenceUpdate;
- (void)unregisterForWatchPresence;
- (void)updateWatchPresenceStatus;
@end

@implementation DPCManager

- (DPCManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCManager;
  v5 = [(DPCManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(DPCManager *)v6 setupXPCConnection];
    [(DPCManager *)v6 setupWatchPresenceDetection];
  }

  return v6;
}

- (void)dealloc
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_229386000, log, OS_LOG_TYPE_DEBUG, "Deallocing the DPCManager", v1, 2u);
}

- (void)setupXPCConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.watchpresenced" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DD7BBE8];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v5];

  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DD7B8B8];
  [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v6];

  v7 = [DPCDaemonClient alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [(DPCDaemonClient *)v7 initWithDelegate:WeakRetained];
  [(NSXPCConnection *)self->_xpcConnection setExportedObject:v9];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__DPCManager_setupXPCConnection__block_invoke;
  v12[3] = &unk_264864348;
  objc_copyWeak(&v13, &location);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __32__DPCManager_setupXPCConnection__block_invoke_61;
  v10[3] = &unk_264864348;
  objc_copyWeak(&v11, &location);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v10];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __32__DPCManager_setupXPCConnection__block_invoke(uint64_t a1)
{
  v2 = _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_229386000, v2, OS_LOG_TYPE_INFO, "Connection to watchpresenced invalidated", v7, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 2);

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v4 + 2);
      [v6 managerDidFindError:1];
    }
  }
}

void __32__DPCManager_setupXPCConnection__block_invoke_61(uint64_t a1)
{
  v2 = _DPCLoggingFacility((uint64_t)kDPCLogCategoryFramework);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_229386000, v2, OS_LOG_TYPE_INFO, "Connection to watchpresenced interrupted", v7, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 2);

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v4 + 2);
      [v6 managerDidFindError:1];
    }
  }
}

- (void)registerForWatchPresence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    [(DPCManager *)self startWatchPresenceUpdate];
  }
}

- (void)unregisterForWatchPresence
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    [(DPCManager *)self stopWatchPresenceUpdate];
  }
}

- (void)updateWatchPresenceStatus
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v3 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    [v3 getCurrentWatchPresenceStatus];
  }
}

- (void)setupWatchPresenceDetection
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v3 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    [v3 setupWatchPresenceDetection];
  }
}

- (void)startWatchPresenceUpdate
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v3 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    [v3 startWatchPresenceDetection];
  }
}

- (void)stopWatchPresenceUpdate
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v3 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    [v3 stopWatchPresenceDetection];
  }
}

- (void)setWatchNewEvent:(unint64_t)a3
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    id v5 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    [v5 setCurrentWatchPresenceStatus:a3];
  }
}

- (void)setStreamingMode:(BOOL)a3
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    BOOL v4 = a3;
    id v5 = [(NSXPCConnection *)xpcConnection remoteObjectProxy];
    [v5 setStreamingMode:v4];
  }
}

- (DPCWatchPresenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DPCWatchPresenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end