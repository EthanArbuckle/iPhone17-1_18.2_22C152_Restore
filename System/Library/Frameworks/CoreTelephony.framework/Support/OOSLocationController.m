@interface OOSLocationController
- (BOOL)isCircularGeofenceSupported_sync;
- (BOOL)isLocationServiceEnabled_sync;
- (BOOL)isPolygonalGeofenceSupported_sync;
- (CLLocationManager)fLocationManager;
- (OOSLocationController)init;
- (OOSLocationController)initWithBundleIdentifier:(id)a3 withQueue:(dispatch_queue_s *)a4;
- (OOSLocationController)initWithBundlePath:(id)a3 withQueue:(dispatch_queue_s *)a4;
- (OOSLocationControllerDelegateInterface)fDelegate;
- (dispatch_queue_s)fQueue;
- (id).cxx_construct;
- (id)setupCircularGeoFence:()pair<std:()double> :(double>)a3 pair<double withName:(id)a4;
- (void)dealloc;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)resetMonitoredRegions;
- (void)setDelegate:(OOSLocationControllerDelegateInterface *)a3;
- (void)setFDelegate:(OOSLocationControllerDelegateInterface *)a3;
- (void)setFLocationManager:(id)a3;
- (void)setFQueue:(dispatch_queue_s *)a3;
- (void)stopGeofence:(id)a3;
@end

@implementation OOSLocationController

- (OOSLocationController)initWithBundlePath:(id)a3 withQueue:(dispatch_queue_s *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OOSLocationController;
  id v11 = v6;
  v7 = [(OOSLocationController *)&v10 init];
  v12 = v7;
  if (v7)
  {
    v7->_fQueue = a4;
    operator new();
  }
  v8 = (OOSLocationController *)0;

  return v8;
}

- (OOSLocationController)initWithBundleIdentifier:(id)a3 withQueue:(dispatch_queue_s *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OOSLocationController;
  id v11 = v6;
  v7 = [(OOSLocationController *)&v10 init];
  v12 = v7;
  if (v7)
  {
    v7->_fQueue = a4;
    operator new();
  }
  v8 = (OOSLocationController *)0;

  return v8;
}

- (void)setDelegate:(OOSLocationControllerDelegateInterface *)a3
{
  self->_fDelegate = a3;
}

- (OOSLocationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)OOSLocationController;
  return [(OOSLocationController *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)OOSLocationController;
  [(OOSLocationController *)&v2 dealloc];
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
      *(_WORD *)id v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Monitoring for CLCircularRegion not supported", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)isPolygonalGeofenceSupported_sync
{
  return 0;
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__p = 138412290;
    *(void *)&__p[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Monitoring did start for: %@", __p, 0xCu);
  }
  objc_msgSend(v7, "identifier", 0, 0, 0);
  id v9 = objc_claimAutoreleasedReturnValue();
  sub_100058DB0(__p, (char *)[v9 UTF8String]);

  (*((void (**)(OOSLocationControllerDelegateInterface *, unsigned char *))self->_fDelegate->var0 + 2))(self->_fDelegate, __p);
  if (SHIBYTE(v11) < 0) {
    operator delete(*(void **)__p);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v15 = 0;
    id v11 = [v9 identifier];
    sub_100058DB0(__p, (char *)[v11 UTF8String]);

    v12 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Monitoring failure reason: %@", buf, 0xCu);
    }
    (*((void (**)(OOSLocationControllerDelegateInterface *, void **))self->_fDelegate->var0 + 3))(self->_fDelegate, __p);
    if (SHIBYTE(v15) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    v13 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid region pointer...", (uint8_t *)__p, 2u);
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
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v17 = 0;
    id v11 = [v9 identifier];
    sub_100058DB0(__p, (char *)[v11 UTF8String]);

    v12 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v10;
      __int16 v20 = 2048;
      int64_t v21 = a4;
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
    (*((void (**)(OOSLocationControllerDelegateInterface *, void **, uint8_t *))fDelegate->var0 + 6))(fDelegate, __p, buf);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    uint64_t v15 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Invalid region pointer...", (uint8_t *)__p, 2u);
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
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v13 = 0;
    id v9 = [v7 identifier];
    sub_100058DB0(__p, (char *)[v9 UTF8String]);

    id v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Region entered: %@", buf, 0xCu);
    }
    (*((void (**)(OOSLocationControllerDelegateInterface *, void **))self->_fDelegate->var0 + 7))(self->_fDelegate, __p);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    id v11 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid region pointer...", (uint8_t *)__p, 2u);
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
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v13 = 0;
    id v9 = [v7 identifier];
    sub_100058DB0(__p, (char *)[v9 UTF8String]);

    id v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Region exited: %@", buf, 0xCu);
    }
    (*((void (**)(OOSLocationControllerDelegateInterface *, void **))self->_fDelegate->var0 + 8))(self->_fDelegate, __p);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    id v11 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid region pointer...", (uint8_t *)__p, 2u);
    }
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  if (a4 <= 2)
  {
    id v7 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Location services disabled", v8, 2u);
    }
    (*((void (**)(OOSLocationControllerDelegateInterface *))self->_fDelegate->var0 + 5))(self->_fDelegate);
  }
}

- (id)setupCircularGeoFence:()pair<std:()double> :(double>)a3 pair<double withName:(id)a4
{
  double var1 = a3.var1;
  double v5 = a3.var0.var1;
  double var0 = a3.var0.var0;
  id v8 = a4;
  fQueue = self->_fQueue;
  v13[0] = self;
  v13[1] = *(id *)&var0;
  v13[2] = *(id *)&v5;
  v13[3] = *(id *)&var1;
  v16 = 0;
  id v14 = v8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100121570;
  block[3] = &unk_10199E470;
  block[4] = &v16;
  block[5] = v13;
  id v10 = v8;
  dispatch_sync(fQueue, block);
  id v11 = v16;

  return v11;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  double v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = a4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Monitoring failure reason: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)stopGeofence:(id)a3
{
  id v4 = a3;
  double v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Stopping a geofence", buf, 2u);
  }
  int v6 = self;
  id v7 = v4;
  operator new();
}

- (void)resetMonitoredRegions
{
  BOOL v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Resetting Monitored Regions", buf, 2u);
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

- (OOSLocationControllerDelegateInterface)fDelegate
{
  return self->_fDelegate;
}

- (void)setFDelegate:(OOSLocationControllerDelegateInterface *)a3
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