double sub_4F38(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_116F8);
  WeakRetained = objc_loadWeakRetained(&qword_11700);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&qword_11700);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&qword_11700, v1);
    qword_11708 = (uint64_t)[v1 version];

    sub_7908(v8, v1);
    goto LABEL_6;
  }
  v5 = [v1 version];
  v6 = qword_11708;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_116F8);
  v9 = *(double *)&qword_116D8;

  return v9;
}

void sub_6ABC(uint64_t a1, uint64_t a2)
{
  id v8 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  v3 = [v8 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = v8;
  if (isKindOfClass)
  {
    v6 = [v8 display];
    v7 = v6;
    if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 49)) {
      [v6 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
    }
    else {
      [v6 updateMonochromeColor];
    }

    v5 = v8;
  }
}

void sub_6B80(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setBezelTextColor:v3];
  [v4 setBezelTextRadius:*(double *)(*(void *)(a1 + 40) + 32)];
}

void sub_6BE8(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v4 = [v7 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v7 display];
    objc_msgSend(v6, "transitThemeFromTheme:toTheme:fraction:", objc_msgSend(*(id *)(a1 + 32), "_richComplicationViewThemeFromFaceColorPalette:", *(void *)(a1 + 40)), objc_msgSend(*(id *)(a1 + 32), "_richComplicationViewThemeFromFaceColorPalette:", *(void *)(a1 + 40)), *(double *)(a1 + 48));
  }
}

void sub_722C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7248(uint64_t a1, double a2, double a3, double a4)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    id v8 = [WeakRetained device];
    NTKWhistlerBezelCircularViewDefaultAngularWidthPadding();
    double v10 = v9;

    [v11[2] transitTicksWithInitialBezelTextWidthInRadius:v10 + a2 finalBezelTextWidthInRadius:v10 + a3 fraction:a4];
    WeakRetained = v11;
  }
}

void sub_73D4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timeView];
  [v2 setAlpha:0.33];

  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:0.75];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_7498;
  v4[3] = &unk_C3C0;
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateComplicationDisplayWrappersWithBlock:v4];
}

void sub_7498(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 display];
  id v5 = *(void **)(a1 + 32);

  if (v4 != v5) {
    [v6 setAlpha:0.33];
  }
}

id sub_75D8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timeView];
  [v2 setAlpha:1.0];

  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 enumerateComplicationDisplayWrappersWithBlock:&stru_C468];
}

void sub_7648(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_7654(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) timeView];
  v1 = [v2 layer];
  [v1 setAllowsGroupOpacity:0];
}

void sub_7908(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  v12[0] = &off_C848;
  v12[1] = &off_C860;
  v13[0] = &off_D150;
  v13[1] = &off_D160;
  v12[2] = &off_C878;
  v13[2] = &off_D170;
  id v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v3 scaledValue:v4 withOverrides:68.0];
  qword_116D8 = v5;

  v10[0] = &off_C848;
  v10[1] = &off_C860;
  v11[0] = &off_D180;
  v11[1] = &off_D190;
  v10[2] = &off_C878;
  v11[2] = &off_D1A0;
  id v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v3 scaledValue:v6 withOverrides:70.5];
  qword_116E0 = v7;

  qword_116E8 = 0x3FF0000000000000;
  +[NTKAnalogUtilities largeDialSizeForDevice:v2];
  uint64_t v9 = v8;

  qword_116F0 = v9;
}

id sub_8154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

uint64_t CLKUIAssociatedNonAccentStyle()
{
  return _CLKUIAssociatedNonAccentStyle();
}

uint64_t CLKUIDefaultComplicationBackgroundColor()
{
  return _CLKUIDefaultComplicationBackgroundColor();
}

uint64_t NTKAllSignatureBezelTypes()
{
  return _NTKAllSignatureBezelTypes();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCarbonaraWidgetIntent()
{
  return _NTKCarbonaraWidgetIntent();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
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

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKShowCarbonara()
{
  return _NTKShowCarbonara();
}

uint64_t NTKWhistlerBezelCircularViewDefaultAngularWidthPadding()
{
  return _NTKWhistlerBezelCircularViewDefaultAngularWidthPadding();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__configureUIOnColorChange(void *a1, const char *a2, ...)
{
  return [a1 _configureUIOnColorChange];
}

id objc_msgSend__defaultColorOption(void *a1, const char *a2, ...)
{
  return [a1 _defaultColorOption];
}

id objc_msgSend__editMode(void *a1, const char *a2, ...)
{
  return [a1 _editMode];
}

id objc_msgSend__paddedBezelAngularWidth(void *a1, const char *a2, ...)
{
  return [a1 _paddedBezelAngularWidth];
}

id objc_msgSend__setupDialView(void *a1, const char *a2, ...)
{
  return [a1 _setupDialView];
}

id objc_msgSend__updateDialTicksForBezelText(void *a1, const char *a2, ...)
{
  return [a1 _updateDialTicksForBezelText];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bezelTextAngularWidth(void *a1, const char *a2, ...)
{
  return [a1 bezelTextAngularWidth];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
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

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
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

id objc_msgSend_editModeTransitionFraction(void *a1, const char *a2, ...)
{
  return [a1 editModeTransitionFraction];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isBlackColor(void *a1, const char *a2, ...)
{
  return [a1 isBlackColor];
}

id objc_msgSend_isWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 isWhiteColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_monochromeRichComplicationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 monochromeRichComplicationsEnabled];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_prepareForEdit(void *a1, const char *a2, ...)
{
  return [a1 prepareForEdit];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
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