double HW_NSTimeIntervalFromMillis(uint64_t a1)
{
  return (double)a1 / 1000.0;
}

uint64_t HW_MillisFromNSTimeInterval(double a1)
{
  return (uint64_t)(a1 * 1000.0);
}

double HW_CGSizeFromIntegralData(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 4)
  {
    v2 = (_WORD *)[v1 bytes];
    double v3 = 0.0;
    if (v2) {
      double v3 = (double)(__int16)(*v2 ^ 0x8000);
    }
  }
  else
  {
    double v3 = 0.0;
  }

  return v3;
}

id HW_DataFromIntegralCGSize(double a1, double a2)
{
  float v2 = a1;
  int v3 = (int)(float)(roundf(v2) + 32768.0);
  float v4 = a2;
  v7[0] = v3;
  v7[1] = (int)(float)(roundf(v4) + 32768.0);
  v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:4];
  return v5;
}

double HW_CGRectFromIntegralData(void *a1)
{
  id v1 = a1;
  if ([v1 length] == 8)
  {
    float v2 = (_WORD *)[v1 bytes];
    double v3 = 0.0;
    if (v2) {
      double v3 = (double)(__int16)(*v2 ^ 0x8000);
    }
  }
  else
  {
    double v3 = 0.0;
  }

  return v3;
}

id HW_DataFromIntegralCGRect(float64x2_t a1, float64_t a2, float64x2_t a3, float64_t a4)
{
  v7[1] = *MEMORY[0x263EF8340];
  a3.f64[1] = a4;
  a1.f64[1] = a2;
  v4.i64[0] = 0x4700000047000000;
  v4.i64[1] = 0x4700000047000000;
  v7[0] = vmovn_s32((int32x4_t)vcvtq_u32_f32(vaddq_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1), a3)), v4)));
  v5 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:8];
  return v5;
}

double HW_FloatFromUInt16(unsigned int a1)
{
  return (float)((float)((float)a1 / 32767.0) + -1.0);
}

unsigned int HW_UInt16FromFloat(double a1)
{
  float v1 = (a1 + 1.0) * 32767.0;
  return llroundf(v1);
}

double ClampToMinWidthCG(double result, double a2)
{
  if (result < a2) {
    return a2;
  }
  return result;
}

uint64_t NSStringFromVectorFloat4(__n128 a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"x: %f y: %f z: %f w: %f", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], a1.n128_f32[3]);
}

float DKRenderPointWidthForPoint(float32x4_t a1, float a2)
{
  return vmuls_lane_f32(a1.f32[3] + 1.0, a1, 2) * a2;
}

void sub_22AF6286C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF628F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF62974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DKInkView;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_22AF62B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF62BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF62CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF62D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF62DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF62E38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF63024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF630A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF6329C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22AF63400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_22AF63680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_22AF639C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF63AB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF63E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF63EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF640AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF641B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF642E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF643A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF64444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF64598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF646AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF64704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF64780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF6486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF64968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF64DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_22AF64F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF65594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location)
{
  _Unwind_Resume(a1);
}

void sub_22AF656EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF65BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_22AF65D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF66048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_22AF66234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF662E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF664D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF666F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF667F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF669F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_22AF66BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF66C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF66D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF66EC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF66FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF670CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF67200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF67364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF67434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CGRectIsUnrepresentable(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsNull(*(CGRect *)&a1)
    || (v12.origin.x = a1, v12.origin.y = a2, v12.size.width = a3, v12.size.height = a4, CGRectIsEmpty(v12)))
  {
    char v8 = 1;
  }
  else
  {
    v13.origin.x = a1;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    BOOL IsInfinite = CGRectIsInfinite(v13);
    double v10 = fabs(a2);
    char v8 = fabs(a1) == INFINITY || IsInfinite;
    if (v10 == INFINITY) {
      char v8 = 1;
    }
    if (fabs(a3) == INFINITY) {
      char v8 = 1;
    }
    if (fabs(a4) == INFINITY) {
      char v8 = 1;
    }
  }
  return v8 & 1;
}

BOOL CGPointIsUnrepresentable(double a1, double a2)
{
  BOOL v2 = fabs(a1) == INFINITY;
  if (fabs(a2) == INFINITY) {
    return 1;
  }
  return v2;
}

double DKDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return hypot(a1 - a3, a2 - a4);
}

BOOL DKIsDarkMode()
{
  v0 = [MEMORY[0x263F1CB00] currentTraitCollection];
  BOOL v1 = [v0 userInterfaceStyle] == 2;

  return v1;
}

void sub_22AF67E48(_Unwind_Exception *a1)
{
  float32x4_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22AF680FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF6824C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  double v10 = v9;

  a9.super_class = (Class)DKInkRendererGL;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22AF68368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF684C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF686D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF687D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF68A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF68B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22AF68EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL DKDrawingIsValid(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1;
  BOOL v11 = 0;
  if (v1)
  {
    [v1 canvasBounds];
    double v4 = *MEMORY[0x263F001B0];
    double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (v6 != *MEMORY[0x263F001B0] || v3 != v5)
    {
      [v2 strokesFrame];
      if (v9 != v4 || v8 != v5) {
        BOOL v11 = 1;
      }
    }
  }

  return v11;
}

void sub_22AF6A380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF6A40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22AF6A49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DKOpenGLRenderer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22AF6ADE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<Page>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<Page>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 40 * a2;
  }
}

void std::vector<Vertex>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<Vertex>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_22AF6B9FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_22AF6BDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_22AF6C078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AF6C148(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AF6C7AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AF6CD7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AF6D258(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AF6D3E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<Page>::__append(void **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  double v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 40 * ((40 * a2 - 40) / 0x28) + 40;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x666666666666666) {
      std::vector<Page>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x333333333333333) {
      unint64_t v11 = 0x666666666666666;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      CGRect v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Page>>(v4, v11);
    }
    else {
      CGRect v12 = 0;
    }
    v14 = &v12[40 * v8];
    v15 = &v12[40 * v11];
    size_t v16 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 40);
        long long v21 = *(_OWORD *)(v18 - 24);
        *((void *)v14 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v21;
        *(_OWORD *)(v14 - 40) = v20;
        v14 -= 40;
        v18 -= 40;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void std::vector<Page>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264885720, MEMORY[0x263F8C060]);
}

void sub_22AF6D7C4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Page>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::vector<Vertex>::__append(void **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  double v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<Page>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      CGRect v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>(v4, v11);
    }
    else {
      CGRect v12 = 0;
    }
    v14 = &v12[24 * v8];
    v15 = &v12[24 * v11];
    size_t v16 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 24);
        *((void *)v14 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v20;
        v14 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
    {
      operator delete(v18);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void *std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    double v6 = result;
    result = std::vector<Vertex>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22AF6DAFC(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<Vertex>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<Page>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void *std::vector<Vertex>::__init_with_size[abi:ne180100]<Vertex*,Vertex*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    double v6 = result;
    result = std::vector<Vertex>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22AF6DC04(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_22AF6EB14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AF6ECDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t HWPDrawingReadFrom(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  double v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 0x10u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_63;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_65;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_63:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_65:
          uint64_t v49 = 60;
          goto LABEL_82;
        case 2u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 24;
          goto LABEL_61;
        case 3u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 32;
          goto LABEL_61;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 8u;
          while (2)
          {
            uint64_t v30 = *v3;
            unint64_t v31 = *(void *)(a2 + v30);
            if (v31 == -1 || v31 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)(a2 + *v7) + v31);
              *(void *)(a2 + v30) = v31 + 1;
              v19 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v14 = v29++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_69:
          uint64_t v49 = 56;
          goto LABEL_82;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 1u;
          while (2)
          {
            uint64_t v35 = *v3;
            unint64_t v36 = *(void *)(a2 + v35);
            if (v36 == -1 || v36 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)(a2 + *v7) + v36);
              *(void *)(a2 + v35) = v36 + 1;
              v19 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_73:
          uint64_t v49 = 16;
          goto LABEL_82;
        case 6u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 2u;
          while (2)
          {
            uint64_t v40 = *v3;
            unint64_t v41 = *(void *)(a2 + v40);
            if (v41 == -1 || v41 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)(a2 + *v7) + v41);
              *(void *)(a2 + v40) = v41 + 1;
              v19 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                BOOL v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_77:
          uint64_t v49 = 20;
          goto LABEL_82;
        case 7u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 64) |= 4u;
          break;
        case 8u:
          uint64_t v26 = PBReaderReadData();
          uint64_t v27 = 48;
LABEL_61:
          v48 = *(void **)(a1 + v27);
          *(void *)(a1 + v27) = v26;

          continue;
        default:
          if (!*(void *)(a1 + 8))
          {
            id v23 = objc_alloc_init(MEMORY[0x263F62258]);
            v24 = *(void **)(a1 + 8);
            *(void *)(a1 + 8) = v23;
          }
          uint64_t result = PBUnknownFieldAdd();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v45 = *v3;
        unint64_t v46 = *(void *)(a2 + v45);
        if (v46 == -1 || v46 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v47 = *(unsigned char *)(*(void *)(a2 + *v7) + v46);
        *(void *)(a2 + v45) = v46 + 1;
        v19 |= (unint64_t)(v47 & 0x7F) << v43;
        if ((v47 & 0x80) == 0) {
          goto LABEL_79;
        }
        v43 += 7;
        BOOL v14 = v44++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_81;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_79:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_81:
      uint64_t v49 = 40;
LABEL_82:
      *(_DWORD *)(a1 + v49) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t HWPMessageReadFrom(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  double v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v15 = v9++ >= 9;
          if (v15)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = 0;
              unsigned int v19 = 0;
              uint64_t v20 = 0;
              *(unsigned char *)(a1 + 44) |= 2u;
              break;
            case 2u:
              *(unsigned char *)(a1 + 44) |= 1u;
              uint64_t v28 = *v3;
              unint64_t v29 = *(void *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && (unint64_t v30 = v29 + 8, v29 + 8 <= *(void *)(a2 + *v4)))
              {
                uint64_t v31 = *(void *)(*(void *)(a2 + *v7) + v29);
                *(void *)(a2 + v28) = v30;
              }
              else
              {
                uint64_t v31 = 0;
                *(unsigned char *)(a2 + *v5) = 1;
              }
              *(void *)(a1 + 16) = v31;
              goto LABEL_42;
            case 3u:
              uint64_t v32 = PBReaderReadString();
              uint64_t v33 = 32;
              goto LABEL_35;
            case 4u:
              uint64_t v32 = PBReaderReadData();
              uint64_t v33 = 24;
LABEL_35:
              unsigned int v34 = *(void **)(a1 + v33);
              *(void *)(a1 + v33) = v32;

              goto LABEL_42;
            default:
              if (!*(void *)(a1 + 8))
              {
                id v25 = objc_alloc_init(MEMORY[0x263F62258]);
                uint64_t v26 = *(void **)(a1 + 8);
                *(void *)(a1 + 8) = v25;
              }
              uint64_t result = PBUnknownFieldAdd();
              if (!result) {
                return result;
              }
LABEL_42:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v21 = *v3;
            uint64_t v22 = *(void *)(a2 + v21);
            unint64_t v23 = v22 + 1;
            if (v22 == -1 || v23 > *(void *)(a2 + *v4)) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0) {
              goto LABEL_37;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_39;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_39:
          *(_DWORD *)(a1 + 40) = v20;
          goto LABEL_42;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
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

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x270EE7188]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x270EE7278](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

NSRect NSIntegralRectWithOptions(NSRect aRect, NSAlignmentOptions opts)
{
  MEMORY[0x270EF2AE8](opts, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x270F05E98]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteSfixed64Field()
{
  return MEMORY[0x270F58578]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBUnknownFieldAdd()
{
  return MEMORY[0x270F58798]();
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F58](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x270EF97E0]();
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data)
{
}

void glClear(GLbitfield mask)
{
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glCompileShader(GLuint shader)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x270EF9868]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x270EF9870](*(void *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x270EF98B8]();
}

void glDepthMask(GLBOOLean flag)
{
}

void glDisable(GLenum cap)
{
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFinish(void)
{
}

void glFlush(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x270EF9960]();
}

GLenum glGetError(void)
{
  return MEMORY[0x270EF9990]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF99E8](*(void *)&program, name);
}

void glLinkProgram(GLuint program)
{
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glPopGroupMarkerEXT(void)
{
}

void glPushGroupMarkerEXT(GLsizei length, const char *marker)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}