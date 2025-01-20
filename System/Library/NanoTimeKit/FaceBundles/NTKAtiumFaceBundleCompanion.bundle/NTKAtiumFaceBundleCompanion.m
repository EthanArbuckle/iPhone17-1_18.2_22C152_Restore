void sub_21C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2290;
  v7[3] = &unk_C398;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  v8 = v5;
  v9 = v3;
  v10 = *(id *)(a1 + 56);
  v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

void sub_2290(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) defaultFaceForDevice:*(void *)(a1 + 40)];
  if (v3)
  {
    v4 = +[NTKPigmentEditOption pigmentNamed:*(void *)(a1 + 48)];
    [v3 selectOption:v4 forCustomEditMode:10 slot:0];
    v5 = +[NTKAnalogDialShapeEditOption optionWithShape:forDevice:](NTKAnalogDialShapeEditOption, "optionWithShape:forDevice:", [v6 unsignedIntValue], *(void *)(a1 + 40));
    [v3 selectOption:v5 forCustomEditMode:15 slot:0];
    [*(id *)(a1 + 56) addObject:v3];
  }
}

void sub_2A64(id a1)
{
  qword_121F0 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_2E00(id a1)
{
  qword_12200 = (uint64_t)[objc_alloc((Class)NTKCornerComplicationConfiguration) initWithTopLeftComplication:36 topRightComplication:10 bottomLeftComplication:3 bottomRightComplication:7];

  _objc_release_x1();
}

void sub_3BA0(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
  id v6 = a3;
  v3 = [(NTKComplicationDisplayWrapperView *)v6 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(NTKComplicationDisplayWrapperView *)v6 display];
    [v5 updateMonochromeColor];
  }
}

void sub_3FBC(uint64_t a1, long long *a2, uint64_t a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_40AC;
  v5[3] = &unk_C510;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a3;
  long long v3 = a2[1];
  long long v6 = *a2;
  long long v7 = v3;
  long long v8 = a2[2];
  v4 = objc_retainBlock(v5);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotTopLeft);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotTopRight);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotBottomLeft);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotBottomRight);
}

void sub_40AC(uint64_t a1, uint64_t a2)
{
  long long v3 = [*(id *)(a1 + 32) complicationLayoutforSlot:a2];
  v4 = [v3 defaultLayoutRuleForState:*(void *)(a1 + 40)];
  long long v5 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 80);
  [v4 setContentTransform:v6];
}

id sub_4DC4()
{
  if (qword_12220 != -1) {
    dispatch_once(&qword_12220, &stru_C558);
  }
  v0 = (void *)qword_12218;

  return v0;
}

double sub_4E18(float a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vmulq_f32(a2, a2);
  v2.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v2, 2), vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1))).u32[0];
  float32x2_t v3 = vrsqrte_f32((float32x2_t)v2.u32[0]);
  float32x2_t v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v3, v3)));
  float32x4_t v8 = vmulq_n_f32(a2, vmul_f32(v4, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v4, v4))).f32[0]);
  __float2 v5 = __sincosf_stret(a1);
  LODWORD(v6) = vmlas_n_f32(v5.__cosval, 1.0 - v5.__cosval, vmulq_f32(v8, v8).f32[0]);
  *((float *)&v6 + 1) = vmuls_lane_f32(v5.__sinval, v8, 2)
                      + (float)(vmuls_lane_f32(v8.f32[0], *(float32x2_t *)v8.f32, 1) * (float)(1.0 - v5.__cosval));
  return v6;
}

double sub_4F14(float32x4_t _Q0)
{
  _S3 = _Q0.u32[1];
  _S5 = _Q0.u32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = _Q0.u32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  float v10 = vmlas_n_f32(vmuls_lane_f32(_Q0.f32[2], _Q0, 3), _Q0.f32[1], _Q0.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

void sub_6AEC(id a1)
{
  qword_12218 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_6B64()
{
  v1[0] = 138412802;
  sub_6B48();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Failed to create %@ State for device %@ due to error: %@", (uint8_t *)v1, 0x20u);
}

void sub_6BE8()
{
  v1[0] = 138412802;
  sub_6B48();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Failed to create %@ shader for device %@ due to error: %@", (uint8_t *)v1, 0x20u);
}

void sub_6C74(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412802;
  CFStringRef v5 = @"QuickCubeTexture";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Failed to create %@ texture for device %@ due to error: %@", (uint8_t *)&v4, 0x20u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKDeviceCategoryForSizeClass()
{
  return _CLKDeviceCategoryForSizeClass();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateShortestPathBetweenAnglesUnclipped()
{
  return _CLKInterpolateShortestPathBetweenAnglesUnclipped();
}

uint64_t CLKUIConvertToRGBfFromUIColor()
{
  return _CLKUIConvertToRGBfFromUIColor();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKColorByApplyingWhiteOverlay()
{
  return _NTKColorByApplyingWhiteOverlay();
}

uint64_t NTKColorByModifyingHSB()
{
  return _NTKColorByModifyingHSB();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
}

uint64_t NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice()
{
  return _NTKDefaultCornerComplicationScaleForFullscreenOpaqueFaceForDevice();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKSwatchColorSectorsImage()
{
  return _NTKSwatchColorSectorsImage();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
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

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__createVertexBuffer(void *a1, const char *a2, ...)
{
  return [a1 _createVertexBuffer];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__getHandAngles(void *a1, const char *a2, ...)
{
  return [a1 _getHandAngles];
}

id objc_msgSend__needsOrientationBlend(void *a1, const char *a2, ...)
{
  return [a1 _needsOrientationBlend];
}

id objc_msgSend__setUpMetalView(void *a1, const char *a2, ...)
{
  return [a1 _setUpMetalView];
}

id objc_msgSend__tearDownMetalView(void *a1, const char *a2, ...)
{
  return [a1 _tearDownMetalView];
}

id objc_msgSend__updateColors(void *a1, const char *a2, ...)
{
  return [a1 _updateColors];
}

id objc_msgSend__updateComplicationsWithComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 _updateComplicationsWithComplicationColor];
}

id objc_msgSend__updateContentTransform(void *a1, const char *a2, ...)
{
  return [a1 _updateContentTransform];
}

id objc_msgSend__updateDeviceRotationMatrix(void *a1, const char *a2, ...)
{
  return [a1 _updateDeviceRotationMatrix];
}

id objc_msgSend__updateShape(void *a1, const char *a2, ...)
{
  return [a1 _updateShape];
}

id objc_msgSend_armLength(void *a1, const char *a2, ...)
{
  return [a1 armLength];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blendRecolorLightingTextureEnabled(void *a1, const char *a2, ...)
{
  return [a1 blendRecolorLightingTextureEnabled];
}

id objc_msgSend_blendUseRainbowTexture(void *a1, const char *a2, ...)
{
  return [a1 blendUseRainbowTexture];
}

id objc_msgSend_blendUseThreeColorTexture(void *a1, const char *a2, ...)
{
  return [a1 blendUseThreeColorTexture];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorOption(void *a1, const char *a2, ...)
{
  return [a1 colorOption];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationColor];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
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

id objc_msgSend_dialSize(void *a1, const char *a2, ...)
{
  return [a1 dialSize];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_functionDescriptor(void *a1, const char *a2, ...)
{
  return [a1 functionDescriptor];
}

id objc_msgSend_handLength(void *a1, const char *a2, ...)
{
  return [a1 handLength];
}

id objc_msgSend_handWidth(void *a1, const char *a2, ...)
{
  return [a1 handWidth];
}

id objc_msgSend_handsColor(void *a1, const char *a2, ...)
{
  return [a1 handsColor];
}

id objc_msgSend_hasPrimaryColorRange(void *a1, const char *a2, ...)
{
  return [a1 hasPrimaryColorRange];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isAnimatingOverrideDate(void *a1, const char *a2, ...)
{
  return [a1 isAnimatingOverrideDate];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isRainbow(void *a1, const char *a2, ...)
{
  return [a1 isRainbow];
}

id objc_msgSend_isThreeColor(void *a1, const char *a2, ...)
{
  return [a1 isThreeColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_lightColor1(void *a1, const char *a2, ...)
{
  return [a1 lightColor1];
}

id objc_msgSend_lightColor2(void *a1, const char *a2, ...)
{
  return [a1 lightColor2];
}

id objc_msgSend_lightColor3(void *a1, const char *a2, ...)
{
  return [a1 lightColor3];
}

id objc_msgSend_materialType(void *a1, const char *a2, ...)
{
  return [a1 materialType];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_overrideTritiumAnimation(void *a1, const char *a2, ...)
{
  return [a1 overrideTritiumAnimation];
}

id objc_msgSend_pegRadius(void *a1, const char *a2, ...)
{
  return [a1 pegRadius];
}

id objc_msgSend_pegStrokeWidth(void *a1, const char *a2, ...)
{
  return [a1 pegStrokeWidth];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_recolorLightingTextureEnabled(void *a1, const char *a2, ...)
{
  return [a1 recolorLightingTextureEnabled];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
}

id objc_msgSend_tailLength(void *a1, const char *a2, ...)
{
  return [a1 tailLength];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_transitionFraction(void *a1, const char *a2, ...)
{
  return [a1 transitionFraction];
}

id objc_msgSend_tritiumMaskMultiplier(void *a1, const char *a2, ...)
{
  return [a1 tritiumMaskMultiplier];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_useRainbowTexture(void *a1, const char *a2, ...)
{
  return [a1 useRainbowTexture];
}

id objc_msgSend_useThreeColorTexture(void *a1, const char *a2, ...)
{
  return [a1 useThreeColorTexture];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}