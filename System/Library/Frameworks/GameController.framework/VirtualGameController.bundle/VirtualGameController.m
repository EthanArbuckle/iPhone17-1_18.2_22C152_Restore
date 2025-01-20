id VirtualControllerBundle()
{
  void *v0;
  uint64_t vars8;

  if (VirtualControllerBundle_onceToken != -1) {
    dispatch_once(&VirtualControllerBundle_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)VirtualControllerBundle_Bundle;

  return v0;
}

id GCVirtualControllerBlurEffectView()
{
  id v0 = objc_alloc((Class)UIVisualEffectView);
  v1 = +[UIBlurEffect effectWithStyle:17];
  id v2 = [v0 initWithEffect:v1];

  [v2 _setGroupName:@"GCVirtualControllerBlurEffectView"];

  return v2;
}

id GCVirtualControllerSaturationVibrancyEffectView()
{
  id v0 = objc_alloc((Class)UIVisualEffectView);
  v1 = GCVirtualControllerSaturationVibrancyEffect();
  id v2 = [v0 initWithEffect:v1];

  [v2 _setGroupName:@"GCVirtualControllerSaturationVibrancyEffectView"];

  return v2;
}

id GCVirtualControllerSaturationVibrancyEffect()
{
  if (GCVirtualControllerSaturationVibrancyEffect_onceToken != -1) {
    dispatch_once(&GCVirtualControllerSaturationVibrancyEffect_onceToken, &__block_literal_global_23);
  }
  id v0 = (void *)GCVirtualControllerSaturationVibrancyEffect_sharedEffect;

  return v0;
}

id GCVirtualControllerAdditiveVibrancyEffectView()
{
  if (GCVirtualControllerAdditiveVibrancyEffectView_onceToken != -1) {
    dispatch_once(&GCVirtualControllerAdditiveVibrancyEffectView_onceToken, &__block_literal_global_26);
  }
  id v0 = objc_alloc((Class)UIVisualEffectView);
  id v1 = [v0 initWithEffect:GCVirtualControllerAdditiveVibrancyEffectView_sharedEffect];

  return v1;
}

float GCVirtualControllerVibrancyOverlayOpacity()
{
  return 0.5;
}

UIColor *GCVirtualControllerVibrancyOverlayBackgroundColor()
{
  return +[UIColor colorWithWhite:1.0 alpha:0.5];
}

CGImageRef GCVirtualControllerCreateAlphaMaskImage(void *a1, int a2)
{
  id v3 = a1;
  v4 = (CGImage *)[v3 CGImage];
  size_t Width = CGImageGetWidth(v4);
  size_t Height = CGImageGetHeight(v4);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v4);
  size_t BytesPerRow = CGImageGetBytesPerRow(v4);
  DataProvider = CGImageGetDataProvider(v4);
  CFDataRef v10 = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(v10);
  unint64_t Length = CFDataGetLength(v10);
  v13 = malloc_type_malloc(Height * Width, 0x78E1C5A4uLL);
  v14 = v13;
  if (Height)
  {
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    v17 = v13;
    do
    {
      unint64_t v18 = v15;
      v19 = v17;
      for (size_t i = Width; i; --i)
      {
        if (v18 >= Length) {
          GCVirtualControllerCreateAlphaMaskImage_cold_1();
        }
        *v19++ = BytePtr[v18 + 3] ^ (a2 << 31 >> 31);
        v18 += BitsPerPixel >> 3;
      }
      ++v16;
      v17 += Width;
      v15 += BytesPerRow;
    }
    while (v16 != Height);
  }
  CFRelease(v10);
  v21 = CGBitmapContextCreate(v14, Width, Height, 8uLL, Width, 0, 7u);
  CGImageRef Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  free(v14);

  return Image;
}

id _gc_log_virtualcontroller()
{
  if (_gc_log_virtualcontroller_onceToken != -1) {
    dispatch_once(&_gc_log_virtualcontroller_onceToken, &__block_literal_global_0);
  }
  id v0 = (void *)_gc_log_virtualcontroller_Log;

  return v0;
}

void ___gc_log_virtualcontroller_block_invoke(id a1)
{
  _gc_log_virtualcontroller_Log = (uint64_t)os_log_create("com.apple.gamecontroller", "VirtualController");

  _objc_release_x1();
}

void GCAnalyticsSendVirtualControllerConnectedEvent(void *a1, void *a2, char a3)
{
  id v5 = a1;
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3254779904;
    v6[2] = __GCAnalyticsSendVirtualControllerConnectedEvent_block_invoke;
    v6[3] = &__block_descriptor_48_e8_32n11_8_8_s0_t8w1_e30___NSObject_OS_xpc_object__8__0l;
    id v7 = a2;
    char v8 = a3;
    [v5 sendEvent:@"com.apple.GameController.VirtualController.connected" withXPCPayloadBuilder:v6];
  }
}

void sub_8D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

xpc_object_t __GCAnalyticsSendVirtualControllerConnectedEvent_block_invoke(uint64_t a1)
{
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 bundleIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[NSProcessInfo processInfo];
    id v5 = [v6 processName];
  }
  int v7 = *(unsigned __int8 *)(a1 + 40);
  unsigned __int8 v8 = [*(id *)(a1 + 32) containsObject:GCInputLeftThumbstick];
  unsigned __int8 v9 = [*(id *)(a1 + 32) containsObject:GCInputRightThumbstick];
  unsigned __int8 v10 = [*(id *)(a1 + 32) containsObject:GCInputDirectionPad];
  if ([*(id *)(a1 + 32) containsObject:GCInputLeftShoulder]) {
    unsigned __int8 v11 = 1;
  }
  else {
    unsigned __int8 v11 = [*(id *)(a1 + 32) containsObject:GCInputRightShoulder];
  }
  if ([*(id *)(a1 + 32) containsObject:GCInputLeftTrigger]) {
    unsigned __int8 v12 = 1;
  }
  else {
    unsigned __int8 v12 = [*(id *)(a1 + 32) containsObject:GCInputRightTrigger];
  }
  *(_OWORD *)keys = *(_OWORD *)off_10550;
  long long v26 = *(_OWORD *)off_10560;
  long long v27 = *(_OWORD *)off_10570;
  xpc_object_t v19 = xpc_BOOL_create(v7 != 0);
  xpc_object_t v20 = xpc_BOOL_create(v8);
  xpc_object_t v21 = xpc_BOOL_create(v9);
  xpc_object_t v22 = xpc_BOOL_create(v10);
  xpc_object_t v23 = xpc_BOOL_create(v11);
  xpc_object_t v24 = xpc_BOOL_create(v12);
  xpc_object_t v13 = xpc_dictionary_create((const char *const *)keys, &v19, 6uLL);
  if (v13)
  {
    id v14 = v5;
    unint64_t v15 = (const char *)objc_msgSend(v14, "UTF8String", v19, v20, v21, v22, v23);
    if (v15) {
      xpc_dictionary_set_string(v13, "bundleID", v15);
    }
    id v16 = v13;
  }

  for (uint64_t i = 40; i != -8; i -= 8)
  return v13;
}

id __copy_helper_block_e8_32n11_8_8_s0_t8w1(uint64_t a1, uint64_t a2)
{
  id result = *(id *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return result;
}

void __destroy_helper_block_e8_32n4_8_s0(uint64_t a1)
{
}

void sub_B628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)(&a41 + i));
  _Unwind_Resume(a1);
}

void __destructor_8_s0_s48_s56_s64(uint64_t a1)
{
  id v2 = *(void **)(a1 + 64);
}

void GCVirtualControllerCreateAlphaMaskImage_cold_1()
{
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

void CGContextRelease(CGContextRef c)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return _CGDataProviderCopyData(provider);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return _CGImageGetBytesPerRow(image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return _CGImageGetDataProvider(image);
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

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t GCCurrentProcessLinkedOnAfter()
{
  return _GCCurrentProcessLinkedOnAfter();
}

uint64_t GCExtendedGamepadInitInfoMake()
{
  return _GCExtendedGamepadInitInfoMake();
}

uint64_t GCLookupService()
{
  return _GCLookupService();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _publishCustomController()
{
  return __publishCustomController();
}

uint64_t _unpublishCustomController()
{
  return __unpublishCustomController();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
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

id objc_msgSend_actsAsTouchpad(void *a1, const char *a2, ...)
{
  return [a1 actsAsTouchpad];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttonDown(void *a1, const char *a2, ...)
{
  return [a1 buttonDown];
}

id objc_msgSend_buttonUp(void *a1, const char *a2, ...)
{
  return [a1 buttonUp];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_customImage(void *a1, const char *a2, ...)
{
  return [a1 customImage];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_initButtons(void *a1, const char *a2, ...)
{
  return [a1 initButtons];
}

id objc_msgSend_initUI(void *a1, const char *a2, ...)
{
  return [a1 initUI];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 isKeyWindow];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_lineCapStyle(void *a1, const char *a2, ...)
{
  return [a1 lineCapStyle];
}

id objc_msgSend_lineJoinStyle(void *a1, const char *a2, ...)
{
  return [a1 lineJoinStyle];
}

id objc_msgSend_lineWidth(void *a1, const char *a2, ...)
{
  return [a1 lineWidth];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_miterLimit(void *a1, const char *a2, ...)
{
  return [a1 miterLimit];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setText(void *a1, const char *a2, ...)
{
  return [a1 setText];
}

id objc_msgSend_setupActions(void *a1, const char *a2, ...)
{
  return [a1 setupActions];
}

id objc_msgSend_setupPositions(void *a1, const char *a2, ...)
{
  return [a1 setupPositions];
}

id objc_msgSend_shapeLayer(void *a1, const char *a2, ...)
{
  return [a1 shapeLayer];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_thumbstickLimit(void *a1, const char *a2, ...)
{
  return [a1 thumbstickLimit];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_usesEvenOddFillRule(void *a1, const char *a2, ...)
{
  return [a1 usesEvenOddFillRule];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}