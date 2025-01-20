@interface WeaLocationModule
+ (id)sharedManagerWithDelegate:(shared_ptr<LocationDelegateInterface>)a3 withQueue:(queue)a4;
+ (void)createModuleAndAddToDelegate:(shared_ptr<LocationDelegateInterface>)a3 withQueue:(queue)a4;
- (BOOL)isCircularGeofenceSupported;
- (BOOL)isLocationServiceEnabled;
- (BOOL)isPolygonalGeofenceSupported;
- (CLLocation)fLocation;
- (CLLocationManager)fLocationManager;
- (WeaLocationModule)init;
- (WeaLocationModule)initWithDelegate:(shared_ptr<LocationDelegateInterface>)a3 withQueue:(queue)a4;
- (id).cxx_construct;
- (id)setupCircularGeoFence:()pair<WacGeoCoordinateType withName:(double>)a3;
- (id)setupPolygonalGeoFence:()vector<WacGeoCoordinateType withName:(std:(id)a4 :allocator<WacGeoCoordinateType>> *)a3;
- (queue)fQueue;
- (shared_ptr<LocationDelegateInterface>)fDelegate;
- (shared_ptr<WacGeoCoordinateType>)getCurrentLocation;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)resetMonitoredRegions;
- (void)setFDelegate:(shared_ptr<LocationDelegateInterface>)a3;
- (void)setFLocation:(id)a3;
- (void)setFLocationManager:(id)a3;
- (void)setFQueue:(queue)a3;
- (void)stopGeofence:(id)a3;
@end

@implementation WeaLocationModule

+ (void)createModuleAndAddToDelegate:(shared_ptr<LocationDelegateInterface>)a3 withQueue:(queue)a4
{
  v4 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  uint64_t v11 = *(void *)a3.__ptr_;
  v12 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v5 = *(NSObject **)a3.__cntrl_;
  dispatch_object_t object = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  v6 = +[WeaLocationModule sharedManagerWithDelegate:withQueue:](WeaLocationModule, "sharedManagerWithDelegate:withQueue:", &v11, &object, a4.fObj.fObj);
  if (object) {
    dispatch_release(object);
  }
  if (v12) {
    sub_10004D2C8(v12);
  }
  if (v6)
  {
    [v6 fDelegate];
    uint64_t v7 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    v9 = 0;
  }
  (*(void (**)(uint64_t, void *))(*(void *)v7 + 136))(v7, v6);
  if (v9) {
    sub_10004D2C8(v9);
  }
}

+ (id)sharedManagerWithDelegate:(shared_ptr<LocationDelegateInterface>)a3 withQueue:(queue)a4
{
  cntrl = a3.__cntrl_;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_101024F3C;
  v17 = sub_101024F4C;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3321888768;
  v10[2] = sub_101024F54;
  v10[3] = &unk_101A7F210;
  uint64_t v6 = *(void *)a3.__ptr_;
  v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  v10[4] = &v13;
  v10[5] = v6;
  uint64_t v11 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(NSObject **)a3.__cntrl_;
  dispatch_object_t object = v7;
  if (v7)
  {
    dispatch_retain(v7);
    uint64_t v7 = *(NSObject **)cntrl;
  }
  dispatch_sync(v7, v10);
  id v8 = (id)v14[5];
  if (object) {
    dispatch_release(object);
  }
  if (v11) {
    sub_10004D2C8(v11);
  }
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (WeaLocationModule)initWithDelegate:(shared_ptr<LocationDelegateInterface>)a3 withQueue:(queue)a4
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v15.receiver = self;
  v15.super_class = (Class)WeaLocationModule;
  uint64_t v6 = [(WeaLocationModule *)&v15 init];
  if (v6)
  {
    uint64_t v7 = *(NSObject **)cntrl;
    if (v7) {
      dispatch_retain(v7);
    }
    fObj = v6->_fQueue.fObj.fObj;
    v6->_fQueue.fObj.fObj = (dispatch_object_s *)v7;
    if (fObj) {
      dispatch_release(fObj);
    }
    v10 = *(LocationDelegateInterface **)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v11 = (std::__shared_weak_count *)v6->_fDelegate.__cntrl_;
    v6->_fDelegate.__ptr_ = v10;
    v6->_fDelegate.__cntrl_ = (__shared_weak_count *)v9;
    if (v11) {
      sub_10004D2C8(v11);
    }
    if (!qword_101B13080) {
      operator new();
    }
    v12 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/Wea.bundle" delegate:v6 onQueue:v6->_fQueue.fObj.fObj];
    fLocationManager = v6->_fLocationManager;
    v6->_fLocationManager = v12;

    [(CLLocationManager *)v6->_fLocationManager setDelegate:v6];
    [(CLLocationManager *)v6->_fLocationManager setDistanceFilter:kCLDistanceFilterNone];
    [(CLLocationManager *)v6->_fLocationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
  }
  return v6;
}

- (WeaLocationModule)init
{
  v3.receiver = self;
  v3.super_class = (Class)WeaLocationModule;
  return [(WeaLocationModule *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WeaLocationModule;
  [(WeaLocationModule *)&v2 dealloc];
}

- (BOOL)isLocationServiceEnabled
{
  return +[CLLocationManager locationServicesEnabled];
}

- (BOOL)isCircularGeofenceSupported
{
  BOOL v2 = +[CLLocationManager isMonitoringAvailableForClass:objc_opt_class()];
  if (!v2)
  {
    objc_super v3 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Monitoring for CLCircularRegion not supported", v5, 2u);
    }
  }
  return v2;
}

- (BOOL)isPolygonalGeofenceSupported
{
  BOOL v2 = +[CLLocationManager isMonitoringAvailableForClass:objc_opt_class()];
  if (!v2)
  {
    objc_super v3 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Monitoring for _CLPolygonalRegion not supported", v5, 2u);
    }
  }
  return v2;
}

- (id)setupCircularGeoFence:()pair<WacGeoCoordinateType withName:(double>)a3
{
  double var1 = a3.var1;
  double v5 = a3.var0.var1;
  double var0 = a3.var0.var0;
  id v8 = a4;
  id v9 = objc_alloc((Class)CLCircularRegion);
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(var0, v5);
  id v11 = objc_msgSend(v9, "initWithCenter:radius:identifier:", v8, v10.latitude, v10.longitude, var1 * 1000.0);
  v12 = v11;
  if (v11)
  {
    [v11 setEmergency:1];
    [(CLLocationManager *)self->_fLocationManager startMonitoringForRegion:v12];
    id v13 = v12;
  }
  else
  {
    v14 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to setup Circular geofence", buf, 2u);
    }
    ptr = self->_fDelegate.__ptr_;
    sub_100058DB0(__p, (char *)[v8 UTF8String]);
    (*(void (**)(LocationDelegateInterface *, void **))(*(void *)ptr + 64))(ptr, __p);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
  }

  return v12;
}

- (id)setupPolygonalGeoFence:()vector<WacGeoCoordinateType withName:(std:(id)a4 :allocator<WacGeoCoordinateType>> *)a3
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  double var0 = a3->var0;
  double var1 = a3->var1;
  if (var1 == a3->var0)
  {
    char v18 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid input array of 0 size...", buf, 2u);
    }
    v16 = 0;
  }
  else
  {
    do
    {
      CLLocationDegrees v10 = var0->var0;
      CLLocationDegrees v11 = var0->var1;
      id v12 = objc_alloc((Class)_CLVertex);
      CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v10, v11);
      id v14 = objc_msgSend(v12, "initWithCoordinate:", v13.latitude, v13.longitude);
      [v7 addObject:v14];

      ++var0;
    }
    while (var0 != var1);
    id v15 = [objc_alloc((Class)_CLPolygonalRegion) initWithVertices:v7 identifier:v6];
    v16 = v15;
    if (v15)
    {
      [v15 setEmergency:1];
      [(CLLocationManager *)self->_fLocationManager startMonitoringForRegion:v16];
      id v17 = v16;
    }
    else
    {
      v19 = *(NSObject **)qword_101B13080;
      if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to setup Polygonal geofence", buf, 2u);
      }
      ptr = self->_fDelegate.__ptr_;
      sub_100058DB0(__p, (char *)[v6 UTF8String]);
      (*(void (**)(LocationDelegateInterface *, void **))(*(void *)ptr + 64))(ptr, __p);
      if (v23 < 0) {
        operator delete(__p[0]);
      }
    }
  }

  return v16;
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)qword_101B13080;
  if (v7)
  {
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Monitoring did start for: %@", buf, 0xCu);
    }
    memset(buf, 0, sizeof(buf));
    uint64_t v14 = 0;
    id v9 = [v7 identifier];
    sub_100058DB0(buf, (char *)[v9 UTF8String]);

    ptr = self->_fDelegate.__ptr_;
    if (SHIBYTE(v14) < 0)
    {
      sub_10004FC84(__p, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v12 = v14;
    }
    (*(void (**)(LocationDelegateInterface *, void **))(*(void *)ptr + 72))(ptr, __p);
    if (SHIBYTE(v12) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v14) < 0) {
      operator delete(*(void **)buf);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid region pointer...", buf, 2u);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    memset(buf, 0, sizeof(buf));
    uint64_t v18 = 0;
    id v11 = [v9 identifier];
    sub_100058DB0(buf, (char *)[v11 UTF8String]);

    uint64_t v12 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138412290;
      id v20 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Monitoring failure reason: %@", v19, 0xCu);
    }
    ptr = self->_fDelegate.__ptr_;
    if (SHIBYTE(v18) < 0)
    {
      sub_10004FC84(__p, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v16 = v18;
    }
    (*(void (**)(LocationDelegateInterface *, void **))(*(void *)ptr + 80))(ptr, __p);
    if (SHIBYTE(v16) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    uint64_t v14 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid region pointer...", buf, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    memset(v19, 0, sizeof(v19));
    uint64_t v20 = 0;
    id v11 = [v9 identifier];
    sub_100058DB0(v19, (char *)[v11 UTF8String]);

    uint64_t v12 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      __int16 v23 = 2048;
      int64_t v24 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Monitoring state determined for %@ : %ld", buf, 0x16u);
    }
    ptr = self->_fDelegate.__ptr_;
    if (SHIBYTE(v20) < 0)
    {
      sub_10004FC84(__p, *(void **)v19, *(unint64_t *)&v19[8]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)v19;
      uint64_t v18 = v20;
    }
    if (a4 == 1) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = 1;
    }
    if (a4 == 2) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = v15;
    }
    (*(void (**)(LocationDelegateInterface *, void **, uint64_t))(*(void *)ptr + 104))(ptr, __p, v16);
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v20) < 0) {
      operator delete(*(void **)v19);
    }
  }
  else
  {
    uint64_t v14 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid region pointer...", v19, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    memset(buf, 0, sizeof(buf));
    uint64_t v16 = 0;
    id v9 = [v7 identifier];
    sub_100058DB0(buf, (char *)[v9 UTF8String]);

    id v10 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v17 = 138412290;
      uint64_t v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Region entered: %@", v17, 0xCu);
    }
    ptr = self->_fDelegate.__ptr_;
    if (SHIBYTE(v16) < 0)
    {
      sub_10004FC84(__p, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v14 = v16;
    }
    (*(void (**)(LocationDelegateInterface *, void **))(*(void *)ptr + 88))(ptr, __p);
    if (SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v16) < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    uint64_t v12 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid region pointer...", buf, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    memset(buf, 0, sizeof(buf));
    uint64_t v16 = 0;
    id v9 = [v7 identifier];
    sub_100058DB0(buf, (char *)[v9 UTF8String]);

    id v10 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v17 = 138412290;
      uint64_t v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Region entered: %@", v17, 0xCu);
    }
    ptr = self->_fDelegate.__ptr_;
    if (SHIBYTE(v16) < 0)
    {
      sub_10004FC84(__p, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v14 = v16;
    }
    (*(void (**)(LocationDelegateInterface *, void **))(*(void *)ptr + 96))(ptr, __p);
    if (SHIBYTE(v14) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v16) < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    uint64_t v12 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid region pointer...", buf, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  if (a4 <= 2)
  {
    id v7 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Location services disabled", v8, 2u);
    }
    (*(void (**)(LocationDelegateInterface *))(*(void *)self->_fDelegate.__ptr_ + 112))(self->_fDelegate.__ptr_);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  double v5 = *(NSObject **)qword_101B13080;
  if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = a4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Monitoring failure reason: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)stopGeofence:(id)a3
{
  id v4 = a3;
  fLocationManager = self->_fLocationManager;
  if (fLocationManager)
  {
    if (v4) {
      [(CLLocationManager *)fLocationManager stopMonitoringForRegion:v4];
    }
  }
  else
  {
    int v6 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to get location manager...", v7, 2u);
    }
  }
}

- (void)resetMonitoredRegions
{
  memset(v18, 0, sizeof(v18));
  objc_super v3 = [(CLLocationManager *)self->_fLocationManager monitoredRegions];
  id v4 = v3;
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v15;
      *(void *)&long long v7 = 138412290;
      long long v13 = v7;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v14 + 1) + 8 * i);
          if (v10)
          {
            id v11 = *(NSObject **)qword_101B13080;
            if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v13;
              *(void *)&uint8_t buf[4] = v10;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Stopping monitoring for: %@", buf, 0xCu);
            }
            -[CLLocationManager stopMonitoringForRegion:](self->_fLocationManager, "stopMonitoringForRegion:", v10, v13, (void)v14);
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v12 = *(NSObject **)qword_101B13080;
    if (os_log_type_enabled(*(os_log_t *)qword_101B13080, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I No actively monitored regions...", buf, 2u);
    }
  }

  *(void *)buf = v18;
  sub_100047F64((void ***)buf);
}

- (shared_ptr<WacGeoCoordinateType>)getCurrentLocation
{
  id v4 = v2;
  uint64_t v5 = [(CLLocationManager *)self->_fLocationManager location];
  void *v4 = 0;
  v4[1] = 0;
  id v13 = (id)v5;
  if (v5)
  {
    id v6 = operator new(0x28uLL);
    v6[1] = 0;
    v6[2] = 0;
    void *v6 = off_101A7F250;
    v6[3] = 0;
    v6[4] = 0;
    void *v4 = v6 + 3;
    v4[1] = v6;
    long long v7 = [(CLLocationManager *)self->_fLocationManager location];
    [v7 coordinate];
    v6[3] = v8;

    id v9 = [(CLLocationManager *)self->_fLocationManager location];
    [v9 coordinate];
    v6[4] = v10;
  }

  result.double var1 = v12;
  result.double var0 = v11;
  return result;
}

- (shared_ptr<LocationDelegateInterface>)fDelegate
{
  cntrl = self->_fDelegate.__cntrl_;
  *BOOL v2 = self->_fDelegate.__ptr_;
  v2[1] = (LocationDelegateInterface *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LocationDelegateInterface *)self;
  return result;
}

- (void)setFDelegate:(shared_ptr<LocationDelegateInterface>)a3
{
  id v4 = *(LocationDelegateInterface **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_fDelegate.__cntrl_;
  self->_fDelegate.__ptr_ = v4;
  self->_fDelegate.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (CLLocationManager)fLocationManager
{
  return self->_fLocationManager;
}

- (void)setFLocationManager:(id)a3
{
}

- (CLLocation)fLocation
{
  return self->_fLocation;
}

- (void)setFLocation:(id)a3
{
}

- (queue)fQueue
{
  fObj = self->_fQueue.fObj.fObj;
  *BOOL v2 = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  return (queue)fObj;
}

- (void)setFQueue:(queue)a3
{
  id v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(void *)a3.fObj.fObj) {
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  }
  fObj = self->_fQueue.fObj.fObj;
  self->_fQueue.fObj.fObj = v4;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_fDelegate.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  fObj = self->_fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  objc_storeStrong((id *)&self->_fLocation, 0);

  objc_storeStrong((id *)&self->_fLocationManager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end