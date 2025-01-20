@interface DARemoteRunnerManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DADeviceConnectionDelegate)delegate;
- (DADeviceLocalRemoteRunner)device;
- (DADeviceState)state;
- (DARemoteRunnerClientProtocol)remoteClient;
- (DARemoteRunnerManager)init;
- (NSXPCListener)listener;
- (void)_destroyDevice;
- (void)cancelTestWithID:(id)a3 completion:(id)a4;
- (void)createRemoteRunnerDeviceWithSerialNumber:(id)a3 completion:(id)a4;
- (void)destroyRemoteRunnerDeviceWithCompletion:(id)a3;
- (void)end;
- (void)getReportWithCompletion:(id)a3;
- (void)getReportWithComponents:(id)a3 completion:(id)a4;
- (void)initListener;
- (void)ping:(id)a3;
- (void)requestAsset:(id)a3 completion:(id)a4;
- (void)requestUploadAssets:(id)a3 completion:(id)a4;
- (void)runTestWithID:(id)a3 name:(id)a4 description:(id)a5 parameters:(id)a6 completion:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setListener:(id)a3;
- (void)setRemoteClient:(id)a3;
- (void)setState:(id)a3;
- (void)start;
@end

@implementation DARemoteRunnerManager

+ (id)sharedInstance
{
  if (qword_100186948 != -1) {
    dispatch_once(&qword_100186948, &stru_10014BE08);
  }
  v2 = (void *)qword_100186940;

  return v2;
}

- (DARemoteRunnerManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)DARemoteRunnerManager;
  v2 = [(DARemoteRunnerManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DARemoteRunnerManager *)v2 initListener];
  }
  return v3;
}

- (void)initListener
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.diagnostics.remote-runner-service"];
  [(DARemoteRunnerManager *)self setListener:v3];

  v4 = [(DARemoteRunnerManager *)self listener];
  [v4 setDelegate:self];

  id v5 = [(DARemoteRunnerManager *)self listener];
  [v5 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "New connection %@ requested for remote runner service", (uint8_t *)&buf, 0xCu);
  }

  v9 = [v7 valueForEntitlement:@"com.apple.diagnostics.remote-runner-service"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v9 BOOLValue])
  {
    [v7 invalidate];
LABEL_9:
    BOOL v17 = 1;
    goto LABEL_10;
  }
  v20 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DARemoteRunnerServerProtocol];
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v32[5] = objc_opt_class();
  v10 = +[NSArray arrayWithObjects:v32 count:6];
  v11 = +[NSSet setWithArray:v10];
  [v20 setClasses:v11 forSelector:"runTestWithID:name:description:parameters:completion:" argumentIndex:3 ofReply:0];

  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  v31[4] = objc_opt_class();
  v31[5] = objc_opt_class();
  v31[6] = objc_opt_class();
  v12 = +[NSArray arrayWithObjects:v31 count:7];
  v13 = +[NSSet setWithArray:v12];
  [v20 setClasses:v13 forSelector:"runTestWithID:name:description:parameters:completion:" argumentIndex:0 ofReply:1];

  [v7 setExportedObject:self];
  [v7 setExportedInterface:v20];
  v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___DARemoteRunnerClientProtocol];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = sub_10001CC84;
  v29 = sub_10001CC94;
  id v30 = 0;
  objc_initWeak(&location, v7);
  [v7 setRemoteObjectInterface:v14];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001CC9C;
  v21[3] = &unk_10014BE30;
  v21[4] = &buf;
  objc_copyWeak(&v22, &location);
  v15 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v16 = v15;
  if (v15 && !*(void *)(*((void *)&buf + 1) + 40))
  {
    [(DARemoteRunnerManager *)self setRemoteClient:v15];
    [v7 resume];
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v24 = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Connection %@ established with remote runner service", v24, 0xCu);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);

    goto LABEL_9;
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

  BOOL v17 = 0;
LABEL_10:

  return v17;
}

- (void)ping:(id)a3
{
  id v3 = (void (**)(void))a3;
  v4 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote runner is pinging to see if we are alive", v5, 2u);
  }

  v3[2](v3);
}

- (void)createRemoteRunnerDeviceWithSerialNumber:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, _UNKNOWN **))a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote runner create device requested with serial number %@", (uint8_t *)&v19, 0xCu);
  }

  v9 = [(DARemoteRunnerManager *)self device];

  if (v9)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote runner create device failed - a remote runner device already exists!", (uint8_t *)&v19, 2u);
    }

    v7[2](v7, &off_100157168);
  }
  else
  {
    v11 = [[DADeviceLocalRemoteRunner alloc] initWithSerialNumber:v6];
    v12 = v11;
    if (v11)
    {
      v13 = [(DADeviceLocal *)v11 state];
      state = self->_state;
      self->_state = v13;

      [(DADeviceState *)self->_state setPhase:0];
      [(DARemoteRunnerManager *)self setDevice:v12];
      v15 = +[NSNotificationCenter defaultCenter];
      [v15 postNotificationName:@"DARemoteRunnerDeviceCreatedNotification" object:v12];

      v16 = [(DARemoteRunnerManager *)self device];
      [v16 start];

      v7[2](v7, &off_100157180);
      BOOL v17 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote runner device created successfully", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      v18 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Remote runner device creation failed", (uint8_t *)&v19, 2u);
      }

      v7[2](v7, &off_100157198);
    }
  }
}

- (void)destroyRemoteRunnerDeviceWithCompletion:(id)a3
{
  v4 = (void (**)(id, _UNKNOWN **))a3;
  id v5 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote runner device destroy requested", v9, 2u);
  }

  id v6 = [(DARemoteRunnerManager *)self device];

  if (v6)
  {
    id v7 = [(DARemoteRunnerManager *)self device];
    [v7 end];

    v8 = &off_100157180;
  }
  else
  {
    v8 = &off_1001571B0;
  }
  v4[2](v4, v8);
}

- (void)getReportWithComponents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
    {
      v9 = [v6 debugDescription];
    }
    else
    {
      v9 = @"all";
    }
    *(_DWORD *)long long buf = 138412290;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote runner device run test requested system report with components: %@", buf, 0xCu);
    if (v6) {
  }
    }
  v10 = [(DARemoteRunnerManager *)self device];

  if (v10)
  {
    if (v6 && [v6 count])
    {
      v11 = objc_alloc_init(DADeviceConnectionProfileCommand);
      id v12 = objc_alloc_init((Class)ASTProfileResult);
      [(DADeviceConnectionProfileCommand *)v11 setProfile:v12];

      [(DADeviceConnectionProfileCommand *)v11 setComponents:v6];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10001D3EC;
      v15[3] = &unk_10014BE58;
      id v16 = v7;
      [(DADeviceConnectionProfileCommand *)v11 setCompletion:v15];
      v13 = [(DARemoteRunnerManager *)self delegate];
      [v13 deviceConnection:self didRecieveCommand:v11];
    }
  }
  else
  {
    v14 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remote runner device run test failed - a remote runner device does not exist.", buf, 2u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)getReportWithCompletion:(id)a3
{
}

- (void)runTestWithID:(id)a3 name:(id)a4 description:(id)a5 parameters:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  BOOL v17 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v36 = v12;
    __int16 v37 = 2112;
    id v38 = v13;
    __int16 v39 = 2112;
    id v40 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote runner device run test requested with ID: %@ name: %@ description: %@", buf, 0x20u);
  }

  v18 = [(DARemoteRunnerManager *)self device];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Remote runner device run test failed - a remote runner device does not exist.", buf, 2u);
    }

    id v25 = +[NSError errorWithDomain:@"DADiagnosticsRemoteRunner" code:-3 userInfo:0];
    v16[2](v16, 0, v25);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001D9B4;
    v32[3] = &unk_10014BEA0;
    objc_copyWeak(&v34, (id *)buf);
    v33 = v16;
    id v20 = objc_retainBlock(v32);
    v21 = objc_alloc_init(DADeviceConnectionStartTestCommand);
    [(DADeviceConnectionStartTestCommand *)v21 setTestID:v12];
    [(DADeviceConnectionStartTestCommand *)v21 setParameters:v15];
    [(DADeviceConnectionStartTestCommand *)v21 setCompletion:v20];
    id v22 = [(DARemoteRunnerManager *)self state];
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_10001DB30;
    v29 = &unk_10014B378;
    id v30 = v13;
    id v31 = v14;
    [v22 transactionWithBlock:&v26];

    v23 = [(DARemoteRunnerManager *)self delegate];
    [v23 deviceConnection:self didRecieveCommand:v21];

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
  }
}

- (void)cancelTestWithID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, _UNKNOWN **))a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote runner device cancel test requested for ID: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = [(DARemoteRunnerManager *)self device];

  if (!v9)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote runner device cancel test failed - a remote runner device does not exist.", (uint8_t *)&v13, 2u);
    }

    v7[2](v7, &off_1001571B0);
  }
  v11 = objc_alloc_init(DADeviceConnectionCancelTestCommand);
  [(DADeviceConnectionCancelTestCommand *)v11 setTestID:v6];
  id v12 = [(DARemoteRunnerManager *)self delegate];
  [v12 deviceConnection:self didRecieveCommand:v11];

  v7[2](v7, &off_100157180);
}

- (void)start
{
  id v3 = [(DARemoteRunnerManager *)self state];
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1001571C8, &off_1001571E0, &off_1001571F8, 0);
  [v3 removeErrorCodes:v4];

  id v5 = [(DARemoteRunnerManager *)self state];
  [v5 setPhase:4];
}

- (void)end
{
  id v3 = [(DARemoteRunnerManager *)self remoteClient];

  if (v3)
  {
    v4 = [(DARemoteRunnerManager *)self remoteClient];
    [v4 remoteRunnerDeviceEnded];
  }

  [(DARemoteRunnerManager *)self _destroyDevice];
}

- (void)requestAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote runner device requesting asset %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = [(DARemoteRunnerManager *)self remoteClient];

  if (v9)
  {
    v10 = [(DARemoteRunnerManager *)self remoteClient];
    [v10 requestAsset:v6 completion:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, _UNKNOWN **, void *))a4;
  v8 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote runner device requesting to upload assets: %@", (uint8_t *)&v11, 0xCu);
  }

  v9 = [(DARemoteRunnerManager *)self remoteClient];

  if (v9)
  {
    v10 = [(DARemoteRunnerManager *)self remoteClient];
    [v10 requestUploadAssets:v6 completion:v7];
  }
  else
  {
    v10 = +[NSError errorWithDomain:@"DADiagnosticsRemoteRunner" code:-6 userInfo:0];
    v7[2](v7, &off_100157548, v10);
  }
}

- (void)_destroyDevice
{
  id v3 = +[NSNotificationCenter defaultCenter];
  v4 = [(DARemoteRunnerManager *)self device];
  [v3 postNotificationName:@"DARemoteRunnerDeviceDestroyedNotification" object:v4];

  [(DARemoteRunnerManager *)self setDevice:0];
}

- (DADeviceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DADeviceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (DADeviceLocalRemoteRunner)device
{
  return (DADeviceLocalRemoteRunner *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (DARemoteRunnerClientProtocol)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end