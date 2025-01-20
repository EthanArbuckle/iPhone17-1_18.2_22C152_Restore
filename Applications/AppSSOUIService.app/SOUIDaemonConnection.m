@interface SOUIDaemonConnection
+ (id)_queue;
- (BOOL)_connectToDaemon;
- (NSXPCConnection)xpcConnection;
- (SOUIDaemonConnection)initWithViewController:(id)a3;
- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5;
- (void)setXpcConnection:(id)a3;
@end

@implementation SOUIDaemonConnection

+ (id)_queue
{
  if (qword_100011D90 != -1) {
    dispatch_once(&qword_100011D90, &stru_10000C2B0);
  }
  v2 = (void *)qword_100011D88;

  return v2;
}

- (SOUIDaemonConnection)initWithViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SOUIDaemonConnection;
  v6 = [(SOUIDaemonConnection *)&v11 init];
  if (!v6) {
    goto LABEL_4;
  }
  v7 = [v5 xpcDaemonEndpoint];

  if (v7)
  {
    objc_storeStrong((id *)&v6->_viewController, a3);
    [(SOUIDaemonConnection *)v6 _connectToDaemon];
LABEL_4:
    v8 = v6;
    goto LABEL_8;
  }
  v9 = sub_1000038F4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10000733C(v9);
  }

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_connectToDaemon
{
  v3 = [(SOUIDaemonConnection *)self xpcConnection];

  if (v3)
  {
    v4 = sub_1000038F4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000073F4();
    }
LABEL_8:
    BOOL v20 = 1;
    goto LABEL_9;
  }
  v4 = objc_opt_new();
  id v5 = [(SOUIServiceViewController *)self->_viewController xpcDaemonEndpoint];
  [v4 _setEndpoint:v5];

  id v6 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v4];
  [(SOUIDaemonConnection *)self setXpcConnection:v6];

  v7 = [(SOUIDaemonConnection *)self xpcConnection];

  if (v7)
  {
    v8 = [sub_100003CF8() interfaceWithInternalProtocol:&OBJC_PROTOCOL___SOUIServiceProtocol];
    v9 = [(SOUIDaemonConnection *)self xpcConnection];
    [v9 setExportedInterface:v8];

    viewController = self->_viewController;
    objc_super v11 = [(SOUIDaemonConnection *)self xpcConnection];
    [v11 setExportedObject:viewController];

    v12 = [sub_100003CF8() interfaceWithInternalProtocol:&OBJC_PROTOCOL___SODaemonUIProtocol];
    v13 = [(SOUIDaemonConnection *)self xpcConnection];
    [v13 setRemoteObjectInterface:v12];

    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100003DDC;
    v25[3] = &unk_10000C2D8;
    objc_copyWeak(&v26, &location);
    v14 = [(SOUIDaemonConnection *)self xpcConnection];
    [v14 setInvalidationHandler:v25];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100003E44;
    v23[3] = &unk_10000C2D8;
    objc_copyWeak(&v24, &location);
    v15 = [(SOUIDaemonConnection *)self xpcConnection];
    [v15 setInterruptionHandler:v23];

    v16 = [(SOUIDaemonConnection *)self xpcConnection];
    v17 = +[SOUIDaemonConnection _queue];
    [v16 _setQueue:v17];

    v18 = [(SOUIDaemonConnection *)self xpcConnection];
    [v18 resume];

    v19 = sub_1000038F4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: new XPC connection", buf, 0xCu);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  v22 = sub_1000038F4();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100007380();
  }

  BOOL v20 = 0;
LABEL_9:

  return v20;
}

- (void)authorizationDidCompleteWithCredential:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, void *))a5;
  if ([(SOUIDaemonConnection *)self _connectToDaemon])
  {
    objc_super v11 = [(SOUIDaemonConnection *)self xpcConnection];
    v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_10000C318];
    [v12 authorizationDidCompleteWithCredential:v8 error:v9 completion:v10];

LABEL_9:
    goto LABEL_10;
  }
  v13 = sub_1000038F4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10000752C(v13);
  }

  if (v10)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v14 = (void *)qword_100011DB8;
    uint64_t v20 = qword_100011DB8;
    if (!qword_100011DB8)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100004310;
      v16[3] = &unk_10000C360;
      v16[4] = &v17;
      sub_100004310((uint64_t)v16);
      v14 = (void *)v18[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v17, 8);
    objc_super v11 = [v15 internalErrorWithMessage:@"Failed to connect to AppSSO daemon"];
    v10[2](v10, 0, v11);
    goto LABEL_9;
  }
LABEL_10:
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end