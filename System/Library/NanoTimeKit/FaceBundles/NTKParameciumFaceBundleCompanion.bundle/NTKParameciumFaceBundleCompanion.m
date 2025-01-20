void sub_19F8(id a1)
{
  uint64_t vars8;

  qword_164F8 = objc_alloc_init(NTKParameciumFaceComplicationDescriptor);

  _objc_release_x1();
}

double sub_24E8(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16528);
  id WeakRetained = objc_loadWeakRetained(&qword_16530);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_16530);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_16530, v1);
    qword_16538 = (uint64_t)[v1 version];

    sub_40D8(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_16538;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16528);
  double v9 = *(double *)&qword_16518;

  return v9;
}

void sub_2B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2BA4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = *(id *)a3;
    long long v7 = *(_OWORD *)(a3 + 24);
    long long v9 = *(_OWORD *)(a3 + 8);
    long long v10 = v7;
    [WeakRetained updateTime:&v8];
  }
}

void sub_2C24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_2C38(id a1)
{
  return (NSString *)@"ParameciumFaceTimeUpdate";
}

void sub_2E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_312C(id a1, NSString *a2, NTKComplicationDisplayWrapperView *a3)
{
  id v3 = [(NTKComplicationDisplayWrapperView *)a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 transitionToMonochromeWithFraction:1.0];
  }
}

double normalizeAngle(double a1)
{
  if (a1 <= 0.0) {
    return a1 + ceil(a1 / -6.28318531) * 6.28318531;
  }
  else {
    return a1 + floor(a1 / 6.28318531) * -6.28318531;
  }
}

double computeShortestAngle(double a1, double a2)
{
  if (a1 <= 0.0)
  {
    double v2 = ceil(a1 / -6.28318531);
    double v3 = 6.28318531;
  }
  else
  {
    double v2 = floor(a1 / 6.28318531);
    double v3 = -6.28318531;
  }
  double v4 = a1 + v2 * v3;
  if (a2 <= 0.0)
  {
    double v5 = ceil(a2 / -6.28318531);
    double v6 = 6.28318531;
  }
  else
  {
    double v5 = floor(a2 / 6.28318531);
    double v6 = -6.28318531;
  }
  double v7 = v4 - (a2 + v5 * v6);
  if (v7 <= 0.0)
  {
    double v8 = ceil(v7 / -6.28318531);
    double v9 = 6.28318531;
  }
  else
  {
    double v8 = floor(v7 / 6.28318531);
    double v9 = -6.28318531;
  }
  double v10 = v7 + v8 * v9;
  double v11 = fabs(v10);
  double v12 = -v10;
  double result = 6.28318531 - v10;
  if (v11 <= 3.14159265) {
    return v12;
  }
  return result;
}

void sub_3FD0(id a1)
{
  qword_16508 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_40D8(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:2];
  [v4 scaledValue:-48.0];
  qword_16518 = v2;
  [v4 scaledValue:-57.0];
  qword_16520 = v3;
}

double sub_57E8(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16560);
  id WeakRetained = objc_loadWeakRetained(&qword_16568);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_16568);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_16568, v1);
    qword_16570 = (uint64_t)[v1 version];

    sub_86E0(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_16570;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16560);
  double v9 = *(double *)&qword_16550;

  return v9;
}

uint64_t sub_5AF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = a2 << 9;
  do
  {
    pnoise3();
    int v6 = (int)((v5 + 1.0) * 0.5 * 255.0);
    pnoise3();
    int v8 = (int)((v7 + 1.0) * 0.5 * 255.0);
    pnoise3();
    int v10 = (int)((v9 + 1.0) * 0.5 * 255.0);
    uint64_t result = pnoise3();
    *(unsigned char *)(*(void *)(a1 + 64) + v4) = v6;
    *(unsigned char *)(*(void *)(a1 + 64) + v4 + 1) = v8;
    *(unsigned char *)(*(void *)(a1 + 64) + v4 + 2) = v10;
    *(unsigned char *)(*(void *)(a1 + 64) + v4 + 3) = (int)((v12 + 1.0) * 0.5 * 255.0);
    ++v3;
    v4 += 4;
  }
  while (v3 != 128);
  return result;
}

id sub_5C78(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 blitCommandEncoder];
  int64x2_t v9 = vdupq_n_s64(0x80uLL);
  uint64_t v10 = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  memset(v8, 0, sizeof(v8));
  [v3 copyFromBuffer:v4 sourceOffset:0 sourceBytesPerRow:512 sourceBytesPerImage:0x10000 sourceSize:&v9 toTexture:v5 destinationSlice:0 destinationLevel:0 destinationOrigin:v8];
  [v3 endEncoding];
  id v6 = *(id *)(a1 + 40);

  return v6;
}

void sub_5D5C(id a1)
{
  uint64_t v1 = +[NTKFontLoader fontDescriptorForSectName:@"__ConfettiFont" fromMachO:&dword_0];
  uint64_t v2 = qword_16540;
  qword_16540 = v1;

  _objc_release_x1(v1, v2);
}

uint64_t sub_6234(uint64_t result, int a2)
{
  unsigned int v2 = *(_DWORD *)(result + 48);
  if (v2)
  {
    unsigned int v3 = 0;
    float32x4_t v4 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      unsigned int v5 = v3 + v2 * a2;
      v6.i64[0] = 0x3F0000003F000000;
      v6.i64[1] = 0x3F0000003F000000;
      int16x8_t v7 = (int16x8_t)vcvtq_s32_f32(vminnmq_f32(vmaxnmq_f32(vmlaq_f32(v6, (float32x4_t)xmmword_BCC0, *(float32x4_t *)(*(void *)(result + 32) + 16 * v5)), (float32x4_t)0), v4));
      *(int16x4_t *)v7.i8 = vmovn_s32((int32x4_t)v7);
      *(_DWORD *)(*(void *)(result + 40) + 4 * v5) = vmovn_s16(v7).u32[0];
      ++v3;
      unsigned int v2 = *(_DWORD *)(result + 48);
    }
    while (v3 < v2);
  }
  return result;
}

float randomInRange(int a1, int a2)
{
  return (float)(arc4random_uniform(a2 - a1) + a1);
}

double rotationMatrix(float a1)
{
  __float2 v1 = __sincosf_stret(a1);
  return COERCE_DOUBLE(__PAIR64__(LODWORD(v1.__sinval), LODWORD(v1.__cosval)));
}

double translationMatrix()
{
  __asm { FMOV            V2.4S, #1.0 }
  *(void *)&double result = 1065353216;
  return result;
}

__n128 sub_717C(uint64_t a1, int a2, float a3, __n128 a4)
{
  *((float *)[*(id *)(a1 + 32) contents] + a2) = a3;
  __n128 v6 = a4;
  v6.n128_f32[1] = 1.0 - a4.n128_f32[1];
  __n128 v10 = v6;
  int16x8_t v7 = [*(id *)(a1 + 40) contents];
  __n128 result = v10;
  v7[a2] = v10.n128_u64[0];
  return result;
}

void sub_86E0(uint64_t a1, uint64_t a2)
{
  id v4 = +[CLKDeviceMetrics metricsWithDevice:a2 identitySizeClass:6];
  [v4 setRoundingBehavior:0];
  [v4 scaledValue:145.0];
  qword_16550 = v2;
  [v4 scaledValue:1.0];
  qword_16558 = v3;
}

void sub_8D3C(id a1)
{
  v3[0] = &off_10E20;
  v3[1] = &off_10E38;
  v4[0] = @"on";
  v4[1] = @"off";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  uint64_t v2 = (void *)qword_16578;
  qword_16578 = v1;
}

void sub_8EF0(id a1)
{
  v3[0] = &off_10E80;
  v3[1] = &off_10E68;
  v4[0] = @"numbers";
  v4[1] = @"simple";
  void v3[2] = &off_10E50;
  void v4[2] = @"confetti";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_16588;
  qword_16588 = v1;
}

void sub_8FAC(uint64_t a1, void *a2, NSObject *a3)
{
  unsigned int v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  int64x2_t v9 = v5;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Failed to create paramecium pipeline for %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return _CGColorCreateCopyByMatchingToColorSpace(a1, intent, color, options);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGImageRelease(CGImageRef image)
{
}

uint64_t CLKClockTimerDateForDate()
{
  return _CLKClockTimerDateForDate();
}

uint64_t CLKFloatEqualsFloat()
{
  return _CLKFloatEqualsFloat();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKInterpolateShortestPathBetweenAnglesUnclipped()
{
  return _CLKInterpolateShortestPathBetweenAnglesUnclipped();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKUIConvertUIImageToMTLTexture()
{
  return _CLKUIConvertUIImageToMTLTexture();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTLineCreateWithAttributedString(attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  return _CTLineGetImageBounds(line, context);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  return _CTLineGetTypographicBounds(line, ascent, descent, leading);
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKHighPriorityApply()
{
  return _NTKHighPriorityApply();
}

uint64_t NTKHourMinuteSecondAnglesForTime()
{
  return _NTKHourMinuteSecondAnglesForTime();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKIsScreenOn()
{
  return _NTKIsScreenOn();
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
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

uint64_t pnoise3()
{
  return _pnoise3();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__initializeColors(void *a1, const char *a2, ...)
{
  return [a1 _initializeColors];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__updateConfettiRotationRate(void *a1, const char *a2, ...)
{
  return [a1 _updateConfettiRotationRate];
}

id objc_msgSend__updateHandAngles(void *a1, const char *a2, ...)
{
  return [a1 _updateHandAngles];
}

id objc_msgSend__updatePausedState(void *a1, const char *a2, ...)
{
  return [a1 _updatePausedState];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return [a1 anchorPoint];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return [a1 background];
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

id objc_msgSend_complicationBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 complicationBackgroundColor];
}

id objc_msgSend_complicationColor(void *a1, const char *a2, ...)
{
  return [a1 complicationColor];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_complicationFactory(void *a1, const char *a2, ...)
{
  return [a1 complicationFactory];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_confettiFontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 confettiFontDescriptor];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceClass(void *a1, const char *a2, ...)
{
  return [a1 faceClass];
}

id objc_msgSend_faceDisplayTime(void *a1, const char *a2, ...)
{
  return [a1 faceDisplayTime];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_handLength(void *a1, const char *a2, ...)
{
  return [a1 handLength];
}

id objc_msgSend_handWidth(void *a1, const char *a2, ...)
{
  return [a1 handWidth];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_invalidateComplicationLayout(void *a1, const char *a2, ...)
{
  return [a1 invalidateComplicationLayout];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutComplicationViews(void *a1, const char *a2, ...)
{
  return [a1 layoutComplicationViews];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_loadLayoutRules(void *a1, const char *a2, ...)
{
  return [a1 loadLayoutRules];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_metalLayer(void *a1, const char *a2, ...)
{
  return [a1 metalLayer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return [a1 nativeScale];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_radialShadowRadius(void *a1, const char *a2, ...)
{
  return [a1 radialShadowRadius];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_rootContainerView(void *a1, const char *a2, ...)
{
  return [a1 rootContainerView];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
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

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_texture(void *a1, const char *a2, ...)
{
  return [a1 texture];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return [a1 timeOffset];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_verticalCenterOffset(void *a1, const char *a2, ...)
{
  return [a1 verticalCenterOffset];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}