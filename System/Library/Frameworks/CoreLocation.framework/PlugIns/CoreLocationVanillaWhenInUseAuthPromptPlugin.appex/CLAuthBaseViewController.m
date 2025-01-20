@interface CLAuthBaseViewController
- (CLLocationManager)locManager;
- (MKMapView)mapView;
- (NSArray)inputItems;
- (NSDictionary)clientDict;
- (NSDictionary)locationDictionary;
- (NSString)appName;
- (NSString)bundleId;
- (double)_accessibilityMaximumWidthForScreenSize:(CGSize)a3;
- (id)allowedClassesForUnarchiving;
- (id)demandCreateLocationManager;
- (id)extensionInputItems;
- (unint64_t)authMask;
- (void)configureMapView;
- (void)configureMapViewWithHeightOverride:(double)a3;
- (void)loadView;
- (void)setAppName:(id)a3;
- (void)setAuthMask:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setClientDict:(id)a3;
- (void)setInputItems:(id)a3;
- (void)setLocManager:(id)a3;
- (void)setLocationDictionary:(id)a3;
- (void)setMapView:(id)a3;
@end

@implementation CLAuthBaseViewController

- (void)loadView
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#BaseViewController loadView<Start>", buf, 2u);
  }
  v18.receiver = self;
  v18.super_class = (Class)CLAuthBaseViewController;
  [(CLAuthBaseViewController *)&v18 loadView];
  v3 = +[NSNull null];
  [(CLAuthBaseViewController *)self setLocManager:v3];

  -[CLAuthBaseViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 0.01);
  v4 = [(CLAuthBaseViewController *)self extensionInputItems];
  v5 = [v4 firstObject];

  v6 = [v5 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"clientName"];
  [(CLAuthBaseViewController *)self setAppName:v7];

  v8 = [v5 userInfo];
  v9 = [v8 objectForKeyedSubscript:@"clientDictionary"];
  [(CLAuthBaseViewController *)self setClientDict:v9];

  v10 = [(CLAuthBaseViewController *)self clientDict];
  [(CLAuthBaseViewController *)self setAuthMask:+[CLLocationManager entityAuthorizationForLocationDictionary:v10]];

  v11 = [(CLAuthBaseViewController *)self clientDict];
  v12 = [v11 objectForKey:@"BundleId"];
  [(CLAuthBaseViewController *)self setBundleId:v12];

  v13 = [v5 userInfo];
  v14 = [v13 objectForKeyedSubscript:@"archivedPayload"];

  if (v14)
  {
    id v15 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v14 error:0];
    v16 = [(CLAuthBaseViewController *)self allowedClassesForUnarchiving];
    v17 = [v15 decodeObjectOfClasses:v16 forKey:NSKeyedArchiveRootObjectKey];
    [(CLAuthBaseViewController *)self setLocationDictionary:v17];
  }
  [(CLAuthBaseViewController *)self configureMapView];
}

- (id)allowedClassesForUnarchiving
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
}

- (id)extensionInputItems
{
  uint64_t v2 = [(CLAuthBaseViewController *)self extensionContext];
  uint64_t v3 = [v2 inputItems];

  return v3;
}

- (double)_accessibilityMaximumWidthForScreenSize:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.width = a3.height;
  }
  return a3.width + -64.0;
}

- (void)configureMapViewWithHeightOverride:(double)a3
{
  uint64_t v5 = +[UIWindow keyWindow];
  uint64_t v6 = +[UIApplication sharedApplication];
  v7 = [v6 preferredContentSizeCategory];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v35 = *(double *)&v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#BaseViewController loadView<Start> %@", buf, 0xCu);
  }
  if ([v7 containsString:@"Accessibility"])
  {
    [v5 size];
    -[CLAuthBaseViewController _accessibilityMaximumWidthForScreenSize:](self, "_accessibilityMaximumWidthForScreenSize:");
    double v9 = v8;
  }
  else
  {
    double v9 = 270.0;
  }
  v10 = +[UIDevice currentDevice];
  unint64_t v11 = (unint64_t)[v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (v5)
    {
      [v5 size];
      -[CLAuthBaseViewController _accessibilityMaximumWidthForScreenSize:](self, "_accessibilityMaximumWidthForScreenSize:");
      if (v9 >= v12) {
        double v9 = v12;
      }
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v13 = +[UIWindow allWindowsIncludingInternalWindows:onlyVisibleWindows:](UIWindow, "allWindowsIncludingInternalWindows:onlyVisibleWindows:", 0, 1, 0);
      id v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v31;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * i) size];
            -[CLAuthBaseViewController _accessibilityMaximumWidthForScreenSize:](self, "_accessibilityMaximumWidthForScreenSize:");
            if (v9 >= v17) {
              double v9 = v17;
            }
          }
          id v14 = [v13 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v14);
      }
    }
    if (v9 > 402.0) {
      double v9 = 402.0;
    }
  }
  -[CLAuthBaseViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, a3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v35 = v9;
    __int16 v36 = 2048;
    double v37 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "#BaseViewController mapViewDimensions %.5f %.5f", buf, 0x16u);
  }
  objc_super v18 = [(CLAuthBaseViewController *)self locManager];
  BOOL v19 = v18 == 0;

  if (v19)
  {
    id v21 = objc_msgSend(objc_alloc((Class)MKMapView), "initWithFrame:", 0.0, 0.0, v9, a3);
    [(CLAuthBaseViewController *)self setMapView:v21];
  }
  else
  {
    id v20 = objc_alloc((Class)MKMapView);
    id v21 = [(CLAuthBaseViewController *)self locManager];
    id v22 = objc_msgSend(v20, "initWithFrame:locationManager:", v21, 0.0, 0.0, v9, a3);
    [(CLAuthBaseViewController *)self setMapView:v22];
  }
  v23 = [(CLAuthBaseViewController *)self mapView];
  [v23 _setShowsAppleLogo:0];

  v24 = [(CLAuthBaseViewController *)self mapView];
  [v24 setDelegate:self];

  v25 = [(CLAuthBaseViewController *)self mapView];
  [v25 setMapType:105];

  v26 = [(CLAuthBaseViewController *)self mapView];
  [v26 setUserInteractionEnabled:0];

  v27 = [(CLAuthBaseViewController *)self mapView];
  [v27 setShowsAttribution:0];

  v28 = [(CLAuthBaseViewController *)self view];
  v29 = [(CLAuthBaseViewController *)self mapView];
  [v28 addSubview:v29];
}

- (void)configureMapView
{
}

- (CLLocationManager)locManager
{
  locManager = self->_locManager;
  uint64_t v4 = +[NSNull null];

  if (locManager == v4)
  {
    uint64_t v5 = [(CLAuthBaseViewController *)self demandCreateLocationManager];
    uint64_t v6 = self->_locManager;
    self->_locManager = v5;
  }
  v7 = self->_locManager;

  return v7;
}

- (id)demandCreateLocationManager
{
  return 0;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (NSDictionary)clientDict
{
  return self->_clientDict;
}

- (void)setClientDict:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (unint64_t)authMask
{
  return self->_authMask;
}

- (void)setAuthMask:(unint64_t)a3
{
  self->_authMask = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSDictionary)locationDictionary
{
  return self->_locationDictionary;
}

- (void)setLocationDictionary:(id)a3
{
}

- (void)setLocManager:(id)a3
{
}

- (NSArray)inputItems
{
  return self->_inputItems;
}

- (void)setInputItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputItems, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong((id *)&self->_locationDictionary, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_clientDict, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end