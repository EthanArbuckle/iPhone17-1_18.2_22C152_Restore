void sub_2A68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t vars8;

  v4 = [a3 display];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView]) {
    [v4 setAccentColor:*(void *)(*(void *)(a1 + 32) + 112)];
  }
}

void sub_300C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView]) {
    [v4 setAccentColor:*(void *)(a1 + 32)];
  }
}

void sub_33B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 display];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    double v4 = *(double *)(a1 + 32);
    id v5 = v6;
    [v5 setForegroundAlpha:v4];
    [v5 setForegroundImageAlpha:*(double *)(a1 + 40)];
  }
}

id sub_3CDC(uint64_t a1, void *a2)
{
  v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", v5, v7, v9, v11);
  objc_msgSend(*(id *)(a1 + 48), "drawInRect:", v5, v7, v9, v11);
  NTKCSecondHandCenterOffset();
  v12 = *(void **)(a1 + 56);
  double v14 = v5 + v9 * 0.5 - v13;
  double v16 = v7 + v11 * 0.5 - v15;

  return objc_msgSend(v12, "drawAtPoint:", v14, v16);
}

void sub_3E94(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_121F0);
  id WeakRetained = objc_loadWeakRetained(&qword_121F8);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_121F8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_12200;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_121F8, obj);
  qword_12200 = (uint64_t)[obj version];

  sub_621C(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_121F0);
  long long v10 = *(_OWORD *)&qword_121C8;
  *(_OWORD *)(a2 + 64) = xmmword_121B8;
  *(_OWORD *)(a2 + 80) = v10;
  *(_OWORD *)(a2 + 96) = xmmword_121D8;
  *(void *)(a2 + 112) = qword_121E8;
  long long v11 = *(_OWORD *)&qword_12188;
  *(_OWORD *)a2 = xmmword_12178;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = unk_121A8;
  *(_OWORD *)(a2 + 32) = xmmword_12198;
  *(_OWORD *)(a2 + 48) = v12;
}

void sub_57FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = *(void **)(a1 + 32);
    id v5 = v8;
    id v6 = [v4 accentColor];
    [*(id *)(a1 + 32) setComplicationColor:v6];

    uint64_t v7 = [*(id *)(a1 + 32) accentColor];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v7];

    [v5 updateMonochromeColor];
  }
}

void sub_5A50(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = *(void **)(a1 + 32);
    id v5 = v8;
    id v6 = [v4 complicationColor];
    uint64_t v7 = [*(id *)(a1 + 32) interpolatedComplicationColor];
    [*(id *)(a1 + 32) setComplicationColor:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:*(void *)(a1 + 40)];
    [v5 updateMonochromeColor];

    [*(id *)(a1 + 32) setComplicationColor:v6];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v7];
  }
}

void sub_621C(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v52[0] = &off_C8B8;
  v52[1] = &off_C8E8;
  v53[0] = &off_CBF8;
  v53[1] = &off_CC08;
  v3 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
  [v2 scaledValue:v3 withOverrides:29.0];
  *(void *)&xmmword_12178 = v4;

  [v2 scaledValue:0 withOverride:111.0 forSizeClass:95.5];
  *((void *)&xmmword_12178 + 1) = v5;
  v50[0] = &off_C8B8;
  v50[1] = &off_C8E8;
  v51[0] = &off_CC18;
  v51[1] = &off_CC28;
  id v6 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  [v2 scaledValue:v6 withOverrides:23.0];
  qword_12188 = v7;

  v48[0] = &off_C8B8;
  v48[1] = &off_C8E8;
  v49[0] = &off_CC38;
  v49[1] = &off_CC48;
  id v8 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  [v2 scaledValue:v8 withOverrides:6.0];
  qword_12190 = v9;

  [v2 scaledValue:3 withOverride:64.0 forSizeClass:73.0];
  *(void *)&xmmword_12198 = v10;
  *(long long *)((char *)&xmmword_12198 + 8) = xmmword_BD90;
  v46[0] = &off_C8B8;
  v46[1] = &off_C8D0;
  v47[0] = &off_CC58;
  v47[1] = &off_CC48;
  v46[2] = &off_C8E8;
  v47[2] = &off_CC68;
  long long v11 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
  [v2 scaledValue:v11 withOverrides:7.0];
  qword_121B0 = v12;

  uint64_t v13 = CLKLocaleCurrentNumberSystem();
  switch(v13)
  {
    case 2:
      v42[0] = &off_C8B8;
      v42[1] = &off_C8E8;
      v43[0] = &off_CC98;
      v43[1] = &off_CC88;
      double v15 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
      double v16 = 11.5;
LABEL_7:
      [v2 scaledValue:v15 withOverrides:v16];
      *(void *)&xmmword_121B8 = v17;

      break;
    case 1:
      v44[0] = &off_C8B8;
      v44[1] = &off_C8E8;
      v45[0] = &off_CC78;
      v45[1] = &off_CC88;
      double v15 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      double v16 = 11.0;
      goto LABEL_7;
    case 0:
      [v2 scaledValue:3 withOverride:8.5 forSizeClass:9.0];
      *(void *)&xmmword_121B8 = v14;
      break;
  }
  v40[0] = &off_C8B8;
  v40[1] = &off_C8E8;
  v41[0] = &off_CC08;
  v41[1] = &off_CCA8;
  v18 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v2 scaledValue:v18 withOverrides:31.0];
  *((void *)&xmmword_121B8 + 1) = v19;

  v38[0] = &off_C8B8;
  v38[1] = &off_C8E8;
  v39[0] = &off_CC08;
  v39[1] = &off_CCB8;
  v20 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
  [v2 scaledValue:v20 withOverrides:33.0];
  qword_121C8 = v21;

  v36[0] = &off_C8B8;
  v36[1] = &off_C8E8;
  v37[0] = &off_CCC8;
  v37[1] = &off_CCD8;
  v22 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  [v2 scaledValue:v22 withOverrides:36.0];
  qword_121D0 = v23;

  v34[0] = &off_C8B8;
  v34[1] = &off_C8E8;
  v35[0] = &off_CCE8;
  v35[1] = &off_CCF8;
  v24 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  [v2 scaledValue:v24 withOverrides:16.5];
  *(void *)&xmmword_121D8 = v25;

  v32[0] = &off_C8B8;
  v32[1] = &off_C8E8;
  v33[0] = &off_CD08;
  v33[1] = &off_CD18;
  v26 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  [v2 scaledValue:v26 withOverrides:33.5];
  *((void *)&xmmword_121D8 + 1) = v27;

  v30[0] = &off_C8B8;
  v30[1] = &off_C8E8;
  v31[0] = &off_CD28;
  v31[1] = &off_CD38;
  v28 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v2 scaledValue:v28 withOverrides:55.0];
  qword_121E8 = v29;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKLocaleNumberSystemPrefix()
{
  return _CLKLocaleNumberSystemPrefix();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return _CLKPixelAlignRectForDevice();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return _CLKRectCenteredIntegralRectForDevice();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilitySmallComplicationTypes()
{
  return _NTKAllUtilitySmallComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCSecondHandCenterOffset()
{
  return _NTKCSecondHandCenterOffset();
}

uint64_t NTKColorByPremultiplyingAlpha()
{
  return _NTKColorByPremultiplyingAlpha();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKDefaultFaceColorForDeviceCollection()
{
  return _NTKDefaultFaceColorForDeviceCollection();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKKeylineCornerRadiusSmall()
{
  return _NTKKeylineCornerRadiusSmall();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

id objc_msgSend__createBackgroundViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createBackgroundViewIfNeeded];
}

id objc_msgSend__dateComplicationCenterOffset(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationCenterOffset];
}

id objc_msgSend__dateComplicationRightAlignment(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationRightAlignment];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__isShowingStatus(void *a1, const char *a2, ...)
{
  return [a1 _isShowingStatus];
}

id objc_msgSend__keylineViewForDensityEditing(void *a1, const char *a2, ...)
{
  return [a1 _keylineViewForDensityEditing];
}

id objc_msgSend__swatchImageFaceName(void *a1, const char *a2, ...)
{
  return [a1 _swatchImageFaceName];
}

id objc_msgSend__updateComplicationOverlapHiding(void *a1, const char *a2, ...)
{
  return [a1 _updateComplicationOverlapHiding];
}

id objc_msgSend__updateDateComplicationPositionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _updateDateComplicationPositionIfNecessary];
}

id objc_msgSend_accentColor(void *a1, const char *a2, ...)
{
  return [a1 accentColor];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alternativeTickColor(void *a1, const char *a2, ...)
{
  return [a1 alternativeTickColor];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
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

id objc_msgSend_dateStyle(void *a1, const char *a2, ...)
{
  return [a1 dateStyle];
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

id objc_msgSend_faceViewWantsComplicationKeylineFramesReloaded(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsComplicationKeylineFramesReloaded];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_interpolatedComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 interpolatedComplicationColor];
}

id objc_msgSend_largeTick(void *a1, const char *a2, ...)
{
  return [a1 largeTick];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_maxDateWidthLeavingRoomForKeylines(void *a1, const char *a2, ...)
{
  return [a1 maxDateWidthLeavingRoomForKeylines];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_outerDigits(void *a1, const char *a2, ...)
{
  return [a1 outerDigits];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pillTick(void *a1, const char *a2, ...)
{
  return [a1 pillTick];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_smallTick(void *a1, const char *a2, ...)
{
  return [a1 smallTick];
}

id objc_msgSend_tickColor(void *a1, const char *a2, ...)
{
  return [a1 tickColor];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
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