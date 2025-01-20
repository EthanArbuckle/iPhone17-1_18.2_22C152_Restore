@interface MapsSuggestionsLeechingLocationUpdater
- (MapsSuggestionsLeechingLocationUpdater)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onStartImplementation;
- (void)onStopImplementation;
@end

@implementation MapsSuggestionsLeechingLocationUpdater

- (MapsSuggestionsLeechingLocationUpdater)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("MapsSuggestionsLeechingLocationUpdaterWorkerQueue", v3);
  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsLeechingLocationUpdater;
  v5 = [(MapsSuggestionsLeechingLocationUpdater *)&v7 initWithName:@"MapsSuggestionsLeechingLocationUpdater" queue:v4];

  return v5;
}

- (void)onStartImplementation
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    v11 = "-[MapsSuggestionsLeechingLocationUpdater onStartImplementation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  if (self->_locationManagerForLeeching)
  {
    dispatch_queue_t v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Already running", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    id v5 = objc_alloc((Class)CLLocationManager);
    v6 = [(MapsSuggestionsLeechingLocationUpdater *)self dispatchQueue];
    objc_super v7 = (CLLocationManager *)[v5 initWithEffectiveBundlePath:@"/System/Library/LocationBundles/DestinationdLocationBundleiOS.bundle" limitingBundleIdentifier:MapsAppBundleId delegate:self onQueue:v6];
    locationManagerForLeeching = self->_locationManagerForLeeching;
    self->_locationManagerForLeeching = v7;

    GEOConfigGetDouble();
    -[CLLocationManager setDistanceFilter:](self->_locationManagerForLeeching, "setDistanceFilter:");
    [(CLLocationManager *)self->_locationManagerForLeeching setDesiredAccuracy:2147483650.0];
    [(CLLocationManager *)self->_locationManagerForLeeching startUpdatingLocation];
    [(CLLocationManager *)self->_locationManagerForLeeching startMonitoringSignificantLocationChanges];
    [(CLLocationManager *)self->_locationManagerForLeeching startMonitoringVisits];
    id v9 = [(CLLocationManager *)self->_locationManagerForLeeching _limitsPrecision];
    [(MapsSuggestionsLeechingLocationUpdater *)self considerMyAllowanceAsLimited:v9];
    if (v9) {
      return;
    }
    dispatch_queue_t v4 = [(CLLocationManager *)self->_locationManagerForLeeching location];
    [(MapsSuggestionsLeechingLocationUpdater *)self considerMyNewLocation:v4];
  }
}

- (void)onStopImplementation
{
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    objc_super v7 = "-[MapsSuggestionsLeechingLocationUpdater onStopImplementation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v6, 0xCu);
  }

  locationManagerForLeeching = self->_locationManagerForLeeching;
  if (locationManagerForLeeching)
  {
    [(CLLocationManager *)locationManagerForLeeching stopUpdatingLocation];
    [(CLLocationManager *)self->_locationManagerForLeeching stopMonitoringSignificantLocationChanges];
    [(CLLocationManager *)self->_locationManagerForLeeching stopMonitoringVisits];
    id v5 = self->_locationManagerForLeeching;
    self->_locationManagerForLeeching = 0;
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MapsSuggestionsLoggingIsVerbose())
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LeechingLocationUpdater update", (uint8_t *)buf, 2u);
    }
  }
  if ([v7 count])
  {
    objc_initWeak(buf, self);
    id v9 = [(MapsSuggestionsLeechingLocationUpdater *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100030484;
    block[3] = &unk_100071510;
    objc_copyWeak(&v13, buf);
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = [v4 code];
  if (v5)
  {
    if (v5 != (id)3)
    {
      id v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = v4;
        id v7 = "Location error: %@";
        v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (MapsSuggestionsLoggingIsVerbose())
  {
    id v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      id v7 = "Location unknown";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      uint32_t v10 = 2;
      goto LABEL_8;
    }
LABEL_9:
  }
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(MapsSuggestionsLeechingLocationUpdater *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000309DC;
  v11[3] = &unk_100071F38;
  id v12 = v7;
  id v9 = v7;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  -[MapsSuggestionsLeechingLocationUpdater considerMyAllowanceAsLimited:](self, "considerMyAllowanceAsLimited:", [v4 _limitsPrecision]);
}

- (void).cxx_destruct
{
}

@end