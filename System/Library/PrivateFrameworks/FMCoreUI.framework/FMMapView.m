@interface FMMapView
+ (BOOL)hasUserLocation;
- ($2A298E9A48029832219C371D8B4CA722)lastVisibleMapRect;
- ($2A298E9A48029832219C371D8B4CA722)mapRectForAnnotations:(id)a3 shouldIncludeRadius:(BOOL)a4;
- ($2A298E9A48029832219C371D8B4CA722)mapRectMakeWithRadialDistanceForCoordinate:(CLLocationCoordinate2D)a3 andRadius:(double)a4;
- ($2A298E9A48029832219C371D8B4CA722)normalizeMapRect:(id)a3 toZoomScale:(double)a4;
- ($2A298E9A48029832219C371D8B4CA722)repositionOnAnnotation:(id)a3 withZoom:(BOOL)a4;
- (BOOL)canChangeUserTrackingMode;
- (BOOL)canRotateForHeading;
- (BOOL)canSelectUserAnnotation;
- (BOOL)hasUserLocation;
- (BOOL)isAllAnnotationsShown;
- (BOOL)isCurrentlyRotated;
- (BOOL)isFingerOnAnnotation;
- (BOOL)isFingerOnMap;
- (BOOL)isGoingBackToAllAnnotation;
- (BOOL)isMapAnimating;
- (BOOL)isMapMoved;
- (BOOL)isMapPositioningDisabled;
- (BOOL)isNearbyModeDisabled;
- (BOOL)isOverlayOnMap:(id)a3;
- (BOOL)isPreventingMapUpdates;
- (BOOL)isPreviewing;
- (BOOL)isSwipeGestureEnabled;
- (BOOL)isSwitchingTrackingMode;
- (BOOL)isUserLocationUpdated;
- (BOOL)isUserSwiping;
- (BOOL)isValidLocation:(CLLocationCoordinate2D)a3;
- (BOOL)shouldDisplayOverlay;
- (BOOL)showUserLocationCallout;
- (CADisplayLink)displayLink;
- (CLLocationCoordinate2D)coordinateForAnnotationView:(id)a3;
- (FMAnnotation)currentDeviceAnnotation;
- (FMAnnotation)lastSelectedAnnotationBeforeTracking;
- (FMAnnotation)selectedAnnotation;
- (FMAnnotationView)potentiallySelectedAnnotationView;
- (FMAnnotationView)selectedAnnotationView;
- (FMMapGestureRecognizer)mapGesture;
- (FMMapView)init;
- (FMMapView)initWithCoder:(id)a3;
- (FMMapViewDelegate)delegate;
- (MKAnnotation)otherSelectedAnnotation;
- (MKMapCamera)cameraBefore3DRendering;
- (MKMapView)mapView;
- (MKUserLocation)userLocation;
- (MKUserLocationView)userLocationView;
- (NSMutableArray)accuracyOverlays;
- (NSTimer)layoutTimer;
- (NSTimer)userSelectionTimer;
- (UIColor)userLocationTintColor;
- (UIEdgeInsets)lastVisibleInsets;
- (_MKUserTrackingButton)userTrackingButton;
- (double)distanceBetweenOrigin:(CLLocationCoordinate2D)a3 andDestination:(CLLocationCoordinate2D)a4;
- (double)maxZoomLevel;
- (float)dampingForAltitude:(double)a3 andDistance:(double)a4;
- (id)annotationsSortedByDistance;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)nearbyAnnotations;
- (id)viewForAnnotation:(id)a3;
- (int64_t)currentSelectedState;
- (int64_t)currentTrackingMode;
- (int64_t)doubleSelectionMode;
- (int64_t)renderingMode;
- (int64_t)userTrackingMode;
- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5;
- (void)addAnnotation:(id)a3;
- (void)addAnnotations:(id)a3;
- (void)addOverlay:(id)a3;
- (void)addOverlays:(id)a3;
- (void)animateMapToPosition:(double)a3 withInsets:(double)a4 attributionInsets:(double)a5 andZoom:(double)a6;
- (void)animateRenderingModeChange;
- (void)animateToAllAnnotation;
- (void)calloutButtonTapped:(id)a3;
- (void)clearUserLocation;
- (void)createMKMapView;
- (void)createUserTrackingButton;
- (void)dealloc;
- (void)depthSortAnnotations;
- (void)deselectAllAnnotations;
- (void)deselectAnnotationView:(id)a3;
- (void)deselectAnnotationViewIfNeeded:(id)a3;
- (void)didDoubleSelectAnnotation:(id)a3;
- (void)didMoveToSuperview;
- (void)didSelectAnnotation:(id)a3;
- (void)displayAllAnnotations;
- (void)doubleSelectAnnotation:(id)a3;
- (void)fingerOffAnnotation:(id)a3;
- (void)fingerOnAnnotation:(id)a3;
- (void)flashMapInset:(UIEdgeInsets)a3;
- (void)initialize;
- (void)invalidateLayoutTimer;
- (void)layoutMapView;
- (void)layoutSubviews;
- (void)mapDoubleTapped:(id)a3;
- (void)mapSwiped:(id)a3 withPercent:(double)a4;
- (void)mapSwipedBegin:(id)a3;
- (void)mapSwipedEnd:(id)a3 withPercent:(double)a4;
- (void)mapTapped:(id)a3;
- (void)mapTouchBegan:(id)a3;
- (void)mapTouchEnded:(id)a3;
- (void)mapTouchMoved:(id)a3;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)moveCenterByOffset:(CGPoint)a3 from:(CLLocationCoordinate2D)a4;
- (void)recenterVisibleAnnotations;
- (void)refreshCameraPosition;
- (void)refreshOverlayForAnnotation:(id)a3 andCoordinate:(CLLocationCoordinate2D)a4;
- (void)removeAllOverlaysAndCurrentAnnotationOverlay:(id)a3;
- (void)removeAnnotation:(id)a3;
- (void)removeAnnotations:(id)a3;
- (void)removeOverlay:(id)a3;
- (void)removeOverlays:(id)a3;
- (void)removeUserAnnotationIfNeeded:(id)a3;
- (void)repositionOnMapRectIfNeeded:(id)a3;
- (void)repositionToMapRect:(id)a3 withZoom:(BOOL)a4;
- (void)selectAnnotation:(id)a3;
- (void)selectAnnotationForPreview:(id)a3;
- (void)selectOrDeselectAnnotationView:(id)a3;
- (void)setAccuracyOverlays:(id)a3;
- (void)setCameraBefore3DRendering:(id)a3;
- (void)setCanChangeUserTrackingMode:(BOOL)a3;
- (void)setCanSelectUserAnnotation:(BOOL)a3;
- (void)setCurrentDeviceAnnotation:(id)a3;
- (void)setCurrentSelectedState:(int64_t)a3;
- (void)setCurrentTrackingMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDoubleSelectionMode:(int64_t)a3;
- (void)setIsAllAnnotationsShown:(BOOL)a3;
- (void)setIsFingerOnAnnotation:(BOOL)a3;
- (void)setIsFingerOnMap:(BOOL)a3;
- (void)setIsGoingBackToAllAnnotation:(BOOL)a3;
- (void)setIsMapAnimating:(BOOL)a3;
- (void)setIsMapMoved:(BOOL)a3;
- (void)setIsMapPositioningDisabled:(BOOL)a3;
- (void)setIsNearbyModeDisabled:(BOOL)a3;
- (void)setIsPreventingMapUpdates:(BOOL)a3;
- (void)setIsPreviewing:(BOOL)a3;
- (void)setIsSwipeGestureEnabled:(BOOL)a3;
- (void)setIsSwitchingTrackingMode:(BOOL)a3;
- (void)setIsUserLocationUpdated:(BOOL)a3;
- (void)setIsUserSwiping:(BOOL)a3;
- (void)setLastSelectedAnnotationBeforeTracking:(id)a3;
- (void)setLastVisibleInsets:(UIEdgeInsets)a3;
- (void)setLastVisibleMapRect:(id)a3;
- (void)setLayoutTimer:(id)a3;
- (void)setMapGesture:(id)a3;
- (void)setMaxZoomLevel:(double)a3;
- (void)setOtherSelectedAnnotation:(id)a3;
- (void)setPotentiallySelectedAnnotationView:(id)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setSelectedAnnotation:(id)a3;
- (void)setSelectedAnnotationView:(id)a3;
- (void)setShouldDisplayOverlay:(BOOL)a3;
- (void)setShowUserLocationCallout:(BOOL)a3;
- (void)setUserLocation:(id)a3;
- (void)setUserLocationTintColor:(id)a3;
- (void)setUserLocationView:(id)a3;
- (void)setUserSelectionTimer:(id)a3;
- (void)setUserTrackingButton:(id)a3;
- (void)setupCamera;
- (void)setupConstraints;
- (void)setupGestures;
- (void)slideAnnotationIntoViewIfNeeded:(id)a3;
- (void)synchronize;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAccordingToUserTrackingMode;
- (void)updateAnnotationPositionAfterPreview:(id)a3;
- (void)updateAnnotationStyle:(id)a3;
- (void)updateCameraPositionForAnnotation:(id)a3;
- (void)updateCameraPositionForMapRect:(id)a3 withZoom:(BOOL)a4;
- (void)updateCameraPositionForNoLocation;
- (void)updateCameraPositionWithLocation:(CLLocationCoordinate2D)a3 andAltitude:(double)a4;
- (void)updateCanSelectUserAnnotation;
- (void)updateOverlayForAnnotation:(id)a3 withForce:(BOOL)a4;
- (void)updatePreviewLocationForAnnotation:(id)a3;
- (void)updateUserTrackingButtonState;
- (void)userLocationTapped:(id)a3;
@end

@implementation FMMapView

- (FMMapView)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMMapView;
  v2 = [(FMMapView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMMapView *)v2 initialize];
  }
  return v3;
}

- (FMMapView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMMapView;
  v3 = [(FMMapView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FMMapView *)v3 initialize];
  }
  return v4;
}

- (void)didMoveToSuperview
{
  v10.receiver = self;
  v10.super_class = (Class)FMMapView;
  [(FMMapView *)&v10 didMoveToSuperview];
  v3 = [(FMMapView *)self superview];

  if (v3)
  {
    [(FMMapView *)self setupConstraints];
    [(FMMapView *)self setupGestures];
    v4 = [(FMMapView *)self mapView];
    [v4 setDelegate:self];

    objc_super v5 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_synchronize];
    [(FMMapView *)self setDisplayLink:v5];

    objc_super v6 = [(FMMapView *)self displayLink];
    v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v6 addToRunLoop:v7 forMode:*MEMORY[0x263EFF588]];
  }
  else
  {
    v8 = [(FMMapView *)self displayLink];

    if (v8)
    {
      v9 = [(FMMapView *)self displayLink];
      [v9 invalidate];

      [(FMMapView *)self setDisplayLink:0];
      [(FMMapView *)self setUserTrackingButton:0];
    }
    [(FMMapView *)self invalidateLayoutTimer];
    objc_super v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 removeObserver:self];
  }
}

- (void)dealloc
{
  v3 = [(FMMapView *)self displayLink];

  if (v3)
  {
    v4 = [(FMMapView *)self displayLink];
    [v4 invalidate];

    [(FMMapView *)self setDisplayLink:0];
    [(FMMapView *)self setUserTrackingButton:0];
  }
  [(FMMapView *)self invalidateLayoutTimer];
  objc_super v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)FMMapView;
  [(FMMapView *)&v6 dealloc];
}

- (void)initialize
{
  double v3 = *MEMORY[0x263F00B40];
  v4 = [MEMORY[0x263F10930] sharedLocationManager];
  [v4 setDesiredAccuracy:v3];

  +[FMAnnotationView preloadAssets];
  [(FMMapView *)self setCurrentTrackingMode:0];
  [(FMMapView *)self setCurrentSelectedState:0];
  [(FMMapView *)self setDoubleSelectionMode:0];
  [(FMMapView *)self setRenderingMode:0];
  [(FMMapView *)self setMaxZoomLevel:0.100000001];
  objc_super v5 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431374 blue:1.0 alpha:1.0];
  [(FMMapView *)self setUserLocationTintColor:v5];

  [(FMMapView *)self setCanSelectUserAnnotation:1];
  [(FMMapView *)self setCanChangeUserTrackingMode:1];
  objc_super v6 = objc_opt_new();
  [(FMMapView *)self setAccuracyOverlays:v6];

  [(FMMapView *)self setTintAdjustmentMode:1];
  v7 = [MEMORY[0x263F00A60] sharedManager];
  id v10 = [v7 location];

  if (v10)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F10A38]);
    v9 = (void *)[v10 copy];
    [v8 setLocation:v9];

    [(FMMapView *)self setUserLocation:v8];
    hasUserLocation = 1;
  }
  [(FMMapView *)self createMKMapView];
  [(FMMapView *)self createUserTrackingButton];
  [(FMMapView *)self setupCamera];
}

- (void)createMKMapView
{
  double v3 = (MKMapView *)objc_alloc_init(MEMORY[0x263F109A8]);
  [(MKMapView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKMapView *)v3 setCompassEnabled:0];
  [(MKMapView *)v3 setShowsUserLocation:1];
  v4 = [MEMORY[0x263F109F0] filterIncludingAllCategories];
  [(MKMapView *)v3 setPointOfInterestFilter:v4];

  [(MKMapView *)v3 setShowsBuildings:1];
  [(MKMapView *)v3 setShowsAttribution:0];
  [(MKMapView *)v3 _setShowsCurrentEnvironmentName:0];
  [(MKMapView *)v3 _setShowsPressedLabelMarkerEffect:0];
  [(MKMapView *)v3 setShowsTraffic:0];
  [(FMMapView *)self addSubview:v3];
  mapView = self->_mapView;
  self->_mapView = v3;
}

- (void)createUserTrackingButton
{
  id v3 = [MEMORY[0x263F10A80] buttonWithUserTrackingView:self];
  [(FMMapView *)self setUserTrackingButton:v3];
}

- (void)setupCamera
{
  id v3 = [(FMMapView *)self delegate];
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_super v5 = [v4 objectForKey:@"FMMapViewLastVisibleRect"];
  objc_super v6 = [v4 objectForKey:@"FMMapViewLastVisibleInsets"];
  if (v5)
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __24__FMMapView_setupCamera__block_invoke;
    id v10 = &unk_264335078;
    id v11 = v5;
    id v12 = v6;
    v13 = self;
    id v14 = v3;
    dispatch_async(MEMORY[0x263EF83A0], &v7);
    -[FMMapView setIsUserLocationUpdated:](self, "setIsUserLocationUpdated:", 1, v7, v8, v9, v10);
  }
}

void __24__FMMapView_setupCamera__block_invoke(uint64_t a1)
{
  id v47 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:*(void *)(a1 + 32) error:0];
  v2 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:*(void *)(a1 + 40) error:0];
  id v3 = [v47 objectForKeyedSubscript:@"x"];
  [v3 doubleValue];
  double v5 = v4;
  objc_super v6 = [v47 objectForKeyedSubscript:@"y"];
  [v6 doubleValue];
  double v8 = v7;
  v9 = [v47 objectForKeyedSubscript:@"width"];
  [v9 doubleValue];
  double v11 = v10;
  id v12 = [v47 objectForKeyedSubscript:@"height"];
  [v12 doubleValue];
  objc_msgSend(*(id *)(a1 + 48), "setLastVisibleMapRect:", v5, v8, v11, v13);

  id v14 = [v2 objectForKeyedSubscript:@"top"];
  [v14 doubleValue];
  double v16 = v15;
  v17 = [v2 objectForKeyedSubscript:@"left"];
  [v17 doubleValue];
  double v19 = v18;
  v20 = [v2 objectForKeyedSubscript:@"bottom"];
  [v20 doubleValue];
  double v22 = v21;
  v23 = [v2 objectForKeyedSubscript:@"right"];
  [v23 doubleValue];
  objc_msgSend(*(id *)(a1 + 48), "setLastVisibleInsets:", v16, v19, v22, v24);

  if (*(void *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "edgeInsetsForState:", objc_msgSend(*(id *)(a1 + 48), "currentSelectedState"));
    objc_msgSend(*(id *)(a1 + 48), "setLastVisibleInsets:");
  }
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(*(id *)(a1 + 56), "attributionInsetsForState:", objc_msgSend(*(id *)(a1 + 48), "currentSelectedState"));
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
  }
  else
  {
    double v30 = 6.0;
    double v26 = 0.0;
    double v32 = -38.0;
    double v28 = 0.0;
  }
  v33 = [*(id *)(a1 + 48) mapView];
  [*(id *)(a1 + 48) lastVisibleMapRect];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  [*(id *)(a1 + 48) lastVisibleInsets];
  objc_msgSend(v33, "setVisibleMapRect:edgePadding:animated:", 0, v35, v37, v39, v41, v42, v43, v44, v45);

  v46 = [*(id *)(a1 + 48) mapView];
  objc_msgSend(v46, "_setAttributionInsets:", v26, v28, v30, v32);
}

- (void)setupConstraints
{
  v8[1] = *MEMORY[0x263EF8340];
  double v7 = @"mapView";
  id v3 = [(FMMapView *)self mapView];
  v8[0] = v3;
  double v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];

  double v5 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[mapView]-0-|" options:0 metrics:0 views:v4];
  objc_super v6 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-0-[mapView]-0-|" options:0 metrics:0 views:v4];
  [(FMMapView *)self addConstraints:v5];
  [(FMMapView *)self addConstraints:v6];
}

- (void)setupGestures
{
  double v4 = objc_alloc_init(FMMapGestureRecognizer);
  [(FMMapGestureRecognizer *)v4 setTouchDelegate:self];
  [(FMMapView *)self setMapGesture:v4];
  id v3 = [(FMMapView *)self mapView];
  [v3 addGestureRecognizer:v4];
}

- (void)layoutSubviews
{
  id v3 = [(FMMapView *)self mapView];
  if ([v3 mapType]) {
    double v4 = 0.5;
  }
  else {
    double v4 = 0.35;
  }

  v6.receiver = self;
  v6.super_class = (Class)FMMapView;
  [(FMMapView *)&v6 layoutSubviews];
  [(FMMapView *)self invalidateLayoutTimer];
  double v5 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_layoutMapView selector:0 userInfo:0 repeats:v4];
  [(FMMapView *)self setLayoutTimer:v5];
}

- (void)layoutMapView
{
  [(FMMapView *)self setLayoutTimer:0];
  id v5 = [(FMMapView *)self selectedAnnotation];
  id v3 = [(FMMapView *)self mapView];
  if ([v3 userTrackingMode] == 2
    || [(FMMapView *)self isPreventingMapUpdates]
    || [(FMMapView *)self isMapMoved])
  {
  }
  else
  {
    BOOL v4 = [(FMMapView *)self isMapPositioningDisabled];

    if (!v4)
    {
      if (v5)
      {
        -[FMMapView updateCameraPositionForAnnotation:](self, "updateCameraPositionForAnnotation:");
      }
      else if ([(FMMapView *)self isAllAnnotationsShown])
      {
        -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", *MEMORY[0x263F10858], *(double *)(MEMORY[0x263F10858] + 8), *(double *)(MEMORY[0x263F10858] + 16), *(double *)(MEMORY[0x263F10858] + 24));
        [(FMMapView *)self displayAllAnnotations];
      }
      else
      {
        [(FMMapView *)self recenterVisibleAnnotations];
      }
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FMMapView;
  [(FMMapView *)&v5 traitCollectionDidChange:a3];
  BOOL v4 = [(FMMapView *)self selectedAnnotation];

  if (!v4) {
    [(FMMapView *)self setIsAllAnnotationsShown:1];
  }
}

- (void)setUserLocationTintColor:(id)a3
{
  BOOL v4 = (UIColor *)a3;
  objc_super v5 = [(FMMapView *)self mapView];
  objc_super v6 = [(FMMapView *)self mapView];
  double v7 = [v6 userLocation];
  double v8 = [v5 viewForAnnotation:v7];
  [v8 setTintColor:v4];

  userLocationTintColor = self->_userLocationTintColor;
  self->_userLocationTintColor = v4;
}

- (void)addAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  [v5 addAnnotation:v4];
}

- (void)addAnnotations:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  [v5 addAnnotations:v4];
}

- (void)removeAnnotation:(id)a3
{
  id v4 = a3;
  [(FMMapView *)self removeUserAnnotationIfNeeded:v4];
  id v5 = [(FMMapView *)self mapView];
  [v5 removeAnnotation:v4];
}

- (void)removeAnnotations:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(FMMapView *)self removeUserAnnotationIfNeeded:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  v9 = [(FMMapView *)self mapView];
  [v9 removeAnnotations:v4];
}

- (id)viewForAnnotation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMMapView *)self mapView];
  uint64_t v6 = [v5 viewForAnnotation:v4];

  return v6;
}

- (void)deselectAllAnnotations
{
  id v3 = [(FMMapView *)self mapView];
  id v4 = [(FMMapView *)self mapView];
  uint64_t v5 = [v4 overlays];
  [v3 removeOverlays:v5];

  [(FMMapView *)self deselectAnnotationViewIfNeeded:0];
}

- (void)selectAnnotation:(id)a3
{
  id v16 = a3;
  [(FMMapView *)self deselectAnnotationViewIfNeeded:0];
  id v4 = [(FMMapView *)self delegate];
  uint64_t v5 = [(FMMapView *)self viewForAnnotation:v16];
  [(FMMapView *)self setCurrentSelectedState:1];
  [(FMMapView *)self setSelectedAnnotationView:v5];
  [(FMMapView *)self setSelectedAnnotation:v16];
  uint64_t v6 = [(FMMapView *)self selectedAnnotationView];
  [v6 setSelected:1 animated:1 delay:0.400000006];

  [(FMMapView *)self _setUserTrackingMode:0 animated:1 fromTrackingButton:0];
  uint64_t v7 = [(FMMapView *)self mapView];
  uint64_t v8 = [v7 selectedAnnotations];
  v9 = [v8 firstObject];
  long long v10 = [(FMMapView *)self userLocation];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    long long v12 = [(FMMapView *)self mapView];
    long long v13 = [(FMMapView *)self mapView];
    id v14 = [v13 userLocation];
    [v12 deselectAnnotation:v14 animated:1];
  }
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 didSelectAnnotation:v16];
  }
  if (v16) {
    [(FMMapView *)self depthSortAnnotations];
  }
  [(FMMapView *)self setIsMapAnimating:0];
  -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", *MEMORY[0x263F10858], *(double *)(MEMORY[0x263F10858] + 8), *(double *)(MEMORY[0x263F10858] + 16), *(double *)(MEMORY[0x263F10858] + 24));
  uint64_t v15 = [(FMMapView *)self layoutTimer];
  [v15 invalidate];

  [(FMMapView *)self setLayoutTimer:0];
  [(FMMapView *)self repositionOnAnnotation:v16 withZoom:1];
}

- (void)invalidateLayoutTimer
{
  id v3 = [(FMMapView *)self layoutTimer];

  if (v3)
  {
    id v4 = [(FMMapView *)self layoutTimer];
    [v4 invalidate];

    [(FMMapView *)self setLayoutTimer:0];
  }
}

- (void)doubleSelectAnnotation:(id)a3
{
  id v5 = a3;
  [(FMMapView *)self invalidateLayoutTimer];
  [(FMMapView *)self setIsMapPositioningDisabled:0];
  id v4 = [(FMMapView *)self selectedAnnotationView];
  [v4 setSelected:0 animated:1];

  [(FMMapView *)self didDoubleSelectAnnotation:v5];
}

- (void)removeUserAnnotationIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = [(FMMapView *)self userLocationView];
  id v5 = [(FMMapView *)self currentDeviceAnnotation];
  if ([v6 isEqual:v4])
  {
    [(FMMapView *)self setUserLocationView:0];
  }
  else if ([v6 isEqual:v5])
  {
    [(FMMapView *)self setCurrentDeviceAnnotation:0];
  }
}

- (void)deselectAnnotationViewIfNeeded:(id)a3
{
  id v6 = a3;
  id v4 = [(FMMapView *)self selectedAnnotationView];

  id v5 = v6;
  if (v4 != v6)
  {
    [(FMMapView *)self deselectAnnotationView:v6];
    id v5 = v6;
  }
}

- (void)deselectAnnotationView:(id)a3
{
  id v9 = a3;
  id v4 = [(FMMapView *)self delegate];
  id v5 = objc_opt_new();
  id v6 = [(FMMapView *)self selectedAnnotation];
  [v6 setOverlay:v5];

  [(FMMapView *)self setCurrentSelectedState:0];
  uint64_t v7 = [(FMMapView *)self selectedAnnotationView];
  [v7 setSelected:0 animated:1];

  [(FMMapView *)self setSelectedAnnotationView:0];
  [(FMMapView *)self setSelectedAnnotation:0];
  uint64_t v8 = [v9 annotation];
  [(FMMapView *)self updateOverlayForAnnotation:v8 withForce:1];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 didDeselectAnnotationView:v9];
  }
}

- (void)didSelectAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self delegate];
  BOOL v6 = [(FMMapView *)self isAllAnnotationsShown];
  uint64_t v7 = [(FMMapView *)self viewForAnnotation:v4];
  [(FMMapView *)self setCurrentSelectedState:1];
  [(FMMapView *)self setSelectedAnnotationView:v7];
  [(FMMapView *)self setSelectedAnnotation:v4];
  uint64_t v8 = [(FMMapView *)self selectedAnnotationView];
  id v9 = v8;
  if (v6) {
    [v8 setSelected:1 animated:1 delay:0.400000006];
  }
  else {
    [v8 setSelected:1 animated:1];
  }

  [(FMMapView *)self setCanSelectUserAnnotation:0];
  long long v10 = [(FMMapView *)self userSelectionTimer];

  if (v10)
  {
    int v11 = [(FMMapView *)self userSelectionTimer];
    [v11 invalidate];

    [(FMMapView *)self setUserSelectionTimer:0];
  }
  long long v12 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_updateCanSelectUserAnnotation selector:0 userInfo:0 repeats:0.5];
  [(FMMapView *)self setUserSelectionTimer:v12];

  long long v13 = [v7 annotation];
  [(FMMapView *)self updateOverlayForAnnotation:v13 withForce:1];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 didSelectAnnotation:v4];
  }
  if ([(FMMapView *)self showUserLocationCallout])
  {
    id v14 = [(FMMapView *)self mapView];
    uint64_t v15 = [(FMMapView *)self mapView];
    id v16 = [v15 userLocation];
    [v14 deselectAnnotation:v16 animated:1];
  }
  if (![(FMMapView *)self isMapPositioningDisabled])
  {
    [(FMMapView *)self _setUserTrackingMode:0 animated:1 fromTrackingButton:0];
    if ([(FMMapView *)self isAllAnnotationsShown])
    {
      [(FMMapView *)self recenterVisibleAnnotations];
      [(FMMapView *)self setIsAllAnnotationsShown:0];
    }
  }
  if ([(FMMapView *)self renderingMode])
  {
    [(FMMapView *)self updateCameraPositionForAnnotation:v4];
  }
  else if (v6)
  {
    dispatch_time_t v17 = dispatch_time(0, 400000000);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __33__FMMapView_didSelectAnnotation___block_invoke;
    double v21 = &unk_2643350A0;
    double v22 = self;
    id v23 = v4;
    dispatch_after(v17, MEMORY[0x263EF83A0], &v18);
  }
  else
  {
    [(FMMapView *)self slideAnnotationIntoViewIfNeeded:v4];
  }
  [(FMMapView *)self depthSortAnnotations];
}

uint64_t __33__FMMapView_didSelectAnnotation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) slideAnnotationIntoViewIfNeeded:*(void *)(a1 + 40)];
}

- (void)updateCanSelectUserAnnotation
{
}

- (void)didDoubleSelectAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self delegate];
  BOOL v6 = [(FMMapView *)self viewForAnnotation:v4];
  [(FMMapView *)self setIsMapPositioningDisabled:0];
  [(FMMapView *)self _setUserTrackingMode:0 animated:1 fromTrackingButton:0];
  [(FMMapView *)self setCurrentSelectedState:2];
  [(FMMapView *)self setSelectedAnnotationView:v6];
  [(FMMapView *)self setSelectedAnnotation:v4];
  [v6 setSelected:1 animated:1];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 didDoubleSelectAnnotation:v4];
  }
  if ([(FMMapView *)self doubleSelectionMode])
  {
    dispatch_time_t v7 = dispatch_time(0, 500000000);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __39__FMMapView_didDoubleSelectAnnotation___block_invoke;
    v8[3] = &unk_2643350A0;
    v8[4] = self;
    id v9 = v6;
    dispatch_after(v7, MEMORY[0x263EF83A0], v8);
  }
  else
  {
    [(FMMapView *)self repositionOnAnnotation:v4 withZoom:1];
  }
}

uint64_t __39__FMMapView_didDoubleSelectAnnotation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectOrDeselectAnnotationView:*(void *)(a1 + 40)];
}

- (void)selectOrDeselectAnnotationView:(id)a3
{
  id v7 = a3;
  -[FMMapView deselectAnnotationViewIfNeeded:](self, "deselectAnnotationViewIfNeeded:");
  int64_t v4 = [(FMMapView *)self currentSelectedState];
  switch(v4)
  {
    case 2:
      BOOL v6 = [v7 annotation];
      [(FMMapView *)self didSelectAnnotation:v6];
LABEL_8:

      break;
    case 1:
      BOOL v6 = [v7 annotation];
      [(FMMapView *)self didDoubleSelectAnnotation:v6];
      goto LABEL_8;
    case 0:
      id v5 = [v7 annotation];
      [(FMMapView *)self didSelectAnnotation:v5];

      if (![(FMMapView *)self renderingMode]) {
        [(FMMapView *)self setIsMapPositioningDisabled:1];
      }
      break;
  }
  MEMORY[0x270F9A758]();
}

- (void)addOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  [v5 addOverlay:v4];
}

- (void)addOverlays:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  [v5 addOverlays:v4];
}

- (void)removeOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  [v5 removeOverlay:v4];
}

- (void)removeOverlays:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  [v5 removeOverlays:v4];
}

- (void)updateOverlayForAnnotation:(id)a3 withForce:(BOOL)a4
{
  BOOL v4 = a4;
  id v41 = a3;
  if (![v41 hasKnownLocation]
    || ([v41 isThisDevice] & 1) != 0
    || ([(FMMapView *)self selectedAnnotation],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 != v41))
  {
    [(FMMapView *)self removeAllOverlaysAndCurrentAnnotationOverlay:v41];
    goto LABEL_5;
  }
  id v7 = [(FMMapView *)self mapView];
  [v7 _zoomLevel];
  double v9 = v8;

  [v41 coordinate];
  double v11 = v10;
  double v13 = v12;
  id v14 = [(FMMapView *)self viewForAnnotation:v41];
  if (v14)
  {
    [(FMMapView *)self coordinateForAnnotationView:v14];
    double v11 = v15;
    double v13 = v16;
  }
  double v17 = v9 * 0.0000999999975;
  if ([(FMMapView *)self isMapAnimating]
    || [(FMMapView *)self isFingerOnMap]
    || [(FMMapView *)self isPreviewing])
  {
LABEL_13:
    if ([(FMMapView *)self shouldDisplayOverlay])
    {
      uint64_t v18 = [v41 overlay];
      BOOL v19 = [(FMMapView *)self isOverlayOnMap:v18];

      if (v19 && !v4) {
        goto LABEL_32;
      }
    }
    v20 = [v41 overlay];
    [v20 coordinate];
    if (vabdd_f64(v21, v11) <= v17)
    {
      double v22 = [v41 overlay];
      [v22 coordinate];
      if (vabdd_f64(v23, v13) <= v17)
      {
        [v41 horizontalAccuracy];
        double v25 = v24;
        double v26 = [v41 overlay];
        [v26 radius];
        if (v25 == v27 && !v4)
        {
          int v28 = [(FMMapView *)self shouldDisplayOverlay];

          if (v28) {
            goto LABEL_32;
          }
          goto LABEL_30;
        }
      }
    }

LABEL_30:
    [(FMMapView *)self setShouldDisplayOverlay:1];
    [v41 coordinate];
    id v33 = v41;
    double v11 = v34;
    double v13 = v35;
    goto LABEL_31;
  }
  double v29 = [v41 overlay];
  [v29 coordinate];
  if (vabdd_f64(v30, v11) > v17) {
    goto LABEL_25;
  }
  double v31 = [v41 overlay];
  [v31 coordinate];
  if (vabdd_f64(v32, v13) > v17)
  {

LABEL_25:
    goto LABEL_26;
  }
  [v41 horizontalAccuracy];
  double v37 = v36;
  double v38 = [v41 overlay];
  [v38 radius];
  double v40 = v39;

  if (v37 == v40) {
    goto LABEL_13;
  }
LABEL_26:
  [(FMMapView *)self setShouldDisplayOverlay:0];
  id v33 = v41;
LABEL_31:
  -[FMMapView refreshOverlayForAnnotation:andCoordinate:](self, "refreshOverlayForAnnotation:andCoordinate:", v33, v11, v13);
LABEL_32:

LABEL_5:
}

- (void)refreshOverlayForAnnotation:(id)a3 andCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  [(FMMapView *)self removeAllOverlaysAndCurrentAnnotationOverlay:v7];
  [v7 horizontalAccuracy];
  double v9 = +[MKCircle circleWithCenterCoordinate:radius:](FMAccuracyOverlay, "circleWithCenterCoordinate:radius:", latitude, longitude, v8);
  [v7 setOverlay:v9];

  double v10 = [v7 overlay];
  [v10 setParentAnnotation:v7];

  double v11 = [(FMMapView *)self mapView];
  double v12 = [v7 overlay];
  [v11 addOverlay:v12];

  id v14 = [(FMMapView *)self accuracyOverlays];
  double v13 = [v7 overlay];

  [v14 addObject:v13];
}

- (void)removeAllOverlaysAndCurrentAnnotationOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self mapView];
  id v6 = [v4 overlay];

  [v5 removeOverlay:v6];
  id v7 = [(FMMapView *)self mapView];
  double v8 = [(FMMapView *)self accuracyOverlays];
  [v7 removeOverlays:v8];

  id v9 = [(FMMapView *)self accuracyOverlays];
  [v9 removeAllObjects];
}

- (BOOL)isOverlayOnMap:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(FMMapView *)self mapView];
  id v6 = [v5 overlays];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isEqual:v4])
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)updateCameraPositionWithLocation:(CLLocationCoordinate2D)a3 andAltitude:(double)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  if (![(FMMapView *)self isUserSwiping])
  {
    id v9 = [(FMMapView *)self mapView];
    uint64_t v8 = objc_msgSend(MEMORY[0x263F10940], "cameraLookingAtCenterCoordinate:fromEyeCoordinate:eyeAltitude:", latitude, longitude, latitude, longitude, a4);
    [v9 setCamera:v8 animated:0];
  }
}

- (void)updateCameraPositionForAnnotation:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FMMapView *)self selectedAnnotation];
  id v6 = [(FMMapView *)self currentDeviceAnnotation];
  uint64_t v7 = [(FMMapView *)self otherSelectedAnnotation];
  uint64_t v8 = [(FMMapView *)self userLocation];
  if (![(FMMapView *)self isUserSwiping]
    && [(FMMapView *)self currentTrackingMode] != 2
    && ![(FMMapView *)self isPreventingMapUpdates])
  {
    if ([v4 isEqual:v5] && !-[FMMapView isMapAnimating](self, "isMapAnimating"))
    {
      if (![(FMMapView *)self isMapPositioningDisabled]
        && [(FMMapView *)self currentTrackingMode] != 2)
      {
        if ([(FMMapView *)self currentTrackingMode]
          || [(FMMapView *)self isAllAnnotationsShown])
        {
          if (v5)
          {
            if (v8)
            {
              if (([v6 isEqual:v5] & 1) == 0)
              {
                v38[0] = v5;
                v38[1] = v8;
                v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
                [(FMMapView *)self mapRectForAnnotations:v20 shouldIncludeRadius:1];
                double v22 = v21;
                double v24 = v23;
                double v26 = v25;
                double v28 = v27;

                if (v22 != *MEMORY[0x263F10858] || v24 != *(double *)(MEMORY[0x263F10858] + 8))
                {
                  double v29 = [(FMMapView *)self mapView];
                  [v29 bounds];
                  double v31 = v30 / v26;

                  [(FMMapView *)self maxZoomLevel];
                  if (v31 > v32)
                  {
                    [(FMMapView *)self maxZoomLevel];
                    -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v22, v24, v26, v28, v33);
                    double v22 = v34;
                    double v24 = v35;
                    double v26 = v36;
                    double v28 = v37;
                  }
                  -[FMMapView updateCameraPositionForMapRect:withZoom:](self, "updateCameraPositionForMapRect:withZoom:", 1, v22, v24, v26, v28);
                }
              }
            }
          }
        }
        else if ([(FMMapView *)self currentSelectedState] == 2 {
               || [(FMMapView *)self currentSelectedState] == 1
        }
               || [v4 isEqual:v6])
        {
          [(FMMapView *)self repositionOnAnnotation:v5 withZoom:1];
        }
      }
      [(FMMapView *)self updateOverlayForAnnotation:v4 withForce:1];
    }
    else if (![(FMMapView *)self isAllAnnotationsShown] {
           || [(FMMapView *)self currentSelectedState]
    }
           || v7)
    {
      if ([(FMMapView *)self userTrackingMode] == 1
        && v8
        && !v5
        && ![(FMMapView *)self currentSelectedState]
        && !v7)
      {
        uint64_t v18 = [(FMMapView *)self nearbyAnnotations];
        BOOL v19 = (void *)[v18 mutableCopy];

        [v19 addObject:v8];
        [(FMMapView *)self mapRectForAnnotations:v19 shouldIncludeRadius:1];
        -[FMMapView repositionOnMapRectIfNeeded:](self, "repositionOnMapRectIfNeeded:");
      }
    }
    else
    {
      id v9 = [(FMMapView *)self nearbyAnnotations];
      [(FMMapView *)self mapRectForAnnotations:v9 shouldIncludeRadius:1];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      -[FMMapView repositionOnMapRectIfNeeded:](self, "repositionOnMapRectIfNeeded:", v11, v13, v15, v17);
    }
  }
}

- (void)repositionOnMapRectIfNeeded:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  [(FMMapView *)self lastVisibleMapRect];
  double v9 = v8;
  [(FMMapView *)self lastVisibleMapRect];
  if (v6 != *MEMORY[0x263F10858] || v5 != *(double *)(MEMORY[0x263F10858] + 8))
  {
    double v12 = var0 * var1 / (v9 * v10);
    if (v12 < 0.7 || v12 > 1.3)
    {
      -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 1, v6, v5, var0, var1);
    }
  }
}

- (void)setIsMapPositioningDisabled:(BOOL)a3
{
  self->_isMapPositioningDisabled = a3;
}

- (void)updateCameraPositionForNoLocation
{
  [(FMMapView *)self lastVisibleMapRect];
  double v5 = v4 + -10000.0;
  if (v3 + -10000.0 != *MEMORY[0x263F10858] || v5 != *(double *)(MEMORY[0x263F10858] + 8))
  {
    -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 1);
  }
}

- (void)displayAllAnnotations
{
  if (![(FMMapView *)self isPreventingMapUpdates])
  {
    double v3 = [(FMMapView *)self selectedAnnotation];
    [(FMMapView *)self setIsGoingBackToAllAnnotation:v3 != 0];

    [(FMMapView *)self deselectAllAnnotations];
    [(FMMapView *)self setSelectedAnnotation:0];
    [(FMMapView *)self setSelectedAnnotationView:0];
    [(FMMapView *)self setIsAllAnnotationsShown:1];
    [(FMMapView *)self setIsMapPositioningDisabled:0];
    double v4 = [(FMMapView *)self layoutTimer];
    [v4 invalidate];

    [(FMMapView *)self setLayoutTimer:0];
    [(FMMapView *)self animateToAllAnnotation];
    [(FMMapView *)self setIsGoingBackToAllAnnotation:0];
  }
}

- (void)animateToAllAnnotation
{
  [(FMMapView *)self setRenderingMode:0];
  double v3 = [(FMMapView *)self nearbyAnnotations];
  [(FMMapView *)self mapRectForAnnotations:v3 shouldIncludeRadius:1];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(FMMapView *)self _setUserTrackingMode:0 animated:1 fromTrackingButton:0];
  if (v5 != *MEMORY[0x263F10858] || v7 != *(double *)(MEMORY[0x263F10858] + 8))
  {
    -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 1, v5, v7, v9, v11);
  }
}

- (void)setRenderingMode:(int64_t)a3
{
  if (self->_renderingMode != a3)
  {
    self->_renderingMode = a3;
    if (a3 == 1)
    {
      [(FMMapView *)self setCurrentTrackingMode:0];
      [(FMMapView *)self _setUserTrackingMode:0 animated:0 fromTrackingButton:0];
    }
    [(FMMapView *)self animateRenderingModeChange];
  }
}

- (void)animateRenderingModeChange
{
  [(FMMapView *)self setIsMapAnimating:0];
  [(FMMapView *)self setIsMapPositioningDisabled:0];
  [(FMMapView *)self setIsAllAnnotationsShown:0];
  id v3 = [(FMMapView *)self selectedAnnotation];
  [(FMMapView *)self updateCameraPositionForAnnotation:v3];
}

- (void)refreshCameraPosition
{
  if (![(FMMapView *)self isUserSwiping])
  {
    [(FMMapView *)self lastVisibleMapRect];
    -[FMMapView updateCameraPositionForMapRect:withZoom:](self, "updateCameraPositionForMapRect:withZoom:", 1);
    [(FMMapView *)self depthSortAnnotations];
  }
}

- (void)updateCameraPositionForMapRect:(id)a3 withZoom:(BOOL)a4
{
  BOOL v4 = a4;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v7 = a3.var0.var1;
  double v8 = a3.var0.var0;
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (![(FMMapView *)self isMapPositioningDisabled]
    && ![(FMMapView *)self isUserSwiping])
  {
    double v10 = [(FMMapView *)self delegate];
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "edgeInsetsForState:", -[FMMapView currentSelectedState](self, "currentSelectedState"));
      double v12 = v11;
      double v38 = v14;
      double v39 = v13;
      CGFloat v16 = v15;
      double v17 = LogCategory_Unspecified();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v45.top = v12;
        v45.right = v38;
        v45.left = v39;
        v45.bottom = v16;
        uint64_t v18 = NSStringFromUIEdgeInsets(v45);
        *(_DWORD *)buf = 138412546;
        id v41 = v18;
        __int16 v42 = 2048;
        int64_t v43 = [(FMMapView *)self currentSelectedState];
        _os_log_impl(&dword_218714000, v17, OS_LOG_TYPE_DEFAULT, "FMMapView: delegate insets %@ currentState: %ld", buf, 0x16u);
      }
    }
    else
    {
      double v12 = 38.0;
      double v38 = 38.0;
      double v39 = 38.0;
      CGFloat v16 = 38.0;
    }
    double v37 = v16;
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend(v10, "attributionInsetsForState:", -[FMMapView currentSelectedState](self, "currentSelectedState"));
      uint64_t v36 = v19;
      uint64_t v21 = v20;
      double v23 = v22;
      unint64_t v25 = v24;
    }
    else
    {
      double v23 = 6.0;
      uint64_t v36 = 0;
      unint64_t v25 = 0xC043000000000000;
      uint64_t v21 = 0;
    }
    BOOL v26 = v8 == *MEMORY[0x263F10858] && v7 == *(double *)(MEMORY[0x263F10858] + 8);
    if (!v26
      || (var0 == *(double *)(MEMORY[0x263F10858] + 16)
        ? (BOOL v27 = var1 == *(double *)(MEMORY[0x263F10858] + 24))
        : (BOOL v27 = 0),
          !v27))
    {
      [(FMMapView *)self lastVisibleMapRect];
      if (v31 != v8
        || v28 != v7
        || v29 != var0
        || v30 != var1
        || ([(FMMapView *)self lastVisibleInsets], v35 != v39)
        || v32 != v12
        || v34 != v38
        || v33 != v37
        || [(FMMapView *)self isMapMoved])
      {
        -[FMMapView animateMapToPosition:withInsets:attributionInsets:andZoom:](self, "animateMapToPosition:withInsets:attributionInsets:andZoom:", v4, v8, v7, var0, var1, v12, v39, v37, v38, v36, v21, *(void *)&v23, v25);
      }
    }
  }
}

- (void)animateMapToPosition:(double)a3 withInsets:(double)a4 attributionInsets:(double)a5 andZoom:(double)a6
{
  *(void *)&v171[9] = *MEMORY[0x263EF8340];
  double v28 = [a1 selectedAnnotation];
  double v29 = [a1 mapView];
  [v29 visibleMapRect];
  double v31 = v30;

  double v166 = a4;
  double v161 = a2;
  double v162 = a3;
  double v163 = a5;
  double v32 = a3 + a5 * 0.5;
  double v33 = [a1 mapView];
  [v33 visibleMapRect];
  double v36 = v35 + v34 * 0.5;
  double v37 = [a1 mapView];
  [v37 visibleMapRect];
  double v40 = v39 + v38 * 0.5;

  v172.x = a2 + a4 * 0.5;
  v172.y = v32;
  v174.x = v36;
  v174.y = v40;
  double v41 = MKMetersBetweenMapPoints(v172, v174);
  __int16 v42 = LogCategory_Unspecified();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    [(FMMapView *)a1 animateMapToPosition:a6 withInsets:a7 attributionInsets:a8 andZoom:a9];
  }

  [a1 safeAreaInsets];
  double v44 = v43;
  [a1 safeAreaInsets];
  double v46 = v45;
  int v47 = [a1 isAllAnnotationsShown];
  unsigned __int8 v48 = [a1 isAllAnnotationsShown];
  v49 = [a1 mapView];
  [v49 _zoomLevel];
  if (v41 <= 600000.0 / v50)
  {
    double v52 = fmin(vabdd_f64(v31, v166) / 10000.0, 0.5);
    if (v52 < 0.4) {
      int v53 = 1;
    }
    else {
      int v53 = v47;
    }
    if (v53) {
      double v52 = 0.4;
    }
    if ((v48 & (v28 != 0)) != 0) {
      double v52 = 0.5;
    }
    if (a11) {
      double v51 = v52;
    }
    else {
      double v51 = 0.4;
    }
  }
  else
  {

    if (![a1 isAllAnnotationsShown]
      || v28
      || [a1 isGoingBackToAllAnnotation])
    {
      double v51 = 0.0;
    }
    else
    {
      double v51 = 0.4;
    }
  }
  v54 = LogCategory_Unspecified();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    int v55 = [a1 isMapAnimating];
    v56 = [a1 layoutTimer];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v169 = v55;
    *(_WORD *)&v169[4] = 1024;
    *(_DWORD *)&v169[6] = v56 != 0;
    LOWORD(v170) = 1024;
    *(_DWORD *)((char *)&v170 + 2) = [a1 isPreventingMapUpdates];
    HIWORD(v170) = 2048;
    *(double *)v171 = v51;
    _os_log_impl(&dword_218714000, v54, OS_LOG_TYPE_DEFAULT, "animateMapToPosition isMapAnimating(%d) layoutTimer(%d) isPreventingMapUpdates(%d) duration(%f)", buf, 0x1Eu);
  }
  if (([a1 isMapAnimating] & 1) == 0)
  {
    v57 = [a1 layoutTimer];
    if (!v57 && ![a1 isPreventingMapUpdates]) {
      goto LABEL_27;
    }
  }
  if (v51 == 0.0)
  {
LABEL_27:
    CGFloat insets = a7;
    double v157 = a8;
    double v159 = a6 + v44;
    double v160 = a8 + v46;
    objc_msgSend(a1, "setIsMapAnimating:", 1, *(void *)&v51);
    [a1 setIsMapMoved:0];
    uint64_t v58 = [a1 renderingMode];
    v59 = [a1 mapView];
    v60 = v59;
    if (v58)
    {
      objc_msgSend(v59, "_setEdgeInsets:", v159, a7, v160, a9);
      double v62 = v162;
      double v61 = v163;
      double v63 = v166;
      double v64 = v161;
    }
    else
    {
      objc_msgSend(v59, "mapRectThatFits:edgePadding:", a2, v162, v166, v163, v159, a7, v160, a9);
      double v64 = v65;
      double v62 = v66;
      double v63 = v67;
      double v61 = v68;

      v60 = [a1 mapView];
      objc_msgSend(v60, "_setEdgeInsets:", 38.0, 38.0, 38.0, 38.0);
    }

    v69 = [a1 mapView];
    objc_msgSend(v69, "_setAttributionInsets:", a12, a13, a14, a15);

    v70 = [a1 mapView];
    [v70 bounds];
    double v72 = v71 - (a7 + a9);
    double v74 = v73 - (v159 + v160);

    v75 = objc_msgSend(MEMORY[0x263F10940], "_cameraLookingAtMapRect:forViewSize:", v64, v62, v63, v61, v72, v74);
    v76 = [a1 mapView];
    v77 = [v76 camera];
    [v77 altitude];
    double v79 = v78;
    [v75 altitude];
    double v81 = vabdd_f64(v79, v80);
    v82 = [a1 mapView];
    v83 = [v82 camera];
    [v83 centerCoordinate];
    double v85 = v84;
    double v87 = v86;
    [v75 centerCoordinate];
    objc_msgSend(a1, "distanceBetweenOrigin:andDestination:", v85, v87, v88, v89);
    [a1 dampingForAltitude:v81 andDistance:v90];
    int v92 = v91;

    v93 = LogCategory_Unspecified();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      v173.width = v72;
      v173.height = v74;
      v152 = NSStringFromCGSize(v173);
      v153 = [a1 mapView];
      [v153 bounds];
      v154 = NSStringFromCGRect(v175);
      v176.top = v159;
      v176.bottom = v160;
      v176.left = insets;
      v176.right = a9;
      v155 = NSStringFromUIEdgeInsets(v176);
      *(_DWORD *)buf = 138412802;
      *(void *)v169 = v152;
      *(_WORD *)&v169[8] = 2112;
      v170 = v154;
      v171[0] = 2112;
      *(void *)&v171[1] = v155;
      _os_log_debug_impl(&dword_218714000, v93, OS_LOG_TYPE_DEBUG, "FMMapView: viewSize: %@ bounds: %@ safeInsets: %@", buf, 0x20u);
    }
    uint64_t v94 = [a1 renderingMode];
    [v75 centerCoordinate];
    BOOL v97 = v96 >= -180.0;
    if (v96 > 180.0) {
      BOOL v97 = 0;
    }
    if (v95 < -90.0) {
      BOOL v97 = 0;
    }
    if (v95 > 90.0) {
      BOOL v97 = 0;
    }
    if (v94)
    {
      if (v97)
      {
        v98 = objc_msgSend(MEMORY[0x263F10940], "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:");

        v99 = [a1 mapView];
        v100 = [v99 camera];
        [v100 altitude];
        double v102 = v101;
        [v98 altitude];
        double v104 = vabdd_f64(v102, v103);
        v105 = [a1 mapView];
        v106 = [v105 camera];
        [v106 centerCoordinate];
        double v108 = v107;
        double v110 = v109;
        [v98 centerCoordinate];
        objc_msgSend(a1, "distanceBetweenOrigin:andDestination:", v108, v110, v111, v112);
        [a1 dampingForAltitude:v104 andDistance:v113];
        int v92 = v114;

        v75 = v98;
      }
      [v75 centerCoordinate];
      if (v116 >= -180.0 && v116 <= 180.0 && v115 >= -90.0 && v115 <= 90.0)
      {
        double v117 = a9;
        v118 = LogCategory_Unspecified();
        double v119 = insets;
        if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG)) {
          -[FMMapView animateMapToPosition:withInsets:attributionInsets:andZoom:]((uint64_t)v75, v118);
        }

        v120 = [a1 mapView];
        v122 = v120;
        LODWORD(v123) = 1128792064;
        LODWORD(v124) = 1.0;
        v125 = v75;
        double v126 = v156;
        goto LABEL_48;
      }
    }
    else if (v97)
    {
      double v117 = a9;
      v127 = [a1 cameraBefore3DRendering];

      v120 = [a1 mapView];
      v122 = v120;
      double v119 = insets;
      double v126 = v156;
      if (v127)
      {
        v128 = [v120 camera];
        [v128 altitude];
        double v130 = v129;
        v131 = [a1 cameraBefore3DRendering];
        [v131 altitude];
        double v133 = vabdd_f64(v130, v132);
        v134 = [a1 mapView];
        v135 = [v134 camera];
        [v135 centerCoordinate];
        double v137 = v136;
        double v139 = v138;
        v140 = [a1 cameraBefore3DRendering];
        [v140 centerCoordinate];
        objc_msgSend(a1, "distanceBetweenOrigin:andDestination:", v137, v139, v141, v142);
        [a1 dampingForAltitude:v133 andDistance:v143];
        LODWORD(v133) = v144;

        v145 = [a1 cameraBefore3DRendering];
        [v145 setPitch:0.0];

        v146 = [a1 mapView];
        v147 = [a1 cameraBefore3DRendering];
        LODWORD(v148) = 1128792064;
        LODWORD(v149) = 1.0;
        LODWORD(v150) = LODWORD(v133);
        double v119 = insets;
        [v146 setCamera:v147 duration:v156 springMass:v149 springStiffness:v148 springDamping:v150 springVelocity:0.0];

        [a1 setCameraBefore3DRendering:0];
        goto LABEL_53;
      }
      LODWORD(v123) = 1128792064;
      LODWORD(v124) = 1.0;
      v125 = v75;
LABEL_48:
      LODWORD(v121) = v92;
      [v120 setCamera:v125 duration:v126 springMass:v124 springStiffness:v123 springDamping:v121 springVelocity:0.0];

LABEL_53:
      objc_msgSend(a1, "setLastVisibleMapRect:", v161, v162, v166, v163);
      objc_msgSend(a1, "setLastVisibleInsets:", a6, v119, v157, v117);
      dispatch_time_t v151 = dispatch_time(0, (uint64_t)(v126 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke;
      block[3] = &unk_2643350E8;
      block[4] = a1;
      *(double *)&block[5] = v161;
      *(double *)&block[6] = v162;
      *(double *)&block[7] = v166;
      *(double *)&block[8] = v163;
      *(double *)&block[9] = a6;
      *(CGFloat *)&block[10] = insets;
      *(double *)&block[11] = v157;
      *(double *)&block[12] = v117;
      dispatch_after(v151, MEMORY[0x263EF83A0], block);

      goto LABEL_54;
    }
    double v117 = a9;
    double v119 = insets;
    double v126 = v156;
    goto LABEL_53;
  }
LABEL_54:
}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsMapAnimating:0];
  [*(id *)(a1 + 32) depthSortAnnotations];
  [*(id *)(a1 + 32) synchronize];
  if ([*(id *)(a1 + 32) isAllAnnotationsShown])
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2;
    v4[3] = &__block_descriptor_96_e5_v8__0l;
    long long v2 = *(_OWORD *)(a1 + 56);
    long long v5 = *(_OWORD *)(a1 + 40);
    long long v6 = v2;
    long long v3 = *(_OWORD *)(a1 + 88);
    long long v7 = *(_OWORD *)(a1 + 72);
    long long v8 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v4);
  }
}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2(double *a1)
{
  v24[4] = *MEMORY[0x263EF8340];
  long long v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v23[0] = @"x";
  long long v3 = [NSNumber numberWithDouble:a1[4]];
  v24[0] = v3;
  v23[1] = @"y";
  BOOL v4 = [NSNumber numberWithDouble:a1[5]];
  v24[1] = v4;
  v23[2] = @"width";
  long long v5 = [NSNumber numberWithDouble:a1[6]];
  v24[2] = v5;
  v23[3] = @"height";
  long long v6 = [NSNumber numberWithDouble:a1[7]];
  v24[3] = v6;
  long long v7 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];

  v21[0] = @"top";
  long long v8 = [NSNumber numberWithDouble:a1[8]];
  v22[0] = v8;
  v21[1] = @"left";
  double v9 = [NSNumber numberWithDouble:a1[9]];
  v22[1] = v9;
  v21[2] = @"bottom";
  double v10 = [NSNumber numberWithDouble:a1[10]];
  v22[2] = v10;
  v21[3] = @"right";
  double v11 = [NSNumber numberWithDouble:a1[11]];
  v22[3] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  id v20 = 0;
  double v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v20];
  id v14 = v20;
  [v2 setObject:v13 forKey:@"FMMapViewLastVisibleRect"];

  if (v14)
  {
    double v15 = LogCategory_Unspecified();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_2((uint64_t)v14, v15);
    }
  }
  id v19 = 0;
  CGFloat v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v19];
  id v17 = v19;
  [v2 setObject:v16 forKey:@"FMMapViewLastVisibleInsets"];

  if (v17)
  {
    uint64_t v18 = LogCategory_Unspecified();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_1((uint64_t)v17, v18);
    }
  }
}

- ($2A298E9A48029832219C371D8B4CA722)repositionOnAnnotation:(id)a3 withZoom:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = *MEMORY[0x263F10858];
  double v8 = *(double *)(MEMORY[0x263F10858] + 8);
  double v9 = *(double *)(MEMORY[0x263F10858] + 16);
  double v10 = *(double *)(MEMORY[0x263F10858] + 24);
  double v11 = [(FMMapView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v12 = v8;
    double v13 = v7;
    if (objc_opt_respondsToSelector())
    {
      [v11 mapPositionForAnnotation:v6];
      double v13 = v14;
      double v12 = v15;
      double v9 = v16;
      double v10 = v17;
    }
    if (v13 == v7 && v12 == v8)
    {
      id v19 = [(FMMapView *)self userLocation];
      [v6 coordinate];
      double v21 = v20;
      double v23 = v22;
      if (v19 && [v6 isThisDevice])
      {
        [v19 coordinate];
        double v21 = v24;
        double v23 = v25;
      }
      [v6 horizontalAccuracy];
      -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v21, v23, v26);
      double v13 = v27;
      double v12 = v28;
      double v9 = v29;
      double v10 = v30;
    }
    if (v13 != v7 || v12 != v8)
    {
      [(FMMapView *)self setIsAllAnnotationsShown:0];
      [(FMMapView *)self setIsMapPositioningDisabled:0];
      -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", v4, v13, v12, v9, v10);
    }
  }
  else
  {
    double v12 = v8;
    double v13 = v7;
  }

  double v32 = v13;
  double v33 = v12;
  double v34 = v9;
  double v35 = v10;
  result.var1.double var1 = v35;
  result.var1.double var0 = v34;
  result.var0.double var1 = v33;
  result.var0.double var0 = v32;
  return result;
}

- (void)repositionToMapRect:(id)a3 withZoom:(BOOL)a4
{
  double var1 = a3.var0.var1;
  double var0 = a3.var0.var0;
  if (a3.var0.var0 != *MEMORY[0x263F10858] || a3.var0.var1 != *(double *)(MEMORY[0x263F10858] + 8))
  {
    BOOL v7 = a4;
    double v8 = a3.var1.var1;
    double v9 = a3.var1.var0;
    double v11 = [(FMMapView *)self mapView];
    [v11 bounds];
    double v13 = v12 / v9;

    [(FMMapView *)self maxZoomLevel];
    if (v13 > v14)
    {
      [(FMMapView *)self maxZoomLevel];
      -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", var0, var1, v9, v8, v15);
      double var0 = v16;
      double var1 = v17;
      double v9 = v18;
      double v8 = v19;
    }
    -[FMMapView updateCameraPositionForMapRect:withZoom:](self, "updateCameraPositionForMapRect:withZoom:", v7, var0, var1, v9, v8);
  }
}

- (void)recenterVisibleAnnotations
{
  long long v3 = [(FMMapView *)self nearbyAnnotations];
  [(FMMapView *)self mapRectForAnnotations:v3 shouldIncludeRadius:0];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (v5 != *MEMORY[0x263F10858] || v7 != *(double *)(MEMORY[0x263F10858] + 8))
  {
    double v13 = [(FMMapView *)self mapView];
    [v13 bounds];
    double v15 = v14 / v9;

    [(FMMapView *)self maxZoomLevel];
    if (v15 > v16)
    {
      [(FMMapView *)self maxZoomLevel];
      -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v5, v7, v9, v11, v17);
      double v5 = v18;
      double v7 = v19;
      double v9 = v20;
      double v11 = v21;
    }
    [(FMMapView *)self setIsMapPositioningDisabled:0];
    -[FMMapView repositionToMapRect:withZoom:](self, "repositionToMapRect:withZoom:", 0, v5, v7, v9, v11);
  }
}

- (void)slideAnnotationIntoViewIfNeeded:(id)a3
{
  id v27 = a3;
  double v4 = [(FMMapView *)self delegate];
  double v5 = [(FMMapView *)self mapView];
  [v27 coordinate];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(FMMapView *)self mapView];
  objc_msgSend(v5, "convertCoordinate:toPointToView:", v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "annotationOnScreenTopThresholdForState:", -[FMMapView currentSelectedState](self, "currentSelectedState"));
  }
  else {
    double v15 = 185.0;
  }
  double v16 = v27;
  double v17 = v15 - v14;
  if (v12 < 82.0)
  {
    double v22 = 82.0 - v12;
  }
  else
  {
    double v18 = [(FMMapView *)self mapView];
    [v18 frame];
    double v20 = v19 + -82.0;

    if (v17 <= 0.0 && v12 <= v20) {
      goto LABEL_13;
    }
    double v22 = 0.0;
    double v16 = v27;
    if (v12 > v20)
    {
      double v23 = [(FMMapView *)self mapView];
      [v23 frame];
      double v22 = v24 + -82.0 - v12;

      double v16 = v27;
    }
  }
  [v16 coordinate];
  -[FMMapView moveCenterByOffset:from:](self, "moveCenterByOffset:from:", v22, fmax(v17, 0.0), v25, v26);
LABEL_13:
}

- (void)moveCenterByOffset:(CGPoint)a3 from:(CLLocationCoordinate2D)a4
{
  double y = a3.y;
  double x = a3.x;
  double v7 = [(FMMapView *)self mapView];
  double v8 = [(FMMapView *)self mapView];
  [v8 centerCoordinate];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(FMMapView *)self mapView];
  objc_msgSend(v7, "convertCoordinate:toPointToView:", v13, v10, v12);
  double v15 = v14;
  double v17 = v16;

  double v18 = [(FMMapView *)self mapView];
  double v19 = [(FMMapView *)self mapView];
  objc_msgSend(v18, "convertPoint:toCoordinateFromView:", v19, v15 - x, v17 - y);
  double v21 = v20;
  double v23 = v22;

  v26.double latitude = v21;
  v26.double longitude = v23;
  if (CLLocationCoordinate2DIsValid(v26))
  {
    id v24 = [(FMMapView *)self mapView];
    objc_msgSend(v24, "setCenterCoordinate:animated:", 1, v21, v23);
  }
}

- ($2A298E9A48029832219C371D8B4CA722)mapRectForAnnotations:(id)a3 shouldIncludeRadius:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double x = *MEMORY[0x263F10858];
  double y = *(double *)(MEMORY[0x263F10858] + 8);
  double width = *(double *)(MEMORY[0x263F10858] + 16);
  double height = *(double *)(MEMORY[0x263F10858] + 24);
  v56 = [(FMMapView *)self selectedAnnotation];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (!v12)
  {

    goto LABEL_28;
  }
  uint64_t v13 = v12;
  int v54 = !v4;
  char v55 = 0;
  uint64_t v14 = *(void *)v60;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v60 != v14) {
        objc_enumerationMutation(v11);
      }
      double v16 = *(void **)(*((void *)&v59 + 1) + 8 * v15);
      [v16 coordinate];
      if (-[FMMapView isValidLocation:](self, "isValidLocation:"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          double v17 = [(FMMapView *)self otherSelectedAnnotation];
          if ([v16 isEqual:v17])
          {
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) == 0)
            {

              goto LABEL_18;
            }
            int v18 = [v16 hasKnownLocation];

            if (!v18) {
              goto LABEL_18;
            }
          }
        }
        [v16 coordinate];
        double v20 = v19;
        double v22 = v21;
        double v23 = 20.0;
        double v57 = width;
        double v58 = height;
        double v24 = x;
        double v25 = y;
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (([(FMMapView *)self isAllAnnotationsShown] | v54) & 1) == 0)
        {
          [v16 horizontalAccuracy];
          double v23 = v26;
        }
        -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v20, v22, v23);
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        if ([v16 isEqual:v56])
        {
          -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v20, v22, 400.0);
          double v28 = v35;
          double v30 = v36;
          double v32 = v37;
          double v34 = v38;
          char v55 = 1;
        }
        v65.origin.double x = v24;
        v65.origin.double y = v25;
        v65.size.double width = v57;
        v65.size.double height = v58;
        v70.origin.double x = v28;
        v70.origin.double y = v30;
        v70.size.double width = v32;
        v70.size.double height = v34;
        MKMapRect v66 = MKMapRectUnion(v65, v70);
        double x = v66.origin.x;
        double y = v66.origin.y;
        double width = v66.size.width;
        double height = v66.size.height;
      }
LABEL_18:
      ++v15;
    }
    while (v13 != v15);
    uint64_t v39 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
    uint64_t v13 = v39;
  }
  while (v39);

  if (v55)
  {
    if (width / *(double *)(MEMORY[0x263F10860] + 16) >= height / *(double *)(MEMORY[0x263F10860] + 24)) {
      double v40 = width / *(double *)(MEMORY[0x263F10860] + 16);
    }
    else {
      double v40 = height / *(double *)(MEMORY[0x263F10860] + 24);
    }
    [v56 coordinate];
    double v42 = v41;
    double v44 = v43;
    [v56 horizontalAccuracy];
    -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v42, v44, v45);
    v71.origin.double x = v46;
    v71.size.double width = v47;
    v71.origin.double y = v48 - v40 * 45000000.0;
    v71.size.double height = v40 * 45000000.0 + v49;
    v67.origin.double x = x;
    v67.origin.double y = y;
    v67.size.double width = width;
    v67.size.double height = height;
    MKMapRect v68 = MKMapRectUnion(v67, v71);
    double x = v68.origin.x;
    double y = v68.origin.y;
    double width = v68.size.width;
    double height = v68.size.height;
  }
LABEL_28:

  double v50 = x;
  double v51 = y;
  double v52 = width;
  double v53 = height;
  result.var1.double var1 = v53;
  result.var1.double var0 = v52;
  result.var0.double var1 = v51;
  result.var0.double var0 = v50;
  return result;
}

- ($2A298E9A48029832219C371D8B4CA722)normalizeMapRect:(id)a3 toZoomScale:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v7 = a3.var0.var1;
  double v8 = a3.var0.var0;
  double v9 = [(FMMapView *)self mapView];
  [v9 bounds];
  double v11 = var0 - v10 / a4;

  double v12 = v8;
  double v13 = v7;
  double v14 = var0;
  double v15 = var1;
  return ($2A298E9A48029832219C371D8B4CA722)MKMapRectInset(*(MKMapRect *)&v12, v11 * 0.5, v11 * 0.5);
}

- ($2A298E9A48029832219C371D8B4CA722)mapRectMakeWithRadialDistanceForCoordinate:(CLLocationCoordinate2D)a3 andRadius:(double)a4
{
  MEMORY[0x270EF5918](self, a2, (__n128)a3, *(__n128 *)&a3.longitude, a4);
  result.var1.double var1 = v7;
  result.var1.double var0 = v6;
  result.var0.double var1 = v5;
  result.var0.double var0 = v4;
  return result;
}

- (BOOL)isValidLocation:(CLLocationCoordinate2D)a3
{
  return a3.longitude != 0.0 && a3.latitude != 0.0;
}

- (void)flashMapInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v8 = [(FMMapView *)self mapView];
  [v8 frame];
  double v10 = left + v9;
  double v12 = top + v11;
  double v14 = v13 - (left + right);
  double v16 = v15 - (top + bottom);

  double v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v10, v12, v14, v16);
  [v17 setUserInteractionEnabled:0];
  int v18 = [MEMORY[0x263F1C550] greenColor];
  double v19 = [v18 colorWithAlphaComponent:0.5];
  [v17 setDebugHighlight:v19];

  id v20 = [MEMORY[0x263F1C550] redColor];
  uint64_t v21 = [v20 CGColor];
  double v22 = [v17 layer];
  [v22 setBorderColor:v21];

  double v23 = [v17 layer];
  [v23 setBorderWidth:1.0];

  [(FMMapView *)self addSubview:v17];
  double v24 = (void *)MEMORY[0x263F1CB60];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __27__FMMapView_flashMapInset___block_invoke;
  v28[3] = &unk_264335110;
  id v29 = v17;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __27__FMMapView_flashMapInset___block_invoke_2;
  v26[3] = &unk_264335138;
  id v27 = v29;
  id v25 = v29;
  [v24 animateWithDuration:v28 animations:v26 completion:6.0];
}

uint64_t __27__FMMapView_flashMapInset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __27__FMMapView_flashMapInset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (id)nearbyAnnotations
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v3 = [(FMMapView *)self userLocation];
  double v4 = objc_opt_new();
  double v5 = [(FMMapView *)self annotationsSortedByDistance];
  if ([(FMMapView *)self isNearbyModeDisabled]) {
    goto LABEL_2;
  }
  if ([v5 count])
  {
    double v24 = v3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          double v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v15 conformsToProtocol:&unk_26CA058F8])
          {
            [v15 distanceFromUser];
            double v17 = v16;
            if (v16 >= 16000.0)
            {
              unint64_t v18 = [v4 count];
              if ((v17 >= 160000.0 || v18 >= 4) && (v17 >= 160000.0 || v17 + -100.0 > v13)) {
                goto LABEL_23;
              }
            }
            [v4 addObject:v15];
            double v13 = v17;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }
LABEL_23:

    long long v3 = v24;
  }
  if (![v4 count])
  {
    if (!v3 || ([v3 coordinate], v22 == 0.0) || (objc_msgSend(v3, "coordinate"), v23 == 0.0))
    {
LABEL_2:
      double v6 = [(FMMapView *)self mapView];
      double v7 = [v6 annotations];
      uint64_t v8 = [v7 mutableCopy];

      double v4 = (void *)v8;
      goto LABEL_25;
    }
    [v4 addObject:v3];
  }
LABEL_25:

  return v4;
}

- (id)annotationsSortedByDistance
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v3 = [(FMMapView *)self userLocation];
  double v4 = objc_opt_new();
  if (v3)
  {
    id v5 = objc_alloc(MEMORY[0x263F00A50]);
    [v3 coordinate];
    double v7 = v6;
    long long v25 = v3;
    [v3 coordinate];
    uint64_t v8 = objc_msgSend(v5, "initWithLatitude:longitude:", v7);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = [(FMMapView *)self mapView];
    uint64_t v10 = [v9 annotations];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v15 conformsToProtocol:&unk_26CA058F8])
          {
            [v15 coordinate];
            double v17 = v16;
            double v19 = v18;
            [v15 coordinate];
            if (v20 != -180.0)
            {
              [v15 coordinate];
              if (v21 != -180.0)
              {
                double v22 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v17 longitude:v19];
                [v8 distanceFromLocation:v22];
                objc_msgSend(v15, "setDistanceFromUser:");
                [v4 addObject:v15];
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    double v23 = [v4 sortedArrayUsingComparator:&__block_literal_global_2];

    long long v3 = v25;
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

uint64_t __40__FMMapView_annotationsSortedByDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = NSNumber;
  id v5 = a3;
  [a2 distanceFromUser];
  double v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 distanceFromUser];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (CLLocationCoordinate2D)coordinateForAnnotationView:(id)a3
{
  double v4 = [a3 layer];
  id v5 = [v4 presentationLayer];
  [v5 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v25.origin.double x = v7;
  v25.origin.double y = v9;
  v25.size.double width = v11;
  v25.size.double height = v13;
  double MidX = CGRectGetMidX(v25);
  v26.origin.double x = v7;
  v26.origin.double y = v9;
  v26.size.double width = v11;
  v26.size.double height = v13;
  double MidY = CGRectGetMidY(v26);
  double v16 = [(FMMapView *)self mapView];
  double v17 = [(FMMapView *)self mapView];
  objc_msgSend(v16, "convertPoint:toCoordinateFromView:", v17, MidX, MidY);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.double longitude = v23;
  result.double latitude = v22;
  return result;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = (FMMapView *)a4;
  double v6 = [(FMMapView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v6 customViewForAnnotation:v5],
        (CGFloat v7 = (FMUserLocationView *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    CGFloat v9 = [(FMMapView *)self mapView];
    double v10 = v9;
    if (isKindOfClass)
    {
      CGFloat v7 = [v9 dequeueReusableAnnotationViewWithIdentifier:@"FMMKUserAnnotationReuseIdentifier"];

      if (!v7)
      {
        CGFloat v7 = [(MKUserLocationView *)[FMUserLocationView alloc] initWithAnnotation:v5 reuseIdentifier:@"FMMKUserAnnotationReuseIdentifier"];
        [(MKAnnotationView *)v7 setEnabled:0];
        [(FMUserLocationView *)v7 setUserInteractionEnabled:0];
        [(MKUserLocationView *)v7 setCanShowCallout:[(FMMapView *)self showUserLocationCallout]];
        CGFloat v11 = [(FMMapView *)self userLocationTintColor];
        [(FMUserLocationView *)v7 setTintColor:v11];

        [(FMMapView *)self setUserLocationView:v7];
        [(FMMapView *)self setUserLocation:v5];
        if ([(FMMapView *)self showUserLocationCallout])
        {
          double v12 = [MEMORY[0x263F1C488] buttonWithType:4];
          CGFloat v13 = [(FMMapView *)self tintColor];
          [v12 setTintColor:v13];

          [(MKAnnotationView *)v7 setEnabled:0];
          [(MKUserLocationView *)v7 setRightCalloutAccessoryView:v12];
          if (objc_opt_respondsToSelector()) {
            [v6 updateTitlesForAnnotation:v5];
          }
        }
      }
    }
    else
    {
      CGFloat v7 = [v9 dequeueReusableAnnotationViewWithIdentifier:@"FMAnnotationViewReuseIdentifier"];

      if (!v7)
      {
        double v14 = objc_alloc_init(FMMapAnnotationGestureRecognizer);
        double v15 = [FMAnnotationView alloc];
        double v16 = [(FMMapView *)v5 tintColor];
        if (v16) {
          double v17 = v5;
        }
        else {
          double v17 = self;
        }
        double v18 = [(FMMapView *)v17 tintColor];
        CGFloat v7 = [(FMAnnotationView *)v15 initWithAnnotation:v5 reuseIdentifier:@"FMAnnotationViewReuseIdentifier" tintColor:v18];

        [(MKAnnotationView *)v7 setEnabled:0];
        [(FMMapAnnotationGestureRecognizer *)v14 setTouchDelegate:self];
        [(FMUserLocationView *)v7 addGestureRecognizer:v14];
        if (objc_opt_respondsToSelector())
        {
          double v19 = [(FMMapView *)self delegate];
          [v19 annotationViewOfferedForLocationPreview:v7];
        }
      }
      if ([(FMMapView *)v5 isThisDevice]) {
        [(FMMapView *)self setCurrentDeviceAnnotation:v5];
      }
      double v20 = [(FMMapView *)self selectedAnnotation];
      int v21 = [(FMMapView *)v5 isEqual:v20];

      if (v21)
      {
        int64_t v22 = [(FMMapView *)self renderingMode];
        if ([(FMMapView *)self isFingerOnMap]) {
          [(MKAnnotationView *)v7 setSelected:1 animated:1];
        }
        else {
          [(FMUserLocationView *)v7 setSelected:1 animated:1 delay:dbl_21872F300[v22 == 1]];
        }
      }
      [(FMUserLocationView *)v7 updateStyleForAnnotation:v5];
    }
  }

  return v7;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        CGFloat v11 = [v10 annotation];
        double v12 = [(FMMapView *)self selectedAnnotation];
        int v13 = [v11 isEqual:v12];

        if (v13) {
          [(FMMapView *)self setSelectedAnnotationView:v10];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v14 = [v10 annotation];
          [v10 updateStyleForAnnotation:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  [(FMMapView *)self depthSortAnnotations];
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(FMMapView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 customRendererForOverlay:v5];
    if (v7) {
      goto LABEL_18;
    }
  }
  if (![(FMMapView *)self shouldDisplayOverlay]) {
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    CGFloat v9 = [v8 parentAnnotation];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F108A0]) initWithCircle:v8];
    if ([v9 conformsToProtocol:&unk_26CA058F8])
    {
      id v10 = v9;
      CGFloat v11 = [(FMMapView *)self viewForAnnotation:v10];
      double v12 = [(FMMapView *)self mapView];
      uint64_t v13 = [v12 mapType];

      if (v13)
      {
        double v22 = 0.0;
        double v23 = 0.0;
        double v20 = 0.0;
        double v21 = 0.0;
        double v14 = [v10 tintColor];
        [v14 getHue:&v23 saturation:&v22 brightness:&v21 alpha:&v20];

        long long v15 = [MEMORY[0x263F1C550] colorWithHue:v23 saturation:v22 brightness:v21 + 0.4 alpha:v20];
        [v7 setFillColor:v15];
        [v7 setAlpha:0.15];
      }
      else
      {
        long long v17 = [v11 tintColor];
        [v7 setFillColor:v17];

        [v7 setAlpha:0.2];
      }
    }
    if (!v7)
    {
LABEL_15:
      long long v18 = LogCategory_Unspecified();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[FMMapView mapView:rendererForOverlay:](v18);
      }

      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F109C8]) initWithOverlay:v5];
    }
  }
  else
  {
    long long v16 = LogCategory_Unspecified();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[FMMapView mapView:rendererForOverlay:](v16);
    }

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F109C8]) initWithOverlay:v5];
    if (!v7) {
      goto LABEL_15;
    }
  }
LABEL_18:

  return v7;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || ([v11 isUserInteractionEnabled])
  {
    id v5 = [(FMMapView *)self selectedAnnotationView];
    if (v5 == v11)
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        [(FMMapView *)self setPotentiallySelectedAnnotationView:v11];
        uint64_t v7 = [(FMMapView *)self potentiallySelectedAnnotationView];
        [(FMMapView *)self selectOrDeselectAnnotationView:v7];
LABEL_11:

        goto LABEL_14;
      }
    }
    id v8 = [v11 annotation];
    [(FMMapView *)self setOtherSelectedAnnotation:v8];

    -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", *MEMORY[0x263F10858], *(double *)(MEMORY[0x263F10858] + 8), *(double *)(MEMORY[0x263F10858] + 16), *(double *)(MEMORY[0x263F10858] + 24));
    goto LABEL_14;
  }
  if ([(FMMapView *)self showUserLocationCallout]
    && [(FMMapView *)self canSelectUserAnnotation])
  {
    uint64_t v7 = [(FMMapView *)self selectedAnnotationView];
    [(FMMapView *)self deselectAnnotationView:v7];
    goto LABEL_11;
  }
  if (![(FMMapView *)self canSelectUserAnnotation])
  {
    CGFloat v9 = [(FMMapView *)self mapView];
    id v10 = [v11 annotation];
    [v9 deselectAnnotation:v10 animated:0];

    [v11 setSelected:0 animated:0];
  }
LABEL_14:
  [(FMMapView *)self depthSortAnnotations];
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  id v11 = a4;
  [v11 setSelected:1 animated:0];
  id v5 = [v11 annotation];
  uint64_t v6 = [(FMMapView *)self userLocation];
  int v7 = [v5 isEqual:v6];

  if (v7) {
    [v11 setEnabled:0];
  }
  id v8 = [v11 annotation];
  CGFloat v9 = [(FMMapView *)self otherSelectedAnnotation];
  int v10 = [v8 isEqual:v9];

  if (v10) {
    [(FMMapView *)self setOtherSelectedAnnotation:0];
  }
  [(FMMapView *)self depthSortAnnotations];
}

- (void)clearUserLocation
{
  hasUserLocation = 0;
  [(FMMapView *)self setUserLocation:0];
  id v3 = [(FMMapView *)self currentDeviceAnnotation];
  [(FMMapView *)self updateAnnotationStyle:v3];
}

- (void)depthSortAnnotations
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v23 = [MEMORY[0x263F3B9F0] stopwatchWithLabel:@"depthSortAnnotations"];
  [(FMMapView *)self otherSelectedAnnotation];
  v22 = double v21 = self;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(FMMapView *)self mapView];
  double v4 = [v3 _annotationViews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    double v24 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v26;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        id v11 = [v10 annotation];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v7;
          id v7 = v10;
LABEL_8:

          goto LABEL_12;
        }
        if ([v11 conformsToProtocol:&unk_26CA058F8])
        {
          id v12 = v11;
          if ([v12 isThisDevice])
          {
            id v13 = v10;

            double v24 = v13;
          }
          else
          {
            [v10 _setZIndex:20];
          }
          goto LABEL_8;
        }
LABEL_12:

        ++v9;
      }
      while (v6 != v9);
      uint64_t v14 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v6 = v14;
      if (!v14) {
        goto LABEL_18;
      }
    }
  }
  double v24 = 0;
  id v7 = 0;
LABEL_18:

  [v24 _setZIndex:19];
  long long v15 = [(FMMapView *)v21 selectedAnnotationView];
  if ([v15 isEqual:v24])
  {

    uint64_t v16 = 2147483645;
  }
  else
  {
    uint64_t v17 = [(FMMapView *)v21 currentTrackingMode];

    if (v17) {
      uint64_t v16 = 2147483645;
    }
    else {
      uint64_t v16 = 18;
    }
  }
  [v7 setPreferredZIndex:v16];
  [v7 _setZIndex:v16];
  if (v24 && [(FMMapView *)v21 currentTrackingMode])
  {
    [v7 setPreferredZIndex:2147483645];
    [v7 _setZIndex:2147483645];
    [v24 _setZIndex:0x7FFFFFFFLL];
  }
  if ([(FMMapView *)v21 showUserLocationCallout]
    && v7
    && [v7 isSelected])
  {
    [v7 setPreferredZIndex:2147483645];
    [v7 _setZIndex:2147483645];
  }
  long long v18 = [(FMMapView *)v21 selectedAnnotationView];
  [v18 _setZIndex:2147483646];

  if (v22)
  {
    double v19 = [(FMMapView *)v21 mapView];
    double v20 = [v19 viewForAnnotation:v22];

    if (v20) {
      [v20 _setZIndex:2147483646];
    }
  }
  [v23 stop];
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  if ([(FMMapView *)self canChangeUserTrackingMode])
  {
    [(FMMapView *)self setCanChangeUserTrackingMode:0];
    [(FMMapView *)self updateAccordingToUserTrackingMode];
  }
}

- (void)updateAccordingToUserTrackingMode
{
  v41[2] = *MEMORY[0x263EF8340];
  id v3 = [(FMMapView *)self userLocation];
  double v4 = [(FMMapView *)self lastSelectedAnnotationBeforeTracking];
  uint64_t v5 = [(FMMapView *)self selectedAnnotation];
  uint64_t v6 = [(FMMapView *)self otherSelectedAnnotation];
  double v7 = *MEMORY[0x263F10858];
  double v8 = *(double *)(MEMORY[0x263F10858] + 8);
  double v9 = *(double *)(MEMORY[0x263F10858] + 16);
  double v10 = *(double *)(MEMORY[0x263F10858] + 24);
  [(FMMapView *)self setIsMapPositioningDisabled:0];
  [(FMMapView *)self setIsAllAnnotationsShown:0];
  [(FMMapView *)self setIsSwitchingTrackingMode:1];
  -[FMMapView setLastVisibleMapRect:](self, "setLastVisibleMapRect:", v7, v8, v9, v10);
  id v11 = [(FMMapView *)self mapView];
  uint64_t v12 = [v11 userTrackingMode];

  if (v12 == 2) {
    goto LABEL_14;
  }
  if (v12 != 1)
  {
    if (v4)
    {
      [(FMMapView *)self updateCameraPositionForAnnotation:v4];
      [(FMMapView *)self setLastSelectedAnnotationBeforeTracking:0];
    }
    else
    {
      [(FMMapView *)self setIsMapMoved:1];
      [(FMMapView *)self displayAllAnnotations];
    }
LABEL_14:
    double v20 = v8;
    double v18 = v7;
    goto LABEL_15;
  }
  [(FMMapView *)self setLastSelectedAnnotationBeforeTracking:v5];
  if (v5 | v6 && v3)
  {
    if (v5) {
      id v13 = (void *)v5;
    }
    else {
      id v13 = (void *)v6;
    }
    v41[0] = v13;
    v41[1] = v3;
    uint64_t v14 = (void *)MEMORY[0x263EFF8C0];
    id v15 = v13;
    uint64_t v16 = [v14 arrayWithObjects:v41 count:2];

    [(FMMapView *)self mapRectForAnnotations:v16 shouldIncludeRadius:1];
    double v18 = v17;
    double v20 = v19;
    double v9 = v21;
    double v10 = v22;
  }
  else
  {
    double v20 = v8;
    double v18 = v7;
    if (v3)
    {
      double v23 = [(FMMapView *)self nearbyAnnotations];
      double v24 = (void *)[v23 mutableCopy];

      [v24 addObject:v3];
      [(FMMapView *)self mapRectForAnnotations:v24 shouldIncludeRadius:1];
      double v18 = v25;
      double v20 = v26;
      double v9 = v27;
      double v10 = v28;
    }
  }
LABEL_15:
  if (v18 == v7 && v20 == v8)
  {
    [(FMMapView *)self setIsSwitchingTrackingMode:0];
    [(FMMapView *)self setCanChangeUserTrackingMode:1];
  }
  else
  {
    uint64_t v30 = [(FMMapView *)self mapView];
    [v30 bounds];
    double v32 = v31 / v9;

    [(FMMapView *)self maxZoomLevel];
    if (v32 > v33)
    {
      [(FMMapView *)self maxZoomLevel];
      -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v18, v20, v9, v10, v34);
      double v18 = v35;
      double v20 = v36;
      double v9 = v37;
      double v10 = v38;
    }
    dispatch_time_t v39 = dispatch_time(0, 30000000);
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke;
    v40[3] = &unk_264335180;
    v40[4] = self;
    *(double *)&v40[5] = v18;
    *(double *)&v40[6] = v20;
    *(double *)&v40[7] = v9;
    *(double *)&v40[8] = v10;
    dispatch_after(v39, MEMORY[0x263EF83A0], v40);
  }
}

void __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateCameraPositionForMapRect:withZoom:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) setIsSwitchingTrackingMode:0];
  dispatch_time_t v2 = dispatch_time(0, 30000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke_2;
  block[3] = &unk_264335110;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

uint64_t __46__FMMapView_updateAccordingToUserTrackingMode__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCanChangeUserTrackingMode:1];
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  int64_t v7 = [(FMMapView *)self userTrackingMode];
  if (a3 == 2)
  {
    [(FMMapView *)self setIsMapPositioningDisabled:0];
    double v8 = [(FMMapView *)self userTrackingButton];
    [v8 _setState:3];
    uint64_t v9 = 2;
  }
  else
  {
    double v8 = [(FMMapView *)self userTrackingButton];
    if (a3 == 1)
    {
      [v8 _setState:2];
      uint64_t v9 = 1;
    }
    else
    {
      [v8 _setState:0];
      uint64_t v9 = 0;
    }
  }

  [(FMMapView *)self setCurrentTrackingMode:v9];
  double v10 = [(FMMapView *)self mapView];
  [v10 setUserTrackingMode:a3 animated:1];

  if (v7 != a3)
  {
    [(FMMapView *)self depthSortAnnotations];
  }
}

- (int64_t)userTrackingMode
{
  int64_t v2 = [(FMMapView *)self currentTrackingMode];
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (BOOL)canRotateForHeading
{
  return [MEMORY[0x263F00A60] headingAvailable];
}

- (BOOL)isCurrentlyRotated
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FMMapView.m" lineNumber:1476 description:@"FIXME: Test this code path.  As of Whitetail MapKit was never calling this method and it was just added for protocol conformance."];

  uint64_t v5 = [(FMMapView *)self mapView];
  LOBYTE(self) = [v5 isCurrentlyRotated];

  return (char)self;
}

- (void)updateUserTrackingButtonState
{
  uint64_t v2 = hasUserLocation;
  id v3 = [(FMMapView *)self userTrackingButton];
  [v3 setEnabled:v2];
}

- (BOOL)hasUserLocation
{
  return hasUserLocation;
}

+ (BOOL)hasUserLocation
{
  return hasUserLocation;
}

- (void)synchronize
{
  id v22 = [MEMORY[0x263F3B9F0] stopwatchWithLabel:@"FMMapView.synchronize"];
  id v3 = [(FMMapView *)self userLocation];
  double v4 = [(FMMapView *)self userLocationView];
  uint64_t v5 = [(FMMapView *)self currentDeviceAnnotation];
  uint64_t v6 = (void *)v5;
  if (v3)
  {
    if (v5)
    {
      [v4 center];
      if (v4)
      {
        double v9 = v7;
        double v10 = v8;
        id v11 = [(FMMapView *)self viewForAnnotation:v6];
        [v4 center];
        double v13 = v12;
        [v4 center];
        double v15 = v14;
        [v11 center];
        double v17 = v16;
        [v11 center];
        if (v11
          && llround(v13 * v15) != llround(v17 * v18)
          && ![(FMMapView *)self isMapAnimating]
          && hasUserLocation == 1)
        {
          objc_msgSend(v11, "setCenter:", v9, v10);
        }
      }
    }
  }
  double v19 = [(FMMapView *)self selectedAnnotationView];

  if (v19)
  {
    double v20 = [(FMMapView *)self selectedAnnotationView];
    double v21 = [v20 annotation];
    [(FMMapView *)self updateOverlayForAnnotation:v21 withForce:0];
  }
  if (![(FMMapView *)self isMapAnimating]) {
    [(FMMapView *)self updateUserTrackingButtonState];
  }
  [v22 stop];
}

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  id v13 = a4;
  uint64_t v5 = [(FMMapView *)self currentDeviceAnnotation];
  uint64_t v6 = [(FMMapView *)self delegate];
  [(FMMapView *)self setUserLocation:v13];
  if (v13 && v5)
  {
    [v13 coordinate];
    double v8 = v7;
    [v5 coordinate];
    if (vabdd_f64(v8, v9) >= 0.0001
      || ([v13 coordinate], double v11 = v10, objc_msgSend(v5, "coordinate"), vabdd_f64(v11, v12) >= 0.0001))
    {
      [v13 coordinate];
      objc_msgSend(v5, "setCoordinate:");
      [(FMMapView *)self updateCameraPositionForAnnotation:v5];
      [(FMMapView *)self setIsMapAnimating:0];
      [(FMMapView *)self synchronize];
    }
LABEL_11:
    if ([(FMMapView *)self showUserLocationCallout]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v6 updateTitlesForAnnotation:v13];
    }
    goto LABEL_14;
  }
  if (hasUserLocation == 1
    && [(FMMapView *)self isAllAnnotationsShown]
    && ![(FMMapView *)self isMapPositioningDisabled])
  {
    [(FMMapView *)self displayAllAnnotations];
  }
  if (v13) {
    goto LABEL_11;
  }
LABEL_14:
  if ((hasUserLocation & 1) == 0)
  {
    hasUserLocation = 1;
    if (v5) {
      [(FMMapView *)self updateAnnotationStyle:v5];
    }
    if ([(FMMapView *)self isAllAnnotationsShown]
      && ![(FMMapView *)self isMapPositioningDisabled])
    {
      [(FMMapView *)self setIsMapAnimating:0];
      [(FMMapView *)self setIsUserLocationUpdated:1];
      [(FMMapView *)self displayAllAnnotations];
    }
  }
}

- (void)updateAnnotationStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(FMMapView *)self viewForAnnotation:v4];
  [v5 updateStyleForAnnotation:v4];
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if ([(FMMapView *)self isMapMoved])
  {
    [(FMMapView *)self setIsFingerOnMap:0];
  }
}

- (void)mapTouchBegan:(id)a3
{
}

- (void)mapTouchEnded:(id)a3
{
  if (![(FMMapView *)self isMapMoved])
  {
    [(FMMapView *)self setIsFingerOnMap:0];
  }
}

- (void)mapTouchMoved:(id)a3
{
  if (![(FMMapView *)self isPreviewing])
  {
    uint64_t v6 = [(FMMapView *)self delegate];
    [(FMMapView *)self setIsMapPositioningDisabled:1];
    [(FMMapView *)self setIsMapMoved:1];
    id v4 = [(FMMapView *)self mapView];
    uint64_t v5 = [v4 userTrackingMode];

    if (v5 != 2) {
      [(FMMapView *)self _setUserTrackingMode:0 animated:1 fromTrackingButton:0];
    }
    [(FMMapView *)self depthSortAnnotations];
    if (![(FMMapView *)self renderingMode] && v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 userDidMoveMap];
    }
    MEMORY[0x270F9A790]();
  }
}

- (void)calloutButtonTapped:(id)a3
{
  id v4 = [(FMMapView *)self delegate];
  if (![(FMMapView *)self isFingerOnAnnotation]
    && [(FMMapView *)self showUserLocationCallout]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v4 userDidTapUserLocationCallOut];
  }
}

- (void)userLocationTapped:(id)a3
{
  if ([(FMMapView *)self showUserLocationCallout])
  {
    id v4 = [(FMMapView *)self mapView];
    uint64_t v5 = [v4 userLocation];

    if (v5)
    {
      uint64_t v6 = [(FMMapView *)self mapView];
      double v7 = [(FMMapView *)self mapView];
      double v8 = [v7 userLocation];
      double v9 = [v6 viewForAnnotation:v8];

      dispatch_time_t v10 = dispatch_time(0, 500000000);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __32__FMMapView_userLocationTapped___block_invoke;
      v12[3] = &unk_2643350A0;
      id v13 = v9;
      double v14 = self;
      id v11 = v9;
      dispatch_after(v10, MEMORY[0x263EF83A0], v12);
    }
  }
}

void __32__FMMapView_userLocationTapped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:1];
  uint64_t v2 = [*(id *)(a1 + 40) mapView];
  id v3 = [v2 selectedAnnotations];
  id v4 = [v3 firstObject];
  uint64_t v5 = [*(id *)(a1 + 32) annotation];
  int v6 = [v4 isEqual:v5];

  id v9 = [*(id *)(a1 + 40) mapView];
  double v7 = [*(id *)(a1 + 40) mapView];
  double v8 = [v7 userLocation];
  if (v6) {
    [v9 deselectAnnotation:v8 animated:1];
  }
  else {
    [v9 selectAnnotation:v8 animated:1];
  }
}

- (void)mapTapped:(id)a3
{
  if (![(FMMapView *)self isPreviewing])
  {
    id v7 = [(FMMapView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      char v4 = [v7 shouldTapDeselectAnnotation] ^ 1;
    }
    else {
      char v4 = 0;
    }
    [(FMMapView *)self setIsUserSwiping:0];
    if (![(FMMapView *)self renderingMode] && (v4 & 1) == 0)
    {
      [(FMMapView *)self _setUserTrackingMode:0 animated:1 fromTrackingButton:0];
      uint64_t v5 = [(FMMapView *)self selectedAnnotationView];

      if (v5)
      {
        [(FMMapView *)self setIsMapPositioningDisabled:1];
        int v6 = [(FMMapView *)self selectedAnnotationView];
        [(FMMapView *)self deselectAnnotationView:v6];
      }
    }
    if (objc_opt_respondsToSelector()) {
      [v7 userDidTapMap];
    }
    if (![(FMMapView *)self renderingMode]
      && ![(FMMapView *)self isMapPositioningDisabled]
      && [(FMMapView *)self isAllAnnotationsShown])
    {
      [(FMMapView *)self setIsMapAnimating:0];
      [(FMMapView *)self recenterVisibleAnnotations];
      [(FMMapView *)self setIsMapPositioningDisabled:1];
      [(FMMapView *)self setIsAllAnnotationsShown:0];
    }
  }
}

- (void)mapDoubleTapped:(id)a3
{
}

- (void)mapSwiped:(id)a3 withPercent:(double)a4
{
  id v6 = [(FMMapView *)self delegate];
  if (![(FMMapView *)self renderingMode] && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v6, "userDidSwipeMapWithPercent:", fmin(a4, 1.0));
  }
  [(FMMapView *)self setIsUserSwiping:1];
}

- (void)mapSwipedBegin:(id)a3
{
  char v4 = [(FMMapView *)self mapView];
  [v4 setUserInteractionEnabled:0];

  [(FMMapView *)self setIsUserSwiping:1];
}

- (void)mapSwipedEnd:(id)a3 withPercent:(double)a4
{
  id v8 = [(FMMapView *)self delegate];
  [(FMMapView *)self setIsUserSwiping:0];
  id v6 = [(FMMapView *)self layoutTimer];
  [v6 invalidate];

  [(FMMapView *)self setLayoutTimer:0];
  if (a4 < 1.0 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 userDidSwipeCancel];
  }
  id v7 = [(FMMapView *)self mapView];
  [v7 setUserInteractionEnabled:1];
}

- (void)setIsSwipeGestureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isSwipeGestureEnabled = a3;
  id v4 = [(FMMapView *)self mapGesture];
  [v4 setIsSwipeEnabled:v3];
}

- (float)dampingForAltitude:(double)a3 andDistance:(double)a4
{
  float v4 = sqrt(a4 * a4 + a3 * a3);
  if (v4 <= 350000.0) {
    float v5 = 26.0;
  }
  else {
    float v5 = 30.0;
  }
  id v6 = [(FMMapView *)self selectedAnnotation];
  if (v6) {
    float v7 = 2.0;
  }
  else {
    float v7 = 0.0;
  }

  return fminf((float)(powf(v4, v4 / 350000.0) + 17.0) + v7, v5);
}

- (double)distanceBetweenOrigin:(CLLocationCoordinate2D)a3 andDestination:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  MKMapPoint v6 = MKMapPointForCoordinate(a3);
  v14.CLLocationDegrees latitude = latitude;
  v14.CLLocationDegrees longitude = longitude;
  MKMapPoint v7 = MKMapPointForCoordinate(v14);
  double x = v7.x;
  double y = v7.y;
  double v10 = v6.x;
  double v11 = v6.y;
  return MKMetersBetweenMapPoints(*(MKMapPoint *)&v10, *(MKMapPoint *)&x);
}

- (void)fingerOnAnnotation:(id)a3
{
  float v4 = [(FMMapView *)self userLocationView];
  [(FMMapView *)self setPotentiallySelectedAnnotationView:0];
  [(FMMapView *)self setIsFingerOnAnnotation:1];
  if ([(FMMapView *)self showUserLocationCallout] && v4) {
    [v4 setSelected:0];
  }
  MEMORY[0x270F9A758]();
}

- (void)fingerOffAnnotation:(id)a3
{
  id v4 = a3;
  float v5 = [(FMMapView *)self userLocationView];
  if (![(FMMapView *)self isMapAnimating])
  {
    MKMapPoint v6 = [(FMMapView *)self potentiallySelectedAnnotationView];

    if (!v6)
    {
      MKMapPoint v7 = [v4 view];
      [(FMMapView *)self setPotentiallySelectedAnnotationView:v7];
    }
    id v8 = [(FMMapView *)self potentiallySelectedAnnotationView];
    [(FMMapView *)self selectOrDeselectAnnotationView:v8];
  }
  [(FMMapView *)self setIsFingerOnAnnotation:0];
  if ([(FMMapView *)self showUserLocationCallout] && v5)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__FMMapView_fingerOffAnnotation___block_invoke;
    block[3] = &unk_264335110;
    id v10 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __33__FMMapView_fingerOffAnnotation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:0];
}

- (void)updatePreviewLocationForAnnotation:(id)a3
{
  id v4 = a3;
  float v5 = v4;
  if (v4)
  {
    [v4 coordinate];
    CLLocationDegrees v7 = v6 + -0.0002;
    [v5 coordinate];
    CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v7, v8);
    id v10 = objc_msgSend(MEMORY[0x263F10940], "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", v9.latitude, v9.longitude, 350.0, 50.0, 0.0);
    double v11 = (void *)MEMORY[0x263F1CB60];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __48__FMMapView_updatePreviewLocationForAnnotation___block_invoke;
    v13[3] = &unk_2643351A8;
    v13[4] = self;
    id v14 = v10;
    id v15 = v5;
    id v12 = v10;
    [v11 performWithoutAnimation:v13];
  }
}

void __48__FMMapView_updatePreviewLocationForAnnotation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mapView];
  [v2 setCamera:*(void *)(a1 + 40) animated:0];

  [*(id *)(a1 + 32) updateOverlayForAnnotation:*(void *)(a1 + 48) withForce:1];
  id v3 = [*(id *)(a1 + 32) viewForAnnotation:*(void *)(a1 + 48)];
  [v3 setSelected:1 animated:0];
}

- (void)updateAnnotationPositionAfterPreview:(id)a3
{
  id v48 = a3;
  id v4 = [(FMMapView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = MEMORY[0x263F10858];
    double v6 = *MEMORY[0x263F10858];
    double v7 = *(double *)(MEMORY[0x263F10858] + 8);
    if (objc_opt_respondsToSelector())
    {
      [v4 mapPositionForAnnotation:v48];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
    }
    else
    {
      double v13 = *(double *)(v5 + 16);
      double v15 = *(double *)(v5 + 24);
      double v11 = v7;
      double v9 = v6;
    }
    if (v9 == v6 && v11 == v7)
    {
      double v17 = [(FMMapView *)self userLocation];
      [v48 coordinate];
      double v19 = v18;
      double v21 = v20;
      if (v17 && [v48 isThisDevice])
      {
        [v17 coordinate];
        double v19 = v22;
        double v21 = v23;
      }
      [v48 horizontalAccuracy];
      -[FMMapView mapRectMakeWithRadialDistanceForCoordinate:andRadius:](self, "mapRectMakeWithRadialDistanceForCoordinate:andRadius:", v19, v21, v24);
      double v9 = v25;
      double v11 = v26;
      double v13 = v27;
      double v15 = v28;
    }
    if (v9 != v6 || v11 != v7)
    {
      [(FMMapView *)self setIsAllAnnotationsShown:0];
      [(FMMapView *)self setIsMapPositioningDisabled:0];
      uint64_t v30 = [(FMMapView *)self mapView];
      [v30 bounds];
      double v32 = v31 / v13;

      [(FMMapView *)self maxZoomLevel];
      if (v32 > v33)
      {
        [(FMMapView *)self maxZoomLevel];
        -[FMMapView normalizeMapRect:toZoomScale:](self, "normalizeMapRect:toZoomScale:", v9, v11, v13, v15, v34);
        double v9 = v35;
        double v11 = v36;
        double v13 = v37;
        double v15 = v38;
      }
      v50.double x = v13 * 0.5 + v9;
      v50.double y = v15 * 0.5 + v11;
      CLLocationCoordinate2D v39 = MKCoordinateForMapPoint(v50);
      double v40 = [(FMMapView *)self mapView];
      if ([v40 mapType])
      {
        double v41 = [(FMMapView *)self traitCollection];
        double v42 = v39.latitude - dbl_21872F310[[v41 verticalSizeClass] == 2];
      }
      else
      {
        double v42 = v39.latitude + -0.0013;
      }

      if (v39.longitude >= -180.0 && v39.longitude <= 180.0 && v42 >= -90.0 && v42 <= 90.0)
      {
        double v43 = objc_msgSend(MEMORY[0x263F10940], "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", v42, v39.longitude, 400.0, 50.0, 0.0);
        double v44 = [(FMMapView *)self mapView];
        LODWORD(v45) = 1.0;
        LODWORD(v46) = 1.0;
        LODWORD(v47) = 20.0;
        [v44 setCamera:v43 duration:0.0 springMass:v45 springStiffness:v46 springDamping:v47 springVelocity:0.0];
      }
    }
  }
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
  BOOL v3 = !a3;
  id v4 = [(FMMapView *)self mapGesture];
  [v4 setEnabled:v3];
}

- (void)selectAnnotationForPreview:(id)a3
{
  id v4 = a3;
  [(FMMapView *)self deselectAnnotationViewIfNeeded:0];
  uint64_t v5 = [(FMMapView *)self viewForAnnotation:v4];
  [(FMMapView *)self setCurrentSelectedState:1];
  [(FMMapView *)self setSelectedAnnotationView:v5];
  [(FMMapView *)self setSelectedAnnotation:v4];
  [(FMMapView *)self updatePreviewLocationForAnnotation:v4];

  dispatch_time_t v6 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FMMapView_selectAnnotationForPreview___block_invoke;
  block[3] = &unk_264335110;
  void block[4] = self;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

void __40__FMMapView_selectAnnotationForPreview___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) selectedAnnotationView];
  [v1 setSelected:1 animated:0];
}

- (FMMapViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMMapViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (_MKUserTrackingButton)userTrackingButton
{
  return self->_userTrackingButton;
}

- (void)setUserTrackingButton:(id)a3
{
}

- (UIColor)userLocationTintColor
{
  return self->_userLocationTintColor;
}

- (int64_t)currentTrackingMode
{
  return self->_currentTrackingMode;
}

- (void)setCurrentTrackingMode:(int64_t)a3
{
  self->_currentTrackingMode = a3;
}

- (int64_t)doubleSelectionMode
{
  return self->_doubleSelectionMode;
}

- (void)setDoubleSelectionMode:(int64_t)a3
{
  self->_doubleSelectionMode = a3;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)isAllAnnotationsShown
{
  return self->_isAllAnnotationsShown;
}

- (void)setIsAllAnnotationsShown:(BOOL)a3
{
  self->_isAllAnnotationsShown = a3;
}

- (BOOL)isMapPositioningDisabled
{
  return self->_isMapPositioningDisabled;
}

- (BOOL)isSwipeGestureEnabled
{
  return self->_isSwipeGestureEnabled;
}

- (BOOL)isMapAnimating
{
  return self->_isMapAnimating;
}

- (void)setIsMapAnimating:(BOOL)a3
{
  self->_isMapAnimating = a3;
}

- (BOOL)isUserSwiping
{
  return self->_isUserSwiping;
}

- (void)setIsUserSwiping:(BOOL)a3
{
  self->_isUserSwiping = a3;
}

- (BOOL)isNearbyModeDisabled
{
  return self->_isNearbyModeDisabled;
}

- (void)setIsNearbyModeDisabled:(BOOL)a3
{
  self->_isNearbyModeDisabled = a3;
}

- (BOOL)showUserLocationCallout
{
  return self->_showUserLocationCallout;
}

- (void)setShowUserLocationCallout:(BOOL)a3
{
  self->_showUserLocationCallout = a3;
}

- (BOOL)isPreventingMapUpdates
{
  return self->_isPreventingMapUpdates;
}

- (void)setIsPreventingMapUpdates:(BOOL)a3
{
  self->_isPreventingMapUpdates = a3;
}

- (FMAnnotation)selectedAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedAnnotation);
  return (FMAnnotation *)WeakRetained;
}

- (void)setSelectedAnnotation:(id)a3
{
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (FMMapGestureRecognizer)mapGesture
{
  return self->_mapGesture;
}

- (void)setMapGesture:(id)a3
{
}

- ($2A298E9A48029832219C371D8B4CA722)lastVisibleMapRect
{
  double x = self->_lastVisibleMapRect.origin.x;
  double y = self->_lastVisibleMapRect.origin.y;
  double width = self->_lastVisibleMapRect.size.width;
  double height = self->_lastVisibleMapRect.size.height;
  result.var1.double var1 = height;
  result.var1.double var0 = width;
  result.var0.double var1 = y;
  result.var0.double var0 = x;
  return result;
}

- (void)setLastVisibleMapRect:(id)a3
{
  self->_lastVisibleMapRect = ($6A60F6B1D26F8A1963A84039ABF8840B)a3;
}

- (FMAnnotation)lastSelectedAnnotationBeforeTracking
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastSelectedAnnotationBeforeTracking);
  return (FMAnnotation *)WeakRetained;
}

- (void)setLastSelectedAnnotationBeforeTracking:(id)a3
{
}

- (MKMapCamera)cameraBefore3DRendering
{
  return self->_cameraBefore3DRendering;
}

- (void)setCameraBefore3DRendering:(id)a3
{
}

- (NSTimer)layoutTimer
{
  return self->_layoutTimer;
}

- (void)setLayoutTimer:(id)a3
{
}

- (double)maxZoomLevel
{
  return self->_maxZoomLevel;
}

- (void)setMaxZoomLevel:(double)a3
{
  self->_maxZoomLevel = a3;
}

- (UIEdgeInsets)lastVisibleInsets
{
  double top = self->_lastVisibleInsets.top;
  double left = self->_lastVisibleInsets.left;
  double bottom = self->_lastVisibleInsets.bottom;
  double right = self->_lastVisibleInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLastVisibleInsets:(UIEdgeInsets)a3
{
  self->_lastVisibleInsets = a3;
}

- (BOOL)isUserLocationUpdated
{
  return self->_isUserLocationUpdated;
}

- (void)setIsUserLocationUpdated:(BOOL)a3
{
  self->_isUserLocationUpdated = a3;
}

- (BOOL)canChangeUserTrackingMode
{
  return self->_canChangeUserTrackingMode;
}

- (void)setCanChangeUserTrackingMode:(BOOL)a3
{
  self->_canChangeUserTrackingMode = a3;
}

- (BOOL)isGoingBackToAllAnnotation
{
  return self->_isGoingBackToAllAnnotation;
}

- (void)setIsGoingBackToAllAnnotation:(BOOL)a3
{
  self->_isGoingBackToAllAnnotation = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (BOOL)isSwitchingTrackingMode
{
  return self->_isSwitchingTrackingMode;
}

- (void)setIsSwitchingTrackingMode:(BOOL)a3
{
  self->_isSwitchingTrackingMode = a3;
}

- (BOOL)shouldDisplayOverlay
{
  return self->_shouldDisplayOverlay;
}

- (void)setShouldDisplayOverlay:(BOOL)a3
{
  self->_shouldDisplayOverladouble y = a3;
}

- (BOOL)canSelectUserAnnotation
{
  return self->_canSelectUserAnnotation;
}

- (void)setCanSelectUserAnnotation:(BOOL)a3
{
  self->_canSelectUserAnnotation = a3;
}

- (NSTimer)userSelectionTimer
{
  return self->_userSelectionTimer;
}

- (void)setUserSelectionTimer:(id)a3
{
}

- (FMAnnotationView)potentiallySelectedAnnotationView
{
  return self->_potentiallySelectedAnnotationView;
}

- (void)setPotentiallySelectedAnnotationView:(id)a3
{
}

- (FMAnnotationView)selectedAnnotationView
{
  return self->_selectedAnnotationView;
}

- (void)setSelectedAnnotationView:(id)a3
{
}

- (MKUserLocationView)userLocationView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userLocationView);
  return (MKUserLocationView *)WeakRetained;
}

- (void)setUserLocationView:(id)a3
{
}

- (MKUserLocation)userLocation
{
  return self->_userLocation;
}

- (void)setUserLocation:(id)a3
{
}

- (FMAnnotation)currentDeviceAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentDeviceAnnotation);
  return (FMAnnotation *)WeakRetained;
}

- (void)setCurrentDeviceAnnotation:(id)a3
{
}

- (MKAnnotation)otherSelectedAnnotation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_otherSelectedAnnotation);
  return (MKAnnotation *)WeakRetained;
}

- (void)setOtherSelectedAnnotation:(id)a3
{
}

- (int64_t)currentSelectedState
{
  return self->_currentSelectedState;
}

- (void)setCurrentSelectedState:(int64_t)a3
{
  self->_currentSelectedState = a3;
}

- (NSMutableArray)accuracyOverlays
{
  return self->_accuracyOverlays;
}

- (void)setAccuracyOverlays:(id)a3
{
}

- (BOOL)isFingerOnMap
{
  return self->_isFingerOnMap;
}

- (void)setIsFingerOnMap:(BOOL)a3
{
  self->_isFingerOnMap = a3;
}

- (BOOL)isFingerOnAnnotation
{
  return self->_isFingerOnAnnotation;
}

- (void)setIsFingerOnAnnotation:(BOOL)a3
{
  self->_isFingerOnAnnotation = a3;
}

- (BOOL)isMapMoved
{
  return self->_isMapMoved;
}

- (void)setIsMapMoved:(BOOL)a3
{
  self->_isMapMoved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accuracyOverlays, 0);
  objc_destroyWeak((id *)&self->_otherSelectedAnnotation);
  objc_destroyWeak((id *)&self->_currentDeviceAnnotation);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_destroyWeak((id *)&self->_userLocationView);
  objc_storeStrong((id *)&self->_selectedAnnotationView, 0);
  objc_storeStrong((id *)&self->_potentiallySelectedAnnotationView, 0);
  objc_storeStrong((id *)&self->_userSelectionTimer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_layoutTimer, 0);
  objc_storeStrong((id *)&self->_cameraBefore3DRendering, 0);
  objc_destroyWeak((id *)&self->_lastSelectedAnnotationBeforeTracking);
  objc_storeStrong((id *)&self->_mapGesture, 0);
  objc_destroyWeak((id *)&self->_selectedAnnotation);
  objc_storeStrong((id *)&self->_userLocationTintColor, 0);
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)animateMapToPosition:(uint64_t)a1 withInsets:(NSObject *)a2 attributionInsets:andZoom:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218714000, a2, OS_LOG_TYPE_DEBUG, "FMMapView: setting 3D camera %@", (uint8_t *)&v2, 0xCu);
}

- (void)animateMapToPosition:(double)a3 withInsets:(double)a4 attributionInsets:(double)a5 andZoom:(double)a6 .cold.2(void *a1, NSObject *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v8 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)&a3);
  [a1 safeAreaInsets];
  int v10 = 138412546;
  double v11 = v8;
  __int16 v12 = 2048;
  uint64_t v13 = v9;
  _os_log_debug_impl(&dword_218714000, a2, OS_LOG_TYPE_DEBUG, "FMMapView: animateMapToPosition insets %@ safeArea: %f", (uint8_t *)&v10, 0x16u);
}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218714000, a2, OS_LOG_TYPE_ERROR, "Error archiving FMMapViewLastVisibleInsets: %@", (uint8_t *)&v2, 0xCu);
}

void __71__FMMapView_animateMapToPosition_withInsets_attributionInsets_andZoom___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218714000, a2, OS_LOG_TYPE_ERROR, "Error archiving FMMapViewLastVisibleRect: %@", (uint8_t *)&v2, 0xCu);
}

- (void)mapView:(os_log_t)log rendererForOverlay:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_218714000, log, OS_LOG_TYPE_ERROR, "No customRendererForOverlay!", v1, 2u);
}

- (void)mapView:(os_log_t)log rendererForOverlay:.cold.2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_218714000, log, OS_LOG_TYPE_ERROR, "Expected overlay to be FMAccuracyOverlay!", v1, 2u);
}

@end