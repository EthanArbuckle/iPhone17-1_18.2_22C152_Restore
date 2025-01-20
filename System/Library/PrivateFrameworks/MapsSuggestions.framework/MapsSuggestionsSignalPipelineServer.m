@interface MapsSuggestionsSignalPipelineServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsSignalPipelineServer)initWithMemory:(id)a3;
- (id).cxx_construct;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_removeConnectionSynchronously:(id)a3;
- (void)_sendSignalPack:(id)a3 toConnection:(id)a4;
- (void)setMemory:(id)a3;
- (void)signalPipelineUpdated:(id)a3;
@end

@implementation MapsSuggestionsSignalPipelineServer

- (MapsSuggestionsSignalPipelineServer)initWithMemory:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MapsSuggestionsSignalPipelineServer;
  v5 = [(MapsSuggestionsSignalPipelineServer *)&v24 init];
  v6 = v5;
  if (v5)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v22, @"MapsSuggestionsSignalPipelineServerQueue", v7);
    dispatch_queue_t v8 = v22;
    dispatch_queue_t v22 = 0;
    innerQueue = v5->_queue._innerQueue;
    v5->_queue._innerQueue = (OS_dispatch_queue *)v8;

    v10 = v23;
    v23 = 0;
    name = v5->_queue._name;
    v5->_queue._name = v10;

    v12 = [v4 signalPipeline];
    [v12 setUpdaterDelegate:v5];

    objc_storeWeak((id *)&v5->_memory, v4);
    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peers = v5->_peers;
    v5->_peers = v13;

    v15 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.maps.destinationd.signalPipeline"];
    listener = v5->_listener;
    v5->_listener = v15;

    [(NSXPCListener *)v5->_listener setDelegate:v5];
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Feeler Listener created.", (uint8_t *)&v22, 2u);
    }

    [(NSXPCListener *)v5->_listener resume];
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Feeler Listener resumed.", (uint8_t *)&v22, 2u);
    }

    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connections = v6->_connections;
    v6->_connections = v19;
  }
  return v6;
}

- (void)_removeConnectionSynchronously:(id)a3
{
  id v4 = a3;
  innerQueue = self->_queue._innerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027E84;
  v7[3] = &unk_100071668;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(innerQueue, v7);
}

- (void)_removeConnection:(id)a3
{
  id v4 = (char *)a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_removeConnection:%@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_memory);
  if (!WeakRetained)
  {
    GEOFindOrCreateLog();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      v9 = "MapsSuggestionsSignalPipelineServer.mm";
      __int16 v10 = 1026;
      int v11 = 190;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSignalPipelineServer _removeConnection:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", (uint8_t *)&v8, 0x1Cu);
    }

    goto LABEL_9;
  }
  [(NSMutableArray *)self->_connections removeObject:v4];
  if (![(NSMutableArray *)self->_connections count])
  {
    v7 = [WeakRetained signalPipeline];
    [v7 stop];
LABEL_9:
  }
}

- (void)_addConnection:(id)a3
{
  id v4 = (char *)a3;
  if (v4)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412290;
      v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "_addConnection:%@", (uint8_t *)&v20, 0xCu);
    }

    if ([(NSMutableArray *)self->_connections containsObject:v4])
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 138412290;
        v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "WARNING: already had connection %@", (uint8_t *)&v20, 0xCu);
      }
    }
    v7 = MapsSuggestionsIPCPeerIdentifier();
    uint64_t v8 = MapsSuggestionsIPCPayloadForNSString();
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138412546;
      v21 = (char *)v7;
      __int16 v22 = 2048;
      *(void *)v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Incoming connection comes from %@ (%llu)", (uint8_t *)&v20, 0x16u);
    }

    [(NSMutableArray *)self->_connections addObject:v4];
    id v10 = [(NSMutableArray *)self->_connections count];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_memory);
    if (WeakRetained)
    {
      if (v10 == (id)1)
      {
        __int16 v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "This is the first connection", (uint8_t *)&v20, 2u);
        }

        v13 = [WeakRetained signalPipeline];
        [v13 start];
      }
      v14 = [v4 remoteObjectProxy];
      char v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0)
      {
        v19 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          int v20 = 138412290;
          v21 = v4;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "For some weird reason, our connection is not right: %@", (uint8_t *)&v20, 0xCu);
        }

        [v4 invalidate];
        [(MapsSuggestionsSignalPipelineServer *)self _removeConnectionSynchronously:v4];
        goto LABEL_29;
      }
      v16 = [WeakRetained signalPipeline];
      v17 = [v16 mergedCommonSignalPack];

      if (v17)
      {
        v18 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v20) = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Already sending the SignalPackData we have to the incoming connection", (uint8_t *)&v20, 2u);
        }

        [(MapsSuggestionsSignalPipelineServer *)self _sendSignalPack:v17 toConnection:v4];
      }
    }
    else
    {
      GEOFindOrCreateLog();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136446722;
        v21 = "MapsSuggestionsSignalPipelineServer.mm";
        __int16 v22 = 1026;
        *(_DWORD *)v23 = 219;
        *(_WORD *)&v23[4] = 2082;
        *(void *)&v23[6] = "-[MapsSuggestionsSignalPipelineServer _addConnection:]";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", (uint8_t *)&v20, 0x1Cu);
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    int v20 = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSigna"
          "lPipelineServer.mm";
    __int16 v22 = 1024;
    *(_DWORD *)v23 = 201;
    *(_WORD *)&v23[4] = 2082;
    *(void *)&v23[6] = "-[MapsSuggestionsSignalPipelineServer _addConnection:]";
    __int16 v24 = 2082;
    v25 = "nil == (connection)";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Needs a connection", (uint8_t *)&v20, 0x26u);
  }
LABEL_30:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v5 = (char *)a4;
  if (v5)
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Incoming XPC connection %@.", buf, 0xCu);
    }

    v7 = [MapsSuggestionsFeelerXPCPeer alloc];
    uint64_t v8 = [(MapsSuggestionsSignalPipelineServer *)self memory];
    v9 = [(MapsSuggestionsFeelerXPCPeer *)v7 initWithXPCConnection:v5 memory:v8];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028B8C;
    block[3] = &unk_100071668;
    block[4] = self;
    id v10 = v9;
    v34 = v10;
    dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
    int v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSuggestionsSignalPipelineProxy];
    [v5 setExportedInterface:v11];

    __int16 v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSuggestionsSignalPipelineUpdateProxy];
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
    [v12 setClasses:v13 forSelector:"signalPackUpdated:" argumentIndex:0 ofReply:0];

    [v5 setRemoteObjectInterface:v12];
    [v5 setExportedObject:v10];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v10);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100028B98;
    v28[3] = &unk_100071AF0;
    objc_copyWeak(&v30, (id *)buf);
    objc_copyWeak(&v31, &location);
    v14 = v5;
    v29 = v14;
    [v14 setInvalidationHandler:v28];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100028F30;
    v24[3] = &unk_100071AF0;
    objc_copyWeak(&v26, (id *)buf);
    objc_copyWeak(&v27, &location);
    char v15 = v14;
    v25 = v15;
    [v15 setInterruptionHandler:v24];
    [v15 resume];
    innerQueue = self->_queue._innerQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000292C8;
    v21[3] = &unk_100071498;
    v17 = innerQueue;
    objc_copyWeak(&v23, (id *)buf);
    __int16 v22 = v15;
    dispatch_async(v17, v21);

    [(MapsSuggestionsSignalPipelineServer *)self _debugPrintOverviewOfConnections];
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Connection resumed.", v20, 2u);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v36 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSig"
            "nalPipelineServer.mm";
      __int16 v37 = 1024;
      int v38 = 244;
      __int16 v39 = 2082;
      v40 = "-[MapsSuggestionsSignalPipelineServer listener:shouldAcceptNewConnection:]";
      __int16 v41 = 2082;
      v42 = "nil == (newConnection)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a newConnection", buf, 0x26u);
    }
  }

  return v5 != 0;
}

- (void)_sendSignalPack:(id)a3 toConnection:(id)a4
{
  id v7 = a3;
  v5 = [a4 remoteObjectProxyWithErrorHandler:&stru_100071B90];
  id v6 = NSDataFromMapsSuggestionsSignalPack();
  [v5 signalPackUpdated:v6];
}

- (void)signalPipelineUpdated:(id)a3
{
  id v4 = a3;
  if (self->_queue._innerQueue)
  {
    objc_initWeak((id *)location, self);
    innerQueue = self->_queue._innerQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002974C;
    v8[3] = &unk_100071498;
    id v6 = innerQueue;
    objc_copyWeak(&v10, (id *)location);
    id v9 = v4;
    dispatch_async(v6, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiO"
                                "S/MapsSuggestionsSignalPipelineServer.mm";
      __int16 v12 = 1024;
      int v13 = 330;
      __int16 v14 = 2082;
      char v15 = "-[MapsSuggestionsSignalPipelineServer signalPipelineUpdated:]";
      __int16 v16 = 2082;
      v17 = "nil == (_queue)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. SignalPipelineServer's _queue cannot be nil", location, 0x26u);
    }
  }
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
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_peers, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end