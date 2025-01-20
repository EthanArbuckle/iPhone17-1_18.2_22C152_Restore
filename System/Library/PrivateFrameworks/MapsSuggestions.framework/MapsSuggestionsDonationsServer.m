@interface MapsSuggestionsDonationsServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsDonationsServer)initWithMemory:(id)a3;
- (void)setMemory:(id)a3;
@end

@implementation MapsSuggestionsDonationsServer

- (MapsSuggestionsDonationsServer)initWithMemory:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MapsSuggestionsDonationsServer;
  v5 = [(MapsSuggestionsDonationsServer *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("MapsSuggestionsDonationsServerQueue", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_memory, v4);
    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peers = v5->_peers;
    v5->_peers = v9;

    v11 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.maps.destinationd.donations"];
    listener = v5->_listener;
    v5->_listener = v11;

    [(NSXPCListener *)v5->_listener setDelegate:v5];
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Donations Listener created.", v17, 2u);
    }

    [(NSXPCListener *)v5->_listener resume];
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Donations Listener resumed.", v17, 2u);
    }

    v15 = v5;
  }

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (char *)a4;
  v8 = GEOFindOrCreateLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Incoming XPC connection %@.", buf, 0xCu);
    }

    v10 = [MapsSuggestionsDonationsXPCPeer alloc];
    v11 = [(MapsSuggestionsDonationsServer *)self memory];
    v12 = [(MapsSuggestionsDonationsXPCPeer *)v10 initWithXPCConnection:v7 memory:v11];

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D9B4;
    block[3] = &unk_100071D90;
    block[4] = self;
    v9 = v12;
    v30 = v9;
    dispatch_sync(queue, block);
    v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSuggestionsDonateeProxy];
    [v7 setExportedInterface:v14];

    [v7 setExportedObject:v9];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v9);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002D9C0;
    v24[3] = &unk_100071DE0;
    objc_copyWeak(&v26, (id *)buf);
    objc_copyWeak(&v27, &location);
    v15 = v7;
    v25 = v15;
    [v15 setInvalidationHandler:v24];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002DC48;
    v20[3] = &unk_100071DE0;
    objc_copyWeak(&v22, (id *)buf);
    objc_copyWeak(&v23, &location);
    v16 = v15;
    v21 = v16;
    [v16 setInterruptionHandler:v20];
    [v16 resume];
    [(MapsSuggestionsDonationsServer *)self _debugPrintOverviewOfConnections];
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __int16 v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Connection resumed.", (uint8_t *)&v19, 2u);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDonationsServer.m";
    __int16 v33 = 1024;
    int v34 = 150;
    __int16 v35 = 2082;
    v36 = "-[MapsSuggestionsDonationsServer listener:shouldAcceptNewConnection:]";
    __int16 v37 = 2082;
    v38 = "nil == (newConnection)";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a newConnection", buf, 0x26u);
  }

  return v7 != 0;
}

- (MapsSuggestionsDaemonMemory)memory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_memory);
  return (MapsSuggestionsDaemonMemory *)WeakRetained;
}

- (void)setMemory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_memory);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_peers, 0);
}

@end