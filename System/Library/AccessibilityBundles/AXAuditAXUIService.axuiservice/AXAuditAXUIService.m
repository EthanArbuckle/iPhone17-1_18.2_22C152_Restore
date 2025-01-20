void sub_4448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4460(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4470(uint64_t a1)
{
}

id sub_4478(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNeedsDisplay];
}

id sub_4710(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_47A8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _cachedAlpha];

  return objc_msgSend(v1, "setAlpha:");
}

void sub_4E2C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  [*(id *)(a1 + 32) set];
  [v10 fill];
  double v7 = 2.0;
  if (!*(unsigned char *)(a1 + 72)) {
    double v7 = 0.0;
  }
  [v10 setLineWidth:*(double *)(a1 + 64) + v7];
  [v10 setLineCapStyle:1];
  [v10 setLineJoinStyle:1];
  v8 = [*(id *)(a1 + 40) _outlineColor];
  [v8 set];

  [v10 stroke];
  v9 = v10;
  if (!*(unsigned char *)(a1 + 72))
  {
    v9 = [*(id *)(a1 + 48) objectAtIndex:a3 + 1];
  }
  [v9 setLineWidth:*(double *)(a1 + 64)];
  [v9 setLineCapStyle:1];
  [v9 setLineJoinStyle:1];
  [*(id *)(a1 + 56) set];
  [v9 stroke];
  if (!*(unsigned char *)(a1 + 72)) {
    *a4 = 1;
  }
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

uint64_t UIAccessibilityPathForAccessibilityPath()
{
  return _UIAccessibilityPathForAccessibilityPath();
}

uint64_t UIAccessibilitySceneReferencePathToScreenPath()
{
  return _UIAccessibilitySceneReferencePathToScreenPath();
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

void abort(void)
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__cachedAlpha(void *a1, const char *a2, ...)
{
  return [a1 _cachedAlpha];
}

id objc_msgSend__cursorFrame(void *a1, const char *a2, ...)
{
  return [a1 _cursorFrame];
}

id objc_msgSend__highlightStyle(void *a1, const char *a2, ...)
{
  return [a1 _highlightStyle];
}

id objc_msgSend__isHidden(void *a1, const char *a2, ...)
{
  return [a1 _isHidden];
}

id objc_msgSend__outlineColor(void *a1, const char *a2, ...)
{
  return [a1 _outlineColor];
}

id objc_msgSend__removeCursorViewController(void *a1, const char *a2, ...)
{
  return [a1 _removeCursorViewController];
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

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cursorFrame(void *a1, const char *a2, ...)
{
  return [a1 cursorFrame];
}

id objc_msgSend_cursorPath(void *a1, const char *a2, ...)
{
  return [a1 cursorPath];
}

id objc_msgSend_cursorView(void *a1, const char *a2, ...)
{
  return [a1 cursorView];
}

id objc_msgSend_cursorViewController(void *a1, const char *a2, ...)
{
  return [a1 cursorViewController];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_highlightStyle(void *a1, const char *a2, ...)
{
  return [a1 highlightStyle];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_largeCursorEnabled(void *a1, const char *a2, ...)
{
  return [a1 largeCursorEnabled];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return [a1 lineWidth];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return [a1 sharedDisplayManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedTheme(void *a1, const char *a2, ...)
{
  return [a1 sharedTheme];
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return [a1 stroke];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_voiceOverLargeCursorEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverLargeCursorEnabled];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}