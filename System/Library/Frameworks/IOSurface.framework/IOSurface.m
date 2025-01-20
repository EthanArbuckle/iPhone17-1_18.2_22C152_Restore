void *__cdecl IOSurfaceGetBaseAddressOfPlane(void *buffer, size_t planeIndex)
{
  if (buffer) {
    return (void *)IOSurfaceClientGetBaseAddressOfPlane(*((void *)buffer + 1), planeIndex);
  }
  return buffer;
}

uint64_t IOSurfaceClientGetSliceCount(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 228);
  if (v1 <= 1) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t IOSurfaceGetSliceCount(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetSliceCount(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceClientGetProtectionOptions(uint64_t a1)
{
  return *(void *)(a1 + 240);
}

uint64_t IOSurfaceClientGetBaseAddressOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (!a2)
    {
      v2 = (void *)(a1 + 176);
      return *v2 + *(void *)(a1 + 112);
    }
    return 0;
  }
  if (*(unsigned char *)(a1 + 152 * a2 + 356) == 1) {
    return 0;
  }
  v2 = (void *)(a1 + 152 * a2 + 272);
  return *v2 + *(void *)(a1 + 112);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetWidthInCompressedTilesOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetID(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceGetProtectionOptions(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetProtectionOptions(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceClientGetWidthInCompressedTilesOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 344);
  }
}

uint64_t IOSurfaceBindAccel(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a1) {
    return IOSurfaceClientBindAccel(*(void *)(a1 + 8), a2, a3);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerTileDataOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHeightInCompressedTilesOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClientGetBytesPerTileDataOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 368);
  }
}

uint64_t IOSurfaceClientGetHeightInCompressedTilesOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 348);
  }
}

CFTypeRef IOSurfaceCopyValue(CFTypeRef buffer, CFStringRef key)
{
  if (buffer) {
    return IOSurfaceClientCopyValue(*((void *)buffer + 1), (void *)key);
  }
  return buffer;
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  if (buffer) {
    LOBYTE(buffer) = IOSurfaceClientIsInUse(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceClientGetID(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 136);
  }
  return result;
}

uint64_t IOSurfaceClientGetPixelFormat(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

uint64_t IOSurfaceClientGetHeight(uint64_t a1)
{
  return *(void *)(a1 + 160);
}

uint64_t IOSurfaceClientGetAllocSize(uint64_t a1)
{
  return *(void *)(a1 + 144);
}

uint64_t IOSurfaceClientGetWidth(uint64_t a1)
{
  return *(void *)(a1 + 152);
}

uint64_t IOSurfaceClientIncrementUseCount(uint64_t a1)
{
  return IOSurfaceClientIncrementUseCountForCategory(a1, 0);
}

uint64_t IOSurfaceClientBindAccel(uint64_t a1, unsigned int a2, unsigned int a3)
{
  input[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 120);
  if (!*(_WORD *)(v3 + 8) || *(unsigned __int16 *)(v3 + 8) == a2 && *(unsigned __int16 *)(v3 + 10) == a3) {
    return 0;
  }
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  mach_port_t v5 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v5, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
}

size_t IOSurfaceGetPlaneCount(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetPlaneCount(*(void *)(buffer + 8));
  }
  return buffer;
}

uint64_t IOSurfaceClientGetPlaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

size_t IOSurfaceGetBytesPerRowOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerRowOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

uint64_t IOSurfaceClientDecrementUseCount(uint64_t a1)
{
  return IOSurfaceClientDecrementUseCountForCategory(a1, 0);
}

uint64_t IOSurfaceGetIndexedTimestamp(uint64_t result, unint64_t a2)
{
  if (result) {
    return IOSurfaceClientGetIndexedTimestamp(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClientGetIndexedTimestamp(uint64_t a1, unint64_t a2)
{
  if (a2 > 4) {
    return 0;
  }
  else {
    return *(void *)(*(void *)(a1 + 128) + 8 * a2);
  }
}

BOOL IOSurfaceClientIsInUse(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIsInUse: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1E9739858 = (uint64_t)crashMessage;
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v2) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    abort();
  }
  return *(void *)(*(void *)(a1 + 120) + 24) != 0;
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetPixelFormat(*((void *)buffer + 1));
  }
  return buffer;
}

size_t IOSurfaceGetAllocSize(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetAllocSize(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetHeight(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetHeight(*(void *)(buffer + 8));
  }
  return buffer;
}

size_t IOSurfaceGetWidth(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetWidth(*(void *)(buffer + 8));
  }
  return buffer;
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  uint64_t v1 = *(void *)&csid;
  BOOL v2 = [IOSurface alloc];

  return (IOSurfaceRef)[(IOSurface *)v2 initWithSurfaceID:v1];
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  if (buffer) {
    IOSurfaceClientIncrementUseCount(*((void *)buffer + 1));
  }
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  if (buffer)
  {
    if (key) {
      IOSurfaceClientSetValue(*((void *)buffer + 1), (void *)key, (CFDictionaryRef)value);
    }
  }
}

size_t IOSurfaceGetHeightOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetHeightOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

uint64_t IOSurfaceClientGetBytesPerRowOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (!a2)
    {
      uint64_t v2 = a1 + 168;
      return *(void *)v2;
    }
    return 0;
  }
  if (*(unsigned char *)(a1 + 152 * a2 + 356) == 1) {
    return 0;
  }
  uint64_t v2 = a1 + 152 * a2 + 280;
  return *(void *)v2;
}

void *__cdecl IOSurfaceGetBaseAddress(void *buffer)
{
  if (buffer) {
    return (void *)IOSurfaceClientGetBaseAddress(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceGetCompressionTypeOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressionTypeOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClientIsTiled(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 120) + 20);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  if (buffer) {
    IOSurfaceClientDecrementUseCount(*((void *)buffer + 1));
  }
}

uint64_t IOSurfaceGetAddressFormatOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetAddressFormatOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

size_t IOSurfaceGetBytesPerRow(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerRow(*(void *)(buffer + 8));
  }
  return buffer;
}

uint64_t IOSurfaceClientGetCompressionTypeOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 356);
  }
}

uint64_t IOSurfaceGetBulkAttachments(uint64_t a1, void *a2, size_t *a3)
{
  if (a1) {
    return IOSurfaceClientGetBulkAttachments(*(void *)(a1 + 8), a2, a3);
  }
  else {
    return 3758097090;
  }
}

CFDictionaryRef IOSurfaceCopyAllValues(CFDictionaryRef buffer)
{
  if (buffer) {
    return IOSurfaceClientCopyAllValues(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceClientGetParentID(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 224);
  }
  return result;
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressedTileWidthOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressedTileHeightOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
  if (buffer)
  {
    if (key) {
      IOSurfaceClientRemoveValue(*((void *)buffer + 1), (__CFString *)key);
    }
  }
}

size_t IOSurfaceGetWidthOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetWidthOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

uint64_t IOSurfaceClientGetAddressFormatOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 301);
  }
}

uint64_t IOSurfaceClientGetHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    uint64_t v2 = a1 + 160;
  }
  else
  {
    uint64_t v2 = a1 + 152 * a2 + 256;
  }
  return *(void *)v2;
}

uint64_t IOSurfaceClientGetElementHeight(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 211);
}

uint64_t IOSurfaceClientGetCompressedTileWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 324);
  }
}

uint64_t IOSurfaceClientGetCompressedTileHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 328);
  }
}

uint64_t IOSurfaceRemoveCoreVideoBridgedValues(uint64_t result)
{
  if (result) {
    return IOSurfaceClientRemoveCoreVideoBridgedValues(*(void *)(result + 8));
  }
  return result;
}

size_t IOSurfaceGetElementWidthOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetElementWidthOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

size_t IOSurfaceGetBytesPerElementOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerElementOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  if (buffer) {
    return IOSurfaceClientLock(*((void *)buffer + 1), options, seed);
  }
  else {
    return -536870206;
  }
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  if (buffer) {
    return IOSurfaceClientUnlock(*((void *)buffer + 1), options, seed);
  }
  else {
    return -536870206;
  }
}

uint64_t IOSurfaceClientGetBaseAddress(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 200);
  if (!v1) {
    return *(void *)(a1 + 176) + *(void *)(a1 + 112);
  }
  char v2 = 0;
  uint64_t v3 = (unsigned __int8 *)(a1 + 356);
  do
  {
    int v4 = *v3;
    v3 += 152;
    v2 |= v4 == 1;
    --v1;
  }
  while (v1);
  if (v2) {
    return 0;
  }
  else {
    return *(void *)(a1 + 176) + *(void *)(a1 + 112);
  }
}

uint64_t IOSurfaceIsTiled(uint64_t result)
{
  if (result) {
    return IOSurfaceClientIsTiled(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetCompressionFootprintOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClientGetBytesPerRow(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 200);
  if (!v1) {
    return *(void *)(a1 + 168);
  }
  char v2 = 0;
  uint64_t v3 = (unsigned __int8 *)(a1 + 356);
  do
  {
    int v4 = *v3;
    v3 += 152;
    v2 |= v4 == 1;
    --v1;
  }
  while (v1);
  if (v2) {
    return 0;
  }
  else {
    return *(void *)(a1 + 168);
  }
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceSetDetachModeCode(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result) {
    return IOSurfaceClientSetDetachModeCode(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceClientGetWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    uint64_t v2 = a1 + 152;
  }
  else
  {
    uint64_t v2 = a1 + 152 * a2 + 248;
  }
  return *(void *)v2;
}

uint64_t IOSurfaceClientGetElementWidth(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 210);
}

uint64_t IOSurfaceClientGetBulkAttachments(uint64_t a1, void *__dst, size_t *a3)
{
  uint64_t v3 = 3758097090;
  if (__dst)
  {
    if (a3)
    {
      size_t v4 = *a3;
      uint64_t v3 = 3758097084;
      if (v4 <= 0x74)
      {
        memcpy(__dst, (const void *)(*(void *)(a1 + 120) + 48), v4);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t IOSurfaceClientIncrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  uint64_t v3 = result;
  if (a2 >= 2) {
    result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"category out of range"];
  }
  if (*(unsigned char *)(v3 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIncrementUseCountForCategory: error: Attempt to change use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)v3);
    qword_1E9739858 = (uint64_t)crashMessage;
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v12) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    abort();
  }
  do
  {
    unint64_t v4 = *(void *)(v3 + 8);
    unint64_t v5 = HIDWORD(v4);
    unint64_t v6 = (v4 & 0xFFFFFFFF00000000) + 0x100000000;
    if (HIDWORD(v4) == -1) {
      unint64_t v6 = 0xFFFFFFFF00000000;
    }
    unint64_t v7 = v6 & 0xFFFFFFFF00000000 | *(void *)(v3 + 8);
    uint64_t v8 = (v4 + 1);
    if (v4 == -1) {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    unint64_t v9 = v8 | v4 & 0xFFFFFFFF00000000;
    if (a2) {
      unint64_t v9 = v7;
    }
    else {
      LODWORD(v5) = *(void *)(v3 + 8);
    }
    uint64_t v10 = *(void *)(v3 + 8);
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(v3 + 8), (unint64_t *)&v10, v9, memory_order_relaxed, memory_order_relaxed);
  }
  while (v10 != v4);
  if (!v5)
  {
    io_connect_t v11 = _ioSurfaceConnectInternal(0);
    result = IOConnectTrap2(v11, 0, *(unsigned int *)(v3 + 136), a2);
    if (result) {
      return fprintf((FILE *)*MEMORY[0x1E4F143C8], "kIOSurfaceMethodIncrementUseCountForCategory failed: %08x\n", result);
    }
  }
  return result;
}

void unserializeReplacementArrayValues(uint64_t a1, __CFArray *a2)
{
  uint64_t v3 = (const void *)unserializeReplacementIOKitTypeRef(a1, 0);
  CFArrayAppendValue(a2, v3);

  CFRelease(v3);
}

__CFDictionary *IOSurfaceClientCopyAllValues(uint64_t a1)
{
  v5[1] = *(__CFDictionary **)MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t v1 = *(void *)(a1 + 120);
  if (!*(_DWORD *)(v1 + 40)) {
    return 0;
  }
  uint64_t v3 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  IOSurfaceClientUpdateNonBulkValueCache(a1);
  _insertAllKeysFromStruct(*(const __CFDictionary **)(a1 + 16), v1 + 48, v5);
  pthread_mutex_unlock(v3);
  return v5[0];
}

unsigned int *IOSurfaceClientLookup(unsigned int a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(&_iosCacheMutex);
  if (_iosCacheDict
    && (Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)_iosCacheDict, (const void *)a1)) != 0)
  {
    uint64_t v3 = Value;
    ++*Value;
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long outputStruct = 0u;
    long long v12 = 0u;
    size_t v9 = 3176;
    uint64_t input = a1;
    mach_port_t v4 = _ioSurfaceConnectInternal(0);
    uint64_t v3 = 0;
    if (!IOConnectCallMethod(v4, 4u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9))
    {
      unint64_t v5 = (unsigned int *)_ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
      uint64_t v3 = v5;
      if (v5)
      {
        _ioSurfaceAddClientRef(v5);
      }
      else
      {
        uintptr_t v6 = DWORD2(v12);
        io_connect_t v7 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v7, 5u, v6);
      }
      if (*MEMORY[0x1E4F143E0]) {
        ((void (*)(uint64_t, void, void, void, void, void))*MEMORY[0x1E4F143E0])(1476395024, *MEMORY[0x1E4F14960], v13, 0, outputStruct, 0);
      }
    }
  }
  pthread_mutex_unlock(&_iosCacheMutex);
  return v3;
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  if (!aSurface) {
    return 0;
  }
  mach_port_name_t MachPort = IOSurfaceClientCreateMachPort(*((void *)aSurface + 1));
  if (!MachPort) {
    return 0;
  }
  mach_port_name_t v2 = MachPort;
  uint64_t v3 = (void *)xpc_mach_send_create();
  mach_port_deallocate(*MEMORY[0x1E4F14960], v2);
  return v3;
}

uint64_t IOSurfaceClientCreateMachPort(uint64_t a1)
{
  return IOSurfaceClientCreateMachPortWithOptions(a1, 0);
}

unsigned int *IOSurfaceClientLookupFromMachPort(unsigned int a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long outputStruct = 0u;
  *(_OWORD *)key = 0u;
  _ioSurfaceConnectInternal(0);
  pthread_mutex_lock(&_iosCacheMutex);
  size_t v9 = 3176;
  uint64_t input = a1;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  uint64_t v3 = 0;
  if (!IOConnectCallMethod(v2, 0x22u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9))
  {
    if ((void)outputStruct == -1)
    {
      if (_iosCacheDict)
      {
        Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)_iosCacheDict, (const void *)LODWORD(key[1]));
        uint64_t v3 = Value;
        if (Value) {
          ++*Value;
        }
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
    else
    {
      unint64_t v5 = (unsigned int *)_ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
      uint64_t v3 = v5;
      if (v5)
      {
        _ioSurfaceAddClientRef(v5);
      }
      else
      {
        uintptr_t v7 = LODWORD(key[1]);
        io_connect_t v8 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v8, 5u, v7);
      }
      if (*MEMORY[0x1E4F143E0]) {
        ((void (*)(uint64_t, void, void, void, void, void))*MEMORY[0x1E4F143E0])(1476395024, *MEMORY[0x1E4F14960], v13, 0, outputStruct, 0);
      }
    }
  }
  pthread_mutex_unlock(&_iosCacheMutex);
  return v3;
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  id DictionaryAddingMissingProperties = _iosCreateDictionaryAddingMissingProperties(properties);
  mach_port_t v2 = [[IOSurface alloc] initWithProperties:DictionaryAddingMissingProperties];

  return (IOSurfaceRef)v2;
}

id _iosCreateDictionaryAddingMissingProperties(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 objectForKey:@"IOSurfaceName"];
  CFDictionaryRef v3 = (const __CFDictionary *)[a1 objectForKey:@"IOSurfaceDefaultAttachments"];
  uint64_t v4 = [a1 objectForKey:@"IOSurfaceDefaultBulkAttachments"];
  unint64_t v5 = (void *)MEMORY[0x1AD0D6130]();
  if (!((unint64_t)v3 | v4)) {
    goto LABEL_12;
  }
  long long v20 = 0u;
  *(_OWORD *)cf = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  if (v4) {
    [(id)v4 getBytes:&v13 length:116];
  }
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)_sniffKeysToStruct, &v13);
    if (cf[1]) {
      CFRelease(cf[1]);
    }
  }
  if (*((void *)&v20 + 1))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uintptr_t v7 = v6;
    if (v6)
    {
      if (v3) {
        objc_msgSend(v6, "addEntriesFromDictionary:", v3, v13, v14, v15, v16, v17, v18, v19, (void)v20);
      }
      io_connect_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v13 length:116];
      [v7 removeObjectForKey:@"IOSurfaceCleanAperture"];
      [v7 removeObjectForKey:@"IOSurfacePixelAspectRatio"];
      [v7 removeObjectForKey:@"IOSurfaceGammaLevel"];
      [v7 removeObjectForKey:@"IOSurfaceFieldCount"];
      [v7 removeObjectForKey:@"IOSurfaceFieldDetail"];
      [v7 removeObjectForKey:@"IOSurfaceYCbCrMatrix"];
      [v7 removeObjectForKey:@"IOSurfaceColorPrimaries"];
      [v7 removeObjectForKey:@"IOSurfaceTransferFunction"];
      [v7 removeObjectForKey:@"IOSurfaceChromaLocationTopField"];
      [v7 removeObjectForKey:@"IOSurfaceChromaLocationBottomField"];
      [v7 removeObjectForKey:@"IOSurfaceChromaSubsampling"];
      [v7 removeObjectForKey:@"IOSurfaceEDRFactor"];
    }
    else
    {
      io_connect_t v8 = 0;
    }
  }
  else
  {
LABEL_12:
    io_connect_t v8 = 0;
    uintptr_t v7 = 0;
  }
  if (v2) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = a1;
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 addEntriesFromDictionary:a1];
    if (!v2)
    {
      io_connect_t v11 = (const char *)dyld_image_path_containing_address();
      if (v11) {
        objc_msgSend(v10, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "stringWithFileSystemRepresentation:length:", v11, strlen(v11)), "lastPathComponent"), @"IOSurfaceName");
      }
    }
    if (v7)
    {
      [v10 setValue:v7 forKey:@"IOSurfaceDefaultAttachments"];
    }
    if (v8)
    {
      [v10 setValue:v8 forKey:@"IOSurfaceDefaultBulkAttachments"];
    }
  }
  return v10;
}

unsigned int *IOSurfaceClientCreateChild(uint64_t a1, void *object)
{
  kern_return_t v9;
  unsigned int *v10;
  const void *Value;
  void (*v12)(uint64_t, void, void, void, void, void);
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  BOOL v21;
  uintptr_t v23;
  io_connect_t v24;
  size_t v25;
  uint64_t input;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  unsigned char v31[128];
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  long long outputStruct;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  long long v66;
  long long v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E4F143B8];
  if (a1) {
    uint64_t v3 = *(unsigned int *)(a1 + 136);
  }
  else {
    uint64_t v3 = 0;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  long long v42 = 0u;
  uint64_t v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long outputStruct = 0u;
  long long v37 = 0u;
  long long v25 = 3176;
  uint64_t input = v3;
  CFDataRef v4 = IOCFSerialize(object, 1uLL);
  if (v4)
  {
    CFDataRef v5 = v4;
    mach_port_t v6 = _ioSurfaceConnectInternal(0);
    BytePtr = CFDataGetBytePtr(v5);
    size_t Length = CFDataGetLength(v5);
    BOOL v9 = IOConnectCallMethod(v6, 0, &input, 1u, BytePtr, Length, 0, 0, &outputStruct, &v25);
    CFRelease(v5);
    if (!v9)
    {
      id v10 = (unsigned int *)_ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
      if (v10)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)object, @"IOSurfacePrefetchPages");
        if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x1E4F1CFD0])) {
          IOSurfaceClientPrefetchPages((uint64_t)v10);
        }
        pthread_mutex_lock(&_iosCacheMutex);
        _ioSurfaceAddClientRef(v10);
        long long v12 = (void (*)(uint64_t, void, void, void, void, void))*MEMORY[0x1E4F143E0];
        if (*MEMORY[0x1E4F143E0])
        {
          if (!_iosClientAddressesSet) {
            _iosClientAddressesSet = (uint64_t)CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
          }
          long long v13 = CFDictionaryGetValue((CFDictionaryRef)object, @"IOSurfaceAddress");
          if (v13)
          {
            CFSetAddValue((CFMutableSetRef)_iosClientAddressesSet, v13);
          }
          else if (!v3)
          {
            v12(1476395024, *MEMORY[0x1E4F14960], v38, 0, outputStruct, 0);
          }
        }
        pthread_mutex_unlock(&_iosCacheMutex);
      }
      else
      {
        long long v23 = DWORD2(v37);
        long long v24 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v24, 5u, v23);
      }
      return v10;
    }
  }
  else
  {
    BOOL v9 = -1;
  }
  if (_ioSurfaceConnectInternal(0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      IOSurfaceClientCreateChild_cold_3(v9, v3, (uint64_t)object);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v14 = [object countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v14)
    {
      long long v15 = v14;
      long long v16 = *(void *)v33;
      long long v17 = MEMORY[0x1E4F14500];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(object);
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            long long v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            LODWORD(input) = 67109634;
            HIDWORD(input) = v9;
            long long v27 = 1024;
            long long v28 = v3;
            long long v29 = 2112;
            long long v30 = v19;
            _os_log_error_impl(&dword_1A7C21000, v17, OS_LOG_TYPE_ERROR, "IOSurface creation failed: %08x parentID: %08x property: %@", (uint8_t *)&input, 0x18u);
          }
        }
        long long v15 = [object countByEnumeratingWithState:&v32 objects:v31 count:16];
      }
      while (v15);
    }
  }
  else
  {
    long long v20 = _iosService;
    long long v21 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v21) {
        IOSurfaceClientCreateChild_cold_2();
      }
    }
    else if (v21)
    {
      IOSurfaceClientCreateChild_cold_1();
    }
  }
  return 0;
}

char *_ioSurfaceClientCreateWithLockResult(unsigned int *a1)
{
  uint64_t v2 = a1[22];
  if (v2) {
    uint64_t v3 = 152 * (20 - v2);
  }
  else {
    uint64_t v3 = 2888;
  }
  CFDataRef v4 = (char *)malloc_type_malloc(3288 - v3, 0x4E857DE6uLL);
  CFDataRef v5 = v4;
  if (v4)
  {
    *(_DWORD *)CFDataRef v4 = 1;
    *((void *)v4 + 13) = 0;
    *((void *)v4 + 2) = 0;
    *((void *)v4 + 3) = 0;
    *((void *)v4 + 1) = 0;
    *((_DWORD *)v4 + 8) = 0;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 40), 0);
    memcpy(v5 + 112, a1, 3176 - v3);
  }
  return v5;
}

void _ioSurfaceAddClientRef(unsigned int *value)
{
  Mutable = (__CFDictionary *)_iosCacheDict;
  if (!_iosCacheDict)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    _iosCacheDict = (uint64_t)Mutable;
  }
  uint64_t v3 = (const void *)value[34];

  CFDictionaryAddValue(Mutable, v3, value);
}

unsigned int *IOSurfaceClientCreate(void *object)
{
  return IOSurfaceClientCreateChild(0, object);
}

uint64_t IOSurfaceClientPrefetchPages(uint64_t a1)
{
  uint64_t v2 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  uint64_t v3 = *(IOSurfaceWiringAssertion **)(a1 + 104);
  if (!v3)
  {
    uint64_t v3 = [[IOSurfaceWiringAssertion alloc] initWithIOSurfaceClient:a1];
    *(void *)(a1 + 104) = v3;
  }
  if (v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 3758097084;
  }
  pthread_mutex_unlock(v2);
  return v4;
}

uint64_t IOSurfaceClientCreateMachPortWithOptions(uint64_t a1, uint64_t a2)
{
  input[2] = *MEMORY[0x1E4F143B8];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v2, 0x23u, input, 2u, 0, 0, &output, &outputCnt, 0, 0)) {
    return 0;
  }
  else {
    return output;
  }
}

void IOSurfaceClientRelease(_DWORD *a1)
{
  kern_return_t v5;
  int v6;
  uintptr_t v7;
  io_connect_t v8;
  const void *v9;
  const void *v10;
  const void *v11;
  uint64_t vars8;

  if (a1)
  {
    pthread_mutex_lock(&_iosCacheMutex);
    if ((*a1)-- == 1)
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_iosCacheDict, (const void *)a1[34]);
      uintptr_t v3 = a1[34];
      io_connect_t v4 = _ioSurfaceConnectInternal(0);
      CFDataRef v5 = IOConnectTrap1(v4, 4u, v3);
      if (v5)
      {
        mach_port_t v6 = v5;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          IOSurfaceClientRelease_cold_1(v6);
        }
      }
      pthread_mutex_unlock(&_iosCacheMutex);

      *((void *)a1 + 13) = 0;
      uintptr_t v7 = a1[34];
      io_connect_t v8 = _ioSurfaceConnectInternal(0);
      if (!IOConnectTrap1(v8, 5u, v7) && _iosClientAddressesSet)
      {
        BOOL v9 = (const void *)[NSNumber numberWithUnsignedLongLong:*((void *)a1 + 14)];
        if (CFSetGetValue((CFSetRef)_iosClientAddressesSet, v9))
        {
          CFSetRemoveValue((CFMutableSetRef)_iosClientAddressesSet, v9);
        }
        else if (*MEMORY[0x1E4F143E0] && !a1[56])
        {
          ((void (*)(uint64_t, void, void, void, void, void))*MEMORY[0x1E4F143E0])(32, *MEMORY[0x1E4F14960], *((void *)a1 + 14), *((void *)a1 + 18), 0, 0);
        }
      }
      id v10 = (const void *)*((void *)a1 + 2);
      if (v10) {
        CFRelease(v10);
      }
      io_connect_t v11 = (const void *)*((void *)a1 + 3);
      if (v11) {
        CFRelease(v11);
      }
      pthread_mutex_destroy((pthread_mutex_t *)(a1 + 10));
      free(a1);
    }
    else
    {
      pthread_mutex_unlock(&_iosCacheMutex);
    }
  }
}

const void *IOSurfaceClientCopyValue(uint64_t a1, void *key)
{
  mach_port_t v2 = key;
  v7[1] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  if (key)
  {
    if (_copySniffKeyFromStruct(key, *(void *)(a1 + 120) + 48, v7))
    {
      return (const void *)v7[0];
    }
    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
      IOSurfaceClientUpdateNonBulkValueCache(a1);
      CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 16);
      if (v4)
      {
        Value = CFDictionaryGetValue(v4, v2);
        mach_port_t v2 = Value;
        if (Value) {
          CFRetain(Value);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      }
      else
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
        return 0;
      }
    }
  }
  return v2;
}

uint64_t _copySniffKeyFromStruct(void *key, uint64_t a2, void *a3)
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
  uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)_sniffStructToKeysDict, key);
  if (result)
  {
    *a3 = ((uint64_t (*)(uint64_t))result)(a2);
    return 1;
  }
  return result;
}

void IOSurfaceClientUpdateNonBulkValueCache(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 120);
  unsigned int v2 = *(_DWORD *)(v1 + 40);
  if (!v2 || *(_DWORD *)(a1 + 32) == *(_DWORD *)(v1 + 32)) {
    return;
  }
  CFDictionaryRef v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 16) = 0;
    unsigned int v2 = *(_DWORD *)(v1 + 40);
  }
  unint64_t v5 = (*MEMORY[0x1E4F14B00] + v2 + 11) & -*MEMORY[0x1E4F14B00];
  if (v5 <= 0x4000) {
    size_t v6 = 0x4000;
  }
  else {
    size_t v6 = v5;
  }
  v20[0] = v6;
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  memset(v18, 0, 13);
  while (1)
  {
    if (v6 > 0x4000)
    {
      io_connect_t v8 = (char *)malloc_type_valloc(v6, 0x884391F5uLL);
    }
    else
    {
      MEMORY[0x1F4188790](v7);
      io_connect_t v8 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v8, v6);
    }
    v8[12] = 0;
    v18[0] = *(_DWORD *)(a1 + 136);
    v18[2] = *(void *)(a1 + 24) != 0;
    LOBYTE(v18[3]) = 0;
    mach_port_t v9 = _ioSurfaceConnectInternal(0);
    uint64_t v7 = IOConnectCallMethod(v9, 0xAu, 0, 0, v18, 0xDuLL, 0, 0, v8, v20);
    if (v7 != -536870181) {
      break;
    }
    size_t v10 = 16 * v20[0];
    v20[0] = v10;
    if (v10 > 0x1000000) {
      goto LABEL_30;
    }
    BOOL v11 = v6 > 0x4000;
    size_t v6 = v10;
    if (v11)
    {
      free(v8);
      size_t v6 = v20[0];
    }
  }
  if (!v7)
  {
    CFStringRef errorString = 0;
    if (v20[0])
    {
      CFTypeRef v12 = IOCFUnserializeWithSize(v8 + 12, v20[0] - 12, 0, 0, &errorString);
      if (v12 || !errorString)
      {
        if (v12)
        {
          CFDictionaryRef v14 = unserializeReplacementIOKitTypeRef(v12, *(const void **)(a1 + 24));
          CFRelease(v12);
          goto LABEL_28;
        }
      }
      else
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        if (CStringPtr) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s\n", CStringPtr);
        }
        CFRelease(errorString);
      }
    }
    CFDictionaryRef v14 = 0;
LABEL_28:
    *(void *)(a1 + 16) = v14;
    if (!*(void *)(a1 + 24))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v14, @"CreationProperties");
      if (Value)
      {
        CFDictionaryRef v16 = Value;
        CFTypeID v17 = CFGetTypeID(Value);
        if (v17 == CFDictionaryGetTypeID()) {
          *(void *)(a1 + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v16);
        }
      }
    }
    *(_DWORD *)(a1 + 32) = *((_DWORD *)v8 + 1);
    goto LABEL_30;
  }
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "IOSurfaceClientCopyValue getValueMethod kernel call failed %08x\n", v7);
LABEL_30:
  if (v6 > 0x4000) {
    free(v8);
  }
}

void IOSurfaceClientSetValue(uint64_t a1, void *key, CFDictionaryRef theDict)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int outputStruct = 0;
  size_t v31 = 4;
  if (theDict)
  {
    values = 0;
    long long v34 = 0;
    long long v29 = 0u;
    *(_OWORD *)theDicta = 0u;
    memset(context, 0, sizeof(context));
    if (key) {
      _sniffKeysToStruct(key, theDict, (uint64_t)context);
    }
    else {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_sniffKeysToStruct, context);
    }
    if (*((void *)&v29 + 1)) {
      IOSurfaceClientSetBulkAttachments(a1, (uint64_t)context, 0x74uLL, SDWORD2(v29));
    }
    if (LOBYTE(theDicta[0]))
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
      CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 16);
      if (key)
      {
        if (!v6
          || (CFDictionaryRef Value = CFDictionaryGetValue(v6, key)) == 0
          || !CFEqual(Value, theDict)
          || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(void *)(a1 + 120) + 32))
        {
          CFMutableDictionaryRef v8 = serializeReplacementIOKitTypeRef(theDict);
          values = v8;
          long long v34 = key;
          CFIndex v9 = 2;
LABEL_18:
          CFArrayRef v10 = CFArrayCreate(0, (const void **)&values, v9, MEMORY[0x1E4F1D510]);
          if (v10)
          {
            CFArrayRef v11 = v10;
            CFRelease(v8);
            CFDataRef v12 = IOCFSerialize(v11, 1uLL);
            CFRelease(v11);
            if (v12)
            {
              unint64_t Length = CFDataGetLength(v12);
              if (Length >= 0xFFFFFFFFFFFFFFF4) {
                abort();
              }
              size_t v14 = Length;
              size_t v15 = (Length + 12);
              CFDictionaryRef v16 = malloc_type_malloc(v15, 0xFC15330FuLL);
              *CFDictionaryRef v16 = *(_DWORD *)(a1 + 136);
              BytePtr = CFDataGetBytePtr(v12);
              memcpy(v16 + 3, BytePtr, v14);
              mach_port_t v18 = _ioSurfaceConnectInternal(0);
              IOConnectCallMethod(v18, 9u, 0, 0, v16, v15, 0, 0, &outputStruct, &v31);
              int v19 = *(_DWORD *)(a1 + 32);
              if (v19)
              {
                int v20 = (v19 | 1) + 2;
                if (outputStruct == v20)
                {
                  *(_DWORD *)(a1 + 32) = v20;
                  CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 16);
                  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
                  if (v21) {
                    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v21);
                  }
                  else {
                    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
                  }
                  long long v24 = MutableCopy;
                  if (key)
                  {
                    if (!CFEqual(@"CreationProperties", key)) {
                      CFDictionarySetValue(v24, key, theDict);
                    }
                  }
                  else
                  {
                    CFDictionaryApplyFunction(theDicta[1], (CFDictionaryApplierFunction)setEachValueInDictionary, MutableCopy);
                  }
                  long long v25 = *(const void **)(a1 + 16);
                  if (v25) {
                    CFRelease(v25);
                  }
                  *(void *)(a1 + 16) = CFDictionaryCreateCopy(v22, v24);
                  CFRelease(v24);
                }
              }
              free(v16);
              CFRelease(v12);
            }
          }
        }
      }
      else if (!v6 {
             || (uint64_t v26 = *(void *)(a1 + 16),
      }
                 uint64_t v27 = 1,
                 CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)compareKeys, &v26),
                 !(_BYTE)v27)
             || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(void *)(a1 + 120) + 32))
      {
        CFMutableDictionaryRef v8 = serializeReplacementIOKitTypeRef(theDicta[1]);
        values = v8;
        CFIndex v9 = 1;
        goto LABEL_18;
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      if (theDicta[1]) {
        CFRelease(theDicta[1]);
      }
    }
  }
}

void unserializeReplacementDictionaryKeysAndValues(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  unint64_t v5 = (const void *)unserializeReplacementIOKitTypeRef(a2, 0);
  CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)_creationPropertiesDict, a1);
  if (Value) {
    uint64_t v7 = Value;
  }
  else {
    uint64_t v7 = a1;
  }
  CFDictionarySetValue(a3, v7, v5);

  CFRelease(v5);
}

CFNumberRef unserializeReplacementIOKitTypeRef(const void *a1, const void *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFDictionaryGetTypeID())
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"iokit-float");
    if (Value)
    {
      CFDataRef v6 = Value;
      CFIndex Length = CFDataGetLength(Value);
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFDataGetTypeID())
      {
        if (Length == 8)
        {
          CFAllocatorRef v30 = CFGetAllocator(a1);
          BytePtr = CFDataGetBytePtr(v6);
          CFAllocatorRef v11 = v30;
          CFNumberType v12 = kCFNumberDoubleType;
          goto LABEL_20;
        }
        if (Length == 4)
        {
          CFAllocatorRef v9 = CFGetAllocator(a1);
          BytePtr = CFDataGetBytePtr(v6);
          CFAllocatorRef v11 = v9;
          CFNumberType v12 = kCFNumberFloatType;
LABEL_20:
          return CFNumberCreate(v11, v12, BytePtr);
        }
      }
    }
    CFAllocatorRef v19 = CFGetAllocator(a1);
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v19, Count, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)unserializeReplacementDictionaryKeysAndValues, Mutable);
    if (a2) {
      CFDictionarySetValue(Mutable, @"CreationProperties", a2);
    }
    CFAllocatorRef v22 = CFGetAllocator(a1);
    CFDictionaryRef Copy = CFDictionaryCreateCopy(v22, Mutable);
    CFMutableDictionaryRef v24 = Mutable;
LABEL_15:
    CFRelease(v24);
    return Copy;
  }
  CFTypeID v13 = CFGetTypeID(a1);
  if (v13 == CFArrayGetTypeID())
  {
    CFAllocatorRef v14 = CFGetAllocator(a1);
    CFIndex v15 = CFArrayGetCount((CFArrayRef)a1);
    CFMutableArrayRef v16 = CFArrayCreateMutable(v14, v15, MEMORY[0x1E4F1D510]);
    v32.length = CFArrayGetCount((CFArrayRef)a1);
    v32.location = 0;
    CFArrayApplyFunction((CFArrayRef)a1, v32, (CFArrayApplierFunction)unserializeReplacementArrayValues, v16);
    CFAllocatorRef v17 = CFGetAllocator(a1);
    CFArrayRef v18 = CFArrayCreateCopy(v17, v16);
LABEL_14:
    CFDictionaryRef Copy = v18;
    CFMutableDictionaryRef v24 = v16;
    goto LABEL_15;
  }
  CFTypeID v25 = CFGetTypeID(a1);
  if (v25 == CFSetGetTypeID())
  {
    CFAllocatorRef v26 = CFGetAllocator(a1);
    CFIndex v27 = CFSetGetCount((CFSetRef)a1);
    CFMutableArrayRef v16 = CFSetCreateMutable(v26, v27, MEMORY[0x1E4F1D548]);
    CFSetApplyFunction((CFSetRef)a1, (CFSetApplierFunction)unserializeReplacementSetValues, v16);
    CFAllocatorRef v28 = CFGetAllocator(a1);
    CFArrayRef v18 = CFSetCreateCopy(v28, v16);
    goto LABEL_14;
  }

  return (CFNumberRef)CFRetain(a1);
}

uint64_t _ioSurfaceConnectInternal(char a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___ioSurfaceConnectInternal_block_invoke;
  v2[3] = &__block_descriptor_33_e5_v8__0l;
  char v3 = a1;
  if (_ioSurfaceConnectInternal_once != -1) {
    dispatch_once(&_ioSurfaceConnectInternal_once, v2);
  }
  return _iosConnect;
}

void _sniffKeysToStruct(void *key, const void *a2, uint64_t a3)
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
  CFDataRef Value = (void (*)(const void *, uint64_t))CFDictionaryGetValue((CFDictionaryRef)_sniffKeysToStructDict, key);
  if (Value)
  {
    Value(a2, a3);
  }
  else
  {
    *(unsigned char *)(a3 + 128) = 1;
    if (a2)
    {
      CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a3 + 136);
      if (!Mutable)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        *(void *)(a3 + 136) = Mutable;
      }
      CFDictionarySetValue(Mutable, key, a2);
    }
  }
}

CFDictionaryRef createCleanApertureFromStruct(int *a1)
{
  values[4] = *(void **)MEMORY[0x1E4F143B8];
  int v1 = a1[1];
  if (!v1) {
    return 0;
  }
  int v2 = a1[3];
  if (!v2) {
    return 0;
  }
  int v3 = a1[5];
  if (!v3) {
    return 0;
  }
  int v4 = a1[7];
  if (!v4) {
    return 0;
  }
  keys[0] = @"Width";
  keys[1] = @"Height";
  double v5 = (double)*a1 / (double)v1;
  double v14 = (double)a1[2] / (double)v2;
  double valuePtr = v5;
  double v6 = (double)a1[4] / (double)v3;
  int v7 = a1[6];
  keys[2] = @"HorizontalOffset";
  keys[3] = @"VerticalOffset";
  double v12 = (double)v7 / (double)v4;
  double v13 = v6;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &valuePtr);
  values[1] = CFNumberCreate(v8, kCFNumberDoubleType, &v14);
  values[2] = CFNumberCreate(v8, kCFNumberDoubleType, &v13);
  values[3] = CFNumberCreate(v8, kCFNumberDoubleType, &v12);
  CFDictionaryRef v9 = CFDictionaryCreate(v8, (const void **)keys, (const void **)values, 4, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  for (uint64_t i = 0; i != 4; ++i)
    CFRelease(values[i]);
  return v9;
}

__CFString *createTransferFunctionFromStruct(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int v1 = *(unsigned __int8 *)(a1 + 60);
  CFTypeRef v2 = 0;
  switch(*(unsigned char *)(a1 + 60))
  {
    case 0:
      return (__CFString *)v2;
    case 1:
    case 6:
    case 0xE:
    case 0xF:
      int v3 = kIOSurfaceTransferFunction_ITU_R_709_2;
      return *v3;
    case 2:
      int v3 = kIOSurfaceTransferFunction_UseGamma;
      return *v3;
    case 3:
    case 4:
    case 5:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
      goto LABEL_5;
    case 7:
      int v3 = kIOSurfaceTransferFunction_SMPTE_240M_1995;
      return *v3;
    case 8:
      int v3 = kIOSurfaceTransferFunction_Linear;
      return *v3;
    case 0xD:
      int v3 = kIOSurfaceTransferFunction_sRGB;
      return *v3;
    case 0x10:
      int v3 = kIOSurfaceTransferFunction_SMPTE_ST_2084_PQ;
      return *v3;
    case 0x11:
      int v3 = kIOSurfaceTransferFunction_SMPTE_ST_428_1;
      return *v3;
    case 0x12:
      int v3 = kIOSurfaceTransferFunction_ITU_R_2100_HLG;
      return *v3;
    default:
      if (v1 == 255)
      {
        int v3 = kIOSurfaceTransferFunction_aYCC;
        return *v3;
      }
      else
      {
LABEL_5:
        context[0] = @"TransferFunction#";
        context[1] = v1;
        context[2] = _stringsForUnrecognizedTransferFunctionCodePointsDict;
        CFTypeRef cf = 0;
        dispatch_sync_f((dispatch_queue_t)_unrecognizedCodePointDispatchQueue, context, (dispatch_function_t)_dispatchUnrecognizedCodePointString);
        CFTypeRef v2 = cf;
        if (cf) {
          CFRetain(cf);
        }
      }
      return (__CFString *)v2;
  }
}

__CFString *createYCbCrMatrixFromStruct(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int v1 = *(unsigned __int8 *)(a1 + 58);
  CFTypeRef v2 = 0;
  switch(*(unsigned char *)(a1 + 58))
  {
    case 0:
    case 2:
      return (__CFString *)v2;
    case 1:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_709_2_String;
      return *v3;
    case 3:
    case 4:
    case 5:
    case 8:
    case 0xA:
    case 0xD:
      goto LABEL_6;
    case 6:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_601_4_String;
      return *v3;
    case 7:
      int v3 = kIOSurfaceYCbCrMatrix_SMPTE_240M_1995_String;
      return *v3;
    case 9:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_2020_String;
      return *v3;
    case 0xB:
      int v3 = kIOSurfaceYCbCrMatrix_DCI_P3_String;
      return *v3;
    case 0xC:
      int v3 = kIOSurfaceYCbCrMatrix_P3_D65_String;
      return *v3;
    case 0xE:
      int v3 = kIOSurfaceYCbCrMatrix_ITU_R_2100_ICtCp_String;
      return *v3;
    default:
      if (v1 == 200)
      {
        int v3 = kIOSurfaceYCbCrMatrix_Identity_String;
        return *v3;
      }
      if (v1 == 248)
      {
        int v3 = kIOSurfaceYCbCrMatrix_IPT_String;
        return *v3;
      }
LABEL_6:
      context[0] = @"YCbCrMatrix#";
      context[1] = v1;
      context[2] = _stringsForUnrecognizedYCbCrMatrixCodePointsDict;
      CFTypeRef cf = 0;
      dispatch_sync_f((dispatch_queue_t)_unrecognizedCodePointDispatchQueue, context, (dispatch_function_t)_dispatchUnrecognizedCodePointString);
      CFTypeRef v2 = cf;
      if (cf) {
        CFRetain(cf);
      }
      return (__CFString *)v2;
  }
}

__CFString *createColorPrimariesFromStruct(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int v1 = *(unsigned __int8 *)(a1 + 59);
  CFTypeRef v2 = 0;
  switch(*(unsigned char *)(a1 + 59))
  {
    case 0:
      return (__CFString *)v2;
    case 1:
      int v3 = kIOSurfaceColorPrimaries_ITU_R_709_2;
      return *v3;
    case 2:
    case 3:
    case 4:
    case 7:
    case 8:
    case 0xA:
      goto LABEL_5;
    case 5:
      int v3 = kIOSurfaceColorPrimaries_EBU_3213;
      return *v3;
    case 6:
      int v3 = kIOSurfaceColorPrimaries_SMPTE_C;
      return *v3;
    case 9:
      int v3 = kIOSurfaceColorPrimaries_ITU_R_2020;
      return *v3;
    case 0xB:
      int v3 = kIOSurfaceColorPrimaries_DCI_P3;
      return *v3;
    case 0xC:
      int v3 = kIOSurfaceColorPrimaries_P3_D65;
      return *v3;
    default:
      if (v1 == 22)
      {
        int v3 = kIOSurfaceColorPrimaries_JEDEC_P22;
        return *v3;
      }
      else
      {
LABEL_5:
        context[0] = @"ColorPrimaries#";
        context[1] = v1;
        context[2] = _stringsForUnrecognizedColorPrimariesCodePointsDict;
        CFTypeRef cf = 0;
        dispatch_sync_f((dispatch_queue_t)_unrecognizedCodePointDispatchQueue, context, (dispatch_function_t)_dispatchUnrecognizedCodePointString);
        CFTypeRef v2 = cf;
        if (cf) {
          CFRetain(cf);
        }
      }
      return (__CFString *)v2;
  }
}

CFMutableDictionaryRef serializeReplacementIOKitTypeRef(const void *a1)
{
  values[1] = *(void **)MEMORY[0x1E4F143B8];
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
  {
    CFTypeID v6 = CFGetTypeID(a1);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFAllocatorRef v7 = CFGetAllocator(a1);
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v7, Count, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)serializeReplacementDictionaryKeysAndValues, Mutable);
    }
    else
    {
      CFTypeID v10 = CFGetTypeID(a1);
      if (v10 == CFArrayGetTypeID())
      {
        CFAllocatorRef v11 = CFGetAllocator(a1);
        CFIndex v12 = CFArrayGetCount((CFArrayRef)a1);
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v11, v12, MEMORY[0x1E4F1D510]);
        v22.length = CFArrayGetCount((CFArrayRef)a1);
        v22.location = 0;
        CFArrayApplyFunction((CFArrayRef)a1, v22, (CFArrayApplierFunction)serializeReplacementArrayValues, Mutable);
      }
      else
      {
        CFTypeID v14 = CFGetTypeID(a1);
        if (v14 != CFSetGetTypeID()) {
          goto LABEL_18;
        }
        CFAllocatorRef v15 = CFGetAllocator(a1);
        CFIndex v16 = CFSetGetCount((CFSetRef)a1);
        CFMutableDictionaryRef Mutable = CFSetCreateMutable(v15, v16, MEMORY[0x1E4F1D548]);
        CFSetApplyFunction((CFSetRef)a1, (CFSetApplierFunction)serializeReplacementSetValues, Mutable);
      }
    }
    return Mutable;
  }
  if (CFNumberIsFloatType((CFNumberRef)a1))
  {
    CFNumberType Type = CFNumberGetType((CFNumberRef)a1);
    keys = @"iokit-float";
    values[0] = 0;
    if ((unint64_t)Type > kCFNumberCGFloatType) {
      goto LABEL_13;
    }
    if (((1 << Type) & 0x12040) != 0)
    {
      uint64_t v18 = 0;
      CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &v18);
      CFAllocatorRef v4 = CFGetAllocator(a1);
      CFIndex v5 = 8;
    }
    else
    {
      if (((1 << Type) & 0x1020) == 0) {
        goto LABEL_13;
      }
      LODWORD(v18) = 0;
      CFNumberGetValue((CFNumberRef)a1, kCFNumberFloatType, &v18);
      CFAllocatorRef v4 = CFGetAllocator(a1);
      CFIndex v5 = 4;
    }
    values[0] = CFDataCreate(v4, (const UInt8 *)&v18, v5);
LABEL_13:
    CFAllocatorRef v13 = CFGetAllocator(a1);
    CFMutableDictionaryRef Mutable = CFDictionaryCreate(v13, (const void **)&keys, (const void **)values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (values[0]) {
      CFRelease(values[0]);
    }
    return Mutable;
  }
LABEL_18:

  return (CFMutableDictionaryRef)CFRetain(a1);
}

uint64_t IOSurfaceClientSetBulkAttachments(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3 > 0x74) {
    return 3758097084;
  }
  uint64_t result = getDirtyMask(*(void *)(a1 + 120) + 48, a2, a4);
  if (result)
  {
    uint64_t v7 = result;
    long long v10 = 0u;
    long long v11 = 0u;
    memset(inputStruct, 0, sizeof(inputStruct));
    DWORD2(v11) = *(_DWORD *)(a1 + 136);
    __memcpy_chk();
    *((void *)&v10 + 1) = a3;
    *(void *)&long long v11 = v7;
    mach_port_t v8 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v8, 0x1Bu, 0, 0, inputStruct, 0x90uLL, 0, 0, 0, 0);
  }
  return result;
}

uint64_t getDirtyMask(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)a2 != *(void *)a1
      || *(void *)(a2 + 8) != *(void *)(a1 + 8)
      || *(void *)(a2 + 16) != *(void *)(a1 + 16)
      || *(void *)(a2 + 24) != *(void *)(a1 + 24);
    if ((a3 & 2) == 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((a3 & 2) == 0) {
      goto LABEL_19;
    }
  }
  if (*(_OWORD *)(a2 + 32) != *(_OWORD *)(a1 + 32)) {
    v3 |= 2uLL;
  }
LABEL_19:
  if ((a3 & 4) != 0)
  {
    if (*(void *)(a2 + 48) != *(void *)(a1 + 48)) {
      v3 |= 4uLL;
    }
    if ((a3 & 8) == 0)
    {
LABEL_21:
      if ((a3 & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_44;
    }
  }
  else if ((a3 & 8) == 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned __int8 *)(a2 + 56) != *(unsigned __int8 *)(a1 + 56)) {
    v3 |= 8uLL;
  }
  if ((a3 & 0x10) == 0)
  {
LABEL_22:
    if ((a3 & 0x20) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_44:
  if (*(unsigned __int8 *)(a2 + 57) != *(unsigned __int8 *)(a1 + 57)) {
    v3 |= 0x10uLL;
  }
  if ((a3 & 0x20) == 0)
  {
LABEL_23:
    if ((a3 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_47:
  if (*(unsigned __int8 *)(a2 + 58) != *(unsigned __int8 *)(a1 + 58)) {
    v3 |= 0x20uLL;
  }
  if ((a3 & 0x40) == 0)
  {
LABEL_24:
    if ((a3 & 0x80) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_50:
  if (*(unsigned __int8 *)(a2 + 59) != *(unsigned __int8 *)(a1 + 59)) {
    v3 |= 0x40uLL;
  }
  if ((a3 & 0x80) == 0)
  {
LABEL_25:
    if ((a3 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_53:
  if (*(unsigned __int8 *)(a2 + 60) != *(unsigned __int8 *)(a1 + 60)) {
    v3 |= 0x80uLL;
  }
  if ((a3 & 0x100) == 0)
  {
LABEL_26:
    if ((a3 & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_56:
  if (*(unsigned __int8 *)(a2 + 61) != *(unsigned __int8 *)(a1 + 61)) {
    v3 |= 0x100uLL;
  }
  if ((a3 & 0x200) == 0)
  {
LABEL_27:
    if ((a3 & 0x400) == 0) {
      goto LABEL_28;
    }
    goto LABEL_62;
  }
LABEL_59:
  if (*(unsigned __int8 *)(a2 + 62) != *(unsigned __int8 *)(a1 + 62)) {
    v3 |= 0x200uLL;
  }
  if ((a3 & 0x400) == 0)
  {
LABEL_28:
    if ((a3 & 0x800) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_62:
  if (*(unsigned __int8 *)(a2 + 63) != *(unsigned __int8 *)(a1 + 63)) {
    v3 |= 0x400uLL;
  }
  if ((a3 & 0x800) == 0)
  {
LABEL_29:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_65:
  if (*(void *)(a2 + 64) ^ *(void *)(a1 + 64) | *(void *)(a2 + 72) ^ *(void *)(a1 + 72) | *(void *)(a2 + 80) ^ *(void *)(a1 + 80)) {
    v3 |= 0x800uLL;
  }
  if ((a3 & 0x1000) == 0)
  {
LABEL_30:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_71;
  }
LABEL_68:
  if (*(_DWORD *)(a2 + 88) != *(_DWORD *)(a1 + 88)) {
    v3 |= 0x1000uLL;
  }
  if ((a3 & 0x2000) == 0)
  {
LABEL_31:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_74;
  }
LABEL_71:
  if (*(void *)(a2 + 92) != *(void *)(a1 + 92)) {
    v3 |= 0x2000uLL;
  }
  if ((a3 & 0x4000) == 0)
  {
LABEL_32:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_74:
  if (*(unsigned __int8 *)(a2 + 100) != *(unsigned __int8 *)(a1 + 100)) {
    v3 |= 0x4000uLL;
  }
  if ((a3 & 0x8000) == 0)
  {
LABEL_33:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_80;
  }
LABEL_77:
  if (*(void *)(a2 + 104) != *(void *)(a1 + 104)) {
    v3 |= 0x8000uLL;
  }
  if ((a3 & 0x10000) == 0)
  {
LABEL_34:
    if ((a3 & 0x20000) == 0) {
      return v3;
    }
    goto LABEL_35;
  }
LABEL_80:
  if (*(_DWORD *)(a2 + 112) != *(_DWORD *)(a1 + 112)) {
    v3 |= 0x10000uLL;
  }
  if ((a3 & 0x20000) != 0)
  {
LABEL_35:
    if (*(unsigned __int8 *)(a2 + 101) != *(unsigned __int8 *)(a1 + 101)) {
      return v3 | 0x20000;
    }
  }
  return v3;
}

CFNumberRef createColorSpaceIDFromStruct(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int valuePtr = *(unsigned __int8 *)(a1 + 101);
  if (valuePtr) {
    return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  }
  else {
    return 0;
  }
}

void _insertAllKeysFromStruct(const __CFDictionary *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef CleanApertureFromStruct = createCleanApertureFromStruct((int *)a2);
  CFDictionaryRef PixelAspectRatioFromStruct = createPixelAspectRatioFromStruct((int *)a2);
  CFDictionaryRef value = CleanApertureFromStruct;
  CFDictionaryRef v41 = PixelAspectRatioFromStruct;
  uint64_t v7 = 1;
  if (CleanApertureFromStruct) {
    uint64_t v7 = 2;
  }
  if (PixelAspectRatioFromStruct) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = CleanApertureFromStruct != 0;
  }
  CFNumberRef GammaLevelFromStruct = createGammaLevelFromStruct(a2);
  if (GammaLevelFromStruct) {
    BOOL v9 = v8 + 1;
  }
  else {
    BOOL v9 = v8;
  }
  long long v10 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (*(unsigned char *)(a2 + 56)) {
    CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt8Type, (const void *)(a2 + 56));
  }
  else {
    CFNumberRef v11 = 0;
  }
  uint64_t v12 = 0;
  if (v11) {
    BOOL v13 = v9 + 1;
  }
  else {
    BOOL v13 = v9;
  }
  unsigned int v14 = *(unsigned __int8 *)(a2 + 57);
  if (v14 > 8)
  {
    if (v14 == 9)
    {
      CFAllocatorRef v15 = kIOSurfaceFieldDetail_SpatialFirstLineEarly;
    }
    else
    {
      if (v14 != 14) {
        goto LABEL_25;
      }
      CFAllocatorRef v15 = kIOSurfaceFieldDetail_SpatialFirstLineLate;
    }
  }
  else if (v14 == 1)
  {
    CFAllocatorRef v15 = kIOSurfaceFieldDetail_TemporalTopFirst;
  }
  else
  {
    if (v14 != 6) {
      goto LABEL_25;
    }
    CFAllocatorRef v15 = kIOSurfaceFieldDetail_TemporalBottomFirst;
  }
  uint64_t v12 = *v15;
LABEL_25:
  if (v12) {
    CFIndex v16 = v13 + 1;
  }
  else {
    CFIndex v16 = v13;
  }
  YCbCrMatrixFromStruct = createYCbCrMatrixFromStruct(a2);
  if (YCbCrMatrixFromStruct) {
    ++v16;
  }
  ColorPrimariesFromStruct = createColorPrimariesFromStruct(a2);
  if (ColorPrimariesFromStruct) {
    ++v16;
  }
  TransferFunctionFromStruct = createTransferFunctionFromStruct(a2);
  if (TransferFunctionFromStruct) {
    ++v16;
  }
  ChromaLocationTopFieldFromStruct = createChromaLocationTopFieldFromStruct(a2);
  if (ChromaLocationTopFieldFromStruct) {
    ++v16;
  }
  ChromaLocationBottomFieldFromStruct = createChromaLocationBottomFieldFromStruct(a2);
  if (ChromaLocationBottomFieldFromStruct) {
    CFIndex v21 = v16 + 1;
  }
  else {
    CFIndex v21 = v16;
  }
  int v22 = *(unsigned __int8 *)(a2 + 63);
  v50 = a3;
  switch(v22)
  {
    case 3:
      long long v23 = kIOSurfaceChromaSubsampling_411;
      goto LABEL_45;
    case 2:
      long long v23 = kIOSurfaceChromaSubsampling_422;
      goto LABEL_45;
    case 1:
      long long v23 = kIOSurfaceChromaSubsampling_420;
LABEL_45:
      CFMutableDictionaryRef v24 = *v23;
      goto LABEL_47;
  }
  CFMutableDictionaryRef v24 = 0;
LABEL_47:
  long long v42 = v24;
  if (v24) {
    CFIndex v25 = v21 + 1;
  }
  else {
    CFIndex v25 = v21;
  }
  CFNumberRef EDRFactorFromStruct = createEDRFactorFromStruct(a2);
  if (EDRFactorFromStruct) {
    ++v25;
  }
  CFDataRef MasteringDisplayColorVolumeFromStruct = createMasteringDisplayColorVolumeFromStruct(a2);
  if (MasteringDisplayColorVolumeFromStruct) {
    ++v25;
  }
  CFDataRef ContentLightLevelInfoFromStruct = createContentLightLevelInfoFromStruct(a2);
  if (ContentLightLevelInfoFromStruct) {
    CFIndex v27 = v25 + 1;
  }
  else {
    CFIndex v27 = v25;
  }
  int v28 = *(unsigned __int8 *)(a2 + 100);
  if (v28 == 1)
  {
    long long v29 = kIOSurfaceAlphaChannelMode_StraightAlpha;
    goto LABEL_61;
  }
  if (v28 == 2)
  {
    long long v29 = kIOSurfaceAlphaChannelMode_PremultipliedAlpha;
LABEL_61:
    CFAllocatorRef v30 = *v29;
    goto LABEL_63;
  }
  CFAllocatorRef v30 = 0;
LABEL_63:
  v47 = v30;
  if (v30) {
    CFIndex v31 = v27 + 1;
  }
  else {
    CFIndex v31 = v27;
  }
  CFNumberRef SceneIlluminationFromStruct = createSceneIlluminationFromStruct(a2);
  if (SceneIlluminationFromStruct) {
    ++v31;
  }
  int valuePtr = *(unsigned __int8 *)(a2 + 101);
  if (valuePtr) {
    CFNumberRef v32 = CFNumberCreate(*v10, kCFNumberSInt32Type, &valuePtr);
  }
  else {
    CFNumberRef v32 = 0;
  }
  if (v32) {
    CFIndex v33 = v31 + 1;
  }
  else {
    CFIndex v33 = v31;
  }
  if (v33)
  {
    CFNumberRef v39 = v32;
    CFAllocatorRef v34 = *v10;
    if (a1)
    {
      CFIndex Count = CFDictionaryGetCount(a1);
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v34, Count + v33, a1);
    }
    else
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v34, v33, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    long long v37 = MutableCopy;
    if (value)
    {
      CFDictionarySetValue(MutableCopy, @"IOSurfaceCleanAperture", value);
      CFRelease(value);
    }
    if (v41)
    {
      CFDictionarySetValue(v37, @"IOSurfacePixelAspectRatio", v41);
      CFRelease(v41);
    }
    if (GammaLevelFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceGammaLevel", GammaLevelFromStruct);
      CFRelease(GammaLevelFromStruct);
    }
    if (v11)
    {
      CFDictionarySetValue(v37, @"IOSurfaceFieldCount", v11);
      CFRelease(v11);
    }
    if (v12)
    {
      CFDictionarySetValue(v37, @"IOSurfaceFieldDetail", v12);
      CFRelease(v12);
    }
    if (YCbCrMatrixFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceYCbCrMatrix", YCbCrMatrixFromStruct);
      CFRelease(YCbCrMatrixFromStruct);
    }
    if (ColorPrimariesFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceColorPrimaries", ColorPrimariesFromStruct);
      CFRelease(ColorPrimariesFromStruct);
    }
    if (TransferFunctionFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceTransferFunction", TransferFunctionFromStruct);
      CFRelease(TransferFunctionFromStruct);
    }
    if (ChromaLocationTopFieldFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceChromaLocationTopField", ChromaLocationTopFieldFromStruct);
      CFRelease(ChromaLocationTopFieldFromStruct);
    }
    if (ChromaLocationBottomFieldFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceChromaLocationBottomField", ChromaLocationBottomFieldFromStruct);
      CFRelease(ChromaLocationBottomFieldFromStruct);
    }
    if (v42)
    {
      CFDictionarySetValue(v37, @"IOSurfaceChromaSubsampling", v42);
      CFRelease(v42);
    }
    if (EDRFactorFromStruct)
    {
      CFDictionarySetValue(v37, @"IOSurfaceEDRFactor", EDRFactorFromStruct);
      CFRelease(EDRFactorFromStruct);
    }
    if (MasteringDisplayColorVolumeFromStruct)
    {
      CFDictionarySetValue(v37, @"MasteringDisplayColorVolume", MasteringDisplayColorVolumeFromStruct);
      CFRelease(MasteringDisplayColorVolumeFromStruct);
    }
    long long v38 = v50;
    if (ContentLightLevelInfoFromStruct)
    {
      CFDictionarySetValue(v37, @"ContentLightLevelInfo", ContentLightLevelInfoFromStruct);
      CFRelease(ContentLightLevelInfoFromStruct);
    }
    if (v47)
    {
      CFDictionarySetValue(v37, @"AlphaChannelMode", v47);
      CFRelease(v47);
    }
    if (SceneIlluminationFromStruct)
    {
      CFDictionarySetValue(v37, @"SceneIllumination", SceneIlluminationFromStruct);
      CFRelease(SceneIlluminationFromStruct);
    }
    if (v39)
    {
      CFDictionarySetValue(v37, @"IOSurfaceColorSpaceID", v39);
      CFRelease(v39);
    }
  }
  else
  {
    if (a1) {
      long long v37 = (__CFDictionary *)CFRetain(a1);
    }
    else {
      long long v37 = 0;
    }
    long long v38 = v50;
  }
  *long long v38 = v37;
}

CFDictionaryRef createPixelAspectRatioFromStruct(int *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v1 = a1[9];
  if (!v1) {
    return 0;
  }
  int v2 = a1[11];
  if (!v2) {
    return 0;
  }
  double v3 = (double)a1[8] / (double)v1;
  int v4 = a1[10];
  keys[0] = @"HorizontalSpacing";
  keys[1] = @"VerticalSpacing";
  double v8 = (double)v4 / (double)v2;
  double valuePtr = v3;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, &valuePtr);
  CFTypeRef cf = CFNumberCreate(v5, kCFNumberDoubleType, &v8);
  CFDictionaryRef v6 = CFDictionaryCreate(v5, (const void **)keys, (const void **)&values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFRelease(values);
  CFRelease(cf);
  return v6;
}

__CFString *createChromaLocationTopFieldFromStruct(uint64_t a1)
{
  switch(*(unsigned char *)(a1 + 61))
  {
    case 1:
      int v1 = kIOSurfaceChromaLocation_Left;
      goto LABEL_10;
    case 2:
      int v1 = kIOSurfaceChromaLocation_Center;
      goto LABEL_10;
    case 3:
      int v1 = kIOSurfaceChromaLocation_TopLeft;
      goto LABEL_10;
    case 4:
      int v1 = kIOSurfaceChromaLocation_Top;
      goto LABEL_10;
    case 5:
      int v1 = kIOSurfaceChromaLocation_BottomLeft;
      goto LABEL_10;
    case 6:
      int v1 = kIOSurfaceChromaLocation_Bottom;
      goto LABEL_10;
    case 7:
      int v1 = kIOSurfaceChromaLocation_DV420;
LABEL_10:
      uint64_t result = *v1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

CFNumberRef createGammaLevelFromStruct(uint64_t a1)
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 52);
  if (!v1) {
    return 0;
  }
  v3[0] = (double)*(int *)(a1 + 48) / (double)v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, v3);
}

__CFString *createChromaLocationBottomFieldFromStruct(uint64_t a1)
{
  switch(*(unsigned char *)(a1 + 62))
  {
    case 1:
      int v1 = kIOSurfaceChromaLocation_Left;
      goto LABEL_10;
    case 2:
      int v1 = kIOSurfaceChromaLocation_Center;
      goto LABEL_10;
    case 3:
      int v1 = kIOSurfaceChromaLocation_TopLeft;
      goto LABEL_10;
    case 4:
      int v1 = kIOSurfaceChromaLocation_Top;
      goto LABEL_10;
    case 5:
      int v1 = kIOSurfaceChromaLocation_BottomLeft;
      goto LABEL_10;
    case 6:
      int v1 = kIOSurfaceChromaLocation_Bottom;
      goto LABEL_10;
    case 7:
      int v1 = kIOSurfaceChromaLocation_DV420;
LABEL_10:
      uint64_t result = *v1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

CFDataRef createMasteringDisplayColorVolumeFromStruct(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  __int16 v1 = *(_WORD *)(a1 + 64);
  if (v1 || *(_WORD *)(a1 + 66))
  {
    UInt8 v2 = *(_WORD *)(a1 + 66);
    int v3 = HIBYTE(*(unsigned __int16 *)(a1 + 66));
  }
  else
  {
    if (!*(_WORD *)(a1 + 68)
      && !*(_WORD *)(a1 + 70)
      && !*(_WORD *)(a1 + 72)
      && !*(_WORD *)(a1 + 74)
      && !*(_WORD *)(a1 + 76)
      && !*(_WORD *)(a1 + 78)
      && !*(_DWORD *)(a1 + 80))
    {
      return 0;
    }
    UInt8 v2 = 0;
    LOBYTE(v3) = 0;
  }
  v6[0] = HIBYTE(v1);
  v6[1] = v1;
  v6[2] = v3;
  v6[3] = v2;
  __int16 v7 = bswap32(*(unsigned __int16 *)(a1 + 68)) >> 16;
  __int16 v8 = bswap32(*(unsigned __int16 *)(a1 + 70)) >> 16;
  __int16 v9 = bswap32(*(unsigned __int16 *)(a1 + 72)) >> 16;
  __int16 v10 = bswap32(*(unsigned __int16 *)(a1 + 74)) >> 16;
  __int16 v11 = bswap32(*(unsigned __int16 *)(a1 + 76)) >> 16;
  __int16 v12 = bswap32(*(unsigned __int16 *)(a1 + 78)) >> 16;
  unsigned int v4 = bswap32(*(_DWORD *)(a1 + 84));
  unsigned int v13 = bswap32(*(_DWORD *)(a1 + 80));
  unsigned int v14 = v4;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, 24);
}

CFDataRef createContentLightLevelInfoFromStruct(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 v1 = *(_WORD *)(a1 + 88);
  __int16 v2 = *(_WORD *)(a1 + 90);
  if (!v1 && !*(_WORD *)(a1 + 90)) {
    return 0;
  }
  bytes[0] = HIBYTE(v1);
  bytes[1] = v1;
  bytes[2] = HIBYTE(v2);
  bytes[3] = v2;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, 4);
}

CFNumberRef createSceneIlluminationFromStruct(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned int *)(a1 + 112);
  v3[0] = v1;
  if (!v1) {
    return 0;
  }
  if (v1 == 1) {
    v3[0] = 0;
  }
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt64Type, v3);
}

CFNumberRef createEDRFactorFromStruct(uint64_t a1)
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  int v1 = *(_DWORD *)(a1 + 96);
  if (!v1) {
    return 0;
  }
  v3[0] = (double)*(int *)(a1 + 92) / (double)v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberDoubleType, v3);
}

void sniffYCbCrMatrixKeyToStruct(const __CFString *a1, uint64_t a2)
{
  v9[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!a1)
  {
    *(unsigned char *)(a2 + 58) = 0;
    goto LABEL_10;
  }
  v9[0] = 0;
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID() && CFDictionaryGetValueIfPresent((CFDictionaryRef)_yCbCrMatrixKeysToStructDict, a1, v9))
  {
    *(unsigned char *)(a2 + 58) = v9[0];
LABEL_10:
    *(void *)(a2 + 120) |= 0x20uLL;
    return;
  }
  CFTypeID v5 = CFGetTypeID(a1);
  if (v5 == CFStringGetTypeID() && CFStringHasPrefix(a1, @"YCbCrMatrix#"))
  {
    CFIndex Length = CFStringGetLength(a1);
    v10.location = CFStringGetLength(@"YCbCrMatrix#");
    v10.length = Length - v10.location;
    CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v10);
    if (v7)
    {
      CFStringRef v8 = v7;
      *(unsigned char *)(a2 + 58) = CFStringGetIntValue(v7);
      *(void *)(a2 + 120) |= 0x20uLL;
      CFRelease(v8);
    }
  }
}

CFDictionaryRef sniffCleanApertureKeyToStruct(const __CFDictionary *result, uint64_t a2)
{
  v11[1] = *(double *)MEMORY[0x1E4F143B8];
  if (!result)
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    goto LABEL_9;
  }
  CFDictionaryRef v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  uint64_t result = (const __CFDictionary *)CFDictionaryGetTypeID();
  if ((const __CFDictionary *)v4 == result)
  {
    double v10 = 0.0;
    v11[0] = 0.0;
    double v8 = 0.0;
    double v9 = 0.0;
    uint64_t result = getDoubleFromDict(v3, @"Width", v11);
    if (result)
    {
      uint64_t result = getDoubleFromDict(v3, @"Height", &v10);
      if (result)
      {
        uint64_t result = getDoubleFromDict(v3, @"HorizontalOffset", &v9);
        if (result)
        {
          uint64_t result = getDoubleFromDict(v3, @"VerticalOffset", &v8);
          if (result)
          {
            unsigned int v5 = llround(v10 * 16.0);
            *(_DWORD *)a2 = llround(v11[0] * 16.0);
            *(_DWORD *)(a2 + 4) = 16;
            unsigned int v6 = llround(v9 * 16.0);
            *(_DWORD *)(a2 + 8) = v5;
            *(_DWORD *)(a2 + 12) = 16;
            unsigned int v7 = llround(v8 * 16.0);
            *(_DWORD *)(a2 + 16) = v6;
            *(_DWORD *)(a2 + 20) = 16;
            *(_DWORD *)(a2 + 24) = v7;
            *(_DWORD *)(a2 + 28) = 16;
LABEL_9:
            *(void *)(a2 + 120) |= 1uLL;
          }
        }
      }
    }
  }
  return result;
}

CFNumberRef getDoubleFromDict(const __CFDictionary *a1, const void *a2, void *a3)
{
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID()) {
      return (const __CFNumber *)(CFNumberGetValue(v5, kCFNumberDoubleType, a3) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

CFTypeID sniffColorSpaceIDKeyToStruct(CFTypeID result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int valuePtr = 0;
  if (result
    && (CFNumberRef v3 = (const __CFNumber *)result, TypeID = CFNumberGetTypeID(), result = CFGetTypeID(v3), TypeID == result))
  {
    CFNumberRef result = CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr);
    char v5 = valuePtr;
    if (valuePtr > 0xFF) {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  *(unsigned char *)(a2 + 101) = v5;
  *(void *)(a2 + 120) |= 0x20000uLL;
  return result;
}

CFNumberRef createFieldCountFromStruct(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56)) {
    return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt8Type, (const void *)(a1 + 56));
  }
  else {
    return 0;
  }
}

CFTypeID sniffChromaLocationTopKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  CFNumberRef result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    CFNumberRef result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaLocationKeysToStructDict, v3, v6);
    if (result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(unsigned char *)(a2 + 61) = v5;
      *(void *)(a2 + 120) |= 0x100uLL;
    }
  }
  return result;
}

CFTypeID sniffChromaLocationBottomKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  CFNumberRef result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    CFNumberRef result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaLocationKeysToStructDict, v3, v6);
    if (result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(unsigned char *)(a2 + 62) = v5;
      *(void *)(a2 + 120) |= 0x200uLL;
    }
  }
  return result;
}

__CFString *createAlphaChannelModeFromStruct(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 100);
  if (v1 == 1)
  {
    __int16 v2 = kIOSurfaceAlphaChannelMode_StraightAlpha;
    return *v2;
  }
  if (v1 == 2)
  {
    __int16 v2 = kIOSurfaceAlphaChannelMode_PremultipliedAlpha;
    return *v2;
  }
  return 0;
}

__CFString *createFieldDetailFromStruct(uint64_t a1)
{
  CFNumberRef result = 0;
  int v3 = *(unsigned __int8 *)(a1 + 57);
  if (v3 > 8)
  {
    if (v3 == 9)
    {
      CFTypeID v4 = kIOSurfaceFieldDetail_SpatialFirstLineEarly;
    }
    else
    {
      if (v3 != 14) {
        return result;
      }
      CFTypeID v4 = kIOSurfaceFieldDetail_SpatialFirstLineLate;
    }
  }
  else if (v3 == 1)
  {
    CFTypeID v4 = kIOSurfaceFieldDetail_TemporalTopFirst;
  }
  else
  {
    if (v3 != 6) {
      return result;
    }
    CFTypeID v4 = kIOSurfaceFieldDetail_TemporalBottomFirst;
  }
  return *v4;
}

void sniffContentLightLevelInfoKeyToStruct(const __CFData *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)buffer = 0;
  if (a1 && (CFTypeID TypeID = CFDataGetTypeID(), TypeID == CFGetTypeID(a1)) && CFDataGetLength(a1) == 4)
  {
    v11.location = 0;
    v11.length = 4;
    CFDataGetBytes(a1, v11, buffer);
    __int16 v5 = buffer[0];
    __int16 v6 = buffer[1];
    __int16 v7 = buffer[2];
    __int16 v8 = buffer[3];
  }
  else
  {
    __int16 v8 = 0;
    __int16 v7 = 0;
    __int16 v6 = 0;
    __int16 v5 = 0;
  }
  *(_WORD *)(a2 + 88) = v6 | (v5 << 8);
  *(_WORD *)(a2 + 90) = v8 | (v7 << 8);
  *(void *)(a2 + 120) |= 0x1000uLL;
}

uint64_t IOSurfaceClientGetBytesPerElement(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 208);
}

uint64_t IOSurfaceClientGetCompressionFootprintOfPlane(uint64_t a1, unint64_t a2)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 364);
  }
}

uint64_t IOSurfaceGetParentID(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetParentID(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceClientGetDetachModeCode(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 128) + 40);
}

uint64_t IOSurfaceSetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t result, unsigned int a2, uint64_t a3)
{
  if (result) {
    return IOSurfaceClientSetCompressedTileDataRegionMemoryUsedOfPlane(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t compareKeys(void *key, const void *a2, uint64_t a3)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)a3, key);
  if (!result || (uint64_t result = CFEqual((CFTypeRef)result, a2), !result)) {
    *(unsigned char *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t IOSurfaceClientGetElementWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    __int16 v2 = (unsigned __int8 *)(a1 + 210);
  }
  else
  {
    __int16 v2 = (unsigned __int8 *)(a1 + 152 * a2 + 298);
  }
  return *v2;
}

uint64_t IOSurfaceClientGetBytesPerElementOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    __int16 v2 = (unsigned __int16 *)(a1 + 208);
  }
  else
  {
    __int16 v2 = (unsigned __int16 *)(a1 + 152 * a2 + 296);
  }
  return *v2;
}

uint64_t IOSurfaceClientGetYCbCrMatrix(uint64_t a1, _DWORD *a2)
{
  *a2 = *(unsigned __int8 *)(*(void *)(a1 + 120) + 106);
  return 0;
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  if (buffer) {
    return IOSurfaceClientSetPurgeable(*((void *)buffer + 1), newState, oldState);
  }
  else {
    return -536870206;
  }
}

uint64_t IOSurfaceSetOwnership(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  if (a1) {
    return IOSurfaceClientSetOwnership(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceClientAllowsPixelSizeCasting(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 120) + 44);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F41817D0](IOSurface);
}

size_t IOSurfaceGetElementHeight(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetElementHeight(*(void *)(buffer + 8));
  }
  return buffer;
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2 || *(_DWORD *)(a1 + 228) > 1u) {
    return 0;
  }
  else {
    return *(void *)(a1 + 112) + *(unsigned int *)(a1 + 112 + 152 * a2 + 220);
  }
}

void IOSurfaceSetValues(IOSurfaceRef buffer, CFDictionaryRef keysAndValues)
{
  if (buffer)
  {
    if (keysAndValues)
    {
      CFTypeID v4 = CFGetTypeID(keysAndValues);
      if (v4 == CFDictionaryGetTypeID())
      {
        uint64_t v5 = *((void *)buffer + 1);
        IOSurfaceClientSetValue(v5, 0, keysAndValues);
      }
    }
  }
}

uint64_t IOSurfaceSetBulkAttachments2(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1) {
    return IOSurfaceClientSetBulkAttachments(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceGetYCbCrMatrix(uint64_t a1, _DWORD *a2)
{
  if (a1) {
    return IOSurfaceClientGetYCbCrMatrix(*(void *)(a1 + 8), a2);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceClientGetCacheMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 212);
}

void serializeReplacementDictionaryKeysAndValues(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  uint64_t v5 = (const void *)serializeReplacementIOKitTypeRef(a2);
  CFDictionarySetValue(a3, a1, v5);

  CFRelease(v5);
}

void addValueToSet(void *value, CFMutableSetRef theSet)
{
}

void insertKeyIfNotListedForRemoval(void *value, const void *a2, uint64_t a3)
{
  __int16 v6 = *(__CFDictionary **)(a3 + 8);
  if (CFSetContainsValue(*(CFSetRef *)a3, value))
  {
    *(unsigned char *)(a3 + 16) = 1;
  }
  else
  {
    CFDictionarySetValue(v6, value, a2);
  }
}

uint64_t IOSurfaceGetDetachModeCode(uint64_t a1)
{
  if (a1) {
    return IOSurfaceClientGetDetachModeCode(*(void *)(a1 + 8));
  }
  else {
    return 0xFFFFFFFFFFFFLL;
  }
}

uint64_t IOSurfaceGetDataProperty(uint64_t a1, unsigned int a2, size_t a3, void *a4, void *a5)
{
  if (a1) {
    return IOSurfaceClientGetDataProperty(*(void *)(a1 + 8), a2, a3, a4, a5);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceClientLock(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v9 = 0;
  io_connect_t v6 = _ioSurfaceConnectInternal(0);
  uint64_t result = IOConnectTrap3(v6, 2u, *(unsigned int *)(a1 + 136), a2, (uintptr_t)&v9);
  if (!result)
  {
    int v8 = v9;
    *(_DWORD *)(a1 + 216) = v9;
    if (a3) {
      *a3 = v8;
    }
  }
  return result;
}

uint64_t IOSurfaceClientUnlock(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v9 = 0;
  io_connect_t v6 = _ioSurfaceConnectInternal(0);
  uint64_t result = IOConnectTrap3(v6, 3u, *(unsigned int *)(a1 + 136), a2, (uintptr_t)&v9);
  if (!result)
  {
    int v8 = v9;
    *(_DWORD *)(a1 + 216) = v9;
    if (a3) {
      *a3 = v8;
    }
  }
  return result;
}

size_t IOSurfaceGetElementWidth(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetElementWidth(*(void *)(buffer + 8));
  }
  return buffer;
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientCreateMachPort(*((void *)buffer + 1));
  }
  return buffer;
}

size_t IOSurfaceGetBytesPerElement(size_t buffer)
{
  if (buffer) {
    return IOSurfaceClientGetBytesPerElement(*(void *)(buffer + 8));
  }
  return buffer;
}

uint64_t IOSurfaceCreateWiringAssertion(uint64_t a1)
{
  __int16 v2 = [IOSurfaceWiringAssertion alloc];

  return (uint64_t)[(IOSurfaceWiringAssertion *)v2 initWithIOSurface:a1];
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClearDataProperties(uint64_t a1)
{
  if (a1) {
    return IOSurfaceClientClearDataProperties(*(void *)(a1 + 8));
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceGetSizeOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetSizeOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

void IOSurfaceRemoveAllValues(IOSurfaceRef buffer)
{
  if (buffer) {
    IOSurfaceClientRemoveValue(*((void *)buffer + 1), 0);
  }
}

uint64_t IOSurfaceInitDetachModeCode(uint64_t result)
{
  if (result) {
    return IOSurfaceClientInitDetachModeCode(*(void *)(result + 8));
  }
  return result;
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  if (buffer) {
    LOBYTE(buffer) = IOSurfaceClientAllowsPixelSizeCasting(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceClientDecrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  uint64_t v3 = result;
  if (a2 >= 2) {
    uint64_t result = [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"category out of range"];
  }
  if (*(unsigned char *)(v3 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceDecrementUseCountForCategory: error: Attempt to change use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)v3);
    qword_1E9739858 = (uint64_t)crashMessage;
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v9) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    abort();
  }
  do
  {
    unint64_t v4 = *(void *)(v3 + 8);
    unint64_t v5 = HIDWORD(v4);
    unint64_t v6 = (v4 - (v4 != 0)) | v4 & 0xFFFFFFFF00000000;
    if (a2) {
      unint64_t v6 = v4 | ((unint64_t)(HIDWORD(v4) - (HIDWORD(v4) != 0)) << 32);
    }
    else {
      LODWORD(v5) = *(void *)(v3 + 8);
    }
    uint64_t v7 = *(void *)(v3 + 8);
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(v3 + 8), (unint64_t *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
  }
  while (v7 != v4);
  if (v5 == 1)
  {
    io_connect_t v8 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectTrap2(v8, 1u, *(unsigned int *)(v3 + 136), a2);
    if (result) {
      return fprintf((FILE *)*MEMORY[0x1E4F143C8], "kIOSurfaceMethodDecrementUseCountForCategory failed: %08x\n", result);
    }
  }
  return result;
}

uint64_t IOSurfaceGetExtendedPixelsOfPlane(uint64_t result, unsigned int a2, void *a3, void *a4, void *a5, void *a6)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  v13[0] = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (result) {
    uint64_t result = IOSurfaceClientGetExtendedPixelsOfPlane(*(void *)(result + 8), a2, v13, &v12, &v11, &v10);
  }
  if (a3) {
    *a3 = v13[0];
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = v11;
  }
  if (a6) {
    *a6 = v10;
  }
  return result;
}

uint64_t IOSurfaceClientGetExtendedPixelsOfPlane(uint64_t result, unsigned int a2, void *a3, void *a4, void *a5, void *a6)
{
  if (!a2 || *(_DWORD *)(result + 200) > a2)
  {
    unint64_t v6 = (unsigned int *)(result + 152 * a2);
    *a3 = v6[98];
    *a4 = v6[96];
    *a5 = v6[99];
    *a6 = v6[97];
  }
  return result;
}

void removeAllButNameAndCreation(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  if (a1 && !CFEqual(a1, @"IOSurfaceName") && !CFEqual(a1, @"CreationProperties"))
  {
    CFDictionaryRemoveValue(a3, a1);
  }
}

uint64_t IOSurfaceClientSetDetachModeCode(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  if (byte_1EB28B2E8)
  {
    *(void *)(*(void *)(result + 128) + 40) = *(void *)(*(void *)(result + 128) + 40) & ~a2 | a3 & a2;
  }
  else
  {
    input[0] = *(unsigned int *)(result + 136);
    input[1] = a2;
    input[2] = a3;
    uint64_t input[3] = 0;
    mach_port_t v3 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v3, 0x2Bu, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t IOSurfaceClientSetOwnership(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  uint64_t input[3] = a4;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x15u, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientSetPurgeable(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  input[2] = *MEMORY[0x1E4F143B8];
  uint32_t outputCnt = 1;
  uint64_t v4 = *(unsigned int *)(a1 + 136);
  uint64_t output = 0;
  input[0] = v4;
  input[1] = a2;
  mach_port_t v5 = _ioSurfaceConnectInternal(0);
  uint64_t result = IOConnectCallMethod(v5, 0x14u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  if (a3) {
    *a3 = output;
  }
  return result;
}

uint64_t IOSurfaceClientGetSizeOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    uint64_t v2 = a1 + 144;
  }
  else
  {
    uint64_t v2 = a1 + 152 * a2 + 288;
  }
  return *(void *)v2;
}

uint64_t IOSurfaceClientSetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  uint64_t result = 3758097090;
  if (a2 <= 4 && *(_DWORD *)(a1 + 200) > a2)
  {
    input[0] = *(unsigned int *)(a1 + 136);
    input[1] = a2;
    input[2] = a3;
    mach_port_t v5 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v5, 0x1Fu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClientRemoveValue(uint64_t a1, __CFString *key)
{
  kern_return_t v16;
  int v17;
  int v18;
  CFDictionaryRef v19;
  CFAllocatorRef v20;
  CFMutableDictionaryRef MutableCopy;
  CFDictionaryRef v22;
  CFAllocatorRef v23;
  __CFDictionary *v24;
  const void *v25;
  CFAllocatorRef v26;
  const void *v27;
  size_t v28;
  int outputStruct;
  uint64_t v30;
  uint64_t vars8;

  CFAllocatorRef v30 = *MEMORY[0x1E4F143B8];
  int outputStruct = 0;
  int v28 = 4;
  if (!key)
  {
    IOSurfaceClientRemoveBulkAttachments(a1, 0x3FFFF);
    unint64_t v6 = (pthread_mutex_t *)(a1 + 40);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 16);
    if ((!v7 || !CFDictionaryGetCount(v7)) && *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(void *)(a1 + 120) + 32)) {
      goto LABEL_13;
    }
    size_t v8 = 13;
    BOOL v9 = (char *)malloc_type_malloc(0xDuLL, 0x7A36B127uLL);
    *(_DWORD *)BOOL v9 = *(_DWORD *)(a1 + 136);
    v9[12] = 0;
    goto LABEL_18;
  }
  uint64_t v4 = _sniffKeysToMask(key);
  if (v4)
  {
    return IOSurfaceClientRemoveBulkAttachments(a1, (int)v4);
  }
  unint64_t v6 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  CFDictionaryRef v10 = *(const __CFDictionary **)(a1 + 16);
  if (v10 && CFDictionaryGetValue(v10, key) || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(void *)(a1 + 120) + 32))
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, key, 0x8000100u, 0);
    if (!ExternalRepresentation)
    {
      BOOL v9 = 0;
      goto LABEL_39;
    }
    CFDataRef v12 = ExternalRepresentation;
    size_t Length = CFDataGetLength(ExternalRepresentation);
    size_t v8 = (Length + 13);
    BOOL v9 = (char *)malloc_type_malloc(v8, 0x3D0DEB14uLL);
    *(_DWORD *)BOOL v9 = *(_DWORD *)(a1 + 136);
    BytePtr = CFDataGetBytePtr(v12);
    memcpy(v9 + 12, BytePtr, Length);
    v9[Length + 12] = 0;
    CFRelease(v12);
LABEL_18:
    mach_port_t v15 = _ioSurfaceConnectInternal(0);
    uint64_t v16 = IOConnectCallMethod(v15, 0xBu, 0, 0, v9, v8, 0, 0, &outputStruct, &v28);
    if (v16) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "kIOSurfaceMethodRemoveValue failed: %08x\n", v16);
    }
    CFAllocatorRef v17 = *(_DWORD *)(a1 + 32);
    if (!v17) {
      goto LABEL_39;
    }
    uint64_t v18 = (v17 | 1) + 2;
    if (outputStruct != v18) {
      goto LABEL_39;
    }
    *(_DWORD *)(a1 + 32) = v18;
    if (key)
    {
      if (!CFEqual(@"CreationProperties", key))
      {
        CFAllocatorRef v19 = *(const __CFDictionary **)(a1 + 16);
        int v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        if (v19) {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v19);
        }
        else {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        }
        CFMutableDictionaryRef v24 = MutableCopy;
        if (!CFEqual(key, @"IOSurfaceName") && !CFEqual(key, @"CreationProperties")) {
          CFDictionaryRemoveValue(v24, key);
        }
        CFIndex v27 = *(const void **)(a1 + 16);
        if (v27) {
          CFRelease(v27);
        }
        CFAllocatorRef v26 = v20;
LABEL_38:
        *(void *)(a1 + 16) = CFDictionaryCreateCopy(v26, v24);
        CFRelease(v24);
      }
    }
    else
    {
      int v22 = *(const __CFDictionary **)(a1 + 16);
      if (v22)
      {
        long long v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFMutableDictionaryRef v24 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v22);
        CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 16), (CFDictionaryApplierFunction)removeAllButNameAndCreation, v24);
        CFIndex v25 = *(const void **)(a1 + 16);
        if (v25) {
          CFRelease(v25);
        }
        CFAllocatorRef v26 = v23;
        goto LABEL_38;
      }
    }
LABEL_39:
    free(v9);
    return pthread_mutex_unlock(v6);
  }
LABEL_13:

  return pthread_mutex_unlock(v6);
}

const void *_sniffKeysToMask(void *key)
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
  CFDictionaryRef v2 = (const __CFDictionary *)_sniffKeysMaskDict;

  return CFDictionaryGetValue(v2, key);
}

uint64_t IOSurfaceClientRemoveCoreVideoBridgedValues(uint64_t a1)
{
  kern_return_t v5;
  uint64_t context;
  CFTypeRef cf;
  uint64_t v9;
  int v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v10 = 0;
  CFTypeRef cf = 0;
  BOOL v9 = 0;
  if (*(void *)(a1 + 16)) {
    BOOL v2 = *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(void *)(a1 + 120) + 32);
  }
  else {
    BOOL v2 = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  pthread_mutex_lock(&_iosCoreVideoBridgedKeysMutex);
  context = _iosBridgedCoreVideoKeys;
  LOBYTE(v9) = 0;
  if (v2)
  {
    CFTypeRef cf = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 16), (CFDictionaryApplierFunction)insertKeyIfNotListedForRemoval, &context);
    if ((_BYTE)v9)
    {
      CFRelease(*(CFTypeRef *)(a1 + 16));
      *(void *)(a1 + 16) = cf;
      CFTypeRef cf = 0;
      *(_DWORD *)(a1 + 32) = (*(_DWORD *)(a1 + 32) | 1) + 2;
    }
  }
  pthread_mutex_unlock(&_iosCoreVideoBridgedKeysMutex);
  if ((_BYTE)v9) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = v2;
  }
  if (v3)
  {
    IOSurfaceClientRemoveBulkAttachments(a1, 0x3FFFF);
  }
  else
  {
    io_connect_t v4 = _ioSurfaceConnectInternal(0);
    mach_port_t v5 = IOConnectTrap2(v4, 8u, *(unsigned int *)(a1 + 136), (uintptr_t)&v10);
    if (v5) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "kIOSurfaceTrapRemoveCoreVideoBridgedValues failed: %08x\n", v5);
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
}

uint64_t IOSurfaceClientRemoveBulkAttachments(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 120);
  int v9 = 0;
  memset(v8, 0, sizeof(v8));
  uint64_t result = getDirtyMask(v4 + 48, (uint64_t)v8, a2);
  if (result)
  {
    if ((~a2 & 0x3FFFF) != 0) {
      uintptr_t v6 = result;
    }
    else {
      uintptr_t v6 = 0x3FFFFLL;
    }
    io_connect_t v7 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectTrap2(v7, 9u, *(unsigned int *)(a1 + 136), v6);
    if (result) {
      return fprintf((FILE *)*MEMORY[0x1E4F143C8], "kIOSurfaceTrapRemoveBulkAttachments failed: %08x\n", result);
    }
  }
  return result;
}

void setEachValueInDictionary(CFTypeRef cf2, const void *a2, __CFDictionary *a3)
{
  if (!CFEqual(@"CreationProperties", cf2))
  {
    CFDictionarySetValue(a3, cf2, a2);
  }
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2 || *(_DWORD *)(a1 + 228) > 1u) {
    return 0;
  }
  else {
    return *(void *)(a1 + 112) + *(unsigned int *)(a1 + 112 + 152 * a2 + 224);
  }
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  uint64_t v1 = *(void *)&port;
  BOOL v2 = [IOSurface alloc];

  return (IOSurfaceRef)[(IOSurface *)v2 initWithMachPort:v1];
}

uint64_t IOSurfaceGetCacheMode(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetCacheMode(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceSetDataProperty(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  if (a1) {
    return IOSurfaceClientSetDataProperty(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceClientGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 352);
  }
}

uint64_t IOSurfaceClientClearDataProperties(uint64_t a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 120) + 47)) {
    return 0;
  }
  input[0] = *(unsigned int *)(a1 + 136);
  mach_port_t v1 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v1, 0x34u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetDataProperty(uint64_t a1, unsigned int a2, size_t a3, void *a4, void *a5)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  size_t v14 = a3;
  uint64_t output = 0;
  uint64_t v16 = 0;
  uint32_t outputCnt = 2;
  if (a3) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  char v7 = v6;
  uint64_t result = 3758097090;
  if (a2 <= 4 && (v7 & 1) == 0)
  {
    if (((*(unsigned __int8 *)(v5 + 47) >> a2) & 1) == 0)
    {
      uint64_t v12 = 0;
      uint64_t result = 0;
      goto LABEL_14;
    }
    mach_port_t v11 = _ioSurfaceConnectInternal(0);
    uint64_t result = IOConnectCallMethod(v11, 0x33u, input, 2u, 0, 0, &output, &outputCnt, a5, &v14);
    if (!result)
    {
      uint64_t result = output;
      if (a4)
      {
        uint64_t v12 = v16;
LABEL_14:
        *a4 = v12;
      }
    }
  }
  return result;
}

uint64_t IOSurfaceClientInitDetachModeCode(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (byte_1EB28B2E8)
  {
    uint64_t v1 = *(void *)(a1 + 128);
    *(void *)(v1 + 40) = 0xFFFFFFFFFFFFLL;
    uint64_t result = mach_absolute_time();
    *(void *)(v1 + 16) = result;
  }
  else
  {
    uint64_t input = *(unsigned int *)(a1 + 136);
    long long v5 = xmmword_1A7C383D0;
    uint64_t v6 = mach_absolute_time();
    mach_port_t v3 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v3, 0x2Bu, &input, 4u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t IOSurfaceSetYCbCrMatrix(uint64_t a1, unsigned int a2)
{
  if (a1) {
    return IOSurfaceClientSetYCbCrMatrix(*(void *)(a1 + 8), a2);
  }
  else {
    return 3758097090;
  }
}

void sniffTransferFunctionKeyToStruct(const __CFString *a1, uint64_t a2)
{
  v8[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!a1)
  {
    *(unsigned char *)(a2 + 60) = 0;
    goto LABEL_9;
  }
  v8[0] = 0;
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID()
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)_transferFunctionKeysToStructDict, a1, v8))
  {
    *(unsigned char *)(a2 + 60) = v8[0];
LABEL_9:
    *(void *)(a2 + 120) |= 0x80uLL;
    return;
  }
  if (CFStringHasPrefix(a1, @"TransferFunction#"))
  {
    CFIndex Length = CFStringGetLength(a1);
    v9.location = CFStringGetLength(@"TransferFunction#");
    v9.length = Length - v9.location;
    CFStringRef v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v9);
    if (v6)
    {
      CFStringRef v7 = v6;
      *(unsigned char *)(a2 + 60) = CFStringGetIntValue(v6);
      *(void *)(a2 + 120) |= 0x80uLL;
      CFRelease(v7);
    }
  }
}

void sniffColorPrimariesKeyToStruct(const __CFString *a1, uint64_t a2)
{
  v8[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!a1)
  {
    *(unsigned char *)(a2 + 59) = 0;
    goto LABEL_9;
  }
  v8[0] = 0;
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID()
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)_colorPrimariesKeysToStructDict, a1, v8))
  {
    *(unsigned char *)(a2 + 59) = v8[0];
LABEL_9:
    *(void *)(a2 + 120) |= 0x40uLL;
    return;
  }
  if (CFStringHasPrefix(a1, @"ColorPrimaries#"))
  {
    CFIndex Length = CFStringGetLength(a1);
    v9.location = CFStringGetLength(@"ColorPrimaries#");
    v9.length = Length - v9.location;
    CFStringRef v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v9);
    if (v6)
    {
      CFStringRef v7 = v6;
      *(unsigned char *)(a2 + 59) = CFStringGetIntValue(v6);
      *(void *)(a2 + 120) |= 0x40uLL;
      CFRelease(v7);
    }
  }
}

uint64_t IOSurfaceClientGetProhibitUseCount(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 221);
}

uint64_t IOSurfaceGetOffsetOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetOffsetOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceClientSetDataProperty(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  uint64_t result = 3758097090;
  uint64_t v8 = *(void *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  if ((!a3 || a4) && a2 <= 4 && a3 <= 0x400)
  {
    if (a3 || a4 || ((*(unsigned __int8 *)(v8 + 47) >> a2) & 1) != 0)
    {
      mach_port_t v9 = _ioSurfaceConnectInternal(0);
      return IOConnectCallMethod(v9, 0x32u, input, 2u, a4, a3, 0, 0, 0, 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFTypeID sniffFieldCountKeyToStruct(CFTypeID result, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char valuePtr = 0;
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFNumberGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberSInt8Type, &valuePtr);
    if (result)
    {
      char v5 = valuePtr;
LABEL_6:
      *(unsigned char *)(a2 + 56) = v5;
      *(void *)(a2 + 120) |= 8uLL;
    }
  }
  return result;
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  if (!xobj) {
    return 0;
  }
  if (MEMORY[0x1AD0D65F0]() != MEMORY[0x1E4F145C8]) {
    return 0;
  }
  uint64_t right = xpc_mach_send_get_right();
  if (!right) {
    return 0;
  }
  uint64_t v3 = right;
  CFTypeID v4 = [IOSurface alloc];

  return (IOSurfaceRef)[(IOSurface *)v4 initWithMachPort:v3];
}

CFDictionaryRef sniffPixelAspectRatioKeyToStruct(const __CFDictionary *result, uint64_t a2)
{
  v7[1] = *(double *)MEMORY[0x1E4F143B8];
  if (!result)
  {
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 40) = 0;
    goto LABEL_7;
  }
  CFDictionaryRef v3 = result;
  CFTypeID v4 = CFGetTypeID(result);
  uint64_t result = (const __CFDictionary *)CFDictionaryGetTypeID();
  if ((const __CFDictionary *)v4 == result)
  {
    double v6 = 0.0;
    v7[0] = 0.0;
    uint64_t result = getDoubleFromDict(v3, @"HorizontalSpacing", v7);
    if (result)
    {
      uint64_t result = getDoubleFromDict(v3, @"VerticalSpacing", &v6);
      if (result)
      {
        unsigned int v5 = llround(v6 * 16.0);
        *(_DWORD *)(a2 + 32) = llround(v7[0] * 16.0);
        *(_DWORD *)(a2 + 36) = 16;
        *(_DWORD *)(a2 + 40) = v5;
        *(_DWORD *)(a2 + 44) = 16;
LABEL_7:
        *(void *)(a2 + 120) |= 2uLL;
      }
    }
  }
  return result;
}

uint64_t IOSurfaceClientGetOffsetOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    uint64_t v2 = a1 + 176;
  }
  else
  {
    uint64_t v2 = a1 + 152 * a2 + 272;
  }
  return *(void *)v2;
}

uint64_t IOSurfaceClientSetYCbCrMatrix(uint64_t a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v2, 5u, input, 2u, 0, 0, 0, 0, 0, 0);
}

CFTypeID sniffAlphaChannelModeKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  CFDictionaryRef v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    uint64_t result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_premultipliedAlphaKeysToStructDict, v3, v6);
    if (result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(unsigned char *)(a2 + 100) = v5;
      *(void *)(a2 + 120) |= 0x4000uLL;
    }
  }
  return result;
}

uint64_t IOSurfaceClientGetSeed(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 120) + 12);
}

uint64_t IOSurfaceGetProhibitUseCount(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetProhibitUseCount(*(void *)(result + 8));
  }
  return result;
}

void serializeReplacementArrayValues(uint64_t a1, __CFArray *a2)
{
  CFDictionaryRef v3 = (const void *)serializeReplacementIOKitTypeRef(a1);
  CFArrayAppendValue(a2, v3);

  CFRelease(v3);
}

uint32_t IOSurfaceGetSeed(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetSeed(*((void *)buffer + 1));
  }
  return buffer;
}

uint64_t IOSurfaceGetGraphicsCommPageAddress()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  mach_port_t v0 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v0, 0x20u, 0, 0, 0, 0, &output, &outputCnt, 0, 0)) {
    return 0;
  }
  else {
    return output;
  }
}

uint64_t IOSurfaceSetOwnershipIdentity(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  if (a1) {
    return IOSurfaceClientSetOwnershipIdentity(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090;
  }
}

CFArrayRef IOSurfaceSetCoreVideoBridgedKeys(const __CFArray *result)
{
  if (result)
  {
    CFArrayRef v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    uint64_t result = (const __CFArray *)CFArrayGetTypeID();
    if ((const __CFArray *)v2 == result)
    {
      return (const __CFArray *)IOSurfaceClientSetCoreVideoBridgedKeys(v1);
    }
  }
  return result;
}

uint64_t IOSurfaceClientAlignProperty(const void *a1, uint64_t a2)
{
  _ioSurfaceConnectInternal(0);
  if (CFEqual(a1, @"IOSurfaceBytesPerRow") || CFEqual(a1, @"IOSurfacePlaneBytesPerRow"))
  {
    int v4 = HIDWORD(ioSurfaceLimits);
    return (v4 + a2) & ~v4;
  }
  if (CFEqual(a1, @"IOSurfaceOffset")
    || CFEqual(a1, @"IOSurfacePlaneOffset")
    || CFEqual(a1, @"IOSurfacePlaneBase"))
  {
    int v4 = ioSurfaceLimits;
    return (v4 + a2) & ~v4;
  }
  return a2;
}

uint64_t IOSurfaceSharedEventAddEventListener(unint64_t a1, IONotificationPortRef notify)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  reference[0] = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  reference[1] = (uint64_t)_ioSurfaceEventNotificationCallback2;
  long long v7 = a1;
  mach_port_t MachPort = IONotificationPortGetMachPort(notify);
  if (!MachPort) {
    IOSurfaceSharedEventAddEventListener_cold_1();
  }
  mach_port_t v3 = MachPort;
  mach_port_t v4 = _ioSurfaceConnect();
  return IOConnectCallAsyncMethod(v4, 0x28u, v3, reference, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t _ioSurfaceConnect()
{
  return _ioSurfaceConnectInternal(0);
}

uint64_t IOSurfaceCreateChildSurface(void *a1, void *a2)
{
  id DictionaryAddingMissingProperties = _iosCreateDictionaryAddingMissingProperties(a2);
  uint64_t v4 = [a1 newChildSurfaceWithProperties:DictionaryAddingMissingProperties];

  return v4;
}

uint64_t IOSurfaceClientGetPropertyMaximum(const void *a1)
{
  if (CFEqual(a1, @"IOSurfaceBytesPerRow") || CFEqual(a1, @"IOSurfacePlaneBytesPerRow")) {
    return qword_1EB28B2D0;
  }
  if (CFEqual(a1, @"IOSurfaceWidth") || CFEqual(a1, @"IOSurfacePlaneWidth")) {
    return qword_1EB28B2D8;
  }
  if (CFEqual(a1, @"IOSurfaceHeight") || CFEqual(a1, @"IOSurfacePlaneHeight")) {
    return qword_1EB28B2E0;
  }
  return 0;
}

uint64_t IOSurfaceClientSetOwnershipIdentity(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  uint64_t input[2] = a3;
  uint64_t input[3] = a4;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x2Cu, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetPropertyAlignment(const void *a1)
{
  _ioSurfaceConnectInternal(0);
  if (CFEqual(a1, @"IOSurfaceBytesPerRow") || CFEqual(a1, @"IOSurfacePlaneBytesPerRow"))
  {
    int v2 = HIDWORD(ioSurfaceLimits);
  }
  else
  {
    if (!CFEqual(a1, @"IOSurfaceOffset")
      && !CFEqual(a1, @"IOSurfacePlaneOffset")
      && !CFEqual(a1, @"IOSurfacePlaneBase"))
    {
      return 1;
    }
    int v2 = ioSurfaceLimits;
  }
  return (v2 + 1);
}

uint64_t IOSurfaceClientSetCoreVideoBridgedKeys(const __CFArray *a1)
{
  kern_return_t v10;
  uint64_t vars8;
  CFRange v13;

  pthread_mutex_lock(&_iosCoreVideoBridgedKeysMutex);
  if (_iosBridgedCoreVideoKeys) {
    CFRelease((CFTypeRef)_iosBridgedCoreVideoKeys);
  }
  _iosBridgedCoreVideoKeys = (uint64_t)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  v13.length = CFArrayGetCount(a1);
  v13.location = 0;
  CFArrayApplyFunction(a1, v13, (CFArrayApplierFunction)addValueToSet, (void *)_iosBridgedCoreVideoKeys);
  CFDataRef v2 = IOCFSerialize(a1, 1uLL);
  if (v2)
  {
    CFDataRef v3 = v2;
    unint64_t Length = CFDataGetLength(v2);
    if (Length >= 0xFFFFFFFFFFFFFFF4) {
      abort();
    }
    size_t v5 = Length;
    size_t v6 = (Length + 12);
    long long v7 = (char *)malloc_type_malloc(v6, 0xB0C3C085uLL);
    BytePtr = CFDataGetBytePtr(v3);
    memcpy(v7 + 12, BytePtr, v5);
    mach_port_t v9 = _ioSurfaceConnectInternal(0);
    uint64_t v10 = IOConnectCallMethod(v9, 0x36u, 0, 0, v7, v6, 0, 0, 0, 0);
    if (v10) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "kIOSurfaceMethodSetCoreVideoBridgedKeys failed: %08x\n", v10);
    }
    CFRelease(v3);
    free(v7);
  }

  return pthread_mutex_unlock(&_iosCoreVideoBridgedKeysMutex);
}

void ___ioSurfaceConnectInternal_block_invoke(uint64_t a1)
{
  kern_return_t MatchingServices;
  io_service_t v5;
  kern_return_t v7;
  kern_return_t v8;
  void *v9;
  id v10;
  int v11;
  io_object_t v12;
  io_registry_entry_t v13;
  CFStringRef v14;
  void *v15;
  void *CFProperty;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  CFStringRef v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  io_iterator_t iterator;
  io_iterator_t existing;
  uint8_t buf[8];
  uint64_t v34;

  CFAllocatorRef v34 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IOSurface.framework API explicitly disallowed.", buf, 2u);
    }
  }
  else
  {
    _creationPropertiesDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceClass", @"IOSurfaceClass");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceIsGlobal", @"IOSurfaceIsGlobal");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceBytesPerRow", @"IOSurfaceBytesPerRow");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceBytesPerElement", @"IOSurfaceBytesPerElement");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceElementWidth", @"IOSurfaceElementWidth");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceElementHeight", @"IOSurfaceElementHeight");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceWidth", @"IOSurfaceWidth");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceHeight", @"IOSurfaceHeight");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceOffset", @"IOSurfaceOffset");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePixelFormat", @"IOSurfacePixelFormat");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceMemoryRegion", @"IOSurfaceMemoryRegion");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceAllocSize", @"IOSurfaceAllocSize");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneInfo", @"IOSurfacePlaneInfo");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBase", @"IOSurfacePlaneBase");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneOffset", @"IOSurfacePlaneOffset");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneWidth", @"IOSurfacePlaneWidth");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneHeight", @"IOSurfacePlaneHeight");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBytesPerRow", @"IOSurfacePlaneBytesPerRow");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBitsPerElement", @"IOSurfacePlaneBitsPerElement");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBytesPerElement", @"IOSurfacePlaneBytesPerElement");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneElementWidth", @"IOSurfacePlaneElementWidth");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneElementHeight", @"IOSurfacePlaneElementHeight");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneSize", @"IOSurfacePlaneSize");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceAddress", @"IOSurfaceAddress");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceAddressRanges", @"IOSurfaceAddressRanges");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceAddressOffset", @"IOSurfaceAddressOffset");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceDirection", @"IOSurfaceDirection");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceType", @"IOSurfaceType");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceCacheMode", @"IOSurfaceCacheMode");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOFenceAllowTearing", @"IOFenceAllowTearing");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePrefetchPages", @"IOSurfacePrefetchPages");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePurgeWhenNotInUse", @"IOSurfacePurgeWhenNotInUse");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceResetDefaultAttachmentsWhenNotInUse", @"IOSurfaceResetDefaultAttachmentsWhenNotInUse");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceDefaultAttachments", @"IOSurfaceDefaultAttachments");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceDefaultBulkAttachments", @"IOSurfaceDefaultBulkAttachments");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"CreationProperties", @"CreationProperties");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IsDisplayable", @"IsDisplayable");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceNonPurgeable", @"IOSurfaceNonPurgeable");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceEDRFactor", @"IOSurfaceEDRFactor");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePixelSizeCastingAllowed", @"IOSurfacePixelSizeCastingAllowed");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePixelSizeCastingAllowed", @"IOSurfacePixelSizeCastingAllowed");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceUseReserve", @"IOSurfaceUseReserve");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneComponentBitDepths", @"IOSurfacePlaneComponentBitDepths");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneComponentBitOffsets", @"IOSurfacePlaneComponentBitOffsets");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneComponentNames", @"IOSurfacePlaneComponentNames");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneComponentTypes", @"IOSurfacePlaneComponentTypes");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneComponentRanges", @"IOSurfacePlaneComponentRanges");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceSubsampling", @"IOSurfaceSubsampling");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceAllocateFromSuperbuffer", @"IOSurfaceAllocateFromSuperbuffer");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceSuperbuffer", @"IOSurfaceSuperbuffer");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceMemoryPoolSize", @"IOSurfaceMemoryPoolSize");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceMemoryPoolZerofillEnabled", @"IOSurfaceMemoryPoolZerofillEnabled");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceMemoryPoolCacheModeSwitchEnabled", @"IOSurfaceMemoryPoolCacheModeSwitchEnabled");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneCompressedTileWidth", @"IOSurfacePlaneCompressedTileWidth");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneCompressedTileHeight", @"IOSurfacePlaneCompressedTileHeight");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneCompressedTileHeaderRegionOffset", @"IOSurfacePlaneCompressedTileHeaderRegionOffset");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneCompressedTileDataRegionOffset", @"IOSurfacePlaneCompressedTileDataRegionOffset");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneCompressionType", @"IOSurfacePlaneCompressionType");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneCompressionFootprint", @"IOSurfacePlaneCompressionFootprint");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBytesPerCompressedTileHeader", @"IOSurfacePlaneBytesPerCompressedTileHeader");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneWidthInCompressedTiles", @"IOSurfacePlaneWidthInCompressedTiles");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneHeightInCompressedTiles", @"IOSurfacePlaneHeightInCompressedTiles");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBytesPerRowOfCompressedTileHeaderGroups", @"IOSurfacePlaneBytesPerRowOfCompressedTileHeaderGroups");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneHTPCPredictionSelector", @"IOSurfacePlaneHTPCPredictionSelector");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneHTPCVerticalHeaderGroupingMode", @"IOSurfacePlaneHTPCVerticalHeaderGroupingMode");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneHorizontalPixelOffsetWithinCompressedTileArray", @"IOSurfacePlaneHorizontalPixelOffsetWithinCompressedTileArray");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneVerticalPixelOffsetWithinCompressedTileArray", @"IOSurfacePlaneVerticalPixelOffsetWithinCompressedTileArray");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceAddressFormat", @"IOSurfaceAddressFormat");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBytesPerTileData", @"IOSurfacePlaneBytesPerTileData");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneBytesPerRowOfTileData", @"IOSurfacePlaneBytesPerRowOfTileData");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceSliceCount", @"IOSurfaceSliceCount");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneDataRegionBytesPerSlice", @"IOSurfacePlaneDataRegionBytesPerSlice");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneHeaderRegionBytesPerSlice", @"IOSurfacePlaneHeaderRegionBytesPerSlice");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneExtendedPixelsOnLeft", @"IOSurfacePlaneExtendedPixelsOnLeft");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneExtendedPixelsOnRight", @"IOSurfacePlaneExtendedPixelsOnRight");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneExtendedPixelsOnTop", @"IOSurfacePlaneExtendedPixelsOnTop");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfacePlaneExtendedPixelsOnBottom", @"IOSurfacePlaneExtendedPixelsOnBottom");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceProhibitUseCount", @"IOSurfaceProhibitUseCount");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceMemoryPoolInfo", @"IOSurfaceMemoryPoolInfo");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"IOSurfaceEnableStatistics", @"IOSurfaceEnableStatistics");
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, @"DolbyVisionRPUData", @"DolbyVisionRPUData");
    mach_port_t v1 = *MEMORY[0x1E4F2EEF0];
    int v2 = -241;
    while (1)
    {
      existing = 0;
      CFDictionaryRef v3 = IOServiceNameMatching("IOCoreSurfaceRoot");
      MatchingServices = IOServiceGetMatchingServices(v1, v3, &existing);
      _iosServiceReturn = MatchingServices;
      if (MatchingServices) {
        break;
      }
      size_t v5 = IOIteratorNext(existing);
      _iosService = v5;
      if (v5)
      {
        long long v8 = IOServiceOpen(v5, *MEMORY[0x1E4F14960], 0, (io_connect_t *)&_iosConnect);
        _iosConnectReturn = v8;
        if (v8)
        {
          if (v8 != -536870174)
          {
            if (v8 == -536870201)
            {
              mach_port_t v9 = (void *)MEMORY[0x1AD0D6130]();
              uint64_t v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              iterator = 0;
              mach_port_t v11 = 0;
              if (!MEMORY[0x1AD0D5DE0](_iosService, "IOService", 0, &iterator))
              {
                CFAllocatorRef v30 = v9;
                uint64_t v12 = IOIteratorNext(iterator);
                if (v12)
                {
                  uint64_t v13 = v12;
                  mach_port_t v11 = 0;
                  size_t v14 = @"IOUserClientCreator";
                  do
                  {
                    mach_port_t v15 = (void *)MEMORY[0x1AD0D6130]();
                    CFProperty = (void *)IORegistryEntryCreateCFProperty(v13, v14, 0, 0);
                    if (CFProperty)
                    {
                      CFAllocatorRef v17 = CFProperty;
                      uint64_t v18 = [CFProperty rangeOfString:@", "];
                      if (v19)
                      {
                        int v20 = [v17 substringFromIndex:v18 + 2];
                        CFIndex v21 = (void *)[v10 objectForKeyedSubscript:v20];
                        if (v21)
                        {
                          int v22 = v10;
                          long long v23 = v14;
                          CFMutableDictionaryRef v24 = NSNumber;
                          CFIndex v25 = [v21 intValue] + 1;
                          CFAllocatorRef v26 = v24;
                          size_t v14 = v23;
                          uint64_t v10 = v22;
                          CFIndex v27 = (void *)[v26 numberWithInt:v25];
                          int v28 = v22;
                        }
                        else
                        {
                          int v28 = v10;
                          CFIndex v27 = &unk_1EFE15218;
                        }
                        [v28 setObject:v27 forKeyedSubscript:v20];
                      }
                    }
                    ++v11;
                    IOObjectRelease(v13);
                    uint64_t v13 = IOIteratorNext(iterator);
                  }
                  while (v13);
                }
                else
                {
                  mach_port_t v11 = 0;
                }
                IOObjectRelease(iterator);
                mach_port_t v9 = v30;
              }
              long long v29 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "cStringUsingEncoding:", 4);
              *(void *)buf = 0;
              asprintf((char **)buf, "_iosConnectInitalize() unable to open IOSurface kernel service: %08x\n%d existing clients:\n%s\n", -536870201, v11, v29);
              if (*(void *)buf) {
                ___ioSurfaceConnectInternal_block_invoke_cold_4(*(char **)buf);
              }
            }
            else
            {
              *(void *)buf = 0;
              asprintf((char **)buf, "_iosConnectInitalize() unable to open IOSurface kernel service: %08x", v8);
              if (*(void *)buf) {
                ___ioSurfaceConnectInternal_block_invoke_cold_3(*(char **)buf);
              }
            }
          }
        }
        else
        {
          *(void *)buf = 40;
          if (IOConnectCallMethod(_iosConnect, 0xDu, 0, 0, 0, 0, 0, 0, &ioSurfaceLimits, (size_t *)buf)
            || word_1EB28B2EA != 1)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              ___ioSurfaceConnectInternal_block_invoke_cold_2();
            }
            IOServiceClose(_iosConnect);
            _iosConnect = 0;
          }
        }
        goto LABEL_39;
      }
      IOObjectRelease(existing);
      sleep(1u);
      if (__CFADD__(v2++, 1)) {
        goto LABEL_39;
      }
    }
    long long v7 = MatchingServices;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "IOSurface.framework not allowed to iterate kernel services (%08x).  API disallowed.", buf, 8u);
    }
LABEL_39:
    if (!(_iosService | _iosServiceReturn)) {
      ___ioSurfaceConnectInternal_block_invoke_cold_1();
    }
  }
  _ensureKeySniffDictionaries();
}

void _ensureKeySniffDictionaries()
{
  if (_ensureKeySniffDictionaries_onceToken != -1) {
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  }
}

CFMutableDictionaryRef ___ensureKeySniffDictionaries_block_invoke()
{
  mach_port_t v0 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  _sniffKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceCleanAperture", sniffCleanApertureKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfacePixelAspectRatio", sniffPixelAspectRatioKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceGammaLevel", sniffGammaLevelKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceFieldCount", sniffFieldCountKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceFieldDetail", sniffFieldDetailKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceYCbCrMatrix", sniffYCbCrMatrixKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceColorPrimaries", sniffColorPrimariesKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceTransferFunction", sniffTransferFunctionKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceChromaLocationTopField", sniffChromaLocationTopKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceChromaLocationBottomField", sniffChromaLocationBottomKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceChromaSubsampling", sniffChromaSubsamplingKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceEDRFactor", sniffEDRFactorKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"MasteringDisplayColorVolume", sniffMasteringDisplayColorVolumeKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"ContentLightLevelInfo", sniffContentLightLevelInfoKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"AlphaChannelMode", sniffAlphaChannelModeKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"SceneIllumination", sniffSceneIlluminationKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, @"IOSurfaceColorSpaceID", sniffColorSpaceIDKeyToStruct);
  _sniffKeysMaskDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v0, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceCleanAperture", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfacePixelAspectRatio", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceGammaLevel", (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceFieldCount", (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceFieldDetail", (const void *)0x10);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceYCbCrMatrix", (const void *)0x20);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceColorPrimaries", (const void *)0x40);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceTransferFunction", (const void *)0x80);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceChromaLocationTopField", (const void *)0x100);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceChromaLocationBottomField", (const void *)0x200);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceChromaSubsampling", (const void *)0x400);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceEDRFactor", (const void *)0x2000);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"MasteringDisplayColorVolume", (const void *)0x800);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"ContentLightLevelInfo", (const void *)0x1000);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"AlphaChannelMode", (const void *)0x4000);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"SceneIllumination", (const void *)0x10000);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysMaskDict, @"IOSurfaceColorSpaceID", (const void *)0x20000);
  _sniffStructToKeysDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceCleanAperture", createCleanApertureFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfacePixelAspectRatio", createPixelAspectRatioFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceGammaLevel", createGammaLevelFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceFieldCount", createFieldCountFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceFieldDetail", createFieldDetailFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceYCbCrMatrix", createYCbCrMatrixFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceColorPrimaries", createColorPrimariesFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceTransferFunction", createTransferFunctionFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceChromaLocationTopField", createChromaLocationTopFieldFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceChromaLocationBottomField", createChromaLocationBottomFieldFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceChromaSubsampling", createChromaSubsamplingFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceEDRFactor", createEDRFactorFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"MasteringDisplayColorVolume", createMasteringDisplayColorVolumeFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"ContentLightLevelInfo", createContentLightLevelInfoFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"AlphaChannelMode", createAlphaChannelModeFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"SceneIllumination", createSceneIlluminationFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, @"IOSurfaceColorSpaceID", createColorSpaceIDFromStruct);
  mach_port_t v1 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  _fieldDetailKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, @"TemporalTopFirst", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, @"TemporalBottomFirst", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, @"SpatialFirstLineEarly", (const void *)9);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, @"SpatialFirstLineLate", (const void *)0xE);
  _yCbCrMatrixKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_709_2", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_601_4", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"SMPTE_240M_1995", (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"DCI_P3", (const void *)0xB);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"P3_D65", (const void *)0xC);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_2020", (const void *)9);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"ITU_R_2100_ICtCp", (const void *)0xE);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"IPT", (const void *)0xF8);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, @"Identity", (const void *)0xC8);
  _colorPrimariesKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"ITU_R_709_2", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"EBU_3213", (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"SMPTE_C", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"DCI_P3", (const void *)0xB);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"P3_D65", (const void *)0xC);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"JEDEC_P22", (const void *)0x16);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, @"ITU_R_2020", (const void *)9);
  _transferFunctionKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"ITU_R_709_2", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"ITU_R_2020", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"UseGamma", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"SMPTE_240M_1995", (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"SMPTE_ST_2084_PQ", (const void *)0x10);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"SMPTE_ST_428_1", (const void *)0x11);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"ITU_R_2100_HLG", (const void *)0x12);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"IEC_sRGB", (const void *)0xD);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"sRGB", (const void *)0xD);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"Linear", (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, @"aYCC", (const void *)0xFF);
  _chromaLocationKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Left", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Center", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"TopLeft", (const void *)3);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Top", (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"BottomLeft", (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"Bottom", (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, @"DV 4:2:0", (const void *)7);
  _chromaSubsamplingKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, @"4:2:0", (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, @"4:2:2", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, @"4:1:1", (const void *)3);
  _premultipliedAlphaKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_premultipliedAlphaKeysToStructDict, @"PremultipliedAlpha", (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_premultipliedAlphaKeysToStructDict, @"StraightAlpha", (const void *)1);
  _unrecognizedCodePointDispatchQueue = (uint64_t)dispatch_queue_create("com.apple.iosurface.unrecognized-code-points", 0);
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  _stringsForUnrecognizedYCbCrMatrixCodePointsDict = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
  _stringsForUnrecognizedColorPrimariesCodePointsDict = (uint64_t)CFDictionaryCreateMutable(v2, 0, 0, v3);
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(v2, 0, 0, v3);
  _stringsForUnrecognizedTransferFunctionCodePointsDict = (uint64_t)result;
  return result;
}

void IOSurfaceLog(char *a1, ...)
{
  va_start(va, a1);
  __s[2] = *(char **)MEMORY[0x1E4F143B8];
  __s[0] = 0;
  va_copy((va_list)&__s[1], va);
  vasprintf(__s, a1, va);
  if (__s[0])
  {
    size_t v1 = strlen(__s[0]) + 1;
    mach_port_t v2 = _ioSurfaceConnectInternal(0);
    IOConnectCallMethod(v2, 0x13u, 0, 0, __s[0], v1, 0, 0, 0, 0);
    free(__s[0]);
  }
}

uint64_t IOSurfaceClientDisallowForever()
{
  uint64_t result = _ioSurfaceConnectInternal(1);
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      IOSurfaceClientDisallowForever_cold_1();
    }
    abort();
  }
  return result;
}

_DWORD *IOSurfaceClientRetain(_DWORD *a1)
{
  if (a1)
  {
    pthread_mutex_lock(&_iosCacheMutex);
    ++*a1;
    pthread_mutex_unlock(&_iosCacheMutex);
  }
  return a1;
}

uint64_t _IOSurfaceClientGetUnadjustedBaseAddress(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t _IOSurfaceClientGetBufferOffset(uint64_t a1)
{
  return *(void *)(a1 + 176);
}

uint64_t IOSurfaceClientGetElementHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2) {
      return 0;
    }
    mach_port_t v2 = (unsigned __int8 *)(a1 + 211);
  }
  else
  {
    mach_port_t v2 = (unsigned __int8 *)(a1 + 152 * a2 + 299);
  }
  return *v2;
}

uint64_t IOSurfaceClientFlushProcessorCaches(uint64_t a1)
{
  uint64_t result = IOSurfaceClientLock(a1, 1u, 0);
  if (!result)
  {
    sys_dcache_flush(*(void **)(a1 + 112), *(void *)(a1 + 192));
    return IOSurfaceClientUnlock(a1, 1u, 0);
  }
  return result;
}

BOOL IOSurfaceClientNeedsBindAccel(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 120);
  return *(_WORD *)(v3 + 8) && (*(unsigned __int16 *)(v3 + 8) != a2 || *(unsigned __int16 *)(v3 + 10) != a3);
}

uint64_t IOSurfaceClientCopyDataValueBytes(uint64_t a1, const __CFString *a2, unsigned char *a3, size_t *a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097090;
  if (a2 && a3 && a4)
  {
    if (*a4)
    {
      if (*(_DWORD *)(*(void *)(a1 + 120) + 40))
      {
        v16[0] = *a4;
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0);
        uint64_t v4 = 3758097136;
        if (ExternalRepresentation)
        {
          CFDataRef v9 = ExternalRepresentation;
          size_t Length = CFDataGetLength(ExternalRepresentation);
          mach_port_t v11 = malloc_type_malloc(Length + 13, 0xA7F2675BuLL);
          *a3 = 0;
          *mach_port_t v11 = *(_DWORD *)(a1 + 136);
          BytePtr = CFDataGetBytePtr(v9);
          memcpy(v11 + 3, BytePtr, Length);
          *((unsigned char *)v11 + Length + 12) = 0;
          mach_port_t v13 = _ioSurfaceConnectInternal(0);
          uint64_t v14 = IOConnectCallMethod(v13, 0x1Au, 0, 0, v11, Length + 13, 0, 0, a3, v16);
          uint64_t v4 = v14;
          if (v14 && v14 != -536870181) {
            fprintf((FILE *)*MEMORY[0x1E4F143C8], "IOSurfaceClientGetValue getValueMethod kernel call failed %08x\n", v14);
          }
          else {
            *a4 = v16[0];
          }
          free(v11);
          CFRelease(v9);
        }
      }
      else
      {
        return 3758097136;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t IOSurfaceClientSetTiled(uint64_t a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1E4F143B8];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v2, 0x16u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetTileFormat(uint64_t a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  uint64_t output = 0;
  input[0] = *(unsigned int *)(a1 + 136);
  uint32_t outputCnt = 1;
  mach_port_t v1 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v1, 0x19u, input, 1u, 0, 0, &output, &outputCnt, 0, 0)) {
    return 0;
  }
  else {
    return output;
  }
}

unsigned int *IOSurfaceClientWrapClientImage(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  size_t v14 = 3176;
  if (a3 > 1380401728)
  {
    if (a3 <= 1395864161)
    {
      if (a3 != 1380401729)
      {
        if (a3 == 1380410945)
        {
          int v7 = 16;
          goto LABEL_25;
        }
        if (a3 == 1380411457)
        {
          int v7 = 8;
          goto LABEL_25;
        }
        goto LABEL_31;
      }
    }
    else
    {
      if (a3 > 1395996212)
      {
        if (a3 == 1395996213) {
          goto LABEL_24;
        }
        int v6 = 1932866865;
        goto LABEL_23;
      }
      if (a3 != 1395864162)
      {
        int v6 = 1395995957;
        goto LABEL_23;
      }
    }
LABEL_18:
    int v7 = 4;
    goto LABEL_25;
  }
  if (a3 > 1278555444)
  {
    if (a3 <= 1279340599)
    {
      if (a3 != 1278555445)
      {
        int v6 = 1278555701;
        goto LABEL_23;
      }
LABEL_24:
      int v7 = 2;
      goto LABEL_25;
    }
    if (a3 == 1279340600) {
      goto LABEL_24;
    }
    int v6 = 1279342648;
LABEL_23:
    if (a3 == v6) {
      goto LABEL_24;
    }
    goto LABEL_31;
  }
  if (a3 == 875836468 || a3 == 892679473) {
    goto LABEL_24;
  }
  if (a3 == 1111970369) {
    goto LABEL_18;
  }
LABEL_31:
  int v7 = 1;
LABEL_25:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long outputStruct = 0u;
  long long v16 = 0u;
  uint64_t inputStruct = a6;
  int v48 = a1;
  int v49 = a2;
  int v50 = a3;
  int v51 = v7;
  int v52 = a4;
  int v53 = a5;
  mach_port_t v8 = _ioSurfaceConnectInternal(0);
  CFDataRef v9 = 0;
  if (!IOConnectCallMethod(v8, 6u, 0, 0, &inputStruct, 0x20uLL, 0, 0, &outputStruct, &v14))
  {
    uint64_t v10 = _ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
    if (v10)
    {
      CFDataRef v9 = (unsigned int *)v10;
      pthread_mutex_lock(&_iosCacheMutex);
      _ioSurfaceAddClientRef(v9);
      pthread_mutex_unlock(&_iosCacheMutex);
    }
    else
    {
      uintptr_t v11 = DWORD2(v16);
      io_connect_t v12 = _ioSurfaceConnectInternal(0);
      IOConnectTrap1(v12, 5u, v11);
      return 0;
    }
  }
  return v9;
}

unsigned int *IOSurfaceClientWrapClientMemory(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long outputStruct = 0u;
  size_t v8 = 3176;
  input[0] = a1;
  input[1] = a2;
  mach_port_t v2 = _ioSurfaceConnectInternal(0);
  uint64_t v3 = 0;
  if (!IOConnectCallMethod(v2, 7u, input, 2u, 0, 0, 0, 0, &outputStruct, &v8))
  {
    uint64_t v4 = _ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
    if (v4)
    {
      uint64_t v3 = (unsigned int *)v4;
      pthread_mutex_lock(&_iosCacheMutex);
      _ioSurfaceAddClientRef(v3);
      pthread_mutex_unlock(&_iosCacheMutex);
    }
    else
    {
      uintptr_t v5 = DWORD2(v11);
      io_connect_t v6 = _ioSurfaceConnectInternal(0);
      IOConnectTrap1(v6, 5u, v5);
      return 0;
    }
  }
  return v3;
}

uint64_t IOSurfaceClientSetSurfaceNotify(mach_port_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  reference[0] = 0;
  inputStruct[1] = a3;
  inputStruct[2] = 0;
  inputStruct[0] = a2;
  reference[1] = a2;
  long long v8 = a3;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallAsyncMethod(v4, 0x11u, a1, reference, 3u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientRemoveSurfaceNotify(uint64_t a1)
{
  void inputStruct[3] = *MEMORY[0x1E4F143B8];
  inputStruct[0] = 0;
  inputStruct[1] = a1;
  inputStruct[2] = 0;
  mach_port_t v1 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v1, 0x12u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetUseCount(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceGetUseCount: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1E9739858 = (uint64_t)crashMessage;
    BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v2) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    abort();
  }
  return (HIDWORD(*(void *)(a1 + 8)) + *(void *)(a1 + 8));
}

BOOL IOSurfaceClientIsInUseForCategory(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"category out of range"];
  }
  if (*(unsigned char *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIsInUseForCategory: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1E9739858 = (uint64_t)crashMessage;
    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v6) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    abort();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 120) + 24);
  if (a2) {
    LODWORD(v4) = HIDWORD(*(void *)(*(void *)(a1 + 120) + 24));
  }
  return v4 != 0;
}

BOOL IOSurfaceClientIsInUseForAnyOtherCategory(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"category out of range"];
  }
  if (*(unsigned char *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIsInUseForAnyOtherCategory: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1E9739858 = (uint64_t)crashMessage;
    BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v6) {
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    abort();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 120) + 24);
  if (a2 != 1) {
    LODWORD(v4) = HIDWORD(*(void *)(*(void *)(a1 + 120) + 24));
  }
  return v4 != 0;
}

uint64_t IOSurfaceClientSignalEvent(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t input[4] = *MEMORY[0x1E4F143B8];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a4;
  uint64_t input[2] = a2;
  uint64_t input[3] = a3;
  mach_port_t v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientSetTimestamp(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  values[2] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t result = 3758097090;
  if (a2 && a3)
  {
    values[0] = a2;
    values[1] = a3;
    CFArrayRef v7 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x1E4F1D510]);
    if (v7)
    {
      CFArrayRef v8 = v7;
      CFDataRef v9 = IOCFSerialize(v7, 1uLL);
      CFRelease(v8);
      if (v9)
      {
        size_t Length = CFDataGetLength(v9);
        uint64_t v11 = malloc_type_malloc(Length + 16, 0xCD9F7890uLL);
        *(_DWORD *)uint64_t v11 = *(_DWORD *)(a1 + 136);
        v11[1] = a4;
        BytePtr = CFDataGetBytePtr(v9);
        memcpy(v11 + 2, BytePtr, Length);
        mach_port_t v13 = _ioSurfaceConnectInternal(0);
        IOConnectCallMethod(v13, 0x18u, 0, 0, v11, Length + 16, 0, 0, 0, 0);
        free(v11);
        CFRelease(v9);
      }
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

BOOL IOSurfaceClientSupportsProtectionOptions(uint64_t a1, uint64_t a2)
{
  return (a2 & ~*(void *)(a1 + 240)) == 0;
}

BOOL IOSurfaceClientIsDisplayable(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 120) + 45) != 0;
}

BOOL IOSurfaceClientIsSysMemOnly(uint64_t a1)
{
  return *(unsigned char *)(*(void *)(a1 + 120) + 46) != 0;
}

uint64_t IOSurfaceClientGetNumberOfComponentsOfPlane(uint64_t a1, unint64_t a2)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 300);
  }
}

uint64_t IOSurfaceClientGetNameOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 312);
  }
}

uint64_t IOSurfaceClientGetTypeOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 316);
  }
}

uint64_t IOSurfaceClientGetRangeOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 320);
  }
}

uint64_t IOSurfaceClientGetBitDepthOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 304);
  }
}

uint64_t IOSurfaceClientGetBitOffsetOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 308);
  }
}

uint64_t IOSurfaceClientGetSubsampling(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 220);
}

uint64_t IOSurfaceClientGetBytesPerCompressedTileHeaderOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 340);
  }
}

uint64_t IOSurfaceClientGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int16 *)(a1 + 152 * a2 + 360);
  }
}

uint64_t IOSurfaceClientGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int16 *)(a1 + 152 * a2 + 362);
  }
}

uint64_t IOSurfaceClientGetBytesPerRowOfTileDataOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(a1 + 152 * a2 + 372);
  }
}

uint64_t IOSurfaceClientGetHTPCPredictionSelectorOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 357);
  }
}

uint64_t IOSurfaceClientGetHTPCVerticalHeaderGroupingModeOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2) {
    return 0;
  }
  else {
    return *(unsigned __int8 *)(a1 + 152 * a2 + 358);
  }
}

uint64_t IOSurfaceClientGetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 3758097090;
  if (a2 <= 4 && *(_DWORD *)(a1 + 200) > a2)
  {
    uint64_t result = 0;
    *a3 = *(unsigned int *)(*(void *)(a1 + 120) + 4 * a2 + 164);
  }
  return result;
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 && *(_DWORD *)(a1 + 200) <= a3 || a2 && *(_DWORD *)(a1 + 228) <= a2) {
    return 0;
  }
  else {
    return *(void *)(a1 + 112)
  }
         + *(unsigned int *)(a1 + 112 + 152 * a3 + 220)
         + *(_DWORD *)(a1 + 112 + 152 * a3 + 268) * a2;
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 && *(_DWORD *)(a1 + 200) <= a3 || a2 && *(_DWORD *)(a1 + 228) <= a2) {
    return 0;
  }
  else {
    return *(void *)(a1 + 112)
  }
         + *(unsigned int *)(a1 + 112 + 152 * a3 + 224)
         + *(_DWORD *)(a1 + 112 + 152 * a3 + 264) * a2;
}

uint64_t IOSurfaceClientSetIndexedTimestamp(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x1E4F143B8];
  if (a2 <= 4)
  {
    if (byte_1EB28B2E8)
    {
      *(void *)(*(void *)(result + 128) + 8 * a2) = a3;
    }
    else
    {
      input[0] = *(unsigned int *)(result + 136);
      input[1] = a2;
      uint64_t input[2] = a3;
      mach_port_t v3 = _ioSurfaceConnectInternal(0);
      return IOConnectCallMethod(v3, 0x21u, input, 3u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t IOSurfaceClientGetRegistryID(uint64_t a1)
{
  return **(void **)(a1 + 120);
}

uint64_t IOSurfaceClientGetTraceID(uint64_t a1)
{
  return *(void *)(a1 + 232);
}

uint64_t IOSurfaceClientHasDataProperty(uint64_t a1, unsigned int a2)
{
  if (a2 <= 4) {
    return (*(unsigned __int8 *)(*(void *)(a1 + 120) + 47) >> a2) & 1;
  }
  else {
    return 0;
  }
}

BOOL IOSurfaceClientIsMetalSharedTexture(uint64_t a1)
{
  return *(unsigned char *)(a1 + 222) != 0;
}

uint64_t IOSurfaceClientGetWiringAssertionCount(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 120) + 36);
}

void serializeReplacementSetValues(uint64_t a1, __CFSet *a2)
{
  mach_port_t v3 = (const void *)serializeReplacementIOKitTypeRef(a1);
  CFSetAddValue(a2, v3);

  CFRelease(v3);
}

void unserializeReplacementSetValues(uint64_t a1, __CFSet *a2)
{
  mach_port_t v3 = (const void *)unserializeReplacementIOKitTypeRef(a1, 0);
  CFSetAddValue(a2, v3);

  CFRelease(v3);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t IOSurfaceAcceleratorGetTypeID()
{
  mach_port_t v0 = (uint64_t (*)(void))off_1EB28B0B8;
  if (!off_1EB28B0B8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    mach_port_t v0 = (uint64_t (*)(void))off_1EB28B0B8;
    if (!off_1EB28B0B8) {
      abort();
    }
  }

  return v0();
}

uint64_t IOSurfaceAcceleratorGetServiceObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1EB28B0C8;
  if (!off_1EB28B0C8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1EB28B0C8;
    if (!off_1EB28B0C8) {
      abort();
    }
  }

  return v6(a1, a2, a3);
}

uint64_t IOSurfaceAcceleratorCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1EB28B0D8;
  if (!off_1EB28B0D8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1EB28B0D8;
    if (!off_1EB28B0D8) {
      abort();
    }
  }

  return v6(a1, a2, a3);
}

uint64_t IOSurfaceAcceleratorGetID(uint64_t a1, uint64_t a2)
{
  mach_port_t v4 = (uint64_t (*)(uint64_t, uint64_t))off_1EB28B0E8;
  if (!off_1EB28B0E8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    mach_port_t v4 = (uint64_t (*)(uint64_t, uint64_t))off_1EB28B0E8;
    if (!off_1EB28B0E8) {
      abort();
    }
  }

  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B0F8;
  if (!off_1EB28B0F8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B0F8;
    if (!off_1EB28B0F8) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorConfigurePerformanceStats(uint64_t a1, uint64_t a2)
{
  mach_port_t v4 = (uint64_t (*)(uint64_t, uint64_t))off_1EB28B108;
  if (!off_1EB28B108)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    mach_port_t v4 = (uint64_t (*)(uint64_t, uint64_t))off_1EB28B108;
    if (!off_1EB28B108) {
      abort();
    }
  }

  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorGetStatistics(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B118;
  if (!off_1EB28B118)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B118;
    if (!off_1EB28B118) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorTransformSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B128;
  if (!off_1EB28B128)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B128;
    if (!off_1EB28B128) {
      abort();
    }
  }

  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOSurfaceAcceleratorTransferSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B138;
  if (!off_1EB28B138)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B138;
    if (!off_1EB28B138) {
      abort();
    }
  }

  return v14(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorAbortTransfers(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B148;
  if (!off_1EB28B148)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B148;
    if (!off_1EB28B148) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorTransferSurfaceWithSwap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B178;
  if (!off_1EB28B178)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B178;
    if (!off_1EB28B178) {
      abort();
    }
  }

  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorConditionalTransferSurfaceWithSwap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  long long v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B188;
  if (!off_1EB28B188)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B188;
    if (!off_1EB28B188) {
      abort();
    }
  }

  return v14(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorBlitSurface(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = (uint64_t (*)(uint64_t, uint64_t, long long *, uint64_t, long long *, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B198;
  if (!off_1EB28B198)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v17 = (uint64_t (*)(uint64_t, uint64_t, long long *, uint64_t, long long *, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B198;
    if (!off_1EB28B198) {
      abort();
    }
  }
  long long v21 = *a3;
  uint64_t v22 = *((void *)a3 + 2);
  long long v19 = *a5;
  uint64_t v20 = *((void *)a5 + 2);
  return v17(a1, a2, &v21, a4, &v19, a6, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorBlitSurfaceWithSwap(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = (uint64_t (*)(uint64_t, uint64_t, long long *, uint64_t, long long *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))off_1EB28B1A8;
  if (!off_1EB28B1A8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v19 = (uint64_t (*)(uint64_t, uint64_t, long long *, uint64_t, long long *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))off_1EB28B1A8;
    if (!off_1EB28B1A8) {
      abort();
    }
  }
  long long v23 = *a3;
  uint64_t v24 = *((void *)a3 + 2);
  long long v21 = *a5;
  uint64_t v22 = *((void *)a5 + 2);
  return v19(a1, a2, &v23, a4, &v21, a6, a7, a8, a9, a10, a11);
}

uint64_t IOSurfaceAcceleratorAbortCaptures(uint64_t a1)
{
  BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B1B8;
  if (!off_1EB28B1B8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    BOOL v2 = (uint64_t (*)(uint64_t))off_1EB28B1B8;
    if (!off_1EB28B1B8) {
      abort();
    }
  }

  return v2(a1);
}

uint64_t IOSurfaceAcceleratorCaptureSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B1C8;
  if (!off_1EB28B1C8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B1C8;
    if (!off_1EB28B1C8) {
      abort();
    }
  }

  return v10(a1, a2, a3, a4, a5);
}

uint64_t IOSurfaceAcceleratorSetFilterCoefficients(uint64_t a1, uint64_t a2)
{
  mach_port_t v4 = (uint64_t (*)(uint64_t, uint64_t))off_1EB28B158;
  if (!off_1EB28B158)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    mach_port_t v4 = (uint64_t (*)(uint64_t, uint64_t))off_1EB28B158;
    if (!off_1EB28B158) {
      abort();
    }
  }

  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorSetCustomFilter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B168;
  if (!off_1EB28B168)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    long long v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1EB28B168;
    if (!off_1EB28B168) {
      abort();
    }
  }

  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

char *_iosaLookupStubs()
{
  mach_port_t v0 = dlopen("/System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/IOSurfaceAccelerator", 1);
  if (v0)
  {
    mach_port_t v1 = v0;
    uint64_t v2 = 0;
    mach_port_t v3 = (FILE **)MEMORY[0x1E4F143C8];
    do
    {
      uint64_t result = (char *)dlsym(v1, (&iosa_Stubs)[v2]);
      (&iosa_Stubs)[v2 + 1] = result;
      if (!result)
      {
        uint64_t v5 = *v3;
        BOOL v6 = dlerror();
        uint64_t result = (char *)fprintf(v5, "%s, Line=%d, Error=%s\n", "_iosaLookupStubs", 174, v6);
      }
      v2 += 2;
    }
    while (v2 != 36);
  }
  else
  {
    CFArrayRef v7 = (FILE *)*MEMORY[0x1E4F143C8];
    CFArrayRef v8 = dlerror();
    return (char *)fprintf(v7, "%s, Line=%d, Error=%s\n", "_iosaLookupStubs", 160, v8);
  }
  return result;
}

uint64_t IOSurfaceSharedEventGetTypeID()
{
  return MEMORY[0x1F41817D0](IOSurfaceSharedEvent);
}

IOSurfaceSharedEvent *IOSurfaceSharedEventCreate()
{
  return objc_alloc_init(IOSurfaceSharedEvent);
}

uint64_t IOSurfaceSharedEventCreateWithMachPort(uint64_t a1)
{
  uint64_t v2 = [IOSurfaceSharedEvent alloc];

  return (uint64_t)[(IOSurfaceSharedEvent *)v2 initWithMachPort:a1];
}

uint64_t IOSurfaceSharedEventNotifyEventListener(void *a1, void *a2, unsigned int a3, uint64_t a4, void *aBlock)
{
  uint64_t input[5] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = _Block_copy(aBlock);
  input[0] = a3;
  input[1] = (uint64_t)a1;
  uint64_t input[2] = (uint64_t)a2;
  uint64_t input[3] = (uint64_t)v9;
  uint64_t input[4] = a4;
  id v10 = a1;
  id v11 = a2;
  if (_iosEventBlockOnce != -1) {
    dispatch_once(&_iosEventBlockOnce, &__block_literal_global);
  }
  pthread_mutex_lock(&_iosEventBlockMutex);
  CFArrayAppendValue((CFMutableArrayRef)_iosEventBlockArray, v9);
  pthread_mutex_unlock(&_iosEventBlockMutex);
  mach_port_t v12 = _ioSurfaceConnect();
  uint64_t v13 = IOConnectCallMethod(v12, 0x27u, input, 5u, 0, 0, 0, 0, 0, 0);
  if (v13)
  {

    _iosRemoveEventBlock(v9);
  }
  return v13;
}

uint64_t IOSurfaceSharedEventRemoveEventListener(uint64_t a1)
{
  input[1] = *MEMORY[0x1E4F143B8];
  input[0] = a1;
  mach_port_t v1 = _ioSurfaceConnect();
  return IOConnectCallMethod(v1, 0x29u, input, 1u, 0, 0, 0, 0, 0, 0);
}

void _ioSurfaceEventNotificationCallback2(void *a1, int a2, void *a3)
{
  if (a2) {
    _ioSurfaceEventNotificationCallback2_cold_2();
  }
  mach_port_t v3 = (void (**)(void, void, void))*a3;
  if (!*a3) {
    _ioSurfaceEventNotificationCallback2_cold_1();
  }
  uint64_t v5 = (void *)a3[1];
  ((void (**)(void, void *, void))v3)[2](*a3, v5, a3[2]);

  _iosRemoveEventBlock(v3);

  _Block_release(v3);
}

uint64_t _iosRemoveEventBlock(const void *a1)
{
  pthread_mutex_lock(&_iosEventBlockMutex);
  CFArrayRef v2 = (const __CFArray *)_iosEventBlockArray;
  v6.length = CFArrayGetCount((CFArrayRef)_iosEventBlockArray);
  v6.location = 0;
  FirstIndexOfCFDataRef Value = CFArrayGetFirstIndexOfValue(v2, v6, a1);
  if (FirstIndexOfValue != -1) {
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)_iosEventBlockArray, FirstIndexOfValue);
  }

  return pthread_mutex_unlock(&_iosEventBlockMutex);
}

uint64_t IOSurfaceSignalEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unsigned int v7 = [a2 eventPort];

  return IOSurfaceClientSignalEvent(v6, v7, a3, a4);
}

CFMutableArrayRef ___iosAddEventBlock_block_invoke()
{
  CFMutableArrayRef result = CFArrayCreateMutable(0, 0, 0);
  _iosEventBlockArray = (uint64_t)result;
  return result;
}

__CFString *createChromaSubsamplingFromStruct(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 63);
  switch(v1)
  {
    case 3:
      CFArrayRef v2 = kIOSurfaceChromaSubsampling_411;
      return *v2;
    case 2:
      CFArrayRef v2 = kIOSurfaceChromaSubsampling_422;
      return *v2;
    case 1:
      CFArrayRef v2 = kIOSurfaceChromaSubsampling_420;
      return *v2;
  }
  return 0;
}

CFTypeID sniffGammaLevelKeyToStruct(CFTypeID result, uint64_t a2)
{
  v5[1] = *(double *)MEMORY[0x1E4F143B8];
  if (!result)
  {
    *(void *)(a2 + 48) = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  CFMutableArrayRef result = CFNumberGetTypeID();
  if (v4 == result)
  {
    v5[0] = 0.0;
    CFMutableArrayRef result = CFNumberGetValue(v3, kCFNumberDoubleType, v5);
    if (result)
    {
      *(_DWORD *)(a2 + 48) = llround(v5[0] * 268435456.0);
      *(_DWORD *)(a2 + 52) = 0x10000000;
LABEL_6:
      *(void *)(a2 + 120) |= 4uLL;
    }
  }
  return result;
}

CFTypeID sniffFieldDetailKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  CFMutableArrayRef result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    CFMutableArrayRef result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_fieldDetailKeysToStructDict, v3, v6);
    if (result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(unsigned char *)(a2 + 57) = v5;
      *(void *)(a2 + 120) |= 0x10uLL;
    }
  }
  return result;
}

CFTypeID sniffChromaSubsamplingKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (!result)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const void *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  CFMutableArrayRef result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    CFMutableArrayRef result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaSubsamplingKeysToStructDict, v3, v6);
    if (result)
    {
      char v5 = (char)v6[0];
LABEL_6:
      *(unsigned char *)(a2 + 63) = v5;
      *(void *)(a2 + 120) |= 0x400uLL;
    }
  }
  return result;
}

CFTypeID sniffEDRFactorKeyToStruct(CFTypeID result, uint64_t a2)
{
  v5[1] = *(double *)MEMORY[0x1E4F143B8];
  if (!result)
  {
    *(_DWORD *)(a2 + 92) = 0;
    *(_DWORD *)(a2 + 96) = 0;
    goto LABEL_6;
  }
  CFNumberRef v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  CFMutableArrayRef result = CFNumberGetTypeID();
  if (v4 == result)
  {
    v5[0] = 0.0;
    CFMutableArrayRef result = CFNumberGetValue(v3, kCFNumberDoubleType, v5);
    if (result)
    {
      *(_DWORD *)(a2 + 92) = llround(v5[0] * 1048576.0);
      *(_DWORD *)(a2 + 96) = 0x100000;
LABEL_6:
      *(void *)(a2 + 120) |= 0x2000uLL;
    }
  }
  return result;
}

uint64_t sniffMasteringDisplayColorVolumeKeyToStruct(const void *a1, uint64_t a2)
{
  CFNumberRef v3 = a1;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  if (!a1)
  {
    int v22 = 0;
    int v21 = 0;
    int v20 = 0;
    int v19 = 0;
    __int16 v18 = 0;
    __int16 v17 = 0;
    __int16 v16 = 0;
    __int16 v15 = 0;
    __int16 v14 = 0;
    __int16 v13 = 0;
    int v12 = 0;
    __int16 v11 = 0;
    __int16 v10 = 0;
    __int16 v9 = 0;
    __int16 v8 = 0;
    __int16 v7 = 0;
    __int16 v6 = 0;
    goto LABEL_7;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v3) || CFDataGetLength((CFDataRef)v3) != 24)
  {
    int v22 = 0;
    int v21 = 0;
    int v20 = 0;
    int v19 = 0;
    __int16 v18 = 0;
    __int16 v17 = 0;
    __int16 v16 = 0;
    __int16 v15 = 0;
    __int16 v14 = 0;
    __int16 v13 = 0;
    LODWORD(a1) = 0;
    int v12 = 0;
    __int16 v11 = 0;
    __int16 v10 = 0;
    __int16 v9 = 0;
    __int16 v8 = 0;
    __int16 v7 = 0;
    __int16 v6 = 0;
    LOWORD(v3) = 0;
LABEL_7:
    __int16 v5 = 0;
    goto LABEL_8;
  }
  v30.location = 0;
  v30.length = 24;
  CFDataGetBytes((CFDataRef)v3, v30, (UInt8 *)&v26);
  __int16 v5 = v26;
  LOWORD(v3) = BYTE1(v26);
  __int16 v6 = BYTE2(v26);
  __int16 v7 = BYTE3(v26);
  __int16 v8 = BYTE4(v26);
  __int16 v9 = BYTE5(v26);
  __int16 v10 = BYTE6(v26);
  __int16 v11 = HIBYTE(v26);
  int v12 = v27;
  LODWORD(a1) = BYTE1(v27);
  __int16 v13 = BYTE2(v27);
  __int16 v14 = BYTE3(v27);
  __int16 v15 = BYTE4(v27);
  __int16 v16 = BYTE5(v27);
  __int16 v17 = BYTE6(v27);
  __int16 v18 = HIBYTE(v27);
  int v19 = v28 << 24;
  int v20 = BYTE1(v28) << 16;
  int v21 = BYTE2(v28) << 8;
  int v22 = BYTE3(v28);
LABEL_8:
  *(_WORD *)(a2 + 64) = (unsigned __int16)v3 | (v5 << 8);
  *(_WORD *)(a2 + 66) = v7 | (v6 << 8);
  *(_WORD *)(a2 + 68) = v9 | (v8 << 8);
  *(_WORD *)(a2 + 70) = v11 | (v10 << 8);
  uint64_t result = a1 | (v12 << 8);
  *(_WORD *)(a2 + 72) = result;
  *(_WORD *)(a2 + 74) = v14 | (v13 << 8);
  *(_WORD *)(a2 + 76) = v16 | (v15 << 8);
  *(_WORD *)(a2 + 78) = v18 | (v17 << 8);
  int v24 = v20 | v19 | v21 | v22;
  unsigned int v25 = bswap32(HIDWORD(v28));
  *(_DWORD *)(a2 + 80) = v24;
  *(_DWORD *)(a2 + 84) = v25;
  *(void *)(a2 + 120) |= 0x800uLL;
  return result;
}

CFTypeID sniffSceneIlluminationKeyToStruct(CFTypeID result, uint64_t a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!result)
  {
    int v5 = 0;
LABEL_9:
    *(_DWORD *)(a2 + 112) = v5;
    *(void *)(a2 + 120) |= 0x10000uLL;
    return result;
  }
  CFNumberRef v3 = (const __CFNumber *)result;
  CFTypeID v4 = CFGetTypeID((CFTypeRef)result);
  uint64_t result = CFNumberGetTypeID();
  if (v4 == result)
  {
    uint64_t result = CFNumberGetValue(v3, kCFNumberSInt64Type, v6);
    if (result)
    {
      int v5 = v6[0];
      if (!HIDWORD(v6[0]))
      {
        if (v6[0] <= 1uLL) {
          int v5 = 1;
        }
        goto LABEL_9;
      }
    }
  }
  return result;
}

void _dispatchUnrecognizedCodePointString(uint64_t *a1)
{
  uint64_t v2 = *a1;
  CFNumberRef v3 = (const void *)*((int *)a1 + 2);
  CFDictionaryRef v4 = (const __CFDictionary *)a1[2];
  CFDataRef Value = CFDictionaryGetValue(v4, v3);
  if (!Value)
  {
    CFDataRef Value = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"%@%d", v2, v3);
    if (Value)
    {
      CFDictionarySetValue(v4, v3, Value);
      CFRelease(Value);
    }
  }
  a1[3] = (uint64_t)Value;
}

uint64_t IOSurfaceWiringAssertionGetTypeID()
{
  return MEMORY[0x1F41817D0](IOSurfaceWiringAssertion);
}

uint64_t IOSurfaceCreateMachPortWithOptions(uint64_t a1, uint64_t a2)
{
  if (!a1 || (a2 & 1) != 0) {
    return 0;
  }
  else {
    return IOSurfaceClientCreateMachPortWithOptions(*(void *)(a1 + 8), a2);
  }
}

uint64_t IOSurfaceGetTileFormat(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetTileFormat(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceLockPlane(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (a1) {
    return IOSurfaceClientLock(*(void *)(a1 + 8), a3, a4);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceUnlockPlane(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (a1) {
    return IOSurfaceClientUnlock(*(void *)(a1 + 8), a3, a4);
  }
  else {
    return 3758097090;
  }
}

size_t IOSurfaceGetElementHeightOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetElementHeightOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

uint64_t IOSurfaceGetSeedOfPlane(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetSeed(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceFlushProcessorCaches(uint64_t result)
{
  if (result) {
    return IOSurfaceClientFlushProcessorCaches(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceBindAccelOnPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a1) {
    return IOSurfaceClientBindAccel(*(void *)(a1 + 8), a2, a3);
  }
  else {
    return 3758097090;
  }
}

BOOL IOSurfaceNeedsBindAccel(BOOL result, int a2, int a3)
{
  if (result) {
    return IOSurfaceClientNeedsBindAccel(*(void *)(result + 8), a2, a3);
  }
  return result;
}

BOOL IOSurfaceNeedsBindAccelOnPlane(BOOL result, int a2, int a3)
{
  if (result) {
    return IOSurfaceClientNeedsBindAccel(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceCopyDataValueBytes(uint64_t result, const __CFString *a2, unsigned char *a3, size_t *a4)
{
  if (result) {
    return IOSurfaceClientCopyDataValueBytes(*(void *)(result + 8), a2, a3, a4);
  }
  return result;
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetUseCount(*((void *)buffer + 1));
  }
  return (int)buffer;
}

uint64_t IOSurfaceGetNumberOfUseCountCategories()
{
  return 2;
}

uint64_t IOSurfaceIncrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientIncrementUseCountForCategory(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceDecrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientDecrementUseCountForCategory(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsInUseForCategory(BOOL result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientIsInUseForCategory(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsInUseForAnyOtherCategory(BOOL result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientIsInUseForAnyOtherCategory(*(void *)(result + 8), a2);
  }
  return result;
}

IOSurface *IOSurfaceWrapClientImage(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  uint64_t result = (IOSurface *)IOSurfaceClientWrapClientImage(a1, a2, a3, a4, a5, a6);
  if (result)
  {
    __int16 v7 = result;
    uint64_t result = [[IOSurface alloc] initWithClientBuffer:result];
    if (!result)
    {
      IOSurfaceClientRelease(v7);
      return 0;
    }
  }
  return result;
}

IOSurface *IOSurfaceWrapClientMemory(uint64_t a1, uint64_t a2)
{
  uint64_t result = (IOSurface *)IOSurfaceClientWrapClientMemory(a1, a2);
  if (result)
  {
    CFNumberRef v3 = result;
    uint64_t result = [[IOSurface alloc] initWithClientBuffer:result];
    if (!result)
    {
      IOSurfaceClientRelease(v3);
      return 0;
    }
  }
  return result;
}

uint64_t IOSurfaceSetTiled(uint64_t a1, unsigned int a2)
{
  if (a1) {
    return IOSurfaceClientSetTiled(*(void *)(a1 + 8), a2);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfaceGetBitsPerBlock(uint64_t result)
{
  if (result) {
    return 8 * IOSurfaceClientGetBytesPerElement(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetBitsPerBlockOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return 8 * IOSurfaceClientGetBytesPerElementOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBlockWidthOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetElementWidthOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBlockHeightOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetElementHeightOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceSetTimestamp(uint64_t result, void *a2, void *a3, uint64_t a4)
{
  if (result) {
    return IOSurfaceClientSetTimestamp(*(void *)(result + 8), a2, a3, a4);
  }
  return result;
}

uint64_t IOSurfaceSetBulkAttachments(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1) {
    return IOSurfaceClientSetBulkAttachments(*(void *)(a1 + 8), a2, a3, a4);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOSurfacePrefetchPages(uint64_t a1)
{
  if (a1) {
    return IOSurfaceClientPrefetchPages(*(void *)(a1 + 8));
  }
  else {
    return 3758097090;
  }
}

BOOL IOSurfaceSupportsProtectionOptions(BOOL result, uint64_t a2)
{
  if (result) {
    return IOSurfaceClientSupportsProtectionOptions(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsDisplayable(BOOL result)
{
  if (result) {
    return IOSurfaceClientIsDisplayable(*(void *)(result + 8));
  }
  return result;
}

BOOL IOSurfaceIsSysMemOnly(BOOL result)
{
  if (result) {
    return IOSurfaceClientIsSysMemOnly(*(void *)(result + 8));
  }
  return result;
}

size_t IOSurfaceGetNumberOfComponentsOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer) {
    return IOSurfaceClientGetNumberOfComponentsOfPlane(*(void *)(buffer + 8), planeIndex);
  }
  return buffer;
}

IOSurfaceComponentName IOSurfaceGetNameOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetNameOfComponentOfPlane(*((void *)buffer + 1), planeIndex, componentIndex);
  }
  return (int)buffer;
}

IOSurfaceComponentType IOSurfaceGetTypeOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetTypeOfComponentOfPlane(*((void *)buffer + 1), planeIndex, componentIndex);
  }
  return (int)buffer;
}

IOSurfaceComponentRange IOSurfaceGetRangeOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetRangeOfComponentOfPlane(*((void *)buffer + 1), planeIndex, componentIndex);
  }
  return (int)buffer;
}

size_t IOSurfaceGetBitDepthOfComponentOfPlane(size_t buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBitDepthOfComponentOfPlane(*(void *)(buffer + 8), planeIndex, componentIndex);
  }
  return buffer;
}

size_t IOSurfaceGetBitOffsetOfComponentOfPlane(size_t buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer) {
    return IOSurfaceClientGetBitOffsetOfComponentOfPlane(*(void *)(buffer + 8), planeIndex, componentIndex);
  }
  return buffer;
}

IOSurfaceSubsampling IOSurfaceGetSubsampling(IOSurfaceRef buffer)
{
  if (buffer) {
    LODWORD(buffer) = IOSurfaceClientGetSubsampling(*((void *)buffer + 1));
  }
  return (int)buffer;
}

uint64_t IOSurfaceGetBytesPerCompressedTileHeaderOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerCompressedTileHeaderOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetBytesPerRowOfTileDataOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetBytesPerRowOfTileDataOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHTPCPredictionSelectorOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHTPCPredictionSelectorOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientGetHTPCVerticalHeaderGroupingModeOfPlane(*(void *)(result + 8), a2);
  }
  return result;
}

uint64_t IOSurfaceGetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t result, unsigned int a2)
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (result)
  {
    IOSurfaceClientGetCompressedTileDataRegionMemoryUsedOfPlane(*(void *)(result + 8), a2, v2);
    return v2[0];
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (result) {
    return IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceSetIndexedTimestamp(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result) {
    return IOSurfaceClientSetIndexedTimestamp(*(void *)(result + 8), a2, a3);
  }
  return result;
}

uint64_t IOSurfaceGetRegistryID(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetRegistryID(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetTraceID(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetTraceID(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceHasDataProperty(uint64_t result, unsigned int a2)
{
  if (result) {
    return IOSurfaceClientHasDataProperty(*(void *)(result + 8), a2);
  }
  return result;
}

BOOL IOSurfaceIsMetalSharedTexture(BOOL result)
{
  if (result) {
    return IOSurfaceClientIsMetalSharedTexture(*(void *)(result + 8));
  }
  return result;
}

uint64_t IOSurfaceGetWiringAssertionCount(uint64_t result)
{
  if (result) {
    return IOSurfaceClientGetWiringAssertionCount(*(void *)(result + 8));
  }
  return result;
}

void sub_1A7C2F86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7C2FB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7C305B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _IOSurfaceRemoteMethodInitialize(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  _ioSurfaceConnect();
  CFDictionaryRef v4 = (char *)malloc_type_calloc(1uLL, 0x28uLL, 0x10000400A747E1EuLL);
  *(_DWORD *)CFDictionaryRef v4 = 1;
  *(void *)(v4 + 4) = ioSurfaceLimits;
  int v5 = qword_1EB28B2E0;
  *(int32x2_t *)(v4 + 12) = vmovn_s64(*(int64x2_t *)&qword_1EB28B2D0);
  *((_DWORD *)v4 + 5) = v5;
  *((_DWORD *)v4 + 6) = 1;
  *((void *)v4 + 4) = 1;
  __int16 v6 = dispatch_data_create(v4, 0x28uLL, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  xpc_object_t v7 = xpc_data_create_with_dispatch_data(v6);
  xpc_dictionary_set_value(v3, "Limits", v7);
  xpc_dictionary_set_uint64(v3, "ProtocolVersion", 1uLL);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodGetDebugInfo(void *a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  xpc_object_t xdict = a3;
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_object_t v6 = xpc_array_create(0, 0);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  xpc_object_t v7 = [v4 surfaceStates];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        __int16 v13 = [v4 surfaceStates];
        __int16 v14 = [v13 objectForKeyedSubscript:v12];

        xpc_object_t v15 = xpc_uint64_create([v12 unsignedIntegerValue]);
        xpc_array_append_value(v5, v15);

        xpc_object_t v16 = xpc_uint64_create([v14 debugRefCount]);
        xpc_array_append_value(v6, v16);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v9);
  }

  xpc_dictionary_set_value(xdict, "DebugSurfaceIDList", v5);
  xpc_dictionary_set_value(xdict, "DebugSurfaceRefCount", v6);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientCreate(void *a1, void *a2, void *a3)
{
  v27[1] = *(void **)MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v27[0] = 0;
  unsigned int uint64 = xpc_dictionary_get_uint64(v6, "LookupID");
  if (uint64)
  {
    uint64_t v9 = IOSurfaceClientLookup(uint64);
  }
  else
  {
    unsigned int v10 = xpc_dictionary_copy_mach_send();
    if (v10 - 1 > 0xFFFFFFFD)
    {
      uint64_t v13 = 3758097090;
      CFTypeRef v20 = _ioSurfaceDeserializedFromXPCDictionaryWithKey(v6, "PropertiesDictionary");
      if (!v20) {
        goto LABEL_8;
      }
      long long v21 = (void *)v20;
      __int16 v14 = xpc_dictionary_get_value(v6, "ClientProvidedShmem");
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          _IOSurfaceRemoteMethodClientCreate_cold_3(v5);
        }
        size_t v22 = xpc_shmem_map(v14, v27);
        if (!v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            _IOSurfaceRemoteMethodClientCreate_cold_1(v5);
          }
          CFRelease(v21);
          uint64_t v13 = 3758097085;
          goto LABEL_7;
        }
        unint64_t v12 = v22;
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)v21);
        CFDictionarySetValue(MutableCopy, @"IOSurfaceAddress", (const void *)[NSNumber numberWithUnsignedLong:v27[0]]);
        CFRelease(v21);
        CFDataRef Value = (void *)CFDictionaryGetValue(MutableCopy, @"IOSurfaceAllocSize");
        if (Value)
        {
          unint64_t v25 = [Value unsignedIntegerValue];
          if (v25 > v12)
          {
            uint64_t v26 = v25;
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
              _IOSurfaceRemoteMethodClientCreate_cold_2(v12, v26);
            }
          }
        }
      }
      else if (CFDictionaryGetValueIfPresent((CFDictionaryRef)v21, @"IOSurfaceAddress", 0))
      {
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)v21);
        CFDictionaryRemoveValue(MutableCopy, @"IOSurfaceAddress");
        CFRelease(v21);
        unint64_t v12 = 0;
      }
      else
      {
        unint64_t v12 = 0;
        CFMutableDictionaryRef MutableCopy = (__CFDictionary *)v21;
      }
      uint64_t v9 = IOSurfaceClientCreate(MutableCopy);
      CFRelease(MutableCopy);

      if (!v9) {
        goto LABEL_8;
      }
LABEL_6:
      __int16 v14 = xpc_dictionary_get_value(v6, "ExtraData");
      [v5 _addSurface:v9 mappedAddress:v27[0] mappedSize:v12 extraData:v14];
      UnadjustedBaseAddress = (void *)_IOSurfaceClientGetUnadjustedBaseAddress((uint64_t)v9);
      size_t AllocSize = IOSurfaceClientGetAllocSize((uint64_t)v9);
      xpc_object_t v17 = xpc_shmem_create(UnadjustedBaseAddress, AllocSize);
      xpc_dictionary_set_value(v7, "MemoryObject", v17);
      int ID = IOSurfaceClientGetID((uint64_t)v9);
      _ioSurfaceAddClientState((uint64_t)v9, ID, v7);

      uint64_t v13 = 0;
LABEL_7:

      goto LABEL_8;
    }
    mach_port_name_t v11 = v10;
    uint64_t v9 = IOSurfaceClientLookupFromMachPort(v10);
    mach_port_deallocate(*MEMORY[0x1E4F14960], v11);
  }
  unint64_t v12 = 0;
  uint64_t v13 = 3758097136;
  if (v9) {
    goto LABEL_6;
  }
LABEL_8:

  return v13;
}

uint64_t _IOSurfaceRemoteMethodClientLock(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Options");
  int v6 = 0;
  return IOSurfaceClientLock(a2, uint64, &v6);
}

uint64_t _IOSurfaceRemoteMethodClientUnlock(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Options");
  int v6 = 0;
  return IOSurfaceClientUnlock(a2, uint64, &v6);
}

uint64_t _IOSurfaceRemoteMethodClientGetPlaneState(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 3758097085;
  id v7 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "PlaneIndex");
  if (IOSurfaceClientGetPlaneCount(a2) >= uint64)
  {
    uint64_t v9 = malloc_type_calloc(1uLL, 0x48uLL, 0x1000040773C5DECuLL);
    if (v9)
    {
      unsigned int v10 = v9;
      *uint64_t v9 = 0;
      v9[1] = uint64;
      *((_DWORD *)v9 + 1) = IOSurfaceClientGetWidthOfPlane(a2, uint64);
      *((_DWORD *)v10 + 2) = IOSurfaceClientGetHeightOfPlane(a2, uint64);
      *((_DWORD *)v10 + 3) = IOSurfaceClientGetOffsetOfPlane(a2, uint64);
      *((_DWORD *)v10 + 4) = IOSurfaceClientGetBytesPerRowOfPlane(a2, uint64);
      *((_DWORD *)v10 + 5) = IOSurfaceClientGetSizeOfPlane(a2, uint64);
      v10[20] = IOSurfaceClientGetBytesPerElementOfPlane(a2, uint64);
      *((unsigned char *)v10 + 42) = IOSurfaceClientGetElementWidthOfPlane(a2, uint64);
      *((unsigned char *)v10 + 43) = IOSurfaceClientGetElementHeightOfPlane(a2, uint64);
      uint64_t v23 = 0;
      v24[0] = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      IOSurfaceClientGetExtendedPixelsOfPlane(a2, uint64, v24, &v23, &v22, &v21);
      int v11 = v23;
      int v12 = v22;
      *((_DWORD *)v10 + 8) = v24[0];
      *((_DWORD *)v10 + 9) = v12;
      int v13 = v21;
      *((_DWORD *)v10 + 6) = v11;
      *((_DWORD *)v10 + 7) = v13;
      unsigned __int8 NumberOfComponentsOfPlane = IOSurfaceClientGetNumberOfComponentsOfPlane(a2, uint64);
      *((unsigned char *)v10 + 44) = NumberOfComponentsOfPlane;
      uint64_t v15 = NumberOfComponentsOfPlane;
      if (NumberOfComponentsOfPlane)
      {
        unint64_t v16 = 0;
        do
        {
          xpc_object_t v17 = (char *)v10 + v16;
          *((unsigned char *)v10 + v16 + 45) = IOSurfaceClientGetBitDepthOfComponentOfPlane(a2, uint64, v16);
          v17[49] = IOSurfaceClientGetBitOffsetOfComponentOfPlane(a2, uint64, v16);
          v17[53] = IOSurfaceClientGetNameOfComponentOfPlane(a2, uint64, v16);
          v17[57] = IOSurfaceClientGetTypeOfComponentOfPlane(a2, uint64, v16);
          v17[61] = IOSurfaceClientGetRangeOfComponentOfPlane(a2, uint64, v16++);
        }
        while (v15 != v16);
      }
      __int16 v18 = dispatch_data_create(v10, 0x48uLL, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
      xpc_object_t v19 = xpc_data_create_with_dispatch_data(v18);
      xpc_dictionary_set_value(v7, "PlaneState", v19);

      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 3758097090;
  }

  return v6;
}

uint64_t _IOSurfaceRemoteMethodClientBindAccel(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  unsigned int uint64 = xpc_dictionary_get_uint64(v4, "AcceleratorID");
  unsigned int v6 = xpc_dictionary_get_uint64(v4, "AcceleratorField");

  return IOSurfaceClientBindAccel(a2, uint64, v6);
}

uint64_t _IOSurfaceRemoteMethodClientNeedsBindAccel(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  int uint64 = xpc_dictionary_get_uint64(v7, "AcceleratorID");
  int v9 = xpc_dictionary_get_uint64(v7, "AcceleratorField");

  BOOL v10 = IOSurfaceClientNeedsBindAccel(a2, uint64, v9);
  xpc_dictionary_set_BOOL(v6, "NeedsBindAccelerator", v10);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientSetValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = 3758097090;
  CFDictionaryRef v5 = (const __CFDictionary *)_ioSurfaceDeserializedFromXPCDictionaryWithKey(a3, "PropertiesDictionary");
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    if (CFDictionaryGetValue(v5, @"isSetValues"))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v6, @"value");
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = (void *)CFDictionaryGetValue(v6, @"key");
      CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(v6, @"value");
      if (!v8)
      {
LABEL_7:
        CFRelease(v6);
        return v4;
      }
      CFDictionaryRef Value = v9;
    }
    IOSurfaceClientSetValue(a2, v8, Value);
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  return v4;
}

uint64_t _IOSurfaceRemoteMethodClientCopyAllValues(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  CFDictionaryRef v6 = IOSurfaceClientCopyAllValues(a2);
  if (!v6) {
    CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  _ioSurfaceSerializeToXPCDictionaryWithKey(v5, "PropertiesDictionary", v6);
  CFRelease(v6);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientRemoveValue(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v4 = 3758097090;
  string = xpc_dictionary_get_string(xdict, "PropertyKey");
  if (string)
  {
    CFDictionaryRef v6 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], string, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    if (v6)
    {
      id v7 = v6;
      IOSurfaceClientRemoveValue(a2, v6);
      CFRelease(v7);
      return 0;
    }
  }
  return v4;
}

uint64_t _IOSurfaceRemoteMethodClientRemoveAllValues(int a1, uint64_t a2)
{
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientSetPurgeable(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *(void *)&value[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "NewState");
  value[0] = 0;
  uint64_t v8 = IOSurfaceClientSetPurgeable(a2, uint64, value);
  xpc_dictionary_set_uint64(v6, "OldState", value[0]);

  return v8;
}

uint64_t _IOSurfaceRemoteMethodClientCreateMachPort(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  mach_port_name_t MachPort = IOSurfaceClientCreateMachPort(a2);
  if (MachPort - 1 <= 0xFFFFFFFD)
  {
    mach_port_name_t v7 = MachPort;
    xpc_dictionary_set_mach_send();
    mach_port_mod_refs(*MEMORY[0x1E4F14960], v7, 0, -1);
  }

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIncrementUseCount(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientDecrementUseCount(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUse(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  BOOL v6 = IOSurfaceClientIsInUse(a2);
  xpc_dictionary_set_BOOL(v5, "IsInUse", v6);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientCopyDataValueBytes(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  size[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 3758097085;
  id v7 = a3;
  id v8 = a4;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "BufferSize");
  if (uint64 <= 0xA00000)
  {
    size_t v10 = uint64;
    string = xpc_dictionary_get_string(v7, "PropertyKey");
    if (string
      && (CFStringRef v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], string, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0])) != 0)
    {
      CFStringRef v13 = v12;
      __int16 v14 = malloc_type_calloc(1uLL, v10, 0x6FECE025uLL);
      if (v14)
      {
        uint64_t v15 = v14;
        size[0] = v10;
        uint64_t v6 = IOSurfaceClientCopyDataValueBytes(a2, v13, v14, size);
        CFRelease(v13);
        if (v6 == -536870181)
        {
          xpc_dictionary_set_uint64(v8, "BufferSize", size[0]);
          goto LABEL_11;
        }
        if (!v6)
        {
          unint64_t v16 = dispatch_data_create(v15, size[0], 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
          xpc_object_t v17 = xpc_data_create_with_dispatch_data(v16);
          xpc_dictionary_set_value(v8, "Buffer", v17);

LABEL_11:
          uint64_t v6 = 0;
        }
      }
      else
      {
        CFRelease(v13);
      }
    }
    else
    {
      uint64_t v6 = 3758097090;
    }
  }

  return v6;
}

uint64_t _IOSurfaceRemoteMethodClientSignalEvent(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "EventValue");
  uint64_t v6 = xpc_dictionary_get_uint64(v4, "EventOperation");
  unsigned int v7 = xpc_dictionary_copy_mach_send();

  uint64_t v8 = IOSurfaceClientSignalEvent(a2, v7, uint64, v6);
  mach_port_mod_refs(*MEMORY[0x1E4F14960], v7, 0, -1);
  return v8;
}

uint64_t _IOSurfaceRemoteMethodClientSetBulkAttachments(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  memset(v6, 0, sizeof(v6));
  uint64_t v5 = 0;
  _ioSurfaceDeserializeBulkAttachmentsFromXPCDictionary(a3, (uint64_t)v6, &v5);
  return IOSurfaceClientSetBulkAttachments(a2, (uint64_t)v6, 0x74uLL, v5);
}

uint64_t _IOSurfaceRemoteMethodClientGetBulkAttachments(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v10 = 0;
  memset(__dst, 0, sizeof(__dst));
  size_t v8 = 116;
  id v5 = a4;
  uint64_t BulkAttachments = IOSurfaceClientGetBulkAttachments(a2, __dst, &v8);
  _ioSurfaceSerializeBulkAttachmentsToXPCDictionary(v5, (uint64_t)__dst, -1);

  return BulkAttachments;
}

uint64_t _IOSurfaceRemoteMethodClientIncrementUseCountForCategory(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Category");
  IOSurfaceClientIncrementUseCountForCategory(a2, uint64);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientDecrementUseCountForCategory(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "Category");
  IOSurfaceClientDecrementUseCountForCategory(a2, uint64);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUseForCategory(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "Category");
  BOOL v8 = IOSurfaceClientIsInUseForCategory(a2, uint64);
  xpc_dictionary_set_BOOL(v6, "IsInUse", v8);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUseForAnyOtherCategory(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  unsigned int uint64 = xpc_dictionary_get_uint64(a3, "Category");
  BOOL v8 = IOSurfaceClientIsInUseForAnyOtherCategory(a2, uint64);
  xpc_dictionary_set_BOOL(v6, "IsInUse", v8);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientGetYCbCrMatrix(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *(void *)&value[1] = *MEMORY[0x1E4F143B8];
  value[0] = 0;
  id v5 = a4;
  IOSurfaceClientGetYCbCrMatrix(a2, value);
  xpc_dictionary_set_uint64(v5, "YCbCrMatrixIndex", value[0]);

  return 0;
}

void _ioSurfaceAddClientState(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x1000040883E98BCuLL);
  *(_DWORD *)id v6 = 0;
  *((_DWORD *)v6 + 1) = a2;
  *((_DWORD *)v6 + 2) = IOSurfaceClientGetAllocSize(a1);
  *((_DWORD *)v6 + 6) = _IOSurfaceClientGetBufferOffset(a1);
  *((_DWORD *)v6 + 3) = IOSurfaceClientGetWidth(a1);
  *((_DWORD *)v6 + 4) = IOSurfaceClientGetHeight(a1);
  *((_DWORD *)v6 + 5) = IOSurfaceClientGetBytesPerRow(a1);
  *((_DWORD *)v6 + 7) = IOSurfaceClientGetPixelFormat(a1);
  *((_DWORD *)v6 + 8) = IOSurfaceClientGetCacheMode(a1);
  *((_DWORD *)v6 + 9) = IOSurfaceClientGetPlaneCount(a1);
  *((_DWORD *)v6 + 10) = IOSurfaceClientGetBytesPerElement(a1);
  *((_DWORD *)v6 + 11) = IOSurfaceClientGetElementWidth(a1);
  *((_DWORD *)v6 + 12) = IOSurfaceClientGetElementHeight(a1);
  *((_DWORD *)v6 + 13) = IOSurfaceClientGetSeed(a1);
  *((_DWORD *)v6 + 14) = IOSurfaceClientGetSubsampling(a1);
  v6[60] = v6[60] & 0xFE | (IOSurfaceClientAllowsPixelSizeCasting(a1) != 0);
  if (IOSurfaceClientIsSysMemOnly(a1)) {
    char v7 = 2;
  }
  else {
    char v7 = 0;
  }
  v6[60] = v6[60] & 0xFD | v7;
  if (IOSurfaceClientIsDisplayable(a1)) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  v6[60] = v6[60] & 0xFB | v8;
  *(void *)(v6 + 61) = IOSurfaceClientGetTraceID(a1);
  v6[60] = v6[60] & 0xF7 | (8 * (IOSurfaceClientGetProhibitUseCount(a1) != 0));
  int v10 = dispatch_data_create(v6, 0x48uLL, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  xpc_object_t v9 = xpc_data_create_with_dispatch_data(v10);
  xpc_dictionary_set_value(v5, "SurfaceState", v9);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

id _copyDescriptions(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [a1 count];
  if (v3)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = objc_msgSend(a1, "objectAtIndex:", i, 0, v16);
      char v7 = (void *)IOCFUnserializeWithSize((const char *)[v6 bytes], objc_msgSend(v6, "length"), 0, 0, &v15);
      char v8 = (void *)[v7 objectForKey:@"BasicInfo"];
      uint64_t v9 = 0;
      if ([v8 length] == 120) {
        uint64_t v9 = [v8 bytes];
      }
      int v10 = (void *)[v7 objectForKey:@"Layout"];
      if ([v10 length] == 48) {
        uint64_t v11 = [v10 bytes];
      }
      else {
        uint64_t v11 = 0;
      }
      uint64_t v12 = [v7 objectForKey:@"IOSurfaceName"];
      if (v9 && v11)
      {
        CFStringRef v13 = [[_IOSurfaceDebugDescription alloc] initWithBasicInfo:v9 layoutInfo:v11 name:v12];
        [v2 addObject:v13];
      }
    }
  }
  return v2;
}

uint64_t IOSurfaceNotifierGetTypeID()
{
  uint64_t result = kIOSurfaceNotifierID;
  if (!kIOSurfaceNotifierID)
  {
    pthread_once(&IOSurfaceNotifierGetTypeID_once, (void (*)(void))ioSurfaceNotifierClassInitialize);
    return kIOSurfaceNotifierID;
  }
  return result;
}

uint64_t ioSurfaceNotifierClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOSurfaceNotifierint ID = result;
  return result;
}

void IOSurfaceNotifierSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  if (a2)
  {
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), a2);
    *(void *)(a1 + 32) = a2;
  }
  else
  {
    uint64_t v4 = *(NSObject **)(a1 + 32);
    dispatch_queue_t current_queue = dispatch_get_current_queue();
    if (current_queue && current_queue == v4) {
      IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), 0);
    }
    else {
      dispatch_sync_f(v4, (void *)a1, (dispatch_function_t)tearDownCallback);
    }
    *(void *)(a1 + 32) = 0;
  }
}

void tearDownCallback(uint64_t a1)
{
}

unint64_t IOSurfaceNotifierCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!kIOSurfaceNotifierID) {
    pthread_once(&IOSurfaceNotifierGetTypeID_once, (void (*)(void))ioSurfaceNotifierClassInitialize);
  }
  unint64_t Instance = _CFRuntimeCreateInstance();
  *(void *)(Instance + 24) = a1;
  *(void *)(Instance + 40) = a3;
  id v6 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
  *(void *)(Instance + 16) = v6;
  if (v6)
  {
    mach_port_t MachPort = IONotificationPortGetMachPort(v6);
    int v8 = IOSurfaceClientSetSurfaceNotify(MachPort, (uint64_t)IOSurfaceNotifierNotifyFunc, Instance);
    if (!v8)
    {
      *(unsigned char *)(Instance + 48) = 1;
      return Instance;
    }
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "IOSurfaceClientSetSurfaceNotify failed %08x\n", v8);
  }
  CFRelease((CFTypeRef)Instance);
  return 0;
}

uint64_t IOSurfaceNotifierNotifyFunc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(a1 + 24))(*(void *)(a1 + 40), a4, 0, 0);
}

uint64_t IOSurfaceNotifierInvalidate(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    uint64_t result = IOSurfaceClientRemoveSurfaceNotify(result);
    *(unsigned char *)(v1 + 48) = 0;
  }
  return result;
}

void ioSurfaceNotifierFinalize(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    IOSurfaceClientRemoveSurfaceNotify(a1);
  }
  id v2 = *(IONotificationPort **)(a1 + 16);
  if (v2)
  {
    if (!*(void *)(a1 + 32)
      || (IONotificationPortSetDispatchQueue(v2, 0), (id v2 = *(IONotificationPort **)(a1 + 16)) != 0))
    {
      IONotificationPortDestroy(v2);
    }
  }
}

CFStringRef ioSurfaceNotifierCopyFormatDescription(void *a1, const __CFDictionary *a2)
{
  CFIndex v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOSurfaceNotifier %p refcnt=%d notificationPort=%p callback=%p, refcon=%p>", a1, v4, a1[2], a1[3], a1[5]);
}

uint64_t ioSurfaceNotifierCopyDebugDescription()
{
  return 0;
}

void _ioSurfaceSerializeToXPCDictionaryWithKey(void *a1, const char *a2, const void *a3)
{
  destructor[5] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (v5)
  {
    if (a2) {
      goto LABEL_3;
    }
LABEL_6:
    CFStringRef v13 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
    [v13 handleFailureInFunction:v14, @"IOSurfaceRemoteProtocol.m", 82, @"Invalid parameter not satisfying: %@", @"key" file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
LABEL_7:
    CFStringRef v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
    [v15 handleFailureInFunction:v16, @"IOSurfaceRemoteProtocol.m", 83, @"Invalid parameter not satisfying: %@", @"object" file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
  [v11 handleFailureInFunction:v12, @"IOSurfaceRemoteProtocol.m", 81, @"Invalid parameter not satisfying: %@", @"dict" file lineNumber description];

  if (!a2) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a3) {
    goto LABEL_7;
  }
LABEL_4:
  CFDataRef v6 = IOCFSerialize(a3, 1uLL);
  BytePtr = CFDataGetBytePtr(v6);
  size_t Length = CFDataGetLength(v6);
  destructor[0] = MEMORY[0x1E4F143A8];
  destructor[1] = 3221225472;
  destructor[2] = ___ioSurfaceSerializeToXPCDictionaryWithKey_block_invoke;
  destructor[3] = &__block_descriptor_40_e5_v8__0l;
  destructor[4] = v6;
  uint64_t v9 = dispatch_data_create(BytePtr, Length, 0, destructor);
  xpc_object_t v10 = xpc_data_create_with_dispatch_data(v9);
  xpc_dictionary_set_value(v5, a2, v10);
}

void ___ioSurfaceSerializeToXPCDictionaryWithKey_block_invoke(uint64_t a1)
{
}

CFTypeRef _ioSurfaceDeserializedFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  length[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef  _Nullable _ioSurfaceDeserializedFromXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull)");
    [v7 handleFailureInFunction:v8, @"IOSurfaceRemoteProtocol.m", 96, @"Invalid parameter not satisfying: %@", @"dict" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  xpc_object_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef  _Nullable _ioSurfaceDeserializedFromXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull)");
  [v9 handleFailureInFunction:v10, @"IOSurfaceRemoteProtocol.m", 97, @"Invalid parameter not satisfying: %@", @"key" file lineNumber description];

LABEL_3:
  length[0] = 0;
  data = (const char *)xpc_dictionary_get_data(v3, a2, length);
  if (data)
  {
    CFStringRef errorString = 0;
    CFTypeRef v5 = IOCFUnserializeBinary(data, length[0], (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &errorString);
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        _ioSurfaceDeserializedFromXPCDictionaryWithKey_cold_1((uint64_t)a2, (uint64_t *)&errorString);
      }
      CFRelease(errorString);
    }
  }
  else
  {
    CFTypeRef v5 = 0;
  }

  return v5;
}

void _ioSurfaceSerializeBulkAttachmentsToXPCDictionary(void *a1, uint64_t a2, __int16 a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  CFDataRef v6 = v5;
  if (a3)
  {
    uint64_t v10 = 0;
    long long v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)uint64_t v11 = *(_OWORD *)a2;
    *(_OWORD *)&v11[16] = v9;
    xpc_dictionary_set_data(v5, "CleanAperture", &v10, 0x28uLL);
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v10 = 0;
  *(_OWORD *)uint64_t v11 = *(_OWORD *)(a2 + 32);
  xpc_dictionary_set_data(v6, "PixelAspectRatio", &v10, 0x18uLL);
  if ((a3 & 0x800) == 0)
  {
LABEL_4:
    if ((a3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
  *(void *)uint64_t v11 = *(void *)(a2 + 80);
  *(_OWORD *)&v11[8] = *(_OWORD *)(a2 + 64);
  xpc_dictionary_set_data(v6, "MasteringDisplayColorVolume", &v10, 0x20uLL);
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = *(void *)(a2 + 48);
  xpc_dictionary_set_data(v6, "GammaLevel", &v10, 8uLL);
  if ((a3 & 0x2000) == 0)
  {
LABEL_6:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v10 = *(void *)(a2 + 92);
  xpc_dictionary_set_data(v6, "EDRFactor", &v10, 8uLL);
  if ((a3 & 0x1000) == 0)
  {
LABEL_7:
    if ((a3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v10 = 0;
  HIDWORD(v10) = *(_DWORD *)(a2 + 88);
  xpc_dictionary_set_data(v6, "ContentLightLevelInfo", &v10, 8uLL);
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((a3 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  xpc_dictionary_set_uint64(v6, "FieldCount", *(unsigned __int8 *)(a2 + 56));
  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  xpc_dictionary_set_uint64(v6, "FieldDetail", *(unsigned __int8 *)(a2 + 57));
  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  xpc_dictionary_set_uint64(v6, "YCbCrMatrixIndex", *(unsigned __int8 *)(a2 + 58));
  if ((a3 & 0x40) == 0)
  {
LABEL_11:
    if ((a3 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  xpc_dictionary_set_uint64(v6, "ColorPrimariesIndex", *(unsigned __int8 *)(a2 + 59));
  if ((a3 & 0x80) == 0)
  {
LABEL_12:
    if ((a3 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  xpc_dictionary_set_uint64(v6, "TransferFunctionIndex", *(unsigned __int8 *)(a2 + 60));
  if ((a3 & 0x100) == 0)
  {
LABEL_13:
    if ((a3 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_30:
  xpc_dictionary_set_uint64(v6, "ChromaLocationTopField", *(unsigned __int8 *)(a2 + 61));
  if ((a3 & 0x200) != 0) {
LABEL_14:
  }
    xpc_dictionary_set_uint64(v6, "ChromaLocationBottomField", *(unsigned __int8 *)(a2 + 62));
LABEL_15:
  if ((a3 & 0x4400) != 0)
  {
    if ((a3 & 0x400) != 0)
    {
      uint64_t v7 = *(unsigned char *)(a2 + 63) & 0xF;
      if ((a3 & 0x4000) != 0) {
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v7 = 0;
      if ((a3 & 0x4000) != 0)
      {
LABEL_18:
        xpc_dictionary_set_uint64(v6, "ChromaSubsampling", v7 | (16 * *(unsigned __int8 *)(a2 + 100)) | 0x80);
        uint64_t v7 = *(unsigned __int8 *)(a2 + 100);
        int v8 = "PremultipliedAlpha";
LABEL_34:
        xpc_dictionary_set_uint64(v6, v8, v7);
        goto LABEL_35;
      }
    }
    int v8 = "ChromaSubsampling";
    goto LABEL_34;
  }
LABEL_35:
}

void _ioSurfaceDeserializeBulkAttachmentsFromXPCDictionary(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  memset(v34, 0, 40);
  uint64_t v5 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "CleanAperture", v34, 0x28uLL))
  {
    long long v6 = *(_OWORD *)((char *)&v34[1] + 8);
    *(_OWORD *)a2 = *(_OWORD *)((char *)v34 + 8);
    *(_OWORD *)(a2 + 16) = v6;
    uint64_t v5 = 1;
  }
  uint64_t v32 = 0;
  long long v33 = 0uLL;
  if (_ioSurfaceCopyStructFromKey(v4, "PixelAspectRatio", &v32, 0x18uLL))
  {
    v5 |= 2uLL;
    *(_OWORD *)(a2 + 32) = v33;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  if (_ioSurfaceCopyStructFromKey(v4, "MasteringDisplayColorVolume", &v30, 0x20uLL))
  {
    v5 |= 0x800uLL;
    *(void *)(a2 + 80) = *((void *)&v30 + 1);
    *(_OWORD *)(a2 + 64) = v31;
  }
  uint64_t v29 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "GammaLevel", &v29, 8uLL))
  {
    v5 |= 4uLL;
    *(void *)(a2 + 48) = v29;
  }
  uint64_t v28 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "EDRFactor", &v28, 8uLL))
  {
    v5 |= 0x2000uLL;
    *(void *)(a2 + 92) = v28;
  }
  uint64_t v27 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "ContentLightLevelInfo", &v27, 8uLL))
  {
    v5 |= 0x1000uLL;
    *(_DWORD *)(a2 + 88) = HIDWORD(v27);
  }
  uint64_t v7 = xpc_dictionary_get_value(v4, "FieldCount");
  unint64_t v25 = v7;
  if (v7)
  {
    v5 |= 8uLL;
    *(unsigned char *)(a2 + 56) = xpc_uint64_get_value(v7);
  }
  int v8 = xpc_dictionary_get_value(v4, "FieldDetail");
  uint64_t v24 = v8;
  if (v8)
  {
    v5 |= 0x10uLL;
    *(unsigned char *)(a2 + 57) = xpc_uint64_get_value(v8);
  }
  long long v9 = xpc_dictionary_get_value(v4, "YCbCrMatrixIndex");
  uint64_t v10 = v9;
  if (v9)
  {
    v5 |= 0x20uLL;
    *(unsigned char *)(a2 + 58) = xpc_uint64_get_value(v9);
  }
  uint64_t v11 = xpc_dictionary_get_value(v4, "ColorPrimariesIndex");
  uint64_t v12 = v11;
  if (v11)
  {
    v5 |= 0x40uLL;
    *(unsigned char *)(a2 + 59) = xpc_uint64_get_value(v11);
  }
  CFStringRef v13 = xpc_dictionary_get_value(v4, "TransferFunctionIndex");
  __int16 v14 = v13;
  if (v13)
  {
    v5 |= 0x80uLL;
    *(unsigned char *)(a2 + 60) = xpc_uint64_get_value(v13);
  }
  CFStringRef v15 = xpc_dictionary_get_value(v4, "ChromaLocationTopField");
  uint64_t v16 = v15;
  if (v15)
  {
    v5 |= 0x100uLL;
    *(unsigned char *)(a2 + 61) = xpc_uint64_get_value(v15);
  }
  xpc_object_t v17 = xpc_dictionary_get_value(v4, "ChromaLocationBottomField");
  __int16 v18 = v17;
  if (v17)
  {
    v5 |= 0x200uLL;
    *(unsigned char *)(a2 + 62) = xpc_uint64_get_value(v17);
  }
  xpc_object_t v19 = xpc_dictionary_get_value(v4, "ChromaSubsampling");
  CFTypeRef v20 = v19;
  if (v19)
  {
    unsigned int value = xpc_uint64_get_value(v19);
    if ((value & 0xF) != 0)
    {
      v5 |= 0x400uLL;
      *(unsigned char *)(a2 + 63) = value & 0xF;
    }
    if ((value & 0x80) != 0)
    {
      v5 |= 0x4000uLL;
      *(unsigned char *)(a2 + 100) = (value >> 4) & 0xF7;
    }
  }
  uint64_t v22 = xpc_dictionary_get_value(v4, "PremultipliedAlpha");
  uint64_t v23 = v22;
  if (v22)
  {
    v5 |= 0x4000uLL;
    *(unsigned char *)(a2 + 100) = xpc_uint64_get_value(v22);
  }
  if (a3) {
    *a3 = v5;
  }
}

BOOL _ioSurfaceCopyStructFromKey(void *a1, const char *a2, void *a3, size_t a4)
{
  long long v6 = xpc_dictionary_get_value(a1, a2);
  if (v6)
  {
    bzero(a3, a4);
    BOOL v7 = xpc_data_get_bytes(v6, a3, 0, a4) == a4;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void ___ioSurfaceConnectInternal_block_invoke_cold_1()
{
}

void ___ioSurfaceConnectInternal_block_invoke_cold_2()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  *(_WORD *)mach_port_t v0 = 0;
  _os_log_error_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IOSurface.framework versus IOSurface.kext version mismatch", v0, 2u);
}

void ___ioSurfaceConnectInternal_block_invoke_cold_3(char *a1)
{
}

void ___ioSurfaceConnectInternal_block_invoke_cold_4(char *a1)
{
}

void IOSurfaceClientDisallowForever_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  *(_WORD *)mach_port_t v0 = 0;
  _os_log_fault_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "IOSurfaceDisallowForever() invoked too late, connection to IOSurface.kext already established", v0, 2u);
}

void IOSurfaceClientCreateChild_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  *(_WORD *)mach_port_t v0 = 0;
  _os_log_error_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IOSurface creation failed. IOSurface service not present", v0, 2u);
}

void IOSurfaceClientCreateChild_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  mach_port_t v0 = "";
  if (_iosConnectReturn == -536870174) {
    mach_port_t v0 = " (likely sandbox violation)";
  }
  v1[0] = 67109378;
  v1[1] = _iosConnectReturn;
  __int16 v2 = 2080;
  id v3 = v0;
  _os_log_error_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IOSurface creation failed. IOSurface open failed: %08x %s", (uint8_t *)v1, 0x12u);
}

void IOSurfaceClientCreateChild_cold_3(int a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = "";
  v4[0] = 67109890;
  __int16 v5 = 1024;
  v4[1] = a1;
  int v6 = a2;
  if (a1 == -536870210) {
    id v3 = " (likely per client IOSurface limit of 16384 reached)";
  }
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  __int16 v9 = 2080;
  uint64_t v10 = v3;
  _os_log_error_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IOSurface creation failed: %08x parentID: %08x properties: %@%s", (uint8_t *)v4, 0x22u);
}

void IOSurfaceClientRelease_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IOSurfaceClientInvalidate failed: %08x", (uint8_t *)v1, 8u);
}

void IOSurfaceClientIncrementUseCountForCategory_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOSurfaceSharedEventAddEventListener_cold_1()
{
}

void _ioSurfaceEventNotificationCallback2_cold_1()
{
}

void _ioSurfaceEventNotificationCallback2_cold_2()
{
  __assert_rtn("_ioSurfaceEventNotificationCallback2", "IOSurfaceSharedEvent.m", 315, "result == kIOReturnSuccess");
}

void _IOSurfaceRemoteMethodClientCreate_cold_1(void *a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  [a1 pid];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to map client shared memory object from pid %d", v1, 8u);
}

void _IOSurfaceRemoteMethodClientCreate_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "IOSurface client memory mapping is %lu bytes but client claims allocation size of %lu bytes", (uint8_t *)&v2, 0x16u);
}

void _IOSurfaceRemoteMethodClientCreate_cold_3(void *a1)
{
  [a1 pid];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A7C21000, MEMORY[0x1E4F14500], v1, "Client is providing a shmem for its own mapping, pid %d", v2, v3, v4, v5, v6);
}

void _ioSurfaceDeserializedFromXPCDictionaryWithKey_cold_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a2;
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1A7C21000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "IOSurface Deserialization failure for key %{public}s: %@", (uint8_t *)&v3, 0x16u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1F40D8208](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1F40E8688](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1F40E8690](buffer, bufferSize, allocator, options, errorString);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1F40E8698](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86B8](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectTrap1(io_connect_t connect, uint32_t index, uintptr_t p1)
{
  return MEMORY[0x1F40E8708](*(void *)&connect, *(void *)&index, p1);
}

kern_return_t IOConnectTrap2(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2)
{
  return MEMORY[0x1F40E8710](*(void *)&connect, *(void *)&index, p1, p2);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x1F40E8718](*(void *)&connect, *(void *)&index, p1, p2, p3);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1F40E8F18](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x1F40E9180](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1F40E9258](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9278](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1F40E7398]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBA58]();
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

void sys_dcache_flush(void *start, size_t len)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1F40CEDA8](xdata, buffer, off, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1F40CEE18]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1F40CEF98]();
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1F40CF1C8]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x1F40CF1D8]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}