void sub_476C(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t vars8;

  v13 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v13 scaledValue:24.0];
  v3 = v2;
  v4 = +[CLKDevice currentDevice];
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  v6 = v3 * v5;

  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:v6];
  v8 = +[UIImage systemImageNamed:@"globe"];
  v9 = [v8 imageWithConfiguration:v7];

  v10 = +[CLKFullColorImageProvider providerWithFullColorImage:v9 monochromeFilterType:1 applyScalingAndCircularMasking:0];
  v11 = (void *)qword_18020;
  qword_18020 = v10;

  v12 = +[UIColor systemOrangeColor];
  [(id)qword_18020 setTintColor:v12];
}

void sub_489C()
{
  id v3 = +[UIImage systemImageNamed:@"globe"];
  uint64_t v0 = +[CLKFullColorImageProvider providerWithFullColorImage:v3 monochromeFilterType:1 applyScalingAndCircularMasking:0];
  v1 = (void *)qword_18040;
  qword_18040 = v0;

  v2 = +[UIColor systemOrangeColor];
  [(id)qword_18040 setTintColor:v2];
}

void sub_5C34(id a1)
{
  uint64_t v1 = +[UIColor colorWithWhite:0.937254902 alpha:1.0];
  v2 = (void *)qword_18060;
  qword_18060 = v1;

  qword_18068 = +[UIColor colorWithWhite:0.100000001 alpha:1.0];

  _objc_release_x1();
}

void sub_6438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

id sub_6470(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained overrideDate];
  if (v2) {
    [WeakRetained overrideDate];
  }
  else {
  id v3 = +[CLKDate complicationDate];
  }

  return v3;
}

void sub_69F8(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_180B8);
  id WeakRetained = objc_loadWeakRetained(&qword_180C0);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_180C0);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_180C8;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_180C0, obj);
  qword_180C8 = (uint64_t)[obj version];

  sub_76E4(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_180B8);
  long long v10 = *(_OWORD *)&qword_18088;
  *a2 = xmmword_18078;
  a2[1] = v10;
  long long v11 = *(_OWORD *)&qword_180A8;
  a2[2] = xmmword_18098;
  a2[3] = v11;
}

void sub_6DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6E04(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDayTimeColoring];
}

void sub_6E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_6E7C(id a1)
{
  return (NSString *)@"World Clock Rich Circular Complication";
}

void sub_76E4(uint64_t a1, uint64_t a2)
{
  id v10 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v10 scaledValue:12.0];
  *(void *)&xmmword_18078 = v2;
  [v10 scaledValue:3 withOverride:20.5 forSizeClass:23.0];
  *((void *)&xmmword_18078 + 1) = v3;
  [v10 scaledValue:10.5];
  qword_18088 = v4;
  [v10 scaledValue:3 withOverride:31.5 forSizeClass:35.5];
  qword_18090 = v5;
  [v10 scaledValue:3 withOverride:8.0 forSizeClass:8.5];
  *(void *)&xmmword_18098 = v6;
  [v10 scaledValue:6.5];
  *((void *)&xmmword_18098 + 1) = v7;
  [v10 scaledValue:3 withOverride:2.0 forSizeClass:2.5];
  qword_180A8 = v8;
  [v10 scaledValue:2.5];
  qword_180B0 = v9;
}

float64x2_t sub_77E8(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_69F8(v2, v6);
  xmmword_180D0 = v6[0];
  xmmword_180E0 = (float64x2_t)v6[1];
  xmmword_180F0 = v6[2];
  xmmword_18100 = (float64x2_t)v6[3];
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v5 = v3;

  xmmword_180D0 = (__int128)vmulq_n_f64((float64x2_t)xmmword_180D0, v5);
  xmmword_180E0 = vmulq_n_f64(xmmword_180E0, v5);
  float64x2_t result = vmulq_n_f64((float64x2_t)xmmword_180F0, v5);
  xmmword_180F0 = (__int128)result;
  xmmword_18100 = vmulq_n_f64(xmmword_18100, v5);
  return result;
}

id sub_8888(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc((Class)NTKRichComplicationDialView), "initWithTickCount:tickSize:dialRange:startAngle:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v5 = [v4 largeTickLayer];
  id v6 = v3;
  id v7 = [v6 CGColor];

  [v5 setBackgroundColor:v7];

  return v4;
}

void sub_8A80(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = [v5 isHidden];
  int v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 != v3) {
    [v5 setHidden:v4 != 0];
  }
}

double sub_8D20(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_18148);
  id WeakRetained = objc_loadWeakRetained(&qword_18150);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unsigned int v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_18150);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_18150, v1);
    qword_18158 = (uint64_t)[v1 version];

    sub_954C(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_18158;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18148);
  double v9 = *(double *)&qword_18128;

  return v9;
}

void sub_8F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8F60(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProgress];
}

void sub_8FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_8FD8(id a1)
{
  return (NSString *)@"World Clock Rich Circular Complication";
}

id sub_9218(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  [*(id *)(a1 + 32) setProgress:a2];
  unsigned int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 setOverrideDate:v4];
}

void sub_954C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [objc_alloc((Class)CLKDeviceMetrics) initWithDevice:v2 identitySizeClass:2];

  [v6 scaledValue:3.0];
  qword_18128 = 0x3FF0000000000000;
  qword_18130 = v3;
  [v6 scaledValue:3 withOverride:80.0 forSizeClass:90.0];
  qword_18138 = v4;
  [v6 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
  qword_18140 = v5;
}

double sub_9610(uint64_t a1, void *a2)
{
  id v2 = a2;
  qword_18160 = sub_8D20(v2);
  qword_18168 = v3;
  qword_18170 = v4;
  qword_18178 = v5;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v7 = v6;

  *(double *)&qword_18160 = v7 * *(double *)&qword_18160;
  *(double *)&qword_18168 = v7 * *(double *)&qword_18168;
  *(double *)&qword_18170 = v7 * *(double *)&qword_18170;
  double result = v7 * *(double *)&qword_18178;
  *(double *)&qword_18178 = v7 * *(double *)&qword_18178;
  return result;
}

id sub_9FF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(objc_alloc((Class)NTKRichComplicationDialView), "initWithTickCount:tickSize:dialRange:startAngle:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v5 = [v4 largeTickLayer];
  id v6 = v3;
  id v7 = [v6 CGColor];

  [v5 setBackgroundColor:v7];

  return v4;
}

void sub_A200(uint64_t a1, void *a2)
{
  id v5 = a2;
  unsigned int v3 = [v5 isHidden];
  int v4 = *(unsigned __int8 *)(a1 + 32);
  if (v4 != v3) {
    [v5 setHidden:v4 != 0];
  }
}

double sub_A678(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_181B8);
  id WeakRetained = objc_loadWeakRetained(&qword_181C0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unsigned int v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_181C0);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_181C0, v1);
    qword_181C8 = (uint64_t)[v1 version];

    sub_AED8(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_181C8;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_181B8);
  double v9 = *(double *)&qword_18198;

  return v9;
}

void sub_A890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A8B8(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProgress];
}

void sub_A91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_A930(id a1)
{
  return (NSString *)@"World Clock Rich Circular Complication";
}

id sub_ABA4(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  [*(id *)(a1 + 32) setProgress:a2];
  unsigned int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 setText:v4];
}

void sub_AED8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v7 = [objc_alloc((Class)CLKDeviceMetrics) initWithDevice:v2 identitySizeClass:2];

  objc_msgSend(v7, "scaledSize:", 1.0, 4.0);
  qword_18198 = v3;
  qword_181A0 = v4;
  [v7 scaledValue:3 withOverride:40.0 forSizeClass:45.0];
  qword_181A8 = v5;
  [v7 scaledValue:20.0];
  qword_181B0 = v6;
}

double sub_AF94(uint64_t a1, void *a2)
{
  id v2 = a2;
  qword_181D0 = sub_A678(v2);
  qword_181D8 = v3;
  qword_181E0 = v4;
  qword_181E8 = v5;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  double v7 = v6;

  *(double *)&qword_181D0 = v7 * *(double *)&qword_181D0;
  *(double *)&qword_181D8 = v7 * *(double *)&qword_181D8;
  *(double *)&qword_181E0 = v7 * *(double *)&qword_181E0;
  double result = v7 * *(double *)&qword_181E8;
  *(double *)&qword_181E8 = v7 * *(double *)&qword_181E8;
  return result;
}

void sub_B034(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = objc_opt_class();
  id v6 = v5;
  double v7 = [a2 allKeys];
  uint64_t v8 = [v7 componentsJoinedByString:@", "];
  int v9 = 138543618;
  id v10 = v5;
  __int16 v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{public}@ No ALCity provided in the provided metadata ([%{public}@]).", (uint8_t *)&v9, 0x16u);
}

void sub_B11C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unhandled sunrise/sunset case (logic error)", v1, 2u);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return _CLKComplicationGraphicExtraLargeCircularScalingFactor();
}

uint64_t CLKForcedTime()
{
  return _CLKForcedTime();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
}

uint64_t NTKWorldClockCityAbbreviation()
{
  return _NTKWorldClockCityAbbreviation();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_msgSend_CLKFontWithAlternativePunctuation(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithAlternativePunctuation];
}

id objc_msgSend_CLKFontWithMonospacedNumbers(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithMonospacedNumbers];
}

id objc_msgSend__city(void *a1, const char *a2, ...)
{
  return [a1 _city];
}

id objc_msgSend__cityLabelColor(void *a1, const char *a2, ...)
{
  return [a1 _cityLabelColor];
}

id objc_msgSend__complicationBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _complicationBackgroundColor];
}

id objc_msgSend__filterStyle(void *a1, const char *a2, ...)
{
  return [a1 _filterStyle];
}

id objc_msgSend__timeTextColor(void *a1, const char *a2, ...)
{
  return [a1 _timeTextColor];
}

id objc_msgSend__updateColors(void *a1, const char *a2, ...)
{
  return [a1 _updateColors];
}

id objc_msgSend__updateDayTimeColoring(void *a1, const char *a2, ...)
{
  return [a1 _updateDayTimeColoring];
}

id objc_msgSend__updateProgress(void *a1, const char *a2, ...)
{
  return [a1 _updateProgress];
}

id objc_msgSend_alCity(void *a1, const char *a2, ...)
{
  return [a1 alCity];
}

id objc_msgSend_alCityId(void *a1, const char *a2, ...)
{
  return [a1 alCityId];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_checkIfCitiesModified(void *a1, const char *a2, ...)
{
  return [a1 checkIfCitiesModified];
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return [a1 cities];
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return [a1 city];
}

id objc_msgSend_cityLabel(void *a1, const char *a2, ...)
{
  return [a1 cityLabel];
}

id objc_msgSend_clockTimerToken(void *a1, const char *a2, ...)
{
  return [a1 clockTimerToken];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_complicationDate(void *a1, const char *a2, ...)
{
  return [a1 complicationDate];
}

id objc_msgSend_complicationDescriptor(void *a1, const char *a2, ...)
{
  return [a1 complicationDescriptor];
}

id objc_msgSend_constantSun(void *a1, const char *a2, ...)
{
  return [a1 constantSun];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_filledSecondsDialView(void *a1, const char *a2, ...)
{
  return [a1 filledSecondsDialView];
}

id objc_msgSend_filterProvider(void *a1, const char *a2, ...)
{
  return [a1 filterProvider];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isSunUp(void *a1, const char *a2, ...)
{
  return [a1 isSunUp];
}

id objc_msgSend_largeTickLayer(void *a1, const char *a2, ...)
{
  return [a1 largeTickLayer];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutConstants(void *a1, const char *a2, ...)
{
  return [a1 layoutConstants];
}

id objc_msgSend_loadCities(void *a1, const char *a2, ...)
{
  return [a1 loadCities];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_moonImageView(void *a1, const char *a2, ...)
{
  return [a1 moonImageView];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_overrideDate(void *a1, const char *a2, ...)
{
  return [a1 overrideDate];
}

id objc_msgSend_pauseLiveFullColorImageView(void *a1, const char *a2, ...)
{
  return [a1 pauseLiveFullColorImageView];
}

id objc_msgSend_pegRadius(void *a1, const char *a2, ...)
{
  return [a1 pegRadius];
}

id objc_msgSend_pegStrokeWidth(void *a1, const char *a2, ...)
{
  return [a1 pegStrokeWidth];
}

id objc_msgSend_resumeLiveFullColorImageView(void *a1, const char *a2, ...)
{
  return [a1 resumeLiveFullColorImageView];
}

id objc_msgSend_rise(void *a1, const char *a2, ...)
{
  return [a1 rise];
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

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_sunImageView(void *a1, const char *a2, ...)
{
  return [a1 sunImageView];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_systemTealColor(void *a1, const char *a2, ...)
{
  return [a1 systemTealColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return [a1 timeFormatter];
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return [a1 timeLabel];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_tintedFraction(void *a1, const char *a2, ...)
{
  return [a1 tintedFraction];
}

id objc_msgSend_tintedPlatterColor(void *a1, const char *a2, ...)
{
  return [a1 tintedPlatterColor];
}

id objc_msgSend_unfilledSecondsDialView(void *a1, const char *a2, ...)
{
  return [a1 unfilledSecondsDialView];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_worldClockCircularView(void *a1, const char *a2, ...)
{
  return [a1 worldClockCircularView];
}