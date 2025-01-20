void sub_28B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_28D0(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15E08);
  id WeakRetained = objc_loadWeakRetained(&qword_15E10);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_15E10);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_15E18;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_15E10, obj);
  qword_15E18 = (uint64_t)[obj version];

  sub_37EC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15E08);
  long long v10 = *(_OWORD *)&qword_15DE8;
  a2[4] = xmmword_15DD8;
  a2[5] = v10;
  a2[6] = xmmword_15DF8;
  long long v11 = *(_OWORD *)&qword_15DA8;
  *a2 = xmmword_15D98;
  a2[1] = v11;
  long long v12 = *(_OWORD *)&qword_15DC8;
  a2[2] = xmmword_15DB8;
  a2[3] = v12;
}

id sub_29F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained
    && ((v3 = (void *)*((void *)WeakRetained + 2)) != 0 || (v3 = (void *)*((void *)WeakRetained + 3)) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NTKDate faceDate];
  }
  id v5 = v4;

  return v5;
}

void sub_37EC(uint64_t a1, uint64_t a2)
{
  id v12 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v12 scaledValue:71.5];
  *(void *)&xmmword_15D98 = v2;
  [v12 scaledValue:80.0];
  *((void *)&xmmword_15D98 + 1) = v3;
  [v12 scaledValue:91.5];
  qword_15DA8 = v4;
  [v12 scaledValue:3.5];
  qword_15DB0 = v5;
  [v12 scaledValue:2.5];
  *(void *)&xmmword_15DB8 = v6;
  [v12 scaledValue:4.0];
  *((void *)&xmmword_15DB8 + 1) = 0x3FF4000000000000;
  qword_15DC8 = v7;
  [v12 scaledValue:7.5];
  qword_15DD0 = 0x3FF4000000000000;
  *(void *)&xmmword_15DD8 = v8;
  [v12 scaledValue:3.0];
  *((void *)&xmmword_15DD8 + 1) = 0x3FF4000000000000;
  qword_15DE8 = v9;
  [v12 scaledValue:6.0];
  qword_15DF0 = 0x3FF4000000000000;
  *(void *)&xmmword_15DF8 = v10;
  [v12 scaledValue:30.0];
  *((void *)&xmmword_15DF8 + 1) = v11;
}

void sub_3E10(id a1)
{
  qword_15E20 = (uint64_t)[objc_alloc((Class)NTKCornerComplicationConfiguration) initWithTopLeftComplication:43 topRightComplication:10 bottomLeftComplication:3 bottomRightComplication:12];

  _objc_release_x1();
}

void sub_42A0(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15E70);
  id WeakRetained = objc_loadWeakRetained(&qword_15E78);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_15E78);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_15E80;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_15E78, obj);
  qword_15E80 = (uint64_t)[obj version];

  sub_5CFC(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15E70);
  long long v10 = *(_OWORD *)&qword_15E50;
  *a2 = xmmword_15E40;
  a2[1] = v10;
  a2[2] = xmmword_15E60;
}

void sub_5B94(id a1)
{
  qword_15E30 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_5BD0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 snapshotImage];
  objc_msgSend(v5, "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  id v7 = [*(id *)(a1 + 32) layer];
  id v6 = [v4 CGContext];

  [v7 renderInContext:v6];
}

void sub_5CFC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v8 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  uint64_t v4 = v3;

  *(void *)&xmmword_15E40 = v4;
  [v8 scaledValue:100.5];
  *((void *)&xmmword_15E40 + 1) = v5;
  [v8 scaledValue:14.5];
  qword_15E50 = v6;
  [v8 scaledValue:10.25];
  qword_15E58 = v7;
  xmmword_15E60 = xmmword_D0C0;
}

double sub_5E40(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15E98);
  id WeakRetained = objc_loadWeakRetained(&qword_15EA0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_15EA0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_15EA0, v1);
    qword_15EA8 = (uint64_t)[v1 version];

    sub_5FB8(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_15EA8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15E98);
  double v9 = *(double *)&qword_15E88;

  return v9;
}

void sub_5FB8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v6 setRoundingBehavior:3];
  [v6 scaledValue:3 withOverride:49.0 forSizeClass:54.0];
  qword_15E88 = v3;
  [v2 screenScale];
  double v5 = v4;

  *(double *)&qword_15E90 = 4.5 / v5;
}

void sub_63B0(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_15F48);
  id WeakRetained = objc_loadWeakRetained(&qword_15F50);
  if (WeakRetained)
  {
    double v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_15F50);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_15F58;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_15F50, obj);
  qword_15F58 = (uint64_t)[obj version];

  sub_97EC(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_15F48);
  long long v10 = *(_OWORD *)&qword_15F20;
  *(_OWORD *)(a2 + 96) = xmmword_15F10;
  *(_OWORD *)(a2 + 112) = v10;
  *(_OWORD *)(a2 + 128) = xmmword_15F30;
  *(void *)(a2 + 144) = qword_15F40;
  long long v11 = *(_OWORD *)&qword_15EE0;
  *(_OWORD *)(a2 + 32) = xmmword_15ED0;
  *(_OWORD *)(a2 + 48) = v11;
  long long v12 = *(_OWORD *)&qword_15F00;
  *(_OWORD *)(a2 + 64) = xmmword_15EF0;
  *(_OWORD *)(a2 + 80) = v12;
  long long v13 = *(_OWORD *)&qword_15EC0;
  *(_OWORD *)a2 = xmmword_15EB0;
  *(_OWORD *)(a2 + 16) = v13;
}

void sub_6B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_6B50(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init((Class)UILabel);
    id v5 = [WeakRetained[29] calendarDialDateLabel];
    [v4 setTextColor:v5];

    id v6 = [WeakRetained _dateLabelFont];
    [v4 setFont:v6];

    uint64_t v7 = [WeakRetained _dateForIndex:a2];
    id v8 = [WeakRetained _lunarDateLabelTextForDate:v7];
    [v4 setText:v8];

    [v4 sizeToFit];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void sub_6D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_6D60(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained _dateForIndex:a2];
    id v6 = [v4 _moonPhaseImageForDate:v5];
    id v7 = [objc_alloc((Class)UIImageView) initWithImage:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id sub_6F4C(uint64_t a1)
{
  id v2 = +[CALayer layer];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v2 setBackgroundColor:*(void *)(a1 + 64)];

  return v2;
}

void sub_7054(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v8 = [v5 _dateForIndex:a3];
  id v7 = [*(id *)(a1 + 32) _lunarDateLabelTextForDate:v8];
  [v6 setText:v7];

  [v6 sizeToFit];
}

void sub_7210(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) _dateForIndex:a3];
  id v7 = *(void **)(a1 + 32);
  id v9 = v5;
  id v8 = [v7 _moonPhaseImageForDate:v6];
  [v9 setImage:v8];
}

void sub_97EC(uint64_t a1, uint64_t a2)
{
  id v2 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:158.0];
  double v4 = v3;
  [v2 scaledValue:129.0];
  double v6 = v5;
  [v2 scaledValue:100.5];
  double v8 = v7;
  [v2 scaledValue:163.0];
  double v10 = v9;
  [v2 scaledValue:95.5];
  *(double *)&xmmword_15EB0 = v4 * 0.5;
  *((double *)&xmmword_15EB0 + 1) = v6 * 0.5;
  *(double *)&qword_15EC0 = v8 * 0.5;
  unk_15EC8 = v10 * 0.5;
  *(double *)&xmmword_15ED0 = v11 * 0.5;
  [v2 scaledValue:60.0];
  *((void *)&xmmword_15ED0 + 1) = v12;
  [v2 scaledValue:74.5];
  qword_15EE0 = v13;
  qword_15EE8 = 0xC014000000000000;
  [v2 scaledValue:1.25];
  *(void *)&xmmword_15EF0 = v14;
  [v2 scaledValue:9.5];
  *((void *)&xmmword_15EF0 + 1) = v15;
  v27[0] = &off_10A50;
  v27[1] = &off_10A68;
  v28[0] = &off_10B30;
  v28[1] = &off_10B40;
  v27[2] = &off_10A80;
  v27[3] = &off_10A98;
  v28[2] = &off_10B50;
  v28[3] = &off_10B50;
  v27[4] = &off_10AB0;
  v27[5] = &off_10AC8;
  v28[4] = &off_10B30;
  v28[5] = &off_10B60;
  v16 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:6];
  [v2 scaledValue:v16 withOverrides:145.5];
  qword_15F00 = v17;

  v25[0] = &off_10A68;
  v25[1] = &off_10A80;
  v26[0] = &off_10B70;
  v26[1] = &off_10B80;
  v25[2] = &off_10A98;
  v26[2] = &off_10B80;
  v18 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  [v2 scaledValue:v18 withOverrides:114.75];
  qword_15F08 = v19;

  [v2 scaledValue:6.0];
  *(void *)&xmmword_15F10 = v20;
  *((double *)&xmmword_15F10 + 1) = (v6 - v8) * 0.5;
  qword_15F20 = 0x3FE8000000000000;
  CLKDegreesToRadians();
  qword_15F28 = v21;
  CLKDegreesToRadians();
  *(void *)&xmmword_15F30 = v22;
  CLKDegreesToRadians();
  *((void *)&xmmword_15F30 + 1) = v23;
  CLKDegreesToRadians();
  qword_15F40 = v24;
}

uint64_t NTKSeltzerUseAllUppercaseText()
{
  if (qword_15F68 != -1) {
    dispatch_once(&qword_15F68, &stru_10550);
  }
  return byte_15F60;
}

void sub_9B04(id a1)
{
  uint64_t v1 = +[NTKSeltzerFaceBundle localizedStringForKey:@"SELTZER_USE_ALL_UPPERCASE_TEXT" comment:@"1"];
  if (v1 && [@"1" isEqualToString:v1]) {
    byte_15F60 = 1;
  }

  _objc_release_x1();
}

uint64_t sub_9D74()
{
  qword_15F70 = _EnumValueRange();

  return _objc_release_x1();
}

void sub_9EBC(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = objc_opt_class();
  double v4 = [*(id *)(a1 + 32) device];
  double v5 = [v3 _orderedValuesForDevice:v4];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"calendar %lu", [v10 unsignedIntValue]);
        [v2 setObject:v11 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)qword_15F90;
  qword_15F90 = (uint64_t)v2;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
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

uint64_t CLKDegreesToRadians()
{
  return _CLKDegreesToRadians();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenTransform()
{
  return _CLKInterpolateBetweenTransform();
}

uint64_t CLKLayoutIsRTL()
{
  return _CLKLayoutIsRTL();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectCenteredAboutPointForDevice()
{
  return _CLKRectCenteredAboutPointForDevice();
}

uint64_t CLKRectGetCenter()
{
  return _CLKRectGetCenter();
}

uint64_t NTKAddDaysToDate()
{
  return _NTKAddDaysToDate();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
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

uint64_t NTKLunarCalendarID()
{
  return _NTKLunarCalendarID();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t NUNIMoonPhaseNumber()
{
  return _NUNIMoonPhaseNumber();
}

uint64_t NUNIRenderedMoonImage()
{
  return _NUNIRenderedMoonImage();
}

uint64_t _EnumValueRange()
{
  return __EnumValueRange();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend__applyColorToAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 _applyColorToAnalogHands];
}

id objc_msgSend__cardinalSecondTickInset(void *a1, const char *a2, ...)
{
  return [a1 _cardinalSecondTickInset];
}

id objc_msgSend__createDateLabel(void *a1, const char *a2, ...)
{
  return [a1 _createDateLabel];
}

id objc_msgSend__currentDate(void *a1, const char *a2, ...)
{
  return [a1 _currentDate];
}

id objc_msgSend__dateLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _dateLabelFont];
}

id objc_msgSend__dayOffset(void *a1, const char *a2, ...)
{
  return [a1 _dayOffset];
}

id objc_msgSend__drawDialMaskOutline(void *a1, const char *a2, ...)
{
  return [a1 _drawDialMaskOutline];
}

id objc_msgSend__drawDialOutlines(void *a1, const char *a2, ...)
{
  return [a1 _drawDialOutlines];
}

id objc_msgSend__drawKeystoneOutline(void *a1, const char *a2, ...)
{
  return [a1 _drawKeystoneOutline];
}

id objc_msgSend__drawOutlines(void *a1, const char *a2, ...)
{
  return [a1 _drawOutlines];
}

id objc_msgSend__hourTickInset(void *a1, const char *a2, ...)
{
  return [a1 _hourTickInset];
}

id objc_msgSend__keystoneDateLabelCenter(void *a1, const char *a2, ...)
{
  return [a1 _keystoneDateLabelCenter];
}

id objc_msgSend__keystoneDateLabelText(void *a1, const char *a2, ...)
{
  return [a1 _keystoneDateLabelText];
}

id objc_msgSend__keystoneIndex(void *a1, const char *a2, ...)
{
  return [a1 _keystoneIndex];
}

id objc_msgSend__keystoneMoonPhaseImage(void *a1, const char *a2, ...)
{
  return [a1 _keystoneMoonPhaseImage];
}

id objc_msgSend__keystoneMoonPhaseImageViewCenter(void *a1, const char *a2, ...)
{
  return [a1 _keystoneMoonPhaseImageViewCenter];
}

id objc_msgSend__loadBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _loadBackgroundView];
}

id objc_msgSend__loadContainerViews(void *a1, const char *a2, ...)
{
  return [a1 _loadContainerViews];
}

id objc_msgSend__loadCornerOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _loadCornerOverlayView];
}

id objc_msgSend__loadDateLabels(void *a1, const char *a2, ...)
{
  return [a1 _loadDateLabels];
}

id objc_msgSend__loadKeystone(void *a1, const char *a2, ...)
{
  return [a1 _loadKeystone];
}

id objc_msgSend__loadLunarCalendarDial(void *a1, const char *a2, ...)
{
  return [a1 _loadLunarCalendarDial];
}

id objc_msgSend__loadMoonPhaseDial(void *a1, const char *a2, ...)
{
  return [a1 _loadMoonPhaseDial];
}

id objc_msgSend__loadMoonPhaseSeparatorDial(void *a1, const char *a2, ...)
{
  return [a1 _loadMoonPhaseSeparatorDial];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__loadTimeView(void *a1, const char *a2, ...)
{
  return [a1 _loadTimeView];
}

id objc_msgSend__loadUI(void *a1, const char *a2, ...)
{
  return [a1 _loadUI];
}

id objc_msgSend__lunarCalendar(void *a1, const char *a2, ...)
{
  return [a1 _lunarCalendar];
}

id objc_msgSend__monospacedDateLabelFont(void *a1, const char *a2, ...)
{
  return [a1 _monospacedDateLabelFont];
}

id objc_msgSend__notifyObserversFaceTimeStyleChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyObserversFaceTimeStyleChanged];
}

id objc_msgSend__overlayCalendar(void *a1, const char *a2, ...)
{
  return [a1 _overlayCalendar];
}

id objc_msgSend__unloadCornerOverlayView(void *a1, const char *a2, ...)
{
  return [a1 _unloadCornerOverlayView];
}

id objc_msgSend__unloadDialView(void *a1, const char *a2, ...)
{
  return [a1 _unloadDialView];
}

id objc_msgSend__unloadTimeView(void *a1, const char *a2, ...)
{
  return [a1 _unloadTimeView];
}

id objc_msgSend__unloadUI(void *a1, const char *a2, ...)
{
  return [a1 _unloadUI];
}

id objc_msgSend__updateKeystone(void *a1, const char *a2, ...)
{
  return [a1 _updateKeystone];
}

id objc_msgSend__updateLunarCalendarUI(void *a1, const char *a2, ...)
{
  return [a1 _updateLunarCalendarUI];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
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

id objc_msgSend_anyLocation(void *a1, const char *a2, ...)
{
  return [a1 anyLocation];
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

id objc_msgSend_calendarDialDateLabel(void *a1, const char *a2, ...)
{
  return [a1 calendarDialDateLabel];
}

id objc_msgSend_calendarTimeZone(void *a1, const char *a2, ...)
{
  return [a1 calendarTimeZone];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentPoint(void *a1, const char *a2, ...)
{
  return [a1 currentPoint];
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

id objc_msgSend_dialBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 dialBackgroundView];
}

id objc_msgSend_dialStroke(void *a1, const char *a2, ...)
{
  return [a1 dialStroke];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_digitalContainerView(void *a1, const char *a2, ...)
{
  return [a1 digitalContainerView];
}

id objc_msgSend_digitalTicksContainerView(void *a1, const char *a2, ...)
{
  return [a1 digitalTicksContainerView];
}

id objc_msgSend_digitalTimeLabel(void *a1, const char *a2, ...)
{
  return [a1 digitalTimeLabel];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_heroDateLabel(void *a1, const char *a2, ...)
{
  return [a1 heroDateLabel];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_innerComplication(void *a1, const char *a2, ...)
{
  return [a1 innerComplication];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return [a1 keyPath];
}

id objc_msgSend_keystoneDateLabel(void *a1, const char *a2, ...)
{
  return [a1 keystoneDateLabel];
}

id objc_msgSend_keystoneMoonBackground(void *a1, const char *a2, ...)
{
  return [a1 keystoneMoonBackground];
}

id objc_msgSend_keystoneMoonForeground(void *a1, const char *a2, ...)
{
  return [a1 keystoneMoonForeground];
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

id objc_msgSend_moonBackground(void *a1, const char *a2, ...)
{
  return [a1 moonBackground];
}

id objc_msgSend_moonForeground(void *a1, const char *a2, ...)
{
  return [a1 moonForeground];
}

id objc_msgSend_outerComplication(void *a1, const char *a2, ...)
{
  return [a1 outerComplication];
}

id objc_msgSend_reloadMarkers(void *a1, const char *a2, ...)
{
  return [a1 reloadMarkers];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_secondTickActive(void *a1, const char *a2, ...)
{
  return [a1 secondTickActive];
}

id objc_msgSend_sharedLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocationManager];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snapshotImage(void *a1, const char *a2, ...)
{
  return [a1 snapshotImage];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateDialUI(void *a1, const char *a2, ...)
{
  return [a1 updateDialUI];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}