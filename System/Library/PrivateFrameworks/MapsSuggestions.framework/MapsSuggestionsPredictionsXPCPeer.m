@interface MapsSuggestionsPredictionsXPCPeer
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsPredictionsXPCPeer)initWithXPCConnection:(id)a3 memory:(id)a4;
- (NSString)description;
- (NSXPCConnection)connection;
- (void)dealloc;
- (void)predictedTransportModeForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5;
- (void)predictedTransportModeForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5;
- (void)setMemory:(id)a3;
@end

@implementation MapsSuggestionsPredictionsXPCPeer

- (MapsSuggestionsPredictionsXPCPeer)initWithXPCConnection:(id)a3 memory:(id)a4
{
  id v7 = a3;
  objc_initWeak(&location, a4);
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsPredictionsXPCPeer;
  v8 = [(MapsSuggestionsPredictionsXPCPeer *)&v17 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("MapsSuggestionsPredictionsXPCPeerQueue", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_connection, a3);
    id v12 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v8->_memory, v12);

    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      connection = v8->_connection;
      *(_DWORD *)buf = 138412290;
      v20 = connection;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "PredictionsXPCPeer{%@} created.", buf, 0xCu);
    }

    v15 = v8;
  }
  objc_destroyWeak(&location);

  return v8;
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    v9 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "PredictionsXPCPeer{%@} destroying...", buf, 0xCu);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self->_connection;
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "PredictionsXPCPeer{%@} destroyed.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsPredictionsXPCPeer;
  [(MapsSuggestionsPredictionsXPCPeer *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MapsSuggestionsPredictionsXPCPeer *)self connection];
  v6 = [v5 debugDescription];
  id v7 = [v3 initWithFormat:@"%@<%p> from %@", v4, self, v6];

  return (NSString *)v7;
}

- (void)predictedTransportModeForDestinationEntryData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100023F24;
    v13[3] = &unk_100071AA0;
    objc_copyWeak(&v17, (id *)location);
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsPredictionsServer.mm";
      __int16 v19 = 1024;
      int v20 = 65;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsPredictionsXPCPeer predictedTransportModeForDestinationEntryData:originCoordinateData:handler:]";
      __int16 v23 = 2082;
      v24 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
    }
  }
}

- (void)predictedTransportModeForDestinationMapItemData:(id)a3 originCoordinateData:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000246E0;
    v13[3] = &unk_100071AA0;
    objc_copyWeak(&v17, (id *)location);
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(queue, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsPredictionsServer.mm";
      __int16 v19 = 1024;
      int v20 = 114;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsPredictionsXPCPeer predictedTransportModeForDestinationMapItemData:originCoordinateData:handler:]";
      __int16 v23 = 2082;
      v24 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", location, 0x26u);
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
  objc_storeStrong((id *)&self->_queue, 0);
}

@end