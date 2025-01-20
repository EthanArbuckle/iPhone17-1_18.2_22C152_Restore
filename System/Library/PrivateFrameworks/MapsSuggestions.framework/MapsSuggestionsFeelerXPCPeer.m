@interface MapsSuggestionsFeelerXPCPeer
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsFeelerXPCPeer)initWithXPCConnection:(id)a3 memory:(id)a4;
- (NSString)description;
- (NSXPCConnection)connection;
- (id).cxx_construct;
- (void)dealloc;
- (void)setMemory:(id)a3;
- (void)signalPackForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5;
- (void)signalPackForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5;
- (void)signalPackForLocation:(id)a3 handler:(id)a4;
@end

@implementation MapsSuggestionsFeelerXPCPeer

- (MapsSuggestionsFeelerXPCPeer)initWithXPCConnection:(id)a3 memory:(id)a4
{
  id v7 = a3;
  objc_initWeak(&location, a4);
  v19.receiver = self;
  v19.super_class = (Class)MapsSuggestionsFeelerXPCPeer;
  v8 = [(MapsSuggestionsFeelerXPCPeer *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    id v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v9->_memory, v10);

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064((dispatch_queue_t *)&buf, @"MapsSuggestionsFeelerXPCPeerQueue", v11);
    v12 = (OS_dispatch_queue *)buf;
    *(void *)&long long buf = 0;
    innerQueue = v9->_queue._innerQueue;
    v9->_queue._innerQueue = v12;

    v14 = (NSString *)*((void *)&buf + 1);
    *((void *)&buf + 1) = 0;
    name = v9->_queue._name;
    v9->_queue._name = v14;

    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      connection = v9->_connection;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = connection;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "FeelerXPCPeer{%@} created.", (uint8_t *)&buf, 0xCu);
    }
  }
  objc_destroyWeak(&location);

  return v9;
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)long long buf = 138412290;
    v9 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "FeelerXPCPeer{%@} destroying...", buf, 0xCu);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self->_connection;
    *(_DWORD *)long long buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "FeelerXPCPeer{%@} destroyed.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsFeelerXPCPeer;
  [(MapsSuggestionsFeelerXPCPeer *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MapsSuggestionsFeelerXPCPeer *)self connection];
  v6 = [v5 debugDescription];
  id v7 = [v3 initWithFormat:@"%@<%p> from %@", v4, self, v6];

  return (NSString *)v7;
}

- (void)signalPackForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSig"
            "nalPipelineServer.mm";
      __int16 v21 = 1024;
      int v22 = 69;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsFeelerXPCPeer signalPackForDestinationMapItemData:originCoordinateData:handler:]";
      __int16 v25 = 2082;
      v26 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSig"
            "nalPipelineServer.mm";
      __int16 v21 = 1024;
      int v22 = 70;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsFeelerXPCPeer signalPackForDestinationMapItemData:originCoordinateData:handler:]";
      __int16 v25 = 2082;
      v26 = "nil == (mapItemData)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires mapItem data", buf, 0x26u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)long long buf = 138412290;
    v20 = (const char *)connection;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "FeelerXPCPeer{%@} Received signalPackForDestinationMapItemData...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026F84;
  v14[3] = &unk_100071AA0;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (void)signalPackForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSig"
            "nalPipelineServer.mm";
      __int16 v21 = 1024;
      int v22 = 95;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsFeelerXPCPeer signalPackForDestinationEntryData:originCoordinateData:handler:]";
      __int16 v25 = 2082;
      v26 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSig"
            "nalPipelineServer.mm";
      __int16 v21 = 1024;
      int v22 = 96;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsFeelerXPCPeer signalPackForDestinationEntryData:originCoordinateData:handler:]";
      __int16 v25 = 2082;
      v26 = "nil == (entryData)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry data", buf, 0x26u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)long long buf = 138412290;
    v20 = (const char *)connection;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "FeelerXPCPeer{%@} Received signalPackForDestinationEntryData...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000274F0;
  v14[3] = &unk_100071AA0;
  objc_copyWeak(&v18, (id *)buf);
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (void)signalPackForLocation:(id)a3 handler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)long long buf = 138412290;
      v13 = (const char *)connection;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "FeelerXPCPeer{%@} Received signalPackForLocation...", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027960;
    v9[3] = &unk_100071B50;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v5;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/DestinationdLocationBundleiOS/MapsSuggestionsSig"
            "nalPipelineServer.mm";
      __int16 v14 = 1024;
      int v15 = 119;
      __int16 v16 = 2082;
      id v17 = "-[MapsSuggestionsFeelerXPCPeer signalPackForLocation:handler:]";
      __int16 v18 = 2082;
      objc_super v19 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
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
  objc_storeStrong((id *)&self->_connection, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end