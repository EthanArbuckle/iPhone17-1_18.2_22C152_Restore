@interface MKMapSnapshotRequest
- (CGSize)size;
- (CLLocationCoordinate2D)coordinate;
- (MKMapSnapshotCreator)delegate;
- (NSString)attributionString;
- (UIImage)image;
- (id)context;
- (id)description;
- (id)requester;
- (unint64_t)zoomLevel;
- (void)cancel;
- (void)setAttributionString:(id)a3;
- (void)setContext:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDelegate:(id)a3;
- (void)setRequester:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setZoomLevel:(unint64_t)a3;
- (void)start;
@end

@implementation MKMapSnapshotRequest

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MKMapSnapshotRequest;
  v4 = [(MKMapSnapshotRequest *)&v10 description];
  v5 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_coordinate.latitude, *(void *)&self->_coordinate.longitude];
  unint64_t zoomLevel = self->_zoomLevel;
  v7 = NSStringFromCGSize(self->_size);
  v8 = [v3 stringWithFormat:@"%@ c:%@ zoom:%lu size:%@", v4, v5, zoomLevel, v7];

  return v8;
}

- (void)start
{
  snapshotCreator = self->_snapshotCreator;
  if (snapshotCreator)
  {
    self->_snapshotCreator = 0;
  }
  v4 = objc_msgSend(MEMORY[0x1E4F64700], "_mapkit_mapRegionForCoordinateRegion:", MKCoordinateRegionMakeWithZoomLevel(self->_coordinate.latitude, self->_coordinate.longitude, (double)self->_zoomLevel, self->_size.width, self->_size.height));
  v5 = +[MKSystemController sharedInstance];
  if ([v5 isHiDPI]) {
    double v6 = 2.0;
  }
  else {
    double v6 = 1.0;
  }

  v7 = MKGetSnapshotLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = objc_alloc(MEMORY[0x1E4FB3A38]);
  objc_super v10 = (VKMapSnapshotCreator *)objc_msgSend(v9, "initWithSize:scale:homeQueue:signpostId:mapType:mapDisplayStyles:mapDisplayStylesCount:auditToken:", MEMORY[0x1E4F14428], v8, 0, 0, 0, 0, self->_size.width, self->_size.height, v6);
  v11 = self->_snapshotCreator;
  self->_snapshotCreator = v10;

  [(VKMapSnapshotCreator *)self->_snapshotCreator setMapType:0];
  [(VKMapSnapshotCreator *)self->_snapshotCreator setMapRegion:v4 pitch:0.0 yaw:0.0];
  v12 = self->_snapshotCreator;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__MKMapSnapshotRequest_start__block_invoke;
  v13[3] = &unk_1E54B90D8;
  v13[4] = self;
  *(double *)&v13[5] = v6;
  [(VKMapSnapshotCreator *)v12 renderSnapshot:v13];
}

void __29__MKMapSnapshotRequest_start__block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__MKMapSnapshotRequest_start__block_invoke_2;
  v4[3] = &unk_1E54B90B0;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = *(void *)(a1 + 40);
  [a2 enumerateImagesWithBlock:v4];
  [*(id *)(a1 + 32) setAttributionString:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained _respondWithSnapshot];
}

void __29__MKMapSnapshotRequest_start__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(void *)(*(void *)(a1 + 32) + 64))
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:a3 scale:0 orientation:*(double *)(a1 + 40)];
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;
  }
}

- (void)cancel
{
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (unint64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(unint64_t)a3
{
  self->_unint64_t zoomLevel = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (MKMapSnapshotCreator)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKMapSnapshotCreator *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)attributionString
{
  return self->_attributionString;
}

- (void)setAttributionString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCreator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributionString, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_context, 0);

  objc_storeStrong(&self->_requester, 0);
}

@end