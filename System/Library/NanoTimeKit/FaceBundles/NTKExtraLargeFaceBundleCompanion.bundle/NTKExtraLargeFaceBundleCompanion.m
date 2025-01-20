uint64_t sub_4D68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t vars8;

  v3 = +[NTKPigmentEditOption pigmentNamed:a2];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_4DD0(uint64_t a1, void *a2, unint64_t a3)
{
  id v8 = a2;
  v5 = [*(id *)(a1 + 32) defaultFaceForDevice:*(void *)(a1 + 40)];
  v6 = v5;
  if (v5)
  {
    [v5 selectOption:*(void *)(a1 + 48) forCustomEditMode:17 slot:0];
    v7 = +[NTKNumeralEditOption optionWithNumeral:qword_CF48[a3 % 6] forDevice:*(void *)(a1 + 40)];
    [v6 selectOption:v7 forCustomEditMode:19 slot:0];
    [v6 selectOption:v8 forCustomEditMode:10 slot:0];
    [*(id *)(a1 + 56) addObject:v6];
  }
}

void sub_5F88(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15FC0);
  id WeakRetained = objc_loadWeakRetained(&qword_15FC8);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_15FC8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_15FD0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_15FC8, obj);
  qword_15FD0 = (uint64_t)[obj version];

  sub_9FBC(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15FC0);
  long long v10 = *(_OWORD *)&qword_15FA8;
  *(_OWORD *)(a2 + 64) = xmmword_15F98;
  *(_OWORD *)(a2 + 80) = v10;
  *(void *)(a2 + 96) = qword_15FB8;
  long long v11 = *(_OWORD *)&qword_15F68;
  *(_OWORD *)a2 = xmmword_15F58;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = *(_OWORD *)&qword_15F88;
  *(_OWORD *)(a2 + 32) = xmmword_15F78;
  *(_OWORD *)(a2 + 48) = v12;
}

id sub_6AA8(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateComplicationLayout];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutComplicationViews];
}

id sub_7428(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _complicationView];
  if [v5 isMulticolor] && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) device];
    if (v6)
    {
      long long v10 = +[NTKFaceColorScheme colorSchemeForDevice:v9 withFaceColorPalette:v5 foregroundColor:v6 units:1 alternateHighlight:0];
    }
    else
    {
      long long v11 = [v8 overrideColor];
      long long v10 = +[NTKFaceColorScheme colorSchemeForDevice:v9 withFaceColorPalette:v5 foregroundColor:v11 units:1 alternateHighlight:0];
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) device];
    long long v10 = +[NTKFaceColorScheme colorSchemeForDevice:v8 withFaceColorPalette:v5 units:1];
  }

  return v10;
}

void sub_844C(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadLayoutRules];
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  id v5 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotCenter];
  v4 = [v5 defaultLayoutRuleForState:0];
  [v4 referenceFrame];
  *(double *)&qword_15F38 = CGRectGetMidY(v7) / v3;
}

void sub_9084(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CDRichComplicationTintedPlatterColorOverridable])objc_msgSend(v4, "setTintedFraction:", *(double *)(a1 + 32)); {
  objc_opt_class();
  }
  if (objc_opt_isKindOfClass()) {
    [v4 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
  }
}

void sub_9A0C(id a1, NTKFaceViewController *a2)
{
  double v2 = a2;
  [(NTKFaceViewController *)v2 setDataMode:3];
  [(NTKFaceViewController *)v2 setShowsCanonicalContent:1];
  [(NTKFaceViewController *)v2 setShowContentForUnadornedSnapshot:1];
  [(NTKFaceViewController *)v2 setShowsLockedUI:0];
  [(NTKFaceViewController *)v2 setIgnoreSnapshotImages:1];
  [(NTKFaceViewController *)v2 setShouldUseSampleTemplate:1];
}

void sub_9FBC(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  v57[0] = &off_10870;
  v57[1] = &off_10888;
  v58[0] = &off_10B88;
  v58[1] = &off_10B98;
  v57[2] = &off_108A0;
  v57[3] = &off_108B8;
  v58[2] = &off_10BA8;
  v58[3] = &off_10BB8;
  v57[4] = &off_108D0;
  v57[5] = &off_108E8;
  v58[4] = &off_10BC8;
  v58[5] = &off_10BD8;
  id v4 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:6];
  [v3 scaledValue:v4 withOverrides:55.0];
  qword_15FA8 = v5;

  v55[0] = &off_108D0;
  v55[1] = &off_108E8;
  v56[0] = &off_10BE8;
  v56[1] = &off_10BF8;
  id v6 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  [v3 scaledValue:v6 withOverrides:7.0];
  double v8 = v7;

  CDGraphicExtraLargeComplicationContentDiameter();
  double v10 = v9 + v8 * 2.0;
  [v2 screenBounds];
  double v12 = (v11 - v10) * 0.5;
  v53[0] = &off_10870;
  v53[1] = &off_10888;
  v54[0] = &off_10C08;
  v54[1] = &off_10C18;
  v53[2] = &off_108A0;
  v53[3] = &off_108B8;
  v54[2] = &off_10C28;
  v54[3] = &off_10C38;
  v53[4] = &off_108D0;
  v13 = +[NSNumber numberWithDouble:v12];
  v54[4] = v13;
  v53[5] = &off_108E8;
  v14 = +[NSNumber numberWithDouble:v12];
  v54[5] = v14;
  v15 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:6];
  [v3 scaledValue:v15 withOverrides:13.5];
  qword_15F68 = v16;

  v51[0] = &off_108D0;
  v51[1] = &off_108E8;
  v52[0] = &off_10C48;
  v52[1] = &off_10C48;
  v17 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v3 scaledValue:v17 withOverrides:9.5];
  double v19 = v18;

  double v20 = v19 + *(double *)&qword_15FA8 - v8;
  v49[0] = &off_10870;
  v49[1] = &off_10888;
  v50[0] = &off_10C58;
  v50[1] = &off_10C68;
  v49[2] = &off_108A0;
  v49[3] = &off_10900;
  v50[2] = &off_10C78;
  v50[3] = &off_10C88;
  v50[4] = &off_10BD8;
  v49[4] = &off_108B8;
  v49[5] = &off_108D0;
  v21 = +[NSNumber numberWithDouble:v20];
  v50[5] = v21;
  v49[6] = &off_108E8;
  v22 = +[NSNumber numberWithDouble:v20];
  v50[6] = v22;
  v23 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:7];
  [v3 scaledValue:v23 withOverrides:58.0];
  qword_15F70 = v24;

  v47[0] = &off_10870;
  v47[1] = &off_108A0;
  v48[0] = &off_10C98;
  v48[1] = &off_10CA8;
  v47[2] = &off_10918;
  v47[3] = &off_10900;
  v48[2] = &off_10CB8;
  v48[3] = &off_10CC8;
  v48[4] = &off_10CC8;
  v47[4] = &off_108B8;
  v47[5] = &off_108D0;
  v25 = +[NSNumber numberWithDouble:v10];
  v48[5] = v25;
  v47[6] = &off_108E8;
  v26 = +[NSNumber numberWithDouble:v10];
  v48[6] = v26;
  v27 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:7];
  [v3 scaledValue:v27 withOverrides:135.0];
  *(void *)&xmmword_15F78 = v28;

  *((void *)&xmmword_15F78 + 1) = xmmword_15F78;
  v45[0] = &off_10870;
  v45[1] = &off_10888;
  v46[0] = &off_10CD8;
  v46[1] = &off_10CD8;
  v45[2] = &off_108A0;
  v46[2] = &off_10CE8;
  v29 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
  [v3 scaledValue:v29 withOverrides:23.0];
  qword_15F88 = v30;

  v43[0] = &off_10870;
  v43[1] = &off_10888;
  v44[0] = &off_10CF8;
  v44[1] = &off_10D08;
  v43[2] = &off_108A0;
  v44[2] = &off_10D18;
  v31 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
  [v3 scaledValue:v31 withOverrides:2.5];
  qword_15F90 = v32;

  *(void *)&xmmword_15F98 = 0x401E000000000000;
  v41[0] = &off_10870;
  v41[1] = &off_10888;
  v42[0] = &off_10CF8;
  v42[1] = &off_10D08;
  v41[2] = &off_108A0;
  v41[3] = &off_10918;
  v42[2] = &off_10D18;
  v42[3] = &off_10D28;
  v41[4] = &off_10900;
  v41[5] = &off_108B8;
  v42[4] = &off_10D18;
  v42[5] = &off_10D18;
  v33 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:6];
  [v3 constantValue:v33 withOverrides:2.5];
  *((void *)&xmmword_15F98 + 1) = v34;

  v39[0] = &off_10870;
  v39[1] = &off_108A0;
  v40[0] = &off_10D38;
  v40[1] = &off_10D48;
  v35 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  [v3 scaledValue:v35 withOverrides:63.0];
  qword_15FB0 = v36;

  [v2 screenBounds];
  +[NTKGossamerColorPalette contentScaleForTintedBackground];
  CLKFloorForDevice();
  uint64_t v38 = v37;

  qword_15FB8 = v38;
}

uint64_t CDGraphicExtraLargeComplicationContentDiameter()
{
  return _CDGraphicExtraLargeComplicationContentDiameter();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKFloorForDevice()
{
  return _CLKFloorForDevice();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleNumberSystemForFirstLanguage()
{
  return _CLKLocaleNumberSystemForFirstLanguage();
}

uint64_t CLKLocaleNumberSystemFromNumeralOption()
{
  return _CLKLocaleNumberSystemFromNumeralOption();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t NTKAllExtraLargeComplicationTypes()
{
  return _NTKAllExtraLargeComplicationTypes();
}

uint64_t NTKAllGraphicExtraLargeComplicationTypes()
{
  return _NTKAllGraphicExtraLargeComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
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

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKMultiFamilyComplicationSlotDescriptor()
{
  return _NTKMultiFamilyComplicationSlotDescriptor();
}

uint64_t NTKNumeralOptionFromCLKLocaleNumberSystem()
{
  return _NTKNumeralOptionFromCLKLocaleNumberSystem();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
}

uint64_t NTKShowIndicScriptNumerals()
{
  return _NTKShowIndicScriptNumerals();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__applyColorsFromLastAppliedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 _applyColorsFromLastAppliedColorPalette];
}

id objc_msgSend__complicationView(void *a1, const char *a2, ...)
{
  return [a1 _complicationView];
}

id objc_msgSend__configureLargeTimeLabelColors(void *a1, const char *a2, ...)
{
  return [a1 _configureLargeTimeLabelColors];
}

id objc_msgSend__configureSmallTimeLabelColors(void *a1, const char *a2, ...)
{
  return [a1 _configureSmallTimeLabelColors];
}

id objc_msgSend__configureSmallTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 _configureSmallTimeLabelStyle];
}

id objc_msgSend__createTimeViews(void *a1, const char *a2, ...)
{
  return [a1 _createTimeViews];
}

id objc_msgSend__defaultBackgroundOption(void *a1, const char *a2, ...)
{
  return [a1 _defaultBackgroundOption];
}

id objc_msgSend__initLargeTimeLabelIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _initLargeTimeLabelIfNecessary];
}

id objc_msgSend__initSmallTimeLabelIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _initSmallTimeLabelIfNecessary];
}

id objc_msgSend__layoutForegroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 _layoutForegroundContainerView];
}

id objc_msgSend__layoutSmallTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 _layoutSmallTimeLabel];
}

id objc_msgSend__loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 _loadLayoutRules];
}

id objc_msgSend__noteComplicationVisibilityChanged(void *a1, const char *a2, ...)
{
  return [a1 _noteComplicationVisibilityChanged];
}

id objc_msgSend__removeTimeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeTimeViews];
}

id objc_msgSend__richComplicationSecondaryColor(void *a1, const char *a2, ...)
{
  return [a1 _richComplicationSecondaryColor];
}

id objc_msgSend__smallTimeLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _smallTimeLabelFont];
}

id objc_msgSend__statusBarOffsetForComplication(void *a1, const char *a2, ...)
{
  return [a1 _statusBarOffsetForComplication];
}

id objc_msgSend__statusBarOffsetForComplicationBackground(void *a1, const char *a2, ...)
{
  return [a1 _statusBarOffsetForComplicationBackground];
}

id objc_msgSend__statusBarOffsetForSmallTime(void *a1, const char *a2, ...)
{
  return [a1 _statusBarOffsetForSmallTime];
}

id objc_msgSend__timeLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _timeLabelFont];
}

id objc_msgSend__updateComplicationVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateComplicationVisibility];
}

id objc_msgSend_accentColor(void *a1, const char *a2, ...)
{
  return [a1 accentColor];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return [a1 backgroundStyle];
}

id objc_msgSend_bottomAccentColor(void *a1, const char *a2, ...)
{
  return [a1 bottomAccentColor];
}

id objc_msgSend_bottomApproximateBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 bottomApproximateBackgroundColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationIsVisible(void *a1, const char *a2, ...)
{
  return [a1 complicationIsVisible];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_composedView(void *a1, const char *a2, ...)
{
  return [a1 composedView];
}

id objc_msgSend_containsOverrideFaceColor(void *a1, const char *a2, ...)
{
  return [a1 containsOverrideFaceColor];
}

id objc_msgSend_contentScaleForTintedBackground(void *a1, const char *a2, ...)
{
  return [a1 contentScaleForTintedBackground];
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

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_faceClass(void *a1, const char *a2, ...)
{
  return [a1 faceClass];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceView(void *a1, const char *a2, ...)
{
  return [a1 faceView];
}

id objc_msgSend_faceViewDidChangePaddingForStatusBar(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangePaddingForStatusBar];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_faceViewWantsComplicationKeylineFramesReloaded(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsComplicationKeylineFramesReloaded];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_foregroundGradientFraction(void *a1, const char *a2, ...)
{
  return [a1 foregroundGradientFraction];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_freeze(void *a1, const char *a2, ...)
{
  return [a1 freeze];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_largeTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 largeTimeLabel];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutComplicationViews(void *a1, const char *a2, ...)
{
  return [a1 layoutComplicationViews];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return [a1 legibilityWeight];
}

id objc_msgSend_loadComplicationPlaceholderViews(void *a1, const char *a2, ...)
{
  return [a1 loadComplicationPlaceholderViews];
}

id objc_msgSend_monochromeFraction(void *a1, const char *a2, ...)
{
  return [a1 monochromeFraction];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nullComplication(void *a1, const char *a2, ...)
{
  return [a1 nullComplication];
}

id objc_msgSend_numeralOption(void *a1, const char *a2, ...)
{
  return [a1 numeralOption];
}

id objc_msgSend_overrideColor(void *a1, const char *a2, ...)
{
  return [a1 overrideColor];
}

id objc_msgSend_performWristRaiseAnimation(void *a1, const char *a2, ...)
{
  return [a1 performWristRaiseAnimation];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pigmentFaceDomain(void *a1, const char *a2, ...)
{
  return [a1 pigmentFaceDomain];
}

id objc_msgSend_prepareWristRaiseAnimation(void *a1, const char *a2, ...)
{
  return [a1 prepareWristRaiseAnimation];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rootContainerView(void *a1, const char *a2, ...)
{
  return [a1 rootContainerView];
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return [a1 scaleFactor];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_setFrameUsingCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 setFrameUsingCurrentStyle];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_showContentForUnadornedSnapshot(void *a1, const char *a2, ...)
{
  return [a1 showContentForUnadornedSnapshot];
}

id objc_msgSend_showForegroundGradient(void *a1, const char *a2, ...)
{
  return [a1 showForegroundGradient];
}

id objc_msgSend_smallTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 smallTimeLabel];
}

id objc_msgSend_smallTimeLabelFontScaleFactorForNumberSystemOverrides(void *a1, const char *a2, ...)
{
  return [a1 smallTimeLabelFontScaleFactorForNumberSystemOverrides];
}

id objc_msgSend_swatchComplicationPlaceholderColor(void *a1, const char *a2, ...)
{
  return [a1 swatchComplicationPlaceholderColor];
}

id objc_msgSend_swatchesCache(void *a1, const char *a2, ...)
{
  return [a1 swatchesCache];
}

id objc_msgSend_swatchesFace(void *a1, const char *a2, ...)
{
  return [a1 swatchesFace];
}

id objc_msgSend_swatchesFaceViewController(void *a1, const char *a2, ...)
{
  return [a1 swatchesFaceViewController];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_tintedFraction(void *a1, const char *a2, ...)
{
  return [a1 tintedFraction];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_topAccentColor(void *a1, const char *a2, ...)
{
  return [a1 topAccentColor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_tritiumPalette(void *a1, const char *a2, ...)
{
  return [a1 tritiumPalette];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}