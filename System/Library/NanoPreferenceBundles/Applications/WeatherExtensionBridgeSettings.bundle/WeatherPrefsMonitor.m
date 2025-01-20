@interface WeatherPrefsMonitor
- (BOOL)areLocationServicesAuthorized;
- (BOOL)areLocationServicesResolved;
- (City)selectedCity;
- (NPSDomainAccessor)gizmoDefaults;
- (NPSManager)gizmoDefaultsManager;
- (NSArray)cities;
- (NSArray)cityNames;
- (NSArray)sanitizedCities;
- (NSString)selectedCityLocationID;
- (WeatherPrefsMonitor)initWithDelegate:(id)a3;
- (WeatherPrefsMonitorDelegate)delegate;
- (void)_notifyObserversOfReload;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setGizmoDefaults:(id)a3;
- (void)setGizmoDefaultsManager:(id)a3;
- (void)setSelectedCity:(id)a3;
- (void)setSelectedCityLocationID:(id)a3;
- (void)weatherPrefsDidGetUpdated:(id)a3;
@end

@implementation WeatherPrefsMonitor

- (WeatherPrefsMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WeatherPrefsMonitor;
  v5 = [(WeatherPrefsMonitor *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nanoweatherprefs"];
    gizmoDefaults = v6->_gizmoDefaults;
    v6->_gizmoDefaults = v7;

    id v9 = [(NPSDomainAccessor *)v6->_gizmoDefaults synchronize];
    uint64_t v10 = objc_opt_new();
    gizmoDefaultsManager = v6->_gizmoDefaultsManager;
    v6->_gizmoDefaultsManager = (NPSManager *)v10;

    v12 = +[NSDistributedNotificationCenter defaultCenter];
    [v12 addObserver:v6 selector:"weatherPrefsDidGetUpdated:" name:kWeatherPrefAppToPrefsDidUpdate object:0 suspensionBehavior:2];

    v13 = +[NSDistributedNotificationCenter defaultCenter];
    [v13 addObserver:v6 selector:"weatherPrefsDidGetUpdated:" name:kWeatherPrefGroupPrefsDidUpdate object:0 suspensionBehavior:2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_56C4, @"com.apple.nanoweatherprefsd.PreferencesChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)WeatherPrefsMonitor;
  [(WeatherPrefsMonitor *)&v5 dealloc];
}

- (void)_notifyObserversOfReload
{
  id v3 = [(WeatherPrefsMonitor *)self delegate];
  [v3 monitorObservedReload:self];
}

- (void)weatherPrefsDidGetUpdated:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSProcessInfo processInfo];
  v6 = [v5 processName];
  v7 = [v4 object];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5928;
    block[3] = &unk_8318;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSArray)cityNames
{
  v2 = [(WeatherPrefsMonitor *)self cities];
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5A44;
  v5[3] = &unk_8340;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [v2 enumerateObjectsUsingBlock:v5];

  return (NSArray *)v3;
}

- (NSArray)cities
{
  id v3 = [(WeatherPrefsMonitor *)self sanitizedCities];
  id v4 = +[NSMutableArray arrayWithArray:v3];

  if ([(WeatherPrefsMonitor *)self areLocationServicesAuthorized])
  {
    objc_super v5 = +[City currentLocationCity];
    [v4 insertObject:v5 atIndex:0];
  }

  return (NSArray *)v4;
}

- (BOOL)areLocationServicesAuthorized
{
  v2 = +[WeatherLocationManager sharedWeatherLocationManager];
  signed int v3 = [v2 forceLoadingAuthorizationStatus];

  return v3 > 2;
}

- (BOOL)areLocationServicesResolved
{
  v2 = +[WeatherLocationManager sharedWeatherLocationManager];
  unsigned int v3 = [v2 forceLoadingAuthorizationStatus];

  return v3 != 0;
}

- (NSArray)sanitizedCities
{
  v2 = +[WeatherPreferences sharedPreferences];
  [v2 synchronizeStateToDisk];
  unsigned int v3 = [v2 loadSavedCities];
  id v4 = +[NSPredicate predicateWithBlock:&stru_8380];
  objc_super v5 = [v3 filteredArrayUsingPredicate:v4];

  return (NSArray *)v5;
}

- (City)selectedCity
{
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5E48;
  v18[3] = &unk_83A8;
  v18[4] = self;
  unsigned int v3 = objc_retainBlock(v18);
  id v4 = [(WeatherPrefsMonitor *)self selectedCityLocationID];
  objc_super v5 = v4;
  if (v4 && ![v4 isEqualToString:kLocalWeatherCityID])
  {
    v7 = [(WeatherPrefsMonitor *)self cities];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_5E90;
    objc_super v16 = &unk_83D0;
    id v17 = v5;
    id v8 = [v7 indexOfObjectPassingTest:&v13];
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = ((void (*)(void *))v3[2])(v3);
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        objc_msgSend(v7, "firstObject", v13, v14, v15, v16);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v6 = v11;
    }
    else
    {
      id v6 = objc_msgSend(v7, "objectAtIndexedSubscript:", v8, v13, v14, v15, v16);
    }
  }
  else
  {
    id v6 = ((void (*)(void *))v3[2])(v3);
  }

  return (City *)v6;
}

- (void)setSelectedCity:(id)a3
{
  id v7 = a3;
  id v4 = [(WeatherPrefsMonitor *)self selectedCity];
  unsigned __int8 v5 = [v7 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [v7 locationID];
    [(WeatherPrefsMonitor *)self setSelectedCityLocationID:v6];
  }
}

- (NSString)selectedCityLocationID
{
  v2 = [(WeatherPrefsMonitor *)self gizmoDefaults];
  unsigned int v3 = [v2 stringForKey:@"UserSelected"];

  return (NSString *)v3;
}

- (void)setSelectedCityLocationID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(WeatherPrefsMonitor *)self gizmoDefaults];
  [v5 setObject:v4 forKey:@"UserSelected"];

  id v6 = [(WeatherPrefsMonitor *)self gizmoDefaults];
  id v7 = [v6 synchronize];

  id v8 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_60B0;
  block[3] = &unk_8318;
  block[4] = self;
  dispatch_async(v8, block);
}

- (WeatherPrefsMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeatherPrefsMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NPSDomainAccessor)gizmoDefaults
{
  return self->_gizmoDefaults;
}

- (void)setGizmoDefaults:(id)a3
{
}

- (NPSManager)gizmoDefaultsManager
{
  return self->_gizmoDefaultsManager;
}

- (void)setGizmoDefaultsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gizmoDefaultsManager, 0);
  objc_storeStrong((id *)&self->_gizmoDefaults, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end