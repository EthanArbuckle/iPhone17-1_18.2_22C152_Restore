@interface NavdRouteGeniusServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NavdRouteGeniusActivatable)activatable;
- (NavdRouteGeniusServer)init;
- (id)uniqueName;
- (void)_q_start;
- (void)_q_stop;
- (void)didUpdateRouteGenius:(id)a3;
- (void)setActivatable:(id)a3;
@end

@implementation NavdRouteGeniusServer

- (NavdRouteGeniusServer)init
{
  v15.receiver = self;
  v15.super_class = (Class)NavdRouteGeniusServer;
  v2 = [(NavdRouteGeniusServer *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NavdRouteGeniusServerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peers = v2->_peers;
    v2->_peers = v6;

    v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.navd.routegenius"];
    listener = v2->_listener;
    v2->_listener = v8;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "RouteGenius Listener created.", v14, 2u);
    }

    [(NSXPCListener *)v2->_listener resume];
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "RouteGenius Listener resumed.", v14, 2u);
    }

    v12 = v2;
  }

  return v2;
}

- (id)uniqueName
{
  v2 = objc_opt_class();

  return [v2 description];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v20 = a3;
  v6 = (char *)a4;
  v7 = GEOFindOrCreateLog();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Incoming XPC connection %@.", buf, 0xCu);
    }

    v9 = [NavdRouteGeniusXPCPeer alloc];
    v10 = [(NavdRouteGeniusServer *)self activatable];
    v11 = [(NavdRouteGeniusXPCPeer *)v9 initWithXPCConnection:v6 delegate:v10];

    objc_initWeak((id *)buf, self);
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MNRouteGeniusDelegateProxy];
    uint64_t v13 = objc_opt_class();
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, objc_opt_class(), 0);
    [v12 setClasses:v14 forSelector:"didUpdateRouteGenius:" argumentIndex:0 ofReply:0];

    [v6 setRemoteObjectInterface:v12];
    objc_super v15 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MNRouteGeniusProxy];
    [v6 setExportedInterface:v15];

    [v6 setExportedObject:v11];
    objc_initWeak(&location, v11);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003CA4C;
    v25[3] = &unk_10008C0D8;
    objc_copyWeak(&v27, (id *)buf);
    objc_copyWeak(&v28, &location);
    v16 = v6;
    v26 = v16;
    [v16 setInvalidationHandler:v25];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CDB8;
    block[3] = &unk_100088FF8;
    objc_copyWeak(&v24, (id *)buf);
    v8 = v11;
    v23 = v8;
    dispatch_sync(queue, block);
    [v16 resume];
    [(NavdRouteGeniusServer *)self _debugPrintOverviewOfConnections];
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Connection resumed.", v21, 2u);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/RouteGenius/NavdRouteGeniusServer.m";
    __int16 v32 = 1024;
    int v33 = 174;
    __int16 v34 = 2082;
    v35 = "-[NavdRouteGeniusServer listener:shouldAcceptNewConnection:]";
    __int16 v36 = 2082;
    v37 = "nil == (newConnection)";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a newConnection", buf, 0x26u);
  }

  return v6 != 0;
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CFA4;
  block[3] = &unk_100088FF8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_q_start
{
  if (self->_isActive)
  {
    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      __int16 v7 = 0;
      v3 = "RouteGenius is already active, no need to start";
      id v4 = (uint8_t *)&v7;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, v3, v4, 2u);
    }
  }
  else
  {
    self->_isActive = 1;
    v5 = [(NavdRouteGeniusServer *)self activatable];
    [v5 start];

    v2 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      __int16 v6 = 0;
      v3 = "Started RouteGenius";
      id v4 = (uint8_t *)&v6;
      goto LABEL_6;
    }
  }
}

- (void)_q_stop
{
  if (self->_isActive)
  {
    self->_isActive = 0;
    v2 = [(NavdRouteGeniusServer *)self activatable];
    [v2 stop];

    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __int16 v6 = 0;
      id v4 = "Stopped RouteGenius";
      v5 = (uint8_t *)&v6;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
    }
  }
  else
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      id v4 = "RouteGenius is not active, no need to stop";
      v5 = buf;
      goto LABEL_6;
    }
  }
}

- (NavdRouteGeniusActivatable)activatable
{
  return (NavdRouteGeniusActivatable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActivatable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_peers, 0);
}

@end