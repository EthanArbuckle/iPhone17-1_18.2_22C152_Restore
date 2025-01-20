@interface CTWifiLocationManager
- (BOOL)forceLocationLookup;
- (BOOL)isLocationAcceptable:(double)a3 integrity:(unsigned int)a4 accuracy:(double)a5;
- (BOOL)isLocationServiceAuthorized;
- (BOOL)isLocationServiceDenied;
- (BOOL)isLocationServiceEnabled;
- (BOOL)locationAvailable;
- (BOOL)locationRequested;
- (CLAssertion)locationServicesAssertion;
- (CLLocation)location;
- (CTWifiLocationManager)init;
- (double)desiredLocationAccuracy;
- (id).cxx_construct;
- (id)copyLastKnownLocation;
- (unsigned)desiredIntegrity;
- (void)configureLocationManagerWithForceLocationLookup:(BOOL)a3;
- (void)dealloc;
- (void)disableVoWiFiLocationStatusOnFirstLaunch;
- (void)enableVoWiFiLocationStatus:(BOOL)a3;
- (void)handleDataMigration;
- (void)handleDumpState;
- (void)initialize;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)registerWifiCallingEntity;
- (void)setDesiredIntegrity:(unsigned int)a3;
- (void)setDesiredLocationAccuracy:(double)a3;
- (void)setForceLocationLookup:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLocationAvailable:(BOOL)a3;
- (void)setLocationRequested:(BOOL)a3;
- (void)setLocationServicesAssertion:(id)a3;
- (void)shouldUpdateLocation:(BOOL)a3 forceLocationLookup:(BOOL)a4;
- (void)startLocationUpdateWithForceLocationLookup:(BOOL)a3;
- (void)stopLocationUpdates;
@end

@implementation CTWifiLocationManager

- (CTWifiLocationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTWifiLocationManager;
  v2 = [(CTWifiLocationManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    location = v2->_location;
    v2->_location = 0;

    v3->_forceLocationLookup = 0;
    *(_WORD *)&v3->_locationServiceDenied = 256;
    v3->_desiredLocationAccuracy = kCLLocationAccuracyThreeKilometers;
    v3->_desiredIntegrity = kCLLocationIntegrityLow;
    v3->_initialized = 0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [(CTWifiLocationManager *)self stopLocationUpdates];
  v3.receiver = self;
  v3.super_class = (Class)CTWifiLocationManager;
  [(CTWifiLocationManager *)&v3 dealloc];
}

- (void)initialize
{
  if (!self->_initialized)
  {
    self->_initialized = 1;
    sub_1007B3A7C((os_log_t *)self->logger.__ptr_.__value_);
    objc_super v3 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = sub_1007B3D44();
      if (v4 > 4) {
        v5 = "???";
      }
      else {
        v5 = off_101A08FE8[v4];
      }
      int v6 = 136315138;
      v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I CTWifiLocationManager initialized. Currently location status: %s", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)disableVoWiFiLocationStatusOnFirstLaunch
{
  objc_super v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I CTWifiLocation disableVoWiFiLocationStatusOnFirstLaunch", v4, 2u);
    objc_super v3 = *(NSObject **)self->logger.__ptr_.__value_;
  }
  sub_1007B3E2C(v3, 0);
  sub_1007B3F40();
}

- (void)handleDataMigration
{
  value = (os_log_t *)self->logger.__ptr_.__value_;
  unsigned int v4 = *value;
  if (os_log_type_enabled(*value, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = sub_1007B3D44();
    if (v5 > 4) {
      int v6 = "???";
    }
    else {
      int v6 = off_101A08FE8[v5];
    }
    int v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I CTWifiLocationManager handle data migration. current status: %s", (uint8_t *)&v7, 0xCu);
    value = (os_log_t *)self->logger.__ptr_.__value_;
  }
  sub_1007B408C(value);
}

- (void)configureLocationManagerWithForceLocationLookup:(BOOL)a3
{
  BOOL v3 = a3;
  -[CTWifiLocationManager setForceLocationLookup:](self, "setForceLocationLookup:");
  manager = self->_manager;
  if (v3)
  {
    [(CLLocationManager *)manager setDesiredAccuracy:kCLLocationAccuracyBest];
    self->_desiredLocationAccuracy = kCLLocationAccuracyHundredMeters;
    self->_desiredIntegrity = kCLLocationIntegrityLow;
    [(CLLocationManager *)self->_manager setDynamicAccuracyReductionEnabled:0];
    sub_1007B3A7C((os_log_t *)self->logger.__ptr_.__value_);
    int v6 = *(NSObject **)self->logger.__ptr_.__value_;
    sub_1007B3E2C(v6, 1);
  }
  else
  {
    [(CLLocationManager *)manager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    self->_desiredLocationAccuracy = kCLLocationAccuracyThreeKilometers;
    self->_desiredIntegrity = kCLLocationIntegrityLow;
    int v7 = self->_manager;
    [(CLLocationManager *)v7 setDynamicAccuracyReductionEnabled:1];
  }
}

- (BOOL)isLocationAcceptable:(double)a3 integrity:(unsigned int)a4 accuracy:(double)a5
{
  if ([(CTWifiLocationManager *)self forceLocationLookup])
  {
    if ([(CTWifiLocationManager *)self desiredIntegrity] > a4)
    {
      v8 = *(NSObject **)self->logger.__ptr_.__value_;
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v9) {
        return result;
      }
      int v19 = 67109120;
      LODWORD(v20) = [(CTWifiLocationManager *)self desiredIntegrity];
      v11 = "#I integrity is less than %d";
      v12 = v8;
      uint32_t v13 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, v13);
      return 0;
    }
    [(CTWifiLocationManager *)self desiredLocationAccuracy];
    if (v15 < a5)
    {
      v16 = *(NSObject **)self->logger.__ptr_.__value_;
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v17) {
        return result;
      }
      [(CTWifiLocationManager *)self desiredLocationAccuracy];
      int v19 = 134217984;
      uint64_t v20 = v18;
      v11 = "#I accuracy is worse than %f";
      v12 = v16;
      uint32_t v13 = 12;
      goto LABEL_11;
    }
    return 1;
  }
  else
  {
    v14 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I Checking only integrity for a non-precise location request.", (uint8_t *)&v19, 2u);
    }
    return [(CTWifiLocationManager *)self desiredIntegrity] <= a4;
  }
}

- (void)shouldUpdateLocation:(BOOL)a3 forceLocationLookup:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  int v7 = self->_manager;
  if (!v7)
  {
    double v15 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    LOWORD(v24) = 0;
    v16 = "#I WifiLocation manager is nil";
    BOOL v17 = v15;
    goto LABEL_25;
  }
  if ([(CTWifiLocationManager *)self isLocationServiceEnabled]) {
    goto LABEL_6;
  }
  v8 = *(NSObject **)self->logger.__ptr_.__value_;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (!v9) {
      goto LABEL_32;
    }
    LOWORD(v24) = 0;
    v16 = "#I WifiLocation services are disabled";
    BOOL v17 = v8;
LABEL_25:
    uint32_t v20 = 2;
    goto LABEL_26;
  }
  if (v9)
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I WifiLocation services are disabled. However, force location lookup is requested so we'll let it through", (uint8_t *)&v24, 2u);
  }
LABEL_6:
  if ([(CTWifiLocationManager *)self locationRequested] == v5)
  {
    if (v5 && v4 && ![(CTWifiLocationManager *)self forceLocationLookup])
    {
      [(CLLocationManager *)v7 stopUpdatingLocation];
      v23 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#I WifiLocation update was enabled for coarse location. Need more accurate location now", (uint8_t *)&v24, 2u);
      }
      goto LABEL_7;
    }
    uint64_t v18 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    int v19 = "disabled";
    if (v5) {
      int v19 = "enabled";
    }
    int v24 = 136315138;
    v25 = v19;
    v16 = "#I WifiLocation update already %s";
    BOOL v17 = v18;
    uint32_t v20 = 12;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v20);
    goto LABEL_32;
  }
LABEL_7:
  if (v5)
  {
    if (v4)
    {
      v10 = [(CTWifiLocationManager *)self locationServicesAssertion];
      BOOL v11 = v10 == 0;

      if (v11)
      {
        v12 = *(NSObject **)self->logger.__ptr_.__value_;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Acquiring Emergency location services assertion", (uint8_t *)&v24, 2u);
        }
        uint32_t v13 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/WifiCalling.bundle"];
        id v14 = +[CLEmergencyEnablementAssertion newAssertionForBundle:v13 withReason:@"Emergency Wifi calling"];
        [(CTWifiLocationManager *)self setLocationServicesAssertion:v14];
      }
    }
    [(CTWifiLocationManager *)self configureLocationManagerWithForceLocationLookup:v4];
    [(CLLocationManager *)v7 startUpdatingLocation];
  }
  else
  {
    v21 = [(CTWifiLocationManager *)self locationServicesAssertion];
    BOOL v22 = v21 == 0;

    if (!v22) {
      [(CTWifiLocationManager *)self setLocationServicesAssertion:0];
    }
    [(CLLocationManager *)v7 stopUpdatingLocation];
    if ([(CTWifiLocationManager *)self forceLocationLookup]) {
      sub_1007B408C((NSObject **)self->logger.__ptr_.__value_);
    }
  }
  [(CTWifiLocationManager *)self setLocationRequested:v5];
LABEL_32:
}

- (void)startLocationUpdateWithForceLocationLookup:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "false";
    if (v3) {
      int v6 = "true";
    }
    int v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Start WifiLocation Update. Force location lookup: %s", (uint8_t *)&v7, 0xCu);
  }
  [(CTWifiLocationManager *)self shouldUpdateLocation:1 forceLocationLookup:v3];
}

- (void)stopLocationUpdates
{
  BOOL v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Stop WifiLocation Update", v4, 2u);
  }
  [(CTWifiLocationManager *)self shouldUpdateLocation:0 forceLocationLookup:[(CTWifiLocationManager *)self forceLocationLookup]];
}

- (BOOL)isLocationServiceEnabled
{
  return +[CLLocationManager locationServicesEnabled];
}

- (id)copyLastKnownLocation
{
  if (![(CTWifiLocationManager *)self isLocationServiceEnabled]) {
    return 0;
  }
  BOOL v3 = [(CTWifiLocationManager *)self location];
  id v4 = [v3 copy];

  return v4;
}

- (BOOL)isLocationServiceDenied
{
  return self->_locationServiceDenied;
}

- (BOOL)isLocationServiceAuthorized
{
  return self->_locationServiceAuthorized;
}

- (void)registerWifiCallingEntity
{
  v2 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I CTWifiLocation registerWifiCallingEntity NOT supported", v3, 2u);
  }
}

- (void)enableVoWiFiLocationStatus:(BOOL)a3
{
  BOOL v3 = a3;
  sub_1007B3E2C(*(NSObject **)self->logger.__ptr_.__value_, a3);
  sub_1007B3F40();
  BOOL v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "'Denied'";
    if (v3) {
      int v6 = "'Authorized'";
    }
    int v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Successfully set location status to %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)handleDumpState
{
  unint64_t v3 = sub_1007B4C8C();
  id v4 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I ------ CTWifiLocationManager state ------", (uint8_t *)&v12, 2u);
    id v4 = *(NSObject **)self->logger.__ptr_.__value_;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL locationRequested = self->_locationRequested;
    BOOL locationAvailable = self->_locationAvailable;
    BOOL locationServiceDenied = self->_locationServiceDenied;
    BOOL locationServiceAuthorized = self->_locationServiceAuthorized;
    int v12 = 67109888;
    *(_DWORD *)uint32_t v13 = locationRequested;
    *(_WORD *)&v13[4] = 1024;
    *(_DWORD *)&v13[6] = locationAvailable;
    LOWORD(v14) = 1024;
    *(_DWORD *)((char *)&v14 + 2) = locationServiceDenied;
    HIWORD(v14) = 1024;
    BOOL v15 = locationServiceAuthorized;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I LocationRequested: %d, LocationAvailable: %d, LocationServiceDenied: %d, LocationServiceAuthorized: %d", (uint8_t *)&v12, 0x1Au);
    id v4 = *(NSObject **)self->logger.__ptr_.__value_;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = sub_1007B3D44();
    if (v9 > 4) {
      v10 = "???";
    }
    else {
      v10 = off_101A08FE8[v9];
    }
    if (HIDWORD(v3))
    {
      if (v3 > 4) {
        BOOL v11 = "???";
      }
      else {
        BOOL v11 = off_101A08FE8[(int)v3];
      }
    }
    else
    {
      BOOL v11 = "none";
    }
    int v12 = 136315394;
    *(void *)uint32_t v13 = v10;
    *(_WORD *)&v13[8] = 2080;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I Current status: %s, Saved status: %s", (uint8_t *)&v12, 0x16u);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  int v6 = [v5 lastObject];
  int v7 = [v6 timestamp];
  memset(&__p, 0, sizeof(__p));
  sub_100058DB0(&__p, "unknown");
  v8 = [v7 description];
  unsigned int v9 = v8;
  if (v8) {
    sub_10003ED78(&__p, (char *)[v8 UTF8String]);
  }
  [v7 timeIntervalSinceNow];
  double v11 = v10;
  [v6 horizontalAccuracy];
  double v13 = v12;
  id v14 = [v6 integrity];
  BOOL v15 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)buf = 134218498;
    double v29 = v13;
    __int16 v30 = 1024;
    int v31 = (int)v14;
    __int16 v32 = 2080;
    v33 = p_p;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I WifiLocation accuracy = %f, integrity = %d, timestamp = %s", buf, 0x1Cu);
  }
  unsigned int v17 = [(CTWifiLocationManager *)self isLocationAcceptable:v14 integrity:v11 accuracy:v13];
  uint64_t v18 = *(NSObject **)self->logger.__ptr_.__value_;
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I Desired WifiLocation Obtained", buf, 2u);
    }
    [(CTWifiLocationManager *)self setLocation:v6];
    uint32_t v20 = [(CTWifiLocationManager *)self location];
    [v20 coordinate];
    double v22 = v21;

    v23 = [(CTWifiLocationManager *)self location];
    [v23 coordinate];
    double v25 = v24;

    v26 = (uint64_t *)sub_1003514C4(&event::location::wifiLocationAvailable[1]);
    sub_1007B5B50(v26, v22, v25);
  }
  else if (v19)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#I WifiLocation not of desired accuracy and integrity", buf, 2u);
  }

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && ![v7 code])
  {
    unsigned int v9 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I WifiLocation Skipping recoverable error", v10, 2u);
    }
  }
  else
  {
    self->_BOOL locationServiceDenied = [v8 code] == (id)1;
    [(CTWifiLocationManager *)self stopLocationUpdates];
    [(CTWifiLocationManager *)self setLocationRequested:0];
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  self->_BOOL locationServiceAuthorized = a4 != 2;
  id v7 = *(NSObject **)self->logger.__ptr_.__value_;
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a4 == 2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I WifiLocation service access is NOT authorized", buf, 2u);
    }
    [(CTWifiLocationManager *)self stopLocationUpdates];
  }
  else if (v8)
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I WifiLocation service access is authorized", v9, 2u);
  }
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocation:(id)a3
{
}

- (BOOL)locationRequested
{
  return self->_locationRequested;
}

- (void)setLocationRequested:(BOOL)a3
{
  self->_BOOL locationRequested = a3;
}

- (CLAssertion)locationServicesAssertion
{
  return self->locationServicesAssertion;
}

- (void)setLocationServicesAssertion:(id)a3
{
}

- (BOOL)forceLocationLookup
{
  return self->_forceLocationLookup;
}

- (void)setForceLocationLookup:(BOOL)a3
{
  self->_forceLocationLookup = a3;
}

- (BOOL)locationAvailable
{
  return self->_locationAvailable;
}

- (void)setLocationAvailable:(BOOL)a3
{
  self->_BOOL locationAvailable = a3;
}

- (double)desiredLocationAccuracy
{
  return self->_desiredLocationAccuracy;
}

- (void)setDesiredLocationAccuracy:(double)a3
{
  self->_desiredLocationAccuracy = a3;
}

- (unsigned)desiredIntegrity
{
  return self->_desiredIntegrity;
}

- (void)setDesiredIntegrity:(unsigned int)a3
{
  self->_desiredIntegrity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->locationServicesAssertion, 0);
  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
  fObj = self->_queue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end