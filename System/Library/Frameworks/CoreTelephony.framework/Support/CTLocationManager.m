@interface CTLocationManager
+ (id)sharedManager;
- (BOOL)isLocationServiceAuthorized;
- (BOOL)isLocationServiceDenied;
- (BOOL)isLocationServiceEnabled;
- (BOOL)locationAvailable;
- (BOOL)locationRequested;
- (CLLocation)location;
- (CTLocationManager)init;
- (id).cxx_construct;
- (id)copyLastKnownLocation;
- (void)dealloc;
- (void)fetchLocationServiceEnabled;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 didVisit:(id)a4;
- (void)setLocation:(id)a3;
- (void)setLocationAvailable:(BOOL)a3;
- (void)setLocationRequested:(BOOL)a3;
- (void)shouldUpdateLocation:(BOOL)a3;
- (void)startLocationMonitoringVisitsWithReason:(const char *)a3;
- (void)startLocationUpdatesWithReason:(const char *)a3;
- (void)stopLocationMonitoringVisits;
- (void)stopLocationUpdates;
@end

@implementation CTLocationManager

+ (id)sharedManager
{
  if (qword_101B12E60 != -1) {
    dispatch_once(&qword_101B12E60, &stru_101A65E10);
  }
  v2 = (void *)qword_101B12E58;

  return v2;
}

- (CTLocationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CTLocationManager;
  v2 = [(CTLocationManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    location = v2->_location;
    v2->_location = 0;

    *(_WORD *)&v3->_locationServiceDenied = 256;
    if (v3->fLocationServiceEnabled.__engaged_) {
      v3->fLocationServiceEnabled.__engaged_ = 0;
    }
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [(CTLocationManager *)self stopLocationUpdates];
  v3.receiver = self;
  v3.super_class = (Class)CTLocationManager;
  [(CTLocationManager *)&v3 dealloc];
}

- (void)fetchLocationServiceEnabled
{
  objc_super v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I fetching locationServicesEnabled", (uint8_t *)&v7, 2u);
  }
  unsigned int v4 = +[CLLocationManager locationServicesEnabled];
  self->fLocationServiceEnabled = (optional<BOOL>)(v4 | 0x100);
  v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = "False";
    if (v4) {
      objc_super v6 = "True";
    }
    int v7 = 136315138;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I acquired locationServicesEnabled: %s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)shouldUpdateLocation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->_manager;
  if (v5)
  {
    if ([(CTLocationManager *)self isLocationServiceAuthorized])
    {
      if ([(CTLocationManager *)self locationRequested] != v3)
      {
        if (v3) {
          [(CLLocationManager *)v5 startUpdatingLocation];
        }
        else {
          [(CLLocationManager *)v5 stopUpdatingLocation];
        }
        [(CTLocationManager *)self setLocationRequested:v3];
      }
    }
    else
    {
      objc_super v6 = *(NSObject **)self->logger.__ptr_.__value_;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Location services are not authorized", v7, 2u);
      }
    }
  }
}

- (void)startLocationUpdatesWithReason:(const char *)a3
{
  v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I START LOCATION UPDATE: %s", (uint8_t *)&v6, 0xCu);
  }
  [(CTLocationManager *)self shouldUpdateLocation:1];
}

- (void)stopLocationUpdates
{
  BOOL v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I STOP LOCATION UPDATE", v4, 2u);
  }
  [(CTLocationManager *)self shouldUpdateLocation:0];
}

- (BOOL)isLocationServiceEnabled
{
  v2 = self;
  v5 = self;
  fObj = v2->_queue.fObj.fObj;
  char v7 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100E8E4DC;
  block[3] = &unk_10199E470;
  block[4] = &v7;
  block[5] = &v5;
  dispatch_sync(fObj, block);
  LOBYTE(v2) = v7;

  return (char)v2;
}

- (id)copyLastKnownLocation
{
  if (![(CTLocationManager *)self isLocationServiceAuthorized]) {
    return 0;
  }
  BOOL v3 = [(CTLocationManager *)self location];
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

- (void)startLocationMonitoringVisitsWithReason:(const char *)a3
{
  v5 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    char v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I START LOCATION MONITORING VISITS: %s", (uint8_t *)&v6, 0xCu);
  }
  [(CLLocationManager *)self->_manager startMonitoringVisits];
}

- (void)stopLocationMonitoringVisits
{
  BOOL v3 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I STOP LOCATION MONITORING VISITS", v4, 2u);
  }
  [(CLLocationManager *)self->_manager stopMonitoringVisits];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  v5 = objc_msgSend(a4, "lastObject", a3);
  int v6 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Location OK", v14, 2u);
  }
  [(CTLocationManager *)self setLocationAvailable:1];
  [(CTLocationManager *)self setLocation:v5];
  char v7 = [(CTLocationManager *)self location];
  [v7 coordinate];
  double v9 = v8;

  v10 = [(CTLocationManager *)self location];
  [v10 coordinate];
  double v12 = v11;

  v13 = (uint64_t *)sub_1003514C4(&event::location::locationAvailable[1]);
  sub_1007B5B50(v13, v9, v12);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v7 && ![v7 code])
  {
    v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Skipping recoverable error", v13, 2u);
    }
    id v9 = [v8 code];
  }
  else
  {
    self->_locationServiceDenied = [v8 code] == (id)1;
    [(CTLocationManager *)self stopLocationUpdates];
    [(CTLocationManager *)self setLocationAvailable:0];
    [(CTLocationManager *)self setLocationRequested:0];
    id v9 = [v8 code];
  }
  if (v9) {
    double v11 = "kCTErrorUnknown";
  }
  else {
    double v11 = "kCTErrorUnknownLocation";
  }
  double v12 = (uint64_t *)sub_1006EB5C4(&event::location::locationUnavailable[1]);
  sub_1006EB608(v12, (uint64_t)v11);
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  self->_locationServiceAuthorized = (a4 - 3) < 0xFFFFFFFE;
  if (a4 && a4 != 3)
  {
    [(CTLocationManager *)self stopLocationUpdates];
    if ("kPosixErrorDomain" == "kLocationErrorDomain") {
      id v7 = "kCTErrorUnknown";
    }
    else {
      id v7 = "kCTErrorNotPermitted";
    }
    double v8 = (uint64_t *)sub_1006EB5C4(&event::location::locationUnavailable[1]);
    sub_1006EB608(v8, (uint64_t)v7);
  }
  id v9 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I didChangeAuthorizationStatus - refetching locationServiceEnabled", v11, 2u);
  }
  [(CTLocationManager *)self fetchLocationServiceEnabled];
  v10 = (uint64_t *)sub_100161CDC(&event::location::locationAuthorizationChanged[1]);
  sub_10035414C(v10);
}

- (void)locationManager:(id)a3 didVisit:(id)a4
{
  id v37 = a3;
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 arrivalDate];
    double v8 = +[NSDate distantPast];
    if ([v7 isEqual:v8])
    {
      unsigned int v9 = 0;
    }
    else
    {
      double v11 = [v6 arrivalDate];
      [v11 timeIntervalSince1970];
      unsigned int v9 = v12;
    }
    v13 = [v6 departureDate];
    v14 = +[NSDate distantFuture];
    if ([v13 isEqual:v14])
    {
      unsigned int v10 = 0;
    }
    else
    {
      v15 = [v6 departureDate];
      [v15 timeIntervalSince1970];
      unsigned int v10 = v16;
    }
  }
  else
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
  }
  v17 = (uint64_t *)sub_1006630B0(&event::location::locationVisit[1]);
  unsigned int v46 = v10;
  unsigned int v47 = v9;
  long long v45 = 0uLL;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v18 = (pthread_mutex_t *)sub_100060E64(v17 + 3);
  sub_100061F70(&v50, v18);
  uint64_t v19 = v17[1];
  if (v19)
  {
    if (atomic_load_explicit((atomic_uint *volatile)(v19 + 8), memory_order_acquire) == 1) {
      sub_100663378(v17, &v50, 0, 1);
    }
    uint64_t v20 = *v17;
    uint64_t v21 = v17[1];
    if (v21) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v21 + 8), 1u, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v20 = *v17;
  }
  long long v22 = v45;
  *(void *)&long long v45 = v20;
  *((void *)&v45 + 1) = v21;
  long long v48 = v22;
  sub_10000A740((atomic_uint **)&v48 + 1);
  sub_10000A6C8(*((pthread_mutex_t **)&v61 + 1));
  sub_10000A5F8(&v50);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  uint64_t v65 = 0;
  uint64_t v66 = 10;
  v67 = (char *)&v50 + 8;
  uint64_t v68 = 0;
  v69 = &v47;
  v70 = &v46;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  v23 = (uint64_t *)sub_1006630F4((uint64_t *)&v45);
  v44[0] = &v50;
  v44[1] = v17;
  v44[2] = sub_100663F2C(v23);
  uint64_t v24 = sub_1006630F4((uint64_t *)&v45);
  sub_100060EA8((uint64_t *)(v24 + 16));
  v25 = (uint64_t *)sub_1006630F4((uint64_t *)&v45);
  uint64_t v26 = *(void *)(sub_100663F2C(v25) + 8);
  v27 = (uint64_t *)sub_1006630F4((uint64_t *)&v45);
  *(void *)&long long v42 = v26;
  *((void *)&v42 + 1) = sub_100663F2C(v27);
  *(void *)&long long v43 = &v50;
  *((void *)&v43 + 1) = *((void *)&v42 + 1);
  sub_100E8E5E0((uint64_t *)&v42);
  v28 = (uint64_t *)sub_1006630F4((uint64_t *)&v45);
  uint64_t v29 = sub_100663F2C(v28);
  v30 = (uint64_t *)sub_1006630F4((uint64_t *)&v45);
  uint64_t v38 = v29;
  uint64_t v39 = sub_100663F2C(v30);
  v40 = &v50;
  uint64_t v41 = v39;
  sub_100E8E5E0(&v38);
  long long v48 = v42;
  long long v49 = v43;
  uint64_t v31 = v38;
  uint64_t v32 = v42;
  if ((void)v42 != v38)
  {
    v33 = (unsigned char *)v49;
    BOOL v34 = *(unsigned char *)v49 == 0;
    do
    {
      if (v34)
      {
        uint64_t v35 = sub_100663138((uint64_t *)(v32 + 16));
        uint64_t v36 = sub_100663AC8((uint64_t *)(v35 + 32));
        sub_1006642E0((void *)(v36 + 24));
        if (!*v33) {
          unsigned char *v33 = 1;
        }
      }
      if (!*(unsigned char *)v49) {
        __assert_rtn("get", "optional.hpp", 1212, "this->is_initialized()");
      }
      *(void *)&long long v48 = *(void *)(v48 + 8);
      sub_100E8E5E0((uint64_t *)&v48);
      v33 = (unsigned char *)v49;
      if (*(unsigned char *)v49) {
        *(unsigned char *)long long v49 = 0;
      }
      uint64_t v32 = v48;
      BOOL v34 = 1;
    }
    while ((void)v48 != v31);
  }
  sub_100E8E95C(v44);
  sub_100E8EB24((uint64_t)&v50);
  sub_10000A740((atomic_uint **)&v45 + 1);
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
  self->_locationRequested = a3;
}

- (BOOL)locationAvailable
{
  return self->_locationAvailable;
}

- (void)setLocationAvailable:(BOOL)a3
{
  self->_locationAvailable = a3;
}

- (void).cxx_destruct
{
  fObj = self->_queue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((_WORD *)self + 24) = 0;
  return self;
}

@end