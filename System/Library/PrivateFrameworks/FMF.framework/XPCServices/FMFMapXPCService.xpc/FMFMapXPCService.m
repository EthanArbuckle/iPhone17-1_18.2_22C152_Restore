void sub_100003B4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  UIImage *v7;
  id v8;
  uint64_t vars8;

  v8 = a2;
  v5 = a3;
  v6 = [v8 image];

  if (v6)
  {
    v7 = [v8 image];
    v6 = UIImagePNGRepresentation(v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003DA4(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = [v11 image];

  if (v6)
  {
    v7 = +[UIColor colorWithWhite:1.0 alpha:0.300000012];
    v8 = [v11 image];
    v9 = [v8 applyBlurWithRadius:v7 tintColor:0 saturationDeltaFactor:30.0 maskImage:1.79999995];

    if (v9)
    {
      v10 = UIImagePNGRepresentation(v9);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004160(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setupIdleTimer];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = sub_1000052D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a1[4] location];
    [v5 coordinate];
    v7 = v6;
    v8 = [a1[4] location];
    [v8 coordinate];
    uint64_t v10 = v9;
    id v11 = [a1[4] priority];
    *(_DWORD *)buf = 134284033;
    id v33 = v7;
    __int16 v34 = 2049;
    uint64_t v35 = v10;
    __int16 v36 = 2048;
    id v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing request for lat: %{private}f long: %{private}f with priority %lu", buf, 0x20u);
  }
  id v12 = a1[4];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_100004448;
  v27 = &unk_1000083A0;
  id v13 = WeakRetained;
  id v28 = v13;
  id v29 = a1[4];
  id v31 = a1[5];
  v14 = v3;
  v30 = v14;
  [v13 shiftedLocationForRequest:v12 withCompletionHandler:&v24];
  if (dispatch_semaphore_wait(v14, (dispatch_time_t)objc_msgSend(v13, "mapRenderingTimeout", v24, v25, v26, v27)))
  {
    v15 = sub_1000052D8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v13 mapRenderingTimeout];
      v17 = [a1[4] location];
      [v17 coordinate];
      uint64_t v19 = v18;
      v20 = [a1[4] location];
      [v20 coordinate];
      *(_DWORD *)buf = 134218497;
      id v33 = v16;
      __int16 v34 = 2049;
      uint64_t v35 = v19;
      __int16 v36 = 2049;
      id v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "mapImageForRequest timeout after %llu seconds for lat: %{private}f long: %{private}f", buf, 0x20u);
    }
    v22 = (void (**)(id, void, id))a1[5];
    id v23 = [objc_alloc((Class)NSError) initWithDomain:@"FMFMapXPCService" code:408 userInfo:0];
    v22[2](v22, 0, v23);
  }
}

void sub_100004448(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_1000052D8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "mapImageForRequest: Location shifted requesting snapshot", buf, 2u);
  }

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  [v3 coordinate];
  double v8 = v7;
  double v10 = v9;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004568;
  v11[3] = &unk_100008378;
  id v13 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 48);
  objc_msgSend(v5, "mapSnapshotForRequest:shiftedCoordinate:andCompletionHandler:", v6, v11, v8, v10);
}

void sub_100004568(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [v5 image];

  if (v7)
  {
    double v8 = sub_1000052D8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "mapImageForRequest data received for map snapshot", buf, 2u);
    }

    double v9 = [v5 image];
    double v7 = UIImagePNGRepresentation(v9);
  }
  double v10 = sub_1000052D8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "mapImageForRequest returning map snapshot", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000475C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004828(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004930(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004E58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100004EC0(id a1)
{
  if (!qword_10000CF80)
  {
    qword_10000CF80 = (uint64_t)objc_alloc_init((Class)FMLocationShifter);
    _objc_release_x1();
  }
}

void sub_100005054(id a1)
{
  v1 = sub_1000052D8();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 134217984;
    uint64_t v3 = 0x4072C00000000000;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "FMFMapXPCService was idle for %fs, exiting now if clean", (uint8_t *)&v2, 0xCu);
  }

  xpc_transaction_exit_clean();
}

void start()
{
  NSLog(@"FMFUIXPCService started");
  v0 = objc_alloc_init(FMFMapXPCServer);
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];
  exit(1);
}

id sub_100005240()
{
  if (qword_10000CF90 != -1) {
    dispatch_once(&qword_10000CF90, &stru_100008498);
  }
  v0 = (void *)qword_10000CF98;

  return v0;
}

void sub_100005294(id a1)
{
  qword_10000CF98 = (uint64_t)os_log_create("com.apple.icloud.fmfd", "_");

  _objc_release_x1();
}

id sub_1000052D8()
{
  if (qword_10000CFA0 != -1) {
    dispatch_once(&qword_10000CFA0, &stru_1000084B8);
  }
  v0 = (void *)qword_10000CFA8;

  return v0;
}

void sub_10000532C(id a1)
{
  qword_10000CFA8 = (uint64_t)os_log_create("com.apple.icloud.fmfd", "FMFMapXPC");

  _objc_release_x1();
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return _CGBitmapContextGetBytesPerRow(context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return _CGBitmapContextGetData(context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  return _MKCoordinateRegionMakeWithDistance(centerCoordinate, latitudinalMeters, longitudinalMeters);
}

void NSLog(NSString *format, ...)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

vImage_Error vImageBoxConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return _vImageBoxConvolve_ARGB8888(src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel_height, kernel_width, backgroundColor, flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[16], int32_t divisor, const int16_t *pre_bias, const int32_t *post_bias, vImage_Flags flags)
{
  return _vImageMatrixMultiply_ARGB8888(src, dest, matrix, divisor, pre_bias, post_bias, flags);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cachingEnabled(void *a1, const char *a2, ...)
{
  return [a1 cachingEnabled];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clearIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 clearIdleTimer];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_idleTimer(void *a1, const char *a2, ...)
{
  return [a1 idleTimer];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_isShifted(void *a1, const char *a2, ...)
{
  return [a1 isShifted];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationShifter(void *a1, const char *a2, ...)
{
  return [a1 locationShifter];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mapRenderingQueue(void *a1, const char *a2, ...)
{
  return [a1 mapRenderingQueue];
}

id objc_msgSend_mapRenderingTimeout(void *a1, const char *a2, ...)
{
  return [a1 mapRenderingTimeout];
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return [a1 pitch];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setupIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 setupIdleTimer];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_snapshotSize(void *a1, const char *a2, ...)
{
  return [a1 snapshotSize];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 verticalAccuracy];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}