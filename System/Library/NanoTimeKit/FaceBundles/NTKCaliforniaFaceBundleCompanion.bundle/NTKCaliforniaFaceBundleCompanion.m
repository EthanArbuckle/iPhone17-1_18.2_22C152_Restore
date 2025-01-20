void sub_1A34(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t vars8;

  v9 = a2;
  v2 = _EnumValueRange();
  v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"157666B2-886F-4DBB-BFEE-669DE191D8BB"];
  v4 = [v9 supportsCapability:v3];

  if (v4)
  {
    v5 = [v2 arrayByAddingObject:&off_1AA80];

    v2 = (void *)v5;
  }
  if (NTKShowIndicScriptNumerals())
  {
    v6 = +[NTKCaliforniaStyleEditOption _orderedIndicNumeralsEditOptionsForDevice:v9];
    v7 = [v2 arrayByAddingObjectsFromArray:v6];

    v2 = (void *)v7;
  }
  v8 = (void *)qword_1F080;
  qword_1F080 = (uint64_t)v2;
}

void sub_20E4(id a1)
{
  v3[0] = &off_1AA98;
  v3[1] = &off_1AAB0;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_1AAC8;
  v3[3] = &off_1AAE0;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_1AAF8;
  v3[5] = &off_1AB10;
  v4[4] = NTKFaceBundleStyle5;
  v4[5] = NTKFaceBundleStyle6;
  v3[6] = &off_1AB28;
  v3[7] = &off_1AA80;
  v4[6] = NTKFaceBundleStyle7;
  v4[7] = NTKFaceBundleStyle8;
  v3[8] = &off_1AB40;
  v3[9] = &off_1AB58;
  v4[8] = NTKFaceBundleStyle9;
  v4[9] = NTKFaceBundleStyle10;
  v3[10] = &off_1AB70;
  v3[11] = &off_1AB88;
  v4[10] = NTKFaceBundleStyle11;
  v4[11] = NTKFaceBundleStyle12;
  v3[12] = &off_1ABA0;
  v3[13] = &off_1ABB8;
  v4[12] = NTKFaceBundleStyle13;
  v4[13] = NTKFaceBundleStyle14;
  v3[14] = &off_1ABD0;
  v3[15] = &off_1ABE8;
  v4[14] = NTKFaceBundleStyle15;
  v4[15] = NTKFaceBundleStyle16;
  v3[16] = &off_1AC00;
  v3[17] = &off_1AC18;
  v4[16] = NTKFaceBundleStyle17;
  v4[17] = NTKFaceBundleStyle18;
  v3[18] = &off_1AC30;
  v3[19] = &off_1AC48;
  v4[18] = NTKFaceBundleStyle19;
  v4[19] = NTKFaceBundleStyle20;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:20];
  v2 = (void *)qword_1F0A0;
  qword_1F0A0 = v1;
}

void sub_2B00(id a1)
{
  qword_1F0B0 = objc_alloc_init(NTKCaliforniaFaceComplicationDescriptor);

  _objc_release_x1();
}

void sub_2DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2E08(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 collectionType] == (char *)&dword_8 + 2)
  {
    uint64_t v3 = 3006;
LABEL_7:
    v4 = v6;
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
    goto LABEL_9;
  }
  if ([v6 collectionType] == (char *)&dword_8 + 1)
  {
    uint64_t v3 = 3005;
    goto LABEL_7;
  }
  if ([v6 collectionType] == (char *)&dword_4 + 3)
  {
    uint64_t v3 = 3007;
    goto LABEL_7;
  }
  BOOL v5 = [v6 collectionType] == &dword_8;
  v4 = v6;
  if (v5)
  {
    uint64_t v3 = 3008;
    goto LABEL_8;
  }
LABEL_9:
}

void sub_3D7C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  v7 = +[NTKCaliforniaFace defaultFaceOfStyle:39 forDevice:*(void *)(a1 + 32)];
  v8 = v7;
  if (v7)
  {
    [v7 selectOption:v12 forCustomEditMode:10 slot:0];
    v9 = +[NTKCaliforniaStyleEditOption optionWithStyle:a3 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v9 forCustomEditMode:13 slot:0];

    v10 = +[NTKAnalogDialShapeEditOption optionWithShape:a4 forDevice:*(void *)(a1 + 32)];
    [v8 selectOption:v10 forCustomEditMode:15 slot:0];

    v11 = [*(id *)(a1 + 40) complicationTypesBySlot];
    [v8 _setFaceGalleryComplicationTypesForSlots:v11];

    [*(id *)(a1 + 48) addObject:v8];
  }
}

void sub_43E0(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = v4[3];
  id v8 = a2;
  v7 = (double *)[v4 hourMarkersCenterPointConstantsForStyle:v5 dial:v6];
  objc_msgSend(v8, "setCenter:", v7[2 * a3], v7[2 * a3 + 1]);
}

void sub_45C8(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_223B8);
  id WeakRetained = objc_loadWeakRetained(&qword_223C0);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_223C0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_223C8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_223C0, obj);
  qword_223C8 = (uint64_t)[obj version];

  sub_7DB8(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_223B8);
  memcpy(a2, qword_20AF0, 0x18C8uLL);
}

void sub_4974(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[4];
  uint64_t v6 = v4[3];
  id v7 = a2;
  id v8 = [v4 tickColorForIndex:a3 palette:v5 dial:v6];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
}

void sub_4A18(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 colorPalette];
  uint64_t v6 = [v7 colorForHourMarker:a3];
  [v4 setColorInHourMarkerView:v5 color:v6];
}

void sub_5074(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = a3 % 5;
  CGFloat v7 = *(double *)(a1 + 8 * a3 + 4848);
  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  double v10 = *(double *)(a1 + 6400);
  double v11 = *(double *)(a1 + 6408);
  CLKInterpolateBetweenFloatsClipped();
  double v13 = v12;
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  v16 = [*(id *)(a1 + 32) tickColorForIndex:a3 palette:*(void *)(*(void *)(a1 + 32) + 32) dial:1];
  v17 = [*(id *)(a1 + 32) tickColorForIndex:a3 palette:*(void *)(*(void *)(a1 + 32) + 32) dial:0];
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformMakeRotation(&v27, v7);
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v18 + 10))
  {
    v19 = [*(id *)(v18 + 96) objectAtIndexedSubscript:a3];
    [v19 doubleValue];
  }
  __double2 v20 = __sincos_stret(v7);
  long long v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v26[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v26[1] = v21;
  v26[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v5 setAffineTransform:v26];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v15, v13);
  [v5 setCornerRadius:v13 * 0.5];
  objc_msgSend(v5, "setAnchorPoint:", 1.0, 0.5);
  objc_msgSend(v5, "setPosition:", v10 + v9 * v20.__cosval, v11 + v9 * v20.__sinval);
  CGAffineTransform v25 = v27;
  [v5 setAffineTransform:&v25];
  NTKInterpolateBetweenColors();
  id v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v22, "CGColor"));

  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v23 = v23;
  [v5 setOpacity:v23];
  v24 = &OBJC_IVAR___NTKCaliforniaContentView__minuteTicks;
  if (!v6) {
    v24 = &OBJC_IVAR___NTKCaliforniaContentView__hourTicks;
  }
  [*(id *)(*(void *)(a1 + 32) + *v24) addSublayer:v5];
}

void sub_53B0(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

void sub_5408(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

void sub_5528(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v8 = a2;
  unint64_t v6 = [v5 colorPalette];
  CGFloat v7 = [v6 colorForHourMarker:a3];
  [v5 setColorInHourMarkerView:v8 color:v7];

  [*(id *)(a1 + 32) addSubview:v8];
}

void sub_56E0(id a1, UIView *a2, unint64_t a3, BOOL *a4)
{
}

void sub_56E8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v8 = a2;
  unint64_t v6 = [v5 colorPalette];
  CGFloat v7 = [v6 colorForHourMarker:a3];
  [v5 setColorInHourMarkerView:v8 color:v7];

  [*(id *)(a1 + 32) addSubview:v8];
}

void sub_67A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"contents";
  v4[1] = @"contentsMultiplyColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"transform";
  v4[3] = @"bounds";
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = @"position";
  v4[5] = @"opacity";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"backgroundColor";
  v5[6] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  uint64_t v3 = (void *)qword_20AE8;
  qword_20AE8 = v2;
}

void sub_71C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5[3];
  id v8 = a2;
  id v11 = [v5 tickColorForIndex:a3 palette:v6 dial:v7];
  double v9 = [*(id *)(a1 + 32) tickColorForIndex:a3 palette:*(void *)(a1 + 48) dial:*(void *)(*(void *)(a1 + 32) + 24)];
  NTKInterpolateBetweenColors();
  id v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));
}

void sub_72A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 colorForHourMarker:a3];
  id v8 = [*(id *)(a1 + 40) colorForHourMarker:a3];
  NTKInterpolateBetweenColors();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 48) setColorInHourMarkerView:v6 color:v9];
}

void sub_7DB8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 setScale:3 forSizeClass:1.13580247];
  v4.f64[0] = 276.0;
  id v5 = sub_C0F4(v4, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v5);
  qword_20BB0 = v6;
  *(void *)algn_20BB8 = v7;

  v8.f64[0] = 315.0;
  id v9 = sub_C0F4(v8, 143.0, 354.0, 154.0);
  [v3 scaledPoint:v9 withOverrides:58.0];
  qword_20BC0 = v10;
  unk_20BC8 = v11;

  v12.f64[0] = 315.0;
  double v13 = sub_C0F4(v12, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v13, 58.0, -1.0);
  qword_20BD0 = v14;
  unk_20BD8 = v15;

  v16.f64[0] = 315.0;
  v17 = sub_C0F4(v16, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v17, 58.0, 37.5);
  *(void *)&xmmword_20BE0 = v18;
  *((void *)&xmmword_20BE0 + 1) = v19;

  v20.f64[0] = 282.0;
  long long v21 = sub_C0F4(v20, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v21);
  qword_20BF0 = v22;
  unk_20BF8 = v23;

  v24.f64[0] = 187.0;
  CGAffineTransform v25 = sub_C0F4(v24, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v25, 0.5, 73.5);
  qword_20C00 = v26;
  unk_20C08 = v27;

  v28.f64[0] = 93.0;
  v29 = sub_C0F4(v28, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v29);
  *(void *)&xmmword_20C10 = v30;
  *((void *)&xmmword_20C10 + 1) = v31;

  v32.f64[0] = 57.0;
  v33 = sub_C0F4(v32, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v33);
  qword_20C20 = v34;
  unk_20C28 = v35;

  v36.f64[0] = 57.0;
  v37 = sub_C0F4(v36, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v37);
  qword_20C30 = v38;
  unk_20C38 = v39;

  v40.f64[0] = 69.0;
  v41 = sub_C0F4(v40, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v41);
  qword_20C40 = v42;
  unk_20C48 = v43;

  v44.f64[0] = 101.0;
  v45 = sub_C0F4(v44, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v45);
  qword_20C50 = v46;
  unk_20C58 = v47;

  v48.f64[0] = 188.0;
  v49 = sub_C0F4(v48, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v49, 1.0, -73.0);
  qword_20C60 = v50;
  unk_20C68 = v51;

  v52.f64[0] = 283.0;
  v53 = sub_C0F4(v52, 58.0, 315.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v53);
  *(void *)&xmmword_20C70 = v54;
  *((void *)&xmmword_20C70 + 1) = v55;

  v56.f64[0] = 322.0;
  v57 = sub_C0F4(v56, 137.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v57, 58.0, -38.0);
  qword_20C80 = v58;
  unk_20C88 = v59;

  v60.f64[0] = 314.0;
  v61 = sub_C0F4(v60, 221.0, 346.0, 246.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v61);
  qword_20C90 = v62;
  unk_20C98 = v63;

  v64.f64[0] = 306.0;
  v65 = sub_C0F4(v64, 307.0, 338.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v65, 50.5, 38.0);
  qword_20CA0 = v66;
  unk_20CA8 = v67;

  v68.f64[0] = 282.0;
  v69 = sub_C0F4(v68, 385.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v69);
  qword_20CB0 = v70;
  unk_20CB8 = v71;

  v72.f64[0] = 187.0;
  v73 = sub_C0F4(v72, 385.0, 208.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v73, 0.5, 72.5);
  qword_20CC0 = v74;
  unk_20CC8 = v75;

  v76.f64[0] = 108.0;
  v77 = sub_C0F4(v76, 385.0, 121.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v77, -35.0, 72.5);
  qword_20CD0 = v78;
  unk_20CD8 = v79;

  v80.f64[0] = 76.0;
  v81 = sub_C0F4(v80, 307.0, 87.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v81, -46.5, 38.0);
  qword_20CE0 = v82;
  unk_20CE8 = v83;

  v84.f64[0] = 61.0;
  v85 = sub_C0F4(v84, 221.0, 70.0, 246.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v85, -54.0, 0.0);
  qword_20CF0 = v86;
  unk_20CF8 = v87;

  v88.f64[0] = 52.0;
  v89 = sub_C0F4(v88, 137.0, 61.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v89, -57.5, -38.0);
  *(void *)&xmmword_20D00 = v90;
  *((void *)&xmmword_20D00 + 1) = v91;

  v92.f64[0] = 93.0;
  v93 = sub_C0F4(v92, 58.0, 104.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v93);
  qword_20D10 = v94;
  unk_20D18 = v95;

  v96.f64[0] = 187.0;
  v97 = sub_C0F4(v96, 58.0, 208.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v97, 0.5, -72.5);
  qword_20D20 = v98;
  unk_20D28 = v99;

  objc_msgSend(v3, "scaledPoint:", 42.5, -74.0);
  qword_20F70 = v100;
  qword_20F78 = v101;
  objc_msgSend(v3, "scaledPoint:", 57.0, -33.5);
  qword_20F80 = v102;
  qword_20F88 = v103;
  objc_msgSend(v3, "scaledPoint:", 57.0, 0.0);
  qword_20F90 = v104;
  qword_20F98 = v105;
  objc_msgSend(v3, "scaledPoint:", 57.0, 33.0);
  qword_20FA0 = v106;
  qword_20FA8 = v107;
  objc_msgSend(v3, "scaledPoint:", 42.5, 74.0);
  qword_20FB0 = v108;
  qword_20FB8 = v109;
  objc_msgSend(v3, "scaledPoint:", 0.0, 74.0);
  qword_20FC0 = v110;
  qword_20FC8 = v111;
  objc_msgSend(v3, "scaledPoint:", -42.5, 74.0);
  qword_20FD0 = v112;
  qword_20FD8 = v113;
  objc_msgSend(v3, "scaledPoint:", -57.0, 33.0);
  qword_20FE0 = v114;
  qword_20FE8 = v115;
  objc_msgSend(v3, "scaledPoint:", -57.0, 0.0);
  qword_20FF0 = v116;
  qword_20FF8 = v117;
  objc_msgSend(v3, "scaledPoint:", -57.0, -33.5);
  qword_21000 = v118;
  qword_21008 = v119;
  objc_msgSend(v3, "scaledPoint:", -42.5, -74.0);
  qword_21010 = v120;
  qword_21018 = v121;
  objc_msgSend(v3, "scaledPoint:", 0.0, -74.0);
  qword_21020 = v122;
  qword_21028 = v123;
  xmmword_20DF0 = xmmword_20C70;
  unk_20E00 = *(_OWORD *)&qword_20C80;
  objc_msgSend(v3, "scaledPoint:", 54.5, 0.0);
  qword_20E10 = v124;
  qword_20E18 = v125;
  xmmword_20E20 = xmmword_20BE0;
  unk_20E30 = *(_OWORD *)&qword_20BF0;
  objc_msgSend(v3, "scaledPoint:", 0.0, 78.0);
  qword_20E40 = v126;
  qword_20E48 = v127;
  xmmword_20E50 = xmmword_20C10;
  unk_20E60 = *(_OWORD *)&qword_20C20;
  objc_msgSend(v3, "scaledPoint:", -54.5, 0.0);
  qword_20E70 = v128;
  qword_20E78 = v129;
  xmmword_20E80 = xmmword_20D00;
  unk_20E90 = *(_OWORD *)&qword_20D10;
  objc_msgSend(v3, "scaledPoint:", 0.0, -68.5);
  qword_20EA0 = v130;
  qword_20EA8 = v131;
  v132.f64[0] = 276.0;
  v133 = sub_C0F4(v132, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v133, 45.0, -73.0);
  qword_211F8 = v134;
  qword_21200 = v135;

  v136.f64[0] = 315.0;
  v137 = sub_C0F4(v136, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v137, 58.0, -37.5);
  qword_21208 = v138;
  qword_21210 = v139;

  v140.f64[0] = 315.0;
  v141 = sub_C0F4(v140, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v141, 58.0, -1.0);
  qword_21218 = v142;
  qword_21220 = v143;

  v144.f64[0] = 315.0;
  v145 = sub_C0F4(v144, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v145, 58.0, 37.5);
  qword_21228 = v146;
  qword_21230 = v147;

  v148.f64[0] = 282.0;
  v149 = sub_C0F4(v148, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v149, 43.0, 73.5);
  qword_21238 = v150;
  qword_21240 = v151;

  v152.f64[0] = 187.0;
  v153 = sub_C0F4(v152, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v153, 0.5, 73.5);
  qword_21248 = v154;
  qword_21250 = v155;

  v156.f64[0] = 93.0;
  v157 = sub_C0F4(v156, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v157, -43.5, 73.0);
  qword_21258 = v158;
  qword_21260 = v159;

  v160.f64[0] = 57.0;
  v161 = sub_C0F4(v160, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v161, -57.5, 37.5);
  qword_21268 = v162;
  qword_21270 = v163;

  v164.f64[0] = 57.0;
  v165 = sub_C0F4(v164, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v165, -58.0, -1.0);
  qword_21278 = v166;
  qword_21280 = v167;

  v168.f64[0] = 69.0;
  v169 = sub_C0F4(v168, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v169, -52.5, -38.0);
  qword_21288 = v170;
  qword_21290 = v171;

  v172.f64[0] = 101.0;
  v173 = sub_C0F4(v172, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v173, -41.0, -73.0);
  qword_21298 = v174;
  qword_212A0 = v175;

  v176.f64[0] = 188.0;
  v177 = sub_C0F4(v176, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v177, 1.0, -73.0);
  qword_212A8 = v178;
  qword_212B0 = v179;

  v180.f64[0] = 290.0;
  v181 = sub_C0F4(v180, 58.0, 320.0, 69.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v181, 45.0, -73.0);
  qword_212B8 = v182;
  qword_212C0 = v183;

  v184.f64[0] = 326.0;
  v185 = sub_C0F4(v184, 136.0, 359.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v185, 58.0, -37.5);
  qword_212C8 = v186;
  qword_212D0 = v187;

  v188.f64[0] = 324.0;
  v189 = sub_C0F4(v188, 220.0, 358.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v189, 58.0, -1.0);
  qword_212D8 = v190;
  qword_212E0 = v191;

  v192.f64[0] = 315.0;
  v193 = sub_C0F4(v192, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v193, 58.0, 37.5);
  qword_212E8 = v194;
  qword_212F0 = v195;

  v196.f64[0] = 282.0;
  v197 = sub_C0F4(v196, 386.0, 313.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v197, 43.0, 73.5);
  qword_212F8 = v198;
  qword_21300 = v199;

  v200.f64[0] = 188.0;
  v201 = sub_C0F4(v200, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v201, 0.5, 73.5);
  qword_21308 = v202;
  qword_21310 = v203;

  v204.f64[0] = 99.0;
  v205 = sub_C0F4(v204, 386.0, 108.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v205, -43.5, 73.0);
  qword_21318 = v206;
  qword_21320 = v207;

  v208.f64[0] = 50.0;
  v209 = sub_C0F4(v208, 307.0, 54.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v209, -57.5, 37.5);
  qword_21328 = v210;
  qword_21330 = v211;

  v212.f64[0] = 50.0;
  v213 = sub_C0F4(v212, 220.0, 55.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v213, -58.0, -1.0);
  qword_21338 = v214;
  qword_21340 = v215;

  v216.f64[0] = 63.0;
  v217 = sub_C0F4(v216, 136.0, 69.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v217, -52.5, -38.0);
  qword_21348 = v218;
  qword_21350 = v219;

  v220.f64[0] = 101.0;
  v221 = sub_C0F4(v220, 58.0, 111.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v221, -41.0, -73.0);
  qword_21358 = v222;
  qword_21360 = v223;

  v224.f64[0] = 188.0;
  v225 = sub_C0F4(v224, 58.0, 208.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v225, 1.0, -73.0);
  qword_21368 = v226;
  qword_21370 = v227;

  v228.f64[0] = 289.0;
  v229 = sub_C0F4(v228, 57.0, 320.0, 63.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v229, 44.5, -72.5);
  qword_21038 = v230;
  qword_21040 = v231;

  v232.f64[0] = 322.0;
  v233 = sub_C0F4(v232, 138.0, 358.0, 158.0);
  [v3 scaledPoint:v233 withOverrides:59.0];
  qword_21048 = v234;
  qword_21050 = v235;

  v236.f64[0] = 322.0;
  v237 = sub_C0F4(v236, 224.0, 358.0, 248.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v237, 59.0, -0.5);
  qword_21058 = v238;
  qword_21060 = v239;

  v240.f64[0] = 322.0;
  v241 = sub_C0F4(v240, 311.0, 358.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v241, 59.0, 37.5);
  qword_21068 = v242;
  qword_21070 = v243;

  v244.f64[0] = 290.0;
  v245 = sub_C0F4(v244, 390.0, 321.0, 435.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v245, 44.5, 73.5);
  qword_21078 = v246;
  qword_21080 = v247;

  v248.f64[0] = 186.0;
  v249 = sub_C0F4(v248, 390.0, 207.0, 435.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v249, 0.0, 73.5);
  qword_21088 = v250;
  qword_21090 = v251;

  v252.f64[0] = 88.0;
  v253 = sub_C0F4(v252, 390.0, 102.0, 435.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v253, -42.5, 73.5);
  qword_21098 = v254;
  qword_210A0 = v255;

  v256.f64[0] = 52.0;
  v257 = sub_C0F4(v256, 311.0, 59.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v257, -57.0, 37.5);
  qword_210A8 = v258;
  qword_210B0 = v259;

  v260.f64[0] = 52.0;
  v261 = sub_C0F4(v260, 222.0, 59.0, 248.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v261, -57.0, -0.5);
  qword_210B8 = v262;
  qword_210C0 = v263;

  v264.f64[0] = 52.0;
  v265 = sub_C0F4(v264, 137.0, 59.0, 151.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v265, -57.0, -38.5);
  qword_210C8 = v266;
  qword_210D0 = v267;

  v268.f64[0] = 88.0;
  v269 = sub_C0F4(v268, 52.0, 101.0, 54.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v269, -42.5, -75.5);
  qword_210D8 = v270;
  qword_210E0 = v271;

  v272.f64[0] = 187.0;
  v273 = sub_C0F4(v272, 52.0, 208.0, 54.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v273, 0.0, -75.5);
  qword_210E8 = v274;
  qword_210F0 = v275;

  v276.f64[0] = 88.0;
  v277 = sub_C0F4(v276, 86.0, 101.0, 90.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v277, -42.5, -58.5);
  qword_210F8 = v278;
  qword_21100 = v279;

  v280.f64[0] = 187.0;
  v281 = sub_C0F4(v280, 90.0, 208.0, 93.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v281, 0.0, -58.5);
  qword_21108 = v282;
  qword_21110 = v283;

  v284.f64[0] = 276.0;
  v285 = sub_C0F4(v284, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v285, 45.0, -73.0);
  qword_21378 = v286;
  qword_21380 = v287;

  v288.f64[0] = 315.0;
  v289 = sub_C0F4(v288, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v289, 58.0, -37.5);
  qword_21388 = v290;
  qword_21390 = v291;

  v292.f64[0] = 315.0;
  v293 = sub_C0F4(v292, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v293, 58.0, -1.0);
  qword_21398 = v294;
  qword_213A0 = v295;

  v296.f64[0] = 315.0;
  v297 = sub_C0F4(v296, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v297, 58.0, 37.5);
  qword_213A8 = v298;
  qword_213B0 = v299;

  v300.f64[0] = 282.0;
  v301 = sub_C0F4(v300, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v301, 43.0, 73.5);
  qword_213B8 = v302;
  qword_213C0 = v303;

  v304.f64[0] = 187.0;
  v305 = sub_C0F4(v304, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v305, 0.5, 73.5);
  qword_213C8 = v306;
  qword_213D0 = v307;

  v308.f64[0] = 93.0;
  v309 = sub_C0F4(v308, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v309, -43.5, 73.0);
  qword_213D8 = v310;
  qword_213E0 = v311;

  v312.f64[0] = 57.0;
  v313 = sub_C0F4(v312, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v313, -57.5, 37.5);
  qword_213E8 = v314;
  qword_213F0 = v315;

  v316.f64[0] = 57.0;
  v317 = sub_C0F4(v316, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v317, -53.0, -1.0);
  qword_213F8 = v318;
  qword_21400 = v319;

  v320.f64[0] = 69.0;
  v321 = sub_C0F4(v320, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v321, -52.5, -38.0);
  qword_21408 = v322;
  qword_21410 = v323;

  v324.f64[0] = 101.0;
  v325 = sub_C0F4(v324, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v325, -41.0, -73.0);
  qword_21418 = v326;
  qword_21420 = v327;

  v328.f64[0] = 188.0;
  v329 = sub_C0F4(v328, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v329, 1.0, -73.0);
  qword_21428 = v330;
  qword_21430 = v331;

  v332.f64[0] = 276.0;
  v333 = sub_C0F4(v332, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v333, 45.0, -73.0);
  qword_21438 = v334;
  qword_21440 = v335;

  v336.f64[0] = 315.0;
  v337 = sub_C0F4(v336, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v337, 58.0, -37.5);
  qword_21448 = v338;
  qword_21450 = v339;

  v340.f64[0] = 315.0;
  v341 = sub_C0F4(v340, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v341, 58.0, -1.0);
  qword_21458 = v342;
  qword_21460 = v343;

  v344.f64[0] = 315.0;
  v345 = sub_C0F4(v344, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v345, 58.0, 37.5);
  qword_21468 = v346;
  qword_21470 = v347;

  v348.f64[0] = 282.0;
  v349 = sub_C0F4(v348, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v349, 43.0, 73.5);
  qword_21478 = v350;
  qword_21480 = v351;

  v352.f64[0] = 187.0;
  v353 = sub_C0F4(v352, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v353, 0.5, 73.5);
  qword_21488 = v354;
  qword_21490 = v355;

  v356.f64[0] = 93.0;
  v357 = sub_C0F4(v356, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v357, -43.5, 73.0);
  qword_21498 = v358;
  qword_214A0 = v359;

  v360.f64[0] = 57.0;
  v361 = sub_C0F4(v360, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v361, -57.5, 37.5);
  qword_214A8 = v362;
  qword_214B0 = v363;

  v364.f64[0] = 57.0;
  v365 = sub_C0F4(v364, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v365, -58.0, -1.0);
  qword_214B8 = v366;
  qword_214C0 = v367;

  v368.f64[0] = 69.0;
  v369 = sub_C0F4(v368, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v369, -52.5, -38.0);
  qword_214C8 = v370;
  qword_214D0 = v371;

  v372.f64[0] = 101.0;
  v373 = sub_C0F4(v372, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v373, -41.0, -73.0);
  qword_214D8 = v374;
  qword_214E0 = v375;

  v376.f64[0] = 188.0;
  v377 = sub_C0F4(v376, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v377, 1.0, -73.0);
  qword_214E8 = v378;
  qword_214F0 = v379;

  v380.f64[0] = 276.0;
  v381 = sub_C0F4(v380, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v381, 45.0, -73.0);
  qword_214F8 = v382;
  qword_21500 = v383;

  v384.f64[0] = 315.0;
  v385 = sub_C0F4(v384, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v385, 58.0, -37.5);
  qword_21508 = v386;
  qword_21510 = v387;

  v388.f64[0] = 315.0;
  v389 = sub_C0F4(v388, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v389, 58.0, -1.0);
  qword_21518 = v390;
  qword_21520 = v391;

  v392.f64[0] = 315.0;
  v393 = sub_C0F4(v392, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v393, 58.0, 37.5);
  qword_21528 = v394;
  qword_21530 = v395;

  v396.f64[0] = 282.0;
  v397 = sub_C0F4(v396, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v397, 43.0, 73.5);
  qword_21538 = v398;
  qword_21540 = v399;

  v400.f64[0] = 187.0;
  v401 = sub_C0F4(v400, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v401, 0.5, 73.5);
  qword_21548 = v402;
  qword_21550 = v403;

  v404.f64[0] = 93.0;
  v405 = sub_C0F4(v404, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v405, -43.5, 73.0);
  qword_21558 = v406;
  qword_21560 = v407;

  v408.f64[0] = 57.0;
  v409 = sub_C0F4(v408, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v409, -57.5, 37.5);
  qword_21568 = v410;
  qword_21570 = v411;

  v412.f64[0] = 57.0;
  v413 = sub_C0F4(v412, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v413, -58.0, -1.0);
  qword_21578 = v414;
  qword_21580 = v415;

  v416.f64[0] = 69.0;
  v417 = sub_C0F4(v416, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v417, -52.5, -38.0);
  qword_21588 = v418;
  qword_21590 = v419;

  v420.f64[0] = 101.0;
  v421 = sub_C0F4(v420, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v421, -41.0, -73.0);
  qword_21598 = v422;
  qword_215A0 = v423;

  v424.f64[0] = 188.0;
  v425 = sub_C0F4(v424, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v425, 1.0, -73.0);
  qword_215A8 = v426;
  qword_215B0 = v427;

  v428.f64[0] = 276.0;
  v429 = sub_C0F4(v428, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v429, 45.0, -73.0);
  qword_215B8 = v430;
  qword_215C0 = v431;

  v432.f64[0] = 315.0;
  v433 = sub_C0F4(v432, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v433, 58.0, -37.5);
  qword_215C8 = v434;
  qword_215D0 = v435;

  v436.f64[0] = 315.0;
  v437 = sub_C0F4(v436, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v437, 58.0, -1.0);
  qword_215D8 = v438;
  qword_215E0 = v439;

  v440.f64[0] = 315.0;
  v441 = sub_C0F4(v440, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v441, 58.0, 37.5);
  qword_215E8 = v442;
  qword_215F0 = v443;

  v444.f64[0] = 282.0;
  v445 = sub_C0F4(v444, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v445, 43.0, 73.5);
  qword_215F8 = v446;
  qword_21600 = v447;

  v448.f64[0] = 187.0;
  v449 = sub_C0F4(v448, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v449, 0.5, 73.5);
  qword_21608 = v450;
  qword_21610 = v451;

  v452.f64[0] = 93.0;
  v453 = sub_C0F4(v452, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v453, -43.5, 73.0);
  qword_21618 = v454;
  qword_21620 = v455;

  v456.f64[0] = 57.0;
  v457 = sub_C0F4(v456, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v457, -57.5, 37.5);
  qword_21628 = v458;
  qword_21630 = v459;

  v460.f64[0] = 57.0;
  v461 = sub_C0F4(v460, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v461, -58.0, -1.0);
  qword_21638 = v462;
  qword_21640 = v463;

  v464.f64[0] = 69.0;
  v465 = sub_C0F4(v464, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v465, -52.5, -38.0);
  qword_21648 = v466;
  qword_21650 = v467;

  v468.f64[0] = 101.0;
  v469 = sub_C0F4(v468, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v469, -41.0, -73.0);
  qword_21658 = v470;
  qword_21660 = v471;

  v472.f64[0] = 188.0;
  v473 = sub_C0F4(v472, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v473, 1.0, -73.0);
  qword_21668 = v474;
  qword_21670 = v475;

  v476.f64[0] = 276.0;
  v477 = sub_C0F4(v476, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v477, 45.0, -73.0);
  qword_21678 = v478;
  qword_21680 = v479;

  v480.f64[0] = 315.0;
  v481 = sub_C0F4(v480, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v481, 58.0, -37.5);
  qword_21688 = v482;
  qword_21690 = v483;

  v484.f64[0] = 315.0;
  v485 = sub_C0F4(v484, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v485, 58.0, -1.0);
  qword_21698 = v486;
  qword_216A0 = v487;

  v488.f64[0] = 315.0;
  v489 = sub_C0F4(v488, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v489, 58.0, 37.5);
  qword_216A8 = v490;
  qword_216B0 = v491;

  v492.f64[0] = 282.0;
  v493 = sub_C0F4(v492, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v493, 43.0, 73.5);
  qword_216B8 = v494;
  qword_216C0 = v495;

  v496.f64[0] = 187.0;
  v497 = sub_C0F4(v496, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v497, 0.5, 73.5);
  qword_216C8 = v498;
  qword_216D0 = v499;

  v500.f64[0] = 93.0;
  v501 = sub_C0F4(v500, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v501, -43.5, 73.0);
  qword_216D8 = v502;
  qword_216E0 = v503;

  v504.f64[0] = 57.0;
  v505 = sub_C0F4(v504, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v505, -57.5, 37.5);
  qword_216E8 = v506;
  qword_216F0 = v507;

  v508.f64[0] = 57.0;
  v509 = sub_C0F4(v508, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v509, -58.0, -1.0);
  qword_216F8 = v510;
  qword_21700 = v511;

  v512.f64[0] = 69.0;
  v513 = sub_C0F4(v512, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v513, -52.5, -38.0);
  qword_21708 = v514;
  qword_21710 = v515;

  v516.f64[0] = 101.0;
  v517 = sub_C0F4(v516, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v517, -41.0, -73.0);
  qword_21718 = v518;
  qword_21720 = v519;

  v520.f64[0] = 188.0;
  v521 = sub_C0F4(v520, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v521, 1.0, -73.0);
  qword_21728 = v522;
  qword_21730 = v523;

  v524.f64[0] = 276.0;
  v525 = sub_C0F4(v524, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v525, 45.0, -73.0);
  qword_21738 = v526;
  qword_21740 = v527;

  v528.f64[0] = 315.0;
  v529 = sub_C0F4(v528, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v529, 58.0, -37.5);
  qword_21748 = v530;
  qword_21750 = v531;

  v532.f64[0] = 315.0;
  v533 = sub_C0F4(v532, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v533, 58.0, -1.0);
  qword_21758 = v534;
  qword_21760 = v535;

  v536.f64[0] = 315.0;
  v537 = sub_C0F4(v536, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v537, 58.0, 37.5);
  qword_21768 = v538;
  qword_21770 = v539;

  v540.f64[0] = 282.0;
  v541 = sub_C0F4(v540, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v541, 43.0, 73.5);
  qword_21778 = v542;
  qword_21780 = v543;

  v544.f64[0] = 187.0;
  v545 = sub_C0F4(v544, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v545, 0.5, 73.5);
  qword_21788 = v546;
  qword_21790 = v547;

  v548.f64[0] = 93.0;
  v549 = sub_C0F4(v548, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v549, -43.5, 73.0);
  qword_21798 = v550;
  qword_217A0 = v551;

  v552.f64[0] = 57.0;
  v553 = sub_C0F4(v552, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v553, -57.5, 37.5);
  qword_217A8 = v554;
  qword_217B0 = v555;

  v556.f64[0] = 57.0;
  v557 = sub_C0F4(v556, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v557, -58.0, -1.0);
  qword_217B8 = v558;
  qword_217C0 = v559;

  v560.f64[0] = 69.0;
  v561 = sub_C0F4(v560, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v561, -52.5, -38.0);
  qword_217C8 = v562;
  qword_217D0 = v563;

  v564.f64[0] = 101.0;
  v565 = sub_C0F4(v564, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v565, -41.0, -73.0);
  qword_217D8 = v566;
  qword_217E0 = v567;

  v568.f64[0] = 188.0;
  v569 = sub_C0F4(v568, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v569, 1.0, -73.0);
  qword_217E8 = v570;
  qword_217F0 = v571;

  v572.f64[0] = 276.0;
  v573 = sub_C0F4(v572, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v573, 45.0, -73.0);
  qword_217F8 = v574;
  qword_21800 = v575;

  v576.f64[0] = 315.0;
  v577 = sub_C0F4(v576, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v577, 58.0, -37.5);
  qword_21808 = v578;
  qword_21810 = v579;

  v580.f64[0] = 315.0;
  v581 = sub_C0F4(v580, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v581, 58.0, -1.0);
  qword_21818 = v582;
  qword_21820 = v583;

  v584.f64[0] = 315.0;
  v585 = sub_C0F4(v584, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v585, 58.0, 37.5);
  qword_21828 = v586;
  qword_21830 = v587;

  v588.f64[0] = 282.0;
  v589 = sub_C0F4(v588, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v589, 43.0, 73.5);
  qword_21838 = v590;
  qword_21840 = v591;

  v592.f64[0] = 187.0;
  v593 = sub_C0F4(v592, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v593, 0.5, 73.5);
  qword_21848 = v594;
  qword_21850 = v595;

  v596.f64[0] = 93.0;
  v597 = sub_C0F4(v596, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v597, -43.5, 73.0);
  qword_21858 = v598;
  qword_21860 = v599;

  v600.f64[0] = 57.0;
  v601 = sub_C0F4(v600, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v601, -57.5, 37.5);
  qword_21868 = v602;
  qword_21870 = v603;

  v604.f64[0] = 57.0;
  v605 = sub_C0F4(v604, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v605, -58.0, -1.0);
  qword_21878 = v606;
  qword_21880 = v607;

  v608.f64[0] = 69.0;
  v609 = sub_C0F4(v608, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v609, -52.5, -38.0);
  qword_21888 = v610;
  qword_21890 = v611;

  v612.f64[0] = 101.0;
  v613 = sub_C0F4(v612, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v613, -41.0, -73.0);
  qword_21898 = v614;
  qword_218A0 = v615;

  v616.f64[0] = 188.0;
  v617 = sub_C0F4(v616, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v617, 1.0, -73.0);
  qword_218A8 = v618;
  qword_218B0 = v619;

  v620.f64[0] = 276.0;
  v621 = sub_C0F4(v620, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v621, 45.0, -73.0);
  qword_218B8 = v622;
  qword_218C0 = v623;

  v624.f64[0] = 315.0;
  v625 = sub_C0F4(v624, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v625, 58.0, -37.5);
  qword_218C8 = v626;
  qword_218D0 = v627;

  v628.f64[0] = 315.0;
  v629 = sub_C0F4(v628, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v629, 58.0, -1.0);
  qword_218D8 = v630;
  qword_218E0 = v631;

  v632.f64[0] = 315.0;
  v633 = sub_C0F4(v632, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v633, 58.0, 37.5);
  qword_218E8 = v634;
  qword_218F0 = v635;

  v636.f64[0] = 282.0;
  v637 = sub_C0F4(v636, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v637, 43.0, 73.5);
  qword_218F8 = v638;
  qword_21900 = v639;

  v640.f64[0] = 187.0;
  v641 = sub_C0F4(v640, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v641, 0.5, 73.5);
  qword_21908 = v642;
  qword_21910 = v643;

  v644.f64[0] = 93.0;
  v645 = sub_C0F4(v644, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v645, -43.5, 73.0);
  qword_21918 = v646;
  qword_21920 = v647;

  v648.f64[0] = 57.0;
  v649 = sub_C0F4(v648, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v649, -57.5, 37.5);
  qword_21928 = v650;
  qword_21930 = v651;

  v652.f64[0] = 57.0;
  v653 = sub_C0F4(v652, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v653, -58.0, -1.0);
  qword_21938 = v654;
  qword_21940 = v655;

  v656.f64[0] = 69.0;
  v657 = sub_C0F4(v656, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v657, -52.5, -38.0);
  qword_21948 = v658;
  qword_21950 = v659;

  v660.f64[0] = 101.0;
  v661 = sub_C0F4(v660, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v661, -41.0, -73.0);
  qword_21958 = v662;
  qword_21960 = v663;

  v664.f64[0] = 188.0;
  v665 = sub_C0F4(v664, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v665, 1.0, -73.0);
  qword_21968 = v666;
  qword_21970 = v667;

  v668.f64[0] = 276.0;
  v669 = sub_C0F4(v668, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v669, 45.0, -73.0);
  qword_21978 = v670;
  qword_21980 = v671;

  v672.f64[0] = 315.0;
  v673 = sub_C0F4(v672, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v673, 58.0, -37.5);
  qword_21988 = v674;
  qword_21990 = v675;

  v676.f64[0] = 315.0;
  v677 = sub_C0F4(v676, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v677, 58.0, -1.0);
  qword_21998 = v678;
  qword_219A0 = v679;

  v680.f64[0] = 315.0;
  v681 = sub_C0F4(v680, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v681, 58.0, 37.5);
  qword_219A8 = v682;
  qword_219B0 = v683;

  v684.f64[0] = 282.0;
  v685 = sub_C0F4(v684, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v685, 43.0, 73.5);
  qword_219B8 = v686;
  qword_219C0 = v687;

  v688.f64[0] = 187.0;
  v689 = sub_C0F4(v688, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v689, 0.5, 73.5);
  qword_219C8 = v690;
  qword_219D0 = v691;

  v692.f64[0] = 93.0;
  v693 = sub_C0F4(v692, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v693, -43.5, 73.0);
  qword_219D8 = v694;
  qword_219E0 = v695;

  v696.f64[0] = 57.0;
  v697 = sub_C0F4(v696, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v697, -57.5, 37.5);
  qword_219E8 = v698;
  qword_219F0 = v699;

  v700.f64[0] = 57.0;
  v701 = sub_C0F4(v700, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v701, -58.0, -1.0);
  qword_219F8 = v702;
  qword_21A00 = v703;

  v704.f64[0] = 69.0;
  v705 = sub_C0F4(v704, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v705, -52.5, -38.0);
  qword_21A08 = v706;
  qword_21A10 = v707;

  v708.f64[0] = 101.0;
  v709 = sub_C0F4(v708, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v709, -41.0, -73.0);
  qword_21A18 = v710;
  qword_21A20 = v711;

  v712.f64[0] = 188.0;
  v713 = sub_C0F4(v712, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v713, 1.0, -73.0);
  qword_21A28 = v714;
  qword_21A30 = v715;

  v716.f64[0] = 276.0;
  v717 = sub_C0F4(v716, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v717, 45.0, -73.0);
  qword_21A38 = v718;
  qword_21A40 = v719;

  v720.f64[0] = 315.0;
  v721 = sub_C0F4(v720, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v721, 58.0, -37.5);
  qword_21A48 = v722;
  qword_21A50 = v723;

  v724.f64[0] = 315.0;
  v725 = sub_C0F4(v724, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v725, 58.0, -1.0);
  qword_21A58 = v726;
  qword_21A60 = v727;

  v728.f64[0] = 315.0;
  v729 = sub_C0F4(v728, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v729, 58.0, 37.5);
  qword_21A68 = v730;
  qword_21A70 = v731;

  v732.f64[0] = 282.0;
  v733 = sub_C0F4(v732, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v733, 43.0, 73.5);
  qword_21A78 = v734;
  qword_21A80 = v735;

  v736.f64[0] = 187.0;
  v737 = sub_C0F4(v736, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v737, 0.5, 73.5);
  qword_21A88 = v738;
  qword_21A90 = v739;

  v740.f64[0] = 93.0;
  v741 = sub_C0F4(v740, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v741, -43.5, 73.0);
  qword_21A98 = v742;
  qword_21AA0 = v743;

  v744.f64[0] = 57.0;
  v745 = sub_C0F4(v744, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v745, -57.5, 37.5);
  qword_21AA8 = v746;
  qword_21AB0 = v747;

  v748.f64[0] = 57.0;
  v749 = sub_C0F4(v748, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v749, -58.0, -1.0);
  qword_21AB8 = v750;
  qword_21AC0 = v751;

  v752.f64[0] = 69.0;
  v753 = sub_C0F4(v752, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v753, -52.5, -38.0);
  qword_21AC8 = v754;
  qword_21AD0 = v755;

  v756.f64[0] = 101.0;
  v757 = sub_C0F4(v756, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v757, -41.0, -73.0);
  qword_21AD8 = v758;
  qword_21AE0 = v759;

  v760.f64[0] = 188.0;
  v761 = sub_C0F4(v760, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v761, 1.0, -73.0);
  qword_21AE8 = v762;
  qword_21AF0 = v763;

  v764.f64[0] = 276.0;
  v765 = sub_C0F4(v764, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v765, 45.0, -73.0);
  qword_21AF8 = v766;
  qword_21B00 = v767;

  v768.f64[0] = 315.0;
  v769 = sub_C0F4(v768, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v769, 58.0, -37.5);
  qword_21B08 = v770;
  qword_21B10 = v771;

  v772.f64[0] = 315.0;
  v773 = sub_C0F4(v772, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v773, 58.0, -1.0);
  qword_21B18 = v774;
  qword_21B20 = v775;

  v776.f64[0] = 315.0;
  v777 = sub_C0F4(v776, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v777, 58.0, 37.5);
  qword_21B28 = v778;
  qword_21B30 = v779;

  v780.f64[0] = 282.0;
  v781 = sub_C0F4(v780, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v781, 43.0, 73.5);
  qword_21B38 = v782;
  qword_21B40 = v783;

  v784.f64[0] = 187.0;
  v785 = sub_C0F4(v784, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v785, 0.5, 73.5);
  qword_21B48 = v786;
  qword_21B50 = v787;

  v788.f64[0] = 93.0;
  v789 = sub_C0F4(v788, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v789, -43.5, 73.0);
  qword_21B58 = v790;
  qword_21B60 = v791;

  v792.f64[0] = 57.0;
  v793 = sub_C0F4(v792, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v793, -57.5, 37.5);
  qword_21B68 = v794;
  qword_21B70 = v795;

  v796.f64[0] = 57.0;
  v797 = sub_C0F4(v796, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v797, -58.0, -1.0);
  qword_21B78 = v798;
  qword_21B80 = v799;

  v800.f64[0] = 69.0;
  v801 = sub_C0F4(v800, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v801, -52.5, -38.0);
  qword_21B88 = v802;
  qword_21B90 = v803;

  v804.f64[0] = 101.0;
  v805 = sub_C0F4(v804, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v805, -41.0, -73.0);
  qword_21B98 = v806;
  qword_21BA0 = v807;

  v808.f64[0] = 188.0;
  v809 = sub_C0F4(v808, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v809, 1.0, -73.0);
  qword_21BA8 = v810;
  qword_21BB0 = v811;

  v812.f64[0] = 276.0;
  v813 = sub_C0F4(v812, 57.0, 312.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v813, 45.0, -73.0);
  qword_21BB8 = v814;
  qword_21BC0 = v815;

  v816.f64[0] = 315.0;
  v817 = sub_C0F4(v816, 143.0, 354.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v817, 58.0, -37.5);
  qword_21BC8 = v818;
  qword_21BD0 = v819;

  v820.f64[0] = 315.0;
  v821 = sub_C0F4(v820, 226.0, 354.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v821, 58.0, -1.0);
  qword_21BD8 = v822;
  qword_21BE0 = v823;

  v824.f64[0] = 315.0;
  v825 = sub_C0F4(v824, 307.0, 352.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v825, 58.0, 37.5);
  qword_21BE8 = v826;
  qword_21BF0 = v827;

  v828.f64[0] = 282.0;
  v829 = sub_C0F4(v828, 386.0, 311.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v829, 43.0, 73.5);
  qword_21BF8 = v830;
  qword_21C00 = v831;

  v832.f64[0] = 187.0;
  v833 = sub_C0F4(v832, 386.0, 210.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v833, 0.5, 73.5);
  qword_21C08 = v834;
  qword_21C10 = v835;

  v836.f64[0] = 93.0;
  v837 = sub_C0F4(v836, 386.0, 104.0, 426.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v837, -43.5, 73.0);
  qword_21C18 = v838;
  qword_21C20 = v839;

  v840.f64[0] = 57.0;
  v841 = sub_C0F4(v840, 307.0, 64.0, 340.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v841, -57.5, 37.5);
  qword_21C28 = v842;
  qword_21C30 = v843;

  v844.f64[0] = 57.0;
  v845 = sub_C0F4(v844, 226.0, 63.0, 247.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v845, -58.0, -1.0);
  qword_21C38 = v846;
  qword_21C40 = v847;

  v848.f64[0] = 69.0;
  v849 = sub_C0F4(v848, 143.0, 76.0, 154.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v849, -52.5, -38.0);
  qword_21C48 = v850;
  qword_21C50 = v851;

  v852.f64[0] = 101.0;
  v853 = sub_C0F4(v852, 57.0, 113.0, 67.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v853, -41.0, -73.0);
  qword_21C58 = v854;
  qword_21C60 = v855;

  v856.f64[0] = 188.0;
  v857 = sub_C0F4(v856, 57.0, 210.0, 68.0);
  objc_msgSend(v3, "scaledPoint:withOverrides:", v857, 1.0, -73.0);
  qword_21C68 = v858;
  qword_21C70 = v859;

  [v2 screenBounds];
  v1007 = v2;
  [v2 screenBounds];
  unint64_t v860 = 0;
  v861 = qword_20AF0;
  do
  {
    for (uint64_t i = 0; i != 19; ++i)
    {
      v863 = &off_18808[i][2 * v860];
      CLKAddPoints();
      uint64_t *v863 = v864;
      v863[1] = v865;
    }
    if (v860 > 9)
    {
      v866 = &qword_20AF0[2 * v860];
      CLKAddPoints();
      v866[173] = v867;
      v866[174] = v868;
    }
    ++v860;
  }
  while (v860 != 12);
  objc_msgSend(v3, "scaledPoint:", 31.5, -47.0);
  qword_20AF0[0] = v869;
  *(void *)algn_20AF8 = v870;
  objc_msgSend(v3, "scaledPoint:", 50.0, -25.0);
  qword_20B00 = v871;
  unk_20B08 = v872;
  objc_msgSend(v3, "scaledPoint:");
  qword_20B10 = v873;
  unk_20B18 = v874;
  objc_msgSend(v3, "scaledPoint:", 50.0, 25.5);
  *(void *)&xmmword_20B20 = v875;
  *((void *)&xmmword_20B20 + 1) = v876;
  objc_msgSend(v3, "scaledPoint:", 31.5, 47.0);
  qword_20B30 = v877;
  unk_20B38 = v878;
  [v3 scaledPoint:-0.5];
  qword_20B40 = v879;
  unk_20B48 = v880;
  objc_msgSend(v3, "scaledPoint:", -31.0, 47.0);
  *(void *)&xmmword_20B50 = v881;
  *((void *)&xmmword_20B50 + 1) = v882;
  objc_msgSend(v3, "scaledPoint:");
  qword_20B60 = v883;
  unk_20B68 = v884;
  objc_msgSend(v3, "scaledPoint:", -59.0, 0.0);
  qword_20B70 = v885;
  unk_20B78 = v886;
  objc_msgSend(v3, "scaledPoint:", -46.0, -25.0);
  qword_20B80 = v887;
  unk_20B88 = v888;
  objc_msgSend(v3, "scaledPoint:", -29.5, -47.0);
  qword_20B90 = v889;
  unk_20B98 = v890;
  objc_msgSend(v3, "scaledPoint:", 0.0, -57.0);
  qword_20BA0 = v891;
  unk_20BA8 = v892;
  objc_msgSend(v3, "scaledPoint:", 33.0, -47.0);
  *(void *)&xmmword_20D30 = v893;
  *((void *)&xmmword_20D30 + 1) = v894;
  objc_msgSend(v3, "scaledPoint:", 51.0, -27.0);
  qword_20D40 = v895;
  qword_20D48 = v896;
  objc_msgSend(v3, "scaledPoint:", 56.5, -1.0);
  qword_20D50 = v897;
  qword_20D58 = v898;
  objc_msgSend(v3, "scaledPoint:", 46.0, 24.5);
  qword_20D60 = v899;
  qword_20D68 = v900;
  objc_msgSend(v3, "scaledPoint:", 31.0, 46.0);
  qword_20D70 = v901;
  qword_20D78 = v902;
  objc_msgSend(v3, "scaledPoint:", 0.5, 56.5);
  qword_20D80 = v903;
  qword_20D88 = v904;
  objc_msgSend(v3, "scaledPoint:", -27.0, 46.0);
  qword_20D90 = v905;
  qword_20D98 = v906;
  objc_msgSend(v3, "scaledPoint:", -42.5, 24.5);
  qword_20DA0 = v907;
  qword_20DA8 = v908;
  objc_msgSend(v3, "scaledPoint:", -56.0, -1.0);
  qword_20DB0 = v909;
  qword_20DB8 = v910;
  objc_msgSend(v3, "scaledPoint:", -49.5, -27.0);
  *(void *)&xmmword_20DC0 = v911;
  *((void *)&xmmword_20DC0 + 1) = v912;
  objc_msgSend(v3, "scaledPoint:", -29.0, -47.0);
  qword_20DD0 = v913;
  qword_20DD8 = v914;
  objc_msgSend(v3, "scaledPoint:", 1.0, -57.5);
  qword_20DE0 = v915;
  qword_20DE8 = v916;
  [v3 scaledValue:3 withOverride:55.5 forSizeClass:63.0];
  qword_21030 = v917;
  xmmword_20EB0 = xmmword_20D30;
  unk_20EC0 = *(_OWORD *)&qword_20D40;
  objc_msgSend(v3, "scaledPoint:", 56.0, 0.0);
  qword_20ED0 = v918;
  qword_20ED8 = v919;
  xmmword_20EE0 = xmmword_20B20;
  unk_20EF0 = *(_OWORD *)&qword_20B30;
  objc_msgSend(v3, "scaledPoint:", 0.5, 61.0);
  qword_20F00 = v920;
  qword_20F08 = v921;
  xmmword_20F10 = xmmword_20B50;
  xmmword_20F20 = *(_OWORD *)&qword_20B60;
  objc_msgSend(v3, "scaledPoint:", -56.0, 0.0);
  qword_20F30 = v922;
  qword_20F38 = v923;
  xmmword_20F40 = xmmword_20DC0;
  xmmword_20F50 = *(_OWORD *)&qword_20DD0;
  objc_msgSend(v3, "scaledPoint:", 0.0, -55.5);
  qword_20F60 = v924;
  qword_20F68 = v925;
  objc_msgSend(v3, "scaledPoint:", 30.0, -48.5);
  qword_21118 = v926;
  qword_21120 = v927;
  objc_msgSend(v3, "scaledPoint:", 49.5, -27.0);
  qword_21128 = v928;
  qword_21130 = v929;
  objc_msgSend(v3, "scaledPoint:", 58.5, -0.5);
  qword_21138 = v930;
  qword_21140 = v931;
  objc_msgSend(v3, "scaledPoint:", 49.5, 26.5);
  qword_21148 = v932;
  qword_21150 = v933;
  objc_msgSend(v3, "scaledPoint:", 30.0, 47.0);
  qword_21158 = v934;
  qword_21160 = v935;
  objc_msgSend(v3, "scaledPoint:", 0.5, 56.5);
  qword_21168 = v936;
  qword_21170 = v937;
  objc_msgSend(v3, "scaledPoint:", -30.5, 47.0);
  qword_21178 = v938;
  qword_21180 = v939;
  objc_msgSend(v3, "scaledPoint:", -49.5, 26.5);
  qword_21188 = v940;
  qword_21190 = v941;
  objc_msgSend(v3, "scaledPoint:", -57.5, -0.5);
  qword_21198 = v942;
  qword_211A0 = v943;
  objc_msgSend(v3, "scaledPoint:", -49.5, -27.0);
  qword_211A8 = v944;
  qword_211B0 = v945;
  objc_msgSend(v3, "scaledPoint:", -30.5, -51.5);
  qword_211B8 = v946;
  qword_211C0 = v947;
  objc_msgSend(v3, "scaledPoint:", 0.5, -57.5);
  qword_211C8 = v948;
  qword_211D0 = v949;
  objc_msgSend(v3, "scaledPoint:", -30.5, -39.0);
  qword_211D8 = v950;
  qword_211E0 = v951;
  objc_msgSend(v3, "scaledPoint:", 0.5, -41.0);
  unint64_t v952 = 0;
  qword_211E8 = v953;
  qword_211F0 = v954;
  do
  {
    CLKAddPoints();
    uint64_t *v861 = v955;
    v861[1] = v956;
    CLKAddPoints();
    v861[72] = v957;
    v861[73] = v958;
    CLKAddPoints();
    v861[120] = v959;
    v861[121] = v960;
    CLKAddPoints();
    v861[197] = v961;
    v861[198] = v962;
    if (v952 >= 0xA)
    {
      CLKAddPoints();
      v861[201] = v963;
      v861[202] = v964;
    }
    ++v952;
    v861 += 2;
  }
  while (v952 != 12);
  objc_msgSend(v3, "scaledSize:", 5.0, 19.0);
  *(void *)&xmmword_21D80 = v965;
  *((void *)&xmmword_21D80 + 1) = v966;
  objc_msgSend(v3, "scaledSize:", 5.0, 20.5);
  qword_21CD0 = v967;
  unk_21CD8 = v968;
  objc_msgSend(v3, "scaledSize:", 5.0, 21.0);
  qword_21CE0 = v969;
  unk_21CE8 = v970;
  objc_msgSend(v3, "scaledSize:", 5.0, 19.0);
  qword_21CF0 = v971;
  unk_21CF8 = v972;
  unk_21D00 = *(_OWORD *)&qword_21CE0;
  unk_21D10 = *(_OWORD *)&qword_21CD0;
  unk_21D20 = xmmword_21D80;
  unk_21D30 = *(_OWORD *)&qword_21CD0;
  unk_21D40 = *(_OWORD *)&qword_21CE0;
  unk_21D50 = *(_OWORD *)&qword_21CF0;
  unk_21D60 = *(_OWORD *)&qword_21CE0;
  unk_21D70 = *(_OWORD *)&qword_21CD0;
  [v3 scaledValue:28.5];
  qword_21C80 = v973;
  [v3 scaledValue:3 withOverride:23.0 forSizeClass:26.0];
  qword_21C88 = v974;
  [v3 scaledValue:24.0];
  qword_21C90 = v975;
  [v3 scaledValue:21.0];
  qword_21C98 = v976;
  [v3 scaledValue:20.0];
  qword_21CA0 = v977;
  [v3 scaledValue:19.0];
  qword_21CA8 = v978;
  qword_21C78 = 0x3FF0000000000000;
  objc_msgSend(v3, "scaledSize:withOverride:forSizeClass:", 3, 6.5, 21.0, 6.5, 23.0);
  qword_21CB0 = v979;
  unk_21CB8 = v980;
  objc_msgSend(v3, "scaledSize:withOverride:forSizeClass:", 3, 6.5, 18.0, 6.5, 20.0);
  qword_21CC0 = v981;
  unk_21CC8 = v982;
  objc_msgSend(v3, "scaledSize:withOverride:forSizeClass:", 3, 5.5, 19.0, 6.0, 22.0);
  qword_21D90 = v983;
  unk_21D98 = v984;
  [v3 scaledValue:18.0];
  qword_21DA0 = v985;
  v986 = (double *)&qword_21DB8;
  uint64_t v987 = -60;
  do
  {
    v1008[0] = &off_1ADB0;
    v1008[1] = &off_1ADC8;
    v1009[0] = &off_1B780;
    v1009[1] = &off_1B780;
    v988 = +[NSDictionary dictionaryWithObjects:v1009 forKeys:v1008 count:2];
    [v3 scaledValue:v988 withOverrides:1.5];

    [v3 scaledValue:8.0];
    if (-858993459 * (v987 + 60) <= 0x33333333) {
      [v3 scaledValue:10.5];
    }
    NTKScreenRadiusAtAngleWithInset();
    double v990 = v989;
    NTKScreenRadiusAtAngleWithInset();
    v986[60] = v990;
    v986[120] = v990 - v991;
    *v986++ = ((double)(unint64_t)(v987 + 60) + (double)(unint64_t)(v987 + 60)) * 3.14159265 / 60.0
            + -1.57079633;
  }
  while (!__CFADD__(v987++, 1));
  [v3 scaledValue:3.0];
  qword_22358 = v993;
  [v3 scaledValue:3.5];
  qword_22360 = v994;
  [v3 scaledValue:3 withOverride:3.0 forSizeClass:3.5];
  qword_22368 = v995;
  [v3 scaledValue:3 withOverride:3.0 forSizeClass:3.5];
  qword_22370 = v996;
  [v3 scaledValue:3 withOverride:5.0 forSizeClass:6.0];
  qword_22378 = v997;
  [v3 scaledValue:3 withOverride:7.0 forSizeClass:8.0];
  qword_22380 = v998;
  [v3 scaledValue:3 withOverride:77.5 forSizeClass:88.0];
  qword_21DA8 = v999;
  [v3 scaledValue:3 withOverride:81.0526316 forSizeClass:94.7368421];
  qword_21DB0 = v1000;
  [v3 scaledValue:2.5];
  qword_223A8 = v1001;
  [v3 scaledValue:2.5];
  qword_223B0 = v1002;
  objc_msgSend(v3, "scaledSize:", 21.0, 24.0);
  qword_22388 = v1003;
  qword_22390 = v1004;
  objc_msgSend(v3, "scaledSize:", 19.0, 19.0);
  qword_22398 = v1005;
  qword_223A0 = v1006;
}

id sub_C0F4(float64x2_t a1, float64_t a2, float64_t a3, float64_t a4)
{
  v19[0] = &off_1ADB0;
  a1.f64[1] = a2;
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v14 = _Q1;
  float64x2_t v18 = vmulq_f64(vaddq_f64(a1, (float64x2_t)xmmword_17860), _Q1);
  id v9 = +[NSValue valueWithBytes:&v18 objCType:"{CGPoint=dd}"];
  v19[1] = &off_1ADC8;
  v20[0] = v9;
  v10.f64[0] = a3;
  v10.f64[1] = a4;
  float64x2_t v17 = vmulq_f64(vaddq_f64(v10, (float64x2_t)xmmword_17870), v14);
  uint64_t v11 = +[NSValue valueWithBytes:&v17 objCType:"{CGPoint=dd}"];
  v20[1] = v11;
  float64x2_t v12 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

void sub_C540(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_22410);
  id WeakRetained = objc_loadWeakRetained(&qword_22418);
  if (WeakRetained)
  {
    float64x2_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_22418);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_22420;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_22418, obj);
  qword_22420 = (uint64_t)[obj version];

  sub_F7C8(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_22410);
  long long v10 = *(_OWORD *)&qword_223E8;
  *(_OWORD *)a2 = xmmword_223D8;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_223F8;
  *(void *)(a2 + 48) = qword_22408;
}

void sub_D360(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [v5 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v7 = [v9 isEqualToString:NTKComplicationSlotSubdialBottom];

    if (!v7) {
      goto LABEL_5;
    }
    [*(id *)(a1 + 32) setComplicationColor:*(void *)(a1 + 40)];
    id v8 = [*(id *)(a1 + 32) complicationColor];
    [*(id *)(a1 + 32) setInterpolatedComplicationColor:v8];

    [*(id *)(a1 + 32) setAlternateComplicationColor:*(void *)(a1 + 48)];
    id v6 = [v5 display];
    [v6 updateMonochromeColor];
  }

LABEL_5:
}

void sub_D4E4(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [v5 display];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___NTKUtilityComplicationView])
  {
    unsigned int v7 = [v8 isEqualToString:NTKComplicationSlotBezel];

    if (!v7) {
      goto LABEL_5;
    }
    id v6 = [v5 display];
    [v6 setForegroundColor:*(void *)(a1 + 32)];
  }

LABEL_5:
}

void sub_DD74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (([v5 isEqualToString:NTKComplicationSlotBezel] & 1) == 0
    && ([v5 isEqualToString:NTKComplicationSlotTopLeft] & 1) == 0
    && ([v5 isEqualToString:NTKComplicationSlotTopRight] & 1) == 0
    && ([v5 isEqualToString:NTKComplicationSlotBottomRight] & 1) == 0)
  {
    [v5 isEqualToString:NTKComplicationSlotBottomLeft];
  }
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v4, "setAlpha:");
}

void sub_EFCC(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v4 = [v11 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [v11 display];
  unsigned int v7 = v6;
  if (isKindOfClass)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v6 label];
    [v9 setTextColor:v8];
  }
  else
  {
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    unsigned int v7 = [v11 display];
    [v7 setTextColor:*(void *)(a1 + 32)];
  }

LABEL_6:
}

void sub_F7C8(uint64_t a1, uint64_t a2)
{
  id v7 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v7 scaledValue:3 withOverride:135.0 forSizeClass:154.0];
  *(void *)&xmmword_223D8 = v2;
  [v7 scaledValue:3 withOverride:158.0 forSizeClass:180.0];
  *((void *)&xmmword_223D8 + 1) = v3;
  [v7 scaledValue:3 withOverride:162.0 forSizeClass:184.0];
  qword_223E8 = v4;
  [v7 scaledValue:3 withOverride:35.5 forSizeClass:38.5];
  qword_223F0 = 0;
  *(void *)&xmmword_223F8 = v5;
  [v7 scaledValue:3 withOverride:-61.5 forSizeClass:-67.0];
  *((double *)&xmmword_223F8 + 1) = v6;
  *(double *)&qword_22408 = v6 + 10.0;
}

void sub_F920(id a1)
{
  qword_22428 = +[NTKFontLoader fontDescriptorForSectName:@"__SFNumeralsB" fromMachO:&dword_0];

  _objc_release_x1();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

void CGPathRelease(CGPathRef path)
{
}

uint64_t CLKAddPoints()
{
  return _CLKAddPoints();
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleCurrentNumberSystem()
{
  return _CLKLocaleCurrentNumberSystem();
}

uint64_t CLKLocaleNumberSystemForFirstLanguage()
{
  return _CLKLocaleNumberSystemForFirstLanguage();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSimpleTextComplicationTypes()
{
  return _NTKAllSimpleTextComplicationTypes();
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

uint64_t NTKScreenRadiusAtAngleWithInset()
{
  return _NTKScreenRadiusAtAngleWithInset();
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

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double sin(long double __x)
{
  return _sin(__x);
}

long double tan(long double __x)
{
  return _tan(__x);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__createLayer(void *a1, const char *a2, ...)
{
  return [a1 _createLayer];
}

id objc_msgSend__disabledLayerActions(void *a1, const char *a2, ...)
{
  return [a1 _disabledLayerActions];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__removeCaliforniaContentView(void *a1, const char *a2, ...)
{
  return [a1 _removeCaliforniaContentView];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__setupBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _setupBackgroundView];
}

id objc_msgSend__setupCaliforniaContentView(void *a1, const char *a2, ...)
{
  return [a1 _setupCaliforniaContentView];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__updateDialTicksForBezelText(void *a1, const char *a2, ...)
{
  return [a1 _updateDialTicksForBezelText];
}

id objc_msgSend_addTicksIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 addTicksIfNeeded];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_applyColorOnAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 applyColorOnAnalogHands];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_backgroundView(void *a1, const char *a2, ...)
{
  return [a1 backgroundView];
}

id objc_msgSend_bezelComplication(void *a1, const char *a2, ...)
{
  return [a1 bezelComplication];
}

id objc_msgSend_bezelComplicationTextWidthInRadians(void *a1, const char *a2, ...)
{
  return [a1 bezelComplicationTextWidthInRadians];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_californiaContentView(void *a1, const char *a2, ...)
{
  return [a1 californiaContentView];
}

id objc_msgSend_californiaContentViewScale(void *a1, const char *a2, ...)
{
  return [a1 californiaContentViewScale];
}

id objc_msgSend_centerPoint(void *a1, const char *a2, ...)
{
  return [a1 centerPoint];
}

id objc_msgSend_circleDiameter(void *a1, const char *a2, ...)
{
  return [a1 circleDiameter];
}

id objc_msgSend_circularBackground(void *a1, const char *a2, ...)
{
  return [a1 circularBackground];
}

id objc_msgSend_circularComplication(void *a1, const char *a2, ...)
{
  return [a1 circularComplication];
}

id objc_msgSend_circularComplicationSecondary(void *a1, const char *a2, ...)
{
  return [a1 circularComplicationSecondary];
}

id objc_msgSend_circularDialSubtickColor(void *a1, const char *a2, ...)
{
  return [a1 circularDialSubtickColor];
}

id objc_msgSend_circularDialTickColor(void *a1, const char *a2, ...)
{
  return [a1 circularDialTickColor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clockHands(void *a1, const char *a2, ...)
{
  return [a1 clockHands];
}

id objc_msgSend_clockHandsInlay(void *a1, const char *a2, ...)
{
  return [a1 clockHandsInlay];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
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

id objc_msgSend_cornerComplication(void *a1, const char *a2, ...)
{
  return [a1 cornerComplication];
}

id objc_msgSend_cornerComplicationSecondary(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationSecondary];
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

id objc_msgSend_dialShape(void *a1, const char *a2, ...)
{
  return [a1 dialShape];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_fadeInHourMarkersCenterPoints(void *a1, const char *a2, ...)
{
  return [a1 fadeInHourMarkersCenterPoints];
}

id objc_msgSend_fadeOutHourMarkersCenterPoints(void *a1, const char *a2, ...)
{
  return [a1 fadeOutHourMarkersCenterPoints];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fraction(void *a1, const char *a2, ...)
{
  return [a1 fraction];
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

id objc_msgSend_hourMarkersCount(void *a1, const char *a2, ...)
{
  return [a1 hourMarkersCount];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_isBlackBackground(void *a1, const char *a2, ...)
{
  return [a1 isBlackBackground];
}

id objc_msgSend_isCircularDialWithBezel(void *a1, const char *a2, ...)
{
  return [a1 isCircularDialWithBezel];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_largeTick(void *a1, const char *a2, ...)
{
  return [a1 largeTick];
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

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_removeHourMarkers(void *a1, const char *a2, ...)
{
  return [a1 removeHourMarkers];
}

id objc_msgSend_removeTemporaryHourMarkers(void *a1, const char *a2, ...)
{
  return [a1 removeTemporaryHourMarkers];
}

id objc_msgSend_resolvedAutomaticStyleForCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 resolvedAutomaticStyleForCurrentLocale];
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

id objc_msgSend_sfNumeralsBoldFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 sfNumeralsBoldFontDescriptor];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_simpleTextComplication(void *a1, const char *a2, ...)
{
  return [a1 simpleTextComplication];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smallTick(void *a1, const char *a2, ...)
{
  return [a1 smallTick];
}

id objc_msgSend_smallTickCircular(void *a1, const char *a2, ...)
{
  return [a1 smallTickCircular];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_styleTransitionHandler(void *a1, const char *a2, ...)
{
  return [a1 styleTransitionHandler];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
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

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
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

id objc_msgSend_verticalCenterOffset(void *a1, const char *a2, ...)
{
  return [a1 verticalCenterOffset];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}