void sub_1DCC93190(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DCC932D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CF<CGColorSpace *>::~CF((const void **)va);
  _Unwind_Resume(a1);
}

const void **CF<CGColorSpace *>::~CF(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1DCC936BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVUWGalleryPersonalizationOptionsClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisualUnderstandingLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisualUnderstandingLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD0E8;
    uint64_t v6 = 0;
    VisualUnderstandingLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!VisualUnderstandingLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("VUWGalleryPersonalizationOptions");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__getVUWGalleryPersonalizationOptionsClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVUWGalleryPersonalizationOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisualUnderstandingLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisualUnderstandingLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DCC93CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC93DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC93E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC93F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC94108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, const void *);
  CF<CGColorSpace *>::~CF((const void **)va);
  CF<CGColorSpace *>::~CF((const void **)va1);
  _Unwind_Resume(a1);
}

const void **CF<CGImage *>::operator=(const void **a1, const void **a2)
{
  v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = *a2;
  *a2 = 0;
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void sub_1DCC96780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC968E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC969C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCC96B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC96C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC96DD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC96EAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC96F80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC97A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC97B90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC97C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCC97D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC97EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC98114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC982A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9840C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9858C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC98648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC986CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC98780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC98A68(_Unwind_Exception *a1)
{
  CF<CGColorSpace *>::~CF((const void **)(v1 - 72));
  _Unwind_Resume(a1);
}

void *SurfaceGetBytePointerCallback(__IOSurface *a1)
{
  if (!a1)
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      SurfaceGetBytePointerCallback(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 0;
  }
  if (IOSurfaceLock(a1, 1u, 0))
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      SurfaceGetBytePointerCallback(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return 0;
  }
  return IOSurfaceGetBaseAddress(a1);
}

{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t vars8;

  if (!a1)
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      SurfaceGetBytePointerCallback(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 0;
  }
  if (IOSurfaceLock(a1, 1u, 0))
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      SurfaceGetBytePointerCallback(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return 0;
  }
  return IOSurfaceGetBaseAddress(a1);
}

{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t vars8;

  if (!a1)
  {
    BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v10) {
      SurfaceGetBytePointerCallback(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 0;
  }
  if (IOSurfaceLock(a1, 1u, 0))
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      SurfaceGetBytePointerCallback(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return 0;
  }
  return IOSurfaceGetBaseAddress(a1);
}

void SurfaceReleaseBytePointerCallback(__IOSurface *a1, const void *a2)
{
  if (a1)
  {
    IOSurfaceUnlock(a1, 1u, 0);
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v3) {
      SurfaceReleaseBytePointerCallback(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1)
  {
    IOSurfaceUnlock(a1, 1u, 0);
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v3) {
      SurfaceReleaseBytePointerCallback(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a1)
  {
    IOSurfaceUnlock(a1, 1u, 0);
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v3) {
      SurfaceReleaseBytePointerCallback(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void SurfaceReleaseInfoCallback(void *a1)
{
  if (a1)
  {
    CFRelease(a1);
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      SurfaceReleaseInfoCallback(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    CFRelease(a1);
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      SurfaceReleaseInfoCallback(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1)
  {
    CFRelease(a1);
  }
  else
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      SurfaceReleaseInfoCallback(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1DCC98EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFResultSectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SearchFoundationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SearchFoundationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD120;
    uint64_t v6 = 0;
    SearchFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!SearchFoundationLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("SFResultSection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getSFResultSectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFResultSectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchFoundationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SearchFoundationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DCC99D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC99DC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC99E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC99F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9A374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9A3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9A488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9A584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9A630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9A7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9AA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9AAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9AB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9AC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9AD20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9AEB4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCC9AF6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9B01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9B08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9B14C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9B2BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9B454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9BE94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9BF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9BFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9C088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9C370(_Unwind_Exception *a1)
{
  CF<CGColorSpace *>::~CF((const void **)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1DCC9C6A8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCC9C758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9C838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCC9DF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCC9E4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIBarcodeDescriptorClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __CoreImageLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD180;
    uint64_t v6 = 0;
    CoreImageLibraryCore_frameworkLibrary = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!CoreImageLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("CIBarcodeDescriptor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getCIBarcodeDescriptorClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCIBarcodeDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreImageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreImageLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getVNBarcodeObservationClass_block_invoke(uint64_t a1)
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
    long long v5 = xmmword_1E6CAD198;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
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
    Class result = objc_getClass("VNBarcodeObservation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNBarcodeObservationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNBarcodeObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1DCCA05F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNFaceprintClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD1B0;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("VNFaceprint");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNFaceprintClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNFaceprintClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1DCCA22E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA235C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA23EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA249C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MADService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1DCCA2850(_Unwind_Exception *a1)
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

void sub_1DCCA2BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1DCCA2ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA34EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__69(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E01AAEE0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__70(uint64_t a1)
{
}

void sub_1DCCA370C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3A64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA3D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA4290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  CF<CGColorSpace *>::~CF((const void **)(v17 - 144));
  _Unwind_Resume(a1);
}

void sub_1DCCA43BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA45A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CGImage_CreateCVPixelBufferWithTransform(CGImage *a1, __CVBuffer **a2, unsigned int a3, CGImagePropertyOrientation a4, double a5)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  *a2 = 0;
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v64.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v64.c = v10;
  *(_OWORD *)&v64.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (a5 > 0.0 && a5 <= 1.0)
  {
    size_t v11 = Height;
    if (a5 < 1.0)
    {
      size_t v22 = (unint64_t)((double)Width * a5) & 0xFFFFFFFFFFFFFFFELL;
      size_t v21 = (unint64_t)((double)Height * a5) & 0xFFFFFFFFFFFFFFFELL;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = Width;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v66 = (unint64_t)((double)Width * a5) & 0xFFFFFFFFFFFFFFFELL;
        __int16 v67 = 2048;
        size_t v68 = v21;
        _os_log_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[CGImage->CVPixelBuffer] Downscaling %zux%zu --> %zux%zu", buf, 0x2Au);
      }
    }
    else
    {
      size_t v21 = Height;
      size_t v22 = Width;
    }
    CFTypeRef cf = 0;
    ColorSpace = CGImageGetColorSpace(a1);
    v24 = ColorSpace;
    OSType v25 = 1111970369;
    if (ColorSpace)
    {
      if (CGColorSpaceSupportsOutput(ColorSpace))
      {
        size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v24);
        if (NumberOfComponents == 1) {
          uint32_t v27 = 0;
        }
        else {
          uint32_t v27 = 8194;
        }
        if (NumberOfComponents == 1) {
          OSType v25 = 1278226488;
        }
        else {
          OSType v25 = 1111970369;
        }
      }
      else
      {
        uint32_t v27 = 8194;
      }
      if (CGColorSpaceSupportsOutput(v24) && !CGColorSpaceUsesExtendedRange(v24)) {
        goto LABEL_23;
      }
    }
    else
    {
      uint32_t v27 = 8194;
    }
    v24 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    CFTypeRef cf = v24;
    *(void *)buf = 0;
    CF<CGColorSpace *>::~CF((const void **)buf);
LABEL_23:
    value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryRef pixelBufferAttributes = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(pixelBufferAttributes, (const void *)*MEMORY[0x1E4F24D20], value);
    CVPixelBufferRef pixelBufferOut = 0;
    CVPixelBufferCreate(0, v22, v21, v25, pixelBufferAttributes, &pixelBufferOut);
    if (pixelBufferOut)
    {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A00], v24, kCVAttachmentMode_ShouldPropagate);
      *(_DWORD *)buf = 0;
      *(void *)&buf[8] = pixelBufferOut;
      *(void *)&buf[16] = 0;
      if (pixelBufferOut)
      {
        uint64_t v20 = CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
        *(_DWORD *)buf = v20;
        if (!v20
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (*(_DWORD *)v69 = 134218240,
              *(void *)&v69[4] = *(void *)&buf[8],
              __int16 v70 = 1024,
              int v71 = v20,
              _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v69, 0x12u), uint64_t v20 = *(unsigned int *)buf, !*(_DWORD *)buf))
        {
          BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
          size_t v29 = CVPixelBufferGetWidth(pixelBufferOut);
          size_t v30 = CVPixelBufferGetHeight(pixelBufferOut);
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
          v32 = CGBitmapContextCreate(BaseAddress, v29, v30, 8uLL, BytesPerRow, v24, v27);
          *(void *)v69 = v32;
          if (v32)
          {
            CGAffineTransform v59 = v64;
            CGContextConcatCTM(v32, &v59);
            v73.size.width = (double)v22;
            v73.size.height = (double)v21;
            v73.origin.x = 0.0;
            v73.origin.y = 0.0;
            CGContextDrawImage(*(CGContextRef *)v69, v73, a1);
            uint64_t v20 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
            if (!v20)
            {
              v33 = pixelBufferOut;
              if (pixelBufferOut) {
                v33 = (__CVBuffer *)CFRetain(pixelBufferOut);
              }
              uint64_t v20 = 0;
              *a2 = v33;
            }
          }
          else
          {
            BOOL v51 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v51) {
              CGImage_CreateCVPixelBufferWithTransform(v51, v52, v53, v54, v55, v56, v57, v58);
            }
            uint64_t v20 = 4294967278;
          }
          CF<CGColorSpace *>::~CF((const void **)v69);
          if (*(void *)&buf[8]
            && !*(_DWORD *)buf
            && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&buf[8], *(CVPixelBufferLockFlags *)&buf[16])
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            CGImage_CreateCVPixelBufferWithTransform();
          }
        }
      }
      else
      {
        BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v42) {
          CGImage_CreateCVPixelBufferWithTransform(v42, v43, v44, v45, v46, v47, v48, v49);
        }
        uint64_t v20 = 4294967246;
      }
    }
    else
    {
      BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v34) {
        CGImage_CreateCVPixelBufferWithTransform(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      uint64_t v20 = 4294967278;
    }
    CF<CGColorSpace *>::~CF((const void **)&pixelBufferOut);
    CF<CGColorSpace *>::~CF((const void **)&pixelBufferAttributes);
    CF<CGColorSpace *>::~CF((const void **)&value);
    CF<CGColorSpace *>::~CF(&cf);
    return v20;
  }
  BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v12) {
    CGImage_CreateCVPixelBufferWithTransform(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  return 4294967246;
}

void sub_1DCCA4AD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, __int16 a17, char a18, char a19, int a20,__int16 a21,char a22,char a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DCCA4E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  uint64_t v17 = v14;

  CF<CGColorSpace *>::~CF(&a9);
  _Unwind_Resume(a1);
}

void sub_1DCCA4F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA511C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA544C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA5534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA5718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA583C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA5C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1DCCA5D0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA5F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA6220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA62E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA64CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA689C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);

  _Unwind_Resume(a1);
}

void sub_1DCCA698C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA6BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA6F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA7010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA71F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA72BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA736C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA7494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DCCA78CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA79C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA7B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA8BE0(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_1DCCA8EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  CF<CGColorSpace *>::~CF(&a9);
  _Unwind_Resume(a1);
}

void sub_1DCCA9294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA9378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA955C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA98B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA9998(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA9B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCA9CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAA0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAA1B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAA388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAA7FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAA9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAAA98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAABB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAAD40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CF<CGColorSpace *>::~CF((const void **)va);
  _Unwind_Resume(a1);
}

void sub_1DCCAB054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAB134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAB3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAB6A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAB77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAB814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCABA6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCABB40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCABD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);

  _Unwind_Resume(a1);
}

void sub_1DCCABE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCABEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);

  _Unwind_Resume(a1);
}

void sub_1DCCAC3E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1DCCAC750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAC9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DCCACAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCACD58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCACE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCACFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose((const void *)(v22 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_1DCCAD138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD3A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD70C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAD9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCADCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1DCCADF14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAE0B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAE27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAE68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAE80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAE950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAEA60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAED04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAEE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAEFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAF2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAF510(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAF6AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CVPixelBufferLock::Unlock(CVPixelBufferLock *this)
{
  if (*(_DWORD *)this)
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v2) {
      CVPixelBufferLock::Unlock(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return *(unsigned int *)this;
  }
  BOOL v12 = (void *)((char *)this + 8);
  size_t v11 = (__CVBuffer *)*((void *)this + 1);
  if (v11)
  {
    uint64_t result = CVPixelBufferUnlockBaseAddress(v11, *((void *)this + 2));
    *(_DWORD *)this = result;
    if (result)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        CVPixelBufferLock::Unlock((uint64_t)this + 8, (uint64_t)this, v13, v14, v15, v16, v17, v18);
      }
      return *(unsigned int *)this;
    }
    *BOOL v12 = 0;
  }
  else
  {
    BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v19) {
      CVPixelBufferLock::Unlock(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    return 4294967278;
  }
  return result;
}

void CVPixelBufferLock::~CVPixelBufferLock(CVPixelBufferLock *this)
{
  BOOL v2 = (__CVBuffer *)*((void *)this + 1);
  if (v2
    && !*(_DWORD *)this
    && CVPixelBufferUnlockBaseAddress(v2, *((void *)this + 2))
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    CGImage_CreateCVPixelBufferWithTransform();
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1DCCAFA04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAFA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCAFB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB13E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNDocumentObservationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD6F0;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_1)
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
    Class result = objc_getClass("VNDocumentObservation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNDocumentObservationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNDocumentObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void sub_1DCCB2F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSFResultSectionClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SearchFoundationLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __SearchFoundationLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD708;
    uint64_t v6 = 0;
    SearchFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!SearchFoundationLibraryCore_frameworkLibrary_0)
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
    Class result = objc_getClass("SFResultSection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getSFResultSectionClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getSFResultSectionClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SearchFoundationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  SearchFoundationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_1DCCB396C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNDocumentObservationClass_block_invoke_0(uint64_t a1)
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
    long long v5 = xmmword_1E6CAD720;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
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
    Class result = objc_getClass("VNDocumentObservation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNDocumentObservationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNDocumentObservationClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void sub_1DCCB3FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB4080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB41E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB42EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB4420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB44B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB4608(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCB4764(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1DCCB4848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB48AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB49D8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCB4A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB4B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB59EC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCB5AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB5B30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB5B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB5C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MADSignpostLog()
{
  if (MADSignpostLog_token != -1) {
    dispatch_once(&MADSignpostLog_token, &__block_literal_global_0);
  }
  v0 = (void *)MADSignpostLog_log;
  return v0;
}

void __MADSignpostLog_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mediaanalysisservices", "signpost");
  uint64_t v1 = (void *)MADSignpostLog_log;
  MADSignpostLog_log = (uint64_t)v0;
}

void sub_1DCCB5E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB60C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB6214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB6378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB678C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);

  CF<CGColorSpace *>::~CF((const void **)va);
  _Unwind_Resume(a1);
}

void sub_1DCCB6CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB7BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB7CB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB7E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB7F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB7FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB80B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB82F0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCB848C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB85B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8750(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCB8808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB88C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8DAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB8FD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB94BC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCB95AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB96C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB97E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9AEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MADComputeService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1DCCB9D14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCB9F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
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

void sub_1DCCBA2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1DCCBAACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,void *a35)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBACF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBAE04(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1DCCBAFCC(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_1DCCBB528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1DCCBB698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBB7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBB918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose((const void *)(v23 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_1DCCBB9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBBEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBC044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBC154(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1DCCBC1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v12 = v11;

  _Unwind_Resume(a1);
}

void sub_1DCCBC2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBC464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__115(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E01AAEE0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__116(uint64_t a1)
{
}

void sub_1DCCBC708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBCB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1DCCBCE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBD234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBD644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBDA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBDC54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBDF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBE3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBE7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Block_object_dispose((const void *)(v28 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1DCCBE904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBEA08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1DCCBEBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBEC6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBECF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBEDA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCBFD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNFaceObservationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_3)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_3;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD878;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_3)
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
    Class result = objc_getClass("VNFaceObservation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNFaceObservationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNFaceObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_3 = result;
  return result;
}

void sub_1DCCC0664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVNRectangleObservationClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_4)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __VisionLibraryCore_block_invoke_4;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6CAD890;
    uint64_t v6 = 0;
    VisionLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!VisionLibraryCore_frameworkLibrary_4)
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
    Class result = objc_getClass("VNRectangleObservation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)__getVNRectangleObservationClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getVNRectangleObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __VisionLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_4 = result;
  return result;
}

void sub_1DCCC1320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVNClassificationObservationClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("VNClassificationObservation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNClassificationObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getVNClassificationObservationClass_block_invoke_cold_1();
    VisionLibrary();
  }
}

void VisionLibrary()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  if (!VisionLibraryCore_frameworkLibrary_5)
  {
    v1[1] = MEMORY[0x1E4F143A8];
    v1[2] = 3221225472;
    v1[3] = __VisionLibraryCore_block_invoke_5;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_1E6CAD8A8;
    uint64_t v3 = 0;
    VisionLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  os_log_t v0 = (void *)v1[0];
  if (!VisionLibraryCore_frameworkLibrary_5)
  {
    os_log_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __VisionLibraryCore_block_invoke_5()
{
  uint64_t result = _sl_dlopen();
  VisionLibraryCore_frameworkLibrary_5 = result;
  return result;
}

Class __getVNRecognizedObjectObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNRecognizedObjectObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNRecognizedObjectObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getVNRecognizedObjectObservationClass_block_invoke_cold_1();
    return (Class)__getVNSaliencyImageObservationClass_block_invoke(v3);
  }
  return result;
}

Class __getVNSaliencyImageObservationClass_block_invoke(uint64_t a1)
{
  VisionLibrary();
  Class result = objc_getClass("VNSaliencyImageObservation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getVNSaliencyImageObservationClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getVNSaliencyImageObservationClass_block_invoke_cold_1();
    return (Class)+[MADVisionRequest supportsSecureCoding];
  }
  return result;
}

void sub_1DCCC1C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC1CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC1D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC1E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC1F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC2224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC22A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC2368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC27A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC2924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC2AD8(_Unwind_Exception *a1)
{
  SEL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DCCC2BAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DCCC2D80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __getVUWGalleryPersonalizationOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[MADRemoveBackgroundMatteResult pixelBuffer](v0);
}

void SurfaceGetBytePointerCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_1DCC91000, MEMORY[0x1E4F14500], a3, "[GetBytePointer] Failed to lock IOSurface", a5, a6, a7, a8, 0);
}

void SurfaceReleaseBytePointerCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SurfaceReleaseInfoCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t __getSFResultSectionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[MADCoreMLRequest _extensionData](v0);
}

uint64_t __getCIBarcodeDescriptorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNBarcodeObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNBarcodeObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[MADMovieCurationRequest allocWithZone:](v0);
}

uint64_t __getVNFaceprintClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[MADService init](v0);
}

void CGImage_CreateCVPixelBufferWithTransform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_1DCC91000, MEMORY[0x1E4F14500], a3, "[CGImage->CVPixelBuffer] Failed to allocate CVPixelBuffer", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_1DCC91000, MEMORY[0x1E4F14500], a3, "Cannot lock NULL CVPixelBuffer", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_1DCC91000, MEMORY[0x1E4F14500], a3, "[CGImage->CVPixelBuffer] Failed to allocate CGContext", a5, a6, a7, a8, 0);
}

void CGImage_CreateCVPixelBufferWithTransform()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_1DCC91000, MEMORY[0x1E4F14500], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
}

void CVPixelBufferLock::Unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

{
  OUTLINED_FUNCTION_10(&dword_1DCC91000, MEMORY[0x1E4F14500], a3, "Failed to unlock CVPixelBuffer (%p, %d)", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_1DCC91000, MEMORY[0x1E4F14500], a3, "Lock attempt failed; cannot unlock buffer",
    a5,
    a6,
    a7,
    a8,
    0);
}

uint64_t __getVNDocumentObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[MADFaceDetectionImageRequest allocWithZone:](v0);
}

uint64_t __getVNFaceObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNRectangleObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNRectangleObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[MADSceneClassificationImageRequest allocWithZone:](v0);
}

uint64_t __getVNClassificationObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNRecognizedObjectObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNRecognizedObjectObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getVNSaliencyImageObservationClass_block_invoke_cold_1(v0);
}

uint64_t __getVNSaliencyImageObservationClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[MADImageVisionRequest allocWithZone:](v0);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
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

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C60](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA2F0](info, size, callbacks);
}

uint64_t CGIOSurfaceContextCreate()
{
  return MEMORY[0x1F40DA7C0]();
}

uint64_t CGIOSurfaceContextCreateImageReference()
{
  return MEMORY[0x1F40DA7D0]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
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

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}