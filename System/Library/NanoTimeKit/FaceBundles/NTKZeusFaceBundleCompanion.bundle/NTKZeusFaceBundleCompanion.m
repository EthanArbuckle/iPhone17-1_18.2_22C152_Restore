void sub_231C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t vars8;

  v8 = +[NTKFace defaultFaceOfStyle:14 forDevice:*(void *)(a1 + 32)];
  if (v8)
  {
    v4 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v4 forCustomEditMode:11 slot:0];

    v5 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v5 forCustomEditMode:13 slot:0];

    v6 = +[NTKZeusColorEditOption optionWithColor:a2 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v6 forCustomEditMode:10 slot:0];

    v7 = [*(id *)(a1 + 40) complicationTypesBySlot];
    [v8 _setFaceGalleryComplicationTypesForSlots:v7];

    [*(id *)(a1 + 48) addObject:v8];
  }
}

void sub_25A8(uint64_t a1, uint64_t a2)
{
  id v8 = +[NTKFace defaultFaceOfStyle:14 forDevice:*(void *)(a1 + 32)];
  if (v8)
  {
    v4 = +[NTKZeusAnalogDensityEditOption optionWithDensity:3 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v4 forCustomEditMode:11 slot:0];

    v5 = +[NTKZeusAnalogStyleEditOption optionWithStyle:1 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v5 forCustomEditMode:13 slot:0];

    v6 = +[NTKZeusColorEditOption optionWithColor:a2 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v6 forCustomEditMode:10 slot:0];

    v7 = [*(id *)(a1 + 40) complicationTypesBySlot];
    [v8 _setFaceGalleryComplicationTypesForSlots:v7];

    [*(id *)(a1 + 48) addObject:v8];
  }
}

id *sub_2C9C(id *result, uint64_t a2)
{
  if (a2) {
    return (id *)[result[4] addObject:a2];
  }
  return result;
}

void sub_3240(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4C8E0);
  id WeakRetained = objc_loadWeakRetained(&qword_4C8E8);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4C8E8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4C8F0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4C8E8, obj);
  qword_4C8F0 = (uint64_t)[obj version];

  sub_40AC(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4C8E0);
  memcpy(a2, &unk_4C6B0, 0x230uLL);
}

id sub_3354(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

id sub_3360(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

void sub_336C(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

void sub_3384(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

void sub_3CB0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v3 = [*(id *)(a1 + 32) digitsColor];
    [v4 setTextColor:v3];
  }
}

void sub_3D30(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v3 = [*(id *)(a1 + 32) digitsColor];
    [v4 setTextColor:v3];
  }
}

void sub_40AC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 setScale:6 forSizeClass:1.105];
  [v3 setScale:7 forSizeClass:1.04];
  [v3 setScale:8 forSizeClass:1.1];
  id v4 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v4 scaledValue:6 withOverride:29.5 forSizeClass:35.5];
  qword_4C890 = v5;
  [v4 scaledValue:6 withOverride:40.0 forSizeClass:48.5];
  qword_4C898 = v6;
  xmmword_4C830 = 0u;
  unk_4C840 = 0u;
  xmmword_4C850 = 0u;
  unk_4C860 = 0u;
  qword_4C870 = 0;
  unk_4C878 = xmmword_330A0;
  qword_4C888 = 0x3FF0000000000000;
  xmmword_4C8A0 = xmmword_330B0;
  qword_4C8B0 = 0x3FE199999999999ALL;
  v58[0] = &off_3EBB8;
  v58[1] = &off_3EBD0;
  v59[0] = &off_3FB88;
  v59[1] = &off_3FB98;
  v58[2] = &off_3EBE8;
  v59[2] = &off_3FBA8;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
  [v4 scaledValue:v7 withOverrides:0.9];
  qword_4C8D0 = v8;

  v56[0] = &off_3EBB8;
  v56[1] = &off_3EBD0;
  v57[0] = &off_3FB88;
  v57[1] = &off_3FB98;
  v56[2] = &off_3EBE8;
  v57[2] = &off_3FBB8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:3];
  [v4 scaledValue:v9 withOverrides:0.9];
  qword_4C8D8 = v10;

  v54[0] = &off_3EBB8;
  v54[1] = &off_3EBD0;
  v55[0] = &off_3FBC8;
  v55[1] = &off_3FBD8;
  v54[2] = &off_3EBE8;
  v55[2] = &off_3FBD8;
  v11 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:3];
  [v4 scaledValue:v11 withOverrides:-1.5];
  qword_4C8C8 = v12;

  v52[0] = &off_3EBB8;
  v52[1] = &off_3EBD0;
  v53[0] = &off_3EC00;
  v53[1] = &off_3EC18;
  v52[2] = &off_3EBE8;
  v53[2] = &off_3EC18;
  v13 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
  [v4 scaledValue:v13 withOverrides:0.0];
  qword_4C8C0 = v14;

  v50[0] = &off_3EBB8;
  v50[1] = &off_3EBD0;
  v51[0] = &off_3FB98;
  v51[1] = &off_3FB88;
  v50[2] = &off_3EBE8;
  v51[2] = &off_3FB88;
  v15 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
  v39 = v4;
  [v4 scaledValue:v15 withOverrides:0.4];
  qword_4C8B8 = v16;

  [v2 screenBounds];
  [v2 screenBounds];
  for (uint64_t i = 0; i != 12; ++i)
  {
    v48[0] = &off_3EBB8;
    long long v45 = xmmword_33240[i];
    v18 = +[NSValue valueWithBytes:&v45 objCType:"{CGPoint=dd}"];
    v49[0] = v18;
    v48[1] = &off_3EBD0;
    long long v44 = xmmword_33300[i];
    v19 = +[NSValue valueWithBytes:&v44 objCType:"{CGPoint=dd}"];
    v49[1] = v19;
    v48[2] = &off_3EBE8;
    long long v43 = xmmword_33180[i];
    v20 = +[NSValue valueWithBytes:&v43 objCType:"{CGPoint=dd}"];
    v49[2] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
    objc_msgSend(v3, "scaledPoint:withOverrides:", v21, *(double *)((char *)&unk_330C0 + i * 16), *(double *)((char *)&unk_330C0 + i * 16 + 8));
    double v23 = v22;
    double v25 = v24;

    objc_msgSend(v3, "scaledPoint:", v23, v25);
    v26 = (void *)((char *)&unk_4C6B0 + i * 16);
    CLKAddPoints();
    void *v26 = v27;
    v26[1] = v28;
    v46[0] = &off_3EBB8;
    long long v42 = xmmword_33540[i];
    v29 = +[NSValue valueWithBytes:&v42 objCType:"{CGPoint=dd}"];
    v47[0] = v29;
    v46[1] = &off_3EBD0;
    long long v41 = xmmword_33600[i];
    v30 = +[NSValue valueWithBytes:&v41 objCType:"{CGPoint=dd}"];
    v47[1] = v30;
    v46[2] = &off_3EBE8;
    long long v40 = xmmword_33480[i];
    v31 = +[NSValue valueWithBytes:&v40 objCType:"{CGPoint=dd}"];
    v47[2] = v31;
    v32 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
    objc_msgSend(v3, "scaledPoint:withOverrides:", v32, *(double *)((char *)&unk_333C0 + i * 16), *(double *)((char *)&unk_333C0 + i * 16 + 8));
    double v34 = v33;
    double v36 = v35;

    objc_msgSend(v3, "scaledPoint:", v34, v36);
    CLKAddPoints();
    v26[24] = v37;
    v26[25] = v38;
  }
}

void sub_5268(id a1)
{
  v3[0] = &off_3ED08;
  v3[1] = &off_3ED20;
  v4[0] = @"white";
  v4[1] = @"black";
  v3[2] = &off_3ED38;
  v3[3] = &off_3ED50;
  v4[2] = @"indigo";
  v4[3] = @"orange";
  v3[4] = &off_3ED68;
  v3[5] = &off_3ED80;
  v4[4] = @"yellow";
  v4[5] = @"green";
  v3[6] = &off_3ED98;
  v3[7] = &off_3EDB0;
  v4[6] = @"blue";
  v4[7] = @"purple";
  v3[8] = &off_3EDC8;
  v3[9] = &off_3EDE0;
  v4[8] = @"roseMexico";
  v4[9] = @"red";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:10];
  id v2 = (void *)qword_4C8F8;
  qword_4C8F8 = v1;
}

void _LayoutConstants(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4C950);
  id WeakRetained = objc_loadWeakRetained(&qword_4C958);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4C958);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4C960;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4C958, obj);
  qword_4C960 = (uint64_t)[obj version];

  sub_5578(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4C950);
  long long v10 = *(_OWORD *)&qword_4C938;
  *(_OWORD *)(a2 + 32) = xmmword_4C928;
  *(_OWORD *)(a2 + 48) = v10;
  *(void *)(a2 + 64) = qword_4C948;
  long long v11 = *(_OWORD *)&qword_4C918;
  *(_OWORD *)a2 = xmmword_4C908;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_5578(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  uint64_t v12 = &off_3EDF8;
  v13 = &off_3FBE8;
  v3 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v2 scaledValue:v3 withOverrides:41.5];
  *(void *)&xmmword_4C908 = v4;

  objc_msgSend(v2, "scaledSize:withOverride:forSizeClass:", 3, 53.5, 10.5, 62.0, 12.0);
  qword_4C918 = v5;
  unk_4C920 = v6;
  objc_msgSend(v2, "scaledSize:withOverride:forSizeClass:", 3, 36.0, 7.5, 41.5, 8.0);
  *(void *)&xmmword_4C928 = v7;
  *((void *)&xmmword_4C928 + 1) = v8;
  *((void *)&xmmword_4C908 + 1) = 0x4004000000000000;
  objc_msgSend(v2, "scaledSize:withOverride:forSizeClass:", 3, 58.0, 57.5, 58.0, 60.0);
  qword_4C938 = v9;
  unk_4C940 = v10;
  [v2 scaledValue:3 withOverride:46.5 forSizeClass:53.0];
  qword_4C948 = v11;
}

id sub_5C7C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
}

id NTKNewToFortuneZeusAnalogStyles(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4C9A8);
  id WeakRetained = objc_loadWeakRetained(&qword_4C9B0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_4C9B0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_4C9B0, v1);
    qword_4C9B8 = (uint64_t)[v1 version];

    sub_71A4();
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_4C9B8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4C9A8);
  id v8 = (id)qword_4C9A0;

  return v8;
}

void sub_70D0(id a1)
{
  v3[0] = &off_3EE28;
  v3[1] = &off_3EE40;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_3EE58;
  v3[3] = &off_3EE10;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_4C990;
  qword_4C990 = v1;
}

void sub_71A4()
{
  uint64_t v2 = 3;
  uint64_t v0 = +[NSIndexSet indexSetWithIndexes:&v2 count:1];
  uint64_t v1 = (void *)qword_4C9A0;
  qword_4C9A0 = v0;
}

id sub_775C()
{
  if (qword_4CA18 != -1) {
    dispatch_once(&qword_4CA18, &stru_3CB18);
  }
  uint64_t v0 = (void *)qword_4CA10;

  return v0;
}

uint64_t sub_790C(uint64_t a1, uint64_t a2)
{
  qword_4C9E0 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);

  return _objc_release_x1();
}

void sub_7B7C(id a1)
{
  v3[0] = &off_3EE88;
  v3[1] = &off_3EE70;
  v4[0] = NTKFaceBundleColorExplorer;
  v4[1] = NTKFaceBundleColorZeus;
  v3[2] = &off_3EEE8;
  v3[3] = &off_3EFC0;
  v4[2] = NTKFaceBundleColorWhite;
  v4[3] = @"sakura";
  void v3[4] = &off_3EFD8;
  v3[5] = &off_3F008;
  void v4[4] = @"bleu";
  v4[5] = @"feu";
  v3[6] = &off_3F020;
  v3[7] = &off_3F038;
  v4[6] = @"rose";
  v4[7] = @"ambre";
  v3[8] = &off_3EF78;
  v3[9] = &off_3EF90;
  v4[8] = @"encre";
  v4[9] = @"etain";
  void v3[10] = &off_3EFA8;
  v3[11] = &off_3EEA0;
  void v4[10] = @"brique";
  v4[11] = @"noir";
  v3[12] = &off_3EFF0;
  v3[13] = &off_3EEB8;
  v4[12] = @"noir dual tone";
  v4[13] = @"blanc";
  v3[14] = &off_3EF60;
  v3[15] = &off_3EF00;
  v4[14] = @"rouge piment";
  v4[15] = @"jaune ambre";
  v3[16] = &off_3EF18;
  v3[17] = &off_3EF30;
  v4[16] = @"bambou";
  v4[17] = @"navy";
  v3[18] = &off_3EF48;
  v3[19] = &off_3EED0;
  v4[18] = @"anemone";
  v4[19] = @"argent";
  v3[20] = &off_3F050;
  v4[20] = @"rose-mexico";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:21];
  uint64_t v2 = (void *)qword_4CA00;
  qword_4CA00 = v1;
}

void sub_81FC(id a1)
{
  long long v3 = xmmword_33750;
  uint64_t v4 = 3002;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:&v3 count:3];
  uint64_t v2 = (void *)qword_4CA10;
  qword_4CA10 = v1;
}

void sub_8284(id a1)
{
  long long v3 = xmmword_33730;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:&v3 count:2];
  uint64_t v2 = (void *)qword_4CA20;
  qword_4CA20 = v1;
}

void sub_8304(id a1)
{
  v3[0] = xmmword_33768;
  v3[1] = unk_33778;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:v3 count:4];
  uint64_t v2 = (void *)qword_4CA30;
  qword_4CA30 = v1;
}

void sub_8384(id a1)
{
  long long v3 = xmmword_33740;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:&v3 count:2];
  uint64_t v2 = (void *)qword_4CA40;
  qword_4CA40 = v1;
}

void sub_8404(id a1)
{
  v3[0] = xmmword_33700;
  v3[1] = xmmword_33710;
  _OWORD v3[2] = xmmword_33720;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:v3 count:6];
  uint64_t v2 = (void *)qword_4CA50;
  qword_4CA50 = v1;
}

void sub_8494(id a1)
{
  uint64_t v3 = 3018;
  uint64_t v1 = +[NSIndexSet indexSetWithIndexes:&v3 count:1];
  uint64_t v2 = (void *)qword_4CA60;
  qword_4CA60 = v1;
}

void _NTKZeusApplyLegibilityToView(void *a1)
{
  id v1 = a1;
  id v4 = [v1 layer];
  id v2 = +[UIColor blackColor];
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v2, "CGColor"));

  objc_msgSend(v4, "setShadowOffset:", 0.0, 2.0);
  LODWORD(v3) = 1.0;
  [v4 setShadowOpacity:v3];
  [v4 setShadowRadius:3.0];
  [v1 setClipsToBounds:0];
}

void sub_9058(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CB40);
  id WeakRetained = objc_loadWeakRetained(&qword_4CB48);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4CB48);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4CB50;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4CB48, obj);
  qword_4CB50 = (uint64_t)[obj version];

  sub_BE3C(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CB40);
  long long v10 = unk_4CB20;
  a2[10] = xmmword_4CB10;
  a2[11] = v10;
  a2[12] = xmmword_4CB30;
  long long v11 = *(_OWORD *)&qword_4CAE0;
  a2[6] = xmmword_4CAD0;
  a2[7] = v11;
  long long v12 = *(_OWORD *)&qword_4CB00;
  a2[8] = xmmword_4CAF0;
  a2[9] = v12;
  long long v13 = *(_OWORD *)&qword_4CAA0;
  a2[2] = xmmword_4CA90;
  a2[3] = v13;
  long long v14 = *(_OWORD *)&qword_4CAC0;
  a2[4] = xmmword_4CAB0;
  a2[5] = v14;
  long long v15 = *(_OWORD *)&qword_4CA80;
  *a2 = xmmword_4CA70;
  a2[1] = v15;
}

void sub_AD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_AD54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

void sub_BE3C(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v52[0] = &off_3F068;
  v52[1] = &off_3F080;
  v53[0] = &off_3FBF8;
  v53[1] = &off_3FBF8;
  v52[2] = &off_3F098;
  v53[2] = &off_3FC08;
  double v3 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:3];
  [v2 scaledValue:v3 withOverrides:3.5];
  *(void *)&xmmword_4CA70 = v4;

  v50[0] = &off_3F068;
  v50[1] = &off_3F080;
  v51[0] = &off_3FBF8;
  v51[1] = &off_3FBF8;
  v50[2] = &off_3F098;
  v51[2] = &off_3FC18;
  id v5 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
  [v2 scaledValue:v5 withOverrides:5.0];
  *((void *)&xmmword_4CA70 + 1) = v6;

  v48[0] = &off_3F068;
  v48[1] = &off_3F080;
  v49[0] = &off_3FBF8;
  v49[1] = &off_3FBF8;
  v48[2] = &off_3F098;
  v49[2] = &off_3FC18;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
  [v2 scaledValue:v7 withOverrides:5.0];
  qword_4CA80 = v8;

  v46[0] = &off_3F080;
  v46[1] = &off_3F098;
  v47[0] = &off_3FBF8;
  v47[1] = &off_3FC28;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  [v2 scaledValue:v9 withOverrides:3.0];
  qword_4CA88 = v10;

  v44[0] = &off_3F068;
  v44[1] = &off_3F098;
  v45[0] = &off_3FC08;
  v45[1] = &off_3FC08;
  long long v11 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  [v2 scaledValue:v11 withOverrides:3.5];
  *(void *)&xmmword_4CA90 = v12;

  *((void *)&xmmword_4CA90 + 1) = 0x3FF0000000000000;
  v42[0] = &off_3F0B0;
  v42[1] = &off_3F0C8;
  v43[0] = &off_3FC38;
  v43[1] = &off_3FC48;
  v42[2] = &off_3F0E0;
  v42[3] = &off_3F0F8;
  v43[2] = &off_3FC48;
  v43[3] = &off_3FC58;
  v42[4] = &off_3F110;
  v43[4] = &off_3FC68;
  long long v13 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:5];
  [v2 scaledValue:v13 withOverrides:17.0];
  qword_4CAA0 = v14;

  v40[0] = &off_3F0B0;
  v40[1] = &off_3F0C8;
  v41[0] = &off_3FC78;
  v41[1] = &off_3FC88;
  v40[2] = &off_3F0E0;
  v40[3] = &off_3F0F8;
  v41[2] = &off_3FC88;
  v41[3] = &off_3FC98;
  v40[4] = &off_3F110;
  v41[4] = &off_3FCA8;
  long long v15 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];
  [v2 scaledValue:v15 withOverrides:22.5];
  qword_4CAA8 = v16;

  v38[0] = &off_3F0B0;
  v38[1] = &off_3F0C8;
  v39[0] = &off_3FCB8;
  v39[1] = &off_3FCC8;
  v38[2] = &off_3F0E0;
  v38[3] = &off_3F0F8;
  v39[2] = &off_3FCC8;
  v39[3] = &off_3FCD8;
  v38[4] = &off_3F110;
  v39[4] = &off_3FCE8;
  v17 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:5];
  [v2 scaledValue:v17 withOverrides:16.0];
  *(void *)&xmmword_4CAB0 = v18;

  v36[0] = &off_3F0B0;
  v36[1] = &off_3F0C8;
  v37[0] = &off_3FCF8;
  v37[1] = &off_3FD08;
  v36[2] = &off_3F0E0;
  v36[3] = &off_3F0F8;
  v37[2] = &off_3FD08;
  v37[3] = &off_3FCE8;
  v36[4] = &off_3F110;
  v37[4] = &off_3FC98;
  v19 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];
  [v2 scaledValue:v19 withOverrides:19.5];
  *((void *)&xmmword_4CAB0 + 1) = v20;

  objc_msgSend(v2, "scaledSize:", 2.0, 3.0);
  qword_4CAC0 = v21;
  unk_4CAC8 = v22;
  objc_msgSend(v2, "scaledSize:", 2.5, 3.0);
  *(void *)&xmmword_4CAD0 = v23;
  *((void *)&xmmword_4CAD0 + 1) = v24;
  objc_msgSend(v2, "scaledSize:", 3.5, 3.0);
  qword_4CAE0 = v25;
  unk_4CAE8 = v26;
  objc_msgSend(v2, "scaledSize:", 4.0, 3.5);
  *(void *)&xmmword_4CAF0 = v27;
  *((void *)&xmmword_4CAF0 + 1) = v28;
  [v2 scaledValue:24.0];
  qword_4CB00 = v29;
  objc_msgSend(v2, "scaledSize:", 6.5, 7.0);
  qword_4CB08 = v30;
  *(void *)&xmmword_4CB10 = v31;
  objc_msgSend(v2, "scaledSize:", 9.0, 7.5);
  *((void *)&xmmword_4CB10 + 1) = v32;
  unk_4CB20 = v33;
  [v2 scaledValue:3.0];
  qword_4CB28 = v34;
  [v2 scaledValue:3 withOverride:13.5 forSizeClass:13.5];
  *(void *)&xmmword_4CB30 = v35;
  *((void *)&xmmword_4CB30 + 1) = 0x4020000000000000;
}

void sub_D188(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:5.0];
  qword_4CB58 = v3;
  v6[0] = &off_3F158;
  v6[1] = &off_3F170;
  v7[0] = &off_3FD18;
  v7[1] = &off_3FD28;
  v6[2] = &off_3F188;
  v7[2] = &off_3FD38;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  [v2 scaledValue:v4 withOverrides:17.5];
  qword_4CB60 = v5;
}

void sub_D3EC(id a1)
{
  qword_4CB80 = +[NTKFontLoader fontDescriptorForSectName:@"__ClipperFont" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_D490(id a1)
{
  qword_4CB90 = +[NTKFontLoader fontDescriptorForSectName:@"__CapeCodFont" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_D534(id a1)
{
  qword_4CBA0 = +[NTKFontLoader fontDescriptorForSectName:@"__EspaceFont" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_D5D8(id a1)
{
  qword_4CBB0 = +[NTKFontLoader fontDescriptorForSectName:@"__CarrickFont" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_D740(id a1)
{
  qword_4CBC0 = +[NTKFontLoader fontDescriptorForSectName:@"__InlineFont" fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_DE44(id a1, NSNumber *a2, CALayer *a3, BOOL *a4)
{
}

void sub_E16C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (*(id *)(a1 + 32) != v4 && *(id *)(a1 + 40) != v4)
  {
    id v5 = v4;
    [v4 setOpacity:0.0];
    id v4 = v5;
  }
}

void sub_E288(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v3 = *(double *)(a1 + 32);
  id v4 = a3;
  CGAffineTransformMakeRotation(&v6, v3);
  CGAffineTransform v5 = v6;
  [v4 setAffineTransform:&v5];
}

void sub_E9C0(uint64_t a1, uint64_t a2)
{
  id v3 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:3 withOverride:3.5 forSizeClass:3.5];
  qword_4CBD0 = v2;
}

void sub_EA24(id a1)
{
  id v1 = +[NSNull null];
  v4[0] = @"backgroundColor";
  v4[1] = @"borderColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"borderWidth";
  v4[3] = @"cornerCurve";
  v5[2] = v1;
  v5[3] = v1;
  void v4[4] = @"cornerRadius";
  v4[5] = @"affineTransform";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"transform";
  v4[7] = @"bounds";
  v5[6] = v1;
  v5[7] = v1;
  v4[8] = @"position";
  v4[9] = @"opacity";
  v5[8] = v1;
  v5[9] = v1;
  void v4[10] = @"shadowOpacity";
  v5[10] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  id v3 = (void *)qword_4CBF0;
  qword_4CBF0 = v2;
}

void sub_F7E8(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CCA0);
  id WeakRetained = objc_loadWeakRetained(&qword_4CCA8);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4CCA8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4CCB0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4CCA8, obj);
  qword_4CCB0 = (uint64_t)[obj version];

  sub_12AE0(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CCA0);
  long long v10 = unk_4CC78;
  *(_OWORD *)(a2 + 96) = xmmword_4CC68;
  *(_OWORD *)(a2 + 112) = v10;
  *(_OWORD *)(a2 + 128) = xmmword_4CC88;
  *(void *)(a2 + 144) = qword_4CC98;
  long long v11 = *(_OWORD *)&qword_4CC38;
  *(_OWORD *)(a2 + 32) = xmmword_4CC28;
  *(_OWORD *)(a2 + 48) = v11;
  long long v12 = *(_OWORD *)&qword_4CC58;
  *(_OWORD *)(a2 + 64) = xmmword_4CC48;
  *(_OWORD *)(a2 + 80) = v12;
  long long v13 = *(_OWORD *)&qword_4CC18;
  *(_OWORD *)a2 = xmmword_4CC08;
  *(_OWORD *)(a2 + 16) = v13;
}

id sub_F920()
{
  if (qword_4CCC0 != -1) {
    dispatch_once(&qword_4CCC0, &stru_3CE90);
  }
  uint64_t v0 = (void *)qword_4CCB8;

  return v0;
}

id sub_100E8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);

  return [v4 setDefaultLayoutRule:v5 forState:a2];
}

void _shapeNoirAlphaTransition(double a1)
{
  if (NTKEditModeDimmedAlpha <= a1) {
    pow((a1 - NTKEditModeDimmedAlpha) / 0.8, 3.0);
  }
}

void sub_125A4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 layer];
  objc_msgSend(v5, "renderInContext:", objc_msgSend(v4, "CGContext"));

  id v7 = [*(id *)(a1 + 40) layer];
  id v6 = [v4 CGContext];

  [v7 renderInContext:v6];
}

void sub_12764(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained delegate];
    [v2 faceViewDidChangeWantsStatusBarIconShadow];

    id WeakRetained = v3;
  }
}

void sub_12AE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:3 forSizeClass:1.13580247];
  v20[0] = &off_3F248;
  v20[1] = &off_3F260;
  v21[0] = &off_3FD48;
  v21[1] = &off_3FD58;
  id v3 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v2 scaledValue:v3 withOverrides:117.5];
  uint64_t v5 = v4;

  xmmword_4CC08 = 0uLL;
  qword_4CC18 = 0x4055000000000000;
  qword_4CC20 = v5;
  objc_msgSend(v2, "scaledSize:", 162.0, 197.0);
  *(void *)&xmmword_4CC28 = v6;
  *((void *)&xmmword_4CC28 + 1) = v7;
  [v2 scaledValue:6 withOverride:-28.5 forSizeClass:-35.0];
  qword_4CC38 = v8;
  [v2 scaledValue:36.0];
  *((void *)&xmmword_4CC48 + 1) = v9;
  [v2 scaledValue:35.5];
  qword_4CC58 = v10;
  [v2 scaledValue:34.5];
  qword_4CC60 = v11;
  [v2 scaledValue:36.0];
  *(void *)&xmmword_4CC68 = v12;
  objc_msgSend(v2, "scaledSize:", 46.5, 8.5);
  *((void *)&xmmword_4CC68 + 1) = v13;
  unk_4CC78 = v14;
  objc_msgSend(v2, "scaledSize:", 31.0, 6.0);
  qword_4CC80 = v15;
  *(void *)&xmmword_4CC88 = v16;
  [v2 scaledValue:6 withOverride:-47.0 forSizeClass:-58.0];
  *((void *)&xmmword_4CC88 + 1) = v17;
  qword_4CC98 = 0x4004000000000000;
  [v2 setRoundingBehavior:2];
  objc_msgSend(v2, "scaledSize:", 58.0, 57.5);
  qword_4CC40 = v18;
  *(void *)&xmmword_4CC48 = v19;
}

void sub_12CEC(id a1)
{
  id v1 = +[NSNull null];
  v4[0] = @"transform";
  v4[1] = @"borderColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"borderWidth";
  v4[3] = @"backgroundColor";
  v5[2] = v1;
  v5[3] = v1;
  void v4[4] = @"opacity";
  v4[5] = @"cornerRadius";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"compositingFilter";
  v5[6] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  id v3 = (void *)qword_4CCB8;
  qword_4CCB8 = v2;
}

id sub_139FC(uint64_t a1, void *a2)
{
  id v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [*(id *)(a1 + 32) background];
  [v12 setFill];

  [*(id *)(a1 + 40) screenCornerRadius];
  uint64_t v14 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v13);
  [v14 fill];

  uint64_t v15 = [*(id *)(a1 + 32) numbers];
  [v15 set];

  uint64_t v16 = *(void **)(a1 + 48);

  return objc_msgSend(v16, "drawInRect:", v5, v7, v9, v11);
}

void sub_13BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  CLKDegreesToRadians();
  CGFloat v4 = v3;
  objc_msgSend(v2, "scaledSize:", 72.25696, 48.49784);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  objc_msgSend(v2, "sizeCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:", CGSizeZero.width, CGSizeZero.height, CGSizeZero.width, CGSizeZero.height, -1.5, -23.0, -0.85, -23.5, 0xBFEB333333333333, 0xC036CCCCCCCCCCCDLL, 0xBFEB333333333333, 0xC039333333333333);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, v6, v8);
  CGAffineTransform v13 = v15;
  CGAffineTransformRotate(&v14, &v13, v4);
  *(_OWORD *)&v15.c = *(_OWORD *)&v14.c;
  *(_OWORD *)&v15.tx = *(_OWORD *)&v14.tx;
  *(_OWORD *)&v15.a = *(_OWORD *)&v14.a;
  CGAffineTransform v13 = v14;
  CGAffineTransformScale(&v14, &v13, 1.25, 1.25);
  *(_OWORD *)&v15.c = *(_OWORD *)&v14.c;
  *(_OWORD *)&v15.tx = *(_OWORD *)&v14.tx;
  *(_OWORD *)&v15.a = *(_OWORD *)&v14.a;
  CGAffineTransform v13 = v14;
  CGAffineTransformTranslate(&v14, &v13, v10, v12);
  *(_OWORD *)&v15.tx = *(_OWORD *)&v14.tx;
  *(CGAffineTransform *)byte_4CCC8 = v14;
}

void sub_14320(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CD38);
  id WeakRetained = objc_loadWeakRetained(&qword_4CD40);
  if (WeakRetained)
  {
    CGFloat v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4CD40);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4CD48;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4CD40, obj);
  qword_4CD48 = (uint64_t)[obj version];

  sub_148B4(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CD38);
  long long v10 = unk_4CD20;
  *(_OWORD *)a2 = xmmword_4CD10;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_4CD30;
}

id sub_14438()
{
  if (qword_4CD58 != -1) {
    dispatch_once(&qword_4CD58, &stru_3CED8);
  }
  uint64_t v0 = (void *)qword_4CD50;

  return v0;
}

void sub_148B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:3 withOverride:27.5 forSizeClass:31.0];
  *(void *)&xmmword_4CD10 = v3;
  v7[0] = &off_3F278;
  v7[1] = &off_3F290;
  v8[0] = &off_3FD68;
  v8[1] = &off_3F2A8;
  v7[2] = &off_3F2C0;
  v8[2] = &off_3F2D8;
  CGFloat v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  [v2 scaledValue:v4 withOverrides:160.0];
  uint64_t v6 = v5;

  *((void *)&xmmword_4CD10 + 1) = 0;
  unk_4CD20 = 0;
  qword_4CD28 = v6;
  qword_4CD30 = v6;
}

void sub_149D8(id a1)
{
  id v1 = +[NSNull null];
  v4[0] = @"backgroundColor";
  v4[1] = @"borderColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"borderWidth";
  v4[3] = @"cornerCurve";
  v5[2] = v1;
  v5[3] = v1;
  void v4[4] = @"cornerRadius";
  v4[5] = @"affineTransform";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"transform";
  void v4[7] = @"bounds";
  v5[6] = v1;
  void v5[7] = v1;
  v4[8] = @"position";
  v4[9] = @"opacity";
  v5[8] = v1;
  v5[9] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
  uint64_t v3 = (void *)qword_4CD50;
  qword_4CD50 = v2;
}

id sub_15448(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateHour];
}

void sub_154E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_156EC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CDE8);
  id WeakRetained = objc_loadWeakRetained(&qword_4CDF0);
  if (WeakRetained)
  {
    CGFloat v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4CDF0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4CDF8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4CDF0, obj);
  qword_4CDF8 = (uint64_t)[obj version];

  sub_174EC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CDE8);
  long long v10 = *(_OWORD *)&qword_4CDD0;
  *(_OWORD *)(a2 + 96) = xmmword_4CDC0;
  *(_OWORD *)(a2 + 112) = v10;
  *(void *)(a2 + 128) = qword_4CDE0;
  long long v11 = unk_4CD90;
  *(_OWORD *)(a2 + 32) = xmmword_4CD80;
  *(_OWORD *)(a2 + 48) = v11;
  long long v12 = *(_OWORD *)&qword_4CDB0;
  *(_OWORD *)(a2 + 64) = xmmword_4CDA0;
  *(_OWORD *)(a2 + 80) = v12;
  long long v13 = unk_4CD70;
  *(_OWORD *)a2 = xmmword_4CD60;
  *(_OWORD *)(a2 + 16) = v13;
}

void sub_15AE4(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
  id v3 = [(NTKComplicationDisplayWrapperView *)a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 transitionToMonochromeWithFraction:1.0];
  }
}

void sub_160FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  CGFloat v4 = [v10 display];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v10 display];
    unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___NTKBellonaNumeralsDelegate];

    uint64_t v7 = v10;
    if (!v6) {
      goto LABEL_5;
    }
    id v8 = [v10 display];
    [*(id *)(*(void *)(a1 + 32) + 16) setBackgroundView:v8];

    CGFloat v4 = [*(id *)(*(void *)(a1 + 32) + 16) backgroundView];
    uint64_t v9 = [*(id *)(a1 + 32) palette];
    [v4 applyPalette:v9];
  }
  uint64_t v7 = v10;
LABEL_5:
}

void sub_162B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  CGFloat v4 = [v10 display];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v10 display];
    unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___NTKBellonaNumeralsDelegate];

    uint64_t v7 = v10;
    if (!v6) {
      goto LABEL_5;
    }
    id v8 = [v10 display];
    [*(id *)(*(void *)(a1 + 32) + 16) setBackgroundView:v8];

    CGFloat v4 = [*(id *)(*(void *)(a1 + 32) + 16) backgroundView];
    uint64_t v9 = [*(id *)(a1 + 32) interpolatedColorPalette];
    [v4 applyPalette:v9];
  }
  uint64_t v7 = v10;
LABEL_5:
}

void sub_16728(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _lowerComplicationFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = [*(id *)(a1 + 32) device];
  +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v12, 3, 3, v5, v7, v9, v11, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  long long v13 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotBottomCenter];
  [v13 setDefaultLayoutRule:v24 forState:a2];

  double v14 = *(double *)(a1 + 144);
  [*(id *)(a1 + 32) bounds];
  double v16 = *(double *)(a1 + 152) + v15 * 0.5;
  double v17 = *(double *)(a1 + 128);
  double v18 = *(double *)(a1 + 136);
  double v19 = *(double *)(a1 + 112);
  double v20 = *(double *)(a1 + 120);
  uint64_t v21 = [*(id *)(a1 + 32) device];
  uint64_t v22 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:", v21, 3, 3, v14, v16, v17, v18, v19, v20, v19, v20);

  uint64_t v23 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotDate];
  [v23 setDefaultLayoutRule:v22 forState:a2];
}

void sub_16A44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained delegate];
    [v2 faceViewDidChangeWantsStatusBarIconShadow];

    id WeakRetained = v3;
  }
}

void sub_16D18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_16E38(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = *(id *)a3;
  id v9 = v7;
  long long v8 = *(_OWORD *)(a3 + 24);
  long long v10 = *(_OWORD *)(a3 + 8);
  long long v11 = v8;
  if (WeakRetained) {
    [WeakRetained _handleTimeUpdate:&v9];
  }
  else {
}
  }

void sub_16EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_16ED4(id a1)
{
  return (NSString *)@"bellona face view minute update";
}

void sub_16FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_16FEC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = *(id *)a3;
  id v9 = v7;
  long long v8 = *(_OWORD *)(a3 + 24);
  long long v10 = *(_OWORD *)(a3 + 8);
  long long v11 = v8;
  if (WeakRetained) {
    [WeakRetained _handleTimeUpdate:&v9];
  }
  else {
}
  }

void sub_17074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_17088(id a1)
{
  return (NSString *)@"bellona face view second update";
}

void sub_1717C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_171A0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = *(id *)a3;
  id v9 = v7;
  long long v8 = *(_OWORD *)(a3 + 24);
  long long v10 = *(_OWORD *)(a3 + 8);
  long long v11 = v8;
  if (WeakRetained) {
    [WeakRetained _handleTimeUpdate:&v9];
  }
  else {
}
  }

void sub_17228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1723C(id a1)
{
  return (NSString *)@"bellona face view subsecond update";
}

void sub_1742C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_174EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v54[0] = &off_3F320;
  long long v47 = xmmword_33880;
  uint64_t v35 = +[NSValue valueWithBytes:&v47 objCType:"{CGPoint=dd}"];
  v55[0] = v35;
  v54[1] = &off_3F338;
  long long v46 = xmmword_33890;
  id v3 = +[NSValue valueWithBytes:&v46 objCType:"{CGPoint=dd}"];
  v55[1] = v3;
  v54[2] = &off_3F350;
  long long v45 = xmmword_338A0;
  double v4 = +[NSValue valueWithBytes:&v45 objCType:"{CGPoint=dd}"];
  v55[2] = v4;
  void v54[3] = &off_3F368;
  long long v44 = xmmword_338B0;
  id v5 = +[NSValue valueWithBytes:&v44 objCType:"{CGPoint=dd}"];
  void v55[3] = v5;
  v54[4] = &off_3F380;
  long long v43 = xmmword_338C0;
  double v6 = +[NSValue valueWithBytes:&v43 objCType:"{CGPoint=dd}"];
  v55[4] = v6;
  v54[5] = &off_3F398;
  long long v42 = xmmword_338B0;
  id v7 = +[NSValue valueWithBytes:&v42 objCType:"{CGPoint=dd}"];
  v55[5] = v7;
  long long v8 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:6];
  objc_msgSend(v2, "scaledPoint:withOverrides:", v8, -34.0, 0.0);
  qword_4CD78 = v9;
  *(void *)&xmmword_4CD80 = v10;

  v52[0] = &off_3F320;
  long long v41 = xmmword_338D0;
  long long v11 = +[NSValue valueWithBytes:&v41 objCType:"{CGPoint=dd}"];
  v53[0] = v11;
  v52[1] = &off_3F338;
  long long v40 = xmmword_338E0;
  long long v12 = +[NSValue valueWithBytes:&v40 objCType:"{CGPoint=dd}"];
  v53[1] = v12;
  v52[2] = &off_3F350;
  long long v39 = xmmword_338F0;
  long long v13 = +[NSValue valueWithBytes:&v39 objCType:"{CGPoint=dd}"];
  v53[2] = v13;
  void v52[3] = &off_3F368;
  long long v38 = xmmword_338E0;
  double v14 = +[NSValue valueWithBytes:&v38 objCType:"{CGPoint=dd}"];
  void v53[3] = v14;
  v52[4] = &off_3F380;
  long long v37 = xmmword_338D0;
  double v15 = +[NSValue valueWithBytes:&v37 objCType:"{CGPoint=dd}"];
  v53[4] = v15;
  v52[5] = &off_3F398;
  long long v36 = xmmword_338E0;
  double v16 = +[NSValue valueWithBytes:&v36 objCType:"{CGPoint=dd}"];
  v53[5] = v16;
  double v17 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:6];
  objc_msgSend(v2, "scaledSize:withOverrides:", v17, 50.0, 18.0);
  *((void *)&xmmword_4CD60 + 1) = v18;
  unk_4CD70 = v19;

  [v2 scaledValue:38.0];
  qword_4CD98 = v20;
  [v2 scaledValue:50.0];
  *(void *)&xmmword_4CDA0 = v21;
  [v2 scaledValue:4.0];
  *((void *)&xmmword_4CDA0 + 1) = v22;
  [v2 scaledValue:3.0];
  qword_4CDB0 = v23;
  [v2 scaledValue:30.5];
  qword_4CDB8 = v24;
  [v2 scaledValue:20.5];
  *(void *)&xmmword_4CDC0 = v25;
  v50[0] = &off_3F320;
  v50[1] = &off_3F338;
  v51[0] = &off_3FD78;
  v51[1] = &off_3FD78;
  v50[2] = &off_3F350;
  void v50[3] = &off_3F368;
  v51[2] = &off_3F3B0;
  void v51[3] = &off_3FD88;
  v50[4] = &off_3F380;
  v50[5] = &off_3F398;
  v51[4] = &off_3FD98;
  v51[5] = &off_3FDA8;
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:6];
  [v2 scaledValue:v26 withOverrides:131.5];
  double v28 = v27;

  [v2 scaledValue:v28];
  v48[0] = &off_3F320;
  v48[1] = &off_3F338;
  *((void *)&xmmword_4CDC0 + 1) = v29;
  v49[0] = &off_3FDB8;
  v49[1] = &off_3FDC8;
  v48[2] = &off_3F350;
  void v48[3] = &off_3F368;
  v49[2] = &off_3FDC8;
  void v49[3] = &off_3FDB8;
  v48[4] = &off_3F380;
  v48[5] = &off_3F398;
  v49[4] = &off_3FDB8;
  v49[5] = &off_3FDB8;
  uint64_t v30 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:6];
  [v2 scaledValue:v30 withOverrides:-10.0];
  double v32 = v31;

  [v2 scaledValue:v32];
  qword_4CDD0 = v33;
  *(_OWORD *)algn_4CDD8 = xmmword_33900;
  [v2 scaledValue:29.0];
  *(void *)&xmmword_4CD60 = v34;
}

void sub_18014(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CE58);
  id WeakRetained = objc_loadWeakRetained(&qword_4CE60);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4CE60);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4CE68;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4CE60, obj);
  qword_4CE68 = (uint64_t)[obj version];

  sub_18CD4(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CE58);
  long long v10 = *(_OWORD *)&byte_4CE08[40];
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&byte_4CE08[24];
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_4CE40;
  *(void *)(a2 + 80) = qword_4CE50;
  long long v11 = *(_OWORD *)&byte_4CE08[8];
  *(_OWORD *)a2 = unk_4CE00;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_18268(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = 0;
  long long v23 = 0u;
  memset(v22, 0, sizeof(v22));
  double v4 = [*(id *)(a1 + 32) device];
  sub_18014(v4, (uint64_t)v22);

  [*(id *)(a1 + 32) bounds];
  CGFloat v5 = (CGRectGetMidX(v25) - *(double *)&v23) * 0.5;
  [*(id *)(a1 + 32) bounds];
  CGFloat MidY = CGRectGetMidY(v26);
  double v7 = *(double *)v22;
  CGFloat v8 = (MidY - *((double *)&v22[3] + 1)) * 0.5;
  uint64_t v9 = [*(id *)(a1 + 32) device];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  long long v19 = *(_OWORD *)((char *)v22 + 8);
  long long v20 = *(_OWORD *)((char *)&v22[1] + 8);
  long long v21 = *(_OWORD *)((char *)&v22[2] + 8);
  long long v13 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v9, 3, 3, 0, &v19, v5, v8, v7, v7, UIEdgeInsetsZero.top, left, bottom, right);

  double v14 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotTopLeft];
  [v14 setDefaultLayoutRule:v13 forState:a2];

  [*(id *)(a1 + 32) bounds];
  CGFloat v15 = CGRectGetWidth(v27) - v5 - v7;
  double v16 = [*(id *)(a1 + 32) device];
  long long v19 = *(_OWORD *)((char *)v22 + 8);
  long long v20 = *(_OWORD *)((char *)&v22[1] + 8);
  long long v21 = *(_OWORD *)((char *)&v22[2] + 8);
  double v17 = +[NTKComplicationLayoutRule layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:](NTKComplicationLayoutRule, "layoutRuleForDevice:withReferenceFrame:horizontalLayout:verticalLayout:keylinePadding:clip:contentTransform:", v16, 3, 3, 0, &v19, v15, v8, v7, v7, UIEdgeInsetsZero.top, left, bottom, right);

  uint64_t v18 = [*(id *)(a1 + 32) complicationLayoutforSlot:NTKComplicationSlotTopRight];
  [v18 setDefaultLayoutRule:v17 forState:a2];
}

void sub_1894C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    CGFloat v5 = *(void **)(a1 + 40);
    id v6 = [v5 colorPalette];
    uint64_t v7 = *(void *)(a1 + 32);
    CGFloat v8 = [v9 display];
    [v5 _updateComplicationColorForPalette:v6 slot:v7 view:v8];
  }
}

void sub_18CD4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 scaledValue:30.0];
  double v5 = v4;
  NTKWhistlerSubdialComplicationContentDiameter();
  double v7 = v6;

  unk_4CE00 = *(void *)&v7;
  CGAffineTransformMakeScale(&v12, v5 / v7, v5 / v7);
  *(CGAffineTransform *)byte_4CE08 = v12;
  [v3 scaledValue:94.5];
  qword_4CE38 = v8;
  [v3 scaledValue:73.0];
  *(void *)&xmmword_4CE40 = v9;
  objc_msgSend(v3, "scaledPoint:", -136.0, -245.5);
  *((void *)&xmmword_4CE40 + 1) = v10;
  qword_4CE50 = v11;
}

void sub_18F98(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CE98);
  id WeakRetained = objc_loadWeakRetained(&qword_4CEA0);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4CEA0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4CEA8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4CEA0, obj);
  qword_4CEA8 = (uint64_t)[obj version];

  sub_195EC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CE98);
  long long v10 = *(_OWORD *)&qword_4CE80;
  *(_OWORD *)a2 = xmmword_4CE70;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_4CE90;
}

void sub_195EC(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:4.5];
  qword_4CE88 = v3;
  v15[0] = &off_3F3E0;
  v15[1] = &off_3F3F8;
  v16[0] = &off_3FDD8;
  v16[1] = &off_3FDE8;
  v15[2] = &off_3F410;
  v16[2] = &off_3FDF8;
  double v4 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 scaledValue:v4 withOverrides:6.5];
  *(void *)&xmmword_4CE70 = v5;

  v13[0] = &off_3F3E0;
  v13[1] = &off_3F3F8;
  v14[0] = &off_3FE08;
  v14[1] = &off_3FE18;
  v13[2] = &off_3F410;
  v14[2] = &off_3FE28;
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 scaledValue:v6 withOverrides:4.5];
  *((void *)&xmmword_4CE70 + 1) = v7;

  v11[0] = &off_3F3E0;
  v11[1] = &off_3F3F8;
  v12[0] = &off_3FE38;
  v12[1] = &off_3FE48;
  v11[2] = &off_3F410;
  v12[2] = &off_3FE38;
  id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v2 scaledValue:v8 withOverrides:2.0];
  qword_4CE80 = v9;

  [v2 scaledValue:16.0];
  qword_4CE90 = v10;
}

void sub_19B94(id a1, NSNumber *a2, UIImageView *a3, BOOL *a4)
{
}

void sub_19DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_19E20(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateHour:*(void *)(a3 + 8)];
}

void sub_19E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_19E9C(id a1)
{
  return (NSString *)@"NTKHadesFaceView hour label";
}

void sub_19F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_1A2FC(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CEC8);
  id WeakRetained = objc_loadWeakRetained(&qword_4CED0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_4CED0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_4CED0, v1);
    qword_4CED8 = (uint64_t)[v1 version];

    sub_1B3D4(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_4CED8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CEC8);
  double v9 = *(double *)&qword_4CEB8;

  return v9;
}

void sub_1A3F4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = a2;
  [v14 bounds];
  uint64_t v6 = [*(id *)(a1 + 32) device];
  CLKRectCenteredXInRectForDevice();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = a1 + 8 * (void)[v5 integerValue];
  objc_msgSend(v14, "ntk_setBoundsAndPositionFromFrame:", v8, *(double *)(v13 + 72), v10, v12);
}

void sub_1A65C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v6 integerValue] != *(id *)(*(void *)(a1 + 32) + 32))
  {
    [v5 removeFromSuperview];
    [*(id *)(a1 + 40) addObject:v6];
  }
}

id sub_1A6E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:a2];
}

void **sub_1AE68(void **result, uint64_t a2, void *a3)
{
  if (result[4] != a3) {
    return (void **)[a3 removeFromSuperview];
  }
  return result;
}

void sub_1AE80(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (*(id *)(a1 + 32) != v4 && *(id *)(a1 + 40) != v4)
  {
    id v5 = v4;
    [v4 removeFromSuperview];
    id v4 = v5;
  }
}

void sub_1B3D4(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v4 scaledValue:60.0];
  qword_4CEB8 = v2;
  [v4 scaledValue:45.5];
  qword_4CEC0 = v3;
}

void sub_1B884(id a1)
{
  id v1 = (void *)qword_4CEE0;
  qword_4CEE0 = (uint64_t)&off_3FB58;
}

void sub_1B9AC(id a1)
{
  v3[0] = &off_3F488;
  v3[1] = &off_3F4A0;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_4CEF0;
  qword_4CEF0 = v1;
}

double sub_1BE50(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CF18);
  id WeakRetained = objc_loadWeakRetained(&qword_4CF20);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_4CF20);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_4CF20, v1);
    qword_4CF28 = (uint64_t)[v1 version];

    sub_1C5F0(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_4CF28;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CF18);
  double v9 = *(double *)&qword_4CF00;

  return v9;
}

void sub_1C5F0(uint64_t a1, uint64_t a2)
{
  id v5 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v5 scaledValue:3 withOverride:5.0 forSizeClass:5.0];
  qword_4CF00 = v2;
  [v5 scaledValue:3 withOverride:4.5 forSizeClass:4.5];
  qword_4CF08 = v3;
  [v5 scaledValue:3 withOverride:15.0 forSizeClass:17.0];
  qword_4CF10 = v4;
}

void sub_1CE50(uint64_t a1, uint64_t a2)
{
  id v6 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  objc_msgSend(v6, "scaledPoint:", 59.0, -217.5);
  qword_4CF30 = v2;
  qword_4CF38 = v3;
  objc_msgSend(v6, "scaledPoint:", -10.0, -181.5);
  qword_4CF40 = v4;
  qword_4CF48 = v5;
}

void sub_1DA00(id a1)
{
  qword_4CF68 = +[NSMapTable strongToWeakObjectsMapTable];

  _objc_release_x1();
}

void sub_1DEE8()
{
  __chkstk_darwin();
  id v1 = +[CLKDeviceMetrics metricsWithDevice:v0 identitySizeClass:2];
  [v1 setScale:6 forSizeClass:1.25];
  v2108[0] = &off_3F4E8;
  long long v1725 = xmmword_33950;
  uint64_t v2 = +[NSValue valueWithBytes:&v1725 objCType:"{CGPoint=dd}"];
  v2109[0] = v2;
  v2108[1] = &off_3F500;
  long long v1724 = xmmword_33960;
  uint64_t v3 = +[NSValue valueWithBytes:&v1724 objCType:"{CGPoint=dd}"];
  v2109[1] = v3;
  v2108[2] = &off_3F518;
  long long v1723 = xmmword_33970;
  uint64_t v4 = +[NSValue valueWithBytes:&v1723 objCType:"{CGPoint=dd}"];
  v2109[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v2109 forKeys:v2108 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v5);
  qword_4CF78 = v6;
  unk_4CF80 = v7;

  v2106[0] = &off_3F4E8;
  long long v1722 = xmmword_33980;
  uint64_t v8 = +[NSValue valueWithBytes:&v1722 objCType:"{CGPoint=dd}"];
  v2107[0] = v8;
  v2106[1] = &off_3F500;
  long long v1721 = xmmword_33990;
  double v9 = +[NSValue valueWithBytes:&v1721 objCType:"{CGPoint=dd}"];
  v2107[1] = v9;
  v2106[2] = &off_3F518;
  long long v1720 = xmmword_339A0;
  double v10 = +[NSValue valueWithBytes:&v1720 objCType:"{CGPoint=dd}"];
  v2107[2] = v10;
  double v11 = +[NSDictionary dictionaryWithObjects:v2107 forKeys:v2106 count:3];
  [v1 scaledPoint:v11 withOverrides:61.0];
  qword_4CF88 = v12;
  unk_4CF90 = v13;

  v2104[0] = &off_3F4E8;
  long long v1719 = xmmword_339B0;
  id v14 = +[NSValue valueWithBytes:&v1719 objCType:"{CGPoint=dd}"];
  v2105[0] = v14;
  v2104[1] = &off_3F500;
  long long v1718 = xmmword_339C0;
  CGFloat v15 = +[NSValue valueWithBytes:&v1718 objCType:"{CGPoint=dd}"];
  v2105[1] = v15;
  v2104[2] = &off_3F518;
  long long v1717 = xmmword_339D0;
  double v16 = +[NSValue valueWithBytes:&v1717 objCType:"{CGPoint=dd}"];
  v2105[2] = v16;
  double v17 = +[NSDictionary dictionaryWithObjects:v2105 forKeys:v2104 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v17, 61.0, 0.0);
  qword_4CF98 = v18;
  unk_4CFA0 = v19;

  v2102[0] = &off_3F4E8;
  long long v1716 = xmmword_339E0;
  long long v20 = +[NSValue valueWithBytes:&v1716 objCType:"{CGPoint=dd}"];
  v2103[0] = v20;
  v2102[1] = &off_3F500;
  long long v1715 = xmmword_339F0;
  long long v21 = +[NSValue valueWithBytes:&v1715 objCType:"{CGPoint=dd}"];
  v2103[1] = v21;
  v2102[2] = &off_3F518;
  long long v1714 = xmmword_33A00;
  uint64_t v22 = +[NSValue valueWithBytes:&v1714 objCType:"{CGPoint=dd}"];
  v2103[2] = v22;
  long long v23 = +[NSDictionary dictionaryWithObjects:v2103 forKeys:v2102 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v23);
  qword_4CFA8 = v24;
  unk_4CFB0 = v25;

  v2100[0] = &off_3F4E8;
  long long v1713 = xmmword_33A10;
  CGRect v26 = +[NSValue valueWithBytes:&v1713 objCType:"{CGPoint=dd}"];
  v2101[0] = v26;
  v2100[1] = &off_3F500;
  long long v1712 = xmmword_33A20;
  CGRect v27 = +[NSValue valueWithBytes:&v1712 objCType:"{CGPoint=dd}"];
  v2101[1] = v27;
  v2100[2] = &off_3F518;
  long long v1711 = xmmword_33A30;
  double v28 = +[NSValue valueWithBytes:&v1711 objCType:"{CGPoint=dd}"];
  v2101[2] = v28;
  uint64_t v29 = +[NSDictionary dictionaryWithObjects:v2101 forKeys:v2100 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v29, 44.0, 75.5);
  qword_4CFB8 = v30;
  unk_4CFC0 = v31;

  v2098[0] = &off_3F4E8;
  long long v1710 = xmmword_33A40;
  double v32 = +[NSValue valueWithBytes:&v1710 objCType:"{CGPoint=dd}"];
  v2099[0] = v32;
  v2098[1] = &off_3F500;
  long long v1709 = xmmword_33A50;
  uint64_t v33 = +[NSValue valueWithBytes:&v1709 objCType:"{CGPoint=dd}"];
  v2099[1] = v33;
  v2098[2] = &off_3F518;
  long long v1708 = xmmword_33A60;
  uint64_t v34 = +[NSValue valueWithBytes:&v1708 objCType:"{CGPoint=dd}"];
  v2099[2] = v34;
  uint64_t v35 = +[NSDictionary dictionaryWithObjects:v2099 forKeys:v2098 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v35, 1.5, 75.5);
  qword_4CFC8 = v36;
  unk_4CFD0 = v37;

  v2096[0] = &off_3F4E8;
  long long v1707 = xmmword_33A70;
  long long v38 = +[NSValue valueWithBytes:&v1707 objCType:"{CGPoint=dd}"];
  v2097[0] = v38;
  v2096[1] = &off_3F500;
  long long v1706 = xmmword_33A80;
  long long v39 = +[NSValue valueWithBytes:&v1706 objCType:"{CGPoint=dd}"];
  v2097[1] = v39;
  v2096[2] = &off_3F518;
  long long v1705 = xmmword_33A90;
  long long v40 = +[NSValue valueWithBytes:&v1705 objCType:"{CGPoint=dd}"];
  v2097[2] = v40;
  long long v41 = +[NSDictionary dictionaryWithObjects:v2097 forKeys:v2096 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v41);
  qword_4CFD8 = v42;
  unk_4CFE0 = v43;

  v2094[0] = &off_3F4E8;
  long long v1704 = xmmword_33AA0;
  long long v44 = +[NSValue valueWithBytes:&v1704 objCType:"{CGPoint=dd}"];
  v2095[0] = v44;
  v2094[1] = &off_3F500;
  long long v1703 = xmmword_33AB0;
  long long v45 = +[NSValue valueWithBytes:&v1703 objCType:"{CGPoint=dd}"];
  v2095[1] = v45;
  v2094[2] = &off_3F518;
  long long v1702 = xmmword_33AC0;
  long long v46 = +[NSValue valueWithBytes:&v1702 objCType:"{CGPoint=dd}"];
  v2095[2] = v46;
  long long v47 = +[NSDictionary dictionaryWithObjects:v2095 forKeys:v2094 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v47, -59.0, 37.0);
  qword_4CFE8 = v48;
  unk_4CFF0 = v49;

  v2092[0] = &off_3F4E8;
  long long v1701 = xmmword_33AD0;
  v50 = +[NSValue valueWithBytes:&v1701 objCType:"{CGPoint=dd}"];
  v2093[0] = v50;
  v2092[1] = &off_3F500;
  long long v1700 = xmmword_33AE0;
  v51 = +[NSValue valueWithBytes:&v1700 objCType:"{CGPoint=dd}"];
  v2093[1] = v51;
  v2092[2] = &off_3F518;
  long long v1699 = xmmword_33AF0;
  v52 = +[NSValue valueWithBytes:&v1699 objCType:"{CGPoint=dd}"];
  v2093[2] = v52;
  v53 = +[NSDictionary dictionaryWithObjects:v2093 forKeys:v2092 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v53, -59.0, 0.0);
  qword_4CFF8 = v54;
  unk_4D000 = v55;

  v2090[0] = &off_3F4E8;
  long long v1698 = xmmword_33B00;
  v56 = +[NSValue valueWithBytes:&v1698 objCType:"{CGPoint=dd}"];
  v2091[0] = v56;
  v2090[1] = &off_3F500;
  long long v1697 = xmmword_33B10;
  v57 = +[NSValue valueWithBytes:&v1697 objCType:"{CGPoint=dd}"];
  v2091[1] = v57;
  v2090[2] = &off_3F518;
  long long v1696 = xmmword_33B20;
  v58 = +[NSValue valueWithBytes:&v1696 objCType:"{CGPoint=dd}"];
  v2091[2] = v58;
  v59 = +[NSDictionary dictionaryWithObjects:v2091 forKeys:v2090 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v59, -59.0, -36.5);
  qword_4D008 = v60;
  unk_4D010 = v61;

  v2088[0] = &off_3F4E8;
  long long v1695 = xmmword_33B30;
  v62 = +[NSValue valueWithBytes:&v1695 objCType:"{CGPoint=dd}"];
  v2089[0] = v62;
  v2088[1] = &off_3F500;
  long long v1694 = xmmword_33B40;
  v63 = +[NSValue valueWithBytes:&v1694 objCType:"{CGPoint=dd}"];
  v2089[1] = v63;
  v2088[2] = &off_3F518;
  long long v1693 = xmmword_33B50;
  v64 = +[NSValue valueWithBytes:&v1693 objCType:"{CGPoint=dd}"];
  v2089[2] = v64;
  v65 = +[NSDictionary dictionaryWithObjects:v2089 forKeys:v2088 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v65);
  qword_4D018 = v66;
  unk_4D020 = v67;

  v2086[0] = &off_3F4E8;
  long long v1692 = xmmword_33B60;
  v68 = +[NSValue valueWithBytes:&v1692 objCType:"{CGPoint=dd}"];
  v2087[0] = v68;
  v2086[1] = &off_3F500;
  long long v1691 = xmmword_33B70;
  v69 = +[NSValue valueWithBytes:&v1691 objCType:"{CGPoint=dd}"];
  v2087[1] = v69;
  v2086[2] = &off_3F518;
  long long v1690 = xmmword_33B80;
  v70 = +[NSValue valueWithBytes:&v1690 objCType:"{CGPoint=dd}"];
  v2087[2] = v70;
  v71 = +[NSDictionary dictionaryWithObjects:v2087 forKeys:v2086 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v71, 1.0, -79.0);
  qword_4D028 = v72;
  unk_4D030 = v73;

  v2084[0] = &off_3F4E8;
  long long v1689 = xmmword_33B90;
  v74 = +[NSValue valueWithBytes:&v1689 objCType:"{CGPoint=dd}"];
  v2085[0] = v74;
  v2084[1] = &off_3F500;
  long long v1688 = xmmword_33BA0;
  v75 = +[NSValue valueWithBytes:&v1688 objCType:"{CGPoint=dd}"];
  v2085[1] = v75;
  v2084[2] = &off_3F518;
  long long v1687 = xmmword_33BB0;
  v76 = +[NSValue valueWithBytes:&v1687 objCType:"{CGPoint=dd}"];
  v2085[2] = v76;
  v77 = +[NSDictionary dictionaryWithObjects:v2085 forKeys:v2084 count:3];
  [v1 scaledPoint:v77 withOverrides:44.5];
  qword_4D278 = v78;
  qword_4D280 = v79;

  v2082[0] = &off_3F4E8;
  long long v1686 = xmmword_33980;
  v80 = +[NSValue valueWithBytes:&v1686 objCType:"{CGPoint=dd}"];
  v2083[0] = v80;
  v2082[1] = &off_3F500;
  long long v1685 = xmmword_33990;
  v81 = +[NSValue valueWithBytes:&v1685 objCType:"{CGPoint=dd}"];
  v2083[1] = v81;
  v2082[2] = &off_3F518;
  long long v1684 = xmmword_339A0;
  v82 = +[NSValue valueWithBytes:&v1684 objCType:"{CGPoint=dd}"];
  v2083[2] = v82;
  v83 = +[NSDictionary dictionaryWithObjects:v2083 forKeys:v2082 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v83, 61.0, -36.5);
  qword_4D288 = v84;
  qword_4D290 = v85;

  v2080[0] = &off_3F4E8;
  long long v1683 = xmmword_339B0;
  v86 = +[NSValue valueWithBytes:&v1683 objCType:"{CGPoint=dd}"];
  v2081[0] = v86;
  v2080[1] = &off_3F500;
  long long v1682 = xmmword_339C0;
  v87 = +[NSValue valueWithBytes:&v1682 objCType:"{CGPoint=dd}"];
  v2081[1] = v87;
  v2080[2] = &off_3F518;
  long long v1681 = xmmword_339D0;
  v88 = +[NSValue valueWithBytes:&v1681 objCType:"{CGPoint=dd}"];
  v2081[2] = v88;
  v89 = +[NSDictionary dictionaryWithObjects:v2081 forKeys:v2080 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v89, 61.0, 0.0);
  qword_4D298 = v90;
  qword_4D2A0 = v91;

  v2078[0] = &off_3F4E8;
  long long v1680 = xmmword_339E0;
  v92 = +[NSValue valueWithBytes:&v1680 objCType:"{CGPoint=dd}"];
  v2079[0] = v92;
  v2078[1] = &off_3F500;
  long long v1679 = xmmword_339F0;
  v93 = +[NSValue valueWithBytes:&v1679 objCType:"{CGPoint=dd}"];
  v2079[1] = v93;
  v2078[2] = &off_3F518;
  long long v1678 = xmmword_33A00;
  v94 = +[NSValue valueWithBytes:&v1678 objCType:"{CGPoint=dd}"];
  v2079[2] = v94;
  v95 = +[NSDictionary dictionaryWithObjects:v2079 forKeys:v2078 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v95, 62.0, 37.0);
  qword_4D2A8 = v96;
  qword_4D2B0 = v97;

  v2076[0] = &off_3F4E8;
  long long v1677 = xmmword_33A10;
  v98 = +[NSValue valueWithBytes:&v1677 objCType:"{CGPoint=dd}"];
  v2077[0] = v98;
  v2076[1] = &off_3F500;
  long long v1676 = xmmword_33A20;
  v99 = +[NSValue valueWithBytes:&v1676 objCType:"{CGPoint=dd}"];
  v2077[1] = v99;
  v2076[2] = &off_3F518;
  long long v1675 = xmmword_33A30;
  v100 = +[NSValue valueWithBytes:&v1675 objCType:"{CGPoint=dd}"];
  v2077[2] = v100;
  v101 = +[NSDictionary dictionaryWithObjects:v2077 forKeys:v2076 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v101, 44.0, 75.5);
  qword_4D2B8 = v102;
  qword_4D2C0 = v103;

  v2074[0] = &off_3F4E8;
  long long v1674 = xmmword_33A40;
  v104 = +[NSValue valueWithBytes:&v1674 objCType:"{CGPoint=dd}"];
  v2075[0] = v104;
  v2074[1] = &off_3F500;
  long long v1673 = xmmword_33A50;
  v105 = +[NSValue valueWithBytes:&v1673 objCType:"{CGPoint=dd}"];
  v2075[1] = v105;
  v2074[2] = &off_3F518;
  long long v1672 = xmmword_33A60;
  v106 = +[NSValue valueWithBytes:&v1672 objCType:"{CGPoint=dd}"];
  v2075[2] = v106;
  v107 = +[NSDictionary dictionaryWithObjects:v2075 forKeys:v2074 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v107, 1.5, 75.5);
  qword_4D2C8 = v108;
  qword_4D2D0 = v109;

  v2072[0] = &off_3F4E8;
  long long v1671 = xmmword_33A70;
  v110 = +[NSValue valueWithBytes:&v1671 objCType:"{CGPoint=dd}"];
  v2073[0] = v110;
  v2072[1] = &off_3F500;
  long long v1670 = xmmword_33A80;
  v111 = +[NSValue valueWithBytes:&v1670 objCType:"{CGPoint=dd}"];
  v2073[1] = v111;
  v2072[2] = &off_3F518;
  long long v1669 = xmmword_33A90;
  v112 = +[NSValue valueWithBytes:&v1669 objCType:"{CGPoint=dd}"];
  v2073[2] = v112;
  v113 = +[NSDictionary dictionaryWithObjects:v2073 forKeys:v2072 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v113, -42.5, 75.5);
  qword_4D2D8 = v114;
  qword_4D2E0 = v115;

  v2070[0] = &off_3F4E8;
  long long v1668 = xmmword_33AA0;
  v116 = +[NSValue valueWithBytes:&v1668 objCType:"{CGPoint=dd}"];
  v2071[0] = v116;
  v2070[1] = &off_3F500;
  long long v1667 = xmmword_33AB0;
  v117 = +[NSValue valueWithBytes:&v1667 objCType:"{CGPoint=dd}"];
  v2071[1] = v117;
  v2070[2] = &off_3F518;
  long long v1666 = xmmword_33AC0;
  v118 = +[NSValue valueWithBytes:&v1666 objCType:"{CGPoint=dd}"];
  v2071[2] = v118;
  v119 = +[NSDictionary dictionaryWithObjects:v2071 forKeys:v2070 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v119, -59.0, 37.0);
  qword_4D2E8 = v120;
  qword_4D2F0 = v121;

  v2068[0] = &off_3F4E8;
  long long v1665 = xmmword_33AD0;
  v122 = +[NSValue valueWithBytes:&v1665 objCType:"{CGPoint=dd}"];
  v2069[0] = v122;
  v2068[1] = &off_3F500;
  long long v1664 = xmmword_33AE0;
  v123 = +[NSValue valueWithBytes:&v1664 objCType:"{CGPoint=dd}"];
  v2069[1] = v123;
  v2068[2] = &off_3F518;
  long long v1663 = xmmword_33AF0;
  v124 = +[NSValue valueWithBytes:&v1663 objCType:"{CGPoint=dd}"];
  v2069[2] = v124;
  v125 = +[NSDictionary dictionaryWithObjects:v2069 forKeys:v2068 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v125, -59.0, 0.0);
  qword_4D2F8 = v126;
  qword_4D300 = v127;

  v2066[0] = &off_3F4E8;
  long long v1662 = xmmword_33B00;
  v128 = +[NSValue valueWithBytes:&v1662 objCType:"{CGPoint=dd}"];
  v2067[0] = v128;
  v2066[1] = &off_3F500;
  long long v1661 = xmmword_33B10;
  v129 = +[NSValue valueWithBytes:&v1661 objCType:"{CGPoint=dd}"];
  v2067[1] = v129;
  v2066[2] = &off_3F518;
  long long v1660 = xmmword_33B20;
  v130 = +[NSValue valueWithBytes:&v1660 objCType:"{CGPoint=dd}"];
  v2067[2] = v130;
  v131 = +[NSDictionary dictionaryWithObjects:v2067 forKeys:v2066 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v131, -59.0, -36.5);
  qword_4D308 = v132;
  qword_4D310 = v133;

  v2064[0] = &off_3F4E8;
  long long v1659 = xmmword_33BC0;
  v134 = +[NSValue valueWithBytes:&v1659 objCType:"{CGPoint=dd}"];
  v2065[0] = v134;
  v2064[1] = &off_3F500;
  long long v1658 = xmmword_33BD0;
  v135 = +[NSValue valueWithBytes:&v1658 objCType:"{CGPoint=dd}"];
  v2065[1] = v135;
  v2064[2] = &off_3F518;
  long long v1657 = xmmword_33BE0;
  v136 = +[NSValue valueWithBytes:&v1657 objCType:"{CGPoint=dd}"];
  v2065[2] = v136;
  v137 = +[NSDictionary dictionaryWithObjects:v2065 forKeys:v2064 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v137, -43.0, -74.5);
  qword_4D318 = v138;
  qword_4D320 = v139;

  v2062[0] = &off_3F4E8;
  long long v1656 = xmmword_33BF0;
  v140 = +[NSValue valueWithBytes:&v1656 objCType:"{CGPoint=dd}"];
  v2063[0] = v140;
  v2062[1] = &off_3F500;
  long long v1655 = xmmword_33C00;
  v141 = +[NSValue valueWithBytes:&v1655 objCType:"{CGPoint=dd}"];
  v2063[1] = v141;
  v2062[2] = &off_3F518;
  long long v1654 = xmmword_33C10;
  v142 = +[NSValue valueWithBytes:&v1654 objCType:"{CGPoint=dd}"];
  v2063[2] = v142;
  v143 = +[NSDictionary dictionaryWithObjects:v2063 forKeys:v2062 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v143, 1.0, -74.5);
  qword_4D328 = v144;
  qword_4D330 = v145;

  v2060[0] = &off_3F4E8;
  long long v1653 = xmmword_33950;
  v146 = +[NSValue valueWithBytes:&v1653 objCType:"{CGPoint=dd}"];
  v2061[0] = v146;
  v2060[1] = &off_3F500;
  long long v1652 = xmmword_33960;
  v147 = +[NSValue valueWithBytes:&v1652 objCType:"{CGPoint=dd}"];
  v2061[1] = v147;
  v2060[2] = &off_3F518;
  long long v1651 = xmmword_33BB0;
  v148 = +[NSValue valueWithBytes:&v1651 objCType:"{CGPoint=dd}"];
  v2061[2] = v148;
  v149 = +[NSDictionary dictionaryWithObjects:v2061 forKeys:v2060 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v149, 44.5, -74.5);
  qword_4D578 = v150;
  qword_4D580 = v151;

  v2058[0] = &off_3F4E8;
  long long v1650 = xmmword_33980;
  v152 = +[NSValue valueWithBytes:&v1650 objCType:"{CGPoint=dd}"];
  v2059[0] = v152;
  v2058[1] = &off_3F500;
  long long v1649 = xmmword_33990;
  v153 = +[NSValue valueWithBytes:&v1649 objCType:"{CGPoint=dd}"];
  v2059[1] = v153;
  v2058[2] = &off_3F518;
  long long v1648 = xmmword_33C20;
  v154 = +[NSValue valueWithBytes:&v1648 objCType:"{CGPoint=dd}"];
  v2059[2] = v154;
  v155 = +[NSDictionary dictionaryWithObjects:v2059 forKeys:v2058 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v155, 61.0, -36.5);
  qword_4D588 = v156;
  qword_4D590 = v157;

  v2056[0] = &off_3F4E8;
  long long v1647 = xmmword_339B0;
  v158 = +[NSValue valueWithBytes:&v1647 objCType:"{CGPoint=dd}"];
  v2057[0] = v158;
  v2056[1] = &off_3F500;
  long long v1646 = xmmword_339C0;
  v159 = +[NSValue valueWithBytes:&v1646 objCType:"{CGPoint=dd}"];
  v2057[1] = v159;
  v2056[2] = &off_3F518;
  long long v1645 = xmmword_33C30;
  v160 = +[NSValue valueWithBytes:&v1645 objCType:"{CGPoint=dd}"];
  v2057[2] = v160;
  v161 = +[NSDictionary dictionaryWithObjects:v2057 forKeys:v2056 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v161, 61.0, 0.0);
  qword_4D598 = v162;
  qword_4D5A0 = v163;

  v2054[0] = &off_3F4E8;
  long long v1644 = xmmword_339E0;
  v164 = +[NSValue valueWithBytes:&v1644 objCType:"{CGPoint=dd}"];
  v2055[0] = v164;
  v2054[1] = &off_3F500;
  long long v1643 = xmmword_339F0;
  v165 = +[NSValue valueWithBytes:&v1643 objCType:"{CGPoint=dd}"];
  v2055[1] = v165;
  v2054[2] = &off_3F518;
  long long v1642 = xmmword_33C40;
  v166 = +[NSValue valueWithBytes:&v1642 objCType:"{CGPoint=dd}"];
  v2055[2] = v166;
  v167 = +[NSDictionary dictionaryWithObjects:v2055 forKeys:v2054 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v167, 62.0, 37.0);
  qword_4D5A8 = v168;
  qword_4D5B0 = v169;

  v2052[0] = &off_3F4E8;
  long long v1641 = xmmword_33A10;
  v170 = +[NSValue valueWithBytes:&v1641 objCType:"{CGPoint=dd}"];
  v2053[0] = v170;
  v2052[1] = &off_3F500;
  long long v1640 = xmmword_33A20;
  v171 = +[NSValue valueWithBytes:&v1640 objCType:"{CGPoint=dd}"];
  v2053[1] = v171;
  v2052[2] = &off_3F518;
  long long v1639 = xmmword_33C50;
  v172 = +[NSValue valueWithBytes:&v1639 objCType:"{CGPoint=dd}"];
  v2053[2] = v172;
  v173 = +[NSDictionary dictionaryWithObjects:v2053 forKeys:v2052 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v173, 44.0, 70.5);
  qword_4D5B8 = v174;
  qword_4D5C0 = v175;

  v2050[0] = &off_3F4E8;
  long long v1638 = xmmword_33A40;
  v176 = +[NSValue valueWithBytes:&v1638 objCType:"{CGPoint=dd}"];
  v2051[0] = v176;
  v2050[1] = &off_3F500;
  long long v1637 = xmmword_33A50;
  v177 = +[NSValue valueWithBytes:&v1637 objCType:"{CGPoint=dd}"];
  v2051[1] = v177;
  v2050[2] = &off_3F518;
  long long v1636 = xmmword_33C60;
  v178 = +[NSValue valueWithBytes:&v1636 objCType:"{CGPoint=dd}"];
  v2051[2] = v178;
  v179 = +[NSDictionary dictionaryWithObjects:v2051 forKeys:v2050 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v179, 1.5, 70.5);
  qword_4D5C8 = v180;
  qword_4D5D0 = v181;

  v2048[0] = &off_3F4E8;
  long long v1635 = xmmword_33A70;
  v182 = +[NSValue valueWithBytes:&v1635 objCType:"{CGPoint=dd}"];
  v2049[0] = v182;
  v2048[1] = &off_3F500;
  long long v1634 = xmmword_33A80;
  v183 = +[NSValue valueWithBytes:&v1634 objCType:"{CGPoint=dd}"];
  v2049[1] = v183;
  v2048[2] = &off_3F518;
  long long v1633 = xmmword_33C70;
  v184 = +[NSValue valueWithBytes:&v1633 objCType:"{CGPoint=dd}"];
  v2049[2] = v184;
  v185 = +[NSDictionary dictionaryWithObjects:v2049 forKeys:v2048 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v185, -42.5, 70.5);
  qword_4D5D8 = v186;
  qword_4D5E0 = v187;

  v2046[0] = &off_3F4E8;
  long long v1632 = xmmword_33AA0;
  v188 = +[NSValue valueWithBytes:&v1632 objCType:"{CGPoint=dd}"];
  v2047[0] = v188;
  v2046[1] = &off_3F500;
  long long v1631 = xmmword_33AB0;
  v189 = +[NSValue valueWithBytes:&v1631 objCType:"{CGPoint=dd}"];
  v2047[1] = v189;
  v190 = +[NSDictionary dictionaryWithObjects:v2047 forKeys:v2046 count:2];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v190, -59.0, 37.0);
  qword_4D5E8 = v191;
  qword_4D5F0 = v192;

  v2044[0] = &off_3F4E8;
  long long v1630 = xmmword_33AD0;
  v193 = +[NSValue valueWithBytes:&v1630 objCType:"{CGPoint=dd}"];
  v2045[0] = v193;
  v2044[1] = &off_3F500;
  long long v1629 = xmmword_33AE0;
  v194 = +[NSValue valueWithBytes:&v1629 objCType:"{CGPoint=dd}"];
  v2045[1] = v194;
  v2044[2] = &off_3F518;
  long long v1628 = xmmword_33C80;
  v195 = +[NSValue valueWithBytes:&v1628 objCType:"{CGPoint=dd}"];
  v2045[2] = v195;
  v196 = +[NSDictionary dictionaryWithObjects:v2045 forKeys:v2044 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v196, -59.0, 0.0);
  qword_4D5F8 = v197;
  qword_4D600 = v198;

  v2042[0] = &off_3F4E8;
  long long v1627 = xmmword_33B00;
  v199 = +[NSValue valueWithBytes:&v1627 objCType:"{CGPoint=dd}"];
  v2043[0] = v199;
  v2042[1] = &off_3F500;
  long long v1626 = xmmword_33B10;
  v200 = +[NSValue valueWithBytes:&v1626 objCType:"{CGPoint=dd}"];
  v2043[1] = v200;
  v2042[2] = &off_3F518;
  long long v1625 = xmmword_33C90;
  v201 = +[NSValue valueWithBytes:&v1625 objCType:"{CGPoint=dd}"];
  v2043[2] = v201;
  v202 = +[NSDictionary dictionaryWithObjects:v2043 forKeys:v2042 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v202, -59.0, -36.5);
  qword_4D608 = v203;
  qword_4D610 = v204;

  v2040[0] = &off_3F4E8;
  long long v1624 = xmmword_33B30;
  v205 = +[NSValue valueWithBytes:&v1624 objCType:"{CGPoint=dd}"];
  v2041[0] = v205;
  v2040[1] = &off_3F500;
  long long v1623 = xmmword_33B40;
  v206 = +[NSValue valueWithBytes:&v1623 objCType:"{CGPoint=dd}"];
  v2041[1] = v206;
  v2040[2] = &off_3F518;
  long long v1622 = xmmword_33BE0;
  v207 = +[NSValue valueWithBytes:&v1622 objCType:"{CGPoint=dd}"];
  v2041[2] = v207;
  v208 = +[NSDictionary dictionaryWithObjects:v2041 forKeys:v2040 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v208, -43.0, -74.5);
  qword_4D618 = v209;
  qword_4D620 = v210;

  v2038[0] = &off_3F4E8;
  long long v1621 = xmmword_33B60;
  v211 = +[NSValue valueWithBytes:&v1621 objCType:"{CGPoint=dd}"];
  v2039[0] = v211;
  v2038[1] = &off_3F500;
  long long v1620 = xmmword_33B70;
  v212 = +[NSValue valueWithBytes:&v1620 objCType:"{CGPoint=dd}"];
  v2039[1] = v212;
  v2038[2] = &off_3F518;
  long long v1619 = xmmword_33C10;
  v213 = +[NSValue valueWithBytes:&v1619 objCType:"{CGPoint=dd}"];
  v2039[2] = v213;
  v214 = +[NSDictionary dictionaryWithObjects:v2039 forKeys:v2038 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v214, 1.0, -74.5);
  qword_4D628 = v215;
  qword_4D630 = v216;

  v2036[0] = &off_3F4E8;
  long long v1618 = xmmword_33950;
  v217 = +[NSValue valueWithBytes:&v1618 objCType:"{CGPoint=dd}"];
  v2037[0] = v217;
  v2036[1] = &off_3F500;
  long long v1617 = xmmword_33960;
  v218 = +[NSValue valueWithBytes:&v1617 objCType:"{CGPoint=dd}"];
  v2037[1] = v218;
  v2036[2] = &off_3F518;
  long long v1616 = xmmword_33BB0;
  v219 = +[NSValue valueWithBytes:&v1616 objCType:"{CGPoint=dd}"];
  v2037[2] = v219;
  v220 = +[NSDictionary dictionaryWithObjects:v2037 forKeys:v2036 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v220, 44.5, -74.5);
  qword_4D878 = v221;
  qword_4D880 = v222;

  v2034[0] = &off_3F4E8;
  long long v1615 = xmmword_33980;
  v223 = +[NSValue valueWithBytes:&v1615 objCType:"{CGPoint=dd}"];
  v2035[0] = v223;
  v2034[1] = &off_3F500;
  long long v1614 = xmmword_33990;
  v224 = +[NSValue valueWithBytes:&v1614 objCType:"{CGPoint=dd}"];
  v2035[1] = v224;
  v2034[2] = &off_3F518;
  long long v1613 = xmmword_33C20;
  v225 = +[NSValue valueWithBytes:&v1613 objCType:"{CGPoint=dd}"];
  v2035[2] = v225;
  v226 = +[NSDictionary dictionaryWithObjects:v2035 forKeys:v2034 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v226, 61.0, -36.5);
  qword_4D888 = v227;
  qword_4D890 = v228;

  v2032[0] = &off_3F4E8;
  long long v1612 = xmmword_339B0;
  v229 = +[NSValue valueWithBytes:&v1612 objCType:"{CGPoint=dd}"];
  v2033[0] = v229;
  v2032[1] = &off_3F500;
  long long v1611 = xmmword_339C0;
  v230 = +[NSValue valueWithBytes:&v1611 objCType:"{CGPoint=dd}"];
  v2033[1] = v230;
  v2032[2] = &off_3F518;
  long long v1610 = xmmword_33C30;
  v231 = +[NSValue valueWithBytes:&v1610 objCType:"{CGPoint=dd}"];
  v2033[2] = v231;
  v232 = +[NSDictionary dictionaryWithObjects:v2033 forKeys:v2032 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v232, 61.0, 0.0);
  qword_4D898 = v233;
  qword_4D8A0 = v234;

  v2030[0] = &off_3F4E8;
  long long v1609 = xmmword_339E0;
  v235 = +[NSValue valueWithBytes:&v1609 objCType:"{CGPoint=dd}"];
  v2031[0] = v235;
  v2030[1] = &off_3F500;
  long long v1608 = xmmword_339F0;
  v236 = +[NSValue valueWithBytes:&v1608 objCType:"{CGPoint=dd}"];
  v2031[1] = v236;
  v2030[2] = &off_3F518;
  long long v1607 = xmmword_33C40;
  v237 = +[NSValue valueWithBytes:&v1607 objCType:"{CGPoint=dd}"];
  v2031[2] = v237;
  v238 = +[NSDictionary dictionaryWithObjects:v2031 forKeys:v2030 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v238, 62.0, 37.0);
  qword_4D8A8 = v239;
  qword_4D8B0 = v240;

  v2028[0] = &off_3F4E8;
  long long v1606 = xmmword_33A10;
  v241 = +[NSValue valueWithBytes:&v1606 objCType:"{CGPoint=dd}"];
  v2029[0] = v241;
  v2028[1] = &off_3F500;
  long long v1605 = xmmword_33A20;
  v242 = +[NSValue valueWithBytes:&v1605 objCType:"{CGPoint=dd}"];
  v2029[1] = v242;
  v2028[2] = &off_3F518;
  long long v1604 = xmmword_33C50;
  v243 = +[NSValue valueWithBytes:&v1604 objCType:"{CGPoint=dd}"];
  v2029[2] = v243;
  v244 = +[NSDictionary dictionaryWithObjects:v2029 forKeys:v2028 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v244, 44.0, 70.5);
  qword_4D8B8 = v245;
  qword_4D8C0 = v246;

  v2026[0] = &off_3F4E8;
  long long v1603 = xmmword_33A40;
  v247 = +[NSValue valueWithBytes:&v1603 objCType:"{CGPoint=dd}"];
  v2027[0] = v247;
  v2026[1] = &off_3F500;
  long long v1602 = xmmword_33A50;
  v248 = +[NSValue valueWithBytes:&v1602 objCType:"{CGPoint=dd}"];
  v2027[1] = v248;
  v2026[2] = &off_3F518;
  long long v1601 = xmmword_33C60;
  v249 = +[NSValue valueWithBytes:&v1601 objCType:"{CGPoint=dd}"];
  v2027[2] = v249;
  v250 = +[NSDictionary dictionaryWithObjects:v2027 forKeys:v2026 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v250, 1.5, 70.5);
  qword_4D8C8 = v251;
  qword_4D8D0 = v252;

  v2024[0] = &off_3F4E8;
  long long v1600 = xmmword_33A70;
  v253 = +[NSValue valueWithBytes:&v1600 objCType:"{CGPoint=dd}"];
  v2025[0] = v253;
  v2024[1] = &off_3F500;
  long long v1599 = xmmword_33A80;
  v254 = +[NSValue valueWithBytes:&v1599 objCType:"{CGPoint=dd}"];
  v2025[1] = v254;
  v2024[2] = &off_3F518;
  long long v1598 = xmmword_33C70;
  v255 = +[NSValue valueWithBytes:&v1598 objCType:"{CGPoint=dd}"];
  v2025[2] = v255;
  v256 = +[NSDictionary dictionaryWithObjects:v2025 forKeys:v2024 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v256, -42.5, 70.5);
  qword_4D8D8 = v257;
  qword_4D8E0 = v258;

  v2022[0] = &off_3F4E8;
  long long v1597 = xmmword_33AA0;
  v259 = +[NSValue valueWithBytes:&v1597 objCType:"{CGPoint=dd}"];
  v2023[0] = v259;
  v2022[1] = &off_3F500;
  long long v1596 = xmmword_33AB0;
  v260 = +[NSValue valueWithBytes:&v1596 objCType:"{CGPoint=dd}"];
  v2023[1] = v260;
  v261 = +[NSDictionary dictionaryWithObjects:v2023 forKeys:v2022 count:2];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v261, -59.0, 37.0);
  qword_4D8E8 = v262;
  qword_4D8F0 = v263;

  v2020[0] = &off_3F4E8;
  long long v1595 = xmmword_33AD0;
  v264 = +[NSValue valueWithBytes:&v1595 objCType:"{CGPoint=dd}"];
  v2021[0] = v264;
  v2020[1] = &off_3F500;
  long long v1594 = xmmword_33AE0;
  v265 = +[NSValue valueWithBytes:&v1594 objCType:"{CGPoint=dd}"];
  v2021[1] = v265;
  v2020[2] = &off_3F518;
  long long v1593 = xmmword_33C80;
  v266 = +[NSValue valueWithBytes:&v1593 objCType:"{CGPoint=dd}"];
  v2021[2] = v266;
  v267 = +[NSDictionary dictionaryWithObjects:v2021 forKeys:v2020 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v267, -59.0, 0.0);
  qword_4D8F8 = v268;
  qword_4D900 = v269;

  v2018[0] = &off_3F4E8;
  long long v1592 = xmmword_33B00;
  v270 = +[NSValue valueWithBytes:&v1592 objCType:"{CGPoint=dd}"];
  v2019[0] = v270;
  v2018[1] = &off_3F500;
  long long v1591 = xmmword_33B10;
  v271 = +[NSValue valueWithBytes:&v1591 objCType:"{CGPoint=dd}"];
  v2019[1] = v271;
  v2018[2] = &off_3F518;
  long long v1590 = xmmword_33C90;
  v272 = +[NSValue valueWithBytes:&v1590 objCType:"{CGPoint=dd}"];
  v2019[2] = v272;
  v273 = +[NSDictionary dictionaryWithObjects:v2019 forKeys:v2018 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v273, -59.0, -36.5);
  qword_4D908 = v274;
  qword_4D910 = v275;

  v2016[0] = &off_3F4E8;
  long long v1589 = xmmword_33B30;
  v276 = +[NSValue valueWithBytes:&v1589 objCType:"{CGPoint=dd}"];
  v2017[0] = v276;
  v2016[1] = &off_3F500;
  long long v1588 = xmmword_33B40;
  v277 = +[NSValue valueWithBytes:&v1588 objCType:"{CGPoint=dd}"];
  v2017[1] = v277;
  v2016[2] = &off_3F518;
  long long v1587 = xmmword_33BE0;
  v278 = +[NSValue valueWithBytes:&v1587 objCType:"{CGPoint=dd}"];
  v2017[2] = v278;
  v279 = +[NSDictionary dictionaryWithObjects:v2017 forKeys:v2016 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v279, -43.0, -74.5);
  qword_4D918 = v280;
  qword_4D920 = v281;

  v2014[0] = &off_3F4E8;
  long long v1586 = xmmword_33B60;
  v282 = +[NSValue valueWithBytes:&v1586 objCType:"{CGPoint=dd}"];
  v2015[0] = v282;
  v2014[1] = &off_3F500;
  long long v1585 = xmmword_33B70;
  v283 = +[NSValue valueWithBytes:&v1585 objCType:"{CGPoint=dd}"];
  v2015[1] = v283;
  v2014[2] = &off_3F518;
  long long v1584 = xmmword_33C10;
  v284 = +[NSValue valueWithBytes:&v1584 objCType:"{CGPoint=dd}"];
  v2015[2] = v284;
  v285 = +[NSDictionary dictionaryWithObjects:v2015 forKeys:v2014 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v285, 1.0, -74.5);
  qword_4D928 = v286;
  qword_4D930 = v287;

  v2012[0] = &off_3F4E8;
  long long v1583 = xmmword_33CA0;
  v288 = +[NSValue valueWithBytes:&v1583 objCType:"{CGPoint=dd}"];
  v2013[0] = v288;
  v2012[1] = &off_3F500;
  long long v1582 = xmmword_33CB0;
  v289 = +[NSValue valueWithBytes:&v1582 objCType:"{CGPoint=dd}"];
  v2013[1] = v289;
  v2012[2] = &off_3F518;
  long long v1581 = xmmword_33CC0;
  v290 = +[NSValue valueWithBytes:&v1581 objCType:"{CGPoint=dd}"];
  v2013[2] = v290;
  v291 = +[NSDictionary dictionaryWithObjects:v2013 forKeys:v2012 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v291, 44.5, -78.0);
  qword_4D038 = v292;
  unk_4D040 = v293;

  v2010[0] = &off_3F4E8;
  long long v1580 = xmmword_33CD0;
  v294 = +[NSValue valueWithBytes:&v1580 objCType:"{CGPoint=dd}"];
  v2011[0] = v294;
  v2010[1] = &off_3F500;
  long long v1579 = xmmword_33CE0;
  v295 = +[NSValue valueWithBytes:&v1579 objCType:"{CGPoint=dd}"];
  v2011[1] = v295;
  v2010[2] = &off_3F518;
  long long v1578 = xmmword_33CF0;
  v296 = +[NSValue valueWithBytes:&v1578 objCType:"{CGPoint=dd}"];
  v2011[2] = v296;
  v297 = +[NSDictionary dictionaryWithObjects:v2011 forKeys:v2010 count:3];
  [v1 scaledPoint:v297 withOverrides:62.0];
  qword_4D048 = v298;
  unk_4D050 = v299;

  v2008[0] = &off_3F4E8;
  long long v1577 = xmmword_33D00;
  v300 = +[NSValue valueWithBytes:&v1577 objCType:"{CGPoint=dd}"];
  v2009[0] = v300;
  v2008[1] = &off_3F500;
  long long v1576 = xmmword_33D10;
  v301 = +[NSValue valueWithBytes:&v1576 objCType:"{CGPoint=dd}"];
  v2009[1] = v301;
  v2008[2] = &off_3F518;
  long long v1575 = xmmword_33D20;
  v302 = +[NSValue valueWithBytes:&v1575 objCType:"{CGPoint=dd}"];
  v2009[2] = v302;
  v303 = +[NSDictionary dictionaryWithObjects:v2009 forKeys:v2008 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v303, 62.0, 0.0);
  qword_4D058 = v304;
  unk_4D060 = v305;

  v2006[0] = &off_3F4E8;
  long long v1574 = xmmword_33D30;
  v306 = +[NSValue valueWithBytes:&v1574 objCType:"{CGPoint=dd}"];
  v2007[0] = v306;
  v2006[1] = &off_3F500;
  long long v1573 = xmmword_33D40;
  v307 = +[NSValue valueWithBytes:&v1573 objCType:"{CGPoint=dd}"];
  v2007[1] = v307;
  v2006[2] = &off_3F518;
  long long v1572 = xmmword_33D50;
  v308 = +[NSValue valueWithBytes:&v1572 objCType:"{CGPoint=dd}"];
  v2007[2] = v308;
  v309 = +[NSDictionary dictionaryWithObjects:v2007 forKeys:v2006 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v309, 61.0, 36.0);
  qword_4D068 = v310;
  unk_4D070 = v311;

  v2004[0] = &off_3F4E8;
  long long v1571 = xmmword_33D60;
  v312 = +[NSValue valueWithBytes:&v1571 objCType:"{CGPoint=dd}"];
  v2005[0] = v312;
  v2004[1] = &off_3F500;
  long long v1570 = xmmword_33D70;
  v313 = +[NSValue valueWithBytes:&v1570 objCType:"{CGPoint=dd}"];
  v2005[1] = v313;
  v2004[2] = &off_3F518;
  long long v1569 = xmmword_33D80;
  v314 = +[NSValue valueWithBytes:&v1569 objCType:"{CGPoint=dd}"];
  v2005[2] = v314;
  v315 = +[NSDictionary dictionaryWithObjects:v2005 forKeys:v2004 count:3];
  [v1 scaledPoint:v315 withOverrides:45.0];
  qword_4D078 = v316;
  unk_4D080 = v317;

  v2002[0] = &off_3F4E8;
  long long v1568 = xmmword_33D90;
  v318 = +[NSValue valueWithBytes:&v1568 objCType:"{CGPoint=dd}"];
  v2003[0] = v318;
  v2002[1] = &off_3F500;
  long long v1567 = xmmword_33DA0;
  v319 = +[NSValue valueWithBytes:&v1567 objCType:"{CGPoint=dd}"];
  v2003[1] = v319;
  v2002[2] = &off_3F518;
  long long v1566 = xmmword_33DB0;
  v320 = +[NSValue valueWithBytes:&v1566 objCType:"{CGPoint=dd}"];
  v2003[2] = v320;
  v321 = +[NSDictionary dictionaryWithObjects:v2003 forKeys:v2002 count:3];
  [v1 scaledPoint:v321 withOverrides:1.0];
  qword_4D088 = v322;
  unk_4D090 = v323;

  v2000[0] = &off_3F4E8;
  long long v1565 = xmmword_33DC0;
  v324 = +[NSValue valueWithBytes:&v1565 objCType:"{CGPoint=dd}"];
  v2001[0] = v324;
  v2000[1] = &off_3F500;
  long long v1564 = xmmword_33DD0;
  v325 = +[NSValue valueWithBytes:&v1564 objCType:"{CGPoint=dd}"];
  v2001[1] = v325;
  v2000[2] = &off_3F518;
  long long v1563 = xmmword_33DE0;
  v326 = +[NSValue valueWithBytes:&v1563 objCType:"{CGPoint=dd}"];
  v2001[2] = v326;
  v327 = +[NSDictionary dictionaryWithObjects:v2001 forKeys:v2000 count:3];
  [v1 scaledPoint:v327 withOverrides:-42.5];
  qword_4D098 = v328;
  unk_4D0A0 = v329;

  v1998[0] = &off_3F4E8;
  long long v1562 = xmmword_33DF0;
  v330 = +[NSValue valueWithBytes:&v1562 objCType:"{CGPoint=dd}"];
  v1999[0] = v330;
  v1998[1] = &off_3F500;
  long long v1561 = xmmword_33E00;
  v331 = +[NSValue valueWithBytes:&v1561 objCType:"{CGPoint=dd}"];
  v1999[1] = v331;
  v1998[2] = &off_3F518;
  long long v1560 = xmmword_33E10;
  v332 = +[NSValue valueWithBytes:&v1560 objCType:"{CGPoint=dd}"];
  v1999[2] = v332;
  v333 = +[NSDictionary dictionaryWithObjects:v1999 forKeys:v1998 count:3];
  [v1 scaledPoint:v333 withOverrides:-59.0];
  qword_4D0A8 = v334;
  unk_4D0B0 = v335;

  v1996[0] = &off_3F4E8;
  long long v1559 = xmmword_33AD0;
  v336 = +[NSValue valueWithBytes:&v1559 objCType:"{CGPoint=dd}"];
  v1997[0] = v336;
  v1996[1] = &off_3F500;
  long long v1558 = xmmword_33AE0;
  v337 = +[NSValue valueWithBytes:&v1558 objCType:"{CGPoint=dd}"];
  v1997[1] = v337;
  v1996[2] = &off_3F518;
  long long v1557 = xmmword_33E20;
  v338 = +[NSValue valueWithBytes:&v1557 objCType:"{CGPoint=dd}"];
  v1997[2] = v338;
  v339 = +[NSDictionary dictionaryWithObjects:v1997 forKeys:v1996 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v339, -59.0, 0.0);
  qword_4D0B8 = v340;
  unk_4D0C0 = v341;

  v1994[0] = &off_3F4E8;
  long long v1556 = xmmword_33E30;
  v342 = +[NSValue valueWithBytes:&v1556 objCType:"{CGPoint=dd}"];
  v1995[0] = v342;
  v1994[1] = &off_3F500;
  long long v1555 = xmmword_33E40;
  v343 = +[NSValue valueWithBytes:&v1555 objCType:"{CGPoint=dd}"];
  v1995[1] = v343;
  v1994[2] = &off_3F518;
  long long v1554 = xmmword_33E50;
  v344 = +[NSValue valueWithBytes:&v1554 objCType:"{CGPoint=dd}"];
  v1995[2] = v344;
  v345 = +[NSDictionary dictionaryWithObjects:v1995 forKeys:v1994 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v345, -59.0, -36.0);
  qword_4D0C8 = v346;
  unk_4D0D0 = v347;

  v1992[0] = &off_3F4E8;
  long long v1553 = xmmword_33E60;
  v348 = +[NSValue valueWithBytes:&v1553 objCType:"{CGPoint=dd}"];
  v1993[0] = v348;
  v1992[1] = &off_3F500;
  long long v1552 = xmmword_33E70;
  v349 = +[NSValue valueWithBytes:&v1552 objCType:"{CGPoint=dd}"];
  v1993[1] = v349;
  v1992[2] = &off_3F518;
  long long v1551 = xmmword_33E80;
  v350 = +[NSValue valueWithBytes:&v1551 objCType:"{CGPoint=dd}"];
  v1993[2] = v350;
  v351 = +[NSDictionary dictionaryWithObjects:v1993 forKeys:v1992 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v351, -42.5, -78.0);
  qword_4D0D8 = v352;
  unk_4D0E0 = v353;

  v1990[0] = &off_3F4E8;
  long long v1550 = xmmword_33E90;
  v354 = +[NSValue valueWithBytes:&v1550 objCType:"{CGPoint=dd}"];
  v1991[0] = v354;
  v1990[1] = &off_3F500;
  long long v1549 = xmmword_33EA0;
  v355 = +[NSValue valueWithBytes:&v1549 objCType:"{CGPoint=dd}"];
  v1991[1] = v355;
  v1990[2] = &off_3F518;
  long long v1548 = xmmword_33EB0;
  v356 = +[NSValue valueWithBytes:&v1548 objCType:"{CGPoint=dd}"];
  v1991[2] = v356;
  v357 = +[NSDictionary dictionaryWithObjects:v1991 forKeys:v1990 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v357, 0.5, -79.0);
  qword_4D0E8 = v358;
  unk_4D0F0 = v359;

  v1988[0] = &off_3F4E8;
  long long v1547 = xmmword_33EC0;
  v360 = +[NSValue valueWithBytes:&v1547 objCType:"{CGPoint=dd}"];
  v1989[0] = v360;
  v1988[1] = &off_3F500;
  long long v1546 = xmmword_33ED0;
  v361 = +[NSValue valueWithBytes:&v1546 objCType:"{CGPoint=dd}"];
  v1989[1] = v361;
  v1988[2] = &off_3F518;
  long long v1545 = xmmword_33EE0;
  v362 = +[NSValue valueWithBytes:&v1545 objCType:"{CGPoint=dd}"];
  v1989[2] = v362;
  v363 = +[NSDictionary dictionaryWithObjects:v1989 forKeys:v1988 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v363, 44.5, -74.5);
  qword_4D338 = v364;
  qword_4D340 = v365;

  v1986[0] = &off_3F4E8;
  long long v1544 = xmmword_33CD0;
  v366 = +[NSValue valueWithBytes:&v1544 objCType:"{CGPoint=dd}"];
  v1987[0] = v366;
  v1986[1] = &off_3F500;
  long long v1543 = xmmword_33CE0;
  v367 = +[NSValue valueWithBytes:&v1543 objCType:"{CGPoint=dd}"];
  v1987[1] = v367;
  v1986[2] = &off_3F518;
  long long v1542 = xmmword_33CF0;
  v368 = +[NSValue valueWithBytes:&v1542 objCType:"{CGPoint=dd}"];
  v1987[2] = v368;
  v369 = +[NSDictionary dictionaryWithObjects:v1987 forKeys:v1986 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v369, 62.0, -35.5);
  qword_4D348 = v370;
  qword_4D350 = v371;

  v1984[0] = &off_3F4E8;
  long long v1541 = xmmword_33D00;
  v372 = +[NSValue valueWithBytes:&v1541 objCType:"{CGPoint=dd}"];
  v1985[0] = v372;
  v1984[1] = &off_3F500;
  long long v1540 = xmmword_33D10;
  v373 = +[NSValue valueWithBytes:&v1540 objCType:"{CGPoint=dd}"];
  v1985[1] = v373;
  v1984[2] = &off_3F518;
  long long v1539 = xmmword_33D20;
  v374 = +[NSValue valueWithBytes:&v1539 objCType:"{CGPoint=dd}"];
  v1985[2] = v374;
  v375 = +[NSDictionary dictionaryWithObjects:v1985 forKeys:v1984 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v375, 62.0, 0.0);
  qword_4D358 = v376;
  qword_4D360 = v377;

  v1982[0] = &off_3F4E8;
  long long v1538 = xmmword_33D30;
  v378 = +[NSValue valueWithBytes:&v1538 objCType:"{CGPoint=dd}"];
  v1983[0] = v378;
  v1982[1] = &off_3F500;
  long long v1537 = xmmword_33D40;
  v379 = +[NSValue valueWithBytes:&v1537 objCType:"{CGPoint=dd}"];
  v1983[1] = v379;
  v1982[2] = &off_3F518;
  long long v1536 = xmmword_33D50;
  v380 = +[NSValue valueWithBytes:&v1536 objCType:"{CGPoint=dd}"];
  v1983[2] = v380;
  v381 = +[NSDictionary dictionaryWithObjects:v1983 forKeys:v1982 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v381, 61.0, 36.0);
  qword_4D368 = v382;
  qword_4D370 = v383;

  v1980[0] = &off_3F4E8;
  long long v1535 = xmmword_33D60;
  v384 = +[NSValue valueWithBytes:&v1535 objCType:"{CGPoint=dd}"];
  v1981[0] = v384;
  v1980[1] = &off_3F500;
  long long v1534 = xmmword_33D70;
  v385 = +[NSValue valueWithBytes:&v1534 objCType:"{CGPoint=dd}"];
  v1981[1] = v385;
  v1980[2] = &off_3F518;
  long long v1533 = xmmword_33D80;
  v386 = +[NSValue valueWithBytes:&v1533 objCType:"{CGPoint=dd}"];
  v1981[2] = v386;
  v387 = +[NSDictionary dictionaryWithObjects:v1981 forKeys:v1980 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v387, 45.0, 75.0);
  qword_4D378 = v388;
  qword_4D380 = v389;

  v1978[0] = &off_3F4E8;
  long long v1532 = xmmword_33D90;
  v390 = +[NSValue valueWithBytes:&v1532 objCType:"{CGPoint=dd}"];
  v1979[0] = v390;
  v1978[1] = &off_3F500;
  long long v1531 = xmmword_33DA0;
  v391 = +[NSValue valueWithBytes:&v1531 objCType:"{CGPoint=dd}"];
  v1979[1] = v391;
  v1978[2] = &off_3F518;
  long long v1530 = xmmword_33DB0;
  v392 = +[NSValue valueWithBytes:&v1530 objCType:"{CGPoint=dd}"];
  v1979[2] = v392;
  v393 = +[NSDictionary dictionaryWithObjects:v1979 forKeys:v1978 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v393, 1.0, 74.5);
  qword_4D388 = v394;
  qword_4D390 = v395;

  v1976[0] = &off_3F4E8;
  long long v1529 = xmmword_33DC0;
  v396 = +[NSValue valueWithBytes:&v1529 objCType:"{CGPoint=dd}"];
  v1977[0] = v396;
  v1976[1] = &off_3F500;
  long long v1528 = xmmword_33DD0;
  v397 = +[NSValue valueWithBytes:&v1528 objCType:"{CGPoint=dd}"];
  v1977[1] = v397;
  v1976[2] = &off_3F518;
  long long v1527 = xmmword_33DE0;
  v398 = +[NSValue valueWithBytes:&v1527 objCType:"{CGPoint=dd}"];
  v1977[2] = v398;
  v399 = +[NSDictionary dictionaryWithObjects:v1977 forKeys:v1976 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v399, -42.5, 76.5);
  qword_4D398 = v400;
  qword_4D3A0 = v401;

  v1974[0] = &off_3F4E8;
  long long v1526 = xmmword_33DF0;
  v402 = +[NSValue valueWithBytes:&v1526 objCType:"{CGPoint=dd}"];
  v1975[0] = v402;
  v1974[1] = &off_3F500;
  long long v1525 = xmmword_33E00;
  v403 = +[NSValue valueWithBytes:&v1525 objCType:"{CGPoint=dd}"];
  v1975[1] = v403;
  v1974[2] = &off_3F518;
  long long v1524 = xmmword_33E10;
  v404 = +[NSValue valueWithBytes:&v1524 objCType:"{CGPoint=dd}"];
  v1975[2] = v404;
  v405 = +[NSDictionary dictionaryWithObjects:v1975 forKeys:v1974 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v405, -59.0, 36.5);
  qword_4D3A8 = v406;
  qword_4D3B0 = v407;

  v1972[0] = &off_3F4E8;
  long long v1523 = xmmword_33AD0;
  v408 = +[NSValue valueWithBytes:&v1523 objCType:"{CGPoint=dd}"];
  v1973[0] = v408;
  v1972[1] = &off_3F500;
  long long v1522 = xmmword_33AE0;
  v409 = +[NSValue valueWithBytes:&v1522 objCType:"{CGPoint=dd}"];
  v1973[1] = v409;
  v1972[2] = &off_3F518;
  long long v1521 = xmmword_33E20;
  v410 = +[NSValue valueWithBytes:&v1521 objCType:"{CGPoint=dd}"];
  v1973[2] = v410;
  v411 = +[NSDictionary dictionaryWithObjects:v1973 forKeys:v1972 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v411, -59.0, 0.0);
  qword_4D3B8 = v412;
  qword_4D3C0 = v413;

  v1970[0] = &off_3F4E8;
  long long v1520 = xmmword_33E30;
  v414 = +[NSValue valueWithBytes:&v1520 objCType:"{CGPoint=dd}"];
  v1971[0] = v414;
  v1970[1] = &off_3F500;
  long long v1519 = xmmword_33E40;
  v415 = +[NSValue valueWithBytes:&v1519 objCType:"{CGPoint=dd}"];
  v1971[1] = v415;
  v1970[2] = &off_3F518;
  long long v1518 = xmmword_33E50;
  v416 = +[NSValue valueWithBytes:&v1518 objCType:"{CGPoint=dd}"];
  v1971[2] = v416;
  v417 = +[NSDictionary dictionaryWithObjects:v1971 forKeys:v1970 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v417, -59.0, -36.0);
  qword_4D3C8 = v418;
  qword_4D3D0 = v419;

  v1968[0] = &off_3F4E8;
  long long v1517 = xmmword_33EF0;
  v420 = +[NSValue valueWithBytes:&v1517 objCType:"{CGPoint=dd}"];
  v1969[0] = v420;
  v1968[1] = &off_3F500;
  long long v1516 = xmmword_33F00;
  v421 = +[NSValue valueWithBytes:&v1516 objCType:"{CGPoint=dd}"];
  v1969[1] = v421;
  v1968[2] = &off_3F518;
  long long v1515 = xmmword_33F10;
  v422 = +[NSValue valueWithBytes:&v1515 objCType:"{CGPoint=dd}"];
  v1969[2] = v422;
  v423 = +[NSDictionary dictionaryWithObjects:v1969 forKeys:v1968 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v423, -42.5, -74.5);
  qword_4D3D8 = v424;
  qword_4D3E0 = v425;

  v1966[0] = &off_3F4E8;
  long long v1514 = xmmword_33F20;
  v426 = +[NSValue valueWithBytes:&v1514 objCType:"{CGPoint=dd}"];
  v1967[0] = v426;
  v1966[1] = &off_3F500;
  long long v1513 = xmmword_33F30;
  v427 = +[NSValue valueWithBytes:&v1513 objCType:"{CGPoint=dd}"];
  v1967[1] = v427;
  v1966[2] = &off_3F518;
  long long v1512 = xmmword_33F40;
  v428 = +[NSValue valueWithBytes:&v1512 objCType:"{CGPoint=dd}"];
  v1967[2] = v428;
  v429 = +[NSDictionary dictionaryWithObjects:v1967 forKeys:v1966 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v429, 0.5, -75.0);
  qword_4D3E8 = v430;
  qword_4D3F0 = v431;

  v1964[0] = &off_3F4E8;
  long long v1511 = xmmword_33F50;
  v432 = +[NSValue valueWithBytes:&v1511 objCType:"{CGPoint=dd}"];
  v1965[0] = v432;
  v1964[1] = &off_3F500;
  long long v1510 = xmmword_33960;
  v433 = +[NSValue valueWithBytes:&v1510 objCType:"{CGPoint=dd}"];
  v1965[1] = v433;
  v1964[2] = &off_3F518;
  long long v1509 = xmmword_33BB0;
  v434 = +[NSValue valueWithBytes:&v1509 objCType:"{CGPoint=dd}"];
  v1965[2] = v434;
  v435 = +[NSDictionary dictionaryWithObjects:v1965 forKeys:v1964 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v435, 44.5, -75.0);
  qword_4D638 = v436;
  qword_4D640 = v437;

  v1962[0] = &off_3F4E8;
  long long v1508 = xmmword_33F60;
  v438 = +[NSValue valueWithBytes:&v1508 objCType:"{CGPoint=dd}"];
  v1963[0] = v438;
  v1962[1] = &off_3F500;
  long long v1507 = xmmword_33990;
  v439 = +[NSValue valueWithBytes:&v1507 objCType:"{CGPoint=dd}"];
  v1963[1] = v439;
  v1962[2] = &off_3F518;
  long long v1506 = xmmword_33C20;
  v440 = +[NSValue valueWithBytes:&v1506 objCType:"{CGPoint=dd}"];
  v1963[2] = v440;
  v441 = +[NSDictionary dictionaryWithObjects:v1963 forKeys:v1962 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v441, 61.0, -36.5);
  qword_4D648 = v442;
  qword_4D650 = v443;

  v1960[0] = &off_3F4E8;
  long long v1505 = xmmword_33F70;
  v444 = +[NSValue valueWithBytes:&v1505 objCType:"{CGPoint=dd}"];
  v1961[0] = v444;
  v1960[1] = &off_3F500;
  long long v1504 = xmmword_33F80;
  v445 = +[NSValue valueWithBytes:&v1504 objCType:"{CGPoint=dd}"];
  v1961[1] = v445;
  v1960[2] = &off_3F518;
  long long v1503 = xmmword_33F90;
  v446 = +[NSValue valueWithBytes:&v1503 objCType:"{CGPoint=dd}"];
  v1961[2] = v446;
  v447 = +[NSDictionary dictionaryWithObjects:v1961 forKeys:v1960 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v447, 61.0, -1.0);
  qword_4D658 = v448;
  qword_4D660 = v449;

  v1958[0] = &off_3F4E8;
  long long v1502 = xmmword_33FA0;
  v450 = +[NSValue valueWithBytes:&v1502 objCType:"{CGPoint=dd}"];
  v1959[0] = v450;
  v1958[1] = &off_3F500;
  long long v1501 = xmmword_33FB0;
  v451 = +[NSValue valueWithBytes:&v1501 objCType:"{CGPoint=dd}"];
  v1959[1] = v451;
  v1958[2] = &off_3F518;
  long long v1500 = xmmword_33FC0;
  v452 = +[NSValue valueWithBytes:&v1500 objCType:"{CGPoint=dd}"];
  v1959[2] = v452;
  v453 = +[NSDictionary dictionaryWithObjects:v1959 forKeys:v1958 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v453);
  qword_4D668 = v454;
  qword_4D670 = v455;

  v1956[0] = &off_3F4E8;
  long long v1499 = xmmword_33FD0;
  v456 = +[NSValue valueWithBytes:&v1499 objCType:"{CGPoint=dd}"];
  v1957[0] = v456;
  v1956[1] = &off_3F500;
  long long v1498 = xmmword_33FE0;
  v457 = +[NSValue valueWithBytes:&v1498 objCType:"{CGPoint=dd}"];
  v1957[1] = v457;
  v1956[2] = &off_3F518;
  long long v1497 = xmmword_33FF0;
  v458 = +[NSValue valueWithBytes:&v1497 objCType:"{CGPoint=dd}"];
  v1957[2] = v458;
  v459 = +[NSDictionary dictionaryWithObjects:v1957 forKeys:v1956 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v459, 45.0, 75.0);
  qword_4D678 = v460;
  qword_4D680 = v461;

  v1954[0] = &off_3F4E8;
  long long v1496 = xmmword_34000;
  v462 = +[NSValue valueWithBytes:&v1496 objCType:"{CGPoint=dd}"];
  v1955[0] = v462;
  v1954[1] = &off_3F500;
  long long v1495 = xmmword_34010;
  v463 = +[NSValue valueWithBytes:&v1495 objCType:"{CGPoint=dd}"];
  v1955[1] = v463;
  v1954[2] = &off_3F518;
  long long v1494 = xmmword_34020;
  v464 = +[NSValue valueWithBytes:&v1494 objCType:"{CGPoint=dd}"];
  v1955[2] = v464;
  v465 = +[NSDictionary dictionaryWithObjects:v1955 forKeys:v1954 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v465, 1.5, 74.5);
  qword_4D688 = v466;
  qword_4D690 = v467;

  v1952[0] = &off_3F4E8;
  long long v1493 = xmmword_34030;
  v468 = +[NSValue valueWithBytes:&v1493 objCType:"{CGPoint=dd}"];
  v1953[0] = v468;
  v1952[1] = &off_3F500;
  long long v1492 = xmmword_34040;
  v469 = +[NSValue valueWithBytes:&v1492 objCType:"{CGPoint=dd}"];
  v1953[1] = v469;
  v1952[2] = &off_3F518;
  long long v1491 = xmmword_34050;
  v470 = +[NSValue valueWithBytes:&v1491 objCType:"{CGPoint=dd}"];
  v1953[2] = v470;
  v471 = +[NSDictionary dictionaryWithObjects:v1953 forKeys:v1952 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v471);
  qword_4D698 = v472;
  qword_4D6A0 = v473;

  v1950[0] = &off_3F4E8;
  long long v1490 = xmmword_34060;
  v474 = +[NSValue valueWithBytes:&v1490 objCType:"{CGPoint=dd}"];
  v1951[0] = v474;
  v1950[1] = &off_3F500;
  long long v1489 = xmmword_34070;
  v475 = +[NSValue valueWithBytes:&v1489 objCType:"{CGPoint=dd}"];
  v1951[1] = v475;
  v1950[2] = &off_3F518;
  long long v1488 = xmmword_34080;
  v476 = +[NSValue valueWithBytes:&v1488 objCType:"{CGPoint=dd}"];
  v1951[2] = v476;
  v477 = +[NSDictionary dictionaryWithObjects:v1951 forKeys:v1950 count:3];
  [v1 scaledPoint:v477 withOverrides:-59.0];
  qword_4D6A8 = v478;
  qword_4D6B0 = v479;

  v1948[0] = &off_3F4E8;
  long long v1487 = xmmword_34090;
  v480 = +[NSValue valueWithBytes:&v1487 objCType:"{CGPoint=dd}"];
  v1949[0] = v480;
  v1948[1] = &off_3F500;
  long long v1486 = xmmword_340A0;
  v481 = +[NSValue valueWithBytes:&v1486 objCType:"{CGPoint=dd}"];
  v1949[1] = v481;
  v1948[2] = &off_3F518;
  long long v1485 = xmmword_340B0;
  v482 = +[NSValue valueWithBytes:&v1485 objCType:"{CGPoint=dd}"];
  v1949[2] = v482;
  v483 = +[NSDictionary dictionaryWithObjects:v1949 forKeys:v1948 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v483, -58.0, -1.0);
  qword_4D6B8 = v484;
  qword_4D6C0 = v485;

  v1946[0] = &off_3F4E8;
  long long v1484 = xmmword_340C0;
  v486 = +[NSValue valueWithBytes:&v1484 objCType:"{CGPoint=dd}"];
  v1947[0] = v486;
  v1946[1] = &off_3F500;
  long long v1483 = xmmword_340D0;
  v487 = +[NSValue valueWithBytes:&v1483 objCType:"{CGPoint=dd}"];
  v1947[1] = v487;
  v1946[2] = &off_3F518;
  long long v1482 = xmmword_340E0;
  v488 = +[NSValue valueWithBytes:&v1482 objCType:"{CGPoint=dd}"];
  v1947[2] = v488;
  v489 = +[NSDictionary dictionaryWithObjects:v1947 forKeys:v1946 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v489, -59.0, -37.0);
  qword_4D6C8 = v490;
  qword_4D6D0 = v491;

  v1944[0] = &off_3F4E8;
  long long v1481 = xmmword_340F0;
  v492 = +[NSValue valueWithBytes:&v1481 objCType:"{CGPoint=dd}"];
  v1945[0] = v492;
  v1944[1] = &off_3F500;
  long long v1480 = xmmword_34100;
  v493 = +[NSValue valueWithBytes:&v1480 objCType:"{CGPoint=dd}"];
  v1945[1] = v493;
  v1944[2] = &off_3F518;
  long long v1479 = xmmword_34110;
  v494 = +[NSValue valueWithBytes:&v1479 objCType:"{CGPoint=dd}"];
  v1945[2] = v494;
  v495 = +[NSDictionary dictionaryWithObjects:v1945 forKeys:v1944 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v495, -42.5, -75.0);
  qword_4D6D8 = v496;
  qword_4D6E0 = v497;

  v1942[0] = &off_3F4E8;
  long long v1478 = xmmword_33B60;
  v498 = +[NSValue valueWithBytes:&v1478 objCType:"{CGPoint=dd}"];
  v1943[0] = v498;
  v1942[1] = &off_3F500;
  long long v1477 = xmmword_33B70;
  v499 = +[NSValue valueWithBytes:&v1477 objCType:"{CGPoint=dd}"];
  v1943[1] = v499;
  v1942[2] = &off_3F518;
  long long v1476 = xmmword_34120;
  v500 = +[NSValue valueWithBytes:&v1476 objCType:"{CGPoint=dd}"];
  v1943[2] = v500;
  v501 = +[NSDictionary dictionaryWithObjects:v1943 forKeys:v1942 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v501, 1.0, -74.5);
  qword_4D6E8 = v502;
  qword_4D6F0 = v503;

  v1940[0] = &off_3F4E8;
  long long v1475 = xmmword_33F50;
  v504 = +[NSValue valueWithBytes:&v1475 objCType:"{CGPoint=dd}"];
  v1941[0] = v504;
  v1940[1] = &off_3F500;
  long long v1474 = xmmword_33960;
  v505 = +[NSValue valueWithBytes:&v1474 objCType:"{CGPoint=dd}"];
  v1941[1] = v505;
  v1940[2] = &off_3F518;
  long long v1473 = xmmword_33BB0;
  v506 = +[NSValue valueWithBytes:&v1473 objCType:"{CGPoint=dd}"];
  v1941[2] = v506;
  v507 = +[NSDictionary dictionaryWithObjects:v1941 forKeys:v1940 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v507, 44.5, -75.0);
  qword_4D938 = v508;
  qword_4D940 = v509;

  v1938[0] = &off_3F4E8;
  long long v1472 = xmmword_33F60;
  v510 = +[NSValue valueWithBytes:&v1472 objCType:"{CGPoint=dd}"];
  v1939[0] = v510;
  v1938[1] = &off_3F500;
  long long v1471 = xmmword_33990;
  v511 = +[NSValue valueWithBytes:&v1471 objCType:"{CGPoint=dd}"];
  v1939[1] = v511;
  v1938[2] = &off_3F518;
  long long v1470 = xmmword_33C20;
  v512 = +[NSValue valueWithBytes:&v1470 objCType:"{CGPoint=dd}"];
  v1939[2] = v512;
  v513 = +[NSDictionary dictionaryWithObjects:v1939 forKeys:v1938 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v513, 61.0, -36.5);
  qword_4D948 = v514;
  qword_4D950 = v515;

  v1936[0] = &off_3F4E8;
  long long v1469 = xmmword_33F70;
  v516 = +[NSValue valueWithBytes:&v1469 objCType:"{CGPoint=dd}"];
  v1937[0] = v516;
  v1936[1] = &off_3F500;
  long long v1468 = xmmword_33F80;
  v517 = +[NSValue valueWithBytes:&v1468 objCType:"{CGPoint=dd}"];
  v1937[1] = v517;
  v1936[2] = &off_3F518;
  long long v1467 = xmmword_33F90;
  v518 = +[NSValue valueWithBytes:&v1467 objCType:"{CGPoint=dd}"];
  v1937[2] = v518;
  v519 = +[NSDictionary dictionaryWithObjects:v1937 forKeys:v1936 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v519, 61.0, -1.0);
  qword_4D958 = v520;
  qword_4D960 = v521;

  v1934[0] = &off_3F4E8;
  long long v1466 = xmmword_33FA0;
  v522 = +[NSValue valueWithBytes:&v1466 objCType:"{CGPoint=dd}"];
  v1935[0] = v522;
  v1934[1] = &off_3F500;
  long long v1465 = xmmword_33FB0;
  v523 = +[NSValue valueWithBytes:&v1465 objCType:"{CGPoint=dd}"];
  v1935[1] = v523;
  v1934[2] = &off_3F518;
  long long v1464 = xmmword_33FC0;
  v524 = +[NSValue valueWithBytes:&v1464 objCType:"{CGPoint=dd}"];
  v1935[2] = v524;
  v525 = +[NSDictionary dictionaryWithObjects:v1935 forKeys:v1934 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v525, 60.0, 37.0);
  qword_4D968 = v526;
  qword_4D970 = v527;

  v1932[0] = &off_3F4E8;
  long long v1463 = xmmword_33FD0;
  v528 = +[NSValue valueWithBytes:&v1463 objCType:"{CGPoint=dd}"];
  v1933[0] = v528;
  v1932[1] = &off_3F500;
  long long v1462 = xmmword_33FE0;
  v529 = +[NSValue valueWithBytes:&v1462 objCType:"{CGPoint=dd}"];
  v1933[1] = v529;
  v1932[2] = &off_3F518;
  long long v1461 = xmmword_33FF0;
  v530 = +[NSValue valueWithBytes:&v1461 objCType:"{CGPoint=dd}"];
  v1933[2] = v530;
  v531 = +[NSDictionary dictionaryWithObjects:v1933 forKeys:v1932 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v531, 45.0, 75.0);
  qword_4D978 = v532;
  qword_4D980 = v533;

  v1930[0] = &off_3F4E8;
  long long v1460 = xmmword_34000;
  v534 = +[NSValue valueWithBytes:&v1460 objCType:"{CGPoint=dd}"];
  v1931[0] = v534;
  v1930[1] = &off_3F500;
  long long v1459 = xmmword_34010;
  v535 = +[NSValue valueWithBytes:&v1459 objCType:"{CGPoint=dd}"];
  v1931[1] = v535;
  v1930[2] = &off_3F518;
  long long v1458 = xmmword_34020;
  v536 = +[NSValue valueWithBytes:&v1458 objCType:"{CGPoint=dd}"];
  v1931[2] = v536;
  v537 = +[NSDictionary dictionaryWithObjects:v1931 forKeys:v1930 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v537, 1.5, 74.5);
  qword_4D988 = v538;
  qword_4D990 = v539;

  v1928[0] = &off_3F4E8;
  long long v1457 = xmmword_34030;
  v540 = +[NSValue valueWithBytes:&v1457 objCType:"{CGPoint=dd}"];
  v1929[0] = v540;
  v1928[1] = &off_3F500;
  long long v1456 = xmmword_34040;
  v541 = +[NSValue valueWithBytes:&v1456 objCType:"{CGPoint=dd}"];
  v1929[1] = v541;
  v1928[2] = &off_3F518;
  long long v1455 = xmmword_34050;
  v542 = +[NSValue valueWithBytes:&v1455 objCType:"{CGPoint=dd}"];
  v1929[2] = v542;
  v543 = +[NSDictionary dictionaryWithObjects:v1929 forKeys:v1928 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v543, -41.5, 75.5);
  qword_4D998 = v544;
  qword_4D9A0 = v545;

  v1926[0] = &off_3F4E8;
  long long v1454 = xmmword_34060;
  v546 = +[NSValue valueWithBytes:&v1454 objCType:"{CGPoint=dd}"];
  v1927[0] = v546;
  v1926[1] = &off_3F500;
  long long v1453 = xmmword_34070;
  v547 = +[NSValue valueWithBytes:&v1453 objCType:"{CGPoint=dd}"];
  v1927[1] = v547;
  v1926[2] = &off_3F518;
  long long v1452 = xmmword_34080;
  v548 = +[NSValue valueWithBytes:&v1452 objCType:"{CGPoint=dd}"];
  v1927[2] = v548;
  v549 = +[NSDictionary dictionaryWithObjects:v1927 forKeys:v1926 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v549, -59.0, 34.5);
  qword_4D9A8 = v550;
  qword_4D9B0 = v551;

  v1924[0] = &off_3F4E8;
  long long v1451 = xmmword_34090;
  v552 = +[NSValue valueWithBytes:&v1451 objCType:"{CGPoint=dd}"];
  v1925[0] = v552;
  v1924[1] = &off_3F500;
  long long v1450 = xmmword_340A0;
  v553 = +[NSValue valueWithBytes:&v1450 objCType:"{CGPoint=dd}"];
  v1925[1] = v553;
  v1924[2] = &off_3F518;
  long long v1449 = xmmword_340B0;
  v554 = +[NSValue valueWithBytes:&v1449 objCType:"{CGPoint=dd}"];
  v1925[2] = v554;
  v555 = +[NSDictionary dictionaryWithObjects:v1925 forKeys:v1924 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v555, -58.0, -1.0);
  qword_4D9B8 = v556;
  qword_4D9C0 = v557;

  v1922[0] = &off_3F4E8;
  long long v1448 = xmmword_340C0;
  v558 = +[NSValue valueWithBytes:&v1448 objCType:"{CGPoint=dd}"];
  v1923[0] = v558;
  v1922[1] = &off_3F500;
  long long v1447 = xmmword_340D0;
  v559 = +[NSValue valueWithBytes:&v1447 objCType:"{CGPoint=dd}"];
  v1923[1] = v559;
  v1922[2] = &off_3F518;
  long long v1446 = xmmword_340E0;
  v560 = +[NSValue valueWithBytes:&v1446 objCType:"{CGPoint=dd}"];
  v1923[2] = v560;
  v561 = +[NSDictionary dictionaryWithObjects:v1923 forKeys:v1922 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v561, -59.0, -37.0);
  qword_4D9C8 = v562;
  qword_4D9D0 = v563;

  v1920[0] = &off_3F4E8;
  long long v1445 = xmmword_340F0;
  v564 = +[NSValue valueWithBytes:&v1445 objCType:"{CGPoint=dd}"];
  v1921[0] = v564;
  v1920[1] = &off_3F500;
  long long v1444 = xmmword_34100;
  v565 = +[NSValue valueWithBytes:&v1444 objCType:"{CGPoint=dd}"];
  v1921[1] = v565;
  v1920[2] = &off_3F518;
  long long v1443 = xmmword_34110;
  v566 = +[NSValue valueWithBytes:&v1443 objCType:"{CGPoint=dd}"];
  v1921[2] = v566;
  v567 = +[NSDictionary dictionaryWithObjects:v1921 forKeys:v1920 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v567, -42.5, -75.0);
  qword_4D9D8 = v568;
  qword_4D9E0 = v569;

  v1918[0] = &off_3F4E8;
  long long v1442 = xmmword_33B60;
  v570 = +[NSValue valueWithBytes:&v1442 objCType:"{CGPoint=dd}"];
  v1919[0] = v570;
  v1918[1] = &off_3F500;
  long long v1441 = xmmword_33B70;
  v571 = +[NSValue valueWithBytes:&v1441 objCType:"{CGPoint=dd}"];
  v1919[1] = v571;
  v1918[2] = &off_3F518;
  long long v1440 = xmmword_34120;
  v572 = +[NSValue valueWithBytes:&v1440 objCType:"{CGPoint=dd}"];
  v1919[2] = v572;
  v573 = +[NSDictionary dictionaryWithObjects:v1919 forKeys:v1918 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v573, 1.0, -74.5);
  qword_4D9E8 = v574;
  qword_4D9F0 = v575;

  v1916[0] = &off_3F4E8;
  long long v1439 = xmmword_34130;
  v576 = +[NSValue valueWithBytes:&v1439 objCType:"{CGPoint=dd}"];
  v1917[0] = v576;
  v1916[1] = &off_3F500;
  long long v1438 = xmmword_34140;
  v577 = +[NSValue valueWithBytes:&v1438 objCType:"{CGPoint=dd}"];
  v1917[1] = v577;
  v1916[2] = &off_3F518;
  long long v1437 = xmmword_34150;
  v578 = +[NSValue valueWithBytes:&v1437 objCType:"{CGPoint=dd}"];
  v1917[2] = v578;
  v579 = +[NSDictionary dictionaryWithObjects:v1917 forKeys:v1916 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v579, 45.0, -78.5);
  qword_4D0F8 = v580;
  unk_4D100 = v581;

  v1914[0] = &off_3F4E8;
  long long v1436 = xmmword_34160;
  v582 = +[NSValue valueWithBytes:&v1436 objCType:"{CGPoint=dd}"];
  v1915[0] = v582;
  v1914[1] = &off_3F500;
  long long v1435 = xmmword_33990;
  v583 = +[NSValue valueWithBytes:&v1435 objCType:"{CGPoint=dd}"];
  v1915[1] = v583;
  v1914[2] = &off_3F518;
  long long v1434 = xmmword_339A0;
  v584 = +[NSValue valueWithBytes:&v1434 objCType:"{CGPoint=dd}"];
  v1915[2] = v584;
  v585 = +[NSDictionary dictionaryWithObjects:v1915 forKeys:v1914 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v585, 61.0, -36.5);
  qword_4D108 = v586;
  unk_4D110 = v587;

  v1912[0] = &off_3F4E8;
  long long v1433 = xmmword_34170;
  v588 = +[NSValue valueWithBytes:&v1433 objCType:"{CGPoint=dd}"];
  v1913[0] = v588;
  v1912[1] = &off_3F500;
  long long v1432 = xmmword_339C0;
  v589 = +[NSValue valueWithBytes:&v1432 objCType:"{CGPoint=dd}"];
  v1913[1] = v589;
  v1912[2] = &off_3F518;
  long long v1431 = xmmword_34180;
  v590 = +[NSValue valueWithBytes:&v1431 objCType:"{CGPoint=dd}"];
  v1913[2] = v590;
  v591 = +[NSDictionary dictionaryWithObjects:v1913 forKeys:v1912 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v591, 61.0, 0.0);
  qword_4D118 = v592;
  unk_4D120 = v593;

  v1910[0] = &off_3F4E8;
  long long v1430 = xmmword_34190;
  v594 = +[NSValue valueWithBytes:&v1430 objCType:"{CGPoint=dd}"];
  v1911[0] = v594;
  v1910[1] = &off_3F500;
  long long v1429 = xmmword_341A0;
  v595 = +[NSValue valueWithBytes:&v1429 objCType:"{CGPoint=dd}"];
  v1911[1] = v595;
  v1910[2] = &off_3F518;
  long long v1428 = xmmword_341B0;
  v596 = +[NSValue valueWithBytes:&v1428 objCType:"{CGPoint=dd}"];
  v1911[2] = v596;
  v597 = +[NSDictionary dictionaryWithObjects:v1911 forKeys:v1910 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v597, 61.0, 37.5);
  qword_4D128 = v598;
  unk_4D130 = v599;

  v1908[0] = &off_3F4E8;
  long long v1427 = xmmword_341C0;
  v600 = +[NSValue valueWithBytes:&v1427 objCType:"{CGPoint=dd}"];
  v1909[0] = v600;
  v1908[1] = &off_3F500;
  long long v1426 = xmmword_341D0;
  v601 = +[NSValue valueWithBytes:&v1426 objCType:"{CGPoint=dd}"];
  v1909[1] = v601;
  v1908[2] = &off_3F518;
  long long v1425 = xmmword_341E0;
  v602 = +[NSValue valueWithBytes:&v1425 objCType:"{CGPoint=dd}"];
  v1909[2] = v602;
  v603 = +[NSDictionary dictionaryWithObjects:v1909 forKeys:v1908 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v603, 44.5, 79.5);
  qword_4D138 = v604;
  unk_4D140 = v605;

  v1906[0] = &off_3F4E8;
  long long v1424 = xmmword_341F0;
  v606 = +[NSValue valueWithBytes:&v1424 objCType:"{CGPoint=dd}"];
  v1907[0] = v606;
  v1906[1] = &off_3F500;
  long long v1423 = xmmword_34200;
  v607 = +[NSValue valueWithBytes:&v1423 objCType:"{CGPoint=dd}"];
  v1907[1] = v607;
  v1906[2] = &off_3F518;
  long long v1422 = xmmword_34210;
  v608 = +[NSValue valueWithBytes:&v1422 objCType:"{CGPoint=dd}"];
  v1907[2] = v608;
  v609 = +[NSDictionary dictionaryWithObjects:v1907 forKeys:v1906 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v609, 1.0, 79.5);
  qword_4D148 = v610;
  unk_4D150 = v611;

  v1904[0] = &off_3F4E8;
  long long v1421 = xmmword_34220;
  v612 = +[NSValue valueWithBytes:&v1421 objCType:"{CGPoint=dd}"];
  v1905[0] = v612;
  v1904[1] = &off_3F500;
  long long v1420 = xmmword_34230;
  v613 = +[NSValue valueWithBytes:&v1420 objCType:"{CGPoint=dd}"];
  v1905[1] = v613;
  v1904[2] = &off_3F518;
  long long v1419 = xmmword_34240;
  v614 = +[NSValue valueWithBytes:&v1419 objCType:"{CGPoint=dd}"];
  v1905[2] = v614;
  v615 = +[NSDictionary dictionaryWithObjects:v1905 forKeys:v1904 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v615, -43.5, 79.5);
  qword_4D158 = v616;
  unk_4D160 = v617;

  v1902[0] = &off_3F4E8;
  long long v1418 = xmmword_34250;
  v618 = +[NSValue valueWithBytes:&v1418 objCType:"{CGPoint=dd}"];
  v1903[0] = v618;
  v1902[1] = &off_3F500;
  long long v1417 = xmmword_34260;
  v619 = +[NSValue valueWithBytes:&v1417 objCType:"{CGPoint=dd}"];
  v1903[1] = v619;
  v1902[2] = &off_3F518;
  long long v1416 = xmmword_34270;
  v620 = +[NSValue valueWithBytes:&v1416 objCType:"{CGPoint=dd}"];
  v1903[2] = v620;
  v621 = +[NSDictionary dictionaryWithObjects:v1903 forKeys:v1902 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v621, -60.0, 37.5);
  qword_4D168 = v622;
  unk_4D170 = v623;

  v1900[0] = &off_3F4E8;
  long long v1415 = xmmword_34280;
  v624 = +[NSValue valueWithBytes:&v1415 objCType:"{CGPoint=dd}"];
  v1901[0] = v624;
  v1900[1] = &off_3F500;
  long long v1414 = xmmword_34290;
  v625 = +[NSValue valueWithBytes:&v1414 objCType:"{CGPoint=dd}"];
  v1901[1] = v625;
  v1900[2] = &off_3F518;
  long long v1413 = xmmword_342A0;
  v626 = +[NSValue valueWithBytes:&v1413 objCType:"{CGPoint=dd}"];
  v1901[2] = v626;
  v627 = +[NSDictionary dictionaryWithObjects:v1901 forKeys:v1900 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v627, -60.0, 0.0);
  qword_4D178 = v628;
  qword_4D180 = v629;

  v1898[0] = &off_3F4E8;
  long long v1412 = xmmword_342B0;
  v630 = +[NSValue valueWithBytes:&v1412 objCType:"{CGPoint=dd}"];
  v1899[0] = v630;
  v1898[1] = &off_3F500;
  long long v1411 = xmmword_342C0;
  v631 = +[NSValue valueWithBytes:&v1411 objCType:"{CGPoint=dd}"];
  v1899[1] = v631;
  v1898[2] = &off_3F518;
  long long v1410 = xmmword_342D0;
  v632 = +[NSValue valueWithBytes:&v1410 objCType:"{CGPoint=dd}"];
  v1899[2] = v632;
  v633 = +[NSDictionary dictionaryWithObjects:v1899 forKeys:v1898 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v633, -60.0, -36.5);
  qword_4D188 = v634;
  qword_4D190 = v635;

  v1896[0] = &off_3F4E8;
  long long v1409 = xmmword_342E0;
  v636 = +[NSValue valueWithBytes:&v1409 objCType:"{CGPoint=dd}"];
  v1897[0] = v636;
  v1896[1] = &off_3F500;
  long long v1408 = xmmword_342F0;
  v637 = +[NSValue valueWithBytes:&v1408 objCType:"{CGPoint=dd}"];
  v1897[1] = v637;
  v1896[2] = &off_3F518;
  long long v1407 = xmmword_34300;
  v638 = +[NSValue valueWithBytes:&v1407 objCType:"{CGPoint=dd}"];
  v1897[2] = v638;
  v639 = +[NSDictionary dictionaryWithObjects:v1897 forKeys:v1896 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v639, -43.5, -78.5);
  qword_4D198 = v640;
  qword_4D1A0 = v641;

  v1894[0] = &off_3F4E8;
  long long v1406 = xmmword_34310;
  v642 = +[NSValue valueWithBytes:&v1406 objCType:"{CGPoint=dd}"];
  v1895[0] = v642;
  v1894[1] = &off_3F500;
  long long v1405 = xmmword_34320;
  v643 = +[NSValue valueWithBytes:&v1405 objCType:"{CGPoint=dd}"];
  v1895[1] = v643;
  v1894[2] = &off_3F518;
  long long v1404 = xmmword_34330;
  v644 = +[NSValue valueWithBytes:&v1404 objCType:"{CGPoint=dd}"];
  v1895[2] = v644;
  v645 = +[NSDictionary dictionaryWithObjects:v1895 forKeys:v1894 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v645, 0.5, -78.5);
  qword_4D1A8 = v646;
  qword_4D1B0 = v647;

  v1892[0] = &off_3F4E8;
  long long v1403 = xmmword_34340;
  v648 = +[NSValue valueWithBytes:&v1403 objCType:"{CGPoint=dd}"];
  v1893[0] = v648;
  v1892[1] = &off_3F500;
  long long v1402 = xmmword_34350;
  v649 = +[NSValue valueWithBytes:&v1402 objCType:"{CGPoint=dd}"];
  v1893[1] = v649;
  v1892[2] = &off_3F518;
  long long v1401 = xmmword_34360;
  v650 = +[NSValue valueWithBytes:&v1401 objCType:"{CGPoint=dd}"];
  v1893[2] = v650;
  v651 = +[NSDictionary dictionaryWithObjects:v1893 forKeys:v1892 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v651, 45.0, -75.0);
  qword_4D3F8 = v652;
  qword_4D400 = v653;

  v1890[0] = &off_3F4E8;
  long long v1400 = xmmword_34160;
  v654 = +[NSValue valueWithBytes:&v1400 objCType:"{CGPoint=dd}"];
  v1891[0] = v654;
  v1890[1] = &off_3F500;
  long long v1399 = xmmword_33990;
  v655 = +[NSValue valueWithBytes:&v1399 objCType:"{CGPoint=dd}"];
  v1891[1] = v655;
  v1890[2] = &off_3F518;
  long long v1398 = xmmword_339A0;
  v656 = +[NSValue valueWithBytes:&v1398 objCType:"{CGPoint=dd}"];
  v1891[2] = v656;
  v657 = +[NSDictionary dictionaryWithObjects:v1891 forKeys:v1890 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v657, 61.0, -36.5);
  qword_4D408 = v658;
  qword_4D410 = v659;

  v1888[0] = &off_3F4E8;
  long long v1397 = xmmword_34170;
  v660 = +[NSValue valueWithBytes:&v1397 objCType:"{CGPoint=dd}"];
  v1889[0] = v660;
  v1888[1] = &off_3F500;
  long long v1396 = xmmword_339C0;
  v661 = +[NSValue valueWithBytes:&v1396 objCType:"{CGPoint=dd}"];
  v1889[1] = v661;
  v1888[2] = &off_3F518;
  long long v1395 = xmmword_34180;
  v662 = +[NSValue valueWithBytes:&v1395 objCType:"{CGPoint=dd}"];
  v1889[2] = v662;
  v663 = +[NSDictionary dictionaryWithObjects:v1889 forKeys:v1888 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v663, 61.0, 0.0);
  qword_4D418 = v664;
  qword_4D420 = v665;

  v1886[0] = &off_3F4E8;
  long long v1394 = xmmword_34190;
  v666 = +[NSValue valueWithBytes:&v1394 objCType:"{CGPoint=dd}"];
  v1887[0] = v666;
  v1886[1] = &off_3F500;
  long long v1393 = xmmword_341A0;
  v667 = +[NSValue valueWithBytes:&v1393 objCType:"{CGPoint=dd}"];
  v1887[1] = v667;
  v1886[2] = &off_3F518;
  long long v1392 = xmmword_341B0;
  v668 = +[NSValue valueWithBytes:&v1392 objCType:"{CGPoint=dd}"];
  v1887[2] = v668;
  v669 = +[NSDictionary dictionaryWithObjects:v1887 forKeys:v1886 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v669, 61.0, 37.5);
  qword_4D428 = v670;
  qword_4D430 = v671;

  v1884[0] = &off_3F4E8;
  long long v1391 = xmmword_341C0;
  v672 = +[NSValue valueWithBytes:&v1391 objCType:"{CGPoint=dd}"];
  v1885[0] = v672;
  v1884[1] = &off_3F500;
  long long v1390 = xmmword_341D0;
  v673 = +[NSValue valueWithBytes:&v1390 objCType:"{CGPoint=dd}"];
  v1885[1] = v673;
  v1884[2] = &off_3F518;
  long long v1389 = xmmword_341E0;
  v674 = +[NSValue valueWithBytes:&v1389 objCType:"{CGPoint=dd}"];
  v1885[2] = v674;
  v675 = +[NSDictionary dictionaryWithObjects:v1885 forKeys:v1884 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v675, 44.5, 79.5);
  qword_4D438 = v676;
  qword_4D440 = v677;

  v1882[0] = &off_3F4E8;
  long long v1388 = xmmword_341F0;
  v678 = +[NSValue valueWithBytes:&v1388 objCType:"{CGPoint=dd}"];
  v1883[0] = v678;
  v1882[1] = &off_3F500;
  long long v1387 = xmmword_34200;
  v679 = +[NSValue valueWithBytes:&v1387 objCType:"{CGPoint=dd}"];
  v1883[1] = v679;
  v1882[2] = &off_3F518;
  long long v1386 = xmmword_34210;
  v680 = +[NSValue valueWithBytes:&v1386 objCType:"{CGPoint=dd}"];
  v1883[2] = v680;
  v681 = +[NSDictionary dictionaryWithObjects:v1883 forKeys:v1882 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v681, 1.0, 79.5);
  qword_4D448 = v682;
  qword_4D450 = v683;

  v1880[0] = &off_3F4E8;
  long long v1385 = xmmword_34220;
  v684 = +[NSValue valueWithBytes:&v1385 objCType:"{CGPoint=dd}"];
  v1881[0] = v684;
  v1880[1] = &off_3F500;
  long long v1384 = xmmword_34230;
  v685 = +[NSValue valueWithBytes:&v1384 objCType:"{CGPoint=dd}"];
  v1881[1] = v685;
  v1880[2] = &off_3F518;
  long long v1383 = xmmword_34240;
  v686 = +[NSValue valueWithBytes:&v1383 objCType:"{CGPoint=dd}"];
  v1881[2] = v686;
  v687 = +[NSDictionary dictionaryWithObjects:v1881 forKeys:v1880 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v687, -43.5, 79.5);
  qword_4D458 = v688;
  qword_4D460 = v689;

  v1878[0] = &off_3F4E8;
  long long v1382 = xmmword_34250;
  v690 = +[NSValue valueWithBytes:&v1382 objCType:"{CGPoint=dd}"];
  v1879[0] = v690;
  v1878[1] = &off_3F500;
  long long v1381 = xmmword_34260;
  v691 = +[NSValue valueWithBytes:&v1381 objCType:"{CGPoint=dd}"];
  v1879[1] = v691;
  v1878[2] = &off_3F518;
  long long v1380 = xmmword_34270;
  v692 = +[NSValue valueWithBytes:&v1380 objCType:"{CGPoint=dd}"];
  v1879[2] = v692;
  v693 = +[NSDictionary dictionaryWithObjects:v1879 forKeys:v1878 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v693, -60.0, 37.5);
  qword_4D468 = v694;
  qword_4D470 = v695;

  v1876[0] = &off_3F4E8;
  long long v1379 = xmmword_34280;
  v696 = +[NSValue valueWithBytes:&v1379 objCType:"{CGPoint=dd}"];
  v1877[0] = v696;
  v1876[1] = &off_3F500;
  long long v1378 = xmmword_34290;
  v697 = +[NSValue valueWithBytes:&v1378 objCType:"{CGPoint=dd}"];
  v1877[1] = v697;
  v1876[2] = &off_3F518;
  long long v1377 = xmmword_342A0;
  v698 = +[NSValue valueWithBytes:&v1377 objCType:"{CGPoint=dd}"];
  v1877[2] = v698;
  v699 = +[NSDictionary dictionaryWithObjects:v1877 forKeys:v1876 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v699, -60.0, 0.0);
  qword_4D478 = v700;
  qword_4D480 = v701;

  v1874[0] = &off_3F4E8;
  long long v1376 = xmmword_342B0;
  v702 = +[NSValue valueWithBytes:&v1376 objCType:"{CGPoint=dd}"];
  v1875[0] = v702;
  v1874[1] = &off_3F500;
  long long v1375 = xmmword_342C0;
  v703 = +[NSValue valueWithBytes:&v1375 objCType:"{CGPoint=dd}"];
  v1875[1] = v703;
  v1874[2] = &off_3F518;
  long long v1374 = xmmword_342D0;
  v704 = +[NSValue valueWithBytes:&v1374 objCType:"{CGPoint=dd}"];
  v1875[2] = v704;
  v705 = +[NSDictionary dictionaryWithObjects:v1875 forKeys:v1874 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v705, -60.0, -36.5);
  qword_4D488 = v706;
  qword_4D490 = v707;

  v1872[0] = &off_3F4E8;
  long long v1373 = xmmword_34370;
  v708 = +[NSValue valueWithBytes:&v1373 objCType:"{CGPoint=dd}"];
  v1873[0] = v708;
  v1872[1] = &off_3F500;
  long long v1372 = xmmword_34380;
  v709 = +[NSValue valueWithBytes:&v1372 objCType:"{CGPoint=dd}"];
  v1873[1] = v709;
  v1872[2] = &off_3F518;
  long long v1371 = xmmword_34390;
  v710 = +[NSValue valueWithBytes:&v1371 objCType:"{CGPoint=dd}"];
  v1873[2] = v710;
  v711 = +[NSDictionary dictionaryWithObjects:v1873 forKeys:v1872 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v711, -43.5, -75.0);
  qword_4D498 = v712;
  qword_4D4A0 = v713;

  v1870[0] = &off_3F4E8;
  long long v1370 = xmmword_343A0;
  v714 = +[NSValue valueWithBytes:&v1370 objCType:"{CGPoint=dd}"];
  v1871[0] = v714;
  v1870[1] = &off_3F500;
  long long v1369 = xmmword_343B0;
  v715 = +[NSValue valueWithBytes:&v1369 objCType:"{CGPoint=dd}"];
  v1871[1] = v715;
  v1870[2] = &off_3F518;
  long long v1368 = xmmword_343C0;
  v716 = +[NSValue valueWithBytes:&v1368 objCType:"{CGPoint=dd}"];
  v1871[2] = v716;
  v717 = +[NSDictionary dictionaryWithObjects:v1871 forKeys:v1870 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v717, 0.5, -75.0);
  qword_4D4A8 = v718;
  qword_4D4B0 = v719;

  v1868[0] = &off_3F4E8;
  long long v1367 = xmmword_34130;
  v720 = +[NSValue valueWithBytes:&v1367 objCType:"{CGPoint=dd}"];
  v1869[0] = v720;
  v1868[1] = &off_3F500;
  long long v1366 = xmmword_34140;
  v721 = +[NSValue valueWithBytes:&v1366 objCType:"{CGPoint=dd}"];
  v1869[1] = v721;
  v1868[2] = &off_3F518;
  long long v1365 = xmmword_343D0;
  v722 = +[NSValue valueWithBytes:&v1365 objCType:"{CGPoint=dd}"];
  v1869[2] = v722;
  v723 = +[NSDictionary dictionaryWithObjects:v1869 forKeys:v1868 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v723, 45.0, -75.0);
  qword_4D6F8 = v724;
  qword_4D700 = v725;

  v1866[0] = &off_3F4E8;
  long long v1364 = xmmword_34160;
  v726 = +[NSValue valueWithBytes:&v1364 objCType:"{CGPoint=dd}"];
  v1867[0] = v726;
  v1866[1] = &off_3F500;
  long long v1363 = xmmword_33990;
  v727 = +[NSValue valueWithBytes:&v1363 objCType:"{CGPoint=dd}"];
  v1867[1] = v727;
  v1866[2] = &off_3F518;
  long long v1362 = xmmword_343E0;
  v728 = +[NSValue valueWithBytes:&v1362 objCType:"{CGPoint=dd}"];
  v1867[2] = v728;
  v729 = +[NSDictionary dictionaryWithObjects:v1867 forKeys:v1866 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v729, 61.0, -36.5);
  qword_4D708 = v730;
  qword_4D710 = v731;

  v1864[0] = &off_3F4E8;
  long long v1361 = xmmword_34170;
  v732 = +[NSValue valueWithBytes:&v1361 objCType:"{CGPoint=dd}"];
  v1865[0] = v732;
  v1864[1] = &off_3F500;
  long long v1360 = xmmword_339C0;
  v733 = +[NSValue valueWithBytes:&v1360 objCType:"{CGPoint=dd}"];
  v1865[1] = v733;
  v1864[2] = &off_3F518;
  long long v1359 = xmmword_343F0;
  v734 = +[NSValue valueWithBytes:&v1359 objCType:"{CGPoint=dd}"];
  v1865[2] = v734;
  v735 = +[NSDictionary dictionaryWithObjects:v1865 forKeys:v1864 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v735, 61.0, 0.0);
  qword_4D718 = v736;
  qword_4D720 = v737;

  v1862[0] = &off_3F4E8;
  long long v1358 = xmmword_34190;
  v738 = +[NSValue valueWithBytes:&v1358 objCType:"{CGPoint=dd}"];
  v1863[0] = v738;
  v1862[1] = &off_3F500;
  long long v1357 = xmmword_341A0;
  v739 = +[NSValue valueWithBytes:&v1357 objCType:"{CGPoint=dd}"];
  v1863[1] = v739;
  v1862[2] = &off_3F518;
  long long v1356 = xmmword_34400;
  v740 = +[NSValue valueWithBytes:&v1356 objCType:"{CGPoint=dd}"];
  v1863[2] = v740;
  v741 = +[NSDictionary dictionaryWithObjects:v1863 forKeys:v1862 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v741, 61.0, 37.5);
  qword_4D728 = v742;
  qword_4D730 = v743;

  v1860[0] = &off_3F4E8;
  long long v1355 = xmmword_341C0;
  v744 = +[NSValue valueWithBytes:&v1355 objCType:"{CGPoint=dd}"];
  v1861[0] = v744;
  v1860[1] = &off_3F500;
  long long v1354 = xmmword_341D0;
  v745 = +[NSValue valueWithBytes:&v1354 objCType:"{CGPoint=dd}"];
  v1861[1] = v745;
  v1860[2] = &off_3F518;
  long long v1353 = xmmword_34410;
  v746 = +[NSValue valueWithBytes:&v1353 objCType:"{CGPoint=dd}"];
  v1861[2] = v746;
  v747 = +[NSDictionary dictionaryWithObjects:v1861 forKeys:v1860 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v747, 44.5, 75.0);
  qword_4D738 = v748;
  qword_4D740 = v749;

  v1858[0] = &off_3F4E8;
  long long v1352 = xmmword_341F0;
  v750 = +[NSValue valueWithBytes:&v1352 objCType:"{CGPoint=dd}"];
  v1859[0] = v750;
  v1858[1] = &off_3F500;
  long long v1351 = xmmword_34200;
  v751 = +[NSValue valueWithBytes:&v1351 objCType:"{CGPoint=dd}"];
  v1859[1] = v751;
  v1858[2] = &off_3F518;
  long long v1350 = xmmword_34420;
  v752 = +[NSValue valueWithBytes:&v1350 objCType:"{CGPoint=dd}"];
  v1859[2] = v752;
  v753 = +[NSDictionary dictionaryWithObjects:v1859 forKeys:v1858 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v753, 1.0, 75.0);
  qword_4D748 = v754;
  qword_4D750 = v755;

  v1856[0] = &off_3F4E8;
  long long v1349 = xmmword_34220;
  v756 = +[NSValue valueWithBytes:&v1349 objCType:"{CGPoint=dd}"];
  v1857[0] = v756;
  v1856[1] = &off_3F500;
  long long v1348 = xmmword_34230;
  v757 = +[NSValue valueWithBytes:&v1348 objCType:"{CGPoint=dd}"];
  v1857[1] = v757;
  v1856[2] = &off_3F518;
  long long v1347 = xmmword_34430;
  v758 = +[NSValue valueWithBytes:&v1347 objCType:"{CGPoint=dd}"];
  v1857[2] = v758;
  v759 = +[NSDictionary dictionaryWithObjects:v1857 forKeys:v1856 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v759, -43.5, 75.0);
  qword_4D758 = v760;
  qword_4D760 = v761;

  v1854[0] = &off_3F4E8;
  long long v1346 = xmmword_34250;
  v762 = +[NSValue valueWithBytes:&v1346 objCType:"{CGPoint=dd}"];
  v1855[0] = v762;
  v1854[1] = &off_3F500;
  long long v1345 = xmmword_34260;
  v763 = +[NSValue valueWithBytes:&v1345 objCType:"{CGPoint=dd}"];
  v1855[1] = v763;
  v1854[2] = &off_3F518;
  long long v1344 = xmmword_34440;
  v764 = +[NSValue valueWithBytes:&v1344 objCType:"{CGPoint=dd}"];
  v1855[2] = v764;
  v765 = +[NSDictionary dictionaryWithObjects:v1855 forKeys:v1854 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v765, -60.0, 37.5);
  qword_4D768 = v766;
  qword_4D770 = v767;

  v1852[0] = &off_3F4E8;
  long long v1343 = xmmword_34280;
  v768 = +[NSValue valueWithBytes:&v1343 objCType:"{CGPoint=dd}"];
  v1853[0] = v768;
  v1852[1] = &off_3F500;
  long long v1342 = xmmword_34290;
  v769 = +[NSValue valueWithBytes:&v1342 objCType:"{CGPoint=dd}"];
  v1853[1] = v769;
  v1852[2] = &off_3F518;
  long long v1341 = xmmword_34450;
  v770 = +[NSValue valueWithBytes:&v1341 objCType:"{CGPoint=dd}"];
  v1853[2] = v770;
  v771 = +[NSDictionary dictionaryWithObjects:v1853 forKeys:v1852 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v771, -60.0, 0.0);
  qword_4D778 = v772;
  qword_4D780 = v773;

  v1850[0] = &off_3F4E8;
  long long v1340 = xmmword_342B0;
  v774 = +[NSValue valueWithBytes:&v1340 objCType:"{CGPoint=dd}"];
  v1851[0] = v774;
  v1850[1] = &off_3F500;
  long long v1339 = xmmword_342C0;
  v775 = +[NSValue valueWithBytes:&v1339 objCType:"{CGPoint=dd}"];
  v1851[1] = v775;
  v1850[2] = &off_3F518;
  long long v1338 = xmmword_34460;
  v776 = +[NSValue valueWithBytes:&v1338 objCType:"{CGPoint=dd}"];
  v1851[2] = v776;
  v777 = +[NSDictionary dictionaryWithObjects:v1851 forKeys:v1850 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v777, -60.0, -36.5);
  qword_4D788 = v778;
  qword_4D790 = v779;

  v1848[0] = &off_3F4E8;
  long long v1337 = xmmword_342E0;
  v780 = +[NSValue valueWithBytes:&v1337 objCType:"{CGPoint=dd}"];
  v1849[0] = v780;
  v1848[1] = &off_3F500;
  long long v1336 = xmmword_342F0;
  v781 = +[NSValue valueWithBytes:&v1336 objCType:"{CGPoint=dd}"];
  v1849[1] = v781;
  v1848[2] = &off_3F518;
  long long v1335 = xmmword_34470;
  v782 = +[NSValue valueWithBytes:&v1335 objCType:"{CGPoint=dd}"];
  v1849[2] = v782;
  v783 = +[NSDictionary dictionaryWithObjects:v1849 forKeys:v1848 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v783, -43.5, -75.0);
  qword_4D798 = v784;
  qword_4D7A0 = v785;

  v1846[0] = &off_3F4E8;
  long long v1334 = xmmword_34310;
  v786 = +[NSValue valueWithBytes:&v1334 objCType:"{CGPoint=dd}"];
  v1847[0] = v786;
  v1846[1] = &off_3F500;
  long long v1333 = xmmword_34320;
  v787 = +[NSValue valueWithBytes:&v1333 objCType:"{CGPoint=dd}"];
  v1847[1] = v787;
  v1846[2] = &off_3F518;
  long long v1332 = xmmword_343C0;
  v788 = +[NSValue valueWithBytes:&v1332 objCType:"{CGPoint=dd}"];
  v1847[2] = v788;
  v789 = +[NSDictionary dictionaryWithObjects:v1847 forKeys:v1846 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v789, 0.5, -75.0);
  qword_4D7A8 = v790;
  qword_4D7B0 = v791;

  v1844[0] = &off_3F4E8;
  long long v1331 = xmmword_34130;
  v792 = +[NSValue valueWithBytes:&v1331 objCType:"{CGPoint=dd}"];
  v1845[0] = v792;
  v1844[1] = &off_3F500;
  long long v1330 = xmmword_34140;
  v793 = +[NSValue valueWithBytes:&v1330 objCType:"{CGPoint=dd}"];
  v1845[1] = v793;
  v1844[2] = &off_3F518;
  long long v1329 = xmmword_343D0;
  v794 = +[NSValue valueWithBytes:&v1329 objCType:"{CGPoint=dd}"];
  v1845[2] = v794;
  v795 = +[NSDictionary dictionaryWithObjects:v1845 forKeys:v1844 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v795, 45.0, -75.0);
  qword_4D9F8 = v796;
  qword_4DA00 = v797;

  v1842[0] = &off_3F4E8;
  long long v1328 = xmmword_34160;
  v798 = +[NSValue valueWithBytes:&v1328 objCType:"{CGPoint=dd}"];
  v1843[0] = v798;
  v1842[1] = &off_3F500;
  long long v1327 = xmmword_33990;
  v799 = +[NSValue valueWithBytes:&v1327 objCType:"{CGPoint=dd}"];
  v1843[1] = v799;
  v1842[2] = &off_3F518;
  long long v1326 = xmmword_343E0;
  v800 = +[NSValue valueWithBytes:&v1326 objCType:"{CGPoint=dd}"];
  v1843[2] = v800;
  v801 = +[NSDictionary dictionaryWithObjects:v1843 forKeys:v1842 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v801, 61.0, -36.5);
  qword_4DA08 = v802;
  qword_4DA10 = v803;

  v1840[0] = &off_3F4E8;
  long long v1325 = xmmword_34170;
  v804 = +[NSValue valueWithBytes:&v1325 objCType:"{CGPoint=dd}"];
  v1841[0] = v804;
  v1840[1] = &off_3F500;
  long long v1324 = xmmword_339C0;
  v805 = +[NSValue valueWithBytes:&v1324 objCType:"{CGPoint=dd}"];
  v1841[1] = v805;
  v1840[2] = &off_3F518;
  long long v1323 = xmmword_343F0;
  v806 = +[NSValue valueWithBytes:&v1323 objCType:"{CGPoint=dd}"];
  v1841[2] = v806;
  v807 = +[NSDictionary dictionaryWithObjects:v1841 forKeys:v1840 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v807, 61.0, 0.0);
  qword_4DA18 = v808;
  qword_4DA20 = v809;

  v1838[0] = &off_3F4E8;
  long long v1322 = xmmword_34190;
  v810 = +[NSValue valueWithBytes:&v1322 objCType:"{CGPoint=dd}"];
  v1839[0] = v810;
  v1838[1] = &off_3F500;
  long long v1321 = xmmword_341A0;
  v811 = +[NSValue valueWithBytes:&v1321 objCType:"{CGPoint=dd}"];
  v1839[1] = v811;
  v1838[2] = &off_3F518;
  long long v1320 = xmmword_34400;
  v812 = +[NSValue valueWithBytes:&v1320 objCType:"{CGPoint=dd}"];
  v1839[2] = v812;
  v813 = +[NSDictionary dictionaryWithObjects:v1839 forKeys:v1838 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v813, 61.0, 37.5);
  qword_4DA28 = v814;
  qword_4DA30 = v815;

  v1836[0] = &off_3F4E8;
  long long v1319 = xmmword_341C0;
  v816 = +[NSValue valueWithBytes:&v1319 objCType:"{CGPoint=dd}"];
  v1837[0] = v816;
  v1836[1] = &off_3F500;
  long long v1318 = xmmword_341D0;
  v817 = +[NSValue valueWithBytes:&v1318 objCType:"{CGPoint=dd}"];
  v1837[1] = v817;
  v1836[2] = &off_3F518;
  long long v1317 = xmmword_34410;
  v818 = +[NSValue valueWithBytes:&v1317 objCType:"{CGPoint=dd}"];
  v1837[2] = v818;
  v819 = +[NSDictionary dictionaryWithObjects:v1837 forKeys:v1836 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v819, 44.5, 75.0);
  qword_4DA38 = v820;
  qword_4DA40 = v821;

  v1834[0] = &off_3F4E8;
  long long v1316 = xmmword_341F0;
  v822 = +[NSValue valueWithBytes:&v1316 objCType:"{CGPoint=dd}"];
  v1835[0] = v822;
  v1834[1] = &off_3F500;
  long long v1315 = xmmword_34200;
  v823 = +[NSValue valueWithBytes:&v1315 objCType:"{CGPoint=dd}"];
  v1835[1] = v823;
  v1834[2] = &off_3F518;
  long long v1314 = xmmword_34420;
  v824 = +[NSValue valueWithBytes:&v1314 objCType:"{CGPoint=dd}"];
  v1835[2] = v824;
  v825 = +[NSDictionary dictionaryWithObjects:v1835 forKeys:v1834 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v825, 1.0, 75.0);
  qword_4DA48 = v826;
  qword_4DA50 = v827;

  v1832[0] = &off_3F4E8;
  long long v1313 = xmmword_34220;
  v828 = +[NSValue valueWithBytes:&v1313 objCType:"{CGPoint=dd}"];
  v1833[0] = v828;
  v1832[1] = &off_3F500;
  long long v1312 = xmmword_34230;
  v829 = +[NSValue valueWithBytes:&v1312 objCType:"{CGPoint=dd}"];
  v1833[1] = v829;
  v1832[2] = &off_3F518;
  long long v1311 = xmmword_34430;
  v830 = +[NSValue valueWithBytes:&v1311 objCType:"{CGPoint=dd}"];
  v1833[2] = v830;
  v831 = +[NSDictionary dictionaryWithObjects:v1833 forKeys:v1832 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v831, -43.5, 75.0);
  qword_4DA58 = v832;
  qword_4DA60 = v833;

  v1830[0] = &off_3F4E8;
  long long v1310 = xmmword_34250;
  v834 = +[NSValue valueWithBytes:&v1310 objCType:"{CGPoint=dd}"];
  v1831[0] = v834;
  v1830[1] = &off_3F500;
  long long v1309 = xmmword_34260;
  v835 = +[NSValue valueWithBytes:&v1309 objCType:"{CGPoint=dd}"];
  v1831[1] = v835;
  v1830[2] = &off_3F518;
  long long v1308 = xmmword_34440;
  v836 = +[NSValue valueWithBytes:&v1308 objCType:"{CGPoint=dd}"];
  v1831[2] = v836;
  v837 = +[NSDictionary dictionaryWithObjects:v1831 forKeys:v1830 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v837, -60.0, 37.5);
  qword_4DA68 = v838;
  qword_4DA70 = v839;

  v1828[0] = &off_3F4E8;
  long long v1307 = xmmword_34280;
  v840 = +[NSValue valueWithBytes:&v1307 objCType:"{CGPoint=dd}"];
  v1829[0] = v840;
  v1828[1] = &off_3F500;
  long long v1306 = xmmword_34290;
  v841 = +[NSValue valueWithBytes:&v1306 objCType:"{CGPoint=dd}"];
  v1829[1] = v841;
  v1828[2] = &off_3F518;
  long long v1305 = xmmword_34450;
  v842 = +[NSValue valueWithBytes:&v1305 objCType:"{CGPoint=dd}"];
  v1829[2] = v842;
  v843 = +[NSDictionary dictionaryWithObjects:v1829 forKeys:v1828 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v843, -60.0, 0.0);
  qword_4DA78 = v844;
  qword_4DA80 = v845;

  v1826[0] = &off_3F4E8;
  long long v1304 = xmmword_342B0;
  v846 = +[NSValue valueWithBytes:&v1304 objCType:"{CGPoint=dd}"];
  v1827[0] = v846;
  v1826[1] = &off_3F500;
  long long v1303 = xmmword_342C0;
  v847 = +[NSValue valueWithBytes:&v1303 objCType:"{CGPoint=dd}"];
  v1827[1] = v847;
  v1826[2] = &off_3F518;
  long long v1302 = xmmword_34460;
  v848 = +[NSValue valueWithBytes:&v1302 objCType:"{CGPoint=dd}"];
  v1827[2] = v848;
  v849 = +[NSDictionary dictionaryWithObjects:v1827 forKeys:v1826 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v849, -60.0, -36.5);
  qword_4DA88 = v850;
  qword_4DA90 = v851;

  v1824[0] = &off_3F4E8;
  long long v1301 = xmmword_342E0;
  v852 = +[NSValue valueWithBytes:&v1301 objCType:"{CGPoint=dd}"];
  v1825[0] = v852;
  v1824[1] = &off_3F500;
  long long v1300 = xmmword_342F0;
  v853 = +[NSValue valueWithBytes:&v1300 objCType:"{CGPoint=dd}"];
  v1825[1] = v853;
  v1824[2] = &off_3F518;
  long long v1299 = xmmword_34470;
  v854 = +[NSValue valueWithBytes:&v1299 objCType:"{CGPoint=dd}"];
  v1825[2] = v854;
  v855 = +[NSDictionary dictionaryWithObjects:v1825 forKeys:v1824 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v855, -43.5, -75.0);
  qword_4DA98 = v856;
  qword_4DAA0 = v857;

  v1822[0] = &off_3F4E8;
  long long v1298 = xmmword_34310;
  v858 = +[NSValue valueWithBytes:&v1298 objCType:"{CGPoint=dd}"];
  v1823[0] = v858;
  v1822[1] = &off_3F500;
  long long v1297 = xmmword_34320;
  v859 = +[NSValue valueWithBytes:&v1297 objCType:"{CGPoint=dd}"];
  v1823[1] = v859;
  v1822[2] = &off_3F518;
  long long v1296 = xmmword_343C0;
  v860 = +[NSValue valueWithBytes:&v1296 objCType:"{CGPoint=dd}"];
  v1823[2] = v860;
  v861 = +[NSDictionary dictionaryWithObjects:v1823 forKeys:v1822 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v861, 0.5, -75.0);
  qword_4DAA8 = v862;
  qword_4DAB0 = v863;

  v1820[0] = &off_3F4E8;
  long long v1295 = xmmword_34480;
  v864 = +[NSValue valueWithBytes:&v1295 objCType:"{CGPoint=dd}"];
  v1821[0] = v864;
  v1820[1] = &off_3F500;
  long long v1294 = xmmword_34490;
  v865 = +[NSValue valueWithBytes:&v1294 objCType:"{CGPoint=dd}"];
  v1821[1] = v865;
  v1820[2] = &off_3F518;
  long long v1293 = xmmword_344A0;
  v866 = +[NSValue valueWithBytes:&v1293 objCType:"{CGPoint=dd}"];
  v1821[2] = v866;
  v867 = +[NSDictionary dictionaryWithObjects:v1821 forKeys:v1820 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v867, 44.0, -77.5);
  qword_4D1B8 = v868;
  qword_4D1C0 = v869;

  v1818[0] = &off_3F4E8;
  long long v1292 = xmmword_344B0;
  v870 = +[NSValue valueWithBytes:&v1292 objCType:"{CGPoint=dd}"];
  v1819[0] = v870;
  v1818[1] = &off_3F500;
  long long v1291 = xmmword_33990;
  v871 = +[NSValue valueWithBytes:&v1291 objCType:"{CGPoint=dd}"];
  v1819[1] = v871;
  v1818[2] = &off_3F518;
  long long v1290 = xmmword_344C0;
  v872 = +[NSValue valueWithBytes:&v1290 objCType:"{CGPoint=dd}"];
  v1819[2] = v872;
  v873 = +[NSDictionary dictionaryWithObjects:v1819 forKeys:v1818 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v873, 61.0, -36.5);
  qword_4D1C8 = v874;
  qword_4D1D0 = v875;

  v1816[0] = &off_3F4E8;
  long long v1289 = xmmword_344D0;
  v876 = +[NSValue valueWithBytes:&v1289 objCType:"{CGPoint=dd}"];
  v1817[0] = v876;
  v1816[1] = &off_3F500;
  long long v1288 = xmmword_344E0;
  v877 = +[NSValue valueWithBytes:&v1288 objCType:"{CGPoint=dd}"];
  v1817[1] = v877;
  v1816[2] = &off_3F518;
  long long v1287 = xmmword_344F0;
  v878 = +[NSValue valueWithBytes:&v1287 objCType:"{CGPoint=dd}"];
  v1817[2] = v878;
  v879 = +[NSDictionary dictionaryWithObjects:v1817 forKeys:v1816 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v879, 61.0, -0.5);
  qword_4D1D8 = v880;
  qword_4D1E0 = v881;

  v1814[0] = &off_3F4E8;
  long long v1286 = xmmword_34500;
  v882 = +[NSValue valueWithBytes:&v1286 objCType:"{CGPoint=dd}"];
  v1815[0] = v882;
  v1814[1] = &off_3F500;
  long long v1285 = xmmword_34510;
  v883 = +[NSValue valueWithBytes:&v1285 objCType:"{CGPoint=dd}"];
  v1815[1] = v883;
  v1814[2] = &off_3F518;
  long long v1284 = xmmword_34520;
  v884 = +[NSValue valueWithBytes:&v1284 objCType:"{CGPoint=dd}"];
  v1815[2] = v884;
  v885 = +[NSDictionary dictionaryWithObjects:v1815 forKeys:v1814 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v885);
  qword_4D1E8 = v886;
  qword_4D1F0 = v887;

  v1812[0] = &off_3F4E8;
  long long v1283 = xmmword_34530;
  v888 = +[NSValue valueWithBytes:&v1283 objCType:"{CGPoint=dd}"];
  v1813[0] = v888;
  v1812[1] = &off_3F500;
  long long v1282 = xmmword_34540;
  v889 = +[NSValue valueWithBytes:&v1282 objCType:"{CGPoint=dd}"];
  v1813[1] = v889;
  v1812[2] = &off_3F518;
  long long v1281 = xmmword_34550;
  v890 = +[NSValue valueWithBytes:&v1281 objCType:"{CGPoint=dd}"];
  v1813[2] = v890;
  v891 = +[NSDictionary dictionaryWithObjects:v1813 forKeys:v1812 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v891, 44.5, 75.5);
  qword_4D1F8 = v892;
  qword_4D200 = v893;

  v1810[0] = &off_3F4E8;
  long long v1280 = xmmword_34560;
  v894 = +[NSValue valueWithBytes:&v1280 objCType:"{CGPoint=dd}"];
  v1811[0] = v894;
  v1810[1] = &off_3F500;
  long long v1279 = xmmword_34570;
  v895 = +[NSValue valueWithBytes:&v1279 objCType:"{CGPoint=dd}"];
  v1811[1] = v895;
  v1810[2] = &off_3F518;
  long long v1278 = xmmword_34580;
  v896 = +[NSValue valueWithBytes:&v1278 objCType:"{CGPoint=dd}"];
  v1811[2] = v896;
  v897 = +[NSDictionary dictionaryWithObjects:v1811 forKeys:v1810 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v897, 1.0, 75.5);
  qword_4D208 = v898;
  qword_4D210 = v899;

  v1808[0] = &off_3F4E8;
  long long v1277 = xmmword_34590;
  v900 = +[NSValue valueWithBytes:&v1277 objCType:"{CGPoint=dd}"];
  v1809[0] = v900;
  v1808[1] = &off_3F500;
  long long v1276 = xmmword_345A0;
  v901 = +[NSValue valueWithBytes:&v1276 objCType:"{CGPoint=dd}"];
  v1809[1] = v901;
  v1808[2] = &off_3F518;
  long long v1275 = xmmword_345B0;
  v902 = +[NSValue valueWithBytes:&v1275 objCType:"{CGPoint=dd}"];
  v1809[2] = v902;
  v903 = +[NSDictionary dictionaryWithObjects:v1809 forKeys:v1808 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v903, -43.0, 75.5);
  qword_4D218 = v904;
  qword_4D220 = v905;

  v1806[0] = &off_3F4E8;
  long long v1274 = xmmword_345C0;
  v906 = +[NSValue valueWithBytes:&v1274 objCType:"{CGPoint=dd}"];
  v1807[0] = v906;
  v1806[1] = &off_3F500;
  long long v1273 = xmmword_345D0;
  v907 = +[NSValue valueWithBytes:&v1273 objCType:"{CGPoint=dd}"];
  v1807[1] = v907;
  v1806[2] = &off_3F518;
  long long v1272 = xmmword_33E10;
  v908 = +[NSValue valueWithBytes:&v1272 objCType:"{CGPoint=dd}"];
  v1807[2] = v908;
  v909 = +[NSDictionary dictionaryWithObjects:v1807 forKeys:v1806 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v909, -60.0, 36.5);
  qword_4D228 = v910;
  qword_4D230 = v911;

  v1804[0] = &off_3F4E8;
  long long v1271 = xmmword_345E0;
  v912 = +[NSValue valueWithBytes:&v1271 objCType:"{CGPoint=dd}"];
  v1805[0] = v912;
  v1804[1] = &off_3F500;
  long long v1270 = xmmword_345F0;
  v913 = +[NSValue valueWithBytes:&v1270 objCType:"{CGPoint=dd}"];
  v1805[1] = v913;
  v1804[2] = &off_3F518;
  long long v1269 = xmmword_34600;
  v914 = +[NSValue valueWithBytes:&v1269 objCType:"{CGPoint=dd}"];
  v1805[2] = v914;
  v915 = +[NSDictionary dictionaryWithObjects:v1805 forKeys:v1804 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v915);
  qword_4D238 = v916;
  qword_4D240 = v917;

  v1802[0] = &off_3F4E8;
  long long v1268 = xmmword_34610;
  v918 = +[NSValue valueWithBytes:&v1268 objCType:"{CGPoint=dd}"];
  v1803[0] = v918;
  v1802[1] = &off_3F500;
  long long v1267 = xmmword_342C0;
  v919 = +[NSValue valueWithBytes:&v1267 objCType:"{CGPoint=dd}"];
  v1803[1] = v919;
  v1802[2] = &off_3F518;
  long long v1266 = xmmword_34620;
  v920 = +[NSValue valueWithBytes:&v1266 objCType:"{CGPoint=dd}"];
  v1803[2] = v920;
  v921 = +[NSDictionary dictionaryWithObjects:v1803 forKeys:v1802 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v921, -60.0, -36.5);
  qword_4D248 = v922;
  qword_4D250 = v923;

  v1800[0] = &off_3F4E8;
  long long v1265 = xmmword_34630;
  v924 = +[NSValue valueWithBytes:&v1265 objCType:"{CGPoint=dd}"];
  v1801[0] = v924;
  v1800[1] = &off_3F500;
  long long v1264 = xmmword_34640;
  v925 = +[NSValue valueWithBytes:&v1264 objCType:"{CGPoint=dd}"];
  v1801[1] = v925;
  v1800[2] = &off_3F518;
  long long v1263 = xmmword_34650;
  v926 = +[NSValue valueWithBytes:&v1263 objCType:"{CGPoint=dd}"];
  v1801[2] = v926;
  v927 = +[NSDictionary dictionaryWithObjects:v1801 forKeys:v1800 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v927, -43.5, -77.5);
  qword_4D258 = v928;
  qword_4D260 = v929;

  v1798[0] = &off_3F4E8;
  long long v1262 = xmmword_34660;
  v930 = +[NSValue valueWithBytes:&v1262 objCType:"{CGPoint=dd}"];
  v1799[0] = v930;
  v1798[1] = &off_3F500;
  long long v1261 = xmmword_34670;
  v931 = +[NSValue valueWithBytes:&v1261 objCType:"{CGPoint=dd}"];
  v1799[1] = v931;
  v1798[2] = &off_3F518;
  long long v1260 = xmmword_34680;
  v932 = +[NSValue valueWithBytes:&v1260 objCType:"{CGPoint=dd}"];
  v1799[2] = v932;
  v933 = +[NSDictionary dictionaryWithObjects:v1799 forKeys:v1798 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v933, 1.5, -77.5);
  qword_4D268 = v934;
  qword_4D270 = v935;

  v1796[0] = &off_3F4E8;
  long long v1259 = xmmword_34690;
  v936 = +[NSValue valueWithBytes:&v1259 objCType:"{CGPoint=dd}"];
  v1797[0] = v936;
  v1796[1] = &off_3F500;
  long long v1258 = xmmword_346A0;
  v937 = +[NSValue valueWithBytes:&v1258 objCType:"{CGPoint=dd}"];
  v1797[1] = v937;
  v1796[2] = &off_3F518;
  long long v1257 = xmmword_346B0;
  v938 = +[NSValue valueWithBytes:&v1257 objCType:"{CGPoint=dd}"];
  v1797[2] = v938;
  v939 = +[NSDictionary dictionaryWithObjects:v1797 forKeys:v1796 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v939, 44.0, -75.0);
  qword_4D4B8 = v940;
  qword_4D4C0 = v941;

  v1794[0] = &off_3F4E8;
  long long v1256 = xmmword_344B0;
  v942 = +[NSValue valueWithBytes:&v1256 objCType:"{CGPoint=dd}"];
  v1795[0] = v942;
  v1794[1] = &off_3F500;
  long long v1255 = xmmword_33990;
  v943 = +[NSValue valueWithBytes:&v1255 objCType:"{CGPoint=dd}"];
  v1795[1] = v943;
  v1794[2] = &off_3F518;
  long long v1254 = xmmword_344C0;
  v944 = +[NSValue valueWithBytes:&v1254 objCType:"{CGPoint=dd}"];
  v1795[2] = v944;
  v945 = +[NSDictionary dictionaryWithObjects:v1795 forKeys:v1794 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v945, 61.0, -36.5);
  qword_4D4C8 = v946;
  qword_4D4D0 = v947;

  v1792[0] = &off_3F4E8;
  long long v1253 = xmmword_344D0;
  v948 = +[NSValue valueWithBytes:&v1253 objCType:"{CGPoint=dd}"];
  v1793[0] = v948;
  v1792[1] = &off_3F500;
  long long v1252 = xmmword_344E0;
  v949 = +[NSValue valueWithBytes:&v1252 objCType:"{CGPoint=dd}"];
  v1793[1] = v949;
  v1792[2] = &off_3F518;
  long long v1251 = xmmword_344F0;
  v950 = +[NSValue valueWithBytes:&v1251 objCType:"{CGPoint=dd}"];
  v1793[2] = v950;
  v951 = +[NSDictionary dictionaryWithObjects:v1793 forKeys:v1792 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v951, 61.0, -0.5);
  qword_4D4D8 = v952;
  qword_4D4E0 = v953;

  v1790[0] = &off_3F4E8;
  long long v1250 = xmmword_34500;
  v954 = +[NSValue valueWithBytes:&v1250 objCType:"{CGPoint=dd}"];
  v1791[0] = v954;
  v1790[1] = &off_3F500;
  long long v1249 = xmmword_34510;
  v955 = +[NSValue valueWithBytes:&v1249 objCType:"{CGPoint=dd}"];
  v1791[1] = v955;
  v1790[2] = &off_3F518;
  long long v1248 = xmmword_34520;
  v956 = +[NSValue valueWithBytes:&v1248 objCType:"{CGPoint=dd}"];
  v1791[2] = v956;
  v957 = +[NSDictionary dictionaryWithObjects:v1791 forKeys:v1790 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v957, 60.5, 35.5);
  qword_4D4E8 = v958;
  qword_4D4F0 = v959;

  v1788[0] = &off_3F4E8;
  long long v1247 = xmmword_34530;
  v960 = +[NSValue valueWithBytes:&v1247 objCType:"{CGPoint=dd}"];
  v1789[0] = v960;
  v1788[1] = &off_3F500;
  long long v1246 = xmmword_34540;
  v961 = +[NSValue valueWithBytes:&v1246 objCType:"{CGPoint=dd}"];
  v1789[1] = v961;
  v1788[2] = &off_3F518;
  long long v1245 = xmmword_34550;
  v962 = +[NSValue valueWithBytes:&v1245 objCType:"{CGPoint=dd}"];
  v1789[2] = v962;
  v963 = +[NSDictionary dictionaryWithObjects:v1789 forKeys:v1788 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v963, 44.5, 75.5);
  qword_4D4F8 = v964;
  qword_4D500 = v965;

  v1786[0] = &off_3F4E8;
  long long v1244 = xmmword_34560;
  v966 = +[NSValue valueWithBytes:&v1244 objCType:"{CGPoint=dd}"];
  v1787[0] = v966;
  v1786[1] = &off_3F500;
  long long v1243 = xmmword_34570;
  v967 = +[NSValue valueWithBytes:&v1243 objCType:"{CGPoint=dd}"];
  v1787[1] = v967;
  v1786[2] = &off_3F518;
  long long v1242 = xmmword_34580;
  v968 = +[NSValue valueWithBytes:&v1242 objCType:"{CGPoint=dd}"];
  v1787[2] = v968;
  v969 = +[NSDictionary dictionaryWithObjects:v1787 forKeys:v1786 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v969, 1.0, 75.5);
  qword_4D508 = v970;
  qword_4D510 = v971;

  v1784[0] = &off_3F4E8;
  long long v1241 = xmmword_34590;
  v972 = +[NSValue valueWithBytes:&v1241 objCType:"{CGPoint=dd}"];
  v1785[0] = v972;
  v1784[1] = &off_3F500;
  long long v1240 = xmmword_345A0;
  v973 = +[NSValue valueWithBytes:&v1240 objCType:"{CGPoint=dd}"];
  v1785[1] = v973;
  v1784[2] = &off_3F518;
  long long v1239 = xmmword_345B0;
  v974 = +[NSValue valueWithBytes:&v1239 objCType:"{CGPoint=dd}"];
  v1785[2] = v974;
  v975 = +[NSDictionary dictionaryWithObjects:v1785 forKeys:v1784 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v975, -43.0, 75.5);
  qword_4D518 = v976;
  qword_4D520 = v977;

  v1782[0] = &off_3F4E8;
  long long v1238 = xmmword_345C0;
  v978 = +[NSValue valueWithBytes:&v1238 objCType:"{CGPoint=dd}"];
  v1783[0] = v978;
  v1782[1] = &off_3F500;
  long long v1237 = xmmword_345D0;
  v979 = +[NSValue valueWithBytes:&v1237 objCType:"{CGPoint=dd}"];
  v1783[1] = v979;
  v1782[2] = &off_3F518;
  long long v1236 = xmmword_33E10;
  v980 = +[NSValue valueWithBytes:&v1236 objCType:"{CGPoint=dd}"];
  v1783[2] = v980;
  v981 = +[NSDictionary dictionaryWithObjects:v1783 forKeys:v1782 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v981, -60.0, 36.5);
  qword_4D528 = v982;
  qword_4D530 = v983;

  v1780[0] = &off_3F4E8;
  long long v1235 = xmmword_345E0;
  v984 = +[NSValue valueWithBytes:&v1235 objCType:"{CGPoint=dd}"];
  v1781[0] = v984;
  v1780[1] = &off_3F500;
  long long v1234 = xmmword_345F0;
  v985 = +[NSValue valueWithBytes:&v1234 objCType:"{CGPoint=dd}"];
  v1781[1] = v985;
  v1780[2] = &off_3F518;
  long long v1233 = xmmword_34600;
  v986 = +[NSValue valueWithBytes:&v1233 objCType:"{CGPoint=dd}"];
  v1781[2] = v986;
  v987 = +[NSDictionary dictionaryWithObjects:v1781 forKeys:v1780 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v987, -59.5, -0.5);
  qword_4D538 = v988;
  qword_4D540 = v989;

  v1778[0] = &off_3F4E8;
  long long v1232 = xmmword_34610;
  v990 = +[NSValue valueWithBytes:&v1232 objCType:"{CGPoint=dd}"];
  v1779[0] = v990;
  v1778[1] = &off_3F500;
  long long v1231 = xmmword_342C0;
  v991 = +[NSValue valueWithBytes:&v1231 objCType:"{CGPoint=dd}"];
  v1779[1] = v991;
  v1778[2] = &off_3F518;
  long long v1230 = xmmword_34620;
  v992 = +[NSValue valueWithBytes:&v1230 objCType:"{CGPoint=dd}"];
  v1779[2] = v992;
  v993 = +[NSDictionary dictionaryWithObjects:v1779 forKeys:v1778 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v993, -60.0, -36.5);
  qword_4D548 = v994;
  qword_4D550 = v995;

  v1776[0] = &off_3F4E8;
  long long v1229 = xmmword_346C0;
  v996 = +[NSValue valueWithBytes:&v1229 objCType:"{CGPoint=dd}"];
  v1777[0] = v996;
  v1776[1] = &off_3F500;
  long long v1228 = xmmword_34380;
  v997 = +[NSValue valueWithBytes:&v1228 objCType:"{CGPoint=dd}"];
  v1777[1] = v997;
  v1776[2] = &off_3F518;
  long long v1227 = xmmword_346D0;
  v998 = +[NSValue valueWithBytes:&v1227 objCType:"{CGPoint=dd}"];
  v1777[2] = v998;
  v999 = +[NSDictionary dictionaryWithObjects:v1777 forKeys:v1776 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v999, -43.5, -75.0);
  qword_4D558 = v1000;
  qword_4D560 = v1001;

  v1774[0] = &off_3F4E8;
  long long v1226 = xmmword_346E0;
  v1002 = +[NSValue valueWithBytes:&v1226 objCType:"{CGPoint=dd}"];
  v1775[0] = v1002;
  v1774[1] = &off_3F500;
  long long v1225 = xmmword_346F0;
  v1003 = +[NSValue valueWithBytes:&v1225 objCType:"{CGPoint=dd}"];
  v1775[1] = v1003;
  v1774[2] = &off_3F518;
  long long v1224 = xmmword_34700;
  v1004 = +[NSValue valueWithBytes:&v1224 objCType:"{CGPoint=dd}"];
  v1775[2] = v1004;
  v1005 = +[NSDictionary dictionaryWithObjects:v1775 forKeys:v1774 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1005, 1.5, -75.0);
  qword_4D568 = v1006;
  qword_4D570 = v1007;

  v1772[0] = &off_3F4E8;
  long long v1223 = xmmword_34480;
  v1008 = +[NSValue valueWithBytes:&v1223 objCType:"{CGPoint=dd}"];
  v1773[0] = v1008;
  v1772[1] = &off_3F500;
  long long v1222 = xmmword_34490;
  v1009 = +[NSValue valueWithBytes:&v1222 objCType:"{CGPoint=dd}"];
  v1773[1] = v1009;
  v1772[2] = &off_3F518;
  long long v1221 = xmmword_346B0;
  v1010 = +[NSValue valueWithBytes:&v1221 objCType:"{CGPoint=dd}"];
  v1773[2] = v1010;
  v1011 = +[NSDictionary dictionaryWithObjects:v1773 forKeys:v1772 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1011, 44.0, -75.0);
  qword_4D7B8 = v1012;
  qword_4D7C0 = v1013;

  v1770[0] = &off_3F4E8;
  long long v1220 = xmmword_344B0;
  v1014 = +[NSValue valueWithBytes:&v1220 objCType:"{CGPoint=dd}"];
  v1771[0] = v1014;
  v1770[1] = &off_3F500;
  long long v1219 = xmmword_33990;
  v1015 = +[NSValue valueWithBytes:&v1219 objCType:"{CGPoint=dd}"];
  v1771[1] = v1015;
  v1770[2] = &off_3F518;
  long long v1218 = xmmword_34710;
  v1016 = +[NSValue valueWithBytes:&v1218 objCType:"{CGPoint=dd}"];
  v1771[2] = v1016;
  v1017 = +[NSDictionary dictionaryWithObjects:v1771 forKeys:v1770 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1017, 61.0, -36.5);
  qword_4D7C8 = v1018;
  qword_4D7D0 = v1019;

  v1768[0] = &off_3F4E8;
  long long v1217 = xmmword_344D0;
  v1020 = +[NSValue valueWithBytes:&v1217 objCType:"{CGPoint=dd}"];
  v1769[0] = v1020;
  v1768[1] = &off_3F500;
  long long v1216 = xmmword_344E0;
  v1021 = +[NSValue valueWithBytes:&v1216 objCType:"{CGPoint=dd}"];
  v1769[1] = v1021;
  v1768[2] = &off_3F518;
  long long v1215 = xmmword_34720;
  v1022 = +[NSValue valueWithBytes:&v1215 objCType:"{CGPoint=dd}"];
  v1769[2] = v1022;
  v1023 = +[NSDictionary dictionaryWithObjects:v1769 forKeys:v1768 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1023, 61.0, -0.5);
  qword_4D7D8 = v1024;
  qword_4D7E0 = v1025;

  v1766[0] = &off_3F4E8;
  long long v1214 = xmmword_34500;
  v1026 = +[NSValue valueWithBytes:&v1214 objCType:"{CGPoint=dd}"];
  v1767[0] = v1026;
  v1766[1] = &off_3F500;
  long long v1213 = xmmword_34510;
  v1027 = +[NSValue valueWithBytes:&v1213 objCType:"{CGPoint=dd}"];
  v1767[1] = v1027;
  v1766[2] = &off_3F518;
  long long v1212 = xmmword_34730;
  v1028 = +[NSValue valueWithBytes:&v1212 objCType:"{CGPoint=dd}"];
  v1767[2] = v1028;
  v1029 = +[NSDictionary dictionaryWithObjects:v1767 forKeys:v1766 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1029, 60.5, 35.5);
  qword_4D7E8 = v1030;
  qword_4D7F0 = v1031;

  v1764[0] = &off_3F4E8;
  long long v1211 = xmmword_34530;
  v1032 = +[NSValue valueWithBytes:&v1211 objCType:"{CGPoint=dd}"];
  v1765[0] = v1032;
  v1764[1] = &off_3F500;
  long long v1210 = xmmword_34540;
  v1033 = +[NSValue valueWithBytes:&v1210 objCType:"{CGPoint=dd}"];
  v1765[1] = v1033;
  v1764[2] = &off_3F518;
  long long v1209 = xmmword_34740;
  v1034 = +[NSValue valueWithBytes:&v1209 objCType:"{CGPoint=dd}"];
  v1765[2] = v1034;
  v1035 = +[NSDictionary dictionaryWithObjects:v1765 forKeys:v1764 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1035, 44.5, 73.0);
  qword_4D7F8 = v1036;
  qword_4D800 = v1037;

  v1762[0] = &off_3F4E8;
  long long v1208 = xmmword_34560;
  v1038 = +[NSValue valueWithBytes:&v1208 objCType:"{CGPoint=dd}"];
  v1763[0] = v1038;
  v1762[1] = &off_3F500;
  long long v1207 = xmmword_34570;
  v1039 = +[NSValue valueWithBytes:&v1207 objCType:"{CGPoint=dd}"];
  v1763[1] = v1039;
  v1762[2] = &off_3F518;
  long long v1206 = xmmword_34750;
  v1040 = +[NSValue valueWithBytes:&v1206 objCType:"{CGPoint=dd}"];
  v1763[2] = v1040;
  v1041 = +[NSDictionary dictionaryWithObjects:v1763 forKeys:v1762 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1041, 1.0, 73.0);
  qword_4D808 = v1042;
  qword_4D810 = v1043;

  v1760[0] = &off_3F4E8;
  long long v1205 = xmmword_34590;
  v1044 = +[NSValue valueWithBytes:&v1205 objCType:"{CGPoint=dd}"];
  v1761[0] = v1044;
  v1760[1] = &off_3F500;
  long long v1204 = xmmword_345A0;
  v1045 = +[NSValue valueWithBytes:&v1204 objCType:"{CGPoint=dd}"];
  v1761[1] = v1045;
  v1760[2] = &off_3F518;
  long long v1203 = xmmword_34760;
  v1046 = +[NSValue valueWithBytes:&v1203 objCType:"{CGPoint=dd}"];
  v1761[2] = v1046;
  v1047 = +[NSDictionary dictionaryWithObjects:v1761 forKeys:v1760 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1047, -43.0, 73.0);
  qword_4D818 = v1048;
  qword_4D820 = v1049;

  v1758[0] = &off_3F4E8;
  long long v1202 = xmmword_345C0;
  v1050 = +[NSValue valueWithBytes:&v1202 objCType:"{CGPoint=dd}"];
  v1759[0] = v1050;
  v1758[1] = &off_3F500;
  long long v1201 = xmmword_345D0;
  v1051 = +[NSValue valueWithBytes:&v1201 objCType:"{CGPoint=dd}"];
  v1759[1] = v1051;
  v1758[2] = &off_3F518;
  long long v1200 = xmmword_34770;
  v1052 = +[NSValue valueWithBytes:&v1200 objCType:"{CGPoint=dd}"];
  v1759[2] = v1052;
  v1053 = +[NSDictionary dictionaryWithObjects:v1759 forKeys:v1758 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1053, -60.0, 36.5);
  qword_4D828 = v1054;
  qword_4D830 = v1055;

  v1756[0] = &off_3F4E8;
  long long v1199 = xmmword_345E0;
  v1056 = +[NSValue valueWithBytes:&v1199 objCType:"{CGPoint=dd}"];
  v1757[0] = v1056;
  v1756[1] = &off_3F500;
  long long v1198 = xmmword_345F0;
  v1057 = +[NSValue valueWithBytes:&v1198 objCType:"{CGPoint=dd}"];
  v1757[1] = v1057;
  v1756[2] = &off_3F518;
  long long v1197 = xmmword_34780;
  v1058 = +[NSValue valueWithBytes:&v1197 objCType:"{CGPoint=dd}"];
  v1757[2] = v1058;
  v1059 = +[NSDictionary dictionaryWithObjects:v1757 forKeys:v1756 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1059, -59.5, -0.5);
  qword_4D838 = v1060;
  qword_4D840 = v1061;

  v1754[0] = &off_3F4E8;
  long long v1196 = xmmword_34610;
  v1062 = +[NSValue valueWithBytes:&v1196 objCType:"{CGPoint=dd}"];
  v1755[0] = v1062;
  v1754[1] = &off_3F500;
  long long v1195 = xmmword_342C0;
  v1063 = +[NSValue valueWithBytes:&v1195 objCType:"{CGPoint=dd}"];
  v1755[1] = v1063;
  v1754[2] = &off_3F518;
  long long v1194 = xmmword_34790;
  v1064 = +[NSValue valueWithBytes:&v1194 objCType:"{CGPoint=dd}"];
  v1755[2] = v1064;
  v1065 = +[NSDictionary dictionaryWithObjects:v1755 forKeys:v1754 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1065, -60.0, -36.5);
  qword_4D848 = v1066;
  qword_4D850 = v1067;

  v1752[0] = &off_3F4E8;
  long long v1193 = xmmword_34630;
  v1068 = +[NSValue valueWithBytes:&v1193 objCType:"{CGPoint=dd}"];
  v1753[0] = v1068;
  v1752[1] = &off_3F500;
  long long v1192 = xmmword_34640;
  v1069 = +[NSValue valueWithBytes:&v1192 objCType:"{CGPoint=dd}"];
  v1753[1] = v1069;
  v1752[2] = &off_3F518;
  long long v1191 = xmmword_346D0;
  v1070 = +[NSValue valueWithBytes:&v1191 objCType:"{CGPoint=dd}"];
  v1753[2] = v1070;
  v1071 = +[NSDictionary dictionaryWithObjects:v1753 forKeys:v1752 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1071, -43.5, -75.0);
  qword_4D858 = v1072;
  qword_4D860 = v1073;

  v1750[0] = &off_3F4E8;
  long long v1190 = xmmword_34660;
  v1074 = +[NSValue valueWithBytes:&v1190 objCType:"{CGPoint=dd}"];
  v1751[0] = v1074;
  v1750[1] = &off_3F500;
  long long v1189 = xmmword_34670;
  v1075 = +[NSValue valueWithBytes:&v1189 objCType:"{CGPoint=dd}"];
  v1751[1] = v1075;
  v1750[2] = &off_3F518;
  long long v1188 = xmmword_34700;
  v1076 = +[NSValue valueWithBytes:&v1188 objCType:"{CGPoint=dd}"];
  v1751[2] = v1076;
  v1077 = +[NSDictionary dictionaryWithObjects:v1751 forKeys:v1750 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1077, 1.5, -75.0);
  qword_4D868 = v1078;
  qword_4D870 = v1079;

  v1748[0] = &off_3F4E8;
  long long v1187 = xmmword_34480;
  v1080 = +[NSValue valueWithBytes:&v1187 objCType:"{CGPoint=dd}"];
  v1749[0] = v1080;
  v1748[1] = &off_3F500;
  long long v1186 = xmmword_34490;
  v1081 = +[NSValue valueWithBytes:&v1186 objCType:"{CGPoint=dd}"];
  v1749[1] = v1081;
  v1748[2] = &off_3F518;
  long long v1185 = xmmword_346B0;
  v1082 = +[NSValue valueWithBytes:&v1185 objCType:"{CGPoint=dd}"];
  v1749[2] = v1082;
  v1083 = +[NSDictionary dictionaryWithObjects:v1749 forKeys:v1748 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1083, 44.0, -75.0);
  qword_4DAB8 = v1084;
  qword_4DAC0 = v1085;

  v1746[0] = &off_3F4E8;
  long long v1184 = xmmword_344B0;
  v1086 = +[NSValue valueWithBytes:&v1184 objCType:"{CGPoint=dd}"];
  v1747[0] = v1086;
  v1746[1] = &off_3F500;
  long long v1183 = xmmword_33990;
  v1087 = +[NSValue valueWithBytes:&v1183 objCType:"{CGPoint=dd}"];
  v1747[1] = v1087;
  v1746[2] = &off_3F518;
  long long v1182 = xmmword_34710;
  v1088 = +[NSValue valueWithBytes:&v1182 objCType:"{CGPoint=dd}"];
  v1747[2] = v1088;
  v1089 = +[NSDictionary dictionaryWithObjects:v1747 forKeys:v1746 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1089, 61.0, -36.5);
  qword_4DAC8 = v1090;
  qword_4DAD0 = v1091;

  v1744[0] = &off_3F4E8;
  long long v1181 = xmmword_344D0;
  v1092 = +[NSValue valueWithBytes:&v1181 objCType:"{CGPoint=dd}"];
  v1745[0] = v1092;
  v1744[1] = &off_3F500;
  long long v1180 = xmmword_344E0;
  v1093 = +[NSValue valueWithBytes:&v1180 objCType:"{CGPoint=dd}"];
  v1745[1] = v1093;
  v1744[2] = &off_3F518;
  long long v1179 = xmmword_34720;
  v1094 = +[NSValue valueWithBytes:&v1179 objCType:"{CGPoint=dd}"];
  v1745[2] = v1094;
  v1095 = +[NSDictionary dictionaryWithObjects:v1745 forKeys:v1744 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1095, 61.0, -0.5);
  qword_4DAD8 = v1096;
  qword_4DAE0 = v1097;

  v1742[0] = &off_3F4E8;
  long long v1178 = xmmword_34500;
  v1098 = +[NSValue valueWithBytes:&v1178 objCType:"{CGPoint=dd}"];
  v1743[0] = v1098;
  v1742[1] = &off_3F500;
  long long v1177 = xmmword_34510;
  v1099 = +[NSValue valueWithBytes:&v1177 objCType:"{CGPoint=dd}"];
  v1743[1] = v1099;
  v1742[2] = &off_3F518;
  long long v1176 = xmmword_34730;
  v1100 = +[NSValue valueWithBytes:&v1176 objCType:"{CGPoint=dd}"];
  v1743[2] = v1100;
  v1101 = +[NSDictionary dictionaryWithObjects:v1743 forKeys:v1742 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1101, 60.5, 35.5);
  qword_4DAE8 = v1102;
  qword_4DAF0 = v1103;

  v1740[0] = &off_3F4E8;
  long long v1175 = xmmword_34530;
  v1104 = +[NSValue valueWithBytes:&v1175 objCType:"{CGPoint=dd}"];
  v1741[0] = v1104;
  v1740[1] = &off_3F500;
  long long v1174 = xmmword_34540;
  v1105 = +[NSValue valueWithBytes:&v1174 objCType:"{CGPoint=dd}"];
  v1741[1] = v1105;
  v1740[2] = &off_3F518;
  long long v1173 = xmmword_34740;
  v1106 = +[NSValue valueWithBytes:&v1173 objCType:"{CGPoint=dd}"];
  v1741[2] = v1106;
  v1107 = +[NSDictionary dictionaryWithObjects:v1741 forKeys:v1740 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1107, 44.5, 73.0);
  qword_4DAF8 = v1108;
  qword_4DB00 = v1109;

  v1738[0] = &off_3F4E8;
  long long v1172 = xmmword_34560;
  v1110 = +[NSValue valueWithBytes:&v1172 objCType:"{CGPoint=dd}"];
  v1739[0] = v1110;
  v1738[1] = &off_3F500;
  long long v1171 = xmmword_34570;
  v1111 = +[NSValue valueWithBytes:&v1171 objCType:"{CGPoint=dd}"];
  v1739[1] = v1111;
  v1738[2] = &off_3F518;
  long long v1170 = xmmword_34750;
  v1112 = +[NSValue valueWithBytes:&v1170 objCType:"{CGPoint=dd}"];
  v1739[2] = v1112;
  v1113 = +[NSDictionary dictionaryWithObjects:v1739 forKeys:v1738 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1113, 1.0, 73.0);
  qword_4DB08 = v1114;
  qword_4DB10 = v1115;

  v1736[0] = &off_3F4E8;
  long long v1169 = xmmword_34590;
  v1116 = +[NSValue valueWithBytes:&v1169 objCType:"{CGPoint=dd}"];
  v1737[0] = v1116;
  v1736[1] = &off_3F500;
  long long v1168 = xmmword_345A0;
  v1117 = +[NSValue valueWithBytes:&v1168 objCType:"{CGPoint=dd}"];
  v1737[1] = v1117;
  v1736[2] = &off_3F518;
  long long v1167 = xmmword_34760;
  v1118 = +[NSValue valueWithBytes:&v1167 objCType:"{CGPoint=dd}"];
  v1737[2] = v1118;
  v1119 = +[NSDictionary dictionaryWithObjects:v1737 forKeys:v1736 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1119, -43.0, 73.0);
  qword_4DB18 = v1120;
  qword_4DB20 = v1121;

  v1734[0] = &off_3F4E8;
  long long v1166 = xmmword_345C0;
  v1122 = +[NSValue valueWithBytes:&v1166 objCType:"{CGPoint=dd}"];
  v1735[0] = v1122;
  v1734[1] = &off_3F500;
  long long v1165 = xmmword_345D0;
  v1123 = +[NSValue valueWithBytes:&v1165 objCType:"{CGPoint=dd}"];
  v1735[1] = v1123;
  v1734[2] = &off_3F518;
  long long v1164 = xmmword_34770;
  v1124 = +[NSValue valueWithBytes:&v1164 objCType:"{CGPoint=dd}"];
  v1735[2] = v1124;
  v1125 = +[NSDictionary dictionaryWithObjects:v1735 forKeys:v1734 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1125, -60.0, 36.5);
  qword_4DB28 = v1126;
  qword_4DB30 = v1127;

  v1732[0] = &off_3F4E8;
  long long v1163 = xmmword_345E0;
  v1128 = +[NSValue valueWithBytes:&v1163 objCType:"{CGPoint=dd}"];
  v1733[0] = v1128;
  v1732[1] = &off_3F500;
  long long v1162 = xmmword_345F0;
  v1129 = +[NSValue valueWithBytes:&v1162 objCType:"{CGPoint=dd}"];
  v1733[1] = v1129;
  v1732[2] = &off_3F518;
  long long v1161 = xmmword_34780;
  v1130 = +[NSValue valueWithBytes:&v1161 objCType:"{CGPoint=dd}"];
  v1733[2] = v1130;
  v1131 = +[NSDictionary dictionaryWithObjects:v1733 forKeys:v1732 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1131, -59.5, -0.5);
  qword_4DB38 = v1132;
  qword_4DB40 = v1133;

  v1730[0] = &off_3F4E8;
  long long v1160 = xmmword_34610;
  v1134 = +[NSValue valueWithBytes:&v1160 objCType:"{CGPoint=dd}"];
  v1731[0] = v1134;
  v1730[1] = &off_3F500;
  long long v1159 = xmmword_342C0;
  v1135 = +[NSValue valueWithBytes:&v1159 objCType:"{CGPoint=dd}"];
  v1731[1] = v1135;
  v1730[2] = &off_3F518;
  long long v1158 = xmmword_34790;
  v1136 = +[NSValue valueWithBytes:&v1158 objCType:"{CGPoint=dd}"];
  v1731[2] = v1136;
  v1137 = +[NSDictionary dictionaryWithObjects:v1731 forKeys:v1730 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1137, -60.0, -36.5);
  qword_4DB48 = v1138;
  qword_4DB50 = v1139;

  v1728[0] = &off_3F4E8;
  long long v1157 = xmmword_34630;
  v1140 = +[NSValue valueWithBytes:&v1157 objCType:"{CGPoint=dd}"];
  v1729[0] = v1140;
  v1728[1] = &off_3F500;
  long long v1156 = xmmword_34640;
  v1141 = +[NSValue valueWithBytes:&v1156 objCType:"{CGPoint=dd}"];
  v1729[1] = v1141;
  v1728[2] = &off_3F518;
  long long v1155 = xmmword_346D0;
  v1142 = +[NSValue valueWithBytes:&v1155 objCType:"{CGPoint=dd}"];
  v1729[2] = v1142;
  v1143 = +[NSDictionary dictionaryWithObjects:v1729 forKeys:v1728 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1143, -43.5, -75.0);
  qword_4DB58 = v1144;
  qword_4DB60 = v1145;

  v1726[0] = &off_3F4E8;
  long long v1154 = xmmword_34660;
  v1146 = +[NSValue valueWithBytes:&v1154 objCType:"{CGPoint=dd}"];
  v1727[0] = v1146;
  v1726[1] = &off_3F500;
  long long v1153 = xmmword_34670;
  v1147 = +[NSValue valueWithBytes:&v1153 objCType:"{CGPoint=dd}"];
  v1727[1] = v1147;
  v1726[2] = &off_3F518;
  long long v1152 = xmmword_34700;
  v1148 = +[NSValue valueWithBytes:&v1152 objCType:"{CGPoint=dd}"];
  v1727[2] = v1148;
  v1149 = +[NSDictionary dictionaryWithObjects:v1727 forKeys:v1726 count:3];
  objc_msgSend(v1, "scaledPoint:withOverrides:", v1149, 1.5, -75.0);
  qword_4DB68 = v1150;
  qword_4DB70 = v1151;
}

void sub_29100(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4DBD0);
  id WeakRetained = objc_loadWeakRetained(&qword_4DBD8);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_4DBD8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_4DBE0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_4DBD8, obj);
  qword_4DBE0 = (uint64_t)[obj version];

  sub_2A780(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4DBD0);
  long long v10 = *(_OWORD *)&qword_4DBA0;
  *a2 = xmmword_4DB90;
  a2[1] = v10;
  long long v11 = *(_OWORD *)&qword_4DBC0;
  a2[2] = xmmword_4DBB0;
  a2[3] = v11;
}

id sub_2A138(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
}

void sub_2A4D0(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  uint64_t v2 = [v5 display];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    uint64_t v4 = [v5 display];
    [v4 updateMonochromeColor];
  }
}

void sub_2A5EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v4 = [v7 display];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [v7 display];
    [v6 applyPalette:*(void *)(a1 + 32)];
  }
}

void sub_2A780(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v5 = v4;

  *(void *)&xmmword_4DB90 = v5;
  [v3 scaledValue:3 withOverride:21.5 forSizeClass:28.0];
  *((void *)&xmmword_4DB90 + 1) = v6;
  v25[0] = &off_3F530;
  id v7 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 58.0, 60.0);
  v25[1] = &off_3F548;
  v26[0] = v7;
  id v8 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 70.0, 74.5);
  v26[1] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
  objc_msgSend(v3, "scaledSize:withOverrides:", v9, 58.0, 57.5);
  qword_4DBA0 = v10;
  unk_4DBA8 = v11;

  v23[0] = &off_3F530;
  uint64_t v12 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 184.0, 224.0);
  v24[0] = v12;
  v23[1] = &off_3F560;
  uint64_t v13 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 175.0, 213.0);
  v24[1] = v13;
  v23[2] = &off_3F578;
  id v14 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 194.0, 236.0);
  v24[2] = v14;
  CGFloat v15 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  objc_msgSend(v3, "scaledSize:withOverrides:", v15, 162.0, 197.0);
  *(void *)&xmmword_4DBB0 = v16;
  *((void *)&xmmword_4DBB0 + 1) = v17;

  v21[0] = &off_3F530;
  v21[1] = &off_3F560;
  v22[0] = &off_3FE58;
  v22[1] = &off_3FE68;
  void v21[2] = &off_3F578;
  v22[2] = &off_3FE58;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  [v3 scaledValue:v18 withOverrides:2.0];
  qword_4DBC0 = v19;

  [v3 scaledValue:6 withOverride:0.0 forSizeClass:-2.0];
  qword_4DBC8 = v20;
}

void sub_2B35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id duotone(uint64_t a1, uint64_t a2)
{
  return +[NTKPigmentEditOption duotoneNameWithName:a1 otherName:a2];
}

void sub_2B390(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 pigmentEditOption];
  id v8 = [v7 identifier];
  unsigned int v9 = [v6 containsObject:v8];

  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 integerValue];
  }
}

id NTKZeusAnalogColorPaletteCreateGradientImage(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a3;
  id v12 = a2;
  v27.width = a4;
  v27.height = a5;
  UIGraphicsBeginImageContextWithOptions(v27, 0, a6);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v14 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  uint64_t v15 = a1 - 2;
  if ((unint64_t)(a1 - 2) > 3)
  {
    CGFloat v17 = 0.499;
    CGFloat v16 = 0.501;
  }
  else
  {
    CGFloat v16 = dbl_348E8[v15];
    CGFloat v17 = dbl_34908[v15];
  }
  locations[0] = 0.0;
  locations[1] = v17;
  locations[2] = v16;
  locations[3] = 1.0;
  [v12 getRed:components green:&components[1] blue:v22 alpha:(char *)v22 + 8];

  [v11 getRed:&v23 green:(char *)&v23 + 8 blue:v24 alpha:(char *)v24 + 8];
  v22[1] = *(_OWORD *)components;
  v22[2] = v22[0];
  v24[1] = v23;
  v24[2] = v24[0];
  uint64_t v18 = CGGradientCreateWithColorComponents(v14, components, locations, 4uLL);
  v28.x = 0.0;
  v28.y = 0.0;
  v29.y = 0.0;
  v29.x = a4;
  CGContextDrawLinearGradient(CurrentContext, v18, v28, v29, 0);
  uint64_t v19 = UIGraphicsGetImageFromCurrentImageContext();
  CGGradientRelease(v18);
  CGColorSpaceRelease(v14);
  UIGraphicsEndImageContext();

  return v19;
}

uint64_t sub_2BC70(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void sub_2BC84(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return _CGColorSpaceCreateDeviceGray();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextRelease(CGContextRef c)
{
}

uint64_t CGContextSetCTM()
{
  return _CGContextSetCTM();
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return _CGGradientCreateWithColorComponents(space, components, locations, count);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t CLKAddPoints()
{
  return _CLKAddPoints();
}

uint64_t CLKCeilForDevice()
{
  return _CLKCeilForDevice();
}

uint64_t CLKClockTimerDateForDate()
{
  return _CLKClockTimerDateForDate();
}

uint64_t CLKClockTimerDateForNow()
{
  return _CLKClockTimerDateForNow();
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKContrastRatioForColors()
{
  return _CLKContrastRatioForColors();
}

uint64_t CLKDegreesToRadians()
{
  return _CLKDegreesToRadians();
}

uint64_t CLKInterpolateBetweenColors()
{
  return _CLKInterpolateBetweenColors();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenPoints()
{
  return _CLKInterpolateBetweenPoints();
}

uint64_t CLKInterpolateBetweenRects()
{
  return _CLKInterpolateBetweenRects();
}

uint64_t CLKInterpolateBetweenTransform()
{
  return _CLKInterpolateBetweenTransform();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return _CLKRectCenteredIntegralRectForDevice();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t CLKRectEqualsRect()
{
  return _CLKRectEqualsRect();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKRectIntegralForDevice()
{
  return _CLKRectIntegralForDevice();
}

uint64_t CLKSizeCenteredAboutPointForDevice()
{
  return _CLKSizeCenteredAboutPointForDevice();
}

uint64_t CLKUICompareColorsByLightness()
{
  return _CLKUICompareColorsByLightness();
}

uint64_t CLKValueForDeviceMetrics()
{
  return _CLKValueForDeviceMetrics();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

uint64_t NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues()
{
  return _NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
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

uint64_t NTKNameForDuotones()
{
  return _NTKNameForDuotones();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKShowHardwareSpecificFaces()
{
  return _NTKShowHardwareSpecificFaces();
}

uint64_t NTKSwatchTwoColorGradientImage()
{
  return _NTKSwatchTwoColorGradientImage();
}

uint64_t NTKWhistlerSubdialComplicationContentDiameter()
{
  return _NTKWhistlerSubdialComplicationContentDiameter();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

uint64_t NUNIRenderedMoonImage()
{
  return _NUNIRenderedMoonImage();
}

uint64_t TextToFourCharCode()
{
  return _TextToFourCharCode();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend__applyBreathingAndRubberbanding(void *a1, const char *a2, ...)
{
  return [a1 _applyBreathingAndRubberbanding];
}

id objc_msgSend__cornerImage(void *a1, const char *a2, ...)
{
  return [a1 _cornerImage];
}

id objc_msgSend__createDigits(void *a1, const char *a2, ...)
{
  return [a1 _createDigits];
}

id objc_msgSend__createLabel(void *a1, const char *a2, ...)
{
  return [a1 _createLabel];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__filledDigitLayers(void *a1, const char *a2, ...)
{
  return [a1 _filledDigitLayers];
}

id objc_msgSend__firstLineBaselineFrameOriginY(void *a1, const char *a2, ...)
{
  return [a1 _firstLineBaselineFrameOriginY];
}

id objc_msgSend__layoutLogo(void *a1, const char *a2, ...)
{
  return [a1 _layoutLogo];
}

id objc_msgSend__loadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _loadActiveViews];
}

id objc_msgSend__loadBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _loadBackgroundView];
}

id objc_msgSend__loadCommonViews(void *a1, const char *a2, ...)
{
  return [a1 _loadCommonViews];
}

id objc_msgSend__loadCornerOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _loadCornerOverlayView];
}

id objc_msgSend__loadImages(void *a1, const char *a2, ...)
{
  return [a1 _loadImages];
}

id objc_msgSend__loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 _loadLayoutRules];
}

id objc_msgSend__loadLogoImageView(void *a1, const char *a2, ...)
{
  return [a1 _loadLogoImageView];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__lowerComplicationFrame(void *a1, const char *a2, ...)
{
  return [a1 _lowerComplicationFrame];
}

id objc_msgSend__lowerComplicationVerticalOffset(void *a1, const char *a2, ...)
{
  return [a1 _lowerComplicationVerticalOffset];
}

id objc_msgSend__outlinedDigitLayers(void *a1, const char *a2, ...)
{
  return [a1 _outlinedDigitLayers];
}

id objc_msgSend__removeListeners(void *a1, const char *a2, ...)
{
  return [a1 _removeListeners];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__renderMoon(void *a1, const char *a2, ...)
{
  return [a1 _renderMoon];
}

id objc_msgSend__setupListeners(void *a1, const char *a2, ...)
{
  return [a1 _setupListeners];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__startHourUpdate(void *a1, const char *a2, ...)
{
  return [a1 _startHourUpdate];
}

id objc_msgSend__startMinuteUpdate(void *a1, const char *a2, ...)
{
  return [a1 _startMinuteUpdate];
}

id objc_msgSend__startSecondUpdate(void *a1, const char *a2, ...)
{
  return [a1 _startSecondUpdate];
}

id objc_msgSend__startSubsecondUpdate(void *a1, const char *a2, ...)
{
  return [a1 _startSubsecondUpdate];
}

id objc_msgSend__stopHourUpdate(void *a1, const char *a2, ...)
{
  return [a1 _stopHourUpdate];
}

id objc_msgSend__stopTimerUpdate(void *a1, const char *a2, ...)
{
  return [a1 _stopTimerUpdate];
}

id objc_msgSend__supportedComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 _supportedComplicationSlots];
}

id objc_msgSend__unloadActiveViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadActiveViews];
}

id objc_msgSend__unloadBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _unloadBackgroundView];
}

id objc_msgSend__unloadCommonViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadCommonViews];
}

id objc_msgSend__unloadCornerOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _unloadCornerOverlayView];
}

id objc_msgSend__unloadLogoImageView(void *a1, const char *a2, ...)
{
  return [a1 _unloadLogoImageView];
}

id objc_msgSend__updateAsset(void *a1, const char *a2, ...)
{
  return [a1 _updateAsset];
}

id objc_msgSend__updateColor(void *a1, const char *a2, ...)
{
  return [a1 _updateColor];
}

id objc_msgSend__updateCorners(void *a1, const char *a2, ...)
{
  return [a1 _updateCorners];
}

id objc_msgSend__updateFaceViewForDateComplicationVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateFaceViewForDateComplicationVisibility];
}

id objc_msgSend__updateFramerate(void *a1, const char *a2, ...)
{
  return [a1 _updateFramerate];
}

id objc_msgSend__updateHour(void *a1, const char *a2, ...)
{
  return [a1 _updateHour];
}

id objc_msgSend__updateImages(void *a1, const char *a2, ...)
{
  return [a1 _updateImages];
}

id objc_msgSend__updateLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateLabel];
}

id objc_msgSend__updateLabels(void *a1, const char *a2, ...)
{
  return [a1 _updateLabels];
}

id objc_msgSend__updatePalette(void *a1, const char *a2, ...)
{
  return [a1 _updatePalette];
}

id objc_msgSend__updateStyle(void *a1, const char *a2, ...)
{
  return [a1 _updateStyle];
}

id objc_msgSend__updateText(void *a1, const char *a2, ...)
{
  return [a1 _updateText];
}

id objc_msgSend__value(void *a1, const char *a2, ...)
{
  return [a1 _value];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_alternateComplication(void *a1, const char *a2, ...)
{
  return [a1 alternateComplication];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_apple(void *a1, const char *a2, ...)
{
  return [a1 apple];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_beginEditing(void *a1, const char *a2, ...)
{
  return [a1 beginEditing];
}

id objc_msgSend_beige(void *a1, const char *a2, ...)
{
  return [a1 beige];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bleed(void *a1, const char *a2, ...)
{
  return [a1 bleed];
}

id objc_msgSend_bottomComplication(void *a1, const char *a2, ...)
{
  return [a1 bottomComplication];
}

id objc_msgSend_bottomComplicationBackground(void *a1, const char *a2, ...)
{
  return [a1 bottomComplicationBackground];
}

id objc_msgSend_bottomComplicationBackgroundStroke(void *a1, const char *a2, ...)
{
  return [a1 bottomComplicationBackgroundStroke];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_capeCodFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 capeCodFontDescriptor];
}

id objc_msgSend_carrickFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 carrickFontDescriptor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clipperFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 clipperFontDescriptor];
}

id objc_msgSend_collectionName(void *a1, const char *a2, ...)
{
  return [a1 collectionName];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
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

id objc_msgSend_complicationDate(void *a1, const char *a2, ...)
{
  return [a1 complicationDate];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentFrame(void *a1, const char *a2, ...)
{
  return [a1 contentFrame];
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

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayDate];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return [a1 darkGrayColor];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_dateComplicationBackground(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationBackground];
}

id objc_msgSend_dateComplicationBackgroundStroke(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationBackgroundStroke];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return [a1 defaultParagraphStyle];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_density(void *a1, const char *a2, ...)
{
  return [a1 density];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dial(void *a1, const char *a2, ...)
{
  return [a1 dial];
}

id objc_msgSend_dialColor(void *a1, const char *a2, ...)
{
  return [a1 dialColor];
}

id objc_msgSend_dialComplicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 dialComplicationContainerView];
}

id objc_msgSend_dialWidth(void *a1, const char *a2, ...)
{
  return [a1 dialWidth];
}

id objc_msgSend_digitsColor(void *a1, const char *a2, ...)
{
  return [a1 digitsColor];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editMode(void *a1, const char *a2, ...)
{
  return [a1 editMode];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return [a1 endEditing];
}

id objc_msgSend_espaceFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 espaceFontDescriptor];
}

id objc_msgSend_faceStyle(void *a1, const char *a2, ...)
{
  return [a1 faceStyle];
}

id objc_msgSend_faceTapControl(void *a1, const char *a2, ...)
{
  return [a1 faceTapControl];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_faceViewWantsComplicationKeylineFramesReloaded(void *a1, const char *a2, ...)
{
  return [a1 faceViewWantsComplicationKeylineFramesReloaded];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return [a1 finalize];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromEditMode(void *a1, const char *a2, ...)
{
  return [a1 fromEditMode];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_handColor(void *a1, const char *a2, ...)
{
  return [a1 handColor];
}

id objc_msgSend_handInlay(void *a1, const char *a2, ...)
{
  return [a1 handInlay];
}

id objc_msgSend_handInlayColor(void *a1, const char *a2, ...)
{
  return [a1 handInlayColor];
}

id objc_msgSend_handStroke(void *a1, const char *a2, ...)
{
  return [a1 handStroke];
}

id objc_msgSend_horse(void *a1, const char *a2, ...)
{
  return [a1 horse];
}

id objc_msgSend_horseEye(void *a1, const char *a2, ...)
{
  return [a1 horseEye];
}

id objc_msgSend_horseHair(void *a1, const char *a2, ...)
{
  return [a1 horseHair];
}

id objc_msgSend_horseshoe(void *a1, const char *a2, ...)
{
  return [a1 horseshoe];
}

id objc_msgSend_horseshoeHoles(void *a1, const char *a2, ...)
{
  return [a1 horseshoeHoles];
}

id objc_msgSend_hourHand(void *a1, const char *a2, ...)
{
  return [a1 hourHand];
}

id objc_msgSend_hourHandColor(void *a1, const char *a2, ...)
{
  return [a1 hourHandColor];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_hourMinuteHandInlay(void *a1, const char *a2, ...)
{
  return [a1 hourMinuteHandInlay];
}

id objc_msgSend_hourMinuteHandStroke(void *a1, const char *a2, ...)
{
  return [a1 hourMinuteHandStroke];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_innerDialBackground(void *a1, const char *a2, ...)
{
  return [a1 innerDialBackground];
}

id objc_msgSend_innerDialBackgroundBorder(void *a1, const char *a2, ...)
{
  return [a1 innerDialBackgroundBorder];
}

id objc_msgSend_innerDialBorderWidth(void *a1, const char *a2, ...)
{
  return [a1 innerDialBorderWidth];
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

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_isBlackColor(void *a1, const char *a2, ...)
{
  return [a1 isBlackColor];
}

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isExplorer(void *a1, const char *a2, ...)
{
  return [a1 isExplorer];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isGradientStyle(void *a1, const char *a2, ...)
{
  return [a1 isGradientStyle];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isNoir(void *a1, const char *a2, ...)
{
  return [a1 isNoir];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_isZeusBlack(void *a1, const char *a2, ...)
{
  return [a1 isZeusBlack];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutComplicationViews(void *a1, const char *a2, ...)
{
  return [a1 layoutComplicationViews];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_logo(void *a1, const char *a2, ...)
{
  return [a1 logo];
}

id objc_msgSend_logoColor(void *a1, const char *a2, ...)
{
  return [a1 logoColor];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_minuteHand(void *a1, const char *a2, ...)
{
  return [a1 minuteHand];
}

id objc_msgSend_minuteHandColor(void *a1, const char *a2, ...)
{
  return [a1 minuteHandColor];
}

id objc_msgSend_minuteHandDot(void *a1, const char *a2, ...)
{
  return [a1 minuteHandDot];
}

id objc_msgSend_minuteHandDotColor(void *a1, const char *a2, ...)
{
  return [a1 minuteHandDotColor];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_nrDeviceVersion(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceVersion];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numbers(void *a1, const char *a2, ...)
{
  return [a1 numbers];
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return [a1 orangeColor];
}

id objc_msgSend_outerDialBackground(void *a1, const char *a2, ...)
{
  return [a1 outerDialBackground];
}

id objc_msgSend_outerDialBackgroundBorder(void *a1, const char *a2, ...)
{
  return [a1 outerDialBackgroundBorder];
}

id objc_msgSend_outerDialBorderWidth(void *a1, const char *a2, ...)
{
  return [a1 outerDialBorderWidth];
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

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_primaryComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 primaryComplicationColor];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandAlpha(void *a1, const char *a2, ...)
{
  return [a1 secondHandAlpha];
}

id objc_msgSend_secondHandColor(void *a1, const char *a2, ...)
{
  return [a1 secondHandColor];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondaryComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryComplicationColor];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_silver(void *a1, const char *a2, ...)
{
  return [a1 silver];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_splitBackground(void *a1, const char *a2, ...)
{
  return [a1 splitBackground];
}

id objc_msgSend_splitColor(void *a1, const char *a2, ...)
{
  return [a1 splitColor];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_swatchImageCache(void *a1, const char *a2, ...)
{
  return [a1 swatchImageCache];
}

id objc_msgSend_swatchStyle(void *a1, const char *a2, ...)
{
  return [a1 swatchStyle];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
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

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_tritiumPalette(void *a1, const char *a2, ...)
{
  return [a1 tritiumPalette];
}

id objc_msgSend_typefaceSwatch(void *a1, const char *a2, ...)
{
  return [a1 typefaceSwatch];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return [a1 uniqueId];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_wantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 wantsStatusBarIconShadow];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_zRotation(void *a1, const char *a2, ...)
{
  return [a1 zRotation];
}

id objc_msgSend_zeusCollectionName(void *a1, const char *a2, ...)
{
  return [a1 zeusCollectionName];
}