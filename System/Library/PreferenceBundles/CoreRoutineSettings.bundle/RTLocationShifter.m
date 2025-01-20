@interface RTLocationShifter
+ (BOOL)isLocationShiftRequiredForCoordinate:(CLLocationCoordinate2D)a3;
- (RTLocationShifter)init;
- (id)shiftedLocation:(id)a3 allowNetwork:(BOOL)a4 error:(id *)a5;
- (void)shiftCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 handler:(id)a5;
- (void)shiftLocation:(id)a3 handler:(id)a4;
@end

@implementation RTLocationShifter

- (RTLocationShifter)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTLocationShifter;
  v2 = [(RTLocationShifter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    geoLocationShifter = v2->_geoLocationShifter;
    v2->_geoLocationShifter = (GEOLocationShifter *)v3;
  }
  return v2;
}

- (void)shiftLocation:(id)a3 handler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  if (v7)
  {
    if ([v6 referenceFrame] == 2)
    {
      v7[2](v7, v6, 0);
    }
    else
    {
      [v6 latitude];
      CLLocationDegrees v10 = v9;
      [v6 longitude];
      CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v10, v11);
      [v6 horizontalUncertainty];
      double v14 = v13;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_143A4;
      v15[3] = &unk_1DD10;
      id v16 = v6;
      v17 = v7;
      -[RTLocationShifter shiftCoordinate:accuracy:handler:](self, "shiftCoordinate:accuracy:handler:", v15, v12.latitude, v12.longitude, v14);
    }
  }
  else
  {
    v8 = sub_139DC(&qword_21E80);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTLocationShifter shiftLocation:handler:]";
      __int16 v20 = 1024;
      int v21 = 38;
      _os_log_error_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (id)shiftedLocation:(id)a3 allowNetwork:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  if ([v8 referenceFrame] == 2)
  {
    id v9 = v8;
  }
  else if (a4)
  {
    [v8 latitude];
    CLLocationDegrees v11 = v10;
    [v8 longitude];
    CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(v11, v12);
    double v55 = 0.0;
    *(double *)&v56 = COERCE_DOUBLE(&v55);
    uint64_t v57 = 0x3010000000;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    v58 = &unk_1B35F;
    double v51 = 0.0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    uint64_t v54 = 0;
    *(void *)&long long v65 = 0;
    *((void *)&v65 + 1) = &v65;
    uint64_t v66 = 0x3032000000;
    v67 = sub_14A00;
    v68 = sub_14A10;
    id v69 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    [v8 horizontalUncertainty];
    double v16 = v15;
    v43 = _NSConcreteStackBlock;
    uint64_t v44 = 3221225472;
    v45 = sub_14A18;
    v46 = &unk_1DD38;
    v48 = &v55;
    v49 = &v51;
    v50 = &v65;
    v17 = v14;
    v47 = v17;
    -[RTLocationShifter shiftCoordinate:accuracy:handler:](self, "shiftCoordinate:accuracy:handler:", &v43, v13.latitude, v13.longitude, v16);
    dispatch_time_t v18 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v17, v18))
    {
      NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
      CFStringRef v64 = @"Timed-out attempting to shift coordinate";
      v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1, v43, v44, v45, v46);
      __int16 v20 = +[NSError errorWithDomain:RTErrorDomain code:0 userInfo:v19];

      int v21 = sub_139DC(&qword_21E80);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v42 = [v20 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v62 = v42;
        _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      if (a5) {
        *a5 = v20;
      }
      id v9 = v8;
    }
    else
    {
      if (a5) {
        *a5 = *(id *)(*((void *)&v65 + 1) + 40);
      }
      if (*(void *)(*((void *)&v65 + 1) + 40))
      {
        id v9 = v8;
      }
      else
      {
        id v36 = objc_alloc((Class)RTLocation);
        double v37 = v56[4];
        double v38 = v56[5];
        double v39 = v52[3];
        v40 = objc_msgSend(v8, "date", v43, v44, v45, v46);
        id v9 = [v36 initWithLatitude:v40 longitude:2 horizontalUncertainty:v37 date:v38 referenceFrame:v39];
      }
    }

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
  }
  else
  {
    double v55 = 0.0;
    *(double *)&v56 = 0.0;
    double v51 = 0.0;
    [v8 latitude];
    double v23 = v22;
    [v8 longitude];
    double v25 = v24;
    geoLocationShifter = self->_geoLocationShifter;
    [v8 horizontalUncertainty];
    if (-[GEOLocationShifter shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:](geoLocationShifter, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", &v55, &v51, v23, v25, v27))
    {
      id v28 = objc_alloc((Class)RTLocation);
      double v29 = v55;
      double v30 = *(double *)&v56;
      double v31 = v51;
      v32 = [v8 date];
      id v33 = [v28 initWithLatitude:v32 longitude:2 horizontalUncertainty:v29 date:v30 referenceFrame:v31];
    }
    else
    {
      NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
      CFStringRef v71 = @"Unable to shift without network allowed";
      v34 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v32 = +[NSError errorWithDomain:RTErrorDomain code:0 userInfo:v34];

      v35 = sub_139DC(&qword_21E80);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v65) = 138412290;
        *(void *)((char *)&v65 + 4) = v32;
        _os_log_error_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v65, 0xCu);
      }

      if (a5) {
        *a5 = v32;
      }
      id v33 = v8;
    }
    id v9 = v33;
  }

  return v9;
}

- (void)shiftCoordinate:(CLLocationCoordinate2D)a3 accuracy:(double)a4 handler:(id)a5
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v9 = (void (**)(id, void, double, double, double))a5;
  if (v9)
  {
    if ((+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", latitude, longitude) & 1) == 0)v9[2](v9, 0, latitude, longitude, a4); {
    v21[0] = _NSConcreteStackBlock;
    }
    v21[1] = 3221225472;
    v21[2] = sub_14CD8;
    v21[3] = &unk_1DD60;
    double v10 = v9;
    double v22 = v10;
    CLLocationDegrees v11 = objc_retainBlock(v21);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_14D2C;
    v16[3] = &unk_1DD88;
    v17 = v10;
    double v18 = latitude;
    double v19 = longitude;
    double v20 = a4;
    CLLocationDegrees v12 = objc_retainBlock(v16);
    geoLocationShifter = self->_geoLocationShifter;
    dispatch_semaphore_t v14 = dispatch_get_global_queue(0, 0);
    -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](geoLocationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v11, 0, v12, v14, latitude, longitude, a4);

    double v15 = v22;
  }
  else
  {
    double v15 = sub_139DC(&qword_21E80);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v24 = "-[RTLocationShifter shiftCoordinate:accuracy:handler:]";
      __int16 v25 = 1024;
      int v26 = 144;
      _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

+ (BOOL)isLocationShiftRequiredForCoordinate:(CLLocationCoordinate2D)a3
{
  return +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:", a3.latitude, a3.longitude);
}

- (void).cxx_destruct
{
}

@end