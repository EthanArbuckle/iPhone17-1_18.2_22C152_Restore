void sub_29F0(void *a1@<X0>, uint64_t a2@<X8>)
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
  os_unfair_lock_lock((os_unfair_lock_t)&unk_478F8);
  WeakRetained = objc_loadWeakRetained(&qword_47900);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&qword_47900);
    if (v5 == obj)
    {
      v6 = [obj version];
      v7 = qword_47908;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v8 = objc_storeWeak(&qword_47900, obj);
  qword_47908 = (uint64_t)[obj version];

  sub_3DBC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_478F8);
  v10 = *(_OWORD *)&qword_478D0;
  *(_OWORD *)(a2 + 32) = xmmword_478C0;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_478E0;
  *(void *)(a2 + 80) = qword_478F0;
  v11 = *(_OWORD *)&qword_478B0;
  *(_OWORD *)a2 = xmmword_478A0;
  *(_OWORD *)(a2 + 16) = v11;
}

BOOL sub_2BBC(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_2BDC(id a1, unint64_t a2)
{
  return 0xAAAAAAAAAAAAAAABLL * a2 < 0x5555555555555556;
}

NSString *__cdecl sub_2BFC(id a1, unint64_t a2)
{
  if (a2) {
    unint64_t v2 = a2;
  }
  else {
    unint64_t v2 = 12;
  }
  v3 = +[NSNumber numberWithUnsignedInteger:v2];
  v4 = +[NSString localizedStringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

BOOL sub_2D84(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_2DA4(id a1, unint64_t a2)
{
  return 0xAAAAAAAAAAAAAAABLL * a2 < 0x5555555555555556;
}

NSString *__cdecl sub_2DC4(id a1, unint64_t a2)
{
  unint64_t v2 = 5 * a2;
  if (!a2) {
    unint64_t v2 = 60;
  }
  return +[NSString localizedStringWithFormat:@"%02lu", v2];
}

BOOL sub_3064(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_3084(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

id sub_30E0(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"%02lu", [v4 longValue]);

  return v5;
}

BOOL sub_33DC(id a1, unint64_t a2)
{
  return (a2 & 3) == 0;
}

BOOL sub_33E8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

id sub_3444(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = +[NSString localizedStringWithFormat:@"%@", v4];

  return v5;
}

BOOL sub_3698(id a1, unint64_t a2)
{
  return (a2 & 3) == 0;
}

BOOL sub_36A4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

id sub_3700(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = +[NSString localizedStringWithFormat:@"%@", v4];

  return v5;
}

BOOL sub_393C(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_395C(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

id sub_39B8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSNumber numberWithUnsignedInteger:a2];
  v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = +[NSString localizedStringWithFormat:@"%@", v4];

  return v5;
}

BOOL sub_3AF8(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_3B18(id a1, unint64_t a2)
{
  return 0xAAAAAAAAAAAAAAABLL * a2 < 0x5555555555555556;
}

NSString *__cdecl sub_3B38(id a1, unint64_t a2)
{
  if (a2) {
    unint64_t v2 = 5 * a2;
  }
  else {
    unint64_t v2 = 60;
  }
  v3 = +[NSNumber numberWithUnsignedInteger:v2];
  v4 = +[NSString localizedStringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

void sub_3DBC(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:3 forSizeClass:1.13580247];
  objc_msgSend(v2, "scaledSize:", 1.0, 3.5);
  *(void *)&xmmword_478A0 = v3;
  *((void *)&xmmword_478A0 + 1) = v4;
  objc_msgSend(v2, "scaledSize:", 1.0, 2.0);
  qword_478B0 = v5;
  unk_478B8 = v6;
  objc_msgSend(v2, "scaledSize:", 40.0, 40.0);
  *(void *)&xmmword_478C0 = v7;
  *((void *)&xmmword_478C0 + 1) = v8;
  [v2 scaledValue:24.0];
  qword_478D8 = v9;
  [v2 scaledValue:20.0];
  *(void *)&xmmword_478E0 = v10;
  [v2 scaledValue:22.0];
  *((void *)&xmmword_478E0 + 1) = v11;
  [v2 scaledValue:0.5];
  qword_478D0 = v12;
  v15[0] = &off_3A288;
  v15[1] = &off_3A2A0;
  v16[0] = &off_3ACF8;
  v16[1] = &off_3ACF8;
  v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 scaledValue:v13 withOverrides:6.5];
  qword_478F0 = v14;
}

double sub_442C(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47938);
  id WeakRetained = objc_loadWeakRetained(&qword_47940);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_47940);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_47940, v1);
    qword_47948 = (uint64_t)[v1 version];

    sub_5C30(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_47948;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47938);
  double v9 = *(double *)&qword_47920;

  return v9;
}

void sub_5C30(uint64_t a1, void *a2)
{
  id v2 = a2;
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  qword_47920 = v3;
  id v6 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];

  [v6 setRoundingBehavior:2];
  objc_msgSend(v6, "scaledSize:withOverride:forSizeClass:", 3, 160.0, 195.0, 180.0, 220.0);
  qword_47928 = v4;
  qword_47930 = v5;
}

uint64_t sub_5DE4()
{
  qword_47950 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_5EF4(id a1)
{
  v3[0] = &off_3A2E8;
  v3[1] = &off_3A300;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  v3[2] = &off_3A318;
  v3[3] = &off_3A330;
  v4[2] = NTKFaceBundleStyle3;
  v4[3] = NTKFaceBundleStyle4;
  v3[4] = &off_3A348;
  v4[4] = NTKFaceBundleStyle5;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:5];
  id v2 = (void *)qword_47970;
  qword_47970 = v1;
}

void sub_610C(id a1)
{
  qword_47980 = objc_alloc_init(NTKAlaskanComplicationsConfiguration);

  _objc_release_x1();
}

void sub_6520(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___NTKSalmonColorEditOption;
  uint64_t v2 = objc_msgSendSuper2(&v4, "_orderedValuesForDevice:", a2);
  uint64_t v3 = (void *)qword_47990;
  qword_47990 = v2;
}

void sub_6CDC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_479E0);
  id WeakRetained = objc_loadWeakRetained(&qword_479E8);
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_479E8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_479F0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_479E8, obj);
  qword_479F0 = (uint64_t)[obj version];

  sub_8308(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_479E0);
  long long v10 = *(_OWORD *)&qword_479C8;
  *(_OWORD *)a2 = xmmword_479B8;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_479D8;
}

void sub_8308(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v9 setScale:3 forSizeClass:1.13580247];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v4 = v3;

  *(void *)&xmmword_479B8 = v4;
  [v9 scaledValue:20.0];
  *((void *)&xmmword_479B8 + 1) = v5;
  [v9 scaledValue:40.0];
  qword_479C8 = v6;
  [v9 scaledValue:32.0];
  qword_479D0 = v7;
  [v9 scaledValue:12.0];
  qword_479D8 = v8;
}

void sub_850C(id a1)
{
  qword_479F8 = (uint64_t)[objc_alloc((Class)NTKCornerComplicationConfiguration) initWithTopLeftComplication:43 topRightComplication:10 bottomLeftComplication:3 bottomRightComplication:7];

  _objc_release_x1();
}

void sub_9240(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_932C(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_9E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9E68(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCrownInputHandlerProgress:a2 / 360.0];
}

void sub_A034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_A050(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained diverView];
  [v6 updateTicksForCurrentTime];

  [WeakRetained updateTimeViewHandsVisibility];
}

void sub_A0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_A0E8(id a1)
{
  return (NSString *)@"NTKAlaskanDiverStyleController Minute Updates";
}

NSString *__cdecl sub_A0F4(id a1)
{
  return (NSString *)@"NTKAlaskanDiverStyleController Second Updates";
}

void sub_A548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A570(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCrownInputHandlerProgress:a2 / 360.0];
}

void sub_A5C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained diverView];
  [v2 setStartDate:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

void sub_A8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A8D8(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_A8E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained faceView];
    uint64_t v4 = [v3 timeView];
    uint64_t v5 = [v4 secondHandView];
    [v5 setAlpha:0.0];

    CGAffineTransformMakeScale(&v10, 0.9, 0.9);
    uint64_t v6 = [v2 faceView];
    id v7 = [v6 timeView];
    CGAffineTransform v9 = v10;
    [v7 setTransform:&v9];

    uint64_t v8 = [v2 faceView];
    [v8 changeComplicationsAlpha:NTKEditModeDimmedAlpha];

    [v2 updateTimeViewHandsVisibility];
  }
}

void sub_A9DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained diverView];
    [v2 setHasRotatedToMinuteHand:1];

    id WeakRetained = v3;
  }
}

void sub_ABB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_ABDC(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained updateCrownInputHandlerProgress:a2 / 360.0];
    id WeakRetained = v4;
  }
}

void sub_AC38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updateCrownInputHandlerProgress:*(double *)(a1 + 40) / 360.0];
    [v3 setAnimationInProgress:0];
    id WeakRetained = v3;
  }
}

void sub_B090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_B0B4(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_B0C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained diverView];
  id v3 = [v2 currentMode];

  if (!v3)
  {
    id v4 = [WeakRetained faceView];
    uint64_t v5 = [v4 timeView];
    uint64_t v6 = [v5 secondHandView];
    [v6 setAlpha:1.0];

    id v7 = [WeakRetained faceView];
    uint64_t v8 = [v7 timeView];
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v11[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v8 setTransform:v11];

    [WeakRetained updateTimeViewHandsVisibility];
  }
  uint64_t v10 = [WeakRetained faceView];
  [v10 changeComplicationsAlpha:1.0];
}

void sub_B1BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained diverView];
    [v2 setHasRotatedToMinuteHand:0];

    id WeakRetained = v3;
  }
}

uint64_t sub_B21C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_B5FC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47A38);
  id WeakRetained = objc_loadWeakRetained(&qword_47A40);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_47A40);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_47A48;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_47A40, obj);
  qword_47A48 = (uint64_t)[obj version];

  sub_CE5C(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47A38);
  long long v10 = *(_OWORD *)&qword_47A20;
  *(_OWORD *)a2 = xmmword_47A10;
  *(_OWORD *)(a2 + 16) = v10;
  *(void *)(a2 + 32) = qword_47A30;
}

void sub_CE5C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v9 setScale:3 forSizeClass:1.13580247];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v4 = v3;

  *(void *)&xmmword_47A10 = v4;
  [v9 scaledValue:20.0];
  *((void *)&xmmword_47A10 + 1) = v5;
  [v9 scaledValue:40.0];
  qword_47A20 = v6;
  [v9 scaledValue:26.5];
  qword_47A28 = v7;
  [v9 scaledValue:12.0];
  qword_47A30 = v8;
}

void sub_DBB8(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47B40);
  id WeakRetained = objc_loadWeakRetained(&qword_47B48);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_47B48);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_47B50;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_47B48, obj);
  qword_47B50 = (uint64_t)[obj version];

  sub_F234(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47B40);
  long long v10 = *(_OWORD *)&qword_47B20;
  a2[12] = xmmword_47B10;
  a2[13] = v10;
  a2[14] = xmmword_47B30;
  long long v11 = *(_OWORD *)&qword_47AE0;
  a2[8] = xmmword_47AD0;
  a2[9] = v11;
  long long v12 = *(_OWORD *)&qword_47B00;
  a2[10] = xmmword_47AF0;
  a2[11] = v12;
  long long v13 = *(_OWORD *)&qword_47AA0;
  a2[4] = xmmword_47A90;
  a2[5] = v13;
  long long v14 = *(_OWORD *)&qword_47AC0;
  a2[6] = xmmword_47AB0;
  a2[7] = v14;
  long long v15 = *(_OWORD *)&qword_47A60;
  *a2 = xmmword_47A50;
  a2[1] = v15;
  long long v16 = *(_OWORD *)&qword_47A80;
  a2[2] = xmmword_47A70;
  a2[3] = v16;
}

BOOL sub_DD00(id a1, unint64_t a2)
{
  return __ROR8__(0xCCCCCCCCCCCCCCCDLL * a2, 1) < 0x199999999999999AuLL;
}

double sub_DD28(uint64_t a1, uint64_t a2)
{
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * a2, 1) < 0x199999999999999AuLL)
  {
    uint64_t v2 = a1 + 32;
  }
  else
  {
    uint64_t v2 = a1 + 64;
    if (a2) {
      uint64_t v2 = a1 + 48;
    }
  }
  return *(double *)v2;
}

BOOL sub_DD80(id a1, unint64_t a2)
{
  return 1;
}

NSString *__cdecl sub_DD88(id a1, unint64_t a2)
{
  if (a2) {
    unint64_t v2 = a2;
  }
  else {
    unint64_t v2 = 12;
  }
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:v2];
  uint64_t v4 = +[NSString localizedStringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

BOOL sub_E41C(id a1, unint64_t a2)
{
  return 1;
}

id sub_E424(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v3 = +[NSString localizedStringWithFormat:@"%@", v2];

  return v3;
}

id sub_E494(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
}

id sub_E4A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
}

BOOL sub_E4AC(id a1, unint64_t a2)
{
  return 1;
}

double sub_E4B4(uint64_t a1, unint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) count];
  uint64_t v5 = 120;
  if ((unint64_t)v4 > a2) {
    uint64_t v5 = 88;
  }
  return *(double *)(a1 + v5);
}

BOOL sub_E728(id a1, unint64_t a2)
{
  return __ROR8__(0xCCCCCCCCCCCCCCCDLL * a2, 1) < 0x199999999999999AuLL;
}

double sub_E750(uint64_t a1, uint64_t a2)
{
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * a2, 1) < 0x199999999999999AuLL)
  {
    uint64_t v2 = a1 + 32;
  }
  else
  {
    uint64_t v2 = a1 + 64;
    if (a2) {
      uint64_t v2 = a1 + 48;
    }
  }
  return *(double *)v2;
}

BOOL sub_E7A8(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

NSString *__cdecl sub_E7C8(id a1, unint64_t a2)
{
  unint64_t v2 = 60;
  if (a2) {
    unint64_t v2 = a2;
  }
  return +[NSString localizedStringWithFormat:@"%02lu", v2];
}

BOOL sub_EA2C(id a1, unint64_t a2)
{
  return (a2 & 3) == 0;
}

double sub_EA38(uint64_t a1, char a2)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = a1 + 64;
  if (a2) {
    uint64_t v3 = a1 + 48;
  }
  if ((a2 & 3) != 0) {
    uint64_t v2 = v3;
  }
  return *(double *)v2;
}

BOOL sub_EA74(id a1, unint64_t a2)
{
  return (a2 & 1) == 0;
}

NSString *__cdecl sub_EA80(id a1, unint64_t a2)
{
  unint64_t v2 = 30;
  if (a2) {
    unint64_t v2 = a2;
  }
  return +[NSString localizedStringWithFormat:@"%02lu", v2];
}

BOOL sub_ECE0(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_ED00(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

NSString *__cdecl sub_ED20(id a1, unint64_t a2)
{
  if (a2 >= 5) {
    unint64_t v2 = a2 / 5;
  }
  else {
    unint64_t v2 = 6;
  }
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:v2];
  id v4 = +[NSString localizedStringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

BOOL sub_EDB0(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 > 0x3333333333333333;
}

NSString *__cdecl sub_EDCC(id a1, unint64_t a2)
{
  unint64_t v2 = +[NSNumber numberWithUnsignedInteger:10 * (a2 % 5)];
  uint64_t v3 = +[NSString localizedStringWithFormat:@"%@", v2];

  return (NSString *)v3;
}

BOOL sub_F084(id a1, unint64_t a2)
{
  return 0xCCCCCCCCCCCCCCCDLL * a2 < 0x3333333333333334;
}

BOOL sub_F0A4(id a1, unint64_t a2)
{
  return __ROR8__(0xCCCCCCCCCCCCCCCDLL * a2, 1) < 0x199999999999999AuLL;
}

NSString *__cdecl sub_F0CC(id a1, unint64_t a2)
{
  if (a2 >= 0xA) {
    unint64_t v2 = a2 / 0xA;
  }
  else {
    unint64_t v2 = 3;
  }
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:v2];
  id v4 = +[NSString localizedStringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

BOOL sub_F15C(id a1, unint64_t a2)
{
  return __ROR8__(0xCCCCCCCCCCCCCCCDLL * a2, 1) > 0x1999999999999999uLL;
}

NSString *__cdecl sub_F180(id a1, unint64_t a2)
{
  unint64_t v2 = +[NSNumber numberWithUnsignedInteger:10 * (a2 % 0xA)];
  uint64_t v3 = +[NSString localizedStringWithFormat:@"%@", v2];

  return (NSString *)v3;
}

void sub_F234(uint64_t a1, uint64_t a2)
{
  id v32 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v32 setScale:3 forSizeClass:1.13580247];
  objc_msgSend(v32, "scaledSize:", 2.0, 7.0);
  *(void *)&xmmword_47A50 = v2;
  *((void *)&xmmword_47A50 + 1) = v3;
  objc_msgSend(v32, "scaledSize:", 1.0, 3.5);
  qword_47A60 = v4;
  unk_47A68 = v5;
  objc_msgSend(v32, "scaledSize:", 1.0, 5.0);
  *(void *)&xmmword_47A70 = v6;
  *((void *)&xmmword_47A70 + 1) = v7;
  [v32 scaledValue:1.0];
  *(void *)&xmmword_47AB0 = v8;
  [v32 scaledValue:45.5];
  *((void *)&xmmword_47AB0 + 1) = v9;
  objc_msgSend(v32, "scaledSize:", 2.0, 6.5);
  qword_47A80 = v10;
  unk_47A88 = v11;
  objc_msgSend(v32, "scaledSize:", 1.0, 3.5);
  *(void *)&xmmword_47A90 = v12;
  *((void *)&xmmword_47A90 + 1) = v13;
  objc_msgSend(v32, "scaledSize:", 1.0, 2.0);
  qword_47AA0 = v14;
  unk_47AA8 = v15;
  [v32 scaledValue:11.5];
  qword_47AC0 = v16;
  [v32 scaledValue:8.0];
  qword_47AC8 = v17;
  [v32 scaledValue:11.0];
  *(void *)&xmmword_47AD0 = v18;
  [v32 scaledValue:10.0];
  *((void *)&xmmword_47AD0 + 1) = v19;
  [v32 scaledValue:14.0];
  qword_47AE0 = v20;
  [v32 scaledValue:8.5];
  qword_47AE8 = v21;
  [v32 scaledValue:14.0];
  *(void *)&xmmword_47AF0 = v22;
  [v32 scaledValue:8.5];
  *((void *)&xmmword_47AF0 + 1) = v23;
  [v32 scaledValue:126.0];
  qword_47B00 = v24;
  [v32 scaledValue:144.0];
  qword_47B08 = v25;
  [v32 scaledValue:126.0];
  *(void *)&xmmword_47B10 = v26;
  [v32 scaledValue:126.0];
  *((void *)&xmmword_47B10 + 1) = v27;
  [v32 scaledValue:126.5];
  qword_47B20 = v28;
  [v32 scaledValue:129.0];
  qword_47B28 = v29;
  [v32 scaledValue:126.5];
  *(void *)&xmmword_47B30 = v30;
  [v32 scaledValue:129.0];
  *((void *)&xmmword_47B30 + 1) = v31;
}

void sub_F5A4(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___NTKSharkColorEditOption;
  uint64_t v2 = objc_msgSendSuper2(&v4, "_orderedValuesForDevice:", a2);
  uint64_t v3 = (void *)qword_47B58;
  qword_47B58 = v2;
}

void sub_FE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_FEA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [WeakRetained gmtView];
  [v3 setDate:v2];
}

void sub_10044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10060(uint64_t a1, void *a2, id *a3)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = [WeakRetained gmtView];
  uint64_t v7 = [WeakRetained faceView];
  uint64_t v8 = [v7 currentDisplayDate];
  [v6 setDate:v8];
}

void sub_10110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_10124(id a1)
{
  return (NSString *)@"NTKAlaskanGMTStyleController minute updates";
}

void sub_1049C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_104BC(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_104C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained faceView];
  uint64_t v2 = [v1 timeView];
  [v2 setAlpha:0.0];

  uint64_t v3 = [WeakRetained faceView];
  objc_super v4 = [v3 timeView];
  uint64_t v5 = [v4 secondHandView];
  [v5 setAlpha:0.0];

  uint64_t v6 = [WeakRetained faceView];
  [v6 changeComplicationsAlpha:0.0];
}

void sub_10864(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10880(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

void sub_1088C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained faceView];
  uint64_t v2 = [v1 timeView];
  [v2 setAlpha:1.0];

  uint64_t v3 = [WeakRetained faceView];
  objc_super v4 = [v3 timeView];
  uint64_t v5 = [v4 secondHandView];
  [v5 setAlpha:1.0];

  uint64_t v6 = [WeakRetained faceView];
  [v6 changeComplicationsAlpha:1.0];
}

id sub_10958(uint64_t a1)
{
  return +[UIView animateWithDuration:*(void *)(a1 + 32) animations:0.3 * 0.5];
}

int64_t sub_10B6C(id a1, NTKAlaskanGMTTimezoneLocation *a2, NTKAlaskanGMTTimezoneLocation *a3)
{
  objc_super v4 = a3;
  [(NTKAlaskanGMTTimezoneLocation *)a2 hourOffset];
  uint64_t v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(NTKAlaskanGMTTimezoneLocation *)v4 hourOffset];
  int v7 = v6;

  LODWORD(v8) = v7;
  id v9 = +[NSNumber numberWithFloat:v8];
  id v10 = [v5 compare:v9];

  return (int64_t)v10;
}

int64_t sub_10FF4(id a1, NTKAlaskanGMTTimezoneLocation *a2, NTKAlaskanGMTTimezoneLocation *a3)
{
  objc_super v4 = a2;
  uint64_t v5 = a3;
  [(NTKAlaskanGMTTimezoneLocation *)v5 hourOffset];
  int v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(NTKAlaskanGMTTimezoneLocation *)v4 hourOffset];
  int v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  id v8 = [v6 compare:v7];

  if (!v8)
  {
    id v9 = [(NTKAlaskanGMTTimezoneLocation *)v5 locationName];
    id v10 = [(NTKAlaskanGMTTimezoneLocation *)v4 locationName];
    id v8 = [v9 compare:v10];
  }
  return (int64_t)v8;
}

void sub_119C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_119DC(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 alCityId];
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

id sub_12048(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDefaultLocations];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateWorldClockCities];
}

id sub_120F8(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransitInfoByCity:0];
  [*(id *)(a1 + 32) _updateDefaultLocations];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateWorldClockCities];
}

id sub_121B4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateDefaultLocations];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateWorldClockCities];
}

void sub_12264(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gmtView];
  uint64_t v1 = +[NSDate date];
  [v2 setDate:v1];
}

void sub_12BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 144));
  _Unwind_Resume(a1);
}

id sub_12C54(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = [*(id *)(a1 + 32) largerTicksTestBlock];
    int v6 = v5[2](v5, a2);

    int v7 = objc_opt_new();
    id v8 = *(void **)(a1 + 32);
    if (v6)
    {
      [v8 largeTickSize];
      double v10 = v9;
      [*(id *)(a1 + 32) largeTickSize];
      double v12 = v11;
      uint64_t v13 = [*(id *)(a1 + 32) tickSizeAtIndexBlock];

      if (v13)
      {
        uint64_t v14 = [*(id *)(a1 + 32) tickSizeAtIndexBlock];
        double v10 = v14[2](v14, a2);
        double v12 = v15;
      }
      objc_msgSend(v7, "setFrame:", 0.0, 0.0, v10, v12);
      [v7 bounds];
      CLKRoundForDevice();
      objc_msgSend(v7, "setCornerRadius:");
      uint64_t v16 = [WeakRetained palette];
      id v17 = [v16 dialTicks];
      objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

      [*(id *)(a1 + 32) largeTicksAnchorPoint];
      double v19 = v18;
      [*(id *)(a1 + 32) largeTicksAnchorPoint];
    }
    else
    {
      [v8 smallTickSize];
      double v21 = v20;
      [*(id *)(a1 + 32) smallTickSize];
      double v23 = v22;
      uint64_t v24 = [*(id *)(a1 + 32) tickSizeAtIndexBlock];

      if (v24)
      {
        uint64_t v25 = [*(id *)(a1 + 32) tickSizeAtIndexBlock];
        double v21 = v25[2](v25, a2);
        double v23 = v26;
      }
      objc_msgSend(v7, "setFrame:", 0.0, 0.0, v21, v23);
      [v7 bounds];
      CLKRoundForDevice();
      objc_msgSend(v7, "setCornerRadius:");
      uint64_t v27 = [WeakRetained palette];
      id v28 = [v27 dialTicksSecondary];
      objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v28, "CGColor"));

      [*(id *)(a1 + 32) smallTicksAnchorPoint];
      double v19 = v29;
      [*(id *)(a1 + 32) smallTicksAnchorPoint];
    }
    [v7 setAnchorPoint:v19];
    uint64_t v30 = [(id)objc_opt_class() layerDisabledActions];
    [v7 setActions:v30];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

id sub_12EEC(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 32) ticksAngleProvider];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) ticksAngleProvider];
    int v6 = v5[2](v5, a2);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

id sub_12F78(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_alloc_init((Class)UILabel);
    int v6 = [*(id *)(a1 + 32) visibleMarkersTestBlock];
    int v7 = v6[2](v6, a2);

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) markersFont];
      [v5 setFont:v8];

      double v9 = [*(id *)(a1 + 32) markerTextBlock];
      double v10 = v9[2](v9, a2);
      [v5 setText:v10];

      double v11 = [WeakRetained palette];
      double v12 = [v11 hourMarkers];
      [v5 setTextColor:v12];
    }
    [v5 sizeToFit];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id sub_130AC(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 32) markersAngleProvider];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) markersAngleProvider];
    int v6 = v5[2](v5, a2);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

id sub_13138(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_alloc_init((Class)UILabel);
    int v6 = [*(id *)(a1 + 32) visibleSecondaryMarkersTestBlock];
    int v7 = v6[2](v6, a2);

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) secondaryMarkersFont];
      [v5 setFont:v8];

      double v9 = [*(id *)(a1 + 32) secondaryMarkerTextBlock];
      double v10 = v9[2](v9, a2);
      [v5 setText:v10];

      double v11 = [WeakRetained palette];
      double v12 = [v11 dialTicksSecondary];
      [v5 setTextColor:v12];
    }
    [v5 sizeToFit];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_134FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  int v7 = [v5 options];
  id v8 = [v7 largerTicksTestBlock];
  LODWORD(a3) = v8[2](v8, a3);

  double v9 = *(void **)(a1 + 40);
  if (a3) {
    [v9 dialTicks];
  }
  else {
  id v10 = [v9 dialTicksSecondary];
  }
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));
}

void sub_135C8(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [*(id *)(a1 + 32) options];
  id v6 = [v5 visibleMarkersTestBlock];
  LODWORD(a3) = v6[2](v6, a3);

  if (a3)
  {
    int v7 = [*(id *)(a1 + 40) hourMarkers];
    [v8 setTextColor:v7];
  }
}

void sub_13674(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [*(id *)(a1 + 32) options];
  id v6 = [v5 visibleSecondaryMarkersTestBlock];
  LODWORD(a3) = v6[2](v6, a3);

  if (a3)
  {
    int v7 = [*(id *)(a1 + 40) hourMarkers];
    [v8 setTextColor:v7];
  }
}

void sub_14190(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x308]);
  _Unwind_Resume(a1);
}

void sub_141EC(void *a1@<X0>, void *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47CB0);
  id WeakRetained = objc_loadWeakRetained(&qword_47CB8);
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_47CB8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_47CC0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_47CB8, obj);
  qword_47CC0 = (uint64_t)[obj version];

  sub_18014(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47CB0);
  memcpy(a2, &qword_47B78, 0x138uLL);
}

id sub_14300(uint64_t a1, id a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v5 = [WeakRetained currentHighlightedHour];
      id v6 = [v5 integerValue];

      if (v6 == a2) {
        [v4 createHourMarkerForBezelView:a2];
      }
      else {
      uint64_t v7 = [v4 createTickMarkerForBezelView];
      }
    }
    else
    {
      uint64_t v7 = [WeakRetained heroMarker];
    }
    id v8 = (void *)v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id sub_143AC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_alloc_init((Class)UILabel);
  id v6 = +[CLKFont compactSoftFontOfSize:*(double *)(a1 + 72) weight:UIFontWeightSemibold];
  [v5 setFont:v6];

  uint64_t v7 = a2;
  if (!a2) {
    uint64_t v7 = *(void *)(a1 + 352);
  }
  id v8 = +[NSNumber numberWithUnsignedInteger:v7];
  uint64_t v9 = +[NSString localizedStringWithFormat:@"%@", v8];
  [v5 setText:v9];

  id v10 = [WeakRetained palette];
  double v11 = [v10 innerMarkersColor];
  [v5 setTextColor:v11];

  [v5 sizeToFit];
  if (a2 == 11)
  {
    double v12 = [v5 layer];
    [v12 anchorPoint];
    double v14 = v18;
    double v15 = [v5 layer];
    uint64_t v16 = v15;
    double v17 = 0.4;
  }
  else
  {
    if (a2 != 10) {
      goto LABEL_8;
    }
    double v12 = [v5 layer];
    [v12 anchorPoint];
    double v14 = v13;
    double v15 = [v5 layer];
    uint64_t v16 = v15;
    double v17 = 0.3;
  }
  objc_msgSend(v15, "setAnchorPoint:", v17, v14);

LABEL_8:

  return v5;
}

id sub_1456C(uint64_t a1, unint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v5 = a2 % (*(void *)(a1 + 48) / 0x18uLL);
  id v6 = +[CALayer layer];
  [v6 setActions:*(void *)(a1 + 32)];
  uint64_t v7 = 192;
  if (!v5) {
    uint64_t v7 = 176;
  }
  uint64_t v8 = 184;
  if (!v5) {
    uint64_t v8 = 168;
  }
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, *(double *)(a1 + v8), *(double *)(a1 + v7));
  uint64_t v9 = [WeakRetained palette];
  id v10 = [v9 ticksDialColor];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

  [v6 anchorPoint];
  objc_msgSend(v6, "setAnchorPoint:");

  return v6;
}

void sub_14B60(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v5 = *(void **)(a1 + 32);
  objc_super v4 = *(void **)(a1 + 40);
  if (isKindOfClass) {
    [v4 gmtCurrentHourLabelColor];
  }
  else {
  id v6 = [v4 outerMarkersColor];
  }
  [v5 updateColor:v6 object:v7];
}

void sub_14BF4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 innerMarkersColor];
  [v2 updateColor:v5 object:v4];
}

void sub_14C64(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 outerMarkersColor];
  [v2 updateColor:v5 object:v4];
}

void sub_14CD4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 outerMarkersColor];
  [v2 updateColor:v5 object:v4];
}

void sub_14D44(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 ticksDialColor];
  [v2 updateColor:v5 object:v4];
}

int64_t sub_15410(id a1, NTKAlaskanGMTTimezoneLocation *a2, NTKAlaskanGMTTimezoneLocation *a3)
{
  id v4 = a3;
  [(NTKAlaskanGMTTimezoneLocation *)a2 hourOffset];
  id v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [(NTKAlaskanGMTTimezoneLocation *)v4 hourOffset];
  int v7 = v6;

  LODWORD(v8) = v7;
  uint64_t v9 = +[NSNumber numberWithFloat:v8];
  id v10 = [v5 compare:v9];

  return (int64_t)v10;
}

uint64_t sub_157E8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_15800(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_15C10(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 center];
    double v6 = v5;
    double v8 = v7;
    if (v4)
    {
      [v4 transform];
      double v9 = v21;
      double v10 = v20;
      double v11 = v23;
      double v12 = v22;
      double v13 = v25;
      double v14 = v24;
    }
    else
    {
      double v13 = 0.0;
      double v11 = 0.0;
      double v9 = 0.0;
      double v14 = 0.0;
      double v12 = 0.0;
      double v10 = 0.0;
    }
    atan2(v14 + v8 * v12 + v10 * v6 - *(double *)(a1 + 40), v13 + v8 * v11 + v9 * v6 - *(double *)(a1 + 48));
    CLKRadiansToDegrees();
    double v16 = *(double *)(a1 + 56);
    if (v16 <= v15) {
      double v17 = v15 - v16;
    }
    else {
      double v17 = v16 - v15;
    }
    if (v17 > 180.0) {
      double v17 = 360.0 - v17;
    }
    if (v17 < 110.0)
    {
      CLKInterpolateBetweenFloatsClipped();
      double v19 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:(unint64_t)v18];
      [v4 setFont:v19];

      [v4 sizeToFit];
    }
  }
}

void sub_18014(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v3 setScale:3 forSizeClass:1.13580247];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v5 = v4;

  qword_47C98 = v5;
  [v3 scaledValue:16.0];
  qword_47B78 = v6;
  [v3 scaledValue:101.0];
  qword_47B80 = v7;
  [v3 scaledValue:5.0];
  qword_47B88 = v8;
  [v3 scaledValue:1.0];
  qword_47B90 = v9;
  [v3 scaledValue:19.0];
  qword_47B98 = v10;
  [v3 scaledValue:0.5];
  qword_47BB0 = v11;
  [v3 scaledValue:14.0];
  qword_47BC0 = v12;
  [v3 scaledValue:8.0];
  qword_47C58 = v13;
  [v3 scaledValue:12.5];
  qword_47BB8 = v14;
  [v3 scaledValue:12.0];
  qword_47BD0 = v15;
  objc_msgSend(v3, "scaledSize:", 2.0, 5.0);
  qword_47BD8 = v16;
  unk_47BE0 = v17;
  objc_msgSend(v3, "scaledSize:", 1.0, 4.0);
  qword_47BE8 = v18;
  unk_47BF0 = v19;
  objc_msgSend(v3, "scaledSize:", 1.0, 2.0);
  qword_47BF8 = v20;
  unk_47C00 = v21;
  [v3 scaledValue:15.0];
  qword_47BC8 = v22;
  [v3 scaledValue:15.0];
  qword_47C60 = v23;
  [v3 scaledValue:24.0];
  qword_47C78 = v24;
  [v3 scaledValue:2.0];
  qword_47C70 = v25;
  [v3 scaledValue:136.0];
  qword_47C68 = v26;
  v39[0] = &off_3A8D0;
  v39[1] = &off_3A8E8;
  v40[0] = &off_3AD08;
  v40[1] = &off_3AD18;
  v39[2] = &off_3A900;
  v39[3] = &off_3A918;
  v40[2] = &off_3AD28;
  v40[3] = &off_3AD38;
  v39[4] = &off_3A930;
  v40[4] = &off_3AD38;
  uint64_t v27 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:5];
  [v3 scaledValue:v27 withOverrides:6.0];
  qword_47C08 = v28;

  qword_47C10 = 0x3FC999999999999ALL;
  [v3 scaledValue:14.0];
  qword_47C18 = v29;
  [v3 scaledValue:5.0];
  qword_47C20 = v30;
  [v3 scaledValue:12.0];
  qword_47C38 = v31;
  [v3 scaledValue:10.5];
  qword_47C40 = v32;
  qword_47C30 = 0x3FE28F5C28F5C28FLL;
  [v3 scaledValue:9.0];
  qword_47C48 = v33;
  qword_47C50 = 0x4000000000000000;
  xmmword_47C80 = xmmword_36DD0;
  qword_47C90 = 0x3FE0000000000000;
  [v3 scaledValue:3 withOverride:29.0 forSizeClass:29.0];
  qword_47CA0 = v34;
  [v3 scaledValue:3 withOverride:12.0 forSizeClass:12.0];
  qword_47CA8 = v35;
  [v3 setRoundingBehavior:2];
  [v3 scaledValue:18.0];
  qword_47C28 = v36;
  [v3 scaledValue:11.0];
  qword_47BA0 = v37;
  [v3 scaledValue:17.0];
  qword_47BA8 = v38;
}

void sub_18BDC(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v4 scaledValue:3 withOverride:5.0 forSizeClass:5.0];
  qword_47CC8 = v2;
  [v4 scaledValue:3 withOverride:3.0 forSizeClass:3.0];
  qword_47CD0 = v3;
}

void sub_18D7C(id a1)
{
  uint64_t v1 = [[NTKAlaskanComplicationsConfiguration alloc] initWithTopLeftComplication:43 topRightComplication:10 bottomLeftComplication:11 bottomRightComplication:7];
  qword_47CF0 = (uint64_t)v1;

  _objc_release_x1(v1);
}

void sub_19BAC(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47D58);
  id WeakRetained = objc_loadWeakRetained(&qword_47D60);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_47D60);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_47D68;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_47D60, obj);
  qword_47D68 = (uint64_t)[obj version];

  sub_1E760(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47D58);
  long long v10 = *(_OWORD *)&qword_47D30;
  *(_OWORD *)(a2 + 32) = xmmword_47D20;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 64) = xmmword_47D40;
  *(void *)(a2 + 80) = qword_47D50;
  long long v11 = *(_OWORD *)&qword_47D10;
  *(_OWORD *)a2 = xmmword_47D00;
  *(_OWORD *)(a2 + 16) = v11;
}

void sub_1A0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1A11C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained currentDate];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1A2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1A2EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained currentDate];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_1DB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB54(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTachymeterLabel];
}

void sub_1DBB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_1DBCC(id a1)
{
  return (NSString *)@"Tachymeter 15fps updates";
}

void sub_1E760(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 setScale:3 forSizeClass:1.13580247];
  [v2 scaledValue:25.0];
  *(void *)&xmmword_47D00 = v3;
  [v2 scaledValue:12.0];
  *((void *)&xmmword_47D00 + 1) = v4;
  [v2 scaledValue:10.0];
  qword_47D10 = v5;
  [v2 scaledValue:-0.5];
  qword_47D18 = v6;
  [v2 scaledValue:30.5];
  *(void *)&xmmword_47D20 = v7;
  [v2 scaledValue:6.0];
  *((void *)&xmmword_47D20 + 1) = v8;
  v12[0] = &off_3A990;
  v12[1] = &off_3A9A8;
  v13[0] = &off_3AD68;
  v13[1] = &off_3AD78;
  v12[2] = &off_3A9C0;
  v13[2] = &off_3AD78;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  [v2 scaledValue:v9 withOverrides:29.0];
  qword_47D30 = v10;

  [v2 scaledValue:20.0];
  qword_47D38 = v11;
  xmmword_47D40 = xmmword_36E10;
  qword_47D50 = 0xBFE0000000000000;
}

void sub_1F0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, id *a11, id *a12)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)&STACK[0x488]);
  _Unwind_Resume(a1);
}

void sub_1F17C(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47E58);
  id WeakRetained = objc_loadWeakRetained(&qword_47E60);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_47E60);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_47E68;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_47E60, obj);
  qword_47E68 = (uint64_t)[obj version];

  sub_21DB4(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47E58);
  long long v10 = *(_OWORD *)&qword_47E40;
  *(_OWORD *)(a2 + 192) = xmmword_47E30;
  *(_OWORD *)(a2 + 208) = v10;
  *(void *)(a2 + 224) = qword_47E50;
  long long v11 = unk_47E00;
  *(_OWORD *)(a2 + 128) = xmmword_47DF0;
  *(_OWORD *)(a2 + 144) = v11;
  long long v12 = unk_47E20;
  *(_OWORD *)(a2 + 160) = xmmword_47E10;
  *(_OWORD *)(a2 + 176) = v12;
  long long v13 = *(_OWORD *)&qword_47DC0;
  *(_OWORD *)(a2 + 64) = xmmword_47DB0;
  *(_OWORD *)(a2 + 80) = v13;
  long long v14 = unk_47DE0;
  *(_OWORD *)(a2 + 96) = xmmword_47DD0;
  *(_OWORD *)(a2 + 112) = v14;
  long long v15 = *(_OWORD *)&qword_47D80;
  *(_OWORD *)a2 = xmmword_47D70;
  *(_OWORD *)(a2 + 16) = v15;
  long long v16 = *(_OWORD *)&qword_47DA0;
  *(_OWORD *)(a2 + 32) = xmmword_47D90;
  *(_OWORD *)(a2 + 48) = v16;
}

id sub_1F2C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = objc_opt_new();
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, *(double *)(a1 + 64), *(double *)(a1 + 64));
  [v3 setActions:*(void *)(a1 + 32)];
  [v3 bounds];
  uint64_t v4 = [WeakRetained device];
  CLKRoundForDevice();
  objc_msgSend(v3, "setCornerRadius:");

  id v5 = [WeakRetained palette];
  id v6 = [v5 hourDots];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  return v3;
}

id sub_1F3B4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    if (a2)
    {
      id v5 = +[CALayer layer];
      [v5 setActions:*(void *)(a1 + 32)];
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, *(double *)(a1 + 96), *(double *)(a1 + 104));
      uint64_t v19 = [WeakRetained palette];
      id v20 = [v19 markers];
      objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v20, "CGColor"));

      [v5 bounds];
      uint64_t v21 = [WeakRetained device];
      CLKRoundForDevice();
      objc_msgSend(v5, "setCornerRadius:");
    }
    else
    {
      id v5 = objc_alloc_init((Class)UILabel);
      id v6 = +[CLKFont compactSoftFontOfSize:*(double *)(a1 + 80) weight:UIFontWeightSemibold];
      [v5 setFont:v6];

      uint64_t v7 = +[NSNumber numberWithUnsignedInteger:0x3CuLL / *(void *)(a1 + 280) * a2];
      id v8 = +[NSString localizedStringWithFormat:@"%@", v7];
      [v5 setText:v8];

      uint64_t v9 = [WeakRetained palette];
      long long v10 = [v9 markers];
      [v5 setTextColor:v10];

      [v5 sizeToFit];
    }
  }
  else
  {
    long long v11 = +[NTKAlaskanFaceBundle imageWithName:@"count-up-fill-icon"];
    id v5 = [objc_alloc((Class)UIImageView) initWithImage:v11];
    long long v12 = [WeakRetained palette];
    long long v13 = [v12 markerFillColor];
    [v5 setTintColor:v13];

    double y = CGPointZero.y;
    objc_msgSend(v5, "setBounds:", CGPointZero.x, y, *(double *)(a1 + 264), *(double *)(a1 + 272));
    [WeakRetained setMarkerFillIcon:v5];
    long long v15 = +[NTKAlaskanFaceBundle imageWithName:@"count-up-outline-icon"];
    id v16 = [objc_alloc((Class)UIImageView) initWithImage:v15];
    uint64_t v17 = [WeakRetained palette];
    uint64_t v18 = [v17 markerOutlineColor];
    [v16 setTintColor:v18];

    objc_msgSend(v16, "setBounds:", CGPointZero.x, y, *(double *)(a1 + 264), *(double *)(a1 + 272));
    [WeakRetained setMarkerOutlineIcon:v16];
    [v5 bounds];
    CLKRectGetCenter();
    objc_msgSend(v16, "setCenter:");
    [v5 addSubview:v16];
  }

  return v5;
}

id sub_1F6E0(uint64_t a1, unint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([*(id *)(a1 + 32) containsIndex:a2] & 1) != 0
    || ([*(id *)(a1 + 32) containsIndex:a2 - 1] & 1) != 0)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v7 = a2 % 5;
    unsigned __int8 v8 = [*(id *)(a1 + 32) containsIndex:a2 + 1];
    id v5 = 0;
    if (v7 && (v8 & 1) == 0)
    {
      id v5 = +[CALayer layer];
      uint64_t v9 = +[NSNull null];
      v14[0] = @"contents";
      v14[1] = @"backgroundColor";
      v15[0] = v9;
      v15[1] = v9;
      v14[2] = @"transform";
      v14[3] = @"bounds";
      void v15[2] = v9;
      v15[3] = v9;
      v14[4] = @"position";
      v15[4] = v9;
      long long v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:5];
      [v5 setActions:v10];

      objc_msgSend(v5, "setFrame:", 0.0, 0.0, *(double *)(a1 + 112), *(double *)(a1 + 120));
      long long v11 = [WeakRetained palette];
      id v12 = [v11 markers];
      objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v12, "CGColor"));

      [v5 bounds];
      long long v13 = [WeakRetained device];
      CLKRoundForDevice();
      objc_msgSend(v5, "setCornerRadius:");

      objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.0);
    }
  }

  return v5;
}

id sub_1F8FC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = +[CALayer layer];
  [v5 setActions:*(void *)(a1 + 32)];
  if (0xCCCCCCCCCCCCCCCDLL * a2 <= 0x3333333333333333)
  {
    double v6 = *(double *)(a1 + 216);
    double v7 = *(double *)(a1 + 224);
  }
  else
  {
    double v6 = *(double *)(a1 + 200);
    double v7 = *(double *)(a1 + 208);
  }
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v6, v7);
  unsigned __int8 v8 = [WeakRetained hasCountUpStarted];
  uint64_t v9 = [WeakRetained palette];
  long long v10 = v9;
  if (v8) {
    [v9 activeDialTicks];
  }
  else {
  id v11 = [v9 dialTicks];
  }
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

  [v5 anchorPoint];
  objc_msgSend(v5, "setAnchorPoint:");

  return v5;
}

void sub_1FCD8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 hourDots];
  [v2 updateColor:v5 object:v4];
}

void sub_1FD48(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 markers];
  [v2 updateColor:v5 object:v4];
}

void sub_1FDB8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 markers];
  [v2 updateColor:v5 object:v4];
}

void sub_1FE28(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  unsigned __int8 v5 = [v3 hasCountUpStarted];
  double v6 = *(void **)(a1 + 40);
  if (v5) {
    [v6 activeDialTicks];
  }
  else {
  id v7 = [v6 dialTicks];
  }
  [v3 updateColor:v7 object:v4];
}

void sub_20488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_204A8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained innerDialViewBackgroundColor];
  id v4 = [WeakRetained innerDialView];
  [v4 setBackgroundColor:v3];

  id v5 = [WeakRetained countUpLabelColor];
  id v6 = [v5 CGColor];
  id v7 = [WeakRetained countUpBackgroundLayer];
  [v7 setBackgroundColor:v6];

  unsigned __int8 v8 = [WeakRetained _countUpLabelTextColor];
  uint64_t v9 = [WeakRetained countUpLabel];
  [v9 setTextColor:v8];

  [WeakRetained countUpLabelAlpha];
  double v11 = v10;
  id v12 = [WeakRetained countUpLabel];
  [v12 setAlpha:v11];

  [WeakRetained countUpLabelAlpha];
  *(float *)&double v11 = v13;
  long long v14 = [WeakRetained countUpBackgroundLayer];
  LODWORD(v15) = LODWORD(v11);
  [v14 setOpacity:v15];

  id v16 = [WeakRetained ticksView];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_20670;
  v17[3] = &unk_392D8;
  objc_copyWeak(&v18, v1);
  [v16 enumerateMarkers:v17];

  objc_destroyWeak(&v18);
}

void sub_2065C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20670(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unsigned __int8 v4 = [WeakRetained hasCountUpStarted];
  id v5 = [WeakRetained palette];
  id v6 = v5;
  if (v4) {
    [v5 activeDialTicks];
  }
  else {
  id v7 = [v5 dialTicks];
  }
  [WeakRetained updateColor:v7 object:v3];
}

void sub_20CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_20D1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained currentDate];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_20D78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateFrameForCountUpLabel];
}

void sub_21DB4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v22 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v22 setScale:3 forSizeClass:1.13580247];
  xmmword_47D70 = xmmword_36EF0;
  [v22 scaledValue:13.0];
  qword_47D80 = v3;
  [v22 scaledValue:100.0];
  *(double *)&qword_47D88 = v4 + *(double *)&qword_47D80 * -0.5;
  [v22 scaledValue:12.0];
  *(void *)&xmmword_47D90 = v5;
  [v22 scaledValue:10.0];
  *((void *)&xmmword_47D90 + 1) = v6;
  objc_msgSend(v22, "scaledSize:", 2.0, 7.5);
  qword_47DA0 = v7;
  unk_47DA8 = v8;
  objc_msgSend(v22, "scaledSize:", 2.0, 3.5);
  *(void *)&xmmword_47DB0 = v9;
  *((void *)&xmmword_47DB0 + 1) = v10;
  [v22 scaledValue:18.0];
  qword_47DC0 = v11;
  qword_47DC8 = 0x4022000000000000;
  [v22 scaledValue:16.5];
  *(void *)&xmmword_47DD0 = v12;
  *(long long *)((char *)&xmmword_47DD0 + 8) = xmmword_36F00;
  unk_47DE8 = xmmword_36F10;
  *(long long *)((char *)&xmmword_47DF0 + 8) = xmmword_36F10;
  objc_msgSend(v22, "scaledSize:", 1.25, 2.5);
  qword_47E08 = v13;
  *(void *)&xmmword_47E10 = v14;
  objc_msgSend(v22, "scaledSize:", 1.25, 4.5);
  *((void *)&xmmword_47E10 + 1) = v15;
  unk_47E20 = v16;
  [v22 scaledValue:1.5];
  qword_47E28 = v17;
  xmmword_47E30 = xmmword_36F20;
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v19 = v18;

  qword_47E40 = v19;
  objc_msgSend(v22, "scaledSize:withOverride:forSizeClass:", 3, 14.0, 13.0, 14.0, 13.0);
  qword_47E48 = v20;
  qword_47E50 = v21;
}

void sub_22140(uint64_t a1, uint64_t a2)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___NTKTroutColorEditOption;
  uint64_t v2 = objc_msgSendSuper2(&v4, "_orderedValuesForDevice:", a2);
  uint64_t v3 = (void *)qword_47E70;
  qword_47E70 = v2;
}

void sub_22474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_224B4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = [*(id *)(a1 + 32) largerTicksTestBlock];
    int v7 = v6[2](v6, a2);

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [v8 largeTickSize];
      double v10 = v9;
      [*(id *)(a1 + 32) largeTickSize];
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, v10, v11);
      uint64_t v12 = [WeakRetained palette];
      [v12 subdialClockTicks];
    }
    else
    {
      [v8 smallTickSize];
      double v14 = v13;
      [*(id *)(a1 + 32) smallTickSize];
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, v14, v15);
      uint64_t v12 = [WeakRetained palette];
      [v12 subdialClockTicksSecondary];
    }
    id v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

    [v5 bounds];
    CLKRoundForDevice();
    objc_msgSend(v5, "setCornerRadius:");
    [v5 anchorPoint];
    objc_msgSend(v5, "setAnchorPoint:");
    uint64_t v17 = [(id)objc_opt_class() layerDisabledActions];
    [v5 setActions:v17];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id sub_2265C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained
    && ([*(id *)(a1 + 32) visibleMarkersTestBlock],
        uint64_t v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
        int v6 = v5[2](v5, a2),
        v5,
        v6))
  {
    id v7 = objc_alloc_init((Class)UILabel);
    uint64_t v8 = [*(id *)(a1 + 32) markersFont];
    [v7 setFont:v8];

    double v9 = [*(id *)(a1 + 32) markerTextBlock];
    double v10 = v9[2](v9, a2);
    [v7 setText:v10];

    double v11 = [WeakRetained palette];
    uint64_t v12 = [v11 subdialClockTicks];
    [v7 setTextColor:v12];

    [v7 sizeToFit];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_22DF4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 options];
  uint64_t v8 = [v7 largerTicksTestBlock];
  LODWORD(a3) = v8[2](v8, a3);

  double v9 = *(void **)(a1 + 40);
  if (a3) {
    [v9 subdialClockTicks];
  }
  else {
  id v10 = [v9 subdialClockTicksSecondary];
  }
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));
}

void sub_22EC0(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) options];
  id v6 = [v5 visibleMarkersTestBlock];
  LODWORD(a3) = v6[2](v6, a3);

  if (a3)
  {
    id v7 = [*(id *)(a1 + 40) subdialClockTicks];
    [v8 setTextColor:v7];
  }
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
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

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKDegreesToRadians()
{
  return _CLKDegreesToRadians();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLayoutIsRTL()
{
  return _CLKLayoutIsRTL();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t CLKPixelAlignRectForDevice()
{
  return _CLKPixelAlignRectForDevice();
}

uint64_t CLKRadiansToDegrees()
{
  return _CLKRadiansToDegrees();
}

uint64_t CLKRectCenteredIntegralRectForDevice()
{
  return _CLKRectCenteredIntegralRectForDevice();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t CLKUIConvertRGBtoLAB()
{
  return _CLKUIConvertRGBtoLAB();
}

uint64_t CLKUIConvertToRGBfFromUIColor_fast()
{
  return _CLKUIConvertToRGBfFromUIColor_fast();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKColorByApplyingBlackOverlay()
{
  return _NTKColorByApplyingBlackOverlay();
}

uint64_t NTKColorWithRGBA()
{
  return _NTKColorWithRGBA();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKNameForDuotones()
{
  return _NTKNameForDuotones();
}

uint64_t NTKNormalizeAngle()
{
  return _NTKNormalizeAngle();
}

uint64_t NTKScaleForBreathingFraction()
{
  return _NTKScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKStarbearEnabled()
{
  return _NTKStarbearEnabled();
}

uint64_t NTKWorldClockCityAbbreviation()
{
  return _NTKWorldClockCityAbbreviation();
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

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend__12HourDialView(void *a1, const char *a2, ...)
{
  return [a1 _12HourDialView];
}

id objc_msgSend__12HoursSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _12HoursSubdialView];
}

id objc_msgSend__15MinutesSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _15MinutesSubdialView];
}

id objc_msgSend__2MinutesSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _2MinutesSubdialView];
}

id objc_msgSend__30MinutesSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _30MinutesSubdialView];
}

id objc_msgSend__30secondsDialView(void *a1, const char *a2, ...)
{
  return [a1 _30secondsDialView];
}

id objc_msgSend__3MinutesSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _3MinutesSubdialView];
}

id objc_msgSend__3secondsDialView(void *a1, const char *a2, ...)
{
  return [a1 _3secondsDialView];
}

id objc_msgSend__60MinutesSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _60MinutesSubdialView];
}

id objc_msgSend__60secondsDialView(void *a1, const char *a2, ...)
{
  return [a1 _60secondsDialView];
}

id objc_msgSend__60secondsSubdialView(void *a1, const char *a2, ...)
{
  return [a1 _60secondsSubdialView];
}

id objc_msgSend__6secondsDialView(void *a1, const char *a2, ...)
{
  return [a1 _6secondsDialView];
}

id objc_msgSend__backgroundImage(void *a1, const char *a2, ...)
{
  return [a1 _backgroundImage];
}

id objc_msgSend__countUpLabelTextColor(void *a1, const char *a2, ...)
{
  return [a1 _countUpLabelTextColor];
}

id objc_msgSend__foregroundImage(void *a1, const char *a2, ...)
{
  return [a1 _foregroundImage];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__newCenterLabel(void *a1, const char *a2, ...)
{
  return [a1 _newCenterLabel];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__saveReferenceTimezoneLocation(void *a1, const char *a2, ...)
{
  return [a1 _saveReferenceTimezoneLocation];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__shouldUseEvergreenColorScheme(void *a1, const char *a2, ...)
{
  return [a1 _shouldUseEvergreenColorScheme];
}

id objc_msgSend__startClockUpdates(void *a1, const char *a2, ...)
{
  return [a1 _startClockUpdates];
}

id objc_msgSend__stopClockUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopClockUpdates];
}

id objc_msgSend__stopwatchCurrentLapTime(void *a1, const char *a2, ...)
{
  return [a1 _stopwatchCurrentLapTime];
}

id objc_msgSend__tachymeterDialView(void *a1, const char *a2, ...)
{
  return [a1 _tachymeterDialView];
}

id objc_msgSend__updateAssets(void *a1, const char *a2, ...)
{
  return [a1 _updateAssets];
}

id objc_msgSend__updateDefaultLocations(void *a1, const char *a2, ...)
{
  return [a1 _updateDefaultLocations];
}

id objc_msgSend__updateDialViewsFrame(void *a1, const char *a2, ...)
{
  return [a1 _updateDialViewsFrame];
}

id objc_msgSend__updateElapsedTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateElapsedTimeLabel];
}

id objc_msgSend__updateTachymeterLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateTachymeterLabel];
}

id objc_msgSend_activeBackground(void *a1, const char *a2, ...)
{
  return [a1 activeBackground];
}

id objc_msgSend_activeDialTicks(void *a1, const char *a2, ...)
{
  return [a1 activeDialTicks];
}

id objc_msgSend_activeStateDateComplication(void *a1, const char *a2, ...)
{
  return [a1 activeStateDateComplication];
}

id objc_msgSend_alCity(void *a1, const char *a2, ...)
{
  return [a1 alCity];
}

id objc_msgSend_alCityId(void *a1, const char *a2, ...)
{
  return [a1 alCityId];
}

id objc_msgSend_alaskanContentController(void *a1, const char *a2, ...)
{
  return [a1 alaskanContentController];
}

id objc_msgSend_alaskanContentView(void *a1, const char *a2, ...)
{
  return [a1 alaskanContentView];
}

id objc_msgSend_analogHand(void *a1, const char *a2, ...)
{
  return [a1 analogHand];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_anchorPointFromConfiguration(void *a1, const char *a2, ...)
{
  return [a1 anchorPointFromConfiguration];
}

id objc_msgSend_angleOffset(void *a1, const char *a2, ...)
{
  return [a1 angleOffset];
}

id objc_msgSend_anyLocation(void *a1, const char *a2, ...)
{
  return [a1 anyLocation];
}

id objc_msgSend_applyHourMarkersScaleTransform(void *a1, const char *a2, ...)
{
  return [a1 applyHourMarkersScaleTransform];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundChronometerMode(void *a1, const char *a2, ...)
{
  return [a1 backgroundChronometerMode];
}

id objc_msgSend_backgroundTimeMode(void *a1, const char *a2, ...)
{
  return [a1 backgroundTimeMode];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bezelView(void *a1, const char *a2, ...)
{
  return [a1 bezelView];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomSubdialAnalogHandsFullRotationDuration(void *a1, const char *a2, ...)
{
  return [a1 bottomSubdialAnalogHandsFullRotationDuration];
}

id objc_msgSend_bottomSubdialHandsAnimationFPS(void *a1, const char *a2, ...)
{
  return [a1 bottomSubdialHandsAnimationFPS];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_centerLabel(void *a1, const char *a2, ...)
{
  return [a1 centerLabel];
}

id objc_msgSend_checkIfCitiesModified(void *a1, const char *a2, ...)
{
  return [a1 checkIfCitiesModified];
}

id objc_msgSend_chronoPalette(void *a1, const char *a2, ...)
{
  return [a1 chronoPalette];
}

id objc_msgSend_chronometerHandsParentView(void *a1, const char *a2, ...)
{
  return [a1 chronometerHandsParentView];
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return [a1 cities];
}

id objc_msgSend_cityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cityIdentifier];
}

id objc_msgSend_classicIdentifier(void *a1, const char *a2, ...)
{
  return [a1 classicIdentifier];
}

id objc_msgSend_cleanupAfterEditing(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEditing];
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

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_collectionName(void *a1, const char *a2, ...)
{
  return [a1 collectionName];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_contentDiameter(void *a1, const char *a2, ...)
{
  return [a1 contentDiameter];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contentViewFrame(void *a1, const char *a2, ...)
{
  return [a1 contentViewFrame];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_cornerComplication(void *a1, const char *a2, ...)
{
  return [a1 cornerComplication];
}

id objc_msgSend_cornerComplicationInnerTextColor(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationInnerTextColor];
}

id objc_msgSend_cornerComplicationOuterTextColor(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationOuterTextColor];
}

id objc_msgSend_cornerComplicationSecondary(void *a1, const char *a2, ...)
{
  return [a1 cornerComplicationSecondary];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countUpBackgroundLayer(void *a1, const char *a2, ...)
{
  return [a1 countUpBackgroundLayer];
}

id objc_msgSend_countUpClockHands(void *a1, const char *a2, ...)
{
  return [a1 countUpClockHands];
}

id objc_msgSend_countUpLabel(void *a1, const char *a2, ...)
{
  return [a1 countUpLabel];
}

id objc_msgSend_countUpLabelAlpha(void *a1, const char *a2, ...)
{
  return [a1 countUpLabelAlpha];
}

id objc_msgSend_countUpLabelColor(void *a1, const char *a2, ...)
{
  return [a1 countUpLabelColor];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_createController(void *a1, const char *a2, ...)
{
  return [a1 createController];
}

id objc_msgSend_createDefaultOptions(void *a1, const char *a2, ...)
{
  return [a1 createDefaultOptions];
}

id objc_msgSend_createTickMarkerForBezelView(void *a1, const char *a2, ...)
{
  return [a1 createTickMarkerForBezelView];
}

id objc_msgSend_crownInputHandler(void *a1, const char *a2, ...)
{
  return [a1 crownInputHandler];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDate(void *a1, const char *a2, ...)
{
  return [a1 currentDate];
}

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayDate];
}

id objc_msgSend_currentHighlightedHour(void *a1, const char *a2, ...)
{
  return [a1 currentHighlightedHour];
}

id objc_msgSend_currentLapTime(void *a1, const char *a2, ...)
{
  return [a1 currentLapTime];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_currentTimezoneLocation(void *a1, const char *a2, ...)
{
  return [a1 currentTimezoneLocation];
}

id objc_msgSend_darkTickColor(void *a1, const char *a2, ...)
{
  return [a1 darkTickColor];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateComplication(void *a1, const char *a2, ...)
{
  return [a1 dateComplication];
}

id objc_msgSend_dateComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationColor];
}

id objc_msgSend_dateComplicationView(void *a1, const char *a2, ...)
{
  return [a1 dateComplicationView];
}

id objc_msgSend_dayDialColor(void *a1, const char *a2, ...)
{
  return [a1 dayDialColor];
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

id objc_msgSend_deviceSupportsPigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 deviceSupportsPigmentEditOption];
}

id objc_msgSend_dialTickView(void *a1, const char *a2, ...)
{
  return [a1 dialTickView];
}

id objc_msgSend_dialTicks(void *a1, const char *a2, ...)
{
  return [a1 dialTicks];
}

id objc_msgSend_dialTicksSecondary(void *a1, const char *a2, ...)
{
  return [a1 dialTicksSecondary];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableCrownEventReception(void *a1, const char *a2, ...)
{
  return [a1 disableCrownEventReception];
}

id objc_msgSend_disableLayout(void *a1, const char *a2, ...)
{
  return [a1 disableLayout];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_diverCountUpStartDate(void *a1, const char *a2, ...)
{
  return [a1 diverCountUpStartDate];
}

id objc_msgSend_diverView(void *a1, const char *a2, ...)
{
  return [a1 diverView];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_enableCrownEventReception(void *a1, const char *a2, ...)
{
  return [a1 enableCrownEventReception];
}

id objc_msgSend_enableDisableResetButton(void *a1, const char *a2, ...)
{
  return [a1 enableDisableResetButton];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_faceView(void *a1, const char *a2, ...)
{
  return [a1 faceView];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return [a1 fullname];
}

id objc_msgSend_generateMajorDetents(void *a1, const char *a2, ...)
{
  return [a1 generateMajorDetents];
}

id objc_msgSend_generateMinorDetents(void *a1, const char *a2, ...)
{
  return [a1 generateMinorDetents];
}

id objc_msgSend_gmtCurrentHourLabelColor(void *a1, const char *a2, ...)
{
  return [a1 gmtCurrentHourLabelColor];
}

id objc_msgSend_gmtHandColor(void *a1, const char *a2, ...)
{
  return [a1 gmtHandColor];
}

id objc_msgSend_gmtHandInlayColor(void *a1, const char *a2, ...)
{
  return [a1 gmtHandInlayColor];
}

id objc_msgSend_gmtOffsetHours(void *a1, const char *a2, ...)
{
  return [a1 gmtOffsetHours];
}

id objc_msgSend_gmtSelectedCityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 gmtSelectedCityIdentifier];
}

id objc_msgSend_gmtSelectedTimezone(void *a1, const char *a2, ...)
{
  return [a1 gmtSelectedTimezone];
}

id objc_msgSend_gmtView(void *a1, const char *a2, ...)
{
  return [a1 gmtView];
}

id objc_msgSend_hasCountUpStarted(void *a1, const char *a2, ...)
{
  return [a1 hasCountUpStarted];
}

id objc_msgSend_hasRotatedToMinuteHand(void *a1, const char *a2, ...)
{
  return [a1 hasRotatedToMinuteHand];
}

id objc_msgSend_hasSecondaryMarkers(void *a1, const char *a2, ...)
{
  return [a1 hasSecondaryMarkers];
}

id objc_msgSend_heroMarker(void *a1, const char *a2, ...)
{
  return [a1 heroMarker];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourDots(void *a1, const char *a2, ...)
{
  return [a1 hourDots];
}

id objc_msgSend_hourHandColor(void *a1, const char *a2, ...)
{
  return [a1 hourHandColor];
}

id objc_msgSend_hourHandInlayColor(void *a1, const char *a2, ...)
{
  return [a1 hourHandInlayColor];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_hourMarkers(void *a1, const char *a2, ...)
{
  return [a1 hourMarkers];
}

id objc_msgSend_hourOffset(void *a1, const char *a2, ...)
{
  return [a1 hourOffset];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_innerDialView(void *a1, const char *a2, ...)
{
  return [a1 innerDialView];
}

id objc_msgSend_innerDialViewBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 innerDialViewBackgroundColor];
}

id objc_msgSend_innerMarkersColor(void *a1, const char *a2, ...)
{
  return [a1 innerMarkersColor];
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

id objc_msgSend_isChronoMode(void *a1, const char *a2, ...)
{
  return [a1 isChronoMode];
}

id objc_msgSend_isCompositePalette(void *a1, const char *a2, ...)
{
  return [a1 isCompositePalette];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEvergreenCollection(void *a1, const char *a2, ...)
{
  return [a1 isEvergreenCollection];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isStopped(void *a1, const char *a2, ...)
{
  return [a1 isStopped];
}

id objc_msgSend_lapHand1(void *a1, const char *a2, ...)
{
  return [a1 lapHand1];
}

id objc_msgSend_lapHand2(void *a1, const char *a2, ...)
{
  return [a1 lapHand2];
}

id objc_msgSend_laps(void *a1, const char *a2, ...)
{
  return [a1 laps];
}

id objc_msgSend_largeAnalogHandsFullRotationDuration(void *a1, const char *a2, ...)
{
  return [a1 largeAnalogHandsFullRotationDuration];
}

id objc_msgSend_largeHandsAnimationFPS(void *a1, const char *a2, ...)
{
  return [a1 largeHandsAnimationFPS];
}

id objc_msgSend_largeTickSize(void *a1, const char *a2, ...)
{
  return [a1 largeTickSize];
}

id objc_msgSend_largeTicksAnchorPoint(void *a1, const char *a2, ...)
{
  return [a1 largeTicksAnchorPoint];
}

id objc_msgSend_largerTicksTestBlock(void *a1, const char *a2, ...)
{
  return [a1 largerTicksTestBlock];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layerDisabledActions(void *a1, const char *a2, ...)
{
  return [a1 layerDisabledActions];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMarkers(void *a1, const char *a2, ...)
{
  return [a1 layoutMarkers];
}

id objc_msgSend_leftSubdialAnalogHandsFullRotationDuration(void *a1, const char *a2, ...)
{
  return [a1 leftSubdialAnalogHandsFullRotationDuration];
}

id objc_msgSend_leftSubdialHandsAnimationFPS(void *a1, const char *a2, ...)
{
  return [a1 leftSubdialHandsAnimationFPS];
}

id objc_msgSend_leftSubdialView(void *a1, const char *a2, ...)
{
  return [a1 leftSubdialView];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return [a1 legibilityWeight];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightTickColor(void *a1, const char *a2, ...)
{
  return [a1 lightTickColor];
}

id objc_msgSend_loadCities(void *a1, const char *a2, ...)
{
  return [a1 loadCities];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locationName(void *a1, const char *a2, ...)
{
  return [a1 locationName];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_magnifierLensBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 magnifierLensBackgroundColor];
}

id objc_msgSend_magnifierLensBorderColor(void *a1, const char *a2, ...)
{
  return [a1 magnifierLensBorderColor];
}

id objc_msgSend_markerFillColor(void *a1, const char *a2, ...)
{
  return [a1 markerFillColor];
}

id objc_msgSend_markerOutlineColor(void *a1, const char *a2, ...)
{
  return [a1 markerOutlineColor];
}

id objc_msgSend_markerTextBlock(void *a1, const char *a2, ...)
{
  return [a1 markerTextBlock];
}

id objc_msgSend_markers(void *a1, const char *a2, ...)
{
  return [a1 markers];
}

id objc_msgSend_markersAngleProvider(void *a1, const char *a2, ...)
{
  return [a1 markersAngleProvider];
}

id objc_msgSend_markersCount(void *a1, const char *a2, ...)
{
  return [a1 markersCount];
}

id objc_msgSend_markersDiameter(void *a1, const char *a2, ...)
{
  return [a1 markersDiameter];
}

id objc_msgSend_markersFont(void *a1, const char *a2, ...)
{
  return [a1 markersFont];
}

id objc_msgSend_markersView(void *a1, const char *a2, ...)
{
  return [a1 markersView];
}

id objc_msgSend_maxWidth(void *a1, const char *a2, ...)
{
  return [a1 maxWidth];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_monogramTextColor(void *a1, const char *a2, ...)
{
  return [a1 monogramTextColor];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nightDialColor(void *a1, const char *a2, ...)
{
  return [a1 nightDialColor];
}

id objc_msgSend_noneLocation(void *a1, const char *a2, ...)
{
  return [a1 noneLocation];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfMarkers(void *a1, const char *a2, ...)
{
  return [a1 numberOfMarkers];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalPalette(void *a1, const char *a2, ...)
{
  return [a1 originalPalette];
}

id objc_msgSend_outerMarkersColor(void *a1, const char *a2, ...)
{
  return [a1 outerMarkersColor];
}

id objc_msgSend_palette(void *a1, const char *a2, ...)
{
  return [a1 palette];
}

id objc_msgSend_pickerViewFrame(void *a1, const char *a2, ...)
{
  return [a1 pickerViewFrame];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_pigmentOptionProvider(void *a1, const char *a2, ...)
{
  return [a1 pigmentOptionProvider];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_preCountUpClockHands(void *a1, const char *a2, ...)
{
  return [a1 preCountUpClockHands];
}

id objc_msgSend_prepareForEditing(void *a1, const char *a2, ...)
{
  return [a1 prepareForEditing];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_primaryHandView(void *a1, const char *a2, ...)
{
  return [a1 primaryHandView];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_registerForStopwatchNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForStopwatchNotifications];
}

id objc_msgSend_reloadMarkers(void *a1, const char *a2, ...)
{
  return [a1 reloadMarkers];
}

id objc_msgSend_removeAllTransitionViews(void *a1, const char *a2, ...)
{
  return [a1 removeAllTransitionViews];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resetButton(void *a1, const char *a2, ...)
{
  return [a1 resetButton];
}

id objc_msgSend_resetButtonAlpha(void *a1, const char *a2, ...)
{
  return [a1 resetButtonAlpha];
}

id objc_msgSend_rightSubdialAnalogHandsFullRotationDuration(void *a1, const char *a2, ...)
{
  return [a1 rightSubdialAnalogHandsFullRotationDuration];
}

id objc_msgSend_rightSubdialHandsAnimationFPS(void *a1, const char *a2, ...)
{
  return [a1 rightSubdialHandsAnimationFPS];
}

id objc_msgSend_rightSubdialView(void *a1, const char *a2, ...)
{
  return [a1 rightSubdialView];
}

id objc_msgSend_ring(void *a1, const char *a2, ...)
{
  return [a1 ring];
}

id objc_msgSend_rise(void *a1, const char *a2, ...)
{
  return [a1 rise];
}

id objc_msgSend_rotateToMinuteHand(void *a1, const char *a2, ...)
{
  return [a1 rotateToMinuteHand];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandColor(void *a1, const char *a2, ...)
{
  return [a1 secondHandColor];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondaryBackgroundLayer(void *a1, const char *a2, ...)
{
  return [a1 secondaryBackgroundLayer];
}

id objc_msgSend_secondaryHandView(void *a1, const char *a2, ...)
{
  return [a1 secondaryHandView];
}

id objc_msgSend_secondaryMarkerTextBlock(void *a1, const char *a2, ...)
{
  return [a1 secondaryMarkerTextBlock];
}

id objc_msgSend_secondaryMarkersCount(void *a1, const char *a2, ...)
{
  return [a1 secondaryMarkersCount];
}

id objc_msgSend_secondaryMarkersDiameter(void *a1, const char *a2, ...)
{
  return [a1 secondaryMarkersDiameter];
}

id objc_msgSend_secondaryMarkersFont(void *a1, const char *a2, ...)
{
  return [a1 secondaryMarkersFont];
}

id objc_msgSend_secondsAngleForCurrentDate(void *a1, const char *a2, ...)
{
  return [a1 secondsAngleForCurrentDate];
}

id objc_msgSend_secondsHand(void *a1, const char *a2, ...)
{
  return [a1 secondsHand];
}

id objc_msgSend_selectedTimezoneLocation(void *a1, const char *a2, ...)
{
  return [a1 selectedTimezoneLocation];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupForTimeMode(void *a1, const char *a2, ...)
{
  return [a1 setupForTimeMode];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_shouldAnimateTimescaleTransition(void *a1, const char *a2, ...)
{
  return [a1 shouldAnimateTimescaleTransition];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smallTickSize(void *a1, const char *a2, ...)
{
  return [a1 smallTickSize];
}

id objc_msgSend_smallTicksAnchorPoint(void *a1, const char *a2, ...)
{
  return [a1 smallTicksAnchorPoint];
}

id objc_msgSend_startAnimatingHands(void *a1, const char *a2, ...)
{
  return [a1 startAnimatingHands];
}

id objc_msgSend_startButton(void *a1, const char *a2, ...)
{
  return [a1 startButton];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startListeningForLocalTimeZoneChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 startListeningForLocalTimeZoneChangeNotification];
}

id objc_msgSend_startListeningForLocationChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 startListeningForLocationChangeNotification];
}

id objc_msgSend_startListeningForSignificantTimeChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 startListeningForSignificantTimeChangeNotification];
}

id objc_msgSend_startStopButton(void *a1, const char *a2, ...)
{
  return [a1 startStopButton];
}

id objc_msgSend_stopAnimatingHands(void *a1, const char *a2, ...)
{
  return [a1 stopAnimatingHands];
}

id objc_msgSend_stopAnimatingSubdialMinuteHand(void *a1, const char *a2, ...)
{
  return [a1 stopAnimatingSubdialMinuteHand];
}

id objc_msgSend_stopButton(void *a1, const char *a2, ...)
{
  return [a1 stopButton];
}

id objc_msgSend_stopEditing(void *a1, const char *a2, ...)
{
  return [a1 stopEditing];
}

id objc_msgSend_stopListeningForLocalTimeZoneChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForLocalTimeZoneChangeNotification];
}

id objc_msgSend_stopListeningForLocationChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForLocationChangeNotification];
}

id objc_msgSend_stopListeningForSignificantTimeChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForSignificantTimeChangeNotification];
}

id objc_msgSend_stopListeningForTimezoneChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 stopListeningForTimezoneChangeNotification];
}

id objc_msgSend_stopwatchModel(void *a1, const char *a2, ...)
{
  return [a1 stopwatchModel];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_subdialClock(void *a1, const char *a2, ...)
{
  return [a1 subdialClock];
}

id objc_msgSend_subdialClockHand(void *a1, const char *a2, ...)
{
  return [a1 subdialClockHand];
}

id objc_msgSend_subdialClockTicks(void *a1, const char *a2, ...)
{
  return [a1 subdialClockTicks];
}

id objc_msgSend_subdialClockTicksSecondary(void *a1, const char *a2, ...)
{
  return [a1 subdialClockTicksSecondary];
}

id objc_msgSend_sunriseHourOfDay(void *a1, const char *a2, ...)
{
  return [a1 sunriseHourOfDay];
}

id objc_msgSend_sunsetHourOfDay(void *a1, const char *a2, ...)
{
  return [a1 sunsetHourOfDay];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_textProvider(void *a1, const char *a2, ...)
{
  return [a1 textProvider];
}

id objc_msgSend_tickSizeAtIndexBlock(void *a1, const char *a2, ...)
{
  return [a1 tickSizeAtIndexBlock];
}

id objc_msgSend_tickView(void *a1, const char *a2, ...)
{
  return [a1 tickView];
}

id objc_msgSend_ticksAngleProvider(void *a1, const char *a2, ...)
{
  return [a1 ticksAngleProvider];
}

id objc_msgSend_ticksContentInset(void *a1, const char *a2, ...)
{
  return [a1 ticksContentInset];
}

id objc_msgSend_ticksCount(void *a1, const char *a2, ...)
{
  return [a1 ticksCount];
}

id objc_msgSend_ticksDialColor(void *a1, const char *a2, ...)
{
  return [a1 ticksDialColor];
}

id objc_msgSend_ticksView(void *a1, const char *a2, ...)
{
  return [a1 ticksView];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeLapsedInactiveLabel(void *a1, const char *a2, ...)
{
  return [a1 timeLapsedInactiveLabel];
}

id objc_msgSend_timeLapsedLabel(void *a1, const char *a2, ...)
{
  return [a1 timeLapsedLabel];
}

id objc_msgSend_timeScale(void *a1, const char *a2, ...)
{
  return [a1 timeScale];
}

id objc_msgSend_timeUntilLastLap(void *a1, const char *a2, ...)
{
  return [a1 timeUntilLastLap];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timescale(void *a1, const char *a2, ...)
{
  return [a1 timescale];
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return [a1 timezone];
}

id objc_msgSend_topLabel(void *a1, const char *a2, ...)
{
  return [a1 topLabel];
}

id objc_msgSend_trackingTicksView(void *a1, const char *a2, ...)
{
  return [a1 trackingTicksView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transitionDialTickView(void *a1, const char *a2, ...)
{
  return [a1 transitionDialTickView];
}

id objc_msgSend_transitionLeftSubdialView(void *a1, const char *a2, ...)
{
  return [a1 transitionLeftSubdialView];
}

id objc_msgSend_transitionRightSubdialView(void *a1, const char *a2, ...)
{
  return [a1 transitionRightSubdialView];
}

id objc_msgSend_tritiumAnimationInProgress(void *a1, const char *a2, ...)
{
  return [a1 tritiumAnimationInProgress];
}

id objc_msgSend_unregisterForStopwatchNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForStopwatchNotifications];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateBezelMarkerForCurrentDate(void *a1, const char *a2, ...)
{
  return [a1 updateBezelMarkerForCurrentDate];
}

id objc_msgSend_updateCenterLabelColor(void *a1, const char *a2, ...)
{
  return [a1 updateCenterLabelColor];
}

id objc_msgSend_updateCenterLabelColorForChronometerMode(void *a1, const char *a2, ...)
{
  return [a1 updateCenterLabelColorForChronometerMode];
}

id objc_msgSend_updateCenterLabelColorForTimeMode(void *a1, const char *a2, ...)
{
  return [a1 updateCenterLabelColorForTimeMode];
}

id objc_msgSend_updateCenterLabelFrame(void *a1, const char *a2, ...)
{
  return [a1 updateCenterLabelFrame];
}

id objc_msgSend_updateChronoLargeHandsCenterPoint(void *a1, const char *a2, ...)
{
  return [a1 updateChronoLargeHandsCenterPoint];
}

id objc_msgSend_updateCircularMask(void *a1, const char *a2, ...)
{
  return [a1 updateCircularMask];
}

id objc_msgSend_updateCountUp(void *a1, const char *a2, ...)
{
  return [a1 updateCountUp];
}

id objc_msgSend_updateFrameForCountUpLabel(void *a1, const char *a2, ...)
{
  return [a1 updateFrameForCountUpLabel];
}

id objc_msgSend_updateGMTHourHands(void *a1, const char *a2, ...)
{
  return [a1 updateGMTHourHands];
}

id objc_msgSend_updateHandsPosition(void *a1, const char *a2, ...)
{
  return [a1 updateHandsPosition];
}

id objc_msgSend_updateInnerCircleColor(void *a1, const char *a2, ...)
{
  return [a1 updateInnerCircleColor];
}

id objc_msgSend_updateMagnifierMask(void *a1, const char *a2, ...)
{
  return [a1 updateMagnifierMask];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_updatePickerViewSelection(void *a1, const char *a2, ...)
{
  return [a1 updatePickerViewSelection];
}

id objc_msgSend_updatePickerViewWithTimezones(void *a1, const char *a2, ...)
{
  return [a1 updatePickerViewWithTimezones];
}

id objc_msgSend_updateSecondaryHandVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateSecondaryHandVisibility];
}

id objc_msgSend_updateStartStopButtonColor(void *a1, const char *a2, ...)
{
  return [a1 updateStartStopButtonColor];
}

id objc_msgSend_updateSubdialMinuteHandPosition(void *a1, const char *a2, ...)
{
  return [a1 updateSubdialMinuteHandPosition];
}

id objc_msgSend_updateSubdialViewFrames(void *a1, const char *a2, ...)
{
  return [a1 updateSubdialViewFrames];
}

id objc_msgSend_updateTicksForCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 updateTicksForCurrentTime];
}

id objc_msgSend_updateTimeViewColor(void *a1, const char *a2, ...)
{
  return [a1 updateTimeViewColor];
}

id objc_msgSend_updateTimeViewHandsVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateTimeViewHandsVisibility];
}

id objc_msgSend_updateTrackingTicks(void *a1, const char *a2, ...)
{
  return [a1 updateTrackingTicks];
}

id objc_msgSend_updateWorldClockCitiesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 updateWorldClockCitiesIfNeeded];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewsLoaded(void *a1, const char *a2, ...)
{
  return [a1 viewsLoaded];
}

id objc_msgSend_visibleMarkersTestBlock(void *a1, const char *a2, ...)
{
  return [a1 visibleMarkersTestBlock];
}

id objc_msgSend_visibleSecondaryMarkersTestBlock(void *a1, const char *a2, ...)
{
  return [a1 visibleSecondaryMarkersTestBlock];
}

id objc_msgSend_wantsStatusBarHidden(void *a1, const char *a2, ...)
{
  return [a1 wantsStatusBarHidden];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_worldClockCities(void *a1, const char *a2, ...)
{
  return [a1 worldClockCities];
}

id objc_msgSend_zRotationForTime_withDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zRotationForTime:withDuration:");
}