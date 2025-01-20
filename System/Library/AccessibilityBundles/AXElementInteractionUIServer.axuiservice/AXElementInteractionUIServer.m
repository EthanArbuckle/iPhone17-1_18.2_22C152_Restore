id sub_1760(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_17F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(*(void *)(a1 + 32) + 8)];
}

void sub_1CC0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v8 = *(void **)(*(void *)(a1 + 32) + 32);
  id v13 = v7;
  if (v8)
  {
    [v8 set];
    [v13 fill];
    id v7 = v13;
  }
  double v9 = 2.0;
  if (!*(unsigned char *)(a1 + 56)) {
    double v9 = 0.0;
  }
  [v7 setLineWidth:*(double *)(a1 + 48) + v9];
  [v13 setLineCapStyle:1];
  [v13 setLineJoinStyle:1];
  v10 = +[UIColor whiteColor];
  [v10 set];

  [v13 stroke];
  v11 = v13;
  if (!*(unsigned char *)(a1 + 56))
  {
    v11 = [*(id *)(a1 + 40) objectAtIndex:a3 + 1];
  }
  [v11 setLineWidth:*(double *)(a1 + 48)];
  [v11 setLineCapStyle:1];
  [v11 setLineJoinStyle:1];
  v12 = +[UIColor blackColor];
  [v12 set];

  [v11 stroke];
  if (!*(unsigned char *)(a1 + 56)) {
    *a4 = 1;
  }
}

void sub_1EDC(id a1)
{
  qword_8C50 = objc_alloc_init(AXElementInteractionUIServer);

  _objc_release_x1();
}

uint64_t AXDeviceGetMainScreenPixelBounds()
{
  return _AXDeviceGetMainScreenPixelBounds();
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

void NSLog(NSString *format, ...)
{
}

uint64_t UIAccessibilityPathForAccessibilityPath()
{
  return _UIAccessibilityPathForAccessibilityPath();
}

uint64_t UIAccessibilitySceneReferencePathToScreenPath()
{
  return _UIAccessibilitySceneReferencePathToScreenPath();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__retrievePathBezierPaths(void *a1, const char *a2, ...)
{
  return [a1 _retrievePathBezierPaths];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAnimationsEnabled];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_cursorView(void *a1, const char *a2, ...)
{
  return [a1 cursorView];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return [a1 lineWidth];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
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