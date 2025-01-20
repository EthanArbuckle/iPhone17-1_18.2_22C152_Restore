void sub_2390FEC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __AXPIEventRepresentationFromTouches_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v33 = a3;
  id v5 = a2;
  [v33 normalizedLocation];
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc_init(MEMORY[0x263F22880]);
  objc_msgSend(v10, "setPathIndex:", objc_msgSend(v5, "unsignedIntegerValue"));
  unsigned __int8 v11 = [v5 unsignedIntegerValue];

  [v10 setPathIdentity:v11];
  double v12 = fmin(v9, 1.0);
  if (v12 >= 0.0) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  double v14 = fmin(v7, 1.0);
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = 0.0;
  }
  [*(id *)(a1 + 32) _referenceBounds];
  double v17 = v15 * v16;
  double v19 = v13 * v18;
  [*(id *)(a1 + 32) scale];
  float v21 = v20 * v17;
  double v22 = roundf(v21);
  *(float *)&double v20 = v20 * v19;
  double v23 = roundf(*(float *)&v20);
  v24 = [*(id *)(a1 + 32) currentMode];
  [v24 size];
  double v26 = v25;
  double v28 = v27;

  objc_msgSend(v10, "setPathLocation:", v22 / v26, v23 / v28);
  [v10 setTransducerType:2];
  if ((*(_DWORD *)(a1 + 48) - 1) > 1)
  {
    [v10 setPathMajorRadius:0.0];
    [v10 setPathPressure:0.0];
  }
  else
  {
    LODWORD(v29) = 1028443341;
    [v10 setPathMajorRadius:v29];
    [v33 force];
    *(float *)&double v30 = v30;
    [v10 setPathPressure:v30];
    [v33 force];
    *(float *)&double v31 = v31;
    [v10 setOrbValue:v31];
    [v33 force];
    if (v32 > 0.0) {
      [v10 setPathProximity:3];
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v10];
}

void sub_2390FF558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSiriSimpleActivationSourceClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getSiriSimpleActivationSourceClass_softClass;
  uint64_t v7 = getSiriSimpleActivationSourceClass_softClass;
  if (!getSiriSimpleActivationSourceClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getSiriSimpleActivationSourceClass_block_invoke;
    v3[3] = &unk_264D86608;
    v3[4] = &v4;
    __getSiriSimpleActivationSourceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_239100704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_239101488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2391031BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void rebootAlertCallBack(const void *a1, uint64_t a2)
{
  CFRelease(a1);
  if (!a2)
  {
    id v3 = [MEMORY[0x263F22998] server];
    [v3 rebootDevice];
  }
}

Class __getSiriSimpleActivationSourceClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!SiriActivationLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __SiriActivationLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264D86628;
    uint64_t v5 = 0;
    SiriActivationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SiriActivationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSiriSimpleActivationSourceClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SiriSimpleActivationSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSiriSimpleActivationSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SiriActivationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SiriActivationLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id AXPILocalizedString(void *a1)
{
  uint64_t v1 = AXPILocalizedString_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AXPILocalizedString_onceToken, &__block_literal_global_4);
  }
  id v3 = [(id)AXPILocalizedString_Bundle localizedStringForKey:v2 value:&stru_26EC8CDC0 table:@"AXPIStrings"];

  return v3;
}

uint64_t __AXPILocalizedString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = AXPILocalizedString_Bundle;
  AXPILocalizedString_Bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id AXPIDefaultAppearanceForDevice()
{
  if (AXPIDefaultAppearanceForDevice_onceToken != -1) {
    dispatch_once(&AXPIDefaultAppearanceForDevice_onceToken, &__block_literal_global_6);
  }
  uint64_t v0 = (void *)AXPIDefaultAppearanceForDevice_defaultAppearance;
  return v0;
}

void __AXPIDefaultAppearanceForDevice_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F22940] sharedInstance];
  int v1 = [v0 laserEnabled];

  if (v1)
  {
    uint64_t v2 = objc_opt_new();
    id v3 = (void *)AXPIDefaultAppearanceForDevice_defaultAppearance;
    AXPIDefaultAppearanceForDevice_defaultAppearance = v2;
  }
  if (!AXPIDefaultAppearanceForDevice_defaultAppearance)
  {
    AXDeviceIsPad();
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = AXPIDefaultAppearanceForDevice_defaultAppearance;
    AXPIDefaultAppearanceForDevice_defaultAppearance = v4;
    MEMORY[0x270F9A758](v4, v5);
  }
}

double AXPISystemPointerSize()
{
  _AXSPointerSizeMultiplier();
  return v0 * 19.0;
}

void sub_23910C7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _frameCenteredAroundPointForView(void *a1)
{
  id v1 = a1;
  [v1 frame];
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  CGRectGetWidth(v7);
  UIRoundToViewScale();
  double x = v8.origin.x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  CGRectGetHeight(v8);
  UIRoundToViewScale();

  return x;
}

void sub_23910E530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void __getSiriSimpleActivationSourceClass_block_invoke_cold_1()
{
}

uint64_t AXDeviceHasHomeButton()
{
  return MEMORY[0x270F09FA8]();
}

uint64_t AXDeviceHasStaccato()
{
  return MEMORY[0x270F091B8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091D8]();
}

uint64_t AXDeviceSupportsWatchRemoteScreen()
{
  return MEMORY[0x270F0A098]();
}

uint64_t AXForceTouchThreshold()
{
  return MEMORY[0x270F0A0D8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092E0]();
}

uint64_t AXLogPhysicalInteraction()
{
  return MEMORY[0x270F09350]();
}

uint64_t AXMachTimeToNanoseconds()
{
  return MEMORY[0x270F09400]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09438]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09448]();
}

uint64_t AXPerformBlockSynchronouslyOnMainThread()
{
  return MEMORY[0x270F09450]();
}

uint64_t AXSlightlyDarkerColorForColor()
{
  return MEMORY[0x270F09D68]();
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x270F0A370]();
}

uint64_t AX_CGPointGetMidpointOfAllPoints()
{
  return MEMORY[0x270F0A380]();
}

uint64_t AX_CGPointGetMidpointToPoint()
{
  return MEMORY[0x270F0A388]();
}

uint64_t AX_CGPointGetOffsetAlongVectorWithDistance()
{
  return MEMORY[0x270F0A390]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x270F0A3A8]();
}

uint64_t BKSHIDServicesGetRingerState()
{
  return MEMORY[0x270F10518]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopTimerRef CFRunLoopTimerCreateWithHandler(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, void *block)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F08](allocator, flags, order, block, fireDate, interval);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGPoint CGPointFromString(NSString *string)
{
  MEMORY[0x270F82BA0](string);
  result.CGFloat y = v2;
  result.double x = v1;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t IOHIDEventCreateScrollEvent()
{
  return MEMORY[0x270EF42C0]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x270EF43F0]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x270EF4420]();
}

uint64_t IOHIDEventSystemClientDispatchEvent()
{
  return MEMORY[0x270EF4430]();
}

uint64_t IOHIDUserDeviceCreate()
{
  return MEMORY[0x270EF46D8]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x270EF46E8]();
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x270EF5B08]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F82BC0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

uint64_t PSPointerVibrantColorMatrixForLuminance()
{
  return MEMORY[0x270F54828]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x270F82C30]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F095F0]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x270F90580]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x270F90590]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x270F905B0]();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return MEMORY[0x270F905C0]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x270F90650]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSHomeClickSpeed()
{
  return MEMORY[0x270F90858]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x270F90880]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x270F90898]();
}

uint64_t _AXSPointerShouldShowCenterPoint()
{
  return MEMORY[0x270F90940]();
}

uint64_t _AXSPointerSizeMultiplier()
{
  return MEMORY[0x270F90948]();
}

uint64_t _AXSPointerStrokeColor()
{
  return MEMORY[0x270F90950]();
}

uint64_t _AXSPointerStrokeColorValues()
{
  return MEMORY[0x270F90958]();
}

uint64_t _AXSPointerStrokeColorWidth()
{
  return MEMORY[0x270F90960]();
}

uint64_t _AXSSetShakeToUndoDisabled()
{
  return MEMORY[0x270F90A80]();
}

uint64_t _AXSSetSpeakThisEnabled()
{
  return MEMORY[0x270F90A88]();
}

uint64_t _AXSShakeToUndoDisabled()
{
  return MEMORY[0x270F90AB0]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x270F90AE0]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x270F90B30]();
}

uint64_t _AXSTwiceRemoteScreenSetPlatform()
{
  return MEMORY[0x270F90B48]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x270F90B80]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x270F90BB8]();
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  return MEMORY[0x270F90BE0]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x270F90C10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91838]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}