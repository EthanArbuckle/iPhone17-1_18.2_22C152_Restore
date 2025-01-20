@interface _MKStaticMapView
- ($DC1C8D958DDC8D67D0023B74A9319680)region;
- ($FD2884BA735A6398BD92EEF91FE53E55)visibleMapRect;
- (BOOL)annotationContainer:(id)a3 isAnnotationView:(id)a4 validForDisplayAtPoint:(CGPoint)a5;
- (BOOL)annotationContainerIsRotated:(id)a3;
- (BOOL)annotationContainerShouldAlignToPixels:(id)a3;
- (BOOL)annotationManager:(id)a3 canSelectAnnotationRepresentation:(id)a4;
- (BOOL)canShowGrid;
- (BOOL)hasUserLocation;
- (BOOL)honorsLayoutMargins;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)shouldHideOffscreenSelectedAnnotation;
- (BOOL)showsUserLocation;
- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4;
- (CGRect)visibleRectInView:(id)a3;
- (CLLocationCoordinate2D)convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4;
- (MKMapCamera)camera;
- (MKMapConfiguration)preferredConfiguration;
- (NSArray)annotations;
- (NSArray)mapItems;
- (NSArray)overlays;
- (_MKStaticMapView)initWithFrame:(CGRect)a3;
- (_MKStaticMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4;
- (_MKStaticMapViewDelegate)delegate;
- (double)annotationContainer:(id)a3 pinDropDistanceForCoordinate:(CLLocationCoordinate2D)a4 maxDistance:(double *)a5;
- (id)annotationContainer:(id)a3 requestAddingClusterForAnnotationViews:(id)a4;
- (id)annotationCoordinateTest;
- (id)annotationManager:(id)a3 representationForAnnotation:(id)a4;
- (id)annotationRectTest;
- (id)rendererForOverlay:(id)a3;
- (id)viewForAnnotation:(id)a3;
- (unint64_t)_incrementSnapshotGeneration;
- (void)_addKVOForOverlayRenderer:(id)a3;
- (void)_displayGridWithCompletionHandler:(id)a3;
- (void)_hideAllAnnotations;
- (void)_removeKVOForOverlayRenderer:(id)a3;
- (void)_showAllAnnotations;
- (void)_startSnapshotRequest;
- (void)_startUpdatingUserLocation;
- (void)_stopUpdatingUserLocation;
- (void)_updateSnapshot:(BOOL)a3;
- (void)_updateSnapshotOptionsWithOverlayRenderers;
- (void)addAnnotation:(id)a3;
- (void)addAnnotationRepresentation:(id)a3 allowAnimation:(BOOL)a4;
- (void)addAnnotations:(id)a3;
- (void)addMapItems:(id)a3;
- (void)addOverlays:(id)a3;
- (void)addOverlays:(id)a3 level:(int64_t)a4;
- (void)annotationManager:(id)a3 didAddAnnotationRepresentations:(id)a4;
- (void)annotationManagerDidChangeVisibleAnnotationRepresentations:(id)a3;
- (void)beginUpdates;
- (void)dealloc;
- (void)deselectAnnotationRepresentation:(id)a3 animated:(BOOL)a4;
- (void)deselectMapItem:(id)a3;
- (void)endUpdates;
- (void)layoutMarginsDidChange;
- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4;
- (void)locationManagerUpdatedLimitsPrecisionState:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)moveAnnotationRepresentation:(id)a3 fromCoordinate:(CLLocationCoordinate2D)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAnnotation:(id)a3;
- (void)removeAnnotationRepresentation:(id)a3;
- (void)removeAnnotations:(id)a3;
- (void)removeMapItems:(id)a3;
- (void)removeOverlay:(id)a3;
- (void)removeOverlays:(id)a3;
- (void)selectAnnotation:(id)a3 animated:(BOOL)a4;
- (void)selectAnnotationRepresentation:(id)a3 animated:(BOOL)a4;
- (void)selectMapItem:(id)a3;
- (void)selectUserLocationAnimated:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCamera:(id)a3;
- (void)setCanShowGrid:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHonorsLayoutMargins:(BOOL)a3;
- (void)setPreferredConfiguration:(id)a3;
- (void)setRegion:(id *)a3;
- (void)setSelectedTrailWithId:(id)a3 name:(id)a4 locale:(id)a5;
- (void)setShowsUserLocation:(BOOL)a3;
- (void)setVisibleMapRect:(id)a3;
- (void)setVisibleMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation _MKStaticMapView

- (_MKStaticMapView)initWithFrame:(CGRect)a3
{
  return -[_MKStaticMapView initWithFrame:locationManager:](self, "initWithFrame:locationManager:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_MKStaticMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v72[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v69.receiver = self;
  v69.super_class = (Class)_MKStaticMapView;
  v10 = -[_MKStaticMapView initWithFrame:](&v69, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    id v68 = v9;
    if (v9
      && (v11 = [[MKLocationManager alloc] initWithCLLocationManager:v9]) != 0)
    {
      int v12 = 0;
      v67 = v11;
      v13 = v11;
    }
    else
    {
      v13 = +[MKLocationManager sharedLocationManager];
      v67 = 0;
      int v12 = 1;
    }
    objc_storeStrong((id *)&v10->_locationManager, v13);
    if (v12) {

    }
    v14 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"CartographyBackgroundColor");
    [(_MKStaticMapView *)v10 setBackgroundColor:v14];

    v15 = objc_alloc_init(MKMapSnapshotOptions);
    snapshotOptions = v10->_snapshotOptions;
    v10->_snapshotOptions = v15;

    v17 = [(_MKStaticMapView *)v10 traitCollection];
    [(MKMapSnapshotOptions *)v10->_snapshotOptions setTraitCollection:v17];

    [(_MKStaticMapView *)v10 bounds];
    double v19 = v18;
    [(_MKStaticMapView *)v10 bounds];
    if (v19 * v20 > 0.0)
    {
      [(_MKStaticMapView *)v10 bounds];
      -[MKMapSnapshotOptions setSize:](v10->_snapshotOptions, "setSize:", v21, v22);
    }
    v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    imageView = v10->_imageView;
    v10->_imageView = v23;

    [(UIImageView *)v10->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v10->_imageView setContentMode:4];
    [(_MKStaticMapView *)v10 addSubview:v10->_imageView];
    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(UIImageView *)v10->_imageView centerXAnchor];
    v27 = [(_MKStaticMapView *)v10 centerXAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v72[0] = v28;
    v29 = [(UIImageView *)v10->_imageView centerYAnchor];
    v30 = [(_MKStaticMapView *)v10 centerYAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v72[1] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    [v25 activateConstraints:v32];

    v33 = objc_alloc_init(MKAnnotationManager);
    annotationManager = v10->_annotationManager;
    v10->_annotationManager = v33;

    [(MKAnnotationManager *)v10->_annotationManager setContainer:v10];
    [(MKAnnotationManager *)v10->_annotationManager setDelegate:v10];
    v35 = objc_alloc_init(MKAnnotationContainerView);
    annotationContainer = v10->_annotationContainer;
    v10->_annotationContainer = v35;

    [(MKAnnotationContainerView *)v10->_annotationContainer setDelegate:v10];
    [(MKAnnotationContainerView *)v10->_annotationContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKStaticMapView *)v10 addSubview:v10->_annotationContainer];
    v62 = (void *)MEMORY[0x1E4F28DC8];
    v66 = [(MKAnnotationContainerView *)v10->_annotationContainer topAnchor];
    v65 = [(_MKStaticMapView *)v10 topAnchor];
    v64 = [v66 constraintEqualToAnchor:v65];
    v71[0] = v64;
    v63 = [(MKAnnotationContainerView *)v10->_annotationContainer leftAnchor];
    v37 = [(_MKStaticMapView *)v10 leftAnchor];
    v38 = [v63 constraintEqualToAnchor:v37];
    v71[1] = v38;
    v39 = [(MKAnnotationContainerView *)v10->_annotationContainer rightAnchor];
    v40 = [(_MKStaticMapView *)v10 rightAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v71[2] = v41;
    v42 = [(MKAnnotationContainerView *)v10->_annotationContainer bottomAnchor];
    v43 = [(_MKStaticMapView *)v10 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    v71[3] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
    [v62 activateConstraints:v45];

    v46 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v47 = v10->_overlays[0];
    v10->_overlays[0] = v46;

    v48 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v49 = v10->_overlays[1];
    v10->_overlays[1] = v48;

    uint64_t v50 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
    overlaysToRenderers = v10->_overlaysToRenderers;
    v10->_overlaysToRenderers = (NSMapTable *)v50;

    uint64_t v52 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
    mapItemCustomFeaturesToMapItems = v10->_mapItemCustomFeaturesToMapItems;
    v10->_mapItemCustomFeaturesToMapItems = (NSMapTable *)v52;

    uint64_t v54 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:10];
    mapItemsToMapItemCustomFeatures = v10->_mapItemsToMapItemCustomFeatures;
    v10->_mapItemsToMapItemCustomFeatures = (NSMapTable *)v54;

    v56 = objc_alloc_init(MKStandardMapConfiguration);
    preferredConfiguration = v10->_preferredConfiguration;
    v10->_preferredConfiguration = &v56->super;

    [(MKMapConfiguration *)v10->_preferredConfiguration _addObserver:v10 options:0 context:_MergedGlobals_1_0];
    v10->_canShowGrid = 1;
    v70[0] = objc_opt_class();
    v70[1] = objc_opt_class();
    v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    id v59 = (id)[(_MKStaticMapView *)v10 registerForTraitChanges:v58 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    v60 = v10;
    id v9 = v68;
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_MKStaticMapView;
  [(_MKStaticMapView *)&v2 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_MKStaticMapView *)self frame];
  BOOL v10 = height != v9 || width != v8;
  self->_changingSize = v10;
  v11.receiver = self;
  v11.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  self->_changingSize = 0;
  if (v10) {
    [(_MKStaticMapView *)self _updateSnapshot:1];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_MKStaticMapView *)self bounds];
  BOOL v10 = height != v9 || width != v8;
  self->_changingSize = v10;
  v11.receiver = self;
  v11.super_class = (Class)_MKStaticMapView;
  -[_MKStaticMapView setBounds:](&v11, sel_setBounds_, x, y, width, height);
  self->_changingSize = 0;
  if (v10) {
    [(_MKStaticMapView *)self _updateSnapshot:1];
  }
}

- (NSArray)annotations
{
  return [(MKAnnotationManager *)self->_annotationManager annotations];
}

- (void)beginUpdates
{
  if (self->_batchingEnabled)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)objc_super v2 = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: !_batchingEnabled", v2, 2u);
    }
  }
  else
  {
    self->_batchingEnabled = 1;
  }
}

- (void)endUpdates
{
  if (self->_batchingEnabled)
  {
    self->_batchingEnabled = 0;
    if (self->_batchHasChanges)
    {
      self->_batchHasChanges = 0;
      [(_MKStaticMapView *)self _updateSnapshot:1];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)objc_super v2 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _batchingEnabled", v2, 2u);
  }
}

- (void)layoutMarginsDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)_MKStaticMapView;
  [(_MKStaticMapView *)&v9 layoutMarginsDidChange];
  [(_MKStaticMapView *)self layoutMargins];
  if (!self->_changingSize)
  {
    BOOL v7 = v4 == self->_lastSnapshotLayoutMargins.left;
    if (v3 != self->_lastSnapshotLayoutMargins.top) {
      BOOL v7 = 0;
    }
    BOOL v8 = v6 == self->_lastSnapshotLayoutMargins.right && v7;
    if (v5 != self->_lastSnapshotLayoutMargins.bottom) {
      BOOL v8 = 0;
    }
    if (self->_honorsLayoutMargins && !v8) {
      [(_MKStaticMapView *)self _updateSnapshot:0];
    }
  }
}

- ($DC1C8D958DDC8D67D0023B74A9319680)region
{
  return ($DC1C8D958DDC8D67D0023B74A9319680 *)[(MKMapSnapshotOptions *)self->_snapshotOptions region];
}

- (void)setRegion:(id *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  int64_t v12 = [(MKMapSnapshotOptions *)self->_snapshotOptions _viewportMode];
  v13 = (float64x2_t *)MEMORY[0x1E4F437F8];
  if (v12
    || ([(MKMapSnapshotOptions *)self->_snapshotOptions region], vabdd_f64(v10, v17) >= 0.00000000999999994)
    || vabdd_f64(v9, v14) >= 0.00000000999999994
    || vabdd_f64(v8, v15) >= 0.00000000999999994
    || vabdd_f64(v7, v16) >= 0.00000000999999994
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_additionalEdgeInsets.top, *v13), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_additionalEdgeInsets.bottom, v13[1]))), 0xFuLL))) & 1) == 0)
  {
    -[MKMapSnapshotOptions setRegion:](self->_snapshotOptions, "setRegion:", v10, v9, v8, v7);
    float64x2_t v18 = v13[1];
    *(float64x2_t *)&self->_additionalEdgeInsets.top = *v13;
    *(float64x2_t *)&self->_additionalEdgeInsets.bottom = v18;
    [(_MKStaticMapView *)self _updateSnapshot:1];
    annotationContainer = self->_annotationContainer;
    [(MKAnnotationContainerView *)annotationContainer updateAnnotationViewsForReason:1];
  }
}

- ($FD2884BA735A6398BD92EEF91FE53E55)visibleMapRect
{
  [(MKMapSnapshotOptions *)self->_snapshotOptions mapRect];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (void)setVisibleMapRect:(id)a3
{
}

- (void)setVisibleMapRect:(id)a3 edgePadding:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v10 = a3.var0.var1;
  double v11 = a3.var0.var0;
  if ([(MKMapSnapshotOptions *)self->_snapshotOptions _viewportMode] != 1
    || (([(MKMapSnapshotOptions *)self->_snapshotOptions mapRect], v11 == v16)
      ? (BOOL v17 = v10 == v13)
      : (BOOL v17 = 0),
        v17 ? (BOOL v18 = var0 == v14) : (BOOL v18 = 0),
        v18 ? (BOOL v19 = var1 == v15) : (BOOL v19 = 0),
        !v19
     || (left == self->_additionalEdgeInsets.left ? (BOOL v21 = top == self->_additionalEdgeInsets.top) : (BOOL v21 = 0),
         v21 ? (BOOL v22 = right == self->_additionalEdgeInsets.right) : (BOOL v22 = 0),
         v22 ? (BOOL v23 = bottom == self->_additionalEdgeInsets.bottom) : (BOOL v23 = 0),
         !v23)))
  {
    -[MKMapSnapshotOptions setMapRect:](self->_snapshotOptions, "setMapRect:", v11, v10, var0, var1);
    self->_additionalEdgeInsets.double top = top;
    self->_additionalEdgeInsets.double left = left;
    self->_additionalEdgeInsets.double bottom = bottom;
    self->_additionalEdgeInsets.double right = right;
    [(_MKStaticMapView *)self _updateSnapshot:1];
    annotationContainer = self->_annotationContainer;
    [(MKAnnotationContainerView *)annotationContainer updateAnnotationViewsForReason:1];
  }
}

- (MKMapCamera)camera
{
  return [(MKMapSnapshotOptions *)self->_snapshotOptions camera];
}

- (void)setCamera:(id)a3
{
  id v12 = a3;
  int64_t v4 = [(MKMapSnapshotOptions *)self->_snapshotOptions _viewportMode];
  uint64_t v5 = MEMORY[0x1E4F437F8];
  if (v4 != 2) {
    goto LABEL_11;
  }
  double v6 = [(MKMapSnapshotOptions *)self->_snapshotOptions camera];
  if (![v12 isEqual:v6]
    || (self->_additionalEdgeInsets.left == *(double *)(v5 + 8)
      ? (BOOL v7 = self->_additionalEdgeInsets.top == *(double *)v5)
      : (BOOL v7 = 0),
        v7 ? (BOOL v8 = self->_additionalEdgeInsets.right == *(double *)(v5 + 24)) : (BOOL v8 = 0),
        !v8))
  {

LABEL_11:
    [(MKMapSnapshotOptions *)self->_snapshotOptions setCamera:v12];
    long long v9 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)&self->_additionalEdgeInsets.double top = *(_OWORD *)v5;
    *(_OWORD *)&self->_additionalEdgeInsets.double bottom = v9;
    [(_MKStaticMapView *)self _updateSnapshot:1];
    [(MKAnnotationContainerView *)self->_annotationContainer updateAnnotationViewsForReason:1];
    goto LABEL_12;
  }
  double v10 = *(double *)(v5 + 16);
  double bottom = self->_additionalEdgeInsets.bottom;

  if (bottom != v10) {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)setSelectedTrailWithId:(id)a3 name:(id)a4 locale:(id)a5
{
  [(MKMapSnapshotOptions *)self->_snapshotOptions _setSelectedTrailWithId:a3 name:a4 locale:a5];

  [(_MKStaticMapView *)self _updateSnapshot:1];
}

- (CGPoint)convertCoordinate:(CLLocationCoordinate2D)a3 toPointToView:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  snapshot = self->_snapshot;
  if (!snapshot) {
    snapshot = self->_gridSnapshot;
  }
  id v8 = a4;
  -[MKMapSnapshot pointForCoordinate:](snapshot, "pointForCoordinate:", latitude, longitude);
  -[_MKStaticMapView convertPoint:toView:](self, "convertPoint:toView:", v8);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CLLocationCoordinate2D)convertPoint:(CGPoint)a3 toCoordinateFromView:(id)a4
{
  double v4 = *MEMORY[0x1E4F1E750];
  double v5 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  result.double longitude = v5;
  result.double latitude = v4;
  return result;
}

- (void)setPreferredConfiguration:(id)a3
{
  preferredConfiguration = self->_preferredConfiguration;
  if (preferredConfiguration != a3)
  {
    uint64_t v5 = _MergedGlobals_1_0;
    id v6 = a3;
    [(MKMapConfiguration *)preferredConfiguration _removeObserver:self context:v5];
    BOOL v7 = (MKMapConfiguration *)[v6 copy];

    id v8 = self->_preferredConfiguration;
    self->_preferredConfiguration = v7;

    [(MKMapConfiguration *)self->_preferredConfiguration _addObserver:self options:0 context:_MergedGlobals_1_0];
    [(MKMapSnapshotOptions *)self->_snapshotOptions setPreferredConfiguration:self->_preferredConfiguration];
    [(_MKStaticMapView *)self _updateSnapshot:1];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)_MergedGlobals_1_0 == a6)
  {
    [(MKMapSnapshotOptions *)self->_snapshotOptions setPreferredConfiguration:self->_preferredConfiguration];
LABEL_6:
    [(_MKStaticMapView *)self _updateSnapshot:1];
    goto LABEL_7;
  }
  if ((void *)qword_1E914ECE0 == a6)
  {
    [(_MKStaticMapView *)self _updateSnapshotOptionsWithOverlayRenderers];
    goto LABEL_6;
  }
  v13.receiver = self;
  v13.super_class = (Class)_MKStaticMapView;
  [(_MKStaticMapView *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_7:
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = [(_MKStaticMapView *)self traitCollection];
  [(MKMapSnapshotOptions *)self->_snapshotOptions setTraitCollection:v5];

  [(_MKStaticMapView *)self _updateSnapshot:1];
}

- (unint64_t)_incrementSnapshotGeneration
{
  [(MKMapSnapshotter *)self->_currentSnapshotter cancel];
  currentSnapshotter = self->_currentSnapshotter;
  self->_currentSnapshotter = 0;

  snapshot = self->_snapshot;
  self->_snapshot = 0;

  gridSnapshot = self->_gridSnapshot;
  self->_gridSnapshot = 0;

  unint64_t result = self->_snapshotGeneration + 1;
  self->_snapshotGeneration = result;
  return result;
}

- (void)_displayGridWithCompletionHandler:(id)a3
{
  double v4 = (void (**)(void))a3;
  [(_MKStaticMapView *)self bounds];
  double v6 = v5;
  [(_MKStaticMapView *)self bounds];
  if (v6 * v7 == 0.0
    || (-[UIImageView setImage:](self->_imageView, "setImage:", 0, v6 * v7),
        [(_MKStaticMapView *)self _hideAllAnnotations],
        !self->_canShowGrid))
  {
    v4[2](v4);
  }
  else
  {
    id v8 = objc_alloc_init(MKMapSnapshotOptions);
    double v9 = [(_MKStaticMapView *)self traitCollection];
    [(MKMapSnapshotOptions *)v8 setTraitCollection:v9];

    [(_MKStaticMapView *)self bounds];
    -[MKMapSnapshotOptions setSize:](v8, "setSize:", v10, v11);
    [(MKMapSnapshotOptions *)v8 setMapType:105];
    id v12 = [(MKMapSnapshotOptions *)self->_snapshotOptions camera];
    [(MKMapSnapshotOptions *)v8 setCamera:v12];

    objc_super v13 = [[MKMapSnapshotter alloc] initWithOptions:v8];
    currentSnapshotter = self->_currentSnapshotter;
    self->_currentSnapshotter = v13;

    unint64_t snapshotGeneration = self->_snapshotGeneration;
    double v16 = self->_currentSnapshotter;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54___MKStaticMapView__displayGridWithCompletionHandler___block_invoke;
    v17[3] = &unk_1E54BCA50;
    unint64_t v19 = snapshotGeneration;
    v17[4] = self;
    BOOL v18 = v4;
    [(MKMapSnapshotter *)v16 startWithQueue:MEMORY[0x1E4F14428] completionHandler:v17];
  }
}

- (void)_updateSnapshot:(BOOL)a3
{
  if (self->_batchingEnabled)
  {
    self->_batchHasChanges = 1;
    return;
  }
  BOOL v4 = a3;
  unint64_t v5 = [(_MKStaticMapView *)self _incrementSnapshotGeneration];
  if (!self->_loading)
  {
    self->_loading = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 mapViewWillStartLoadingMap:self];
    }
  }
  if (self->_honorsLayoutMargins)
  {
    [(_MKStaticMapView *)self layoutMargins];
    self->_lastSnapshotLayoutMargins.double top = v9;
    self->_lastSnapshotLayoutMargins.double left = v10;
    self->_lastSnapshotLayoutMargins.double bottom = v11;
    self->_lastSnapshotLayoutMargins.double right = v12;
  }
  if (self->_showsUserLocation && !self->_isUpdatingUserLocation)
  {
    [(_MKStaticMapView *)self _startUpdatingUserLocation];
    if (v4) {
      goto LABEL_11;
    }
  }
  else if (v4)
  {
LABEL_11:
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __36___MKStaticMapView__updateSnapshot___block_invoke;
    v13[3] = &unk_1E54B81B0;
    v13[4] = self;
    v13[5] = v5;
    [(_MKStaticMapView *)self _displayGridWithCompletionHandler:v13];
    return;
  }

  [(_MKStaticMapView *)self _startSnapshotRequest];
}

- (void)_startSnapshotRequest
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  unint64_t snapshotGeneration = self->_snapshotGeneration;
  [(_MKStaticMapView *)self bounds];
  double v5 = v4;
  [(_MKStaticMapView *)self bounds];
  if (v5 * v6 == 0.0)
  {
    if (self->_loading)
    {
      self->_loading = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v40 = objc_loadWeakRetained((id *)&self->_delegate);
        [v40 mapViewDidFinishLoadingMap:self];
      }
    }
  }
  else
  {
    [(_MKStaticMapView *)self bounds];
    -[MKMapSnapshotOptions setSize:](self->_snapshotOptions, "setSize:", v9, v10);
    double v11 = *MEMORY[0x1E4F437F8];
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    if (self->_honorsLayoutMargins)
    {
      [(_MKStaticMapView *)self layoutMargins];
      double top = v15 + self->_additionalEdgeInsets.top;
      double left = v17 + self->_additionalEdgeInsets.left;
      double bottom = v19 + self->_additionalEdgeInsets.bottom;
      double right = v21 + self->_additionalEdgeInsets.right;
    }
    else
    {
      double top = self->_additionalEdgeInsets.top;
      double left = self->_additionalEdgeInsets.left;
      double bottom = self->_additionalEdgeInsets.bottom;
      double right = self->_additionalEdgeInsets.right;
    }
    -[MKMapSnapshotOptions _setEdgeInsets:](self->_snapshotOptions, "_setEdgeInsets:", v11 + top, v12 + left, v14 + bottom, v13 + right);
    BOOL v23 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v24 = [(MKMapSnapshotOptions *)self->_snapshotOptions _customFeatureAnnotations];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v47 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v26);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v30 = [(MKAnnotationContainerView *)self->_annotationContainer annotationViews];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v43 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if ([v35 isProvidingCustomFeature])
          {
            v36 = [v35 customFeatureAnnotation];
            [v23 addObject:v36];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v32);
    }

    [(MKMapSnapshotOptions *)self->_snapshotOptions _setCustomFeatureAnnotations:v23];
    v37 = [[MKMapSnapshotter alloc] initWithOptions:self->_snapshotOptions];
    currentSnapshotter = self->_currentSnapshotter;
    self->_currentSnapshotter = v37;

    v39 = self->_currentSnapshotter;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __41___MKStaticMapView__startSnapshotRequest__block_invoke;
    v41[3] = &unk_1E54BCA78;
    v41[4] = self;
    v41[5] = snapshotGeneration;
    [(MKMapSnapshotter *)v39 startWithQueue:MEMORY[0x1E4F14428] completionHandler:v41];
  }
}

- (void)_hideAllAnnotations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_userLocation) {
    -[MKAnnotationManager removeAnnotation:](self->_annotationManager, "removeAnnotation:");
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = [(MKAnnotationContainerView *)self->_annotationContainer annotationViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setHidden:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_showAllAnnotations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_userLocation) {
    -[MKAnnotationManager addAnnotation:](self->_annotationManager, "addAnnotation:");
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = [(MKAnnotationContainerView *)self->_annotationContainer annotationViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setHidden:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)addAnnotation:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[_MKStaticMapView addAnnotations:](self, "addAnnotations:", v6, v7, v8);
  }
}

- (void)addAnnotations:(id)a3
{
  id v4 = a3;
  if ([v4 count]) {
    [(MKAnnotationManager *)self->_annotationManager addAnnotations:v4];
  }
}

- (void)removeAnnotation:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

    -[_MKStaticMapView removeAnnotations:](self, "removeAnnotations:", v6, v7, v8);
  }
}

- (void)removeAnnotations:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          if (*(MKUserLocation **)(*((void *)&v11 + 1) + 8 * v10) != self->_userLocation) {
            [v5 addObject:(void)v11];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(MKAnnotationManager *)self->_annotationManager removeAnnotations:v5];
  }
}

- (void)selectAnnotation:(id)a3 animated:(BOOL)a4
{
  self->_userLocationSelected = 0;
  [(MKAnnotationManager *)self->_annotationManager selectAnnotation:a3 animated:a4];
}

- (void)selectUserLocationAnimated:(BOOL)a3
{
  self->_userLocationSelected = 1;
  if (self->_userLocationView) {
    [(MKAnnotationManager *)self->_annotationManager selectAnnotation:self->_userLocation animated:a3];
  }
}

- (id)viewForAnnotation:(id)a3
{
  return [(MKAnnotationManager *)self->_annotationManager representationForAnnotation:a3];
}

- (NSArray)overlays
{
  overlays = self->_overlays;
  double v3 = [(NSMutableOrderedSet *)self->_overlays[0] array];
  id v4 = [(NSMutableOrderedSet *)overlays[1] array];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (void)addOverlays:(id)a3
{
  id v4 = a3;
  [(_MKStaticMapView *)self addOverlays:v4 level:+[MKOverlayContainerView _defaultOverlayLevel]];
}

- (void)addOverlays:(id)a3 level:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    id v16 = v6;
    double v17 = self->_overlays[a4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v19 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          -[_MKStaticMapView removeOverlay:](self, "removeOverlay:", v10, v16);
          long long v11 = [(NSMapTable *)self->_overlaysToRenderers objectForKey:v10];
          if (v11) {
            [(_MKStaticMapView *)self _removeKVOForOverlayRenderer:v11];
          }
          [(NSMapTable *)self->_overlaysToRenderers removeObjectForKey:v10];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          char v13 = objc_opt_respondsToSelector();

          if (v13)
          {
            [(NSMutableOrderedSet *)v17 addObject:v10];
            id v14 = objc_loadWeakRetained((id *)&self->_delegate);
            uint64_t v15 = [v14 mapView:self rendererForOverlay:v10];

            [(_MKStaticMapView *)self _addKVOForOverlayRenderer:v15];
            [(NSMapTable *)self->_overlaysToRenderers setObject:v15 forKey:v10];
            long long v11 = (void *)v15;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    [(_MKStaticMapView *)self _updateSnapshotOptionsWithOverlayRenderers];
    [(_MKStaticMapView *)self _updateSnapshot:1];

    id v6 = v16;
  }
}

- (void)_addKVOForOverlayRenderer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = overlayRendererKVOKeys();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(NSString **)(*((void *)&v11 + 1) + 8 * i);
        NSSelectorFromString(v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v10, 0, qword_1E914ECE0, (void)v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_removeKVOForOverlayRenderer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = overlayRendererKVOKeys();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(NSString **)(*((void *)&v11 + 1) + 8 * i);
        NSSelectorFromString(v10);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, v10, qword_1E914ECE0, (void)v11);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)removeOverlays:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          -[_MKStaticMapView removeOverlay:](self, "removeOverlay:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(_MKStaticMapView *)self _updateSnapshotOptionsWithOverlayRenderers];
    [(_MKStaticMapView *)self _updateSnapshot:1];
  }
}

- (void)removeOverlay:(id)a3
{
  id v8 = a3;
  uint64_t v4 = 0;
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    uint64_t v7 = self->_overlays[v4];
    if ([(NSMutableOrderedSet *)v7 containsObject:v8]) {
      break;
    }

    char v5 = 0;
    uint64_t v4 = 1;
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
  }
  [(NSMutableOrderedSet *)v7 removeObject:v8];
  [(NSMapTable *)self->_overlaysToRenderers removeObjectForKey:v8];

LABEL_6:
}

- (void)_updateSnapshotOptionsWithOverlayRenderers
{
  uint64_t v3 = 0;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  overlays = self->_overlays;
  char v4 = 1;
  do
  {
    char v5 = v4;
    char v6 = overlays[v3];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [(NSMapTable *)self->_overlaysToRenderers objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(MKMapSnapshotOptions *)self->_snapshotOptions _setOverlayRenderers:v7 forOverlayLevel:v3];
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
}

- (id)rendererForOverlay:(id)a3
{
  return [(NSMapTable *)self->_overlaysToRenderers objectForKey:a3];
}

- (BOOL)hasUserLocation
{
  double v2 = [(MKUserLocation *)self->_userLocation location];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setShowsUserLocation:(BOOL)a3
{
  if (self->_showsUserLocation == a3) {
    return;
  }
  self->_showsUserLocation = a3;
  if (a3)
  {
    char v4 = [(UIImageView *)self->_imageView image];

    if (v4)
    {
      [(_MKStaticMapView *)self _startUpdatingUserLocation];
      return;
    }
    if (self->_showsUserLocation) {
      return;
    }
  }
  [(_MKStaticMapView *)self _stopUpdatingUserLocation];
  if (self->_userLocation)
  {
    -[MKAnnotationManager removeAnnotation:](self->_annotationManager, "removeAnnotation:");
    userLocation = self->_userLocation;
    self->_userLocation = 0;
  }
}

- (void)_startUpdatingUserLocation
{
  self->_isUpdatingUserLocation = 1;
  [(MKLocationManager *)self->_locationManager startLocationUpdateWithObserver:self];
}

- (void)_stopUpdatingUserLocation
{
  self->_isUpdatingUserLocation = 0;
  [(MKLocationManager *)self->_locationManager stopLocationUpdateWithObserver:self];
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4 = a3;
  char v5 = [v4 lastLocation];
  userLocation = self->_userLocation;
  if (userLocation)
  {
    id v7 = (void *)MEMORY[0x1E4F42FF0];
    [v4 expectedGpsUpdateInterval];
    double v9 = v8;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    long long v18 = __51___MKStaticMapView_locationManagerUpdatedLocation___block_invoke;
    uint64_t v19 = &unk_1E54B8248;
    uint64_t v20 = self;
    id v21 = v5;
    objc_msgSend(v7, "_mapkit_animateWithDuration:animations:completion:", &v16, 0, v9);
  }
  else
  {
    uint64_t v10 = objc_alloc_init(MKUserLocation);
    uint64_t v11 = self->_userLocation;
    self->_userLocation = v10;

    [(MKUserLocation *)self->_userLocation setLocation:v5];
  }
  objc_msgSend(v5, "course", v16, v17, v18, v19, v20);
  -[MKUserLocation setCourse:](self->_userLocation, "setCourse:");
  if (!userLocation)
  {
    long long v12 = [(UIImageView *)self->_imageView image];

    if (v12) {
      [(MKAnnotationManager *)self->_annotationManager addAnnotation:self->_userLocation];
    }
  }
  long long v13 = self->_userLocationView;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v15 = 0;
      goto LABEL_13;
    }
    long long v14 = [(MKAnnotationView *)v13 _mkUserLocationView];
  }
  long long v15 = v14;
LABEL_13:

  [v4 expectedGpsUpdateInterval];
  -[MKAnnotationView updateStateFromLocation:duration:](v15, "updateStateFromLocation:duration:", v5);
}

- (void)locationManagerFailedToUpdateLocation:(id)a3 withError:(id)a4
{
  id v4 = self->_userLocationView;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = v4;
LABEL_5:
    char v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [(MKAnnotationView *)v4 _mkUserLocationView];
    goto LABEL_5;
  }
  char v6 = 0;
LABEL_7:

  [(MKAnnotationView *)v6 locationManagerFailedToUpdateLocation];
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)locationManagerUpdatedLimitsPrecisionState:(id)a3
{
  id v7 = a3;
  id v4 = self->_userLocationView;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v6 = v4;
      goto LABEL_8;
    }
    char v5 = [(MKAnnotationView *)v4 _mkUserLocationView];
  }
  char v6 = v5;

  if (!v6) {
    goto LABEL_9;
  }
  -[MKAnnotationView _setShouldShowDynamicLocationAnimations:](v6, "_setShouldShowDynamicLocationAnimations:", [v7 isAuthorizedForPreciseLocation]);
LABEL_8:

LABEL_9:
}

- (void)addAnnotationRepresentation:(id)a3 allowAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    [v8 _setStaticMapView:self];
    double v9 = [v8 annotation];
    userLocation = self->_userLocation;

    if (v9 != userLocation)
    {
LABEL_16:
      [(MKAnnotationContainerView *)self->_annotationContainer addAnnotationView:v8 allowAnimation:v4];
      currentUpdateAddedAnnotations = self->_currentUpdateAddedAnnotations;
      if (!currentUpdateAddedAnnotations)
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
        id v21 = self->_currentUpdateAddedAnnotations;
        self->_currentUpdateAddedAnnotations = v20;

        currentUpdateAddedAnnotations = self->_currentUpdateAddedAnnotations;
      }
      [(NSMutableArray *)currentUpdateAddedAnnotations addObject:v8];

      goto LABEL_19;
    }
    objc_storeStrong((id *)&self->_userLocationView, a3);
    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v13 = 0;
LABEL_9:

        long long v14 = [(MKUserLocation *)self->_userLocation location];
        [v13 updateStateFromLocation:v14 duration:0.0];

        BOOL v15 = [(MKLocationManager *)self->_locationManager isAuthorizedForPreciseLocation];
        id v16 = v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v17 = v16;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v18 = 0;
            goto LABEL_15;
          }
          id v17 = [v16 _mkUserLocationView];
        }
        long long v18 = v17;
LABEL_15:

        [v18 _setShouldShowDynamicLocationAnimations:v15];
        [(MKAnnotationContainerView *)self->_annotationContainer setUserLocationView:v16];
        goto LABEL_16;
      }
      id v12 = [v11 _mkUserLocationView];
    }
    long long v13 = v12;
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)long long v22 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [representation isKindOfClass:MKAnnotationView.class]", v22, 2u);
  }
LABEL_19:
}

- (void)removeAnnotationRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = (MKAnnotationView *)v4;
    if ([(MKAnnotationView *)v5 isProvidingCustomFeature]) {
      self->_currentUpdateRemovedCustomFeatureAnnotation = 1;
    }
    [(MKAnnotationView *)v5 _setStaticMapView:0];
    if (self->_userLocationView == v5)
    {
      self->_userLocationView = 0;

      [(MKAnnotationContainerView *)self->_annotationContainer setUserLocationView:0];
    }
    [(MKAnnotationContainerView *)self->_annotationContainer removeAnnotationView:v5];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [representation isKindOfClass:MKAnnotationView.class]", v6, 2u);
  }
}

- (void)selectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  annotationContainer = self->_annotationContainer;
  id v6 = [a3 viewRepresentation];
  [(MKAnnotationContainerView *)annotationContainer selectAnnotationView:v6 animated:v4];
}

- (void)deselectAnnotationRepresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  annotationContainer = self->_annotationContainer;
  id v6 = [a3 viewRepresentation];
  [(MKAnnotationContainerView *)annotationContainer deselectAnnotationView:v6 animated:v4];
}

- (void)moveAnnotationRepresentation:(id)a3 fromCoordinate:(CLLocationCoordinate2D)a4 animated:(BOOL)a5 duration:(double)a6
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MKAnnotationContainerView *)self->_annotationContainer updateAnnotationView:v7];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: [annotationRepresentation isKindOfClass:MKAnnotationView.class]", v8, 2u);
  }
}

- (id)annotationRectTest
{
  return &__block_literal_global_79;
}

- (id)annotationCoordinateTest
{
  return &__block_literal_global_45_0;
}

- (BOOL)shouldHideOffscreenSelectedAnnotation
{
  return 0;
}

- (void)annotationManager:(id)a3 didAddAnnotationRepresentations:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(MKAnnotationView **)(*((void *)&v11 + 1) + 8 * i) == self->_userLocationView)
        {
          if (self->_userLocationSelected)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __70___MKStaticMapView_annotationManager_didAddAnnotationRepresentations___block_invoke;
            block[3] = &unk_1E54B8188;
            block[4] = self;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)annotationManagerDidChangeVisibleAnnotationRepresentations:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(MKAnnotationContainerView *)self->_annotationContainer updateAnnotationViewsForReason:0];
  [MEMORY[0x1E4F39CF8] begin];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = [(MKAnnotationContainerView *)self->_annotationContainer annotationViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * i) _performStateUpdatesIfNeeded];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  [MEMORY[0x1E4F39CF8] commit];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v9 = self->_currentUpdateAddedAnnotations;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "isProvidingCustomFeature", (void)v15))
        {

          BOOL currentUpdateRemovedCustomFeatureAnnotation = self->_currentUpdateRemovedCustomFeatureAnnotation;
          goto LABEL_19;
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (self->_currentUpdateRemovedCustomFeatureAnnotation)
  {
    BOOL currentUpdateRemovedCustomFeatureAnnotation = 1;
LABEL_19:
    -[_MKStaticMapView _updateSnapshot:](self, "_updateSnapshot:", currentUpdateRemovedCustomFeatureAnnotation, (void)v15);
  }
  [(NSMutableArray *)self->_currentUpdateAddedAnnotations removeAllObjects];
  self->_BOOL currentUpdateRemovedCustomFeatureAnnotation = 0;
}

- (id)annotationManager:(id)a3 representationForAnnotation:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    double v9 = [v8 mapView:self viewForAnnotation:v5];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (BOOL)annotationManager:(id)a3 canSelectAnnotationRepresentation:(id)a4
{
  return 1;
}

- (BOOL)annotationContainerShouldAlignToPixels:(id)a3
{
  return 1;
}

- (BOOL)annotationContainerIsRotated:(id)a3
{
  BOOL v3 = [(MKMapSnapshotOptions *)self->_snapshotOptions camera];
  [v3 heading];
  BOOL v5 = v4 != 0.0;

  return v5;
}

- (id)annotationContainer:(id)a3 requestAddingClusterForAnnotationViews:(id)a4
{
  return 0;
}

- (double)annotationContainer:(id)a3 pinDropDistanceForCoordinate:(CLLocationCoordinate2D)a4 maxDistance:(double *)a5
{
  -[_MKStaticMapView convertCoordinate:toPointToView:](self, "convertCoordinate:toPointToView:", self, a4.latitude, a4.longitude);
  double v8 = v7;
  if (a5)
  {
    [(_MKStaticMapView *)self bounds];
    *(void *)a5 = v9;
  }
  return v8;
}

- (CGRect)visibleRectInView:(id)a3
{
  id v4 = a3;
  [(_MKStaticMapView *)self bounds];
  -[_MKStaticMapView convertRect:toView:](self, "convertRect:toView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)annotationContainer:(id)a3 isAnnotationView:(id)a4 validForDisplayAtPoint:(CGPoint)a5
{
  return fabs(a5.x) != INFINITY && fabs(a5.y) != INFINITY;
}

- (NSArray)mapItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(MKMapSnapshotOptions *)self->_snapshotOptions _customFeatureAnnotations];
  double v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v6 = [(MKMapSnapshotOptions *)self->_snapshotOptions _customFeatureAnnotations];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v12 = [(NSMapTable *)self->_mapItemCustomFeaturesToMapItems objectForKey:v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  double v13 = (void *)[v5 copy];

  return (NSArray *)v13;
}

- (void)addMapItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MKMapSnapshotOptions *)self->_snapshotOptions _customFeatureAnnotations];
  double v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  id v18 = v7;

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = [(NSMapTable *)self->_mapItemsToMapItemCustomFeatures objectForKey:v14];

        if (!v15)
        {
          long long v16 = [[_MKMapItemCustomFeature alloc] initWithMapItem:v14];
          [(NSMapTable *)self->_mapItemCustomFeaturesToMapItems setObject:v14 forKey:v16];
          [(NSMapTable *)self->_mapItemsToMapItemCustomFeatures setObject:v16 forKey:v14];
          [v8 addObject:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  if ([v8 count])
  {
    long long v17 = (void *)[v18 mutableCopy];
    [v17 addObjectsFromArray:v8];
    [(MKMapSnapshotOptions *)self->_snapshotOptions _setCustomFeatureAnnotations:v17];
    [(MKMapSnapshotOptions *)self->_snapshotOptions _setSearchResultsType:1];
    [(_MKStaticMapView *)self _updateSnapshot:1];
  }
}

- (void)removeMapItems:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MKMapSnapshotOptions *)self->_snapshotOptions _customFeatureAnnotations];
  double v6 = (void *)v5;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  id v17 = v7;

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [(NSMapTable *)self->_mapItemsToMapItemCustomFeatures objectForKey:v13];
        if (v14)
        {
          [(NSMapTable *)self->_mapItemCustomFeaturesToMapItems removeObjectForKey:v14];
          [(NSMapTable *)self->_mapItemsToMapItemCustomFeatures removeObjectForKey:v13];
          [v8 addObject:v14];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if ([v8 count])
  {
    long long v15 = (void *)[v17 mutableCopy];
    [v15 removeObjectsInArray:v8];
    [(MKMapSnapshotOptions *)self->_snapshotOptions _setCustomFeatureAnnotations:v15];
    long long v16 = [(_MKStaticMapView *)self mapItems];
    -[MKMapSnapshotOptions _setSearchResultsType:](self->_snapshotOptions, "_setSearchResultsType:", [v16 count] != 0);

    [(_MKStaticMapView *)self _updateSnapshot:1];
  }
}

- (void)deselectMapItem:(id)a3
{
  id v4 = [(NSMapTable *)self->_mapItemsToMapItemCustomFeatures objectForKey:a3];
  if (v4)
  {
    id v5 = v4;
    [v4 deselect];
    [(_MKStaticMapView *)self _updateSnapshot:1];
    id v4 = v5;
  }
}

- (void)selectMapItem:(id)a3
{
  id v4 = [(NSMapTable *)self->_mapItemsToMapItemCustomFeatures objectForKey:a3];
  if (v4)
  {
    id v5 = v4;
    [v4 select];
    [(_MKStaticMapView *)self _updateSnapshot:1];
    id v4 = v5;
  }
}

- (_MKStaticMapViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MKStaticMapViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MKMapConfiguration)preferredConfiguration
{
  return self->_preferredConfiguration;
}

- (BOOL)honorsLayoutMargins
{
  return self->_honorsLayoutMargins;
}

- (void)setHonorsLayoutMargins:(BOOL)a3
{
  self->_honorsLayoutMargins = a3;
}

- (BOOL)canShowGrid
{
  return self->_canShowGrid;
}

- (void)setCanShowGrid:(BOOL)a3
{
  self->_canShowGrid = a3;
}

- (BOOL)showsUserLocation
{
  return self->_showsUserLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentUpdateAddedAnnotations, 0);
  objc_storeStrong((id *)&self->_userLocationView, 0);
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_mapItemsToMapItemCustomFeatures, 0);
  objc_storeStrong((id *)&self->_mapItemCustomFeaturesToMapItems, 0);
  objc_storeStrong((id *)&self->_overlaysToRenderers, 0);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_overlays[i], 0);
  objc_storeStrong((id *)&self->_annotationContainer, 0);
  objc_storeStrong((id *)&self->_annotationManager, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_gridSnapshot, 0);
  objc_storeStrong((id *)&self->_currentSnapshotter, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_snapshotOptions, 0);
}

@end