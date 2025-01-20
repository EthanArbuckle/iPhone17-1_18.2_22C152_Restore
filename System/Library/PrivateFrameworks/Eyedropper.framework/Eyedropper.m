id EDDisplayIdentifierForWindowScene(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = [a1 screen];
  v2 = [v1 displayConfiguration];

  v3 = [v2 hardwareIdentifier];
  v4 = v3;
  if (!v3) {
    v3 = (void *)EDEmbeddedDisplayIdentifier;
  }
  v5 = v3;

  return v5;
}

void sub_237D3F01C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

double ColorMakeWithColor(void *a1)
{
  double v2 = 0.0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  [a1 getRed:&v2 green:&v3 blue:&v4 alpha:0];
  return v2;
}

double ColorCombineColors(double a1, double a2, double a3, double a4)
{
  return a1 + a4;
}

double ColorDivide(double a1, double a2, double a3, double a4)
{
  return a1 / a4;
}

BOOL ColorEqualToColor(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

BOOL ColorApproxEqualToColor(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return vabdd_f64(a1, a4) < a7 && vabdd_f64(a2, a5) < a7 && vabdd_f64(a3, a6) < a7;
}

double ColorDistanceToColor(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return sqrt((a2 - a5) * (a2 - a5) + (a1 - a4) * (a1 - a4) + (a3 - a6) * (a3 - a6));
}

uint64_t ColorUIColor(double a1, double a2, double a3)
{
  return [MEMORY[0x263F1C550] colorWithRed:a1 green:a2 blue:a3 alpha:1.0];
}

BOOL EDLensPositionIsCorner(uint64_t a1)
{
  return (unint64_t)(a1 - 5) < 4;
}

BOOL EDLensPositionIsEdge(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 8;
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t SBSGetScreenLockStatus()
{
  return MEMORY[0x270F77160]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

uint64_t _UIRenderDisplay()
{
  return MEMORY[0x270F06390]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}