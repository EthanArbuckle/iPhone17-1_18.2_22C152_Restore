double sub_1D84(void *a1)
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
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12128);
  WeakRetained = objc_loadWeakRetained(&qword_12130);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&qword_12130);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&qword_12130, v1);
    qword_12138 = (uint64_t)[v1 version];

    sub_5504(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = [v1 version];
  v6 = qword_12138;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12128);
  v9 = *(double *)&qword_12110;

  return v9;
}

void sub_3BC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v3, "setAlpha:");
}

void sub_42D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = [v4 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGAffineTransformMakeScale(&v8, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 32));
    [v4 setContentTransform:&v8];
    v7 = [v4 display];
    [v7 updateMonochromeColor];
  }
}

void sub_4404(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = [v5 display];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityFlatComplicationView])
  {
    unsigned int v7 = [v8 isEqualToString:NTKComplicationSlotBezel];

    if (!v7) {
      goto LABEL_5;
    }
    v6 = [v5 display];
    [v6 setForegroundColor:*(void *)(a1 + 32)];
  }

LABEL_5:
}

void sub_5504(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:3 withOverride:133.0 forSizeClass:151.0];
  qword_12110 = v2;
  [v5 scaledValue:3 withOverride:155.0 forSizeClass:176.0];
  qword_12118 = v3;
  [v5 scaledValue:3 withOverride:162.0 forSizeClass:184.0];
  qword_12120 = v4;
}

void sub_6270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v4 _colorOptionFromColorValue:30 device:*(void *)(a1 + 40)];
  id v9 = [v4 _olympusFaceWithStyle:a2 dial:0 colorOption:v5 complicationTypesBySlot:*(void *)(a1 + 48) forDevice:*(void *)(a1 + 40)];

  if (v9) {
    [*(id *)(a1 + 56) addObject:v9];
  }
  v6 = *(void **)(a1 + 32);
  unsigned int v7 = [v6 _colorOptionFromColorValue:30 device:*(void *)(a1 + 40)];
  id v8 = [v6 _olympusFaceWithStyle:a2 dial:1 colorOption:v7 complicationTypesBySlot:*(void *)(a1 + 48) forDevice:*(void *)(a1 + 40)];

  if (v8) {
    [*(id *)(a1 + 56) addObject:v8];
  }
}

uint64_t sub_651C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = [*(id *)(a1 + 32) _olympusFaceWithStyle:a2 dial:a3 colorOption:a4 complicationTypesBySlot:*(void *)(a1 + 40) forDevice:*(void *)(a1 + 48)];
  if (v5) {
    [*(id *)(a1 + 56) addObject:v5];
  }

  return _objc_release_x1();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
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

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
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

uint64_t NTKSensitivityForVictoryFaces()
{
  return _NTKSensitivityForVictoryFaces();
}

uint64_t NTKShowVictoryFaces()
{
  return _NTKShowVictoryFaces();
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

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__createAnalogBackgroundIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createAnalogBackgroundIfNeeded];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__notifyObserversFaceTimeStyleChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyObserversFaceTimeStyleChanged];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__setupController(void *a1, const char *a2, ...)
{
  return [a1 _setupController];
}

id objc_msgSend__setupDialViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setupDialViewIfNeeded];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__showAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 _showAnalogHands];
}

id objc_msgSend__tearDownAnalogView(void *a1, const char *a2, ...)
{
  return [a1 _tearDownAnalogView];
}

id objc_msgSend__tearDownOlympusView(void *a1, const char *a2, ...)
{
  return [a1 _tearDownOlympusView];
}

id objc_msgSend__unloadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadSnapshotContentViews];
}

id objc_msgSend__updateBackgroundViewAlpha(void *a1, const char *a2, ...)
{
  return [a1 _updateBackgroundViewAlpha];
}

id objc_msgSend__updateDialTicksForBezelText(void *a1, const char *a2, ...)
{
  return [a1 _updateDialTicksForBezelText];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_analogBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 analogBackgroundView];
}

id objc_msgSend_applyColorOnAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 applyColorOnAnalogHands];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bezelComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 bezelComplicationColor];
}

id objc_msgSend_bezelComplicationTextWidthInRadius(void *a1, const char *a2, ...)
{
  return [a1 bezelComplicationTextWidthInRadius];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_circleDiameter(void *a1, const char *a2, ...)
{
  return [a1 circleDiameter];
}

id objc_msgSend_cleanupAfterEdit(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEdit];
}

id objc_msgSend_cleanupAfterEditing(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEditing];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
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

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_configureViewsForEditing(void *a1, const char *a2, ...)
{
  return [a1 configureViewsForEditing];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contentViewScale(void *a1, const char *a2, ...)
{
  return [a1 contentViewScale];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerComplicationsAccentColor(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationsAccentColor];
}

id objc_msgSend_cornerView(void *a1, const char *a2, ...)
{
  return [a1 cornerView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAndRemoveViewsForCurrentStateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 createAndRemoveViewsForCurrentStateIfNeeded];
}

id objc_msgSend_createOlympusViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 createOlympusViewIfNeeded];
}

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayDate];
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

id objc_msgSend_dialShape(void *a1, const char *a2, ...)
{
  return [a1 dialShape];
}

id objc_msgSend_dialView(void *a1, const char *a2, ...)
{
  return [a1 dialView];
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

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isCircularDialWithBezel(void *a1, const char *a2, ...)
{
  return [a1 isCircularDialWithBezel];
}

id objc_msgSend_largeHandsColor(void *a1, const char *a2, ...)
{
  return [a1 largeHandsColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_olympusView(void *a1, const char *a2, ...)
{
  return [a1 olympusView];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_prelaunchApplicationIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 prelaunchApplicationIdentifiers];
}

id objc_msgSend_prepareForEdit(void *a1, const char *a2, ...)
{
  return [a1 prepareForEdit];
}

id objc_msgSend_prepareForEditing(void *a1, const char *a2, ...)
{
  return [a1 prepareForEditing];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_secondHandColor(void *a1, const char *a2, ...)
{
  return [a1 secondHandColor];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_setupViewsForCurrentState(void *a1, const char *a2, ...)
{
  return [a1 setupViewsForCurrentState];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_showAllTicksInDial(void *a1, const char *a2, ...)
{
  return [a1 showAllTicksInDial];
}

id objc_msgSend_spring2020ComplicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 spring2020ComplicationTypesBySlot];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportsVictoryFaces(void *a1, const char *a2, ...)
{
  return [a1 supportsVictoryFaces];
}

id objc_msgSend_tearDownDialView(void *a1, const char *a2, ...)
{
  return [a1 tearDownDialView];
}

id objc_msgSend_textWidthInRadians(void *a1, const char *a2, ...)
{
  return [a1 textWidthInRadians];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_updateCircularMask(void *a1, const char *a2, ...)
{
  return [a1 updateCircularMask];
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

id objc_msgSend_willBeginEditing(void *a1, const char *a2, ...)
{
  return [a1 willBeginEditing];
}