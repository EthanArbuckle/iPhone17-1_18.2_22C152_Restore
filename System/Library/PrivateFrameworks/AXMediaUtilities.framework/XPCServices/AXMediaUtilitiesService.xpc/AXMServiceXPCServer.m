@interface AXMServiceXPCServer
- (AXMServiceXPCServer)init;
- (AXMServiceXPCServerDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connections;
- (void)_destroyXPCConnection:(id)a3;
- (void)prewarmVisionEngineService;
- (void)run;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7;
@end

@implementation AXMServiceXPCServer

- (AXMServiceXPCServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXMServiceXPCServer;
  v2 = [(AXMServiceXPCServer *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = +[NSMutableArray array];
    [(AXMServiceXPCServer *)v3 setConnections:v4];
  }
  return v3;
}

- (void)run
{
  id v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:self];
  [v3 resume];
}

- (void)_destroyXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = AXMediaLogService();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will destroy connection to client: %@", buf, 0xCu);
  }

  v7 = self;
  id v6 = v4;
  AX_PERFORM_WITH_LOCK();
  objc_msgSend(v6, "invalidate", _NSConcreteStackBlock, 3221225472, __45__AXMServiceXPCServer__destroyXPCConnection___block_invoke, &unk_1000082E0, v7);
}

void __45__AXMServiceXPCServer__destroyXPCConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connections];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)prewarmVisionEngineService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__AXMServiceXPCServer_prewarmVisionEngineService__block_invoke;
  block[3] = &unk_100008268;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __49__AXMServiceXPCServer_prewarmVisionEngineService__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 prewarmVisionEngineService];
}

- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = AXMediaLogService();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = (int)[v17 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received evaluate source request from: %ld", buf, 0xCu);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __74__AXMServiceXPCServer_visionEngine_evaluateSource_context_options_result___block_invoke;
  v22[3] = &unk_100008308;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  int64_t v27 = a6;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
}

void __74__AXMServiceXPCServer_visionEngine_evaluateSource_context_options_result___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 visionEngine:*(void *)(a1 + 40) evaluateSource:*(void *)(a1 + 48) context:*(void *)(a1 + 56) options:*(void *)(a1 + 72) result:*(void *)(a1 + 64)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  if (v7) {
    [v7 auditToken];
  }
  char HasEntitlement = AXMAuditTokenTaskHasEntitlement();
  if (HasEntitlement)
  {
    v10 = AXMServiceInterface();
    [v8 setExportedInterface:v10];

    [v8 setExportedObject:self];
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AXMServiceClientInterface];
    [v8 setRemoteObjectInterface:v11];

    objc_initWeak(&location, v8);
    [v8 setInterruptionHandler:&__block_literal_global];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_71;
    v18[3] = &unk_100008370;
    v18[4] = self;
    objc_copyWeak(&v19, &location);
    [v8 setInvalidationHandler:v18];
    [v8 resume];
    id v12 = v8;
    AX_PERFORM_WITH_LOCK();
    id v13 = AXMediaLogService();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 auditSessionIdentifier]);
      id v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 processIdentifier]);
      *(_DWORD *)buf = 138412802;
      id v24 = v14;
      __int16 v25 = 2112;
      id v26 = v15;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Accepting connection from client. AuditID:%@. PID:%@. connection: %@", buf, 0x20u);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v16 = AXMediaLogService();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[AXMServiceXPCServer listener:shouldAcceptNewConnection:](v8, v16);
    }
  }
  return HasEntitlement;
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  id v1 = AXMediaLogService();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection from client interrupted", v2, 2u);
  }
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_71(uint64_t a1)
{
  id v2 = AXMediaLogService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_71_cold_1(v2);
  }

  id v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 _destroyXPCConnection:WeakRetained];
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_72(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connections];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (AXMServiceXPCServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMServiceXPCServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  id v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 processIdentifier]);
  int v5 = 138412546;
  id v6 = v4;
  __int16 v7 = 2112;
  v8 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Invalid client tried to connect to AXMediaUtilitiesService. Does not have entitlement: AXMServiceAccessEntitlement. PID:%@. connection: %@", (uint8_t *)&v5, 0x16u);
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_71_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Connection from client invalidated", v1, 2u);
}

@end