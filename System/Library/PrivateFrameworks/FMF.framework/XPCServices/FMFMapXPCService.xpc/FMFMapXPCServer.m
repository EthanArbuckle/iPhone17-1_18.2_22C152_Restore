@interface FMFMapXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CGSize)snapshotSize;
- (FMDispatchTimer)idleTimer;
- (FMFMapXPCServer)init;
- (NSOperationQueue)mapRenderingQueue;
- (OS_dispatch_queue)snapshotterQueue;
- (double)screenScale;
- (id)locationShifter;
- (unint64_t)mapRenderingTimeout;
- (void)clearIdleTimer;
- (void)dealloc;
- (void)gridImageForScreenRatio:(double)a3 andCompletion:(id)a4;
- (void)gridImageForWidth:(double)a3 height:(double)a4 andCompletion:(id)a5;
- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 screenRatio:(double)a7 andCompletion:(id)a8;
- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 andCompletion:(id)a9;
- (void)mapImageForRequest:(id)a3 andCompletion:(id)a4;
- (void)mapSnapshotForRequest:(id)a3 shiftedCoordinate:(CLLocationCoordinate2D)a4 andCompletionHandler:(id)a5;
- (void)noLocationImageForScreenRatio:(double)a3 andCompletion:(id)a4;
- (void)noLocationImageForWidth:(double)a3 height:(double)a4 andCompletion:(id)a5;
- (void)setIdleTimer:(id)a3;
- (void)setMapRenderingQueue:(id)a3;
- (void)setScreenScale:(double)a3;
- (void)setSnapshotterQueue:(id)a3;
- (void)setupIdleTimer;
- (void)shiftedLocationForRequest:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation FMFMapXPCServer

- (FMFMapXPCServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)FMFMapXPCServer;
  v2 = [(FMFMapXPCServer *)&v9 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(FMFMapXPCServer *)v2 setMapRenderingQueue:v3];

    v4 = [(FMFMapXPCServer *)v2 mapRenderingQueue];
    [v4 setQualityOfService:25];

    v5 = [(FMFMapXPCServer *)v2 mapRenderingQueue];
    [v5 setMaxConcurrentOperationCount:1];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.icloud.FMF.FMFMapXPCService.snapshotterqueue", 0);
    [(FMFMapXPCServer *)v2 setSnapshotterQueue:v6];

    v7 = +[UIScreen mainScreen];
    [v7 scale];
    -[FMFMapXPCServer setScreenScale:](v2, "setScreenScale:");
  }
  return v2;
}

- (void)dealloc
{
  [(FMFMapXPCServer *)self clearIdleTimer];
  v3.receiver = self;
  v3.super_class = (Class)FMFMapXPCServer;
  [(FMFMapXPCServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = [v5 valueForEntitlement:@"com.apple.icloud.fmf.FMFMapXPCService.access"];
  if ([v6 BOOLValue])
  {

LABEL_4:
    objc_super v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FMFMapXPCInterface];
    [v5 setExportedInterface:v9];

    [v5 setExportedObject:self];
    [v5 resume];
    v10 = sub_1000052D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New connection is received allowing client", buf, 2u);
    }
    BOOL v11 = 1;
    goto LABEL_10;
  }
  v7 = [v5 valueForEntitlement:@"com.apple.icloud.FMF.FMFMapXPCService.access"];
  unsigned int v8 = [v7 BOOLValue];

  if (v8) {
    goto LABEL_4;
  }
  v10 = sub_1000052D8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New connection declined, missing entitlement com.apple.icloud.FMF.FMFMapXPCService.access", v13, 2u);
  }
  BOOL v11 = 0;
LABEL_10:

  return v11;
}

- (void)gridImageForWidth:(double)a3 height:(double)a4 andCompletion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    objc_super v9 = objc_opt_new();
    objc_msgSend(v9, "setMapRect:", MKMapRectWorld.origin.x, MKMapRectWorld.origin.y, MKMapRectWorld.size.width, MKMapRectWorld.size.height);
    objc_msgSend(v9, "setSize:", a3, a4);
    [(FMFMapXPCServer *)self screenScale];
    objc_msgSend(v9, "setScale:");
    [v9 setMapType:105];
    id v10 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v9];
    BOOL v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mobileme.fmf1.gridmaprendering", v11);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100003B4C;
    v13[3] = &unk_100008350;
    id v14 = v8;
    [v10 startWithQueue:v12 completionHandler:v13];
  }
}

- (void)noLocationImageForWidth:(double)a3 height:(double)a4 andCompletion:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = [objc_alloc((Class)CLLocation) initWithLatitude:37.331686 longitude:-122.030656];
    id v10 = objc_opt_new();
    [v9 coordinate];
    BOOL v11 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:");
    [v10 setCamera:v11];

    objc_msgSend(v10, "setSize:", a3, a4);
    [(FMFMapXPCServer *)self screenScale];
    objc_msgSend(v10, "setScale:");
    id v12 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v10];
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mobileme.fmf1.nolocationimagerendering", v13);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100003DA4;
    v15[3] = &unk_100008350;
    id v16 = v8;
    [v12 startWithQueue:v14 completionHandler:v15];
  }
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 andCompletion:(id)a9
{
  BOOL v14 = a4;
  id v16 = a3;
  id v17 = a9;
  v18 = sub_1000052D8();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received mapImageForLocation request", v20, 2u);
  }

  if (v17)
  {
    v19 = [[FMFMapImageRequest alloc] initWithLocation:v16 isShifted:v14 altitude:0 pitch:a5 width:a6 height:a7 andCachingEnabled:a8];
    [(FMFMapXPCServer *)self mapImageForRequest:v19 andCompletion:v17];
  }
}

- (void)mapImageForRequest:(id)a3 andCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000052D8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received mapImageForRequest request", (uint8_t *)buf, 2u);
  }

  if (v7)
  {
    objc_initWeak(buf, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004160;
    v12[3] = &unk_1000083C8;
    objc_copyWeak(&v15, buf);
    id v9 = v6;
    id v13 = v9;
    id v14 = v7;
    id v10 = +[NSBlockOperation blockOperationWithBlock:v12];
    objc_msgSend(v10, "setQueuePriority:", objc_msgSend(v9, "priority"));
    BOOL v11 = [(FMFMapXPCServer *)self mapRenderingQueue];
    [v11 addOperation:v10];

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

- (void)gridImageForScreenRatio:(double)a3 andCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    [(FMFMapXPCServer *)self snapshotSize];
    double v8 = v7;
    double v9 = v7 * a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000475C;
    v10[3] = &unk_1000083F0;
    id v11 = v6;
    [(FMFMapXPCServer *)self gridImageForWidth:v10 height:v8 andCompletion:v9];
  }
}

- (void)noLocationImageForScreenRatio:(double)a3 andCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    [(FMFMapXPCServer *)self snapshotSize];
    double v8 = v7;
    double v9 = v7 * a3;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004828;
    v10[3] = &unk_1000083F0;
    id v11 = v6;
    [(FMFMapXPCServer *)self noLocationImageForWidth:v10 height:v8 andCompletion:v9];
  }
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 screenRatio:(double)a7 andCompletion:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  if (v14)
  {
    id v15 = a3;
    [(FMFMapXPCServer *)self snapshotSize];
    double v17 = v16;
    double v18 = v16 * a7;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100004930;
    v19[3] = &unk_1000083F0;
    id v20 = v14;
    [(FMFMapXPCServer *)self mapImageForLocation:v15 isShifted:v11 altitude:v19 pitch:a5 width:a6 height:v17 andCompletion:v18];
  }
}

- (CGSize)snapshotSize
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  uint64_t v4 = v3;
  double v6 = v5;
  double v7 = [v2 traitCollection];
  double v8 = +[UITraitCollection traitCollectionWithUserInterfaceIdiom:1];
  unsigned int v9 = [v7 containsTraitsInCollection:v8];

  if (v9)
  {
    id v10 = sub_1000052D8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "resizing snapshot width", (uint8_t *)v13, 2u);
    }

    *(double *)&uint64_t v4 = 556.0;
  }

  double v11 = *(double *)&v4;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)mapSnapshotForRequest:(id)a3 shiftedCoordinate:(CLLocationCoordinate2D)a4 andCompletionHandler:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v9 = a3;
  id v10 = a5;
  double v11 = objc_opt_new();
  [v9 radius];
  double v13 = v12;
  id v14 = sub_1000052D8();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13 == 0.0)
  {
    if (v15)
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "mapSnapshotForRequest using altitude.", v32, 2u);
    }

    [v9 altitude];
    double v21 = v20;
    [v9 pitch];
    *(float *)&double v22 = v22;
    v23 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", latitude, longitude, v21, *(float *)&v22, 0.0);
    [v11 setCamera:v23];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "mapSnapshotForRequest using radius.", buf, 2u);
    }

    [v9 radius];
    CLLocationDistance v17 = v16 + v16;
    [v9 radius];
    CLLocationDistance v19 = v18 + v18;
    v34.double latitude = latitude;
    v34.double longitude = longitude;
    MKCoordinateRegion v35 = MKCoordinateRegionMakeWithDistance(v34, v17, v19);
    objc_msgSend(v11, "setRegion:", v35.center.latitude, v35.center.longitude, v35.span.latitudeDelta, v35.span.longitudeDelta);
  }
  [v9 width];
  double v25 = v24;
  [v9 height];
  objc_msgSend(v11, "setSize:", v25, v26);
  [(FMFMapXPCServer *)self screenScale];
  objc_msgSend(v11, "setScale:");
  id v27 = [objc_alloc((Class)MKMapSnapshotter) initWithOptions:v11];
  v28 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v29 = dispatch_queue_create("com.apple.mobileme.fmf1.mapimagerendering", v28);
  v30 = sub_1000052D8();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "mapSnapshotForRequest starting map snapshot", v31, 2u);
  }

  [v27 startWithQueue:v29 completionHandler:v10];
}

- (void)shiftedLocationForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)FMLocationShifterItem);
  id v9 = [v7 location];
  [v9 coordinate];
  double v11 = v10;
  double v13 = v12;
  id v14 = [v7 location];
  [v14 verticalAccuracy];
  double v16 = v15;
  CLLocationDistance v17 = [v7 location];
  double v18 = [v17 timestamp];
  id v19 = objc_msgSend(v8, "initWithCoordinate:accuracy:timestamp:context:", v18, self, v11, v13, v16);

  LODWORD(v9) = [v7 isShifted];
  if (v9)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100004E58;
    v21[3] = &unk_100008418;
    id v23 = v6;
    id v22 = v19;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
  }
  else
  {
    double v20 = [(FMFMapXPCServer *)self locationShifter];
    [v20 shiftLocation:v19 withCompletionHandler:v6 callbackQueue:&_dispatch_main_q];
  }
}

- (id)locationShifter
{
  if (qword_10000CF88 != -1) {
    dispatch_once(&qword_10000CF88, &stru_100008458);
  }
  v2 = (void *)qword_10000CF80;

  return v2;
}

- (unint64_t)mapRenderingTimeout
{
  return dispatch_time(0, 60000000000);
}

- (void)setupIdleTimer
{
  [(FMFMapXPCServer *)self clearIdleTimer];
  id v3 = objc_alloc((Class)FMDispatchTimer);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.mobileme.fmf1.idleExit", 0);
  id v5 = [v3 initWithQueue:v4 timeout:&stru_100008478 completion:300.0];
  [(FMFMapXPCServer *)self setIdleTimer:v5];

  id v6 = [(FMFMapXPCServer *)self idleTimer];
  [v6 start];

  id v7 = sub_1000052D8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = 0x4072C00000000000;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFMapXPCService idleTimer set for %fs", (uint8_t *)&v8, 0xCu);
  }
}

- (void)clearIdleTimer
{
  id v3 = [(FMFMapXPCServer *)self idleTimer];
  [v3 cancel];

  [(FMFMapXPCServer *)self setIdleTimer:0];
}

- (NSOperationQueue)mapRenderingQueue
{
  return self->_mapRenderingQueue;
}

- (void)setMapRenderingQueue:(id)a3
{
}

- (OS_dispatch_queue)snapshotterQueue
{
  return self->_snapshotterQueue;
}

- (void)setSnapshotterQueue:(id)a3
{
}

- (FMDispatchTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_snapshotterQueue, 0);

  objc_storeStrong((id *)&self->_mapRenderingQueue, 0);
}

@end