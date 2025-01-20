void sub_52D4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  unsigned char v17[128];

  v2 = +[NSMutableDictionary dictionary];
  v3 = (void *)qword_114B8;
  qword_114B8 = v2;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_opt_class();
  v5 = [*(id *)(a1 + 32) device];
  v6 = [v4 _orderedValuesForDevice:v5];

  v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    v8 = v7;
    v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"color %lu", [v11 unsignedIntValue]);
        [(id)qword_114B8 setObject:v12 forKeyedSubscript:v11];
      }
      v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void sub_6F20(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v4 = [v9 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = v9;
  if (isKindOfClass)
  {
    v7 = [v9 display];
    v8 = v7;
    if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41)) {
      [v7 transitionToMonochromeWithFraction:*(double *)(a1 + 32)];
    }
    else {
      [v7 updateMonochromeColor];
    }

    v6 = v9;
  }
}

void sub_72E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  v4 = [v9 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = v9;
  if (isKindOfClass)
  {
    v7 = [v9 display];
    v8 = v7;
    if (*(unsigned char *)(a1 + 32)) {
      [v7 transitionToMonochromeWithFraction:0.0];
    }
    else {
      [v7 updateMonochromeColor];
    }

    v6 = v9;
  }
}

void sub_78F8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  id v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKUIDefaultAlternateComplicationColor()
{
  return _CLKUIDefaultAlternateComplicationColor();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureRectangularTypes()
{
  return _NTKAllSignatureRectangularTypes();
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

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKSensitivityForVictoryFaces()
{
  return _NTKSensitivityForVictoryFaces();
}

uint64_t NTKShowVictoryFaces()
{
  return _NTKShowVictoryFaces();
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

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend__applyColorToAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 _applyColorToAnalogHands];
}

id objc_msgSend__cleanupTransitions(void *a1, const char *a2, ...)
{
  return [a1 _cleanupTransitions];
}

id objc_msgSend__createAnalogBackgroundIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createAnalogBackgroundIfNeeded];
}

id objc_msgSend__createAndRemoveViewsForCurrentStateIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createAndRemoveViewsForCurrentStateIfNeeded];
}

id objc_msgSend__createOlympusViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _createOlympusViewIfNeeded];
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

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__setupViewsForCurrentState(void *a1, const char *a2, ...)
{
  return [a1 _setupViewsForCurrentState];
}

id objc_msgSend__tearDownAnalogView(void *a1, const char *a2, ...)
{
  return [a1 _tearDownAnalogView];
}

id objc_msgSend__tearDownOlympusView(void *a1, const char *a2, ...)
{
  return [a1 _tearDownOlympusView];
}

id objc_msgSend__updateBackgroundViewAlpha(void *a1, const char *a2, ...)
{
  return [a1 _updateBackgroundViewAlpha];
}

id objc_msgSend__usesOverrideTickColors(void *a1, const char *a2, ...)
{
  return [a1 _usesOverrideTickColors];
}

id objc_msgSend_activeTickColor(void *a1, const char *a2, ...)
{
  return [a1 activeTickColor];
}

id objc_msgSend_analogHandsView(void *a1, const char *a2, ...)
{
  return [a1 analogHandsView];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
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

id objc_msgSend_cleanupAfterEditing(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEditing];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_configureViewsForEditing(void *a1, const char *a2, ...)
{
  return [a1 configureViewsForEditing];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerComplicationsAccentColor(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationsAccentColor];
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

id objc_msgSend_dialBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundView];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digitalContainerView(void *a1, const char *a2, ...)
{
  return [a1 digitalContainerView];
}

id objc_msgSend_digitalTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 digitalTimeLabel];
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

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inactiveTickColor(void *a1, const char *a2, ...)
{
  return [a1 inactiveTickColor];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isBlackColor(void *a1, const char *a2, ...)
{
  return [a1 isBlackColor];
}

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutOlympusView(void *a1, const char *a2, ...)
{
  return [a1 layoutOlympusView];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_multicolorPaletteReplacement(void *a1, const char *a2, ...)
{
  return [a1 multicolorPaletteReplacement];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pigmentFaceDomain(void *a1, const char *a2, ...)
{
  return [a1 pigmentFaceDomain];
}

id objc_msgSend_prepareForEditing(void *a1, const char *a2, ...)
{
  return [a1 prepareForEditing];
}

id objc_msgSend_primaryTextColor(void *a1, const char *a2, ...)
{
  return [a1 primaryTextColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_secondHandColor(void *a1, const char *a2, ...)
{
  return [a1 secondHandColor];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_shibaTimeView(void *a1, const char *a2, ...)
{
  return [a1 shibaTimeView];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_supportsVictoryFaces(void *a1, const char *a2, ...)
{
  return [a1 supportsVictoryFaces];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
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

id objc_msgSend_willBeginEditing(void *a1, const char *a2, ...)
{
  return [a1 willBeginEditing];
}