@interface AUCrashHandler
- (AUCrashHandler)initWithAuditToken:(id *)a3 withCrashBlock:(id)a4;
- (AUCrashHandler)initWithEndpoint:(id)a3 withCrashBlock:(id)a4;
- (id)asyncCrashHandlerServiceProxy;
- (id)serviceConnection;
- (id)syncCrashHandlerServiceProxy;
- (void)dealloc;
- (void)notifyCrash:(id *)a3 withCrashInfo:(id)a4;
@end

@implementation AUCrashHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_crashCallback, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);
}

- (void)notifyCrash:(id *)a3 withCrashInfo:(id)a4
{
}

- (id)asyncCrashHandlerServiceProxy
{
  v2 = [(AUCrashHandler *)self serviceConnection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_43];

  return v3;
}

void __47__AUCrashHandler_asyncCrashHandlerServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  CrashHandlerLogCategory();
  v3 = (id) CrashHandlerLogCategory(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    v5 = "AUCrashHandler.mm";
    __int16 v6 = 1024;
    int v7 = 124;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d CrashHandler proxy error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

- (id)syncCrashHandlerServiceProxy
{
  id v2 = [(AUCrashHandler *)self serviceConnection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_41];

  return v3;
}

void __46__AUCrashHandler_syncCrashHandlerServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  CrashHandlerLogCategory();
  v3 = (id) CrashHandlerLogCategory(void)::category;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    v5 = "AUCrashHandler.mm";
    __int16 v6 = 1024;
    int v7 = 118;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_18FEC0000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d CrashHandler proxy error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

- (id)serviceConnection
{
  connectionToService = self->_connectionToService;
  if (!connectionToService)
  {
    int v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.audio.AUCrashHandlerService"];
    v5 = self->_connectionToService;
    self->_connectionToService = v4;

    __int16 v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFBB510];
    [(NSXPCConnection *)self->_connectionToService setRemoteObjectInterface:v6];

    id v7 = [[AUCrashHandlerDelegate alloc] init:self];
    [(NSXPCConnection *)self->_connectionToService setExportedObject:v7];

    __int16 v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDFB8138];
    [(NSXPCConnection *)self->_connectionToService setExportedInterface:v8];

    [(NSXPCConnection *)self->_connectionToService setInterruptionHandler:&__block_literal_global_35];
    [(NSXPCConnection *)self->_connectionToService setInvalidationHandler:&__block_literal_global_39_7630];
    [(NSXPCConnection *)self->_connectionToService resume];
    connectionToService = self->_connectionToService;
  }
  return connectionToService;
}

void __35__AUCrashHandler_serviceConnection__block_invoke_37()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CrashHandlerLogCategory();
  v0 = (id) CrashHandlerLogCategory(void)::category;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315394;
    id v2 = "AUCrashHandler.mm";
    __int16 v3 = 1024;
    int v4 = 107;
    _os_log_impl(&dword_18FEC0000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d invalidated", (uint8_t *)&v1, 0x12u);
  }
}

void __35__AUCrashHandler_serviceConnection__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CrashHandlerLogCategory();
  v0 = (id) CrashHandlerLogCategory(void)::category;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315394;
    id v2 = "AUCrashHandler.mm";
    __int16 v3 = 1024;
    int v4 = 104;
    _os_log_impl(&dword_18FEC0000, v0, OS_LOG_TYPE_ERROR, "%25s:%-5d interrupted", (uint8_t *)&v1, 0x12u);
  }
}

- (void)dealloc
{
  __int16 v3 = [(AUCrashHandler *)self syncCrashHandlerServiceProxy];
  [v3 removeCrashObserver:&__block_literal_global_18];

  [(NSXPCConnection *)self->_connectionToService invalidate];
  v4.receiver = self;
  v4.super_class = (Class)AUCrashHandler;
  [(AUCrashHandler *)&v4 dealloc];
}

- (AUCrashHandler)initWithEndpoint:(id)a3 withCrashBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AUCrashHandler;
  __int16 v8 = [(AUCrashHandler *)&v16 init];
  if (v8)
  {
    id v9 = _Block_copy(v7);
    id crashCallback = v8->_crashCallback;
    v8->_id crashCallback = v9;

    objc_initWeak(&location, v8);
    v11 = [(AUCrashHandler *)v8 asyncCrashHandlerServiceProxy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__AUCrashHandler_initWithEndpoint_withCrashBlock___block_invoke;
    v13[3] = &unk_1E5687D00;
    objc_copyWeak(&v14, &location);
    [v11 addCrashObserverForXPCEndpoint:v6 withReply:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __50__AUCrashHandler_initWithEndpoint_withCrashBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained) {
      [WeakRetained[1] invalidate];
    }
  }
}

- (AUCrashHandler)initWithAuditToken:(id *)a3 withCrashBlock:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AUCrashHandler;
  id v7 = [(AUCrashHandler *)&v15 init];
  __int16 v8 = v7;
  if (v7 && PlatformUtilities::IsInternalBuild((PlatformUtilities *)v7))
  {
    id v9 = _Block_copy(v6);
    id crashCallback = v8->_crashCallback;
    v8->_id crashCallback = v9;

    v11 = [(AUCrashHandler *)v8 asyncCrashHandlerServiceProxy];
    long long v12 = *(_OWORD *)&a3->var0[4];
    v14[0] = *(_OWORD *)a3->var0;
    v14[1] = v12;
    [v11 addCrashObserverForToken:v14 withReply:&__block_literal_global_7647];
  }
  return v8;
}

@end