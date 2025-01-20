void sub_2430(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t vars8;

  v5 = a3;
  v11 = [a2 mutableCopy];
  v6 = +[NTKLilypadFaceBundle localizedStringForKey:@"NOTIFICATION_TITLE" comment:@"Pride Threads Face"];
  v7 = +[NTKLilypadFaceBundle localizedStringForKey:@"NOTIFICATION_CONTENT" comment:@"This new face is now available for your Apple Watch."];
  [v11 setTitle:v6];
  [v11 setBody:v7];
  [v11 setCategoryIdentifier:NTKFaceSupportFaceCategoryIdentifier];
  v8 = *(void *)(a1 + 40);
  v9 = [v11 copy];
  v10 = [(id)objc_opt_class() identifier];
  (*(void (**)(uint64_t, id, void *, id))(v8 + 16))(v8, v9, v10, v5);
}

void sub_3194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_31B8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = *(id *)a3;
    long long v7 = *(_OWORD *)(a3 + 24);
    long long v9 = *(_OWORD *)(a3 + 8);
    long long v10 = v7;
    [WeakRetained _timeUpdated:&v8];
  }
}

void sub_3238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_324C(id a1)
{
  return (NSString *)@"Lilypad";
}

void sub_33AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_367C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_396C(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 bounds];
  objc_msgSend(v2, "snapshotInRect:scale:time:");
  image = (UIImage *)objc_claimAutoreleasedReturnValue();

  v3 = NTKHomeDirectory();
  v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  v6 = +[NSString stringWithFormat:@"%@/Lilypad_%lf.png", v3, v5];

  NSLog(@"Snapshotting lilypad face to %@", v6);
  long long v7 = UIImagePNGRepresentation(image);
  [v7 writeToFile:v6 atomically:0];
}

void sub_40DC(id a1)
{
  qword_11310 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

uint64_t sub_4BE4(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11330);
  id WeakRetained = objc_loadWeakRetained(&qword_11338);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = objc_loadWeakRetained(&qword_11338);
  if (v4 != v1)
  {

LABEL_5:
    id v7 = objc_storeWeak(&qword_11338, v1);
    qword_11340 = (uint64_t)[v1 version];

    sub_7168(v8, v1);
    goto LABEL_6;
  }
  id v5 = [v1 version];
  uint64_t v6 = qword_11340;

  if (v5 != (id)v6) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11330);
  uint64_t v9 = qword_11320;

  return v9;
}

__n128 CMAcceleration_simd@<Q0>(__n128 *a1@<X8>, __n128 result@<Q0>, double a3@<D1>, __n128 a4@<Q2>)
{
  result.n128_f64[1] = a3;
  *a1 = result;
  a1[1] = a4;
  return result;
}

float64_t CGPoint_simd(float64x2_t a1, float64_t a2)
{
  a1.f64[1] = a2;
  *(float32x2_t *)&a1.f64[0] = vcvt_f32_f64(a1);
  return a1.f64[0];
}

double simd_CGPoint(float32x2_t a1)
{
  *(void *)&double result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

void sub_5270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_5CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = 0;
  uint64_t v4 = a2 << 7;
  do
  {
    uint64_t result = pnoise2();
    *(unsigned char *)(*(void *)(a1 + 64) + v4 + v3++) = (int)((v6 + 1.0) * 0.5 * 255.0);
  }
  while (v3 != 128);
  return result;
}

id sub_5DA4(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 blitCommandEncoder];
  int64x2_t v9 = vdupq_n_s64(0x80uLL);
  uint64_t v10 = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  memset(v8, 0, sizeof(v8));
  [v3 copyFromBuffer:v4 sourceOffset:0 sourceBytesPerRow:128 sourceBytesPerImage:0x4000 sourceSize:&v9 toTexture:v5 destinationSlice:0 destinationLevel:0 destinationOrigin:v8];
  [v3 endEncoding];
  id v6 = *(id *)(a1 + 40);

  return v6;
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

float32x2_t simd_clamp_magnitude(float32x2_t result, float a2)
{
  float32x2_t v2 = vmul_f32(result, result);
  v2.f32[0] = sqrtf(vaddv_f32(v2));
  if (v2.f32[0] > a2 && v2.f32[0] > 0.0) {
    return vmul_n_f32(vdiv_f32(result, (float32x2_t)vdup_lane_s32((int32x2_t)v2, 0)), a2);
  }
  return result;
}

float float_clamp_magnitude(int8x16_t a1, float a2, int8x16_t a3)
{
  a3.i32[1] = 0;
  BOOL v4 = fabsf(*(float *)a1.i32) <= a2 || *(float *)a1.i32 == 0.0;
  a3.i32[0] = 1.0;
  v5.i64[0] = 0x8000000080000000;
  v5.i64[1] = 0x8000000080000000;
  float v6 = *(float *)vbslq_s8(v5, a3, a1).i32 * a2;
  if (!v4) {
    *(float *)a1.i32 = v6;
  }
  return *(float *)a1.i32;
}

id sub_66A0(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  [*(id *)(*(void *)(a1 + 32) + 584) position];
  float64_t v42 = v6;
  [*(id *)(*(void *)(a1 + 32) + 584) position];
  v7.f64[0] = v42;
  v7.f64[1] = v8;
  v49[0] = vcvt_f32_f64(v7);
  [*(id *)(*(void *)(a1 + 32) + 584) position];
  float64_t v43 = v9;
  [*(id *)(*(void *)(a1 + 32) + 584) position];
  v10.f64[0] = v43;
  v10.f64[1] = v11;
  v49[1] = vcvt_f32_f64(v10);
  [*(id *)(*(void *)(a1 + 32) + 592) position];
  float64_t v44 = v12;
  [*(id *)(*(void *)(a1 + 32) + 592) position];
  v13.f64[0] = v44;
  v13.f64[1] = v14;
  v49[2] = vcvt_f32_f64(v13);
  [*(id *)(*(void *)(a1 + 32) + 592) position];
  float64_t v45 = v15;
  [*(id *)(*(void *)(a1 + 32) + 592) position];
  v16.f64[0] = v45;
  v16.f64[1] = v17;
  v49[3] = vcvt_f32_f64(v16);
  [*(id *)(*(void *)(a1 + 32) + 584) rotation];
  *(float *)&double v18 = v18;
  v48[0] = LODWORD(v18);
  [*(id *)(*(void *)(a1 + 32) + 584) rotation];
  *(float *)&double v19 = v19;
  v48[1] = LODWORD(v19);
  [*(id *)(*(void *)(a1 + 32) + 592) rotation];
  *(float *)&double v20 = v20;
  v48[2] = LODWORD(v20);
  [*(id *)(*(void *)(a1 + 32) + 592) rotation];
  int v21 = 0;
  uint64_t v22 = 0;
  *(float *)&double v23 = v23;
  v48[3] = LODWORD(v23);
  uint64_t v24 = -384;
  do
  {
    uint64_t v25 = *(int *)(a3 + 4 * v22);
    uint64_t v26 = a2 + v24;
    *(void *)(v26 + 384) = *(void *)(*(void *)(a1 + 32) + 560);
    *(void *)(v26 + 392) = 0x431C0000446EC000;
    [*(id *)(a1 + 32) textureSizeForDigit:v25];
    *(void *)(v26 + 400) = v27;
    [*(id *)(a1 + 32) textureOriginForDigit:v25];
    *(void *)(v26 + 408) = v28;
    v29 = *(float32x2_t **)(a1 + 32);
    double v30 = dbl_99E8[v22];
    float v31 = v29[20].f32[0];
    double v32 = COERCE_DOUBLE(vmul_f32(v29[70], vmla_n_f32(vmul_n_f32((float32x2_t)v49[v22], v31), *(float32x2_t *)&v30, 1.0 - v31)));
    LODWORD(v30) = v29[71].i32[0];
    *(float *)&double v33 = (float)(v31 * *(float *)&v48[v22]) + (float)((float)(1.0 - v31) * -0.17453);
    *(float *)&double v34 = (float)((float)(1 - (v21 & 2)) * flt_99BC[v25]) + 0.0;
    id result = [(float32x2_t *)v29 createMatrixForTextureWithSize:*(double *)(a2 + v24 + 400) translation:v32 scale:v30 rotate:v33 xOffset:v34];
    *(_DWORD *)(v26 + 424) = v36;
    *(void *)(v26 + 416) = v37;
    *(_DWORD *)(v26 + 440) = v38;
    *(_DWORD *)(v26 + 428) = 0;
    *(void *)(v26 + 432) = v39;
    *(_DWORD *)(v26 + 444) = 0;
    *(_DWORD *)(v26 + 456) = v40;
    *(void *)(v26 + 448) = v41;
    *(_DWORD *)(v26 + 460) = 0;
    ++v22;
    v21 += 2;
    *(float *)(v26 + 464) = a4;
    v24 += 96;
  }
  while (v24);
  return result;
}

intptr_t sub_6DA4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 168));
}

void sub_7168(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 screenBounds];
  double v4 = v3;
  [v2 screenScale];
  double v6 = v5;

  qword_11320 = 0x6400000010;
  dword_11328 = (int)(v6 * v4) / 16;
  unk_1132C = 4;
}

void sub_71E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_7200(void *a1)
{
  __float2 v1 = [a1 description];
  sub_71E0(&dword_0, v2, v3, "Failed to create lilypad render pipeline with error: %@", v4, v5, v6, v7, 2u);
}

void sub_7288(void *a1)
{
  __float2 v1 = [a1 description];
  sub_71E0(&dword_0, v2, v3, "Failed to create lilypad compute pipeline with error: %@", v4, v5, v6, v7, 2u);
}

void sub_7310(void *a1)
{
  __float2 v1 = [a1 description];
  sub_71E0(&dword_0, v2, v3, "Failed to create lilypad time pipeline with error: %@", v4, v5, v6, v7, 2u);
}

void sub_7398()
{
  __assert_rtn("-[NTKLilypadQuad textureOriginForDigit:]", "NTKLilypadQuad.m", 376, "digit >= 0 && digit <= 9");
}

void sub_73C4()
{
  __assert_rtn("-[NTKLilypadQuad textureSizeForDigit:]", "NTKLilypadQuad.m", 381, "digit >= 0 && digit <= 9");
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t CLKClockTimerDateConvertTo12Hour()
{
  return _CLKClockTimerDateConvertTo12Hour();
}

uint64_t CLKClockTimerDateForDate()
{
  return _CLKClockTimerDateForDate();
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKLocaleIs24HourMode()
{
  return _CLKLocaleIs24HourMode();
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return _CLKUIConvertToRGBfFromSRGBf_fast();
}

uint64_t CLKUIConvertUIImageToMTLTexture()
{
  return _CLKUIConvertUIImageToMTLTexture();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NTKGizmoOrCompanionAreRussian()
{
  return _NTKGizmoOrCompanionAreRussian();
}

uint64_t NTKHighPriorityApply()
{
  return _NTKHighPriorityApply();
}

uint64_t NTKHomeDirectory()
{
  return _NTKHomeDirectory();
}

uint64_t NTKIdealizedDate()
{
  return _NTKIdealizedDate();
}

uint64_t NTKIsScreenOn()
{
  return _NTKIsScreenOn();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_double2 _simd_exp_d2(simd_double2 x)
{
  return __simd_exp_d2(x);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

uint64_t pnoise2()
{
  return _pnoise2();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

uint64_t snoise4()
{
  return _snoise4();
}

id objc_msgSend__activeClearColorForCurrentColorMode(void *a1, const char *a2, ...)
{
  return [a1 _activeClearColorForCurrentColorMode];
}

id objc_msgSend__createPhysicsWorld(void *a1, const char *a2, ...)
{
  return [a1 _createPhysicsWorld];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__loadSnapshotContentViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSnapshotContentViews];
}

id objc_msgSend__resetTimeBodiesToDefaultPositions(void *a1, const char *a2, ...)
{
  return [a1 _resetTimeBodiesToDefaultPositions];
}

id objc_msgSend__startClockTimer(void *a1, const char *a2, ...)
{
  return [a1 _startClockTimer];
}

id objc_msgSend__stopClockTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopClockTimer];
}

id objc_msgSend__updateLocale(void *a1, const char *a2, ...)
{
  return [a1 _updateLocale];
}

id objc_msgSend__updatePausedState(void *a1, const char *a2, ...)
{
  return [a1 _updatePausedState];
}

id objc_msgSend__updateTime(void *a1, const char *a2, ...)
{
  return [a1 _updateTime];
}

id objc_msgSend__wallBodies(void *a1, const char *a2, ...)
{
  return [a1 _wallBodies];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_angularVelocity(void *a1, const char *a2, ...)
{
  return [a1 angularVelocity];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return [a1 backgroundStyle];
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

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return [a1 colorPixelFormat];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
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

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
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

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return [a1 gravity];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_loadTextures(void *a1, const char *a2, ...)
{
  return [a1 loadTextures];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderPassDescriptor(void *a1, const char *a2, ...)
{
  return [a1 renderPassDescriptor];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetStartTime(void *a1, const char *a2, ...)
{
  return [a1 resetStartTime];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return [a1 rotation];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return [a1 rotationRate];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
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

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_swatchStyle(void *a1, const char *a2, ...)
{
  return [a1 swatchStyle];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeOffset(void *a1, const char *a2, ...)
{
  return [a1 timeOffset];
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return [a1 userAcceleration];
}

id objc_msgSend_velocity(void *a1, const char *a2, ...)
{
  return [a1 velocity];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}