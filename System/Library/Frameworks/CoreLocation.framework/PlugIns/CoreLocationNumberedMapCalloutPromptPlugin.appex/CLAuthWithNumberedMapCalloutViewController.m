@interface CLAuthWithNumberedMapCalloutViewController
+ (id)effectiveBundlePath;
- (BOOL)showMapView;
- (CLLocation)currentLocation;
- (CLLocationUpdater)updater;
- (NSArray)annotationDict;
- (NSMutableArray)annotationViews;
- (NSString)mapCountLabelString;
- (NSString)mapSubMessageString;
- (UILabel)mapCountSubLabel;
- (UILabel)mapSubLabel;
- (id)demandCreateLocationManager;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)configureCallouts;
- (void)configureMapSubLabels;
- (void)configureMapView;
- (void)loadView;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)setAnnotationDict:(id)a3;
- (void)setAnnotationViews:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setMapCountLabelString:(id)a3;
- (void)setMapCountSubLabel:(id)a3;
- (void)setMapSubLabel:(id)a3;
- (void)setMapSubMessageString:(id)a3;
- (void)setShowMapView:(BOOL)a3;
- (void)setUpdater:(id)a3;
- (void)updateMapLayout;
- (void)viewDidLayoutSubviews;
@end

@implementation CLAuthWithNumberedMapCalloutViewController

- (void)loadView
{
  v18.receiver = self;
  v18.super_class = (Class)CLAuthWithNumberedMapCalloutViewController;
  [(CLAuthBaseViewController *)&v18 loadView];
  [(CLAuthWithNumberedMapCalloutViewController *)self setShowMapView:0];
  [(CLAuthWithNumberedMapCalloutViewController *)self setCurrentLocation:0];
  [(CLAuthWithNumberedMapCalloutViewController *)self setMapSubLabel:0];
  [(CLAuthWithNumberedMapCalloutViewController *)self setMapCountSubLabel:0];
  v3 = [(CLAuthBaseViewController *)self extensionInputItems];
  v4 = [v3 firstObject];

  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"kTCCNotificationExtensionClientDataKey"];

  v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"kTCCNotificationExtensionDaemonDataKey"];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20[0] = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "daemonDictionary %{private}@", buf, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v20[0] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "clientDictionary %{private}@", buf, 0xCu);
  }
  v9 = [v6 objectForKeyedSubscript:@"mapLabelArrayForCalloutsKey"];
  [(CLAuthWithNumberedMapCalloutViewController *)self setAnnotationDict:v9];

  v10 = [v8 objectForKeyedSubscript:@"kTCCNotificationExtensionDaemonDataInfoString"];
  [(CLAuthWithNumberedMapCalloutViewController *)self setMapSubMessageString:v10];

  v11 = [v6 objectForKeyedSubscript:@"mapCentralLabelStringKey"];
  [(CLAuthWithNumberedMapCalloutViewController *)self setMapCountLabelString:v11];

  [(CLAuthWithNumberedMapCalloutViewController *)self setAnnotationViews:0];
  [(CLAuthWithNumberedMapCalloutViewController *)self setCurrentLocation:0];
  [(CLAuthWithNumberedMapCalloutViewController *)self configureMapSubLabels];
  if (+[CLLocationManager authorizationPromptMapDisplayEnabled])
  {
    v12 = [(CLAuthBaseViewController *)self locManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006CDC;
    v17[3] = &unk_100010378;
    v17[4] = self;
    v13 = [v12 liveUpdaterWithQueue:&_dispatch_main_q handler:v17];
    [(CLAuthWithNumberedMapCalloutViewController *)self setUpdater:v13];

    v14 = [(CLAuthWithNumberedMapCalloutViewController *)self updater];
    [v14 resume];
  }
  else
  {
    if (qword_100015CC8 != -1) {
      dispatch_once(&qword_100015CC8, &stru_1000103B8);
    }
    v15 = qword_100015CD0;
    if (os_log_type_enabled((os_log_t)qword_100015CD0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      LODWORD(v20[0]) = 0;
      WORD2(v20[0]) = 2082;
      *(void *)((char *)v20 + 6) = &unk_10000D8BD;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"can't show prompt because authorizationPromptMapDisplayEnabled == false\"}", buf, 0x12u);
    }
    if (qword_100015CC8 != -1) {
      dispatch_once(&qword_100015CC8, &stru_1000103B8);
    }
    v16 = qword_100015CD0;
    if (os_signpost_enabled((os_log_t)qword_100015CD0))
    {
      *(_DWORD *)buf = 68289026;
      LODWORD(v20[0]) = 0;
      WORD2(v20[0]) = 2082;
      *(void *)((char *)v20 + 6) = &unk_10000D8BD;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "can't show prompt because authorizationPromptMapDisplayEnabled == false", "{\"msg%{public}.0s\":\"can't show prompt because authorizationPromptMapDisplayEnabled == false\"}", buf, 0x12u);
    }
  }
}

- (void)configureCallouts
{
  v3 = [(CLAuthWithNumberedMapCalloutViewController *)self annotationViews];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    [(CLAuthWithNumberedMapCalloutViewController *)self setAnnotationViews:v4];

    v5 = [(CLAuthBaseViewController *)self mapView];
    v6 = [(CLAuthBaseViewController *)self mapView];
    [v6 region];
    double v8 = v7;
    double v10 = v9;
    v11 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v11, v8, v10);
    double v13 = v12;
    double v15 = v14;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174657;
      unsigned int v80 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "callout debug mode? %{private}u", buf, 8u);
    }
    v16 = +[UIColor systemBlueColor];
    id v17 = [v16 colorWithAlphaComponent:0.7];
    id v18 = [v17 CGColor];
    v19 = +[UIColor systemBlueColor];
    id v20 = [v19 colorWithAlphaComponent:0.15];
    v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v18, [v20 CGColor], 0);
    v72 = +[UIImage getFadedCircleWithDiameter:v21 withFillColors:160.0];

    double v22 = v15 + -3.0;
    id v73 = [objc_alloc((Class)UIImageView) initWithImage:v72];
    objc_msgSend(v73, "setCenter:", v13, v15 + -3.0);
    [v73 setClipsToBounds:1];
    [v73 setContentMode:1];
    v23 = [v73 layer];
    [v23 setCornerRadius:80.0];

    v24 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    [v24 addSubview:v73];

    v25 = [(CLAuthWithNumberedMapCalloutViewController *)self annotationViews];
    [v25 addObject:v73];

    v26 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    [v26 bringSubviewToFront:v73];

    id v27 = objc_alloc((Class)UIImageView);
    double v28 = v15 + -80.0;
    double v29 = v13 + -80.0;
    double v30 = v28 + -3.0;
    id v74 = objc_msgSend(v27, "initWithFrame:", v13 + -80.0, v28 + -3.0, 12.0, 12.0);
    objc_msgSend(v74, "setCenter:", v13, v22);
    v31 = +[UIColor systemBlueColor];
    v32 = +[UIImage getCircleWithDiameter:v31 withFillColor:12.0];
    [v74 setImage:v32];

    [v74 setClipsToBounds:1];
    [v74 setContentMode:1];
    v33 = [v74 layer];
    [v33 setCornerRadius:6.0];

    id v34 = +[UIColor whiteColor];
    id v35 = [v34 CGColor];
    v36 = [v74 layer];
    [v36 setBorderColor:v35];

    v37 = [v74 layer];
    [v37 setBorderWidth:1.5];

    v38 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    [v38 addSubview:v74];

    v39 = +[NSMutableArray array];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v40 = [(CLAuthWithNumberedMapCalloutViewController *)self annotationDict];
    id v41 = [v40 countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v76;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v76 != v42) {
            objc_enumerationMutation(v40);
          }
          v44 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          v45 = [v44 objectForKeyedSubscript:@"mapLabelCalloutTitleKey"];
          if ([v45 length]) {
            [v39 addObject:v44];
          }
        }
        id v41 = [v40 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v41);
    }

    if ((unint64_t)[v39 count] <= 3) {
      unsigned int v46 = [v39 count];
    }
    else {
      unsigned int v46 = 4;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v80 = v46;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "showing %ul callouts", buf, 8u);
    }
    switch(v46)
    {
      case 3u:
        double v49 = sub_10000913C(1u);
        double v50 = sub_10000913C(2u);
        double v51 = sub_10000913C(0);
        v48 = (double *)operator new(0x18uLL);
        double *v48 = v49;
        v48[1] = v50;
        v48[2] = v51;
        break;
      case 2u:
        double v52 = sub_10000913C(1u);
        double v53 = sub_10000913C(2u);
        v48 = (double *)operator new(0x10uLL);
        double *v48 = v52;
        v48[1] = v53;
        break;
      case 1u:
        double v47 = sub_10000913C(0);
        v48 = (double *)operator new(8uLL);
        double *v48 = v47;
        break;
      default:
        double v54 = sub_10000913C(1u);
        double v55 = sub_10000913C(2u);
        double v56 = sub_10000913C(0);
        double v57 = sub_10000913C(3u);
        v48 = (double *)operator new(0x20uLL);
        double *v48 = v54;
        v48[1] = v55;
        v48[2] = v56;
        v48[3] = v57;
        if (!v46)
        {
LABEL_31:
          operator delete(v48);

          return;
        }
        break;
    }
    uint64_t v58 = 0;
    uint64_t v59 = v46;
    do
    {
      __double2 v60 = __sincos_stret(v48[v58] * -3.14159265 / 180.0);
      v61 = [v39 objectAtIndexedSubscript:v58];
      v62 = [v61 objectForKeyedSubscript:@"mapLabelCalloutTitleKey"];

      if (qword_100015CC8 != -1) {
        dispatch_once(&qword_100015CC8, &stru_1000103B8);
      }
      v63 = qword_100015CD0;
      if (os_log_type_enabled((os_log_t)qword_100015CD0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289283;
        unsigned int v80 = 0;
        __int16 v81 = 2082;
        v82 = &unk_10000D8BD;
        __int16 v83 = 2113;
        v84 = v62;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"setting up callout\", \"title\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      v64 = +[UIImage _systemImageNamed:@"bluetooth"];
      LOBYTE(v71) = 1;
      LODWORD(v70) = 1;
      v65 = -[CLCalloutOverlay initWithFrame:title:subtitle:subtitle2:subtitleColor:subtitle2Color:image:imageSize:titleFontSize:titleNumberOfLines:titleFontWeight:titleLineBreakMode:showBackgroundPlatters:]([CLCalloutOverlay alloc], "initWithFrame:title:subtitle:subtitle2:subtitleColor:subtitle2Color:image:imageSize:titleFontSize:titleNumberOfLines:titleFontWeight:titleLineBreakMode:showBackgroundPlatters:", v62, 0, 0, 0, 0, v64, v29 + 80.0 + v60.__cosval * 80.0 + -80.0, v30 + 80.0 + v60.__sinval * 80.0 + -80.0, 160.0, 160.0, 15.0, 15.0, 9.0, UIFontWeightSemibold, v70, 4,
              v71);
      v66 = [(CLAuthWithNumberedMapCalloutViewController *)self annotationViews];
      [v66 addObject:v65];

      v67 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      [v67 addSubview:v65];

      v68 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      [v68 bringSubviewToFront:v65];

      v69 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      [v69 bringSubviewToFront:v74];

      ++v58;
    }
    while (v59 != v58);
    goto LABEL_31;
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  return 0;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a4;
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "removeFromSuperview", (void)v8);
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)configureMapSubLabels
{
  v3 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
  if (v3)
  {
  }
  else
  {
    id v4 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubMessageString];
    id v5 = [v4 length];

    if (v5)
    {
      id v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(CLAuthWithNumberedMapCalloutViewController *)self setMapSubLabel:v6];

      double v7 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

      long long v8 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v8 setLineBreakStrategy:1];

      long long v9 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v9 setNumberOfLines:0];

      long long v10 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v10 setTextAlignment:1];

      uint64_t v71 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
      long long v11 = +[UIFont fontWithDescriptor:v71 size:0.0];
      double v12 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v12 setFont:v11];

      double v13 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubMessageString];
      double v14 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v14 setText:v13];

      double v15 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      v16 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      [v15 addSubview:v16];

      v65 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      v69 = [v65 bottomAnchor];
      v64 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      v63 = [v64 bottomAnchor];
      v62 = objc_msgSend(v69, "constraintEqualToAnchor:constant:", -14.0);
      v79[0] = v62;
      v61 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      v67 = [v61 leadingAnchor];
      __double2 v60 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      id v17 = [v60 leadingAnchor];
      id v18 = [v67 constraintEqualToAnchor:v17 constant:10.0];
      v79[1] = v18;
      v19 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      id v20 = [v19 trailingAnchor];
      v21 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
      double v22 = [v21 trailingAnchor];
      v23 = [v20 constraintEqualToAnchor:v22 constant:-10.0];
      v79[2] = v23;
      v24 = +[NSArray arrayWithObjects:v79 count:3];
      +[NSLayoutConstraint activateConstraints:v24];
    }
  }
  v25 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
  if (v25) {
    goto LABEL_8;
  }
  v26 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountLabelString];
  BOOL v27 = [v26 length] == 0;

  if (!v27)
  {
    id v28 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(CLAuthWithNumberedMapCalloutViewController *)self setMapCountSubLabel:v28];

    double v29 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v30 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v30 setLineBreakStrategy:1];

    v31 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v31 setNumberOfLines:0];

    v32 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v32 setTextAlignment:1];

    v33 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
    UIFontDescriptorAttributeName v77 = UIFontDescriptorTraitsAttribute;
    UIFontDescriptorTraitKey v75 = UIFontWeightTrait;
    id v34 = +[NSNumber numberWithDouble:UIFontWeightSemibold];
    long long v76 = v34;
    id v35 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    long long v78 = v35;
    v36 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    v25 = [v33 fontDescriptorByAddingAttributes:v36];

    v37 = +[UIFont fontWithDescriptor:v25 size:0.0];
    v38 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v38 setFont:v37];

    v39 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountLabelString];
    v40 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v40 setText:v39];

    id v41 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    uint64_t v42 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v41 addSubview:v42];

    uint64_t v70 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    v72 = [v70 leadingAnchor];
    v68 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    v66 = [v68 leadingAnchor];
    v43 = objc_msgSend(v72, "constraintEqualToAnchor:constant:", 10.0);
    v74[0] = v43;
    v44 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    v45 = [v44 trailingAnchor];
    unsigned int v46 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
    double v47 = [v46 trailingAnchor];
    v48 = [v45 constraintEqualToAnchor:v47 constant:-10.0];
    v74[1] = v48;
    double v49 = +[NSArray arrayWithObjects:v74 count:2];
    +[NSLayoutConstraint activateConstraints:v49];

LABEL_8:
  }
  double v50 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
  if (v50)
  {
    double v51 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
    BOOL v52 = v51 == 0;

    if (!v52)
    {
      double v53 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
      double v54 = [v53 bottomAnchor];
      double v55 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
      double v56 = [v55 topAnchor];
      double v57 = [v54 constraintEqualToAnchor:v56 constant:-14.0];
      id v73 = v57;
      uint64_t v58 = +[NSArray arrayWithObjects:&v73 count:1];
      +[NSLayoutConstraint activateConstraints:v58];
    }
  }
  uint64_t v59 = [(CLAuthWithNumberedMapCalloutViewController *)self view];
  [v59 layoutIfNeeded];
}

- (void)configureMapView
{
  v11.receiver = self;
  v11.super_class = (Class)CLAuthWithNumberedMapCalloutViewController;
  [(CLAuthBaseViewController *)&v11 configureMapViewWithHeightOverride:220.0];
  v3 = [(CLAuthBaseViewController *)self mapView];
  [v3 setHidden:1];

  id v4 = [(CLAuthBaseViewController *)self mapView];
  id v5 = [v4 mapType];

  if (v5 == (id)105)
  {
    id v6 = [(CLAuthBaseViewController *)self mapView];
    [v6 setMapType:5];
  }
  double v7 = [(CLAuthBaseViewController *)self mapView];
  [v7 setUserTrackingMode:0];

  long long v8 = +[MKPointOfInterestFilter filterExcludingAllCategories];
  long long v9 = [(CLAuthBaseViewController *)self mapView];
  [v9 setPointOfInterestFilter:v8];

  long long v10 = [(CLAuthBaseViewController *)self mapView];
  [v10 _setShowsLabels:0];
}

- (void)updateMapLayout
{
  id v7 = [(CLAuthBaseViewController *)self mapView];
  [v7 setHidden:0];

  id v8 = [(CLAuthBaseViewController *)self mapView];
  objc_msgSend(v8, "setLayoutMargins:", 25.0, 25.0, 25.0, 25.0);

  id v9 = [(CLAuthWithNumberedMapCalloutViewController *)self currentLocation];
  [v9 coordinate];
  double v4 = v3;
  double v6 = v5;

  id v10 = [(CLAuthBaseViewController *)self mapView];
  objc_msgSend(v10, "setRegion:", v4, v6, 0.0014, 0.0014);

  [(CLAuthWithNumberedMapCalloutViewController *)self configureCallouts];
  id v11 = [(CLAuthBaseViewController *)self mapView];
  [v11 layoutIfNeeded];

  id v12 = [(CLAuthWithNumberedMapCalloutViewController *)self updater];
  [v12 pause];
}

- (void)viewDidLayoutSubviews
{
  double v3 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];

  if (v3)
  {
    double v4 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    [v4 intrinsicContentSize];
  }
  if ([(CLAuthWithNumberedMapCalloutViewController *)self showMapView])
  {
    [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
  }
  double v5 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];

  if (v5)
  {
    double v6 = [(CLAuthWithNumberedMapCalloutViewController *)self mapSubLabel];
    [v6 intrinsicContentSize];
    id v7 = [(CLAuthWithNumberedMapCalloutViewController *)self mapCountSubLabel];
    if (!v7) {
      [(CLAuthWithNumberedMapCalloutViewController *)self showMapView];
    }
  }
  [(CLAuthWithNumberedMapCalloutViewController *)self preferredContentSize];

  -[CLAuthWithNumberedMapCalloutViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (id)demandCreateLocationManager
{
  id v2 = objc_alloc((Class)CLLocationManager);
  double v3 = [(id)objc_opt_class() effectiveBundlePath];
  id v4 = [v2 initWithEffectiveBundlePath:v3];

  return v4;
}

+ (id)effectiveBundlePath
{
  return @"/System/Library/LocationBundles/LocationPromptUI.bundle";
}

- (BOOL)showMapView
{
  return self->_showMapView;
}

- (void)setShowMapView:(BOOL)a3
{
  self->_showMapView = a3;
}

- (CLLocationUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (NSString)mapCountLabelString
{
  return self->_mapCountLabelString;
}

- (void)setMapCountLabelString:(id)a3
{
}

- (NSString)mapSubMessageString
{
  return self->_mapSubMessageString;
}

- (void)setMapSubMessageString:(id)a3
{
}

- (UILabel)mapCountSubLabel
{
  return self->_mapCountSubLabel;
}

- (void)setMapCountSubLabel:(id)a3
{
}

- (UILabel)mapSubLabel
{
  return self->_mapSubLabel;
}

- (void)setMapSubLabel:(id)a3
{
}

- (NSArray)annotationDict
{
  return self->_annotationDict;
}

- (void)setAnnotationDict:(id)a3
{
}

- (NSMutableArray)annotationViews
{
  return self->_annotationViews;
}

- (void)setAnnotationViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationViews, 0);
  objc_storeStrong((id *)&self->_annotationDict, 0);
  objc_storeStrong((id *)&self->_mapSubLabel, 0);
  objc_storeStrong((id *)&self->_mapCountSubLabel, 0);
  objc_storeStrong((id *)&self->_mapSubMessageString, 0);
  objc_storeStrong((id *)&self->_mapCountLabelString, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_updater, 0);
}

@end