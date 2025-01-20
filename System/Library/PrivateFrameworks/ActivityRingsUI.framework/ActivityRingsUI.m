BOOL ARUIFloatLess(float a1, float a2)
{
  return (float)(a1 - a2) < 0.0001;
}

void sub_21E1652F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id arui_rings_log()
{
  if (arui_rings_log_onceToken != -1) {
    dispatch_once(&arui_rings_log_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)arui_rings_log___logger;

  return v0;
}

float ARUISaturate(float a1)
{
  return fmaxf(fminf(a1, 1.0), 0.0);
}

float ARUIMix(float a1, float a2, float a3)
{
  return a1 + (float)(a3 * (float)(a2 - a1));
}

double matrix_float4x4_translation()
{
  return *(double *)&_PromotedConst_1;
}

BOOL ARUIFloatGreater(float a1, float a2)
{
  return (float)(a1 - a2) > 0.0001;
}

double matrix_float4x4_zRotation_and_translation(float a1, double a2)
{
  *(double *)v2.i64 = a2;
  int32x2_t v4 = vcgt_f32((float32x2_t)vdup_n_s32(0x38D1B717u), vabs_f32(*(float32x2_t *)v2.f32));
  if (vand_s8((int8x8_t)v4, (int8x8_t)vdup_lane_s32(v4, 1)).u8[0])
  {
    long long v5 = *MEMORY[0x263EF89A8];
    long long v6 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    long long v7 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v2 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  }
  else
  {
    v2.i32[2] = 0;
    v2.i32[3] = 1.0;
    long long v7 = xmmword_21E189860;
    long long v5 = xmmword_21E189870;
    long long v6 = xmmword_21E189850;
  }
  if (fabsf(a1) >= 0.0001)
  {
    float32x4_t v16 = (float32x4_t)v5;
    float32x4_t v17 = v2;
    float32x4_t v14 = (float32x4_t)v6;
    float32x4_t v15 = (float32x4_t)v7;
    *(double *)&long long v8 = matrix_float4x4_rotation((float32x4_t)xmmword_21E189860, a1);
    uint64_t v9 = 0;
    v18[0] = v8;
    v18[1] = v10;
    v18[2] = v11;
    v18[3] = v12;
    memset(v19, 0, sizeof(v19));
    do
    {
      v19[v9] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(v18[v9])), v14, *(float32x2_t *)&v18[v9], 1), v15, (float32x4_t)v18[v9], 2), v17, (float32x4_t)v18[v9], 3);
      ++v9;
    }
    while (v9 != 4);
    *(void *)&long long v5 = *(void *)&v19[0];
  }
  return *(double *)&v5;
}

void sub_21E167E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E1684C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E168A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E168BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E169518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E16A188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL ARUIFloatEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.0001;
}

void sub_21E16AFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  if (v15) {
    objc_destroyWeak(v14);
  }
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E16B79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E16B9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E16C530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E16D954(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E16DA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E16DBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E16DD80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E16DF14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

BOOL ARUIFloat2Equal(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return fabsf(v2.f32[0]) < 0.0001 && fabsf(v2.f32[1]) < 0.0001;
}

void sub_21E16E0D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E16E268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E16E3F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E16E580(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id ActivityRingsUIFrameworkBundle()
{
  v0 = (void *)ActivityRingsUIFrameworkBundle___ARUIClassBundle;
  if (!ActivityRingsUIFrameworkBundle___ARUIClassBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v2 = (void *)ActivityRingsUIFrameworkBundle___ARUIClassBundle;
    ActivityRingsUIFrameworkBundle___ARUIClassBundle = v1;

    v0 = (void *)ActivityRingsUIFrameworkBundle___ARUIClassBundle;
  }

  return v0;
}

uint64_t __arui_rings_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ActivityRingsUI", "rings");
  uint64_t v1 = arui_rings_log___logger;
  arui_rings_log___logger = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

void freeData(int a1, void *a2)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

__CFString *NSStringFromARUICelebrationType()
{
  return @"sparks";
}

void sub_21E172138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21E172288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E1744B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E1747DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21E17493C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_21E174B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E174D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return NSRequestConcreteImplementation();
}

double blend(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double clamp(double result, double a2, double a3)
{
  if (a3 >= result) {
    result = a3;
  }
  if (result > a2) {
    return a2;
  }
  return result;
}

BOOL ARUIFloatGreaterEqual(float a1, float a2)
{
  return (float)(a1 - a2) > -0.0001;
}

BOOL ARUIFloat2Greater(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return v2.f32[0] > 0.0001 && v2.f32[1] > 0.0001;
}

BOOL ARUIFloat2GreaterEqual(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return v2.f32[0] > -0.0001 && v2.f32[1] > -0.0001;
}

BOOL ARUIFloat2Less(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2 = vsub_f32(a1, a2);
  return v2.f32[0] < 0.0001 && v2.f32[1] < 0.0001;
}

float32x2_t ARUIFloat2Saturate(float32x2_t a1)
{
  __asm { FMOV            V1.2S, #1.0 }
  return vmaxnm_f32(vminnm_f32(a1, _D1), 0);
}

BOOL ARUICGFloatEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

BOOL ARUICGFloatGreater(double a1, double a2)
{
  return a1 - a2 > 0.001;
}

BOOL ARUICGFloatLess(double a1, double a2)
{
  return a1 - a2 < 0.001;
}

float ARUIClip(float a1, float a2, float a3)
{
  return fmaxf(a2, fminf(a1, a3));
}

float ARUIMixVector(double a1, float a2)
{
  return vmlas_n_f32(*(float *)&a1, a2, vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 1), *(float32x2_t *)&a1).f32[0]);
}

float ARUIPercent(float a1, float a2, float a3)
{
  float result = 1.0;
  if (vabds_f32(a2, a3) >= 0.0001) {
    return (float)(a1 - a2) / (float)(a3 - a2);
  }
  return result;
}

float ARUIRandomFloat(float a1, float a2)
{
  return a1 + (float)((float)((float)(arc4random() & 0x7FFFFFFF) * 4.6566e-10) * (float)(a2 - a1));
}

double ARUIRandomCGFloat(double a1, double a2)
{
  return a1 + (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * (a2 - a1);
}

float32x2_t ARUIRandomFloat2(double a1, float a2)
{
  float v7 = a2 - *(float *)&a1;
  uint32_t v2 = arc4random();
  uint32_t v3 = arc4random();
  v4.i32[0] = v2 & 0x7FFFFFFF;
  v4.i32[1] = v3 & 0x7FFFFFFF;
  return vmla_n_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 0), vmul_f32(vcvt_f32_u32(v4), (float32x2_t)0x3000000030000000), v7);
}

uint64_t ARUIRandomInt(int a1, int a2)
{
  return arc4random() % (a2 - a1 + 1) + a1;
}

double ARUIDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

uint64_t ARUIRandomNSUInt(uint64_t a1, uint64_t a2)
{
  return arc4random() % (unint64_t)(a2 - a1) + a1;
}

double ARUIScreenBlend(float32x4_t a1, float32x4_t a2)
{
  __asm { FMOV            V2.4S, #1.0 }
  *(void *)&double result = vmlsq_f32(_Q2, vsubq_f32(_Q2, a2), vsubq_f32(_Q2, a1)).u64[0];
  return result;
}

double matrix_float4x4_scale_y()
{
  return *(double *)&_PromotedConst;
}

double matrix_float4x4_rotation(float32x4_t a1, float a2)
{
  __float2 v2 = __sincosf_stret(a2);
  _D4 = *(float32x2_t *)a1.f32;
  __asm { FMLS            S2, S4, V4.S[0] }
  _S5 = a1.u32[1];
  float v10 = vmuls_lane_f32(_D4.f32[0], _D4, 1);
  _S16 = a1.u32[2];
  _Q21 = a1;
  _D4.i32[0] = vmlas_n_f32(v2.__cosval * _S2, _D4.f32[0], _D4.f32[0]);
  _D4.f32[1] = -(float)(vmuls_lane_f32(v2.__sinval, a1, 2) - (float)(v10 * (float)(1.0 - v2.__cosval)));
  __asm
  {
    FMLS            S6, S5, V21.S[1]
    FMLA            S6, S5, V21.S[1]
    FMLS            S3, S16, V21.S[2]
    FMLA            S1, S16, V21.S[2]
  }
  return *(double *)&_D4;
}

double matrix_float2x2_rotation(float a1)
{
  __float2 v1 = __sincosf_stret(a1);
  return COERCE_DOUBLE(__PAIR64__(LODWORD(v1.__sinval), LODWORD(v1.__cosval)));
}

id __ARUIColorForCurrentContrastMode_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accessibilityContrast];
  uint64_t v4 = 40;
  if (v3 == 1) {
    uint64_t v4 = 32;
  }
  long long v5 = *(void **)(a1 + v4);

  return v5;
}

uint64_t sub_21E17F4B0()
{
  return 0;
}

id SparksCelebration.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id SparksCelebration.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_duration] = 0x4014000000000000;
  type metadata accessor for Sparks();
  id v1 = v0;
  *(void *)&v1[OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene] = sub_21E18202C();

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SparksCelebration();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SparksCelebration()
{
  return self;
}

uint64_t sub_21E17F660(void *a1, id a2)
{
  long long v5 = *(void **)(v2 + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene);
  objc_msgSend(a2, sel_screenScale);
  unsigned int v29 = v6;
  objc_msgSend(a1, sel_translation);
  unsigned int v28 = v7;
  objc_msgSend(a2, sel_drawableSize);
  unsigned int v27 = v8;
  objc_msgSend(a2, sel_screenScale);
  unsigned int v25 = v9;
  objc_msgSend(a1, sel_translation);
  unsigned int v26 = v10;
  objc_msgSend(a2, sel_drawableSize);
  float32x2_t v12 = vdiv_f32(vmul_f32(vmul_f32((float32x2_t)__PAIR64__(v25, v29), (float32x2_t)0xC000000040000000), (float32x2_t)__PAIR64__(v26, v28)), (float32x2_t)__PAIR64__(v11, v27));
  objc_msgSend(a1, sel_scale);
  float v14 = v13;
  objc_msgSend(a2, sel_screenScale);
  float v16 = v14 * v15;
  objc_msgSend(a1, sel_diameter);
  float v18 = v16 * v17;
  objc_msgSend(a2, sel_drawableSize);
  float v20 = 1.25 / (float)(v18 / v19);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v5;
  *(float *)(v21 + 24) = v20;
  *(float32x2_t *)(v21 + 32) = v12;
  *(void *)(v21 + 40) = a1;
  id v22 = v5;
  id v23 = a1;
  sub_21E185E80();

  return swift_release();
}

uint64_t sub_21E17F800(double a1, double a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28998);
  sub_21E185E30();
  sub_21E185EC0();
  if (!v17.i64[1])
  {
    sub_21E18018C((uint64_t)&v16);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D289A8);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_21E189BC0;
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    unint64_t v8 = 0xD000000000000029;
    unint64_t v9 = 0x800000021E18ACA0;
    goto LABEL_11;
  }
  sub_21E185E90();
  if (v21)
  {
    type metadata accessor for simd_float4x4();
    if (swift_dynamicCast())
    {
      sub_21E185E90();
      if (swift_dynamicCast())
      {
        v22.columns[0] = (simd_float4)v16;
        v22.columns[1] = (simd_float4)v17;
        v22.columns[2] = (simd_float4)v18;
        v22.columns[3] = (simd_float4)v19;
        simd_float4x4 v23 = __invert_f4(v22);
        float32x4_t v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[0].f32[0]), v17, *(float32x2_t *)v23.columns[0].f32, 1), v18, (float32x4_t)v23.columns[0], 2), v19, (float32x4_t)v23.columns[0], 3);
        v23.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[1].f32[0]), v17, *(float32x2_t *)v23.columns[1].f32, 1), v18, (float32x4_t)v23.columns[1], 2), v19, (float32x4_t)v23.columns[1], 3);
        float32x4_t v12 = (float32x4_t)v23.columns[1];
        v23.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[2].f32[0]), v17, *(float32x2_t *)v23.columns[2].f32, 1), v18, (float32x4_t)v23.columns[2], 2), v19, (float32x4_t)v23.columns[2], 3);
        float32x4_t v13 = (float32x4_t)v23.columns[2];
        float32x4_t v14 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[3].f32[0]), v17, *(float32x2_t *)v23.columns[3].f32, 1), v18, (float32x4_t)v23.columns[3], 2), v19, (float32x4_t)v23.columns[3], 3);
        v23.columns[0] = (simd_float4)v11;
        v23.columns[3] = (simd_float4)v14;
        simd_float4x4 v24 = __invert_f4(v23);
        float32x4_t v2 = vaddq_f32(v14, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v20.f32[0]), v12, *(float32x2_t *)v20.f32, 1), v13, v20, 2));
        v24.columns[0] = (simd_float4)vaddq_f32((float32x4_t)v24.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v24.columns[0], *(float *)&a2), (float32x4_t)v24.columns[1], *(float32x2_t *)&a2, 1), (float32x4_t)v24.columns[2], vdivq_f32(v2, (float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 3)), 2));
        v24.columns[2] = (simd_float4)vdupq_laneq_s32((int32x4_t)v24.columns[0], 3);
        *(float32x2_t *)v24.columns[3].f32 = vdiv_f32(*(float32x2_t *)v24.columns[0].f32, *(float32x2_t *)v24.columns[2].f32);
        v24.columns[3].i64[1] = __PAIR64__(vextq_s8(*(int8x16_t *)&v24, *(int8x16_t *)&v24, 8uLL).u32[1], vdivq_f32(*(float32x4_t *)&v24, *(float32x4_t *)(&v24 + 32)).u32[2]);
        float32x4_t v16 = (float32x4_t)v24.columns[3];
        MEMORY[0x270FA5388](v3);
        sub_21E185E30();
        uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D289B0);
        MEMORY[0x270FA5388](v4);
        uint64_t v5 = sub_21E185E30();
        MEMORY[0x270FA5388](v5);
        sub_21E185E30();
        sub_21E185E30();
        sub_21E185E30();
        sub_21E185E30();
        sub_21E185E30();
        return sub_21E185E30();
      }
    }
  }
  else
  {
    sub_21E18018C((uint64_t)&v20);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D289A8);
  uint64_t v7 = swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8D310];
  *(_OWORD *)(v7 + 16) = xmmword_21E189BC0;
  *(void *)(v7 + 56) = v10;
  unint64_t v8 = 0x72656D6163206F4ELL;
  unint64_t v9 = 0xE900000000000061;
LABEL_11:
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  sub_21E185F80();
  return swift_bridgeObjectRelease();
}

unsigned char *sub_21E17FF6C(unsigned char *result)
{
  *double result = 0;
  return result;
}

unsigned char *sub_21E17FF74(unsigned char *result)
{
  *double result = 1;
  return result;
}

_DWORD *sub_21E17FF80(_DWORD *result)
{
  *double result = 1069547520;
  return result;
}

_DWORD *sub_21E17FF8C(_DWORD *result)
{
  *double result = 1067450368;
  return result;
}

_DWORD *sub_21E17FF98(_DWORD *result)
{
  *double result = 1008981770;
  return result;
}

id SparksCelebration.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SparksCelebration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SparksCelebration(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SparksCelebration);
}

uint64_t sub_21E1800E0()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_21E180120(double a1)
{
  LODWORD(a1) = *(_DWORD *)(v1 + 24);
  return sub_21E17F800(a1, *(double *)(v1 + 32));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

float sub_21E180178(_OWORD *a1)
{
  *(void *)&long long v2 = 0;
  *((void *)&v2 + 1) = *(unsigned int *)(v1 + 16);
  *a1 = v2;
  return *(float *)&v2;
}

uint64_t sub_21E18018C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D289A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for simd_float4x4()
{
  if (!qword_267D289B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267D289B8);
    }
  }
}

float sub_21E180244(uint64_t a1)
{
  long long v2 = *(_OWORD *)*(void *)(v1 + 16);
  *((void *)&v2 + 1) = *(unsigned int *)(a1 + 8);
  *(_OWORD *)a1 = v2;
  return *(float *)&v2;
}

id sub_21E180260(_OWORD *a1)
{
  return sub_21E1802A0(a1, (SEL *)&selRef_topColorVector);
}

id sub_21E180280(_OWORD *a1)
{
  return sub_21E1802A0(a1, (SEL *)&selRef_bottomColorVector);
}

id sub_21E1802A0(_OWORD *a1, SEL *a2)
{
  uint64_t v5 = *(void **)(v2 + 16);
  [v5 *a2];
  unsigned int v14 = v6;
  [v5 *a2];
  unsigned int v13 = v7;
  [v5 *a2];
  unsigned int v12 = v8;
  id result = [v5 *a2];
  *(void *)&long long v10 = __PAIR64__(v13, v14);
  *((void *)&v10 + 1) = __PAIR64__(v11, v12);
  *a1 = v10;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SpringAnimation.SpringAnimationState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_21E180380(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21E1803A0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 64) = v3;
  return result;
}

double sub_21E1803EC()
{
  return *(double *)(v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
}

uint64_t sub_21E18047C()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) & 1) == 0)
  {
    uint64_t result = sub_21E185F30();
    __break(1u);
  }
  return result;
}

id SpringAnimation.__allocating_init(initialValue:delay:)(double a1, double a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  unsigned int v6 = &v5[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState];
  *(double *)unsigned int v6 = a1;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_OWORD *)(v6 + 24) = 0u;
  v6[40] = 0;
  *(double *)&v5[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay] = a2;
  *(double *)&v5[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay] = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id SpringAnimation.init(initialValue:delay:)(double a1, double a2)
{
  char v3 = &v2[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState];
  *(double *)char v3 = a1;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  v3[40] = 0;
  *(double *)&v2[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay] = a2;
  *(double *)&v2[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay] = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for SpringAnimation();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SpringAnimation()
{
  return self;
}

void sub_21E180684(double a1, double a2, double a3)
{
  uint64_t v4 = v3 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  *(double *)(v4 + 16) = a1;
  *(double *)(v4 + 24) = a2;
  *(double *)(v4 + 32) = a3;
  *(unsigned char *)(v4 + 40) = 1;
}

uint64_t sub_21E1806C4(double a1)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40))
  {
    *(double *)(v2 + 32) = a1;
    *(unsigned char *)(v2 + 40) = 1;
  }
  else
  {
    uint64_t result = sub_21E185F30();
    __break(1u);
  }
  return result;
}

uint64_t sub_21E1807D4(double a1)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) & 1) == 0)
  {
    uint64_t result = sub_21E185F30();
    __break(1u);
    return result;
  }
  double v4 = *(double *)(v2 + 32);
  double v5 = *(double *)(v2 + 24);
  double v6 = *(double *)v2;
  double v7 = *(double *)(v2 + 8);
  if (*(double *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay) <= 0.001
    || (double v8 = *(double *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay), v8 <= 0.001))
  {
    if (vabdd_f64(v6, v4) < 0.001 && fabs(v7) < 0.001) {
      return 0;
    }
    double v11 = v6 - v4;
    double v12 = sqrt(*(double *)(v2 + 16));
    double v13 = v5 * 0.5;
    if (v12 - v5 * 0.5 <= 0.001)
    {
      if (v13 - v12 <= 0.001)
      {
        long double v29 = exp(-(v13 * a1));
        double v30 = v7 + v13 * v11;
        double v31 = v11 + v30 * a1;
        double v19 = v29 * v31;
        double v28 = v29 * v30 - v29 * v13 * v31;
        goto LABEL_18;
      }
      double v22 = sqrt(v13 * v13 - v12 * v12);
      double v23 = exp(-(v13 * a1));
      long double v24 = v22 * a1;
      double v32 = cosh(v24);
      double v25 = (v7 + v13 * v11) / v22;
      long double v26 = sinh(v24);
      long double v27 = v11 * v32 + v25 * v26;
      double v19 = v23 * v27;
      double v20 = v23 * (v22 * (v25 * v32) + v22 * (v11 * v26));
      double v21 = v23 * v13 * v27;
    }
    else
    {
      double v14 = sqrt(v12 * v12 - v13 * v13);
      double v15 = exp(-(v13 * a1));
      __double2 v16 = __sincos_stret(v14 * a1);
      double v17 = (v7 + v13 * v11) / v14;
      double v18 = v11 * v16.__cosval + v17 * v16.__sinval;
      double v19 = v15 * v18;
      double v20 = v15 * (v14 * (v17 * v16.__cosval) - v14 * (v11 * v16.__sinval));
      double v21 = v15 * v13 * v18;
    }
    double v28 = v20 - v21;
LABEL_18:
    if (vabdd_f64(v19 + v4, v4) >= 0.001) {
      *(double *)uint64_t v2 = v19 + v4;
    }
    else {
      *(double *)uint64_t v2 = v4;
    }
    *(double *)(v2 + 8) = v28;
    uint64_t result = 1;
    *(unsigned char *)(v2 + 40) = 1;
    return result;
  }
  double v9 = v8 - a1;
  if (v8 - a1 > 1.0) {
    double v9 = 1.0;
  }
  if (v9 < 0.0) {
    double v9 = 0.0;
  }
  *(double *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay) = v9;
  return 1;
}

void sub_21E180AB0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) == 1)
  {
    *(void *)uint64_t v1 = *(void *)(v1 + 32);
    *(void *)(v1 + 8) = 0;
    *(unsigned char *)(v1 + 40) = 1;
  }
}

id SpringAnimation.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void SpringAnimation.init()()
{
}

id SpringAnimation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpringAnimation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SpringAnimation(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SpringAnimation);
}

uint64_t dispatch thunk of SpringAnimation.value.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SpringAnimation.target.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SpringAnimation.__allocating_init(initialValue:delay:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of SpringAnimation.configure(tension:friction:target:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SpringAnimation.updateTarget(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SpringAnimation.advanceWith(deltaTime:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SpringAnimation.completeWithSnap()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SpringAnimation.SpringAnimationState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SpringAnimation.SpringAnimationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_21E180DE0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_21E180DEC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpringAnimation.SpringAnimationState()
{
  return &type metadata for SpringAnimation.SpringAnimationState;
}

uint64_t sub_21E180E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_21E180E10()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21E180EA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  uint64_t v10 = v7 + v8;
  unint64_t v11 = ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *int v4 = *a2;
    int v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    double v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, v5);
    unint64_t v16 = ((unint64_t)a2 + v10) & v9;
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)v16, v5);
    v15((uint64_t *)((v10 + (((unint64_t)v4 + v10) & v9)) & v9), (uint64_t *)((v10 + v16) & v9), v5);
  }
  return v4;
}

uint64_t sub_21E180FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(a1, v3);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v4 + 64) + v5;
  uint64_t v7 = (v6 + a1) & ~v5;
  v9(v7, v3);

  return ((uint64_t (*)(uint64_t, uint64_t))v9)((v6 + v7) & ~v5, v3);
}

uint64_t sub_21E1810A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v6 + 64) + v8;
  uint64_t v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_21E181168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v6 + 64) + v8;
  uint64_t v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_21E18122C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v6 + 64) + v8;
  uint64_t v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_21E1812F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = *(void *)(v6 + 64) + v8;
  uint64_t v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_21E1813B4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v8 = ((v6
       + *(unsigned __int8 *)(v4 + 80)
       + ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
     + v6;
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v12 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v8 | v12) + 1;
}

void sub_21E181528(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64)
       + *(unsigned __int8 *)(v6 + 80)
       + ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x21E181758);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for SpringConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21E181798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_21E1817A0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21E181830(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = ~v8;
  uint64_t v10 = v7 + v8;
  unint64_t v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    int v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, v5);
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)(((unint64_t)a2 + v10) & v9), v5);
  }
  return v4;
}

uint64_t sub_21E18193C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8) + 8;
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))v6;
  (*(void (**)(uint64_t, uint64_t))v6)(a1, v3);
  unint64_t v4 = (*(void *)(v6 + 56) + a1 + *(unsigned __int8 *)(v6 + 72)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 72);

  return v7(v4, v3);
}

unint64_t sub_21E1819D8(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  uint64_t v8 = v6 + 16;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), (*(void *)(v8 + 48) + *(unsigned __int8 *)(v8 + 64) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64), v5);
  return a1;
}

unint64_t sub_21E181A6C(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24);
  uint64_t v8 = v6 + 24;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), (*(void *)(v8 + 40) + *(unsigned __int8 *)(v8 + 56) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 56), v5);
  return a1;
}

unint64_t sub_21E181B00(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32);
  uint64_t v8 = v6 + 32;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), (*(void *)(v8 + 32) + *(unsigned __int8 *)(v8 + 48) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 48), v5);
  return a1;
}

unint64_t sub_21E181B94(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 40);
  uint64_t v8 = v6 + 40;
  v7(a1, a2, v5);
  v7((*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), (*(void *)(v8 + 24) + *(unsigned __int8 *)(v8 + 40) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 40), v5);
  return a1;
}

uint64_t sub_21E181C28(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  uint64_t v8 = ((v6 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)) + v6;
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v12 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v8 | v12) + 1;
}

void sub_21E181D94(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = ((*(void *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x21E181FBCLL);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for SpringAnimation.SpringState()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void *sub_21E18202C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B20);
  ((void (*)(void))MEMORY[0x270FA5388])();
  objc_super v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_21E185D50();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unsigned int v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  BOOL v9 = (char *)&v14 - v8;
  sub_21E1830FC((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_21E1852E0((uint64_t)v2);
    unsigned int v10 = (void *)sub_21E185E10();
    sub_21E185340();
    swift_allocError();
    *int v11 = 0x762E736B72617053;
    v11[1] = 0xEA00000000007866;
    (*(void (**)(void *, void, void *))(*(v10 - 1) + 104))(v11, *MEMORY[0x263F845E8], v10);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    unsigned int v10 = objc_allocWithZone((Class)sub_21E185ED0());
    uint64_t v12 = sub_21E185E20();
    if (!v0) {
      unsigned int v10 = (void *)v12;
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

uint64_t sub_21E1822A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B10);
  sub_21E185E70();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21E189CE0;
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  sub_21E185E40();
  uint64_t result = sub_21E185E40();
  off_267D28AD8 = (_UNKNOWN *)v0;
  return result;
}

void *__vfx_script_Sparks_graph_42(uint64_t a1)
{
  return sub_21E1827E4(a1, (uint64_t (*)(uint64_t, __n128))sub_21E1846A8);
}

void *sub_21E18262C(uint64_t a1)
{
  return sub_21E1827E4(a1, (uint64_t (*)(uint64_t, __n128))sub_21E1846A8);
}

void *__vfx_script_Sparks_graph_14(uint64_t a1)
{
  return sub_21E182B44(a1, (uint64_t (*)(uint64_t, __n128))sub_21E1836EC);
}

void *sub_21E182670(uint64_t a1)
{
  return sub_21E182B44(a1, (uint64_t (*)(uint64_t, __n128))sub_21E1836EC);
}

void *sub_21E18268C(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v1 = v1;
  dword_267D28AE8 = LODWORD(v1);
  sub_21E185DC0();
  dword_267D28AEC = v2;
  uint64_t result = (void *)sub_21E185E00();
  uint64_t v4 = (float *)result[1];
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = (float *)result[2];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v6 = (float *)result[3];
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unsigned int v7 = (float *)result[4];
  if (v7)
  {
    float v8 = *v4 * *v5;
    float v9 = (float)(v8 * 0.02) / 5.0;
    float v10 = (float)(v8 * 0.03) / 5.0;
    float v11 = (float)(v8 * 0.1) / 5.0;
    float v12 = (float)(v8 * 0.2) / 5.0;
    *uint64_t v6 = fminf(v9, v10);
    v6[1] = fmaxf(v9, v10);
    *unsigned int v7 = fminf(v11, v12);
    v7[1] = fmaxf(v11, v12);
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t __vfx_script_Sparks_graph_1(uint64_t a1)
{
  return sub_21E182CA4(a1);
}

void *__vfx_script_Sparks_graph_2(uint64_t a1)
{
  return sub_21E1827E4(a1, (uint64_t (*)(uint64_t, __n128))sub_21E1848D8);
}

void *sub_21E1827CC(uint64_t a1)
{
  return sub_21E1827E4(a1, (uint64_t (*)(uint64_t, __n128))sub_21E1848D8);
}

void *sub_21E1827E4(uint64_t a1, uint64_t (*a2)(uint64_t, __n128))
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v3 = v3;
  dword_267D28AE8 = LODWORD(v3);
  sub_21E185DC0();
  dword_267D28AEC = v4;
  uint64_t result = (void *)sub_21E185E00();
  if (!result[1])
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v6 = (__n128 *)result[2];
  if (!v6)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!result[3])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!result[4])
  {
LABEL_11:
    __break(1u);
    return result;
  }
  __n128 v7 = *v6;

  return (void *)a2(a1, v7);
}

void *sub_21E182894(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v2 = v2;
  dword_267D28AE8 = LODWORD(v2);
  sub_21E185DC0();
  dword_267D28AEC = v3;
  uint64_t result = (void *)sub_21E185E00();
  uint64_t v5 = (float *)result[1];
  if (!v5)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v6 = (float *)result[2];
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  __n128 v7 = (uint64_t *)result[3];
  if (!v7)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  float v8 = *v5;
  float v9 = *v6;

  return (void *)sub_21E1837CC(v8, v9, a1, v7);
}

void *sub_21E182928(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v1 = v1;
  dword_267D28AE8 = LODWORD(v1);
  sub_21E185DC0();
  dword_267D28AEC = v2;
  uint64_t result = (void *)sub_21E185E00();
  int v4 = (float *)result[1];
  if (!v4)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v5 = (int *)result[2];
  if (!v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!result[3])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v6 = result[4];
  if (!v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  __n128 v7 = (_OWORD *)result[5];
  if (!v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  float v8 = (float *)result[6];
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  float v9 = (float *)result[7];
  if (!v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  float v10 = (_DWORD *)result[8];
  if (!v10)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = (void *)result[9];
  if (result)
  {
    int v11 = *v5;
    float v12 = (float)(*v4 * 0.02) / 5.0;
    float v13 = (float)(*v4 * 0.03) / 5.0;
    float v14 = (float)(*v4 * 0.25) / 5.0;
    float v15 = (float)(*v4 * 0.4) / 5.0;
    *(_OWORD *)uint64_t v6 = xmmword_21E189CF0;
    *__n128 v7 = xmmword_21E189CF0;
    *float v8 = fminf(v12, v13);
    v8[1] = fmaxf(v12, v13);
    *float v9 = fminf(v14, v15);
    v9[1] = fmaxf(v14, v15);
    *float v10 = v11;
    uint64_t result = (void *)sub_21E185DB0();
    *(_DWORD *)(v6 + 12) = 1065353216;
    return result;
  }
LABEL_19:
  __break(1u);
  return result;
}

void *sub_21E182A74(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v1 = v1;
  dword_267D28AE8 = LODWORD(v1);
  sub_21E185DC0();
  dword_267D28AEC = v2;
  uint64_t result = (void *)sub_21E185E00();
  if (!result[1])
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!result[2])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!result[3])
  {
LABEL_9:
    __break(1u);
    return result;
  }

  return (void *)sub_21E184BB0();
}

void *__vfx_script_Sparks_graph_17(uint64_t a1)
{
  return sub_21E182B44(a1, (uint64_t (*)(uint64_t, __n128))sub_21E183940);
}

void *sub_21E182B2C(uint64_t a1)
{
  return sub_21E182B44(a1, (uint64_t (*)(uint64_t, __n128))sub_21E183940);
}

void *sub_21E182B44(uint64_t a1, uint64_t (*a2)(uint64_t, __n128))
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v3 = v3;
  dword_267D28AE8 = LODWORD(v3);
  sub_21E185DC0();
  dword_267D28AEC = v4;
  uint64_t result = (void *)sub_21E185E00();
  __n128 v7 = (unsigned __int32 *)result[1];
  if (!v7)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!result[2])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!result[3])
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v6.n128_u32[0] = *v7;

  return (void *)a2(a1, v6);
}

uint64_t sub_21E182BE8(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v1 = v1;
  dword_267D28AE8 = LODWORD(v1);
  sub_21E185DC0();
  dword_267D28AEC = v2;
  uint64_t result = sub_21E185E00();
  int v4 = *(float **)(result + 8);
  if (v4)
  {
    uint64_t v5 = *(float **)(result + 16);
    if (v5)
    {
      float v6 = (float)(*v4 * 0.01) / 3.0;
      float v7 = (float)(*v4 * 0.02) / 3.0;
      *uint64_t v5 = fminf(v6, v7);
      v5[1] = fmaxf(v6, v7);
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __vfx_script_Sparks_graph_49(uint64_t a1)
{
  return sub_21E182CA4(a1);
}

uint64_t sub_21E182CA4(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v1 = v1;
  dword_267D28AE8 = LODWORD(v1);
  sub_21E185DC0();
  dword_267D28AEC = v2;
  uint64_t result = sub_21E185E00();
  if (!*(void *)(result + 8))
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = *(void *)(result + 16);
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }

  return sub_21E185DB0();
}

void sub_21E182D20(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v2 = v2;
  dword_267D28AE8 = LODWORD(v2);
  sub_21E185DC0();
  dword_267D28AEC = v3;
  int v4 = (void *)sub_21E185E00();
  uint64_t v5 = (__n128 *)v4[1];
  if (!v5)
  {
    __break(1u);
    goto LABEL_14;
  }
  float v6 = (char *)v4[2];
  if (!v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!v4[3])
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  float v7 = (char *)v4[4];
  if (!v7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  float v8 = (__n128 *)v4[5];
  if (!v8)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  float v9 = (__n128 *)v4[6];
  if (!v9)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  float v10 = (_DWORD *)v4[7];
  if (!v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  int v11 = (float *)v4[8];
  if (!v11)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  float v12 = (float *)v4[9];
  if (!v12)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (!v4[10])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  float v13 = (float *)v4[11];
  if (v13)
  {
    sub_21E183A30(*v5, a1, *v6, *v7, v8, v9, v10, v11, v12, (_DWORD *)v4[10], v13);
    v8->n128_u32[3] = 1065353216;
    return;
  }
LABEL_23:
  __break(1u);
}

void sub_21E182E28(uint64_t a1)
{
  qword_267D28AE0 = a1;
  sub_21E185D70();
  *(float *)&double v1 = v1;
  dword_267D28AE8 = LODWORD(v1);
  sub_21E185DC0();
  dword_267D28AEC = v2;
  sub_21E185DF0();
  int v3 = (void *)sub_21E185E00();
  if (!v3[1])
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!v3[2])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!v3[3])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!v3[4])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v3[5])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v3[6])
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  if (!v3[7]) {
    goto LABEL_15;
  }
}

id sub_21E182FEC()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B20);
  MEMORY[0x270FA5388](v0 - 8);
  int v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E1830FC((uint64_t)v2);
  uint64_t v3 = sub_21E185D50();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    uint64_t v5 = (void *)sub_21E185D30();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }

  return v5;
}

uint64_t sub_21E1830FC@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for Sparks();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v4 = (void *)sub_21E185EF0();
  uint64_t v5 = (void *)sub_21E185EF0();
  id v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_21E185D40();

    uint64_t v7 = sub_21E185D50();
    float v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = a1;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = sub_21E185D50();
    float v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v9 = v12;
    uint64_t v10 = a1;
    uint64_t v11 = 1;
  }

  return v8(v10, v11, 1, v9);
}

void *sub_21E183254()
{
  swift_getObjCClassMetadata();
  uint64_t v0 = sub_21E18202C();

  return v0;
}

uint64_t sub_21E1832E0()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B20);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21E185D50();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  float v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E1830FC((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21E1852E0((uint64_t)v4);
    uint64_t v9 = sub_21E185E10();
    sub_21E185340();
    swift_allocError();
    *uint64_t v10 = 0x762E736B72617053;
    v10[1] = 0xEA00000000007866;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v9 - 8) + 104))(v10, *MEMORY[0x263F845E8], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    id v11 = objc_msgSend(objc_allocWithZone((Class)sub_21E185ED0()), sel_init);
    uint64_t v12 = sub_21E185EB0();
    if (!v0) {
      uint64_t v1 = v12;
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v1;
}

id sub_21E183530()
{
  uint64_t v0 = (void *)sub_21E1832E0();

  return v0;
}

id sub_21E1835B4()
{
  sub_21E1852A4(0, &qword_267D28B18);
  uint64_t v0 = (void *)sub_21E185F10();

  return v0;
}

id sub_21E183604()
{
  sub_21E184EDC();
  sub_21E1852A4(0, &qword_267D28B00);
  uint64_t v0 = (void *)sub_21E185EE0();
  swift_bridgeObjectRelease();

  return v0;
}

id sub_21E18367C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Sparks();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __vfx_get_effect_class_Sparks()
{
  type metadata accessor for Sparks();

  return swift_getObjCClassFromMetadata();
}

uint64_t __vfx_get_effect_class_Sparks()()
{
  return type metadata accessor for Sparks();
}

float sub_21E1836EC(float a1, uint64_t a2, float *a3, float *a4)
{
  sub_21E185D70();
  *(float *)&double v7 = v7;
  float v8 = *(float *)&v7 - a1;
  sub_21E185D80();
  sub_21E185DA0();
  float v10 = v9;
  sub_21E185D90();
  float result = v10 * 2222.0;
  *a3 = v10 * 2222.0;
  *a4 = fminf(fmaxf(1.0 - fminf(fmaxf((float)(v8 + -2.8) / 1.2, 0.0), 1.0), 0.0), 1.0);
  return result;
}

uint64_t sub_21E1837CC(float a1, float a2, uint64_t a3, uint64_t *a4)
{
  sub_21E185D70();
  *(float *)&double v7 = v7;
  float v8 = *(float *)&v7 - a2;
  sub_21E185D80();
  sub_21E185DA0();
  sub_21E185D90();
  sub_21E185DC0();
  float v10 = v9;
  sub_21E185D80();
  uint64_t result = sub_21E185DA0();
  float v13 = (float)(a1 * 2000.0)
      * (float)((float)(v10 * v12) * fminf(fmaxf(1.0 - fminf(fmaxf((float)(v8 + -2.8) / 1.7, 0.0), 1.0), 0.0), 1.0));
  if ((~LODWORD(v13) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v13 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v13 < 9.2234e18)
  {
    uint64_t v14 = (uint64_t)v13;
    uint64_t result = sub_21E185D90();
    *a4 = v14;
    a4[1] = v14;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

float sub_21E183940(float a1, uint64_t a2, float *a3, float *a4)
{
  sub_21E185D70();
  *(float *)&double v7 = v7;
  float v8 = *(float *)&v7 - a1;
  sub_21E185D80();
  sub_21E185DA0();
  float v10 = v9;
  sub_21E185D90();
  float result = (float)(v10 * 3333.0) + 1111.0;
  *a3 = result;
  *a4 = fminf(fmaxf(1.0 - fminf(fmaxf((float)(v8 + -2.8) / 1.2, 0.0), 1.0), 0.0), 1.0);
  return result;
}

__n128 sub_21E183A30(__n128 a1, uint64_t a2, char a3, char a4, __n128 *a5, __n128 *a6, _DWORD *a7, float *a8, float *a9, _DWORD *a10, float *a11)
{
  simd_float4 v38 = _simd_cos_f4((simd_float4)0);
  _Q0 = (float32x4_t)_simd_sin_f4((simd_float4)0);
  _Q7 = v38;
  float v20 = vmuls_lane_f32(v38.f32[1], (float32x4_t)v38, 2);
  float v21 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  v22.n128_f32[0] = vmlas_n_f32(-(float)(v38.f32[0] * v21), v20, _Q0.f32[0]);
  _S3 = vmuls_lane_f32(v38.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S4, S3, V7.S[2] }
  _S3 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S5, S3, V0.S[2] }
  v22.n128_u32[1] = _S4;
  v22.n128_u64[1] = __PAIR64__(COERCE_UNSIGNED_INT(vmlas_n_f32(v21 * _Q0.f32[0], v20, v38.f32[0])), _S5);
  __n128 v39 = v22;
  sub_21E185D70();
  if (a3) {
    float v31 = 1.0;
  }
  else {
    float v31 = 0.0;
  }
  sub_21E185D80();
  sub_21E185DA0();
  float v33 = (float)(fminf(fmaxf(v32, 0.0), 1.0) * -0.2) + 0.3;
  sub_21E185D90();
  sub_21E185D80();
  sub_21E185DA0();
  float v35 = v34 * 6.6;
  if (a4) {
    float v36 = v35;
  }
  else {
    float v36 = 0.0;
  }
  sub_21E185D90();
  *a5 = a1;
  __n128 result = v39;
  *a6 = v39;
  *a7 = 1096296694;
  *a8 = v31;
  *a9 = v33;
  *a10 = 1041865114;
  *a11 = v36;
  return result;
}

__n128 sub_21E183C24(double a1, float a2, float32x4_t a3, float a4, uint64_t a5, float32x4_t *a6, float32x4_t *a7, __n128 *a8)
{
  sub_21E185D70();
  sub_21E185D80();
  sub_21E185DA0();
  float v13 = v12;
  sub_21E185D90();
  sub_21E185D80();
  sub_21E185DA0();
  float v15 = (float)(v13 * powf(a2, v14)) * 6.2832;
  float32x4_t v42 = (float32x4_t)(unint64_t)__sincosf_stret(v15);
  float v16 = drand48();
  float32x4_t v46 = vaddq_f32(vmulq_n_f32(v42, (float)(1.0 - (float)(a4 * 0.5))+ (float)((float)((float)((float)(a4 * 0.5) + 1.0) - (float)(1.0 - (float)(a4 * 0.5))) * v16)), a3);
  int32x4_t v17 = (int32x4_t)vmlaq_f32(vmulq_f32(v42, (float32x4_t)xmmword_21E189D00), (float32x4_t)xmmword_21E189860, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), (int8x16_t)v42, 0xCuLL));
  float32x4_t v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL);
  sub_21E185D80();
  sub_21E185DA0();
  float v19 = v18 * 6.0;
  sub_21E185D80();
  sub_21E185DA0();
  float v21 = v20 * 6.0;
  float v22 = drand48();
  float32x4_t v44 = vmulq_n_f32(v43, v19 + (float)((float)(v21 - v19) * v22));
  v23.i64[0] = 0;
  v23.i32[3] = 0;
  v23.f32[2] = (float)(1.5708 - v15) * 0.5;
  simd_float4 x = v23;
  simd_float4 v39 = _simd_cos_f4(v23);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v39;
  float v26 = vmuls_lane_f32(v39.f32[1], (float32x4_t)v39, 2);
  float v27 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  v28.n128_f32[0] = vmlas_n_f32(-(float)(v39.f32[0] * v27), v26, _Q0.f32[0]);
  _S3 = vmuls_lane_f32(v39.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S4, S3, V7.S[2] }
  _S3 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S5, S3, V0.S[2] }
  v28.n128_u32[1] = _S4;
  v28.n128_u64[1] = __PAIR64__(COERCE_UNSIGNED_INT(vmlas_n_f32(v27 * _Q0.f32[0], v26, v39.f32[0])), _S5);
  __n128 v40 = v28;
  sub_21E185D90();
  sub_21E185D90();
  sub_21E185D90();
  *a6 = v46;
  *a7 = v44;
  __n128 result = v40;
  *a8 = v40;
  return result;
}

unint64_t sub_21E183EE8(uint64_t a1, uint64_t a2)
{
  sub_21E185F90();
  sub_21E185F00();
  uint64_t v4 = sub_21E185FA0();

  return sub_21E184428(a1, a2, v4);
}

uint64_t sub_21E183F60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B08);
  char v38 = a2;
  uint64_t v6 = sub_21E185F50();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_38;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  float v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1)) {
      goto LABEL_40;
    }
    if (v14 >= v11) {
      break;
    }
    simd_float4 v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v14);
    if (!v24)
    {
      int64_t v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        uint64_t v3 = v36;
        if ((v38 & 1) == 0) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          int64_t v14 = v25 + 1;
          if (__OFADD__(v25, 1)) {
            break;
          }
          if (v14 >= v11) {
            goto LABEL_31;
          }
          unint64_t v24 = *(void *)(v37 + 8 * v14);
          ++v25;
          if (v24) {
            goto LABEL_20;
          }
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    float v26 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v28 = *v26;
    uint64_t v27 = v26[1];
    long double v29 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v30 = v29;
    }
    sub_21E185F90();
    sub_21E185F00();
    uint64_t result = sub_21E185FA0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v33 = v17 == v32;
        if (v17 == v32) {
          unint64_t v17 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      unint64_t v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    float v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *float v19 = v28;
    v19[1] = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v29;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  simd_float4 v23 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_38;
  }
LABEL_34:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *simd_float4 v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_38:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_21E184250(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21E185F20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21E185F90();
        swift_bridgeObjectRetain();
        sub_21E185F00();
        uint64_t v9 = sub_21E185FA0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          float v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          uint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *uint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_21E184428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21E185F60() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        float v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21E185F60() & 1) == 0);
    }
  }
  return v6;
}

id sub_21E18450C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B08);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21E185F40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21E1846A8(float32x4_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  sub_21E185DD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B30);
  uint64_t v5 = (_OWORD *)swift_allocObject();
  v5[2] = xmmword_21E189840;
  v5[3] = xmmword_21E189D10;
  v5[4] = xmmword_21E189D20;
  v5[5] = xmmword_21E189840;
  sub_21E185DD0();
  swift_setDeallocating();
  swift_deallocClassInstance();
  float32x4_t v6 = vaddq_f32(a1, a1);
  if (v6.f32[0] > v6.f32[1])
  {
    if (v6.f32[1] > v6.f32[0]) {
      goto LABEL_5;
    }
    BOOL v8 = v6.f32[2] <= v6.f32[0];
    sub_21E185D60();
    float v7 = 1.0;
    if (!v8) {
      goto LABEL_10;
    }
LABEL_9:
    float v7 = 1.66;
    goto LABEL_10;
  }
  if (v6.f32[1] > v6.f32[0])
  {
LABEL_5:
    sub_21E185D60();
    float v7 = 1.0;
    goto LABEL_10;
  }
  BOOL v9 = v6.f32[2] <= v6.f32[0];
  sub_21E185D60();
  float v7 = 1.0;
  if (v9) {
    goto LABEL_9;
  }
LABEL_10:
  sub_21E185DB0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DB0();
  *a4 = v7;

  return sub_21E185DE0();
}

uint64_t sub_21E1848D8(float32x4_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  sub_21E185DD0();
  float32x4_t v5 = vaddq_f32(a1, a1);
  if (v5.f32[2] > v5.f32[0]) {
    float v6 = 1.0;
  }
  else {
    float v6 = 2.0;
  }
  if (v5.f32[1] > v5.f32[0]) {
    float v6 = 1.0;
  }
  if (v5.f32[2] > v5.f32[0]) {
    float v7 = 1.0;
  }
  else {
    float v7 = 2.0;
  }
  if (v5.f32[1] > v5.f32[0]) {
    float v7 = 1.0;
  }
  if (v5.f32[0] <= v5.f32[1]) {
    float v8 = v7;
  }
  else {
    float v8 = v6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B30);
  BOOL v9 = (_OWORD *)swift_allocObject();
  v9[2] = xmmword_21E189D60;
  v9[3] = xmmword_21E189D70;
  v9[4] = xmmword_21E189D80;
  v9[5] = xmmword_21E189D90;
  sub_21E185DD0();
  swift_setDeallocating();
  swift_deallocClassInstance();
  sub_21E185D60();
  sub_21E185D60();
  sub_21E185D60();
  sub_21E185D60();
  sub_21E185DB0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DB0();
  *a4 = v8;

  return sub_21E185DE0();
}

uint64_t sub_21E184BB0()
{
  sub_21E185DD0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B30);
  uint64_t v0 = (_OWORD *)swift_allocObject();
  v0[2] = xmmword_21E189840;
  v0[3] = xmmword_21E189D70;
  v0[4] = xmmword_21E189E60;
  v0[5] = xmmword_21E189840;
  sub_21E185DD0();
  swift_setDeallocating();
  swift_deallocClassInstance();
  sub_21E185D60();
  sub_21E185D60();
  sub_21E185DB0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DE0();
  sub_21E185DB0();

  return sub_21E185DE0();
}

uint64_t type metadata accessor for Sparks()
{
  uint64_t result = qword_267D28AF0;
  if (!qword_267D28AF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_21E184E94()
{
  return swift_initClassMetadata2();
}

uint64_t sub_21E184ED4()
{
  return type metadata accessor for Sparks();
}

uint64_t sub_21E184EDC()
{
  uint64_t v0 = sub_21E185E70();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267D28980 != -1) {
LABEL_29:
  }
    swift_once();
  uint64_t v4 = (char *)off_267D28AD8;
  uint64_t v5 = *((void *)off_267D28AD8 + 2);
  if (v5)
  {
    float v6 = self;
    float v8 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
    uint64_t v7 = v1 + 16;
    __n128 v40 = v8;
    id v41 = v6;
    BOOL v9 = &v4[(*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64)];
    uint64_t v42 = v7;
    uint64_t v37 = *(void *)(v7 + 56);
    char v38 = (void (**)(char *, uint64_t))(v7 - 8);
    v35[1] = v4;
    swift_bridgeObjectRetain();
    uint64_t v1 = MEMORY[0x263F8EE80];
    uint64_t v36 = v0;
    simd_float4 v39 = v3;
    while (1)
    {
      unint64_t v12 = (char *)v1;
      v40(v3, v9, v0);
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_21E185E50();
      uint64_t v15 = v14;
      id v16 = objc_msgSend(v41, sel_valueWithPointer_, sub_21E185E60());
      if (!v16)
      {
        swift_bridgeObjectRetain();
        unint64_t v25 = sub_21E183EE8(v13, v15);
        char v27 = v26;
        swift_bridgeObjectRelease();
        if (v27)
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          float32x4_t v43 = v12;
          uint64_t v1 = (uint64_t)v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_21E18450C();
            uint64_t v1 = (uint64_t)v43;
          }
          swift_bridgeObjectRelease();
          long double v29 = *(void **)(*(void *)(v1 + 56) + 8 * v25);
          sub_21E184250(v25, v1);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v1 = (uint64_t)v12;
        }
        goto LABEL_6;
      }
      id v17 = v16;
      uint64_t v1 = swift_isUniquelyReferenced_nonNull_native();
      float32x4_t v43 = v12;
      uint64_t v3 = v12;
      unint64_t v19 = sub_21E183EE8(v13, v15);
      uint64_t v20 = *((void *)v12 + 2);
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v0 = v18;
      if (*((void *)v12 + 3) >= v22)
      {
        if (v1)
        {
          uint64_t v1 = (uint64_t)v43;
          if ((v18 & 1) == 0) {
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t v3 = (char *)&v43;
          sub_21E18450C();
          uint64_t v1 = (uint64_t)v43;
          if ((v0 & 1) == 0) {
            goto LABEL_19;
          }
        }
      }
      else
      {
        sub_21E183F60(v22, v1);
        uint64_t v3 = v43;
        unint64_t v23 = sub_21E183EE8(v13, v15);
        if ((v0 & 1) != (v24 & 1))
        {
          uint64_t result = sub_21E185F70();
          __break(1u);
          return result;
        }
        unint64_t v19 = v23;
        uint64_t v1 = (uint64_t)v43;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          *(void *)(v1 + 8 * (v19 >> 6) + 64) |= 1 << v19;
          id v30 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
          *id v30 = v13;
          v30[1] = v15;
          *(void *)(*(void *)(v1 + 56) + 8 * v19) = v17;
          uint64_t v31 = *(void *)(v1 + 16);
          BOOL v32 = __OFADD__(v31, 1);
          uint64_t v33 = v31 + 1;
          if (v32) {
            goto LABEL_28;
          }
          *(void *)(v1 + 16) = v33;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      uint64_t v10 = *(void *)(v1 + 56);
      uint64_t v11 = *(void **)(v10 + 8 * v19);
      *(void *)(v10 + 8 * v19) = v17;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v0 = v36;
LABEL_6:
      uint64_t v3 = v39;
      (*v38)(v39, v0);
      swift_bridgeObjectRelease();
      v9 += v37;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        return v1;
      }
    }
  }
  return MEMORY[0x263F8EE80];
}

uint64_t sub_21E1852A4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_21E1852E0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D28B20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21E185340()
{
  unint64_t result = qword_267D28B28;
  if (!qword_267D28B28)
  {
    sub_21E185E10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267D28B28);
  }
  return result;
}

uint64_t sub_21E185D20()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21E185D30()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21E185D40()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21E185D50()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21E185D60()
{
  return MEMORY[0x270F83888]();
}

uint64_t sub_21E185D70()
{
  return MEMORY[0x270F83890]();
}

uint64_t sub_21E185D80()
{
  return MEMORY[0x270F83898]();
}

uint64_t sub_21E185D90()
{
  return MEMORY[0x270F838A0]();
}

uint64_t sub_21E185DA0()
{
  return MEMORY[0x270F838A8]();
}

uint64_t sub_21E185DB0()
{
  return MEMORY[0x270F838B0]();
}

uint64_t sub_21E185DC0()
{
  return MEMORY[0x270F838B8]();
}

uint64_t sub_21E185DD0()
{
  return MEMORY[0x270F838C0]();
}

uint64_t sub_21E185DE0()
{
  return MEMORY[0x270F838C8]();
}

uint64_t sub_21E185DF0()
{
  return MEMORY[0x270F838D0]();
}

uint64_t sub_21E185E00()
{
  return MEMORY[0x270F838D8]();
}

uint64_t sub_21E185E10()
{
  return MEMORY[0x270F838E0]();
}

uint64_t sub_21E185E20()
{
  return MEMORY[0x270F838E8]();
}

uint64_t sub_21E185E30()
{
  return MEMORY[0x270F838F0]();
}

uint64_t sub_21E185E40()
{
  return MEMORY[0x270F838F8]();
}

uint64_t sub_21E185E50()
{
  return MEMORY[0x270F83900]();
}

uint64_t sub_21E185E60()
{
  return MEMORY[0x270F83908]();
}

uint64_t sub_21E185E70()
{
  return MEMORY[0x270F83910]();
}

uint64_t sub_21E185E80()
{
  return MEMORY[0x270F83920]();
}

uint64_t sub_21E185E90()
{
  return MEMORY[0x270F83928]();
}

uint64_t sub_21E185EA0()
{
  return MEMORY[0x270F83930]();
}

uint64_t sub_21E185EB0()
{
  return MEMORY[0x270F83940]();
}

uint64_t sub_21E185EC0()
{
  return MEMORY[0x270F83948]();
}

uint64_t sub_21E185ED0()
{
  return MEMORY[0x270F83950]();
}

uint64_t sub_21E185EE0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21E185EF0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21E185F00()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21E185F10()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_21E185F20()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21E185F30()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21E185F40()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21E185F50()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21E185F60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21E185F70()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21E185F80()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_21E185F90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21E185FA0()
{
  return MEMORY[0x270F9FC90]();
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
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
  return (CGContextRef)MEMORY[0x270F82D70]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  MEMORY[0x270ED81E8]((__n128)x);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  MEMORY[0x270ED8348]((__n128)x);
  return result;
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

long double cosh(long double __x)
{
  MEMORY[0x270ED9138](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

long double sinh(long double __x)
{
  MEMORY[0x270EDB4F8](__x);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}