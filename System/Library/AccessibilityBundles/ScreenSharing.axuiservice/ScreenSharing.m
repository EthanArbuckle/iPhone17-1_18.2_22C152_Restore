id sub_4814(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_4820(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

void sub_49F0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_4A08(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

id sub_4A1C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    return [v3 animateAlphaToValue:v4];
  }
  return result;
}

void sub_4B74(id a1)
{
  qword_16D28 = +[NSBundle bundleWithPath:@"/System/Library/AccessibilityBundles/ScreenSharing.axuiservice"];

  _objc_release_x1();
}

void sub_5FB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_63B0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 0.0;
  }
  else {
    double v2 = 20.0;
  }
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 20.0;
  }
  else {
    double v3 = 0.0;
  }
  int v4 = *(unsigned __int8 *)(a1 + 41);
  v5 = *(_DWORD **)(a1 + 32);
  if (*(unsigned char *)(a1 + 41)) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5[2] == 0;
  }
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) cursorView];
    [v7 frame];
    double v9 = v8 - v2;
    v10 = [*(id *)(a1 + 32) cursorView];
    [v10 frame];
    objc_msgSend(v5, "setFrameOriginWithPoint:", v9, v3 + v11);

    v5 = *(_DWORD **)(a1 + 32);
  }
  v12 = [v5 cursorView];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  char v17 = *(unsigned char *)(a1 + 40);
  double v18 = v16 + -20.0;
  double v19 = v14 + 20.0;
  if (v17) {
    double v19 = v14;
  }
  else {
    double v18 = v16;
  }
  double v20 = -v2;
  if (!v4) {
    double v20 = v2;
  }
  double v21 = -v3;
  if (!v4) {
    double v21 = v3;
  }
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_65A4;
  v26[3] = &unk_104B8;
  uint64_t v27 = *(void *)(a1 + 32);
  double v28 = v19;
  double v29 = v18;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_65B4;
  v23[3] = &unk_10508;
  v23[4] = v27;
  *(double *)&v23[5] = v14;
  *(double *)&v23[6] = v16;
  char v24 = *(unsigned char *)(a1 + 41);
  char v25 = v17;
  *(double *)&v23[7] = v20;
  *(double *)&v23[8] = v21;
  return +[UIView animateWithDuration:131074 delay:v26 usingSpringWithDamping:v23 initialSpringVelocity:0.12 options:0.0 animations:0.1 completion:0.0];
}

id sub_65A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrameOriginWithPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_65B4(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_66AC;
  v7[3] = &unk_104B8;
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_66BC;
  v3[3] = &unk_10508;
  v3[4] = v8;
  __int16 v6 = *(_WORD *)(a1 + 72);
  long long v1 = *(_OWORD *)(a1 + 56);
  long long v4 = v9;
  long long v5 = v1;
  return +[UIView animateWithDuration:196610 delay:v7 usingSpringWithDamping:v3 initialSpringVelocity:0.12 options:0.0 animations:0.85 completion:0.12];
}

id sub_66AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrameOriginWithPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

id sub_66BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 8);
  *(_DWORD *)(v2 + 8) = v3 + 1;
  if (v3 > 1)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      id result = (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
      *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_6820;
      v10[3] = &unk_104E0;
      uint64_t v11 = *(void *)(a1 + 32);
      long long v7 = *(_OWORD *)(a1 + 56);
      long long v12 = *(_OWORD *)(a1 + 40);
      long long v13 = v7;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_683C;
      v9[3] = &unk_10400;
      v9[4] = v11;
      return +[UIView animateWithDuration:65538 delay:v10 usingSpringWithDamping:v9 initialSpringVelocity:0.12 options:0.0 animations:1.0 completion:0.0];
    }
  }
  else
  {
    long long v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 73);
    return [v4 strokeCore:v5 rotate:v6];
  }
  return result;
}

id sub_6820(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrameOriginWithPoint:", *(double *)(a1 + 40) + *(double *)(a1 + 56), *(double *)(a1 + 48) - *(double *)(a1 + 64));
}

intptr_t sub_683C(uint64_t a1)
{
  intptr_t result = dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
  return result;
}

id sub_6954(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 flipped];
  id v4 = [*(id *)(a1 + 32) rotated];

  return [v2 strokeCore:v3 rotate:v4];
}

id sub_7A98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeCursorViewController];
}

id sub_8820(uint64_t a1)
{
  return [*(id *)(a1 + 32) drawFromCollectedPoints];
}

id sub_9640(uint64_t a1)
{
  if (CGSizeZero.width == *(double *)(a1 + 56) && CGSizeZero.height == *(double *)(a1 + 64))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    return objc_msgSend(v6, "setSize:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSize:");
    id v3 = *(void **)(a1 + 32);
    double v4 = *(double *)(a1 + 40);
    double v5 = *(double *)(a1 + 48);
    return objc_msgSend(v3, "setOrigin:", v4, v5);
  }
}

uint64_t sub_96BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_9AB8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v9 = v7;
  v10 = *(void **)(*(void *)(a1 + 32) + 48);
  id v16 = v9;
  if (v10)
  {
    [v10 set];
    [v16 fill];
    id v9 = v16;
  }
  double v11 = 2.0;
  if (!*(unsigned char *)(a1 + 56)) {
    double v11 = 0.0;
  }
  [v9 setLineWidth:*(double *)(a1 + 48) + v11];
  [v16 setLineCapStyle:1];
  [v16 setLineJoinStyle:1];
  long long v12 = +[UIColor whiteColor];
  [v12 set];

  [v16 stroke];
  double v14 = v16;
  if (!*(unsigned char *)(a1 + 56))
  {
    double v14 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
  }
  [v14 setLineWidth:*(double *)(a1 + 48)];
  [v14 setLineCapStyle:1];
  [v14 setLineJoinStyle:1];
  double v15 = +[UIColor redColor];
  [v15 set];

  [v14 stroke];
  if (!*(unsigned char *)(a1 + 56)) {
    *a4 = 1;
  }
}

void sub_A744()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "unable to create SSUIPerUserView", v0, 2u);
}

void sub_A78C()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "unknown cursor type", v0, 2u);
}

void sub_A7D4()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "##unknown message type", v0, 2u);
  }
  abort();
}

void sub_A828()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "## no image", v0, 2u);
}

uint64_t AX_CGPathCreateWithDataRepresentation()
{
  return _AX_CGPathCreateWithDataRepresentation();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return _CGColorCreateCopy(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return _CGPathIsEmpty(path);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

uint64_t UIAccessibilityPathForAccessibilityPath()
{
  return _UIAccessibilityPathForAccessibilityPath();
}

uint64_t UIAccessibilitySceneReferencePathToScreenPath()
{
  return _UIAccessibilitySceneReferencePathToScreenPath();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t random(void)
{
  return _random();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__removeCursorViewController(void *a1, const char *a2, ...)
{
  return [a1 _removeCursorViewController];
}

id objc_msgSend__retrievePathBezierPaths(void *a1, const char *a2, ...)
{
  return [a1 _retrievePathBezierPaths];
}

id objc_msgSend__updateCursorPath(void *a1, const char *a2, ...)
{
  return [a1 _updateCursorPath];
}

id objc_msgSend_allDrawingPoints(void *a1, const char *a2, ...)
{
  return [a1 allDrawingPoints];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_annotationHiddenByLocalUser(void *a1, const char *a2, ...)
{
  return [a1 annotationHiddenByLocalUser];
}

id objc_msgSend_annotationInfo(void *a1, const char *a2, ...)
{
  return [a1 annotationInfo];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAnimationsEnabled];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_arrowImage(void *a1, const char *a2, ...)
{
  return [a1 arrowImage];
}

id objc_msgSend_assistModeViews(void *a1, const char *a2, ...)
{
  return [a1 assistModeViews];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearUserData(void *a1, const char *a2, ...)
{
  return [a1 clearUserData];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentArrowImage(void *a1, const char *a2, ...)
{
  return [a1 currentArrowImage];
}

id objc_msgSend_currentColor(void *a1, const char *a2, ...)
{
  return [a1 currentColor];
}

id objc_msgSend_currentView(void *a1, const char *a2, ...)
{
  return [a1 currentView];
}

id objc_msgSend_cursorHidden(void *a1, const char *a2, ...)
{
  return [a1 cursorHidden];
}

id objc_msgSend_cursorView(void *a1, const char *a2, ...)
{
  return [a1 cursorView];
}

id objc_msgSend_cursorViewController(void *a1, const char *a2, ...)
{
  return [a1 cursorViewController];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return [a1 defaultParagraphStyle];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doneAssisting(void *a1, const char *a2, ...)
{
  return [a1 doneAssisting];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downArrowImage(void *a1, const char *a2, ...)
{
  return [a1 downArrowImage];
}

id objc_msgSend_drawCompletedPath(void *a1, const char *a2, ...)
{
  return [a1 drawCompletedPath];
}

id objc_msgSend_drawFromCollectedPoints(void *a1, const char *a2, ...)
{
  return [a1 drawFromCollectedPoints];
}

id objc_msgSend_drawingPoints(void *a1, const char *a2, ...)
{
  return [a1 drawingPoints];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_finalDrawingPoints(void *a1, const char *a2, ...)
{
  return [a1 finalDrawingPoints];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flipped(void *a1, const char *a2, ...)
{
  return [a1 flipped];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_handleHideAllPointers(void *a1, const char *a2, ...)
{
  return [a1 handleHideAllPointers];
}

id objc_msgSend_handleShowAllPointers(void *a1, const char *a2, ...)
{
  return [a1 handleShowAllPointers];
}

id objc_msgSend_hideAllPointers(void *a1, const char *a2, ...)
{
  return [a1 hideAllPointers];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_incomingFlags(void *a1, const char *a2, ...)
{
  return [a1 incomingFlags];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_largeCursorEnabled(void *a1, const char *a2, ...)
{
  return [a1 largeCursorEnabled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_leftarrowImage(void *a1, const char *a2, ...)
{
  return [a1 leftarrowImage];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return [a1 lineWidth];
}

id objc_msgSend_liveUpdate(void *a1, const char *a2, ...)
{
  return [a1 liveUpdate];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_perUserView(void *a1, const char *a2, ...)
{
  return [a1 perUserView];
}

id objc_msgSend_rawBitmapByteCount(void *a1, const char *a2, ...)
{
  return [a1 rawBitmapByteCount];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_rotated(void *a1, const char *a2, ...)
{
  return [a1 rotated];
}

id objc_msgSend_savedCursorFrame(void *a1, const char *a2, ...)
{
  return [a1 savedCursorFrame];
}

id objc_msgSend_serviceBundle(void *a1, const char *a2, ...)
{
  return [a1 serviceBundle];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_showAllPointers(void *a1, const char *a2, ...)
{
  return [a1 showAllPointers];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_slateView(void *a1, const char *a2, ...)
{
  return [a1 slateView];
}

id objc_msgSend_startPeriodicUpdate(void *a1, const char *a2, ...)
{
  return [a1 startPeriodicUpdate];
}

id objc_msgSend_stopPeriodicUpdate(void *a1, const char *a2, ...)
{
  return [a1 stopPeriodicUpdate];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_tearDownViews(void *a1, const char *a2, ...)
{
  return [a1 tearDownViews];
}

id objc_msgSend_textStorage(void *a1, const char *a2, ...)
{
  return [a1 textStorage];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return [a1 textView];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_upArrowImage(void *a1, const char *a2, ...)
{
  return [a1 upArrowImage];
}

id objc_msgSend_updateTimer(void *a1, const char *a2, ...)
{
  return [a1 updateTimer];
}

id objc_msgSend_userCursorImage(void *a1, const char *a2, ...)
{
  return [a1 userCursorImage];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_wipeSlate(void *a1, const char *a2, ...)
{
  return [a1 wipeSlate];
}

id objc_msgSend_wipeSlateCore(void *a1, const char *a2, ...)
{
  return [a1 wipeSlateCore];
}