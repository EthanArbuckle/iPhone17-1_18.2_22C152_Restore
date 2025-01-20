uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
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

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    void *v19 = i;
    goto LABEL_39;
  }
  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_1DC560DE0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__do_rehash<true>(a1, prime);
    }
  }
}

id _DPSemanticVersionError(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = a1;
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  int8x8_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  unint64_t v5 = [v1 errorWithDomain:@"com.apple.DifferentialPrivacy.SemanticVersionError" code:1 userInfo:v4];

  return v5;
}

id _DPPrivacyBudgetError(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a2;
  int8x8_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a2;
  uint8x8_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"com.apple.DifferentialPrivacy.DPPrivacyBudgetError" code:a1 userInfo:v6];

  return v7;
}

id _DPPrivacyBudgetErrorWithUnderlyingError(uint64_t a1, void *a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  v13[0] = *MEMORY[0x1E4F28568];
  v13[1] = v6;
  v14[0] = a2;
  v14[1] = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v7 dictionaryWithObjects:v14 forKeys:v13 count:2];
  unint64_t v11 = [v5 errorWithDomain:@"com.apple.DifferentialPrivacy.DPPrivacyBudgetError" code:a1 userInfo:v10];

  return v11;
}

void sub_1DC566B8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_DWORD **poly_memory_alloc(size_t a1)
{
  if (a1 - 4293918721u < 0xFFFFFFFF00100001) {
    return 0;
  }
  v1 = (_DWORD **)malloc_type_calloc(1uLL, 0x40uLL, 0x1004098A284A9uLL);
  void *v1 = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[1] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[2] = malloc_type_calloc(a1 >> 1, 4uLL, 0x100004052888210uLL);
  v1[3] = malloc_type_calloc(a1 >> 1, 4uLL, 0x100004052888210uLL);
  v1[4] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[5] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[6] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  v1[7] = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  poly_fft_get_roots(*v1, a1, 0);
  poly_fft_get_roots(v1[1], a1, 1);
  poly_fft_get_roots(v1[2], a1 >> 1, 0);
  poly_fft_get_roots(v1[3], a1 >> 1, 1);
  return v1;
}

BOOL poly_fft_get_roots(_DWORD *a1, unint64_t a2, int a3)
{
  unint64_t v3 = a2 - 2;
  if (a2 - 2 <= 0xFFFFE)
  {
    unsigned int v6 = -368989143;
    if (a3) {
      unsigned int v6 = invmod(0xEA01AC29);
    }
    *a1 = 1;
    unsigned int v7 = expmod(v6, 0x100000 / a2);
    a1[1] = v7;
    if (a2 >= 3)
    {
      id v8 = a1 + 2;
      unint64_t v9 = v3;
      unsigned int v10 = v7;
      do
      {
        unsigned int v7 = v10 * v7
           - v10 * (unint64_t)v7 / 0xFFF00001
           + ((v10 * (unint64_t)v7 / 0xFFF00001) << 20);
        *v8++ = v7;
        --v9;
      }
      while (v9);
    }
  }
  return v3 < 0xFFFFF;
}

void poly_memory_free(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1[1]);
    free(a1[2]);
    free(a1[3]);
    free(a1[4]);
    free(a1[5]);
    free(a1[6]);
    free(a1[7]);
  }
  free(a1);
}

BOOL poly_fft(int *a1, _DWORD *a2, _DWORD *a3, unint64_t a4, int a5, int **a6)
{
  if (a4 > 0xFFF00000) {
    return 0;
  }
  unint64_t v9 = a4;
  BOOL result = isNonZeroPowerOfTwo(a4);
  if (result)
  {
    fft_recurse(a1, v9, a3, a2, *a6, a6[1], a6[2]);
    if (a5)
    {
      for (unsigned int i = invmod(v9); v9; --v9)
      {
        *a1 = *a1 * i
            - *a1 * (unint64_t)i / 0xFFF00001
            + ((*a1 * (unint64_t)i / 0xFFF00001) << 20);
        ++a1;
      }
    }
    return 1;
  }
  return result;
}

int *fft_recurse(int *result, unint64_t a2, _DWORD *a3, _DWORD *a4, int *a5, _DWORD *a6, _DWORD *a7)
{
  do
  {
    while (1)
    {
      unint64_t v11 = a4;
      if (a2 == 1)
      {
        *BOOL result = *a4;
        return result;
      }
      float v12 = a7;
      float v13 = a6;
      BOOL v14 = a5;
      unint64_t v15 = a2 >> 1;
      if (a2) {
        break;
      }
      a5 += v15;
      a6 += v15;
      a7 += v15;
      fft_recurse(v14, v15, v12, v13, &v14[v15], &v13[v15], &v12[v15]);
      BOOL result = v14;
      a2 = 0;
      a3 = v12;
      a4 = v13;
    }
    v36 = a3;
    v37 = result;
    uint64_t v16 = 0;
    if (v15 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = a2 >> 1;
    }
    uint64_t v18 = a3;
    do
    {
      unsigned int v19 = a4[v16];
      unsigned int v20 = -1048575 - a4[v15 + v16];
      BOOL v21 = v19 >= v20;
      unsigned int v22 = v19 - v20;
      if (!v21) {
        v22 -= 0xFFFFF;
      }
      a6[v16] = v22;
      int v23 = *v18;
      v18 += 2;
      a7[v16++] = v23;
    }
    while (v17 != v16);
    a5 += v15;
    a6 += v15;
    a7 += v15;
    fft_recurse(v14, a2 >> 1, v12, v13, &v14[v15], &v13[v15], &v12[v15]);
    BOOL result = v14;
    a3 = v12;
    a4 = v13;
    BOOL v21 = a2 >= 2;
    a2 >>= 1;
  }
  while (!v21);
  uint64_t v24 = 0;
  if (v15 <= 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v15;
  }
  v26 = v37;
  do
  {
    int *v26 = v14[v24];
    v26 += 2;
    ++v24;
  }
  while (v25 != v24);
  uint64_t v27 = 0;
  if (v15 <= 1) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v15;
  }
  do
  {
    unsigned int v29 = v11[v27];
    unsigned int v30 = v11[v15 + v27];
    BOOL v21 = v29 >= v30;
    unsigned int v31 = v29 - v30;
    if (!v21) {
      v31 -= 0xFFFFF;
    }
    v13[v27] = v31;
    unint64_t v32 = v36[v27] * (unint64_t)v31;
    v13[v27++] = v32 - v32 / 0xFFF00001 + ((v32 / 0xFFF00001) << 20);
  }
  while (v28 != v27);
  BOOL result = (int *)fft_recurse(v14, v15, v12, v13, &v14[v15], &v13[v15], &v12[v15]);
  if (v15 <= 1) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = v15;
  }
  v34 = v37 + 1;
  do
  {
    int v35 = *v14++;
    _DWORD *v34 = v35;
    v34 += 2;
    --v33;
  }
  while (v33);
  return result;
}

float _DPL2Norm(float *a1, uint64_t a2)
{
  for (float i = 0.0; a2; --a2)
  {
    float v3 = *a1++;
    float i = i + (float)(v3 * v3);
  }
  return sqrtf(i);
}

float _DPClipNorm(float *a1, uint64_t a2, float a3)
{
  float v3 = 0.0;
  if (a2)
  {
    int8x8_t v4 = a1;
    uint64_t v5 = a2;
    do
    {
      float v6 = *v4++;
      float v3 = v3 + (float)(v6 * v6);
      --v5;
    }
    while (v5);
    float v7 = sqrtf(v3);
    if (v7 > a3) {
      float v3 = a3;
    }
    else {
      float v3 = v7;
    }
    if (v7 > a3 && a2 != 0)
    {
      do
      {
        *a1 = (float)(a3 / v7) * *a1;
        ++a1;
        --a2;
      }
      while (a2);
      return a3;
    }
  }
  else if (a3 < 0.0)
  {
    return a3;
  }
  return v3;
}

long double _DPGaussianMechanismMinimumDelta(long double a1, double a2, double a3)
{
  double v5 = a2 + a2;
  long double v6 = a1 * a2 / a3;
  long double v7 = erfc((a3 / (a2 + a2) - v6) / -1.41421356) * 0.5;
  long double v8 = erfc((-a3 / v5 - v6) / -1.41421356) * 0.5;
  return v7 - exp(a1) * v8;
}

void _DPMomentsAccountantSubSampledRenyiEpsilon(unsigned int a1, double a2, double a3)
{
  if (a2 >= 1.0e-14 && vabdd_f64(1.0, a2) >= 1.0e-14)
  {
    double v6 = 1.0 - a2;
    long double v7 = (double *)malloc_type_calloc(a1 - 1, 8uLL, 0x100004000313F17uLL);
    long double v8 = v7;
    double v9 = (double)a1;
    double v10 = ((double)a1 + -1.0) * (double)a1 * 0.5;
    *long double v7 = v10;
    if (a1 >= 3)
    {
      uint64_t v11 = 0;
      double v12 = 3.0;
      do
      {
        double v10 = v10 * (v9 + 1.0 - v12) / v12;
        v7[v11 + 1] = v10;
        double v12 = (double)(unint64_t)(v11 + 4);
        ++v11;
      }
      while (v12 <= v9);
    }
    double v13 = a2 / v6;
    double v14 = log(a2 / v6);
    double v15 = log(v9 * v13 + 1.0);
    if (a1 >= 2)
    {
      uint64_t v16 = 0;
      double v17 = 1.0 / ((a3 + a3) * a3);
      uint64_t v18 = a1 - 1;
      do
      {
        uint64_t v19 = v16 + 1;
        long double v20 = log(v8[v16])
            + (double)(unint64_t)((v16 + 1) * (v16 + 2)) * v17
            + (double)(unint64_t)(v16 + 2) * v14;
        long double v21 = exp(v15 - v20);
        double v15 = v20 + log(v21 + 1.0);
        uint64_t v16 = v19;
      }
      while (v18 != v19);
    }
    free(v8);
    log(v6);
  }
}

double _DPBinomialCoef(double *a1, double result)
{
  double v2 = (result + -1.0) * result * 0.5;
  *a1 = v2;
  double v3 = 3.0;
  if (result >= 3.0)
  {
    uint64_t v4 = 0;
    do
    {
      double v2 = (result + 1.0 - v3) * v2 / v3;
      a1[v4 + 1] = v2;
      double v3 = (double)(unint64_t)(v4 + 4);
      ++v4;
    }
    while (v3 <= result);
  }
  return result;
}

void sub_1DC569CAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC56A078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
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

void sub_1DC56AA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E019FA60](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{
}

void sub_1DC56AFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC56D638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1DC56E2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1DC56E4D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void reportCoreAnalyticsUploadEvent(void *a1, uint64_t a2, double a3)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  double v6 = [MEMORY[0x1E4F28F80] processInfo];
  [v6 systemUptime];
  double v8 = v7;

  double v9 = (void *)MEMORY[0x1E4F1CA60];
  v19[0] = @"connectionType";
  double v10 = [NSNumber numberWithUnsignedInteger:a2];
  v20[0] = v10;
  v19[1] = @"duration";
  uint64_t v11 = [NSNumber numberWithDouble:v8 - a3];
  v20[1] = v11;
  v19[2] = @"success";
  double v12 = [NSNumber numberWithBool:v5 == 0];
  v20[2] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  double v14 = [v9 dictionaryWithDictionary:v13];

  if (v5)
  {
    uint64_t v15 = NSString;
    uint64_t v16 = [v5 domain];
    uint64_t v17 = [v15 stringWithFormat:@"%@_%ld", v16, objc_msgSend(v5, "code")];
    [v14 setObject:v17 forKeyedSubscript:@"domainCode"];
  }
  uint64_t v18 = +[_DPCoreAnalyticsCollector sharedInstance];
  [v18 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.DediscoUpload" withMetrics:v14];
}

float *accumulate(float *result, float *a2, uint64_t a3)
{
  for (; a3; --a3)
  {
    float v3 = *a2++;
    *uint64_t result = v3 + *result;
    ++result;
  }
  return result;
}

void *prio_memory_alloc(uint64_t a1)
{
  unint64_t PowerOfTwo = nextPowerOfTwo(a1 + 1);
  size_t v2 = 2 * PowerOfTwo;
  if (2 * PowerOfTwo > 0x100000) {
    return 0;
  }
  size_t v4 = PowerOfTwo;
  float v3 = malloc_type_malloc(0x30uLL, 0x300407BB6DF5BuLL);
  *float v3 = malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  v3[1] = malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
  v3[2] = malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
  v3[3] = malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  v3[4] = malloc_type_calloc(v2, 4uLL, 0x100004052888210uLL);
  v3[5] = poly_memory_alloc(v2);
  return v3;
}

void prio_memory_free(void *a1)
{
  if (a1)
  {
    free(*(void **)a1);
    free(*((void **)a1 + 1));
    free(*((void **)a1 + 2));
    free(*((void **)a1 + 3));
    free(*((void **)a1 + 4));
    poly_memory_free(*((void ***)a1 + 5));
  }
  free(a1);
}

unsigned int *share_array_prng(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  for (; a3; --a3)
  {
    unsigned int v3 = *a2++;
    unsigned int v4 = *result - v3;
    if (*result < v3) {
      v4 -= 0xFFFFF;
    }
    *result++ = v4;
  }
  return result;
}

unint64_t prio_share_length(uint64_t a1)
{
  return a1 + nextPowerOfTwo(a1 + 1) + 3;
}

BOOL prio_encode(uint64_t a1, int *a2, uint64_t a3, void *a4)
{
  unint64_t v8 = a1 + 1;
  unint64_t v9 = a1 + nextPowerOfTwo(a1 + 1) + 3;
  if (v9 == a3)
  {
    double v10 = (uint32_t *)&a2[a1];
    unint64_t PowerOfTwo = nextPowerOfTwo(v8);
    uint64_t v13 = (uint32_t *)a4[1];
    double v12 = (uint32_t *)a4[2];
    uint64_t v33 = (int *)a4[3];
    uint64_t v34 = 2 * PowerOfTwo;
    unint64_t v31 = PowerOfTwo;
    unint64_t v32 = (int *)a4[4];
    *uint64_t v13 = arc4random_uniform(0xFFF00001);
    *double v12 = arc4random_uniform(0xFFF00001);
    uint32_t v14 = *v13;
    *double v10 = *v13;
    unint64_t v15 = *v12 * (unint64_t)v14;
    v10[1] = *v12;
    void v10[2] = v15 % 0xFFF00001;
    if (a1)
    {
      uint64_t v16 = 2;
      if (v8 > 2) {
        uint64_t v16 = v8;
      }
      uint64_t v17 = v16 - 1;
      uint64_t v18 = (int *)(v12 + 1);
      uint64_t v19 = v13 + 1;
      do
      {
        int v20 = *a2++;
        *v19++ = v20;
        int v21 = v20 - 1;
        if (v20) {
          int v22 = v21;
        }
        else {
          int v22 = -1048576;
        }
        *v18++ = v22;
        --v17;
      }
      while (v17);
    }
    poly_interpolate_eval_2N(v31 & 0x7FFFFFFFFFFFFFFFLL, v13, v33, (uint64_t)a4);
    poly_interpolate_eval_2N(v31 & 0x7FFFFFFFFFFFFFFFLL, v12, v32, (uint64_t)a4);
    if (v34)
    {
      int v23 = v10 + 3;
      uint64_t v24 = (unsigned int *)(v32 + 1);
      uint64_t v25 = (unsigned int *)(v33 + 1);
      unint64_t v26 = ((unint64_t)(v34 - 2) >> 1) + 1;
      do
      {
        unsigned int v28 = *v25;
        v25 += 2;
        unsigned int v27 = v28;
        unsigned int v29 = *v24;
        v24 += 2;
        *v23++ = v29 * (unint64_t)v27 % 0xFFF00001;
        --v26;
      }
      while (v26);
    }
  }
  return v9 == a3;
}

BOOL poly_interpolate_eval_2N(unint64_t a1, _DWORD *a2, int *a3, uint64_t a4)
{
  double v7 = *(int **)a4;
  poly_fft(*(int **)a4, a2, *(_DWORD **)(*(void *)(a4 + 40) + 24), a1, 1, (int **)(*(void *)(a4 + 40) + 40));
  unint64_t v8 = *(void **)(a4 + 40);
  uint64_t v11 = (_DWORD *)*v8;
  double v10 = (int **)(v8 + 5);
  unint64_t v9 = v11;
  return poly_fft(a3, v7, v9, 2 * a1, 0, v10);
}

void sub_1DC573140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC573930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1DC5742D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DC574DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5751A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5755C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC576840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DC576A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sampleUniformWithoutReplace<unsigned long,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(void *a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v4 = *a3;
  unint64_t v5 = *a2;
  if (*a3 <= *a2)
  {
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::clear(a1);
    unint64_t v10 = *a2;
    unint64_t v11 = *a2 - *a3;
    unint64_t v16 = v11;
    while (v11 < v10)
    {
      v15[0] = 0;
      v15[1] = v11;
      uint64_t v14 = 0;
      uint64_t v14 = std::uniform_int_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)v15, a4, v15);
      std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)a1, (unint64_t *)&v14, &v14);
      if ((v12 & 1) == 0) {
        std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__emplace_unique_key_args<unsigned long,unsigned long const&>((uint64_t)a1, &v16, &v16);
      }
      unint64_t v11 = ++v16;
      unint64_t v10 = *a2;
    }
  }
  return v4 <= v5;
}

void sub_1DC576C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DC576E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::~__hash_table(uint64_t a1)
{
  size_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unsigned int v3 = (void *)*v2;
      operator delete(v2);
      size_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::clear(void *result)
{
  if (result[3])
  {
    v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        size_t v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t std::uniform_int_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = a3[1];
  uint64_t v4 = result - *a3;
  if (result != *a3)
  {
    unint64_t v5 = v4 + 1;
    if (v4 == -1)
    {
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, 0x40uLL);
      return std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
    }
    else
    {
      unint64_t v7 = __clz(v5);
      uint64_t v8 = 63;
      if (((v5 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        uint64_t v8 = 64;
      }
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, v8 - v7);
      do
        unint64_t v9 = std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
      while (v9 >= v5);
      return *a3 + v9;
    }
  }
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine(uint64_t result, uint64_t a2, unint64_t a3)
{
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0) {
    unint64_t v3 = (a3 >> 5) + 1;
  }
  else {
    unint64_t v3 = a3 >> 5;
  }
  unint64_t v4 = a3 / v3;
  *(void *)(result + 16) = a3 / v3;
  *(void *)(result + 24) = v3;
  unint64_t v5 = (-1 << (a3 / v3)) & 0x100000000;
  if (a3 / v3 >= 0x40) {
    unint64_t v5 = 0;
  }
  *(void *)(result + 40) = v5;
  if ((v5 ^ 0x100000000) > v5 / v3)
  {
    ++v3;
    unint64_t v4 = a3 / v3;
    *(void *)(result + 16) = a3 / v3;
    *(void *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      unint64_t v6 = 0;
      *(void *)(result + 32) = v3 + v4 * v3 - a3;
      *(void *)(result + 40) = 0;
      goto LABEL_13;
    }
    *(void *)(result + 40) = (-1 << v4) & 0x100000000;
  }
  *(void *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 > 0x3E) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = 0x80000000uLL >> v4 << (v4 + 1);
  }
LABEL_13:
  *(void *)(result + 48) = v6;
  unsigned int v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4) {
    unsigned int v7 = 0;
  }
  if (v4 >= 0x1F) {
    unsigned int v8 = -1;
  }
  else {
    unsigned int v8 = 0xFFFFFFFF >> ~(_BYTE)v4;
  }
  *(_DWORD *)(result + 56) = v7;
  *(_DWORD *)(result + 60) = v8;
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      do
        std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v4 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
      while (*(void *)(a1 + 40) <= (unint64_t)v4);
      unint64_t v5 = *(void *)(a1 + 16);
      if (v5 >= 0x40) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v2 << v5;
      }
      uint64_t v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      unint64_t v7 = *(void *)(a1 + 32);
    }
    while (v3 < v7);
  }
  else
  {
    uint64_t v2 = 0;
    unint64_t v7 = 0;
  }
  for (; v7 < *(void *)(a1 + 24); ++v7)
  {
    do
      std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v8 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
    while (*(void *)(a1 + 48) <= (unint64_t)v8);
    unint64_t v9 = *(void *)(a1 + 16);
    if (v9 >= 0x3F) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v2 << (v9 + 1);
    }
    uint64_t v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }
  return v2;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i = this->__i_;
  size_t v2 = (i + 1) % 0x270;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return (i << 15) & 0xEFC60000 ^ i ^ (((i << 15) & 0xEFC60000 ^ i) >> 18);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    unint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *unint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          unint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::__erase_unique<unsigned long>(void *a1, unint64_t *a2)
{
  uint64_t result = std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::find<unsigned long>(a1, a2);
  if (result)
  {
    std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::find<unsigned long>(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<unsigned long,std::hash<unsigned long>,std::equal_to<unsigned long>,std::allocator<unsigned long>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *unint64_t v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t std::binomial_distribution<unsigned long>::param_type::param_type(uint64_t a1, unint64_t a2, double a3)
{
  *(void *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  if (a3 > 0.0 && a3 < 1.0)
  {
    *(void *)(a1 + 32) = (unint64_t)((double)(a2 + 1) * a3);
    double v5 = lgamma_r((double)a2 + 1.0, &v14);
    double v6 = v5 - lgamma_r((double)*(unint64_t *)(a1 + 32) + 1.0, &v15);
    double v7 = v6 - lgamma_r((double)(unint64_t)(*(void *)a1 - *(void *)(a1 + 32)) + 1.0, &v16);
    unint64_t v8 = *(void *)(a1 + 32);
    long double v9 = *(double *)(a1 + 8);
    long double v10 = v7 + (double)v8 * log(v9);
    double v11 = (double)(*(void *)a1 - v8);
    long double v12 = log(1.0 - v9);
    *(long double *)(a1 + 16) = exp(v10 + v11 * v12);
    *(long double *)(a1 + 24) = v9 / (1.0 - v9);
  }
  return a1;
}

unint64_t std::binomial_distribution<unsigned long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(int a1, std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this, uint64_t a3)
{
  unint64_t result = *(void *)a3;
  if (*(void *)a3)
  {
    double v5 = *(double *)(a3 + 8);
    if (v5 == 0.0)
    {
      return 0;
    }
    else if (v5 != 1.0)
    {
      double v7 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
      std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v8 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(this);
      double v9 = *(double *)(a3 + 16);
      double v10 = (v7 + (double)v8 * 4294967300.0) * 5.42101086e-20 + 0.0 - v9;
      unint64_t v11 = *(void *)(a3 + 32);
      if (v10 >= 0.0)
      {
        double v12 = *(double *)(a3 + 24);
        unint64_t v13 = *(void *)a3;
        double v14 = *(double *)(a3 + 16);
        uint64_t v15 = *(void *)(a3 + 32);
        while (2)
        {
          uint64_t v16 = 0;
          uint64_t v17 = 0;
          uint64_t v18 = v15;
          while (1)
          {
            uint64_t v19 = v17;
            if (v15 == v17) {
              break;
            }
            double v14 = v14
                * ((double)(unint64_t)(v15 + v16)
                 / (v12
                  * (double)(unint64_t)(*(void *)a3 + 1 - v15 + v17)));
            double v10 = v10 - v14;
            if (v10 < 0.0) {
              return ~v17 + v15;
            }
            ++v17;
            unint64_t result = v11 + v19 + 1;
            --v16;
            --v18;
            if (result <= v13)
            {
              v15 += v16;
              goto LABEL_15;
            }
          }
          unint64_t result = v11 + v17 + 1;
          if (result > v13) {
            return 0;
          }
          uint64_t v15 = v15 - (v18 != 0) - v17;
LABEL_15:
          double v9 = v9 * (v12 * (double)(v13 - v11 - v19) / (double)result);
          double v10 = v10 - v9;
          unint64_t v11 = result;
          if (v10 >= 0.0) {
            continue;
          }
          break;
        }
      }
      else
      {
        return *(void *)(a3 + 32);
      }
    }
  }
  return result;
}

void sub_1DC579674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1DC57C6F8(_Unwind_Exception *a1)
{
}

void sub_1DC57CF5C(_Unwind_Exception *a1)
{
}

void sub_1DC57DEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t set_bit(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(a2 + ((unint64_t)result >> 3)) ^= 1 << (result & 7);
  return result;
}

uint64_t uint32_from_string(unsigned int a1, const char *a2, unsigned int a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int data = bswap32(a1);
  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_SHA256_Update(&v7, &data, 4u);
  CC_LONG v5 = strlen(a2);
  CC_SHA256_Update(&v7, a2, v5);
  CC_SHA256_Final(md, &v7);
  return *(_DWORD *)md % a3;
}

unint64_t expmod(unsigned int a1, unsigned int a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v2 = a1;
  unint64_t result = 1;
  do
  {
    if ((a2 & 1) == 0)
    {
      do
      {
        char v4 = a2;
        a2 >>= 1;
        unint64_t v2 = v2 * v2 % 0xFFF00001;
      }
      while ((v4 & 2) == 0);
    }
    unint64_t result = result * v2 % 0xFFF00001;
    --a2;
  }
  while (a2);
  return result;
}

uint64_t invmod(unsigned int a1)
{
  int v1 = 0;
  int v2 = 0;
  unsigned int v3 = -1048575;
  int v4 = 1;
  do
  {
    unsigned int v5 = v3;
    int v6 = v4;
    int v4 = v2 - v4 * v1;
    int v1 = a1 / v3;
    unsigned int v3 = a1 % v3;
    int v2 = v6;
    a1 = v5;
  }
  while (v3);
  if (v4 >= 0) {
    return v4;
  }
  else {
    return (v4 - 0xFFFFF);
  }
}

_DWORD *pi_rappor_get_coefficients(_DWORD *result, uint64_t a2, unint64_t a3, unsigned int a4)
{
  {
    *result++ = a3 % a4;
    a3 /= a4;
  }
  return result;
}

BOOL pi_rappor_BOOL_func(unsigned int a1, unsigned int a2)
{
  return a1 < a2;
}

uint64_t pi_rappor_inverse_BOOL_func(uint64_t result, int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  if (result) {
    int v5 = 0;
  }
  else {
    int v5 = a2;
  }
  if (result) {
    int v6 = a2;
  }
  else {
    int v6 = a3;
  }
  *a4 = v5;
  *a5 = v6;
  return result;
}

void sub_1DC5851F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC58527C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC585328(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5853D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC585480(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC58552C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5855CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC58566C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC58572C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC58589C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC585924(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC585DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1DC585FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DC58635C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1DC5865E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC586798(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC58698C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC594688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __one_time_setup_block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v27 = 0;
  int v4 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v27];
  id v5 = v27;
  if (!v4)
  {
    int v23 = +[_DPLog daemon];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __one_time_setup_block_invoke_cold_7();
    }

    exit(1);
  }
  int v6 = (const char *)[*(id *)(a1 + 32) UTF8String];
  id v7 = +[_DPStrings dataValueStorageClass];
  [v7 UTF8String];
  int v8 = rootless_check_datavault_flag();
  double v9 = +[_DPLog daemon];
  uint64_t v10 = v9;
  if (v8 != 1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __one_time_setup_block_invoke_cold_6(v10);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC55E000, v10, OS_LOG_TYPE_INFO, "Database directory needs conversion to Data Vault", buf, 2u);
  }

  if (chmod(v6, 0x1C0u))
  {
    unint64_t v11 = +[_DPLog daemon];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __one_time_setup_block_invoke_cold_5();
    }
  }
  if (rootless_convert_to_datavault())
  {
    uint64_t v10 = +[_DPLog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __one_time_setup_block_invoke_cold_4();
    }
LABEL_14:
  }
  uint64_t v12 = *(void *)(a1 + 40);
  id v26 = v5;
  int v13 = [v2 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v14 = v26;

  if (v13)
  {
    uint64_t v15 = +[_DPReportFilesMaintainer retiredReportsPath:*(void *)(a1 + 40)];
    id v25 = v14;
    char v16 = [v2 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v17 = v25;

    if (v16) {
      goto LABEL_23;
    }
    uint64_t v18 = +[_DPLog daemon];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __one_time_setup_block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v18 = +[_DPLog daemon];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __one_time_setup_block_invoke_cold_3();
    }
    id v17 = v14;
  }

LABEL_23:
  uint64_t v19 = +[_DPStrings transparencyLogDirectoryPath];
  id v24 = v17;
  char v20 = [v2 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v24];
  id v21 = v24;

  if ((v20 & 1) == 0)
  {
    int v22 = +[_DPLog daemon];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __one_time_setup_block_invoke_cold_1();
    }
  }
}

id _DPVDAFError(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a2;
  int v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a2;
  int v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:@"com.apple.DifferentialPrivacy.DPVDAFError" code:a1 userInfo:v6];

  return v7;
}

void sub_1DC59B4B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DC59B8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1DC59D090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC59D2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC59D4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getLBFEventManagerClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LBFEventManager");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLBFEventManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLBFEventManagerClass_block_invoke_cold_1();
    LighthouseBitacoraFrameworkLibrary();
  }
}

void LighthouseBitacoraFrameworkLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __LighthouseBitacoraFrameworkLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6C447A0;
    uint64_t v3 = 0;
    LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __LighthouseBitacoraFrameworkLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LighthouseBitacoraFrameworkLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getLBFTrialIdentifiersClass_block_invoke(uint64_t a1)
{
  LighthouseBitacoraFrameworkLibrary();
  Class result = objc_getClass("LBFTrialIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLBFTrialIdentifiersClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getLBFTrialIdentifiersClass_block_invoke_cold_1();
    return (Class)__getLBFDprivacydEventClass_block_invoke(v3);
  }
  return result;
}

_DPHCMSSequenceRecord *__getLBFDprivacydEventClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  LighthouseBitacoraFrameworkLibrary();
  Class result = (_DPHCMSSequenceRecord *)objc_getClass("LBFDprivacydEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getLBFDprivacydEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v11 = (_DPHCMSSequenceRecord *)__getLBFDprivacydEventClass_block_invoke_cold_1();
    return [(_DPHCMSSequenceRecord *)v11 initWithKey:v13 plainSequence:v14 sequence:v15 sequenceHashIndex:v16 sequenceBitIndex:v17 creationDate:v19 submitted:v18 objectId:a9];
  }
  return result;
}

uint64_t XXH_versionNumber()
{
  return 702;
}

uint64_t XXH32(int *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v3 = a1;
  if ((a1 & 3) == 0)
  {
    if (a2 >= 0x10)
    {
      *(int32x2_t *)v4.i8 = vadd_s32(vdup_n_s32(a3), (int32x2_t)0x85EBCA7724234428);
      v4.i32[2] = a3;
      v4.i32[3] = a3 + 1640531535;
      int32x4_t v9 = vdupq_n_s32(0x85EBCA77);
      int32x4_t v10 = vdupq_n_s32(0x9E3779B1);
      do
      {
        int32x4_t v11 = *(int32x4_t *)v3;
        v3 += 4;
        int32x4_t v12 = vmlaq_s32(v4, v11, v9);
        int32x4_t v4 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v12, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v12, 0x13uLL)), v10);
      }
      while (v3 < (int *)((char *)a1 + a2 - 15));
      goto LABEL_9;
    }
LABEL_10:
    int v13 = a3 + 374761393;
    return XXH32_finalize(v13 + (int)a2, v3, a2 & 0xF);
  }
  if (a2 < 0x10) {
    goto LABEL_10;
  }
  *(int32x2_t *)v4.i8 = vadd_s32(vdup_n_s32(a3), (int32x2_t)0x85EBCA7724234428);
  v4.i32[2] = a3;
  v4.i32[3] = a3 + 1640531535;
  int32x4_t v5 = vdupq_n_s32(0x85EBCA77);
  int32x4_t v6 = vdupq_n_s32(0x9E3779B1);
  do
  {
    int32x4_t v7 = *(int32x4_t *)v3;
    v3 += 4;
    int32x4_t v8 = vmlaq_s32(v4, v7, v5);
    int32x4_t v4 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v8, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v8, 0x13uLL)), v6);
  }
  while (v3 < (int *)((char *)a1 + a2 - 15));
LABEL_9:
  int v13 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32((uint32x4_t)v4, (uint32x4_t)xmmword_1DC5C6050), (int8x16_t)vshlq_u32((uint32x4_t)v4, (uint32x4_t)xmmword_1DC5C6040)));
  return XXH32_finalize(v13 + (int)a2, v3, a2 & 0xF);
}

void *XXH32_createState()
{
  return malloc_type_malloc(0x30uLL, 0x7DE129A8uLL);
}

uint64_t XXH32_freeState(void *a1)
{
  return 0;
}

__n128 XXH32_copyState(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t XXH32_reset(uint64_t a1, unsigned int a2)
{
  *(void *)a1 = 0;
  *(int32x2_t *)(a1 + 8) = vadd_s32(vdup_n_s32(a2), (int32x2_t)0x85EBCA7724234428);
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = a2 + 1640531535;
  *(_DWORD *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 24) = 0uLL;
  return 0;
}

uint64_t XXH32_update(uint64_t a1, int32x4_t *__src, size_t __n)
{
  if (!__src) {
    return 1;
  }
  int v3 = __n;
  int32x4_t v4 = __src;
  int v6 = *(_DWORD *)(a1 + 4);
  unsigned int v7 = *(_DWORD *)a1 + __n;
  BOOL v9 = __n > 0xF || v7 > 0xF;
  *(_DWORD *)a1 = v7;
  *(_DWORD *)(a1 + 4) = v6 | v9;
  uint64_t v10 = *(unsigned int *)(a1 + 40);
  if (v10 + __n <= 0xF)
  {
    memcpy((void *)(a1 + v10 + 24), __src, __n);
    LODWORD(v11) = *(_DWORD *)(a1 + 40) + v3;
LABEL_19:
    uint64_t result = 0;
    *(_DWORD *)(a1 + 40) = v11;
    return result;
  }
  int v13 = (int32x4_t *)((char *)__src + __n);
  if (v10)
  {
    memcpy((void *)(a1 + 24 + v10), __src, (16 - v10));
    int32x4_t v14 = vmlaq_s32(*(int32x4_t *)(a1 + 8), *(int32x4_t *)(a1 + 24), vdupq_n_s32(0x85EBCA77));
    *(int32x4_t *)(a1 + 8) = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v14, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v14, 0x13uLL)), vdupq_n_s32(0x9E3779B1));
    int32x4_t v4 = (int32x4_t *)((char *)v4 + (16 - *(_DWORD *)(a1 + 40)));
    *(_DWORD *)(a1 + 40) = 0;
  }
  if (v4 <= &v13[-1])
  {
    int32x4_t v15 = *(int32x4_t *)(a1 + 8);
    int32x4_t v16 = vdupq_n_s32(0x85EBCA77);
    int32x4_t v17 = vdupq_n_s32(0x9E3779B1);
    do
    {
      int32x4_t v18 = *v4++;
      int32x4_t v19 = vmlaq_s32(v15, v18, v16);
      int32x4_t v15 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v19, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v19, 0x13uLL)), v17);
    }
    while (v4 <= &v13[-1]);
    *(int32x4_t *)(a1 + 8) = v15;
  }
  if (v4 < v13)
  {
    size_t v11 = (char *)v13 - (char *)v4;
    memcpy((void *)(a1 + 24), v4, v11);
    goto LABEL_19;
  }
  return 0;
}

uint64_t XXH32_digest(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 4)) {
    int v1 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1DC5C6050), (int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1DC5C6040)));
  }
  else {
    int v1 = *(_DWORD *)(a1 + 16) + 374761393;
  }
  return XXH32_finalize(*(_DWORD *)a1 + v1, (int *)(a1 + 24), *(_DWORD *)(a1 + 40));
}

uint64_t XXH32_finalize(unsigned int a1, int *a2, char a3)
{
  unint64_t v3 = a3 & 0xF;
  if (v3 >= 4)
  {
    do
    {
      int v4 = *a2++;
      HIDWORD(v5) = a1 - 1028477379 * v4;
      LODWORD(v5) = HIDWORD(v5);
      a1 = 668265263 * (v5 >> 15);
      v3 -= 4;
    }
    while (v3 > 3);
  }
  for (; v3; --v3)
  {
    int v6 = *(unsigned __int8 *)a2;
    a2 = (int *)((char *)a2 + 1);
    HIDWORD(v7) = a1 + 374761393 * v6;
    LODWORD(v7) = HIDWORD(v7);
    a1 = -1640531535 * (v7 >> 21);
  }
  unsigned int v8 = -1028477379 * ((-2048144777 * (a1 ^ (a1 >> 15))) ^ ((-2048144777 * (a1 ^ (a1 >> 15))) >> 13));
  return v8 ^ HIWORD(v8);
}

_DWORD *XXH32_canonicalFromHash(_DWORD *result, unsigned int a2)
{
  *uint64_t result = bswap32(a2);
  return result;
}

uint64_t XXH32_hashFromCanonical(unsigned int *a1)
{
  return bswap32(*a1);
}

unint64_t XXH64(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  int v4 = a1;
  if ((a1 & 7) == 0)
  {
    if (a2 >= 0x20)
    {
      unint64_t v13 = (unint64_t)a1 + a2 - 32;
      unint64_t v6 = a3 + 0x60EA27EEADC0B5D6;
      unint64_t v7 = a3 - 0x3D4D51C2D82B14B1;
      unint64_t v8 = a3 + 0x61C8864E7A143579;
      do
      {
        uint64_t v9 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * *v4, 33);
        unint64_t v6 = 0x9E3779B185EBCA87 * v9;
        uint64_t v10 = __ROR8__(v7 - 0x3D4D51C2D82B14B1 * v4[1], 33);
        unint64_t v7 = 0x9E3779B185EBCA87 * v10;
        uint64_t v11 = __ROR8__(a3 - 0x3D4D51C2D82B14B1 * v4[2], 33);
        a3 = 0x9E3779B185EBCA87 * v11;
        uint64_t v12 = __ROR8__(v8 - 0x3D4D51C2D82B14B1 * v4[3], 33);
        unint64_t v8 = 0x9E3779B185EBCA87 * v12;
        v4 += 4;
      }
      while ((unint64_t)v4 <= v13);
      goto LABEL_9;
    }
LABEL_10:
    unint64_t v14 = a3 + 0x27D4EB2F165667C5;
    return XXH64_finalize(v14 + a2, v4, a2);
  }
  if (a2 < 0x20) {
    goto LABEL_10;
  }
  unint64_t v5 = (unint64_t)a1 + a2 - 32;
  unint64_t v6 = a3 + 0x60EA27EEADC0B5D6;
  unint64_t v7 = a3 - 0x3D4D51C2D82B14B1;
  unint64_t v8 = a3 + 0x61C8864E7A143579;
  do
  {
    uint64_t v9 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * *v4, 33);
    unint64_t v6 = 0x9E3779B185EBCA87 * v9;
    uint64_t v10 = __ROR8__(v7 - 0x3D4D51C2D82B14B1 * v4[1], 33);
    unint64_t v7 = 0x9E3779B185EBCA87 * v10;
    uint64_t v11 = __ROR8__(a3 - 0x3D4D51C2D82B14B1 * v4[2], 33);
    a3 = 0x9E3779B185EBCA87 * v11;
    uint64_t v12 = __ROR8__(v8 - 0x3D4D51C2D82B14B1 * v4[3], 33);
    unint64_t v8 = 0x9E3779B185EBCA87 * v12;
    v4 += 4;
  }
  while ((unint64_t)v4 <= v5);
LABEL_9:
  unint64_t v14 = 0x9E3779B185EBCA87
      * ((0x9E3779B185EBCA87
        * ((0x9E3779B185EBCA87
          * ((0x9E3779B185EBCA87
            * ((__ROR8__(v7, 57) + __ROR8__(v6, 63) + __ROR8__(a3, 52) + __ROR8__(v8, 46)) ^ (0x9E3779B185EBCA87
                                                                                            * __ROR8__(0xDEF35B010F796CA9* v9, 33)))- 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v10, 33)))- 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v11, 33)))- 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xDEF35B010F796CA9 * v12, 33)))- 0x7A1435883D4D519DLL;
  return XXH64_finalize(v14 + a2, v4, a2);
}

void *XXH64_createState()
{
  return malloc_type_malloc(0x58uLL, 0x7DE129A8uLL);
}

uint64_t XXH64_freeState(void *a1)
{
  return 0;
}

__n128 XXH64_copyState(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t XXH64_reset(uint64_t a1, unint64_t a2)
{
  *(void *)a1 = 0;
  *(int64x2_t *)(a1 + 8) = vaddq_s64(vdupq_n_s64(a2), (int64x2_t)xmmword_1DC5C6060);
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a2 + 0x61C8864E7A143579;
  *(_OWORD *)(a1 + 40) = v3;
  *(_OWORD *)(a1 + 56) = v4;
  *(void *)(a1 + 72) = 0;
  return 0;
}

uint64_t XXH64_update(uint64_t a1, char *__src, size_t __n)
{
  if (!__src) {
    return 1;
  }
  int v3 = __n;
  long long v4 = __src;
  *(void *)a1 += __n;
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  if (v6 + __n <= 0x1F)
  {
    memcpy((void *)(a1 + v6 + 40), __src, __n);
    LODWORD(v7) = *(_DWORD *)(a1 + 72) + v3;
LABEL_13:
    uint64_t result = 0;
    *(_DWORD *)(a1 + 72) = v7;
    return result;
  }
  uint64_t v9 = &__src[__n];
  if (v6)
  {
    memcpy((void *)(a1 + 40 + v6), __src, (32 - v6));
    uint64_t v10 = __ROR8__(*(void *)(a1 + 16) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 48), 33);
    *(void *)(a1 + 8) = 0x9E3779B185EBCA87
                        * __ROR8__(*(void *)(a1 + 8) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 40), 33);
    *(void *)(a1 + 16) = 0x9E3779B185EBCA87 * v10;
    unint64_t v11 = 0x9E3779B185EBCA87 * __ROR8__(*(void *)(a1 + 32) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 64), 33);
    *(void *)(a1 + 24) = 0x9E3779B185EBCA87
                         * __ROR8__(*(void *)(a1 + 24) - 0x3D4D51C2D82B14B1 * *(void *)(a1 + 56), 33);
    *(void *)(a1 + 32) = v11;
    v4 += (32 - *(_DWORD *)(a1 + 72));
    *(_DWORD *)(a1 + 72) = 0;
  }
  if (v4 + 32 <= v9)
  {
    unint64_t v12 = *(void *)(a1 + 8);
    unint64_t v13 = *(void *)(a1 + 16);
    unint64_t v15 = *(void *)(a1 + 24);
    unint64_t v14 = *(void *)(a1 + 32);
    do
    {
      unint64_t v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *(void *)v4, 33);
      unint64_t v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 1), 33);
      unint64_t v15 = 0x9E3779B185EBCA87 * __ROR8__(v15 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 2), 33);
      unint64_t v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 3), 33);
      v4 += 32;
    }
    while (v4 <= v9 - 32);
    *(void *)(a1 + 8) = v12;
    *(void *)(a1 + 16) = v13;
    *(void *)(a1 + 24) = v15;
    *(void *)(a1 + 32) = v14;
  }
  if (v4 < v9)
  {
    size_t v7 = v9 - v4;
    memcpy((void *)(a1 + 40), v4, v7);
    goto LABEL_13;
  }
  return 0;
}

unint64_t XXH64_digest(void *a1)
{
  if (*a1 < 0x20uLL) {
    uint64_t v1 = a1[3] + 0x27D4EB2F165667C5;
  }
  else {
    uint64_t v1 = 0x9E3779B185EBCA87
  }
       * ((0x9E3779B185EBCA87
         * ((0x9E3779B185EBCA87
           * ((0x9E3779B185EBCA87
             * ((__ROR8__(a1[2], 57) + __ROR8__(a1[1], 63) + __ROR8__(a1[3], 52) + __ROR8__(a1[4], 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[1], 33)))
             - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[2], 33)))
           - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[3], 33)))
         - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[4], 33)))
       - 0x7A1435883D4D519DLL;
  return XXH64_finalize(v1 + *a1, a1 + 5, *a1);
}

unint64_t XXH64_finalize(unint64_t a1, uint64_t *a2, char a3)
{
  unint64_t v3 = a3 & 0x1F;
  if (v3 >= 8)
  {
    do
    {
      uint64_t v4 = *a2++;
      a1 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v4, 33)) ^ a1, 37);
      v3 -= 8;
    }
    while (v3 > 7);
  }
  if (v3 >= 4)
  {
    unsigned int v5 = *(_DWORD *)a2;
    a2 = (uint64_t *)((char *)a2 + 4);
    a1 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v5) ^ a1, 41);
    v3 -= 4;
  }
  for (; v3; --v3)
  {
    unsigned int v6 = *(unsigned __int8 *)a2;
    a2 = (uint64_t *)((char *)a2 + 1);
    a1 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v6) ^ a1, 53);
  }
  unint64_t v7 = 0x165667B19E3779F9
     * ((0xC2B2AE3D27D4EB4FLL * (a1 ^ (a1 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (a1 ^ (a1 >> 33))) >> 29));
  return v7 ^ HIDWORD(v7);
}

void *XXH64_canonicalFromHash(void *result, unint64_t a2)
{
  *uint64_t result = bswap64(a2);
  return result;
}

unint64_t XXH64_hashFromCanonical(unint64_t *a1)
{
  return bswap64(*a1);
}

unint64_t XXH3_64bits(int8x16_t *a1, unint64_t a2)
{
  if (a2 > 0x10)
  {
    if (a2 <= 0x80)
    {
      unint64_t v3 = 0x9E3779B185EBCA87 * a2;
      if (a2 >= 0x21)
      {
        if (a2 >= 0x41)
        {
          if (a2 >= 0x61)
          {
            int8x16_t v4 = veorq_s8(a1[3], (int8x16_t)xmmword_1DC5C6070);
            uint64_t v5 = ((v4.u64[1] * (unsigned __int128)v4.u64[0]) >> 64) ^ (v4.i64[1] * v4.i64[0]);
            int8x16_t v6 = veorq_s8(*(int8x16_t *)((char *)&a1[-4] + a2), (int8x16_t)xmmword_1DC5C6080);
            v3 += v5 + (((v6.u64[1] * (unsigned __int128)v6.u64[0]) >> 64) ^ (v6.i64[1] * v6.i64[0]));
          }
          int8x16_t v7 = veorq_s8(a1[2], (int8x16_t)xmmword_1DC5C6090);
          uint64_t v8 = ((v7.u64[1] * (unsigned __int128)v7.u64[0]) >> 64) ^ (v7.i64[1] * v7.i64[0]);
          int8x16_t v9 = veorq_s8(*(int8x16_t *)((char *)&a1[-3] + a2), (int8x16_t)xmmword_1DC5C60A0);
          v3 += v8 + (((v9.u64[1] * (unsigned __int128)v9.u64[0]) >> 64) ^ (v9.i64[1] * v9.i64[0]));
        }
        int8x16_t v10 = veorq_s8(a1[1], (int8x16_t)xmmword_1DC5C60B0);
        uint64_t v11 = ((v10.u64[1] * (unsigned __int128)v10.u64[0]) >> 64) ^ (v10.i64[1] * v10.i64[0]);
        int8x16_t v12 = veorq_s8(*(int8x16_t *)((char *)&a1[-2] + a2), (int8x16_t)xmmword_1DC5C60C0);
        v3 += v11 + (((v12.u64[1] * (unsigned __int128)v12.u64[0]) >> 64) ^ (v12.i64[1] * v12.i64[0]));
      }
      int8x16_t v13 = veorq_s8(*a1, (int8x16_t)xmmword_1DC5C60D0);
      uint64_t v14 = v3 + (((v13.u64[1] * (unsigned __int128)v13.u64[0]) >> 64) ^ (v13.i64[1] * v13.i64[0]));
      int8x16_t v15 = veorq_s8(*(int8x16_t *)((char *)&a1[-1] + a2), (int8x16_t)xmmword_1DC5C60E0);
      unint64_t v2 = v14 + (((v15.u64[1] * (unsigned __int128)v15.u64[0]) >> 64) ^ (v15.i64[1] * v15.i64[0]));
      return (0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) >> 32);
    }
    if (a2 > 0xF0) {
      return XXH3_hashLong_64b_defaultSecret((uint64_t)a1, a2);
    }
    else {
      return XXH3_len_129to240_64b((uint64_t)a1, a2, (uint64_t)&kSecret, 0);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      unint64_t v2 = (a1->i64[0] ^ 0xBE4BA423396CFEB8)
         + a2
         + (*(uint64_t *)((char *)&a1->i64[-1] + a2) ^ 0x1CAD21F72C81017CLL)
         + ((((*(uint64_t *)((char *)&a1->i64[-1] + a2) ^ 0x1CAD21F72C81017CuLL)
            * (unsigned __int128)(a1->i64[0] ^ 0xBE4BA423396CFEB8)) >> 64) ^ ((*(uint64_t *)((char *)&a1->i64[-1] + a2) ^ 0x1CAD21F72C81017CLL)
                                                                              * (a1->i64[0] ^ 0xBE4BA423396CFEB8)));
      return (0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) >> 32);
    }
    if (a2 >= 4)
    {
      unint64_t v16 = (a1->u32[0] | ((unint64_t)*(unsigned int *)((char *)&a1->u32[-1] + a2) << 32)) ^ 0xBE4BA423396CFEB8;
      unint64_t v17 = (a2 + 2654435761u * (v16 ^ (v16 >> 51))) ^ ((a2 + 2654435761u * (v16 ^ (v16 >> 51))) >> 47);
      unint64_t v18 = 0xC2B2AE3D27D4EB4FLL;
LABEL_18:
      unint64_t v2 = v17 * v18;
      return (0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 37))) >> 32);
    }
    if (a2)
    {
      unint64_t v17 = ((a2 << 24) | (unint64_t)a1->u8[0] | ((unint64_t)a1->u8[a2 >> 1] << 8) | ((unint64_t)a1->u8[a2 - 1] << 16)) ^ 0x396CFEB8;
      unint64_t v18 = 0x9E3779B185EBCA87;
      goto LABEL_18;
    }
    return 0;
  }
}

unint64_t XXH3_len_129to240_64b(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  int64x2_t v5 = (int64x2_t)(0x9E3779B185EBCA87 * a2);
  int64x2_t v6 = vdupq_n_s64(a4);
  do
  {
    int8x16_t v7 = (const double *)(a1 + v4);
    float64x2x2_t v22 = vld2q_f64(v7);
    uint64_t v8 = (const double *)(a3 + v4);
    float64x2x2_t v23 = vld2q_f64(v8);
    int8x16_t v9 = veorq_s8((int8x16_t)vaddq_s64((int64x2_t)v23.val[0], v6), (int8x16_t)v22.val[0]);
    v22.val[0] = (float64x2_t)veorq_s8((int8x16_t)vsubq_s64((int64x2_t)v23.val[1], v6), (int8x16_t)v22.val[1]);
    *(void *)&v22.val[1].f64[0] = ((*(unint64_t *)&v22.val[0].f64[0] * (unsigned __int128)v9.u64[0]) >> 64) ^ (*(void *)&v22.val[0].f64[0] * v9.i64[0]);
    *(void *)&v22.val[1].f64[1] = ((*(unint64_t *)&v22.val[0].f64[1] * (unsigned __int128)v9.u64[1]) >> 64) ^ (*(void *)&v22.val[0].f64[1] * v9.i64[1]);
    int64x2_t v5 = vaddq_s64(v5, (int64x2_t)v22.val[1]);
    v4 += 32;
  }
  while (v4 != 128);
  unint64_t v10 = vaddvq_s64(v5);
  unint64_t v11 = (0x165667B19E3779F9 * (v10 ^ (v10 >> 37))) ^ ((0x165667B19E3779F9 * (v10 ^ (v10 >> 37))) >> 32);
  if (a2 >= 0x90)
  {
    int8x16_t v12 = (uint64_t *)(a3 + 11);
    int8x16_t v13 = (void *)(a1 + 136);
    uint64_t v14 = (a2 >> 4) - 8;
    do
    {
      unint64_t v15 = (*(v12 - 1) + a4) ^ *(v13 - 1);
      uint64_t v16 = *v12;
      v12 += 2;
      v11 += ((((v16 - a4) ^ *v13) * (unsigned __int128)v15) >> 64) ^ (((v16 - a4) ^ *v13) * v15);
      v13 += 2;
      --v14;
    }
    while (v14);
  }
  unint64_t v17 = (*(void *)(a3 + 119) + a4) ^ *(void *)(a1 + a2 - 16);
  unint64_t v18 = (*(void *)(a3 + 127) - a4) ^ *(void *)(a1 + a2 - 8);
  uint64_t v19 = ((v18 * (unsigned __int128)v17) >> 64) ^ (v18 * v17);
  unint64_t v20 = 0x165667B19E3779F9 * ((v11 + v19) ^ ((v11 + v19) >> 37));
  return v20 ^ HIDWORD(v20);
}

unint64_t XXH3_hashLong_64b_defaultSecret(uint64_t a1, unint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v26[0] = (int8x16_t)xmmword_1DC5C6200;
  v26[1] = (int8x16_t)unk_1DC5C6210;
  v26[2] = (int8x16_t)xmmword_1DC5C6220;
  v26[3] = (int8x16_t)unk_1DC5C6230;
  if (a2 >= 0x400)
  {
    uint64_t v2 = 0;
    uint32x2_t v3 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    uint64_t v4 = a1;
    do
    {
      uint64_t v5 = 0;
      uint64_t v6 = v4;
      int8x16_t v7 = (char *)&kSecret;
      do
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          int64x2_t v9 = *(int64x2_t *)(v6 + i * 16);
          int64x2_t v10 = (int64x2_t)veorq_s8(*(int8x16_t *)&v7[i * 16], (int8x16_t)v9);
          v26[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v26[i], v9), (uint32x2_t)vmovn_s64(v10), (uint32x2_t)vshrn_n_s64(v10, 0x20uLL));
        }
        ++v5;
        v7 += 8;
        v6 += 64;
      }
      while (v5 != 16);
      for (uint64_t j = 0; j != 4; ++j)
      {
        int8x16_t v12 = v26[j];
        int8x16_t v13 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v12, 0x2FuLL), v12);
        uint64_t v14 = (const float *)((char *)&kSecret + j * 16 + 128);
        float32x2x2_t v28 = vld2_f32(v14);
        v26[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v28.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v12.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL))), v3), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v28.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v13.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL))), v3);
      }
      ++v2;
      v4 += 1024;
    }
    while (v2 != a2 >> 10);
  }
  uint64_t v15 = (a2 >> 6) & 0xF;
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
    unint64_t v18 = (char *)&kSecret;
    do
    {
      for (uint64_t k = 0; k != 4; ++k)
      {
        int64x2_t v20 = *(int64x2_t *)(v17 + k * 16);
        int64x2_t v21 = (int64x2_t)veorq_s8(*(int8x16_t *)&v18[k * 16], (int8x16_t)v20);
        v26[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v26[k], v20), (uint32x2_t)vmovn_s64(v21), (uint32x2_t)vshrn_n_s64(v21, 0x20uLL));
      }
      ++v16;
      v18 += 8;
      v17 += 64;
    }
    while (v16 != v15);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (uint64_t m = 0; m != 4; ++m)
    {
      int64x2_t v23 = *(int64x2_t *)(a1 + a2 - 64 + m * 16);
      int64x2_t v24 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&kSecret + m * 16 + 121), (int8x16_t)v23);
      v26[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v26[m], v23), (uint32x2_t)vmovn_s64(v24), (uint32x2_t)vshrn_n_s64(v24, 0x20uLL));
    }
  }
  return XXH3_mergeAccs(v26, xmmword_1DC5C614B, 0x9E3779B185EBCA87 * a2);
}

unint64_t XXH3_64bits_withSecret(int8x16_t *a1, unint64_t a2, int8x16_t *a3, uint64_t a4)
{
  if (a2 > 0x10)
  {
    if (a2 <= 0x80)
    {
      unint64_t v6 = 0x9E3779B185EBCA87 * a2;
      if (a2 >= 0x21)
      {
        if (a2 >= 0x41)
        {
          if (a2 >= 0x61)
          {
            int8x16_t v7 = veorq_s8(a3[6], a1[3]);
            uint64_t v8 = ((v7.u64[1] * (unsigned __int128)v7.u64[0]) >> 64) ^ (v7.i64[1] * v7.i64[0]);
            int8x16_t v9 = veorq_s8(a3[7], *(int8x16_t *)((char *)&a1[-4] + a2));
            v6 += v8 + (((v9.u64[1] * (unsigned __int128)v9.u64[0]) >> 64) ^ (v9.i64[1] * v9.i64[0]));
          }
          int8x16_t v10 = veorq_s8(a3[4], a1[2]);
          uint64_t v11 = ((v10.u64[1] * (unsigned __int128)v10.u64[0]) >> 64) ^ (v10.i64[1] * v10.i64[0]);
          int8x16_t v12 = veorq_s8(a3[5], *(int8x16_t *)((char *)&a1[-3] + a2));
          v6 += v11 + (((v12.u64[1] * (unsigned __int128)v12.u64[0]) >> 64) ^ (v12.i64[1] * v12.i64[0]));
        }
        int8x16_t v13 = veorq_s8(a3[2], a1[1]);
        uint64_t v14 = ((v13.u64[1] * (unsigned __int128)v13.u64[0]) >> 64) ^ (v13.i64[1] * v13.i64[0]);
        int8x16_t v15 = veorq_s8(a3[3], *(int8x16_t *)((char *)&a1[-2] + a2));
        v6 += v14 + (((v15.u64[1] * (unsigned __int128)v15.u64[0]) >> 64) ^ (v15.i64[1] * v15.i64[0]));
      }
      int8x16_t v16 = veorq_s8(*a3, *a1);
      uint64_t v17 = v6 + (((v16.u64[1] * (unsigned __int128)v16.u64[0]) >> 64) ^ (v16.i64[1] * v16.i64[0]));
      int8x16_t v18 = veorq_s8(a3[1], *(int8x16_t *)((char *)&a1[-1] + a2));
      unint64_t v5 = v17 + (((v18.u64[1] * (unsigned __int128)v18.u64[0]) >> 64) ^ (v18.i64[1] * v18.i64[0]));
      return (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
    }
    if (a2 > 0xF0) {
      return XXH3_hashLong_64b_withSecret((uint64_t)a1, a2, (uint64_t)a3, a4);
    }
    else {
      return XXH3_len_129to240_64b((uint64_t)a1, a2, (uint64_t)a3, 0);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      uint64_t v4 = a3->i64[1] ^ *(uint64_t *)((char *)&a1->i64[-1] + a2);
      unint64_t v5 = (a3->i64[0] ^ a1->i64[0])
         + a2
         + v4
         + ((((unint64_t)v4 * (unsigned __int128)(unint64_t)(a3->i64[0] ^ a1->i64[0])) >> 64) ^ (v4 * (a3->i64[0] ^ a1->i64[0])));
      return (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
    }
    if (a2 >= 4)
    {
      unint64_t v19 = (a1->u32[0] | ((unint64_t)*(unsigned int *)((char *)&a1->u32[-1] + a2) << 32)) ^ a3->i64[0];
      unint64_t v20 = (a2 + 2654435761u * (v19 ^ (v19 >> 51))) ^ ((a2 + 2654435761u * (v19 ^ (v19 >> 51))) >> 47);
      unint64_t v21 = 0xC2B2AE3D27D4EB4FLL;
LABEL_18:
      unint64_t v5 = v20 * v21;
      return (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
    }
    if (a2)
    {
      unint64_t v20 = ((a2 << 24) | (unint64_t)a1->u8[0] | ((unint64_t)a1->u8[a2 >> 1] << 8) | ((unint64_t)a1->u8[a2 - 1] << 16)) ^ a3->u32[0];
      unint64_t v21 = 0x9E3779B185EBCA87;
      goto LABEL_18;
    }
    return 0;
  }
}

unint64_t XXH3_hashLong_64b_withSecret(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v35[0] = (int8x16_t)xmmword_1DC5C6200;
  v35[1] = (int8x16_t)unk_1DC5C6210;
  v35[2] = (int8x16_t)xmmword_1DC5C6220;
  v35[3] = (int8x16_t)unk_1DC5C6230;
  unint64_t v4 = (unint64_t)(a4 - 64) >> 3;
  unint64_t v5 = v4 << 6;
  unint64_t v6 = a2 / (v4 << 6);
  if (v4 << 6 <= a2)
  {
    uint64_t v7 = 0;
    if (v4 <= 1) {
      unint64_t v4 = 1;
    }
    if (v6 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v6;
    }
    uint32x2_t v9 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    uint64_t v10 = a1;
    do
    {
      if ((unint64_t)(a4 - 64) >= 8)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v10;
        uint64_t v13 = a3;
        do
        {
          for (uint64_t i = 0; i != 4; ++i)
          {
            int64x2_t v15 = *(int64x2_t *)(v12 + i * 16);
            int64x2_t v16 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + i * 16), (int8x16_t)v15);
            v35[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[i], v15), (uint32x2_t)vmovn_s64(v16), (uint32x2_t)vshrn_n_s64(v16, 0x20uLL));
          }
          ++v11;
          v13 += 8;
          v12 += 64;
        }
        while (v11 != v4);
      }
      for (uint64_t j = 0; j != 4; ++j)
      {
        int8x16_t v18 = v35[j];
        int8x16_t v19 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v18, 0x2FuLL), v18);
        unint64_t v20 = (const float *)(a3 + a4 - 64 + j * 16);
        float32x2x2_t v37 = vld2_f32(v20);
        v35[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v37.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v18.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL))), v9), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v37.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v19.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL))), v9);
      }
      ++v7;
      v10 += v5;
    }
    while (v7 != v8);
  }
  unint64_t v21 = v6 * v5;
  unint64_t v22 = a2 - v21;
  if (a2 - v21 >= 0x40)
  {
    uint64_t v23 = 0;
    uint64_t v24 = a1 + v21;
    unint64_t v25 = v22 >> 6;
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    uint64_t v26 = a3;
    do
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      do
      {
        int64x2_t v29 = *(int64x2_t *)(v24 + (v23 << 6) + 16 * v28);
        int64x2_t v30 = (int64x2_t)veorq_s8(*(int8x16_t *)(v26 + v27 * 16), (int8x16_t)v29);
        v35[v27] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[v27], v29), (uint32x2_t)vmovn_s64(v30), (uint32x2_t)vshrn_n_s64(v30, 0x20uLL));
        ++v28;
        ++v27;
      }
      while (v27 != 4);
      ++v23;
      v26 += 8;
    }
    while (v23 != v25);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (uint64_t k = 0; k != 4; ++k)
    {
      int64x2_t v32 = *(int64x2_t *)(a1 + a2 - 64 + k * 16);
      int64x2_t v33 = (int64x2_t)veorq_s8(*(int8x16_t *)(a3 + a4 - 71 + k * 16), (int8x16_t)v32);
      v35[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[k], v32), (uint32x2_t)vmovn_s64(v33), (uint32x2_t)vshrn_n_s64(v33, 0x20uLL));
    }
  }
  return XXH3_mergeAccs(v35, (int8x16_t *)(a3 + 11), 0x9E3779B185EBCA87 * a2);
}

unint64_t XXH3_64bits_withSeed(void *a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x10)
  {
    if (a2 <= 0x80)
    {
      unint64_t v5 = 0x9E3779B185EBCA87 * a2;
      if (a2 >= 0x21)
      {
        if (a2 >= 0x41)
        {
          if (a2 >= 0x61)
          {
            uint64_t v6 = *(void *)((char *)a1 + a2 - 64) ^ (a3 + 0x3159B4CD4BE0518ALL);
            uint64_t v7 = *(void *)((char *)a1 + a2 - 56) ^ (0x647378D9C97E9FC8 - a3);
            v5 += ((((a1[7] ^ (0x1D4F0BC7C7BBDCF9 - a3)) * (unsigned __int128)(a1[6] ^ (a3 + 0x3F349CE33F76FAA8))) >> 64) ^ ((a1[7] ^ (0x1D4F0BC7C7BBDCF9 - a3)) * (a1[6] ^ (a3 + 0x3F349CE33F76FAA8))))
                + ((((unint64_t)v7 * (unsigned __int128)(unint64_t)v6) >> 64) ^ (v7 * v6));
          }
          uint64_t v8 = *(void *)((char *)a1 + a2 - 48) ^ (a3 + 0x4EF90DA297486471);
          unint64_t v9 = *(void *)((char *)a1 + a2 - 40) ^ (0xD8ACDEA946EF1938 - a3);
          v5 += ((((a1[5] ^ (0xA32E531B8B65D088 - a3)) * (unsigned __int128)(a1[4] ^ (a3 - 0x34FF3C6E44ADD7C4))) >> 64) ^ ((a1[5] ^ (0xA32E531B8B65D088 - a3)) * (a1[4] ^ (a3 - 0x34FF3C6E44ADD7C4))))
              + (((v9 * (unsigned __int128)(unint64_t)v8) >> 64) ^ (v9 * v8));
        }
        uint64_t v10 = *(void *)((char *)a1 + a2 - 32) ^ (a3 - 0x71DBBC088BB9F748);
        uint64_t v11 = *(void *)((char *)a1 + a2 - 24) ^ (0x4C263A81E69035E0 - a3);
        v5 += ((((a1[3] ^ (0x2172FFCC7DD05A82 - a3)) * (unsigned __int128)(a1[2] ^ (a3 + 0x78E5C0CC4EE679CBLL))) >> 64) ^ ((a1[3] ^ (0x2172FFCC7DD05A82 - a3)) * (a1[2] ^ (a3 + 0x78E5C0CC4EE679CBLL))))
            + ((((unint64_t)v11 * (unsigned __int128)(unint64_t)v10) >> 64) ^ (v11 * v10));
      }
      uint64_t v12 = *(void *)((char *)a1 + a2 - 16) ^ (a3 - 0x24686F7C16922B22);
      uint64_t v13 = *(void *)((char *)a1 + a2 - 8) ^ (0x1F67B3B7A4A44072 - a3);
      unint64_t v4 = v5
         + ((((a1[1] ^ (0x1CAD21F72C81017CLL - a3)) * (unsigned __int128)(*a1 ^ (a3 - 0x41B45BDCC6930148))) >> 64) ^ ((a1[1] ^ (0x1CAD21F72C81017CLL - a3)) * (*a1 ^ (a3 - 0x41B45BDCC6930148))))
         + ((((unint64_t)v13 * (unsigned __int128)(unint64_t)v12) >> 64) ^ (v13 * v12));
      return (0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) ^ ((0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) >> 32);
    }
    if (a2 > 0xF0) {
      return XXH3_hashLong_64b_withSeed((uint64_t)a1, a2, a3);
    }
    else {
      return XXH3_len_129to240_64b((uint64_t)a1, a2, (uint64_t)&kSecret, a3);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      uint64_t v3 = *(void *)((char *)a1 + a2 - 8) ^ (0x1CAD21F72C81017CLL - a3);
      unint64_t v4 = (*a1 ^ (a3 - 0x41B45BDCC6930148))
         + a2
         + v3
         + ((((unint64_t)v3 * (unsigned __int128)(*a1 ^ (a3 - 0x41B45BDCC6930148))) >> 64) ^ (v3 * (*a1 ^ (a3 - 0x41B45BDCC6930148))));
      return (0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) ^ ((0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) >> 32);
    }
    if (a2 >= 4)
    {
      unint64_t v14 = (*(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32)) ^ (a3 - 0x41B45BDCC6930148);
      unint64_t v15 = (a2 + 2654435761u * (v14 ^ (v14 >> 51))) ^ ((a2 + 2654435761u * (v14 ^ (v14 >> 51))) >> 47);
      unint64_t v16 = 0xC2B2AE3D27D4EB4FLL;
LABEL_18:
      unint64_t v4 = v15 * v16;
      return (0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) ^ ((0x165667B19E3779F9 * (v4 ^ (v4 >> 37))) >> 32);
    }
    if (a2)
    {
      unint64_t v15 = ((a2 << 24) | (unint64_t)*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | ((unint64_t)*((unsigned __int8 *)a1 + a2 - 1) << 16)) ^ (a3 + 963444408);
      unint64_t v16 = 0x9E3779B185EBCA87;
      goto LABEL_18;
    }
    return 0;
  }
}

unint64_t XXH3_hashLong_64b_withSeed(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    for (uint64_t i = 0; i != 192; i += 16)
    {
      unint64_t v4 = &v30[i];
      uint64_t v5 = *(void *)((char *)&kSecret + i + 8) - a3;
      *unint64_t v4 = *(void *)((char *)&kSecret + i) + a3;
      v4[1] = v5;
    }
    v32[0] = (int8x16_t)xmmword_1DC5C6200;
    v32[1] = (int8x16_t)unk_1DC5C6210;
    v32[2] = (int8x16_t)xmmword_1DC5C6220;
    v32[3] = (int8x16_t)unk_1DC5C6230;
    if (a2 >= 0x400)
    {
      uint64_t v6 = 0;
      uint32x2_t v7 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
      uint64_t v8 = a1;
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = v30;
        uint64_t v11 = v8;
        do
        {
          for (uint64_t j = 0; j != 4; ++j)
          {
            int64x2_t v13 = *(int64x2_t *)(v11 + j * 16);
            int64x2_t v14 = (int64x2_t)veorq_s8(*(int8x16_t *)&v10[j * 16], (int8x16_t)v13);
            v32[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v32[j], v13), (uint32x2_t)vmovn_s64(v14), (uint32x2_t)vshrn_n_s64(v14, 0x20uLL));
          }
          ++v9;
          v10 += 8;
          v11 += 64;
        }
        while (v9 != 16);
        for (uint64_t k = 0; k != 4; ++k)
        {
          int8x16_t v16 = v32[k];
          int8x16_t v17 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v16, 0x2FuLL), v16);
          int8x16_t v18 = (const float *)((char *)&v31[k + 7].i32[1] + 1);
          float32x2x2_t v35 = vld2_f32(v18);
          v32[k] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v35.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v16.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL))), v7), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v35.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL))), v7);
        }
        ++v6;
        v8 += 1024;
      }
      while (v6 != a2 >> 10);
    }
    uint64_t v19 = (a2 >> 6) & 0xF;
    if (v19)
    {
      uint64_t v20 = 0;
      unint64_t v21 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
      unint64_t v22 = v30;
      do
      {
        for (uint64_t m = 0; m != 4; ++m)
        {
          int64x2_t v24 = *(int64x2_t *)(v21 + m * 16);
          int64x2_t v25 = (int64x2_t)veorq_s8(*(int8x16_t *)&v22[m * 16], (int8x16_t)v24);
          v32[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v32[m], v24), (uint32x2_t)vmovn_s64(v25), (uint32x2_t)vshrn_n_s64(v25, 0x20uLL));
        }
        ++v20;
        v22 += 8;
        v21 += 64;
      }
      while (v20 != v19);
    }
    if ((a2 & 0x3F) != 0)
    {
      for (uint64_t n = 0; n != 4; ++n)
      {
        int64x2_t v27 = *(int64x2_t *)(a1 + a2 - 64 + n * 16);
        int64x2_t v28 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&v31[n + 6] + 14), (int8x16_t)v27);
        v32[n] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v32[n], v27), (uint32x2_t)vmovn_s64(v28), (uint32x2_t)vshrn_n_s64(v28, 0x20uLL));
      }
    }
    return XXH3_mergeAccs(v32, v31, 0x9E3779B185EBCA87 * a2);
  }
  else
  {
    return XXH3_hashLong_64b_defaultSecret(a1, a2);
  }
}

void *XXH3_createState()
{
  return malloc_type_malloc(0x240uLL, 0x7DE129A8uLL);
}

uint64_t XXH3_freeState(void *a1)
{
  return 0;
}

void *XXH3_copyState(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x240uLL);
}

uint64_t XXH3_64bits_reset(_OWORD *a1)
{
  if (!a1) {
    return 1;
  }
  bzero(a1, 0x240uLL);
  uint64_t result = 0;
  *a1 = xmmword_1DC5C60F0;
  a1[1] = xmmword_1DC5C6100;
  *((void *)a1 + 70) = &kSecret;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  a1[2] = xmmword_1DC5C6110;
  a1[3] = xmmword_1DC5C6120;
  *((void *)a1 + 68) = 0;
  return result;
}

BOOL XXH3_64bits_reset_withSecret(_OWORD *a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 1;
  }
  bzero(a1, 0x240uLL);
  *a1 = xmmword_1DC5C60F0;
  a1[1] = xmmword_1DC5C6100;
  a1[2] = xmmword_1DC5C6110;
  a1[3] = xmmword_1DC5C6120;
  *((void *)a1 + 68) = 0;
  *((void *)a1 + 70) = a2;
  *((_DWORD *)a1 + 131) = a3 - 64;
  *((_DWORD *)a1 + 129) = (a3 - 64) >> 3;
  return !a2 || a3 < 0x88;
}

uint64_t XXH3_64bits_reset_withSeed(_OWORD *a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  bzero(a1, 0x240uLL);
  uint64_t v4 = 0;
  *a1 = xmmword_1DC5C60F0;
  a1[1] = xmmword_1DC5C6100;
  a1[2] = xmmword_1DC5C6110;
  a1[3] = xmmword_1DC5C6120;
  *((void *)a1 + 68) = a2;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  do
  {
    uint64_t v5 = &a1[v4];
    *((void *)v5 + 8) = *(void *)((char *)&kSecret + v4 * 16) + a2;
    *((void *)v5 + 9) = *(void *)((char *)&kSecret + v4 * 16 + 8) - a2;
    ++v4;
  }
  while (v4 != 12);
  uint64_t result = 0;
  *((void *)a1 + 70) = a1 + 4;
  return result;
}

uint64_t XXH3_64bits_update(uint64_t a1, char *__src, size_t __n)
{
  if (!__src) {
    return 1;
  }
  int v3 = __n;
  uint64_t v4 = __src;
  *(void *)(a1 + 536) += __n;
  uint64_t v6 = *(unsigned int *)(a1 + 512);
  if (v6 + __n <= 0x100)
  {
    memcpy((void *)(a1 + v6 + 256), __src, __n);
    int v7 = *(_DWORD *)(a1 + 512) + v3;
LABEL_59:
    uint64_t result = 0;
    *(_DWORD *)(a1 + 512) = v7;
    return result;
  }
  uint64_t v9 = &__src[__n];
  if (v6)
  {
    size_t v10 = (256 - v6);
    uint64_t v11 = a1 + 256;
    memcpy((void *)(a1 + 256 + v6), __src, v10);
    v4 += v10;
    int v12 = *(_DWORD *)(a1 + 516);
    uint64_t v13 = *(void *)(a1 + 560);
    int v14 = *(_DWORD *)(a1 + 520);
    unint64_t v15 = (v12 - v14);
    uint64_t v16 = v13 + (8 * v14);
    if (v15 < 5)
    {
      uint64_t v22 = *(unsigned int *)(a1 + 524);
      if (v12 != v14)
      {
        uint64_t v23 = 0;
        if (v15 <= 1) {
          uint64_t v24 = 1;
        }
        else {
          uint64_t v24 = v15;
        }
        uint64_t v25 = a1 + 256;
        do
        {
          for (uint64_t i = 0; i != 64; i += 16)
          {
            int64x2_t v27 = *(int64x2_t *)(v25 + i);
            int64x2_t v28 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + i), (int8x16_t)v27);
            *(uint64x2_t *)(a1 + i) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + i), v27), (uint32x2_t)vmovn_s64(v28), (uint32x2_t)vshrn_n_s64(v28, 0x20uLL));
          }
          ++v23;
          v16 += 8;
          v25 += 64;
        }
        while (v23 != v24);
      }
      uint64_t v29 = 0;
      uint64_t v30 = v13 + v22;
      uint32x2_t v31 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
      do
      {
        int8x16_t v32 = *(int8x16_t *)(a1 + v29);
        int8x16_t v33 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v32, 0x2FuLL), v32);
        uint64_t v34 = (const float *)(v30 + v29);
        float32x2x2_t v71 = vld2_f32(v34);
        *(uint64x2_t *)(a1 + v29) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v71.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v32.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL))), v31), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v71.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v33.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL))), v31);
        v29 += 16;
      }
      while (v29 != 64);
      unint64_t v21 = 4 - v15;
      if (v15 != 4)
      {
        uint64_t v35 = 0;
        uint64_t v36 = v11 + (v15 << 6);
        if (v21 <= 1) {
          uint64_t v37 = 1;
        }
        else {
          uint64_t v37 = v21;
        }
        do
        {
          for (uint64_t j = 0; j != 64; j += 16)
          {
            int64x2_t v39 = *(int64x2_t *)(v36 + j);
            int64x2_t v40 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + j), (int8x16_t)v39);
            *(uint64x2_t *)(a1 + j) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + j), v39), (uint32x2_t)vmovn_s64(v40), (uint32x2_t)vshrn_n_s64(v40, 0x20uLL));
          }
          ++v35;
          v13 += 8;
          v36 += 64;
        }
        while (v35 != v37);
      }
    }
    else
    {
      for (uint64_t k = 0; k != 4; ++k)
      {
        for (uint64_t m = 0; m != 64; m += 16)
        {
          int64x2_t v19 = *(int64x2_t *)(v11 + m);
          int64x2_t v20 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + m), (int8x16_t)v19);
          *(uint64x2_t *)(a1 + m) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + m), v19), (uint32x2_t)vmovn_s64(v20), (uint32x2_t)vshrn_n_s64(v20, 0x20uLL));
        }
        v16 += 8;
        v11 += 64;
      }
      LODWORD(v21) = *(_DWORD *)(a1 + 520) + 4;
    }
    *(_DWORD *)(a1 + 520) = v21;
    *(_DWORD *)(a1 + 512) = 0;
  }
  if (v4 + 256 <= v9)
  {
    LODWORD(v41) = *(_DWORD *)(a1 + 520);
    uint32x2_t v42 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    do
    {
      int v43 = *(_DWORD *)(a1 + 516);
      uint64_t v44 = *(void *)(a1 + 560);
      unint64_t v45 = (v43 - v41);
      uint64_t v46 = v44 + (8 * v41);
      if (v45 < 5)
      {
        uint64_t v52 = *(unsigned int *)(a1 + 524);
        if (v43 != v41)
        {
          uint64_t v53 = 0;
          if (v45 <= 1) {
            uint64_t v54 = 1;
          }
          else {
            uint64_t v54 = v45;
          }
          v55 = v4;
          do
          {
            for (uint64_t n = 0; n != 64; n += 16)
            {
              int64x2_t v57 = *(int64x2_t *)&v55[n];
              int64x2_t v58 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + n), (int8x16_t)v57);
              *(uint64x2_t *)(a1 + n) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + n), v57), (uint32x2_t)vmovn_s64(v58), (uint32x2_t)vshrn_n_s64(v58, 0x20uLL));
            }
            ++v53;
            v46 += 8;
            v55 += 64;
          }
          while (v53 != v54);
        }
        uint64_t v59 = 0;
        uint64_t v60 = v44 + v52;
        do
        {
          int8x16_t v61 = *(int8x16_t *)(a1 + v59);
          int8x16_t v62 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v61, 0x2FuLL), v61);
          v63 = (const float *)(v60 + v59);
          float32x2x2_t v72 = vld2_f32(v63);
          *(uint64x2_t *)(a1 + v59) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v72.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v61.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL))), v42), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v72.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v62.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL))), v42);
          v59 += 16;
        }
        while (v59 != 64);
        unint64_t v41 = 4 - v45;
        if (v45 != 4)
        {
          uint64_t v64 = 0;
          unint64_t v65 = v45 << 6;
          if (v41 <= 1) {
            uint64_t v66 = 1;
          }
          else {
            uint64_t v66 = 4 - v45;
          }
          v67 = &v4[v65];
          do
          {
            for (iuint64_t i = 0; ii != 64; ii += 16)
            {
              int64x2_t v69 = *(int64x2_t *)&v67[ii];
              int64x2_t v70 = (int64x2_t)veorq_s8(*(int8x16_t *)(v44 + ii), (int8x16_t)v69);
              *(uint64x2_t *)(a1 + ii) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + ii), v69), (uint32x2_t)vmovn_s64(v70), (uint32x2_t)vshrn_n_s64(v70, 0x20uLL));
            }
            ++v64;
            v44 += 8;
            v67 += 64;
          }
          while (v64 != v66);
        }
      }
      else
      {
        uint64_t v47 = 0;
        v48 = v4;
        do
        {
          for (juint64_t j = 0; jj != 64; jj += 16)
          {
            int64x2_t v50 = *(int64x2_t *)&v48[jj];
            int64x2_t v51 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + jj), (int8x16_t)v50);
            *(uint64x2_t *)(a1 + jj) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + jj), v50), (uint32x2_t)vmovn_s64(v51), (uint32x2_t)vshrn_n_s64(v51, 0x20uLL));
          }
          ++v47;
          v46 += 8;
          v48 += 64;
        }
        while (v47 != 4);
        LODWORD(v41) = *(_DWORD *)(a1 + 520) + 4;
      }
      *(_DWORD *)(a1 + 520) = v41;
      v4 += 256;
    }
    while (v4 <= v9 - 256);
  }
  if (v4 < v9)
  {
    int v7 = v9 - v4;
    memcpy((void *)(a1 + 256), v4, v9 - v4);
    goto LABEL_59;
  }
  return 0;
}

unint64_t XXH3_64bits_digest(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 536);
  if (v2 < 0xF1)
  {
    unint64_t v19 = *(void *)(a1 + 544);
    int64x2_t v20 = (int8x16_t *)(a1 + 256);
    if (v19)
    {
      return XXH3_64bits_withSeed(v20, v2, v19);
    }
    else
    {
      uint64_t v26 = *(int8x16_t **)(a1 + 560);
      uint64_t v27 = (*(_DWORD *)(a1 + 524) + 64);
      return XXH3_64bits_withSecret(v20, v2, v26, v27);
    }
  }
  else
  {
    int8x16_t v3 = *(int8x16_t *)(a1 + 16);
    v51[0] = *(int8x16_t *)a1;
    v51[1] = v3;
    int8x16_t v4 = *(int8x16_t *)(a1 + 48);
    v51[2] = *(int8x16_t *)(a1 + 32);
    v51[3] = v4;
    size_t v5 = *(unsigned int *)(a1 + 512);
    if (v5 < 0x40)
    {
      if (v5)
      {
        __memcpy_chk();
        memcpy((char *)&v51[4].u64[1] + (64 - v5), (const void *)(a1 + 256), v5);
        uint64_t v22 = 0;
        uint64_t v10 = *(void *)(a1 + 560);
        uint64_t v23 = v10 + *(unsigned int *)(a1 + 524) - 7;
        do
        {
          int64x2_t v24 = *(int64x2_t *)((char *)&v51[v22 + 4] + 8);
          int64x2_t v25 = (int64x2_t)veorq_s8(*(int8x16_t *)(v23 + v22 * 16), (int8x16_t)v24);
          v51[v22] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v51[v22], v24), (uint32x2_t)vmovn_s64(v25), (uint32x2_t)vshrn_n_s64(v25, 0x20uLL));
          ++v22;
        }
        while (v22 != 4);
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 560);
      }
    }
    else
    {
      size_t v6 = v5 >> 6;
      int v7 = *(_DWORD *)(a1 + 520);
      int v8 = *(_DWORD *)(a1 + 516);
      uint64_t v9 = a1 + 256;
      uint64_t v10 = *(void *)(a1 + 560);
      uint64_t v11 = *(unsigned int *)(a1 + 524);
      unint64_t v12 = (v8 - v7);
      uint64_t v13 = v10 + (8 * v7);
      if (v12 <= *(_DWORD *)(a1 + 512) >> 6)
      {
        if (v8 != v7)
        {
          uint64_t v28 = 0;
          if (v12 <= 1) {
            uint64_t v29 = 1;
          }
          else {
            uint64_t v29 = v12;
          }
          uint64_t v30 = a1 + 256;
          do
          {
            for (uint64_t i = 0; i != 4; ++i)
            {
              int64x2_t v32 = *(int64x2_t *)(v30 + i * 16);
              int64x2_t v33 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + i * 16), (int8x16_t)v32);
              v51[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v51[i], v32), (uint32x2_t)vmovn_s64(v33), (uint32x2_t)vshrn_n_s64(v33, 0x20uLL));
            }
            ++v28;
            v13 += 8;
            v30 += 64;
          }
          while (v28 != v29);
        }
        uint64_t v34 = 0;
        uint32x2_t v35 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
        do
        {
          int8x16_t v36 = v51[v34];
          int8x16_t v37 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v36, 0x2FuLL), v36);
          v38 = (const float *)(v10 + v11 + v34 * 16);
          float32x2x2_t v54 = vld2_f32(v38);
          v51[v34++] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v54.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v36.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL))), v35), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v54.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v37.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL))), v35);
        }
        while (v34 != 4);
        if (v6 != v12)
        {
          uint64_t v39 = 0;
          size_t v40 = v6 - v12;
          uint64_t v41 = v10;
          uint64_t v42 = v9 + (v12 << 6);
          do
          {
            for (uint64_t j = 0; j != 4; ++j)
            {
              int64x2_t v44 = *(int64x2_t *)(v42 + j * 16);
              int64x2_t v45 = (int64x2_t)veorq_s8(*(int8x16_t *)(v41 + j * 16), (int8x16_t)v44);
              v51[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v51[j], v44), (uint32x2_t)vmovn_s64(v45), (uint32x2_t)vshrn_n_s64(v45, 0x20uLL));
            }
            ++v39;
            v41 += 8;
            v42 += 64;
          }
          while (v39 != v40);
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = a1 + 256;
        do
        {
          for (uint64_t k = 0; k != 4; ++k)
          {
            int64x2_t v17 = *(int64x2_t *)(v15 + k * 16);
            int64x2_t v18 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + k * 16), (int8x16_t)v17);
            v51[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v51[k], v17), (uint32x2_t)vmovn_s64(v18), (uint32x2_t)vshrn_n_s64(v18, 0x20uLL));
          }
          ++v14;
          v13 += 8;
          v15 += 64;
        }
        while (v14 != v6);
      }
      if ((v5 & 0x3F) != 0)
      {
        uint64_t v46 = 0;
        uint64_t v47 = v9 + v5 - 64;
        uint64_t v48 = v10 + v11 - 7;
        do
        {
          int64x2_t v49 = *(int64x2_t *)(v47 + v46 * 16);
          int64x2_t v50 = (int64x2_t)veorq_s8(*(int8x16_t *)(v48 + v46 * 16), (int8x16_t)v49);
          v51[v46] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v51[v46], v49), (uint32x2_t)vmovn_s64(v50), (uint32x2_t)vshrn_n_s64(v50, 0x20uLL));
          ++v46;
        }
        while (v46 != 4);
      }
    }
    return XXH3_mergeAccs(v51, (int8x16_t *)(v10 + 11), 0x9E3779B185EBCA87 * v2);
  }
}

unint64_t XXH3_mergeAccs(int8x16_t *a1, int8x16_t *a2, uint64_t a3)
{
  int8x16_t v3 = veorq_s8(*a2, *a1);
  uint64_t v4 = v3.i64[1];
  uint64_t v5 = v3.i64[0];
  int8x16_t v6 = veorq_s8(a2[1], a1[1]);
  uint64_t v7 = v6.i64[1];
  uint64_t v8 = v6.i64[0];
  int8x16_t v9 = veorq_s8(a2[2], a1[2]);
  uint64_t v10 = ((((unint64_t)v4 * (unsigned __int128)(unint64_t)v5) >> 64) ^ (v4 * v5))
      + a3
      + ((((unint64_t)v7 * (unsigned __int128)(unint64_t)v8) >> 64) ^ (v7 * v8))
      + (((v9.u64[1] * (unsigned __int128)v9.u64[0]) >> 64) ^ (v9.i64[1] * v9.i64[0]));
  int8x16_t v11 = veorq_s8(a2[3], a1[3]);
  unint64_t v12 = v10 + (((v11.u64[1] * (unsigned __int128)v11.u64[0]) >> 64) ^ (v11.i64[1] * v11.i64[0]));
  return (0x165667B19E3779F9 * (v12 ^ (v12 >> 37))) ^ ((0x165667B19E3779F9 * (v12 ^ (v12 >> 37))) >> 32);
}

unint64_t XXH3_128bits(void *a1, unint64_t a2)
{
  if (a2 > 0x10)
  {
    if (a2 > 0x80)
    {
      if (a2 > 0xF0) {
        return XXH3_hashLong_128b_defaultSecret((uint64_t)a1, a2);
      }
      else {
        return XXH3_len_129to240_128b((uint64_t)a1, a2, (uint64_t)&kSecret, 0);
      }
    }
    else
    {
      unint64_t v4 = 0x9E3779B185EBCA87 * a2;
      if (a2 < 0x21)
      {
        uint64_t v13 = 0;
      }
      else
      {
        if (a2 < 0x41)
        {
          uint64_t v14 = 0;
        }
        else
        {
          if (a2 < 0x61)
          {
            uint64_t v9 = 0;
          }
          else
          {
            uint64_t v5 = a1[6];
            uint64_t v6 = a1[7];
            uint64_t v8 = *(void *)((char *)a1 + a2 - 64);
            uint64_t v7 = *(void *)((char *)a1 + a2 - 56);
            unint64_t v4 = (v4
                + ((((v6 ^ 0x1D4F0BC7C7BBDCF9uLL) * (unsigned __int128)(v5 ^ 0x3F349CE33F76FAA8uLL)) >> 64) ^ ((v6 ^ 0x1D4F0BC7C7BBDCF9) * (v5 ^ 0x3F349CE33F76FAA8)))) ^ (v7 + v8);
            uint64_t v9 = (v6 + v5) ^ (((v7 ^ 0x647378D9C97E9FC8uLL) * (unsigned __int128)(v8 ^ 0x3159B4CD4BE0518AuLL)) >> 64) ^ ((v7 ^ 0x647378D9C97E9FC8) * (v8 ^ 0x3159B4CD4BE0518ALL));
          }
          uint64_t v15 = a1[4];
          uint64_t v16 = a1[5];
          uint64_t v18 = *(void *)((char *)a1 + a2 - 48);
          uint64_t v17 = *(void *)((char *)a1 + a2 - 40);
          unint64_t v4 = (v4
              + ((((v16 ^ 0xA32E531B8B65D088) * (unsigned __int128)(v15 ^ 0xCB00C391BB52283CLL)) >> 64) ^ ((v16 ^ 0xA32E531B8B65D088) * (v15 ^ 0xCB00C391BB52283CLL)))) ^ (v17 + v18);
          uint64_t v14 = (v9
               + ((((v17 ^ 0xD8ACDEA946EF1938) * (unsigned __int128)(v18 ^ 0x4EF90DA297486471uLL)) >> 64) ^ ((v17 ^ 0xD8ACDEA946EF1938) * (v18 ^ 0x4EF90DA297486471)))) ^ (v16 + v15);
        }
        uint64_t v19 = a1[2];
        uint64_t v20 = a1[3];
        uint64_t v22 = *(void *)((char *)a1 + a2 - 32);
        uint64_t v21 = *(void *)((char *)a1 + a2 - 24);
        unint64_t v4 = (v4
            + ((((v20 ^ 0x2172FFCC7DD05A82uLL) * (unsigned __int128)(v19 ^ 0x78E5C0CC4EE679CBuLL)) >> 64) ^ ((v20 ^ 0x2172FFCC7DD05A82) * (v19 ^ 0x78E5C0CC4EE679CBLL)))) ^ (v21 + v22);
        uint64_t v13 = (v14
             + ((((v21 ^ 0x4C263A81E69035E0uLL) * (unsigned __int128)(v22 ^ 0x8E2443F7744608B8)) >> 64) ^ ((v21 ^ 0x4C263A81E69035E0) * (v22 ^ 0x8E2443F7744608B8)))) ^ (v20 + v19);
      }
      uint64_t v23 = a1[1];
      uint64_t v25 = *(void *)((char *)a1 + a2 - 16);
      uint64_t v24 = *(void *)((char *)a1 + a2 - 8);
      uint64_t v26 = (v4
           + ((((v23 ^ 0x1CAD21F72C81017CuLL) * (unsigned __int128)(*a1 ^ 0xBE4BA423396CFEB8)) >> 64) ^ ((v23 ^ 0x1CAD21F72C81017CLL) * (*a1 ^ 0xBE4BA423396CFEB8)))) ^ (v24 + v25);
      uint64_t v27 = (v13
           + ((((v24 ^ 0x1F67B3B7A4A44072uLL) * (unsigned __int128)(v25 ^ 0xDB979083E96DD4DELL)) >> 64) ^ ((v24 ^ 0x1F67B3B7A4A44072) * (v25 ^ 0xDB979083E96DD4DELL)))) ^ (v23 + *a1);
      return (0x165667B19E3779F9 * ((v27 + v26) ^ ((unint64_t)(v27 + v26) >> 37))) ^ ((0x165667B19E3779F9
                                                                                              * ((v27 + v26) ^ ((unint64_t)(v27 + v26) >> 37))) >> 32);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      unint64_t v2 = (0x9E3779B185EBCA87
          * (*a1 ^ 0xBE4BA423396CFEB8 ^ *(void *)((char *)a1 + a2 - 8) ^ 0x1CAD21F72C81017CLL)
          + 374761393 * a2) ^ ((unint64_t)((__PAIR128__(*(void *)((char *)a1 + a2 - 8) ^ 0x1CAD21F72C81017CuLL, *a1 ^ 0xBE4BA423396CFEB8 ^ *(void *)((char *)a1 + a2 - 8) ^ 0x1CAD21F72C81017CLL)* 0x9E3779B185EBCA87) >> 64) >> 32);
      unint64_t v3 = (0xC2B2AE3D27D4EB4FLL * v2) ^ ((0xC2B2AE3D27D4EB4FLL * v2) >> 37);
      return (0x165667B19E3779F9 * v3) ^ ((0x165667B19E3779F9 * v3) >> 32);
    }
    if (a2 >= 4)
    {
      unint64_t v10 = (*(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32)) ^ 0xBE4BA423396CFEB8;
      unint64_t v11 = 0xC2B2AE3D27D4EB4FLL
          * ((a2 + 2654435761u * (v10 ^ (v10 >> 51))) ^ ((a2 + 2654435761u * (v10 ^ (v10 >> 51))) >> 47));
LABEL_16:
      unint64_t v3 = v11 ^ (v11 >> 37);
      return (0x165667B19E3779F9 * v3) ^ ((0x165667B19E3779F9 * v3) >> 32);
    }
    if (a2)
    {
      unint64_t v11 = 0x9E3779B185EBCA87
          * ((*(unsigned __int8 *)a1 | (*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | (*((unsigned __int8 *)a1 + a2 - 1) << 16) | (a2 << 24)) ^ 0x396CFEB8u);
      goto LABEL_16;
    }
    return 0;
  }
}

unint64_t XXH3_len_129to240_128b(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  unint64_t v6 = 0x9E3779B185EBCA87 * a2;
  uint64_t v7 = a1 + 24;
  uint64_t v8 = a3 + 16;
  do
  {
    unint64_t v9 = *(void *)(a1 + v4);
    uint64_t v10 = *(void *)(v7 + v4 - 16);
    uint64_t v11 = (*(void *)(v8 + v4 - 8) - a4) ^ v10;
    unint64_t v12 = *(void *)(v7 + v4 - 8);
    uint64_t v13 = *(void *)(v7 + v4);
    unint64_t v6 = (v6
        + ((((unint64_t)v11 * (unsigned __int128)((*(void *)(a3 + v4) + a4) ^ v9)) >> 64) ^ (v11 * ((*(void *)(a3 + v4) + a4) ^ v9)))) ^ (v13 + v12);
    uint64_t v14 = (*(void *)(v8 + v4 + 8) - a4) ^ v13;
    unint64_t v5 = (v5
        + ((((unint64_t)v14 * (unsigned __int128)((*(void *)(v8 + v4) + a4) ^ v12)) >> 64) ^ (v14 * ((*(void *)(v8 + v4) + a4) ^ v12)))) ^ (v10 + v9);
    v4 += 32;
  }
  while (v4 != 128);
  uint64_t v15 = (0x165667B19E3779F9 * (v6 ^ (v6 >> 37))) ^ ((0x165667B19E3779F9 * (v6 ^ (v6 >> 37))) >> 32);
  uint64_t v16 = (0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) ^ ((0x165667B19E3779F9 * (v5 ^ (v5 >> 37))) >> 32);
  if (a2 >= 0xA0)
  {
    uint64_t v17 = (a2 >> 5) - 4;
    uint64_t v18 = (void *)(a1 + 152);
    uint64_t v19 = (uint64_t *)(a3 + 19);
    do
    {
      unint64_t v20 = *(v18 - 3);
      unint64_t v21 = *(v18 - 2);
      unint64_t v22 = *(v18 - 1);
      uint64_t v15 = (v15
           + (((((*(v19 - 1) - a4) ^ v21) * (unsigned __int128)((*(v19 - 2) + a4) ^ v20)) >> 64) ^ (((*(v19 - 1) - a4) ^ v21)
                                                                                                  * ((*(v19 - 2) + a4) ^ v20)))) ^ (*v18 + v22);
      uint64_t v23 = *v19;
      uint64_t v24 = v19[1];
      v19 += 4;
      uint64_t v16 = (v16
           + (((((unint64_t)(v24 - a4) ^ *v18) * (unsigned __int128)((v23 + a4) ^ v22)) >> 64) ^ (((v24 - a4) ^ *v18) * ((v23 + a4) ^ v22)))) ^ (v21 + v20);
      v18 += 4;
      --v17;
    }
    while (v17);
  }
  unint64_t v25 = *(void *)(a1 + a2 - 16);
  unint64_t v26 = *(void *)(a1 + a2 - 8);
  unint64_t v28 = *(void *)(a1 + a2 - 32);
  unint64_t v27 = *(void *)(a1 + a2 - 24);
  uint64_t v29 = (v15
       + (((((*(void *)(a3 + 111) + a4) ^ v26) * (unsigned __int128)((*(void *)(a3 + 103) - a4) ^ v25)) >> 64) ^ (((*(void *)(a3 + 111) + a4) ^ v26) * ((*(void *)(a3 + 103) - a4) ^ v25)))) ^ (v27 + v28);
  uint64_t v30 = (v16
       + (((((*(void *)(a3 + 127) + a4) ^ v27) * (unsigned __int128)((*(void *)(a3 + 119) - a4) ^ v28)) >> 64) ^ (((*(void *)(a3 + 127) + a4) ^ v27) * ((*(void *)(a3 + 119) - a4) ^ v28)))) ^ (v26 + v25);
  unint64_t v31 = 0x165667B19E3779F9 * ((v30 + v29) ^ ((unint64_t)(v30 + v29) >> 37));
  return v31 ^ HIDWORD(v31);
}

unint64_t XXH3_hashLong_128b_defaultSecret(uint64_t a1, unint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v28[0] = (int8x16_t)xmmword_1DC5C6200;
  v28[1] = (int8x16_t)unk_1DC5C6210;
  v28[2] = (int8x16_t)xmmword_1DC5C6220;
  v28[3] = (int8x16_t)unk_1DC5C6230;
  if (a2 >= 0x400)
  {
    uint64_t v3 = 0;
    uint32x2_t v4 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    uint64_t v5 = a1;
    do
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5;
      uint64_t v8 = (char *)&kSecret;
      do
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          int8x16_t v10 = *(int8x16_t *)(v7 + i * 16);
          int64x2_t v11 = (int64x2_t)veorq_s8(*(int8x16_t *)&v8[i * 16], v10);
          v28[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v28[i], (int64x2_t)vextq_s8(v10, v10, 8uLL)), (uint32x2_t)vmovn_s64(v11), (uint32x2_t)vshrn_n_s64(v11, 0x20uLL));
        }
        ++v6;
        v8 += 8;
        v7 += 64;
      }
      while (v6 != 16);
      for (uint64_t j = 0; j != 4; ++j)
      {
        int8x16_t v13 = v28[j];
        int8x16_t v14 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v13, 0x2FuLL), v13);
        uint64_t v15 = (const float *)((char *)&kSecret + j * 16 + 128);
        float32x2x2_t v30 = vld2_f32(v15);
        v28[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v30.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v13.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL))), v4), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v30.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v14.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL))), v4);
      }
      ++v3;
      v5 += 1024;
    }
    while (v3 != a2 >> 10);
  }
  uint64_t v16 = (a2 >> 6) & 0xF;
  if (v16)
  {
    uint64_t v17 = 0;
    uint64_t v18 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
    uint64_t v19 = (char *)&kSecret;
    do
    {
      for (uint64_t k = 0; k != 4; ++k)
      {
        int8x16_t v21 = *(int8x16_t *)(v18 + k * 16);
        int64x2_t v22 = (int64x2_t)veorq_s8(*(int8x16_t *)&v19[k * 16], v21);
        v28[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v28[k], (int64x2_t)vextq_s8(v21, v21, 8uLL)), (uint32x2_t)vmovn_s64(v22), (uint32x2_t)vshrn_n_s64(v22, 0x20uLL));
      }
      ++v17;
      v19 += 8;
      v18 += 64;
    }
    while (v17 != v16);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (uint64_t m = 0; m != 4; ++m)
    {
      int8x16_t v24 = *(int8x16_t *)(a1 + a2 - 64 + m * 16);
      int64x2_t v25 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&kSecret + m * 16 + 121), v24);
      v28[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v28[m], (int64x2_t)vextq_s8(v24, v24, 8uLL)), (uint32x2_t)vmovn_s64(v25), (uint32x2_t)vshrn_n_s64(v25, 0x20uLL));
    }
  }
  unint64_t v26 = XXH3_mergeAccs(v28, xmmword_1DC5C614B, 0x9E3779B185EBCA87 * a2);
  XXH3_mergeAccs(v28, (int8x16_t *)((char *)&xmmword_1DC5C614B[6].u64[1] + 2), ~(0xC2B2AE3D27D4EB4FLL * a2));
  return v26;
}

unint64_t XXH3_128bits_withSecret(void *a1, unint64_t a2, void *a3, uint64_t a4)
{
  if (a2 > 0x10)
  {
    if (a2 > 0x80)
    {
      if (a2 > 0xF0) {
        return XXH3_hashLong_128b_withSecret((uint64_t)a1, a2, (uint64_t)a3, a4);
      }
      else {
        return XXH3_len_129to240_128b((uint64_t)a1, a2, (uint64_t)a3, 0);
      }
    }
    else
    {
      unint64_t v8 = 0x9E3779B185EBCA87 * a2;
      if (a2 < 0x21)
      {
        uint64_t v17 = 0;
      }
      else
      {
        if (a2 < 0x41)
        {
          uint64_t v18 = 0;
        }
        else
        {
          if (a2 < 0x61)
          {
            uint64_t v13 = 0;
          }
          else
          {
            unint64_t v9 = a1[6];
            unint64_t v10 = a1[7];
            unint64_t v12 = *(void *)((char *)a1 + a2 - 64);
            unint64_t v11 = *(void *)((char *)a1 + a2 - 56);
            unint64_t v8 = (v8 + ((((a3[13] ^ v10) * (unsigned __int128)(a3[12] ^ v9)) >> 64) ^ ((a3[13] ^ v10) * (a3[12] ^ v9)))) ^ (v11 + v12);
            uint64_t v13 = (v10 + v9) ^ (((a3[15] ^ v11) * (unsigned __int128)(a3[14] ^ v12)) >> 64) ^ ((a3[15] ^ v11)
                                                                                             * (a3[14] ^ v12));
          }
          unint64_t v19 = a1[4];
          unint64_t v20 = a1[5];
          unint64_t v22 = *(void *)((char *)a1 + a2 - 48);
          unint64_t v21 = *(void *)((char *)a1 + a2 - 40);
          unint64_t v8 = (v8 + ((((a3[9] ^ v20) * (unsigned __int128)(a3[8] ^ v19)) >> 64) ^ ((a3[9] ^ v20) * (a3[8] ^ v19)))) ^ (v21 + v22);
          uint64_t v18 = (v13 + ((((a3[11] ^ v21) * (unsigned __int128)(a3[10] ^ v22)) >> 64) ^ ((a3[11] ^ v21) * (a3[10] ^ v22)))) ^ (v20 + v19);
        }
        unint64_t v23 = a1[2];
        unint64_t v24 = a1[3];
        unint64_t v26 = *(void *)((char *)a1 + a2 - 32);
        unint64_t v25 = *(void *)((char *)a1 + a2 - 24);
        unint64_t v8 = (v8 + ((((a3[5] ^ v24) * (unsigned __int128)(a3[4] ^ v23)) >> 64) ^ ((a3[5] ^ v24) * (a3[4] ^ v23)))) ^ (v25 + v26);
        uint64_t v17 = (v18 + ((((a3[7] ^ v25) * (unsigned __int128)(a3[6] ^ v26)) >> 64) ^ ((a3[7] ^ v25) * (a3[6] ^ v26)))) ^ (v24 + v23);
      }
      unint64_t v27 = a1[1];
      unint64_t v29 = *(void *)((char *)a1 + a2 - 16);
      unint64_t v28 = *(void *)((char *)a1 + a2 - 8);
      uint64_t v30 = (v8
           + ((((a3[1] ^ v27) * (unsigned __int128)(unint64_t)(*a3 ^ *a1)) >> 64) ^ ((a3[1] ^ v27) * (*a3 ^ *a1)))) ^ (v28 + v29);
      uint64_t v31 = (v17 + ((((a3[3] ^ v28) * (unsigned __int128)(a3[2] ^ v29)) >> 64) ^ ((a3[3] ^ v28) * (a3[2] ^ v29)))) ^ (v27 + *a1);
      return (0x165667B19E3779F9 * ((v31 + v30) ^ ((unint64_t)(v31 + v30) >> 37))) ^ ((0x165667B19E3779F9
                                                                                              * ((v31 + v30) ^ ((unint64_t)(v31 + v30) >> 37))) >> 32);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      unint64_t v4 = a3[1] ^ *(void *)((char *)a1 + a2 - 8);
      unint64_t v5 = (0x9E3779B185EBCA87 * (*a3 ^ *a1 ^ v4) + 374761393 * a2) ^ ((unint64_t)((__PAIR128__(v4, *a3 ^ *a1 ^ v4)* 0x9E3779B185EBCA87) >> 64) >> 32);
      unint64_t v6 = 0x165667B19E3779F9 * ((0xC2B2AE3D27D4EB4FLL * v5) ^ ((0xC2B2AE3D27D4EB4FLL * v5) >> 37));
      return v6 ^ HIDWORD(v6);
    }
    if (a2 < 4)
    {
      if (!a2) {
        return 0;
      }
      unint64_t v16 = 0x9E3779B185EBCA87
          * ((*(unsigned __int8 *)a1 | (*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | (*((unsigned __int8 *)a1 + a2 - 1) << 16) | (a2 << 24)) ^ *(_DWORD *)a3);
    }
    else
    {
      unint64_t v14 = *(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32);
      unint64_t v15 = a2 + 2654435761u * (v14 ^ *a3 ^ ((v14 ^ *a3) >> 51));
      unint64_t v16 = 0xC2B2AE3D27D4EB4FLL * (v15 ^ (v15 >> 47));
    }
    return (0x165667B19E3779F9 * (v16 ^ (v16 >> 37))) ^ ((0x165667B19E3779F9 * (v16 ^ (v16 >> 37))) >> 32);
  }
}

unint64_t XXH3_hashLong_128b_withSecret(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v40[0] = (int8x16_t)xmmword_1DC5C6200;
  v40[1] = (int8x16_t)unk_1DC5C6210;
  v40[2] = (int8x16_t)xmmword_1DC5C6220;
  v40[3] = (int8x16_t)unk_1DC5C6230;
  unint64_t v7 = a4 - 64;
  unint64_t v8 = (unint64_t)(a4 - 64) >> 3;
  unint64_t v9 = v8 << 6;
  unint64_t v10 = a2 / (v8 << 6);
  if (v8 << 6 <= a2)
  {
    uint64_t v11 = 0;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    if (v10 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v10;
    }
    uint32x2_t v13 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    uint64_t v14 = a1;
    do
    {
      if (v7 >= 8)
      {
        uint64_t v15 = 0;
        uint64_t v16 = v14;
        uint64_t v17 = a3;
        do
        {
          for (uint64_t i = 0; i != 4; ++i)
          {
            int8x16_t v19 = *(int8x16_t *)(v16 + i * 16);
            int64x2_t v20 = (int64x2_t)veorq_s8(*(int8x16_t *)(v17 + i * 16), v19);
            v40[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v40[i], (int64x2_t)vextq_s8(v19, v19, 8uLL)), (uint32x2_t)vmovn_s64(v20), (uint32x2_t)vshrn_n_s64(v20, 0x20uLL));
          }
          ++v15;
          v17 += 8;
          v16 += 64;
        }
        while (v15 != v8);
      }
      for (uint64_t j = 0; j != 4; ++j)
      {
        int8x16_t v22 = v40[j];
        int8x16_t v23 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v22, 0x2FuLL), v22);
        unint64_t v24 = (const float *)(a3 + a4 - 64 + j * 16);
        float32x2x2_t v42 = vld2_f32(v24);
        v40[j] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v42.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v22.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v22, v22, 8uLL))), v13), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v42.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v23.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v23, v23, 8uLL))), v13);
      }
      ++v11;
      v14 += v9;
    }
    while (v11 != v12);
  }
  unint64_t v25 = v10 * v9;
  unint64_t v26 = a2 - v25;
  if (a2 - v25 >= 0x40)
  {
    uint64_t v27 = 0;
    uint64_t v28 = a1 + v25;
    unint64_t v29 = v26 >> 6;
    if (v29 <= 1) {
      unint64_t v29 = 1;
    }
    uint64_t v30 = a3;
    do
    {
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      do
      {
        int8x16_t v33 = *(int8x16_t *)(v28 + (v27 << 6) + 16 * v32);
        int64x2_t v34 = (int64x2_t)veorq_s8(*(int8x16_t *)(v30 + v31 * 16), v33);
        v40[v31] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v40[v31], (int64x2_t)vextq_s8(v33, v33, 8uLL)), (uint32x2_t)vmovn_s64(v34), (uint32x2_t)vshrn_n_s64(v34, 0x20uLL));
        ++v32;
        ++v31;
      }
      while (v31 != 4);
      ++v27;
      v30 += 8;
    }
    while (v27 != v29);
  }
  if ((a2 & 0x3F) != 0)
  {
    for (uint64_t k = 0; k != 4; ++k)
    {
      int8x16_t v36 = *(int8x16_t *)(a1 + a2 - 64 + k * 16);
      int64x2_t v37 = (int64x2_t)veorq_s8(*(int8x16_t *)(a3 + a4 - 71 + k * 16), v36);
      v40[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v40[k], (int64x2_t)vextq_s8(v36, v36, 8uLL)), (uint32x2_t)vmovn_s64(v37), (uint32x2_t)vshrn_n_s64(v37, 0x20uLL));
    }
  }
  unint64_t v38 = XXH3_mergeAccs(v40, (int8x16_t *)(a3 + 11), 0x9E3779B185EBCA87 * a2);
  XXH3_mergeAccs(v40, (int8x16_t *)(a3 + a4 - 75), ~(0xC2B2AE3D27D4EB4FLL * a2));
  return v38;
}

unint64_t XXH3_128bits_withSeed(void *a1, unint64_t a2, uint64_t a3)
{
  if (a2 > 0x10)
  {
    if (a2 > 0x80)
    {
      if (a2 > 0xF0) {
        return XXH3_hashLong_128b_withSeed((uint64_t)a1, a2, a3);
      }
      else {
        return XXH3_len_129to240_128b((uint64_t)a1, a2, (uint64_t)&kSecret, a3);
      }
    }
    else
    {
      unint64_t v7 = 0x9E3779B185EBCA87 * a2;
      if (a2 < 0x21)
      {
        uint64_t v16 = 0;
      }
      else
      {
        if (a2 < 0x41)
        {
          uint64_t v17 = 0;
        }
        else
        {
          if (a2 < 0x61)
          {
            uint64_t v12 = 0;
          }
          else
          {
            uint64_t v8 = a1[6];
            uint64_t v9 = a1[7];
            uint64_t v11 = *(void *)((char *)a1 + a2 - 64);
            uint64_t v10 = *(void *)((char *)a1 + a2 - 56);
            unint64_t v7 = (v7
                + ((((v9 ^ (unint64_t)(0x1D4F0BC7C7BBDCF9 - a3))
                   * (unsigned __int128)(v8 ^ (unint64_t)(a3 + 0x3F349CE33F76FAA8))) >> 64) ^ ((v9 ^ (0x1D4F0BC7C7BBDCF9 - a3)) * (v8 ^ (a3 + 0x3F349CE33F76FAA8))))) ^ (v10 + v11);
            uint64_t v12 = (v9 + v8) ^ (((v10 ^ (unint64_t)(0x647378D9C97E9FC8 - a3))
                              * (unsigned __int128)(v11 ^ (unint64_t)(a3 + 0x3159B4CD4BE0518ALL))) >> 64) ^ ((v10 ^ (0x647378D9C97E9FC8 - a3)) * (v11 ^ (a3 + 0x3159B4CD4BE0518ALL)));
          }
          uint64_t v18 = a1[4];
          uint64_t v19 = a1[5];
          uint64_t v21 = *(void *)((char *)a1 + a2 - 48);
          uint64_t v20 = *(void *)((char *)a1 + a2 - 40);
          unint64_t v7 = (v7
              + ((((v19 ^ (0xA32E531B8B65D088 - a3))
                 * (unsigned __int128)(v18 ^ (unint64_t)(a3 - 0x34FF3C6E44ADD7C4))) >> 64) ^ ((v19 ^ (0xA32E531B8B65D088 - a3)) * (v18 ^ (a3 - 0x34FF3C6E44ADD7C4))))) ^ (v20 + v21);
          uint64_t v17 = (v12
               + ((((v20 ^ (0xD8ACDEA946EF1938 - a3))
                  * (unsigned __int128)(v21 ^ (unint64_t)(a3 + 0x4EF90DA297486471))) >> 64) ^ ((v20 ^ (0xD8ACDEA946EF1938 - a3)) * (v21 ^ (a3 + 0x4EF90DA297486471))))) ^ (v19 + v18);
        }
        uint64_t v22 = a1[2];
        uint64_t v23 = a1[3];
        uint64_t v25 = *(void *)((char *)a1 + a2 - 32);
        uint64_t v24 = *(void *)((char *)a1 + a2 - 24);
        unint64_t v7 = (v7
            + ((((v23 ^ (unint64_t)(0x2172FFCC7DD05A82 - a3))
               * (unsigned __int128)(v22 ^ (unint64_t)(a3 + 0x78E5C0CC4EE679CBLL))) >> 64) ^ ((v23 ^ (0x2172FFCC7DD05A82 - a3)) * (v22 ^ (a3 + 0x78E5C0CC4EE679CBLL))))) ^ (v24 + v25);
        uint64_t v16 = (v17
             + ((((v24 ^ (unint64_t)(0x4C263A81E69035E0 - a3))
                * (unsigned __int128)(v25 ^ (unint64_t)(a3 - 0x71DBBC088BB9F748))) >> 64) ^ ((v24 ^ (0x4C263A81E69035E0 - a3)) * (v25 ^ (a3 - 0x71DBBC088BB9F748))))) ^ (v23 + v22);
      }
      uint64_t v26 = a1[1];
      uint64_t v28 = *(void *)((char *)a1 + a2 - 16);
      uint64_t v27 = *(void *)((char *)a1 + a2 - 8);
      uint64_t v29 = (v7
           + ((((v26 ^ (unint64_t)(0x1CAD21F72C81017CLL - a3))
              * (unsigned __int128)(*a1 ^ (unint64_t)(a3 - 0x41B45BDCC6930148))) >> 64) ^ ((v26 ^ (0x1CAD21F72C81017CLL - a3))
                                                                                                  * (*a1 ^ (a3 - 0x41B45BDCC6930148))))) ^ (v27 + v28);
      uint64_t v30 = (v16
           + ((((v27 ^ (unint64_t)(0x1F67B3B7A4A44072 - a3))
              * (unsigned __int128)(v28 ^ (unint64_t)(a3 - 0x24686F7C16922B22))) >> 64) ^ ((v27 ^ (0x1F67B3B7A4A44072 - a3))
                                                                                                  * (v28 ^ (a3 - 0x24686F7C16922B22))))) ^ (v26 + *a1);
      return (0x165667B19E3779F9 * ((v30 + v29) ^ ((unint64_t)(v30 + v29) >> 37))) ^ ((0x165667B19E3779F9
                                                                                              * ((v30 + v29) ^ ((unint64_t)(v30 + v29) >> 37))) >> 32);
    }
  }
  else
  {
    if (a2 >= 9)
    {
      uint64_t v3 = *(void *)((char *)a1 + a2 - 8) ^ (0x1CAD21F72C81017CLL - a3);
      unint64_t v4 = (0x9E3779B185EBCA87 * (*a1 ^ (a3 - 0x41B45BDCC6930148) ^ v3) + 374761393 * a2) ^ ((unint64_t)((__PAIR128__(v3, *a1 ^ (a3 - 0x41B45BDCC6930148) ^ (unint64_t)v3) * 0x9E3779B185EBCA87) >> 64) >> 32);
      unint64_t v5 = 0x165667B19E3779F9 * ((0xC2B2AE3D27D4EB4FLL * v4) ^ ((0xC2B2AE3D27D4EB4FLL * v4) >> 37));
      return v5 ^ HIDWORD(v5);
    }
    if (a2 < 4)
    {
      if (!a2) {
        return 0;
      }
      unint64_t v15 = 0x9E3779B185EBCA87
          * ((a3 + 963444408) ^ (*(unsigned __int8 *)a1 | (*((unsigned __int8 *)a1 + (a2 >> 1)) << 8) | (*((unsigned __int8 *)a1 + a2 - 1) << 16) | (a2 << 24)));
    }
    else
    {
      unint64_t v13 = *(unsigned int *)a1 | ((unint64_t)*(unsigned int *)((char *)a1 + a2 - 4) << 32);
      unint64_t v14 = a2 + 2654435761u * (v13 ^ (a3 - 0x41B45BDCC6930148) ^ ((v13 ^ (a3 - 0x41B45BDCC6930148)) >> 51));
      unint64_t v15 = 0xC2B2AE3D27D4EB4FLL * (v14 ^ (v14 >> 47));
    }
    return (0x165667B19E3779F9 * (v15 ^ (v15 >> 37))) ^ ((0x165667B19E3779F9 * (v15 ^ (v15 >> 37))) >> 32);
  }
}

unint64_t XXH3_hashLong_128b_withSeed(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    for (uint64_t i = 0; i != 192; i += 16)
    {
      unint64_t v5 = &v32[i];
      uint64_t v6 = *(void *)((char *)&kSecret + i + 8) - a3;
      *unint64_t v5 = *(void *)((char *)&kSecret + i) + a3;
      v5[1] = v6;
    }
    v35[0] = (int8x16_t)xmmword_1DC5C6200;
    v35[1] = (int8x16_t)unk_1DC5C6210;
    v35[2] = (int8x16_t)xmmword_1DC5C6220;
    v35[3] = (int8x16_t)unk_1DC5C6230;
    if (a2 >= 0x400)
    {
      uint64_t v7 = 0;
      uint32x2_t v8 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
      uint64_t v9 = a1;
      do
      {
        uint64_t v10 = 0;
        uint64_t v11 = v32;
        uint64_t v12 = v9;
        do
        {
          for (uint64_t j = 0; j != 4; ++j)
          {
            int8x16_t v14 = *(int8x16_t *)(v12 + j * 16);
            int64x2_t v15 = (int64x2_t)veorq_s8(*(int8x16_t *)&v11[j * 16], v14);
            v35[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[j], (int64x2_t)vextq_s8(v14, v14, 8uLL)), (uint32x2_t)vmovn_s64(v15), (uint32x2_t)vshrn_n_s64(v15, 0x20uLL));
          }
          ++v10;
          v11 += 8;
          v12 += 64;
        }
        while (v10 != 16);
        for (uint64_t k = 0; k != 4; ++k)
        {
          int8x16_t v17 = v35[k];
          int8x16_t v18 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v17, 0x2FuLL), v17);
          uint64_t v19 = (const float *)((char *)&v34[k].i32[2] + 3);
          float32x2x2_t v38 = vld2_f32(v19);
          v35[k] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v38.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v17.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL))), v8), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v38.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v18.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL))), v8);
        }
        ++v7;
        v9 += 1024;
      }
      while (v7 != a2 >> 10);
    }
    uint64_t v20 = (a2 >> 6) & 0xF;
    if (v20)
    {
      uint64_t v21 = 0;
      unint64_t v22 = a1 + (a2 & 0xFFFFFFFFFFFFFC00);
      uint64_t v23 = v32;
      do
      {
        for (uint64_t m = 0; m != 4; ++m)
        {
          int8x16_t v25 = *(int8x16_t *)(v22 + m * 16);
          int64x2_t v26 = (int64x2_t)veorq_s8(*(int8x16_t *)&v23[m * 16], v25);
          v35[m] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[m], (int64x2_t)vextq_s8(v25, v25, 8uLL)), (uint32x2_t)vmovn_s64(v26), (uint32x2_t)vshrn_n_s64(v26, 0x20uLL));
        }
        ++v21;
        v23 += 8;
        v22 += 64;
      }
      while (v21 != v20);
    }
    if ((a2 & 0x3F) != 0)
    {
      for (uint64_t n = 0; n != 4; ++n)
      {
        int8x16_t v28 = *(int8x16_t *)(a1 + a2 - 64 + n * 16);
        int64x2_t v29 = (int64x2_t)veorq_s8(*(int8x16_t *)((char *)&v34[n] + 4), v28);
        v35[n] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v35[n], (int64x2_t)vextq_s8(v28, v28, 8uLL)), (uint32x2_t)vmovn_s64(v29), (uint32x2_t)vshrn_n_s64(v29, 0x20uLL));
      }
    }
    unint64_t v30 = XXH3_mergeAccs(v35, v33, 0x9E3779B185EBCA87 * a2);
    XXH3_mergeAccs(v35, v34, ~(0xC2B2AE3D27D4EB4FLL * a2));
    return v30;
  }
  else
  {
    return XXH3_hashLong_128b_defaultSecret(a1, a2);
  }
}

uint64_t XXH3_128bits_reset(_OWORD *a1)
{
  if (!a1) {
    return 1;
  }
  bzero(a1, 0x240uLL);
  uint64_t result = 0;
  *a1 = xmmword_1DC5C60F0;
  a1[1] = xmmword_1DC5C6100;
  *((void *)a1 + 70) = &kSecret;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  a1[2] = xmmword_1DC5C6110;
  a1[3] = xmmword_1DC5C6120;
  *((void *)a1 + 68) = 0;
  return result;
}

BOOL XXH3_128bits_reset_withSecret(_OWORD *a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 1;
  }
  bzero(a1, 0x240uLL);
  *a1 = xmmword_1DC5C60F0;
  a1[1] = xmmword_1DC5C6100;
  a1[2] = xmmword_1DC5C6110;
  a1[3] = xmmword_1DC5C6120;
  *((void *)a1 + 68) = 0;
  *((void *)a1 + 70) = a2;
  *((_DWORD *)a1 + 131) = a3 - 64;
  *((_DWORD *)a1 + 129) = (a3 - 64) >> 3;
  return !a2 || a3 < 0x88;
}

uint64_t XXH3_128bits_reset_withSeed(_OWORD *a1, uint64_t a2)
{
  if (!a1) {
    return 1;
  }
  bzero(a1, 0x240uLL);
  uint64_t v4 = 0;
  *a1 = xmmword_1DC5C60F0;
  a1[1] = xmmword_1DC5C6100;
  a1[2] = xmmword_1DC5C6110;
  a1[3] = xmmword_1DC5C6120;
  *((void *)a1 + 68) = a2;
  *((_DWORD *)a1 + 131) = 128;
  *((_DWORD *)a1 + 129) = 16;
  do
  {
    unint64_t v5 = &a1[v4];
    *((void *)v5 + 8) = *(void *)((char *)&kSecret + v4 * 16) + a2;
    *((void *)v5 + 9) = *(void *)((char *)&kSecret + v4 * 16 + 8) - a2;
    ++v4;
  }
  while (v4 != 12);
  uint64_t result = 0;
  *((void *)a1 + 70) = a1 + 4;
  return result;
}

uint64_t XXH3_128bits_update(uint64_t a1, char *__src, size_t __n)
{
  if (!__src) {
    return 1;
  }
  int v3 = __n;
  uint64_t v4 = __src;
  *(void *)(a1 + 536) += __n;
  uint64_t v6 = *(unsigned int *)(a1 + 512);
  if (v6 + __n <= 0x100)
  {
    memcpy((void *)(a1 + v6 + 256), __src, __n);
    int v7 = *(_DWORD *)(a1 + 512) + v3;
LABEL_59:
    uint64_t result = 0;
    *(_DWORD *)(a1 + 512) = v7;
    return result;
  }
  uint64_t v9 = &__src[__n];
  if (v6)
  {
    size_t v10 = (256 - v6);
    uint64_t v11 = a1 + 256;
    memcpy((void *)(a1 + 256 + v6), __src, v10);
    v4 += v10;
    int v12 = *(_DWORD *)(a1 + 516);
    uint64_t v13 = *(void *)(a1 + 560);
    int v14 = *(_DWORD *)(a1 + 520);
    unint64_t v15 = (v12 - v14);
    uint64_t v16 = v13 + (8 * v14);
    if (v15 < 5)
    {
      uint64_t v22 = *(unsigned int *)(a1 + 524);
      if (v12 != v14)
      {
        uint64_t v23 = 0;
        if (v15 <= 1) {
          uint64_t v24 = 1;
        }
        else {
          uint64_t v24 = v15;
        }
        uint64_t v25 = a1 + 256;
        do
        {
          for (uint64_t i = 0; i != 64; i += 16)
          {
            int8x16_t v27 = *(int8x16_t *)(v25 + i);
            int64x2_t v28 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + i), v27);
            *(uint64x2_t *)(a1 + i) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + i), (int64x2_t)vextq_s8(v27, v27, 8uLL)), (uint32x2_t)vmovn_s64(v28), (uint32x2_t)vshrn_n_s64(v28, 0x20uLL));
          }
          ++v23;
          v16 += 8;
          v25 += 64;
        }
        while (v23 != v24);
      }
      uint64_t v29 = 0;
      uint64_t v30 = v13 + v22;
      uint32x2_t v31 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
      do
      {
        int8x16_t v32 = *(int8x16_t *)(a1 + v29);
        int8x16_t v33 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v32, 0x2FuLL), v32);
        int64x2_t v34 = (const float *)(v30 + v29);
        float32x2x2_t v71 = vld2_f32(v34);
        *(uint64x2_t *)(a1 + v29) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v71.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v32.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v32, v32, 8uLL))), v31), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v71.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v33.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 8uLL))), v31);
        v29 += 16;
      }
      while (v29 != 64);
      unint64_t v21 = 4 - v15;
      if (v15 != 4)
      {
        uint64_t v35 = 0;
        uint64_t v36 = v11 + (v15 << 6);
        if (v21 <= 1) {
          uint64_t v37 = 1;
        }
        else {
          uint64_t v37 = v21;
        }
        do
        {
          for (uint64_t j = 0; j != 64; j += 16)
          {
            int8x16_t v39 = *(int8x16_t *)(v36 + j);
            int64x2_t v40 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + j), v39);
            *(uint64x2_t *)(a1 + j) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + j), (int64x2_t)vextq_s8(v39, v39, 8uLL)), (uint32x2_t)vmovn_s64(v40), (uint32x2_t)vshrn_n_s64(v40, 0x20uLL));
          }
          ++v35;
          v13 += 8;
          v36 += 64;
        }
        while (v35 != v37);
      }
    }
    else
    {
      for (uint64_t k = 0; k != 4; ++k)
      {
        for (uint64_t m = 0; m != 64; m += 16)
        {
          int8x16_t v19 = *(int8x16_t *)(v11 + m);
          int64x2_t v20 = (int64x2_t)veorq_s8(*(int8x16_t *)(v16 + m), v19);
          *(uint64x2_t *)(a1 + m) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + m), (int64x2_t)vextq_s8(v19, v19, 8uLL)), (uint32x2_t)vmovn_s64(v20), (uint32x2_t)vshrn_n_s64(v20, 0x20uLL));
        }
        v16 += 8;
        v11 += 64;
      }
      LODWORD(v21) = *(_DWORD *)(a1 + 520) + 4;
    }
    *(_DWORD *)(a1 + 520) = v21;
    *(_DWORD *)(a1 + 512) = 0;
  }
  if (v4 + 256 <= v9)
  {
    LODWORD(v41) = *(_DWORD *)(a1 + 520);
    uint32x2_t v42 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
    do
    {
      int v43 = *(_DWORD *)(a1 + 516);
      uint64_t v44 = *(void *)(a1 + 560);
      unint64_t v45 = (v43 - v41);
      uint64_t v46 = v44 + (8 * v41);
      if (v45 < 5)
      {
        uint64_t v52 = *(unsigned int *)(a1 + 524);
        if (v43 != v41)
        {
          uint64_t v53 = 0;
          if (v45 <= 1) {
            uint64_t v54 = 1;
          }
          else {
            uint64_t v54 = v45;
          }
          v55 = v4;
          do
          {
            for (uint64_t n = 0; n != 64; n += 16)
            {
              int8x16_t v57 = *(int8x16_t *)&v55[n];
              int64x2_t v58 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + n), v57);
              *(uint64x2_t *)(a1 + n) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + n), (int64x2_t)vextq_s8(v57, v57, 8uLL)), (uint32x2_t)vmovn_s64(v58), (uint32x2_t)vshrn_n_s64(v58, 0x20uLL));
            }
            ++v53;
            v46 += 8;
            v55 += 64;
          }
          while (v53 != v54);
        }
        uint64_t v59 = 0;
        uint64_t v60 = v44 + v52;
        do
        {
          int8x16_t v61 = *(int8x16_t *)(a1 + v59);
          int8x16_t v62 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v61, 0x2FuLL), v61);
          v63 = (const float *)(v60 + v59);
          float32x2x2_t v72 = vld2_f32(v63);
          *(uint64x2_t *)(a1 + v59) = vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v72.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v61.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v61, v61, 8uLL))), v42), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v72.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v62.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v62, v62, 8uLL))), v42);
          v59 += 16;
        }
        while (v59 != 64);
        unint64_t v41 = 4 - v45;
        if (v45 != 4)
        {
          uint64_t v64 = 0;
          unint64_t v65 = v45 << 6;
          if (v41 <= 1) {
            uint64_t v66 = 1;
          }
          else {
            uint64_t v66 = 4 - v45;
          }
          v67 = &v4[v65];
          do
          {
            for (iuint64_t i = 0; ii != 64; ii += 16)
            {
              int8x16_t v69 = *(int8x16_t *)&v67[ii];
              int64x2_t v70 = (int64x2_t)veorq_s8(*(int8x16_t *)(v44 + ii), v69);
              *(uint64x2_t *)(a1 + ii) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + ii), (int64x2_t)vextq_s8(v69, v69, 8uLL)), (uint32x2_t)vmovn_s64(v70), (uint32x2_t)vshrn_n_s64(v70, 0x20uLL));
            }
            ++v64;
            v44 += 8;
            v67 += 64;
          }
          while (v64 != v66);
        }
      }
      else
      {
        uint64_t v47 = 0;
        uint64_t v48 = v4;
        do
        {
          for (juint64_t j = 0; jj != 64; jj += 16)
          {
            int8x16_t v50 = *(int8x16_t *)&v48[jj];
            int64x2_t v51 = (int64x2_t)veorq_s8(*(int8x16_t *)(v46 + jj), v50);
            *(uint64x2_t *)(a1 + jj) = vmlal_u32((uint64x2_t)vaddq_s64(*(int64x2_t *)(a1 + jj), (int64x2_t)vextq_s8(v50, v50, 8uLL)), (uint32x2_t)vmovn_s64(v51), (uint32x2_t)vshrn_n_s64(v51, 0x20uLL));
          }
          ++v47;
          v46 += 8;
          v48 += 64;
        }
        while (v47 != 4);
        LODWORD(v41) = *(_DWORD *)(a1 + 520) + 4;
      }
      *(_DWORD *)(a1 + 520) = v41;
      v4 += 256;
    }
    while (v4 <= v9 - 256);
  }
  if (v4 < v9)
  {
    int v7 = v9 - v4;
    memcpy((void *)(a1 + 256), v4, v9 - v4);
    goto LABEL_59;
  }
  return 0;
}

unint64_t XXH3_128bits_digest(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 536);
  if (v2 < 0xF1)
  {
    uint64_t v19 = *(void *)(a1 + 544);
    int64x2_t v20 = (void *)(a1 + 256);
    if (v19) {
      return XXH3_128bits_withSeed(v20, v2, v19);
    }
    else {
      return XXH3_128bits_withSecret(v20, v2, *(void **)(a1 + 560), (*(_DWORD *)(a1 + 524) + 64));
    }
  }
  else
  {
    int8x16_t v3 = *(int8x16_t *)(a1 + 16);
    v49[0] = *(int8x16_t *)a1;
    v49[1] = v3;
    int8x16_t v4 = *(int8x16_t *)(a1 + 48);
    v49[2] = *(int8x16_t *)(a1 + 32);
    v49[3] = v4;
    size_t v5 = *(unsigned int *)(a1 + 512);
    if (v5 < 0x40)
    {
      if (v5)
      {
        __memcpy_chk();
        memcpy((char *)&v49[4].u64[1] + (64 - v5), (const void *)(a1 + 256), v5);
        uint64_t v22 = 0;
        uint64_t v10 = *(void *)(a1 + 560);
        uint64_t v11 = *(unsigned int *)(a1 + 524);
        do
        {
          int8x16_t v23 = *(int8x16_t *)((char *)&v49[v22 + 4] + 8);
          int64x2_t v24 = (int64x2_t)veorq_s8(*(int8x16_t *)(v10 + v11 - 7 + v22 * 16), v23);
          v49[v22] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[v22], (int64x2_t)vextq_s8(v23, v23, 8uLL)), (uint32x2_t)vmovn_s64(v24), (uint32x2_t)vshrn_n_s64(v24, 0x20uLL));
          ++v22;
        }
        while (v22 != 4);
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 560);
        uint64_t v11 = *(unsigned int *)(a1 + 524);
      }
    }
    else
    {
      size_t v6 = v5 >> 6;
      int v7 = *(_DWORD *)(a1 + 520);
      int v8 = *(_DWORD *)(a1 + 516);
      uint64_t v9 = a1 + 256;
      uint64_t v10 = *(void *)(a1 + 560);
      uint64_t v11 = *(unsigned int *)(a1 + 524);
      unint64_t v12 = (v8 - v7);
      uint64_t v13 = v10 + (8 * v7);
      if (v12 <= *(_DWORD *)(a1 + 512) >> 6)
      {
        if (v8 != v7)
        {
          uint64_t v26 = 0;
          if (v12 <= 1) {
            uint64_t v27 = 1;
          }
          else {
            uint64_t v27 = v12;
          }
          uint64_t v28 = a1 + 256;
          do
          {
            for (uint64_t i = 0; i != 4; ++i)
            {
              int8x16_t v30 = *(int8x16_t *)(v28 + i * 16);
              int64x2_t v31 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + i * 16), v30);
              v49[i] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[i], (int64x2_t)vextq_s8(v30, v30, 8uLL)), (uint32x2_t)vmovn_s64(v31), (uint32x2_t)vshrn_n_s64(v31, 0x20uLL));
            }
            ++v26;
            v13 += 8;
            v28 += 64;
          }
          while (v26 != v27);
        }
        uint64_t v32 = 0;
        uint32x2_t v33 = (uint32x2_t)vdup_n_s32(0x9E3779B1);
        do
        {
          int8x16_t v34 = v49[v32];
          int8x16_t v35 = veorq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v34, 0x2FuLL), v34);
          uint64_t v36 = (const float *)(v10 + v11 + v32 * 16);
          float32x2x2_t v51 = vld2_f32(v36);
          v49[v32++] = (int8x16_t)vmlal_u32((uint64x2_t)vshlq_n_s64((int64x2_t)vmull_u32((uint32x2_t)veor_s8((int8x8_t)v51.val[1], (int8x8_t)vzip2_s32(*(int32x2_t *)v34.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL))), v33), 0x20uLL), (uint32x2_t)veor_s8((int8x8_t)v51.val[0], (int8x8_t)vzip1_s32(*(int32x2_t *)v35.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL))), v33);
        }
        while (v32 != 4);
        if (v6 != v12)
        {
          uint64_t v37 = 0;
          size_t v38 = v6 - v12;
          uint64_t v39 = v10;
          uint64_t v40 = v9 + (v12 << 6);
          do
          {
            for (uint64_t j = 0; j != 4; ++j)
            {
              int8x16_t v42 = *(int8x16_t *)(v40 + j * 16);
              int64x2_t v43 = (int64x2_t)veorq_s8(*(int8x16_t *)(v39 + j * 16), v42);
              v49[j] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[j], (int64x2_t)vextq_s8(v42, v42, 8uLL)), (uint32x2_t)vmovn_s64(v43), (uint32x2_t)vshrn_n_s64(v43, 0x20uLL));
            }
            ++v37;
            v39 += 8;
            v40 += 64;
          }
          while (v37 != v38);
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v15 = a1 + 256;
        do
        {
          for (uint64_t k = 0; k != 4; ++k)
          {
            int8x16_t v17 = *(int8x16_t *)(v15 + k * 16);
            int64x2_t v18 = (int64x2_t)veorq_s8(*(int8x16_t *)(v13 + k * 16), v17);
            v49[k] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[k], (int64x2_t)vextq_s8(v17, v17, 8uLL)), (uint32x2_t)vmovn_s64(v18), (uint32x2_t)vshrn_n_s64(v18, 0x20uLL));
          }
          ++v14;
          v13 += 8;
          v15 += 64;
        }
        while (v14 != v6);
      }
      if ((v5 & 0x3F) != 0)
      {
        uint64_t v44 = 0;
        uint64_t v45 = v9 + v5 - 64;
        do
        {
          int8x16_t v46 = *(int8x16_t *)(v45 + v44 * 16);
          int64x2_t v47 = (int64x2_t)veorq_s8(*(int8x16_t *)(v10 + v11 - 7 + v44 * 16), v46);
          v49[v44] = (int8x16_t)vmlal_u32((uint64x2_t)vaddq_s64((int64x2_t)v49[v44], (int64x2_t)vextq_s8(v46, v46, 8uLL)), (uint32x2_t)vmovn_s64(v47), (uint32x2_t)vshrn_n_s64(v47, 0x20uLL));
          ++v44;
        }
        while (v44 != 4);
      }
    }
    unint64_t v25 = XXH3_mergeAccs(v49, (int8x16_t *)(v10 + 11), 0x9E3779B185EBCA87 * v2);
    XXH3_mergeAccs(v49, (int8x16_t *)(v10 + v11 - 11), ~(0xC2B2AE3D27D4EB4FLL * v2));
  }
  return v25;
}

BOOL XXH128_isEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

uint64_t XXH128_cmp(void *a1, void *a2)
{
  uint64_t v2 = (a1[1] > a2[1]) - (a2[1] > a1[1]);
  if (!v2) {
    return (*a1 > *a2) - (*a2 > *a1);
  }
  return v2;
}

void *XXH128_canonicalFromHash(void *result, unint64_t a2, unint64_t a3)
{
  *uint64_t result = bswap64(a3);
  result[1] = bswap64(a2);
  return result;
}

unint64_t XXH128_hashFromCanonical(uint64_t a1)
{
  return bswap64(*(void *)(a1 + 8));
}

void sub_1DC5A7E0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1DC5A92AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5A9344(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5AD2A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5AD334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1DC5AD3B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5AD434(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DC5ADF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC5AE260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_1DC5AE504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _DPMetadataRequiredKeys()
{
  if (_DPMetadataRequiredKeys_onceToken != -1) {
    dispatch_once(&_DPMetadataRequiredKeys_onceToken, &__block_literal_global_17);
  }
  uint64_t v0 = (void *)_DPMetadataRequiredKeys__DPMetadataRequiredKeys;
  return v0;
}

id _DPMetadataOptionalKeys()
{
  if (_DPMetadataOptionalKeys_onceToken != -1) {
    dispatch_once(&_DPMetadataOptionalKeys_onceToken, &__block_literal_global_168);
  }
  uint64_t v0 = (void *)_DPMetadataOptionalKeys__DPMetadataOptionalKeys;
  return v0;
}

id _DPMetadataV2RequiredKeys()
{
  if (_DPMetadataV2RequiredKeys_onceToken != -1) {
    dispatch_once(&_DPMetadataV2RequiredKeys_onceToken, &__block_literal_global_170);
  }
  uint64_t v0 = (void *)_DPMetadataV2RequiredKeys__DPMetadataRequiredKeys;
  return v0;
}

id _DPMetadataV2OptionalKeys()
{
  if (_DPMetadataV2OptionalKeys_onceToken != -1) {
    dispatch_once(&_DPMetadataV2OptionalKeys_onceToken, &__block_literal_global_172);
  }
  uint64_t v0 = (void *)_DPMetadataV2OptionalKeys__DPMetadataOptionalKeys;
  return v0;
}

id _DPMetadataExpectedClasses()
{
  if (_DPMetadataExpectedClasses_onceToken != -1) {
    dispatch_once(&_DPMetadataExpectedClasses_onceToken, &__block_literal_global_174);
  }
  uint64_t v0 = (void *)_DPMetadataExpectedClasses__DPMetadataExpectedClassesSet;
  return v0;
}

uint64_t _DPMetadataIsV2(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"Version"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = [v1 isEqualToString:@"2.0"];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _DPMetadataIsDPMechanismNone(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"DediscoTaskConfig"];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"DPConfig"];
  int8x16_t v3 = [v2 objectForKeyedSubscript:@"Mechanism"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 isEqualToString:@"None"];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL isEqualToOne(double a1)
{
  return vabdd_f64(1.0, a1) <= 2.22044605e-16;
}

BOOL areEqualTimeIntervals(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.0000001;
}

double uniformRandomProbability()
{
  return (double)arc4random() / 4294967300.0;
}

double uniformRandomProbabilityExcludingOne()
{
  return (double)arc4random() * 2.32830644e-10;
}

BOOL isInvalidEpsilon(double a1)
{
  return *(double *)&epsilonMAX < a1 || a1 < 0.0;
}

BOOL isNonZeroPowerOfTwo(uint64_t a1)
{
  return a1 && (a1 & (a1 - 1)) == 0;
}

unint64_t nextPowerOfTwo(unint64_t result)
{
  int v1 = 0;
  if (result)
  {
    unint64_t v2 = result;
    do
    {
      ++v1;
      BOOL v3 = v2 >= 2;
      v2 >>= 1;
    }
    while (v3);
  }
  if ((unint64_t)(1 << v1) >> 1 != result || v1 == 0) {
    return 1 << v1;
  }
  return result;
}

uint64_t submod32(unsigned int a1, unsigned int a2, int a3)
{
  if (a1 >= a2) {
    a3 = 0;
  }
  return a1 - a2 + a3;
}

uint64_t addmod32(unsigned int a1, int a2, int a3)
{
  if (a1 >= a3 - a2) {
    int v3 = 0;
  }
  else {
    int v3 = a3;
  }
  return a1 - (a3 - a2) + v3;
}

unint64_t mulmod32(unsigned int a1, unsigned int a2, unsigned int a3)
{
  return a2 * (unint64_t)a1 % a3;
}

uint64_t dotprod_mod32(unsigned int *a1, unsigned int *a2, uint64_t a3, unsigned int a4)
{
  for (uint64_t i = 0; a3; --a3)
  {
    unsigned int v6 = *a1++;
    unsigned int v5 = v6;
    unsigned int v7 = *a2++;
    unsigned int v8 = v7 * (unint64_t)v5 % a4;
    unsigned int v9 = a4 - i;
    BOOL v10 = v8 >= v9;
    unsigned int v11 = v8 - v9;
    if (v10) {
      unsigned int v12 = 0;
    }
    else {
      unsigned int v12 = a4;
    }
    uint64_t i = v11 + v12;
  }
  return i;
}

long double logaddexp(double a1, double a2)
{
  double v2 = a1 - a2;
  if (a1 - a2 <= 0.0)
  {
    double v3 = a2;
  }
  else
  {
    double v2 = -(a1 - a2);
    double v3 = a1;
  }
  long double v4 = exp(v2);
  return log1p(v4) + v3;
}

id _DPDaemonInterface()
{
  v9[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  v9[3] = objc_opt_class();
  int v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  double v2 = [v0 setWithArray:v1];

  double v3 = (void *)MEMORY[0x1E4F1CAD0];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  long double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  unsigned int v5 = [v3 setWithArray:v4];

  unsigned int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F37A2B50];
  [v6 setClasses:v2 forSelector:sel_recordNumbers_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordNumbers_metadata_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordNumbersVectors_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordNumbersVectors_metadata_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordBitValues_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordBitValues_metadata_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordStrings_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v2 forSelector:sel_recordWords_forKey_withReply_ argumentIndex:0 ofReply:0];
  [v6 setClasses:v5 forSelector:sel_reportsNotYetSubmittedWithReply_ argumentIndex:1 ofReply:1];
  [v6 setClasses:v5 forSelector:sel_retireReports_withReply_ argumentIndex:0 ofReply:0];

  return v6;
}

id _DPDediscoPrioPiRapporShare.__allocating_init(prioShare:numberOfEncodedIndices:piRapporOtherPhi:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v11 = (char *)objc_allocWithZone(v5);
  unsigned int v12 = &v11[OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare];
  *(void *)unsigned int v12 = a1;
  *((void *)v12 + 1) = a2;
  *(void *)&v11[OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices] = a3;
  uint64_t v13 = &v11[OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi];
  *(void *)uint64_t v13 = a4;
  *((void *)v13 + 1) = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return objc_msgSendSuper2(&v15, sel_init);
}

id _DPDediscoPrioPiRapporShare.init(prioShare:numberOfEncodedIndices:piRapporOtherPhi:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6 = &v5[OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare];
  *(void *)unsigned int v6 = a1;
  *((void *)v6 + 1) = a2;
  *(void *)&v5[OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices] = a3;
  unsigned int v7 = &v5[OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi];
  *(void *)unsigned int v7 = a4;
  *((void *)v7 + 1) = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for _DPDediscoPrioPiRapporShare();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for _DPDediscoPrioPiRapporShare()
{
  return self;
}

id _DPDediscoPrioPiRapporShare.__allocating_init(serializedData:)(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return _DPDediscoPrioPiRapporShare.init(serializedData:)(a1, a2);
}

id _DPDediscoPrioPiRapporShare.init(serializedData:)(uint64_t a1, unint64_t a2)
{
  id v4 = v2;
  sub_1DC5BFB10();
  MEMORY[0x1F4188790]();
  type metadata accessor for DediscoPrioPiRapporShare();
  MEMORY[0x1F4188790]();
  unsigned int v8 = (uint64_t *)((char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  sub_1DC5B3974(a1, a2);
  sub_1DC5BFB00();
  sub_1DC5B39CC();
  sub_1DC5BFB80();
  if (v3)
  {
    sub_1DC5B3A24(a1, a2);
    swift_getObjectType();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v9 = *v8;
    unint64_t v10 = v8[1];
    sub_1DC5B3974(*v8, v10);
    unsigned int v11 = (void *)sub_1DC5BFAB0();
    sub_1DC5B3A24(v9, v10);
    uint64_t v12 = v8[3];
    uint64_t v18 = v8[2];
    unint64_t v13 = v8[4];
    sub_1DC5B3974(v12, v13);
    uint64_t v14 = (void *)sub_1DC5BFAB0();
    sub_1DC5B3A24(v12, v13);
    id v4 = objc_msgSend(v2, sel_initWithPrioShare_numberOfEncodedIndices_piRapporOtherPhi_, v11, v18, v14);

    sub_1DC5B3A24(a1, a2);
    sub_1DC5B3A7C((uint64_t)v8);
  }
  return v4;
}

uint64_t sub_1DC5B3974(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

unint64_t sub_1DC5B39CC()
{
  unint64_t result = qword_1EAA97238;
  if (!qword_1EAA97238)
  {
    type metadata accessor for DediscoPrioPiRapporShare();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA97238);
  }
  return result;
}

uint64_t sub_1DC5B3A24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1DC5B3A7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DediscoPrioPiRapporShare();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DC5B3B84()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
  sub_1DC5B3974(v1, *(void *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare + 8));
  return v1;
}

uint64_t sub_1DC5B3BD0()
{
  return *(void *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices);
}

uint64_t sub_1DC5B3BF0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  sub_1DC5B3974(v1, *(void *)(v0 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi + 8));
  return v1;
}

id sub_1DC5B3C3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (uint64_t *)(a1 + *a3);
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  sub_1DC5B3974(*v3, v5);
  unsigned int v6 = (void *)sub_1DC5BFAB0();
  sub_1DC5B3A24(v4, v5);
  return v6;
}

uint64_t sub_1DC5B3CA8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare);
  unint64_t v5 = *(void *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_prioShare + 8);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  sub_1DC5B3974(v4, v5);
  sub_1DC5B3A24(v6, v7);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = *(void *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_numberOfEncodedIndices);
  uint64_t v8 = a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi;
  uint64_t v9 = *(void *)(a2 + OBJC_IVAR____DPDediscoPrioPiRapporShare_piRapporOtherPhi);
  unint64_t v10 = *(void *)(v8 + 8);
  uint64_t v11 = a1[3];
  unint64_t v12 = a1[4];
  sub_1DC5B3974(v9, v10);
  uint64_t result = sub_1DC5B3A24(v11, v12);
  a1[3] = v9;
  a1[4] = v10;
  return result;
}

uint64_t sub_1DC5B3D5C()
{
  type metadata accessor for DediscoPrioPiRapporShare();
  MEMORY[0x1F4188790]();
  uint64_t v2 = &v5[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = v0;
  sub_1DC5B39CC();
  sub_1DC5BFBC0();
  uint64_t v3 = sub_1DC5BFB90();
  sub_1DC5B3A7C((uint64_t)v2);
  return v3;
}

uint64_t sub_1DC5B3E50(uint64_t *a1)
{
  return sub_1DC5B3CA8(a1, *(void *)(v1 + 16));
}

id _DPDediscoPrioPiRapporShare.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void _DPDediscoPrioPiRapporShare.init()()
{
}

id _DPDediscoPrioPiRapporShare.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _DPDediscoPrioPiRapporShare();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for _DPDediscoPrioPiRapporShare(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for _DPDediscoPrioPiRapporShare);
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.__allocating_init(prioShare:numberOfEncodedIndices:piRapporOtherPhi:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.getPrioShare()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.getNumberOfEncodedIndices()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.getPiRapporOtherPhi()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of _DPDediscoPrioPiRapporShare.serialize()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t sub_1DC5B4210(uint64_t *a1)
{
  return sub_1DC5B3E50(a1);
}

unint64_t PINEShim.PINEType.init(rawValue:)(int a1)
{
  uint64_t v1 = 4294905860;
  uint64_t v2 = 4294905861;
  uint64_t v3 = 4294905862;
  if (a1 != -61434) {
    uint64_t v3 = 0;
  }
  if (a1 == -61435)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v2 = v3;
    BOOL v4 = a1 != -61434;
  }
  if (a1 == -61436)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v1 = v2;
    BOOL v5 = v4;
  }
  return v1 | ((unint64_t)v5 << 32);
}

BOOL sub_1DC5B4280(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DC5B4294()
{
  return sub_1DC5BFDC0();
}

uint64_t sub_1DC5B42DC()
{
  return sub_1DC5BFDB0();
}

uint64_t sub_1DC5B4308()
{
  return sub_1DC5BFDC0();
}

int *sub_1DC5B434C@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *result;
  BOOL v3 = (*result + 61433) < 0xFFFFFFFD;
  if ((*result + 61433) < 0xFFFFFFFD) {
    int v2 = 0;
  }
  *(_DWORD *)a2 = v2;
  *(unsigned char *)(a2 + 4) = v3;
  return result;
}

void sub_1DC5B4370(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t PINEShim.Parameter.fractionalBitCount.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
}

float PINEShim.Parameter.l2NormBound.getter()
{
  return *(float *)(v0 + OBJC_IVAR____DPPINEParameter_l2NormBound);
}

uint64_t PINEShim.Parameter.numOfProofs.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPINEParameter_numOfProofs);
}

uint64_t PINEShim.Parameter.wraparoundCheckCount.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPINEParameter_wraparoundCheckCount);
}

uint64_t PINEShim.Parameter.pineType.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____DPPINEParameter_pineType);
}

id PINEShim.Parameter.__allocating_init(fractionalBitCount:l2NormBound:numOfProofs:wraparoundCheckCount:pineType:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, float a5)
{
  uint64_t v11 = (char *)objc_allocWithZone(v5);
  *(void *)&v11[OBJC_IVAR____DPPINEParameter_fractionalBitCount] = a1;
  *(float *)&v11[OBJC_IVAR____DPPINEParameter_l2NormBound] = a5;
  *(void *)&v11[OBJC_IVAR____DPPINEParameter_numOfProofs] = a2;
  *(void *)&v11[OBJC_IVAR____DPPINEParameter_wraparoundCheckCount] = a3;
  *(_DWORD *)&v11[OBJC_IVAR____DPPINEParameter_pineType] = a4;
  v13.receiver = v11;
  v13.super_class = v5;
  return objc_msgSendSuper2(&v13, sel_init);
}

id PINEShim.Parameter.init(fractionalBitCount:l2NormBound:numOfProofs:wraparoundCheckCount:pineType:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, float a5)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v5[OBJC_IVAR____DPPINEParameter_fractionalBitCount] = a1;
  *(float *)&v5[OBJC_IVAR____DPPINEParameter_l2NormBound] = a5;
  *(void *)&v5[OBJC_IVAR____DPPINEParameter_numOfProofs] = a2;
  *(void *)&v5[OBJC_IVAR____DPPINEParameter_wraparoundCheckCount] = a3;
  *(_DWORD *)&v5[OBJC_IVAR____DPPINEParameter_pineType] = a4;
  v13.receiver = v5;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

void PINEShim.Parameter.init()()
{
}

uint64_t PINEShim.ShardResult.publicShare.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____DPPINEShardResult_publicShare);
  sub_1DC5B3974(v1, *(void *)(v0 + OBJC_IVAR____DPPINEShardResult_publicShare + 8));
  return v1;
}

uint64_t PINEShim.ShardResult.inputShares.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PINEShim.ShardResult.nonce.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____DPPINEShardResult_nonce);
  sub_1DC5B3974(v1, *(void *)(v0 + OBJC_IVAR____DPPINEShardResult_nonce + 8));
  return v1;
}

uint64_t PINEShim.ShardResult.dimension.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____DPPINEShardResult_dimension);
}

uint64_t PINEShim.ShardResult.chunkLength.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____DPPINEShardResult_chunkLength);
}

uint64_t PINEShim.ShardResult.chunkLengthNormEquality.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____DPPINEShardResult_chunkLengthNormEquality);
}

uint64_t PINEShim.ShardResult.l2NormBoundInt.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPINEShardResult_l2NormBoundInt);
}

uint64_t PINEShim.ShardResult.fractionalBitCount.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPINEShardResult_fractionalBitCount);
}

objc_class *PINEShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:chunkLengthNormEquality:l2NormBoundInt:fractionalBitCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  id v18 = objc_allocWithZone(v10);
  return PINEShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:chunkLengthNormEquality:l2NormBoundInt:fractionalBitCount:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

objc_class *PINEShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:chunkLengthNormEquality:l2NormBoundInt:fractionalBitCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result = (objc_class *)swift_getObjectType();
  int64x2_t v20 = &v10[OBJC_IVAR____DPPINEShardResult_publicShare];
  *(void *)int64x2_t v20 = a1;
  *((void *)v20 + 1) = a2;
  *(void *)&v10[OBJC_IVAR____DPPINEShardResult_inputShares] = a3;
  unint64_t v21 = &v10[OBJC_IVAR____DPPINEShardResult_nonce];
  *(void *)unint64_t v21 = a4;
  *((void *)v21 + 1) = a5;
  if ((a6 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (HIDWORD(a6))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  *(_DWORD *)&v10[OBJC_IVAR____DPPINEShardResult_dimension] = a6;
  if ((a7 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(a7))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  *(_DWORD *)&v10[OBJC_IVAR____DPPINEShardResult_chunkLength] = a7;
  if ((a8 & 0x8000000000000000) != 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!HIDWORD(a8))
  {
    *(_DWORD *)&v10[OBJC_IVAR____DPPINEShardResult_chunkLengthNormEquality] = a8;
    *(void *)&v10[OBJC_IVAR____DPPINEShardResult_l2NormBoundInt] = a9;
    *(void *)&v10[OBJC_IVAR____DPPINEShardResult_fractionalBitCount] = a10;
    v22.receiver = v10;
    v22.super_class = result;
    return (objc_class *)objc_msgSendSuper2(&v22, sel_init);
  }
LABEL_13:
  __break(1u);
  return result;
}

id PINEShim.ShardResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PINEShim.ShardResult.init()()
{
}

id _s19DifferentialPrivacy8PINEShimC9ParameterCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PINEShim.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PINEShim();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for PINEShim()
{
  return self;
}

void *sub_1DC5B4C8C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v7, a3, (a4 - a3) / 4, &v6);
    if (v4) {
      return result;
    }
    return (void *)v7;
  }
  uint64_t result = a1(&v7, 0, 0, &v6);
  if (!v4) {
    return (void *)v7;
  }
  return result;
}

uint64_t sub_1DC5B4D14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X3>, uint64_t *a4@<X4>, unint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t *a8@<X8>, void *a9, uint64_t (*a10)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t), uint64_t *a11)
{
  uint64_t v14 = *a3;
  unint64_t v15 = a3[1];
  uint64_t v16 = *a4;
  unint64_t v17 = a4[1];
  sub_1DC5B3974(*a3, v15);
  sub_1DC5B3974(v16, v17);
  uint64_t v18 = a10(a1, a2, v14, v15, v16, v17);
  if (v34)
  {
    sub_1DC5B3A24(v16, v17);
    uint64_t result = sub_1DC5B3A24(v14, v15);
    *a9 = v34;
  }
  else
  {
    uint64_t v22 = v20;
    uint64_t v35 = v18;
    uint64_t v29 = v19;
    sub_1DC5B3A24(v16, v17);
    sub_1DC5B3A24(v14, v15);
    uint64_t v24 = *a3;
    unint64_t v23 = a3[1];
    sub_1DC5B3974(v24, v23);
    __swift_instantiateConcreteTypeFromMangledName(a11);
    unint64_t v25 = sub_1DC5BFC40();
    unint64_t v26 = sub_1DC5BFC80();
    uint64_t v27 = *(void *)(a7 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
    id v28 = objc_allocWithZone((Class)type metadata accessor for PINEShim.ShardResult());
    uint64_t result = (uint64_t)PINEShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:chunkLengthNormEquality:l2NormBoundInt:fractionalBitCount:)(v35, v29, v22, v24, v23, a5, v25, v26, a6, v27);
    *a8 = result;
  }
  return result;
}

uint64_t static PINEShim.shard(_:parameter:)(void *a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + OBJC_IVAR____DPPINEParameter_pineType);
  switch(v2)
  {
    case -61434:
      return sub_1DC5B5CCC(a1, a2);
    case -61435:
      return sub_1DC5B58C8(a1, a2);
    case -61436:
      return sub_1DC5B54C4(a1, a2);
  }
  uint64_t result = sub_1DC5BFD90();
  __break(1u);
  return result;
}

BOOL static PINEShim.isValidPINEType(_:)(BOOL result)
{
  if (!HIDWORD(result)) {
    return (result + 61436) < 3;
  }
  __break(1u);
  return result;
}

BOOL static PINEShim.isValidNumOfProofs(_:)(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 4;
}

BOOL static PINEShim.isValidWraparoundCheckCount(_:)(unint64_t a1)
{
  return a1 > 0x1D;
}

id PINEShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PINEShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DC5B512C(uint64_t *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  switch(v1 >> 62)
  {
    case 1uLL:
      *(void *)&long long bytes = *a1;
      *((void *)&bytes + 1) = v1 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_1DC5B53D0((int *)&bytes);
      uint64_t v5 = bytes;
      unint64_t v6 = *((void *)&bytes + 1) | 0x4000000000000000;
      goto LABEL_15;
    case 2uLL:
      *(void *)&long long bytes = *a1;
      *((void *)&bytes + 1) = v1 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1DC5BFA80();
      uint64_t v7 = *((void *)&bytes + 1);
      uint64_t v9 = *(void *)(bytes + 16);
      uint64_t v8 = *(void *)(bytes + 24);
      uint64_t v10 = sub_1DC5BFA20();
      if (!v10)
      {
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_1DC5BFA50();
      uint64_t v13 = v9 - v12;
      if (__OFSUB__(v9, v12))
      {
        __break(1u);
LABEL_18:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v8, v9);
      int64_t v15 = v8 - v9;
      if (v14) {
        goto LABEL_18;
      }
      uint64_t v16 = sub_1DC5BFA40();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v17, (void *)(v11 + v13));
      if (result)
      {
LABEL_20:
        sub_1DC5BFD80();
        __break(1u);
        JUMPOUT(0x1DC5B53C0);
      }
      *a1 = bytes;
      a1[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&bytes + 7) = 0;
      *(void *)&long long bytes = 0;
      uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0, &bytes);
      if (result) {
        goto LABEL_20;
      }
      return result;
    default:
      LOWORD(bytes) = *a1;
      BYTE2(bytes) = BYTE2(v2);
      BYTE3(bytes) = BYTE3(v2);
      BYTE4(bytes) = BYTE4(v2);
      BYTE5(bytes) = BYTE5(v2);
      BYTE6(bytes) = BYTE6(v2);
      BYTE7(bytes) = HIBYTE(v2);
      WORD4(bytes) = v1;
      BYTE10(bytes) = BYTE2(v1);
      BYTE11(bytes) = BYTE3(v1);
      BYTE12(bytes) = BYTE4(v1);
      BYTE13(bytes) = BYTE5(v1);
      BYTE14(bytes) = BYTE6(v1);
      uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], BYTE6(v1), &bytes);
      if (result) {
        goto LABEL_20;
      }
      uint64_t v5 = bytes;
      unint64_t v6 = DWORD2(bytes) | ((unint64_t)BYTE12(bytes) << 32) | ((unint64_t)BYTE13(bytes) << 40) | ((unint64_t)BYTE14(bytes) << 48);
LABEL_15:
      *a1 = v5;
      a1[1] = v6;
      return result;
  }
}

uint64_t sub_1DC5B53D0(int *a1)
{
  sub_1DC5BFA90();
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if ((int)v3 < (int)v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = sub_1DC5BFA20();
  if (!v4)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    uint64_t result = sub_1DC5BFD80();
    __break(1u);
    return result;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_1DC5BFA50();
  uint64_t v7 = v2 - v6;
  if (__OFSUB__(v2, v6))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int64_t v8 = v3 - v2;
  uint64_t v9 = sub_1DC5BFA40();
  if (v9 >= v8) {
    size_t v10 = v8;
  }
  else {
    size_t v10 = v9;
  }
  uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v10, (void *)(v5 + v7));
  if (result) {
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_1DC5B54C4(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA972B0);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)objc_msgSend(a1, sel_length);
  int64_t v8 = v7 + 3;
  int v9 = *(_DWORD *)(a2 + OBJC_IVAR____DPPINEParameter_l2NormBound);
  if ((uint64_t)v7 >= 0) {
    int64_t v8 = v7;
  }
  uint64_t v33 = (uint64_t)v8;
  LODWORD(v39) = v9;
  uint64_t v36 = a2;
  uint64_t v10 = *(void *)(a2 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
  uint64_t v11 = sub_1DC5BFD10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA972B8);
  sub_1DC5BFC20();
  uint64_t v12 = sub_1DC5B6380(&qword_1EAA972C0, MEMORY[0x1E4FB3978]);
  sub_1DC5B61E0();
  unint64_t v28 = sub_1DC5B6284();
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  uint64_t v13 = v41;
  uint64_t v41 = sub_1DC5BFC60();
  if (!v13)
  {
    v33 >>= 2;
    BOOL v14 = a1;
    int64_t v15 = v6;
    uint64_t v16 = v36;
    v30[1] = *(void *)(v36 + OBJC_IVAR____DPPINEParameter_numOfProofs);
    sub_1DC5BFC30();
    v27[0] = *(void *)(v16 + OBJC_IVAR____DPPINEParameter_wraparoundCheckCount);
    v27[1] = v35;
    sub_1DC5BFC50();
    uint64_t v17 = sub_1DC5BFC90();
    uint64_t v39 = sub_1DC5B8D70(v17);
    unint64_t v40 = v18;
    sub_1DC5B8750(&v39, 0);
    uint64_t v19 = v14;
    sub_1DC5B512C(&v39);
    uint64_t v20 = v32;
    uint64_t v21 = sub_1DC5BFC70();
    uint64_t v37 = sub_1DC5B8D70(v21);
    unint64_t v38 = v22;
    sub_1DC5B8750(&v37, 0);
    sub_1DC5B512C(&v37);
    id v23 = v19;
    id v24 = objc_msgSend(v23, sel_bytes);
    [v23 (SEL)0x1F6C20198];
    MEMORY[0x1F4188790]();
    v27[2] = v15;
    v27[3] = &v39;
    v27[4] = &v37;
    v27[5] = v33;
    unint64_t v28 = v41;
    uint64_t v29 = v36;
    uint64_t v12 = (uint64_t)sub_1DC5B4C8C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t *))sub_1DC5B62D8, (uint64_t)v27, (uint64_t)v24, v25);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v20);
    sub_1DC5B3A24(v37, v38);
    sub_1DC5B3A24(v39, v40);
  }
  return v12;
}

uint64_t sub_1DC5B58C8(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA972D8);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)objc_msgSend(a1, sel_length);
  int64_t v8 = v7 + 3;
  int v9 = *(_DWORD *)(a2 + OBJC_IVAR____DPPINEParameter_l2NormBound);
  if ((uint64_t)v7 >= 0) {
    int64_t v8 = v7;
  }
  uint64_t v33 = (uint64_t)v8;
  LODWORD(v39) = v9;
  uint64_t v36 = a2;
  uint64_t v10 = *(void *)(a2 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
  uint64_t v11 = sub_1DC5BFCF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA972B8);
  sub_1DC5BFC20();
  uint64_t v12 = sub_1DC5B6380(&qword_1EAA972E0, MEMORY[0x1E4FB3958]);
  sub_1DC5B61E0();
  unint64_t v28 = sub_1DC5B6284();
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  uint64_t v13 = v41;
  uint64_t v41 = sub_1DC5BFC60();
  if (!v13)
  {
    v33 >>= 2;
    BOOL v14 = a1;
    int64_t v15 = v6;
    uint64_t v16 = v36;
    v30[1] = *(void *)(v36 + OBJC_IVAR____DPPINEParameter_numOfProofs);
    sub_1DC5BFC30();
    v27[0] = *(void *)(v16 + OBJC_IVAR____DPPINEParameter_wraparoundCheckCount);
    v27[1] = v35;
    sub_1DC5BFC50();
    uint64_t v17 = sub_1DC5BFC90();
    uint64_t v39 = sub_1DC5B8D70(v17);
    unint64_t v40 = v18;
    sub_1DC5B8750(&v39, 0);
    uint64_t v19 = v14;
    sub_1DC5B512C(&v39);
    uint64_t v20 = v32;
    uint64_t v21 = sub_1DC5BFC70();
    uint64_t v37 = sub_1DC5B8D70(v21);
    unint64_t v38 = v22;
    sub_1DC5B8750(&v37, 0);
    sub_1DC5B512C(&v37);
    id v23 = v19;
    id v24 = objc_msgSend(v23, sel_bytes);
    [v23 (SEL)0x1F6C20198];
    MEMORY[0x1F4188790]();
    v27[2] = v15;
    v27[3] = &v39;
    v27[4] = &v37;
    v27[5] = v33;
    unint64_t v28 = v41;
    uint64_t v29 = v36;
    uint64_t v12 = (uint64_t)sub_1DC5B4C8C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t *))sub_1DC5B630C, (uint64_t)v27, (uint64_t)v24, v25);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v20);
    sub_1DC5B3A24(v37, v38);
    sub_1DC5B3A24(v39, v40);
  }
  return v12;
}

uint64_t sub_1DC5B5CCC(void *a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA972E8);
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v32 = v4;
  MEMORY[0x1F4188790]();
  uint64_t v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)objc_msgSend(a1, sel_length);
  int64_t v8 = v7 + 3;
  int v9 = *(_DWORD *)(a2 + OBJC_IVAR____DPPINEParameter_l2NormBound);
  if ((uint64_t)v7 >= 0) {
    int64_t v8 = v7;
  }
  uint64_t v33 = (uint64_t)v8;
  LODWORD(v39) = v9;
  uint64_t v36 = a2;
  uint64_t v10 = *(void *)(a2 + OBJC_IVAR____DPPINEParameter_fractionalBitCount);
  uint64_t v11 = sub_1DC5BFD00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA972B8);
  sub_1DC5BFC20();
  uint64_t v12 = sub_1DC5B6380(&qword_1EAA972F0, MEMORY[0x1E4FB3968]);
  sub_1DC5B61E0();
  unint64_t v28 = sub_1DC5B6284();
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  uint64_t v13 = v41;
  uint64_t v41 = sub_1DC5BFC60();
  if (!v13)
  {
    v33 >>= 2;
    BOOL v14 = a1;
    int64_t v15 = v6;
    uint64_t v16 = v36;
    v30[1] = *(void *)(v36 + OBJC_IVAR____DPPINEParameter_numOfProofs);
    sub_1DC5BFC30();
    v27[0] = *(void *)(v16 + OBJC_IVAR____DPPINEParameter_wraparoundCheckCount);
    v27[1] = v35;
    sub_1DC5BFC50();
    uint64_t v17 = sub_1DC5BFC90();
    uint64_t v39 = sub_1DC5B8D70(v17);
    unint64_t v40 = v18;
    sub_1DC5B8750(&v39, 0);
    uint64_t v19 = v14;
    sub_1DC5B512C(&v39);
    uint64_t v20 = v32;
    uint64_t v21 = sub_1DC5BFC70();
    uint64_t v37 = sub_1DC5B8D70(v21);
    unint64_t v38 = v22;
    sub_1DC5B8750(&v37, 0);
    sub_1DC5B512C(&v37);
    id v23 = v19;
    id v24 = objc_msgSend(v23, sel_bytes);
    [v23 (SEL)0x1F6C20198];
    MEMORY[0x1F4188790]();
    v27[2] = v15;
    v27[3] = &v39;
    v27[4] = &v37;
    v27[5] = v33;
    unint64_t v28 = v41;
    uint64_t v29 = v36;
    uint64_t v12 = (uint64_t)sub_1DC5B4C8C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t *))sub_1DC5B63C8, (uint64_t)v27, (uint64_t)v24, v25);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v20);
    sub_1DC5B3A24(v37, v38);
    sub_1DC5B3A24(v39, v40);
  }
  return v12;
}

unint64_t sub_1DC5B60D4()
{
  unint64_t result = qword_1EAA972A8;
  if (!qword_1EAA972A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA972A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PINEShim.PINEType()
{
  return &type metadata for PINEShim.PINEType;
}

uint64_t type metadata accessor for PINEShim.Parameter()
{
  return self;
}

uint64_t method lookup function for PINEShim.Parameter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PINEShim.Parameter);
}

uint64_t dispatch thunk of PINEShim.Parameter.__allocating_init(fractionalBitCount:l2NormBound:numOfProofs:wraparoundCheckCount:pineType:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for PINEShim.ShardResult()
{
  return self;
}

uint64_t method lookup function for PINEShim.ShardResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PINEShim.ShardResult);
}

uint64_t dispatch thunk of PINEShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:chunkLengthNormEquality:l2NormBoundInt:fractionalBitCount:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

unint64_t sub_1DC5B61E0()
{
  unint64_t result = qword_1EAA972C8;
  if (!qword_1EAA972C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAA972B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA972C8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DC5B6284()
{
  unint64_t result = qword_1EAA972D0;
  if (!qword_1EAA972D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA972D0);
  }
  return result;
}

uint64_t sub_1DC5B62D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1DC5B6340(a1, a2, a3, MEMORY[0x1E4FB3948], &qword_1EAA972B0, a4);
}

uint64_t sub_1DC5B630C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1DC5B6340(a1, a2, a3, MEMORY[0x1E4FB3938], &qword_1EAA972D8, a4);
}

uint64_t sub_1DC5B6340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t)@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X8>)
{
  return sub_1DC5B4D14(a1, a2, *(uint64_t **)(v6 + 24), *(uint64_t **)(v6 + 32), *(void *)(v6 + 40), *(void *)(v6 + 48), *(void *)(v6 + 56), a6, a3, a4, a5);
}

uint64_t sub_1DC5B6380(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DC5B63C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_1DC5B6340(a1, a2, a3, MEMORY[0x1E4FB3940], &qword_1EAA972E8, a4);
}

uint64_t *sub_1DC5B6404(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_1DC5B3974(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    unint64_t v10 = a2[4];
    sub_1DC5B3974(v9, v10);
    a1[3] = v9;
    a1[4] = v10;
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_1DC5BFAF0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_1DC5B6508(uint64_t a1, uint64_t a2)
{
  sub_1DC5B3A24(*(void *)a1, *(void *)(a1 + 8));
  sub_1DC5B3A24(*(void *)(a1 + 24), *(void *)(a1 + 32));
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1DC5BFAF0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t *sub_1DC5B658C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1DC5B3974(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  unint64_t v9 = a2[4];
  sub_1DC5B3974(v8, v9);
  a1[3] = v8;
  a1[4] = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1DC5BFAF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t *sub_1DC5B6640(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1DC5B3974(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_1DC5B3A24(v8, v9);
  a1[2] = a2[2];
  uint64_t v10 = a2[3];
  unint64_t v11 = a2[4];
  sub_1DC5B3974(v10, v11);
  uint64_t v12 = a1[3];
  unint64_t v13 = a1[4];
  a1[3] = v10;
  a1[4] = v11;
  sub_1DC5B3A24(v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = sub_1DC5BFAF0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_1DC5B6704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_1DC5BFAF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1DC5B6790(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1DC5B3A24(v6, v7);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a1 + 24);
  unint64_t v10 = *(void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = v8;
  sub_1DC5B3A24(v9, v10);
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_1DC5BFAF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1DC5B6838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DC5B684C);
}

uint64_t sub_1DC5B684C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = sub_1DC5BFAF0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1DC5B6908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DC5B691C);
}

void *sub_1DC5B691C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v7 = sub_1DC5BFAF0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 28);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for DediscoPrioPiRapporShare()
{
  uint64_t result = qword_1EAA972F8;
  if (!qword_1EAA972F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DC5B6A18()
{
  uint64_t result = sub_1DC5BFAF0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DC5B6AC0()
{
  uint64_t v0 = sub_1DC5BFC10();
  __swift_allocate_value_buffer(v0, qword_1EAA97AF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EAA97AF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA97328);
  unint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EAA97330) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DC5C63E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "prio_share";
  *(void *)(v6 + 8) = 10;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x1E4F70FD0];
  uint64_t v8 = sub_1DC5BFBF0();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "number_of_encoded_indices";
  *((void *)v10 + 1) = 25;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "pi_rappor_other_phi";
  *(void *)(v11 + 8) = 19;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_1DC5BFC00();
}

uint64_t sub_1DC5B6CC4()
{
  uint64_t result = sub_1DC5BFB40();
  if (!v0)
  {
    while (1)
    {
      if (v2) {
        return result;
      }
      switch(result)
      {
        case 3:
          goto LABEL_10;
        case 2:
          sub_1DC5BFB60();
          break;
        case 1:
LABEL_10:
          sub_1DC5BFB50();
          break;
      }
      uint64_t result = sub_1DC5BFB40();
    }
  }
  return result;
}

uint64_t sub_1DC5B6D7C()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = sub_1DC5BFBD0();
      if (!v1)
      {
LABEL_8:
        if (!v0[2] || (uint64_t result = sub_1DC5BFBE0(), !v1))
        {
          uint64_t v5 = v0[3];
          unint64_t v6 = v0[4];
          switch(v6 >> 62)
          {
            case 1uLL:
              if ((int)v5 != v5 >> 32) {
                goto LABEL_16;
              }
              goto LABEL_17;
            case 2uLL:
              if (*(void *)(v5 + 16) != *(void *)(v5 + 24)) {
                goto LABEL_16;
              }
              goto LABEL_17;
            case 3uLL:
              goto LABEL_17;
            default:
              if ((v6 & 0xFF000000000000) == 0) {
                goto LABEL_17;
              }
LABEL_16:
              uint64_t result = sub_1DC5BFBD0();
              if (!v1)
              {
LABEL_17:
                type metadata accessor for DediscoPrioPiRapporShare();
                uint64_t result = sub_1DC5BFAD0();
              }
              break;
          }
        }
      }
      return result;
  }
}

uint64_t sub_1DC5B6F18@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1DC5C63F0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0xC000000000000000;
  return sub_1DC5BFAE0();
}

unint64_t sub_1DC5B6F50()
{
  return 0xD000000000000018;
}

uint64_t sub_1DC5B6F70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = sub_1DC5BFAF0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_1DC5B6FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 28);
  uint64_t v5 = sub_1DC5BFAF0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*sub_1DC5B7050())()
{
  return nullsub_1;
}

uint64_t sub_1DC5B7078()
{
  return sub_1DC5B6CC4();
}

uint64_t sub_1DC5B7090()
{
  return sub_1DC5B6D7C();
}

uint64_t sub_1DC5B70AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DC5B7D00(&qword_1EAA97320, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
  return MEMORY[0x1F4127150](a1, a2, v4);
}

uint64_t sub_1DC5B712C@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EAA97218 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1DC5BFC10();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EAA97AF0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t sub_1DC5B71D4(uint64_t a1)
{
  uint64_t v2 = sub_1DC5B7D00((unint64_t *)&qword_1EAA97238, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
  return MEMORY[0x1F4127378](a1, v2);
}

uint64_t sub_1DC5B7240()
{
  return sub_1DC5BFDC0();
}

uint64_t sub_1DC5B7298()
{
  sub_1DC5B7D00((unint64_t *)&qword_1EAA97238, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
  return sub_1DC5BFBB0();
}

uint64_t sub_1DC5B7314()
{
  return sub_1DC5BFDC0();
}

uint64_t sub_1DC5B736C()
{
  return sub_1DC5B7D00(&qword_1EAA97308, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
}

uint64_t sub_1DC5B73B4()
{
  return sub_1DC5B7D00((unint64_t *)&qword_1EAA97238, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
}

uint64_t sub_1DC5B73FC()
{
  return sub_1DC5B7D00(&qword_1EAA97310, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
}

uint64_t sub_1DC5B7444()
{
  return sub_1DC5B7D00(&qword_1EAA97318, (void (*)(uint64_t))type metadata accessor for DediscoPrioPiRapporShare);
}

uint64_t sub_1DC5B748C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_1DC5B3974(a2, a3);
      uint64_t v10 = (char *)sub_1DC5BFA20();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_1DC5BFA50();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_1DC5BFA40();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1DC5B76F0);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_1DC5B3A24(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_1DC5BFA20();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_1DC5BFA50();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_1DC5BFA40();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_1DC5B7700(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1DC5B748C((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_1DC5B77D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_1DC5BFA20();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_1DC5BFA50();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_1DC5BFA40();
  sub_1DC5B748C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_1DC5B7890(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1DC5B7AF8);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_1DC5B3974(a3, a4);
                  sub_1DC5B3974(a1, a2);
                  char v17 = sub_1DC5B77D8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_1DC5B3A24(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_1DC5B3974(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_1DC5B77D8(v21, v22, v20, a3, a4);
                  sub_1DC5B3A24(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_1DC5B3974(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_1DC5B3974(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_1DC5B7700(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_1DC5B3A24(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_1DC5B7B28(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_1DC5BFAF0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((sub_1DC5B7890(*a1, a1[1], *a2, a2[1]) & 1) != 0
    && a1[2] == a2[2]
    && (sub_1DC5B7890(a1[3], a1[4], a2[3], a2[4]) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for DediscoPrioPiRapporShare();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v12(v10, (char *)a1 + *(int *)(v11 + 28), v4);
    v12(v8, (char *)a2 + *(int *)(v11 + 28), v4);
    sub_1DC5B7D00(&qword_1EAA97338, MEMORY[0x1E4F70E60]);
    char v13 = sub_1DC5BFD30();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t sub_1DC5B7D00(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t Prio3SumVectorShim.VDAFType.init(rawValue:)(int a1)
{
  uint64_t v1 = 4294905859;
  if (a1 != -61437) {
    uint64_t v1 = 0;
  }
  return v1 | ((unint64_t)(a1 != -61437) << 32);
}

_DWORD *sub_1DC5B7D74@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != -61437;
  if (*result == -61437) {
    int v3 = -61437;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v2;
  return result;
}

BOOL static Prio3SumVectorShim.isValidVDAFType(_:)(int a1)
{
  return a1 == -61437;
}

uint64_t Prio3SumVectorShim.Parameter.bitWidth.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth);
}

uint64_t Prio3SumVectorShim.Parameter.numOfAggregators.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators);
}

uint64_t Prio3SumVectorShim.Parameter.numberOfProofs.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs);
}

uint64_t Prio3SumVectorShim.Parameter.vdafType.getter()
{
  return *(unsigned int *)(v0 + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType);
}

id Prio3SumVectorShim.Parameter.__allocating_init(bitWidth:numOfAggregators:numOfProofs:vdafType:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  *(void *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth] = a1;
  *(void *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators] = a2;
  *(void *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs] = a3;
  *(_DWORD *)&v9[OBJC_IVAR____DPPrio3SumVectorParameter_vdafType] = a4;
  v11.receiver = v9;
  v11.super_class = v4;
  return objc_msgSendSuper2(&v11, sel_init);
}

id Prio3SumVectorShim.Parameter.init(bitWidth:numOfAggregators:numOfProofs:vdafType:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_bitWidth] = a1;
  *(void *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_numOfAggregators] = a2;
  *(void *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_numberOfProofs] = a3;
  *(_DWORD *)&v4[OBJC_IVAR____DPPrio3SumVectorParameter_vdafType] = a4;
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

void Prio3SumVectorShim.Parameter.init()()
{
}

uint64_t Prio3SumVectorShim.ShardResult.publicShare.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____DPVDAFShardResult_publicShare);
  sub_1DC5B3974(v1, *(void *)(v0 + OBJC_IVAR____DPVDAFShardResult_publicShare + 8));
  return v1;
}

uint64_t Prio3SumVectorShim.ShardResult.inputShares.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Prio3SumVectorShim.ShardResult.nonce.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____DPVDAFShardResult_nonce);
  sub_1DC5B3974(v1, *(void *)(v0 + OBJC_IVAR____DPVDAFShardResult_nonce + 8));
  return v1;
}

uint64_t Prio3SumVectorShim.ShardResult.dimension.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPVDAFShardResult_dimension);
}

uint64_t Prio3SumVectorShim.ShardResult.chunkLength.getter()
{
  return *(void *)(v0 + OBJC_IVAR____DPVDAFShardResult_chunkLength);
}

id Prio3SumVectorShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (char *)objc_allocWithZone(v7);
  uint64_t v16 = &v15[OBJC_IVAR____DPVDAFShardResult_publicShare];
  *(void *)uint64_t v16 = a1;
  *((void *)v16 + 1) = a2;
  *(void *)&v15[OBJC_IVAR____DPVDAFShardResult_inputShares] = a3;
  char v17 = &v15[OBJC_IVAR____DPVDAFShardResult_nonce];
  *(void *)char v17 = a4;
  *((void *)v17 + 1) = a5;
  *(void *)&v15[OBJC_IVAR____DPVDAFShardResult_dimension] = a6;
  *(void *)&v15[OBJC_IVAR____DPVDAFShardResult_chunkLength] = a7;
  v19.receiver = v15;
  v19.super_class = v7;
  return objc_msgSendSuper2(&v19, sel_init);
}

id Prio3SumVectorShim.ShardResult.init(publicShare:inputShares:nonce:dimension:chunkLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v16 = &v7[OBJC_IVAR____DPVDAFShardResult_publicShare];
  *(void *)uint64_t v16 = a1;
  *((void *)v16 + 1) = a2;
  *(void *)&v7[OBJC_IVAR____DPVDAFShardResult_inputShares] = a3;
  char v17 = &v7[OBJC_IVAR____DPVDAFShardResult_nonce];
  *(void *)char v17 = a4;
  *((void *)v17 + 1) = a5;
  *(void *)&v7[OBJC_IVAR____DPVDAFShardResult_dimension] = a6;
  *(void *)&v7[OBJC_IVAR____DPVDAFShardResult_chunkLength] = a7;
  v19.receiver = v7;
  v19.super_class = ObjectType;
  return objc_msgSendSuper2(&v19, sel_init);
}

id Prio3SumVectorShim.ShardResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void Prio3SumVectorShim.ShardResult.init()()
{
}

id Prio3SumVectorShim.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Prio3SumVectorShim();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for Prio3SumVectorShim()
{
  return self;
}

void static Prio3SumVectorShim.shard(_:parameter:)(void *a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + OBJC_IVAR____DPPrio3SumVectorParameter_vdafType) == -61437)
  {
    sub_1DC5B8E10(a1);
  }
  else
  {
    sub_1DC5BFD90();
    __break(1u);
  }
}

BOOL static Prio3SumVectorShim.isValidNumOfProofs(_:)(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 3;
}

id Prio3SumVectorShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Prio3SumVectorShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void *sub_1DC5B8750(void *result, int __c)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = result[1];
  uint64_t v4 = result;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_1DC5B8CDC((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1DC5BFA80();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_1DC5BFA20();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x1DC5B8934);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_1DC5BFA50();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_1DC5BFA40();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = memset((void *)(v11 + v13), __c, v17);
      *uint64_t v4 = __b;
      v4[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      return result;
    default:
      uint64_t __b = *result;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      uint64_t result = memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *uint64_t v4 = v5;
      v4[1] = v6;
      return result;
  }
}

uint64_t sub_1DC5B8944(uint64_t *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  unint64_t v1 = a1[1];
  switch(v1 >> 62)
  {
    case 1uLL:
      *(void *)&long long bytes = *a1;
      *((void *)&bytes + 1) = v1 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_1DC5B8BE8((int *)&bytes);
      uint64_t v5 = bytes;
      unint64_t v6 = *((void *)&bytes + 1) | 0x4000000000000000;
      goto LABEL_15;
    case 2uLL:
      *(void *)&long long bytes = *a1;
      *((void *)&bytes + 1) = v1 & 0x3FFFFFFFFFFFFFFFLL;
      sub_1DC5BFA80();
      uint64_t v7 = *((void *)&bytes + 1);
      uint64_t v9 = *(void *)(bytes + 16);
      uint64_t v8 = *(void *)(bytes + 24);
      uint64_t v10 = sub_1DC5BFA20();
      if (!v10)
      {
        __break(1u);
        goto LABEL_20;
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_1DC5BFA50();
      uint64_t v13 = v9 - v12;
      if (__OFSUB__(v9, v12))
      {
        __break(1u);
LABEL_18:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v8, v9);
      int64_t v15 = v8 - v9;
      if (v14) {
        goto LABEL_18;
      }
      uint64_t v16 = sub_1DC5BFA40();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v17, (void *)(v11 + v13));
      if (result)
      {
LABEL_20:
        sub_1DC5BFD80();
        __break(1u);
        JUMPOUT(0x1DC5B8BD8);
      }
      *a1 = bytes;
      a1[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      *(void *)((char *)&bytes + 7) = 0;
      *(void *)&long long bytes = 0;
      uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 0, &bytes);
      if (result) {
        goto LABEL_20;
      }
      return result;
    default:
      LOWORD(bytes) = *a1;
      BYTE2(bytes) = BYTE2(v2);
      BYTE3(bytes) = BYTE3(v2);
      BYTE4(bytes) = BYTE4(v2);
      BYTE5(bytes) = BYTE5(v2);
      BYTE6(bytes) = BYTE6(v2);
      BYTE7(bytes) = HIBYTE(v2);
      WORD4(bytes) = v1;
      BYTE10(bytes) = BYTE2(v1);
      BYTE11(bytes) = BYTE3(v1);
      BYTE12(bytes) = BYTE4(v1);
      BYTE13(bytes) = BYTE5(v1);
      BYTE14(bytes) = BYTE6(v1);
      uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], BYTE6(v1), &bytes);
      if (result) {
        goto LABEL_20;
      }
      uint64_t v5 = bytes;
      unint64_t v6 = DWORD2(bytes) | ((unint64_t)BYTE12(bytes) << 32) | ((unint64_t)BYTE13(bytes) << 40) | ((unint64_t)BYTE14(bytes) << 48);
LABEL_15:
      *a1 = v5;
      a1[1] = v6;
      return result;
  }
}

uint64_t sub_1DC5B8BE8(int *a1)
{
  sub_1DC5BFA90();
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if ((int)v3 < (int)v2)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = sub_1DC5BFA20();
  if (!v4)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    uint64_t result = sub_1DC5BFD80();
    __break(1u);
    return result;
  }
  uint64_t v5 = v4;
  uint64_t v6 = sub_1DC5BFA50();
  uint64_t v7 = v2 - v6;
  if (__OFSUB__(v2, v6))
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  int64_t v8 = v3 - v2;
  uint64_t v9 = sub_1DC5BFA40();
  if (v9 >= v8) {
    size_t v10 = v8;
  }
  else {
    size_t v10 = v9;
  }
  uint64_t result = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], v10, (void *)(v5 + v7));
  if (result) {
    goto LABEL_12;
  }
  return result;
}

char *sub_1DC5B8CDC(int *a1, int a2)
{
  uint64_t result = (char *)sub_1DC5BFA90();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)sub_1DC5BFA20();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = (char *)sub_1DC5BFA50();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_1DC5BFA40();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }
  return (char *)memset(&v7[v8], a2, v11);
}

uint64_t sub_1DC5B8D70(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1DC5BFA60();
      swift_allocObject();
      sub_1DC5BFA30();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1DC5BFAA0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void sub_1DC5B8E10(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA97390);
  uint64_t v42 = *(void *)(v3 - 8);
  uint64_t v43 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v48 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = a1;
  uint64_t v6 = sub_1DC5BFD60();
  uint64_t v7 = sub_1DC5BFD70();
  uint64_t v8 = sub_1DC5BFD60();
  uint64_t v9 = sub_1DC5BFD70();
  if (v6 < v8 || v9 < v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v10 = sub_1DC5BFD60();
  uint64_t v11 = sub_1DC5BFD70();

  if (v7 < v10 || v11 < v7) {
    goto LABEL_16;
  }
  if (__OFSUB__(v7, v6))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_1DC5BFCE0();
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EAA97398);
    sub_1DC5BFC20();
    sub_1DC5B9398();
    uint64_t v12 = sub_1DC5BFCB0();
    *(void *)&long long v46 = sub_1DC5B8D70(v12);
    *((void *)&v46 + 1) = v13;
    sub_1DC5B8750(&v46, 0);
    long long v47 = v46;
    sub_1DC5B8944((uint64_t *)&v47);
    uint64_t v14 = sub_1DC5BFCA0();
    *(void *)&long long v45 = sub_1DC5B8D70(v14);
    *((void *)&v45 + 1) = v15;
    sub_1DC5B8750(&v45, 0);
    long long v46 = v45;
    sub_1DC5B8944((uint64_t *)&v46);
    id v16 = v5;
    objc_msgSend(v16, sel_bytes);
    objc_msgSend(v16, sel_length);
    long long v17 = v47;
    long long v18 = v46;
    sub_1DC5B3974(v47, *((unint64_t *)&v47 + 1));
    sub_1DC5B3974(v18, *((unint64_t *)&v18 + 1));
    uint64_t v19 = sub_1DC5BFCD0();
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    sub_1DC5B3A24(v18, *((unint64_t *)&v18 + 1));
    sub_1DC5B3A24(v17, *((unint64_t *)&v17 + 1));
    uint64_t v39 = v21;
    uint64_t v40 = v19;
    uint64_t v41 = v23;
    id v24 = v16;
    sub_1DC5B3974(v17, *((unint64_t *)&v17 + 1));
    uint64_t v25 = sub_1DC5BFD60();
    uint64_t v26 = sub_1DC5BFD70();
    uint64_t v27 = sub_1DC5BFD60();
    uint64_t v28 = sub_1DC5BFD70();
    if (v25 >= v27 && v28 >= v25)
    {
      uint64_t v38 = v25;
      uint64_t v29 = sub_1DC5BFD60();
      uint64_t v30 = sub_1DC5BFD70();

      if (v26 >= v29 && v30 >= v26)
      {
        uint64_t v31 = v26 - v38;
        if (!__OFSUB__(v26, v38))
        {
          uint64_t v32 = v48;
          uint64_t v33 = sub_1DC5BFCC0();
          uint64_t v34 = (objc_class *)type metadata accessor for Prio3SumVectorShim.ShardResult();
          uint64_t v35 = (char *)objc_allocWithZone(v34);
          uint64_t v36 = &v35[OBJC_IVAR____DPVDAFShardResult_publicShare];
          uint64_t v37 = v39;
          *(void *)uint64_t v36 = v40;
          *((void *)v36 + 1) = v37;
          *(void *)&v35[OBJC_IVAR____DPVDAFShardResult_inputShares] = v41;
          *(_OWORD *)&v35[OBJC_IVAR____DPVDAFShardResult_nonce] = v17;
          *(void *)&v35[OBJC_IVAR____DPVDAFShardResult_dimension] = v31;
          *(void *)&v35[OBJC_IVAR____DPVDAFShardResult_chunkLength] = v33;
          v44.receiver = v35;
          v44.super_class = v34;
          objc_msgSendSuper2(&v44, sel_init);
          sub_1DC5B3A24(v18, *((unint64_t *)&v18 + 1));
          sub_1DC5B3A24(v17, *((unint64_t *)&v17 + 1));
          (*(void (**)(char *, uint64_t))(v42 + 8))(v32, v43);
          return;
        }
        goto LABEL_20;
      }
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
      return;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
}

unint64_t sub_1DC5B9294()
{
  unint64_t result = qword_1EAA97388;
  if (!qword_1EAA97388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA97388);
  }
  return result;
}

ValueMetadata *type metadata accessor for Prio3SumVectorShim.VDAFType()
{
  return &type metadata for Prio3SumVectorShim.VDAFType;
}

uint64_t type metadata accessor for Prio3SumVectorShim.Parameter()
{
  return self;
}

uint64_t method lookup function for Prio3SumVectorShim.Parameter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Prio3SumVectorShim.Parameter);
}

uint64_t dispatch thunk of Prio3SumVectorShim.Parameter.__allocating_init(bitWidth:numOfAggregators:numOfProofs:vdafType:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for Prio3SumVectorShim.ShardResult()
{
  return self;
}

uint64_t method lookup function for Prio3SumVectorShim.ShardResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for Prio3SumVectorShim.ShardResult);
}

uint64_t dispatch thunk of Prio3SumVectorShim.ShardResult.__allocating_init(publicShare:inputShares:nonce:dimension:chunkLength:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t sub_1DC5B9398()
{
  unint64_t result = qword_1EAA973A0;
  if (!qword_1EAA973A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EAA97398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EAA973A0);
  }
  return result;
}

void __one_time_setup_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "PPM reports directory creation failed with %@", v2, v3, v4, v5, v6);
}

void __one_time_setup_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Retired reports directory creation failed with %@", v2, v3, v4, v5, v6);
}

void __one_time_setup_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Reports directory creation failed with %@", v2, v3, v4, v5, v6);
}

void __one_time_setup_block_invoke_cold_4()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x26u);
}

void __one_time_setup_block_invoke_cold_5()
{
  __error();
  uint64_t v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2_5();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x22u);
}

void __one_time_setup_block_invoke_cold_6(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "Database directory does not need convertion to Data Vault", v1, 2u);
}

void __one_time_setup_block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Database directory creation failed with %@", v2, v3, v4, v5, v6);
}

uint64_t __getLBFEventManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLBFTrialIdentifiersClass_block_invoke_cold_1(v0);
}

uint64_t __getLBFTrialIdentifiersClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getLBFDprivacydEventClass_block_invoke_cold_1(v0);
}

uint64_t __getLBFDprivacydEventClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[_DPPrioValueRandomizer initWithEpsilon:parameters:](v0);
}

uint64_t sub_1DC5BFA20()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1DC5BFA30()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1DC5BFA40()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1DC5BFA50()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1DC5BFA60()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1DC5BFA70()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DC5BFA80()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1DC5BFA90()
{
  return MEMORY[0x1F40E4C08]();
}

uint64_t sub_1DC5BFAA0()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1DC5BFAB0()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1DC5BFAC0()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DC5BFAD0()
{
  return MEMORY[0x1F4127060]();
}

uint64_t sub_1DC5BFAE0()
{
  return MEMORY[0x1F4127078]();
}

uint64_t sub_1DC5BFAF0()
{
  return MEMORY[0x1F4127088]();
}

uint64_t sub_1DC5BFB00()
{
  return MEMORY[0x1F4127110]();
}

uint64_t sub_1DC5BFB10()
{
  return MEMORY[0x1F4127118]();
}

uint64_t sub_1DC5BFB20()
{
  return MEMORY[0x1F4127138]();
}

uint64_t sub_1DC5BFB40()
{
  return MEMORY[0x1F4127180]();
}

uint64_t sub_1DC5BFB50()
{
  return MEMORY[0x1F4127200]();
}

uint64_t sub_1DC5BFB60()
{
  return MEMORY[0x1F41272B8]();
}

uint64_t sub_1DC5BFB70()
{
  return MEMORY[0x1F4127330]();
}

uint64_t sub_1DC5BFB80()
{
  return MEMORY[0x1F4127340]();
}

uint64_t sub_1DC5BFB90()
{
  return MEMORY[0x1F4127348]();
}

uint64_t sub_1DC5BFBB0()
{
  return MEMORY[0x1F4127398]();
}

uint64_t sub_1DC5BFBC0()
{
  return MEMORY[0x1F41273A0]();
}

uint64_t sub_1DC5BFBD0()
{
  return MEMORY[0x1F4127458]();
}

uint64_t sub_1DC5BFBE0()
{
  return MEMORY[0x1F41274C8]();
}

uint64_t sub_1DC5BFBF0()
{
  return MEMORY[0x1F4127660]();
}

uint64_t sub_1DC5BFC00()
{
  return MEMORY[0x1F4127678]();
}

uint64_t sub_1DC5BFC10()
{
  return MEMORY[0x1F4127690]();
}

uint64_t sub_1DC5BFC20()
{
  return MEMORY[0x1F4167468]();
}

uint64_t sub_1DC5BFC30()
{
  return MEMORY[0x1F4167470]();
}

uint64_t sub_1DC5BFC40()
{
  return MEMORY[0x1F4167478]();
}

uint64_t sub_1DC5BFC50()
{
  return MEMORY[0x1F4167480]();
}

uint64_t sub_1DC5BFC60()
{
  return MEMORY[0x1F4167488]();
}

uint64_t sub_1DC5BFC70()
{
  return MEMORY[0x1F4167490]();
}

uint64_t sub_1DC5BFC80()
{
  return MEMORY[0x1F4167498]();
}

uint64_t sub_1DC5BFC90()
{
  return MEMORY[0x1F41674A0]();
}

uint64_t sub_1DC5BFCA0()
{
  return MEMORY[0x1F41674A8]();
}

uint64_t sub_1DC5BFCB0()
{
  return MEMORY[0x1F41674B0]();
}

uint64_t sub_1DC5BFCC0()
{
  return MEMORY[0x1F41674B8]();
}

uint64_t sub_1DC5BFCD0()
{
  return MEMORY[0x1F41674C0]();
}

uint64_t sub_1DC5BFCE0()
{
  return MEMORY[0x1F41674C8]();
}

uint64_t sub_1DC5BFCF0()
{
  return MEMORY[0x1F41674D0]();
}

uint64_t sub_1DC5BFD00()
{
  return MEMORY[0x1F41674D8]();
}

uint64_t sub_1DC5BFD10()
{
  return MEMORY[0x1F41674E0]();
}

uint64_t sub_1DC5BFD20()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DC5BFD30()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DC5BFD40()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DC5BFD50()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DC5BFD60()
{
  return MEMORY[0x1F40E6800]();
}

uint64_t sub_1DC5BFD70()
{
  return MEMORY[0x1F40E6808]();
}

uint64_t sub_1DC5BFD80()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DC5BFD90()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1DC5BFDA0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DC5BFDB0()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1DC5BFDC0()
{
  return MEMORY[0x1F4185EF8]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1F40C94C0](*(void *)&op, *(void *)&mode, *(void *)&alg, *(void *)&padding, iv, key, keyLength, tweak);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1F40C9528](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C9538](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return MEMORY[0x1F4116E58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDD8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE08]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1F412F928]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F950]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x1F4116E78]();
}

uint64_t OSASetDATaskingValue()
{
  return MEMORY[0x1F4116EA0]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

double lgamma_r(double a1, int *a2)
{
  MEMORY[0x1F40CC828](a2, a1);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log1p(long double __x)
{
  MEMORY[0x1F40CC890](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x1F40CD8D8]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x1F40CD8E0]();
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1F40CDD98]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1F40CDDA8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}