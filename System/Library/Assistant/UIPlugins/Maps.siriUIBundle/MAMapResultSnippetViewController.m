@interface MAMapResultSnippetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isMemoryIntensive;
- (MAMapResultSnippetViewController)initWithMapItemSnippet:(id)a3;
- (double)desiredHeightForWidth:(double)a3;
- (id)_loadMapSnippetView;
- (id)_mapSnippetView;
- (int)analyticsUITarget;
- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)mapView:(id)a3 didChooseMapItem:(id)a4 headerTapped:(BOOL)a5;
- (void)mapViewDidChooseMapAttribution:(id)a3 mapItem:(id)a4;
- (void)reservationInfo:(id)a3 makeReservationForSelectedTimeAtIndex:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MAMapResultSnippetViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MAMapResultSnippetViewController)initWithMapItemSnippet:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MAMapResultSnippetViewController;
  v3 = [(MABaseSnippetViewController *)&v8 initWithMapItemSnippet:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(MABaseSnippetViewController *)v3 selectedLocalSearchMapItem];
    v9 = v5;
    v6 = +[NSArray arrayWithObjects:&v9 count:1];
    [(MAMapResultSnippetViewController *)v4 setRequestContext:v6];
  }
  return v4;
}

- (void)_updateTitleAndSubtitleWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = +[NSBundle _ma_bundle];
  v6 = [v5 siriUILocalizedStringForKey:@"Details"];

  [(MAMapResultSnippetViewController *)self setNavigationTitle:v6];
  v7 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  objc_super v8 = [v7 label];
  [(MAMapResultSnippetViewController *)self setTitle:v8];

  v9 = [v7 distance];

  if (v9)
  {
    v10 = [v7 distance];
    v11 = [v10 value];
    [v11 doubleValue];
    self->_fallbackDistance = v12;

    v13 = [v7 distance];
    v14 = [v13 localizedDistanceString];
    [(MAMapResultSnippetViewController *)self setSubtitle:v14];

    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v15 = +[MKLocationManager sharedLocationManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_47C8;
    v17[3] = &unk_2C6A8;
    id v18 = v7;
    v19 = self;
    v20 = v4;
    v16 = [v15 singleLocationUpdateWithDesiredAccuracy:v17 handler:kCLLocationAccuracyNearestTenMeters timeout:1.0];
    [v16 start];
  }
}

- (int)analyticsUITarget
{
  return 805;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)MAMapResultSnippetViewController;
  [(MAMapResultSnippetViewController *)&v4 loadView];
  v3 = [(MAMapResultSnippetViewController *)self _loadMapSnippetView];
  objc_msgSend(v3, "_ma_updateSemanticContentAttribute");
  objc_msgSend(v3, "_mapkit_setNeedsLayout");
  [(MAMapResultSnippetViewController *)self setView:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MAMapResultSnippetViewController;
  [(MABaseSnippetViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  v5 = [v4 placeData2];
  [(MABaseSnippetViewController *)self captureUserAction:2015 mapItemPlaceData:v5];

  v6 = [(MAMapResultSnippetViewController *)self _mapSnippetView];
  [v6 setShowsUserLocationInMapView:1];

  v7 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  [(MABaseSnippetViewController *)self donateLocationForMapItem:v7];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MAMapResultSnippetViewController;
  [(MABaseSnippetViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(MAMapResultSnippetViewController *)self _mapSnippetView];
  [v4 setShowsUserLocationInMapView:0];
}

- (void)dealloc
{
  if ([(MAMapResultSnippetViewController *)self isViewLoaded])
  {
    v3 = [(MAMapResultSnippetViewController *)self _mapSnippetView];
    [v3 setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MAMapResultSnippetViewController;
  [(MABaseSnippetViewController *)&v4 dealloc];
}

- (void)mapView:(id)a3 didChooseMapItem:(id)a4 headerTapped:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if (v5) {
    uint64_t v8 = 6042;
  }
  else {
    uint64_t v8 = 6007;
  }
  v9 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  v10 = [v9 placeData2];
  [(MABaseSnippetViewController *)self captureUserAction:v8 mapItemPlaceData:v10];

  v11 = [(MAMapResultSnippetViewController *)self delegate];
  double v12 = [v7 commands];
  [v11 siriViewController:self performAceCommands:v12];

  v13 = +[NSMutableDictionary dictionary];
  v14 = [(MABaseSnippetViewController *)self mapItemSnippet];
  v15 = [v14 regionOfInterestRadiusInMiles];
  [v15 doubleValue];
  double v17 = v16;

  id v18 = [v14 regionOfInterestRadiusInMiles];

  if (v18 && v17 > 0.0)
  {
    v19 = +[NSNumber numberWithDouble:v17 * 1609.344];
    [v13 setObject:v19 forKey:MKLaunchOptionsMapRadiusInMetersKey];
  }
  if ([v7 isCurrentLocation])
  {
    v20 = +[NSNumber numberWithBool:1];
    [v13 setObject:v20 forKey:MKLaunchOptionsCurrentLocationPlacecardKey];
  }
  if ([v7 isParkingLocation])
  {
    v21 = +[NSURL URLWithString:@"x-maps-bulletin://?MapsPushNotificationType=ParkedCar"];
    [(MABaseSnippetViewController *)self openURL:v21 completion:0];
  }
  else
  {
    v22 = [v14 items];
    id v23 = [v22 indexOfObject:v7];

    if (v23 != (id)0x7FFFFFFFFFFFFFFFLL
      || (id v23 = [(MABaseSnippetViewController *)self selectedMapItemIndex],
          v23 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      v24 = +[NSNumber numberWithUnsignedInteger:v23];
      [v13 setObject:v24 forKeyedSubscript:MKLaunchOptionsSelectedIndexKey];
    }
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_4DF4;
    v29 = &unk_2C6D0;
    id v30 = v14;
    id v31 = v13;
    v25 = [(MABaseSnippetViewController *)self generateURLWithSession:&v26];
    if (v25) {
      -[MABaseSnippetViewController openURL:completion:](self, "openURL:completion:", v25, 0, v26, v27, v28, v29, v30);
    }
  }
}

- (void)mapViewDidChooseMapAttribution:(id)a3 mapItem:(id)a4
{
  id v7 = a3;
  v6 = [a4 _placeDataAsData];
  [(MABaseSnippetViewController *)self captureUserAction:6041 resultIndex:0xFFFFFFFFLL mapItemPlaceData:v6];

  [(MABaseSnippetViewController *)self openURL:v7 completion:0];
}

- (void)reservationInfo:(id)a3 makeReservationForSelectedTimeAtIndex:(unint64_t)a4
{
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  objc_msgSend(a4, "lastObject", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [(MAMapResultSnippetViewController *)self _mapSnippetView];
  objc_msgSend(v5, "updateMapZoom:withLocation:", -[MABaseSnippetViewController appearing](self, "appearing") ^ 1, v6);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MAMapResultSnippetViewController;
  id v4 = a3;
  [(MABaseSnippetViewController *)&v7 locationManagerDidChangeAuthorization:v4];
  unsigned int v5 = objc_msgSend(v4, "authorizationStatus", v7.receiver, v7.super_class);

  if (v5 == 2)
  {
    id v6 = [(MAMapResultSnippetViewController *)self _mapSnippetView];
    [v6 updateMapZoom:1 withLocation:0];
  }
}

- (double)desiredHeightForWidth:(double)a3
{
  id v4 = [(MAMapResultSnippetViewController *)self _mapSnippetView];
  [v4 desiredHeightForWidth:a3];
  double v6 = v5;

  return v6;
}

- (BOOL)isMemoryIntensive
{
  return 1;
}

- (id)_loadMapSnippetView
{
  v3 = [(MABaseSnippetViewController *)self mapItemSnippet];
  id v4 = [(MABaseSnippetViewController *)self selectedLocalSearchMapItem];
  double v5 = [MAMapSnippetView alloc];
  double v6 = [v3 userCurrentLocation];
  id v7 = [v6 BOOLValue];
  uint64_t v8 = [v3 regionOfInterestRadiusInMiles];
  v9 = -[MAMapSnippetView initWithFrame:mapItem:itemRepresentsCurrentLocation:regionOfInterest:fallbackDistance:reservationDelegate:](v5, "initWithFrame:mapItem:itemRepresentsCurrentLocation:regionOfInterest:fallbackDistance:reservationDelegate:", v4, v7, v8, self, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, self->_fallbackDistance);

  [(MAMapSnippetView *)v9 setDelegate:self];
  if ([v3 usesFixedLocation])
  {
    v10 = [v3 searchRegionCenter];
    v11 = [v10 clRepresentation];
    [(MAMapSnippetView *)v9 updateMapZoom:0 withLocation:v11];
  }

  return v9;
}

- (id)_mapSnippetView
{
  v3 = [(MAMapResultSnippetViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(MAMapResultSnippetViewController *)self view];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end