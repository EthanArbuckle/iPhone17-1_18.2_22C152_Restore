void sub_2D00(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void v4[6];

  [*(id *)(a1 + 32) _loadLayoutRules];
  [*(id *)(a1 + 32) bounds];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2DF8;
  v4[3] = &unk_10538;
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v2;
  v3 = objc_retainBlock(v4);
  qword_15770 = ((double (*)(void *, void))v3[2])(v3, NTKComplicationSlotTopLeft);
  qword_15778 = ((double (*)(void *, void))v3[2])(v3, NTKComplicationSlotCenter);
  qword_15780 = ((double (*)(void *, void))v3[2])(v3, NTKComplicationSlotBottomLeft);
}

CGFloat sub_2DF8(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) complicationLayoutforSlot:a2];
  v4 = [v3 defaultLayoutRuleForState:0];
  [v4 referenceFrame];
  CGFloat v5 = CGRectGetMidY(v7) / *(double *)(a1 + 40);

  return v5;
}

void sub_30F4(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_158F0);
  id WeakRetained = objc_loadWeakRetained(&qword_158F8);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_158F8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_15900;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_158F8, obj);
  qword_15900 = (uint64_t)[obj version];

  sub_667C(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_158F0);
  memcpy(a2, &qword_157A0, 0x150uLL);
}

void sub_3BD8(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  id v7 = [v4 device];
  sub_30F4(v7, v10);
  double v5 = v11;
  id v6 = [*(id *)(a1 + 32) device];
  sub_30F4(v6, v8);
  [v4 _loadLayoutRulesForState:a2 withTopGap:v5 largeModuleHeight:v9];
}

void sub_47D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  [v4 setAlpha:*(double *)(a1 + 32)];
}

void sub_49D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  [v4 setAlpha:*(double *)(a1 + 32)];
}

void sub_4E28(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 display];
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___CDRichComplicationTintedPlatterColorOverridable])objc_msgSend(v6, "setTintedFraction:", *(double *)(a1 + 48)); {
  objc_opt_class();
  }
  if (objc_opt_isKindOfClass())
  {
    [v6 transitionToMonochromeWithFraction:*(double *)(a1 + 56)];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = v6;
      [v5 setTextColor:v4];
      [v5 setAccentColor:*(void *)(a1 + 40)];
    }
  }
}

void sub_5488(uint64_t a1, uint64_t a2)
{
  id v13 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  v3 = [v13 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [v13 display];
  id v6 = v5;
  if (isKindOfClass)
  {
    if (*(unsigned char *)(a1 + 48)) {
      [v5 transitionToMonochromeWithFraction:*(double *)(a1 + 40)];
    }
    else {
      [v5 updateMonochromeColor];
    }
  }
  else
  {
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();

    if ((v7 & 1) == 0) {
      goto LABEL_11;
    }
    id v6 = [v13 display];
    id v8 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      double v9 = [v8 _defaultDateTextColor];
      v10 = [*(id *)(a1 + 32) complicationColor];
      double v11 = NTKInterpolateBetweenColors();
    }
    else
    {
      double v11 = [v8 interpolatedComplicationColor];
    }
    [v6 setTextColor:v11];

    v12 = [*(id *)(a1 + 32) _defaultDateAccentColor];
    [v6 setAccentColor:v12];
  }
LABEL_11:
}

void sub_5C18(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timeView];
  [v2 setAlpha:0.33];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5CC4;
  v4[3] = &unk_10620;
  v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 enumerateComplicationDisplayWrappersWithBlock:v4];
}

void sub_5CC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = [v6 display];
  id v5 = *(void **)(a1 + 32);

  if (v4 != v5) {
    [v6 setAlpha:0.33];
  }
}

id sub_5DC8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timeView];
  [v2 setAlpha:1.0];

  v3 = *(void **)(a1 + 32);

  return [v3 enumerateComplicationDisplayWrappersWithBlock:&stru_106C8];
}

void sub_5E20(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

id sub_5EEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

void sub_606C(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isEqualToString:NTKComplicationSlotDate] & 1) == 0)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v4 = +[NTKComplication nullComplication];
    [v3 setComplication:v4 forSlot:v5];
  }
}

void sub_61E4(id a1, NTKFaceViewController *a2)
{
  v2 = a2;
  [(NTKFaceViewController *)v2 setDataMode:3];
  [(NTKFaceViewController *)v2 setShowsCanonicalContent:1];
  [(NTKFaceViewController *)v2 setShowContentForUnadornedSnapshot:1];
  [(NTKFaceViewController *)v2 setShowsLockedUI:0];
  [(NTKFaceViewController *)v2 setIgnoreSnapshotImages:1];
  [(NTKFaceViewController *)v2 setShouldUseSampleTemplate:1];
}

void sub_667C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  NTKWhistlerSubdialComplicationContentDiameter();
  qword_157C8 = v4;
  unk_157D0 = v4;
  v66[0] = &off_12150;
  v66[1] = &off_12168;
  v67[0] = &off_11140;
  v67[1] = &off_11140;
  v66[2] = &off_12180;
  v66[3] = &off_12198;
  v67[2] = &off_11150;
  v67[3] = &off_11160;
  v66[4] = &off_121B0;
  v66[5] = &off_121C8;
  v67[4] = &off_11140;
  v67[5] = &off_11170;
  id v5 = +[NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:6];
  [v3 scaledValue:v5 withOverrides:5.0];
  qword_157E8 = v6;

  v49 = v2;
  if ((unint64_t)[v2 sizeClass] < 6)
  {
    v64[0] = &off_12150;
    v64[1] = &off_12168;
    v65[0] = &off_11180;
    v65[1] = &off_11190;
    v64[2] = &off_12180;
    v65[2] = &off_111A0;
    double v9 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:3];
    [v3 scaledValue:v9 withOverrides:13.0];
    double v8 = v10;
  }
  else
  {
    [v2 screenBounds];
    double v8 = (v7 + *(double *)&qword_157C8 * -3.0 + *(double *)&qword_157E8 * -2.0) * 0.5;
  }
  v62[0] = &off_12150;
  v62[1] = &off_12168;
  v63[0] = &off_11140;
  v63[1] = &off_11140;
  v62[2] = &off_12180;
  v62[3] = &off_12198;
  v63[2] = &off_11150;
  v63[3] = &off_111B0;
  v62[4] = &off_121B0;
  v62[5] = &off_121C8;
  v63[4] = &off_11140;
  v63[5] = &off_111B0;
  double v11 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:6];
  [v3 scaledValue:v11 withOverrides:5.0];
  uint64_t v13 = v12;

  qword_157A0 = *(void *)&v8;
  *(void *)algn_157A8 = v13;
  qword_157B0 = *(void *)&v8;
  unk_157B8 = v8 * 0.7;
  v60[0] = &off_12150;
  v60[1] = &off_12168;
  v61[0] = &off_111C0;
  v61[1] = &off_111C0;
  v60[2] = &off_12180;
  v60[3] = &off_12198;
  v61[2] = &off_111D0;
  v61[3] = &off_111E0;
  v60[4] = &off_121B0;
  v60[5] = &off_121C8;
  v61[4] = &off_111C0;
  v61[5] = &off_111D0;
  v14 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:6];
  [v3 scaledValue:v14 withOverrides:29.0];
  qword_157C0 = v15;

  NTKWhistlerLargeRectangularComplicationSize();
  qword_157D8 = v16;
  unk_157E0 = v17;
  __asm { FMOV            V0.2D, #4.0 }
  xmmword_15860 = _Q0;
  unk_15870 = _Q0;
  v58[0] = &off_12150;
  v58[1] = &off_12168;
  v58[2] = &off_12180;
  v59[0] = &off_11140;
  v59[1] = &off_11150;
  v58[3] = &off_12198;
  v58[4] = &off_121B0;
  v59[2] = &off_111F0;
  v59[3] = &off_11200;
  v58[5] = &off_121C8;
  v59[4] = &off_11150;
  v59[5] = &off_11210;
  v23 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:6];
  [v3 scaledValue:v23 withOverrides:5.0];
  qword_157F0 = v24;

  v56[0] = &off_121E0;
  v56[1] = &off_121F8;
  v57[0] = &off_11220;
  v57[1] = &off_11230;
  v56[2] = &off_12150;
  v56[3] = &off_12168;
  v57[2] = &off_11240;
  v57[3] = &off_11250;
  v56[4] = &off_12180;
  v56[5] = &off_12198;
  v57[4] = &off_11260;
  v57[5] = &off_11260;
  v56[6] = &off_121B0;
  v56[7] = &off_121C8;
  v57[6] = &off_11270;
  v57[7] = &off_11260;
  v25 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:8];
  [v3 scaledValue:v25 withOverrides:63.0];
  qword_157F8 = v26;

  v54[0] = &off_12150;
  v27 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 8.0, 10.5);
  v55[0] = v27;
  v54[1] = &off_12168;
  v28 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 8.0, 12.0);
  v55[1] = v28;
  v54[2] = &off_12180;
  v29 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 8.0, 16.0);
  v55[2] = v29;
  v54[3] = &off_12198;
  v30 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 17.0, 15.5);
  v55[3] = v30;
  v54[4] = &off_121B0;
  v31 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 8.0, 12.0);
  v55[4] = v31;
  v54[5] = &off_121C8;
  v32 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", 14.5, 15.5);
  v55[5] = v32;
  v33 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:6];
  objc_msgSend(v3, "scaledSize:withOverrides:", v33, 7.5, 6.5);
  *(void *)&xmmword_15800 = v34;
  *((void *)&xmmword_15800 + 1) = v35;

  [v3 scaledValue:3 withOverride:10.5 forSizeClass:10.0];
  __asm { FMOV            V2.2D, #10.0 }
  _Q2.f64[0] = v37;
  xmmword_15810 = (__int128)vaddq_f64(_Q2, (float64x2_t)xmmword_15800);
  [v3 scaledValue:3 withOverride:2.0 forSizeClass:2.5];
  double v39 = v38;
  NTKKeylineWidth();
  *(double *)&qword_15820 = v39 + v40;
  unk_15828 = v39 + v40;
  *(double *)&qword_15830 = v39 + v40;
  unk_15838 = v39 + v40;
  *(double *)&qword_15840 = v39 + v40;
  unk_15848 = v39 + v40 + 3.0;
  *(double *)&qword_15850 = v39 + v40;
  unk_15858 = v39 + v40 + 3.0;
  [v49 screenBounds];
  double v42 = v41 - *(double *)&qword_157C8 - *(double *)&qword_157E8 - v8 - *(double *)&xmmword_15800;
  [v3 scaledValue:22.0];
  qword_15880 = *(void *)&v42;
  unk_15888 = v43;
  v52[0] = &off_12150;
  v52[1] = &off_12168;
  v53[0] = &off_11280;
  v53[1] = &off_11290;
  v52[2] = &off_12180;
  v52[3] = &off_12198;
  v53[2] = &off_112A0;
  v53[3] = &off_112A0;
  v52[4] = &off_121B0;
  v52[5] = &off_121C8;
  v53[4] = &off_112B0;
  v53[5] = &off_112C0;
  v44 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:6];
  [v3 scaledValue:v44 withOverrides:16.5];
  qword_15890 = v45;

  v50[0] = &off_12150;
  v50[1] = &off_12168;
  v51[0] = &off_112D0;
  v51[1] = &off_112E0;
  v50[2] = &off_12180;
  v50[3] = &off_12198;
  v51[2] = &off_112F0;
  v51[3] = &off_112F0;
  v50[4] = &off_121B0;
  v50[5] = &off_121C8;
  v51[4] = &off_112E0;
  v51[5] = &off_112F0;
  v46 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:6];
  [v3 scaledValue:v46 withOverrides:45.0];
  qword_15898 = v47;

  *(double *)&qword_158A0 = -*((double *)&xmmword_15800 + 1);
  unk_158A8 = *(double *)&qword_15880 * -0.5;
  qword_158B0 = 0;
  *(double *)&qword_158B8 = -*(double *)&xmmword_15800;
  qword_158C0 = 0x4008000000000000;
  unk_158C8 = 0;
  qword_158D0 = 0;
  unk_158D8 = 0;
  qword_158E0 = 0x4020000000000000;
  [v49 screenBounds];
  +[NTKGossamerColorPalette contentScaleForTintedBackground];
  CLKFloorForDevice();
  qword_158E8 = v48;
}

uint64_t sub_794C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[NTKPigmentEditOption pigmentNamed:a2];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_79B4(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) defaultFaceForDevice:*(void *)(a1 + 40)];
  double v7 = v6;
  if (v6)
  {
    [v6 selectOption:v5 forCustomEditMode:10 slot:0];
    v74 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:*(void *)(a1 + 40)];
    objc_msgSend(v7, "selectOption:forCustomEditMode:slot:");
    double v8 = +[NTKComplication anyComplicationOfType:7];
    double v9 = +[NTKComplication anyComplicationOfType:18];
    double v10 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.depth" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
    uint64_t v73 = _complicationOrDie(v10);

    if ([*(id *)(a1 + 40) supportsUrsa])
    {
      double v11 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaCompassBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
      uint64_t v72 = _complicationOrDie(v11);
    }
    else
    {
      uint64_t v72 = _complicationOrDie(0);
    }
    uint64_t v12 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.Depth.temperature" appBundleIdentifier:@"com.apple.Depth" complicationDescriptor:0];
    v75 = _complicationOrDie(v12);

    switch(a3 & 7)
    {
      case 1:
        v70 = v9;
        v102[0] = NTKComplicationSlotTopLeft;
        v102[1] = NTKComplicationSlotBottomCenter;
        v103[0] = &off_11820;
        v103[1] = &off_11838;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:2];
        if ([*(id *)(a1 + 40) supportsUrsa])
        {
          v44 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKComplicationCompassSmartWaypointIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
          uint64_t v45 = _complicationOrDie(v44);
        }
        else
        {
          uint64_t v45 = _complicationOrDie(0);
        }
        if ([*(id *)(a1 + 40) supportsUrsa])
        {
          v59 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:@"com.apple.NanoCompass.complications.altitude" appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
          v60 = _complicationOrDie(v59);
        }
        else
        {
          v60 = _complicationOrDie(0);
        }
        uint64_t v17 = (void *)v72;
        v23 = (void *)v73;
        v100[0] = NTKComplicationSlotCenter;
        v100[1] = NTKComplicationSlotBottomLeft;
        v101[0] = v45;
        v101[1] = v60;
        v100[2] = NTKComplicationSlotBottomRight;
        v101[2] = v72;
        v22 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];

        double v9 = v70;
        break;
      case 2:
        v98[0] = NTKComplicationSlotTopLeft;
        v98[1] = NTKComplicationSlotCenter;
        v99[0] = &off_11850;
        v99[1] = &off_11868;
        v98[2] = NTKComplicationSlotBottomLeft;
        v98[3] = NTKComplicationSlotBottomCenter;
        v99[2] = &off_11880;
        v99[3] = &off_11898;
        v98[4] = NTKComplicationSlotBottomRight;
        v99[4] = &off_118B0;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:5];
        v22 = 0;
        goto LABEL_32;
      case 3:
        uint64_t v96 = NTKComplicationSlotTopLeft;
        v97 = &off_118C8;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        id v68 = v5;
        v25 = v9;
        id v26 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.boardwalk.watchapp.widgets" containerBundleIdentifier:@"com.apple.boardwalk.watchapp" kind:@"Tides" intent:0];
        v27 = +[NTKWidgetComplication complicationWithDescriptor:v26];
        v28 = _complicationOrDie(v27);

        v94[0] = NTKComplicationSlotCenter;
        v94[1] = NTKComplicationSlotBottomLeft;
        uint64_t v17 = (void *)v72;
        v95[0] = v28;
        v95[1] = v72;
        v94[2] = NTKComplicationSlotBottomCenter;
        unsigned int v29 = [*(id *)(a1 + 40) supportsCharon];
        v30 = v75;
        if (!v29) {
          v30 = v8;
        }
        v95[2] = v30;
        v94[3] = NTKComplicationSlotBottomRight;
        if ([*(id *)(a1 + 40) supportsCharon]) {
          uint64_t v31 = v73;
        }
        else {
          uint64_t v31 = (uint64_t)v25;
        }
        v95[3] = v31;
        v22 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:4];

        double v9 = v25;
        id v5 = v68;

        v23 = (void *)v73;
        break;
      case 4:
        v92[0] = NTKComplicationSlotTopLeft;
        v92[1] = NTKComplicationSlotBottomLeft;
        v93[0] = &off_118E0;
        v93[1] = &off_118F8;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
        id v65 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.weather.watchapp.widgets" containerBundleIdentifier:@"com.apple.weather.watchapp" kind:@"com.apple.weather.widget.threeup" intent:0];
        +[NTKWidgetComplication complicationWithDescriptor:v65];
        v69 = v9;
        v33 = v32 = v8;
        uint64_t v34 = _complicationOrDie(v33);

        id v35 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.weather.watchapp.widgets" containerBundleIdentifier:@"com.apple.weather.watchapp" kind:@"com.apple.weather.widget.humidity" intent:0];
        v36 = +[NTKWidgetComplication complicationWithDescriptor:v35];
        float64_t v37 = _complicationOrDie(v36);

        v90[0] = NTKComplicationSlotCenter;
        v90[1] = NTKComplicationSlotBottomCenter;
        v91[0] = v34;
        v91[1] = v37;
        v90[2] = NTKComplicationSlotBottomRight;
        if ([*(id *)(a1 + 40) supportsCharon]) {
          uint64_t v38 = v73;
        }
        else {
          uint64_t v38 = (uint64_t)v32;
        }
        v91[2] = v38;
        v22 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:3];

        double v8 = v32;
        double v9 = v69;

        v23 = (void *)v73;
        goto LABEL_33;
      case 5:
        v88[0] = NTKComplicationSlotTopLeft;
        v88[1] = NTKComplicationSlotCenter;
        v89[0] = &off_11910;
        v89[1] = &off_11928;
        v88[2] = NTKComplicationSlotBottomLeft;
        v88[3] = NTKComplicationSlotBottomCenter;
        v89[2] = &off_11940;
        v89[3] = &off_11958;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:4];
        id v46 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoTranslate.Widget" containerBundleIdentifier:@"com.apple.NanoTranslate" kind:@"NanoTranslateStaticWidget" intent:0];
        +[NTKWidgetComplication complicationWithDescriptor:v46];
        id v47 = v5;
        v49 = uint64_t v48 = v9;
        v50 = _complicationOrDie(v49);

        double v9 = v48;
        id v5 = v47;
        uint64_t v86 = NTKComplicationSlotBottomRight;
        v87 = v50;
        v22 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];

        goto LABEL_32;
      case 6:
        v84[0] = NTKComplicationSlotTopLeft;
        v84[1] = NTKComplicationSlotBottomRight;
        v85[0] = &off_11970;
        v85[1] = &off_11988;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
        id v64 = [objc_alloc((Class)INAppIntent) initWithAppBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" appIntentIdentifier:@"NHOSmartStackActionIntent" serializedParameters:&off_12588];
        v71 = v9;
        id v62 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.NanoHome.NHOSmartStackActionWidget" intent:v64];
        v51 = +[NTKWidgetComplication complicationWithDescriptor:v62];
        _complicationOrDie(v51);
        v52 = v67 = v8;

        id v53 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoMaps.NanoMapsWidgetKitComplications" containerBundleIdentifier:@"com.apple.NanoMaps" kind:@"NearByTransitComplication" intent:0];
        v54 = +[NTKWidgetComplication complicationWithDescriptor:v53];
        v55 = _complicationOrDie(v54);

        v56 = [*(id *)(a1 + 32) _createTimer15Complication];
        v57 = _complicationOrDie(v56);

        v82[0] = NTKComplicationSlotCenter;
        v82[1] = NTKComplicationSlotBottomLeft;
        v83[0] = v52;
        v83[1] = v55;
        v82[2] = NTKComplicationSlotBottomCenter;
        v83[2] = v57;
        v22 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:3];

        double v9 = v71;
        double v8 = v67;

        goto LABEL_32;
      case 7:
        id v63 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.Mind.MindComplication" containerBundleIdentifier:@"com.apple.Mind" kind:@"MentalHealthLauncherComplication" intent:0];
        double v39 = +[NTKWidgetComplication complicationWithDescriptor:v63];
        double v40 = _complicationOrDie(v39);

        v66 = v8;
        id v61 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget" containerBundleIdentifier:@"com.apple.nanomusicrecognition" kind:@"com.apple.nanomusicrecognition.NanoMusicRecognitionWidget" intent:0];
        double v41 = +[NTKWidgetComplication complicationWithDescriptor:v61];
        id v42 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoHealthBalance.NanoHealthBalanceWidgetExtension" containerBundleIdentifier:@"com.apple.NanoHealthBalance" kind:@"BalanceOneDayWidgetKind" intent:0];
        uint64_t v43 = +[NTKWidgetComplication complicationWithDescriptor:v42];
        v80[0] = NTKComplicationSlotCenter;
        v80[1] = NTKComplicationSlotBottomCenter;
        v81[0] = &off_119A0;
        v81[1] = &off_119B8;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
        v78[0] = NTKComplicationSlotTopLeft;
        v78[1] = NTKComplicationSlotBottomLeft;
        v79[0] = v40;
        v79[1] = v41;
        v78[2] = NTKComplicationSlotBottomRight;
        v79[2] = v43;
        v22 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];

        double v8 = v66;
LABEL_32:
        v23 = (void *)v73;
LABEL_33:
        uint64_t v17 = (void *)v72;
        break;
      default:
        uint64_t v13 = v9;
        id v14 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.boardwalk.watchapp.widgets" containerBundleIdentifier:@"com.apple.boardwalk.watchapp" kind:@"Swell" intent:0];
        uint64_t v15 = +[NTKWidgetComplication complicationWithDescriptor:v14];
        uint64_t v16 = _complicationOrDie(v15);

        uint64_t v17 = (void *)v72;
        v105[0] = v72;
        v104[0] = NTKComplicationSlotTopLeft;
        v104[1] = NTKComplicationSlotCenter;
        if ([*(id *)(a1 + 40) supportsCharon]) {
          uint64_t v18 = v73;
        }
        else {
          uint64_t v18 = (uint64_t)v8;
        }
        v105[1] = v18;
        v105[2] = v16;
        v104[2] = NTKComplicationSlotBottomLeft;
        v104[3] = NTKComplicationSlotBottomCenter;
        unsigned int v19 = [*(id *)(a1 + 40) supportsCharon];
        v20 = v75;
        if (!v19) {
          v20 = v13;
        }
        v105[3] = v20;
        v104[4] = NTKComplicationSlotBottomRight;
        if ([*(id *)(a1 + 40) supportsCharon]) {
          uint64_t v21 = v73;
        }
        else {
          uint64_t v21 = (uint64_t)v8;
        }
        v105[4] = v21;
        v22 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:5];

        double v9 = v13;
        v23 = (void *)v73;
        uint64_t v24 = 0;
        break;
    }
    [v7 _setFaceGalleryComplicationTypesForSlots:v24 canRepeat:1];
    [v7 setComplication:*(void *)(a1 + 48) forSlot:NTKComplicationSlotDate];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_8794;
    v76[3] = &unk_107C8;
    id v58 = v7;
    id v77 = v58;
    [v22 enumerateKeysAndObjectsUsingBlock:v76];
    [*(id *)(a1 + 56) addObject:v58];
  }
}

id _complicationOrDie(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = +[NTKComplication nullComplication];
  }
  uint64_t v4 = v3;

  return v4;
}

id sub_8794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

void sub_87A0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:1 forDevice:*(void *)(a1 + 32)];
  [v5 selectOption:v6 forCustomEditMode:17 slot:0];
  switch(a3)
  {
    case 0:
      v61[0] = NTKComplicationSlotTopLeft;
      v61[1] = NTKComplicationSlotCenter;
      v62[0] = &off_119D0;
      v62[1] = &off_119E8;
      v61[2] = NTKComplicationSlotBottomLeft;
      v61[3] = NTKComplicationSlotBottomCenter;
      v62[2] = &off_11A00;
      v62[3] = &off_11A18;
      v61[4] = NTKComplicationSlotBottomRight;
      v62[4] = &off_11A30;
      double v7 = v62;
      double v8 = v61;
      goto LABEL_27;
    case 1:
      v59[0] = NTKComplicationSlotTopLeft;
      v59[1] = NTKComplicationSlotCenter;
      v60[0] = &off_11A48;
      v60[1] = &off_11A60;
      v59[2] = NTKComplicationSlotBottomCenter;
      v59[3] = NTKComplicationSlotBottomRight;
      v60[2] = &off_11A78;
      v60[3] = &off_11A90;
      double v11 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:4];
      uint64_t v12 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationNoiseBundleIdentifier appBundleIdentifier:NTKBundleComplicationNoiseAppBundleIdentifier complicationDescriptor:0];
      uint64_t v13 = (void *)v12;
      if (!v12) {
        goto LABEL_24;
      }
      uint64_t v57 = NTKComplicationSlotBottomLeft;
      uint64_t v58 = v12;
      id v14 = &v58;
      uint64_t v15 = &v57;
      goto LABEL_20;
    case 2:
      v55[0] = NTKComplicationSlotTopLeft;
      v55[1] = NTKComplicationSlotCenter;
      v56[0] = &off_11AA8;
      v56[1] = &off_11AC0;
      v55[2] = NTKComplicationSlotBottomLeft;
      v55[3] = NTKComplicationSlotBottomRight;
      v56[2] = &off_11AD8;
      v56[3] = &off_11AF0;
      double v11 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:4];
      if (![*(id *)(a1 + 32) supportsUrsa]) {
        goto LABEL_28;
      }
      uint64_t v16 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaCompassBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
      uint64_t v13 = (void *)v16;
      if (!v16) {
        goto LABEL_24;
      }
      uint64_t v53 = NTKComplicationSlotBottomCenter;
      uint64_t v54 = v16;
      id v14 = &v54;
      uint64_t v15 = &v53;
      goto LABEL_20;
    case 3:
      v51[0] = NTKComplicationSlotTopLeft;
      v51[1] = NTKComplicationSlotCenter;
      v52[0] = &off_11B08;
      v52[1] = &off_11B20;
      v51[2] = NTKComplicationSlotBottomRight;
      v52[2] = &off_11B38;
      double v11 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
      if (![*(id *)(a1 + 32) supportsUrsa]) {
        goto LABEL_28;
      }
      uint64_t v13 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaCompassBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
      uint64_t v17 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationWeatherRainBundleIdentifier appBundleIdentifier:NTKBundleComplicationWeatherAppBundleIdentifier complicationDescriptor:0];
      uint64_t v18 = (void *)v17;
      double v10 = 0;
      if (v13 && v17)
      {
        v49[0] = NTKComplicationSlotBottomLeft;
        v49[1] = NTKComplicationSlotBottomCenter;
        v50[0] = v17;
        v50[1] = v13;
        double v10 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
      }

      goto LABEL_25;
    case 4:
      v47[0] = NTKComplicationSlotTopLeft;
      v47[1] = NTKComplicationSlotBottomLeft;
      v48[0] = &off_11B50;
      v48[1] = &off_11B68;
      v47[2] = NTKComplicationSlotBottomCenter;
      v47[3] = NTKComplicationSlotBottomRight;
      v48[2] = &off_11B80;
      v48[3] = &off_11B98;
      double v11 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
      if (![*(id *)(a1 + 32) supportsUrsa]) {
        goto LABEL_28;
      }
      uint64_t v19 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaBearingBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
      uint64_t v13 = (void *)v19;
      if (!v19) {
        goto LABEL_24;
      }
      uint64_t v45 = NTKComplicationSlotCenter;
      uint64_t v46 = v19;
      id v14 = &v46;
      uint64_t v15 = &v45;
      goto LABEL_20;
    case 5:
      v43[0] = NTKComplicationSlotTopLeft;
      v43[1] = NTKComplicationSlotCenter;
      v44[0] = &off_11BB0;
      v44[1] = &off_11BC8;
      v43[2] = NTKComplicationSlotBottomLeft;
      v43[3] = NTKComplicationSlotBottomRight;
      v44[2] = &off_11BE0;
      v44[3] = &off_11BF8;
      double v11 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
      if (![*(id *)(a1 + 32) supportsUrsa]) {
        goto LABEL_28;
      }
      uint64_t v20 = +[NTKBundleComplication bundledComplicationWithBundleIdentifier:NTKBundleComplicationUrsaCompassBundleIdentifier appBundleIdentifier:NTKBundleComplicationUrsaAppBundleIdentifier complicationDescriptor:0];
      uint64_t v13 = (void *)v20;
      if (v20)
      {
        uint64_t v41 = NTKComplicationSlotBottomCenter;
        uint64_t v42 = v20;
        id v14 = &v42;
        uint64_t v15 = &v41;
LABEL_20:
        double v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v15 count:1];
      }
      else
      {
LABEL_24:
        double v10 = 0;
      }
LABEL_25:

      double v9 = 0;
LABEL_30:
      [v5 _setFaceGalleryComplicationTypesForSlots:v11 canRepeat:1];
      [v5 setComplication:*(void *)(a1 + 40) forSlot:NTKComplicationSlotDate];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_91AC;
      v31[3] = &unk_10818;
      id v27 = v5;
      id v32 = v27;
      [v10 enumerateKeysAndObjectsUsingBlock:v31];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_91B8;
      v29[3] = &unk_10840;
      id v30 = v27;
      id v28 = v27;
      [v9 enumerateKeysAndObjectsUsingBlock:v29];

      return;
    case 6:
      if (NTKShowCarbonara())
      {
        id v21 = objc_alloc((Class)CLKWidgetComplicationDescriptor);
        v22 = NTKCarbonaraWidgetIntent();
        id v23 = [v21 initWithExtensionBundleIdentifier:@"com.apple.NanoHome.NanoHomeWidgets" containerBundleIdentifier:@"com.apple.NanoHome" kind:@"com.apple.HomeEnergyUI.EnergyForecastComplication" intent:v22];

        uint64_t v24 = +[NTKWidgetComplication complicationWithDescriptor:v23];
        id v25 = [objc_alloc((Class)CLKWidgetComplicationDescriptor) initWithExtensionBundleIdentifier:@"com.apple.NanoMaps.NanoMapsWidgetKitComplications" containerBundleIdentifier:@"com.apple.NanoMaps" kind:@"NearByTransitComplication" intent:0];
        id v26 = +[NTKWidgetComplication complicationWithDescriptor:v25];
        v39[0] = NTKComplicationSlotTopLeft;
        v39[1] = NTKComplicationSlotCenter;
        v40[0] = v24;
        v40[1] = v24;
        v39[2] = NTKComplicationSlotBottomCenter;
        v40[2] = v26;
        double v9 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
        v37[0] = NTKComplicationSlotBottomLeft;
        v37[1] = NTKComplicationSlotBottomRight;
        v38[0] = &off_11C10;
        v38[1] = &off_11C28;
        double v11 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
      }
      else
      {
        v35[0] = NTKComplicationSlotTopLeft;
        v35[1] = NTKComplicationSlotCenter;
        v36[0] = &off_11C40;
        v36[1] = &off_11C58;
        v35[2] = NTKComplicationSlotBottomLeft;
        v35[3] = NTKComplicationSlotBottomCenter;
        v36[2] = &off_11C70;
        v36[3] = &off_11C88;
        v35[4] = NTKComplicationSlotBottomRight;
        v36[4] = &off_11CA0;
        double v7 = v36;
        double v8 = v35;
LABEL_27:
        double v11 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v8 count:5];
LABEL_28:
        double v9 = 0;
      }
      double v10 = 0;
      goto LABEL_30;
    case 7:
      v33[0] = NTKComplicationSlotTopLeft;
      v33[1] = NTKComplicationSlotCenter;
      v34[0] = &off_11CB8;
      v34[1] = &off_11CD0;
      v33[2] = NTKComplicationSlotBottomLeft;
      v33[3] = NTKComplicationSlotBottomCenter;
      v34[2] = &off_11CE8;
      v34[3] = &off_11D00;
      v33[4] = NTKComplicationSlotBottomRight;
      v34[4] = &off_11D18;
      double v7 = v34;
      double v8 = v33;
      goto LABEL_27;
    default:
      double v9 = 0;
      double v10 = 0;
      double v11 = 0;
      goto LABEL_30;
  }
}

id sub_91AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

id sub_91B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setComplication:a3 forSlot:a2];
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

uint64_t CLKFloorForDevice()
{
  return _CLKFloorForDevice();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
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

uint64_t INIntentWithTypedIntent()
{
  return _INIntentWithTypedIntent();
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

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
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

uint64_t NTKShowCarbonara()
{
  return _NTKShowCarbonara();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
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

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
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

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__createTimer15Complication(void *a1, const char *a2, ...)
{
  return [a1 _createTimer15Complication];
}

id objc_msgSend__defaultBackgroundOption(void *a1, const char *a2, ...)
{
  return [a1 _defaultBackgroundOption];
}

id objc_msgSend__defaultColorOption(void *a1, const char *a2, ...)
{
  return [a1 _defaultColorOption];
}

id objc_msgSend__defaultDateAccentColor(void *a1, const char *a2, ...)
{
  return [a1 _defaultDateAccentColor];
}

id objc_msgSend__defaultDateTextColor(void *a1, const char *a2, ...)
{
  return [a1 _defaultDateTextColor];
}

id objc_msgSend__digitalTimeLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _digitalTimeLabelFont];
}

id objc_msgSend__handleLocaleDidChange(void *a1, const char *a2, ...)
{
  return [a1 _handleLocaleDidChange];
}

id objc_msgSend__loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 _loadLayoutRules];
}

id objc_msgSend__updateLocale(void *a1, const char *a2, ...)
{
  return [a1 _updateLocale];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
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

id objc_msgSend_centerAccentColor(void *a1, const char *a2, ...)
{
  return [a1 centerAccentColor];
}

id objc_msgSend_centerApproximateBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 centerApproximateBackgroundColor];
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

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_composedView(void *a1, const char *a2, ...)
{
  return [a1 composedView];
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

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dateLabelAccentColor(void *a1, const char *a2, ...)
{
  return [a1 dateLabelAccentColor];
}

id objc_msgSend_dateLabelTextColor(void *a1, const char *a2, ...)
{
  return [a1 dateLabelTextColor];
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

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_foregroundColor(void *a1, const char *a2, ...)
{
  return [a1 foregroundColor];
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

id objc_msgSend_interpolatedComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 interpolatedComplicationColor];
}

id objc_msgSend_invalidateDigitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 invalidateDigitalTimeLabelStyle];
}

id objc_msgSend_isMulticolor(void *a1, const char *a2, ...)
{
  return [a1 isMulticolor];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_isTinker(void *a1, const char *a2, ...)
{
  return [a1 isTinker];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_loadComplicationPlaceholderViews(void *a1, const char *a2, ...)
{
  return [a1 loadComplicationPlaceholderViews];
}

id objc_msgSend_monochromeFraction(void *a1, const char *a2, ...)
{
  return [a1 monochromeFraction];
}

id objc_msgSend_monochromeRichComplicationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 monochromeRichComplicationsEnabled];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
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

id objc_msgSend_rootDirectory(void *a1, const char *a2, ...)
{
  return [a1 rootDirectory];
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return [a1 scaleFactor];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
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

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_supportsCharon(void *a1, const char *a2, ...)
{
  return [a1 supportsCharon];
}

id objc_msgSend_supportsUrsa(void *a1, const char *a2, ...)
{
  return [a1 supportsUrsa];
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

id objc_msgSend_timeLabelColor(void *a1, const char *a2, ...)
{
  return [a1 timeLabelColor];
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

id objc_msgSend_topApproximateBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 topApproximateBackgroundColor];
}

id objc_msgSend_tritiumPalette(void *a1, const char *a2, ...)
{
  return [a1 tritiumPalette];
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

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewWithLegacyComplicationType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewWithLegacyComplicationType:");
}