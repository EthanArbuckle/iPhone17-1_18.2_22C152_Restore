void sub_4AC8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t vars8;

  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v3 = a2;
  v5 = [v2 layer];
  v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

void sub_4F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_4F94(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_114C0);
  id WeakRetained = objc_loadWeakRetained(&qword_114C8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_114C8);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_114C8, v1);
    qword_114D0 = (uint64_t)[v1 version];

    sub_57A4(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_114D0;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_114C0);
  double v9 = *(double *)&qword_114A8;

  return v9;
}

void sub_50A0(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateHourLabelText];
}

void sub_5104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_5118(id a1)
{
  return (NSString *)@"NTKBigNumeralsAnalogFaceView hour label update";
}

void sub_57A4(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:4 forSizeClass:1.05];
  [v2 setScale:5 forSizeClass:1.17];
  v13[0] = &off_CA70;
  v13[1] = &off_CA88;
  v14[0] = &off_CD20;
  v14[1] = &off_CD30;
  v3 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v2 scaledValue:v3 withOverrides:256.0];
  qword_114A8 = v4;

  v11[0] = &off_CA70;
  v11[1] = &off_CA88;
  v12[0] = &off_CD40;
  v12[1] = &off_CD50;
  id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v2 scaledValue:v5 withOverrides:247.0];
  qword_114B0 = v6;

  v9[0] = &off_CA70;
  v9[1] = &off_CAA0;
  v10[0] = &off_CD60;
  v10[1] = &off_CD70;
  v9[2] = &off_CA88;
  v10[2] = &off_CD80;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v2 scaledValue:v7 withOverrides:90.0];
  qword_114B8 = v8;
}

void sub_5AE4(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11540);
  id WeakRetained = objc_loadWeakRetained(&qword_11548);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_11548);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_11550;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_11548, obj);
  qword_11550 = (uint64_t)[obj version];

  sub_6028(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11540);
  long long v10 = *(_OWORD *)&qword_11528;
  *(_OWORD *)(a2 + 64) = xmmword_11518;
  *(_OWORD *)(a2 + 80) = v10;
  *(void *)(a2 + 96) = qword_11538;
  long long v11 = *(_OWORD *)&qword_114E8;
  *(_OWORD *)a2 = xmmword_114D8;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = *(_OWORD *)&qword_11508;
  *(_OWORD *)(a2 + 32) = xmmword_114F8;
  *(_OWORD *)(a2 + 48) = v12;
}

void sub_6028(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setRoundingBehavior:3];
  [v2 scaledValue:3 withOverride:2.875 forSizeClass:3.0];
  *(void *)&xmmword_114D8 = v3;
  [v2 scaledValue:0 withOverride:11.0 forSizeClass:11.0];
  *((void *)&xmmword_114D8 + 1) = v4;
  qword_114E8 = 0x4012000000000000;
  [v2 scaledValue:6.25];
  qword_114F0 = v5;
  xmmword_114F8 = xmmword_9E10;
  v20[0] = &off_CAB8;
  v20[1] = &off_CAD0;
  v21[0] = &off_CD90;
  v21[1] = &off_CDA0;
  v20[2] = &off_CAE8;
  v21[2] = &off_CDB0;
  id v6 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v2 scaledValue:v6 withOverrides:68.0];
  qword_11510 = v7;

  v18[0] = &off_CAB8;
  v18[1] = &off_CAD0;
  v19[0] = &off_CDC0;
  v19[1] = &off_CDD0;
  v18[2] = &off_CAE8;
  v19[2] = &off_CDE0;
  id v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  [v2 scaledValue:v8 withOverrides:41.5];
  qword_11508 = v9;

  *(void *)&xmmword_11518 = 0x4004000000000000;
  v16[0] = &off_CAB8;
  v16[1] = &off_CAD0;
  v17[0] = &off_CDF0;
  v17[1] = &off_CE00;
  v16[2] = &off_CAE8;
  v17[2] = &off_CE10;
  long long v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v2 scaledValue:v10 withOverrides:81.0];
  *((void *)&xmmword_11518 + 1) = v11;

  v14[0] = &off_CAB8;
  v14[1] = &off_CAE8;
  v15[0] = &off_CE20;
  v15[1] = &off_CE30;
  long long v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 scaledValue:v12 withOverrides:14.5];
  qword_11528 = v13;

  unk_11530 = xmmword_9E20;
}

uint64_t sub_732C(uint64_t a1, uint64_t a2)
{
  qword_11558 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_754C(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)NTKBigNumeralsAnalogColorEditOption;
  id v1 = objc_msgSendSuper2(&v4, "_valueToFaceBundleStringDict");
  id v2 = [v1 mutableCopy];

  [v2 setObject:NTKFaceBundleColorBigNumeralsAnalogMulticolorGradient1 forKey:&off_CBA8];
  uint64_t v3 = (void *)qword_11578;
  qword_11578 = (uint64_t)v2;
}

uint64_t sub_7798()
{
  qword_11588 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_7874(id a1)
{
  v3[0] = &off_CBC0;
  v3[1] = &off_CBD8;
  v4[0] = @"fill";
  v4[1] = @"outline";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  id v2 = (void *)qword_115A8;
  qword_115A8 = v1;
}

uint64_t sub_7BC4(uint64_t a1, uint64_t a2)
{
  qword_115B8 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_7D94(id a1)
{
  v3[0] = &off_CBF0;
  v3[1] = &off_CC08;
  v4[0] = NTKFaceBundleBigNumeralsTypefaceWesternArabic;
  v4[1] = NTKFaceBundleBigNumeralsTypefaceEasternArabic;
  void v3[2] = &off_CC20;
  v3[3] = &off_CC38;
  void v4[2] = NTKFaceBundleBigNumeralsTypefaceDevanagari;
  v4[3] = NTKFaceBundleBigNumeralsTypefaceRoman;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_115D8;
  qword_115D8 = v1;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
}

uint64_t NTKFaceColorNameAndCollection()
{
  return _NTKFaceColorNameAndCollection();
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_JSONObjectRepresentation(void *a1, const char *a2, ...)
{
  return [a1 JSONObjectRepresentation];
}

id objc_msgSend__createBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _createBackgroundView];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__largeHandAlpha(void *a1, const char *a2, ...)
{
  return [a1 _largeHandAlpha];
}

id objc_msgSend__lastLineBaseline(void *a1, const char *a2, ...)
{
  return [a1 _lastLineBaseline];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__removeBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _removeBackgroundView];
}

id objc_msgSend__updateHourLabelText(void *a1, const char *a2, ...)
{
  return [a1 _updateHourLabelText];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cleanupTransition(void *a1, const char *a2, ...)
{
  return [a1 cleanupTransition];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
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

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_hourLabel(void *a1, const char *a2, ...)
{
  return [a1 hourLabel];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_typeface(void *a1, const char *a2, ...)
{
  return [a1 typeface];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}