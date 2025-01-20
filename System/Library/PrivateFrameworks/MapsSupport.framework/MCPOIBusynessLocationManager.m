@interface MCPOIBusynessLocationManager
+ (MCPOIBusynessLocationManager)sharedLocationManager;
- (MCPOIBusynessLocationManager)init;
- (MCPOIBusynessLocationManagerDelegate)locationDelegate;
- (void)fetchInferedPlaceNames:(BOOL)a3 analytics:(id)a4 completionQueue:(id)a5 completion:(id)a6;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didReportVisit:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)requestLocation;
- (void)requestVisit;
- (void)setLocationDelegate:(id)a3;
@end

@implementation MCPOIBusynessLocationManager

+ (MCPOIBusynessLocationManager)sharedLocationManager
{
  if (qword_1000239F8 != -1) {
    dispatch_once(&qword_1000239F8, &stru_10001C990);
  }
  v2 = (void *)qword_100023A00;

  return (MCPOIBusynessLocationManager *)v2;
}

- (MCPOIBusynessLocationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)MCPOIBusynessLocationManager;
  v2 = [(MCPOIBusynessLocationManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_listeningLocationCounter = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.geocorrectiond.poibusynesslocationmanager", v4);
    locationQueue = v3->_locationQueue;
    v3->_locationQueue = (OS_dispatch_queue *)v5;

    v7 = v3->_locationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000070A8;
    block[3] = &unk_10001C650;
    v10 = v3;
    dispatch_sync(v7, block);
  }
  return v3;
}

- (void)requestLocation
{
  unsigned int v3 = [(CLLocationManager *)self->_locationManager authorizationStatus];
  v4 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "locationManager authorizationStatus %d", buf, 8u);
  }

  if (v3 - 3 > 1)
  {
    +[MCPOIBusynessAnalytics report:6];
    v7 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "locationManager authorization not granted", buf, 2u);
    }

    locationQueue = self->_locationQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000732C;
    v8[3] = &unk_10001C650;
    v8[4] = self;
    v6 = v8;
  }
  else
  {
    locationQueue = self->_locationQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007310;
    v9[3] = &unk_10001C650;
    v9[4] = self;
    v6 = v9;
  }
  dispatch_async(locationQueue, v6);
}

- (void)requestVisit
{
  unsigned int v3 = [(CLLocationManager *)self->_locationManager authorizationStatus];
  v4 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "locationManager authorizationStatus %d", buf, 8u);
  }

  if (v3 - 3 > 1)
  {
    +[MCPOIBusynessAnalytics report:6];
    v7 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "locationManager authorization not granted", buf, 2u);
    }

    locationQueue = self->_locationQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000758C;
    v8[3] = &unk_10001C650;
    v8[4] = self;
    v6 = v8;
  }
  else
  {
    locationQueue = self->_locationQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007530;
    v9[3] = &unk_10001C650;
    v9[4] = self;
    v6 = v9;
  }
  dispatch_async(locationQueue, v6);
}

- (void)fetchInferedPlaceNames:(BOOL)a3 analytics:(id)a4 completionQueue:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    v13 = +[MCPOIBusynessState sharedState];
    id v14 = [v13 numberOfPlaceInferenceInLastDay];
    unint64_t UInteger = GEOConfigGetUInteger();

    if ((unint64_t)v14 >= UInteger) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 3;
    }
    v17 = +[MCPOIBusynessState sharedState];
    [v17 incrementPlaceInferenceCount];
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v10 setFidelity:v16];
  locationQueue = self->_locationQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000772C;
  v21[3] = &unk_10001CA08;
  v21[4] = self;
  id v22 = v11;
  id v23 = v12;
  uint64_t v24 = v16;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(locationQueue, v21);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationQueue);
  v6 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "locationManager:didUpdateLocations", buf, 2u);
  }

  int listeningLocationCounter = self->_listeningLocationCounter;
  if (listeningLocationCounter)
  {
    self->_int listeningLocationCounter = listeningLocationCounter - 1;
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    if ([v5 count])
    {
      BOOL v8 = [v5 lastObject];
      v9 = GEOGetPOIBusynessLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "locationManager:calling location delegate", v11, 2u);
      }

      id v10 = [(MCPOIBusynessLocationManager *)self locationDelegate];
      [v10 didUpdateLocation:v8];
    }
    else
    {
      +[MCPOIBusynessAnalytics report:7];
      BOOL v8 = [(MCPOIBusynessLocationManager *)self locationDelegate];
      [v8 didUpdateLocation:0];
    }
  }
}

- (void)locationManager:(id)a3 didReportVisit:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_locationQueue);
  v6 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "locationManager:didDetermineVisitState:visit:", buf, 2u);
  }

  int listeningVisitCounter = self->_listeningVisitCounter;
  if (listeningVisitCounter)
  {
    self->_int listeningVisitCounter = listeningVisitCounter - 1;
    [(CLLocationManager *)self->_locationManager stopMonitoringVisits];
    BOOL v8 = GEOGetPOIBusynessLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "locationManager:calling visit delegate", v10, 2u);
    }

    v9 = [(MCPOIBusynessLocationManager *)self locationDelegate];
    [v9 didUpdateVisit:v5];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = GEOGetPOIBusynessLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "locationManager:didFailWithError : %@", (uint8_t *)&v6, 0xCu);
  }
}

- (MCPOIBusynessLocationManagerDelegate)locationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_locationDelegate);

  return (MCPOIBusynessLocationManagerDelegate *)WeakRetained;
}

- (void)setLocationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locationDelegate);
  objc_storeStrong((id *)&self->_locationQueue, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end