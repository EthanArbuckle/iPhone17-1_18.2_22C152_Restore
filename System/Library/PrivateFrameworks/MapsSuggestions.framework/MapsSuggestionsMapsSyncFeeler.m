@interface MapsSuggestionsMapsSyncFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (BOOL)startUpdatingSignals;
- (BOOL)stopUpdatingSignals;
- (BOOL)updateSignals;
- (MapsSuggestionsMapsSyncFeeler)initWithDelegate:(id)a3 mapsSync:(id)a4;
- (int64_t)disposition;
- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4;
@end

@implementation MapsSuggestionsMapsSyncFeeler

- (MapsSuggestionsMapsSyncFeeler)initWithDelegate:(id)a3 mapsSync:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&location);
    v16.receiver = self;
    v16.super_class = (Class)MapsSuggestionsMapsSyncFeeler;
    v8 = [(MapsSuggestionsBaseFeeler *)&v16 initWithDelegate:v7];

    if (v8)
    {
      v9 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:3];
      signalPack = v8->_signalPack;
      v8->_signalPack = v9;

      objc_storeStrong((id *)&v8->_mapsSync, a4);
      v11 = (MapsSuggestionsQueue *)[objc_alloc((Class)MapsSuggestionsQueue) initSerialQueueWithName:@"MapsSuggestionsMapsSyncFeelerQueue"];
      queue = v8->_queue;
      v8->_queue = v11;
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsMapsSyncFeeler.m";
      __int16 v20 = 1024;
      int v21 = 35;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsMapsSyncFeeler initWithDelegate:mapsSync:]";
      __int16 v24 = 2082;
      v25 = "nil == (mapsSync)";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. mapsSync cannot be nil", buf, 0x26u);
    }

    v13 = 0;
  }

  objc_destroyWeak(&location);
  return v13;
}

- (void)mapsSync:(id)a3 didChangeForContentType:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003AC64;
  v8[3] = &unk_100072278;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  [(MapsSuggestionsQueue *)queue asyncBlock:v8];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return a3 == 32 || (unint64_t)(a3 - 29) < 2;
}

- (BOOL)startUpdatingSignals
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003AF58;
  v5[3] = &unk_1000717A0;
  objc_copyWeak(&v6, &location);
  [(MapsSuggestionsQueue *)queue asyncBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)stopUpdatingSignals
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003B168;
  v5[3] = &unk_1000717A0;
  objc_copyWeak(&v6, &location);
  [(MapsSuggestionsQueue *)queue asyncBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return 1;
}

- (BOOL)updateSignals
{
  return 1;
}

- (int64_t)disposition
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mapsSync, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
}

@end