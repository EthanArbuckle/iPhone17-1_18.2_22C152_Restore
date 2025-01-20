@interface CoreLocationAnalytics
- (BOOL)isLocationAuthorized_sync;
- (CoreLocationAnalytics)initWithQueue:(dispatch_queue_s *)a3;
- (id).cxx_construct;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation CoreLocationAnalytics

- (CoreLocationAnalytics)initWithQueue:(dispatch_queue_s *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CoreLocationAnalytics;
  v4 = [(CoreLocationAnalytics *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_authStatus = 0;
    v6 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/WirelessDiagnostics.bundle" delegate:v4 onQueue:a3];
    locationManager = v5->_locationManager;
    v5->_locationManager = v6;

    operator new();
  }
  return 0;
}

- (BOOL)isLocationAuthorized_sync
{
  return self->_authStatus > 2u;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 authorizationStatus];
  self->_authStatus = v5;
  v6 = *(NSObject **)self->_logger.__ptr_.__value_;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5 > 4) {
      v7 = "???";
    }
    else {
      v7 = off_101A5C550[v5];
    }
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2080;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I new auth status %d (%s)", (uint8_t *)v8, 0x12u);
  }
}

- (void).cxx_destruct
{
  sub_100119D1C((ctu::OsLogLogger **)&self->_logger, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end