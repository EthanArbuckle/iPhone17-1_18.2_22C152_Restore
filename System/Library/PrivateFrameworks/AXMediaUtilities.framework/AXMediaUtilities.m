uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

unsigned char *OUTLINED_FUNCTION_1_3(unsigned char *result, unsigned char *a2)
{
  *__n128 result = 0;
  *a2 = 0;
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
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

void *std::vector<BOOL>::vector(void *a1, unint64_t a2, unsigned __int8 *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<BOOL>::__vallocate[abi:ne180100](a1, a2);
    int v6 = *a3;
    unint64_t v7 = a1[1];
    unint64_t v8 = v7 + a2;
    a1[1] = v7 + a2;
    if (v7)
    {
      unint64_t v9 = v8 - 1;
      if (((v8 - 1) ^ (v7 - 1)) < 0x40)
      {
LABEL_10:
        uint64_t v13 = *a1 + 8 * (v7 >> 6);
        int v14 = v7 & 0x3F;
        if (v6) {
          std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&v13, a2);
        }
        else {
          std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)&v13, a2);
        }
        return a1;
      }
    }
    else
    {
      unint64_t v9 = v8 - 1;
    }
    unint64_t v10 = v9 >> 6;
    if (v8 >= 0x41) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0;
    }
    *(void *)(*a1 + 8 * v11) = 0;
    goto LABEL_10;
  }
  return a1;
}

void sub_1B57D9104(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t ReplayKitLibraryCore()
{
  if (!ReplayKitLibraryCore_frameworkLibrary) {
    ReplayKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return ReplayKitLibraryCore_frameworkLibrary;
}

uint64_t __ReplayKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ReplayKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRPScreenRecorderClass_block_invoke(uint64_t a1)
{
  if (!ReplayKitLibraryCore())
  {
    long long v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RPScreenRecorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRPScreenRecorderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = (void *)__getRPScreenRecorderClass_block_invoke_cold_1();
    return (Class)+[AXMAssetManager defaultManager];
  }
  return result;
}

id getVNDetectHorizonRequestClass()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getVNDetectHorizonRequestClass_softClass;
  uint64_t v7 = getVNDetectHorizonRequestClass_softClass;
  if (!getVNDetectHorizonRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectHorizonRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectHorizonRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57DA3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNDetectHorizonRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6116B18;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNDetectHorizonRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getVNDetectHorizonRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNDetectHorizonRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B57DBF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DC23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DC558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DCBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DCFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DD3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DD7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DDAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DE0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DE73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DEEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DF638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57DFBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57E01B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57E0848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getVNFaceAttributeAgeBabySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeAgeBaby");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeAgeBabySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t VisionLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6116B40;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!VisionLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __VisionLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getVNFaceAttributeAgeChildSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeAgeChild");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeAgeChildSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeAgeYoungAdultSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeAgeYoungAdult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeAgeYoungAdultSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeAgeAdultSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeAgeAdult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeAgeAdultSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeAgeSeniorSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeAgeSenior");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeAgeSeniorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN1yPD9G185LIMKFd9RgandG6vUu4B3DZkSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN1yPD9G185LIMKFd9RgandG6vUu4B3DZk");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN1yPD9G185LIMKFd9RgandG6vUu4B3DZkSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6cM1E1jfvMnUZoEeDjinPOtJKpacqIprSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6cM1E1jfvMnUZoEeDjinPOtJKpacqIpr");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6cM1E1jfvMnUZoEeDjinPOtJKpacqIprSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeEyesClosedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeEyesClosed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeEyesClosedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeEyesOpenSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeEyesOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeEyesOpenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeHairColorBlackSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeHairColorBlack");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeHairColorBlackSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeHairColorBlondeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeHairColorBlonde");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeHairColorBlondeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeHairColorBrownSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeHairColorBrown");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeHairColorBrownSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeHairColorGraySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeHairColorGray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeHairColorGraySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeHairColorRedSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeHairColorRed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeHairColorRedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeHairColorWhiteSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeHairColorWhite");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeHairColorWhiteSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeGlassesPrescriptionSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeGlassesPrescription");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeGlassesPrescriptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeGlassesSunglassesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeGlassesSunglasses");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeGlassesSunglassesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeGlassesNoneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeGlassesNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeGlassesNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeMakeupEyesUnsureSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeMakeupEyesUnsure");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeMakeupEyesUnsureSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeMakeupEyesNoneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeMakeupEyesNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeMakeupEyesNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeMakeupEyesSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeMakeupEyes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeMakeupEyesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeMakeupLipsUnsureSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeMakeupLipsUnsure");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeMakeupLipsUnsureSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeMakeupLipsNoneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeMakeupLipsNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeMakeupLipsNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeMakeupLipsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeMakeupLips");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeMakeupLipsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeFacemaskNoneSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeFacemaskNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeFacemaskNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNFaceAttributeFacemaskSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNFaceAttributeFacemask");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNFaceAttributeFacemaskSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2pSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2p");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7yMsLB9ggBYLDbJYIMGMSW6YBgi5uH2pSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIpSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIp");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2eECeAuLQ8wnXvvNNkc5XEtpjqyiYvIpSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2AhEqI0IOCJAaCX6zovlg85aFZ80JfESSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN2AhEqI0IOCJAaCX6zovlg85aFZ80JfES");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2AhEqI0IOCJAaCX6zovlg85aFZ80JfESSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2SymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6a4sQBuQ5pSiUEd6p9iQflpz8xkWOnD2SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6pbJdmseepvIGYzcDyryle1xGdZEWhHNSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6pbJdmseepvIGYzcDyryle1xGdZEWhHN");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6pbJdmseepvIGYzcDyryle1xGdZEWhHNSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN607hNga4JKRc1ljftiy9QfPCqbXQmLP4SymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN607hNga4JKRc1ljftiy9QfPCqbXQmLP4");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN607hNga4JKRc1ljftiy9QfPCqbXQmLP4SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQISSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQIS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2TVJG6FfNTt72vwVKOv1Jf5dWtEHvQISSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRXSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRX");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7ja3fTi9TZDyKN8NdYJaWqla1NRFdcRXSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4lC1NTVMt6oWugtej0fqgS3z5p60aMupSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN4lC1NTVMt6oWugtej0fqgS3z5p60aMup");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4lC1NTVMt6oWugtej0fqgS3z5p60aMupSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmISymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN1VQUXOcXrfZPXtaGgfZBhujM6uH6hvmISymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6i04vrZluouTItkCUMtS916cLgTyvODXSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6i04vrZluouTItkCUMtS916cLgTyvODX");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6i04vrZluouTItkCUMtS916cLgTyvODXSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjmSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjm");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN42tJSMaSWdsAnZKXv8XcZg2j2AIS7gjmSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cFSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cF");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7vELTVTtPH26ptfCYi9dUHH8NxJ7O3cFSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00SymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN5ijZTfHVHp6ubCHBh4oIZR1SW4xbvQ00SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmRSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmR");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN3WbFaDRN3PTBiMaMEq5ttCx7hmmfySmRSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4lCLwxDV30rFLSeoihd8yM1zdbka3cVuSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN4lCLwxDV30rFLSeoihd8yM1zdbka3cVu");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4lCLwxDV30rFLSeoihd8yM1zdbka3cVuSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epxSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epx");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4qKg9nfl3p0M4juXFIsbUb7tpfCv9epxSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN31UxDngUK44hDexm8CSuZnlLxECLb0yUSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN31UxDngUK44hDexm8CSuZnlLxECLb0yU");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN31UxDngUK44hDexm8CSuZnlLxECLb0yUSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTgSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTg");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN5JBEfctS0JUWeTVUxBAKOSXCUuMqPxTgSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7CY11MLEimaE8WoiQ4opgi5HOi84j0UHSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN7CY11MLEimaE8WoiQ4opgi5HOi84j0UH");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7CY11MLEimaE8WoiQ4opgi5HOi84j0UHSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN5SpoOVxahuTheCrHGepAYKTVB1baFLhQSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN5SpoOVxahuTheCrHGepAYKTVB1baFLhQ");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN5SpoOVxahuTheCrHGepAYKTVB1baFLhQSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5QdSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5Qd");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6YAJH4UBXYDBoH6cemKhJR7fPi2dt5QdSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN21VM8NbCJMJjpepNo1kZkxteFybpDwlBSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN21VM8NbCJMJjpepNo1kZkxteFybpDwlB");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN21VM8NbCJMJjpepNo1kZkxteFybpDwlBSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5SymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6lDi9hTBjr2vdjAJ5rwdun4YEH09u5F5SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2X5h7waRTqk71pInqK4dnT6sZ6dRElxeSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN2X5h7waRTqk71pInqK4dnT6sZ6dRElxe");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2X5h7waRTqk71pInqK4dnT6sZ6dRElxeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNPdH78Lr962vQvRIq2JApX2QJZtbR3fviSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNPdH78Lr962vQvRIq2JApX2QJZtbR3fvi");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNPdH78Lr962vQvRIq2JApX2QJZtbR3fviSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKiSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKi");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2nEhtfck4KB7KsvJeCeSEPcGLfKzeUKiSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJwSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJw");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN465E5iEqlR2tknJ0qZkyAn3yIDrmUpJwSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6pSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6p");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4oD9MSPBdmmSq6KG3k7nYqdSMT5aNp6pSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN34LMYSFC7onytwsvH0y6uz2QaYvqY9qiSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN34LMYSFC7onytwsvH0y6uz2QaYvqY9qi");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN34LMYSFC7onytwsvH0y6uz2QaYvqY9qiSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxYSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxY");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN5iEOkR2NrIkLsZRvJTn61k1ovk3hvuxYSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXRSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXR");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7ICFqxCpgr8BTWkFrFGYTQ3INUhxhYXRSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grkSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grk");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN3rKrpi4DELvo8AgM5Y3C68ryFlgB1grkSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1UtSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1Ut");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7ar6bR0PqRvM9BZ0nqEdwh61tXzue1UtSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7cSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7c");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN1I7oR8JHxER2i7d6nQxNtHhGXxkJuH7cSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGNSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGN");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNDGCsUiwnQwGz0qSSQPGGd177EyoSaoGNSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6LhAjooMZpZkrkhS48XbQt7602EpEAxvSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN6LhAjooMZpZkrkhS48XbQt7602EpEAxv");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6LhAjooMZpZkrkhS48XbQt7602EpEAxvSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYSSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN1HsiXmKrxTsH8TYOuN5s7G3uHSP75iYSSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgttSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgtt");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN1kD4zwSpSn6esc2wHjyAeZ2IRmwqjgttSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9pSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9p");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN1PwKd46IDZj2ErCN9d1fTn3FuN3h4d9pSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1PvSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)VisionLibrary();
  uint64_t result = dlsym(v2, "VN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1Pv");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4bzonkXHYlzBnJNXcyyPd8WLw1wAI1PvSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNDetectFaceExpressionsRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectFaceExpressionsRequestClass_softClass;
  uint64_t v7 = getVNDetectFaceExpressionsRequestClass_softClass;
  if (!getVNDetectFaceExpressionsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceExpressionsRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectFaceExpressionsRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E3710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNCreateFaceprintRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNCreateFaceprintRequestClass_softClass;
  uint64_t v7 = getVNCreateFaceprintRequestClass_softClass;
  if (!getVNCreateFaceprintRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNCreateFaceprintRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNCreateFaceprintRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E3E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNClassifyFaceAttributesRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNClassifyFaceAttributesRequestClass_softClass;
  uint64_t v7 = getVNClassifyFaceAttributesRequestClass_softClass;
  if (!getVNClassifyFaceAttributesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNClassifyFaceAttributesRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNClassifyFaceAttributesRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E3F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectFaceLandmarksRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectFaceLandmarksRequestClass_softClass;
  uint64_t v7 = getVNDetectFaceLandmarksRequestClass_softClass;
  if (!getVNDetectFaceLandmarksRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceLandmarksRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectFaceLandmarksRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E3FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectFacePoseRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectFacePoseRequestClass_softClass;
  uint64_t v7 = getVNDetectFacePoseRequestClass_softClass;
  if (!getVNDetectFacePoseRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFacePoseRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectFacePoseRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E40D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectFaceRectanglesRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectFaceRectanglesRequestClass_softClass;
  uint64_t v7 = getVNDetectFaceRectanglesRequestClass_softClass;
  if (!getVNDetectFaceRectanglesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectFaceRectanglesRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectFaceRectanglesRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E41B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNDetectFaceExpressionsRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNDetectFaceExpressionsRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceExpressionsRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNDetectFaceExpressionsRequestClass_block_invoke_cold_1();
    VisionLibrary_0();
  }
}

void VisionLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __VisionLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6116DD0;
    uint64_t v3 = 0;
    VisionLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!VisionLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class __getVNCreateFaceprintRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_0();
  Class result = objc_getClass("VNCreateFaceprintRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNCreateFaceprintRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNCreateFaceprintRequestClass_block_invoke_cold_1();
    return (Class)__getVNClassifyFaceAttributesRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNClassifyFaceAttributesRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_0();
  Class result = objc_getClass("VNClassifyFaceAttributesRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNClassifyFaceAttributesRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1();
    return (Class)__getVNDetectFaceLandmarksRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNDetectFaceLandmarksRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_0();
  Class result = objc_getClass("VNDetectFaceLandmarksRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceLandmarksRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1();
    return (Class)__getVNDetectFacePoseRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNDetectFacePoseRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_0();
  Class result = objc_getClass("VNDetectFacePoseRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFacePoseRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNDetectFacePoseRequestClass_block_invoke_cold_1();
    return (Class)__getVNDetectFaceRectanglesRequestClass_block_invoke(v3);
  }
  return result;
}

Class __getVNDetectFaceRectanglesRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_0();
  Class result = objc_getClass("VNDetectFaceRectanglesRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectFaceRectanglesRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1();
    return (Class)+[AXMImageAestheticsNode supportsSecureCoding];
  }
  return result;
}

id getVNClassifyImageAestheticsRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNClassifyImageAestheticsRequestClass_softClass;
  uint64_t v7 = getVNClassifyImageAestheticsRequestClass_softClass;
  if (!getVNClassifyImageAestheticsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNClassifyImageAestheticsRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNClassifyImageAestheticsRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57E53E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNClassifyImageAestheticsRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_2)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_2;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6116DE8;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNClassifyImageAestheticsRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVNClassifyImageAestheticsRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNClassifyImageAestheticsRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1B57E587C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57E5998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57E5A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57E5D94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p)
{
  _Unwind_Resume(a1);
}

void sub_1B57E609C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1B57E6498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B57E6844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1B57E6C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *__p)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1B57E7514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *__p)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1B57E7848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57E7900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57E7C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B57E7D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<BOOL>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void std::vector<BOOL>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E61166C0, MEMORY[0x1E4FBA1C8]);
}

void sub_1B57E7F58(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void *std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  int v4 = *((_DWORD *)result + 2);
  long long v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    *uint64_t result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    uint64_t result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    unint64_t v8 = &v5[v7];
    *uint64_t v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  long long v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    unint64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void sub_1B57E8518(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1B57E8774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B57E8A3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57E8BA8(_Unwind_Exception *a1)
{
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

id getMLModelClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMLModelClass_softClass;
  uint64_t v7 = getMLModelClass_softClass;
  if (!getMLModelClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMLModelClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getMLModelClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EA1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNCoreMLModelClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNCoreMLModelClass_softClass;
  uint64_t v7 = getVNCoreMLModelClass_softClass;
  if (!getVNCoreMLModelClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNCoreMLModelClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNCoreMLModelClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EA2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNClassificationObservationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNClassificationObservationClass_softClass;
  uint64_t v7 = getVNClassificationObservationClass_softClass;
  if (!getVNClassificationObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNClassificationObservationClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNClassificationObservationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EA6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNCoreMLRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNCoreMLRequestClass_softClass;
  uint64_t v7 = getVNCoreMLRequestClass_softClass;
  if (!getVNCoreMLRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNCoreMLRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNCoreMLRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EA7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMLModelClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreMLLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreMLLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6116F48;
    uint64_t v6 = 0;
    CoreMLLibraryCore_frameworkLibrary = _sl_dlopen();
    unint64_t v2 = (void *)v4[0];
    if (!CoreMLLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MLModel");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    unint64_t v2 = (void *)__getMLModelClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMLModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreMLLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMLLibraryCore_frameworkLibrary = result;
  return result;
}

void __getVNCoreMLModelClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNCoreMLModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNCoreMLModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNCoreMLModelClass_block_invoke_cold_1();
    VisionLibrary_1();
  }
}

void VisionLibrary_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_3)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __VisionLibraryCore_block_invoke_3;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6116F60;
    uint64_t v3 = 0;
    VisionLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!VisionLibraryCore_frameworkLibrary_3)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_3 = result;
  return result;
}

Class __getVNClassificationObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary_1();
  Class result = objc_getClass("VNClassificationObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNClassificationObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNClassificationObservationClass_block_invoke_cold_1();
    return (Class)__getVNCoreMLRequestClass_block_invoke(v3);
  }
  return result;
}

void __getVNCoreMLRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_1();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNCoreMLRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNCoreMLRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (AXMScreenCaptureNode *)__getVNCoreMLRequestClass_block_invoke_cold_1();
    [(AXMScreenCaptureNode *)v2 nodeInitialize];
  }
}

void sub_1B57EADA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getVNImageScoreObservationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageScoreObservationClass_softClass;
  uint64_t v7 = getVNImageScoreObservationClass_softClass;
  if (!getVNImageScoreObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNImageScoreObservationClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNImageScoreObservationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EB584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNImageBrightnessObservationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageBrightnessObservationClass_softClass;
  uint64_t v7 = getVNImageBrightnessObservationClass_softClass;
  if (!getVNImageBrightnessObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNImageBrightnessObservationClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNImageBrightnessObservationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EB668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNImageBlurObservationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageBlurObservationClass_softClass;
  uint64_t v7 = getVNImageBlurObservationClass_softClass;
  if (!getVNImageBlurObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNImageBlurObservationClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNImageBlurObservationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57EB74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57EBA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNImageScoreObservationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNImageScoreObservation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageScoreObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNImageScoreObservationClass_block_invoke_cold_1();
    VisionLibrary_2();
  }
}

void VisionLibrary_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_4)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __VisionLibraryCore_block_invoke_4;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6116FB0;
    uint64_t v3 = 0;
    VisionLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!VisionLibraryCore_frameworkLibrary_4)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_4 = result;
  return result;
}

Class __getVNImageBrightnessObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary_2();
  Class result = objc_getClass("VNImageBrightnessObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageBrightnessObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNImageBrightnessObservationClass_block_invoke_cold_1();
    return (Class)__getVNImageBlurObservationClass_block_invoke(v3);
  }
  return result;
}

Class __getVNImageBlurObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary_2();
  Class result = objc_getClass("VNImageBlurObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageBlurObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNImageBlurObservationClass_block_invoke_cold_1();
    return (Class)__getVNImageBlurScoreRequestClass_block_invoke(v3);
  }
  return result;
}

AXMMobileAssetEvaluationNode *__getVNImageBlurScoreRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_2();
  Class result = (AXMMobileAssetEvaluationNode *)objc_getClass("VNImageBlurScoreRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageBlurScoreRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AXMMobileAssetEvaluationNode *)__getVNImageBlurScoreRequestClass_block_invoke_cold_1();
    return [(AXMMobileAssetEvaluationNode *)v3 initWithIdentifier:v5];
  }
  return result;
}

void sub_1B57EC1CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B57EC354(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B57ECBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1B57ED124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

uint64_t CoreAnalyticsLibraryCore()
{
  if (!CoreAnalyticsLibraryCore_frameworkLibrary) {
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreAnalyticsLibraryCore_frameworkLibrary;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)CoreAnalyticsLibraryCore();
  if (!v2)
  {
    SEL v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __kernel_morphmin_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1E058] kernelWithString:@"kernel vec4 _morphmin (sampler i, float n, vec2 d) \n { \n vec2 dc = destCoord() \n vec4 s = sample(i, samplerTransform(i, dc)); \n for (float x = -n; x <= n; x++) \n s = min(s, sample(i, samplerTransform(i, dc + d*x))); \n return s; \n } \n"];;
  id v1 = (void *)kernel_morphmin_singleton;
  kernel_morphmin_singleton = v0;

  long long v2 = (void *)kernel_morphmin_singleton;

  return [v2 setCanReduceOutputChannels:1];
}

uint64_t __kernel_morphmax_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1E058] kernelWithString:@"kernel vec4 _morphmax (sampler i, float n, vec2 d) \n { \n vec2 dc = destCoord() \n vec4 s = sample(i, samplerTransform(i, dc)); \n for (float x = -n; x <= n; x++) \n s = max(s, sample(i, samplerTransform(i, dc + d*x))); \n return s; \n } \n"];;
  id v1 = (void *)kernel_morphmax_singleton;
  kernel_morphmax_singleton = v0;

  long long v2 = (void *)kernel_morphmax_singleton;

  return [v2 setCanReduceOutputChannels:1];
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

void sub_1B57F5464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t VisionLibrary_3()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_5)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_5;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6117458;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_5;
  id v1 = (void *)v3[0];
  if (!VisionLibraryCore_frameworkLibrary_5)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __VisionLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_5 = result;
  return result;
}

void *__getVNCleanupPurgeAllSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_3();
  uint64_t result = dlsym(v2, "VNCleanupPurgeAll");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNCleanupPurgeAllSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVNImageRequestHandlerClass_block_invoke(uint64_t a1)
{
  VisionLibrary_3();
  Class result = objc_getClass("VNImageRequestHandler");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageRequestHandlerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AXMVisionFeatureComparator *)__getVNImageRequestHandlerClass_block_invoke_cold_1();
    return (Class)[(AXMVisionFeatureComparator *)v3 compareInitialResult:v5 withFinalResult:v6 indexOfUnequalItem:v7 sortInitialResult:v8 sortFinalResult:v9];
  }
  return result;
}

void sub_1B57F68A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F6D90(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_1B57F7540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1B57F7CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1B57F8368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

Class ___ZL15getMLModelClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreMLLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL17CoreMLLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6117498;
    uint64_t v6 = 0;
    CoreMLLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!CoreMLLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MLModel");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getMLModelClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMLModelClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL17CoreMLLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMLLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL39getUIGraphicsBeginImageContextSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIGraphicsBeginImageContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsBeginImageContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t UIKitLibrary(void)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UIKitLibraryCore(char **)::frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = ___ZL16UIKitLibraryCorePPc_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E61174B0;
    uint64_t v5 = 0;
    UIKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = UIKitLibraryCore(char **)::frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!UIKitLibraryCore(char **)::frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t ___ZL16UIKitLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

void *___ZL39getUIGraphicsGetCurrentContextSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIGraphicsGetCurrentContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsGetCurrentContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class ___ZL15getUIImageClassv_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = ___ZL15getUIImageClassv_block_invoke_cold_1();
    return (Class)___ZL53getUIGraphicsGetImageFromCurrentImageContextSymbolLocv_block_invoke(v3);
  }
  return result;
}

void *___ZL53getUIGraphicsGetImageFromCurrentImageContextSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsGetImageFromCurrentImageContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsGetImageFromCurrentImageContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *___ZL37getUIGraphicsEndImageContextSymbolLocv_block_invoke(uint64_t a1)
{
  long long v2 = (void *)UIKitLibrary();
  Class result = dlsym(v2, "UIGraphicsEndImageContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsEndImageContextSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void std::vector<NSString * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  id v1 = *a1;
  long long v2 = (char *)**a1;
  if (v2)
  {
    long long v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<NSString * {__strong}>::__vdeallocate(void **a1)
{
  id v1 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    long long v4 = *a1;
    if (v3 != v1)
    {
      do
      {
        uint64_t v5 = (void *)*((void *)v3 - 1);
        v3 -= 8;
      }
      while (v3 != v1);
      long long v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

uint64_t std::__split_buffer<NSString * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

__CFDictionary *ImageTools_fcssCreateIOSurfacePropertiesDictionary(int a1, int a2, int a3)
{
  int hasVXD = ImageTools_hasVXD();
  int v7 = ImageTools_hasVXD();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  BOOL v9 = Mutable;
  if (hasVXD)
  {
    if (v7) {
      ImageTools_setIntValue(Mutable, (const void *)*MEMORY[0x1E4F2EFE8], 1280);
    }
  }
  else
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F2F120], @"PurpleGfxMem");
  }
  unsigned int v10 = (a1 + 15) & 0xFFFFFFF0;
  if (a3 == 1111970369) {
    char v11 = 2;
  }
  else {
    char v11 = 1;
  }
  int v12 = (v10 << v11) * ((a2 + 15) & 0xFFFFFFF0);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E4F2EFE0], v10 << v11);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E4F2F2C0], a1);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E4F2F0E8], a2);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E4F2F150], a3);
  ImageTools_setIntValue(v9, (const void *)*MEMORY[0x1E4F2EFB8], v12);
  return v9;
}

uint64_t ImageTools_hasVXD()
{
  if (ImageTools_hasVXD_checked == 1) {
    return ImageTools_hasVXD_hasSupport;
  }
  mach_port_t v1 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v2 = IOServiceMatching("AppleVXD375");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  CFDictionaryRef v4 = IOServiceMatching("AppleVXD390");
  uint64_t result = (MatchingService | IOServiceGetMatchingService(v1, v4)) != 0;
  ImageTools_hasVXD_hasSupport = result;
  ImageTools_hasVXD_checked = 1;
  return result;
}

void ImageTools_setIntValue(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void sub_1B57F973C(_Unwind_Exception *a1)
{
  CFNumberRef v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B57F99D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B57F9D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getVNImageRequestHandlerClass()
{
  uint64_t v4 = 0;
  CFNumberRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageRequestHandlerClass_softClass_0;
  uint64_t v7 = getVNImageRequestHandlerClass_softClass_0;
  if (!getVNImageRequestHandlerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNImageRequestHandlerClass_block_invoke_0;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNImageRequestHandlerClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57FA960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

Class __getVNImageRequestHandlerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_6)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_6;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E61174E8;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_6 = _sl_dlopen();
    CFDictionaryRef v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_6)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNImageRequestHandler");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    CFDictionaryRef v2 = (void *)__getVNImageRequestHandlerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNImageRequestHandlerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_6()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_6 = result;
  return result;
}

id getVNRecognizeTextRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNRecognizeTextRequestClass_softClass;
  uint64_t v7 = getVNRecognizeTextRequestClass_softClass;
  if (!getVNRecognizeTextRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizeTextRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNRecognizeTextRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57FBD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRecognizeTextRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_7)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_7;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6117540;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_7 = _sl_dlopen();
    CFDictionaryRef v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_7)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNRecognizeTextRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    CFDictionaryRef v2 = (void *)__getVNRecognizeTextRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNRecognizeTextRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_7()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_7 = result;
  return result;
}

void sub_1B57FD968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
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

void sub_1B57FE09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
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

void sub_1B57FF700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHPhotoLibraryClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHPhotoLibraryClass_softClass;
  uint64_t v7 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57FF7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B57FFA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHImageManagerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHImageManagerClass_softClass;
  uint64_t v7 = getPHImageManagerClass_softClass;
  if (!getPHImageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHImageManagerClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getPHImageManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B57FFB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPhotoLibraryClass_block_invoke_cold_1();
    PhotosLibrary();
  }
}

void PhotosLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PhotosLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E61175D0;
    uint64_t v3 = 0;
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PhotosLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getPHAssetClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHAssetClass_block_invoke_cold_1();
    return (Class)__getPHImageManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getPHImageManagerClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHImageManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHImageManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHImageManagerClass_block_invoke_cold_1();
    return (Class)__getPHImageRequestOptionsClass_block_invoke(v3);
  }
  return result;
}

Class __getPHImageRequestOptionsClass_block_invoke(uint64_t a1)
{
  PhotosLibrary();
  Class result = objc_getClass("PHImageRequestOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHImageRequestOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getPHImageRequestOptionsClass_block_invoke_cold_1();
    return (Class)+[AXMADSREnvelope defaultEnvelope];
  }
  return result;
}

id getVNDetectRectanglesRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectRectanglesRequestClass_softClass;
  uint64_t v7 = getVNDetectRectanglesRequestClass_softClass;
  if (!getVNDetectRectanglesRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectRectanglesRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectRectanglesRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B58007F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5800BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

Class __getVNDetectRectanglesRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_4();
  Class result = objc_getClass("VNDetectRectanglesRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectRectanglesRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNDetectRectanglesRequestClass_block_invoke_cold_1();
    return (Class)VisionLibrary_4();
  }
  return result;
}

uint64_t VisionLibrary_4()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_8)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_8;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6117600;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  }
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_8;
  id v1 = (void *)v3[0];
  if (!VisionLibraryCore_frameworkLibrary_8)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __VisionLibraryCore_block_invoke_8()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_8 = result;
  return result;
}

void *__getVNImageOptionCameraIntrinsicsSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_4();
  uint64_t result = dlsym(v2, "VNImageOptionCameraIntrinsics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNImageOptionCameraIntrinsicsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _AXMRGBToHSB(long double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4) {
      double v8 = a4;
    }
    else {
      double v8 = a5;
    }
    if (a4 >= a6) {
      double v9 = a6;
    }
    else {
      double v9 = a4;
    }
    BOOL v10 = a5 < a4 || a5 < a6;
    if (v10) {
      double v11 = a6;
    }
    else {
      double v11 = a5;
    }
    if (v10) {
      double v9 = v8;
    }
  }
  else
  {
    if (a5 >= a6) {
      double v9 = a6;
    }
    else {
      double v9 = a5;
    }
    double v11 = a4;
  }
  double v12 = 0.0;
  if (v11 <= 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    double v13 = v11 - v9;
    double v14 = (v11 - v9) / v11;
    if (v14 != 0.0)
    {
      double v15 = (v11 - a5) / v13;
      double v16 = (v11 - a6) / v13;
      if (v11 == a4)
      {
        if (v9 == a5) {
          double v12 = v16 + 5.0;
        }
        else {
          double v12 = 1.0 - v15;
        }
      }
      else
      {
        BOOL v17 = v11 == a5;
        double v18 = (v11 - a4) / v13;
        if (v17)
        {
          if (v9 == a6) {
            double v12 = v18 + 1.0;
          }
          else {
            double v12 = 3.0 - v16;
          }
        }
        else if (v9 == a4)
        {
          double v12 = v15 + 3.0;
        }
        else
        {
          double v12 = 5.0 - v18;
        }
      }
    }
  }
  *a3 = v11;
  *a1 = fmod(v12 / 6.0, 1.0);
  *a2 = v14;
}

void _AXMHSBToRGB(double *a1, double *a2, double *a3, long double a4, double a5, double a6)
{
  long double v11 = fmod(a4, 1.0) * 6.0;
  int v12 = (int)v11;
  long double v13 = v11 - (double)(int)v11;
  double v14 = (1.0 - a5) * a6;
  double v15 = (1.0 - a5 * v13) * a6;
  double v16 = (1.0 - a5 * (1.0 - v13)) * a6;
  double v17 = a6;
  double v18 = v16;
  switch(v12)
  {
    case 0:
      goto LABEL_8;
    case 1:
      double v17 = v15;
      double v18 = a6;
      goto LABEL_8;
    case 2:
      double v17 = (1.0 - a5) * a6;
      double v18 = a6;
      double v14 = v16;
      goto LABEL_8;
    case 3:
      double v17 = (1.0 - a5) * a6;
      double v18 = v15;
      goto LABEL_6;
    case 4:
      double v17 = v16;
      double v18 = (1.0 - a5) * a6;
LABEL_6:
      double v14 = a6;
      goto LABEL_8;
    case 5:
      double v17 = a6;
      double v18 = (1.0 - a5) * a6;
      double v14 = v15;
LABEL_8:
      *a1 = v17;
      *a2 = v18;
      *a3 = v14;
      break;
    default:
      return;
  }
}

void sub_1B5803158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58032F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58033D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58034AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58037AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58038B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5804AE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Unwind_Resume(a1);
}

void sub_1B5804B50()
{
}

void sub_1B5805730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58058EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5805984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5805A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::shared_ptr<CGImage>::shared_ptr[abi:ne180100]<CGImage,void (*)(CGImage*),void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B5805AE0(void *a1)
{
  __cxa_begin_catch(a1);
  v1(v2);
  __cxa_rethrow();
}

void sub_1B5805AF4(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<CGImage *,void (*)(CGImage *),std::allocator<CGImage>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1BA9A0B70);
}

uint64_t std::__shared_ptr_pointer<CGImage *,void (*)(CGImage *),std::allocator<CGImage>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<CGImage *,void (*)(CGImage *),std::allocator<CGImage>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 32;
  else {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void sub_1B5805CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5805E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5805F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5806054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5806100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5806184(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58067E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v17 - 96), 8);
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

id get_LTTranslatorClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_LTTranslatorClass_softClass;
  uint64_t v7 = get_LTTranslatorClass_softClass;
  if (!get_LTTranslatorClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __get_LTTranslatorClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __get_LTTranslatorClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B580694C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58077D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58082F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B580872C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void TranslationLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!TranslationLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __TranslationLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E61178D8;
    uint64_t v3 = 0;
    TranslationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!TranslationLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __TranslationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TranslationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1B580C140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1B580DBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
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

void __72__iconclassification_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v3 = [[iconclassification alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1B580FD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5810050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B581012C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getPFSceneTaxonomyClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPFSceneTaxonomyClass_softClass;
  uint64_t v7 = getPFSceneTaxonomyClass_softClass;
  if (!getPFSceneTaxonomyClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPFSceneTaxonomyClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getPFSceneTaxonomyClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B581093C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5811008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5811664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5811B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPFSceneTaxonomyClass_block_invoke(uint64_t a1)
{
  if (!PhotosFormatsLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("PFSceneTaxonomy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPFSceneTaxonomyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPFSceneTaxonomyClass_block_invoke_cold_1();
    return (Class)PhotosFormatsLibraryCore();
  }
  return result;
}

uint64_t PhotosFormatsLibraryCore()
{
  if (!PhotosFormatsLibraryCore_frameworkLibrary) {
    PhotosFormatsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PhotosFormatsLibraryCore_frameworkLibrary;
}

uint64_t __PhotosFormatsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosFormatsLibraryCore_frameworkLibrary = result;
  return result;
}

id getVNVYvzEtX1JlUdu8xx5qhDIClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass;
  uint64_t v7 = getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass;
  if (!getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B58120F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke(uint64_t a1)
{
  VisionLibrary_5();
  Class result = objc_getClass("VNVYvzEtX1JlUdu8xx5qhDI");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNVYvzEtX1JlUdu8xx5qhDIClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke_cold_1();
    return (Class)VisionLibrary_5();
  }
  return result;
}

uint64_t VisionLibrary_5()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_9)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_9;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6117C60;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_9 = _sl_dlopen();
  }
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_9;
  id v1 = (void *)v3[0];
  if (!VisionLibraryCore_frameworkLibrary_9)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __VisionLibraryCore_block_invoke_9()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_9 = result;
  return result;
}

void *__getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_5();
  uint64_t result = dlsym(v2, "VN81aedeb999c79d74e79af7f1c922cf97");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

double AXMTransformedNormalizedFrame(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = a1 - 2;
  if ((unint64_t)(a1 - 2) > 2)
  {
    double v9 = 1.0;
    double v7 = 0.0;
    double v8 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    if (!a2) {
      goto LABEL_3;
    }
  }
  else
  {
    double v7 = dbl_1B58ACC30[v6];
    double v8 = dbl_1B58ACC48[v6];
    double v9 = dbl_1B58ACC60[v6];
    double v10 = dbl_1B58ACC78[v6];
    double v11 = dbl_1B58ACC90[v6];
    if (!a2)
    {
LABEL_3:
      double v12 = v9;
      goto LABEL_14;
    }
  }
  if ((unint64_t)(a1 - 3) <= 1) {
    double v12 = v9;
  }
  else {
    double v12 = -v9;
  }
  if ((unint64_t)(a1 - 3) > 1) {
    double v7 = -v7;
  }
  else {
    double v9 = -v9;
  }
  if ((unint64_t)(a1 - 3) > 1)
  {
    double v11 = 1.0 - v11;
  }
  else
  {
    double v8 = -v8;
    double v10 = 1.0 - v10;
  }
LABEL_14:
  v14.a = v9;
  v14.b = v7;
  v14.c = v8;
  v14.d = v12;
  v14.tx = v10;
  v14.ty = v11;
  *(void *)&double result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)&a3, &v14);
  return result;
}

uint64_t AXMNormalizedFrameTransform@<X0>(uint64_t result@<X0>, int a2@<W1>, double *a3@<X8>)
{
  uint64_t v3 = result - 2;
  if ((unint64_t)(result - 2) > 2)
  {
    double v6 = 1.0;
    double v4 = 0.0;
    double v5 = 0.0;
    double v7 = 0.0;
    double v8 = 0.0;
    if (!a2) {
      goto LABEL_3;
    }
  }
  else
  {
    double v4 = dbl_1B58ACC30[v3];
    double v5 = dbl_1B58ACC48[v3];
    double v6 = dbl_1B58ACC60[v3];
    double v7 = dbl_1B58ACC78[v3];
    double v8 = dbl_1B58ACC90[v3];
    if (!a2)
    {
LABEL_3:
      double v9 = v6;
      goto LABEL_14;
    }
  }
  if ((unint64_t)(result - 3) <= 1) {
    double v9 = v6;
  }
  else {
    double v9 = -v6;
  }
  if ((unint64_t)(result - 3) > 1) {
    double v4 = -v4;
  }
  else {
    double v6 = -v6;
  }
  if ((unint64_t)(result - 3) > 1)
  {
    double v8 = 1.0 - v8;
  }
  else
  {
    double v5 = -v5;
    double v7 = 1.0 - v7;
  }
LABEL_14:
  *a3 = v6;
  a3[1] = v4;
  a3[2] = v5;
  a3[3] = v9;
  a3[4] = v7;
  a3[5] = v8;
  return result;
}

uint64_t AXMEXIFOrientationFromInterfaceOrientation(uint64_t a1, int a2)
{
  switch(a1)
  {
    case 0:
    case 1:
      BOOL v2 = a2 == 0;
      unsigned int v3 = 5;
      goto LABEL_9;
    case 2:
      BOOL v2 = a2 == 0;
      unsigned int v3 = 7;
      goto LABEL_9;
    case 3:
      if (a2) {
        return 4;
      }
      else {
        return 1;
      }
    case 4:
      BOOL v2 = a2 == 0;
      unsigned int v3 = 2;
LABEL_9:
      if (v2) {
        uint64_t result = v3 + 1;
      }
      else {
        uint64_t result = v3;
      }
      break;
    default:
      uint64_t result = 1;
      break;
  }
  return result;
}

void sub_1B5812E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSequenceRequestHandlerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_10)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_10;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6117C78;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_10 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_10)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNSequenceRequestHandler");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNSequenceRequestHandlerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNSequenceRequestHandlerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_10()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_10 = result;
  return result;
}

id getVNRecognizeObjectsRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNRecognizeObjectsRequestClass_softClass;
  uint64_t v7 = getVNRecognizeObjectsRequestClass_softClass;
  if (!getVNRecognizeObjectsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizeObjectsRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNRecognizeObjectsRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B581329C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRecognizeObjectsRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_11)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_11;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6117C90;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_11 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_11)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNRecognizeObjectsRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNRecognizeObjectsRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNRecognizeObjectsRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_11()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_11 = result;
  return result;
}

void sub_1B5813A68(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5813B68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5813BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5813C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5813DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58142F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1B58147E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5814C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B5814DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B581506C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5815310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5815690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5815788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5816DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42)
{
  _Unwind_Resume(a1);
}

void sub_1B5817370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Class ___ZL30getVNRecognizeTextRequestClassv_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore(char **)::frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = ___ZL17VisionLibraryCorePPc_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6117D30;
    uint64_t v6 = 0;
    VisionLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore(char **)::frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNRecognizeTextRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNRecognizeTextRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNRecognizeTextRequestClass(void)::softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ___ZL17VisionLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore(char **)::frameworkLibrary = result;
  return result;
}

id getVNImageRequestHandlerClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageRequestHandlerClass_softClass_1;
  uint64_t v7 = getVNImageRequestHandlerClass_softClass_1;
  if (!getVNImageRequestHandlerClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNImageRequestHandlerClass_block_invoke_1;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNImageRequestHandlerClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B581D5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNDetectContoursRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNDetectContoursRequestClass_softClass;
  uint64_t v7 = getVNDetectContoursRequestClass_softClass;
  if (!getVNDetectContoursRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNDetectContoursRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNDetectContoursRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B581D6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNRecognizeTextRequestClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNRecognizeTextRequestClass_softClass_0;
  uint64_t v7 = getVNRecognizeTextRequestClass_softClass_0;
  if (!getVNRecognizeTextRequestClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizeTextRequestClass_block_invoke_0;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNRecognizeTextRequestClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B581E56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNImageRequestHandlerClass_block_invoke_1(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNImageRequestHandler");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageRequestHandlerClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNImageRequestHandlerClass_block_invoke_cold_1();
    VisionLibrary_6();
  }
}

void VisionLibrary_6()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_12)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __VisionLibraryCore_block_invoke_12;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6117E30;
    uint64_t v3 = 0;
    VisionLibraryCore_frameworkLibrary_12 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!VisionLibraryCore_frameworkLibrary_12)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionLibraryCore_block_invoke_12()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_12 = result;
  return result;
}

Class __getVNDetectContoursRequestClass_block_invoke(uint64_t a1)
{
  VisionLibrary_6();
  Class result = objc_getClass("VNDetectContoursRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNDetectContoursRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNDetectContoursRequestClass_block_invoke_cold_1();
    return (Class)__getVNRecognizeTextRequestClass_block_invoke_0(v3);
  }
  return result;
}

void __getVNRecognizeTextRequestClass_block_invoke_0(uint64_t a1)
{
  VisionLibrary_6();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNRecognizeTextRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNRecognizeTextRequestClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (AXMImageRegistrationNode *)__getVNRecognizeTextRequestClass_block_invoke_cold_1();
    [(AXMImageRegistrationNode *)v2 nodeInitialize];
  }
}

id getVNTranslationalImageRegistrationRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNTranslationalImageRegistrationRequestClass_softClass;
  uint64_t v7 = getVNTranslationalImageRegistrationRequestClass_softClass;
  if (!getVNTranslationalImageRegistrationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNTranslationalImageRegistrationRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNTranslationalImageRegistrationRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B5823E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVNImageTranslationAlignmentObservationClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNImageTranslationAlignmentObservationClass_softClass;
  uint64_t v7 = getVNImageTranslationAlignmentObservationClass_softClass;
  if (!getVNImageTranslationAlignmentObservationClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNImageTranslationAlignmentObservationClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNImageTranslationAlignmentObservationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B5823F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNTranslationalImageRegistrationRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNTranslationalImageRegistrationRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNTranslationalImageRegistrationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  }
  else
  {
    __getVNTranslationalImageRegistrationRequestClass_block_invoke_cold_1();
    VisionLibrary_7();
  }
}

void VisionLibrary_7()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_13)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __VisionLibraryCore_block_invoke_13;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6117E48;
    uint64_t v3 = 0;
    VisionLibraryCore_frameworkLibrary_13 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!VisionLibraryCore_frameworkLibrary_13)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionLibraryCore_block_invoke_13()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_13 = result;
  return result;
}

Class __getVNImageTranslationAlignmentObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary_7();
  Class result = objc_getClass("VNImageTranslationAlignmentObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNImageTranslationAlignmentObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getVNImageTranslationAlignmentObservationClass_block_invoke_cold_1();
    return (Class)+[AXMCameraMetadataNode supportsSecureCoding];
  }
  return result;
}

void sub_1B58251A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58252D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825620(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1B5825710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  double v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1B58258D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825C28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5825E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5825EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5825FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5826048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58260A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58260F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B582615C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58261A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5826208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5826254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58262B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5826314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58263AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5826FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_1B5828930(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1B5828C24(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B5828D00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5828D50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5828DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5828E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5828E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5828EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5828F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5828FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5829018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B582908C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58290E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B582915C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5829314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5829388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58293FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58295CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5829AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B5829CBC(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

BOOL AXMIsContainedBy(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  CGRect v23 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  double width = v23.size.width;
  double height = v23.size.height;
  BOOL IsNull = CGRectIsNull(v23);
  BOOL result = 0;
  if (!IsNull && width > 0.0 && height > 0.0) {
    return width * height / (a7 * a8) >= a9;
  }
  return result;
}

void AXMIntersectionOverUnion(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.double width = a3;
  v16.size.double height = a4;
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.double width = a7;
  v17.size.double height = a8;
  CGRectUnion(v16, v17);
}

double AXMDistanceBetweenCenters(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX = CGRectGetMinX(*(CGRect *)&a1);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.double width = a3;
  v25.size.double height = a4;
  double v22 = (MinX + CGRectGetMaxX(v25)) * 0.5;
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.double width = a7;
  v26.size.double height = a8;
  double v21 = CGRectGetMinX(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.double width = a7;
  v27.size.double height = a8;
  double v23 = v22 - (v21 + CGRectGetMaxX(v27)) * 0.5;
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.double width = a3;
  v28.size.double height = a4;
  double MinY = CGRectGetMinY(v28);
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.double width = a3;
  v29.size.double height = a4;
  double v17 = (MinY + CGRectGetMaxY(v29)) * 0.5;
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.double width = a7;
  v30.size.double height = a8;
  double v18 = CGRectGetMinY(v30);
  v31.origin.x = a5;
  v31.origin.y = a6;
  v31.size.double width = a7;
  v31.size.double height = a8;
  CGFloat MaxY = CGRectGetMaxY(v31);
  return sqrt(v23 * v23 + (v17 - (v18 + MaxY) * 0.5) * (v17 - (v18 + MaxY) * 0.5));
}

void AXMRatioOfIntersectedAreaToSmallerRectArea(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
}

void sub_1B583515C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5835318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58353B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583544C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5835DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58378B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58387F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getVNCreateSceneprintRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNCreateSceneprintRequestClass_softClass;
  uint64_t v7 = getVNCreateSceneprintRequestClass_softClass;
  if (!getVNCreateSceneprintRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNCreateSceneprintRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNCreateSceneprintRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B58389F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNCreateSceneprintRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_14)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_14;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E61182A8;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_14 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_14)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNCreateSceneprintRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVNCreateSceneprintRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNCreateSceneprintRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_14()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_14 = result;
  return result;
}

void sub_1B58393B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58399A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void __getMADVIDocumentRecognitionResultClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADVIDocumentRecognitionResult");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADVIDocumentRecognitionResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADVIDocumentRecognitionResultClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary();
  }
}

void MediaAnalysisServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MediaAnalysisServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6118310;
    uint64_t v3 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary = result;
  return result;
}

AXMSynthOscillatorParameters *__getMADVIDocumentRecognitionRequestClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary();
  uint64_t result = (AXMSynthOscillatorParameters *)objc_getClass("MADVIDocumentRecognitionRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADVIDocumentRecognitionRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (AXMSynthOscillatorParameters *)__getMADVIDocumentRecognitionRequestClass_block_invoke_cold_1();
    return [(AXMSynthOscillatorParameters *)v3 init];
  }
  return result;
}

void sub_1B583A594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583A6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583A7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1B583A83C()
{
}

void sub_1B583A8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583A994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583AA74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583AAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583AB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583ABD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583AC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583ACCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583AD28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583AD9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583AE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583AE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583AED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583AF4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583AFA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583B014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583B11C(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1B583B254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583B384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583B990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void sub_1B583BC74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583BD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583BD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583BE3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583BF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583BFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583C5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583C854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583CA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583CD34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583CF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583D1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  objc_destroyWeak(v29);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);

  _Block_object_dispose((const void *)(v30 - 104), 8);
  objc_destroyWeak((id *)(v30 - 56));
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

void sub_1B583D5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583D790(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B583D834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583D8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583D9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583DBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583DE64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583E22C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583E3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583E5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583E6D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583E7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583F234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B583F6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583F7CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583F9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B583FB1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583FD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B583FFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58401B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58402D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5840460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (a10) {

  }
  _Unwind_Resume(a1);
}

void sub_1B584057C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58406F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58408B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1B58411AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5841398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5841484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5841514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5841594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584198C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5841C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5841D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5841E90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5841FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58420BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58421C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58423AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5842444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B58424DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B58428CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1B5842AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5842B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  long long v5 = value;
  end = p_end_cap[-1].__value_;
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
    std::vector<int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
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
      CGAffineTransform v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, v13);
      std::vector<int>::pointer begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      CGAffineTransform v14 = 0;
    }
    uint64_t v15 = &v14[4 * v11];
    CGRect v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    double v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void sub_1B5849D38(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1B5849DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5849E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5849F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B5849F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584A01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B584A1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584A3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584A55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584A69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584A7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B584AA4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t UIAccessibilityIsImageScreenshot(void *a1)
{
  CFURLRef v1 = a1;
  CFURLRef v2 = v1;
  if (v1 && (uint64_t v3 = CGImageSourceCreateWithURL(v1, 0)) != 0)
  {
    SEL v4 = v3;
    CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    uint64_t v6 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x1E4F2FCD8]];

    uint64_t v7 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x1E4F2FCE8]];
    int v8 = [v7 intValue];

    uint64_t v9 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x1E4F2FD00]];
    int v10 = [v9 intValue];

    uint64_t v11 = [getUIScreenClass() mainScreen];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    CGRect v16 = [getUIScreenClass() mainScreen];
    [v16 scale];
    double v18 = v17;

    if (v6)
    {
      float v19 = v18;
      double v20 = v19;
      int v21 = (int)(v15 * v20);
      int v22 = (int)(v13 * v20);
      uint64_t v6 = v8 == v21 && v10 == v22 || v8 == v22 && v10 == v21;
    }
    CFRelease(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id getUIScreenClass()
{
  uint64_t v4 = 0;
  CFDictionaryRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getUIScreenClass_softClass;
  uint64_t v7 = getUIScreenClass_softClass;
  if (!getUIScreenClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getUIScreenClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getUIScreenClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B584BAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id UIAccessibilityMetadataDescriptionForVideo(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F16330] assetWithURL:a1];
  CFURLRef v2 = [v1 commonMetadata];
  uint64_t v3 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v2 withKey:*MEMORY[0x1E4F15CA8] keySpace:*MEMORY[0x1E4F15DE0]];
  uint64_t v4 = [v3 firstObject];
  CFDictionaryRef v5 = [v4 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void _removeMetadataDescriptionItems(void *a1)
{
  id v4 = a1;
  id v1 = objc_msgSend(MEMORY[0x1E4F16558], "metadataItemsFromArray:withKey:keySpace:");
  if ([v1 count])
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = [v1 objectAtIndexedSubscript:v2];
      [v4 removeObject:v3];

      ++v2;
    }
    while ([v1 count] > v2);
  }
}

uint64_t UIAccessibilityAddMetadataDescriptionToVideo(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)MEMORY[0x1E4F16330];
  id v5 = a2;
  uint64_t v6 = [v4 assetWithURL:v3];
  id v7 = [MEMORY[0x1E4F16360] exportSessionWithAsset:v6 presetName:*MEMORY[0x1E4F15758]];
  int v8 = [v7 supportedFileTypes];
  uint64_t v9 = [v8 firstObject];
  [v7 setOutputFileType:v9];

  int v10 = [v3 absoluteString];
  uint64_t v11 = [v10 stringByDeletingPathExtension];
  double v12 = [v11 stringByAppendingString:@"axout-tmp"];
  double v13 = [v12 stringByAppendingPathExtension:@"MOV"];

  double v14 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
  [v7 setOutputURL:v14];
  double v15 = [v6 metadata];
  id v16 = (id)[v15 mutableCopy];

  if (!v16) {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  _removeMetadataDescriptionItems(v16);
  double v17 = [MEMORY[0x1E4F165A0] metadataItem];
  [v17 setKeySpace:*MEMORY[0x1E4F15DE0]];
  [v17 setKey:*MEMORY[0x1E4F15CA8]];
  [v17 setValue:v5];

  double v18 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v17 setLocale:v18];

  [v16 addObject:v17];
  [v7 setMetadata:v16];
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __UIAccessibilityAddMetadataDescriptionToVideo_block_invoke;
  v59[3] = &unk_1E6116F08;
  id v20 = v7;
  id v60 = v20;
  dispatch_semaphore_t v61 = v19;
  int v21 = v19;
  [v20 exportAsynchronouslyWithCompletionHandler:v59];
  dispatch_time_t v22 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v21, v22);

  if ([v20 status] != 3)
  {
    uint64_t v36 = 0;
    goto LABEL_12;
  }
  v55 = v13;
  double v23 = [v3 absoluteString];
  uint64_t v24 = [v23 stringByAppendingString:@"-axtmp"];

  v54 = (void *)v24;
  CGRect v25 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
  CGRect v26 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v58 = 0;
  [v26 moveItemAtURL:v3 toURL:v25 error:&v58];
  id v27 = v58;

  if (v27)
  {
    CGRect v28 = AXMediaLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      UIAccessibilityAddMetadataDescriptionToVideo_cold_3((uint64_t)v27, v28, v29, v30, v31, v32, v33, v34);
    }
    v35 = v54;
  }
  else
  {
    v38 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v57 = 0;
    [v38 moveItemAtURL:v14 toURL:v3 error:&v57];
    id v39 = v57;

    if (!v39)
    {
      id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v27 removeItemAtURL:v25 error:0];
      uint64_t v36 = 1;
      v35 = v54;
      goto LABEL_9;
    }
    v40 = AXMediaLogCommon();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      UIAccessibilityAddMetadataDescriptionToVideo_cold_2((uint64_t)v39, v40, v41, v42, v43, v44, v45, v46);
    }

    v47 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v56 = v39;
    [v47 moveItemAtURL:v25 toURL:v3 error:&v56];
    id v27 = v56;

    if (!v27)
    {
      uint64_t v36 = 0;
      v35 = v54;
      double v13 = v55;
      goto LABEL_10;
    }
    CGRect v28 = AXMediaLogCommon();
    v35 = v54;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      UIAccessibilityAddMetadataDescriptionToVideo_cold_1((uint64_t)v27, v28, v48, v49, v50, v51, v52, v53);
    }
  }

  uint64_t v36 = 0;
LABEL_9:

  double v13 = v55;
LABEL_10:

LABEL_12:
  return v36;
}

intptr_t __UIAccessibilityAddMetadataDescriptionToVideo_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) status];
    id v4 = [*(id *)(a1 + 32) error];
    int v6 = 134218242;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B57D5000, v2, OS_LOG_TYPE_INFO, "AX: Export Session status: %ld %@", (uint8_t *)&v6, 0x16u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id UIAccessibilityPhotoCreationDate(void *a1)
{
  CFURLRef v1 = a1;
  CFURLRef v2 = v1;
  if (v1 && (uint64_t v3 = CGImageSourceCreateWithURL(v1, 0)) != 0)
  {
    id v4 = v3;
    CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
    CFRelease(v4);
    int v6 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x1E4F2FD40]];
    uint64_t v7 = [v6 objectForKey:*MEMORY[0x1E4F2FD38]];
    if ([v7 length])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v8 setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
      uint64_t v9 = [v8 dateFromString:v7];
      uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v11 = [v10 components:28 fromDate:v9];

      double v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      double v13 = [MEMORY[0x1E4F1C9C8] date];
      double v14 = [v12 components:28 fromDate:v13];

      uint64_t v15 = [v11 year];
      if (v15 == [v14 year])
      {
        uint64_t v16 = [v11 month];
        double v17 = @"MMMMddjjmm";
        if (v16 == [v14 month])
        {
          uint64_t v18 = [v11 day];
          if (v18 == [v14 day]) {
            double v17 = @"jjmm";
          }
        }
      }
      else
      {
        double v17 = @"MMMMddyyyyjjmm";
      }
      dispatch_semaphore_t v19 = AXMDateStringForFormat(v9, v17);
    }
    else
    {
      dispatch_semaphore_t v19 = 0;
    }
  }
  else
  {
    dispatch_semaphore_t v19 = 0;
  }

  return v19;
}

__CFString *UIAccessibilityMetadataDescriptionForImage(void *a1)
{
  CFURLRef v1 = a1;
  CFErrorRef error = 0;
  CFURLRef v2 = (__CFString *)MAImageCaptioningCopyCaption(v1, &error);
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    if (error)
    {
      CFDictionaryRef v5 = AXLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        UIAccessibilityMetadataDescriptionForImage_cold_1((uint64_t)&error, v5, v6, v7, v8, v9, v10, v11);
      }

      if (error)
      {
        CFRelease(error);
        CFErrorRef error = 0;
      }
    }
    if (v1 && (double v12 = CGImageSourceCreateWithURL(v1, 0)) != 0)
    {
      double v13 = v12;
      CFDictionaryRef v14 = CGImageSourceCopyPropertiesAtIndex(v12, 0, 0);
      uint64_t v15 = [(__CFDictionary *)v14 objectForKey:*MEMORY[0x1E4F2FD40]];
      id v4 = [v15 objectForKey:*MEMORY[0x1E4F2FD58]];
      if (!v4)
      {
        uint64_t v16 = [(__CFDictionary *)v14 objectForKey:*MEMORY[0x1E4F2FB80]];
        id v4 = [v16 objectForKey:*MEMORY[0x1E4F2FB58]];
      }
      CFRelease(v13);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

BOOL UIAccessibilityAddMetadataDescriptionToImage(void *a1, void *a2)
{
  CFURLRef v3 = a1;
  id v4 = a2;
  if (!v3) {
    goto LABEL_16;
  }
  CFErrorRef error = 0;
  if (MAImageCaptioningSetCaption(v3, v4, &error))
  {
    BOOL v5 = 1;
    goto LABEL_19;
  }
  uint64_t v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    UIAccessibilityAddMetadataDescriptionToImage_cold_1((uint64_t)&error, v6, v7, v8, v9, v10, v11, v12);
  }

  if (error)
  {
    CFRelease(error);
    CFErrorRef error = 0;
  }
  double v13 = CGImageSourceCreateWithURL(v3, 0);
  if (!v13)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_19;
  }
  CFDictionaryRef v14 = v13;
  CFDictionaryRef v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
  uint64_t v16 = (void *)[(__CFDictionary *)v15 mutableCopy];

  double v17 = [v16 objectForKey:*MEMORY[0x1E4F2F800]];
  uint64_t v18 = (void *)[v17 mutableCopy];

  if (v18
    && (CFStringRef v19 = (const __CFString *)*MEMORY[0x1E4F2FD58],
        [v18 setObject:v4 forKey:*MEMORY[0x1E4F2FD58]],
        CFStringRef v20 = (const __CFString *)*MEMORY[0x1E4F2FD40],
        [v16 setObject:v18 forKey:*MEMORY[0x1E4F2FD40]],
        CFStringRef Type = CGImageSourceGetType(v14),
        (CGImageDestinationRef v22 = CGImageDestinationCreateWithURL(v3, Type, 1uLL, 0)) != 0))
  {
    double v23 = v22;
    Mutable = CGImageMetadataCreateMutable();
    CGImageMetadataSetValueMatchingImageProperty(Mutable, v20, v19, v4);
    CGImageMetadataSetValueMatchingImageProperty(Mutable, (CFStringRef)*MEMORY[0x1E4F2FB80], (CFStringRef)*MEMORY[0x1E4F2FB58], v4);
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", Mutable, *MEMORY[0x1E4F2F448], *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F2F440], 0);
    CFDictionaryRef v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFErrorRef err = 0;
    BOOL v5 = CGImageDestinationCopyImageSource(v23, v14, v25, &err);
    if (err)
    {
      CFRelease(err);
      CFErrorRef err = 0;
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    CFRelease(v23);
  }
  else
  {
    BOOL v5 = 0;
  }
  CFRelease(v14);

LABEL_19:
  return v5;
}

id UIAXPhotoDescriptionString(CGImage *a1, unint64_t a2)
{
  if (!a1) {
    goto LABEL_9;
  }
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  id v4 = (unsigned int (*)(void))getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr;
  uint64_t v46 = getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr;
  if (!getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr)
  {
    *(void *)&transform.a = MEMORY[0x1E4F143A8];
    *(void *)&transform.b = 3221225472;
    *(void *)&transform.c = __getUIAccessibilityIsVoiceOverRunningSymbolLoc_block_invoke;
    *(void *)&transform.d = &unk_1E6116AD8;
    *(void *)&transform.tdouble x = &v43;
    BOOL v5 = (void *)UIKitLibrary();
    v44[3] = (uint64_t)dlsym(v5, "UIAccessibilityIsVoiceOverRunning");
    getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&transform.tx + 8) + 24);
    id v4 = (unsigned int (*)(void))v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (v4)
  {
    if (v4())
    {
      if (UIAXPhotoDescriptionString_onceToken == -1) {
        goto LABEL_7;
      }
      goto LABEL_27;
    }
LABEL_9:
    uint64_t v10 = 0;
    goto LABEL_23;
  }
  __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_27:
  dispatch_once(&UIAXPhotoDescriptionString_onceToken, &__block_literal_global_22);
LABEL_7:
  uint64_t v6 = (void *)MEMORY[0x1BA9A10B0]();
  double Width = (double)CGImageGetWidth(a1);
  double Height = (double)CGImageGetHeight(a1);
  if (CGImageGetWidth(a1) <= 0x190) {
    double v9 = (double)CGImageGetWidth(a1);
  }
  else {
    double v9 = 400.0;
  }
  double v11 = v9 * Height / Width;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  CGRect v48 = CGRectIntegral(*(CGRect *)(&v9 - 2));
  double x = v48.origin.x;
  double y = v48.origin.y;
  double v16 = v48.size.width;
  double v17 = v48.size.height;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v18 = (void (*)(void, double, double, double))getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  uint64_t v46 = getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr;
  if (!getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr)
  {
    *(void *)&transform.a = MEMORY[0x1E4F143A8];
    *(void *)&transform.b = 3221225472;
    *(void *)&transform.c = __getUIGraphicsBeginImageContextWithOptionsSymbolLoc_block_invoke;
    *(void *)&transform.d = &unk_1E6116AD8;
    *(void *)&transform.tdouble x = &v43;
    CFStringRef v19 = (void *)UIKitLibrary();
    v44[3] = (uint64_t)dlsym(v19, "UIGraphicsBeginImageContextWithOptions");
    getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&transform.tx + 8)
                                                                          + 24);
    uint64_t v18 = (void (*)(void, double, double, double))v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (!v18)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_29:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_30;
  }
  v18(0, v16, v17, 0.0);
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  CFStringRef v20 = (uint64_t (*)(void))getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  uint64_t v46 = getUIGraphicsGetCurrentContextSymbolLoc_ptr;
  if (!getUIGraphicsGetCurrentContextSymbolLoc_ptr)
  {
    *(void *)&transform.a = MEMORY[0x1E4F143A8];
    *(void *)&transform.b = 3221225472;
    *(void *)&transform.c = __getUIGraphicsGetCurrentContextSymbolLoc_block_invoke;
    *(void *)&transform.d = &unk_1E6116AD8;
    *(void *)&transform.tdouble x = &v43;
    int v21 = (void *)UIKitLibrary();
    v44[3] = (uint64_t)dlsym(v21, "UIGraphicsGetCurrentContext");
    getUIGraphicsGetCurrentContextSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&transform.tx + 8) + 24);
    CFStringRef v20 = (uint64_t (*)(void))v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (!v20) {
    goto LABEL_29;
  }
  CGImageDestinationRef v22 = (CGContext *)v20();
  CGContextSetInterpolationQuality(v22, kCGInterpolationHigh);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1B58ACFD0;
  transform.tdouble y = v17;
  CGContextConcatCTM(v22, &transform);
  v49.origin.double x = x;
  v49.origin.double y = y;
  v49.size.double width = v16;
  v49.size.double height = v17;
  CGContextDrawImage(v22, v49, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v22);
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v24 = (void (*)(void))getUIGraphicsEndImageContextSymbolLoc_ptr;
  uint64_t v46 = getUIGraphicsEndImageContextSymbolLoc_ptr;
  if (!getUIGraphicsEndImageContextSymbolLoc_ptr)
  {
    *(void *)&transform.a = MEMORY[0x1E4F143A8];
    *(void *)&transform.b = 3221225472;
    *(void *)&transform.c = __getUIGraphicsEndImageContextSymbolLoc_block_invoke;
    *(void *)&transform.d = &unk_1E6116AD8;
    *(void *)&transform.tdouble x = &v43;
    CFDictionaryRef v25 = (void *)UIKitLibrary();
    CGRect v26 = dlsym(v25, "UIGraphicsEndImageContext");
    *(void *)(*(void *)(*(void *)&transform.tx + 8) + 24) = v26;
    getUIGraphicsEndImageContextSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&transform.tx + 8) + 24);
    uint64_t v24 = (void (*)(void))v44[3];
  }
  _Block_object_dispose(&v43, 8);
  if (!v24)
  {
LABEL_30:
    uint64_t v41 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v43, 8);
    _Unwind_Resume(v41);
  }
  v24();
  if (Image) {
    CFAutorelease(Image);
  }
  id v27 = [NSClassFromString(&cfstr_Scrcphotoevalu.isa) sharedInstance];
  CGRect v28 = objc_msgSend(v27, "evaluateImage:forCriteria:inRect:", Image, a2 & 2 | (16 * ((a2 >> 2) & 1)), x, y, v16, v17);
  uint64_t v29 = [v28 blurResult];
  uint64_t v30 = [v28 luminanceResult];
  uint64_t v31 = [v29 humanReadableResult];
  uint64_t v32 = [v30 humanReadableResult];
  uint64_t v10 = __AXMStringForVariables(v31, v33, v34, v35, v36, v37, v38, v39, v32);

LABEL_23:

  return v10;
}

void __UIAXPhotoDescriptionString_block_invoke()
{
  id v1 = [(id)MEMORY[0x1BA9A0AC0]() stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/ScreenReaderCore.framework"];
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithPath:v1];
  [v0 load];
}

id UIAXFileTypeDescriptionForFile(void *a1)
{
  id v1 = [a1 pathExtension];
  CFURLRef v2 = [v1 lowercaseString];
  CFURLRef v3 = UIAXFileTypeDescriptionForFileExtension(v2);

  return v3;
}

id UIAXFileTypeDescriptionForFileExtension(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    PreferredIdentifierForTag = (void *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], v1, 0);
    CFURLRef v3 = UIAXFileTypeDescriptionForUTI(PreferredIdentifierForTag);
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
LABEL_15:

      goto LABEL_20;
    }
    if ([(__CFString *)v1 isEqualToString:@"usdz"])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v7 = v6;
      uint64_t v8 = @"filetype.3D.model";
LABEL_14:
      id v5 = [v6 localizedStringForKey:v8 value:&stru_1F0E72D10 table:@"Accessibility"];

      goto LABEL_15;
    }
    if ([(__CFString *)v1 isEqualToString:@"numbers"])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v7 = v6;
      uint64_t v8 = @"filetype.number";
      goto LABEL_14;
    }
    if ([(__CFString *)v1 isEqualToString:@"pages"])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v7 = v6;
      uint64_t v8 = @"filetype.pages";
      goto LABEL_14;
    }
    if ([(__CFString *)v1 isEqualToString:@"key"])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v7 = v6;
      uint64_t v8 = @"filetype.keynote";
      goto LABEL_14;
    }
    if ([(__CFString *)v1 isEqualToString:@"rtfd"])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      uint64_t v7 = v6;
      uint64_t v8 = @"filetype.rtf.document";
      goto LABEL_14;
    }
    double v9 = AXMediaLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      uint64_t v12 = PreferredIdentifierForTag;
      __int16 v13 = 2112;
      CFDictionaryRef v14 = v1;
      _os_log_impl(&dword_1B57D5000, v9, OS_LOG_TYPE_INFO, "unknown file type: UTI: %@, extension: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  PreferredIdentifierForTag = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  id v5 = [PreferredIdentifierForTag localizedStringForKey:@"filetype.unknown" value:&stru_1F0E72D10 table:@"Accessibility"];
LABEL_20:

  return v5;
}

id UIAXFileTypeDescriptionForUTI(void *a1)
{
  v91[39] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!ContentTypeMap)
  {
    v90[0] = @"image/png";
    v88 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v87 = [v88 localizedStringForKey:@"filetype.image" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[0] = v87;
    v90[1] = @"image/bmp";
    v86 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v85 = [v86 localizedStringForKey:@"filetype.image" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[1] = v85;
    v90[2] = @"image/jpeg";
    v84 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v83 = [v84 localizedStringForKey:@"filetype.image" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[2] = v83;
    v90[3] = @"image/vnd.adobe.photoshop";
    v82 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v81 = [v82 localizedStringForKey:@"filetype.psd" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[3] = v81;
    v90[4] = @"image/tiff";
    v80 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v79 = [v80 localizedStringForKey:@"filetype.tiff" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[4] = v79;
    v90[5] = @"image/svg+xml";
    v78 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v77 = [v78 localizedStringForKey:@"filetype.svg" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[5] = v77;
    v90[6] = @"image/gif";
    v76 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v75 = [v76 localizedStringForKey:@"filetype.gif" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[6] = v75;
    v90[7] = @"text/css";
    v74 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v73 = [v74 localizedStringForKey:@"filetype.css.file" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[7] = v73;
    v90[8] = @"text/csv";
    v72 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v71 = [v72 localizedStringForKey:@"filetype.csv.file" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[8] = v71;
    v90[9] = @"text/html";
    v70 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v69 = [v70 localizedStringForKey:@"filetype.html.file" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[9] = v69;
    v90[10] = @"text/calendar";
    v68 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v67 = [v68 localizedStringForKey:@"filetype.calendar.event" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[10] = v67;
    v90[11] = @"text/plain";
    v66 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v65 = [v66 localizedStringForKey:@"filetype.text.file" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[11] = v65;
    v90[12] = @"text/rtf";
    v64 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v63 = [v64 localizedStringForKey:@"filetype.rtf.document" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[12] = v63;
    v90[13] = @"text/directory";
    v62 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    dispatch_semaphore_t v61 = [v62 localizedStringForKey:@"filetype.contact.card" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[13] = v61;
    v90[14] = @"application/pdf";
    id v60 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v59 = [v60 localizedStringForKey:@"filetype.pdf" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[14] = v59;
    v90[15] = @"application/x-latex";
    id v58 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    id v57 = [v58 localizedStringForKey:@"filetype.latex" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[15] = v57;
    v90[16] = @"application/json";
    id v56 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v55 = [v56 localizedStringForKey:@"filetype.json" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[16] = v55;
    v90[17] = @"application/vnd.ms-excel";
    v54 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v53 = [v54 localizedStringForKey:@"filetype.excel" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[17] = v53;
    v90[18] = @"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
    uint64_t v52 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v51 = [v52 localizedStringForKey:@"filetype.excel" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[18] = v51;
    v90[19] = @"application/onenote";
    uint64_t v50 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CGRect v49 = [v50 localizedStringForKey:@"filetype.onenote" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[19] = v49;
    v90[20] = @"application/vnd.ms-powerpoint";
    CGRect v48 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    v47 = [v48 localizedStringForKey:@"filetype.powerpoint" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[20] = v47;
    v90[21] = @"application/vnd.openxmlformats-officedocument.presentationml.presentation";
    uint64_t v46 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v45 = [v46 localizedStringForKey:@"filetype.powerpoint" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[21] = v45;
    v90[22] = @"application/msword";
    uint64_t v44 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v43 = [v44 localizedStringForKey:@"filetype.word" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[22] = v43;
    v90[23] = @"application/vnd.openxmlformats-officedocument.wordprocessingml.document";
    uint64_t v42 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v41 = [v42 localizedStringForKey:@"filetype.word" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[23] = v41;
    v90[24] = @"application/postscript";
    v40 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v39 = [v40 localizedStringForKey:@"filetype.postscript" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[24] = v39;
    v90[25] = @"application/rtf";
    uint64_t v38 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v37 = [v38 localizedStringForKey:@"filetype.rtf.document" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[25] = v37;
    v90[26] = @"application/xml";
    uint64_t v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v35 = [v36 localizedStringForKey:@"filetype.xml" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[26] = v35;
    v90[27] = @"application/rss+xml";
    uint64_t v34 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v33 = [v34 localizedStringForKey:@"filetype.rss" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[27] = v33;
    v90[28] = @"application/zip";
    uint64_t v32 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v31 = [v32 localizedStringForKey:@"filetype.zip" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[28] = v31;
    v90[29] = @"application/x-rar-compressed";
    uint64_t v30 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v29 = [v30 localizedStringForKey:@"filetype.rar" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[29] = v29;
    v90[30] = @"application/x-tar";
    CGRect v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    id v27 = [v28 localizedStringForKey:@"filetype.tar" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[30] = v27;
    v90[31] = @"application/epub+zip";
    CGRect v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CFDictionaryRef v25 = [v26 localizedStringForKey:@"filetype.epub" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[31] = v25;
    v90[32] = @"audio/mp4";
    uint64_t v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    double v23 = [v24 localizedStringForKey:@"filetype.audio" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[32] = v23;
    v90[33] = @"audio/x-wav";
    CGImageDestinationRef v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    int v21 = [v22 localizedStringForKey:@"filetype.audio" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[33] = v21;
    v90[34] = @"audio/x-m4a";
    CFStringRef v20 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CFStringRef v19 = [v20 localizedStringForKey:@"filetype.audio" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[34] = v19;
    v90[35] = @"video/quicktime";
    uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CFURLRef v2 = [v18 localizedStringForKey:@"filetype.video" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[35] = v2;
    v90[36] = @"video/mp4";
    [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    CFURLRef v3 = v89 = v1;
    id v4 = [v3 localizedStringForKey:@"filetype.video" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[36] = v4;
    v90[37] = @"video/mpeg";
    id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v6 = [v5 localizedStringForKey:@"filetype.video" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[37] = v6;
    v90[38] = @"video/x-m4v";
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
    uint64_t v8 = [v7 localizedStringForKey:@"filetype.video" value:&stru_1F0E72D10 table:@"Accessibility"];
    v91[38] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:39];
    uint64_t v10 = (void *)ContentTypeMap;
    ContentTypeMap = v9;

    id v1 = v89;
  }
  int v11 = (__CFString *)UTTypeCopyPreferredTagWithClass(v1, (CFStringRef)*MEMORY[0x1E4F442E8]);
  uint64_t v12 = [(id)ContentTypeMap objectForKeyedSubscript:v11];
  if (![v12 length])
  {
    if (([(__CFString *)v11 hasPrefix:@"audio/"] & 1) != 0
      || [(__CFString *)v1 isEqualToString:@"com.apple.coreaudio-format"])
    {
      __int16 v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      CFDictionaryRef v14 = v13;
      uint64_t v15 = @"filetype.audio";
LABEL_7:
      uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_1F0E72D10 table:@"Accessibility"];

      uint64_t v12 = (void *)v16;
      goto LABEL_8;
    }
    if ([(__CFString *)v11 hasPrefix:@"video/"])
    {
      __int16 v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
      CFDictionaryRef v14 = v13;
      uint64_t v15 = @"filetype.video";
      goto LABEL_7;
    }
  }
LABEL_8:

  return v12;
}

__CFString *_heartLocSuffixForSuffix(uint64_t a1)
{
  id v1 = [&unk_1F0E94378 objectForKey:a1];
  CFURLRef v2 = v1;
  if (!v1) {
    id v1 = &stru_1F0E72D10;
  }
  CFURLRef v3 = v1;

  return v3;
}

__CFString *_handLocSuffixForSuffix(uint64_t a1)
{
  id v1 = [&unk_1F0E943A0 objectForKey:a1];
  CFURLRef v2 = v1;
  if (!v1) {
    id v1 = &stru_1F0E72D10;
  }
  CFURLRef v3 = v1;

  return v3;
}

__CFString *_eyesLocSuffixForSuffix(void *a1)
{
  uint64_t v1 = _eyesLocSuffixForSuffix_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_eyesLocSuffixForSuffix_onceToken, &__block_literal_global_432);
  }
  uint64_t v3 = [v2 integerValue];

  id v4 = (void *)_eyesLocSuffixForSuffix_emojiDescriptions;
  id v5 = [NSNumber numberWithInteger:v3];
  uint64_t v6 = [v4 objectForKey:v5];
  uint64_t v7 = v6;
  if (!v6) {
    uint64_t v6 = &stru_1F0E72D10;
  }
  uint64_t v8 = v6;

  return v8;
}

void ___eyesLocSuffixForSuffix_block_invoke()
{
  v3[58] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0E937D8;
  v2[1] = &unk_1F0E937F0;
  v3[0] = @".face.eyes.open";
  v3[1] = @".face.eyes.one.eye.closed";
  v2[2] = &unk_1F0E93808;
  v2[3] = &unk_1F0E93820;
  v3[2] = @".face.eyes.open";
  v3[3] = @".face.eyes.open";
  v2[4] = &unk_1F0E93838;
  v2[5] = &unk_1F0E93850;
  v3[4] = @".face.eyes.one.eye.closed";
  void v3[5] = @".face.eyes.one.eye.closed";
  v2[6] = &unk_1F0E93868;
  v2[7] = &unk_1F0E93880;
  void v3[6] = @".face.eyes.open";
  v3[7] = @".face.eyes.hearts";
  v2[8] = &unk_1F0E93898;
  v2[9] = &unk_1F0E938B0;
  v3[8] = @".face.eyes.hearts";
  v3[9] = @".eyes.hearts";
  v2[10] = &unk_1F0E938C8;
  v2[11] = &unk_1F0E938E0;
  v3[10] = @".eyes.one.eye.closed";
  v3[11] = @".sunglasses";
  v2[12] = &unk_1F0E938F8;
  v2[13] = &unk_1F0E93910;
  v3[12] = @".aviator.sunglasses";
  v3[13] = @".cat.eye.sunglasses";
  v2[14] = &unk_1F0E93928;
  v2[15] = &unk_1F0E93940;
  v3[14] = @".eyes.furled";
  v3[15] = @".eyes.furled";
  v2[16] = &unk_1F0E93958;
  v2[17] = &unk_1F0E93970;
  v3[16] = @".eyes.furled";
  v3[17] = @".eyes.crying";
  v2[18] = &unk_1F0E93988;
  v2[19] = &unk_1F0E939A0;
  v3[18] = @".eyes.crying";
  v3[19] = @".eyes.crying";
  v2[20] = &unk_1F0E939B8;
  v2[21] = &unk_1F0E939D0;
  v3[20] = @".eyes.open";
  v3[21] = @".eyes.furled";
  v2[22] = &unk_1F0E939E8;
  v2[23] = &unk_1F0E93A00;
  v3[22] = @".eyes.furled";
  v3[23] = @".eyes.furled";
  v2[24] = &unk_1F0E93A18;
  v2[25] = &unk_1F0E93A30;
  v3[24] = @".eyes.furled";
  v3[25] = @".eyes.wide.open";
  v2[26] = &unk_1F0E93A48;
  v2[27] = &unk_1F0E93A60;
  v3[26] = @".eyes.one.eye.closed";
  v3[27] = @".eyes.open";
  v2[28] = &unk_1F0E93A78;
  v2[29] = &unk_1F0E93A90;
  v3[28] = @".eyes.furled";
  v3[29] = @".eyes.open";
  v2[30] = &unk_1F0E93AA8;
  v2[31] = &unk_1F0E93AC0;
  v3[30] = @".eyes.crying";
  v3[31] = @".eyes.closed";
  v2[32] = &unk_1F0E93AD8;
  v2[33] = &unk_1F0E93AF0;
  v3[32] = @".eyes.closed";
  v3[33] = @".eyes.crying";
  v2[34] = &unk_1F0E93B08;
  v2[35] = &unk_1F0E93B20;
  v3[34] = @".eyes.black.hearts";
  v3[35] = @".eyes.black.hearts";
  v2[36] = &unk_1F0E93B38;
  v2[37] = &unk_1F0E93B50;
  v3[36] = @".eyes.black.hearts";
  v3[37] = @".eyes.crying";
  v2[38] = &unk_1F0E93B68;
  v2[39] = &unk_1F0E93B80;
  v3[38] = @".eyes.crying";
  v3[39] = @".eyes.open";
  v2[40] = &unk_1F0E93B98;
  v2[41] = &unk_1F0E93BB0;
  v3[40] = @".eyes.open";
  v3[41] = @".eyes.open";
  v2[42] = &unk_1F0E93BC8;
  v2[43] = &unk_1F0E93BE0;
  v3[42] = @".eyes.open";
  v3[43] = @".eyes.crosses";
  v2[44] = &unk_1F0E93BF8;
  v2[45] = &unk_1F0E93C10;
  v3[44] = @".eyes.bandages";
  v3[45] = @".eyes.half.closed";
  v2[46] = &unk_1F0E93C28;
  v2[47] = &unk_1F0E93C40;
  v3[46] = @".eyes.closed";
  v3[47] = @".eyes.half.closed";
  v2[48] = &unk_1F0E93C58;
  v2[49] = &unk_1F0E93C70;
  v3[48] = @".eyes.closed";
  v3[49] = @".eyes.closed";
  v2[50] = &unk_1F0E93C88;
  v2[51] = &unk_1F0E93CA0;
  v3[50] = @".eyes.closed";
  v3[51] = @".eyes.closed";
  v2[52] = &unk_1F0E93CB8;
  v2[53] = &unk_1F0E93CD0;
  v3[52] = @".eyes.half.closed";
  v3[53] = @".eyes.half.closed";
  v2[54] = &unk_1F0E93CE8;
  v2[55] = &unk_1F0E93D00;
  v3[54] = @".eyes.open";
  v3[55] = @".eyes.half.closed.one";
  v2[56] = &unk_1F0E93D18;
  v2[57] = &unk_1F0E93D30;
  v3[56] = @".eyes.tearing.up";
  v3[57] = @".eyes.open";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:58];
  uint64_t v1 = (void *)_eyesLocSuffixForSuffix_emojiDescriptions;
  _eyesLocSuffixForSuffix_emojiDescriptions = v0;
}

__CFString *_mouthLocSuffixForSuffix(void *a1)
{
  uint64_t v1 = _mouthLocSuffixForSuffix_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_mouthLocSuffixForSuffix_onceToken, &__block_literal_global_607);
  }
  uint64_t v3 = [v2 integerValue];

  id v4 = (void *)_mouthLocSuffixForSuffix_emojiDescriptions;
  id v5 = [NSNumber numberWithInteger:v3];
  uint64_t v6 = [v4 objectForKey:v5];
  uint64_t v7 = v6;
  if (!v6) {
    uint64_t v6 = &stru_1F0E72D10;
  }
  uint64_t v8 = v6;

  return v8;
}

void ___mouthLocSuffixForSuffix_block_invoke()
{
  v3[58] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F0E937D8;
  v2[1] = &unk_1F0E937F0;
  v3[0] = @".mouth.smiling";
  v3[1] = @".mouth.smiling";
  v2[2] = &unk_1F0E93808;
  v2[3] = &unk_1F0E93820;
  v3[2] = @".mouth.smiling.half.open";
  v3[3] = @".mouth.smiling.wide";
  v2[4] = &unk_1F0E93838;
  v2[5] = &unk_1F0E93850;
  v3[4] = @".mouth.smiling.wide";
  void v3[5] = @".mouth.tongue";
  v2[6] = &unk_1F0E93868;
  v2[7] = &unk_1F0E93880;
  void v3[6] = @".mouth.tongue";
  v3[7] = @".mouth.tongue";
  v2[8] = &unk_1F0E93898;
  v2[9] = &unk_1F0E938B0;
  v3[8] = @".mouth.smiling.wide";
  v3[9] = @".mouth.smiling";
  v2[10] = &unk_1F0E938C8;
  v2[11] = &unk_1F0E938E0;
  v3[10] = @".mouth.blowing.kiss";
  v3[11] = @".mouth.smirking";
  v2[12] = &unk_1F0E938F8;
  v2[13] = &unk_1F0E93910;
  v3[12] = @".mouth.smirking";
  v3[13] = @".mouth.smirking";
  v2[14] = &unk_1F0E93928;
  v2[15] = &unk_1F0E93940;
  v3[14] = @".mouth.smiling";
  v3[15] = @".mouth.smiling.wide";
  v2[16] = &unk_1F0E93958;
  v2[17] = &unk_1F0E93970;
  v3[16] = @".mouth.tongue";
  v3[17] = @".mouth.tongue";
  v2[18] = &unk_1F0E93988;
  v2[19] = &unk_1F0E939A0;
  v3[18] = @".mouth.smiling.wide";
  v3[19] = @".mouth.smiling";
  v2[20] = &unk_1F0E939B8;
  v2[21] = &unk_1F0E939D0;
  v3[20] = @".mouth.half.frowning";
  v3[21] = @".mouth.half.frowning";
  v2[22] = &unk_1F0E939E8;
  v2[23] = &unk_1F0E93A00;
  v3[22] = @".mouth.frowning";
  v3[23] = @".mouth.frowning";
  v2[24] = &unk_1F0E93A18;
  v2[25] = &unk_1F0E93A30;
  v3[24] = @".mouth.frowning";
  v3[25] = @".mouth.gasping";
  v2[26] = &unk_1F0E93A48;
  v2[27] = &unk_1F0E93A60;
  v3[26] = @".mouth.gasping";
  v3[27] = @".mouth.gasping";
  v2[28] = &unk_1F0E93A78;
  v2[29] = &unk_1F0E93A90;
  v3[28] = @".mouth.gasping";
  v3[29] = @".mouth.screaming";
  v2[30] = &unk_1F0E93AA8;
  v2[31] = &unk_1F0E93AC0;
  v3[30] = @".mouth.screaming";
  v3[31] = @".mouth.screaming";
  v2[32] = &unk_1F0E93AD8;
  v2[33] = &unk_1F0E93AF0;
  v3[32] = @".mouth.gasping";
  v3[33] = @".mouth.gasping";
  v2[34] = &unk_1F0E93B08;
  v2[35] = &unk_1F0E93B20;
  v3[34] = @".mouth.gasping";
  v3[35] = @".mouth.frowning";
  v2[36] = &unk_1F0E93B38;
  v2[37] = &unk_1F0E93B50;
  v3[36] = @".mouth.half.frowning";
  v3[37] = @".mouth.half.frowning";
  v2[38] = &unk_1F0E93B68;
  v2[39] = &unk_1F0E93B80;
  v3[38] = @".mouth.frowning";
  v3[39] = @".mouth.frowning";
  v2[40] = &unk_1F0E93B98;
  v2[41] = &unk_1F0E93BB0;
  v3[40] = @".mouth.frowning";
  v3[41] = @".mouth.thermometer";
  v2[42] = &unk_1F0E93BC8;
  v2[43] = &unk_1F0E93BE0;
  v3[42] = @".mouth.surgical.mask";
  v3[43] = @".mouth.half.frowning";
  v2[44] = &unk_1F0E93BF8;
  v2[45] = &unk_1F0E93C10;
  v3[44] = @".mouth.half.frowning";
  v3[45] = @".mouth.half.frowning";
  v2[46] = &unk_1F0E93C28;
  v2[47] = &unk_1F0E93C40;
  v3[46] = @".mouth.half.frowning";
  v3[47] = @".mouth.frowning";
  v2[48] = &unk_1F0E93C58;
  v2[49] = &unk_1F0E93C70;
  v3[48] = @".mouth.frowning";
  v3[49] = @".mouth.smiling";
  v2[50] = &unk_1F0E93C88;
  v2[51] = &unk_1F0E93CA0;
  v3[50] = @".mouth.smiling.wide";
  v3[51] = @".mouth.tongue";
  v2[52] = &unk_1F0E93CB8;
  v2[53] = &unk_1F0E93CD0;
  v3[52] = @".mouth.tongue";
  v3[53] = @".mouth.smiling";
  v2[54] = &unk_1F0E93CE8;
  v2[55] = &unk_1F0E93D00;
  v3[54] = @".mouth.smirking";
  v3[55] = @".mouth.smiling";
  v2[56] = &unk_1F0E93D18;
  v2[57] = &unk_1F0E93D30;
  v3[56] = @".mouth.smiling.teeth";
  v3[57] = @".mouth.smiling.teeth";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:58];
  uint64_t v1 = (void *)_mouthLocSuffixForSuffix_emojiDescriptions;
  _mouthLocSuffixForSuffix_emojiDescriptions = v0;
}

id UIAccessibilityEmojiDescription(void *a1)
{
  CFURLRef v1 = a1;
  CFURLRef v2 = v1;
  if (!v1 || (uint64_t v3 = CGImageSourceCreateWithURL(v1, 0)) == 0)
  {
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  id v4 = v3;
  CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
  uint64_t v6 = [(__CFDictionary *)v5 objectForKey:*MEMORY[0x1E4F2F990]];

  if (v6)
  {
    uint64_t v7 = [(__CFURL *)v2 path];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = [v8 stringByDeletingPathExtension];

    uint64_t v42 = v9;
    CFURLRef v40 = v2;
    uint64_t v41 = v4;
    if ([v9 rangeOfString:@"heart-blue-loop-"])
    {
      if ([v9 rangeOfString:@"heart-red-loop-"])
      {
        if ([v9 rangeOfString:@"heart-purple-loop-"])
        {
          if ([v9 rangeOfString:@"hand-loop-"])
          {
            if ([v9 rangeOfString:@"face-red-loop-"])
            {
              if ([v9 rangeOfString:@"face-yellow-loop-"])
              {
                uint64_t v16 = 0;
                double v17 = &stru_1F0E72D10;
                uint64_t v18 = &stru_1F0E72D10;
LABEL_20:

                goto LABEL_21;
              }
              CFStringRef v19 = [v9 substringFromIndex:v15];
              if ([v19 isEqualToString:@"21"])
              {
                double v17 = @"emoji.face.sad";
LABEL_38:
                uint64_t v39 = &stru_1F0E72D10;
                CGImageDestinationRef v22 = @"emoji.yellow.face";
                goto LABEL_19;
              }
              if ([v19 isEqualToString:@"52"])
              {
                double v17 = @"emoji.face.sleeping";
                goto LABEL_38;
              }
              if ([v19 isEqualToString:@"26"])
              {
                double v17 = @"emoji.face.confused.and.dismayed";
                goto LABEL_38;
              }
              uint64_t v37 = _eyesLocSuffixForSuffix(v19);
              double v17 = [@"emoji.face" stringByAppendingString:v37];

              CFStringRef v20 = _mouthLocSuffixForSuffix(v19);
              uint64_t v39 = [@"emoji.face" stringByAppendingString:v20];
              CGImageDestinationRef v22 = @"emoji.yellow.face";
              goto LABEL_18;
            }
            CFStringRef v19 = [v9 substringFromIndex:v14];
            if ([v19 isEqualToString:@"21"])
            {
              double v17 = @"emoji.face.sad";
LABEL_35:
              uint64_t v39 = &stru_1F0E72D10;
              CGImageDestinationRef v22 = @"emoji.red.face";
              goto LABEL_19;
            }
            if ([v19 isEqualToString:@"52"])
            {
              double v17 = @"emoji.face.sleeping";
              goto LABEL_35;
            }
            if ([v19 isEqualToString:@"26"])
            {
              double v17 = @"emoji.face.confused.and.dismayed";
              goto LABEL_35;
            }
            uint64_t v36 = _eyesLocSuffixForSuffix(v19);
            double v17 = [@"emoji.face" stringByAppendingString:v36];

            CFStringRef v20 = _mouthLocSuffixForSuffix(v19);
            uint64_t v39 = [@"emoji.face" stringByAppendingString:v20];
            CGImageDestinationRef v22 = @"emoji.red.face";
LABEL_18:

LABEL_19:
            double v23 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
            uint64_t v24 = [v23 localizedStringForKey:v22 value:&stru_1F0E72D10 table:@"Accessibility"];
            CFDictionaryRef v25 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
            CGRect v26 = [v25 localizedStringForKey:v17 value:&stru_1F0E72D10 table:@"Accessibility"];
            id v27 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
            uint64_t v18 = v39;
            uint64_t v38 = [v27 localizedStringForKey:v39 value:&stru_1F0E72D10 table:@"Accessibility"];
            uint64_t v16 = __AXMStringForVariables(v24, v28, v29, v30, v31, v32, v33, v34, v26);

            uint64_t v9 = v42;
            CFURLRef v2 = v40;
            id v4 = v41;
            goto LABEL_20;
          }
          CFStringRef v19 = [v9 substringFromIndex:v13];
          CFStringRef v20 = _handLocSuffixForSuffix((uint64_t)v19);
          int v21 = @"emoji.hand";
        }
        else
        {
          CFStringRef v19 = [v9 substringFromIndex:v12];
          CFStringRef v20 = _heartLocSuffixForSuffix((uint64_t)v19);
          int v21 = @"emoji.heart.purple";
        }
      }
      else
      {
        CFStringRef v19 = [v9 substringFromIndex:v11];
        CFStringRef v20 = _heartLocSuffixForSuffix((uint64_t)v19);
        int v21 = @"emoji.heart.red";
      }
    }
    else
    {
      CFStringRef v19 = [v9 substringFromIndex:v10];
      CFStringRef v20 = _heartLocSuffixForSuffix((uint64_t)v19);
      int v21 = @"emoji.heart.blue";
    }
    double v17 = [(__CFString *)v21 stringByAppendingString:v20];
    CGImageDestinationRef v22 = &stru_1F0E72D10;
    uint64_t v39 = &stru_1F0E72D10;
    goto LABEL_18;
  }
  uint64_t v16 = 0;
LABEL_21:
  CFRelease(v4);

LABEL_22:

  return v16;
}

Class __getUIScreenClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  Class result = objc_getClass("UIScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIScreenClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIScreenClass_block_invoke_cold_1();
    return (Class)UIKitLibrary();
  }
  return result;
}

uint64_t UIKitLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __UIKitLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E61184D0;
    uint64_t v5 = 0;
    UIKitLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  uint64_t v0 = UIKitLibraryCore_frameworkLibrary;
  CFURLRef v1 = (void *)v3[0];
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    CFURLRef v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrardouble y = result;
  return result;
}

void *__getUIAccessibilityIsVoiceOverRunningSymbolLoc_block_invoke(uint64_t a1)
{
  CFURLRef v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIAccessibilityIsVoiceOverRunning");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIAccessibilityIsVoiceOverRunningSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIGraphicsBeginImageContextWithOptionsSymbolLoc_block_invoke(uint64_t a1)
{
  CFURLRef v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIGraphicsBeginImageContextWithOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsBeginImageContextWithOptionsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIGraphicsGetCurrentContextSymbolLoc_block_invoke(uint64_t a1)
{
  CFURLRef v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIGraphicsGetCurrentContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsGetCurrentContextSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIGraphicsEndImageContextSymbolLoc_block_invoke(uint64_t a1)
{
  CFURLRef v2 = (void *)UIKitLibrary();
  uint64_t result = dlsym(v2, "UIGraphicsEndImageContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getUIGraphicsEndImageContextSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXMSecureCodingClasses()
{
  dispatch_semaphore_t v61 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v60 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v54 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return objc_msgSend(v61, "setWithObjects:", v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44,
           v43,
           v42,
           v41,
           v40,
           v39,
           v38,
           v37,
           v36,
           v35,
           v34,
           v33,
           v32,
           v31,
           v30,
           v29,
           v28,
           v27,
           v26,
           v25,
           v24,
           v23,
           v22,
           v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v14,
           v13,
           v12,
           v11,
           v0,
           v1,
           v2,
           v3,
           v4,
           v5,
           v6,
           v7,
           v8,
           v9,
           objc_opt_class());
}

id AXMServiceInterface()
{
  if (AXMServiceInterface_onceToken != -1) {
    dispatch_once(&AXMServiceInterface_onceToken, &__block_literal_global_24);
  }
  uint64_t v0 = (void *)AXMServiceInterface__Interface;

  return v0;
}

void __AXMServiceInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0E97F58];
  uint64_t v1 = (void *)AXMServiceInterface__Interface;
  AXMServiceInterface__Interface = v0;

  AXMSecureCodingClasses();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [(id)AXMServiceInterface__Interface setClasses:v2 forSelector:sel_visionEngine_evaluateSource_context_options_result_ argumentIndex:0 ofReply:0];
  [(id)AXMServiceInterface__Interface setClasses:v2 forSelector:sel_visionEngine_evaluateSource_context_options_result_ argumentIndex:1 ofReply:0];
  [(id)AXMServiceInterface__Interface setClasses:v2 forSelector:sel_visionEngine_evaluateSource_context_options_result_ argumentIndex:2 ofReply:0];
  [(id)AXMServiceInterface__Interface setClasses:v2 forSelector:sel_visionEngine_evaluateSource_context_options_result_ argumentIndex:3 ofReply:0];
  [(id)AXMServiceInterface__Interface setClasses:v2 forSelector:sel_visionEngine_evaluateSource_context_options_result_ argumentIndex:0 ofReply:1];
  [(id)AXMServiceInterface__Interface setClasses:v2 forSelector:sel_visionEngine_evaluateSource_context_options_result_ argumentIndex:1 ofReply:1];
}

uint64_t AXMIsRunningInServiceProcess()
{
  if (AXMIsRunningInServiceProcess_onceToken != -1) {
    dispatch_once(&AXMIsRunningInServiceProcess_onceToken, &__block_literal_global_140);
  }
  return AXMIsRunningInServiceProcess__RunningInServiceProcess;
}

void __AXMIsRunningInServiceProcess_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  AXMIsRunningInServiceProcess__RunningInServiceProcess = [v0 isEqualToString:AXMServiceIdentifier];
}

id _AXMContextQueue()
{
  if (_AXMContextQueue_onceToken != -1) {
    dispatch_once(&_AXMContextQueue_onceToken, &__block_literal_global_143);
  }
  uint64_t v0 = (void *)_AXMContextQueue__ContextQueue;

  return v0;
}

id AXMCoreImageContext(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__11;
  uint64_t v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  id v2 = _AXMContextQueue();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __AXMCoreImageContext_block_invoke;
  v6[3] = &unk_1E6118538;
  id v7 = v1;
  uint64_t v8 = &v9;
  id v3 = v1;
  dispatch_sync(v2, v6);

  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __AXMCoreImageContext_block_invoke(uint64_t a1)
{
  id v2 = (void *)_AXMContext;
  if (!_AXMContext)
  {
    [*(id *)(a1 + 32) measure:@"Create CIContext" execute:&__block_literal_global_150];
    id v2 = (void *)_AXMContext;
  }
  id v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v3, v2);
}

void __AXMCoreImageContext_block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x1E4F1E018] context];
  id v1 = (void *)_AXMContext;
  _AXMContext = v0;
}

void AXMDeleteCoreImageContext()
{
  uint64_t v0 = _AXMContextQueue();
  dispatch_sync(v0, &__block_literal_global_153);
}

void __AXMDeleteCoreImageContext_block_invoke()
{
  uint64_t v0 = (void *)_AXMContext;
  _AXMContext = 0;
}

id AXMSharedDisplayManager()
{
  if (AXMSharedDisplayManager_onceToken != -1) {
    dispatch_once(&AXMSharedDisplayManager_onceToken, &__block_literal_global_155);
  }
  uint64_t v0 = (void *)AXMSharedDisplayManager_DisplayManager;

  return v0;
}

void __AXMSharedDisplayManager_block_invoke()
{
  id v0 = [[AXMDisplayManager alloc] initAndWaitForMainDisplayConfiguration];
  id v1 = (void *)AXMSharedDisplayManager_DisplayManager;
  AXMSharedDisplayManager_DisplayManager = (uint64_t)v0;
}

id AXMAllSourceNodeClasses()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];

  return v0;
}

id AXMAllEvaluationNodeClasses()
{
  v2[18] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  void v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  v2[15] = objc_opt_class();
  v2[16] = objc_opt_class();
  v2[17] = objc_opt_class();
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:18];

  return v0;
}

CVPixelBufferRef AXMCreatePixelBufferByRotatingBuffer(CVPixelBufferRef texture, int a2, void *a3)
{
  CVPixelBufferRef pixelBufferOut = 0;
  if (a2 == 1)
  {
    return CVPixelBufferRetain(texture);
  }
  else
  {
    size_t Width = CVPixelBufferGetWidth(texture);
    size_t Height = CVPixelBufferGetHeight(texture);
    PixelFormatCFStringRef Type = CVPixelBufferGetPixelFormatType(texture);
    int v10 = a2 - 2;
    OSType v11 = PixelFormatType;
    int v12 = 0;
    int v13 = 1;
    size_t v14 = Width;
    switch(v10)
    {
      case 0:
        int v13 = 0;
        int v12 = 1;
        goto LABEL_11;
      case 1:
        int v12 = 0;
        int v13 = 0;
LABEL_11:
        size_t v14 = Width;
        goto LABEL_15;
      case 2:
        goto LABEL_15;
      case 3:
        int v13 = 0;
        int v12 = 1;
        goto LABEL_14;
      case 4:
      case 6:
        int v12 = 0;
        int v13 = 0;
        goto LABEL_14;
      case 5:
        int v12 = 0;
LABEL_14:
        size_t v14 = Height;
        size_t Height = Width;
LABEL_15:
        uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
        [v15 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:*MEMORY[0x1E4F24D20]];
        uint64_t v22 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, Height, v11, (CFDictionaryRef)v15, &pixelBufferOut);
        if (v22)
        {
          if (a3)
          {
            uint64_t v23 = [NSNumber numberWithInt:v22];
            _AXMMakeError(0, @"could not allocate pixel buffer: %@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          VTPixelRotationSessionRef pixelRotationSessionOut = 0;
          VTPixelRotationSessionCreate(0, &pixelRotationSessionOut);
          CGFloat v30 = (double)CVPixelBufferGetWidth(texture);
          v43.size.double height = (double)CVPixelBufferGetHeight(texture);
          v43.origin.double x = 0.0;
          v43.origin.double y = 0.0;
          v43.size.double width = v30;
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v43);
          VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
          CFRelease(DictionaryRepresentation);
          if (v12) {
            VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F45098], MEMORY[0x1E4F1CC38]);
          }
          if (v13) {
            VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F450A0], MEMORY[0x1E4F1CC38]);
          }
          uint64_t v32 = VTPixelRotationSessionRotateImage(pixelRotationSessionOut, texture, pixelBufferOut);
          if (!v32)
          {
            VTPixelRotationSessionInvalidate(pixelRotationSessionOut);
            CFRelease(pixelRotationSessionOut);

            return pixelBufferOut;
          }
          if (a3)
          {
            uint64_t v33 = [NSNumber numberWithInt:v32];
            _AXMMakeError(0, @"Could not rotate buffer: %@", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          if (pixelRotationSessionOut)
          {
            VTPixelRotationSessionInvalidate(pixelRotationSessionOut);
            CFRelease(pixelRotationSessionOut);
          }
        }
        if (pixelBufferOut) {
          CVPixelBufferRelease(pixelBufferOut);
        }
LABEL_29:

LABEL_30:
        CVPixelBufferRef result = 0;
        break;
      default:
        if (!a3) {
          goto LABEL_30;
        }
        uint64_t v15 = [NSNumber numberWithUnsignedInt:Width];
        _AXMMakeError(0, @"Could not rotate buffer with orientation: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
    }
  }
  return result;
}

id AXMImageByRotatingImage(void *a1, CGFloat a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  [v3 extent];
  double v5 = v4;
  [v3 extent];
  double v7 = v6;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, v5 * 0.5, v6 * 0.5);
  CGAffineTransform v16 = v18;
  CGAffineTransformRotate(&v17, &v16, a2);
  CGAffineTransform v18 = v17;
  CGAffineTransform v16 = v17;
  CGAffineTransformTranslate(&v17, &v16, v5 * -0.5, v7 * -0.5);
  CGAffineTransform v18 = v17;
  uint64_t v8 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v9 = *MEMORY[0x1E4F1E480];
  v20[0] = v3;
  uint64_t v10 = *MEMORY[0x1E4F1E508];
  v19[0] = v9;
  v19[1] = v10;
  OSType v11 = [MEMORY[0x1E4F29238] axmValueWithCGAffineTransform:&v17];
  v20[1] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  int v13 = [v8 filterWithName:@"CIAffineTransform" withInputParameters:v12];

  size_t v14 = [v13 outputImage];

  return v14;
}

void AXMWritePixelBufferToURL(uint64_t a1, void *a2, void *a3)
{
  double v5 = (void *)MEMORY[0x1E4F1E050];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 imageWithCVPixelBuffer:a1];
  AXMWriteImageToURL(v8, v7, v6);
}

void AXMWriteImageToURL(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v9 = AXMCoreImageContext(v5);

  id v12 = 0;
  [v9 writeJPEGRepresentationOfImage:v7 toURL:v6 colorSpace:DeviceRGB options:MEMORY[0x1E4F1CC08] error:&v12];

  id v10 = v12;
  if (v10)
  {
    OSType v11 = AXMediaLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v10, v11);
    }
  }
  if (DeviceRGB) {
    CFRelease(DeviceRGB);
  }
}

void sub_1B5853454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B5853840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVN2vIWnsZbk4Su55oeWfKDq1()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr;
  uint64_t v8 = getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr;
  if (!getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr)
  {
    id v1 = (void *)VisionLibrary_8();
    v6[3] = (uint64_t)dlsym(v1, "VN2vIWnsZbk4Su55oeWfKDq1");
    getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;

  return v2;
}

id getVNmNJnu0xlW8CZXt6hJ7Rpb0()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr;
  uint64_t v8 = getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr;
  if (!getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr)
  {
    id v1 = (void *)VisionLibrary_8();
    v6[3] = (uint64_t)dlsym(v1, "VNmNJnu0xlW8CZXt6hJ7Rpb0");
    getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;

  return v2;
}

id getVN35FOB1QhtSfYGRIJvTgtTq()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr;
  uint64_t v8 = getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr;
  if (!getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr)
  {
    id v1 = (void *)VisionLibrary_8();
    v6[3] = (uint64_t)dlsym(v1, "VN35FOB1QhtSfYGRIJvTgtTq");
    getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;

  return v2;
}

id getVN6ZsEIQ9ri2eF1vhsxw5COm()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr;
  uint64_t v8 = getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr;
  if (!getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr)
  {
    id v1 = (void *)VisionLibrary_8();
    v6[3] = (uint64_t)dlsym(v1, "VN6ZsEIQ9ri2eF1vhsxw5COm");
    getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    double v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;

  return v2;
}

void __getMADVISceneClassificationRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADVISceneClassificationRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADVISceneClassificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADVISceneClassificationRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary_0();
  }
}

void MediaAnalysisServicesLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MediaAnalysisServicesLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E61185A8;
    uint64_t v3 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_0)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getMADVISceneClassificationResultClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary_0();
  Class result = objc_getClass("MADVISceneClassificationResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADVISceneClassificationResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getMADVISceneClassificationResultClass_block_invoke_cold_1();
    return (Class)__getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_block_invoke_0(v3);
  }
  return result;
}

void *__getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_block_invoke_0(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  Class result = dlsym(v2, "VN81aedeb999c79d74e79af7f1c922cf97");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t VisionLibrary_8()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_15)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_15;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E61185C0;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_15 = _sl_dlopen();
  }
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_15;
  id v1 = (void *)v3[0];
  if (!VisionLibraryCore_frameworkLibrary_15)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __VisionLibraryCore_block_invoke_15()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_15 = result;
  return result;
}

void *__getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN3FNQUJVIs2puI1uPc9mxh7");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VNSY8t4EoTztuqIL02g8uVA0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN6XNMvaRunPpzWjGa9uUHD6");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN4QuphG8kE4qDaDycivBkX5");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN7gQUejje8mmnE9GSTsVBVV");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VNa9xpOJNvRoaW9plFGZ9Eo0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN2vIWnsZbk4Su55oeWfKDq1");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VNmNJnu0xlW8CZXt6hJ7Rpb0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN35FOB1QhtSfYGRIJvTgtTq");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)VisionLibrary_8();
  uint64_t result = dlsym(v2, "VN6ZsEIQ9ri2eF1vhsxw5COm");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B585ABC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585B0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585B198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585B484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585B560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585B900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getVNGenerateAttentionBasedSaliencyImageRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass;
  uint64_t v7 = getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass;
  if (!getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B585BC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_16)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_16;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E61185D8;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_16 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_16)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNGenerateAttentionBasedSaliencyImageRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNGenerateAttentionBasedSaliencyImageRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                             + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_16()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_16 = result;
  return result;
}

void sub_1B585C3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585C58C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585C7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585CAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B585CB90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585CC04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B585CC60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585CCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B585CD30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585CDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B585CE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B585CEDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5861A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58626B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5864E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void **std::vector<std::shared_ptr<espresso_buffer_t>>::push_back[abi:ne180100](uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v18[4] = result;
    size_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<espresso_buffer_t>>>((uint64_t)result, v13);
    uint64_t v15 = &v14[16 * v10];
    v18[0] = v14;
    v18[1] = v15;
    v18[3] = &v14[16 * v16];
    long long v17 = *a2;
    *(_OWORD *)uint64_t v15 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v18[2] = v15 + 16;
    std::vector<std::shared_ptr<espresso_buffer_t>>::__swap_out_circular_buffer(a1, v18);
    uint64_t v9 = (void *)a1[1];
    uint64_t result = std::__split_buffer<std::shared_ptr<espresso_buffer_t>>::~__split_buffer(v18);
  }
  else
  {
    *uint64_t v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    v7[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = v7 + 2;
    a1[1] = (uint64_t)(v7 + 2);
  }
  a1[1] = (uint64_t)v9;
  return result;
}

void sub_1B58653A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::shared_ptr<espresso_buffer_t>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

void sub_1B5865408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)AXShotflowNetwork;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1B5865780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5865858(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1B5865FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1B58665BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1B5866750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
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
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    unint64_t v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      CGAffineTransform v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  size_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  uint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    CGAffineTransform v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  void *v12 = &v9[v17];
  return result;
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<NSString * {__strong}>::__assign_with_size[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong}>(uint64_t a1, void **a2, void **a3, unint64_t a4)
{
  unint64_t v6 = a2;
  uint64_t v8 = *(id **)a1;
  if (a4 <= (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3)
  {
    unint64_t v14 = (uint64_t)(*(void *)(a1 + 8) - (void)v8) >> 3;
    if (v14 >= a4)
    {
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong},NSString * {__strong}*>((int)&v24, a2, a3, v8);
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)(a1 + 8);
      if (v21 != v19)
      {
        do
        {
          uint64_t v22 = *(void **)(v21 - 8);
          v21 -= 8;
        }
        while (v21 != v20);
      }
      *(void *)(a1 + 8) = v20;
    }
    else
    {
      unint64_t v15 = &a2[v14];
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong},NSString * {__strong}*>((int)&v23, a2, v15, v8);
      uint64_t v16 = *(void *)(a1 + 8);
      if (v15 != a3)
      {
        size_t v17 = *(void **)(a1 + 8);
        do
        {
          CGAffineTransform v18 = *v15++;
          *v17++ = v18;
          v16 += 8;
        }
        while (v15 != a3);
      }
      *(void *)(a1 + 8) = v16;
    }
  }
  else
  {
    std::vector<NSString * {__strong}>::__vdeallocate((void **)a1);
    if (a4 >> 61) {
      std::vector<BOOL>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = *(void *)(a1 + 16) - *(void *)a1;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<NSString * {__strong}>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t v12 = *(void **)(a1 + 8);
    while (v6 != a3)
    {
      unint64_t v13 = *v6++;
      *v12++ = v13;
    }
    *(void *)(a1 + 8) = v12;
  }
}

char *std::vector<NSString * {__strong}>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<BOOL>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void **std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<NSString * const {__strong}*,NSString * const {__strong},NSString * {__strong}*>(int a1, void **a2, void **a3, id *location)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      uint64_t v7 = *v5++;
      objc_storeStrong(location++, v7);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void std::__shared_ptr_emplace<espresso_buffer_t>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0E703D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<espresso_buffer_t>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F0E703D0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1BA9A0B70);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t std::vector<std::shared_ptr<espresso_buffer_t>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<espresso_buffer_t>>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<espresso_buffer_t>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::shared_ptr<espresso_buffer_t>>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = (_OWORD *)(a7 - 16);
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *uint64_t v8 = v9;
      *a3 = 0;
      a3[1] = 0;
      *((void *)&v15 + 1) = v8;
      v7 -= 16;
      --v8;
    }
    while (a3 != a5);
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<espresso_buffer_t>>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<espresso_buffer_t>>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<espresso_buffer_t>>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::shared_ptr<espresso_buffer_t>>,std::reverse_iterator<std::shared_ptr<espresso_buffer_t>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    v1 += 16;
  }
}

void **std::__split_buffer<std::shared_ptr<espresso_buffer_t>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::shared_ptr<espresso_buffer_t>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    uint64_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
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

void sub_1B5866FB4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::shared_ptr<espresso_buffer_t>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::shared_ptr<espresso_buffer_t>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::shared_ptr<espresso_buffer_t>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  a1[1] = v2;
}

id MLAllComputeDevicesSoft()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void (*)(void))getMLAllComputeDevicesSymbolLoc_ptr;
  uint64_t v8 = getMLAllComputeDevicesSymbolLoc_ptr;
  if (!getMLAllComputeDevicesSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getMLAllComputeDevicesSymbolLoc_block_invoke;
    v4[3] = &unk_1E6116AD8;
    v4[4] = &v5;
    __getMLAllComputeDevicesSymbolLoc_block_invoke((uint64_t)v4);
    uint64_t v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  uint64_t v1 = v0();

  return v1;
}

void sub_1B58678A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMLAllComputeDevicesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!CoreMLLibraryCore_frameworkLibrary_0)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __CoreMLLibraryCore_block_invoke_0;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E61187B0;
    uint64_t v7 = 0;
    CoreMLLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)CoreMLLibraryCore_frameworkLibrary_0;
    if (CoreMLLibraryCore_frameworkLibrary_0)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)CoreMLLibraryCore_frameworkLibrary_0;
LABEL_5:
  uint64_t result = dlsym(v2, "MLAllComputeDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMLAllComputeDevicesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreMLLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreMLLibraryCore_frameworkLibrary_0 = result;
  return result;
}

id getVNRecognizedTextClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNRecognizedTextClass_softClass;
  uint64_t v7 = getVNRecognizedTextClass_softClass;
  if (!getVNRecognizedTextClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNRecognizedTextClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNRecognizedTextClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B58683BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRecognizedTextClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_17)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_17;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E61187C8;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_17 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_17)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNRecognizedText");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getVNRecognizedTextClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNRecognizedTextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_17()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_17 = result;
  return result;
}

id getVCPMediaAnalyzerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVCPMediaAnalyzerClass_softClass;
  uint64_t v7 = getVCPMediaAnalyzerClass_softClass;
  if (!getVCPMediaAnalyzerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVCPMediaAnalyzerClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVCPMediaAnalyzerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B5868720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPHPhotoLibraryClass_0()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getPHPhotoLibraryClass_softClass_0;
  uint64_t v7 = getPHPhotoLibraryClass_softClass_0;
  if (!getPHPhotoLibraryClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke_0;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B58688E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58690C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVCPMediaAnalyzerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MediaAnalysisLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E61187E0;
    uint64_t v6 = 0;
    MediaAnalysisLibraryCore_frameworkLibrardouble y = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!MediaAnalysisLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VCPMediaAnalyzer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getVCPMediaAnalyzerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVCPMediaAnalyzerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaAnalysisLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisLibraryCore_frameworkLibrardouble y = result;
  return result;
}

void __getPHPhotoLibraryClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPHPhotoLibraryClass_block_invoke_cold_1_0();
    PhotosLibrary_0();
  }
}

void PhotosLibrary_0()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!PhotosLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __PhotosLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E61187F8;
    uint64_t v3 = 0;
    PhotosLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!PhotosLibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __PhotosLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  PhotosLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getPHPersonClass_block_invoke(uint64_t a1)
{
  PhotosLibrary_0();
  Class result = objc_getClass("PHPerson");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPHPersonClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getPHPersonClass_block_invoke_cold_1();
    return (Class)__getMKBGetDeviceLockStateSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __MobileKeyBagLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E6118810;
    uint64_t v7 = 0;
    MobileKeyBagLibraryCore_frameworkLibrardouble y = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    long long v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (MobileKeyBagLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  long long v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
LABEL_5:
  Class result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MobileKeyBagLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MobileKeyBagLibraryCore_frameworkLibrardouble y = result;
  return result;
}

void sub_1B586A3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNFaceLandmarks2DClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_18)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_18;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6118850;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_18 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_18)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNFaceLandmarks2D");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getVNFaceLandmarks2DClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNFaceLandmarks2DClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_18()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_18 = result;
  return result;
}

void sub_1B586EEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  _Block_object_dispose((const void *)(v9 - 208), 8);
  _Unwind_Resume(a1);
}

id getMADImageCaptionRequestClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMADImageCaptionRequestClass_softClass;
  uint64_t v7 = getMADImageCaptionRequestClass_softClass;
  if (!getMADImageCaptionRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getMADImageCaptionRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getMADImageCaptionRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B586F254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B58703C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1B5870624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MediaAnalysisLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!MediaAnalysisLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __MediaAnalysisLibraryCore_block_invoke_0;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E61188F0;
    uint64_t v5 = 0;
    MediaAnalysisLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = MediaAnalysisLibraryCore_frameworkLibrary_0;
  id v1 = (void *)v3[0];
  if (!MediaAnalysisLibraryCore_frameworkLibrary_0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MediaAnalysisLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void __getVCPMediaAnalysisServiceClass_block_invoke(uint64_t a1)
{
  MediaAnalysisLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VCPMediaAnalysisService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVCPMediaAnalysisServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = __getVCPMediaAnalysisServiceClass_block_invoke_cold_1();
    __getMADImageCaptionRequestClass_block_invoke(v2);
  }
}

void __getMADImageCaptionRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADImageCaptionRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADImageCaptionRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADImageCaptionRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary_1();
  }
}

void MediaAnalysisServicesLibrary_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_1)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MediaAnalysisServicesLibraryCore_block_invoke_1;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6118908;
    uint64_t v3 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_1)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void *__getMediaAnalysisResultAttributesKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultAttributesKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultAttributesKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultImageCaptionLowConfidenceAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultImageCaptionLowConfidenceAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultClassificationIdentifiersAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultClassificationIdentifiersAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

void *__getMediaAnalysisImageCaptionResultsKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisImageCaptionResultsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisImageCaptionResultsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultImageCaptionTextAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultImageCaptionTextAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_block_invoke(uint64_t a1)
{
  long long v2 = (void *)MediaAnalysisLibrary();
  uint64_t result = dlsym(v2, "MediaAnalysisResultImageCaptionConfidenceAttributeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMediaAnalysisResultImageCaptionConfidenceAttributeKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

void __getMADCaptionResultClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADCaptionResult");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADCaptionResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADCaptionResultClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_7();
  }
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1B5871258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

double _AXMTextFrameForNormalizedBoundingBox(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

void sub_1B5878818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B58791DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

void __getMADVIFaceRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MADVIFaceRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADVIFaceRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMADVIFaceRequestClass_block_invoke_cold_1();
    MediaAnalysisServicesLibrary_2();
  }
}

void MediaAnalysisServicesLibrary_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_2)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __MediaAnalysisServicesLibraryCore_block_invoke_2;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6118D70;
    uint64_t v3 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_2)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary_2 = result;
  return result;
}

Class __getMADVIFaceResultClass_block_invoke(uint64_t a1)
{
  MediaAnalysisServicesLibrary_2();
  Class result = objc_getClass("MADVIFaceResult");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMADVIFaceResultClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getMADVIFaceResultClass_block_invoke_cold_1();
    return (Class)+[AXMMADSService sharedInstance];
  }
  return result;
}

void sub_1B5879754(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getMADServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __MediaAnalysisServicesLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6118D88;
    uint64_t v6 = 0;
    MediaAnalysisServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!MediaAnalysisServicesLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MADService");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getMADServiceClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getMADServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaAnalysisServicesLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  MediaAnalysisServicesLibraryCore_frameworkLibrary_3 = result;
  return result;
}

double mean(double *a1, int a2)
{
  if (a2 < 1)
  {
    double v3 = 0.0;
  }
  else
  {
    uint64_t v2 = a2;
    double v3 = 0.0;
    do
    {
      double v4 = *a1++;
      double v3 = v3 + v4;
      --v2;
    }
    while (v2);
  }
  return v3 / (double)a2;
}

double min(double *a1, int a2)
{
  if (a2 < 1) {
    return 1.79769313e308;
  }
  uint64_t v2 = a2;
  double result = 1.79769313e308;
  do
  {
    double v4 = *a1++;
    double v5 = v4;
    if (v4 < result) {
      double result = v5;
    }
    --v2;
  }
  while (v2);
  return result;
}

double max(double *a1, int a2)
{
  if (a2 < 1) {
    return -1.79769313e308;
  }
  uint64_t v2 = a2;
  double result = -1.79769313e308;
  do
  {
    double v4 = *a1++;
    double v5 = v4;
    if (v4 > result) {
      double result = v5;
    }
    --v2;
  }
  while (v2);
  return result;
}

double covariance(double *a1, double *a2, int a3)
{
  if (a3 < 1)
  {
    double v14 = 0.0;
  }
  else
  {
    uint64_t v3 = a3;
    double v4 = 0.0;
    double v5 = a1;
    uint64_t v6 = a3;
    do
    {
      double v7 = *v5++;
      double v4 = v4 + v7;
      --v6;
    }
    while (v6);
    double v8 = (double)a3;
    double v9 = 0.0;
    uint64_t v10 = a2;
    uint64_t v11 = a3;
    do
    {
      double v12 = *v10++;
      double v9 = v9 + v12;
      --v11;
    }
    while (v11);
    double v13 = v4 / v8;
    double v14 = 0.0;
    double v15 = v9 / v8;
    do
    {
      double v16 = *a1++;
      double v17 = v16 - v13;
      double v18 = *a2++;
      double v14 = v14 + v17 * (v18 - v15);
      --v3;
    }
    while (v3);
  }
  return v14 / (double)(a3 - 1);
}

double variance(double *a1, int a2)
{
  if (a2 < 1)
  {
    double v8 = 0.0;
  }
  else
  {
    uint64_t v2 = a2;
    double v3 = 0.0;
    double v4 = a1;
    uint64_t v5 = a2;
    do
    {
      double v6 = *v4++;
      double v3 = v3 + v6;
      --v5;
    }
    while (v5);
    double v7 = v3 / (double)a2;
    double v8 = 0.0;
    do
    {
      double v9 = *a1++;
      double v8 = v8 + (v9 - v7) * (v9 - v7);
      --v2;
    }
    while (v2);
  }
  return v8 / (double)(a2 - 1);
}

double rsquared(double *a1, double *a2, int a3)
{
  double v6 = covariance(a1, a2, a3);
  double v7 = variance(a1, a3);
  double v8 = sqrt(v7 * variance(a2, a3));
  return v6 / v8 * (v6 / v8);
}

const char *CVML_getStatusDescription(unint64_t a1)
{
  uint64_t v1 = "Not supported error";
  switch(a1)
  {
    case 0x59u:
      return v1;
    case 0x5Au:
      uint64_t v1 = "General error";
      break;
    case 0x5Bu:
      uint64_t v1 = "Espresso error";
      break;
    case 0x5Cu:
      uint64_t v1 = "incorrect binserializer key";
      break;
    case 0x5Du:
      uint64_t v1 = "small sparsity error";
      break;
    case 0x5Eu:
      uint64_t v1 = "feature extraction error";
      break;
    case 0x5Fu:
      uint64_t v1 = "initialization error";
      break;
    case 0x60u:
      uint64_t v1 = "no saved state to revert";
      break;
    case 0x61u:
      uint64_t v1 = "nominal distance not changed";
      break;
    case 0x62u:
      uint64_t v1 = "batch size violation";
      break;
    case 0x63u:
      uint64_t v1 = "computation kill request was issued";
      break;
    case 0x64u:
      uint64_t v1 = "too few IDs to build VIP model";
      break;
    case 0x65u:
      uint64_t v1 = "video error";
      break;
    case 0x66u:
      uint64_t v1 = "error with projection computation";
      break;
    case 0x67u:
      uint64_t v1 = "missing positional parameter";
      break;
    case 0x68u:
      uint64_t v1 = "inconsistent state error";
      break;
    case 0x69u:
      uint64_t v1 = "warping error";
      break;
    case 0x6Au:
      uint64_t v1 = "OpenGL error";
      break;
    case 0x6Bu:
      uint64_t v1 = "invalid format";
      break;
    case 0x6Cu:
      uint64_t v1 = "out of bounds";
      break;
    case 0x6Du:
      uint64_t v1 = "singular point configuration error";
      break;
    case 0x6Eu:
      uint64_t v1 = "division by zero";
      break;
    case 0x6Fu:
      uint64_t v1 = "LAPACK error";
      break;
    case 0x70u:
      uint64_t v1 = "platform endianess not supported";
      break;
    case 0x71u:
      uint64_t v1 = "hash already in use";
      break;
    case 0x72u:
      uint64_t v1 = "invalid ID";
      break;
    case 0x73u:
      uint64_t v1 = "invalid data type";
      break;
    case 0x74u:
      uint64_t v1 = "data inconsistency error";
      break;
    case 0x75u:
      uint64_t v1 = "I/O error";
      break;
    case 0x76u:
      uint64_t v1 = "unknown option";
      break;
    case 0x77u:
      uint64_t v1 = "invalid option";
      break;
    case 0x78u:
      uint64_t v1 = "missing option";
      break;
    case 0x79u:
      uint64_t v1 = "delegate error";
      break;
    case 0x7Au:
      uint64_t v1 = "vImage related error";
      break;
    case 0x7Bu:
      uint64_t v1 = "memory allocation error";
      break;
    case 0x7Cu:
      uint64_t v1 = "invalid parameter";
      break;
    case 0x7Du:
      uint64_t v1 = "unexpected null pointer";
      break;
    case 0x7Eu:
      uint64_t v1 = "internal error";
      break;
    case 0x7Fu:
      uint64_t v1 = "not implemented error";
      break;
    case 0x80u:
      uint64_t v1 = "ok";
      break;
    default:
      uint64_t v1 = CVML_getStatusDescription_ourSharedDefaultStatusDescription;
      snprintf(CVML_getStatusDescription_ourSharedDefaultStatusDescription, 0x3FuLL, "CVML_status module %d error %lld", a1 >> 8, a1 - 128);
      break;
  }
  return v1;
}

const char *CVML_getModuleDescription(uint64_t a1)
{
  uint64_t v1 = a1 >> 8;
  uint64_t v2 = "BinSerializer";
  switch(a1 >> 8)
  {
    case 1:
      return v2;
    case 2:
      uint64_t v2 = "ERT";
      break;
    case 3:
      uint64_t v2 = "Face3D";
      break;
    case 4:
      uint64_t v2 = "FaceDescriptor";
      break;
    case 5:
      uint64_t v2 = "FaceFrontalizer";
      break;
    case 6:
      uint64_t v2 = "FaceWarper";
      break;
    case 7:
      uint64_t v2 = "Geometry2D";
      break;
    case 8:
      uint64_t v2 = "Geometry3D";
      break;
    case 9:
      uint64_t v2 = "ImageGrouping";
      break;
    case 10:
      uint64_t v2 = "ImageQuality";
      break;
    case 11:
      uint64_t v2 = "LandmarkDetector";
      break;
    case 12:
      uint64_t v2 = "MomentProcessor";
      break;
    case 13:
      uint64_t v2 = "FaceboxAligner";
      break;
    case 14:
      uint64_t v2 = "ImageDescriptor";
      break;
    case 15:
      uint64_t v2 = "ImageClassifier";
      break;
    case 16:
      uint64_t v2 = "ImageProcessing";
      break;
    case 17:
      uint64_t v2 = "VIPIdentification";
      break;
    case 18:
      uint64_t v2 = "ImageRegistration";
      break;
    case 19:
      uint64_t v2 = "SimilarityMatrix";
      break;
    case 20:
      uint64_t v2 = "Clustering";
      break;
    case 21:
      uint64_t v2 = "HumanDetector";
      break;
    case 22:
      uint64_t v2 = "FaceRegionMap";
      break;
    case 23:
      uint64_t v2 = "ObjectDetector";
      break;
    case 24:
      uint64_t v2 = "DML";
      break;
    case 25:
      uint64_t v2 = "SGD";
      break;
    case 26:
      uint64_t v2 = "ObjectTracker";
      break;
    case 27:
      uint64_t v2 = "SRCClassifier";
      break;
    case 28:
      uint64_t v2 = "Kmeans";
      break;
    case 29:
      uint64_t v2 = "SparseCoding";
      break;
    case 30:
      uint64_t v2 = "FaceID";
      break;
    case 31:
      uint64_t v2 = "BoostedClassifier";
      break;
    case 32:
      uint64_t v2 = "FaceSegmenter";
      break;
    case 33:
      uint64_t v2 = "ImageAnalyzer";
      break;
    case 34:
      uint64_t v2 = "FaceAttributes";
      break;
    case 35:
      uint64_t v2 = "FaceprintAndAttributes";
      break;
    case 36:
      uint64_t v2 = "FaceQuality";
      break;
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
LABEL_7:
      uint64_t v2 = CVML_getModuleDescription_ourSharedModuleNameString;
      snprintf(CVML_getModuleDescription_ourSharedModuleNameString, 0x1FuLL, "CVML Module %lld", a1 >> 8);
      break;
    case 64:
      uint64_t v2 = "Generic";
      break;
    case 65:
      uint64_t v2 = "ImageTools";
      break;
    case 66:
      uint64_t v2 = "VideoTools";
      break;
    case 67:
      uint64_t v2 = "ImageWarper";
      break;
    case 68:
      uint64_t v2 = "ThirdParty";
      break;
    case 69:
      uint64_t v2 = "BinSerializerProcessor";
      break;
    case 70:
      uint64_t v2 = "AppleNetParser";
      break;
    default:
      switch(v1)
      {
        case 128:
          uint64_t v2 = "FaceProcessorCLI";
          break;
        case 129:
          uint64_t v2 = "ImageClassifierCLI";
          break;
        case 130:
          uint64_t v2 = "MPCmdlineClientCLI";
          break;
        case 131:
          uint64_t v2 = "ClusteringCLI";
          break;
        case 132:
          uint64_t v2 = "ImageProcessorCLI";
          break;
        case 133:
          uint64_t v2 = "PhotosProcessorCLI";
          break;
        default:
          if (v1 != 192) {
            goto LABEL_7;
          }
          uint64_t v2 = "CVMLEngine";
          break;
      }
      break;
  }
  return v2;
}

void sub_1B587C9E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1B587CAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void sub_1B587CCE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B587CE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B587D014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B587D130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B587E3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCVNLPCaptionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  double result = dlsym(v2, "CVNLPCaptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CVNLPLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CVNLPLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __CVNLPLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6118DC0;
    uint64_t v5 = 0;
    CVNLPLibraryCore_frameworkLibrardouble y = _sl_dlopen();
  }
  uint64_t v0 = CVNLPLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!CVNLPLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __CVNLPLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CVNLPLibraryCore_frameworkLibrardouble y = result;
  return result;
}

void *__getCVNLPGeneratedCaptionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPGeneratedCaption");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPGeneratedCaptionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPGeneratedCaptionScoreSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPGeneratedCaptionScore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPGeneratedCaptionScoreSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPGeneratedCaptionConfidenceLow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPGeneratedCaptionConfidenceLowSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPImageClassificationIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPImageClassificationIdentifiers");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPImageClassificationIdentifiersSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionModelPathSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionModelPath");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionModelPathSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionLanguageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionLanguage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionLanguageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPBeamSearchSizeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPBeamSearchSize");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPBeamSearchSizeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionModelTypeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionModelType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionModelTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionModelTransformerSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionModelTransformer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionModelTransformerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionEnableGenderedCaptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionEnableGenderedCaptionsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionScaleMethodSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionScaleMethod");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionScaleMethodSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionHandlerCreateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionHandlerCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionHandlerCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionScaleMethodCGInterpolationNone");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionScaleMethodCGInterpolationNoneSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionScaleMethodCGInterpolationLow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionScaleMethodCGInterpolationLowSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionScaleMethodCGInterpolationMedium");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionScaleMethodCGInterpolationMediumSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionScaleMethodCGInterpolationHigh");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionScaleMethodCGInterpolationHighSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionScaleMethodvImageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionScaleMethodvImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionScaleMethodvImageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionCopyForCVPixelBuffer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionCopyForCVPixelBufferSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getCVNLPCaptionCopyForImageSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CVNLPLibrary();
  uint64_t result = dlsym(v2, "CVNLPCaptionCopyForImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCVNLPCaptionCopyForImageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id getVNSceneClassificationRequestClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVNSceneClassificationRequestClass_softClass;
  uint64_t v7 = getVNSceneClassificationRequestClass_softClass;
  if (!getVNSceneClassificationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVNSceneClassificationRequestClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVNSceneClassificationRequestClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B587F6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNSceneClassificationRequestClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_19)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_19;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6118DD8;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_19 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_19)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("VNSceneClassificationRequest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getVNSceneClassificationRequestClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNSceneClassificationRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_19()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_19 = result;
  return result;
}

void sub_1B588278C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B5882A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getVN6Mb1ME89lyW3HpahkEygIGClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getVN6Mb1ME89lyW3HpahkEygIGClass_softClass;
  uint64_t v7 = getVN6Mb1ME89lyW3HpahkEygIGClass_softClass;
  if (!getVN6Mb1ME89lyW3HpahkEygIGClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke;
    v3[3] = &unk_1E6116AD8;
    v3[4] = &v4;
    __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1B5882CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVN2vIWnsZbk4Su55oeWfKDq1_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0;
  uint64_t v8 = getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0;
  if (!getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0)
  {
    id v1 = (void *)VisionLibrary_9();
    v6[3] = (uint64_t)dlsym(v1, "VN2vIWnsZbk4Su55oeWfKDq1");
    getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getVNmNJnu0xlW8CZXt6hJ7Rpb0_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0;
  uint64_t v8 = getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0;
  if (!getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0)
  {
    id v1 = (void *)VisionLibrary_9();
    v6[3] = (uint64_t)dlsym(v1, "VNmNJnu0xlW8CZXt6hJ7Rpb0");
    getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getVN35FOB1QhtSfYGRIJvTgtTq_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0;
  uint64_t v8 = getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0;
  if (!getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0)
  {
    id v1 = (void *)VisionLibrary_9();
    v6[3] = (uint64_t)dlsym(v1, "VN35FOB1QhtSfYGRIJvTgtTq");
    getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

id getVN6ZsEIQ9ri2eF1vhsxw5COm_0()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0;
  uint64_t v8 = getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0;
  if (!getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0)
  {
    id v1 = (void *)VisionLibrary_9();
    v6[3] = (uint64_t)dlsym(v1, "VN6ZsEIQ9ri2eF1vhsxw5COm");
    getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0 = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;

  return v2;
}

Class __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke(uint64_t a1)
{
  VisionLibrary_9();
  Class result = objc_getClass("VN6Mb1ME89lyW3HpahkEygIG");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVN6Mb1ME89lyW3HpahkEygIGClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke_cold_1();
    return (Class)VisionLibrary_9();
  }
  return result;
}

uint64_t VisionLibrary_9()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_20)
  {
    v3[1] = MEMORY[0x1E4F143A8];
    v3[2] = 3221225472;
    v3[3] = __VisionLibraryCore_block_invoke_20;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E6118E38;
    uint64_t v5 = 0;
    VisionLibraryCore_frameworkLibrary_20 = _sl_dlopen();
  }
  uint64_t v0 = VisionLibraryCore_frameworkLibrary_20;
  id v1 = (void *)v3[0];
  if (!VisionLibraryCore_frameworkLibrary_20)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __VisionLibraryCore_block_invoke_20()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_20 = result;
  return result;
}

void *__getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN3FNQUJVIs2puI1uPc9mxh7");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VNSY8t4EoTztuqIL02g8uVA0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN6XNMvaRunPpzWjGa9uUHD6");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN4QuphG8kE4qDaDycivBkX5");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN7gQUejje8mmnE9GSTsVBVV");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VNa9xpOJNvRoaW9plFGZ9Eo0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN2vIWnsZbk4Su55oeWfKDq1");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN2vIWnsZbk4Su55oeWfKDq1SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VNmNJnu0xlW8CZXt6hJ7Rpb0");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVNmNJnu0xlW8CZXt6hJ7Rpb0SymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN35FOB1QhtSfYGRIJvTgtTq");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN35FOB1QhtSfYGRIJvTgtTqSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_block_invoke_0(uint64_t a1)
{
  uint64_t v2 = (void *)VisionLibrary_9();
  uint64_t result = dlsym(v2, "VN6ZsEIQ9ri2eF1vhsxw5COm");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getVN6ZsEIQ9ri2eF1vhsxw5COmSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXMHasInternalSecurityPrivilages()
{
  if (AXMHasInternalSecurityPrivilages_onceToken != -1) {
    dispatch_once(&AXMHasInternalSecurityPrivilages_onceToken, &__block_literal_global_38);
  }
  return AXMHasInternalSecurityPrivilages__IsInternal;
}

uint64_t __AXMHasInternalSecurityPrivilages_block_invoke()
{
  [AXMBundleID UTF8String];
  uint64_t result = os_variant_allows_internal_security_policies();
  AXMHasInternalSecurityPrivilages__IsInternal = result;
  return result;
}

id AXMWorkingDirectory(int a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  double v3 = NSHomeDirectory();
  long long v4 = [v2 fileURLWithPath:v3];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"Library/Accessibility"];

  if (a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = [v5 path];
    char v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

    if ((v8 & 1) == 0)
    {
      double v9 = [v5 path];
      id v13 = 0;
      [v6 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v13];
      id v10 = v13;

      if (v10)
      {
        uint64_t v11 = AXMediaLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          AXMWorkingDirectory_cold_1((uint64_t)v5, (uint64_t)v10, v11);
        }
      }
    }
  }

  return v5;
}

id AXMDescription(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F28E78];
  id v2 = a1;
  double v3 = [v1 string];
  [v2 axmAppendRecursiveDescription:v3 withIndentation:0];

  return v3;
}

id _AXMMakeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (objc_class *)NSString;
  id v11 = a2;
  double v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  id v13 = AXMMakeError_(a1, v12);

  return v13;
}

id AXMMakeError_(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a2;
  long long v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a2;
  uint64_t v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = [v3 errorWithDomain:@"AXMediaUtilities" code:a1 userInfo:v6];

  return v7;
}

BOOL AXMFloatApproxEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

BOOL AXMFloatWithin(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) < a3;
}

uint64_t AXMStringFromCGRect(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.1f,%.1f,%.1f,%.1f", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

uint64_t AXMStringFromNormalizedCGRect(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"%.2f,%.2f,%.2f,%.2f", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4];
}

uint64_t AXMStringFromCGSize(double a1, double a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.1f,%.1f", *(void *)&a1, *(void *)&a2);
}

uint64_t AXMStringFromCGPoint(double a1, double a2)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%.1f,%.1f", *(void *)&a1, *(void *)&a2);
}

__n64 AXMCGRectFromCGPoints(unint64_t *a1, uint64_t a2)
{
  if (a2)
  {
    result.n64_u64[0] = *a1;
    unint64_t v3 = a1[1];
    uint64_t v4 = 0;
    if (a2 >= 2)
    {
      uint64_t v5 = a2 - 1;
      uint64_t v6 = (CGFloat *)(a1 + 3);
      uint64_t v7 = 0;
      do
      {
        v8.origin.double x = *(v6 - 1);
        v8.origin.double y = *v6;
        v8.size.double width = 0.0;
        v8.size.double height = 0.0;
        *(CGRect *)result.n64_u64 = CGRectUnion(*(CGRect *)result.n64_u64, v8);
        v6 += 2;
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    return *(__n64 *)MEMORY[0x1E4F1DB28];
  }
  return result;
}

BOOL AXMSizeWithin(double a1, double a2, double a3, double a4, double a5)
{
  BOOL v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL AXMRectApproxEqual(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) < 0.001
      && vabdd_f64(a2, a6) < 0.001
      && vabdd_f64(a3, a7) < 0.001
      && vabdd_f64(a4, a8) < 0.001;
}

double AXMPointDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double AXMRectCenter(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.double x = a1;
  v10.origin.double y = a2;
  v10.size.double width = a3;
  v10.size.double height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double AXMRectDistance(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v21.origin.double x = a1;
  v21.origin.double y = a2;
  v21.size.double width = a3;
  v21.size.double height = a4;
  double MidY = CGRectGetMidY(v21);
  v22.origin.double x = a5;
  v22.origin.double y = a6;
  v22.size.double width = a7;
  v22.size.double height = a8;
  double v17 = CGRectGetMidX(v22);
  v23.origin.double x = a5;
  v23.origin.double y = a6;
  v23.size.double width = a7;
  v23.size.double height = a8;
  CGFloat v18 = CGRectGetMidY(v23);
  return sqrt((MidY - v18) * (MidY - v18) + (MidX - v17) * (MidX - v17));
}

uint64_t AXMEXIFOrientationForDeviceOrientationAndCameraPosition(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return 1;
  }
  if ((unint64_t)(a1 - 1) > 3) {
    return 6;
  }
  return dword_1B58AD510[a1 - 1];
}

id __AXMStringForVariables(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  uint64_t v9 = __AXMStringForVariablesWithVariadics(a1, &a9);

  return v9;
}

id __AXMStringForVariablesWithVariadics(void *a1, id *a2)
{
  id v3 = a1;
  id v11 = a2;
  objc_opt_class();
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    [v4 appendString:v3];
  }
  while (1)
  {
    BOOL v5 = v11++;
    id v6 = *v5;
    if (!v6 || (objc_opt_isKindOfClass() & 1) == 0 || ![v6 length]) {
      goto LABEL_12;
    }
    if ([v6 isEqualToString:@"__AXMStringForVariablesSentinel"]) {
      break;
    }
    uint64_t v7 = NSString;
    if ([v4 length]) {
      CGRect v8 = @", %@";
    }
    else {
      CGRect v8 = @"%@";
    }
    uint64_t v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);
    [v4 appendString:v9];

LABEL_12:
  }

  return v4;
}

id AXMLabelForNSStringElements(void *a1, int a2, int a3)
{
  id v3 = a1;
  uint64_t v4 = [v3 count];
  BOOL v5 = [MEMORY[0x1E4F28E78] string];
  if (v4)
  {
    id v6 = [v3 firstObject];
    [v5 appendString:v6];

    uint64_t v7 = v4 - 1;
    if (v4 != 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v4 - 2;
      CGRect v10 = @" %@";
      uint64_t v22 = v7;
      while (1)
      {
        id v11 = [v3 objectAtIndex:v8 + 1];
        if (!v8)
        {
          if (a2) {
            break;
          }
        }
        if (v9 != v8 || !a3)
        {
          [NSString stringWithFormat:@", %@", v11];
          goto LABEL_11;
        }
        [v5 appendString:@" "];
        id v12 = v3;
        uint64_t v13 = v9;
        double v14 = v10;
        double v15 = NSString;
        double v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
        double v17 = [v16 localizedStringForKey:@"last.string.to.append.in.a.sentence" value:&stru_1F0E72D10 table:@"Accessibility"];
        CGFloat v18 = objc_msgSend(v15, "stringWithFormat:", v17, v11);
        [v5 appendString:v18];

        CGRect v10 = v14;
        uint64_t v9 = v13;
        id v3 = v12;
        uint64_t v7 = v22;

LABEL_12:
        if (v7 == ++v8) {
          goto LABEL_13;
        }
      }
      objc_msgSend(NSString, "stringWithFormat:", v10, v11);
      double v16 = LABEL_11:;
      [v5 appendString:v16];
      goto LABEL_12;
    }
LABEL_13:
    id v19 = v5;
  }
  else
  {
    id v19 = [NSString string];
  }
  uint64_t v20 = v19;

  return v20;
}

id _AXMCachedDateFormatterForFormat(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  CGRect v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__14;
  uint64_t v13 = __Block_byref_object_dispose__14;
  id v14 = 0;
  if (_AXMCachedDateFormatterForFormat_onceToken != -1) {
    dispatch_once(&_AXMCachedDateFormatterForFormat_onceToken, &__block_literal_global_80);
  }
  id v2 = _AXMCachedDateFormatterForFormat_AXDateFormatterQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___AXMCachedDateFormatterForFormat_block_invoke_2;
  v6[3] = &unk_1E6116EC0;
  id v7 = v1;
  uint64_t v8 = &v9;
  id v3 = v1;
  dispatch_sync(v2, v6);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

id AXMDateStringForFormat(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = _AXMCachedDateFormatterForFormat(a2);
  BOOL v5 = [v4 stringFromDate:v3];

  return v5;
}

id AXMFormatNumber(void *a1)
{
  uint64_t v1 = AXMFormatNumber__AXNumberFormatterOnceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AXMFormatNumber__AXNumberFormatterOnceToken, &__block_literal_global_88);
  }
  id v3 = [(id)AXMFormatNumber__AXNumberFormatter stringFromNumber:v2];

  return v3;
}

void __AXMFormatNumber_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)AXMFormatNumber__AXNumberFormatter;
  AXMFormatNumber__AXNumberFormatter = (uint64_t)v0;
}

id AXMFormatInteger(uint64_t a1)
{
  uint64_t v1 = [NSNumber numberWithInteger:a1];
  id v2 = AXMFormatNumber(v1);

  return v2;
}

double AXMClampDouble(double result, double a2, double a3)
{
  if (result >= a3) {
    __n64 result = a3;
  }
  if (result > a3) {
    return a3;
  }
  return result;
}

uint64_t _AXMTaskHasEntitlement(uint64_t a1, uint64_t a2)
{
  id v2 = (*(void (**)(uint64_t))(a2 + 16))(a2);
  id v3 = v2;
  if (v2 && (CFTypeID v4 = CFGetTypeID(v2), v4 == CFBooleanGetTypeID())) {
    uint64_t v5 = [v3 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t AXMSelfTaskHasEntitlement(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __AXMSelfTaskHasEntitlement_block_invoke;
  v5[3] = &unk_1E6118EC0;
  id v6 = v1;
  id v2 = v1;
  uint64_t HasEntitlement = _AXMTaskHasEntitlement((uint64_t)v2, (uint64_t)v5);

  return HasEntitlement;
}

id __AXMSelfTaskHasEntitlement_block_invoke(uint64_t a1)
{
  return _AXMCopyValueForEntitlementUsingTaskCreationBlock(*(void **)(a1 + 32), (uint64_t)&__block_literal_global_130);
}

uint64_t AXMCopyValueForEntitlementFromSelf(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t AXMAuditTokenTaskHasEntitlement(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AXMAuditTokenTaskHasEntitlement_block_invoke;
  v7[3] = &unk_1E6118EE8;
  id v8 = v3;
  uint64_t v9 = a1;
  id v4 = v3;
  uint64_t HasEntitlement = _AXMTaskHasEntitlement((uint64_t)v4, (uint64_t)v7);

  return HasEntitlement;
}

id __AXMAuditTokenTaskHasEntitlement_block_invoke(uint64_t a1)
{
  id v1 = (void *)AXMCopyValueForEntitlementFromAuditTokenTask(*(void *)(a1 + 40), *(void **)(a1 + 32));

  return v1;
}

uint64_t AXMCopyValueForEntitlementFromAuditTokenTask(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __AXMCopyValueForEntitlementFromAuditTokenTask_block_invoke;
  v3[3] = &__block_descriptor_40_e17_____SecTask__8__0l;
  v3[4] = a1;
  _AXMCopyValueForEntitlementUsingTaskCreationBlock(a2, (uint64_t)v3);
  return objc_claimAutoreleasedReturnValue();
}

id _AXMCopyValueForEntitlementUsingTaskCreationBlock(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = (__SecTask *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if (v4)
  {
    uint64_t v5 = v4;
    CFErrorRef error = 0;
    id v6 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (error)
    {
      id v7 = AXMediaLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_2((uint64_t *)&error, v7);
      }

      CFRelease(error);
    }
    CFRelease(v5);
  }
  else
  {
    id v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_1((uint64_t)v3, v8);
    }

    id v6 = 0;
  }

  return v6;
}

SecTaskRef __AXMCopyValueForEntitlementFromSelf_block_invoke()
{
  return SecTaskCreateFromSelf(0);
}

SecTaskRef __AXMCopyValueForEntitlementFromAuditTokenTask_block_invoke(uint64_t a1)
{
  id v1 = *(_OWORD **)(a1 + 32);
  long long v2 = v1[1];
  *(_OWORD *)v4.val = *v1;
  *(_OWORD *)&v4.val[4] = v2;
  return SecTaskCreateWithAuditToken(0, &v4);
}

id MLMultiArray.subscript.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_1B589FCD8();
    audit_token_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v5);
      sub_1B589FCB8();
      sub_1B589FCE8();
      sub_1B589FCF8();
      sub_1B589FCC8();
      --v2;
    }
    while (v2);
  }
  sub_1B58990B4(0, &qword_1E9D60B00);
  id v6 = (void *)sub_1B589FB88();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v6);

  return v7;
}

Swift::Float __swiftcall MLMultiArray.floatValue(_:)(Swift::OpaquePointer a1)
{
  id v1 = MLMultiArray.subscript.getter((uint64_t)a1._rawValue);
  objc_msgSend(v1, sel_floatValue);
  float v3 = v2;

  return v3;
}

id AXBoundingBox.__allocating_init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, float a5, float a6, double a7, double a8, double a9, double a10)
{
  id v21 = objc_allocWithZone(v10);
  return AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

id AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, float a5, float a6, double a7, double a8, double a9, double a10)
{
  id v21 = &v10[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id];
  uint64_t v22 = v10;
  sub_1B589FA78();
  CGRect v23 = (float *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat];
  *(_DWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat] = 0;
  char v24 = (float *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle];
  *(_DWORD *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle] = 0;
  uint64_t v25 = &v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth];
  *(_DWORD *)uint64_t v25 = 0;
  v25[4] = 1;
  uint64_t v26 = &v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d];
  *(void *)uint64_t v26 = 0;
  *((void *)v26 + 1) = 0;
  v26[16] = 1;
  *(void *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints] = 0;
  uint64_t v27 = &v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize];
  *(void *)uint64_t v27 = 0;
  v27[8] = 1;
  swift_beginAccess();
  uint64_t v28 = sub_1B589FA88();
  uint64_t v29 = *(void *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 24))(v21, a1, v28);
  swift_endAccess();
  swift_beginAccess();
  *CGRect v23 = a5;
  swift_beginAccess();
  *char v24 = a6;
  CGFloat v30 = (double *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
  *CGFloat v30 = a7;
  v30[1] = a8;
  v30[2] = a9;
  v30[3] = a10;
  *(void *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex] = a2;
  *(void *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass] = a3;
  *(double *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen] = a4;
  *(double *)&v22[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen] = a4;

  v33.receiver = v22;
  v33.super_class = (Class)type metadata accessor for AXBoundingBox();
  id v31 = objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a1, v28);
  return v31;
}

uint64_t type metadata accessor for AXBoundingBox()
{
  uint64_t result = qword_1E9D60DB0;
  if (!qword_1E9D60DB0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1B5889688@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  uint64_t v4 = sub_1B589FA88();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_1B5889710(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1B589FA88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_1B588982C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  uint64_t v4 = sub_1B589FA88();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1B58898B0(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  uint64_t v4 = sub_1B589FA88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1B588993C())()
{
  return j_j__swift_endAccess;
}

float sub_1B5889998@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (float *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  float result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_1B58899EC(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5889B50(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
}

float sub_1B58899F8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_1B5889A40(float a1)
{
  uint64_t v3 = (float *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_1B5889A94())()
{
  return j_j__swift_endAccess;
}

float sub_1B5889AF0@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (float *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  float result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_1B5889B44(int *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B5889B50(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
}

uint64_t sub_1B5889B50(int *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  int v5 = *a1;
  uint64_t v6 = (_DWORD *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

float sub_1B5889BA4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_1B5889BEC(float a1)
{
  uint64_t v3 = (float *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_1B5889C40())()
{
  return j_j__swift_endAccess;
}

void sub_1B5889C9C(void *a1@<X0>, CGFloat *a2@<X8>)
{
  uint64_t v3 = (CGRect *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  CGFloat MidX = CGRectGetMidX(*v3);
  CGFloat MidY = CGRectGetMidY(*v3);
  *a2 = MidX;
  a2[1] = MidY;
}

float64x2_t sub_1B5889D10(float64x2_t *a1, void *a2)
{
  uint64_t v3 = (float64x2_t *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  __asm { FMOV            V2.2D, #-0.5 }
  float64x2_t result = vaddq_f64(*a1, vmulq_f64(v3[1], _Q2));
  *uint64_t v3 = result;
  return result;
}

double sub_1B5889D74()
{
  uint64_t v1 = (CGRect *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  double MidX = CGRectGetMidX(*v1);
  CGRectGetMidY(*v1);
  return MidX;
}

float64x2_t sub_1B5889DE4(float64_t a1, float64_t a2)
{
  uint64_t v3 = (float64x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  __asm { FMOV            V1.2D, #-0.5 }
  v9.f64[0] = a1;
  v9.f64[1] = a2;
  float64x2_t result = vaddq_f64(v9, vmulq_f64(v3[1], _Q1));
  *uint64_t v3 = result;
  return result;
}

void (*sub_1B5889E48(CGFloat **a1))(uint64_t *a1)
{
  uint64_t v3 = (CGFloat *)malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  *((void *)v3 + 5) = v1;
  *((void *)v3 + 6) = v4;
  int v5 = (CGRect *)(v1 + v4);
  swift_beginAccess();
  CGFloat MidX = CGRectGetMidX(*v5);
  CGFloat MidY = CGRectGetMidY(*v5);
  v3[3] = MidX;
  v3[4] = MidY;
  return sub_1B5889EE8;
}

void sub_1B5889EE8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (float64x2_t *)(*(void *)(v1 + 40) + *(void *)(v1 + 48));
  __asm { FMOV            V2.2D, #-0.5 }
  float64x2_t *v2 = vaddq_f64(*(float64x2_t *)(v1 + 24), vmulq_f64(v2[1], _Q2));
  free((void *)v1);
}

__n128 sub_1B5889F10@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  __n128 result = v3[1];
  *a2 = result;
  return result;
}

uint64_t sub_1B5889F64(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  uint64_t result = swift_beginAccess();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  return result;
}

double sub_1B5889FBC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  return *(double *)(v1 + 16);
}

uint64_t sub_1B588A004(double a1, double a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  uint64_t result = swift_beginAccess();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return result;
}

void (*sub_1B588A05C(void *a1))(uint64_t *a1)
{
  uint64_t v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  *((void *)v3 + 5) = v1;
  *((void *)v3 + 6) = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v5 + 16);
  return sub_1B588A0DC;
}

void sub_1B588A0DC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  *(_OWORD *)(*(void *)(v1 + 40) + *(void *)(v1 + 48) + 16) = *(_OWORD *)(v1 + 24);
  free((void *)v1);
}

__n128 sub_1B588A0F4@<Q0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  __n128 result = *(__n128 *)v3;
  long long v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

__n128 sub_1B588A148(__n128 *a1, void *a2)
{
  __n128 v6 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  uint64_t v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  __n128 result = v6;
  *(__n128 *)uint64_t v4 = v6;
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  return result;
}

double sub_1B588A1B0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1B588A1FC(double a1, double a2, double a3, double a4)
{
  float64x2_t v9 = (double *)(v4 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  uint64_t result = swift_beginAccess();
  *float64x2_t v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t (*sub_1B588A268())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B588A2C4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1B588A318(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = v2;
  return result;
}

uint64_t sub_1B588A368()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B588A3B0(uint64_t a1)
{
  unint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = a1;
  return result;
}

uint64_t (*sub_1B588A3FC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B588A458@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B588A4B0(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  *unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B588A51C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B588A568(uint64_t a1)
{
  unint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B588A5BC())()
{
  return j_j__swift_endAccess;
}

double sub_1B588A618@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (double *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_1B588A66C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B588A7D0(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
}

double sub_1B588A678()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1B588A6C0(double a1)
{
  unint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = a1;
  return result;
}

uint64_t (*sub_1B588A714())()
{
  return j_j__swift_endAccess;
}

double sub_1B588A770@<D0>(void *a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (double *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  swift_beginAccess();
  double result = *v3;
  *a2 = *(void *)v3;
  return result;
}

uint64_t sub_1B588A7C4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1B588A7D0(a1, a2, a3, a4, &OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
}

uint64_t sub_1B588A7D0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  __n128 v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *__n128 v6 = v5;
  return result;
}

double sub_1B588A824()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1B588A86C(double a1)
{
  unint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  uint64_t result = swift_beginAccess();
  *unint64_t v3 = a1;
  return result;
}

uint64_t (*sub_1B588A8C0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B588A91C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  uint64_t result = swift_beginAccess();
  char v5 = *(unsigned char *)(v3 + 4);
  *(_DWORD *)a2 = *(_DWORD *)v3;
  *(unsigned char *)(a2 + 4) = v5;
  return result;
}

uint64_t sub_1B588A978(int *a1, void *a2)
{
  int v2 = *a1;
  char v3 = *((unsigned char *)a1 + 4);
  uint64_t v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v4 = v2;
  *(unsigned char *)(v4 + 4) = v3;
  return result;
}

unint64_t sub_1B588A9D8()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth);
  swift_beginAccess();
  return *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32);
}

uint64_t sub_1B588AA30(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  uint64_t result = swift_beginAccess();
  *(_DWORD *)uint64_t v3 = a1;
  *(unsigned char *)(v3 + 4) = BYTE4(a1) & 1;
  return result;
}

uint64_t (*sub_1B588AA84())()
{
  return j_j__swift_endAccess;
}

__n128 sub_1B588AAE0@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d);
  swift_beginAccess();
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_1B588AB3C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  char v4 = *((unsigned char *)a1 + 16);
  uint64_t v5 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = v3;
  *(unsigned char *)(v5 + 16) = v4;
  return result;
}

uint64_t sub_1B588AB9C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B588ABE8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v7 = a1;
  *(void *)(v7 + 8) = a2;
  *(unsigned char *)(v7 + 16) = a3 & 1;
  return result;
}

uint64_t (*sub_1B588AC4C())()
{
  return j__swift_endAccess;
}

uint64_t sub_1B588ACAC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B588AD04(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1B588AD70()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1B588ADBC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1B588AE10())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1B588AE6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  uint64_t result = swift_beginAccess();
  char v5 = *(unsigned char *)(v3 + 8);
  *(void *)a2 = *(void *)v3;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_1B588AEC8(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  uint64_t v4 = *a2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v4 = v2;
  *(unsigned char *)(v4 + 8) = v3;
  return result;
}

uint64_t sub_1B588AF28()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_1B588AF74(uint64_t a1, char a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize;
  uint64_t result = swift_beginAccess();
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_1B588AFD4())()
{
  return j_j__swift_endAccess;
}

uint64_t Array<A>.argmax()(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v1 = sub_1B589FBE8();
  uint64_t WitnessTable = swift_getWitnessTable();
  MEMORY[0x1BA99FB00](&v4, v1, WitnessTable);
  sub_1B589FD48();
  swift_getWitnessTable();
  sub_1B589FB68();
  swift_bridgeObjectRelease();
  return v5;
}

AXMediaUtilities::UIType_optional __swiftcall UIType.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 14;
  if ((unint64_t)rawValue < 0xE) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (AXMediaUtilities::UIType_optional)rawValue;
}

double CGRect.init(centerX:y:width:height:)(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

AXMediaUtilities::UITypeClickability_optional __swiftcall UITypeClickability.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 17;
  if ((unint64_t)rawValue < 0x11) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (AXMediaUtilities::UITypeClickability_optional)rawValue;
}

uint64_t static AXBoundingBox.nonMaximalSuppression(boxes:maxBoxes:)(unint64_t a1, uint64_t a2, char a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = 0;
  unint64_t v33 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_52;
  }
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      while (1)
      {
        if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
        {
          swift_bridgeObjectRetain_n();
          uint64_t v5 = (uint64_t)sub_1B589035C(v3);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
        }
        unint64_t v31 = v5;
        sub_1B58902E0((uint64_t *)&v31);
        if (v4)
        {
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
        swift_bridgeObjectRelease_n();
        unint64_t v6 = v31;
        int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        uint64_t v32 = v6;
        if (!isUniquelyReferenced_nonNull_bridgeObject
          || (v6 & 0x8000000000000000) != 0
          || (v6 & 0x4000000000000000) != 0)
        {
          sub_1B5890454(v6);
          unint64_t v6 = v8;
          uint64_t v32 = v8;
        }
        unint64_t v3 = v6 & 0xFFFFFFFFFFFFFF8;
        uint64_t v9 = *(void *)(v3 + 16);
        if (v9) {
          break;
        }
LABEL_51:
        __break(1u);
LABEL_52:
        swift_bridgeObjectRetain();
        uint64_t v26 = sub_1B589FD58();
        swift_bridgeObjectRelease();
        if (v26 <= 0) {
          goto LABEL_55;
        }
        swift_bridgeObjectRetain();
        if (sub_1B589FD58() < 1)
        {
          swift_bridgeObjectRelease();
          return MEMORY[0x1E4FBC860];
        }
      }
      uint64_t v10 = v9 - 1;
      id v12 = *(void **)(v3 + 32);
      unint64_t v11 = v3 + 32;
      memmove((void *)v11, (const void *)(v11 + 8), 8 * (v9 - 1));
      *(void *)(v11 - 16) = v10;
      sub_1B589FBA8();
      uint64_t v13 = v12;
      unint64_t v3 = (unint64_t)&v33;
      MEMORY[0x1BA99FB20]();
      if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1B589FBB8();
      }
      sub_1B589FBD8();
      sub_1B589FBA8();
      uint64_t v14 = v32;
      unint64_t v31 = MEMORY[0x1E4FBC860];
      if ((unint64_t)v32 >> 62)
      {
        if (v32 < 0) {
          unint64_t v3 = v32;
        }
        else {
          unint64_t v3 = v32 & 0xFFFFFFFFFFFFFF8;
        }
        char v24 = v13;
        swift_bridgeObjectRetain();
        uint64_t v15 = sub_1B589FD58();
      }
      else
      {
        uint64_t v15 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
        double v16 = v13;
        swift_bridgeObjectRetain();
      }
      double v17 = (CGRect *)&v13[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
      swift_beginAccess();
      if (v15)
      {
        CGFloat v30 = v13;
        unint64_t v18 = 0;
        uint64_t v4 = v14 & 0xFFFFFFFFFFFFFF8;
        while (1)
        {
          if ((v14 & 0xC000000000000001) != 0)
          {
            id v19 = (id)MEMORY[0x1BA99FC40](v18, v14);
          }
          else
          {
            if (v18 >= *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_50;
            }
            id v19 = *(id *)(v14 + 8 * v18 + 32);
          }
          uint64_t v20 = v19;
          unint64_t v21 = v18 + 1;
          if (__OFADD__(v18, 1)) {
            break;
          }
          unint64_t v3 = (unint64_t)v19 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
          swift_beginAccess();
          if (CGRectIntersectsRect(*(CGRect *)v3, *v17))
          {
            *double v17 = CGRectUnion(*v17, *(CGRect *)v3);
          }
          else
          {
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            unint64_t v3 = (unint64_t)&v31;
            sub_1B589FCC8();
          }
          ++v18;
          if (v21 == v15)
          {
            unint64_t v3 = v31;
            uint64_t v13 = v30;
            uint64_t v4 = 0;
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      unint64_t v3 = MEMORY[0x1E4FBC860];
LABEL_30:
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if (a3)
      {
      }
      else
      {
        unint64_t v22 = v33;
        if (v33 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v23 = sub_1B589FD58();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v23 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }

        if (v23 == a2)
        {
          swift_release();
          return v22;
        }
      }
      if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_1B589FD58();
        swift_release();
        if (v25 <= 0)
        {
LABEL_48:
          swift_release();
          return v33;
        }
      }
      else if (*(uint64_t *)(v3 + 16) <= 0)
      {
        goto LABEL_48;
      }
    }
  }
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  return v3;
}

void sub_1B588B608(uint64_t a1)
{
  unint64_t v3 = (CGRect *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  CGFloat x = v3->origin.x;
  CGFloat y = v3->origin.y;
  CGFloat width = v3->size.width;
  CGFloat height = v3->size.height;
  unint64_t v8 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRect v19 = CGRectUnion(v18, *v8);
  CGFloat v9 = v19.origin.x;
  CGFloat v10 = v19.origin.y;
  CGFloat v11 = v19.size.width;
  CGFloat v12 = v19.size.height;
  double v13 = CGRectGetHeight(v19);
  v20.origin.CGFloat x = v9;
  v20.origin.CGFloat y = v10;
  v20.size.CGFloat width = v11;
  v20.size.CGFloat height = v12;
  if (sqrt(v13 * CGRectGetWidth(v20)) != 0.0)
  {
    CGRect v21 = CGRectIntersection(*v3, *v8);
    CGFloat v14 = v21.origin.x;
    CGFloat v15 = v21.origin.y;
    CGFloat v16 = v21.size.width;
    CGFloat v17 = v21.size.height;
    CGRectGetHeight(v21);
    v22.origin.CGFloat x = v14;
    v22.origin.CGFloat y = v15;
    v22.size.CGFloat width = v16;
    v22.size.CGFloat height = v17;
    CGRectGetWidth(v22);
  }
}

AXMediaUtilities::UIType_optional sub_1B588B7A8()
{
  uint64_t v1 = v0;
  char v2 = (Swift::Int *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  result.value = UIType.init(rawValue:)(*v2).value;
  if (v16 == 14)
  {
    __break(1u);
  }
  else
  {
    sub_1B589FC78();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B08);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_1B58AD520;
    uint64_t v5 = (int *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
    swift_beginAccess();
    int v6 = *v5;
    uint64_t v7 = MEMORY[0x1E4FBB4D0];
    *(void *)(v4 + 56) = MEMORY[0x1E4FBB470];
    *(void *)(v4 + 64) = v7;
    *(_DWORD *)(v4 + 32) = v6;
    sub_1B589FB28();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    sub_1B589FB38();
    sub_1B589FB48();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1B58AD530;
    uint64_t v9 = v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect;
    swift_beginAccess();
    CGFloat MidX = CGRectGetMidX(*(CGRect *)v9);
    CGRectGetMidY(*(CGRect *)v9);
    uint64_t v11 = MEMORY[0x1E4FBC958];
    *(void *)(v8 + 56) = MEMORY[0x1E4FBC958];
    unint64_t v12 = sub_1B5894708();
    *(void *)(v8 + 64) = v12;
    *(CGFloat *)(v8 + 32) = MidX;
    CGRectGetMidX(*(CGRect *)v9);
    CGFloat MidY = CGRectGetMidY(*(CGRect *)v9);
    *(void *)(v8 + 96) = v11;
    *(void *)(v8 + 104) = v12;
    *(CGFloat *)(v8 + 72) = MidY;
    sub_1B589FB28();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1B58AD530;
    *(void *)(v14 + 56) = v11;
    *(void *)(v14 + 64) = v12;
    uint64_t v15 = *(void *)(v9 + 24);
    *(void *)(v14 + 32) = *(void *)(v9 + 16);
    *(void *)(v14 + 96) = v11;
    *(void *)(v14 + 104) = v12;
    *(void *)(v14 + 72) = v15;
    sub_1B589FB28();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    swift_bridgeObjectRelease();
    sub_1B589FB48();
    return (AXMediaUtilities::UIType_optional)60;
  }
  return result;
}

double static AXBoundingBox.enlarge(rect:by:)(double a1, double a2, double a3, double a4, double a5)
{
  return a1 - (a3 * a5 - a3) * 0.5;
}

float64x2_t sub_1B588BB34(float64_t a1, float64_t a2)
{
  unint64_t v3 = (float64x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  v4.f64[0] = a1;
  v4.f64[1] = a2;
  float64x2_t result = vmulq_f64(*v3, v4);
  float64x2_t v6 = vmulq_f64(v3[1], v4);
  *unint64_t v3 = result;
  v3[1] = v6;
  return result;
}

void sub_1B588BB94()
{
  uint64_t v1 = (CGRect *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  CGFloat x = v1->origin.x;
  CGFloat y = v1->origin.y;
  v6.size.CGFloat width = v1->size.width;
  v6.size.CGFloat height = v1->size.height;
  v6.origin.CGFloat x = v1->origin.x;
  v6.origin.CGFloat y = y;
  CGFloat Height = CGRectGetHeight(v6);
  CGFloat Width = CGRectGetWidth(*v1);
  v1->origin.CGFloat x = y;
  v1->origin.CGFloat y = x;
  v1->size.CGFloat width = Height;
  v1->size.CGFloat height = Width;
}

float64x2_t sub_1B588BC14()
{
  uint64_t v1 = (float64x2_t *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  float64x2_t v2 = v1[1];
  double v3 = v1[1].f64[1];
  if (v2.f64[0] > v3) {
    double v3 = v1[1].f64[0];
  }
  __asm { FMOV            V3.2D, #-0.5 }
  float64x2_t result = vaddq_f64(*v1, vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v3, 0), v2), _Q3));
  *uint64_t v1 = result;
  v1[1].f64[0] = v3;
  v1[1].f64[1] = v3;
  return result;
}

char *sub_1B588BC84(CGFloat *a1)
{
  uint64_t v2 = v1;
  CGFloat v3 = *a1;
  CGFloat v4 = a1[1];
  CGFloat v5 = a1[2];
  CGFloat v6 = a1[3];
  CGFloat v8 = a1[4];
  CGFloat v7 = a1[5];
  uint64_t v9 = sub_1B589FA88();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  unint64_t v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v13 = (double *)(v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  double v15 = *v13;
  double v14 = v13[1];
  double v16 = v13[3];
  double v60 = v13[2];
  CGFloat v64 = v14 + v16;
  uint64_t v66 = MEMORY[0x1E4FBC860];
  sub_1B588FD8C(0, 4, 0);
  uint64_t v17 = v66;
  CGFloat v62 = v3;
  CGFloat v63 = v8;
  v67.a = v3;
  v67.b = v4;
  CGFloat v18 = v4;
  CGFloat v19 = v5;
  v67.c = v5;
  v67.d = v6;
  CGFloat v20 = v6;
  v67.tCGFloat x = v8;
  v67.tCGFloat y = v7;
  CGFloat v65 = v7;
  v68.CGFloat x = v15;
  CGFloat v61 = v14;
  v68.CGFloat y = v14;
  CGPoint v21 = CGPointApplyAffineTransform(v68, &v67);
  unint64_t v23 = *(void *)(v17 + 16);
  unint64_t v22 = *(void *)(v17 + 24);
  if (v23 >= v22 >> 1)
  {
    sub_1B588FD8C((char *)(v22 > 1), v23 + 1, 1);
    uint64_t v17 = v66;
  }
  double v24 = v15 + v60;
  *(void *)(v17 + 16) = v23 + 1;
  *(CGPoint *)(v17 + 16 * v23 + 32) = v21;
  CGFloat v26 = v62;
  CGFloat v25 = v63;
  v67.a = v62;
  v67.b = v18;
  v67.c = v19;
  v67.d = v20;
  v69.CGFloat y = v64;
  v67.tCGFloat x = v63;
  v67.tCGFloat y = v65;
  v69.CGFloat x = v15;
  CGPoint v27 = CGPointApplyAffineTransform(v69, &v67);
  unint64_t v29 = *(void *)(v17 + 16);
  unint64_t v28 = *(void *)(v17 + 24);
  if (v29 >= v28 >> 1)
  {
    sub_1B588FD8C((char *)(v28 > 1), v29 + 1, 1);
    uint64_t v17 = v66;
  }
  *(void *)(v17 + 16) = v29 + 1;
  *(CGPoint *)(v17 + 16 * v29 + 32) = v27;
  v67.a = v26;
  v67.b = v18;
  v67.c = v19;
  v67.d = v20;
  CGFloat v30 = v65;
  v67.tCGFloat x = v25;
  v67.tCGFloat y = v65;
  v70.CGFloat x = v24;
  v70.CGFloat y = v61;
  CGPoint v31 = CGPointApplyAffineTransform(v70, &v67);
  CGFloat v32 = v24;
  unint64_t v34 = *(void *)(v17 + 16);
  unint64_t v33 = *(void *)(v17 + 24);
  unint64_t v35 = v34 + 1;
  if (v34 >= v33 >> 1)
  {
    CGFloat v61 = v24;
    sub_1B588FD8C((char *)(v33 > 1), v34 + 1, 1);
    CGFloat v32 = v61;
  }
  uint64_t v36 = v66;
  *(void *)(v66 + 16) = v35;
  *(CGPoint *)(v36 + 16 * v34 + 32) = v31;
  v67.a = v26;
  v67.b = v18;
  v67.c = v19;
  v67.d = v20;
  v67.tCGFloat x = v25;
  v67.tCGFloat y = v30;
  v71.CGFloat x = v32;
  v71.CGFloat y = v64;
  CGPoint v37 = CGPointApplyAffineTransform(v71, &v67);
  unint64_t v38 = *(void *)(v36 + 24);
  int64_t v39 = v34 + 2;
  if (v35 >= v38 >> 1)
  {
    sub_1B588FD8C((char *)(v38 > 1), v39, 1);
    uint64_t v36 = v66;
  }
  *(void *)(v36 + 16) = v39;
  *(CGPoint *)(v36 + 16 * v35 + 32) = v37;
  uint64_t v40 = (double *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  swift_beginAccess();
  uint64_t v41 = (char *)_s16AXMediaUtilities13AXBoundingBoxC9timestamp10containing4heatACSd_SaySo7CGPointVGSftcfC_0(v36, *v40, 0.0);
  uint64_t v42 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v42, v9);
  CGRect v43 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v43, v12, v9);
  swift_endAccess();
  uint64_t v44 = (int *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  int v45 = *v44;
  uint64_t v46 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat];
  swift_beginAccess();
  *(_DWORD *)uint64_t v46 = v45;
  uint64_t v47 = (int *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  int v48 = *v47;
  uint64_t v49 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle];
  swift_beginAccess();
  *(_DWORD *)uint64_t v49 = v48;
  uint64_t v50 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  uint64_t v51 = *v50;
  uint64_t v52 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
  swift_beginAccess();
  *(void *)uint64_t v52 = v51;
  uint64_t v53 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  swift_beginAccess();
  uint64_t v54 = *v53;
  uint64_t v55 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass];
  swift_beginAccess();
  *(void *)uint64_t v55 = v54;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v56 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen);
  swift_beginAccess();
  uint64_t v57 = *v56;
  uint64_t v58 = &v41[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen];
  swift_beginAccess();
  *(void *)uint64_t v58 = v57;
  return v41;
}

uint64_t sub_1B588C1A0(uint64_t a1, float a2)
{
  CGFloat v4 = (CGRect *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  double MidX = CGRectGetMidX(*v4);
  CGRectGetMidY(*v4);
  CGFloat v6 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  double v7 = CGRectGetMidX(*v6);
  CGRectGetMidY(*v6);
  float v49 = 1.0 - a2;
  double v8 = (float)(1.0 - a2);
  double v9 = MidX * v8 + v7 * a2;
  CGRectGetMidX(*v4);
  double MidY = CGRectGetMidY(*v4);
  CGRectGetMidX(*v6);
  double v11 = MidY * v8 + CGRectGetMidY(*v6) * a2;
  CGFloat v12 = v4->size.width * v8 + v6->size.width * a2;
  CGFloat v13 = v4->size.height * v8 + v6->size.height * a2;
  double v14 = (float *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  float v15 = *v14;
  double v16 = (float *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle);
  swift_beginAccess();
  float v17 = (float)((float)(1.0 - a2) * v15) + (float)(*v16 * a2);
  v4->origin.CGFloat x = v9 - v12 * 0.5;
  v4->origin.CGFloat y = v11 - v13 * 0.5;
  v4->size.CGFloat width = v12;
  v4->size.CGFloat height = v13;
  *double v14 = v17;
  uint64_t v18 = a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass;
  swift_beginAccess();
  uint64_t v19 = *(void *)(*(void *)v18 + 16);
  CGFloat v20 = (uint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
  uint64_t v21 = swift_beginAccess();
  if (v19 == *(void *)(*v20 + 16))
  {
    MEMORY[0x1F4188790](v21);
    uint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v23 = sub_1B58947F0(v22, (float (*)(uint64_t, float))sub_1B589475C);
    swift_bridgeObjectRelease();
    *CGFloat v20 = v23;
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = *v20;
    unint64_t v26 = *(void *)(v25 + 16);
    if (v26)
    {
      unint64_t v27 = 0;
      unint64_t v28 = 0;
      while (v28 < v26)
      {
        if (*(float *)(v25 + 32 + 4 * v28) < *(float *)(v25 + 32 + 4 * v27)) {
          unint64_t v28 = v27;
        }
        if (v26 == ++v27) {
          goto LABEL_10;
        }
      }
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    unint64_t v28 = 0;
LABEL_10:
    unint64_t v29 = (unint64_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
    uint64_t result = swift_beginAccess();
    *unint64_t v29 = v28;
    if ((v28 & 0x8000000000000000) != 0) {
      goto LABEL_26;
    }
    if (v28 >= *(void *)(v25 + 16))
    {
LABEL_27:
      __break(1u);
      return result;
    }
    int v30 = *(_DWORD *)(v25 + 4 * v28 + 32);
    CGPoint v31 = (_DWORD *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
    swift_beginAccess();
    *CGPoint v31 = v30;
  }
  uint64_t v32 = a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
  swift_beginAccess();
  if ((*(unsigned char *)(v32 + 4) & 1) == 0)
  {
    float v33 = *(float *)v32;
    uint64_t v34 = v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
    swift_beginAccess();
    if (*(unsigned char *)(v34 + 4)) {
      float v35 = v33;
    }
    else {
      float v35 = (float)(v33 * a2) + (float)(v49 * *(float *)v34);
    }
    *(float *)uint64_t v34 = v35;
    *(unsigned char *)(v34 + 4) = 0;
  }
  uint64_t v36 = (float32x2_t *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize);
  swift_beginAccess();
  if ((v36[1].i8[0] & 1) == 0)
  {
    float32x2_t v37 = *v36;
    unint64_t v38 = (float32x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize);
    swift_beginAccess();
    if ((v38[1].i8[0] & 1) == 0)
    {
      float32x2_t *v38 = vadd_f32(vmul_n_f32(v37, a2), vmul_n_f32(*v38, v49));
      v38[1].i8[0] = 0;
    }
  }
  uint64_t v39 = a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d;
  swift_beginAccess();
  if ((*(unsigned char *)(v39 + 16) & 1) == 0)
  {
    float32x2_t v40 = *(float32x2_t *)v39;
    unint64_t v41 = *(void *)(v39 + 8);
    uint64_t v42 = (float32x2_t *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d);
    swift_beginAccess();
    if ((v42[2].i8[0] & 1) == 0)
    {
      CGRect v43 = (const double *)&v42[1];
      float32x4_t v44 = (float32x4_t)vld1q_dup_f64(v43);
      *(float32x2_t *)&long long v45 = vadd_f32(vmul_n_f32(v40, a2), vmul_n_f32(*v42, v49));
      *((float *)&v45 + 2) = vmuls_lane_f32(a2, (float32x4_t)vdupq_n_s64(v41), 2) + vmuls_lane_f32(v49, v44, 2);
      HIDWORD(v45) = 0;
      *(_OWORD *)v42->f32 = v45;
      v42[2].i8[0] = 0;
    }
  }
  uint64_t v46 = (uint64_t *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  swift_beginAccess();
  uint64_t v47 = *v46;
  int v48 = (void *)(v2 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen);
  uint64_t result = swift_beginAccess();
  *int v48 = v47;
  return result;
}

uint64_t BinaryFloatingPoint.ema<A>(to:amount:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v33 = a2;
  uint64_t v37 = a5;
  uint64_t v38 = a6;
  uint64_t v34 = a1;
  uint64_t v35 = a7;
  uint64_t v32 = *(void *)(*(void *)(*(void *)(a6 + 16) + 16) + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v11 = *(void *)(a4 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  double v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x1F4188790](v12);
  float v17 = (char *)&v30 - v16;
  uint64_t v18 = *(void *)(a3 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v15);
  CGPoint v31 = (char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v23 = (char *)&v30 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v36 = (char *)&v30 - v24;
  swift_getAssociatedConformanceWitness();
  sub_1B589FEB8();
  sub_1B589FE98();
  uint64_t v25 = v33;
  sub_1B589FD38();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, a4);
  sub_1B589FAD8();
  sub_1B589FC28();
  unint64_t v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  v26(v23, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v17, v25, a4);
  unint64_t v27 = v31;
  sub_1B589FAD8();
  sub_1B589FC28();
  v26(v27, a3);
  unint64_t v28 = v36;
  sub_1B589FD28();
  v26(v23, a3);
  return ((uint64_t (*)(char *, uint64_t))v26)(v28, a3);
}

void *static UIType.allCases.getter()
{
  return &unk_1F0E70120;
}

BOOL sub_1B588CA60(unsigned __int8 a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  int v3 = a1;
  sub_1B589FF08();
  sub_1B589FF18();
  uint64_t v4 = sub_1B589FF28();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(unsigned __int8 *)(v8 + v6) == v3) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    int v12 = *(unsigned __int8 *)(v8 + v11);
    BOOL result = v12 == v3;
    if (v12 == v3) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t AXMElementDetectorResult.__allocating_init(boundingBox:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = sub_1B5894904((uint64_t)a1);

  return v4;
}

void *static UITypeClickability.allCases.getter()
{
  return &unk_1F0E6FF38;
}

uint64_t AXMClickabilityDetectorResult.__allocating_init(boundingBox:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t v4 = sub_1B5895B10((uint64_t)a1);

  return v4;
}

id sub_1B588CC38(float a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(float), void (*a7)(uint64_t))
{
  sub_1B58990B4(0, &qword_1E9D60B00);
  sub_1B589FB98();
  id v11 = a4;
  a6(a1);

  uint64_t v12 = swift_bridgeObjectRelease();
  a7(v12);
  uint64_t v13 = (void *)sub_1B589FB88();
  swift_bridgeObjectRelease();

  return v13;
}

id AXBoundingBox.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void AXBoundingBox.init()()
{
}

unint64_t sub_1B588CD90(char a1)
{
  unint64_t result = 25705;
  switch(a1)
  {
    case 1:
      unint64_t result = 1952540008;
      break;
    case 2:
      unint64_t result = 0x656C676E61;
      break;
    case 3:
      unint64_t result = 1952671090;
      break;
    case 4:
      unint64_t result = 0x646E497373616C63;
      break;
    case 5:
      unint64_t result = 0x6C43794274616568;
      break;
    case 6:
      unint64_t result = 0x6565537473726966;
      break;
    case 7:
      unint64_t result = 0x6E6565537473616CLL;
      break;
    case 8:
      unint64_t result = 0x6874706564;
      break;
    case 9:
      unint64_t result = 0x64696F72746E6563;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    case 11:
      unint64_t result = 0x6C61636973796870;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_1B588CF00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B588CF18()
{
  return sub_1B589FF18();
}

unint64_t sub_1B588CF48()
{
  return sub_1B588CD90(*v0);
}

uint64_t sub_1B588CF50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B5898A18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1B588CF78()
{
  return 0;
}

void sub_1B588CF84(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_1B588CF90(uint64_t a1)
{
  unint64_t v2 = sub_1B5896B50();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B588CFCC(uint64_t a1)
{
  unint64_t v2 = sub_1B5896B50();

  return MEMORY[0x1F41862B0](a1, v2);
}

id AXBoundingBox.__deallocating_deinit()
{
  return sub_1B588F584(0, type metadata accessor for AXBoundingBox);
}

uint64_t sub_1B588D0B4(void *a1)
{
  uint64_t v2 = sub_1B589FA88();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B18);
  uint64_t v28 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B5896B50();
  sub_1B589FF48();
  uint64_t v9 = v42 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  LOBYTE(v40) = 0;
  sub_1B5896BB8(&qword_1E9D60B20, MEMORY[0x1E4F27990]);
  uint64_t v10 = v8;
  uint64_t v11 = v27;
  sub_1B589FE68();
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v8, v6);
  }
  else
  {
    uint64_t v13 = v28;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    uint64_t v14 = v42;
    swift_beginAccess();
    LOBYTE(v40) = 1;
    sub_1B589FE48();
    swift_beginAccess();
    LOBYTE(v40) = 2;
    sub_1B589FE48();
    uint64_t v15 = (long long *)(v14 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
    swift_beginAccess();
    long long v16 = v15[1];
    long long v40 = *v15;
    long long v41 = v16;
    char v39 = 3;
    type metadata accessor for CGRect(0);
    sub_1B5896BB8(&qword_1E9D60B28, type metadata accessor for CGRect);
    sub_1B589FE68();
    swift_beginAccess();
    char v39 = 4;
    sub_1B589FE58();
    float v17 = (uint64_t *)(v42 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass);
    swift_beginAccess();
    uint64_t v38 = *v17;
    char v37 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B30);
    sub_1B5896C00(&qword_1E9D60B38);
    sub_1B589FE68();
    uint64_t v18 = v42;
    swift_beginAccess();
    char v37 = 6;
    sub_1B589FE38();
    swift_beginAccess();
    char v36 = 7;
    sub_1B589FE38();
    uint64_t v19 = v18 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth;
    swift_beginAccess();
    char v20 = *(unsigned char *)(v19 + 4);
    char v35 = 8;
    LOBYTE(v33) = v20;
    sub_1B589FE08();
    uint64_t v21 = (long long *)(v18 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d);
    swift_beginAccess();
    char v22 = *((unsigned char *)v21 + 16);
    long long v33 = *v21;
    char v34 = v22;
    LOBYTE(v32) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B40);
    sub_1B58990F0(&qword_1E9D60B48, &qword_1E9D60B40);
    uint64_t v27 = v6;
    sub_1B589FE18();
    uint64_t v23 = (uint64_t *)(v42 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints);
    swift_beginAccess();
    uint64_t v32 = *v23;
    LOBYTE(v30) = 10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B50);
    sub_1B5896C64(&qword_1E9D60B58, &qword_1E9D60B48);
    sub_1B589FE18();
    uint64_t v24 = (uint64_t *)(v42 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize);
    swift_beginAccess();
    char v25 = *((unsigned char *)v24 + 8);
    uint64_t v30 = *v24;
    char v31 = v25;
    char v29 = 11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B60);
    sub_1B58990F0(&qword_1E9D60B68, &qword_1E9D60B60);
    uint64_t v26 = v27;
    sub_1B589FE18();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v10, v26);
  }
}

void *AXBoundingBox.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AXBoundingBox.init(from:)(a1);
}

void *AXBoundingBox.init(from:)(void *a1)
{
  uint64_t v55 = sub_1B589FA88();
  uint64_t v59 = *(void *)(v55 - 8);
  MEMORY[0x1F4188790](v55);
  uint64_t v51 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B70);
  uint64_t v53 = *(void *)(v52 - 8);
  MEMORY[0x1F4188790](v52);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &v1[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id];
  uint64_t v7 = v1;
  uint64_t v58 = v6;
  sub_1B589FA78();
  uint64_t v50 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat];
  *(_DWORD *)&v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat] = 0;
  uint64_t v8 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle];
  *(_DWORD *)&v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_angle] = 0;
  uint64_t v9 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_depth];
  *(_DWORD *)uint64_t v9 = 0;
  v9[4] = 1;
  uint64_t v10 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_centroid3d];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v57 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints];
  *(void *)&v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_knownFeaturePoints] = 0;
  double v60 = v7;
  uint64_t v11 = &v7[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_physicalSize];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = a1[3];
  uint64_t v56 = a1;
  uint64_t v13 = __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1B5896B50();
  uint64_t v14 = v54;
  sub_1B589FF38();
  if (v14)
  {
    uint64_t v15 = v55;
    uint64_t v20 = v59;
    uint64_t v21 = v58;
    char v22 = v60;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v15);

    swift_bridgeObjectRelease();
    type metadata accessor for AXBoundingBox();
    swift_deallocPartialClassInstance();
  }
  else
  {
    long long v16 = v50;
    uint64_t v54 = v8;
    float v49 = v9;
    int v48 = v10;
    uint64_t v47 = v11;
    uint64_t v17 = v53;
    LOBYTE(v69) = 0;
    sub_1B5896BB8(&qword_1E9D60B78, MEMORY[0x1E4F27990]);
    uint64_t v18 = v51;
    uint64_t v19 = v55;
    sub_1B589FDF8();
    uint64_t v24 = v58;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v59 + 40))(v24, v18, v19);
    swift_endAccess();
    LOBYTE(v69) = 1;
    uint64_t v51 = v5;
    sub_1B589FDD8();
    char v25 = v60;
    int v27 = v26;
    swift_beginAccess();
    *(_DWORD *)long long v16 = v27;
    LOBYTE(v69) = 2;
    sub_1B589FDD8();
    int v29 = v28;
    uint64_t v30 = v54;
    swift_beginAccess();
    *(_DWORD *)uint64_t v30 = v29;
    type metadata accessor for CGRect(0);
    char v68 = 3;
    sub_1B5896BB8(&qword_1E9D60B80, type metadata accessor for CGRect);
    sub_1B589FDF8();
    char v31 = &v25[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
    *(_OWORD *)char v31 = v69;
    *((_OWORD *)v31 + 1) = v70;
    LOBYTE(v69) = 4;
    *(void *)&v25[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex] = sub_1B589FDE8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B30);
    char v68 = 5;
    sub_1B5896C00(&qword_1E9D60B88);
    sub_1B589FDF8();
    *(void *)&v25[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass] = v69;
    LOBYTE(v69) = 6;
    sub_1B589FDC8();
    *(void *)&v25[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_firstSeen] = v32;
    LOBYTE(v69) = 7;
    sub_1B589FDC8();
    *(void *)&v25[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_lastSeen] = v33;
    LOBYTE(v69) = 8;
    uint64_t v34 = sub_1B589FD98();
    char v35 = v49;
    swift_beginAccess();
    *(_DWORD *)char v35 = v34;
    v35[4] = BYTE4(v34) & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B40);
    char v68 = 9;
    sub_1B58990F0(&qword_1E9D60B90, &qword_1E9D60B40);
    sub_1B589FDA8();
    uint64_t v37 = v65;
    uint64_t v36 = v66;
    char v38 = v67;
    char v39 = v48;
    swift_beginAccess();
    *(void *)char v39 = v37;
    *((void *)v39 + 1) = v36;
    v39[16] = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B50);
    LOBYTE(v65) = 10;
    sub_1B5896C64(&qword_1E9D60B98, &qword_1E9D60B90);
    sub_1B589FDA8();
    uint64_t v40 = v62;
    long long v41 = v57;
    swift_beginAccess();
    *(void *)long long v41 = v40;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60B60);
    LOBYTE(v62) = 11;
    sub_1B58990F0(&qword_1E9D60BA0, &qword_1E9D60B60);
    sub_1B589FDA8();
    uint64_t v42 = v63;
    LOBYTE(v41) = v64;
    CGRect v43 = v47;
    swift_beginAccess();
    *(void *)CGRect v43 = v42;
    v43[8] = (char)v41;
    float32x4_t v44 = v60;

    long long v45 = (objc_class *)type metadata accessor for AXBoundingBox();
    v61.receiver = v44;
    v61.super_class = v45;
    uint64_t v13 = objc_msgSendSuper2(&v61, sel_init);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v51, v52);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v56);
  }
  return v13;
}

uint64_t sub_1B588E2BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_id;
  swift_beginAccess();
  uint64_t v4 = sub_1B589FA88();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1B588E344@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1B588FBB8(a1, 0, (uint64_t (*)(uint64_t))type metadata accessor for AXBoundingBox, (uint64_t (*)(uint64_t))AXBoundingBox.init(from:), a2);
}

uint64_t sub_1B588E388(void *a1)
{
  return sub_1B588D0B4(a1);
}

uint64_t sub_1B588E3AC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, void *a4@<X8>)
{
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v9 = MEMORY[0x1F4188790](TupleTypeMetadata2 - 8);
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  long long v16 = (char *)&v27 - v15;
  uint64_t v17 = *a1;
  uint64_t v18 = *(int *)(v14 + 56);
  uint64_t v20 = v19 + v18;
  uint64_t v21 = (char *)a2 + v18;
  uint64_t v22 = *a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v19 + v18, v21, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v16, v20, a3);
  sub_1B589FBF8();
  char v23 = sub_1B589FAF8();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v13, a3);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v16, a3);
  if (v23) {
    uint64_t v26 = v22;
  }
  else {
    uint64_t v26 = v17;
  }
  *a4 = v26;
  return result;
}

uint64_t BinaryFloatingPoint.clip(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B589FEC8();
  sub_1B589FB08();
  sub_1B589FED8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t BinaryFloatingPoint.lerp(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v16[0] = a2;
  v16[1] = a4;
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v6);
  uint64_t v11 = (char *)v16 - v10;
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)v16 - v12;
  sub_1B589FD38();
  sub_1B589FB08();
  sub_1B589FD38();
  sub_1B589FAE8();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, a3);
  v14(v11, a3);
  sub_1B589FD38();
  sub_1B589FC28();
  v14(v8, a3);
  sub_1B589FD28();
  v14(v11, a3);
  return ((uint64_t (*)(char *, uint64_t))v14)(v13, a3);
}

uint64_t BinaryFloatingPoint.clerp(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  BinaryFloatingPoint.lerp(from:to:)(v6, v9, v10, (uint64_t)v8);
  BinaryFloatingPoint.clip(to:)(a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, a3);
}

void sub_1B588E9D0(void *a1@<X8>)
{
  *a1 = &unk_1F0E70120;
}

AXMediaUtilities::UIType_optional sub_1B588E9E0(Swift::Int *a1)
{
  return UIType.init(rawValue:)(*a1);
}

uint64_t UITypeClickability.rawValue.getter()
{
  return *v0;
}

uint64_t sub_1B588E9F0()
{
  return sub_1B589FF28();
}

uint64_t sub_1B588EA38()
{
  return sub_1B589FF28();
}

void sub_1B588EA7C(void *a1@<X8>)
{
  *a1 = &unk_1F0E6FF38;
}

AXMediaUtilities::UITypeClickability_optional sub_1B588EA8C(Swift::Int *a1)
{
  return UITypeClickability.init(rawValue:)(*a1);
}

void sub_1B588EA94(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t AXMElementDetectorResult.init(boundingBox:)(void *a1)
{
  uint64_t v2 = sub_1B5894904((uint64_t)a1);

  return v2;
}

double sub_1B588EAD0()
{
  return sub_1B588F37C(&OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box);
}

uint64_t sub_1B588EAE8()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label);
}

uint64_t sub_1B588EB08()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_labelName);
  swift_bridgeObjectRetain();
  return v1;
}

double sub_1B588EB50()
{
  return *(double *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence);
}

void AXMElementDetectorResult.init()()
{
}

uint64_t sub_1B588EBD0()
{
  uint64_t result = 7892834;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6C6562616CLL;
      break;
    case 2:
      uint64_t result = 0x6D614E6C6562616CLL;
      break;
    case 3:
      uint64_t result = 0x6E656469666E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1B588EC5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1B5898EF8(a1, a2);
  *a3 = result;
  return result;
}

void sub_1B588EC84(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1B588EC90(uint64_t a1)
{
  unint64_t v2 = sub_1B5896D10();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B588ECCC(uint64_t a1)
{
  unint64_t v2 = sub_1B5896D10();

  return MEMORY[0x1F41862B0](a1, v2);
}

id AXMElementDetectorResult.__deallocating_deinit(uint64_t a1)
{
  return sub_1B588F584(a1, type metadata accessor for AXMElementDetectorResult);
}

uint64_t sub_1B588ED34(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60BC8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B5896D10();
  sub_1B589FF48();
  long long v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box + 16);
  long long v12 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box);
  long long v13 = v9;
  v11[15] = 0;
  type metadata accessor for CGRect(0);
  sub_1B5896BB8(&qword_1E9D60B28, type metadata accessor for CGRect);
  sub_1B589FE68();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_1B589FE58();
    LOBYTE(v12) = 2;
    sub_1B589FE28();
    LOBYTE(v12) = 3;
    sub_1B589FE38();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

char *AXMElementDetectorResult.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AXMElementDetectorResult.init(from:)(a1);
}

char *AXMElementDetectorResult.init(from:)(void *a1)
{
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60BD0);
  uint64_t v4 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v22 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1B5896D10();
  uint64_t v8 = v1;
  uint64_t v20 = v6;
  sub_1B589FF38();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);

    type metadata accessor for AXMElementDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v9 = v4;
    type metadata accessor for CGRect(0);
    char v26 = 0;
    sub_1B5896BB8(&qword_1E9D60B80, type metadata accessor for CGRect);
    uint64_t v10 = v21;
    uint64_t v11 = v20;
    sub_1B589FDF8();
    long long v12 = &v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box];
    *(_OWORD *)long long v12 = v24;
    *((_OWORD *)v12 + 1) = v25;
    LOBYTE(v24) = 1;
    *(void *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label] = sub_1B589FDE8();
    LOBYTE(v24) = 2;
    uint64_t v13 = sub_1B589FDB8();
    uint64_t v15 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_labelName];
    *uint64_t v15 = v13;
    v15[1] = v16;
    LOBYTE(v24) = 3;
    sub_1B589FDC8();
    *(void *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence] = v17;

    uint64_t v18 = (objc_class *)type metadata accessor for AXMElementDetectorResult();
    v23.receiver = v8;
    v23.super_class = v18;
    uint64_t v8 = (char *)objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  return v8;
}

uint64_t sub_1B588F29C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AXMElementDetectorResult();
  uint64_t result = sub_1B589FC88();
  *a1 = result;
  return result;
}

uint64_t sub_1B588F2DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  return sub_1B588FBB8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AXMElementDetectorResult, (uint64_t (*)(uint64_t))AXMElementDetectorResult.init(from:), a3);
}

uint64_t sub_1B588F31C(void *a1)
{
  return sub_1B588ED34(a1);
}

uint64_t AXMClickabilityDetectorResult.init(boundingBox:)(void *a1)
{
  uint64_t v2 = sub_1B5895B10((uint64_t)a1);

  return v2;
}

double sub_1B588F370()
{
  return sub_1B588F37C(&OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box);
}

double sub_1B588F37C(void *a1)
{
  return *(double *)(v1 + *a1);
}

double sub_1B588F39C(uint64_t a1, uint64_t a2, void *a3)
{
  return *(double *)(a1 + *a3);
}

uint64_t sub_1B588F3B0()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label);
}

uint64_t sub_1B588F3D0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_labelName);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_1B588F418()
{
  swift_bridgeObjectRetain();
  uint64_t v0 = (void *)sub_1B589FB18();
  swift_bridgeObjectRelease();

  return v0;
}

double sub_1B588F474()
{
  return *(double *)(v0 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence);
}

void AXMClickabilityDetectorResult.init()()
{
}

uint64_t sub_1B588F4F4(uint64_t a1)
{
  unint64_t v2 = sub_1B5896D88();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_1B588F530(uint64_t a1)
{
  unint64_t v2 = sub_1B5896D88();

  return MEMORY[0x1F41862B0](a1, v2);
}

id AXMClickabilityDetectorResult.__deallocating_deinit(uint64_t a1)
{
  return sub_1B588F584(a1, type metadata accessor for AXMClickabilityDetectorResult);
}

id sub_1B588F584(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_1B588F5D0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60BF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1B5896D88();
  sub_1B589FF48();
  long long v9 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box + 16);
  long long v12 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box);
  long long v13 = v9;
  v11[15] = 0;
  type metadata accessor for CGRect(0);
  sub_1B5896BB8(&qword_1E9D60B28, type metadata accessor for CGRect);
  sub_1B589FE68();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_1B589FE58();
    LOBYTE(v12) = 2;
    sub_1B589FE28();
    LOBYTE(v12) = 3;
    sub_1B589FE38();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

char *AXMClickabilityDetectorResult.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AXMClickabilityDetectorResult.init(from:)(a1);
}

char *AXMClickabilityDetectorResult.init(from:)(void *a1)
{
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C00);
  uint64_t v4 = *(void *)(v21 - 8);
  MEMORY[0x1F4188790](v21);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1[3];
  uint64_t v22 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1B5896D88();
  uint64_t v8 = v1;
  uint64_t v20 = v6;
  sub_1B589FF38();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);

    type metadata accessor for AXMClickabilityDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v9 = v4;
    type metadata accessor for CGRect(0);
    char v26 = 0;
    sub_1B5896BB8(&qword_1E9D60B80, type metadata accessor for CGRect);
    uint64_t v10 = v21;
    uint64_t v11 = v20;
    sub_1B589FDF8();
    long long v12 = &v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box];
    *(_OWORD *)long long v12 = v24;
    *((_OWORD *)v12 + 1) = v25;
    LOBYTE(v24) = 1;
    *(void *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label] = sub_1B589FDE8();
    LOBYTE(v24) = 2;
    uint64_t v13 = sub_1B589FDB8();
    uint64_t v15 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_labelName];
    *uint64_t v15 = v13;
    v15[1] = v16;
    LOBYTE(v24) = 3;
    sub_1B589FDC8();
    *(void *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence] = v17;

    uint64_t v18 = (objc_class *)type metadata accessor for AXMClickabilityDetectorResult();
    v23.receiver = v8;
    v23.super_class = v18;
    uint64_t v8 = (char *)objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  return v8;
}

uint64_t sub_1B588FB38@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AXMClickabilityDetectorResult();
  uint64_t result = sub_1B589FC88();
  *a1 = result;
  return result;
}

uint64_t sub_1B588FB78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  return sub_1B588FBB8(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for AXMClickabilityDetectorResult, (uint64_t (*)(uint64_t))AXMClickabilityDetectorResult.init(from:), a3);
}

uint64_t sub_1B588FBB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t (*a3)(uint64_t)@<X4>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  id v9 = objc_allocWithZone((Class)a3(a2));
  uint64_t result = a4(a1);
  if (!v5) {
    *a5 = result;
  }
  return result;
}

uint64_t sub_1B588FC1C(void *a1)
{
  return sub_1B588F5D0(a1);
}

BOOL AXModelType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_1B588FC64(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1B588FC78()
{
  return sub_1B589FF28();
}

uint64_t sub_1B588FCC0()
{
  return sub_1B589FF18();
}

uint64_t sub_1B588FCEC()
{
  return sub_1B589FF28();
}

void *sub_1B588FD30@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_1B588FD60(void *a1@<X8>)
{
  *a1 = *v1;
}

char *sub_1B588FD6C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B588FDFC(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
}

char *sub_1B588FD8C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B588FEF8(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
}

char *sub_1B588FDAC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B588FFF4(a1, a2, a3, *v3, &qword_1E9D60D10);
  *id v3 = result;
  return result;
}

char *sub_1B588FDD4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B588FFF4(a1, a2, a3, *v3, &qword_1E9D60CF0);
  *id v3 = result;
  return result;
}

char *sub_1B588FDFC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CD8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1B588FEF8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60D18);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1B588FFF4(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  int64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    int64_t v10 = *((void *)a4 + 2);
  }
  else {
    int64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    size_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    int64_t v11 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v13 >= &v14[v9]) {
      memmove(v13, v14, v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_release();
  return v11;
}

unint64_t sub_1B58900DC(unsigned __int8 a1)
{
  sub_1B589FF08();
  sub_1B589FF18();
  uint64_t v2 = sub_1B589FF28();
  return sub_1B5890240(a1, v2);
}

char *sub_1B5890144(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CD8);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    int64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_1B5890240(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1B58902E0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_1B5892CEC();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1B58904D0(v6);
  return sub_1B589FCC8();
}

void *sub_1B589035C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      id v3 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60D28);
      id v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1B5892B2C((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1B589FD58();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x1E4FBC860];
    }
  }
  return v3;
}

void sub_1B5890454(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1B589FD58();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1BA99FC50);
}

uint64_t sub_1B58904D0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_1B589FE88();
  uint64_t v137 = v3;
  if (result < v3)
  {
    if (v3 >= 0) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v3 + 1;
    }
    if (v3 < -1)
    {
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      __break(1u);
LABEL_194:
      __break(1u);
LABEL_195:
      __break(1u);
      return result;
    }
    uint64_t v136 = result;
    v134 = a1;
    if (v3 <= 1)
    {
      uint64_t v21 = MEMORY[0x1E4FBC860];
      uint64_t v153 = MEMORY[0x1E4FBC860];
      unint64_t v7 = (MEMORY[0x1E4FBC860] & 0xFFFFFFFFFFFFFF8) + 32;
      if (v3 != 1)
      {
        unint64_t v23 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_152:
        if (v23 < 2)
        {
LABEL_163:
          swift_bridgeObjectRelease();
          *(void *)((v153 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
          sub_1B589FBA8();
          return swift_bridgeObjectRelease();
        }
        uint64_t v127 = *v134;
        while (1)
        {
          unint64_t v128 = v23 - 2;
          if (v23 < 2) {
            goto LABEL_182;
          }
          if (!v127) {
            goto LABEL_195;
          }
          v129 = (char *)v7;
          uint64_t v130 = *(void *)(v21 + 32 + 16 * v128);
          uint64_t v131 = *(void *)(v21 + 32 + 16 * (v23 - 1) + 8);
          uint64_t result = sub_1B5890F24((char *)(v127 + 8 * v130), (char *)(v127 + 8 * *(void *)(v21 + 32 + 16 * (v23 - 1))), v127 + 8 * v131, v129);
          if (v1) {
            goto LABEL_163;
          }
          if (v131 < v130) {
            goto LABEL_183;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_1B58912EC(v21);
            uint64_t v21 = result;
          }
          if (v128 >= *(void *)(v21 + 16)) {
            goto LABEL_184;
          }
          v132 = (void *)(v21 + 32 + 16 * v128);
          void *v132 = v130;
          v132[1] = v131;
          unint64_t v133 = *(void *)(v21 + 16);
          if (v23 > v133) {
            goto LABEL_185;
          }
          uint64_t result = (uint64_t)memmove((void *)(v21 + 32 + 16 * (v23 - 1)), (const void *)(v21 + 32 + 16 * v23), 16 * (v133 - v23));
          *(void *)(v21 + 16) = v133 - 1;
          unint64_t v23 = v133 - 1;
          unint64_t v7 = (unint64_t)v129;
          if (v133 <= 2) {
            goto LABEL_163;
          }
        }
      }
    }
    else
    {
      uint64_t v6 = v5 >> 1;
      type metadata accessor for AXBoundingBox();
      uint64_t result = sub_1B589FBC8();
      *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      unint64_t v7 = (result & 0xFFFFFFFFFFFFFF8) + 32;
      uint64_t v153 = result;
    }
    uint64_t v22 = 0;
    uint64_t v135 = *a1 + 16;
    uint64_t v141 = *a1;
    uint64_t v138 = *a1 - 8;
    uint64_t v21 = MEMORY[0x1E4FBC860];
    __dst = (char *)v7;
LABEL_22:
    uint64_t v24 = v22++;
    uint64_t v150 = v24;
    if (v22 >= v3)
    {
      uint64_t v25 = v141;
    }
    else
    {
      uint64_t v25 = v141;
      uint64_t v26 = *(void *)(v141 + 8 * v24);
      uint64_t v27 = (float *)(*(void *)(v141 + 8 * v22) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      float v28 = *v27;
      int v29 = (float *)(v26 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      uint64_t result = swift_beginAccess();
      float v30 = *v29;
      uint64_t v22 = v24 + 2;
      if (v24 + 2 < v3)
      {
        char v31 = (void *)(v135 + 8 * v24);
        while (1)
        {
          uint64_t v32 = *(v31 - 1);
          uint64_t v33 = (float *)(*v31 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          swift_beginAccess();
          float v34 = *v33;
          char v35 = (float *)(v32 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          uint64_t result = swift_beginAccess();
          if (v30 < v28 == *v35 >= v34) {
            break;
          }
          ++v22;
          ++v31;
          if (v3 == v22)
          {
            uint64_t v22 = v3;
            break;
          }
        }
        unint64_t v7 = (unint64_t)__dst;
      }
      if (v30 < v28)
      {
        if (v22 < v24) {
          goto LABEL_186;
        }
        if (v24 < v22)
        {
          uint64_t v36 = (uint64_t *)(v138 + 8 * v22);
          uint64_t v37 = v22;
          uint64_t v38 = v24;
          char v39 = (uint64_t *)(v141 + 8 * v24);
          do
          {
            if (v38 != --v37)
            {
              if (!v141) {
                goto LABEL_194;
              }
              uint64_t v40 = *v39;
              *char v39 = *v36;
              *uint64_t v36 = v40;
            }
            ++v38;
            --v36;
            ++v39;
          }
          while (v38 < v37);
        }
      }
    }
    if (v22 < v3)
    {
      if (__OFSUB__(v22, v24)) {
        goto LABEL_181;
      }
      if (v22 - v24 < v136)
      {
        if (__OFADD__(v24, v136))
        {
LABEL_187:
          __break(1u);
          goto LABEL_188;
        }
        if (v24 + v136 >= v3) {
          uint64_t v41 = v3;
        }
        else {
          uint64_t v41 = v24 + v136;
        }
        if (v41 < v24)
        {
LABEL_188:
          __break(1u);
LABEL_189:
          __break(1u);
          goto LABEL_190;
        }
        if (v22 != v41)
        {
          uint64_t v42 = (uint64_t *)(v138 + 8 * v22);
          uint64_t v148 = v41;
          do
          {
            uint64_t v43 = *(void *)(v25 + 8 * v22);
            uint64_t v44 = v24;
            long long v45 = v42;
            do
            {
              uint64_t v46 = *v45;
              uint64_t v47 = (float *)(v43 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
              swift_beginAccess();
              float v48 = *v47;
              float v49 = (float *)(v46 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
              uint64_t result = swift_beginAccess();
              if (*v49 >= v48) {
                break;
              }
              if (!v25) {
                goto LABEL_189;
              }
              uint64_t v50 = *v45;
              uint64_t v43 = v45[1];
              *long long v45 = v43;
              v45[1] = v50;
              --v45;
              ++v44;
            }
            while (v22 != v44);
            ++v22;
            ++v42;
            uint64_t v24 = v150;
          }
          while (v22 != v148);
          uint64_t v22 = v148;
          unint64_t v7 = (unint64_t)__dst;
        }
      }
    }
    if (v22 >= v24)
    {
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_1B58911F0(0, *(void *)(v21 + 16) + 1, 1, (char *)v21);
        uint64_t v21 = result;
      }
      unint64_t v52 = *(void *)(v21 + 16);
      unint64_t v51 = *(void *)(v21 + 24);
      unint64_t v23 = v52 + 1;
      if (v52 >= v51 >> 1)
      {
        uint64_t result = (uint64_t)sub_1B58911F0((char *)(v51 > 1), v52 + 1, 1, (char *)v21);
        uint64_t v21 = result;
      }
      *(void *)(v21 + 16) = v23;
      uint64_t v142 = v21 + 32;
      uint64_t v53 = (uint64_t *)(v21 + 32 + 16 * v52);
      *uint64_t v53 = v24;
      v53[1] = v22;
      if (!v52)
      {
        unint64_t v23 = 1;
        goto LABEL_21;
      }
      uint64_t v54 = v21 + 32;
      uint64_t v139 = v22;
      uint64_t v140 = v21;
      while (1)
      {
        unint64_t v55 = v23 - 1;
        if (v23 >= 4)
        {
          unint64_t v60 = v54 + 16 * v23;
          uint64_t v61 = *(void *)(v60 - 64);
          uint64_t v62 = *(void *)(v60 - 56);
          BOOL v66 = __OFSUB__(v62, v61);
          uint64_t v63 = v62 - v61;
          if (v66) {
            goto LABEL_169;
          }
          uint64_t v65 = *(void *)(v60 - 48);
          uint64_t v64 = *(void *)(v60 - 40);
          BOOL v66 = __OFSUB__(v64, v65);
          uint64_t v58 = v64 - v65;
          char v59 = v66;
          if (v66) {
            goto LABEL_170;
          }
          unint64_t v67 = v23 - 2;
          char v68 = (uint64_t *)(v54 + 16 * (v23 - 2));
          uint64_t v70 = *v68;
          uint64_t v69 = v68[1];
          BOOL v66 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          if (v66) {
            goto LABEL_171;
          }
          BOOL v66 = __OFADD__(v58, v71);
          uint64_t v72 = v58 + v71;
          if (v66) {
            goto LABEL_173;
          }
          if (v72 >= v63)
          {
            v90 = (uint64_t *)(v54 + 16 * v55);
            uint64_t v92 = *v90;
            uint64_t v91 = v90[1];
            BOOL v66 = __OFSUB__(v91, v92);
            uint64_t v93 = v91 - v92;
            if (v66) {
              goto LABEL_179;
            }
            BOOL v83 = v58 < v93;
            goto LABEL_94;
          }
        }
        else
        {
          if (v23 != 3)
          {
            uint64_t v84 = *(void *)(v21 + 32);
            uint64_t v85 = *(void *)(v21 + 40);
            BOOL v66 = __OFSUB__(v85, v84);
            uint64_t v77 = v85 - v84;
            char v78 = v66;
LABEL_88:
            if (v78) {
              goto LABEL_175;
            }
            v86 = (uint64_t *)(v54 + 16 * v55);
            uint64_t v88 = *v86;
            uint64_t v87 = v86[1];
            BOOL v66 = __OFSUB__(v87, v88);
            uint64_t v89 = v87 - v88;
            if (v66) {
              goto LABEL_176;
            }
            if (v89 < v77) {
              goto LABEL_21;
            }
            goto LABEL_96;
          }
          uint64_t v57 = *(void *)(v21 + 32);
          uint64_t v56 = *(void *)(v21 + 40);
          BOOL v66 = __OFSUB__(v56, v57);
          uint64_t v58 = v56 - v57;
          char v59 = v66;
        }
        if (v59) {
          goto LABEL_172;
        }
        unint64_t v67 = v23 - 2;
        v73 = (uint64_t *)(v54 + 16 * (v23 - 2));
        uint64_t v75 = *v73;
        uint64_t v74 = v73[1];
        BOOL v76 = __OFSUB__(v74, v75);
        uint64_t v77 = v74 - v75;
        char v78 = v76;
        if (v76) {
          goto LABEL_174;
        }
        v79 = (uint64_t *)(v54 + 16 * v55);
        uint64_t v81 = *v79;
        uint64_t v80 = v79[1];
        BOOL v66 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v66) {
          goto LABEL_177;
        }
        if (__OFADD__(v77, v82)) {
          goto LABEL_178;
        }
        if (v77 + v82 < v58) {
          goto LABEL_88;
        }
        BOOL v83 = v58 < v82;
LABEL_94:
        if (v83) {
          unint64_t v55 = v67;
        }
LABEL_96:
        if (v55 - 1 >= v23)
        {
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
          break;
        }
        if (!v141) {
          goto LABEL_193;
        }
        unint64_t v145 = v55 - 1;
        int64_t v146 = v55;
        v144 = (uint64_t *)(v54 + 16 * (v55 - 1));
        v94 = (char *)(v54 + 16 * v55);
        uint64_t v95 = *(void *)v94;
        v143 = v94;
        uint64_t v147 = *v144;
        uint64_t v149 = *((void *)v94 + 1);
        v96 = (char *)(v141 + 8 * *v144);
        v97 = (char *)(v141 + 8 * *(void *)v94);
        unint64_t v98 = v141 + 8 * v149;
        uint64_t v99 = v97 - v96 + 7;
        if (v97 - v96 >= 0) {
          uint64_t v99 = v97 - v96;
        }
        uint64_t v100 = v99 >> 3;
        uint64_t v101 = v98 - (void)v97 + 7;
        if ((uint64_t)(v98 - (void)v97) >= 0) {
          uint64_t v101 = v98 - (void)v97;
        }
        uint64_t v102 = v101 >> 3;
        if (v100 < v101 >> 3)
        {
          unint64_t v7 = (unint64_t)__dst;
          if (__dst != v96 || __dst >= v97) {
            uint64_t result = (uint64_t)memmove(__dst, v96, 8 * v100);
          }
          v103 = &__dst[8 * v100];
          if (v95 >= v149 || v97 - v96 < 8)
          {
            v111 = v103;
            v104 = __dst;
LABEL_140:
            v97 = v96;
            goto LABEL_141;
          }
          v104 = __dst;
          while (2)
          {
            uint64_t v105 = *(void *)v104;
            v106 = (float *)(*(void *)v97 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
            swift_beginAccess();
            float v107 = *v106;
            v108 = (float *)(v105 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
            uint64_t result = swift_beginAccess();
            if (*v108 >= v107)
            {
              v109 = v104;
              BOOL v110 = v96 == v104;
              v104 += 8;
              if (!v110) {
                goto LABEL_114;
              }
            }
            else
            {
              v109 = v97;
              BOOL v110 = v96 == v97;
              v97 += 8;
              if (!v110) {
LABEL_114:
              }
                *(void *)v96 = *(void *)v109;
            }
            v96 += 8;
            if (v104 >= v103 || (unint64_t)v97 >= v98)
            {
              v111 = v103;
              goto LABEL_140;
            }
            continue;
          }
        }
        if ((unint64_t)__dst >= v98 || __dst != v97) {
          uint64_t result = (uint64_t)memmove(__dst, v97, 8 * v102);
        }
        v111 = &__dst[8 * v102];
        uint64_t v112 = v147;
        uint64_t v113 = v149;
        if (v147 >= v95 || (uint64_t)(v98 - (void)v97) < 8)
        {
          unint64_t v7 = (unint64_t)__dst;
          v104 = __dst;
          goto LABEL_143;
        }
        v114 = (char *)(v138 + 8 * v149);
        v151 = v96;
        do
        {
          v115 = v111 - 8;
          v116 = v114 + 8;
          v118 = v97 - 8;
          uint64_t v117 = *((void *)v97 - 1);
          v119 = v97;
          unint64_t v120 = (unint64_t)v111;
          v121 = (float *)(*((void *)v111 - 1) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          swift_beginAccess();
          float v122 = *v121;
          v123 = (float *)(v117 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
          uint64_t result = swift_beginAccess();
          if (*v123 >= v122)
          {
            v124 = v119;
            v118 = v115;
            if (v116 == (char *)v120)
            {
              v111 = v115;
              unint64_t v7 = (unint64_t)__dst;
              v125 = v151;
              if ((unint64_t)v114 < v120) {
                goto LABEL_135;
              }
            }
            else
            {
              v111 = v115;
              v125 = v151;
              unint64_t v7 = (unint64_t)__dst;
            }
            goto LABEL_134;
          }
          if (v116 != v119)
          {
            v124 = v118;
            v125 = v151;
            unint64_t v7 = (unint64_t)__dst;
            v111 = (char *)v120;
LABEL_134:
            *(void *)v114 = *(void *)v118;
            goto LABEL_135;
          }
          BOOL v20 = v114 >= v119;
          v124 = v118;
          unint64_t v7 = (unint64_t)__dst;
          v111 = (char *)v120;
          v125 = v151;
          if (v20) {
            goto LABEL_134;
          }
LABEL_135:
          v97 = v124;
          if (v125 >= v124) {
            goto LABEL_138;
          }
          v114 -= 8;
        }
        while (v7 < (unint64_t)v111);
        unint64_t v7 = (unint64_t)__dst;
LABEL_138:
        v104 = (char *)v7;
LABEL_141:
        uint64_t v112 = v147;
        uint64_t v113 = v149;
LABEL_143:
        uint64_t v21 = v140;
        if (v97 != v104 || v97 >= &v104[(v111 - v104 + (v111 - v104 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8]) {
          uint64_t result = (uint64_t)memmove(v97, v104, 8 * ((v111 - v104) / 8));
        }
        if (v113 < v112) {
          goto LABEL_166;
        }
        if (v146 > *(void *)(v140 + 16)) {
          goto LABEL_167;
        }
        uint64_t *v144 = v112;
        uint64_t v54 = v142;
        *(void *)(v142 + 16 * v145 + 8) = v113;
        unint64_t v126 = *(void *)(v140 + 16);
        if (v146 >= (uint64_t)v126) {
          goto LABEL_168;
        }
        unint64_t v23 = v126 - 1;
        uint64_t result = (uint64_t)memmove(v143, v143 + 16, 16 * (v126 - 1 - v146));
        *(void *)(v140 + 16) = v126 - 1;
        BOOL v83 = v126 > 2;
        uint64_t v22 = v139;
        if (!v83)
        {
LABEL_21:
          uint64_t v3 = v137;
          if (v22 >= v137) {
            goto LABEL_152;
          }
          goto LABEL_22;
        }
      }
    }
    __break(1u);
LABEL_181:
    __break(1u);
LABEL_182:
    __break(1u);
LABEL_183:
    __break(1u);
LABEL_184:
    __break(1u);
LABEL_185:
    __break(1u);
LABEL_186:
    __break(1u);
    goto LABEL_187;
  }
  if (v3 < 0) {
    goto LABEL_191;
  }
  if ((unint64_t)v3 >= 2)
  {
    uint64_t v8 = (uint64_t *)*a1;
    uint64_t v9 = -1;
    uint64_t v10 = 1;
    int64_t v11 = v8;
    do
    {
      uint64_t v12 = v8[v10];
      uint64_t v13 = v9;
      uint64_t v14 = v11;
      do
      {
        uint64_t v15 = *v14;
        uint64_t v16 = (float *)(v12 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
        swift_beginAccess();
        float v17 = *v16;
        uint64_t v18 = (float *)(v15 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
        uint64_t result = swift_beginAccess();
        if (*v18 >= v17) {
          break;
        }
        if (!v8) {
          goto LABEL_192;
        }
        uint64_t v19 = *v14;
        uint64_t v12 = v14[1];
        *uint64_t v14 = v12;
        v14[1] = v19;
        --v14;
        BOOL v20 = __CFADD__(v13++, 1);
      }
      while (!v20);
      ++v10;
      ++v11;
      --v9;
    }
    while (v10 != v137);
  }
  return result;
}

uint64_t sub_1B5890F24(char *__dst, char *__src, unint64_t a3, char *a4)
{
  int64_t v4 = a4;
  uint64_t v6 = __src;
  unint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 7;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (a4 != __src || &__src[8 * v13] <= a4) {
      memmove(a4, __src, 8 * v13);
    }
    uint64_t v14 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8) {
      goto LABEL_42;
    }
    char v31 = v7;
    uint64_t v21 = (char *)(a3 - 8);
    uint64_t v32 = v4;
    while (1)
    {
      uint64_t v22 = v21 + 8;
      uint64_t v24 = v6 - 8;
      uint64_t v23 = *((void *)v6 - 1);
      uint64_t v25 = (float *)(*((void *)v14 - 1) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      float v26 = *v25;
      uint64_t v27 = (float *)(v23 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      if (*v27 >= v26)
      {
        unint64_t v28 = (unint64_t)v31;
        uint64_t v24 = v14 - 8;
        if (v22 != v14)
        {
          v14 -= 8;
          goto LABEL_37;
        }
        BOOL v29 = v21 >= v14;
        v14 -= 8;
        if (v29) {
          goto LABEL_37;
        }
      }
      else
      {
        unint64_t v28 = (unint64_t)v31;
        if (v22 != v6)
        {
          v6 -= 8;
LABEL_37:
          *(void *)uint64_t v21 = *(void *)v24;
          goto LABEL_38;
        }
        BOOL v29 = v21 >= v6;
        v6 -= 8;
        if (v29) {
          goto LABEL_37;
        }
      }
LABEL_38:
      if ((unint64_t)v6 <= v28)
      {
        int64_t v4 = v32;
        goto LABEL_42;
      }
      v21 -= 8;
      int64_t v4 = v32;
      if (v14 <= v32) {
        goto LABEL_42;
      }
    }
  }
  if (a4 != __dst || &__dst[8 * v10] <= a4) {
    memmove(a4, __dst, 8 * v10);
  }
  uint64_t v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      uint64_t v15 = *(void *)v4;
      uint64_t v16 = (float *)(*(void *)v6 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      float v17 = *v16;
      uint64_t v18 = (float *)(v15 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
      swift_beginAccess();
      if (*v18 >= v17) {
        break;
      }
      uint64_t v19 = v6;
      BOOL v20 = v7 == v6;
      v6 += 8;
      if (!v20) {
        goto LABEL_16;
      }
LABEL_17:
      v7 += 8;
      if (v4 >= v14 || (unint64_t)v6 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v19 = v4;
    BOOL v20 = v7 == v4;
    v4 += 8;
    if (v20) {
      goto LABEL_17;
    }
LABEL_16:
    *(void *)unint64_t v7 = *(void *)v19;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v6 = v7;
LABEL_42:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8]) {
    memmove(v6, v4, 8 * ((v14 - v4) / 8));
  }
  return 1;
}

char *sub_1B58911F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60D20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1B58912EC(uint64_t a1)
{
  return sub_1B58911F0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1B5891300(unsigned char *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v7 = *v3;
  sub_1B589FF08();
  sub_1B589FF18();
  uint64_t v8 = sub_1B589FF28();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_1B5892494(a2, v10, isUniquelyReferenced_nonNull_native, a3);
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v11 = *(void *)(v7 + 48);
  if (*(unsigned __int8 *)(v11 + v10) != a2)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(unsigned __int8 *)(v11 + v10) != a2);
  }
  uint64_t result = 0;
  LOBYTE(a2) = *(unsigned char *)(*(void *)(*v3 + 48) + v10);
LABEL_8:
  *a1 = a2;
  return result;
}

void sub_1B5891438(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_4;
  }
  if (!*(void *)(a2 + 16)) {
    goto LABEL_4;
  }
  LODWORD(v9) = *(unsigned __int8 *)(a1 + 32);
  if (v9 == 14) {
    goto LABEL_4;
  }
  int v10 = *(_DWORD *)(a2 + 32);
  uint64_t v11 = (void *)*a4;
  unint64_t v12 = sub_1B58900DC(v9);
  uint64_t v14 = v11[2];
  BOOL v15 = (v13 & 1) == 0;
  BOOL v16 = __OFADD__(v14, v15);
  uint64_t v17 = v14 + v15;
  if (v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LOBYTE(v18) = v13;
  if (v11[3] < v17)
  {
    sub_1B5891F24(v17, a3 & 1, &qword_1E9D60CF8);
    unint64_t v12 = sub_1B58900DC(v9);
    if ((v18 & 1) == (v19 & 1)) {
      goto LABEL_10;
    }
LABEL_8:
    unint64_t v12 = sub_1B589FEF8();
    __break(1u);
  }
  if (a3)
  {
LABEL_10:
    if (v18) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v23 = (void *)*a4;
    *(void *)(*a4 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(unsigned char *)(v23[6] + v12) = v9;
    *(_DWORD *)(v23[7] + 4 * v12) = v10;
    uint64_t v24 = v23[2];
    BOOL v16 = __OFADD__(v24, 1);
    uint64_t v25 = v24 + 1;
    if (!v16)
    {
      v23[2] = v25;
      unint64_t v26 = *(void *)(a1 + 16);
      if (v26 == 1)
      {
LABEL_4:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        return;
      }
      uint64_t v9 = 0;
      while (1)
      {
        unint64_t v27 = v9 + 1;
        if (v9 + 1 >= v26) {
          goto LABEL_30;
        }
        unint64_t v28 = *(void *)(a2 + 16);
        if (v27 == v28) {
          goto LABEL_4;
        }
        if (v27 >= v28) {
          goto LABEL_31;
        }
        int v18 = *(unsigned __int8 *)(a1 + 33 + v9);
        if (v18 == 14) {
          goto LABEL_4;
        }
        int v10 = *(_DWORD *)(a2 + 36 + 4 * v9);
        BOOL v29 = (void *)*a4;
        unint64_t v30 = sub_1B58900DC(v18);
        uint64_t v32 = v29[2];
        BOOL v33 = (v31 & 1) == 0;
        BOOL v16 = __OFADD__(v32, v33);
        uint64_t v34 = v32 + v33;
        if (v16) {
          goto LABEL_28;
        }
        a3 = v31;
        if (v29[3] < v34)
        {
          sub_1B5891F24(v34, 1, &qword_1E9D60CF8);
          unint64_t v30 = sub_1B58900DC(v18);
          if ((a3 & 1) != (v35 & 1)) {
            goto LABEL_8;
          }
        }
        if (a3) {
          goto LABEL_11;
        }
        uint64_t v36 = (void *)*a4;
        *(void *)(*a4 + 8 * (v30 >> 6) + 64) |= 1 << v30;
        *(unsigned char *)(v36[6] + v30) = v18;
        *(_DWORD *)(v36[7] + 4 * v30) = v10;
        uint64_t v37 = v36[2];
        BOOL v16 = __OFADD__(v37, 1);
        uint64_t v38 = v37 + 1;
        if (v16) {
          break;
        }
        v36[2] = v38;
        unint64_t v26 = *(void *)(a1 + 16);
        uint64_t v39 = v9 + 2;
        ++v9;
        if (v39 == v26) {
          goto LABEL_4;
        }
      }
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v22 = v12;
  sub_1B5891D9C(&qword_1E9D60CF8);
  unint64_t v12 = v22;
  if ((v18 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  BOOL v20 = (void *)swift_allocError();
  swift_willThrow();
  id v21 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CD0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_32:
  sub_1B589FC78();
  sub_1B589FB48();
  sub_1B589FD08();
  sub_1B589FB48();
  sub_1B589FD18();
  __break(1u);
}

void sub_1B5891804(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v8) {
    goto LABEL_4;
  }
  if (!*(void *)(a2 + 16)) {
    goto LABEL_4;
  }
  LODWORD(v9) = *(unsigned __int8 *)(a1 + 32);
  if (v9 == 17) {
    goto LABEL_4;
  }
  int v10 = *(_DWORD *)(a2 + 32);
  uint64_t v11 = (void *)*a4;
  unint64_t v12 = sub_1B58900DC(v9);
  uint64_t v14 = v11[2];
  BOOL v15 = (v13 & 1) == 0;
  BOOL v16 = __OFADD__(v14, v15);
  uint64_t v17 = v14 + v15;
  if (v16)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  LOBYTE(v18) = v13;
  if (v11[3] < v17)
  {
    sub_1B5891F24(v17, a3 & 1, &qword_1E9D60C60);
    unint64_t v12 = sub_1B58900DC(v9);
    if ((v18 & 1) == (v19 & 1)) {
      goto LABEL_10;
    }
LABEL_8:
    unint64_t v12 = sub_1B589FEF8();
    __break(1u);
  }
  if (a3)
  {
LABEL_10:
    if (v18) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v23 = (void *)*a4;
    *(void *)(*a4 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    *(unsigned char *)(v23[6] + v12) = v9;
    *(_DWORD *)(v23[7] + 4 * v12) = v10;
    uint64_t v24 = v23[2];
    BOOL v16 = __OFADD__(v24, 1);
    uint64_t v25 = v24 + 1;
    if (!v16)
    {
      v23[2] = v25;
      unint64_t v26 = *(void *)(a1 + 16);
      if (v26 == 1)
      {
LABEL_4:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        return;
      }
      uint64_t v9 = 0;
      while (1)
      {
        unint64_t v27 = v9 + 1;
        if (v9 + 1 >= v26) {
          goto LABEL_30;
        }
        unint64_t v28 = *(void *)(a2 + 16);
        if (v27 == v28) {
          goto LABEL_4;
        }
        if (v27 >= v28) {
          goto LABEL_31;
        }
        int v18 = *(unsigned __int8 *)(a1 + 33 + v9);
        if (v18 == 17) {
          goto LABEL_4;
        }
        int v10 = *(_DWORD *)(a2 + 36 + 4 * v9);
        BOOL v29 = (void *)*a4;
        unint64_t v30 = sub_1B58900DC(v18);
        uint64_t v32 = v29[2];
        BOOL v33 = (v31 & 1) == 0;
        BOOL v16 = __OFADD__(v32, v33);
        uint64_t v34 = v32 + v33;
        if (v16) {
          goto LABEL_28;
        }
        a3 = v31;
        if (v29[3] < v34)
        {
          sub_1B5891F24(v34, 1, &qword_1E9D60C60);
          unint64_t v30 = sub_1B58900DC(v18);
          if ((a3 & 1) != (v35 & 1)) {
            goto LABEL_8;
          }
        }
        if (a3) {
          goto LABEL_11;
        }
        uint64_t v36 = (void *)*a4;
        *(void *)(*a4 + 8 * (v30 >> 6) + 64) |= 1 << v30;
        *(unsigned char *)(v36[6] + v30) = v18;
        *(_DWORD *)(v36[7] + 4 * v30) = v10;
        uint64_t v37 = v36[2];
        BOOL v16 = __OFADD__(v37, 1);
        uint64_t v38 = v37 + 1;
        if (v16) {
          break;
        }
        v36[2] = v38;
        unint64_t v26 = *(void *)(a1 + 16);
        uint64_t v39 = v9 + 2;
        ++v9;
        if (v39 == v26) {
          goto LABEL_4;
        }
      }
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  unint64_t v22 = v12;
  sub_1B5891D9C(&qword_1E9D60C60);
  unint64_t v12 = v22;
  if ((v18 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  BOOL v20 = (void *)swift_allocError();
  swift_willThrow();
  id v21 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CD0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    return;
  }
LABEL_32:
  sub_1B589FC78();
  sub_1B589FB48();
  sub_1B589FD08();
  sub_1B589FB48();
  sub_1B589FD18();
  __break(1u);
}

uint64_t sub_1B5891BD0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1B589FD58();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1B589FD58();
    swift_bridgeObjectRelease();
    uint64_t v6 = v5 + v3;
    if (!__OFADD__(v5, v3)) {
      goto LABEL_5;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3)) {
    goto LABEL_25;
  }
LABEL_5:
  unint64_t v4 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v4;
  uint64_t v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_15;
    }
    uint64_t v5 = 1;
  }
  if (v4 >> 62) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6) {
      uint64_t v9 = v6;
    }
    swift_bridgeObjectRetain();
    unint64_t v4 = MEMORY[0x1BA99FC50](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *uint64_t v1 = v4;
    uint64_t v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    uint64_t result = sub_1B5892B2C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_26:
    __break(1u);
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1B589FD58();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_1B589FBA8();
}

void *sub_1B5891D9C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B589FD68();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      int64_t v10 = v18 + 1;
      if (v18 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v7 + 8 * v10);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v16 = v21 + (v10 << 6);
LABEL_12:
    int v17 = *(_DWORD *)(*(void *)(v3 + 56) + 4 * v16);
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = *(unsigned char *)(*(void *)(v3 + 48) + v16);
    *(_DWORD *)(*(void *)(v5 + 56) + 4 * v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v14) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v7 + 8 * v20);
  if (v19)
  {
    int64_t v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v7 + 8 * v10);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1B5891F24(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t result = sub_1B589FD78();
  uint64_t v8 = result;
  if (*(void *)(v6 + 16))
  {
    char v32 = a2;
    int64_t v9 = 0;
    int64_t v10 = (void *)(v6 + 64);
    uint64_t v11 = 1 << *(unsigned char *)(v6 + 32);
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v6 + 64);
    int64_t v14 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v17 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v18 = v17 | (v9 << 6);
      }
      else
      {
        int64_t v19 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v14) {
          goto LABEL_31;
        }
        unint64_t v20 = v10[v19];
        ++v9;
        if (!v20)
        {
          int64_t v9 = v19 + 1;
          if (v19 + 1 >= v14) {
            goto LABEL_31;
          }
          unint64_t v20 = v10[v9];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v14)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v4 = v3;
                goto LABEL_38;
              }
              uint64_t v31 = 1 << *(unsigned char *)(v6 + 32);
              if (v31 >= 64) {
                bzero((void *)(v6 + 64), ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *int64_t v10 = -1 << v31;
              }
              uint64_t v4 = v3;
              *(void *)(v6 + 16) = 0;
              break;
            }
            unint64_t v20 = v10[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v9 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v9 >= v14) {
                  goto LABEL_31;
                }
                unint64_t v20 = v10[v9];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v9 = v21;
          }
        }
LABEL_21:
        unint64_t v13 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v9 << 6);
      }
      char v22 = *(unsigned char *)(*(void *)(v6 + 48) + v18);
      int v23 = *(_DWORD *)(*(void *)(v6 + 56) + 4 * v18);
      sub_1B589FF08();
      sub_1B589FF18();
      uint64_t result = sub_1B589FF28();
      uint64_t v24 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v25) & ~*(void *)(v15 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v15 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v16 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v15 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v8 + 48) + v16) = v22;
      *(_DWORD *)(*(void *)(v8 + 56) + 4 * v16) = v23;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *uint64_t v4 = v8;
  return result;
}

uint64_t sub_1B58921EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t result = sub_1B589FC58();
  uint64_t v6 = result;
  if (*(void *)(v4 + 16))
  {
    int64_t v7 = 0;
    uint64_t v8 = (void *)(v4 + 56);
    uint64_t v9 = 1 << *(unsigned char *)(v4 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v4 + 56);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v7 << 6);
      }
      else
      {
        int64_t v17 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v12) {
          goto LABEL_33;
        }
        unint64_t v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          int64_t v7 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v18 = v8[v7];
          if (!v18)
          {
            int64_t v7 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_33;
            }
            unint64_t v18 = v8[v7];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_33:
                uint64_t v28 = 1 << *(unsigned char *)(v4 + 32);
                if (v28 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v8 = -1 << v28;
                }
                uint64_t v3 = v2;
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v7 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v7 >= v12) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v8[v7];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v7 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v7 << 6);
      }
      char v20 = *(unsigned char *)(*(void *)(v4 + 48) + v16);
      sub_1B589FF08();
      sub_1B589FF18();
      uint64_t result = sub_1B589FF28();
      uint64_t v21 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(unsigned char *)(*(void *)(v6 + 48) + v14) = v20;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

uint64_t sub_1B5892494(uint64_t result, unint64_t a2, char a3, uint64_t *a4)
{
  int v6 = result;
  unint64_t v7 = *(void *)(*v4 + 16);
  unint64_t v8 = *(void *)(*v4 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if (a3)
  {
    sub_1B58921EC(v9, a4);
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_1B58925F0(a4);
      goto LABEL_14;
    }
    sub_1B589277C(v9, a4);
  }
  uint64_t v10 = *v4;
  sub_1B589FF08();
  sub_1B589FF18();
  uint64_t result = sub_1B589FF28();
  uint64_t v11 = -1 << *(unsigned char *)(v10 + 32);
  a2 = result & ~v11;
  if ((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v12 = *(void *)(v10 + 48);
    if (*(unsigned __int8 *)(v12 + a2) == v6)
    {
LABEL_13:
      uint64_t result = sub_1B589FEE8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(unsigned __int8 *)(v12 + a2) == v6) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v14 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(unsigned char *)(*(void *)(v14 + 48) + a2) = v6;
  uint64_t v15 = *(void *)(v14 + 16);
  BOOL v16 = __OFADD__(v15, 1);
  uint64_t v17 = v15 + 1;
  if (v16) {
    __break(1u);
  }
  else {
    *(void *)(v14 + 16) = v17;
  }
  return result;
}

void *sub_1B58925F0(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_1B589FC48();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 56);
  uint64_t v7 = v3 + 56;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v7 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v7 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v7 + 8 * v10);
        if (!v18) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_12:
    *(unsigned char *)(*(void *)(v5 + 48) + v16) = *(unsigned char *)(*(void *)(v3 + 48) + v16);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v7 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v7 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1B589277C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t result = sub_1B589FC58();
  uint64_t v6 = result;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  int64_t v7 = 0;
  uint64_t v8 = v4 + 56;
  uint64_t v9 = 1 << *(unsigned char *)(v4 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v4 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v7 << 6);
      goto LABEL_24;
    }
    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v17 >= v12) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      int64_t v7 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v7);
      if (!v18)
      {
        int64_t v7 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v7);
        if (!v18) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_24:
    char v20 = *(unsigned char *)(*(void *)(v4 + 48) + v16);
    sub_1B589FF08();
    sub_1B589FF18();
    uint64_t result = sub_1B589FF28();
    uint64_t v21 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v13 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(unsigned char *)(*(void *)(v6 + 48) + v14) = v20;
    ++*(void *)(v6 + 16);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v3 = v2;
    goto LABEL_35;
  }
  unint64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    int64_t v7 = v19;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v7 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v7);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void (*sub_1B58929F4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1B5892AA4(v6, a2, a3);
  return sub_1B5892A5C;
}

void sub_1B5892A5C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1B5892AA4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1BA99FC40](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1B5892B24;
  }
  __break(1u);
  return result;
}

void sub_1B5892B24(id *a1)
{
}

uint64_t sub_1B5892B2C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1B589FD58();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_1B589FD58();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1B58990F0(&qword_1E9D60CC8, &qword_1E9D60CC0);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CC0);
            uint64_t v10 = sub_1B58929F4(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for AXBoundingBox();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1B5892CEC()
{
}

id _s16AXMediaUtilities13AXBoundingBoxC9timestamp10containing4heatACSd_SaySo7CGPointVGSftcfC_0(uint64_t a1, double a2, float a3)
{
  uint64_t v6 = sub_1B589FA88();
  id result = (id)MEMORY[0x1F4188790](v6 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10)
  {
    unint64_t v11 = (double *)(a1 + 40);
    double v12 = *(double *)(a1 + 40);
    double v13 = *(double *)(a1 + 32);
    double v14 = 0.0;
    double v15 = 0.0;
    do
    {
      double v16 = *(v11 - 1);
      double v17 = *v11;
      double v18 = v13 - v16;
      if (v16 >= v13) {
        double v18 = -0.0;
      }
      double v15 = v15 + v18;
      if (v16 < v13) {
        double v13 = *(v11 - 1);
      }
      double v19 = v12 - v17;
      if (v17 >= v12) {
        double v19 = -0.0;
      }
      double v14 = v14 + v19;
      if (v17 < v12) {
        double v12 = *v11;
      }
      v22.origin.CGFloat x = v13;
      v22.origin.CGFloat y = v12;
      v22.size.CGFloat width = v15;
      v22.size.CGFloat height = v14;
      if (CGRectGetMaxX(v22) < v16) {
        double v15 = v16 - v13;
      }
      v23.origin.CGFloat x = v13;
      v23.origin.CGFloat y = v12;
      v23.size.CGFloat width = v15;
      v23.size.CGFloat height = v14;
      if (CGRectGetMaxY(v23) < v17) {
        double v14 = v17 - v12;
      }
      v11 += 2;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    sub_1B589FA78();
    id v20 = objc_allocWithZone((Class)type metadata accessor for AXBoundingBox());
    return AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)((uint64_t)v9, 0, MEMORY[0x1E4FBC860], a2, a3, 0.0, v13, v12, v15, v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void _s16AXMediaUtilities13AXBoundingBoxC24fromCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA6UITypeOSfGSdtFZ_0(int64_t a1, void *a2, double a3)
{
  double v67 = a3;
  uint64_t v6 = sub_1B589FA88();
  MEMORY[0x1F4188790](v6 - 8);
  BOOL v66 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &selRef_triggerWithCoreMotionManager_deviceOrientation_cacheKey_resultHandler_;
  id v9 = objc_msgSend((id)a1, sel_shape);
  uint64_t v71 = sub_1B58990B4(0, &qword_1E9D60B00);
  unint64_t v10 = sub_1B589FB98();

  if ((v10 & 0xC000000000000001) != 0) {
    goto LABEL_68;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v11 = *(id *)(v10 + 32);
    goto LABEL_4;
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  id v14 = (id)MEMORY[0x1BA99FC40](1, v10);
LABEL_8:
  double v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_1B589FC18();

  id v16 = [(id)a1 v8[279]];
  unint64_t v10 = sub_1B589FB98();

  if ((v10 & 0xC000000000000001) != 0) {
    goto LABEL_73;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
  {
    for (id i = *(id *)(v10 + 48); ; id i = (id)MEMORY[0x1BA99FC40](2, v10))
    {
      double v18 = i;
      swift_bridgeObjectRelease();
      unint64_t v10 = sub_1B589FC18();

      uint64_t v76 = MEMORY[0x1E4FBC860];
      if (v3 < 0) {
        goto LABEL_75;
      }
      uint64_t v19 = MEMORY[0x1E4FBC860];
      if (!v3) {
        return;
      }
      if ((v10 & 0x8000000000000000) != 0) {
        goto LABEL_76;
      }
      id v73 = (id)a1;
      uint64_t v20 = 0;
      a1 = v72;
      int64_t v64 = v72 + 1;
      double v60 = (double)(uint64_t)v10;
      BOOL v21 = __OFADD__(v72, 1);
      BOOL v65 = v21;
      double v59 = (double)v3;
      int64_t v62 = v72 + 2;
      BOOL v22 = __OFADD__(v72, 2);
      BOOL v63 = v22;
      int64_t v58 = v72 + 3;
      BOOL v23 = __OFADD__(v72, 3);
      BOOL v61 = v23;
      uint64_t v8 = (char **)0x1E4F28000;
      uint64_t v69 = a2;
      unint64_t v68 = v10;
      uint64_t v57 = v3;
      long long v70 = xmmword_1B58AD540;
      while (1)
      {
        if (v20 == v3) {
          goto LABEL_66;
        }
        if (v10) {
          break;
        }
LABEL_24:
        ++v20;
        uint64_t v3 = v57;
        if (v20 == v57) {
          return;
        }
      }
      if (a1 < 0) {
        goto LABEL_67;
      }
      uint64_t v3 = 0;
      while (v3 != v10)
      {
        if (a1)
        {
          uint64_t v75 = v19;
          sub_1B588FD6C(0, a1, 0);
          uint64_t v24 = 0;
          uint64_t v25 = v75;
          do
          {
            uint64_t v74 = MEMORY[0x1E4FBC860];
            sub_1B589FCD8();
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v24);
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            sub_1B589FCC8();
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v20);
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            sub_1B589FCC8();
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v3);
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            sub_1B589FCC8();
            BOOL v26 = (void *)sub_1B589FB88();
            swift_release();
            id v27 = objc_msgSend(v73, sel_objectForKeyedSubscript_, v26);

            objc_msgSend(v27, sel_floatValue);
            int v29 = v28;

            uint64_t v75 = v25;
            unint64_t v31 = *(void *)(v25 + 16);
            unint64_t v30 = *(void *)(v25 + 24);
            unint64_t v32 = v31 + 1;
            if (v31 >= v30 >> 1)
            {
              sub_1B588FD6C((char *)(v30 > 1), v31 + 1, 1);
              uint64_t v25 = v75;
            }
            ++v24;
            *(void *)(v25 + 16) = v32;
            *(_DWORD *)(v25 + 4 * v31 + 32) = v29;
            a1 = v72;
          }
          while (v72 != v24);
          a2 = v69;
        }
        else
        {
          unint64_t v32 = *(void *)(v19 + 16);
          if (!v32)
          {
            unint64_t v10 = 0;
            goto LABEL_62;
          }
          uint64_t v25 = v19;
        }
        unint64_t v33 = 0;
        unint64_t v10 = 0;
        do
        {
          if (v10 >= v32)
          {
            __break(1u);
            return;
          }
          if (*(float *)(v25 + 32 + 4 * v10) < *(float *)(v25 + 4 * v33 + 32)) {
            unint64_t v10 = v33;
          }
          ++v33;
        }
        while (v32 != v33);
        if (v10 >= v32) {
          goto LABEL_62;
        }
        if (v10 >= 0xE) {
          goto LABEL_77;
        }
        float v34 = *(float *)(v25 + 4 * v10 + 32);
        if (a2[2] && (unint64_t v35 = sub_1B58900DC(v10), (v36 & 1) != 0))
        {
          if (*(float *)(a2[7] + 4 * v35) > v34) {
            goto LABEL_29;
          }
        }
        else if (v34 < 0.3)
        {
LABEL_29:
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60D30);
        uint64_t inited = swift_initStackObject();
        int64_t v38 = a1;
        a1 = inited;
        *(_OWORD *)(inited + 16) = v70;
        *(void *)(inited + 32) = v38;
        *(void *)(inited + 40) = v20;
        *(void *)(inited + 48) = v3;
        a2 = MLMultiArray.subscript.getter(inited);
        objc_msgSend(a2, sel_floatValue);
        float v40 = v39;

        swift_setDeallocating();
        uint64_t v41 = swift_initStackObject();
        *(_OWORD *)(v41 + 16) = v70;
        if (v65) {
          goto LABEL_63;
        }
        a1 = v41;
        *(void *)(v41 + 32) = v64;
        *(void *)(v41 + 40) = v20;
        *(void *)(v41 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v41);
        objc_msgSend(a2, sel_floatValue);
        float v43 = v42;

        swift_setDeallocating();
        uint64_t v44 = swift_initStackObject();
        *(_OWORD *)(v44 + 16) = v70;
        if (v63) {
          goto LABEL_64;
        }
        a1 = v44;
        *(void *)(v44 + 32) = v62;
        *(void *)(v44 + 40) = v20;
        *(void *)(v44 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v44);
        objc_msgSend(a2, sel_floatValue);
        float v46 = v45;

        swift_setDeallocating();
        uint64_t v47 = swift_initStackObject();
        *(_OWORD *)(v47 + 16) = v70;
        if (v61) {
          goto LABEL_65;
        }
        double v48 = ((double)v3 + v43) / v60;
        double v49 = 1.0 - ((double)v20 + v40) / v59;
        *(void *)(v47 + 32) = v58;
        *(void *)(v47 + 40) = v20;
        *(void *)(v47 + 48) = v3;
        id v50 = MLMultiArray.subscript.getter(v47);
        objc_msgSend(v50, sel_floatValue);
        float v52 = v51;

        swift_setDeallocating();
        uint64_t v53 = (uint64_t)v66;
        sub_1B589FA78();
        id v54 = objc_allocWithZone((Class)type metadata accessor for AXBoundingBox());
        id v55 = AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(v53, v10, v25, v67, v34, 0.0, v48 - v52 * 0.5, v49 - v46 * 0.5, v52, v46);
        MEMORY[0x1BA99FB20]();
        if (*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B589FBB8();
        }
        sub_1B589FBD8();
        sub_1B589FBA8();

        a2 = v69;
        a1 = v72;
LABEL_30:
        uint64_t v19 = MEMORY[0x1E4FBC860];
        ++v3;
        unint64_t v10 = v68;
        if (v3 == v68) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      id v11 = (id)MEMORY[0x1BA99FC40](0, v10);
LABEL_4:
      double v12 = v11;
      swift_bridgeObjectRelease();
      unint64_t v10 = (unint64_t)objc_msgSend(v12, sel_integerValue);

      int64_t v72 = v10 - 4;
      if (__OFSUB__(v10, 4)) {
        goto LABEL_70;
      }
      id v13 = [(id)a1 v8[279]];
      unint64_t v10 = sub_1B589FB98();

      if ((v10 & 0xC000000000000001) != 0) {
        goto LABEL_71;
      }
      if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v14 = *(id *)(v10 + 40);
        goto LABEL_8;
      }
      __break(1u);
LABEL_73:
      ;
    }
  }
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
}

uint64_t sub_1B589373C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  return sub_1B588E3AC(a1, a2, *(void *)(v3 + 16), a3);
}

void _s16AXMediaUtilities13AXBoundingBoxC36fromClickabilityCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA06UITypeF0OSfGSdtFZ_0(int64_t a1, void *a2, double a3)
{
  double v67 = a3;
  uint64_t v6 = sub_1B589FA88();
  MEMORY[0x1F4188790](v6 - 8);
  BOOL v66 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = &selRef_triggerWithCoreMotionManager_deviceOrientation_cacheKey_resultHandler_;
  id v9 = objc_msgSend((id)a1, sel_shape);
  uint64_t v71 = sub_1B58990B4(0, &qword_1E9D60B00);
  unint64_t v10 = sub_1B589FB98();

  if ((v10 & 0xC000000000000001) != 0) {
    goto LABEL_68;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v11 = *(id *)(v10 + 32);
    goto LABEL_4;
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  id v14 = (id)MEMORY[0x1BA99FC40](1, v10);
LABEL_8:
  double v15 = v14;
  swift_bridgeObjectRelease();
  uint64_t v3 = sub_1B589FC18();

  id v16 = [(id)a1 v8[279]];
  unint64_t v10 = sub_1B589FB98();

  if ((v10 & 0xC000000000000001) != 0) {
    goto LABEL_73;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
  {
    for (id i = *(id *)(v10 + 48); ; id i = (id)MEMORY[0x1BA99FC40](2, v10))
    {
      double v18 = i;
      swift_bridgeObjectRelease();
      unint64_t v10 = sub_1B589FC18();

      uint64_t v76 = MEMORY[0x1E4FBC860];
      if (v3 < 0) {
        goto LABEL_75;
      }
      uint64_t v19 = MEMORY[0x1E4FBC860];
      if (!v3) {
        return;
      }
      if ((v10 & 0x8000000000000000) != 0) {
        goto LABEL_76;
      }
      id v73 = (id)a1;
      uint64_t v20 = 0;
      a1 = v72;
      int64_t v64 = v72 + 1;
      double v60 = (double)(uint64_t)v10;
      BOOL v21 = __OFADD__(v72, 1);
      BOOL v65 = v21;
      double v59 = (double)v3;
      int64_t v62 = v72 + 2;
      BOOL v22 = __OFADD__(v72, 2);
      BOOL v63 = v22;
      int64_t v58 = v72 + 3;
      BOOL v23 = __OFADD__(v72, 3);
      BOOL v61 = v23;
      uint64_t v8 = (char **)0x1E4F28000;
      uint64_t v69 = a2;
      unint64_t v68 = v10;
      uint64_t v57 = v3;
      long long v70 = xmmword_1B58AD540;
      while (1)
      {
        if (v20 == v3) {
          goto LABEL_66;
        }
        if (v10) {
          break;
        }
LABEL_24:
        ++v20;
        uint64_t v3 = v57;
        if (v20 == v57) {
          return;
        }
      }
      if (a1 < 0) {
        goto LABEL_67;
      }
      uint64_t v3 = 0;
      while (v3 != v10)
      {
        if (a1)
        {
          uint64_t v75 = v19;
          sub_1B588FD6C(0, a1, 0);
          uint64_t v24 = 0;
          uint64_t v25 = v75;
          do
          {
            uint64_t v74 = MEMORY[0x1E4FBC860];
            sub_1B589FCD8();
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v24);
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            sub_1B589FCC8();
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v20);
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            sub_1B589FCC8();
            objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v3);
            sub_1B589FCB8();
            sub_1B589FCE8();
            sub_1B589FCF8();
            sub_1B589FCC8();
            BOOL v26 = (void *)sub_1B589FB88();
            swift_release();
            id v27 = objc_msgSend(v73, sel_objectForKeyedSubscript_, v26);

            objc_msgSend(v27, sel_floatValue);
            int v29 = v28;

            uint64_t v75 = v25;
            unint64_t v31 = *(void *)(v25 + 16);
            unint64_t v30 = *(void *)(v25 + 24);
            unint64_t v32 = v31 + 1;
            if (v31 >= v30 >> 1)
            {
              sub_1B588FD6C((char *)(v30 > 1), v31 + 1, 1);
              uint64_t v25 = v75;
            }
            ++v24;
            *(void *)(v25 + 16) = v32;
            *(_DWORD *)(v25 + 4 * v31 + 32) = v29;
            a1 = v72;
          }
          while (v72 != v24);
          a2 = v69;
        }
        else
        {
          unint64_t v32 = *(void *)(v19 + 16);
          if (!v32)
          {
            unint64_t v10 = 0;
            goto LABEL_62;
          }
          uint64_t v25 = v19;
        }
        unint64_t v33 = 0;
        unint64_t v10 = 0;
        do
        {
          if (v10 >= v32)
          {
            __break(1u);
            return;
          }
          if (*(float *)(v25 + 32 + 4 * v10) < *(float *)(v25 + 4 * v33 + 32)) {
            unint64_t v10 = v33;
          }
          ++v33;
        }
        while (v32 != v33);
        if (v10 >= v32) {
          goto LABEL_62;
        }
        if (v10 >= 0x11) {
          goto LABEL_77;
        }
        float v34 = *(float *)(v25 + 4 * v10 + 32);
        if (a2[2] && (unint64_t v35 = sub_1B58900DC(v10), (v36 & 1) != 0))
        {
          if (*(float *)(a2[7] + 4 * v35) > v34) {
            goto LABEL_29;
          }
        }
        else if (v34 < 0.3)
        {
LABEL_29:
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60D30);
        uint64_t inited = swift_initStackObject();
        int64_t v38 = a1;
        a1 = inited;
        *(_OWORD *)(inited + 16) = v70;
        *(void *)(inited + 32) = v38;
        *(void *)(inited + 40) = v20;
        *(void *)(inited + 48) = v3;
        a2 = MLMultiArray.subscript.getter(inited);
        objc_msgSend(a2, sel_floatValue);
        float v40 = v39;

        swift_setDeallocating();
        uint64_t v41 = swift_initStackObject();
        *(_OWORD *)(v41 + 16) = v70;
        if (v65) {
          goto LABEL_63;
        }
        a1 = v41;
        *(void *)(v41 + 32) = v64;
        *(void *)(v41 + 40) = v20;
        *(void *)(v41 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v41);
        objc_msgSend(a2, sel_floatValue);
        float v43 = v42;

        swift_setDeallocating();
        uint64_t v44 = swift_initStackObject();
        *(_OWORD *)(v44 + 16) = v70;
        if (v63) {
          goto LABEL_64;
        }
        a1 = v44;
        *(void *)(v44 + 32) = v62;
        *(void *)(v44 + 40) = v20;
        *(void *)(v44 + 48) = v3;
        a2 = MLMultiArray.subscript.getter(v44);
        objc_msgSend(a2, sel_floatValue);
        float v46 = v45;

        swift_setDeallocating();
        uint64_t v47 = swift_initStackObject();
        *(_OWORD *)(v47 + 16) = v70;
        if (v61) {
          goto LABEL_65;
        }
        double v48 = ((double)v3 + v43) / v60;
        double v49 = 1.0 - ((double)v20 + v40) / v59;
        *(void *)(v47 + 32) = v58;
        *(void *)(v47 + 40) = v20;
        *(void *)(v47 + 48) = v3;
        id v50 = MLMultiArray.subscript.getter(v47);
        objc_msgSend(v50, sel_floatValue);
        float v52 = v51;

        swift_setDeallocating();
        uint64_t v53 = (uint64_t)v66;
        sub_1B589FA78();
        id v54 = objc_allocWithZone((Class)type metadata accessor for AXBoundingBox());
        id v55 = AXBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(v53, v10, v25, v67, v34, 0.0, v48 - v52 * 0.5, v49 - v46 * 0.5, v52, v46);
        MEMORY[0x1BA99FB20]();
        if (*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B589FBB8();
        }
        sub_1B589FBD8();
        sub_1B589FBA8();

        a2 = v69;
        a1 = v72;
LABEL_30:
        uint64_t v19 = MEMORY[0x1E4FBC860];
        ++v3;
        unint64_t v10 = v68;
        if (v3 == v68) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      id v11 = (id)MEMORY[0x1BA99FC40](0, v10);
LABEL_4:
      double v12 = v11;
      swift_bridgeObjectRelease();
      unint64_t v10 = (unint64_t)objc_msgSend(v12, sel_integerValue);

      int64_t v72 = v10 - 8;
      if (__OFSUB__(v10, 8)) {
        goto LABEL_70;
      }
      id v13 = [(id)a1 v8[279]];
      unint64_t v10 = sub_1B589FB98();

      if ((v10 & 0xC000000000000001) != 0) {
        goto LABEL_71;
      }
      if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        id v14 = *(id *)(v10 + 40);
        goto LABEL_8;
      }
      __break(1u);
LABEL_73:
      ;
    }
  }
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
}

uint64_t sub_1B5894018(unint64_t a1, char *a2, float a3)
{
  uint64_t v27 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  uint64_t v7 = (CGRect *)&a2[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
  a2 += OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex;
  swift_beginAccess();
  BOOL v26 = a2;
  swift_beginAccess();
  if (v6)
  {
    for (unint64_t i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        id v9 = (char *)MEMORY[0x1BA99FC40](i, a1);
      }
      else
      {
        if (i >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_21:
          __break(1u);
LABEL_22:
          uint64_t v6 = sub_1B589FD58();
          goto LABEL_3;
        }
        id v9 = (char *)*(id *)(a1 + 8 * i + 32);
      }
      unint64_t v10 = v9;
      unint64_t v11 = i + 1;
      if (__OFADD__(i, 1)) {
        goto LABEL_21;
      }
      double v12 = (CGRect *)&v9[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect];
      swift_beginAccess();
      CGRect v28 = CGRectUnion(*v12, *v7);
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
      double v17 = CGRectGetHeight(v28);
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      double v18 = sqrt(v17 * CGRectGetWidth(v29));
      if (v18 == 0.0)
      {
        if (a3 >= 0.0) {
          goto LABEL_5;
        }
      }
      else
      {
        CGRect v30 = CGRectIntersection(*v12, *v7);
        CGFloat v19 = v30.origin.x;
        CGFloat v20 = v30.origin.y;
        CGFloat v21 = v30.size.width;
        CGFloat v22 = v30.size.height;
        double v23 = CGRectGetHeight(v30);
        v31.origin.CGFloat x = v19;
        v31.origin.CGFloat y = v20;
        v31.size.CGFloat width = v21;
        v31.size.CGFloat height = v22;
        float v24 = sqrt(v23 * CGRectGetWidth(v31)) / v18;
        if (v24 <= a3) {
          goto LABEL_5;
        }
      }
      a2 = &v10[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
      swift_beginAccess();
      if (*(void *)a2 == *(void *)v26)
      {

        goto LABEL_6;
      }
LABEL_5:
      sub_1B589FCB8();
      sub_1B589FCE8();
      sub_1B589FCF8();
      a2 = (char *)&v27;
      sub_1B589FCC8();
LABEL_6:
      if (v11 == v6) {
        return v27;
      }
    }
  }
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1B58942DC(uint64_t result, uint64_t a2, uint64_t (*a3)(BOOL, uint64_t, uint64_t))
{
  unint64_t v3 = *(void *)(result + 16);
  if (!v3) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v5 = 0;
  uint64_t v6 = result + 32;
  uint64_t v7 = a2 + 56;
  uint64_t v8 = MEMORY[0x1E4FBC860];
  uint64_t v18 = result + 32;
  do
  {
    if (v5 <= v3) {
      unint64_t v9 = v3;
    }
    else {
      unint64_t v9 = v5;
    }
    while (1)
    {
      if (v5 == v9)
      {
        __break(1u);
        return result;
      }
      int v10 = *(unsigned __int8 *)(v6 + v5++);
      if (!*(void *)(a2 + 16)) {
        break;
      }
      sub_1B589FF08();
      sub_1B589FF18();
      id result = sub_1B589FF28();
      uint64_t v11 = -1 << *(unsigned char *)(a2 + 32);
      unint64_t v12 = result & ~v11;
      if (((*(void *)(v7 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        break;
      }
      uint64_t v13 = *(void *)(a2 + 48);
      if (*(unsigned __int8 *)(v13 + v12) != v10)
      {
        uint64_t v14 = ~v11;
        do
        {
          unint64_t v12 = (v12 + 1) & v14;
          if (((*(void *)(v7 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
            goto LABEL_15;
          }
        }
        while (*(unsigned __int8 *)(v13 + v12) != v10);
      }
      if (v5 == v3) {
        return v8;
      }
    }
LABEL_15:
    id result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0) {
      id result = a3(0, *(void *)(v8 + 16) + 1, 1);
    }
    unint64_t v16 = *(void *)(v8 + 16);
    unint64_t v15 = *(void *)(v8 + 24);
    if (v16 >= v15 >> 1) {
      id result = a3(v15 > 1, v16 + 1, 1);
    }
    *(void *)(v8 + 16) = v16 + 1;
    *(unsigned char *)(v8 + v16 + 32) = v10;
    uint64_t v6 = v18;
  }
  while (v5 != v3);
  return v8;
}

uint64_t _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(unint64_t a1, float a2)
{
  uint64_t v3 = a1;
  uint64_t v20 = MEMORY[0x1E4FBC860];
  if (a1 >> 62) {
    goto LABEL_20;
  }
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v18 = v4;
      sub_1B58902E0(&v18);
      unint64_t v5 = v18;
      uint64_t v19 = v18;
      if (v18 < 0 || (v18 & 0x4000000000000000) != 0) {
        break;
      }
      if (*(uint64_t *)(v18 + 16) < 1) {
        goto LABEL_24;
      }
      while (1)
      {
LABEL_7:
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v5 & 0x8000000000000000) != 0
          || (v5 & 0x4000000000000000) != 0)
        {
          sub_1B5890454(v5);
          unint64_t v5 = v6;
          uint64_t v19 = v6;
        }
        uint64_t v3 = v5 & 0xFFFFFFFFFFFFFF8;
        uint64_t v7 = *(void *)(v3 + 16);
        if (!v7) {
          break;
        }
        uint64_t v8 = v7 - 1;
        int v10 = *(void **)(v3 + 32);
        uint64_t v9 = v3 + 32;
        memmove((void *)v9, (const void *)(v9 + 8), 8 * (v7 - 1));
        *(void *)(v9 - 16) = v8;
        sub_1B589FBA8();
        uint64_t v11 = v10;
        MEMORY[0x1BA99FB20]();
        if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1B589FBB8();
        }
        sub_1B589FBD8();
        sub_1B589FBA8();
        unint64_t v12 = swift_bridgeObjectRetain();
        unint64_t v5 = sub_1B5894018(v12, v11, a2);
        swift_bridgeObjectRelease_n();

        uint64_t v19 = v5;
        if (v5 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = sub_1B589FD58();
          swift_bridgeObjectRelease();
          if (v13 <= 0)
          {
LABEL_18:
            swift_bridgeObjectRelease();
            return v20;
          }
        }
        else if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0)
        {
          goto LABEL_18;
        }
      }
      __break(1u);
LABEL_20:
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_1B589FD58();
      swift_bridgeObjectRelease();
      if (v14 < 1) {
        goto LABEL_22;
      }
      unint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v4 = (uint64_t)sub_1B589035C(v15);
      swift_bridgeObjectRelease();
    }
    swift_retain();
    uint64_t v16 = sub_1B589FD58();
    swift_release();
    if (v16 >= 1) {
      goto LABEL_7;
    }
LABEL_24:
    swift_release();
    return MEMORY[0x1E4FBC860];
  }
  else
  {
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return v3;
}

unint64_t sub_1B5894708()
{
  unint64_t result = qword_1E9D60B10;
  if (!qword_1E9D60B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D60B10);
  }
  return result;
}

uint64_t sub_1B589475C(unint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16) + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heatByClass;
  uint64_t result = swift_beginAccess();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (*(void *)(*(void *)v3 + 16) <= a1) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_1B58947F0(uint64_t a1, float (*a2)(uint64_t, float))
{
  uint64_t v11 = MEMORY[0x1E4FBC860];
  sub_1B588FD6C(0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 32;
    do
    {
      float v7 = a2(v5, *(float *)(v6 + 4 * v5));
      unint64_t v9 = *(void *)(v11 + 16);
      unint64_t v8 = *(void *)(v11 + 24);
      if (v9 >= v8 >> 1) {
        sub_1B588FD6C((char *)(v8 > 1), v9 + 1, 1);
      }
      ++v5;
      *(void *)(v11 + 16) = v9 + 1;
      *(float *)(v11 + 4 * v9 + 32) = v7;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char sub_1B5894904(uint64_t a1)
{
  uint64_t v3 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  CGFloat x = v3->origin.x;
  CGFloat y = v3->origin.y;
  CGFloat width = v3->size.width;
  CGFloat height = v3->size.height;
  unint64_t v8 = v1;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v24);
  CGFloat MinY = CGRectGetMinY(*v3);
  CGFloat v11 = CGRectGetWidth(*v3);
  CGFloat v12 = CGRectGetHeight(*v3);
  uint64_t v13 = (CGFloat *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_box];
  *uint64_t v13 = MinX;
  v13[1] = MinY;
  v13[2] = v11;
  v13[3] = v12;
  uint64_t v14 = (float *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  *(double *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_confidence] = *v14;
  unint64_t v15 = (Swift::Int *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  Swift::Int v16 = *v15;
  if (__OFADD__(*v15, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  *(void *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_label] = *v15 + 1;
  LOBYTE(v16) = UIType.init(rawValue:)(v16);
  if (v23 == 14)
  {
LABEL_5:
    __break(1u);
    return v16;
  }
  char v22 = v23;
  uint64_t v17 = sub_1B589FB38();
  uint64_t v18 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities24AXMElementDetectorResult_labelName];
  *uint64_t v18 = v17;
  v18[1] = v19;

  v21.receiver = v8;
  v21.super_class = (Class)type metadata accessor for AXMElementDetectorResult();
  LOBYTE(v16) = objc_msgSendSuper2(&v21, sel_init);
  return v16;
}

uint64_t sub_1B5894A94(void *a1, unint64_t a2, float a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C50);
  uint64_t v111 = *(void *)(v6 - 8);
  uint64_t v112 = v6;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v100 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v104 = (char *)&v95 - v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v103 = (char *)&v95 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  BOOL v110 = (char *)&v95 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v109 = (char *)&v95 - v16;
  MEMORY[0x1F4188790](v15);
  v108 = (char *)&v95 - v17;
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C58);
  uint64_t v18 = *(void *)(v113 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v113);
  float v107 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v101 = (char *)&v95 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v102 = (char *)&v95 - v23;
  uint64_t v24 = sub_1B58959D0((uint64_t)&unk_1F0E6FEE8, &qword_1E9D60D08);
  swift_bridgeObjectRetain();
  unint64_t v25 = 0;
  uint64_t v26 = sub_1B58942DC((uint64_t)&unk_1F0E70120, v24, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_1B588FDAC);
  unint64_t v114 = v24;
  swift_bridgeObjectRelease();
  uint64_t v115 = sub_1B5895944(v26, (void (*)(void))sub_1B5899188, (uint64_t)&type metadata for UIType, &qword_1E9D60D08);
  swift_bridgeObjectRelease();
  if (a2 >> 62) {
    goto LABEL_70;
  }
  uint64_t v27 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    CGRect v28 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v96 = v18;
    v106 = (void *)v25;
    if (v27)
    {
      if (v27 < 1)
      {
        __break(1u);
        goto LABEL_77;
      }
      CGRect v29 = a1;
      uint64_t v30 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0) {
          id v31 = (id)MEMORY[0x1BA99FC40](v30, a2);
        }
        else {
          id v31 = *(id *)(a2 + 8 * v30 + 32);
        }
        unint64_t v32 = v31;
        objc_msgSend(v31, sel_floatValue);
        int v34 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          CGRect v28 = sub_1B5890144(0, *((void *)v28 + 2) + 1, 1, v28);
        }
        unint64_t v36 = *((void *)v28 + 2);
        unint64_t v35 = *((void *)v28 + 3);
        if (v36 >= v35 >> 1) {
          CGRect v28 = sub_1B5890144((char *)(v35 > 1), v36 + 1, 1, v28);
        }
        ++v30;
        *((void *)v28 + 2) = v36 + 1;
        *(_DWORD *)&v28[4 * v36 + 32] = v34;
      }
      while (v27 != v30);
    }
    else
    {
      CGRect v29 = a1;
    }
    swift_bridgeObjectRelease();
    if (*((void *)v28 + 2) >= 0xEuLL) {
      uint64_t v37 = 14;
    }
    else {
      uint64_t v37 = *((void *)v28 + 2);
    }
    if (v37)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CF8);
      uint64_t v38 = sub_1B589FD88();
    }
    else
    {
      uint64_t v38 = MEMORY[0x1E4FBC868];
    }
    float v39 = v29;
    v119 = (void *)v38;
    swift_bridgeObjectRetain();
    float v40 = v106;
    sub_1B5891438((uint64_t)&unk_1F0E70120, (uint64_t)v28, 1, &v119);
    if (v40) {
      goto LABEL_80;
    }
    swift_bridgeObjectRelease();
    v106 = v119;
    sub_1B58990F0(&qword_1E9D60C68, &qword_1E9D60C58);
    id v41 = v39;
    sub_1B589FAB8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C70);
    uint64_t v42 = swift_allocObject();
    long long v105 = xmmword_1B58AD550;
    *(_OWORD *)(v42 + 16) = xmmword_1B58AD550;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C78);
    *(void *)(v42 + 56) = v43;
    uint64_t v44 = sub_1B58990F0(&qword_1E9D60C80, &qword_1E9D60C78);
    *(void *)(v42 + 64) = v44;
    *(void *)(v42 + 32) = 0;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C88);
    *(void *)(v42 + 96) = v45;
    uint64_t v46 = sub_1B58990F0(&qword_1E9D60C90, &qword_1E9D60C88);
    *(_OWORD *)(v42 + 72) = xmmword_1B58AD560;
    *(void *)(v42 + 136) = v43;
    *(void *)(v42 + 144) = v44;
    *(void *)(v42 + 104) = v46;
    *(void *)(v42 + 112) = 0;
    *(void *)(v42 + 176) = v43;
    *(void *)(v42 + 184) = v44;
    *(void *)(v42 + 152) = 0;
    sub_1B589FAC8();
    swift_bridgeObjectRelease();
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = v105;
    *(void *)(v47 + 56) = v43;
    *(void *)(v47 + 64) = v44;
    *(void *)(v47 + 32) = 0;
    *(void *)(v47 + 96) = v45;
    *(void *)(v47 + 104) = v46;
    *(_OWORD *)(v47 + 72) = xmmword_1B58AD570;
    *(void *)(v47 + 136) = v43;
    *(void *)(v47 + 144) = v44;
    *(void *)(v47 + 112) = 0;
    *(void *)(v47 + 176) = v43;
    *(void *)(v47 + 184) = v44;
    *(void *)(v47 + 152) = 0;
    sub_1B589FAC8();
    swift_bridgeObjectRelease();
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = v105;
    *(void *)(v48 + 56) = v43;
    *(void *)(v48 + 64) = v44;
    *(void *)(v48 + 32) = 0;
    *(void *)(v48 + 96) = v45;
    *(void *)(v48 + 104) = v46;
    *(_OWORD *)(v48 + 72) = xmmword_1B58AD580;
    *(void *)(v48 + 136) = v43;
    *(void *)(v48 + 144) = v44;
    *(void *)(v48 + 112) = 0;
    *(void *)(v48 + 176) = v43;
    *(void *)(v48 + 184) = v44;
    *(void *)(v48 + 152) = 0;
    double v49 = v110;
    sub_1B589FAC8();
    swift_bridgeObjectRelease();
    *(void *)&long long v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C98);
    uint64_t v50 = v111;
    uint64_t v51 = *(void *)(v111 + 72);
    uint64_t v52 = *(unsigned __int8 *)(v111 + 80);
    uint64_t v53 = (v52 + 32) & ~v52;
    uint64_t v98 = v52 | 7;
    uint64_t v54 = swift_allocObject();
    long long v99 = xmmword_1B58AD530;
    *(_OWORD *)(v54 + 16) = xmmword_1B58AD530;
    id v55 = *(void (**)(uint64_t, char *, uint64_t))(v50 + 16);
    uint64_t v56 = v112;
    v55(v54 + v53, v49, v112);
    v55(v54 + v53 + v51, v108, v56);
    v119 = (void *)v54;
    uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CA0);
    sub_1B58990F0(&qword_1E9D60CA8, &qword_1E9D60CA0);
    a1 = (void *)sub_1B58990F0(&qword_1E9D60CB0, &qword_1E9D60C50);
    sub_1B589FA98();
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = v99;
    v55(v57 + v53, v110, v56);
    v55(v57 + v53 + v51, v109, v56);
    v119 = (void *)v57;
    sub_1B589FA98();
    int64_t v58 = v103;
    sub_1B589FAA8();
    uint64_t v59 = sub_1B58990B4(0, &qword_1E9D60CB8);
    *(void *)&long long v105 = v50 + 16;
    *(void *)&long long v99 = v55;
    v55((uint64_t)v104, v58, v56);
    uint64_t v98 = (uint64_t)a1;
    double v60 = (void *)sub_1B589FC38();
    _s16AXMediaUtilities13AXBoundingBoxC24fromCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA6UITypeOSfGSdtFZ_0((int64_t)v60, v106, 0.0);
    unint64_t v25 = v61;

    unint64_t v116 = MEMORY[0x1E4FBC860];
    if (v25 >> 62)
    {
      a2 = v115;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_1B589FD58();
    }
    else
    {
      uint64_t v62 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      a2 = v115;
      swift_bridgeObjectRetain();
    }
    uint64_t v18 = MEMORY[0x1E4FBC860];
    if (v62)
    {
      uint64_t v97 = v59;
      unint64_t v63 = 0;
      while (1)
      {
        if ((v25 & 0xC000000000000001) != 0)
        {
          int64_t v64 = (char *)MEMORY[0x1BA99FC40](v63, v25);
        }
        else
        {
          if (v63 >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_67;
          }
          int64_t v64 = (char *)*(id *)(v25 + 8 * v63 + 32);
        }
        a1 = v64;
        uint64_t v18 = v63 + 1;
        if (__OFADD__(v63, 1)) {
          break;
        }
        BOOL v65 = (Swift::Int *)&v64[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
        swift_beginAccess();
        UIType.init(rawValue:)(*v65);
        if (v118 == 14) {
          goto LABEL_78;
        }
        if (sub_1B588CA60(v118, a2))
        {
        }
        else
        {
          sub_1B589FCB8();
          sub_1B589FCE8();
          sub_1B589FCF8();
          sub_1B589FCC8();
          a2 = v115;
        }
        ++v63;
        if (v18 == v62)
        {
          unint64_t v66 = v116;
          uint64_t v18 = MEMORY[0x1E4FBC860];
          goto LABEL_39;
        }
      }
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    unint64_t v66 = MEMORY[0x1E4FBC860];
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = (void *)_s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v66, a3);
    swift_release();
    uint64_t v67 = v112;
    uint64_t v68 = v111 + 8;
    uint64_t v69 = *(void (**)(char *, uint64_t))(v111 + 8);
    v69(v103, v112);
    swift_bridgeObjectRelease();
    long long v70 = v100;
    sub_1B589FAA8();
    ((void (*)(char *, char *, uint64_t))v99)(v104, v70, v67);
    uint64_t v71 = (void *)sub_1B589FC38();
    _s16AXMediaUtilities13AXBoundingBoxC24fromCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA6UITypeOSfGSdtFZ_0((int64_t)v71, v106, 0.0);
    unint64_t v73 = v72;

    uint64_t v118 = v18;
    if (v73 >> 62)
    {
      a2 = v114;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1B589FD58();
    }
    else
    {
      uint64_t v18 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
      a2 = v114;
      swift_bridgeObjectRetain();
    }
    uint64_t v74 = MEMORY[0x1E4FBC860];
    if (!v18) {
      break;
    }
    *(void *)&long long v105 = a1;
    uint64_t v115 = (uint64_t)v69;
    uint64_t v111 = v68;
    unint64_t v75 = 0;
    unint64_t v25 = v73 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if ((v73 & 0xC000000000000001) != 0)
      {
        uint64_t v76 = (char *)MEMORY[0x1BA99FC40](v75, v73);
      }
      else
      {
        if (v75 >= *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_69;
        }
        uint64_t v76 = (char *)*(id *)(v73 + 8 * v75 + 32);
      }
      a1 = v76;
      unint64_t v77 = v75 + 1;
      if (__OFADD__(v75, 1)) {
        break;
      }
      char v78 = (Swift::Int *)&v76[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
      swift_beginAccess();
      UIType.init(rawValue:)(*v78);
      if (v117 == 14) {
        goto LABEL_79;
      }
      if (sub_1B588CA60(v117, a2))
      {
      }
      else
      {
        sub_1B589FCB8();
        sub_1B589FCE8();
        sub_1B589FCF8();
        sub_1B589FCC8();
        a2 = v114;
      }
      ++v75;
      if (v77 == v18)
      {
        unint64_t v79 = v118;
        uint64_t v69 = (void (*)(char *, uint64_t))v115;
        a1 = (void *)v105;
        uint64_t v74 = MEMORY[0x1E4FBC860];
        goto LABEL_55;
      }
    }
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1B589FD58();
  }
  unint64_t v79 = MEMORY[0x1E4FBC860];
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v80 = _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v79, a3);
  swift_release();
  v69(v100, v112);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v118 = (uint64_t)a1;
  sub_1B5891BD0(v80);
  unint64_t v81 = v118;
  uint64_t v118 = v74;
  if (!(v81 >> 62))
  {
    uint64_t v82 = *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v82) {
      goto LABEL_57;
    }
LABEL_74:
    swift_bridgeObjectRelease();
    uint64_t v90 = MEMORY[0x1E4FBC860];
LABEL_75:
    uint64_t v91 = *(void (**)(char *, uint64_t))(v96 + 8);
    uint64_t v92 = v113;
    v91(v107, v113);
    v91(v101, v92);
    uint64_t v93 = v112;
    v69(v110, v112);
    v69(v109, v93);
    v69(v108, v93);
    v91(v102, v92);
    return v90;
  }
  swift_bridgeObjectRetain();
  uint64_t v82 = sub_1B589FD58();
  swift_bridgeObjectRelease();
  if (!v82) {
    goto LABEL_74;
  }
LABEL_57:
  if (v82 >= 1)
  {
    uint64_t v83 = 0;
    do
    {
      if ((v81 & 0xC000000000000001) != 0) {
        id v84 = (id)MEMORY[0x1BA99FC40](v83, v81);
      }
      else {
        id v84 = *(id *)(v81 + 8 * v83 + 32);
      }
      uint64_t v85 = v84;
      id v86 = objc_allocWithZone((Class)type metadata accessor for AXMElementDetectorResult());
      id v87 = v85;
      uint64_t v88 = (void *)sub_1B5894904((uint64_t)v87);

      id v89 = v88;
      MEMORY[0x1BA99FB20]();
      if (*(void *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1B589FBB8();
      }
      ++v83;
      sub_1B589FBD8();
      sub_1B589FBA8();
    }
    while (v82 != v83);
    swift_bridgeObjectRelease();
    uint64_t v90 = v118;
    goto LABEL_75;
  }
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_1B5895944(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = *(void *)(a1 + 16);
  a2();
  uint64_t result = sub_1B589FC08();
  uint64_t v11 = result;
  if (v6)
  {
    uint64_t v8 = (unsigned __int8 *)(a1 + 32);
    do
    {
      unsigned int v9 = *v8++;
      sub_1B5891300(&v10, v9, a4);
      --v6;
    }
    while (v6);
    return v11;
  }
  return result;
}

uint64_t sub_1B58959D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a2);
    uint64_t v4 = sub_1B589FC68();
    uint64_t v5 = 0;
    uint64_t v6 = v4 + 56;
    uint64_t v7 = a1 + 32;
    while (1)
    {
      int v8 = *(unsigned __int8 *)(v7 + v5);
      sub_1B589FF08();
      sub_1B589FF18();
      uint64_t result = sub_1B589FF28();
      uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v6 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      uint64_t v15 = *(void *)(v4 + 48);
      if (((1 << v11) & v13) != 0)
      {
        if (*(unsigned __int8 *)(v15 + v11) == v8) {
          goto LABEL_3;
        }
        uint64_t v16 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v16;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v6 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          if (*(unsigned __int8 *)(v15 + v11) == v8) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v6 + 8 * v12) = v14 | v13;
      *(unsigned char *)(v15 + v11) = v8;
      uint64_t v17 = *(void *)(v4 + 16);
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18)
      {
        __break(1u);
        return result;
      }
      *(void *)(v4 + 16) = v19;
LABEL_3:
      if (++v5 == v2) {
        return v4;
      }
    }
  }
  return MEMORY[0x1E4FBC870];
}

char sub_1B5895B10(uint64_t a1)
{
  uint64_t v3 = (CGRect *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_rect);
  swift_beginAccess();
  CGFloat x = v3->origin.x;
  CGFloat y = v3->origin.y;
  CGFloat width = v3->size.width;
  CGFloat height = v3->size.height;
  int v8 = v1;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v24);
  CGFloat MinY = CGRectGetMinY(*v3);
  CGFloat v11 = CGRectGetWidth(*v3);
  CGFloat v12 = CGRectGetHeight(*v3);
  uint64_t v13 = (CGFloat *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_box];
  *uint64_t v13 = MinX;
  v13[1] = MinY;
  v13[2] = v11;
  v13[3] = v12;
  uint64_t v14 = (float *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_heat);
  swift_beginAccess();
  *(double *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_confidence] = *v14;
  uint64_t v15 = (Swift::Int *)(a1 + OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex);
  swift_beginAccess();
  Swift::Int v16 = *v15;
  if (__OFADD__(*v15, 1))
  {
    __break(1u);
    goto LABEL_5;
  }
  *(void *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_label] = *v15 + 1;
  LOBYTE(v16) = UITypeClickability.init(rawValue:)(v16);
  if (v23 == 17)
  {
LABEL_5:
    __break(1u);
    return v16;
  }
  char v22 = v23;
  uint64_t v17 = sub_1B589FB38();
  BOOL v18 = (uint64_t *)&v8[OBJC_IVAR____TtC16AXMediaUtilities29AXMClickabilityDetectorResult_labelName];
  *BOOL v18 = v17;
  v18[1] = v19;

  v21.receiver = v8;
  v21.super_class = (Class)type metadata accessor for AXMClickabilityDetectorResult();
  LOBYTE(v16) = objc_msgSendSuper2(&v21, sel_init);
  return v16;
}

uint64_t sub_1B5895CA0(void *a1, unint64_t a2, float a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C50);
  uint64_t v111 = *(void *)(v6 - 8);
  uint64_t v112 = v6;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v100 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v104 = (char *)&v95 - v10;
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  v103 = (char *)&v95 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  BOOL v110 = (char *)&v95 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  v109 = (char *)&v95 - v16;
  MEMORY[0x1F4188790](v15);
  v108 = (char *)&v95 - v17;
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C58);
  uint64_t v18 = *(void *)(v113 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v113);
  float v107 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x1F4188790](v19);
  uint64_t v101 = (char *)&v95 - v22;
  MEMORY[0x1F4188790](v21);
  uint64_t v102 = (char *)&v95 - v23;
  uint64_t v24 = sub_1B58959D0((uint64_t)&unk_1F0E6FF10, &qword_1E9D60CE8);
  swift_bridgeObjectRetain();
  unint64_t v25 = 0;
  uint64_t v26 = sub_1B58942DC((uint64_t)&unk_1F0E6FF38, v24, (uint64_t (*)(BOOL, uint64_t, uint64_t))sub_1B588FDD4);
  unint64_t v114 = v24;
  swift_bridgeObjectRelease();
  uint64_t v115 = sub_1B5895944(v26, (void (*)(void))sub_1B5899134, (uint64_t)&type metadata for UITypeClickability, &qword_1E9D60CE8);
  swift_bridgeObjectRelease();
  if (a2 >> 62) {
    goto LABEL_70;
  }
  uint64_t v27 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    CGRect v28 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v96 = v18;
    v106 = (void *)v25;
    if (v27)
    {
      if (v27 < 1)
      {
        __break(1u);
        goto LABEL_77;
      }
      CGRect v29 = a1;
      uint64_t v30 = 0;
      do
      {
        if ((a2 & 0xC000000000000001) != 0) {
          id v31 = (id)MEMORY[0x1BA99FC40](v30, a2);
        }
        else {
          id v31 = *(id *)(a2 + 8 * v30 + 32);
        }
        unint64_t v32 = v31;
        objc_msgSend(v31, sel_floatValue);
        int v34 = v33;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          CGRect v28 = sub_1B5890144(0, *((void *)v28 + 2) + 1, 1, v28);
        }
        unint64_t v36 = *((void *)v28 + 2);
        unint64_t v35 = *((void *)v28 + 3);
        if (v36 >= v35 >> 1) {
          CGRect v28 = sub_1B5890144((char *)(v35 > 1), v36 + 1, 1, v28);
        }
        ++v30;
        *((void *)v28 + 2) = v36 + 1;
        *(_DWORD *)&v28[4 * v36 + 32] = v34;
      }
      while (v27 != v30);
    }
    else
    {
      CGRect v29 = a1;
    }
    swift_bridgeObjectRelease();
    if (*((void *)v28 + 2) >= 0x11uLL) {
      uint64_t v37 = 17;
    }
    else {
      uint64_t v37 = *((void *)v28 + 2);
    }
    if (v37)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C60);
      uint64_t v38 = sub_1B589FD88();
    }
    else
    {
      uint64_t v38 = MEMORY[0x1E4FBC868];
    }
    float v39 = v29;
    v119 = (void *)v38;
    swift_bridgeObjectRetain();
    float v40 = v106;
    sub_1B5891804((uint64_t)&unk_1F0E6FF38, (uint64_t)v28, 1, &v119);
    if (v40) {
      goto LABEL_80;
    }
    swift_bridgeObjectRelease();
    v106 = v119;
    sub_1B58990F0(&qword_1E9D60C68, &qword_1E9D60C58);
    id v41 = v39;
    sub_1B589FAB8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C70);
    uint64_t v42 = swift_allocObject();
    long long v105 = xmmword_1B58AD550;
    *(_OWORD *)(v42 + 16) = xmmword_1B58AD550;
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C78);
    *(void *)(v42 + 56) = v43;
    uint64_t v44 = sub_1B58990F0(&qword_1E9D60C80, &qword_1E9D60C78);
    *(void *)(v42 + 64) = v44;
    *(void *)(v42 + 32) = 0;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C88);
    *(void *)(v42 + 96) = v45;
    uint64_t v46 = sub_1B58990F0(&qword_1E9D60C90, &qword_1E9D60C88);
    *(_OWORD *)(v42 + 72) = xmmword_1B58AD590;
    *(void *)(v42 + 136) = v43;
    *(void *)(v42 + 144) = v44;
    *(void *)(v42 + 104) = v46;
    *(void *)(v42 + 112) = 0;
    *(void *)(v42 + 176) = v43;
    *(void *)(v42 + 184) = v44;
    *(void *)(v42 + 152) = 0;
    sub_1B589FAC8();
    swift_bridgeObjectRelease();
    uint64_t v47 = swift_allocObject();
    *(_OWORD *)(v47 + 16) = v105;
    *(void *)(v47 + 56) = v43;
    *(void *)(v47 + 64) = v44;
    *(void *)(v47 + 32) = 0;
    *(void *)(v47 + 96) = v45;
    *(void *)(v47 + 104) = v46;
    *(_OWORD *)(v47 + 72) = xmmword_1B58AD5A0;
    *(void *)(v47 + 136) = v43;
    *(void *)(v47 + 144) = v44;
    *(void *)(v47 + 112) = 0;
    *(void *)(v47 + 176) = v43;
    *(void *)(v47 + 184) = v44;
    *(void *)(v47 + 152) = 0;
    sub_1B589FAC8();
    swift_bridgeObjectRelease();
    uint64_t v48 = swift_allocObject();
    *(_OWORD *)(v48 + 16) = v105;
    *(void *)(v48 + 56) = v43;
    *(void *)(v48 + 64) = v44;
    *(void *)(v48 + 32) = 0;
    *(void *)(v48 + 96) = v45;
    *(void *)(v48 + 104) = v46;
    *(_OWORD *)(v48 + 72) = xmmword_1B58AD5B0;
    *(void *)(v48 + 136) = v43;
    *(void *)(v48 + 144) = v44;
    *(void *)(v48 + 112) = 0;
    *(void *)(v48 + 176) = v43;
    *(void *)(v48 + 184) = v44;
    *(void *)(v48 + 152) = 0;
    double v49 = v110;
    sub_1B589FAC8();
    swift_bridgeObjectRelease();
    *(void *)&long long v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60C98);
    uint64_t v50 = v111;
    uint64_t v51 = *(void *)(v111 + 72);
    uint64_t v52 = *(unsigned __int8 *)(v111 + 80);
    uint64_t v53 = (v52 + 32) & ~v52;
    uint64_t v98 = v52 | 7;
    uint64_t v54 = swift_allocObject();
    long long v99 = xmmword_1B58AD530;
    *(_OWORD *)(v54 + 16) = xmmword_1B58AD530;
    id v55 = *(void (**)(uint64_t, char *, uint64_t))(v50 + 16);
    uint64_t v56 = v112;
    v55(v54 + v53, v49, v112);
    v55(v54 + v53 + v51, v108, v56);
    v119 = (void *)v54;
    uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D60CA0);
    sub_1B58990F0(&qword_1E9D60CA8, &qword_1E9D60CA0);
    a1 = (void *)sub_1B58990F0(&qword_1E9D60CB0, &qword_1E9D60C50);
    sub_1B589FA98();
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = v99;
    v55(v57 + v53, v110, v56);
    v55(v57 + v53 + v51, v109, v56);
    v119 = (void *)v57;
    sub_1B589FA98();
    int64_t v58 = v103;
    sub_1B589FAA8();
    uint64_t v59 = sub_1B58990B4(0, &qword_1E9D60CB8);
    *(void *)&long long v105 = v50 + 16;
    *(void *)&long long v99 = v55;
    v55((uint64_t)v104, v58, v56);
    uint64_t v98 = (uint64_t)a1;
    double v60 = (void *)sub_1B589FC38();
    _s16AXMediaUtilities13AXBoundingBoxC36fromClickabilityCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA06UITypeF0OSfGSdtFZ_0((int64_t)v60, v106, 0.0);
    unint64_t v25 = v61;

    unint64_t v116 = MEMORY[0x1E4FBC860];
    if (v25 >> 62)
    {
      a2 = v115;
      swift_bridgeObjectRetain();
      uint64_t v62 = sub_1B589FD58();
    }
    else
    {
      uint64_t v62 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
      a2 = v115;
      swift_bridgeObjectRetain();
    }
    uint64_t v18 = MEMORY[0x1E4FBC860];
    if (v62)
    {
      uint64_t v97 = v59;
      unint64_t v63 = 0;
      while (1)
      {
        if ((v25 & 0xC000000000000001) != 0)
        {
          int64_t v64 = (char *)MEMORY[0x1BA99FC40](v63, v25);
        }
        else
        {
          if (v63 >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_67;
          }
          int64_t v64 = (char *)*(id *)(v25 + 8 * v63 + 32);
        }
        a1 = v64;
        uint64_t v18 = v63 + 1;
        if (__OFADD__(v63, 1)) {
          break;
        }
        BOOL v65 = (Swift::Int *)&v64[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
        swift_beginAccess();
        UITypeClickability.init(rawValue:)(*v65);
        if (v118 == 17) {
          goto LABEL_78;
        }
        if (sub_1B588CA60(v118, a2))
        {
        }
        else
        {
          sub_1B589FCB8();
          sub_1B589FCE8();
          sub_1B589FCF8();
          sub_1B589FCC8();
          a2 = v115;
        }
        ++v63;
        if (v18 == v62)
        {
          unint64_t v66 = v116;
          uint64_t v18 = MEMORY[0x1E4FBC860];
          goto LABEL_39;
        }
      }
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    unint64_t v66 = MEMORY[0x1E4FBC860];
LABEL_39:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = (void *)_s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v66, a3);
    swift_release();
    uint64_t v67 = v112;
    uint64_t v68 = v111 + 8;
    uint64_t v69 = *(void (**)(char *, uint64_t))(v111 + 8);
    v69(v103, v112);
    swift_bridgeObjectRelease();
    long long v70 = v100;
    sub_1B589FAA8();
    ((void (*)(char *, char *, uint64_t))v99)(v104, v70, v67);
    uint64_t v71 = (void *)sub_1B589FC38();
    _s16AXMediaUtilities13AXBoundingBoxC36fromClickabilityCenterNetPredictions4pred10thresholds9timestampSayACGSo12MLMultiArrayC_SDyAA06UITypeF0OSfGSdtFZ_0((int64_t)v71, v106, 0.0);
    unint64_t v73 = v72;

    uint64_t v118 = v18;
    if (v73 >> 62)
    {
      a2 = v114;
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_1B589FD58();
    }
    else
    {
      uint64_t v18 = *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10);
      a2 = v114;
      swift_bridgeObjectRetain();
    }
    uint64_t v74 = MEMORY[0x1E4FBC860];
    if (!v18) {
      break;
    }
    *(void *)&long long v105 = a1;
    uint64_t v115 = (uint64_t)v69;
    uint64_t v111 = v68;
    unint64_t v75 = 0;
    unint64_t v25 = v73 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      if ((v73 & 0xC000000000000001) != 0)
      {
        uint64_t v76 = (char *)MEMORY[0x1BA99FC40](v75, v73);
      }
      else
      {
        if (v75 >= *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_69;
        }
        uint64_t v76 = (char *)*(id *)(v73 + 8 * v75 + 32);
      }
      a1 = v76;
      unint64_t v77 = v75 + 1;
      if (__OFADD__(v75, 1)) {
        break;
      }
      char v78 = (Swift::Int *)&v76[OBJC_IVAR____TtC16AXMediaUtilities13AXBoundingBox_classIndex];
      swift_beginAccess();
      UITypeClickability.init(rawValue:)(*v78);
      if (v117 == 17) {
        goto LABEL_79;
      }
      if (sub_1B588CA60(v117, a2))
      {
      }
      else
      {
        sub_1B589FCB8();
        sub_1B589FCE8();
        sub_1B589FCF8();
        sub_1B589FCC8();
        a2 = v114;
      }
      ++v75;
      if (v77 == v18)
      {
        unint64_t v79 = v118;
        uint64_t v69 = (void (*)(char *, uint64_t))v115;
        a1 = (void *)v105;
        uint64_t v74 = MEMORY[0x1E4FBC860];
        goto LABEL_55;
      }
    }
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
LABEL_70:
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_1B589FD58();
  }
  unint64_t v79 = MEMORY[0x1E4FBC860];
LABEL_55:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v80 = _s16AXMediaUtilities13AXBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v79, a3);
  swift_release();
  v69(v100, v112);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v118 = (uint64_t)a1;
  sub_1B5891BD0(v80);
  unint64_t v81 = v118;
  uint64_t v118 = v74;
  if (!(v81 >> 62))
  {
    uint64_t v82 = *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v82) {
      goto LABEL_57;
    }
LABEL_74:
    swift_bridgeObjectRelease();
    uint64_t v90 = MEMORY[0x1E4FBC860];
LABEL_75:
    uint64_t v91 = *(void (**)(char *, uint64_t))(v96 + 8);
    uint64_t v92 = v113;
    v91(v107, v113);
    v91(v101, v92);
    uint64_t v93 = v112;
    v69(v110, v112);
    v69(v109, v93);
    v69(v108, v93);
    v91(v102, v92);
    return v90;
  }
  swift_bridgeObjectRetain();
  uint64_t v82 = sub_1B589FD58();
  swift_bridgeObjectRelease();
  if (!v82) {
    goto LABEL_74;
  }
LABEL_57:
  if (v82 >= 1)
  {
    uint64_t v83 = 0;
    do
    {
      if ((v81 & 0xC000000000000001) != 0) {
        id v84 = (id)MEMORY[0x1BA99FC40](v83, v81);
      }
      else {
        id v84 = *(id *)(v81 + 8 * v83 + 32);
      }
      uint64_t v85 = v84;
      id v86 = objc_allocWithZone((Class)type metadata accessor for AXMClickabilityDetectorResult());
      id v87 = v85;
      uint64_t v88 = (void *)sub_1B5895B10((uint64_t)v87);

      id v89 = v88;
      MEMORY[0x1BA99FB20]();
      if (*(void *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v118 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1B589FBB8();
      }
      ++v83;
      sub_1B589FBD8();
      sub_1B589FBA8();
    }
    while (v82 != v83);
    swift_bridgeObjectRelease();
    uint64_t v90 = v118;
    goto LABEL_75;
  }
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

unint64_t sub_1B5896B50()
{
  unint64_t result = qword_1E9D61880;
  if (!qword_1E9D61880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D61880);
  }
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_1B5896BB8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1B5896C00(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D60B30);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B5896C64(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9D60B50);
    sub_1B58990F0(a2, &qword_1E9D60B40);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for AXMElementDetectorResult()
{
  return self;
}

unint64_t sub_1B5896D10()
{
  unint64_t result = qword_1E9D61888;
  if (!qword_1E9D61888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D61888);
  }
  return result;
}

uint64_t type metadata accessor for AXMClickabilityDetectorResult()
{
  return self;
}

unint64_t sub_1B5896D88()
{
  unint64_t result = qword_1E9D61890[0];
  if (!qword_1E9D61890[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D61890);
  }
  return result;
}

uint64_t sub_1B5896DDC()
{
  return sub_1B5896BB8(&qword_1E9D60C08, MEMORY[0x1E4F27990]);
}

unint64_t sub_1B5896E28()
{
  unint64_t result = qword_1E9D60C10;
  if (!qword_1E9D60C10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D60C10);
  }
  return result;
}

uint64_t sub_1B5896E7C()
{
  return sub_1B58990F0(&qword_1E9D60C18, &qword_1E9D60C20);
}

unint64_t sub_1B5896EBC()
{
  unint64_t result = qword_1E9D60C28;
  if (!qword_1E9D60C28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D60C28);
  }
  return result;
}

uint64_t sub_1B5896F10()
{
  return sub_1B58990F0(&qword_1E9D60C30, &qword_1E9D60C38);
}

uint64_t sub_1B5896F4C()
{
  return MEMORY[0x1E4FBB060];
}

unint64_t sub_1B5896F5C()
{
  unint64_t result = qword_1E9D60C40;
  if (!qword_1E9D60C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D60C40);
  }
  return result;
}

uint64_t sub_1B5896FB0()
{
  return type metadata accessor for AXBoundingBox();
}

uint64_t sub_1B5896FB8()
{
  uint64_t result = sub_1B589FA88();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for AXBoundingBox(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AXBoundingBox);
}

uint64_t dispatch thunk of AXBoundingBox.__allocating_init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of AXBoundingBox.id.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AXBoundingBox.id.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AXBoundingBox.id.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AXBoundingBox.heat.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AXBoundingBox.heat.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AXBoundingBox.heat.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AXBoundingBox.angle.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AXBoundingBox.angle.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AXBoundingBox.angle.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AXBoundingBox.center.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AXBoundingBox.center.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AXBoundingBox.center.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AXBoundingBox.size.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AXBoundingBox.size.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AXBoundingBox.size.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AXBoundingBox.rect.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x130))();
}

uint64_t dispatch thunk of AXBoundingBox.rect.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of AXBoundingBox.rect.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of AXBoundingBox.classIndex.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of AXBoundingBox.classIndex.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of AXBoundingBox.classIndex.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x158))();
}

uint64_t dispatch thunk of AXBoundingBox.heatByClass.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of AXBoundingBox.heatByClass.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x168))();
}

uint64_t dispatch thunk of AXBoundingBox.heatByClass.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of AXBoundingBox.firstSeen.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x178))();
}

uint64_t dispatch thunk of AXBoundingBox.firstSeen.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of AXBoundingBox.firstSeen.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x188))();
}

uint64_t dispatch thunk of AXBoundingBox.lastSeen.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of AXBoundingBox.lastSeen.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x198))();
}

uint64_t dispatch thunk of AXBoundingBox.lastSeen.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of AXBoundingBox.depth.getter()
{
  unint64_t v1 = (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of AXBoundingBox.depth.setter(unint64_t a1)
{
  return (*(uint64_t (**)(unint64_t))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x1B0))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of AXBoundingBox.depth.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of AXBoundingBox.centroid3d.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of AXBoundingBox.centroid3d.setter(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))((*MEMORY[0x1E4FBC8C8] & *v3) + 0x1C8))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of AXBoundingBox.centroid3d.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AXBoundingBox.knownFeaturePoints.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of AXBoundingBox.knownFeaturePoints.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of AXBoundingBox.knownFeaturePoints.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AXBoundingBox.physicalSize.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AXBoundingBox.physicalSize.setter(uint64_t a1, char a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x1E4FBC8C8] & *v2) + 0x1F8))(a1, a2 & 1);
}

uint64_t dispatch thunk of AXBoundingBox.physicalSize.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of AXBoundingBox.iou(other:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x208))();
}

uint64_t dispatch thunk of AXBoundingBox.scale(xScale:yScale:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of AXBoundingBox.flipXY()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x218))();
}

uint64_t dispatch thunk of AXBoundingBox.makeSquare()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x220))();
}

uint64_t dispatch thunk of AXBoundingBox.transformed(by:)(_OWORD *a1)
{
  uint64_t v2 = *(uint64_t (**)(_OWORD *))((*MEMORY[0x1E4FBC8C8] & *v1) + 0x228);
  long long v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a1[2];
  return v2(v5);
}

uint64_t dispatch thunk of AXBoundingBox.lerp(to:amount:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x230))();
}

uint64_t dispatch thunk of static AXBoundingBox.postCompute(decoded:nmsThreshold:filterThresholds:)()
{
  return (*(uint64_t (**)(void))(v0 + 568))();
}

uint64_t dispatch thunk of static AXBoundingBox.postComputeClickability(decoded:nmsThreshold:filterThresholds:)()
{
  return (*(uint64_t (**)(void))(v0 + 576))();
}

uint64_t dispatch thunk of AXBoundingBox.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of AXBoundingBox.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 592))();
}

uint64_t getEnumTagSinglePayload for UIType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UIType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B5897E78);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIType()
{
  return &type metadata for UIType;
}

uint64_t getEnumTagSinglePayload for UITypeClickability(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for UITypeClickability(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *uint64_t result = a2 + 16;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B5898010);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UITypeClickability()
{
  return &type metadata for UITypeClickability;
}

uint64_t method lookup function for AXMElementDetectorResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AXMElementDetectorResult);
}

uint64_t dispatch thunk of AXMElementDetectorResult.__allocating_init(boundingBox:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultBox()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultLabel()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultLabelName()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.resultConfidence()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXMElementDetectorResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t method lookup function for AXMClickabilityDetectorResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AXMClickabilityDetectorResult);
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.__allocating_init(boundingBox:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.resultBox()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.resultLabel()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.resultLabelName()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.resultConfidence()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.encode(to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AXMClickabilityDetectorResult.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

ValueMetadata *type metadata accessor for AXModelType()
{
  return &type metadata for AXModelType;
}

ValueMetadata *type metadata accessor for AXMClickabilityDetectorResult.CodingKeys()
{
  return &type metadata for AXMClickabilityDetectorResult.CodingKeys;
}

uint64_t _s16AXMediaUtilities29AXMClickabilityDetectorResultC10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s16AXMediaUtilities29AXMClickabilityDetectorResultC10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B58984A4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXMElementDetectorResult.CodingKeys()
{
  return &type metadata for AXMElementDetectorResult.CodingKeys;
}

uint64_t sub_1B58984DC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1B5898510(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B5898530(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AXBoundingBox.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AXBoundingBox.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1B58986B8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

uint64_t sub_1B58986E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B58986E8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXBoundingBox.CodingKeys()
{
  return &type metadata for AXBoundingBox.CodingKeys;
}

unint64_t sub_1B5898704()
{
  unint64_t result = qword_1E9D623A0[0];
  if (!qword_1E9D623A0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D623A0);
  }
  return result;
}

unint64_t sub_1B589875C()
{
  unint64_t result = qword_1E9D625B0[0];
  if (!qword_1E9D625B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D625B0);
  }
  return result;
}

unint64_t sub_1B58987B4()
{
  unint64_t result = qword_1E9D627C0[0];
  if (!qword_1E9D627C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D627C0);
  }
  return result;
}

unint64_t sub_1B589880C()
{
  unint64_t result = qword_1E9D628D0;
  if (!qword_1E9D628D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D628D0);
  }
  return result;
}

unint64_t sub_1B5898864()
{
  unint64_t result = qword_1E9D628D8[0];
  if (!qword_1E9D628D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D628D8);
  }
  return result;
}

unint64_t sub_1B58988BC()
{
  unint64_t result = qword_1E9D62960;
  if (!qword_1E9D62960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D62960);
  }
  return result;
}

unint64_t sub_1B5898914()
{
  unint64_t result = qword_1E9D62968[0];
  if (!qword_1E9D62968[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D62968);
  }
  return result;
}

unint64_t sub_1B589896C()
{
  unint64_t result = qword_1E9D629F0;
  if (!qword_1E9D629F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D629F0);
  }
  return result;
}

unint64_t sub_1B58989C4()
{
  unint64_t result = qword_1E9D629F8[0];
  if (!qword_1E9D629F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9D629F8);
  }
  return result;
}

uint64_t sub_1B5898A18(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1952540008 && a2 == 0xE400000000000000 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C676E61 && a2 == 0xE500000000000000 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1952671090 && a2 == 0xE400000000000000 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x646E497373616C63 && a2 == 0xEA00000000007865 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C43794274616568 && a2 == 0xEB00000000737361 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6565537473726966 && a2 == 0xE90000000000006ELL || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6565537473616CLL && a2 == 0xE800000000000000 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6874706564 && a2 == 0xE500000000000000 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x64696F72746E6563 && a2 == 0xEA00000000006433 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001B58BDBF0 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6C61636973796870 && a2 == 0xEC000000657A6953)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v6 = sub_1B589FEA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_1B5898EF8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v2 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D614E6C6562616CLL && a2 == 0xE900000000000065 || (sub_1B589FEA8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_1B589FEA8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_1B58990B4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B58990F0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1B5899134()
{
  unint64_t result = qword_1E9D60CE0;
  if (!qword_1E9D60CE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D60CE0);
  }
  return result;
}

unint64_t sub_1B5899188()
{
  unint64_t result = qword_1E9D60D00;
  if (!qword_1E9D60D00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9D60D00);
  }
  return result;
}

uint64_t sub_1B58991DC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1B58991FC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_1B589924C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t __getRPScreenRecorderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMAssetManager _modelAssetURLsOfType:sources:compiled:](v0);
}

uint64_t __getVNDetectHorizonRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMVisionFeatureColorInfo setMainColors:weights:](v0);
}

uint64_t __getVNDetectFaceExpressionsRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNCreateFaceprintRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNCreateFaceprintRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNClassifyFaceAttributesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFaceLandmarksRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNDetectFacePoseRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFacePoseRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNDetectFaceRectanglesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMImageAestheticsNode validateVisionKitSoftLinkSymbols](v0);
}

uint64_t __getVNClassifyImageAestheticsRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __27__AXMService_xpcConnection__block_invoke_71_cold_1(v0);
}

uint64_t __getMLModelClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNCoreMLModelClass_block_invoke_cold_1(v0);
}

uint64_t __getVNCoreMLModelClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNClassificationObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNClassificationObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNCoreMLRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNCoreMLRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMTraitDetectorNode validateVisionKitSoftLinkSymbols](v0);
}

uint64_t __getVNImageScoreObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNImageBrightnessObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageBrightnessObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNImageBlurObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageBlurObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNImageBlurScoreRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageBlurScoreRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMMobileAssetEvaluationNode mlModelClasses](v0);
}

uint64_t __getVNImageRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMindNetNetwork processVImage:inputIsBGR:](v0);
}

uint64_t ___ZL15getUIImageClassv_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMCameraFrameContext motionCorrectedNormalizedFrame:targetAttitude:targetZoomFactor:interfaceOrientation:mirrored:](v0);
}

uint64_t __getVNRecognizeTextRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMTaskDispatcher _queue_processNextTask](v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHAssetClass_block_invoke_cold_1(v0);
}

uint64_t __getPHAssetClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHImageManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getPHImageManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHImageRequestOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getPHImageRequestOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMRectangleDetectorNode validateVisionKitSoftLinkSymbols](v0);
}

uint64_t __getVNDetectRectanglesRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMSpeechComponent handleRequest:completion:](v0);
}

uint64_t __getPFSceneTaxonomyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMNSFWDetectorNode validateVisionKitSoftLinkSymbols](v0);
}

uint64_t __getVNVYvzEtX1JlUdu8xx5qhDIClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[AXMGeometryUtilities motionCorrectedNormalizedFrame:fromAttitude:fromFieldOfViewX:fromFieldOfViewY:toAttitude:toFieldOfViewX:toFieldOfViewY:interfaceOrientation:mirrored:](v0);
}

uint64_t __getVNSequenceRequestHandlerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[AXMObjectDetectorNode possibleObjectClassifications](v0);
}

uint64_t __getVNRecognizeObjectsRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMAXElementDetectorNode _initializeClickabilityModel](v0);
}

uint64_t __getVNDetectContoursRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMImageRegistrationNode validateVisionKitSoftLinkSymbols](v0);
}

uint64_t __getVNTranslationalImageRegistrationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNImageTranslationAlignmentObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNImageTranslationAlignmentObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMScreenRecognitionCenter _processVisionResult:options:coagulator:](v0);
}

uint64_t __getVNCreateSceneprintRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMMediaAnalysisTextDetectorNode processResults:context:metrics:textDetectionLocales:textDetectionOptions:requestID:error:](v0);
}

uint64_t __getMADVIDocumentRecognitionResultClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADVIDocumentRecognitionRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getMADVIDocumentRecognitionRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMDataSonifier renderSonification](v0);
}

void UIAccessibilityAddMetadataDescriptionToVideo_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void UIAccessibilityAddMetadataDescriptionToVideo_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void UIAccessibilityAddMetadataDescriptionToVideo_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void UIAccessibilityMetadataDescriptionForImage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void UIAccessibilityAddMetadataDescriptionToImage_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getUIScreenClass_block_invoke_cold_1()
{
  uint64_t v0 = (uint8_t *)abort_report_np();
  return -[AXMMediaAnalysisSceneDetectorNode evaluate:metrics:](v0, v1, v2);
}

uint64_t __getMADVISceneClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADVISceneClassificationResultClass_block_invoke_cold_1(v0);
}

uint64_t __getMADVISceneClassificationResultClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMProminentObjectsDetectorNode validateVisionKitSoftLinkSymbols](v0);
}

uint64_t __getVNGenerateAttentionBasedSaliencyImageRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMEvaluationNode evaluateRequests:withContext:requestHandlerOptions:metrics:error:](v0);
}

uint64_t __getVNRecognizedTextClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return [(AXMVisionFaceNameHelper *)v0 photoLibraryWithURL:v2];
}

uint64_t __getVCPMediaAnalyzerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPHPhotoLibraryClass_block_invoke_cold_1_0(v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1_0()
{
  uint64_t v0 = abort_report_np();
  return __getPHPersonClass_block_invoke_cold_1(v0);
}

uint64_t __getPHPersonClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMVisionFeatureFaceLandmarks encodeWithCoder:](v0);
}

uint64_t __getVNFaceLandmarks2DClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __27__AXMOutputManager_disable__block_invoke_cold_1(v0);
}

uint64_t __getVCPMediaAnalysisServiceClass_block_invoke_cold_1()
{
  return __getMADImageCaptionRequestClass_block_invoke_cold_1();
}

uint64_t __getMADImageCaptionRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADCaptionResultClass_block_invoke_cold_1(v0);
}

uint64_t __getMADCaptionResultClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](v0);
}

uint64_t __getMADVIFaceRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADVIFaceResultClass_block_invoke_cold_1(v0);
}

uint64_t __getMADVIFaceResultClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMADServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getMADServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __43__AXMCaptionDetectorNode_evaluate_metrics___block_invoke_cold_1(v0);
}

uint64_t __getVNSceneClassificationRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AXMSoundComponent transitionToState:completion:](v0);
}

uint64_t __getVN6Mb1ME89lyW3HpahkEygIGClass_block_invoke_cold_1()
{
  int v0 = abort_report_np();
  return AXMWorkingDirectory_cold_1(v0, v1, v2);
}

void AXMWorkingDirectory_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Failed to create AXMediaUtilities working directory at path: %@. error: %@", (uint8_t *)&v3, 0x16u);
}

void _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Unable to create security task for checking entitlement %@", (uint8_t *)&v2, 0xCu);
}

void _AXMCopyValueForEntitlementUsingTaskCreationBlock_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Unable to get entitlements for client task. Error: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_1B589FA78()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1B589FA88()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1B589FA98()
{
  return MEMORY[0x1F40DB6A8]();
}

uint64_t sub_1B589FAA8()
{
  return MEMORY[0x1F40DB6D8]();
}

uint64_t sub_1B589FAB8()
{
  return MEMORY[0x1F40DB710]();
}

uint64_t sub_1B589FAC8()
{
  return MEMORY[0x1F40DB730]();
}

uint64_t sub_1B589FAD8()
{
  return MEMORY[0x1F4183308]();
}

uint64_t sub_1B589FAE8()
{
  return MEMORY[0x1F4183520]();
}

uint64_t sub_1B589FAF8()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1B589FB08()
{
  return MEMORY[0x1F4183808]();
}

uint64_t sub_1B589FB18()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B589FB28()
{
  return MEMORY[0x1F40E6228]();
}

uint64_t sub_1B589FB38()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1B589FB48()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B589FB58()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1B589FB68()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_1B589FB78()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1B589FB88()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1B589FB98()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1B589FBA8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1B589FBB8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1B589FBC8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1B589FBD8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1B589FBE8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1B589FBF8()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1B589FC08()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1B589FC18()
{
  return MEMORY[0x1F40E6468]();
}

uint64_t sub_1B589FC28()
{
  return MEMORY[0x1F4184278]();
}

uint64_t sub_1B589FC38()
{
  return MEMORY[0x1F40DB790]();
}

uint64_t sub_1B589FC48()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1B589FC58()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1B589FC68()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1B589FC78()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1B589FC88()
{
  return MEMORY[0x1F4184D10]();
}

uint64_t sub_1B589FC98()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1B589FCA8()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1B589FCB8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1B589FCC8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1B589FCD8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1B589FCE8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1B589FCF8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1B589FD08()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1B589FD18()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1B589FD28()
{
  return MEMORY[0x1F41852C0]();
}

uint64_t sub_1B589FD38()
{
  return MEMORY[0x1F41852C8]();
}

uint64_t sub_1B589FD48()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1B589FD58()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1B589FD68()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1B589FD78()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1B589FD88()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1B589FD98()
{
  return MEMORY[0x1F4185510]();
}

uint64_t sub_1B589FDA8()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1B589FDB8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1B589FDC8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1B589FDD8()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1B589FDE8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1B589FDF8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1B589FE08()
{
  return MEMORY[0x1F4185640]();
}

uint64_t sub_1B589FE18()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1B589FE28()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1B589FE38()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1B589FE48()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1B589FE58()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1B589FE68()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1B589FE78()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1B589FE88()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1B589FE98()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1B589FEA8()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B589FEB8()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1B589FEC8()
{
  return MEMORY[0x1F4185D80]();
}

uint64_t sub_1B589FED8()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1B589FEE8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1B589FEF8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1B589FF08()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B589FF18()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B589FF28()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1B589FF38()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1B589FF48()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t AXCPSharedResourcesDirectory()
{
  return MEMORY[0x1F41787D0]();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x1F4105EA8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x1F4105EE0]();
}

uint64_t AXLogAssetLoader()
{
  return MEMORY[0x1F4105FB0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogDisplay()
{
  return MEMORY[0x1F4105FE8]();
}

uint64_t AXMediaLogCaptionDescriptions()
{
  return MEMORY[0x1F41060F0]();
}

uint64_t AXMediaLogCommon()
{
  return MEMORY[0x1F41060F8]();
}

uint64_t AXMediaLogDiagnostics()
{
  return MEMORY[0x1F4106100]();
}

uint64_t AXMediaLogElementVision()
{
  return MEMORY[0x1F4106108]();
}

uint64_t AXMediaLogEngineCache()
{
  return MEMORY[0x1F4106110]();
}

uint64_t AXMediaLogEnginePriority()
{
  return MEMORY[0x1F4106118]();
}

uint64_t AXMediaLogHaptics()
{
  return MEMORY[0x1F4106120]();
}

uint64_t AXMediaLogLanguageTranslation()
{
  return MEMORY[0x1F4106128]();
}

uint64_t AXMediaLogMLElement()
{
  return MEMORY[0x1F4106130]();
}

uint64_t AXMediaLogOCR()
{
  return MEMORY[0x1F4106138]();
}

uint64_t AXMediaLogOutput()
{
  return MEMORY[0x1F4106140]();
}

uint64_t AXMediaLogResults()
{
  return MEMORY[0x1F4106148]();
}

uint64_t AXMediaLogScreenGrab()
{
  return MEMORY[0x1F4106150]();
}

uint64_t AXMediaLogService()
{
  return MEMORY[0x1F4106158]();
}

uint64_t AXMediaLogSettings()
{
  return MEMORY[0x1F4106160]();
}

uint64_t AXMediaLogSounds()
{
  return MEMORY[0x1F4106168]();
}

uint64_t AXMediaLogSpeech()
{
  return MEMORY[0x1F4106170]();
}

uint64_t AXMediaLogTextLayout()
{
  return MEMORY[0x1F4106178]();
}

uint64_t AXMediaLogTextProcessing()
{
  return MEMORY[0x1F4106180]();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return MEMORY[0x1F4106240]();
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  return MEMORY[0x1F4106250]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1F4106310]();
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x1F40D4EF8](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, *(void *)&inBufferOffsetInFrames, inValue);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x1F40F4A90]();
  return result;
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x1F40F4CC0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1F40D9890]();
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x1F40DA2E8](provider);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA320](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DA870](image);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

BOOL CGImageDestinationCopyImageSource(CGImageDestinationRef idst, CGImageSourceRef isrc, CFDictionaryRef options, CFErrorRef *err)
{
  return MEMORY[0x1F40E9728](idst, isrc, options, err);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA920](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1F40E97C8]();
}

BOOL CGImageMetadataSetValueMatchingImageProperty(CGMutableImageMetadataRef metadata, CFStringRef dictionaryName, CFStringRef propertyName, CFTypeRef value)
{
  return MEMORY[0x1F40E9828](metadata, dictionaryName, propertyName, value);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99A8](provider, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x1F40DB1F8](t, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD00](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1F412A6A8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1F412A6D8]();
}

uint64_t LXEntryGetPartialProbability()
{
  return MEMORY[0x1F412A6E0]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1F412A6F0]();
}

uint64_t LXEntryGetUsageCount()
{
  return MEMORY[0x1F412A708]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1F412A768]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x1F412A788]();
}

CFStringRef MAImageCaptioningCopyCaption(CFURLRef url, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40ED058](url, error);
}

BOOL MAImageCaptioningSetCaption(CFURLRef url, CFStringRef string, CFErrorRef *error)
{
  return MEMORY[0x1F40ED060](url, string, error);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x1F40DEE50](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x1F40DEE60](inTagClass, inTag, inConformingToUTI);
}

OSStatus VTPixelRotationSessionCreate(CFAllocatorRef allocator, VTPixelRotationSessionRef *pixelRotationSessionOut)
{
  return MEMORY[0x1F4103490](allocator, pixelRotationSessionOut);
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034A8](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t _AXSystemRootDirectory()
{
  return MEMORY[0x1F4179258]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::exception::~exception(std::exception *this)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1F40CB3E0](a1, a2, *(void *)&a3);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x1F40D1738]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x1F40D1748]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x1F4118718]();
}

uint64_t espresso_network_change_input_blob_shapes()
{
  return MEMORY[0x1F4118738]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1F4118788]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1F41187F8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

void syslog(int a1, const char *a2, ...)
{
}

long double tan(long double __x)
{
  MEMORY[0x1F40CE420](__x);
  return result;
}

void vDSP_mmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x1F40D2278](dest, color, *(void *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1F40D22A0](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCVPixelBuffer(vImage_Buffer *buffer, vImage_CGImageFormat *desiredFormat, CVPixelBufferRef cvPixelBuffer, vImageCVImageFormatRef cvImageFormat, const CGFloat *backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D22C8](buffer, desiredFormat, cvPixelBuffer, cvImageFormat, backgroundColor, *(void *)&flags);
}

vImageCVImageFormatRef vImageCVImageFormat_Create(uint32_t imageFormatType, const vImage_ARGBToYpCbCrMatrix *matrix, CFStringRef cvImageBufferChromaLocation, CGColorSpaceRef baseColorspace, int alphaIsOneHint)
{
  return (vImageCVImageFormatRef)MEMORY[0x1F40D2320](*(void *)&imageFormatType, matrix, cvImageBufferChromaLocation, baseColorspace, *(void *)&alphaIsOneHint);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C48](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CD8](src, dest, tempBuffer, *(void *)&flags);
}