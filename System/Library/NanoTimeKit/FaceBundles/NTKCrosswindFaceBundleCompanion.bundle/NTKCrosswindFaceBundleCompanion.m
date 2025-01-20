void sub_42B4(uint64_t a1, long long *a2, uint64_t a3)
{
  long long v3;
  void *v4;
  void v5[6];
  long long v6;
  long long v7;
  long long v8;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_43A4;
  v5[3] = &unk_103E8;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a3;
  v3 = a2[1];
  v6 = *a2;
  v7 = v3;
  v8 = a2[2];
  v4 = objc_retainBlock(v5);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotTopLeft);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotTopRight);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotBottomLeft);
  ((void (*)(void *, void))v4[2])(v4, NTKComplicationSlotBottomRight);
}

void sub_43A4(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) complicationLayoutforSlot:a2];
  v4 = [v3 defaultLayoutRuleForState:*(void *)(a1 + 40)];
  long long v5 = *(_OWORD *)(a1 + 64);
  v6[0] = *(_OWORD *)(a1 + 48);
  v6[1] = v5;
  v6[2] = *(_OWORD *)(a1 + 80);
  [v4 setContentTransform:v6];
}

void sub_4DBC(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
  v6 = a3;
  v3 = [(NTKComplicationDisplayWrapperView *)v6 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v5 = [(NTKComplicationDisplayWrapperView *)v6 display];
    [v5 updateMonochromeColor];
  }
}

id sub_5BA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateReferenceTimeForReason:*(void *)(a1 + 40)];
}

void sub_5F64(id a1)
{
  qword_16ED0 = (uint64_t)[objc_alloc((Class)NTKCornerComplicationConfiguration) initWithTopLeftComplication:10 topRightComplication:36 bottomLeftComplication:3 bottomRightComplication:7];

  _objc_release_x1();
}

void NTKCrosswindBuildSectorsConfiguration(_DWORD *a1, uint64_t a2, unint64_t *a3, __n128 a4, __n128 a5)
{
  memset(v39, 0, sizeof(v39));
  uint64_t v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v8 = (void *)v39[a5.n128_u32[0]];
  v39[a5.n128_u32[0]] = v7;

  HIDWORD(v9) = a4.n128_u32[1];
  LODWORD(v9) = a4.n128_u32[1];
  uint64_t v10 = +[NSNumber numberWithFloat:v9];
  v11 = (void *)v39[a5.n128_u32[1]];
  v39[a5.n128_u32[1]] = v10;

  uint64_t v12 = +[NSNumber numberWithFloat:COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2]))];
  unint64_t v13 = a5.n128_u32[2];
  v14 = (void *)v39[a5.n128_u32[2]];
  v39[a5.n128_u32[2]] = v12;

  v15 = +[NSMutableArray arrayWithObjects:v39 count:3];
  v16 = v15;
  if (*(unsigned char *)(a2 + 16))
  {
    [v15 removeObjectAtIndex:a5.n128_u32[0]];
    unint64_t v13 = a5.n128_u32[2] - (unint64_t)(a5.n128_u32[0] < a5.n128_u32[2]);
  }
  if (*(uint64_t *)a2 >= 0) {
    unint64_t v17 = *(void *)a2;
  }
  else {
    unint64_t v17 = v13;
  }
  if (a3) {
    *a3 = v17;
  }
  memset(v38, 0, sizeof(v38));
  uint64_t v18 = (uint64_t)[v16 count];
  unint64_t v19 = v18;
  if (v18)
  {
    uint64_t v20 = 0;
    uint64_t v21 = -v18;
    do
    {
      uint64_t v22 = +[NSNumber numberWithUnsignedInteger:NTKCrosswindOffsetIndexWrapped(*(void *)(a2 + 8), v20, 4)];
      v23 = (void *)v38[v17 % v19];
      v38[v17 % v19] = v22;

      --v20;
      ++v17;
    }
    while (v21 != v20);
  }
  v24 = +[NSMutableArray arrayWithObjects:v38 count:v19];
  if (*(unsigned char *)(a2 + 17))
  {
    --v19;
    [v16 removeObjectAtIndex:v13];
    [v24 removeObjectAtIndex:v13];
  }
  if (v19)
  {
    uint64_t v25 = 0;
    v26 = a1 + 8;
    do
    {
      v27 = [v16 objectAtIndexedSubscript:v25];
      [v27 floatValue];
      float v29 = v28;

      v30 = (float *)&v26[v25];
      *(v30 - 7) = v29;
      v31 = [v24 objectAtIndexedSubscript:v25];
      *((_DWORD *)v30 - 4) = [v31 unsignedIntValue];

      __float2 v32 = __sincosf_stret(v29);
      *(void *)&v26[2 * v25++] = __PAIR64__(LODWORD(v32.__sinval), LODWORD(v32.__cosval));
    }
    while (v19 != v25);
  }
  *a1 = v19;

  for (uint64_t i = 2; i != -1; --i)
  for (uint64_t j = 2; j != -1; --j)
}

uint64_t NTKCrosswindDeduplicateAnglesInSectorsConfiguration(uint64_t result)
{
  uint64_t v1 = result;
  int v10 = 0;
  uint64_t v9 = 0;
  int v8 = 0;
  uint64_t v7 = 0;
  uint64_t v2 = *(unsigned int *)result;
  if (v2)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 0;
    while (1)
    {
      int v5 = *(_DWORD *)(v1 + 4 * v3 + 4);
      if (v3 == v2 - 1) {
        break;
      }
      uint64_t v6 = v3 + 1;
      result = CLKFloatEqualsFloat();
      if ((result & 1) == 0) {
        goto LABEL_6;
      }
LABEL_7:
      uint64_t v3 = v6;
      if (v6 == v2) {
        goto LABEL_10;
      }
    }
    uint64_t v6 = v3 + 1;
LABEL_6:
    *((_DWORD *)&v9 + v4) = v5;
    *((_DWORD *)&v7 + v4++) = *(_DWORD *)(v1 + 4 * v3 + 16);
    goto LABEL_7;
  }
  unsigned int v4 = 0;
LABEL_10:
  *(_DWORD *)uint64_t v1 = v4;
  *(void *)(v1 + 4) = v9;
  *(_DWORD *)(v1 + 12) = v10;
  *(void *)(v1 + 16) = v7;
  *(_DWORD *)(v1 + 24) = v8;
  return result;
}

__n128 NTKCrosswindGetAngleIndiciesFromSectorsConfiguration(_DWORD *a1)
{
  if (*a1)
  {
    unint64_t v2 = 0;
    *(void *)&long long v3 = -1;
    *((void *)&v3 + 1) = -1;
    long long v9 = v3;
    do
    {
      if (CLKFloatEqualsFloat())
      {
        *(void *)&long long v4 = __PAIR64__(DWORD1(v9), v2);
        *((void *)&v4 + 1) = *((void *)&v9 + 1);
        long long v9 = v4;
      }
      if (CLKFloatEqualsFloat())
      {
        *(void *)&long long v5 = __PAIR64__(v2, v9);
        *((void *)&v5 + 1) = *((void *)&v9 + 1);
        long long v9 = v5;
      }
      if (CLKFloatEqualsFloat())
      {
        *(void *)&long long v6 = v9;
        *((void *)&v6 + 1) = __PAIR64__(HIDWORD(v9), v2);
        long long v9 = v6;
      }
      ++v2;
    }
    while (v2 < *a1);
  }
  else
  {
    *(void *)&long long v7 = -1;
    *((void *)&v7 + 1) = -1;
    return (__n128)v7;
  }
  return (__n128)v9;
}

double sub_6754(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16EF8);
  id WeakRetained = objc_loadWeakRetained(&qword_16F00);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  long long v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_16F00);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_16F00, v1);
    qword_16F08 = (uint64_t)[v1 version];

    sub_6AB8(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_16F08;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16EF8);
  double v9 = *(double *)&qword_16EE0;

  return v9;
}

void sub_6AB8(uint64_t a1, void *a2)
{
  id v2 = a2;
  long long v3 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v2];
  [v3 handLength];
  uint64_t v5 = v4;

  CLKRoundForDevice();
  qword_16EE0 = v6;
  CLKRoundForDevice();
  uint64_t v8 = v7;

  qword_16EE8 = v8;
  qword_16EF0 = v5;
}

uint64_t NTKCrosswindColorCompositionIdealized()
{
  return 2;
}

BOOL NTKCrosswindColorCompositionEqualToComposition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

uint64_t NTKCrosswindOffsetIndexWrapped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (a3 & (((a2 + a1) % a3) >> 63)) + (a2 + a1) % a3;
}

_DWORD *sub_871C(_DWORD *result, uint64_t a2, uint64_t a3)
{
  if (a2 && a3)
  {
    uint64_t v5 = result;
    for (uint64_t i = 0; i != a2; ++i)
      __src[NTKCrosswindOffsetIndexWrapped(i, a3, a2)] = v5[i];
    return memcpy(v5, __src, 4 * a2);
  }
  return result;
}

void sub_8A0C(id a1)
{
  qword_16F10 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

uint64_t NTKCrosswindPolarFullTurnAngleCrossingBetweenAngles()
{
  CLKWrapRadians();
  double v1 = v0;
  CLKWrapRadians();
  uint64_t v3 = v2 > 5.02654825 && v1 < 1.25663706;
  BOOL v4 = v2 >= 1.25663706 || v1 <= 5.02654825;
  uint64_t v5 = v3 << 63 >> 63;
  if (v4) {
    return v5;
  }
  else {
    return 1;
  }
}

uint64_t NTKCrosswindPolarFullTurnAngleCrossingAlongShortestPathBetweenAngles()
{
  CLKWrapRadians();
  double v1 = v0;
  CLKWrapRadians();
  double v3 = v2;
  if (CLKFloatEqualsFloat()) {
    return 0;
  }
  CLKInterpolateShortestPathBetweenAnglesUnclipped();
  CLKWrapRadians();
  if (v1 >= v3)
  {
    return v5 >= v1 || v3 >= v5;
  }
  else
  {
    uint64_t v6 = v5 >= v3 || v1 >= v5;
    return v6 << 63 >> 63;
  }
}

__n128 NTKCrosswindHourMinuteSecondAnglesToPolarAngles()
{
  CLKClockRadiansToPolarRadians();
  float64_t v5 = v0;
  CLKClockRadiansToPolarRadians();
  v1.f64[0] = v5;
  v1.f64[1] = v2;
  *(float32x2_t *)&long long v3 = vcvt_f32_f64(v1);
  long long v6 = v3;
  CLKClockRadiansToPolarRadians();
  return (__n128)v6;
}

void sub_9314(id a1)
{
  qword_16F20 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_9DA8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412802;
  CFStringRef v4 = @"Crosswind Render Pipeline";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Failed to create %@ State for device %@ due to error: %@", (uint8_t *)&v3, 0x20u);
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKClockRadiansToPolarRadians()
{
  return _CLKClockRadiansToPolarRadians();
}

uint64_t CLKContrastRatioForColors()
{
  return _CLKContrastRatioForColors();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenColors()
{
  return _CLKInterpolateBetweenColors();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateShortestPathBetweenAnglesUnclipped()
{
  return _CLKInterpolateShortestPathBetweenAnglesUnclipped();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice()
{
  return _CLKUIAnalogHandsDefaultPreferredFramesPerSecondForDevice();
}

uint64_t CLKUIConvertToRGBfFromUIColor()
{
  return _CLKUIConvertToRGBfFromUIColor();
}

uint64_t CLKUIInterpolateBetweenColors()
{
  return _CLKUIInterpolateBetweenColors();
}

uint64_t CLKWrapRadians()
{
  return _CLKWrapRadians();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCarbonaraWidgetIntent()
{
  return _NTKCarbonaraWidgetIntent();
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

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowCarbonara()
{
  return _NTKShowCarbonara();
}

uint64_t NTKSwatchColorSectorsImage()
{
  return _NTKSwatchColorSectorsImage();
}

uint64_t NTKSwatchTwoColorGradientImage()
{
  return _NTKSwatchTwoColorGradientImage();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

void objc_enumerationMutation(id obj)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

id objc_msgSend__createVertexBuffer(void *a1, const char *a2, ...)
{
  return [a1 _createVertexBuffer];
}

id objc_msgSend__defaultReferenceComposition(void *a1, const char *a2, ...)
{
  return [a1 _defaultReferenceComposition];
}

id objc_msgSend__isCustomHeroColor(void *a1, const char *a2, ...)
{
  return [a1 _isCustomHeroColor];
}

id objc_msgSend__isCustomHeroOrSpecialColor(void *a1, const char *a2, ...)
{
  return [a1 _isCustomHeroOrSpecialColor];
}

id objc_msgSend__isWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 _isWhiteColor];
}

id objc_msgSend__lightnessLevel(void *a1, const char *a2, ...)
{
  return [a1 _lightnessLevel];
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

id objc_msgSend__updateFrameRate(void *a1, const char *a2, ...)
{
  return [a1 _updateFrameRate];
}

id objc_msgSend__updateTimeViewColors(void *a1, const char *a2, ...)
{
  return [a1 _updateTimeViewColors];
}

id objc_msgSend_armLength(void *a1, const char *a2, ...)
{
  return [a1 armLength];
}

id objc_msgSend_baseLayerBackground(void *a1, const char *a2, ...)
{
  return [a1 baseLayerBackground];
}

id objc_msgSend_baseLayerForeground(void *a1, const char *a2, ...)
{
  return [a1 baseLayerForeground];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_collectionName(void *a1, const char *a2, ...)
{
  return [a1 collectionName];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
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

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fromColor1(void *a1, const char *a2, ...)
{
  return [a1 fromColor1];
}

id objc_msgSend_fromColor2(void *a1, const char *a2, ...)
{
  return [a1 fromColor2];
}

id objc_msgSend_fromColor3(void *a1, const char *a2, ...)
{
  return [a1 fromColor3];
}

id objc_msgSend_fromColor4(void *a1, const char *a2, ...)
{
  return [a1 fromColor4];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return [a1 fullname];
}

id objc_msgSend_handInlay1(void *a1, const char *a2, ...)
{
  return [a1 handInlay1];
}

id objc_msgSend_handInlay2(void *a1, const char *a2, ...)
{
  return [a1 handInlay2];
}

id objc_msgSend_handInlay3(void *a1, const char *a2, ...)
{
  return [a1 handInlay3];
}

id objc_msgSend_handInlay4(void *a1, const char *a2, ...)
{
  return [a1 handInlay4];
}

id objc_msgSend_handLength(void *a1, const char *a2, ...)
{
  return [a1 handLength];
}

id objc_msgSend_hasPrimaryColorRange(void *a1, const char *a2, ...)
{
  return [a1 hasPrimaryColorRange];
}

id objc_msgSend_hourHandInlayColor(void *a1, const char *a2, ...)
{
  return [a1 hourHandInlayColor];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_innerCircleRadius(void *a1, const char *a2, ...)
{
  return [a1 innerCircleRadius];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidateCachedValues(void *a1, const char *a2, ...)
{
  return [a1 invalidateCachedValues];
}

id objc_msgSend_isAnimatingOverrideDate(void *a1, const char *a2, ...)
{
  return [a1 isAnimatingOverrideDate];
}

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
}

id objc_msgSend_isSeasonalCollection(void *a1, const char *a2, ...)
{
  return [a1 isSeasonalCollection];
}

id objc_msgSend_isTritium(void *a1, const char *a2, ...)
{
  return [a1 isTritium];
}

id objc_msgSend_midColor1(void *a1, const char *a2, ...)
{
  return [a1 midColor1];
}

id objc_msgSend_midColor2(void *a1, const char *a2, ...)
{
  return [a1 midColor2];
}

id objc_msgSend_midColor3(void *a1, const char *a2, ...)
{
  return [a1 midColor3];
}

id objc_msgSend_midColor4(void *a1, const char *a2, ...)
{
  return [a1 midColor4];
}

id objc_msgSend_middleCircleRadius(void *a1, const char *a2, ...)
{
  return [a1 middleCircleRadius];
}

id objc_msgSend_minuteHandDotColor(void *a1, const char *a2, ...)
{
  return [a1 minuteHandDotColor];
}

id objc_msgSend_minuteHandInlayColor(void *a1, const char *a2, ...)
{
  return [a1 minuteHandInlayColor];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_optionName(void *a1, const char *a2, ...)
{
  return [a1 optionName];
}

id objc_msgSend_outerCircleRadius(void *a1, const char *a2, ...)
{
  return [a1 outerCircleRadius];
}

id objc_msgSend_outermostFromColor1(void *a1, const char *a2, ...)
{
  return [a1 outermostFromColor1];
}

id objc_msgSend_outermostFromColor2(void *a1, const char *a2, ...)
{
  return [a1 outermostFromColor2];
}

id objc_msgSend_outermostFromColor3(void *a1, const char *a2, ...)
{
  return [a1 outermostFromColor3];
}

id objc_msgSend_outermostFromColor4(void *a1, const char *a2, ...)
{
  return [a1 outermostFromColor4];
}

id objc_msgSend_outermostMidColor1(void *a1, const char *a2, ...)
{
  return [a1 outermostMidColor1];
}

id objc_msgSend_outermostMidColor2(void *a1, const char *a2, ...)
{
  return [a1 outermostMidColor2];
}

id objc_msgSend_outermostMidColor3(void *a1, const char *a2, ...)
{
  return [a1 outermostMidColor3];
}

id objc_msgSend_outermostMidColor4(void *a1, const char *a2, ...)
{
  return [a1 outermostMidColor4];
}

id objc_msgSend_outermostToColor1(void *a1, const char *a2, ...)
{
  return [a1 outermostToColor1];
}

id objc_msgSend_outermostToColor2(void *a1, const char *a2, ...)
{
  return [a1 outermostToColor2];
}

id objc_msgSend_outermostToColor3(void *a1, const char *a2, ...)
{
  return [a1 outermostToColor3];
}

id objc_msgSend_outermostToColor4(void *a1, const char *a2, ...)
{
  return [a1 outermostToColor4];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_pegRadius(void *a1, const char *a2, ...)
{
  return [a1 pegRadius];
}

id objc_msgSend_pegStrokeWidth(void *a1, const char *a2, ...)
{
  return [a1 pegStrokeWidth];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_quad(void *a1, const char *a2, ...)
{
  return [a1 quad];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resolvedComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 resolvedComplicationColor];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_toColor1(void *a1, const char *a2, ...)
{
  return [a1 toColor1];
}

id objc_msgSend_toColor2(void *a1, const char *a2, ...)
{
  return [a1 toColor2];
}

id objc_msgSend_toColor3(void *a1, const char *a2, ...)
{
  return [a1 toColor3];
}

id objc_msgSend_toColor4(void *a1, const char *a2, ...)
{
  return [a1 toColor4];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_transitionFraction(void *a1, const char *a2, ...)
{
  return [a1 transitionFraction];
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

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}