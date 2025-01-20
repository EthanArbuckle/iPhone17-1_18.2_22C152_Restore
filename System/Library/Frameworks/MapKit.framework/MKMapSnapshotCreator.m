@interface MKMapSnapshotCreator
+ (BOOL)supportsSharingThumbnails;
- (MKMapSnapshotCreator)init;
- (MKMapSnapshotRequest)servingRequest;
- (id)_newSnapshotWithView:(id)a3;
- (id)recreateCurrentSnapshotWithRequester:(id)a3 context:(id)a4;
- (void)_processRequest;
- (void)_respondWithSnapshot;
- (void)createSnapShotWithCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(unint64_t)a4 size:(CGSize)a5 handler:(id)a6;
- (void)createSnapShotWithCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(unint64_t)a4 size:(CGSize)a5 requester:(id)a6 context:(id)a7;
- (void)dealloc;
- (void)flushRequestQueue;
- (void)setServingRequest:(id)a3;
@end

@implementation MKMapSnapshotCreator

+ (BOOL)supportsSharingThumbnails
{
  return [MEMORY[0x1E4FB3A38] supportsSharingThumbnails];
}

- (MKMapSnapshotCreator)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKMapSnapshotCreator;
  v2 = [(MKMapSnapshotCreator *)&v9 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    requestLock = v2->_requestLock;
    v2->_requestLock = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requests = v2->_requests;
    v2->_requests = v5;

    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [(MKMapSnapshotCreator *)self servingRequest];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)MKMapSnapshotCreator;
  [(MKMapSnapshotCreator *)&v4 dealloc];
}

- (void)_processRequest
{
  if (!self->_servingRequest)
  {
    [(NSLock *)self->_requestLock lock];
    if ([(NSMutableArray *)self->_requests count])
    {
      v3 = [(NSMutableArray *)self->_requests objectAtIndex:0];
      [(MKMapSnapshotCreator *)self setServingRequest:v3];

      [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
    }
    [(NSLock *)self->_requestLock unlock];
    objc_super v4 = [(MKMapSnapshotCreator *)self servingRequest];
    v5 = [v4 image];

    if (v5)
    {
      [(MKMapSnapshotCreator *)self _respondWithSnapshot];
      [(MKMapSnapshotCreator *)self _processRequest];
    }
    else
    {
      id v6 = [(MKMapSnapshotCreator *)self servingRequest];
      [v6 start];
    }
  }
}

- (id)_newSnapshotWithView:(id)a3
{
  id v4 = a3;
  v5 = v4;
  lastSnapshot = self->_lastSnapshot;
  if (!v4)
  {
    if (lastSnapshot)
    {
      v13 = lastSnapshot;
      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  if (!lastSnapshot) {
    goto LABEL_6;
  }
  [v4 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIImage *)self->_lastSnapshot size];
  UIGraphicsBeginImageContextWithOptions(v15, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[UIImage drawAtPoint:](self->_lastSnapshot, "drawAtPoint:", 0.0, 0.0);
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, v8, v10);
  v12 = [v5 layer];
  [v12 renderInContext:CurrentContext];

  CGContextRestoreGState(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
LABEL_7:

  return v13;
}

- (void)_respondWithSnapshot
{
  v3 = [(MKMapSnapshotCreator *)self servingRequest];
  if (v3)
  {
    id v14 = v3;
    id v4 = [v3 requester];
    if (objc_opt_respondsToSelector())
    {
      v5 = [v14 context];
      id v6 = [v4 mapSnapshotCreator:self viewForContext:v5];
    }
    else
    {
      id v6 = 0;
    }
    double v7 = [v14 image];
    lastSnapshot = self->_lastSnapshot;
    self->_lastSnapshot = v7;

    double v9 = [v14 attributionString];
    lastAttributionString = self->_lastAttributionString;
    self->_lastAttributionString = v9;

    id v11 = [(MKMapSnapshotCreator *)self _newSnapshotWithView:v6];
    v12 = self->_lastAttributionString;
    v13 = [v14 context];
    [v4 mapSnapshotCreator:self didCreateSnapshot:v11 attributionString:v12 context:v13];

    [(MKMapSnapshotCreator *)self setServingRequest:0];
    if ([(NSMutableArray *)self->_requests count]) {
      [(MKMapSnapshotCreator *)self _processRequest];
    }

    v3 = v14;
  }
}

- (void)createSnapShotWithCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(unint64_t)a4 size:(CGSize)a5 requester:(id)a6 context:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v14 = a7;
  id v15 = a6;
  v17 = objc_alloc_init(MKMapSnapshotRequest);
  -[MKMapSnapshotRequest setCoordinate:](v17, "setCoordinate:", latitude, longitude);
  [(MKMapSnapshotRequest *)v17 setRequester:v15];

  -[MKMapSnapshotRequest setSize:](v17, "setSize:", width, height);
  [(MKMapSnapshotRequest *)v17 setZoomLevel:a4];
  [(MKMapSnapshotRequest *)v17 setContext:v14];

  [(MKMapSnapshotRequest *)v17 setDelegate:self];
  [(NSLock *)self->_requestLock lock];
  [(NSMutableArray *)self->_requests addObject:v17];
  [(NSLock *)self->_requestLock unlock];
  v16 = [(MKMapSnapshotCreator *)self servingRequest];

  if (!v16) {
    [(MKMapSnapshotCreator *)self _processRequest];
  }
}

- (id)recreateCurrentSnapshotWithRequester:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    CGFloat v8 = [v6 mapSnapshotCreator:self viewForContext:v7];
  }
  else
  {
    CGFloat v8 = 0;
  }
  id v9 = [(MKMapSnapshotCreator *)self _newSnapshotWithView:v8];

  return v9;
}

- (void)flushRequestQueue
{
  v3 = [(MKMapSnapshotCreator *)self servingRequest];
  [v3 cancel];

  [(MKMapSnapshotCreator *)self setServingRequest:0];
  [(NSLock *)self->_requestLock lock];
  [(NSMutableArray *)self->_requests removeAllObjects];
  requestLock = self->_requestLock;

  [(NSLock *)requestLock unlock];
}

- (void)createSnapShotWithCoordinate:(CLLocationCoordinate2D)a3 zoomLevel:(unint64_t)a4 size:(CGSize)a5 handler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v12 = +[MKBlockBasedSnapshotRequester snapshotRequesterWitHandler:a6];
  -[MKMapSnapshotCreator createSnapShotWithCoordinate:zoomLevel:size:requester:context:](self, "createSnapShotWithCoordinate:zoomLevel:size:requester:context:", a4, v12, 0, latitude, longitude, width, height);
}

- (MKMapSnapshotRequest)servingRequest
{
  return self->_servingRequest;
}

- (void)setServingRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servingRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestLock, 0);
  objc_storeStrong((id *)&self->_lastAttributionString, 0);

  objc_storeStrong((id *)&self->_lastSnapshot, 0);
}

@end