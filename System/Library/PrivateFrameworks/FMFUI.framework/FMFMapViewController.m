@interface FMFMapViewController
+ (BOOL)hasUserLocation;
+ (CGSize)annotationImageSize;
- (BOOL)_isRenderingInitialMap;
- (BOOL)_refreshingIsPaused;
- (BOOL)alwaysShowAccuracy;
- (BOOL)canRotateForHeading;
- (BOOL)canSelectAnnotation:(id)a3;
- (BOOL)hasUserLocation;
- (BOOL)isCompact;
- (BOOL)isCurrentlyRotated;
- (BOOL)isLocationAlreadyOnMap:(id)a3;
- (BOOL)isMapCenteringDisabled;
- (BOOL)isSimpleMap;
- (BOOL)mapHasUserLocations;
- (BOOL)mapTypeLoaded;
- (BOOL)sessionContainsHandle:(id)a3;
- (BOOL)shouldZoomToFitMeAndLocations;
- (BOOL)shouldZoomToFitNewLocations;
- (BOOL)showFloatingMapLocationButton;
- (BOOL)singleAnnotationOnMap;
- (BOOL)viewWillAppearCalled;
- (BOOL)wasToolbarPreviouslyHidden;
- (FMFMapOptionsViewController)mapOptionsVC;
- (FMFMapViewController)init;
- (FMFMapViewController)initWithDelegate:(id)a3 handles:(id)a4;
- (FMFMapViewControllerDelegate)delegate;
- (FMFMapViewDelegateInternal)mapViewDelegate;
- (FMFNoLocationView)noLocationView;
- (FMFRefreshBarButtonItem)refreshButton;
- (FMFSession)fmfSession;
- (FMFTitleView)titleView;
- (MKMapView)mapView;
- (NSSet)_internalHandlesShowingLocations;
- (NSSet)_preloadedHandles;
- (NSSet)handlesShowingLocations;
- (NSString)debugContext;
- (NSString)description;
- (UIBarButtonItem)directionsBarButtonItem;
- (UIBarButtonItem)infoBarButtonItem;
- (UIBarButtonItem)userTrackingButtonItem;
- (UIColor)annotationTintColor;
- (UIEdgeInsets)edgeInsets;
- (UIImageView)cachedMapView;
- (_MKUserTrackingButton)userTrackingButton;
- (double)liveAnimationDuration;
- (double)nonLiveAnimationDuration;
- (id)_generateDebugContext;
- (id)_internalAnnotationTintColor;
- (id)_selectedHandleAnnotation;
- (id)annotationImageForAnnotation:(id)a3 andHandle:(id)a4;
- (id)initSimpleMapWithDelegate:(id)a3 handles:(id)a4;
- (id)locationOnMapForHandle:(id)a3 enforceServerId:(BOOL)a4;
- (id)openInAppURL;
- (id)titleViewForSelectedHandle;
- (int64_t)currentTrackingMode;
- (int64_t)userTrackingMode;
- (unint64_t)defaultMapType;
- (void)_authorizeMonitoringLocation;
- (void)_dismiss:(id)a3;
- (void)_enablePreloadedHandles:(id)a3;
- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5;
- (void)_updateDirectionsButtonEnabled;
- (void)_updateTitleViewLocation:(id)a3;
- (void)addHandlesToSession;
- (void)applicationDidBecomeActive:(id)a3;
- (void)dealloc;
- (void)deselectAllAnnotations;
- (void)destroySession;
- (void)didDeselectLocation:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didReceiveLocation:(id)a3;
- (void)didReceiveLocationForDelegateCallback:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didSelectLocation:(id)a3;
- (void)didStopAbilityToGetLocationForHandle:(id)a3;
- (void)didUpdateUserLocation:(id)a3;
- (void)enablePreloadedHandles;
- (void)getDirections;
- (void)hideCachedMap;
- (void)initializeDefaults;
- (void)loadCachedLocationsForHandles;
- (void)loadDelegate;
- (void)loadView;
- (void)mapTypeChanged:(unint64_t)a3;
- (void)mapTypeChangedNotification:(id)a3;
- (void)mapViewDidFinishRenderingMap;
- (void)openInMapsButtonTapped:(id)a3;
- (void)presentMapOptionsModal:(id)a3;
- (void)reZoomToFit;
- (void)recenterMap;
- (void)refreshButtonTapped:(id)a3;
- (void)regionDidChangeAnimated:(BOOL)a3;
- (void)regionWillChangeAnimated:(BOOL)a3;
- (void)removeAllFriendLocationsFromMap;
- (void)removeAnnotationsFromMapForHandle:(id)a3;
- (void)removeHandlesFromSession;
- (void)resumeRefreshingLocations;
- (void)selectAnnotationIfSingleForMac;
- (void)selectAnnotationIfSingleFriend:(id)a3;
- (void)setAlwaysShowAccuracy:(BOOL)a3;
- (void)setAnnotationTintColor:(id)a3;
- (void)setCachedMapView:(id)a3;
- (void)setCurrentTrackingMode:(int64_t)a3;
- (void)setDebugContext:(id)a3;
- (void)setDefaultMapType:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDirectionsBarButtonItem:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setFmfSession:(id)a3;
- (void)setHandlesShowingLocations:(id)a3;
- (void)setInfoBarButtonItem:(id)a3;
- (void)setIsMapCenteringDisabled:(BOOL)a3;
- (void)setIsSimpleMap:(BOOL)a3;
- (void)setMapOptionsVC:(id)a3;
- (void)setMapTypeLoaded:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setMapViewDelegate:(id)a3;
- (void)setNoLocationView:(id)a3;
- (void)setRefreshButton:(id)a3;
- (void)setShouldZoomToFitMeAndLocations:(BOOL)a3;
- (void)setShouldZoomToFitNewLocations:(BOOL)a3;
- (void)setShowFloatingMapLocationButton:(BOOL)a3;
- (void)setTitleView:(id)a3;
- (void)setUserTrackingButton:(id)a3;
- (void)setUserTrackingButtonItem:(id)a3;
- (void)setViewWillAppearCalled:(BOOL)a3;
- (void)setWasToolbarPreviouslyHidden:(BOOL)a3;
- (void)set_internalHandlesShowingLocations:(id)a3;
- (void)set_isRenderingInitialMap:(BOOL)a3;
- (void)set_preloadedHandles:(id)a3;
- (void)set_refreshingIsPaused:(BOOL)a3;
- (void)setupRecenterMapTimer;
- (void)setupToolbarItems;
- (void)startShowingLocationsForHandles:(id)a3;
- (void)stopRefreshingLocations;
- (void)stopShowingLocationsForHandles:(id)a3;
- (void)updateAllAnnotationsDueToAddressBookUpdate;
- (void)updateMapWithNewLocation:(id)a3 animated:(BOOL)a4;
- (void)updateNoLocationView:(BOOL)a3;
- (void)updateRefreshForLocation:(id)a3;
- (void)updateUserTrackingButtonState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillAppearWillMoveToWindowSetup;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
- (void)zoomAndSelectHandle:(id)a3;
- (void)zoomToFit;
- (void)zoomToFit:(BOOL)a3;
@end

@implementation FMFMapViewController

+ (CGSize)annotationImageSize
{
  double v2 = 72.0;
  double v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (FMFMapViewController)init
{
  double v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  v5 = @"FMFMapViewController_iPhone";
  if (v4 == 1) {
    v5 = @"FMFMapViewController_iPad";
  }
  v6 = (void *)MEMORY[0x263F086E0];
  v7 = v5;
  v8 = [v6 bundleForClass:objc_opt_class()];
  v11.receiver = self;
  v11.super_class = (Class)FMFMapViewController;
  v9 = [(FMFMapViewController *)&v11 initWithNibName:v7 bundle:v8];

  [(FMFMapViewController *)v9 initializeDefaults];
  return v9;
}

- (id)initSimpleMapWithDelegate:(id)a3 handles:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)FMFMapViewController;
  id v5 = a4;
  id v6 = a3;
  v7 = [(FMFMapViewController *)&v12 init];
  -[FMFMapViewController setDelegate:](v7, "setDelegate:", v6, v12.receiver, v12.super_class);

  [(FMFMapViewController *)v7 set_preloadedHandles:v5];
  [(FMFMapViewController *)v7 setIsSimpleMap:1];
  [(FMFMapViewController *)v7 initializeDefaults];
  v8 = [(FMFMapViewController *)v7 _generateDebugContext];
  [(FMFMapViewController *)v7 setDebugContext:v8];

  v9 = LogCategory_Daemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(FMFMapViewController *)v7 debugContext];
    *(_DWORD *)buf = 138412802;
    v14 = v7;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = @"-E2E";
    _os_log_impl(&dword_2188D1000, v9, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {context=#%@}: init (simple%@)", buf, 0x20u);
  }
  return v7;
}

- (FMFMapViewController)initWithDelegate:(id)a3 handles:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(FMFMapViewController *)self init];
  [(FMFMapViewController *)v8 setDelegate:v7];

  [(FMFMapViewController *)v8 set_preloadedHandles:v6];
  v9 = [(FMFMapViewController *)v8 _generateDebugContext];
  [(FMFMapViewController *)v8 setDebugContext:v9];

  v10 = LogCategory_Daemon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [(FMFMapViewController *)v8 debugContext];
    int v13 = 138412802;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = @" (-E2E)";
    _os_log_impl(&dword_2188D1000, v10, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {context=#%@}: init%@", (uint8_t *)&v13, 0x20u);
  }
  return v8;
}

- (id)_generateDebugContext
{
  double v2 = [MEMORY[0x263F08C38] UUID];
  double v3 = [v2 UUIDString];

  uint64_t v4 = NSString;
  unint64_t v5 = [v3 length];
  id v6 = v3;
  if (v5 >= 0x19)
  {
    id v6 = [v3 substringFromIndex:24];
  }
  id v7 = [v4 stringWithFormat:@"%@-%d", v6, getpid()];
  if (v5 >= 0x19) {

  }
  return v7;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(FMFMapViewController *)self debugContext];
    *(_DWORD *)buf = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    objc_super v11 = v4;
    _os_log_impl(&dword_2188D1000, v3, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {context=#%@}: deinit", buf, 0x16u);
  }
  unint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  [(FMFMapViewController *)self destroySession];
  id v6 = [(FMFMapViewController *)self mapView];
  [v6 setDelegate:0];

  v7.receiver = self;
  v7.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v7 dealloc];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (void)initializeDefaults
{
  +[FMAnnotationView setLargeAnnotationBorderVisible:0];
  +[FMAnnotationView setThickAnnotationBorder:1];
  [(FMFMapViewController *)self _authorizeMonitoringLocation];
  [(FMFMapViewController *)self setShouldZoomToFitNewLocations:1];
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_updateAllAnnotationsDueToAddressBookUpdate name:@"AB_CHANGED_NOTIFICATION" object:0];

  unint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_mapTypeChangedNotification_ name:@"MAP_TYPE_DEFAULT_KEY" object:0];

  -[FMFMapViewController setEdgeInsets:](self, "setEdgeInsets:", 60.0, 42.0, 60.0, 42.0);
}

- (void)_authorizeMonitoringLocation
{
  double v2 = (void *)_authorizeMonitoringLocation__locationManager;
  if (!_authorizeMonitoringLocation__locationManager)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F00A60]);
    uint64_t v4 = (void *)_authorizeMonitoringLocation__locationManager;
    _authorizeMonitoringLocation__locationManager = (uint64_t)v3;

    double v2 = (void *)_authorizeMonitoringLocation__locationManager;
  }
  if (![v2 authorizationStatus])
  {
    unint64_t v5 = (void *)_authorizeMonitoringLocation__locationManager;
    [v5 requestWhenInUseAuthorization];
  }
}

- (void)loadView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v16 loadView];
  [(FMFMapViewController *)self set_isRenderingInitialMap:1];
  if ([(FMFMapViewController *)self isSimpleMap])
  {
    id v3 = objc_alloc(MEMORY[0x263F109A8]);
    uint64_t v4 = [(FMFMapViewController *)self view];
    [v4 frame];
    unint64_t v5 = objc_msgSend(v3, "initWithFrame:");
    [(FMFMapViewController *)self setMapView:v5];

    id v6 = [(FMFMapViewController *)self mapView];
    [v6 setShowsUserLocation:1];

    [(MKMapView *)self->_mapView setAutoresizingMask:18];
    objc_super v7 = [(FMFMapViewController *)self view];
    [v7 addSubview:self->_mapView];

    v8 = [(FMFMapViewController *)self cachedMapView];
    v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_2188D1000, v9, OS_LOG_TYPE_DEFAULT, "cachedMapView = %@", buf, 0xCu);
    }
  }
  else
  {
    if (!self->_refreshButton)
    {
      __int16 v10 = [[FMFRefreshBarButtonItem alloc] initWithTarget:self action:sel_refreshButtonTapped_];
      [(FMFMapViewController *)self setRefreshButton:v10];
    }
    objc_super v11 = [(FMFMapViewController *)self titleViewForSelectedHandle];
    uint64_t v12 = [(FMFMapViewController *)self navigationItem];
    [v12 setTitleView:v11];

    refreshButton = self->_refreshButton;
    v8 = [(FMFMapViewController *)self navigationItem];
    [v8 setRightBarButtonItem:refreshButton];
  }

  v14 = [(FMFMapViewController *)self mapView];
  [v14 setShowsAttribution:0];

  if ([(FMFMapViewController *)self isSimpleMap])
  {
    __int16 v15 = [(FMFMapViewController *)self mapView];
    objc_msgSend(v15, "_setEdgeInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v3 viewDidLoad];
  [(FMFMapViewController *)self loadDelegate];
  [(FMFMapViewController *)self enablePreloadedHandles];
  [(FMFMapViewController *)self setupToolbarItems];
}

- (void)setupToolbarItems
{
  v12[5] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"DIRECTIONS" value:&stru_26CA0AD00 table:@"LocalizableUI"];

  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v4 style:0 target:self action:sel_getDirections];
  [(FMFMapViewController *)self setDirectionsBarButtonItem:v5];

  id v6 = [MEMORY[0x263F1C488] buttonWithType:4];
  [v6 addTarget:self action:sel_infoButtonTapped_ forControlEvents:64];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v6];
  [(FMFMapViewController *)self setInfoBarButtonItem:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
  v9 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
  __int16 v10 = [(FMFMapViewController *)self userTrackingButtonItem];
  v12[0] = v10;
  v12[1] = v8;
  v12[2] = self->_directionsBarButtonItem;
  v12[3] = v9;
  v12[4] = self->_infoBarButtonItem;
  objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];

  [(FMFMapViewController *)self setToolbarItems:v11];
}

- (FMFNoLocationView)noLocationView
{
  noLocationView = self->_noLocationView;
  if (!noLocationView)
  {
    uint64_t v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "Creating no location view", v29, 2u);
    }

    unint64_t v5 = [FMFNoLocationView alloc];
    id v6 = -[FMFNoLocationView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(FMFMapViewController *)self setNoLocationView:v6];

    [(FMFNoLocationView *)self->_noLocationView setDelegate:self];
    objc_super v7 = [(FMFMapViewController *)self view];
    [v7 addSubview:self->_noLocationView];

    [(FMFNoLocationView *)self->_noLocationView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(FMFMapViewController *)self view];
    v9 = (void *)MEMORY[0x263F08938];
    __int16 v10 = self->_noLocationView;
    objc_super v11 = [(FMFMapViewController *)self mapView];
    uint64_t v12 = [v9 constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:0.0];
    [v8 addConstraint:v12];

    int v13 = [(FMFMapViewController *)self view];
    v14 = (void *)MEMORY[0x263F08938];
    __int16 v15 = self->_noLocationView;
    objc_super v16 = [(FMFMapViewController *)self mapView];
    __int16 v17 = [v14 constraintWithItem:v15 attribute:4 relatedBy:0 toItem:v16 attribute:4 multiplier:1.0 constant:0.0];
    [v13 addConstraint:v17];

    v18 = [(FMFMapViewController *)self view];
    uint64_t v19 = (void *)MEMORY[0x263F08938];
    v20 = self->_noLocationView;
    v21 = [(FMFMapViewController *)self mapView];
    v22 = [v19 constraintWithItem:v20 attribute:1 relatedBy:0 toItem:v21 attribute:1 multiplier:1.0 constant:0.0];
    [v18 addConstraint:v22];

    v23 = [(FMFMapViewController *)self view];
    v24 = (void *)MEMORY[0x263F08938];
    v25 = self->_noLocationView;
    v26 = [(FMFMapViewController *)self mapView];
    v27 = [v24 constraintWithItem:v25 attribute:2 relatedBy:0 toItem:v26 attribute:2 multiplier:1.0 constant:0.0];
    [v23 addConstraint:v27];

    noLocationView = self->_noLocationView;
  }
  return noLocationView;
}

- (void)setIsMapCenteringDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isMapCenteringDisabled = a3;
  id v4 = [(FMFMapViewController *)self mapViewDelegate];
  [v4 setIsMapCenteringDisabled:v3];
}

- (double)nonLiveAnimationDuration
{
  return 0.25;
}

- (double)liveAnimationDuration
{
  return 2.0;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
  noLocationView = self->_noLocationView;
  if (noLocationView) {
    [(FMFNoLocationView *)noLocationView updateConstriantsForInsets];
  }
}

- (UIImageView)cachedMapView
{
  cachedMapView = self->_cachedMapView;
  if (!cachedMapView)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    [(FMFMapViewController *)self setCachedMapView:v4];

    unint64_t v5 = [MEMORY[0x263F1C550] clearColor];
    [(UIImageView *)self->_cachedMapView setBackgroundColor:v5];

    id v6 = [(FMFMapViewController *)self view];
    [v6 addSubview:self->_cachedMapView];

    [(UIImageView *)self->_cachedMapView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v7 = [(FMFMapViewController *)self view];
    v8 = (void *)MEMORY[0x263F08938];
    v9 = self->_cachedMapView;
    __int16 v10 = [(FMFMapViewController *)self view];
    objc_super v11 = [v8 constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:0.0];
    [v7 addConstraint:v11];

    uint64_t v12 = [(FMFMapViewController *)self view];
    int v13 = (void *)MEMORY[0x263F08938];
    v14 = self->_cachedMapView;
    __int16 v15 = [(FMFMapViewController *)self view];
    objc_super v16 = [v13 constraintWithItem:v14 attribute:4 relatedBy:0 toItem:v15 attribute:4 multiplier:1.0 constant:0.0];
    [v12 addConstraint:v16];

    __int16 v17 = [(FMFMapViewController *)self view];
    v18 = (void *)MEMORY[0x263F08938];
    uint64_t v19 = self->_cachedMapView;
    v20 = [(FMFMapViewController *)self view];
    v21 = [v18 constraintWithItem:v19 attribute:1 relatedBy:0 toItem:v20 attribute:1 multiplier:1.0 constant:0.0];
    [v17 addConstraint:v21];

    v22 = [(FMFMapViewController *)self view];
    v23 = (void *)MEMORY[0x263F08938];
    v24 = self->_cachedMapView;
    v25 = [(FMFMapViewController *)self view];
    v26 = [v23 constraintWithItem:v24 attribute:2 relatedBy:0 toItem:v25 attribute:2 multiplier:1.0 constant:0.0];
    [v22 addConstraint:v26];

    cachedMapView = self->_cachedMapView;
  }
  return cachedMapView;
}

- (UIBarButtonItem)userTrackingButtonItem
{
  userTrackingButtonItem = self->_userTrackingButtonItem;
  if (!userTrackingButtonItem)
  {
    id v4 = [MEMORY[0x263F10A80] buttonWithUserTrackingView:self];
    [(FMFMapViewController *)self setUserTrackingButton:v4];
    unint64_t v5 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F1C468]) initWithCustomView:v4];
    id v6 = self->_userTrackingButtonItem;
    self->_userTrackingButtonItem = v5;

    [(FMFMapViewController *)self _updateLocationButtonEnabled];
    userTrackingButtonItem = self->_userTrackingButtonItem;
  }
  return userTrackingButtonItem;
}

- (id)openInAppURL
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  BOOL v3 = [NSURL URLWithString:@"fmf1://friend/"];
  id v4 = [(FMFMapViewController *)self _internalHandlesShowingLocations];
  unint64_t v5 = [v4 allObjects];

  if ([v5 count])
  {
    id v6 = [v5 valueForKey:@"identifier"];
    objc_super v7 = [v6 componentsJoinedByString:@","];

    v8 = NSURL;
    v9 = NSString;
    uint64_t v10 = [v5 count];
    objc_super v11 = @"fmf1://friends/";
    if (v10 == 1) {
      objc_super v11 = @"fmf1://friend/";
    }
    uint64_t v12 = [v9 stringWithFormat:@"%@%@", v11, v7];
    uint64_t v13 = [v8 URLWithString:v12];

    BOOL v3 = (void *)v13;
  }
  v14 = LogCategory_Daemon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v17 = v3;
    _os_log_impl(&dword_2188D1000, v14, OS_LOG_TYPE_DEFAULT, "open URL for handles: %@", buf, 0xCu);
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(FMFMapViewController *)self setViewWillAppearCalled:1];
  if ([(FMFMapViewController *)self isSimpleMap])
  {
    unint64_t v5 = [(FMFMapViewController *)self cachedMapView];
    [v5 setAlpha:1.0];

    id v6 = +[FMFMapImageCache sharedInstance];
    objc_super v7 = [(FMFMapViewController *)self handlesShowingLocations];
    v8 = [v6 cachedMapForHandles:v7];
    v9 = [(FMFMapViewController *)self cachedMapView];
    [v9 setImage:v8];
  }
  else
  {
    uint64_t v10 = [(FMFMapViewController *)self navigationController];
    -[FMFMapViewController setWasToolbarPreviouslyHidden:](self, "setWasToolbarPreviouslyHidden:", [v10 isToolbarHidden]);

    id v6 = [(FMFMapViewController *)self navigationController];
    [v6 setToolbarHidden:0 animated:1];
  }

  [(FMFMapViewController *)self set_blockDidReceiveAnimation:1];
  v11.receiver = self;
  v11.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v11 viewWillAppear:v3];
  [(FMFMapViewController *)self viewWillAppearWillMoveToWindowSetup];
}

- (void)viewWillAppearWillMoveToWindowSetup
{
  unint64_t v3 = [(FMFMapViewController *)self defaultMapType];
  id v4 = [(FMFMapViewController *)self mapView];
  [v4 setMapType:v3];

  [(FMFMapViewController *)self addHandlesToSession];
  [(FMFMapViewController *)self loadCachedLocationsForHandles];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__FMFMapViewController_viewWillAppearWillMoveToWindowSetup__block_invoke;
  block[3] = &unk_2643438F0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  [(FMFMapViewController *)self setViewWillAppearCalled:1];
  [(FMFMapViewController *)self updateNoLocationView:1];
}

void __59__FMFMapViewController_viewWillAppearWillMoveToWindowSetup__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mapViewDelegate];
  double v2 = [*(id *)(a1 + 32) mapView];
  objc_msgSend(v3, "zoomToFitAnnotationsForMapView:includeMe:duration:", v2, objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitMeAndLocations"), 0.0);
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = LogCategory_Daemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "Received application did become active notification, adding handles to session to kick a refresh cycle", v5, 2u);
  }

  [(FMFMapViewController *)self addHandlesToSession];
  [(FMFMapViewController *)self _updateLocationButtonEnabled];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v8 viewDidAppear:a3];
  id v4 = [(FMFMapViewController *)self mapViewDelegate];
  unint64_t v5 = [(FMFMapViewController *)self mapView];
  objc_msgSend(v4, "zoomToFitAnnotationsForMapView:includeMe:duration:", v5, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), 0.0);

  [(FMFMapViewController *)self set_blockDidReceiveAnimation:0];
  if ([(FMFMapViewController *)self isSimpleMap])
  {
    dispatch_time_t v6 = dispatch_time(0, 1500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38__FMFMapViewController_viewDidAppear___block_invoke;
    block[3] = &unk_2643438F0;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __38__FMFMapViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideCachedMap];
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v5 willMoveToParentViewController:a3];
  id v4 = [(FMFMapViewController *)self noLocationView];
  [v4 updateConstriantsForInsets];

  [(FMFMapViewController *)self viewWillAppearWillMoveToWindowSetup];
}

- (void)didMoveToParentViewController:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v3 didMoveToParentViewController:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(FMFMapViewController *)self isSimpleMap]
    && ![(FMFMapViewController *)self _isRenderingInitialMap])
  {
    dispatch_time_t v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v6, OS_LOG_TYPE_DEFAULT, "Saving cached map", buf, 2u);
    }

    objc_super v5 = +[FMFMapImageCache sharedInstance];
    objc_super v7 = [(FMFMapViewController *)self mapView];
    objc_super v8 = [(FMFMapViewController *)self handlesShowingLocations];
    [v5 cacheMap:v7 forHandles:v8];
  }
  else
  {
    objc_super v5 = [(FMFMapViewController *)self navigationController];
    objc_msgSend(v5, "setToolbarHidden:animated:", -[FMFMapViewController wasToolbarPreviouslyHidden](self, "wasToolbarPreviouslyHidden"), 1);
  }

  [(FMFNoLocationView *)self->_noLocationView setBlockLabelUpdates:1];
  v9.receiver = self;
  v9.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v9 viewWillDisappear:v3];
  [(FMFMapViewController *)self removeHandlesFromSession];
  [(FMFMapViewController *)self destroySession];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v4 viewDidDisappear:a3];
  [(FMFNoLocationView *)self->_noLocationView setBlockLabelUpdates:0];
}

- (void)addHandlesToSession
{
  if (![(FMFMapViewController *)self _refreshingIsPaused])
  {
    id v4 = [(FMFMapViewController *)self fmfSession];
    BOOL v3 = [(FMFMapViewController *)self _internalHandlesShowingLocations];
    [v4 addHandles:v3];
  }
}

- (void)removeHandlesFromSession
{
  id v4 = [(FMFMapViewController *)self fmfSession];
  BOOL v3 = [(FMFMapViewController *)self _internalHandlesShowingLocations];
  [v4 removeHandles:v3];
}

- (void)destroySession
{
  [(FMFSession *)self->_fmfSession invalidate];
  [(FMFSession *)self->_fmfSession setDelegate:0];
  fmfSession = self->_fmfSession;
  self->_fmfSession = 0;
}

- (void)loadDelegate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!self->_mapViewDelegate)
  {
    BOOL v3 = [(FMFMapViewController *)self view];
    id v4 = LogCategory_Daemon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v3;
      _os_log_impl(&dword_2188D1000, v4, OS_LOG_TYPE_DEFAULT, "mapView = %@", (uint8_t *)&v12, 0xCu);
    }

    objc_super v5 = [FMFMapViewDelegateInternal alloc];
    dispatch_time_t v6 = [(FMFMapViewController *)self mapView];
    objc_super v7 = [(FMFMapViewDelegateInternal *)v5 initWithDelegate:self mapView:v6];
    [(FMFMapViewController *)self setMapViewDelegate:v7];

    mapViewDelegate = self->_mapViewDelegate;
    objc_super v9 = [(FMFMapViewController *)self mapView];
    [v9 setDelegate:mapViewDelegate];

    BOOL v10 = [(FMFMapViewController *)self isMapCenteringDisabled];
    objc_super v11 = [(FMFMapViewController *)self mapViewDelegate];
    [v11 setIsMapCenteringDisabled:v10];
  }
}

- (void)enablePreloadedHandles
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(FMFMapViewController *)self _preloadedHandles];
    *(_DWORD *)buf = 138412290;
    objc_super v11 = v4;
    _os_log_impl(&dword_2188D1000, v3, OS_LOG_TYPE_DEFAULT, "enablePreloadedHandles (%@)", buf, 0xCu);
  }
  objc_super v5 = [(FMFMapViewController *)self _preloadedHandles];

  if (v5)
  {
    dispatch_time_t v6 = [(FMFMapViewController *)self fmfSession];
    objc_super v7 = [v6 getHandlesSharingLocationsWithMe];

    if ([v7 count])
    {
      [(FMFMapViewController *)self _enablePreloadedHandles:v7];
    }
    else
    {
      objc_super v8 = [(FMFMapViewController *)self fmfSession];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __46__FMFMapViewController_enablePreloadedHandles__block_invoke;
      v9[3] = &unk_264343BF8;
      v9[4] = self;
      [v8 getHandlesSharingLocationsWithMe:v9];
    }
  }
}

uint64_t __46__FMFMapViewController_enablePreloadedHandles__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _enablePreloadedHandles:a2];
}

- (void)_enablePreloadedHandles:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  __int16 v15 = self;
  obuint64_t j = [(FMFMapViewController *)self _preloadedHandles];
  uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(obj);
        }
        objc_super v5 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v6 = v19;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v23 != v9) {
                objc_enumerationMutation(v6);
              }
              objc_super v11 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              uint64_t v12 = [v5 identifier];
              uint64_t v13 = [v11 identifier];
              int v14 = [v12 isEqualToString:v13];

              if (v14)
              {
                [v17 addObject:v11];
                goto LABEL_16;
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  [(FMFMapViewController *)v15 startShowingLocationsForHandles:v17];
  [(FMFMapViewController *)v15 set_internalHandlesShowingLocations:v17];
  [(FMFMapViewController *)v15 set_preloadedHandles:0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__FMFMapViewController__enablePreloadedHandles___block_invoke;
  block[3] = &unk_2643438F0;
  block[4] = v15;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__FMFMapViewController__enablePreloadedHandles___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadCachedLocationsForHandles];
}

- (void)loadCachedLocationsForHandles
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = [(FMFMapViewController *)self handlesShowingLocations];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412802;
    long long v15 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        BOOL v10 = [(FMFMapViewController *)self fmfSession];
        objc_super v11 = [v10 cachedLocationForHandle:v9];

        uint64_t v12 = LogCategory_Daemon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v15;
          v21 = self;
          __int16 v22 = 2112;
          uint64_t v23 = v9;
          __int16 v24 = 2112;
          long long v25 = v11;
          _os_log_impl(&dword_2188D1000, v12, OS_LOG_TYPE_INFO, "⛳️FMFUI %@: cached location for %@: %@", buf, 0x20u);
        }

        if (v11)
        {
          [(FMFMapViewController *)self updateMapWithNewLocation:v11 animated:0];
          [(FMFMapViewController *)self updateRefreshForLocation:v11];
          [(FMFMapViewController *)self _updateTitleViewLocation:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [(FMFMapViewController *)self mapViewDelegate];
  int v14 = [(FMFMapViewController *)self mapView];
  objc_msgSend(v13, "zoomToFitAnnotationsForMapView:includeMe:duration:", v14, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), 0.0);
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)FMFMapViewController;
  -[FMFMapViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  long long v5 = [(FMFMapViewController *)self noLocationView];
  [v5 updateConstriantsForInsets];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)FMFMapViewController;
  [(FMFMapViewController *)&v4 viewWillLayoutSubviews];
  BOOL v3 = [(FMFMapViewController *)self noLocationView];
  [v3 updateConstriantsForInsets];
}

- (void)updateNoLocationView:(BOOL)a3
{
  BOOL v3 = a3;
  *(void *)&v24[5] = *MEMORY[0x263EF8340];
  long long v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v24[0] = v3;
    LOWORD(v24[1]) = 1024;
    *(_DWORD *)((char *)&v24[1] + 2) = [(FMFMapViewController *)self canShowNoLocation];
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "updateNoLocationView appearing(%d) canShowNoLocation (%d)", buf, 0xEu);
  }

  if ([(FMFMapViewController *)self canShowNoLocation])
  {
    objc_super v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(FMFMapViewController *)self mapHasUserLocations];
      *(_DWORD *)buf = 67109120;
      v24[0] = v7;
      _os_log_impl(&dword_2188D1000, v6, OS_LOG_TYPE_DEFAULT, "Setting no location view visible: %d", buf, 8u);
    }

    BOOL v8 = [(FMFMapViewController *)self mapHasUserLocations];
    uint64_t v9 = [(FMFMapViewController *)self noLocationView];
    [v9 alpha];
    if (v10 != 0.0 || v8)
    {
      objc_super v11 = [(FMFMapViewController *)self noLocationView];
      [v11 alpha];
      BOOL v13 = v12 == 1.0 && v8;

      if (!v13)
      {
        long long v19 = LogCategory_Daemon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2188D1000, v19, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Not animating map", buf, 2u);
        }

        goto LABEL_30;
      }
    }
    else
    {
    }
    int v14 = LogCategory_Daemon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v14, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Animating map", buf, 2u);
    }

    if ([(FMFMapViewController *)self mapHasUserLocations]) {
      double v15 = 0.0;
    }
    else {
      double v15 = 1.0;
    }
    long long v16 = LogCategory_Daemon();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v17)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)__int16 v24 = v15;
        _os_log_impl(&dword_2188D1000, v16, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Appearing : Animating no location view %f", buf, 0xCu);
      }

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __45__FMFMapViewController_updateNoLocationView___block_invoke;
      v22[3] = &unk_264343C20;
      v22[4] = self;
      *(double *)&v22[5] = v15;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v22];
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 134217984;
        *(double *)__int16 v24 = v15;
        _os_log_impl(&dword_2188D1000, v16, OS_LOG_TYPE_DEFAULT, "FMFMapViewController : Animating no location view %f", buf, 0xCu);
      }

      double v18 = 0.75;
      if (!v8) {
        [(FMFMapViewController *)self nonLiveAnimationDuration];
      }
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __45__FMFMapViewController_updateNoLocationView___block_invoke_110;
      v21[3] = &unk_264343C20;
      v21[4] = self;
      *(double *)&v21[5] = v15;
      [MEMORY[0x263F1CB60] animateWithDuration:v21 animations:v18];
    }
LABEL_30:
    uint64_t v20 = [(FMFMapViewController *)self noLocationView];
    [v20 updateLabel];
  }
}

void __45__FMFMapViewController_updateNoLocationView___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) noLocationView];
  [v2 setAlpha:v1];
}

void __45__FMFMapViewController_updateNoLocationView___block_invoke_110(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) noLocationView];
  [v2 setAlpha:v1];
}

- (BOOL)mapHasUserLocations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(FMFMapViewController *)self mapView];
  BOOL v3 = [v2 annotations];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)updateMapWithNewLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [v6 handle];
  long long v8 = [(FMFMapViewController *)self locationOnMapForHandle:v7 enforceServerId:0];

  long long v9 = [v6 location];
  long long v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      long long v16 = [v6 handle];
      uint64_t v17 = [v16 serverId];
      if (v17)
      {
        double v18 = (void *)v17;
        BOOL v19 = [(FMFMapViewController *)self isLocationAlreadyOnMap:v6];

        if (!v19)
        {
          uint64_t v20 = LogCategory_Daemon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v6 description];
            *(_DWORD *)buf = 138412546;
            v40 = self;
            __int16 v41 = 2112;
            v42 = v21;
            _os_log_impl(&dword_2188D1000, v20, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map (add annotation) with: %@", buf, 0x16u);
          }
          [v6 updateLocation:v6];
          __int16 v22 = [(FMFMapViewController *)self mapView];
          [v22 addAnnotation:v6];

          [(FMFMapViewController *)self performSelector:sel_selectAnnotationIfSingleFriend_ withObject:v6 afterDelay:0.5];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke;
          block[3] = &unk_2643439B8;
          block[4] = self;
          id v38 = v6;
          dispatch_async(MEMORY[0x263EF83A0], block);
          uint64_t v23 = v38;
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
LABEL_18:
    if (!v4)
    {
      [v8 updateLocation:v6];
      uint64_t v27 = LogCategory_Daemon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v28 = [v8 description];
        *(_DWORD *)buf = 138412546;
        v40 = self;
        __int16 v41 = 2112;
        v42 = v28;
        _os_log_impl(&dword_2188D1000, v27, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map with: %@", buf, 0x16u);
      }
      goto LABEL_27;
    }
    if ([v6 locationType] == 2) {
      [(FMFMapViewController *)self liveAnimationDuration];
    }
    else {
      [(FMFMapViewController *)self nonLiveAnimationDuration];
    }
    double v29 = v26;
    v30 = (void *)MEMORY[0x263F1CB60];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_114;
    v33[3] = &unk_264343AA8;
    id v34 = v8;
    id v35 = v6;
    v36 = self;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_115;
    v32[3] = &unk_264343C48;
    v32[4] = self;
    *(double *)&v32[5] = v29;
    [v30 animateWithDuration:196614 delay:v33 options:v32 animations:v29 completion:0.0];

    uint64_t v23 = v34;
LABEL_26:

LABEL_27:
    long long v25 = [(FMFMapViewController *)self mapViewDelegate];
    v31 = [(FMFMapViewController *)self mapView];
    [v25 updateOverlaysForAnnotationMove:v6 mapView:v31];

    goto LABEL_28;
  }

  long long v11 = LogCategory_Daemon();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      uint64_t v13 = [v6 description];
      *(_DWORD *)buf = 138412546;
      v40 = self;
      __int16 v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_2188D1000, v11, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map (annotation) with: %@", buf, 0x16u);
    }
    int v14 = [(FMFMapViewController *)self mapView];
    double v15 = [v14 viewForAnnotation:v8];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v15 updateWithLocation:v6];
    }

    goto LABEL_18;
  }
  if (v12)
  {
    __int16 v24 = [v6 description];
    *(_DWORD *)buf = 138412546;
    v40 = self;
    __int16 v41 = 2112;
    v42 = v24;
    _os_log_impl(&dword_2188D1000, v11, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map (remove annotation) with: %@", buf, 0x16u);
  }
  long long v25 = [(FMFMapViewController *)self mapView];
  [v25 removeAnnotation:v8];
LABEL_28:

  [(FMFMapViewController *)self updateNoLocationView:!v4];
}

void __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapView];
  id v3 = [v2 viewForAnnotation:*(void *)(a1 + 40)];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 updateWithLocation:*(void *)(a1 + 40)];
  }
}

void __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_114(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) updateLocation:*(void *)(a1 + 40)];
  id v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    BOOL v4 = [*(id *)(a1 + 32) description];
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    long long v8 = v4;
    _os_log_impl(&dword_2188D1000, v2, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: update map animated with: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __58__FMFMapViewController_updateMapWithNewLocation_animated___block_invoke_115(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldZoomToFitNewLocations]
    && ([*(id *)(a1 + 32) _blockDidReceiveAnimation] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) mapViewDelegate];
    id v2 = [*(id *)(a1 + 32) mapView];
    objc_msgSend(v3, "zoomToFitAnnotationsForMapView:includeMe:duration:", v2, objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitMeAndLocations"), *(double *)(a1 + 40));
  }
}

- (void)recenterMap
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(FMFMapViewController *)self mapView];
  BOOL v4 = [v3 annotations];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  __int16 v7 = v5;
  if (!v6)
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v8 = v6;
  char v9 = 0;
  uint64_t v10 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v5);
      }
      BOOL v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 |= objc_msgSend(v12, "locationType", (void)v17) == 2;
      }
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  }
  while (v8);

  if (v9)
  {
    uint64_t v13 = LogCategory_Daemon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v22 = self;
      _os_log_impl(&dword_2188D1000, v13, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@: recentering map", buf, 0xCu);
    }

    [(FMFMapViewController *)self nonLiveAnimationDuration];
    double v15 = v14;
    __int16 v7 = [(FMFMapViewController *)self mapViewDelegate];
    long long v16 = [(FMFMapViewController *)self mapView];
    objc_msgSend(v7, "zoomToFitAnnotationsForMapView:includeMe:duration:", v16, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v15);

    goto LABEL_14;
  }
LABEL_15:
}

- (void)setupRecenterMapTimer
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_recenterMap object:self];
  [(FMFMapViewController *)self performSelector:sel_recenterMap withObject:self afterDelay:5.0];
}

- (BOOL)isLocationAlreadyOnMap:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v16 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = [(FMFMapViewController *)self mapView];
  id v5 = [v4 annotations];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 handle];
          long long v11 = [v10 serverId];
          BOOL v12 = [v16 handle];
          uint64_t v13 = [v12 serverId];
          char v14 = [v11 isEqualToString:v13];

          if (v14)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)canSelectAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 canSelectAnnotation:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)selectAnnotationIfSingleForMac
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([(FMFMapViewController *)self singleAnnotationOnMap])
  {
    id v3 = [(FMFMapViewController *)self mapView];
    id v4 = [v3 annotations];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && -[FMFMapViewController canSelectAnnotation:](self, "canSelectAnnotation:", v10, (void)v12))
          {
            long long v11 = [(FMFMapViewController *)self mapViewDelegate];
            [v11 selectAnnotation:v10];

            goto LABEL_16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    [(FMFMapViewController *)self deselectAllAnnotations];
  }
}

- (void)deselectAllAnnotations
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(FMFMapViewController *)self mapView];
  id v4 = [v3 annotations];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = [(FMFMapViewController *)self mapView];
          [v11 deselectAnnotation:v10 animated:0];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)selectAnnotationIfSingleFriend:(id)a3
{
  id v5 = a3;
  if (![(FMFMapViewController *)self isSimpleMap]
    && [(FMFMapViewController *)self singleAnnotationOnMap]
    && [(FMFMapViewController *)self canSelectAnnotation:v5])
  {
    id v4 = [(FMFMapViewController *)self mapViewDelegate];
    [v4 selectAnnotation:v5];
  }
  else
  {
    [(FMFMapViewController *)self deselectAllAnnotations];
  }
}

- (BOOL)singleAnnotationOnMap
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [(FMFMapViewController *)self mapView];
  id v3 = [v2 annotations];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass & v7) {
        break;
      }
      v7 |= isKindOfClass;
      if (v6 == ++v9)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  LOBYTE(v7) = 0;
LABEL_11:

  return v7 & 1;
}

- (id)locationOnMapForHandle:(id)a3 enforceServerId:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  uint64_t v6 = [(FMFMapViewController *)self mapView];
  int v7 = [v6 annotations];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    unint64_t v11 = 0x263F3B000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v4)
          {
            uint64_t v22 = [v13 handle];
            if ([v22 isEqual:v24])
            {

LABEL_17:
              id v20 = v13;
              goto LABEL_18;
            }
          }
          unint64_t v14 = v11;
          long long v15 = [v13 handle];
          [v15 serverId];
          uint64_t v17 = v16 = v4;
          long long v18 = [v24 serverId];
          int v19 = [v17 isEqualToString:v18];

          BOOL v4 = v16;
          if (v16)
          {
            unint64_t v11 = v14;
            if (v19) {
              goto LABEL_17;
            }
          }
          else
          {

            unint64_t v11 = v14;
            if (v19) {
              goto LABEL_17;
            }
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_18:

  return v20;
}

- (void)removeAnnotationsFromMapForHandle:(id)a3
{
  id v5 = [(FMFMapViewController *)self locationOnMapForHandle:a3 enforceServerId:0];
  if (v5)
  {
    BOOL v4 = [(FMFMapViewController *)self mapView];
    [v4 removeAnnotation:v5];

    [(FMFMapViewController *)self updateNoLocationView:0];
  }
}

- (BOOL)sessionContainsHandle:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FMFMapViewController *)self fmfSession];
  uint64_t v6 = [v5 handles];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqual:", v4, (void)v18) & 1) == 0)
        {
          long long v13 = [v12 serverId];
          unint64_t v14 = [v4 serverId];
          char v15 = [v13 isEqual:v14];

          if ((v15 & 1) == 0) {
            continue;
          }
        }
        BOOL v16 = 1;
        goto LABEL_13;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      BOOL v16 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_13:

  return v16;
}

- (void)refreshButtonTapped:(id)a3
{
  id v4 = [(FMFMapViewController *)self handlesShowingLocations];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    id v7 = [(FMFMapViewController *)self handlesShowingLocations];
    uint64_t v8 = [v6 setWithSet:v7];

    uint64_t v9 = [(FMFMapViewController *)self fmfSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__FMFMapViewController_refreshButtonTapped___block_invoke;
    v11[3] = &unk_264343AF8;
    id v12 = v8;
    id v10 = v8;
    [v9 refreshLocationForHandles:v10 callerId:0 priority:1 completion:v11];
  }
}

void __44__FMFMapViewController_refreshButtonTapped___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = LogCategory_Daemon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "Error refreshing handles: %@ error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)openInMapsButtonTapped:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = [(FMFMapViewController *)self fmfSession];
  uint64_t v5 = [v4 handles];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    int v7 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v8 = [(FMFMapViewController *)self fmfSession];
    __int16 v9 = [v8 handles];
    long long v25 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v9, "count"));

    id v10 = dispatch_group_create();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v11 = [(FMFMapViewController *)self fmfSession];
    id v12 = [v11 handles];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [(FMFMapViewController *)self locationOnMapForHandle:*(void *)(*((void *)&v32 + 1) + 8 * v16) enforceServerId:0];
          long long v18 = [v17 location];

          if (v18)
          {
            dispatch_group_enter(v10);
            [v17 coordinate];
            long long v21 = objc_msgSend(objc_alloc(MEMORY[0x263F109E0]), "initWithCoordinate:addressDictionary:", 0, v19, v20);
            uint64_t v22 = [v17 handle];
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __47__FMFMapViewController_openInMapsButtonTapped___block_invoke;
            v28[3] = &unk_264343C70;
            id v29 = v21;
            id v30 = v25;
            v31 = v10;
            id v23 = v21;
            [v22 prettyNameWithCompletion:v28];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__FMFMapViewController_openInMapsButtonTapped___block_invoke_2;
    block[3] = &unk_2643438F0;
    id v27 = v25;
    id v24 = v25;
    dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);
  }
}

void __47__FMFMapViewController_openInMapsButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F10960];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithPlacemark:*(void *)(a1 + 32)];
  [v5 setName:v4];

  [*(id *)(a1 + 40) addObject:v5];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __47__FMFMapViewController_openInMapsButtonTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = LogCategory_Daemon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_2188D1000, v2, OS_LOG_TYPE_INFO, "Opening Map Items in Maps: %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = (void *)MEMORY[0x263F10960];
  id v5 = [*(id *)(a1 + 32) allObjects];
  LOBYTE(v4) = [v4 openMapsWithItems:v5 launchOptions:0];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = LogCategory_Daemon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_2188D1000, v6, OS_LOG_TYPE_INFO, "Error opening map items in maps: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_updateDirectionsButtonEnabled
{
  id v5 = [(FMFMapViewController *)self titleView];
  uint64_t v3 = [v5 location];
  id v4 = [(FMFMapViewController *)self directionsBarButtonItem];
  [v4 setEnabled:v3 != 0];
}

- (void)getDirections
{
  id v2 = [(FMFMapViewController *)self titleView];
  uint64_t v3 = [v2 location];

  [v3 coordinate];
  double v5 = v4;
  double v7 = v6;
  int v8 = [MEMORY[0x263F10960] mapItemForCurrentLocation];
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263F109E0]), "initWithCoordinate:addressDictionary:", 0, v5, v7);
  uint64_t v10 = [v3 handle];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__FMFMapViewController_getDirections__block_invoke;
  v13[3] = &unk_264343C98;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 prettyNameWithCompletion:v13];
}

void __37__FMFMapViewController_getDirections__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)MEMORY[0x263F10960];
  id v4 = a2;
  double v5 = (void *)[[v3 alloc] initWithPlacemark:*(void *)(a1 + 32)];
  [v5 setName:v4];

  double v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263F10810], *MEMORY[0x263F10818], 0);
  double v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_2188D1000, v7, OS_LOG_TYPE_INFO, "Getting directions in Maps from %@ to %@", buf, 0x16u);
  }

  uint64_t v9 = (void *)MEMORY[0x263F10960];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *(void *)(a1 + 40), v5, 0);
  LOBYTE(v9) = [v9 openMapsWithItems:v10 launchOptions:v6];

  if ((v9 & 1) == 0)
  {
    id v11 = LogCategory_Daemon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188D1000, v11, OS_LOG_TYPE_DEFAULT, "Error opening map directions", buf, 2u);
    }
  }
}

- (BOOL)isCompact
{
  uint64_t v3 = [(FMFMapViewController *)self traitCollection];
  char v4 = 1;
  double v5 = [MEMORY[0x263F1CB00] traitCollectionWithVerticalSizeClass:1];
  if (([v3 containsTraitsInCollection:v5] & 1) == 0)
  {
    double v6 = [(FMFMapViewController *)self traitCollection];
    double v7 = [MEMORY[0x263F1CB00] traitCollectionWithHorizontalSizeClass:1];
    char v4 = [v6 containsTraitsInCollection:v7];
  }
  return v4;
}

- (void)presentMapOptionsModal:(id)a3
{
  char v4 = objc_alloc_init(FMFMapOptionsViewController);
  [(FMFMapViewController *)self setMapOptionsVC:v4];

  [(FMFMapOptionsViewController *)self->_mapOptionsVC setDelegate:self];
  BOOL v5 = [(FMFMapViewController *)self isCompact];
  mapOptionsVC = self->_mapOptionsVC;
  if (v5)
  {
    [(FMFMapOptionsViewController *)mapOptionsVC setModalPresentationStyle:6];
    [(UIViewController *)self fmf_presentModalViewController:self->_mapOptionsVC];
    id v9 = [(FMFMapViewController *)self navigationController];
    [v9 setToolbarHidden:1 animated:1];
  }
  else
  {
    [(FMFMapOptionsViewController *)mapOptionsVC setModalPresentationStyle:7];
    double v7 = [(FMFMapViewController *)self navigationController];
    [v7 presentViewController:self->_mapOptionsVC animated:1 completion:0];

    id v9 = [(FMFMapOptionsViewController *)self->_mapOptionsVC popoverPresentationController];
    [(FMFMapOptionsViewController *)self->_mapOptionsVC paneSize];
    objc_msgSend(v9, "setPopoverContentSize:");
    uint64_t v8 = [(FMFMapViewController *)self infoBarButtonItem];
    [v9 setBarButtonItem:v8];
  }
}

- (void)_dismiss:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: dismiss %@", (uint8_t *)&v10, 0xCu);
  }

  BOOL v6 = [(FMFMapViewController *)self isCompact];
  double v7 = [(FMFMapViewController *)self mapOptionsVC];
  uint64_t v8 = v7;
  if (v6)
  {
    [(UIViewController *)self fmf_dismissModalViewController:v7];

    uint64_t v8 = [(FMFMapViewController *)self navigationController];
    [v8 setToolbarHidden:0 animated:1];
  }
  else
  {
    id v9 = [v7 presentingViewController];
    [v9 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)mapTypeChangedNotification:(id)a3
{
  [(FMFMapViewController *)self setMapTypeLoaded:0];
  unint64_t v4 = [(FMFMapViewController *)self defaultMapType];
  id v5 = [(FMFMapViewController *)self mapView];
  [v5 setMapType:v4];
}

- (void)mapTypeChanged:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  -[FMFMapViewController setDefaultMapType:](self, "setDefaultMapType:");
  unint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v4 setObject:v5 forKey:@"MAP_TYPE_DEFAULT_KEY"];

  BOOL v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 synchronize];

  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"MAP_TYPE_DEFAULT_KEY" object:0];

  uint64_t v8 = LogCategory_Daemon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    unint64_t v10 = a3;
    _os_log_impl(&dword_2188D1000, v8, OS_LOG_TYPE_DEFAULT, "FMFMapViewController: mapTypeChanged %lu", (uint8_t *)&v9, 0xCu);
  }
}

- (unint64_t)defaultMapType
{
  if (![(FMFMapViewController *)self mapTypeLoaded])
  {
    [(FMFMapViewController *)self setMapTypeLoaded:1];
    uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    unint64_t v4 = [v3 objectForKey:@"MAP_TYPE_DEFAULT_KEY"];

    -[FMFMapViewController setDefaultMapType:](self, "setDefaultMapType:", [v4 unsignedIntegerValue]);
    if ([(FMFMapViewController *)self defaultMapType] == 1)
    {
      uint64_t v5 = 3;
    }
    else
    {
      if ([(FMFMapViewController *)self defaultMapType] != 2)
      {
LABEL_7:

        return self->_defaultMapType;
      }
      uint64_t v5 = 4;
    }
    [(FMFMapViewController *)self setDefaultMapType:v5];
    [(FMFMapViewController *)self mapTypeChanged:[(FMFMapViewController *)self defaultMapType]];
    goto LABEL_7;
  }
  return self->_defaultMapType;
}

- (void)stopRefreshingLocations
{
  [(FMFMapViewController *)self set_refreshingIsPaused:1];
  [(FMFMapViewController *)self removeHandlesFromSession];
  [(FMFMapViewController *)self deselectAllAnnotations];
}

- (void)resumeRefreshingLocations
{
  [(FMFMapViewController *)self set_refreshingIsPaused:0];
  [(FMFMapViewController *)self addHandlesToSession];
  uint64_t v3 = [(FMFMapViewController *)self noLocationView];
  [v3 updateLabel];

  [(FMFMapViewController *)self performSelector:sel_selectAnnotationIfSingleForMac withObject:0 afterDelay:0.5];
}

- (void)setShowFloatingMapLocationButton:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showFloatingMapLocationButton = a3;
  id v4 = [(FMFMapViewController *)self mapView];
  [v4 setShowsAttribution:!v3];
}

- (NSSet)handlesShowingLocations
{
  id v2 = [(FMFMapViewController *)self fmfSession];
  BOOL v3 = [v2 handles];

  return (NSSet *)v3;
}

- (void)setHandlesShowingLocations:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(FMFMapViewController *)self deselectAllAnnotations];
    uint64_t v5 = [(FMFMapViewController *)self _internalHandlesShowingLocations];
    BOOL v6 = (void *)[v5 mutableCopy];

    [v6 minusSet:v4];
    double v7 = LogCategory_Daemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v8 = getpid();
      int v9 = [v4 description];
      unint64_t v10 = [(FMFMapViewController *)self _internalHandlesShowingLocations];
      uint64_t v11 = [v10 description];
      uint64_t v12 = [v6 description];
      int v13 = 138413314;
      __int16 v14 = self;
      __int16 v15 = 1024;
      pid_t v16 = v8;
      __int16 v17 = 2112;
      long long v18 = v9;
      __int16 v19 = 2112;
      double v20 = v11;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      _os_log_impl(&dword_2188D1000, v7, OS_LOG_TYPE_DEFAULT, "⛳️FMFUI %@ {pid = %d}: want location for %@ (internal: %@, to remove: %@)", (uint8_t *)&v13, 0x30u);
    }
    [(FMFMapViewController *)self stopShowingLocationsForHandles:v6];
    [(FMFMapViewController *)self startShowingLocationsForHandles:v4];
    [(FMFMapViewController *)self set_internalHandlesShowingLocations:v4];
  }
}

- (void)startShowingLocationsForHandles:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "Start showing location for handles: %@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v6 = [(FMFMapViewController *)self fmfSession];
  [v6 addHandles:v4];
}

- (void)stopShowingLocationsForHandles:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = LogCategory_Daemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl(&dword_2188D1000, v5, OS_LOG_TYPE_DEFAULT, "Stop showing location for handles: %@", buf, 0xCu);
  }

  BOOL v6 = [(FMFMapViewController *)self fmfSession];
  [v6 removeHandles:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        -[FMFMapViewController removeAnnotationsFromMapForHandle:](self, "removeAnnotationsFromMapForHandle:", v12, (void)v14);
        int v13 = [(FMFMapViewController *)self refreshButton];
        [v13 removeLocationForHandle:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)zoomToFit
{
  [(FMFMapViewController *)self nonLiveAnimationDuration];
  double v4 = v3;
  id v6 = [(FMFMapViewController *)self mapViewDelegate];
  uint64_t v5 = [(FMFMapViewController *)self mapView];
  objc_msgSend(v6, "zoomToFitAnnotationsForMapView:includeMe:duration:", v5, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v4);
}

- (void)zoomToFit:(BOOL)a3
{
  double v4 = 0.0;
  if (a3)
  {
    [(FMFMapViewController *)self nonLiveAnimationDuration];
    double v4 = v5;
  }
  id v7 = [(FMFMapViewController *)self mapViewDelegate];
  id v6 = [(FMFMapViewController *)self mapView];
  objc_msgSend(v7, "zoomToFitAnnotationsForMapView:includeMe:duration:", v6, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v4);
}

- (void)zoomAndSelectHandle:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [(FMFMapViewController *)self locationOnMapForHandle:v4 enforceServerId:0];
  if (v5)
  {
    if ([(FMFMapViewController *)self canSelectAnnotation:v5])
    {
      id v6 = [(FMFMapViewController *)self mapViewDelegate];
      [v6 selectAnnotation:v5];
    }
    id v7 = [(FMFMapViewController *)self mapViewDelegate];
    uint64_t v8 = [(FMFMapViewController *)self mapView];
    [v7 zoomToFitLocation:v5 forMapView:v8];
  }
  else
  {
    uint64_t v9 = LogCategory_Daemon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_2188D1000, v9, OS_LOG_TYPE_INFO, "zoomAndSelectHandle: location not found for handle: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (FMFSession)fmfSession
{
  fmfSession = self->_fmfSession;
  if (!fmfSession)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F3BA80]) initWithDelegate:self];
    [(FMFMapViewController *)self setFmfSession:v4];

    double v5 = [(FMFMapViewController *)self fmfSession];
    id v6 = [(FMFMapViewController *)self debugContext];
    [v5 setDebugContext:v6];

    fmfSession = self->_fmfSession;
  }
  return fmfSession;
}

- (void)didReceiveLocation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__FMFMapViewController_didReceiveLocation___block_invoke;
  v6[3] = &unk_2643439B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __43__FMFMapViewController_didReceiveLocation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) handle];
  LODWORD(v2) = [v2 sessionContainsHandle:v3];

  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) handle];
    id v6 = [v4 locationOnMapForHandle:v5 enforceServerId:0];

    if (v6)
    {
      uint64_t v7 = [v6 locationType];
      if (v7 == [*(id *)(a1 + 40) locationType])
      {
        uint64_t v8 = [v6 location];
        uint64_t v9 = [*(id *)(a1 + 40) location];
        [v8 distanceFromLocation:v9];
        double v11 = v10;

        if (v11 < 1.0)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      uint64_t v12 = [*(id *)(a1 + 40) locationType];
      int v13 = *(void **)(a1 + 32);
      if (v12 == 2) {
        [v13 liveAnimationDuration];
      }
      else {
        [v13 nonLiveAnimationDuration];
      }
      double v15 = v14;
    }
    else
    {
      double v15 = 0.0;
    }
    [*(id *)(a1 + 32) updateMapWithNewLocation:*(void *)(a1 + 40) animated:v15 > 0.0];
    if ([*(id *)(a1 + 32) shouldZoomToFitNewLocations]
      && ([*(id *)(a1 + 32) _blockDidReceiveAnimation] & 1) == 0)
    {
      long long v16 = [*(id *)(a1 + 32) mapViewDelegate];
      long long v17 = [*(id *)(a1 + 32) mapView];
      objc_msgSend(v16, "zoomToFitAnnotationsForMapView:includeMe:duration:", v17, objc_msgSend(*(id *)(a1 + 32), "shouldZoomToFitMeAndLocations"), v15);
    }
    [*(id *)(a1 + 32) updateRefreshForLocation:*(void *)(a1 + 40)];
    goto LABEL_14;
  }
LABEL_15:
  [*(id *)(a1 + 32) _updateTitleViewLocation:*(void *)(a1 + 40)];
  long long v18 = *(void **)(a1 + 32);
  uint64_t v19 = *(void *)(a1 + 40);
  return [v18 didReceiveLocationForDelegateCallback:v19];
}

- (void)updateRefreshForLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFMapViewController *)self refreshButton];
  [v5 addLocation:v4];
}

- (void)didStopAbilityToGetLocationForHandle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__FMFMapViewController_didStopAbilityToGetLocationForHandle___block_invoke;
  v6[3] = &unk_2643439B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __61__FMFMapViewController_didStopAbilityToGetLocationForHandle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAnnotationsFromMapForHandle:*(void *)(a1 + 40)];
}

- (void)removeAllFriendLocationsFromMap
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v3 = [(FMFMapViewController *)self mapView];
  id v4 = [v3 annotations];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __55__FMFMapViewController_removeAllFriendLocationsFromMap__block_invoke;
          v12[3] = &unk_2643439B8;
          v12[4] = self;
          v12[5] = v11;
          dispatch_async(v9, v12);
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __55__FMFMapViewController_removeAllFriendLocationsFromMap__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapView];
  [v2 removeAnnotation:*(void *)(a1 + 40)];
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4 fromTrackingButton:(BOOL)a5
{
  if (a3 == 2)
  {
    uint64_t v7 = [(FMFMapViewController *)self userTrackingButton];
    [v7 _setState:3];
    uint64_t v8 = 2;
  }
  else if (a3 == 1)
  {
    uint64_t v7 = [(FMFMapViewController *)self userTrackingButton];
    [v7 _setState:2];
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = [(FMFMapViewController *)self userTrackingButton];
    [v7 _setState:0];
    uint64_t v8 = 0;
  }

  [(FMFMapViewController *)self setCurrentTrackingMode:v8];
  [(FMFMapViewController *)self setShouldZoomToFitNewLocations:a3 != 2];
  [(FMFMapViewController *)self setShouldZoomToFitMeAndLocations:a3 == 1];
  uint64_t v9 = [(FMFMapViewController *)self mapView];
  [v9 setUserTrackingMode:2 * (a3 == 2) animated:1];

  [(FMFMapViewController *)self zoomToFit];
}

- (int64_t)userTrackingMode
{
  int64_t v2 = [(FMFMapViewController *)self currentTrackingMode];
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
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FMFMapViewController.m" lineNumber:1306 description:@"FIXME: Test this code path.  As of Whitetail MapKit was never calling this method and it was just added for protocol conformance."];

  id v5 = [(FMFMapViewController *)self mapView];
  LOBYTE(self) = [v5 isCurrentlyRotated];

  return (char)self;
}

- (void)updateUserTrackingButtonState
{
  uint64_t v2 = hasUserLocation;
  id v3 = [(FMFMapViewController *)self userTrackingButton];
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

- (void)didSelectLocation:(id)a3
{
  id v6 = a3;
  -[FMFMapViewController _updateTitleViewLocation:](self, "_updateTitleViewLocation:");
  id v4 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v6 handle];
    [v4 fmfMapViewController:self didSelectHandle:v5];
  }
}

- (void)didDeselectLocation:(id)a3
{
  id v6 = a3;
  -[FMFMapViewController _updateTitleViewLocation:](self, "_updateTitleViewLocation:");
  id v4 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v6 handle];
    [v4 fmfMapViewController:self didDeselectHandle:v5];
  }
}

- (void)regionWillChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 fmfMapViewController:self regionWillChangeAnimated:v3];
  }
}

- (void)regionDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 fmfMapViewController:self regionDidChangeAnimated:v3];
  }
  if (!v3 && ![(FMFMapViewController *)self isSimpleMap]) {
    [(FMFMapViewController *)self setupRecenterMapTimer];
  }
}

- (void)reZoomToFit
{
  if ([(FMFMapViewController *)self shouldZoomToFitNewLocations])
  {
    [(FMFMapViewController *)self nonLiveAnimationDuration];
    double v4 = v3;
    id v6 = [(FMFMapViewController *)self mapViewDelegate];
    id v5 = [(FMFMapViewController *)self mapView];
    objc_msgSend(v6, "zoomToFitAnnotationsForMapView:includeMe:duration:", v5, -[FMFMapViewController shouldZoomToFitMeAndLocations](self, "shouldZoomToFitMeAndLocations"), v4);
  }
}

- (void)didUpdateUserLocation:(id)a3
{
  hasUserLocation = 1;
  id v4 = a3;
  [(FMFMapViewController *)self updateUserTrackingButtonState];
  [(FMFMapViewController *)self didReceiveLocationForDelegateCallback:v4];
}

- (void)didReceiveLocationForDelegateCallback:(id)a3
{
  id v5 = a3;
  id v4 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 fmfMapViewController:self didReceiveLocation:v5];
  }
}

- (void)mapViewDidFinishRenderingMap
{
  double v3 = LogCategory_Daemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2188D1000, v3, OS_LOG_TYPE_DEFAULT, "mapViewDidFinishRenderingMap", v4, 2u);
  }

  [(FMFMapViewController *)self set_isRenderingInitialMap:0];
  if ([(FMFMapViewController *)self isSimpleMap]) {
    [(FMFMapViewController *)self hideCachedMap];
  }
}

- (void)hideCachedMap
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __37__FMFMapViewController_hideCachedMap__block_invoke;
  v2[3] = &unk_2643438F0;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v2 animations:0.5];
}

void __37__FMFMapViewController_hideCachedMap__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cachedMapView];
  [v1 setAlpha:0.0];
}

- (id)annotationImageForAnnotation:(id)a3 andHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FMFMapViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v8 annotationContactForHandle:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v19 = 0;
  +[FMFMapViewController annotationImageSize];
  double v11 = v10;
  uint64_t v12 = [(FMFMapViewController *)self _internalAnnotationTintColor];
  long long v13 = +[FMFMonogramUtility monogramImageOfDiameter:v9 forContact:v12 useTintColor:1 useCustomFont:&v19 isPersonImage:v11];

  [v7 setIsBorderEnabled:v19 == 0];
  if (!v13)
  {
    long long v14 = (void *)MEMORY[0x263F1C6B0];
    long long v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v16 = [v14 imageNamed:@"person" inBundle:v15];
    long long v17 = [(FMFMapViewController *)self _internalAnnotationTintColor];
    long long v13 = [v16 tintedImageWithColor:v17];
  }
  return v13;
}

- (id)titleViewForSelectedHandle
{
  double v3 = [(FMFMapViewController *)self titleView];
  id v4 = [(FMFMapViewController *)self _selectedHandleAnnotation];
  [v3 updateLocation:v4];

  return [(FMFMapViewController *)self titleView];
}

- (void)_updateTitleViewLocation:(id)a3
{
  id v15 = a3;
  id v4 = [(FMFMapViewController *)self handlesShowingLocations];
  id v5 = [v15 handle];
  if ([v4 containsObject:v5])
  {
    id v6 = [(FMFMapViewController *)self handlesShowingLocations];
    if ([v6 count] == 1)
    {

LABEL_6:
      double v11 = [(FMFMapViewController *)self titleView];
      uint64_t v12 = v11;
      id v13 = v15;
LABEL_10:
      [v11 updateLocation:v13];
      goto LABEL_11;
    }
    id v7 = [(FMFMapViewController *)self _selectedHandleAnnotation];
    uint64_t v8 = [v7 handle];
    uint64_t v9 = [v15 handle];
    int v10 = [v8 isEqual:v9];

    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v12 = [(FMFMapViewController *)self handlesShowingLocations];
  if ((unint64_t)[v12 count] >= 2)
  {
    long long v14 = [(FMFMapViewController *)self _selectedHandleAnnotation];

    if (v14) {
      goto LABEL_12;
    }
    double v11 = [(FMFMapViewController *)self titleView];
    uint64_t v12 = v11;
    id v13 = 0;
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  [(FMFMapViewController *)self _updateDirectionsButtonEnabled];
}

- (id)_selectedHandleAnnotation
{
  uint64_t v2 = [(FMFMapViewController *)self mapView];
  double v3 = [v2 selectedAnnotations];
  id v4 = [v3 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_internalAnnotationTintColor
{
  uint64_t v2 = [(FMFMapViewController *)self annotationTintColor];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263F1C550] fmfOrangeColor];
  }
  id v5 = v4;

  return v5;
}

- (void)updateAllAnnotationsDueToAddressBookUpdate
{
  +[FMFMonogramUtility clearMonogramCache];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__FMFMapViewController_updateAllAnnotationsDueToAddressBookUpdate__block_invoke;
  block[3] = &unk_2643438F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__FMFMapViewController_updateAllAnnotationsDueToAddressBookUpdate__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) noLocationView];
  [v2 updatePersonImageViewImage];

  double v3 = [*(id *)(a1 + 32) mapView];
  id v4 = [v3 annotations];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = objc_msgSend(v11, "handle", (void)v15);
          [v12 addressBookDidChange];

          id v13 = [*(id *)(a1 + 32) mapView];
          [v13 removeAnnotation:v11];

          long long v14 = [*(id *)(a1 + 32) mapView];
          [v14 addAnnotation:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (FMFTitleView)titleView
{
  titleView = self->_titleView;
  if (!titleView)
  {
    id v4 = [[FMFTitleView alloc] initFromNib];
    [(FMFMapViewController *)self setTitleView:v4];

    titleView = self->_titleView;
  }
  return titleView;
}

- (FMFMapViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FMFMapViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldZoomToFitNewLocations
{
  return self->_shouldZoomToFitNewLocations;
}

- (void)setShouldZoomToFitNewLocations:(BOOL)a3
{
  self->_shouldZoomToFitNewLocations = a3;
}

- (BOOL)shouldZoomToFitMeAndLocations
{
  return self->_shouldZoomToFitMeAndLocations;
}

- (void)setShouldZoomToFitMeAndLocations:(BOOL)a3
{
  self->_shouldZoomToFitMeAndLocations = a3;
}

- (BOOL)showFloatingMapLocationButton
{
  return self->_showFloatingMapLocationButton;
}

- (BOOL)isMapCenteringDisabled
{
  return self->_isMapCenteringDisabled;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (UIColor)annotationTintColor
{
  return self->_annotationTintColor;
}

- (void)setAnnotationTintColor:(id)a3
{
}

- (void)setFmfSession:(id)a3
{
}

- (FMFMapViewDelegateInternal)mapViewDelegate
{
  return self->_mapViewDelegate;
}

- (void)setMapViewDelegate:(id)a3
{
}

- (NSSet)_preloadedHandles
{
  return self->__preloadedHandles;
}

- (void)set_preloadedHandles:(id)a3
{
}

- (BOOL)isSimpleMap
{
  return self->_isSimpleMap;
}

- (void)setIsSimpleMap:(BOOL)a3
{
  self->_isSimpleMap = a3;
}

- (void)setNoLocationView:(id)a3
{
}

- (NSSet)_internalHandlesShowingLocations
{
  return self->__internalHandlesShowingLocations;
}

- (void)set_internalHandlesShowingLocations:(id)a3
{
}

- (BOOL)_refreshingIsPaused
{
  return self->__refreshingIsPaused;
}

- (void)set_refreshingIsPaused:(BOOL)a3
{
  self->__refreshingIsPaused = a3;
}

- (BOOL)_isRenderingInitialMap
{
  return self->__isRenderingInitialMap;
}

- (void)set_isRenderingInitialMap:(BOOL)a3
{
  self->__isRenderingInitialMap = a3;
}

- (BOOL)viewWillAppearCalled
{
  return self->_viewWillAppearCalled;
}

- (void)setViewWillAppearCalled:(BOOL)a3
{
  self->_viewWillAppearCalled = a3;
}

- (BOOL)alwaysShowAccuracy
{
  return self->_alwaysShowAccuracy;
}

- (void)setAlwaysShowAccuracy:(BOOL)a3
{
  self->_alwaysShowAccuracy = a3;
}

- (BOOL)wasToolbarPreviouslyHidden
{
  return self->_wasToolbarPreviouslyHidden;
}

- (void)setWasToolbarPreviouslyHidden:(BOOL)a3
{
  self->_wasToolbarPreviouslyHidden = a3;
}

- (NSString)debugContext
{
  return self->_debugContext;
}

- (void)setDebugContext:(id)a3
{
}

- (FMFMapOptionsViewController)mapOptionsVC
{
  return self->_mapOptionsVC;
}

- (void)setMapOptionsVC:(id)a3
{
}

- (void)setTitleView:(id)a3
{
}

- (void)setUserTrackingButtonItem:(id)a3
{
}

- (UIBarButtonItem)directionsBarButtonItem
{
  return self->_directionsBarButtonItem;
}

- (void)setDirectionsBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)infoBarButtonItem
{
  return self->_infoBarButtonItem;
}

- (void)setInfoBarButtonItem:(id)a3
{
}

- (FMFRefreshBarButtonItem)refreshButton
{
  return self->_refreshButton;
}

- (void)setRefreshButton:(id)a3
{
}

- (void)setCachedMapView:(id)a3
{
}

- (void)setDefaultMapType:(unint64_t)a3
{
  self->_defaultMapType = a3;
}

- (BOOL)mapTypeLoaded
{
  return self->_mapTypeLoaded;
}

- (void)setMapTypeLoaded:(BOOL)a3
{
  self->_mapTypeLoaded = a3;
}

- (_MKUserTrackingButton)userTrackingButton
{
  return self->_userTrackingButton;
}

- (void)setUserTrackingButton:(id)a3
{
}

- (int64_t)currentTrackingMode
{
  return self->_currentTrackingMode;
}

- (void)setCurrentTrackingMode:(int64_t)a3
{
  self->_currentTrackingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTrackingButton, 0);
  objc_storeStrong((id *)&self->_cachedMapView, 0);
  objc_storeStrong((id *)&self->_refreshButton, 0);
  objc_storeStrong((id *)&self->_infoBarButtonItem, 0);
  objc_storeStrong((id *)&self->_directionsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_userTrackingButtonItem, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_mapOptionsVC, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
  objc_storeStrong((id *)&self->__internalHandlesShowingLocations, 0);
  objc_storeStrong((id *)&self->_noLocationView, 0);
  objc_storeStrong((id *)&self->__preloadedHandles, 0);
  objc_storeStrong((id *)&self->_mapViewDelegate, 0);
  objc_storeStrong((id *)&self->_fmfSession, 0);
  objc_storeStrong((id *)&self->_annotationTintColor, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end