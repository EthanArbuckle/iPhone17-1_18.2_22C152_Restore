@interface CARSetupPromptDirector
- (CARSetupPromptDirector)initWithPresenter:(id)a3;
- (CARSetupPromptPresenting)presenter;
- (NSXPCConnection)connection;
- (id)_remoteAssetProgress;
- (void)_handleConnectionReset;
- (void)_presenterIsReady;
- (void)_servicePerform:(id)a3;
- (void)_setupConnection;
- (void)_synchronous_servicePerform:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)presenterDidDismiss;
- (void)setConnection:(id)a3;
@end

@implementation CARSetupPromptDirector

- (CARSetupPromptDirector)initWithPresenter:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CARSetupPromptDirector;
  v5 = [(CARSetupPromptDirector *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presenter, v4);
    [(CARSetupPromptDirector *)v6 _setupConnection];
    [(CARSetupPromptDirector *)v6 _presenterIsReady];
  }

  return v6;
}

- (void)dealloc
{
  [(CARSetupPromptDirector *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CARSetupPromptDirector;
  [(CARSetupPromptDirector *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = [(CARSetupPromptDirector *)self connection];
  [v3 invalidate];

  [(CARSetupPromptDirector *)self setConnection:0];
}

- (void)presenterDidDismiss
{
  objc_super v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "presenterDidDismiss", v4, 2u);
  }

  [(CARSetupPromptDirector *)self _synchronous_servicePerform:&stru_1000104D8];
}

- (void)_presenterIsReady
{
  objc_super v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "presenterIsReady", v4, 2u);
  }

  [(CARSetupPromptDirector *)self _synchronous_servicePerform:&stru_100010538];
}

- (id)_remoteAssetProgress
{
  objc_super v3 = CARSetupLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "requesting remote asset progress", buf, 2u);
  }

  *(void *)buf = 0;
  v10 = buf;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100009FF0;
  v13 = sub_10000A000;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A008;
  v8[3] = &unk_1000105A0;
  v8[4] = buf;
  [(CARSetupPromptDirector *)self _servicePerform:v8];
  id v4 = CARSetupLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *((void *)v10 + 5);
    *(_DWORD *)v15 = 138412290;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "remote asset progress: %@", v15, 0xCu);
  }

  id v6 = *((id *)v10 + 5);
  _Block_object_dispose(buf, 8);

  return v6;
}

- (void)_setupConnection
{
  id v3 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.carkit.setupPromptDirector.service" options:4096];
  id v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRSetupPromptDirectorService];
  [v3 setRemoteObjectInterface:v4];
  uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CRSetupPromptPresenterService];
  [v3 setExportedInterface:v5];
  id v6 = objc_alloc_init(CARSetupPromptPresenterProxy);
  [(CARSetupPromptPresenterProxy *)v6 setDirector:self];
  [v3 setExportedObject:v6];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A33C;
  v9[3] = &unk_1000105C8;
  objc_copyWeak(&v10, &location);
  [v3 setInterruptionHandler:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A43C;
  v7[3] = &unk_1000105C8;
  objc_copyWeak(&v8, &location);
  [v3 setInvalidationHandler:v7];
  [v3 resume];
  [(CARSetupPromptDirector *)self setConnection:v3];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_servicePerform:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(CARSetupPromptDirector *)self connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_100010608];

  v4[2](v4, v6);
}

- (void)_synchronous_servicePerform:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(CARSetupPromptDirector *)self connection];
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_100010628];

  v4[2](v4, v6);
}

- (void)_handleConnectionReset
{
}

- (CARSetupPromptPresenting)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  return (CARSetupPromptPresenting *)WeakRetained;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_presenter);
}

@end