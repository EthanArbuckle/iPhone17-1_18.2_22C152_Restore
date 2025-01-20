void *ARDepthCameraCalibrationCreate()
{
  return malloc_type_calloc(1uLL, 0xD0uLL, 0x10000407817DDDBuLL);
}

__n128 ARDepthCameraCalibrationCopy(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

uint64_t ARDepthCameraCalibrationSize()
{
  return 208;
}

__n128 ARDepthCameraCalibrationGetIntrinsics(uint64_t a1)
{
  return *(__n128 *)a1;
}

__n128 ARDepthCameraCalibrationGetExtrinsics(__n128 *a1)
{
  return a1[3];
}

double ARDepthCameraCalibrationGetTimestamp(uint64_t a1)
{
  return *(double *)(a1 + 112);
}

__n128 ARDepthCameraCalibrationGetDeviceTransform(__n128 *a1)
{
  return a1[8];
}

uint64_t ARDepthCameraCalibrationGetSLAMSessionID(uint64_t a1)
{
  return *(void *)(a1 + 192);
}

uint64_t ARDepthCameraCalibrationGetSLAMReinitCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

__n128 *ARDepthCameraCalibrationSetIntrinsics(__n128 *result, __n128 a2, __n128 a3, __n128 a4)
{
  *__n128 result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

__n128 *ARDepthCameraCalibrationSetExtrinsics(__n128 *result, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  result[6] = a5;
  return result;
}

uint64_t ARDepthCameraCalibrationSetTimestamp(uint64_t result, double a2)
{
  *(double *)(result + 112) = a2;
  return result;
}

__n128 *ARDepthCameraCalibrationSetDeviceTransform(__n128 *result, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  result[8] = a2;
  result[9] = a3;
  result[10] = a4;
  result[11] = a5;
  return result;
}

uint64_t ARDepthCameraCalibrationSetSLAMSessionID(uint64_t result, uint64_t a2)
{
  *(void *)(result + 192) = a2;
  return result;
}

uint64_t ARDepthCameraCalibrationSetSLAMReinitCount(uint64_t result, int a2)
{
  *(_DWORD *)(result + 200) = a2;
  return result;
}

id ARKitFoundationBuildVersionString()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 infoDictionary];
  long long v2 = [v1 objectForKeyedSubscript:@"CFBundleVersion"];

  return v2;
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}