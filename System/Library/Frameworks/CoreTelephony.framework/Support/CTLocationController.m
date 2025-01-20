@interface CTLocationController
- (BOOL)isCircularGeofenceSupported_sync;
- (BOOL)isLocationServiceEnabled_sync;
- (BOOL)isPolygonalGeofenceSupported_sync;
- (CLLocationManager)fLocationManager;
- (CTLocationController)init;
- (CTLocationController)initWithBundleIdentifier:(id)a3 withDistanceFilter:(int)a4 withDesiredAccuracy:(int)a5 withQueue:(dispatch_queue_s *)a6 withDelegate:(CTLocationControllerDelegateInterface *)a7;
- (CTLocationController)initWithBundlePath:(id)a3 withQueue:(dispatch_queue_s *)a4 withDelegate:(CTLocationControllerDelegateInterface *)a5;
- (CTLocationControllerDelegateInterface)fDelegate;
- (dispatch_queue_s)fQueue;
- (id).cxx_construct;
- (id)setupPolygonalGeoFence:()vector<std:()double> :()std:(double>>> *)a3 :(id)a4 allocator<std::pair<double pair<double withName:;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)requestLocation;
- (void)resetMonitoredRegions;
- (void)setFDelegate:(CTLocationControllerDelegateInterface *)a3;
- (void)setFLocationManager:(id)a3;
- (void)setFQueue:(dispatch_queue_s *)a3;
- (void)setupCircularGeoFence:()pair<std:()double> :(double>)a3 pair<double withName:(id)a4;
- (void)stopGeofence:(id)a3;
@end

@implementation CTLocationController

- (CTLocationController)initWithBundleIdentifier:(id)a3 withDistanceFilter:(int)a4 withDesiredAccuracy:(int)a5 withQueue:(dispatch_queue_s *)a6 withDelegate:(CTLocationControllerDelegateInterface *)a7
{
  id v12 = a3;
  id v19 = v12;
  int v17 = a5;
  int v18 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CTLocationController;
  v13 = [(CTLocationController *)&v16 init];
  v20 = v13;
  if (v13)
  {
    v13->_fDelegate = a7;
    v13->_fQueue = a6;
    operator new();
  }
  v14 = (CTLocationController *)0;

  return v14;
}

- (CTLocationController)initWithBundlePath:(id)a3 withQueue:(dispatch_queue_s *)a4 withDelegate:(CTLocationControllerDelegateInterface *)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTLocationController;
  v9 = [(CTLocationController *)&v11 init];
  if (v9)
  {
    v9->_fDelegate = a5;
    v9->_fQueue = a4;
    operator new();
  }

  return 0;
}

- (CTLocationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CTLocationController;
  return [(CTLocationController *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CTLocationController;
  [(CTLocationController *)&v2 dealloc];
}

- (BOOL)isLocationServiceEnabled_sync
{
  return +[CLLocationManager locationServicesEnabled];
}

- (BOOL)isCircularGeofenceSupported_sync
{
  BOOL v3 = +[CLLocationManager isMonitoringAvailableForClass:objc_opt_class()];
  if (!v3)
  {
    v4 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Monitoring for CLCircularRegion not supported", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)isPolygonalGeofenceSupported_sync
{
  BOOL v3 = +[CLLocationManager isMonitoringAvailableForClass:objc_opt_class()];
  if (!v3)
  {
    v4 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Monitoring for _CLPolygonalRegion not supported", v6, 2u);
    }
  }
  return v3;
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(__p) = 138412290;
    *(void *)((char *)&__p + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Monitoring did start for: %@", (uint8_t *)&__p, 0xCu);
  }
  if (self->_fDelegate)
  {
    long long __p = 0uLL;
    uint64_t v12 = 0;
    id v9 = [v7 identifier];
    sub_100058DB0(&__p, (char *)[v9 UTF8String]);

    (*((void (**)(CTLocationControllerDelegateInterface *, long long *))self->_fDelegate->var0 + 2))(self->_fDelegate, &__p);
    if (SHIBYTE(v12) < 0) {
      operator delete((void *)__p);
    }
  }
  else
  {
    v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Delegate not found", (uint8_t *)&__p, 2u);
    }
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v13 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(__p[0]) = 0;
    v14 = "Invalid region pointer...";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)__p, 2u);
    goto LABEL_10;
  }
  if (!self->_fDelegate)
  {
    v13 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(__p[0]) = 0;
    v14 = "Delegate not found";
    goto LABEL_12;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v16 = 0;
  id v11 = [v9 identifier];
  sub_100058DB0(__p, (char *)[v11 UTF8String]);

  uint64_t v12 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Monitoring failure reason: %@", buf, 0xCu);
  }
  (*((void (**)(CTLocationControllerDelegateInterface *, void **))self->_fDelegate->var0 + 3))(self->_fDelegate, __p);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[0]);
  }
LABEL_10:
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (!v9)
  {
    v15 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v16 = "Invalid region pointer...";
LABEL_17:
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)__p, 2u);
    goto LABEL_15;
  }
  if (!self->_fDelegate)
  {
    v15 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v16 = "Delegate not found";
    goto LABEL_17;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v18 = 0;
  id v11 = [v9 identifier];
  sub_100058DB0(__p, (char *)[v11 UTF8String]);

  uint64_t v12 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v10;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Monitoring state determined for %@ : %ld", buf, 0x16u);
  }
  fDelegate = self->_fDelegate;
  if (a4 == 1) {
    int v14 = 2;
  }
  else {
    int v14 = 1;
  }
  if (a4 == 2) {
    int v14 = 3;
  }
  *(_DWORD *)buf = v14;
  (*((void (**)(CTLocationControllerDelegateInterface *, void **, uint8_t *))fDelegate->var0 + 6))(fDelegate, __p, buf);
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
LABEL_15:
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v11 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v12 = "Invalid region pointer...";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)__p, 2u);
    goto LABEL_10;
  }
  if (!self->_fDelegate)
  {
    id v11 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v12 = "Delegate not found";
    goto LABEL_12;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v14 = 0;
  id v9 = [v7 identifier];
  sub_100058DB0(__p, (char *)[v9 UTF8String]);

  id v10 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Region entered: %@", buf, 0xCu);
  }
  (*((void (**)(CTLocationControllerDelegateInterface *, void **))self->_fDelegate->var0 + 7))(self->_fDelegate, __p);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
LABEL_10:
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    id v11 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v12 = "Invalid region pointer...";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)__p, 2u);
    goto LABEL_10;
  }
  if (!self->_fDelegate)
  {
    id v11 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    LOWORD(__p[0]) = 0;
    uint64_t v12 = "Delegate not found";
    goto LABEL_12;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v14 = 0;
  id v9 = [v7 identifier];
  sub_100058DB0(__p, (char *)[v9 UTF8String]);

  id v10 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Region exited: %@", buf, 0xCu);
  }
  (*((void (**)(CTLocationControllerDelegateInterface *, void **))self->_fDelegate->var0 + 8))(self->_fDelegate, __p);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
LABEL_10:
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  id v7 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I didChangeAuthStatus changed to: %d", (uint8_t *)v10, 8u);
  }
  fDelegate = self->_fDelegate;
  if (fDelegate)
  {
    (*((void (**)(CTLocationControllerDelegateInterface *, BOOL))fDelegate->var0 + 5))(fDelegate, (a4 - 3) < 2);
  }
  else
  {
    id v9 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Delegate not found", (uint8_t *)v10, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v7 count])
  {
    uint64_t v14 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v18 = 0;
    v15 = "No locations returned from didUpateLocations";
    uint64_t v16 = (uint8_t *)&v18;
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
    goto LABEL_7;
  }
  if (!self->_fDelegate)
  {
    uint64_t v14 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v17 = 0;
    v15 = "Delegate not found";
    uint64_t v16 = (uint8_t *)&v17;
    goto LABEL_9;
  }
  id v8 = [v7 objectAtIndex:0];
  [v8 coordinate];
  double v10 = v9;

  id v11 = [v7 objectAtIndex:0];
  [v11 coordinate];
  double v13 = v12;

  (*((void (**)(CTLocationControllerDelegateInterface *, double, double))self->_fDelegate->var0 + 9))(self->_fDelegate, v10, v13);
LABEL_7:
}

- (void)setupCircularGeoFence:()pair<std:()double> :(double>)a3 pair<double withName:(id)a4
{
  id v5 = a4;
  id v6 = self;
  id v7 = v5;
  operator new();
}

- (id)setupPolygonalGeoFence:()vector<std:()double> :()std:(double>>> *)a3 :(id)a4 allocator<std::pair<double pair<double withName:
{
  id v6 = a4;
  fQueue = self->_fQueue;
  id v11 = self;
  long long __p = 0;
  double v13 = 0;
  uint64_t v14 = 0;
  sub_100952E7C((char *)&__p, (long long *)a3->var0, (long long *)a3->var1, ((char *)a3->var1 - (char *)a3->var0) >> 4);
  id v8 = v6;
  __int16 v17 = 0;
  id v15 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100953390;
  block[3] = &unk_10199E470;
  block[4] = &v17;
  block[5] = &v11;
  dispatch_sync(fQueue, block);
  double v9 = v17;

  if (__p)
  {
    double v13 = __p;
    operator delete(__p);
  }

  return v9;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  fDelegate = self->_fDelegate;
  double v9 = *(NSObject **)self->logger.__ptr_.__value_;
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (fDelegate)
  {
    if (v10)
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Monitoring failure reason: %@", (uint8_t *)&v11, 0xCu);
      fDelegate = self->_fDelegate;
    }
    (*((void (**)(CTLocationControllerDelegateInterface *))fDelegate->var0 + 4))(fDelegate);
  }
  else if (v10)
  {
    LOWORD(v11) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Delegate not found", (uint8_t *)&v11, 2u);
  }
}

- (void)stopGeofence:(id)a3
{
  id v4 = a3;
  id v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Stopping a geofence", buf, 2u);
  }
  id v6 = self;
  id v7 = v4;
  operator new();
}

- (void)resetMonitoredRegions
{
  objc_super v2 = self;
  operator new();
}

- (void)requestLocation
{
  BOOL v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Requesting CL for current location", buf, 2u);
  }
  id v4 = self;
  operator new();
}

- (CLLocationManager)fLocationManager
{
  return self->_fLocationManager;
}

- (void)setFLocationManager:(id)a3
{
}

- (CTLocationControllerDelegateInterface)fDelegate
{
  return self->_fDelegate;
}

- (void)setFDelegate:(CTLocationControllerDelegateInterface *)a3
{
  self->_fDelegate = a3;
}

- (dispatch_queue_s)fQueue
{
  return self->_fQueue;
}

- (void)setFQueue:(dispatch_queue_s *)a3
{
  self->_fQueue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fLocationManager, 0);

  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end