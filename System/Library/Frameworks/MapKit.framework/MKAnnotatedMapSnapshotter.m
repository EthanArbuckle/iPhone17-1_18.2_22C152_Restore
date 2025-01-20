@interface MKAnnotatedMapSnapshotter
- (BOOL)isLoading;
- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 camera:(id)a4 mapSize:(CGSize)a5 mapType:(unint64_t)a6 useSnapshotService:(BOOL)a7;
- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 mapSize:(CGSize)a4 useSnapshotService:(BOOL)a5;
- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 region:(id *)a4 mapSize:(CGSize)a5 mapType:(unint64_t)a6 useSnapshotService:(BOOL)a7;
- (MKMapCamera)camera;
- (UITraitCollection)traitCollection;
- (void)_initSnapshotterWithMapItems;
- (void)cancel;
- (void)setTraitCollection:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)startWithQueue:(id)a3 completionHandler:(id)a4;
@end

@implementation MKAnnotatedMapSnapshotter

- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 mapSize:(CGSize)a4 useSnapshotService:(BOOL)a5
{
  return -[MKAnnotatedMapSnapshotter initWithMapItems:camera:mapSize:mapType:useSnapshotService:](self, "initWithMapItems:camera:mapSize:mapType:useSnapshotService:", a3, 0, 103, a5, a4.width, a4.height);
}

- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 camera:(id)a4 mapSize:(CGSize)a5 mapType:(unint64_t)a6 useSnapshotService:(BOOL)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v13 = a3;
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MKAnnotatedMapSnapshotter;
  v15 = [(MKAnnotatedMapSnapshotter *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    mapItems = v15->_mapItems;
    v15->_mapItems = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_camera, a4);
    v15->_region.center = (CLLocationCoordinate2D)MKCoordinateRegionInvalid;
    v15->_region.span = ($2AEA816EAF9616B0E64737FB4BB06332)unk_18BD1C248;
    v15->_mapSize.CGFloat width = width;
    v15->_mapSize.CGFloat height = height;
    v15->_mapType = a6;
    v15->_useSnapshotService = a7;
    [(MKAnnotatedMapSnapshotter *)v15 _initSnapshotterWithMapItems];
  }

  return v15;
}

- (MKAnnotatedMapSnapshotter)initWithMapItems:(id)a3 region:(id *)a4 mapSize:(CGSize)a5 mapType:(unint64_t)a6 useSnapshotService:(BOOL)a7
{
  char v11 = a6;
  CGFloat v13 = v10;
  CGFloat v14 = v9;
  double v15 = v8;
  double v16 = v7;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v20 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MKAnnotatedMapSnapshotter;
  v21 = [(MKAnnotatedMapSnapshotter *)&v25 init];
  if (v21)
  {
    uint64_t v22 = [v20 copy];
    mapItems = v21->_mapItems;
    v21->_mapItems = (NSArray *)v22;

    v21->_region.center.latitude = width;
    v21->_region.center.longitude = height;
    v21->_region.span.latitudeDelta = v16;
    v21->_region.span.longitudeDelta = v15;
    v21->_mapSize.CGFloat width = v14;
    v21->_mapSize.CGFloat height = v13;
    v21->_mapType = (unint64_t)a4;
    v21->_useSnapshotService = v11;
    [(MKAnnotatedMapSnapshotter *)v21 _initSnapshotterWithMapItems];
  }

  return v21;
}

- (void)_initSnapshotterWithMapItems
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v41 = self;
  v3 = self->_mapItems;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v44 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x1E4FB39F8]);
        [v8 _coordinate];
        double v10 = objc_msgSend(v9, "initWithCoordinate:");
        char v11 = [v8 name];
        [v10 setText:v11 locale:0];

        v12 = [v8 _styleAttributes];
        CGFloat v13 = (void *)[v12 copy];

        if (v13
          || ([MEMORY[0x1E4F645A0] markerStyleAttributes],
              CGFloat v14 = objc_claimAutoreleasedReturnValue(),
              CGFloat v13 = (void *)[v14 copy],
              v14,
              v13))
        {
          long long v47 = xmmword_18BD1B410;
          [v13 replaceAttributes:&v47 count:2];
          [v10 setStyleAttributes:v13];
        }
        double v15 = objc_alloc_init(_MKAnnotationViewCustomFeatureAnnotation);
        [v8 _coordinate];
        -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](v15, "setCoordinate:");
        [(_MKAnnotationViewCustomFeatureAnnotation *)v15 setCustomFeature:v10];
        [v42 addObject:v15];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v5);
  }

  BOOL v16 = 0;
  double longitude = v41->_region.center.longitude;
  if (longitude >= -180.0 && longitude <= 180.0)
  {
    double latitude = v41->_region.center.latitude;
    if (latitude >= -90.0 && latitude <= 90.0)
    {
      double latitudeDelta = v41->_region.span.latitudeDelta;
      double longitudeDelta = v41->_region.span.longitudeDelta;
      BOOL v21 = latitudeDelta >= 0.0;
      if (latitudeDelta > 180.0) {
        BOOL v21 = 0;
      }
      if (longitudeDelta < 0.0) {
        BOOL v21 = 0;
      }
      BOOL v16 = longitudeDelta <= 360.0 && v21;
    }
  }
  if (v41->_camera) {
    int v22 = v16;
  }
  else {
    int v22 = 1;
  }
  if (MapKitFeature_IsEnabled_SPRForMapSnapshots())
  {
    if ([(NSArray *)v41->_mapItems count] == 1) {
      int v23 = v22;
    }
    else {
      int v23 = 0;
    }
    int v24 = v23 & !v16;
  }
  else
  {
    int v24 = 0;
  }
  objc_super v25 = [(NSArray *)v41->_mapItems firstObject];
  if ([v25 _isMapItemTypeTransit])
  {

LABEL_34:
    v27 = [_MKCartographicMapConfiguration alloc];
    long long v47 = xmmword_18BD1C660;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v50 = 1;
    v28 = [(_MKCartographicMapConfiguration *)v27 initWithCartographicConfiguration:&v47];
    goto LABEL_35;
  }
  unint64_t mapType = v41->_mapType;

  if (mapType == 104) {
    goto LABEL_34;
  }
  v28 = objc_alloc_init(MKStandardMapConfiguration);
  if (v22)
  {
    if (!v24) {
      goto LABEL_35;
    }
    goto LABEL_48;
  }
  [(MKMapCamera *)v41->_camera pitch];
  if (v37 == 0.0) {
    char v38 = v24;
  }
  else {
    char v38 = 1;
  }
  if (v38) {
LABEL_48:
  }
    [(MKMapConfiguration *)v28 setElevationStyle:1];
LABEL_35:
  v29 = objc_alloc_init(MKMapSnapshotOptions);
  snapshotOptions = v41->_snapshotOptions;
  v41->_snapshotOptions = v29;

  [(MKMapSnapshotOptions *)v41->_snapshotOptions setPreferredConfiguration:v28];
  -[MKMapSnapshotOptions setSize:](v41->_snapshotOptions, "setSize:", v41->_mapSize.width, v41->_mapSize.height);
  if ((v22 & 1) == 0)
  {
    [(MKMapSnapshotOptions *)v41->_snapshotOptions setCamera:v41->_camera];
    goto LABEL_51;
  }
  if (v16)
  {
    double v31 = v41->_region.center.latitude;
    double v32 = v41->_region.center.longitude;
    double v33 = v41->_region.span.latitudeDelta;
    double v34 = v41->_region.span.longitudeDelta;
  }
  else
  {
    if (v24)
    {
      v35 = [(NSArray *)v41->_mapItems firstObject];
      v36 = +[MKMapCamera cameraLookingAtMapItem:forViewSize:allowPitch:](MKMapCamera, "cameraLookingAtMapItem:forViewSize:allowPitch:", v35, 1, v41->_mapSize.width, v41->_mapSize.height);
      [(MKMapSnapshotOptions *)v41->_snapshotOptions setCamera:v36];

      goto LABEL_51;
    }
    v55.origin.x = mapRectContainingMapItems(v41->_mapItems, v41->_mapSize.width, v41->_mapSize.height);
    *(MKCoordinateRegion *)&double v31 = MKCoordinateRegionForMapRect(v55);
  }
  -[MKMapSnapshotOptions setRegion:](v41->_snapshotOptions, "setRegion:", v31, v32, v33, v34);
LABEL_51:
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setShowsAppleLogo:0];
  v39 = [(MKAnnotatedMapSnapshotter *)v41 traitCollection];

  if (v39)
  {
    v40 = [(MKAnnotatedMapSnapshotter *)v41 traitCollection];
    [(MKMapSnapshotOptions *)v41->_snapshotOptions setTraitCollection:v40];
  }
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setRendersInBackground:1];
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setUseSnapshotService:v41->_useSnapshotService];
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setShowsVenues:1];
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setCustomFeatureAnnotations:v42];
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setSearchResultsType:1];
  [(MKMapSnapshotOptions *)v41->_snapshotOptions _setAllowsSimultaneousLightDarkSnapshots:1];
}

- (MKMapCamera)camera
{
  return [(MKMapSnapshotOptions *)self->_snapshotOptions camera];
}

- (void)setTraitCollection:(id)a3
{
  uint64_t v5 = (UITraitCollection *)a3;
  if (self->_traitCollection != v5)
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    [(MKMapSnapshotOptions *)self->_snapshotOptions setTraitCollection:v5];
  }
}

- (void)startWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  snapshotter = self->_snapshotter;
  if (!snapshotter)
  {
    id v9 = [[MKMapSnapshotter alloc] initWithOptions:self->_snapshotOptions];
    double v10 = self->_snapshotter;
    self->_snapshotter = v9;

    snapshotter = self->_snapshotter;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__MKAnnotatedMapSnapshotter_startWithQueue_completionHandler___block_invoke;
  v12[3] = &unk_1E54BBF38;
  id v13 = v7;
  id v11 = v7;
  [(MKMapSnapshotter *)snapshotter startWithQueue:v6 completionHandler:v12];
}

uint64_t __62__MKAnnotatedMapSnapshotter_startWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startWithCompletionHandler:(id)a3
{
}

- (BOOL)isLoading
{
  return [(MKMapSnapshotter *)self->_snapshotter isLoading];
}

- (void)cancel
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshotOptions, 0);
  objc_storeStrong((id *)&self->_camera, 0);

  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end