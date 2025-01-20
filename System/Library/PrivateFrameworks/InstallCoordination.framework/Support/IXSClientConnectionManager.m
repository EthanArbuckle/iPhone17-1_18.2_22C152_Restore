@interface IXSClientConnectionManager
+ (id)sharedInstance;
+ (void)configureService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IXSClientConnectionManager)init;
- (NSHashTable)allConnections;
- (OS_dispatch_queue)allConnectionsQueue;
@end

@implementation IXSClientConnectionManager

+ (void)configureService
{
  id v2 = [(id)objc_opt_class() sharedInstance];
}

+ (id)sharedInstance
{
  if (qword_100109E90 != -1) {
    dispatch_once(&qword_100109E90, &stru_1000E9DA0);
  }
  id v2 = (void *)qword_100109E88;

  return v2;
}

- (IXSClientConnectionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)IXSClientConnectionManager;
  id v2 = [(IXSClientConnectionManager *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    allConnections = v2->_allConnections;
    v2->_allConnections = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.installcoordinationd.IXSClientConnection.allConnections", v5);
    allConnectionsQueue = v2->_allConnectionsQueue;
    v2->_allConnectionsQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_10000D448(v7, @"com.apple.private.InstallCoordination.allowed");
  if (v8)
  {
    objc_super v9 = +[IXClientProtocolInterface interface];
    [v7 setExportedInterface:v9];

    v10 = [[IXSClientConnection alloc] initWithConnection:v7];
    [v7 setExportedObject:v10];
    v11 = +[IXClientDelegateProtocolInterface interface];
    [v7 setRemoteObjectInterface:v11];

    [v7 setInterruptionHandler:&stru_1000E9DC0];
    objc_initWeak((id *)location, v10);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003477C;
    v23[3] = &unk_1000E9DE8;
    objc_copyWeak(&v24, (id *)location);
    v23[4] = self;
    [v7 setInvalidationHandler:v23];
    v12 = [(IXSClientConnectionManager *)self allConnectionsQueue];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_100034938;
    v20 = &unk_1000E8E08;
    v21 = self;
    v13 = v10;
    v22 = v13;
    dispatch_sync(v12, &v17);

    objc_msgSend(v7, "resume", v17, v18, v19, v20, v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
  else
  {
    unsigned int v14 = [v7 processIdentifier];
    v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = sub_10000D2F0();
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[IXSClientConnectionManager listener:shouldAcceptNewConnection:]";
      __int16 v26 = 2112;
      v27 = v15;
      __int16 v28 = 1024;
      unsigned int v29 = v14;
      __int16 v30 = 2112;
      CFStringRef v31 = @"com.apple.private.InstallCoordination.allowed";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Process %@ (pid %d) is missing %@ entitlement so rejecting connection attempt.", location, 0x26u);
    }
  }

  return v8;
}

- (NSHashTable)allConnections
{
  return self->_allConnections;
}

- (OS_dispatch_queue)allConnectionsQueue
{
  return self->_allConnectionsQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allConnectionsQueue, 0);

  objc_storeStrong((id *)&self->_allConnections, 0);
}

@end