void sub_4C04(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t vars8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = [v2 layer];
  v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

void sub_502C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5050(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11E80);
  id WeakRetained = objc_loadWeakRetained(&qword_11E88);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_11E88);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_11E90;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_11E88, obj);
  qword_11E90 = (uint64_t)[obj version];

  sub_5D6C(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11E80);
  long long v10 = *(_OWORD *)&qword_11E68;
  *(_OWORD *)(a2 + 32) = xmmword_11E58;
  *(_OWORD *)(a2 + 48) = v10;
  *(void *)(a2 + 64) = qword_11E78;
  long long v11 = *(_OWORD *)&qword_11E48;
  *(_OWORD *)a2 = xmmword_11E38;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_5170(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLabels];
}

void sub_51D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_51E8(id a1)
{
  return (NSString *)@"NTKBigNumeralsDigitalTimeView";
}

BOOL _TopLabelAnalogStyleForStyle(uint64_t a1)
{
  return a1 == 2;
}

BOOL _BottomLabelAnalogStyleForStyle(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void sub_5D6C(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:4 forSizeClass:1.03];
  [v2 setScale:5 forSizeClass:1.15];
  v34[0] = &off_CED0;
  v34[1] = &off_CEE8;
  v35[0] = &off_D5F8;
  v35[1] = &off_D608;
  v3 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  [v2 scaledValue:v3 withOverrides:95.0];
  *(void *)&xmmword_11E38 = v4;

  v32[0] = &off_CED0;
  v32[1] = &off_CEE8;
  v33[0] = &off_D618;
  v33[1] = &off_D628;
  id v5 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
  [v2 scaledValue:v5 withOverrides:91.0];
  *((void *)&xmmword_11E38 + 1) = v6;

  v30[0] = &off_CED0;
  v30[1] = &off_CEE8;
  v31[0] = &off_D638;
  v31[1] = &off_D648;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  [v2 scaledValue:v7 withOverrides:121.0];
  qword_11E48 = v8;

  v28[0] = &off_CED0;
  v28[1] = &off_CF00;
  v29[0] = &off_D658;
  v29[1] = &off_D668;
  v28[2] = &off_CF18;
  v28[3] = &off_CF30;
  v29[2] = &off_D678;
  v29[3] = &off_D688;
  v28[4] = &off_CF48;
  v28[5] = &off_CF60;
  v29[4] = &off_D688;
  v29[5] = &off_D698;
  v28[6] = &off_CF78;
  v29[6] = &off_D6A8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:7];
  [v2 scaledValue:v9 withOverrides:-0.5];
  qword_11E50 = v10;

  v26[0] = &off_CED0;
  v26[1] = &off_CEE8;
  v27[0] = &off_D6B8;
  v27[1] = &off_D6C8;
  long long v11 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v2 scaledValue:v11 withOverrides:-5.0];
  *(void *)&xmmword_11E58 = v12;

  v24[0] = &off_CED0;
  v24[1] = &off_CEE8;
  v25[0] = &off_D6D8;
  v25[1] = &off_D6E8;
  v13 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v2 scaledValue:v13 withOverrides:117.5];
  *((void *)&xmmword_11E58 + 1) = v14;

  v22[0] = &off_CED0;
  v22[1] = &off_CEE8;
  v23[0] = &off_D6F8;
  v23[1] = &off_D658;
  v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  [v2 scaledValue:v15 withOverrides:-0.5];
  qword_11E68 = v16;

  v20[0] = &off_CF00;
  v20[1] = &off_CEE8;
  v21[0] = &off_D708;
  v21[1] = &off_D718;
  v20[2] = &off_CF18;
  v20[3] = &off_CF30;
  v21[2] = &off_D6A8;
  v21[3] = &off_D728;
  v20[4] = &off_CF48;
  v20[5] = &off_CF60;
  v21[4] = &off_D728;
  v21[5] = &off_D738;
  v20[6] = &off_CF78;
  v21[6] = &off_D748;
  v17 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:7];
  [v2 scaledValue:v17 withOverrides:2.0];
  qword_11E70 = v18;

  [v2 scaledValue:2.0];
  qword_11E78 = v19;
}

uint64_t sub_64C4(uint64_t a1, uint64_t a2)
{
  qword_11E98 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_67D4(uint64_t a1)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)NTKBigNumeralsDigitalColorEditOption;
  v1 = objc_msgSendSuper2(&v8, "_valueToFaceBundleStringDict");
  id v2 = [v1 mutableCopy];

  v15[0] = &off_CF90;
  v15[1] = &off_CFA8;
  v16[0] = NTKFaceBundleColorBigNumeralsDualTone1;
  v16[1] = NTKFaceBundleColorBigNumeralsDualTone2;
  v15[2] = &off_CFC0;
  v15[3] = &off_CFD8;
  v16[2] = NTKFaceBundleColorBigNumeralsDualTone3;
  v16[3] = NTKFaceBundleColorBigNumeralsDualTone4;
  v15[4] = &off_CFF0;
  v15[5] = &off_D008;
  v16[4] = NTKFaceBundleColorBigNumeralsDualTone5;
  v16[5] = NTKFaceBundleColorBigNumeralsDualTone6;
  v15[6] = &off_D020;
  v15[7] = &off_D038;
  v16[6] = NTKFaceBundleColorBigNumeralsDualTone7;
  v16[7] = NTKFaceBundleColorBigNumeralsDualTone8;
  v3 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:8];
  [v2 addEntriesFromDictionary:v3];

  v13[0] = &off_D050;
  v13[1] = &off_D068;
  v14[0] = NTKFaceBundleColorBigNumeralsDualTone9;
  v14[1] = NTKFaceBundleColorBigNumeralsDualTone10;
  v13[2] = &off_D080;
  v13[3] = &off_D098;
  v14[2] = NTKFaceBundleColorBigNumeralsDualTone11;
  v14[3] = NTKFaceBundleColorBigNumeralsDualTone12;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  [v2 addEntriesFromDictionary:v4];

  [v2 setObject:NTKFaceBundleColorBigNumeralsDigitalMulticolorGradient1 forKey:&off_D170];
  v11[0] = &off_D0B0;
  v11[1] = &off_D0C8;
  v12[0] = NTKFaceBundleColorBigNumeralsDualTone13;
  v12[1] = NTKFaceBundleColorBigNumeralsDualTone14;
  v11[2] = &off_D0E0;
  v12[2] = NTKFaceBundleColorBigNumeralsDualTone15;
  id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v2 addEntriesFromDictionary:v5];

  v9[0] = &off_D0F8;
  v9[1] = &off_D110;
  v10[0] = NTKFaceBundleColorBigNumeralsDualTone16;
  v10[1] = NTKFaceBundleColorBigNumeralsDualTone17;
  v9[2] = &off_D128;
  v9[3] = &off_D140;
  v10[2] = NTKFaceBundleColorBigNumeralsDualTone18;
  v10[3] = NTKFaceBundleColorBigNumeralsDualTone19;
  v9[4] = &off_D158;
  v10[4] = NTKFaceBundleColorBigNumeralsDualTone20;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  [v2 addEntriesFromDictionary:v6];

  uint64_t v7 = (void *)qword_11EB8;
  qword_11EB8 = (uint64_t)v2;
}

uint64_t sub_7074(uint64_t a1, uint64_t a2)
{
  qword_11EC8 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_71A4(id a1)
{
  v3[0] = &off_D1A0;
  v3[1] = &off_D1B8;
  v4[0] = NTKFaceBundleBigNumeralsTypefaceWesternArabic;
  v4[1] = NTKFaceBundleBigNumeralsTypefaceEasternArabic;
  v3[2] = &off_D1D0;
  v3[3] = &off_D188;
  v4[2] = NTKFaceBundleBigNumeralsTypefaceDevanagari;
  v4[3] = NTKFaceBundleBigNumeralsTypefaceRoman;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_11EE8;
  qword_11EE8 = v1;
}

uint64_t sub_73B0()
{
  qword_11EF8 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_7484(id a1)
{
  v3[0] = &off_D1E8;
  v3[1] = &off_D200;
  v4[0] = @"fill";
  v4[1] = @"half fill";
  v3[2] = &off_D218;
  v4[2] = @"outline";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  id v2 = (void *)qword_11F18;
  qword_11F18 = v1;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
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

uint64_t NTKFaceColorNameForDuotones()
{
  return _NTKFaceColorNameForDuotones();
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

id objc_msgSend__createTimeView(void *a1, const char *a2, ...)
{
  return [a1 _createTimeView];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__lastLineBaseline(void *a1, const char *a2, ...)
{
  return [a1 _lastLineBaseline];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__removeTimeView(void *a1, const char *a2, ...)
{
  return [a1 _removeTimeView];
}

id objc_msgSend__updateLabels(void *a1, const char *a2, ...)
{
  return [a1 _updateLabels];
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

id objc_msgSend_bigNumeralsDigitalTimeViewDidChangeTime(void *a1, const char *a2, ...)
{
  return [a1 bigNumeralsDigitalTimeViewDidChangeTime];
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

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hourDigits(void *a1, const char *a2, ...)
{
  return [a1 hourDigits];
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

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
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

id objc_msgSend_minuteDigits(void *a1, const char *a2, ...)
{
  return [a1 minuteDigits];
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

id objc_msgSend_primaryShiftedColor(void *a1, const char *a2, ...)
{
  return [a1 primaryShiftedColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
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

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_typeface(void *a1, const char *a2, ...)
{
  return [a1 typeface];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}