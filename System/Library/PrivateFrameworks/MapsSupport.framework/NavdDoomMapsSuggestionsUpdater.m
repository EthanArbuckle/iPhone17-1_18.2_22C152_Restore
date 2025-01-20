@interface NavdDoomMapsSuggestionsUpdater
- (BOOL)updateDestinationsForDuration:(double)a3 completionHandler:(id)a4;
- (NSString)uniqueName;
- (NavdDoomMapsSuggestionsUpdater)init;
- (NavdDoomMapsSuggestionsUpdater)initWithAllEntryTypes:(BOOL)a3 checkEntryWeight:(BOOL)a4 keepRunning:(BOOL)a5;
- (NavdDoomMapsSuggestionsUpdater)initWithLocationUpdater:(id)a3;
- (id)currentDestinations;
- (void)_done;
- (void)_refreshEntries;
- (void)dealloc;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
- (void)stopUpdating;
@end

@implementation NavdDoomMapsSuggestionsUpdater

- (NavdDoomMapsSuggestionsUpdater)initWithLocationUpdater:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NavdDoomMapsSuggestionsUpdater;
  id v5 = [(NavdDoomMapsSuggestionsUpdater *)&v17 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("NavdDoomMapsSuggestionsUpdaterQueue", v6);
    v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    objc_storeWeak((id *)v5 + 5, v4);
    *((_WORD *)v5 + 28) = 256;
    *((unsigned char *)v5 + 58) = 0;
    objc_initWeak(&location, v5);
    dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 1));
    v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    dispatch_source_set_timer(*((dispatch_source_t *)v5 + 2), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v11 = *((void *)v5 + 2);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100010E08;
    v14[3] = &unk_1000893C0;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v11, v14);
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
    id v12 = v5;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return (NavdDoomMapsSuggestionsUpdater *)v5;
}

- (NavdDoomMapsSuggestionsUpdater)init
{
  v3 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  id v4 = [(NavdDoomMapsSuggestionsUpdater *)self initWithLocationUpdater:v3];

  return v4;
}

- (NavdDoomMapsSuggestionsUpdater)initWithAllEntryTypes:(BOOL)a3 checkEntryWeight:(BOOL)a4 keepRunning:(BOOL)a5
{
  dispatch_source_t v9 = +[MapsSuggestionsNavdLBALocationManager sharedLocationManager];
  v10 = [(NavdDoomMapsSuggestionsUpdater *)self initWithLocationUpdater:v9];

  if (v10)
  {
    v10->_allEntryTypesAllowed = a3;
    v10->_checkEntryWeight = a4;
    v10->_keepRunning = a5;
  }
  return v10;
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_stopTimer);
  stopTimer = self->_stopTimer;
  self->_stopTimer = 0;

  [(MapsSuggestionsEngine *)self->_engine detachSink:self];
  engine = self->_engine;
  self->_engine = 0;

  id v5 = [(NSArray *)self->_entries copy];
  block = (void (**)(id, uint64_t, id))self->_block;
  if (block)
  {
    block[2](block, 1, v5);
    id v7 = self->_block;
    self->_block = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)NavdDoomMapsSuggestionsUpdater;
  [(NavdDoomMapsSuggestionsUpdater *)&v8 dealloc];
}

- (void)_refreshEntries
{
  v3 = GEOConfigGetString();
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    MapsSuggestionsDateFromString(v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      *(void *)buf = @"MapsSuggestionsCoreRoutinePK";
      CFStringRef v37 = @"MapsSuggestionsPrimaryKey";
      CFStringRef v38 = @"MapsSuggestionsCoreRoutinePK";
      v6 = +[NSUUID UUID];
      id v7 = [v6 UUIDString];
      *(void *)&buf[8] = v7;
      CFStringRef v39 = @"MapsSuggestionsScheduledTimeKey";
      CFStringRef v40 = @"MapsSuggestionsNeedsETATrackingKey";
      *(void *)&buf[16] = v5;
      *(void *)&buf[24] = &__kCFBooleanTrue;
      objc_super v8 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v37 count:4];

      id v9 = objc_alloc((Class)NSDate);
      GEOConfigGetDouble();
      id v10 = objc_msgSend(v9, "initWithTimeInterval:sinceDate:", v5);
      v11 = NSStringFromMapsSuggestionsEntryType();
      id v12 = +[MapsSuggestionsEntry entryWithType:1 title:v11 subtitle:@"FAKE Entry" weight:v10 expires:v8 sourceSpecificInfo:0.45];

      [v12 setString:@"235 2nd St, San Fancisco, CA  94105", @"MapsSuggestionsDestinationAddressKey" forKey];
      [v12 setNumber:&off_100090AC0 forKey:@"MapsSuggestionsLatitudeKey"];
      [v12 setNumber:&off_100090AD0 forKey:@"MapsSuggestionsLongitudeKey"];
    }
    else
    {
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomMapsSuggestionsUpdater.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 126;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "NavdDoomDestination *_fakeHome(NSDate *__strong)";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == entryTime";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry time", buf, 0x26u);
      }

      id v12 = 0;
    }

    [v4 addObject:v12];
    v14 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = MapsSuggestionsStringFromDate(v5);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "DEBUG MODE: Added FAKE Home, for entry at %@", buf, 0xCu);
    }
  }
  else
  {
    id v4 = 0;
  }
  v16 = GEOConfigGetString();

  if (v16)
  {
    if (!v4) {
      id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    }
    objc_super v17 = MapsSuggestionsDateFromString(v16);
    v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = MapsSuggestionsStringFromDate(v17);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "DEBUG MODE: Added FAKE Work, for entry at %@", buf, 0xCu);
    }
    id v20 = v17;
    if (v20)
    {
      *(void *)buf = @"MapsSuggestionsCoreRoutinePK";
      CFStringRef v37 = @"MapsSuggestionsPrimaryKey";
      CFStringRef v38 = @"MapsSuggestionsCoreRoutinePK";
      v21 = +[NSUUID UUID];
      v22 = [v21 UUIDString];
      *(void *)&buf[8] = v22;
      CFStringRef v39 = @"MapsSuggestionsScheduledTimeKey";
      CFStringRef v40 = @"MapsSuggestionsNeedsETATrackingKey";
      *(void *)&buf[16] = v20;
      *(void *)&buf[24] = &__kCFBooleanTrue;
      v23 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v37 count:4];

      id v24 = objc_alloc((Class)NSDate);
      GEOConfigGetDouble();
      id v25 = objc_msgSend(v24, "initWithTimeInterval:sinceDate:", v20);
      v26 = NSStringFromMapsSuggestionsEntryType();
      v27 = +[MapsSuggestionsEntry entryWithType:2 title:v26 subtitle:@"FAKE Entry" weight:v25 expires:v23 sourceSpecificInfo:0.45];

      [v27 setString:@"505 N Mathilda Ave, Sunnyvale, CA 94089", @"MapsSuggestionsDestinationAddressKey" forKey];
      [v27 setNumber:&off_100090AE0 forKey:@"MapsSuggestionsLatitudeKey"];
      [v27 setNumber:&off_100090AF0 forKey:@"MapsSuggestionsLongitudeKey"];
    }
    else
    {
      v28 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136446978;
        *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomMapsSuggestionsUpdater.m";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 138;
        *(_WORD *)&buf[18] = 2082;
        *(void *)&buf[20] = "NavdDoomDestination *_fakeWork(NSDate *__strong)";
        *(_WORD *)&buf[28] = 2082;
        *(void *)&buf[30] = "nil == entryTime";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry time", buf, 0x26u);
      }

      v27 = 0;
    }

    [v4 addObject:v27];
  }
  if (v4) {
    id v29 = [objc_alloc((Class)NSArray) initWithArray:v4];
  }
  else {
    id v29 = 0;
  }

  v30 = (NSArray *)[v29 copy];
  entries = self->_entries;
  self->_entries = v30;

  if (v30)
  {
    block = (void (**)(id, uint64_t, NSArray *))self->_block;
    if (block) {
      block[2](block, 1, self->_entries);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    engine = self->_engine;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000117D4;
    v34[3] = &unk_1000893E8;
    objc_copyWeak(&v35, (id *)buf);
    v34[4] = self;
    [(MapsSuggestionsEngine *)engine topSuggestionsForSink:self count:99 transportType:4 callback:v34 onQueue:self->_queue];
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)updateDestinationsForDuration:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    objc_initWeak((id *)location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011DB0;
    block[3] = &unk_100089410;
    objc_copyWeak(v12, (id *)location);
    id v11 = v6;
    v12[1] = *(id *)&a3;
    dispatch_async(queue, block);

    objc_destroyWeak(v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    objc_super v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id location = 136446978;
      *(void *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomMapsSuggestionsUpdater.m";
      __int16 v14 = 1024;
      int v15 = 253;
      __int16 v16 = 2082;
      objc_super v17 = "-[NavdDoomMapsSuggestionsUpdater updateDestinationsForDuration:completionHandler:]";
      __int16 v18 = 2082;
      v19 = "nil == (completionHandler)";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a handling block", location, 0x26u);
    }
  }
  return v6 != 0;
}

- (void)_done
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v4 = [(NSArray *)self->_entries count];
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Done with %u destinations", (uint8_t *)&buf, 8u);
  }

  if (!self->_keepRunning) {
    [(NavdDoomMapsSuggestionsUpdater *)self stopUpdating];
  }
  id v5 = [(NSArray *)self->_entries copy];
  if (self->_block)
  {
    objc_initWeak(&buf, self);
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001218C;
    v7[3] = &unk_100088FF8;
    objc_copyWeak(&v9, &buf);
    id v8 = v5;
    dispatch_async(queue, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&buf);
  }
  dispatch_source_set_timer((dispatch_source_t)self->_stopTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (id)currentDestinations
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10001240C;
  id v11 = sub_10001241C;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012424;
  v6[3] = &unk_100089438;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (void *)v8[5];
  if (!v3) {
    v3 = &__NSArray0__struct;
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)stopUpdating
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000124E4;
  block[3] = &unk_100088EE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000125FC;
  v5[3] = &unk_1000893C0;
  objc_copyWeak(&v6, &location);
  dispatch_async(queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak((id *)&self->_locationUpdater);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_stopTimer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end