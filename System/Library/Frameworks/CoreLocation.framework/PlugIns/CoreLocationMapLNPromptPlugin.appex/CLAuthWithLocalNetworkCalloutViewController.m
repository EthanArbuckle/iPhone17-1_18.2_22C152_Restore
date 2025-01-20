@interface CLAuthWithLocalNetworkCalloutViewController
- (BOOL)showMapView;
- (NSArray)annotationDict;
- (NSMutableArray)callouts;
- (NSString)mapSubMessageString;
- (UILabel)mapSubLabel;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)configureCallouts;
- (void)configureMapSubLabels;
- (void)configureMapView;
- (void)loadView;
- (void)setAnnotationDict:(id)a3;
- (void)setCallouts:(id)a3;
- (void)setMapSubLabel:(id)a3;
- (void)setMapSubMessageString:(id)a3;
- (void)setShowMapView:(BOOL)a3;
- (void)updateMapLayout;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation CLAuthWithLocalNetworkCalloutViewController

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)CLAuthWithLocalNetworkCalloutViewController;
  [(CLAuthBaseViewController *)&v16 loadView];
  [(CLAuthWithLocalNetworkCalloutViewController *)self setShowMapView:0];
  [(CLAuthWithLocalNetworkCalloutViewController *)self setMapSubLabel:0];
  v3 = [(CLAuthBaseViewController *)self extensionInputItems];
  v4 = [v3 firstObject];

  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"kTCCNotificationExtensionClientDataKey"];

  v7 = [v4 userInfo];
  v8 = [v7 objectForKeyedSubscript:@"kTCCNotificationExtensionDaemonDataKey"];

  if (qword_100015DA8 != -1) {
    dispatch_once(&qword_100015DA8, &stru_100010328);
  }
  v9 = qword_100015DB0;
  if (os_log_type_enabled((os_log_t)qword_100015DB0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    int v18 = 0;
    __int16 v19 = 2082;
    v20 = "";
    __int16 v21 = 2113;
    v22 = v8;
    __int16 v23 = 2113;
    v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"loadView\", \"daemonDictionary\":%{private, location:escape_only}@, \"clientDictionary\":%{private, location:escape_only}@}", buf, 0x26u);
  }
  v10 = [v6 objectForKeyedSubscript:@"mapLabelArrayForCalloutsKey"];
  [(CLAuthWithLocalNetworkCalloutViewController *)self setAnnotationDict:v10];

  v11 = [v8 objectForKeyedSubscript:@"kTCCNotificationExtensionDaemonDataInfoString"];
  [(CLAuthWithLocalNetworkCalloutViewController *)self setMapSubMessageString:v11];

  [(CLAuthWithLocalNetworkCalloutViewController *)self configureMapSubLabels];
  v12 = [(CLAuthWithLocalNetworkCalloutViewController *)self annotationDict];
  BOOL v13 = [v12 count] == 0;

  if (!v13)
  {
    if (+[CLLocationManager authorizationPromptMapDisplayEnabled])
    {
      [(CLAuthWithLocalNetworkCalloutViewController *)self setShowMapView:1];
      [(CLAuthWithLocalNetworkCalloutViewController *)self updateMapLayout];
    }
    else
    {
      if (qword_100015DA8 != -1) {
        dispatch_once(&qword_100015DA8, &stru_100010328);
      }
      v14 = qword_100015DB0;
      if (os_log_type_enabled((os_log_t)qword_100015DB0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v18 = 0;
        __int16 v19 = 2082;
        v20 = "";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"can't show prompt because authorizationPromptMapDisplayEnabled == false\"}", buf, 0x12u);
      }
      if (qword_100015DA8 != -1) {
        dispatch_once(&qword_100015DA8, &stru_100010328);
      }
      v15 = qword_100015DB0;
      if (os_signpost_enabled((os_log_t)qword_100015DB0))
      {
        *(_DWORD *)buf = 68289026;
        int v18 = 0;
        __int16 v19 = 2082;
        v20 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "can't show prompt because authorizationPromptMapDisplayEnabled == false", "{\"msg%{public}.0s\":\"can't show prompt because authorizationPromptMapDisplayEnabled == false\"}", buf, 0x12u);
      }
    }
  }
}

- (void)configureCallouts
{
  v2 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];

  if (!v2)
  {
    v3 = +[NSMutableArray array];
    [(CLAuthWithLocalNetworkCalloutViewController *)self setCallouts:v3];
  }
  v4 = +[NSMutableArray array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v5 = [(CLAuthWithLocalNetworkCalloutViewController *)self annotationDict];
  id v6 = [v5 countByEnumeratingWithState:&v73 objects:v87 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v74;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v74 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        v10 = [v9 objectForKeyedSubscript:@"mapLabelCalloutTitleKey"];
        if ([v10 length]) {
          [v4 addObject:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v73 objects:v87 count:16];
    }
    while (v6);
  }

  v68 = +[NSMutableArray array];
  v11 = self;
  if ([v4 count] <= 2) {
    unsigned int v67 = [v4 count];
  }
  else {
    unsigned int v67 = 3;
  }
  if (qword_100015DA8 != -1) {
    dispatch_once(&qword_100015DA8, &stru_100010328);
  }
  v12 = qword_100015DB0;
  if (os_log_type_enabled((os_log_t)qword_100015DB0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v78 = 0;
    __int16 v79 = 2082;
    v80 = "";
    __int16 v81 = 1026;
    LODWORD(latitude) = v67;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"showing callouts\", \"calloutsToShow\":%{public}u}", buf, 0x18u);
  }
  double y = MKMapRectNull.origin.y;
  double x = MKMapRectNull.origin.x;
  double width = MKMapRectNull.size.width;
  double height = MKMapRectNull.size.height;
  if (v67)
  {
    for (uint64_t j = 0; j != v67; ++j)
    {
      v17 = [v4 objectAtIndexedSubscript:j];
      v70 = [v17 objectForKeyedSubscript:@"mapLabelCalloutLocationKey"];

      int v18 = [v70 objectForKeyedSubscript:@"mapLabelCalloutLatKey"];
      [v18 doubleValue];
      CLLocationDegrees v20 = v19;

      __int16 v21 = [v70 objectForKeyedSubscript:@"mapLabelCalloutLngKey"];
      [v21 doubleValue];
      CLLocationDegrees v23 = v22;

      CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(v20, v23);
      id v71 = objc_msgSend(objc_alloc((Class)MKPointAnnotation), "initWithCoordinate:", v24.latitude, v24.longitude);
      if (qword_100015DA8 != -1) {
        dispatch_once(&qword_100015DA8, &stru_100010328);
      }
      v25 = qword_100015DB0;
      if (os_log_type_enabled((os_log_t)qword_100015DB0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289539;
        int v78 = 0;
        __int16 v79 = 2082;
        v80 = "";
        __int16 v81 = 2049;
        CLLocationDegrees latitude = v24.latitude;
        __int16 v83 = 2049;
        CLLocationDegrees longitude = v24.longitude;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"callout with coordinate\", \"lat\":\"%{private}.08f\", \"lon\":\"%{private}.08f\"}", buf, 0x26u);
      }
      v26 = [(CLAuthBaseViewController *)self mapView];
      v27 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      objc_msgSend(v26, "convertCoordinate:toPointToView:", v27, v24.latitude, v24.longitude);
      double v29 = v28;
      double v31 = v30;

      v32 = [(CLAuthBaseViewController *)self mapView];
      objc_msgSend(v32, "setCenterCoordinate:", v24.latitude, v24.longitude);

      v33 = [v4 objectAtIndexedSubscript:j];
      double v34 = [v33 objectForKeyedSubscript:@"mapLabelCalloutTitleKey"];

      v35 = [v4 objectAtIndexedSubscript:j];
      v36 = [v35 objectForKeyedSubscript:@"mapLabelCalloutSubtitleKey"];

      v37 = [v4 objectAtIndexedSubscript:j];
      v38 = [v37 objectForKeyedSubscript:@"mapLabelCalloutSubtitle2Key"];

      if (qword_100015DA8 != -1) {
        dispatch_once(&qword_100015DA8, &stru_100010328);
      }
      v39 = qword_100015DB0;
      if (os_log_type_enabled((os_log_t)qword_100015DB0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289795;
        int v78 = 0;
        __int16 v79 = 2082;
        v80 = "";
        __int16 v81 = 2113;
        CLLocationDegrees latitude = v34;
        __int16 v83 = 2049;
        CLLocationDegrees longitude = v29;
        __int16 v85 = 2049;
        double v86 = v31;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"setting up callout\", \"title\":%{private, location:escape_only}@, \"x\":\"%{private}.5f\", \"y\":\"%{private}.5f\"}", buf, 0x30u);
      }
      v40 = +[UIImageSymbolConfiguration configurationWithWeight:7];
      v41 = +[UIImage systemImageNamed:@"wifi" withConfiguration:v40];

      v42 = [CLCalloutOverlay alloc];
      v43 = [(CLAuthBaseViewController *)self mapView];
      [v43 frame];
      double v45 = v44;
      v46 = +[UIColor secondaryLabelColor];
      v47 = +[UIColor secondaryLabelColor];
      LOBYTE(v66) = 0;
      LODWORD(v65) = 1;
      v48 = -[CLCalloutOverlay initWithFrame:title:subtitle:subtitle2:subtitleColor:subtitle2Color:image:imageSize:titleFontSize:titleNumberOfLines:titleFontWeight:titleLineBreakMode:showBackgroundPlatters:](v42, "initWithFrame:title:subtitle:subtitle2:subtitleColor:subtitle2Color:image:imageSize:titleFontSize:titleNumberOfLines:titleFontWeight:titleLineBreakMode:showBackgroundPlatters:", *(void *)&v34, v36, v38, v46, v47, v41, v29, v31, 200.0, v45, 15.0, 15.0, 9.0, UIFontWeightSemibold, v65, 4,
              v66);

      -[CLCalloutOverlay setCenter:](v48, "setCenter:", v29, v31);
      [(CLCalloutOverlay *)v48 setAnnotation:v71];
      MKMapPoint v49 = MKMapPointForCoordinate(v24);
      v50 = -[MapRect initWithRectA:rectB:]([MapRect alloc], "initWithRectA:rectB:", x, y, width, height, v49.x, v49.y, 0.0, 0.0);
      [(MapRect *)v50 rect];
      double x = v51;
      double y = v52;
      double width = v53;
      double height = v54;

      v55 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
      [v55 addObject:v48];

      v56 = [(CLAuthBaseViewController *)self mapView];
      [v56 addAnnotation:v71];

      [v68 addObject:v71];
      v11 = self;
    }
  }
  v57 = [(CLAuthBaseViewController *)v11 mapView];
  objc_msgSend(v57, "setVisibleMapRect:animated:", 0, x, y, width, height);

  if (v67)
  {
    for (uint64_t k = 0; k != v67; ++k)
    {
      v59 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      v60 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
      v61 = [v60 objectAtIndexedSubscript:k];
      [v59 addSubview:v61];

      v62 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      v63 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
      v64 = [v63 objectAtIndexedSubscript:k];
      [v62 bringSubviewToFront:v64];
    }
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 annotation];
        unsigned __int8 v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)configureMapSubLabels
{
  v3 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
  if (v3)
  {
  }
  else
  {
    v4 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubMessageString];
    id v5 = [v4 length];

    if (v5)
    {
      id v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(CLAuthWithLocalNetworkCalloutViewController *)self setMapSubLabel:v6];

      id v7 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v8 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v8 setLineBreakStrategy:1];

      v9 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v9 setNumberOfLines:0];

      v10 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v10 setTextAlignment:1];

      double v34 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
      v11 = +[UIFont fontWithDescriptor:v34 size:0.0];
      unsigned __int8 v12 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v12 setFont:v11];

      BOOL v13 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubMessageString];
      long long v14 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v14 setText:v13];

      long long v15 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      long long v16 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      [v15 addSubview:v16];

      double v31 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      v33 = [v31 bottomAnchor];
      double v30 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      double v29 = [v30 bottomAnchor];
      double v28 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", -14.0);
      v35[0] = v28;
      v27 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      v32 = [v27 leadingAnchor];
      v26 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      long long v17 = [v26 leadingAnchor];
      int v18 = [v32 constraintEqualToAnchor:v17 constant:10.0];
      v35[1] = v18;
      double v19 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
      CLLocationDegrees v20 = [v19 trailingAnchor];
      __int16 v21 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
      double v22 = [v21 trailingAnchor];
      CLLocationDegrees v23 = [v20 constraintEqualToAnchor:v22 constant:-10.0];
      v35[2] = v23;
      CLLocationCoordinate2D v24 = +[NSArray arrayWithObjects:v35 count:3];
      +[NSLayoutConstraint activateConstraints:v24];
    }
  }
  v25 = [(CLAuthWithLocalNetworkCalloutViewController *)self view];
  [v25 layoutIfNeeded];
}

- (void)configureMapView
{
  v10.receiver = self;
  v10.super_class = (Class)CLAuthWithLocalNetworkCalloutViewController;
  [(CLAuthBaseViewController *)&v10 configureMapViewWithHeightOverride:220.0];
  v3 = [(CLAuthBaseViewController *)self mapView];
  [v3 setHidden:1];

  v4 = [(CLAuthBaseViewController *)self mapView];
  [v4 setShowsUserLocation:0];

  id v5 = [(CLAuthBaseViewController *)self mapView];
  id v6 = [v5 mapType];

  if (v6 == (id)105)
  {
    id v7 = [(CLAuthBaseViewController *)self mapView];
    [v7 setMapType:5];
  }
  uint64_t v8 = [(CLAuthBaseViewController *)self mapView];
  [v8 setUserTrackingMode:0];

  v9 = [(CLAuthBaseViewController *)self mapView];
  [v9 _setShowsLabels:1];
}

- (void)updateMapLayout
{
  id v3 = [(CLAuthBaseViewController *)self mapView];
  [v3 setHidden:0];

  id v4 = [(CLAuthBaseViewController *)self mapView];
  objc_msgSend(v4, "setLayoutMargins:", 5.0, 5.0, 5.0, 5.0);

  [(CLAuthWithLocalNetworkCalloutViewController *)self configureCallouts];
  id v5 = [(CLAuthBaseViewController *)self mapView];
  [v5 layoutIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  id v3 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
  id v4 = [v3 count];

  if (v4 == (id)1)
  {
    id v5 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
    id v60 = [v5 firstObject];

    id v6 = [(CLAuthBaseViewController *)self mapView];
    id v7 = [v60 annotation];
    [v7 coordinate];
    objc_msgSend(v6, "setCenterCoordinate:zoomLevel:animated:", 0);
  }
  else
  {
    uint64_t v8 = +[NSMutableArray array];
    double y = MKMapRectNull.origin.y;
    double width = MKMapRectNull.size.width;
    double height = MKMapRectNull.size.height;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
    double v53 = height;
    double v54 = width;
    double v55 = y;
    double x = MKMapRectNull.origin.x;
    id v59 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v59)
    {
      uint64_t v58 = *(void *)v67;
      double v57 = 0.0;
      double v12 = 0.0;
      do
      {
        for (id i = 0; i != v59; id i = (char *)i + 1)
        {
          if (*(void *)v67 != v58) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          if (([v8 containsObject:v13] & 1) == 0)
          {
            [v13 calloutFrame];
            if (v14 > 0.0 || ([v13 calloutFrame], v15 > 0.0))
            {
              [v13 calloutFrame];
              if (v16 * 0.5 >= v12) {
                double v12 = v16 * 0.5;
              }
              [v13 calloutFrame];
              double v18 = v57;
              if (v17 * 0.5 >= v57) {
                double v18 = v17 * 0.5;
              }
              double v57 = v18;
              [v13 frame];
              CGFloat v20 = v19;
              [v13 frame];
              CGFloat v22 = v21;
              [v13 calloutFrame];
              CGFloat v24 = v23;
              [v13 calloutFrame];
              CGFloat v26 = v25;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              v27 = [(CLAuthWithLocalNetworkCalloutViewController *)self callouts];
              id v28 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
              if (v28)
              {
                uint64_t v29 = *(void *)v63;
                do
                {
                  for (uint64_t j = 0; j != v28; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v63 != v29) {
                      objc_enumerationMutation(v27);
                    }
                    double v31 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
                    if (v13 != v31)
                    {
                      [*(id *)(*((void *)&v62 + 1) + 8 * (void)j) frame];
                      CGFloat v33 = v32;
                      [v31 frame];
                      CGFloat v35 = v34;
                      [v31 calloutFrame];
                      CGFloat v37 = v36;
                      [v31 calloutFrame];
                      v75.size.double height = v38;
                      v74.origin.double x = v20;
                      v74.origin.double y = v22;
                      v74.size.double width = v24;
                      v74.size.double height = v26;
                      v75.origin.double x = v33;
                      v75.origin.double y = v35;
                      v75.size.double width = v37;
                      if (CGRectIntersectsRect(v74, v75))
                      {
                        [v31 removeFromSuperview];
                        v39 = [(CLAuthBaseViewController *)self mapView];
                        v40 = [v31 annotation];
                        [v39 removeAnnotation:v40];

                        [v8 addObject:v31];
                      }
                    }
                  }
                  id v28 = [v27 countByEnumeratingWithState:&v62 objects:v70 count:16];
                }
                while (v28);
              }

              v41 = [v13 annotation];
              [v41 coordinate];
              MKMapPoint v42 = MKMapPointForCoordinate(v73);

              [v13 calloutFrame];
              double v44 = v43;
              [v13 calloutFrame];
              v46 = -[MapRect initWithRectA:rectB:]([MapRect alloc], "initWithRectA:rectB:", x, v55, v54, v53, v42.x, v42.y, v44, v45);
              [(MapRect *)v46 rect];
              double v55 = v48;
              double x = v47;
              double v53 = v50;
              double v54 = v49;
            }
          }
        }
        id v59 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
      }
      while (v59);
    }
    else
    {
      double v57 = 0.0;
      double v12 = 0.0;
    }

    double v51 = [(CLAuthBaseViewController *)self mapView];
    objc_msgSend(v51, "setVisibleMapRect:edgePadding:animated:", 0, x, v55, v54, v53, v57 + 5.0, v12 + 5.0, v57 + 5.0, v12 + 5.0);
  }
}

- (void)viewDidLayoutSubviews
{
  [(CLAuthWithLocalNetworkCalloutViewController *)self showMapView];
  id v3 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];

  if (v3)
  {
    id v4 = [(CLAuthWithLocalNetworkCalloutViewController *)self mapSubLabel];
    [v4 intrinsicContentSize];
    [(CLAuthWithLocalNetworkCalloutViewController *)self showMapView];
  }
  [(CLAuthWithLocalNetworkCalloutViewController *)self preferredContentSize];

  -[CLAuthWithLocalNetworkCalloutViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (BOOL)showMapView
{
  return self->_showMapView;
}

- (void)setShowMapView:(BOOL)a3
{
  self->_showMapView = a3;
}

- (NSString)mapSubMessageString
{
  return self->_mapSubMessageString;
}

- (void)setMapSubMessageString:(id)a3
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

- (NSMutableArray)callouts
{
  return self->_callouts;
}

- (void)setCallouts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callouts, 0);
  objc_storeStrong((id *)&self->_annotationDict, 0);
  objc_storeStrong((id *)&self->_mapSubLabel, 0);

  objc_storeStrong((id *)&self->_mapSubMessageString, 0);
}

@end