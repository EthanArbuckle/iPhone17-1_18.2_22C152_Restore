@interface MapsSuggestionsAppConnectionSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsAppConnectionSource)initWithPortrait:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)feedbackForEntry:(id)a3 action:(int64_t)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsAppConnectionSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsAppConnectionSource)initWithPortrait:(id)a3 delegate:(id)a4 guardian:(id)a5 name:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v21 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136446978;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
    __int16 v27 = 1024;
    int v28 = 54;
    __int16 v29 = 2082;
    v30 = "-[MapsSuggestionsAppConnectionSource initWithPortrait:delegate:guardian:name:]";
    __int16 v31 = 2082;
    v32 = "nil == (portrait)";
    v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Portrait";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, v22, buf, 0x26u);
    goto LABEL_14;
  }
  if (!v12)
  {
    v21 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136446978;
    v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
    __int16 v27 = 1024;
    int v28 = 55;
    __int16 v29 = 2082;
    v30 = "-[MapsSuggestionsAppConnectionSource initWithPortrait:delegate:guardian:name:]";
    __int16 v31 = 2082;
    v32 = "nil == (delegate)";
    v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a delegate";
    goto LABEL_13;
  }
  if (!v14)
  {
    v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
      __int16 v27 = 1024;
      int v28 = 56;
      __int16 v29 = 2082;
      v30 = "-[MapsSuggestionsAppConnectionSource initWithPortrait:delegate:guardian:name:]";
      __int16 v31 = 2082;
      v32 = "nil == (name)";
      v22 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name";
      goto LABEL_13;
    }
LABEL_14:

    v20 = 0;
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)MapsSuggestionsAppConnectionSource;
  v16 = [(MapsSuggestionsAppConnectionSource *)&v24 initWithDelegate:v12 name:v14];
  if (v16)
  {
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("MapsSuggestionsAppConnectionSourceQueue", v17);
    appConnectionUpdateQueue = v16->_appConnectionUpdateQueue;
    v16->_appConnectionUpdateQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_portrait, a3);
    objc_storeStrong((id *)&v16->_guardian, a5);
  }
  self = v16;
  v20 = self;
LABEL_15:

  return v20;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    int v17 = 136446978;
    dispatch_queue_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
    __int16 v19 = 1024;
    int v20 = 71;
    __int16 v21 = 2082;
    v22 = "-[MapsSuggestionsAppConnectionSource initFromResourceDepot:name:]";
    __int16 v23 = 2082;
    objc_super v24 = "nil == (resourceDepot)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v17, 0x26u);
    goto LABEL_12;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    id v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    int v17 = 136446978;
    dispatch_queue_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
    __int16 v19 = 1024;
    int v20 = 72;
    __int16 v21 = 2082;
    v22 = "-[MapsSuggestionsAppConnectionSource initFromResourceDepot:name:]";
    __int16 v23 = 2082;
    objc_super v24 = "nil == (resourceDepot.oneSourceDelegate)";
    v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  v9 = [v6 onePortrait];

  if (!v9)
  {
    id v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      int v17 = 136446978;
      dispatch_queue_t v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
      __int16 v19 = 1024;
      int v20 = 73;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsAppConnectionSource initFromResourceDepot:name:]";
      __int16 v23 = 2082;
      objc_super v24 = "nil == (resourceDepot.onePortrait)";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Portrait!";
      goto LABEL_11;
    }
LABEL_12:

    id v13 = 0;
    goto LABEL_13;
  }
  v10 = [v6 onePortrait];
  id v11 = [v6 oneSourceDelegate];
  id v12 = [v6 oneAppGuardian];
  self = [(MapsSuggestionsAppConnectionSource *)self initWithPortrait:v10 delegate:v11 guardian:v12 name:v7];

  id v13 = self;
LABEL_13:

  return v13;
}

- (void)start
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Start AppConnectionSource", v3, 2u);
  }
}

- (void)stop
{
  [(MapsSuggestionsAppGuardian *)self->_guardian unregisterAllBundleIDsForSource:self];
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Stop", v3, 2u);
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4 = a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(MapsSuggestionsAppConnectionSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    int v17 = v6;
    __int16 v18 = 2080;
    __int16 v19 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  appConnectionUpdateQueue = self->_appConnectionUpdateQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C950;
  v13[3] = &unk_100071F60;
  objc_copyWeak(&v15, (id *)buf);
  id v9 = v4;
  id v14 = v9;
  dispatch_async(appConnectionUpdateQueue, v13);
  GEOConfigGetDouble();
  double v11 = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

  return v11;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 12;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  if (!v6)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
      __int16 v24 = 1024;
      int v25 = 158;
      __int16 v26 = 2082;
      __int16 v27 = "-[MapsSuggestionsAppConnectionSource feedbackForEntry:action:]";
      __int16 v28 = 2082;
      __int16 v29 = "nil == (entry)";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Entry cannot be nil", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (+[MapsSuggestionsSiri isEnabled])
  {
    uint64_t v7 = [v6 stringForKey:@"MapsSuggestionsAppConnectionIdentifierKey"];
    if (v7)
    {
      v8 = v7;
      switch(a4)
      {
        case 0:
          id v15 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136446978;
            __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionSource.m";
            __int16 v24 = 1024;
            int v25 = 178;
            __int16 v26 = 2082;
            __int16 v27 = "-[MapsSuggestionsAppConnectionSource feedbackForEntry:action:]";
            __int16 v28 = 2082;
            __int16 v29 = "YES";
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. EntryEngagementNone not allowed", buf, 0x26u);
          }

          break;
        case 1:
          portrait = self->_portrait;
          uint64_t v19 = v7;
          double v10 = +[NSArray arrayWithObjects:&v19 count:1];
          double v11 = portrait;
          id v12 = 0;
          id v13 = 0;
          int v17 = v10;
          goto LABEL_18;
        case 2:
        case 3:
        case 4:
          id v9 = self->_portrait;
          uint64_t v21 = v7;
          double v10 = +[NSArray arrayWithObjects:&v21 count:1];
          double v11 = v9;
          id v12 = v10;
          id v13 = 0;
          goto LABEL_17;
        case 5:
          __int16 v18 = self->_portrait;
          uint64_t v20 = v7;
          double v10 = +[NSArray arrayWithObjects:&v20 count:1];
          double v11 = v18;
          id v12 = 0;
          id v13 = v10;
LABEL_17:
          int v17 = 0;
LABEL_18:
          [(MapsSuggestionsPortrait *)v11 sendFeedbackforClientID:@"maps" storeType:2 explicitlyEngagedStrings:v12 explicitlyRejectedStrings:v13 implicitlyEngagedStrings:v17 implicitlyRejectedStrings:0];

          break;
        case 6:
          break;
        default:
          [(MapsSuggestionsPortrait *)self->_portrait sendFeedbackforClientID:@"maps" storeType:2 explicitlyEngagedStrings:0 explicitlyRejectedStrings:0 implicitlyEngagedStrings:0 implicitlyRejectedStrings:0];
          break;
      }
    }
    else
    {
      id v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cannot pass feedback to Portrait. Feedback string was nil", buf, 2u);
      }

      v8 = 0;
    }
LABEL_19:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&self->_appConnectionUpdateQueue, 0);
  objc_storeStrong((id *)&self->_portrait, 0);
}

@end