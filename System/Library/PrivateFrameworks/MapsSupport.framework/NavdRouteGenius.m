@interface NavdRouteGenius
- (NSString)uniqueName;
- (NavdRouteGenius)initWithDelegate:(id)a3 resourceDepot:(id)a4 locationUpdater:(id)a5;
- (id).cxx_construct;
- (void)_updateExternalAccessory:(id)a3;
- (void)dealloc;
- (void)didChangeProtectionStatusForBundleId:(id)a3;
- (void)didUpdateLocation:(id)a3;
- (void)forceReroute;
- (void)invalidateForMapsSuggestionsManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation NavdRouteGenius

- (NavdRouteGenius)initWithDelegate:(id)a3 resourceDepot:(id)a4 locationUpdater:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)NavdRouteGenius;
  v12 = [(NavdRouteGenius *)&v30 init];
  if (v12)
  {
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    sub_100020238(&v28, @"MapsSuggestionsRouteGeniusQueue", v13);
    dispatch_queue_t v14 = v28;
    dispatch_queue_t v28 = 0;
    innerQueue = v12->_state.queue._innerQueue;
    v12->_state.queue._innerQueue = (OS_dispatch_queue *)v14;

    v16 = v29;
    v29 = 0;
    name = v12->_state.queue._name;
    v12->_state.queue._name = v16;

    objc_storeStrong((id *)&v12->_config.delegate, a3);
    objc_storeStrong((id *)&v12->_config.locationUpdater, a5);
    uint64_t v18 = [v10 oneAppGuardian];
    appGuardian = v12->_config.appGuardian;
    v12->_config.appGuardian = (MapsSuggestionsAppGuardian *)v18;

    uniqueName = v12->_uniqueName;
    v12->_uniqueName = (NSString *)@"NavdRouteGenius";

    v21 = +[NSNotificationCenter defaultCenter];
    v22 = +[MapsExternalAccessory sharedInstance];
    [v21 addObserver:v12 selector:"_updateExternalAccessory:" name:@"MapsExternalAccessoryUpdatedNotification" object:v22];

    v23 = [NavdNetworkRequester alloc];
    v24 = [v10 oneNetworkRequester];
    v25 = [(NavdNetworkRequester *)v23 initWithNetworkRequester:v24 purpose:6 source:1];
    requester = v12->_config.requester;
    v12->_config.requester = v25;
  }
  return v12;
}

- (void)forceReroute
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016390;
  v3[3] = &unk_1000896E8;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)self->_state.queue._innerQueue, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_updateExternalAccessory:(id)a3
{
  id v4 = +[MapsExternalAccessory sharedInstance];
  unsigned __int8 v5 = [v4 isConnected];

  if ((v5 & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Ending currentSession", v8, 2u);
    }

    v6->_state.triggerLocation.currentSession = 0;
    objc_sync_exit(v6);
  }
}

- (void)start
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "About to start RouteGenius", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016DB8;
  v4[3] = &unk_100089888;
  v4[4] = self;
  objc_copyWeak(&v5, buf);
  sub_100016C0C((NSObject **)&self->_state, self, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)stop
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "About to Stop RouteGenius", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001962C;
  block[3] = &unk_1000896E8;
  objc_copyWeak(&v5, buf);
  dispatch_async((dispatch_queue_t)self->_state.queue._innerQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

- (void)invalidateForMapsSuggestionsManager:(id)a3
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019C28;
  v4[3] = &unk_100089888;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  sub_100016C0C((NSObject **)&self->_state, self, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)didUpdateLocation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001F3C4;
    v6[3] = &unk_100089A58;
    id v7 = v4;
    v8 = self;
    objc_copyWeak(&v9, location);
    sub_100016C0C((NSObject **)&self->_state, self, v6);
    objc_destroyWeak(&v9);

    objc_destroyWeak(location);
  }
  else
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "received a nil location", (uint8_t *)location, 2u);
    }
  }
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  id v4 = +[MapsExternalAccessory sharedInstance];
  [v3 removeObserver:self name:@"MapsExternalAccessoryUpdatedNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)NavdRouteGenius;
  [(NavdRouteGenius *)&v5 dealloc];
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  id v4 = [(NavdRouteGeniusRoute *)self->_state.route entry];
  unsigned int v5 = [v4 isLockedOrHidden];

  if (v5)
  {
    [(NavdRouteGenius *)self stop];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueName, 0);

  name = self->_config.name;
}

- (id).cxx_construct
{
  *((void *)self + 1) = @"NavdRouteGenius";
  *((unsigned char *)self + 184) = 0;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *(_OWORD *)((char *)self + 122) = 0u;
  return self;
}

@end