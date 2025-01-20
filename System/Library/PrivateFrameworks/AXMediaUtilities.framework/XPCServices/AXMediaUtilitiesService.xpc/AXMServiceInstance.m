@interface AXMServiceInstance
- (AXMIdleManager)idleManager;
- (AXMServiceInstance)init;
- (AXMServiceXPCServer)xpcServer;
- (NSMutableDictionary)engineCache;
- (id)_cachedEngineForEngine:(id)a3;
- (void)_removeEngineFromCache:(id)a3;
- (void)prewarmVisionEngineService;
- (void)run;
- (void)setEngineCache:(id)a3;
- (void)setIdleManager:(id)a3;
- (void)setXpcServer:(id)a3;
- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7;
- (void)willBecomeIdle:(id)a3 completion:(id)a4;
@end

@implementation AXMServiceInstance

- (AXMServiceInstance)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXMServiceInstance;
  v2 = [(AXMServiceInstance *)&v7 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(AXMServiceInstance *)v2 setEngineCache:v3];

    v4 = objc_alloc_init(AXMIdleManager);
    [(AXMServiceInstance *)v2 setIdleManager:v4];

    v5 = [(AXMServiceInstance *)v2 idleManager];
    [v5 setDelegate:v2];
  }
  return v2;
}

- (void)run
{
  v3 = AXMediaLogService();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** AXMediaUtilities service starting up ***", buf, 2u);
  }

  v4 = objc_alloc_init(AXMServiceXPCServer);
  [(AXMServiceInstance *)self setXpcServer:v4];

  v5 = [(AXMServiceInstance *)self xpcServer];
  [v5 setDelegate:self];

  v6 = [(AXMServiceInstance *)self xpcServer];
  [v6 run];

  objc_super v7 = AXMediaLogService();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "*** AXMediaUtilities service about to exit ***", v8, 2u);
  }
}

- (id)_cachedEngineForEngine:(id)a3
{
  id v4 = a3;
  v5 = [(AXMServiceInstance *)self engineCache];
  v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    v8 = [(AXMServiceInstance *)self engineCache];
    v9 = [v4 identifier];
    [v8 setObject:v4 forKey:v9];

    id v7 = v4;
  }

  return v7;
}

- (void)_removeEngineFromCache:(id)a3
{
  id v4 = a3;
  id v6 = [(AXMServiceInstance *)self engineCache];
  v5 = [v4 identifier];

  [v6 removeObjectForKey:v5];
}

- (void)prewarmVisionEngineService
{
  v2 = AXMediaLogService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Service did receive prewarm message", v3, 2u);
  }
}

- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7
{
  char v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v8) {
    [(AXMServiceInstance *)self _removeEngineFromCache:v12];
  }
  v17 = [(AXMServiceInstance *)self _cachedEngineForEngine:v12];

  v18 = [v13 identifier];
  v19 = [v17 sourceNodeWithIdentifier:v18];

  if (v19)
  {
    v20 = [v14 analysisOptions];
    id v21 = [v20 clientID];

    if (v21 == (id)1)
    {
      v22 = [(AXMServiceInstance *)self idleManager];
      [v22 voiceOverActivityOccurred];
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __73__AXMServiceInstance_visionEngine_evaluateSource_context_options_result___block_invoke;
    v26[3] = &unk_100008240;
    id v27 = v15;
    [v19 triggerWithContext:v14 cacheKey:0 resultHandler:v26];
  }
  else
  {
    v23 = [0 identifier];
    v25 = [v17 identifier];
    v24 = _AXMMakeError();
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v24);
  }
}

uint64_t __73__AXMServiceInstance_visionEngine_evaluateSource_context_options_result___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)willBecomeIdle:(id)a3 completion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke;
  v5[3] = &unk_1000082B8;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke(uint64_t a1)
{
  v2 = AXMediaLogService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "notified that service will go idle. purging engine resources", buf, 2u);
  }

  dispatch_group_t v3 = dispatch_group_create();
  id v4 = [*(id *)(a1 + 32) engineCache];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_31;
  v9[3] = &unk_100008290;
  dispatch_group_t v10 = v3;
  v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_3;
  block[3] = &unk_1000082B8;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

void __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = a3;
  dispatch_group_enter(v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_2;
  v6[3] = &unk_100008268;
  id v7 = *(id *)(a1 + 32);
  [v5 purgeResources:v6];
}

void __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __48__AXMServiceInstance_willBecomeIdle_completion___block_invoke_3(uint64_t a1)
{
  v2 = AXMediaLogService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "did purge engine resources", v5, 2u);
  }

  AXMDeleteCoreImageContext();
  dispatch_group_t v3 = [*(id *)(a1 + 32) engineCache];
  [v3 removeAllObjects];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (AXMServiceXPCServer)xpcServer
{
  return self->_xpcServer;
}

- (void)setXpcServer:(id)a3
{
}

- (NSMutableDictionary)engineCache
{
  return self->_engineCache;
}

- (void)setEngineCache:(id)a3
{
}

- (AXMIdleManager)idleManager
{
  return self->_idleManager;
}

- (void)setIdleManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleManager, 0);
  objc_storeStrong((id *)&self->_engineCache, 0);

  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end