@interface HearingMLHelperServiceXPCServer
- (BOOL)_connectionIsCorrenctlyEntitled:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (HearingMLHelperServiceXPCServer)init;
- (HearingMLHelperServiceXPCServerDelegate)delegate;
- (NSMutableArray)connections;
- (void)_destroyXPCConnection:(id)a3;
- (void)run;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6;
@end

@implementation HearingMLHelperServiceXPCServer

- (HearingMLHelperServiceXPCServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)HearingMLHelperServiceXPCServer;
  v2 = [(HearingMLHelperServiceXPCServer *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableArray array];
    [(HearingMLHelperServiceXPCServer *)v2 setConnections:v3];
  }
  return v2;
}

- (void)run
{
  v3 = AXLogUltronKShot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000029B4((uint64_t)self, v3);
  }

  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:self];
  [v4 resume];
}

- (void)_destroyXPCConnection:(id)a3
{
  id v4 = a3;
  objc_super v5 = AXLogUltronKShot();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will destroy connection to client: %@", (uint8_t *)&v7, 0xCu);
  }

  [v4 invalidate];
  v6 = [(HearingMLHelperServiceXPCServer *)self connections];
  [v6 removeObject:v4];
}

- (void)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = AXLogUltronKShot();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "XPC Server - trainWithDetectorID: %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001FA0;
  block[3] = &unk_1000041E8;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HearingMLHelperServiceXPCServer *)self _connectionIsCorrenctlyEntitled:v7];
  v9 = AXLogUltronKShot();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100002A2C((uint64_t)v7, v10);
    }

    id v11 = HearingMLHelperServiceInterface();
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:self];
    id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___HearingMLHelperClientInterface];
    [v7 setRemoteObjectInterface:v12];

    objc_initWeak(&location, v7);
    [v7 setInterruptionHandler:&stru_100004228];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100002344;
    v18[3] = &unk_100004250;
    v18[4] = self;
    objc_copyWeak(&v19, &location);
    [v7 setInvalidationHandler:v18];
    [v7 resume];
    id v13 = [(HearingMLHelperServiceXPCServer *)self connections];
    [v13 addObject:v7];

    v14 = AXLogUltronKShot();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 auditSessionIdentifier]);
      id v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 processIdentifier]);
      *(_DWORD *)buf = 138412802;
      id v22 = v15;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepting connection from client. AuditID:%@. PID:%@. connection: %@", buf, 0x20u);
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100002AA4(v7, v10);
    }
  }
  return v8;
}

- (BOOL)_connectionIsCorrenctlyEntitled:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  memset(&cf[1], 0, sizeof(audit_token_t));
  if (v3) {
    [v3 auditToken];
  }
  cf[0] = cf[1];
  objc_super v5 = SecTaskCreateWithAuditToken(0, cf);
  if (v5)
  {
    id v6 = v5;
    *(void *)cf[0].val = 0;
    CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, @"com.apple.accessibility.HearingMLHelperService-access", (CFErrorRef *)cf);
    if (*(void *)cf[0].val)
    {
      BOOL v8 = AXLogUltronKShot();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100002BB0((uint64_t *)cf, v8);
      }

      CFRelease(*(CFTypeRef *)cf[0].val);
    }
    if (v7)
    {
      CFTypeID v9 = CFGetTypeID(v7);
      BOOL v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v7) != 0;
      CFRelease(v7);
    }
    else
    {
      BOOL v10 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (HearingMLHelperServiceXPCServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HearingMLHelperServiceXPCServerDelegate *)WeakRetained;
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

@end