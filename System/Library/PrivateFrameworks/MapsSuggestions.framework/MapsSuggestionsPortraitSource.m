@interface MapsSuggestionsPortraitSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (MapsSuggestionsPortraitSource)initWithPortrait:(id)a3 delegate:(id)a4 name:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)feedbackForContact:(id)a3 action:(int64_t)a4;
- (void)feedbackForEntry:(id)a3 action:(int64_t)a4;
- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsPortraitSource

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (MapsSuggestionsPortraitSource)initWithPortrait:(id)a3 delegate:(id)a4 name:(id)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MapsSuggestionsPortraitSource;
  v10 = [(MapsSuggestionsPortraitSource *)&v15 initWithDelegate:a4 name:a5];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MapsSuggestionsPortraitSourceQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_portrait, a3);
  }

  return v10;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitSource.m";
    __int16 v18 = 1024;
    int v19 = 66;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsPortraitSource initFromResourceDepot:name:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v16, 0x26u);
    goto LABEL_12;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v13 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    int v16 = 136446978;
    v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitSource.m";
    __int16 v18 = 1024;
    int v19 = 67;
    __int16 v20 = 2082;
    v21 = "-[MapsSuggestionsPortraitSource initFromResourceDepot:name:]";
    __int16 v22 = 2082;
    v23 = "nil == (resourceDepot.oneSourceDelegate)";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
    goto LABEL_11;
  }
  id v9 = [v6 onePortrait];

  if (!v9)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsPortraitSource.m";
      __int16 v18 = 1024;
      int v19 = 68;
      __int16 v20 = 2082;
      v21 = "-[MapsSuggestionsPortraitSource initFromResourceDepot:name:]";
      __int16 v22 = 2082;
      v23 = "nil == (resourceDepot.onePortrait)";
      v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one Portrait!";
      goto LABEL_11;
    }
LABEL_12:

    dispatch_queue_t v12 = 0;
    goto LABEL_13;
  }
  v10 = [v6 onePortrait];
  v11 = [v6 oneSourceDelegate];
  self = [(MapsSuggestionsPortraitSource *)self initWithPortrait:v10 delegate:v11 name:v7];

  dispatch_queue_t v12 = self;
LABEL_13:

  return v12;
}

- (void)start
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "start", v3, 2u);
  }
}

- (void)stop
{
  v2 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "stop", v3, 2u);
  }
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(MapsSuggestionsPortraitSource *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    __int16 v24 = 2080;
    v25 = "updateSuggestionEntriesWithHandler";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v7 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
  }

  v8 = MapsSuggestionsCurrentBestLocation();
  if (v8)
  {
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001D6F0;
    v17[3] = &unk_100071960;
    objc_copyWeak(&v21, (id *)buf);
    id v18 = v8;
    int v19 = self;
    __int16 v20 = v4;
    dispatch_async(queue, v17);
    GEOConfigGetDouble();
    double v11 = v10;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v4) {
      v4[2](v4);
    }
    dispatch_queue_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [(MapsSuggestionsPortraitSource *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v23 = v13;
      __int16 v24 = 2080;
      v25 = "updateSuggestionEntriesWithHandler";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s FAIL", buf, 0x16u);
    }
    v14 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "updateSuggestionEntriesWithHandler", "", buf, 2u);
    }

    GEOConfigGetDouble();
    double v11 = v15;
  }

  return v11;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 17;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)feedbackForEntry:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  if (+[MapsSuggestionsSiri isEnabled])
  {
    if ([v6 containsKey:@"MapsSuggestionsPortraitClientIdentifier"])
    {
      id v7 = [v6 stringForKey:@"MapsSuggestionsPortraitClientIdentifier"];
    }
    else
    {
      id v7 = @"maps";
    }
    v8 = [v6 undecoratedTitle];
    if ([v6 containsKey:@"MapsSuggestionsEntryTitleNameKey"])
    {
      uint64_t v9 = [v6 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];

      v8 = (void *)v9;
    }
    if (v8)
    {
      switch(a4)
      {
        case 0:
          v17 = GEOFindOrCreateLog();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_WORD *)__int16 v22 = 0;
          id v18 = "EntryEngagementNone not allowed";
          goto LABEL_12;
        case 1:
          portrait = self->_portrait;
          v23 = v8;
          id v11 = v8;
          dispatch_queue_t v12 = +[NSArray arrayWithObjects:&v23 count:1];
          v13 = portrait;
          v14 = v7;
          double v15 = 0;
          int v16 = 0;
          __int16 v20 = v12;
          goto LABEL_20;
        case 2:
        case 3:
        case 4:
          double v10 = self->_portrait;
          v25 = v8;
          id v11 = v8;
          dispatch_queue_t v12 = +[NSArray arrayWithObjects:&v25 count:1];
          v13 = v10;
          v14 = v7;
          double v15 = v12;
          int v16 = 0;
          goto LABEL_19;
        case 5:
          id v21 = self->_portrait;
          __int16 v24 = v8;
          id v11 = v8;
          dispatch_queue_t v12 = +[NSArray arrayWithObjects:&v24 count:1];
          v13 = v21;
          v14 = v7;
          double v15 = 0;
          int v16 = v12;
LABEL_19:
          __int16 v20 = 0;
LABEL_20:
          [(MapsSuggestionsPortrait *)v13 sendFeedbackforClientID:v14 storeType:1 explicitlyEngagedStrings:v15 explicitlyRejectedStrings:v16 implicitlyEngagedStrings:v20 implicitlyRejectedStrings:0];

          break;
        case 6:
          break;
        default:
          [(MapsSuggestionsPortrait *)self->_portrait sendFeedbackforClientID:v7 storeType:1 explicitlyEngagedStrings:0 explicitlyRejectedStrings:0 implicitlyEngagedStrings:0 implicitlyRejectedStrings:0];
          break;
      }
    }
    else
    {
      v17 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v22 = 0;
        id v18 = "Cannot pass feedback to Portrait. Feedback string was nil";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, v22, 2u);
      }
LABEL_13:
    }
  }
}

- (void)feedbackForMapItem:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = +[MapsSuggestionsSiri isEnabled];
  if ((unint64_t)(a4 - 1) <= 3 && v7)
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    uint64_t v9 = [v6 name];

    if (v9)
    {
      double v10 = [v6 name];
      [v8 addObject:v10];
    }
    id v11 = [v6 shortAddress];

    if (v11)
    {
      dispatch_queue_t v12 = [v6 shortAddress];
      [v8 addObject:v12];
    }
    if ([v8 count])
    {
      [(MapsSuggestionsPortrait *)self->_portrait sendFeedbackforClientID:@"mapssearch" storeType:0 explicitlyEngagedStrings:0 explicitlyRejectedStrings:0 implicitlyEngagedStrings:v8 implicitlyRejectedStrings:0];
    }
    else
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "No feedback to send", v14, 2u);
      }
    }
  }
}

- (void)feedbackForContact:(id)a3 action:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = +[MapsSuggestionsSiri isEnabled];
  if ((unint64_t)(a4 - 1) <= 3 && v7)
  {
    portrait = self->_portrait;
    uint64_t v9 = [v6 identifier];
    id v11 = v9;
    double v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(MapsSuggestionsPortrait *)portrait sendFeedbackforClientID:@"mapssearch" storeType:0 explicitlyEngagedStrings:0 explicitlyRejectedStrings:0 implicitlyEngagedStrings:v10 implicitlyRejectedStrings:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_portrait, 0);
}

@end