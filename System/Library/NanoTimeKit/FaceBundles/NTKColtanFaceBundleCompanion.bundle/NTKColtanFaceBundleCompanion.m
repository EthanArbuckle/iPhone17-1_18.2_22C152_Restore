void sub_446C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_46F4()
{
  if (qword_16E20 != -1) {
    dispatch_once(&qword_16E20, &stru_10400);
  }
  v0 = (void *)qword_16E18;

  return v0;
}

void sub_51FC(id a1)
{
  qword_16E18 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

uint64_t sub_6AB0()
{
  qword_16E28 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_6B68(id a1)
{
  v3[0] = &off_10A08;
  v3[1] = &off_10A20;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  v2 = (void *)qword_16E48;
  qword_16E48 = v1;
}

void sub_7724(void *a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  id v17 = a1;
  unint64_t v7 = (unint64_t)[v17 threadExecutionWidth];
  if ((v7 & (v7 - 1)) != 0)
  {
    uint64_t v8 = 0;
    while (v8 != 32)
    {
      if (v7 < 1 << ++v8)
      {
        unint64_t v7 = 1 << (v8 - 1);
        goto LABEL_6;
      }
    }
  }
  do
  {
LABEL_6:
    unint64_t v9 = v7;
    unint64_t v10 = a2 / v7;
    unint64_t v11 = a2 % v7;
    v7 >>= 1;
  }
  while (v11);
  unint64_t v12 = (unint64_t)[v17 maxTotalThreadsPerThreadgroup] / v9;
  if ((v12 & (v12 - 1)) != 0)
  {
    uint64_t v13 = 0;
    while (v13 != 32)
    {
      if (v12 < 1 << ++v13)
      {
        unint64_t v12 = 1 << (v13 - 1);
        goto LABEL_12;
      }
    }
  }
  do
  {
LABEL_12:
    unint64_t v14 = v12;
    unint64_t v15 = a3 / v12;
    unint64_t v16 = a3 % v12;
    v12 >>= 1;
  }
  while (v16);
  *a4 = v9;
  a4[1] = v14;
  a4[2] = 1;
  a4[3] = v10;
  a4[4] = v15;
  a4[5] = 1;
}

double sub_82CC(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16E80);
  id WeakRetained = objc_loadWeakRetained(&qword_16E88);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_16E88);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_16E88, v1);
    qword_16E90 = (uint64_t)[v1 version];

    sub_994C(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_16E90;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16E80);
  double v9 = *(double *)&qword_16E60;

  return v9;
}

void sub_8E1C(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  v2 = [v5 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [v5 display];
    [v4 updateMonochromeColor];
  }
}

void sub_994C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  qword_16E60 = 0x3FF0000000000000;
  [v6 scaledValue:3 withOverride:133.0 forSizeClass:151.0];
  qword_16E70 = v3;
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v5 = v4;

  qword_16E68 = v5;
  qword_16E78 = 0x4010000000000000;
}

void sub_9C9C()
{
  __assert_rtn("+[NTKColtanResourceManager sharedInstanceWithPixelFormat:]", "NTKColtanResourceManager.m", 74, "((NTKColtanResourceManager*)__sharedInstance)->_pixelFormat == pixelFormat");
}

void sub_9CC8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[coltan] missing artwork: %@", (uint8_t *)&v2, 0xCu);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKScaledValueWithCompactLuxoDeviceMetrics()
{
  return _CLKScaledValueWithCompactLuxoDeviceMetrics();
}

uint64_t CLKUIConvertToRGBfFromUIColor()
{
  return _CLKUIConvertToRGBfFromUIColor();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
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

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint32_t arc4random(void)
{
  return _arc4random();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__editMode(void *a1, const char *a2, ...)
{
  return [a1 _editMode];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__loadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _loadActiveViews];
}

id objc_msgSend__loadCommonViews(void *a1, const char *a2, ...)
{
  return [a1 _loadCommonViews];
}

id objc_msgSend__unloadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadActiveViews];
}

id objc_msgSend__unloadCommonViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadCommonViews];
}

id objc_msgSend__updateFramerate(void *a1, const char *a2, ...)
{
  return [a1 _updateFramerate];
}

id objc_msgSend__updateMasking(void *a1, const char *a2, ...)
{
  return [a1 _updateMasking];
}

id objc_msgSend__updateRendererHandAngles(void *a1, const char *a2, ...)
{
  return [a1 _updateRendererHandAngles];
}

id objc_msgSend__updateShape(void *a1, const char *a2, ...)
{
  return [a1 _updateShape];
}

id objc_msgSend_addClient(void *a1, const char *a2, ...)
{
  return [a1 addClient];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_atlas(void *a1, const char *a2, ...)
{
  return [a1 atlas];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_blurDownsamplePipelineState(void *a1, const char *a2, ...)
{
  return [a1 blurDownsamplePipelineState];
}

id objc_msgSend_blurUpsamplePipelineState(void *a1, const char *a2, ...)
{
  return [a1 blurUpsamplePipelineState];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_centerGlowColor(void *a1, const char *a2, ...)
{
  return [a1 centerGlowColor];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_createFaceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 createFaceColorPalette];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_density(void *a1, const char *a2, ...)
{
  return [a1 density];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dialShape(void *a1, const char *a2, ...)
{
  return [a1 dialShape];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editModeTransitionFraction(void *a1, const char *a2, ...)
{
  return [a1 editModeTransitionFraction];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fragmentFunction(void *a1, const char *a2, ...)
{
  return [a1 fragmentFunction];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return [a1 fullname];
}

id objc_msgSend_handLightTexture(void *a1, const char *a2, ...)
{
  return [a1 handLightTexture];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_hourHandInnerColor(void *a1, const char *a2, ...)
{
  return [a1 hourHandInnerColor];
}

id objc_msgSend_hourHandOuterColor(void *a1, const char *a2, ...)
{
  return [a1 hourHandOuterColor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isMasking(void *a1, const char *a2, ...)
{
  return [a1 isMasking];
}

id objc_msgSend_isOpaque(void *a1, const char *a2, ...)
{
  return [a1 isOpaque];
}

id objc_msgSend_isRedGreenGold(void *a1, const char *a2, ...)
{
  return [a1 isRedGreenGold];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maskRadius(void *a1, const char *a2, ...)
{
  return [a1 maskRadius];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_minuteHandInnerColor(void *a1, const char *a2, ...)
{
  return [a1 minuteHandInnerColor];
}

id objc_msgSend_minuteHandOuterColor(void *a1, const char *a2, ...)
{
  return [a1 minuteHandOuterColor];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 newCommandQueue];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_popDebugGroup(void *a1, const char *a2, ...)
{
  return [a1 popDebugGroup];
}

id objc_msgSend_primaryComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 primaryComplicationColor];
}

id objc_msgSend_quadView(void *a1, const char *a2, ...)
{
  return [a1 quadView];
}

id objc_msgSend_quality(void *a1, const char *a2, ...)
{
  return [a1 quality];
}

id objc_msgSend_removeClient(void *a1, const char *a2, ...)
{
  return [a1 removeClient];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resetTemporalAccumulation(void *a1, const char *a2, ...)
{
  return [a1 resetTemporalAccumulation];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootContainerView(void *a1, const char *a2, ...)
{
  return [a1 rootContainerView];
}

id objc_msgSend_scenePreparationComputePipelineState(void *a1, const char *a2, ...)
{
  return [a1 scenePreparationComputePipelineState];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandColor(void *a1, const char *a2, ...)
{
  return [a1 secondHandColor];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondaryComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryComplicationColor];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_showsCanonicalContent(void *a1, const char *a2, ...)
{
  return [a1 showsCanonicalContent];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_tickColoration(void *a1, const char *a2, ...)
{
  return [a1 tickColoration];
}

id objc_msgSend_tickOpacity(void *a1, const char *a2, ...)
{
  return [a1 tickOpacity];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_unityGreenColor(void *a1, const char *a2, ...)
{
  return [a1 unityGreenColor];
}

id objc_msgSend_unityRedColor(void *a1, const char *a2, ...)
{
  return [a1 unityRedColor];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}