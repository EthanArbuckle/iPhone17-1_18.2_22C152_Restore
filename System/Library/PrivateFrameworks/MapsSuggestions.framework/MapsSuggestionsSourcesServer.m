@interface MapsSuggestionsSourcesServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MapsSuggestionsSourcesServer)initWithMemory:(id)a3;
- (NSString)uniqueName;
- (void)dealloc;
- (void)didUpdateLocation:(id)a3;
@end

@implementation MapsSuggestionsSourcesServer

- (MapsSuggestionsSourcesServer)initWithMemory:(id)a3
{
  objc_initWeak(&location, a3);
  v56.receiver = self;
  v56.super_class = (Class)MapsSuggestionsSourcesServer;
  v4 = [(MapsSuggestionsSourcesServer *)&v56 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("MapsSuggestionsSourcesServerQueue", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    id v8 = objc_loadWeakRetained(&location);
    v9 = v8;
    if (!v8)
    {
      GEOFindOrCreateLog();
      v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v73 = "MapsSuggestionsSourcesServer.m";
        __int16 v74 = 1026;
        int v75 = 312;
        __int16 v76 = 2082;
        v77 = "-[MapsSuggestionsSourcesServer initWithMemory:]";
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongMemory went away in %{public}s", buf, 0x1Cu);
      }

      v40 = 0;
      goto LABEL_55;
    }
    uint64_t v10 = [v8 locationUpdater];
    locationUpdater = v4->_locationUpdater;
    v4->_locationUpdater = (MapsSuggestionsLocationUpdater *)v10;

    uint64_t v12 = [v9 sourceWrapper];
    wrapper = v4->_wrapper;
    v4->_wrapper = (MapsSuggestionsSourceWrapper *)v12;

    uint64_t v14 = [v9 destinationGraph];
    graph = v4->_graph;
    v4->_graph = (MapsSuggestionsDestinationGraph *)v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    peers = v4->_peers;
    v4->_peers = v16;

    if (!MapsSuggestionsIsDestinationGraphEnabled())
    {
LABEL_48:
      v45 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.maps.destinationd.sources"];
      listener = v4->_listener;
      v4->_listener = v45;

      [(NSXPCListener *)v4->_listener setDelegate:v4];
      v47 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Sources Listener created.", buf, 2u);
      }

      [(NSXPCListener *)v4->_listener resume];
      v48 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Sources Listener resumed.", buf, 2u);
      }

      id v49 = [(MapsSuggestionsLocationUpdater *)v4->_locationUpdater startLocationUpdatesForDelegate:v4];
      v50 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "LocationUpdater started.", buf, 2u);
      }

      v40 = v4;
LABEL_55:

      goto LABEL_56;
    }
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Preloading Graph.", buf, 2u);
    }

    v19 = v4->_graph;
    v20 = [(MapsSuggestionsSourceWrapper *)v4->_wrapper source];
    v21 = v19;
    id v22 = v20;
    v23 = v22;
    if (v21)
    {
      if (v22)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v54 = v23;
          v55 = MapsSuggestionsCurrentBestLocation();
          if (!v55)
          {
            GEOFindOrCreateLog();
            v24 = (MapsSuggestionsDestinationGraphUpdater *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v73 = "_rebuildGraph";
              _os_log_impl((void *)&_mh_execute_header, &v24->super, OS_LOG_TYPE_ERROR, "Got no current location to work with in %s", buf, 0xCu);
            }
            goto LABEL_46;
          }
          v24 = [[MapsSuggestionsDestinationGraphUpdater alloc] initWithDestinationGraph:v21];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          v25 = [v54 children];
          id v26 = [v25 countByEnumeratingWithState:&v66 objects:buf count:16];
          if (v26)
          {
            v52 = v21;
            char v27 = 0;
            uint64_t v28 = *(void *)v67;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(void *)v67 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                if ([v30 conformsToProtocol:&OBJC_PROTOCOL___MapsSuggestionsPreloadableSource])
                {
                  [(MapsSuggestionsDestinationGraphUpdater *)v24 addPreloadableSource:v30];
                  char v27 = 1;
                }
              }
              id v26 = [v25 countByEnumeratingWithState:&v66 objects:buf count:16];
            }
            while (v26);

            v21 = v52;
            if (v27)
            {
              v64[0] = 0;
              v64[1] = v64;
              v64[2] = 0x2020000000;
              char v65 = 0;
              id v31 = objc_alloc((Class)NSDateInterval);
              v32 = MapsSuggestionsNow();
              GEOConfigGetDouble();
              id v33 = objc_msgSend(v31, "initWithStartDate:duration:", v32);

              dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
              *(void *)v58 = _NSConcreteStackBlock;
              uint64_t v59 = 3221225472;
              v60 = sub_100034890;
              v61 = &unk_100071FF8;
              v63 = v64;
              v35 = v34;
              v62 = v35;
              if ([(MapsSuggestionsDestinationGraphUpdater *)v24 rebuildForPeriod:v33 location:v55 handler:v58])
              {
                GEOConfigGetDouble();
                dispatch_time_t v37 = dispatch_time(0, (uint64_t)(v36 * 1000000000.0));
                if (!dispatch_semaphore_wait(v35, v37))
                {
LABEL_45:

                  _Block_object_dispose(v64, 8);
LABEL_46:

                  v42 = v54;
                  goto LABEL_47;
                }
                v38 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v70 = 136315138;
                  v71 = "_rebuildGraph";
                  v39 = "Timeout on %s";
LABEL_43:
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v39, v70, 0xCu);
                }
              }
              else
              {
                v38 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v70 = 136315138;
                  v71 = "_rebuildGraph";
                  v39 = "DestinationGraphUpdater did not like our input in %s";
                  goto LABEL_43;
                }
              }

              goto LABEL_45;
            }
          }
          else
          {
          }
          v44 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v58 = 0;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Our DestinationGraphUpdater doesn't have any Sources to preload", v58, 2u);
          }

          goto LABEL_46;
        }
        v42 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136446978;
          v73 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
          __int16 v74 = 1024;
          int v75 = 34;
          __int16 v76 = 2082;
          v77 = "BOOL _rebuildGraph(MapsSuggestionsDestinationGraph *__strong, __strong id<MapsSuggestionsSource>)";
          __int16 v78 = 2082;
          v79 = "! [source isKindOfClass:[MapsSuggestionsCompositeSource class]]";
          v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Only supports CompositeSource at the moment";
          goto LABEL_34;
        }
LABEL_47:

        goto LABEL_48;
      }
      v42 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 136446978;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v74 = 1024;
      int v75 = 33;
      __int16 v76 = 2082;
      v77 = "BOOL _rebuildGraph(MapsSuggestionsDestinationGraph *__strong, __strong id<MapsSuggestionsSource>)";
      __int16 v78 = 2082;
      v79 = "nil == (source)";
      v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source";
    }
    else
    {
      v42 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        goto LABEL_47;
      }
      *(_DWORD *)buf = 136446978;
      v73 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v74 = 1024;
      int v75 = 32;
      __int16 v76 = 2082;
      v77 = "BOOL _rebuildGraph(MapsSuggestionsDestinationGraph *__strong, __strong id<MapsSuggestionsSource>)";
      __int16 v78 = 2082;
      v79 = "nil == (graph)";
      v43 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination graph";
    }
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_FAULT, v43, buf, 0x26u);
    goto LABEL_47;
  }
  v40 = 0;
LABEL_56:
  objc_destroyWeak(&location);

  return v40;
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "LocationUpdater stopping.", buf, 2u);
  }

  [(MapsSuggestionsLocationUpdater *)self->_locationUpdater stopLocationUpdatesForDelegate:self];
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "LocationUpdater stopped.", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsSourcesServer;
  [(MapsSuggestionsSourcesServer *)&v5 dealloc];
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v19 = a3;
  dispatch_queue_t v6 = (char *)a4;
  v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Incoming XPC connection %@.", buf, 0xCu);
    }

    v9 = [[MapsSuggestionsSourcesXPCPeer alloc] initWithXPCConnection:v6 sourceWrapper:self->_wrapper graph:self->_graph];
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034094;
    block[3] = &unk_100071D90;
    block[4] = self;
    id v8 = v9;
    id v31 = v8;
    dispatch_sync(queue, block);
    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSuggestionsSourceDelegateProxy];
    id v12 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0, v19);
    [v11 setClasses:v12 forSelector:"addOrUpdateSuggestionEntriesData:sourceNameData:handler:" argumentIndex:0 ofReply:0];

    id v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", objc_opt_class(), 0);
    [v11 setClasses:v13 forSelector:"addOrUpdateSuggestionEntriesData:sourceNameData:handler:" argumentIndex:1 ofReply:0];

    [v6 setRemoteObjectInterface:v11];
    uint64_t v14 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MapsSuggestionsSourceProxy];
    [v6 setExportedInterface:v14];

    [v6 setExportedObject:v8];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v8);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000340A0;
    v25[3] = &unk_100071DE0;
    objc_copyWeak(&v27, (id *)buf);
    objc_copyWeak(&v28, &location);
    v15 = v6;
    id v26 = v15;
    [v15 setInvalidationHandler:v25];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003443C;
    v21[3] = &unk_100071DE0;
    objc_copyWeak(&v23, (id *)buf);
    objc_copyWeak(&v24, &location);
    v16 = v15;
    id v22 = v16;
    [v16 setInterruptionHandler:v21];
    [v16 resume];
    [(MapsSuggestionsSourcesServer *)self _debugPrintOverviewOfConnections];
    v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Connection resumed.", v20, 2u);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
    __int16 v34 = 1024;
    int v35 = 356;
    __int16 v36 = 2082;
    dispatch_time_t v37 = "-[MapsSuggestionsSourcesServer listener:shouldAcceptNewConnection:]";
    __int16 v38 = 2082;
    v39 = "nil == (newConnection)";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a newConnection", buf, 0x26u);
  }

  return v6 != 0;
}

- (void)didUpdateLocation:(id)a3
{
  id v3 = a3;
  if (MapsSuggestionsLoggingIsVerbose())
  {
    v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Received location update: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_locationUpdater, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end