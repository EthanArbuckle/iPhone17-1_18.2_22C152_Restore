@interface MapsSuggestionsSourcesXPCPeer
- (MapsSuggestionsSourcesXPCPeer)initWithXPCConnection:(id)a3 sourceWrapper:(id)a4 graph:(id)a5;
- (NSString)description;
- (NSXPCConnection)connection;
- (void)_stopMonitoring;
- (void)dealloc;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4;
- (void)feedbackForEntryData:(id)a3 action:(int64_t)a4;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4;
- (void)forceEarlyUpdateForType:(int64_t)a3 handler:(id)a4;
- (void)removeEntryData:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (void)startMonitoringWithHandler:(id)a3;
- (void)stopMonitoringWithHandler:(id)a3;
- (void)updateGraphWithHandler:(id)a3;
@end

@implementation MapsSuggestionsSourcesXPCPeer

- (MapsSuggestionsSourcesXPCPeer)initWithXPCConnection:(id)a3 sourceWrapper:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsSourcesXPCPeer;
  v12 = [(MapsSuggestionsSourcesXPCPeer *)&v20 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("MapsSuggestionsSourcesXPCPeerQueue", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v12->_wrapper, a4);
    objc_storeStrong((id *)&v12->_graph, a5);
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      connection = v12->_connection;
      *(_DWORD *)buf = 138412290;
      v22 = connection;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} created.", buf, 0xCu);
    }

    v18 = v12;
  }

  return v12;
}

- (void)startMonitoringWithHandler:(id)a3
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
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received start...", buf, 0xCu);
    }

    id v8 = [v4 copy];
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100030F9C;
    v11[3] = &unk_100071F60;
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
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v16 = 1024;
      int v17 = 126;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsSourcesXPCPeer startMonitoringWithHandler:]";
      __int16 v20 = 2082;
      v21 = "NULL == handler";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
  }
}

- (void)stopMonitoringWithHandler:(id)a3
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
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received stop...", buf, 0xCu);
    }

    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100031344;
    v9[3] = &unk_100071F88;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(queue, v9);
    v6 = v10;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
    __int16 v13 = 1024;
    int v14 = 143;
    __int16 v15 = 2082;
    __int16 v16 = "-[MapsSuggestionsSourcesXPCPeer stopMonitoringWithHandler:]";
    __int16 v17 = 2082;
    __int16 v18 = "NULL == handler";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
  }
}

- (void)forceEarlyUpdateForType:(int64_t)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = GEOFindOrCreateLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412546;
      __int16 v15 = (const char *)connection;
      __int16 v16 = 1024;
      int v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received forceEarlyUpdateForType:%d...", buf, 0x12u);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031584;
    block[3] = &unk_100071C00;
    objc_copyWeak(v13, (id *)buf);
    v13[1] = (id)a3;
    id v12 = v6;
    dispatch_async(queue, block);

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v16 = 1024;
      int v17 = 157;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsSourcesXPCPeer forceEarlyUpdateForType:handler:]";
      __int16 v20 = 2082;
      v21 = "NULL == handler";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
  }
}

- (void)removeEntryData:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412290;
      v19 = (const char *)connection;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received removeEntryData...", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003190C;
    v14[3] = &unk_100071FB0;
    objc_copyWeak(v17, (id *)buf);
    id v15 = v8;
    v17[1] = (id)a4;
    id v16 = v9;
    dispatch_async(queue, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v20 = 1024;
      int v21 = 173;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsSourcesXPCPeer removeEntryData:behavior:handler:]";
      __int16 v24 = 2082;
      v25 = "NULL == block";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion block", buf, 0x26u);
    }
  }
}

- (void)feedbackForEntryData:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    id v15 = connection;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received feedbackForEntryData...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031BE8;
  block[3] = &unk_100071818;
  objc_copyWeak(v13, (id *)buf);
  id v12 = v6;
  v13[1] = (id)a4;
  id v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    id v15 = connection;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received feedbackForMapItem...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031EC4;
  block[3] = &unk_100071818;
  objc_copyWeak(v13, (id *)buf);
  id v12 = v6;
  v13[1] = (id)a4;
  id v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    id v15 = connection;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received feedbackForContact...", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000321A0;
  block[3] = &unk_100071818;
  objc_copyWeak(v13, (id *)buf);
  id v12 = v6;
  v13[1] = (id)a4;
  id v10 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} stopping...", (uint8_t *)&v9, 0xCu);
  }

  [(MapsSuggestionsSourceWrapper *)self->_wrapper removeMonitoredXPCConnection:self->_connection];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = self->_connection;
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} stopped.", (uint8_t *)&v9, 0xCu);
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

- (void)updateGraphWithHandler:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412290;
      __int16 v13 = (const char *)connection;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} Received updateGraph", buf, 0xCu);
    }

    if (MapsSuggestionsIsDestinationGraphEnabled())
    {
      objc_initWeak((id *)buf, self);
      queue = self->_queue;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100032670;
      v9[3] = &unk_100071F60;
      objc_copyWeak(&v11, (id *)buf);
      id v10 = v4;
      dispatch_async(queue, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/destinationd/MapsSuggestionsSourcesServer.m";
      __int16 v14 = 1024;
      int v15 = 252;
      __int16 v16 = 2082;
      int v17 = "-[MapsSuggestionsSourcesXPCPeer updateGraphWithHandler:]";
      __int16 v18 = 2082;
      v19 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler", buf, 0x26u);
    }
  }
}

- (void)dealloc
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    *(_DWORD *)buf = 138412290;
    int v9 = connection;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} destroying...", buf, 0xCu);
  }

  [(MapsSuggestionsSourcesXPCPeer *)self _stopMonitoring];
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = self->_connection;
    *(_DWORD *)buf = 138412290;
    int v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SourcesXPCPeer{%@} destroyed.", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsSourcesXPCPeer;
  [(MapsSuggestionsSourcesXPCPeer *)&v7 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MapsSuggestionsSourcesXPCPeer *)self connection];
  id v6 = [v5 debugDescription];
  id v7 = [v3 initWithFormat:@"%@<%p> from %@ to %@", v4, self, v6, self->_wrapper];

  return (NSString *)v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end