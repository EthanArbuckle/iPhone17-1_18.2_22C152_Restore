void sub_2EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  objc_super v4;

  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___NTKVictoryAnalogColorEditOption;
  v2 = objc_msgSendSuper2(&v4, "_orderedValuesForDevice:", a2);
  v3 = (void *)qword_12AF8;
  qword_12AF8 = v2;
}

void sub_398C(id a1)
{
  qword_12B18 = _EnumValueRange();

  _objc_release_x1();
}

void sub_3A20(id a1)
{
  qword_12B28 = _EnumValueRange();

  _objc_release_x1();
}

void sub_3B64(id a1)
{
  v3[0] = &off_C9A8;
  v3[1] = &off_C9C0;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_C9D8;
  v3[3] = &off_C9F0;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_CA08;
  v4[4] = NTKFaceBundleStyle5;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  v2 = (void *)qword_12B38;
  qword_12B38 = v1;
}

void sub_3E18(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12B88);
  id WeakRetained = objc_loadWeakRetained(&qword_12B90);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_12B90);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_12B98;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_12B90, obj);
  qword_12B98 = (uint64_t)[obj version];

  sub_6648(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12B88);
  long long v10 = *(_OWORD *)&qword_12B60;
  *(_OWORD *)a2 = xmmword_12B50;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_12B70;
  *(void *)(a2 + 48) = qword_12B80;
}

void sub_4D10(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [a3 display];
  [v3 _applyColor:v4 toComplicationView:v5];
}

id sub_5DF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 format];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [*(id *)(a1 + 32) setFill];
  v31.origin.x = v6;
  v31.origin.y = v8;
  v31.size.width = v10;
  v31.size.height = v12;
  UIRectFill(v31);
  v13 = [*(id *)(a1 + 40) layer];
  id v14 = [v3 CGContext];

  [v13 renderInContext:v14];
  [*(id *)(a1 + 48) size];
  UIRectCenteredIntegralRectScale();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [*(id *)(a1 + 56) drawInRect:0];
  v23 = *(void **)(a1 + 64);
  if (v23) {
    objc_msgSend(v23, "drawInRect:", v16, v18, v20, v22);
  }
  objc_msgSend(*(id *)(a1 + 48), "drawInRect:", v16, v18, v20, v22);
  NTKCSecondHandCenterOffset();
  v24 = *(void **)(a1 + 72);
  double v26 = v6 + v10 * 0.5 - v25;
  double v28 = v8 + v12 * 0.5 - v27;

  return objc_msgSend(v24, "drawAtPoint:", v26, v28);
}

void sub_6648(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  NTKColorFaceViewEdgeGapNormal();
  *(void *)&xmmword_12B50 = v4;
  NTKColorFaceViewEdgeGapEditing();
  *((void *)&xmmword_12B50 + 1) = v5;
  v26[0] = &off_CA38;
  v26[1] = &off_CA50;
  v27[0] = &off_CC88;
  v27[1] = &off_CC88;
  v26[2] = &off_CA68;
  v26[3] = &off_CA80;
  v27[2] = &off_CC98;
  v27[3] = &off_CA98;
  v26[4] = &off_CAB0;
  v27[4] = &off_CCA8;
  double v6 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];
  [v3 scaledValue:v6 withOverrides:2.0];
  uint64_t v8 = v7;

  v24[0] = &off_CA38;
  v24[1] = &off_CA50;
  v25[0] = &off_CC88;
  v25[1] = &off_CC88;
  v24[2] = &off_CA68;
  v25[2] = &off_CCB8;
  double v9 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
  [v3 scaledValue:v9 withOverrides:12.0];
  uint64_t v11 = v10;

  v22[0] = &off_CA38;
  v22[1] = &off_CA50;
  v23[0] = &off_CC88;
  v23[1] = &off_CC88;
  v22[2] = &off_CA68;
  v23[2] = &off_CCC8;
  double v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  [v3 scaledValue:v12 withOverrides:3.0];
  uint64_t v14 = v13;

  v20[0] = &off_CA38;
  v20[1] = &off_CA50;
  v21[0] = &off_CC88;
  v21[1] = &off_CC88;
  v20[2] = &off_CA68;
  v21[2] = &off_CCB8;
  double v15 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  [v3 scaledValue:v15 withOverrides:12.0];
  uint64_t v17 = v16;

  qword_12B60 = v8;
  qword_12B68 = v11;
  *(void *)&xmmword_12B70 = v14;
  *((void *)&xmmword_12B70 + 1) = v17;
  [v2 screenBounds];
  double v19 = v18;

  *(double *)&qword_12B80 = v19 - (*(double *)&qword_12B68 + *((double *)&xmmword_12B70 + 1));
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

uint64_t CLKUIComputeDimmingRequiredToObtainColorAPL()
{
  return _CLKUIComputeDimmingRequiredToObtainColorAPL();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllSmallComplicationTypes()
{
  return _NTKAllSmallComplicationTypes();
}

uint64_t NTKAllUtilityLargeComplicationTypes()
{
  return _NTKAllUtilityLargeComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKBlueRidgeUISensitivity()
{
  return _NTKBlueRidgeUISensitivity();
}

uint64_t NTKCSecondHandCenterOffset()
{
  return _NTKCSecondHandCenterOffset();
}

uint64_t NTKColorFaceViewEdgeGapEditing()
{
  return _NTKColorFaceViewEdgeGapEditing();
}

uint64_t NTKColorFaceViewEdgeGapNormal()
{
  return _NTKColorFaceViewEdgeGapNormal();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKKeylineWidth()
{
  return _NTKKeylineWidth();
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

uint64_t NTKSensitivityForVictoryFaces()
{
  return _NTKSensitivityForVictoryFaces();
}

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
}

uint64_t NTKShowVictoryFaces()
{
  return _NTKShowVictoryFaces();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

void UIRectFill(CGRect rect)
{
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

uint64_t _NTKNewToGraceEVictoryColors()
{
  return __NTKNewToGraceEVictoryColors();
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

id objc_msgSend__stylesInGlory(void *a1, const char *a2, ...)
{
  return [a1 _stylesInGlory];
}

id objc_msgSend__stylesInGrace(void *a1, const char *a2, ...)
{
  return [a1 _stylesInGrace];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
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

id objc_msgSend_cornerComplicationsAccent(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationsAccent];
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

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_dotMarker(void *a1, const char *a2, ...)
{
  return [a1 dotMarker];
}

id objc_msgSend_fall2020VictoryColors(void *a1, const char *a2, ...)
{
  return [a1 fall2020VictoryColors];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_gloryEVictoryColors(void *a1, const char *a2, ...)
{
  return [a1 gloryEVictoryColors];
}

id objc_msgSend_gloryVictoryColors(void *a1, const char *a2, ...)
{
  return [a1 gloryVictoryColors];
}

id objc_msgSend_graceVictoryColors(void *a1, const char *a2, ...)
{
  return [a1 graceVictoryColors];
}

id objc_msgSend_handInlay(void *a1, const char *a2, ...)
{
  return [a1 handInlay];
}

id objc_msgSend_hands(void *a1, const char *a2, ...)
{
  return [a1 hands];
}

id objc_msgSend_hasWhiteElements(void *a1, const char *a2, ...)
{
  return [a1 hasWhiteElements];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
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

id objc_msgSend_isExplorer(void *a1, const char *a2, ...)
{
  return [a1 isExplorer];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
}

id objc_msgSend_isRunningGloryGMOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGloryGMOrLater];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_logo(void *a1, const char *a2, ...)
{
  return [a1 logo];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_numbers(void *a1, const char *a2, ...)
{
  return [a1 numbers];
}

id objc_msgSend_numbersColor(void *a1, const char *a2, ...)
{
  return [a1 numbersColor];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_prelaunchApplicationIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 prelaunchApplicationIdentifiers];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_scaleView(void *a1, const char *a2, ...)
{
  return [a1 scaleView];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_selectedKeylineHeight(void *a1, const char *a2, ...)
{
  return [a1 selectedKeylineHeight];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_spring2020VictoryColors(void *a1, const char *a2, ...)
{
  return [a1 spring2020VictoryColors];
}

id objc_msgSend_spring2021VictoryColors(void *a1, const char *a2, ...)
{
  return [a1 spring2021VictoryColors];
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

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_victoryColor(void *a1, const char *a2, ...)
{
  return [a1 victoryColor];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_willBeginEditing(void *a1, const char *a2, ...)
{
  return [a1 willBeginEditing];
}