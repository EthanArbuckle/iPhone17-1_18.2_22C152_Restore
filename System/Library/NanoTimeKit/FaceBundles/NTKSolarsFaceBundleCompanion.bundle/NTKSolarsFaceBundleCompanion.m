void sub_42B4(void *a1@<X0>, _OWORD *a2@<X8>)
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
  os_unfair_lock_lock((os_unfair_lock_t)&unk_357C0);
  WeakRetained = objc_loadWeakRetained(&qword_357C8);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&qword_357C8);
    if (v5 == obj)
    {
      v6 = [obj version];
      v7 = qword_357D0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v8 = objc_storeWeak(&qword_357C8, obj);
  qword_357D0 = (uint64_t)[obj version];

  sub_460C(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_357C0);
  v10 = unk_35790;
  *a2 = xmmword_35780;
  a2[1] = v10;
  v11 = unk_357B0;
  a2[2] = xmmword_357A0;
  a2[3] = v11;
}

void sub_460C(uint64_t a1, uint64_t a2)
{
  id v10 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v10 scaledValue:3 withOverride:5.0 forSizeClass:5.0];
  *(void *)&xmmword_35780 = v2;
  objc_msgSend(v10, "scaledSize:withOverride:forSizeClass:", 3, 2.0, 8.0, 2.5, 9.0);
  *((void *)&xmmword_35780 + 1) = v3;
  unk_35790 = v4;
  objc_msgSend(v10, "scaledSize:withOverride:forSizeClass:", 3, 2.0, 2.0, 2.5, 2.5);
  qword_35798 = v5;
  *(void *)&xmmword_357A0 = v6;
  [v10 scaledValue:21.5];
  qword_357B8 = v7;
  [v10 setRoundingBehavior:3];
  objc_msgSend(v10, "scaledSize:withOverride:forSizeClass:", 3, 1.25, 3.75, 1.25, 3.75);
  *((void *)&xmmword_357A0 + 1) = v8;
  unk_357B0 = v9;
}

void sub_4DFC(id a1, NTKBezierPathView *a2, unint64_t a3, BOOL *a4)
{
}

id sub_4E04(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a2 type]);
  id v4 = [v2 containsObject:v3];

  return v4;
}

void sub_64E0(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_35840);
  id WeakRetained = objc_loadWeakRetained(&qword_35848);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_35848);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_35850;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_35848, obj);
  qword_35850 = (uint64_t)[obj version];

  sub_C4D0(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_35840);
  long long v10 = *(_OWORD *)&qword_35828;
  *(_OWORD *)(a2 + 64) = xmmword_35818;
  *(_OWORD *)(a2 + 80) = v10;
  *(void *)(a2 + 96) = qword_35838;
  long long v11 = *(_OWORD *)&qword_357E8;
  *(_OWORD *)a2 = xmmword_357D8;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = *(_OWORD *)&qword_35808;
  *(_OWORD *)(a2 + 32) = xmmword_357F8;
  *(_OWORD *)(a2 + 48) = v12;
}

void sub_7D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7D8C(uint64_t a1, void *a2, id *a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained dataMode] == (char *)&dword_0 + 1)
  {
    id v6 = +[NTKTimeOffsetManager sharedManager];
    uint64_t v7 = [v6 displayTimeForRealTime:*a3];
    [WeakRetained _updateSolarPathForChangedDate:v7 animated:0];
  }
  objc_msgSend(WeakRetained, "_updateTimeScrubbingContentForViewMode:", objc_msgSend(WeakRetained, "viewMode"));
}

void sub_7E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_7E64(id a1)
{
  return (NSString *)@"solar face view";
}

void sub_84EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLocale];
}

id sub_9AB4(void *a1, void *a2, double a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = v8;
  double v10 = 0.25;
  if (a3 <= 0.25)
  {
    *(float *)&double v10 = a4;
    id v8 = v7;
  }
  else
  {
    float v11 = a4;
    double v10 = 0.75;
    if (a3 < 0.75)
    {
      *(float *)&double v10 = v11;
      long long v12 = [v7 colorForFraction:v10];
      *(float *)&double v13 = v11;
      v14 = [v9 colorForFraction:v13];
      v15 = NTKInterpolateBetweenColors();

      goto LABEL_7;
    }
    *(float *)&double v10 = v11;
  }
  v15 = [v8 colorForFraction:v10];
LABEL_7:

  return v15;
}

id sub_A83C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v4) {
    [v4 transform];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }
  CGAffineTransformTranslate(&v7, &v6, -*(double *)(a1 + 48), 0.0);
  [v4 setTransform:&v7];
  [*(id *)(*(void *)(a1 + 32) + 80) setAlpha:0.0];
  return [*(id *)(a1 + 40) setAlpha:0.0];
}

id sub_A90C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 72) transform];
  }
  else {
    memset(&v4, 0, sizeof(v4));
  }
  CGAffineTransformTranslate(&v5, &v4, *(CGFloat *)(a1 + 56), 0.0);
  [v2 setTransform:&v5];
  [*(id *)(*(void *)(a1 + 32) + 80) setAlpha:1.0];
  [*(id *)(a1 + 32) _endAnimatingForReason:@"_NTKSolarPathDateChangeAnimatingReason"];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  [*(id *)(*(void *)(a1 + 32) + 200) percentageThroughPeriodForDate:*(void *)(a1 + 48)];
  objc_msgSend(*(id *)(a1 + 32), "_solarDiskPercentageChanged:");
  objc_msgSend(*(id *)(a1 + 32), "_animateSolarDiskToRestPercentageIfNeededForViewMode:", objc_msgSend(*(id *)(a1 + 32), "viewMode"));
  return [*(id *)(a1 + 32) setNeedsLayout];
}

id sub_AE74(uint64_t a1)
{
  [*(id *)(a1 + 32) _solarDiskRestPercentage];
  long long v3 = *(double **)(a1 + 32);
  if (v3[15] != -1.0) {
    double v2 = v3[15];
  }
  CGAffineTransform v4 = (void *)*((void *)v3 + 9);
  [v3 _pointOnSolarPathForPercentage:v2];

  return objc_msgSend(v4, "setCenter:");
}

id sub_B33C()
{
  if (qword_35870 != -1) {
    dispatch_once(&qword_35870, &stru_2CA28);
  }
  v0 = (void *)qword_35868;

  return v0;
}

void sub_C4D0(uint64_t a1, uint64_t a2)
{
  double v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v53[0] = &off_2DB68;
  v53[1] = &off_2DB80;
  v54[0] = &off_2E140;
  v54[1] = &off_2E150;
  long long v3 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  [v2 scaledValue:v3 withOverrides:16.0];
  *(void *)&xmmword_357D8 = v4;

  v51[0] = &off_2DB68;
  v51[1] = &off_2DB98;
  v52[0] = &off_2E160;
  v52[1] = &off_2E160;
  v51[2] = &off_2DB80;
  v52[2] = &off_2E170;
  CGAffineTransform v5 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:3];
  [v2 scaledValue:v5 withOverrides:16.0];
  qword_357E8 = v6;

  v49[0] = &off_2DB68;
  v49[1] = &off_2DB98;
  v50[0] = &off_2E160;
  v50[1] = &off_2E160;
  v49[2] = &off_2DB80;
  v50[2] = &off_2E180;
  CGAffineTransform v7 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3];
  [v2 scaledValue:v7 withOverrides:6.0];
  qword_357F0 = v8;

  v47[0] = &off_2DB68;
  v47[1] = &off_2DB80;
  v48[0] = &off_2E190;
  v48[1] = &off_2E190;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
  [v2 scaledValue:v9 withOverrides:18.5];
  *(void *)&xmmword_357F8 = v10;

  v45[0] = &off_2DB98;
  v45[1] = &off_2DB80;
  v46[0] = &off_2DBB0;
  v46[1] = &off_2DBB0;
  float v11 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
  [v2 scaledValue:v11 withOverrides:99.0];
  *((void *)&xmmword_357F8 + 1) = v12;

  v43[0] = &off_2DB98;
  v43[1] = &off_2DB80;
  v44[0] = &off_2E1A0;
  v44[1] = &off_2E1A0;
  double v13 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
  [v2 scaledValue:v13 withOverrides:54.0];
  qword_35808 = v14;

  v41[0] = &off_2DB98;
  v41[1] = &off_2DB80;
  v42[0] = &off_2E1A0;
  v42[1] = &off_2E1A0;
  v15 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
  [v2 scaledValue:v15 withOverrides:54.0];
  qword_35810 = v16;

  v39[0] = &off_2DB98;
  v39[1] = &off_2DB80;
  v40[0] = &off_2DBB0;
  v40[1] = &off_2DBB0;
  v17 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
  [v2 scaledValue:v17 withOverrides:99.0];
  *(void *)&xmmword_35818 = v18;

  v37[0] = &off_2DB98;
  v37[1] = &off_2DB80;
  v38[0] = &off_2E1B0;
  v38[1] = &off_2E1B0;
  v19 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  [v2 scaledValue:v19 withOverrides:87.25];
  *((void *)&xmmword_35818 + 1) = v20;

  v35[0] = &off_2DB98;
  v35[1] = &off_2DB80;
  v36[0] = &off_2E1C0;
  v36[1] = &off_2E1C0;
  v21 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  [v2 scaledValue:v21 withOverrides:67.5];
  qword_35828 = v22;

  v33[0] = &off_2DB98;
  v33[1] = &off_2DB80;
  v34[0] = &off_2E1A0;
  v34[1] = &off_2E1A0;
  v23 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  [v2 scaledValue:v23 withOverrides:54.0];
  qword_35830 = v24;

  v31[0] = &off_2DB98;
  v31[1] = &off_2DB80;
  v32[0] = &off_2E1D0;
  v32[1] = &off_2E1D0;
  v25 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  [v2 scaledValue:v25 withOverrides:5.5];
  qword_35838 = v26;

  [v2 setRoundingBehavior:0];
  v29[0] = &off_2DB98;
  v29[1] = &off_2DB80;
  v30[0] = &off_2E1E0;
  v30[1] = &off_2E1E0;
  v27 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  [v2 scaledValue:v27 withOverrides:1.15];
  *((void *)&xmmword_357D8 + 1) = v28;
}

void sub_C934(id a1)
{
  uint64_t v1 = +[NTKSolarFaceBundle localizedStringForKey:@"SOLAR_USE_ALL_UPPERCASE_TEXT" comment:@"1"];
  if (v1 && [@"1" isEqualToString:v1]) {
    byte_35858 = 1;
  }

  _objc_release_x1();
}

void sub_C9B0(id a1)
{
  qword_35868 = +[NTKSolarFaceBundle localizedStringForKey:@"SOLAR_DATE_NOW" comment:@"NOW"];

  _objc_release_x1();
}

void sub_D048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_D0A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_D0B4(uint64_t a1)
{
}

id sub_D0BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v21 = 0;
    goto LABEL_14;
  }
  long long v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)WeakRetained + 1);
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "NTKSiderealCachedMTLTexture: Could not find cached data for key: %@", buf, 0xCu);
  }

  CGAffineTransform v5 = (*(void (**)(void))(*((void *)WeakRetained + 5) + 16))();
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v22 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1C918();
    }
    goto LABEL_12;
  }
  id v7 = v5;
  uint64_t v8 = (CGImage *)[v7 CGImage];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGImageGetWidth(v8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGImageGetHeight(v8);
  size_t BytesPerRow = CGImageGetBytesPerRow(v8);
  id v10 = [*((id *)WeakRetained + 4) newBufferWithLength:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)* *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) options:0];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  DataProvider = CGImageGetDataProvider(v8);
  CFDataRef v14 = CGDataProviderCopyData(DataProvider);
  if (!v14)
  {
    uint64_t v22 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1C980();
    }
LABEL_12:

    id v21 = 0;
    goto LABEL_13;
  }
  CFDataRef v15 = v14;
  BytePtr = CFDataGetBytePtr(v14);
  id v17 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) contents];
  uint64_t v18 = *(void *)(a1 + 40);
  size_t v19 = *(void *)(*(void *)(v18 + 8) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D410;
  block[3] = &unk_2CA50;
  block[6] = BytePtr;
  block[7] = BytesPerRow;
  block[8] = v17;
  uint64_t v20 = *(void *)(a1 + 32);
  block[4] = v18;
  block[5] = v20;
  dispatch_apply(v19, 0, block);
  CFRelease(v15);
  id v21 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (unint64_t)((double)(unint64_t)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length")+ 16.0));
  [v21 appendBytes:*(void *)(*(void *)(a1 + 32) + 8) + 24 length:8];
  [v21 appendBytes:*(void *)(*(void *)(a1 + 40) + 8) + 24 length:8];
  objc_msgSend(v21, "appendBytes:length:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "contents"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"));
  uint64_t v6 = v7;
LABEL_13:

LABEL_14:

  return v21;
}

void *sub_D410(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result[5] + 8) + 24);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = result[8] + v2 * a2;
    CGAffineTransform v5 = (char *)((*(void *)(*(void *)(result[4] + 8) + 24) + ~a2) * result[7] + result[6] + 3);
    do
    {
      char v6 = *v5;
      v5 += 4;
      *(unsigned char *)(v4 + v3++) = v6;
    }
    while (*(void *)(*(void *)(result[5] + 8) + 24) > v3);
  }
  return result;
}

id sub_D474(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 24);
  v9[0] = *(void *)(*(void *)(a1[6] + 8) + 24);
  v9[1] = v5;
  v9[2] = 1;
  memset(v8, 0, sizeof(v8));
  [a2 copyFromBuffer:v4 sourceOffset:0 sourceBytesPerRow:v9[0] sourceBytesPerImage:v5 * v9[0] sourceSize:v9 toTexture:v3 destinationSlice:0 destinationLevel:0 destinationOrigin:v8];
  char v6 = (void *)a1[4];

  return v6;
}

void sub_D8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 144), 8);
  _Unwind_Resume(a1);
}

id sub_D900(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v20 = 0;
    goto LABEL_12;
  }
  uint64_t v3 = (*(void (**)(void))(*((void *)WeakRetained + 5) + 16))();
  uint64_t v4 = v3;
  if (!v3)
  {
    id v21 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1C918();
    }
    goto LABEL_10;
  }
  id v5 = v3;
  char v6 = (CGImage *)[v5 CGImage];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CGImageGetWidth(v6);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGImageGetHeight(v6);
  size_t BytesPerRow = CGImageGetBytesPerRow(v6);
  uint64_t v8 = 4 * *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v9 = [*((id *)WeakRetained + 4) newBufferWithLength:v8 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) options:0];
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  DataProvider = CGImageGetDataProvider(v6);
  CFDataRef v13 = CGDataProviderCopyData(DataProvider);
  if (!v13)
  {
    id v21 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1C980();
    }
LABEL_10:

    id v20 = 0;
    goto LABEL_11;
  }
  CFDataRef v14 = v13;
  BytePtr = CFDataGetBytePtr(v13);
  id v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) contents];
  uint64_t v17 = *(void *)(a1 + 40);
  size_t v18 = *(void *)(*(void *)(v17 + 8) + 24);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_DBD4;
  v23[3] = &unk_2CAC8;
  v23[6] = BytePtr;
  v23[7] = BytesPerRow;
  v23[8] = v16;
  v23[9] = v8;
  uint64_t v19 = *(void *)(a1 + 32);
  v23[4] = v17;
  v23[5] = v19;
  dispatch_apply(v18, 0, v23);
  CFRelease(v14);
  id v20 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (unint64_t)((double)(unint64_t)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length")+ 16.0));
  [v20 appendBytes:*(void *)(*(void *)(a1 + 32) + 8) + 24 length:8];
  [v20 appendBytes:*(void *)(*(void *)(a1 + 40) + 8) + 24 length:8];
  objc_msgSend(v20, "appendBytes:length:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "contents"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"));
  uint64_t v4 = v5;
LABEL_11:

LABEL_12:

  return v20;
}

void *sub_DBD4(void *result, uint64_t a2)
{
  if ((*(void *)(*(void *)(result[5] + 8) + 24) & 0x3FFFFFFFFFFFFFFFLL) != 0)
  {
    unint64_t v2 = 0;
    uint64_t v3 = result[6] + (*(void *)(*(void *)(result[4] + 8) + 24) + ~a2) * result[7];
    uint64_t v4 = result[8] + result[9] * a2;
    do
    {
      *(unsigned char *)(v4 + v2) = *(unsigned char *)(v3 + v2);
      ++v2;
    }
    while (v2 < 4 * *(void *)(*(void *)(result[5] + 8) + 24));
  }
  return result;
}

id sub_DC34(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(*(void *)(a1[5] + 8) + 40);
  uint64_t v5 = 4 * *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v6 = *(void *)(*(void *)(a1[7] + 8) + 24);
  v10[0] = *(void *)(*(void *)(a1[6] + 8) + 24);
  v10[1] = v6;
  v10[2] = 1;
  memset(v9, 0, sizeof(v9));
  [a2 copyFromBuffer:v4 sourceOffset:0 sourceBytesPerRow:v5 sourceBytesPerImage:v5 * v6 sourceSize:v10 toTexture:v3 destinationSlice:0 destinationLevel:0 destinationOrigin:v9];
  id v7 = (void *)a1[4];

  return v7;
}

void sub_DE98(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_DEB4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_DEE4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_E424(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_358B0);
  id WeakRetained = objc_loadWeakRetained(&qword_358B8);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_358B8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_358C0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_358B8, obj);
  qword_358C0 = (uint64_t)[obj version];

  sub_EF50(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_358B0);
  long long v10 = unk_35888;
  *(_OWORD *)a2 = xmmword_35878;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_35898;
  *(void *)(a2 + 48) = qword_358A8;
}

void sub_EF50(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  double v5 = v3;

  *(double *)&xmmword_35878 = v5;
  *(long long *)((char *)&xmmword_35878 + 8) = xmmword_23840;
  unk_35890 = vmulq_n_f64((float64x2_t)xmmword_23850, v5);
  [v6 scaledValue:3 withOverride:14.0 forSizeClass:16.0];
  *((void *)&xmmword_35898 + 1) = v4;
  qword_358A8 = 0x4020000000000000;
}

void sub_F690(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_35908);
  id WeakRetained = objc_loadWeakRetained(&qword_35910);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_35910);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_35918;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_35910, obj);
  qword_35918 = (uint64_t)[obj version];

  sub_10788(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_35908);
  long long v10 = *(_OWORD *)&qword_358D8;
  *a2 = xmmword_358C8;
  a2[1] = v10;
  long long v11 = *(_OWORD *)&qword_358F8;
  a2[2] = xmmword_358E8;
  a2[3] = v11;
}

void sub_10788(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v11 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v11 scaledValue:3 withOverride:15.0 forSizeClass:18.0];
  *(void *)&xmmword_358C8 = v3;
  [v11 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  qword_358D8 = v4;
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  double v6 = v5;

  *(double *)&xmmword_358E8 = v6 * 0.5;
  *((void *)&xmmword_358E8 + 1) = 0x3FF0000000000000;
  [v11 scaledValue:3 withOverride:95.0 forSizeClass:109.0];
  qword_358F8 = v7;
  [v11 scaledValue:3 withOverride:74.0 forSizeClass:74.0];
  qword_35900 = v8;
  [v11 setRoundingBehavior:3];
  [v11 scaledValue:3 withOverride:1.0 forSizeClass:0.75];
  *((void *)&xmmword_358C8 + 1) = v9;
  [v11 scaledValue:3 withOverride:1.25 forSizeClass:1.5];
  qword_358E0 = v10;
}

id sub_119D0(id a1)
{
  id v1 = [objc_alloc((Class)NTKSiderealDataSource) initWithXR:0];

  return v1;
}

void sub_11DF8(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_359C8);
  id WeakRetained = objc_loadWeakRetained(&qword_359D0);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_359D0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_359D8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_359D0, obj);
  qword_359D8 = (uint64_t)[obj version];

  sub_17760(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_359C8);
  long long v10 = *(_OWORD *)&qword_359A8;
  a2[2] = xmmword_35998;
  a2[3] = v10;
  a2[4] = xmmword_359B8;
  long long v11 = *(_OWORD *)&qword_35988;
  *a2 = xmmword_35978;
  a2[1] = v11;
}

void sub_12B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_12B84(uint64_t a1, void *a2, id *a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = +[NTKTimeOffsetManager sharedManager];
    uint64_t v7 = [v6 faceDisplayTime];
    [WeakRetained _timeDidUpdate:v7];
  }
}

void sub_12C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_12C38(id a1)
{
  return (NSString *)@"solar dial face view";
}

void sub_12F68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateLocale];
    id WeakRetained = v2;
  }
}

void sub_135C4(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) normalComplicationDisplayWrapperForSlot:a2];
  id v2 = [v5 display];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v4 = [v5 display];
    [v4 updateMonochromeColor];
  }
}

uint64_t sub_13970(uint64_t a1)
{
  [*(id *)(a1 + 32) _interpolateFromViewMode:*(void *)(*(void *)(a1 + 32) + 176) toViewMode:*(void *)(a1 + 48) progress:1.0];
  [*(id *)(a1 + 32) _cleanupAfterSettingViewMode:*(void *)(a1 + 48) previousViewMode:*(void *)(*(void *)(a1 + 32) + 176)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) quad];
  [v2 setShouldDrawGlowPath:*(void *)(a1 + 48) == 1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_13DD0(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

id sub_13DDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetInteractionProgress];
}

id sub_13DE4(int a1, double a2)
{
  uint64_t v4 = objc_opt_new();
  [v4 setMaximumUnitCount:2];
  [v4 setFormattingContext:2];
  [v4 setAllowedUnits:96];
  [v4 setUnitsStyle:0];
  [v4 setZeroFormattingBehavior:0x10000];
  id v5 = [v4 stringFromTimeInterval:fabs(a2)];
  id v6 = +[NSLocale currentLocale];
  int IsRTL = CLKLayoutIsRTL();
  id v8 = [v5 uppercaseStringWithLocale:v6];

  uint64_t v9 = &stru_2D1F8;
  if (a1)
  {
    long long v10 = @"−";
    if (a2 >= 0.0) {
      long long v10 = @"+";
    }
    uint64_t v9 = v10;
  }
  CFStringRef v11 = @"\u200F";
  if (!IsRTL) {
    CFStringRef v11 = &stru_2D1F8;
  }
  uint64_t v12 = +[NSString stringWithFormat:@"%@%@%@", v11, v9, v8];

  return v12;
}

void sub_14170(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
}

double sub_1568C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_11DF8(v3, &v10);
  [*(id *)(a1 + 32) _idealizedSolarDayProgress];
  [v3 screenBounds];
  CLKRectGetCenter();
  CLKDegreesToRadians();
  NTKPointOnCircle();
  double v5 = v4;
  double v7 = v6;
  sub_11DF8(v3, &v9);

  qword_35930 = *((void *)&v9 + 1);
  qword_35938 = *((void *)&v9 + 1);
  *(double *)&qword_35920 = v5 - *((double *)&v9 + 1) * 0.5;
  double result = v7 - *((double *)&v9 + 1) * 0.5;
  *(double *)&qword_35928 = result;
  return result;
}

id sub_15940(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NTKSiderealDialView alloc];
  double v4 = [*(id *)(a1 + 32) device];
  [v4 screenBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CFDataRef v13 = [*(id *)(a1 + 32) device];
  sub_11DF8(v13, v20);
  double v14 = v20[0];
  CFDataRef v15 = [*(id *)(a1 + 32) device];
  id v16 = -[NTKSiderealDialView initWithFrame:dialDiameter:device:](v3, "initWithFrame:dialDiameter:device:", v15, v6, v8, v10, v12, v14);
  uint64_t v17 = (CGImage *)[v2 newImageRefFromView:v16];

  id v18 = [objc_alloc((Class)UIImage) initWithCGImage:v17];
  CGImageRelease(v17);

  return v18;
}

id sub_15B10(uint64_t a1)
{
  id v2 = [NTKSiderealWaypointsView alloc];
  id v3 = [*(id *)(a1 + 32) device];
  [v3 screenBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) device];
  sub_11DF8(v12, &v22);
  double v13 = v23;
  double v14 = [*(id *)(a1 + 32) device];
  sub_11DF8(v14, v21);
  double v15 = v21[0];
  id v16 = [*(id *)(*(void *)(a1 + 32) + 56) waypoints];
  uint64_t v17 = -[NTKSiderealWaypointsView initWithFrame:orbitDiameter:dialDiameter:waypoints:](v2, "initWithFrame:orbitDiameter:dialDiameter:waypoints:", v16, v5, v7, v9, v11, v13, v15);

  id v18 = (CGImage *)[*(id *)(a1 + 32) newImageRefFromView:v17];
  id v19 = [objc_alloc((Class)UIImage) initWithCGImage:v18];
  CGImageRelease(v18);

  return v19;
}

id sub_15EB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _newGnomonLayer];
  id v3 = objc_alloc_init((Class)CALayer);
  [v3 setOpaque:0];
  [v3 setBackgroundColor:0];
  [v2 size];
  double v5 = v4;
  [v2 size];
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v5, v6 + 4.0);
  [v3 addSublayer:v2];
  [v2 size];
  double v8 = v7;
  [v2 size];
  objc_msgSend(v2, "setFrame:", 0.0, 2.0, v8, v9);
  [v3 size];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = [*(id *)(a1 + 32) device];
  [v14 screenScale];
  CGFloat v16 = v15;
  v22.width = v11;
  v22.height = v13;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v16);

  CurrentContext = UIGraphicsGetCurrentContext();
  [v3 renderInContext:CurrentContext];
  Image = CGBitmapContextCreateImage(CurrentContext);
  UIGraphicsEndImageContext();
  id v19 = [objc_alloc((Class)UIImage) initWithCGImage:Image];
  CGImageRelease(Image);

  return v19;
}

id sub_160F4(uint64_t a1)
{
  [*(id *)(a1 + 32) poseForDayGnomonImage];
  double v3 = v2;
  [*(id *)(a1 + 32) setSolarDayProgress:0.75];
  double v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) dayContainerView];
  double v6 = (CGImage *)[v4 newImageRefFromSolarContainerView:v5 withHeight:v3];

  double v7 = +[UIImage imageWithCGImage:v6];
  CGImageRelease(v6);

  return v7;
}

id sub_1626C(uint64_t a1)
{
  [*(id *)(a1 + 32) poseForDayDiskBloomImage];
  double v3 = v2;
  [*(id *)(a1 + 32) setSolarDayProgress:0.75];
  double v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) dayContainerView];
  double v6 = (CGImage *)[v4 newImageRefFromSolarContainerView:v5 withHeight:v3];

  double v7 = +[UIImage imageWithCGImage:v6];
  CGImageRelease(v6);

  return v7;
}

id sub_163E4(uint64_t a1)
{
  [*(id *)(a1 + 32) poseForDayDiskImage];
  double v3 = v2;
  [*(id *)(a1 + 32) setSolarDayProgress:0.75];
  double v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) dayContainerView];
  double v6 = (CGImage *)[v4 newImageRefFromSolarContainerView:v5 withHeight:v3];

  double v7 = +[UIImage imageWithCGImage:v6];
  CGImageRelease(v6);

  return v7;
}

id sub_1655C(uint64_t a1)
{
  [*(id *)(a1 + 32) poseForNightGnomonImage];
  double v3 = v2;
  [*(id *)(a1 + 32) setSolarDayProgress:0.75];
  double v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) nightContainerView];
  double v6 = (CGImage *)[v4 newImageRefFromSolarContainerView:v5 withHeight:v3];

  double v7 = +[UIImage imageWithCGImage:v6];
  CGImageRelease(v6);

  return v7;
}

id sub_166D4(uint64_t a1)
{
  [*(id *)(a1 + 32) poseForNightDiskImage];
  double v3 = v2;
  [*(id *)(a1 + 32) setSolarDayProgress:0.75];
  double v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) nightContainerView];
  double v6 = (CGImage *)[v4 newImageRefFromSolarContainerView:v5 withHeight:v3];

  double v7 = +[UIImage imageWithCGImage:v6];
  CGImageRelease(v6);

  return v7;
}

id sub_1684C(uint64_t a1)
{
  [*(id *)(a1 + 32) poseForNightRingImage];
  double v3 = v2;
  [*(id *)(a1 + 32) setSolarDayProgress:0.75];
  double v4 = *(void **)(a1 + 40);
  double v5 = [*(id *)(a1 + 32) nightContainerView];
  double v6 = (CGImage *)[v4 newImageRefFromSolarContainerView:v5 withHeight:v3];

  double v7 = +[UIImage imageWithCGImage:v6];
  CGImageRelease(v6);

  return v7;
}

void sub_1730C(id a1)
{
  id v3 = +[NTKSiderealColorManager sharedInstance];
  uint64_t v1 = [v3 outerComplicationColorCurve];
  double v2 = (void *)qword_35958;
  qword_35958 = v1;
}

void sub_173E8(id a1)
{
  id v3 = +[NTKSiderealColorManager sharedInstance];
  uint64_t v1 = [v3 innerComplicationColorCurve];
  double v2 = (void *)qword_35968;
  qword_35968 = v1;
}

id sub_175F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setViewMode:0 animated:1 completion:0];
}

void sub_17760(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v11 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  *(void *)&xmmword_35978 = v3;
  [v11 scaledValue:3 withOverride:16.5 forSizeClass:20.0];
  qword_35988 = v4;
  [v11 scaledValue:3 withOverride:75.0 forSizeClass:85.0];
  *((void *)&xmmword_35978 + 1) = v5;
  [v11 scaledValue:3 withOverride:95.0 forSizeClass:109.0];
  qword_35990 = v6;
  xmmword_35998 = xmmword_23980;
  [v11 scaledValue:11.0];
  qword_359A8 = v7;
  [v11 scaledValue:57.5];
  *(double *)&qword_359B0 = v8 + 3.0;
  +[NTKAnalogUtilities dialSizeForDevice:v2];
  double v10 = v9;

  *(double *)&xmmword_359B8 = v10 * 0.5;
  *((void *)&xmmword_359B8 + 1) = 0x3FF0000000000000;
}

void sub_18658(_Unwind_Exception *exception_object)
{
}

id sub_18684()
{
  if (qword_35A58 != -1) {
    dispatch_once(&qword_35A58, &stru_2CCF8);
  }
  v0 = (void *)qword_35A50;

  return v0;
}

void sub_188CC(uint64_t a1, uint64_t a2)
{
  id v13 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v13 scaledValue:3 withOverride:8.0 forSizeClass:10.0];
  qword_359F0 = v2;
  [v13 scaledValue:3 withOverride:121.0 forSizeClass:139.0];
  qword_359E8 = v3;
  [v13 scaledValue:3 withOverride:153.0 forSizeClass:175.0];
  qword_359E0 = v4;
  objc_msgSend(v13, "scaledSize:withOverride:forSizeClass:", 3, 1.5, 8.5, 1.5, 9.5);
  qword_359F8 = v5;
  qword_35A00 = v6;
  objc_msgSend(v13, "scaledSize:withOverride:forSizeClass:", 3, 1.0, 8.0, 1.0, 8.5);
  qword_35A08 = v7;
  qword_35A10 = v8;
  objc_msgSend(v13, "scaledSize:withOverride:forSizeClass:", 3, 1.0, 5.0, 1.0, 5.5);
  qword_35A18 = v9;
  qword_35A20 = v10;
  [v13 scaledValue:3 withOverride:0.5 forSizeClass:1.0];
  qword_35A28 = v11;
  [v13 scaledValue:3 withOverride:-1.0 forSizeClass:-1.5];
  qword_35A30 = v12;
}

void sub_18A34(id a1)
{
  qword_35A50 = +[UIColor colorWithRed:0.549019608 green:0.776470588 blue:1.0 alpha:1.0];

  _objc_release_x1();
}

void sub_18BCC(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_35AC0);
  id WeakRetained = objc_loadWeakRetained(&qword_35AC8);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_35AC8);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_35AD0;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_35AC8, obj);
  qword_35AD0 = (uint64_t)[obj version];

  sub_18F6C(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_35AC0);
  long long v10 = *(_OWORD *)&qword_35A90;
  a2[2] = xmmword_35A80;
  a2[3] = v10;
  long long v11 = xmmword_35AB0;
  a2[4] = xmmword_35AA0;
  a2[5] = v11;
  long long v12 = *(_OWORD *)algn_35A70;
  *a2 = xmmword_35A60;
  a2[1] = v12;
}

void sub_18F6C(uint64_t a1, uint64_t a2)
{
  id v6 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v6 setRoundingBehavior:3];
  xmmword_35A60 = xmmword_239D0;
  *(_OWORD *)algn_35A70 = xmmword_239E0;
  *(void *)&xmmword_35A80 = 0x4004000000000000;
  [v6 scaledValue:3 withOverride:16.0 forSizeClass:18.5];
  *((void *)&xmmword_35A80 + 1) = v2;
  [v6 scaledValue:3 withOverride:29.5 forSizeClass:34.5];
  qword_35A90 = v3;
  qword_35A98 = 0x4000000000000000;
  [v6 scaledValue:3 withOverride:35.5 forSizeClass:40.5];
  *(void *)&xmmword_35AA0 = v4;
  [v6 scaledValue:6.0];
  *((void *)&xmmword_35AA0 + 1) = v5;
  xmmword_35AB0 = xmmword_239F0;
}

void sub_1A174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v24 - 120));
  _Unwind_Resume(a1);
}

id sub_1A1A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v5 = [*(id *)(a1 + 32) newRenderPipelineStateForDevice:WeakRetained[2] withDescriptor:v3];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_1A224(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v2 setLabel:@"Sidereal Pipeline"];
  [v2 setVertexFunction:*(void *)(a1 + 32)];
  [v2 setFragmentFunction:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) colorPixelFormat];
  uint64_t v4 = [v2 colorAttachments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setPixelFormat:v3];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 40) name];
  id v8 = (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v2, v7);

  return v8;
}

id sub_1A314(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v2 setLabel:@"Sidereal Gradient Pipeline"];
  [v2 setVertexFunction:*(void *)(a1 + 32)];
  [v2 setFragmentFunction:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) colorPixelFormat];
  uint64_t v4 = [v2 colorAttachments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setPixelFormat:v3];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 40) name];
  id v8 = (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v2, v7);

  return v8;
}

id sub_1A404(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v2 setLabel:@"Sidereal Glow Pipeline"];
  [v2 setVertexFunction:*(void *)(a1 + 32)];
  [v2 setFragmentFunction:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) colorPixelFormat];
  uint64_t v4 = [v2 colorAttachments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setPixelFormat:v3];

  LODWORD(v5) = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = [v2 colorAttachments];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = v7;
  if (v5)
  {
    [v7 setBlendingEnabled:0];
  }
  else
  {
    [v7 setBlendingEnabled:1];

    uint64_t v9 = [v2 colorAttachments];
    long long v10 = [v9 objectAtIndexedSubscript:0];
    [v10 setRgbBlendOperation:0];

    long long v11 = [v2 colorAttachments];
    long long v12 = [v11 objectAtIndexedSubscript:0];
    [v12 setSourceRGBBlendFactor:4];

    uint64_t v6 = [v2 colorAttachments];
    id v8 = [v6 objectAtIndexedSubscript:0];
    [v8 setDestinationRGBBlendFactor:5];
  }

  uint64_t v13 = *(void *)(a1 + 56);
  double v14 = [*(id *)(a1 + 40) name];
  double v15 = (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v2, v14);

  return v15;
}

id sub_1A5C8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v2 setLabel:@"Sidereal Glow Pipeline"];
  [v2 setVertexFunction:*(void *)(a1 + 32)];
  [v2 setFragmentFunction:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) colorPixelFormat];
  uint64_t v4 = [v2 colorAttachments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setPixelFormat:v3];

  LODWORD(v5) = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = [v2 colorAttachments];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = v7;
  if (v5)
  {
    [v7 setBlendingEnabled:0];
  }
  else
  {
    [v7 setBlendingEnabled:1];

    uint64_t v9 = [v2 colorAttachments];
    long long v10 = [v9 objectAtIndexedSubscript:0];
    [v10 setRgbBlendOperation:0];

    long long v11 = [v2 colorAttachments];
    long long v12 = [v11 objectAtIndexedSubscript:0];
    [v12 setSourceRGBBlendFactor:4];

    uint64_t v6 = [v2 colorAttachments];
    id v8 = [v6 objectAtIndexedSubscript:0];
    [v8 setDestinationRGBBlendFactor:5];
  }

  uint64_t v13 = *(void *)(a1 + 56);
  double v14 = [*(id *)(a1 + 40) name];
  double v15 = (*(void (**)(uint64_t, id, void *))(v13 + 16))(v13, v2, v14);

  return v15;
}

id sub_1A78C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v2 setLabel:@"Sidereal Blur Pipeline"];
  [v2 setVertexFunction:*(void *)(a1 + 32)];
  [v2 setFragmentFunction:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) colorPixelFormat];
  uint64_t v4 = [v2 colorAttachments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setPixelFormat:v3];

  uint64_t v6 = [v2 colorAttachments];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  [v7 setBlendingEnabled:0];

  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [*(id *)(a1 + 40) name];
  long long v10 = (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v2, v9);

  return v10;
}

id sub_1A8AC(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v2 setLabel:@"Sidereal Composite Pipeline"];
  [v2 setVertexFunction:*(void *)(a1 + 32)];
  [v2 setFragmentFunction:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) colorPixelFormat];
  uint64_t v4 = [v2 colorAttachments];
  id v5 = [v4 objectAtIndexedSubscript:0];
  [v5 setPixelFormat:v3];

  uint64_t v6 = [v2 colorAttachments];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  [v7 setBlendingEnabled:0];

  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [*(id *)(a1 + 40) name];
  long long v10 = (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v2, v9);

  return v10;
}

id sub_1AB5C(uint64_t a1, void *a2)
{
  long long v8 = xmmword_23AF0;
  uint64_t v9 = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  memset(v7, 0, sizeof(v7));
  [a2 copyFromBuffer:v3 sourceOffset:0 sourceBytesPerRow:1024 sourceBytesPerImage:0x10000 sourceSize:&v8 toTexture:v4 destinationSlice:0 destinationLevel:0 destinationOrigin:v7];
  id v5 = *(void **)(a1 + 40);

  return v5;
}

void sub_1AF00(uint64_t a1, uint64_t a2)
{
  id v31 = [*(id *)(*(void *)(a1 + 32) + 208) objectAtIndexedSubscript:a2];
  uint64_t v4 = [v31 startingEvent];
  [v4 angle];
  float v6 = v5;

  uint64_t v7 = [v31 endingEvent];
  [v7 angle];
  float v9 = v8;

  unsigned int v10 = [*(id *)(a1 + 32) numSlicesForAngle:(float)(v6 - v9)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 432);
  if (v11 == 1)
  {
    uint64_t v12 = +[UIColor blackColor];
    goto LABEL_5;
  }
  if (v11 == 2)
  {
    uint64_t v12 = +[UIColor whiteColor];
LABEL_5:
    uint64_t v13 = (void *)v12;
    goto LABEL_7;
  }
  uint64_t v13 = 0;
LABEL_7:
  switch((unint64_t)[v31 type])
  {
    case 0uLL:
      if (*(void *)(*(void *)(a1 + 32) + 432) == 1) {
        +[UIColor whiteColor];
      }
      else {
      uint64_t v29 = +[UIColor blackColor];
      }

      id v19 = 0;
      uint64_t v13 = (void *)v29;
      break;
    case 1uLL:
    case 2uLL:
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = 224;
      goto LABEL_15;
    case 3uLL:
    case 4uLL:
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = 232;
      goto LABEL_15;
    case 5uLL:
    case 6uLL:
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = 240;
      goto LABEL_15;
    case 7uLL:
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = 248;
LABEL_15:
      id v19 = *(id *)(v17 + v18);
      break;
    default:
      id v19 = 0;
      break;
  }
  double v20 = *(double *)(*(void *)(a1 + 32) + 216);
  if (v13)
  {
    CLKUIConvertToRGBfFromUIColor_fast();
  }
  else
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 48);
    LODWORD(v15) = *(_DWORD *)(a1 + 52);
    LODWORD(v16) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v19, "rgbfColorForAltitude:", v14, v15, v16);
  }
  objc_msgSend(v31, "gradientStartPoint", v21, v22);
  uint64_t v24 = v23;
  [v31 gradientEndPoint];
  float v26 = 0.01;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 409)) {
    float v26 = 0.0;
  }
  float v27 = v20;
  uint64_t v28 = *(void *)(a1 + 40) + 96 * a2;
  *(_OWORD *)uint64_t v28 = v30;
  *(_OWORD *)(v28 + 16) = v30;
  *(_OWORD *)(v28 + 32) = v30;
  *(float *)(v28 + 48) = v26;
  *(float *)(v28 + 52) = v26;
  *(float *)(v28 + 56) = v6;
  *(float *)(v28 + 60) = v9;
  *(void *)(v28 + 64) = v24;
  *(void *)(v28 + 72) = v25;
  *(float *)(v28 + 80) = v27;
  *(_DWORD *)(v28 + 84) = v10;
  *(void *)(v28 + 88) = 0;
}

void sub_1B1A0(void *a1, unint64_t a2)
{
  uint64_t v4 = [*(id *)(a1[4] + 208) objectAtIndexedSubscript:a2];
  unint64_t v5 = a1[5];
  unint64_t v6 = (a2 + v5 - 1) % v5;
  unint64_t v7 = (a2 + 1) % v5;
  id v22 = v4;
  if (![v4 type])
  {
    uint64_t v10 = a1[6];
    long long v8 = *(_OWORD *)(v10 + 96 * v6 + 32);
    long long v9 = *(_OWORD *)(v10 + 96 * v7 + 32);
    goto LABEL_5;
  }
  if ([v22 type] == (char *)&dword_4 + 3)
  {
    long long v8 = *(_OWORD *)(a1[6] + 96 * a2 + 32);
    long long v9 = v8;
LABEL_5:
    uint64_t v11 = v22;
    goto LABEL_16;
  }
  uint64_t v12 = [v22 startingEvent];
  uint64_t v13 = (char *)[v12 type];

  if ((unint64_t)(v13 - 1) < 4) {
    goto LABEL_9;
  }
  if ((unint64_t)(v13 - 6) <= 3)
  {
    unint64_t v6 = a2;
LABEL_9:
    long long v14 = *(_OWORD *)(a1[6] + 96 * v6 + 32);
    goto LABEL_10;
  }
  long long v14 = 0uLL;
LABEL_10:
  double v15 = objc_msgSend(v22, "endingEvent", v14);
  double v16 = (char *)[v15 type];

  if ((unint64_t)(v16 - 6) < 4)
  {
    uint64_t v17 = a1[6] + 96 * v7;
  }
  else
  {
    if ((unint64_t)(v16 - 1) > 3)
    {
      long long v9 = 0uLL;
      goto LABEL_15;
    }
    uint64_t v17 = a1[6] + 96 * a2;
  }
  long long v9 = *(_OWORD *)(v17 + 32);
LABEL_15:
  uint64_t v11 = v22;
  long long v8 = v21;
LABEL_16:
  uint64_t v18 = *(void *)(a1[4] + 432);
  if ((unint64_t)(v18 - 1) < 2)
  {
    uint64_t v19 = a1[6];
    *(_DWORD *)(v19 + 96 * a2 + 48) = 1008981770;
    int v20 = 1008981770;
    goto LABEL_24;
  }
  if (v18 == 3 || !v18)
  {
    if (!a2) {
      *(_DWORD *)(a1[6] + 48) = 0;
    }
    if (a1[5] - 1 == a2)
    {
      uint64_t v19 = a1[6];
      int v20 = 0;
LABEL_24:
      *(_DWORD *)(v19 + 96 * a2 + 52) = v20;
    }
  }
  *(_OWORD *)(a1[6] + 96 * a2) = v8;
  *(_OWORD *)(a1[6] + 96 * a2 + 16) = v9;
}

id sub_1BF54(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) setVertexBufferOffset:96 * a2 atIndex:0];
  uint64_t v4 = (2 * *(_DWORD *)(*(void *)(a1 + 48) + 96 * a2 + 84) + 2);
  unint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 72);

  return [v5 drawIndexedPrimitives:4 indexCount:v4 indexType:0 indexBuffer:v6 indexBufferOffset:0];
}

void sub_1BFD4(uint64_t a1, void *a2, int a3, int a4, double a5, __n128 a6)
{
  id v10 = a2;
  __n128 v27 = a6;
  uint64_t v11 = [v10 texture];
  uint64_t v12 = v11;
  if (v11)
  {
    float v13 = a5;
    float v25 = v13;
    float v21 = (float)(unint64_t)[v11 width];
    id v14 = [v12 height];
    v15.f32[0] = v21;
    v15.f32[1] = (float)(unint64_t)v14;
    v24[0] = vmul_f32(v15, (float32x2_t)0xBF00000000000000);
    v24[1] = vmul_f32(v15, (float32x2_t)0x3F00000000000000);
    v24[2] = vmul_f32(v15, (float32x2_t)0xBF0000003F800000);
    v24[3] = vmul_f32(v15, (float32x2_t)0x3F0000003F800000);
    v24[4] = v15;
    double v16 = *(void **)(a1 + 40);
    float v17 = 2.0 / *(double *)(*(void *)(a1 + 32) + 192);
    float v26 = v17;
    [v16 setVertexBytes:v24 length:48 atIndex:1];
    [*(id *)(a1 + 40) setFragmentTexture:v12 atIndex:6];
    [*(id *)(a1 + 40) setFragmentBytes:&v27 length:16 atIndex:6];
    uint64_t v18 = &OBJC_IVAR___NTKSiderealBackgroundQuad__nightMask;
    if (a3) {
      uint64_t v18 = &OBJC_IVAR___NTKSiderealBackgroundQuad__dayMask;
    }
    [*(id *)(a1 + 40) setFragmentTexture:*(void *)(*(void *)(a1 + 32) + *v18) atIndex:3];
    int v22 = 0;
    int v23 = 1065353216;
    if (a4)
    {
      int v22 = 1065353216;
      int v23 = 0;
    }
    [*(id *)(a1 + 40) setFragmentBytes:&v23 length:4 atIndex:4];
    [*(id *)(a1 + 40) setFragmentBytes:&v22 length:4 atIndex:5];
    [*(id *)(a1 + 40) drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
  else
  {
    uint64_t v19 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1C9E8(v10, v19);
    }
  }
}

void sub_1C800()
{
  sub_DEB4(__stack_chk_guard);
  sub_DEC0();
  sub_DE98(&dword_0, v0, v1, "NTKSiderealCachedMTLTexture texture load error — generateImageBlock for the cacheKey: %@ is nil.", v2, v3, v4, v5, v6);
}

void sub_1C868()
{
  sub_DEC0();
  sub_DE98(&dword_0, v0, v1, "NTKSiderealCachedMTLTexture texture load error — imageData for cacheKey: %@ is nil. ", v2, v3, v4, v5, v6);
}

void sub_1C8D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "NTKSiderealCachedMTLTexture texture load error — Image dimensions must not be 0.", v1, 2u);
}

void sub_1C918()
{
  sub_DEB4(__stack_chk_guard);
  sub_DEC0();
  sub_DE98(&dword_0, v0, v1, "NTKSiderealCachedMTLTexture texture load error — image generated by the generateImageBlock for the cacheKey: %@ is nil.", v2, v3, v4, v5, v6);
}

void sub_1C980()
{
  sub_DEB4(__stack_chk_guard);
  sub_DECC();
  sub_DEE4(&dword_0, v0, v1, "NTKSiderealCachedMTLTexture texture load error — pixelsRef for cacheKey: %@ and image: %@ is NULL.");
}

void sub_1C9E8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 cacheKey];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "NTKSiderealBackgroundQuad draw sprite error - Could not draw cached sprite: %@; Attempting to access nil metal texture.",
    (uint8_t *)&v4,
    0xCu);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFRelease(CFTypeRef cf)
{
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

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateSRGB(red, green, blue, alpha);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return _CGDataProviderCopyData(provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return _CGImageGetBytesPerRow(image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return _CGImageGetDataProvider(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return _CGPathCreateMutableCopy(path);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
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

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

uint64_t CLKAlterRect()
{
  return _CLKAlterRect();
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

uint64_t CLKFloorForDevice()
{
  return _CLKFloorForDevice();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKLayoutIsRTL()
{
  return _CLKLayoutIsRTL();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t CLKRectCenteredYInRectForDevice()
{
  return _CLKRectCenteredYInRectForDevice();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t CLKSizeCenteredInRectForDevice()
{
  return _CLKSizeCenteredInRectForDevice();
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return _CLKUIConvertToRGBfFromSRGBf_fast();
}

uint64_t CLKUIConvertToRGBfFromUIColor_fast()
{
  return _CLKUIConvertToRGBfFromUIColor_fast();
}

uint64_t CLKUIConvertToXRSRGBfFromRGBf()
{
  return _CLKUIConvertToXRSRGBfFromRGBf();
}

uint64_t CLKUIMonochromeFiltersForStyleWithTintedBackground()
{
  return _CLKUIMonochromeFiltersForStyleWithTintedBackground();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKAllSignatureCornerTypes()
{
  return _NTKAllSignatureCornerTypes();
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKAllUtilitySmallFlatComplicationTypes()
{
  return _NTKAllUtilitySmallFlatComplicationTypes();
}

uint64_t NTKCircleSectorPath()
{
  return _NTKCircleSectorPath();
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

uint64_t NTKDesatMonochromeFilter()
{
  return _NTKDesatMonochromeFilter();
}

uint64_t NTKDesatMonochromeFilterOpaque()
{
  return _NTKDesatMonochromeFilterOpaque();
}

uint64_t NTKDigitalTimeLabelDefaultFrameBottom()
{
  return _NTKDigitalTimeLabelDefaultFrameBottom();
}

uint64_t NTKDigitalTimeLabelStyleWideRightSideMargin()
{
  return _NTKDigitalTimeLabelStyleWideRightSideMargin();
}

uint64_t NTKEndOfDayForDate()
{
  return _NTKEndOfDayForDate();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKFlatMonochromeFilter()
{
  return _NTKFlatMonochromeFilter();
}

uint64_t NTKFlatMonochromeFilterOpaque()
{
  return _NTKFlatMonochromeFilterOpaque();
}

uint64_t NTKHighPriorityApply()
{
  return _NTKHighPriorityApply();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKIsScreenOn()
{
  return _NTKIsScreenOn();
}

uint64_t NTKKeylineViewWithCircle()
{
  return _NTKKeylineViewWithCircle();
}

uint64_t NTKNoHighlightDialTapImage()
{
  return _NTKNoHighlightDialTapImage();
}

uint64_t NTKPointOnCircle()
{
  return _NTKPointOnCircle();
}

uint64_t NTKRoundDateDownToNearestMinute()
{
  return _NTKRoundDateDownToNearestMinute();
}

uint64_t NTKScaleForBreathingFraction()
{
  return _NTKScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NTKSiderealDegreesToSolarDayProgress()
{
  return _NTKSiderealDegreesToSolarDayProgress();
}

uint64_t NTKSingleLineHeight()
{
  return _NTKSingleLineHeight();
}

uint64_t NTKStarbearEnabled()
{
  return _NTKStarbearEnabled();
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

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
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

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

float fmodf(float a1, float a2)
{
  return _fmodf(a1, a2);
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_CLKFontWithAlternativePunctuation(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithAlternativePunctuation];
}

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend_DEPRECATEDInvalidate(void *a1, const char *a2, ...)
{
  return [a1 DEPRECATEDInvalidate];
}

id objc_msgSend__accessPrewarmedData(void *a1, const char *a2, ...)
{
  return [a1 _accessPrewarmedData];
}

id objc_msgSend__activate(void *a1, const char *a2, ...)
{
  return [a1 _activate];
}

id objc_msgSend__alphaOnlyTexture(void *a1, const char *a2, ...)
{
  return [a1 _alphaOnlyTexture];
}

id objc_msgSend__applyScaleToTimeView(void *a1, const char *a2, ...)
{
  return [a1 _applyScaleToTimeView];
}

id objc_msgSend__canEnterInteractiveMode(void *a1, const char *a2, ...)
{
  return [a1 _canEnterInteractiveMode];
}

id objc_msgSend__createSolarBezierPath(void *a1, const char *a2, ...)
{
  return [a1 _createSolarBezierPath];
}

id objc_msgSend__createWaypointView(void *a1, const char *a2, ...)
{
  return [a1 _createWaypointView];
}

id objc_msgSend__currentBuffer(void *a1, const char *a2, ...)
{
  return [a1 _currentBuffer];
}

id objc_msgSend__curvedLabel(void *a1, const char *a2, ...)
{
  return [a1 _curvedLabel];
}

id objc_msgSend__dayPathGlowImage(void *a1, const char *a2, ...)
{
  return [a1 _dayPathGlowImage];
}

id objc_msgSend__dialViewImageRef(void *a1, const char *a2, ...)
{
  return [a1 _dialViewImageRef];
}

id objc_msgSend__disableCrown(void *a1, const char *a2, ...)
{
  return [a1 _disableCrown];
}

id objc_msgSend__diskGlow(void *a1, const char *a2, ...)
{
  return [a1 _diskGlow];
}

id objc_msgSend__enableCrown(void *a1, const char *a2, ...)
{
  return [a1 _enableCrown];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__faceDisplayTime(void *a1, const char *a2, ...)
{
  return [a1 _faceDisplayTime];
}

id objc_msgSend__gnomonImage(void *a1, const char *a2, ...)
{
  return [a1 _gnomonImage];
}

id objc_msgSend__idealizedSolarDayProgress(void *a1, const char *a2, ...)
{
  return [a1 _idealizedSolarDayProgress];
}

id objc_msgSend__innerComplicationColors(void *a1, const char *a2, ...)
{
  return [a1 _innerComplicationColors];
}

id objc_msgSend__isAnimating(void *a1, const char *a2, ...)
{
  return [a1 _isAnimating];
}

id objc_msgSend__isDayAnimationRunning(void *a1, const char *a2, ...)
{
  return [a1 _isDayAnimationRunning];
}

id objc_msgSend__layoutBottomLabel(void *a1, const char *a2, ...)
{
  return [a1 _layoutBottomLabel];
}

id objc_msgSend__layoutLegacyDateComplication(void *a1, const char *a2, ...)
{
  return [a1 _layoutLegacyDateComplication];
}

id objc_msgSend__layoutTopLabel(void *a1, const char *a2, ...)
{
  return [a1 _layoutTopLabel];
}

id objc_msgSend__loadAuxiliaryDialLabelsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _loadAuxiliaryDialLabelsIfNeeded];
}

id objc_msgSend__loadDial(void *a1, const char *a2, ...)
{
  return [a1 _loadDial];
}

id objc_msgSend__loadOffsetLabelIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _loadOffsetLabelIfNeeded];
}

id objc_msgSend__loadTimeView(void *a1, const char *a2, ...)
{
  return [a1 _loadTimeView];
}

id objc_msgSend__loadUI(void *a1, const char *a2, ...)
{
  return [a1 _loadUI];
}

id objc_msgSend__newGnomonLayer(void *a1, const char *a2, ...)
{
  return [a1 _newGnomonLayer];
}

id objc_msgSend__newGnomonView(void *a1, const char *a2, ...)
{
  return [a1 _newGnomonView];
}

id objc_msgSend__newWaypointView(void *a1, const char *a2, ...)
{
  return [a1 _newWaypointView];
}

id objc_msgSend__notifyObserversFaceTimeStyleChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyObserversFaceTimeStyleChanged];
}

id objc_msgSend__outerComplicationColors(void *a1, const char *a2, ...)
{
  return [a1 _outerComplicationColors];
}

id objc_msgSend__refreshGlowPathState(void *a1, const char *a2, ...)
{
  return [a1 _refreshGlowPathState];
}

id objc_msgSend__resetInteractionProgress(void *a1, const char *a2, ...)
{
  return [a1 _resetInteractionProgress];
}

id objc_msgSend__rgbaTexture(void *a1, const char *a2, ...)
{
  return [a1 _rgbaTexture];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__solarDayProgressForCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 _solarDayProgressForCurrentTime];
}

id objc_msgSend__solarDiskIdealizedDatePercentage(void *a1, const char *a2, ...)
{
  return [a1 _solarDiskIdealizedDatePercentage];
}

id objc_msgSend__solarDiskRestPercentage(void *a1, const char *a2, ...)
{
  return [a1 _solarDiskRestPercentage];
}

id objc_msgSend__solarSun(void *a1, const char *a2, ...)
{
  return [a1 _solarSun];
}

id objc_msgSend__startClockUpdates(void *a1, const char *a2, ...)
{
  return [a1 _startClockUpdates];
}

id objc_msgSend__stopClockUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopClockUpdates];
}

id objc_msgSend__tearDownAuxiliaryDialLabels(void *a1, const char *a2, ...)
{
  return [a1 _tearDownAuxiliaryDialLabels];
}

id objc_msgSend__tearDownOffsetLabel(void *a1, const char *a2, ...)
{
  return [a1 _tearDownOffsetLabel];
}

id objc_msgSend__timeViewKeylineFrameForEditing(void *a1, const char *a2, ...)
{
  return [a1 _timeViewKeylineFrameForEditing];
}

id objc_msgSend__timeViewScaleTransform(void *a1, const char *a2, ...)
{
  return [a1 _timeViewScaleTransform];
}

id objc_msgSend__unloadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadSnapshotContentViews];
}

id objc_msgSend__unloadTimeView(void *a1, const char *a2, ...)
{
  return [a1 _unloadTimeView];
}

id objc_msgSend__unloadUI(void *a1, const char *a2, ...)
{
  return [a1 _unloadUI];
}

id objc_msgSend__unloadViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadViews];
}

id objc_msgSend__updateColorCurves(void *a1, const char *a2, ...)
{
  return [a1 _updateColorCurves];
}

id objc_msgSend__updateFramerate(void *a1, const char *a2, ...)
{
  return [a1 _updateFramerate];
}

id objc_msgSend__updateLocale(void *a1, const char *a2, ...)
{
  return [a1 _updateLocale];
}

id objc_msgSend__updateSeparatorLines(void *a1, const char *a2, ...)
{
  return [a1 _updateSeparatorLines];
}

id objc_msgSend__updateStatusBarVisibility(void *a1, const char *a2, ...)
{
  return [a1 _updateStatusBarVisibility];
}

id objc_msgSend__updateSunsetFilter(void *a1, const char *a2, ...)
{
  return [a1 _updateSunsetFilter];
}

id objc_msgSend__updateWaypointLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateWaypointLabel];
}

id objc_msgSend__updateWaypointLabelForCrownMovement(void *a1, const char *a2, ...)
{
  return [a1 _updateWaypointLabelForCrownMovement];
}

id objc_msgSend__updateWaypoints(void *a1, const char *a2, ...)
{
  return [a1 _updateWaypoints];
}

id objc_msgSend__waypointViewImageRef(void *a1, const char *a2, ...)
{
  return [a1 _waypointViewImageRef];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_analogHandsView(void *a1, const char *a2, ...)
{
  return [a1 analogHandsView];
}

id objc_msgSend_analogTickContainerView(void *a1, const char *a2, ...)
{
  return [a1 analogTickContainerView];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return [a1 angle];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_astronomicalTwilightColorCurve(void *a1, const char *a2, ...)
{
  return [a1 astronomicalTwilightColorCurve];
}

id objc_msgSend_astronomicalTwilightCurveP3(void *a1, const char *a2, ...)
{
  return [a1 astronomicalTwilightCurveP3];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blitCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 blitCommandEncoder];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheKey(void *a1, const char *a2, ...)
{
  return [a1 cacheKey];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_civilTwilightColorCurve(void *a1, const char *a2, ...)
{
  return [a1 civilTwilightColorCurve];
}

id objc_msgSend_civilTwilightCurveP3(void *a1, const char *a2, ...)
{
  return [a1 civilTwilightCurveP3];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_complicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 complicationTypesBySlot];
}

id objc_msgSend_constantSun(void *a1, const char *a2, ...)
{
  return [a1 constantSun];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 currentDisplayDate];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_dayContainerView(void *a1, const char *a2, ...)
{
  return [a1 dayContainerView];
}

id objc_msgSend_dayDiskBloomColorCurve(void *a1, const char *a2, ...)
{
  return [a1 dayDiskBloomColorCurve];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_degree(void *a1, const char *a2, ...)
{
  return [a1 degree];
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

id objc_msgSend_dialBackgroundColorCurve(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundColorCurve];
}

id objc_msgSend_dialBackgroundCurveP3(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundCurveP3];
}

id objc_msgSend_dialBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundView];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didFinishTransition(void *a1, const char *a2, ...)
{
  return [a1 didFinishTransition];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_displayIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 displayIfNeeded];
}

id objc_msgSend_effectiveSolarDayLength(void *a1, const char *a2, ...)
{
  return [a1 effectiveSolarDayLength];
}

id objc_msgSend_enableCrownEventReception(void *a1, const char *a2, ...)
{
  return [a1 enableCrownEventReception];
}

id objc_msgSend_endDateForReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 endDateForReferenceDate];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_endingEvent(void *a1, const char *a2, ...)
{
  return [a1 endingEvent];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_faceDisplayTime(void *a1, const char *a2, ...)
{
  return [a1 faceDisplayTime];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
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

id objc_msgSend_functionDescriptor(void *a1, const char *a2, ...)
{
  return [a1 functionDescriptor];
}

id objc_msgSend_gradientData(void *a1, const char *a2, ...)
{
  return [a1 gradientData];
}

id objc_msgSend_gradientEndPoint(void *a1, const char *a2, ...)
{
  return [a1 gradientEndPoint];
}

id objc_msgSend_gradientStartPoint(void *a1, const char *a2, ...)
{
  return [a1 gradientStartPoint];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_highlightImageView(void *a1, const char *a2, ...)
{
  return [a1 highlightImageView];
}

id objc_msgSend_horizonLine(void *a1, const char *a2, ...)
{
  return [a1 horizonLine];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_innerComplicationColorCurve(void *a1, const char *a2, ...)
{
  return [a1 innerComplicationColorCurve];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateDigitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 invalidateDigitalTimeLabelStyle];
}

id objc_msgSend_isConstantSunUpOrDown(void *a1, const char *a2, ...)
{
  return [a1 isConstantSunUpOrDown];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_isRunningGraceOrLater(void *a1, const char *a2, ...)
{
  return [a1 isRunningGraceOrLater];
}

id objc_msgSend_isTextTruncated(void *a1, const char *a2, ...)
{
  return [a1 isTextTruncated];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutRule(void *a1, const char *a2, ...)
{
  return [a1 layoutRule];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return [a1 legibilityWeight];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_loadGradientTexture(void *a1, const char *a2, ...)
{
  return [a1 loadGradientTexture];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nauticalTwilightColorCurve(void *a1, const char *a2, ...)
{
  return [a1 nauticalTwilightColorCurve];
}

id objc_msgSend_nauticalTwilightCurveP3(void *a1, const char *a2, ...)
{
  return [a1 nauticalTwilightCurveP3];
}

id objc_msgSend_newTimeViewPathForDarkeningView(void *a1, const char *a2, ...)
{
  return [a1 newTimeViewPathForDarkeningView];
}

id objc_msgSend_nightContainerView(void *a1, const char *a2, ...)
{
  return [a1 nightContainerView];
}

id objc_msgSend_nrDeviceVersion(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceVersion];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_outerComplicationColorCurve(void *a1, const char *a2, ...)
{
  return [a1 outerComplicationColorCurve];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_percentageThroughPeriodForIdealizedTimeInCurrentSolarDay(void *a1, const char *a2, ...)
{
  return [a1 percentageThroughPeriodForIdealizedTimeInCurrentSolarDay];
}

id objc_msgSend_percentageThroughPeriodForWaypointDate(void *a1, const char *a2, ...)
{
  return [a1 percentageThroughPeriodForWaypointDate];
}

id objc_msgSend_pointModel(void *a1, const char *a2, ...)
{
  return [a1 pointModel];
}

id objc_msgSend_poseForDayDiskBloomImage(void *a1, const char *a2, ...)
{
  return [a1 poseForDayDiskBloomImage];
}

id objc_msgSend_poseForDayDiskImage(void *a1, const char *a2, ...)
{
  return [a1 poseForDayDiskImage];
}

id objc_msgSend_poseForDayGnomonImage(void *a1, const char *a2, ...)
{
  return [a1 poseForDayGnomonImage];
}

id objc_msgSend_poseForNightDiskImage(void *a1, const char *a2, ...)
{
  return [a1 poseForNightDiskImage];
}

id objc_msgSend_poseForNightGnomonImage(void *a1, const char *a2, ...)
{
  return [a1 poseForNightGnomonImage];
}

id objc_msgSend_poseForNightRingImage(void *a1, const char *a2, ...)
{
  return [a1 poseForNightRingImage];
}

id objc_msgSend_purgeAPLCache(void *a1, const char *a2, ...)
{
  return [a1 purgeAPLCache];
}

id objc_msgSend_quad(void *a1, const char *a2, ...)
{
  return [a1 quad];
}

id objc_msgSend_quadView(void *a1, const char *a2, ...)
{
  return [a1 quadView];
}

id objc_msgSend_referenceDate(void *a1, const char *a2, ...)
{
  return [a1 referenceDate];
}

id objc_msgSend_referenceLocation(void *a1, const char *a2, ...)
{
  return [a1 referenceLocation];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_rise(void *a1, const char *a2, ...)
{
  return [a1 rise];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_sectors(void *a1, const char *a2, ...)
{
  return [a1 sectors];
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

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_setupDarkeningViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 setupDarkeningViewIfNeeded];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_sharedCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedCommandQueue];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_showContentForUnadornedSnapshot(void *a1, const char *a2, ...)
{
  return [a1 showContentForUnadornedSnapshot];
}

id objc_msgSend_siderealComplicationTypesBySlot(void *a1, const char *a2, ...)
{
  return [a1 siderealComplicationTypesBySlot];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_solarNoon(void *a1, const char *a2, ...)
{
  return [a1 solarNoon];
}

id objc_msgSend_startDateForReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 startDateForReferenceDate];
}

id objc_msgSend_startingEvent(void *a1, const char *a2, ...)
{
  return [a1 startingEvent];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_sunDownView(void *a1, const char *a2, ...)
{
  return [a1 sunDownView];
}

id objc_msgSend_sunUpView(void *a1, const char *a2, ...)
{
  return [a1 sunUpView];
}

id objc_msgSend_sunriseSunsetInfo(void *a1, const char *a2, ...)
{
  return [a1 sunriseSunsetInfo];
}

id objc_msgSend_sunriseTime(void *a1, const char *a2, ...)
{
  return [a1 sunriseTime];
}

id objc_msgSend_sunsetFollowsSunrise(void *a1, const char *a2, ...)
{
  return [a1 sunsetFollowsSunrise];
}

id objc_msgSend_sunsetTime(void *a1, const char *a2, ...)
{
  return [a1 sunsetTime];
}

id objc_msgSend_tearDownDarkeningView(void *a1, const char *a2, ...)
{
  return [a1 tearDownDarkeningView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_texture(void *a1, const char *a2, ...)
{
  return [a1 texture];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateDependentValues(void *a1, const char *a2, ...)
{
  return [a1 updateDependentValues];
}

id objc_msgSend_updateDependentValuesWithPlaceholderData(void *a1, const char *a2, ...)
{
  return [a1 updateDependentValuesWithPlaceholderData];
}

id objc_msgSend_updateForTimeZoneChange(void *a1, const char *a2, ...)
{
  return [a1 updateForTimeZoneChange];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_viewMode(void *a1, const char *a2, ...)
{
  return [a1 viewMode];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_waypointDate(void *a1, const char *a2, ...)
{
  return [a1 waypointDate];
}

id objc_msgSend_waypoints(void *a1, const char *a2, ...)
{
  return [a1 waypoints];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_willStartTransition(void *a1, const char *a2, ...)
{
  return [a1 willStartTransition];
}

id objc_msgSend_zooming(void *a1, const char *a2, ...)
{
  return [a1 zooming];
}