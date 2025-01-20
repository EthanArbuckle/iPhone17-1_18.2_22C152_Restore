@interface NavdRouteGeniusXPCPeer
- (NSString)description;
- (NSXPCConnection)connection;
- (NavdRouteGeniusXPCPeer)initWithXPCConnection:(id)a3 delegate:(id)a4;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)forceReroute;
- (void)startWithHandler:(id)a3;
- (void)stopWithHandler:(id)a3;
@end

@implementation NavdRouteGeniusXPCPeer

- (NavdRouteGeniusXPCPeer)initWithXPCConnection:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NavdRouteGeniusXPCPeer;
  v9 = [(NavdRouteGeniusXPCPeer *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("NavdXPCPeerQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_delegate, a4);
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      connection = v10->_connection;
      *(_DWORD *)buf = 138412290;
      v20 = connection;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} created.", buf, 0xCu);
    }

    v16 = v10;
  }

  return v10;
}

- (void)startWithHandler:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412290;
      v15 = (const char *)connection;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} Received start...", buf, 0xCu);
    }

    id v8 = [v4 copy];
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003BA5C;
    v11[3] = &unk_10008C0B0;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v8;
    id v10 = v8;
    dispatch_async(queue, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/RouteGenius/NavdRouteGeniusServer.m";
      __int16 v16 = 1024;
      int v17 = 59;
      __int16 v18 = 2082;
      v19 = "-[NavdRouteGeniusXPCPeer startWithHandler:]";
      __int16 v20 = 2082;
      v21 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
  }
}

- (void)stopWithHandler:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412290;
      id v12 = (const char *)connection;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} Received stop...", buf, 0xCu);
    }

    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003BDF8;
    v9[3] = &unk_10008AE10;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(queue, v9);
    v6 = v10;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/RouteGenius/NavdRouteGeniusServer.m";
    __int16 v13 = 1024;
    int v14 = 75;
    __int16 v15 = 2082;
    __int16 v16 = "-[NavdRouteGeniusXPCPeer stopWithHandler:]";
    __int16 v17 = 2082;
    __int16 v18 = "nil == (handler)";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
  }
}

- (void)forceReroute
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    v9 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} Received forceUpdate ...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BF78;
  block[3] = &unk_1000893C0;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)_stopMonitoring
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    int v9 = 138412290;
    id v10 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} stopping...", (uint8_t *)&v9, 0xCu);
  }

  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self->_connection;
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} stopped.", (uint8_t *)&v9, 0xCu);
  }

  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    id v8 = self->_completionBlock;
    self->_completionBlock = 0;
  }
  [(NSXPCConnection *)self->_connection invalidate];
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    int v9 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} destroying...", buf, 0xCu);
  }

  [(NavdRouteGeniusXPCPeer *)self _stopMonitoring];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self->_connection;
    *(_DWORD *)buf = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "RouteGeniusXPCPeer{%@} destroyed.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)NavdRouteGeniusXPCPeer;
  [(NavdRouteGeniusXPCPeer *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(NavdRouteGeniusXPCPeer *)self connection];
  v6 = [v5 debugDescription];
  id v7 = [v3 initWithFormat:@"%@<%p> from %@", v4, self, v6];

  return (NSString *)v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end