@interface MapsSuggestionsDestinationGraphUpdater
- (BOOL)addPreloadableSource:(id)a3;
- (MapsSuggestionsDestinationGraphUpdater)initWithDestinationGraph:(id)a3;
- (NSString)uniqueName;
- (char)rebuildForPeriod:(id)a3 location:(id)a4 handler:(id)a5;
- (id).cxx_construct;
@end

@implementation MapsSuggestionsDestinationGraphUpdater

- (MapsSuggestionsDestinationGraphUpdater)initWithDestinationGraph:(id)a3
{
  objc_initWeak(&location, a3);
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsDestinationGraphUpdater;
  v4 = [(MapsSuggestionsDestinationGraphUpdater *)&v16 init];
  if (v4)
  {
    id v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_graph, v5);

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v14, @"MapsSuggestionsDestinationGraphUpdaterQueue", v6);
    dispatch_queue_t v7 = v14;
    dispatch_queue_t v14 = 0;
    innerQueue = v4->_queue._innerQueue;
    v4->_queue._innerQueue = (OS_dispatch_queue *)v7;

    v9 = v15;
    v15 = 0;
    name = v4->_queue._name;
    v4->_queue._name = v9;

    v11 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    sources = v4->_sources;
    v4->_sources = v11;
  }
  objc_destroyWeak(&location);
  return v4;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (BOOL)addPreloadableSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003B8B8;
    v7[3] = &unk_100071498;
    objc_copyWeak(&v9, (id *)location);
    id v8 = v4;
    dispatch_async((dispatch_queue_t)self->_queue._innerQueue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
      __int16 v11 = 1024;
      int v12 = 81;
      __int16 v13 = 2082;
      dispatch_queue_t v14 = "-[MapsSuggestionsDestinationGraphUpdater addPreloadableSource:]";
      __int16 v15 = 2082;
      objc_super v16 = "nil == (source)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a preloadable source", location, 0x26u);
    }
  }
  return v4 != 0;
}

- (char)rebuildForPeriod:(id)a3 location:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    objc_super v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 206;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsDestinationGraphUpdater rebuildForPeriod:location:handler:]";
      __int16 v27 = 2082;
      v28 = "nil == (handler)";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handler", buf, 0x26u);
    }
    goto LABEL_17;
  }
  if (!v8)
  {
    objc_super v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 207;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsDestinationGraphUpdater rebuildForPeriod:location:handler:]";
      __int16 v27 = 2082;
      v28 = "nil == (period)";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a period", buf, 0x26u);
    }
    goto LABEL_17;
  }
  if (!v9)
  {
    objc_super v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDestinationGraphUpdater.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 208;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsDestinationGraphUpdater rebuildForPeriod:location:handler:]";
      __int16 v27 = 2082;
      v28 = "nil == (location)";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a (current) location", buf, 0x26u);
    }
LABEL_17:

    char v15 = 0;
    goto LABEL_18;
  }
  GEOFindOrCreateLog();
  __int16 v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = [(MapsSuggestionsDestinationGraphUpdater *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "rebuildForPeriod";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  __int16 v13 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "rebuildForPeriod", "", buf, 2u);
  }

  dispatch_queue_t v14 = [v8 startDate];
  sub_10003D7E4(buf, v14, v9);

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10003D340;
  block[3] = &unk_100072318;
  objc_copyWeak(&v21, &location);
  id v22 = *(id *)buf;
  id v23 = *(id *)&buf[8];
  uint64_t v24 = *(void *)&buf[16];
  id v19 = v8;
  id v20 = v10;
  dispatch_async((dispatch_queue_t)self->_queue._innerQueue, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  char v15 = 1;
LABEL_18:

  return v15;
}

- (void).cxx_destruct
{
  sub_10003D8D0((uint64_t)&self->_momentsToDo);
  sub_10003E084((id *)self->_momentsDone.__table_.__p1_.__value_.__next_);
  value = self->_momentsDone.__table_.__bucket_list_.__ptr_.__value_;
  self->_momentsDone.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  objc_storeStrong((id *)&self->_sources, 0);

  objc_destroyWeak((id *)&self->_graph);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  return self;
}

@end