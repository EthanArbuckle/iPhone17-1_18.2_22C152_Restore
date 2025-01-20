@interface MapsSuggestionsPredictionsServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsPredictionsServer)initWithMemory:(id)a3;
- (id).cxx_construct;
- (void)setMemory:(id)a3;
@end

@implementation MapsSuggestionsPredictionsServer

- (MapsSuggestionsPredictionsServer)initWithMemory:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MapsSuggestionsPredictionsServer;
  v5 = [(MapsSuggestionsPredictionsServer *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_memory, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v19, @"MapsSuggestionsPredictionsServerQueue", v7);
    dispatch_queue_t v8 = v19;
    dispatch_queue_t v19 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v8;

    v10 = v20;
    v20 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peers = v6->_peers;
    v6->_peers = v12;

    v14 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.maps.destinationd.predictions"];
    listener = v6->_listener;
    v6->_listener = v14;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Predictions Listener created.", (uint8_t *)&v19, 2u);
    }

    [(NSXPCListener *)v6->_listener resume];
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Predictions Listener resumed.", (uint8_t *)&v19, 2u);
    }
  }
  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (char *)a4;
  if (v5)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Incoming XPC connection %@.", buf, 0xCu);
    }

    v7 = [MapsSuggestionsPredictionsXPCPeer alloc];
    dispatch_queue_t v8 = [(MapsSuggestionsPredictionsServer *)self memory];
    v9 = [(MapsSuggestionsPredictionsXPCPeer *)v7 initWithXPCConnection:v5 memory:v8];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000257E0;
    block[3] = &unk_100071668;
    block[4] = self;
    v10 = v9;
    v37 = v10;
    dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSuggestionsPredictionsProxy];
    id v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v12 forSelector:"predictedTransportModeForDestinationEntryData:originCoordinateData:handler:" argumentIndex:0 ofReply:1];

    id v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v13 forSelector:"predictedTransportModeForDestinationEntryData:originCoordinateData:handler:" argumentIndex:1 ofReply:1];

    id v14 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v14 forSelector:"predictedTransportModeForDestinationEntryData:originCoordinateData:handler:" argumentIndex:2 ofReply:1];

    id v15 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v15 forSelector:"predictedTransportModeForDestinationEntryData:originCoordinateData:handler:" argumentIndex:0 ofReply:0];

    id v16 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v16 forSelector:"predictedTransportModeForDestinationEntryData:originCoordinateData:handler:" argumentIndex:1 ofReply:0];

    id v17 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v17 forSelector:"predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:" argumentIndex:0 ofReply:1];

    id v18 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v18 forSelector:"predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:" argumentIndex:1 ofReply:1];

    id v19 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v19 forSelector:"predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:" argumentIndex:2 ofReply:1];

    id v20 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v20 forSelector:"predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:" argumentIndex:0 ofReply:0];

    id v21 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v21 forSelector:"predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:" argumentIndex:1 ofReply:0];

    [v5 setExportedInterface:v11];
    [v5 setExportedObject:v10];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v10);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000257EC;
    v31[3] = &unk_100071AF0;
    objc_copyWeak(&v33, (id *)buf);
    objc_copyWeak(&v34, &location);
    v22 = v5;
    v32 = v22;
    [v22 setInvalidationHandler:v31];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100025B54;
    v27[3] = &unk_100071AF0;
    objc_copyWeak(&v29, (id *)buf);
    objc_copyWeak(&v30, &location);
    v23 = v22;
    v28 = v23;
    [v23 setInterruptionHandler:v27];
    [v23 resume];
    [(MapsSuggestionsPredictionsServer *)self _debugPrintOverviewOfConnections];
    v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Connection resumed.", v26, 2u);
    }

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsPredictionsServer.mm";
      __int16 v40 = 1024;
      int v41 = 206;
      __int16 v42 = 2082;
      v43 = "-[MapsSuggestionsPredictionsServer listener:shouldAcceptNewConnection:]";
      __int16 v44 = 2082;
      v45 = "nil == (newConnection)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a newConnection", buf, 0x26u);
    }
  }

  return v5 != 0;
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

  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_peers, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end