double bubbleDiameter(double a1)
{
  return round(a1 * 71.0 / 320.0);
}

double currentHeadingLength(double a1)
{
  return round(a1 * 49.5 / 320.0);
}

double compassTicLength(double a1)
{
  return round(a1 * 15.0 / 320.0);
}

double bearingLength(double a1)
{
  return round(a1 * 30.0 / 320.0);
}

double smallCrosshairWidth(double a1)
{
  return round(a1 * 17.0 / 320.0);
}

double crosshairWidth(double a1)
{
  return round(a1 * 120.0 / 320.0);
}

void CGPointRoundToPixel()
{
  if (qword_2688969B0 != -1) {
    dispatch_once(&qword_2688969B0, &unk_26E9ACF78);
  }
}

double normalizedRotation(double a1, double a2)
{
  if (a2 <= 3.14159265)
  {
    if (a2 < -3.14159265) {
      a2 = a2 + 6.28318531;
    }
  }
  else
  {
    a2 = -(6.28318531 - a2);
  }
  double v2 = a2 - a1;
  if (a2 - a1 > 3.14159265) {
    return a1 - (6.28318531 - v2);
  }
  if (v2 < -3.14159265) {
    return v2 + 6.28318531 + a1;
  }
  return a2;
}

void distanceBetweenAngles(double a1, double a2)
{
}

double RoundHeading(double a1)
{
  return fmod(round(a1), 360.0);
}

void sub_236734F04()
{
  id v1 = [MEMORY[0x263F1C920] mainScreen];
  [v1 scale];
  qword_268896948 = v0;
}

double lerp(double a1, double a2, double a3)
{
  return a1 + a3 * (a2 - a1);
}

double ConvertDecimalDegreesToDMS(uint64_t *a1, void *a2, double *a3, double a4)
{
  if (a1)
  {
    uint64_t v4 = (uint64_t)a4;
    if ((uint64_t)a4 < 0) {
      uint64_t v4 = -v4;
    }
    *a1 = v4;
  }
  double result = fabs((a4 - (double)(uint64_t)a4) * 60.0);
  if (a2) {
    *a2 = (uint64_t)result;
  }
  if (a3)
  {
    double result = (result - (double)(uint64_t)result) * 60.0;
    *a3 = result;
  }
  return result;
}

void ConvertDegreeSignToString(void *a1, int a2, double a3)
{
  if (a1)
  {
    uint64_t v5 = (uint64_t)(a3 * 3600.0);
    v6 = [MEMORY[0x263F086E0] mainBundle];
    v7 = v6;
    if (a2)
    {
      if (v5 < 0)
      {
        v8 = @"cW";
        v9 = @"W";
      }
      else
      {
        v8 = @"cE";
        v9 = @"E";
      }
    }
    else if (v5 < 0)
    {
      v8 = @"cS";
      v9 = @"S";
    }
    else
    {
      v8 = @"cN";
      v9 = @"N";
    }
    v10 = [v6 localizedStringForKey:v8 value:v9 table:0];

    id v11 = v10;
    *a1 = v11;
  }
}

id CreateCoordinateComponentString(int a1, double a2, double a3)
{
  if (a1) {
    a2 = a3;
  }
  double v3 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  uint64_t v4 = (uint64_t)v3;
  double v5 = (v3 - (double)(uint64_t)v3) * 60.0;
  if ((uint64_t)a2 >= 0) {
    uint64_t v6 = (uint64_t)a2;
  }
  else {
    uint64_t v6 = -(uint64_t)a2;
  }
  id v21 = 0;
  ConvertDegreeSignToString(&v21, a1, a2);
  id v7 = v21;
  v8 = (void *)MEMORY[0x263F08A30];
  v9 = [NSNumber numberWithInteger:v6];
  v10 = [v8 localizedStringFromNumber:v9 numberStyle:0];

  id v11 = (void *)MEMORY[0x263F08A30];
  v12 = [NSNumber numberWithInteger:v4];
  v13 = [v11 localizedStringFromNumber:v12 numberStyle:0];

  v14 = (void *)MEMORY[0x263F08A30];
  v15 = [NSNumber numberWithDouble:v5];
  v16 = [v14 localizedStringFromNumber:v15 numberStyle:0];

  id v17 = [NSString alloc];
  v18 = WebLocalizedString();
  v19 = objc_msgSend(v17, "initWithFormat:", v18, v10, v13, v16, v7, 0);

  return v19;
}

uint64_t StringWithLocationDirection()
{
  uint64_t v0 = (void *)qword_2688969B8;
  if (!qword_2688969B8)
  {
    id v1 = objc_alloc(MEMORY[0x263EFF8C0]);
    double v2 = WebLocalizedString();
    double v3 = WebLocalizedString();
    uint64_t v4 = WebLocalizedString();
    double v5 = WebLocalizedString();
    uint64_t v6 = WebLocalizedString();
    id v7 = WebLocalizedString();
    v8 = WebLocalizedString();
    v9 = WebLocalizedString();
    uint64_t v10 = objc_msgSend(v1, "initWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, 0);
    id v11 = (void *)qword_2688969B8;
    qword_2688969B8 = v10;

    uint64_t v0 = (void *)qword_2688969B8;
  }
  [v0 count];
  uint64_t v12 = qword_2688969B8;

  return MEMORY[0x270F9A6D0](v12, sel_objectAtIndex_);
}

id sharedHeadingFormatter()
{
  uint64_t v0 = [MEMORY[0x263F08B88] currentThread];
  id v1 = [v0 threadDictionary];
  id v2 = [v1 objectForKey:@"CompassHeadingFormatterKey"];

  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v2 setNumberStyle:0];
    double v3 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
    [v2 setLocale:v3];

    [v2 setNegativePrefix:@"−"];
    uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
    double v5 = [v4 threadDictionary];
    [v5 setObject:v2 forKey:@"CompassHeadingFormatterKey"];
  }

  return v2;
}

id compassThinFont70G2()
{
  v18[1] = *MEMORY[0x263EF8340];
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, 70.0, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  id v2 = [CopyOfSystemUIFontWithGrade fontDescriptor];
  CFRelease(UIFontForLanguage);
  CFRelease(CopyOfSystemUIFontWithGrade);
  uint64_t v17 = *MEMORY[0x263F1D1E8];
  uint64_t v4 = *MEMORY[0x263F1D218];
  v14[0] = *MEMORY[0x263F1D220];
  uint64_t v3 = v14[0];
  v14[1] = v4;
  v15[0] = &unk_26E9ADEC0;
  v15[1] = &unk_26E9ADED8;
  double v5 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16[0] = v5;
  v12[0] = v3;
  v12[1] = v4;
  v13[0] = &unk_26E9ADEF0;
  v13[1] = &unk_26E9ADED8;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v16[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v18[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v9 = [v2 fontDescriptorByAddingAttributes:v8];

  uint64_t v10 = [MEMORY[0x263F1C658] fontWithDescriptor:v9 size:70.0];

  return v10;
}

id compassMediumFont20()
{
  uint64_t v0 = *MEMORY[0x263F1D308];
  id v1 = (void *)MEMORY[0x263F1C658];
  id v2 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D308]];
  [v2 pointSize];
  uint64_t v3 = objc_msgSend(v1, "systemFontOfSize:weight:");

  uint64_t v4 = [v3 _fontScaledLikeTextStyle:v0 maximumPointSize:0 compatibleWithTraitCollection:0 forIB:26.0];

  return v4;
}

double sub_2367357B4(void *a1)
{
  objc_msgSend(a1, "_scaledValueForValue:");
  return ceil(v1);
}

id sub_2367357D0(void *a1)
{
  id v2 = [a1 layer];
  uint64_t v3 = [v2 presentationLayer];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [a1 layer];
  }
  double v5 = v4;

  return v5;
}

uint64_t sub_236735848()
{
  return 0;
}

double sub_236735850(double a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5, double *a6)
{
  if (a4)
  {
    uint64_t v6 = (uint64_t)a1;
    if ((uint64_t)a1 < 0) {
      uint64_t v6 = -v6;
    }
    *a4 = v6;
  }
  double result = fabs((a1 - (double)(uint64_t)a1) * 60.0);
  if (a5) {
    *a5 = (uint64_t)result;
  }
  if (a6)
  {
    double result = (result - (double)(uint64_t)result) * 60.0;
    *a6 = result;
  }
  return result;
}

uint64_t sub_236735A08(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_invalidate);
}

double compassRadius(double a1)
{
  return round(a1 * 100.0 / 320.0);
}

double cardinalLabelRadius(double a1)
{
  return round(a1 * 77.0 / 320.0);
}

double northTriangleRadius(double a1)
{
  return round(a1 * 118.0 / 320.0);
}

double degreeLabelRadius(double a1)
{
  return round(a1 * 133.0 / 320.0);
}

double bearingLabelRadius(double a1)
{
  return round(a1 * 140.0 / 320.0);
}

double bearingInnerRadius(double a1)
{
  return round(a1 * 63.0 / 320.0);
}

double bearingOuterRadius(double a1)
{
  return round(a1 * 92.0 / 320.0);
}

void sub_236736B58()
{
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v0 objectForKey:@"CalibrationMultiplier"];

  double v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v1 = v3;
  }
  else
  {
    uint64_t v2 = 0;
  }
  qword_2688969C0 = v2;
}

void sub_2367383E0(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = fmod(*(double *)(a1 + 40) + *(double *)(a1 + 48), 360.0);
    [WeakRetained showTicAtAngle:v2 withCredit:1.0];
    [WeakRetained[128] setAngle:v2 * 3.14159265 / 180.0];
  }
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

void CFRelease(CFTypeRef cf)
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

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x270EE9AB0]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x270EE9AD8](*(void *)&uiType, language, size);
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x270F96008]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t WebLocalizedString()
{
  return MEMORY[0x270F072F8]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}