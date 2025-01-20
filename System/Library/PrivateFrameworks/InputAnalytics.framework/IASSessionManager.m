@interface IASSessionManager
- (IASServerAnalyticsDelegate)serverDelegate;
- (IASSessionManager)init;
- (IASSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4;
- (id)createAnalyzerWithId:(id)a3 class:(Class)a4;
- (id)eventHandler;
- (id)garbageCollect;
- (void)broadcastActionToSubscribingAnalyzers:(id)a3;
- (void)didAction:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setServerDelegate:(id)a3;
@end

@implementation IASSessionManager

- (IASSessionManager)initWithEventHandler:(id)a3 serverDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IASSessionManager;
  v8 = [(IASSessionManager *)&v12 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id eventHandler = v8->_eventHandler;
    v8->_id eventHandler = v9;

    objc_storeWeak((id *)&v8->_serverDelegate, v7);
  }

  return v8;
}

- (IASSessionManager)init
{
  return (IASSessionManager *)MEMORY[0x270F9A6D0](self, sel_initWithEventHandler_serverDelegate_, 0, 0);
}

- (void)didAction:(id)a3
{
  v5 = sub_252A04944();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_252A0FC58(v5);
  }

  v9 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v6, v7, v8);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, @"IASSessionManager.m", 31, @"didAction not implemented");
}

- (void)broadcastActionToSubscribingAnalyzers:(id)a3
{
  objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v6, (uint64_t)a2, (uint64_t)self, @"IASSessionManager.m", 55, @"broadcastActionToSubscribingAnalyzers not implemented");
}

- (id)garbageCollect
{
  id v6 = objc_msgSend_currentHandler(MEMORY[0x263F08690], a2, v2, v3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, (uint64_t)self, @"IASSessionManager.m", 59, @"garbageCollect not implemented");

  return 0;
}

- (id)createAnalyzerWithId:(id)a3 class:(Class)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v10 = objc_msgSend_eventHandler(self, v7, v8, v9);

  if (v10)
  {
    id v11 = [a4 alloc];
    id v12 = objc_loadWeakRetained(&location);
    v16 = objc_msgSend_eventHandler(self, v13, v14, v15);
    v18 = objc_msgSend_initWithAnalyzerSessionId_sessionManagerDelegate_eventHandler_(v11, v17, (uint64_t)v6, (uint64_t)v12, v16);
  }
  else
  {
    id v19 = [a4 alloc];
    id v12 = objc_loadWeakRetained(&location);
    v18 = objc_msgSend_initWithAnalyzerSessionId_sessionManagerDelegate_(v19, v20, (uint64_t)v6, (uint64_t)v12);
  }

  objc_destroyWeak(&location);
  return v18;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (IASServerAnalyticsDelegate)serverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  return (IASServerAnalyticsDelegate *)WeakRetained;
}

- (void)setServerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_storeStrong(&self->_eventHandler, 0);
}

@end