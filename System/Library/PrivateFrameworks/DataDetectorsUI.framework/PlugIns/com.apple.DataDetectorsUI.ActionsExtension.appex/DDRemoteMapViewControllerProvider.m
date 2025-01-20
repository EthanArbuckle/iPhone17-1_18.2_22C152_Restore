@interface DDRemoteMapViewControllerProvider
- (void)createViewControllerWithCompletionHandler:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)removeLocationManager;
@end

@implementation DDRemoteMapViewControllerProvider

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  v5 = [(DDRemoteMapViewControllerProvider *)self actionContext];
  id v6 = [v5 result];

  v72 = self;
  v7 = [(DDRemoteMapViewControllerProvider *)self actionContext];
  v8 = [v7 URL];

  if (v6)
  {
    if (DDResultHasType())
    {
      v9 = DDResultGetMatchedString();
      BOOL v73 = DDResultGetSubresultWithType() != 0;
      CountryCode = (void *)DDResultGetCountryCode();
      if (v9)
      {
        v10 = v9;
        id v11 = 0;
        v80 = 0;
        char v12 = 0;
        char v13 = 1;
        v82 = v10;
        v78 = v10;
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    if (DDResultGetCategory() == 1)
    {
      v16 = (void *)DDResultCopyExtractedURL();
      if (v16)
      {
        v17 = +[NSURL URLWithString:v16];
        v18 = v17;
        if (v17)
        {
          id v19 = v17;
          if (objc_msgSend(v17, "dd_isMaps:", 0)) {
            goto LABEL_18;
          }
        }
      }
      else
      {
        v18 = 0;
      }
      id v19 = v8;

      if (!v19)
      {
        id v14 = 0;
        id v11 = 0;
LABEL_20:

        if (!v11)
        {
LABEL_21:
          if (v14)
          {
            v80 = v14;
            v82 = [v14 value];
            v10 = [(__CFString *)v82 stringByRemovingPercentEncoding];
            v78 = 0;
            CountryCode = 0;
            id v11 = 0;
            BOOL v73 = 0;
            char v12 = 0;
            char v13 = 1;
            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_7:
        v15 = [v14 value];
        if ([v15 length]) {
          [v14 value];
        }
        else {
          DDLocalizedString();
        }
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v80 = v14;

        char v13 = 0;
        v78 = 0;
        CountryCode = 0;
        BOOL v73 = 0;
        char v12 = 0;
        goto LABEL_25;
      }
LABEL_18:
      uint64_t v105 = 0;
      uint64_t v106 = 0;
      DDExtractMapLocationInformationFromURL();
      id v11 = 0;
      id v14 = 0;

      goto LABEL_20;
    }
  }
  else if (v8)
  {
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    DDExtractMapLocationInformationFromURL();
    id v11 = 0;
    id v14 = 0;
    if (!v11) {
      goto LABEL_21;
    }
    goto LABEL_7;
  }
LABEL_23:
  BOOL v73 = 0;
  CountryCode = 0;
LABEL_24:
  DDLocalizedString();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  id v11 = 0;
  v80 = 0;
  char v13 = 1;
  char v12 = 1;
LABEL_25:
  v82 = &stru_10000C548;
LABEL_26:
  id v81 = objc_alloc_init((Class)UIViewController);
  v20 = [v81 view];
  id v21 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v21 setText:v10];
  [v21 setNumberOfLines:10];
  [v21 setTextAlignment:1];
  [v21 setLineBreakMode:4];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 addSubview:v21];
  v22 = +[NSLayoutConstraint constraintWithItem:v21 attribute:9 relatedBy:0 toItem:v20 attribute:9 multiplier:1.0 constant:0.0];
  [v20 addConstraint:v22];

  v23 = +[NSLayoutConstraint constraintWithItem:v21 attribute:7 relatedBy:0 toItem:v20 attribute:7 multiplier:1.0 constant:-10.0];
  [v20 addConstraint:v23];

  v24 = +[NSLayoutConstraint constraintWithItem:v21 attribute:10 relatedBy:0 toItem:v20 attribute:10 multiplier:1.0 constant:0.0];
  [v20 addConstraint:v24];

  [v20 sizeToFit];
  id v25 = +[CLInUseAssertion newAssertionForBundleIdentifier:@"com.apple.Maps" withReason:@"Data Detectors Address Preview" level:1];
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_100005CD0;
  v97[3] = &unk_10000C3E8;
  id v77 = v20;
  id v98 = v77;
  id v26 = v21;
  id v99 = v26;
  char v102 = v12;
  v27 = v10;
  v100 = v27;
  id v28 = v25;
  id v101 = v28;
  v29 = objc_retainBlock(v97);
  v30 = (void (**)(void, void, void))v29;
  if ((v13 & 1) == 0)
  {
    id v75 = v28;
    id v76 = v26;
    v50 = v27;
    v31 = v11;
    v51 = [v11 value];
    v52 = [v51 componentsSeparatedByString:@","];
    if ([v52 count] == (id)2)
    {
      v53 = [v52 firstObject];
      [v53 doubleValue];
      double v55 = v54;

      v56 = [v52 lastObject];
      [v56 doubleValue];
      double v58 = v57;

      id v59 = [objc_alloc((Class)CLLocation) initWithLatitude:v55 longitude:v58];
      v60 = v4;
      id v61 = objc_alloc((Class)CLCircularRegion);
      [v59 coordinate];
      id v62 = objc_msgSend(v61, "initWithCenter:radius:identifier:", @"DDInternalConversion");
      v63 = v8;
      id v64 = [objc_alloc((Class)CLPlacemark) initWithLocation:v59 addressDictionary:0 region:v62 areasOfInterest:0];
      ((void (**)(void, id, void))v30)[2](v30, v64, 0);

      v8 = v63;
      v31 = v11;

      v4 = v60;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v108 = v51;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map Preview: Provided lat/long coordinates '%@' are invalid.", buf, 0xCu);
      }
      v30[2](v30, 0, 0);
    }
    v40 = CountryCode;
    v48 = v81;
    v32 = v82;
    v4[2](v4, v81);

    v27 = v50;
    goto LABEL_47;
  }
  v31 = v11;
  v32 = v82;
  if (v82)
  {
    id v75 = v28;
    id v76 = v26;
    v70 = v27;
    v33 = v8;
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_100006144;
    v93[3] = &unk_10000C410;
    v68 = v29;
    id v95 = v68;
    v71 = v4;
    v67 = v4;
    v96 = v67;
    id v66 = v81;
    id v94 = v66;
    v34 = objc_retainBlock(v93);
    v35 = +[GEOMapService sharedService];
    v36 = [v35 defaultTraits];
    [v36 setAppIdentifier:@"com.apple.Maps"];
    [v36 setPhotosCount:0];
    [v36 setIsAPICall:0];
    v37 = [(__CFString *)v82 stringByRemovingPercentEncoding];
    v38 = [v37 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_100006274;
    v87[3] = &unk_10000C488;
    id v39 = v36;
    id v88 = v39;
    v40 = CountryCode;
    id v89 = CountryCode;
    id v69 = v35;
    id v90 = v69;
    id v41 = v38;
    id v91 = v41;
    v42 = v34;
    id v92 = v42;
    v43 = objc_retainBlock(v87);
    if (v73 || ![v41 length])
    {
      ((void (*)(void *, void, void))v43[2])(v43, 0, 0);
      v4 = v71;
      v8 = v33;
      v48 = v81;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v49 = "Map Preview: NOT Fetching user loc";
        goto LABEL_41;
      }
    }
    else
    {
      id v74 = v39;
      v4 = v71;
      v8 = v33;
      if ((int)+[CLLocationManager authorizationStatusForBundleIdentifier:@"com.apple.Maps"] < 3)
      {
        v48 = v81;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map Preview: not authorized to fetch user loc", buf, 2u);
        }
        id v65 = objc_alloc_init((Class)CLGeocoder);
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_100006664;
        v83[3] = &unk_10000C410;
        v85 = v68;
        v86 = v67;
        id v84 = v66;
        [v65 geocodeAddressString:v82 completionHandler:v83];

        id v39 = v74;
        goto LABEL_46;
      }
      [(DDRemoteMapViewControllerProvider *)v72 removeLocationManager];
      v44 = objc_retainBlock(v43);
      id locationHandler = v72->_locationHandler;
      v72->_id locationHandler = v44;

      v46 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundleIdentifier:@"com.apple.Maps" delegate:v72 onQueue:&_dispatch_main_q];
      locationManager = v72->_locationManager;
      v72->_locationManager = v46;

      [(CLLocationManager *)v72->_locationManager setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
      [(CLLocationManager *)v72->_locationManager startUpdatingLocation];
      v48 = v81;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v49 = "Map Preview: Fetching user loc";
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v49, buf, 2u);
      }
    }
LABEL_46:

    v32 = v82;
    v27 = v70;
LABEL_47:
    id v28 = v75;
    id v26 = v76;
    goto LABEL_48;
  }
  ((void (*)(void *, void, void))v29[2])(v29, 0, 0);
  v48 = v81;
  v4[2](v4, v81);
  v40 = CountryCode;
LABEL_48:
}

- (void)removeLocationManager
{
  locationManager = self->_locationManager;
  if (locationManager)
  {
    [(CLLocationManager *)locationManager setDelegate:0];
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    v4 = self->_locationManager;
    self->_locationManager = 0;
  }
  id locationHandler = self->_locationHandler;
  if (locationHandler)
  {
    self->_id locationHandler = 0;
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  v10 = (CLLocationManager *)a3;
  id v6 = a4;
  locationManager = self->_locationManager;
  if (locationManager) {
    BOOL v8 = locationManager == v10;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (self->_locationHandler)
    {
      v9 = [(CLLocationManager *)v10 location];
      (*((void (**)(void))self->_locationHandler + 2))();
    }
    [(DDRemoteMapViewControllerProvider *)self removeLocationManager];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  locationManager = self->_locationManager;
  if (locationManager) {
    BOOL v5 = locationManager == a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    (*((void (**)(void))self->_locationHandler + 2))();
    [(DDRemoteMapViewControllerProvider *)self removeLocationManager];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationHandler, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end