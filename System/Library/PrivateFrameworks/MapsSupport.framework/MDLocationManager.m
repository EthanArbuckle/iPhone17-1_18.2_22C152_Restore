@interface MDLocationManager
- (BOOL)mapsLocationAuthorized;
- (BOOL)mapsPreciseLocationAuthorized;
- (MDLocationManager)init;
- (double)requestedAccuracy;
- (void)_notifyClients:(id)a3 error:(id)a4;
- (void)_setupLocationManager;
- (void)_shiftLocationIfNeeded:(id)a3 withCompletionHandler:(id)a4;
- (void)_timeoutOccurred;
- (void)dealloc;
- (void)fetchSingleLocationWithAccuracy:(double)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)mapsInstallStateDidChange:(BOOL)a3;
- (void)registerLocationObserver:(id)a3;
- (void)setRequestedAccuracy:(double)a3;
- (void)unregisterLocationObserver:(id)a3;
@end

@implementation MDLocationManager

- (MDLocationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MDLocationManager;
  v2 = [(MDLocationManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MDLocationQueue", v3);
    locationQueue = v2->_locationQueue;
    v2->_locationQueue = (OS_dispatch_queue *)v4;

    v6 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MDLocationObserver queue:0];
    locationObservers = v2->_locationObservers;
    v2->_locationObservers = v6;

    v8 = +[MSPMapsInstallState sharedState];
    [v8 registerMapsInstallStateObserver:v2];

    [(MDLocationManager *)v2 _setupLocationManager];
  }
  return v2;
}

- (void)dealloc
{
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  v3.receiver = self;
  v3.super_class = (Class)MDLocationManager;
  [(MDLocationManager *)&v3 dealloc];
}

- (void)_setupLocationManager
{
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    id v3 = objc_alloc((Class)CLLocationManager);
    dispatch_queue_t v4 = (CLLocationManager *)[v3 initWithEffectiveBundlePath:@"/System/Library/LocationBundles/MapsAnnouncements.bundle" limitingBundleIdentifier:MapsAppBundleId delegate:self onQueue:self->_locationQueue];
    locationManager = self->_locationManager;
    self->_locationManager = v4;

    BOOL v6 = [(CLLocationManager *)self->_locationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways
      || [(CLLocationManager *)self->_locationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse;
    self->_mapsAuthorized = v6;
    self->_mapsLocationIsPrecise = [(CLLocationManager *)self->_locationManager accuracyAuthorization] == CLAccuracyAuthorizationFullAccuracy;
    self->_requestedAccuracy = kCLLocationAccuracyKilometer;
    v7 = self->_locationManager;
    -[CLLocationManager setDesiredAccuracy:](v7, "setDesiredAccuracy:");
  }
}

- (void)registerLocationObserver:(id)a3
{
  id v4 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    locationQueue = self->_locationQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010C8C;
    v6[3] = &unk_100038A18;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(locationQueue, v6);
  }
}

- (void)unregisterLocationObserver:(id)a3
{
  id v4 = a3;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    locationQueue = self->_locationQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100010DFC;
    v6[3] = &unk_100038A18;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(locationQueue, v6);
  }
}

- (void)fetchSingleLocationWithAccuracy:(double)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (+[MSPMapsInstallState isMapsAppInstalled])
  {
    locationQueue = self->_locationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010FCC;
    block[3] = &unk_100038F38;
    block[4] = self;
    id v16 = v8;
    double v17 = a3;
    dispatch_async(locationQueue, block);
    objc_initWeak(&location, self);
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11 = self->_locationQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100011090;
    v12[3] = &unk_100038CF8;
    objc_copyWeak(&v13, &location);
    dispatch_after(v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_timeoutOccurred
{
  if (self->_completionHandler)
  {
    id v3 = +[NSError GEOErrorWithCode:-8 reason:@"Failed to retrieve location within timeout period"];
    [(MDLocationManager *)self _notifyClients:0 error:v3];
  }
}

- (void)_shiftLocationIfNeeded:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 coordinate];
  id v10 = [objc_alloc((Class)GEOLatLng) initWithLatitude:v8 longitude:v9];
  [v10 setGtLog:1];
  [v10 coordinate];
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    id v11 = objc_alloc_init((Class)GEOLocationShifter);
    [v6 horizontalAccuracy];
    double v13 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100011310;
    v16[3] = &unk_100038F60;
    id v17 = v6;
    id v18 = v7;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000113EC;
    v14[3] = &unk_100038D78;
    id v15 = v18;
    [v11 shiftLatLng:v10 accuracy:v16 withCompletionHandler:0 mustGoToNetworkCallback:v14 errorHandler:self->_locationQueue callbackQueue:v13];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

- (void)_notifyClients:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_completionHandler);
  double v8 = v7;
  if (v7)
  {
    (*((void (**)(id, id, id))v7 + 2))(v7, v10, v6);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    [(CLLocationManager *)self->_locationManager setDesiredAccuracy:self->_requestedAccuracy];
  }
  if ([(GEOObserverHashTable *)self->_locationObservers hasObservers]) {
    [(GEOObserverHashTable *)self->_locationObservers locationDidUpdate:v10 error:v6];
  }
  else {
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    objc_initWeak(&location, self);
    locationQueue = self->_locationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000115A0;
    block[3] = &unk_100038960;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    dispatch_async(locationQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to get location: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  objc_initWeak(&location, self);
  locationQueue = self->_locationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011868;
  block[3] = &unk_100038960;
  objc_copyWeak(&v6, &location);
  void block[4] = self;
  dispatch_async(locationQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)mapsInstallStateDidChange:(BOOL)a3
{
  locationManager = self->_locationManager;
  if (!a3 || locationManager)
  {
    [(CLLocationManager *)locationManager stopUpdatingLocation];
    [(CLLocationManager *)self->_locationManager setDelegate:0];
    id v5 = self->_locationManager;
    self->_locationManager = 0;
  }
  else
  {
    [(MDLocationManager *)self _setupLocationManager];
  }
}

- (BOOL)mapsLocationAuthorized
{
  return self->_mapsAuthorized;
}

- (BOOL)mapsPreciseLocationAuthorized
{
  return self->_mapsLocationIsPrecise;
}

- (double)requestedAccuracy
{
  return self->_requestedAccuracy;
}

- (void)setRequestedAccuracy:(double)a3
{
  self->_requestedAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationObservers, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationQueue, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end