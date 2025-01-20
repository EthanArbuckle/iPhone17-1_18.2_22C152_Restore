@interface HKRouteView
- (HKRouteView)init;
- (UIButton)toggleMapTypeButton;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)routeImageForSharing;
- (void)_addAnnotation:(id)a3 isStartPoint:(BOOL)a4;
- (void)_clearMapViewIfNeeded;
- (void)_displayMapRouteForLocationReadings;
- (void)_setRouteMapType:(unint64_t)a3;
- (void)_toggleMapType;
- (void)setLocationReadings:(id)a3;
- (void)setToggleMapTypeButton:(id)a3;
@end

@implementation HKRouteView

- (HKRouteView)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKRouteView;
  v2 = [(HKRouteView *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(HKRouteView *)v2 _clearMapViewIfNeeded];
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    toggleMapTypeButton = v3->_toggleMapTypeButton;
    v3->_toggleMapTypeButton = (UIButton *)v4;

    v6 = v3->_toggleMapTypeButton;
    v7 = [MEMORY[0x1E4FB1618] blackColor];
    v8 = [v7 colorWithAlphaComponent:0.8];
    [(UIButton *)v6 setBackgroundColor:v8];

    [(UIButton *)v3->_toggleMapTypeButton _setCornerRadius:9.0];
    [(HKRouteView *)v3 _setRouteMapType:5];
    [(HKRouteView *)v3 addSubview:v3->_toggleMapTypeButton];
  }
  return v3;
}

- (void)_clearMapViewIfNeeded
{
  mapView = self->_mapView;
  if (mapView) {
    [(MKMapView *)mapView removeFromSuperview];
  }
  uint64_t v4 = (MKMapView *)objc_alloc_init(MEMORY[0x1E4F30F50]);
  v5 = self->_mapView;
  self->_mapView = v4;

  [(MKMapView *)self->_mapView setShowsScale:1];
  [(MKMapView *)self->_mapView setShowsCompass:1];
  [(MKMapView *)self->_mapView setMapType:5];
  [(MKMapView *)self->_mapView setDelegate:self];
  [(HKRouteView *)self addSubview:self->_mapView];
  [(MKMapView *)self->_mapView hk_alignConstraintsWithView:self];
  [(MKMapView *)self->_mapView _compassInsets];
  [(MKMapView *)self->_mapView _setCompassInsets:59.0];
  v6 = self->_mapView;
  [(MKMapView *)v6 _setCompassViewSize:1 style:0];
}

- (void)_setRouteMapType:(unint64_t)a3
{
  -[MKMapView setMapType:](self->_mapView, "setMapType:");
  v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v13 = [v5 localizedStringForKey:@"WORKOUT_ROUTE_MAP_ACCESSIBILITY_LABEL_MAP_VIEW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  if (a3 == 5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    uint64_t v7 = [v6 localizedStringForKey:@"WORKOUT_ROUTE_MAP_ACCESSIBILITY_LABEL_SATELLITE_VIEW" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    v8 = @"Activity-satellite-view";
    id v13 = (id)v7;
  }
  else
  {
    v8 = @"Activity-map-view";
  }
  toggleMapTypeButton = self->_toggleMapTypeButton;
  objc_super v10 = (void *)MEMORY[0x1E4FB1818];
  v11 = HKHealthUIFrameworkBundle();
  v12 = [v10 imageNamed:v8 inBundle:v11];
  [(UIButton *)toggleMapTypeButton setImage:v12 forState:0];

  [(UIButton *)self->_toggleMapTypeButton setAccessibilityLabel:v13];
}

- (id)routeImageForSharing
{
  [(HKRouteView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v14.width = v4;
  v14.height = v6;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v9);

  objc_super v10 = [(MKMapView *)self->_mapView layer];
  [v10 renderInContext:UIGraphicsGetCurrentContext()];

  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

- (void)_toggleMapType
{
  if ([(MKMapView *)self->_mapView mapType] == MKMapTypeMutedStandard) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 5;
  }
  [(HKRouteView *)self _setRouteMapType:v3];
}

- (void)_addAnnotation:(id)a3 isStartPoint:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11 = objc_alloc_init(HKMapPointAnnotation);
  [v6 coordinate];
  double v8 = v7;
  double v10 = v9;

  -[MKPointAnnotation setCoordinate:](v11, "setCoordinate:", v8, v10);
  [(HKMapPointAnnotation *)v11 setIsStartPoint:v4];
  [(MKMapView *)self->_mapView addAnnotation:v11];
}

- (void)_displayMapRouteForLocationReadings
{
  int64_t v3 = [(HKLocationReadings *)self->_locationReadings count];
  locationReadings = self->_locationReadings;
  if (v3 == 1)
  {
    double v5 = [(HKLocationReadings *)locationReadings allValidLocations];
    id v6 = [v5 firstObject];
    [(HKRouteView *)self _addAnnotation:v6 isStartPoint:1];

    double v7 = [(HKLocationReadings *)self->_locationReadings allValidLocations];
    double v8 = [v7 firstObject];
    [v8 coordinate];
    MKMapPoint v9 = MKMapPointForCoordinate(v22);

    -[MKMapView setVisibleMapRect:animated:](self->_mapView, "setVisibleMapRect:animated:", 0, v9.x, v9.y, 1500.0, 1500.0);
    mapView = self->_mapView;
    id v20 = [(HKLocationReadings *)self->_locationReadings allValidLocations];
    v11 = [v20 firstObject];
    [v11 coordinate];
    -[MKMapView setCenterCoordinate:](mapView, "setCenterCoordinate:");
  }
  else
  {
    uint64_t v12 = [(HKLocationReadings *)locationReadings count];
    id v13 = (char *)malloc_type_malloc(16 * v12, 0x1000040451B5BE8uLL);
    CGSize v14 = [(HKLocationReadings *)self->_locationReadings firstObject];
    [(HKRouteView *)self _addAnnotation:v14 isStartPoint:1];

    v15 = [(HKLocationReadings *)self->_locationReadings lastObject];
    [(HKRouteView *)self _addAnnotation:v15 isStartPoint:0];

    if (v12)
    {
      uint64_t v16 = 0;
      v17 = v13 + 8;
      do
      {
        v18 = [(HKLocationReadings *)self->_locationReadings allValidLocations];
        v19 = [v18 objectAtIndexedSubscript:v16];

        [v19 coordinate];
        *(MKMapPoint *)(v17 - 8) = MKMapPointForCoordinate(v23);

        ++v16;
        v17 += 16;
      }
      while (v12 != v16);
    }
    id v20 = [MEMORY[0x1E4F30FF0] polylineWithPoints:v13 count:v12];
    [(MKMapView *)self->_mapView addOverlay:v20 level:0];
    free(v13);
    [v20 boundingMapRect];
    -[MKMapView setVisibleMapRect:edgePadding:animated:](self->_mapView, "setVisibleMapRect:edgePadding:animated:", 0);
  }
}

- (void)setLocationReadings:(id)a3
{
  objc_storeStrong((id *)&self->_locationReadings, a3);
  [(HKRouteView *)self _clearMapViewIfNeeded];
  [(HKRouteView *)self _displayMapRouteForLocationReadings];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F30F58]) initWithAnnotation:v4 reuseIdentifier:0];
    if ([v4 isStartPoint]) {
      HKUIStandardMapGreenColor();
    }
    else {
    id v6 = HKUIStandardMapRedColor();
    }
    [v5 setMarkerTintColor:v6];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a4;
  id v6 = [[_GradientPolylineRenderer alloc] initWithOverlay:v5 locationReadings:self->_locationReadings];

  [(MKOverlayPathRenderer *)v6 setLineWidth:15.0];
  return v6;
}

- (UIButton)toggleMapTypeButton
{
  return self->_toggleMapTypeButton;
}

- (void)setToggleMapTypeButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleMapTypeButton, 0);
  objc_storeStrong((id *)&self->_locationReadings, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end