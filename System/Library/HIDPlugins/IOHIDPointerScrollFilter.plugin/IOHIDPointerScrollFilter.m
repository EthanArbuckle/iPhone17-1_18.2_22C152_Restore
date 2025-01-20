void *IOHIDSimpleAccelerator::serialize(IOHIDSimpleAccelerator *this, __CFDictionary *a2)
{
  void *v4;
  CFMutableDictionaryRef theDict;

  v4 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B2140(&v4, a2, 0);
  v4 = &unk_26F4E7380;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDSimpleAccelerator");
  sub_2407B1820((uint64_t)&v4, @"Multiplier", vcvtd_n_u64_f64(*((double *)this + 1), 0x10uLL));
  return sub_2407B228C(&v4);
}

void sub_2407B180C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_2407B1820(uint64_t a1, const void *a2, uint64_t a3)
{
  sub_2407B2368(&v6, a3);
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_2407B23E4(&v6);
}

void sub_2407B187C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL IOHIDSimpleAccelerator::accelerate(IOHIDSimpleAccelerator *this, double *a2, uint64_t a3)
{
  double v3 = *((double *)this + 1);
  if (v3 != 1.0 && a3 != 0)
  {
    do
    {
      *a2 = *((double *)this + 1) * *a2;
      ++a2;
      --a3;
    }
    while (a3);
  }
  return v3 != 1.0;
}

BOOL IOHIDScrollAccelerator::accelerate(IOHIDScrollAccelerator *this, double *a2, unint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  LODWORD(a6) = IOHIDScrollAccelerator::_timebase;
  LODWORD(a7) = dword_268C8F83C;
  double v9 = (double)(unint64_t)(a4 - *((void *)this + 4))
     * (double)*(unint64_t *)&a6
     / (double)*(unint64_t *)&a7
     / 1000000.0;
  *((void *)this + 4) = a4;
  int v10 = *((_DWORD *)this + 4);
  uint64_t v11 = *((int *)this + 5);
  v12 = (double *)((char *)this + 16 * v11);
  v12[8] = v9;
  v12[9] = fabs(*a2);
  int v13 = ((int)v11 + 1) % 9;
  *((_DWORD *)this + 5) = v13;
  if (v13 == v10)
  {
    int v10 = (char)(v13 + 1 - 9 * ((((57 * (char)(v13 + 1)) & 0x8000) != 0) + ((57 * (char)(v13 + 1)) >> 9)));
    *((_DWORD *)this + 4) = v10;
  }
  int v14 = *a2 > 0.0;
  if (*((unsigned __int8 *)this + 24) != v14 || v9 > 500.0)
  {
    *((_DWORD *)this + 4) = v11;
    *((unsigned char *)this + 24) = v14;
    int v10 = v11;
  }
  unsigned int v15 = 0;
  double v16 = 0.0;
  int v17 = 16;
  double v18 = 150.0;
  double v19 = 0.0;
  while (1)
  {
    unsigned int v20 = v15;
    int v21 = v17;
    if (v13) {
      --v13;
    }
    else {
      int v13 = 8;
    }
    v22 = (double *)((char *)this + 16 * v13);
    double v23 = v22[8];
    double v19 = v19 + v22[9];
    if (v23 > 150.0) {
      break;
    }
    double v16 = v16 + v23;
    v17 += 16;
    unsigned int v15 = v20 + 1;
    if (v16 >= 500.0 || v13 == v10) {
      goto LABEL_18;
    }
  }
  double v16 = v16 + 150.0;
LABEL_18:
  double v25 = *((double *)this + 6) / 67.0;
  double v26 = (double)(int)(v20 + 1);
  double v27 = v16 / v26 * v25;
  if (v27 <= 150.0)
  {
    double v18 = v27;
    if (v27 < 1.0) {
      double v18 = 1.0;
    }
  }
  double v28 = v25 * (v19 / v26 * (v18 * -0.0145721436 + v18 * 0.0000305175781 * v18 + 1.50099182));
  if (v28 >= 0.0000152587891) {
    double v29 = v28;
  }
  else {
    double v29 = 0.0000152587891;
  }
  if ((*(unsigned int (**)(void))(**((void **)this + 1) + 24))(*((void *)this + 1)))
  {
    double v30 = (*(double (**)(void, double))(**((void **)this + 1) + 16))(*((void *)this + 1), v29);
    double v31 = *a2;
    double v32 = v30 / v29;
  }
  else
  {
    if (v20 >= 2) {
      double v29 = sqrt((double)v21) * v29 * 0.25;
    }
    double v33 = (*(double (**)(void, double))(**((void **)this + 1) + 16))(*((void *)this + 1), v29);
    double v31 = *a2;
    double v32 = v33 / fabs(*a2);
  }
  *a2 = v32 * v31 * 0.100006104;
  return v32 != 1.0;
}

void *IOHIDScrollAccelerator::serialize(IOHIDScrollAccelerator *this, __CFDictionary *a2)
{
  v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B2140(&v7, a2, 0);
  v7 = &unk_26F4E7380;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDScrollAccelerator");
  sub_2407B1820((uint64_t)&v7, @"Resolution", vcvtd_n_u64_f64(*((double *)this + 5), 0x10uLL));
  sub_2407B1820((uint64_t)&v7, @"Rate", vcvtd_n_u64_f64(*((double *)this + 6), 0x10uLL));
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  sub_2407B22F0(&v5, 0);
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    (*(void (**)(uint64_t, void *))(*(void *)v3 + 32))(v3, value);
  }
  if (value) {
    CFDictionarySetValue(theDict, @"Accelerator", value);
  }
  sub_2407B228C(&v5);
  return sub_2407B228C(&v7);
}

void sub_2407B1CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_2407B228C((uint64_t *)va);
  _Unwind_Resume(a1);
}

BOOL IOHIDPointerAccelerator::accelerate(IOHIDPointerAccelerator *this, float64x2_t *a2, unint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  double v9 = *((double *)this + 4);
  double v10 = 1.0;
  if (v9 != 0.0)
  {
    LODWORD(a7) = IOHIDPointerAccelerator::_timebase;
    LODWORD(a8) = dword_268C8F844;
    double v11 = (double)(unint64_t)(a4 - *((void *)this + 2))
        * (double)*(unint64_t *)&a7
        / (double)*(unint64_t *)&a8
        / 1000000.0;
    double v10 = 1.0;
    if (v11 != 0.0)
    {
      double v12 = 1000.0 / v9;
      if (v11 >= v12) {
        double v13 = v11;
      }
      else {
        double v13 = v12;
      }
      double v10 = v12 / v13;
    }
  }
  *((void *)this + 2) = a4;
  double v14 = floor(sqrt(a2->f64[0] * a2->f64[0] + a2->f64[1] * a2->f64[1]));
  if (*((double *)this + 5) != 1.0) {
    double v10 = *((double *)this + 5);
  }
  double v15 = v10 * v14;
  if (v15 >= 0.0000152587891) {
    double v16 = v15;
  }
  else {
    double v16 = 0.0000152587891;
  }
  double v17 = (*(double (**)(void, double))(**((void **)this + 1) + 16))(*((void *)this + 1), v16) / v16;
  *a2 = vmulq_n_f64(*a2, v17);
  return v17 != 1.0;
}

void *IOHIDPointerAccelerator::serialize(IOHIDPointerAccelerator *this, __CFDictionary *a2)
{
  v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B2140(&v7, a2, 0);
  v7 = &unk_26F4E7380;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDPointerAccelerator");
  sub_2407B1820((uint64_t)&v7, @"Resolution", vcvtd_n_u64_f64(*((double *)this + 3), 0x10uLL));
  sub_2407B1820((uint64_t)&v7, @"Rate", vcvtd_n_u64_f64(*((double *)this + 4), 0x10uLL));
  unint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  value = (void *)0xAAAAAAAAAAAAAAAALL;
  sub_2407B22F0(&v5, 0);
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    (*(void (**)(uint64_t, void *))(*(void *)v3 + 32))(v3, value);
  }
  if (value) {
    CFDictionarySetValue(theDict, @"Accelerator", value);
  }
  sub_2407B228C(&v5);
  return sub_2407B228C(&v7);
}

void sub_2407B1F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_2407B228C((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_2407B1F3C()
{
}

void *sub_2407B1F50(void *a1)
{
  *a1 = &unk_26F4E72F0;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_2407B1FBC(void *a1)
{
  *a1 = &unk_26F4E72F0;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B2048(void *a1)
{
  *a1 = &unk_26F4E7338;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_2407B20B4(void *a1)
{
  *a1 = &unk_26F4E7338;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B2140(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E7400;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E73E0;
  return a1;
}

void sub_2407B21DC(void *a1)
{
  sub_2407B228C(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B2218(void *a1)
{
  sub_2407B228C(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B2254(void *a1)
{
  sub_2407B228C(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B228C(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E7400;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2407B22DC(void *a1)
{
}

void *sub_2407B22F0(void *a1, int a2)
{
  *a1 = &unk_26F4E7380;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return a1;
}

void sub_2407B2350(_Unwind_Exception *a1)
{
  sub_2407B228C(v1);
  _Unwind_Resume(a1);
}

void *sub_2407B2368(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_26F4E7420;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_2407B23D0(_Unwind_Exception *a1)
{
  sub_2407B23E4(v1);
  _Unwind_Resume(a1);
}

void *sub_2407B23E4(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E7468;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2407B2434(void *a1)
{
  sub_2407B23E4(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B2470(void *a1)
{
  sub_2407B23E4(a1);

  JUMPOUT(0x2455FA5A0);
}

void IOHIDParametricAcceleration::GetCurve(IOHIDParametricAcceleration *this@<X0>, const __CFString *a2@<X2>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 48) = -1;
  *(void *)&long long v6 = -1;
  *((void *)&v6 + 1) = -1;
  *(_OWORD *)(a3 + 16) = v6;
  *(_OWORD *)(a3 + 32) = v6;
  *(_OWORD *)a3 = v6;
  *(double *)a3 = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelIndex", a2);
  *(double *)(a3 + 8) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelGainLinear", v7);
  *(double *)(a3 + 16) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelGainParabolic", v8);
  *(double *)(a3 + 24) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelGainCubic", v9);
  *(double *)(a3 + 32) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelGainQuartic", v10);
  *(double *)(a3 + 40) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelTangentSpeedLinear", v11);
  *(double *)(a3 + 48) = IOHIDParametricAcceleration::GetCurveParameter(this, (const __CFDictionary *)@"HIDAccelTangentSpeedParabolicRoot", v12);
}

double IOHIDParametricAcceleration::GetCurveParameter(CFTypeRef cf, const __CFDictionary *a2, const __CFString *a3)
{
  CFStringRef v9 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFDictionaryRef theDict = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B4404(&v9, cf, 0);
  CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
  CFStringRef v9 = &unk_26F4E7538;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  Value = CFDictionaryGetValue(theDict, a2);
  sub_2407B45A0(&v7, Value, 0);
  if (number)
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
    double v5 = (double)valuePtr * 0.0000152587891;
  }
  else
  {
    double v5 = 0.0;
  }
  sub_2407B23E4(&v7);
  sub_2407B4550(&v9);
  return v5;
}

void sub_2407B2640(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  sub_2407B23E4((uint64_t *)va);
  sub_2407B4550((uint64_t *)va1);
  _Unwind_Resume(a1);
}

uint64_t IOHIDParametricAcceleration::CreateWithParameters(IOHIDParametricAcceleration *this, const __CFArray *a2, double a3, double a4, double a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CFStringRef v9 = _IOHIDLogCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    *(double *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = a5;
    _os_log_debug_impl(&dword_2407B0000, v9, OS_LOG_TYPE_DEBUG, "acceleration %f resolution %f rate %f\n", buf, 0x20u);
  }
  if (this && a3 >= 0.0)
  {
    double v30 = (void *)0xAAAAAAAAAAAAAAAALL;
    CFArrayRef theArray = (CFArrayRef)0xAAAAAAAAAAAAAAAALL;
    sub_2407B463C(&v30, this, 0);
    CFIndex v10 = 0;
    double v29 = 0;
    double v30 = &unk_26F4E75D8;
    __p = 0;
    double v28 = 0;
    while (v10 < CFArrayGetCount(theArray))
    {
      uint64_t v33 = -1;
      *(void *)&long long v11 = -1;
      *((void *)&v11 + 1) = -1;
      *(_OWORD *)&buf[16] = v11;
      *(_OWORD *)&buf[32] = v11;
      *(_OWORD *)buf = v11;
      ValueAtIndex = (IOHIDParametricAcceleration *)CFArrayGetValueAtIndex(theArray, v10);
      IOHIDParametricAcceleration::GetCurve(ValueAtIndex, v13, (uint64_t)buf);
      if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&buf[8]), (int32x4_t)vceqzq_f64(*(float64x2_t *)&buf[24]))))))
      {
        double v14 = v28;
        if (v28 >= v29)
        {
          double v16 = __p;
          unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v28 - __p) >> 3) + 1;
          if (v17 > 0x492492492492492) {
            sub_2407B4B30();
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((v29 - __p) >> 3) > v17) {
            unint64_t v17 = 0xDB6DB6DB6DB6DB6ELL * ((v29 - __p) >> 3);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v29 - __p) >> 3)) >= 0x249249249249249) {
            unint64_t v18 = 0x492492492492492;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v18)
          {
            double v19 = (char *)sub_2407B4C44((uint64_t)&v29, v18);
            double v16 = __p;
            double v14 = v28;
          }
          else
          {
            double v19 = 0;
          }
          unsigned int v20 = &v19[8 * ((v28 - __p) >> 3)];
          *(_OWORD *)unsigned int v20 = *(_OWORD *)buf;
          *((_OWORD *)v20 + 1) = *(_OWORD *)&buf[16];
          *((_OWORD *)v20 + 2) = *(_OWORD *)&buf[32];
          *((void *)v20 + 6) = v33;
          if (v14 == v16)
          {
            double v25 = &v19[8 * ((v28 - __p) >> 3)];
          }
          else
          {
            int v21 = &v19[8 * ((v28 - __p) >> 3)];
            do
            {
              long long v22 = *(_OWORD *)(v14 - 56);
              long long v23 = *(_OWORD *)(v14 - 40);
              long long v24 = *(_OWORD *)(v14 - 24);
              double v25 = v21 - 56;
              *((void *)v21 - 1) = *((void *)v14 - 1);
              *(_OWORD *)(v21 - 24) = v24;
              *(_OWORD *)(v21 - 40) = v23;
              *(_OWORD *)(v21 - 56) = v22;
              v14 -= 56;
              v21 -= 56;
            }
            while (v14 != v16);
          }
          double v15 = v20 + 56;
          __p = v25;
          double v29 = &v19[56 * v18];
          if (v16) {
            operator delete(v16);
          }
        }
        else
        {
          *(_OWORD *)double v28 = *(_OWORD *)buf;
          *((_OWORD *)v28 + 1) = *(_OWORD *)&buf[16];
          *((_OWORD *)v28 + 2) = *(_OWORD *)&buf[32];
          *((void *)v28 + 6) = v33;
          double v15 = v28 + 56;
        }
        double v28 = v15;
      }
      ++v10;
    }
    if (v28 != __p) {
      operator new();
    }
    if (v28) {
      operator delete(v28);
    }
    sub_2407B4788(&v30);
  }
  return 0;
}

void sub_2407B2C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  sub_2407B4788(&a15);
  _Unwind_Resume(a1);
}

double IOHIDParametricAcceleration::multiplier(IOHIDParametricAcceleration *this, double a2)
{
  double v3 = a2 / (*((double *)this + 14) / *((double *)this + 15));
  double v4 = *((double *)this + 1);
  if (v3 <= v4)
  {
    double v6 = v3 * *((double *)this + 9) * (v3 * *((double *)this + 9)) + *((double *)this + 8) * v3;
    long double v7 = v6 + pow(v3 * *((double *)this + 10), 3.0);
    double v5 = v7 + pow(v3 * *((double *)this + 11), 4.0);
  }
  else if (v3 <= *((double *)this + 2) && v4 == *((double *)this + 12))
  {
    double v5 = *((double *)this + 5) + *((double *)this + 3) * v3;
  }
  else
  {
    double v5 = sqrt(*((double *)this + 6) + *((double *)this + 4) * v3);
  }
  return v5 * 1.43283582;
}

void *IOHIDParametricAcceleration::serialize(IOHIDParametricAcceleration *this, __CFDictionary *a2)
{
  double v4 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B2140(&v4, a2, 0);
  double v4 = &unk_26F4E7380;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDParametricAcceleration");
  sub_2407B1820((uint64_t)&v4, @"AccelIndex", vcvtd_n_u64_f64(*((double *)this + 7), 0x10uLL));
  sub_2407B1820((uint64_t)&v4, @"GainLinear", vcvtd_n_u64_f64(*((double *)this + 8), 0x10uLL));
  sub_2407B1820((uint64_t)&v4, @"GainCubic", vcvtd_n_u64_f64(*((double *)this + 10), 0x10uLL));
  sub_2407B1820((uint64_t)&v4, @"TangentSpeedLinear", vcvtd_n_u64_f64(*((double *)this + 12), 0x10uLL));
  sub_2407B1820((uint64_t)&v4, @"TangentSpeedParabolicRoot", vcvtd_n_u64_f64(*((double *)this + 13), 0x10uLL));
  return sub_2407B228C(&v4);
}

void sub_2407B2E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL operator<(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL operator==(double *a1, double *a2)
{
  return *a1 == *a2;
}

double IOHIDTableAcceleration::InterpolatePoint(uint64_t a1, uint64_t a2)
{
  return *(double *)a2;
}

double IOHIDTableAcceleration::InterpolatePoint(uint64_t a1)
{
  return *(double *)a1;
}

uint64_t IOHIDTableAcceleration::InterpolateFunction(int a1, ACCEL_TABLE_ENTRY *a2, ACCEL_TABLE_ENTRY *this, double a4, uint64_t **a5)
{
  double v9 = ACCEL_TABLE_ENTRY::point(this, 0);
  double v11 = v10;
  uint64_t result = ACCEL_TABLE_ENTRY::count(a2);
  if (result)
  {
    unsigned int v13 = 0;
    unsigned int v14 = 0;
    double v15 = 0.0;
    double v16 = 0.0;
    do
    {
      double v17 = ACCEL_TABLE_ENTRY::point(a2, v14);
      for (i = v18; v17 > v9; double v11 = v20)
      {
        if (v13 >= ACCEL_TABLE_ENTRY::count(this) - 1) {
          break;
        }
        double v16 = v9;
        double v15 = v11;
        double v9 = ACCEL_TABLE_ENTRY::point(this, ++v13);
      }
      double v21 = v11 - (v11 - v15) / (v9 - v16) * v9 + v17 * ((v11 - v15) / (v9 - v16));
      if (v21 >= i) {
        double v22 = i;
      }
      else {
        double v22 = v11 - (v11 - v15) / (v9 - v16) * v9 + v17 * ((v11 - v15) / (v9 - v16));
      }
      *(double *)&long long v23 = v17;
      *((double *)&v23 + 1) = v22 + vabdd_f64(i, v21) * a4;
      sub_2407B4C90(a5, (double *)&v23, &v23);
      ++v14;
      uint64_t result = ACCEL_TABLE_ENTRY::count(a2);
    }
    while (v14 < result);
  }
  return result;
}

uint64_t IOHIDTableAcceleration::CreateWithTable(IOHIDTableAcceleration *this, const __CFData *a2, double a3, double a4, double a5)
{
  BytePtr = (ACCEL_TABLE *)CFDataGetBytePtr(this);
  if (BytePtr)
  {
    double v6 = BytePtr;
    if (ACCEL_TABLE::signature(BytePtr) == 808464960
      || ACCEL_TABLE::signature(v6) == 708989781)
    {
      operator new();
    }
    CFStringRef v8 = _IOHIDLogCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_2407B9B38(v6, v8);
    }
  }
  else
  {
    long double v7 = _IOHIDLogCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_2407B9A80(v7);
    }
  }
  return 0;
}

void sub_2407B36B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, void);
  CFStringRef v8 = va_arg(va1, void *);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  sub_2407B4F3C((uint64_t)va, v8);
  sub_2407B39E8((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t sub_2407B3710(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  double v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  CFStringRef v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_2407B39C0(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x2455FA570](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2407B39E8(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2455FA570](a1 + 128);
  return a1;
}

uint64_t IOHIDTableAcceleration::CreateOriginalWithTable(IOHIDTableAcceleration *this, const __CFData *a2, double a3, double a4, double a5)
{
  if (this && a4 != 0.0 && a5 != 0.0) {
    operator new();
  }
  return 0;
}

double IOHIDTableAcceleration::multiplier(IOHIDTableAcceleration *this, double a2)
{
  uint64_t v3 = (double *)*((void *)this + 1);
  uint64_t v2 = (double *)*((void *)this + 2);
  if (v3 != v2)
  {
    uint64_t v4 = v3 + 3;
    do
    {
      double v5 = v4 + 3;
      BOOL v6 = *(v4 - 1) >= a2 || v4 == v2;
      v4 += 3;
    }
    while (!v6);
    uint64_t v3 = v5 - 6;
  }
  return v3[1] + *v3 * a2;
}

void *IOHIDTableAcceleration::serialize(IOHIDTableAcceleration *this, __CFDictionary *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v12 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B2140(&v12, a2, 0);
  uint64_t v12 = &unk_26F4E7380;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDTableAcceleration");
  uint64_t v10 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableArrayRef theArray = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  sub_2407B47D8(&v10, Mutable, 1);
  uint64_t v10 = &unk_26F4E7678;
  for (double i = (double *)*((void *)this + 1); i != *((double **)this + 2); i += 3)
  {
    long long v15 = xmmword_2650D6180;
    double v16 = @"x";
    sub_2407B2368(v8, vcvtd_n_u64_f64(*i, 0x10uLL));
    v14[0] = v8[1];
    sub_2407B2368(v7, vcvtd_n_u64_f64(i[1], 0x10uLL));
    v14[1] = v7[1];
    sub_2407B2368(v6, vcvtd_n_u64_f64(i[2], 0x10uLL));
    v14[2] = v6[1];
    sub_2407B4974(v9, &v15, 3uLL, v14, 3uLL);
    CFArrayAppendValue(theArray, v9[1]);
    sub_2407B4550(v9);
    sub_2407B23E4(v6);
    sub_2407B23E4(v7);
    sub_2407B23E4(v8);
  }
  if (theArray) {
    CFDictionarySetValue(theDict, @"Curves", theArray);
  }
  sub_2407B4924(&v10);
  return sub_2407B228C(&v12);
}

void sub_2407B42A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  sub_2407B4924((uint64_t *)va);
  sub_2407B228C((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_2407B4320()
{
}

uint64_t sub_2407B4334()
{
  return 1;
}

void *sub_2407B433C(void *a1)
{
  *a1 = &unk_26F4E74E8;
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_2407B438C(void *a1)
{
  *a1 = &unk_26F4E74E8;
  uint64_t v2 = (void *)a1[1];
  if (v2)
  {
    a1[2] = v2;
    operator delete(v2);
  }

  JUMPOUT(0x2455FA5A0);
}

uint64_t sub_2407B43FC()
{
  return 0;
}

void *sub_2407B4404(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E75B8;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E7598;
  return a1;
}

void sub_2407B44A0(void *a1)
{
  sub_2407B4550(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B44DC(void *a1)
{
  sub_2407B4550(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B4518(void *a1)
{
  sub_2407B4550(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B4550(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E75B8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407B45A0(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFNumberGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E7468;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E7420;
  return a1;
}

void *sub_2407B463C(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E7658;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E7638;
  return a1;
}

void sub_2407B46D8(void *a1)
{
  sub_2407B4788(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B4714(void *a1)
{
  sub_2407B4788(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B4750(void *a1)
{
  sub_2407B4788(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B4788(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E7658;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407B47D8(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E76F8;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E76D8;
  return a1;
}

void sub_2407B4874(void *a1)
{
  sub_2407B4924(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B48B0(void *a1)
{
  sub_2407B4924(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B48EC(void *a1)
{
  sub_2407B4924(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B4924(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E76F8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407B4974(void *a1, const void *a2, unint64_t a3, const void *a4, unint64_t a5)
{
  *a1 = &unk_26F4E7538;
  keys = 0;
  __dst = 0;
  uint64_t v20 = 0;
  if (a3)
  {
    sub_2407B4AEC(&keys, a3);
    uint64_t v10 = (char *)__dst;
    memmove(__dst, a2, 8 * a3);
    uint64_t v11 = &v10[8 * a3];
    __dst = v11;
  }
  else
  {
    uint64_t v11 = 0;
  }
  __p = 0;
  double v16 = 0;
  uint64_t v17 = 0;
  if (a5)
  {
    sub_2407B4AEC(&__p, a5);
    uint64_t v12 = (char *)v16;
    memmove(v16, a4, 8 * a5);
    double v16 = &v12[8 * a5];
    uint64_t v13 = (const void **)__p;
    uint64_t v11 = (char *)__dst;
  }
  else
  {
    uint64_t v13 = 0;
  }
  a1[1] = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, v13, (v11 - (char *)keys) >> 3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (__p)
  {
    double v16 = __p;
    operator delete(__p);
  }
  if (keys)
  {
    __dst = keys;
    operator delete(keys);
  }
  return a1;
}

void sub_2407B4AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  sub_2407B4550(v13);
  _Unwind_Resume(a1);
}

char *sub_2407B4AEC(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2407B4B30();
  }
  uint64_t result = (char *)sub_2407B4B48((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_2407B4B30()
{
}

void *sub_2407B4B48(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_2407B4C10();
  }
  return operator new(8 * a2);
}

void sub_2407B4B80(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2407B4BDC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2650D6110, MEMORY[0x263F8C060]);
}

void sub_2407B4BC8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2407B4BDC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_2407B4C10()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *sub_2407B4C44(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    sub_2407B4C10();
  }
  return operator new(56 * a2);
}

uint64_t **sub_2407B4C90(uint64_t **a1, double *a2, _OWORD *a3)
{
  CFTypeID v6 = a1 + 1;
  double v5 = a1[1];
  if (v5)
  {
    double v7 = *a2;
    while (1)
    {
      while (1)
      {
        CFStringRef v8 = (uint64_t **)v5;
        double v9 = *((double *)v5 + 4);
        if (v7 >= v9) {
          break;
        }
        double v5 = (uint64_t *)*v5;
        CFTypeID v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      double v5 = (uint64_t *)v5[1];
      if (!v5)
      {
        CFTypeID v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    CFStringRef v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    sub_2407B4D4C(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t *sub_2407B4D4C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  double v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_2407B4DA4(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_2407B4DA4(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), double v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            double v9 = (uint64_t **)a2[2];
          }
          else
          {
            double v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *double v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *double v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_2407B4F3C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2407B4F3C(a1, *a2);
    sub_2407B4F3C(a1, a2[1]);
    operator delete(a2);
  }
}

void *sub_2407B4F90(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_2407B4C10();
  }
  return operator new(24 * a2);
}

uint64_t ACCEL_TABLE_ENTRY::acceleration<int>(unsigned int *a1)
{
  return bswap32(*a1);
}

double ACCEL_TABLE_ENTRY::acceleration<double>(unsigned int *a1)
{
  return (double)(int)bswap32(*a1) * 0.0000152587891;
}

uint64_t ACCEL_TABLE_ENTRY::count(ACCEL_TABLE_ENTRY *this)
{
  return bswap32(*((unsigned __int16 *)this + 2)) >> 16;
}

uint64_t ACCEL_TABLE_ENTRY::x<int>(uint64_t a1, unsigned int a2)
{
  return bswap32(*(_DWORD *)(a1 + 8 * a2 + 6));
}

double ACCEL_TABLE_ENTRY::x<double>(uint64_t a1, unsigned int a2)
{
  return (double)(int)bswap32(*(_DWORD *)(a1 + 8 * a2 + 6)) * 0.0000152587891;
}

uint64_t ACCEL_TABLE_ENTRY::y<int>(uint64_t a1, unsigned int a2)
{
  return bswap32(*(_DWORD *)(a1 + 8 * a2 + 10));
}

double ACCEL_TABLE_ENTRY::y<double>(uint64_t a1, unsigned int a2)
{
  return (double)(int)bswap32(*(_DWORD *)(a1 + 8 * a2 + 10)) * 0.0000152587891;
}

double ACCEL_TABLE_ENTRY::point(ACCEL_TABLE_ENTRY *this, unsigned int a2)
{
  return (double)(int)bswap32(*(_DWORD *)((char *)this + 8 * a2 + 6)) * 0.0000152587891;
}

uint64_t ACCEL_TABLE_ENTRY::length(ACCEL_TABLE_ENTRY *this)
{
  return (bswap32(*((unsigned __int16 *)this + 2)) >> 13) & 0x7FFF8 | 6;
}

uint64_t ACCEL_TABLE::scale<int>(unsigned int *a1)
{
  return bswap32(*a1);
}

double ACCEL_TABLE::scale<double>(unsigned int *a1)
{
  return (double)(int)bswap32(*a1) * 0.0000152587891;
}

uint64_t ACCEL_TABLE::count(ACCEL_TABLE *this)
{
  return bswap32(*((unsigned __int16 *)this + 4)) >> 16;
}

uint64_t ACCEL_TABLE::signature(ACCEL_TABLE *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t ACCEL_TABLE::entry(ACCEL_TABLE *this, int a2)
{
  uint64_t result = (uint64_t)this + 10;
  if (a2 >= 1)
  {
    do
    {
      result += 8 * (bswap32(*(unsigned __int16 *)(result + 4)) >> 16) + 6;
      --a2;
    }
    while (a2);
  }
  return result;
}

void *operator<<(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_2407B55A8(a1, (uint64_t)" Table: ", 8);
  uint64_t v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 16;
  char v12 = 48;
  sub_2407B5294(v4, &v12);
  int v6 = (void *)std::ostream::operator<<();
  sub_2407B55A8(v6, (uint64_t)"\n", 1);
  sub_2407B55A8(a1, (uint64_t)"   scale: ", 10);
  uint64_t v7 = (void *)std::ostream::operator<<();
  sub_2407B55A8(v7, (uint64_t)"\n", 1);
  if (*(_WORD *)(a2 + 8))
  {
    unsigned int v8 = 0;
    do
    {
      uint64_t v9 = a2 + 10;
      if (v8)
      {
        unsigned int v10 = v8;
        uint64_t v9 = a2 + 10;
        do
        {
          v9 += 8 * (bswap32(*(unsigned __int16 *)(v9 + 4)) >> 16) + 6;
          --v10;
        }
        while (v10);
      }
      sub_2407B535C(a1, v9);
      ++v8;
    }
    while (v8 < bswap32(*(unsigned __int16 *)(a2 + 8)) >> 16);
  }
  return a1;
}

void *sub_2407B5294(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
    uint64_t v5 = std::locale::use_facet(&v8, MEMORY[0x263F8C108]);
    int v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_2407B5348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

void *sub_2407B535C(void *a1, uint64_t a2)
{
  int v4 = sub_2407B55A8(a1, (uint64_t)" Entry: ", 8);
  uint64_t v5 = *v4;
  *(uint64_t *)((char *)v4 + *(void *)(*v4 - 24) + 24) = 16;
  *(_DWORD *)((char *)v4 + *(void *)(v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  int v6 = (void *)std::ostream::operator<<();
  sub_2407B55A8(v6, (uint64_t)"\n", 1);
  sub_2407B55A8(a1, (uint64_t)"    acceleration: ", 18);
  uint64_t v7 = (void *)std::ostream::operator<<();
  sub_2407B55A8(v7, (uint64_t)"\n", 1);
  if (*(_WORD *)(a2 + 4))
  {
    unint64_t v8 = 0;
    uint64_t v9 = a2 + 10;
    do
    {
      sub_2407B55A8(a1, (uint64_t)"    x: ", 7);
      unsigned int v10 = (void *)std::ostream::operator<<();
      uint64_t v11 = sub_2407B55A8(v10, (uint64_t)"(", 1);
      *(_DWORD *)((char *)v11 + *(void *)(*v11 - 24) + 8) = *(_DWORD *)((unsigned char *)v11 + *(void *)(*v11 - 24) + 8) & 0xFFFFFFB5 | 8;
      char v12 = (void *)std::ostream::operator<<();
      uint64_t v13 = sub_2407B55A8(v12, (uint64_t)")\n", 2);
      sub_2407B55A8(v13, (uint64_t)"    y: ", 7);
      uint64_t v14 = (void *)std::ostream::operator<<();
      uint64_t v15 = sub_2407B55A8(v14, (uint64_t)"(", 1);
      *(_DWORD *)((char *)v15 + *(void *)(*v15 - 24) + 8) = *(_DWORD *)((unsigned char *)v15 + *(void *)(*v15 - 24) + 8) & 0xFFFFFFB5 | 8;
      v9 += 8;
      double v16 = (void *)std::ostream::operator<<();
      sub_2407B55A8(v16, (uint64_t)")\n", 2);
      ++v8;
    }
    while (v8 < bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16);
  }
  return a1;
}

void *sub_2407B55A8(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x2455FA4B0](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unsigned int v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_2407B5754(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2455FA4C0](v13);
  return a1;
}

void sub_2407B56EC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2455FA4C0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2407B56CCLL);
}

void sub_2407B5740(_Unwind_Exception *a1)
{
}

uint64_t sub_2407B5754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      sub_2407B58E8(__p, v12, __c);
      uint64_t v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_2407B58CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2407B58E8(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_2407B5994();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void sub_2407B5994()
{
}

IOHIDPointerScrollFilter *IOHIDPointerScrollFilterFactory(uint64_t a1, const void *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (!CFEqual(a2, v4)) {
    return 0;
  }
  uint64_t v5 = (IOHIDPointerScrollFilter *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 184, 0);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0x73u, 0x61u, 0x69u, 0xDCu, 0xA8u, 0xBCu, 0x45u, 0xB4u, 0xBCu, 0x14u, 0x64u, 0x5Bu, 0x55u, 0x26u, 0xE5u, 0x85u);
  IOHIDPointerScrollFilter::IOHIDPointerScrollFilter(v5, v6);
  return v5;
}

uint64_t IOHIDPointerScrollFilter::AddRef(IOHIDPointerScrollFilter *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

uint64_t IOHIDPointerScrollFilter::close(uint64_t result)
{
  *(void *)(result + 120) = 0;
  return result;
}

{
  *(void *)(result + 120) = 0;
  return result;
}

void IOHIDPointerScrollFilter::scheduleWithDispatchQueue(IOHIDPointerScrollFilter *this, void *a2, dispatch_queue_s *a3)
{
  *((void *)this + 10) = a2;
  IOHIDPointerScrollFilter::createAccelStatsTimer((dispatch_queue_t *)this);

  IOHIDPointerScrollFilter::setupAcceleration((CFDictionaryRef *)this);
}

void *IOHIDPointerScrollFilter::setEventCallback(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

void IOHIDPointerScrollFilter::IOHIDPointerScrollFilter(IOHIDPointerScrollFilter *this, const __CFUUID *a2)
{
  *(void *)this = &IOHIDPointerScrollFilter::sIOHIDPointerScrollFilterFtbl;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 10) = 0;
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *((_DWORD *)this + 13) = 0;
  sub_2407B22F0((void *)this + 11, 0);
  sub_2407B22F0((void *)this + 13, 0);
  *((void *)this + 15) = 0;
  *((_OWORD *)this + 8) = xmmword_2407BAF30;
  *((_OWORD *)this + 9) = xmmword_2407BAF40;
  *((_DWORD *)this + 40) = 0;
  *((_WORD *)this + 82) = 257;
  *((unsigned char *)this + 166) = 1;
  *((void *)this + 21) = 0;
  *((void *)this + 22) = 60000;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 7) = 0;
  if (a2)
  {
    *((void *)this + 1) = CFRetain(a2);
    CFPlugInAddInstanceForFactory(a2);
  }
}

void sub_2407B5BFC(_Unwind_Exception *a1)
{
  sub_2407B228C(v1);
  _Unwind_Resume(a1);
}

void IOHIDPointerScrollFilter::~IOHIDPointerScrollFilter(IOHIDPointerScrollFilter *this)
{
  CFUUIDRef v2 = (const __CFUUID *)*((void *)this + 1);
  if (v2)
  {
    CFPlugInRemoveInstanceForFactory(v2);
    CFRelease(*((CFTypeRef *)this + 1));
  }
  uint64_t v3 = *((void *)this + 6);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  for (uint64_t i = 56; i != 80; i += 8)
  {
    uint64_t v5 = *(void *)((char *)this + i);
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
  }
  sub_2407B228C((void *)this + 13);
  sub_2407B228C((void *)this + 11);
}

uint64_t IOHIDPointerScrollFilter::QueryInterface(IOHIDPointerScrollFilter *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v8))|| (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    uint64_t v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    uint64_t v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t IOHIDPointerScrollFilter::AddRef(IOHIDPointerScrollFilter *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDPointerScrollFilter::Release(IOHIDPointerScrollFilter *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDPointerScrollFilter::~IOHIDPointerScrollFilter(this);
    MEMORY[0x2455FA5A0]();
  }
  return v2;
}

void IOHIDPointerScrollFilter::open(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 120) = a2;
  uint64_t v3 = (const void *)IOHIDServiceCopyProperty();
  if (v3)
  {
    *(_DWORD *)(a1 + 160) = 1;
    CFRelease(v3);
  }
}

void IOHIDPointerScrollFilter::scheduleWithDispatchQueue(IOHIDPointerScrollFilter *this, dispatch_queue_s *a2)
{
  *((void *)this + 10) = a2;
  IOHIDPointerScrollFilter::createAccelStatsTimer((dispatch_queue_t *)this);

  IOHIDPointerScrollFilter::setupAcceleration((CFDictionaryRef *)this);
}

void IOHIDPointerScrollFilter::createAccelStatsTimer(dispatch_queue_t *this)
{
  uint64_t v2 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, this[10]);
  this[21] = v2;
  if (v2)
  {
    dispatch_set_context(v2, this);
    dispatch_source_set_event_handler_f(this[21], (dispatch_function_t)IOHIDPointerScrollFilter::statsTimerCallback);
    dispatch_source_set_timer(this[21], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    uint64_t v3 = this[21];
    dispatch_resume(v3);
  }
  else
  {
    CFUUIDRef v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2407B9BC4(v4);
    }
  }
}

void IOHIDPointerScrollFilter::setupAcceleration(CFDictionaryRef *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (this[15])
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    uint64_t v2 = IOHIDPointerScrollFilter::copyCachedProperty(this, @"HIDPointerAccelerationMultiplier");
    sub_2407B45A0(&v7, v2, 1);
    if (number && (int valuePtr = 0, CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr), valuePtr))
    {
      CFNumberRef v3 = number;
    }
    else
    {
      sub_2407B98C0(&valuePtr, 0x10000);
      sub_2407B750C((uint64_t)&v7, (uint64_t)&valuePtr);
      sub_2407B23E4(&valuePtr);
      CFNumberRef v3 = number;
      if (!number)
      {
        CFUUIDRef v5 = _IOHIDLogCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          uint64_t RegistryID = (uint64_t)this[15];
          if (RegistryID) {
            uint64_t RegistryID = IOHIDServiceGetRegistryID();
          }
          int valuePtr = 138412290;
          uint64_t v10 = RegistryID;
          _os_log_impl(&dword_2407B0000, v5, OS_LOG_TYPE_INFO, "[%@] Could not get/create pointer acceleration multiplier\n", (uint8_t *)&valuePtr, 0xCu);
        }
        goto LABEL_7;
      }
    }
    int valuePtr = 0;
    CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr);
    IOHIDPointerScrollFilter::setupPointerAcceleration((IOHIDPointerScrollFilter *)this, (double)valuePtr * 0.0000152587891);
    IOHIDPointerScrollFilter::setupScrollAcceleration(this, 1.0);
    IOHIDPointerScrollFilter::startAccelStatsTimer((IOHIDPointerScrollFilter *)this);
LABEL_7:
    sub_2407B23E4(&v7);
    return;
  }
  CFUUIDRef v4 = _IOHIDLogCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_2407B9C08((uint64_t)this, v4);
  }
}

void sub_2407B6194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void IOHIDPointerScrollFilter::unscheduleFromDispatchQueue(CFTypeRef *this, dispatch_queue_s *a2)
{
  if (this[21])
  {
    CFTypeRef v3 = CFRetain(this[15]);
    CFUUIDRef v4 = this[10];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = sub_2407B6260;
    v5[3] = &unk_2650D6198;
    v5[4] = this;
    v5[5] = v3;
    dispatch_async(v4, v5);
  }
  this[10] = 0;
}

void sub_2407B6260(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_source_cancel(*(dispatch_source_t *)(v2 + 168));
  dispatch_release(*(dispatch_object_t *)(v2 + 168));
  CFTypeRef v3 = *(const void **)(a1 + 40);

  CFRelease(v3);
}

CFTypeRef IOHIDPointerScrollFilter::copyPropertyForClient(IOHIDPointerScrollFilter *this, CFTypeRef cf1, const void *a3)
{
  if (!CFEqual(cf1, @"ServiceFilterDebug")) {
    return 0;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B22F0(&v6, 0);
  IOHIDPointerScrollFilter::serialize(this, (__CFDictionary *)cf);
  if (cf) {
    CFTypeRef v4 = CFRetain(cf);
  }
  else {
    CFTypeRef v4 = 0;
  }
  sub_2407B228C(&v6);
  return v4;
}

void sub_2407B6340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDPointerScrollFilter::serialize(IOHIDPointerScrollFilter *this, __CFDictionary *a2)
{
  v42 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef v43 = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407B2140(&v42, a2, 0);
  v42 = &unk_26F4E7380;
  if (v43)
  {
    CFTypeRef v3 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDPointerAccelerationType");
    v41[0] = &unk_26F4E77C8;
    v41[1] = v3;
    if (v3) {
      CFDictionarySetValue(v43, @"HIDPointerAccelerationType", v3);
    }
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v40 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    CFTypeRef v4 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDPointerAccelerationAlgorithm");
    sub_2407B45A0(&v39, v4, 1);
    if (v40)
    {
      CFTypeID v5 = CFGetTypeID(v40);
      if (v5 == CFNumberGetTypeID())
      {
        value.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        value.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        valuePtr.__r_.__value_.__s.__data_[0] = 0;
        CFNumberGetValue(v40, kCFNumberSInt8Type, &valuePtr);
        if ((unint64_t)valuePtr.__r_.__value_.__s.__data_[0] > 2) {
          unint64_t v6 = @"Unknown";
        }
        else {
          unint64_t v6 = *(&off_2650D6200 + valuePtr.__r_.__value_.__s.__data_[0]);
        }
        sub_2407B95B8(&value, v6, 0);
        if (value.__r_.__value_.__l.__size_) {
          CFDictionarySetValue(v43, @"HIDPointerAccelerationAlgorithm", (const void *)value.__r_.__value_.__l.__size_);
        }
        sub_2407B96C4(&value);
      }
    }
    v37 = (void *)0xAAAAAAAAAAAAAAAALL;
    unint64_t v38 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v7 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDScrollAccelerationType");
    v37 = &unk_26F4E77C8;
    unint64_t v38 = (unint64_t)v7;
    if (v7) {
      CFDictionarySetValue(v43, @"HIDScrollAccelerationType", v7);
    }
    unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v36 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    CFUUIDRef v8 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDScrollAccelerationAlgorithm");
    sub_2407B45A0(&v35, v8, 1);
    if (v36)
    {
      CFTypeID v9 = CFGetTypeID(v36);
      if (v9 == CFNumberGetTypeID())
      {
        value.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
        value.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        valuePtr.__r_.__value_.__s.__data_[0] = 0;
        CFNumberGetValue(v36, kCFNumberSInt8Type, &valuePtr);
        if ((unint64_t)valuePtr.__r_.__value_.__s.__data_[0] > 2) {
          uint64_t v10 = @"Unknown";
        }
        else {
          uint64_t v10 = *(&off_2650D6200 + valuePtr.__r_.__value_.__s.__data_[0]);
        }
        sub_2407B95B8(&value, v10, 0);
        if (value.__r_.__value_.__l.__size_) {
          CFDictionarySetValue(v43, @"HIDScrollAccelerationAlgorithm", (const void *)value.__r_.__value_.__l.__size_);
        }
        sub_2407B96C4(&value);
      }
    }
    CFDictionarySetValue(v43, @"Class", @"IOHIDPointerScrollFilter");
    sub_2407B1820((uint64_t)&v42, @"PointerAccelerationValue", vcvtd_n_u64_f64(*((double *)this + 16), 0x10uLL));
    sub_2407B1820((uint64_t)&v42, @"PointerAccelerationMinimum", vcvtd_n_u64_f64(*((double *)this + 17), 0x10uLL));
    sub_2407B1820((uint64_t)&v42, @"ScrollAccelerationValue", vcvtd_n_u64_f64(*((double *)this + 18), 0x10uLL));
    sub_2407B1820((uint64_t)&v42, @"MatchScore", *((int *)this + 5));
    uint64_t v11 = (const void *)*((void *)this + 12);
    if (v11) {
      CFDictionarySetValue(v43, @"Property", v11);
    }
    if (*((void *)this + 6))
    {
      value.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
      value.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
      sub_2407B22F0(&value, 0);
      (*(void (**)(void, std::string::size_type))(**((void **)this + 6) + 24))(*((void *)this + 6), value.__r_.__value_.__l.__size_);
      if (value.__r_.__value_.__l.__size_) {
        CFDictionarySetValue(v43, @"Pointer Accelerator", (const void *)value.__r_.__value_.__l.__size_);
      }
      sub_2407B228C(&value);
    }
    uint64_t v12 = 0;
    uint64_t v13 = (char *)this + 56;
    do
    {
      if (*(void *)&v13[v12 * 8])
      {
        unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v34 = (void *)0xAAAAAAAAAAAAAAAALL;
        sub_2407B22F0(&v33, 0);
        unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
        key = (void *)0xAAAAAAAAAAAAAAAALL;
        sub_2407B9784(&valuePtr, "Scroll Accelerator(axis: ");
        sub_2407B9784(v25, off_2650D61E8[v12]);
        if ((v26 & 0x80u) == 0) {
          uint64_t v14 = v25;
        }
        else {
          uint64_t v14 = (void **)v25[0];
        }
        if ((v26 & 0x80u) == 0) {
          std::string::size_type v15 = v26;
        }
        else {
          std::string::size_type v15 = (std::string::size_type)v25[1];
        }
        double v16 = std::string::append(&valuePtr, (const std::string::value_type *)v14, v15);
        long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
        value.__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
        *(_OWORD *)&value.__r_.__value_.__l.__data_ = v17;
        v16->__r_.__value_.__l.__size_ = 0;
        v16->__r_.__value_.__r.__words[2] = 0;
        v16->__r_.__value_.__r.__words[0] = 0;
        sub_2407B9784(v23, ")");
        if ((v24 & 0x80u) == 0) {
          double v18 = v23;
        }
        else {
          double v18 = (void **)v23[0];
        }
        if ((v24 & 0x80u) == 0) {
          std::string::size_type v19 = v24;
        }
        else {
          std::string::size_type v19 = (std::string::size_type)v23[1];
        }
        uint64_t v20 = std::string::append(&value, (const std::string::value_type *)v18, v19);
        long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
        std::string::size_type v30 = v20->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v21;
        v20->__r_.__value_.__l.__size_ = 0;
        v20->__r_.__value_.__r.__words[2] = 0;
        v20->__r_.__value_.__r.__words[0] = 0;
        sub_2407B9714(&v31, (const char *)__p);
        if (SHIBYTE(v30) < 0) {
          operator delete(__p[0]);
        }
        if ((char)v24 < 0) {
          operator delete(v23[0]);
        }
        if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(value.__r_.__value_.__l.__data_);
        }
        if ((char)v26 < 0) {
          operator delete(v25[0]);
        }
        if (SHIBYTE(valuePtr.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(valuePtr.__r_.__value_.__l.__data_);
        }
        (*(void (**)(void, void *))(**(void **)&v13[v12 * 8] + 24))(*(void *)&v13[v12 * 8], v34);
        if (key && v34) {
          CFDictionarySetValue(v43, key, v34);
        }
        sub_2407B96C4(&v31);
        sub_2407B228C(&v33);
      }
      ++v12;
    }
    while (v12 != 3);
    sub_2407B23E4(&v35);
    sub_2407B96C4(&v37);
    sub_2407B23E4(&v39);
    sub_2407B96C4(v41);
  }
  return sub_2407B228C(&v42);
}

void sub_2407B6898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,uint64_t a41,char a42,uint64_t a43,char a44)
{
  sub_2407B96C4(&a28);
  sub_2407B23E4((void *)(v44 - 160));
  sub_2407B96C4((void *)(v44 - 144));
  sub_2407B23E4((void *)(v44 - 128));
  sub_2407B96C4((void *)(v44 - 112));
  sub_2407B228C((void *)(v44 - 96));
  _Unwind_Resume(a1);
}

void IOHIDPointerScrollFilter::setPropertyForClient(CFMutableDictionaryRef *this, CFStringRef theString1, const void *a3, const void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (theString1)
  {
    if (CFStringCompare(theString1, @"DropAccelPropertyEvents", 0))
    {
      if (CFStringCompare(theString1, @"IOHIDAcclerationStatsDelayMS", 0))
      {
        uint64_t v8 = 0;
        while (!CFEqual(theString1, *(__CFString **)((char *)&IOHIDPointerScrollFilter::_cachedPropertyList + v8)))
        {
          v8 += 8;
          if (v8 == 152) {
            return;
          }
        }
        if (a3)
        {
          CFDictionarySetValue(this[14], theString1, a3);
          CFDictionarySetValue(this[12], theString1, a3);
        }
        uint64_t v10 = _IOHIDLogCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t RegistryID = (uint64_t)this[15];
          if (RegistryID) {
            uint64_t RegistryID = IOHIDServiceGetRegistryID();
          }
          CFMutableDictionaryRef v12 = this[10];
          int v14 = 138413314;
          if (v12) {
            uint64_t v13 = "yes";
          }
          else {
            uint64_t v13 = "no";
          }
          uint64_t v15 = RegistryID;
          __int16 v16 = 2112;
          CFStringRef v17 = theString1;
          __int16 v18 = 2112;
          std::string::size_type v19 = a3;
          __int16 v20 = 2080;
          long long v21 = v13;
          __int16 v22 = 2112;
          long long v23 = a4;
          _os_log_impl(&dword_2407B0000, v10, OS_LOG_TYPE_DEFAULT, "[%@] Acceleration key:%@ value:%@ apply:%s client:%@\n", (uint8_t *)&v14, 0x34u);
        }
        if (this[10])
        {
          IOHIDPointerScrollFilter::setupAcceleration(this);
          CFDictionaryRemoveAllValues(this[14]);
        }
      }
      else
      {
        CFTypeID v9 = CFGetTypeID(a3);
        if (v9 == CFNumberGetTypeID())
        {
          CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, this + 22);
        }
      }
    }
    else
    {
      *((unsigned char *)this + 166) = *MEMORY[0x263EFFB40] == (void)a3;
    }
  }
}

uint64_t IOHIDPointerScrollFilter::match(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (IOHIDServiceConformsTo() || IOHIDServiceConformsTo())
  {
    int v2 = 100;
  }
  else
  {
    int v2 = 100;
    if (!IOHIDServiceConformsTo())
    {
      if (IOHIDServiceConformsTo()) {
        int v2 = 100;
      }
      else {
        int v2 = 0;
      }
    }
  }
  *(_DWORD *)(a1 + 20) = v2;
  CFTypeRef v3 = _IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = IOHIDServiceGetRegistryID();
    int v6 = *(_DWORD *)(a1 + 20);
    int v7 = 134218498;
    uint64_t v8 = a1;
    __int16 v9 = 2112;
    uint64_t v10 = RegistryID;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_debug_impl(&dword_2407B0000, v3, OS_LOG_TYPE_DEBUG, "(%p) for ServiceID %@ with score %d\n", (uint8_t *)&v7, 0x1Cu);
  }
  return *(unsigned int *)(a1 + 20);
}

uint64_t IOHIDPointerScrollFilter::filter(void *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = IOHIDPointerScrollFilter::filterPropertyEvent((uint64_t)a1, a2);
  if (a1[6] && IOHIDEventConformsTo() && !IOHIDEventIsAbsolute()
    || (a1[7] || a1[8] || a1[9]) && IOHIDEventConformsTo())
  {
    IOHIDPointerScrollFilter::accelerateEvent((uint64_t)a1);
  }
  return v3;
}

uint64_t IOHIDPointerScrollFilter::filterPropertyEvent(uint64_t a1, uint64_t a2)
{
  if (IOHIDEventConformsTo() && IOHIDEventGetIntegerValue() == 65280 && IOHIDEventGetIntegerValue() == 91)
  {
    DataCFDictionaryRef Value = (const char *)IOHIDEventGetDataValue();
    CFStringRef errorString = 0;
    size_t IntegerValue = IOHIDEventGetIntegerValue();
    CFDictionaryRef v6 = (const __CFDictionary *)IOCFUnserializeBinary(DataValue, IntegerValue, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, &errorString);
    if (errorString)
    {
      int v7 = _IOHIDLogCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_2407B9C80(&errorString, v7);
      }
      CFStringRef v8 = errorString;
      goto LABEL_16;
    }
    CFDictionaryRef v9 = v6;
    if (v6)
    {
      CFTypeID v10 = CFGetTypeID(v6);
      if (v10 != CFDictionaryGetTypeID()
        || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v9, @"IOHIDSetAcceleration")) == 0
        || (v12 = Value, CFTypeID v13 = CFGetTypeID(Value), v13 != CFDictionaryGetTypeID()))
      {
        CFStringRef v8 = (CFStringRef)v9;
LABEL_16:
        CFRelease(v8);
        return a2;
      }
      CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_2407B7370, *(void **)(a1 + 120));
      int v14 = *(unsigned __int8 *)(a1 + 166);
      CFRelease(v9);
      if (v14) {
        return 0;
      }
    }
  }
  return a2;
}

uint64_t IOHIDPointerScrollFilter::accelerateEvent(uint64_t a1)
{
  v34[3] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    if (*(unsigned char *)(a1 + 164))
    {
      if (IOHIDEventGetType() == 17
        && (IOHIDEventGetEventFlags() & 0x100) == 0
        && (IOHIDEventGetEventFlags() & 0x10000) == 0)
      {
        IOHIDEventGetFloatValue();
        double v3 = v2;
        *(double *)buf = v2;
        IOHIDEventGetFloatValue();
        *(double *)&buf[8] = v4;
        if (v3 != 0.0 || v4 != 0.0)
        {
          uint64_t v5 = *(void *)(a1 + 48);
          uint64_t TimeStamp = IOHIDEventGetTimeStamp();
          if ((*(unsigned int (**)(uint64_t, unsigned char *, uint64_t, uint64_t))(*(void *)v5 + 16))(v5, buf, 2, TimeStamp))
          {
            uint64_t Copy = IOHIDEventCreateCopy();
            if (Copy)
            {
              CFStringRef v8 = (const void *)Copy;
              Children = (__CFArray *)IOHIDEventGetChildren();
              if (Children) {
                CFArrayRemoveAllValues(Children);
              }
              IOHIDEventSetFloatValue();
              IOHIDEventSetFloatValue();
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
              IOHIDEventAppendEvent();
              CFRelease(v8);
            }
          }
        }
      }
    }
  }
  if (*(unsigned char *)(a1 + 165)
    && IOHIDEventGetType() == 6
    && (IOHIDEventGetEventFlags() & 0x100) == 0
    && (IOHIDEventGetEventFlags() & 0x10000) == 0)
  {
    memset(v34, 255, 24);
    if (IOHIDEventGetScrollMomentum() && (CFNumberRef v10 = (const __CFNumber *)_IOHIDEventCopyAttachment()) != 0)
    {
      CFNumberRef v11 = v10;
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 == CFNumberGetTypeID())
      {
        double v13 = *(double *)(a1 + 152);
        float valuePtr = 60.0;
        CFNumberGetValue(v11, kCFNumberFloatType, &valuePtr);
        double v14 = valuePtr / 60.0;
        *(double *)(a1 + 152) = v14;
        if (vabdd_f64(v13, v14) > 0.5)
        {
          uint64_t v15 = _IOHIDLogCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            uint64_t RegistryID = *(void *)(a1 + 120);
            if (RegistryID) {
              uint64_t RegistryID = IOHIDServiceGetRegistryID();
            }
            uint64_t v17 = *(void *)(a1 + 152);
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = RegistryID;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v13;
            __int16 v32 = 2048;
            uint64_t v33 = v17;
            _os_log_impl(&dword_2407B0000, v15, OS_LOG_TYPE_INFO, "[%@] _scrollMomentumMult:%.3f->%.3f\n", buf, 0x20u);
          }
        }
      }
      else
      {
        *(void *)(a1 + 152) = 0x3FF0000000000000;
      }
      CFRelease(v11);
    }
    else
    {
      *(void *)(a1 + 152) = 0x3FF0000000000000;
    }
    uint64_t v18 = 0;
    int v19 = 0;
    __int16 v20 = &dword_2407BAF88;
    do
    {
      ++v20;
      IOHIDEventGetFloatValue();
      __int16 v22 = (double *)&v34[v18];
      *(double *)&v34[v18] = v21;
      if (v21 != 0.0)
      {
        uint64_t v23 = *(void *)(a1 + 56 + v18 * 8);
        if (v23)
        {
          double *v22 = *(double *)(a1 + 152) * v21;
          uint64_t v24 = IOHIDEventGetTimeStamp();
          v19 |= (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)v23 + 16))(v23, &v34[v18], 1, v24);
          double *v22 = *v22 / *(double *)(a1 + 152);
        }
      }
      ++v18;
    }
    while (v18 != 3);
    if (v19)
    {
      uint64_t v25 = IOHIDEventCreateCopy();
      if (v25)
      {
        unsigned __int8 v26 = (const void *)v25;
        double v27 = (__CFArray *)IOHIDEventGetChildren();
        if (v27) {
          CFArrayRemoveAllValues(v27);
        }
        for (uint64_t i = 0; i != 3; ++i)
        {
          *(double *)&v34[i] = *(double *)&v34[i] * 10.0;
          IOHIDEventSetFloatValue();
        }
        IOHIDEventGetEventFlags();
        IOHIDEventSetEventFlags();
        IOHIDEventAppendEvent();
        CFRelease(v26);
      }
    }
  }
  return IOHIDPointerScrollFilter::accelerateChildrens(a1);
}

uint64_t sub_2407B7370(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270EF46B0](a3, a1, a2);
}

uint64_t IOHIDPointerScrollFilter::accelerateChildrens(uint64_t a1)
{
  uint64_t result = IOHIDEventGetChildren();
  if (result)
  {
    CFArrayRef v3 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      uint64_t v4 = result;
      for (CFIndex i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        uint64_t result = IOHIDPointerScrollFilter::accelerateEvent(a1, ValueAtIndex);
      }
    }
  }
  return result;
}

uint64_t IOHIDPointerScrollFilter::createPointerTableAlgorithm(IOHIDPointerScrollFilter *this, int a2)
{
  uint64_t v4 = (IOHIDTableAcceleration *)IOHIDServiceCopyProperty();
  CFNumberRef v10 = &unk_26F4E77E8;
  CFNumberRef v11 = v4;
  if (v4
    || (CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], byte_2407BAF94, 102),
        v9[0] = &unk_26F4E77E8,
        v9[1] = v6,
        sub_2407B750C((uint64_t)&v10, (uint64_t)v9),
        sub_2407B9870(v9),
        (uint64_t v4 = v11) != 0))
  {
    uint64_t v7 = IOHIDTableAcceleration::CreateWithTable(v4, v5, *((double *)this + 16), (double)a2 * 0.0000152587891, 67.0);
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_2407B9870(&v10);
  return v7;
}

void sub_2407B74E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

uint64_t sub_2407B750C(uint64_t a1, uint64_t a2)
{
  CFArrayRef v3 = *(const void **)(a1 + 8);
  uint64_t v4 = *(const void **)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  if (v4) {
    CFRetain(v4);
  }
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

uint64_t IOHIDPointerScrollFilter::createPointerParametricAlgorithm(IOHIDPointerScrollFilter *this, int a2)
{
  CFNumberRef v11 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFArrayRef theArray = (CFArrayRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"UserPointerAccelCurvesKey");
  sub_2407B463C(&v11, v4, 1);
  CFNumberRef v11 = &unk_26F4E75D8;
  if (theArray && CFArrayGetCount(theArray) >= 1)
  {
    uint64_t v6 = IOHIDParametricAcceleration::CreateWithParameters(theArray, v5, *((double *)this + 16), (double)a2 * 0.0000152587891, 67.0);
  }
  else
  {
    uint64_t v7 = (IOHIDParametricAcceleration *)IOHIDServiceCopyProperty();
    v10[0] = &unk_26F4E7658;
    v10[1] = v7;
    if (v7) {
      uint64_t v6 = IOHIDParametricAcceleration::CreateWithParameters(v7, v8, *((double *)this + 16), (double)a2 * 0.0000152587891, 67.0);
    }
    else {
      uint64_t v6 = 0;
    }
    sub_2407B4788(v10);
  }
  sub_2407B4788(&v11);
  return v6;
}

void sub_2407B7680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

const void *IOHIDPointerScrollFilter::copyCachedProperty(CFDictionaryRef *this, const __CFString *a2)
{
  CFDictionaryRef Value = CFDictionaryGetValue(this[14], a2);
  if (Value
    || (CFDictionaryRef Value = (const void *)IOHIDServiceCopyProperty()) == 0 && (CFDictionaryRef Value = CFDictionaryGetValue(this[12], a2)) != 0)
  {
    CFRetain(Value);
  }
  return Value;
}

uint64_t IOHIDPointerScrollFilter::createPointerAlgorithm(CFDictionaryRef *this, int a2)
{
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = IOHIDPointerScrollFilter::copyCachedProperty(this, @"HIDPointerAccelerationAlgorithm");
  sub_2407B45A0(&v9, v4, 1);
  if (cf)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
      if (!valuePtr) {
        goto LABEL_7;
      }
      if (valuePtr == 1)
      {
        uint64_t PointerParametricAlgorithm = IOHIDPointerScrollFilter::createPointerParametricAlgorithm((IOHIDPointerScrollFilter *)this, a2);
        goto LABEL_10;
      }
      if (valuePtr != 2)
      {
        uint64_t v6 = 0;
        goto LABEL_11;
      }
    }
  }
  uint64_t v6 = IOHIDPointerScrollFilter::createPointerParametricAlgorithm((IOHIDPointerScrollFilter *)this, a2);
  if (!v6)
  {
LABEL_7:
    uint64_t PointerParametricAlgorithm = IOHIDPointerScrollFilter::createPointerTableAlgorithm((IOHIDPointerScrollFilter *)this, a2);
LABEL_10:
    uint64_t v6 = PointerParametricAlgorithm;
  }
LABEL_11:
  sub_2407B23E4(&v9);
  return v6;
}

void sub_2407B7814(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2407B23E4((uint64_t *)va);
  _Unwind_Resume(a1);
}

const void *sub_2407B782C(uint64_t a1)
{
  uint64_t result = *(const void **)(a1 + 8);
  if (result)
  {
    CFTypeID v2 = CFGetTypeID(result);
    return (const void *)(v2 == CFNumberGetTypeID());
  }
  return result;
}

uint64_t IOHIDPointerScrollFilter::createScrollTableAlgorithm(IOHIDPointerScrollFilter *this, unint64_t a2, int a3, int a4)
{
  uint64_t v7 = (IOHIDTableAcceleration *)IOHIDServiceCopyProperty();
  double v14 = &unk_26F4E77E8;
  uint64_t v15 = v7;
  if (v7) {
    goto LABEL_4;
  }
  CFTypeID v12 = &unk_26F4E77E8;
  uint64_t v13 = IOHIDServiceCopyProperty();
  sub_2407B750C((uint64_t)&v14, (uint64_t)&v12);
  sub_2407B9870(&v12);
  uint64_t v7 = v15;
  if (v15
    || (CFDataRef v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], byte_2407BAF94, 102),
        CFTypeID v12 = &unk_26F4E77E8,
        uint64_t v13 = (uint64_t)v9,
        sub_2407B750C((uint64_t)&v14, (uint64_t)&v12),
        sub_2407B9870(&v12),
        (uint64_t v7 = v15) != 0))
  {
LABEL_4:
    uint64_t v10 = IOHIDTableAcceleration::CreateWithTable(v7, v8, *((double *)this + 18), (double)a3 * 0.0000152587891, (double)a4 * 0.0000152587891);
  }
  else
  {
    uint64_t v10 = 0;
  }
  sub_2407B9870(&v14);
  return v10;
}

void sub_2407B79B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

uint64_t IOHIDPointerScrollFilter::createScrollParametricAlgorithm(IOHIDPointerScrollFilter *this, unint64_t a2, int a3, int a4)
{
  double v14 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFArrayRef theArray = (CFArrayRef)0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"UserScrollAccelCurvesKey");
  sub_2407B463C(&v14, v7, 1);
  double v14 = &unk_26F4E75D8;
  if (theArray && CFArrayGetCount(theArray) >= 1)
  {
    uint64_t v9 = IOHIDParametricAcceleration::CreateWithParameters(theArray, v8, *((double *)this + 18), (double)a3 * 0.0000152587891, (double)a4 * 0.0000152587891);
  }
  else
  {
    uint64_t v10 = (IOHIDParametricAcceleration *)IOHIDServiceCopyProperty();
    v13[0] = &unk_26F4E7658;
    v13[1] = v10;
    if (v10) {
      uint64_t v9 = IOHIDParametricAcceleration::CreateWithParameters(v10, v11, *((double *)this + 18), (double)a3 * 0.0000152587891, (double)a4 * 0.0000152587891);
    }
    else {
      uint64_t v9 = 0;
    }
    sub_2407B4788(v13);
  }
  sub_2407B4788(&v14);
  return v9;
}

void sub_2407B7B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

uint64_t IOHIDPointerScrollFilter::createScrollAlgorithm(CFDictionaryRef *this, unint64_t a2, int a3, int a4)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFArrayRef v8 = IOHIDPointerScrollFilter::copyCachedProperty(this, @"HIDScrollAccelerationAlgorithm");
  sub_2407B45A0(&v14, v8, 1);
  if (cf)
  {
    CFTypeID v10 = CFGetTypeID(cf);
    if (v10 == CFNumberGetTypeID())
    {
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
      if (!valuePtr) {
        goto LABEL_7;
      }
      if (valuePtr == 1)
      {
        uint64_t ScrollParametricAlgorithm = IOHIDPointerScrollFilter::createScrollParametricAlgorithm((IOHIDPointerScrollFilter *)this, v9, a3, a4);
        goto LABEL_10;
      }
      if (valuePtr != 2)
      {
        uint64_t v11 = 0;
        goto LABEL_11;
      }
    }
  }
  uint64_t v11 = IOHIDPointerScrollFilter::createScrollParametricAlgorithm((IOHIDPointerScrollFilter *)this, v9, a3, a4);
  if (!v11)
  {
LABEL_7:
    uint64_t ScrollParametricAlgorithm = IOHIDPointerScrollFilter::createScrollTableAlgorithm((IOHIDPointerScrollFilter *)this, a2, a3, a4);
LABEL_10:
    uint64_t v11 = ScrollParametricAlgorithm;
  }
LABEL_11:
  sub_2407B23E4(&v14);
  return v11;
}

void sub_2407B7C58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2407B23E4((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *IOHIDPointerScrollFilter::setupPointerAcceleration(IOHIDPointerScrollFilter *this, double a2)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  int v3 = *((_DWORD *)this + 40);
  uint64_t result = (void *)*((void *)this + 6);
  if (!v3)
  {
    *((void *)this + 6) = 0;
    if (result) {
      (*(void (**)(void *, double))(*result + 8))(result, a2);
    }
    unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
    CFTypeID v5 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDSupportsPointerAcceleration");
    sub_2407B9458(&v58, v5, 1);
    if (v59) {
      unsigned __int8 v6 = sub_2407B88A8((uint64_t)&v58);
    }
    else {
      unsigned __int8 v6 = 1;
    }
    *((unsigned char *)this + 164) = v6;
    unint64_t v56 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    uint64_t v7 = (const void *)IOHIDServiceCopyProperty();
    sub_2407B45A0(&v56, v7, 1);
    if (!number
      || (*(_DWORD *)int valuePtr = 0, CFNumberGetValue(number, kCFNumberSInt32Type, valuePtr), !*(_DWORD *)valuePtr))
    {
      sub_2407B98C0(valuePtr, 26214400);
      sub_2407B750C((uint64_t)&v56, (uint64_t)valuePtr);
      sub_2407B23E4(valuePtr);
      if (!number)
      {
        __int16 v16 = _IOHIDLogCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          uint64_t RegistryID = *((void *)this + 15);
          if (RegistryID) {
            uint64_t RegistryID = IOHIDServiceGetRegistryID();
          }
          *(_DWORD *)int valuePtr = 138412290;
          *(void *)&valuePtr[4] = RegistryID;
          _os_log_impl(&dword_2407B0000, v16, OS_LOG_TYPE_INFO, "[%@] Could not get/create pointer resolution\n", valuePtr, 0xCu);
        }
        goto LABEL_81;
      }
    }
    unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v55 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    CFArrayRef v8 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDPointerReportRate");
    sub_2407B45A0(&v54, v8, 1);
    if (!v55)
    {
      sub_2407B98C0(valuePtr, 0);
      sub_2407B750C((uint64_t)&v54, (uint64_t)valuePtr);
      sub_2407B23E4(valuePtr);
      if (!v55)
      {
        uint64_t v18 = _IOHIDLogCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = *((void *)this + 15);
          if (v19) {
            uint64_t v19 = IOHIDServiceGetRegistryID();
          }
          *(_DWORD *)int valuePtr = 138412290;
          *(void *)&valuePtr[4] = v19;
          _os_log_impl(&dword_2407B0000, v18, OS_LOG_TYPE_INFO, "[%@] Could not get/create pointer report rate\n", valuePtr, 0xCu);
        }
        goto LABEL_80;
      }
    }
    v52 = &unk_26F4E7818;
    CFTypeRef cf1 = 0;
    v50 = &unk_26F4E7818;
    CFTypeRef cf = 0;
    v48 = &unk_26F4E7818;
    CFTypeRef v49 = 0;
    v46 = &unk_26F4E7818;
    CFTypeRef v47 = 0;
    uint64_t v44 = &unk_26F4E7420;
    CFNumberRef v45 = 0;
    unint64_t v9 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDPointerAccelerationType");
    *(void *)int valuePtr = &unk_26F4E7818;
    *(void *)&valuePtr[8] = v9;
    sub_2407B750C((uint64_t)&v52, (uint64_t)valuePtr);
    sub_2407B9974(valuePtr);
    if (cf1)
    {
      CFTypeID v10 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, (const __CFString *)cf1);
      *(void *)int valuePtr = &unk_26F4E7818;
      *(void *)&valuePtr[8] = v10;
      sub_2407B750C((uint64_t)&v50, (uint64_t)valuePtr);
      uint64_t v11 = sub_2407B9974(valuePtr);
      sub_2407B45A0(v11, cf, 0);
      sub_2407B750C((uint64_t)&v44, (uint64_t)valuePtr);
      sub_2407B23E4(valuePtr);
      BOOL v12 = CFEqual(cf1, @"HIDMouseAcceleration") != 0;
    }
    else
    {
      BOOL v12 = 0;
    }
    CFNumberRef v13 = v45;
    if (!v45)
    {
      unint64_t v14 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDMouseAcceleration");
      *(void *)int valuePtr = &unk_26F4E7818;
      *(void *)&valuePtr[8] = v14;
      sub_2407B750C((uint64_t)&v48, (uint64_t)valuePtr);
      uint64_t v15 = sub_2407B9974(valuePtr);
      sub_2407B45A0(v15, v49, 0);
      sub_2407B750C((uint64_t)&v44, (uint64_t)valuePtr);
      sub_2407B23E4(valuePtr);
      CFNumberRef v13 = v45;
      if (v45)
      {
        BOOL v12 = 1;
      }
      else
      {
        __int16 v20 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDPointerAcceleration");
        *(void *)int valuePtr = &unk_26F4E7818;
        *(void *)&valuePtr[8] = v20;
        sub_2407B750C((uint64_t)&v46, (uint64_t)valuePtr);
        double v21 = sub_2407B9974(valuePtr);
        sub_2407B45A0(v21, v47, 0);
        sub_2407B750C((uint64_t)&v44, (uint64_t)valuePtr);
        sub_2407B23E4(valuePtr);
        BOOL v12 = 0;
        CFNumberRef v13 = v45;
        if (!v45) {
          goto LABEL_30;
        }
      }
    }
    *(_DWORD *)int valuePtr = 0;
    CFNumberGetValue(v13, kCFNumberSInt32Type, valuePtr);
    *((double *)this + 16) = (double)*(int *)valuePtr * 0.0000152587891;
LABEL_30:
    __int16 v22 = _IOHIDLogCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *((void *)this + 15);
      if (v23) {
        uint64_t v23 = IOHIDServiceGetRegistryID();
      }
      uint64_t v24 = "enabled";
      if (*((double *)this + 16) < 0.0) {
        uint64_t v24 = "disabled";
      }
      *(_DWORD *)int valuePtr = 138414338;
      *(void *)&valuePtr[4] = v23;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = v24;
      __int16 v62 = 2112;
      CFTypeRef v63 = cf1;
      __int16 v64 = 2112;
      CFTypeRef v65 = cf;
      __int16 v66 = 2080;
      v67 = "HIDMouseAcceleration";
      __int16 v68 = 2112;
      CFTypeRef v69 = v49;
      __int16 v70 = 2080;
      v71 = "HIDPointerAcceleration";
      __int16 v72 = 2112;
      CFTypeRef v73 = v47;
      __int16 v74 = 2112;
      CFNumberRef v75 = v45;
      _os_log_impl(&dword_2407B0000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Pointer acceleration (%s) %@:%@ %s:%@ %s:%@ %@\n", valuePtr, 0x5Cu);
    }
    if (*((double *)this + 16) < 0.0) {
      goto LABEL_79;
    }
    uint64_t v25 = _IOHIDLogCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 15)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407B9D4C();
    }
    unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v43 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    unsigned __int8 v26 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDUseLinearScalingMouseAcceleration");
    sub_2407B45A0(&v42, v26, 1);
    double v27 = _IOHIDLogCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 15)) {
        uint64_t v34 = IOHIDServiceGetRegistryID();
      }
      else {
        uint64_t v34 = 0;
      }
      unsigned int v35 = sub_2407B782C((uint64_t)&v42);
      CFNumberRef v36 = "no";
      if (v12) {
        v37 = "yes";
      }
      else {
        v37 = "no";
      }
      *(_DWORD *)int valuePtr = 138412802;
      *(void *)&valuePtr[4] = v34;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = v37;
      if (v35) {
        CFNumberRef v36 = "yes";
      }
      __int16 v62 = 2080;
      CFTypeRef v63 = v36;
      _os_log_debug_impl(&dword_2407B0000, v27, OS_LOG_TYPE_DEBUG, "[%@] Is mouse acceleration? %s Use linear? %s\n", valuePtr, 0x20u);
      if (!v12) {
        goto LABEL_72;
      }
    }
    else if (!v12)
    {
LABEL_72:
      *(_DWORD *)int valuePtr = 0;
      CFNumberGetValue(number, kCFNumberSInt32Type, valuePtr);
      if (IOHIDPointerScrollFilter::createPointerAlgorithm((CFDictionaryRef *)this, *(int *)valuePtr)) {
        operator new();
      }
      unint64_t v38 = _IOHIDLogCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = *((void *)this + 15);
        if (v39) {
          uint64_t v39 = IOHIDServiceGetRegistryID();
        }
        *(_DWORD *)int valuePtr = 138412290;
        *(void *)&valuePtr[4] = v39;
        _os_log_impl(&dword_2407B0000, v38, OS_LOG_TYPE_INFO, "[%@] Could not create accelerator\n", valuePtr, 0xCu);
      }
      sub_2407B23E4(&v42);
LABEL_79:
      sub_2407B23E4(&v44);
      sub_2407B9974(&v46);
      sub_2407B9974(&v48);
      sub_2407B9974(&v50);
      sub_2407B9974(&v52);
LABEL_80:
      sub_2407B23E4(&v54);
LABEL_81:
      sub_2407B23E4(&v56);
      return sub_2407B9568(&v58);
    }
    if (v43)
    {
      *(_DWORD *)int valuePtr = 0;
      CFNumberGetValue(v43, kCFNumberSInt32Type, valuePtr);
      if (*(_DWORD *)valuePtr)
      {
        double v28 = _IOHIDLogCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = *((void *)this + 15);
          if (v29) {
            uint64_t v29 = IOHIDServiceGetRegistryID();
          }
          *(_DWORD *)int valuePtr = 138412290;
          *(void *)&valuePtr[4] = v29;
          _os_log_impl(&dword_2407B0000, v28, OS_LOG_TYPE_DEFAULT, "[%@] Using linear scaling\n", valuePtr, 0xCu);
        }
        if (*((double *)this + 16) == 0.0)
        {
          unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
          CFNumberRef v41 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
          std::string::size_type v30 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)this, @"HIDPointerAccelerationMinimum");
          sub_2407B45A0(&v40, v30, 1);
          if (sub_2407B782C((uint64_t)&v40)
            && (*(_DWORD *)int valuePtr = 0, CFNumberGetValue(v41, kCFNumberSInt32Type, valuePtr), *(_DWORD *)valuePtr))
          {
            *(_DWORD *)int valuePtr = 0;
            CFNumberGetValue(v41, kCFNumberSInt32Type, valuePtr);
            double v31 = (double)*(int *)valuePtr * 0.0000152587891;
            *((double *)this + 17) = v31;
          }
          else
          {
            memset(valuePtr, 170, 16);
            __int16 v32 = (const void *)IOHIDPreferencesCopyDomain();
            sub_2407B45A0(valuePtr, v32, 1);
            if (*(void *)&valuePtr[8])
            {
              int v60 = 0;
              CFNumberGetValue(*(CFNumberRef *)&valuePtr[8], kCFNumberSInt32Type, &v60);
              if (v60)
              {
                int v60 = 0;
                CFNumberGetValue(*(CFNumberRef *)&valuePtr[8], kCFNumberSInt32Type, &v60);
                *((double *)this + 17) = (double)v60 * 0.0000152587891;
              }
            }
            sub_2407B23E4(valuePtr);
            double v31 = *((double *)this + 17);
          }
          *((double *)this + 16) = v31;
          uint64_t v33 = _IOHIDLogCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            if (*((void *)this + 15)) {
              IOHIDServiceGetRegistryID();
            }
            sub_2407B9D14();
          }
          sub_2407B23E4(&v40);
        }
        operator new();
      }
    }
    goto LABEL_72;
  }
  if (!result) {
    operator new();
  }
  return result;
}

void sub_2407B8728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
}

const void *sub_2407B88A8(uint64_t a1)
{
  uint64_t result = *(const void **)(a1 + 8);
  if (result)
  {
    CFTypeID v3 = CFGetTypeID(result);
    if (v3 == CFBooleanGetTypeID()) {
      return (const void *)(CFBooleanGetValue(*(CFBooleanRef *)(a1 + 8)) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

CFDictionaryRef *IOHIDPointerScrollFilter::setupScrollAcceleration(CFDictionaryRef *this, double a2)
{
  uint64_t v2 = (uint64_t)this;
  uint64_t v59 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 40))
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      if (!this[i + 7]) {
        operator new();
      }
    }
  }
  else
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v4 = IOHIDPointerScrollFilter::copyCachedProperty(this, @"HIDSupportsScrollAcceleration");
    sub_2407B9458(&v39, v4, 1);
    if (v40) {
      unsigned __int8 v5 = sub_2407B88A8((uint64_t)&v39);
    }
    else {
      unsigned __int8 v5 = 1;
    }
    *(unsigned char *)(v2 + 165) = v5;
    v37 = &unk_26F4E7420;
    CFNumberRef number = 0;
    unsigned int v35 = &unk_26F4E7818;
    CFNumberRef v36 = 0;
    uint64_t v33 = &unk_26F4E7818;
    CFTypeRef cf = 0;
    double v31 = &unk_26F4E7818;
    CFTypeRef v32 = 0;
    uint64_t v29 = &unk_26F4E7818;
    CFTypeRef v30 = 0;
    unsigned __int8 v6 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, @"HIDScrollAccelerationType");
    *(void *)int valuePtr = &unk_26F4E7818;
    *(void *)&valuePtr[8] = v6;
    sub_2407B750C((uint64_t)&v35, (uint64_t)valuePtr);
    sub_2407B9974(valuePtr);
    if (v36)
    {
      uint64_t v7 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, v36);
      *(void *)int valuePtr = &unk_26F4E7818;
      *(void *)&valuePtr[8] = v7;
      sub_2407B750C((uint64_t)&v33, (uint64_t)valuePtr);
      sub_2407B9974(valuePtr);
      sub_2407B45A0(valuePtr, cf, 0);
      sub_2407B750C((uint64_t)&v37, (uint64_t)valuePtr);
      sub_2407B23E4(valuePtr);
    }
    CFNumberRef v8 = number;
    if (number) {
      goto LABEL_15;
    }
    unint64_t v9 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, @"HIDMouseScrollAcceleration");
    *(void *)int valuePtr = &unk_26F4E7818;
    *(void *)&valuePtr[8] = v9;
    sub_2407B750C((uint64_t)&v31, (uint64_t)valuePtr);
    sub_2407B9974(valuePtr);
    sub_2407B45A0(valuePtr, v32, 0);
    sub_2407B750C((uint64_t)&v37, (uint64_t)valuePtr);
    sub_2407B23E4(valuePtr);
    CFNumberRef v8 = number;
    if (number) {
      goto LABEL_15;
    }
    CFTypeID v10 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, @"HIDScrollAcceleration");
    *(void *)int valuePtr = &unk_26F4E7818;
    *(void *)&valuePtr[8] = v10;
    sub_2407B750C((uint64_t)&v29, (uint64_t)valuePtr);
    sub_2407B9974(valuePtr);
    sub_2407B45A0(valuePtr, v30, 0);
    sub_2407B750C((uint64_t)&v37, (uint64_t)valuePtr);
    sub_2407B23E4(valuePtr);
    CFNumberRef v8 = number;
    if (number)
    {
LABEL_15:
      *(_DWORD *)int valuePtr = 0;
      CFNumberGetValue(v8, kCFNumberSInt32Type, valuePtr);
      *(double *)(v2 + 144) = (double)*(int *)valuePtr * 0.0000152587891;
    }
    uint64_t v11 = _IOHIDLogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t RegistryID = *(void *)(v2 + 120);
      if (RegistryID) {
        uint64_t RegistryID = IOHIDServiceGetRegistryID();
      }
      CFNumberRef v13 = "enabled";
      if (*(double *)(v2 + 144) < 0.0) {
        CFNumberRef v13 = "disabled";
      }
      *(_DWORD *)int valuePtr = 138414338;
      *(void *)&valuePtr[4] = RegistryID;
      *(_WORD *)&valuePtr[12] = 2080;
      *(void *)&valuePtr[14] = v13;
      __int16 v45 = 2112;
      v46 = v36;
      __int16 v47 = 2112;
      CFTypeRef v48 = cf;
      __int16 v49 = 2080;
      v50 = "HIDMouseScrollAcceleration";
      __int16 v51 = 2112;
      CFTypeRef v52 = v32;
      __int16 v53 = 2080;
      unint64_t v54 = "HIDScrollAcceleration";
      __int16 v55 = 2112;
      CFTypeRef v56 = v30;
      __int16 v57 = 2112;
      CFNumberRef v58 = number;
      _os_log_impl(&dword_2407B0000, v11, OS_LOG_TYPE_DEFAULT, "[%@] Scroll acceleration (%s) %@:%@ %s:%@ %s:%@ %@\n", valuePtr, 0x5Cu);
    }
    if (*(double *)(v2 + 144) >= 0.0)
    {
      unint64_t v14 = _IOHIDLogCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        if (*(void *)(v2 + 120)) {
          IOHIDServiceGetRegistryID();
        }
        sub_2407B9D84();
      }
      unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
      CFNumberRef v28 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
      uint64_t v15 = IOHIDPointerScrollFilter::copyCachedProperty((CFDictionaryRef *)v2, @"HIDScrollReportRate");
      sub_2407B45A0(&v27, v15, 1);
      if (v28 && (*(_DWORD *)buf = 0, CFNumberGetValue(v28, kCFNumberSInt32Type, buf), *(_DWORD *)buf)
        || (sub_2407B98C0(buf, 4390912), sub_2407B750C((uint64_t)&v27, (uint64_t)buf), sub_2407B23E4(buf), v28))
      {
        unint64_t v16 = 0;
        while (1)
        {
          unint64_t v17 = v2 + 8 * v16;
          uint64_t v18 = *(void *)(v17 + 56);
          *(void *)(v17 + 56) = 0;
          if (v18) {
            (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
          }
          memset(buf, 170, sizeof(buf));
          uint64_t v19 = (const void *)IOHIDServiceCopyProperty();
          sub_2407B45A0(buf, v19, 1);
          CFNumberRef v20 = *(const __CFNumber **)&buf[8];
          if (!*(void *)&buf[8])
          {
            double v21 = (const void *)IOHIDServiceCopyProperty();
            sub_2407B45A0(v41, v21, 1);
            sub_2407B750C((uint64_t)buf, (uint64_t)v41);
            sub_2407B23E4(v41);
            CFNumberRef v20 = *(const __CFNumber **)&buf[8];
            if (!*(void *)&buf[8]) {
              break;
            }
          }
          *(_DWORD *)CFNumberRef v41 = 0;
          CFNumberGetValue(v20, kCFNumberSInt32Type, v41);
          int v22 = *(_DWORD *)v41;
          *(_DWORD *)CFNumberRef v41 = 0;
          CFNumberGetValue(v28, kCFNumberSInt32Type, v41);
          if (IOHIDPointerScrollFilter::createScrollAlgorithm((CFDictionaryRef *)v2, v16, v22, *(int *)v41)) {
            operator new();
          }
          sub_2407B23E4(buf);
          if (++v16 == 3) {
            goto LABEL_48;
          }
        }
        uint64_t v25 = _IOHIDLogCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = *(void *)(v2 + 120);
          if (v26) {
            uint64_t v26 = IOHIDServiceGetRegistryID();
          }
          *(_DWORD *)CFNumberRef v41 = 138412290;
          uint64_t v42 = v26;
          _os_log_impl(&dword_2407B0000, v25, OS_LOG_TYPE_INFO, "[%@] Could not get kIOHIDScrollResolutionKey\n", v41, 0xCu);
        }
        sub_2407B23E4(buf);
      }
      else
      {
        uint64_t v23 = _IOHIDLogCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = *(void *)(v2 + 120);
          if (v24) {
            uint64_t v24 = IOHIDServiceGetRegistryID();
          }
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v24;
          _os_log_impl(&dword_2407B0000, v23, OS_LOG_TYPE_INFO, "[%@] Could not get/create report rate\n", buf, 0xCu);
        }
      }
LABEL_48:
      sub_2407B23E4(&v27);
    }
    sub_2407B9974(&v29);
    sub_2407B9974(&v31);
    sub_2407B9974(&v33);
    sub_2407B9974(&v35);
    sub_2407B23E4(&v37);
    return (CFDictionaryRef *)sub_2407B9568(&v39);
  }
  return this;
}

void sub_2407B90D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
}

void IOHIDPointerScrollFilter::startAccelStatsTimer(IOHIDPointerScrollFilter *this)
{
  int v1 = *((void *)this + 21);
  if (v1)
  {
    dispatch_time_t v2 = dispatch_time(0, 1000000 * *((void *)this + 22));
    dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

__CFString *IOHIDPointerScrollFilter::getAccelerationAlgorithmString(IOHIDPointerScrollFilter *this, unsigned int a2)
{
  if (a2 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_2650D6200 + (char)a2);
  }
}

void IOHIDPointerScrollFilter::statsTimerCallback(dispatch_source_t *this, void *a2)
{
  if (this[15])
  {
    dispatch_source_set_timer(this[21], 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    double v3 = *((double *)this + 16);
    double v4 = *((double *)this + 18);
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef number = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    unsigned __int8 v5 = (const void *)IOHIDServiceCopyProperty();
    sub_2407B45A0(&v13, v5, 1);
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v12 = (CFNumberRef)0xAAAAAAAAAAAAAAAALL;
    unsigned __int8 v6 = (const void *)IOHIDServiceCopyProperty();
    sub_2407B45A0(&v11, v6, 1);
    if (number)
    {
      unsigned __int16 valuePtr = 0;
      CFNumberGetValue(number, kCFNumberSInt16Type, &valuePtr);
      uint64_t v7 = valuePtr;
    }
    else
    {
      uint64_t v7 = 0;
    }
    if (v12)
    {
      unsigned __int16 valuePtr = 0;
      CFNumberGetValue(v12, kCFNumberSInt16Type, &valuePtr);
      uint64_t v9 = valuePtr;
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (analytics_is_event_used())
    {
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v10, "PointerAccelerationValue", vcvtd_n_u64_f64(v3, 0x10uLL));
      xpc_dictionary_set_uint64(v10, "ScrollAccelerationValue", vcvtd_n_u64_f64(v4, 0x10uLL));
      xpc_dictionary_set_uint64(v10, "VendorID", v9);
      xpc_dictionary_set_uint64(v10, "ProductID", v7);
      analytics_send_event();
      xpc_release(v10);
    }
    sub_2407B23E4(&v11);
    sub_2407B23E4(&v13);
  }
  else
  {
    CFNumberRef v8 = _IOHIDLogCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_2407B9DBC(v8);
    }
  }
}

void sub_2407B9428(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  sub_2407B23E4((uint64_t *)va);
  sub_2407B23E4((uint64_t *)va1);
  _Unwind_Resume(a1);
}

void *sub_2407B9458(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFBooleanGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E7760;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E7718;
  return a1;
}

void sub_2407B94F4(void *a1)
{
  sub_2407B9568(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B9530(void *a1)
{
  sub_2407B9568(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B9568(void *a1)
{
  dispatch_time_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E7760;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407B95B8(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E77C8;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E7780;
  return a1;
}

void sub_2407B9654(void *a1)
{
  sub_2407B96C4(a1);

  JUMPOUT(0x2455FA5A0);
}

void sub_2407B968C(void *a1)
{
  sub_2407B96C4(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B96C4(void *a1)
{
  dispatch_time_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E77C8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407B9714(void *a1, const char *a2)
{
  *a1 = &unk_26F4E7780;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  a1[1] = CFStringCreateWithCString(0, a2, 0);
  return a1;
}

void sub_2407B9770(_Unwind_Exception *a1)
{
  sub_2407B96C4(v1);
  _Unwind_Resume(a1);
}

void *sub_2407B9784(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2407B5994();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    CFTypeID v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFTypeID v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_2407B9838(void *a1)
{
  sub_2407B9870(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B9870(void *a1)
{
  dispatch_time_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E77E8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407B98C0(void *a1, int a2)
{
  int valuePtr = a2;
  *a1 = &unk_26F4E7420;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  return a1;
}

void sub_2407B9928(_Unwind_Exception *a1)
{
  sub_2407B23E4(v1);
  _Unwind_Resume(a1);
}

void sub_2407B993C(void *a1)
{
  sub_2407B9974(a1);

  JUMPOUT(0x2455FA5A0);
}

void *sub_2407B9974(void *a1)
{
  dispatch_time_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E7818;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t sub_2407B99C4(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(void *)(a4 + 14) = v4;
  return result;
}

void sub_2407B99DC(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_2407B9A08(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2407B0000, a2, OS_LOG_TYPE_DEBUG, "table index %zu\n", (uint8_t *)&v2, 0xCu);
}

void sub_2407B9A80(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_2407B0000, log, OS_LOG_TYPE_DEBUG, "table in NULL\n", v1, 2u);
}

void sub_2407B9AC4(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl(&dword_2407B0000, log, OS_LOG_TYPE_DEBUG, "Acceleration table %s\n", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_2407B9B38(ACCEL_TABLE *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = ACCEL_TABLE::signature(a1);
  _os_log_debug_impl(&dword_2407B0000, a2, OS_LOG_TYPE_DEBUG, "unsupported table signature  %d\n", (uint8_t *)v3, 8u);
}

void sub_2407B9BC4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_2407B0000, log, OS_LOG_TYPE_ERROR, "Unable to create stats timer, no acceleration stats will be collected\n", v1, 2u);
}

void sub_2407B9C08(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2407B0000, a2, OS_LOG_TYPE_DEBUG, "(%p) setupAcceleration service not available\n", (uint8_t *)&v2, 0xCu);
}

void sub_2407B9C80(CFStringRef *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CStringPtr = CFStringGetCStringPtr(*a1, 0);
  int v4 = 136315138;
  size_t v5 = CStringPtr;
  _os_log_error_impl(&dword_2407B0000, a2, OS_LOG_TYPE_ERROR, "Unable to deserialize HID Property Event %s", (uint8_t *)&v4, 0xCu);
}

void sub_2407B9D14()
{
  sub_2407B99F8();
  sub_2407B99C4(v0, 5.778e-34, v1, v2);
  sub_2407B99DC(&dword_2407B0000, "[%@] Override pointer acceleration value with minimum %f\n", v3, v4);
}

void sub_2407B9D4C()
{
  sub_2407B99F8();
  sub_2407B99C4(v0, 5.778e-34, v1, v2);
  sub_2407B99DC(&dword_2407B0000, "[%@] Pointer acceleration value %f\n", v3, v4);
}

void sub_2407B9D84()
{
  sub_2407B99F8();
  sub_2407B99C4(v0, 5.778e-34, v1, v2);
  sub_2407B99DC(&dword_2407B0000, "[%@] Scroll acceleration value %f\n", v3, v4);
}

void sub_2407B9DBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2407B0000, log, OS_LOG_TYPE_ERROR, "_service is null, no acceleration stats will be collected\n", v1, 2u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x270EF3F00](buffer, bufferSize, allocator, options, errorString);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x270EF41E8]();
}

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x270EF41F0]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x270EF4228]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x270EF4310]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x270EF4318]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x270EF4330]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x270EF4340]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetScrollMomentum()
{
  return MEMORY[0x270EF4360]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventIsAbsolute()
{
  return MEMORY[0x270EF43A0]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x270EF43C0]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x270EF43C8]();
}

uint64_t IOHIDPreferencesCopyDomain()
{
  return MEMORY[0x270EF45D0]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x270EF4688]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x270EF4690]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x270EF4B98]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x270EF4BC8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98778]();
}

{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
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

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

uint64_t analytics_is_event_used()
{
  return MEMORY[0x270F18A60]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x270F18A68]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}