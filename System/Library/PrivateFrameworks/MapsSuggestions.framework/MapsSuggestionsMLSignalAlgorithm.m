@interface MapsSuggestionsMLSignalAlgorithm
- (MapsSuggestionsMLSignalAlgorithm)init;
- (NSString)uniqueName;
- (char)transportModesForSignalPack:(id)a3 handler:(id)a4;
- (id).cxx_construct;
@end

@implementation MapsSuggestionsMLSignalAlgorithm

- (MapsSuggestionsMLSignalAlgorithm)init
{
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsMLSignalAlgorithm;
  v2 = [(MapsSuggestionsMLSignalAlgorithm *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100014064(&v10, @"MapsSuggestionsMLSignalAlgorithmQueue", v3);
    dispatch_queue_t v4 = v10;
    dispatch_queue_t v10 = 0;
    innerQueue = v2->_queue._innerQueue;
    v2->_queue._innerQueue = (OS_dispatch_queue *)v4;

    v6 = v11;
    v11 = 0;
    name = v2->_queue._name;
    v2->_queue._name = v6;

    model = v2->_model;
    v2->_model = 0;
  }
  return v2;
}

- (char)transportModesForSignalPack:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMLSignalAlgorithm.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 120;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsMLSignalAlgorithm transportModesForSignalPack:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (handler)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a completion handler";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v17, buf, 0x26u);
    }
LABEL_14:
    char v18 = 0;
    goto LABEL_18;
  }
  if (!v6)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMLSignalAlgorithm.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 121;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsMLSignalAlgorithm transportModesForSignalPack:handler:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (signalPack)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a signal pack";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  GEOFindOrCreateLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [(MapsSuggestionsMLSignalAlgorithm *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "transportModesForSignalPack_ML";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  dispatch_queue_t v10 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "transportModesForSignalPack_ML", "", buf, 2u);
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001F268;
  v20[3] = &unk_100071A30;
  v21 = v6;
  id v22 = v7;
  v11 = self;
  objc_super v12 = v20;
  if (v11)
  {
    v13 = v11;
    innerQueue = v11->_queue._innerQueue;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10001FC40;
    *(void *)&buf[24] = &unk_100071910;
    *(void *)&buf[32] = v13;
    v24 = v12;
    dispatch_async(innerQueue, buf);

    v15 = *(NSObject **)&buf[32];
  }
  else
  {
    v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsQueue.hpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 208;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "void MSg::Queue::async(S *, void (^__strong)(S *)) const [S = MapsSuggestionsMLSignalAlgorithm]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "nil == (callerSelf)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires self", buf, 0x26u);
    }
  }

  char v18 = 1;
  v16 = v21;
LABEL_18:

  return v18;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);

  innerQueue = self->_queue._innerQueue;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end