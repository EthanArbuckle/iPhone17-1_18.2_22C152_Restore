@interface MKBasicMapView
- (BOOL)hasRenderedSomething;
- (BOOL)inactive;
- (BOOL)isChangingViewSize;
- (BOOL)isInBackground;
- (BOOL)isPointValidForGesturing:(CGPoint)a3;
- (BOOL)rendersInBackground;
- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toCameraModelPointToView:(id)a4;
- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4;
- (CGSize)calloutContainerCanvasSize;
- (CLLocationCoordinate2D)convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4;
- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5;
- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6;
- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6 carDisplayType:(int64_t)a7;
- (UIEdgeInsets)edgeInsets;
- (VKMapView)mapView;
- (double)calloutContainerCanvasScale;
- (double)mapModeStartTime;
- (double)trafficStartTime;
- (void)_animateCanvasForBounds:(CGRect)a3;
- (void)_beginChangingViewSize;
- (void)_didEnterBackground;
- (void)_finishChangingViewSize;
- (void)_finishedSnapshot:(id)a3;
- (void)_registerSceneNotifications;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_unregisterSceneNotifications;
- (void)_updateBackgroundState;
- (void)_updateBackgroundState:(int64_t)a3;
- (void)_updateForCurrentLocale;
- (void)_updateForCurrentScreen;
- (void)_updateMapViewHidden;
- (void)_updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:(BOOL)a3 ignoreIfViewInWindow:(BOOL)a4;
- (void)_updateStatsForTrafficEnabledTime:(BOOL)a3;
- (void)addCalloutSubview:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasRenderedSomething:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInactive:(BOOL)a3;
- (void)setMapModeStartTime:(double)a3;
- (void)setRendersInBackground:(BOOL)a3;
- (void)setTrafficStartTime:(double)a3;
- (void)updateStatsForEnablingTraffic:(BOOL)a3;
- (void)updateStatsForSwitchingToMapType:(int)a3;
- (void)updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:(BOOL)a3;
- (void)updateStatsForTrafficEnabledTime;
- (void)willMoveToWindow:(id)a3;
@end

@implementation MKBasicMapView

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKBasicMapView *)self bounds];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = 0.0;
  v13.origin.double y = 0.0;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
    {
      -[MKBasicMapView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", 0.0, 0.0, width, height);
    }
    else
    {
      [(MKBasicMapView *)self _beginChangingViewSize];
      -[UIView setFrame:](self->_hostView, "setFrame:", 0.0, 0.0, width, height);
      if (self->_hasRenderedSomething && !self->_inBackground) {
        [(VKMapView *)self->_mapView forceFrame];
      }
      [(MKBasicMapView *)self _finishChangingViewSize];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView setFrame:](&v12, sel_setFrame_, x, y, width, height);
}

- (void)updateStatsForTrafficEnabledTime
{
}

- (void)updateStatsForEnablingTraffic:(BOOL)a3
{
}

- (void)_updateStatsForTrafficEnabledTime:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MKBasicMapView *)self window];

  if ((v5 || v3) && CFAbsoluteTimeGetCurrent() - self->_trafficStartTime >= 1.0)
  {
    if (([(VKMapView *)self->_mapView trafficEnabled] & 1) == 0) {
      [(VKMapView *)self->_mapView hasTraffic];
    }
    ADClientAddValueForScalarKey();
    self->_trafficStartTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)updateStatsForSwitchingToMapType:(int)a3
{
  if (a3 <= 8) {
    ADClientAddValueForScalarKey();
  }
}

- (void)updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:(BOOL)a3
{
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (void)_sceneWillEnterForeground:(id)a3
{
}

uint64_t __91__MKBasicMapView_initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_carDisplayType___block_invoke()
{
  return [MEMORY[0x1E4FB3A90] setDragCoefficientGetter:&__block_literal_global_7_1];
}

- (void)setInactive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = MKGetMKDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    BOOL inactive = self->_inactive;
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    CGFloat v11 = self;
    __int16 v12 = 1024;
    BOOL v13 = inactive;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "%@<%p> setInactive: %d -> %d", (uint8_t *)&v8, 0x22u);
  }

  if (self->_inactive != v3)
  {
    self->_BOOL inactive = v3;
    [(MKBasicMapView *)self _updateBackgroundState];
  }
}

- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6 carDisplayType:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  v32[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)MKBasicMapView;
  __int16 v10 = -[MKBasicMapView initWithFrame:](&v30, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v10)
  {
    if (initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_carDisplayType__once != -1) {
      dispatch_once(&initWithFrame_andGlobe_shouldRasterize_allowsAntialiasing_carDisplayType__once, &__block_literal_global_48);
    }
    [(MKBasicMapView *)v10 _updateBackgroundState:0];
    CGFloat v11 = [_MKMapLayerHostingView alloc];
    [(MKBasicMapView *)v10 bounds];
    __int16 v12 = -[_MKMapLayerHostingView initWithFrame:](v11, "initWithFrame:");
    hostView = v10->_hostView;
    v10->_hostView = &v12->super;
    v29 = v12;

    __int16 v14 = [MEMORY[0x1E4F42D90] mainScreen];
    [v14 nativeScale];
    double v16 = v15;

    v17 = [MEMORY[0x1E4FB3A48] descriptorWithShouldRasterize:v9 inBackground:v10->_inBackground contentScale:0 auditToken:0 mapViewPurpose:v8 allowsAntialiasing:v16];
    [v17 setCarDisplayType:a7];
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4FB3A40]) initWithDescriptor:v17];
    mapView = v10->_mapView;
    v10->_mapView = (VKMapView *)v18;

    [(_MKMapLayerHostingView *)v29 setMapView:v10->_mapView];
    v31[0] = @"bounds";
    v20 = [MEMORY[0x1E4F1CA98] null];
    v32[0] = v20;
    v31[1] = @"position";
    v21 = [MEMORY[0x1E4F1CA98] null];
    v32[1] = v21;
    v31[2] = @"hidden";
    v22 = [MEMORY[0x1E4F1CA98] null];
    v32[2] = v22;
    v31[3] = @"sublayers";
    v23 = [MEMORY[0x1E4F1CA98] null];
    v32[3] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    [(VKMapView *)v10->_mapView setActions:v24];

    [(UIView *)v10->_hostView bounds];
    -[VKMapView setFrame:](v10->_mapView, "setFrame:");
    [(VKMapView *)v10->_mapView setHidden:1];
    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v10 selector:sel__updateForCurrentLocale name:*MEMORY[0x1E4F1C370] object:0];

    [(MKBasicMapView *)v10 _updateForCurrentLocale];
    v26 = [(UIView *)v10->_hostView layer];
    [v26 addSublayer:v10->_mapView];

    [(MKBasicMapView *)v10 addSubview:v10->_hostView];
    [(MKBasicMapView *)v10 setClipsToBounds:1];
    v10->_mapModeStartTime = CFAbsoluteTimeGetCurrent();
    v10->_trafficStartTime = CFAbsoluteTimeGetCurrent();
    v27 = [MEMORY[0x1E4F64918] modernManager];

    [v27 addTileGroupObserver:v10 queue:MEMORY[0x1E4F14428]];
  }
  return v10;
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)MKBasicMapView;
  [(MKBasicMapView *)&v8 didMoveToWindow];
  [(MKBasicMapView *)self _updateMapViewHidden];
  BOOL v3 = [(MKBasicMapView *)self window];
  if (v3)
  {
  }
  else if ([(MKBasicMapView *)self isChangingViewSize])
  {
    [(MKBasicMapView *)self bounds];
    -[UIView setFrame:](self->_hostView, "setFrame:");
  }
  v4 = [(MKBasicMapView *)self window];

  if (v4)
  {
    [(MKBasicMapView *)self _registerSceneNotifications];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F43F00];
    v7 = [(MKBasicMapView *)self window];
    [v5 addObserver:self selector:sel__updateForCurrentScreen name:v6 object:v7];

    self->_mapModeStartTime = CFAbsoluteTimeGetCurrent();
    self->_trafficStartTime = CFAbsoluteTimeGetCurrent();
  }
  else
  {
    [(MKBasicMapView *)self _updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:0 ignoreIfViewInWindow:1];
    [(MKBasicMapView *)self _updateStatsForTrafficEnabledTime:1];
  }
  [(MKBasicMapView *)self _updateBackgroundState];
  [(MKBasicMapView *)self _updateForCurrentScreen];
}

- (void)setRendersInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v5 = MKGetMKDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    int v7 = [(VKMapView *)self->_mapView rendersInBackground];
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    CGFloat v11 = self;
    __int16 v12 = 1024;
    int v13 = v7;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_impl(&dword_18BAEC000, v5, OS_LOG_TYPE_INFO, "%@<%p> setRendersInBackground: %d -> %d", (uint8_t *)&v8, 0x22u);
  }

  [(VKMapView *)self->_mapView setRendersInBackground:v3];
  [(MKBasicMapView *)self _updateBackgroundState];
  [(MKBasicMapView *)self _updateMapViewHidden];
}

- (void)_updateMapViewHidden
{
  if ([(MKBasicMapView *)self isHidden])
  {
    mapView = self->_mapView;
    [(VKMapView *)mapView setHidden:1];
  }
  else
  {
    id v5 = [(MKBasicMapView *)self window];
    if (v5) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = [(MKBasicMapView *)self rendersInBackground] ^ 1;
    }
    [(VKMapView *)self->_mapView setHidden:v4];
  }
}

- (void)_updateBackgroundState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MKBasicMapView *)self window];
  uint64_t v4 = [v3 windowScene];

  if (v4 && (unint64_t v5 = [v4 activationState] + 1, v5 <= 3)) {
    uint64_t v6 = qword_18BD1B318[v5];
  }
  else {
    uint64_t v6 = 0;
  }
  int v7 = MKGetMKDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138413058;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2048;
    CGFloat v11 = self;
    __int16 v12 = 2048;
    uint64_t v13 = [v4 activationState];
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "%@<%p> updateBackgroundState: determined activation state %ld == map scene state %ld", (uint8_t *)&v8, 0x2Au);
  }

  [(MKBasicMapView *)self _updateBackgroundState:v6];
}

- (void)_updateBackgroundState:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_inactive)
  {
    BOOL v5 = 1;
  }
  else
  {
    unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFFDLL;
    int v7 = [(VKMapView *)self->_mapView rendersInBackground] ^ 1;
    if (v6 == 1) {
      BOOL v5 = v7;
    }
    else {
      BOOL v5 = 0;
    }
  }
  int v8 = MKGetMKDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_opt_class();
    if (v5) {
      __int16 v10 = "";
    }
    else {
      __int16 v10 = " not";
    }
    BOOL inBackground = self->_inBackground;
    BOOL inactive = self->_inactive;
    int v13 = 138413826;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    __int16 v17 = 2080;
    uint64_t v18 = v10;
    __int16 v19 = 1024;
    BOOL v20 = inBackground;
    __int16 v21 = 2048;
    int64_t v22 = a3;
    __int16 v23 = 1024;
    BOOL v24 = inactive;
    __int16 v25 = 1024;
    BOOL v26 = [(MKBasicMapView *)self rendersInBackground];
    _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_INFO, "%@<%p> updateBackgroundState: determined is%s in background (was background: %d, scene state: %ld, inactive: %d, rendersInBackground: %d)", (uint8_t *)&v13, 0x3Cu);
  }

  if (self->_inBackground != v5)
  {
    self->_BOOL inBackground = v5;
    if (v5)
    {
      [(MKBasicMapView *)self _didEnterBackground];
    }
    else
    {
      [(VKMapView *)self->_mapView openLoaderConnection];
      [(VKMapView *)self->_mapView willEnterForeground];
    }
  }
}

- (BOOL)rendersInBackground
{
  return [(VKMapView *)self->_mapView rendersInBackground];
}

- (void)_updateForCurrentScreen
{
  BOOL v3 = [(MKBasicMapView *)self window];
  id v21 = [v3 screen];

  uint64_t v4 = v21;
  if (v21)
  {
    [v21 nativeScale];
    double v6 = v5;
    uint64_t v7 = GEOResourceFilterScaleForScale();
    [v21 scale];
    uint64_t v8 = GEOResourceFilterScaleForScale();
    uint64_t v9 = [v21 _userInterfaceIdiom];
    __int16 v10 = [MEMORY[0x1E4F64918] modernManager];
    [v10 activateResourceScale:v8];

    if (v8 != v7)
    {
      CGFloat v11 = [MEMORY[0x1E4F64918] modernManager];
      [v11 activateResourceScale:v7];
    }
    if (v9 == 3)
    {
      __int16 v12 = [MEMORY[0x1E4F64918] modernManager];
      [v12 activateResourceScenario:1];
    }
    int v13 = [MEMORY[0x1E4F64918] modernManager];
    uint64_t v14 = [v13 activeTileGroup];

    [v14 readAll:1];
    __int16 v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 scale];
    int v16 = GEOResourceFilterScaleForScale();

    if (v9 == 3 && v14 && v7 != v16)
    {
      if ([v14 activeScalesCount])
      {
        uint64_t v17 = 0;
        while ([v14 activeScaleAtIndex:v17] != v7)
        {
          if (++v17 >= (unint64_t)[v14 activeScalesCount]) {
            goto LABEL_13;
          }
        }
      }
      else
      {
LABEL_13:
        uint64_t v18 = [MEMORY[0x1E4F42D90] mainScreen];
        [v18 nativeScale];
        double v6 = v19;
      }
    }
    [(VKMapView *)self->_mapView setContentsScale:v6];
    [(VKMapView *)self->_mapView setTargetDisplay:v9 == 3];
    BOOL v20 = objc_msgSend(v21, "_mapkit_display");
    [(VKMapView *)self->_mapView setHostDisplay:v20];

    uint64_t v4 = v21;
  }
}

- (void)_updateForCurrentLocale
{
  id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  -[VKMapView setPreferredUnits:](self->_mapView, "setPreferredUnits:", [v3 usesMetricSystem]);
}

- (void)_registerSceneNotifications
{
  id v3 = [(MKBasicMapView *)self window];
  id v7 = [v3 windowScene];

  if (v7)
  {
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x1E4F43CA8] object:v7];

    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4F43C88] object:v7];

    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__finishedSnapshot_ name:*MEMORY[0x1E4F44138] object:v7];
  }
}

- (void)_didEnterBackground
{
  [(VKMapView *)self->_mapView closeLoaderConnection];
  [(VKMapView *)self->_mapView didEnterBackground];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  double v6 = [v3 objectForInfoDictionaryKey:@"CAProcessCanAccessGPU"];

  if (!v6 || (char v4 = [v6 BOOLValue], v5 = v6, (v4 & 1) == 0))
  {
    [(VKMapView *)self->_mapView flushTileLoads];
    double v5 = v6;
  }
}

- (void)setTrafficStartTime:(double)a3
{
  self->_trafficStartTime = a3;
}

- (void)setMapModeStartTime:(double)a3
{
  self->_mapModeStartTime = a3;
}

- (void)_updateStatsForTimeSpentInCurrentMapTypeIsShowingFlyover:(BOOL)a3 ignoreIfViewInWindow:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(MKBasicMapView *)self window];

  if ((v7 || v4) && CFAbsoluteTimeGetCurrent() - self->_mapModeStartTime >= 1.0)
  {
    uint64_t v8 = [(MKBasicMapView *)self mapView];
    int v9 = [v8 mapType];

    int v10 = [(VKMapView *)self->_mapView isPitched];
    switch(v9)
    {
      case 0:
      case 6:
        CGFloat v11 = @"com.apple.maps.standardMode.time";
        __int16 v12 = @"com.apple.maps.standardPitchedMode.time";
        goto LABEL_22;
      case 1:
      case 7:
        CGFloat v11 = @"com.apple.maps.satelliteMode.time";
        __int16 v12 = @"com.apple.maps.satellitePitchedMode.time";
        goto LABEL_22;
      case 2:
        CGFloat v11 = @"com.apple.maps.hybridMode.time";
        __int16 v12 = @"com.apple.maps.hybridPitchedMode.time";
        goto LABEL_22;
      case 3:
        CGFloat v11 = @"com.apple.maps.satelliteGlobeMode.time";
        BOOL v13 = !v5;
        uint64_t v14 = @"com.apple.maps.satelliteGlobePitchedMode.time";
        if (v5) {
          CGFloat v11 = @"com.apple.maps.satelliteGlobeFlyoverMode.time";
        }
        __int16 v15 = @"com.apple.maps.satelliteGlobePitchedFlyoverMode.time";
        goto LABEL_14;
      case 4:
        CGFloat v11 = @"com.apple.maps.hybridGlobeMode.time";
        BOOL v13 = !v5;
        uint64_t v14 = @"com.apple.maps.hybridGlobePitchedMode.time";
        if (v5) {
          CGFloat v11 = @"com.apple.maps.hybridGlobeFlyoverMode.time";
        }
        __int16 v15 = @"com.apple.maps.hybridGlobePitchedFlyoverMode.time";
LABEL_14:
        if (v13) {
          __int16 v15 = v14;
        }
        if (v10) {
          CGFloat v11 = v15;
        }
        goto LABEL_24;
      case 5:
        CGFloat v11 = @"com.apple.maps.navigationMode.time";
        __int16 v12 = @"com.apple.maps.navigationPitchedMode.time";
        goto LABEL_22;
      case 8:
        CGFloat v11 = @"com.apple.maps.transitMode.time";
        __int16 v12 = @"com.apple.maps.transitPitchedMode.time";
LABEL_22:
        if (v10) {
          CGFloat v11 = v12;
        }
LABEL_24:
        int v16 = v11;
        ADClientAddValueForScalarKey();

        break;
      default:
        break;
    }
    self->_mapModeStartTime = CFAbsoluteTimeGetCurrent();
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MKBasicMapView *)self window];

  if (v5)
  {
    [(MKBasicMapView *)self _unregisterSceneNotifications];
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F43F00];
    uint64_t v8 = [(MKBasicMapView *)self window];
    [v6 removeObserver:self name:v7 object:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)MKBasicMapView;
  [(MKBasicMapView *)&v9 willMoveToWindow:v4];
}

- (void)setHasRenderedSomething:(BOOL)a3
{
  self->_hasRenderedSomething = a3;
}

- (BOOL)isChangingViewSize
{
  return self->_changingViewSizeCount > 0;
}

- (void)_beginChangingViewSize
{
}

- (void)_finishChangingViewSize
{
  int64_t changingViewSizeCount = self->_changingViewSizeCount;
  if (changingViewSizeCount) {
    self->_int64_t changingViewSizeCount = changingViewSizeCount - 1;
  }
}

- (void)_finishedSnapshot:(id)a3
{
}

- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5
{
  return -[MKBasicMapView initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:](self, "initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:", a4, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MKBasicMapView)initWithFrame:(CGRect)a3 andGlobe:(BOOL)a4 shouldRasterize:(BOOL)a5 allowsAntialiasing:(BOOL)a6
{
  return -[MKBasicMapView initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:](self, "initWithFrame:andGlobe:shouldRasterize:allowsAntialiasing:carDisplayType:", a4, a5, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F64918] modernManager];
  [v3 removeTileGroupObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MKBasicMapView;
  [(MKBasicMapView *)&v5 dealloc];
}

- (UIEdgeInsets)edgeInsets
{
  [(VKMapView *)self->_mapView edgeInsets];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  result.right = v9;
  result.bottom = v7;
  result.left = v5;
  result.top = v3;
  return result;
}

- (void)addCalloutSubview:(id)a3
{
}

- (CGSize)calloutContainerCanvasSize
{
  [(UIView *)self->_hostView frame];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (double)calloutContainerCanvasScale
{
  [(VKMapView *)self->_mapView contentsScale];
  return result;
}

- (void)_animateCanvasForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(MKBasicMapView *)self frame];
  double v6 = width;
  if (width <= v7)
  {
    [(MKBasicMapView *)self frame];
    double v6 = v8;
  }
  [(MKBasicMapView *)self frame];
  double v9 = height;
  if (height <= v10)
  {
    [(MKBasicMapView *)self frame];
    double v9 = v11;
  }
  [(MKBasicMapView *)self bounds];
  CGFloat v12 = CGRectGetMidX(v17) - v6 * 0.5;
  [(MKBasicMapView *)self bounds];
  CGFloat v13 = CGRectGetMidY(v18) - v9 * 0.5;
  [(MKBasicMapView *)self _beginChangingViewSize];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__MKBasicMapView__animateCanvasForBounds___block_invoke;
  v16[3] = &unk_1E54B9040;
  v16[4] = self;
  *(CGFloat *)&v16[5] = v12;
  *(CGFloat *)&v16[6] = v13;
  *(double *)&v16[7] = v6;
  *(double *)&v16[8] = v9;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v16];
  v14[4] = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__MKBasicMapView__animateCanvasForBounds___block_invoke_2;
  v15[3] = &unk_1E54B9040;
  v15[4] = self;
  *(double *)&v15[5] = width * 0.5 - v6 * 0.5;
  *(double *)&v15[6] = height * 0.5 - v9 * 0.5;
  *(double *)&v15[7] = v6;
  *(double *)&v15[8] = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__MKBasicMapView__animateCanvasForBounds___block_invoke_3;
  v14[3] = &unk_1E54B86F0;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v15 animations:v14 completion:0.0];
}

uint64_t __42__MKBasicMapView__animateCanvasForBounds___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v2 = *(void **)(*(void *)(a1 + 32) + 416);

  return [v2 forceLayout];
}

uint64_t __42__MKBasicMapView__animateCanvasForBounds___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __42__MKBasicMapView__animateCanvasForBounds___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) bounds];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 416) forceLayout];
  }
  double v3 = *(void **)(a1 + 32);

  return [v3 _finishChangingViewSize];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MKBasicMapView *)self bounds];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    if (objc_msgSend(MEMORY[0x1E4F42FF0], "_mapkit_shouldAdoptImplicitAnimationParameters"))
    {
      -[MKBasicMapView _animateCanvasForBounds:](self, "_animateCanvasForBounds:", x, y, width, height);
    }
    else
    {
      [(MKBasicMapView *)self _beginChangingViewSize];
      -[UIView setFrame:](self->_hostView, "setFrame:", x, y, width, height);
      if (self->_hasRenderedSomething && !self->_inBackground) {
        [(VKMapView *)self->_mapView forceFrame];
      }
      [(MKBasicMapView *)self _finishChangingViewSize];
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)MKBasicMapView;
  -[MKBasicMapView setBounds:](&v12, sel_setBounds_, x, y, width, height);
}

- (CLLocationCoordinate2D)convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  mapView = self->_mapView;
  double v7 = [a4 layer];
  -[VKMapView convertPoint:toCoordinateFromLayer:](mapView, "convertPoint:toCoordinateFromLayer:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.longitude = v13;
  result.latitude = v12;
  return result;
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  mapView = self->_mapView;
  double v7 = [a4 layer];
  -[VKMapView convertCoordinate:toPointToLayer:](mapView, "convertCoordinate:toPointToLayer:", v7, latitude, longitude);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toCameraModelPointToView:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  mapView = self->_mapView;
  double v7 = [a4 layer];
  -[VKMapView convertCoordinate:toCameraModelPointToLayer:](mapView, "convertCoordinate:toCameraModelPointToLayer:", v7, latitude, longitude);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)isPointValidForGesturing:(CGPoint)a3
{
  return -[VKMapView isPointValidForGesturing:](self->_mapView, "isPointValidForGesturing:", a3.x, a3.y);
}

- (void)_sceneDidEnterBackground:(id)a3
{
}

- (void)_unregisterSceneNotifications
{
  double v3 = [(MKBasicMapView *)self window];
  id v7 = [v3 windowScene];

  if (v7)
  {
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x1E4F43CA8] object:v7];

    double v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x1E4F43C88] object:v7];

    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4F44138] object:v7];
  }
}

- (void)setHidden:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKBasicMapView;
  [(MKBasicMapView *)&v4 setHidden:a3];
  [(MKBasicMapView *)self _updateMapViewHidden];
}

- (double)mapModeStartTime
{
  return self->_mapModeStartTime;
}

- (double)trafficStartTime
{
  return self->_trafficStartTime;
}

- (BOOL)hasRenderedSomething
{
  return self->_hasRenderedSomething;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (BOOL)isInBackground
{
  return self->_inBackground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_hostView, 0);
}

@end