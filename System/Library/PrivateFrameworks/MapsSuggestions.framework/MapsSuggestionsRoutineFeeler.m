@interface MapsSuggestionsRoutineFeeler
+ (BOOL)isEnabled;
- (BOOL)canProduceSignalType:(int64_t)a3;
- (MapsSuggestionsRoutineFeeler)initWithDelegate:(id)a3 name:(id)a4;
- (double)updateSignals;
@end

@implementation MapsSuggestionsRoutineFeeler

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x13) & (0x71000u >> a3);
}

- (MapsSuggestionsRoutineFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  objc_initWeak(&location, a3);
  id v6 = a4;
  id v7 = objc_loadWeakRetained(&location);
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsRoutineFeeler;
  v8 = [(MapsSuggestionsBaseFeeler *)&v16 initWithDelegate:v7 name:v6];

  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("MapsSuggestionsRoutineFeeler", v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v10;

    GEOConfigGetDouble();
    v8->_pollingFrequency = v12;
    v13 = (MapsSuggestionsMutableSignalPack *)[objc_alloc((Class)MapsSuggestionsMutableSignalPack) initWithCapacity:4];
    signalPack = v8->_signalPack;
    v8->_signalPack = v13;
  }
  objc_destroyWeak(&location);
  return v8;
}

- (double)updateSignals
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "updateSignals", (uint8_t *)&v20, 2u);
  }

  dispatch_group_t v4 = dispatch_group_create();
  v5 = self;
  objc_sync_enter(v5);
  sub_10001A8B0(v5, 0, v4);
  sub_10001A8B0(v5, 1, v4);
  id v6 = v4;
  id v7 = v6;
  if (v5)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "updateTouristInfo", (uint8_t *)buf, 2u);
    }

    if (+[MapsSuggestionsSiri isEnabled])
    {
      v9 = MapsSuggestionsCurrentBestLocation();
      if (v9)
      {
        dispatch_group_enter(v7);
        objc_initWeak(buf, v5);
        dispatch_queue_t v10 = +[RTRoutineManager defaultManager];
        v20 = _NSConcreteStackBlock;
        uint64_t v21 = 3221225472;
        v22 = sub_10001B40C;
        v23 = &unk_100071840;
        objc_copyWeak(&v25, buf);
        v24 = v7;
        [v10 fetchRoutineModeFromLocation:v9 withHandler:&v20];

        objc_destroyWeak(&v25);
        objc_destroyWeak(buf);
      }
      else
      {
        v11 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Current Location is nil. We can't request CR for tourist mode without it.", (uint8_t *)buf, 2u);
        }

        v9 = 0;
      }
    }
    else
    {
      v9 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "User turned off Siri Suggestions for maps. Not fetching tourist mode", (uint8_t *)buf, 2u);
      }
    }

    double v12 = v7;
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "updateParkedCar", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v5);
    dispatch_group_enter(v12);
    v14 = +[RTRoutineManager defaultManager];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10001B864;
    v23 = &unk_100071890;
    objc_copyWeak(&v25, buf);
    v15 = v12;
    v24 = v15;
    [v14 fetchLastVehicleEventsWithHandler:&v20];

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);

    objc_super v16 = v15;
    objc_initWeak(buf, v5);
    queue = v5->_queue;
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10001AB0C;
    v23 = &unk_1000717A0;
    objc_copyWeak((id *)&v24, buf);
    dispatch_group_notify(v16, queue, &v20);

    objc_destroyWeak((id *)&v24);
    objc_destroyWeak(buf);
  }
  else
  {
  }
  double pollingFrequency = v5->_pollingFrequency;
  objc_sync_exit(v5);

  return pollingFrequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signalPack, 0);
}

@end