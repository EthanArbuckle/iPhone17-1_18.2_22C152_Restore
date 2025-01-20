@interface CDXPCService
- (BOOL)isConnected;
- (BOOL)isInterrupted;
- (BOOL)isInvalidated;
- (CDXPCService)initWithInfo:(id)a3;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_source)watchdog_timer;
- (id)addProcInfoForConnection:(id)a3 toDict:(id)a4;
- (void)_serviceCallback:(id)a3 replyBlock:(id)a4;
- (void)_serviceCancelPurge:(id)a3;
- (void)_serviceNotify:(id)a3 replyBlock:(id)a4;
- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5;
- (void)connectionWasInvalidated;
- (void)dealloc;
- (void)doWithProxy:(id)a3 failure:(id)a4;
- (void)invalidateConnection;
- (void)obtainXPCConnection:(id)a3;
- (void)resumeConnection;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsInterrupted:(BOOL)a3;
- (void)setIsInvalidated:(BOOL)a3;
- (void)setWatchdog_timer:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation CDXPCService

- (id)addProcInfoForConnection:(id)a3 toDict:(id)a4
{
  id v5 = a3;
  id v6 = [a4 mutableCopy];
  v7 = v6;
  if (v5)
  {
    if (!v6) {
      v7 = objc_opt_new();
    }
    v8 = signingIdForConnection();
    v9 = processNameForConnection();
    if (v8) {
      [v7 setObject:v8 forKeyedSubscript:@"CACHE_DELETE_SIGNING_ID"];
    }
    if (v9) {
      [v7 setObject:v9 forKeyedSubscript:@"CACHE_DELETE_PROCNAME"];
    }
  }
  id v10 = [v7 copy];

  return v10;
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_3;
  block[3] = &unk_10005DCF8;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  id v13 = v5;
  block[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) addProcInfoForConnection:*(void *)(a1 + 40) toDict:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

uint64_t __36__CDXPCService_doWithProxy_failure___block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  BOOL v4 = [WeakRetained serviceQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        id v11 = [v3 ID];
        int v12 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        *(_DWORD *)buf = 138412546;
        v15 = v11;
        __int16 v16 = 1024;
        int v17 = v12;
        _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%@: Received completion after we sent a callback! Success = %d", buf, 0x12u);
      }
      id v13 = [v3 ID];
      _CacheDeleteAbortWithMessage();
    }
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v8 = CDGetLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v3 ID];
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Successful Request", buf, 0xCu);
  }
  [v3 invalidateConnection];
  uint64_t v7 = 1;
LABEL_11:

  return v7;
}

void __36__CDXPCService_doWithProxy_failure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    v9 = CDGetLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v29 = [*(id *)(a1 + 32) ID];
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)v49 = 138412546;
      *(void *)&v49[4] = v29;
      *(_WORD *)&v49[12] = 2112;
      *(void *)&v49[14] = v31;
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%@: obtainXPCConnection callback fired more than once for %@!", v49, 0x16u);
    }
    id v10 = [*(id *)(a1 + 32) ID];
    id v11 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v11);
    _CacheDeleteAbortWithMessage();
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    if (!v5 || v6)
    {
      v25 = CDGetLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v32 = [*(id *)(a1 + 32) ID];
        *(_DWORD *)v49 = 138412546;
        *(void *)&v49[4] = v32;
        *(_WORD *)&v49[12] = 2112;
        *(void *)&v49[14] = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@: obtainXPCConnection failed to get a connection: %@", v49, 0x16u);
      }
      v26 = *(void **)(a1 + 32);
      if (v5)
      {
        [v26 invalidateConnection];
      }
      else if ([v26 _inFlight])
      {
        objc_msgSend(*(id *)(a1 + 32), "set_inFlight:", 0);
        v27 = [*(id *)(a1 + 32) requestQueue];
        dispatch_resume(v27);
      }
      uint64_t v28 = *(void *)(a1 + 40);
      if (v28) {
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v7);
      }
    }
    else
    {
      [*(id *)(a1 + 32) setXpcConnection:v5];
      *(void *)v49 = 0;
      *(void *)&v49[8] = v49;
      *(void *)&v49[16] = 0x2020000000;
      char v50 = 0;
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      char v46 = 0;
      v43[0] = 0;
      v43[1] = v43;
      v43[2] = 0x2020000000;
      char v44 = 0;
      objc_initWeak(&location, *(id *)(a1 + 32));
      int v12 = [*(id *)(a1 + 32) serviceQueue];
      dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);
      objc_msgSend(*(id *)(a1 + 32), "setWatchdog_timer:", v13);

      v14 = objc_msgSend(*(id *)(a1 + 32), "watchdog_timer");
      dispatch_time_t v15 = dispatch_time(0, 90000000000);
      dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

      __int16 v16 = objc_msgSend(*(id *)(a1 + 32), "watchdog_timer");
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_20;
      handler[3] = &unk_10005CD78;
      handler[4] = *(void *)(a1 + 32);
      handler[5] = v45;
      dispatch_source_set_event_handler(v16, handler);

      int v17 = objc_msgSend(*(id *)(a1 + 32), "watchdog_timer");
      dispatch_resume(v17);

      if (([*(id *)(a1 + 32) isConnected] & 1) == 0)
      {
        v18 = CDGetLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = [*(id *)(a1 + 32) ID];
          *(_DWORD *)buf = 138412290;
          v48 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Connecting to %@", buf, 0xCu);
        }
        v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CacheDeleteServiceProtocol];
        v21 = [*(id *)(a1 + 32) xpcConnection];
        [v21 setRemoteObjectInterface:v20];

        [*(id *)(a1 + 32) resumeConnection];
        [*(id *)(a1 + 32) setIsConnected:1];
      }
      v22 = [*(id *)(a1 + 32) xpcConnection];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_35;
      v36[3] = &unk_10005DE88;
      objc_copyWeak(&v40, &location);
      v38 = v49;
      v39 = v43;
      id v37 = *(id *)(a1 + 40);
      v23 = [v22 remoteObjectProxyWithErrorHandler:v36];

      uint64_t v24 = *(void *)(a1 + 48);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_37;
      v34[3] = &unk_10005DEB0;
      objc_copyWeak(&v35, &location);
      v34[4] = v43;
      v34[5] = v49;
      v34[6] = v45;
      (*(void (**)(uint64_t, void *, id, void *))(v24 + 16))(v24, v23, v5, v34);
      objc_destroyWeak(&v35);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
      _Block_object_dispose(v43, 8);
      _Block_object_dispose(v45, 8);
      _Block_object_dispose(v49, 8);
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 mutableCopy];
  int v12 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v11 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  uint64_t v13 = *(unsigned int *)(a1 + 56);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_2;
  v18[3] = &unk_10005DD20;
  uint64_t v14 = *(void *)(a1 + 32);
  dispatch_time_t v15 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v20 = v8;
  id v21 = v15;
  id v19 = v7;
  id v16 = v7;
  id v17 = v8;
  [v10 servicePurgeable:v13 info:v14 replyBlock:v18];
}

- (void)invalidateConnection
{
  uint64_t v3 = [(CDXPCService *)self xpcConnection];

  if (v3)
  {
    BOOL v4 = [(CDXPCService *)self xpcConnection];
    [v4 invalidate];

    [(CDXPCService *)self connectionWasInvalidated];
  }
  else
  {
    id v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(CDService *)self ID];
      int v11 = 138412290;
      int v12 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: invalidate and connection is nil!", (uint8_t *)&v11, 0xCu);
    }
  }
  id v6 = [(CDXPCService *)self watchdog_timer];

  if (v6)
  {
    id v7 = [(CDXPCService *)self watchdog_timer];
    dispatch_source_cancel(v7);

    [(CDXPCService *)self setWatchdog_timer:0];
  }
  else
  {
    id v8 = CDGetLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(CDXPCService *)self watchdog_timer];
      int v11 = 134218240;
      int v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "watchdog timer is nil, self: %p, timer: %p", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (OS_dispatch_source)watchdog_timer
{
  return self->_watchdog_timer;
}

- (void)setWatchdog_timer:(id)a3
{
}

- (void)connectionWasInvalidated
{
  uint64_t v3 = CDGetLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(CDService *)self ID];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Connection to %@ was invalidated.", (uint8_t *)&v6, 0xCu);
  }
  [(CDXPCService *)self setXpcConnection:0];
  [(CDXPCService *)self setIsConnected:0];
  if ([(CDService *)self _inFlight])
  {
    [(CDService *)self set_inFlight:0];
    BOOL v4 = [(CDService *)self requestQueue];
    dispatch_resume(v4);
  }
}

- (void)setXpcConnection:(id)a3
{
}

- (void)resumeConnection
{
  id v2 = [(CDXPCService *)self xpcConnection];
  [v2 resume];
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)_servicePurgeable:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke;
  v11[3] = &unk_10005DD48;
  int v15 = a3;
  id v12 = a4;
  __int16 v13 = self;
  id v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_4;
  v9[3] = &unk_10005DD70;
  id v10 = v14;
  id v7 = v14;
  id v8 = v12;
  [(CDXPCService *)self doWithProxy:v11 failure:v9];
}

- (void)doWithProxy:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  [(CDService *)self set_inFlight:1];
  id v8 = [(CDService *)self requestQueue];
  dispatch_suspend(v8);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __36__CDXPCService_doWithProxy_failure___block_invoke;
  v11[3] = &unk_10005DED8;
  id v14 = v15;
  void v11[4] = self;
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [(CDXPCService *)self obtainXPCConnection:v11];

  _Block_object_dispose(v15, 8);
}

void __50__CDXPCService__servicePurgeable_info_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CFStringRef v5 = @"CACHE_DELETE_ERROR";
  id v6 = a2;
  id v3 = a2;
  BOOL v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

void __36__CDXPCService_doWithProxy_failure___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = CDGetLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v5 = [*(id *)(a1 + 40) ID];
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      int v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%@: remoteObjectProxyWithErrorHandler error: %@", buf, 0x16u);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v3 = CDGetLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      id v7 = [*(id *)(a1 + 40) ID];
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      int v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "%@: Received an error after the request succeeded! error: %@", buf, 0x16u);
    }
    id v9 = [*(id *)(a1 + 40) ID];
    _CacheDeleteAbortWithMessage();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
    (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
    [*(id *)(a1 + 40) invalidateConnection];
  }
}

void __36__CDXPCService_doWithProxy_failure___block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  CFStringRef v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained serviceQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __36__CDXPCService_doWithProxy_failure___block_invoke_2;
    block[3] = &unk_10005DE60;
    id v10 = v3;
    int v11 = v5;
    uint64_t v13 = *(void *)(a1 + 48);
    long long v8 = *(_OWORD *)(a1 + 32);
    id v7 = (id)v8;
    long long v12 = v8;
    dispatch_async(v6, block);
  }
}

- (CDXPCService)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDXPCService;
  return [(CDService *)&v4 initWithInfo:a3];
}

- (void)dealloc
{
  if ([(CDService *)self _inFlight])
  {
    id v3 = [(CDService *)self requestQueue];
    dispatch_resume(v3);
  }
  if ([(CDXPCService *)self isConnected]) {
    [(CDXPCService *)self invalidateConnection];
  }
  v4.receiver = self;
  v4.super_class = (Class)CDXPCService;
  [(CDXPCService *)&v4 dealloc];
}

- (void)_servicePurge:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke;
  v11[3] = &unk_10005DD48;
  int v15 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  id v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_4;
  v9[3] = &unk_10005DD70;
  id v10 = v14;
  id v7 = v14;
  id v8 = v12;
  [(CDXPCService *)self doWithProxy:v11 failure:v9];
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  id v10 = a2;
  id v11 = [v9 mutableCopy];
  id v12 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v11 setObject:v12 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  uint64_t v13 = *(unsigned int *)(a1 + 56);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_2;
  v18[3] = &unk_10005DD20;
  uint64_t v14 = *(void *)(a1 + 32);
  int v15 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v20 = v8;
  id v21 = v15;
  id v19 = v7;
  id v16 = v7;
  id v17 = v8;
  [v10 servicePurge:v13 info:v14 replyBlock:v18];
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_3;
  block[3] = &unk_10005DCF8;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v13 = v5;
  void block[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) addProcInfoForConnection:*(void *)(a1 + 40) toDict:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __46__CDXPCService__servicePurge_info_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    CFStringRef v5 = @"CACHE_DELETE_ERROR";
    uint64_t v6 = a2;
    id v3 = a2;
    BOOL v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

- (void)_servicePeriodic:(int)a3 info:(id)a4 replyBlock:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke;
  v11[3] = &unk_10005DD48;
  int v15 = a3;
  id v12 = a4;
  id v13 = self;
  id v14 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_4;
  v9[3] = &unk_10005DD70;
  id v10 = v14;
  id v7 = v14;
  id v8 = v12;
  [(CDXPCService *)self doWithProxy:v11 failure:v9];
}

void __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 mutableCopy];
  id v10 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v9 setObject:v10 forKeyedSubscript:@"CACHE_DELETE_URGENCY"];

  uint64_t v11 = *(unsigned int *)(a1 + 56);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_2;
  void v15[3] = &unk_10005DD98;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 48);
  v15[4] = *(void *)(a1 + 40);
  id v16 = v6;
  id v17 = v13;
  id v14 = v6;
  [v8 servicePeriodic:v11 info:v12 replyBlock:v15];
}

void __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [a1[4] serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_3;
  block[3] = &unk_10005DDE8;
  id v8 = a1[5];
  id v9 = a1[6];
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __49__CDXPCService__servicePeriodic_info_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    CFStringRef v5 = @"CACHE_DELETE_ERROR";
    id v6 = a2;
    id v3 = a2;
    BOOL v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
}

- (void)_serviceCancelPurge:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __36__CDXPCService__serviceCancelPurge___block_invoke;
  v6[3] = &unk_10005DE10;
  id v7 = self;
  id v8 = a3;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __36__CDXPCService__serviceCancelPurge___block_invoke_4;
  v4[3] = &unk_10005DD70;
  id v5 = v8;
  id v3 = v8;
  [(CDXPCService *)v7 doWithProxy:v6 failure:v4];
}

void __36__CDXPCService__serviceCancelPurge___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __36__CDXPCService__serviceCancelPurge___block_invoke_2;
  v9[3] = &unk_10005DDE8;
  id v7 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v7;
  id v8 = v6;
  [a2 serviceCancelPurge:v9];
}

void __36__CDXPCService__serviceCancelPurge___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] serviceQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __36__CDXPCService__serviceCancelPurge___block_invoke_3;
  v3[3] = &unk_10005DDC0;
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);
}

uint64_t __36__CDXPCService__serviceCancelPurge___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __36__CDXPCService__serviceCancelPurge___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "ServiceCancelPurge failed: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)_serviceNotify:(id)a3 replyBlock:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke;
  v10[3] = &unk_10005DE38;
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke_4;
  v8[3] = &unk_10005DD70;
  id v9 = v13;
  id v6 = v13;
  id v7 = v11;
  [(CDXPCService *)self doWithProxy:v10 failure:v8];
}

void __42__CDXPCService__serviceNotify_replyBlock___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke_2;
  v10[3] = &unk_10005DDE8;
  uint64_t v7 = a1[4];
  id v8 = (void *)a1[6];
  void v10[4] = a1[5];
  id v11 = v6;
  id v12 = v8;
  id v9 = v6;
  [a2 serviceNotify:v7 replyBlock:v10];
}

void __42__CDXPCService__serviceNotify_replyBlock___block_invoke_2(id *a1)
{
  int v2 = [a1[4] serviceQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __42__CDXPCService__serviceNotify_replyBlock___block_invoke_3;
  v3[3] = &unk_10005DDC0;
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);
}

uint64_t __42__CDXPCService__serviceNotify_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __42__CDXPCService__serviceNotify_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "ServiceNotify failed: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (void)_serviceCallback:(id)a3 replyBlock:(id)a4
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke;
  v10[3] = &unk_10005DE38;
  id v11 = a3;
  id v12 = self;
  id v13 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke_4;
  v8[3] = &unk_10005DD70;
  id v9 = v13;
  id v6 = v13;
  id v7 = v11;
  [(CDXPCService *)self doWithProxy:v10 failure:v8];
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke_2;
  v13[3] = &unk_10005DD20;
  uint64_t v9 = a1[4];
  id v10 = (void *)a1[6];
  v13[4] = a1[5];
  id v15 = v8;
  id v16 = v10;
  id v14 = v7;
  id v11 = v7;
  id v12 = v8;
  [a2 serviceCallback:v9 replyBlock:v13];
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) serviceQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__CDXPCService__serviceCallback_replyBlock___block_invoke_3;
  block[3] = &unk_10005DCF8;
  id v12 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v13 = v5;
  void block[4] = v6;
  id v10 = v7;
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v4, block);
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke_3(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) addProcInfoForConnection:*(void *)(a1 + 40) toDict:*(void *)(a1 + 48)];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
}

void __44__CDXPCService__serviceCallback_replyBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "ServiceCancelPurge failed: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    CFStringRef v7 = @"CACHE_DELETE_ERROR";
    id v8 = v3;
    uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __36__CDXPCService_doWithProxy_failure___block_invoke_20(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  int v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 32) ID];
    int v4 = 138412546;
    uint64_t v5 = v3;
    __int16 v6 = 2048;
    uint64_t v7 = 90;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%@: failed to respond after %llu seconds, deleted is dirty for this reason.", (uint8_t *)&v4, 0x16u);
  }
}

- (void)obtainXPCConnection:(id)a3
{
  __int16 v6 = (void (**)(id, void *, void))a3;
  int v4 = [(CDXPCService *)self xpcConnection];

  if (v4)
  {
    uint64_t v5 = [(CDXPCService *)self xpcConnection];
    v6[2](v6, v5, 0);
  }
  else
  {
    +[NSException raise:@"com.apple.cache_delete.CDXPCService.no_connection" format:@"Subclass needs to implement this"];
  }
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (void)setIsInterrupted:(BOOL)a3
{
  self->_isInterrupted = a3;
}

- (BOOL)isInvalidated
{
  return self->_isInvalidated;
}

- (void)setIsInvalidated:(BOOL)a3
{
  self->_isInvalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdog_timer, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end