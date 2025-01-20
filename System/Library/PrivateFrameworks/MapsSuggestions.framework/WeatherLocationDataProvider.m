@interface WeatherLocationDataProvider
- (BOOL)_shouldNotifyObservers;
- (CLLocationCoordinate2D)coordinate;
- (WeatherLocationDataProvider)init;
- (void)_notifyObserversWeatherLocationDidChange;
- (void)_updateCoordinate:(CLLocationCoordinate2D)a3;
- (void)_updateLocation:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation WeatherLocationDataProvider

- (WeatherLocationDataProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)WeatherLocationDataProvider;
  v2 = [(WeatherLocationDataProvider *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_coordinate = kCLLocationCoordinate2DInvalid;
    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;
  }
  return v3;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  BOOL v6 = CLLocationCoordinate2DIsValid(a3);
  p_coordinate = &self->_coordinate;
  if (v6)
  {
    double v8 = p_coordinate->latitude;
    if ((p_coordinate->latitude == latitude || (double v8 = self->_coordinate.longitude, v8 == longitude)) && self->_location)
    {
      [(WeatherLocationDataProvider *)self _notifyObserversWeatherLocationDidChange];
    }
    else
    {
      self->_coordinate.double latitude = latitude;
      self->_coordinate.double longitude = longitude;
      [(WeatherLocationDataProvider *)self _updateCoordinate:latitude];
    }
  }
  else
  {
    CLLocationCoordinate2D *p_coordinate = kCLLocationCoordinate2DInvalid;
    [(WeatherLocationDataProvider *)self _updateLocation:0];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversWeatherLocationDidChange
{
  id v4 = [(CLLocation *)self->_location copy];
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B3D0;
  block[3] = &unk_1000717C8;
  objc_copyWeak(v8, &location);
  v8[1] = (id)a2;
  block[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldNotifyObservers
{
  v2 = +[WeatherSettingsManager sharedManager];
  if ([v2 shouldShowAirQualityConditions]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 shouldShowWeatherConditions];
  }

  return v3;
}

- (void)_updateCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if ([(WeatherLocationDataProvider *)self _shouldNotifyObservers])
  {
    id v6 = [objc_alloc((Class)CLLocation) initWithLatitude:latitude longitude:longitude];
    [(WeatherLocationDataProvider *)self _updateLocation:v6];
  }
  else
  {
    [(WeatherLocationDataProvider *)self _updateLocation:0];
  }
}

- (void)_updateLocation:(id)a3
{
  id v4 = (CLLocation *)[a3 copy];
  id location = self->_location;
  self->_id location = v4;

  [(WeatherLocationDataProvider *)self _notifyObserversWeatherLocationDidChange];
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end