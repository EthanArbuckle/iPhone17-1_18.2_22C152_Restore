uint64_t sub_23C354368()
{
  uint64_t v0;
  void *v1;
  void v3[6];
  long long v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268BA3C10)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = sub_23C35783C;
    v3[4] = &unk_264E3D8E0;
    v3[5] = v3;
    v4 = xmmword_264E3D8C8;
    v5 = 0;
    qword_268BA3C10 = _sl_dlopen();
  }
  v0 = qword_268BA3C10;
  v1 = (void *)v3[0];
  if (!qword_268BA3C10)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_23C354468()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268BA3CF8)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = sub_23C35BC6C;
    v3[4] = &unk_264E3D8E0;
    v3[5] = v3;
    long long v4 = xmmword_264E3DA70;
    uint64_t v5 = 0;
    qword_268BA3CF8 = _sl_dlopen();
  }
  uint64_t v0 = qword_268BA3CF8;
  v1 = (void *)v3[0];
  if (!qword_268BA3CF8)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_23C35518C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = 40;
  if (!a2) {
    uint64_t v7 = 48;
  }
  uint64_t v8 = *(void *)(a1 + v7);
  uint64_t v12 = *MEMORY[0x263F1C238];
  v13[0] = v8;
  v9 = NSDictionary;
  id v10 = a2;
  v11 = [v9 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  objc_msgSend(v6, "setAttributes:range:", v11, a3, a4);
}

id sub_23C3557FC(void *a1, void *a2, uint64_t a3, void *a4)
{
  long long v4 = 0;
  if (a2 && !a3)
  {
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    id v9 = a4;
    id v10 = a2;
    v11 = [v9 font];
    uint64_t v12 = [v9 smallCapsBaseFont];

    long long v4 = [v6 _swapPlaceholderString:v7 withTimeStringForDate:v8 inString:v10 usingBaseFont:v11 smallCapsBaseFont:v12];
  }

  return v4;
}

id sub_23C3558C0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_268BA3C18;
  uint64_t v7 = qword_268BA3C18;
  if (!qword_268BA3C18)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_23C3578B0;
    v3[3] = &unk_264E3D8A8;
    v3[4] = &v4;
    sub_23C3578B0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23C35598C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_23C3559A4(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void (*)(id))off_268BA3C20;
  id v10 = off_268BA3C20;
  if (!off_268BA3C20)
  {
    v3 = (void *)sub_23C354368();
    v8[3] = (uint64_t)dlsym(v3, "NTKLocationComponentStrings");
    off_268BA3C20 = (_UNKNOWN *)v8[3];
    v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    uint64_t v6 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(v1);

  return v4;
}

id sub_23C355AD0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)qword_268BA3C28;
  uint64_t v8 = qword_268BA3C28;
  if (!qword_268BA3C28)
  {
    id v1 = (void *)sub_23C354368();
    v6[3] = (uint64_t)dlsym(v1, "NTKLocationComponentLatitudeKey");
    qword_268BA3C28 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id sub_23C355BD8()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)qword_268BA3C30;
  uint64_t v8 = qword_268BA3C30;
  if (!qword_268BA3C30)
  {
    id v1 = (void *)sub_23C354368();
    v6[3] = (uint64_t)dlsym(v1, "NTKLocationComponentLongitudeKey");
    qword_268BA3C30 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;

  return v2;
}

id sub_23C355CE0(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void (*)(id, void))off_268BA3C38;
  id v10 = off_268BA3C38;
  if (!off_268BA3C38)
  {
    v3 = (void *)sub_23C354368();
    v8[3] = (uint64_t)dlsym(v3, "NTKLocationComponentStringsShowSeconds");
    off_268BA3C38 = (_UNKNOWN *)v8[3];
    v2 = (void (*)(id, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    uint64_t v6 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(v1, 0);

  return v4;
}

id sub_23C357298(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = 0;
  if (a2 && !a3)
  {
    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    id v9 = a4;
    id v10 = a2;
    v11 = [v9 font];
    uint64_t v12 = [v9 smallCapsBaseFont];

    v13 = [v6 _swapPlaceholderString:v7 withTimeStringForDate:v8 inString:v10 usingBaseFont:v11 smallCapsBaseFont:v12];

    v14 = (void *)[v13 mutableCopy];
    uint64_t v15 = *MEMORY[0x263F1C240];
    v16 = [MEMORY[0x263F1C550] systemOrangeColor];
    objc_msgSend(v14, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v13, "length"));

    uint64_t v4 = (void *)[v14 copy];
  }

  return v4;
}

void sub_23C357580(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C6B0] systemImageNamed:@"location.fill"];
  v3 = [MEMORY[0x263F1C6C8] configurationWithFont:*(void *)(a1 + 32) scale:1];
  id v6 = [v2 imageWithConfiguration:v3];

  uint64_t v4 = [v6 imageWithRenderingMode:2];
  uint64_t v5 = (void *)qword_268BA3BF8;
  qword_268BA3BF8 = v4;
}

void *sub_23C3577EC(uint64_t a1)
{
  v2 = (void *)sub_23C354368();
  result = dlsym(v2, "NTKComplicationFamilyUtilitarianLargeNarrow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268BA3C08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23C35783C()
{
  uint64_t result = _sl_dlopen();
  qword_268BA3C10 = result;
  return result;
}

Class sub_23C3578B0(uint64_t a1)
{
  sub_23C354368();
  Class result = objc_getClass("NTKOverrideTextProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_268BA3C18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_23C35D37C();
    return (Class)sub_23C357908(v3);
  }
  return result;
}

void *sub_23C357908(uint64_t a1)
{
  v2 = (void *)sub_23C354368();
  Class result = dlsym(v2, "NTKLocationComponentStrings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268BA3C20 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_23C357958(uint64_t a1)
{
  v2 = (void *)sub_23C354368();
  Class result = dlsym(v2, "NTKLocationComponentLatitudeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268BA3C28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_23C3579A8(uint64_t a1)
{
  v2 = (void *)sub_23C354368();
  Class result = dlsym(v2, "NTKLocationComponentLongitudeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268BA3C30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_23C3579F8(uint64_t a1)
{
  v2 = (void *)sub_23C354368();
  Class result = dlsym(v2, "NTKLocationComponentStringsShowSeconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268BA3C38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23C357AE8()
{
  qword_268BA3C48 = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

void sub_23C357D20()
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"PerformanceTestingEnabled"];

  if (v1)
  {
    v2 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfFile:@"/tmp/WorldClock-performance_test.plist"];
    if (!v2) {
      v2 = objc_opt_new();
    }
    uint64_t v3 = [v2 objectForKeyedSubscript:@"cityAddTest"];
    if (!v3) {
      uint64_t v3 = objc_opt_new();
    }
    CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() + *MEMORY[0x263EFFAF8];
    uint64_t v7 = @"timestamp";
    uint64_t v5 = [NSNumber numberWithDouble:v4];
    v8[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 setObject:v6 forKeyedSubscript:@"cityAdded"];

    [v2 setObject:v3 forKeyedSubscript:@"cityAddTest"];
    [v2 writeToFile:@"/tmp/WorldClock-performance_test.plist" atomically:1];
  }
  dispatch_async(MEMORY[0x263EF83A0], &unk_26EFF58F8);
}

uint64_t sub_23C3582E8()
{
  return MEMORY[0x270F9A6D0](qword_268BA3C48, sel__notifyPrefsChanged);
}

double NWCMapPointForLocationOnMap(void *a1, double a2, double a3, double a4)
{
  id v6 = a1;
  [v6 bounds];
  double Width = CGRectGetWidth(v21);
  [v6 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  CGRectGetHeight(v22);
  double v16 = a4 + (a3 + 180.0) * Width / 360.0;
  double v17 = -0.0;
  if (v16 < 0.0) {
    double v17 = Width;
  }
  double v18 = v16 + v17;
  if (v18 <= Width) {
    double v19 = 0.0;
  }
  else {
    double v19 = Width;
  }
  return v18 - v19;
}

double NWCDayOfYearForDate(void *a1)
{
  int v1 = (objc_class *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  id v3 = [v1 alloc];
  CFAbsoluteTime v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v5 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];

  id v6 = [v4 components:4 fromDate:v2];
  [v6 setMonth:1];
  [v6 setDay:1];
  [v6 setHour:0];
  [v6 setMinute:0];
  [v6 setSecond:0];
  uint64_t v7 = [v4 dateFromComponents:v6];
  double v8 = [v4 components:128 fromDate:v7 toDate:v2 options:1];

  double v9 = (double)[v8 second] / 86400.0 + 1.0;
  return v9;
}

double NWCDegreesFromRadians(double a1)
{
  return a1 * 57.2957795;
}

double NWCHourAngle(double a1)
{
  return (a1 + -12.0) * 15.0;
}

double NWCRadiansFromDegrees(double a1)
{
  return a1 * 0.0174532925;
}

long double NWCSolarDeclination(double a1)
{
  return sin((a1 + 284.0) * 0.98630137 * 0.0174532925) * 23.45;
}

id NWCNightMaskPathForDayOfYear()
{
  uint64_t v0 = (void *)MEMORY[0x270FA5388]();
  double v2 = v1;
  long double v4 = v3;
  v29[0] = *MEMORY[0x263EF8340];
  id v5 = v0;
  long double v6 = sin((v4 + 284.0) * 0.98630137 * 0.0174532925) * 23.45;
  double v7 = (modf(v4, &v27) * 24.0 + -12.0) * 15.0;
  double v8 = tan(v6 * 0.0174532925);
  double v9 = (double *)&v28;
  for (uint64_t i = -180; i != 181; ++i)
  {
    double v11 = (double)i;
    double v12 = 90.0;
    if (v8 != 0.0)
    {
      long double v13 = cos((v7 + v11) * 0.0174532925);
      double v12 = atan(-v13 / v8) * 57.2957795;
    }
    *(v9 - 1) = v12;
    double *v9 = v11;
    v9 += 2;
  }
  double v14 = [MEMORY[0x263F1C478] bezierPath];
  CGFloat v15 = (double *)malloc_type_malloc(0x1690uLL, 0x1000040451B5BE8uLL);
  uint64_t v16 = 0x1FFFFFFFFFFFFD2ELL;
  do
  {
    double v17 = &v15[v16];
    v17[722] = NWCMapPointForLocationOnMap(v5, *(double *)&v29[v16], *(double *)&v29[v16 + 1], v2);
    *((void *)v17 + 723) = v18;
    v16 += 2;
  }
  while (v16 * 8);
  double v19 = *v15;
  size_t v20 = 2;
  uint64_t v21 = 720;
  double v22 = *v15;
  while (1)
  {
    double v23 = v22;
    double v22 = v15[v20];
    if (v22 < v23) {
      break;
    }
    v20 += 2;
    v21 -= 2;
    if (!(v21 * 8)) {
      goto LABEL_12;
    }
  }
  v24 = (double *)malloc_type_malloc(0x1690uLL, 0xF1566E2CuLL);
  __memcpy_chk();
  memcpy(&v24[v21], v15, v20 * 8);
  free(v15);
  double v19 = *v24;
  CGFloat v15 = v24;
LABEL_12:
  objc_msgSend(v14, "moveToPoint:", v19, v15[1]);
  uint64_t v25 = 0x1FFFFFFFFFFFFD30;
  do
  {
    objc_msgSend(v14, "addLineToPoint:", v15[v25 + 722], v15[v25 + 723]);
    v25 += 2;
  }
  while (v25 * 8);
  free(v15);

  return v14;
}

id sub_23C358864(void *a1, uint64_t a2, void *a3)
{
  double v4 = NWCDayOfYearForDate(a3);
  id v5 = NWCNightMaskPathForDayOfYear();
  long double v6 = [MEMORY[0x263F1C478] bezierPath];
  [a1 bounds];
  double v8 = v7;
  double v10 = v9;
  if (sin((v4 + 284.0) * 0.98630137 * 0.0174532925) * 23.45 <= 0.0) {
    double v10 = 0.0;
  }
  objc_msgSend(v6, "moveToPoint:");
  [v6 appendPath:v5];
  objc_msgSend(v6, "addLineToPoint:", v8, v10);
  objc_msgSend(v6, "addLineToPoint:", 0.0, v10);
  [a1 bounds];
  v18.width = v11;
  v18.height = v12;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  long double v13 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.65];
  [v13 setFill];

  [v6 fillWithBlendMode:17 alpha:1.0];
  double v14 = [MEMORY[0x263F1C550] systemGrayColor];
  [v14 setStroke];
  [v5 stroke];
  CGFloat v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

__CFString *NWCComplicationLocationNameForPlacemark(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  long double v6 = &stru_26EFF5FF8;
  if (!a1 || !v4) {
    goto LABEL_28;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  double v8 = [v5 locality];
  if (![v8 length]) {
    goto LABEL_6;
  }
  double v9 = [v5 administrativeArea];
  double v2 = (void *)[v9 length];

  if (v2)
  {
    double v8 = [v5 locality];
    [v7 addObject:v8];
LABEL_6:
  }
  double v10 = [v5 locality];
  uint64_t v11 = [v10 length];
  if (v11
    && ([v5 administrativeArea],
        double v2 = objc_claimAutoreleasedReturnValue(),
        [v2 length]))
  {
  }
  else
  {
    CGFloat v12 = [v5 inlandWater];
    uint64_t v13 = [v12 length];

    if (v11) {
    if (!v13)
    }
      goto LABEL_15;
    double v10 = [v5 inlandWater];
    [v7 addObject:v10];
  }

LABEL_15:
  double v14 = [v5 administrativeArea];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    uint64_t v16 = [v5 administrativeArea];
    [v7 addObject:v16];
  }
  double v17 = [v5 country];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    double v19 = [v5 country];
    [v7 addObject:v19];
  }
  if (![v7 count])
  {
    size_t v20 = [v5 ocean];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      double v22 = [v5 ocean];
      [v7 addObject:v22];
    }
  }
  if ((unint64_t)[v7 count] < 2)
  {
    if ([v7 count] == 1)
    {
      long double v6 = [v7 firstObject];
    }
    else
    {
      long double v6 = &stru_26EFF5FF8;
    }
  }
  else
  {
    double v23 = NWCComplicationLocalizedString(@"LOCATION_LOCALITY_MULTIPLE_FORMAT", @"multiple locality items", 0);
    v24 = NSString;
    uint64_t v25 = [v7 objectAtIndexedSubscript:0];
    v26 = [v7 objectAtIndexedSubscript:1];
    objc_msgSend(v24, "localizedStringWithFormat:", v23, v25, v26);
    long double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_28:

  return v6;
}

uint64_t sub_23C358D44()
{
  qword_268BA3C50 = objc_alloc_init(NWCComplicationGeocoder);

  return MEMORY[0x270F9A758]();
}

void sub_23C359220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_23C359244(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_23C35925C(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handlePlacemarks:v7 fromLocation:*(void *)(a1 + 32) error:v6];
}

void sub_23C359560(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

id NTALogForCategory(unint64_t a1)
{
  if (a1 >= 0xF) {
    sub_23C35D440();
  }
  if (qword_268BA3CD8 != -1) {
    dispatch_once(&qword_268BA3CD8, &unk_26EFF5938);
  }
  uint64_t v2 = (void *)qword_268BA3C60[a1];

  return v2;
}

uint64_t sub_23C359734()
{
  os_log_t v0 = os_log_create("com.apple.nanotimeapps", "NanoTimeApps");
  id v1 = (void *)qword_268BA3C60[0];
  qword_268BA3C60[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.nanotimeapps", "TimeAppServices");
  uint64_t v3 = (void *)qword_268BA3C68;
  qword_268BA3C68 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.nanotimeapps", "TimeAppServicesSound");
  uint64_t v5 = (void *)qword_268BA3CD0;
  qword_268BA3CD0 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.nanotimeapps", "NanoTimer");
  long long v7 = (void *)qword_268BA3C70;
  qword_268BA3C70 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.nanotimeapps", "NanoAlarm");
  long long v9 = (void *)qword_268BA3C78;
  qword_268BA3C78 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.nanotimeapps", "NanoStopwatch");
  uint64_t v11 = (void *)qword_268BA3C80;
  qword_268BA3C80 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.nanotimeapps", "NanoWorldClock");
  uint64_t v13 = (void *)qword_268BA3C88;
  qword_268BA3C88 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.nanotimeapps", "NanoClockAlertProvider");
  uint64_t v15 = (void *)qword_268BA3CA8;
  qword_268BA3CA8 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.nanotimeapps", "NanoClockActivateProvider");
  double v17 = (void *)qword_268BA3CB0;
  qword_268BA3CB0 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.nanotimeapps", "NanoTimerSiri");
  double v19 = (void *)qword_268BA3CB8;
  qword_268BA3CB8 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.nanotimeapps", "Tool");
  uint64_t v21 = (void *)qword_268BA3CC0;
  qword_268BA3CC0 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.nanotimeapps", "SessionProvider");
  double v23 = (void *)qword_268BA3CC8;
  qword_268BA3CC8 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.nanotimeapps", "Complication");
  uint64_t v25 = (void *)qword_268BA3C90;
  qword_268BA3C90 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.nanotimeapps", "SunriseComplication");
  long double v27 = (void *)qword_268BA3C98;
  qword_268BA3C98 = (uint64_t)v26;

  qword_268BA3CA0 = (uint64_t)os_log_create("com.apple.nanotimeapps", "WorldClockComplication");

  return MEMORY[0x270F9A758]();
}

id sub_23C359B88()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)qword_268BA3D08;
  uint64_t v7 = qword_268BA3D08;
  if (!qword_268BA3D08)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_23C35BD30;
    v3[3] = &unk_264E3D8A8;
    v3[4] = &v4;
    sub_23C35BD30((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_23C359C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C359D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C359D7C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleLocation:v7 error:v6];
}

void sub_23C35A530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23C35A54C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  os_log_t v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setWaitingForGeocodeRequest:0];
    if (v6)
    {
      long long v9 = NTALogForCategory(7uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_23C35D46C((uint64_t)v6, v9);
      }

      [v8 _scheduleReverseGeocodeTimer:300.0];
    }
    else
    {
      os_log_t v10 = NWCComplicationLocationNameForPlacemark(*(void *)(a1 + 32), v5);
      [v8 setLocationName:v10];

      [v8 setDisplayedLocation:*(void *)(a1 + 32)];
      [v8 setGeocodeDelayedLocation:0];
      [v8 _invalidate];
    }
  }
}

void sub_23C35ABD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

uint64_t sub_23C35AC04()
{
  qword_268BA3CE0 = (uint64_t)objc_alloc_init(MEMORY[0x263F417D8]);

  return MEMORY[0x270F9A758]();
}

void sub_23C35AC40(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setWaitingForChinaShiftingRequest:0];
    CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(a2, a3);
    id v11 = objc_alloc(MEMORY[0x263F00A50]);
    [*(id *)(a1 + 32) altitude];
    double v13 = v12;
    [*(id *)(a1 + 32) verticalAccuracy];
    double v15 = v14;
    os_log_t v16 = [*(id *)(a1 + 32) timestamp];
    double v17 = objc_msgSend(v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v16, 2, v10.latitude, v10.longitude, v13, a4, v15);

    os_log_t v18 = NTALogForCategory(7uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v20 = 138412546;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      double v23 = v17;
      _os_log_impl(&dword_23C352000, v18, OS_LOG_TYPE_DEFAULT, "Successfully performed China shift from source location: %@\n ...to shifted location: %@", (uint8_t *)&v20, 0x16u);
    }

    [v9 setChinaShiftedLocation:v17];
    [v9 _invalidate];
  }
}

void sub_23C35ADE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setWaitingForChinaShiftingRequest:0];
    id v6 = NTALogForCategory(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_23C35D4E4((uint64_t)v3, v6);
    }
  }
}

id sub_23C35B800(void *a1)
{
  id v1 = a1;
  uint64_t v7 = 0;
  os_log_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  os_log_t v2 = (void (*)(id))off_268BA3D18;
  CLLocationCoordinate2D v10 = off_268BA3D18;
  if (!off_268BA3D18)
  {
    id v3 = (void *)sub_23C354468();
    v8[3] = (uint64_t)dlsym(v3, "NTKRoundDateDownToNearestMinute");
    off_268BA3D18 = (_UNKNOWN *)v8[3];
    os_log_t v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  uint64_t v4 = v2(v1);

  return v4;
}

void *sub_23C35BC1C(uint64_t a1)
{
  os_log_t v2 = (void *)sub_23C354468();
  Class result = dlsym(v2, "NTKComplicationFamilyUtilitarianLargeNarrow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_268BA3CF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_23C35BC6C()
{
  uint64_t result = _sl_dlopen();
  qword_268BA3CF8 = result;
  return result;
}

void *sub_23C35BCE0(uint64_t a1)
{
  os_log_t v2 = (void *)sub_23C354468();
  uint64_t result = dlsym(v2, "NTKShowBlueRidgeUI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268BA3D00 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_23C35BD30(uint64_t a1)
{
  sub_23C354468();
  Class result = objc_getClass("NTKLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_268BA3D08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_23C35D55C();
    return (Class)sub_23C35BD88(v3);
  }
  return result;
}

void *sub_23C35BD88(uint64_t a1)
{
  os_log_t v2 = (void *)sub_23C354468();
  Class result = dlsym(v2, "NTKIdealizedDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268BA3D10 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_23C35BDD8(uint64_t a1)
{
  os_log_t v2 = (void *)sub_23C354468();
  Class result = dlsym(v2, "NTKRoundDateDownToNearestMinute");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_268BA3D18 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_23C35C334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_23C35C34C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_23C35C35C(uint64_t a1)
{
}

void sub_23C35C364(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  os_log_t v8 = *(void **)(a1 + 32);
  id v11 = v7;
  uint64_t v9 = [v7 entryDate];
  uint64_t v10 = [v8 compare:v9];

  if (v10 != -1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

__CFString *_NWCComplicationLocalizedStringsTableForType(uint64_t a1)
{
  id v1 = @"Complication";
  if (a1 == 1) {
    id v1 = @"WorldClockComplication";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"SunriseComplication";
  }
}

id _NWCComplicationPreGloryVersionedImageNames()
{
  if (qword_268BA3D28 != -1) {
    dispatch_once(&qword_268BA3D28, &unk_26EFF5978);
  }
  os_log_t v0 = (void *)qword_268BA3D20;

  return v0;
}

uint64_t sub_23C35CF40()
{
  qword_268BA3D20 = [MEMORY[0x263EFFA08] setWithArray:&unk_26EFF7150];

  return MEMORY[0x270F9A758]();
}

id _NWCPreGloryComplicationImageName(void *a1)
{
  id v1 = a1;
  os_log_t v2 = _NWCComplicationPreGloryVersionedImageNames();
  int v3 = [v2 containsObject:v1];

  if (v3)
  {
    uint64_t v4 = [v1 stringByAppendingString:@"-pre5_0"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id NWCComplicationBundle()
{
  if (qword_268BA3D38 != -1) {
    dispatch_once(&qword_268BA3D38, &unk_26EFF5998);
  }
  os_log_t v0 = (void *)qword_268BA3D30;

  return v0;
}

uint64_t sub_23C35D060()
{
  qword_268BA3D30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id NWCPreGloryComplicationImageNamed(void *a1)
{
  id v1 = _NWCPreGloryComplicationImageName(a1);
  os_log_t v2 = (void *)MEMORY[0x263F1C6B0];
  int v3 = NWCComplicationBundle();
  uint64_t v4 = [MEMORY[0x263F1C920] mainScreen];
  id v5 = [v4 traitCollection];
  id v6 = [v2 imageNamed:v1 inBundle:v3 compatibleWithTraitCollection:v5];

  return v6;
}

id NWCComplicationLocalizedString(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  id v5 = @"Complication";
  if (a3 == 1) {
    id v5 = @"WorldClockComplication";
  }
  if (!a3) {
    id v5 = @"SunriseComplication";
  }
  id v6 = v5;
  id v7 = NWCComplicationBundle();
  os_log_t v8 = [v7 localizedStringForKey:v4 value:&stru_26EFF5FF8 table:v6];

  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v4;
  }
  id v10 = v9;

  return v10;
}

id NWCComplicationPrimaryColor(uint64_t a1)
{
  if (a1 == 1) {
    [MEMORY[0x263F1C550] systemOrangeColor];
  }
  else {
  id v1 = [MEMORY[0x263F1C550] whiteColor];
  }

  return v1;
}

uint64_t NWCShouldChinaShiftCoordinates(void *a1)
{
  id v1 = a1;
  [v1 coordinate];
  double v3 = v2;
  [v1 coordinate];
  unsigned int v4 = [MEMORY[0x263F417D8] isLocationShiftRequiredForCoordinate:v3];
  int v5 = [v1 referenceFrame];

  if (v5 == 2) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_23C35D2E0()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_23C35D304(v0);
}

void sub_23C35D304(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C352000, a2, OS_LOG_TYPE_ERROR, "Unable to produce complication template for (unhandled) complication family: %ld.", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_23C35D37C()
{
  uint64_t v0 = abort_report_np();
  return sub_23C35D3A4(v0);
}

void sub_23C35D3A4(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl(&dword_23C352000, a2, OS_LOG_TYPE_DEBUG, "Attempt to set nil block on %@ ", (uint8_t *)&v5, 0xCu);
}

void sub_23C35D440()
{
}

void sub_23C35D46C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C352000, a2, OS_LOG_TYPE_ERROR, "Reverse geocode received an error. Schedule retry. Error? %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_23C35D4E4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23C352000, a2, OS_LOG_TYPE_ERROR, "Failed to China shift location. Error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_23C35D55C()
{
  uint64_t v0 = abort_report_np();
  return sub_23C35D584(v0);
}

void sub_23C35D584(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = objc_opt_class();
  id v7 = v6;
  os_log_t v8 = [a1 cachedEntryModels];
  int v9 = 138543874;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 2112;
  double v14 = v8;
  _os_log_error_impl(&dword_23C352000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] entryModelForDate is nil for date: %@. Models: %@", (uint8_t *)&v9, 0x20u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x270F061E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}