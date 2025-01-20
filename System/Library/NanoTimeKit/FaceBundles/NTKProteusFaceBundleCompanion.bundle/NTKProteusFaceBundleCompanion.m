void sub_396C(id a1)
{
  uint64_t v1;
  void *v2;
  void v3[2];
  void v4[2];

  v3[0] = &off_10A40;
  v3[1] = &off_10A58;
  v4[0] = @"on";
  v4[1] = @"off";
  v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  v2 = (void *)qword_164D0;
  qword_164D0 = v1;
}

void sub_3F34(id a1)
{
  v3[0] = &off_10A70;
  v3[1] = &off_10A88;
  v4[0] = NTKFaceBundleStyle1;
  v4[1] = NTKFaceBundleStyle2;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  v2 = (void *)qword_164E0;
  qword_164E0 = v1;
}

void sub_480C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v7 = +[NTKFaceBackgroundStyleEditOption optionWithBackgroundStyle:0 forDevice:v3];
  v5 = +[NTKProteusStyleEditOption optionWithProteusStyle:0 forDevice:*(void *)(a1 + 32)];
  [v4 selectOption:v7 forCustomEditMode:12 slot:0];
  [v4 selectOption:v5 forCustomEditMode:15 slot:0];
  v6 = +[NTKComplication anyComplicationOfType:1];
  [v4 setComplication:v6 forSlot:NTKComplicationSlotSubdialTop];

  [v4 setComplication:0 forSlot:NTKComplicationSlotSubdialBottom];
}

void sub_4D8C(id a1)
{
  uint64_t v1 = +[CLKDevice currentDevice];
  v2 = (int *)[v1 deviceCategory];

  CFStringRef v3 = @"__NeptuneSrpFont";
  if (v2 == (int *)((char *)&dword_4 + 1)) {
    CFStringRef v3 = @"__PrSrpAvoniaFont";
  }
  if (v2 == &dword_4) {
    CFStringRef v4 = @"__PrSrpAgaveFont";
  }
  else {
    CFStringRef v4 = v3;
  }
  qword_164F8 = +[NTKFontLoader fontDescriptorForSectName:v4 fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_4FE8(id a1)
{
  uint64_t v1 = +[CLKDevice currentDevice];
  v2 = (int *)[v1 deviceCategory];

  CFStringRef v3 = @"__NeptuneSftFont";
  if (v2 == (int *)((char *)&dword_4 + 1)) {
    CFStringRef v3 = @"__PrSftAvoniaFont";
  }
  if (v2 == &dword_4) {
    CFStringRef v4 = @"__PrSftAgaveFont";
  }
  else {
    CFStringRef v4 = v3;
  }
  qword_16508 = +[NTKFontLoader fontDescriptorForSectName:v4 fromMachO:&dword_0];

  _objc_release_x1();
}

void sub_6130(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_6288(void *a1@<X0>, uint64_t a2@<X8>)
{
  id obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16558);
  id WeakRetained = objc_loadWeakRetained(&qword_16560);
  if (WeakRetained)
  {
    CFStringRef v4 = WeakRetained;
    id v5 = objc_loadWeakRetained(&qword_16560);
    if (v5 == obj)
    {
      id v6 = [obj version];
      uint64_t v7 = qword_16568;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v8 = objc_storeWeak(&qword_16560, obj);
  qword_16568 = (uint64_t)[obj version];

  sub_84C4(v9, obj);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16558);
  long long v10 = *(_OWORD *)&qword_16530;
  *(_OWORD *)a2 = xmmword_16520;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = xmmword_16540;
  *(void *)(a2 + 48) = qword_16550;
}

void sub_6D14(uint64_t a1, void *a2, void *a3)
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

    id v6 = [v5 display];
    [v6 updateMonochromeColor];
  }

LABEL_5:
}

void sub_7D04(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  CFStringRef v4 = [v11 display];
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

void sub_7E68(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = NTKComplicationSlotSubdialTop;
  id v6 = a3;
  if (([v7 isEqualToString:v5] & 1) != 0
    || [v7 isEqualToString:NTKComplicationSlotSubdialBottom])
  {
    [*(id *)(a1 + 32) _complicationAlphaForEditMode:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _complicationAlphaForEditMode:*(void *)(a1 + 48)];
  }
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v6, "setAlpha:");
}

void sub_84C4(uint64_t a1, void *a2)
{
  id v2 = a2;
  CFStringRef v3 = +[CLKDeviceMetrics metricsWithDevice:v2 identitySizeClass:4];
  [v3 scaledValue:2.0];
  double v5 = v4;
  +[NTKAnalogUtilities largeDialDiameterForDevice:v2];
  double v7 = v6;

  *(double *)&xmmword_16520 = v5 + v7;
  [v3 scaledValue:5 withOverride:50.0 forSizeClass:54.0];
  *((void *)&xmmword_16520 + 1) = 0;
  qword_16530 = v8;
  v20[0] = &off_10B00;
  v20[1] = &off_10B18;
  v21[0] = &off_10C80;
  v21[1] = &off_10C90;
  v20[2] = &off_10B30;
  v20[3] = &off_10B48;
  v21[2] = &off_10CA0;
  v21[3] = &off_10CB0;
  id v9 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  [v3 scaledValue:v9 withOverrides:30.0];
  qword_16538 = v10;

  [v3 scaledValue:5 withOverride:1.0 forSizeClass:1.0];
  *(void *)&xmmword_16540 = v11;
  v18[0] = &off_10B00;
  v18[1] = &off_10B18;
  v19[0] = &off_10CC0;
  v19[1] = &off_10CD0;
  v18[2] = &off_10B30;
  v18[3] = &off_10B48;
  v19[2] = &off_10CE0;
  v19[3] = &off_10CF0;
  v12 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  [v3 scaledValue:v12 withOverrides:29.0];
  *((void *)&xmmword_16540 + 1) = v13;

  v16[0] = &off_10B00;
  v16[1] = &off_10B18;
  v17[0] = &off_10D00;
  v17[1] = &off_10D10;
  v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v3 scaledValue:v14 withOverrides:7.0];
  qword_16550 = v15;
}

id sub_8E40(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSubview:a2];
}

void sub_8E4C(id a1, UILabel *a2, unint64_t a3, BOOL *a4)
{
}

id sub_9774(_OWORD *a1, void *a2)
{
  long long v2 = a1[3];
  v4[0] = a1[2];
  v4[1] = v2;
  void v4[2] = a1[4];
  return [a2 setTransform:v4];
}

id sub_9974(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

void sub_A37C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A3E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A454(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

uint64_t CLKContrastRatioForColors()
{
  return _CLKContrastRatioForColors();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenPoints()
{
  return _CLKInterpolateBetweenPoints();
}

uint64_t NTKAllSignatureCircularTypes()
{
  return _NTKAllSignatureCircularTypes();
}

uint64_t NTKAllSimpleTextComplicationTypes()
{
  return _NTKAllSimpleTextComplicationTypes();
}

uint64_t NTKAlphaForRubberBandingFraction()
{
  return _NTKAlphaForRubberBandingFraction();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKEnableAODVibrancy()
{
  return _NTKEnableAODVibrancy();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKImageNamed()
{
  return _NTKImageNamed();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKLargeElementScaleForBreathingFraction()
{
  return _NTKLargeElementScaleForBreathingFraction();
}

uint64_t NTKScaleForRubberBandingFraction()
{
  return _NTKScaleForRubberBandingFraction();
}

uint64_t TextToFourCharCode()
{
  return _TextToFourCharCode();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

long double sin(long double __x)
{
  return _sin(__x);
}

id objc_msgSend__adjustedTritiumFraction(void *a1, const char *a2, ...)
{
  return [a1 _adjustedTritiumFraction];
}

id objc_msgSend__backgroundFraction(void *a1, const char *a2, ...)
{
  return [a1 _backgroundFraction];
}

id objc_msgSend__contrastRatio(void *a1, const char *a2, ...)
{
  return [a1 _contrastRatio];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__fontLoader(void *a1, const char *a2, ...)
{
  return [a1 _fontLoader];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__logSize(void *a1, const char *a2, ...)
{
  return [a1 _logSize];
}

id objc_msgSend__rainbowFraction(void *a1, const char *a2, ...)
{
  return [a1 _rainbowFraction];
}

id objc_msgSend__removeProteusContentView(void *a1, const char *a2, ...)
{
  return [a1 _removeProteusContentView];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__setupProteusContentView(void *a1, const char *a2, ...)
{
  return [a1 _setupProteusContentView];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__updateColorPalette(void *a1, const char *a2, ...)
{
  return [a1 _updateColorPalette];
}

id objc_msgSend__updateDigitWeights(void *a1, const char *a2, ...)
{
  return [a1 _updateDigitWeights];
}

id objc_msgSend__updateNotchDigitWeights(void *a1, const char *a2, ...)
{
  return [a1 _updateNotchDigitWeights];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_applyColorOnAnalogHands(void *a1, const char *a2, ...)
{
  return [a1 applyColorOnAnalogHands];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return [a1 backgroundStyle];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_circularComplicationAColor(void *a1, const char *a2, ...)
{
  return [a1 circularComplicationAColor];
}

id objc_msgSend_circularComplicationB(void *a1, const char *a2, ...)
{
  return [a1 circularComplicationB];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearMotionCache(void *a1, const char *a2, ...)
{
  return [a1 clearMotionCache];
}

id objc_msgSend_clearStatusCache(void *a1, const char *a2, ...)
{
  return [a1 clearStatusCache];
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

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
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

id objc_msgSend_digit(void *a1, const char *a2, ...)
{
  return [a1 digit];
}

id objc_msgSend_digitColor(void *a1, const char *a2, ...)
{
  return [a1 digitColor];
}

id objc_msgSend_digitContrast(void *a1, const char *a2, ...)
{
  return [a1 digitContrast];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_easeInDuration(void *a1, const char *a2, ...)
{
  return [a1 easeInDuration];
}

id objc_msgSend_easeOutDuration(void *a1, const char *a2, ...)
{
  return [a1 easeOutDuration];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_faceViewDidChangeWantsStatusBarIconShadow(void *a1, const char *a2, ...)
{
  return [a1 faceViewDidChangeWantsStatusBarIconShadow];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromPalette(void *a1, const char *a2, ...)
{
  return [a1 fromPalette];
}

id objc_msgSend_fullname(void *a1, const char *a2, ...)
{
  return [a1 fullname];
}

id objc_msgSend_hasPrimaryColorRange(void *a1, const char *a2, ...)
{
  return [a1 hasPrimaryColorRange];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourHandInlay(void *a1, const char *a2, ...)
{
  return [a1 hourHandInlay];
}

id objc_msgSend_hourHandStroke(void *a1, const char *a2, ...)
{
  return [a1 hourHandStroke];
}

id objc_msgSend_hourHandView(void *a1, const char *a2, ...)
{
  return [a1 hourHandView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isRainbowColor(void *a1, const char *a2, ...)
{
  return [a1 isRainbowColor];
}

id objc_msgSend_isTritium(void *a1, const char *a2, ...)
{
  return [a1 isTritium];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_minuteHandView(void *a1, const char *a2, ...)
{
  return [a1 minuteHandView];
}

id objc_msgSend_nanosecond(void *a1, const char *a2, ...)
{
  return [a1 nanosecond];
}

id objc_msgSend_pigmentEditOption(void *a1, const char *a2, ...)
{
  return [a1 pigmentEditOption];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_propagationSpeed(void *a1, const char *a2, ...)
{
  return [a1 propagationSpeed];
}

id objc_msgSend_proteusContentView(void *a1, const char *a2, ...)
{
  return [a1 proteusContentView];
}

id objc_msgSend_purpleColor(void *a1, const char *a2, ...)
{
  return [a1 purpleColor];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_secondHand(void *a1, const char *a2, ...)
{
  return [a1 secondHand];
}

id objc_msgSend_secondHandView(void *a1, const char *a2, ...)
{
  return [a1 secondHandView];
}

id objc_msgSend_simpleTextComplication(void *a1, const char *a2, ...)
{
  return [a1 simpleTextComplication];
}

id objc_msgSend_simpleTextComplicationColor(void *a1, const char *a2, ...)
{
  return [a1 simpleTextComplicationColor];
}

id objc_msgSend_simpleTextComplicationContrast(void *a1, const char *a2, ...)
{
  return [a1 simpleTextComplicationContrast];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_toPalette(void *a1, const char *a2, ...)
{
  return [a1 toPalette];
}

id objc_msgSend_transitionFraction(void *a1, const char *a2, ...)
{
  return [a1 transitionFraction];
}

id objc_msgSend_updateMonochromeColor(void *a1, const char *a2, ...)
{
  return [a1 updateMonochromeColor];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}