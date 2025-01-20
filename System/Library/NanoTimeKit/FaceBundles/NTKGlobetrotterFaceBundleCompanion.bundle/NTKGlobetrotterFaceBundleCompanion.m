id sub_22B0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t vars8;

  v2 = NTKIdealizedDate();
  v3 = [v2 dateByAddingTimeInterval:(double)(3600 * *(void *)(a1 + 32))];

  return v3;
}

void sub_27A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_27BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && (v3 = (void *)*((void *)WeakRetained + 4)) != 0)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NTKDate faceDate];
  }
  v5 = v4;

  return v5;
}

void sub_29F0(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16158);
  id WeakRetained = objc_loadWeakRetained(&qword_16160);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16160);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16168;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16160, obj);
  qword_16168 = (uint64_t)[obj version];

  sub_3294(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16158);
  long long v10 = unk_16138;
  *a2 = xmmword_16128;
  a2[1] = v10;
  a2[2] = xmmword_16148;
}

void sub_3294(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:7.0];
  *(void *)&xmmword_16128 = v3;
  v23[0] = &off_11180;
  long long v20 = xmmword_CE10;
  id v4 = +[NSValue valueWithBytes:&v20 objCType:"{CGSize=dd}"];
  v24[0] = v4;
  v23[1] = &off_11198;
  long long v19 = xmmword_CE20;
  id v5 = +[NSValue valueWithBytes:&v19 objCType:"{CGSize=dd}"];
  v24[1] = v5;
  v23[2] = &off_111B0;
  long long v18 = xmmword_CE20;
  id v6 = +[NSValue valueWithBytes:&v18 objCType:"{CGSize=dd}"];
  v24[2] = v6;
  v23[3] = &off_111C8;
  long long v17 = xmmword_CE20;
  uint64_t v7 = +[NSValue valueWithBytes:&v17 objCType:"{CGSize=dd}"];
  v24[3] = v7;
  v23[4] = &off_111E0;
  long long v16 = xmmword_CE20;
  id v8 = +[NSValue valueWithBytes:&v16 objCType:"{CGSize=dd}"];
  v24[4] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];
  objc_msgSend(v2, "scaledSize:withOverrides:", v9, 2.5, 9.0);
  *((void *)&xmmword_16128 + 1) = v10;
  unk_16138 = v11;

  objc_msgSend(v2, "scaledSize:", 1.5, 6.0);
  v21[0] = &off_111F8;
  v21[1] = &off_11198;
  qword_16140 = v12;
  *(void *)&xmmword_16148 = v13;
  v22[0] = &off_10CA0;
  v22[1] = &off_10CB0;
  v21[2] = &off_111B0;
  v21[3] = &off_111C8;
  v22[2] = &off_10CB0;
  v22[3] = &off_10CC0;
  v21[4] = &off_111E0;
  v22[4] = &off_10CB0;
  v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  [v2 scaledValue:v14 withOverrides:32.0];
  *((void *)&xmmword_16148 + 1) = v15;
}

uint64_t sub_35CC(uint64_t a1)
{
  qword_16178 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_3D1C(id a1)
{
  qword_16188 = (uint64_t)[objc_alloc((Class)WorldClockCity) initWithALCityIdentifier:152];

  _objc_release_x1();
}

double sub_4514(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_161A8);
  id WeakRetained = objc_loadWeakRetained(&qword_161B0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_161B0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_161B0, v1);
    qword_161B8 = (uint64_t)[v1 version];

    sub_46F8(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_161B8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_161A8);
  double v9 = *(double *)&qword_16190;

  return v9;
}

void sub_46F8(uint64_t a1, uint64_t a2)
{
  v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v13[0] = &off_11450;
  v13[1] = &off_11468;
  v14[0] = &off_10CD0;
  v14[1] = &off_10CE0;
  v13[2] = &off_11480;
  v13[3] = &off_11498;
  v14[2] = &off_10CE0;
  v14[3] = &off_10CF0;
  v13[4] = &off_114B0;
  v14[4] = &off_10D00;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v2 scaledValue:v3 withOverrides:25.5];
  qword_16190 = v4;

  v11[0] = &off_11450;
  v11[1] = &off_11468;
  v12[0] = &off_10D10;
  v12[1] = &off_10D20;
  v11[2] = &off_11480;
  v11[3] = &off_11498;
  v12[2] = &off_10D20;
  v12[3] = &off_10D30;
  v11[4] = &off_114B0;
  v12[4] = &off_10D40;
  id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
  [v2 scaledValue:v5 withOverrides:40.5];
  qword_16198 = v6;

  v9[0] = &off_11450;
  v9[1] = &off_11468;
  v10[0] = &off_10D50;
  v10[1] = &off_10D60;
  v9[2] = &off_11480;
  v9[3] = &off_11498;
  v10[2] = &off_10D60;
  v10[3] = &off_10D70;
  v9[4] = &off_114B0;
  v10[4] = &off_10D80;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  [v2 scaledValue:v7 withOverrides:49.0];
  qword_161A0 = v8;
}

double sub_4A18(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_161E8);
  id WeakRetained = objc_loadWeakRetained(&qword_161F0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_161F0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_161F0, v1);
    qword_161F8 = (uint64_t)[v1 version];

    sub_657C(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_161F8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_161E8);
  double v9 = *(double *)&qword_161D0;

  return v9;
}

void sub_64C4(id a1)
{
  qword_161C0 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_657C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v5 = v4;

  qword_161D0 = v5;
  v8[0] = &off_114E0;
  v8[1] = &off_114F8;
  v9[0] = &off_10D90;
  v9[1] = &off_10DA0;
  v8[2] = &off_11510;
  v8[3] = &off_11528;
  v9[2] = &off_10DA0;
  v9[3] = &off_10DB0;
  v8[4] = &off_11540;
  v9[4] = &off_10DC0;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  [v3 scaledValue:v6 withOverrides:99.0];
  qword_161D8 = v7;

  qword_161E0 = 0x3FECCCCCCCCCCCCDLL;
}

void sub_6990(id a1)
{
  qword_16200 = (uint64_t)objc_alloc_init((Class)NTKCornerComplicationConfiguration);

  _objc_release_x1();
}

void sub_72AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
  objc_destroyWeak(v48);
  objc_destroyWeak(v47);
  objc_destroyWeak(v46);
  objc_destroyWeak(location);
  objc_destroyWeak(&a46);
  _Unwind_Resume(a1);
}

void sub_7350(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16288);
  id WeakRetained = objc_loadWeakRetained(&qword_16290);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16290);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16298;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16290, obj);
  qword_16298 = (uint64_t)[obj version];

  sub_98DC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16288);
  long long v10 = *(_OWORD *)&qword_16260;
  *(_OWORD *)(a2 + 64) = xmmword_16250;
  *(_OWORD *)(a2 + 80) = v10;
  *(_OWORD *)(a2 + 96) = xmmword_16270;
  *(void *)(a2 + 112) = qword_16280;
  long long v11 = *(_OWORD *)&qword_16220;
  *(_OWORD *)a2 = xmmword_16210;
  *(_OWORD *)(a2 + 16) = v11;
  long long v12 = *(_OWORD *)&qword_16240;
  *(_OWORD *)(a2 + 32) = xmmword_16230;
  *(_OWORD *)(a2 + 48) = v12;
}

id sub_7480(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = [WeakRetained _newCityLabelWithCityIndex:2 * a2];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_74E0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = [WeakRetained _newCityLabelWithCityIndex:(2 * a2) | 1];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_7544(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2 == 12)
    {
      id v5 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:*(double *)(a1 + 104) design:UIFontWeightHeavy];
      id v6 = [WeakRetained _imageViewWithSymbolName:@"triangle.fill" font:v5];
    }
    else
    {
      id v6 = +[CALayer layer];
      objc_msgSend(v6, "setFrame:", 0.0, 0.0, *(double *)(a1 + 96), *(double *)(a1 + 96));
      [v6 setActions:*(void *)(a1 + 32)];
      [v6 bounds];
      [v6 setCornerRadius:CGRectGetMidX(v9)];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id sub_7644(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained) {
    id v3 = [WeakRetained _newHourMarkerLabel];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_7A9C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v4 = a2;
  id v5 = [v3 layer];
  objc_msgSend(v5, "renderInContext:", objc_msgSend(v4, "CGContext"));

  id v7 = [*(id *)(*(void *)(a1 + 32) + 48) layer];
  id v6 = [v4 CGContext];

  [v7 renderInContext:v6];
}

void sub_7DA0(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  if (a3 == 12) {
    [v5 cityDialArrowMarker];
  }
  else {
  id v7 = [v5 cityDialDots];
  }
  [v4 _updateColor:v7 forObject:v6];
}

id sub_7E2C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateColor:*(void *)(a1 + 40) forObject:a2];
}

uint64_t sub_8308(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v16;
    id v6 = +[NTKGlobetrotterCityManager sharedInstance];
    id v7 = [v6 timeZoneForCityAtIndex:a3 hourOffset:*(void *)(a1 + 48) - *(void *)(a1 + 56)];

    uint64_t v8 = (uint64_t)[*(id *)(a1 + 32) _hourMarkerDialIndexForHour:a3];
    if ([v7 isDaylightSavingTimeForDate:*(void *)(a1 + 40)])
    {
      [v7 daylightSavingTimeOffsetForDate:*(void *)(a1 + 40)];
      uint64_t v8 = (uint64_t)(v9 / 3600.0 + (double)v8);
      if (v8 >= 25) {
        v8 %= 0x18uLL;
      }
    }
    long long v10 = [*(id *)(a1 + 32) _dialMarkerAttributedStringForHour:v8];
    [v5 setAttributedText:v10];

    [v5 sizeToFit];
    unint64_t v11 = *(void *)(a1 + 48) + a3;
    unint64_t v12 = v11 % 0x18;
    int64_t v13 = v11 + 24;
    if (*(void *)(a1 + 48) + a3 >= 0) {
      int64_t v13 = v12;
    }
    if (v13 >= *(void *)(a1 + 64) && v13 <= *(void *)(a1 + 72))
    {
      [v5 setInterior:1];
      v14 = (double *)(a1 + 192);
    }
    else
    {
      [v5 setInterior:0];
      v14 = (double *)(a1 + 184);
    }
    [v5 setCircleRadius:*v14 * 0.5];
  }

  return _objc_release_x1();
}

double sub_84C8(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[4] + a2;
  unint64_t v3 = v2 % 0x18;
  int64_t v4 = v2 + 24;
  if (a1[4] + a2 >= 0) {
    int64_t v4 = v3;
  }
  if (v4 >= a1[5] && v4 <= a1[6]) {
    return 180.0;
  }
  else {
    return 0.0;
  }
}

void sub_89B8(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = a1[4] + a3;
  unint64_t v7 = v6 % 0xC;
  int64_t v8 = v6 + 12;
  if (a1[4] + a3 < 0) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = v7;
  }
  id v10 = v5;
  id v12 = v10;
  if (v9 >= a1[5] && v9 <= a1[6])
  {
    [v10 setInterior:1];
    unint64_t v11 = (double *)(a1 + 8);
  }
  else
  {
    [v10 setInterior:0];
    unint64_t v11 = (double *)(a1 + 7);
  }
  [v12 setCircleRadius:*v11 * 0.5];
}

void sub_8A7C(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = a1[4] + a3;
  unint64_t v7 = v6 % 0xC;
  int64_t v8 = v6 + 12;
  if (a1[4] + a3 < 0) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = v7;
  }
  id v10 = v5;
  id v12 = v10;
  if (v9 >= a1[5] && v9 <= a1[6])
  {
    [v10 setInterior:1];
    unint64_t v11 = (double *)(a1 + 10);
  }
  else
  {
    [v10 setInterior:0];
    unint64_t v11 = (double *)(a1 + 9);
  }
  [v12 setCircleRadius:*v11 * 0.5];
}

double sub_8B40(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[4] + a2;
  unint64_t v3 = v2 % 0xC;
  int64_t v4 = v2 + 12;
  if (a1[4] + a2 >= 0) {
    int64_t v4 = v3;
  }
  if (v4 >= a1[5] && v4 <= a1[6]) {
    return 180.0;
  }
  else {
    return 0.0;
  }
}

double sub_8B90(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[4] + a2;
  unint64_t v3 = v2 % 0xC;
  int64_t v4 = v2 + 12;
  if (a1[4] + a2 >= 0) {
    int64_t v4 = v3;
  }
  if (v4 >= a1[5] && v4 <= a1[6]) {
    return 180.0;
  }
  else {
    return 0.0;
  }
}

void sub_8DA4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unint64_t v3 = +[CLKUIAlmanacTransitInfo transitInfoForDate:location:](CLKUIAlmanacTransitInfo, "transitInfoForDate:location:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
    uint64_t v4 = [v3 rise];
    if (v4)
    {
      id v5 = (void *)v4;
      unint64_t v6 = [v3 set];

      if (v6)
      {
        unint64_t v7 = +[NSCalendar currentCalendar];
        int64_t v8 = [*(id *)(a1 + 40) _localTimeZone];
        int64_t v9 = [v3 rise];
        id v10 = [v7 componentsInTimeZone:v8 fromDate:v9];

        uint64_t v11 = llround((double)(uint64_t)[v10 minute] / 60.0 + (double)(uint64_t)objc_msgSend(v10, "hour"));
        if ([v8 isDaylightSavingTimeForDate:*(void *)(a1 + 32)])
        {
          [v8 daylightSavingTimeOffsetForDate:*(void *)(a1 + 32)];
          uint64_t v11 = (uint64_t)((double)v11 + v12 / -3600.0);
        }
        int64_t v13 = [v3 set];
        v14 = [v7 componentsInTimeZone:v8 fromDate:v13];

        uint64_t v15 = llround((double)(uint64_t)[v14 minute] / 60.0 + (double)(uint64_t)objc_msgSend(v14, "hour"));
        if ([v8 isDaylightSavingTimeForDate:*(void *)(a1 + 32)])
        {
          [v8 daylightSavingTimeOffsetForDate:*(void *)(a1 + 32)];
          uint64_t v15 = (uint64_t)((double)v15 + v16 / -3600.0);
        }
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_9000;
        v18[3] = &unk_10610;
        uint64_t v17 = *(void *)(a1 + 40);
        v18[4] = WeakRetained;
        v18[5] = v17;
        v18[6] = v11;
        v18[7] = v15;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
      }
    }
  }
}

id *sub_9000(id *result)
{
  id v1 = result;
  id v2 = result[4];
  id v3 = (id)*((void *)v2 + 3);
  id v4 = result[6];
  if (v3 != v4)
  {
    if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = (void *)*((void *)v2 + 9);
      id v6 = [result[5] _newHourMarkerLabel];
      objc_msgSend(v5, "replaceMarker:atIndex:", v6, objc_msgSend(v1[5], "_hourMarkerDialIndexForHour:", *((void *)v1[4] + 3)));

      id v2 = v1[4];
      id v4 = v1[6];
    }
    result = (id *)objc_msgSend(*((id *)v2 + 9), "replaceMarker:atIndex:", *((void *)v2 + 1), objc_msgSend(v1[5], "_hourMarkerDialIndexForHour:", v4));
    *((void *)v1[4] + 3) = v1[6];
    id v2 = v1[4];
  }
  id v7 = (id)*((void *)v2 + 4);
  id v8 = v1[7];
  if (v7 != v8)
  {
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v9 = (void *)*((void *)v2 + 9);
      id v10 = [v1[5] _newHourMarkerLabel];
      objc_msgSend(v9, "replaceMarker:atIndex:", v10, objc_msgSend(v1[5], "_hourMarkerDialIndexForHour:", *((void *)v1[4] + 4)));

      id v2 = v1[4];
      id v8 = v1[7];
    }
    result = (id *)objc_msgSend(*((id *)v2 + 9), "replaceMarker:atIndex:", *((void *)v2 + 2), objc_msgSend(v1[5], "_hourMarkerDialIndexForHour:", v8));
    *((void *)v1[4] + 4) = v1[7];
  }
  return result;
}

void sub_9670(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[14];
  id v4 = a2;
  id v5 = [v3 cityDialLabel];
  [v2 _updateColor:v5 forObject:v4];
}

void sub_96EC(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[14];
  id v4 = a2;
  id v5 = [v3 cityDialLabel];
  [v2 _updateColor:v5 forObject:v4];
}

void sub_98DC(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  v38[0] = &off_115A0;
  v38[1] = &off_115B8;
  v39[0] = &off_10DD0;
  v39[1] = &off_10DE0;
  v38[2] = &off_115D0;
  v38[3] = &off_115E8;
  v39[2] = &off_10DF0;
  v39[3] = &off_10DF0;
  v38[4] = &off_11600;
  v38[5] = &off_11618;
  v39[4] = &off_10E00;
  v39[5] = &off_10E10;
  id v3 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:6];
  [v2 scaledValue:v3 withOverrides:145.0];
  *(void *)&xmmword_16210 = v4;

  v36[0] = &off_115A0;
  v36[1] = &off_115B8;
  v37[0] = &off_10E20;
  v37[1] = &off_10DD0;
  v36[2] = &off_115D0;
  v36[3] = &off_115E8;
  v37[2] = &off_10E30;
  v37[3] = &off_10E30;
  v36[4] = &off_11600;
  v36[5] = &off_11618;
  v37[4] = &off_10E40;
  v37[5] = &off_10E50;
  id v5 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:6];
  [v2 scaledValue:v5 withOverrides:156.0];
  *((void *)&xmmword_16210 + 1) = v6;

  v34[0] = &off_115A0;
  v34[1] = &off_115D0;
  v35[0] = &off_10E60;
  v35[1] = &off_10E70;
  v34[2] = &off_115E8;
  v34[3] = &off_11600;
  v35[2] = &off_10E70;
  v35[3] = &off_10E80;
  v34[4] = &off_11618;
  v35[4] = &off_10E00;
  id v7 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:5];
  [v2 scaledValue:v7 withOverrides:130.0];
  qword_16220 = v8;

  v33[0] = &off_10E90;
  v33[1] = &off_10EA0;
  v32[0] = &off_115A0;
  v32[1] = &off_115B8;
  v32[2] = &off_115D0;
  v32[3] = &off_115E8;
  v33[2] = &off_10EB0;
  v33[3] = &off_10EB0;
  v32[4] = &off_11600;
  v32[5] = &off_11618;
  v33[4] = &off_10E70;
  v33[5] = &off_10EC0;
  int64_t v9 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
  [v2 scaledValue:v9 withOverrides:141.0];
  qword_16228 = v10;

  [v2 scaledValue:7.5];
  *(void *)&xmmword_16230 = v11;
  *((void *)&xmmword_16230 + 1) = 0xC038000000000000;
  [v2 scaledValue:3.5];
  qword_16248 = v12;
  v30[0] = &off_115A0;
  v30[1] = &off_115B8;
  v31[0] = &off_10ED0;
  v31[1] = &off_10EE0;
  v30[2] = &off_115D0;
  v30[3] = &off_115E8;
  v31[2] = &off_10E60;
  v31[3] = &off_10E60;
  v30[4] = &off_11600;
  v30[5] = &off_11618;
  v31[4] = &off_10EF0;
  v31[5] = &off_10F00;
  int64_t v13 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
  [v2 scaledValue:v13 withOverrides:124.0];
  *(void *)&xmmword_16250 = v14;

  [v2 scaledValue:8.0];
  *((void *)&xmmword_16250 + 1) = v15;
  qword_16260 = 0xC034000000000000;
  v28[0] = &off_115A0;
  v28[1] = &off_115D0;
  v29[0] = &off_10F10;
  v29[1] = &off_10F20;
  v28[2] = &off_115E8;
  v28[3] = &off_11600;
  v29[2] = &off_10F20;
  v29[3] = &off_10F30;
  v28[4] = &off_11618;
  v29[4] = &off_10E80;
  double v16 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:5];
  [v2 scaledValue:v16 withOverrides:118.0];
  qword_16268 = v17;

  [v2 scaledValue:3 withOverride:9.5 forSizeClass:11.0];
  *(void *)&xmmword_16270 = v18;
  v26 = &off_115A0;
  v27 = &off_10F40;
  long long v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v2 scaledValue:v19 withOverrides:102.5];
  *((void *)&xmmword_16270 + 1) = v20;

  v24[0] = &off_115A0;
  v24[1] = &off_115B8;
  v25[0] = &off_10F50;
  v25[1] = &off_10F60;
  v24[2] = &off_115D0;
  v24[3] = &off_115E8;
  v25[2] = &off_10F70;
  v25[3] = &off_10F70;
  v24[4] = &off_11600;
  void v24[5] = &off_11618;
  v25[4] = &off_10F80;
  v25[5] = &off_10F90;
  v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:6];
  [v2 scaledValue:v21 withOverrides:112.0];
  qword_16280 = v22;

  [v2 setRoundingBehavior:3];
  [v2 scaledValue:1.75];
  qword_16240 = v23;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CLKCompressFraction()
{
  return _CLKCompressFraction();
}

uint64_t CLKContrastRatioForColors()
{
  return _CLKContrastRatioForColors();
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

uint64_t CLKLocaleNumberSystemIdentifier()
{
  return _CLKLocaleNumberSystemIdentifier();
}

uint64_t CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem()
{
  return _CLKLocaleRenderingHintLanguageIdentifierForNumberingSystem();
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

uint64_t CLKUILightnessForColor()
{
  return _CLKUILightnessForColor();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t NTKColorByApplyingWhiteOverlay()
{
  return _NTKColorByApplyingWhiteOverlay();
}

uint64_t NTKDateHourIn24HourTime()
{
  return _NTKDateHourIn24HourTime();
}

uint64_t NTKEqualObjects()
{
  return _NTKEqualObjects();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKKeylineViewWithCircle()
{
  return _NTKKeylineViewWithCircle();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend__applyColorToAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 _applyColorToAnalogHands];
}

id objc_msgSend__applyColorToDigitalLabelAndTicks(void *a1, const char *a2, ...)
{
  return [a1 _applyColorToDigitalLabelAndTicks];
}

id objc_msgSend__currentDate(void *a1, const char *a2, ...)
{
  return [a1 _currentDate];
}

id objc_msgSend__digitalLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _digitalLabelFont];
}

id objc_msgSend__hourMarkerFont(void *a1, const char *a2, ...)
{
  return [a1 _hourMarkerFont];
}

id objc_msgSend__idealizedCity(void *a1, const char *a2, ...)
{
  return [a1 _idealizedCity];
}

id objc_msgSend__loadDialView(void *a1, const char *a2, ...)
{
  return [a1 _loadDialView];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__loadUI(void *a1, const char *a2, ...)
{
  return [a1 _loadUI];
}

id objc_msgSend__localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 _localTimeZone];
}

id objc_msgSend__newHourMarkerLabel(void *a1, const char *a2, ...)
{
  return [a1 _newHourMarkerLabel];
}

id objc_msgSend__northPoleCoordinate(void *a1, const char *a2, ...)
{
  return [a1 _northPoleCoordinate];
}

id objc_msgSend__notifyObserversFaceTimeStyleChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyObserversFaceTimeStyleChanged];
}

id objc_msgSend__refreshDigitalTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 _refreshDigitalTimeLabel];
}

id objc_msgSend__rotateHourMarkerDialToCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 _rotateHourMarkerDialToCurrentTime];
}

id objc_msgSend__skipLocalization(void *a1, const char *a2, ...)
{
  return [a1 _skipLocalization];
}

id objc_msgSend__unloadDialView(void *a1, const char *a2, ...)
{
  return [a1 _unloadDialView];
}

id objc_msgSend__unloadUI(void *a1, const char *a2, ...)
{
  return [a1 _unloadUI];
}

id objc_msgSend__updateCityDialColor(void *a1, const char *a2, ...)
{
  return [a1 _updateCityDialColor];
}

id objc_msgSend__updateEditingImageColor(void *a1, const char *a2, ...)
{
  return [a1 _updateEditingImageColor];
}

id objc_msgSend__updateHourDialMarkers(void *a1, const char *a2, ...)
{
  return [a1 _updateHourDialMarkers];
}

id objc_msgSend__updateHourMarkerDial(void *a1, const char *a2, ...)
{
  return [a1 _updateHourMarkerDial];
}

id objc_msgSend__updateSunriseSunsetInfo(void *a1, const char *a2, ...)
{
  return [a1 _updateSunriseSunsetInfo];
}

id objc_msgSend__updateTimeZoneHourOffset(void *a1, const char *a2, ...)
{
  return [a1 _updateTimeZoneHourOffset];
}

id objc_msgSend_alCity(void *a1, const char *a2, ...)
{
  return [a1 alCity];
}

id objc_msgSend_alCityId(void *a1, const char *a2, ...)
{
  return [a1 alCityId];
}

id objc_msgSend_analogContainerView(void *a1, const char *a2, ...)
{
  return [a1 analogContainerView];
}

id objc_msgSend_analogHandsView(void *a1, const char *a2, ...)
{
  return [a1 analogHandsView];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_angleOffset(void *a1, const char *a2, ...)
{
  return [a1 angleOffset];
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

id objc_msgSend_cityDialArrowMarker(void *a1, const char *a2, ...)
{
  return [a1 cityDialArrowMarker];
}

id objc_msgSend_cityDialDots(void *a1, const char *a2, ...)
{
  return [a1 cityDialDots];
}

id objc_msgSend_cityDialLabel(void *a1, const char *a2, ...)
{
  return [a1 cityDialLabel];
}

id objc_msgSend_cleanupAfterEditing(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterEditing];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryName(void *a1, const char *a2, ...)
{
  return [a1 countryName];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dialBackground(void *a1, const char *a2, ...)
{
  return [a1 dialBackground];
}

id objc_msgSend_digitalContainerView(void *a1, const char *a2, ...)
{
  return [a1 digitalContainerView];
}

id objc_msgSend_digitalTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 digitalTimeLabel];
}

id objc_msgSend_digitalTimeLabelFontScaleFactorForNumberSystemOverrides(void *a1, const char *a2, ...)
{
  return [a1 digitalTimeLabelFontScaleFactorForNumberSystemOverrides];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_globe(void *a1, const char *a2, ...)
{
  return [a1 globe];
}

id objc_msgSend_globeBlend(void *a1, const char *a2, ...)
{
  return [a1 globeBlend];
}

id objc_msgSend_globeSnapshotImage(void *a1, const char *a2, ...)
{
  return [a1 globeSnapshotImage];
}

id objc_msgSend_globetrotterPalette(void *a1, const char *a2, ...)
{
  return [a1 globetrotterPalette];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourMarkerDialBackground(void *a1, const char *a2, ...)
{
  return [a1 hourMarkerDialBackground];
}

id objc_msgSend_hourMarkerDialView(void *a1, const char *a2, ...)
{
  return [a1 hourMarkerDialView];
}

id objc_msgSend_hourMarkerLabel(void *a1, const char *a2, ...)
{
  return [a1 hourMarkerLabel];
}

id objc_msgSend_hourMarkerLabelLight(void *a1, const char *a2, ...)
{
  return [a1 hourMarkerLabelLight];
}

id objc_msgSend_hourMinuteHandInlay(void *a1, const char *a2, ...)
{
  return [a1 hourMinuteHandInlay];
}

id objc_msgSend_hourMinuteHandStroke(void *a1, const char *a2, ...)
{
  return [a1 hourMinuteHandStroke];
}

id objc_msgSend_hourTickLight(void *a1, const char *a2, ...)
{
  return [a1 hourTickLight];
}

id objc_msgSend_idealizedCityCoordinate(void *a1, const char *a2, ...)
{
  return [a1 idealizedCityCoordinate];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_innerComplication(void *a1, const char *a2, ...)
{
  return [a1 innerComplication];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isEvergreenCollection(void *a1, const char *a2, ...)
{
  return [a1 isEvergreenCollection];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return [a1 legibilityWeight];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_markerContainerView(void *a1, const char *a2, ...)
{
  return [a1 markerContainerView];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numeralOption(void *a1, const char *a2, ...)
{
  return [a1 numeralOption];
}

id objc_msgSend_outerComplication(void *a1, const char *a2, ...)
{
  return [a1 outerComplication];
}

id objc_msgSend_prepareForEditing(void *a1, const char *a2, ...)
{
  return [a1 prepareForEditing];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_redCityDialArrowMarker(void *a1, const char *a2, ...)
{
  return [a1 redCityDialArrowMarker];
}

id objc_msgSend_redSecondHand(void *a1, const char *a2, ...)
{
  return [a1 redSecondHand];
}

id objc_msgSend_reloadMarkers(void *a1, const char *a2, ...)
{
  return [a1 reloadMarkers];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_rise(void *a1, const char *a2, ...)
{
  return [a1 rise];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondTickActive(void *a1, const char *a2, ...)
{
  return [a1 secondTickActive];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return [a1 startAnimation];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unlocalizedCityName(void *a1, const char *a2, ...)
{
  return [a1 unlocalizedCityName];
}

id objc_msgSend_unlocalizedCountryName(void *a1, const char *a2, ...)
{
  return [a1 unlocalizedCountryName];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteCityDialArrowMarker(void *a1, const char *a2, ...)
{
  return [a1 whiteCityDialArrowMarker];
}

id objc_msgSend_yellowSecondHand(void *a1, const char *a2, ...)
{
  return [a1 yellowSecondHand];
}