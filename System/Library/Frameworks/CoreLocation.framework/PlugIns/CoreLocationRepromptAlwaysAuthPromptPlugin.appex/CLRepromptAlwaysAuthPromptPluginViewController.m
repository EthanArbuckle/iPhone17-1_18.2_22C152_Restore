@interface CLRepromptAlwaysAuthPromptPluginViewController
- (NSArray)launchLocations;
- (NSArray)locations;
- (NSMutableArray)regionExtremities;
- (id)allowedClassesForUnarchiving;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (void)_addLocationsToMap;
- (void)_centerAndZoomToFitRegion;
- (void)_defineMapExtremities;
- (void)_updateMapExtremities:(id)a3;
- (void)configureMapView;
- (void)setLaunchLocations:(id)a3;
- (void)setLocations:(id)a3;
- (void)setRegionExtremities:(id)a3;
@end

@implementation CLRepromptAlwaysAuthPromptPluginViewController

- (void)configureMapView
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt configureMapView<Start>", buf, 2u);
  }
  v3 = [(CLAuthBaseViewController *)self locationDictionary];
  v4 = [v3 valueForKey:@"Locations"];
  BOOL v5 = v4 == 0;

  if (!v5)
  {
    v6 = [(CLAuthBaseViewController *)self locationDictionary];
    v7 = [v6 objectForKeyedSubscript:@"Locations"];
    [(CLRepromptAlwaysAuthPromptPluginViewController *)self setLocations:v7];
  }
  v8 = [(CLAuthBaseViewController *)self locationDictionary];
  v9 = [v8 valueForKey:@"Launches"];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    v11 = [(CLAuthBaseViewController *)self locationDictionary];
    v12 = [v11 objectForKeyedSubscript:@"Launches"];
    [(CLRepromptAlwaysAuthPromptPluginViewController *)self setLaunchLocations:v12];
  }
  v13 = [(CLAuthBaseViewController *)self appName];
  if (v13)
  {
    if ([(NSArray *)self->_locations count])
    {
    }
    else
    {
      BOOL v14 = [(NSArray *)self->_launchLocations count] == 0;

      if (v14) {
        goto LABEL_12;
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)CLRepromptAlwaysAuthPromptPluginViewController;
    [(CLAuthBaseViewController *)&v21 configureMapView];
    id v15 = [objc_alloc((Class)MKPointOfInterestFilter) initIncludingCategories:&__NSArray0__struct];
    v16 = [(CLAuthBaseViewController *)self mapView];
    [v16 setPointOfInterestFilter:v15];

    v17 = [(CLAuthBaseViewController *)self mapView];
    [v17 setMapType:0];

    [(CLRepromptAlwaysAuthPromptPluginViewController *)self _defineMapExtremities];
    [(CLRepromptAlwaysAuthPromptPluginViewController *)self _addLocationsToMap];
  }
LABEL_12:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v18 = [(CLAuthBaseViewController *)self appName];
    v19 = [(CLAuthBaseViewController *)self bundleId];
    unint64_t v20 = [(CLAuthBaseViewController *)self authMask];
    *(_DWORD *)buf = 138412802;
    v23 = v18;
    __int16 v24 = 2112;
    v25 = v19;
    __int16 v26 = 2048;
    unint64_t v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt configureMapView<End> Client: %@ BID: %@ AuthMask %lu", buf, 0x20u);
  }
}

- (id)allowedClassesForUnarchiving
{
  v6.receiver = self;
  v6.super_class = (Class)CLRepromptAlwaysAuthPromptPluginViewController;
  v2 = [(CLAuthBaseViewController *)&v6 allowedClassesForUnarchiving];
  uint64_t v7 = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:&v7 count:1];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (void)_updateMapExtremities:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    [v4 latitude];
    uint64_t v6 = v5;
    [v4 longitude];
    int v40 = 134283777;
    uint64_t v41 = v6;
    __int16 v42 = 2049;
    uint64_t v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt Location: [%{private}f, %{private}f]", (uint8_t *)&v40, 0x16u);
  }
  [v4 latitude];
  double v9 = v8;
  BOOL v10 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  v11 = [v10 objectAtIndexedSubscript:0];
  [v11 floatValue];
  BOOL v13 = v9 < v12;

  if (v13)
  {
    [v4 latitude];
    BOOL v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    id v15 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    [v15 setObject:v14 atIndexedSubscript:0];
  }
  [v4 latitude];
  double v17 = v16;
  v18 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  v19 = [v18 objectAtIndexedSubscript:1];
  [v19 floatValue];
  BOOL v21 = v17 > v20;

  if (v21)
  {
    [v4 latitude];
    v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v23 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    [v23 setObject:v22 atIndexedSubscript:1];
  }
  [v4 longitude];
  double v25 = v24;
  __int16 v26 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  unint64_t v27 = [v26 objectAtIndexedSubscript:2];
  [v27 floatValue];
  BOOL v29 = v25 < v28;

  if (v29)
  {
    [v4 longitude];
    v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v31 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    [v31 setObject:v30 atIndexedSubscript:2];
  }
  [v4 longitude];
  double v33 = v32;
  v34 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  v35 = [v34 objectAtIndexedSubscript:3];
  [v35 floatValue];
  BOOL v37 = v33 > v36;

  if (v37)
  {
    [v4 longitude];
    v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v39 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    [v39 setObject:v38 atIndexedSubscript:3];
  }
}

- (void)_defineMapExtremities
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _defineMapExtremities<Start>", buf, 2u);
  }
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:4];
  [(CLRepromptAlwaysAuthPromptPluginViewController *)self setRegionExtremities:v3];

  id v4 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  [v4 setObject:&off_100008328 atIndexedSubscript:0];

  uint64_t v5 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  [v5 setObject:&off_100008338 atIndexedSubscript:1];

  uint64_t v6 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  [v6 setObject:&off_100008348 atIndexedSubscript:2];

  uint64_t v7 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  [v7 setObject:&off_100008358 atIndexedSubscript:3];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v8 = self->_locations;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v35 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v8);
        }
        [(CLRepromptAlwaysAuthPromptPluginViewController *)self _updateMapExtremities:*(void *)(*((void *)&v35 + 1) + 8 * (void)v11)];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v35 objects:v48 count:16];
    }
    while (v9);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  float v12 = self->_launchLocations;
  id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v32;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v12);
        }
        -[CLRepromptAlwaysAuthPromptPluginViewController _updateMapExtremities:](self, "_updateMapExtremities:", *(void *)(*((void *)&v31 + 1) + 8 * (void)v15), (void)v31);
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v13);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v16 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    double v17 = [v16 objectAtIndexedSubscript:0];
    [v17 floatValue];
    float v19 = v18;
    float v20 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    BOOL v21 = [v20 objectAtIndexedSubscript:2];
    [v21 floatValue];
    float v23 = v22;
    double v24 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    double v25 = [v24 objectAtIndexedSubscript:1];
    [v25 floatValue];
    float v27 = v26;
    float v28 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
    BOOL v29 = [v28 objectAtIndexedSubscript:3];
    [v29 floatValue];
    *(_DWORD *)buf = 134284289;
    double v40 = v19;
    __int16 v41 = 2049;
    double v42 = v23;
    __int16 v43 = 2049;
    double v44 = v27;
    __int16 v45 = 2049;
    double v46 = v30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "CoreLocationAuthPromptPlugin: Extremities: [%{private}f, %{private}f], [%{private}f, %{private}f]", buf, 0x2Au);
  }
  [(CLRepromptAlwaysAuthPromptPluginViewController *)self _centerAndZoomToFitRegion];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _defineMapExtremities<End>", buf, 2u);
  }
}

- (void)_centerAndZoomToFitRegion
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LOWORD(v38) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _centerAndZoomToFitRegion<Start>", (uint8_t *)&v38, 2u);
  }
  id v3 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  id v4 = [v3 objectAtIndexedSubscript:1];
  [v4 floatValue];
  float v6 = v5;
  uint64_t v7 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  double v8 = [v7 objectAtIndexedSubscript:0];
  [v8 floatValue];
  float v10 = v9;

  v11 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  float v12 = [v11 objectAtIndexedSubscript:3];
  [v12 floatValue];
  float v14 = v13;
  id v15 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  double v16 = [v15 objectAtIndexedSubscript:2];
  [v16 floatValue];
  float v18 = v17;

  float v19 = v6 - v10;
  float v20 = v14 - v18;
  double v21 = v19;
  double v22 = v20;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v38 = 134218240;
    double latitude = v19;
    __int16 v40 = 2048;
    double longitude = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt Location Span: [%f, %f]", (uint8_t *)&v38, 0x16u);
  }
  float v23 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  double v24 = [v23 objectAtIndexedSubscript:0];
  [v24 floatValue];
  float v26 = v25;
  float v27 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  float v28 = [v27 objectAtIndexedSubscript:2];
  [v28 floatValue];
  CLLocationCoordinate2D v30 = CLLocationCoordinate2DMake(v21 * 0.5 + v26, v22 * 0.5 + v29);

  long long v31 = [(CLAuthBaseViewController *)self mapView];
  objc_msgSend(v31, "setCenterCoordinate:animated:", 1, v30.latitude, v30.longitude);

  long long v32 = [(CLAuthBaseViewController *)self mapView];
  long long v33 = [(CLAuthBaseViewController *)self mapView];
  float v34 = fmax(v22, 0.072);
  float v35 = fmax(v21, 0.072);
  double v36 = v35 * 1.15;
  double v37 = v34 * 1.15;
  objc_msgSend(v33, "regionThatFits:", v30.latitude, v30.longitude, v36, v37);
  objc_msgSend(v32, "setRegion:animated:", 1);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v38 = 134284289;
    double latitude = v30.latitude;
    __int16 v40 = 2049;
    double longitude = v30.longitude;
    __int16 v42 = 2048;
    double v43 = v36;
    __int16 v44 = 2048;
    double v45 = v37;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt Region Center: [%{private}f, %{private}f], Region Span: [%f, %f]", (uint8_t *)&v38, 0x2Au);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LOWORD(v38) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _centerAndZoomToFitRegion<End>", (uint8_t *)&v38, 2u);
  }
}

- (void)_addLocationsToMap
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _addLocationsToMap<Start>", buf, 2u);
  }
  id v3 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  id v4 = [v3 objectAtIndexedSubscript:1];
  [v4 floatValue];
  float v6 = v5;
  uint64_t v7 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  double v8 = [v7 objectAtIndexedSubscript:0];
  [v8 floatValue];
  float v10 = v9;

  v11 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  float v12 = [v11 objectAtIndexedSubscript:3];
  [v12 floatValue];
  float v14 = v13;
  id v15 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self regionExtremities];
  double v16 = [v15 objectAtIndexedSubscript:2];
  [v16 floatValue];
  float v18 = v17;

  float v19 = fmax((float)(v6 - v10), 0.072);
  float v20 = fmax((float)(v14 - v18), 0.072);
  float v21 = (float)(fmaxf(v19, (float)(v20 / 270.0) * 180.0) * 111320.0) / 180.0;
  float v22 = fmaxf(v21 * 3.0, fminf(v21 * 4.5, 400.0));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    NSUInteger v23 = [(NSArray *)self->_locations count];
    *(_DWORD *)buf = 134218240;
    double v57 = v22;
    __int16 v58 = 2048;
    NSUInteger v59 = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _addLocationsToMap: Radius: %f Count: %lu", buf, 0x16u);
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v24 = self->_locations;
  id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v51;
    do
    {
      float v27 = 0;
      do
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v24);
        }
        float v28 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v27);
        float v29 = [(CLAuthBaseViewController *)self mapView];
        [v28 latitude];
        CLLocationDegrees v31 = v30;
        [v28 longitude];
        CLLocationCoordinate2D v33 = CLLocationCoordinate2DMake(v31, v32);
        float v34 = +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v33.latitude, v33.longitude, v22);
        [v29 addOverlay:v34];

        float v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [(NSArray *)v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v25);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  float v35 = self->_launchLocations;
  id v36 = [(NSArray *)v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v47;
    do
    {
      int v38 = 0;
      do
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v35);
        }
        v39 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v38);
        __int16 v40 = [(CLAuthBaseViewController *)self mapView];
        [v39 latitude];
        CLLocationDegrees v42 = v41;
        [v39 longitude];
        CLLocationCoordinate2D v44 = CLLocationCoordinate2DMake(v42, v43);
        double v45 = +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v44.latitude, v44.longitude, v22);
        [v40 addOverlay:v45];

        int v38 = (char *)v38 + 1;
      }
      while (v36 != v38);
      id v36 = [(NSArray *)v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v36);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#reprompt _addLocationsToMap<End>", buf, 2u);
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [objc_alloc((Class)MKCircleRenderer) initWithCircle:v5];
    uint64_t v7 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self view];
    double v8 = [v7 tintColor];
    [v6 setStrokeColor:v8];

    float v9 = [(CLRepromptAlwaysAuthPromptPluginViewController *)self view];
    float v10 = [v9 tintColor];
    [v6 setFillColor:v10];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
}

- (NSArray)launchLocations
{
  return self->_launchLocations;
}

- (void)setLaunchLocations:(id)a3
{
}

- (NSMutableArray)regionExtremities
{
  return self->_regionExtremities;
}

- (void)setRegionExtremities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionExtremities, 0);
  objc_storeStrong((id *)&self->_launchLocations, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

@end