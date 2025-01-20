@interface MapsSuggestionsSignalPipeline
- (BOOL)addFeeler:(id)a3;
- (BOOL)feeler:(id)a3 sendsSignalPack:(id)a4;
- (BOOL)removeFeeler:(id)a3;
- (BOOL)setAlgorithm:(id)a3;
- (BOOL)start;
- (BOOL)stop;
- (MapsSuggestionsNetworkRequester)networkRequester;
- (MapsSuggestionsSignalPipeline)initWithNetworkRequester:(id)a3;
- (MapsSuggestionsSignalPipelineUpdater)updaterDelegate;
- (NSString)uniqueName;
- (char)guessTransportModesForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (char)guessTransportModesForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5;
- (id).cxx_construct;
- (id)mergedCommonSignalPack;
- (id)mergedSignalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4;
- (id)mergedSignalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4;
- (void)dealloc;
- (void)resetData;
- (void)setNetworkRequester:(id)a3;
- (void)setUpdaterDelegate:(id)a3;
@end

@implementation MapsSuggestionsSignalPipeline

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (MapsSuggestionsSignalPipeline)initWithNetworkRequester:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsSignalPipeline;
  v6 = [(MapsSuggestionsSignalPipeline *)&v23 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v21, @"MapsSuggestionsSignalPipeline", v7);
    dispatch_queue_t v8 = v21;
    dispatch_queue_t v21 = 0;
    innerQueue = v6->_queue._innerQueue;
    v6->_queue._innerQueue = (OS_dispatch_queue *)v8;

    v10 = v22;
    v22 = 0;
    name = v6->_queue._name;
    v6->_queue._name = v10;

    v12 = (MapsSuggestionsMutableSignalPack *)objc_alloc_init((Class)MapsSuggestionsMutableSignalPack);
    generalSignalPack = v6->_generalSignalPack;
    v6->_generalSignalPack = v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pollingFeelers = v6->_pollingFeelers;
    v6->_pollingFeelers = v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    streamingFeelers = v6->_streamingFeelers;
    v6->_streamingFeelers = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    nextPollingTimes = v6->_nextPollingTimes;
    v6->_nextPollingTimes = v18;

    objc_storeStrong((id *)&v6->_networkRequester, a3);
  }

  return v6;
}

- (void)dealloc
{
  sub_100016094((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsSignalPipeline;
  [(MapsSuggestionsSignalPipeline *)&v3 dealloc];
}

- (BOOL)addFeeler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100016440;
    v9[3] = &unk_1000716B8;
    v9[4] = self;
    id v10 = v4;
    char v6 = sub_100016378((NSObject **)&self->_queue, v9);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v13 = 1024;
      int v14 = 106;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPipeline addFeeler:]";
      __int16 v17 = 2082;
      v18 = "nil == (feeler)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feeler", buf, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)removeFeeler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000167C0;
    v9[3] = &unk_1000716B8;
    v9[4] = self;
    id v10 = v4;
    char v6 = sub_100016378((NSObject **)&self->_queue, v9);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v13 = 1024;
      int v14 = 115;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPipeline removeFeeler:]";
      __int16 v17 = 2082;
      v18 = "nil == (feeler)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feeler", buf, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)setAlgorithm:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100016A94;
    v9[3] = &unk_1000716B8;
    v9[4] = self;
    id v10 = v4;
    char v6 = sub_100016378((NSObject **)&self->_queue, v9);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v13 = 1024;
      int v14 = 124;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsSignalPipeline setAlgorithm:]";
      __int16 v17 = 2082;
      v18 = "nil == (algorithm)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal algorithm", buf, 0x26u);
    }

    char v6 = 0;
  }

  return v6;
}

- (BOOL)start
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016B60;
  v4[3] = &unk_1000715B0;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)stop
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016DFC;
  v4[3] = &unk_1000715B0;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return 1;
}

- (void)resetData
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016FC4;
  v3[3] = &unk_1000715B0;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)mergedCommonSignalPack
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001727C;
  v4[3] = &unk_1000716E0;
  void v4[4] = self;
  v2 = sub_100017170((NSObject **)&self->_queue, v4);
  return v2;
}

- (id)mergedSignalPackForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v7 = a3;
  dispatch_queue_t v8 = v7;
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001745C;
    v12[3] = &unk_100071708;
    v12[4] = self;
    id v13 = v7;
    CLLocationDegrees v14 = latitude;
    CLLocationDegrees v15 = longitude;
    v9 = sub_100017170((NSObject **)&self->_queue, v12);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v18 = 1024;
      int v19 = 172;
      __int16 v20 = 2082;
      dispatch_queue_t v21 = "-[MapsSuggestionsSignalPipeline mergedSignalPackForDestinationEntry:originCoordinate:]";
      __int16 v22 = 2082;
      objc_super v23 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)mergedSignalPackForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v7 = a3;
  dispatch_queue_t v8 = v7;
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000176BC;
    v12[3] = &unk_100071708;
    v12[4] = self;
    id v13 = v7;
    CLLocationDegrees v14 = latitude;
    CLLocationDegrees v15 = longitude;
    v9 = sub_100017170((NSObject **)&self->_queue, v12);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v18 = 1024;
      int v19 = 183;
      __int16 v20 = 2082;
      dispatch_queue_t v21 = "-[MapsSuggestionsSignalPipeline mergedSignalPackForDestinationMapItem:originCoordinate:]";
      __int16 v22 = 2082;
      objc_super v23 = "nil == (mapItem)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an mapItem", buf, 0x26u);
    }

    v9 = 0;
  }

  return v9;
}

- (char)guessTransportModesForDestinationMapItem:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!self->_algorithm)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      dispatch_queue_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v22 = 1024;
      int v23 = 195;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsSignalPipeline guessTransportModesForDestinationMapItem:originCoordinate:handler:]";
      __int16 v26 = 2082;
      v27 = "nil == (_algorithm)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal algorithm to be set", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      dispatch_queue_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v22 = 1024;
      int v23 = 196;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsSignalPipeline guessTransportModesForDestinationMapItem:originCoordinate:handler:]";
      __int16 v26 = 2082;
      v27 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      dispatch_queue_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v22 = 1024;
      int v23 = 197;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsSignalPipeline guessTransportModesForDestinationMapItem:originCoordinate:handler:]";
      __int16 v26 = 2082;
      v27 = "nil == (mapItem)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", buf, 0x26u);
    }
LABEL_13:

    char v12 = 0;
    goto LABEL_14;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100017B70;
  v15[3] = &unk_100071730;
  v15[4] = self;
  id v16 = v9;
  CLLocationDegrees v18 = latitude;
  CLLocationDegrees v19 = longitude;
  id v17 = v11;
  char v12 = sub_100017AA8((NSObject **)&self->_queue, v15);

LABEL_14:
  return v12;
}

- (char)guessTransportModesForDestinationEntry:(id)a3 originCoordinate:(CLLocationCoordinate2D)a4 handler:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!self->_algorithm)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      dispatch_queue_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v22 = 1024;
      int v23 = 210;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsSignalPipeline guessTransportModesForDestinationEntry:originCoordinate:handler:]";
      __int16 v26 = 2082;
      v27 = "nil == (_algorithm)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal algorithm to be set", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      dispatch_queue_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v22 = 1024;
      int v23 = 211;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsSignalPipeline guessTransportModesForDestinationEntry:originCoordinate:handler:]";
      __int16 v26 = 2082;
      v27 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      dispatch_queue_t v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v22 = 1024;
      int v23 = 212;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsSignalPipeline guessTransportModesForDestinationEntry:originCoordinate:handler:]";
      __int16 v26 = 2082;
      v27 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }
LABEL_13:

    char v12 = 0;
    goto LABEL_14;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000182C8;
  v15[3] = &unk_100071730;
  v15[4] = self;
  id v16 = v9;
  CLLocationDegrees v18 = latitude;
  CLLocationDegrees v19 = longitude;
  id v17 = v11;
  char v12 = sub_100017AA8((NSObject **)&self->_queue, v15);

LABEL_14:
  return v12;
}

- (BOOL)feeler:(id)a3 sendsSignalPack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak((id *)location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000188C8;
    block[3] = &unk_100071510;
    objc_copyWeak(&v13, (id *)location);
    id v11 = v7;
    char v12 = self;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)location);
  }
  else
  {
    dispatch_queue_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPipeline.mm";
      __int16 v15 = 1024;
      int v16 = 240;
      __int16 v17 = 2082;
      CLLocationDegrees v18 = "-[MapsSuggestionsSignalPipeline feeler:sendsSignalPack:]";
      __int16 v19 = 2082;
      __int16 v20 = "nil == (feeler)";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a feeler", location, 0x26u);
    }
  }
  return v6 != 0;
}

- (MapsSuggestionsNetworkRequester)networkRequester
{
  return self->_networkRequester;
}

- (void)setNetworkRequester:(id)a3
{
}

- (MapsSuggestionsSignalPipelineUpdater)updaterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updaterDelegate);
  return (MapsSuggestionsSignalPipelineUpdater *)WeakRetained;
}

- (void)setUpdaterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updaterDelegate);
  objc_storeStrong((id *)&self->_networkRequester, 0);
  objc_storeStrong((id *)&self->_nextPollingTimes, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_streamingFeelers, 0);
  objc_storeStrong((id *)&self->_pollingFeelers, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
  objc_storeStrong((id *)&self->_generalSignalPack, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end