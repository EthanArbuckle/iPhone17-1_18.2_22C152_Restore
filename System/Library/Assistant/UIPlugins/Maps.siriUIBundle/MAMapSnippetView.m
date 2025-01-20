@interface MAMapSnippetView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)showsUserLocationInMapView;
- (MAMapSnippetView)initWithFrame:(CGRect)a3 mapItem:(id)a4 itemRepresentsCurrentLocation:(BOOL)a5 regionOfInterest:(id)a6 fallbackDistance:(double)a7 reservationDelegate:(id)a8;
- (MAMapSnippetViewDelegate)delegate;
- (SALocalSearchMapItem)mapItem;
- (_MKPlaceReservationDelegate)reservationDelegate;
- (double)desiredHeightForWidth:(double)a3;
- (id)_newCustomFeatureStore;
- (id)_newMapOverlayView;
- (id)_newMapView;
- (id)_newReservationView;
- (id)_newResultView;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)nameForMapItem:(id)a3;
- (void)_handleTapOnMap:(id)a3;
- (void)_setupConstraints;
- (void)_setupCustomFeatureForMapItem;
- (void)_setupCustomFeatureForParkedCar;
- (void)_setupCustomFeatureStore;
- (void)_tap;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setReservationDelegate:(id)a3;
- (void)setShowsUserLocationInMapView:(BOOL)a3;
- (void)updateMapZoom:(BOOL)a3 withLocation:(id)a4;
@end

@implementation MAMapSnippetView

- (MAMapSnippetView)initWithFrame:(CGRect)a3 mapItem:(id)a4 itemRepresentsCurrentLocation:(BOOL)a5 regionOfInterest:(id)a6 fallbackDistance:(double)a7 reservationDelegate:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  id v19 = a6;
  id v20 = a8;
  v35.receiver = self;
  v35.super_class = (Class)MAMapSnippetView;
  v21 = -[MAMapSnippetView initWithFrame:](&v35, "initWithFrame:", x, y, width, height);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_mapItem, a4);
    v22->_itemRepresentsCurrentLocation = a5;
    objc_storeStrong((id *)&v22->_regionOfInterestRadiusInMiles, a6);
    v22->_fallbackDistance = a7;
    objc_storeWeak((id *)&v22->_reservationDelegate, v20);
    v23 = [(SALocalSearchMapItem *)v22->_mapItem location];
    if (([v23 isRegionCity] & 1) == 0
      && ([v23 isRegionCounty] & 1) == 0
      && ([v23 isRegionState] & 1) == 0
      && ([v23 isRegionCountry] & 1) == 0)
    {
      v24 = [(MAMapSnippetView *)v22 _newResultView];
      resultView = v22->_resultView;
      v22->_resultView = v24;

      [(MAMapSnippetView *)v22 addSubview:v22->_resultView];
    }
    v26 = [(MAMapSnippetView *)v22 _newMapView];
    snippetMapView = v22->_snippetMapView;
    v22->_snippetMapView = v26;

    [(MAMapSnippetView *)v22 addSubview:v22->_snippetMapView];
    v28 = [(MAMapSnippetView *)v22 _newMapOverlayView];
    mapOverlayView = v22->_mapOverlayView;
    v22->_mapOverlayView = v28;

    [(MAMapSnippetView *)v22 addSubview:v22->_mapOverlayView];
    v30 = [(MAMapSnippetView *)v22 _newReservationView];
    reservationView = v22->_reservationView;
    v22->_reservationView = v30;

    if (v22->_reservationView) {
      -[MAMapSnippetView addSubview:](v22, "addSubview:");
    }
    if ([v18 isParkingLocation])
    {
      [(MAMapSnippetView *)v22 _setupCustomFeatureStore];
      [(MAMapSnippetView *)v22 _setupCustomFeatureForParkedCar];
      uint64_t v32 = 1;
    }
    else
    {
      if (v22->_itemRepresentsCurrentLocation) {
        goto LABEL_13;
      }
      [(MAMapSnippetView *)v22 _setupCustomFeatureStore];
      [(MAMapSnippetView *)v22 _setupCustomFeatureForMapItem];
      customFeatureAnnotation = v22->_customFeatureAnnotation;
      if (!customFeatureAnnotation) {
        goto LABEL_13;
      }
      if ([(_MAMapSnippetCustomFeature *)customFeatureAnnotation showsBalloonCallout]) {
        uint64_t v32 = 1;
      }
      else {
        uint64_t v32 = 2;
      }
    }
    [(MKMapView *)v22->_snippetMapView _setDisplayedSearchResultsType:v32];
LABEL_13:
    [(MAMapSnippetView *)v22 updateMapZoom:0 withLocation:0];
    [(MAMapSnippetView *)v22 _setupConstraints];
  }
  return v22;
}

- (void)_setupCustomFeatureStore
{
  v3 = (_MKCustomFeatureStore *)[objc_alloc((Class)_MKCustomFeatureStore) initWithClustering:0];
  customFeatureStore = self->_customFeatureStore;
  self->_customFeatureStore = v3;

  snippetMapView = self->_snippetMapView;
  v6 = self->_customFeatureStore;

  [(MKMapView *)snippetMapView _addCustomFeatureDataSource:v6];
}

- (id)_newReservationView
{
  v3 = [(MAMapSnippetView *)self mapItem];
  v4 = [v3 restaurantInfo];
  v5 = [(MAMapSnippetView *)self reservationDelegate];
  v6 = objc_msgSend(v4, "_ma_reservationInfoWithDelegate:", v5);

  if (v6)
  {
    id v7 = [objc_alloc((Class)MKPlaceReservationRowView) initWithReservationInfo:v6];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setTopHairlineHidden:0];
    [v7 setBottomHairlineHidden:1];
    LODWORD(v8) = 1148829696;
    objc_msgSend(v7, "_mapkit_setContentHuggingPriority:forAxis:", 1, v8);
    objc_msgSend(v7, "_ma_updateSemanticContentAttribute");
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_newResultView
{
  v3 = -[MAResultView initWithFrame:]([MAResultView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MAResultView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1148829696;
  [(MAResultView *)v3 _mapkit_setContentHuggingPriority:1 forAxis:v4];
  [(MAResultView *)v3 _ma_updateSemanticContentAttribute];
  [(MAResultView *)v3 setMapItem:self->_mapItem];
  [(MAResultView *)v3 setFallbackDistance:self->_fallbackDistance];
  [(MAResultView *)v3 setHideBottomKeyline:1];
  [(MAResultView *)v3 setDisplayFormat:2];
  [(MAResultView *)v3 _mapkit_setTarget:self action:"_tap"];
  return v3;
}

- (id)_newMapView
{
  id v3 = objc_alloc_init((Class)MKMapView);
  [v3 setDelegate:self];
  [v3 setZoomEnabled:0];
  [v3 setScrollEnabled:0];
  [v3 setShowsUserLocation:0];
  [v3 _setUseBalloonCalloutsForLabels:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setUserInteractionEnabled:0];
  double v4 = +[UIColor systemBlueColor];
  [v3 setTintColor:v4];

  objc_msgSend(v3, "_ma_updateSemanticContentAttribute");
  v5 = [v3 layer];
  [v5 setCornerRadius:10.0];

  return v3;
}

- (id)_newMapOverlayView
{
  id v3 = -[MAMapSnippetOverlayView initWithFrame:]([MAMapSnippetOverlayView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MAMapSnippetOverlayView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTapOnMap:"];
  [(MAMapSnippetOverlayView *)v3 addGestureRecognizer:v4];
  v5 = [(MAMapSnippetOverlayView *)v3 layer];
  [v5 setCornerRadius:10.0];

  return v3;
}

- (id)_newCustomFeatureStore
{
  return objc_alloc_init((Class)_MKCustomFeatureStore);
}

- (void)_setupCustomFeatureForParkedCar
{
  id v3 = [(MAMapSnippetView *)self mapItem];
  id v4 = [v3 location];

  v5 = [v4 latitude];
  [v5 doubleValue];
  double v7 = v6;
  double v8 = [v4 longitude];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v7, v10);
  v12 = +[NSBundle _ma_bundle];
  v13 = [v12 siriUILocalizedStringForKey:@"Parked Car [Siri Snippet]" value:@"Parked Car" table:0];
  [v11 setText:v13 locale:0];

  id v14 = objc_msgSend(objc_alloc((Class)GEOFeatureStyleAttributes), "initWithAttributes:", 5, 3, 6, 349, 10, 2, 0);
  long long v20 = xmmword_19F20;
  uint64_t v21 = 0x100010024;
  [v14 replaceAttributes:&v20 count:3];
  [v11 setStyleAttributes:v14];
  v15 = -[_MAMapSnippetCustomFeature initWithCustomFeature:coordinate:]([_MAMapSnippetCustomFeature alloc], "initWithCustomFeature:coordinate:", v11, v7, v10);
  customFeatureAnnotation = self->_customFeatureAnnotation;
  self->_customFeatureAnnotation = v15;

  customFeatureStore = self->_customFeatureStore;
  id v19 = self->_customFeatureAnnotation;
  id v18 = +[NSArray arrayWithObjects:&v19 count:1];
  [(_MKCustomFeatureStore *)customFeatureStore addAnnotations:v18];
}

- (id)nameForMapItem:(id)a3
{
  id v3 = a3;
  if ([v3 _hasTransitDisplayName])
  {
    id v4 = [v3 _transitDisplayName];
  }
  else
  {
    v5 = [v3 _geoMapItem];

    id v4 = [v5 name];
    id v3 = v5;
  }

  return v4;
}

- (void)_setupCustomFeatureForMapItem
{
  id v3 = [(MAMapSnippetView *)self mapItem];
  id v4 = +[MKMapItem mapItemWithLocalSearchMapItem:v3];

  [v4 _coordinate];
  double v6 = v5;
  [v4 _coordinate];
  double v8 = v7;
  id v9 = objc_msgSend(objc_alloc((Class)VKCustomFeature), "initWithCoordinate:", v6, v7);
  double v10 = [v4 _styleAttributes];
  if (([v10 hasAttributes] & 1) == 0)
  {
    uint64_t v11 = +[GEOFeatureStyleAttributes markerStyleAttributes];

    double v10 = (void *)v11;
  }
  id v12 = [v10 copy];

  long long v19 = xmmword_19F20;
  uint64_t v20 = 0x100010024;
  [v12 replaceAttributes:&v19 count:3];
  [v9 setStyleAttributes:v12];
  v13 = [(MAMapSnippetView *)self nameForMapItem:v4];
  [v9 setText:v13 locale:0];

  id v14 = -[_MAMapSnippetCustomFeature initWithCustomFeature:coordinate:]([_MAMapSnippetCustomFeature alloc], "initWithCustomFeature:coordinate:", v9, v6, v8);
  customFeatureAnnotation = self->_customFeatureAnnotation;
  self->_customFeatureAnnotation = v14;

  -[_MAMapSnippetCustomFeature setShowsBalloonCallout:](self->_customFeatureAnnotation, "setShowsBalloonCallout:", [v12 isLabelPOI] ^ 1);
  customFeatureStore = self->_customFeatureStore;
  id v18 = self->_customFeatureAnnotation;
  v17 = +[NSArray arrayWithObjects:&v18 count:1];
  [(_MKCustomFeatureStore *)customFeatureStore addAnnotations:v17];
}

- (void)_setupConstraints
{
  id v3 = objc_opt_new();
  id v4 = objc_opt_new();
  double v5 = _NSDictionaryOfVariableBindings(@"_snippetMapView", self->_snippetMapView, 0);
  double v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  resultView = self->_resultView;
  if (resultView)
  {
    double v8 = _NSDictionaryOfVariableBindings(@"_resultView", resultView, 0);
    [v6 addEntriesFromDictionary:v8];

    [v4 addObjectsFromArray:&off_43FA8];
    id v9 = [(MAResultView *)self->_resultView heightAnchor];
    [(MAResultView *)self->_resultView preferredHeight];
    double v10 = objc_msgSend(v9, "constraintEqualToConstant:");
    [v3 addObject:v10];
  }
  else
  {
    [v4 addObject:@"V:|-(margin@999)-[_snippetMapView]"];
  }
  reservationView = self->_reservationView;
  if (reservationView)
  {
    id v12 = _NSDictionaryOfVariableBindings(@"_reservationView", reservationView, 0);
    [v6 addEntriesFromDictionary:v12];

    [v4 addObjectsFromArray:&off_43FC0];
  }
  else
  {
    [v4 addObject:@"V:[_snippetMapView]-(margin@998)-|"];
  }
  [v4 addObject:@"H:|-(margin)-[_snippetMapView]-(margin)-|"];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = +[NSLayoutConstraint constraintsWithVisualFormat:*(void *)(*((void *)&v37 + 1) + 8 * i) options:0 metrics:&off_44AF0 views:v6];
        [v3 addObjectsFromArray:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v15);
  }

  long long v19 = [(MKMapView *)self->_snippetMapView heightAnchor];
  uint64_t v20 = [v19 constraintEqualToConstant:0.0];
  mapViewHeightConstraint = self->_mapViewHeightConstraint;
  self->_mapViewHeightConstraint = v20;

  v22 = +[UIScreen mainScreen];
  [v22 bounds];
  [(NSLayoutConstraint *)self->_mapViewHeightConstraint setConstant:round(v23 * 0.381965995)];

  [v3 addObject:self->_mapViewHeightConstraint];
  v36 = [(MAMapSnippetOverlayView *)self->_mapOverlayView heightAnchor];
  objc_super v35 = [(MKMapView *)self->_snippetMapView heightAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v41[0] = v34;
  v33 = [(MAMapSnippetOverlayView *)self->_mapOverlayView widthAnchor];
  uint64_t v32 = [(MKMapView *)self->_snippetMapView widthAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v41[1] = v31;
  v30 = [(MAMapSnippetOverlayView *)self->_mapOverlayView centerXAnchor];
  v24 = [(MKMapView *)self->_snippetMapView centerXAnchor];
  v25 = [v30 constraintEqualToAnchor:v24];
  v41[2] = v25;
  v26 = [(MAMapSnippetOverlayView *)self->_mapOverlayView centerYAnchor];
  v27 = [(MKMapView *)self->_snippetMapView centerYAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v41[3] = v28;
  v29 = +[NSArray arrayWithObjects:v41 count:4];
  [v3 addObjectsFromArray:v29];

  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)dealloc
{
  [(MKMapView *)self->_snippetMapView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MAMapSnippetView;
  [(MAMapSnippetView *)&v3 dealloc];
}

- (double)desiredHeightForWidth:(double)a3
{
  [(MAResultView *)self->_resultView preferredHeight];
  double v5 = v4;
  [(NSLayoutConstraint *)self->_mapViewHeightConstraint constant];
  double v7 = v6;
  reservationView = self->_reservationView;
  if (reservationView)
  {
    [(MKPlaceReservationRowView *)reservationView _mapkit_fittingSize];
    double v10 = 12.0;
  }
  else
  {
    double v9 = 0.0;
    double v10 = 15.0;
  }
  if (v5 <= 0.0) {
    double v11 = 15.0;
  }
  else {
    double v11 = v5;
  }
  return v11 + v7 + v10 + v9;
}

- (BOOL)showsUserLocationInMapView
{
  return [(MKMapView *)self->_snippetMapView showsUserLocation];
}

- (void)setShowsUserLocationInMapView:(BOOL)a3
{
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateMapZoom:(BOOL)a3 withLocation:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(SALocalSearchMapItem *)self->_mapItem location];
  double v8 = [v7 clRepresentation];

  if (!self->_itemRepresentsCurrentLocation)
  {
    [(MAResultView *)self->_resultView setReferenceLocation:v6];
    [(MAMapSnippetView *)self _mapkit_setNeedsLayout];
  }
  [v8 coordinate];
  MKMapPoint v9 = MKMapPointForCoordinate(v41);
  [v6 coordinate];
  MKMapPoint v43 = MKMapPointForCoordinate(v42);
  double v10 = MKMetersBetweenMapPoints(v43, v9);
  if (v6)
  {
    double v11 = v10;
    [v6 coordinate];
    double v13 = v12;
    double v15 = v14;
    p_regionOfInterestRadiusInMiles = (id *)&self->_regionOfInterestRadiusInMiles;
    [(NSNumber *)self->_regionOfInterestRadiusInMiles doubleValue];
    if (v15 >= -180.0 && v15 <= 180.0 && v13 >= -90.0 && v13 <= 90.0 && v11 < 100000.0)
    {
      if (!*p_regionOfInterestRadiusInMiles || v11 < v17 * 1609.344)
      {
        MKMapRectBoundingMapPoints();
        double v22 = (v21 + -3000.0) * 0.5;
        if (v21 >= 3000.0) {
          double v23 = v21;
        }
        else {
          double v23 = 3000.0;
        }
        if (v21 >= 3000.0) {
          double v22 = -0.0;
        }
        double v24 = v19 + v22;
        double v25 = (v20 + -3000.0) * 0.5;
        if (v20 >= 3000.0) {
          double v26 = v20;
        }
        else {
          double v26 = 3000.0;
        }
        if (v20 >= 3000.0) {
          double v25 = -0.0;
        }
        double v27 = v18 + v25;
        if (self->_customFeatureAnnotation)
        {
          double top = 83.3333359;
          uint64_t v29 = 0x4041AAAAA0000000;
          double bottom = 35.3333321;
        }
        else
        {
          v36 = [(MKMapView *)self->_snippetMapView annotations];
          id v37 = [v36 count];

          if (!v37)
          {
            double bottom = UIEdgeInsetsZero.bottom;
            double top = UIEdgeInsetsZero.top;
            double left = UIEdgeInsetsZero.left;
            goto LABEL_32;
          }
          +[MKPinAnnotationView _perceivedSize];
          uint64_t v29 = v38;
          double bottom = v39;
          double top = floor(v39 + v39 * 0.5);
        }
        double left = *(double *)&v29;
LABEL_32:
        -[MKMapView setVisibleMapRect:edgePadding:animated:](self->_snippetMapView, "setVisibleMapRect:edgePadding:animated:", v4, v27, v24, v26, v23, top, left, bottom);
        goto LABEL_28;
      }
      goto LABEL_25;
    }
  }
  else
  {
    p_regionOfInterestRadiusInMiles = (id *)&self->_regionOfInterestRadiusInMiles;
    [(NSNumber *)self->_regionOfInterestRadiusInMiles doubleValue];
  }
  if (!*p_regionOfInterestRadiusInMiles)
  {
    double v34 = 3000.0;
    goto LABEL_27;
  }
LABEL_25:
  [v8 coordinate];
  double v32 = MKMapPointsPerMeterAtLatitude(v31);
  [*p_regionOfInterestRadiusInMiles doubleValue];
  double v34 = v32 * (v33 * 1609.344);
LABEL_27:
  [v8 coordinate];
  MKMapPoint v35 = MKMapPointForCoordinate(v44);
  -[MKMapView setVisibleMapRect:animated:](self->_snippetMapView, "setVisibleMapRect:animated:", v4, v35.x - v34 * 0.5, v35.y - v34 * 0.5, v34, v34);
LABEL_28:
}

- (void)_tap
{
  id v4 = [(MAMapSnippetView *)self delegate];
  objc_super v3 = [(MAMapSnippetView *)self mapItem];
  [v4 mapView:self didChooseMapItem:v3 headerTapped:1];
}

- (void)_handleTapOnMap:(id)a3
{
  snippetMapView = self->_snippetMapView;
  id v5 = a3;
  [(MKMapView *)snippetMapView attributionFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 locationInView:self->_snippetMapView];
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v25.origin.double x = v7;
  v25.origin.double y = v9;
  v25.size.double width = v11;
  v25.size.double height = v13;
  v24.double x = v15;
  v24.double y = v17;
  if (CGRectContainsPoint(v25, v24)
    && ([(MKMapView *)self->_snippetMapView urlForMapAttribution],
        (id v22 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v18 = [(MAMapSnippetView *)self delegate];
    double v19 = [(MAMapSnippetView *)self mapItem];
    double v20 = [v19 placeData2];
    double v21 = +[MKMapItem mapItemWithSerializedPlaceData:v20];
    [v18 mapViewDidChooseMapAttribution:v22 mapItem:v21];
  }
  else
  {
    id v22 = [(MAMapSnippetView *)self delegate];
    double v18 = [(MAMapSnippetView *)self mapItem];
    [v22 mapView:self didChooseMapItem:v18 headerTapped:0];
  }
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 userLocation];

  if (v7 == v6)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 dequeueReusableAnnotationViewWithIdentifier:@"searchResult"];
    if (!v8)
    {
      id v8 = [objc_alloc((Class)MKPinAnnotationView) initWithAnnotation:v6 reuseIdentifier:@"searchResult"];
      [v8 setCanShowCallout:0];
    }
  }

  return v8;
}

- (MAMapSnippetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MAMapSnippetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SALocalSearchMapItem)mapItem
{
  return self->_mapItem;
}

- (_MKPlaceReservationDelegate)reservationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reservationDelegate);

  return (_MKPlaceReservationDelegate *)WeakRetained;
}

- (void)setReservationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_reservationDelegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customFeatureAnnotation, 0);
  objc_storeStrong((id *)&self->_customFeatureStore, 0);
  objc_storeStrong((id *)&self->_regionOfInterestRadiusInMiles, 0);
  objc_storeStrong((id *)&self->_mapViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_resultView, 0);
  objc_storeStrong((id *)&self->_reservationView, 0);
  objc_storeStrong((id *)&self->_mapOverlayView, 0);

  objc_storeStrong((id *)&self->_snippetMapView, 0);
}

@end