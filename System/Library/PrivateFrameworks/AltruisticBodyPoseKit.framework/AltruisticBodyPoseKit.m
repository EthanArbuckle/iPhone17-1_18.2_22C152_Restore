__CFDictionary *ABPKcreateAttributeDictionaryNewWithZeroCopyOption(unsigned int a1, unsigned int a2, int a3, int a4)
{
  CFAllocatorRef v5;
  __CFDictionary *Mutable;
  CFNumberRef v7;
  CFNumberRef v8;
  CFMutableDictionaryRef v9;
  CFMutableDictionaryRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  uint64_t v18;
  unint64_t v19;

  v19 = __PAIR64__(a1, a2);
  LODWORD(v18) = 16;
  HIDWORD(v18) = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    v7 = CFNumberCreate(v5, kCFNumberIntType, (char *)&v18 + 4);
    if (!v7) {
      goto LABEL_9;
    }
    v8 = v7;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04180], v7);
    CFRelease(v8);
    v9 = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (!v9) {
      goto LABEL_9;
    }
    v10 = v9;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], v9);
    CFRelease(v10);
    v11 = CFNumberCreate(v5, kCFNumberIntType, (char *)&v19 + 4);
    if (!v11) {
      goto LABEL_9;
    }
    v12 = v11;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04240], v11);
    CFRelease(v12);
    v13 = CFNumberCreate(v5, kCFNumberIntType, &v19);
    if (!v13) {
      goto LABEL_9;
    }
    v14 = v13;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04118], v13);
    CFRelease(v14);
    v15 = CFNumberCreate(v5, kCFNumberIntType, &v18);
    if (v15)
    {
      v16 = v15;
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04198], v15);
      CFRelease(v16);
      if (a4) {
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04078], (const void *)objc_msgSend(NSNumber, "numberWithInt:", 64, v18, v19));
      }
    }
    else
    {
LABEL_9:
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

uint64_t ABPK_pixelBufferPoolCreateNewWithZeroCopyOption(unsigned int a1, unsigned int a2, int a3, CVPixelBufferPoolRef *a4, int a5)
{
  v6 = ABPKcreateAttributeDictionaryNewWithZeroCopyOption(a1, a2, a3, a5);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v6, a4);
    CFRelease(v7);
    if (!v8) {
      return v8;
    }
  }
  else
  {
    uint64_t v8 = 4294960636;
  }
  *a4 = 0;
  return v8;
}

uint64_t ABPKRecreatePixelBufferPoolOnConfigurationChangesWithZeroCopyOption(CVPixelBufferPoolRef *a1, int a2, int a3, double a4, double a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v10 = *a1;
  if (v10)
  {
    v11 = CVPixelBufferPoolGetPixelBufferAttributes(v10);
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F04240]];
    uint64_t v13 = [v12 integerValue];

    v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F04118]];
    uint64_t v15 = [v14 integerValue];

    v16 = [v11 objectForKeyedSubscript:*MEMORY[0x263F04180]];
    uint64_t v17 = [v16 integerValue];

    if (v13 == (int)a4 && v15 == (int)a5)
    {

      if (v17 == a2) {
        return 0;
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v17 = 0;
  }
  v19 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    CVPixelBufferPoolRef v20 = *a1;
    int v23 = 134219520;
    CVPixelBufferPoolRef v24 = v20;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2048;
    uint64_t v28 = v15;
    __int16 v29 = 2048;
    uint64_t v30 = v17;
    __int16 v31 = 1024;
    int v32 = (int)a4;
    __int16 v33 = 1024;
    int v34 = (int)a5;
    __int16 v35 = 1024;
    int v36 = a2;
    _os_log_impl(&dword_21B7C6000, v19, OS_LOG_TYPE_INFO, " ARSystemTools: Recreating pixel buffer pool (%p) due to configuration changes: %li,%li/%li => %i,%i/%i ", (uint8_t *)&v23, 0x3Cu);
  }

  if (*a1)
  {
    CVPixelBufferPoolRelease(*a1);
    *a1 = 0;
  }
  uint64_t NewWithZeroCopyOption = ABPK_pixelBufferPoolCreateNewWithZeroCopyOption((int)a4, (int)a5, a2, a1, a3);
  if (NewWithZeroCopyOption)
  {
    v21 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_ERROR, " ARSystemTools: Could not create pixel buffer pool. ", (uint8_t *)&v23, 2u);
    }
  }
  return NewWithZeroCopyOption;
}

CVPixelBufferRef ABPKCreateCVPixelBufferFromPoolWithZeroCopyOption(CVPixelBufferPoolRef *a1, int a2, void *a3, void *a4, int a5, double a6, double a7)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v15 = ABPKRecreatePixelBufferPoolOnConfigurationChangesWithZeroCopyOption(a1, a2, a5, a6, a7);
  if (v15)
  {
    CVReturn v16 = v15;
    uint64_t v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138413058;
      uint64_t v28 = v19;
      __int16 v29 = 2048;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 1024;
      CVReturn v34 = v16;
      CVPixelBufferPoolRef v20 = " %@(%p): Unable to configure pixelbuffer pool for %@: %i ";
LABEL_7:
      _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_ERROR, v20, buf, 0x26u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  CVReturn v21 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], *a1, &pixelBufferOut);
  if (v21)
  {
    CVReturn v22 = v21;
    uint64_t v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v23 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138413058;
      uint64_t v28 = v19;
      __int16 v29 = 2048;
      id v30 = v13;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 1024;
      CVReturn v34 = v22;
      CVPixelBufferPoolRef v20 = " %@(%p): Unable to create pixel buffer for %@: %i ";
      goto LABEL_7;
    }
LABEL_8:
  }
  CVPixelBufferRef v24 = pixelBufferOut;

  return v24;
}

void sub_21B7C88A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7C89EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void abpk::GetRawDetectionXYVisbilityWithRawDetection2D(abpk *this@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  v11 = this;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  std::vector<std::array<float,3ul>>::reserve((char **)a3, 0x10uLL);
  uint64_t v6 = [(abpk *)v11 rawJointsOutput];
  uint64_t v7 = [(abpk *)v11 jointTrackingStates];
  uint64_t v8 = *(char **)a3;
  if (*(float *)(*(void *)a3 + 92) != 0.0 && *((float *)v8 + 29) != 0.0)
  {
    float v9 = *((float *)v8 + 25);
    double v10 = (float)(*((float *)v8 + 21) - *((float *)v8 + 24));
    *(float *)&double v10 = sqrt(v10 * v10 + (float)(*((float *)v8 + 22) - v9) * (float)(*((float *)v8 + 22) - v9));
    *(float *)&double v10 = v9 + *(float *)&v10 * -0.5;
    *((_DWORD *)v8 + 28) = LODWORD(v10);
  }
}

void sub_21B7C8CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + 8) = v12;
    operator delete(v12);
  }

  _Unwind_Resume(a1);
}

void std::vector<std::array<float,3ul>>::reserve(char **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 2) < a2)
  {
    if (a2 >= 0x1555555555555556) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = (a1[1] - *a1) / 12;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(v3, a2);
    uint64_t v7 = &v6[12 * v5];
    float v9 = &v6[12 * v8];
    v11 = *a1;
    uint64_t v10 = a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *(void *)(v10 - 12);
        v10 -= 12;
        int v14 = *((_DWORD *)v10 + 2);
        *(void *)(v12 - 12) = v13;
        v12 -= 12;
        *((_DWORD *)v12 + 2) = v14;
      }
      while (v10 != v11);
      uint64_t v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void anonymous namespace'::XYVisbilityConvertionHelper(char **a1, uint64_t a2, uint64_t a3, float64x2_t *a4, uint64_t a5)
{
  float32x2_t v6 = *(float32x2_t *)(a2 + 8 * a5);
  if (v6.f32[0] == -1.0 || COERCE_FLOAT(HIDWORD(*(void *)(a2 + 8 * a5))) == -1.0)
  {
    float v8 = (float)*(unsigned int *)(a3 + 4 * a5);
    uint64_t v9 = (uint64_t)(a1 + 2);
    unint64_t v10 = (unint64_t)a1[2];
    unint64_t v11 = (unint64_t)a1[1];
    if (v11 < v10)
    {
      __asm { FMOV            V0.2S, #-1.0 }
      *(void *)unint64_t v11 = _D0;
      *(float *)(v11 + 8) = v8;
LABEL_10:
      CVPixelBufferPoolRef v20 = (char *)(v11 + 12);
      goto LABEL_37;
    }
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (void)*a1) >> 2);
    unint64_t v22 = v21 + 1;
    if (v21 + 1 <= 0x1555555555555555)
    {
      unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (void)*a1) >> 2);
      if (2 * v23 > v22) {
        unint64_t v22 = 2 * v23;
      }
      if (v23 >= 0xAAAAAAAAAAAAAAALL) {
        unint64_t v24 = 0x1555555555555555;
      }
      else {
        unint64_t v24 = v22;
      }
      if (v24) {
        __int16 v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(v9, v24);
      }
      else {
        __int16 v25 = 0;
      }
      __int16 v31 = &v25[12 * v21];
      id v32 = &v25[12 * v24];
      __asm { FMOV            V0.2S, #-1.0 }
      *(void *)__int16 v31 = _D0;
      *((float *)v31 + 2) = v8;
      CVPixelBufferPoolRef v20 = v31 + 12;
      uint64_t v35 = *a1;
      CVReturn v34 = a1[1];
      if (v34 == *a1) {
        goto LABEL_35;
      }
      do
      {
        uint64_t v36 = *(void *)(v34 - 12);
        v34 -= 12;
        int v37 = *((_DWORD *)v34 + 2);
        *(void *)(v31 - 12) = v36;
        v31 -= 12;
        *((_DWORD *)v31 + 2) = v37;
      }
      while (v34 != v35);
      goto LABEL_34;
    }
LABEL_38:
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  float32x2_t v16 = vcvt_f32_f64(vmulq_f64(*a4, vcvtq_f64_f32(v6)));
  float v17 = (float)*(unsigned int *)(a3 + 4 * a5);
  uint64_t v18 = (uint64_t)(a1 + 2);
  unint64_t v19 = (unint64_t)a1[2];
  unint64_t v11 = (unint64_t)a1[1];
  if (v11 < v19)
  {
    *(float32x2_t *)unint64_t v11 = v16;
    *(float *)(v11 + 8) = v17;
    goto LABEL_10;
  }
  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (void)*a1) >> 2);
  unint64_t v27 = v26 + 1;
  if (v26 + 1 > 0x1555555555555555) {
    goto LABEL_38;
  }
  unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19 - (void)*a1) >> 2);
  if (2 * v28 > v27) {
    unint64_t v27 = 2 * v28;
  }
  if (v28 >= 0xAAAAAAAAAAAAAAALL) {
    unint64_t v29 = 0x1555555555555555;
  }
  else {
    unint64_t v29 = v27;
  }
  if (v29) {
    id v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(v18, v29);
  }
  else {
    id v30 = 0;
  }
  __int16 v31 = &v30[12 * v26];
  id v32 = &v30[12 * v29];
  *(float32x2_t *)__int16 v31 = v16;
  *((float *)v31 + 2) = v17;
  CVPixelBufferPoolRef v20 = v31 + 12;
  v38 = *a1;
  CVReturn v34 = a1[1];
  if (v34 == *a1) {
    goto LABEL_35;
  }
  do
  {
    uint64_t v39 = *(void *)(v34 - 12);
    v34 -= 12;
    int v40 = *((_DWORD *)v34 + 2);
    *(void *)(v31 - 12) = v39;
    v31 -= 12;
    *((_DWORD *)v31 + 2) = v40;
  }
  while (v34 != v38);
LABEL_34:
  CVReturn v34 = *a1;
LABEL_35:
  *a1 = v31;
  a1[1] = v20;
  a1[2] = v32;
  if (v34) {
    operator delete(v34);
  }
LABEL_37:
  a1[1] = v20;
}

void abpk::Normalize2DCoordinates(float32x2_t **a1, uint64_t *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *a2;
    uint64_t v6 = a2[1];
    int v19 = 134218240;
    uint64_t v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v6;
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t Normalizing the raw 2D x and y coordinates with image width = %f and height = %f ", (uint8_t *)&v19, 0x16u);
  }

  uint64_t v7 = *a1;
  float v8 = a1[1];
  if (*a1 != v8)
  {
    float64x2_t v9 = (float64x2_t)vdupq_lane_s64(*a2, 0);
    __asm { FMOV            V1.2D, #-1.0 }
    _Q1.f64[1] = *((double *)a2 + 1) / *(double *)a2;
    do
    {
      if (v7[1].f32[0] == 0.0)
      {
        float32x2_t v18 = 0;
      }
      else
      {
        float64x2_t v15 = vcvtq_f64_f32(*v7);
        float64x2_t v16 = vdivq_f64(vaddq_f64(v15, v15), v9);
        *(void *)&v17.f64[0] = *(_OWORD *)&vaddq_f64(v16, _Q1);
        v17.f64[1] = vsubq_f64(v16, _Q1).f64[1];
        float32x2_t v18 = vcvt_f32_f64(v17);
      }
      float32x2_t *v7 = v18;
      uint64_t v7 = (float32x2_t *)((char *)v7 + 12);
    }
    while (v7 != v8);
  }
}

void abpk::Normalize2DCoordinatesSquareCrop(float **a1, double *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  float v5 = *a2;
  float v6 = a2[1];
  uint64_t v7 = __ABPKLogSharedInstance();
  double v8 = v5;
  double v9 = v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134218240;
    double v21 = v5;
    __int16 v22 = 2048;
    double v23 = v6;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " \t Normalizing the raw 2D x and y coordinates with image width = %f and height = %f. Center cropping in normalization for better model performance. ", (uint8_t *)&v20, 0x16u);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (*a1 != v11)
  {
    double v12 = (float)(v5 - v6) * 0.5;
    double v13 = (float)(v6 - v5) * 0.5;
    do
    {
      float v15 = *v10;
      float v14 = v10[1];
      if ((unint64_t)(a3 - 1) > 1)
      {
        if ((unint64_t)(a3 - 3) > 1 || (v12 <= v15 ? (BOOL v17 = v8 - v12 < v15) : (BOOL v17 = 1), !v17))
        {
LABEL_18:
          if (v10[2] == 0.0)
          {
            float v18 = 0.0;
            float v19 = 0.0;
          }
          else
          {
            float v18 = (v15 + v15) / v8 + -1.0;
            float v19 = (v14 + v14) / v8 - v9 / v8;
          }
          float *v10 = v18;
          v10[1] = v19;
          goto LABEL_22;
        }
      }
      else if (v13 <= v14 && v9 - v13 >= v14)
      {
        goto LABEL_18;
      }
      *(void *)unint64_t v10 = 0;
      v10[2] = 0.0;
LABEL_22:
      v10 += 3;
    }
    while (v10 != v11);
  }
}

void std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2643B6D58, MEMORY[0x263F8C060]);
}

void sub_21B7C9340(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<float,3ul>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(12 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_21B7CA258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7CA2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ABPKRetargeting;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_21B7CA77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7CAC44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int32x2_t *distanceBetweenTwoPoses(int32x2_t *result, float32x2_t *a2, uint64_t a3)
{
  for (float i = 0.0; a3; --a3)
  {
    *(int32x2_t *)v4.f32 = vrev64_s32(*result);
    *(float32x2_t *)&v4.u32[2] = *a2;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v4))) & 1) == 0)
    {
      float32x2_t v5 = vsub_f32((float32x2_t)*result, *a2);
      float i = i + sqrtf(vaddv_f32(vmul_f32(v5, v5)));
    }
    ++a2;
    ++result;
  }
  return result;
}

{
  float i;
  float32x4_t v4;
  float32x2_t v5;

  for (float i = 0.0; a3; --a3)
  {
    *(int32x2_t *)v4.f32 = vrev64_s32(*result);
    *(float32x2_t *)&v4.u32[2] = *a2;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v4))) & 1) == 0)
    {
      float32x2_t v5 = vsub_f32((float32x2_t)*result, *a2);
      float i = i + sqrtf(vaddv_f32(vmul_f32(v5, v5)));
    }
    ++a2;
    ++result;
  }
  return result;
}

BOOL isValueInVector(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8) - *(void *)a1;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3 >> 3;
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  if (*v2 == a2) {
    return 1;
  }
  uint64_t v7 = 1;
  do
  {
    unint64_t v8 = v7;
    if (v5 == v7) {
      break;
    }
    uint64_t v9 = v2[v7++];
  }
  while (v9 != a2);
  return v8 < v4;
}

void sub_21B7CB9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  if (__p) {
    operator delete(__p);
  }
  id v32 = *(void **)(v30 - 176);
  if (v32)
  {
    *(void *)(v30 - 168) = v32;
    operator delete(v32);
  }

  _Unwind_Resume(a1);
}

void sub_21B7CC1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7CC3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7CCA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a20) {
    operator delete(a20);
  }
  if (a23) {
    operator delete(a23);
  }
  if (a26) {
    operator delete(a26);
  }
  if (a29) {
    operator delete(a29);
  }
  uint64_t v35 = *(void **)(v33 - 152);
  if (v35)
  {
    *(void *)(v33 - 144) = v35;
    operator delete(v35);
  }
  uint64_t v36 = *(void **)(v33 - 128);
  if (v36)
  {
    *(void *)(v33 - 120) = v36;
    operator delete(v36);
  }

  _Unwind_Resume(a1);
}

void sub_21B7CCE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned long>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned long>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21B7CD0C8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned long>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void *std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    float v6 = result;
    result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7CD1C0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned long>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21B7CD238(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B7CD2D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void abpk::getJointPositionsAndMaximasLegacy(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, unsigned int a6, uint64_t a7, void *a8)
{
  uint64_t v8 = *a3 - 1;
  uint64_t v83 = v8;
  if (a5)
  {
    if (*a3 == 1) {
      return;
    }
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v88 = a3[1];
    uint64_t v85 = a4[1];
    unint64_t v86 = a3[2];
    if (v86 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = a3[2];
    }
    do
    {
      uint64_t v82 = v9;
      if (v88)
      {
        uint64_t v12 = 0;
        uint64_t v13 = *a4 * v9;
        uint64_t v14 = a2 + 2 * v13;
        uint64_t v15 = a1 + 2 * v13;
        float64x2_t v16 = (void **)(a7 + 24 * v9);
        BOOL v17 = (char **)(v16 + 1);
        float v18 = v16 + 2;
        unint64_t v19 = v86;
        v89 = v16;
        do
        {
          if (v19)
          {
            uint64_t v20 = 0;
            uint64_t v21 = v12 * v85;
            do
            {
              short float v22 = *(short float *)(v15 + 2 * (v20 + v21));
              if (v22 > COERCE_SHORT_FLOAT(11878) && v22 == *(short float *)(v14 + 2 * (v20 + v21)))
              {
                uint64_t v24 = *v17;
                if ((unint64_t)*v17 >= *v18)
                {
                  unint64_t v26 = (char *)*v16;
                  uint64_t v27 = (v24 - (unsigned char *)*v16) >> 4;
                  unint64_t v28 = v27 + 1;
                  if ((unint64_t)(v27 + 1) >> 60) {
                    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v29 = *v18 - (void)v26;
                  if (v29 >> 3 > v28) {
                    unint64_t v28 = v29 >> 3;
                  }
                  if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v30 = v28;
                  }
                  if (v30)
                  {
                    __int16 v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v18, v30);
                    float64x2_t v16 = v89;
                    id v32 = v31;
                    uint64_t v24 = *v17;
                    unint64_t v26 = (char *)*v89;
                  }
                  else
                  {
                    id v32 = 0;
                  }
                  uint64_t v33 = &v32[16 * v27];
                  *(_DWORD *)uint64_t v33 = v20;
                  *((_DWORD *)v33 + 1) = v12;
                  *((short float *)v33 + 4) = v22;
                  *((_DWORD *)v33 + 3) = v10;
                  CVReturn v34 = v33;
                  if (v24 != v26)
                  {
                    do
                    {
                      *((_OWORD *)v34 - 1) = *((_OWORD *)v24 - 1);
                      v34 -= 16;
                      v24 -= 16;
                    }
                    while (v24 != v26);
                    unint64_t v26 = (char *)*v16;
                  }
                  void *v16 = v34;
                  __int16 v25 = v33 + 16;
                  *BOOL v17 = v33 + 16;
                  void *v18 = &v32[16 * v30];
                  if (v26)
                  {
                    operator delete(v26);
                    float64x2_t v16 = v89;
                  }
                }
                else
                {
                  *(_DWORD *)uint64_t v24 = v20;
                  *((_DWORD *)v24 + 1) = v12;
                  *((short float *)v24 + 4) = v22;
                  __int16 v25 = v24 + 16;
                  *((_DWORD *)v24 + 3) = v10;
                }
                ++v10;
                *BOOL v17 = v25;
              }
              ++v20;
            }
            while (v20 != v11);
            unint64_t v19 = v86;
          }
          ++v12;
        }
        while (v12 != v88);
      }
      uint64_t v8 = v83;
      uint64_t v9 = v82 + 1;
    }
    while (v82 + 1 != v83);
  }
  else
  {
    if (!a6)
    {
      int v10 = 0;
      if (*a3 == 1) {
        return;
      }
      goto LABEL_58;
    }
    uint64_t v35 = 0;
    uint64_t v36 = a6;
    do
    {
      uint64_t v37 = a1 + 8 * v35;
      int v38 = (int)*(short float *)v37;
      int v39 = (int)*(short float *)(v37 + 2);
      __int16 v40 = *(_WORD *)(v37 + 6);
      v41 = (char **)(a7 + 24 * (int)*(short float *)(v37 + 4));
      v43 = (void **)(v41 + 1);
      unint64_t v42 = (unint64_t)v41[1];
      v45 = v41 + 2;
      unint64_t v44 = (unint64_t)v41[2];
      if (v42 >= v44)
      {
        uint64_t v47 = (uint64_t)(v42 - (void)*v41) >> 4;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 60) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v49 = v44 - (void)*v41;
        if (v49 >> 3 > v48) {
          unint64_t v48 = v49 >> 3;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v50 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50) {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v45, v50);
        }
        else {
          v51 = 0;
        }
        v52 = &v51[16 * v47];
        *(_DWORD *)v52 = v38;
        *((_DWORD *)v52 + 1) = v39;
        *((_WORD *)v52 + 4) = v40;
        *((_DWORD *)v52 + 3) = 0;
        v53 = (char *)*v43;
        v54 = *v41;
        v55 = v52;
        if (*v43 != *v41)
        {
          do
          {
            *((_OWORD *)v55 - 1) = *((_OWORD *)v53 - 1);
            v55 -= 16;
            v53 -= 16;
          }
          while (v53 != v54);
          v53 = *v41;
        }
        *v41 = v55;
        v46 = v52 + 16;
        *v43 = v52 + 16;
        void *v45 = &v51[16 * v50];
        if (v53) {
          operator delete(v53);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v42 = v38;
        *(_DWORD *)(v42 + 4) = v39;
        *(_WORD *)(v42 + 8) = v40;
        v46 = (void *)(v42 + 16);
        *(_DWORD *)(v42 + 12) = 0;
      }
      *v43 = v46;
      ++v35;
    }
    while (v35 != v36);
    int v10 = 0;
    uint64_t v8 = v83;
  }
  if (!v8) {
    return;
  }
LABEL_58:
  v56 = (_OWORD **)(a7 + 8);
  uint64_t v57 = v8;
  do
  {
    v58 = *(v56 - 1);
    v59 = *v56;
    v90 = (uint64_t (*)(void))abpk::isDuplicate;
    v60 = std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<abpk::peak *>,std::__wrap_iter<abpk::peak *>,BOOL (*&)(abpk::peak const&,abpk::peak const&)>(v58, v59, &v90);
    if (*v56 != v60) {
      *v56 = v60;
    }
    v56 += 3;
    --v57;
  }
  while (v57);
  int v61 = v10;
  uint64_t v62 = 0;
  v63 = a8 + 2;
  do
  {
    v64 = (uint64_t *)(a7 + 24 * v62);
    uint64_t v65 = *v64;
    if ((int)((unint64_t)(v64[1] - *v64) >> 4) >= 1)
    {
      uint64_t v66 = 0;
      v67 = (void **)a8;
      v68 = (char *)a8[1];
      do
      {
        uint64_t v69 = v65 + 16 * v66;
        *(_DWORD *)(v69 + 12) = v61;
        if ((unint64_t)v68 >= *v63)
        {
          uint64_t v70 = (v68 - (unsigned char *)*v67) >> 4;
          if ((unint64_t)(v70 + 1) >> 60) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v71 = *v63 - (void)*v67;
          uint64_t v72 = v71 >> 3;
          if (v71 >> 3 <= (unint64_t)(v70 + 1)) {
            uint64_t v72 = v70 + 1;
          }
          if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v73 = v72;
          }
          if (v73)
          {
            v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v63, v73);
            v67 = (void **)a8;
          }
          else
          {
            v74 = 0;
          }
          v75 = &v74[16 * v70];
          *(_OWORD *)v75 = *(_OWORD *)v69;
          v77 = (char *)*v67;
          v76 = (char *)v67[1];
          v78 = v75;
          if (v76 != *v67)
          {
            do
            {
              *((_OWORD *)v78 - 1) = *((_OWORD *)v76 - 1);
              v78 -= 16;
              v76 -= 16;
            }
            while (v76 != v77);
            v76 = (char *)*v67;
          }
          v68 = v75 + 16;
          *v67 = v78;
          v67[1] = v75 + 16;
          v67[2] = &v74[16 * v73];
          if (v76)
          {
            operator delete(v76);
            v67 = (void **)a8;
          }
        }
        else
        {
          *(_OWORD *)v68 = *(_OWORD *)v69;
          v68 += 16;
        }
        ++v61;
        v67[1] = v68;
        ++v66;
        uint64_t v65 = *v64;
      }
      while (v66 < (int)((unint64_t)(v64[1] - *v64) >> 4));
    }
    ++v62;
  }
  while (v62 != v83);
}

BOOL abpk::isDuplicate(_DWORD *a1, _DWORD *a2)
{
  int v2 = *a1 - *a2;
  if (v2 < 0) {
    int v2 = *a2 - *a1;
  }
  if (v2 > 1) {
    return 0;
  }
  int v3 = a1[1] - a2[1];
  if (v3 < 0) {
    int v3 = a2[1] - a1[1];
  }
  return v3 < 2;
}

{
  int v2;
  int v3;

  int v2 = *a1 - *a2;
  if (v2 < 0) {
    int v2 = *a2 - *a1;
  }
  if (v2 > 1) {
    return 0;
  }
  int v3 = a1[1] - a2[1];
  if (v3 < 0) {
    int v3 = a2[1] - a1[1];
  }
  return v3 < 2;
}

void abpk::extractHumansLegacy(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, char a7@<W6>, unsigned int a8@<W7>, uint64_t *a9@<X8>)
{
  uint64_t v221 = *MEMORY[0x263EF8340];
  uint64_t v216 = 0;
  memset(v215, 0, sizeof(v215));
  v213 = 0;
  v214[0] = 0;
  v214[1] = 0;
  abpk::getJointPositionsAndMaximasLegacy(a1, a2, a4, a6, a7, a8, (uint64_t)v215, &v213);
  uint64_t v12 = 0;
  uint64_t v196 = *a4;
  uint64_t v13 = *a4 - 1;
  memset(v220, 0, sizeof(v220));
  double v14 = 1.0e-12;
  do
  {
    uint64_t v197 = v12;
    uint64_t v15 = &abpk::bones[2 * v12];
    int v16 = *v15;
    int v17 = v15[1];
    __b = 0;
    v211 = 0;
    unint64_t v212 = 0;
    float v18 = (uint64_t *)v215 + 3 * v16;
    uint64_t v19 = v18[1];
    v198 = v18 + 1;
    v199 = v18;
    uint64_t v20 = *v18;
    if (v19 != v20)
    {
      uint64_t v21 = (uint64_t *)v215 + 3 * v17;
      double v23 = v21 + 1;
      uint64_t v22 = v21[1];
      v205 = v21;
      uint64_t v24 = *v21;
      if (v22 != *v21)
      {
        if ((int)((unint64_t)(v19 - v20) >> 4) < 1)
        {
          v78 = 0;
          v77 = 0;
        }
        else
        {
          uint64_t v200 = 0;
          v201 = v21 + 1;
          v202 = (int *)((char *)&abpk::s_bonesmap + 8 * v197);
          do
          {
            if ((int)((unint64_t)(v22 - v24) >> 4) >= 1)
            {
              uint64_t v25 = 0;
              uint64_t v26 = v20 + 16 * v200;
              uint64_t v27 = (int *)(v26 + 4);
              do
              {
                unint64_t v28 = (_DWORD *)(v24 + 16 * v25);
                float v29 = (float)(*v28 - *(_DWORD *)v26);
                float v30 = (float)(v28[1] - *v27);
                float v31 = sqrtf((float)(v30 * v30) + (float)(v29 * v29));
                double v32 = v31;
                if (v31 >= v14)
                {
                  double v33 = v14;
                  CVReturn v34 = 0;
                  int v35 = 0;
                  float v204 = (float)*(unint64_t *)(a5 + 8);
                  uint64_t v36 = v202[1];
                  uint64_t v37 = *v202;
                  float v38 = v29 / v31;
                  float v39 = v30 / v31;
                  __p = 0;
                  v217 = 0;
                  unint64_t v219 = 0;
                  float v40 = v29 / 10.0;
                  float v41 = v30 / 10.0;
                  do
                  {
                    *(double *)&float16x4_t v42 = (float)((float)*v27 + (float)((float)v35 * v41)) + 0.5;
                    uint64_t v43 = a6[1] * (int)*(void *)&v42
                        + (int)((float)((float)*(int *)v26 + (float)((float)v35 * v40)) + 0.5);
                    v42.i16[0] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v37));
                    v42.i16[1] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v36));
                    unint64_t v44 = vcvtq_f32_f16(v42).u64[0];
                    if ((unint64_t)v34 >= v219)
                    {
                      unint64_t __len = v44;
                      uint64_t v45 = ((char *)v34 - (unsigned char *)v217) >> 3;
                      if ((unint64_t)(v45 + 1) >> 61) {
                        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                      }
                      unint64_t v46 = (uint64_t)(v219 - (void)v217) >> 2;
                      if (v46 <= v45 + 1) {
                        unint64_t v46 = v45 + 1;
                      }
                      if (v219 - (unint64_t)v217 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v47 = v46;
                      }
                      if (v47) {
                        unint64_t v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v219, v47);
                      }
                      else {
                        unint64_t v48 = 0;
                      }
                      uint64_t v49 = (unint64_t *)&v48[8 * v45];
                      *uint64_t v49 = __len;
                      CVReturn v34 = v49 + 1;
                      unint64_t v50 = (char *)__p;
                      v51 = (char *)v217;
                      if (__p != v217)
                      {
                        do
                        {
                          unint64_t v52 = *((void *)v50 - 1);
                          v50 -= 8;
                          *--uint64_t v49 = v52;
                        }
                        while (v50 != v51);
                        unint64_t v50 = (char *)v217;
                      }
                      v217 = v49;
                      __p = v34;
                      unint64_t v219 = (unint64_t)&v48[8 * v47];
                      if (v50) {
                        operator delete(v50);
                      }
                    }
                    else
                    {
                      *v34++ = v44;
                    }
                    __p = v34;
                    ++v35;
                  }
                  while (v35 != 10);
                  uint64_t v53 = 0;
                  unsigned int v54 = 0;
                  float v55 = 0.0;
                  do
                  {
                    float v56 = vmlas_n_f32(vmuls_lane_f32(v39, *(float32x2_t *)((char *)v217 + v53), 1), v38, COERCE_FLOAT(*(void *)((char *)v217 + v53)));
                    float v55 = v55 + v56;
                    if (v56 > 0.05) {
                      ++v54;
                    }
                    v53 += 8;
                  }
                  while (v53 != 80);
                  __p = v217;
                  operator delete(v217);
                  uint64_t v13 = v196 - 1;
                  double v14 = v33;
                  double v23 = v201;
                  if (v54 >= 7)
                  {
                    float v57 = fmin(v204 * 0.5 / v32 + -1.0, 0.0) + v55 / 10.0;
                    if (v57 > 0.0)
                    {
                      _H0 = *(_WORD *)(v26 + 8);
                      __asm { FCVT            S0, H0 }
                      _H1 = *(_WORD *)(v24 + 16 * v25 + 8);
                      __asm { FCVT            S1, H1 }
                      float v66 = (float)(v57 + _S0) + _S1;
                      v67 = v211;
                      if ((unint64_t)v211 >= v212)
                      {
                        uint64_t v69 = (float32x2_t *)__b;
                        uint64_t v70 = ((char *)v211 - (unsigned char *)__b) >> 4;
                        unint64_t v71 = v70 + 1;
                        if ((unint64_t)(v70 + 1) >> 60) {
                          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                        }
                        uint64_t v72 = v212 - (void)__b;
                        if ((uint64_t)(v212 - (void)__b) >> 3 > v71) {
                          unint64_t v71 = v72 >> 3;
                        }
                        if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0) {
                          unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v73 = v71;
                        }
                        if (v73)
                        {
                          v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)&v212, v73);
                          uint64_t v69 = (float32x2_t *)__b;
                          v67 = v211;
                        }
                        else
                        {
                          v74 = 0;
                        }
                        v75 = &v74[16 * v70];
                        *(_DWORD *)v75 = v200;
                        *((_DWORD *)v75 + 1) = v25;
                        *((float *)v75 + 2) = v57;
                        *((float *)v75 + 3) = v66;
                        v76 = v75;
                        if (v67 != v69)
                        {
                          do
                          {
                            *((_OWORD *)v76 - 1) = *(_OWORD *)v67[-2].f32;
                            v76 -= 16;
                            v67 -= 2;
                          }
                          while (v67 != v69);
                          uint64_t v69 = (float32x2_t *)__b;
                        }
                        v68 = (float32x2_t *)(v75 + 16);
                        __b = v76;
                        v211 = (float32x2_t *)(v75 + 16);
                        unint64_t v212 = (unint64_t)&v74[16 * v73];
                        if (v69) {
                          operator delete(v69);
                        }
                      }
                      else
                      {
                        v211->i32[0] = v200;
                        v67->i32[1] = v25;
                        v68 = v67 + 2;
                        v67[1].f32[0] = v57;
                        v67[1].f32[1] = v66;
                      }
                      v211 = v68;
                    }
                  }
                }
                ++v25;
                uint64_t v22 = *v23;
                uint64_t v24 = *v205;
              }
              while (v25 < (int)((unint64_t)(*v23 - *v205) >> 4));
              uint64_t v19 = *v198;
              uint64_t v20 = *v199;
            }
            ++v200;
          }
          while (v200 < (int)((unint64_t)(v19 - v20) >> 4));
          v77 = (char *)__b;
          v78 = (char *)v211;
        }
        unint64_t v79 = 126 - 2 * __clz((v78 - v77) >> 4);
        v217 = abpk::compareCandidate;
        if (v78 == v77) {
          uint64_t v80 = 0;
        }
        else {
          uint64_t v80 = v79;
        }
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(v77, v78, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v217, v80, 1);
        v81 = (char *)__b;
        uint64_t v82 = (char *)v211;
        if ((int)((unint64_t)((char *)v211 - (unsigned char *)__b) >> 4) >= 1)
        {
          uint64_t v83 = 0;
          v84 = (char *)v220 + 24 * v197;
          uint64_t v85 = (_DWORD *)*((void *)v84 + 1);
          __lena = (_DWORD **)(v84 + 8);
          unint64_t v86 = v84 + 16;
          do
          {
            v87 = &v81[16 * v83];
            uint64_t v88 = *(_DWORD **)v84;
            uint64_t v89 = ((uint64_t)v85 - *(void *)v84) >> 2;
            unint64_t v90 = 0xCCCCCCCCCCCCCCCDLL * v89;
            int v93 = *(_DWORD *)v87;
            v91 = (int *)(v87 + 4);
            int v92 = v93;
            if (-858993459 * (int)v89 <= 0)
            {
              int v96 = *v91;
LABEL_68:
              int v97 = *(_DWORD *)&v81[16 * v83 + 8];
              int v98 = *(_DWORD *)(*v199 + 16 * v92 + 12);
              int v99 = *(_DWORD *)(*v205 + 16 * v96 + 12);
              if ((unint64_t)v85 >= *v86)
              {
                unint64_t v100 = v90 + 1;
                if (v90 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                  std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                }
                if (0x999999999999999ALL * ((uint64_t)(*v86 - (void)v88) >> 2) > v100) {
                  unint64_t v100 = 0x999999999999999ALL * ((uint64_t)(*v86 - (void)v88) >> 2);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*v86 - (void)v88) >> 2) >= 0x666666666666666) {
                  unint64_t v101 = 0xCCCCCCCCCCCCCCCLL;
                }
                else {
                  unint64_t v101 = v100;
                }
                if (v101)
                {
                  v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Connection>>((uint64_t)v86, v101);
                  uint64_t v85 = *__lena;
                  uint64_t v88 = *(_DWORD **)v84;
                  unint64_t v86 = v84 + 16;
                }
                else
                {
                  v102 = 0;
                }
                v103 = &v102[20 * v90];
                *(_DWORD *)v103 = v98;
                *((_DWORD *)v103 + 1) = v99;
                *((_DWORD *)v103 + 2) = v97;
                *((_DWORD *)v103 + 3) = v92;
                *((_DWORD *)v103 + 4) = v96;
                v104 = v103;
                if (v85 == v88)
                {
                  uint64_t v13 = v196 - 1;
                }
                else
                {
                  uint64_t v13 = v196 - 1;
                  do
                  {
                    long long v105 = *(_OWORD *)(v85 - 5);
                    *((_DWORD *)v104 - 1) = *(v85 - 1);
                    *(_OWORD *)(v104 - 20) = v105;
                    v104 -= 20;
                    v85 -= 5;
                  }
                  while (v85 != v88);
                  uint64_t v88 = *(_DWORD **)v84;
                }
                *(void *)v84 = v104;
                uint64_t v85 = v103 + 20;
                *__lena = v103 + 20;
                *unint64_t v86 = &v102[20 * v101];
                if (v88)
                {
                  operator delete(v88);
                  unint64_t v86 = v84 + 16;
                }
              }
              else
              {
                *uint64_t v85 = v98;
                v85[1] = v99;
                v85[2] = v97;
                v85[3] = v92;
                v85[4] = v96;
                v85 += 5;
                uint64_t v13 = v196 - 1;
              }
              *__lena = v85;
              v81 = (char *)__b;
              uint64_t v82 = (char *)v211;
            }
            else
            {
              uint64_t v94 = (-858993459 * v89);
              v95 = v88 + 4;
              while (*(v95 - 1) != v92)
              {
                int v96 = *v91;
                if (*v95 == *v91) {
                  break;
                }
                v95 += 5;
                if (!--v94) {
                  goto LABEL_68;
                }
              }
              uint64_t v13 = v196 - 1;
            }
            ++v83;
          }
          while (v83 < (int)((unint64_t)(v82 - v81) >> 4));
        }
        if (v81)
        {
          v211 = (float32x2_t *)v81;
          operator delete(v81);
        }
      }
    }
    uint64_t v12 = v197 + 1;
  }
  while (v197 != 15);
  uint64_t v106 = 0;
  uint64_t v107 = v196;
  __p = 0;
  v217 = 0;
  unint64_t v219 = 0;
  do
  {
    uint64_t v206 = v106;
    v108 = (uint64_t *)v220 + 3 * v106;
    uint64_t v109 = *v108;
    if ((int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)) >= 1)
    {
      uint64_t v110 = 0;
      v111 = &abpk::bones[2 * v106];
      uint64_t v112 = *v111;
      uint64_t v113 = v111[1];
      do
      {
        v114 = (__n128 *)__p;
        v115 = (char *)v217;
        if ((int)(-1431655765 * (((unsigned char *)__p - (unsigned char *)v217) >> 3)) < 1) {
          goto LABEL_115;
        }
        uint64_t v116 = 0;
        int v117 = 0;
        int v118 = 0;
        int v119 = 0;
        v120 = (int *)(v109 + 20 * v110);
        int v122 = *v120;
        v121 = v120 + 1;
        float v123 = (float)v122;
        v124 = v217;
        do
        {
          if (*(float *)(*v124 + 4 * v112) == v123 || *(float *)(*v124 + 4 * v113) == (float)*v121)
          {
            if (!v119) {
              int v118 = v116;
            }
            if (v119 == 1) {
              int v117 = v116;
            }
            ++v119;
          }
          ++v116;
          v124 += 3;
        }
        while (-1431655765 * (((unsigned char *)__p - (unsigned char *)v217) >> 3) != v116);
        switch(v119)
        {
          case 0:
LABEL_115:
            std::vector<float>::vector(&__b, v196 + 1);
            v134 = (float *)__b;
            if (v196 != -1) {
              memset_pattern16(__b, &unk_21B813710, 4 * v196 + 4);
            }
            v135 = (float *)(*v108 + 20 * v110);
            uint64_t v136 = *(int *)v135;
            v134[v112] = (float)(int)v136;
            uint64_t v137 = *((int *)v135 + 1);
            v134[v113] = (float)(int)v137;
            v134[v107] = 2.0;
            _H0 = *((short float *)v213 + 8 * v136 + 4) + *((short float *)v213 + 8 * v137 + 4);
            __asm { FCVT            S0, H0 }
            v134[v196 - 1] = v135[2] + _S0;
            v140 = __p;
            if ((unint64_t)__p >= v219)
            {
              v141 = (void *)std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v217, (uint64_t)&__b);
            }
            else
            {
              *(void *)__p = 0;
              v140[1] = 0;
              v140[2] = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v140, __b, (uint64_t)v211, ((char *)v211 - (unsigned char *)__b) >> 2);
              v141 = v140 + 3;
            }
            __p = v141;
            uint64_t v13 = v196 - 1;
            if (__b)
            {
              v211 = (float32x2_t *)__b;
              operator delete(__b);
            }
            break;
          case 1:
            uint64_t v142 = *((void *)v217 + 3 * v118);
            uint64_t v143 = *v121;
            if (*(float *)(v142 + 4 * v113) != (float)(int)v143)
            {
              *(float *)(v142 + 4 * v113) = (float)(int)v143;
              *(float *)(v142 + 4 * v107) = *(float *)(v142 + 4 * v107) + 1.0;
              _H0 = *((_WORD *)v213 + 8 * v143 + 4);
              __asm { FCVT            S0, H0 }
              *(float *)(v142 + 4 * v13) = *(float *)(v142 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            }
            break;
          case 2:
            if (!v13)
            {
              int v128 = v117;
              uint64_t v146 = *((void *)v217 + 3 * v117);
              uint64_t v147 = *((void *)v217 + 3 * v118);
LABEL_127:
              *(float *)(v147 + 4 * v107) = *(float *)(v146 + 4 * v107) + *(float *)(v147 + 4 * v107);
              float v149 = *(float *)(v146 + 4 * v13) + *(float *)(v147 + 4 * v13);
              *(float *)(v147 + 4 * v13) = v149;
              *(float *)(v147 + 4 * v13) = v149 + *(float *)(v109 + 20 * v110 + 8);
              std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)&v115[24 * v128 + 24], v114, (uint64_t)&v115[24 * v128]);
              v151 = v150;
              v152 = __p;
              if (__p != v150)
              {
                v153 = (char *)__p;
                do
                {
                  v155 = (void *)*((void *)v153 - 3);
                  v153 -= 24;
                  v154 = v155;
                  if (v155)
                  {
                    *(v152 - 2) = v154;
                    operator delete(v154);
                  }
                  v152 = v153;
                }
                while (v153 != v151);
              }
              __p = v151;
              uint64_t v107 = v196;
              uint64_t v13 = v196 - 1;
              break;
            }
            uint64_t v125 = 0;
            int v126 = 0;
            v127 = (uint64_t *)((char *)v217 + 24 * v118);
            int v128 = v117;
            v129 = (uint64_t *)((char *)v217 + 24 * v117);
            do
            {
              if (*(float *)(*v127 + 4 * v125) > 0.0 && *(float *)(*v129 + 4 * v125) > 0.0) {
                int v126 = 2;
              }
              ++v125;
            }
            while (v13 != v125);
            if (!v126)
            {
              uint64_t v148 = 0;
              uint64_t v146 = *v129;
              uint64_t v147 = *v127;
              do
              {
                *(float *)(v147 + 4 * v148) = (float)(*(float *)(v146 + 4 * v148) + 1.0) + *(float *)(v147 + 4 * v148);
                ++v148;
              }
              while (v13 != v148);
              goto LABEL_127;
            }
            uint64_t v130 = *v121;
            uint64_t v131 = *v127;
            *(float *)(*v127 + 4 * v113) = (float)(int)v130;
            *(float *)(v131 + 4 * v107) = *(float *)(v131 + 4 * v107) + 1.0;
            _H0 = *((_WORD *)v213 + 8 * v130 + 4);
            __asm { FCVT            S0, H0 }
            *(float *)(v131 + 4 * v13) = *(float *)(v131 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            break;
        }
        ++v110;
        uint64_t v109 = *v108;
      }
      while (v110 < (int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)));
    }
    uint64_t v106 = v206 + 1;
  }
  while (v206 != 15);
  v156 = (__n128 *)__p;
  int64_t v157 = ((unsigned char *)__p - (unsigned char *)v217) >> 3;
  unint64_t v158 = 0xAAAAAAAAAAAAAAABLL * v157;
  if (-1431655765 * (int)v157 >= 1)
  {
    uint64_t v159 = (-1431655765 * v157);
    do
    {
      v160 = (char *)v217 + 24 * (v159 - 1);
      float v161 = *(float *)(*(void *)v160 + 4 * v107);
      if (v161 < 8.0 || (float)(*(float *)(*(void *)v160 + 4 * v13) / v161) < 0.3)
      {
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)(v160 + 24), v156, (uint64_t)v160);
        v156 = v162;
        n128_u64 = __p;
        if (__p != v162)
        {
          v164 = (__n128 *)__p;
          do
          {
            v166 = (void *)v164[-2].n128_u64[1];
            v164 = (__n128 *)((char *)v164 - 24);
            v165 = v166;
            if (v166)
            {
              *(n128_u64 - 2) = v165;
              operator delete(v165);
            }
            n128_u64 = v164->n128_u64;
          }
          while (v164 != v156);
        }
        __p = v156;
      }
    }
    while (v159-- > 1);
    unint64_t v158 = 0xAAAAAAAAAAAAAAABLL * (((char *)v156 - (unsigned char *)v217) >> 3);
  }
  *a9 = 0;
  a9[1] = 0;
  a9[2] = 0;
  std::vector<abpk::Human>::reserve(a9, v158);
  if (__p != v217)
  {
    unint64_t v168 = 0;
    __asm { FMOV            V8.2S, #-1.0 }
    do
    {
      uint64x2_t __lenb = *(uint64x2_t *)(a5 + 8);
      v211 = 0;
      unint64_t v212 = 0;
      __b = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__b, 0x11uLL);
      uint64_t v170 = 0;
      float32x2_t v171 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(__lenb)));
      do
      {
        if (((int)*(float *)(*((void *)v217 + 3 * v168) + 4 * v170) & 0x80000000) == 0)
        {
          float32x2_t v172 = vdiv_f32(vcvt_f32_s32(*(int32x2_t *)((char *)v213+ 16* (int)*(float *)(*((void *)v217 + 3 * v168) + 4 * v170))), v171);
          v173 = v211;
          if ((unint64_t)v211 < v212)
          {
            float32x2_t *v211 = v172;
            v174 = v173 + 1;
            goto LABEL_182;
          }
          uint64_t v176 = ((char *)v211 - (unsigned char *)__b) >> 3;
          if ((unint64_t)(v176 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v177 = (uint64_t)(v212 - (void)__b) >> 2;
          if (v177 <= v176 + 1) {
            unint64_t v177 = v176 + 1;
          }
          if (v212 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v178 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v178 = v177;
          }
          if (v178) {
            v179 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v212, v178);
          }
          else {
            v179 = 0;
          }
          v182 = (float32x2_t *)&v179[8 * v176];
          float32x2_t *v182 = v172;
          v174 = v182 + 1;
          v184 = __b;
          v183 = v211;
          if (v211 == __b) {
            goto LABEL_180;
          }
          do
          {
            float32x2_t v185 = *(float32x2_t *)(v183 - 2);
            v183 -= 2;
            v182[-1] = v185;
            --v182;
          }
          while (v183 != v184);
          goto LABEL_179;
        }
        v175 = v211;
        if ((unint64_t)v211 < v212)
        {
          float32x2_t *v211 = _D8;
          v174 = v175 + 1;
          goto LABEL_182;
        }
        uint64_t v180 = ((char *)v211 - (unsigned char *)__b) >> 3;
        if ((unint64_t)(v180 + 1) >> 61) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v181 = (uint64_t)(v212 - (void)__b) >> 2;
        if (v181 <= v180 + 1) {
          unint64_t v181 = v180 + 1;
        }
        if (v212 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v178 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v178 = v181;
        }
        if (v178) {
          v179 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v212, v178);
        }
        else {
          v179 = 0;
        }
        v182 = (float32x2_t *)&v179[8 * v180];
        float32x2_t *v182 = _D8;
        v174 = v182 + 1;
        v186 = __b;
        v183 = v211;
        if (v211 != __b)
        {
          do
          {
            float32x2_t v187 = *(float32x2_t *)(v183 - 2);
            v183 -= 2;
            v182[-1] = v187;
            --v182;
          }
          while (v183 != v186);
LABEL_179:
          v183 = __b;
        }
LABEL_180:
        __b = v182;
        v211 = v174;
        unint64_t v212 = (unint64_t)&v179[8 * v178];
        if (v183) {
          operator delete(v183);
        }
LABEL_182:
        v211 = v174;
        ++v170;
      }
      while (v170 != 17);
      unint64_t v188 = a9[1];
      if (v188 >= a9[2])
      {
        uint64_t v189 = _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEEEEEPS2_DpOT_(a9, (uint64_t)&__b);
        v190 = a9;
      }
      else
      {
        _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_((uint64_t)(a9 + 2), a9[1], (uint64_t)&__b);
        uint64_t v189 = v188 + 120;
        v190 = a9;
        a9[1] = v188 + 120;
      }
      v190[1] = v189;
      if (__b)
      {
        v211 = (float32x2_t *)__b;
        operator delete(__b);
      }
      ++v168;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)__p - (unsigned char *)v217) >> 3) > v168);
  }
  __b = &v217;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__b);
  uint64_t v191 = 384;
  do
  {
    v192 = *(void **)((char *)&v217 + v191);
    if (v192)
    {
      *(void **)((char *)&__p + v191) = v192;
      operator delete(v192);
    }
    v191 -= 24;
  }
  while (v191);
  if (v213)
  {
    v214[0] = v213;
    operator delete(v213);
  }
  uint64_t v193 = 51;
  do
  {
    v194 = (void *)v214[v193 - 1];
    if (v194)
    {
      v214[v193] = v194;
      operator delete(v194);
    }
    v193 -= 3;
  }
  while (v193 * 8);
}

void sub_21B7CEA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  a27 = a9;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a27 = &STACK[0x258];
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  uint64_t v32 = 384;
  while (1)
  {
    double v33 = *(void **)((char *)&STACK[0x270] + v32 - 24);
    if (v33)
    {
      *(unint64_t *)((char *)&STACK[0x270] + v32 - 16) = (unint64_t)v33;
      operator delete(v33);
    }
    v32 -= 24;
    if (!v32)
    {
      if (__p)
      {
        a31 = (uint64_t)__p;
        operator delete(__p);
      }
      uint64_t v34 = 408;
      while (1)
      {
        int v35 = *(void **)((char *)&__p + v34);
        if (v35)
        {
          *(uint64_t *)((char *)&a31 + v34) = (uint64_t)v35;
          operator delete(v35);
        }
        v34 -= 24;
        if (!v34) {
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

BOOL abpk::compareCandidate(uint64_t a1, int a2, uint64_t a3, int a4)
{
  return *(float *)&a2 > *(float *)&a4;
}

{
  return *(float *)&a2 > *(float *)&a4;
}

void **std::vector<abpk::Human>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  result = (void **)(a1 + 2);
  if (0xEEEEEEEEEEEEEEEFLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x222222222222223) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 120 * v6;
    std::vector<abpk::Human>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<abpk::Human>::~__split_buffer(v7);
  }
  return result;
}

void sub_21B7CEC40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<abpk::Human>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    int v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      int v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

_OWORD *std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<abpk::peak *>,std::__wrap_iter<abpk::peak *>,BOOL (*&)(abpk::peak const&,abpk::peak const&)>(_OWORD *a1, _OWORD *a2, uint64_t (**a3)(void))
{
  uint64_t v4 = a2;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = a1 + 1;
      if (a1 + 1 == a2) {
        return a2;
      }
      int v7 = (*a3)();
      a1 = v6;
    }
    while (!v7);
    uint64_t v8 = v6 + 1;
    uint64_t v9 = v6 - 1;
    while (v8 != a2)
    {
      if ((((uint64_t (*)(_OWORD *, _OWORD *))*a3)(v9, v8) & 1) == 0)
      {
        v9[1] = *v8;
        ++v9;
      }
      ++v8;
    }
    return v9 + 1;
  }
  return v4;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(char *a1, char *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = a2 - v11;
    unint64_t v15 = (a2 - v11) >> 4;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          uint64_t v21 = *((void *)a2 - 2);
          uint64_t v22 = *((void *)a2 - 1);
          double v23 = a2 - 16;
          if ((*a3)(v21, v22, *(void *)v11, *((void *)v11 + 1)))
          {
            long long v25 = *(_OWORD *)v11;
            *(_OWORD *)uint64_t v11 = *(_OWORD *)v23;
            *(_OWORD *)double v23 = v25;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v11, (void *)v11 + 2, (void *)a2 - 2, a3);
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v11, (void *)v11 + 2, (void *)v11 + 4, (void *)a2 - 2, a3);
          break;
        case 5uLL:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v11, (void *)v11 + 2, (void *)v11 + 4, (void *)v11 + 6, (void *)a2 - 2, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 383) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,abpk::Candidate*>(v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    int v17 = &v11[16 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v11, &v11[16 * (v15 >> 1)], (void *)a2 - 2, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((void *)v11 + 2, (void *)v17 - 2, (void *)a2 - 4, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((void *)v11 + 4, &v11[16 * v16 + 16], (void *)a2 - 6, a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((void *)v17 - 2, v17, &v11[16 * v16 + 16], a3);
      long long v24 = *(_OWORD *)v11;
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v17;
      *(_OWORD *)int v17 = v24;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(&v11[16 * (v15 >> 1)], v11, (void *)a2 - 2, a3);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (((*a3)(*((void *)v11 - 2), *((void *)v11 - 1), *(void *)v11, *((void *)v11 + 1)) & 1) == 0)
    {
      uint64_t v11 = (char *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>(v11, a2, a3);
      goto LABEL_18;
    }
LABEL_13:
    float v18 = (char *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>((uint64_t *)v11, (uint64_t *)a2, a3);
    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v20 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v11, v18, a3);
    uint64_t v11 = v18 + 16;
    if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(v18 + 16, a2, a3))
    {
      a4 = -v13;
      a2 = v18;
      if (v20) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v20)
    {
LABEL_16:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(a1, v18, a3, -v13, a5 & 1);
      uint64_t v11 = v18 + 16;
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)v11, a2, a3);
  }
  else
  {
    std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)v11, a2, a3);
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, void *a2, uint64_t (**a3)(uint64_t, uint64_t, void, void))
{
  if ((void *)result != a2)
  {
    uint64_t v4 = (void *)result;
    char v5 = (void *)(result + 16);
    if ((void *)(result + 16) != a2)
    {
      uint64_t v7 = 0;
      uint64_t v8 = (void *)result;
      do
      {
        uint64_t v9 = v5;
        result = (*a3)(v8[2], v8[3], *v8, v8[1]);
        if (result)
        {
          uint64_t v10 = *v9;
          uint64_t v11 = v8[3];
          uint64_t v12 = v7;
          while (1)
          {
            *(_OWORD *)((char *)v4 + v12 + 16) = *(_OWORD *)((char *)v4 + v12);
            if (!v12) {
              break;
            }
            result = (*a3)(v10, v11, *(void *)((char *)v4 + v12 - 16), *(void *)((char *)v4 + v12 - 8));
            v12 -= 16;
            if ((result & 1) == 0)
            {
              uint64_t v13 = (void *)((char *)v4 + v12 + 16);
              goto LABEL_10;
            }
          }
          uint64_t v13 = v4;
LABEL_10:
          *uint64_t v13 = v10;
          v13[1] = v11;
        }
        char v5 = v9 + 2;
        v7 += 16;
        uint64_t v8 = v9;
      }
      while (v9 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, void *a2, uint64_t (**a3)(uint64_t, uint64_t, void, void))
{
  if ((void *)result != a2)
  {
    uint64_t v4 = (void *)result;
    char v5 = (void *)(result + 16);
    if ((void *)(result + 16) != a2)
    {
      do
      {
        uint64_t v7 = v5;
        result = (*a3)(v4[2], v4[3], *v4, v4[1]);
        if (result)
        {
          uint64_t v8 = *v7;
          uint64_t v9 = v4[3];
          uint64_t v10 = v7;
          do
          {
            uint64_t v11 = v10 - 1;
            _OWORD *v10 = *(v10 - 1);
            result = (*a3)(v8, v9, *((void *)v10 - 4), *((void *)v10 - 3));
            uint64_t v10 = v11;
          }
          while ((result & 1) != 0);
          void *v11 = v8;
          v11[1] = v9;
        }
        char v5 = v7 + 2;
        uint64_t v4 = v7;
      }
      while (v7 + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(void *a1, void *a2, void *a3, uint64_t (**a4)(void, void, void, void))
{
  char v8 = (*a4)(*a2, a2[1], *a1, a1[1]);
  uint64_t result = (*a4)(*a3, a3[1], *a2, a2[1]);
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    long long v11 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v11;
    if (!(*a4)(*a2, a2[1], *a1, a1[1])) {
      return 1;
    }
    long long v12 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v12;
    return 2;
  }
  if (!result)
  {
    long long v13 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v13;
    if (!(*a4)(*a3, a3[1], *a2, a2[1])) {
      return 1;
    }
    long long v14 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v14;
    return 2;
  }
  long long v10 = *(_OWORD *)a1;
  *(_OWORD *)a1 = *(_OWORD *)a3;
  *(_OWORD *)a3 = v10;
  return 1;
}

void *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>(void *a1, _OWORD *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a2;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if ((*a3)(*a1, v7, *((void *)a2 - 2), *((void *)a2 - 1)))
  {
    char v8 = a1;
    do
    {
      uint64_t v9 = v8[2];
      uint64_t v10 = v8[3];
      v8 += 2;
    }
    while (((*a3)(v6, v7, v9, v10) & 1) == 0);
  }
  else
  {
    long long v11 = a1 + 2;
    do
    {
      char v8 = v11;
      if (v11 >= (void *)v4) {
        break;
      }
      int v12 = (*a3)(v6, v7, *v11, v11[1]);
      long long v11 = v8 + 2;
    }
    while (!v12);
  }
  if (v8 < (void *)v4)
  {
    do
    {
      uint64_t v13 = *((void *)v4 - 2);
      uint64_t v14 = *((void *)v4-- - 1);
    }
    while (((*a3)(v6, v7, v13, v14) & 1) != 0);
  }
  while (v8 < (void *)v4)
  {
    long long v20 = *(_OWORD *)v8;
    *(_OWORD *)char v8 = *v4;
    _OWORD *v4 = v20;
    do
    {
      uint64_t v15 = v8[2];
      uint64_t v16 = v8[3];
      v8 += 2;
    }
    while (!(*a3)(v6, v7, v15, v16));
    do
    {
      uint64_t v17 = *((void *)v4 - 2);
      uint64_t v18 = *((void *)v4-- - 1);
    }
    while (((*a3)(v6, v7, v17, v18) & 1) != 0);
  }
  if (v8 - 2 != a1) {
    *(_OWORD *)a1 = *((_OWORD *)v8 - 1);
  }
  *(v8 - 2) = v6;
  *(v8 - 1) = v7;
  return v8;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,abpk::Candidate *,BOOL (*&)(abpk::Candidate,abpk::Candidate)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = 0;
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  do
  {
    char v9 = (*a3)(a1[v6 + 2], a1[v6 + 3], v7, v8);
    v6 += 2;
  }
  while ((v9 & 1) != 0);
  uint64_t v10 = &a1[v6];
  if (v6 == 2)
  {
    do
    {
      if (v10 >= a2) {
        break;
      }
      uint64_t v13 = *(a2 - 2);
      uint64_t v14 = *(a2 - 1);
      a2 -= 2;
    }
    while (((*a3)(v13, v14, v7, v8) & 1) == 0);
  }
  else
  {
    do
    {
      uint64_t v11 = *(a2 - 2);
      uint64_t v12 = *(a2 - 1);
      a2 -= 2;
    }
    while (!(*a3)(v11, v12, v7, v8));
  }
  uint64_t v15 = &a1[v6];
  if (v10 < a2)
  {
    uint64_t v16 = a2;
    do
    {
      long long v17 = *(_OWORD *)v15;
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      *(_OWORD *)uint64_t v16 = v17;
      do
      {
        uint64_t v18 = v15[2];
        uint64_t v19 = v15[3];
        v15 += 2;
      }
      while (((*a3)(v18, v19, v7, v8) & 1) != 0);
      do
      {
        uint64_t v20 = *(v16 - 2);
        uint64_t v21 = *(v16 - 1);
        v16 -= 2;
      }
      while (!(*a3)(v20, v21, v7, v8));
    }
    while (v15 < v16);
  }
  uint64_t result = v15 - 2;
  if (v15 - 2 != a1) {
    *(_OWORD *)a1 = *(_OWORD *)result;
  }
  *(v15 - 2) = v7;
  *(v15 - 1) = v8;
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(char *a1, char *a2, uint64_t (**a3)(uint64_t, uint64_t, void, void))
{
  uint64_t v6 = (a2 - a1) >> 4;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v8 = a2 - 16;
      if ((*a3)(*((void *)a2 - 2), *((void *)a2 - 1), *(void *)a1, *((void *)a1 + 1)))
      {
        long long v9 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *(_OWORD *)v8;
        *(_OWORD *)uint64_t v8 = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (void *)a1 + 2, (void *)a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a2 - 2, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (void *)a1 + 2, (void *)a1 + 4, (void *)a1 + 6, (void *)a2 - 2, a3);
      return 1;
    default:
      uint64_t v10 = a1 + 32;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (void *)a1 + 2, (void *)a1 + 4, a3);
      uint64_t v11 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)(*(void *)v11, *((void *)v11 + 1), *(void *)v10, *((void *)v10 + 1)))
    {
      uint64_t v14 = *(void *)v11;
      uint64_t v15 = *((void *)v11 + 1);
      uint64_t v16 = v12;
      while (1)
      {
        long long v17 = &a1[v16];
        *(_OWORD *)&a1[v16 + 48] = *(_OWORD *)&a1[v16 + 32];
        if (v16 == -32) {
          break;
        }
        v16 -= 16;
        if (((*a3)(v14, v15, *((void *)v17 + 2), *((void *)v17 + 3)) & 1) == 0)
        {
          uint64_t v18 = &a1[v16 + 48];
          goto LABEL_12;
        }
      }
      uint64_t v18 = a1;
LABEL_12:
      *(void *)uint64_t v18 = v14;
      *((void *)v18 + 1) = v15;
      if (++v13 == 8) {
        return v11 + 16 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 16;
    v11 += 16;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(void *a1, void *a2, void *a3, void *a4, uint64_t (**a5)(void, void, void, void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, a2, a3, a5);
  if ((*a5)(*a4, a4[1], *a3, a3[1]))
  {
    long long v11 = *(_OWORD *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)a4 = v11;
    if ((*a5)(*a3, a3[1], *a2, a2[1]))
    {
      long long v12 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v12;
      if ((*a5)(*a2, a2[1], *a1, a1[1]))
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t (**a6)(void, void, void, void))
{
  __n128 v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, a2, a3, a4, a6);
  if (((unsigned int (*)(void, void, void, void, __n128))*a6)(*a5, a5[1], *a4, a4[1], v12))
  {
    long long v14 = *(_OWORD *)a4;
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_OWORD *)a5 = v14;
    if ((*a6)(*a4, a4[1], *a3, a3[1]))
    {
      long long v15 = *(_OWORD *)a3;
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_OWORD *)a4 = v15;
      if ((*a6)(*a3, a3[1], *a2, a2[1]))
      {
        long long v16 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v16;
        if ((*a6)(*a2, a2[1], *a1, a1[1]))
        {
          __n128 result = *(__n128 *)a1;
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(__n128 *)a2 = result;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,abpk::Candidate*>(char *a1, char *a2, char *a3, uint64_t (**a4)(void, void, uint64_t, uint64_t))
{
  if (a1 != a2)
  {
    uint64_t v8 = a2 - a1;
    uint64_t v9 = (a2 - a1) >> 4;
    if (a2 - a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      __n128 v12 = &a1[16 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)a1, (unsigned int (**)(void, void, void, void))a4, v9, v12);
        v12 -= 16;
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      long long v14 = a2;
      do
      {
        if ((*a4)(*(void *)v14, *((void *)v14 + 1), *(void *)a1, *((void *)a1 + 1)))
        {
          long long v15 = *(_OWORD *)v14;
          *(_OWORD *)long long v14 = *(_OWORD *)a1;
          *(_OWORD *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)a1, (unsigned int (**)(void, void, void, void))a4, v9, a1);
        }
        v14 += 16;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 17)
    {
      uint64_t v16 = (unint64_t)v8 >> 4;
      long long v17 = a2 - 16;
      do
      {
        long long v21 = *(_OWORD *)a1;
        uint64_t v18 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(a1, (unsigned int (**)(void, void, void, void))a4, v16);
        if (v17 == v18)
        {
          *(_OWORD *)uint64_t v18 = v21;
        }
        else
        {
          *(_OWORD *)uint64_t v18 = *(_OWORD *)v17;
          *(_OWORD *)long long v17 = v21;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>((uint64_t)a1, (uint64_t)(v18 + 16), a4, (v18 + 16 - a1) >> 4);
        }
        v17 -= 16;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, unsigned int (**a2)(void, void, void, void), uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    char v5 = a4;
    uint64_t v6 = result;
    int64_t v17 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 4)
    {
      uint64_t v9 = ((uint64_t)a4 - result) >> 3;
      uint64_t v10 = v9 + 1;
      unint64_t v11 = (void *)(result + 16 * (v9 + 1));
      uint64_t v12 = v9 + 2;
      if (v9 + 2 < a3 && (*a2)(*v11, v11[1], v11[2], v11[3]))
      {
        v11 += 2;
        uint64_t v10 = v12;
      }
      __n128 result = ((uint64_t (*)(void, void, void, void))*a2)(*v11, v11[1], *v5, v5[1]);
      if ((result & 1) == 0)
      {
        uint64_t v13 = *v5;
        uint64_t v14 = v5[1];
        do
        {
          long long v15 = v11;
          *(_OWORD *)char v5 = *(_OWORD *)v11;
          if (v17 < v10) {
            break;
          }
          uint64_t v16 = (2 * v10) | 1;
          unint64_t v11 = (void *)(v6 + 16 * v16);
          if (2 * v10 + 2 < a3)
          {
            if ((*a2)(*v11, v11[1], v11[2], v11[3]))
            {
              v11 += 2;
              uint64_t v16 = 2 * v10 + 2;
            }
          }
          __n128 result = ((uint64_t (*)(void, void, uint64_t, uint64_t))*a2)(*v11, v11[1], v13, v14);
          char v5 = v15;
          uint64_t v10 = v16;
        }
        while (!result);
        *long long v15 = v13;
        v15[1] = v14;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(_OWORD *a1, unsigned int (**a2)(void, void, void, void), uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3
      && (*a2)(*(void *)&a1[v6 + 1], *((void *)&a1[v6 + 1] + 1), *(void *)&a1[v6 + 2], *((void *)&a1[v6 + 2] + 1)))
    {
      ++v9;
      uint64_t v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*>(uint64_t result, uint64_t a2, uint64_t (**a3)(void, void, uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v7 = result;
    unint64_t v8 = v4 >> 1;
    uint64_t v9 = (void *)(result + 16 * (v4 >> 1));
    uint64_t v10 = (_OWORD *)(a2 - 16);
    __n128 result = (*a3)(*v9, v9[1], *(void *)(a2 - 16), *(void *)(a2 - 8));
    if (result)
    {
      uint64_t v11 = *(void *)(a2 - 16);
      uint64_t v12 = *(void *)(a2 - 8);
      do
      {
        uint64_t v13 = v9;
        _OWORD *v10 = *(_OWORD *)v9;
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = (void *)(v7 + 16 * v8);
        __n128 result = (*a3)(*v9, v9[1], v11, v12);
        uint64_t v10 = v13;
      }
      while ((result & 1) != 0);
      *uint64_t v13 = v11;
      v13[1] = v12;
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Connection>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xCCCCCCCCCCCCCCDLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(20 * a2);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      char v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      std::vector<float>::__move_assign(a3, v4);
      uint64_t v4 = (__n128 *)((char *)v4 + 24);
      a3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

__n128 std::vector<float>::__move_assign(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void *std::vector<float>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_21B7D0034(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

uint64_t std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  int64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  long long v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_21B7D01D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7D0244(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 120;
        std::allocator<abpk::Human>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<abpk::Human>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 96))
  {
    uint64_t v3 = *(void **)(a2 + 72);
    if (v3)
    {
      *(void *)(a2 + 80) = v3;
      operator delete(v3);
    }
  }
  uint64_t v4 = *(void **)(a2 + 48);
  if (v4)
  {
    *(void *)(a2 + 56) = v4;
    operator delete(v4);
  }
  uint64_t v5 = *(void **)(a2 + 24);
  if (v5)
  {
    *(void *)(a2 + 32) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v6;
    operator delete(v6);
  }
}

uint64_t std::vector<abpk::Human>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(120 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>,std::reverse_iterator<abpk::Human*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  char v14 = 0;
  if (a3 == a5)
  {
    uint64_t v11 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 120;
      std::allocator<abpk::Human>::construct[abi:ne180100]<abpk::Human,abpk::Human>(a1, v7 - 120, v9);
      uint64_t v7 = *((void *)&v16 + 1) - 120;
      *((void *)&v16 + 1) -= 120;
    }
    while (v9 != a5);
    uint64_t v11 = v16;
  }
  char v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return v11;
}

void std::allocator<abpk::Human>::construct[abi:ne180100]<abpk::Human,abpk::Human>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(_OWORD *)a2 = *(_OWORD *)a3;
  *(void *)(a2 + 16) = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a3 + 24);
  *(void *)(a2 + 40) = *(void *)(a3 + 40);
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a3 + 48);
  *(void *)(a2 + 64) = *(void *)(a3 + 64);
  *(void *)(a3 + 48) = 0;
  *(void *)(a3 + 56) = 0;
  *(void *)(a3 + 64) = 0;
  *(unsigned char *)(a2 + 72) = 0;
  *(unsigned char *)(a2 + 96) = 0;
  if (*(unsigned char *)(a3 + 96))
  {
    *(void *)(a2 + 72) = 0;
    *(void *)(a2 + 80) = 0;
    *(void *)(a2 + 88) = 0;
    *(_OWORD *)(a2 + 72) = *(_OWORD *)(a3 + 72);
    *(void *)(a2 + 88) = *(void *)(a3 + 88);
    *(void *)(a3 + 72) = 0;
    *(void *)(a3 + 80) = 0;
    *(void *)(a3 + 88) = 0;
    *(unsigned char *)(a2 + 96) = 1;
  }
  uint64_t v3 = *(void *)(a3 + 104);
  *(void *)(a2 + 109) = *(void *)(a3 + 109);
  *(void *)(a2 + 104) = v3;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,std::reverse_iterator<abpk::Human*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<abpk::Human>::destroy[abi:ne180100](v3, v1);
      v1 += 120;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<abpk::Human>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<abpk::Human>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 120;
    std::allocator<abpk::Human>::destroy[abi:ne180100](v4, i - 120);
  }
}

uint64_t _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEEEEEPS2_DpOT_(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x222222222222222) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v4) {
    unint64_t v4 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111) {
    unint64_t v6 = 0x222222222222222;
  }
  else {
    unint64_t v6 = v4;
  }
  char v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v10 = v7;
  uint64_t v11 = &v7[120 * v3];
  long long v13 = &v7[120 * v6];
  _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  char v12 = v11 + 120;
  std::vector<abpk::Human>::__swap_out_circular_buffer(a1, &v10);
  uint64_t v8 = a1[1];
  std::__split_buffer<abpk::Human>::~__split_buffer(&v10);
  return v8;
}

void sub_21B7D0A1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<abpk::Human>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)__p = *(_OWORD *)a3;
  uint64_t v4 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  abpk::Human::Human(a2, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_21B7D0A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21B7D0CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D0E08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double simd_quaternion(simd_float4x4 a1)
{
  float v1 = a1.columns[2].f32[2] + (float)(a1.columns[0].f32[0] + a1.columns[1].f32[1]);
  if (v1 >= 0.0)
  {
    a1.columns[3].f32[0] = sqrtf(v1 + 1.0);
    float32x2_t v5 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]));
    float32x2_t v6 = vmul_f32(v5, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v5));
    *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL), *(int32x2_t *)a1.columns[2].f32), (float32x2_t)vext_s8(*(int8x8_t *)a1.columns[2].f32, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), 4uLL)), vmul_f32(v6, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(a1.columns[3].f32[0] + a1.columns[3].f32[0]), v6)).f32[0]);
  }
  else if (a1.columns[0].f32[0] < a1.columns[1].f32[1] || a1.columns[0].f32[0] < a1.columns[2].f32[2])
  {
    float v3 = 1.0 - a1.columns[0].f32[0];
    if (a1.columns[1].f32[1] >= a1.columns[2].f32[2])
    {
      a1.columns[3].f32[0] = sqrtf(a1.columns[1].f32[1] + (float)(v3 - a1.columns[2].f32[2]));
      a1.columns[3].f32[0] = a1.columns[3].f32[0] + a1.columns[3].f32[0];
      float32x2_t v16 = vrecpe_f32((float32x2_t)a1.columns[3].u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v16));
      v18.i32[0] = vmul_f32(v17, vrecps_f32((float32x2_t)a1.columns[3].u32[0], v17)).u32[0];
      v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)a1.columns[0].f32, 1), *(float32x2_t *)a1.columns[1].f32).u32[0];
      v17.i32[1] = a1.columns[3].i32[0];
      v18.i32[1] = 0.25;
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v17, v18);
    }
    else
    {
      float32x2_t v4 = (float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[2].f32[2] + (float)(v3 - a1.columns[1].f32[1]))));
      *(float32x2_t *)a1.columns[2].f32 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[0], (int8x16_t)a1.columns[0], 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)a1.columns[1], (int8x16_t)a1.columns[1], 8uLL)), *(float32x2_t *)a1.columns[2].f32);
      *(int32x2_t *)a1.columns[1].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
      a1.columns[1].i32[0] = 2.0;
      a1.columns[1].i32[0] = vmul_f32(v4, *(float32x2_t *)a1.columns[1].f32).u32[0];
      *(float32x2_t *)a1.columns[3].f32 = vrecpe_f32((float32x2_t)a1.columns[1].u32[0]);
      *(float32x2_t *)a1.columns[3].f32 = vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32));
      *(float32x2_t *)a1.columns[3].f32 = vmul_n_f32(*(float32x2_t *)a1.columns[2].f32, vmul_f32(*(float32x2_t *)a1.columns[3].f32, vrecps_f32((float32x2_t)a1.columns[1].u32[0], *(float32x2_t *)a1.columns[3].f32)).f32[0]);
      __asm { FMOV            V2.2S, #0.25 }
    }
  }
  else
  {
    *(int32x2_t *)a1.columns[3].f32 = vdup_lane_s32(*(int32x2_t *)a1.columns[1].f32, 0);
    float32x2_t v7 = vadd_f32(*(float32x2_t *)a1.columns[0].f32, *(float32x2_t *)a1.columns[3].f32);
    a1.columns[3].i32[0] = 2.0;
    v8.i32[0] = vmul_f32((float32x2_t)__PAIR64__(a1.columns[0].u32[1], COERCE_UNSIGNED_INT(sqrtf(a1.columns[0].f32[0]+ (float)((float)(1.0 - a1.columns[1].f32[1]) - a1.columns[2].f32[2])))), *(float32x2_t *)a1.columns[3].f32).u32[0];
    v8.i32[1] = v7.i32[1];
    float32x2_t v9 = vrecpe_f32((float32x2_t)v8.u32[0]);
    float32x2_t v10 = vmul_f32(v9, vrecps_f32((float32x2_t)v8.u32[0], v9));
    unsigned __int32 v11 = vmul_f32(v10, vrecps_f32((float32x2_t)v8.u32[0], v10)).u32[0];
    __asm { FMOV            V5.2S, #0.25 }
    _D5.i32[1] = v11;
    *(float32x2_t *)a1.columns[3].f32 = vmul_f32(v8, _D5);
  }
  return *(double *)a1.columns[3].i64;
}

void sub_21B7D1188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D138C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_21B7D1444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D158C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D1790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double simd_matrix4x4(float32x4_t a1)
{
  _S3 = a1.i32[1];
  _S5 = a1.i32[2];
  __asm { FMLS            S1, S5, V0.S[2] }
  _S7 = a1.i32[3];
  __asm { FMLA            S1, S7, V0.S[3] }
  float v10 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], a1, 3), a1.f32[1], a1.f32[0]);
  LODWORD(v11) = _S1;
  *((float *)&v11 + 1) = v10 + v10;
  __asm
  {
    FMLA            S6, S3, V0.S[1]
    FMLA            S6, S7, V0.S[3]
    FMLS            S6, S0, V0.S[0]
    FMLA            S18, S5, V0.S[1]
    FMLA            S17, S0, V0.S[2]
    FMLA            S16, S5, V0.S[1]
    FMLA            S7, S5, V0.S[2]
    FMLS            S7, S0, V0.S[0]
    FMLS            S7, S3, V0.S[1]
  }
  return v11;
}

void sub_21B7D1A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D1E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D2290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<ABPKTransform>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<ABPKTransform>::__vallocate[abi:ne180100](a1, a2);
    float32x2_t v4 = (char *)a1[1];
    bzero(v4, 32 * a2);
    a1[1] = &v4[32 * a2];
  }
  return a1;
}

void sub_21B7D23F4(_Unwind_Exception *exception_object)
{
  float v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ABPKTransform>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKTransform>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKTransform>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

void *std::vector<simd_float4x4>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<simd_float4x4>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, a2 << 6);
    a1[1] = &v4[64 * a2];
  }
  return a1;
}

void sub_21B7D24E8(_Unwind_Exception *exception_object)
{
  float v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<simd_float4x4>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<simd_float4x4>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<simd_float4x4>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

void sub_21B7D2A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D352C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void **a29)
{
  a29 = (void **)(v31 - 160);
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&a29);
  *(void *)(v31 - 160) = &a25;
  std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 160));

  _Unwind_Resume(a1);
}

void sub_21B7D36FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D3800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D38D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D3990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D3A34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D3B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D3CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    float32x2_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 56;
        std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      float32x2_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  float v3 = *(void **)(a2 + 24);
  if (v3)
  {
    *(void *)(a2 + 32) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v4;
    operator delete(v4);
  }
}

void abpk::getJointPositionsAndMaximas(uint64_t a1, uint64_t a2, void *a3, void *a4, char a5, unsigned int a6, uint64_t a7, void *a8)
{
  uint64_t v8 = *a3 - 1;
  uint64_t v83 = v8;
  if (a5)
  {
    if (*a3 == 1) {
      return;
    }
    uint64_t v9 = 0;
    int v10 = 0;
    uint64_t v88 = a3[1];
    uint64_t v85 = a4[1];
    unint64_t v86 = a3[2];
    if (v86 <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = a3[2];
    }
    do
    {
      uint64_t v82 = v9;
      if (v88)
      {
        uint64_t v12 = 0;
        uint64_t v13 = *a4 * v9;
        uint64_t v14 = a2 + 2 * v13;
        uint64_t v15 = a1 + 2 * v13;
        float32x2_t v16 = (void **)(a7 + 24 * v9);
        float32x2_t v17 = (char **)(v16 + 1);
        float32x2_t v18 = v16 + 2;
        unint64_t v19 = v86;
        uint64_t v89 = v16;
        do
        {
          if (v19)
          {
            uint64_t v20 = 0;
            uint64_t v21 = v12 * v85;
            do
            {
              short float v22 = *(short float *)(v15 + 2 * (v20 + v21));
              if (v22 > COERCE_SHORT_FLOAT(11878) && v22 == *(short float *)(v14 + 2 * (v20 + v21)))
              {
                long long v24 = *v17;
                if ((unint64_t)*v17 >= *v18)
                {
                  uint64_t v26 = (char *)*v16;
                  uint64_t v27 = (v24 - (unsigned char *)*v16) >> 4;
                  unint64_t v28 = v27 + 1;
                  if ((unint64_t)(v27 + 1) >> 60) {
                    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                  }
                  uint64_t v29 = *v18 - (void)v26;
                  if (v29 >> 3 > v28) {
                    unint64_t v28 = v29 >> 3;
                  }
                  if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v30 = v28;
                  }
                  if (v30)
                  {
                    uint64_t v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v18, v30);
                    float32x2_t v16 = v89;
                    uint64_t v32 = v31;
                    long long v24 = *v17;
                    uint64_t v26 = (char *)*v89;
                  }
                  else
                  {
                    uint64_t v32 = 0;
                  }
                  double v33 = &v32[16 * v27];
                  *(_DWORD *)double v33 = v20;
                  *((_DWORD *)v33 + 1) = v12;
                  *((short float *)v33 + 4) = v22;
                  *((_DWORD *)v33 + 3) = v10;
                  uint64_t v34 = v33;
                  if (v24 != v26)
                  {
                    do
                    {
                      *((_OWORD *)v34 - 1) = *((_OWORD *)v24 - 1);
                      v34 -= 16;
                      v24 -= 16;
                    }
                    while (v24 != v26);
                    uint64_t v26 = (char *)*v16;
                  }
                  char *v16 = v34;
                  long long v25 = v33 + 16;
                  *float32x2_t v17 = v33 + 16;
                  void *v18 = &v32[16 * v30];
                  if (v26)
                  {
                    operator delete(v26);
                    float32x2_t v16 = v89;
                  }
                }
                else
                {
                  *(_DWORD *)long long v24 = v20;
                  *((_DWORD *)v24 + 1) = v12;
                  *((short float *)v24 + 4) = v22;
                  long long v25 = v24 + 16;
                  *((_DWORD *)v24 + 3) = v10;
                }
                ++v10;
                *float32x2_t v17 = v25;
              }
              ++v20;
            }
            while (v20 != v11);
            unint64_t v19 = v86;
          }
          ++v12;
        }
        while (v12 != v88);
      }
      uint64_t v8 = v83;
      uint64_t v9 = v82 + 1;
    }
    while (v82 + 1 != v83);
  }
  else
  {
    if (!a6)
    {
      int v10 = 0;
      if (*a3 == 1) {
        return;
      }
      goto LABEL_58;
    }
    uint64_t v35 = 0;
    uint64_t v36 = a6;
    do
    {
      uint64_t v37 = a1 + 8 * v35;
      int v38 = (int)*(short float *)v37;
      int v39 = (int)*(short float *)(v37 + 2);
      __int16 v40 = *(_WORD *)(v37 + 6);
      float v41 = (char **)(a7 + 24 * (int)*(short float *)(v37 + 4));
      uint64_t v43 = (void **)(v41 + 1);
      unint64_t v42 = (unint64_t)v41[1];
      uint64_t v45 = v41 + 2;
      unint64_t v44 = (unint64_t)v41[2];
      if (v42 >= v44)
      {
        uint64_t v47 = (uint64_t)(v42 - (void)*v41) >> 4;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 60) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v49 = v44 - (void)*v41;
        if (v49 >> 3 > v48) {
          unint64_t v48 = v49 >> 3;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v50 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50) {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v45, v50);
        }
        else {
          v51 = 0;
        }
        unint64_t v52 = &v51[16 * v47];
        *(_DWORD *)unint64_t v52 = v38;
        *((_DWORD *)v52 + 1) = v39;
        *((_WORD *)v52 + 4) = v40;
        *((_DWORD *)v52 + 3) = 0;
        uint64_t v53 = (char *)*v43;
        unsigned int v54 = *v41;
        float v55 = v52;
        if (*v43 != *v41)
        {
          do
          {
            *((_OWORD *)v55 - 1) = *((_OWORD *)v53 - 1);
            v55 -= 16;
            v53 -= 16;
          }
          while (v53 != v54);
          uint64_t v53 = *v41;
        }
        *float v41 = v55;
        unint64_t v46 = v52 + 16;
        *uint64_t v43 = v52 + 16;
        void *v45 = &v51[16 * v50];
        if (v53) {
          operator delete(v53);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v42 = v38;
        *(_DWORD *)(v42 + 4) = v39;
        *(_WORD *)(v42 + 8) = v40;
        unint64_t v46 = (void *)(v42 + 16);
        *(_DWORD *)(v42 + 12) = 0;
      }
      *uint64_t v43 = v46;
      ++v35;
    }
    while (v35 != v36);
    int v10 = 0;
    uint64_t v8 = v83;
  }
  if (!v8) {
    return;
  }
LABEL_58:
  float v56 = (_OWORD **)(a7 + 8);
  uint64_t v57 = v8;
  do
  {
    v58 = *(v56 - 1);
    v59 = *v56;
    unint64_t v90 = (uint64_t (*)(void))abpk::isDuplicate;
    v60 = std::__unique[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<abpk::peak *>,std::__wrap_iter<abpk::peak *>,BOOL (*&)(abpk::peak const&,abpk::peak const&)>(v58, v59, &v90);
    if (*v56 != v60) {
      *float v56 = v60;
    }
    v56 += 3;
    --v57;
  }
  while (v57);
  int v61 = v10;
  uint64_t v62 = 0;
  v63 = a8 + 2;
  do
  {
    v64 = (uint64_t *)(a7 + 24 * v62);
    uint64_t v65 = *v64;
    if ((int)((unint64_t)(v64[1] - *v64) >> 4) >= 1)
    {
      uint64_t v66 = 0;
      v67 = (void **)a8;
      v68 = (char *)a8[1];
      do
      {
        uint64_t v69 = v65 + 16 * v66;
        *(_DWORD *)(v69 + 12) = v61;
        if ((unint64_t)v68 >= *v63)
        {
          uint64_t v70 = (v68 - (unsigned char *)*v67) >> 4;
          if ((unint64_t)(v70 + 1) >> 60) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v71 = *v63 - (void)*v67;
          uint64_t v72 = v71 >> 3;
          if (v71 >> 3 <= (unint64_t)(v70 + 1)) {
            uint64_t v72 = v70 + 1;
          }
          if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v73 = v72;
          }
          if (v73)
          {
            v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)v63, v73);
            v67 = (void **)a8;
          }
          else
          {
            v74 = 0;
          }
          v75 = &v74[16 * v70];
          *(_OWORD *)v75 = *(_OWORD *)v69;
          v77 = (char *)*v67;
          v76 = (char *)v67[1];
          v78 = v75;
          if (v76 != *v67)
          {
            do
            {
              *((_OWORD *)v78 - 1) = *((_OWORD *)v76 - 1);
              v78 -= 16;
              v76 -= 16;
            }
            while (v76 != v77);
            v76 = (char *)*v67;
          }
          v68 = v75 + 16;
          float32x2_t *v67 = v78;
          v67[1] = v75 + 16;
          v67[2] = &v74[16 * v73];
          if (v76)
          {
            operator delete(v76);
            v67 = (void **)a8;
          }
        }
        else
        {
          *(_OWORD *)v68 = *(_OWORD *)v69;
          v68 += 16;
        }
        ++v61;
        v67[1] = v68;
        ++v66;
        uint64_t v65 = *v64;
      }
      while (v66 < (int)((unint64_t)(v64[1] - *v64) >> 4));
    }
    ++v62;
  }
  while (v62 != v83);
}

void abpk::extractHumans(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, void *a6@<X5>, char a7@<W6>, unsigned int a8@<W7>, uint64_t *a9@<X8>)
{
  uint64_t v221 = *MEMORY[0x263EF8340];
  uint64_t v216 = 0;
  memset(v215, 0, sizeof(v215));
  v213 = 0;
  v214[0] = 0;
  v214[1] = 0;
  abpk::getJointPositionsAndMaximas(a1, a2, a4, a6, a7, a8, (uint64_t)v215, &v213);
  uint64_t v12 = 0;
  uint64_t v196 = *a4;
  uint64_t v13 = *a4 - 1;
  memset(v220, 0, sizeof(v220));
  double v14 = 1.0e-12;
  do
  {
    uint64_t v197 = v12;
    uint64_t v15 = &abpk::bones[2 * v12];
    int v16 = *v15;
    int v17 = v15[1];
    __b = 0;
    v211 = 0;
    unint64_t v212 = 0;
    float32x2_t v18 = (uint64_t *)v215 + 3 * v16;
    uint64_t v19 = v18[1];
    v198 = v18 + 1;
    v199 = v18;
    uint64_t v20 = *v18;
    if (v19 != v20)
    {
      uint64_t v21 = (uint64_t *)v215 + 3 * v17;
      double v23 = v21 + 1;
      uint64_t v22 = v21[1];
      v205 = v21;
      uint64_t v24 = *v21;
      if (v22 != *v21)
      {
        if ((int)((unint64_t)(v19 - v20) >> 4) < 1)
        {
          v78 = 0;
          v77 = 0;
        }
        else
        {
          uint64_t v200 = 0;
          v201 = v21 + 1;
          v202 = (int *)((char *)&abpk::s_bonesmap + 8 * v197);
          do
          {
            if ((int)((unint64_t)(v22 - v24) >> 4) >= 1)
            {
              uint64_t v25 = 0;
              uint64_t v26 = v20 + 16 * v200;
              uint64_t v27 = (int *)(v26 + 4);
              do
              {
                unint64_t v28 = (_DWORD *)(v24 + 16 * v25);
                float v29 = (float)(*v28 - *(_DWORD *)v26);
                float v30 = (float)(v28[1] - *v27);
                float v31 = sqrtf((float)(v30 * v30) + (float)(v29 * v29));
                double v32 = v31;
                if (v31 >= v14)
                {
                  double v33 = v14;
                  uint64_t v34 = 0;
                  int v35 = 0;
                  float v204 = (float)*(unint64_t *)(a5 + 8);
                  uint64_t v36 = v202[1];
                  uint64_t v37 = *v202;
                  float v38 = v29 / v31;
                  float v39 = v30 / v31;
                  __p = 0;
                  v217 = 0;
                  unint64_t v219 = 0;
                  float v40 = v29 / 10.0;
                  float v41 = v30 / 10.0;
                  do
                  {
                    *(double *)&float16x4_t v42 = (float)((float)*v27 + (float)((float)v35 * v41)) + 0.5;
                    uint64_t v43 = a6[1] * (int)*(void *)&v42
                        + (int)((float)((float)*(int *)v26 + (float)((float)v35 * v40)) + 0.5);
                    v42.i16[0] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v37));
                    v42.i16[1] = *(_WORD *)(a3 + 2 * (v43 + *a6 * v36));
                    unint64_t v44 = vcvtq_f32_f16(v42).u64[0];
                    if ((unint64_t)v34 >= v219)
                    {
                      unint64_t __len = v44;
                      uint64_t v45 = ((char *)v34 - (unsigned char *)v217) >> 3;
                      if ((unint64_t)(v45 + 1) >> 61) {
                        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                      }
                      unint64_t v46 = (uint64_t)(v219 - (void)v217) >> 2;
                      if (v46 <= v45 + 1) {
                        unint64_t v46 = v45 + 1;
                      }
                      if (v219 - (unint64_t)v217 >= 0x7FFFFFFFFFFFFFF8) {
                        unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v47 = v46;
                      }
                      if (v47) {
                        unint64_t v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v219, v47);
                      }
                      else {
                        unint64_t v48 = 0;
                      }
                      uint64_t v49 = (unint64_t *)&v48[8 * v45];
                      *uint64_t v49 = __len;
                      uint64_t v34 = v49 + 1;
                      unint64_t v50 = (char *)__p;
                      v51 = (char *)v217;
                      if (__p != v217)
                      {
                        do
                        {
                          unint64_t v52 = *((void *)v50 - 1);
                          v50 -= 8;
                          *--uint64_t v49 = v52;
                        }
                        while (v50 != v51);
                        unint64_t v50 = (char *)v217;
                      }
                      v217 = v49;
                      __p = v34;
                      unint64_t v219 = (unint64_t)&v48[8 * v47];
                      if (v50) {
                        operator delete(v50);
                      }
                    }
                    else
                    {
                      *v34++ = v44;
                    }
                    __p = v34;
                    ++v35;
                  }
                  while (v35 != 10);
                  uint64_t v53 = 0;
                  unsigned int v54 = 0;
                  float v55 = 0.0;
                  do
                  {
                    float v56 = vmlas_n_f32(vmuls_lane_f32(v39, *(float32x2_t *)((char *)v217 + v53), 1), v38, COERCE_FLOAT(*(void *)((char *)v217 + v53)));
                    float v55 = v55 + v56;
                    if (v56 > 0.05) {
                      ++v54;
                    }
                    v53 += 8;
                  }
                  while (v53 != 80);
                  __p = v217;
                  operator delete(v217);
                  uint64_t v13 = v196 - 1;
                  double v14 = v33;
                  double v23 = v201;
                  if (v54 >= 7)
                  {
                    float v57 = fmin(v204 * 0.5 / v32 + -1.0, 0.0) + v55 / 10.0;
                    if (v57 > 0.0)
                    {
                      _H0 = *(_WORD *)(v26 + 8);
                      __asm { FCVT            S0, H0 }
                      _H1 = *(_WORD *)(v24 + 16 * v25 + 8);
                      __asm { FCVT            S1, H1 }
                      float v66 = (float)(v57 + _S0) + _S1;
                      v67 = v211;
                      if ((unint64_t)v211 >= v212)
                      {
                        uint64_t v69 = (float32x2_t *)__b;
                        uint64_t v70 = ((char *)v211 - (unsigned char *)__b) >> 4;
                        unint64_t v71 = v70 + 1;
                        if ((unint64_t)(v70 + 1) >> 60) {
                          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                        }
                        uint64_t v72 = v212 - (void)__b;
                        if ((uint64_t)(v212 - (void)__b) >> 3 > v71) {
                          unint64_t v71 = v72 >> 3;
                        }
                        if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0) {
                          unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
                        }
                        else {
                          unint64_t v73 = v71;
                        }
                        if (v73)
                        {
                          v74 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)&v212, v73);
                          uint64_t v69 = (float32x2_t *)__b;
                          v67 = v211;
                        }
                        else
                        {
                          v74 = 0;
                        }
                        v75 = &v74[16 * v70];
                        *(_DWORD *)v75 = v200;
                        *((_DWORD *)v75 + 1) = v25;
                        *((float *)v75 + 2) = v57;
                        *((float *)v75 + 3) = v66;
                        v76 = v75;
                        if (v67 != v69)
                        {
                          do
                          {
                            *((_OWORD *)v76 - 1) = *(_OWORD *)v67[-2].f32;
                            v76 -= 16;
                            v67 -= 2;
                          }
                          while (v67 != v69);
                          uint64_t v69 = (float32x2_t *)__b;
                        }
                        v68 = (float32x2_t *)(v75 + 16);
                        __b = v76;
                        v211 = (float32x2_t *)(v75 + 16);
                        unint64_t v212 = (unint64_t)&v74[16 * v73];
                        if (v69) {
                          operator delete(v69);
                        }
                      }
                      else
                      {
                        v211->i32[0] = v200;
                        v67->i32[1] = v25;
                        v68 = v67 + 2;
                        v67[1].f32[0] = v57;
                        v67[1].f32[1] = v66;
                      }
                      v211 = v68;
                    }
                  }
                }
                ++v25;
                uint64_t v22 = *v23;
                uint64_t v24 = *v205;
              }
              while (v25 < (int)((unint64_t)(*v23 - *v205) >> 4));
              uint64_t v19 = *v198;
              uint64_t v20 = *v199;
            }
            ++v200;
          }
          while (v200 < (int)((unint64_t)(v19 - v20) >> 4));
          v77 = (char *)__b;
          v78 = (char *)v211;
        }
        unint64_t v79 = 126 - 2 * __clz((v78 - v77) >> 4);
        v217 = abpk::compareCandidate;
        if (v78 == v77) {
          uint64_t v80 = 0;
        }
        else {
          uint64_t v80 = v79;
        }
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(abpk::Candidate,abpk::Candidate),abpk::Candidate*,false>(v77, v78, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v217, v80, 1);
        v81 = (char *)__b;
        uint64_t v82 = (char *)v211;
        if ((int)((unint64_t)((char *)v211 - (unsigned char *)__b) >> 4) >= 1)
        {
          uint64_t v83 = 0;
          v84 = (char *)v220 + 24 * v197;
          uint64_t v85 = (_DWORD *)*((void *)v84 + 1);
          __lena = (_DWORD **)(v84 + 8);
          unint64_t v86 = v84 + 16;
          do
          {
            v87 = &v81[16 * v83];
            uint64_t v88 = *(_DWORD **)v84;
            uint64_t v89 = ((uint64_t)v85 - *(void *)v84) >> 2;
            unint64_t v90 = 0xCCCCCCCCCCCCCCCDLL * v89;
            int v93 = *(_DWORD *)v87;
            v91 = (int *)(v87 + 4);
            int v92 = v93;
            if (-858993459 * (int)v89 <= 0)
            {
              int v96 = *v91;
LABEL_68:
              int v97 = *(_DWORD *)&v81[16 * v83 + 8];
              int v98 = *(_DWORD *)(*v199 + 16 * v92 + 12);
              int v99 = *(_DWORD *)(*v205 + 16 * v96 + 12);
              if ((unint64_t)v85 >= *v86)
              {
                unint64_t v100 = v90 + 1;
                if (v90 + 1 > 0xCCCCCCCCCCCCCCCLL) {
                  std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
                }
                if (0x999999999999999ALL * ((uint64_t)(*v86 - (void)v88) >> 2) > v100) {
                  unint64_t v100 = 0x999999999999999ALL * ((uint64_t)(*v86 - (void)v88) >> 2);
                }
                if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*v86 - (void)v88) >> 2) >= 0x666666666666666) {
                  unint64_t v101 = 0xCCCCCCCCCCCCCCCLL;
                }
                else {
                  unint64_t v101 = v100;
                }
                if (v101)
                {
                  v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Connection>>((uint64_t)v86, v101);
                  uint64_t v85 = *__lena;
                  uint64_t v88 = *(_DWORD **)v84;
                  unint64_t v86 = v84 + 16;
                }
                else
                {
                  v102 = 0;
                }
                v103 = &v102[20 * v90];
                *(_DWORD *)v103 = v98;
                *((_DWORD *)v103 + 1) = v99;
                *((_DWORD *)v103 + 2) = v97;
                *((_DWORD *)v103 + 3) = v92;
                *((_DWORD *)v103 + 4) = v96;
                v104 = v103;
                if (v85 == v88)
                {
                  uint64_t v13 = v196 - 1;
                }
                else
                {
                  uint64_t v13 = v196 - 1;
                  do
                  {
                    long long v105 = *(_OWORD *)(v85 - 5);
                    *((_DWORD *)v104 - 1) = *(v85 - 1);
                    *(_OWORD *)(v104 - 20) = v105;
                    v104 -= 20;
                    v85 -= 5;
                  }
                  while (v85 != v88);
                  uint64_t v88 = *(_DWORD **)v84;
                }
                *(void *)v84 = v104;
                uint64_t v85 = v103 + 20;
                *__lena = v103 + 20;
                *unint64_t v86 = &v102[20 * v101];
                if (v88)
                {
                  operator delete(v88);
                  unint64_t v86 = v84 + 16;
                }
              }
              else
              {
                *uint64_t v85 = v98;
                v85[1] = v99;
                v85[2] = v97;
                v85[3] = v92;
                v85[4] = v96;
                v85 += 5;
                uint64_t v13 = v196 - 1;
              }
              *__lena = v85;
              v81 = (char *)__b;
              uint64_t v82 = (char *)v211;
            }
            else
            {
              uint64_t v94 = (-858993459 * v89);
              v95 = v88 + 4;
              while (*(v95 - 1) != v92)
              {
                int v96 = *v91;
                if (*v95 == *v91) {
                  break;
                }
                v95 += 5;
                if (!--v94) {
                  goto LABEL_68;
                }
              }
              uint64_t v13 = v196 - 1;
            }
            ++v83;
          }
          while (v83 < (int)((unint64_t)(v82 - v81) >> 4));
        }
        if (v81)
        {
          v211 = (float32x2_t *)v81;
          operator delete(v81);
        }
      }
    }
    uint64_t v12 = v197 + 1;
  }
  while (v197 != 17);
  uint64_t v106 = 0;
  uint64_t v107 = v196;
  __p = 0;
  v217 = 0;
  unint64_t v219 = 0;
  do
  {
    uint64_t v206 = v106;
    v108 = (uint64_t *)v220 + 3 * v106;
    uint64_t v109 = *v108;
    if ((int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)) >= 1)
    {
      uint64_t v110 = 0;
      v111 = &abpk::bones[2 * v106];
      uint64_t v112 = *v111;
      uint64_t v113 = v111[1];
      do
      {
        v114 = (__n128 *)__p;
        v115 = (char *)v217;
        if ((int)(-1431655765 * (((unsigned char *)__p - (unsigned char *)v217) >> 3)) < 1) {
          goto LABEL_115;
        }
        uint64_t v116 = 0;
        int v117 = 0;
        int v118 = 0;
        int v119 = 0;
        v120 = (int *)(v109 + 20 * v110);
        int v122 = *v120;
        v121 = v120 + 1;
        float v123 = (float)v122;
        v124 = v217;
        do
        {
          if (*(float *)(*v124 + 4 * v112) == v123 || *(float *)(*v124 + 4 * v113) == (float)*v121)
          {
            if (!v119) {
              int v118 = v116;
            }
            if (v119 == 1) {
              int v117 = v116;
            }
            ++v119;
          }
          ++v116;
          v124 += 3;
        }
        while (-1431655765 * (((unsigned char *)__p - (unsigned char *)v217) >> 3) != v116);
        switch(v119)
        {
          case 0:
LABEL_115:
            std::vector<float>::vector(&__b, v196 + 1);
            v134 = (float *)__b;
            if (v196 != -1) {
              memset_pattern16(__b, &unk_21B813710, 4 * v196 + 4);
            }
            v135 = (float *)(*v108 + 20 * v110);
            uint64_t v136 = *(int *)v135;
            v134[v112] = (float)(int)v136;
            uint64_t v137 = *((int *)v135 + 1);
            v134[v113] = (float)(int)v137;
            v134[v107] = 2.0;
            _H0 = *((short float *)v213 + 8 * v136 + 4) + *((short float *)v213 + 8 * v137 + 4);
            __asm { FCVT            S0, H0 }
            v134[v196 - 1] = v135[2] + _S0;
            v140 = __p;
            if ((unint64_t)__p >= v219)
            {
              v141 = (void *)std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v217, (uint64_t)&__b);
            }
            else
            {
              *(void *)__p = 0;
              v140[1] = 0;
              v140[2] = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v140, __b, (uint64_t)v211, ((char *)v211 - (unsigned char *)__b) >> 2);
              v141 = v140 + 3;
            }
            __p = v141;
            uint64_t v13 = v196 - 1;
            if (__b)
            {
              v211 = (float32x2_t *)__b;
              operator delete(__b);
            }
            break;
          case 1:
            uint64_t v142 = *((void *)v217 + 3 * v118);
            uint64_t v143 = *v121;
            if (*(float *)(v142 + 4 * v113) != (float)(int)v143)
            {
              *(float *)(v142 + 4 * v113) = (float)(int)v143;
              *(float *)(v142 + 4 * v107) = *(float *)(v142 + 4 * v107) + 1.0;
              _H0 = *((_WORD *)v213 + 8 * v143 + 4);
              __asm { FCVT            S0, H0 }
              *(float *)(v142 + 4 * v13) = *(float *)(v142 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            }
            break;
          case 2:
            if (!v13)
            {
              int v128 = v117;
              uint64_t v146 = *((void *)v217 + 3 * v117);
              uint64_t v147 = *((void *)v217 + 3 * v118);
LABEL_127:
              *(float *)(v147 + 4 * v107) = *(float *)(v146 + 4 * v107) + *(float *)(v147 + 4 * v107);
              float v149 = *(float *)(v146 + 4 * v13) + *(float *)(v147 + 4 * v13);
              *(float *)(v147 + 4 * v13) = v149;
              *(float *)(v147 + 4 * v13) = v149 + *(float *)(v109 + 20 * v110 + 8);
              std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)&v115[24 * v128 + 24], v114, (uint64_t)&v115[24 * v128]);
              v151 = v150;
              v152 = __p;
              if (__p != v150)
              {
                v153 = (char *)__p;
                do
                {
                  v155 = (void *)*((void *)v153 - 3);
                  v153 -= 24;
                  v154 = v155;
                  if (v155)
                  {
                    *(v152 - 2) = v154;
                    operator delete(v154);
                  }
                  v152 = v153;
                }
                while (v153 != v151);
              }
              __p = v151;
              uint64_t v107 = v196;
              uint64_t v13 = v196 - 1;
              break;
            }
            uint64_t v125 = 0;
            int v126 = 0;
            v127 = (uint64_t *)((char *)v217 + 24 * v118);
            int v128 = v117;
            v129 = (uint64_t *)((char *)v217 + 24 * v117);
            do
            {
              if (*(float *)(*v127 + 4 * v125) > 0.0 && *(float *)(*v129 + 4 * v125) > 0.0) {
                int v126 = 2;
              }
              ++v125;
            }
            while (v13 != v125);
            if (!v126)
            {
              uint64_t v148 = 0;
              uint64_t v146 = *v129;
              uint64_t v147 = *v127;
              do
              {
                *(float *)(v147 + 4 * v148) = (float)(*(float *)(v146 + 4 * v148) + 1.0) + *(float *)(v147 + 4 * v148);
                ++v148;
              }
              while (v13 != v148);
              goto LABEL_127;
            }
            uint64_t v130 = *v121;
            uint64_t v131 = *v127;
            *(float *)(*v127 + 4 * v113) = (float)(int)v130;
            *(float *)(v131 + 4 * v107) = *(float *)(v131 + 4 * v107) + 1.0;
            _H0 = *((_WORD *)v213 + 8 * v130 + 4);
            __asm { FCVT            S0, H0 }
            *(float *)(v131 + 4 * v13) = *(float *)(v131 + 4 * v13) + (float)(*(float *)(v109 + 20 * v110 + 8) + _S0);
            break;
        }
        ++v110;
        uint64_t v109 = *v108;
      }
      while (v110 < (int)(-858993459 * ((unint64_t)(v108[1] - *v108) >> 2)));
    }
    uint64_t v106 = v206 + 1;
  }
  while (v206 != 17);
  v156 = (__n128 *)__p;
  int64_t v157 = ((unsigned char *)__p - (unsigned char *)v217) >> 3;
  unint64_t v158 = 0xAAAAAAAAAAAAAAABLL * v157;
  if (-1431655765 * (int)v157 >= 1)
  {
    uint64_t v159 = (-1431655765 * v157);
    do
    {
      v160 = (char *)v217 + 24 * (v159 - 1);
      float v161 = *(float *)(*(void *)v160 + 4 * v107);
      if (v161 < 8.0 || (float)(*(float *)(*(void *)v160 + 4 * v13) / v161) < 0.3)
      {
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<float> *,std::vector<float> *,std::vector<float> *,0>((__n128 *)(v160 + 24), v156, (uint64_t)v160);
        v156 = v162;
        n128_u64 = __p;
        if (__p != v162)
        {
          v164 = (__n128 *)__p;
          do
          {
            v166 = (void *)v164[-2].n128_u64[1];
            v164 = (__n128 *)((char *)v164 - 24);
            v165 = v166;
            if (v166)
            {
              *(n128_u64 - 2) = v165;
              operator delete(v165);
            }
            n128_u64 = v164->n128_u64;
          }
          while (v164 != v156);
        }
        __p = v156;
      }
    }
    while (v159-- > 1);
    unint64_t v158 = 0xAAAAAAAAAAAAAAABLL * (((char *)v156 - (unsigned char *)v217) >> 3);
  }
  *a9 = 0;
  a9[1] = 0;
  a9[2] = 0;
  std::vector<abpk::Human>::reserve(a9, v158);
  if (__p != v217)
  {
    unint64_t v168 = 0;
    __asm { FMOV            V8.2S, #-1.0 }
    do
    {
      uint64x2_t __lenb = *(uint64x2_t *)(a5 + 8);
      v211 = 0;
      unint64_t v212 = 0;
      __b = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__b, 0x13uLL);
      uint64_t v170 = 0;
      float32x2_t v171 = (float32x2_t)vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(__lenb)));
      do
      {
        if (((int)*(float *)(*((void *)v217 + 3 * v168) + 4 * v170) & 0x80000000) == 0)
        {
          float32x2_t v172 = vdiv_f32(vcvt_f32_s32(*(int32x2_t *)((char *)v213+ 16* (int)*(float *)(*((void *)v217 + 3 * v168) + 4 * v170))), v171);
          v173 = v211;
          if ((unint64_t)v211 < v212)
          {
            float32x2_t *v211 = v172;
            v174 = v173 + 1;
            goto LABEL_182;
          }
          uint64_t v176 = ((char *)v211 - (unsigned char *)__b) >> 3;
          if ((unint64_t)(v176 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v177 = (uint64_t)(v212 - (void)__b) >> 2;
          if (v177 <= v176 + 1) {
            unint64_t v177 = v176 + 1;
          }
          if (v212 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v178 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v178 = v177;
          }
          if (v178) {
            v179 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v212, v178);
          }
          else {
            v179 = 0;
          }
          v182 = (float32x2_t *)&v179[8 * v176];
          float32x2_t *v182 = v172;
          v174 = v182 + 1;
          v184 = __b;
          v183 = v211;
          if (v211 == __b) {
            goto LABEL_180;
          }
          do
          {
            float32x2_t v185 = *(float32x2_t *)(v183 - 2);
            v183 -= 2;
            v182[-1] = v185;
            --v182;
          }
          while (v183 != v184);
          goto LABEL_179;
        }
        v175 = v211;
        if ((unint64_t)v211 < v212)
        {
          float32x2_t *v211 = _D8;
          v174 = v175 + 1;
          goto LABEL_182;
        }
        uint64_t v180 = ((char *)v211 - (unsigned char *)__b) >> 3;
        if ((unint64_t)(v180 + 1) >> 61) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v181 = (uint64_t)(v212 - (void)__b) >> 2;
        if (v181 <= v180 + 1) {
          unint64_t v181 = v180 + 1;
        }
        if (v212 - (unint64_t)__b >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v178 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v178 = v181;
        }
        if (v178) {
          v179 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v212, v178);
        }
        else {
          v179 = 0;
        }
        v182 = (float32x2_t *)&v179[8 * v180];
        float32x2_t *v182 = _D8;
        v174 = v182 + 1;
        v186 = __b;
        v183 = v211;
        if (v211 != __b)
        {
          do
          {
            float32x2_t v187 = *(float32x2_t *)(v183 - 2);
            v183 -= 2;
            v182[-1] = v187;
            --v182;
          }
          while (v183 != v186);
LABEL_179:
          v183 = __b;
        }
LABEL_180:
        __b = v182;
        v211 = v174;
        unint64_t v212 = (unint64_t)&v179[8 * v178];
        if (v183) {
          operator delete(v183);
        }
LABEL_182:
        v211 = v174;
        ++v170;
      }
      while (v170 != 19);
      unint64_t v188 = a9[1];
      if (v188 >= a9[2])
      {
        uint64_t v189 = _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEEEEEPS2_DpOT_(a9, (uint64_t)&__b);
        v190 = a9;
      }
      else
      {
        _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEEEEEvPT_DpOT0_((uint64_t)(a9 + 2), a9[1], (uint64_t)&__b);
        uint64_t v189 = v188 + 120;
        v190 = a9;
        a9[1] = v188 + 120;
      }
      v190[1] = v189;
      if (__b)
      {
        v211 = (float32x2_t *)__b;
        operator delete(__b);
      }
      ++v168;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)__p - (unsigned char *)v217) >> 3) > v168);
  }
  __b = &v217;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__b);
  uint64_t v191 = 432;
  do
  {
    v192 = *(void **)((char *)&v217 + v191);
    if (v192)
    {
      *(void **)((char *)&__p + v191) = v192;
      operator delete(v192);
    }
    v191 -= 24;
  }
  while (v191);
  if (v213)
  {
    v214[0] = v213;
    operator delete(v213);
  }
  uint64_t v193 = 57;
  do
  {
    v194 = (void *)v214[v193 - 1];
    if (v194)
    {
      v214[v193] = v194;
      operator delete(v194);
    }
    v193 -= 3;
  }
  while (v193 * 8);
}

void sub_21B7D5524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  a27 = a9;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a27 = &STACK[0x288];
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  uint64_t v32 = 432;
  while (1)
  {
    double v33 = *(void **)((char *)&STACK[0x2A0] + v32 - 24);
    if (v33)
    {
      *(unint64_t *)((char *)&STACK[0x2A0] + v32 - 16) = (unint64_t)v33;
      operator delete(v33);
    }
    v32 -= 24;
    if (!v32)
    {
      if (__p)
      {
        a31 = (uint64_t)__p;
        operator delete(__p);
      }
      uint64_t v34 = 456;
      while (1)
      {
        int v35 = *(void **)((char *)&__p + v34);
        if (v35)
        {
          *(uint64_t *)((char *)&a31 + v34) = (uint64_t)v35;
          operator delete(v35);
        }
        v34 -= 24;
        if (!v34) {
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

void sub_21B7D5BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D5C9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D6350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void std::vector<long>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    float32x2_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v3, a2);
    float32x2_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    int v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_21B7D6528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7D6610(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D675C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D6824(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D6E14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a22) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    float32x2_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, __n);
    float32x2_t v7 = (unsigned int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = (unsigned int *)&v6[4 * v8];
    std::vector<unsigned int>::pointer begin = this->__begin_;
    end = this->__end_;
    uint64_t v12 = v7;
    if (end != this->__begin_)
    {
      uint64_t v12 = v7;
      do
      {
        unsigned int v13 = *--end;
        *--uint64_t v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t *std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  float32x2_t v7 = a1 + 1;
  float32x2_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        float32x2_t v6 = *v9;
        float32x2_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      float32x2_t v6 = v9[1];
      if (!v6)
      {
        float32x2_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x40uLL);
    uint64_t v12 = **a4;
    v11[6] = 0;
    v11[7] = 0;
    v11[4] = v12;
    v11[5] = 0;
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  int64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
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
          uint64_t *v2 = v11;
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
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *int64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    std::vector<int>::pointer end = this->__end_;
    uint64_t v7 = &end[__n];
    std::vector<int>::size_type v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_21B7D7318(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

void sub_21B7D74AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<simd_float4x4>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 6;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + (a2 << 6);
    }
  }
  else
  {
    std::vector<simd_float4x4>::__append((void **)a1, a2 - v2);
  }
}

void sub_21B7D7620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D76C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D78F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  _Unwind_Resume(a1);
}

void sub_21B7D79CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D7A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7D8378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v32 = *(void **)(v30 - 160);
  if (v32)
  {
    *(void *)(v30 - 152) = v32;
    operator delete(v32);
  }

  double v33 = *(void **)(v30 - 128);
  if (v33)
  {
    *(void *)(v30 - 120) = v33;
    operator delete(v33);
  }

  _Unwind_Resume(a1);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    int v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = &v6[4 * v8];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_21B7D8A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, id a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_21B7D8DF4(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](a2);
  uint64_t v15 = *(void **)(v13 - 136);
  if (v15)
  {
    *(void *)(v13 - 128) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(a1);
}

double __Block_byref_object_copy_(void *a1, void *a2)
{
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  double result = 0.0;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  a1[10] = a2[10];
  a1[11] = a2[11];
  a2[10] = 0;
  a2[11] = 0;
  return result;
}

uint64_t __Block_byref_object_dispose_(uint64_t a1)
{
  return std::deque<std::pair<long,long>>::~deque[abi:ne180100]((void *)(a1 + 48));
}

uint64_t std::deque<std::pair<long,long>>::emplace_back<long &,int>(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[1];
  if (v6 == v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 32 * (v6 - v7) - 1;
  }
  uint64_t v9 = a1[4];
  unint64_t v10 = a1[5] + v9;
  if (v8 == v10)
  {
    std::deque<std::pair<long,long>>::__add_back_capacity(a1);
    uint64_t v7 = a1[1];
    uint64_t v9 = a1[4];
    unint64_t v10 = a1[5] + v9;
  }
  uint64_t v11 = (void *)(*(void *)(v7 + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v10);
  uint64_t v12 = *a3;
  void *v11 = *a2;
  v11[1] = v12;
  uint64_t v13 = a1[5] + 1;
  a1[5] = v13;
  unint64_t v14 = v13 + v9;
  uint64_t v15 = (void *)(v7 + 8 * (v14 >> 8));
  if ((_BYTE)v14) {
    uint64_t v16 = *v15 + 16 * v14;
  }
  else {
    uint64_t v16 = *(v15 - 1) + 4096;
  }
  return v16 - 16;
}

uint64_t std::deque<std::pair<long,long>>::emplace_back<long &,long const&>(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[1];
  if (v6 == v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 32 * (v6 - v7) - 1;
  }
  uint64_t v9 = a1[4];
  unint64_t v10 = a1[5] + v9;
  if (v8 == v10)
  {
    std::deque<std::pair<long,long>>::__add_back_capacity(a1);
    uint64_t v7 = a1[1];
    uint64_t v9 = a1[4];
    unint64_t v10 = a1[5] + v9;
  }
  uint64_t v11 = (void *)(*(void *)(v7 + ((v10 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v10);
  void *v11 = *a2;
  v11[1] = *a3;
  uint64_t v12 = a1[5] + 1;
  a1[5] = v12;
  unint64_t v13 = v12 + v9;
  unint64_t v14 = (void *)(v7 + 8 * (v13 >> 8));
  if ((_BYTE)v13) {
    uint64_t v15 = *v14 + 16 * v13;
  }
  else {
    uint64_t v15 = *(v14 - 1) + 4096;
  }
  return v15 - 16;
}

void std::vector<simd_float4x4>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 6)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), a2 << 6);
      v7 += 64 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 6);
    if (v9 >> 58) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 6;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 5 > v9) {
      unint64_t v9 = v11 >> 5;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<simd_float4x4>>(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    unint64_t v14 = &v13[64 * v10];
    uint64_t v15 = &v13[64 * v12];
    bzero(v14, a2 << 6);
    uint64_t v16 = &v14[64 * a2];
    float32x2_t v18 = (char *)*a1;
    int v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        long long v19 = *((_OWORD *)v17 - 4);
        long long v20 = *((_OWORD *)v17 - 3);
        long long v21 = *((_OWORD *)v17 - 1);
        *((_OWORD *)v14 - 2) = *((_OWORD *)v17 - 2);
        *((_OWORD *)v14 - 1) = v21;
        *((_OWORD *)v14 - 4) = v19;
        *((_OWORD *)v14 - 3) = v20;
        v14 -= 64;
        v17 -= 64;
      }
      while (v17 != v18);
      int v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7D938C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::deque<std::pair<long,long>>::~deque[abi:ne180100](void *a1)
{
  unint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      unint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 128;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 256;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

void std::deque<std::pair<long,long>>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x100;
  unint64_t v4 = v2 - 256;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    size_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)size_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      int v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      float v38 = (uint64_t *)a1[1];
      size_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        size_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        float v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)float v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    long long v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      unint64_t v9 = (char *)a1[1];
    }
    size_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front((uint64_t)a1, &v54);
    unint64_t v44 = (void *)a1[1];
    size_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    unint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      int v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      unint64_t v48 = (uint64_t *)a1[1];
      size_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        size_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        size_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  float v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front((uint64_t)&v54, v27);
  }
  float v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_21B7D97B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      long long v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

uint64_t std::deque<std::pair<long,long>>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x100) {
    a2 = 1;
  }
  if (v2 < 0x200) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 256;
  }
  return v4 ^ 1u;
}

void sub_21B7DA0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_21B7DA374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DA3F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPKOutput;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B7DA574(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DAAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_21B7DB43C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DBC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DC1D8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21B7DC498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DC590(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21B7DCD4C(_Unwind_Exception *a1)
{
  uint64_t v7 = *(std::__shared_weak_count **)(v5 - 120);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }

  _Unwind_Resume(a1);
}

void sub_21B7DCF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::vector<espresso_buffer_t>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<espresso_buffer_t>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 168 * a2;
  }
}

void std::vector<__CVPixelBufferPool *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<__CVPixelBufferPool *>::__append((void **)a1, a2 - v2);
  }
}

void sub_21B7DD0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7DD284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DD424(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DD7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DE204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B7DE4B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DE5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DE89C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DEA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DEBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DEE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DEF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPK2DDetection;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::vector<espresso_buffer_t>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (0xCF3CF3CF3CF3CF3DLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 168 * ((168 * a2 - 168) / 0xA8) + 168;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xCF3CF3CF3CF3CF3DLL * ((v7 - (unsigned char *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x186186186186186) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xCF3CF3CF3CF3CF3DLL * ((v5 - (unsigned char *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xC30C30C30C30C3) {
      unint64_t v11 = 0x186186186186186;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v14 = &v12[168 * v8];
    uint64_t v15 = &v12[168 * v11];
    size_t v16 = 168 * ((168 * a2 - 168) / 0xA8) + 168;
    bzero(v14, v16);
    uint64_t v17 = &v14[v16];
    uint64_t v19 = (char *)*a1;
    uint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 168);
        long long v21 = *(_OWORD *)(v18 - 152);
        *(_OWORD *)(v14 - 136) = *(_OWORD *)(v18 - 136);
        *(_OWORD *)(v14 - 152) = v21;
        *(_OWORD *)(v14 - 168) = v20;
        long long v22 = *(_OWORD *)(v18 - 120);
        long long v23 = *(_OWORD *)(v18 - 104);
        long long v24 = *(_OWORD *)(v18 - 88);
        *(_OWORD *)(v14 - 72) = *(_OWORD *)(v18 - 72);
        *(_OWORD *)(v14 - 88) = v24;
        *(_OWORD *)(v14 - 104) = v23;
        *(_OWORD *)(v14 - 120) = v22;
        long long v25 = *(_OWORD *)(v18 - 56);
        long long v26 = *(_OWORD *)(v18 - 40);
        long long v27 = *(_OWORD *)(v18 - 24);
        *((void *)v14 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v27;
        *(_OWORD *)(v14 - 40) = v26;
        *(_OWORD *)(v14 - 56) = v25;
        v14 -= 168;
        v18 -= 168;
      }
      while (v18 != v19);
      uint64_t v18 = (char *)*a1;
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<espresso_buffer_t>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(168 * a2);
}

void std::vector<__CVPixelBufferPool *>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      size_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v12);
    }
    else {
      size_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v10];
    uint64_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    size_t v16 = &v14[8 * a2];
    uint64_t v18 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      uint64_t v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

id __ABPKLogSharedInstance()
{
  if (__ABPKLogSharedInstance_onceToken != -1) {
    dispatch_once(&__ABPKLogSharedInstance_onceToken, &__block_literal_global);
  }
  v0 = (void *)sharedInstance;
  return v0;
}

void sub_21B7DFB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, char a12)
{
  if (__p) {
    operator delete(__p);
  }
  -[ABPK3DLiftingResult init]((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_21B7DFBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7DFCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21B7DFE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7DFFC4(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *_ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 16 * a2);
    a1[1] = &v4[16 * a2];
  }
  return a1;
}

void sub_21B7E003C(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t abpk::Human::Human(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  BOOL v3 = (void **)(a1 + 24);
  uint64_t v4 = (void **)(a1 + 48);
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 116) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(unsigned char *)(a1 + 72) = 0;
  std::vector<unsigned int>::size_type v5 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  std::vector<int>::reserve((std::vector<unsigned int> *)(a1 + 24), v5);
  std::vector<float>::reserve(v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  if (*(void **)a1 != v7)
  {
    do
    {
      unint64_t v9 = *(char **)(a1 + 32);
      unint64_t v8 = *(void *)(a1 + 40);
      if (COERCE_FLOAT(*v6) == -1.0 || COERCE_FLOAT(HIDWORD(*v6)) == -1.0)
      {
        if ((unint64_t)v9 >= v8)
        {
          size_t v13 = (char *)*v3;
          uint64_t v14 = (v9 - (unsigned char *)*v3) >> 2;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v16 = v8 - (void)v13;
          if (v16 >> 1 > v15) {
            unint64_t v15 = v16 >> 1;
          }
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v15;
          }
          if (v17)
          {
            uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v17);
            size_t v13 = *(char **)(a1 + 24);
            unint64_t v9 = *(char **)(a1 + 32);
          }
          else
          {
            uint64_t v18 = 0;
          }
          long long v25 = &v18[4 * v14];
          *(_DWORD *)long long v25 = 0;
          uint64_t v11 = v25 + 4;
          while (v9 != v13)
          {
            int v26 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v25 - 1) = v26;
            v25 -= 4;
          }
          *(void *)(a1 + 24) = v25;
          *(void *)(a1 + 32) = v11;
          *(void *)(a1 + 40) = &v18[4 * v17];
          if (v13) {
            operator delete(v13);
          }
        }
        else
        {
          *(_DWORD *)unint64_t v9 = 0;
          uint64_t v11 = v9 + 4;
        }
        *(void *)(a1 + 32) = v11;
        uint64_t v28 = *(char **)(a1 + 56);
        unint64_t v27 = *(void *)(a1 + 64);
        if ((unint64_t)v28 >= v27)
        {
          long long v30 = (char *)*v4;
          uint64_t v31 = (v28 - (unsigned char *)*v4) >> 2;
          unint64_t v32 = v31 + 1;
          if ((unint64_t)(v31 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v33 = v27 - (void)v30;
          if (v33 >> 1 > v32) {
            unint64_t v32 = v33 >> 1;
          }
          if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v32;
          }
          if (v34)
          {
            int v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 64, v34);
            long long v30 = *(char **)(a1 + 48);
            uint64_t v28 = *(char **)(a1 + 56);
          }
          else
          {
            int v35 = 0;
          }
          uint64_t v47 = &v35[4 * v31];
          *(_DWORD *)uint64_t v47 = 0;
          float v29 = v47 + 4;
          while (v28 != v30)
          {
            int v48 = *((_DWORD *)v28 - 1);
            v28 -= 4;
            *((_DWORD *)v47 - 1) = v48;
            v47 -= 4;
          }
          *(void *)(a1 + 48) = v47;
          *(void *)(a1 + 56) = v29;
          *(void *)(a1 + 64) = &v35[4 * v34];
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v28 = 0;
          float v29 = v28 + 4;
        }
        *(void *)(a1 + 56) = v29;
      }
      else
      {
        if ((unint64_t)v9 >= v8)
        {
          uint64_t v19 = (char *)*v3;
          uint64_t v20 = (v9 - (unsigned char *)*v3) >> 2;
          unint64_t v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v22 = v8 - (void)v19;
          if (v22 >> 1 > v21) {
            unint64_t v21 = v22 >> 1;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v23 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v21;
          }
          if (v23)
          {
            long long v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v23);
            uint64_t v19 = *(char **)(a1 + 24);
            unint64_t v9 = *(char **)(a1 + 32);
          }
          else
          {
            long long v24 = 0;
          }
          uint64_t v36 = &v24[4 * v20];
          *(_DWORD *)uint64_t v36 = 1;
          unint64_t v12 = v36 + 4;
          while (v9 != v19)
          {
            int v37 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v36 - 1) = v37;
            v36 -= 4;
          }
          *(void *)(a1 + 24) = v36;
          *(void *)(a1 + 32) = v12;
          *(void *)(a1 + 40) = &v24[4 * v23];
          if (v19) {
            operator delete(v19);
          }
        }
        else
        {
          *(_DWORD *)unint64_t v9 = 1;
          unint64_t v12 = v9 + 4;
        }
        *(void *)(a1 + 32) = v12;
        uint64_t v39 = *(char **)(a1 + 56);
        unint64_t v38 = *(void *)(a1 + 64);
        if ((unint64_t)v39 >= v38)
        {
          float v41 = (char *)*v4;
          uint64_t v42 = (v39 - (unsigned char *)*v4) >> 2;
          unint64_t v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v44 = v38 - (void)v41;
          if (v44 >> 1 > v43) {
            unint64_t v43 = v44 >> 1;
          }
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v45 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v43;
          }
          if (v45)
          {
            unint64_t v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 64, v45);
            float v41 = *(char **)(a1 + 48);
            uint64_t v39 = *(char **)(a1 + 56);
          }
          else
          {
            unint64_t v46 = 0;
          }
          uint64_t v49 = &v46[4 * v42];
          *(_DWORD *)uint64_t v49 = 1056964608;
          uint64_t v40 = v49 + 4;
          while (v39 != v41)
          {
            int v50 = *((_DWORD *)v39 - 1);
            v39 -= 4;
            *((_DWORD *)v49 - 1) = v50;
            v49 -= 4;
          }
          *(void *)(a1 + 48) = v49;
          *(void *)(a1 + 56) = v40;
          *(void *)(a1 + 64) = &v46[4 * v45];
          if (v41) {
            operator delete(v41);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v39 = 1056964608;
          uint64_t v40 = v39 + 4;
        }
        *(void *)(a1 + 56) = v40;
        ++*(void *)(a1 + 104);
      }
      ++v6;
    }
    while (v6 != v7);
  }
  return a1;
}

void sub_21B7E0410(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 96))
  {
    std::vector<unsigned int>::size_type v5 = *(void **)(v1 + 72);
    if (v5)
    {
      *(void *)(v1 + 80) = v5;
      operator delete(v5);
    }
  }
  uint64_t v6 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 56) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v7;
    operator delete(v7);
  }
  unint64_t v8 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v8;
    operator delete(v8);
  }
  _Unwind_Resume(exception_object);
}

uint64_t abpk::Human::Human(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v4 = (void **)(a1 + 24);
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)a3;
  *(void *)(a1 + 64) = *(void *)(a3 + 16);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 116) = 0;
  std::vector<int>::reserve((std::vector<unsigned int> *)(a1 + 24), (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  std::vector<unsigned int>::size_type v5 = *(void **)a1;
  uint64_t v6 = *(void **)(a1 + 8);
  if (*(void **)a1 != v6)
  {
    do
    {
      unint64_t v8 = *(char **)(a1 + 32);
      unint64_t v7 = *(void *)(a1 + 40);
      if (COERCE_FLOAT(*v5) == -1.0 || COERCE_FLOAT(HIDWORD(*v5)) == -1.0)
      {
        if ((unint64_t)v8 >= v7)
        {
          unint64_t v12 = (char *)*v4;
          uint64_t v13 = (v8 - (unsigned char *)*v4) >> 2;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v15 = v7 - (void)v12;
          if (v15 >> 1 > v14) {
            unint64_t v14 = v15 >> 1;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16)
          {
            unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v16);
            unint64_t v12 = *(char **)(a1 + 24);
            unint64_t v8 = *(char **)(a1 + 32);
          }
          else
          {
            unint64_t v17 = 0;
          }
          long long v24 = &v17[4 * v13];
          *(_DWORD *)long long v24 = 0;
          uint64_t v10 = v24 + 4;
          while (v8 != v12)
          {
            int v25 = *((_DWORD *)v8 - 1);
            v8 -= 4;
            *((_DWORD *)v24 - 1) = v25;
            v24 -= 4;
          }
          *(void *)(a1 + 24) = v24;
          *(void *)(a1 + 32) = v10;
          *(void *)(a1 + 40) = &v17[4 * v16];
          if (v12) {
            operator delete(v12);
          }
        }
        else
        {
          *(_DWORD *)unint64_t v8 = 0;
          uint64_t v10 = v8 + 4;
        }
        *(void *)(a1 + 32) = v10;
      }
      else
      {
        if ((unint64_t)v8 >= v7)
        {
          uint64_t v18 = (char *)*v4;
          uint64_t v19 = (v8 - (unsigned char *)*v4) >> 2;
          unint64_t v20 = v19 + 1;
          if ((unint64_t)(v19 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v21 = v7 - (void)v18;
          if (v21 >> 1 > v20) {
            unint64_t v20 = v21 >> 1;
          }
          if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v20;
          }
          if (v22)
          {
            unint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 40, v22);
            uint64_t v18 = *(char **)(a1 + 24);
            unint64_t v8 = *(char **)(a1 + 32);
          }
          else
          {
            unint64_t v23 = 0;
          }
          int v26 = &v23[4 * v19];
          *(_DWORD *)int v26 = 1;
          uint64_t v11 = v26 + 4;
          while (v8 != v18)
          {
            int v27 = *((_DWORD *)v8 - 1);
            v8 -= 4;
            *((_DWORD *)v26 - 1) = v27;
            v26 -= 4;
          }
          *(void *)(a1 + 24) = v26;
          *(void *)(a1 + 32) = v11;
          *(void *)(a1 + 40) = &v23[4 * v22];
          if (v18) {
            operator delete(v18);
          }
        }
        else
        {
          *(_DWORD *)unint64_t v8 = 1;
          uint64_t v11 = v8 + 4;
        }
        *(void *)(a1 + 32) = v11;
        ++*(void *)(a1 + 104);
      }
      ++v5;
    }
    while (v5 != v6);
  }
  return a1;
}

void sub_21B7E06E4(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 96))
  {
    uint64_t v4 = *(void **)(v1 + 72);
    if (v4)
    {
      *(void *)(v1 + 80) = v4;
      operator delete(v4);
    }
  }
  std::vector<unsigned int>::size_type v5 = *(void **)(v1 + 48);
  if (v5)
  {
    *(void *)(v1 + 56) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v6;
    operator delete(v6);
  }
  unint64_t v7 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(exception_object);
}

void abpk::Human::resize(abpk::Human *this, unint64_t a2)
{
  if (a2 > (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3) {
    abpk::Human::resize();
  }
  uint64_t v4 = (int *)*((void *)this + 4);
  std::vector<unsigned int>::size_type v5 = (std::vector<unsigned int> *)((char *)this + 24);
  uint64_t v6 = (int *)(*((void *)this + 3) + 4 * a2);
  if (v6 == v4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    int v7 = 0;
    do
    {
      int v8 = *v6++;
      v7 += v8;
    }
    while (v6 != v4);
    uint64_t v9 = v7;
  }
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)this, a2);
  std::vector<unsigned int>::resize(v5, a2);
  if (*((unsigned char *)this + 96))
  {
    uint64_t v10 = (void *)*((void *)this + 9);
    if (v10)
    {
      *((void *)this + 10) = v10;
      operator delete(v10);
    }
    *((unsigned char *)this + 96) = 0;
  }
  if (*((unsigned char *)this + 116)) {
    *((unsigned char *)this + 116) = 0;
  }
  *((void *)this + 13) -= v9;
}

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE8__appendEm((void **)a1, a2 - v2);
  }
}

void std::vector<unsigned int>::resize(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __sz)
{
  std::vector<unsigned int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v2);
  }
}

void abpk::Human::updateFromRawJointArray(uint64_t *a1, void *a2)
{
  {
    int v25 = a2;
    a2 = v25;
    if (v24)
    {
      int v26 = 286199296;
      char v27 = 18;
      std::set<unsigned char>::set[abi:ne180100]((uint64_t)&abpk::Human::updateFromRawJointArray(std::vector<float> const&)::ignoreJointIndexes, (unsigned __int8 *)&v26, 5);
      __cxa_atexit((void (*)(void *))std::set<unsigned char>::~set[abi:ne180100], &abpk::Human::updateFromRawJointArray(std::vector<float> const&)::ignoreJointIndexes, &dword_21B7C6000);
      a2 = v25;
    }
  }
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (v4 != *a1)
  {
    uint64_t v5 = 0;
    unsigned __int8 v6 = 0;
    uint64_t v7 = qword_267C5B940;
    __asm { FMOV            V1.2S, #-1.0 }
    do
    {
      if (v7)
      {
        uint64_t v13 = v7;
        do
        {
          unsigned int v14 = *(unsigned __int8 *)(v13 + 25);
          if (v14 <= v6)
          {
            if (v14 >= v6) {
              goto LABEL_17;
            }
            v13 += 8;
          }
          uint64_t v13 = *(void *)v13;
        }
        while (v13);
      }
      uint64_t v15 = *(void *)(*a2 + 8 * v5);
      v16.i64[0] = v15;
      v16.i64[1] = v15;
      v17.i32[0] = vmovn_s32(vcgtq_f32(v16, (float32x4_t)xmmword_21B813950)).u32[0];
      v17.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_21B813950, v16)).i32[1];
      uint64_t v18 = a1[3];
      int v19 = *(_DWORD *)(v18 + 4 * v5);
      if (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v17, 0xFuLL))))
      {
        uint64_t v15 = _D1;
        if (v19 != 1) {
          goto LABEL_16;
        }
        int v20 = 0;
        uint64_t v21 = -1;
        float v22 = 0.0;
        uint64_t v15 = _D1;
      }
      else
      {
        if (v19) {
          goto LABEL_16;
        }
        float v22 = 0.5;
        int v20 = 1;
        uint64_t v21 = 1;
      }
      *(_DWORD *)(v18 + 4 * v5) = v20;
      *(float *)(a1[6] + 4 * v5) = v22;
      a1[13] += v21;
LABEL_16:
      *(void *)(v3 + 8 * v5) = v15;
      uint64_t v7 = qword_267C5B940;
      uint64_t v3 = *a1;
      uint64_t v4 = a1[1];
LABEL_17:
      uint64_t v5 = ++v6;
    }
    while (v6 < (unint64_t)((v4 - v3) >> 3));
  }
  if (*((unsigned char *)a1 + 96))
  {
    unint64_t v23 = (void *)a1[9];
    if (v23)
    {
      a1[10] = (uint64_t)v23;
      operator delete(v23);
    }
    *((unsigned char *)a1 + 96) = 0;
  }
  if (*((unsigned char *)a1 + 116)) {
    *((unsigned char *)a1 + 116) = 0;
  }
}

void sub_21B7E0A3C(_Unwind_Exception *a1)
{
}

uint64_t std::set<unsigned char>::~set[abi:ne180100](uint64_t a1)
{
  return a1;
}

void abpk::Human::updateJoint(uint64_t a1, uint64_t a2, double _D0)
{
  BOOL v4 = *(float *)&_D0 >= 0.0 && *(float *)&_D0 <= 1.0;
  if (v4 && (*((float *)&_D0 + 1) >= 0.0 ? (BOOL v5 = *((float *)&_D0 + 1) <= 1.0) : (BOOL v5 = 0), v5))
  {
    uint64_t v13 = *(void *)(a1 + 24);
    if (*(_DWORD *)(v13 + 4 * a2)) {
      goto LABEL_16;
    }
    uint64_t v11 = 1;
    *(_DWORD *)(v13 + 4 * a2) = 1;
    float v12 = 0.5;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (*(_DWORD *)(v6 + 4 * a2) != 1)
    {
      __asm { FMOV            V0.2S, #-1.0 }
      goto LABEL_16;
    }
    *(_DWORD *)(v6 + 4 * a2) = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    uint64_t v11 = -1;
    float v12 = 0.0;
  }
  *(float *)(*(void *)(a1 + 48) + 4 * a2) = v12;
  *(void *)(a1 + 104) += v11;
LABEL_16:
  *(double *)(*(void *)a1 + 8 * a2) = _D0;
  if (*(unsigned char *)(a1 + 96))
  {
    unsigned int v14 = *(void **)(a1 + 72);
    if (v14)
    {
      *(void *)(a1 + 80) = v14;
      operator delete(v14);
    }
    *(unsigned char *)(a1 + 96) = 0;
  }
  if (*(unsigned char *)(a1 + 116)) {
    *(unsigned char *)(a1 + 116) = 0;
  }
}

abpk::Human *abpk::Human::jointVector(abpk::Human *this)
{
  uint64_t v2 = *((void *)this + 1) - *(void *)this;
  if (*((void *)this + 13) == v2 >> 3) {
    return this;
  }
  uint64_t v3 = (char *)this + 72;
  if (*((unsigned char *)this + 96)) {
    return (abpk::Human *)v3;
  }
  __n128 __p = 0uLL;
  unint64_t v24 = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)&__p, v2 >> 3);
  uint64_t v4 = *(void *)this;
  if (*((void *)this + 1) != *(void *)this)
  {
    unint64_t v5 = 0;
    int32x2_t v6 = vdup_n_s32(0x7FC00000u);
    do
    {
      if (*(_DWORD *)(*((void *)this + 3) + 4 * v5))
      {
        unint64_t v7 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v24)
        {
          uint64_t v10 = (uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3;
          if ((unint64_t)(v10 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v11 = (uint64_t)(v24 - __p.n128_u64[0]) >> 2;
          if (v11 <= v10 + 1) {
            unint64_t v11 = v10 + 1;
          }
          if (v24 - __p.n128_u64[0] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v12 = v11;
          }
          if (v12) {
            uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v24, v12);
          }
          else {
            uint64_t v13 = 0;
          }
          float32x4_t v16 = (int32x2_t *)&v13[8 * v10];
          int32x2_t *v16 = *(int32x2_t *)(v4 + 8 * v5);
          unint64_t v8 = (unint64_t)&v16[1];
          int16x4_t v17 = (char *)__p.n128_u64[1];
          unint64_t v18 = __p.n128_u64[0];
          if (__p.n128_u64[1] != __p.n128_u64[0])
          {
            do
            {
              int32x2_t v19 = *(int32x2_t *)(v17 - 8);
              v17 -= 8;
              v16[-1] = v19;
              --v16;
            }
            while (v17 != (char *)v18);
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        *(void *)__p.n128_u64[1] = *(void *)(v4 + 8 * v5);
        unint64_t v8 = v7 + 8;
      }
      else
      {
        unint64_t v9 = __p.n128_u64[1];
        if (__p.n128_u64[1] >= v24)
        {
          uint64_t v14 = (uint64_t)(__p.n128_u64[1] - __p.n128_u64[0]) >> 3;
          if ((unint64_t)(v14 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v15 = (uint64_t)(v24 - __p.n128_u64[0]) >> 2;
          if (v15 <= v14 + 1) {
            unint64_t v15 = v14 + 1;
          }
          if (v24 - __p.n128_u64[0] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v12 = v15;
          }
          if (v12) {
            uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v24, v12);
          }
          else {
            uint64_t v13 = 0;
          }
          float32x4_t v16 = (int32x2_t *)&v13[8 * v14];
          int32x2_t *v16 = v6;
          unint64_t v8 = (unint64_t)&v16[1];
          int16x4_t v17 = (char *)__p.n128_u64[1];
          unint64_t v20 = __p.n128_u64[0];
          if (__p.n128_u64[1] != __p.n128_u64[0])
          {
            do
            {
              int32x2_t v21 = *(int32x2_t *)(v17 - 8);
              v17 -= 8;
              v16[-1] = v21;
              --v16;
            }
            while (v17 != (char *)v20);
LABEL_34:
            int16x4_t v17 = (char *)__p.n128_u64[0];
          }
LABEL_35:
          __p.n128_u64[0] = (unint64_t)v16;
          __p.n128_u64[1] = v8;
          unint64_t v24 = (unint64_t)&v13[8 * v12];
          if (v17) {
            operator delete(v17);
          }
          goto LABEL_37;
        }
        *(int32x2_t *)__p.n128_u64[1] = v6;
        unint64_t v8 = v9 + 8;
      }
LABEL_37:
      __p.n128_u64[1] = v8;
      ++v5;
      uint64_t v4 = *(void *)this;
    }
    while (v5 < (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  }
  _ZNSt3__18optionalINS_6vectorIDv2_fNS_9allocatorIS2_EEEEEaSB8ne180100IS5_vEERS6_OT_((uint64_t)this + 72, &__p);
  if (__p.n128_u64[0])
  {
    __p.n128_u64[1] = __p.n128_u64[0];
    operator delete((void *)__p.n128_u64[0]);
  }
  return (abpk::Human *)v3;
}

void sub_21B7E0D78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNSt3__18optionalINS_6vectorIDv2_fNS_9allocatorIS2_EEEEEaSB8ne180100IS5_vEERS6_OT_(uint64_t a1, __n128 *a2)
{
  if (*(unsigned char *)(a1 + 24))
  {
    std::vector<float>::__move_assign(a1, a2);
  }
  else
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(__n128 *)a1 = *a2;
    *(void *)(a1 + 16) = a2[1].n128_u64[0];
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    *(unsigned char *)(a1 + 24) = 1;
  }
  return a1;
}

double abpk::Human::boundingBox(abpk::Human *this, CGSize a2)
{
  uint64_t v2 = *(void **)this;
  uint64_t v3 = *((void *)this + 1) - *(void *)this;
  if (v3)
  {
    unint64_t v4 = v3 >> 3;
    if (v4 <= 1) {
      unint64_t v4 = 1;
    }
    float v5 = 0.0;
    float v6 = 3.4028e38;
    float v7 = 3.4028e38;
    float v8 = 0.0;
    do
    {
      uint64_t v9 = *v2;
      LODWORD(v10) = HIDWORD(*v2);
      if (COERCE_FLOAT(*v2) != -1.0 && v10 != -1.0)
      {
        if (*(float *)&v9 > v8) {
          LODWORD(v12) = *v2;
        }
        else {
          float v12 = v8;
        }
        if (*(float *)&v9 < v6) {
          LODWORD(v6) = *v2;
        }
        else {
          float v8 = v12;
        }
        if (v10 >= v7)
        {
          if (v10 > v5) {
            LODWORD(v5) = HIDWORD(*v2);
          }
        }
        else
        {
          LODWORD(v7) = HIDWORD(*v2);
        }
      }
      ++v2;
      --v4;
    }
    while (v4);
  }
  else
  {
    float v6 = 3.4028e38;
  }
  return (float)(v6 * (float)(unint64_t)a2.width);
}

float32x2_t abpk::Human::area(abpk::Human *this, float32x2_t result)
{
  if (*((unsigned char *)this + 116))
  {
    result.i32[0] = *((_DWORD *)this + 28);
  }
  else
  {
    uint64_t v2 = *((void *)this + 1);
    uint64_t v3 = v2 - *(void *)this;
    if (v2 == *(void *)this)
    {
      float32x2_t v9 = (float32x2_t)0x80000000800000;
    }
    else
    {
      uint64_t v4 = 0;
      unint64_t v5 = v3 >> 3;
      float32x2_t v6 = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
      float32x2_t v7 = (float32x2_t)0x80000000800000;
      do
      {
        if (*(_DWORD *)(*((void *)this + 3) + 4 * v4))
        {
          float32x2_t v8 = *(float32x2_t *)(*(void *)this + 8 * v4);
          float32x2_t v6 = vminnm_f32(v6, v8);
          float32x2_t v7 = vmaxnm_f32(v7, v8);
        }
        ++v4;
      }
      while (v5 > v4);
      float32x2_t v9 = vsub_f32(v7, v6);
    }
    double result = vmul_lane_f32(v9, v9, 1);
    *((_DWORD *)this + 28) = result.i32[0];
    *((unsigned char *)this + 116) = 1;
  }
  return result;
}

void abpk::Human::printData(abpk::Human *this)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*((void *)this + 1) != *(void *)this)
  {
    for (unint64_t i = 0; i < (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3; ++i)
    {
      uint64_t v3 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = i;
        _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " \t\t Joint: %d ", buf, 8u);
      }
      uint64_t v4 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        int v5 = *(_DWORD *)(*((void *)this + 3) + 4 * i);
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = v5;
        _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " \t\t\t %d ", buf, 8u);
      }
      float32x2_t v6 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        double v7 = *(float *)(*((void *)this + 6) + 4 * i);
        *(_DWORD *)buf = 134217984;
        double v18 = v7;
        _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " \t\t\t Confidence: %f ", buf, 0xCu);
      }
      float32x2_t v8 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        double v9 = COERCE_FLOAT(*(void *)(*(void *)this + 8 * i));
        double v10 = COERCE_FLOAT(HIDWORD(*(void *)(*(void *)this + 8 * i)));
        *(_DWORD *)buf = 134218240;
        double v18 = v9;
        __int16 v19 = 2048;
        double v20 = v10;
        _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_DEBUG, " \t\t\t RawArray: (%f, %f) ", buf, 0x16u);
      }
      if (*(_DWORD *)(*((void *)this + 3) + 4 * i))
      {
        uint64_t v16 = *(void *)(*(void *)this + 8 * i);
        unint64_t v11 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          double v18 = *(float *)&v16;
          __int16 v19 = 2048;
          double v20 = *((float *)&v16 + 1);
          float v12 = v11;
          uint64_t v13 = " \t\t\t JointMap: (%f, %f) ";
          uint32_t v14 = 22;
LABEL_16:
          _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, v13, buf, v14);
        }
      }
      else
      {
        unint64_t v15 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          float v12 = v15;
          uint64_t v13 = " \t\t\t JointMap: Missing ";
          uint32_t v14 = 2;
          goto LABEL_16;
        }
      }
    }
  }
}

uint64_t abpk::Human::printMissingJoints(abpk::Human *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  __n128 __p = 0;
  char v27 = 0;
  uint64_t v28 = 0;
  uint64_t v1 = *(void *)this;
  if (*((void *)this + 1) == *(void *)this) {
    goto LABEL_49;
  }
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  char v5 = 0;
  do
  {
    if (!*(_DWORD *)(*((void *)this + 3) + 4 * v4))
    {
      if (v3 < v28) {
        goto LABEL_19;
      }
      double v7 = __p;
      uint64_t v14 = (v3 - __p) >> 2;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v16 = v28 - __p;
      if ((v28 - __p) >> 1 > v15) {
        unint64_t v15 = v16 >> 1;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v15;
      }
      if (v11)
      {
        float v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v28, v11);
        double v7 = __p;
        uint64_t v3 = v27;
      }
      else
      {
        float v12 = 0;
      }
      int16x4_t v17 = &v12[4 * v14];
      *(_DWORD *)int16x4_t v17 = v4;
      uint64_t v13 = v17 + 4;
      while (v3 != v7)
      {
        int v18 = *((_DWORD *)v3 - 1);
        v3 -= 4;
        *((_DWORD *)v17 - 1) = v18;
        v17 -= 4;
      }
LABEL_36:
      __n128 __p = v17;
      uint64_t v28 = &v12[4 * v11];
      if (v7) {
        operator delete(v7);
      }
LABEL_38:
      char v27 = v13;
      char v5 = 1;
      uint64_t v3 = v13;
      goto LABEL_39;
    }
    if (COERCE_FLOAT(*(void *)(v1 + 8 * v4)) == -1.0 || COERCE_FLOAT(HIDWORD(*(void *)(v1 + 8 * v4))) == -1.0)
    {
      if (v3 >= v28)
      {
        double v7 = __p;
        uint64_t v8 = (v3 - __p) >> 2;
        unint64_t v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v10 = v28 - __p;
        if ((v28 - __p) >> 1 > v9) {
          unint64_t v9 = v10 >> 1;
        }
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v9;
        }
        if (v11)
        {
          float v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v28, v11);
          double v7 = __p;
          uint64_t v3 = v27;
        }
        else
        {
          float v12 = 0;
        }
        int16x4_t v17 = &v12[4 * v8];
        *(_DWORD *)int16x4_t v17 = v4;
        uint64_t v13 = v17 + 4;
        while (v3 != v7)
        {
          int v19 = *((_DWORD *)v3 - 1);
          v3 -= 4;
          *((_DWORD *)v17 - 1) = v19;
          v17 -= 4;
        }
        goto LABEL_36;
      }
LABEL_19:
      *(_DWORD *)uint64_t v3 = v4;
      uint64_t v13 = v3 + 4;
      goto LABEL_38;
    }
LABEL_39:
    ++v4;
    uint64_t v1 = *(void *)this;
  }
  while (v4 < (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  if ((v5 & 1) == 0)
  {
LABEL_49:
    char v5 = 0;
    uint64_t v21 = __p;
    goto LABEL_50;
  }
  double v20 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_DEBUG, " \tMissing Joints: ", buf, 2u);
  }
  uint64_t v21 = v27;
  if (v27 == __p)
  {
    char v5 = 1;
    if (v27) {
      goto LABEL_51;
    }
  }
  else
  {
    unint64_t v22 = 0;
    do
    {
      unint64_t v23 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        int v24 = *(_DWORD *)&__p[4 * v22];
        *(_DWORD *)buf = 67109120;
        int v30 = v24;
        _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, " \t\t %d ", buf, 8u);
      }
      ++v22;
      uint64_t v21 = __p;
    }
    while (v22 < (v27 - __p) >> 2);
LABEL_50:
    if (v21) {
LABEL_51:
    }
      operator delete(v21);
  }
  return v5 & 1;
}

void sub_21B7E14FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE8__appendEm(void **a1, unint64_t a2)
{
  float32x2_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  char v5 = v6;
  double v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[8 * v10];
    unint64_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    uint64_t v16 = &v14[8 * a2];
    int v18 = (char *)*a1;
    int16x4_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      int16x4_t v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  char v5 = value;
  std::vector<int>::pointer end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<unsigned int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v13);
      std::vector<unsigned int>::pointer begin = this->__begin_;
      std::vector<int>::pointer end = this->__end_;
    }
    else
    {
      uint64_t v14 = 0;
    }
    unint64_t v15 = &v14[4 * v11];
    uint64_t v16 = (unsigned int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    int16x4_t v17 = (unsigned int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t std::set<unsigned char>::set[abi:ne180100](uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v5 = a3;
    do
    {
      std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>((uint64_t **)a1, v4, a2, a2);
      ++a2;
      --v5;
    }
    while (v5);
  }
  return a1;
}

void sub_21B7E17C4(_Unwind_Exception *a1)
{
  std::__tree<unsigned char>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>(uint64_t **a1, uint64_t *a2, unsigned __int8 *a3, unsigned char *a4)
{
  float32x2_t v6 = std::__tree<unsigned char>::__find_equal<unsigned char>(a1, a2, &v11, &v10, a3);
  double v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    double v7 = (uint64_t *)operator new(0x20uLL);
    *((unsigned char *)v7 + 25) = *a4;
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<unsigned char>::__find_equal<unsigned char>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, unsigned __int8 *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (unsigned int v6 = *a5, v7 = *((unsigned __int8 *)a2 + 25), v6 < v7))
  {
    uint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      uint64_t v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      unint64_t v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        unint64_t v13 = v10;
      }
      while (v14);
    }
    unsigned int v15 = *a5;
    if (*((unsigned __int8 *)v10 + 25) < v15) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int16x4_t v17 = (uint64_t *)v16;
          unsigned int v18 = *(unsigned __int8 *)(v16 + 25);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      int16x4_t v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((unsigned __int8 *)a4 + 25))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          unsigned int v22 = *(unsigned __int8 *)(v20 + 25);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__tree<unsigned char>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<unsigned char>::destroy(a1, *a2);
    std::__tree<unsigned char>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void abpk::parsePersonsfromHeatmapBuffer(uint64_t a1@<X0>, unint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t *a4@<X8>, __n128 a5@<Q0>)
{
  short float v7 = *(short float *)a5.n128_u16;
  uint64_t v84 = *MEMORY[0x263EF8340];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v77 = a4;
  uint64_t v9 = std::vector<abpk::HeatmapPersonData>::reserve(a4, 5uLL);
  if (a1)
  {
    uint64_t v68 = (uint64_t)&v68;
    unint64_t v71 = a3 * a2;
    size_t v69 = 2 * a3 * a2;
    MEMORY[0x270FA5388](v9);
    uint64_t v11 = (char *)&v68 - v10;
    uint64_t v12 = 0;
    LOWORD(v13) = COERCE_UNSIGNED_INT(-1.0);
    uint64_t v70 = a1;
    unint64_t v73 = (char *)&v68 - v10;
    do
    {
      BOOL v14 = (const void *)(a1 + 2 * v71 * v12);
      memcpy(v11, v14, v69);
      uint64_t v72 = v12;
      unsigned int v18 = v77;
      if (a2)
      {
        uint64_t v19 = 0;
        LODWORD(v20) = 0;
        uint64_t v75 = v70 + 2 * v71 * (v72 + 19);
        unsigned int v18 = v77;
        int v76 = -3;
        do
        {
          if (a3)
          {
            uint64_t v21 = 0;
            *(float *)&long long v15 = (float)(int)v19;
            long long v74 = v15;
            uint64_t v20 = (int)v20;
            unsigned int v22 = v11;
            do
            {
              _H0 = *(short float *)&v11[2 * v20];
              if (_H0 >= v7)
              {
                int v24 = -3;
                unsigned int v25 = v76;
                while (2)
                {
                  unint64_t v26 = (v24 + v19);
                  BOOL v28 = (v26 & 0x80000000) != 0 || v26 >= a2;
                  for (uint64_t i = -3; i != 4; ++i)
                  {
                    if (!v28
                      && v21 + i >= 0
                      && (v21 + i) < a3
                      && *(short float *)&v22[2 * i + 2 * a3 * v25] > _H0)
                    {
                      _H0 = _H0 + v13;
                      *(short float *)&v11[2 * v20] = _H0;
                      goto LABEL_25;
                    }
                  }
                  ++v24;
                  ++v25;
                  if (v24 != 4) {
                    continue;
                  }
                  break;
                }
LABEL_25:
                unsigned int v18 = v77;
                if (_H0 >= v7)
                {
                  _H1 = *(_WORD *)(v75 + 2 * v20);
                  __asm { FCVT            S1, H1 }
                  int v83 = LODWORD(_S1);
                  uint64_t v35 = *v77;
                  uint64_t v36 = v77[1];
                  if (*v77 != v36)
                  {
                    for (uint64_t j = v35 + 56; j != v36; j += 56)
                    {
                      if (vabds_f32(_S1, *(float *)(j + 48)) < vabds_f32(_S1, *(float *)(v35 + 48))) {
                        uint64_t v35 = j;
                      }
                    }
                  }
                  __asm { FCVT            S14, H0 }
                  if (v35 == v36 || (float v39 = *(float *)(v35 + 48), vabds_f32(_S1, v39) >= 0.3))
                  {
                    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v81, 0x13uLL);
                    *(float *)&uint64_t v41 = (float)(int)v21;
                    HIDWORD(v41) = v74;
                    *(void *)(v81 + 8 * v17) = v41;
                    std::vector<float>::vector(&v79, 0x13uLL);
                    uint64_t v42 = v79;
                    uint64_t v43 = v17;
                    v79[v17] = _S14;
                    int v78 = 1065353216;
                    uint64_t v44 = v77;
                    unint64_t v45 = v77[1];
                    if (v45 >= v77[2])
                    {
                      uint64_t v49 = _ZNSt3__16vectorIN4abpk17HeatmapPersonDataENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEERKffEEEPS2_DpOT_(v77, &v81, (long long *)&v79, &v83, &v78);
                      int v50 = v79;
                      v44[1] = v49;
                      if (v50)
                      {
                        *(void *)&long long v80 = v50;
                        operator delete(v50);
                      }
                    }
                    else
                    {
                      uint64_t v46 = v82;
                      long long v47 = v80;
                      long long v15 = v81;
                      uint64_t v82 = 0;
                      long long v81 = 0uLL;
                      int v48 = v83;
                      *(_OWORD *)unint64_t v45 = v15;
                      *(void *)(v45 + 16) = v46;
                      *(void *)(v45 + 24) = v42;
                      *(_OWORD *)(v45 + 32) = v47;
                      *(_DWORD *)(v45 + 48) = v48;
                      *(_DWORD *)(v45 + 52) = 1065353216;
                      v44[1] = v45 + 56;
                    }
                    uint64_t v17 = v43;
                    if ((void)v81)
                    {
                      *((void *)&v81 + 1) = v81;
                      operator delete((void *)v81);
                    }
                    uint64_t v11 = v73;
                  }
                  else
                  {
                    float v40 = *(float *)(v35 + 52);
                    *(float *)(v35 + 48) = (float)(_S1 + (float)(v39 * v40)) / (float)(v40 + 1.0);
                    *(float *)(v35 + 52) = v40 + 1.0;
                    if (*(float *)(*(void *)(v35 + 24) + 4 * v17) < _S14)
                    {
                      *(float *)&long long v15 = (float)(int)v21;
                      DWORD1(v15) = v74;
                      *(void *)(*(void *)v35 + 8 * v17) = v15;
                      *(float *)(*(void *)(v35 + 24) + 4 * v17) = _S14;
                    }
                  }
                  unsigned int v18 = v77;
                }
              }
              else
              {
                *(short float *)&v11[2 * v20] = _H0 + v13;
              }
              ++v21;
              ++v20;
              v22 += 2;
            }
            while (v21 != a3);
          }
          ++v19;
          ++v76;
        }
        while (v19 != a2);
      }
      uint64_t v51 = v17;
      uint64_t v52 = v18;
      uint64_t v53 = (void *)*v18;
      long long v54 = (void *)v52[1];
      a1 = v70;
      for (uint64_t k = v72; v53 != v54; v53 += 7)
      {
        float16x4_t v56 = 0;
        _D1 = 0;
        for (int m = -3; m != 4; ++m)
        {
          unint64_t v59 = (m + (int)COERCE_FLOAT(HIDWORD(*(void *)(*v53 + 8 * v51))));
          unint64_t v60 = v59 * a3;
          short float v61 = (short float)(int)v59;
          BOOL v63 = (v59 & 0x80000000) != 0 || v59 >= a2;
          for (int n = -3; n != 4; ++n)
          {
            unint64_t v65 = ((int)COERCE_FLOAT(*(void *)(*v53 + 8 * v51)) + n);
            char v66 = (v65 & 0x80000000) != 0 || v63;
            if ((v66 & 1) == 0 && v65 < a3)
            {
              short float v67 = *((short float *)v14 + v60 + v65);
              if (v67 > COERCE_SHORT_FLOAT(10854))
              {
                *(short float *)_D1.i16 = *(short float *)_D1.i16 + v67;
                *(short float *)v16.i16 = (short float)(int)v65;
                *(short float *)&v16.i16[1] = v61;
                float16x4_t v56 = vmla_n_f16(v56, v16, v67);
              }
            }
          }
        }
        __asm { FCMP            H1, #0 }
        if (!(_NF ^ _VF | _ZF)) {
          *(float32x2_t *)(*v53 + 8 * v51) = vadd_f32((float32x2_t)*(_OWORD *)&vcvtq_f32_f16(vdiv_f16(v56, (float16x4_t)vdup_lane_s16(_D1, 0))), (float32x2_t)0x3F0000003F000000);
        }
      }
      uint64_t v12 = k + 1;
    }
    while (v12 != 19);
  }
}

void sub_21B7E1F70(_Unwind_Exception *a1)
{
  *(void *)(v1 - 192) = *(void *)(v1 - 232);
  std::vector<abpk::HeatmapPersonData>::__destroy_vector::operator()[abi:ne180100]((void ***)(v1 - 192));
  _Unwind_Resume(a1);
}

void **std::vector<abpk::HeatmapPersonData>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  double result = (void **)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 56 * v6;
    std::vector<abpk::HeatmapPersonData>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer(v7);
  }
  return result;
}

void sub_21B7E206C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t abpk::convertPersonsToHuman@<X0>(uint64_t **a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t result = (uint64_t)std::vector<abpk::Human>::reserve(a3, 0x6DB6DB6DB6DB6DB7 * (a1[1] - *a1));
  short float v7 = *a1;
  uint64_t v8 = a1[1];
  if (*a1 != v8)
  {
    __asm { FMOV            V9.2S, #-1.0 }
    do
    {
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v7, a2);
      std::vector<float>::resize((uint64_t)(v7 + 3), a2);
      uint64_t v15 = *v7;
      uint64_t v14 = v7[1];
      if (v14 != *v7)
      {
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = v7[3];
          uint64_t v18 = *(void *)(v15 + 8 * v16);
          BOOL v19 = *(float *)&v18 >= 0.0 && *(float *)&v18 <= 1.0;
          if (!v19
            || (*((float *)&v18 + 1) >= 0.0 ? (BOOL v20 = *((float *)&v18 + 1) <= 1.0) : (BOOL v20 = 0),
                !v20 || *(float *)(v17 + 4 * v16) == 0.0))
          {
            *(void *)(v15 + 8 * v16) = _D9;
            *(_DWORD *)(v17 + 4 * v16) = 0;
            uint64_t v15 = *v7;
            uint64_t v14 = v7[1];
          }
          ++v16;
        }
        while (v16 < (v14 - v15) >> 3);
      }
      unint64_t v21 = a3[1];
      if (v21 >= a3[2])
      {
        uint64_t result = _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEEEEEPS2_DpOT_(a3, (uint64_t)v7, (uint64_t)(v7 + 3));
      }
      else
      {
        _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEENS5_IfNS0_IfEEEEEEEvPT_DpOT0_((uint64_t)(a3 + 2), a3[1], (uint64_t)v7, (uint64_t)(v7 + 3));
        uint64_t result = v21 + 120;
        a3[1] = v21 + 120;
      }
      a3[1] = result;
      v7 += 7;
    }
    while (v7 != v8);
  }
  return result;
}

void sub_21B7E21DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

uint64_t abpk::filterValidPersons(__n128 **a1, uint64_t a2, uint64_t a3, float a4)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (*a1 == v6) {
    goto LABEL_43;
  }
  uint64_t v8 = (uint64_t)a1[1];
  v9.i64[0] = a2;
  v9.i64[1] = a3;
  float32x2_t v10 = vcvt_f32_f64(vcvtq_f64_u64(v9));
  __asm { FMOV            V0.2S, #1.0 }
  while (1)
  {
    unint64_t v16 = v5->n128_u64[0];
    if (v5->n128_u64[1] == v5->n128_u64[0]) {
      break;
    }
    unint64_t v17 = 0;
    float v18 = 0.0;
    float32x2_t v19 = 0;
    float32x2_t v20 = _D0;
    float v21 = 0.0;
    do
    {
      float32x2_t v22 = vdiv_f32(*(float32x2_t *)(v16 + 8 * v17), v10);
      *(float32x2_t *)(v16 + 8 * v17) = v22;
      float v23 = *(float *)(v5[1].n128_u64[1] + 4 * v17);
      if (v23 > a4)
      {
        float32x2_t v20 = vminnm_f32(v20, v22);
        float32x2_t v19 = vmaxnm_f32(v19, v22);
        float v18 = v18 + v23;
        float v21 = v21 + 1.0;
      }
      ++v17;
      unint64_t v16 = v5->n128_u64[0];
    }
    while (v17 < (uint64_t)(v5->n128_u64[1] - v5->n128_u64[0]) >> 3);
    float32x2_t v24 = vsub_f32(v19, v20);
    if (v24.f32[0] <= 0.0) {
      break;
    }
    if (v24.f32[1] <= 0.0 || v21 <= 4.0) {
      break;
    }
    if (v24.f32[0] < v24.f32[1]) {
      v24.f32[0] = v24.f32[1];
    }
    float v26 = v18 / v21;
    if (v24.f32[0] <= 0.1 || v26 <= a4) {
      break;
    }
    uint64_t v5 = (__n128 *)((char *)v5 + 56);
    if (v5 == v6) {
      goto LABEL_44;
    }
  }
  if (v5 != v6)
  {
    BOOL v28 = (__n128 *)((char *)v5 + 56);
    if (&v5[3].n128_i8[8] != (__int8 *)v6)
    {
      __asm { FMOV            V11.2S, #1.0 }
      uint64_t v8 = (uint64_t)v5;
      do
      {
        int v30 = v5;
        uint64_t v5 = v28;
        unint64_t v31 = v30[3].n128_u64[1];
        if (v30[4].n128_u64[0] != v31)
        {
          unint64_t v32 = 0;
          float v33 = 0.0;
          float32x2_t v34 = 0;
          float32x2_t v35 = _D11;
          float v36 = 0.0;
          do
          {
            float32x2_t v37 = vdiv_f32(*(float32x2_t *)(v31 + 8 * v32), v10);
            *(float32x2_t *)(v31 + 8 * v32) = v37;
            float v38 = *(float *)(v30[5].n128_u64[0] + 4 * v32);
            if (v38 > a4)
            {
              float32x2_t v35 = vminnm_f32(v35, v37);
              float32x2_t v34 = vmaxnm_f32(v34, v37);
              float v33 = v33 + v38;
              float v36 = v36 + 1.0;
            }
            ++v32;
            unint64_t v31 = v5->n128_u64[0];
          }
          while (v32 < (uint64_t)(v30[4].n128_u64[0] - v5->n128_u64[0]) >> 3);
          float32x2_t v39 = vsub_f32(v34, v35);
          if (v39.f32[0] > 0.0 && v39.f32[1] > 0.0 && v36 > 4.0)
          {
            if (v39.f32[0] < v39.f32[1]) {
              v39.f32[0] = v39.f32[1];
            }
            float v41 = v33 / v36;
            if (v39.f32[0] > 0.1 && v41 > a4)
            {
              std::vector<float>::__move_assign(v8, v5);
              std::vector<float>::__move_assign(v8 + 24, v30 + 5);
              *(void *)(v8 + 48) = v30[6].n128_u64[1];
              v8 += 56;
            }
          }
        }
        BOOL v28 = (__n128 *)((char *)v5 + 56);
      }
      while (&v5[3].n128_i8[8] != (__int8 *)v6);
      goto LABEL_44;
    }
LABEL_43:
    uint64_t v8 = (uint64_t)v5;
  }
LABEL_44:
  uint64_t v43 = (uint64_t)a1[1];
  return std::vector<abpk::HeatmapPersonData>::erase((uint64_t)a1, v8, v43);
}

uint64_t std::vector<abpk::HeatmapPersonData>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<abpk::HeatmapPersonData *,abpk::HeatmapPersonData *,abpk::HeatmapPersonData *>((uint64_t)&v9, a3, *(void *)(a1 + 8), a2);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        v7 -= 56;
        std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](a1 + 16, v7);
      }
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

uint64_t std::vector<abpk::HeatmapPersonData>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>,std::reverse_iterator<abpk::HeatmapPersonData*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 56) = 0;
      *(void *)(v7 - 48) = 0;
      *(void *)(v7 - 40) = 0;
      long long v8 = *(_OWORD *)(a3 - 56);
      a3 -= 56;
      *(_OWORD *)(v7 - 56) = v8;
      *(void *)(v7 - 40) = *(void *)(a3 + 16);
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(_OWORD *)(v7 - 32) = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - 16) = *(void *)(a3 + 40);
      *(void *)(a3 + 24) = 0;
      *(void *)(a3 + 32) = 0;
      *(void *)(a3 + 40) = 0;
      *(void *)(v7 - 8) = *(void *)(a3 + 48);
      uint64_t v7 = *((void *)&v14 + 1) - 56;
      *((void *)&v14 + 1) -= 56;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<abpk::HeatmapPersonData>,std::reverse_iterator<abpk::HeatmapPersonData*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](v3, v1);
      v1 += 56;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<abpk::HeatmapPersonData>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 56;
    std::allocator<abpk::HeatmapPersonData>::destroy[abi:ne180100](v4, i - 56);
  }
}

uint64_t _ZNSt3__16vectorIN4abpk17HeatmapPersonDataENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEERKffEEEPS2_DpOT_(uint64_t *a1, long long *a2, long long *a3, int *a4, int *a5)
{
  uint64_t v6 = *a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * ((a1[1] - *a1) >> 3);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x492492492492492) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = (uint64_t)(a1 + 2);
  unint64_t v14 = 0x6DB6DB6DB6DB6DB7 * ((a1[2] - v6) >> 3);
  if (2 * v14 > v8) {
    unint64_t v8 = 2 * v14;
  }
  if (v14 >= 0x249249249249249) {
    unint64_t v15 = 0x492492492492492;
  }
  else {
    unint64_t v15 = v8;
  }
  v27[4] = a1 + 2;
  unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::HeatmapPersonData>>(v13, v15);
  unint64_t v17 = &v16[56 * v7];
  v27[0] = v16;
  v27[1] = v17;
  v27[3] = &v16[56 * v18];
  uint64_t v19 = *((void *)a2 + 2);
  long long v20 = *a2;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  uint64_t v21 = *((void *)a3 + 2);
  long long v22 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  int v23 = *a4;
  int v24 = *a5;
  *(_OWORD *)unint64_t v17 = v20;
  *((void *)v17 + 2) = v19;
  *(_OWORD *)(v17 + 24) = v22;
  *((void *)v17 + 5) = v21;
  *((_DWORD *)v17 + 12) = v23;
  *((_DWORD *)v17 + 13) = v24;
  v27[2] = v17 + 56;
  std::vector<abpk::HeatmapPersonData>::__swap_out_circular_buffer(a1, v27);
  uint64_t v25 = a1[1];
  std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer(v27);
  return v25;
}

void sub_21B7E28DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<abpk::HeatmapPersonData>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v4, v13);
      unint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      unint64_t v14 = 0;
    }
    unint64_t v15 = &v14[4 * v11];
    unint64_t v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    unint64_t v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

uint64_t _ZNSt3__16vectorIN4abpk5HumanENS_9allocatorIS2_EEE24__emplace_back_slow_pathIJNS0_IDv2_fNS3_IS7_EEEENS0_IfNS3_IfEEEEEEEPS2_DpOT_(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x222222222222222) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v5) {
    unint64_t v5 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111) {
    unint64_t v8 = 0x222222222222222;
  }
  else {
    unint64_t v8 = v5;
  }
  unint64_t v16 = a1 + 2;
  if (v8) {
    uint64_t v9 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)(a1 + 2), v8);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v12 = v9;
  unint64_t v13 = &v9[120 * v4];
  unint64_t v15 = &v9[120 * v8];
  _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEENS5_IfNS0_IfEEEEEEEvPT_DpOT0_((uint64_t)(a1 + 2), (uint64_t)v13, a2, a3);
  unint64_t v14 = v13 + 120;
  std::vector<abpk::Human>::__swap_out_circular_buffer(a1, &v12);
  uint64_t v10 = a1[1];
  std::__split_buffer<abpk::Human>::~__split_buffer(&v12);
  return v10;
}

void sub_21B7E2B18(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<abpk::Human>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void _ZNSt3__19allocatorIN4abpk5HumanEE9constructB8ne180100IS2_JNS_6vectorIDv2_fNS0_IS6_EEEENS5_IfNS0_IfEEEEEEEvPT_DpOT0_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a3;
  uint64_t v7 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  *(_OWORD *)__n128 __p = *(_OWORD *)a4;
  uint64_t v5 = *(void *)(a4 + 16);
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)a4 = 0;
  abpk::Human::Human(a2, v6, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
}

void sub_21B7E2BB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<abpk::HeatmapPersonData *,abpk::HeatmapPersonData *,abpk::HeatmapPersonData *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    std::vector<float>::__move_assign(a4, (__n128 *)v5);
    std::vector<float>::__move_assign(a4 + 24, (__n128 *)(v5 + 24));
    *(void *)(a4 + 48) = *(void *)(v5 + 48);
    a4 += 56;
    v5 += 56;
  }
  while (v5 != v6);
  return v6;
}

void sub_21B7E30BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E369C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void **a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  a19 = (void **)&a23;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&a19);

  _Unwind_Resume(a1);
}

void sub_21B7E37E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7E38E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7E39B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7E3A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7E3B18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7E3C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E3DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<abpk::Human>::__vdeallocate(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    unint64_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 120;
        std::allocator<abpk::Human>::destroy[abi:ne180100]((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      unint64_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_21B7E4688(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E47F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E493C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E49E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4C40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7E4E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7E4FBC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

float64x2_t btr::ProjectPoints@<Q0>(double **a1@<X0>, uint64_t a2@<X1>, float64x2_t **a3@<X8>)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  std::vector<cva::Matrix<double,2u,1u,false>>::vector(a3, 0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1));
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if (*a1 != v7)
  {
    size_t v8 = *a3;
    uint64_t v9 = a2 + 168;
    do
    {
      v15[0] = a2 + 72;
      v15[1] = 4;
      v16[0] = (double *)v15;
      v16[1] = v6;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      v19.f64[1] = 0.0;
      cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)&v19.f64[1], v16);
      long long v13 = 0uLL;
      uint64_t v14 = 0;
      if ((long long *)(a2 + 72) == &v13)
      {
        uint64_t v11 = 0;
        long long v17 = 0uLL;
        uint64_t v18 = 0;
        do
        {
          *(double *)((char *)&v17 + v11 * 8) = v19.f64[v11 + 1] + *(double *)(v9 + v11 * 8);
          ++v11;
        }
        while (v11 != 3);
        long long v13 = v17;
        uint64_t v14 = v18;
      }
      else
      {
        for (uint64_t i = 0; i != 3; ++i)
          *(double *)((char *)&v13 + i * 8) = v19.f64[i + 1] + *(double *)(v9 + i * 8);
      }
      *(void *)&long long v17 = a2;
      *((void *)&v17 + 1) = &v13;
      uint64_t v20 = 0;
      float64x2_t v19 = 0uLL;
      cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::Matrix<double,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)&v19, (uint64_t *)&v17);
      float64x2_t result = vdivq_f64(v19, (float64x2_t)vdupq_lane_s64(v20, 0));
      *v8++ = result;
      v6 += 3;
    }
    while (v6 != v7);
  }
  return result;
}

void sub_21B7E5168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = *(void **)a10;
  if (*(void *)a10)
  {
    *(void *)(a10 + 8) = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

double btr::ComputeReprojectionAvg(btr *this, const CameraPoseInfo *a2, const Correspondences2d3d *a3)
{
  btr::ProjectPoints((double **)&a2->camera_matrix.m_data[3], (uint64_t)this, (float64x2_t **)__p);
  double v4 = a2->camera_matrix.m_data[0];
  uint64_t v5 = *(void *)&a2->camera_matrix.m_data[1] - *(void *)&a2->camera_matrix.m_data[0];
  unint64_t v6 = v5 >> 4;
  int v7 = 0;
  if (!v5)
  {
    double v11 = 0.0;
    if (!__p[0]) {
      return v11 / (double)(v6 - v7);
    }
    goto LABEL_12;
  }
  if (v6 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v5 >> 4;
  }
  uint64_t v9 = (double *)(*(void *)&v4 + 8);
  uint64_t v10 = (double *)((char *)__p[0] + 8);
  double v11 = 0.0;
  do
  {
    double v12 = *(v9 - 1);
    if (v12 <= 0.0 || *v9 <= 0.0) {
      ++v7;
    }
    else {
      double v11 = v11 + sqrt((v12 - *(v10 - 1)) * (v12 - *(v10 - 1)) + (*v9 - *v10) * (*v9 - *v10));
    }
    v9 += 2;
    v10 += 2;
    --v8;
  }
  while (v8);
  if (__p[0])
  {
LABEL_12:
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v11 / (double)(v6 - v7);
}

double btr::ComputeTotalBoneLength(uint64_t *a1)
{
  uint64_t v1 = *a1;
  double result = 0.0;
  if (a1[1] - *a1 == 384)
  {
    uint64_t v3 = &btr::kBonesVertices;
    do
    {
      int v4 = *v3;
      int v5 = v3[1];
      v3 += 2;
      uint64_t v6 = v1 + 24 * v4;
      uint64_t v7 = v1 + 24 * v5;
      float64x2_t v8 = vsubq_f64(*(float64x2_t *)(v6 + 8), *(float64x2_t *)(v7 + 8));
      float64x2_t v9 = vmulq_f64(v8, v8);
      double result = result + sqrt((*(double *)v6 - *(double *)v7) * (*(double *)v6 - *(double *)v7) + v9.f64[0] + v9.f64[1]);
    }
    while (v3 != (int *)&xmmword_21B813BA8);
  }
  return result;
}

void btr::BodyRegistration::RegisterBody(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, float32x2_t *a8@<X7>, uint64_t a9@<X8>)
{
  *(_OWORD *)(a9 + 152) = xmmword_21B813C50;
  *(_OWORD *)(a9 + 168) = unk_21B813C60;
  *(_OWORD *)(a9 + 184) = xmmword_21B813C70;
  *(_OWORD *)(a9 + 200) = unk_21B813C80;
  *(_OWORD *)(a9 + 88) = xmmword_21B813C10;
  *(_OWORD *)(a9 + 104) = unk_21B813C20;
  *(_OWORD *)(a9 + 120) = xmmword_21B813C30;
  *(_OWORD *)(a9 + 16) = 0u;
  uint64_t v10 = a9 + 16;
  *(_DWORD *)a9 = 5;
  *(_OWORD *)(a9 + 32) = 0u;
  *(_OWORD *)(a9 + 48) = 0u;
  *(_OWORD *)(a9 + 64) = 0u;
  *(void *)(a9 + 80) = 0;
  *(_OWORD *)(a9 + 136) = unk_21B813C40;
  *(_OWORD *)(a9 + 224) = 0u;
  uint64_t v11 = a9 + 224;
  *(_OWORD *)(a9 + 288) = 0u;
  double v12 = (void **)(a9 + 288);
  *(_OWORD *)(a9 + 304) = 0u;
  *(_OWORD *)(a9 + 320) = 0u;
  *(_OWORD *)(a9 + 256) = 0u;
  *(_OWORD *)(a9 + 272) = 0u;
  int v13 = 1;
  *(_OWORD *)(v11 + 16) = 0u;
  if (!a2 || !a4 || !a6 || (int v13 = 2, !a3) || !a5 || !a7)
  {
    *(_DWORD *)a9 = v13;
    *(_DWORD *)a1 = v13;
    uint64_t v51 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_WORD *)int v97 = 0;
    uint64_t v52 = " Failed to find 2d-3d correspondences ";
    uint64_t v53 = v97;
    long long v54 = v51;
    os_log_type_t v55 = OS_LOG_TYPE_ERROR;
    goto LABEL_52;
  }
  uint64_t v88 = v10;
  std::vector<cva::Matrix<double,2u,1u,false>>::reserve(v12, a3);
  long long v17 = (char **)(v11 + 88);
  std::vector<cva::Matrix<double,3u,1u,false>>::reserve((void **)(v11 + 88), a3);
  unint64_t v86 = (_OWORD *)v11;
  uint64_t v18 = 0;
  uint64_t v84 = (_OWORD *)(a9 + 88);
  float64x2_t v19 = (void *)(a9 + 304);
  uint64_t v20 = *(float64x2_t **)(a9 + 296);
  do
  {
    float64x2_t v21 = vcvtq_f64_f32(*(float32x2_t *)(a2 + 8 * v18));
    if ((unint64_t)v20 >= *v19)
    {
      float64x2_t v90 = v21;
      uint64_t v22 = ((char *)v20 - (unsigned char *)*v12) >> 4;
      if ((unint64_t)(v22 + 1) >> 60) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v23 = *v19 - (void)*v12;
      uint64_t v24 = v23 >> 3;
      if (v23 >> 3 <= (unint64_t)(v22 + 1)) {
        uint64_t v24 = v22 + 1;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25) {
        float v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(a9 + 304, v25);
      }
      else {
        float v26 = 0;
      }
      char v27 = (float64x2_t *)&v26[16 * v22];
      *char v27 = v90;
      uint64_t v20 = v27 + 1;
      float v29 = *(float64x2_t **)(a9 + 288);
      BOOL v28 = *(float64x2_t **)(a9 + 296);
      if (v28 != v29)
      {
        do
        {
          v27[-1] = v28[-1];
          --v27;
          --v28;
        }
        while (v28 != v29);
        BOOL v28 = (float64x2_t *)*v12;
      }
      *(void *)(a9 + 288) = v27;
      *(void *)(a9 + 296) = v20;
      *(void *)(a9 + 304) = &v26[16 * v25];
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      *v20++ = v21;
    }
    *(void *)(a9 + 296) = v20;
    ++v18;
  }
  while (v18 != a3);
  uint64_t v85 = v12;
  unint64_t v30 = 0;
  unint64_t v31 = (void *)(a9 + 328);
  unint64_t v32 = *(float64x2_t **)(a9 + 320);
  do
  {
    if (v30 <= 6) {
      unint64_t v33 = v30;
    }
    else {
      unint64_t v33 = v30 + 1;
    }
    float32x2_t v34 = (float32x2_t *)(a4 + 16 * v33);
    double v35 = v34[1].f32[0];
    float64x2_t v36 = vcvtq_f64_f32(*v34);
    if ((unint64_t)v32 >= *v31)
    {
      float64x2_t v91 = v36;
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * (((char *)v32 - *v17) >> 3);
      unint64_t v38 = v37 + 1;
      if (v37 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * ((uint64_t)(*v31 - (void)*v17) >> 3) > v38) {
        unint64_t v38 = 0x5555555555555556 * ((uint64_t)(*v31 - (void)*v17) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v31 - (void)*v17) >> 3) >= 0x555555555555555) {
        unint64_t v39 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v39 = v38;
      }
      if (v39) {
        float v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(a9 + 328, v39);
      }
      else {
        float v40 = 0;
      }
      float v41 = &v40[24 * v37];
      *(float64x2_t *)float v41 = v91;
      *((double *)v41 + 2) = v35;
      uint64_t v43 = *(char **)(a9 + 312);
      uint64_t v42 = *(char **)(a9 + 320);
      uint64_t v44 = v41;
      if (v42 != v43)
      {
        do
        {
          long long v45 = *(_OWORD *)(v42 - 24);
          *((void *)v44 - 1) = *((void *)v42 - 1);
          *(_OWORD *)(v44 - 24) = v45;
          v44 -= 24;
          v42 -= 24;
        }
        while (v42 != v43);
        uint64_t v42 = *v17;
      }
      unint64_t v32 = (float64x2_t *)(v41 + 24);
      *(void *)(a9 + 312) = v44;
      *(void *)(a9 + 320) = v41 + 24;
      *(void *)(a9 + 328) = &v40[24 * v39];
      if (v42) {
        operator delete(v42);
      }
    }
    else
    {
      *unint64_t v32 = v36;
      v32[1].f64[0] = v35;
      unint64_t v32 = (float64x2_t *)((char *)v32 + 24);
    }
    *(void *)(a9 + 320) = v32;
    ++v30;
  }
  while (v30 != a3);
  *(_DWORD *)a9 = 0;
  if (*(_DWORD *)a1)
  {
    long long v47 = (CameraPoseInfo *)v85;
    uint64_t v46 = v86;
    uint64_t v48 = v88;
    uint64_t v49 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v49, OS_LOG_TYPE_DEBUG, " Previous body-camera registration failed. Reinitializing.. ", buf, 2u);
    }
    *(void *)(a9 + 200) = 0x3FF0000000000000;
  }
  else
  {
    long long v47 = (CameraPoseInfo *)v85;
    uint64_t v46 = v86;
    uint64_t v48 = v88;
    float16x4_t v56 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v96 = 0;
      _os_log_impl(&dword_21B7C6000, v56, OS_LOG_TYPE_DEBUG, " Previous body-camera registration successful. Initializing with previos pose.. ", v96, 2u);
    }
    if (a9 != a1)
    {
      long long v57 = *(_OWORD *)(a1 + 64);
      *(_OWORD *)(v88 + 32) = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(v88 + 48) = v57;
      *(void *)(v88 + 64) = *(void *)(a1 + 80);
      long long v58 = *(_OWORD *)(a1 + 32);
      *(_OWORD *)uint64_t v88 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)(v88 + 16) = v58;
      long long v59 = *(_OWORD *)(a1 + 168);
      *(_OWORD *)(a9 + 152) = *(_OWORD *)(a1 + 152);
      *(_OWORD *)(a9 + 168) = v59;
      long long v60 = *(_OWORD *)(a1 + 200);
      *(_OWORD *)(a9 + 184) = *(_OWORD *)(a1 + 184);
      *(_OWORD *)(a9 + 200) = v60;
      long long v61 = *(_OWORD *)(a1 + 104);
      _OWORD *v84 = *(_OWORD *)(a1 + 88);
      *(_OWORD *)(a9 + 104) = v61;
      long long v62 = *(_OWORD *)(a1 + 136);
      *(_OWORD *)(a9 + 120) = *(_OWORD *)(a1 + 120);
      *(_OWORD *)(a9 + 136) = v62;
    }
    long long v63 = *(_OWORD *)(a1 + 240);
    *unint64_t v86 = *(_OWORD *)(a1 + 224);
    v86[1] = v63;
    long long v64 = *(_OWORD *)(a1 + 272);
    v86[2] = *(_OWORD *)(a1 + 256);
    v86[3] = v64;
  }
  double v65 = a8[1].f32[0];
  double v66 = a8[3].f32[0];
  double v67 = a8[5].f32[0];
  *(float64x2_t *)(a9 + 16) = vcvtq_f64_f32(*a8);
  *(double *)(a9 + 32) = v65;
  *(float64x2_t *)(a9 + 40) = vcvtq_f64_f32(a8[2]);
  *(double *)(a9 + 56) = v66;
  *(float64x2_t *)(a9 + 64) = vcvtq_f64_f32(a8[4]);
  *(double *)(a9 + 80) = v67;
  *(_DWORD *)a9 = v68;
  if (!v68) {
    goto LABEL_65;
  }
  size_t v69 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v94 = 0;
    _os_log_impl(&dword_21B7C6000, v69, OS_LOG_TYPE_DEBUG, " Trying with a different init pose ", v94, 2u);
  }
  *(void *)(a9 + 200) = 0x3FE0000000000000;
  *(_DWORD *)a9 = v71;
  if (v71)
  {
    *(_DWORD *)a1 = v71;
    uint64_t v72 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      __int16 v92 = 0;
      uint64_t v52 = " Registration Failed with a different init pose ";
      uint64_t v53 = (uint8_t *)&v92;
      long long v54 = v72;
      os_log_type_t v55 = OS_LOG_TYPE_DEBUG;
LABEL_52:
      _os_log_impl(&dword_21B7C6000, v54, v55, v52, v53, 2u);
    }
  }
  else
  {
LABEL_65:
    unint64_t v73 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v93 = 0;
      _os_log_impl(&dword_21B7C6000, v73, OS_LOG_TYPE_DEBUG, " Registration successful ", v93, 2u);
    }
    *(_DWORD *)a1 = *(_DWORD *)a9;
    if (a1 != a9)
    {
      long long v74 = *(_OWORD *)(v48 + 48);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(v48 + 32);
      *(_OWORD *)(a1 + 64) = v74;
      *(void *)(a1 + 80) = *(void *)(v48 + 64);
      long long v75 = *(_OWORD *)(v48 + 16);
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v48;
      *(_OWORD *)(a1 + 32) = v75;
      long long v76 = *(_OWORD *)(a9 + 168);
      *(_OWORD *)(a1 + 152) = *(_OWORD *)(a9 + 152);
      *(_OWORD *)(a1 + 168) = v76;
      long long v77 = *(_OWORD *)(a9 + 200);
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a9 + 184);
      *(_OWORD *)(a1 + 200) = v77;
      long long v78 = *(_OWORD *)(a9 + 104);
      *(_OWORD *)(a1 + 88) = *v84;
      *(_OWORD *)(a1 + 104) = v78;
      long long v79 = *(_OWORD *)(a9 + 136);
      *(_OWORD *)(a1 + 120) = *(_OWORD *)(a9 + 120);
      *(_OWORD *)(a1 + 136) = v79;
      long long v80 = v46[3];
      *(_OWORD *)(a1 + 256) = v46[2];
      *(_OWORD *)(a1 + 272) = v80;
      long long v81 = v46[1];
      uint64_t v82 = *(long long **)(a9 + 288);
      int v83 = *(long long **)(a9 + 296);
      *(_OWORD *)(a1 + 224) = *v46;
      *(_OWORD *)(a1 + 240) = v81;
      std::vector<cva::Matrix<double,2u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,2u,1u,false>*,cva::Matrix<double,2u,1u,false>*>((long long **)(a1 + 288), v82, v83, v83 - v82);
      std::vector<cva::Matrix<double,3u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,3u,1u,false>*,cva::Matrix<double,3u,1u,false>*>((void *)(a1 + 312), *(void **)(a9 + 312), *(void **)(a9 + 320), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a9 + 320) - *(void *)(a9 + 312)) >> 3));
    }
  }
}

void sub_21B7E5950(_Unwind_Exception *a1)
{
  btr::BodyRegistrationInfo::~BodyRegistrationInfo(v1);
  _Unwind_Resume(a1);
}

uint64_t btr::anonymous namespace'::EstimatePoseFromCorrespondences(btr::_anonymous_namespace_ *this, CameraPoseInfo *a2, const Correspondences2d3d *a3)
{
  unint64_t v5 = (uint64_t)(*(void *)&a2->camera_matrix.m_data[1] - *(void *)&a2->camera_matrix.m_data[0]) >> 4;
  int v6 = 0;
  if (*(void *)&a2->camera_matrix.m_data[1] != *(void *)&a2->camera_matrix.m_data[0])
  {
    if (v5 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = (uint64_t)(*(void *)&a2->camera_matrix.m_data[1] - *(void *)&a2->camera_matrix.m_data[0]) >> 4;
    }
    float64x2_t v8 = (double *)(*(void *)&a2->camera_matrix.m_data[0] + 8);
    do
    {
      if (*(v8 - 1) <= 0.0 || *v8 <= 0.0) {
        ++v6;
      }
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::vector(v62, v5 - v6);
  double v9 = a2->camera_matrix.m_data[0];
  if (*(void *)&a2->camera_matrix.m_data[1] != *(void *)&a2->camera_matrix.m_data[0])
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    int v12 = 0;
    unint64_t v13 = 0;
    do
    {
      double v14 = *(double *)(*(void *)&v9 + v11);
      if (v14 <= 0.0 || (double v15 = *(double *)(*(void *)&v9 + v11 + 8), v15 <= 0.0))
      {
        float64x2_t v21 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_DEBUG, " ABPKRegistrationUtils: Skipping because of invisible joints ", buf, 2u);
        }
      }
      else
      {
        double v16 = (v14 - *((double *)this + 6)) / *(double *)this;
        double v17 = (v15 - *((double *)this + 7)) / *((double *)this + 4);
        uint64_t v18 = (long long *)(*(void *)&a2->camera_matrix.m_data[3] + v10);
        long long v19 = *v18;
        uint64_t v20 = (char *)v62[0] + 40 * v12;
        *((void *)v20 + 2) = *((void *)v18 + 2);
        *(_OWORD *)uint64_t v20 = v19;
        ++v12;
        *((double *)v20 + 3) = v16;
        *((double *)v20 + 4) = v17;
      }
      ++v13;
      double v9 = a2->camera_matrix.m_data[0];
      v11 += 16;
      v10 += 24;
    }
    while (v13 < (uint64_t)(*(void *)&a2->camera_matrix.m_data[1] - *(void *)&a2->camera_matrix.m_data[0]) >> 4);
  }
  *(void *)buf = 0x6400000000;
  long long v34 = xmmword_21B813B20;
  int v35 = 3;
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v59 = 0;
  uint64_t v58 = 0;
  uint64_t v32 = 0;
  int v22 = cva::PoseRefiner<double>::refinePose((uint64_t)buf, (uint64_t *)v62, (uint64_t)this + 72, (double *)&v32);
  *(float32x2_t *)&long long v23 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 72));
  *(float *)&unsigned int v24 = *((double *)this + 11);
  *((void *)&v23 + 1) = v24;
  *(float32x2_t *)&long long v25 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 104));
  *(float *)&unsigned int v26 = *((double *)this + 15);
  *((void *)&v25 + 1) = v26;
  *(float32x2_t *)&long long v27 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 136));
  *(float *)&unsigned int v28 = *((double *)this + 19);
  *((void *)&v27 + 1) = v28;
  *(float32x2_t *)&long long v29 = vcvt_f32_f64(*(float64x2_t *)((char *)this + 168));
  *(float *)&unsigned int v30 = *((double *)this + 23);
  *((void *)&v29 + 1) = __PAIR64__(1.0, v30);
  *((_OWORD *)this + 13) = v23;
  *((_OWORD *)this + 14) = v25;
  *((_OWORD *)this + 15) = v27;
  *((_OWORD *)this + 16) = v29;
  cva::PoseRefiner<double>::~PoseRefiner(buf);
  if (v62[0])
  {
    v62[1] = v62[0];
    operator delete(v62[0]);
  }
  if (v22) {
    return 0;
  }
  else {
    return 4;
  }
}

void sub_21B7E5C6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  unint64_t v13 = *(void **)(v11 - 120);
  if (v13)
  {
    *(void *)(v11 - 112) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

void btr::BodyRegistrationInfo::~BodyRegistrationInfo(btr::BodyRegistrationInfo *this)
{
  uint64_t v2 = (void *)*((void *)this + 39);
  if (v2)
  {
    *((void *)this + 40) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 36);
  if (v3)
  {
    *((void *)this + 37) = v3;
    operator delete(v3);
  }
}

void std::vector<cva::Matrix<double,2u,1u,false>>::reserve(void **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    int v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    double v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    int v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<cva::Matrix<double,3u,1u,false>>::reserve(void **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    int v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>(v3, a2);
    uint64_t v7 = &v6[24 * v5];
    double v9 = &v6[24 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    int v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t cva::PoseRefiner<double>::refinePose(uint64_t a1, uint64_t *a2, uint64_t a3, double *a4)
{
  uint64_t v8 = (double **)(a1 + 400);
  unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3);
  long long v41 = a2;
  if (v9 > (uint64_t)(*(void *)(a1 + 408) - *(void *)(a1 + 400)) >> 3)
  {
    std::vector<double>::resize(a1 + 400, v9);
    unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3);
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 40) - *(void *)(a1 + 32)) >> 4) < v9) {
    std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::resize((uint64_t *)(a1 + 32), v9);
  }
  uint64_t v10 = a2;
  if (*(int *)(a1 + 4) < 1) {
    return 1;
  }
  for (int i = 0; i < *(_DWORD *)(a1 + 4); ++i)
  {
    cva::PoseRefiner<double>::computeError(a1, v10, a3);
    unint64_t v12 = *(unsigned int *)(a1 + 392);
    BOOL v13 = v12 > 4;
    if (v12 < 5) {
      break;
    }
    double v14 = 0.0;
    long long v15 = 0uLL;
    if (*(_DWORD *)a1 == 1)
    {
      double v16 = a4;
      double v17 = *v8;
      uint64_t v18 = *v8;
      uint64_t v19 = *(unsigned int *)(a1 + 392);
      do
      {
        double v20 = *v18;
        if (*v18 < 0.0) {
          double v20 = -*v18;
        }
        *v18++ = v20;
        --v19;
      }
      while (v19);
      double v21 = std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v17, &v17[v12 >> 1], &v17[v12], v20);
      int v22 = *v8;
      double v23 = (*v8)[v12 >> 1];
      if (v12)
      {
        long long v15 = 0uLL;
      }
      else
      {
        uint64_t v24 = (v12 >> 1) - 1;
        if (v24 != v12)
        {
          std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(v22, &v22[v24], &v22[v12], v21);
          int v22 = *v8;
        }
        long long v15 = 0uLL;
        double v23 = (v23 + v22[v24]) * 0.5;
      }
      double v14 = v23 * 3.0;
      a4 = v16;
      uint64_t v10 = v41;
      if (v23 * 3.0 < 1.0e-10) {
        double v14 = 1.0e-10;
      }
    }
    *(_OWORD *)(a1 + 360) = v15;
    *(_OWORD *)(a1 + 376) = v15;
    *(_OWORD *)(a1 + 328) = v15;
    *(_OWORD *)(a1 + 344) = v15;
    *(_OWORD *)(a1 + 296) = v15;
    *(_OWORD *)(a1 + 312) = v15;
    *(_OWORD *)(a1 + 264) = v15;
    *(_OWORD *)(a1 + 280) = v15;
    *(_OWORD *)(a1 + 232) = v15;
    *(_OWORD *)(a1 + 248) = v15;
    *(_OWORD *)(a1 + 200) = v15;
    *(_OWORD *)(a1 + 216) = v15;
    *(_OWORD *)(a1 + 168) = v15;
    *(_OWORD *)(a1 + 184) = v15;
    *(_OWORD *)(a1 + 136) = v15;
    *(_OWORD *)(a1 + 152) = v15;
    *(_OWORD *)(a1 + 104) = v15;
    *(_OWORD *)(a1 + 120) = v15;
    *(_OWORD *)(a1 + 72) = v15;
    *(_OWORD *)(a1 + 88) = v15;
    *(_OWORD *)(a1 + 56) = v15;
    cva::PoseRefiner<double>::accumuateJacobian(a1, a4, v14);
    long long v25 = *(_OWORD *)(a1 + 360);
    *(_OWORD *)long long v47 = *(_OWORD *)(a1 + 344);
    *(_OWORD *)&v47[16] = v25;
    *(_OWORD *)&v47[32] = *(_OWORD *)(a1 + 376);
    memcpy(__dst, (const void *)(a1 + 56), sizeof(__dst));
    if (!cva::ldlt<double,6u,1u>()) {
      return 0;
    }
    long long v26 = *(_OWORD *)v47;
    double v42 = *(double *)&v47[16];
    long long v44 = *(_OWORD *)&v47[24];
    double v45 = *(double *)&v47[40];
    float64x2_t v48 = (float64x2_t)xmmword_21B813BA8;
    long long v49 = unk_21B813BB8;
    long long v50 = xmmword_21B813BC8;
    long long v51 = unk_21B813BD8;
    *(void *)&long long v52 = 0x3FF0000000000000;
    float64x2_t v27 = vmulq_f64(*(float64x2_t *)&v47[8], *(float64x2_t *)&v47[8]);
    cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(&v56, *(double *)&v26 * *(double *)&v26 + v27.f64[0] + v27.f64[1]);
    *(double *)&long long v52 = v56 + v58 * v42 * v42;
    double v28 = *(double *)&v26 * v58 * *((double *)&v26 + 1);
    double v29 = *(double *)&v26 * v58 * v42;
    double v30 = v58 * *((double *)&v26 + 1) * v42;
    v48.f64[0] = v56 + *(double *)&v26 * v58 * *(double *)&v26;
    v48.f64[1] = v28 + v57 * v42;
    *(double *)&long long v51 = v57 * *((double *)&v26 + 1) + v29;
    *((double *)&v51 + 1) = v30 - *(double *)&v26 * v57;
    *((double *)&v49 + 1) = v28 - v57 * v42;
    *(double *)&long long v49 = v29 - v57 * *((double *)&v26 + 1);
    *(double *)&long long v50 = v56 + v58 * *((double *)&v26 + 1) * *((double *)&v26 + 1);
    *((double *)&v50 + 1) = *(double *)&v26 * v57 + v30;
    cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage(v43, (uint64_t *)&v48, (uint64_t)&v44);
    double v56 = COERCE_DOUBLE(v43);
    double v57 = *(double *)&a3;
    float64x2_t v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    cva::assign<false,false,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>>(&v48, (float64x2_t **)&v56);
    long long v31 = v53;
    *(_OWORD *)(a3 + 64) = v52;
    *(_OWORD *)(a3 + 80) = v31;
    long long v32 = v55;
    *(_OWORD *)(a3 + 96) = v54;
    *(_OWORD *)(a3 + 112) = v32;
    long long v33 = v49;
    *(float64x2_t *)a3 = v48;
    *(_OWORD *)(a3 + 16) = v33;
    long long v34 = v51;
    *(_OWORD *)(a3 + 32) = v50;
    *(_OWORD *)(a3 + 48) = v34;
    cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::log(a3, (uint64_t)&v56);
    double v35 = v56 * v56 + v57 * v57 + v58 * v58;
    if (v35 >= 9.8706044) {
      cva::PoseRefiner<double>::refinePose();
    }
    long long v52 = xmmword_21B813C50;
    long long v53 = unk_21B813C60;
    long long v54 = xmmword_21B813C70;
    long long v55 = unk_21B813C80;
    float64x2_t v48 = (float64x2_t)xmmword_21B813C10;
    long long v49 = unk_21B813C20;
    long long v50 = xmmword_21B813C30;
    long long v51 = unk_21B813C40;
    cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(v59, v35);
    cva::computeExponentialMatrix<double,cva::Matrix<double,6u,1u,false>,cva::Matrix<double,4u,4u,false>>((uint64_t *)&v56, v59, (uint64_t)&v48);
    long long v36 = v53;
    *(_OWORD *)(a3 + 64) = v52;
    *(_OWORD *)(a3 + 80) = v36;
    long long v37 = v55;
    *(_OWORD *)(a3 + 96) = v54;
    *(_OWORD *)(a3 + 112) = v37;
    long long v38 = v49;
    *(float64x2_t *)a3 = v48;
    *(_OWORD *)(a3 + 16) = v38;
    long long v39 = v51;
    *(_OWORD *)(a3 + 32) = v50;
    *(_OWORD *)(a3 + 48) = v39;
    if (i >= *(_DWORD *)(a1 + 24)
      && sqrt(*(double *)&v26 * *(double *)&v26 + *((double *)&v26 + 1) * *((double *)&v26 + 1) + v42 * v42) < *(double *)(a1 + 8)
      && sqrt(*(double *)&v44 * *(double *)&v44 + *((double *)&v44 + 1) * *((double *)&v44 + 1) + v45 * v45) < *(double *)(a1 + 16))
    {
      return 1;
    }
  }
  return v13;
}

void *std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    size_t v5 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_21B7E63AC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::resize(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__append(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + 80 * a2;
  }
}

void cva::PoseRefiner<double>::computeError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *(_DWORD *)(a1 + 392) = 0;
  uint64_t v3 = *a2;
  if (a2[1] != *a2)
  {
    unint64_t v7 = 0;
    uint64_t v8 = a3 + 96;
    do
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v28[0] = a3;
      v28[1] = 4;
      v29[0] = (double *)v28;
      v29[1] = (double *)(v3 + 40 * v7);
      memset(v30, 0, 24);
      cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)v30, v29);
      uint64_t v10 = 0;
      long long v26 = 0uLL;
      uint64_t v27 = 0;
      do
      {
        *(double *)((char *)&v26 + v10 * 8) = *(double *)&v29[v10 + 3] + *(double *)(v8 + v10 * 8);
        ++v10;
      }
      while (v10 != 3);
      char v11 = 0;
      uint64_t v12 = v9 + 80 * v7;
      *(void *)(v12 + 24) = v27;
      *(_OWORD *)(v12 + 8) = v26;
      double v13 = *(double *)(v12 + 24);
      if (v13 < 0.0) {
        double v14 = -1.0e-15;
      }
      else {
        double v14 = 1.0e-15;
      }
      if (v13 > -1.0e-15 && v13 < 1.0e-15) {
        double v13 = v14;
      }
      double v16 = 1.0 / v13;
      double v17 = *(double *)(v12 + 8) * (1.0 / v13);
      double v18 = *(double *)(v12 + 16) * (1.0 / v13);
      *(double *)(v12 + 32) = v17;
      *(double *)(v12 + 40) = v18;
      *(double *)(v12 + 48) = v16;
      if (v16 >= 0.0 && v16 <= 1.0e14)
      {
        uint64_t v19 = v3 + 40 * v7;
        double v20 = *(double *)(v19 + 24) - v17;
        double v21 = (double *)(v9 + 80 * v7);
        v21[7] = v20;
        double v22 = *(double *)(v19 + 32) - v18;
        if (v20 < 0.0) {
          double v20 = -v20;
        }
        double v23 = -v22;
        if (v22 >= 0.0) {
          double v23 = v22;
        }
        double v24 = v20 + v23;
        v21[8] = v22;
        v21[9] = v24;
        uint64_t v25 = *(unsigned int *)(a1 + 392);
        *(double *)(*(void *)(a1 + 400) + 8 * v25) = v24;
        *(_DWORD *)(a1 + 392) = v25 + 1;
        char v11 = 1;
      }
      *(unsigned char *)uint64_t v12 = v11;
      ++v7;
      uint64_t v3 = *a2;
    }
    while (v7 < 0xCCCCCCCCCCCCCCCDLL * ((a2[1] - *a2) >> 3));
  }
}

uint64_t cva::PoseRefiner<double>::accumuateJacobian(uint64_t result, double *a2, double a3)
{
  *a2 = 0.0;
  unint64_t v3 = *(unsigned int *)(result + 392);
  if (v3)
  {
    unint64_t v4 = 0;
    double v58 = a3 * a3;
    size_t v5 = (double *)(*(void *)(result + 32) + 72);
    double v62 = 0.0;
    double v63 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    double v73 = 0.0;
    double v74 = 0.0;
    double v19 = 0.0;
    double v71 = 0.0;
    double v72 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v22 = 0.0;
    double v68 = 0.0;
    double v70 = 0.0;
    double v65 = 0.0;
    double v66 = 0.0;
    double v23 = 0.0;
    double v64 = 0.0;
    do
    {
      if (*((unsigned char *)v5 - 72))
      {
        ++v4;
        double v24 = *v5;
        double v25 = 1.0;
        if (*(_DWORD *)result != 1
          || v24 * v24 < v58 && (double v25 = (1.0 - v24 * v24 / v58) * (1.0 - v24 * v24 / v58), v25 >= 0.00000001))
        {
          double v26 = -v24;
          if (v24 >= 0.0) {
            double v26 = *v5;
          }
          double v61 = v23 + v25 * v26;
          *a2 = v61;
          double v27 = *(v5 - 3);
          double v28 = *(v5 - 8);
          double v29 = *(v5 - 7);
          double v30 = v27 * v27 * (v28 * v29);
          double v31 = v28 * v28 * (v27 * v27) + 1.0;
          double v32 = -(v29 * v29) * (v27 * v27) + -1.0;
          double v33 = -(v29 * v27);
          double v34 = -(v29 * (v27 * v27));
          double v35 = -(v28 * (v27 * v27));
          double v36 = -(v30 * v25);
          double v37 = v63 - v36 * v30;
          double v38 = v6 + v36 * v31;
          double v39 = v7 + v36 * v33;
          double v60 = v8 + v36 * v27;
          double v59 = v9 + v36 * 0.0;
          double v40 = v10 + v36 * v35;
          double v41 = v62 + v25 * v31 * v31;
          double v42 = v11 + v25 * v31 * v33;
          double v43 = v12 + v25 * v31 * v27;
          double v44 = v13 + v25 * v31 * 0.0;
          double v45 = v14 + v25 * v31 * v35;
          double v46 = v15 + v25 * v33 * v33;
          double v47 = v16 + v25 * v33 * v27;
          double v48 = v17 + v25 * v33 * 0.0;
          double v49 = v18 + v25 * v33 * v35;
          double v50 = v25 * *(v5 - 2);
          double v67 = v66 + v50 * v31;
          double v69 = v68 + v50 * v33;
          double v51 = v22 + v50 * v35;
          double v52 = v64 - v50 * v30;
          double v53 = v70 + v50 * v27;
          double v54 = v71 + v50 * 0.0;
          double v55 = v27 * v28;
          double v63 = v37 + v25 * v32 * v32;
          double v9 = v59 + v25 * v32 * v27;
          double v10 = v40 + v25 * v32 * v34;
          double v62 = v41 + v25 * v30 * v30;
          double v11 = v42 + v25 * v30 * v55;
          double v12 = v43 + v25 * v30 * 0.0;
          double v13 = v44 + v25 * v30 * v27;
          double v14 = v45 + v25 * v30 * v34;
          double v15 = v46 + v25 * v55 * v55;
          double v16 = v47 + v25 * v55 * 0.0;
          double v17 = v48 + v25 * v55 * v27;
          double v18 = v49 + v25 * v55 * v34;
          double v74 = v74 + v25 * v27 * v27 + v25 * 0.0 * 0.0;
          double v73 = v73 + v25 * v27 * 0.0 + v25 * 0.0 * v27;
          double v7 = v39 + v25 * v32 * v55;
          double v19 = v19 + v25 * v27 * v35 + v25 * 0.0 * v34;
          double v6 = v38 + v25 * v32 * v30;
          double v8 = v60 + v25 * v32 * 0.0;
          double v72 = v72 + v25 * 0.0 * 0.0 + v25 * v27 * v27;
          double v20 = v20 + v25 * 0.0 * v35 + v25 * v27 * v34;
          double v21 = v21 + v25 * v35 * v35 + v25 * v34 * v34;
          double v65 = v65 + v25;
          double v56 = v25 * *(v5 - 1);
          double v64 = v52 + v56 * v32;
          double v66 = v67 + v56 * v30;
          double v68 = v69 + v56 * v55;
          double v22 = v51 + v56 * v34;
          double v23 = v61;
          double v70 = v53 + v56 * 0.0;
          double v71 = v54 + v56 * v27;
        }
      }
      v5 += 10;
    }
    while (v4 < v3);
  }
  else
  {
    double v62 = 0.0;
    double v63 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v17 = 0.0;
    double v18 = 0.0;
    double v73 = 0.0;
    double v74 = 0.0;
    double v19 = 0.0;
    double v71 = 0.0;
    double v72 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    double v66 = 0.0;
    double v68 = 0.0;
    double v70 = 0.0;
    double v22 = 0.0;
    double v64 = 0.0;
    double v65 = 0.0;
  }
  *(double *)(result + 56) = v63;
  *(double *)(result + 64) = v6;
  *(double *)(result + 72) = v7;
  *(double *)(result + 80) = v8;
  *(double *)(result + 88) = v9;
  *(double *)(result + 96) = v10;
  *(double *)(result + 104) = v6;
  *(double *)(result + 112) = v62;
  *(double *)(result + 152) = v7;
  *(double *)(result + 160) = v11;
  *(double *)(result + 120) = v11;
  *(double *)(result + 128) = v12;
  *(double *)(result + 200) = v8;
  *(double *)(result + 208) = v12;
  *(double *)(result + 248) = v9;
  *(double *)(result + 256) = v13;
  *(double *)(result + 136) = v13;
  *(double *)(result + 144) = v14;
  *(double *)(result + 296) = v10;
  *(double *)(result + 304) = v14;
  *(double *)(result + 168) = v15;
  *(double *)(result + 176) = v16;
  *(double *)(result + 184) = v17;
  *(double *)(result + 192) = v18;
  *(double *)(result + 216) = v16;
  *(double *)(result + 224) = v74;
  *(double *)(result + 264) = v17;
  *(double *)(result + 272) = v73;
  *(double *)(result + 232) = v73;
  *(double *)(result + 240) = v19;
  *(double *)(result + 312) = v18;
  *(double *)(result + 320) = v19;
  *(double *)(result + 280) = v72;
  *(double *)(result + 288) = v20;
  *(double *)(result + 328) = v20;
  *(double *)(result + 336) = v21;
  *(double *)(result + 344) = v64;
  *(double *)(result + 352) = v66;
  *(double *)(result + 360) = v68;
  *(double *)(result + 368) = v70;
  *(double *)(result + 376) = v71;
  *(double *)(result + 384) = v22;
  if (v65 <= 1.0e-10) {
    double v57 = 1.79769313e308;
  }
  else {
    double v57 = *a2 / v65;
  }
  *a2 = v57;
  return result;
}

BOOL cva::ldlt<double,6u,1u>()
{
  v7[0] = 0;
  v7[1] = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate(v7, 6);
  int v8 = 6;
  int v6 = 0;
  uint64_t v5 = 0;
  cva::vecLib::sysv<double>();
  v3[0] = 0;
  v3[1] = 0;
  cva::MatrixData<double,0ul,0ul,false>::allocate(v3, (int)0.0);
  int v4 = (int)0.0;
  v0 = (cva::Logger *)cva::vecLib::sysv<double>();
  if (v6 < 0) {
    __assert_rtn("ldlt", "linearalgebra.h", 2235, "(0 <= info) || cva::detail::assertMessage(\"sysv() Linear system failed to be solved!\")");
  }
  if (v6)
  {
    cva::Logger::instance(v0);
    cva::Logger::logInCategory();
  }
  free(v3[0]);
  BOOL v1 = v6 == 0;
  free(v7[0]);
  return v1;
}

void sub_21B7E6C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  free(*(void **)(v13 - 56));
  _Unwind_Resume(a1);
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  double v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    int v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      double v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v4, v13);
      int v8 = *a1;
      double v7 = a1[1];
    }
    else
    {
      double v14 = 0;
    }
    double v15 = &v14[8 * v11];
    double v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    double v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      size_t v13 = 80 * ((80 * a2 - 80) / 0x50) + 80;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - *a1) >> 4);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x333333333333333) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x199999999999999) {
      unint64_t v11 = 0x333333333333333;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::PoseRefiner<double>::projData>>(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    __n128 __p = v12;
    double v16 = &v12[80 * v8];
    uint64_t v18 = &v12[80 * v11];
    size_t v14 = 80 * ((80 * a2 - 80) / 0x50) + 80;
    bzero(v16, v14);
    double v17 = &v16[v14];
    std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__swap_out_circular_buffer(a1, &__p);
    if (v17 != v16) {
      double v17 = &v16[(v17 - v16 - 80) % 0x50uLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_21B7E6F38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::vector<cva::PoseRefiner<double>::projData,std::allocator<cva::PoseRefiner<double>::projData>>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      *(unsigned char *)(v6 - 80) = *(unsigned char *)(v2 + v5 - 80);
      long long v7 = *(_OWORD *)(v2 + v5 - 72);
      *(void *)(v6 - 56) = *(void *)(v2 + v5 - 56);
      *(_OWORD *)(v6 - 72) = v7;
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v2 + v5 - 48);
      *(void *)(v6 - 32) = *(void *)(v2 + v5 - 32);
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      v5 -= 80;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v8 = *result;
  char *result = v4;
  a2[1] = v8;
  uint64_t v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<cva::PoseRefiner<double>::projData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

double cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(uint64_t a1, double **a2)
{
  uint64_t v3 = *(void *)*a2;
  if (v3 - 8 * *((unsigned int *)*a2 + 3) == a1 || (uint64_t v4 = a2[1], v4 == (double *)a1))
  {
    long long v11 = 0uLL;
    uint64_t v12 = 0;
    cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(&v11);
    double result = *(double *)&v11;
    *(_OWORD *)a1 = v11;
    *(void *)(a1 + 16) = v12;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = *((unsigned int *)*a2 + 2);
    do
    {
      if (v6)
      {
        uint64_t v7 = 0;
        double result = 0.0;
        uint64_t v9 = v4;
        do
        {
          double v10 = *v9++;
          double result = result + *(double *)(v3 + v7) * v10;
          v7 += 8 * v6;
        }
        while (8 * (3 * v6) != v7);
      }
      else
      {
        double result = 0.0;
      }
      *(double *)(a1 + 8 * v5++) = result;
      v3 += 8;
    }
    while (v5 != 3);
  }
  return result;
}

double std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3, double result)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    do
    {
      unint64_t v7 = v4 - a1;
      if (v7 < 2) {
        break;
      }
      if (v7 == 3)
      {
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, a1 + 1, v4 - 1);
        return result;
      }
      if (v7 == 2)
      {
        double result = *(v4 - 1);
        double v30 = *a1;
        if (result < *a1)
        {
          *a1 = result;
          *(v4 - 1) = v30;
        }
        return result;
      }
      if ((char *)v4 - (char *)a1 <= 63)
      {
        return std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v4, result);
      }
      uint64_t v8 = &a1[v7 >> 1];
      uint64_t v9 = v4 - 1;
      int v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(a1, v8, v4 - 1);
      double result = *a1;
      if (*a1 >= *v8)
      {
        long long v11 = v4 - 1;
        while (--v11 != a1)
        {
          if (*v11 < *v8)
          {
            *a1 = *v11;
            double *v11 = result;
            ++v10;
            goto LABEL_13;
          }
        }
        double v21 = a1 + 1;
        if (result >= *v9)
        {
          while (v21 != v9)
          {
            double v22 = *v21;
            if (result < *v21)
            {
              *v21++ = *v9;
              *uint64_t v9 = v22;
              goto LABEL_45;
            }
            ++v21;
          }
          return result;
        }
LABEL_45:
        if (v21 == v9) {
          return result;
        }
        while (1)
        {
          double v25 = *a1;
          do
          {
            double v26 = *v21++;
            double result = v26;
          }
          while (v25 >= v26);
          double v27 = v21 - 1;
          do
          {
            double v28 = *--v9;
            double v29 = v28;
          }
          while (v25 < v28);
          if (v27 >= v9) {
            break;
          }
          *double v27 = v29;
          *uint64_t v9 = result;
        }
        a1 = v21 - 1;
        if (v27 > a2) {
          return result;
        }
      }
      else
      {
        long long v11 = v4 - 1;
LABEL_13:
        uint64_t v12 = a1 + 1;
        if (a1 + 1 >= v11)
        {
          double v16 = a1 + 1;
        }
        else
        {
          size_t v13 = a1 + 1;
          while (1)
          {
            double v14 = *v8;
            do
            {
              double v15 = *v13++;
              double result = v15;
            }
            while (v15 < v14);
            double v16 = v13 - 1;
            do
            {
              double v17 = *--v11;
              double v18 = v17;
            }
            while (v17 >= v14);
            if (v16 >= v11) {
              break;
            }
            double *v16 = v18;
            double *v11 = result;
            ++v10;
            if (v16 == v8) {
              uint64_t v8 = v11;
            }
          }
        }
        if (v16 != v8)
        {
          double result = *v8;
          double v19 = *v16;
          if (*v8 < *v16)
          {
            double *v16 = result;
            *uint64_t v8 = v19;
            ++v10;
          }
        }
        if (v16 == a2) {
          return result;
        }
        if (!v10)
        {
          if (v16 <= a2)
          {
            double v23 = v16 + 1;
            while (v23 != v4)
            {
              double v24 = *(v23 - 1);
              double result = *v23++;
              if (result < v24) {
                goto LABEL_29;
              }
            }
          }
          else
          {
            while (v12 != v16)
            {
              double v20 = *(v12 - 1);
              double result = *v12++;
              if (result < v20) {
                goto LABEL_29;
              }
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2) {
          a1 = v16 + 1;
        }
        else {
          uint64_t v4 = v16;
        }
      }
    }
    while (v4 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double *a3)
{
  double v3 = *a2;
  double v4 = *a1;
  double v5 = *a3;
  if (*a2 < *a1)
  {
    if (v5 < v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 >= v4) {
      return 1;
    }
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 < v3)
  {
    *a2 = v5;
    *a3 = v3;
    double v6 = *a1;
    if (*a2 >= *a1) {
      return 1;
    }
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

double std::__selection_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<double *>>(double *a1, double *a2, double result)
{
  while (a1 != a2 - 1)
  {
    double v3 = a1++;
    if (v3 != a2 && a1 != a2)
    {
      double result = *v3;
      double v4 = a1;
      double v5 = v3;
      double v6 = a1;
      do
      {
        double v7 = *v6++;
        double v8 = v7;
        if (v7 < result)
        {
          double result = v8;
          double v5 = v4;
        }
        double v4 = v6;
      }
      while (v6 != a2);
      if (v5 != v3)
      {
        double result = *v3;
        *double v3 = *v5;
        *double v5 = result;
      }
    }
  }
  return result;
}

uint64_t cva::MatrixData<int,0ul,0ul,false>::allocate(void **a1, uint64_t a2)
{
  if (*a1) {
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  }
  size_t v3 = (4 * a2 + 31) & 0xFFFFFFFFFFFFFFE0;
  a1[1] = (void *)(v3 >> 2);
  memptr = 0;
  uint64_t result = malloc_type_posix_memalign(&memptr, 0x20uLL, v3, 0x49090899uLL);
  double v5 = memptr;
  *a1 = memptr;
  if (!v5) {
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  }
  return result;
}

uint64_t cva::MatrixData<double,0ul,0ul,false>::allocate(void **a1, uint64_t a2)
{
  if (*a1) {
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  }
  size_t v3 = (8 * a2 + 31) & 0xFFFFFFFFFFFFFFE0;
  a1[1] = (void *)(v3 >> 3);
  memptr = 0;
  uint64_t result = malloc_type_posix_memalign(&memptr, 0x20uLL, v3, 0x49090899uLL);
  double v5 = memptr;
  *a1 = memptr;
  if (!v5) {
    cva::MatrixData<int,0ul,0ul,false>::allocate();
  }
  return result;
}

double *cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(double *a1, double a2)
{
  if (a2 >= 0.0000002635)
  {
    double v8 = sqrt(a2);
    __double2 v9 = __sincos_stret(v8);
    double cosval = v9.__cosval;
    double v6 = v9.__sinval / v8;
    double v4 = 1.0 / a2 * (1.0 - v9.__cosval);
    double v5 = 1.0 / a2 * (1.0 - v9.__sinval / v8);
  }
  else
  {
    double v4 = 0.5 - a2 * (a2 / -720.0 + 0.0416666667);
    double v5 = 0.166666667 - a2 * (a2 / -5040.0 + 0.00833333333);
    double v6 = 1.0 - a2 * v5;
    double cosval = 1.0 - a2 * v4;
  }
  a1[2] = v4;
  a1[3] = v5;
  *a1 = cosval;
  a1[1] = v6;
  return a1;
}

double cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  unint64_t v4 = 0x100000000;
  *a1 = 0u;
  a1[1] = 0u;
  do
  {
    uint64_t v5 = *a2++;
    *((void *)a1 + v3) = v5;
    unint64_t v6 = HIDWORD(v4);
    BOOL v7 = (int)v4 < 2;
    if ((int)v4 < 2) {
      unint64_t v6 = 0;
    }
    uint64_t v8 = v3 + v6;
    uint64_t v9 = (v4 + 1);
    unint64_t v10 = v4 & 0xFFFFFFFF00000000;
    if (!v7) {
      uint64_t v9 = 0;
    }
    unint64_t v4 = v9 | v10;
    uint64_t v3 = v8 + 1;
  }
  while (v3 != 12);
  for (uint64_t i = 0; i != 24; i += 8)
  {
    double result = *(double *)(a3 + i);
    *(double *)((char *)a1 + i + 96) = result;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  double v15 = (char *)a1 + 24;
  do
  {
    while (v14 == 4)
    {
      *(void *)&v15[32 * v13++] = 0;
      if (v13 == 4) {
        return result;
      }
    }
    double result = dbl_21B813BF0[v14];
    uint64_t v16 = v14 + 1;
    *(double *)&v15[32 * v13++] = result;
    ++v14;
  }
  while (v13 != 4);
  if (v16 != 4) {
    cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage();
  }
  return result;
}

float64_t cva::assign<false,false,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>>(float64x2_t *a1, float64x2_t **a2)
{
  uint64_t v3 = *a2;
  if (*a2 == a1 || (unint64_t v4 = a2[1], v4 == a1))
  {
    float64x2_t v25 = 0u;
    float64x2_t v26 = 0u;
    float64x2_t v23 = 0u;
    float64x2_t v24 = 0u;
    float64x2_t v21 = 0u;
    float64x2_t v22 = 0u;
    float64x2_t v19 = 0u;
    float64x2_t v20 = 0u;
    cva::assign<false,false,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>,cva::Matrix<double,4u,4u,false>>(&v19);
    float64x2_t v14 = v24;
    a1[4] = v23;
    a1[5] = v14;
    float64x2_t v15 = v26;
    a1[6] = v25;
    a1[7] = v15;
    float64x2_t v16 = v20;
    *a1 = v19;
    a1[1] = v16;
    v7.f64[0] = v21.f64[0];
    float64x2_t v17 = v22;
    a1[2] = v21;
    a1[3] = v17;
  }
  else
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v6 = 0;
      float64x2_t v7 = 0uLL;
      uint64_t v8 = v3;
      float64x2_t v9 = 0uLL;
      do
      {
        double v10 = v4->f64[v6];
        float64x2_t v11 = *v8;
        float64x2_t v12 = v8[1];
        v8 += 2;
        float64x2_t v9 = vmlaq_n_f64(v9, v12, v10);
        float64x2_t v7 = vmlaq_n_f64(v7, v11, v10);
        ++v6;
      }
      while (v6 != 4);
      uint64_t v13 = &a1[2 * i];
      *uint64_t v13 = v7;
      v13[1] = v9;
      v4 += 2;
    }
  }
  return v7.f64[0];
}

double *cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::log@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v31[4] = *MEMORY[0x263EF8340];
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(void *)&long long v28 = a1;
  *((void *)&v28 + 1) = 4;
  float64x2_t v23 = (double *)a2;
  uint64_t v24 = 6;
  cva::computeLogarithmVector<cva::MatrixRef<double const,3u,3u,false>,cva::MatrixRef<double,3u,1u,false>>((uint64_t)&v28, &v23);
  double v4 = *(double *)a2 * *(double *)a2
     + *(double *)(a2 + 8) * *(double *)(a2 + 8)
     + *(double *)(a2 + 16) * *(double *)(a2 + 16);
  double result = cva::ExponentialCoefficients<double,3>::ExponentialCoefficients(&v19, v4);
  if (v4 >= 2.775e-15)
  {
    double v6 = (v21 + v20 * -0.5) / (v4 * v21);
    if (v4 <= 9.0) {
      double v6 = -(v22 - v21 * 0.5) / v20;
    }
  }
  else
  {
    double v6 = v4 * 0.00138888889 + 0.0833333333 + v4 * 0.0000330687831;
  }
  uint64_t v7 = 0;
  uint64_t v9 = *(void *)(a1 + 96);
  uint64_t v10 = *(void *)(a1 + 104);
  uint64_t v8 = a1 + 96;
  v17[0] = 0;
  v17[1] = 0;
  uint64_t v18 = 0;
  double v11 = *(double *)a2;
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t v13 = *(void *)(v8 + 16);
  *((void *)&v28 + 1) = *(void *)(a2 + 8);
  uint64_t v29 = v12;
  double v30 = v11;
  v31[0] = v13;
  v31[1] = v9;
  v31[2] = v10;
  uint64_t v24 = v12;
  double v25 = v11;
  uint64_t v26 = *((void *)&v28 + 1);
  v27[0] = v10;
  v27[1] = v13;
  v27[2] = v9;
  do
  {
    *(double *)&v17[v7] = *(double *)((char *)&v28 + v7 * 8 + 8) * *(double *)&v31[v7]
                        - *(double *)&(&v23)[v7 + 1] * *(double *)&v27[v7];
    ++v7;
  }
  while (v7 != 3);
  uint64_t v14 = 0;
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  unint64_t v15 = 2;
  do
  {
    if (v14 == 2) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v14 + 1;
    }
    *((double *)&v28 + v14) = *(double *)(v8 + 8 * v14)
                            + *(double *)&v17[v14] * -0.5
                            + v6
                            * (*(double *)(a2 + 8 * v16) * *((double *)&v18 + v14 + -3 * (v15 / 3))
                             - *(double *)(a2 + 16 - 24 * (v15 / 3) + 8 * v14) * *(double *)&v17[v16]);
    ++v15;
    ++v14;
  }
  while (v14 != 3);
  *(_OWORD *)(a2 + 24) = v28;
  *(void *)(a2 + 40) = v29;
  return result;
}

void cva::computeLogarithmVector<cva::MatrixRef<double const,3u,3u,false>,cva::MatrixRef<double,3u,1u,false>>(uint64_t a1, double **a2)
{
  uint64_t v2 = *(double **)a1;
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = (v3 + 2);
  uint64_t v5 = (2 * v3) | 1u;
  double v6 = (*(double *)(*(void *)a1 + 8 * v4) - *(double *)(*(void *)a1 + 8 * v5)) * 0.5;
  uint64_t v7 = *a2;
  double *v7 = v6;
  uint64_t v8 = (float64x2_t *)&v2[(2 * v3)];
  double v9 = (v8->f64[0] - v2[2]) * 0.5;
  v7[1] = v9;
  double v10 = (v2[1] - v2[v3]) * 0.5;
  v7[2] = v10;
  double v11 = *v2;
  double v12 = v2[(v3 + 1)];
  double v13 = v2[(2 * v3 + 2)];
  double v14 = -1.0;
  double v15 = (*v2 + v12 + v13 + -1.0) * 0.5;
  double v16 = v9 * v9 + v6 * v6 + v10 * v10;
  if (v15 >= -1.0 || v15 + 1.0 <= -0.00001)
  {
    BOOL v17 = v15 > 1.0;
    if (v15 + -1.0 >= 0.00001) {
      BOOL v17 = 0;
    }
    if (v15 > 0.99 || v17)
    {
      double v19 = v16 * (v16 * (v16 * 5.0 / 112.0 + 0.075) + 0.166666667) + 1.0;
LABEL_12:
      double *v7 = v6 * v19;
      v7[1] = v9 * v19;
      double v20 = v10 * v19;
LABEL_23:
      v7[2] = v20;
      return;
    }
    if (v15 > -0.99)
    {
      double v19 = acos(v15) / sqrt(v16);
      goto LABEL_12;
    }
    double v14 = (*v2 + v12 + v13 + -1.0) * 0.5;
  }
  long double v21 = asin(sqrt(v16));
  double v22 = (3.14159265 - v21) * (3.14159265 - v21) / (1.0 - v14);
  double v23 = (v11 - v14) * v22;
  double v24 = (v12 - v14) * v22;
  double v25 = (v13 - v14) * v22;
  if (v23 <= v24)
  {
    double v30 = v22 * 0.5;
    if (v24 > v25)
    {
      double v31 = sqrt(v24);
      if (v9 < 0.0) {
        double v31 = -v31;
      }
      v7[1] = v31;
      double v32 = 1.0 / v31;
      double v33 = v2[v5] + v2[v4];
      double *v7 = v32 * (v30 * (v2[v3] + v2[1]));
      double v20 = v32 * (v30 * v33);
      goto LABEL_23;
    }
    double v37 = sqrt(v25);
    if (v10 < 0.0) {
      double v37 = -v37;
    }
    v7[2] = v37;
    v38.f64[0] = v2[2];
    v38.f64[1] = v2[v4];
    *(float64x2_t *)uint64_t v7 = vmulq_n_f64(vmulq_n_f64(vaddq_f64(*v8, v38), v30), 1.0 / v37);
  }
  else
  {
    double v26 = v22 * 0.5;
    double v27 = v26 * (v8->f64[0] + v2[2]);
    if (v23 <= v25)
    {
      double v34 = sqrt(v25);
      if (v10 < 0.0) {
        double v34 = -v34;
      }
      v7[2] = v34;
      double v35 = 1.0 / v34;
      double v36 = v35 * (v26 * (v2[v5] + v2[v4]));
      double *v7 = v35 * v27;
      v7[1] = v36;
    }
    else
    {
      double v28 = sqrt(v23);
      if (v6 < 0.0) {
        double v28 = -v28;
      }
      double *v7 = v28;
      double v29 = 1.0 / v28;
      v7[1] = v29 * (v26 * (v2[v3] + v2[1]));
      v7[2] = v29 * v27;
    }
  }
}

double cva::computeExponentialMatrix<double,cva::Matrix<double,6u,1u,false>,cva::Matrix<double,4u,4u,false>>(uint64_t *a1, double *a2, uint64_t a3)
{
  v34[4] = *MEMORY[0x263EF8340];
  double v6 = *a2;
  double v7 = a2[1];
  double v8 = a2[2];
  *(void *)&long long v31 = a1;
  *((void *)&v31 + 1) = 6;
  uint64_t v26 = a3;
  uint64_t v27 = 4;
  cva::computeExponentialMatrix<double,cva::MatrixRef<double const,3u,1u,false>,cva::MatrixRef<double,3u,3u,false>>((double **)&v31, (uint64_t)&v26, v6, v7, v8);
  uint64_t v9 = 0;
  v24[0] = 0;
  v24[1] = 0;
  uint64_t v25 = 0;
  uint64_t v10 = *a1;
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v14 = a1[5];
  *((void *)&v31 + 1) = a1[1];
  uint64_t v32 = v11;
  uint64_t v33 = v10;
  v34[0] = v14;
  v34[1] = v12;
  v34[2] = v13;
  uint64_t v27 = v11;
  uint64_t v28 = v10;
  uint64_t v29 = *((void *)&v31 + 1);
  v30[0] = v13;
  v30[1] = v14;
  v30[2] = v12;
  do
  {
    *(double *)&v24[v9] = *(double *)((char *)&v31 + v9 * 8 + 8) * *(double *)&v34[v9]
                        - *(double *)((char *)&v26 + v9 * 8 + 8) * *(double *)&v30[v9];
    ++v9;
  }
  while (v9 != 3);
  double result = a2[2];
  double v16 = a2[3];
  BOOL v17 = (double *)(a3 + 96);
  if (a1 == (uint64_t *)a3)
  {
    uint64_t v21 = 0;
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    unint64_t v22 = 2;
    do
    {
      if (v21 == 2) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = v21 + 1;
      }
      *((double *)&v31 + v21) = *(double *)&a1[v21 + 3]
                              + result * *(double *)&v24[v21]
                              + v16
                              * (*(double *)&a1[v23] * *((double *)&v25 + v21 + -3 * (v22 / 3))
                               - *(double *)&a1[v21 + 2 + -3 * (v22 / 3)] * *(double *)&v24[v23]);
      ++v22;
      ++v21;
    }
    while (v21 != 3);
    double result = *(double *)&v31;
    *(_OWORD *)BOOL v17 = v31;
    *(void *)(a3 + 112) = v32;
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v19 = 2;
    do
    {
      if (v18 == 2) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = v18 + 1;
      }
      v17[v18] = *(double *)&a1[v18 + 3]
               + result * *(double *)&v24[v18]
               + v16
               * (*(double *)&a1[v20] * *((double *)&v25 + v18 + -3 * (v19 / 3))
                - *(double *)&a1[v18 + 2 + -3 * (v19 / 3)] * *(double *)&v24[v20]);
      ++v19;
      ++v18;
    }
    while (v18 != 3);
  }
  return result;
}

double cva::computeExponentialMatrix<double,cva::MatrixRef<double const,3u,1u,false>,cva::MatrixRef<double,3u,3u,false>>(double **a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v5 = *a1;
  double v6 = **a1;
  double v7 = v6 * a5;
  double v8 = (*a1)[1] * a5;
  double v9 = (*a1)[2] * a5;
  uint64_t v10 = *(double **)a2;
  double *v10 = a3 + v7 * v6;
  uint64_t v11 = *(unsigned int *)(a2 + 8);
  v10[(v11 + 1)] = a3 + v8 * v5[1];
  int v12 = 2 * v11;
  v10[v12 + 2] = a3 + v9 * v5[2];
  double v13 = v5[1];
  double v14 = v7 * v13;
  double v15 = v5[2];
  double v16 = v7 * v15;
  double v17 = v8 * v15;
  double v18 = *v5 * a4;
  double v19 = v13 * a4;
  double v20 = v15 * a4;
  v10[v11] = v14 - v20;
  v10[v12] = v19 + v16;
  v10[1] = v14 + v20;
  v10[(2 * v11) | 1u] = v17 - v18;
  v10[2] = v16 - v19;
  double result = v17 + v18;
  v10[(v11 + 2)] = v17 + v18;
  return result;
}

void *cva::PoseRefiner<double>::~PoseRefiner(void *a1)
{
  uint64_t v2 = (void *)a1[50];
  if (v2)
  {
    a1[51] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

long long *std::vector<cva::Matrix<double,2u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,2u,1u,false>*,cva::Matrix<double,2u,1u,false>*>(long long **a1, long long *a2, long long *a3, unint64_t a4)
{
  double v6 = a2;
  uint64_t v8 = (uint64_t)a1[2];
  double result = *a1;
  if (a4 > (v8 - (uint64_t)result) >> 4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, v11);
    double v13 = a1[1];
    int v12 = a1 + 1;
    double result = v13;
    double v14 = (char *)v13;
    if (v6 != a3)
    {
      double v14 = (char *)result;
      do
      {
        long long v15 = *v6++;
        *(_OWORD *)double v14 = v15;
        v14 += 16;
      }
      while (v6 != a3);
    }
LABEL_30:
    int64_t v24 = v14 - (char *)result;
    goto LABEL_31;
  }
  double v17 = a1[1];
  int v12 = a1 + 1;
  double v16 = v17;
  unint64_t v18 = v17 - result;
  if (v18 >= a4)
  {
    double v14 = (char *)result;
    if (a2 != a3)
    {
      uint64_t v25 = result;
      do
      {
        if (v6 != v25) {
          *uint64_t v25 = *v6;
        }
        ++v6;
        ++v25;
        v14 += 16;
      }
      while (v6 != a3);
    }
    goto LABEL_30;
  }
  double v19 = &a2[v18];
  if (v16 != result)
  {
    uint64_t v20 = 16 * v18;
    do
    {
      if (v6 != result) {
        long long *result = *v6;
      }
      ++v6;
      ++result;
      v20 -= 16;
    }
    while (v20);
    double result = *v12;
  }
  uint64_t v21 = (char *)result;
  if (v19 != a3)
  {
    uint64_t v21 = (char *)result;
    unint64_t v22 = result;
    do
    {
      long long v23 = *v19++;
      *v22++ = v23;
      v21 += 16;
    }
    while (v19 != a3);
  }
  int64_t v24 = v21 - (char *)result;
LABEL_31:
  double *v12 = (long long *)((char *)result + v24);
  return result;
}

void *std::vector<cva::Matrix<double,3u,1u,false>>::__assign_with_size[abi:ne180100]<cva::Matrix<double,3u,1u,false>*,cva::Matrix<double,3u,1u,false>*>(void *a1, void *a2, void *a3, unint64_t a4)
{
  double v6 = a2;
  uint64_t v8 = a1[2];
  double result = (void *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) < a4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    std::vector<cva::Matrix<double,3u,1u,false>>::__vallocate[abi:ne180100](a1, v12);
    double v14 = (void *)a1[1];
    double v13 = (void **)(a1 + 1);
    double result = v14;
    long long v15 = (char *)v14;
    if (v6 != a3)
    {
      long long v15 = (char *)result;
      do
      {
        long long v16 = *(_OWORD *)v6;
        *((void *)v15 + 2) = v6[2];
        *(_OWORD *)long long v15 = v16;
        v15 += 24;
        v6 += 3;
      }
      while (v6 != a3);
    }
LABEL_30:
    int64_t v26 = v15 - (char *)result;
    goto LABEL_31;
  }
  unint64_t v18 = (void *)a1[1];
  double v13 = (void **)(a1 + 1);
  double v17 = v18;
  unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (v18 - result);
  if (v19 >= a4)
  {
    long long v15 = (char *)result;
    if (a2 != a3)
    {
      uint64_t v27 = result;
      do
      {
        if (v6 != v27)
        {
          long long v28 = *(_OWORD *)v6;
          v27[2] = v6[2];
          *(_OWORD *)uint64_t v27 = v28;
        }
        v6 += 3;
        v27 += 3;
        v15 += 24;
      }
      while (v6 != a3);
    }
    goto LABEL_30;
  }
  uint64_t v20 = &a2[3 * v19];
  if (v17 != result)
  {
    uint64_t v21 = 24 * v19;
    do
    {
      if (v6 != result)
      {
        long long v22 = *(_OWORD *)v6;
        result[2] = v6[2];
        *(_OWORD *)double result = v22;
      }
      v6 += 3;
      result += 3;
      v21 -= 24;
    }
    while (v21);
    double result = *v13;
  }
  long long v23 = (char *)result;
  if (v20 != a3)
  {
    long long v23 = (char *)result;
    int64_t v24 = result;
    do
    {
      long long v25 = *(_OWORD *)v20;
      void v24[2] = v20[2];
      *(_OWORD *)int64_t v24 = v25;
      v24 += 3;
      v20 += 3;
      v23 += 24;
    }
    while (v20 != a3);
  }
  int64_t v26 = v23 - (char *)result;
LABEL_31:
  *double v13 = (void *)((char *)result + v26);
  return result;
}

char *std::vector<cva::Matrix<double,3u,1u,false>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<float>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::vector<cva::Matrix<double,2u,1u,false>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8ne180100Em(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 16 * a2);
    a1[1] = &v4[16 * a2];
  }
  return a1;
}

void sub_21B7E849C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::Matrix<double,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2 == a1 || (uint64_t v4 = (double *)a2[1], v4 == (double *)a1))
  {
    long long v10 = 0uLL;
    uint64_t v11 = 0;
    cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::Matrix<double,3u,3u,false>,cva::Matrix<double,3u,1u,false>>(&v10);
    double result = *(double *)&v10;
    *(_OWORD *)a1 = v10;
    *(void *)(a1 + 16) = v11;
  }
  else
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v6 = 0;
      double result = 0.0;
      uint64_t v8 = v4;
      do
      {
        double v9 = *v8++;
        double result = result + *(double *)(v3 + v6) * v9;
        v6 += 24;
      }
      while (v6 != 72);
      *(double *)(a1 + 8 * i) = result;
      v3 += 8;
    }
  }
  return result;
}

uint64_t GetDimensionForIndexBackwards(uint64_t a1, unint64_t a2, int a3)
{
  if (a3 >= a2) {
    return 1;
  }
  else {
    return *(void *)(a1 + 8 * (~(uint64_t)a3 + a2));
  }
}

uint64_t GetStrideForIndexBackwards(uint64_t a1, unint64_t a2, int a3)
{
  if (a3 >= a2) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = ~(uint64_t)a3 + a2;
  }
  return *(void *)(a1 + 8 * v3);
}

uint64_t convertFloatToInt(float a1)
{
  double v1 = a1;
  BOOL v2 = a1 < 0.0;
  double v3 = 0.5;
  if (v2) {
    double v3 = -0.5;
  }
  return (int)(v3 + v1);
}

size_t wrapCVPixelBufferVImage@<X0>(__CVBuffer *a1@<X0>, void **a2@<X8>)
{
  *a2 = CVPixelBufferGetBaseAddress(a1);
  a2[1] = (void *)CVPixelBufferGetHeight(a1);
  a2[2] = (void *)CVPixelBufferGetWidth(a1);
  size_t result = CVPixelBufferGetBytesPerRow(a1);
  a2[3] = (void *)result;
  return result;
}

size_t vImage_Buffer_From_CVPixelBufferPlane@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(void *)a3 = CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  *(void *)(a3 + 8) = CVPixelBufferGetHeightOfPlane(a1, a2);
  *(void *)(a3 + 16) = CVPixelBufferGetWidthOfPlane(a1, a2);
  size_t result = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  *(void *)(a3 + 24) = result;
  return result;
}

double getImageDimensionsFromFile(uint64_t a1)
{
  CFURLRef v1 = [NSURL fileURLWithPath:a1];
  BOOL v2 = CGImageSourceCreateWithURL(v1, 0);
  double v3 = v2;
  if (v2)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v2, 0, 0);
    size_t Width = CGImageGetWidth(ImageAtIndex);
    CGImageGetHeight(ImageAtIndex);
    CGImageRelease(ImageAtIndex);
    CFRelease(v3);
    double v6 = (double)Width;
  }
  else
  {
    double v7 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, " CGImageSourceCreateWithURL error: Couldn't create cgimagesource with URL ", v9, 2u);
    }

    double v6 = 0.0;
  }

  return v6;
}

void sub_21B7EA0CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void readImage(uint64_t a1, CVPixelBufferRef *a2)
{
  CFURLRef v3 = [NSURL fileURLWithPath:a1];
  uint64_t v4 = CGImageSourceCreateWithURL(v3, 0);
  uint64_t v5 = v4;
  if (!v4)
  {
    long long v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      double v17 = " CGImageSourceCreateWithURL error: Couldn't create cgimagesource with URL ";
LABEL_8:
      _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v4, 0, 0);
  CFRelease(v5);
  if (!ImageAtIndex)
  {
    long long v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      double v17 = " CGImageSourceCreateImageAtIndex error: Couldn't create image. ";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(*a2);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(ImageAtIndex);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*a2);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t Width = CGImageGetWidth(ImageAtIndex);
  size_t Height = CGImageGetHeight(ImageAtIndex);
  double v13 = CGBitmapContextCreate(BaseAddress, Width, Height, BitsPerComponent, BytesPerRow, DeviceRGB, 6u);
  CGAffineTransformMakeRotation(&v18, 0.0);
  CGContextConcatCTM(v13, &v18);
  size_t v14 = CGImageGetWidth(ImageAtIndex);
  size_t v15 = CGImageGetHeight(ImageAtIndex);
  v20.size.width = (double)v14;
  v20.size.height = (double)v15;
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  CGContextDrawImage(v13, v20, ImageAtIndex);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v13);
  CGImageRelease(ImageAtIndex);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
LABEL_10:
}

void sub_21B7EA2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t readGrayScaleImage(uint64_t a1, CVPixelBufferRef *a2)
{
  CFURLRef v3 = [NSURL fileURLWithPath:a1];
  uint64_t v4 = CGImageSourceCreateWithURL(v3, 0);
  uint64_t v5 = v4;
  if (!v4)
  {
    CGAffineTransform v18 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v19 = " CGImageSourceCreateWithURL error: Couldn't create cgimagesource with URL ";
LABEL_8:
      _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    }
LABEL_9:

    uint64_t v17 = 4294960636;
    goto LABEL_10;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v4, 0, 0);
  CFRelease(v5);
  if (!ImageAtIndex)
  {
    CGAffineTransform v18 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unint64_t v19 = " CGImageSourceCreateImageAtIndex error: Couldn't create image. ";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(*a2);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(ImageAtIndex);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*a2);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  size_t Width = CGImageGetWidth(ImageAtIndex);
  size_t Height = CGImageGetHeight(ImageAtIndex);
  uint32_t BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
  size_t v14 = CGBitmapContextCreate(BaseAddress, Width, Height, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGAffineTransformMakeRotation(&v21, 0.0);
  CGContextConcatCTM(v14, &v21);
  size_t v15 = CGImageGetWidth(ImageAtIndex);
  size_t v16 = CGImageGetHeight(ImageAtIndex);
  v23.size.width = (double)v15;
  v23.size.height = (double)v16;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  CGContextDrawImage(v14, v23, ImageAtIndex);
  CGImageRelease(ImageAtIndex);
  CGContextRelease(v14);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  uint64_t v17 = 0;
LABEL_10:

  return v17;
}

void sub_21B7EA4F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t readImageAndConvertToYCbCr(void *a1, CVPixelBufferRef *a2)
{
  id v3 = a1;
  if ((CVPixelBufferGetPixelFormatType(*a2) & 0xFFFFFFEF) == 0x34323066)
  {
    size_t Width = CVPixelBufferGetWidth(*a2);
    size_t Height = CVPixelBufferGetHeight(*a2);
    pixelBufferOut[0] = 0;
    uint64_t v6 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x20u, 0, pixelBufferOut);
    if (v6)
    {
      double v7 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)size_t v14 = 0;
        _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, " Could not create imageARGB buffer of type kCVPixelFormatType_32ARGB ", v14, 2u);
      }

      goto LABEL_26;
    }
    readImage((uint64_t)v3, pixelBufferOut);
    if (pixelBufferOut[0])
    {
      if (CVPixelBufferGetPixelFormatType(pixelBufferOut[0]) == 32)
      {
        if (convertFormatARGBToYCbCr(pixelBufferOut[0], a2))
        {
          double v9 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)size_t v14 = 0;
            long long v10 = " Could not convert pixelBuffer from ARGB->YCbCr ";
LABEL_24:
            _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, v10, v14, 2u);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
        if (CVPixelBufferGetPixelFormatType(*a2) != 875704438)
        {
          double v9 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)size_t v14 = 0;
            long long v10 = " Invalid pixel buffer format for imageYCbCr ";
            goto LABEL_24;
          }
LABEL_25:

          CVPixelBufferRelease(pixelBufferOut[0]);
          uint64_t v6 = 1;
          goto LABEL_26;
        }
LABEL_20:
        CVPixelBufferRelease(pixelBufferOut[0]);
        uint64_t v6 = 0;
        goto LABEL_26;
      }
      uint64_t v11 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)size_t v14 = 0;
        unint64_t v12 = " Invalid pixel buffer format for imageARGB ";
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v11 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)size_t v14 = 0;
        unint64_t v12 = " Failed to read imageARGB from the specified path ";
LABEL_18:
        _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_ERROR, v12, v14, 2u);
      }
    }

    goto LABEL_20;
  }
  uint64_t v8 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(pixelBufferOut[0]) = 0;
    _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_ERROR, " Supported formats are kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, kCVPixelFormatType_420YpCbCr8BiPlanarFullRange ", (uint8_t *)pixelBufferOut, 2u);
  }

  uint64_t v6 = 4294960616;
LABEL_26:

  return v6;
}

void sub_21B7EA7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

vImage_Error convertFormatARGBToYCbCr(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  *(_DWORD *)permuteMap = 50462976;
  memset(&destYp, 0, sizeof(destYp));
  vImage_Buffer_From_CVPixelBufferPlane(*a2, 0, (uint64_t)&destYp);
  memset(&destCbCr, 0, sizeof(destCbCr));
  vImage_Buffer_From_CVPixelBufferPlane(*a2, 1uLL, (uint64_t)&destCbCr);
  uint64_t v5 = (const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x263EFAB18];
  v6.i32[0] = 875704422;
  v7.i32[0] = PixelFormatType;
  int8x8_t v8 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v7, v6), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
  pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
  pixelRange.CbCr_bias = 128;
  pixelRange.YpRangeMax = v8.i32[0];
  if (PixelFormatType == 875704422) {
    int32_t v9 = 255;
  }
  else {
    int32_t v9 = 240;
  }
  pixelRange.CbCrRangeMax = v9;
  *(int8x8_t *)&pixelRange.YpMax = v8;
  pixelRange.CbCrMax = v9;
  pixelRange.CbCrMiint n = 16 * (PixelFormatType != 875704422);
  if (vImageConvert_ARGBToYpCbCr_GenerateConversion(v5, &pixelRange, &outInfo, kvImageARGB8888, kvImage420Yp8_CbCr8, 0))
  {
    long long v10 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v13 = 0;
      uint64_t v11 = " Could not generate the conversion format ";
LABEL_10:
      _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_ERROR, v11, v13, 2u);
    }
  }
  else
  {
    vImage_Error result = vImageConvert_ARGB8888To420Yp8_CbCr8(&src, &destYp, &destCbCr, &outInfo, permuteMap, 0);
    if (!result) {
      return result;
    }
    long long v10 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v13 = 0;
      uint64_t v11 = " Could not generate the convert image ";
      goto LABEL_10;
    }
  }

  return 4294960636;
}

uint64_t writeImage(__CVBuffer *a1, void *a2)
{
  id v3 = a2;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  signed int v5 = PixelFormatType;
  if (PixelFormatType <= 875704437)
  {
    if (PixelFormatType == 32) {
      goto LABEL_8;
    }
    int v6 = 875704422;
  }
  else
  {
    if (PixelFormatType == 875704438 || PixelFormatType == 1111970369) {
      goto LABEL_8;
    }
    int v6 = 1278226488;
  }
  if (PixelFormatType != v6)
  {
    double v13 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_ERROR, " Supported formats are kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange, kCVPixelFormatType_420YpCbCr8BiPlanarFullRange, kCVPixelFormatType_OneComponent8 or kCVPixelFormatType_32ARGB or kCVPixelFormatType_32BGRA ", (uint8_t *)&buf, 2u);
    }

    uint64_t v10 = 4294960616;
    goto LABEL_42;
  }
LABEL_8:
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  CVPixelBufferRef pixelBufferOut = 0;
  if ((v5 & 0xFFFFFFEF) == 0x34323066)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], WidthOfPlane, HeightOfPlane, 0x20u, 0, &pixelBufferOut);
    if (v10)
    {
      uint64_t v11 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        unint64_t v12 = " Could not create image buffer of type kCVPixelFormatType_32ARGB ";
LABEL_23:
        _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&buf, 2u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    uint64_t v10 = convertFormatYCbCrToARGB(a1, &pixelBufferOut);
    if (v10)
    {
      uint64_t v11 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        unint64_t v12 = " Could not convert pixel formats ";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  else if (v5 == 1111970369)
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v10 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], WidthOfPlane, HeightOfPlane, 0x20u, 0, &pixelBufferOut);
    if (v10)
    {
      uint64_t v11 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        unint64_t v12 = " Could not create image buffer of type kCVPixelFormatType_32ARGB ";
        goto LABEL_23;
      }
LABEL_24:

      goto LABEL_42;
    }
    if (changeChannelsARGB(a1, &pixelBufferOut))
    {
      size_t v14 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_ERROR, " Conversion failed BGRA->ARGB ", (uint8_t *)&buf, 2u);
      }
    }
  }
  else
  {
    CVPixelBufferRef pixelBufferOut = a1;
    CVPixelBufferRetain(a1);
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  }
  CVPixelBufferRef v28 = 0;
  uint64_t v10 = CVPixelBufferCreate(v9, WidthOfPlane, HeightOfPlane, 0x18u, 0, &v28);
  if (v10)
  {
    size_t v15 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_ERROR, " Could not convert image buffer to kCVPixelFormatType_24RGB ", (uint8_t *)&buf, 2u);
    }

    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    CVPixelBufferLockBaseAddress(v28, 0);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    memset(&buf, 0, sizeof(buf));
    buf.data = CVPixelBufferGetBaseAddress(pixelBufferOut);
    buf.height = CVPixelBufferGetHeight(pixelBufferOut);
    buf.width = CVPixelBufferGetWidth(pixelBufferOut);
    buf.rowBytes = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    v26.data = CVPixelBufferGetBaseAddress(v28);
    v26.height = CVPixelBufferGetHeight(v28);
    v26.width = CVPixelBufferGetWidth(v28);
    v26.rowBytes = CVPixelBufferGetBytesPerRow(v28);
    vImage_Error v16 = vImageConvert_ARGB8888toRGB888(&buf, &v26, 0x10u);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    CVPixelBufferUnlockBaseAddress(v28, 0);
    if (v16)
    {
      uint64_t v17 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long v22 = 0;
        _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_ERROR, " Could not convert ARGB to RGB ", v22, 2u);
      }

      CVPixelBufferRelease(pixelBufferOut);
      CVPixelBufferRelease(v28);
      uint64_t v10 = 4294960633;
    }
    else
    {
      CVPixelBufferLockBaseAddress(v28, 0);
      unsigned int Width = CVPixelBufferGetWidth(v28);
      *(void *)long long v22 = 0;
      unint64_t v23 = Width | ((unint64_t)CVPixelBufferGetHeight(v28) << 32);
      size_t v24 = (CVPixelBufferGetBytesPerRowOfPlane(v28, 0) << 32) | 3;
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v28, 0);
      [v3 UTF8String];
      LOBYTE(Width) = cva::imwrite<cva::Matrix<unsigned char,3u,1u,false>>();
      CVPixelBufferUnlockBaseAddress(v28, 0);
      CVPixelBufferRelease(v28);
      CVPixelBufferRelease(pixelBufferOut);
      if (Width)
      {
        uint64_t v10 = 0;
      }
      else
      {
        unint64_t v19 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CGAffineTransform v21 = 0;
          _os_log_impl(&dword_21B7C6000, v19, OS_LOG_TYPE_ERROR, " Could not save image to file ", v21, 2u);
        }

        uint64_t v10 = 4294960636;
      }
    }
  }
LABEL_42:

  return v10;
}

void sub_21B7EAEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t convertFormatYCbCrToARGB(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  if (a1)
  {
    int v7 = Height;
    OSType v8 = CVPixelBufferGetPixelFormatType(*a2);
    int v9 = CVPixelBufferGetWidth(*a2);
    int v10 = CVPixelBufferGetHeight(*a2);
    if (v8 == 32)
    {
      if (v10 == v7 && v9 == Width)
      {
        CVPixelBufferLockBaseAddress(*a2, 0);
        CVPixelBufferLockBaseAddress(a1, 0);
        double v13 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x263EFAB28];
        *(_DWORD *)permuteMap = 50462976;
        if ((PixelFormatType | 0x10) == 0x34323076)
        {
          v11.i32[0] = 875704422;
          v12.i32[0] = PixelFormatType;
          int8x8_t v14 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v12, v11), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
          pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
          pixelRange.CbCr_bias = 128;
          pixelRange.YpRangeMax = v14.i32[0];
          if (PixelFormatType == 875704422) {
            int32_t v15 = 255;
          }
          else {
            int32_t v15 = 240;
          }
          pixelRange.CbCrRangeMax = v15;
          *(int8x8_t *)&pixelRange.YpMax = v14;
          pixelRange.CbCrMax = v15;
          pixelRange.CbCrMiint n = 16 * (PixelFormatType != 875704422);
          if (vImageConvert_YpCbCrToARGB_GenerateConversion(v13, &pixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0))
          {
            vImage_Error v16 = __ABPKLogSharedInstance();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.data) = 0;
              _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, " Could not generate the conversion format ", (uint8_t *)&buf, 2u);
            }
          }
          memset(&buf, 0, sizeof(buf));
          __convertFormatYCbCrToARGB_block_invoke(a1, 0, (uint64_t)&buf);
          memset(&srcCbCr, 0, sizeof(srcCbCr));
          __convertFormatYCbCrToARGB_block_invoke(a1, 1uLL, (uint64_t)&srcCbCr);
          memset(&dest, 0, sizeof(dest));
          __convertFormatYCbCrToARGB_block_invoke(*a2, 0, (uint64_t)&dest);
          if (!vImageConvert_420Yp8_CbCr8ToARGB8888(&buf, &srcCbCr, &dest, &outInfo, permuteMap, 0xFFu, 0))
          {
            uint64_t v19 = 0;
            goto LABEL_32;
          }
          uint64_t v17 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v22 = 0;
            _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_ERROR, " Could not convert color formats ", v22, 2u);
          }
        }
        else
        {
          CGAffineTransform v21 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)outInfo.opaque = 0;
            _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_ERROR, " Pixel format not supported ", outInfo.opaque, 2u);
          }
        }
        uint64_t v19 = 4294960636;
LABEL_32:
        CVPixelBufferUnlockBaseAddress(*a2, 0);
        CVPixelBufferUnlockBaseAddress(a1, 0);
        return v19;
      }
      CGAffineTransform v18 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have same dimensions as input pixel buffer ", outInfo.opaque, 2u);
      }
    }
    else
    {
      CGAffineTransform v18 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have format kCVPixelFormatType_32ARGB ", outInfo.opaque, 2u);
      }
    }
  }
  else
  {
    CGAffineTransform v18 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)outInfo.opaque = 0;
      _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Input buffer cannot be null ", outInfo.opaque, 2u);
    }
  }

  return 0;
}

uint64_t changeChannelsARGB(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  *(_DWORD *)permuteMap = 66051;
  vImage_Error v4 = vImagePermuteChannels_ARGB8888(&src, &dest, permuteMap, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (!v4) {
    return 0;
  }
  signed int v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not convert ARGB to RGB ", v7, 2u);
  }

  return 4294960633;
}

uint64_t saveDepthBufferToFile(__CVBuffer *a1, void *a2, float a3)
{
  id v5 = a2;
  CVPixelBufferLockBaseAddress(a1, 0);
  long long v27 = 0u;
  long long v28 = 0u;
  wrapCVPixelBufferVImage(a1, (void **)&v27);
  long long v6 = v28;
  long long v7 = v27;
  unint64_t v8 = v28 | ((unint64_t)DWORD2(v27) << 32);
  unint64_t v9 = (((void)v28 << 33) + 0xF00000000) & 0xFFFFFFF000000000;
  uint64_t v29 = v9 | 2;
  unint64_t v30 = v8;
  int v10 = (char *)cva::Array<unsigned short,2u,16u>::allocate((uint64_t)&v30, (uint64_t)&v29);
  vImage_Buffer v26 = v10;
  if (v6)
  {
    uint64_t v11 = 0;
    do
    {
      if (DWORD2(v7))
      {
        uint64_t v12 = 0;
        do
        {
          uint64_t v13 = 0;
          uint64_t v29 = v11 | (v12 << 32);
          unint64_t v30 = v8;
          do
          {
            unsigned int v14 = *(_DWORD *)((char *)&v29 + v13);
            unsigned int v15 = *(_DWORD *)((char *)&v30 + v13);
            BOOL v16 = v14 >= v15 || v13 == 4;
            v13 += 4;
          }
          while (!v16);
          if (v14 >= v15) {
            goto LABEL_28;
          }
          uint64_t v17 = 0;
          float v18 = *(float *)(v7 + (4 * v11 + v12 * DWORD2(v6))) * a3;
          BOOL v19 = v18 < 0.0;
          if (v18 > 65535.0) {
            BOOL v19 = 1;
          }
          uint64_t v29 = v11 | (v12 << 32);
          unint64_t v30 = v8;
          do
          {
            unsigned int v20 = *(_DWORD *)((char *)&v29 + v17);
            unsigned int v21 = *(_DWORD *)((char *)&v30 + v17);
            BOOL v22 = v20 >= v21 || v17 == 4;
            v17 += 4;
          }
          while (!v22);
          if (v20 >= v21) {
LABEL_28:
          }
            __assert_rtn("operator[]", "arrayview.h", 267, "(check_bounds(*this, idx)) || cva::detail::assertMessage(\"Index out of bounds!\")");
          int v23 = (int)v18;
          if (v19) {
            LOWORD(v23) = 0;
          }
          *(_WORD *)&v10[(2 * v11 + HIDWORD(v9) * v12++) & 0xFFFFFFFE] = v23;
        }
        while (v12 != DWORD2(v7));
      }
      ++v11;
    }
    while (v11 != v6);
  }
  id v24 = v5;
  objc_msgSend(v24, "UTF8String", 0, v8, v9 | 2);
  cva::imwrite<unsigned short>();
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (v26) {
    free(v26);
  }

  return 0;
}

void sub_21B7EB610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

size_t __convertFormatYCbCrToARGB_block_invoke@<X0>(CVPixelBufferRef pixelBuffer@<X1>, size_t planeIndex@<X2>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(void *)a3 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
  *(void *)(a3 + 8) = CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
  *(void *)(a3 + 16) = CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
  size_t result = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
  *(void *)(a3 + 24) = result;
  return result;
}

uint64_t convertFormatYCbCrToBGRA(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  int Width = CVPixelBufferGetWidth(a1);
  int Height = CVPixelBufferGetHeight(a1);
  if (a1)
  {
    int v7 = Height;
    OSType v8 = CVPixelBufferGetPixelFormatType(*a2);
    int v9 = CVPixelBufferGetWidth(*a2);
    int v10 = CVPixelBufferGetHeight(*a2);
    if (v8 == 1111970369)
    {
      if (v10 == v7 && v9 == Width)
      {
        CVPixelBufferLockBaseAddress(*a2, 0);
        CVPixelBufferLockBaseAddress(a1, 0);
        uint64_t v13 = (const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x263EFAB28];
        *(_DWORD *)permuteMap = 66051;
        if ((PixelFormatType | 0x10) == 0x34323076)
        {
          v11.i32[0] = 875704422;
          v12.i32[0] = PixelFormatType;
          int8x8_t v14 = vbsl_s8((int8x8_t)vdup_lane_s32(vceq_s32(v12, v11), 0), (int8x8_t)0x1000000FFLL, (int8x8_t)0x10000000EBLL);
          pixelRange.Yp_bias = 16 * (PixelFormatType != 875704422);
          pixelRange.CbCr_bias = 128;
          pixelRange.YpRangeMax = v14.i32[0];
          if (PixelFormatType == 875704422) {
            int32_t v15 = 255;
          }
          else {
            int32_t v15 = 240;
          }
          pixelRange.CbCrRangeMax = v15;
          *(int8x8_t *)&pixelRange.YpMax = v14;
          pixelRange.CbCrMax = v15;
          pixelRange.CbCrMiint n = 16 * (PixelFormatType != 875704422);
          if (vImageConvert_YpCbCrToARGB_GenerateConversion(v13, &pixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0))
          {
            BOOL v16 = __ABPKLogSharedInstance();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.data) = 0;
              _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, " Could not generate the conversion format ", (uint8_t *)&buf, 2u);
            }
          }
          memset(&buf, 0, sizeof(buf));
          __convertFormatYCbCrToARGB_block_invoke(a1, 0, (uint64_t)&buf);
          memset(&srcCbCr, 0, sizeof(srcCbCr));
          __convertFormatYCbCrToARGB_block_invoke(a1, 1uLL, (uint64_t)&srcCbCr);
          memset(&dest, 0, sizeof(dest));
          __convertFormatYCbCrToARGB_block_invoke(*a2, 0, (uint64_t)&dest);
          if (!vImageConvert_420Yp8_CbCr8ToARGB8888(&buf, &srcCbCr, &dest, &outInfo, permuteMap, 0xFFu, 0))
          {
            uint64_t v19 = 0;
            goto LABEL_32;
          }
          uint64_t v17 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)BOOL v22 = 0;
            _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_ERROR, " Could not convert color formats ", v22, 2u);
          }
        }
        else
        {
          unsigned int v21 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)outInfo.opaque = 0;
            _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_ERROR, " Pixel format not supported ", outInfo.opaque, 2u);
          }
        }
        uint64_t v19 = 4294960636;
LABEL_32:
        CVPixelBufferUnlockBaseAddress(*a2, 0);
        CVPixelBufferUnlockBaseAddress(a1, 0);
        return v19;
      }
      float v18 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have same dimensions as input pixel buffer ", outInfo.opaque, 2u);
      }
    }
    else
    {
      float v18 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)outInfo.opaque = 0;
        _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Output pixel buffer must have format kCVPixelFormatType_32BGRA ", outInfo.opaque, 2u);
      }
    }
  }
  else
  {
    float v18 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)outInfo.opaque = 0;
      _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_ERROR, " Input buffer cannot be null ", outInfo.opaque, 2u);
    }
  }

  return 0;
}

uint64_t convertFormatGrayscaleToYCbCr(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  if (CVPixelBufferGetPixelFormatType(a1) == 1278226488)
  {
    if (CVPixelBufferGetPixelFormatType(*a2) == 875704422 || CVPixelBufferGetPixelFormatType(*a2) == 875704438)
    {
      CVPixelBufferRef pixelBufferOut = 0;
      size_t Width = CVPixelBufferGetWidth(a1);
      size_t Height = CVPixelBufferGetHeight(a1);
      uint64_t v14 = *MEMORY[0x263F04130];
      v15[0] = MEMORY[0x263EFFA78];
      CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x20u, v6, &pixelBufferOut))
      {
        int v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int32x2_t v12 = 0;
          OSType v8 = " Could not create pixelBuffer for kCVPixelFormatType_32ARGB. ";
LABEL_13:
          _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, v8, v12, 2u);
        }
      }
      else
      {
        convertFormatGrayScaleToARGB_BGRA(a1, &pixelBufferOut);
        if (!convertFormatARGBToYCbCr(pixelBufferOut, a2))
        {
          CVPixelBufferRelease(pixelBufferOut);
          uint64_t v10 = 0;
          goto LABEL_15;
        }
        int v7 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int32x2_t v12 = 0;
          OSType v8 = " Could not convert pixelBuffer from ARGB->YCbCr ";
          goto LABEL_13;
        }
      }

      CVPixelBufferRelease(pixelBufferOut);
      uint64_t v10 = 4294960636;
LABEL_15:

      return v10;
    }
    int v9 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pixelBufferOut) = 0;
      _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, " Output pixel buffer must have format kCVPixelFormatType_420YpCbCr8BiPlanarFullRange or kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange ", (uint8_t *)&pixelBufferOut, 2u);
    }
  }
  else
  {
    int v9 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pixelBufferOut) = 0;
      _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, " Input pixel buffer must have format kCVPixelFormatType_OneComponent8 ", (uint8_t *)&pixelBufferOut, 2u);
    }
  }

  return 4294960635;
}

void sub_21B7EBD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t convertFormatGrayScaleToARGB_BGRA(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  dest.data = CVPixelBufferGetBaseAddress(*a2);
  dest.height = CVPixelBufferGetHeight(*a2);
  dest.width = CVPixelBufferGetWidth(*a2);
  dest.rowBytes = CVPixelBufferGetBytesPerRow(*a2);
  v5.data = CVPixelBufferGetBaseAddress(a1);
  v5.height = CVPixelBufferGetHeight(a1);
  v5.width = CVPixelBufferGetWidth(a1);
  v5.rowBytes = CVPixelBufferGetBytesPerRow(a1);
  vImageOverwriteChannels_ARGB8888(&v5, &dest, &dest, 2u, 0x10u);
  vImageOverwriteChannels_ARGB8888(&v5, &dest, &dest, 4u, 0x10u);
  vImageOverwriteChannels_ARGB8888(&v5, &dest, &dest, 8u, 0x10u);
  vImageOverwriteChannelsWithScalar_ARGB8888(0xFFu, &dest, &dest, 1u, 0x10u);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  return 0;
}

uint64_t cropImage(__CVBuffer *a1, CVPixelBufferRef *a2, unsigned int *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = a3[1];
  vImagePixelCount v7 = a3[2];
  vImagePixelCount v8 = a3[3];
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  src.width = v8;
  src.rowBytes = CVPixelBufferGetBytesPerRow(a1);
  src.data = &BaseAddress[4 * v6 + src.rowBytes * v5];
  src.height = v7;
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  vImage_Error v10 = vImageScale_ARGB8888(&src, &dest, 0, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  if (!v10) {
    return 0;
  }
  int32x2_t v11 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_ERROR, " Could not crop image ", v13, 2u);
  }

  return 4294960633;
}

uint64_t flipImage(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  vImage_Error v4 = vImageVerticalReflect_ARGB8888(&src, &dest, 0x10u);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)vImagePixelCount v7 = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not flip image ", v7, 2u);
  }

  return 4294960633;
}

uint64_t rotateImage90(__CVBuffer *a1, int a2, CVPixelBufferRef *a3)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a3, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a3, &dest.data);
  uint8_t v6 = 0;
  if (a2 > 89)
  {
    if (a2 <= 269)
    {
      if (a2 != 90)
      {
        if (a2 != 180) {
          goto LABEL_15;
        }
LABEL_9:
        uint8_t v6 = 2;
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    if (a2 != 270)
    {
      if (a2 != 360) {
        goto LABEL_15;
      }
      goto LABEL_19;
    }
LABEL_18:
    uint8_t v6 = 1;
    goto LABEL_19;
  }
  if (a2 <= -91)
  {
    if (a2 != -270)
    {
      if (a2 != -180) {
        goto LABEL_15;
      }
      goto LABEL_9;
    }
LABEL_17:
    uint8_t v6 = 3;
    goto LABEL_19;
  }
  if (a2 == -90) {
    goto LABEL_18;
  }
  if (a2)
  {
LABEL_15:
    vImagePixelCount v7 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int32x2_t v11 = 0;
      vImagePixelCount v8 = " Invalid rotation angle specified ";
LABEL_22:
      _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_ERROR, v8, v11, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_19:
  vImage_Error v9 = vImageRotate90_ARGB8888(&src, &dest, v6, rotateImage90::bgColor, 0x10u);
  CVPixelBufferUnlockBaseAddress(*a3, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (v9)
  {
    vImagePixelCount v7 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int32x2_t v11 = 0;
      vImagePixelCount v8 = " Could not rotate image ";
      goto LABEL_22;
    }
LABEL_23:

    return 4294960633;
  }
  return 0;
}

uint64_t scaleImage(__CVBuffer *a1, CVPixelBufferRef *a2)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  memset(&src, 0, sizeof(src));
  wrapCVPixelBufferVImage(a1, &src.data);
  memset(&dest, 0, sizeof(dest));
  wrapCVPixelBufferVImage(*a2, &dest.data);
  vImage_Error v4 = vImageScale_ARGB8888(&src, &dest, 0, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  CVPixelBufferUnlockBaseAddress(a1, 0);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)vImagePixelCount v7 = 0;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not scale image ", v7, 2u);
  }

  return 4294960633;
}

uint64_t padImage(__CVBuffer *a1, CVPixelBufferRef *a2, uint64_t a3, uint64_t a4)
{
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(*a2, 0);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t v12 = CVPixelBufferGetBytesPerRow(*a2);
  uint64_t v13 = (char *)CVPixelBufferGetBaseAddress(*a2);
  if (Height)
  {
    uint64_t v14 = &v13[(a4 << (2 * (PixelFormatType != 1278226488))) + v12 * a3];
    do
    {
      memcpy(v14, BaseAddress, BytesPerRow);
      v14 += v12;
      BaseAddress += BytesPerRow;
      --Height;
    }
    while (Height);
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(*a2, 0);
  return 0;
}

void reprojectOnImage(uint64_t a1, uint64_t a2, void *a3, float a4, double a5, double a6, float32x4_t a7, float32x4_t a8, float32x4_t a9, float32x4_t a10)
{
  int v34 = HIDWORD(a5);
  v36[2] = *MEMORY[0x263EF8340];
  id v12 = a3;
  if (a2)
  {
    uint64_t v13 = 0;
    _S8 = v34;
    do
    {
      *(double *)v15.i64 = transform_point(a7, a8, a9, a10, *(float32x4_t *)(a1 + 16 * v13));
      float32x4_t v16 = v15;
      float v17 = v15.f32[2];
      v15.i32[1] = HIDWORD(a6);
      __int32 v35 = v16.i32[1];
      v15.f32[0] = vmlas_n_f32(vmuls_lane_f32(*(float *)&a6, v16, 2), a4, v16.f32[0]) / v15.f32[2];
      float v18 = [NSNumber numberWithFloat:*(double *)v15.i64];
      _V1.S[1] = v35;
      __asm { FMLA            S0, S8, V1.S[1] }
      *(float *)&double v25 = _S0 / v17;
      v36[0] = v18;
      vImage_Buffer v26 = [NSNumber numberWithFloat:v25];
      v36[1] = v26;
      long long v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
      [v12 setObject:v27 atIndexedSubscript:v13];

      ++v13;
    }
    while (a2 != v13);
  }
}

void sub_21B7EC554(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id normalize2dKeypoints(NSMutableArray *a1, CGSize a2)
{
  double height = a2.height;
  double width = a2.width;
  v19[2] = *MEMORY[0x263EF8340];
  vImage_Error v4 = a1;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](v4, "count"));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  for (unint64_t i = 0; [(NSMutableArray *)v4 count] > i; ++i)
  {
    uint8_t v6 = NSNumber;
    vImagePixelCount v7 = [(NSMutableArray *)v4 objectAtIndexedSubscript:i];
    vImagePixelCount v8 = [v7 objectAtIndexedSubscript:0];
    [v8 floatValue];
    vImage_Error v10 = [v6 numberWithDouble:v9 / width];
    v19[0] = v10;
    int32x2_t v11 = NSNumber;
    id v12 = [(NSMutableArray *)v4 objectAtIndexedSubscript:i];
    uint64_t v13 = [v12 objectAtIndexedSubscript:1];
    [v13 floatValue];
    float32x4_t v15 = [v11 numberWithDouble:v14 / height];
    v19[1] = v15;
    float32x4_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    [v18 setObject:v16 atIndexedSubscript:i];
  }
  return v18;
}

void sub_21B7EC74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t overlay2dSkeleton(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, double a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [v13 generateStickFigureImageFrom:a1 detectedBodies2d:v10 confidences:v11 skeletonDefinition:v12 overlayImage:a5 color:0 faceOnly:a6];

  return v14;
}

void sub_21B7EC870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t overlay2dBoundingBox(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = objc_msgSend(v13, "drawBoundingBox:withColor:OnImage:andGenerateOverlayImage:", a1, a2, a3, a4, a5, a6, a7);

  return v14;
}

void sub_21B7EC928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t overlay2dFace(uint64_t a1, void *a2, void *a3, uint64_t a4, __n128 a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = objc_opt_new();
  if (*(_DWORD *)[v9 visibility] == 1
    && *(_DWORD *)([v9 visibility] + 56) == 1
    && *(_DWORD *)([v9 visibility] + 60) == 1
    && *(_DWORD *)([v9 visibility] + 68) == 1
    && *(_DWORD *)([v9 visibility] + 72) == 1)
  {
    id v11 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)vImage_Buffer buf = 0;
      _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_INFO, " Not all 5 face joints are visible. This person is probably not facing the camera at this frame. ", buf, 2u);
    }

    id v12 = [v9 skeletonDefinition];
    [v10 drawFaceBbox:a1 detectedBodies2d:v8 skeletonDefinition:v12 overlayImage:a4 color:a5.n128_f64[0]];
  }
  uint64_t v13 = objc_msgSend(v9, "skeletonDefinition", *(_OWORD *)&a5);
  uint64_t v14 = [v10 generateStickFigureImageFrom:a1 detectedBodies2d:v8 confidences:0 skeletonDefinition:v13 overlayImage:a4 color:1 faceOnly:v17];

  return v14;
}

void sub_21B7ECAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t overlay2dResultOnImage(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  v38[2] = *MEMORY[0x263EF8340];
  id v6 = a1;
  vImagePixelCount v7 = [v6 skeletonDefinition];
  uint64_t v8 = [v7 jointCount];

  id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v8];
  id v10 = [MEMORY[0x263EFF980] arrayWithCapacity:v8];
  uint64_t v36 = a3;
  [v6 imageRes];
  double v12 = v11;
  [v6 imageRes];
  if (v8)
  {
    uint64_t v14 = 0;
    float v15 = v12;
    float v16 = v13;
    uint64_t v34 = v8 - 1;
    char v17 = 1;
LABEL_3:
    char v35 = v17;
    uint64_t v18 = (8 * v14) | 4;
    do
    {
      uint64_t v19 = NSNumber;
      double v20 = *(double *)(objc_msgSend(v6, "keypoints2d", v34) + 8 * v14);
      *(float *)&double v20 = *(float *)&v20 / v15;
      unsigned int v21 = [v19 numberWithFloat:v20];
      v38[0] = v21;
      BOOL v22 = NSNumber;
      *(float *)&double v23 = *(float *)([v6 keypoints2d] + v18) / v16;
      id v24 = [v22 numberWithFloat:v23];
      v38[1] = v24;
      double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
      [v9 setObject:v25 atIndexedSubscript:v14];

      vImage_Buffer v26 = NSNumber;
      LODWORD(v27) = *(_DWORD *)([v6 confidences] + 4 * v14);
      long long v28 = [v26 numberWithFloat:v27];
      [v10 setObject:v28 atIndexedSubscript:v14];

      if (*(float *)([v6 confidences] + 4 * v14) != 0.5
        && *(float *)([v6 confidences] + 4 * v14) != 0.0)
      {
        char v17 = 0;
        if (v34 != v14++) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
      ++v14;
      v18 += 8;
    }
    while (v8 != v14);
    if (v35) {
      goto LABEL_12;
    }
LABEL_13:
    unint64_t v30 = [v6 skeletonDefinition];
    uint64_t v31 = overlay2dSkeleton(a2, v9, v10, v30, v36, a4);
  }
  else
  {
LABEL_12:
    unint64_t v30 = [v6 skeletonDefinition];
    uint64_t v31 = overlay2dSkeleton(a2, v9, 0, v30, v36, a4);
  }
  uint64_t v32 = v31;

  return v32;
}

void sub_21B7ECDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t overlay3dResultOnImage(void *a1, uint64_t a2, uint64_t a3, __n128 a4, __n128 a5, __n128 a6, CGFloat a7, CGFloat a8, __n128 a9)
{
  __n128 v29 = a9;
  __n128 v31 = a4;
  __n128 v32 = a5;
  __n128 v33 = a6;
  id v13 = a1;
  uint64_t v14 = [v13 skeletonDefinition];
  uint64_t v15 = [v14 jointCount];

  float v16 = [MEMORY[0x263EFF980] arrayWithCapacity:v15];
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(__p, v15);
  if (v15)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 48;
    do
    {
      uint64_t v19 = objc_msgSend(v13, "modelPoses", *(_OWORD *)&v29, *(_OWORD *)&v31, *(_OWORD *)&v32, *(_OWORD *)&v33);
      *((_OWORD *)__p[0] + v17++) = *(_OWORD *)(v19 + v18);
      v18 += 64;
    }
    while (v15 != v17);
  }
  double v20 = __p[0];
  objc_msgSend(v13, "cameraRootTransform", v29.n128_u64[0]);
  reprojectOnImage((uint64_t)v20, v15, v16, v31.n128_f32[0], v32.n128_f64[0], v33.n128_f64[0], v21, v22, v23, v24);
  v35.double width = a7;
  v35.double height = a8;
  double v25 = normalize2dKeypoints(v16, v35);
  vImage_Buffer v26 = [v13 skeletonDefinition];
  uint64_t v27 = overlay2dSkeleton(a2, v25, 0, v26, a3, v30);

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v27;
}

void sub_21B7ECFB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

uint64_t drawFullyVisibleFace(void *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  v26[2] = *MEMORY[0x263EF8340];
  id v6 = a1;
  vImagePixelCount v7 = [v6 skeletonDefinition];
  uint64_t v8 = [v7 jointCount];

  id v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v8];
  [v6 imageRes];
  double v11 = v10;
  [v6 imageRes];
  if (v8)
  {
    uint64_t v13 = 0;
    float v14 = v11;
    float v15 = v12;
    do
    {
      float v16 = NSNumber;
      double v17 = *(double *)([v6 keypoints2d] + 8 * v13);
      *(float *)&double v17 = *(float *)&v17 / v14;
      uint64_t v18 = [v16 numberWithFloat:v17];
      v26[0] = v18;
      uint64_t v19 = NSNumber;
      *(float *)&double v20 = *(float *)([v6 keypoints2d] + 8 * v13 + 4) / v15;
      float32x4_t v21 = [v19 numberWithFloat:v20];
      v26[1] = v21;
      float32x4_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
      [v9 setObject:v22 atIndexedSubscript:v13];

      ++v13;
    }
    while (v13 != v8);
  }
  uint64_t v23 = overlay2dFace(a2, v9, v6, a3, a4);

  return v23;
}

void sub_21B7ED1B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL transferCVPixelBuffer(__CVBuffer *a1, __CVBuffer *a2)
{
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &pixelTransferSessionOut);
  OSStatus v4 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a1, a2);
  if (v4)
  {
    uint64_t v5 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)vImagePixelCount v7 = 0;
      _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_ERROR, " Could not transfer image. ", v7, 2u);
    }
  }
  else
  {
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
  }
  return v4 == 0;
}

uint64_t convert16BitDepthToFloat32Depth(__CVBuffer *a1, __CVBuffer *a2)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  OSType v5 = CVPixelBufferGetPixelFormatType(a2);
  BOOL v6 = PixelFormatType == 1278226742 && v5 == 1717855600;
  uint64_t v7 = v6;
  if (v6)
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    size_t v9 = CVPixelBufferGetBytesPerRow(a2);
    size_t Height = CVPixelBufferGetHeight(a2);
    size_t Width = CVPixelBufferGetWidth(a2);
    CVPixelBufferLockBaseAddress(a1, 0);
    CVPixelBufferLockBaseAddress(a2, 0);
    BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a1);
    uint64_t v13 = (float *)CVPixelBufferGetBaseAddress(a2);
    if (Height)
    {
      for (uint64_t i = 0; i != Height; ++i)
      {
        size_t v15 = Width;
        float v16 = v13;
        for (uint64_t j = BaseAddress; v15; --v15)
        {
          unsigned int v18 = *j++;
          *v16++ = (float)v18 / 10000.0;
        }
        BaseAddress = (unsigned __int16 *)((char *)BaseAddress + BytesPerRow);
        uint64_t v13 = (float *)((char *)v13 + v9);
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 0);
    CVPixelBufferUnlockBaseAddress(a2, 0);
  }
  else
  {
    uint64_t v19 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float32x4_t v22 = 0;
      _os_log_impl(&dword_21B7C6000, v19, OS_LOG_TYPE_ERROR, " Source buffer must have pixel format kCVPixelFormatType_OneComponent16 and destination buffer kCVPixelFormatType_DepthFloat32. ", v22, 2u);
    }
  }
  return v7;
}

uint64_t unWrapOneComponent16BufferDepth32BitsBuffer(__CVBuffer *a1, __CVBuffer *a2)
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  OSType v5 = CVPixelBufferGetPixelFormatType(a2);
  if (PixelFormatType != 1278226742 || v5 != 1717855600)
  {
    float v16 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    __int16 v25 = 0;
    double v17 = " Source buffer must have pixel format kCVPixelFormatType_OneComponent16 and destination buffer kCVPixelFormatT"
          "ype_DepthFloat32. ";
    unsigned int v18 = (uint8_t *)&v25;
LABEL_16:
    _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_17;
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t v9 = CVPixelBufferGetBytesPerRow(a2);
  size_t v10 = CVPixelBufferGetHeight(a2);
  size_t v11 = CVPixelBufferGetWidth(a2);
  if (Height != v10)
  {
    float v16 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    __int16 v24 = 0;
    double v17 = " Source buffer and destination buffer must have the same height ";
    unsigned int v18 = (uint8_t *)&v24;
    goto LABEL_16;
  }
  size_t v12 = v11;
  if (Width != 2 * v11)
  {
    float v16 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = 0;
      double v17 = " Source buffer must have double the width of the source buffer ";
      unsigned int v18 = (uint8_t *)&v23;
      goto LABEL_16;
    }
LABEL_17:

    return 0;
  }
  CVPixelBufferLockBaseAddress(a1, 0);
  CVPixelBufferLockBaseAddress(a2, 0);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
  float v14 = (char *)CVPixelBufferGetBaseAddress(a2);
  if (BytesPerRow == v9)
  {
    if (Height)
    {
      uint64_t v15 = 0;
      do
      {
        memcpy(&v14[v15], &BaseAddress[v15], BytesPerRow);
        v15 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
  }
  else if (Height)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      if (v12)
      {
        uint64_t v21 = 0;
        size_t v22 = v12;
        do
        {
          *(_WORD *)&v14[v21] = *(_WORD *)&BaseAddress[i * BytesPerRow + (v21 & 0xFFFFFFFC)];
          v21 += 4;
          --v22;
        }
        while (v22);
      }
      v14 += v9;
    }
  }
  CVPixelBufferUnlockBaseAddress(a1, 0);
  CVPixelBufferUnlockBaseAddress(a2, 0);
  return 1;
}

__CFString *getPixelBufferFormatTypeAsString(__CVBuffer *a1)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  BOOL v2 = &stru_26CB8CE70;
  if (PixelFormatType > 1278226487)
  {
    int v3 = 1278226535;
    uint64_t v7 = @"kCVPixelFormatType_DepthFloat32";
    uint64_t v8 = @"kCVPixelFormatType_OneComponent16";
    if (PixelFormatType != 1278226742) {
      uint64_t v8 = &stru_26CB8CE70;
    }
    if (PixelFormatType != 1717855600) {
      uint64_t v7 = v8;
    }
    if (PixelFormatType == 1278226536) {
      BOOL v6 = @"kCVPixelFormatType_OneComponent16Half";
    }
    else {
      BOOL v6 = v7;
    }
    if (PixelFormatType == 1278226534) {
      BOOL v2 = @"kCVPixelFormatType_OneComponent32Float";
    }
    if (PixelFormatType == 1278226488) {
      BOOL v2 = @"kCVPixelFormatType_OneComponent8";
    }
  }
  else
  {
    int v3 = 875704421;
    OSStatus v4 = @"kCVPixelFormatType_32BGRA";
    if (PixelFormatType != 1111970369) {
      OSStatus v4 = &stru_26CB8CE70;
    }
    if (PixelFormatType == 875704438) {
      OSType v5 = @"kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange";
    }
    else {
      OSType v5 = v4;
    }
    if (PixelFormatType == 875704422) {
      BOOL v6 = @"kCVPixelFormatType_420YpCbCr8BiPlanarFullRange";
    }
    else {
      BOOL v6 = v5;
    }
    if (PixelFormatType == 32) {
      BOOL v2 = @"kCVPixelFormatType_32ARGB";
    }
    if (PixelFormatType == 24) {
      BOOL v2 = @"kCVPixelFormatType_24RGB";
    }
  }
  if (PixelFormatType <= v3) {
    return v2;
  }
  else {
    return v6;
  }
}

void *cva::Array<unsigned short,2u,16u>::allocate(uint64_t a1, uint64_t a2)
{
  unint64_t size = *(unsigned int *)(a1 + 4) * (unint64_t)*(unsigned int *)(a2 + 4);
  if (!size) {
    return 0;
  }
  size_t result = malloc_type_malloc(size, 0xA153FF5uLL);
  if (!result) {
    cva::Array<unsigned short,2u,16u>::allocate();
  }
  return result;
}

void printErrorCode(int a1)
{
  switch(a1)
  {
    case -6666:
      CFURLRef v1 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int v3 = 0;
        BOOL v2 = " Skeleton image overlay failed ";
        goto LABEL_19;
      }
      goto LABEL_20;
    case -6665:
      CFURLRef v1 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int v3 = 0;
        BOOL v2 = " Skeleton conversion failed ";
        goto LABEL_19;
      }
      goto LABEL_20;
    case -6664:
      CFURLRef v1 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int v3 = 0;
        BOOL v2 = " 3d camera-bodypose registration failed ";
        goto LABEL_19;
      }
      goto LABEL_20;
    case -6663:
      goto LABEL_7;
    case -6662:
      CFURLRef v1 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int v3 = 0;
      BOOL v2 = " 2d-3d lifting failed ";
      goto LABEL_19;
    case -6661:
      CFURLRef v1 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int v3 = 0;
      BOOL v2 = " 2d Pose estimation failed ";
      goto LABEL_19;
    case -6660:
      CFURLRef v1 = __ABPKLogSharedInstance();
      if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int v3 = 0;
      BOOL v2 = " Image preprocessing failed ";
      goto LABEL_19;
    default:
      if (a1)
      {
LABEL_7:
        CFURLRef v1 = __ABPKLogSharedInstance();
        if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_WORD *)int v3 = 0;
        BOOL v2 = " Invalid error code ";
      }
      else
      {
        CFURLRef v1 = __ABPKLogSharedInstance();
        if (!os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_WORD *)int v3 = 0;
        BOOL v2 = " Algorithm executed successfully ";
      }
LABEL_19:
      _os_log_impl(&dword_21B7C6000, v1, OS_LOG_TYPE_DEBUG, v2, v3, 2u);
LABEL_20:

      return;
  }
}

void sub_21B7EE58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float std::deque<float>::push_back(void *a1, float *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 7) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<float>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  float result = *a2;
  *(float *)(*(void *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
  return result;
}

void sub_21B7EEB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29)
{
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse(_DWORD *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  float v14 = a1 + 6;
  uint64_t v6 = cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S(a1);
  v12[0] = v6;
  v12[1] = v7;
  uint64_t v8 = *a2;
  v13[0] = v12;
  v13[1] = v8;
  if (a1[10] != HIDWORD(v6)) {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
  }
  v15[0] = &v14;
  v15[1] = v13;
  size_t v11 = a1;
  if (a1[5] != v6) {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
  }
  uint64_t v9 = (a1[4] * a1[11]);
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate((void **)a3, v9);
  int v10 = a1[4];
  *(_DWORD *)(a3 + 16) = v14[5];
  *(_DWORD *)(a3 + 20) = v10;
  double v17 = v15;
  unsigned int v18 = &v11;
  if (*(_DWORD *)v13[0] != a1[5]) {
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  }
  int v19 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(a3, (uint64_t)v16);
}

void sub_21B7EED5C(_Unwind_Exception *a1)
{
  free(*v1);
  _Unwind_Resume(a1);
}

void **cva::SVD<cva::Matrix<float,0u,0u,false>,true>::~SVD(void **a1)
{
  return a1;
}

void cva::MatrixData<float,0ul,0ul,false>::reserve(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 8) < a2)
    {
      free(*(void **)a1);
      *(void *)a1 = 0;
      cva::MatrixData<int,0ul,0ul,false>::allocate((void **)a1, a2);
    }
  }
  else
  {
    free(*(void **)a1);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
  }
}

void std::deque<float>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x400;
  unint64_t v4 = v2 - 1024;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      CGSize v35 = &v34[8 * (v33 >> 2)];
      double v37 = &v34[8 * v36];
      float64x2_t v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        double v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)double v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    int v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front((uint64_t)a1, &v54);
    double v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      CGSize v35 = &v34[8 * (v46 >> 2)];
      double v37 = &v34[8 * v47];
      double v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        double v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)double v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      double v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  double v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  double v53 = operator new(0x1000uLL);
  std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front((uint64_t)&v54, v27);
  }
  __n128 v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_21B7EF290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::deque<float>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x400) {
    a2 = 1;
  }
  if (v2 < 0x800) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 1024;
  }
  return v4 ^ 1u;
}

uint64_t cva::SVD<cva::Matrix<float,0u,0u,false>,true>::SVD<cva::Matrix<float,0u,0u,false>>(uint64_t a1, _DWORD *a2, char a3, int a4)
{
  *(_DWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decompose<cva::Matrix<float,0u,0u,false> const&>(a1, a2, a3, a4);
  return a1;
}

void sub_21B7EF37C(_Unwind_Exception *a1)
{
  free(v1[6]);
  free(v1[3]);
  free(*v1);
  _Unwind_Resume(a1);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decompose<cva::Matrix<float,0u,0u,false> const&>(uint64_t a1, _DWORD *a2, char a3, int a4)
{
  int v5 = a2[4];
  int v6 = a2[5];
  *(_DWORD *)(a1 + 72) = v5;
  *(_DWORD *)(a1 + 76) = v6;
  if (!(v5 | v6))
  {
    *(unsigned char *)(a1 + 80) = 1;
LABEL_8:
    uint64_t v7 = *(void **)(a1 + 48);
    *(_DWORD *)(a1 + 64) = 0;
    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 56) = 0;
    free(v7);
    uint64_t v8 = *(void **)a1;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    free(v8);
    uint64_t v9 = *(void **)(a1 + 24);
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    *(void *)(a1 + 24) = 0;
    free(v9);
    return;
  }
  if (a4 && fabsf((float)(v5 - v6)) >= (float)((float)(v6 + v5) * 0.1)) {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeRectangular<cva::Matrix<float,0u,0u,false>>(a1, a2, a3);
  }
  else {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::Matrix<float,0u,0u,false>>(a1, (uint64_t)a2, a3);
  }
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_8;
  }
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = (*(_DWORD *)(a2 + 20) * *(_DWORD *)(a2 + 16));
  __dst[0] = 0;
  __dst[1] = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate(__dst, v6);
  if (v6) {
    memcpy(__dst[0], *(const void **)a2, 4 * v6);
  }
  __dst[2] = *(void **)(a2 + 16);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(a1, (uint64_t)__dst, a3);
  free(__dst[0]);
}

void sub_21B7EF4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeRectangular<cva::Matrix<float,0u,0u,false>>(uint64_t a1, _DWORD *a2, int a3)
{
  char v3 = a3;
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a2[5] >= a2[4])
  {
    double v41 = a2;
    double v44 = (void **)a2;
    uint64_t v45 = &v41;
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>>(a1, &v44, a3 != 0);
    if (!*(unsigned char *)(a1 + 80)) {
      return;
    }
    uint64_t v12 = *(unsigned int *)(a1 + 64);
    if (v12)
    {
      uint64_t v13 = *(float **)(a1 + 48);
      uint64_t v14 = 4 * v12;
      do
      {
        *uint64_t v13 = sqrtf(*v13);
        ++v13;
        v14 -= 4;
      }
      while (v14);
    }
    if ((v3 & 2) == 0) {
      return;
    }
    uint64_t v34 = cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S((_DWORD *)a1);
    CGSize v35 = v15;
    uint64_t v36 = &v34;
    uint64_t v37 = 925353388;
    uint64_t v38 = a1;
    if (*(_DWORD *)(a1 + 20) != v34) {
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
    }
    uint64_t v39 = &v36;
    uint64_t v40 = (uint64_t **)&v38;
    if (*(_DWORD *)(a1 + 16) != a2[4]) {
      cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
    }
    uint64_t v16 = (uint64_t *)(a1 + 24);
    int v17 = HIDWORD(v34);
    if (__PAIR64__(a2[5], HIDWORD(v34)) == *(void *)(a1 + 40))
    {
      uint64_t v45 = (void **)&v39;
      unint64_t v46 = (uint64_t ***)a2;
LABEL_30:
      int v47 = 1065353216;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>(a1 + 24, (uint64_t)&v44);
      return;
    }
    uint64_t v21 = *v16;
    if (*v15 == *v16)
    {
      int v22 = a2[5];
    }
    else
    {
      int v22 = a2[5];
      if (*(void *)a1 != v21 && *(void *)a2 != v21)
      {
        *(_DWORD *)(a1 + 40) = HIDWORD(v34);
        *(_DWORD *)(a1 + 44) = v22;
        cva::MatrixData<float,0ul,0ul,false>::reserve(a1 + 24, (v22 * v17));
        int v23 = a2[4];
        int v24 = *((_DWORD *)*v40 + 4);
        uint64_t v45 = (void **)&v39;
        unint64_t v46 = (uint64_t ***)a2;
        if (v24 != v23) {
          cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
        }
        goto LABEL_30;
      }
    }
    double v41 = 0;
    uint64_t v42 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v41, (v22 * HIDWORD(v34)));
    int v31 = a2[4];
    int v30 = a2[5];
    LODWORD(v43) = *((_DWORD *)*v39 + 1);
    HIDWORD(v43) = v30;
    uint64_t v45 = (void **)&v39;
    unint64_t v46 = (uint64_t ***)a2;
    if (*((_DWORD *)*v40 + 4) != v31) {
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    int v47 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>((uint64_t)&v41, (uint64_t)&v44);
    uint64_t v27 = *(void **)(a1 + 24);
    uint64_t v32 = *(void *)(a1 + 32);
    uint64_t v33 = v42;
    *(void *)(a1 + 24) = v41;
    *(void *)(a1 + 32) = v33;
    double v41 = v27;
    uint64_t v42 = v32;
    *(void *)(a1 + 40) = v43;
LABEL_36:
    uint64_t v43 = 0;
    free(v27);
    return;
  }
  double v41 = a2;
  double v44 = &v41;
  uint64_t v45 = (void **)a2;
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>>(a1, (uint64_t **)&v44, 2 * (a3 != 0));
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v6 = *(unsigned int *)(a1 + 64);
    if (v6)
    {
      uint64_t v7 = *(float **)(a1 + 48);
      uint64_t v8 = 4 * v6;
      do
      {
        float *v7 = sqrtf(*v7);
        ++v7;
        v8 -= 4;
      }
      while (v8);
    }
    if (v3)
    {
      uint64_t v38 = a1 + 24;
      uint64_t v9 = cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S((_DWORD *)a1);
      uint64_t v34 = v9;
      CGSize v35 = v10;
      uint64_t v36 = &v34;
      uint64_t v37 = 925353388;
      if (*(_DWORD *)(a1 + 40) != HIDWORD(v9)) {
        cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
      }
      uint64_t v39 = (uint64_t **)&v38;
      uint64_t v40 = &v36;
      if (a2[5] != *(_DWORD *)(a1 + 44)) {
        cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
      }
      int v11 = a2[4];
      if (v11 == *(_DWORD *)(a1 + 16) && *(_DWORD *)(a1 + 20) == v9)
      {
        uint64_t v45 = (void **)a2;
        unint64_t v46 = &v39;
LABEL_25:
        int v47 = 1065353216;
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>(a1, (uint64_t)&v44);
        return;
      }
      uint64_t v18 = *(void **)a1;
      if (*(void *)a2 != *(void *)a1 && *(void **)(a1 + 24) != v18 && (void *)*v10 != v18)
      {
        *(_DWORD *)(a1 + 16) = v11;
        *(_DWORD *)(a1 + 20) = v9;
        cva::MatrixData<float,0ul,0ul,false>::reserve(a1, (v11 * v9));
        int v19 = a2[5];
        int v20 = *((_DWORD *)*v39 + 5);
        uint64_t v45 = (void **)a2;
        unint64_t v46 = &v39;
        if (v19 != v20) {
          cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse();
        }
        goto LABEL_25;
      }
      double v41 = 0;
      uint64_t v42 = 0;
      cva::MatrixData<int,0ul,0ul,false>::allocate(&v41, (v11 * v9));
      int v25 = *(_DWORD *)*v40;
      int v26 = a2[5];
      LODWORD(v43) = a2[4];
      HIDWORD(v43) = v25;
      uint64_t v45 = (void **)a2;
      unint64_t v46 = &v39;
      if (v26 != *((_DWORD *)*v39 + 5)) {
        __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
      }
      int v47 = 1065353216;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>((uint64_t)&v41, (uint64_t)&v44);
      uint64_t v27 = *(void **)a1;
      uint64_t v28 = *(void *)(a1 + 8);
      uint64_t v29 = v42;
      *(void *)a1 = v41;
      *(void *)(a1 + 8) = v29;
      double v41 = v27;
      uint64_t v42 = v28;
      *(void *)(a1 + 16) = v43;
      goto LABEL_36;
    }
  }
}

void sub_21B7EF944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(uint64_t a1, uint64_t a2, char a3)
{
  unsigned int v6 = *(_DWORD *)(a2 + 16);
  unsigned int v5 = *(_DWORD *)(a2 + 20);
  if ((int)v5 >= (int)v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  *(_DWORD *)(a1 + 64) = v7;
  cva::MatrixData<float,0ul,0ul,false>::reserve(a1 + 48, v7);
  if (a3)
  {
    *(_DWORD *)(a1 + 16) = v6;
    *(_DWORD *)(a1 + 20) = v7;
    cva::MatrixData<float,0ul,0ul,false>::reserve(a1, v7 * v6);
  }
  else
  {
    uint64_t v8 = *(void **)a1;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    free(v8);
  }
  uint64_t v9 = (void **)(a1 + 24);
  if ((a3 & 2) != 0)
  {
    *(_DWORD *)(a1 + 40) = v7;
    *(_DWORD *)(a1 + 44) = v5;
    cva::MatrixData<float,0ul,0ul,false>::reserve(a1 + 24, v7 * v5);
  }
  else
  {
    uint64_t v10 = *v9;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
    *uint64_t v9 = 0;
    free(v10);
  }
  int v15 = 0;
  int v14 = 0;
  cva::vecLib::gesvd<float>();
  v12[0] = 0;
  v12[1] = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate(v12, 0.0);
  unsigned int v13 = 0.0;
  int v11 = (cva::Logger *)cva::vecLib::gesvd<float>();
  if (v14 < 0) {
    __assert_rtn("decomposeDirect", "matrixsvd.h", 439, "(info >= 0) || cva::detail::assertMessage(\"gesvd() compute SVD failed!\")");
  }
  if (v14)
  {
    cva::Logger::instance(v11);
    cva::Logger::logInCategory();
  }
  free(v12[0]);
  *(unsigned char *)(a1 + 80) = v14 == 0;
}

void sub_21B7EFBCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>>(uint64_t a1, uint64_t **a2, char a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unsigned int v6 = a2 + 1;
  uint64_t v7 = (*((_DWORD *)a2[1] + 5) * *(_DWORD *)(**a2 + 20));
  v12[0] = 0;
  v12[1] = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate(v12, v7);
  uint64_t v8 = *a2;
  uint64_t v9 = **a2;
  uint64_t v10 = *v6;
  int v11 = *((_DWORD *)*v6 + 5);
  int v13 = *(_DWORD *)(v9 + 20);
  int v14 = v11;
  uint64_t v16 = v8;
  int v17 = v10;
  if (*(_DWORD *)(v9 + 16) != v10[4]) {
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  }
  int v18 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>((uint64_t)v12, (uint64_t)v15);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(a1, (uint64_t)v12, a3);
  free(v12[0]);
}

void sub_21B7EFCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
}

uint64_t cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S(_DWORD *a1)
{
  unsigned int v2 = a1[18];
  LODWORD(v1) = a1[19];
  if (v1 >= v2) {
    uint64_t v1 = v2;
  }
  else {
    uint64_t v1 = v1;
  }
  if (v1 > a1[16]) {
    cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S();
  }
  return v1 | (v1 << 32);
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<cva::MatrixMultExpr<cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>>(uint64_t a1, void **a2, char a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unsigned int v6 = a2 + 1;
  uint64_t v7 = (*(_DWORD *)(*a2[1] + 16) * *((_DWORD *)*a2 + 4));
  v12[0] = 0;
  v12[1] = 0;
  cva::MatrixData<int,0ul,0ul,false>::allocate(v12, v7);
  uint64_t v8 = *a2;
  uint64_t v9 = *v6;
  uint64_t v10 = **v6;
  int v11 = *(_DWORD *)(v10 + 16);
  int v13 = *((_DWORD *)*a2 + 4);
  int v14 = v11;
  uint64_t v16 = v8;
  int v17 = v9;
  if (v8[5] != *(_DWORD *)(v10 + 20)) {
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  }
  int v18 = 1065353216;
  cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>((uint64_t)v12, (uint64_t)v15);
  cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>(a1, (uint64_t)v12, a3);
  free(v12[0]);
}

void sub_21B7EFE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = **(void **)(a2 + 8);
  if (*(void *)v5 == *(void *)a1 || *(void *)v4 == *(void *)a1)
  {
    uint64_t v8 = (*(_DWORD *)(v4 + 20) * *(_DWORD *)(v5 + 20));
    int v14 = 0;
    uint64_t v15 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v14, v8);
    int v9 = *(_DWORD *)(*(void *)(a2 + 16) + 20);
    LODWORD(v16) = *(_DWORD *)(**(void **)(a2 + 8) + 20);
    HIDWORD(v16) = v9;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>(&v14, a2);
    uint64_t v10 = *(void **)a1;
    uint64_t v11 = *(void *)(a1 + 8);
    uint64_t v12 = v15;
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v12;
    int v14 = v10;
    uint64_t v15 = v11;
    *(void *)(a1 + 16) = v16;
    uint64_t v16 = 0;
    free(v10);
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + 16);
    if (v6 != *(_DWORD *)(v5 + 20) || (int v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v4 + 20)))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      int v6 = *(_DWORD *)(a1 + 16);
      uint64_t v5 = **(void **)(a2 + 8);
      if (v6 != *(_DWORD *)(v5 + 20)
        || (v4 = *(void *)(a2 + 16), int v7 = *(_DWORD *)(v4 + 20), *(_DWORD *)(a1 + 20) != v7))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    if (*(_DWORD *)(v5 + 16) * v6 && v7 * *(_DWORD *)(v4 + 16)) {
      cva::VecLib<float>::gemm();
    }
    if (v6 * v7)
    {
      int v13 = *(void **)a1;
      bzero(v13, 4 * (v6 * v7));
    }
  }
}

void sub_21B7F0018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)v4 == *(void *)a1)
  {
    uint64_t v12 = (***(_DWORD ***)(*(void *)(a2 + 16) + 8) * *(_DWORD *)(v4 + 16));
    int v17 = 0;
    uint64_t v18 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v17, v12);
    int v13 = ***(_DWORD ***)(*(void *)(a2 + 16) + 8);
    LODWORD(v19) = *(_DWORD *)(*(void *)(a2 + 8) + 16);
    HIDWORD(v19) = v13;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>>(&v17, a2);
    int v14 = *(void **)a1;
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v16 = v18;
    *(void *)a1 = v17;
    *(void *)(a1 + 8) = v16;
    int v17 = v14;
    uint64_t v18 = v15;
    *(void *)(a1 + 16) = v19;
    uint64_t v19 = 0;
    free(v14);
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 16);
    if (v5 != *(_DWORD *)(v4 + 16)
      || (int v6 = *(_DWORD *)(a1 + 20), v7 = *(uint64_t ***)(a2 + 16), v6 != *(_DWORD *)*v7[1]))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      int v5 = *(_DWORD *)(a1 + 16);
      uint64_t v4 = *(void *)(a2 + 8);
      if (v5 != *(_DWORD *)(v4 + 16)
        || (v7 = *(uint64_t ***)(a2 + 16), int v6 = *(_DWORD *)*v7[1], *(_DWORD *)(a1 + 20) != v6))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    if (*(_DWORD *)(v4 + 20) * v5)
    {
      uint64_t v8 = (v6 * *(_DWORD *)(**v7 + 20));
      if (v8)
      {
        int v17 = 0;
        uint64_t v18 = 0;
        cva::MatrixData<int,0ul,0ul,false>::allocate(&v17, v8);
        int v9 = *(_DWORD *)*v7[1];
        LODWORD(v19) = *(_DWORD *)(**v7 + 20);
        HIDWORD(v19) = v9;
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((cva::Logger *)&v17, v7);
        cva::VecLib<float>::gemm();
      }
    }
    unsigned int v10 = v5 * v6;
    if (v10)
    {
      uint64_t v11 = *(void **)a1;
      bzero(v11, 4 * v10);
    }
  }
}

void sub_21B7F0254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>(cva::Logger *a1, uint64_t **a2)
{
  int v4 = *((_DWORD *)a1 + 4);
  int v5 = *a2;
  uint64_t v6 = **a2;
  if (v4 != *(_DWORD *)(v6 + 20) || (v7 = *((_DWORD *)a1 + 5), uint64_t v8 = (unsigned int **)a2[1], v9 = *v8, v7 != **v8))
  {
    cva::Logger::instance(a1);
    cva::Logger::logInCategory();
    int v4 = *((_DWORD *)a1 + 4);
    int v5 = *a2;
    uint64_t v6 = **a2;
    if (v4 != *(_DWORD *)(v6 + 20) || (uint64_t v8 = (unsigned int **)a2[1], v9 = *v8, v7 = **v8, *((_DWORD *)a1 + 5) != v7)) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  uint64_t v34 = v8;
  if (v7 >= v9[1]) {
    unsigned int v7 = v9[1];
  }
  if (v7 > *(_DWORD *)(v6 + 16)) {
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>();
  }
  v30[0] = v4;
  v30[1] = v7;
  int v31 = v5;
  uint64_t v32 = 0;
  int v25 = &v34;
  int v27 = v4;
  unsigned int v28 = v7;
  uint64_t v29 = &v25;
  v33[0] = v30;
  v33[1] = &v26;
  uint64_t v10 = *(void *)a1;
  v21[0] = v4;
  v21[1] = v7;
  uint64_t v22 = v10;
  int v23 = v4;
  int v24 = 0;
  cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((uint64_t)v21, v33);
  unsigned int v11 = *(_DWORD *)(*v5 + 16);
  unsigned int v12 = *((_DWORD *)a1 + 5);
  BOOL v13 = v12 >= v11;
  unsigned int v14 = v12 - v11;
  if (v14 != 0 && v13)
  {
    int v15 = *((_DWORD *)a1 + 4);
    uint64_t v16 = *(void *)a1 + 4 * v15 * v11;
    unsigned int v17 = v15 * v14;
    BOOL v18 = v17 == 0;
    if (v17) {
      uint64_t v19 = (unsigned char *)v16;
    }
    else {
      uint64_t v19 = 0;
    }
    int v20 = (unsigned char *)(v16 + 4 * v17);
    if (v18) {
      int v20 = 0;
    }
    if (v19 != v20) {
      bzero(v19, ((v20 - v19 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
    }
  }
}

uint64_t cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 8) - 4 * *(unsigned int *)(a1 + 20);
  if (***(void ***)(*a2 + 8) == v4 || **(void **)(****(void ****)(a2[1] + 16) + 8) == v4)
  {
    int v5 = *(_DWORD *)a1;
    int v6 = *(_DWORD *)(a1 + 4);
    v21[0] = 0;
    v21[1] = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(v21, (v6 * v5));
    int v22 = v5;
    int v23 = v6;
    cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((cva::Logger *)v21, a2);
    int v8 = *(_DWORD *)a1;
    if (*(_DWORD *)a1 != v22 || (int v9 = *(_DWORD *)(a1 + 4), v9 != v23))
    {
      cva::Logger::instance(v7);
      cva::Logger::logInCategory();
      int v8 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 != v22 || (int v9 = *(_DWORD *)(a1 + 4), v9 != v23)) {
        __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
      }
    }
    int v10 = *(_DWORD *)(a1 + 16);
    BOOL v11 = v8 * v9 == 0;
    if (v8 * v9) {
      unsigned int v12 = *(_DWORD **)(a1 + 8);
    }
    else {
      unsigned int v12 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 8) + 4 * (v10 * v9);
    if (v11) {
      uint64_t v13 = 0;
    }
    unsigned int v14 = v21[0];
    if (v12 != (_DWORD *)v13)
    {
      int v15 = 0;
      unsigned int v16 = v10 - v8;
      unsigned int v17 = (int *)v21[0];
      do
      {
        int v18 = *v17++;
        _DWORD *v12 = v18;
        if (v15 + 1 >= v8) {
          unsigned int v19 = v16;
        }
        else {
          unsigned int v19 = 0;
        }
        v12 += v19 + 1;
        if (v15 + 1 < v8) {
          ++v15;
        }
        else {
          int v15 = 0;
        }
      }
      while (v12 != (_DWORD *)v13);
    }
    free(v14);
  }
  else
  {
    cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(a1, a2);
  }
  return a1;
}

void sub_21B7F05AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(cva::Logger *a1, void *a2)
{
  unsigned int v4 = *((_DWORD *)a1 + 4);
  int v5 = (_DWORD *)*a2;
  if (v4 != *(_DWORD *)*a2 || (int v6 = *((_DWORD *)a1 + 5), v6 != v5[1]))
  {
    cva::Logger::instance(a1);
    cva::Logger::logInCategory();
    unsigned int v4 = *((_DWORD *)a1 + 4);
    int v5 = (_DWORD *)*a2;
    if (v4 != *(_DWORD *)*a2 || (int v6 = *((_DWORD *)a1 + 5), v6 != v5[1])) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  uint64_t v7 = v6 * v4;
  if (v7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = a2[1];
    BOOL v11 = *(float **)a1;
    uint64_t v12 = 4 * v7;
    do
    {
      if (v4 <= v9 || v5[1] <= HIDWORD(v9)) {
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>();
      }
      unsigned int v13 = v5[5] + HIDWORD(v9);
      uint64_t v14 = **((void **)v5 + 1);
      unsigned int v15 = *(_DWORD *)(v14 + 16);
      if (v15 <= v13 || (unsigned int v16 = v5[4] + v9, v16 >= *(_DWORD *)(v14 + 20))) {
        -[PolyNomialExtrapolation predict]();
      }
      float v17 = *(float *)(*(void *)v14 + 4 * (v13 + v15 * v16));
      *v11++ = v17
             * cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>::operator()(v10, v8, HIDWORD(v8));
      uint64_t v18 = (v9 + 1);
      unsigned int v4 = *v5;
      if (*v5 <= (int)v18) {
        unint64_t v9 = (v9 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v9 = v9 & 0xFFFFFFFF00000000 | v18;
      }
      uint64_t v19 = (v8 + 1);
      if (*(_DWORD *)(v10 + 4) <= (int)v19) {
        unint64_t v8 = (v8 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v8 = v8 & 0xFFFFFFFF00000000 | v19;
      }
      v12 -= 4;
    }
    while (v12);
  }
}

void cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(uint64_t a1, void *a2)
{
  signed int v4 = *(_DWORD *)a1;
  int v5 = (_DWORD *)*a2;
  if (*(_DWORD *)a1 != *(_DWORD *)*a2 || (int v6 = *(_DWORD *)(a1 + 4), v6 != v5[1]))
  {
    cva::Logger::instance((cva::Logger *)a1);
    cva::Logger::logInCategory();
    signed int v4 = *(_DWORD *)a1;
    int v5 = (_DWORD *)*a2;
    if (*(_DWORD *)a1 != *(_DWORD *)*a2 || (int v6 = *(_DWORD *)(a1 + 4), v6 != v5[1])) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  int v7 = v6 * v4;
  int v8 = *(_DWORD *)(a1 + 16);
  if (v6 * v4) {
    unint64_t v9 = *(float **)(a1 + 8);
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 8) + 4 * (v8 * v6);
  if (v7) {
    BOOL v11 = (float *)v10;
  }
  else {
    BOOL v11 = 0;
  }
  if (v9 != v11)
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    int v14 = 0;
    uint64_t v15 = a2[1];
    unsigned int v16 = v8 - v4;
    unsigned int v17 = v4;
    do
    {
      if (v17 <= v13 || v5[1] <= HIDWORD(v13)) {
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>();
      }
      unsigned int v18 = v5[5] + HIDWORD(v13);
      uint64_t v19 = **((void **)v5 + 1);
      unsigned int v20 = *(_DWORD *)(v19 + 16);
      if (v20 <= v18 || (unsigned int v21 = v5[4] + v13, v21 >= *(_DWORD *)(v19 + 20))) {
        -[PolyNomialExtrapolation predict]();
      }
      float v22 = *(float *)(*(void *)v19 + 4 * (v18 + v20 * v21));
      *unint64_t v9 = v22
          * cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>::operator()(v15, v12, HIDWORD(v12));
      uint64_t v23 = (v13 + 1);
      unsigned int v17 = *v5;
      if (*v5 <= (int)v23) {
        unint64_t v13 = (v13 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v13 = v13 & 0xFFFFFFFF00000000 | v23;
      }
      uint64_t v24 = (v12 + 1);
      if (*(_DWORD *)(v15 + 4) <= (int)v24) {
        unint64_t v12 = (v12 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v12 = v12 & 0xFFFFFFFF00000000 | v24;
      }
      if (v14 + 1 >= v4) {
        unsigned int v25 = v16;
      }
      else {
        unsigned int v25 = 0;
      }
      v9 += v25 + 1;
      if (v14 + 1 < v4) {
        ++v14;
      }
      else {
        int v14 = 0;
      }
    }
    while (v9 != v11);
  }
}

float cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>::operator()(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 4) <= a2 || *(_DWORD *)(a1 + 8) <= a3) {
    -[PolyNomialExtrapolation predict]();
  }
  char v3 = ***(float ****)(a1 + 16);
  unsigned int v4 = *(_DWORD *)(*(void *)v3 + 4);
  if (**(_DWORD **)v3 < v4) {
    unsigned int v4 = **(_DWORD **)v3;
  }
  unsigned int v5 = a3 % v4;
  uint64_t v6 = *(void *)(*(void *)v3 + 8);
  if (*(_DWORD *)(v6 + 16) <= v5) {
    -[PolyNomialExtrapolation predict]();
  }
  float v7 = *(float *)(*(void *)v6 + 4 * v5);
  float v8 = fabsf(v7);
  float result = 1.0 / v7;
  if (v8 < v3[2]) {
    return 0.0;
  }
  return result;
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = **(void **)(a2 + 16);
  if (*(void *)v4 == *(void *)a1 || *(void *)v5 == *(void *)a1)
  {
    uint64_t v8 = (*(_DWORD *)(v5 + 16) * *(_DWORD *)(v4 + 16));
    int v14 = 0;
    uint64_t v15 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v14, v8);
    int v9 = *(_DWORD *)(**(void **)(a2 + 16) + 16);
    LODWORD(v16) = *(_DWORD *)(*(void *)(a2 + 8) + 16);
    HIDWORD(v16) = v9;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(&v14, a2);
    uint64_t v10 = *(void **)a1;
    uint64_t v11 = *(void *)(a1 + 8);
    uint64_t v12 = v15;
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v12;
    int v14 = v10;
    uint64_t v15 = v11;
    *(void *)(a1 + 16) = v16;
    uint64_t v16 = 0;
    free(v10);
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + 16);
    if (v6 != *(_DWORD *)(v4 + 16) || (int v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v5 + 16)))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      int v6 = *(_DWORD *)(a1 + 16);
      uint64_t v4 = *(void *)(a2 + 8);
      if (v6 != *(_DWORD *)(v4 + 16)
        || (v5 = **(void **)(a2 + 16), int v7 = *(_DWORD *)(v5 + 16), *(_DWORD *)(a1 + 20) != v7))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    if (*(_DWORD *)(v4 + 20) * v6 && v7 * *(_DWORD *)(v5 + 20)) {
      cva::VecLib<float>::gemm();
    }
    if (v6 * v7)
    {
      unint64_t v13 = *(void **)a1;
      bzero(v13, 4 * (v6 * v7));
    }
  }
}

void sub_21B7F0B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)v4 == *(void *)a1)
  {
    uint64_t v12 = (*(_DWORD *)(v4 + 20) * *(_DWORD *)(***(void ***)(a2 + 8) + 4));
    unsigned int v17 = 0;
    uint64_t v18 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v17, v12);
    int v13 = *(_DWORD *)(*(void *)(a2 + 16) + 20);
    LODWORD(v19) = *(_DWORD *)(***(void ***)(a2 + 8) + 4);
    HIDWORD(v19) = v13;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>,cva::Matrix<float,0u,0u,false>>(&v17, a2);
    int v14 = *(void **)a1;
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v16 = v18;
    *(void *)a1 = v17;
    *(void *)(a1 + 8) = v16;
    unsigned int v17 = v14;
    uint64_t v18 = v15;
    *(void *)(a1 + 16) = v19;
    uint64_t v19 = 0;
    free(v14);
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 16);
    int v6 = *(void ***)(a2 + 8);
    if (v5 != *(_DWORD *)(**v6 + 4) || (int v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v4 + 20)))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      int v5 = *(_DWORD *)(a1 + 16);
      int v6 = *(void ***)(a2 + 8);
      if (v5 != *(_DWORD *)(**v6 + 4)
        || (v4 = *(void *)(a2 + 16), int v7 = *(_DWORD *)(v4 + 20), *(_DWORD *)(a1 + 20) != v7))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    uint64_t v8 = (*(_DWORD *)(*v6[1] + 16) * v5);
    if (v8 && v7 * *(_DWORD *)(v4 + 16))
    {
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      cva::MatrixData<int,0ul,0ul,false>::allocate(&v17, v8);
      int v9 = *(_DWORD *)(*v6[1] + 16);
      LODWORD(v19) = *(_DWORD *)(**v6 + 4);
      HIDWORD(v19) = v9;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>((cva::Logger *)&v17, (uint64_t)v6);
      cva::VecLib<float>::gemm();
    }
    unsigned int v10 = v5 * v7;
    if (v10)
    {
      uint64_t v11 = *(void **)a1;
      bzero(v11, 4 * v10);
    }
  }
}

void sub_21B7F0DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

uint64_t cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>>(cva::Logger *a1, uint64_t a2)
{
  unsigned int v4 = *((_DWORD *)a1 + 4);
  int v5 = *(unsigned int ***)a2;
  int v6 = **(unsigned int ***)a2;
  if (v4 != v6[1] || (v7 = *((_DWORD *)a1 + 5), uint64_t v8 = *(uint64_t **)(a2 + 8), v9 = *v8, v7 != *(_DWORD *)(*v8 + 16)))
  {
    cva::Logger::instance(a1);
    cva::Logger::logInCategory();
    unsigned int v4 = *((_DWORD *)a1 + 4);
    int v5 = *(unsigned int ***)a2;
    int v6 = **(unsigned int ***)a2;
    if (v4 != v6[1] || (uint64_t v8 = *(uint64_t **)(a2 + 8), v9 = *v8, v7 = *(_DWORD *)(*v8 + 16), *((_DWORD *)a1 + 5) != v7)) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  CGSize v35 = v5;
  unsigned int v10 = *v6;
  if (*v6 >= v4) {
    unsigned int v10 = v4;
  }
  if (v10 > *(_DWORD *)(v9 + 20)) {
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>();
  }
  v31[0] = v10;
  v31[1] = v7;
  uint64_t v32 = v8;
  uint64_t v33 = 0;
  unsigned int v28 = v10;
  int v29 = v7;
  int v30 = &v35;
  v34[0] = v31;
  v34[1] = &v27;
  uint64_t v11 = *(void *)a1;
  v23[0] = v10;
  v23[1] = v7;
  uint64_t v24 = v11;
  unsigned int v25 = v4;
  int v26 = 0;
  uint64_t result = cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>((uint64_t)v23, v34);
  uint64_t v13 = *(unsigned int *)(*v8 + 20);
  unsigned int v14 = *((_DWORD *)a1 + 4);
  if (v14 > v13)
  {
    int v15 = v14 - v13;
    int v16 = *((_DWORD *)a1 + 5);
    int v17 = v16 * (v14 - v13);
    BOOL v18 = v17 == 0;
    if (v17) {
      uint64_t v19 = (_DWORD *)(*(void *)a1 + 4 * v13);
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = *(void *)a1 + 4 * v13 + 4 * v16 * v14;
    if (v18) {
      uint64_t v20 = 0;
    }
    if (v19 != (_DWORD *)v20)
    {
      int v21 = 0;
      do
      {
        _DWORD *v19 = 0;
        if (v21 + 1 >= v15) {
          unsigned int v22 = v13;
        }
        else {
          unsigned int v22 = 0;
        }
        v19 += v22 + 1;
        if (v21 + 1 < v15) {
          ++v21;
        }
        else {
          int v21 = 0;
        }
      }
      while (v19 != (_DWORD *)v20);
    }
  }
  return result;
}

uint64_t cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 8) - 4 * *(unsigned int *)(a1 + 20);
  if (***(void ***)(*a2 + 8) == v4 || **(void **)(***(void ***)(a2[1] + 16) + 8) == v4)
  {
    int v5 = *(_DWORD *)a1;
    int v6 = *(_DWORD *)(a1 + 4);
    v21[0] = 0;
    v21[1] = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(v21, (v6 * v5));
    int v22 = v5;
    int v23 = v6;
    cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>((cva::Logger *)v21, a2);
    int v8 = *(_DWORD *)a1;
    if (*(_DWORD *)a1 != v22 || (int v9 = *(_DWORD *)(a1 + 4), v9 != v23))
    {
      cva::Logger::instance(v7);
      cva::Logger::logInCategory();
      int v8 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 != v22 || (int v9 = *(_DWORD *)(a1 + 4), v9 != v23)) {
        __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
      }
    }
    int v10 = *(_DWORD *)(a1 + 16);
    BOOL v11 = v8 * v9 == 0;
    if (v8 * v9) {
      uint64_t v12 = *(_DWORD **)(a1 + 8);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 8) + 4 * (v10 * v9);
    if (v11) {
      uint64_t v13 = 0;
    }
    unsigned int v14 = v21[0];
    if (v12 != (_DWORD *)v13)
    {
      int v15 = 0;
      unsigned int v16 = v10 - v8;
      int v17 = (int *)v21[0];
      do
      {
        int v18 = *v17++;
        _DWORD *v12 = v18;
        if (v15 + 1 >= v8) {
          unsigned int v19 = v16;
        }
        else {
          unsigned int v19 = 0;
        }
        v12 += v19 + 1;
        if (v15 + 1 < v8) {
          ++v15;
        }
        else {
          int v15 = 0;
        }
      }
      while (v12 != (_DWORD *)v13);
    }
    free(v14);
  }
  else
  {
    cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(a1, a2);
  }
  return a1;
}

void sub_21B7F1124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(cva::Logger *a1, void *a2)
{
  unsigned int v4 = *((_DWORD *)a1 + 4);
  int v5 = (_DWORD *)*a2;
  if (v4 != *(_DWORD *)*a2 || (int v6 = *((_DWORD *)a1 + 5), v6 != v5[1]))
  {
    cva::Logger::instance(a1);
    cva::Logger::logInCategory();
    unsigned int v4 = *((_DWORD *)a1 + 4);
    int v5 = (_DWORD *)*a2;
    if (v4 != *(_DWORD *)*a2 || (int v6 = *((_DWORD *)a1 + 5), v6 != v5[1])) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  uint64_t v7 = v6 * v4;
  if (v7)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = a2[1];
    BOOL v11 = *(float **)a1;
    uint64_t v12 = 4 * v7;
    do
    {
      if (v4 <= v9 || v5[1] <= HIDWORD(v9)) {
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>();
      }
      unsigned int v13 = v5[5] + HIDWORD(v9);
      uint64_t v14 = **((void **)v5 + 1);
      unsigned int v15 = *(_DWORD *)(v14 + 16);
      if (v15 <= v13 || (unsigned int v16 = v5[4] + v9, v16 >= *(_DWORD *)(v14 + 20))) {
        -[PolyNomialExtrapolation predict]();
      }
      float v17 = *(float *)(*(void *)v14 + 4 * (v13 + v15 * v16));
      *v11++ = v17
             * cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>::operator()(v10, v8, HIDWORD(v8));
      uint64_t v18 = (v9 + 1);
      unsigned int v4 = *v5;
      if (*v5 <= (int)v18) {
        unint64_t v9 = (v9 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v9 = v9 & 0xFFFFFFFF00000000 | v18;
      }
      uint64_t v19 = (v8 + 1);
      if (*(_DWORD *)(v10 + 4) <= (int)v19) {
        unint64_t v8 = (v8 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v8 = v8 & 0xFFFFFFFF00000000 | v19;
      }
      v12 -= 4;
    }
    while (v12);
  }
}

void cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>,cva::detail::MulOp>>(uint64_t a1, void *a2)
{
  signed int v4 = *(_DWORD *)a1;
  int v5 = (_DWORD *)*a2;
  if (*(_DWORD *)a1 != *(_DWORD *)*a2 || (int v6 = *(_DWORD *)(a1 + 4), v6 != v5[1]))
  {
    cva::Logger::instance((cva::Logger *)a1);
    cva::Logger::logInCategory();
    signed int v4 = *(_DWORD *)a1;
    int v5 = (_DWORD *)*a2;
    if (*(_DWORD *)a1 != *(_DWORD *)*a2 || (int v6 = *(_DWORD *)(a1 + 4), v6 != v5[1])) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  int v7 = v6 * v4;
  int v8 = *(_DWORD *)(a1 + 16);
  if (v6 * v4) {
    unint64_t v9 = *(float **)(a1 + 8);
  }
  else {
    unint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 8) + 4 * (v8 * v6);
  if (v7) {
    BOOL v11 = (float *)v10;
  }
  else {
    BOOL v11 = 0;
  }
  if (v9 != v11)
  {
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    int v14 = 0;
    uint64_t v15 = a2[1];
    unsigned int v16 = v8 - v4;
    unsigned int v17 = v4;
    do
    {
      if (v17 <= v13 || v5[1] <= HIDWORD(v13)) {
        cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>();
      }
      unsigned int v18 = v5[5] + HIDWORD(v13);
      uint64_t v19 = **((void **)v5 + 1);
      unsigned int v20 = *(_DWORD *)(v19 + 16);
      if (v20 <= v18 || (unsigned int v21 = v5[4] + v13, v21 >= *(_DWORD *)(v19 + 20))) {
        -[PolyNomialExtrapolation predict]();
      }
      float v22 = *(float *)(*(void *)v19 + 4 * (v18 + v20 * v21));
      *unint64_t v9 = v22
          * cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>::operator()(v15, v12, HIDWORD(v12));
      uint64_t v23 = (v13 + 1);
      unsigned int v17 = *v5;
      if (*v5 <= (int)v23) {
        unint64_t v13 = (v13 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v13 = v13 & 0xFFFFFFFF00000000 | v23;
      }
      uint64_t v24 = (v12 + 1);
      if (*(_DWORD *)(v15 + 4) <= (int)v24) {
        unint64_t v12 = (v12 & 0xFFFFFFFF00000000) + 0x100000000;
      }
      else {
        unint64_t v12 = v12 & 0xFFFFFFFF00000000 | v24;
      }
      if (v14 + 1 >= v4) {
        unsigned int v25 = v16;
      }
      else {
        unsigned int v25 = 0;
      }
      v9 += v25 + 1;
      if (v14 + 1 < v4) {
        ++v14;
      }
      else {
        int v14 = 0;
      }
    }
    while (v9 != v11);
  }
}

float cva::MatrixRepeatExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const>,1u,0u>::operator()(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (*(_DWORD *)(a1 + 4) <= a2 || *(_DWORD *)(a1 + 8) <= a3) {
    -[PolyNomialExtrapolation predict]();
  }
  char v3 = **(float ***)(a1 + 16);
  unsigned int v4 = *(_DWORD *)(*(void *)v3 + 4);
  if (**(_DWORD **)v3 < v4) {
    unsigned int v4 = **(_DWORD **)v3;
  }
  unsigned int v5 = a2 % v4;
  uint64_t v6 = *(void *)(*(void *)v3 + 8);
  if (*(_DWORD *)(v6 + 16) <= v5) {
    -[PolyNomialExtrapolation predict]();
  }
  float v7 = *(float *)(*(void *)v6 + 4 * v5);
  float v8 = fabsf(v7);
  float result = 1.0 / v7;
  if (v8 < v3[2]) {
    return 0.0;
  }
  return result;
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = **(void **)(a2 + 16);
  if (*(void *)v4 == *(void *)a1)
  {
    uint64_t v12 = (*(_DWORD *)(v4 + 16) * *(_DWORD *)(***(void ***)(a2 + 8) + 20));
    unsigned int v17 = 0;
    uint64_t v18 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v17, v12);
    int v13 = *(_DWORD *)(**(void **)(a2 + 16) + 16);
    LODWORD(v19) = *(_DWORD *)(***(void ***)(a2 + 8) + 20);
    HIDWORD(v19) = v13;
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixMultExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>>(&v17, a2);
    int v14 = *(void **)a1;
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v16 = v18;
    *(void *)a1 = v17;
    *(void *)(a1 + 8) = v16;
    unsigned int v17 = v14;
    uint64_t v18 = v15;
    *(void *)(a1 + 16) = v19;
    uint64_t v19 = 0;
    free(v14);
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 16);
    uint64_t v6 = *(uint64_t ***)(a2 + 8);
    if (v5 != *(_DWORD *)(**v6 + 20) || (int v7 = *(_DWORD *)(a1 + 20), v7 != *(_DWORD *)(v4 + 16)))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      int v5 = *(_DWORD *)(a1 + 16);
      uint64_t v6 = *(uint64_t ***)(a2 + 8);
      if (v5 != *(_DWORD *)(**v6 + 20)
        || (v4 = **(void **)(a2 + 16), int v7 = *(_DWORD *)(v4 + 16), *(_DWORD *)(a1 + 20) != v7))
      {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    uint64_t v8 = (*(_DWORD *)*v6[1] * v5);
    if (v8 && v7 * *(_DWORD *)(v4 + 20))
    {
      unsigned int v17 = 0;
      uint64_t v18 = 0;
      cva::MatrixData<int,0ul,0ul,false>::allocate(&v17, v8);
      int v9 = *(_DWORD *)*v6[1];
      LODWORD(v19) = *(_DWORD *)(**v6 + 20);
      HIDWORD(v19) = v9;
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>((cva::Logger *)&v17, v6);
      cva::VecLib<float>::gemm();
    }
    unsigned int v10 = v5 * v7;
    if (v10)
    {
      BOOL v11 = *(void **)a1;
      bzero(v11, 4 * v10);
    }
  }
}

void sub_21B7F1784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>(cva::Logger *a1, uint64_t **a2)
{
  int v4 = *((_DWORD *)a1 + 4);
  int v5 = *a2;
  uint64_t v6 = **a2;
  if (v4 != *(_DWORD *)(v6 + 20) || (v7 = *((_DWORD *)a1 + 5), uint64_t v8 = (unsigned int **)a2[1], v9 = *v8, v7 != **v8))
  {
    cva::Logger::instance(a1);
    cva::Logger::logInCategory();
    int v4 = *((_DWORD *)a1 + 4);
    int v5 = *a2;
    uint64_t v6 = **a2;
    if (v4 != *(_DWORD *)(v6 + 20) || (uint64_t v8 = (unsigned int **)a2[1], v9 = *v8, v7 = **v8, *((_DWORD *)a1 + 5) != v7)) {
      cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
    }
  }
  uint64_t v34 = v8;
  if (v7 >= v9[1]) {
    unsigned int v7 = v9[1];
  }
  if (v7 > *(_DWORD *)(v6 + 16)) {
    cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>();
  }
  v30[0] = v4;
  v30[1] = v7;
  int v31 = v5;
  uint64_t v32 = 0;
  unsigned int v25 = &v34;
  int v27 = v4;
  unsigned int v28 = v7;
  int v29 = &v25;
  v33[0] = v30;
  v33[1] = &v26;
  uint64_t v10 = *(void *)a1;
  v21[0] = v4;
  v21[1] = v7;
  uint64_t v22 = v10;
  int v23 = v4;
  int v24 = 0;
  cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((uint64_t)v21, v33);
  unsigned int v11 = *(_DWORD *)(*v5 + 16);
  unsigned int v12 = *((_DWORD *)a1 + 5);
  BOOL v13 = v12 >= v11;
  unsigned int v14 = v12 - v11;
  if (v14 != 0 && v13)
  {
    int v15 = *((_DWORD *)a1 + 4);
    uint64_t v16 = *(void *)a1 + 4 * v15 * v11;
    unsigned int v17 = v15 * v14;
    BOOL v18 = v17 == 0;
    if (v17) {
      uint64_t v19 = (unsigned char *)v16;
    }
    else {
      uint64_t v19 = 0;
    }
    unsigned int v20 = (unsigned char *)(v16 + 4 * v17);
    if (v18) {
      unsigned int v20 = 0;
    }
    if (v19 != v20) {
      bzero(v19, ((v20 - v19 - 4) & 0xFFFFFFFFFFFFFFFCLL) + 4);
    }
  }
}

uint64_t cva::MatrixRef<float,0u,0u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 8) - 4 * *(unsigned int *)(a1 + 20);
  if (***(void ***)(*a2 + 8) == v4 || **(void **)(****(void ****)(a2[1] + 16) + 8) == v4)
  {
    int v5 = *(_DWORD *)a1;
    int v6 = *(_DWORD *)(a1 + 4);
    v21[0] = 0;
    v21[1] = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(v21, (v6 * v5));
    int v22 = v5;
    int v23 = v6;
    cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>((cva::Logger *)v21, a2);
    int v8 = *(_DWORD *)a1;
    if (*(_DWORD *)a1 != v22 || (int v9 = *(_DWORD *)(a1 + 4), v9 != v23))
    {
      cva::Logger::instance(v7);
      cva::Logger::logInCategory();
      int v8 = *(_DWORD *)a1;
      if (*(_DWORD *)a1 != v22 || (int v9 = *(_DWORD *)(a1 + 4), v9 != v23)) {
        __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
      }
    }
    int v10 = *(_DWORD *)(a1 + 16);
    BOOL v11 = v8 * v9 == 0;
    if (v8 * v9) {
      unsigned int v12 = *(_DWORD **)(a1 + 8);
    }
    else {
      unsigned int v12 = 0;
    }
    uint64_t v13 = *(void *)(a1 + 8) + 4 * (v10 * v9);
    if (v11) {
      uint64_t v13 = 0;
    }
    unsigned int v14 = v21[0];
    if (v12 != (_DWORD *)v13)
    {
      int v15 = 0;
      unsigned int v16 = v10 - v8;
      unsigned int v17 = (int *)v21[0];
      do
      {
        int v18 = *v17++;
        _DWORD *v12 = v18;
        if (v15 + 1 >= v8) {
          unsigned int v19 = v16;
        }
        else {
          unsigned int v19 = 0;
        }
        v12 += v19 + 1;
        if (v15 + 1 < v8) {
          ++v15;
        }
        else {
          int v15 = 0;
        }
      }
      while (v12 != (_DWORD *)v13);
    }
    free(v14);
  }
  else
  {
    cva::detail::assignNoAlias<cva::MatrixRef<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(a1, a2);
  }
  return a1;
}

void sub_21B7F1ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (*(void *)v4 == *(void *)a1 || **(void **)(a2 + 16) == *(void *)a1)
  {
    uint64_t v6 = *(unsigned int *)(v4 + 16);
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v12, v6);
    int v14 = *(_DWORD *)(*(void *)(a2 + 8) + 16);
    cva::assign<false,false,cva::Matrix<float,0u,1u,false>,cva::Matrix<float,0u,0u,false>,cva::Matrix<float,0u,1u,false>>(&v12, a2);
    unsigned int v7 = *(void **)a1;
    uint64_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = v13;
    *(void *)a1 = v12;
    *(void *)(a1 + 8) = v9;
    unsigned int v12 = v7;
    uint64_t v13 = v8;
    *(_DWORD *)(a1 + 16) = v14;
    int v14 = 0;
    free(v7);
  }
  else
  {
    unsigned int v5 = *(_DWORD *)(a1 + 16);
    if (v5 != *(_DWORD *)(v4 + 16))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      unsigned int v5 = *(_DWORD *)(a1 + 16);
      uint64_t v4 = *(void *)(a2 + 8);
      if (v5 != *(_DWORD *)(v4 + 16)) {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    if (*(_DWORD *)(v4 + 20) * v5 && *(_DWORD *)(*(void *)(a2 + 16) + 16)) {
      cva::VecLib<float>::gemv();
    }
    if (v5)
    {
      int v10 = *(void **)a1;
      size_t v11 = 4 * v5;
      bzero(v10, v11);
    }
  }
}

void sub_21B7F1C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

uint64_t std::deque<float>::~deque[abi:ne180100](void *a1)
{
  unsigned int v2 = (void **)a1[1];
  char v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      char v3 = (void **)a1[2];
      unsigned int v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 512;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 1024;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    unsigned int v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer((uint64_t)a1);
}

void sub_21B7F2050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F28E4(_Unwind_Exception *a1)
{
  free(*(void **)(v3 - 184));
  free(*(void **)(v3 - 160));

  _Unwind_Resume(a1);
}

void cva::inv<cva::Matrix<float,4u,4u,false>,4u,true,float>(simd_float4x4 *a1@<X0>, simd_float4x4 *a2@<X8>)
{
  *a2 = __invert_f4(*a1);
}

void sub_21B7F2A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7F3078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (__p) {
    operator delete(__p);
  }
  free(*(void **)(v36 - 168));
  free(*(void **)(v36 - 144));

  _Unwind_Resume(a1);
}

void sub_21B7F3270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B7F3468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F3638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    float result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      float result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7F3894(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 3)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    float result = std::vector<unsigned long>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    unsigned int v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      int v18 = v9;
      unsigned int v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unsigned int v12 = (void **)(result + 8);
  int v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 3;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  unsigned int v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    float result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    int v18 = v9;
    unsigned int v19 = v16;
LABEL_18:
    float result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

double cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>(_OWORD *a1, uint64_t **a2)
{
  uint64_t v3 = a2[1];
  unint64_t v4 = (float *)*v3;
  if ((_OWORD *)*v3 == a1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>(&v29);
    long long v27 = v30;
    *a1 = v29;
    a1[1] = v27;
    double result = *(double *)&v31;
    long long v28 = v32;
    a1[2] = v31;
    a1[3] = v28;
  }
  else
  {
    int v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = **a2;
    unint64_t v8 = *((unsigned int *)v3 + 4);
    unint64_t v9 = v8 & 0xFFFFFFFC;
    unint64_t v10 = v8 & 0xFFFFFFFE;
    do
    {
      for (uint64_t i = 0; i != 4; ++i)
      {
        if (v9)
        {
          unint64_t v12 = 0;
          double result = 0.0;
          do
          {
            if (v12 >= v8) {
              -[PolyNomialExtrapolation predict]();
            }
            unint64_t v14 = *(unsigned int *)(v7 + 16);
            if (v12 >= v14) {
              -[PolyNomialExtrapolation predict]();
            }
            unint64_t v15 = &v4[(v5 + v12)];
            unsigned int v16 = (float *)(*(void *)v7 + 4 * (v12 + i * v14));
            *(float *)&double result = *(float *)&result
                              + (float)((float)((float)((float)(v16[1] * v15[1]) + (float)(*v16 * *v15))
                                              + (float)(v16[2] * v15[2]))
                                      + (float)(v16[3] * v15[3]));
            v12 += 4;
          }
          while (v12 < v9);
        }
        else
        {
          LODWORD(v12) = 0;
          double result = 0.0;
        }
        if (v12 < v10)
        {
          uint64_t v17 = 0;
          uint64_t v18 = v12;
          int v19 = v5 + v12;
          do
          {
            if (v18 + v17 >= v8) {
              -[PolyNomialExtrapolation predict]();
            }
            unint64_t v20 = *(unsigned int *)(v7 + 16);
            if (v18 + v17 >= v20) {
              -[PolyNomialExtrapolation predict]();
            }
            unsigned int v21 = (float *)(*(void *)v7 + 4 * (v18 + v17 + i * v20));
            *(float *)&double result = *(float *)&result
                              + (float)((float)(v21[1] * v4[(v19 + v17) + 1])
                                      + (float)(*v21 * v4[(v19 + v17)]));
            v17 += 2;
          }
          while (v18 + v17 < v10);
          LODWORD(v12) = v18 + v17;
        }
        if (v12 < v8)
        {
          unsigned int v22 = *(_DWORD *)(v7 + 16);
          uint64_t v23 = v12;
          unsigned int v24 = v22 - v12;
          if (v22 < v12) {
            unsigned int v24 = 0;
          }
          unsigned int v25 = v8 + ~v12;
          int v26 = v22 * i;
          do
          {
            if (v24 <= v25) {
              -[PolyNomialExtrapolation predict]();
            }
            *(float *)&double result = *(float *)&result
                              + (float)(*(float *)(*(void *)v7 + 4 * (v26 + v23))
                                      * v4[(v5 + v23)]);
            ++v23;
          }
          while (v8 != v23);
        }
        *((_DWORD *)&a1[v6] + i) = LODWORD(result);
      }
      ++v6;
      v5 += v8;
    }
    while (v6 != 4);
  }
  return result;
}

void cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(float32x4_t *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (**(float32x4_t ***)(a2 + 8) == a1)
  {
    float32x4_t v19 = 0uLL;
    cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(&v19, a2);
    *a1 = v19;
  }
  else
  {
    unint64_t v4 = *(uint64_t **)a2;
    uint64_t v5 = *(void *)a2 + 8;
    uint64_t v6 = (4 * *(_DWORD *)(**(void **)v5 + 16));
    v17[0] = 0;
    v17[1] = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(v17, v6);
    uint64_t v7 = *(void *)v5;
    int v18 = *(_DWORD *)(**(void **)v5 + 16);
    v19.i64[1] = *v4;
    uint64_t v20 = v7;
    int v21 = 1065353216;
    cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>((uint64_t)v17, (uint64_t)&v19);
    uint64_t v8 = *(void *)(a2 + 8);
    if (!*(_DWORD *)(v8 + 16)) {
      __assert_rtn("assert_in_bounds", "matrixmixin.h", 2269, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
    }
    if (!v18) {
      __assert_rtn("assert_in_bounds", "matrixmixin.h", 2269, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
    }
    uint64_t v9 = (4 * v18);
    unint64_t v10 = v17[0];
    if (v9)
    {
      unint64_t v11 = *(__int32 **)v8;
      uint64_t v12 = 4 * v9;
      float32x4_t v13 = 0uLL;
      unint64_t v14 = (float32x4_t *)v17[0];
      do
      {
        float32x4_t v15 = *v14++;
        float32x4_t v16 = v15;
        v15.i32[0] = *v11++;
        float32x4_t v13 = vmlaq_n_f32(v13, v16, v15.f32[0]);
        v12 -= 16;
      }
      while (v12);
    }
    else
    {
      float32x4_t v13 = 0uLL;
    }
    *a1 = v13;
    free(v10);
  }
}

void sub_21B7F3D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
}

void cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = **(void **)(a2 + 16);
  if (*(void *)(a2 + 8) == *(void *)a1 || *(void *)v4 == *(void *)a1)
  {
    uint64_t v6 = (4 * *(_DWORD *)(v4 + 16));
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    cva::MatrixData<int,0ul,0ul,false>::allocate(&v11, v6);
    int v13 = *(_DWORD *)(**(void **)(a2 + 16) + 16);
    cva::assign<false,false,cva::Matrix<float,4u,0u,false>,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>(&v11, a2);
    uint64_t v7 = *(void **)a1;
    uint64_t v8 = *(void *)(a1 + 8);
    uint64_t v9 = v12;
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v9;
    unint64_t v11 = v7;
    uint64_t v12 = v8;
    *(_DWORD *)(a1 + 16) = v13;
    int v13 = 0;
    free(v7);
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 16);
    if (v5 != *(_DWORD *)(v4 + 16))
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      int v5 = *(_DWORD *)(a1 + 16);
      if (v5 != *(_DWORD *)(**(void **)(a2 + 16) + 16)) {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
    }
    if ((v5 & 0x3FFFFFFF) != 0) {
      cva::VecLib<float>::gemm();
    }
    if (4 * v5)
    {
      unint64_t v10 = *(void **)a1;
      bzero(v10, 4 * (4 * v5));
    }
  }
}

void sub_21B7F3EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

id simdMatrix4x4ToNSMat(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  __n128 v11 = a1;
  __n128 v12 = a2;
  __n128 v13 = a3;
  __n128 v14 = a4;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = 0; i != 4; ++i)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t j = 0; j != 16; j += 4)
    {
      LODWORD(v7) = v11.n128_u32[(i & 3) + j];
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithFloat:", v7, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13, *(_OWORD *)&v14);
      [v6 addObject:v9];
    }
    [v4 addObject:v6];
  }
  return v4;
}

id simdMatrix4x4ToNSArray(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:16];
  int v5 = [NSNumber numberWithFloat:a1.n128_f64[0]];
  [v4 setObject:v5 atIndexedSubscript:0];

  HIDWORD(v6) = a1.n128_u32[1];
  LODWORD(v6) = a1.n128_u32[1];
  double v7 = [NSNumber numberWithFloat:v6];
  [v4 setObject:v7 atIndexedSubscript:1];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  [v4 setObject:v8 atIndexedSubscript:2];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  [v4 setObject:v9 atIndexedSubscript:3];

  unint64_t v10 = [NSNumber numberWithFloat:a2.n128_f64[0]];
  [v4 setObject:v10 atIndexedSubscript:4];

  HIDWORD(v11) = a2.n128_u32[1];
  LODWORD(v11) = a2.n128_u32[1];
  __n128 v12 = [NSNumber numberWithFloat:v11];
  [v4 setObject:v12 atIndexedSubscript:5];

  __n128 v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  [v4 setObject:v13 atIndexedSubscript:6];

  __n128 v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  [v4 setObject:v14 atIndexedSubscript:7];

  float32x4_t v15 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  [v4 setObject:v15 atIndexedSubscript:8];

  HIDWORD(v16) = a3.n128_u32[1];
  LODWORD(v16) = a3.n128_u32[1];
  uint64_t v17 = [NSNumber numberWithFloat:v16];
  [v4 setObject:v17 atIndexedSubscript:9];

  int v18 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  [v4 setObject:v18 atIndexedSubscript:10];

  float32x4_t v19 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  [v4 setObject:v19 atIndexedSubscript:11];

  uint64_t v20 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  [v4 setObject:v20 atIndexedSubscript:12];

  HIDWORD(v21) = a4.n128_u32[1];
  LODWORD(v21) = a4.n128_u32[1];
  uint64_t v22 = [NSNumber numberWithFloat:v21];
  [v4 setObject:v22 atIndexedSubscript:13];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  [v4 setObject:v23 atIndexedSubscript:14];

  unsigned int v24 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  [v4 setObject:v24 atIndexedSubscript:15];

  return v4;
}

id simdMatrix3x3ToNSMat(__n128 a1, __n128 a2, __n128 a3)
{
  __n128 v10 = a1;
  __n128 v11 = a2;
  __n128 v12 = a3;
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = 0; i != 3; ++i)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t j = 0; j != 12; j += 4)
    {
      LODWORD(v6) = v10.n128_u32[(i & 3) + j];
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithFloat:", v6, *(_OWORD *)&v10, *(_OWORD *)&v11, *(_OWORD *)&v12);
      [v5 addObject:v8];
    }
    [v3 addObject:v5];
  }
  return v3;
}

id simdFloat4ToNSArray(__n128 a1)
{
  __n128 v6 = a1;
  id v1 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = 0; i != 4; ++i)
  {
    HIDWORD(v3) = v6.n128_u32[1];
    __n128 v7 = v6;
    LODWORD(v3) = *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
    id v4 = objc_msgSend(NSNumber, "numberWithFloat:", v3, *(_OWORD *)&v6, *(_OWORD *)&v6);
    [v1 addObject:v4];
  }
  return v1;
}

id simdFloat3ToNSArray(__n128 a1)
{
  __n128 v6 = a1;
  id v1 = objc_alloc_init(MEMORY[0x263EFF980]);
  for (int i = 0; i != 3; ++i)
  {
    HIDWORD(v3) = v6.n128_u32[1];
    __n128 v7 = v6;
    LODWORD(v3) = *(_DWORD *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (i & 3)));
    id v4 = objc_msgSend(NSNumber, "numberWithFloat:", v3, *(_OWORD *)&v6, *(_OWORD *)&v6);
    [v1 addObject:v4];
  }
  return v1;
}

void printSimd4x4Matrix(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[0];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[0];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[0];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[0];
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  id v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[1];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[1];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[1];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[1];
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __n128 v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[2];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[2];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[2];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[2];
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  __n128 v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[3];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[3];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[3];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[3];
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }
}

double transform_point(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5)
{
  *(void *)&double result = vaddq_f32(a4, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, a5.f32[0]), a2, *(float32x2_t *)a5.f32, 1), a3, a5, 2)).u64[0];
  return result;
}

__n128 convertNSArrayToSimd3x3(void *a1)
{
  id v1 = a1;
  if ([v1 count] != 9 && objc_msgSend(v1, "count") != 3) {
    convertNSArrayToSimd3x3_cold_1();
  }
  uint64_t v2 = [v1 count];
  double v3 = [v1 objectAtIndexedSubscript:0];
  id v4 = v3;
  if (v2 == 9)
  {
    [v3 floatValue];
    *(void *)&long long v40 = v5;
    __n128 v6 = [v1 objectAtIndexedSubscript:1];
    [v6 floatValue];
    int v38 = v7;
    uint64_t v8 = [v1 objectAtIndexedSubscript:2];
    [v8 floatValue];
    long long v9 = v40;
    DWORD1(v9) = v38;
    DWORD2(v9) = v10;
    long long v41 = v9;
    __n128 v11 = [v1 objectAtIndexedSubscript:3];
    [v11 floatValue];
    __n128 v12 = [v1 objectAtIndexedSubscript:4];
    [v12 floatValue];
    double v13 = [v1 objectAtIndexedSubscript:5];
    [v13 floatValue];
    __int16 v14 = [v1 objectAtIndexedSubscript:6];
    [v14 floatValue];
    double v15 = [v1 objectAtIndexedSubscript:7];
    [v15 floatValue];
    __int16 v16 = [v1 objectAtIndexedSubscript:8];
    [v16 floatValue];
  }
  else
  {
    uint64_t v37 = [v3 objectAtIndexedSubscript:0];
    [v37 floatValue];
    *(void *)&long long v40 = v17;
    CGSize v35 = [v1 objectAtIndexedSubscript:1];
    uint64_t v36 = [v35 objectAtIndexedSubscript:0];
    [v36 floatValue];
    int v39 = v18;
    uint64_t v34 = [v1 objectAtIndexedSubscript:2];
    uint64_t v33 = [v34 objectAtIndexedSubscript:0];
    [v33 floatValue];
    long long v19 = v40;
    DWORD1(v19) = v39;
    DWORD2(v19) = v20;
    long long v41 = v19;
    long long v31 = [v1 objectAtIndexedSubscript:0];
    double v15 = [v31 objectAtIndexedSubscript:1];
    [v15 floatValue];
    __int16 v16 = [v1 objectAtIndexedSubscript:1];
    long long v32 = [v16 objectAtIndexedSubscript:1];
    [v32 floatValue];
    long long v30 = [v1 objectAtIndexedSubscript:2];
    long long v29 = [v30 objectAtIndexedSubscript:1];
    [v29 floatValue];
    double v21 = [v1 objectAtIndexedSubscript:0];
    uint64_t v22 = [v21 objectAtIndexedSubscript:2];
    [v22 floatValue];
    uint64_t v23 = [v1 objectAtIndexedSubscript:1];
    unsigned int v24 = [v23 objectAtIndexedSubscript:2];
    [v24 floatValue];
    [v1 objectAtIndexedSubscript:2];
    v26 = unsigned int v25 = v4;
    long long v27 = [v26 objectAtIndexedSubscript:2];
    [v27 floatValue];

    __int16 v14 = v31;
    id v4 = v25;
    uint64_t v8 = v35;

    __n128 v6 = v37;
    double v13 = v33;

    __n128 v12 = v34;
    __n128 v11 = v36;
  }
  return (__n128)v41;
}

__n128 convertNSArrayToSimd4x4(void *a1)
{
  id v1 = a1;
  if ([v1 count] != 16) {
    convertNSArrayToSimd4x4_cold_1();
  }
  uint64_t v23 = [v1 objectAtIndexedSubscript:0];
  [v23 floatValue];
  unsigned int v26 = v2;
  uint64_t v22 = [v1 objectAtIndexedSubscript:1];
  [v22 floatValue];
  unsigned int v25 = v3;
  double v21 = [v1 objectAtIndexedSubscript:2];
  [v21 floatValue];
  unsigned int v24 = v4;
  int v20 = [v1 objectAtIndexedSubscript:3];
  [v20 floatValue];
  *(void *)&long long v5 = __PAIR64__(v25, v26);
  *((void *)&v5 + 1) = __PAIR64__(v6, v24);
  long long v27 = v5;
  long long v19 = [v1 objectAtIndexedSubscript:4];
  [v19 floatValue];
  int v18 = [v1 objectAtIndexedSubscript:5];
  [v18 floatValue];
  uint64_t v17 = [v1 objectAtIndexedSubscript:6];
  [v17 floatValue];
  int v7 = [v1 objectAtIndexedSubscript:7];
  [v7 floatValue];
  uint64_t v8 = [v1 objectAtIndexedSubscript:8];
  [v8 floatValue];
  long long v9 = [v1 objectAtIndexedSubscript:9];
  [v9 floatValue];
  int v10 = [v1 objectAtIndexedSubscript:10];
  [v10 floatValue];
  __n128 v11 = [v1 objectAtIndexedSubscript:11];
  [v11 floatValue];
  __n128 v12 = [v1 objectAtIndexedSubscript:12];
  [v12 floatValue];
  double v13 = [v1 objectAtIndexedSubscript:13];
  [v13 floatValue];
  __int16 v14 = [v1 objectAtIndexedSubscript:14];
  [v14 floatValue];
  double v15 = [v1 objectAtIndexedSubscript:15];
  [v15 floatValue];

  return (__n128)v27;
}

__n128 convertNSMatToSimd4x4(void *a1)
{
  id v1 = a1;
  if ([v1 count] != 4) {
    convertNSMatToSimd4x4_cold_1();
  }
  int v39 = [v1 objectAtIndexedSubscript:0];
  int v38 = [v39 objectAtIndexedSubscript:0];
  [v38 floatValue];
  unsigned int v42 = v2;
  uint64_t v37 = [v1 objectAtIndexedSubscript:1];
  uint64_t v36 = [v37 objectAtIndexedSubscript:0];
  [v36 floatValue];
  unsigned int v41 = v3;
  CGSize v35 = [v1 objectAtIndexedSubscript:2];
  uint64_t v34 = [v35 objectAtIndexedSubscript:0];
  [v34 floatValue];
  unsigned int v40 = v4;
  uint64_t v33 = [v1 objectAtIndexedSubscript:3];
  long long v32 = [v33 objectAtIndexedSubscript:0];
  [v32 floatValue];
  *(void *)&long long v5 = __PAIR64__(v41, v42);
  *((void *)&v5 + 1) = __PAIR64__(v6, v40);
  long long v43 = v5;
  long long v31 = [v1 objectAtIndexedSubscript:0];
  long long v30 = [v31 objectAtIndexedSubscript:1];
  [v30 floatValue];
  long long v29 = [v1 objectAtIndexedSubscript:1];
  long long v28 = [v29 objectAtIndexedSubscript:1];
  [v28 floatValue];
  long long v27 = [v1 objectAtIndexedSubscript:2];
  unsigned int v26 = [v27 objectAtIndexedSubscript:1];
  [v26 floatValue];
  unsigned int v25 = [v1 objectAtIndexedSubscript:3];
  unsigned int v24 = [v25 objectAtIndexedSubscript:1];
  [v24 floatValue];
  uint64_t v23 = [v1 objectAtIndexedSubscript:0];
  uint64_t v22 = [v23 objectAtIndexedSubscript:2];
  [v22 floatValue];
  double v21 = [v1 objectAtIndexedSubscript:1];
  int v20 = [v21 objectAtIndexedSubscript:2];
  [v20 floatValue];
  long long v19 = [v1 objectAtIndexedSubscript:2];
  int v18 = [v19 objectAtIndexedSubscript:2];
  [v18 floatValue];
  uint64_t v17 = [v1 objectAtIndexedSubscript:3];
  int v7 = [v17 objectAtIndexedSubscript:2];
  [v7 floatValue];
  uint64_t v8 = [v1 objectAtIndexedSubscript:0];
  long long v9 = [v8 objectAtIndexedSubscript:3];
  [v9 floatValue];
  int v10 = [v1 objectAtIndexedSubscript:1];
  __n128 v11 = [v10 objectAtIndexedSubscript:3];
  [v11 floatValue];
  __n128 v12 = [v1 objectAtIndexedSubscript:2];
  double v13 = [v12 objectAtIndexedSubscript:3];
  [v13 floatValue];
  __int16 v14 = [v1 objectAtIndexedSubscript:3];
  double v15 = [v14 objectAtIndexedSubscript:3];
  [v15 floatValue];

  return (__n128)v43;
}

__n128 convertNSArrayToSimd4(void *a1)
{
  id v1 = a1;
  if ([v1 count] != 4) {
    convertNSArrayToSimd4_cold_1();
  }
  unsigned int v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned int v14 = v3;
  unsigned int v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned int v13 = v5;
  unsigned int v6 = [v1 objectAtIndexedSubscript:2];
  [v6 floatValue];
  unsigned int v12 = v7;
  uint64_t v8 = [v1 objectAtIndexedSubscript:3];
  [v8 floatValue];
  *(void *)&long long v9 = __PAIR64__(v13, v14);
  *((void *)&v9 + 1) = __PAIR64__(v10, v12);
  long long v15 = v9;

  return (__n128)v15;
}

void printSimd3x3(__n128 a1, __n128 a2, __n128 a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218496;
    double v10 = a1.n128_f32[0];
    __int16 v11 = 2048;
    double v12 = a2.n128_f32[0];
    __int16 v13 = 2048;
    double v14 = a3.n128_f32[0];
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " %f, %f, %f ", buf, 0x20u);
  }

  unsigned int v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218496;
    double v10 = a1.n128_f32[1];
    __int16 v11 = 2048;
    double v12 = a2.n128_f32[1];
    __int16 v13 = 2048;
    double v14 = a3.n128_f32[1];
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " %f, %f, %f ", buf, 0x20u);
  }

  unsigned int v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218496;
    double v10 = a1.n128_f32[2];
    __int16 v11 = 2048;
    double v12 = a2.n128_f32[2];
    __int16 v13 = 2048;
    double v14 = a3.n128_f32[2];
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " %f, %f, %f ", buf, 0x20u);
  }
}

void printSimd4x4(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unsigned int v4 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[0];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[0];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[0];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[0];
    _os_log_impl(&dword_21B7C6000, v4, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  unsigned int v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[1];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[1];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[1];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[1];
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  unsigned int v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[2];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[2];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[2];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[2];
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }

  unsigned int v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v13 = a1.n128_f32[3];
    __int16 v14 = 2048;
    double v15 = a2.n128_f32[3];
    __int16 v16 = 2048;
    double v17 = a3.n128_f32[3];
    __int16 v18 = 2048;
    double v19 = a4.n128_f32[3];
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }
}

void printSimd4(__n128 a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)vImage_Buffer buf = 134218752;
    double v4 = a1.n128_f32[0];
    __int16 v5 = 2048;
    double v6 = a1.n128_f32[1];
    __int16 v7 = 2048;
    double v8 = a1.n128_f32[2];
    __int16 v9 = 2048;
    double v10 = a1.n128_f32[3];
    _os_log_impl(&dword_21B7C6000, v1, OS_LOG_TYPE_DEBUG, " %f, %f, %f, %f ", buf, 0x2Au);
  }
}

__n128 simdFloat3FromArray(void *a1)
{
  id v1 = a1;
  if (!v1) {
    simdFloat3FromArray_cold_1();
  }
  unsigned int v2 = v1;
  if ([v1 count] != 3) {
    simdFloat3FromArray_cold_2();
  }
  unsigned int v3 = [v2 objectAtIndexedSubscript:0];
  [v3 floatValue];
  unsigned __int32 v12 = v4;
  __int16 v5 = [v2 objectAtIndexedSubscript:1];
  [v5 floatValue];
  unsigned __int32 v11 = v6;
  __int16 v7 = [v2 objectAtIndexedSubscript:2];
  [v7 floatValue];
  unsigned __int32 v10 = v8;

  result.n128_u32[0] = v12;
  result.n128_u32[1] = v11;
  result.n128_u32[2] = v10;
  return result;
}

double simdFloat4x4fromArray(void *a1, char a2)
{
  id v3 = a1;
  unsigned __int32 v4 = [v3 objectAtIndexedSubscript:0];
  [v4 floatValue];
  v41.i64[0] = v5;
  unsigned __int32 v6 = [v3 objectAtIndexedSubscript:1];
  [v6 floatValue];
  v39.i32[0] = v7;
  unsigned __int32 v8 = [v3 objectAtIndexedSubscript:2];
  [v8 floatValue];
  __int16 v9 = [v3 objectAtIndexedSubscript:3];
  [v9 floatValue];
  int32x4_t v10 = v41;
  v10.i32[1] = v39.i32[0];
  int32x4_t v42 = v10;
  double v34 = *(double *)v10.i64;

  unsigned __int32 v11 = [v3 objectAtIndexedSubscript:4];
  [v11 floatValue];
  v39.i64[0] = v12;
  double v13 = [v3 objectAtIndexedSubscript:5];
  [v13 floatValue];
  v37.i32[0] = v14;
  double v15 = [v3 objectAtIndexedSubscript:6];
  [v15 floatValue];
  __int16 v16 = [v3 objectAtIndexedSubscript:7];
  [v16 floatValue];
  int32x4_t v17 = v39;
  v17.i32[1] = v37.i32[0];
  int32x4_t v40 = v17;

  __int16 v18 = [v3 objectAtIndexedSubscript:8];
  [v18 floatValue];
  v37.i64[0] = v19;
  uint64_t v20 = [v3 objectAtIndexedSubscript:9];
  [v20 floatValue];
  v35.i32[0] = v21;
  uint64_t v22 = [v3 objectAtIndexedSubscript:10];
  [v22 floatValue];
  uint64_t v23 = [v3 objectAtIndexedSubscript:11];
  [v23 floatValue];
  int32x4_t v24 = v37;
  v24.i32[1] = v35.i32[0];
  int32x4_t v38 = v24;

  unsigned int v25 = [v3 objectAtIndexedSubscript:12];
  [v25 floatValue];
  v35.i64[0] = v26;
  long long v27 = [v3 objectAtIndexedSubscript:13];
  [v27 floatValue];
  __int32 v33 = v28;
  long long v29 = [v3 objectAtIndexedSubscript:14];
  [v29 floatValue];
  long long v30 = [v3 objectAtIndexedSubscript:15];

  [v30 floatValue];
  int32x4_t v31 = v35;
  v31.i32[1] = v33;
  int32x4_t v36 = v31;

  if (a2) {
    return v34;
  }
  *(void *)&double result = vzip1q_s32(vzip1q_s32(v42, v38), vzip1q_s32(v40, v36)).u64[0];
  return result;
}

__n128 simdFloat4x4FromRotation(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3 || (uint64_t v5 = v4) == 0) {
    simdFloat4x4FromRotation_cold_1();
  }
  if ([v3 count] != 9) {
    simdFloat4x4FromRotation_cold_3();
  }
  if ([v5 count] != 3) {
    simdFloat4x4FromRotation_cold_2();
  }
  unsigned __int32 v6 = [v3 objectAtIndexedSubscript:0];
  [v6 floatValue];
  unsigned int v32 = v7;
  unsigned __int32 v8 = [v3 objectAtIndexedSubscript:1];
  [v8 floatValue];
  unsigned int v31 = v9;
  int32x4_t v10 = [v3 objectAtIndexedSubscript:2];
  [v10 floatValue];
  unsigned __int32 v11 = [v5 objectAtIndexedSubscript:0];
  [v11 floatValue];

  uint64_t v12 = [v3 objectAtIndexedSubscript:3];
  [v12 floatValue];
  unsigned int v30 = v13;
  __int32 v14 = [v3 objectAtIndexedSubscript:4];
  [v14 floatValue];
  unsigned int v29 = v15;
  __int16 v16 = [v3 objectAtIndexedSubscript:5];
  [v16 floatValue];
  int32x4_t v17 = [v5 objectAtIndexedSubscript:1];
  [v17 floatValue];

  __int16 v18 = [v3 objectAtIndexedSubscript:6];
  [v18 floatValue];
  unsigned int v28 = v19;
  uint64_t v20 = [v3 objectAtIndexedSubscript:7];
  [v20 floatValue];
  unsigned int v27 = v21;
  uint64_t v22 = [v3 objectAtIndexedSubscript:8];
  [v22 floatValue];
  uint64_t v23 = [v5 objectAtIndexedSubscript:2];
  [v23 floatValue];

  v24.i64[0] = __PAIR64__(v28, v32);
  v24.i64[1] = __PAIR64__(v27, v31);
  int32x4_t v25 = v24;
  v24.i64[0] = v30;
  v24.i64[1] = v29;
  int32x4_t v33 = vzip1q_s32(v25, v24);

  return (__n128)v33;
}

uint64_t simdEqualTransforms(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  float32x4_t v8 = vabdq_f32(a1, a5);
  float32x4_t v9 = (float32x4_t)vdupq_n_s32(0x38FA0000u);
  return vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v9, v8), (int8x16_t)vcgeq_f32(v9, vabdq_f32(a2, a6))), vandq_s8((int8x16_t)vcgeq_f32(v9, vabdq_f32(a3, a7)), (int8x16_t)vcgeq_f32(v9, vabdq_f32(a4, a8))))) >> 31;
}

float32x2_t Matrix4x4MakeColumnMajorTransform(float64x2_t *a1)
{
  return vcvt_f32_f64(*a1);
}

float computeAngleBetweenVectors(double a1, double a2)
{
  float v2 = atan2f(vmlas_n_f32((float)-*((float *)&a1 + 1) * *(float *)&a2, *((float *)&a2 + 1), *(float *)&a1), vaddv_f32(vmul_f32(*(float32x2_t *)&a1, *(float32x2_t *)&a2)))* 0.318309886* 180.0;
  int v3 = (int)v2 % 360;
  if (v3 < 0) {
    return (float)-v3;
  }
  return (float)v3;
}

BOOL detectRaisingHand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v6 = a6;
  __p[3] = *(void **)MEMORY[0x263EF8340];
  if (a6)
  {
    uint64_t v10 = 0;
    uint64_t v11 = a2 + 4;
    uint64_t v12 = (float *)(a4 + 4);
    uint64_t v13 = a3 + 4;
    __int32 v14 = (float *)(a2 + 4);
    unsigned int v15 = (float *)(a3 + 4);
    do
    {
      LODWORD(v16) = HIDWORD(*(void *)(a1 + 8 * v10));
      if (COERCE_FLOAT(*(void *)(a1 + 8 * v10)) == -1.0 || v16 == -1.0)
      {
        int32x4_t v35 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 67109120;
          HIDWORD(__p[0]) = v10;
          _os_log_impl(&dword_21B7C6000, v35, OS_LOG_TYPE_DEBUG, " Raising Hand: Wrist not detected in frame: %d ", (uint8_t *)__p, 8u);
        }
        goto LABEL_44;
      }
      if (v16 > *v14 || v16 > *v12 || v16 > *v15)
      {
        int32x4_t v35 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 67109120;
          HIDWORD(__p[0]) = v10;
          _os_log_impl(&dword_21B7C6000, v35, OS_LOG_TYPE_DEBUG, " Raising Hand: Hand too low in frame: %d ", (uint8_t *)__p, 8u);
        }
LABEL_44:

        return 0;
      }
      ++v10;
      v15 += 2;
      v12 += 2;
      v14 += 2;
    }
    while (a6 != v10);
    std::vector<float>::vector(__p, a6);
    uint64_t v18 = 0;
    BOOL v19 = 0;
    uint64_t v20 = (float *)__p[0];
    do
    {
      float32x2_t v21 = *(float32x2_t *)(a2 + 8 * v18);
      float32x2_t v22 = vsub_f32(*(float32x2_t *)(a1 + 8 * v18), v21);
      float32x2_t v23 = vsub_f32(*(float32x2_t *)(a3 + 8 * v18), v21);
      float v24 = atan2f(vmlas_n_f32((float)-v22.f32[1] * v23.f32[0], v23.f32[1], v22.f32[0]), vaddv_f32(vmul_f32(v22, v23)))
          * 0.318309886
          * 180.0;
      int v25 = (int)v24 % 360;
      if (v25 < 0) {
        int v25 = -v25;
      }
      v20[v18] = (float)v25;
      if (v25 <= 0x3B)
      {
        int32x4_t v38 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          double v37 = *((float *)__p[0] + v18);
          int v40 = 134218240;
          double v41 = v37;
          __int16 v42 = 1024;
          int v43 = v18;
          _os_log_impl(&dword_21B7C6000, v38, OS_LOG_TYPE_DEBUG, " Raising Hand: Angle (%f) < 70 degrees in frame: %d ", (uint8_t *)&v40, 0x12u);
        }
        goto LABEL_37;
      }
      BOOL v19 = ++v18 >= v6;
    }
    while (v6 != v18);
    uint64_t v26 = 0;
    do
    {
      while (1)
      {
        float v27 = *(float *)(v11 + 8 * v26);
        if (*(float *)(a1 + 4 + 8 * v26) < v27 && v27 < *(float *)(v13 + 8 * v26)) {
          break;
        }
        if (++v26 == v6)
        {
          unsigned int v28 = (float *)__p[0];
          float v29 = 1000.0;
          float v30 = -1000.0;
          do
          {
            float v31 = *v28++;
            float v32 = v31;
            if (v31 < v29) {
              float v29 = v32;
            }
            if (v32 > v30) {
              float v30 = v32;
            }
            --v6;
          }
          while (v6);
          if ((float)(v30 - v29) > 10000.0)
          {
            int32x4_t v33 = __ABPKLogSharedInstance();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v40) = 0;
              _os_log_impl(&dword_21B7C6000, v33, OS_LOG_TYPE_DEBUG, " Raising Hand: Angles changing too much ", (uint8_t *)&v40, 2u);
            }
          }
          goto LABEL_33;
        }
      }
      ++v26;
    }
    while (v26 != v6);
    int32x4_t v38 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v40) = 0;
      double v34 = " Raising Hand: Gesture detected - Wrist is above elbow and elbow is above the shoulder ";
      goto LABEL_35;
    }
  }
  else
  {
    std::vector<float>::vector(__p, 0);
LABEL_33:
    int32x4_t v38 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v40) = 0;
      double v34 = " Raising Hand: Gesture detected ";
LABEL_35:
      _os_log_impl(&dword_21B7C6000, v38, OS_LOG_TYPE_DEBUG, v34, (uint8_t *)&v40, 2u);
    }
  }
  BOOL v19 = 1;
LABEL_37:

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v19;
}

void sub_21B7F6490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

float computeMeanOfVector(uint64_t a1)
{
  id v1 = *(float **)a1;
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (*(void *)(a1 + 8) == *(void *)a1)
  {
    float v4 = 0.0;
  }
  else
  {
    if (v2 <= 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
    }
    float v4 = 0.0;
    do
    {
      float v5 = *v1++;
      float v4 = v4 + v5;
      --v3;
    }
    while (v3);
  }
  return v4 / (float)v2;
}

float getFrequencyOfZeroCrossing(uint64_t *a1, float a2)
{
  __n128 __p = 0;
  uint64_t v52 = 0;
  double v53 = 0;
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  if (v3 - *a1 == 4)
  {
    float v5 = 0;
    unint64_t v6 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
  }
  else
  {
    float32x4_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      unint64_t v10 = v9 + 1;
      if (*(float *)(v4 + 4 * (v9 + 1)) >= 0.0 && *(float *)(v4 + 4 * v9) < 0.0)
      {
        if (v8 >= v53)
        {
          uint64_t v12 = (char *)__p;
          uint64_t v13 = (v8 - (unsigned char *)__p) >> 3;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v15 = v53 - (unsigned char *)__p;
          if ((v53 - (unsigned char *)__p) >> 2 > v14) {
            unint64_t v14 = v15 >> 2;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16)
          {
            int32x4_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v53, v16);
            uint64_t v12 = (char *)__p;
            float32x4_t v8 = v52;
          }
          else
          {
            int32x4_t v17 = 0;
          }
          uint64_t v18 = &v17[8 * v13];
          *(void *)uint64_t v18 = v9;
          uint64_t v11 = v18 + 8;
          while (v8 != v12)
          {
            uint64_t v19 = *((void *)v8 - 1);
            v8 -= 8;
            *((void *)v18 - 1) = v19;
            v18 -= 8;
          }
          __n128 __p = v18;
          uint64_t v52 = v11;
          double v53 = &v17[8 * v16];
          if (v12) {
            operator delete(v12);
          }
        }
        else
        {
          *(void *)float32x4_t v8 = v9;
          uint64_t v11 = v8 + 8;
        }
        uint64_t v52 = v11;
        float32x4_t v8 = v11;
        uint64_t v4 = *a1;
        uint64_t v3 = a1[1];
      }
      ++v9;
    }
    while (v10 < ((v3 - v4) >> 2) - 1);
    uint64_t v20 = (unint64_t *)__p;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    if (v8 == __p)
    {
      float v5 = 0;
      unint64_t v6 = 0;
    }
    else
    {
      unint64_t v6 = 0;
      unint64_t v21 = 0;
      do
      {
        float v22 = (float)v20[v21]
            - (float)(*(float *)(*a1 + 4 * v20[v21])
                    / (float)(*(float *)(*a1 + 4 * v20[v21] + 4) - *(float *)(*a1 + 4 * v20[v21])));
        if (v6 >= v50)
        {
          float32x2_t v23 = (float *)v48;
          uint64_t v24 = ((char *)v6 - (unsigned char *)v48) >> 2;
          unint64_t v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v26 = (char *)v50 - (unsigned char *)v48;
          if (((char *)v50 - (unsigned char *)v48) >> 1 > v25) {
            unint64_t v25 = v26 >> 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v25;
          }
          if (v27)
          {
            unsigned int v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v50, v27);
            float32x2_t v23 = (float *)v48;
            unint64_t v6 = v49;
          }
          else
          {
            unsigned int v28 = 0;
          }
          float v29 = (float *)&v28[4 * v24];
          *float v29 = v22;
          float v30 = v29 + 1;
          while (v6 != v23)
          {
            int v31 = *((_DWORD *)v6-- - 1);
            *((_DWORD *)v29-- - 1) = v31;
          }
          uint64_t v48 = v29;
          uint64_t v49 = v30;
          uint64_t v50 = (float *)&v28[4 * v27];
          if (v23) {
            operator delete(v23);
          }
          unint64_t v6 = v30;
        }
        else
        {
          *v6++ = v22;
        }
        uint64_t v49 = v6;
        ++v21;
        uint64_t v20 = (unint64_t *)__p;
      }
      while (v21 < (v52 - (unsigned char *)__p) >> 3);
      float v5 = (float *)v48;
    }
  }
  float v32 = 0.0;
  if ((unint64_t)((char *)v6 - (char *)v5) >= 8)
  {
    std::vector<float>::vector(&v46, v6 - v5 - 1);
    int32x4_t v33 = v46;
    uint64_t v34 = (((char *)v49 - (unsigned char *)v48) >> 2) - 1;
    if (((char *)v49 - (unsigned char *)v48) >> 2 != 1)
    {
      int32x4_t v35 = (float *)((char *)v48 + 4);
      int32x4_t v36 = (float *)v46;
      do
      {
        *v36++ = (float)(*v35 - *(v35 - 1)) / a2;
        ++v35;
        --v34;
      }
      while (v34);
    }
    int v43 = 0;
    double v44 = 0;
    uint64_t v45 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v43, v33, (uint64_t)v47, (v47 - (unsigned char *)v33) >> 2);
    unint64_t v37 = v44 - v43;
    if (v44 == v43)
    {
      float v32 = 0.0 / (float)v37;
      if (!v44)
      {
LABEL_59:
        if (v46)
        {
          int v47 = v46;
          operator delete(v46);
        }
        float v5 = (float *)v48;
        goto LABEL_62;
      }
    }
    else
    {
      if (v37 <= 1) {
        uint64_t v38 = 1;
      }
      else {
        uint64_t v38 = v44 - v43;
      }
      float v39 = 0.0;
      int v40 = v43;
      do
      {
        float v41 = *v40++;
        float v39 = v39 + v41;
        --v38;
      }
      while (v38);
      float v32 = v39 / (float)v37;
    }
    double v44 = v43;
    operator delete(v43);
    goto LABEL_59;
  }
LABEL_62:
  if (v5)
  {
    uint64_t v49 = v5;
    operator delete(v5);
  }
  if (__p)
  {
    uint64_t v52 = (char *)__p;
    operator delete(__p);
  }
  return v32;
}

void sub_21B7F688C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  if (a15) {
    operator delete(a15);
  }
  if (a18) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

BOOL detectWavingHand(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3, uint64_t a4, uint64_t a5, unint64_t a6, unsigned int a7, unsigned int a8)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (!a6)
  {
    std::vector<float>::vector(v74, 0);
    goto LABEL_17;
  }
  uint64_t v11 = a3;
  uint64_t v12 = a2;
  uint64_t v13 = a1;
  uint64_t v14 = 0;
  uint64_t v15 = (float *)a2 + 1;
  unint64_t v16 = (float *)(a4 + 4);
  int32x4_t v17 = (float *)a3 + 1;
  while (1)
  {
    LODWORD(v18) = HIDWORD(*(void *)&a1[v14]);
    if (COERCE_FLOAT(*(void *)&a1[v14]) == -1.0 || v18 == -1.0) {
      break;
    }
    if (v18 > *v15 || v18 > *v16 || v18 > *v17)
    {
      double v56 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v74 = 0;
        _os_log_impl(&dword_21B7C6000, v56, OS_LOG_TYPE_DEBUG, " Waving Hand: Hand too low ", v74, 2u);
      }
      goto LABEL_64;
    }
    ++v14;
    v17 += 2;
    v16 += 2;
    v15 += 2;
    if (a6 == v14)
    {
      std::vector<float>::vector(v74, a6);
      uint64_t v20 = *(float **)v74;
      unint64_t v21 = a6;
      do
      {
        float32x2_t v22 = *v13++;
        float32x2_t v23 = v22;
        float32x2_t v24 = *v12++;
        float32x2_t v25 = v24;
        float32x2_t v26 = vsub_f32(v23, v24);
        float32x2_t v27 = *v11++;
        float32x2_t v28 = vsub_f32(v27, v25);
        float v29 = atan2f(vmlas_n_f32((float)-v26.f32[1] * v28.f32[0], v28.f32[1], v26.f32[0]), vaddv_f32(vmul_f32(v26, v28)))* 0.318309886* 180.0;
        int v30 = (int)v29 % 360;
        if (v30 < 0) {
          int v30 = -v30;
        }
        *v20++ = (float)v30;
        --v21;
      }
      while (v21);
LABEL_17:
      if (a6 - a7 >= a6) {
        goto LABEL_26;
      }
      uint64_t v31 = -(uint64_t)a7;
      float v33 = 1000.0;
      float v34 = -1000.0;
      do
      {
        uint64_t v32 = *(void *)v74 + 4 * a6;
        float v35 = *(float *)(v32 + 4 * v31);
        if (v35 < v33) {
          float v33 = *(float *)(v32 + 4 * v31);
        }
        if (v35 > v34) {
          float v34 = *(float *)(v32 + 4 * v31);
        }
        BOOL v36 = __CFADD__(v31++, 1);
      }
      while (!v36);
      if ((float)(v34 - v33) < 20.0)
      {
LABEL_26:
        unint64_t v37 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)vImage_Buffer buf = 0;
          _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_DEBUG, " Waving Hand: Angles not changing enough for waving ", buf, 2u);
        }
      }
      std::vector<std::vector<float>>::vector(buf, a6);
      if (a6)
      {
        uint64_t v38 = 0;
        do
        {
          std::vector<float>::vector(__p, a6);
          uint64_t v39 = 0;
          int v40 = *(float **)v74;
          float v41 = (float *)__p[0];
          do
          {
            v41[v39] = vabds_f32(v40[v39], v40[v38]);
            ++v39;
          }
          while (a6 != v39);
          __int16 v42 = (void **)(*(void *)buf + 24 * v38);
          if (v42 == __p
            || (std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v42, (char *)v41, (uint64_t)__p[1], ((char *)__p[1] - (char *)v41) >> 2), (float v41 = (float *)__p[0]) != 0))
          {
            __p[1] = v41;
            operator delete(v41);
          }
          ++v38;
        }
        while (v38 != a6);
        uint64_t v43 = 0;
        double v44 = 0;
        while (1)
        {
          memset(__p, 0, 24);
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, *(const void **)(*(void *)buf + 24 * v43), *(void *)(*(void *)buf + 24 * v43 + 8), (uint64_t)(*(void *)(*(void *)buf + 24 * v43 + 8) - *(void *)(*(void *)buf + 24 * v43)) >> 2);
          double v69 = 0;
          double v70 = 0;
          uint64_t v71 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v69, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 2);
          unint64_t v45 = v70 - v69;
          float v46 = (float)v45;
          if (v70 == v69)
          {
            float v51 = 0.0 / v46;
            if (!v70) {
              goto LABEL_47;
            }
          }
          else
          {
            if (v45 <= 1) {
              uint64_t v47 = 1;
            }
            else {
              uint64_t v47 = v70 - v69;
            }
            float v48 = 0.0;
            uint64_t v49 = v69;
            do
            {
              float v50 = *v49++;
              float v48 = v48 + v50;
              --v47;
            }
            while (v47);
            float v51 = v48 / v46;
          }
          double v70 = v69;
          operator delete(v69);
LABEL_47:
          std::vector<float>::vector(&v67, a6);
          uint64_t v52 = 0;
          double v53 = (float *)__p[0];
          long long v54 = (float *)v67;
          do
          {
            v54[v52] = v53[v52] - v51;
            ++v52;
          }
          while (a6 != v52);
          double v64 = 0;
          double v65 = 0;
          uint64_t v66 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v64, v54, (uint64_t)v68, (v68 - (unsigned char *)v54) >> 2);
          float FrequencyOfZeroCrossing = getFrequencyOfZeroCrossing((uint64_t *)&v64, 1.0);
          if (v64)
          {
            double v65 = v64;
            operator delete(v64);
          }
          if (FrequencyOfZeroCrossing != 0.0) {
            ++v44;
          }
          if (v67)
          {
            double v68 = v67;
            operator delete(v67);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (++v43 == a6) {
            goto LABEL_66;
          }
        }
      }
      double v44 = 0;
LABEL_66:
      BOOL v36 = (unint64_t)v44 >= a8;
      BOOL v57 = v36;
      if (v36)
      {
        double v61 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(__p[0]) = 0;
          double v58 = " Waving Hand: Gesture detected ";
          double v59 = v61;
          uint32_t v60 = 2;
          goto LABEL_72;
        }
      }
      else
      {
        double v61 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 134218240;
          *(void **)((char *)__p + 4) = v44;
          WORD2(__p[1]) = 2048;
          *(void **)((char *)&__p[1] + 6) = (void *)a6;
          double v58 = " Waving Hand: No periodic motion detected (%lu/%lu periodic frames) ";
          double v59 = v61;
          uint32_t v60 = 22;
LABEL_72:
          _os_log_impl(&dword_21B7C6000, v59, OS_LOG_TYPE_DEBUG, v58, (uint8_t *)__p, v60);
        }
      }

      __p[0] = buf;
      std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      if (*(void *)v74)
      {
        long long v75 = *(float **)v74;
        operator delete(*(void **)v74);
      }
      return v57;
    }
  }
  double v56 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)double v74 = 67109120;
    *(_DWORD *)&v74[4] = v14;
    _os_log_impl(&dword_21B7C6000, v56, OS_LOG_TYPE_DEBUG, " Waving Hand: Wrist not detected in frame: %d ", v74, 8u);
  }
LABEL_64:

  return 0;
}

void sub_21B7F6E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28)
{
  a23 = &a19;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  if (__p)
  {
    a28 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL detectFaceVisible(int a1, int a2, int a3, int a4, int a5)
{
  BOOL v9 = a1 == 1 && a2 == 1 && a3 == 1 && a4 == 1 && a5 == 1;
  unint64_t v10 = __ABPKLogSharedInstance();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
    {
      __int16 v16 = 0;
      uint64_t v12 = " Face visible: YES ";
      uint64_t v13 = (uint8_t *)&v16;
LABEL_21:
      _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, v12, v13, 2u);
    }
  }
  else if (v11)
  {
    __int16 v15 = 0;
    uint64_t v12 = " Face visible: NO ";
    uint64_t v13 = (uint8_t *)&v15;
    goto LABEL_21;
  }

  return v9;
}

void *std::vector<std::vector<float>>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<cva::Matrix<double,3u,1u,false>>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_21B7F7048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unsigned int v7 = result;
  uint64_t v8 = *((void *)result + 2);
  BOOL v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    double result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    BOOL v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      float v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  __int16 v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    double result = (char *)memmove(*(void **)result, __src, v14 - v9);
    BOOL v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    float v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    double result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  const char *v12 = &v9[v17];
  return result;
}

void printCGRect(double a1, double a2, double a3, double a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v8 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218752;
    double v11 = a1;
    __int16 v12 = 2048;
    double v13 = a2;
    __int16 v14 = 2048;
    double v15 = a3;
    __int16 v16 = 2048;
    double v17 = a4;
    _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_DEBUG, " \t\t Start, Size: (%f,%f,%f,%f) ", (uint8_t *)&v10, 0x2Au);
  }

  BOOL v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218752;
    double v11 = a1;
    __int16 v12 = 2048;
    double v13 = a2;
    __int16 v14 = 2048;
    double v15 = a1 + a3;
    __int16 v16 = 2048;
    double v17 = a2 + a4;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " \t\t Start, End: (%f,%f,%f,%f) ", (uint8_t *)&v10, 0x2Au);
  }
}

float computeIOUbetweenRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  float v8 = a1;
  float v9 = a2;
  float v10 = a3;
  float v11 = v8 + v10;
  float v12 = a4;
  float v13 = v9 + v12;
  float v14 = a5;
  float v15 = a6;
  float v16 = a7;
  float v17 = v14 + v16;
  float v18 = a8;
  float v19 = v15 + v18;
  float v20 = 0.0;
  if (v8 <= v14) {
    BOOL v21 = v11 < v14;
  }
  else {
    BOOL v21 = v17 < v8;
  }
  if (!v21 && v19 >= v9 && v13 >= v15)
  {
    float v24 = (float)(fminf(v11, v17) - fmaxf(v8, v14)) * (float)(fminf(v13, v19) - fmaxf(v9, v15));
    float v20 = v24
        / (float)((float)((float)((float)(v19 - v15) * (float)(v17 - v14))
                        + (float)((float)(v11 - v8) * (float)(v13 - v9)))
                - v24);
    if (v20 < 0.0)
    {
      float32x2_t v25 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float32x2_t v27 = 0;
        _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_ERROR, " iou < 0.0 ", v27, 2u);
      }
    }
  }
  return v20;
}

uint64_t isANSTPersonTrackerSupportedOnThisDevice()
{
  return determineDeviceANEVersionPriorOrEqualToH14() ^ 1;
}

void sub_21B7F78D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F7970(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F7C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_21B7F7FB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *getABPKAlgorithmExitPointTypeAsString(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_2643B6F18[a1];
  }
}

void sub_21B7F8228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F82EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F8744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F8A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F8E14(_Unwind_Exception *a1)
{
  size_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_21B7F90D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F9288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *convertABPKDeviceOrientationEnumToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return &stru_26CB8CE70;
  }
  else {
    return off_2643B6F58[a1 - 1];
  }
}

BOOL ABPKDeviceOrientationIsLandscape(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL ABPKDeviceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

void sub_21B7F93CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F96C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7F9AD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  float v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ABPKPoseEstimationPipeline;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B7F9C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7FB470(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,void *a34,void *__p,uint64_t a36)
{
  _Unwind_Resume(a1);
}

void sub_21B7FB93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Unwind_Resume(a1);
}

void sub_21B7FBA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<simd_float4x4>::__init_with_size[abi:ne180100]<simd_float4x4 const*,simd_float4x4 const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    double result = std::vector<simd_float4x4>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B7FBD5C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

const float *DepthAndConfidenceInNeighborood(const float *result, int a2, const float *a3, const float *a4, int a5, int a6, int a7, int a8)
{
  if (a2 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = a2;
  }
  if (a2 + 1 < a6 - 1) {
    int v9 = a2 + 1;
  }
  else {
    int v9 = a6 - 1;
  }
  if ((int)v8 - 1 <= v9)
  {
    if ((int)result <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = result;
    }
    int v11 = v10 - 1;
    int v12 = a5 - 1;
    if ((int)result + 1 < a5 - 1) {
      int v12 = result + 1;
    }
    uint64_t v13 = v8 - 1;
    uint64_t v14 = (v9 + 1);
    float v15 = &a3[v13 * a7 - 1 + v10];
    float v16 = &a4[v13 * a8 - 1 + v10];
    uint64_t v17 = (v12 + 1) - v10 + 1;
    float v18 = 3.4028e38;
    do
    {
      uint64_t v19 = v17;
      double result = v16;
      float v20 = (float *)v15;
      if (v11 <= v12)
      {
        do
        {
          if (*v20 > 0.0 && *v20 < v18) {
            float v18 = *v20;
          }
          ++v20;
          ++result;
          --v19;
        }
        while (v19);
      }
      ++v13;
      v15 += a7;
      v16 += a8;
    }
    while (v13 != v14);
  }
  return result;
}

void ExtractJasperNSZs(void *a1@<X0>, char **a2@<X8>)
{
  id v3 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  id v20 = v3;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)a2, (int)[v3 length]);
  for (uint64_t i = 0; i < (int)objc_msgSend(v20, "length", v19); ++i)
  {
    if (*(float *)([v20 confidences] + 4 * i) >= 0.85)
    {
      float32x4_t v5 = *(float32x4_t *)([v20 points] + 16 * i);
      *(float32x2_t *)&long long v6 = vdiv_f32(*(float32x2_t *)v5.f32, (float32x2_t)vdup_laneq_s32((int32x4_t)v5, 2));
      DWORD2(v6) = vmuls_lane_f32(0.001, v5, 2);
      uint64_t v8 = a2[1];
      unint64_t v7 = (unint64_t)a2[2];
      if ((unint64_t)v8 >= v7)
      {
        long long v19 = v6;
        uint64_t v10 = (v8 - *a2) >> 4;
        if ((unint64_t)(v10 + 1) >> 60) {
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v11 = v7 - (void)*a2;
        uint64_t v12 = v11 >> 3;
        if (v11 >> 3 <= (unint64_t)(v10 + 1)) {
          uint64_t v12 = v10 + 1;
        }
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v13) {
          uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>((uint64_t)(a2 + 2), v13);
        }
        else {
          uint64_t v14 = 0;
        }
        float v15 = &v14[16 * v10];
        *(_OWORD *)float v15 = v19;
        int v9 = v15 + 16;
        uint64_t v17 = *a2;
        float v16 = a2[1];
        if (v16 != *a2)
        {
          do
          {
            long long v18 = *((_OWORD *)v16 - 1);
            v16 -= 16;
            *((_OWORD *)v15 - 1) = v18;
            v15 -= 16;
          }
          while (v16 != v17);
          float v16 = *a2;
        }
        *a2 = v15;
        a2[1] = v9;
        a2[2] = &v14[16 * v13];
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        *(_OWORD *)uint64_t v8 = v6;
        int v9 = v8 + 16;
      }
      a2[1] = v9;
    }
  }
}

void sub_21B7FC004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  uint64_t v14 = *(void **)v12;
  if (*(void *)v12)
  {
    *(void *)(v12 + 8) = v14;
    operator delete(v14);
  }

  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    long long v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(v3, a2);
    unint64_t v7 = &v6[v5];
    int v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 1);
        v10 -= 16;
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 16;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

float32_t DepthOfClosestJasperPoint(float32x2_t *a1, float32x2_t **a2)
{
  unint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  float32_t result = -1.0;
  if (*a2 != v3)
  {
    int64_t v5 = v2 + 2;
    float32x2_t v6 = vsub_f32(*v2, *a1);
    float v7 = vaddv_f32(vmul_f32(v6, v6));
    if (&v2[2] != v3)
    {
      uint64_t v8 = v2 + 2;
      do
      {
        float32x2_t v9 = *v8;
        v8 += 2;
        float32x2_t v10 = vsub_f32(v9, *a1);
        float v11 = vaddv_f32(vmul_f32(v10, v10));
        if (v11 < v7)
        {
          unint64_t v2 = v5;
          float v7 = v11;
        }
        int64_t v5 = v8;
      }
      while (v8 != v3);
    }
    if (sqrtf(v7) <= 0.03) {
      return v2[1].f32[0];
    }
  }
  return result;
}

float ABPKAdjustIntrinsicsForViewportSize(simd_float3x3 a1, CGSize a2, CGSize a3)
{
  if (a2.width != a3.width || a2.height != a3.height)
  {
    *(double *)a1.columns[0].i64 = a1.columns[0].f32[0];
    BOOL v4 = a3.width / a3.height < a2.width / a2.height;
    double v5 = a3.width / a2.width;
    if (v4) {
      double v5 = a3.height / a2.height;
    }
    float v6 = v5 * *(double *)a1.columns[0].i64;
    a1.columns[0].f32[0] = v6;
  }
  return a1.columns[0].f32[0];
}

void sub_21B7FC29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7FCAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51)
{
  _Unwind_Resume(a1);
}

unsigned int *cva::MatrixRef<float,0u,1u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixRef<float,0u,1u,false>,cva::MatrixRef<float,0u,1u,false>,cva::detail::MulOp>>(unsigned int *a1, void *a2)
{
  BOOL v4 = (float *)*((void *)a1 + 1);
  double v5 = &v4[-a1[5]];
  float v6 = (_DWORD *)*a2;
  if ((float *)(*(void *)(*a2 + 8) - 4 * *(unsigned int *)(*a2 + 20)) != v5
    && (float *)(*(void *)(a2[1] + 8) - 4 * *(unsigned int *)(a2[1] + 20)) != v5)
  {
    unsigned int v7 = *a1;
    if (*a1 != *v6)
    {
      cva::Logger::instance((cva::Logger *)a1);
      cva::Logger::logInCategory();
      unsigned int v7 = *a1;
      float v6 = (_DWORD *)*a2;
      if (*a1 != *(_DWORD *)*a2) {
        cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>();
      }
      BOOL v4 = (float *)*((void *)a1 + 1);
    }
    if (v7)
    {
      uint64_t v8 = v7;
      float32x2_t v9 = *(float **)(a2[1] + 8);
      float32x2_t v10 = (float *)*((void *)v6 + 1);
      uint64_t v11 = 4 * v8;
      do
      {
        float v12 = *v10++;
        float v13 = v12;
        float v14 = *v9++;
        *v4++ = v13 * v14;
        v11 -= 4;
      }
      while (v11);
    }
    return a1;
  }
  uint64_t v15 = *a1;
  v31[0] = 0;
  v31[1] = 0;
  float v16 = (cva::Logger *)cva::MatrixData<int,0ul,0ul,false>::allocate((void **)v31, v15);
  unsigned int v32 = v15;
  uint64_t v17 = *a2;
  if (v15 != *(_DWORD *)*a2)
  {
    cva::Logger::instance(v16);
    cva::Logger::logInCategory();
    uint64_t v15 = v32;
    uint64_t v17 = *a2;
    if (v32 != *(_DWORD *)*a2) {
      goto LABEL_23;
    }
  }
  long long v18 = v31[0];
  if (v15)
  {
    long long v19 = *(float **)(a2[1] + 8);
    id v20 = *(float **)(v17 + 8);
    uint64_t v21 = 4 * v15;
    float32x2_t v22 = (float *)v31[0];
    do
    {
      float v23 = *v20++;
      float v24 = v23;
      float v25 = *v19++;
      *v22++ = v24 * v25;
      v21 -= 4;
    }
    while (v21);
  }
  if (*a1 == v15) {
    goto LABEL_18;
  }
  cva::Logger::instance(v18);
  cva::Logger::logInCategory();
  uint64_t v15 = *a1;
  if (v15 != v32) {
LABEL_23:
  }
    __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  long long v18 = v31[0];
LABEL_18:
  if (v15)
  {
    float32x2_t v26 = (_DWORD *)*((void *)a1 + 1);
    uint64_t v27 = 4 * v15;
    float32x2_t v28 = v18;
    do
    {
      int v29 = *(_DWORD *)v28;
      float32x2_t v28 = (cva::Logger *)((char *)v28 + 4);
      *v26++ = v29;
      v27 -= 4;
    }
    while (v27);
  }
  free(v18);
  return a1;
}

void sub_21B7FCDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_21B7FD2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34)
{
  if (__p) {
    operator delete(__p);
  }
  unint64_t v37 = *(void **)(v35 - 168);
  if (v37)
  {
    *(void *)(v35 - 160) = v37;
    operator delete(v37);
  }
  uint64_t v38 = *(void **)(v35 - 144);
  if (v38)
  {
    *(void *)(v35 - 136) = v38;
    operator delete(v38);
  }

  _Unwind_Resume(a1);
}

float *cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(float *result, unsigned int ***a2)
{
  unint64_t v2 = result;
  uint64_t v3 = a2[1];
  BOOL v4 = v3[1];
  if (&v4[-*((unsigned int *)v3 + 5)] == (unsigned int *)result)
  {
    int v26 = 0;
    float32_t result = (float *)cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(&v26);
    *(_DWORD *)unint64_t v2 = v26;
  }
  else
  {
    double v5 = **a2;
    unint64_t v6 = *v5;
    uint64_t v7 = *((void *)v5 + 1);
    unint64_t v8 = *(unsigned int *)v3;
    if ((v8 & 0xFFFFFFFC) != 0)
    {
      unint64_t v9 = 0;
      float32x2_t v10 = (float *)(v7 + 8);
      uint64_t v11 = (float *)(v4 + 2);
      float v12 = 0.0;
      do
      {
        if (v9 >= v8) {
          -[PolyNomialExtrapolation predict]();
        }
        if (v9 >= v6) {
          -[PolyNomialExtrapolation predict]();
        }
        float v13 = (float)(*(v10 - 1) * *(v11 - 1)) + (float)(*(v10 - 2) * *(v11 - 2));
        float v14 = *v10;
        float v15 = v10[1];
        v10 += 4;
        float v16 = *v11;
        float v17 = v11[1];
        v11 += 4;
        float v12 = v12 + (float)((float)(v13 + (float)(v14 * v16)) + (float)(v15 * v17));
        v9 += 4;
      }
      while (v9 < (v8 & 0xFFFFFFFC));
    }
    else
    {
      LODWORD(v9) = 0;
      float v12 = 0.0;
    }
    if (v9 < (v8 & 0xFFFFFFFE))
    {
      uint64_t v18 = 0;
      uint64_t v19 = v9;
      uint64_t v20 = v7 + 4 * v9;
      do
      {
        unint64_t v21 = v19 + v18;
        if (v19 + v18 >= v8) {
          -[PolyNomialExtrapolation predict]();
        }
        if (v21 >= v6) {
          -[PolyNomialExtrapolation predict]();
        }
        float v12 = v12
            + (float)((float)(*(float *)(v20 + 4 * v18 + 4) * *(float *)&v4[v21 + 1])
                    + (float)(*(float *)(v20 + 4 * v18) * *(float *)&v4[v21]));
        v18 += 2;
      }
      while (v19 + v18 < (unint64_t)(v8 & 0xFFFFFFFE));
      LODWORD(v9) = v19 + v18;
    }
    if (v9 < v8)
    {
      uint64_t v22 = v9;
      BOOL v23 = v6 >= v9;
      unsigned int v24 = v6 - v9;
      if (!v23) {
        unsigned int v24 = 0;
      }
      unsigned int v25 = v8 + ~v9;
      do
      {
        if (v24 <= v25) {
          -[PolyNomialExtrapolation predict]();
        }
        float v12 = v12 + (float)(*(float *)(v7 + 4 * v22) * *(float *)&v4[v22]);
        ++v22;
      }
      while (v8 != v22);
    }
    void *result = v12;
  }
  return result;
}

void sub_21B7FD72C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B7FE3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,void *__p,uint64_t a27)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v35 = *(void **)(v33 - 160);
  if (v35)
  {
    *(void *)(v33 - 152) = v35;
    operator delete(v35);
  }

  _Unwind_Resume(a1);
}

void sub_21B7FEBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void sub_21B7FFAD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  _Unwind_Resume(a1);
}

uint64_t abpk::SkeletonJointFilter<float>::filter(uint64_t a1, float *a2, unint64_t a3, double a4)
{
  double v24 = a4;
  uint64_t v7 = *(float **)a1;
  unint64_t v8 = *(float **)(a1 + 8);
  if (a3 == ((uint64_t)v8 - *(void *)a1) >> 2)
  {
    if (v8 != v7)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)(a1 + 24);
      while (1)
      {
        float v11 = v7[v9];
        if (v11 < 0.0)
        {
          float v12 = a2[v9];
          if (v12 > 0.0)
          {
            v7[v9] = v12;
            *(_DWORD *)(v10 + 4 * v9) = 0;
            float v11 = v7[v9];
          }
        }
        float v13 = v11 + (float)(*(float *)(a1 + 96) * *(float *)(v10 + 4 * v9));
        float v14 = a2[v9];
        if (v14 >= 0.0) {
          break;
        }
        if (v9 > 0x25 || ((1 << v9) & 0x3CF0000003) == 0) {
          goto LABEL_22;
        }
        v7[v9] = v14;
        float v15 = 0.0;
LABEL_23:
        *(float *)(v10 + 4 * v9++) = v15;
        if (a3 <= v9) {
          return a1;
        }
      }
      *(double *)(*(void *)(a1 + 48) + 8 * v9) = a4;
      float v16 = vabds_f32(v14, v13);
      float v17 = *(float *)(a1 + 76);
      float v18 = 0.0;
      if (v16 >= v17)
      {
        if (v16 >= *(float *)(a1 + 80))
        {
          float v19 = *(float *)(a1 + 84);
          float v18 = 1.0;
          if (v16 >= v19)
          {
            float v18 = 0.0;
            if (v16 < *(float *)(a1 + 88)) {
              float v18 = 1.0 - (float)((float)(v16 - v19) * *(float *)(a1 + 108));
            }
          }
        }
        else
        {
          float v18 = (float)(v16 - v17) * *(float *)(a1 + 104);
        }
      }
      float v20 = fminf(*(float *)(a1 + 100) + (float)(v18 / (float)(*(float *)(a1 + 72) + 1.0)), 1.0);
      float v21 = fmaxf(v20, 0.5);
      if (((1 << v9) & 0x3CF0000003) == 0) {
        float v21 = v20;
      }
      if (v9 <= 0x25) {
        float v20 = v21;
      }
      float v13 = (float)(v13 * (float)(1.0 - v20)) + (float)(v20 * v14);
LABEL_22:
      v7[v9] = v13;
      float v15 = (float)((float)(1.0 - *(float *)(a1 + 112)) * *(float *)(v10 + 4 * v9))
          + (float)(*(float *)(a1 + 112) * (float)(v13 - v11));
      goto LABEL_23;
    }
  }
  else
  {
    std::vector<float>::resize(a1, a3);
    memcpy(*(void **)a1, a2, 4 * a3);
    int v23 = 0;
    std::vector<float>::resize(a1 + 24, a3, &v23);
    std::vector<double>::resize(a1 + 48, a3, &v24);
  }
  return a1;
}

uint64_t *abpk::SkeletonJointFilter<float>::applyTimeConstraint(uint64_t *result, double a2, double a3)
{
  if (a3 >= 0.0)
  {
    uint64_t v3 = *result;
    uint64_t v4 = result[1];
    uint64_t v5 = v4 - *result;
    if (v4 != *result)
    {
      uint64_t v6 = 0;
      unint64_t v7 = v5 >> 2;
      uint64_t v8 = result[6];
      do
      {
        if (a2 - *(double *)(v8 + 8 * v6) > a3)
        {
          *(_DWORD *)(result[3] + 4 * v6) = 0;
          *(_DWORD *)(v3 + 4 * v6) = -1082130432;
        }
        ++v6;
      }
      while (v7 > v6);
    }
  }
  return result;
}

void printCGRect(CGRect a1, float a2, float a3)
{
  double height = a1.size.height;
  double width = a1.size.width;
  double y = a1.origin.y;
  double x = a1.origin.x;
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134218752;
    double v11 = x * a2;
    __int16 v12 = 2048;
    double v13 = y * a3;
    __int16 v14 = 2048;
    double v15 = width * a2 + v11;
    __int16 v16 = 2048;
    double v17 = height * a3 + v13;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " \t\t (%f,%f,%f,%f) ", (uint8_t *)&v10, 0x2Au);
  }
}

void sub_21B80071C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B800B38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  if (a11) {
    operator delete(a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t abpk::SkeletonJointFilter<float>::~SkeletonJointFilter(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(void *)(a1 + 32) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
  }
  return a1;
}

__n128 _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100INS_27__optional_move_assign_baseIS5_Lb0EEEEEvOT_(uint64_t a1, __n128 *a2)
{
  if (*(unsigned __int8 *)(a1 + 24) == a2[1].n128_u8[8])
  {
    if (*(unsigned char *)(a1 + 24))
    {
      result.n128_u64[0] = std::vector<float>::__move_assign(a1, a2).n128_u64[0];
    }
  }
  else if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v4 = *(void **)a1;
    if (*(void *)a1)
    {
      *(void *)(a1 + 8) = v4;
      operator delete(v4);
    }
    *(unsigned char *)(a1 + 24) = 0;
  }
  else
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    __n128 result = *a2;
    *(__n128 *)a1 = *a2;
    *(void *)(a1 + 16) = a2[1].n128_u64[0];
    a2->n128_u64[0] = 0;
    a2->n128_u64[1] = 0;
    a2[1].n128_u64[0] = 0;
    *(unsigned char *)(a1 + 24) = 1;
  }
  return result;
}

void _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE13__assign_fromB8ne180100IRKNS_27__optional_copy_assign_baseIS5_Lb0EEEEEvOT_(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24))
  {
    if (a1 != a2 && *(unsigned char *)(a1 + 24))
    {
      uint64_t v3 = *(void *)(a2 + 8);
      unint64_t v4 = (v3 - *(void *)a2) >> 3;
      uint64_t v5 = *(char **)a2;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)a1, v5, v3, v4);
    }
  }
  else if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v6 = *(void **)a1;
    if (*(void *)a1)
    {
      *(void *)(a1 + 8) = v6;
      operator delete(v6);
    }
    *(unsigned char *)(a1 + 24) = 0;
  }
  else
  {
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m((void *)a1, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
    *(unsigned char *)(a1 + 24) = 1;
  }
}

void *_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B800FE0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

abpk::Human *abpk::Human::Human(abpk::Human *this, const abpk::Human *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(this, *(const void **)a2, *((void *)a2 + 1), (uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 3);
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((void *)this + 3, *((const void **)a2 + 3), *((void *)a2 + 4), (uint64_t)(*((void *)a2 + 4) - *((void *)a2 + 3)) >> 2);
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>((void *)this + 6, *((const void **)a2 + 6), *((void *)a2 + 7), (uint64_t)(*((void *)a2 + 7) - *((void *)a2 + 6)) >> 2);
  _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6_((uint64_t)this + 72, (uint64_t)a2 + 72);
  uint64_t v4 = *((void *)a2 + 13);
  *(void *)((char *)this + 109) = *(void *)((char *)a2 + 109);
  *((void *)this + 13) = v4;
  return this;
}

void sub_21B8010A4(_Unwind_Exception *exception_object)
{
  uint64_t v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 56) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(exception_object);
}

uint64_t _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6_(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 24) = 0;
  _ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE16__construct_fromB8ne180100IRKNS_20__optional_copy_baseIS5_Lb0EEEEEvOT_((void *)a1, a2);
  return a1;
}

void sub_21B801120(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 24)) {
    _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6__cold_1(v1);
  }
  _Unwind_Resume(exception_object);
}

void *_ZNSt3__123__optional_storage_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EE16__construct_fromB8ne180100IRKNS_20__optional_copy_baseIS5_Lb0EEEEEvOT_(void *result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 24))
  {
    unint64_t v2 = result;
    void *result = 0;
    result[1] = 0;
    result[2] = 0;
    __n128 result = _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(result, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
    *((unsigned char *)v2 + 24) = 1;
  }
  return result;
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<unsigned long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B8011E8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

abpk::Human *std::vector<abpk::Human>::__init_with_size[abi:ne180100]<abpk::Human*,abpk::Human*>(abpk::Human *result, abpk::Human *a2, abpk::Human *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<abpk::Human>::__vallocate[abi:ne180100](result, a4);
    __n128 result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<abpk::Human>,abpk::Human*,abpk::Human*,abpk::Human*>((uint64_t)v6 + 16, a2, a3, *((abpk::Human **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

void sub_21B80126C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<abpk::Human>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<abpk::Human>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::Human>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[120 * v4];
  return result;
}

abpk::Human *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<abpk::Human>,abpk::Human*,abpk::Human*,abpk::Human*>(uint64_t a1, abpk::Human *a2, abpk::Human *a3, abpk::Human *this)
{
  uint64_t v4 = this;
  uint64_t v10 = this;
  double v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      abpk::Human::Human(v4, v6);
      uint64_t v6 = (const abpk::Human *)((char *)v6 + 120);
      uint64_t v4 = (abpk::Human *)((char *)v11 + 120);
      double v11 = (abpk::Human *)((char *)v11 + 120);
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_21B801370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<abpk::Human>,abpk::Human*>::operator()[abi:ne180100](uint64_t *a1)
{
  unint64_t v2 = (uint64_t *)a1[1];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v4 = *v2;
  if (*v1 != *v2)
  {
    uint64_t v5 = *a1;
    do
    {
      v3 -= 120;
      std::allocator<abpk::Human>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<double>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  size_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  char v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      double v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      char v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      double v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    }
    else {
      double v15 = 0;
    }
    uint64_t v18 = &v15[4 * v12];
    float v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    float v21 = v18;
    do
    {
      *(_DWORD *)float v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    uint64_t v22 = &v15[4 * v14];
    int v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void std::vector<double>::__append(void **a1, unint64_t a2, void *a3)
{
  size_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  char v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      double v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      char v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      double v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v6, v14);
    }
    else {
      double v15 = 0;
    }
    uint64_t v18 = &v15[8 * v12];
    float v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    float v21 = v18;
    do
    {
      *(void *)float v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    uint64_t v22 = &v15[8 * v14];
    int v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B801718(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id ARDeviceANEVersion()
{
  if ([MEMORY[0x263F28048] hasANE])
  {
    v0 = [MEMORY[0x263F28048] aneSubType];
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

uint64_t determineDeviceANEVersionPriorOrEqualToH12()
{
  if (determineDeviceANEVersionPriorOrEqualToH12_onceToken != -1) {
    dispatch_once(&determineDeviceANEVersionPriorOrEqualToH12_onceToken, &__block_literal_global_1);
  }
  return determineDeviceANEVersionPriorOrEqualToH12_result;
}

void __determineDeviceANEVersionPriorOrEqualToH12_block_invoke()
{
  ARDeviceANEVersion();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v2 lowercaseString];
  if (([v0 isEqualToString:@"m9"] & 1) != 0
    || ([v0 isEqualToString:@"h10"] & 1) != 0
    || ([v0 isEqualToString:@"h11"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v0 isEqualToString:@"h12"];
  }
  determineDeviceANEVersionPriorOrEqualToH12___n128 result = v1;
}

uint64_t determineDeviceANEVersionPriorOrEqualToH14()
{
  if (determineDeviceANEVersionPriorOrEqualToH14_onceToken != -1) {
    dispatch_once(&determineDeviceANEVersionPriorOrEqualToH14_onceToken, &__block_literal_global_12);
  }
  return determineDeviceANEVersionPriorOrEqualToH14_result;
}

void __determineDeviceANEVersionPriorOrEqualToH14_block_invoke()
{
  ARDeviceANEVersion();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v2 lowercaseString];
  if (([v0 isEqualToString:@"m9"] & 1) != 0
    || ([v0 isEqualToString:@"h10"] & 1) != 0
    || ([v0 isEqualToString:@"h11"] & 1) != 0
    || ([v0 isEqualToString:@"h12"] & 1) != 0
    || ([v0 isEqualToString:@"h13"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v0 isEqualToString:@"h14"];
  }
  determineDeviceANEVersionPriorOrEqualToH14___n128 result = v1;
}

id ABPKMLModelAddANEVersion(void *a1, char a2)
{
  id v3 = a1;
  if ((a2 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v4 = [MEMORY[0x263F28048] aneSubType];
  if (![MEMORY[0x263F28048] hasANE]
    || ([v4 isEqualToString:@"m9"] & 1) != 0)
  {

LABEL_5:
    id v5 = v3;
    goto LABEL_6;
  }
  uint64_t v7 = [v4 uppercaseString];
  size_t v8 = [@"_" stringByAppendingString:v7];
  id v5 = [v3 stringByAppendingString:v8];

LABEL_6:
  return v5;
}

__CFString *ABPKMLModelFolder(int a1)
{
  id v2 = [MEMORY[0x263F28048] aneSubType];
  if (a1
    && [MEMORY[0x263F28048] hasANE]
    && ([v2 isEqualToString:@"m9"] & 1) == 0)
  {
    id v5 = [NSString alloc];
    uint64_t v6 = [v2 uppercaseString];
    id v3 = (__CFString *)[v5 initWithFormat:@"%@", v6];
  }
  else
  {
    id v3 = &stru_26CB8CE70;
  }

  return v3;
}

id ABPKMLModelPath(void *a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if (([v6 isEqualToString:@"2DHumanPoseDetectorBreakthrough"] & 1) != 0
    || ([v6 isEqualToString:@"2DHumanPoseDetector"] & 1) != 0
    || ([v6 isEqualToString:@"2DHumanPoseDetectorFull"] & 1) != 0
    || ([v6 isEqualToString:@"3DHumanPoseLifting"] & 1) != 0
    || ([v6 isEqualToString:@"3DHumanPoseLiftingSequenceFirstStage"] & 1) != 0
    || [v6 isEqualToString:@"3DHumanPoseLiftingLSTM"])
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"e5bundles/%@.mlmodelc.bundle", v6];
    size_t v8 = [v5 pathForResource:v7 ofType:0];
  }
  else
  {
    uint64_t v7 = ABPKMLModelAddANEVersion(v6, a3);
    unint64_t v11 = ABPKMLModelFolder(a3);
    size_t v8 = [v5 pathForResource:v7 ofType:@"mlmodelc" inDirectory:v11];
  }
  char v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)vImage_Buffer buf = 138412290;
    uint64_t v13 = v8;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_INFO, " Loading the model: %@ ", buf, 0xCu);
  }

  return v8;
}

void sub_21B80261C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  _Unwind_Resume(a1);
}

void sub_21B8026AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPK3DLiftingSequence;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B802A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B802B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B802E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  _Unwind_Resume(a1);
}

void sub_21B803880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  if (__p) {
    operator delete(__p);
  }
  if (a27) {
    operator delete(a27);
  }
  if (a30) {
    operator delete(a30);
  }

  _Unwind_Resume(a1);
}

void sub_21B804250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20)
{
  _Unwind_Resume(a1);
}

void sub_21B804604(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  std::deque<std::pair<long,long>>::~deque[abi:ne180100](a2);
  double v15 = *(void **)(v13 - 136);
  if (v15)
  {
    *(void *)(v13 - 128) = v15;
    operator delete(v15);
  }
  _Unwind_Resume(a1);
}

double __Block_byref_object_copy__0(void *a1, void *a2)
{
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  double result = 0.0;
  *((_OWORD *)a2 + 3) = 0u;
  *((_OWORD *)a2 + 4) = 0u;
  a1[10] = a2[10];
  a1[11] = a2[11];
  a2[10] = 0;
  a2[11] = 0;
  return result;
}

uint64_t __Block_byref_object_dispose__0(uint64_t a1)
{
  return std::deque<std::pair<long,long>>::~deque[abi:ne180100]((void *)(a1 + 48));
}

unint64_t **abpk::RingBuffer<std::vector<float>,9ul>::Iterator<true>::operator-=(unint64_t **result, unint64_t a2)
{
  unint64_t v2 = (unint64_t)result[1];
  if (v2 == 9) {
    unint64_t v2 = **result;
  }
  unint64_t v3 = a2 % 9;
  if (a2 <= 9) {
    unint64_t v3 = a2;
  }
  BOOL v4 = v2 >= v3;
  unint64_t v5 = v2 - v3;
  if (v4)
  {
    result[1] = (unint64_t *)v5;
    if (*((unsigned char *)result + 16)) {
      return result;
    }
  }
  else if (*((unsigned char *)result + 16))
  {
    v5 += 9;
    result[1] = (unint64_t *)v5;
    *((unsigned char *)result + 16) = 0;
  }
  else
  {
    unint64_t v5 = **result;
    result[1] = (unint64_t *)v5;
  }
  id v6 = (unint64_t *)**result;
  if (v5 < (unint64_t)v6) {
    result[1] = v6;
  }
  return result;
}

void sub_21B804F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B804F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPK3DLifting;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B805264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }

  _Unwind_Resume(a1);
}

void sub_21B805344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B8053F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B8057E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B805C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  std::deque<std::pair<int,int>>::~deque[abi:ne180100](&a27);
  _Unwind_Resume(a1);
}

void std::deque<std::pair<int,int>>::push_back(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::pair<int,int>>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  *(void *)(*(void *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

uint64_t std::deque<std::pair<int,int>>::~deque[abi:ne180100](void *a1)
{
  unint64_t v2 = (void **)a1[1];
  unint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      unint64_t v3 = (void **)a1[2];
      unint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 256;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    unint64_t v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::~__split_buffer((uint64_t)a1);
}

void std::deque<std::pair<int,int>>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    size_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    char v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)size_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      float v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      size_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        size_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        float v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)float v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    float v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      char v9 = (char *)a1[1];
    }
    size_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *>>::push_front((uint64_t)a1, &v54);
    double v44 = (void *)a1[1];
    size_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    char v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      float v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      float v48 = (uint64_t *)a1[1];
      size_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        size_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        float v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)float v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        size_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  double v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  double v53 = operator new(0x1000uLL);
  std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_back(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::pair<long,long> *,std::allocator<std::pair<long,long> *> &>::push_front((uint64_t)&v54, v27);
  }
  int v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_21B8063B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_21B8069D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B806A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ABPKAlgorithmRA;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B806E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80700C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Unwind_Resume(a1);
}

void sub_21B8071E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B8073E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B8079C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  btr::BodyRegistrationInfo::~BodyRegistrationInfo((btr::BodyRegistrationInfo *)va);
  uint64_t v17 = *(void **)(v15 - 160);
  if (v17)
  {
    *(void *)(v15 - 152) = v17;
    operator delete(v17);
  }
  std::__tree<unsigned char>::destroy(v15 - 136, *(void **)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_21B808008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  btr::BodyRegistrationInfo::~BodyRegistrationInfo((btr::BodyRegistrationInfo *)va);
  BOOL v14 = (void *)STACK[0x238];
  if (STACK[0x238])
  {
    STACK[0x240] = (unint64_t)v14;
    operator delete(v14);
  }

  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE8__appendEm((void **)a1, a2 - v2);
  }
}

uint64_t *std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(uint64_t **a1, int *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        size_t v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    size_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v10 + 28) = *a3;
    std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE8__appendEm(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<abpk::peak>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    BOOL v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    uint64_t v18 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        long long v19 = *((_OWORD *)v17 - 1);
        v17 -= 16;
        *((_OWORD *)v14 - 1) = v19;
        v14 -= 16;
      }
      while (v17 != v18);
      uint64_t v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void sub_21B8085B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80872C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B808860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B808B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80900C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B8090E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B8092BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B8095DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80965C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ABPKImagePreProcessing;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21B809C30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80A270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80A8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void *std::vector<ABPKSRT>::__init_with_size[abi:ne180100]<ABPKSRT const*,ABPKSRT const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    double result = std::vector<ABPKSRT>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21B80AA40(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ABPKSRT>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKSRT>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ABPKSRT>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

id CreateABPK3DLiftingAlgorithm()
{
  int v0 = determineDeviceANEVersionPriorOrEqualToH12();
  uint64_t v1 = off_2643B6B78;
  if (!v0) {
    uint64_t v1 = off_2643B6B80;
  }
  id v2 = objc_alloc_init(*v1);
  return v2;
}

void sub_21B80ACC0(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_21B80B3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_21B80B6F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int32x2_t *_distanceBetweenTwoPoses(int32x2_t *result, float32x2_t *a2, uint64_t a3)
{
  for (float i = 0.0; a3; --a3)
  {
    *(int32x2_t *)v4.f32 = vrev64_s32(*result);
    *(float32x2_t *)&v4.u32[2] = *a2;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32(vcltzq_f32(v4))) & 1) == 0)
    {
      float32x2_t v5 = vsub_f32((float32x2_t)*result, *a2);
      float i = i + sqrtf(vaddv_f32(vmul_f32(v5, v5)));
    }
    ++a2;
    ++result;
  }
  return result;
}

BOOL _isValueInVector(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8) - *(void *)a1;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3 >> 3;
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  if (*v2 == a2) {
    return 1;
  }
  uint64_t v7 = 1;
  do
  {
    unint64_t v8 = v7;
    if (v5 == v7) {
      break;
    }
    uint64_t v9 = v2[v7++];
  }
  while (v9 != a2);
  return v8 < v4;
}

void sub_21B80C5AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36)
{
  if (__p) {
    operator delete(__p);
  }
  if (a35) {
    operator delete(a35);
  }

  _Unwind_Resume(a1);
}

void sub_21B80CD94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80D104(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21B80D338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80D698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80DD3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_21B80E08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80E2DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80E3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80E594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80E6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80E7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80E834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B80E8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21B80EB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21B80ED84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    std::vector<unsigned int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_21B80EFB8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t variable initialization expression of ABPKImageData.pixelBuffer()
{
  return 0;
}

void *ABPKImageData.pixelBuffer.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void ABPKImageData.pixelBuffer.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR___ABPKImageData_pixelBuffer);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*ABPKImageData.pixelBuffer.modify())()
{
  return j__swift_endAccess;
}

double ABPKImageData.timestamp.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___ABPKImageData_timestamp;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t ABPKImageData.timestamp.setter(double a1)
{
  id v3 = (double *)(v1 + OBJC_IVAR___ABPKImageData_timestamp);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*ABPKImageData.timestamp.modify())()
{
  return j_j__swift_endAccess;
}

id ABPKImageData.__allocating_init(pixelBuffer:timestamp:)(void *a1, double a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  uint64_t v6 = (void **)&v5[OBJC_IVAR___ABPKImageData_pixelBuffer];
  *(void *)&v5[OBJC_IVAR___ABPKImageData_pixelBuffer] = 0;
  swift_beginAccess();
  uint64_t v7 = *v6;
  void *v6 = a1;
  unint64_t v8 = v5;
  id v9 = a1;

  *(double *)&v8[OBJC_IVAR___ABPKImageData_timestamp] = a2;
  v12.receiver = v8;
  v12.super_class = v2;
  id v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id ABPKImageData.init(pixelBuffer:timestamp:)(void *a1, double a2)
{
  uint64_t v5 = (void **)&v2[OBJC_IVAR___ABPKImageData_pixelBuffer];
  *(void *)&v2[OBJC_IVAR___ABPKImageData_pixelBuffer] = 0;
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a1;
  uint64_t v7 = v2;
  id v8 = a1;

  *(double *)&v7[OBJC_IVAR___ABPKImageData_timestamp] = a2;
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for ABPKImageData();
  id v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

uint64_t type metadata accessor for ABPKImageData()
{
  return self;
}

id ABPKImageData.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ABPKImageData.init()()
{
}

id ABPKImageData.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ABPKImageData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void type metadata accessor for CVBuffer()
{
  if (!qword_267C5B8D0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_267C5B8D0);
    }
  }
}

void abpk::Human::resize()
{
  __assert_rtn("resize", "ABPKHuman.cpp", 57, "newSize <= numberOfJoints()");
}

void cva::PoseRefiner<double>::refinePose()
{
}

void cva::MatrixData<int,0ul,0ul,false>::allocate()
{
}

{
  __assert_rtn("allocate", "matrixdata.h", 479, "(!m_data) || cva::detail::assertMessage(\"No matrix data must be allocated.\")");
}

void cva::SE3GroupStorage<double,cva::Matrix<double,4u,4u,false>>::SE3GroupStorage()
{
  __assert_rtn("operator=", "matrixref.h", 490, "(it == list.end()) || cva::detail::assertMessage(\"Bad number of items in initializer list.\")");
}

void cva::Array<unsigned short,2u,16u>::allocate()
{
  __assert_rtn("allocate", "array.h", 257, "(nullptr != ptr) || cva::detail::assertMessage(\"Out of memory!\")");
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::inverse()
{
  __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::decomposeDirect<0u,0u>()
{
  __assert_rtn("decomposeDirect", "matrixsvd.h", 433, "(info == 0) || cva::detail::assertMessage(\"gesvd() query workspace size failed!\")");
}

void cva::SVD<cva::Matrix<float,0u,0u,false>,true>::S()
{
  __assert_rtn("VectorAsDiagonalExpr", "vectorasdiagexpr.h", 211, "(std::min(rows, cols) <= vector.elements()) || cva::detail::assertMessage(\"The matrix can't be in both dimensions larger than its diagonal.\")");
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false> const>,cva::Matrix<float,0u,0u,false>>()
{
  __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::assign<false,false,cva::Matrix<float,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>>>()
{
  __assert_rtn("assert_in_bounds", "matrixmixin.h", 2252, "((row + nRows <= mixed().rows()) && (col + nCols <= mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
}

void cva::detail::assignNoAlias<cva::Matrix<float,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<float,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<float,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>()
{
}

void convertNSArrayToSimd3x3_cold_1()
{
  __assert_rtn("convertNSArrayToSimd3x3", "ABPKSimdUtils.m", 122, "[arr count] == 9 || [arr count] == 3");
}

void convertNSArrayToSimd4x4_cold_1()
{
  __assert_rtn("convertNSArrayToSimd4x4", "ABPKSimdUtils.m", 138, "[arr count] == 16");
}

void convertNSMatToSimd4x4_cold_1()
{
  __assert_rtn("convertNSMatToSimd4x4", "ABPKSimdUtils.m", 148, "[arr count] == 4");
}

void convertNSArrayToSimd4_cold_1()
{
  __assert_rtn("convertNSArrayToSimd4", "ABPKSimdUtils.m", 158, "[arr count] == 4");
}

void simdFloat3FromArray_cold_1()
{
  __assert_rtn("simdFloat3FromArray", "ABPKSimdUtils.m", 186, "arr != nil");
}

void simdFloat3FromArray_cold_2()
{
  __assert_rtn("simdFloat3FromArray", "ABPKSimdUtils.m", 187, "[arr count] == 3");
}

void simdFloat4x4FromRotation_cold_1()
{
  __assert_rtn("simdFloat4x4FromRotation", "ABPKSimdUtils.m", 210, "rot != nil && trans != nil");
}

void simdFloat4x4FromRotation_cold_2()
{
  __assert_rtn("simdFloat4x4FromRotation", "ABPKSimdUtils.m", 212, "[trans count] == 3");
}

void simdFloat4x4FromRotation_cold_3()
{
  __assert_rtn("simdFloat4x4FromRotation", "ABPKSimdUtils.m", 211, "[rot count] == 9");
}

void _ZNSt3__120__optional_copy_baseINS_6vectorIDv2_fNS_9allocatorIS2_EEEELb0EEC2B8ne180100ERKS6__cold_1(uint64_t a1)
{
  objc_super v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return (CVBufferRef)MEMORY[0x270EEA008](buffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x270EEA2C0](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t CoreIKCreateAltruisticSolverInstance()
{
  return MEMORY[0x270F1A458]();
}

uint64_t CoreIKDestroySolver()
{
  return MEMORY[0x270F1A498]();
}

uint64_t CoreIKSolveModelSpaceSource()
{
  return MEMORY[0x270F1A728]();
}

uint64_t CoreIKSolverGetSourceBufferSize()
{
  return MEMORY[0x270F1A738]();
}

uint64_t CoreIKSolverGetTargetBufferSize()
{
  return MEMORY[0x270F1A740]();
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t cva::Logger::logInCategory()
{
  return MEMORY[0x270F18AC0]();
}

uint64_t cva::Logger::instance(cva::Logger *this)
{
  return MEMORY[0x270F18AC8](this);
}

void cva::VecLib<float>::gemm()
{
  while (1)
    ;
}

void cva::VecLib<float>::gemv()
{
  while (1)
    ;
}

uint64_t cva::vecLib::sysv<double>()
{
  return MEMORY[0x270F18AD8]();
}

uint64_t cva::vecLib::gesvd<float>()
{
  return MEMORY[0x270F18AE8]();
}

uint64_t cva::imwrite<cva::Matrix<unsigned char,3u,1u,false>>()
{
  return MEMORY[0x270F18AF0]();
}

uint64_t cva::imwrite<unsigned short>()
{
  return MEMORY[0x270F18B08]();
}

uint64_t Espresso::get_internal_context(Espresso *this, void *a2)
{
  return MEMORY[0x270F279E0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
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
  result.__double cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__double cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

long double acos(long double __x)
{
  MEMORY[0x270ED8588](__x);
  return result;
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x270F27AE8]();
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x270F27B00]();
}

uint64_t e5rt_buffer_object_get_size()
{
  return MEMORY[0x270F27B10]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x270F27B20]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x270F27B90]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x270F27BA0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x270F27BB0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x270F27BC0]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x270F27BE0]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x270F27BF0]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x270F27BF8]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x270F27C08]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x270F27C28]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x270F27C30]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x270F27C40]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x270F27C68]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x270F27C70]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x270F27C88]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x270F27C98]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x270F27CB0]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x270F27CD8]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x270F27CE8]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x270F27CF0]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x270F27D80]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x270F27D90]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x270F27DA0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x270F27DB0]();
}

uint64_t e5rt_surface_object_alloc()
{
  return MEMORY[0x270F27DC8]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x270F27DD8]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x270F27DE8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x270F27E10]();
}

uint64_t e5rt_tensor_desc_dtype_get_element_size()
{
  return MEMORY[0x270F27E28]();
}

uint64_t e5rt_tensor_desc_dtype_get_num_components()
{
  return MEMORY[0x270F27E30]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x270F27E38]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x270F27E58]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x270F27E68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x270F27E78]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x270F27E88]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x270F27EE0]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x270F27F08]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x270F27F20]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x270F27F78]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x270F27F98]();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return MEMORY[0x270F27FA0]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x270F28008]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x270F28010]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x270F28030]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x270F28048]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x270F28068]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x270F28070]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x270F28080]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x270F28090]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x270F280A0]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x270F280A8]();
}

uint64_t espresso_set_image_preprocessing_params()
{
  return MEMORY[0x270F280D8]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
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

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x270EDF508](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDF520](src, destYp, destCbCr, info, permuteMap, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x270EDF528](a1, a2, *(void *)&a3);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x270EDF530](matrix, pixelRange, outInfo, *(void *)&inARGBType, *(void *)&outYpCbCrType, *(void *)&flags);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x270EDF548](matrix, pixelRange, outInfo, *(void *)&inYpCbCrType, *(void *)&outARGBType, *(void *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x270EDF558](scalar, src, dest, copyMask, *(void *)&flags);
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x270EDF560](newSrc, origSrc, dest, copyMask, *(void *)&flags);
}

vImage_Error vImagePermuteChannels_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x270EDF568](src, dest, permuteMap, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF570](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF578](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x270EDF5A0](src, dest, *(void *)&flags);
}