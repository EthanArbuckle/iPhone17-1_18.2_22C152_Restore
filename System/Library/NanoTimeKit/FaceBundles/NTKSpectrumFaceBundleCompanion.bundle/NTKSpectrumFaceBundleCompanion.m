uint64_t _NTKSpectrumGetOverlayGradientColor()
{
  uint64_t vars8;

  NTKSpectrumGetOverlayGradientTable();
  CLKUIConvertToRGBfFromSRGB8_fast();
  CLKUIConvertToRGBfFromSRGB8_fast();

  return CLKUIConvertToUIColorFromRGBf_fast();
}

id sub_2DD4(uint64_t a1, void *a2, void *a3)
{
  CLKUIConvertToRGBfFromUIColor_fast();
  id result = (id)CLKUIConvertRGBtoLAB();
  __asm { FMOV            V3.4S, #1.0 }
  if (a2)
  {
    CLKUIConvertLABtoRGB();
    CLKUIConvertToUIColorFromRGBf_fast();
    id result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
    if (!a3) {
      return result;
    }
  }
  else if (!a3)
  {
    return result;
  }
  CLKUIConvertLABtoRGB();
  CLKUIConvertToUIColorFromRGBf_fast();
  id result = (id)objc_claimAutoreleasedReturnValue();
  *a3 = result;
  return result;
}

void sub_2EC8(void *a1, void *a2, void *a3)
{
  id v13 = a1;
  CLKUIConvertToRGBfFromUIColor_fast();
  CLKUIConvertRGBtoLAB();
  float v12 = v5;
  CLKUIConvertLABtoRGB();
  __asm { FMOV            V1.4S, #1.0 }
  v11 = CLKUIConvertToUIColorFromRGBf_fast();
  if (v12 < 85.0)
  {
    if (a2) {
      *a2 = v13;
    }
    if (!a3) {
      goto LABEL_10;
    }
LABEL_9:
    *a3 = v11;
    goto LABEL_10;
  }
  if (a3) {
    *a3 = v13;
  }
  a3 = a2;
  if (a2) {
    goto LABEL_9;
  }
LABEL_10:
}

void sub_38B8(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16DF0);
  id WeakRetained = objc_loadWeakRetained(&qword_16DF8);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16DF8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16E00;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16DF8, obj);
  qword_16E00 = (uint64_t)[obj version];

  sub_4340(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16DF0);
  long long v10 = *(_OWORD *)&qword_16DC0;
  *a2 = xmmword_16DB0;
  a2[1] = v10;
  long long v11 = *(_OWORD *)&qword_16DE0;
  a2[2] = xmmword_16DD0;
  a2[3] = v11;
}

void sub_3DBC(double *a1, void *a2, unint64_t a3)
{
  id v5 = (void *)*((void *)a1 + 4);
  double v6 = a1[5];
  id v8 = a2;
  [v5 _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:v6 invisibleTicksAlpha:0.0];
  *(float *)&double v7 = v7;
  if (*((void *)a1 + 6) <= a3) {
    *(float *)&double v7 = 0.0;
  }
  [v8 setOpacity:v7];
}

void sub_3EE0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  double v6 = *(double *)(a1 + 40);
  id v8 = a2;
  [v5 _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:v6 invisibleTicksAlpha:0.0];
  [*(id *)(a1 + 32) _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:*(double *)(a1 + 48) invisibleTicksAlpha:0.0];
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v7 = v7;
  [v8 setOpacity:v7];
}

void sub_4008(double *a1, void *a2, uint64_t a3)
{
  v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[5];
  double v6 = a1[6];
  id v8 = a2;
  [v4 _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:v5 invisibleTicksAlpha:v6];
  *(float *)&double v7 = v7;
  [v8 setOpacity:v7];
}

void sub_40D0(id a1)
{
  v1 = +[NSNull null];
  v4[0] = @"instanceTransform";
  v4[1] = @"contentsMultiplyColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"transform";
  v4[3] = @"hidden";
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = @"position";
  v4[5] = @"opacity";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"instanceCount";
  v4[7] = @"instanceDelay";
  v5[6] = v1;
  v5[7] = v1;
  v4[8] = @"backgroundColor";
  v5[8] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  v3 = (void *)qword_16DA0;
  qword_16DA0 = v2;
}

void sub_4340(uint64_t a1, uint64_t a2)
{
  id v8 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  objc_msgSend(v8, "scaledSize:withOverride:forSizeClass:", 3, 1.5, 6.0, 1.5, 7.0);
  *(double *)&xmmword_16DB0 = v2;
  *((void *)&xmmword_16DB0 + 1) = v3;
  *(double *)&qword_16DC0 = v2 * 0.5;
  objc_msgSend(v8, "scaledSize:withOverride:forSizeClass:", 3, 1.0, 5.5, 1.0, 6.5);
  qword_16DC8 = *(void *)&v4;
  *(void *)&xmmword_16DD0 = v5;
  *((double *)&xmmword_16DD0 + 1) = v4 * 0.5;
  [v8 scaledValue:3 withOverride:3.0 forSizeClass:3.0];
  qword_16DE0 = v6;
  [v8 scaledValue:5.5];
  qword_16DE8 = v7;
}

double sub_4514(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16E30);
  id WeakRetained = objc_loadWeakRetained(&qword_16E38);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_16E38);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_16E38, v1);
    qword_16E40 = (uint64_t)[v1 version];

    sub_7A1C(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_16E40;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16E30);
  double v9 = *(double *)&qword_16E10;

  return v9;
}

void sub_4A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4A6C(uint64_t a1, double a2, double a3, float a4, float a5, float a6, float a7)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[12] = a2;
    WeakRetained[13] = a3;
    *((float *)WeakRetained + 28) = a4;
    *((float *)WeakRetained + 29) = a5;
    *((float *)WeakRetained + 30) = a6;
    *((float *)WeakRetained + 31) = a7;
  }
}

void sub_6538(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
  uint64_t v6 = a3;
  uint64_t v3 = [(NTKComplicationDisplayWrapperView *)v6 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(NTKComplicationDisplayWrapperView *)v6 display];
    [v5 updateMonochromeColor];
  }
}

void sub_66BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGAffineTransformMakeScale(&v7, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
    [v4 setContentTransform:&v7];
  }
}

void sub_7A1C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  qword_16E10 = 0x3FF0000000000000;
  [v6 scaledValue:3 withOverride:133.0 forSizeClass:151.0];
  qword_16E20 = v3;
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v5 = v4;

  qword_16E18 = v5;
  qword_16E28 = 0x4010000000000000;
}

uint64_t sub_7CF8(uint64_t a1, uint64_t a2)
{
  qword_16E48 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_82EC(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NTKSpectrumAnalogColorEditOption;
  id v1 = objc_msgSendSuper2(&v6, "_valueToFaceBundleStringDict");
  id v2 = [v1 mutableCopy];

  [v2 removeObjectForKey:&off_10C90];
  v9[0] = &off_10E28;
  v9[1] = &off_10E10;
  v10[0] = NTKFaceBundleColorSpectrumDualTone1;
  v10[1] = NTKFaceBundleColorSpectrumDualTone2;
  v9[2] = &off_10DF8;
  v9[3] = &off_10DE0;
  v10[2] = NTKFaceBundleColorSpectrumDualTone3;
  v10[3] = NTKFaceBundleColorSpectrumDualTone4;
  v9[4] = &off_10DC8;
  v9[5] = &off_10DB0;
  v10[4] = NTKFaceBundleColorSpectrumDualTone5;
  v10[5] = NTKFaceBundleColorSpectrumDualTone6;
  v9[6] = &off_10D98;
  v9[7] = &off_10D80;
  v10[6] = NTKFaceBundleColorSpectrumDualTone7;
  v10[7] = NTKFaceBundleColorSpectrumDualTone8;
  v9[8] = &off_10D68;
  v9[9] = &off_10D50;
  v10[8] = NTKFaceBundleColorSpectrumDualTone9;
  v10[9] = NTKFaceBundleColorSpectrumDualTone10;
  v9[10] = &off_10D38;
  v9[11] = &off_10CA8;
  v10[10] = NTKFaceBundleColorSpectrumDualTone11;
  v10[11] = NTKFaceBundleColorSpectrumMulticolor1;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:12];
  [v2 addEntriesFromDictionary:v3];

  v7[0] = &off_10D20;
  v7[1] = &off_10D08;
  v8[0] = NTKFaceBundleColorSpectrumDualTone12;
  v8[1] = NTKFaceBundleColorSpectrumDualTone13;
  v7[2] = &off_10CF0;
  v7[3] = &off_10CD8;
  v8[2] = NTKFaceBundleColorSpectrumDualTone14;
  v8[3] = NTKFaceBundleColorSpectrumDualTone15;
  v7[4] = &off_10CC0;
  v8[4] = NTKFaceBundleColorSpectrumDualTone16;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  [v2 addEntriesFromDictionary:v4];

  uint64_t v5 = (void *)qword_16E68;
  qword_16E68 = (uint64_t)v2;
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t CLKDegreesToRadians()
{
  return _CLKDegreesToRadians();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

uint64_t CLKUIConvertLABtoRGB()
{
  return _CLKUIConvertLABtoRGB();
}

uint64_t CLKUIConvertRGBtoLAB()
{
  return _CLKUIConvertRGBtoLAB();
}

uint64_t CLKUIConvertToRGBfFromSRGB8_fast()
{
  return _CLKUIConvertToRGBfFromSRGB8_fast();
}

uint64_t CLKUIConvertToRGBfFromUIColor()
{
  return _CLKUIConvertToRGBfFromUIColor();
}

uint64_t CLKUIConvertToRGBfFromUIColor_fast()
{
  return _CLKUIConvertToRGBfFromUIColor_fast();
}

uint64_t CLKUIConvertToUIColorFromRGBf()
{
  return _CLKUIConvertToUIColorFromRGBf();
}

uint64_t CLKUIConvertToUIColorFromRGBf_fast()
{
  return _CLKUIConvertToUIColorFromRGBf_fast();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
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

uint64_t NTKFaceColorNameAndCollection()
{
  return _NTKFaceColorNameAndCollection();
}

uint64_t NTKFaceColorNameForDuotones()
{
  return _NTKFaceColorNameForDuotones();
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKSpectrumGetOverlayGradientTable()
{
  return _NTKSpectrumGetOverlayGradientTable();
}

uint64_t NTKSwatchTwoColorGradientImage()
{
  return _NTKSwatchTwoColorGradientImage();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__configureUIOnColorChange(void *a1, const char *a2, ...)
{
  return [a1 _configureUIOnColorChange];
}

id objc_msgSend__defaultColorOption(void *a1, const char *a2, ...)
{
  return [a1 _defaultColorOption];
}

id objc_msgSend__disabledLayerActions(void *a1, const char *a2, ...)
{
  return [a1 _disabledLayerActions];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__hasBezelComplication(void *a1, const char *a2, ...)
{
  return [a1 _hasBezelComplication];
}

id objc_msgSend__loadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _loadActiveViews];
}

id objc_msgSend__loadCommonViews(void *a1, const char *a2, ...)
{
  return [a1 _loadCommonViews];
}

id objc_msgSend__needsBezelVisible(void *a1, const char *a2, ...)
{
  return [a1 _needsBezelVisible];
}

id objc_msgSend__setupDialView(void *a1, const char *a2, ...)
{
  return [a1 _setupDialView];
}

id objc_msgSend__unloadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadActiveViews];
}

id objc_msgSend__unloadCommonViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadCommonViews];
}

id objc_msgSend__updateColor(void *a1, const char *a2, ...)
{
  return [a1 _updateColor];
}

id objc_msgSend__updateColors(void *a1, const char *a2, ...)
{
  return [a1 _updateColors];
}

id objc_msgSend__updateDialTicksForBezelText(void *a1, const char *a2, ...)
{
  return [a1 _updateDialTicksForBezelText];
}

id objc_msgSend__updateFramerate(void *a1, const char *a2, ...)
{
  return [a1 _updateFramerate];
}

id objc_msgSend__updateMasking(void *a1, const char *a2, ...)
{
  return [a1 _updateMasking];
}

id objc_msgSend__updateShape(void *a1, const char *a2, ...)
{
  return [a1 _updateShape];
}

id objc_msgSend__updateStyle(void *a1, const char *a2, ...)
{
  return [a1 _updateStyle];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bandColor(void *a1, const char *a2, ...)
{
  return [a1 bandColor];
}

id objc_msgSend_bezelComplicationMaxAngularWidth(void *a1, const char *a2, ...)
{
  return [a1 bezelComplicationMaxAngularWidth];
}

id objc_msgSend_bezelComplicationTextWidthInRadius(void *a1, const char *a2, ...)
{
  return [a1 bezelComplicationTextWidthInRadius];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_cleanupAfterEdit(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEdit];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
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

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
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

id objc_msgSend_deviceSupportsPigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsPigmentEditOption];
}

id objc_msgSend_dialComplicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 dialComplicationContainerView];
}

id objc_msgSend_dialShape(void *a1, const char *a2, ...)
{
  return [a1 dialShape];
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

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fromColor(void *a1, const char *a2, ...)
{
  return [a1 fromColor];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_hasPrimaryColorRange(void *a1, const char *a2, ...)
{
  return [a1 hasPrimaryColorRange];
}

id objc_msgSend_hourHandInlay(void *a1, const char *a2, ...)
{
  return [a1 hourHandInlay];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_is3ComponentsGradient(void *a1, const char *a2, ...)
{
  return [a1 is3ComponentsGradient];
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

id objc_msgSend_isUnityColor(void *a1, const char *a2, ...)
{
  return [a1 isUnityColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_midColor(void *a1, const char *a2, ...)
{
  return [a1 midColor];
}

id objc_msgSend_minuteHandInlay(void *a1, const char *a2, ...)
{
  return [a1 minuteHandInlay];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_overlayOpacity(void *a1, const char *a2, ...)
{
  return [a1 overlayOpacity];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_prepareForEdit(void *a1, const char *a2, ...)
{
  return [a1 prepareForEdit];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rootContainerView(void *a1, const char *a2, ...)
{
  return [a1 rootContainerView];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_swatchStyle(void *a1, const char *a2, ...)
{
  return [a1 swatchStyle];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
}

id objc_msgSend_textWidthInRadians(void *a1, const char *a2, ...)
{
  return [a1 textWidthInRadians];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toColor(void *a1, const char *a2, ...)
{
  return [a1 toColor];
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

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_utilityBezelComplicationView(void *a1, const char *a2, ...)
{
  return [a1 utilityBezelComplicationView];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}