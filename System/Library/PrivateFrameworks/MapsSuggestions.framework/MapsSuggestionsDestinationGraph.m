@interface MapsSuggestionsDestinationGraph
- (BOOL)addBreadcrumb:(id)a3;
- (BOOL)addETA:(id)a3 from:(id)a4 to:(id)a5;
- (BOOL)addETA:(id)a3 to:(id)a4;
- (BOOL)addEntry:(id)a3;
- (BOOL)rebalance;
- (MapsSuggestionsDestinationGraph)init;
- (id).cxx_construct;
- (id)destinationAtEntry:(id)a3;
- (id)destinationAtLocation:(id)a3;
- (id)destinationAtMapItem:(id)a3;
- (id)destinationsAtTime:(id)a3;
- (id)jsonWithFormatting:(BOOL)a3;
- (id)nameForJSON;
- (id)objectForJSON;
- (id)predictedEntriesWithinPeriod:(id)a3;
- (id)testing_allDestinationLinks;
- (id)testing_allDestinations;
@end

@implementation MapsSuggestionsDestinationGraph

- (MapsSuggestionsDestinationGraph)init
{
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsDestinationGraph;
  v2 = [(MapsSuggestionsDestinationGraph *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    destinations = v2->_destinations;
    v2->_destinations = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    destinationLinks = v2->_destinationLinks;
    v2->_destinationLinks = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v13, @"MapsSuggestionsDestinationGraphQueue", v7);
    dispatch_queue_t v8 = v13;
    dispatch_queue_t v13 = 0;
    innerQueue = v2->_queue._innerQueue;
    v2->_queue._innerQueue = (OS_dispatch_queue *)v8;

    v10 = v14;
    v14 = 0;
    name = v2->_queue._name;
    v2->_queue._name = v10;
  }
  return v2;
}

- (BOOL)addEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000107D8;
    v7[3] = &unk_100071498;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v11 = 1024;
      int v12 = 73;
      __int16 v13 = 2082;
      v14 = "-[MapsSuggestionsDestinationGraph addEntry:]";
      __int16 v15 = 2082;
      v16 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", location, 0x26u);
    }
  }
  return v4 != 0;
}

- (id)destinationAtEntry:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100011038;
    v9[3] = &unk_1000714C0;
    v9[4] = self;
    id v10 = v4;
    v6 = sub_100010F2C((NSObject **)&self->_queue, v9);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v13 = 1024;
      int v14 = 99;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsDestinationGraph destinationAtEntry:]";
      __int16 v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)destinationAtMapItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 coordinate];
    id v8 = [objc_alloc((Class)CLLocation) initWithLatitude:v6 longitude:v7];
    id v9 = [(MapsSuggestionsDestinationGraph *)self destinationAtLocation:v8];
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136446978;
      __int16 v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v14 = 1024;
      int v15 = 116;
      __int16 v16 = 2082;
      __int16 v17 = "-[MapsSuggestionsDestinationGraph destinationAtMapItem:]";
      __int16 v18 = 2082;
      v19 = "nil == (mapItem)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a mapItem", (uint8_t *)&v12, 0x26u);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)destinationAtLocation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000114D4;
    v9[3] = &unk_1000714C0;
    v9[4] = self;
    id v10 = v4;
    double v6 = sub_100010F2C((NSObject **)&self->_queue, v9);
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v13 = 1024;
      int v14 = 124;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsDestinationGraph destinationAtLocation:]";
      __int16 v17 = 2082;
      __int16 v18 = "nil == (location)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a location", buf, 0x26u);
    }

    double v6 = 0;
  }

  return v6;
}

- (id)destinationsAtTime:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000118DC;
    v9[3] = &unk_1000714E8;
    v9[4] = self;
    id v10 = v4;
    double v6 = sub_1000117D0((NSObject **)&self->_queue, v9);
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v13 = 1024;
      int v14 = 141;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsDestinationGraph destinationsAtTime:]";
      __int16 v17 = 2082;
      __int16 v18 = "nil == (time)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time", buf, 0x26u);
    }

    double v6 = 0;
  }

  return v6;
}

- (id)predictedEntriesWithinPeriod:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100011C00;
    v9[3] = &unk_1000714E8;
    v9[4] = self;
    id v10 = v4;
    double v6 = sub_1000117D0((NSObject **)&self->_queue, v9);
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      int v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v13 = 1024;
      int v14 = 158;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsDestinationGraph predictedEntriesWithinPeriod:]";
      __int16 v17 = 2082;
      __int16 v18 = "nil == (period)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period", buf, 0x26u);
    }

    double v6 = 0;
  }

  return v6;
}

- (BOOL)addETA:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v17 = 1024;
      int v18 = 186;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsDestinationGraph addETA:to:]";
      __int16 v21 = 2082;
      v22 = "nil == (eta)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA", location, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v17 = 1024;
      int v18 = 187;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsDestinationGraph addETA:to:]";
      __int16 v21 = 2082;
      v22 = "nil == (destination)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a destination", location, 0x26u);
    }
LABEL_9:

    BOOL v9 = 0;
    goto LABEL_10;
  }
  objc_initWeak((id *)location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012250;
  block[3] = &unk_100071510;
  objc_copyWeak(&v15, (id *)location);
  id v13 = v8;
  id v14 = v6;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)addETA:(id)a3 from:(id)a4 to:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = v10;
  if (!v8)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v21 = 1024;
      int v22 = 211;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsDestinationGraph addETA:from:to:]";
      __int16 v25 = 2082;
      v26 = "nil == (eta)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an ETA", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v9)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v21 = 1024;
      int v22 = 212;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsDestinationGraph addETA:from:to:]";
      __int16 v25 = 2082;
      v26 = "nil == (from)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a from-destination", location, 0x26u);
    }
    goto LABEL_13;
  }
  if (!v10)
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v21 = 1024;
      int v22 = 213;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsDestinationGraph addETA:from:to:]";
      __int16 v25 = 2082;
      v26 = "nil == (to)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a to-destination", location, 0x26u);
    }
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_14;
  }
  objc_initWeak((id *)location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100012824;
  v15[3] = &unk_100071538;
  objc_copyWeak(&v19, (id *)location);
  id v16 = v11;
  id v17 = v9;
  id v18 = v8;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)location);
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

- (BOOL)addBreadcrumb:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012C24;
    v7[3] = &unk_100071498;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraph.mm";
      __int16 v11 = 1024;
      int v12 = 233;
      __int16 v13 = 2082;
      id v14 = "-[MapsSuggestionsDestinationGraph addBreadcrumb:]";
      __int16 v15 = 2082;
      id v16 = "nil == (breadcrumb)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a breadcrumb", location, 0x26u);
    }
  }
  return v4 != 0;
}

- (BOOL)rebalance
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000135D0;
  v4[3] = &unk_1000715B0;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return 1;
}

- (id)jsonWithFormatting:(BOOL)a3
{
  return (id)_NSStringFromMapsSuggestionsJSON(self, a3);
}

- (id)nameForJSON
{
  return @"graph";
}

- (id)objectForJSON
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013B58;
  v8[3] = &unk_1000715D8;
  v8[4] = self;
  v3 = v8;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_100014258;
  id v16 = sub_100014268;
  id v17 = 0;
  innerQueue = self->_queue._innerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014318;
  block[3] = &unk_100071690;
  id v10 = v3;
  __int16 v11 = &v12;
  id v5 = v3;
  dispatch_sync(innerQueue, block);
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)testing_allDestinations
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013EB0;
  v4[3] = &unk_100071600;
  void v4[4] = self;
  v2 = sub_1000117D0((NSObject **)&self->_queue, v4);
  return v2;
}

- (id)testing_allDestinationLinks
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013F68;
  v4[3] = &unk_100071600;
  void v4[4] = self;
  v2 = sub_1000117D0((NSObject **)&self->_queue, v4);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationLinks, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end