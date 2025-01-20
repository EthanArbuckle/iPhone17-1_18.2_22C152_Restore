@interface MapsSuggestionsSourceWrapper
- (BOOL)attachSource:(id)a3;
- (BOOL)detachSource:(id)a3;
- (MapsSuggestionsDaemonMemory)memory;
- (MapsSuggestionsSource)source;
- (MapsSuggestionsSourceWrapper)initWithMemory:(id)a3 locationUpdater:(id)a4;
- (NSString)description;
- (NSString)uniqueName;
- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4;
- (void)addMonitoredXPCConnection:(id)a3;
- (void)dealloc;
- (void)didLoseLocationPermission;
- (void)didUpdateLocation:(id)a3;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4 forXPCConnection:(id)a5;
- (void)feedbackForEntryData:(id)a3 action:(int64_t)a4 forXPCConnection:(id)a5;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4 forXPCConnection:(id)a5;
- (void)forceEarlyUpdateForType:(int64_t)a3 forXPCConnection:(id)a4 handler:(id)a5;
- (void)removeEntryData:(id)a3 behavior:(int64_t)a4 forXPCConnection:(id)a5 handler:(id)a6;
- (void)removeMonitoredXPCConnection:(id)a3;
- (void)setMemory:(id)a3;
@end

@implementation MapsSuggestionsSourceWrapper

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsSourceWrapper)initWithMemory:(id)a3 locationUpdater:(id)a4
{
  objc_initWeak(&location, a3);
  objc_initWeak(&v24, a4);
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsSourceWrapper;
  v6 = [(MapsSuggestionsSourceWrapper *)&v23 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MapsSuggestionsSourceWrapperQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    id v10 = objc_loadWeakRetained(&location);
    v11 = [v10 resourceDepot];
    [v11 setOneSourceDelegate:v6];

    objc_storeWeak((id *)&v6->_memory, v10);
    id v12 = objc_loadWeakRetained(&v24);
    id v13 = objc_storeWeak((id *)&v6->_locationUpdater, v12);

    v14 = [v13 startLocationUpdatesForDelegate:v6];
    uint64_t v15 = MapsSuggestionsBestLocation();
    bestLocation = v6->_bestLocation;
    v6->_bestLocation = (CLLocation *)v15;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    connections = v6->_connections;
    v6->_connections = v17;

    v19 = [v10 resourceDepot];
    uint64_t v20 = +[MapsSuggestionsCompositeSourceBuilder buildCompositeSourceFromResourceDepot:v19];
    source = v6->_source;
    v6->_source = (MapsSuggestionsSource *)v20;
  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  return v6;
}

- (void)dealloc
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_connections;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) invalidate];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsSourceWrapper;
  [(MapsSuggestionsSourceWrapper *)&v7 dealloc];
}

- (NSString)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%p> to %@ (%u connections)", objc_opt_class(), self, self->_source, -[NSMutableArray count](self->_connections, "count")];
  return (NSString *)v2;
}

- (void)addMonitoredXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "addMonitoredXPCConnection:%@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100048E74;
  v8[3] = &unk_100071498;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)removeMonitoredXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "removeMonitoredXPCConnection:%@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000490EC;
  v8[3] = &unk_100071668;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

- (void)forceEarlyUpdateForType:(int64_t)a3 forXPCConnection:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = a3;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "forceEarlyUpdateForType:%d forXPCConnection:%@", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000492B4;
  v14[3] = &unk_100072730;
  objc_copyWeak(v17, &buf);
  v17[1] = (id)a3;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak(&buf);
}

- (void)removeEntryData:(id)a3 behavior:(int64_t)a4 forXPCConnection:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 138412290;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "removeEntryData:behavior:forXPCConnection:%@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000495E4;
  block[3] = &unk_100072758;
  objc_copyWeak(v22, (id *)buf);
  id v19 = v11;
  id v20 = v10;
  v22[1] = (id)a4;
  id v21 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  dispatch_async(queue, block);

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

- (void)feedbackForEntryData:(id)a3 action:(int64_t)a4 forXPCConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 136315394;
    id v19 = "-[MapsSuggestionsSourceWrapper feedbackForEntryData:action:forXPCConnection:]";
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049940;
  v14[3] = &unk_100072780;
  objc_copyWeak(v17, (id *)buf);
  id v15 = v9;
  id v16 = v8;
  v17[1] = (id)a4;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4 forXPCConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 136315394;
    id v19 = "-[MapsSuggestionsSourceWrapper feedbackForMapItem:action:forXPCConnection:]";
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049C84;
  v14[3] = &unk_100072780;
  objc_copyWeak(v17, (id *)buf);
  id v15 = v9;
  id v16 = v8;
  v17[1] = (id)a4;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4 forXPCConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 136315394;
    id v19 = "-[MapsSuggestionsSourceWrapper feedbackForContact:action:forXPCConnection:]";
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049F94;
  v14[3] = &unk_100072780;
  objc_copyWeak(v17, (id *)buf);
  id v15 = v9;
  id v16 = v8;
  v17[1] = (id)a4;
  id v12 = v8;
  id v13 = v9;
  dispatch_async(queue, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (unint64_t)addOrUpdateSuggestionEntries:(id)a3 source:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_copyWeak(&to, (id *)&self->_memory);
  id v8 = [v6 copy];
  objc_initWeak(&location, self);
  queue = self->_queue;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10004A610;
  id v17 = &unk_100072810;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &to);
  id v10 = v8;
  id v18 = v10;
  id v11 = v7;
  id v19 = v11;
  dispatch_async(queue, &v14);
  id v12 = objc_msgSend(v10, "count", v14, v15, v16, v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  objc_destroyWeak(&to);
  return (unint64_t)v12;
}

- (BOOL)attachSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004A994;
    v9[3] = &unk_100071668;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(queue, v9);
  }
  else
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id buf = 136446978;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSourceWrapper.mm";
      __int16 v13 = 1024;
      int v14 = 379;
      __int16 v15 = 2082;
      id v16 = "-[MapsSuggestionsSourceWrapper attachSource:]";
      __int16 v17 = 2082;
      id v18 = "nil == (source)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a source", buf, 0x26u);
    }
  }
  return v5 != 0;
}

- (BOOL)detachSource:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004AB3C;
  v8[3] = &unk_100071668;
  id v9 = v4;
  id v10 = self;
  id v6 = v4;
  dispatch_sync(queue, v8);

  return 1;
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004AD48;
  block[3] = &unk_100071498;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)didLoseLocationPermission
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004AFAC;
  v4[3] = &unk_1000715B0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (MapsSuggestionsSource)source
{
  return self->_source;
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
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_bestLocation, 0);
  objc_destroyWeak((id *)&self->_locationUpdater);
  objc_destroyWeak((id *)&self->_connectionForLocations);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end