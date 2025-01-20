void sub_3E78(void *a1@<X0>, uint64_t a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  long long v10;
  long long v11;
  id obj;
  uint64_t vars8;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_173D8);
  WeakRetained = objc_loadWeakRetained(&qword_173E0);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&qword_173E0);
    if (v5 == obj)
    {
      v6 = [obj version];
      v7 = qword_173E8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v8 = objc_storeWeak(&qword_173E0, obj);
  qword_173E8 = (uint64_t)[obj version];

  sub_66CC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_173D8);
  v10 = *(_OWORD *)&qword_173B0;
  *(_OWORD *)(a2 + 32) = xmmword_173A0;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_173C0;
  *(void *)(a2 + 80) = qword_173D0;
  v11 = *(_OWORD *)&qword_17390;
  *(_OWORD *)a2 = xmmword_17380;
  *(_OWORD *)(a2 + 16) = v11;
}

id sub_48EC(uint64_t a1, double a2)
{
  float v2 = *(double *)(a1 + 40);
  *(float *)&a2 = fabsf((float)(v2 - (float)(*(float *)&a2 + 0.4)) / 0.4);
  if (*(float *)&a2 > 1.0) {
    *(float *)&a2 = 1.0;
  }
  return [*(id *)(a1 + 32) _solveForInput:a2];
}

void sub_4A24(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  v9 = [v6 complication];
  v10 = [*(id *)(a1 + 40) complicationPlatter];
  v11 = [v7 display];
  [v5 _applyColor:v9 platterColor:v10 toComplicationView:v11 slot:v8];

  v12 = [v7 display];

  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v14[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v12 setTransform:v14];
}

void sub_58D8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _keylinePaddingForState:a2];
  double v5 = v4;
  [*(id *)(a1 + 32) _keylineEdgeGapForState:a2];
  double v7 = v6;
  id v8 = [*(id *)(a1 + 32) device];
  NTKCircularMediumComplicationDiameter();
  double v10 = v9;

  v11 = [*(id *)(a1 + 32) device];
  sub_3E78(v11, (uint64_t)v36);
  double v12 = v37;

  long long v13 = [*(id *)(a1 + 32) device];
  sub_3E78(v13, (uint64_t)v34);
  double v14 = v10 + v12;
  double v15 = v10 + v12 + v35;

  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v16 = [*(id *)(a1 + 32) device];
    sub_3E78(v16, (uint64_t)v32);
    double v15 = v15 + v33;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 40);
  id v17 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    v19 = 0;
    double v20 = v5 + v7;
    uint64_t v21 = *(void *)v29;
    do
    {
      v22 = 0;
      v23 = v19;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v22);
        v25 = [*(id *)(a1 + 32) device];
        v19 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v25, 3, 3, v20, v15, v10, v10, v5, v5, v5, v5);

        v26 = [*(id *)(a1 + 32) complicationLayoutforSlot:v24];
        [v26 setDefaultLayoutRule:v19 forState:a2];

        double v15 = v14 + v15;
        v22 = (char *)v22 + 1;
        v23 = v19;
      }
      while (v18 != v22);
      id v18 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v18);
  }
}

id sub_5F88(uint64_t a1, void *a2)
{
  v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = *(void **)(a1 + 32);
  if (v12) {
    objc_msgSend(v12, "drawInRect:", v5, v7, v9, v11);
  }
  long long v13 = *(void **)(a1 + 40);

  return objc_msgSend(v13, "drawInRect:", v5, v7, v9, v11);
}

void sub_66CC(uint64_t a1, uint64_t a2)
{
  float v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v44[0] = &off_10B50;
  v44[1] = &off_10B68;
  v45[0] = &off_10FC0;
  v45[1] = &off_10FC0;
  v3 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  [v2 scaledValue:v3 withOverrides:1.0];
  *(void *)&xmmword_17380 = v4;

  *((void *)&xmmword_17380 + 1) = 0x400C000000000000;
  v42[0] = &off_10B50;
  v42[1] = &off_10B68;
  v43[0] = &off_10FD0;
  v43[1] = &off_10FE0;
  v42[2] = &off_10B80;
  v43[2] = &off_10FF0;
  double v5 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  [v2 scaledValue:v5 withOverrides:24.5];
  qword_17390 = v6;

  v40[0] = &off_10B50;
  v40[1] = &off_10B68;
  v41[0] = &off_11000;
  v41[1] = &off_11010;
  v40[2] = &off_10B80;
  v41[2] = &off_11020;
  double v7 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
  [v2 scaledValue:v7 withOverrides:7.5];
  qword_17398 = v8;

  v38[0] = &off_10B50;
  v38[1] = &off_10B68;
  v39[0] = &off_11030;
  v39[1] = &off_11030;
  v38[2] = &off_10B80;
  v39[2] = &off_11040;
  double v9 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  [v2 scaledValue:v9 withOverrides:-10.0];
  *(void *)&xmmword_173A0 = v10;

  v36[0] = &off_10B50;
  v36[1] = &off_10B68;
  v37[0] = &off_11050;
  v37[1] = &off_11060;
  double v11 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
  [v2 scaledValue:v11 withOverrides:17.5];
  *((void *)&xmmword_173A0 + 1) = v12;

  v34[0] = &off_10B50;
  long long v27 = xmmword_FC70;
  long long v13 = +[NSValue valueWithBytes:&v27 objCType:"{CGSize=dd}"];
  v35[0] = v13;
  v34[1] = &off_10B68;
  long long v26 = xmmword_FC80;
  double v14 = +[NSValue valueWithBytes:&v26 objCType:"{CGSize=dd}"];
  v35[1] = v14;
  v34[2] = &off_10B80;
  long long v25 = xmmword_FC90;
  double v15 = +[NSValue valueWithBytes:&v25 objCType:"{CGSize=dd}"];
  v35[2] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
  objc_msgSend(v2, "scaledSize:withOverrides:", v16, 115.5, 155.5);
  qword_173B0 = v17;
  unk_173B8 = v18;

  v32[0] = &off_10B50;
  v32[1] = &off_10B68;
  v33[0] = &off_11070;
  v33[1] = &off_11080;
  v32[2] = &off_10B80;
  v33[2] = &off_11090;
  v19 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  [v2 scaledValue:v19 withOverrides:28.5];
  *(void *)&xmmword_173C0 = v20;

  v30[0] = &off_10B50;
  v30[1] = &off_10B68;
  v31[0] = &off_110A0;
  v31[1] = &off_110B0;
  v30[2] = &off_10B80;
  v30[3] = &off_10B98;
  v31[2] = &off_110C0;
  v31[3] = &off_110D0;
  v30[4] = &off_10BB0;
  v30[5] = &off_10BC8;
  v31[4] = &off_110E0;
  v31[5] = &off_110F0;
  uint64_t v21 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  [v2 scaledValue:v21 withOverrides:150.0];
  *((void *)&xmmword_173C0 + 1) = v22;

  v28[0] = &off_10B50;
  v28[1] = &off_10B68;
  v29[0] = &off_11030;
  v29[1] = &off_11030;
  v28[2] = &off_10B80;
  v29[2] = &off_11100;
  v23 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
  [v2 scaledValue:v23 withOverrides:7.0];
  qword_173D0 = v24;
}

uint64_t sub_6D98()
{
  qword_173F0 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_6EBC(id a1)
{
  v3[0] = &off_10BE0;
  v3[1] = &off_10BF8;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_10C10;
  v3[3] = &off_10C28;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_10C40;
  v3[5] = &off_10C58;
  v4[4] = NTKFaceBundleStyle5;
  v4[5] = NTKFaceBundleStyle6;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:6];
  float v2 = (void *)qword_17410;
  qword_17410 = v1;
}

void sub_710C(uint64_t a1, uint64_t a2)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___NTKVictoryDigitalColorEditOption;
  uint64_t v2 = objc_msgSendSuper2(&v6, "_orderedValuesForDevice:", a2);
  v3 = (void *)qword_17420;
  qword_17420 = v2;

  uint64_t v4 = [(id)qword_17420 arrayByExcludingObjectsInArray:&off_10F78];
  double v5 = (void *)qword_17420;
  qword_17420 = v4;
}

void sub_7A40(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_17470);
  id WeakRetained = objc_loadWeakRetained(&qword_17478);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_17478);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_17480;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_17478, obj);
  qword_17480 = (uint64_t)[obj version];

  sub_7E08(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_17470);
  long long v10 = *(_OWORD *)&qword_17450;
  *a2 = xmmword_17440;
  a2[1] = v10;
  a2[2] = xmmword_17460;
}

void sub_7E08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v17[0] = &off_10CB8;
  v17[1] = &off_10CD0;
  v18[0] = &off_11110;
  v18[1] = &off_11120;
  v3 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v2 scaledValue:v3 withOverrides:105.0];
  *(void *)&xmmword_17440 = v4;

  v15[0] = &off_10CB8;
  v15[1] = &off_10CE8;
  v16[0] = &off_11130;
  v16[1] = &off_11140;
  id v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 scaledValue:v5 withOverrides:77.5];
  *((void *)&xmmword_17440 + 1) = v6;

  v13[0] = &off_10CB8;
  v13[1] = &off_10CE8;
  v14[0] = &off_11150;
  v14[1] = &off_11160;
  v13[2] = &off_10CD0;
  v13[3] = &off_10D00;
  v14[2] = &off_11170;
  _OWORD v14[3] = &off_11180;
  v13[4] = &off_10D18;
  v14[4] = &off_11190;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v2 scaledValue:v7 withOverrides:88.0];
  qword_17450 = v8;

  v11[0] = &off_10D00;
  v11[1] = &off_10D18;
  v12[0] = &off_111A0;
  v12[1] = &off_111A0;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v2 constantValue:v9 withOverrides:-2.0];
  qword_17458 = v10;

  xmmword_17460 = xmmword_FCE0;
}

double sub_98E8(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_174A8);
  id WeakRetained = objc_loadWeakRetained(&qword_174B0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_174B0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_174B0, v1);
    qword_174B8 = (uint64_t)[v1 version];

    sub_9C84(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_174B8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_174A8);
  double v9 = *(double *)&qword_17488;

  return v9;
}

void sub_9C84(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v17[0] = &off_10DA8;
  v17[1] = &off_10DC0;
  v18[0] = &off_111B0;
  v18[1] = &off_111C0;
  void v17[2] = &off_10DD8;
  v17[3] = &off_10DF0;
  void v18[2] = &off_111D0;
  v18[3] = &off_111E0;
  v17[4] = &off_10E08;
  v18[4] = &off_111F0;
  v3 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  [v2 scaledValue:v3 withOverrides:12.5];
  qword_17488 = v4;

  v16[0] = &off_11200;
  v16[1] = &off_11210;
  v15[0] = &off_10DA8;
  v15[1] = &off_10DC0;
  void v15[2] = &off_10DD8;
  v15[3] = &off_10DF0;
  void v16[2] = &off_11220;
  v16[3] = &off_11230;
  v15[4] = &off_10E08;
  v16[4] = &off_11240;
  id v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
  [v2 scaledValue:v5 withOverrides:86.5];
  qword_17490 = v6;

  v13[0] = &off_10DA8;
  v13[1] = &off_10DD8;
  v14[0] = &off_11250;
  v14[1] = &off_11260;
  id v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v2 scaledValue:v7 withOverrides:180.0];
  qword_174A0 = v8;

  v11[0] = &off_10DA8;
  v11[1] = &off_10DC0;
  v12[0] = &off_11270;
  v12[1] = &off_11270;
  void v11[2] = &off_10DD8;
  void v12[2] = &off_11280;
  double v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v2 scaledValue:v9 withOverrides:7.5];
  qword_17498 = v10;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return _CGColorEqualToColor(color1, color2);
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKValueForDeviceMetrics()
{
  return _CLKValueForDeviceMetrics();
}

uint64_t NTKAllCircularMediumComplicationTypes()
{
  return _NTKAllCircularMediumComplicationTypes();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
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

uint64_t NTKCircularMediumComplicationDiameter()
{
  return _NTKCircularMediumComplicationDiameter();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKColorByPremultiplyingAlpha()
{
  return _NTKColorByPremultiplyingAlpha();
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

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
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

uint64_t NTKVictoryTransitionTimingFunction()
{
  return _NTKVictoryTransitionTimingFunction();
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

void objc_destroyWeak(id *location)
{
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__createLabel(void *a1, const char *a2, ...)
{
  return [a1 _createLabel];
}

id objc_msgSend__positionLogoPlatterView(void *a1, const char *a2, ...)
{
  return [a1 _positionLogoPlatterView];
}

id objc_msgSend__setupLogoViews(void *a1, const char *a2, ...)
{
  return [a1 _setupLogoViews];
}

id objc_msgSend__timeViewFrame(void *a1, const char *a2, ...)
{
  return [a1 _timeViewFrame];
}

id objc_msgSend__updateFonts(void *a1, const char *a2, ...)
{
  return [a1 _updateFonts];
}

id objc_msgSend__updateImageToBlur(void *a1, const char *a2, ...)
{
  return [a1 _updateImageToBlur];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_alternateComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 alternateComplicationColor];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return [a1 appearance];
}

id objc_msgSend_applyColor(void *a1, const char *a2, ...)
{
  return [a1 applyColor];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
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

id objc_msgSend_clearEditingTransitions(void *a1, const char *a2, ...)
{
  return [a1 clearEditingTransitions];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationPlatter(void *a1, const char *a2, ...)
{
  return [a1 complicationPlatter];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_complications(void *a1, const char *a2, ...)
{
  return [a1 complications];
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

id objc_msgSend_defaultAppearance(void *a1, const char *a2, ...)
{
  return [a1 defaultAppearance];
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

id objc_msgSend_digitText(void *a1, const char *a2, ...)
{
  return [a1 digitText];
}

id objc_msgSend_digits(void *a1, const char *a2, ...)
{
  return [a1 digits];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
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

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logoWrapperView(void *a1, const char *a2, ...)
{
  return [a1 logoWrapperView];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_outlineBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 outlineBackgroundColor];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
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

id objc_msgSend_separatorRangeInTimeText(void *a1, const char *a2, ...)
{
  return [a1 separatorRangeInTimeText];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
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

id objc_msgSend_spring2020VictoryColors(void *a1, const char *a2, ...)
{
  return [a1 spring2020VictoryColors];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeText(void *a1, const char *a2, ...)
{
  return [a1 timeText];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_usesCircularMedium(void *a1, const char *a2, ...)
{
  return [a1 usesCircularMedium];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_victoryColor(void *a1, const char *a2, ...)
{
  return [a1 victoryColor];
}

id objc_msgSend_willBeginEditing(void *a1, const char *a2, ...)
{
  return [a1 willBeginEditing];
}