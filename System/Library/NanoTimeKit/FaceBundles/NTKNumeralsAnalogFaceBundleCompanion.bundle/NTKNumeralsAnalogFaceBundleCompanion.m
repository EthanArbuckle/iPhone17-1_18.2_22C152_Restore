uint64_t sub_2C64(uint64_t a1, uint64_t a2)
{
  uint64_t vars8;

  qword_16B50 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_39C0(id a1)
{
  v3[0] = &off_10F38;
  v3[1] = &off_10F80;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_10F68;
  v3[3] = &off_10EF0;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_10F08;
  v3[5] = &off_10F20;
  v4[4] = NTKFaceBundleStyle5;
  v4[5] = NTKFaceBundleStyle6;
  v3[6] = &off_10F50;
  v3[7] = &off_10F98;
  v4[6] = NTKFaceBundleStyle7;
  v4[7] = NTKFaceBundleArabStyle1;
  v3[8] = &off_10FB0;
  v4[8] = NTKFaceBundleDevaStyle1;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:9];
  v2 = (void *)qword_16B70;
  qword_16B70 = v1;
}

id sub_4D18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update12AdjustmentForStatusIndicator];
}

double NTKNumeralsAnalogStyleEditingBoxSize(void *a1)
{
  id v1 = a1;
  sub_54A8(v1, &v5);
  double v2 = *((double *)&v5 + 1);
  sub_54A8(v1, &v4);

  return v2;
}

void sub_54A8(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16BC0);
  id WeakRetained = objc_loadWeakRetained(&qword_16BC8);
  if (WeakRetained)
  {
    long long v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16BC8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16BD0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16BC8, obj);
  qword_16BD0 = (uint64_t)[obj version];

  sub_92CC(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16BC0);
  long long v10 = *(_OWORD *)&qword_16BA0;
  *a2 = xmmword_16B90;
  a2[1] = v10;
  a2[2] = xmmword_16BB0;
}

double NTKNumeralsAnalogEditingVerticalIndent(void *a1)
{
  sub_54A8(a1, v2);
  return v2[0];
}

double NTKNumeralsAnalogColorEditingHourHorizontalIndent(void *a1)
{
  sub_54A8(a1, &v2);
  return v3;
}

double NTKNumeralsAnalogColorEditingHourVerticalindent(void *a1)
{
  sub_54A8(a1, &v2);
  return v3;
}

void sub_5B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5B24(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _displayLinkFired];
}

void sub_5B88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_5B9C(id a1)
{
  return (NSString *)@"numerals-face";
}

void sub_6530(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    double v3 = *(double *)(a1 + 32);
    id v4 = v5;
    [v4 setForegroundAlpha:v3];
    [v4 setForegroundImageAlpha:*(double *)(a1 + 40)];
  }
}

void sub_674C(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 faceColorPalette];
  [v2 _applyFaceColorPalette:v4 toComplicationView:v3];
}

void sub_6AAC(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v6;
    id v5 = [v3 foregroundColor];
    [v4 setForegroundColor:v5];
  }
}

void sub_6C14(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v8 isEqualToString:*(void *)(a1 + 32)])
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v5 display];
    [v6 _configureComplicationView:v7 forSlot:v8];
  }
}

void sub_6E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_6E94(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = (int)[v4 intValue];
  uint64_t v7 = [NTKNumeralsHourView alloc];
  id v8 = [WeakRetained _currentHour];
  uint64_t v9 = [WeakRetained _faceConfiguration];
  id v10 = [(NTKNumeralsHourView *)v7 initForHour:v8 style:v6 faceConfiguration:v9];

  [v10 frame];
  LODWORD(v8) = [v4 intValue];

  uint64_t v11 = (int)v8;
  v12 = [WeakRetained device];
  +[NTKNumeralsAnalogElementsPlacement centerPointFor10NumeralInImageForStyle:v11 forDevice:v12];
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v10, "setFrame:", *(double *)(a1 + 48) * 0.5 - v14, *(double *)(a1 + 56) * 0.5 - v16);

  return v10;
}

void sub_7E5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a3 display];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

void sub_7F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_7FA4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id result = [a2 isHidden];
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  else
  {
    id result = 0;
  }
  *(unsigned char *)(v2 + 24) = (_BYTE)result;
  return result;
}

void sub_82AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_82D0(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    if (*(unsigned char *)(a1 + 56))
    {
      [WeakRetained _updateComplicationPositionWithAnimationProgress:a2];
      id WeakRetained = v9;
    }
    if (*(unsigned char *)(a1 + 57))
    {
      id v5 = (void *)WeakRetained[5];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      id v8 = [v9 _faceConfiguration];
      objc_msgSend(v5, "updateVisibleHour:targetUtilitySlot:faceConfiguration:animationProgress:forEditMode:", v7, v6, v8, objc_msgSend(v9, "toEditMode"), a2);

      id WeakRetained = v9;
    }
  }
}

void sub_8398(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    if (*(unsigned char *)(a1 + 56))
    {
      [WeakRetained _updateComplicationPositionWithAnimationProgress:1.0];
      id WeakRetained = v9;
    }
    if (*(unsigned char *)(a1 + 57))
    {
      id v5 = (void *)WeakRetained[5];
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      id v8 = [v9 _faceConfiguration];
      objc_msgSend(v5, "updateVisibleHour:targetUtilitySlot:faceConfiguration:animationProgress:forEditMode:", v7, v6, v8, objc_msgSend(v9, "toEditMode"), 1.0);

      id WeakRetained = v9;
    }
  }
}

void sub_85CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 configureComplicationViewDisplayWrapper:v6 forSlot:v7];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v6 display];
  [v8 _configureComplicationView:v9 forSlot:v7];

  id v10 = [v6 display];

  [v10 setNeedsLayout];
}

id sub_8680(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

void sub_8F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 96);
  v11[0] = *(_OWORD *)(a1 + 80);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(a1 + 112);
  id v10 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v4, 3, 3, 0, v11, v5, v6, v7, v8, -1.0, -1.0, -1.0, -1.0);
  [*(id *)(a1 + 40) setDefaultLayoutRule:v10 forState:a2];
}

void sub_9210(id a1, UIView *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)v2 updateMonochromeColor];
  }
}

void sub_92CC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 sizeClass];
  CLKValueForDeviceMetrics();
  *(void *)&xmmword_16B90 = v4;
  CLKValueForDeviceMetrics();
  *((void *)&xmmword_16B90 + 1) = v5;
  CLKValueForDeviceMetrics();
  uint64_t v7 = v6;

  qword_16BA0 = v7;
  dword_16BA8 = 5;
  *(void *)&xmmword_16BB0 = 0x4018000000000000;
  double v8 = 4.0;
  if (!v3) {
    double v8 = 2.5;
  }
  *((double *)&xmmword_16BB0 + 1) = v8;
}

void sub_93B0(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v9[0] = &off_110D0;
  v9[1] = &off_110E8;
  v10[0] = &off_11500;
  v10[1] = &off_11510;
  v9[2] = &off_11100;
  v9[3] = &off_11118;
  v10[2] = &off_11520;
  v10[3] = &off_11530;
  id v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  [v2 scaledValue:v3 withOverrides:60.0];
  qword_16BE0 = v4;

  v7[0] = &off_110D0;
  v7[1] = &off_110E8;
  v8[0] = &off_11540;
  v8[1] = &off_11550;
  v7[2] = &off_11100;
  v7[3] = &off_11118;
  v8[2] = &off_11560;
  v8[3] = &off_11570;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  [v2 scaledValue:v5 withOverrides:77.5];
  qword_16BD8 = v6;
}

void sub_9620(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &off_11130;
  v5[1] = &off_11148;
  v6[0] = &off_11580;
  v6[1] = &off_11590;
  v5[2] = &off_11160;
  v5[3] = &off_11178;
  v6[2] = &off_115A0;
  v6[3] = &off_115A0;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:4];
  [v2 scaledValue:v3 withOverrides:17.0];
  qword_16C00 = v4;
}

void sub_9874(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  objc_msgSend(v2, "scaledPoint:", 36.5, 49.5, &off_11190);
  id v3 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[0] = v3;
  v14[1] = &off_111A8;
  objc_msgSend(v2, "scaledPoint:", 37.0, 49.5);
  uint64_t v4 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[1] = v4;
  v14[2] = &off_111C0;
  objc_msgSend(v2, "scaledPoint:", 36.5, 49.5);
  uint64_t v5 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[2] = v5;
  v14[3] = &off_11130;
  objc_msgSend(v2, "scaledPoint:", 36.5, 49.5);
  uint64_t v6 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[3] = v6;
  v14[4] = &off_11148;
  objc_msgSend(v2, "scaledPoint:", 36.5, 49.5);
  uint64_t v7 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[4] = v7;
  v14[5] = &off_11160;
  objc_msgSend(v2, "scaledPoint:", 36.5, 49.5);
  double v8 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[5] = v8;
  v14[6] = &off_11178;
  objc_msgSend(v2, "scaledPoint:", 38.0, 49.5);
  long long v9 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[6] = v9;
  v14[7] = &off_111D8;
  objc_msgSend(v2, "scaledPoint:", 33.5, 50.5);
  id v10 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[7] = v10;
  v14[8] = &off_111F0;
  objc_msgSend(v2, "scaledPoint:", 33.5, 50.0);
  uint64_t v11 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  v15[8] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];
  double v13 = (void *)qword_16C20;
  qword_16C20 = v12;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenPoints()
{
  return _CLKInterpolateBetweenPoints();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKValueForDeviceMetrics()
{
  return _CLKValueForDeviceMetrics();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllUtilitySmallComplicationTypes()
{
  return _NTKAllUtilitySmallComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
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

uint64_t NTKDateHourIn12HourTime()
{
  return _NTKDateHourIn12HourTime();
}

uint64_t NTKDefaultFaceColorForDeviceCollection()
{
  return _NTKDefaultFaceColorForDeviceCollection();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKGraphicCircularScaledComplicationDiameter()
{
  return _NTKGraphicCircularScaledComplicationDiameter();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKKeylineCornerRadiusSmall()
{
  return _NTKKeylineCornerRadiusSmall();
}

uint64_t NTKKeylineViewWithContinuousCurveCornerRadius()
{
  return _NTKKeylineViewWithContinuousCurveCornerRadius();
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

uint64_t NTKWhistlerSubdialComplicationContentDiameter()
{
  return _NTKWhistlerSubdialComplicationContentDiameter();
}

uint64_t NTKWhistlerSubdialComplicationDiameter()
{
  return _NTKWhistlerSubdialComplicationDiameter();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend__cleanupAfterStyleEditing(void *a1, const char *a2, ...)
{
  return [a1 _cleanupAfterStyleEditing];
}

id objc_msgSend__complicationPlacementForCurrentHour(void *a1, const char *a2, ...)
{
  return [a1 _complicationPlacementForCurrentHour];
}

id objc_msgSend__configureForStyleEditing(void *a1, const char *a2, ...)
{
  return [a1 _configureForStyleEditing];
}

id objc_msgSend__currentHour(void *a1, const char *a2, ...)
{
  return [a1 _currentHour];
}

id objc_msgSend__displayLinkFired(void *a1, const char *a2, ...)
{
  return [a1 _displayLinkFired];
}

id objc_msgSend__faceConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _faceConfiguration];
}

id objc_msgSend__faceCurrentDate(void *a1, const char *a2, ...)
{
  return [a1 _faceCurrentDate];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return [a1 _imageThatSuppressesAccessibilityHairlineThickening];
}

id objc_msgSend__isInTimeTravel(void *a1, const char *a2, ...)
{
  return [a1 _isInTimeTravel];
}

id objc_msgSend__keylineFrameForStyleEditing(void *a1, const char *a2, ...)
{
  return [a1 _keylineFrameForStyleEditing];
}

id objc_msgSend__loadHoursManagerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _loadHoursManagerIfNecessary];
}

id objc_msgSend__loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 _loadLayoutRules];
}

id objc_msgSend__unloadInvisibleHours(void *a1, const char *a2, ...)
{
  return [a1 _unloadInvisibleHours];
}

id objc_msgSend__update12AdjustmentForStatusIndicator(void *a1, const char *a2, ...)
{
  return [a1 _update12AdjustmentForStatusIndicator];
}

id objc_msgSend__updateAreAllComplicationsOffState(void *a1, const char *a2, ...)
{
  return [a1 _updateAreAllComplicationsOffState];
}

id objc_msgSend__visibleHourView(void *a1, const char *a2, ...)
{
  return [a1 _visibleHourView];
}

id objc_msgSend_areAllComplicationsOff(void *a1, const char *a2, ...)
{
  return [a1 areAllComplicationsOff];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_colorSchemeUnits(void *a1, const char *a2, ...)
{
  return [a1 colorSchemeUnits];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
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

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayDate];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
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

id objc_msgSend_faceColor(void *a1, const char *a2, ...)
{
  return [a1 faceColor];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceViewWantsComplicationKeylineFramesReloaded(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsComplicationKeylineFramesReloaded];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromEditMode(void *a1, const char *a2, ...)
{
  return [a1 fromEditMode];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return [a1 isLoaded];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeHourViews(void *a1, const char *a2, ...)
{
  return [a1 removeHourViews];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_selectedStyle(void *a1, const char *a2, ...)
{
  return [a1 selectedStyle];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_styles(void *a1, const char *a2, ...)
{
  return [a1 styles];
}

id objc_msgSend_timeScrubbing(void *a1, const char *a2, ...)
{
  return [a1 timeScrubbing];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toEditMode(void *a1, const char *a2, ...)
{
  return [a1 toEditMode];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_utilitySlot(void *a1, const char *a2, ...)
{
  return [a1 utilitySlot];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}