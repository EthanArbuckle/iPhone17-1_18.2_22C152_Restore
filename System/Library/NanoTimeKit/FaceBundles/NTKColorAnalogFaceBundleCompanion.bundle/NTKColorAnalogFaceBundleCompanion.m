id sub_54E4(uint64_t a1, void *a2)
{
  return [a2 setBackgroundColor:*(void *)(a1 + 32)];
}

void sub_56F4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = 32;
  if (*(int *)(a1 + 48) > a3) {
    uint64_t v6 = 40;
  }
  v7 = (CGColor *)[*(id *)(a1 + v6) CGColor];
  v8 = (CGColor *)[v5 contentsMultiplyColor];
  [v5 setBackgroundColor:v7];
  if (!CGColorEqualToColor(v7, v8))
  {
    double v9 = dbl_D810[0xCCCCCCCCCCCCCCCDLL * a3 < 0x3333333333333334];
    v10 = objc_opt_new();
    [v10 setDuration:1.0];
    v11 = +[CASpringAnimation animationWithKeyPath:@"transform.scale.xy"];
    [v11 setDuration:0.5];
    v12 = +[NSNumber numberWithDouble:v9];
    [v11 setByValue:v12];

    [v11 setCumulative:1];
    [v11 setMass:0.25];
    [v11 setStiffness:80.0];
    [v11 setDamping:5.0];
    [v11 setFillMode:kCAFillModeBoth];
    v13 = +[CASpringAnimation animationWithKeyPath:@"transform.scale.xy"];
    [v13 setDuration:0.8];
    v14 = +[NSNumber numberWithDouble:-v9];
    [v13 setByValue:v14];

    [v13 setBeginTime:0.2];
    [v13 setCumulative:1];
    [v13 setMass:0.8];
    [v13 setStiffness:90.0];
    [v13 setDamping:10.0];
    v17[0] = v11;
    v17[1] = v13;
    v15 = +[NSArray arrayWithObjects:v17 count:2];
    [v10 setAnimations:v15];

    LODWORD(v16) = 2.0;
    [v10 setSpeed:v16];

    [v5 addAnimation:v10 forKey:@"Key"];
  }
}

void sub_5E24(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:3];
  [v2 setRoundingBehavior:2];
  v9[0] = &off_10A38;
  v9[1] = &off_10A50;
  v10[0] = &off_10E28;
  v10[1] = &off_10E28;
  v3 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v2 scaledValue:v3 withOverrides:4.0];
  qword_15770 = v4;

  qword_15778 = qword_15770;
  v7[0] = &off_10A68;
  v7[1] = &off_10A38;
  v8[0] = &off_10E38;
  v8[1] = &off_10E48;
  v7[2] = &off_10A50;
  v8[2] = &off_10E48;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v2 scaledValue:v5 withOverrides:25.0];
  qword_15780 = v6;
}

void sub_6E78(id a1)
{
  v3[0] = &off_10B70;
  v3[1] = &off_10B58;
  v4[0] = NTKFaceBundleColorStyleDial;
  v4[1] = NTKFaceBundleColorStyleCircular;
  v3[2] = &off_10B40;
  v4[2] = NTKFaceBundleColorStyleFullscreen;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v2 = (void *)qword_157C0;
  qword_157C0 = v1;
}

void sub_8674(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _keylinePaddingForState:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _edgeGapForState:a2];
  double v7 = v5 + v6;
  v8 = [*(id *)(a1 + 32) device];
  NTKCircularSmallComplicationDiameter();
  double v10 = v9;
  v11 = [*(id *)(a1 + 32) device];
  NTKCircularSmallComplicationDiameter();
  double v13 = v12;

  v14 = [*(id *)(a1 + 32) device];
  v15 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v14, 3, 3, v7, v7, v10, v13, v5, v5, v5, v5);

  double v16 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotTopLeft];
  [v16 setDefaultLayoutRule:v15 forState:a2];

  double v17 = *(double *)(a1 + 56) - v10 - v7;
  [*(id *)(a1 + 32) _lisaGapForState:a2];
  double v19 = v17 - v18;
  v20 = [*(id *)(a1 + 32) device];
  v21 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v20, 3, 3, v19, v7, v10, v13, v5, v5, v5, v5);

  v22 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotTopRight];
  [v22 setDefaultLayoutRule:v21 forState:a2];

  double v23 = *(double *)(a1 + 64) - v13 - v7;
  v24 = [*(id *)(a1 + 32) device];
  v25 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v24, 3, 3, v7, v23, v10, v13, v5, v5, v5, v5);

  v26 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotBottomLeft];
  [v26 setDefaultLayoutRule:v25 forState:a2];

  double v27 = *(double *)(a1 + 56) - v10 - v7;
  v28 = [*(id *)(a1 + 32) device];
  v29 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v28, 3, 3, v27, v23, v10, v13, v5, v5, v5, v5);

  v30 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotBottomRight];
  [v30 setDefaultLayoutRule:v29 forState:a2];

  [*(id *)(a1 + 32) _monogramReferenceFrame];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  [*(id *)(a1 + 32) _monogramKeylinePadding];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [*(id *)(a1 + 32) device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v47, 1, 1, v32, v34, v36, v38, v40, v42, v44, v46);
  id v49 = (id)objc_claimAutoreleasedReturnValue();

  v48 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotMonogram];
  [v48 setDefaultLayoutRule:v49 forState:a2];
}

void sub_8CA8(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15820);
  id WeakRetained = objc_loadWeakRetained(&qword_15828);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_15828);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_15830;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_15828, obj);
  qword_15830 = (uint64_t)[obj version];

  sub_AEC0(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15820);
  long long v10 = *(_OWORD *)&qword_157F8;
  *(_OWORD *)a2 = xmmword_157E8;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_15808;
  *(void *)(a2 + 48) = qword_15818;
}

id _MonogramDarkForegroundColor()
{
  if (qword_157D8 != -1) {
    dispatch_once(&qword_157D8, &stru_10548);
  }
  v0 = (void *)qword_157D0;

  return v0;
}

void sub_9294(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = NTKComplicationSlotMonogram;
    id v7 = v5;
    unsigned int v8 = [v10 isEqualToString:v6];
    uint64_t v9 = &OBJC_IVAR___NTKColorAnalogFaceView__complicationForegroundColor;
    if (v8) {
      uint64_t v9 = &OBJC_IVAR___NTKColorAnalogFaceView__monogramForegroundColor;
    }
    [v7 setForegroundColor:*(void *)(*(void *)(a1 + 32) + *v9)];
    [v7 setPlatterColor:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

void sub_9950(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _monogramReferenceFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [*(id *)(a1 + 32) _monogramKeylinePadding];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [*(id *)(a1 + 32) device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v20, 1, 1, v5, v7, v9, v11, v13, v15, v17, v19);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  v21 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotMonogram];
  [v21 setDefaultLayoutRule:v22 forState:a2];
}

double _HandAlphaForEditMode(uint64_t a1)
{
  if (!a1) {
    return 1.0;
  }
  BOOL v1 = a1 == 15 || a1 == 10;
  double result = NTKEditModeDimmedAlpha;
  if (!v1) {
    return 0.0;
  }
  return result;
}

double _BackgroundAlphaForEditMode(uint64_t a1)
{
  double result = NTKEditModeDimmedAlpha;
  if (a1 != 1) {
    return 1.0;
  }
  return result;
}

double _BackgroundScaleForEditMode(unint64_t a1)
{
  double result = 0.975;
  if (a1 < 2) {
    return 1.0;
  }
  return result;
}

void sub_A22C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 display];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v5, v6);
}

void sub_A2F4(id a1)
{
  qword_157D0 = +[UIColor colorWithWhite:0.0 alpha:0.35];

  _objc_release_x1();
}

void sub_A9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) device];
  [*(id *)(a1 + 32) _monogramReferenceFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [*(id *)(a1 + 32) _monogramKeylinePadding];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v4, 1, 1, v6, v8, v10, v12, v13, v14, v15, v16);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  double v17 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotMonogram];
  [v17 setDefaultLayoutRule:v18 forState:a2];
}

void sub_AC40(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v8;
    double v6 = [v4 complicationForegroundColor];
    [*(id *)(a1 + 32) setComplicationColor:v6];

    double v7 = [*(id *)(a1 + 32) complicationForegroundColor];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v7];

    [v5 updateMonochromeColor];
  }
}

void sub_AEC0(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:3];
  v21[0] = &off_10DE0;
  v21[1] = &off_10DF8;
  v22[0] = &off_10E58;
  v22[1] = &off_10E68;
  v21[2] = &off_10E10;
  v22[2] = &off_10E68;
  v3 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v2 scaledValue:v3 withOverrides:78.5];
  *(void *)&xmmword_157E8 = v4;

  v19[0] = &off_10DE0;
  v19[1] = &off_10DF8;
  v20[0] = &off_10E78;
  v20[1] = &off_10E88;
  v19[2] = &off_10E10;
  v20[2] = &off_10E98;
  id v5 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  [v2 scaledValue:v5 withOverrides:30.0];
  *((void *)&xmmword_157E8 + 1) = v6;

  v17[0] = &off_10DE0;
  v17[1] = &off_10DF8;
  v18[0] = &off_10EA8;
  v18[1] = &off_10EB8;
  void v17[2] = &off_10E10;
  v18[2] = &off_10EB8;
  double v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  [v2 scaledValue:v7 withOverrides:56.5];
  qword_157F8 = v8;

  v15[0] = &off_10DE0;
  v15[1] = &off_10DF8;
  v16[0] = &off_10EC8;
  v16[1] = &off_10ED8;
  v15[2] = &off_10E10;
  v16[2] = &off_10ED8;
  double v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 scaledValue:v9 withOverrides:48.5];
  qword_15800 = v10;

  v13[0] = &off_10DE0;
  v13[1] = &off_10DF8;
  v14[0] = &off_10EE8;
  v14[1] = &off_10EF8;
  v13[2] = &off_10E10;
  v14[2] = &off_10F08;
  double v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 scaledValue:v11 withOverrides:65.5];
  *(void *)&xmmword_15808 = v12;

  *(long long *)((char *)&xmmword_15808 + 8) = xmmword_D8D0;
}

void sub_B284(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_158D0);
  id WeakRetained = objc_loadWeakRetained(&qword_158D8);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_158D8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_158E0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_158D8, obj);
  qword_158E0 = (uint64_t)[obj version];

  xmmword_15840 = xmmword_D8E0;
  *(_OWORD *)algn_15850 = xmmword_D8F0;
  xmmword_15860 = xmmword_D900;
  unk_15870 = xmmword_D8E0;
  xmmword_15880 = xmmword_D8F0;
  unk_15890 = xmmword_D900;
  xmmword_158A0 = xmmword_D910;
  unk_158B0 = xmmword_D920;
  xmmword_158C0 = xmmword_D930;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_158D0);
  long long v9 = unk_158B0;
  a2[6] = xmmword_158A0;
  a2[7] = v9;
  a2[8] = xmmword_158C0;
  long long v10 = unk_15870;
  a2[2] = xmmword_15860;
  a2[3] = v10;
  long long v11 = unk_15890;
  a2[4] = xmmword_15880;
  a2[5] = v11;
  long long v12 = *(_OWORD *)algn_15850;
  *a2 = xmmword_15840;
  a2[1] = v12;
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return _CGColorEqualToColor(color1, color2);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenRects()
{
  return _CLKInterpolateBetweenRects();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllSmallComplicationTypes()
{
  return _NTKAllSmallComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKCircularSmallComplicationDiameter()
{
  return _NTKCircularSmallComplicationDiameter();
}

uint64_t NTKColorFaceViewDeselectedKeylineInnerPadding()
{
  return _NTKColorFaceViewDeselectedKeylineInnerPadding();
}

uint64_t NTKColorFaceViewEdgeGapDeselected()
{
  return _NTKColorFaceViewEdgeGapDeselected();
}

uint64_t NTKColorFaceViewEdgeGapEditing()
{
  return _NTKColorFaceViewEdgeGapEditing();
}

uint64_t NTKColorFaceViewEdgeGapNormal()
{
  return _NTKColorFaceViewEdgeGapNormal();
}

uint64_t NTKColorFaceViewLisaKeylineGap()
{
  return _NTKColorFaceViewLisaKeylineGap();
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

uint64_t NTKDefaultFaceColorForDeviceCollection()
{
  return _NTKDefaultFaceColorForDeviceCollection();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
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

uint64_t NTKShowBlueRidgeUI()
{
  return _NTKShowBlueRidgeUI();
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

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__monogramKeylinePadding(void *a1, const char *a2, ...)
{
  return [a1 _monogramKeylinePadding];
}

id objc_msgSend__monogramReferenceFrame(void *a1, const char *a2, ...)
{
  return [a1 _monogramReferenceFrame];
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

id objc_msgSend_complicationForegroundColor(void *a1, const char *a2, ...)
{
  return [a1 complicationForegroundColor];
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

id objc_msgSend_contentsMultiplyColor(void *a1, const char *a2, ...)
{
  return [a1 contentsMultiplyColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
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

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_faceViewDidHideOrShowComplicationSlot(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidHideOrShowComplicationSlot];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
}

id objc_msgSend_foregroundContainerView(void *a1, const char *a2, ...)
{
  return [a1 foregroundContainerView];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_interpolatedComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 interpolatedComplicationColor];
}

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutComplicationViews(void *a1, const char *a2, ...)
{
  return [a1 layoutComplicationViews];
}

id objc_msgSend_loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 loadLayoutRules];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nrDeviceVersion(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceVersion];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
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

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondaryShiftedColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryShiftedColor];
}

id objc_msgSend_shiftedForegroundColor(void *a1, const char *a2, ...)
{
  return [a1 shiftedForegroundColor];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_transitionFraction(void *a1, const char *a2, ...)
{
  return [a1 transitionFraction];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
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