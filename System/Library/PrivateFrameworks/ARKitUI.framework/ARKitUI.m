BOOL isSessionLoadingMap(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  char v5;
  char v6;
  void *v7;
  BOOL v8;

  v1 = a1;
  v2 = [v1 configuration];
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v4 = [v1 configuration];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    v5 = objc_opt_isKindOfClass();

    v4 = [v1 configuration];
    if ((v5 & 1) == 0)
    {
      objc_opt_class();
      v6 = objc_opt_isKindOfClass();

      if ((v6 & 1) == 0)
      {
        v8 = 0;
        goto LABEL_6;
      }
      v4 = [v1 configuration];
    }
  }
  v7 = [v4 initialWorldMap];
  v8 = v7 != 0;

LABEL_6:
  return v8;
}

uint64_t isSessionValidForCoaching(uint64_t result)
{
  if (result) {
    return [MEMORY[0x263F20E60] isSupported];
  }
  return result;
}

uint64_t validateCoachingGoalForSession(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3 || ![MEMORY[0x263F20E60] isSupported]) {
    goto LABEL_34;
  }
  v4 = [v3 configuration];
  if (a1 == 4)
  {
    if ([v4 isKindOfConfiguration:objc_opt_class()])
    {

LABEL_18:
      a1 = 4;
      goto LABEL_34;
    }
    v17 = [v3 configuration];

    if (!v17) {
      goto LABEL_18;
    }
LABEL_33:
    a1 = 0;
    goto LABEL_34;
  }
  char v5 = [v4 isKindOfConfiguration:objc_opt_class()];

  v6 = [v3 configuration];
  if (v5) {
    goto LABEL_12;
  }
  char v7 = [v6 isKindOfConfiguration:objc_opt_class()];

  v6 = [v3 configuration];
  if (v7) {
    goto LABEL_12;
  }
  char v8 = [v6 isKindOfConfiguration:objc_opt_class()];

  v6 = [v3 configuration];
  if (v8) {
    goto LABEL_12;
  }
  char v9 = [v6 isKindOfConfiguration:objc_opt_class()];

  v6 = [v3 configuration];
  if (v9) {
    goto LABEL_12;
  }
  int v10 = [v6 isKindOfConfiguration:objc_opt_class()];

  if (v10)
  {
    v6 = [v3 configuration];
LABEL_12:
    v11 = [v6 getAsKindOfConfiguration:objc_opt_class()];

    int v12 = [v11 planeDetection] & 1;
    unint64_t v13 = ((unint64_t)[v11 planeDetection] >> 1) & 1;

    goto LABEL_13;
  }
  LODWORD(v13) = 0;
  int v12 = 0;
LABEL_13:
  if (a1 == 1 && (v12 & 1) == 0)
  {
    v14 = _ARLogCoaching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = 0;
      v15 = "Coaching requires a horizontal plane, but session does not support horizontal plane detection. Turning off h"
            "orizontal plane requirement for coaching.";
      v16 = (uint8_t *)&v23;
LABEL_31:
      _os_log_impl(&dword_20B202000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (a1 == 2) {
    char v18 = v13;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    v14 = _ARLogCoaching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Coaching requires a vertical plane, but session does not support vertical plane detection. Turning off verti"
            "cal plane requirement for coaching.";
      v16 = buf;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (a1 == 3) {
    int v19 = v12;
  }
  else {
    int v19 = 1;
  }
  if (((v19 | v13) & 1) == 0)
  {
    v14 = _ARLogCoaching();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      v15 = "Coaching requires plane detection, but session does not support plane detection. Turning off plane requireme"
            "nt for coaching.";
      v16 = (uint8_t *)&v21;
      goto LABEL_31;
    }
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:

  return a1;
}

id _ARLogCoaching()
{
  if (_ARLogCoaching_onceToken != -1) {
    dispatch_once(&_ARLogCoaching_onceToken, &__block_literal_global);
  }
  v0 = (void *)_ARLogCoaching_logObj;

  return v0;
}

void ARCoachingEnumeratePlaneAnchors(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a1;
  v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v4[2](v4, v9);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void sub_20B20484C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B204C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  if (a20) {
    operator delete(a20);
  }

  _Unwind_Resume(a1);
}

void _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v3, a2);
    uint64_t v7 = &v6[v5];
    uint64_t v9 = &v6[16 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    long long v12 = v7;
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
      long long v10 = (char *)*a1;
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

void _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    long long v12 = v7;
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
      long long v10 = (char *)*a1;
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

void ___ZL13_ARLogGeneralv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral(void)::logObj;
  _ARLogGeneral(void)::logObj = (uint64_t)v0;
}

void _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2640009A0, MEMORY[0x263F8C060]);
}

void sub_20B204EE0(_Unwind_Exception *a1)
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

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

double ARFLDeceleratedRestPosition(double a1, double a2, double a3)
{
  return a2 / 1000.0 * a3 / (1.0 - a3) + a1;
}

double ARFLRubberbandValue(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0) {
    return a2;
  }
  if (a1 < a2) {
    a3 = -a3;
  }
  return a2 + (1.0 - 1.0 / (a4 * ((a1 - a2) / a3) + 1.0)) * a3;
}

double ARFLInverseRubberbandValue(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0) {
    return a2;
  }
  if (a1 < a2) {
    a3 = -a3;
  }
  return a2 + (-1.0 / ((a1 - a2) / a3 + -1.0) + -1.0) / a4 * a3;
}

id _ARLogCoaching_0()
{
  if (_ARLogCoaching_onceToken_0 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_0, &__block_literal_global_3);
  }
  os_log_t v0 = (void *)_ARLogCoaching_logObj_0;

  return v0;
}

id _ARLogGeneral()
{
  if (_ARLogGeneral_onceToken != -1) {
    dispatch_once(&_ARLogGeneral_onceToken, &__block_literal_global_155);
  }
  os_log_t v0 = (void *)_ARLogGeneral_logObj;

  return v0;
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

id _ARLogGeneral_0()
{
  if (_ARLogGeneral_onceToken_0 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_0, &__block_literal_global_83);
  }
  os_log_t v0 = (void *)_ARLogGeneral_logObj_0;

  return v0;
}

double ARFLSpringConvertStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double a3, double a4)
{
  double result = sqrt(a3);
  if (a1) {
    *a1 = a4 / (result + result);
  }
  if (a2)
  {
    double result = 6.28318531 / result;
    *a2 = result;
  }
  return result;
}

double ARFLSpringConvertMassStiffnessDampingToDampingRatioResponse(double *a1, double *a2, double result, double a4, double a5)
{
  if (a1)
  {
    double v5 = sqrt(result * a4);
    *a1 = a5 / (v5 + v5);
  }
  if (a2)
  {
    double result = 6.28318531 / sqrt(a4 / result);
    *a2 = result;
  }
  return result;
}

double ARFLSpringConvertDampingRatioResponseToStiffnessDamping(double *a1, double *a2, double result, double a4)
{
  double v4 = 6.28318531 / a4 * (6.28318531 / a4);
  if (a1) {
    *a1 = v4;
  }
  if (a2)
  {
    double v5 = sqrt(v4);
    double result = (v5 + v5) * result;
    *a2 = result;
  }
  return result;
}

double ARFLSpringConvertMassStiffnessDampingToStiffnessDamping(double *a1, double *a2, double result, double a4, double a5)
{
  double v5 = sqrt(a4 / result);
  double v6 = 6.28318531 / (6.28318531 / v5) * (6.28318531 / (6.28318531 / v5));
  if (a1) {
    *a1 = v6;
  }
  if (a2)
  {
    double v7 = sqrt(result * a4);
    double v8 = sqrt(v6);
    double result = a5 / (v7 + v7) * (v8 + v8);
    *a2 = result;
  }
  return result;
}

id _ARLogGeneral_1()
{
  if (_ARLogGeneral_onceToken_1 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_1, &__block_literal_global_5);
  }
  os_log_t v0 = (void *)_ARLogGeneral_logObj_1;

  return v0;
}

uint64_t operator==(uint64_t a1, uint64_t a2)
{
  uint32x4_t v2 = (uint32x4_t)vceqq_f32(*(float32x4_t *)a1, *(float32x4_t *)a2);
  v2.i32[3] = v2.i32[2];
  if ((vminvq_u32(v2) & 0x80000000) == 0) {
    return 0;
  }
  uint32x4_t v3 = (uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 16), *(float32x4_t *)(a2 + 16));
  v3.i32[3] = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) == 0) {
    return 0;
  }
  uint32x2_t v5 = (uint32x2_t)vceq_f32(*(float32x2_t *)(a1 + 32), *(float32x2_t *)(a2 + 32));
  return vpmin_u32(v5, v5).u32[0] >> 31;
}

void sub_20B20AEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id _ARLogGeneral(void)
{
  if (_ARLogGeneral(void)::onceToken != -1) {
    dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_6);
  }
  os_log_t v0 = (void *)_ARLogGeneral(void)::logObj;

  return v0;
}

{
  void *v0;
  uint64_t vars8;

  if (_ARLogGeneral(void)::onceToken != -1) {
    dispatch_once(&_ARLogGeneral(void)::onceToken, &__block_literal_global_7);
  }
  os_log_t v0 = (void *)_ARLogGeneral(void)::logObj;

  return v0;
}

void sub_20B20B6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20B93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20BA20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL13_ARLogGeneralv_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral(void)::logObj;
  _ARLogGeneral(void)::logObj = (uint64_t)v0;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

float32x4_t *std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::find<GTVertexData>(void *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  do
  {
    v3 ^= (v3 << 8) ^ (v3 >> 8) ^ *(void *)(a2 + v2);
    v2 += 8;
  }
  while (v2 != 48);
  int8x8_t v4 = (int8x8_t)a1[1];
  if (!*(void *)&v4) {
    return 0;
  }
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v4);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v6 = v3;
    if (v3 >= *(void *)&v4) {
      unint64_t v6 = v3 % *(void *)&v4;
    }
  }
  else
  {
    unint64_t v6 = (*(void *)&v4 - 1) & v3;
  }
  double v7 = *(float32x4_t ***)(*a1 + 8 * v6);
  if (!v7) {
    return 0;
  }
  for (double result = *v7; result; double result = (float32x4_t *)result->i64[0])
  {
    unint64_t v9 = result->u64[1];
    if (v9 == v3)
    {
      uint32x4_t v10 = (uint32x4_t)vceqq_f32(result[1], *(float32x4_t *)a2);
      v10.i32[3] = v10.i32[2];
      if ((vminvq_u32(v10) & 0x80000000) != 0)
      {
        uint32x4_t v11 = (uint32x4_t)vceqq_f32(result[2], *(float32x4_t *)(a2 + 16));
        v11.i32[3] = v11.i32[2];
        if ((vminvq_u32(v11) & 0x80000000) != 0)
        {
          uint32x2_t v12 = (uint32x2_t)vceq_f32(*(float32x2_t *)result[3].f32, *(float32x2_t *)(a2 + 32));
          if ((vpmin_u32(v12, v12).u32[0] & 0x80000000) != 0) {
            return result;
          }
        }
      }
    }
    else
    {
      if (v5.u32[0] > 1uLL)
      {
        if (v9 >= *(void *)&v4) {
          v9 %= *(void *)&v4;
        }
      }
      else
      {
        v9 &= *(void *)&v4 - 1;
      }
      if (v9 != v6) {
        return 0;
      }
    }
  }
  return result;
}

float32x4_t *std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__emplace_unique_key_args<GTVertexData,std::pair<GTVertexData,unsigned int>>(uint64_t a1, uint64_t a2, float32x4_t *a3)
{
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  do
  {
    v7 ^= (v7 << 8) ^ (v7 >> 8) ^ *(void *)(a2 + v6);
    v6 += 8;
  }
  while (v6 != 48);
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
    uint32x4_t v10 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v10)
    {
      uint32x4_t v11 = (float32x4_t *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11->u64[1];
          if (v12 == v7)
          {
            uint32x4_t v13 = (uint32x4_t)vceqq_f32(v11[1], *(float32x4_t *)a2);
            v13.i32[3] = v13.i32[2];
            if ((vminvq_u32(v13) & 0x80000000) != 0)
            {
              uint32x4_t v14 = (uint32x4_t)vceqq_f32(v11[2], *(float32x4_t *)(a2 + 16));
              v14.i32[3] = v14.i32[2];
              if ((vminvq_u32(v14) & 0x80000000) != 0)
              {
                uint32x2_t v15 = (uint32x2_t)vceq_f32(*(float32x2_t *)v11[3].f32, *(float32x2_t *)(a2 + 32));
                if ((vpmin_u32(v15, v15).u32[0] & 0x80000000) != 0) {
                  return v11;
                }
              }
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v3) {
              break;
            }
          }
          uint32x4_t v11 = (float32x4_t *)v11->i64[0];
        }
        while (v11);
      }
    }
  }
  uint32x4_t v11 = (float32x4_t *)operator new(0x50uLL);
  v11->i64[0] = 0;
  v11->i64[1] = v7;
  float32x4_t v16 = a3[1];
  v11[1] = *a3;
  v11[2] = v16;
  v11[3] = a3[2];
  v11[4].i32[0] = a3[3].i32[0];
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__rehash<true>(a1, v22);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
  }
  uint64_t v23 = *(void *)a1;
  v24 = *(float32x4_t ***)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    v11->i64[0] = (uint64_t)*v24;
LABEL_42:
    *v24 = v11;
    goto LABEL_43;
  }
  v11->i64[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (v11->i64[0])
  {
    unint64_t v25 = *(void *)(v11->i64[0] + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }
    else
    {
      v25 &= v8 - 1;
    }
    v24 = (float32x4_t **)(*(void *)a1 + 8 * v25);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_20B20BEF8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
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
    uint64_t v7 = *(void **)(a1 + 16);
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
      uint32x4_t v11 = (void *)*v7;
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
            *uint64_t v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint32x4_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint32x4_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint32x4_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<GTVertexData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

void *std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::clear(void *result)
{
  if (result[3])
  {
    v1 = result;
    double result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        double result = v2;
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

uint64_t std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_20B20C3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20CA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,uint64_t a29,uint64_t a30,id a31)
{
  objc_destroyWeak(v34);

  objc_destroyWeak(location);
  objc_destroyWeak(&a31);

  _Unwind_Resume(a1);
}

void sub_20B20CC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20CCB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20CD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20CDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)ARSCNCompositor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_20B20CED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20CF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20D02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20D228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20D45C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20D6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B20D908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20DA2C(_Unwind_Exception *a1)
{
  int8x8_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_20B20DAD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B20DB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL13_ARLogGeneralv_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "General");
  v1 = (void *)_ARLogGeneral(void)::logObj;
  _ARLogGeneral(void)::logObj = (uint64_t)v0;
}

__CFString *ARCoachingDeviceGlyphName()
{
  int v0 = ARDeviceIsiPad();
  int HasHomeButton = ARDeviceHasHomeButton();
  int v2 = HasHomeButton;
  if (v0)
  {
    uint64_t v3 = _ARLogCoaching_1();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPad with home button", buf, 2u);
      }
      unint64_t v5 = @"DeviceC";
    }
    else
    {
      if (v4)
      {
        *(_WORD *)unint64_t v12 = 0;
        _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPad without home button", v12, 2u);
      }
      unint64_t v5 = @"DeviceD";
    }
  }
  else if (HasHomeButton)
  {
    uint64_t v3 = _ARLogCoaching_1();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint32x4_t v11 = 0;
      _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPhone device with home button", v11, 2u);
    }
    unint64_t v5 = @"DeviceA";
  }
  else
  {
    int HasIsland = ARDeviceHasIsland();
    uint64_t v3 = _ARLogCoaching_1();
    BOOL v7 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (HasIsland)
    {
      if (v7)
      {
        *(_WORD *)uint32x4_t v10 = 0;
        _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPhone with island", v10, 2u);
      }
      unint64_t v5 = @"DeviceE";
    }
    else
    {
      if (v7)
      {
        *(_WORD *)uint8x8_t v9 = 0;
        _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "Loading glyph for iPhone device with notch", v9, 2u);
      }
      unint64_t v5 = @"DeviceB";
    }
  }

  return v5;
}

id _ARLogCoaching_1()
{
  if (_ARLogCoaching_onceToken_1 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_1, &__block_literal_global_8);
  }
  int v0 = (void *)_ARLogCoaching_logObj_1;

  return v0;
}

id ARCoachingLoadDeviceGlyph()
{
  int v0 = (void *)MEMORY[0x263F1C6B0];
  v1 = ARCoachingDeviceGlyphName();
  int v2 = ARKitUIBundle();
  uint64_t v3 = [v0 imageNamed:v1 inBundle:v2];

  return v3;
}

void sub_20B20F688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20B20F740(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double ARCoachingLayoutScalar()
{
  int v0 = ARDeviceIsiPad();
  double result = 0.75;
  if (v0) {
    return 1.0;
  }
  return result;
}

double ARCoachingMinimumActivationDelay(uint64_t a1)
{
  double result = 1.5;
  if (a1 == 4) {
    return 0.5;
  }
  return result;
}

double ARCoachingAdditionalActivationDelay(uint64_t a1, char a2)
{
  double result = 0.0;
  if (a1 != 4 && (a2 & 1) == 0)
  {
    int v3 = ARDeviceSupportsJasper();
    double result = 0.0;
    if (v3) {
      return 8.5;
    }
  }
  return result;
}

id _ARLogCoaching_2()
{
  if (_ARLogCoaching_onceToken_2 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_2, &__block_literal_global_365);
  }
  int v0 = (void *)_ARLogCoaching_logObj_2;

  return v0;
}

__CFString *getCoachingText(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      if (getMoveCoachingText_onceToken != -1) {
        dispatch_once(&getMoveCoachingText_onceToken, &__block_literal_global_384);
      }
      v1 = (void *)getMoveCoachingText_moveCoachingText;
      goto LABEL_17;
    case 2:
      if (getContinueCoachingText_onceToken != -1) {
        dispatch_once(&getContinueCoachingText_onceToken, &__block_literal_global_407);
      }
      v1 = (void *)getContinueCoachingText_continueCoachingText;
      goto LABEL_17;
    case 3:
      int v3 = ARKitCoreBundle();
      BOOL v4 = v3;
      unint64_t v5 = @"Return to the previous area to resume";
      goto LABEL_19;
    case 4:
      int v3 = ARKitCoreBundle();
      BOOL v4 = v3;
      unint64_t v5 = @"Move slowly";
      goto LABEL_19;
    case 5:
      int v3 = ARKitCoreBundle();
      BOOL v4 = v3;
      unint64_t v5 = &stru_26BF5E748;
      goto LABEL_19;
    case 6:
      int v3 = ARKitCoreBundle();
      BOOL v4 = v3;
      unint64_t v5 = @"Scan buildings across the street";
      goto LABEL_19;
    case 7:
      int v3 = ARKitCoreBundle();
      BOOL v4 = v3;
      unint64_t v5 = @"Keep scanning different buildings";
      goto LABEL_19;
    case 8:
      if (getGeoTrackingLookUpCoachingText_onceToken != -1) {
        dispatch_once(&getGeoTrackingLookUpCoachingText_onceToken, &__block_literal_global_421);
      }
      v1 = (void *)getGeoTrackingLookUpCoachingText_lookUpCoachingText;
LABEL_17:
      int v2 = v1;
      break;
    case 9:
      int v3 = ARKitCoreBundle();
      BOOL v4 = v3;
      unint64_t v5 = @"Slow down";
LABEL_19:
      int v2 = [v3 localizedStringForKey:v5 value:&stru_26BF5E748 table:@"Localizable_iOS"];

      break;
    default:
      int v2 = &stru_26BF5E748;
      break;
  }

  return v2;
}

void __getMoveCoachingText_block_invoke()
{
  ARDeviceClass();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:@"iPhone"])
  {
    int v0 = ARKitCoreBundle();
    v1 = v0;
    int v2 = @"Move iPhone to start";
  }
  else if ([v6 isEqualToString:@"iPad"])
  {
    int v0 = ARKitCoreBundle();
    v1 = v0;
    int v2 = @"Move iPad to start";
  }
  else
  {
    int v3 = [v6 isEqualToString:@"iPod"];
    int v0 = ARKitCoreBundle();
    v1 = v0;
    if (v3) {
      int v2 = @"Move iPod touch to start";
    }
    else {
      int v2 = @"Move device to start";
    }
  }
  uint64_t v4 = [v0 localizedStringForKey:v2 value:&stru_26BF5E748 table:@"Localizable_iOS"];
  unint64_t v5 = (void *)getMoveCoachingText_moveCoachingText;
  getMoveCoachingText_moveCoachingText = v4;
}

void __getContinueCoachingText_block_invoke()
{
  ARDeviceClass();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:@"iPhone"])
  {
    int v0 = ARKitCoreBundle();
    v1 = v0;
    int v2 = @"Continue to move iPhone";
  }
  else if ([v6 isEqualToString:@"iPad"])
  {
    int v0 = ARKitCoreBundle();
    v1 = v0;
    int v2 = @"Continue to move iPad";
  }
  else
  {
    int v3 = [v6 isEqualToString:@"iPod"];
    int v0 = ARKitCoreBundle();
    v1 = v0;
    if (v3) {
      int v2 = @"Continue to move iPod touch";
    }
    else {
      int v2 = @"Continue to move device";
    }
  }
  uint64_t v4 = [v0 localizedStringForKey:v2 value:&stru_26BF5E748 table:@"Localizable_iOS"];
  unint64_t v5 = (void *)getContinueCoachingText_continueCoachingText;
  getContinueCoachingText_continueCoachingText = v4;
}

void __getGeoTrackingLookUpCoachingText_block_invoke()
{
  ARDeviceClass();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqualToString:@"iPhone"])
  {
    int v0 = ARKitCoreBundle();
    v1 = v0;
    int v2 = @"Raise iPhone toward buildings";
  }
  else if ([v6 isEqualToString:@"iPad"])
  {
    int v0 = ARKitCoreBundle();
    v1 = v0;
    int v2 = @"Raise iPad toward buildings";
  }
  else
  {
    int v3 = [v6 isEqualToString:@"iPod"];
    int v0 = ARKitCoreBundle();
    v1 = v0;
    if (v3) {
      int v2 = @"Raise iPod touch toward buildings";
    }
    else {
      int v2 = @"Raise device toward buildings";
    }
  }
  uint64_t v4 = [v0 localizedStringForKey:v2 value:&stru_26BF5E748 table:@"Localizable_iOS"];
  unint64_t v5 = (void *)getGeoTrackingLookUpCoachingText_lookUpCoachingText;
  getGeoTrackingLookUpCoachingText_lookUpCoachingText = v4;
}

uint64_t ARViewToCameraImageTransform@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  double v7 = a5 / a4;
  double v8 = a4 / a5;
  if ((unint64_t)(result - 3) <= 1) {
    double v7 = v8;
  }
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  double v10 = a6 / a7;
  if (v7 >= v10)
  {
    double v13 = *MEMORY[0x263F00148];
    double v11 = 1.0;
    if (v7 <= v10)
    {
      double v12 = 1.0;
    }
    else
    {
      double v12 = v10 / v7;
      double v9 = (1.0 - v12) * 0.5;
    }
  }
  else
  {
    double v11 = v7 / v10;
    double v12 = 1.0;
    double v13 = (1.0 - v11) * 0.5;
  }
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  if (!a2)
  {
    if (result == 2)
    {
      double v13 = v13 + v11;
      *(double *)(a3 + 8) = v12;
      *(double *)(a3 + 16) = -v11;
      goto LABEL_25;
    }
    if (result == 4)
    {
      double v13 = v13 + v11;
      *(double *)a3 = -v11;
      double v9 = v9 + v12;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(double *)(a3 + 24) = -v12;
      goto LABEL_25;
    }
    if (result != 3)
    {
      double v9 = v9 + v12;
      *(double *)(a3 + 8) = -v12;
      goto LABEL_24;
    }
    *(double *)a3 = v11;
LABEL_19:
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(double *)(a3 + 24) = v12;
    goto LABEL_25;
  }
  if (result == 2)
  {
    double v13 = v13 + v11;
    double v9 = v9 + v12;
    *(double *)(a3 + 8) = -v12;
    *(double *)(a3 + 16) = -v11;
    goto LABEL_25;
  }
  if (result == 4)
  {
    *(double *)a3 = -v11;
    double v13 = v13 + v11;
    goto LABEL_19;
  }
  if (result != 3)
  {
    *(double *)(a3 + 8) = v12;
LABEL_24:
    *(double *)(a3 + 16) = v11;
    goto LABEL_25;
  }
  *(double *)a3 = v11;
  double v9 = v9 + v12;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(double *)(a3 + 24) = -v12;
LABEL_25:
  *(double *)(a3 + 32) = v13;
  *(double *)(a3 + 40) = v9;
  return result;
}

CGAffineTransform *ARCameraImageToViewTransform@<X0>(uint64_t a1@<X0>, int a2@<W1>, CGAffineTransform *a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  ARViewToCameraImageTransform(a1, a2, (uint64_t)&v9, a6, a7, a4, a5);
  return CGAffineTransformInvert(a3, &v9);
}

uint64_t ARCameraToDisplayRotation(unint64_t a1)
{
  if (a1 > 4) {
    return 90;
  }
  else {
    return qword_20B232008[a1];
  }
}

__CFString *NSStringFromUIInterfaceOrientation(unint64_t a1)
{
  if (a1 > 4) {
    return &stru_26BF5E748;
  }
  else {
    return off_264000CB8[a1];
  }
}

id _ARLogGeneral_2()
{
  if (_ARLogGeneral_onceToken_3 != -1) {
    dispatch_once(&_ARLogGeneral_onceToken_3, &__block_literal_global_417);
  }
  int v0 = (void *)_ARLogGeneral_logObj_3;

  return v0;
}

void sub_20B2193CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20B219570(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double ARCoachingGlyphPerspectiveEye()
{
  return 0.0;
}

double ARCoachingGlyphPerspectiveCenter()
{
  return -0.0000305175781;
}

void sub_20B21FE30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B21FEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B21FF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B21FFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B220084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_20B2205FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B2206E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B2209C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B2212D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B221668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_20B221B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B221DC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20B2220C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B2221AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B22226C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B222358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B22243C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_20B2224F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

void sub_20B2226C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20B222994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *std::vector<ARCoachingControlPoint>::insert(uint64_t a1, char *__src, char *a3)
{
  int v3 = a3;
  uint64_t v4 = __src;
  id v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    uint32x4_t v14 = *(char **)a1;
    unint64_t v15 = ((uint64_t)&v6[-*(void *)a1] >> 5) + 1;
    if (v15 >> 59) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v16 = __src - v14;
    uint64_t v17 = (__src - v14) >> 5;
    uint64_t v18 = v7 - (void)v14;
    if (v18 >> 4 > v15) {
      unint64_t v15 = v18 >> 4;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v19 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v15;
    }
    uint64_t v34 = a1 + 16;
    if (v19) {
      unint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>(a1 + 16, v19);
    }
    else {
      unint64_t v20 = 0;
    }
    uint64_t v23 = &v20[32 * v17];
    __p = v20;
    v31 = v23;
    v32 = v23;
    v33 = &v20[32 * v19];
    if (v17 == v19)
    {
      if (v16 < 1)
      {
        if (v14 == v4) {
          unint64_t v25 = 1;
        }
        else {
          unint64_t v25 = v16 >> 4;
        }
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>(v8, v25);
        uint64_t v23 = &v26[32 * (v25 >> 2)];
        __p = v26;
        v31 = v23;
        v33 = &v26[32 * v27];
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        unint64_t v24 = v17 + 2;
        if (v17 >= -1) {
          unint64_t v24 = v17 + 1;
        }
        v23 -= 32 * (v24 >> 1);
        v31 = v23;
      }
    }
    long long v28 = *((_OWORD *)v3 + 1);
    *(_OWORD *)uint64_t v23 = *(_OWORD *)v3;
    *((_OWORD *)v23 + 1) = v28;
    v32 = v23 + 32;
    uint64_t v4 = (char *)std::vector<ARCoachingControlPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v32 != v31) {
      v32 += (v31 - v32 + 31) & 0xFFFFFFFFFFFFFFE0;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    long long v22 = *((_OWORD *)a3 + 1);
    *(_OWORD *)__src = *(_OWORD *)a3;
    *((_OWORD *)__src + 1) = v22;
    *(void *)(a1 + 8) = __src + 32;
  }
  else
  {
    CGAffineTransform v9 = __src + 32;
    double v10 = v6 - 32;
    double v11 = *(_OWORD **)(a1 + 8);
    while (v10 < v6)
    {
      long long v12 = *(_OWORD *)v10;
      long long v13 = *((_OWORD *)v10 + 1);
      v10 += 32;
      _OWORD *v11 = v12;
      v11[1] = v13;
      v11 += 2;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-32 * ((v6 - v9) >> 5)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 32 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    long long v21 = *((_OWORD *)v3 + 1);
    *(_OWORD *)uint64_t v4 = *(_OWORD *)v3;
    *((_OWORD *)v4 + 1) = v21;
  }
  return v4;
}

void sub_20B222DB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned short>::insert(uint64_t a1, char *__src, char *a3)
{
  int v3 = a3;
  uint64_t v4 = __src;
  id v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    long long v13 = *(char **)a1;
    uint64_t v14 = (uint64_t)&v6[-*(void *)a1];
    if (v14 <= -3) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 1;
    uint64_t v17 = v14 >> 1;
    unint64_t v18 = v7 - (void)v13;
    if (v18 <= v17 + 1) {
      unint64_t v19 = v17 + 1;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v18 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v20 = v19;
    }
    uint64_t v32 = a1 + 16;
    if (v20) {
      long long v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1 + 16, v20);
    }
    else {
      long long v21 = 0;
    }
    long long v22 = &v21[2 * v16];
    __p = v21;
    v29 = v22;
    v30 = v22;
    v31 = &v21[2 * v20];
    if (v16 == v20)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = v4 - v13;
        }
        unint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v8, v24);
        long long v22 = &v25[2 * (v24 >> 2)];
        __p = v25;
        v29 = v22;
        v31 = &v25[2 * v26];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        uint64_t v23 = v16 + 2;
        if (v16 >= -1) {
          uint64_t v23 = v16 + 1;
        }
        v22 -= v23 & 0xFFFFFFFFFFFFFFFELL;
        v29 = v22;
      }
    }
    *(_WORD *)long long v22 = *(_WORD *)v3;
    v30 = v22 + 2;
    uint64_t v4 = std::vector<unsigned short>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v30 != v29) {
      v30 += (v29 - v30 + 1) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(_WORD *)__src = *(_WORD *)a3;
    *(void *)(a1 + 8) = __src + 2;
  }
  else
  {
    CGAffineTransform v9 = __src + 2;
    double v10 = v6 - 2;
    double v11 = *(_WORD **)(a1 + 8);
    while (v10 < v6)
    {
      __int16 v12 = *(_WORD *)v10;
      v10 += 2;
      *v11++ = v12;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-2 * ((v6 - v9) >> 1)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 2 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(_WORD *)uint64_t v4 = *(_WORD *)v3;
  }
  return v4;
}

void sub_20B222FEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ARCoachingPatchData>::insert(uint64_t a1, char *__src, char *a3)
{
  int v3 = a3;
  uint64_t v4 = __src;
  id v6 = *(char **)(a1 + 8);
  uint64_t v8 = a1 + 16;
  unint64_t v7 = *(void *)(a1 + 16);
  if ((unint64_t)v6 >= v7)
  {
    long long v13 = *(char **)a1;
    unint64_t v14 = ((uint64_t)&v6[-*(void *)a1] >> 3) + 1;
    if (v14 >> 61) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v15 = __src - v13;
    uint64_t v16 = (__src - v13) >> 3;
    uint64_t v17 = v7 - (void)v13;
    if (v17 >> 2 > v14) {
      unint64_t v14 = v17 >> 2;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v14;
    }
    uint64_t v30 = a1 + 16;
    if (v18) {
      unint64_t v19 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(a1 + 16, v18);
    }
    else {
      unint64_t v19 = 0;
    }
    uint64_t v20 = &v19[8 * v16];
    __p = v19;
    uint64_t v27 = v20;
    long long v28 = v20;
    v29 = &v19[8 * v18];
    if (v16 == v18)
    {
      if (v15 < 1)
      {
        if (v13 == v4) {
          unint64_t v22 = 1;
        }
        else {
          unint64_t v22 = v15 >> 2;
        }
        uint64_t v23 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v8, v22);
        uint64_t v20 = &v23[8 * (v22 >> 2)];
        __p = v23;
        uint64_t v27 = v20;
        v29 = &v23[8 * v24];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        unint64_t v21 = v16 + 2;
        if (v16 >= -1) {
          unint64_t v21 = v16 + 1;
        }
        v20 -= 8 * (v21 >> 1);
        uint64_t v27 = v20;
      }
    }
    *(void *)uint64_t v20 = *(void *)v3;
    long long v28 = v20 + 8;
    uint64_t v4 = std::vector<ARCoachingPatchData>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v28 != v27) {
      v28 += (v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(void *)__src = *(void *)a3;
    *(void *)(a1 + 8) = __src + 8;
  }
  else
  {
    CGAffineTransform v9 = __src + 8;
    double v10 = v6 - 8;
    double v11 = *(void **)(a1 + 8);
    while (v10 < v6)
    {
      uint64_t v12 = *(void *)v10;
      v10 += 8;
      *v11++ = v12;
    }
    *(void *)(a1 + 8) = v11;
    if (v6 != v9) {
      memmove(&v6[-8 * ((v6 - v9) >> 3)], __src, v6 - v9);
    }
    if (v4 <= v3) {
      v3 += 8 * (*(void *)(a1 + 8) > (unint64_t)v3);
    }
    *(void *)uint64_t v4 = *(void *)v3;
  }
  return v4;
}

void sub_20B223230(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_20B225058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_20B225728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

char *std::vector<ARCoachingControlPoint>::__assign_with_size[abi:ne180100]<ARCoachingControlPoint*,ARCoachingControlPoint*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  CGAffineTransform v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 5)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *unint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 59) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v10 = v8 >> 4;
    if (v8 >> 4 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    double result = std::vector<ARCoachingControlPoint>::__vallocate[abi:ne180100](v7, v11);
    long long v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    CGAffineTransform v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      unint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 5;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[32 * v15];
  if (v14 != v9)
  {
    double result = (char *)memmove(*(void **)result, __src, v14 - v9);
    CGAffineTransform v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    unint64_t v19 = v16;
LABEL_18:
    double result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

char *std::vector<ARCoachingControlPoint>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::vector<ARCoachingControlPoint>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  unint64_t v5 = *(void **)(a2 + 8);
  id v6 = (char *)*a1;
  unint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      long long v10 = *((_OWORD *)v8 - 1);
      unint64_t v7 = (void *)(v9 - 32);
      *(_OWORD *)(v9 - 32) = *((_OWORD *)v8 - 2);
      *(_OWORD *)(v9 - 16) = v10;
      v8 -= 32;
      v9 -= 32;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  unint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(a2 + 16);
  int64_t v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v11 - __src);
    unint64_t v7 = *(void **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v12 + v13;
  unint64_t v14 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v14;
  unint64_t v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v15;
  uint64_t v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v16;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

char *std::vector<unsigned short>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  unint64_t v5 = *(char **)(a2 + 8);
  id v6 = (char *)*a1;
  unint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    unint64_t v7 = *(char **)(a2 + 8);
    do
    {
      __int16 v9 = *((_WORD *)v8 - 1);
      v8 -= 2;
      *((_WORD *)v7 - 1) = v9;
      v7 -= 2;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  long long v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    unint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  int64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  unint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

char *std::vector<ARCoachingPatchData>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  unint64_t v5 = *(char **)(a2 + 8);
  id v6 = (char *)*a1;
  unint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    unint64_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  long long v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    unint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  int64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  unint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

double ARFLCompoundSpringMake@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D3>, double a5@<D4>)
{
  double v27 = a5;
  double v28 = a4;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(void *)(a1 + 336) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v9 = a1 + 16;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(unsigned char *)(a1 + 336) = 1;
  double v26 = 0.0;
  double v25 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v26, &v25, 1.0, 0.5);
  ARFLSimpleSpringMake(v9, a4, 0.0, a4, v26, v25);
  ARFLSimpleSpringMake((uint64_t)&v21, a5, 0.0, a5, v26, v25);
  long long v10 = v22;
  *(_OWORD *)(a1 + 80) = v21;
  *(_OWORD *)(a1 + 96) = v10;
  long long v11 = v24;
  *(_OWORD *)(a1 + 112) = v23;
  *(_OWORD *)(a1 + 128) = v11;
  double v19 = 0.0;
  double v20 = 0.0;
  ARFLSpringConvertStiffnessDampingToDampingRatioResponse(&v20, &v19, a4, a5);
  ARFLSimpleSpringMake((uint64_t)&v21, v20, 0.0, v20, v26, v25);
  long long v12 = v22;
  *(_OWORD *)(a1 + 144) = v21;
  *(_OWORD *)(a1 + 160) = v12;
  long long v13 = v24;
  *(_OWORD *)(a1 + 176) = v23;
  *(_OWORD *)(a1 + 192) = v13;
  ARFLSimpleSpringMake((uint64_t)&v21, v19, 0.0, v19, v26, v25);
  long long v14 = v22;
  *(_OWORD *)(a1 + 208) = v21;
  *(_OWORD *)(a1 + 224) = v14;
  long long v15 = v24;
  *(_OWORD *)(a1 + 240) = v23;
  *(_OWORD *)(a1 + 256) = v15;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v28, &v27, v20, v19);
  ARFLSimpleSpringMake((uint64_t)&v21, a2, 0.0, a2, v26, v25);
  long long v16 = v22;
  *(_OWORD *)(a1 + 272) = v21;
  *(_OWORD *)(a1 + 288) = v16;
  double result = *(double *)&v23;
  long long v18 = v24;
  *(_OWORD *)(a1 + 304) = v23;
  *(_OWORD *)(a1 + 320) = v18;
  return result;
}

void ARFLCompoundSpringMakeWithDampingRatioResponse(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D3>, double a5@<D4>)
{
  double v8 = 0.0;
  double v9 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v9, &v8, a4, a5);
  ARFLCompoundSpringMake(a1, a2, a3, v9, v8);
}

uint64_t ARFLCompoundSpringSetAnchorImmediately(uint64_t result, double a2)
{
  *(double *)(result + 312) = a2;
  *(double *)(result + 272) = a2;
  *(void *)(result + 280) = 0;
  return result;
}

void ARFLCompoundSpringSetAnchorWithResponse(uint64_t a1, double a2, double a3)
{
  if (a3 == 0.0)
  {
    *(double *)(a1 + 272) = a3;
    *(void *)(a1 + 280) = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    uint64_t v5 = v6;
    *(void *)(a1 + 296) = v7;
    *(void *)(a1 + 304) = v5;
    a3 = a2;
  }
  *(double *)(a1 + 312) = a3;
}

void ARFLCompoundSpringSetAnchorWithIntermediatePositionAndResponse(uint64_t a1, double a2, double a3, double a4)
{
  if (a4 == 0.0)
  {
    *(double *)(a1 + 312) = a2;
  }
  else
  {
    ARFLCompoundSpringSetAnchorWithResponse(a1, a2, a4);
    a2 = a3;
  }
  *(double *)(a1 + 272) = a2;
  *(void *)(a1 + 280) = 0;
}

uint64_t ARFLCompoundSpringSetStiffnessImmediately(uint64_t result, double a2)
{
  *(double *)(result + 56) = a2;
  *(double *)(result + 16) = a2;
  *(void *)(result + 24) = 0;
  return result;
}

void ARFLCompoundSpringSetStiffnessWithResponse(uint64_t a1, double a2, double a3)
{
  if (a3 == 0.0)
  {
    *(double *)(a1 + 16) = a2;
    *(void *)(a1 + 24) = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    uint64_t v5 = v6;
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = v5;
  }
  *(double *)(a1 + 56) = a2;
}

uint64_t ARFLCompoundSpringSetDampingImmediately(uint64_t result, double a2)
{
  *(double *)(result + 120) = a2;
  *(double *)(result + 80) = a2;
  *(void *)(result + 88) = 0;
  return result;
}

void ARFLCompoundSpringSetDampingWithResponse(uint64_t a1, double a2, double a3)
{
  if (a3 == 0.0)
  {
    *(double *)(a1 + 80) = a2;
    *(void *)(a1 + 88) = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    uint64_t v5 = v6;
    *(void *)(a1 + 104) = v7;
    *(void *)(a1 + 112) = v5;
  }
  *(double *)(a1 + 120) = a2;
}

uint64_t ARFLCompoundSpringSetDampingRatioImmediately(uint64_t result, double a2)
{
  *(double *)(result + 184) = a2;
  *(double *)(result + 144) = a2;
  *(void *)(result + 152) = 0;
  return result;
}

void ARFLCompoundSpringSetDampingRatioSmoothly(uint64_t a1, double a2, double a3)
{
  if (a3 == 0.0)
  {
    *(double *)(a1 + 144) = a2;
    *(void *)(a1 + 152) = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    uint64_t v5 = v6;
    *(void *)(a1 + 168) = v7;
    *(void *)(a1 + 176) = v5;
  }
  *(double *)(a1 + 184) = a2;
}

uint64_t ARFLCompoundSpringSetResponseImmediately(uint64_t result, double a2)
{
  *(double *)(result + 248) = a2;
  *(double *)(result + 208) = a2;
  *(void *)(result + 216) = 0;
  return result;
}

void ARFLCompoundSpringSetResponseSmoothly(uint64_t a1, double a2, double a3)
{
  if (a3 == 0.0)
  {
    *(double *)(a1 + 208) = a2;
    *(void *)(a1 + 216) = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    ARFLSpringConvertDampingRatioResponseToStiffnessDamping((double *)&v7, (double *)&v6, 1.0, a3);
    uint64_t v5 = v6;
    *(void *)(a1 + 232) = v7;
    *(void *)(a1 + 240) = v5;
  }
  *(double *)(a1 + 248) = a2;
}

double ARFLCompoundSpringStep@<D0>(void *__src@<X0>, _OWORD *a2@<X8>, double a3@<D0>)
{
  memcpy(a2, __src, 0x158uLL);
  if (*((unsigned char *)a2 + 336))
  {
    long long v5 = a2[10];
    __dst[0] = a2[9];
    __dst[1] = v5;
    long long v6 = a2[12];
    __dst[2] = a2[11];
    __dst[3] = v6;
    ARFLSimpleSpringStep((uint64_t)__dst, (uint64_t)(a2 + 9), a3);
    long long v7 = a2[14];
    long long v24 = a2[13];
    long long v25 = v7;
    long long v8 = a2[16];
    long long v26 = a2[15];
    long long v27 = v8;
    ARFLSimpleSpringStep((uint64_t)&v24, (uint64_t)__dst, a3);
    long long v9 = __dst[1];
    a2[13] = __dst[0];
    a2[14] = v9;
    long long v10 = __dst[3];
    a2[15] = __dst[2];
    a2[16] = v10;
  }
  else
  {
    long long v11 = a2[2];
    __dst[0] = a2[1];
    __dst[1] = v11;
    long long v12 = a2[4];
    __dst[2] = a2[3];
    __dst[3] = v12;
    ARFLSimpleSpringStep((uint64_t)__dst, (uint64_t)(a2 + 1), a3);
    long long v13 = a2[6];
    long long v24 = a2[5];
    long long v25 = v13;
    long long v14 = a2[8];
    long long v26 = a2[7];
    long long v27 = v14;
    ARFLSimpleSpringStep((uint64_t)&v24, (uint64_t)__dst, a3);
    long long v15 = __dst[1];
    a2[5] = __dst[0];
    a2[6] = v15;
    long long v16 = __dst[3];
    a2[7] = __dst[2];
    a2[8] = v16;
  }
  long long v17 = a2[18];
  long long v24 = a2[17];
  long long v25 = v17;
  long long v18 = a2[20];
  long long v26 = a2[19];
  long long v27 = v18;
  ARFLSimpleSpringStep((uint64_t)&v24, (uint64_t)__dst, a3);
  long long v19 = __dst[1];
  a2[17] = __dst[0];
  a2[18] = v19;
  long long v20 = __dst[3];
  a2[19] = __dst[2];
  a2[20] = v20;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  memcpy(__dst, a2, 0x158uLL);
  _ARFLSimpleSpringFromCompoundSpring((uint64_t)__dst, (uint64_t)&v24);
  v22[0] = v24;
  v22[1] = v25;
  v22[2] = v26;
  v22[3] = v27;
  ARFLSimpleSpringStep((uint64_t)v22, (uint64_t)__dst, a3);
  double result = *(double *)__dst;
  *a2 = __dst[0];
  return result;
}

void _ARFLSimpleSpringFromCompoundSpring(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)(a1 + 8);
  double v4 = *(double *)(a1 + 272);
  if (*(unsigned char *)(a1 + 336)) {
    ARFLSimpleSpringMakeWithDampingRatioResponse(a2, v2, v3, v4, *(double *)(a1 + 144), *(double *)(a1 + 208));
  }
  else {
    ARFLSimpleSpringMake(a2, v2, v3, v4, *(double *)(a1 + 16), *(double *)(a1 + 80));
  }
}

BOOL ARFLCompoundSpringIsStable(void *__src)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  memcpy(v15, __src, 0x158uLL);
  _ARFLSimpleSpringFromCompoundSpring((uint64_t)v15, (uint64_t)&v16);
  if (*((unsigned char *)__src + 336))
  {
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    v15[3] = v19;
    BOOL result = ARFLSimpleSpringIsStable((double *)v15);
    if (result)
    {
      long long v3 = *((_OWORD *)__src + 18);
      v15[0] = *((_OWORD *)__src + 17);
      v15[1] = v3;
      long long v4 = *((_OWORD *)__src + 20);
      v15[2] = *((_OWORD *)__src + 19);
      v15[3] = v4;
      BOOL result = ARFLSimpleSpringIsStable((double *)v15);
      if (result)
      {
        long long v5 = *((_OWORD *)__src + 10);
        v15[0] = *((_OWORD *)__src + 9);
        v15[1] = v5;
        long long v6 = *((_OWORD *)__src + 12);
        v15[2] = *((_OWORD *)__src + 11);
        v15[3] = v6;
        BOOL result = ARFLSimpleSpringIsStable((double *)v15);
        if (result)
        {
          long long v7 = *((_OWORD *)__src + 14);
          v15[0] = *((_OWORD *)__src + 13);
          v15[1] = v7;
          long long v8 = *((_OWORD *)__src + 15);
          long long v9 = *((_OWORD *)__src + 16);
LABEL_10:
          v15[2] = v8;
          v15[3] = v9;
          return ARFLSimpleSpringIsStable((double *)v15);
        }
      }
    }
  }
  else
  {
    v15[0] = v16;
    v15[1] = v17;
    v15[2] = v18;
    v15[3] = v19;
    BOOL result = ARFLSimpleSpringIsStable((double *)v15);
    if (result)
    {
      long long v10 = *((_OWORD *)__src + 18);
      v15[0] = *((_OWORD *)__src + 17);
      v15[1] = v10;
      long long v11 = *((_OWORD *)__src + 20);
      v15[2] = *((_OWORD *)__src + 19);
      v15[3] = v11;
      BOOL result = ARFLSimpleSpringIsStable((double *)v15);
      if (result)
      {
        long long v12 = *((_OWORD *)__src + 2);
        v15[0] = *((_OWORD *)__src + 1);
        v15[1] = v12;
        long long v13 = *((_OWORD *)__src + 4);
        v15[2] = *((_OWORD *)__src + 3);
        v15[3] = v13;
        BOOL result = ARFLSimpleSpringIsStable((double *)v15);
        if (result)
        {
          long long v14 = *((_OWORD *)__src + 6);
          v15[0] = *((_OWORD *)__src + 5);
          v15[1] = v14;
          long long v8 = *((_OWORD *)__src + 7);
          long long v9 = *((_OWORD *)__src + 8);
          goto LABEL_10;
        }
      }
    }
  }
  return result;
}

id _ARLogCoaching_3()
{
  if (_ARLogCoaching_onceToken_3 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_3, &__block_literal_global_12);
  }
  int v0 = (void *)_ARLogCoaching_logObj_3;

  return v0;
}

float ARCoachingDotsRenderParamsLerp@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(float *)&a4 = a4;
  *(float32x2_t *)a3 = vmla_f32(*(float32x2_t *)a1, vsub_f32(*(float32x2_t *)a2, *(float32x2_t *)a1), (float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)&a4, 0));
  *(float32x4_t *)(a3 + 8) = vmlaq_n_f32(*(float32x4_t *)(a1 + 8), vsubq_f32(*(float32x4_t *)(a2 + 8), *(float32x4_t *)(a1 + 8)), *(float *)&a4);
  return *(float *)&a4;
}

id _ARLogCoaching_4()
{
  if (_ARLogCoaching_onceToken_4 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_4, &__block_literal_global_13);
  }
  int v0 = (void *)_ARLogCoaching_logObj_4;

  return v0;
}

void ARFLSimpleSpringMake(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = 0x3FF0000000000000;
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(double *)(a1 + 40) = a4;
}

BOOL ARFLSimpleSpringIsStable(double *a1)
{
  return vabdd_f64(*a1, a1[5]) <= a1[6] && fabs(a1[1]) <= a1[7];
}

double ARFLSimpleSpringMakeWithDampingRatioResponse@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>)
{
  uint64_t v12 = 0;
  double v13 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v13, (double *)&v12, a5, a6);
  uint64_t v11 = v12;
  double result = v13;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = 0x3FF0000000000000;
  *(double *)(a1 + 24) = result;
  *(void *)(a1 + 32) = v11;
  *(double *)(a1 + 40) = a4;
  return result;
}

double ARFLSimpleSpringSetDampingRatioResponse(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = 0;
  double v7 = 0.0;
  ARFLSpringConvertDampingRatioResponseToStiffnessDamping(&v7, (double *)&v6, a2, a3);
  uint64_t v5 = v6;
  double result = v7;
  *(double *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v5;
  return result;
}

void ARFLSimpleSpringStep(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  double v5 = *(double *)(a1 + 40);
  if (vabdd_f64(*(double *)a1, v5) <= *(double *)(a1 + 48))
  {
    double v6 = *(double *)(a1 + 8);
    if (fabs(v6) <= *(double *)(a1 + 56))
    {
      long long v25 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a1;
      *(_OWORD *)(a2 + 16) = v25;
      long long v26 = *(_OWORD *)(a1 + 48);
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
      *(_OWORD *)(a2 + 48) = v26;
      return;
    }
  }
  else
  {
    double v6 = *(double *)(a1 + 8);
  }
  double v7 = *(double *)a1 - v5;
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v8;
  long long v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v9;
  double v10 = sqrt(*(double *)(a1 + 24));
  double v11 = *(double *)(a1 + 32) * 0.5;
  double v12 = -v11;
  double v13 = exp(-(v11 * a3));
  double v14 = v6 + v11 * v7;
  if (v11 >= v10)
  {
    if (v11 <= v10)
    {
      double v19 = v7 + v14 * a3;
    }
    else
    {
      double v20 = sqrt(v11 * v11 - v10 * v10);
      long double v21 = v20 * a3;
      double v22 = v14 / v20;
      double v23 = cosh(v21);
      long double v24 = sinh(v21);
      double v19 = v22 * v24 + v7 * v23;
      double v14 = v20 * (v22 * v23) + v7 * v24 * v20;
    }
  }
  else
  {
    double v15 = sqrt(v11 * v12 + v10 * v10);
    double v16 = v15 * a3;
    double v17 = v14 / v15;
    __double2 v18 = __sincos_stret(v16);
    double v19 = v17 * v18.__sinval + v7 * v18.__cosval;
    double v14 = v15 * (v17 * v18.__cosval) + -(v18.__sinval * v7) * v15;
  }
  *(double *)a2 = v5 + v13 * v19;
  *(double *)(a2 + 8) = v13 * v12 * v19 + v13 * v14;
}

id _ARLogCoaching_5()
{
  if (_ARLogCoaching_onceToken_5 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_5, &__block_literal_global_16);
  }
  int v0 = (void *)_ARLogCoaching_logObj_5;

  return v0;
}

float ARCoachingDeviceRenderParamsLerp@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v4 = *(double *)a1 + a4 * (*(double *)a2 - *(double *)a1);
  float v5 = a4;
  float32x2_t v6 = vmla_n_f32(*(float32x2_t *)(a1 + 8), vsub_f32(*(float32x2_t *)(a2 + 8), *(float32x2_t *)(a1 + 8)), v5);
  *(double *)a3 = v4;
  *(float32x2_t *)(a3 + 8) = v6;
  float result = *(float *)(a1 + 16) + (float)(v5 * (float)(*(float *)(a2 + 16) - *(float *)(a1 + 16)));
  *(float *)(a3 + 16) = result;
  return result;
}

id _ARLogCoaching_6()
{
  if (_ARLogCoaching_onceToken_6 != -1) {
    dispatch_once(&_ARLogCoaching_onceToken_6, &__block_literal_global_17);
  }
  int v0 = (void *)_ARLogCoaching_logObj_6;

  return v0;
}

void _simd_slerp_internal(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v4 = a1[1];
  float64x2_t v5 = a2[1];
  float64x2_t v6 = vsubq_f64(*a1, *a2);
  float64x2_t v7 = vsubq_f64(v4, v5);
  v6.f64[0] = sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v6, v6), vmulq_f64(v7, v7))));
  float64x2_t v29 = *a2;
  float64x2_t v30 = *a1;
  float64x2_t v8 = vaddq_f64(*a1, *a2);
  float64x2_t v31 = v4;
  float64x2_t v28 = v5;
  float64x2_t v9 = vaddq_f64(v4, v5);
  long double v10 = atan2(v6.f64[0], sqrt(vaddvq_f64(vaddq_f64(vmulq_f64(v8, v8), vmulq_f64(v9, v9)))));
  double v11 = v10 + v10;
  double v12 = 1.0;
  BOOL v13 = v10 + v10 == 0.0;
  double v14 = 1.0;
  if (!v13) {
    double v14 = sin(v11) / v11;
  }
  double v15 = 1.0 / v14;
  if (v11 * 0.0 != 0.0) {
    double v12 = sin(v11 * 0.0) / (v11 * 0.0);
  }
  float64x2_t v16 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v15 * v12 * 0.0), 0);
  double v17 = 1.0;
  if (v11 != 0.0)
  {
    float64x2_t v27 = v16;
    long double v18 = sin(v11);
    float64x2_t v16 = v27;
    double v17 = v18 / v11;
  }
  double v19 = v15 * v17;
  float64x2_t v20 = vmulq_n_f64(v28, v19);
  float64x2_t v21 = vmlaq_f64(vmulq_n_f64(v29, v19), v30, v16);
  float64x2_t v22 = vmlaq_f64(v20, v31, v16);
  double v23 = vaddvq_f64(vaddq_f64(vmulq_f64(v21, v21), vmulq_f64(v22, v22)));
  if (v23 == 0.0)
  {
    float64x2_t v24 = (float64x2_t)xmmword_20B232190;
    float64x2_t v25 = 0uLL;
  }
  else
  {
    double v26 = 1.0 / sqrt(v23);
    float64x2_t v24 = vmulq_n_f64(v22, v26);
    float64x2_t v25 = vmulq_n_f64(v21, v26);
  }
  *a3 = v25;
  a3[1] = v24;
}

uint64_t ARCreateNonFixedPriorityDispatchQueue()
{
  return MEMORY[0x270F08D00]();
}

uint64_t ARDeviceClass()
{
  return MEMORY[0x270F08D18]();
}

uint64_t ARDeviceHasHomeButton()
{
  return MEMORY[0x270F08D20]();
}

uint64_t ARDeviceHasIsland()
{
  return MEMORY[0x270F08D28]();
}

uint64_t ARDeviceIsiPad()
{
  return MEMORY[0x270F08D30]();
}

uint64_t ARDeviceRequiresFrameTrendControllerWorkaround()
{
  return MEMORY[0x270F08D38]();
}

uint64_t ARDeviceSupportsJasper()
{
  return MEMORY[0x270F08D40]();
}

uint64_t ARErrorWithCodeAndUserInfo()
{
  return MEMORY[0x270F08D48]();
}

uint64_t ARIntrinsicsFromDeviceFormat()
{
  return MEMORY[0x270F08D90]();
}

uint64_t ARKitCoreBundle()
{
  return MEMORY[0x270F08D98]();
}

uint64_t ARKitUIBundle()
{
  return MEMORY[0x270F08DA0]();
}

uint64_t ARLinkedOnOrAfterYukon()
{
  return MEMORY[0x270F08DA8]();
}

uint64_t ARMatrix4x4Dictionary()
{
  return MEMORY[0x270F08DB0]();
}

uint64_t ARMatrix4x4FromRotationAndTranslation()
{
  return MEMORY[0x270F08DB8]();
}

uint64_t ARMatrixPerspectiveFlipZ()
{
  return MEMORY[0x270F08DC0]();
}

uint64_t ARPixelBufferWithCIImage()
{
  return MEMORY[0x270F08DD0]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB970](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB978](retstr, t, tx, ty, tz);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x270EE5980](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE5998](retstr, angle);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F06070](image, compressionQuality);
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x270F06268]();
}

void UISaveVideoAtPathToSavedPhotosAlbum(NSString *videoPath, id completionTarget, SEL completionSelector, void *contextInfo)
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
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

__float2 __sincospif_stret(float a1)
{
  MEMORY[0x270ED7E98](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

long double cosh(long double __x)
{
  MEMORY[0x270ED9138](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x270EDB018]();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDB020](*(void *)&__qos_class, *(void *)&__relative_priority);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

long double sinh(long double __x)
{
  MEMORY[0x270EDB4F8](__x);
  return result;
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}