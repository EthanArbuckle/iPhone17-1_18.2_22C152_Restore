void sub_20A8(void *a1@<X0>, uint64_t a2@<X8>)
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
  long long v12;
  id obj;
  uint64_t vars8;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16948);
  WeakRetained = objc_loadWeakRetained(&qword_16950);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&qword_16950);
    if (v5 == obj)
    {
      v6 = [obj version];
      v7 = qword_16958;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v8 = objc_storeWeak(&qword_16950, obj);
  qword_16958 = (uint64_t)[obj version];

  sub_2EA4(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16948);
  v10 = *(_OWORD *)&qword_16930;
  *(_OWORD *)(a2 + 64) = xmmword_16920;
  *(_OWORD *)(a2 + 80) = v10;
  *(void *)(a2 + 96) = qword_16940;
  v11 = *(_OWORD *)&qword_168F0;
  *(_OWORD *)a2 = xmmword_168E0;
  *(_OWORD *)(a2 + 16) = v11;
  v12 = *(_OWORD *)&qword_16910;
  *(_OWORD *)(a2 + 32) = xmmword_16900;
  *(_OWORD *)(a2 + 48) = v12;
}

id sub_2B88(uint64_t a1, void *a2)
{
  return [a2 setHidden:*(unsigned __int8 *)(a1 + 32)];
}

void sub_2EA4(uint64_t a1, void *a2)
{
  id v2 = a2;
  int IsTallScript = NTKLanguageIsTallScript();
  id v16 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];

  if (IsTallScript)
  {
    [v16 scaledValue:3 withOverride:12.0 forSizeClass:13.5];
    uint64_t v5 = v4;
    double v6 = 8.5;
  }
  else
  {
    [v16 scaledValue:3 withOverride:13.0 forSizeClass:14.5];
    uint64_t v5 = v7;
    double v6 = 9.5;
  }
  *((void *)&xmmword_168E0 + 1) = v5;
  [v16 scaledValue:v6];
  qword_168F0 = v8;
  [v16 scaledValue:11.0];
  *(void *)&xmmword_168E0 = v9;
  [v16 scaledValue:6.0];
  *(void *)&xmmword_16900 = v10;
  [v16 scaledValue:4.5];
  uint64_t v12 = v11;
  [v16 scaledValue:3.5];
  *((void *)&xmmword_16920 + 1) = v12;
  qword_16930 = 0;
  qword_16938 = v13;
  qword_16940 = 0;
  qword_16910 = 0xC000000000000000;
  [v16 scaledValue:50.0];
  qword_16918 = v14;
  [v16 scaledValue:3 withOverride:159.0 forSizeClass:183.0];
  *(void *)&xmmword_16920 = v15;
}

void sub_343C(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16A00);
  id WeakRetained = objc_loadWeakRetained(&qword_16A08);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16A08);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16A10;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16A08, obj);
  qword_16A10 = (uint64_t)[obj version];

  sub_5208(v9, (uint64_t)obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16A00);
  long long v10 = *(_OWORD *)&qword_169D0;
  a2[6] = xmmword_169C0;
  a2[7] = v10;
  long long v11 = *(_OWORD *)&qword_169F0;
  a2[8] = xmmword_169E0;
  a2[9] = v11;
  long long v12 = *(_OWORD *)&qword_16990;
  a2[2] = xmmword_16980;
  a2[3] = v12;
  long long v13 = *(_OWORD *)&qword_169B0;
  a2[4] = xmmword_169A0;
  a2[5] = v13;
  long long v14 = *(_OWORD *)&qword_16970;
  *a2 = xmmword_16960;
  a2[1] = v14;
}

void sub_3BD0(uint64_t a1, void *a2)
{
  id obj = [a2 yValue];
  if ([obj compare:*(void *)(*(void *)(a1 + 32) + 24)] == (char *)&dword_0 + 1) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), obj);
  }
}

void sub_3D64(uint64_t a1, void *a2)
{
  id obj = [a2 yValue];
  if ([obj compare:*(void *)(*(void *)(a1 + 32) + 40)] == (char *)&dword_0 + 1) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), obj);
  }
}

void sub_4900(void *a1, void *a2, unint64_t a3)
{
  uint64_t v5 = 19;
  if (!(a3 % (a1[17] + 1))) {
    uint64_t v5 = 25;
  }
  CGFloat v6 = *(double *)&a1[v5];
  uint64_t v7 = 27;
  if (!(a3 % (a1[17] + 1))) {
    uint64_t v7 = 26;
  }
  double v8 = *(double *)&a1[v7];
  [a2 floatValue];
  double v10 = v9;
  v14.origin.y = 0.0;
  v14.origin.x = v9;
  v14.size.width = v8;
  v14.size.height = v6;
  UIRectFill(v14);
  if (a1[16] - 1 > a3)
  {
    long long v11 = (void *)a1[4];
    uint64_t v12 = a1[28];
    [v11 _drawChartsBarsInContext:v12 lineNumber:a3 xPosition:v8 + v10];
  }
}

void sub_5208(uint64_t a1, uint64_t a2)
{
  id v19 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  *((void *)&xmmword_16960 + 1) = 0x3FF0000000000000;
  qword_16990 = 0x4004000000000000;
  [v19 constantValue:3 withOverride:0.5 forSizeClass:1.0];
  *(void *)&xmmword_16960 = v2;
  *((void *)&xmmword_169C0 + 1) = 0x3FE8000000000000;
  *(_OWORD *)algn_169B8 = xmmword_C880;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)algn_169D8 = _Q0;
  qword_169F0 = 0x3FF8000000000000;
  [v19 scaledValue:41.0];
  qword_169D0 = v8;
  [v19 scaledValue:17.5];
  qword_16970 = v9;
  [v19 scaledValue:3 withOverride:16.0 forSizeClass:18.5];
  *(void *)&xmmword_169A0 = v10;
  [v19 scaledValue:17.0];
  qword_16978 = v11;
  [v19 scaledValue:3 withOverride:15.5 forSizeClass:18.0];
  *((void *)&xmmword_169A0 + 1) = v12;
  [v19 scaledValue:3 withOverride:5.0 forSizeClass:6.0];
  *(void *)&xmmword_16980 = v13;
  [v19 scaledValue:2.0];
  *((void *)&xmmword_16980 + 1) = v14;
  [v19 scaledValue:2.0];
  qword_16998 = v15;
  [v19 scaledValue:3 withOverride:4.0 forSizeClass:5.0];
  qword_169B0 = v16;
  [v19 scaledValue:3 withOverride:9.5 forSizeClass:10.5];
  *((void *)&xmmword_169E0 + 1) = v17;
  [v19 scaledValue:3 withOverride:6.0 forSizeClass:7.0];
  qword_169F8 = v18;
}

id NLActivityComplicationLocalizedString(void *a1)
{
  uint64_t v1 = qword_16A20;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_16A20, &stru_105D0);
  }
  v3 = [(id)qword_16A18 localizedStringForKey:v2 value:&stru_108F0 table:@"Localizable"];

  return v3;
}

void sub_542C(id a1)
{
  qword_16A18 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_5CC8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v13 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:2];
  [v13 scaledValue:3 withOverride:4.0 forSizeClass:4.5];
  *(void *)&xmmword_16A30 = v3;
  [v13 scaledValue:3 withOverride:2.0 forSizeClass:2.5];
  *((void *)&xmmword_16A30 + 1) = v4;
  [v13 scaledValue:3 withOverride:1.5 forSizeClass:2.0];
  qword_16A48 = v5;
  NTKWhistlerSubdialComplicationContentDiameter();
  qword_16A40 = v6;
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  *(_OWORD *)&qword_16A60 = *(_OWORD *)&qword_16A40;
  xmmword_16A50 = (__int128)vmulq_n_f64((float64x2_t)xmmword_16A30, v7);
  *(double *)&qword_16A68 = v7 * *(double *)&qword_16A48;
  NTKGraphicExtraLargeComplicationContentDiameter();
  qword_16A60 = v8;
  uint64_t v9 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:3];

  qword_16A70 = 0x4000000000000000;
  [v9 scaledValue:2 withOverride:1.0 forSizeClass:0.5];
  qword_16A78 = v10;
  [v9 scaledValue:2 withOverride:1.0 forSizeClass:0.5];
  qword_16A88 = v11;
  [v9 scaledValue:22.0];
  qword_16A80 = v12;
}

void sub_636C(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_timelineEntryFromModel:family:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "family"));
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = v2;
  uint64_t v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [v3 appendEntries:v4];
}

void sub_6D18(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Calling datasource handler for current timeline entry with model: %@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_timelineEntryFromModel:family:", v3, objc_msgSend(*(id *)(a1 + 32), "family"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

NTKOverrideTextProvider *_EnDashTrackingTextProviderWithEnDashes(uint64_t a1)
{
  return +[NTKOverrideTextProvider textProviderWithText:a1 overrideBlock:&stru_10690];
}

id sub_7CAC(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  switch(a3)
  {
    case 0:
      uint64_t v9 = @"ACTIVITY_LONG_ANALOG_SEPARATOR";
      goto LABEL_5;
    case 1:
      uint64_t v9 = @"ACTIVITY_LONG_ANALOG_SEPARATOR_NARROWER";
LABEL_5:
      uint64_t v11 = NLActivityComplicationLocalizedString(v9);
      goto LABEL_7;
    case 2:
    case 3:
      uint64_t v11 = NLActivityComplicationLocalizedString(@"ACTIVITY_LONG_ANALOG_SEPARATOR_NARROWER");
LABEL_7:
      uint64_t v12 = NLActivityComplicationLocalizedString(@"ACTIVITY_LONG_ANALOG_FORMAT_%@_%@_%@_%@_%@");
      id v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, a1[4], v11, a1[5], v11, a1[6]);
      uint64_t v14 = [v13 lowercaseString];

      uint64_t v15 = [v8 font];
      CLKKernValueForDesignSpecTrackingValue();
      double v17 = v16;

      id v18 = objc_alloc((Class)NSAttributedString);
      v24[0] = NSKernAttributeName;
      id v19 = +[NSNumber numberWithDouble:v17];
      v25[0] = v19;
      v24[1] = NSFontAttributeName;
      v20 = [v8 smallCapsBaseFont];
      v21 = [v20 CLKFontWithLocalizedLowerCaseSmallCaps];
      v25[1] = v21;
      v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      id v10 = [v18 initWithString:v14 attributes:v22];

      break;
    default:
      id v10 = 0;
      break;
  }

  return v10;
}

id sub_86D8()
{
  if (qword_16AB0 != -1) {
    dispatch_once(&qword_16AB0, &stru_106B0);
  }
  v0 = (void *)qword_16AA8;

  return v0;
}

NSAttributedString *__cdecl sub_96A0(id a1, NSString *a2, unint64_t a3, CLKTextProviderStyle *a4)
{
  id v4 = 0;
  if (a2 && !a3)
  {
    int v6 = a4;
    id v7 = a2;
    id v8 = [(CLKTextProviderStyle *)v6 font];
    uint64_t v9 = [v8 CLKFontWithAlternativePunctuation];

    id v4 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v7];
    id v10 = [(NSString *)v7 length];

    uint64_t v11 = [(CLKTextProviderStyle *)v6 font];

    CLKKernValueForDesignSpecTrackingValue();
    double v13 = v12;

    uint64_t v14 = +[NSNumber numberWithDouble:v13];
    objc_msgSend(v4, "addAttribute:value:range:", NSKernAttributeName, v14, 0, v10);

    objc_msgSend(v4, "addAttribute:value:range:", NSFontAttributeName, v9, 0, v10);
  }

  return (NSAttributedString *)v4;
}

void sub_97F4(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_16AA8;
  qword_16AA8 = v1;

  id v3 = (void *)qword_16AA8;
  id v4 = +[NSLocale autoupdatingCurrentLocale];
  [v3 setLocale:v4];

  [(id)qword_16AA8 setNumberStyle:0];
  uint64_t v5 = (void *)qword_16AA8;

  [v5 setMinimumIntegerDigits:2];
}

void sub_98BC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "const LayoutConstants _LayoutConstants(CLKDevice *__strong, CLKComplicationFamily)";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unhandled complication family in %s constants: %ld", (uint8_t *)&v2, 0x16u);
}

void sub_9948(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Creating Complication Datasource", v1, 2u);
}

void sub_998C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Deallocating Complication Datasource", v1, 2u);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGGradientRelease(CGGradientRef gradient)
{
}

void CGPathAddRoundedRect(CGMutablePathRef path, const CGAffineTransform *transform, CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return _CGPathIsEmpty(path);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

uint64_t CLKComplicationGraphicExtraLargeCircularScalingFactor()
{
  return _CLKComplicationGraphicExtraLargeCircularScalingFactor();
}

uint64_t CLKKernValueForDesignSpecTrackingValue()
{
  return _CLKKernValueForDesignSpecTrackingValue();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t NSRequestConcreteImplementation()
{
  return _NSRequestConcreteImplementation();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKExerciseAdjustmentButtonBackgroundColor()
{
  return _NTKExerciseAdjustmentButtonBackgroundColor();
}

uint64_t NTKExerciseGradientDarkColor()
{
  return _NTKExerciseGradientDarkColor();
}

uint64_t NTKExerciseGradientLightColor()
{
  return _NTKExerciseGradientLightColor();
}

uint64_t NTKExerciseNonGradientTextColor()
{
  return _NTKExerciseNonGradientTextColor();
}

uint64_t NTKFractionStringBasedOnCurrentLocaleNumberSystem()
{
  return _NTKFractionStringBasedOnCurrentLocaleNumberSystem();
}

uint64_t NTKGraphicExtraLargeComplicationContentDiameter()
{
  return _NTKGraphicExtraLargeComplicationContentDiameter();
}

uint64_t NTKLanguageIsTallScript()
{
  return _NTKLanguageIsTallScript();
}

uint64_t NTKMoveAdjustmentButtonBackgroundColor()
{
  return _NTKMoveAdjustmentButtonBackgroundColor();
}

uint64_t NTKMoveGradientDarkColor()
{
  return _NTKMoveGradientDarkColor();
}

uint64_t NTKMoveGradientLightColor()
{
  return _NTKMoveGradientLightColor();
}

uint64_t NTKMoveNonGradientTextColor()
{
  return _NTKMoveNonGradientTextColor();
}

uint64_t NTKShowGossamerUI()
{
  return _NTKShowGossamerUI();
}

uint64_t NTKStandGradientDarkColor()
{
  return _NTKStandGradientDarkColor();
}

uint64_t NTKStandGradientLightColor()
{
  return _NTKStandGradientLightColor();
}

uint64_t NTKStandNonGradientTextColor()
{
  return _NTKStandNonGradientTextColor();
}

uint64_t NTKWhistlerSubdialComplicationContentDiameter()
{
  return _NTKWhistlerSubdialComplicationContentDiameter();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

void UIRectFill(CGRect rect)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_destroyWeak(id *location)
{
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

id objc_msgSend_CLKFontWithLocalizedLowerCaseSmallCaps(void *a1, const char *a2, ...)
{
  return [a1 CLKFontWithLocalizedLowerCaseSmallCaps];
}

id objc_msgSend__createHourFormatter(void *a1, const char *a2, ...)
{
  return [a1 _createHourFormatter];
}

id objc_msgSend__largeModularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _largeModularTemplate];
}

id objc_msgSend__largeUtilityTemplate(void *a1, const char *a2, ...)
{
  return [a1 _largeUtilityTemplate];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return [a1 _registerForNotifications];
}

id objc_msgSend__ringsShouldAdoptAccentColor(void *a1, const char *a2, ...)
{
  return [a1 _ringsShouldAdoptAccentColor];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__showEmptyViews(void *a1, const char *a2, ...)
{
  return [a1 _showEmptyViews];
}

id objc_msgSend__signatureBezelTemplate(void *a1, const char *a2, ...)
{
  return [a1 _signatureBezelTemplate];
}

id objc_msgSend__signatureCircularTemplate(void *a1, const char *a2, ...)
{
  return [a1 _signatureCircularTemplate];
}

id objc_msgSend__signatureCornerTemplate(void *a1, const char *a2, ...)
{
  return [a1 _signatureCornerTemplate];
}

id objc_msgSend__signatureExtraLargeTemplate(void *a1, const char *a2, ...)
{
  return [a1 _signatureExtraLargeTemplate];
}

id objc_msgSend__signatureRectangleTemplate(void *a1, const char *a2, ...)
{
  return [a1 _signatureRectangleTemplate];
}

id objc_msgSend__updateHourLabelsText(void *a1, const char *a2, ...)
{
  return [a1 _updateHourLabelsText];
}

id objc_msgSend_accentViews(void *a1, const char *a2, ...)
{
  return [a1 accentViews];
}

id objc_msgSend_activeEnergyChartData(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyChartData];
}

id objc_msgSend_activeEnergyCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyCompletionPercentage];
}

id objc_msgSend_activeEnergyGoal(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyGoal];
}

id objc_msgSend_activeEnergyTotal(void *a1, const char *a2, ...)
{
  return [a1 activeEnergyTotal];
}

id objc_msgSend_activityMoveMode(void *a1, const char *a2, ...)
{
  return [a1 activityMoveMode];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_appIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appIdentifier];
}

id objc_msgSend_appleExerciseTimeChartData(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeChartData];
}

id objc_msgSend_appleExerciseTimeCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeCompletionPercentage];
}

id objc_msgSend_appleExerciseTimeGoal(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeGoal];
}

id objc_msgSend_appleExerciseTimeTotal(void *a1, const char *a2, ...)
{
  return [a1 appleExerciseTimeTotal];
}

id objc_msgSend_appleMoveTimeChartData(void *a1, const char *a2, ...)
{
  return [a1 appleMoveTimeChartData];
}

id objc_msgSend_appleMoveTimeCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 appleMoveTimeCompletionPercentage];
}

id objc_msgSend_appleMoveTimeGoal(void *a1, const char *a2, ...)
{
  return [a1 appleMoveTimeGoal];
}

id objc_msgSend_appleMoveTimeTotal(void *a1, const char *a2, ...)
{
  return [a1 appleMoveTimeTotal];
}

id objc_msgSend_appleStandHourChartData(void *a1, const char *a2, ...)
{
  return [a1 appleStandHourChartData];
}

id objc_msgSend_appleStandHourCompletionPercentage(void *a1, const char *a2, ...)
{
  return [a1 appleStandHourCompletionPercentage];
}

id objc_msgSend_appleStandHoursGoal(void *a1, const char *a2, ...)
{
  return [a1 appleStandHoursGoal];
}

id objc_msgSend_appleStandHoursTotal(void *a1, const char *a2, ...)
{
  return [a1 appleStandHoursTotal];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_availabilityState(void *a1, const char *a2, ...)
{
  return [a1 availabilityState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_chartTitleView(void *a1, const char *a2, ...)
{
  return [a1 chartTitleView];
}

id objc_msgSend_chartView(void *a1, const char *a2, ...)
{
  return [a1 chartView];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return [a1 complicationTemplate];
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

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_databaseLoading(void *a1, const char *a2, ...)
{
  return [a1 databaseLoading];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceLocked(void *a1, const char *a2, ...)
{
  return [a1 deviceLocked];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dotsAreHidden(void *a1, const char *a2, ...)
{
  return [a1 dotsAreHidden];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_emptyFillFractions(void *a1, const char *a2, ...)
{
  return [a1 emptyFillFractions];
}

id objc_msgSend_exerciseLabel(void *a1, const char *a2, ...)
{
  return [a1 exerciseLabel];
}

id objc_msgSend_exercisePercentComplete(void *a1, const char *a2, ...)
{
  return [a1 exercisePercentComplete];
}

id objc_msgSend_family(void *a1, const char *a2, ...)
{
  return [a1 family];
}

id objc_msgSend_filterProvider(void *a1, const char *a2, ...)
{
  return [a1 filterProvider];
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return [a1 finalize];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_flatViews(void *a1, const char *a2, ...)
{
  return [a1 flatViews];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_formattingManager(void *a1, const char *a2, ...)
{
  return [a1 formattingManager];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_kilocalorieUnit(void *a1, const char *a2, ...)
{
  return [a1 kilocalorieUnit];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lockedModel(void *a1, const char *a2, ...)
{
  return [a1 lockedModel];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_minuteUnit(void *a1, const char *a2, ...)
{
  return [a1 minuteUnit];
}

id objc_msgSend_moveGlyphTitleLabelTrailingConstraint(void *a1, const char *a2, ...)
{
  return [a1 moveGlyphTitleLabelTrailingConstraint];
}

id objc_msgSend_moveLabel(void *a1, const char *a2, ...)
{
  return [a1 moveLabel];
}

id objc_msgSend_movePercentComplete(void *a1, const char *a2, ...)
{
  return [a1 movePercentComplete];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_quantityValue(void *a1, const char *a2, ...)
{
  return [a1 quantityValue];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedModel(void *a1, const char *a2, ...)
{
  return [a1 sharedModel];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_smallCapsBaseFont(void *a1, const char *a2, ...)
{
  return [a1 smallCapsBaseFont];
}

id objc_msgSend_standGlyphView(void *a1, const char *a2, ...)
{
  return [a1 standGlyphView];
}

id objc_msgSend_standLabel(void *a1, const char *a2, ...)
{
  return [a1 standLabel];
}

id objc_msgSend_standPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 standPercentComplete];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeStamp(void *a1, const char *a2, ...)
{
  return [a1 timeStamp];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unitManager(void *a1, const char *a2, ...)
{
  return [a1 unitManager];
}

id objc_msgSend_userActiveEnergyBurnedUnit(void *a1, const char *a2, ...)
{
  return [a1 userActiveEnergyBurnedUnit];
}

id objc_msgSend_userHasDoneActivitySetup(void *a1, const char *a2, ...)
{
  return [a1 userHasDoneActivitySetup];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_wheelchairUser(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUser];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widgetExtensionBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 widgetExtensionBundleIdentifier];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_yValue(void *a1, const char *a2, ...)
{
  return [a1 yValue];
}