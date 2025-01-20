@interface CLAuthWithPreciseSettingBaseViewController
+ (id)effectiveBundlePath;
- (CLLocation)currentLocation;
- (MKCircle)currentOverlay;
- (id)demandCreateLocationManager;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (int)pillButtonState;
- (void)configureMapView;
- (void)loadView;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)pillButtonToggled;
- (void)setCurrentLocation:(id)a3;
- (void)setCurrentOverlay:(id)a3;
- (void)setPillButtonState:(int)a3;
- (void)updateMapZoomAccordinglyForPreciseSetting;
@end

@implementation CLAuthWithPreciseSettingBaseViewController

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)CLAuthWithPreciseSettingBaseViewController;
  [(CLAuthBaseViewController *)&v11 loadView];
  [(CLAuthWithPreciseSettingBaseViewController *)self setPillButtonState:0];
  v3 = [(CLAuthBaseViewController *)self locationDictionary];
  v4 = [v3 valueForKey:@"CLAuthPromptShowOnlyHerePill"];
  if ([v4 BOOLValue])
  {
    v5 = [(CLAuthBaseViewController *)self clientDict];
    v6 = +[CLLocationManager interestZonesIdentifierListForLocationDictionary:v5];
    id v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = 3;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v9 = [(CLAuthBaseViewController *)self clientDict];
  unsigned int v10 = +[CLLocationManager correctiveCompensationStatusForLocationDictionary:v9];

  if (v10) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
LABEL_8:
  [(CLAuthWithPreciseSettingBaseViewController *)self setPillButtonState:v8];
  +[CLLocationManager updatePillButtonChoiceForOutstandingPrompt:[(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState]];
}

- (void)configureMapView
{
  v5.receiver = self;
  v5.super_class = (Class)CLAuthWithPreciseSettingBaseViewController;
  [(CLAuthBaseViewController *)&v5 configureMapView];
  v3 = [(CLAuthBaseViewController *)self mapView];
  [v3 setShowsUserLocation:1];

  v4 = [(CLAuthBaseViewController *)self mapView];
  objc_msgSend(v4, "setLayoutMargins:", 25.0, 25.0, 25.0, 25.0);
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v6 = a4;
  objc_super v5 = [v6 location];
  [(CLAuthWithPreciseSettingBaseViewController *)self setCurrentLocation:v5];

  [(CLAuthWithPreciseSettingBaseViewController *)self updateMapZoomAccordinglyForPreciseSetting];
}

- (void)updateMapZoomAccordinglyForPreciseSetting
{
  v3 = [(CLAuthBaseViewController *)self mapView];
  id v4 = [v3 mapType];

  if (v4 == (id)105)
  {
    objc_super v5 = [(CLAuthBaseViewController *)self mapView];
    [v5 setMapType:0];
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100003F6C;
  v24[3] = &unk_1000081D8;
  v24[4] = self;
  +[UIView animateWithDuration:196608 delay:v24 options:0 animations:6.0 completion:0.0];
  if ([(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState] == 1)
  {
    id v6 = [(CLAuthBaseViewController *)self mapView];
    id v7 = [(CLAuthWithPreciseSettingBaseViewController *)self currentOverlay];
    [v6 removeOverlay:v7];

    [(CLAuthWithPreciseSettingBaseViewController *)self setCurrentOverlay:0];
    uint64_t v8 = [(CLAuthBaseViewController *)self locManager];
    [v8 setDesiredAccuracy:-1.0];
  }
  else if ([(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState] == 2)
  {
    uint64_t v8 = [(CLAuthBaseViewController *)self locManager];
    [v8 setDesiredAccuracy:6380000.0];
  }
  else
  {
    if ([(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState] != 3) {
      return;
    }
    v9 = [(CLAuthBaseViewController *)self mapView];
    unsigned int v10 = [(CLAuthWithPreciseSettingBaseViewController *)self currentOverlay];
    [v9 removeOverlay:v10];

    objc_super v11 = [(CLAuthWithPreciseSettingBaseViewController *)self currentLocation];
    [v11 coordinate];
    CLLocationDegrees v13 = v12;
    v14 = [(CLAuthWithPreciseSettingBaseViewController *)self currentLocation];
    [v14 coordinate];
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v13, v15);
    uint64_t v8 = +[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v16.latitude, v16.longitude, 150.0);

    [(CLAuthWithPreciseSettingBaseViewController *)self setCurrentOverlay:v8];
    v17 = [(CLAuthBaseViewController *)self mapView];
    v18 = [(CLAuthWithPreciseSettingBaseViewController *)self currentOverlay];
    [v17 addOverlay:v18];

    v19 = [(CLAuthBaseViewController *)self locManager];
    [v19 setDesiredAccuracy:-1.0];

    v20 = [(CLAuthWithPreciseSettingBaseViewController *)self currentLocation];
    [v20 coordinate];
    double v22 = v21;
    v23 = [(CLAuthWithPreciseSettingBaseViewController *)self currentLocation];
    [v23 coordinate];
    +[CLLocationManager updatePromptedLatitude:longitude:](CLLocationManager, "updatePromptedLatitude:longitude:", v22);
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [objc_alloc((Class)MKCircleRenderer) initWithCircle:v4];
    id v6 = +[UIColor systemBlackColor];
    id v7 = [v6 colorWithAlphaComponent:0.8];
    [v5 setStrokeColor:v7];

    uint64_t v8 = +[UIColor systemGrayColor];
    v9 = [v8 colorWithAlphaComponent:0.5];
    [v5 setFillColor:v9];

    [v5 setLineWidth:0.5];
    [v5 setLineDashPhase:0.2];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)pillButtonToggled
{
  unsigned int v3 = [(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState];
  id v4 = [(CLAuthBaseViewController *)self locationDictionary];
  id v5 = [v4 valueForKey:@"CLAuthPromptShowOnlyHerePill"];
  unsigned int v6 = [v5 BOOLValue];

  if (v3 == 1)
  {
    uint64_t v7 = 2;
  }
  else if (v3 != 2 || v6 != 1)
  {
    if (v3 == 2) {
      int v8 = v6;
    }
    else {
      int v8 = 1;
    }
    uint64_t v7 = v8 != 1 || v3 == 3;
  }
  else
  {
    uint64_t v7 = 3;
  }
  [(CLAuthWithPreciseSettingBaseViewController *)self setPillButtonState:v7];
  [(CLAuthWithPreciseSettingBaseViewController *)self updateMapZoomAccordinglyForPreciseSetting];
  uint64_t v9 = [(CLAuthWithPreciseSettingBaseViewController *)self pillButtonState];

  +[CLLocationManager updatePillButtonChoiceForOutstandingPrompt:v9];
}

- (id)demandCreateLocationManager
{
  id v2 = objc_alloc((Class)CLLocationManager);
  unsigned int v3 = [(id)objc_opt_class() effectiveBundlePath];
  id v4 = [v2 initWithEffectiveBundlePath:v3];

  return v4;
}

+ (id)effectiveBundlePath
{
  return @"/System/Library/LocationBundles/LocationPromptUI.bundle";
}

- (int)pillButtonState
{
  return self->_pillButtonState;
}

- (void)setPillButtonState:(int)a3
{
  self->_pillButtonState = a3;
}

- (MKCircle)currentOverlay
{
  return self->_currentOverlay;
}

- (void)setCurrentOverlay:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_currentOverlay, 0);
}

@end