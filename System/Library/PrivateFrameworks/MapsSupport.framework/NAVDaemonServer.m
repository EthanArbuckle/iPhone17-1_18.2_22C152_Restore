@interface NAVDaemonServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NAVDaemonServer)init;
@end

@implementation NAVDaemonServer

- (NAVDaemonServer)init
{
  v19.receiver = self;
  v19.super_class = (Class)NAVDaemonServer;
  v2 = [(NAVDaemonServer *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    peers = v2->_peers;
    v2->_peers = (NSMutableArray *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("NAVDeamon peers dictionary queue", v5);
    peersQueue = v2->_peersQueue;
    v2->_peersQueue = (OS_dispatch_queue *)v6;

    id v8 = objc_alloc((Class)NSXPCListener);
    v9 = (NSXPCListener *)[v8 initWithMachServiceName:GEONavdXPCMachPort];
    listener = v2->_listener;
    v2->_listener = v9;

    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Listener created.", v18, 2u);
    }

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    +[GEONavdManager setProxyClass:objc_opt_class()];
    uint64_t v12 = +[GEONavdManager navdManager];
    navdManager = v2->_navdManager;
    v2->_navdManager = (GEONavdManager *)v12;

    v14 = objc_alloc_init(NavdAnalytics);
    v15 = +[GEONavdAnalyticsManager sharedManager];
    [v15 setAnalyticsReporter:v14];

    [(NSXPCListener *)v2->_listener resume];
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Listener resumed.", v18, 2u);
    }
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connection created.", (uint8_t *)buf, 2u);
  }

  v9 = [[NAVDaemonPeer alloc] initWithNavdManager:self->_navdManager forXPCConnection:v7];
  peersQueue = self->_peersQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043AE8;
  block[3] = &unk_1000891A8;
  block[4] = self;
  v11 = v9;
  v20 = v11;
  dispatch_sync(peersQueue, block);
  uint64_t v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEONavdXPCInterface];
  [v7 setExportedInterface:v12];

  [v7 setExportedObject:v11];
  objc_initWeak(buf, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100043AF4;
  v16[3] = &unk_100088FF8;
  objc_copyWeak(&v17, buf);
  v16[4] = self;
  [v7 setInvalidationHandler:v16];
  [v7 resume];
  v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Connection resumed.", (uint8_t *)v15, 2u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peersQueue, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_navdManager, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end