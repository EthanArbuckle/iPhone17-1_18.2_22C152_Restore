@interface MapsSuggestionsReservationsSource
+ (BOOL)isEnabled;
+ (unint64_t)disposition;
- (BOOL)canProduceEntriesOfType:(int64_t)a3;
- (BOOL)isSuspended;
- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5;
- (double)updateSuggestionEntriesWithHandler:(id)a3;
- (id)initFromResourceDepot:(id)a3 name:(id)a4;
- (void)setSuspended:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation MapsSuggestionsReservationsSource

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationsSource.m";
      __int16 v25 = 1024;
      int v26 = 587;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsReservationsSource initFromResourceDepot:name:]";
      __int16 v29 = 2082;
      v30 = "nil == (resourceDepot)";
      v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, v20, buf, 0x26u);
    }
LABEL_11:

    v18 = 0;
    goto LABEL_12;
  }
  v8 = [v6 oneSourceDelegate];

  if (!v8)
  {
    v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationsSource.m";
      __int16 v25 = 1024;
      int v26 = 588;
      __int16 v27 = 2082;
      v28 = "-[MapsSuggestionsReservationsSource initFromResourceDepot:name:]";
      __int16 v29 = 2082;
      v30 = "nil == (resourceDepot.oneSourceDelegate)";
      v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v9 = [v6 oneSourceDelegate];
  v22.receiver = self;
  v22.super_class = (Class)MapsSuggestionsReservationsSource;
  v10 = [(MapsSuggestionsReservationsSource *)&v22 initWithDelegate:v9 name:v7];

  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("MapsSuggestionsReservationsSourceQueue", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v10->_suspended = 1;
    uint64_t v14 = [v6 oneAppGuardian];
    guardian = v10->_guardian;
    v10->_guardian = (MapsSuggestionsAppGuardian *)v14;

    v16 = (MapsSuggestionsLimitedDictionary *)[objc_alloc((Class)MapsSuggestionsLimitedDictionary) initWithMaximumCapacity:GEOConfigGetInteger()];
    mapItemCache = v10->_mapItemCache;
    v10->_mapItemCache = v16;
  }
  self = v10;
  v18 = self;
LABEL_12:

  return v18;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

+ (unint64_t)disposition
{
  return 1;
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045B70;
  block[3] = &unk_100071C28;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)stop
{
  [(MapsSuggestionsAppGuardian *)self->_guardian unregisterAllBundleIDsForSource:self];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045C14;
  block[3] = &unk_100071C28;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045D34;
  block[3] = &unk_100071F60;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v11 = v6;
  dispatch_async(queue, block);
  GEOConfigGetDouble();
  double v8 = v7;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 8;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemCache, 0);
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end