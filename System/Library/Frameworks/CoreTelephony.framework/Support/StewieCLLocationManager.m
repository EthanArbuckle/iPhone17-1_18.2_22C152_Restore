@interface StewieCLLocationManager
- (StewieCLLocationManager)initWithQueue:(id)a3 locationDataCallback:(void *)a4 authorizationChangedCallback:(void *)a5;
- (id).cxx_construct;
- (void)configureAccuracy:(int)a3;
- (void)configureAccuracyBest;
- (void)configureAccuracyBystander;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)reEvaluate;
- (void)setEmergency:(BOOL)a3;
- (void)setLocationUpdateRequested:(BOOL)a3;
- (void)setupManager:(int)a3;
- (void)updateLocationAuthStatus:(int)a3;
@end

@implementation StewieCLLocationManager

- (StewieCLLocationManager)initWithQueue:(id)a3 locationDataCallback:(void *)a4 authorizationChangedCallback:(void *)a5
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)StewieCLLocationManager;
  if ([(StewieCLLocationManager *)&v9 init])
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v8, kCtLoggingSystemName, "stw.loc.mgr");
    operator new();
  }

  return 0;
}

- (void)configureAccuracyBest
{
  v3 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Configuring for location accuracy - best, no distance filter", v4, 2u);
  }

  [(CLLocationManager *)self->fLocationManager setDesiredAccuracy:kCLLocationAccuracyBest];
  [(CLLocationManager *)self->fLocationManager setDistanceFilter:kCLDistanceFilterNone];
}

- (void)configureAccuracyBystander
{
  v3 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Configuring for location accuracy - bystander, distance filter of 100 meters", v4, 2u);
  }

  [(CLLocationManager *)self->fLocationManager setDesiredAccuracy:2147483650.0];
  [(CLLocationManager *)self->fLocationManager setDistanceFilter:100.0];
}

- (void)configureAccuracy:(int)a3
{
  if (a3)
  {
    if (a3 == 1) {
      [(StewieCLLocationManager *)self configureAccuracyBest];
    }
  }
  else
  {
    [(StewieCLLocationManager *)self configureAccuracyBystander];
  }
}

- (void)setupManager:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Setting up manager", v10, 2u);
  }

  id v6 = objc_alloc((Class)CLLocationManager);
  v7 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/Bifrost.bundle"];
  v8 = (CLLocationManager *)[v6 initWithEffectiveBundle:v7 delegate:self onQueue:self->fQueue];
  fLocationManager = self->fLocationManager;
  self->fLocationManager = v8;

  [(StewieCLLocationManager *)self configureAccuracy:v3];
  [(CLLocationManager *)self->fLocationManager setDynamicAccuracyReductionEnabled:0];
}

- (void)reEvaluate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  int fLocationAuthStatus = self->fLocationAuthStatus;
  BOOL v4 = (fLocationAuthStatus | 2) == 2 || fLocationAuthStatus == 3 && self->fIsEmergency;
  BOOL v6 = self->fLocationUpdateRequested && v4;
  v7 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = self->fLocationAuthStatus;
    if (v8 > 3) {
      objc_super v9 = "???";
    }
    else {
      objc_super v9 = off_101A69708[v8];
    }
    CFStringRef v10 = @"YES";
    BOOL fLocationUpdateRequested = self->fLocationUpdateRequested;
    if (self->fIsEmergency) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    int v15 = 136315650;
    if (!fLocationUpdateRequested) {
      CFStringRef v10 = @"NO";
    }
    v16 = v9;
    __int16 v17 = 2112;
    CFStringRef v18 = v12;
    __int16 v19 = 2112;
    CFStringRef v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I Auth status: %s, isEmergency: %@, Location update requested: %@", (uint8_t *)&v15, 0x20u);
  }

  if (self->fStartedLocationUpdates != v6)
  {
    self->fStartedLocationUpdates = v6;
    v13 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v14)
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Start updating location", (uint8_t *)&v15, 2u);
      }

      [(CLLocationManager *)self->fLocationManager startUpdatingLocation];
    }
    else
    {
      if (v14)
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Stop updating location", (uint8_t *)&v15, 2u);
      }

      [(CLLocationManager *)self->fLocationManager stopUpdatingLocation];
    }
  }
}

- (void)updateLocationAuthStatus:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fLocationAuthStatus != a3)
  {
    v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t fLocationAuthStatus = self->fLocationAuthStatus;
      if (fLocationAuthStatus > 3) {
        v7 = "???";
      }
      else {
        v7 = off_101A69708[fLocationAuthStatus];
      }
      if (a3 > 3) {
        uint64_t v8 = "???";
      }
      else {
        uint64_t v8 = off_101A69708[a3];
      }
      *(_DWORD *)CFStringRef v10 = 136315394;
      *(void *)&v10[4] = v7;
      __int16 v11 = 2080;
      CFStringRef v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Auth status changed from:%s to %s", v10, 0x16u);
    }

    self->uint64_t fLocationAuthStatus = a3;
    f = self->fAuthorizationChangedCallback.__f_.__f_;
    *(_DWORD *)CFStringRef v10 = a3;
    if (!f) {
      sub_10007B600();
    }
    (*(void (**)(void *, unsigned char *))(*(void *)f + 48))(f, v10);
    [(StewieCLLocationManager *)self reEvaluate];
  }
}

- (void)setEmergency:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fIsEmergency == v3) {
    return;
  }
  self->fIsEmergency = v3;
  v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I isEmergency: %@", buf, 0xCu);
  }

  if (!self->fIsEmergency)
  {
    CFStringRef v10 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (self->fAssertion.__ptr_) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I [Stewie + Compass] Releasing CLECEA/CLEPTO (if required). Assertion exists: %@", buf, 0xCu);
    }

    cntrl = self->fAssertion.__cntrl_;
    self->fAssertion.__ptr_ = 0;
    self->fAssertion.__cntrl_ = 0;
    if (!cntrl) {
      return;
    }
LABEL_17:
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
    return;
  }
  ptr = self->fAssertion.__ptr_;
  uint64_t v8 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (ptr)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I [Stewie + Compass] CLECEA/CLEPTO already exists", buf, 2u);
    }

    return;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I [Stewie + Compass] Acquiring CLECEA/CLEPTO", buf, 2u);
  }

  unsigned __int8 v14 = 1;
  unsigned __int8 v13 = 1;
  sub_100ECFEE0(&v14, &v13, buf);
  cntrl = self->fAssertion.__cntrl_;
  self->fAssertion = *(shared_ptr<void> *)buf;
  if (cntrl) {
    goto LABEL_17;
  }
}

- (void)setLocationUpdateRequested:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (self->fLocationUpdateRequested != v3)
  {
    self->BOOL fLocationUpdateRequested = v3;
    v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Location update is requested: %@", (uint8_t *)&v7, 0xCu);
    }

    [(StewieCLLocationManager *)self reEvaluate];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (![v5 code])
  {
    BOOL v9 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I Still waiting to get location fix. Info: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_10;
  }
  id v6 = [v5 code];
  value = self->fLogger.__ptr_.__value_;
  if (v6 != (id)1)
  {
    BOOL v9 = sub_100200FB4((id *)value);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Got error. Error: %@", (uint8_t *)&v10, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  CFStringRef v8 = sub_100200FB4((id *)value);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Denied; Error: %@", (uint8_t *)&v10, 0xCu);
  }

  [(StewieCLLocationManager *)self updateLocationAuthStatus:1];
LABEL_11:
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  unsigned int v4 = +[CLLocationManager locationServicesEnabled];
  unsigned int v5 = [v7 authorizationStatus];
  if (v5 <= 4 && ((1 << v5) & 0x19) != 0)
  {
    uint64_t v6 = 2;
  }
  else if (v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 3;
  }
  [(StewieCLLocationManager *)self updateLocationAuthStatus:v6];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  CFStringRef v8 = [v7 lastObject];
  [v8 horizontalAccuracy];
  if (v9 >= 0.0)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    if ([v8 integrity] >= 0x19)
    {
      if ([v8 integrity] >= 0x32)
      {
        if ([v8 integrity] < 0x4B) {
          char v10 = 2;
        }
        else {
          char v10 = 3;
        }
      }
      else
      {
        char v10 = 1;
      }
      BYTE11(v38) = v10;
      id v11 = [v8 timestamp];
      [v11 timeIntervalSince1970];
      uint64_t v13 = (uint64_t)(v12 * 1000000.0);

      v33[0] = v13;
      [v8 coordinate];
      v33[1] = v14;
      [v8 coordinate];
      v33[2] = v15;
      [v8 altitude];
      uint64_t v34 = v16;
      [v8 ellipsoidalAltitude];
      uint64_t v35 = v17;
      [v8 horizontalAccuracy];
      *(void *)&long long v36 = v18;
      [v8 verticalAccuracy];
      double v20 = v19;
      *((double *)&v36 + 1) = v19;
      v21 = [v8 sourceInformation];

      if (v21)
      {
        v22 = [v8 sourceInformation];
        unsigned __int16 v23 = (unsigned __int16)[v22 isSimulatedBySoftware];
        v24 = [v8 sourceInformation];
        if ([v24 isProducedByAccessory]) {
          __int16 v25 = 256;
        }
        else {
          __int16 v25 = 0;
        }
        BYTE10(v38) = 1;
        WORD4(v38) = v25 | v23;
      }
      if (v20 < 0.0)
      {
        *((void *)&v36 + 1) = 0;
        uint64_t v34 = 0;
        uint64_t v35 = 0;
      }
      double fHorizontalScalingFactor = self->fHorizontalScalingFactor;
      [v8 horizontalAccuracy];
      *(double *)&long long v37 = fHorizontalScalingFactor * v27;
      double fVerticalScalingFactor = self->fVerticalScalingFactor;
      [v8 verticalAccuracy];
      *((double *)&v37 + 1) = fVerticalScalingFactor * v29;
      [v8 speed];
      if (v30 >= 0.0)
      {
        [v8 speed];
        *(void *)&long long v38 = v31;
      }
      f = self->fLocationDataCallback.__f_.__f_;
      if (!f) {
        sub_10007B600();
      }
      (*(void (**)(void *, void *))(*(void *)f + 48))(f, v33);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fLocationManager, 0);
  cntrl = self->fAssertion.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  sub_10026FAA0(self->fAuthorizationChangedCallback.__f_.__buf_.__lx);
  sub_10026F674(self->fLocationDataCallback.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->fQueue, 0);

  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  return self;
}

@end