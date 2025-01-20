@interface MapsSuggestionsDonationsXPCPeer
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsDonationsXPCPeer)initWithXPCConnection:(id)a3 memory:(id)a4;
- (NSString)description;
- (NSXPCConnection)connection;
- (void)dealloc;
- (void)donateETAData:(id)a3 destinationKey:(id)a4 handler:(id)a5;
- (void)donateSignalPackData:(id)a3 handler:(id)a4;
- (void)setMemory:(id)a3;
@end

@implementation MapsSuggestionsDonationsXPCPeer

- (MapsSuggestionsDonationsXPCPeer)initWithXPCConnection:(id)a3 memory:(id)a4
{
  id v7 = a3;
  objc_initWeak(&location, a4);
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsDonationsXPCPeer;
  v8 = [(MapsSuggestionsDonationsXPCPeer *)&v17 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("MapsSuggestionsDonationsXPCPeerQueue", v9);
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
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "DonationsXPCPeer{%@} created.", buf, 0xCu);
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "DonationsXPCPeer{%@} destroying...", buf, 0xCu);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self->_connection;
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "DonationsXPCPeer{%@} destroyed.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsDonationsXPCPeer;
  [(MapsSuggestionsDonationsXPCPeer *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MapsSuggestionsDonationsXPCPeer *)self connection];
  v6 = [v5 debugDescription];
  id v7 = [v3 initWithFormat:@"%@<%p> from %@", v4, self, v6];

  return (NSString *)v7;
}

- (void)donateETAData:(id)a3 destinationKey:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDonationsServer.m";
      __int16 v23 = 1024;
      int v24 = 70;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsDonationsXPCPeer donateETAData:destinationKey:handler:]";
      __int16 v27 = 2082;
      v28 = "nil == (handler)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, v15, buf, 0x26u);
    }
LABEL_11:

    goto LABEL_12;
  }
  v11 = GEOFindOrCreateLog();
  id v12 = v11;
  if (!v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDonationsServer.m";
      __int16 v23 = 1024;
      int v24 = 71;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsDonationsXPCPeer donateETAData:destinationKey:handler:]";
      __int16 v27 = 2082;
      v28 = "nil == (destinationKey)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination key";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    v22 = (const char *)connection;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "DonationsXPCPeer{%@} Received donateETAData...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002CCAC;
  v16[3] = &unk_100071960;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(queue, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
LABEL_12:
}

- (void)donateSignalPackData:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D0B8;
    block[3] = &unk_100071D68;
    objc_copyWeak(&v13, (id *)location);
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsDonationsServer.m";
      __int16 v15 = 1024;
      int v16 = 91;
      __int16 v17 = 2082;
      id v18 = "-[MapsSuggestionsDonationsXPCPeer donateSignalPackData:handler:]";
      __int16 v19 = 2082;
      id v20 = "nil == (signalPackData)";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires signalPackData", location, 0x26u);
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