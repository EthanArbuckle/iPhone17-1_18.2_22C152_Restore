void sub_1BE0(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  long long v9;
  long long v10;
  id obj;
  uint64_t vars8;

  obj = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12C80);
  WeakRetained = objc_loadWeakRetained(&qword_12C88);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained(&qword_12C88);
    if (v5 == obj)
    {
      v6 = [obj version];
      v7 = qword_12C90;

      if (v6 == (id)v7) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v8 = objc_storeWeak(&qword_12C88, obj);
  qword_12C90 = (uint64_t)[obj version];

  xmmword_12C40 = xmmword_9700;
  *(_OWORD *)algn_12C50 = xmmword_9710;
  xmmword_12C60 = xmmword_9720;
  unk_12C70 = xmmword_9730;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12C80);
  v9 = *(_OWORD *)algn_12C50;
  *a2 = xmmword_12C40;
  a2[1] = v9;
  v10 = unk_12C70;
  a2[2] = xmmword_12C60;
  a2[3] = v10;
}

void sub_3294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_32B8(uint64_t a1, void *a2, id *a3)
{
  id v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 19, *a3);
  }
  [v6 _updateLabelsAnimated:1];
}

void sub_333C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_3350(id a1)
{
  return (NSString *)@"NTKSquallDigitalTimeView";
}

double sub_3A88(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12CB0);
  id WeakRetained = objc_loadWeakRetained(&qword_12CB8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_12CB8);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_12CB8, v1);
    qword_12CC0 = (uint64_t)[v1 version];

    qword_12C98 = 0x4004000000000000;
    qword_12CA0 = 0x4050000000000000;
    qword_12CA8 = 0x3F71111111111111;
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_12CC0;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12CB0);
  double v8 = *(double *)&qword_12C98;

  return v8;
}

void sub_3FA4(id a1, CLKUITimeLabel *a2)
{
  id v2 = [(CLKUITimeLabel *)a2 timeFormatter];
  [v2 setForcedNumberSystem:0];
}

double sub_4B74(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_12CD0);
  id WeakRetained = objc_loadWeakRetained(&qword_12CD8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_12CD8);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_12CD8, v1);
    qword_12CE0 = (uint64_t)[v1 version];

    qword_12CC8 = 0x4029000000000000;
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_12CE0;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_12CD0);

  return 0.0;
}

void sub_4FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4FE0(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[1] bezelProgress];
  objc_msgSend(WeakRetained, "setProgress:");
}

void sub_5058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_506C(id a1)
{
  return (NSString *)@"NTKSquallBezelView bezel update";
}

id sub_58A0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_renderBezelTemplateForSize:highlighted:tritium:rendererContext:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void _addToPath(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9, double a10)
{
  id v22 = a1;
  objc_msgSend(v22, "addLineToPoint:", _clipToBounds(a2, a3, a4, a5, a6));
  objc_msgSend(v22, "addLineToPoint:", _clipToBounds(a2, a3, a4, a5, a8));
  objc_msgSend(v22, "addLineToPoint:", _clipToBounds(a2, a3, a4, a5, a10));
}

id sub_5E44(void *a1, void *a2)
{
  id v3 = [a2 CGContext];
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];

  return [v4 _compositeBezelImagesA:v5 andB:v6 clippingPath:v7 context:v3];
}

double _clipToBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  double MinX = CGRectGetMinX(v14);
  if (MinX < a5) {
    double MinX = a5;
  }
  if (MaxX <= MinX) {
    double v12 = MaxX;
  }
  else {
    double v12 = MinX;
  }
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  CGRectGetMaxY(v15);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  CGRectGetMinY(v16);
  return v12;
}

double _rotateToQuadrant(uint64_t a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 3:
      return a3;
    case 2:
      return a4 - result;
    case 1:
      return a4 - a3;
  }
  return result;
}

void sub_65AC(id a1)
{
  id v1 = +[NTKFontLoader registerFontDescriptorsForSectName:@"__SquallFontL" fromMachO:&dword_0];
  CFStringRef v5 = kCTFontFamilyNameAttribute;
  CFStringRef v6 = @"Hermes Cape Cod Link";
  id v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v3 = +[UIFontDescriptor fontDescriptorWithFontAttributes:v2];
  id v4 = (void *)qword_12CE8;
  qword_12CE8 = v3;
}

void sub_66D8(id a1)
{
  uint64_t v1 = +[NTKFontLoader fontDescriptorForSectName:@"__SquallFontV" fromMachO:&dword_0];
  id v2 = (void *)qword_12CF8;
  qword_12CF8 = v1;

  uint64_t v3 = (void *)qword_12CF8;
  CFStringRef v11 = kCTFontVariationAttribute;
  id v4 = +[NSNumber numberWithUnsignedInt:TextToFourCharCode()];
  v9 = v4;
  v10 = &off_C978;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  double v12 = v5;
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v7 = [v3 fontDescriptorByAddingAttributes:v6];
  double v8 = (void *)qword_12CF8;
  qword_12CF8 = v7;
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
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

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
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

uint64_t CLKInterpolateBetweenColors()
{
  return _CLKInterpolateBetweenColors();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t NTKEqualStrings()
{
  return _NTKEqualStrings();
}

uint64_t NTKShowHardwareSpecificFaces()
{
  return _NTKShowHardwareSpecificFaces();
}

uint64_t TextToFourCharCode()
{
  return _TextToFourCharCode();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend__createTimeView(void *a1, const char *a2, ...)
{
  return [a1 _createTimeView];
}

id objc_msgSend__dimmedColor(void *a1, const char *a2, ...)
{
  return [a1 _dimmedColor];
}

id objc_msgSend__displayDate(void *a1, const char *a2, ...)
{
  return [a1 _displayDate];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__highlightColor(void *a1, const char *a2, ...)
{
  return [a1 _highlightColor];
}

id objc_msgSend__lastLineBaseline(void *a1, const char *a2, ...)
{
  return [a1 _lastLineBaseline];
}

id objc_msgSend__layoutTime(void *a1, const char *a2, ...)
{
  return [a1 _layoutTime];
}

id objc_msgSend__logoDimmedColor(void *a1, const char *a2, ...)
{
  return [a1 _logoDimmedColor];
}

id objc_msgSend__logoHighlightedColor(void *a1, const char *a2, ...)
{
  return [a1 _logoHighlightedColor];
}

id objc_msgSend__logoTritiumColor(void *a1, const char *a2, ...)
{
  return [a1 _logoTritiumColor];
}

id objc_msgSend__refreshTemplateImages(void *a1, const char *a2, ...)
{
  return [a1 _refreshTemplateImages];
}

id objc_msgSend__removeTimeView(void *a1, const char *a2, ...)
{
  return [a1 _removeTimeView];
}

id objc_msgSend__removeViews(void *a1, const char *a2, ...)
{
  return [a1 _removeViews];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__startBezelTimer(void *a1, const char *a2, ...)
{
  return [a1 _startBezelTimer];
}

id objc_msgSend__startClockUpdates(void *a1, const char *a2, ...)
{
  return [a1 _startClockUpdates];
}

id objc_msgSend__tritiumDimmedColor(void *a1, const char *a2, ...)
{
  return [a1 _tritiumDimmedColor];
}

id objc_msgSend__tritiumHighlightColor(void *a1, const char *a2, ...)
{
  return [a1 _tritiumHighlightColor];
}

id objc_msgSend__updateAnimating(void *a1, const char *a2, ...)
{
  return [a1 _updateAnimating];
}

id objc_msgSend__updateLocale(void *a1, const char *a2, ...)
{
  return [a1 _updateLocale];
}

id objc_msgSend_activeAppearance(void *a1, const char *a2, ...)
{
  return [a1 activeAppearance];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bezelProgress(void *a1, const char *a2, ...)
{
  return [a1 bezelProgress];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return [a1 bezierPath];
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

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return [a1 closePath];
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return [a1 collectionType];
}

id objc_msgSend_colorPalette(void *a1, const char *a2, ...)
{
  return [a1 colorPalette];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
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

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourLabel(void *a1, const char *a2, ...)
{
  return [a1 hourLabel];
}

id objc_msgSend_hourNumeralsFill(void *a1, const char *a2, ...)
{
  return [a1 hourNumeralsFill];
}

id objc_msgSend_hourNumeralsFillLinked(void *a1, const char *a2, ...)
{
  return [a1 hourNumeralsFillLinked];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inactiveHourLabel(void *a1, const char *a2, ...)
{
  return [a1 inactiveHourLabel];
}

id objc_msgSend_inactiveMinuteLabel(void *a1, const char *a2, ...)
{
  return [a1 inactiveMinuteLabel];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_logoDimmed(void *a1, const char *a2, ...)
{
  return [a1 logoDimmed];
}

id objc_msgSend_logoHighlighted(void *a1, const char *a2, ...)
{
  return [a1 logoHighlighted];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_minuteLabel(void *a1, const char *a2, ...)
{
  return [a1 minuteLabel];
}

id objc_msgSend_minuteNumeralsFill(void *a1, const char *a2, ...)
{
  return [a1 minuteNumeralsFill];
}

id objc_msgSend_minuteNumeralsFillLinked(void *a1, const char *a2, ...)
{
  return [a1 minuteNumeralsFillLinked];
}

id objc_msgSend_nanosecond(void *a1, const char *a2, ...)
{
  return [a1 nanosecond];
}

id objc_msgSend_opticalInsets(void *a1, const char *a2, ...)
{
  return [a1 opticalInsets];
}

id objc_msgSend_paddingInsets(void *a1, const char *a2, ...)
{
  return [a1 paddingInsets];
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return [a1 preferredFormat];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_squallFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 squallFontDescriptor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return [a1 timeFormatter];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_tritiumFraction(void *a1, const char *a2, ...)
{
  return [a1 tritiumFraction];
}

id objc_msgSend_tritiumPalette(void *a1, const char *a2, ...)
{
  return [a1 tritiumPalette];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}