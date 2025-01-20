@interface GEONavdServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GEONavdServer)init;
- (void)dealloc;
@end

@implementation GEONavdServer

- (GEONavdServer)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)GEONavdServer;
  v2 = [(GEONavdServer *)&v15 init];
  if (v2)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "Initializing NavdServer", buf, 2u);
    }

    if (!v2->_navigationServer)
    {
      v4 = objc_alloc_init(GEONavigationServer);
      navigationServer = v2->_navigationServer;
      v2->_navigationServer = v4;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.navigationServer"];
    pushNavigationStateListener = v2->_pushNavigationStateListener;
    v2->_pushNavigationStateListener = (NSXPCListener *)v6;

    [(NSXPCListener *)v2->_pushNavigationStateListener setDelegate:v2];
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.navigationListener"];
    getNavigationStateListener = v2->_getNavigationStateListener;
    v2->_getNavigationStateListener = (NSXPCListener *)v8;

    [(NSXPCListener *)v2->_getNavigationStateListener setDelegate:v2];
    [(NSXPCListener *)v2->_pushNavigationStateListener resume];
    [(NSXPCListener *)v2->_monitorDestinationListener resume];
    [(NSXPCListener *)v2->_getNavigationStateListener resume];
    v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = v2->_pushNavigationStateListener;
      v11 = v2->_getNavigationStateListener;
      monitorDestinationListener = v2->_monitorDestinationListener;
      *(_DWORD *)buf = 138478339;
      v17 = v11;
      __int16 v18 = 2113;
      v19 = v12;
      __int16 v20 = 2113;
      v21 = monitorDestinationListener;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "geonavd server initialized all listeners: %{private}@, %{private}@, %{private}@", buf, 0x20u);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_pushNavigationStateListener invalidate];
  [(NSXPCListener *)self->_getNavigationStateListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)GEONavdServer;
  [(GEONavdServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = (NSXPCListener *)a3;
  id v7 = a4;
  pushNavigationStateListener = self->_pushNavigationStateListener;
  if (pushNavigationStateListener == v6)
  {
    v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v10 = "Push State Listener: Connection created.";
      v11 = buf;
      goto LABEL_7;
    }
LABEL_8:

    [(GEONavigationServer *)self->_navigationServer shouldAcceptNewConnection:v7 shouldCreateNavigationPeer:pushNavigationStateListener != v6];
    goto LABEL_9;
  }
  if (self->_getNavigationStateListener == v6)
  {
    v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEONavdServer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v13 = 0;
      v10 = "Get State Listener: Connection created.";
      v11 = (uint8_t *)&v13;
LABEL_7:
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_DEBUG, v10, v11, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationServer, 0);
  objc_storeStrong((id *)&self->_monitorDestinationListener, 0);
  objc_storeStrong((id *)&self->_getNavigationStateListener, 0);

  objc_storeStrong((id *)&self->_pushNavigationStateListener, 0);
}

@end