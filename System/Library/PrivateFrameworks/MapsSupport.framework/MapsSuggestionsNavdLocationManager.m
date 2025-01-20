@interface MapsSuggestionsNavdLocationManager
- (BOOL)_hasMapsCoarseLocationEnabled;
- (BOOL)hasLocationAccess;
- (BOOL)hasMapsLocationAccess;
- (CLLocationManager)locationManager;
- (MapsSuggestionsNavdLocationManager)initWithName:(id)a3 locationBundleID:(id)a4 queue:(id)a5;
- (MapsSuggestionsNavdLocationManager)initWithName:(id)a3 locationBundlePath:(id)a4 limitingBundleID:(id)a5 queue:(id)a6;
- (NSString)uniqueName;
- (void)_updateLocationIfAllowed:(id)a3;
- (void)locationLeecher:(id)a3 errorLeechingLocation:(id)a4;
- (void)locationLeecher:(id)a3 receivedLocation:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onStartImplementation;
- (void)onStopImplementation;
@end

@implementation MapsSuggestionsNavdLocationManager

- (void)locationLeecher:(id)a3 receivedLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [(MapsSuggestionsNavdLocationManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003484;
  block[3] = &unk_100088FF8;
  objc_copyWeak(&v12, &location);
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)hasMapsLocationAccess
{
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:MapsAppBundleId]- 3 > 1)return 0; {
  else
  }
    return ![(MapsSuggestionsNavdLocationManager *)self _hasMapsCoarseLocationEnabled];
}

- (void)_updateLocationIfAllowed:(id)a3
{
  id v4 = a3;
  [(MapsSuggestionsNavdLocationManager *)self considerMyAllowanceAsLimited:[(MapsSuggestionsNavdLocationManager *)self _hasMapsCoarseLocationEnabled]];
  if ([(MapsSuggestionsNavdLocationManager *)self hasMapsLocationAccess]) {
    [(MapsSuggestionsNavdLocationManager *)self considerMyNewLocation:v4];
  }
}

- (BOOL)_hasMapsCoarseLocationEnabled
{
  return [(CLLocationManager *)self->_locationManager accuracyAuthorization] != CLAccuracyAuthorizationFullAccuracy;
}

- (MapsSuggestionsNavdLocationManager)initWithName:(id)a3 locationBundleID:(id)a4 queue:(id)a5
{
  id v7 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsNavdLocationManager;
  v8 = [(MapsSuggestionsNavdLocationManager *)&v16 initWithName:a3 queue:v7];
  if (v8)
  {
    id v9 = objc_alloc((Class)CLLocationManager);
    v10 = (CLLocationManager *)[v9 initWithEffectiveBundleIdentifier:MapsAppBundleId delegate:v8 onQueue:v7];
    locationManager = v8->_locationManager;
    v8->_locationManager = v10;

    id v12 = +[NavdLocationLeecher sharedLeecher];
    v13 = [v12 leechedLocations];
    v14 = [v13 lastObject];
    [(MapsSuggestionsNavdLocationManager *)v8 considerMyNewLocation:v14];
  }
  return v8;
}

- (MapsSuggestionsNavdLocationManager)initWithName:(id)a3 locationBundlePath:(id)a4 limitingBundleID:(id)a5 queue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsNavdLocationManager;
  v13 = [(MapsSuggestionsNavdLocationManager *)&v20 initWithName:a3 queue:v12];
  if (v13)
  {
    v14 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:v10 limitingBundleIdentifier:v11 delegate:v13 onQueue:v12];
    locationManager = v13->_locationManager;
    v13->_locationManager = v14;

    objc_super v16 = +[NavdLocationLeecher sharedLeecher];
    v17 = [v16 leechedLocations];
    v18 = [v17 lastObject];
    [(MapsSuggestionsNavdLocationManager *)v13 considerMyNewLocation:v18];
  }
  return v13;
}

- (NSString)uniqueName
{
  v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (void)onStartImplementation
{
  objc_initWeak(&location, self);
  v3 = [(MapsSuggestionsNavdLocationManager *)self dispatchQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004910C;
  v4[3] = &unk_1000893C0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)onStopImplementation
{
  objc_initWeak(&location, self);
  v3 = [(MapsSuggestionsNavdLocationManager *)self dispatchQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000493A0;
  v4[3] = &unk_1000893C0;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)locationLeecher:(id)a3 errorLeechingLocation:(id)a4
{
  id v4 = (char *)a4;
  id v5 = GEOFindOrCreateLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v4;
      id v7 = "Error leeching location : %@";
      v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v11 = 136446978;
    id v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/MapsSuggestionsNavdLocationManager.m";
    __int16 v13 = 1024;
    int v14 = 119;
    __int16 v15 = 2082;
    objc_super v16 = "-[MapsSuggestionsNavdLocationManager locationLeecher:errorLeechingLocation:]";
    __int16 v17 = 2082;
    v18 = "nil == (error)";
    id v7 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an error";
    v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_FAULT;
    uint32_t v10 = 38;
    goto LABEL_6;
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  BOOL v4 = [(MapsSuggestionsNavdLocationManager *)self _hasMapsCoarseLocationEnabled];
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "DidChangeAuthorization coarse location enabled : %@", (uint8_t *)&v7, 0xCu);
  }

  [(MapsSuggestionsNavdLocationManager *)self considerMyAllowanceAsLimited:v4];
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  CFStringRef v8 = [(MapsSuggestionsNavdLocationManager *)self dispatchQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100049868;
  v10[3] = &unk_10008C3F0;
  id v11 = v7;
  id v9 = v7;
  objc_copyWeak(&v13, &location);
  id v12 = self;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)hasLocationAccess
{
  BOOL result = [(MapsSuggestionsNavdLocationManager *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void).cxx_destruct
{
}

@end