id sub_3438(uint64_t a1, void *a2)
{
  return [a2 selectOption:*(void *)(a1 + 32) forCustomEditMode:10 slot:0];
}

id _complicationOrDie(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NTKComplication nullComplication];
  }
  v4 = v3;

  return v4;
}

void sub_34A8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3564;
  v6[3] = &unk_8320;
  id v7 = [v3 copy];
  id v5 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];

  [*(id *)(a1 + 40) addObject:v5];
}

id sub_3564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

void sub_3B00(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_CBC8);
  id WeakRetained = objc_loadWeakRetained(&qword_CBD0);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_CBD0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_CBD8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_CBD0, obj);
  qword_CBD8 = (uint64_t)[obj version];

  sub_4F04(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_CBC8);
  long long v10 = *(_OWORD *)&qword_CBB0;
  *(_OWORD *)(a2 + 32) = xmmword_CBA0;
  *(_OWORD *)(a2 + 48) = v10;
  *(void *)(a2 + 64) = qword_CBC0;
  long long v11 = *(_OWORD *)&qword_CB90;
  *(_OWORD *)a2 = xmmword_CB80;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_42F0(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  id v3 = [v5 display];
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48)) {
    [v3 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
  }
  else {
    [v3 updateMonochromeColor];
  }
}

void sub_4938(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 72;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    uint64_t v4 = 48;
  }
  double v5 = *(double *)(a1 + v4);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 128);
  uint64_t v8 = *(void *)(a1 + 32);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  long long v12 = *(_OWORD *)(a1 + 152);
  long long v32 = *(_OWORD *)(a1 + 136);
  long long v33 = v12;
  long long v34 = *(_OWORD *)(a1 + 168);
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    uint64_t v13 = 88;
  }
  else {
    uint64_t v13 = 80;
  }
  v14 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v8, 3, 3, 0, &v32, v5, v6, v7, v7, UIEdgeInsetsZero.top, left, bottom, right);
  v15 = objc_msgSend(*(id *)(a1 + 40), "complicationLayoutforSlot:", NTKComplicationSlotTopLeft, v32, v33, v34);
  [v15 setDefaultLayoutRule:v14 forState:a2];

  double v16 = *(double *)(a1 + 184) + *(double *)(a1 + 192);
  double v17 = *(double *)(a1 + 200);
  double v18 = *(double *)(a1 + 208);
  double v19 = *(double *)(a1 + 216);
  double v20 = v6 + v16 * v17;
  double v21 = *(double *)(a1 + 48);
  double v22 = *(double *)(a1 + v13) + v20 + v16 * (1.0 - v17) * 0.5 - v19 * (1.0 - v17) * 0.5;
  uint64_t v23 = *(void *)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 152);
  long long v32 = *(_OWORD *)(a1 + 136);
  long long v33 = v24;
  long long v34 = *(_OWORD *)(a1 + 168);
  v25 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v23, 3, 3, 0, &v32, v21, v22, v18, v19, UIEdgeInsetsZero.top, left, bottom, right);
  v26 = [*(id *)(a1 + 40) complicationLayoutforSlot:NTKComplicationSlotCenter];
  [v26 setDefaultLayoutRule:v25 forState:a2];

  double v27 = v22 + v19 * *(double *)(a1 + 200) + *(double *)(a1 + v13);
  uint64_t v28 = *(void *)(a1 + 32);
  long long v29 = *(_OWORD *)(a1 + 152);
  long long v32 = *(_OWORD *)(a1 + 136);
  long long v33 = v29;
  long long v34 = *(_OWORD *)(a1 + 168);
  v30 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v28, 3, 3, 0, &v32, v21, v27, v18, v19, UIEdgeInsetsZero.top, left, bottom, right);
  v31 = [*(id *)(a1 + 40) complicationLayoutforSlot:NTKComplicationSlotBottom];
  [v31 setDefaultLayoutRule:v30 forState:a2];
}

void sub_4F04(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:4];
  [v3 setRoundingBehavior:0];
  v35[0] = &off_8AE0;
  v35[1] = &off_8AF8;
  v36[0] = &off_8DD8;
  v36[1] = &off_8DD8;
  v35[2] = &off_8B10;
  v35[3] = &off_8B28;
  v36[2] = &off_8DD8;
  v36[3] = &off_8DD8;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  [v3 scaledValue:v4 withOverrides:0.9434];
  *(void *)&xmmword_CB80 = v5;

  [v3 setRoundingBehavior:1];
  NTKWhistlerSubdialComplicationDiameter();
  double v7 = v6;
  NTKWhistlerSubdialComplicationContentDiameter();
  double v9 = (v7 - v8) * 0.5;
  NTKWhistlerSubdialComplicationContentDiameter();
  double v11 = v10;

  double v12 = (v11 - v11 * *(double *)&xmmword_CB80) * 0.5;
  *((double *)&xmmword_CB80 + 1) = 12.0 - v9 - v12;
  [v3 scaledValue:8.0];
  *(double *)&qword_CB90 = v13 - v9 - v12;
  v33[0] = &off_8AE0;
  v33[1] = &off_8AF8;
  v34[0] = &off_8DE8;
  v34[1] = &off_8DE8;
  v33[2] = &off_8B10;
  v33[3] = &off_8B28;
  v34[2] = &off_8DE8;
  v34[3] = &off_8DE8;
  v14 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
  [v3 scaledValue:v14 withOverrides:5.5];
  qword_CB98 = v15;

  v31[0] = &off_8B40;
  v31[1] = &off_8AF8;
  v32[0] = &off_8DF8;
  v32[1] = &off_8DF8;
  v31[2] = &off_8B10;
  v31[3] = &off_8B28;
  v32[2] = &off_8DF8;
  v32[3] = &off_8DF8;
  double v16 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
  [v3 constantValue:v16 withOverrides:1.0];
  double v18 = v17;

  *(double *)&xmmword_CBA0 = *(double *)&qword_CB98 - v18;
  v29[0] = &off_8AF8;
  v29[1] = &off_8B10;
  v30[0] = &off_8E08;
  v30[1] = &off_8E18;
  v29[2] = &off_8B28;
  v30[2] = &off_8E28;
  double v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
  [v3 scaledValue:v19 withOverrides:8.0];
  *((void *)&xmmword_CBA0 + 1) = v20;

  *(double *)&qword_CBB0 = v11 * 0.5 + *((double *)&xmmword_CB80 + 1) + 2.0;
  v27[0] = &off_8AE0;
  v27[1] = &off_8AF8;
  v28[0] = &off_8E38;
  v28[1] = &off_8E38;
  v27[2] = &off_8B10;
  v27[3] = &off_8B28;
  v28[2] = &off_8E38;
  v28[3] = &off_8E38;
  double v21 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
  [v3 scaledValue:v21 withOverrides:47.0];
  qword_CBB8 = v22;

  v25[0] = &off_8AE0;
  v25[1] = &off_8AF8;
  v26[0] = &off_8E48;
  v26[1] = &off_8E48;
  v25[2] = &off_8B10;
  v25[3] = &off_8B28;
  v26[2] = &off_8E58;
  v26[3] = &off_8E58;
  uint64_t v23 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
  [v3 scaledValue:v23 withOverrides:44.0];
  qword_CBC0 = v24;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKCurrentLocaleIs24HourMode()
{
  return _CLKCurrentLocaleIs24HourMode();
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

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSignatureRectangularTypes()
{
  return _NTKAllSignatureRectangularTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCarbonaraWidgetIntent()
{
  return _NTKCarbonaraWidgetIntent();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKKeylineCornerRadiusLarge()
{
  return _NTKKeylineCornerRadiusLarge();
}

uint64_t NTKKeylineViewWithContinuousCurveCornerRadius()
{
  return _NTKKeylineViewWithContinuousCurveCornerRadius();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKNumeralOptionFromCLKLocaleNumberSystem()
{
  return _NTKNumeralOptionFromCLKLocaleNumberSystem();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowCarbonara()
{
  return _NTKShowCarbonara();
}

uint64_t NTKShowIndicScriptNumerals()
{
  return _NTKShowIndicScriptNumerals();
}

uint64_t NTKWhistlerLargeRectangularComplicationSize()
{
  return _NTKWhistlerLargeRectangularComplicationSize();
}

uint64_t NTKWhistlerSubdialComplicationContentDiameter()
{
  return _NTKWhistlerSubdialComplicationContentDiameter();
}

uint64_t NTKWhistlerSubdialComplicationDiameter()
{
  return _NTKWhistlerSubdialComplicationDiameter();
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

id objc_msgSend__digitalTimeLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _digitalTimeLabelFont];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_digitalTimeLabelFontScaleFactorForNumberSystemOverrides(void *a1, const char *a2, ...)
{
  return [a1 digitalTimeLabelFontScaleFactorForNumberSystemOverrides];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidateDigitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 invalidateDigitalTimeLabelStyle];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_nullComplication(void *a1, const char *a2, ...)
{
  return [a1 nullComplication];
}

id objc_msgSend_numeralOption(void *a1, const char *a2, ...)
{
  return [a1 numeralOption];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_supportsCharon(void *a1, const char *a2, ...)
{
  return [a1 supportsCharon];
}

id objc_msgSend_supportsUrsa(void *a1, const char *a2, ...)
{
  return [a1 supportsUrsa];
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

id objc_msgSend_viewWithLegacyComplicationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWithLegacyComplicationType:");
}