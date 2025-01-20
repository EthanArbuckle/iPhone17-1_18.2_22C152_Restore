@interface CALocationDelegateProxy
- (CALocationDelegateProxy)initWithDelegate:(LocationDelegate *)a3 withAccuracy:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation CALocationDelegateProxy

- (CALocationDelegateProxy)initWithDelegate:(LocationDelegate *)a3 withAccuracy:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CALocationDelegateProxy;
  result = [(CALocationDelegateProxy *)&v7 init];
  if (result)
  {
    result->locationDelegate_ = a3;
    result->accuracy_ = a4;
  }
  return result;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->locationDelegate_)
  {
    v8 = [v6 location];
    [v8 coordinate];
    double v10 = v9;
    [v8 coordinate];
    double v11 = round(v10 * 100.0) / 100.0;
    v13 = qword_10015EF78;
    double v14 = round(v12 * 100.0) / 100.0;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v19 = 0xBFF0000000000000;
      if (!self->accuracy_) {
        unint64_t v19 = kCLLocationAccuracyAggressivePrecisionReduction;
      }
      *(_DWORD *)buf = 134218497;
      unint64_t v27 = v19;
      __int16 v28 = 2049;
      double v29 = v11;
      __int16 v30 = 2049;
      double v31 = v14;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[LocationRelay] Location updated for accuracy %f: Current {Lat: %{private}f, Lng: %{private}f}", buf, 0x20u);
    }
    locationDelegate = self->locationDelegate_;
    unsigned __int8 v16 = [v8 signalEnvironmentType];
    int accuracy = self->accuracy_;
    v20[0] = 1;
    double v21 = v11;
    double v22 = v14;
    unsigned __int8 v23 = v16;
    int v24 = accuracy;
    (*((void (**)(id *__return_ptr, LocationDelegate *, char *))locationDelegate->var0 + 3))(&v25, locationDelegate, v20);
    id v18 = v25;
    id v25 = 0;
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->locationDelegate_)
  {
    v8 = (id)qword_10015EF78;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (self->accuracy_) {
        unint64_t v10 = 0xBFF0000000000000;
      }
      else {
        unint64_t v10 = kCLLocationAccuracyAggressivePrecisionReduction;
      }
      id v11 = [v7 localizedDescription];
      *(_DWORD *)buf = 134218242;
      unint64_t v14 = v10;
      __int16 v15 = 2080;
      id v16 = [v11 UTF8String];
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[LocationRelay] Encountered error while querying location for accuracy %f: %s", buf, 0x16u);
    }
    (*((void (**)(id *__return_ptr))self->locationDelegate_->var0 + 3))(&v12);
    id v9 = v12;
    id v12 = 0;
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  if (self->locationDelegate_)
  {
    v5 = (id)qword_10015EF78;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int accuracy = self->accuracy_;
      unsigned int v7 = [v4 authorizationStatus];
      if (accuracy) {
        uint64_t v8 = 0xBFF0000000000000;
      }
      else {
        uint64_t v8 = kCLLocationAccuracyAggressivePrecisionReduction;
      }
      if (v7 > 4) {
        id v9 = "AuthorizedUnknown";
      }
      else {
        id v9 = off_1001572D0[v7];
      }
      sub_100015438(v12, v9);
      sub_100101BB8((char *)v12, buf, v8, v5);
    }

    (*((void (**)(id *__return_ptr))self->locationDelegate_->var0 + 4))(&v11);
    id v10 = v11;
    id v11 = 0;
  }
}

@end