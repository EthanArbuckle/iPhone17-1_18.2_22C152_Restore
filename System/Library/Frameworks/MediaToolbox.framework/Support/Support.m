float STS_N_CalculateQuaternionOrientationFromTransform(_OWORD *a1, _OWORD *a2)
{
  float32x4_t v2;
  int32x4_t v3;
  float32x4_t v4;
  float v5;
  float v6;
  float v7;
  float v9;
  float v10;
  float v11;
  float32x2_t v12;
  float32x2_t v13;
  unsigned __int32 v14;
  unsigned __int32 v15;
  float v16;
  float v17;
  float32x2_t v18;
  float32x2_t v19;
  float v20;
  float v21;
  unsigned int v22;
  float32x2_t v23;
  float32x2_t v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float result;
  float v30;
  float v31;
  float32x2_t v32;
  float32x2_t v33;
  long long v34;

  v3 = *(int32x4_t *)a1;
  v2 = *((float32x4_t *)a1 + 1);
  v4 = *((float32x4_t *)a1 + 2);
  LODWORD(v5) = HIDWORD(*((void *)a1 + 2));
  v6 = COERCE_FLOAT(*((void *)a1 + 5));
  v7 = v6 + (float)(COERCE_FLOAT(*a1) + v5);
  if (v7 >= 0.0)
  {
    v16 = sqrtf(v7 + 1.0);
    v17 = v16 + v16;
    v18 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v16 + v16));
    v19 = vmul_f32(v18, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v16 + v16), v18));
    LODWORD(v20) = vmul_f32(v19, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v16 + v16), v19)).u32[0];
    v26 = vmuls_lane_f32(v20, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
    v27 = vmuls_n_f32(vsubq_f32(v4, (float32x4_t)vdupq_laneq_s32(v3, 2)).f32[0], v20);
    v28 = vmuls_n_f32(vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).f32[0], v20);
    result = v17 * 0.25;
  }
  else if (*(float *)v3.i32 < v5 || *(float *)v3.i32 < v6)
  {
    v9 = 1.0 - *(float *)v3.i32;
    if (v5 >= v6)
    {
      v30 = sqrtf(v5 + (float)(v9 - v6));
      v31 = v30 + v30;
      v32 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v30 + v30));
      v33 = vmul_f32(v32, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v30 + v30), v32));
      v14 = vmul_f32(v33, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v30 + v30), v33)).u32[0];
      v26 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).f32[0], *(float *)&v14);
      v27 = v31 * 0.25;
      v28 = vmuls_lane_f32(*(float *)&v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
      v15 = vsubq_f32(v4, (float32x4_t)vdupq_laneq_s32(v3, 2)).u32[0];
    }
    else
    {
      v10 = sqrtf(v6 + (float)(v9 - v5));
      v11 = v10 + v10;
      v12 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v10 + v10));
      v13 = vmul_f32(v12, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v10 + v10), v12));
      v14 = vmul_f32(v13, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v10 + v10), v13)).u32[0];
      v26 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v3, 2), v4).f32[0], *(float *)&v14);
      v27 = vmuls_lane_f32(*(float *)&v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
      v28 = v11 * 0.25;
      v15 = vsubq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).u32[0];
    }
    result = vmuls_n_f32(*(float *)&v15, *(float *)&v14);
  }
  else
  {
    v21 = sqrtf(*(float *)v3.i32 + (float)((float)(1.0 - v5) - v6));
    *(float *)&v22 = v21 + v21;
    v23 = vrecpe_f32((float32x2_t)v22);
    v24 = vmul_f32(v23, vrecps_f32((float32x2_t)v22, v23));
    LODWORD(v25) = vmul_f32(v24, vrecps_f32((float32x2_t)v22, v24)).u32[0];
    v26 = *(float *)&v22 * 0.25;
    v27 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.i8, 1), v2).f32[0], v25);
    v28 = vmuls_n_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32(v3, 2), v4).f32[0], v25);
    result = vmuls_lane_f32(v25, (float32x2_t)*(_OWORD *)&vsubq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), v4), 1);
  }
  *(float *)&v34 = -v28;
  *((float *)&v34 + 1) = v26;
  *((float *)&v34 + 2) = -v27;
  *((float *)&v34 + 3) = result;
  *a2 = v34;
  return result;
}

void STS_N_CalculateAngularOrientationFromTransform(uint64_t a1, float *a2, float *a3, float *a4)
{
  LODWORD(v8) = HIDWORD(*(void *)(a1 + 32));
  if (fabsf(v8) >= 1.0)
  {
    float v9 = atan2f(-COERCE_FLOAT(*(void *)(a1 + 8)), COERCE_FLOAT(*(_OWORD *)a1));
    float v10 = 0.0;
  }
  else
  {
    float v9 = atan2f(COERCE_FLOAT(*(_OWORD *)(a1 + 32)), COERCE_FLOAT(*(void *)(a1 + 40)));
    float v10 = atan2f(*(float *)(a1 + 4), *(float *)(a1 + 20)) * 57.2957795;
  }
  float v11 = -v8;
  if (v8 < -1.0) {
    float v11 = 1.0;
  }
  if (v8 > 1.0) {
    float v11 = -1.0;
  }
  float v12 = asinf(v11);
  float v13 = (float)-v9 * 57.2957795;
  double v14 = fabsf(v13);
  if (v14 >= 1.0e15 || v14 <= 1.0e-15) {
    float v13 = 0.0;
  }
  *a2 = v13;
  float v16 = v12 * 57.2957795;
  double v17 = fabsf(v16);
  if (v17 >= 1.0e15 || v17 <= 1.0e-15) {
    float v16 = 0.0;
  }
  *a3 = v16;
  double v19 = fabsf(v10);
  if (v19 >= 1.0e15 || v19 <= 1.0e-15) {
    float v21 = 0.0;
  }
  else {
    float v21 = v10;
  }
  *a4 = v21;
}

void sub_23773F8B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23773F93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_23773FAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id STS_N_Log(void)
{
  if (STS_N_Log(void)::onceToken != -1) {
    dispatch_once(&STS_N_Log(void)::onceToken, &__block_literal_global);
  }
  v0 = (void *)STS_N_Log(void)::log;

  return v0;
}

uint64_t ___Z9STS_N_Logv_block_invoke()
{
  STS_N_Log(void)::log = (uint64_t)os_log_create("com.apple.STS-N", "STS-N");

  return MEMORY[0x270F9A758]();
}

void sub_23773FC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
}

void sub_23773FC80(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void getkFigSTSLabel_Global(void)
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  uint64_t v7 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  if (!getkFigSTSLabel_GlobalSymbolLoc(void)::ptr)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = ___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke;
    v3[3] = &unk_264CE47C8;
    v3[4] = &v4;
    ___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke(v3);
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v1 = [MEMORY[0x263F08690] currentHandler];
    v2 = [NSString stringWithUTF8String:"CFStringRef getkFigSTSLabel_Global()"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"STS_N_Singleton.mm", 21, @"%s", dlerror());

    __break(1u);
  }
}

void sub_23773FDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>,0>(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    v3 = *(void **)a1;
    operator delete(v3);
  }
}

void std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 104);
  if (v2) {
    CFRelease(v2);
  }
  std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table(a1 + 64);
  std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table(a1 + 24);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }

  JUMPOUT(0x237E1E7F0);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  size_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::pair<OpaqueAudioComponentInstance * const,std::pair<std::string,std::string>>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    operator delete(v2);
  }
}

void *___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!MediaExperienceLibraryCore(char **)::frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = ___ZL26MediaExperienceLibraryCorePPc_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264CE4780;
    uint64_t v7 = 0;
    MediaExperienceLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)MediaExperienceLibraryCore(char **)::frameworkLibrary;
  if (!MediaExperienceLibraryCore(char **)::frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = [NSString stringWithUTF8String:"void *MediaExperienceLibrary()"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"STS_N_Singleton.mm", 20, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  result = dlsym(v2, "kFigSTSLabel_Global");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getkFigSTSLabel_GlobalSymbolLoc(void)::ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

void sub_2377401E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL26MediaExperienceLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaExperienceLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void STS_N::UpdateGlobalState(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  STS_N_CalculateQuaternionOrientationFromTransform((_OWORD *)(a2 + 16), &inData);
  os_unfair_lock_lock((os_unfair_lock_t)a1);
  for (i = *(void **)(a1 + 24); i; i = (void *)*i)
  {
    size_t v5 = (float32x4_t *)i[5];
    if (!v5[7].i32[1])
    {
      uint64_t v6 = v5[5].i64[0];
      if (v6)
      {
        while (!*(unsigned char *)(v6 + 24))
        {
          uint64_t v6 = *(void *)v6;
          if (!v6) {
            goto LABEL_17;
          }
        }
LABEL_9:
        OSStatus v7 = AudioUnitSetProperty(*(AudioUnit *)(v6 + 16), 0xC1Eu, 0, 0, &inData, 0x10u);
        if (v7)
        {
          uint64_t v8 = STS_N_Log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v20 = "UpdateGlobalState";
            __int16 v21 = 1024;
            int v22 = 180;
            __int16 v23 = 1024;
            OSStatus v24 = v7;
            _os_log_error_impl(&dword_23773E000, v8, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
          }
        }
        while (1)
        {
          uint64_t v6 = *(void *)v6;
          if (!v6) {
            break;
          }
          if (*(unsigned char *)(v6 + 24)) {
            goto LABEL_9;
          }
        }
        size_t v5 = (float32x4_t *)i[5];
      }
LABEL_17:
      if (v5[15].i8[0])
      {
        float32x4_t v9 = vsubq_f32(v5[13], *(float32x4_t *)(a2 + 64));
        v17[0] = v9.i32[0];
        *(float *)&v17[1] = -v9.f32[2];
        v17[2] = v9.i32[1];
        uint64_t v10 = v5[5].i64[0];
        if (v10)
        {
          while (!*(unsigned char *)(v10 + 24))
          {
            uint64_t v10 = *(void *)v10;
            if (!v10) {
              goto LABEL_3;
            }
          }
LABEL_22:
          OSStatus v11 = AudioUnitSetProperty(*(AudioUnit *)(v10 + 16), 0xC2Bu, 0, 0, v17, 0xCu);
          if (v11)
          {
            float v12 = STS_N_Log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v20 = "UpdateGlobalState";
              __int16 v21 = 1024;
              int v22 = 194;
              __int16 v23 = 1024;
              OSStatus v24 = v11;
              _os_log_error_impl(&dword_23773E000, v12, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
            }
          }
          while (1)
          {
            uint64_t v10 = *(void *)v10;
            if (!v10) {
              break;
            }
            if (*(unsigned char *)(v10 + 24)) {
              goto LABEL_22;
            }
          }
        }
      }
    }
LABEL_3:
    ;
  }
  kdebug_trace();
  int v13 = *(unsigned __int8 *)(a1 + 176);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)a2;
  long long v14 = *(_OWORD *)(a2 + 64);
  long long v16 = *(_OWORD *)(a2 + 16);
  long long v15 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 160) = v14;
  *(_OWORD *)(a1 + 112) = v16;
  *(_OWORD *)(a1 + 128) = v15;
  if (!v13) {
    *(unsigned char *)(a1 + 176) = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

void sub_23774052C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N::InfoForLabel(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>((void *)(a1 + 8), a2);
  if (!v2) {
    operator new();
  }
  return *((void *)v2 + 5);
}

void sub_237740BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__erase_unique<OpaqueFigSTS *>(uint64_t *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (v2)
  {
    unint64_t v3 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
    unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v3 >> 47) ^ v3);
    unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
    uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
    v6.i16[0] = vaddlv_u8(v6);
    if (v6.u32[0] > 1uLL)
    {
      unint64_t v7 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
      if (v5 >= *(void *)&v2) {
        unint64_t v7 = v5 % *(void *)&v2;
      }
    }
    else
    {
      unint64_t v7 = v5 & (*(void *)&v2 - 1);
    }
    uint64_t v8 = *a1;
    float32x4_t v9 = *(uint64_t ***)(*a1 + 8 * v7);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (v10)
      {
        uint64_t v11 = *(void *)&v2 - 1;
        do
        {
          unint64_t v12 = v10[1];
          if (v12 == v5)
          {
            if (v10[2] == a2)
            {
              if (v6.u32[0] > 1uLL)
              {
                if (v5 >= *(void *)&v2) {
                  v5 %= *(void *)&v2;
                }
              }
              else
              {
                v5 &= v11;
              }
              int v13 = *(uint64_t **)(v8 + 8 * v5);
              do
              {
                long long v14 = v13;
                int v13 = (uint64_t *)*v13;
              }
              while (v13 != v10);
              if (v14 == a1 + 2) {
                goto LABEL_36;
              }
              unint64_t v15 = v14[1];
              if (v6.u32[0] > 1uLL)
              {
                if (v15 >= *(void *)&v2) {
                  v15 %= *(void *)&v2;
                }
              }
              else
              {
                v15 &= v11;
              }
              if (v15 != v5)
              {
LABEL_36:
                if (!*v10) {
                  goto LABEL_37;
                }
                unint64_t v16 = *(void *)(*v10 + 8);
                if (v6.u32[0] > 1uLL)
                {
                  if (v16 >= *(void *)&v2) {
                    v16 %= *(void *)&v2;
                  }
                }
                else
                {
                  v16 &= v11;
                }
                if (v16 != v5) {
LABEL_37:
                }
                  *(void *)(v8 + 8 * v5) = 0;
              }
              uint64_t v17 = *v10;
              if (*v10)
              {
                unint64_t v18 = *(void *)(v17 + 8);
                if (v6.u32[0] > 1uLL)
                {
                  if (v18 >= *(void *)&v2) {
                    v18 %= *(void *)&v2;
                  }
                }
                else
                {
                  v18 &= v11;
                }
                if (v18 != v5)
                {
                  *(void *)(*a1 + 8 * v18) = v14;
                  uint64_t v17 = *v10;
                }
              }
              *long long v14 = v17;
              *uint64_t v10 = 0;
              --a1[3];
              operator delete(v10);
              return;
            }
          }
          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v12 >= *(void *)&v2) {
                v12 %= *(void *)&v2;
              }
            }
            else
            {
              v12 &= v11;
            }
            if (v12 != v7) {
              return;
            }
          }
          uint64_t v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
    }
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void STS_N::LabelValidityDidChange(STS_N *a1, unsigned __int8 *a2)
{
  uint64_t v4 = STS_N::InfoForLabel((uint64_t)a1, a2);
  unint64_t v5 = (uint64_t *)*((void *)a1 + 8);
  if (!v5) {
    return;
  }
  uint64_t v6 = v4;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    uint64_t v8 = (OpaqueAudioComponentInstance *)v5[2];
    if (*((char *)v5 + 47) < 0) {
      std::string::__init_copy_ctor_external(&v39, (const std::string::value_type *)v5[3], v5[4]);
    }
    else {
      std::string v39 = *(std::string *)((unsigned char *)v5 + 1);
    }
    if (*((char *)v5 + 71) < 0) {
      std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v5[6], v5[7]);
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)v5 + 2);
    }
    uint64_t v9 = HIBYTE(v39.__r_.__value_.__r.__words[2]);
    if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v39.__r_.__value_.__l.__size_;
    }
    uint64_t v11 = a2[23];
    int v12 = (char)v11;
    if ((v11 & 0x80u) != 0) {
      uint64_t v11 = *((void *)a2 + 1);
    }
    if (size != v11) {
      goto LABEL_52;
    }
    if (v12 >= 0) {
      int v13 = a2;
    }
    else {
      int v13 = *(unsigned __int8 **)a2;
    }
    if ((*((unsigned char *)&v39.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (memcmp(v39.__r_.__value_.__l.__data_, v13, v39.__r_.__value_.__l.__size_)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)&v39.__r_.__value_.__s + 23))
    {
      long long v14 = &v39;
      do
      {
        if (v14->__r_.__value_.__s.__data_[0] != *v13) {
          goto LABEL_52;
        }
        long long v14 = (std::string *)((char *)v14 + 1);
        ++v13;
        --v9;
      }
      while (v9);
    }
    unint64_t v15 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>((void *)a1 + 1, (unsigned __int8 *)&__p);
    if (!v15) {
      goto LABEL_42;
    }
    unint64_t v16 = (int8x8_t *)*((void *)v15 + 5);
    int8x8_t v17 = v16[9];
    if (!*(void *)&v17) {
      goto LABEL_42;
    }
    unint64_t v18 = 0x9DDFEA08EB382D69 * (((8 * v8) + 8) ^ ((unint64_t)v8 >> 32));
    unint64_t v19 = 0x9DDFEA08EB382D69 * (((unint64_t)v8 >> 32) ^ (v18 >> 47) ^ v18);
    unint64_t v20 = 0x9DDFEA08EB382D69 * (v19 ^ (v19 >> 47));
    uint8x8_t v21 = (uint8x8_t)vcnt_s8(v17);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] > 1uLL)
    {
      unint64_t v22 = v20;
      if (v20 >= *(void *)&v17) {
        unint64_t v22 = v20 % *(void *)&v17;
      }
    }
    else
    {
      unint64_t v22 = v20 & (*(void *)&v17 - 1);
    }
    __int16 v23 = *(uint64_t ***)(*(void *)&v16[8] + 8 * v22);
    if (!v23 || (OSStatus v24 = *v23) == 0)
    {
LABEL_42:
      BOOL v30 = 0;
      BOOL v32 = *(void *)(v6 + 48) != 0;
      goto LABEL_43;
    }
    while (1)
    {
      unint64_t v25 = v24[1];
      if (v20 == v25) {
        break;
      }
      if (v21.u32[0] > 1uLL)
      {
        if (v25 >= *(void *)&v17) {
          v25 %= *(void *)&v17;
        }
      }
      else
      {
        v25 &= *(void *)&v17 - 1;
      }
      if (v25 != v22) {
        goto LABEL_42;
      }
LABEL_41:
      OSStatus v24 = (uint64_t *)*v24;
      if (!v24) {
        goto LABEL_42;
      }
    }
    if ((OpaqueAudioComponentInstance *)v24[2] != v8) {
      goto LABEL_41;
    }
    BOOL v30 = *((unsigned char *)v24 + 24) != 0;
    uint64_t v31 = *(void *)(v6 + 48);
    BOOL v32 = v31 != 0;
    if (*((unsigned char *)v24 + 24)) {
      BOOL v33 = v31 == 0;
    }
    else {
      BOOL v33 = 1;
    }
    if (!v33)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v35 = (__CFString *)CFStringCreateWithCString(v7, (const char *)p_p, 0x8000100u);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v36 = &v39;
      }
      else {
        v36 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      v37 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v36, 0x8000100u);
      STS_N::SetSpatializerActiveUnderLock(a1, v8, v35, 0);
      STS_N::SetSpatializerActiveUnderLock(a1, v8, v37, 1);
      CFRelease(v35);
      CFRelease(v37);
      goto LABEL_52;
    }
LABEL_43:
    if (!v32 && !v30)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v26 = &__p;
      }
      else {
        v26 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      v27 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v26, 0x8000100u);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v28 = &v39;
      }
      else {
        v28 = (std::string *)v39.__r_.__value_.__r.__words[0];
      }
      v29 = (__CFString *)CFStringCreateWithCString(v7, (const char *)v28, 0x8000100u);
      STS_N::SetSpatializerActiveUnderLock(a1, v8, v29, 0);
      STS_N::SetSpatializerActiveUnderLock(a1, v8, v27, 1);
      CFRelease(v27);
      CFRelease(v29);
    }
LABEL_52:
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
    unint64_t v5 = (uint64_t *)*v5;
  }
  while (v5);
}

void sub_237741290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  for (i = *v10; i; i = *(unsigned __int8 **)i)
  {
    unint64_t v12 = *((void *)i + 1);
    if (v12 == v6)
    {
      if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, a2)) {
        return i;
      }
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(void *)&v5) {
          v12 %= *(void *)&v5;
        }
      }
      else
      {
        v12 &= *(void *)&v5 - 1;
      }
      if (v12 != v9) {
        return 0;
      }
    }
  }
  return i;
}

void STS_N::SetSpatializerActiveUnderLock(STS_N *this, OpaqueAudioComponentInstance *a2, __CFString *a3, int a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unint64_t v8 = STS_N_Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = a2;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a4;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = a3;
    _os_log_impl(&dword_23773E000, v8, OS_LOG_TYPE_DEFAULT, "Setting spatializer %p isActive:%d with label %@", buf, 0x1Cu);
  }

  uint64_t v9 = STS_N::InfoForLabel(this, a3);
  uint64_t v10 = (STSSpatializers *)(v9 + 64);
  if (a4)
  {
    STSSpatializers::setSpatializerIsActive(v10, (unint64_t)a2, 1);
    STS_N::ApplyStoredPerLabelStateToSpatializers((uint64_t)this, v9, a2);
    int v11 = *(unsigned __int8 *)(v9 + 152);
    v34 = (void *)[*(id *)(v9 + 104) copy];
    memset(buf, 0, sizeof(buf));
    int v46 = 1065353216;
    STSSpatializers::setSpatializerIsActive((STSSpatializers *)buf, (unint64_t)a2, 1);
    getkFigSTSLabel_Global();
    if ([(__CFString *)a3 isEqualToString:v12]) {
      goto LABEL_25;
    }
    getkFigSTSLabel_Global();
    uint64_t v14 = STS_N::InfoForLabel(this, v13);
    unint64_t v15 = (void *)[*(id *)(v14 + 104) copy];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (!v17) {
      goto LABEL_24;
    }
    uint64_t v18 = *(void *)v40;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v40 != v18) {
          objc_enumerationMutation(v16);
        }
        unint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * v19);
        uint8x8_t v21 = [v34 objectForKey:v20];
        if (v21)
        {

          goto LABEL_19;
        }
        unint64_t v22 = v20;
        __int16 v23 = v22;
        if (!v11
          || ([(__CFString *)v22 isEqualToString:@"ListenerPose"] & 1) != 0
          || ([(__CFString *)v23 isEqualToString:@"SourcePose"] & 1) != 0
          || ([(__CFString *)v23 isEqualToString:@"SoundStageSize"] & 1) != 0
          || ([(__CFString *)v23 isEqualToString:@"SoundStageTransitionTime"] & 1) != 0)
        {

LABEL_18:
          STS_N::SetPropertyOnSpatializers(v14, v23, (void *)[v16 objectForKey:v23], (uint64_t)buf);
          goto LABEL_19;
        }
        int v24 = [(__CFString *)v23 isEqualToString:@"RoomConfiguration"];

        if (v24) {
          goto LABEL_18;
        }
LABEL_19:
        ++v19;
      }
      while (v17 != v19);
      uint64_t v25 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
      uint64_t v17 = v25;
      if (!v25)
      {
LABEL_24:

LABEL_25:
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v26 = v34;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (!v27) {
          goto LABEL_42;
        }
        uint64_t v28 = *(void *)v36;
        while (2)
        {
          uint64_t v29 = 0;
LABEL_28:
          if (*(void *)v36 != v28) {
            objc_enumerationMutation(v26);
          }
          BOOL v30 = (__CFString *)*(id *)(*((void *)&v35 + 1) + 8 * v29);
          uint64_t v31 = v30;
          if (!v11
            || ([(__CFString *)v30 isEqualToString:@"ListenerPose"] & 1) != 0
            || ([(__CFString *)v31 isEqualToString:@"SourcePose"] & 1) != 0
            || ([(__CFString *)v31 isEqualToString:@"SoundStageSize"] & 1) != 0
            || ([(__CFString *)v31 isEqualToString:@"SoundStageTransitionTime"] & 1) != 0)
          {

            goto LABEL_36;
          }
          int v32 = [(__CFString *)v31 isEqualToString:@"RoomConfiguration"];

          if (v32) {
LABEL_36:
          }
            STS_N::SetPropertyOnSpatializers(v9, v31, (void *)[v26 objectForKey:v31], (uint64_t)buf);
          if (v27 == ++v29)
          {
            uint64_t v33 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
            uint64_t v27 = v33;
            if (!v33)
            {
LABEL_42:

              std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table((uint64_t)buf);
              return;
            }
            continue;
          }
          goto LABEL_28;
        }
      }
    }
  }
  STSSpatializers::setSpatializerIsActive(v10, (unint64_t)a2, 0);
}

void sub_2377417E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table(v11 - 144);
  _Unwind_Resume(a1);
}

uint64_t STS_N::InfoForLabel(STS_N *this, id a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[a2 UTF8String]);
  uint64_t v3 = STS_N::InfoForLabel((uint64_t)this, (unsigned __int8 *)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return v3;
}

void sub_2377418BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void STSSpatializers::setSpatializerIsActive(STSSpatializers *this, unint64_t a2, char a3)
{
  unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t v10 = *((void *)this + 1);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
    }
    else
    {
      unint64_t v3 = v9 & (v10 - 1);
    }
    uint64_t v12 = *(uint64_t ***)(*(void *)this + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = (uint64_t *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == a2)
          {
            *((unsigned char *)i + 24) = a3;
            return;
          }
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t v15 = operator new(0x20uLL);
  *unint64_t v15 = 0;
  v15[1] = v9;
  v15[2] = a2;
  *((unsigned char *)v15 + 24) = a3;
  float v16 = (float)(unint64_t)(*((void *)this + 3) + 1);
  float v17 = *((float *)this + 8);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      int8x8_t prime = (int8x8_t)v20;
    }
    else {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v10 = *((void *)this + 1);
    }
    if (*(void *)&prime > v10) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v10)
    {
      unint64_t v28 = vcvtps_u32_f32((float)*((unint64_t *)this + 3) / *((float *)this + 8));
      if (v10 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        unint64_t v28 = std::__next_prime(v28);
      }
      else
      {
        uint64_t v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2) {
          unint64_t v28 = v30;
        }
      }
      if (*(void *)&prime <= v28) {
        int8x8_t prime = (int8x8_t)v28;
      }
      if (*(void *)&prime >= v10)
      {
        unint64_t v10 = *((void *)this + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v22 = operator new(8 * *(void *)&prime);
          __int16 v23 = *(void **)this;
          *(void *)this = v22;
          if (v23) {
            operator delete(v23);
          }
          uint64_t v24 = 0;
          *((int8x8_t *)this + 1) = prime;
          do
            *(void *)(*(void *)this + 8 * v24++) = 0;
          while (*(void *)&prime != v24);
          uint64_t v25 = (void *)*((void *)this + 2);
          if (v25)
          {
            unint64_t v26 = v25[1];
            uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(void *)&prime) {
                v26 %= *(void *)&prime;
              }
            }
            else
            {
              v26 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)this + 8 * v26) = (char *)this + 16;
            uint64_t v31 = (void *)*v25;
            if (*v25)
            {
              do
              {
                unint64_t v32 = v31[1];
                if (v27.u32[0] > 1uLL)
                {
                  if (v32 >= *(void *)&prime) {
                    v32 %= *(void *)&prime;
                  }
                }
                else
                {
                  v32 &= *(void *)&prime - 1;
                }
                if (v32 != v26)
                {
                  if (!*(void *)(*(void *)this + 8 * v32))
                  {
                    *(void *)(*(void *)this + 8 * v32) = v25;
                    goto LABEL_55;
                  }
                  *uint64_t v25 = *v31;
                  *uint64_t v31 = **(void **)(*(void *)this + 8 * v32);
                  **(void **)(*(void *)this + 8 * v32) = v31;
                  uint64_t v31 = v25;
                }
                unint64_t v32 = v26;
LABEL_55:
                uint64_t v25 = v31;
                uint64_t v31 = (void *)*v31;
                unint64_t v26 = v32;
              }
              while (v31);
            }
          }
          unint64_t v10 = (unint64_t)prime;
          goto LABEL_59;
        }
        long long v36 = *(void **)this;
        *(void *)this = 0;
        if (v36) {
          operator delete(v36);
        }
        unint64_t v10 = 0;
        *((void *)this + 1) = 0;
      }
    }
LABEL_59:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  int8x8_t v33 = *(int8x8_t *)this;
  v34 = *(void **)(*(void *)this + 8 * v3);
  if (v34)
  {
    *unint64_t v15 = *v34;
LABEL_72:
    void *v34 = v15;
    goto LABEL_73;
  }
  *unint64_t v15 = *((void *)this + 2);
  *((void *)this + 2) = v15;
  *(void *)(*(void *)&v33 + 8 * v3) = (char *)this + 16;
  if (*v15)
  {
    unint64_t v35 = *(void *)(*v15 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v35 >= v10) {
        v35 %= v10;
      }
    }
    else
    {
      v35 &= v10 - 1;
    }
    v34 = (void *)(*(void *)this + 8 * v35);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)this + 3);
}

void sub_237741CF4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N::ApplyStoredPerLabelStateToSpatializers(uint64_t a1, uint64_t a2, OpaqueAudioComponentInstance *a3)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  long long v55 = 0u;
  long long v56 = 0u;
  int v57 = 1065353216;
  if (a3)
  {
    STSSpatializers::setSpatializerIsActive((STSSpatializers *)&v55, (unint64_t)a3, 1);
  }
  else if (&v55 != (long long *)(a2 + 64))
  {
    int v57 = *(_DWORD *)(a2 + 96);
    for (i = *(uint64_t **)(a2 + 80); i; i = (uint64_t *)*i)
    {
      uint64_t v12 = operator new(0x20uLL);
      *(void *)uint64_t v12 = 0;
      v12[1] = *((_OWORD *)i + 1);
      unint64_t v13 = *((void *)v12 + 2);
      unint64_t v14 = HIDWORD(v13);
      unint64_t v15 = 0x9DDFEA08EB382D69 * (((8 * v13) + 8) ^ HIDWORD(v13));
      *((void *)v12 + 1) = 0x9DDFEA08EB382D69
                           * ((0x9DDFEA08EB382D69 * (v14 ^ (v15 >> 47) ^ v15)) ^ ((0x9DDFEA08EB382D69
                                                                                   * (v14 ^ (v15 >> 47) ^ v15)) >> 47));
      std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::__node_insert_multi((uint64_t)&v55, v12);
    }
  }
  if (*(_DWORD *)(a2 + 116))
  {
    int8x8_t v5 = (float32x4_t *)MEMORY[0x263EF89A8];
    long long v6 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    *(_OWORD *)v64 = *MEMORY[0x263EF89A8];
    *(_OWORD *)&v64[16] = v6;
    float32x4_t v7 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    long long v65 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v66 = v7;
    STS_N_CalculateQuaternionOrientationFromTransform(v64, &inData);
    float32x4_t v8 = v5[3];
    v8.i32[2] = -1.0;
    float32x4_t v9 = vsubq_f32(v8, v66);
    v53[0] = v9.f32[0];
    v53[1] = -v9.f32[2];
    v53[2] = v9.f32[1];
    unint64_t v10 = (uint64_t *)v56;
    if ((void)v56)
    {
      while (!*((unsigned char *)v10 + 24))
      {
        unint64_t v10 = (uint64_t *)*v10;
        if (!v10) {
          goto LABEL_24;
        }
      }
LABEL_34:
      OSStatus v22 = AudioUnitSetProperty((AudioUnit)v10[2], 0xC1Eu, 0, 0, &inData, 0x10u);
      if (v22)
      {
        __int16 v23 = STS_N_Log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          __int16 v60 = 1024;
          int v61 = 1010;
          __int16 v62 = 1024;
          OSStatus v63 = v22;
          _os_log_error_impl(&dword_23773E000, v23, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v24 = AudioUnitSetProperty((AudioUnit)v10[2], 0xC2Bu, 0, 0, v53, 0xCu);
      if (v24)
      {
        uint64_t v25 = STS_N_Log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          __int16 v60 = 1024;
          int v61 = 1017;
          __int16 v62 = 1024;
          OSStatus v63 = v24;
          _os_log_error_impl(&dword_23773E000, v25, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v26 = AudioUnitSetParameter((AudioUnit)v10[2], 0x16u, 1u, 0, 0.0, 0);
      if (v26)
      {
        uint8x8_t v27 = STS_N_Log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          __int16 v60 = 1024;
          int v61 = 1022;
          __int16 v62 = 1024;
          OSStatus v63 = v26;
          _os_log_error_impl(&dword_23773E000, v27, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v28 = AudioUnitSetParameter((AudioUnit)v10[2], 0x17u, 1u, 0, 0.0, 0);
      if (v28)
      {
        uint8x8_t v29 = STS_N_Log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          __int16 v60 = 1024;
          int v61 = 1023;
          __int16 v62 = 1024;
          OSStatus v63 = v28;
          _os_log_error_impl(&dword_23773E000, v29, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v30 = AudioUnitSetParameter((AudioUnit)v10[2], 0x18u, 1u, 0, 0.0, 0);
      if (v30)
      {
        uint64_t v31 = STS_N_Log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "ApplyStoredPerLabelStateToSpatializers";
          __int16 v60 = 1024;
          int v61 = 1024;
          __int16 v62 = 1024;
          OSStatus v63 = v30;
          _os_log_error_impl(&dword_23773E000, v31, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      while (1)
      {
        unint64_t v10 = (uint64_t *)*v10;
        if (!v10) {
          break;
        }
        if (*((unsigned char *)v10 + 24)) {
          goto LABEL_34;
        }
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 176))
    {
      STS_N_CalculateQuaternionOrientationFromTransform((_OWORD *)(a1 + 112), buf);
      float v16 = (uint64_t *)v56;
      if ((void)v56)
      {
        while (!*((unsigned char *)v16 + 24))
        {
          float v16 = (uint64_t *)*v16;
          if (!v16) {
            goto LABEL_16;
          }
        }
LABEL_81:
        OSStatus v40 = AudioUnitSetProperty((AudioUnit)v16[2], 0xC1Eu, 0, 0, buf, 0x10u);
        if (v40)
        {
          long long v41 = STS_N_Log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1038;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v40;
            _os_log_error_impl(&dword_23773E000, v41, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }
        }
        while (1)
        {
          float v16 = (uint64_t *)*v16;
          if (!v16) {
            break;
          }
          if (*((unsigned char *)v16 + 24)) {
            goto LABEL_81;
          }
        }
      }
LABEL_16:
      if (*(unsigned char *)(a2 + 240))
      {
        float32x4_t v17 = vsubq_f32(*(float32x4_t *)(a2 + 208), *(float32x4_t *)(a1 + 160));
        LODWORD(inData) = v17.i32[0];
        *((float *)&inData + 1) = -v17.f32[2];
        DWORD2(inData) = v17.i32[1];
        BOOL v18 = (uint64_t *)v56;
        if ((void)v56)
        {
          while (!*((unsigned char *)v18 + 24))
          {
            BOOL v18 = (uint64_t *)*v18;
            if (!v18) {
              goto LABEL_20;
            }
          }
LABEL_104:
          OSStatus v51 = AudioUnitSetProperty((AudioUnit)v18[2], 0xC2Bu, 0, 0, &inData, 0xCu);
          if (v51)
          {
            v52 = STS_N_Log();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v64 = 136315650;
              *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
              *(_WORD *)&v64[12] = 1024;
              *(_DWORD *)&v64[14] = 1053;
              *(_WORD *)&v64[18] = 1024;
              *(_DWORD *)&v64[20] = v51;
              _os_log_error_impl(&dword_23773E000, v52, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
            }
          }
          while (1)
          {
            BOOL v18 = (uint64_t *)*v18;
            if (!v18) {
              break;
            }
            if (*((unsigned char *)v18 + 24)) {
              goto LABEL_104;
            }
          }
        }
      }
    }
LABEL_20:
    if (*(unsigned char *)(a2 + 240))
    {
      *(_DWORD *)buf = 0;
      LODWORD(inData) = 0;
      v53[0] = 0.0;
      STS_N_CalculateAngularOrientationFromTransform(a2 + 160, (float *)&inData, (float *)buf, v53);
      unint64_t v19 = (uint64_t *)v56;
      if ((void)v56)
      {
        while (!*((unsigned char *)v19 + 24))
        {
          unint64_t v19 = (uint64_t *)*v19;
          if (!v19) {
            goto LABEL_24;
          }
        }
        AudioUnitParameterValue v42 = *(float *)&inData;
        AudioUnitParameterValue v43 = *(float *)buf;
        AudioUnitParameterValue v44 = v53[0];
LABEL_89:
        OSStatus v45 = AudioUnitSetParameter((AudioUnit)v19[2], 0x16u, 1u, 0, v42, 0);
        if (v45)
        {
          int v46 = STS_N_Log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1063;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v45;
            _os_log_error_impl(&dword_23773E000, v46, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }
        }
        OSStatus v47 = AudioUnitSetParameter((AudioUnit)v19[2], 0x17u, 1u, 0, v43, 0);
        if (v47)
        {
          v48 = STS_N_Log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1064;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v47;
            _os_log_error_impl(&dword_23773E000, v48, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }
        }
        OSStatus v49 = AudioUnitSetParameter((AudioUnit)v19[2], 0x18u, 1u, 0, v44, 0);
        if (v49)
        {
          v50 = STS_N_Log();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1065;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v49;
            _os_log_error_impl(&dword_23773E000, v50, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }
        }
        while (1)
        {
          unint64_t v19 = (uint64_t *)*v19;
          if (!v19) {
            break;
          }
          if (*((unsigned char *)v19 + 24)) {
            goto LABEL_89;
          }
        }
      }
    }
  }
LABEL_24:
  if (!*(unsigned char *)(a2 + 152))
  {
    if (*(unsigned char *)(a2 + 240))
    {
      uint8x8_t v21 = (uint64_t *)v56;
      if ((void)v56)
      {
        while (!*((unsigned char *)v21 + 24))
        {
          uint8x8_t v21 = (uint64_t *)*v21;
          if (!v21) {
            goto LABEL_25;
          }
        }
LABEL_70:
        OSStatus v36 = AudioUnitSetParameter((AudioUnit)v21[2], 3u, 1u, 0, *(AudioUnitParameterValue *)(a2 + 228), 0);
        if (v36)
        {
          long long v37 = STS_N_Log();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1073;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v36;
            _os_log_error_impl(&dword_23773E000, v37, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }
        }
        OSStatus v38 = AudioUnitSetParameter((AudioUnit)v21[2], 0x23u, 1u, 0, *(AudioUnitParameterValue *)(a2 + 232), 0);
        if (v38)
        {
          long long v39 = STS_N_Log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v64 = 136315650;
            *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
            *(_WORD *)&v64[12] = 1024;
            *(_DWORD *)&v64[14] = 1074;
            *(_WORD *)&v64[18] = 1024;
            *(_DWORD *)&v64[20] = v38;
            _os_log_error_impl(&dword_23773E000, v39, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
          }
        }
        while (1)
        {
          uint8x8_t v21 = (uint64_t *)*v21;
          if (!v21) {
            break;
          }
          if (*((unsigned char *)v21 + 24)) {
            goto LABEL_70;
          }
        }
      }
    }
  }
LABEL_25:
  if (*(_DWORD *)(a2 + 116) == 20)
  {
    int v20 = 1;
  }
  else if (*(unsigned char *)(a2 + 152) || !*(unsigned char *)(a2 + 240))
  {
    int v20 = 3;
  }
  else
  {
    int v20 = *(_DWORD *)(a2 + 224);
  }
  *(_DWORD *)buf = v20;
  unint64_t v32 = (uint64_t *)v56;
  if ((void)v56)
  {
    while (!*((unsigned char *)v32 + 24))
    {
      unint64_t v32 = (uint64_t *)*v32;
      if (!v32) {
        return std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table((uint64_t)&v55);
      }
    }
LABEL_63:
    OSStatus v34 = AudioUnitSetProperty((AudioUnit)v32[2], 0xBBDu, 1u, 0, buf, 4u);
    if (v34)
    {
      unint64_t v35 = STS_N_Log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v64 = 136315650;
        *(void *)&v64[4] = "ApplyStoredPerLabelStateToSpatializers";
        *(_WORD *)&v64[12] = 1024;
        *(_DWORD *)&v64[14] = 1086;
        *(_WORD *)&v64[18] = 1024;
        *(_DWORD *)&v64[20] = v34;
        _os_log_error_impl(&dword_23773E000, v35, OS_LOG_TYPE_ERROR, "%s:%d error: %d", v64, 0x18u);
      }
    }
    while (1)
    {
      unint64_t v32 = (uint64_t *)*v32;
      if (!v32) {
        break;
      }
      if (*((unsigned char *)v32 + 24)) {
        goto LABEL_63;
      }
    }
  }
  return std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table((uint64_t)&v55);
}

void sub_237742804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void STS_N::SetPropertyOnSpatializers(uint64_t a1, const __CFString *a2, void *value, uint64_t a4)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  v72 = value;
  float32x4_t v8 = *(__CFDictionary **)(a1 + 104);
  if (value) {
    CFDictionarySetValue(v8, a2, value);
  }
  else {
    CFDictionaryRemoveValue(v8, a2);
  }
  if (!a4) {
    a4 = a1 + 64;
  }
  if (!*(void *)(a4 + 24)) {
    return;
  }
  if (CFEqual(a2, @"ListenerPose"))
  {
    float32x4_t v9 = (float32x4_t *)MEMORY[0x263EF89A8];
    if (value)
    {
      v83.location = 0;
      v83.length = 64;
      CFDataGetBytes((CFDataRef)value, v83, buffer);
    }
    else
    {
      long long v10 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      *(_OWORD *)buffer = *MEMORY[0x263EF89A8];
      *(_OWORD *)&buffer[16] = v10;
      float32x4_t v11 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
      long long v80 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
      float32x4_t v81 = v11;
    }
    float32x4_t v12 = v9[1];
    *(float32x4_t *)valuePtr = *v9;
    float32x4_t v69 = v12;
    float32x4_t v13 = v9[3];
    float32x4_t v70 = v9[2];
    float32x4_t v71 = v13;
    CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), @"SourcePose");
    if (v14)
    {
      v85.location = 0;
      v85.length = 64;
      CFDataGetBytes(v14, v85, valuePtr);
    }
    STS_N_CalculateQuaternionOrientationFromTransform(buffer, &inData);
    float32x4_t v15 = vsubq_f32(v71, v81);
    HIDWORD(v64) = v15.i32[0];
    float v65 = -v15.f32[2];
    __int32 v66 = v15.i32[1];
    float v16 = *(uint64_t **)(a4 + 16);
    if (v16)
    {
      while (!*((unsigned char *)v16 + 24))
      {
        float v16 = (uint64_t *)*v16;
        if (!v16) {
          return;
        }
      }
LABEL_20:
      OSStatus v17 = AudioUnitSetProperty((AudioUnit)v16[2], 0xC1Eu, 0, 0, &inData, 0x10u);
      if (v17)
      {
        OSStatus v18 = v17;
        unint64_t v19 = STS_N_Log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          __int16 v75 = 1024;
          int v76 = 399;
          __int16 v77 = 1024;
          OSStatus v78 = v18;
          _os_log_error_impl(&dword_23773E000, v19, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v20 = AudioUnitSetProperty((AudioUnit)v16[2], 0xC2Bu, 0, 0, (char *)&v64 + 4, 0xCu);
      if (v20)
      {
        OSStatus v21 = v20;
        OSStatus v22 = STS_N_Log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          __int16 v75 = 1024;
          int v76 = 406;
          __int16 v77 = 1024;
          OSStatus v78 = v21;
          _os_log_error_impl(&dword_23773E000, v22, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      while (1)
      {
        float v16 = (uint64_t *)*v16;
        if (!v16) {
          break;
        }
        if (*((unsigned char *)v16 + 24)) {
          goto LABEL_20;
        }
      }
    }
    return;
  }
  if (CFEqual(a2, @"SourcePose"))
  {
    if (value)
    {
      v84.location = 0;
      v84.length = 64;
      CFDataGetBytes((CFDataRef)value, v84, buffer);
    }
    else
    {
      long long v25 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      *(_OWORD *)buffer = *MEMORY[0x263EF89A8];
      *(_OWORD *)&buffer[16] = v25;
      float32x4_t v26 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
      long long v80 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
      float32x4_t v81 = v26;
    }
    float32x4_t v27 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    *(_OWORD *)valuePtr = *MEMORY[0x263EF89A8];
    float32x4_t v69 = v27;
    float32x4_t v28 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    float32x4_t v70 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v71 = v28;
    CFDataRef v29 = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), @"ListenerPose");
    if (v29)
    {
      v86.location = 0;
      v86.length = 64;
      CFDataGetBytes(v29, v86, valuePtr);
    }
    uint64_t v64 = 0;
    float v63 = 0.0;
    STS_N_CalculateAngularOrientationFromTransform((uint64_t)buffer, (float *)&v64, (float *)&v64 + 1, &v63);
    float32x4_t v30 = vsubq_f32(v81, v71);
    LODWORD(inData) = v30.i32[0];
    *((float *)&inData + 1) = -v30.f32[2];
    DWORD2(inData) = v30.i32[1];
    uint64_t v31 = *(uint64_t **)(a4 + 16);
    if (v31)
    {
      while (!*((unsigned char *)v31 + 24))
      {
        uint64_t v31 = (uint64_t *)*v31;
        if (!v31) {
          return;
        }
      }
      uint64_t v33 = v64;
      AudioUnitParameterValue v34 = v63;
LABEL_50:
      OSStatus v35 = AudioUnitSetParameter((AudioUnit)v31[2], 0x16u, 1u, 0, *(AudioUnitParameterValue *)&v33, 0);
      if (v35)
      {
        OSStatus v36 = v35;
        long long v37 = STS_N_Log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          __int16 v75 = 1024;
          int v76 = 433;
          __int16 v77 = 1024;
          OSStatus v78 = v36;
          _os_log_error_impl(&dword_23773E000, v37, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v38 = AudioUnitSetParameter((AudioUnit)v31[2], 0x17u, 1u, 0, *((AudioUnitParameterValue *)&v33 + 1), 0);
      if (v38)
      {
        OSStatus v39 = v38;
        OSStatus v40 = STS_N_Log();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          __int16 v75 = 1024;
          int v76 = 434;
          __int16 v77 = 1024;
          OSStatus v78 = v39;
          _os_log_error_impl(&dword_23773E000, v40, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v41 = AudioUnitSetParameter((AudioUnit)v31[2], 0x18u, 1u, 0, v34, 0);
      if (v41)
      {
        OSStatus v42 = v41;
        AudioUnitParameterValue v43 = STS_N_Log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          __int16 v75 = 1024;
          int v76 = 435;
          __int16 v77 = 1024;
          OSStatus v78 = v42;
          _os_log_error_impl(&dword_23773E000, v43, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      OSStatus v44 = AudioUnitSetProperty((AudioUnit)v31[2], 0xC2Bu, 0, 0, &inData, 0xCu);
      if (v44)
      {
        OSStatus v45 = v44;
        int v46 = STS_N_Log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v74 = "SetPropertyOnSpatializers";
          __int16 v75 = 1024;
          int v76 = 442;
          __int16 v77 = 1024;
          OSStatus v78 = v45;
          _os_log_error_impl(&dword_23773E000, v46, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
        }
      }
      while (1)
      {
        uint64_t v31 = (uint64_t *)*v31;
        if (!v31) {
          break;
        }
        if (*((unsigned char *)v31 + 24)) {
          goto LABEL_50;
        }
      }
    }
    return;
  }
  *(_DWORD *)buf = 0;
  if (STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::onceToken != -1) {
    dispatch_once(&STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::onceToken, &__block_literal_global_36);
  }
  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, a2);
  if (!v23 || !CFNumberGetValue(v23, kCFNumberSInt32Type, buf))
  {
    if (!CFStringGetCString(a2, (char *)valuePtr, 5, 0x8000100u)) {
      return;
    }
    int v32 = strtoul((const char *)valuePtr, 0, 16);
    *(_DWORD *)buf = v32;
    if (v32 <= 3099)
    {
      if (v32 <= 0x25)
      {
        if (((1 << v32) & 0x801C00DFFLL) != 0)
        {
          AudioUnitScope v24 = 1;
LABEL_81:
          int v48 = 1;
          goto LABEL_91;
        }
        if (((1 << v32) & 0x3FC200) != 0)
        {
          AudioUnitScope v24 = 0;
          goto LABEL_81;
        }
        if (((1 << v32) & 0x2004000000) != 0) {
          goto LABEL_90;
        }
      }
      if ((v32 - 3000) <= 0xD && ((1 << (v32 + 72)) & 0x2429) != 0) {
        goto LABEL_88;
      }
      if (v32 == 1005)
      {
LABEL_90:
        AudioUnitScope v24 = 0;
        int v48 = 0;
        goto LABEL_91;
      }
LABEL_139:
      __int16 v62 = STS_N_Log();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 67109120;
        *(_DWORD *)&buffer[4] = *(_DWORD *)buf;
        _os_log_error_impl(&dword_23773E000, v62, OS_LOG_TYPE_ERROR, "setting unknown property/parameter %u", buffer, 8u);
      }

      return;
    }
    if ((v32 - 3200) <= 9)
    {
      if (((1 << (v32 + 0x80)) & 0x3CF) != 0) {
        goto LABEL_90;
      }
LABEL_88:
      int v48 = 0;
      AudioUnitScope v24 = 1;
      goto LABEL_91;
    }
    if ((v32 - 3100) <= 9)
    {
      int v47 = 1 << (v32 - 28);
      if ((v47 & 0x238) != 0) {
        goto LABEL_88;
      }
      if ((v47 & 0x43) != 0) {
        goto LABEL_90;
      }
    }
    if (v32 == 4600) {
      goto LABEL_90;
    }
    goto LABEL_139;
  }
  if (CFEqual(a2, @"ReverbRoomType"))
  {
LABEL_36:
    AudioUnitScope v24 = 0;
    goto LABEL_99;
  }
  if (CFEqual(a2, @"SourceMode"))
  {
    AudioUnitScope v24 = 1;
    goto LABEL_99;
  }
  if (CFEqual(a2, @"SoundStageSize") || CFEqual(a2, @"SoundStageTransitionTime")) {
    goto LABEL_36;
  }
  AudioUnitScope v24 = CFEqual(a2, @"RoomConfiguration") == 0;
  int v48 = v24;
LABEL_91:
  if (!value || !v48)
  {
    if (v48) {
      return;
    }
LABEL_99:
    LOBYTE(inData) = 0;
    *(_DWORD *)valuePtr = 0;
    if (value)
    {
      uint64_t v50 = (*(_DWORD *)buf - 3200);
      if (v50 <= 0x29)
      {
        if (((1 << (buf[0] + 0x80)) & 0x8000000155) != 0)
        {
          UInt32 Length = 8;
          BytePtr = &v72;
          goto LABEL_126;
        }
        if (v50 == 41)
        {
          BytePtr = (void **)valuePtr;
          if (CFNumberGetValue((CFNumberRef)value, kCFNumberFloat32Type, valuePtr))
          {
            UInt32 Length = 4;
            goto LABEL_126;
          }
          v54 = STS_N_Log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            goto LABEL_142;
          }
          goto LABEL_109;
        }
      }
      BytePtr = (void **)CFDataGetBytePtr((CFDataRef)value);
      UInt32 Length = CFDataGetLength((CFDataRef)value);
    }
    else
    {
      UInt32 Length = (*(_DWORD *)buf - 3200) < 0xA;
      if ((*(_DWORD *)buf - 3200) >= 0xA) {
        BytePtr = 0;
      }
      else {
        BytePtr = (void **)&inData;
      }
      switch(*(_DWORD *)buf)
      {
        case 0xC80:
          int v53 = 3201;
          goto LABEL_125;
        case 0xC82:
          int v53 = 3203;
          goto LABEL_125;
        case 0xC84:
          int v53 = 3205;
          goto LABEL_125;
        case 0xC86:
          int v53 = 3207;
          goto LABEL_125;
        case 0xC88:
          int v53 = 3209;
LABEL_125:
          *(_DWORD *)buf = v53;
          break;
        default:
          break;
      }
    }
LABEL_126:
    v58 = *(uint64_t **)(a4 + 16);
    if (v58)
    {
      while (!*((unsigned char *)v58 + 24))
      {
        v58 = (uint64_t *)*v58;
        if (!v58) {
          return;
        }
      }
LABEL_130:
      OSStatus v59 = AudioUnitSetProperty((AudioUnit)v58[2], *(AudioUnitPropertyID *)buf, v24, 0, BytePtr, Length);
      if (v59)
      {
        OSStatus v60 = v59;
        int v61 = STS_N_Log();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buffer = 136315650;
          *(void *)&buffer[4] = "SetPropertyOnSpatializers";
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = 647;
          *(_WORD *)&buffer[18] = 1024;
          *(_DWORD *)&buffer[20] = v60;
          _os_log_error_impl(&dword_23773E000, v61, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buffer, 0x18u);
        }
      }
      while (1)
      {
        v58 = (uint64_t *)*v58;
        if (!v58) {
          break;
        }
        if (*((unsigned char *)v58 + 24)) {
          goto LABEL_130;
        }
      }
    }
    return;
  }
  *(_DWORD *)valuePtr = 0;
  if (!CFNumberGetValue((CFNumberRef)value, kCFNumberFloatType, valuePtr))
  {
    v54 = STS_N_Log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
LABEL_142:
      *(_DWORD *)buffer = 67109378;
      *(_DWORD *)&buffer[4] = *(_DWORD *)buf;
      *(_WORD *)&buffer[8] = 2112;
      *(void *)&buffer[10] = value;
      _os_log_error_impl(&dword_23773E000, v54, OS_LOG_TYPE_ERROR, "failed to get value for propertyID %u from %@", buffer, 0x12u);
    }
LABEL_109:

    return;
  }
  OSStatus v49 = *(uint64_t **)(a4 + 16);
  if (v49)
  {
    while (!*((unsigned char *)v49 + 24))
    {
      OSStatus v49 = (uint64_t *)*v49;
      if (!v49) {
        return;
      }
    }
LABEL_113:
    OSStatus v55 = AudioUnitSetParameter((AudioUnit)v49[2], *(AudioUnitParameterID *)buf, v24, 0, *(AudioUnitParameterValue *)valuePtr, 0);
    if (v55)
    {
      OSStatus v56 = v55;
      int v57 = STS_N_Log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315650;
        *(void *)&buffer[4] = "SetPropertyOnSpatializers";
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = 538;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v56;
        _os_log_error_impl(&dword_23773E000, v57, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buffer, 0x18u);
      }
    }
    while (1)
    {
      OSStatus v49 = (uint64_t *)*v49;
      if (!v49) {
        break;
      }
      if (*((unsigned char *)v49 + 24)) {
        goto LABEL_113;
      }
    }
  }
}

void ___ZN5STS_N15GetPropertyInfoEPK10__CFStringPjS3_Ph_block_invoke()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 5, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  int valuePtr = 3;
  CFNumberRef v1 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"Gain", v1);
  CFRelease(v1);
  int valuePtr = 11;
  CFNumberRef v2 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"ObstructionAttenuation", v2);
  CFRelease(v2);
  int valuePtr = 10;
  CFNumberRef v3 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"OcclusionAttenuation", v3);
  CFRelease(v3);
  int valuePtr = 35;
  CFNumberRef v4 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"ReverbBlend", v4);
  CFRelease(v4);
  int valuePtr = 3005;
  CFNumberRef v5 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"SourceMode", v5);
  CFRelease(v5);
  int valuePtr = 3240;
  CFNumberRef v6 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"SoundStageSize", v6);
  CFRelease(v6);
  int valuePtr = 3241;
  CFNumberRef v7 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"SoundStageTransitionTime", v7);
  CFRelease(v7);
  int valuePtr = 3239;
  CFNumberRef v8 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"RoomConfiguration", v8);
  CFRelease(v8);
  int valuePtr = 10;
  CFNumberRef v9 = CFNumberCreate(v0, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue((CFMutableDictionaryRef)STS_N::GetPropertyInfo(__CFString const*,unsigned int *,unsigned int *,unsigned char *)::globalPropertyMap, @"ReverbRoomType", v9);
  CFRelease(v9);
}

void std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,BOOL>>>::__node_insert_multi(uint64_t a1, void *a2)
{
  unint64_t v4 = a2[2];
  unint64_t v5 = HIDWORD(v4);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * v4) + 8) ^ HIDWORD(v4));
  unint64_t v7 = 0x9DDFEA08EB382D69
     * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
  a2[1] = v7;
  unint64_t v8 = *(void *)(a1 + 8);
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v10 = *(float *)(a1 + 32);
  if (!v8 || (float)(v10 * (float)v8) < v9)
  {
    BOOL v11 = 1;
    if (v8 >= 3) {
      BOOL v11 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v12 = v11 | (2 * v8);
    unint64_t v13 = vcvtps_u32_f32(v9 / v10);
    if (v12 <= v13) {
      int8x8_t prime = (int8x8_t)v13;
    }
    else {
      int8x8_t prime = (int8x8_t)v12;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v8) {
      goto LABEL_92;
    }
    if (*(void *)&prime >= v8) {
      goto LABEL_43;
    }
    unint64_t v21 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v8 < 3 || (uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v22.i16[0] = vaddlv_u8(v22), v22.u32[0] > 1uLL))
    {
      unint64_t v21 = std::__next_prime(v21);
    }
    else
    {
      uint64_t v23 = 1 << -(char)__clz(v21 - 1);
      if (v21 >= 2) {
        unint64_t v21 = v23;
      }
    }
    if (*(void *)&prime <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    if (*(void *)&prime >= v8)
    {
      unint64_t v8 = *(void *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_92:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      float32x4_t v15 = operator new(8 * *(void *)&prime);
      float v16 = *(void **)a1;
      *(void *)a1 = v15;
      if (v16) {
        operator delete(v16);
      }
      uint64_t v17 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v17++) = 0;
      while (*(void *)&prime != v17);
      OSStatus v18 = *(void **)(a1 + 16);
      if (v18)
      {
        unint64_t v19 = v18[1];
        uint8x8_t v20 = (uint8x8_t)vcnt_s8(prime);
        v20.i16[0] = vaddlv_u8(v20);
        if (v20.u32[0] > 1uLL)
        {
          if (v19 >= *(void *)&prime) {
            v19 %= *(void *)&prime;
          }
        }
        else
        {
          v19 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v19) = a1 + 16;
        for (i = (void *)*v18; *v18; i = (void *)*v18)
        {
          unint64_t v25 = i[1];
          if (v20.u32[0] > 1uLL)
          {
            if (v25 >= *(void *)&prime) {
              v25 %= *(void *)&prime;
            }
          }
          else
          {
            v25 &= *(void *)&prime - 1;
          }
          if (v25 == v19)
          {
            OSStatus v18 = i;
          }
          else
          {
            float32x4_t v26 = i;
            if (*(void *)(*(void *)a1 + 8 * v25))
            {
              do
              {
                float32x4_t v27 = v26;
                float32x4_t v26 = (void *)*v26;
              }
              while (v26 && i[2] == v26[2]);
              *OSStatus v18 = v26;
              void *v27 = **(void **)(*(void *)a1 + 8 * v25);
              **(void **)(*(void *)a1 + 8 * v25) = i;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v25) = v18;
              OSStatus v18 = i;
              unint64_t v19 = v25;
            }
          }
        }
      }
      unint64_t v8 = (unint64_t)prime;
    }
    else
    {
      OSStatus v39 = *(void **)a1;
      *(void *)a1 = 0;
      if (v39) {
        operator delete(v39);
      }
      unint64_t v8 = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v28.i16[0] = vaddlv_u8(v28);
  if (v28.u32[0] > 1uLL)
  {
    unint64_t v29 = v7;
    if (v8 <= v7) {
      unint64_t v29 = v7 % v8;
    }
  }
  else
  {
    unint64_t v29 = (v8 - 1) & v7;
  }
  float32x4_t v30 = *(void **)(*(void *)a1 + 8 * v29);
  if (v30)
  {
    int v31 = 0;
    do
    {
      int v32 = v30;
      float32x4_t v30 = (void *)*v30;
      if (!v30) {
        break;
      }
      unint64_t v33 = v30[1];
      if (v28.u32[0] > 1uLL)
      {
        unint64_t v34 = v30[1];
        if (v33 >= v8) {
          unint64_t v34 = v33 % v8;
        }
      }
      else
      {
        unint64_t v34 = v33 & (v8 - 1);
      }
      if (v34 != v29) {
        break;
      }
      BOOL v35 = v33 == v7 && v30[2] == a2[2];
      int v36 = v31 & !v35;
      v31 |= v35;
    }
    while (v36 != 1);
  }
  else
  {
    int v32 = 0;
  }
  unint64_t v37 = a2[1];
  if (v28.u32[0] > 1uLL)
  {
    if (v37 >= v8) {
      v37 %= v8;
    }
  }
  else
  {
    v37 &= v8 - 1;
  }
  if (!v32)
  {
    *a2 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = a2;
    *(void *)(*(void *)a1 + 8 * v37) = a1 + 16;
    if (!*a2) {
      goto LABEL_79;
    }
    unint64_t v38 = *(void *)(*a2 + 8);
    if (v28.u32[0] > 1uLL)
    {
      if (v38 >= v8) {
        v38 %= v8;
      }
    }
    else
    {
      v38 &= v8 - 1;
    }
LABEL_78:
    *(void *)(*(void *)a1 + 8 * v38) = a2;
    goto LABEL_79;
  }
  *a2 = *v32;
  *int v32 = a2;
  if (*a2)
  {
    unint64_t v38 = *(void *)(*a2 + 8);
    if (v28.u32[0] > 1uLL)
    {
      if (v38 >= v8) {
        v38 %= v8;
      }
    }
    else
    {
      v38 &= v8 - 1;
    }
    if (v38 != v37) {
      goto LABEL_78;
    }
  }
LABEL_79:
  ++*(void *)(a1 + 24);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  CFNumberRef v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    unint64_t v4 = (uint64_t *)a1;
  }
  else {
    unint64_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v47 + v2 + v46 + v44;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v56 + v45 + v48;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      int v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v78 + v69 + v67 + v68;
        uint64_t v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      float v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      float v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

uint64_t std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>::~pair(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    std::default_delete<STS_N::PerLabelInfo>::operator()[abi:ne180100](v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  int v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

const void **applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__emplace_unique_key_args<OpaqueFigSTS *,OpaqueFigSTS * const&>(float *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *((void *)a1 + 1);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    uint64_t v11 = *(void **)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (i = (void *)*v11; i; i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == a2) {
            return;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  BOOL v14 = operator new(0x18uLL);
  *BOOL v14 = 0;
  v14[1] = v8;
  v14[2] = a3;
  float v15 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v16 = a1[8];
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    else {
      int8x8_t prime = (int8x8_t)v18;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v9) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v27 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        unint64_t v27 = std::__next_prime(v27);
      }
      else
      {
        uint64_t v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2) {
          unint64_t v27 = v29;
        }
      }
      if (*(void *)&prime <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v21 = operator new(8 * *(void *)&prime);
          uint64_t v22 = *(void **)a1;
          *(void *)a1 = v21;
          if (v22) {
            operator delete(v22);
          }
          uint64_t v23 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v23++) = 0;
          while (*(void *)&prime != v23);
          uint64_t v24 = (void *)*((void *)a1 + 2);
          if (v24)
          {
            unint64_t v25 = v24[1];
            uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
            v26.i16[0] = vaddlv_u8(v26);
            if (v26.u32[0] > 1uLL)
            {
              if (v25 >= *(void *)&prime) {
                v25 %= *(void *)&prime;
              }
            }
            else
            {
              v25 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v25) = a1 + 4;
            uint64_t v30 = (void *)*v24;
            if (*v24)
            {
              do
              {
                unint64_t v31 = v30[1];
                if (v26.u32[0] > 1uLL)
                {
                  if (v31 >= *(void *)&prime) {
                    v31 %= *(void *)&prime;
                  }
                }
                else
                {
                  v31 &= *(void *)&prime - 1;
                }
                if (v31 != v25)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v31))
                  {
                    *(void *)(*(void *)a1 + 8 * v31) = v24;
                    goto LABEL_55;
                  }
                  *uint64_t v24 = *v30;
                  *uint64_t v30 = **(void **)(*(void *)a1 + 8 * v31);
                  **(void **)(*(void *)a1 + 8 * v31) = v30;
                  uint64_t v30 = v24;
                }
                unint64_t v31 = v25;
LABEL_55:
                uint64_t v24 = v30;
                uint64_t v30 = (void *)*v30;
                unint64_t v25 = v31;
              }
              while (v30);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        unint64_t v35 = *(void **)a1;
        *(void *)a1 = 0;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v9 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v32 = *(void **)a1;
  uint64_t v33 = *(void **)(*(void *)a1 + 8 * v3);
  if (v33)
  {
    *BOOL v14 = *v33;
LABEL_72:
    *uint64_t v33 = v14;
    goto LABEL_73;
  }
  *BOOL v14 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v14;
  v32[v3] = a1 + 4;
  if (*v14)
  {
    unint64_t v34 = *(void *)(*v14 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v34 >= v9) {
        v34 %= v9;
      }
    }
    else
    {
      v34 &= v9 - 1;
    }
    uint64_t v33 = (void *)(*(void *)a1 + 8 * v34);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
}

void sub_237744510(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void STS_N::SetSoundStageTransitionDurationOnSpatializers(uint64_t a1)
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  STS_N::SetPropertyOnSpatializers(a1, @"SoundStageTransitionTime", v2, 0);
}

void sub_23774458C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void STS_N::SetSoundStageSizeOnSpatializers(uint64_t a1, int a2)
{
  if ((a2 - 1) >= 3)
  {
    if (a2)
    {
      a2 = 0;
    }
    else
    {
      unint64_t v3 = STS_N_Log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_23773E000, v3, OS_LOG_TYPE_ERROR, "Attempted to convert kSTSSoundStageSize_Automatic to an AUSM AudioUnitPropertyID, but it does not exist. Defaulting to kSTSSoundStageSize_Large", buf, 2u);
      }

      a2 = 3;
    }
  }
  int v5 = a2;
  uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5 length:4];
  STS_N::SetPropertyOnSpatializers(a1, @"SoundStageSize", v4, 0);
}

void sub_237744668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void STS_N::SetPropertyForLabel(os_unfair_lock_t lock, unint64_t a2, void *a3, const __CFString *a4, void *a5)
{
  unint64_t v7 = a3;
  if (!a3)
  {
    getkFigSTSLabel_Global();
    unint64_t v7 = v10;
  }
  os_unfair_lock_lock(lock);
  uint64_t v11 = STS_N::InfoForLabel((STS_N *)lock, v7);
  uint64_t v12 = v11;
  if (a2) {
    std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__emplace_unique_key_args<OpaqueFigSTS *,OpaqueFigSTS * const&>((float *)(v11 + 24), a2, a2);
  }
  STS_N::SetPropertyOnSpatializers(v12, a4, a5, 0);
  getkFigSTSLabel_Global();
  if (CFEqual(v7, v13))
  {
    for (i = *(uint64_t **)&lock[6]._os_unfair_lock_opaque; i; i = (uint64_t *)*i)
    {
      uint64_t v15 = *((unsigned __int8 *)i + 39);
      if ((v15 & 0x80u) == 0) {
        uint64_t v16 = *((unsigned __int8 *)i + 39);
      }
      else {
        uint64_t v16 = i[3];
      }
      uint64_t os_unfair_lock_opaque_high = HIBYTE(lock[53]._os_unfair_lock_opaque);
      int v18 = (char)os_unfair_lock_opaque_high;
      if ((os_unfair_lock_opaque_high & 0x80u) != 0) {
        uint64_t os_unfair_lock_opaque_high = *(void *)&lock[50]._os_unfair_lock_opaque;
      }
      if (v16 != os_unfair_lock_opaque_high) {
        goto LABEL_22;
      }
      unint64_t v19 = (const void **)(i + 2);
      if (v18 >= 0) {
        os_unfair_lock_t v20 = lock + 48;
      }
      else {
        os_unfair_lock_t v20 = *(os_unfair_lock_t *)&lock[48]._os_unfair_lock_opaque;
      }
      if ((v15 & 0x80) != 0)
      {
        if (memcmp(*v19, v20, i[3])) {
          goto LABEL_22;
        }
      }
      else if (*((unsigned char *)i + 39))
      {
        while (*(unsigned __int8 *)v19 == LOBYTE(v20->_os_unfair_lock_opaque))
        {
          unint64_t v19 = (const void **)((char *)v19 + 1);
          os_unfair_lock_t v20 = (os_unfair_lock_t)((char *)v20 + 1);
          if (!--v15) {
            goto LABEL_23;
          }
        }
LABEL_22:
        STS_N::SetPropertyOnSpatializers(i[5], a4, a5, 0);
      }
LABEL_23:
      ;
    }
  }

  os_unfair_lock_unlock(lock);
}

void sub_2377447CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  int v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<OpaqueAudioComponentInstance * const,std::pair<std::string,std::string>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

uint64_t STS_N::CanDeleteSpatializerInfo(uint64_t a1, unsigned __int8 *a2)
{
  if (*((void *)a2 + 6) || *((void *)a2 + 11)) {
    return 0;
  }
  uint64_t result = [*((id *)a2 + 18) isEmpty];
  if (result)
  {
    uint64_t v5 = a2[23];
    if ((v5 & 0x80u) == 0) {
      uint64_t v6 = a2[23];
    }
    else {
      uint64_t v6 = *((void *)a2 + 1);
    }
    uint64_t v7 = *(unsigned __int8 *)(a1 + 215);
    int v8 = (char)v7;
    if ((v7 & 0x80u) != 0) {
      uint64_t v7 = *(void *)(a1 + 200);
    }
    if (v6 == v7)
    {
      uint64_t v11 = *(unsigned __int8 **)(a1 + 192);
      uint8x8_t v10 = (unsigned __int8 *)(a1 + 192);
      unint64_t v9 = v11;
      if (v8 >= 0) {
        uint64_t v12 = v10;
      }
      else {
        uint64_t v12 = v9;
      }
      if ((v5 & 0x80) == 0)
      {
        if (a2[23])
        {
          for (i = a2; *i == *v12; ++i)
          {
            ++v12;
            if (!--v5) {
              return CFDictionaryGetCount(*((CFDictionaryRef *)a2 + 13)) == 0;
            }
          }
          return 1;
        }
        return CFDictionaryGetCount(*((CFDictionaryRef *)a2 + 13)) == 0;
      }
      if (!memcmp(*(const void **)a2, v12, *((void *)a2 + 1))) {
        return CFDictionaryGetCount(*((CFDictionaryRef *)a2 + 13)) == 0;
      }
    }
    return 1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove(uint64_t result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)a2[1];
  unint64_t v4 = a3[1];
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
  uint64_t v6 = *(void **)(*a2 + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a3);
  if (v7 == a2 + 2) {
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
    if (!*a3) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a3 + 8);
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
      *(void *)(*a2 + 8 * v4) = 0;
  }
  uint64_t v10 = *a3;
  if (*a3)
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
      *(void *)(*a2 + 8 * v11) = v7;
      uint64_t v10 = *a3;
    }
  }
  *uint64_t v7 = v10;
  *a3 = 0;
  --a2[3];
  *(void *)uint64_t result = a3;
  *(void *)(result + 8) = a2 + 2;
  *(unsigned char *)(result + 16) = 1;
  return result;
}

void *std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>>>::find<OpaqueAudioComponentInstance *>(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ HIDWORD(a3));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(a3) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= a2) {
      unint64_t v7 = v5 % a2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (a2 - 1);
  }
  unint64_t v8 = *(void **)(a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == a3) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= a2) {
            v10 %= a2;
          }
        }
        else
        {
          v10 &= a2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void STS_N::SetSoundStageParametersUnderLock(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v4 = a2;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v6 = STS_N::InfoForLabel(a1, a2);
  uint64_t v7 = v6;
  if (*(unsigned char *)(a3 + 1)) {
    *(unsigned char *)(v6 + 112) = *(unsigned char *)a3;
  }
  if (*(unsigned char *)(a3 + 8))
  {
    int v8 = *(_DWORD *)(a3 + 4);
    if (*(_DWORD *)(v6 + 116) != v8)
    {
      *(_DWORD *)(v6 + 116) = v8;
      *(unsigned char *)(v6 + 140) = 1;
    }
  }
  if (*(unsigned char *)(a3 + 16)) {
    *(_DWORD *)(v6 + 120) = *(_DWORD *)(a3 + 12);
  }
  int v9 = *(_DWORD *)(v6 + 136);
  if (*(_DWORD *)(v6 + 116) == 20)
  {
    int v10 = 4;
  }
  else
  {
    uint64_t v11 = *(unsigned int *)(v6 + 120);
    if (v11 > 2) {
      int v10 = 3;
    }
    else {
      int v10 = dword_23774AFF0[v11];
    }
  }
  *(_DWORD *)(v6 + 136) = v10;
  if (v10 != v9)
  {
    uint64_t v12 = STSSoundStageControllerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v27 = STSSoundStageController::SoundStageSizeToString(*(_DWORD *)(v7 + 136));
      int v28 = 136315138;
      *(void *)uint64_t v29 = v27;
      _os_log_debug_impl(&dword_23773E000, v12, OS_LOG_TYPE_DEBUG, "STSSoundStageController::pickSoundStageSize() picked a new, different sound stage: %s", (uint8_t *)&v28, 0xCu);
    }

    *(unsigned char *)(v7 + 141) = 1;
  }
  if (*(unsigned char *)(a3 + 24))
  {
    float v13 = *(float *)(a3 + 20);
    if (vabds_f32(v13, *(float *)(v7 + 124)) > 0.001)
    {
      *(float *)(v7 + 124) = v13;
      *(unsigned char *)(v7 + 142) = 1;
    }
  }
  if (*(unsigned char *)(a3 + 32))
  {
    int v14 = *(_DWORD *)(a3 + 28);
    if (v14 != *(_DWORD *)(v7 + 128))
    {
      *(_DWORD *)(v7 + 128) = v14;
      *(unsigned char *)(v7 + 143) = 1;
    }
  }
  if (*(unsigned char *)(a3 + 40))
  {
    int v15 = *(_DWORD *)(a3 + 36);
    if (v15 != *(_DWORD *)(v7 + 132))
    {
      *(_DWORD *)(v7 + 132) = v15;
      *(unsigned char *)(v7 + 143) = 1;
    }
  }
  if (*(unsigned char *)(v7 + 143))
  {
    uint64_t v16 = STS_N_Log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v17 = v4;
      if ((char)v4[23] < 0) {
        BOOL v17 = *(unsigned __int8 **)v4;
      }
      int v28 = 136315138;
      *(void *)uint64_t v29 = v17;
      _os_log_impl(&dword_23773E000, v16, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters caused spatializer's soundStageController to update preset for label %s", (uint8_t *)&v28, 0xCu);
    }

    [*(id *)(v7 + 144) fireAll];
  }
  if (*(unsigned char *)(v7 + 140))
  {
    int v18 = *(_DWORD *)(v7 + 116);
    unint64_t v19 = STS_N_Log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      os_unfair_lock_t v20 = v4;
      if ((char)v4[23] < 0) {
        os_unfair_lock_t v20 = *(unsigned __int8 **)v4;
      }
      int v28 = 67109378;
      *(_DWORD *)uint64_t v29 = v18;
      *(_WORD *)&v29[4] = 2080;
      *(void *)&v29[6] = v20;
      _os_log_impl(&dword_23773E000, v19, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters updating spatialization preference to %d for label %s", (uint8_t *)&v28, 0x12u);
    }

    STS_N::ApplyStoredPerLabelStateToSpatializers(a1, v7, 0);
  }
  if (*(unsigned char *)(v7 + 142))
  {
    float v21 = *(float *)(v7 + 124);
    uint64_t v22 = STS_N_Log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v4;
      if ((char)v4[23] < 0) {
        uint64_t v23 = *(unsigned __int8 **)v4;
      }
      int v28 = 134218242;
      *(double *)uint64_t v29 = v21;
      *(_WORD *)&v29[8] = 2080;
      *(void *)&v29[10] = v23;
      _os_log_impl(&dword_23773E000, v22, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters updating sound stage transition duration to %0.2f for label %s", (uint8_t *)&v28, 0x16u);
    }

    STS_N::SetSoundStageTransitionDurationOnSpatializers(v7);
  }
  if (*(unsigned char *)(v7 + 141))
  {
    unsigned int v24 = *(_DWORD *)(v7 + 136);
    unint64_t v25 = STS_N_Log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint8x8_t v26 = STSSoundStageController::SoundStageSizeToString(v24);
      if ((char)v4[23] < 0) {
        unint64_t v4 = *(unsigned __int8 **)v4;
      }
      int v28 = 136315394;
      *(void *)uint64_t v29 = v26;
      *(_WORD *)&v29[8] = 2080;
      *(void *)&v29[10] = v4;
      _os_log_impl(&dword_23773E000, v25, OS_LOG_TYPE_DEFAULT, "SetSoundStageParameters updating sound stage size to %s for label %s", (uint8_t *)&v28, 0x16u);
    }

    STS_N::SetSoundStageSizeOnSpatializers(v7, v24);
  }
  *(_DWORD *)(v7 + 140) = 0;
}

void STSUnregisterSpatializer(unint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  if (a1)
  {
    uint64_t v3 = (uint64_t)v2;
    os_unfair_lock_lock(v2);
    uint64_t v5 = *(void *)(v3 + 48);
    unint64_t v4 = *(void *)(v3 + 56);
    uint64_t v6 = std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>>>::find<OpaqueAudioComponentInstance *>(v5, v4, a1);
    if (v6)
    {
      unint64_t v7 = v6[1];
      uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
      v8.i16[0] = vaddlv_u8(v8);
      if (v8.u32[0] > 1uLL)
      {
        if (v7 >= v4) {
          v7 %= v4;
        }
      }
      else
      {
        v7 &= v4 - 1;
      }
      int v9 = *(void **)(v5 + 8 * v7);
      do
      {
        int v10 = v9;
        int v9 = (void *)*v9;
      }
      while (v9 != v6);
      if (v10 == (void *)(v3 + 64)) {
        goto LABEL_20;
      }
      unint64_t v11 = v10[1];
      if (v8.u32[0] > 1uLL)
      {
        if (v11 >= v4) {
          v11 %= v4;
        }
      }
      else
      {
        v11 &= v4 - 1;
      }
      if (v11 != v7)
      {
LABEL_20:
        if (!*v6) {
          goto LABEL_21;
        }
        unint64_t v12 = *(void *)(*v6 + 8);
        if (v8.u32[0] > 1uLL)
        {
          if (v12 >= v4) {
            v12 %= v4;
          }
        }
        else
        {
          v12 &= v4 - 1;
        }
        if (v12 != v7) {
LABEL_21:
        }
          *(void *)(v5 + 8 * v7) = 0;
      }
      uint64_t v13 = *v6;
      if (*v6)
      {
        unint64_t v14 = *(void *)(v13 + 8);
        if (v8.u32[0] > 1uLL)
        {
          if (v14 >= v4) {
            v14 %= v4;
          }
        }
        else
        {
          v14 &= v4 - 1;
        }
        if (v14 != v7)
        {
          *(void *)(*(void *)(v3 + 48) + 8 * v14) = v10;
          uint64_t v13 = *v6;
        }
      }
      *int v10 = v13;
      *uint64_t v6 = 0;
      --*(void *)(v3 + 72);
      *(void *)&long long v37 = v6;
      *((void *)&v37 + 1) = v3 + 64;
      char v38 = 1;
      std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v37);
    }
    int v15 = STS_N_Log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v37) = 134217984;
      *(void *)((char *)&v37 + 4) = a1;
      _os_log_debug_impl(&dword_23773E000, v15, OS_LOG_TYPE_DEBUG, "Unregistering spatializer %p", (uint8_t *)&v37, 0xCu);
    }

    uint64_t v16 = *(void **)(v3 + 24);
    if (v16)
    {
      unint64_t v17 = 0x9DDFEA08EB382D69 * (((8 * a1) + 8) ^ HIDWORD(a1));
      unint64_t v18 = 0x9DDFEA08EB382D69 * (HIDWORD(a1) ^ (v17 >> 47) ^ v17);
      unint64_t v19 = 0x9DDFEA08EB382D69 * (v18 ^ (v18 >> 47));
      do
      {
        while (1)
        {
          os_unfair_lock_t v20 = (int8x8_t *)v16[5];
          int8x8_t v21 = v20[9];
          if (v21)
          {
            uint8x8_t v22 = (uint8x8_t)vcnt_s8(v21);
            v22.i16[0] = vaddlv_u8(v22);
            if (v22.u32[0] > 1uLL)
            {
              unint64_t v23 = v19;
              if (v19 >= *(void *)&v21) {
                unint64_t v23 = v19 % *(void *)&v21;
              }
            }
            else
            {
              unint64_t v23 = v19 & (*(void *)&v21 - 1);
            }
            int8x8_t v24 = v20[8];
            unint64_t v25 = *(int8x8_t ***)(*(void *)&v24 + 8 * v23);
            if (v25)
            {
              uint8x8_t v26 = *v25;
              if (*v25)
              {
                uint64_t v27 = *(void *)&v21 - 1;
                do
                {
                  unint64_t v28 = (unint64_t)v26[1];
                  if (v28 == v19)
                  {
                    if (*(void *)&v26[2] == a1)
                    {
                      if (v22.u32[0] > 1uLL)
                      {
                        unint64_t v29 = v19;
                        if (v19 >= *(void *)&v21) {
                          unint64_t v29 = v19 % *(void *)&v21;
                        }
                      }
                      else
                      {
                        unint64_t v29 = v27 & v19;
                      }
                      uint64_t v30 = *(int8x8_t **)(*(void *)&v24 + 8 * v29);
                      do
                      {
                        unint64_t v31 = v30;
                        uint64_t v30 = (int8x8_t *)*v30;
                      }
                      while (v30 != v26);
                      if (v31 == &v20[10]) {
                        goto LABEL_69;
                      }
                      unint64_t v32 = (unint64_t)v31[1];
                      if (v22.u32[0] > 1uLL)
                      {
                        if (v32 >= *(void *)&v21) {
                          v32 %= *(void *)&v21;
                        }
                      }
                      else
                      {
                        v32 &= v27;
                      }
                      if (v32 != v29)
                      {
LABEL_69:
                        if (!*(void *)v26) {
                          goto LABEL_70;
                        }
                        unint64_t v33 = *(void *)(*(void *)v26 + 8);
                        if (v22.u32[0] > 1uLL)
                        {
                          if (v33 >= *(void *)&v21) {
                            v33 %= *(void *)&v21;
                          }
                        }
                        else
                        {
                          v33 &= v27;
                        }
                        if (v33 != v29) {
LABEL_70:
                        }
                          *(void *)(*(void *)&v24 + 8 * v29) = 0;
                      }
                      int8x8_t v34 = *v26;
                      if (*v26)
                      {
                        unint64_t v35 = *(void *)(*(void *)&v34 + 8);
                        if (v22.u32[0] > 1uLL)
                        {
                          if (v35 >= *(void *)&v21) {
                            v35 %= *(void *)&v21;
                          }
                        }
                        else
                        {
                          v35 &= v27;
                        }
                        if (v35 != v29)
                        {
                          *(void *)(*(void *)&v20[8] + 8 * v35) = v31;
                          int8x8_t v34 = *v26;
                        }
                      }
                      *unint64_t v31 = v34;
                      int8x8_t *v26 = 0;
                      --*(void *)&v20[11];
                      operator delete(v26);
                      os_unfair_lock_t v20 = (int8x8_t *)v16[5];
                      break;
                    }
                  }
                  else
                  {
                    if (v22.u32[0] > 1uLL)
                    {
                      if (v28 >= *(void *)&v21) {
                        v28 %= *(void *)&v21;
                      }
                    }
                    else
                    {
                      v28 &= v27;
                    }
                    if (v28 != v23) {
                      break;
                    }
                  }
                  uint8x8_t v26 = (int8x8_t *)*v26;
                }
                while (v26);
              }
            }
          }
          if (!STS_N::CanDeleteSpatializerInfo(v3, (unsigned __int8 *)v20)) {
            break;
          }
          uint64_t v36 = (void *)*v16;
          std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove((uint64_t)&v37, (void *)(v3 + 8), v16);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v37);
          uint64_t v16 = v36;
          if (!v36) {
            goto LABEL_83;
          }
        }
        uint64_t v16 = (void *)*v16;
      }
      while (v16);
    }
LABEL_83:
    os_unfair_lock_unlock((os_unfair_lock_t)v3);
  }
}

void sub_237745360(_Unwind_Exception *exception_object)
{
}

uint64_t CADeprecated::TSingleton<STS_N>::instance()
{
  if (atomic_load_explicit((atomic_ullong *volatile)&CADeprecated::TSingleton<STS_N>::sOnce, memory_order_acquire) != -1)
  {
    uint64_t v3 = &v1;
    id v2 = &v3;
    std::__call_once(&CADeprecated::TSingleton<STS_N>::sOnce, &v2, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<STS_N>::instance(void)::{lambda(void)#1} &&>>);
  }
  return CADeprecated::TSingleton<STS_N>::sInstance;
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CADeprecated::TSingleton<STS_N>::instance(void)::{lambda(void)#1} &&>>()
{
}

void sub_237745484(_Unwind_Exception *a1)
{
  uint64_t v5 = *(void **)(v1 + 64);
  if (v5)
  {
    do
    {
      uint64_t v6 = (void *)*v5;
      std::__destroy_at[abi:ne180100]<std::pair<OpaqueAudioComponentInstance * const,std::pair<std::string,std::string>>,0>((uint64_t)(v5 + 2));
      operator delete(v5);
      uint64_t v5 = v6;
    }
    while (v6);
  }
  unint64_t v7 = *v3;
  char *v3 = 0;
  if (v7) {
    operator delete(v7);
  }
  uint8x8_t v8 = *(void **)(v1 + 24);
  if (v8)
  {
    do
    {
      int v9 = (void *)*v8;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<STS_N::PerLabelInfo>>,0>((uint64_t)(v8 + 2));
      operator delete(v8);
      uint8x8_t v8 = v9;
    }
    while (v9);
  }
  int v10 = *v2;
  os_unfair_lock_s *v2 = 0;
  if (v10) {
    operator delete(v10);
  }
  MEMORY[0x237E1E7F0](v1, 0x10B2C40B7A7108ALL);
  _Unwind_Resume(a1);
}

void STSRegisterSpatializerWithFallback(OpaqueAudioComponentInstance *a1, __CFString *a2, __CFString *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v7 = CADeprecated::TSingleton<STS_N>::instance();
  BOOL v8 = 0;
  if (a2 && a3) {
    BOOL v8 = CFEqual(a2, a3);
  }
  if (!a3 || v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v7);
    if (!a2)
    {
      getkFigSTSLabel_Global();
      a2 = v22;
    }
    STS_N::SetSpatializerActiveUnderLock((STS_N *)v7, a1, a2, 1);
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
    return;
  }
  int v9 = STS_N_Log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a2;
    __int16 v58 = 2112;
    uint64_t v59 = a3;
    _os_log_impl(&dword_23773E000, v9, OS_LOG_TYPE_DEFAULT, "registering spatializer:%p with preferredLabel:%@ and backupLabel:%@", buf, 0x20u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)v7);
  CStringPtr = (char *)CFStringGetCStringPtr(a2, 0x8000100u);
  unint64_t v11 = (char *)CFStringGetCStringPtr(a3, 0x8000100u);
  uint64_t v12 = *(void *)(STS_N::InfoForLabel((STS_N *)v7, a2) + 48);
  STS_N::SetSpatializerActiveUnderLock((STS_N *)v7, a1, a2, v12 != 0);
  STS_N::SetSpatializerActiveUnderLock((STS_N *)v7, a1, a3, v12 == 0);
  std::string::basic_string[abi:ne180100]<0>(&v53, CStringPtr);
  std::string::basic_string[abi:ne180100]<0>(&__p, v11);
  uint64_t v13 = v53;
  v56[0] = v54;
  *(void *)((char *)v56 + 7) = *(void *)((char *)&v54 + 7);
  int v14 = SHIBYTE(v54);
  long long v54 = 0uLL;
  int v15 = __p;
  v55[0] = v52;
  *(void *)((char *)v55 + 7) = *(void *)((char *)&v52 + 7);
  int v16 = SHIBYTE(v52);
  unint64_t v53 = 0;
  std::string __p = 0;
  long long v52 = 0uLL;
  *(void *)((char *)&v56[4] + 7) = *(void *)((char *)v56 + 7);
  v56[4] = v56[0];
  v56[0] = 0;
  *(void *)((char *)v56 + 7) = 0;
  *(void *)((char *)&v56[2] + 7) = *(void *)((char *)v55 + 7);
  v56[2] = v55[0];
  v55[0] = 0;
  *(void *)((char *)v55 + 7) = 0;
  unint64_t v17 = 0x9DDFEA08EB382D69 * (((8 * a1) + 8) ^ ((unint64_t)a1 >> 32));
  unint64_t v18 = 0x9DDFEA08EB382D69 * (((unint64_t)a1 >> 32) ^ (v17 >> 47) ^ v17);
  unint64_t v19 = 0x9DDFEA08EB382D69 * (v18 ^ (v18 >> 47));
  unint64_t v20 = *(void *)(v7 + 56);
  if (!v20) {
    goto LABEL_30;
  }
  uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v20);
  v21.i16[0] = vaddlv_u8(v21);
  if (v21.u32[0] > 1uLL)
  {
    unint64_t v3 = 0x9DDFEA08EB382D69 * (v18 ^ (v18 >> 47));
    if (v19 >= v20) {
      unint64_t v3 = v19 % v20;
    }
  }
  else
  {
    unint64_t v3 = v19 & (v20 - 1);
  }
  unint64_t v23 = *(void **)(*(void *)(v7 + 48) + 8 * v3);
  if (!v23 || (int8x8_t v24 = (void *)*v23) == 0)
  {
LABEL_30:
    uint8x8_t v26 = operator new(0x48uLL);
    uint64_t v27 = (void *)(v7 + 64);
    *(void *)buf = v26;
    *(void *)&buf[8] = v7 + 64;
    void *v26 = 0;
    v26[1] = v19;
    v26[2] = a1;
    v26[3] = v13;
    v26[4] = v56[4];
    *(void *)((char *)v26 + 39) = *(void *)((char *)&v56[4] + 7);
    *((unsigned char *)v26 + 47) = v14;
    memset(&v56[4], 0, 15);
    *(void *)((char *)v26 + 63) = *(void *)((char *)&v56[2] + 7);
    uint64_t v28 = v56[2];
    v26[6] = v15;
    v26[7] = v28;
    *((unsigned char *)v26 + 71) = v16;
    memset(&v56[2], 0, 15);
    uint8_t buf[16] = 1;
    float v29 = (float)(unint64_t)(*(void *)(v7 + 72) + 1);
    float v30 = *(float *)(v7 + 80);
    if (v20 && (float)(v30 * (float)v20) >= v29)
    {
LABEL_76:
      uint64_t v47 = *(void **)(*(void *)(v7 + 48) + 8 * v3);
      uint64_t v48 = *(void *)buf;
      if (v47)
      {
        **(void **)buf = *v47;
      }
      else
      {
        **(void **)buf = *(void *)(v7 + 64);
        *(void *)(v7 + 64) = v48;
        *(void *)(*(void *)(v7 + 48) + 8 * v3) = v27;
        if (!*(void *)v48)
        {
LABEL_85:
          *(void *)buf = 0;
          ++*(void *)(v7 + 72);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
          goto LABEL_86;
        }
        unint64_t v49 = *(void *)(*(void *)v48 + 8);
        if ((v20 & (v20 - 1)) != 0)
        {
          if (v49 >= v20) {
            v49 %= v20;
          }
        }
        else
        {
          v49 &= v20 - 1;
        }
        uint64_t v47 = (void *)(*(void *)(v7 + 48) + 8 * v49);
      }
      *uint64_t v47 = v48;
      goto LABEL_85;
    }
    BOOL v31 = 1;
    if (v20 >= 3) {
      BOOL v31 = (v20 & (v20 - 1)) != 0;
    }
    unint64_t v32 = v31 | (2 * v20);
    unint64_t v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33) {
      int8x8_t prime = (int8x8_t)v33;
    }
    else {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v20 = *(void *)(v7 + 56);
    }
    if (*(void *)&prime > v20) {
      goto LABEL_42;
    }
    if (*(void *)&prime < v20)
    {
      unint64_t v41 = vcvtps_u32_f32((float)*(unint64_t *)(v7 + 72) / *(float *)(v7 + 80));
      if (v20 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v20), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        unint64_t v41 = std::__next_prime(v41);
      }
      else
      {
        uint64_t v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2) {
          unint64_t v41 = v43;
        }
      }
      if (*(void *)&prime <= v41) {
        int8x8_t prime = (int8x8_t)v41;
      }
      if (*(void *)&prime >= v20)
      {
        unint64_t v20 = *(void *)(v7 + 56);
      }
      else
      {
        if (prime)
        {
LABEL_42:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v35 = operator new(8 * *(void *)&prime);
          uint64_t v36 = *(void **)(v7 + 48);
          *(void *)(v7 + 48) = v35;
          if (v36) {
            operator delete(v36);
          }
          uint64_t v37 = 0;
          *(int8x8_t *)(v7 + 56) = prime;
          do
            *(void *)(*(void *)(v7 + 48) + 8 * v37++) = 0;
          while (*(void *)&prime != v37);
          char v38 = (void *)*v27;
          if (*v27)
          {
            unint64_t v39 = v38[1];
            uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
            v40.i16[0] = vaddlv_u8(v40);
            if (v40.u32[0] > 1uLL)
            {
              if (v39 >= *(void *)&prime) {
                v39 %= *(void *)&prime;
              }
            }
            else
            {
              v39 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v7 + 48) + 8 * v39) = v27;
            uint64_t v44 = (void *)*v38;
            if (*v38)
            {
              do
              {
                unint64_t v45 = v44[1];
                if (v40.u32[0] > 1uLL)
                {
                  if (v45 >= *(void *)&prime) {
                    v45 %= *(void *)&prime;
                  }
                }
                else
                {
                  v45 &= *(void *)&prime - 1;
                }
                if (v45 != v39)
                {
                  uint64_t v46 = *(void *)(v7 + 48);
                  if (!*(void *)(v46 + 8 * v45))
                  {
                    *(void *)(v46 + 8 * v45) = v38;
                    goto LABEL_67;
                  }
                  *char v38 = *v44;
                  *uint64_t v44 = **(void **)(*(void *)(v7 + 48) + 8 * v45);
                  **(void **)(*(void *)(v7 + 48) + 8 * v45) = v44;
                  uint64_t v44 = v38;
                }
                unint64_t v45 = v39;
LABEL_67:
                char v38 = v44;
                uint64_t v44 = (void *)*v44;
                unint64_t v39 = v45;
              }
              while (v44);
            }
          }
          unint64_t v20 = (unint64_t)prime;
          goto LABEL_71;
        }
        unint64_t v50 = *(void **)(v7 + 48);
        *(void *)(v7 + 48) = 0;
        if (v50) {
          operator delete(v50);
        }
        unint64_t v20 = 0;
        *(void *)(v7 + 56) = 0;
      }
    }
LABEL_71:
    if ((v20 & (v20 - 1)) != 0)
    {
      if (v19 >= v20) {
        unint64_t v3 = v19 % v20;
      }
      else {
        unint64_t v3 = v19;
      }
    }
    else
    {
      unint64_t v3 = (v20 - 1) & v19;
    }
    goto LABEL_76;
  }
  while (1)
  {
    unint64_t v25 = v24[1];
    if (v25 == v19) {
      break;
    }
    if (v21.u32[0] > 1uLL)
    {
      if (v25 >= v20) {
        v25 %= v20;
      }
    }
    else
    {
      v25 &= v20 - 1;
    }
    if (v25 != v3) {
      goto LABEL_30;
    }
LABEL_29:
    int8x8_t v24 = (void *)*v24;
    if (!v24) {
      goto LABEL_30;
    }
  }
  if ((OpaqueAudioComponentInstance *)v24[2] != a1) {
    goto LABEL_29;
  }
  if (v16 < 0) {
    operator delete(v15);
  }
  if (v14 < 0) {
    operator delete(v13);
  }
LABEL_86:
  if (SHIBYTE(v52) < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v54) < 0) {
    operator delete(v53);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v7);
}

void sub_237745BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a29);
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  os_unfair_lock_unlock(v29);
  _Unwind_Resume(a1);
}

void STSSetSoundStageParameters(uint64_t a1, __CFString *a2)
{
  id v2 = a2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    getkFigSTSLabel_Global();
    id v2 = v4;
  }
  uint64_t v5 = CADeprecated::TSingleton<STS_N>::instance();
  uint64_t v6 = STS_N_Log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v2;
    _os_log_impl(&dword_23773E000, v6, OS_LOG_TYPE_DEFAULT, "STSSetSoundStageParameters called for spatializer with label %@", (uint8_t *)&buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)v5);
  uint64_t v7 = *(void **)(STS_N::InfoForLabel((STS_N *)v5, v2) + 80);
  if (!v7) {
    goto LABEL_21;
  }
  char v8 = 0;
  do
  {
    int v9 = std::__hash_table<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::__unordered_map_hasher<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::hash<OpaqueAudioComponentInstance *>,std::equal_to<OpaqueAudioComponentInstance *>,true>,std::__unordered_map_equal<OpaqueAudioComponentInstance *,std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>,std::equal_to<OpaqueAudioComponentInstance *>,std::hash<OpaqueAudioComponentInstance *>,true>,std::allocator<std::__hash_value_type<OpaqueAudioComponentInstance *,std::pair<std::string,std::string>>>>::find<OpaqueAudioComponentInstance *>(*(void *)(v5 + 48), *(void *)(v5 + 56), v7[2]);
    if (v9)
    {
      int v10 = v9;
      if (*((char *)v9 + 47) < 0) {
        std::string::__init_copy_ctor_external(&buf, (const std::string::value_type *)v9[3], v9[4]);
      }
      else {
        std::string buf = *(std::string *)((unsigned char *)v9 + 1);
      }
      STS_N::SetSoundStageParametersUnderLock(v5, (unsigned __int8 *)&buf, a1);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
      if (*((char *)v10 + 71) < 0) {
        std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)v10[6], v10[7]);
      }
      else {
        std::string v14 = *(std::string *)((unsigned char *)v10 + 2);
      }
      STS_N::SetSoundStageParametersUnderLock(v5, (unsigned __int8 *)&v14, a1);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      char v8 = 1;
    }
    uint64_t v7 = (void *)*v7;
  }
  while (v7);
  if ((v8 & 1) == 0)
  {
LABEL_21:
    CStringPtr = (char *)CFStringGetCStringPtr(v2, 0x8000100u);
    std::string::basic_string[abi:ne180100]<0>(__p, CStringPtr);
    STS_N::SetSoundStageParametersUnderLock(v5, (unsigned __int8 *)__p, a1);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v5);
}

void sub_237745E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  os_unfair_lock_unlock(v28);
  _Unwind_Resume(a1);
}

void STSSetRoomConfigurationDictionary(void *a1, void *a2)
{
  id v2 = a2;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    getkFigSTSLabel_Global();
    id v2 = v4;
  }
  uint64_t v5 = STS_N_Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    char v8 = v2;
    __int16 v9 = 2112;
    int v10 = a1;
    _os_log_impl(&dword_23773E000, v5, OS_LOG_TYPE_DEFAULT, "STSSetRoomConfigurationDictionary with label=\"%@\", config=%@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  STS_N::SetPropertyForLabel(v6, 0, v2, @"RoomConfiguration", a1);
}

uint64_t STSAddForcedReconfigurationCallback(void *a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  id v5 = v3;
  os_unfair_lock_lock(v4);
  uint64_t v6 = objc_msgSend(*(id *)(STS_N::InfoForLabel((STS_N *)v4, a1) + 144), "addCallback:", v5);
  os_unfair_lock_unlock(v4);

  return v6;
}

void sub_237746018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void STSRemoveForcedReconfigurationCallback(void *a1, uint64_t a2)
{
  uint64_t v4 = CADeprecated::TSingleton<STS_N>::instance();
  os_unfair_lock_lock((os_unfair_lock_t)v4);
  uint64_t v5 = STS_N::InfoForLabel((STS_N *)v4, a1);
  [*(id *)(v5 + 144) removeCallback:a2];
  if (STS_N::CanDeleteSpatializerInfo(v4, (unsigned __int8 *)v5))
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[a1 UTF8String]);
    uint64_t v6 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>((void *)(v4 + 8), (unsigned __int8 *)__p);
    if (v6)
    {
      std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove((uint64_t)v9, (void *)(v4 + 8), v6);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)v9);
    }
    if (v8 < 0) {
      operator delete(__p[0]);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)v4);
}

void sub_237746104(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STSTrackedLabelCount()
{
  uint64_t v0 = CADeprecated::TSingleton<STS_N>::instance();
  os_unfair_lock_lock((os_unfair_lock_t)v0);
  uint64_t v1 = *(void *)(v0 + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)v0);
  return v1;
}

const char *STSSoundStageController::SoundStageSizeToString(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 < 5) {
    return off_264CE4798[a1];
  }
  id v3 = STSSoundStageControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315650;
    uint64_t v5 = "STSSoundStageController.mm";
    __int16 v6 = 1024;
    int v7 = 28;
    __int16 v8 = 1024;
    unsigned int v9 = a1;
    _os_log_impl(&dword_23773E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d SoundStageSizeToString failed to find string for input SoundStageSize of value: %u. Returning emtpy string", (uint8_t *)&v4, 0x18u);
  }

  return "";
}

id STSSoundStageControllerLog(void)
{
  unint64_t v0 = 0x268925000uLL;
  {
    unint64_t v0 = 0x268925000;
    if (v3)
    {
      STSSoundStageControllerLog(void)::sLog = (uint64_t)os_log_create("com.apple.STS-N", "STSSoundStageController");
      unint64_t v0 = 0x268925000;
    }
  }
  uint64_t v1 = *(void **)(v0 + 944);

  return v1;
}

uint64_t STSCreateFlavorN(const __CFAllocator *a1, const void *a2, CFTypeRef *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v29 = 0;
  float v30 = &v29;
  uint64_t v31 = 0x2020000000;
  __int16 v6 = (uint64_t (*)(void))getFigSTSGetClassIDSymbolLoc(void)::ptr;
  unint64_t v32 = getFigSTSGetClassIDSymbolLoc(void)::ptr;
  if (!getFigSTSGetClassIDSymbolLoc(void)::ptr)
  {
    *(void *)std::string buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZL28getFigSTSGetClassIDSymbolLocv_block_invoke;
    int8x8_t v34 = &unk_264CE47C8;
    unint64_t v35 = &v29;
    int v7 = MediaExperienceLibrary();
    __int16 v8 = dlsym(v7, "FigSTSGetClassID");
    *(void *)(v35[1] + 24) = v8;
    getFigSTSGetClassIDSymbolLoc(void)::ptr = *(_UNKNOWN **)(v35[1] + 24);
    __int16 v6 = (uint64_t (*)(void))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v6)
  {
    uint8x8_t v26 = (void *)[MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CMBaseClassID softLink_FigSTSGetClassID()"), @"STS_N.mm", 34, @"%s", dlerror());
    goto LABEL_27;
  }
  uint64_t v9 = v6();
  uint64_t v29 = 0;
  float v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v10 = (uint64_t (*)(const __CFAllocator *, void *, uint64_t, CFTypeRef *))getCMDerivedObjectCreateSymbolLoc(void)::ptr;
  unint64_t v32 = getCMDerivedObjectCreateSymbolLoc(void)::ptr;
  if (!getCMDerivedObjectCreateSymbolLoc(void)::ptr)
  {
    *(void *)std::string buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZL33getCMDerivedObjectCreateSymbolLocv_block_invoke;
    int8x8_t v34 = &unk_264CE47C8;
    unint64_t v35 = &v29;
    uint64_t v11 = CoreMediaLibrary();
    uint64_t v12 = dlsym(v11, "CMDerivedObjectCreate");
    *(void *)(v35[1] + 24) = v12;
    getCMDerivedObjectCreateSymbolLoc(void)::ptr = *(_UNKNOWN **)(v35[1] + 24);
    uint64_t v10 = (uint64_t (*)(const __CFAllocator *, void *, uint64_t, CFTypeRef *))v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v10)
  {
    uint64_t v27 = (void *)[MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "OSStatus softLink_CMDerivedObjectCreate(CFAllocatorRef, const CMBaseVTable *, CMBaseClassID, CMBaseObjectRef *)"), @"STS_N.mm", 29, @"%s", dlerror());
LABEL_27:
    __break(1u);
  }
  uint64_t v13 = v10(a1, &kSTS_N_VTable, v9, &cf);
  if (v13)
  {
    std::string v14 = STS_N_Log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = "STSCreateFlavorN";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 632;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      _os_log_error_impl(&dword_23773E000, v14, OS_LOG_TYPE_ERROR, "%s:%d error: %d", buf, 0x18u);
    }
LABEL_10:
    if (cf) {
      CFRelease(cf);
    }
    return v13;
  }
  DerivedStorage = (void *)softLink_CMBaseObjectGetDerivedStorage((uint64_t)cf);
  void *DerivedStorage = 0;
  DerivedStorage[1] = 0;
  uint64_t v16 = (char *)operator new(0x78uLL);
  *((void *)v16 + 1) = 0;
  *((void *)v16 + 2) = 0;
  *(void *)uint64_t v16 = &unk_26EA76FA8;
  *(_OWORD *)(v16 + 24) = 0u;
  unint64_t v17 = v16 + 24;
  *(_OWORD *)(v16 + 40) = 0u;
  *(_OWORD *)(v16 + 56) = 0u;
  *(_OWORD *)(v16 + 72) = 0u;
  *(_OWORD *)(v16 + 88) = 0u;
  *(_OWORD *)(v16 + 104) = 0u;
  MEMORY[0x237E1E700](v16 + 64);
  *((_WORD *)v16 + 36) = 0;
  *((_OWORD *)v16 + 5) = 0u;
  *((_OWORD *)v16 + 6) = 0u;
  *((_DWORD *)v16 + 28) = 1065353216;
  *(void *)&long long v18 = v16 + 24;
  *((void *)&v18 + 1) = v16;
  unint64_t v19 = (std::__shared_weak_count *)DerivedStorage[1];
  *(_OWORD *)DerivedStorage = v18;
  if (v19)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    unint64_t v17 = (void *)*DerivedStorage;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x263EFFF88], &STSCreateFlavorN::perLabelInfoDictCallbacks);
  v17[2] = Mutable;
  if (!Mutable)
  {
    uint8x8_t v22 = STS_N_Log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "STSCreateFlavorN";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 642;
      _os_log_error_impl(&dword_23773E000, v22, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    }
    uint64_t v13 = 4294951305;
    goto LABEL_10;
  }
  if (a2) {
    CFTypeRef v21 = CFRetain(a2);
  }
  else {
    CFTypeRef v21 = 0;
  }
  v17[1] = v21;
  unint64_t v23 = STS_N_Log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = getkFigSTSFlavor_N();
    *(_DWORD *)std::string buf = 138412802;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = cf;
    *(_WORD *)&unsigned char buf[22] = 2048;
    int8x8_t v34 = v17;
    _os_log_impl(&dword_23773E000, v23, OS_LOG_TYPE_DEFAULT, "Created new %@ flavor sts %p (%p)", buf, 0x20u);
  }
  uint64_t v13 = 0;
  *a3 = cf;
  return v13;
}

void sub_23774678C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::__shared_weak_count::~__shared_weak_count(v11);
  operator delete(v13);
  _Unwind_Resume(a1);
}

void *___ZL28getFigSTSGetClassIDSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MediaExperienceLibrary();
  uint64_t result = dlsym(v2, "FigSTSGetClassID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFigSTSGetClassIDSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *MediaExperienceLibrary(void)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!MediaExperienceLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = ___ZL26MediaExperienceLibraryCorePPc_block_invoke_72;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264CE4820;
    uint64_t v6 = 0;
    MediaExperienceLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  unint64_t v0 = (void *)MediaExperienceLibraryCore(char **)::frameworkLibrary;
  if (!MediaExperienceLibraryCore(char **)::frameworkLibrary)
  {
    unint64_t v0 = (void *)[MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *MediaExperienceLibrary()"];
    uint64_t v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"STS_N.mm", 33, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *___ZL33getCMDerivedObjectCreateSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = CoreMediaLibrary();
  uint64_t result = dlsym(v2, "CMDerivedObjectCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMDerivedObjectCreateSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *CoreMediaLibrary(void)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x263EF8330];
    v4[2] = (void *)3221225472;
    v4[3] = ___ZL20CoreMediaLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264CE47E8;
    uint64_t v6 = 0;
    CoreMediaLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  unint64_t v0 = (void *)CoreMediaLibraryCore(char **)::frameworkLibrary;
  if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
  {
    unint64_t v0 = (void *)[MEMORY[0x263F08690] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *CoreMediaLibrary()"];
    uint64_t v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"STS_N.mm", 27, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t softLink_CMBaseObjectGetDerivedStorage(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t))getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr;
  uint64_t v9 = getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr;
  if (!getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr)
  {
    uint64_t v3 = CoreMediaLibrary();
    v7[3] = (uint64_t)dlsym(v3, "CMBaseObjectGetDerivedStorage");
    getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2) {
    return v2(a1);
  }
  long long v5 = (void *)[MEMORY[0x263F08690] currentHandler];
  uint64_t result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *softLink_CMBaseObjectGetDerivedStorage(CMBaseObjectRef)"), @"STS_N.mm", 28, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_237746C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

uint64_t getkFigSTSFlavor_N(void)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkFigSTSFlavor_NSymbolLoc(void)::ptr;
  uint64_t v7 = getkFigSTSFlavor_NSymbolLoc(void)::ptr;
  if (!getkFigSTSFlavor_NSymbolLoc(void)::ptr)
  {
    uint64_t v1 = MediaExperienceLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kFigSTSFlavor_N");
    getkFigSTSFlavor_NSymbolLoc(void)::ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return *(void *)v0;
  }
  uint64_t v3 = (void *)[MEMORY[0x263F08690] currentHandler];
  uint64_t result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkFigSTSFlavor_N()"), @"STS_N.mm", 35, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_237746DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL27getkFigSTSFlavor_NSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = MediaExperienceLibrary();
  uint64_t result = dlsym(v2, "kFigSTSFlavor_N");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkFigSTSFlavor_NSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void PerLabelInfoDictReleaseCallBack(const __CFAllocator *a1, CFTypeRef *a2)
{
  if (a2)
  {
    if (*a2) {
      CFRelease(*a2);
    }
    JUMPOUT(0x237E1E7F0);
  }
}

void std::__shared_ptr_emplace<STS_N_Storage>::__on_zero_shared(void *a1)
{
  id v2 = (void *)a1[7];
  if (v2)
  {
    unint64_t v3 = 0xE970uLL / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
    if (v3 == 59760) {
      size_t v4 = 59760;
    }
    else {
      size_t v4 = *MEMORY[0x263EF8AF8] + v3;
    }
    munmap(v2, v4);
  }
  long long v5 = (const void *)a1[4];
  if (v5)
  {
    CFRelease(v5);
    a1[4] = 0;
  }
  uint64_t v6 = (const void *)a1[5];
  if (v6)
  {
    CFRelease(v6);
    a1[5] = 0;
  }
  uint64_t v7 = (void **)a1[12];
  if (v7)
  {
    do
    {
      uint64_t v8 = (void **)*v7;
      if (*((char *)v7 + 39) < 0) {
        operator delete(v7[2]);
      }
      operator delete(v7);
      uint64_t v7 = v8;
    }
    while (v8);
  }
  uint64_t v9 = (void *)a1[10];
  a1[10] = 0;
  if (v9) {
    operator delete(v9);
  }

  JUMPOUT(0x237E1E710);
}

void std::__shared_ptr_emplace<STS_N_Storage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26EA76FA8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237E1E7F0);
}

void std::__shared_ptr_emplace<STS_N_Storage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26EA76FA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void *___ZL41getCMBaseObjectGetDerivedStorageSymbolLocv_block_invoke(uint64_t a1)
{
  id v2 = CoreMediaLibrary();
  uint64_t result = dlsym(v2, "CMBaseObjectGetDerivedStorage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCMBaseObjectGetDerivedStorageSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL20CoreMediaLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMediaLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

uint64_t STS_N_CopyShmem(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)softLink_CMBaseObjectGetDerivedStorage(a1);
  os_unfair_lock_lock((os_unfair_lock_t)v6);
  if (!a2)
  {
    unint64_t v17 = STS_N_Log();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
    WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 455;
    long long v18 = v17;
LABEL_43:
    _os_log_error_impl(&dword_23773E000, v18, OS_LOG_TYPE_ERROR, "%s:%d error", (uint8_t *)&buf, 0x12u);
    goto LABEL_21;
  }
  uint64_t v7 = STS_N_Log();
  uint64_t v8 = v7;
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 134218242;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a1;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)a2;
      _os_log_impl(&dword_23773E000, v8, OS_LOG_TYPE_DEFAULT, "sts %p copy shmemName \"%@\"", (uint8_t *)&buf, 0x16u);
    }
    if (!CFEqual(a2, @"SharedStorage"))
    {
      xpc_object_t v13 = 0;
      uint64_t v19 = 4294951299;
LABEL_49:
      *a3 = v13;
      goto LABEL_50;
    }
    uint64_t v9 = (unint64_t *)MEMORY[0x263EF8AF8];
    unint64_t v10 = 0xE970uLL / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
    if (v10 == 59760) {
      size_t v11 = 59760;
    }
    else {
      size_t v11 = *MEMORY[0x263EF8AF8] + v10;
    }
    uint64_t v12 = *(void *)(v6 + 32);
    if (!v12)
    {
      unint64_t v20 = mmap(0, v11, 3, 4097, -1, 0);
      *(void *)(v6 + 32) = v20;
      if (!v20)
      {
        uint64_t v31 = STS_N_Log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
          WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 467;
          goto LABEL_40;
        }
        goto LABEL_41;
      }
      bzero(v20, v11);
      CFTypeRef v21 = *(void **)(v6 + 32);
      bzero(v21, 0xE970uLL);
      uint64_t v22 = 0;
      *(_DWORD *)CFTypeRef v21 = -1;
      do
      {
        unint64_t v23 = &v21[v22];
        *((unsigned char *)v23 + 16) = 0;
        *((unsigned char *)v23 + 112) = 0;
        v22 += 14;
      }
      while (v22 != 42);
      uint64_t v24 = 0;
      v21[44] = 0;
      unint64_t v25 = v21;
      do
      {
        uint64_t v26 = 0;
        v21[116 * v24 + 46] = 0xFFFFFFFFLL;
        do
        {
          uint64_t v27 = &v25[v26];
          *((unsigned char *)v27 + 384) = 0;
          *((unsigned char *)v27 + 672) = 0;
          v26 += 38;
        }
        while (v26 != 114);
        ++v24;
        v25 += 116;
      }
      while (v24 != 64);
      uint64_t v28 = STS_N_Log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v29 = *v9;
        uint64_t v30 = [MEMORY[0x263EFC0C0] maxNumberOfPerLabelStates];
        LODWORD(buf.__r_.__value_.__l.__data_) = 134219520;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a1;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v11;
        HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
        size_t v37 = v11 / v29;
        *(_WORD *)char v38 = 2048;
        *(void *)&v38[2] = v29;
        __int16 v39 = 2048;
        uint8x8_t v40 = v21;
        __int16 v41 = 2048;
        uint64_t v42 = 59760;
        __int16 v43 = 2048;
        uint64_t v44 = v30;
        _os_log_impl(&dword_23773E000, v28, OS_LOG_TYPE_DEFAULT, "sts %p created %zd-byte (%lu pages of %zd bytes each) sharedMemoryRegion %p to cover storage of size %zd bytes with a capacity for %zu labels", (uint8_t *)&buf, 0x48u);
      }
    }
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    if (v13)
    {
      xpc_object_t v14 = xpc_shmem_create(*(void **)(v6 + 32), v11);
      if (v14)
      {
        xpc_dictionary_set_value(v13, "sharedstorage", v14);
        xpc_release(v14);
        int v15 = (void *)xpc_mach_send_create();
        if (v15)
        {
          xpc_dictionary_set_value(v13, "controlsemaphore", v15);
          xpc_release(v15);
          xpc_dictionary_set_BOOL(v13, "allowautomaticheadtracking", *(unsigned char *)(v6 + 49));
          if (!v12)
          {
            uint64_t v16 = *(void *)(softLink_CMBaseObjectGetDerivedStorage(a1) + 8);
            if (v16) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 16), 1uLL, memory_order_relaxed);
            }
            std::string::basic_string[abi:ne180100]<0>(&__p, "spatial tracking service");
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&buf, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            }
            else {
              std::string buf = __p;
            }
            LOBYTE(v37) = 1;
            *(void *)char v38 = 0x100000037;
            HIDWORD(v40) = 2;
            LOBYTE(v41) = 1;
            *(_DWORD *)((char *)&v42 + 2) = 1;
            BYTE6(v42) = 1;
            if (v16) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 16), 1uLL, memory_order_relaxed);
            }
            uint64_t v34 = 0;
            char v35 = 0;
            operator new();
          }
          uint64_t v19 = 0;
          goto LABEL_49;
        }
        uint64_t v31 = STS_N_Log();
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          goto LABEL_41;
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 492;
        goto LABEL_40;
      }
      uint64_t v31 = STS_N_Log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 486;
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v31 = STS_N_Log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 482;
LABEL_40:
        _os_log_error_impl(&dword_23773E000, v31, OS_LOG_TYPE_ERROR, "%s:%d error", (uint8_t *)&buf, 0x12u);
      }
    }
LABEL_41:
    uint64_t v19 = 4294951305;
    goto LABEL_50;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"STS_N_CopyShmem";
    WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 456;
    long long v18 = v8;
    goto LABEL_43;
  }
LABEL_21:
  uint64_t v19 = 4294951306;
LABEL_50:
  os_unfair_lock_unlock((os_unfair_lock_t)v6);
  return v19;
}

void sub_237747704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
  os_unfair_lock_unlock(v23);
  _Unwind_Resume(a1);
}

std::string *std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](std::string *this, long long *a2)
{
  this->__r_.__value_.__s.__data_[0] = 0;
  this[1].__r_.__value_.__s.__data_[0] = 0;
  if (*((unsigned char *)a2 + 24))
  {
    if (*((char *)a2 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    }
    else
    {
      long long v3 = *a2;
      this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
      *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
    }
    this[1].__r_.__value_.__s.__data_[0] = 1;
  }
  return this;
}

void sub_237747824(_Unwind_Exception *exception_object)
{
  if (*(unsigned char *)(v1 + 24))
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    long long v3 = *(std::__shared_weak_count **)(v2 + 80);
    if (v3) {
      std::__shared_weak_count::__release_weak(v3);
    }
    if (*(unsigned char *)(v2 + 24) && *(char *)(v2 + 23) < 0) {
      operator delete(*(void **)v2);
    }
    MEMORY[0x237E1E7F0](v2, 0x1032C40A8465C26);
  }
  return a1;
}

uint64_t caulk::thread_proxy<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>(caulk::thread::attributes *a1)
{
  uint64_t v205 = *MEMORY[0x263EF8340];
  v184 = a1;
  caulk::thread::attributes::apply_to_this_thread(a1);
  long long v3 = v184;
  *(void *)&long long v4 = 136315650;
  long long v173 = v4;
  while (1)
  {
    long long v5 = (std::__shared_weak_count *)*((void *)v3 + 10);
    if (!v5) {
      break;
    }
    uint64_t v6 = std::__shared_weak_count::lock(v5);
    uint64_t v7 = v6;
    if (!v6) {
      goto LABEL_402;
    }
    uint64_t v8 = *((void *)v3 + 9);
    if (!v8) {
      goto LABEL_402;
    }
    uint64_t v9 = *(unsigned int *)(v8 + 40);
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    int v10 = MEMORY[0x237E1EB90](v9);
    int v11 = v10;
    if (v10 != 14)
    {
      if (v10)
      {
        v172 = STS_N_Log();
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v11;
          _os_log_error_impl(&dword_23773E000, v172, OS_LOG_TYPE_ERROR, "exiting spatial tracking service update thread because wait returned %d", buf, 8u);
        }
        goto LABEL_406;
      }
      uint64_t v12 = (std::__shared_weak_count *)*((void *)v3 + 10);
      if (!v12 || (xpc_object_t v13 = std::__shared_weak_count::lock(v12)) == 0)
      {
        v181 = 0;
LABEL_14:
        uint64_t v19 = STS_N_Log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl(&dword_23773E000, v19, OS_LOG_TYPE_DEFAULT, "exiting spatial tracking service update thread after successful wait because storage destructed", buf, 2u);
        }
        char v20 = 0;
        goto LABEL_397;
      }
      uint64_t v14 = *((void *)v3 + 9);
      v181 = v13;
      if (!v14) {
        goto LABEL_14;
      }
      v174 = v3;
      unint64_t v180 = *((void *)v3 + 8);
      os_unfair_lock_lock((os_unfair_lock_t)v14);
      int v15 = *(unsigned int **)(v14 + 32);
      if (!v15) {
        goto LABEL_396;
      }
      unsigned int v16 = atomic_load(v15);
      unsigned int v17 = HIWORD(v16);
      if (HIWORD(v16) == 0xFFFF)
      {
        LOWORD(v18) = v16;
LABEL_20:
        unsigned int v17 = (unsigned __int16)v18;
        if ((unsigned __int16)v18 == 0xFFFF)
        {
          if (!*(unsigned char *)(v14 + 49)) {
            goto LABEL_36;
          }
          uint64_t v21 = 0;
          uint64_t v22 = 0;
          long long v23 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
          *(_OWORD *)std::string buf = *MEMORY[0x263EF89A8];
          long long v198 = v23;
          long long v24 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
          long long v199 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
          long long v200 = v24;
LABEL_31:
          uint64_t v30 = CADeprecated::TSingleton<STS_N>::instance();
          v189[0] = v22;
          v189[1] = v21;
          long long v190 = *(_OWORD *)buf;
          long long v191 = v198;
          long long v192 = v199;
          long long v193 = v200;
          STS_N::UpdateGlobalState(v30, (uint64_t)v189);
          goto LABEL_36;
        }
      }
      else
      {
        unsigned int v18 = v16;
        while (1)
        {
          atomic_compare_exchange_strong((atomic_uint *volatile)v15, &v18, v17 | 0xFFFF0000);
          if (v18 == v16) {
            break;
          }
          unsigned int v17 = HIWORD(v18);
          unsigned int v16 = v18;
          if (HIWORD(v18) == 0xFFFF) {
            goto LABEL_20;
          }
        }
      }
      unint64_t v25 = &v15[28 * v17];
      if (!*((unsigned char *)v25 + 112)) {
        goto LABEL_410;
      }
      uint64_t v26 = v25 + 4;
      unint64_t v27 = *((void *)v25 + 2);
      unint64_t v28 = *(void *)(v14 + 24);
      if (v27) {
        BOOL v29 = v27 == v28;
      }
      else {
        BOOL v29 = 1;
      }
      if (v29)
      {
        if (!*(unsigned char *)(v14 + 49)) {
          goto LABEL_36;
        }
        uint64_t v22 = *((void *)v26 + 2);
        uint64_t v21 = *((void *)v26 + 3);
        *(_OWORD *)std::string buf = *((_OWORD *)v26 + 2);
        long long v198 = *((_OWORD *)v26 + 3);
        long long v199 = *((_OWORD *)v26 + 4);
        long long v200 = *((_OWORD *)v26 + 5);
        goto LABEL_31;
      }
      if (v27 < v28)
      {
        uint64_t v31 = STS_N_Log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl(&dword_23773E000, v31, OS_LOG_TYPE_DEFAULT, "global state cycled generations", buf, 2u);
        }
      }
      *(void *)(v14 + 24) = *(void *)v26;
      uint64_t v32 = CADeprecated::TSingleton<STS_N>::instance();
      long long v198 = *((_OWORD *)v26 + 2);
      long long v199 = *((_OWORD *)v26 + 3);
      long long v200 = *((_OWORD *)v26 + 4);
      long long v201 = *((_OWORD *)v26 + 5);
      *(_OWORD *)std::string buf = *((_OWORD *)v26 + 1);
      STS_N::UpdateGlobalState(v32, (uint64_t)buf);
LABEL_36:
      size_t v33 = *(void *)(v14 + 80);
      long long v186 = 0u;
      long long v187 = 0u;
      float v188 = 1.0;
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)&v186, v33);
      uint64_t v34 = *(uint64_t **)(v14 + 72);
      v182 = (unsigned __int8 *)(v14 + 72);
      uint64_t v183 = v14;
      if (!v34) {
        goto LABEL_87;
      }
      do
      {
        if (*((char *)v34 + 39) < 0) {
          std::string::__init_copy_ctor_external(&v202, (const std::string::value_type *)v34[2], v34[3]);
        }
        else {
          std::string v202 = *(std::string *)(v34 + 2);
        }
        uint64_t v203 = v34[5];
        int v35 = SHIBYTE(v202.__r_.__value_.__r.__words[2]);
        if (SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v204, v202.__r_.__value_.__l.__data_, v202.__r_.__value_.__l.__size_);
        }
        else {
          std::string v204 = v202;
        }
        unint64_t v36 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v204);
        unint64_t v37 = v36;
        unint64_t v38 = *((void *)&v186 + 1);
        if (!*((void *)&v186 + 1)) {
          goto LABEL_59;
        }
        uint8x8_t v39 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v186 + 8));
        v39.i16[0] = vaddlv_u8(v39);
        unint64_t v40 = v39.u32[0];
        if (v39.u32[0] > 1uLL)
        {
          unint64_t k = v36;
          if (v36 >= *((void *)&v186 + 1)) {
            unint64_t k = v36 % *((void *)&v186 + 1);
          }
        }
        else
        {
          unint64_t k = (*((void *)&v186 + 1) - 1) & v36;
        }
        __int16 v41 = *(unsigned __int8 ***)(v186 + 8 * k);
        if (!v41 || (uint64_t v42 = *v41) == 0)
        {
LABEL_59:
          uint64_t v44 = (char *)operator new(0x28uLL);
          *(void *)uint64_t v44 = 0;
          *((void *)v44 + 1) = v37;
          *(std::string *)(v44 + 16) = v204;
          memset(&v204, 0, sizeof(v204));
          float v45 = (float)(unint64_t)(*((void *)&v187 + 1) + 1);
          uint64_t v14 = v183;
          if (!v38 || (float)(v188 * (float)v38) < v45)
          {
            BOOL v46 = (v38 & (v38 - 1)) != 0;
            if (v38 < 3) {
              BOOL v46 = 1;
            }
            unint64_t v47 = v46 | (2 * v38);
            unint64_t v48 = vcvtps_u32_f32(v45 / v188);
            if (v47 <= v48) {
              size_t v49 = v48;
            }
            else {
              size_t v49 = v47;
            }
            std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)&v186, v49);
            unint64_t v38 = *((void *)&v186 + 1);
            if ((*((void *)&v186 + 1) & (*((void *)&v186 + 1) - 1)) != 0)
            {
              if (v37 >= *((void *)&v186 + 1)) {
                unint64_t k = v37 % *((void *)&v186 + 1);
              }
              else {
                unint64_t k = v37;
              }
            }
            else
            {
              unint64_t k = (*((void *)&v186 + 1) - 1) & v37;
            }
          }
          uint64_t v50 = v186;
          unint64_t v51 = *(void **)(v186 + 8 * k);
          if (v51)
          {
            *(void *)uint64_t v44 = *v51;
            goto LABEL_79;
          }
          *(void *)uint64_t v44 = v187;
          *(void *)&long long v187 = v44;
          *(void *)(v50 + 8 * k) = &v187;
          if (*(void *)v44)
          {
            unint64_t v52 = *(void *)(*(void *)v44 + 8);
            if ((v38 & (v38 - 1)) != 0)
            {
              if (v52 >= v38) {
                v52 %= v38;
              }
            }
            else
            {
              v52 &= v38 - 1;
            }
            unint64_t v51 = (void *)(v186 + 8 * v52);
LABEL_79:
            *unint64_t v51 = v44;
          }
          ++*((void *)&v187 + 1);
          goto LABEL_81;
        }
        while (1)
        {
          unint64_t v43 = *((void *)v42 + 1);
          if (v43 == v37) {
            break;
          }
          if (v40 > 1)
          {
            if (v43 >= v38) {
              v43 %= v38;
            }
          }
          else
          {
            v43 &= v38 - 1;
          }
          if (v43 != k) {
            goto LABEL_59;
          }
LABEL_58:
          uint64_t v42 = *(unsigned __int8 **)v42;
          if (!v42) {
            goto LABEL_59;
          }
        }
        if (!std::equal_to<std::string>::operator()[abi:ne180100](v42 + 16, (unsigned __int8 *)&v204)) {
          goto LABEL_58;
        }
        uint64_t v14 = v183;
        if (SHIBYTE(v204.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v204.__r_.__value_.__l.__data_);
        }
LABEL_81:
        if (v35 < 0) {
          operator delete(v202.__r_.__value_.__l.__data_);
        }
        uint64_t v34 = (uint64_t *)*v34;
      }
      while (v34);
LABEL_87:
      unint64_t v53 = 0;
      long long v54 = (void **)(v14 + 56);
      unint64_t v55 = 0x9DDFEA08EB382D69 * (((8 * v180) + 8) ^ HIDWORD(v180));
      unint64_t v56 = HIDWORD(v180) ^ (v55 >> 47) ^ v55;
      unint64_t v57 = atomic_load((unint64_t *)(*(void *)(v14 + 32) + 352));
      unint64_t v179 = 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v56) ^ ((0x9DDFEA08EB382D69 * v56) >> 47));
      unint64_t v176 = v57;
      while (v53 < objc_msgSend(MEMORY[0x263EFC0C0], "maxNumberOfPerLabelStates", v173))
      {
        if (v53 > 0x3F || ((v57 >> v53) & 1) == 0) {
          goto LABEL_288;
        }
        uint64_t v58 = *(void *)(v14 + 32) + 368;
        uint64_t v59 = (unsigned int *)(v58 + 928 * v53);
        unsigned int v60 = atomic_load(v59);
        unsigned int v61 = HIWORD(v60);
        if (HIWORD(v60) == 0xFFFF)
        {
          LOWORD(v62) = v60;
LABEL_96:
          unsigned int v61 = (unsigned __int16)v62;
          if ((unsigned __int16)v62 == 0xFFFF) {
            goto LABEL_288;
          }
        }
        else
        {
          unsigned int v62 = v60;
          while (1)
          {
            atomic_compare_exchange_strong((atomic_uint *volatile)v59, &v62, v61 | 0xFFFF0000);
            if (v62 == v60) {
              break;
            }
            unsigned int v61 = HIWORD(v62);
            unsigned int v60 = v62;
            if (HIWORD(v62) == 0xFFFF) {
              goto LABEL_96;
            }
          }
        }
        uint64_t v63 = v58 + 928 * v53 + 304 * v61;
        if (!*(unsigned char *)(v63 + 304))
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_410:
          _os_assert_log();
          _os_crash();
          __break(1u);
        }
        if (*(void *)(v63 + 16))
        {
          v177 = (unint64_t *)(v63 + 16);
          std::string::size_type v64 = v63 + 24;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)(v63 + 24));
          unint64_t v65 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
          unint64_t v66 = *((void *)&v186 + 1);
          if (*((void *)&v186 + 1))
          {
            unint64_t v67 = v65;
            uint8x8_t v68 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v186 + 8));
            v68.i16[0] = vaddlv_u8(v68);
            unint64_t v69 = v68.u32[0];
            if (v68.u32[0] > 1uLL)
            {
              unint64_t v70 = v65;
              if (v65 >= *((void *)&v186 + 1)) {
                unint64_t v70 = v65 % *((void *)&v186 + 1);
              }
            }
            else
            {
              unint64_t v70 = (*((void *)&v186 + 1) - 1) & v65;
            }
            uint64_t v71 = v186;
            uint64_t v72 = *(uint64_t **)(v186 + 8 * v70);
            if (v72)
            {
              uint64_t v2 = *v72;
              if (*v72)
              {
                uint64_t v73 = *((void *)&v186 + 1) - 1;
                do
                {
                  unint64_t v74 = *(void *)(v2 + 8);
                  if (v74 == v67)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)(v2 + 16), (unsigned __int8 *)&__p))
                    {
                      if (v69 > 1)
                      {
                        if (v67 >= v66) {
                          v67 %= v66;
                        }
                      }
                      else
                      {
                        v67 &= v73;
                      }
                      uint64_t v75 = *(long long **)(v71 + 8 * v67);
                      do
                      {
                        uint64_t v76 = v75;
                        uint64_t v75 = *(long long **)v75;
                      }
                      while (v75 != (long long *)v2);
                      if (v76 == &v187) {
                        goto LABEL_134;
                      }
                      unint64_t v77 = *((void *)v76 + 1);
                      if (v69 > 1)
                      {
                        if (v77 >= v66) {
                          v77 %= v66;
                        }
                      }
                      else
                      {
                        v77 &= v73;
                      }
                      if (v77 != v67)
                      {
LABEL_134:
                        if (!*(void *)v2) {
                          goto LABEL_135;
                        }
                        unint64_t v78 = *(void *)(*(void *)v2 + 8);
                        if (v69 > 1)
                        {
                          if (v78 >= v66) {
                            v78 %= v66;
                          }
                        }
                        else
                        {
                          v78 &= v73;
                        }
                        if (v78 != v67) {
LABEL_135:
                        }
                          *(void *)(v71 + 8 * v67) = 0;
                      }
                      uint64_t v79 = *(void *)v2;
                      if (*(void *)v2)
                      {
                        unint64_t v80 = *(void *)(v79 + 8);
                        if (v69 > 1)
                        {
                          if (v80 >= v66) {
                            v80 %= v66;
                          }
                        }
                        else
                        {
                          v80 &= v73;
                        }
                        if (v80 != v67)
                        {
                          *(void *)(v186 + 8 * v80) = v76;
                          uint64_t v79 = *(void *)v2;
                        }
                      }
                      *(void *)uint64_t v76 = v79;
                      *(void *)uint64_t v2 = 0;
                      --*((void *)&v187 + 1);
                      std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long long>,void *>>>::operator()[abi:ne180100](1, (void **)v2);
                      break;
                    }
                  }
                  else
                  {
                    if (v69 > 1)
                    {
                      if (v74 >= v66) {
                        v74 %= v66;
                      }
                    }
                    else
                    {
                      v74 &= v73;
                    }
                    if (v74 != v70) {
                      break;
                    }
                  }
                  uint64_t v2 = *(void *)v2;
                }
                while (v2);
              }
            }
          }
          unint64_t v81 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(v54, (unsigned __int8 *)&__p);
          if (v81)
          {
            unint64_t k = (unint64_t)v81;
            int v82 = v177;
            unint64_t v83 = *((void *)v81 + 5);
            uint64_t v14 = v183;
            if (*v177 != v83)
            {
              if (*v177 < v83)
              {
                unint64_t v84 = STS_N_Log();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(v202.__r_.__value_.__l.__data_) = 136315138;
                  *(std::string::size_type *)((char *)v202.__r_.__value_.__r.__words + 4) = v64;
                  _os_log_impl(&dword_23773E000, v84, OS_LOG_TYPE_DEFAULT, "label %s cycled state generations", (uint8_t *)&v202, 0xCu);
                }
              }
              *(void *)(k + 40) = *v177;
              goto LABEL_234;
            }
LABEL_285:
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            unint64_t v57 = v176;
            goto LABEL_288;
          }
          int v82 = v177;
          unint64_t v85 = *v177;
          unint64_t v86 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
          unint64_t v87 = v86;
          uint64_t v14 = v183;
          unint64_t k = *(void *)(v183 + 64);
          if (k)
          {
            uint8x8_t v88 = (uint8x8_t)vcnt_s8((int8x8_t)k);
            v88.i16[0] = vaddlv_u8(v88);
            unint64_t v89 = v88.u32[0];
            if (v88.u32[0] > 1uLL)
            {
              uint64_t v2 = v86;
              if (v86 >= k) {
                uint64_t v2 = v86 % k;
              }
            }
            else
            {
              uint64_t v2 = (k - 1) & v86;
            }
            v90 = (void **)*((void *)*v54 + v2);
            if (v90)
            {
              v91 = (char *)*v90;
              if (*v90)
              {
                while (1)
                {
                  unint64_t v92 = *((void *)v91 + 1);
                  if (v92 == v87)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v91 + 16, (unsigned __int8 *)&__p))
                    {
                      int v82 = v177;
                      goto LABEL_233;
                    }
                  }
                  else
                  {
                    if (v89 > 1)
                    {
                      if (v92 >= k) {
                        v92 %= k;
                      }
                    }
                    else
                    {
                      v92 &= k - 1;
                    }
                    if (v92 != v2)
                    {
LABEL_166:
                      int v82 = v177;
                      break;
                    }
                  }
                  v91 = *(char **)v91;
                  if (!v91) {
                    goto LABEL_166;
                  }
                }
              }
            }
          }
          v91 = (char *)operator new(0x30uLL);
          *(void *)v91 = 0;
          *((void *)v91 + 1) = v87;
          v93 = (std::string *)(v91 + 16);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(v93, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)&v93->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            *((void *)v91 + 4) = *((void *)&__p.__r_.__value_.__l + 2);
          }
          *((void *)v91 + 5) = 0;
          float v94 = (float)(unint64_t)(*(void *)(v183 + 80) + 1);
          float v95 = *(float *)(v183 + 88);
          if (!k || (float)(v95 * (float)k) < v94)
          {
            BOOL v96 = (k & (k - 1)) != 0;
            if (k < 3) {
              BOOL v96 = 1;
            }
            unint64_t v97 = v96 | (2 * k);
            unint64_t v98 = vcvtps_u32_f32(v94 / v95);
            if (v97 <= v98) {
              int8x8_t prime = (int8x8_t)v98;
            }
            else {
              int8x8_t prime = (int8x8_t)v97;
            }
            if (*(void *)&prime == 1)
            {
              int8x8_t prime = (int8x8_t)2;
            }
            else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
            {
              int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            }
            int8x8_t v100 = *(int8x8_t *)(v183 + 64);
            if (*(void *)&prime <= *(void *)&v100)
            {
              if (*(void *)&prime < *(void *)&v100)
              {
                unint64_t v107 = vcvtps_u32_f32((float)*(unint64_t *)(v183 + 80) / *(float *)(v183 + 88));
                if (*(void *)&v100 < 3uLL
                  || (uint8x8_t v108 = (uint8x8_t)vcnt_s8(v100), v108.i16[0] = vaddlv_u8(v108), v108.u32[0] > 1uLL))
                {
                  unint64_t v107 = std::__next_prime(v107);
                }
                else
                {
                  uint64_t v109 = 1 << -(char)__clz(v107 - 1);
                  if (v107 >= 2) {
                    unint64_t v107 = v109;
                  }
                }
                if (*(void *)&prime <= v107) {
                  int8x8_t prime = (int8x8_t)v107;
                }
                if (*(void *)&prime < *(void *)&v100)
                {
                  if (prime) {
                    goto LABEL_182;
                  }
                  v112 = *v54;
                  NSObject *v54 = 0;
                  if (v112) {
                    operator delete(v112);
                  }
                  *(void *)(v183 + 64) = 0;
                }
              }
            }
            else
            {
LABEL_182:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              v101 = operator new(8 * *(void *)&prime);
              v102 = *v54;
              NSObject *v54 = v101;
              if (v102) {
                operator delete(v102);
              }
              uint64_t v103 = 0;
              *(int8x8_t *)(v183 + 64) = prime;
              do
                *((void *)*v54 + v103++) = 0;
              while (*(void *)&prime != v103);
              v104 = *(void **)v182;
              if (*(void *)v182)
              {
                unint64_t v105 = v104[1];
                uint8x8_t v106 = (uint8x8_t)vcnt_s8(prime);
                v106.i16[0] = vaddlv_u8(v106);
                if (v106.u32[0] > 1uLL)
                {
                  if (v105 >= *(void *)&prime) {
                    v105 %= *(void *)&prime;
                  }
                }
                else
                {
                  v105 &= *(void *)&prime - 1;
                }
                *((void *)*v54 + v105) = v182;
                v110 = (void *)*v104;
                if (*v104)
                {
                  do
                  {
                    unint64_t v111 = v110[1];
                    if (v106.u32[0] > 1uLL)
                    {
                      if (v111 >= *(void *)&prime) {
                        v111 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v111 &= *(void *)&prime - 1;
                    }
                    if (v111 != v105)
                    {
                      if (!*((void *)*v54 + v111))
                      {
                        *((void *)*v54 + v111) = v104;
                        goto LABEL_207;
                      }
                      void *v104 = *v110;
                      void *v110 = **((void **)*v54 + v111);
                      **((void **)*v54 + v111) = v110;
                      v110 = v104;
                    }
                    unint64_t v111 = v105;
LABEL_207:
                    v104 = v110;
                    v110 = (void *)*v110;
                    unint64_t v105 = v111;
                  }
                  while (v110);
                }
              }
            }
            unint64_t k = *(void *)(v183 + 64);
            if ((k & (k - 1)) != 0)
            {
              int v82 = v177;
              if (v87 >= k) {
                uint64_t v2 = v87 % k;
              }
              else {
                uint64_t v2 = v87;
              }
            }
            else
            {
              uint64_t v2 = (k - 1) & v87;
              int v82 = v177;
            }
          }
          v113 = (void *)*((void *)*v54 + v2);
          if (v113)
          {
            *(void *)v91 = *v113;
            goto LABEL_231;
          }
          *(void *)v91 = *(void *)v182;
          *(void *)v182 = v91;
          *((void *)*v54 + v2) = v182;
          if (*(void *)v91)
          {
            unint64_t v114 = *(void *)(*(void *)v91 + 8);
            if ((k & (k - 1)) != 0)
            {
              if (v114 >= k) {
                v114 %= k;
              }
            }
            else
            {
              v114 &= k - 1;
            }
            v113 = (char *)*v54 + 8 * v114;
LABEL_231:
            void *v113 = v91;
          }
          ++*(void *)(v183 + 80);
LABEL_233:
          *((void *)v91 + 5) = v85;
LABEL_234:
          uint64_t v2 = CADeprecated::TSingleton<STS_N>::instance();
          int v115 = *((unsigned __int8 *)v82 + 272);
          uint64_t v196 = 0;
          AudioUnitParameterValue v195 = 0.0;
          STS_N_CalculateAngularOrientationFromTransform((uint64_t)(v82 + 24), (float *)&v196, (float *)&v196 + 1, &v195);
          os_unfair_lock_lock((os_unfair_lock_t)v2);
          uint64_t v116 = STS_N::InfoForLabel(v2, (unsigned __int8 *)&__p);
          uint64_t v117 = v116;
          if (v180)
          {
            v118 = (float *)(v116 + 24);
            int8x8_t v119 = *(int8x8_t *)(v117 + 32);
            if (v119)
            {
              uint8x8_t v120 = (uint8x8_t)vcnt_s8(v119);
              v120.i16[0] = vaddlv_u8(v120);
              if (v120.u32[0] > 1uLL)
              {
                unint64_t v121 = v179;
                if (v179 >= *(void *)&v119) {
                  unint64_t v121 = v179 % *(void *)&v119;
                }
              }
              else
              {
                unint64_t v121 = v179 & (*(void *)&v119 - 1);
              }
              v122 = *(void **)(*(void *)v118 + 8 * v121);
              if (v122)
              {
                for (i = (void *)*v122; i; i = (void *)*i)
                {
                  unint64_t v124 = i[1];
                  if (v179 == v124)
                  {
                    if (i[2] == v180) {
                      goto LABEL_256;
                    }
                  }
                  else
                  {
                    if (v120.u32[0] > 1uLL)
                    {
                      if (v124 >= *(void *)&v119) {
                        v124 %= *(void *)&v119;
                      }
                    }
                    else
                    {
                      v124 &= *(void *)&v119 - 1;
                    }
                    if (v124 != v121) {
                      break;
                    }
                  }
                }
              }
            }
            std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__emplace_unique_key_args<OpaqueFigSTS *,OpaqueFigSTS * const&>(v118, v180, v180);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&v202, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            }
            else {
              std::string v202 = __p;
            }
            STS_N::LabelValidityDidChange((STS_N *)v2, (unsigned __int8 *)&v202);
            if (SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v202.__r_.__value_.__l.__data_);
            }
          }
LABEL_256:
          if (*(unsigned char *)(v117 + 152)) {
            BOOL v125 = 1;
          }
          else {
            BOOL v125 = v115 == 0;
          }
          int v126 = !v125;
          if (!v125)
          {
            unint64_t k = STS_N_Log();
            if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_DEFAULT))
            {
              p_p = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              LODWORD(v204.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
              v128 = k;
              v129 = "STSLabel %s is deferring to system tuning";
              goto LABEL_273;
            }
            goto LABEL_274;
          }
          if (*(unsigned char *)(v117 + 152) && !v115)
          {
            unint64_t k = STS_N_Log();
            if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_DEFAULT))
            {
              v130 = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v130 = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              LODWORD(v204.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)v130;
              v128 = k;
              v129 = "STSLabel %s is no longer deferring to system tuning";
LABEL_273:
              _os_log_impl(&dword_23773E000, v128, OS_LOG_TYPE_DEFAULT, v129, (uint8_t *)&v204, 0xCu);
            }
LABEL_274:
          }
          int v131 = *(unsigned __int8 *)(v117 + 240);
          *(_OWORD *)(v117 + 160) = *((_OWORD *)v82 + 12);
          long long v132 = *((_OWORD *)v82 + 16);
          long long v134 = *((_OWORD *)v82 + 13);
          long long v133 = *((_OWORD *)v82 + 14);
          *(_OWORD *)(v117 + 208) = *((_OWORD *)v82 + 15);
          *(_OWORD *)(v117 + 224) = v132;
          *(_OWORD *)(v117 + 176) = v134;
          *(_OWORD *)(v117 + 192) = v133;
          if (!v131) {
            *(unsigned char *)(v117 + 240) = 1;
          }
          *(unsigned char *)(v117 + 152) = v115;
          if (v126)
          {
            [*(id *)(v117 + 144) fireAll];
            STS_N::ApplyStoredPerLabelStateToSpatializers(v2, v117, 0);
            STS_N::SetSoundStageTransitionDurationOnSpatializers(v117);
            STS_N::SetSoundStageSizeOnSpatializers(v117, *(_DWORD *)(v117 + 136));
          }
          uint64_t v135 = *(unsigned int *)(v117 + 116);
          if (v135 == 20)
          {
            long long inData = v82 + 32;
            BOOL v178 = *((_DWORD *)v82 + 64) == 1;
          }
          else
          {
            if (*(unsigned char *)(v117 + 152) || !*(unsigned char *)(v117 + 240)) {
              int v144 = 3;
            }
            else {
              int v144 = *(_DWORD *)(v117 + 224);
            }
            long long inData = v82 + 32;
            BOOL v178 = v144 == *((_DWORD *)v82 + 64);
            if (!v135)
            {
              if (*(unsigned char *)(v2 + 176))
              {
                float32x4_t v145 = vsubq_f32(*((float32x4_t *)v82 + 15), *(float32x4_t *)(v2 + 160));
                v194[0] = v145.i32[0];
                *(float *)&v194[1] = -v145.f32[2];
                v194[2] = v145.i32[1];
                v146 = *(uint64_t **)(v117 + 80);
                if (v146)
                {
                  while (!*((unsigned char *)v146 + 24))
                  {
                    v146 = (uint64_t *)*v146;
                    if (!v146) {
                      goto LABEL_281;
                    }
                  }
                  uint64_t v147 = v135;
                  while (1)
                  {
                    OSStatus v148 = AudioUnitSetProperty((AudioUnit)v146[2], 0xC2Bu, 0, 0, v194, 0xCu);
                    if (v148)
                    {
                      unint64_t k = STS_N_Log();
                      if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                      {
                        LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                        *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                        WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                        *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 282;
                        WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                        HIDWORD(v204.__r_.__value_.__r.__words[2]) = v148;
                        _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                      }
                    }
                    v146 = (uint64_t *)*v146;
                    uint64_t v135 = v147;
                    if (!v146) {
                      break;
                    }
                    while (!*((unsigned char *)v146 + 24))
                    {
                      v146 = (uint64_t *)*v146;
                      if (!v146) {
                        goto LABEL_281;
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_281:
          v136 = *(uint64_t **)(v117 + 80);
          if (v136)
          {
            while (!*((unsigned char *)v136 + 24))
            {
              v136 = (uint64_t *)*v136;
              if (!v136) {
                goto LABEL_284;
              }
            }
            while (1)
            {
              uint64_t v137 = v135;
              if (!v135)
              {
                OSStatus v138 = AudioUnitSetParameter((AudioUnit)v136[2], 0x16u, 1u, 0, *(AudioUnitParameterValue *)&v196, 0);
                if (v138)
                {
                  unint64_t k = STS_N_Log();
                  if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                    *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 290;
                    WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v204.__r_.__value_.__r.__words[2]) = v138;
                    _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                  }
                }
                OSStatus v139 = AudioUnitSetParameter((AudioUnit)v136[2], 0x17u, 1u, 0, *((AudioUnitParameterValue *)&v196 + 1), 0);
                if (v139)
                {
                  unint64_t k = STS_N_Log();
                  if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                    *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 291;
                    WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v204.__r_.__value_.__r.__words[2]) = v139;
                    _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                  }
                }
                OSStatus v140 = AudioUnitSetParameter((AudioUnit)v136[2], 0x18u, 1u, 0, v195, 0);
                if (v140)
                {
                  unint64_t k = STS_N_Log();
                  if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                    *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 292;
                    WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v204.__r_.__value_.__r.__words[2]) = v140;
                    _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                  }
                }
              }
              if (!*(unsigned char *)(v117 + 152))
              {
                OSStatus v141 = AudioUnitSetParameter((AudioUnit)v136[2], 3u, 1u, 0, *((AudioUnitParameterValue *)v82 + 65), 0);
                if (v141)
                {
                  unint64_t k = STS_N_Log();
                  if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                    *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 298;
                    WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v204.__r_.__value_.__r.__words[2]) = v141;
                    _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                  }
                }
                OSStatus v142 = AudioUnitSetParameter((AudioUnit)v136[2], 0x23u, 1u, 0, *((AudioUnitParameterValue *)v82 + 66), 0);
                if (v142)
                {
                  unint64_t k = STS_N_Log();
                  if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                    *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 301;
                    WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v204.__r_.__value_.__r.__words[2]) = v142;
                    _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                  }
                }
              }
              if (v178)
              {
                OSStatus v143 = AudioUnitSetProperty((AudioUnit)v136[2], 0xBBDu, 1u, 0, inData, 4u);
                if (v143)
                {
                  unint64_t k = STS_N_Log();
                  if (os_log_type_enabled((os_log_t)k, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(v204.__r_.__value_.__l.__data_) = v173;
                    *(std::string::size_type *)((char *)v204.__r_.__value_.__r.__words + 4) = (std::string::size_type)"UpdateLabelState";
                    WORD2(v204.__r_.__value_.__r.__words[1]) = 1024;
                    *(_DWORD *)((char *)&v204.__r_.__value_.__r.__words[1] + 6) = 311;
                    WORD1(v204.__r_.__value_.__r.__words[2]) = 1024;
                    HIDWORD(v204.__r_.__value_.__r.__words[2]) = v143;
                    _os_log_error_impl(&dword_23773E000, (os_log_t)k, OS_LOG_TYPE_ERROR, "%s:%d error: %d", (uint8_t *)&v204, 0x18u);
                  }
                }
              }
              v136 = (uint64_t *)*v136;
              if (!v136) {
                break;
              }
              uint64_t v135 = v137;
              while (!*((unsigned char *)v136 + 24))
              {
                v136 = (uint64_t *)*v136;
                if (!v136) {
                  goto LABEL_284;
                }
              }
            }
          }
LABEL_284:
          os_unfair_lock_unlock((os_unfair_lock_t)v2);
          goto LABEL_285;
        }
LABEL_288:
        ++v53;
      }
      for (j = (uint64_t *)v187; j; uint64_t v14 = v183)
      {
        v150 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::find<std::string>(v54, (unsigned __int8 *)j + 16);
        if (v150)
        {
          int8x8_t v151 = *(int8x8_t *)(v14 + 64);
          unint64_t v152 = *((void *)v150 + 1);
          uint8x8_t v153 = (uint8x8_t)vcnt_s8(v151);
          v153.i16[0] = vaddlv_u8(v153);
          if (v153.u32[0] > 1uLL)
          {
            if (v152 >= *(void *)&v151) {
              v152 %= *(void *)&v151;
            }
          }
          else
          {
            v152 &= *(void *)&v151 - 1;
          }
          v154 = (unsigned __int8 *)*((void *)*v54 + v152);
          do
          {
            v155 = v154;
            v154 = *(unsigned __int8 **)v154;
          }
          while (v154 != v150);
          if (v155 == v182) {
            goto LABEL_360;
          }
          unint64_t v156 = *((void *)v155 + 1);
          if (v153.u32[0] > 1uLL)
          {
            if (v156 >= *(void *)&v151) {
              v156 %= *(void *)&v151;
            }
          }
          else
          {
            v156 &= *(void *)&v151 - 1;
          }
          if (v156 != v152)
          {
LABEL_360:
            if (!*(void *)v150) {
              goto LABEL_361;
            }
            unint64_t v157 = *(void *)(*(void *)v150 + 8);
            if (v153.u32[0] > 1uLL)
            {
              if (v157 >= *(void *)&v151) {
                v157 %= *(void *)&v151;
              }
            }
            else
            {
              v157 &= *(void *)&v151 - 1;
            }
            if (v157 != v152) {
LABEL_361:
            }
              *((void *)*v54 + v152) = 0;
          }
          uint64_t v158 = *(void *)v150;
          if (*(void *)v150)
          {
            unint64_t v159 = *(void *)(v158 + 8);
            if (v153.u32[0] > 1uLL)
            {
              if (v159 >= *(void *)&v151) {
                v159 %= *(void *)&v151;
              }
            }
            else
            {
              v159 &= *(void *)&v151 - 1;
            }
            if (v159 != v152)
            {
              *((void *)*v54 + v159) = v155;
              uint64_t v158 = *(void *)v150;
            }
          }
          *(void *)v155 = v158;
          *(void *)v150 = 0;
          --*(void *)(v14 + 80);
          std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long long>,void *>>>::operator()[abi:ne180100](1, (void **)v150);
        }
        uint64_t v160 = CADeprecated::TSingleton<STS_N>::instance();
        os_unfair_lock_lock((os_unfair_lock_t)v160);
        unint64_t v161 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(j + 2));
        int8x8_t v162 = *(int8x8_t *)(v160 + 16);
        if (v162)
        {
          uint64_t v2 = v161;
          uint8x8_t v163 = (uint8x8_t)vcnt_s8(v162);
          v163.i16[0] = vaddlv_u8(v163);
          unint64_t v164 = v163.u32[0];
          if (v163.u32[0] > 1uLL)
          {
            unint64_t v165 = v161;
            if (v161 >= *(void *)&v162) {
              unint64_t v165 = v161 % *(void *)&v162;
            }
          }
          else
          {
            unint64_t v165 = (*(void *)&v162 - 1) & v161;
          }
          v166 = *(unint64_t **)(*(void *)(v160 + 8) + 8 * v165);
          if (v166)
          {
            for (unint64_t k = *v166; k; unint64_t k = *(void *)k)
            {
              unint64_t v167 = *(void *)(k + 8);
              if (v2 == v167)
              {
                if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)(k + 16), (unsigned __int8 *)j + 16))
                {
                  uint64_t v168 = STS_N::InfoForLabel(v160, (unsigned __int8 *)j + 16);
                  uint64_t v169 = *(void *)(v168 + 48);
                  std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__erase_unique<OpaqueFigSTS *>((uint64_t *)(v168 + 24), v180);
                  if (v169 && !*(void *)(v168 + 48))
                  {
                    if (*((char *)j + 39) < 0) {
                      std::string::__init_copy_ctor_external(&v202, (const std::string::value_type *)j[2], j[3]);
                    }
                    else {
                      std::string v202 = *(std::string *)(j + 2);
                    }
                    STS_N::LabelValidityDidChange((STS_N *)v160, (unsigned __int8 *)&v202);
                    if (SHIBYTE(v202.__r_.__value_.__r.__words[2]) < 0) {
                      operator delete(v202.__r_.__value_.__l.__data_);
                    }
                  }
                  break;
                }
              }
              else
              {
                if (v164 > 1)
                {
                  if (v167 >= *(void *)&v162) {
                    v167 %= *(void *)&v162;
                  }
                }
                else
                {
                  v167 &= *(void *)&v162 - 1;
                }
                if (v167 != v165) {
                  break;
                }
              }
            }
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v160);
        j = (uint64_t *)*j;
      }
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v186);
LABEL_396:
      os_unfair_lock_unlock((os_unfair_lock_t)v14);
      char v20 = 1;
      long long v3 = v174;
LABEL_397:
      if (v181) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v181);
      }
      if ((v20 & 1) == 0) {
        goto LABEL_406;
      }
    }
  }
  uint64_t v7 = 0;
LABEL_402:
  v170 = STS_N_Log();
  if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_23773E000, v170, OS_LOG_TYPE_DEFAULT, "exiting spatial tracking service update thread because storage destructed", buf, 2u);
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
LABEL_406:
  std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100]((uint64_t *)&v184);
  return 0;
}

void sub_2377490F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,os_unfair_lock_s *a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31,char a32)
{
  os_unfair_lock_unlock(v32);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&a32);
  os_unfair_lock_unlock(a24);
  std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  std::unique_ptr<std::tuple<caulk::thread::attributes,STS_N_CopyShmem(OpaqueFigSTS *,__CFString const*,NSObject  {objcproto13OS_xpc_object}**)::$_0,std::tuple<>>>::~unique_ptr[abi:ne180100](&a25);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(uint64_t a1, size_t __n)
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
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      unsigned int v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  long long v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  uint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    uint64_t v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *uint64_t v8 = *v14;
          *uint64_t v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          uint64_t v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        uint64_t v8 = v14;
        uint64_t v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

uint64_t std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      long long v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned long long>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t STS_N_CopyPropertyByLabel(uint64_t a1, const void *a2, const void *a3, CFTypeRef *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  size_t v15 = 0;
  os_unfair_lock_lock(v8);
  if (!a2)
  {
    uint8x8_t v12 = STS_N_Log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)std::string buf = 136315394;
    unsigned int v17 = "STS_N_CopyPropertyByLabel";
    __int16 v18 = 1024;
    LODWORD(v19) = 425;
LABEL_14:
    _os_log_error_impl(&dword_23773E000, v12, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    goto LABEL_15;
  }
  if (!a3)
  {
    uint8x8_t v12 = STS_N_Log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_DWORD *)std::string buf = 136315394;
    unsigned int v17 = "STS_N_CopyPropertyByLabel";
    __int16 v18 = 1024;
    LODWORD(v19) = 426;
    goto LABEL_14;
  }
  if (!a4)
  {
    uint8x8_t v12 = STS_N_Log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      unsigned int v17 = "STS_N_CopyPropertyByLabel";
      __int16 v18 = 1024;
      LODWORD(v19) = 427;
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v11 = 4294951306;
    goto LABEL_16;
  }
  STS_N_EnsureInfoForLabel((uint64_t)v8, a2, &v15);
  size_t v9 = STS_N_Log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 134218498;
    unsigned int v17 = (const char *)a1;
    __int16 v18 = 2112;
    uint64_t v19 = a2;
    __int16 v20 = 2112;
    uint64_t v21 = a3;
    _os_log_debug_impl(&dword_23773E000, v9, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" copying %@", buf, 0x20u);
  }
  Value = CFDictionaryGetValue(*v15, a3);
  if (Value)
  {
    uint64_t v11 = 0;
    *a4 = CFRetain(Value);
  }
  else
  {
    uint64_t v14 = STS_N_Log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 134218242;
      unsigned int v17 = (const char *)a1;
      __int16 v18 = 2112;
      uint64_t v19 = a2;
      _os_log_error_impl(&dword_23773E000, v14, OS_LOG_TYPE_ERROR, "sts %p copying unknown label \"%@\"", buf, 0x16u);
    }
    uint64_t v11 = 4294951301;
  }
LABEL_16:
  os_unfair_lock_unlock(v8);
  return v11;
}

void sub_2377497A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

const void *STS_N_EnsureInfoForLabel(uint64_t a1, const void *a2, void *a3)
{
  uint64_t result = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (!result) {
    operator new();
  }
  *a3 = result;
  return result;
}

uint64_t getkFigSTSLabel_Global()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  uint64_t v7 = getkFigSTSLabel_GlobalSymbolLoc(void)::ptr;
  if (!getkFigSTSLabel_GlobalSymbolLoc(void)::ptr)
  {
    uint64_t v1 = MediaExperienceLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kFigSTSLabel_Global");
    getkFigSTSLabel_GlobalSymbolLoc(void)::ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return *(void *)v0;
  }
  long long v3 = (void *)[MEMORY[0x263F08690] currentHandler];
  uint64_t result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkFigSTSLabel_Global()"), @"STS_N.mm", 36, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_2377499EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke_56(uint64_t a1)
{
  uint64_t v2 = MediaExperienceLibrary();
  uint64_t result = dlsym(v2, "kFigSTSLabel_Global");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkFigSTSLabel_GlobalSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t STS_N_SetPropertyByLabel(unint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  size_t v15 = 0;
  os_unfair_lock_lock(v8);
  uint64_t v9 = 4294951306;
  if (!a2 || !a3) {
    goto LABEL_11;
  }
  STS_N_EnsureInfoForLabel((uint64_t)v8, a2, &v15);
  uint8x8_t v10 = STS_N_Log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 134218498;
    unsigned int v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = a2;
    __int16 v20 = 2112;
    CFStringRef v21 = a3;
    _os_log_debug_impl(&dword_23773E000, v10, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" setting %@", buf, 0x20u);
  }
  uint64_t v11 = v15;
  uint8x8_t v12 = *v15;
  if (a4) {
    CFDictionarySetValue(v12, a3, a4);
  }
  else {
    CFDictionaryRemoveValue(v12, a3);
  }
  if (!*((unsigned char *)v11 + 8))
  {
    uint64_t v9 = 0;
LABEL_11:
    os_unfair_lock_unlock(v8);
    return v9;
  }
  os_unfair_lock_unlock(v8);
  uint64_t v13 = (os_unfair_lock_s *)CADeprecated::TSingleton<STS_N>::instance();
  STS_N::SetPropertyForLabel(v13, a1, a2, a3, a4);
  return 0;
}

void sub_237749BB8(_Unwind_Exception *exception_object)
{
}

uint64_t STS_N_GetActive(uint64_t a1, const void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  uint64_t v15 = 0;
  os_unfair_lock_lock(v6);
  if (!a2)
  {
    uint64_t v11 = STS_N_Log();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      uint64_t v10 = 4294951306;
      goto LABEL_9;
    }
    *(_DWORD *)std::string buf = 136315394;
    unsigned int v17 = "STS_N_GetActive";
    __int16 v18 = 1024;
    LODWORD(v19) = 352;
LABEL_15:
    _os_log_error_impl(&dword_23773E000, v11, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    goto LABEL_8;
  }
  if (!a3)
  {
    uint64_t v11 = STS_N_Log();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    *(_DWORD *)std::string buf = 136315394;
    unsigned int v17 = "STS_N_GetActive";
    __int16 v18 = 1024;
    LODWORD(v19) = 353;
    goto LABEL_15;
  }
  STS_N_EnsureInfoForLabel((uint64_t)v6, a2, &v15);
  uint64_t v7 = STS_N_Log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  uint64_t v9 = v15;
  if (v8)
  {
    int v13 = *(unsigned __int8 *)(v15 + 8);
    *(_DWORD *)std::string buf = 134218498;
    if (v13) {
      uint64_t v14 = "YES";
    }
    else {
      uint64_t v14 = "NO";
    }
    unsigned int v17 = (const char *)a1;
    __int16 v18 = 2112;
    uint64_t v19 = a2;
    __int16 v20 = 2080;
    CFStringRef v21 = v14;
    _os_log_debug_impl(&dword_23773E000, v7, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" active == %s", buf, 0x20u);
  }
  uint64_t v10 = 0;
  *a3 = *(unsigned char *)(v9 + 8);
LABEL_9:
  os_unfair_lock_unlock(v6);
  return v10;
}

void sub_237749DC4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t STS_N_SetActive(uint64_t a1, const void *a2, int a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(os_unfair_lock_s **)softLink_CMBaseObjectGetDerivedStorage(a1);
  uint64_t v15 = 0;
  os_unfair_lock_lock(v6);
  if (a2)
  {
    STS_N_EnsureInfoForLabel((uint64_t)v6, a2, &v15);
    uint64_t v7 = STS_N_Log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    uint64_t v9 = v15;
    if (v8)
    {
      if (*(unsigned __int8 *)(v15 + 8) == a3) {
        int v13 = "already";
      }
      else {
        int v13 = "becomes";
      }
      uint64_t v14 = "active";
      *(_DWORD *)std::string buf = 134218754;
      unsigned int v17 = (const char *)a1;
      __int16 v18 = 2112;
      uint64_t v19 = a2;
      __int16 v20 = 2080;
      if (!a3) {
        uint64_t v14 = "inactive";
      }
      CFStringRef v21 = v13;
      __int16 v22 = 2080;
      long long v23 = v14;
      _os_log_debug_impl(&dword_23773E000, v7, OS_LOG_TYPE_DEBUG, "sts %p label \"%@\" %s %s", buf, 0x2Au);
    }
    uint64_t v10 = 0;
    *(unsigned char *)(v9 + 8) = a3;
  }
  else
  {
    uint64_t v11 = STS_N_Log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 136315394;
      unsigned int v17 = "STS_N_SetActive";
      __int16 v18 = 1024;
      LODWORD(v19) = 331;
      _os_log_error_impl(&dword_23773E000, v11, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    }
    uint64_t v10 = 4294951306;
  }
  os_unfair_lock_unlock(v6);
  return v10;
}

void sub_237749F90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t softLink_FigBaseObjectStandardNotificationBarrier(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr;
  uint64_t v9 = getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr;
  if (!getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr)
  {
    long long v3 = CoreMediaLibrary();
    v7[3] = (uint64_t)dlsym(v3, "FigBaseObjectStandardNotificationBarrier");
    getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr = (_UNKNOWN *)v7[3];
    uint64_t v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2) {
    return v2(a1);
  }
  long long v5 = (void *)[MEMORY[0x263F08690] currentHandler];
  uint64_t result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "OSStatus softLink_FigBaseObjectStandardNotificationBarrier(CMBaseObjectRef)"), @"STS_N.mm", 30, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_23774A0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *___ZL52getFigBaseObjectStandardNotificationBarrierSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = CoreMediaLibrary();
  uint64_t result = dlsym(v2, "FigBaseObjectStandardNotificationBarrier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getFigBaseObjectStandardNotificationBarrierSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

uint64_t STS_N_CopyProperty(uint64_t a1, const void *a2, uint64_t a3, CFTypeRef *a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v24 = 0;
  unint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v7 = (CFTypeRef *)getkFigSTSProperty_FlavorSymbolLoc(void)::ptr;
  uint64_t v27 = getkFigSTSProperty_FlavorSymbolLoc(void)::ptr;
  if (!getkFigSTSProperty_FlavorSymbolLoc(void)::ptr)
  {
    *(void *)std::string buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZL34getkFigSTSProperty_FlavorSymbolLocv_block_invoke;
    BOOL v29 = &unk_264CE47C8;
    uint64_t v30 = &v24;
    uint64_t v8 = MediaExperienceLibrary();
    uint64_t v9 = dlsym(v8, "kFigSTSProperty_Flavor");
    *(void *)(v30[1] + 24) = v9;
    getkFigSTSProperty_FlavorSymbolLoc(void)::ptr = *(void *)(v30[1] + 24);
    uint64_t v7 = (CFTypeRef *)v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v7)
  {
    __int16 v22 = (void *)[MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkFigSTSProperty_Flavor()"), @"STS_N.mm", 37, @"%s", dlerror());
    goto LABEL_27;
  }
  if (!CFEqual(a2, *v7))
  {
    uint64_t v12 = *(void *)softLink_CMBaseObjectGetDerivedStorage(a1);
    os_unfair_lock_lock((os_unfair_lock_t)v12);
    if (a2)
    {
      int v13 = STS_N_Log();
      uint64_t v14 = v13;
      if (a4)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::string buf = 134218242;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = a2;
          _os_log_debug_impl(&dword_23773E000, v14, OS_LOG_TYPE_DEBUG, "sts %p copying %@", buf, 0x16u);
        }
        uint64_t v24 = 0;
        unint64_t v25 = &v24;
        uint64_t v26 = 0x2020000000;
        uint64_t v15 = (CFTypeRef *)getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr;
        uint64_t v27 = getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr;
        if (!getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr)
        {
          *(void *)std::string buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = ___ZL39getkFigSTSProperty_OptionsDictSymbolLocv_block_invoke;
          BOOL v29 = &unk_264CE47C8;
          uint64_t v30 = &v24;
          unsigned int v16 = MediaExperienceLibrary();
          unsigned int v17 = dlsym(v16, "kFigSTSProperty_OptionsDict");
          *(void *)(v30[1] + 24) = v17;
          getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr = *(void *)(v30[1] + 24);
          uint64_t v15 = (CFTypeRef *)v25[3];
        }
        _Block_object_dispose(&v24, 8);
        if (!v15)
        {
          while (1)
          {
            long long v23 = (void *)[MEMORY[0x263F08690] currentHandler];
            objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkFigSTSProperty_OptionsDict()"), @"STS_N.mm", 38, @"%s", dlerror());
LABEL_27:
            __break(1u);
          }
        }
        if (CFEqual(a2, *v15))
        {
          CFTypeRef v18 = *(CFTypeRef *)(v12 + 8);
          if (v18) {
            CFTypeRef v18 = CFRetain(v18);
          }
          uint64_t v11 = 0;
          *a4 = v18;
        }
        else
        {
          uint64_t v11 = 4294954512;
        }
        goto LABEL_21;
      }
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        uint64_t v11 = 4294951306;
LABEL_21:
        os_unfair_lock_unlock((os_unfair_lock_t)v12);
        return v11;
      }
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "STS_N_CopyProperty";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 307;
      __int16 v20 = v14;
    }
    else
    {
      uint64_t v19 = STS_N_Log();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "STS_N_CopyProperty";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 306;
      __int16 v20 = v19;
    }
    _os_log_error_impl(&dword_23773E000, v20, OS_LOG_TYPE_ERROR, "%s:%d error", buf, 0x12u);
    goto LABEL_20;
  }
  uint64_t v10 = (const void *)getkFigSTSFlavor_N();
  uint64_t v11 = 0;
  *a4 = CFRetain(v10);
  return v11;
}

void sub_23774A554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock(v3);
  _Unwind_Resume(a1);
}

void *___ZL34getkFigSTSProperty_FlavorSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaExperienceLibrary();
  uint64_t result = dlsym(v2, "kFigSTSProperty_Flavor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkFigSTSProperty_FlavorSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL39getkFigSTSProperty_OptionsDictSymbolLocv_block_invoke(uint64_t a1)
{
  uint64_t v2 = MediaExperienceLibrary();
  uint64_t result = dlsym(v2, "kFigSTSProperty_OptionsDict");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkFigSTSProperty_OptionsDictSymbolLoc(void)::ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *STS_N_CopyDebugDescription(const void *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(v2, 0);
  CFIndex v4 = CFGetRetainCount(a1);
  CFStringAppendFormat(Mutable, 0, @"<STS_N %p RC: %ld >", a1, v4);
  return Mutable;
}

void STS_N_Finalize(unint64_t a1)
{
  uint64_t v2 = CADeprecated::TSingleton<STS_N>::instance();
  os_unfair_lock_lock((os_unfair_lock_t)v2);
  for (i = *(uint64_t **)(v2 + 24); i; i = (uint64_t *)*i)
  {
    while (1)
    {
      std::__hash_table<OpaqueFigSTS *,std::hash<OpaqueFigSTS *>,std::equal_to<OpaqueFigSTS *>,std::allocator<OpaqueFigSTS *>>::__erase_unique<OpaqueFigSTS *>((uint64_t *)(i[5] + 24), a1);
      if (!STS_N::CanDeleteSpatializerInfo(v2, (unsigned __int8 *)i[5])) {
        break;
      }
      CFIndex v4 = (uint64_t *)*i;
      std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>>>::remove((uint64_t)v8, (void *)(v2 + 8), i);
      std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<STS_N::PerLabelInfo>>,void *>>>>::reset[abi:ne180100]((uint64_t)v8);
      i = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)v2);
  DerivedStorage = (void *)softLink_CMBaseObjectGetDerivedStorage(a1);
  uint64_t v6 = (std::__shared_weak_count *)DerivedStorage[1];
  void *DerivedStorage = 0;
  DerivedStorage[1] = 0;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    uint64_t v7 = (std::__shared_weak_count *)DerivedStorage[1];
    if (v7)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_23774A788(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZL26MediaExperienceLibraryCorePPc_block_invoke_72()
{
  uint64_t result = _sl_dlopen();
  MediaExperienceLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x270EE22E0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270EE22E8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t caulk::mach::semaphore::semaphore(caulk::mach::semaphore *this)
{
  return MEMORY[0x270F87B88](this);
}

void caulk::mach::semaphore::~semaphore(caulk::mach::semaphore *this)
{
}

uint64_t caulk::thread::attributes::apply_to_this_thread(caulk::thread::attributes *this)
{
  return MEMORY[0x270F87BB0](this);
}

uint64_t caulk::thread::start(caulk::thread *this, caulk::thread::attributes *a2, void *(*a3)(void *), void *a4)
{
  return MEMORY[0x270F87BC0](this, a2, a3, a4);
}

void caulk::thread::~thread(caulk::thread *this)
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

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void __cxa_free_exception(void *a1)
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

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x270EDB3A0](*(void *)&semaphore);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDC3B0](region, length);
}