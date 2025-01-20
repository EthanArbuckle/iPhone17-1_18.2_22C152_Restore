@interface IDSDaemonProtocolController
+ (id)sharedInstance;
- (IDSDaemonProtocolController)init;
- (IDSGroupContextCacheMiddlewareDaemonProtocol)groupContextCacheMiddleware;
- (IDSGroupContextDataSourceDaemonProtocol)groupContextDataSource;
- (IDSGroupContextNotifyingObserver)observer;
- (NSXPCConnection)connection;
- (void)setConnection:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation IDSDaemonProtocolController

+ (id)sharedInstance
{
  if (qword_1EB2BD850 != -1) {
    dispatch_once(&qword_1EB2BD850, &unk_1EE246548);
  }
  v2 = (void *)qword_1EB2BD810;

  return v2;
}

- (IDSDaemonProtocolController)init
{
  if (_IDSRunningInDaemon())
  {
    v3 = +[IDSLogging DaemonProxy];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v3);
    }

    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IDSDaemonProtocolController;
    self = [(IDSDaemonProtocolController *)&v6 init];
    v4 = self;
  }

  return v4;
}

- (NSXPCConnection)connection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  connection = v2->_connection;
  if (!connection)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.identityservicesd.nsxpc.auth" options:4096];
    v5 = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    objc_super v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2B2D60];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_fetchAllKnownGroups_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v6];
    v10 = objc_alloc_init(IDSGroupContextNotifyingObserver);
    observer = v2->_observer;
    v2->_observer = v10;

    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE2963E8];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v12];

    v13 = [(IDSDaemonProtocolController *)v2 observer];
    [(NSXPCConnection *)v2->_connection setExportedObject:v13];

    v14 = +[IDSLogging DaemonProxy];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(IDSDaemonProtocolController *)v2 observer];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Client has set export object %@", buf, 0xCu);
    }
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v2);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_191982318;
    v18[3] = &unk_1E57295B8;
    objc_copyWeak(&v19, (id *)buf);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v18];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&unk_1EE246CA8];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

    connection = v2->_connection;
  }
  v16 = connection;
  objc_sync_exit(v2);

  return v16;
}

- (void)setConnection:(id)a3
{
  uint64_t v4 = (NSXPCConnection *)a3;
  obj = self;
  objc_sync_enter(obj);
  connection = obj->_connection;
  obj->_connection = v4;

  objc_sync_exit(obj);
}

- (IDSGroupContextDataSourceDaemonProtocol)groupContextDataSource
{
  v2 = [(IDSDaemonProtocolController *)self connection];
  v3 = [v2 remoteObjectProxy];

  return (IDSGroupContextDataSourceDaemonProtocol *)v3;
}

- (IDSGroupContextCacheMiddlewareDaemonProtocol)groupContextCacheMiddleware
{
  v2 = [(IDSDaemonProtocolController *)self connection];
  v3 = [v2 remoteObjectProxy];

  return (IDSGroupContextCacheMiddlewareDaemonProtocol *)v3;
}

- (IDSGroupContextNotifyingObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end