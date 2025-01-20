uint64_t IOGPUResourceListAddResource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  v3 = *(unsigned int *)(a2 + 16);
  v4 = (0x9E3779B97F4A7C15 * v3) >> -*(unsigned char *)(a1 + 488);
  v5 = *(_DWORD *)(*(void *)(a1 + 456) + 4 * v4);
  do
  {
    if (!v5) {
      return _ioGPUResourceListAddResourceEntry(a1, a2, a3, 0);
    }
    v6 = __clz(__rbit32(v5));
    v5 &= ~(1 << v6);
    v7 = (v6 + v4) & (*(_DWORD *)(a1 + 480) - 1);
    v8 = *(void *)(a1 + 472);
    v9 = *(void *)(v8 + 8 * v7);
  }
  while ((*(_DWORD *)(v8 + 8 * v7) & 0xFFFFFF) != v3);
  v10 = (unsigned __int16)(HIWORD(v9) | a3);
  if (v10 != HIWORD(v9))
  {
    *(void *)(v8 + 8 * v7) = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
    *(_WORD *)(*(void *)(a1 + 512) + (((v9 >> 27) & 0x1FFFFF) << 6) + 2 * ((v9 >> 24) & 7) + 48) = HIWORD(v9) | a3;
    v9 = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
  }
  return (v9 >> 24) & 0xFFFFFF;
}

uint64_t _ioGPUResourceListAddResourceEntry(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v7 = (*(void *)(a2 + 8) & 0xFFFFFFFFFFFFFFLL) + 1023;
  if ((a4 & 1) == 0)
  {
    unint64_t v8 = *(void *)(a1 + 520);
    if (v8 < (v7 & 0x1FFFFFFFFFFFC00))
    {
      *(void *)(a1 + 520) = 0;
      return 0xFFFFFFFFLL;
    }
    *(void *)(a1 + 520) = v8 - (v7 & 0x1FFFFFFFFFFFC00);
  }
  uint64_t v10 = *(unsigned int *)(a1 + 500);
  if (*(_DWORD *)(a1 + 544) >= *(_DWORD *)(a1 + 536) && v10 == 0)
  {
    (*(void (**)(void))(a1 + 568))(*(void *)(a1 + 576));
    if (*(_DWORD *)(a1 + 544) >= *(_DWORD *)(a1 + 536)) {
      __assert_rtn("_ioGPUResourceListAddResourceEntry", "IOGPUResourceList.m", 362, "l->numResourceGroups < l->capacity");
    }
  }
  uint64_t v12 = *(unsigned int *)(a1 + 504);
  int v13 = v10 | (8 * v12);
  uint64_t v14 = *(_DWORD *)(a2 + 16) & 0xFFFFFFLL | (a3 << 48) | ((*(void *)&v13 & 0xFFFFFFLL) << 24);
  if ((ioGPUResourceListAddHashValue(a1, v14) & 1) == 0)
  {
    do
      ioGPUResourceListRebuild(a1);
    while (!ioGPUResourceListAddHashValue(a1, v14));
  }
  if (!v10) {
    ++*(_DWORD *)(a1 + 544);
  }
  uint64_t v15 = *(void *)(a1 + 512) + (v12 << 6);
  v16 = (_WORD *)(v15 + 62);
  if ((unint64_t)(v15 + 62) >= *(void *)(*(void *)(a1 + 576) + 112)) {
    _ioGPUResourceListAddResourceEntryFault();
  }
  v17 = (_DWORD *)(v15 + 4 * v10);
  _DWORD *v17 = *(_DWORD *)(a2 + 16);
  v17[6] = v7 >> 10;
  *(_WORD *)(v15 + 2 * v10 + 48) = a3;
  int v18 = v10 + 1;
  _WORD *v16 = v10 + 1;
  if (v10 == 5)
  {
    int v18 = 0;
    *(_DWORD *)(a1 + 504) = *(_DWORD *)(a1 + 544);
  }
  *(_DWORD *)(a1 + 500) = v18;
  int v19 = *(_DWORD *)(a1 + 540) + 1;
  *(_DWORD *)(a1 + 540) = v19;
  *(_DWORD *)(a1 + 548) = v19;
  if (*(void *)a2) {
    IOSurfaceBindAccel();
  }
  return v13 & 0xFFFFFF;
}

uint64_t ioGPUResourceListAddHashValue(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = 0;
  int v3 = *(_DWORD *)(a1 + 480) - 1;
  unint64_t v4 = (0x9E3779B97F4A7C15 * (a2 & 0xFFFFFF)) >> -*(unsigned char *)(a1 + 488);
  int v5 = *(_DWORD *)(a1 + 496);
  uint64_t v6 = *(void *)(a1 + 464);
  int v7 = v4 & 0x3F;
  uint64_t v8 = *(void *)(v6 + 8 * (v4 >> 6)) | ~(-1 << v4);
  unsigned int v9 = v4 >> 6 << 6;
  unsigned int v10 = (v4 >> 6) + 1;
  while (v8 == -1)
  {
    unsigned int v2 = v2 - v7 + 64;
    uint64_t v8 = *(void *)(v6 + 8 * (v10 & v5));
    v9 += 64;
    ++v10;
    int v7 = 0;
    if (v2 >= 0x80) {
      return 0;
    }
  }
  uint64_t v11 = __clz(__rbit64(~v8)) + v9;
  if ((v11 - v4) > 0x7F) {
    return 0;
  }
  while ((v11 - v4) >= 0x20)
  {
    int v14 = v11 - 31;
    if (v11 < 0x1F)
    {
LABEL_19:
      uint64_t v20 = v11;
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 456);
      int v14 = v11 - 30;
      if (v11 >= (int)v11 - 30) {
        int v14 = v11;
      }
      int v16 = -31;
      while (1)
      {
        uint64_t v17 = (v11 + v16) & v3;
        unsigned int v18 = *(_DWORD *)(v15 + 4 * v17);
        unsigned int v19 = __clz(__rbit32(v18));
        uint64_t v20 = v11 + v16 + v19;
        if (v18 && v20 < v11) {
          break;
        }
        if (!__CFADD__(v11, ++v16)) {
          goto LABEL_19;
        }
      }
      uint64_t v24 = *(void *)(a1 + 464);
      uint64_t v23 = *(void *)(a1 + 472);
      uint64_t v25 = *(void *)(v23 + 8 * (v20 & v3));
      *(_DWORD *)(v15 + 4 * v17) = v18 & ~(1 << v19) | (1 << -(char)v16);
      *(void *)(v24 + 8 * (v5 & (v11 >> 6))) |= 1 << v11;
      *(void *)(v23 + 8 * (v11 & v3)) = v25;
      int v14 = v11 + v16;
    }
    BOOL v22 = v14 == v11;
    uint64_t v11 = v20;
    if (v22) {
      return 0;
    }
  }
  *(void *)(*(void *)(a1 + 472) + 8 * (v11 & v3)) = a2;
  uint64_t v12 = 1;
  uint64_t v26 = *(void *)(a1 + 464);
  *(_DWORD *)(*(void *)(a1 + 456) + 4 * v4) |= 1 << (v11 - v4);
  *(void *)(v26 + 8 * (v5 & (v11 >> 6))) |= 1 << v11;
  return v12;
}

uint64_t IOGPUMetalCommandBufferStorageEndSegment(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 688);
  int v2 = *(_DWORD *)(result + 48) - *(_DWORD *)(result + 40);
  uint64_t v4 = *(void *)(result + 120);
  int v3 = *(_DWORD **)(result + 128);
  v3[6] = *(_DWORD *)(result + 684);
  v3[7] = v1;
  v3[3] = v2;
  ++*(_DWORD *)(v4 + 8);
  ++*(_DWORD *)(result + 840);
  uint64_t v5 = *(void *)(result + 136);
  uint64_t v6 = v5 + (v1 << 6);
  *(void *)(result + 848) = v3;
  *(void *)(result + 856) = v5;
  *(void *)(result + 128) = v6;
  *(void *)(result + 136) = v6 + 32;
  return result;
}

uint64_t IOGPUResourceGetProtectionOptions(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

void ioGPUResourceFinalize(uint64_t a1)
{
  uintptr_t v2 = *(unsigned int *)(a1 + 48);
  if (v2)
  {
    if (*MEMORY[0x263EF8360])
    {
      uint64_t v3 = *(void *)(a1 + 24);
      if (v3) {
        ((void (*)(uint64_t, void, uint64_t, void, void, void))*MEMORY[0x263EF8360])(32, *MEMORY[0x263EF8960], v3, *(void *)(a1 + 40), 0, 0);
      }
    }
    if (IOConnectTrap1(*(_DWORD *)(*(void *)(a1 + 16) + 20), 1u, v2) == -536870187) {
      ioGPUResourceFinalize_cold_1();
    }
    *(_DWORD *)(a1 + 48) = 0;
    *(void *)(a1 + 72) = 0;
  }
  uint64_t v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 16) = 0;
  }
}

__n128 IOGPUMetalCommandBufferStorageAllocResourceAtIndex(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 792) <= a2) {
    IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_3();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 784) + 8 * a2);
  if (!v4) {
    IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 768);
  uint64_t v6 = v5 + ((unint64_t)a2 << 6);
  uint64_t v9 = *(void *)(v6 + 32);
  int v7 = (__n128 **)(v6 + 32);
  uint64_t v8 = v9;
  if (v9)
  {
    unint64_t v10 = *(void *)(a1 + 744);
    unint64_t v11 = *(void *)(a1 + 752);
    if (v10 >= v11)
    {
      uint64_t v13 = 2 * v11;
      if (!v11) {
        uint64_t v13 = 32;
      }
      *(void *)(a1 + 752) = v13;
      uint64_t v12 = malloc_type_realloc(*(void **)(a1 + 760), 8 * v13, 0x80040B8603338uLL);
      *(void *)(a1 + 760) = v12;
      unint64_t v10 = *(void *)(a1 + 744);
    }
    else
    {
      uint64_t v12 = *(void **)(a1 + 760);
    }
    *(void *)(a1 + 744) = v10 + 1;
    v12[v10] = v8;
    uint64_t v4 = *(void *)(*(void *)(a1 + 784) + 8 * a2);
  }
  PooledResource = (__n128 *)IOGPUMetalResourcePoolCreatePooledResource(v4);
  if (!PooledResource)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_2(a2);
    }
    abort();
  }
  uint64_t v15 = PooledResource;
  if (MTLValidationEnabled()) {
    -[__n128 setLabel:](v15, "setLabel:", objc_msgSend(NSString, "stringWithFormat:", @"IOGPUMetalResourcePool (dbclass: %d)", a2));
  }
  uint64_t v16 = v5 + ((unint64_t)a2 << 6);
  *int v7 = v15;
  unint64_t v17 = v15[10].n128_u64[0];
  *(void *)(v16 + 8) = v17;
  *(void *)(v16 + 24) = v17;
  *(void *)(v16 + 16) = (v15[4].n128_u64[1] & 0xFFFFFFFFFFFFFFLL) + v17;
  *(void *)uint64_t v16 = v15[6].n128_u64[1];
  __n128 result = v15[4];
  *(void *)(v16 + 56) = v15[5].n128_u64[0];
  *(__n128 *)(v16 + 40) = result;
  return result;
}

void *IOGPUMetalResourcePoolCreatePooledResource(uint64_t a1)
{
  uintptr_t v2 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  int v3 = *(_DWORD *)(a1 + 88);
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4)
  {
    uint64_t v6 = v4[37];
    uint64_t v5 = (void *)v4[38];
    if (v6)
    {
      *(void *)(v6 + 304) = v5;
      uint64_t v7 = v4[37];
      uint64_t v5 = (void *)v4[38];
    }
    else
    {
      uint64_t v7 = 0;
      *(void *)(a1 + 32) = v5;
    }
    *uint64_t v5 = v7;
LABEL_13:
    uint64_t v12 = v4 + 36;
    --*(_DWORD *)(a1 + 44);
    goto LABEL_14;
  }
  uint64_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    uint64_t v9 = v4[37];
    uint64_t v8 = (void *)v4[38];
    if (v9)
    {
      *(void *)(v9 + 304) = v8;
      uint64_t v10 = v4[37];
      uint64_t v8 = (void *)v4[38];
    }
    else
    {
      uint64_t v10 = 0;
      *(void *)(a1 + 16) = v8;
    }
    *uint64_t v8 = v10;
    [v4 setPurgeableState:2];
    goto LABEL_13;
  }
  unint64_t v11 = (void *)[objc_alloc(*(Class *)(a1 + 48)) initWithDevice:*(void *)(a1 + 56) options:0 args:*(void *)(a1 + 64) argsSize:*(unsigned int *)(a1 + 72)];
  uint64_t v4 = v11;
  if (v11)
  {
    [v11 setLabel:@"IOGPUMetalResourcePool"];
    uint64_t v12 = v4 + 36;
LABEL_14:
    *uint64_t v12 = a1;
    *((_DWORD *)v12 + 8) = v3;
    id v13 = (id)a1;
  }
  os_unfair_lock_unlock(v2);
  return v4;
}

uint64_t IOGPUResourceSetPurgeable(uint64_t a1, uintptr_t p2, _DWORD *a3)
{
  uint64_t v5 = 0;
  uint64_t result = IOConnectTrap3(*(_DWORD *)(*(void *)(a1 + 16) + 20), 3u, *(unsigned int *)(a1 + 48), p2, (uintptr_t)&v5);
  if (a3) {
    *a3 = v5;
  }
  return result;
}

uint64_t IOGPUDeviceGetAllocatedSize(uint64_t a1, uint64_t *output)
{
  uintptr_t v2 = *(uint64_t **)(a1 + 104);
  if (v2)
  {
    uint64_t result = 0;
    *output = *v2;
  }
  else
  {
    uint32_t outputCnt = 1;
    *output = 0;
    return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0x18u, 0, 0, output, &outputCnt);
  }
  return result;
}

uint64_t IOGPUResourceGetGPUVirtualAddress(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

void *IOGPUResourceGetClientShared(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (IOGPUResourceGetTypeID_onceToken != -1) {
      dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
    }
    if (v2 == kIOGPUResourceID) {
      return (void *)v1[9];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOGPUResourceCreate(mach_port_t *a1, void *a2, size_t a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  size_t v6 = a1[13];
  v14[0] = v6 + 80;
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = (char *)v14 - ((v6 + 95) & 0x1FFFFFFF0);
  if (IOGPUResourceGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    bzero((char *)v14 - ((v6 + 95) & 0x1FFFFFFF0), v6 + 80);
    CFRetain(a1);
    *(void *)(Instance + 16) = a1;
    *(void *)(Instance + 72) = 0;
    *(_DWORD *)(Instance + 48) = 0;
    if (IOConnectCallMethod(a1[5], 9u, 0, 0, a2, a3, 0, 0, (char *)v14 - ((v6 + 95) & 0x1FFFFFFF0), v14))
    {
      CFRelease((CFTypeRef)Instance);
      return 0;
    }
    else
    {
      uint64_t v10 = (void *)*((void *)v7 + 1);
      *(void *)(Instance + 24) = v10;
      *(void *)(Instance + 40) = *((void *)v7 + 4);
      *(_DWORD *)(Instance + 48) = *((_DWORD *)v7 + 7);
      int v11 = *(_DWORD *)a2;
      *(_DWORD *)(Instance + 52) = *(_DWORD *)a2;
      if ((v11 & 0xF) != 0) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = a2[9];
      }
      *(void *)(Instance + 32) = v12;
      *(void *)(Instance + 56) = *(void *)v7;
      uint64_t v13 = *((void *)v7 + 2);
      *(void *)(Instance + 64) = *((void *)v7 + 9);
      *(void *)(Instance + 72) = v13;
      memcpy((void *)(Instance + 112), v7 + 80, v6);
      *(_OWORD *)(Instance + 88) = *((_OWORD *)v7 + 3);
      *(void *)(Instance + 104) = *((void *)v7 + 8);
      if ((*((unsigned char *)a2 + 20) & 0x40) != 0 && !v11 && (*((_DWORD *)v7 + 6) & 1) != 0 && v10) {
        bzero(v10, a2[9]);
      }
      *(void *)(Instance + 80) = *((void *)v7 + 5);
      if (*MEMORY[0x263EF8360] && *(void *)(Instance + 24) && !a2[8]) {
        ((void (*)(uint64_t, void, void, void))*MEMORY[0x263EF8360])(1677721616, *MEMORY[0x263EF8960], *(void *)(Instance + 40), 0);
      }
    }
  }
  return Instance;
}

uint64_t IOGPUResourceGetResidentDataSize(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t IOGPUResourceGetGlobalTraceObjectID(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t IOGPUResourceCreateAllocationIdentifierSet(uint64_t result, void *a2, void *a3)
{
  *a2 = *(void *)(result + 88);
  *a3 = *(void *)(result + 96);
  return result;
}

void IOGPUResourceRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void *IOGPUResourceGetDataBytes(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (IOGPUResourceGetTypeID_onceToken != -1) {
      dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
    }
    if (v2 == kIOGPUResourceID) {
      return (void *)v1[3];
    }
    else {
      return 0;
    }
  }
  return result;
}

void IOGPUMetalSuballocatorFree(uint64_t a1, uint64_t a2)
{
  if (!a1 || !a2) {
    IOGPUMetalSuballocatorFree_cold_1();
  }
  if ((unint64_t)(*(void *)a2 - 1) >= 0x20000) {
    IOGPUMetalSuballocatorFree_cold_5();
  }
  if (*(void *)(a2 + 8) + *(void *)a2 > 0x20000uLL) {
    IOGPUMetalSuballocatorFree_cold_2();
  }
  unint64_t v3 = *(unsigned __int16 *)(a2 + 18);
  if (v3 >= 0x20) {
    IOGPUMetalSuballocatorFree_cold_4();
  }
  if (*(unsigned __int16 *)(a2 + 16) >= 0x400u) {
    IOGPUMetalSuballocatorFree_cold_3();
  }
  uint64_t v5 = (os_unfair_lock_s *)(a1 + 88 * *(unsigned __int16 *)(a2 + 18));
  size_t v6 = v5 + 20;
  os_unfair_lock_lock(v5 + 20);
  uint64_t v7 = *(__int16 *)(a2 + 16);
  uint64_t v8 = *(void *)&v5->_os_unfair_lock_opaque;
  uint64_t v9 = *(void *)&v5->_os_unfair_lock_opaque + (v7 << 6);
  uint64_t v10 = (_DWORD *)(v9 + 48);
  if (!*(_DWORD *)(v9 + 48)) {
    __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 432, "buffer.isAlive() && \"Reference to dead buffer\"");
  }
  [*(id *)v9 gpuAddress];
  MTLRangeAllocatorDeallocate();
  --*v10;
  unsigned int MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize();
  unsigned int v12 = MaxFreeSize;
  uint64_t v13 = v8 + (v7 << 6);
  unsigned int v16 = *(_DWORD *)(v13 + 56);
  uint64_t v15 = (unsigned int *)(v13 + 56);
  unsigned int v14 = v16;
  if (v16 > MaxFreeSize)
  {
    v49 = "buffer.freeSize <= newFreeSize && \"Buffer cannot have less space as a result of deallocation\"";
    int v50 = 442;
    goto LABEL_68;
  }
  uint64_t v17 = MaxFreeSize;
  if (MaxFreeSize > 0x20000uLL)
  {
    v49 = "newFreeSize <= kBufferSize && \"Unexpected free size\"";
    int v50 = 443;
    goto LABEL_68;
  }
  BOOL v18 = v14 != MaxFreeSize || *v10 == 0;
  if (!v18) {
    goto LABEL_58;
  }
  uint64_t v19 = a1 + 88 * v3;
  uint64_t v22 = *(void *)(v19 + 56);
  uint64_t v20 = (uint64_t *)(v19 + 56);
  uint64_t v21 = v22;
  if (!v22) {
    goto LABEL_26;
  }
  uint64_t v23 = (uint64_t **)(v20 - 1);
  uint64_t v24 = v20;
  do
  {
    unsigned int v25 = *(_DWORD *)(v21 + 28);
    BOOL v26 = v25 >= v14;
    if (v25 >= v14) {
      v27 = (uint64_t *)v21;
    }
    else {
      v27 = (uint64_t *)(v21 + 8);
    }
    if (v26) {
      uint64_t v24 = (uint64_t *)v21;
    }
    uint64_t v21 = *v27;
  }
  while (*v27);
  if (v24 == v20 || v14 < *((_DWORD *)v24 + 7)) {
LABEL_26:
  }
    __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 449, "it != heap.index.end() && \"Buffer index corrupt: buffer not found at expected size\"");
  int v28 = *(unsigned __int16 *)(a2 + 16);
  if (*((unsigned __int16 *)v24 + 16) == v28)
  {
    v29 = v24;
  }
  else
  {
    do
    {
      if (*((_DWORD *)v24 + 7) != v14) {
        __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 452, "it->first == buffer.freeSize");
      }
      v30 = (uint64_t *)v24[1];
      if (v30)
      {
        do
        {
          v29 = v30;
          v30 = (uint64_t *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v29 = (uint64_t *)v24[2];
          BOOL v18 = *v29 == (void)v24;
          uint64_t v24 = v29;
        }
        while (!v18);
      }
      uint64_t v24 = v29;
    }
    while (*((unsigned __int16 *)v29 + 16) != v28);
  }
  v51 = v23;
  std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer(v23, v29);
  free(v29);
  if (*v10)
  {
    size_t v6 = v5 + 20;
    if (*v15 != v12)
    {
      *uint64_t v15 = v12;
      unint64_t v52 = v17 | ((unint64_t)*(unsigned __int16 *)(a2 + 16) << 32);
      std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(v51, (unsigned int *)&v52);
    }
    goto LABEL_58;
  }
  size_t v6 = v5 + 20;
  if (v12 != 0x20000)
  {
    v49 = "newFreeSize == kBufferSize && \"Allocator state not empty with no allocations left\"";
    int v50 = 460;
LABEL_68:
    __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", v50, v49);
  }
  MTLRangeAllocatorDestroy();

  uint64_t v31 = a1 + 88 * v3;
  unint64_t v34 = *(void *)(v31 + 40);
  v33 = (char **)(v31 + 40);
  unint64_t v32 = v34;
  v36 = v33 - 1;
  v35 = *(v33 - 1);
  if ((unint64_t)v35 >= v34)
  {
    v38 = (void **)(v33 - 2);
    v39 = *(v33 - 2);
    uint64_t v40 = v35 - v39;
    if (v35 - v39 <= -3) {
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v41 = v40 >> 1;
    unint64_t v42 = v32 - (void)v39;
    if (v42 <= (v40 >> 1) + 1) {
      unint64_t v43 = v41 + 1;
    }
    else {
      unint64_t v43 = v42;
    }
    if (v42 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v44 = v43;
    }
    if (v44)
    {
      v45 = (char *)IOGPUMetalSuballocatorHeap::Allocator<short>::allocate((uint64_t)v33, v44);
      v35 = *v36;
      v39 = (char *)*v38;
    }
    else
    {
      v45 = 0;
    }
    v46 = &v45[2 * v41];
    v47 = &v45[2 * v44];
    *(_WORD *)v46 = *(_WORD *)(a2 + 16);
    v37 = v46 + 2;
    while (v35 != v39)
    {
      __int16 v48 = *((_WORD *)v35 - 1);
      v35 -= 2;
      *((_WORD *)v46 - 1) = v48;
      v46 -= 2;
    }
    *v38 = v46;
    *v36 = v37;
    *v33 = v47;
    if (v39) {
      free(v39);
    }
  }
  else
  {
    *(_WORD *)v35 = *(_WORD *)(a2 + 16);
    v37 = v35 + 2;
  }
  *v36 = v37;
LABEL_58:
  os_unfair_lock_unlock(v6);
}

void sub_21C71042C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id IOGPUMetalSuballocatorAllocate(uint64_t a1, uint64_t *a2, unint64_t a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  if (!a1 || !a2 || !a4) {
    IOGPUMetalSuballocatorAllocate_cold_1();
  }
  unint64_t v11 = *a4;
  unint64_t v12 = *a4 >> 4;
  uint64_t v13 = (*a4 >> 8) & 3;
  if (v13 == 2)
  {
    LODWORD(v13) = 0;
    *a4 = v11 & 0xFFFFFFFFFFFFFDFFLL;
  }
  BOOL v14 = v12 <= 2 && ((v13 | v11) & 0xE) == 0;
  unsigned int v15 = (v11 >> 14) & 0x10 | (4 * (v11 & 0xF)) | (8 * v13) | v12;
  if (v14) {
    unsigned int v16 = v15;
  }
  else {
    unsigned int v16 = 0xFFFF;
  }
  *((_WORD *)a2 + 9) = v16;
  if ((unint64_t)*a2 > 0x20000) {
    return 0;
  }
  id v17 = 0;
  if (a3 <= 0x20000 && *a2 && (v16 & 0x8000) == 0)
  {
    uint64_t v18 = 256;
    if (a3 > 0x100) {
      uint64_t v18 = a3;
    }
    uint64_t v136 = v18;
    uint64_t v19 = (char **)(a1 + 88 * v16);
    lock = (os_unfair_lock_s *)(v19 + 10);
    os_unfair_lock_lock((os_unfair_lock_t)v19 + 20);
    uint64_t v20 = v19[9];
    unint64_t v21 = *a4;
    if (v20 == (char *)-1)
    {
      v19[9] = (char *)v21;
    }
    else if (v20 != (char *)v21)
    {
      __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 191, "false && \"Different MTLResourceOptions used for the same heap index, this is not supported\"");
    }
    v130 = a4;
    v131 = v19 + 9;
    uint64_t v132 = a1;
    uint64_t v133 = a6;
    uint64_t v137 = *a2;
    v138 = a2;
    uint64_t v22 = a5;
    unsigned int v135 = v16;
    if (a5)
    {
      uint64_t v23 = *v19;
      if (v19[1] != *v19)
      {
        uint64_t v24 = 0;
        unsigned __int16 v25 = 0;
        while (1)
        {
          BOOL v26 = &v23[64 * v24];
          if ([*(id *)v26 gpuAddress] == a5)
          {
            [*(id *)v26 gpuAddress];
            if (MTLRangeAllocatorAllocateRange()) {
              break;
            }
          }
          uint64_t v24 = (__int16)++v25;
          uint64_t v23 = *v19;
          if ((__int16)v25 >= (unint64_t)((v19[1] - *v19) >> 6)) {
            goto LABEL_52;
          }
        }
        unsigned int MaxFreeSize = MTLRangeAllocatorGetMaxFreeSize();
        v57 = &v23[64 * v24];
        unsigned int v58 = *((_DWORD *)v57 + 14);
        BOOL v59 = v58 > MaxFreeSize;
        int v60 = v137;
        if (v58 != MaxFreeSize)
        {
          if (!v59) {
            __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 215, "newFreeSize < buffer.freeSize && \"Buffer cannot have more space as a result of allocation\"");
          }
          uint64_t v61 = a1 + 88 * v135;
          uint64_t v64 = *(void *)(v61 + 56);
          v62 = (uint64_t *)(v61 + 56);
          uint64_t v63 = v64;
          v65 = (uint64_t **)(v62 - 1);
          if (v64)
          {
            v66 = v62;
            do
            {
              unsigned int v67 = *(_DWORD *)(v63 + 28);
              BOOL v68 = v67 >= v137;
              if (v67 >= v137) {
                v69 = (uint64_t *)v63;
              }
              else {
                v69 = (uint64_t *)(v63 + 8);
              }
              if (v68) {
                v66 = (uint64_t *)v63;
              }
              uint64_t v63 = *v69;
            }
            while (*v69);
            if (v66 != v62)
            {
              while (*((unsigned __int16 *)v66 + 16) != v25)
              {
                v70 = (uint64_t *)v66[1];
                if (v70)
                {
                  do
                  {
                    v71 = v70;
                    v70 = (uint64_t *)*v70;
                  }
                  while (v70);
                }
                else
                {
                  do
                  {
                    v71 = (uint64_t *)v66[2];
                    BOOL v14 = *v71 == (void)v66;
                    v66 = v71;
                  }
                  while (!v14);
                }
                v66 = v71;
                if (v71 == v62) {
                  goto LABEL_138;
                }
              }
              std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer((uint64_t **)v62 - 1, v66);
              free(v66);
            }
          }
LABEL_138:
          *((_DWORD *)v57 + 14) = MaxFreeSize;
          unint64_t v141 = MaxFreeSize | ((unint64_t)v25 << 32);
          std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(v65, (unsigned int *)&v141);
          int v60 = v137;
        }
        unint64_t v117 = a2[1];
        unsigned int v120 = *((_DWORD *)v57 + 13);
        v119 = (unsigned int *)(v57 + 52);
        unsigned int v118 = v120;
        if (v117 >= v120) {
          *v130 |= 0x10000uLL;
        }
        unsigned int v121 = v117 + v60;
        if (v118 > v121) {
          unsigned int v121 = v118;
        }
        unsigned int *v119 = v121;
        ++*(_DWORD *)&v23[64 * v24 + 48];
        *((_WORD *)a2 + 8) = v25;
LABEL_144:
        id v17 = *(id *)v26;
        goto LABEL_145;
      }
    }
    else
    {
      uint64_t v27 = a1 + 88 * v16;
      uint64_t v30 = *(void *)(v27 + 56);
      v29 = (uint64_t *)(v27 + 56);
      uint64_t v28 = v30;
      if (v30)
      {
        v129 = (uint64_t **)(v29 - 1);
        uint64_t v31 = v29;
        do
        {
          unsigned int v32 = *(_DWORD *)(v28 + 28);
          BOOL v33 = v32 >= v137;
          if (v32 >= v137) {
            unint64_t v34 = (uint64_t *)v28;
          }
          else {
            unint64_t v34 = (uint64_t *)(v28 + 8);
          }
          if (v33) {
            uint64_t v31 = (uint64_t *)v28;
          }
          uint64_t v28 = *v34;
        }
        while (*v34);
        if (v31 != v29)
        {
          while (1)
          {
            unint64_t v35 = *((__int16 *)v31 + 16);
            v36 = *v19;
            if (v35 >= (v19[1] - *v19) >> 6) {
              __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 253, "bufferIndex < heap.buffers.size()");
            }
            v37 = &v36[64 * v35];
            v38 = v37 + 48;
            if (!*((_DWORD *)v37 + 12))
            {
              int v123 = 255;
              v124 = "buffer.isAlive() && \"Buffer index corrupt: refers to dead item\"";
              goto LABEL_152;
            }
            int v40 = *((_DWORD *)v37 + 14);
            v39 = (unsigned int *)(v37 + 56);
            if (MTLRangeAllocatorGetMaxFreeSize() != v40) {
              break;
            }
            if (*v39 < v137)
            {
              int v123 = 257;
              v124 = "buffer.freeSize >= bytes && \"Bad primary buffer selected\"";
LABEL_152:
              __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", v123, v124);
            }
            unint64_t v141 = 0;
            uint64_t v22 = 0;
            if (MTLRangeAllocatorAllocate())
            {
              unsigned int v76 = MTLRangeAllocatorGetMaxFreeSize();
              unsigned int v77 = v76;
              if (*v39 != v76)
              {
                if (*v39 <= v76) {
                  __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 271, "newFreeSize < buffer.freeSize && \"Buffer cannot have more space as a result of allocation\"");
                }
                std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer(v129, v31);
                free(v31);
                unsigned int *v39 = v77;
                unint64_t v140 = v77 | ((unint64_t)(unsigned __int16)v35 << 32);
                std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(v129, (unsigned int *)&v140);
              }
              BOOL v26 = &v36[64 * v35];
              int v78 = v141;
              unsigned int v79 = v78 - objc_msgSend(*(id *)v26, "gpuAddress", v129);
              uint64_t v80 = v79;
              unsigned int v81 = *((_DWORD *)v26 + 13);
              if (v79 >= (unint64_t)v81) {
                *v130 |= 0x10000uLL;
              }
              unsigned int v82 = v79 + v137;
              if (v81 > v82) {
                unsigned int v82 = v81;
              }
              *((_DWORD *)v26 + 13) = v82;
              ++*v38;
              *((_WORD *)v138 + 8) = v35;
              v138[1] = v80;
              goto LABEL_144;
            }
            if (a3 <= 0x100) {
              __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 301, "align > kMinAlignment && \"Buffer index corrupt: expected index to be suitable\"");
            }
            uint64_t v41 = (uint64_t *)v31[1];
            if (v41)
            {
              do
              {
                unint64_t v42 = v41;
                uint64_t v41 = (uint64_t *)*v41;
              }
              while (v41);
            }
            else
            {
              do
              {
                unint64_t v42 = (uint64_t *)v31[2];
                BOOL v14 = *v42 == (void)v31;
                uint64_t v31 = v42;
              }
              while (!v14);
            }
            uint64_t v31 = v42;
            if (v42 == v29) {
              goto LABEL_52;
            }
          }
          int v123 = 256;
          v124 = "buffer.freeSize == MTLRangeAllocatorGetMaxFreeSize(&buffer.allocator, kMinAlignment) && \"Buffer index "
                 "corrupt: allocator state doesn't match\"";
          goto LABEL_152;
        }
      }
    }
LABEL_52:
    uint64_t v43 = v132 + 88 * v135;
    uint64_t v45 = *(void *)(v43 + 24);
    uint64_t v44 = v43 + 24;
    uint64_t v46 = *(void *)(v44 + 8);
    if (v45 == v46)
    {
      unint64_t v52 = *v19;
      v51 = v19[1];
      uint64_t v53 = v51 - *v19;
      if ((unint64_t)v53 > 0xFFC0)
      {
        id v17 = 0;
LABEL_145:
        os_unfair_lock_unlock(lock);
        return v17;
      }
      if (v52 == v51)
      {
        std::vector<IOGPUMetalSuballocatorHeap::Buffer,IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>>::reserve((void **)v19, 0x80uLL);
        std::vector<short,IOGPUMetalSuballocatorHeap::Allocator<short>>::reserve((void **)v44, 0x80uLL);
        unint64_t v52 = *v19;
        v51 = v19[1];
        uint64_t v53 = v51 - *v19;
      }
      uint64_t v50 = v53 >> 6;
      unint64_t v54 = (unint64_t)v19[2];
      if ((unint64_t)v51 >= v54)
      {
        unint64_t v72 = v50 + 1;
        if ((unint64_t)(v50 + 1) >> 58) {
          std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v73 = v54 - (void)v52;
        if (v73 >> 5 > v72) {
          unint64_t v72 = v73 >> 5;
        }
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFC0) {
          uint64_t v74 = 0x3FFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v74 = v72;
        }
        if (v74) {
          v75 = (char *)IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>::allocate((uint64_t)(v19 + 2), v74);
        }
        else {
          v75 = 0;
        }
        v83 = &v75[64 * v50];
        v84 = &v75[64 * v74];
        *((_OWORD *)v83 + 2) = 0u;
        *((_OWORD *)v83 + 3) = 0u;
        *(_OWORD *)v83 = 0u;
        *((_OWORD *)v83 + 1) = 0u;
        v55 = v83 + 64;
        v86 = *v19;
        v85 = v19[1];
        if (v85 != *v19)
        {
          do
          {
            long long v88 = *((_OWORD *)v85 - 2);
            long long v87 = *((_OWORD *)v85 - 1);
            *((_OWORD *)v83 - 3) = *((_OWORD *)v85 - 3);
            *((_OWORD *)v83 - 2) = v88;
            *((_OWORD *)v83 - 1) = v87;
            *((_OWORD *)v83 - 4) = *((_OWORD *)v85 - 4);
            v83 -= 64;
            v85 -= 64;
          }
          while (v85 != v86);
          v85 = *v19;
        }
        *uint64_t v19 = v83;
        v19[1] = v55;
        v19[2] = v84;
        if (v85) {
          free(v85);
        }
      }
      else
      {
        *((_OWORD *)v51 + 2) = 0u;
        *((_OWORD *)v51 + 3) = 0u;
        *(_OWORD *)v51 = 0u;
        *((_OWORD *)v51 + 1) = 0u;
        v55 = v51 + 64;
      }
      v49 = (_WORD **)(v44 + 8);
      v19[1] = v55;
      *((_DWORD *)v55 - 4) = 0;
      __int16 v48 = *v19;
      unint64_t v47 = (__int16)v50;
    }
    else
    {
      unint64_t v47 = *(__int16 *)(v46 - 2);
      *(void *)(v44 + 8) = v46 - 2;
      if (v47 >= (v19[1] - *v19) >> 6) {
        __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 330, "bufferIndex < heap.buffers.size()");
      }
      __int16 v48 = *v19;
      v49 = (_WORD **)(v44 + 8);
      LOWORD(v50) = v47;
    }
    v89 = &v48[64 * v47];
    v90 = v89 + 48;
    if (*((_DWORD *)v89 + 12)) {
      __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", 333, "!buffer.isAlive() && \"Alive buffer found in dead slots\"");
    }
    if (v22)
    {
      v91 = objc_opt_new();
      [v91 setPinnedGPUAddress:v22];
      [v91 setLength:v133];
      [v91 setResourceOptions:*v131];
      *(void *)v89 = [*(id *)(v132 + 2816) newBufferWithDescriptor:v91];

      if (*(void *)v89)
      {
        unsigned __int16 v92 = v50;
        [*(id *)v89 gpuAddress];
        MTLRangeAllocatorInitWithStartRange();
        [*(id *)v89 gpuAddress];
        if (MTLRangeAllocatorAllocateRange())
        {
          *((_WORD *)v138 + 8) = v50;
          _DWORD *v90 = 1;
          unsigned int v93 = *((_DWORD *)v138 + 2);
          unsigned int v94 = v133 - ((v137 + 255) & 0xFFFFFF00) - v93;
          if (v93 > v94) {
            unsigned int v94 = *((_DWORD *)v138 + 2);
          }
          v95 = &v48[64 * v47];
          *((_DWORD *)v95 + 14) = v94;
          uint64_t v96 = MTLRangeAllocatorGetMaxFreeSize();
          if (v96 == *((_DWORD *)v95 + 14))
          {
            unint64_t v141 = v96 | ((unint64_t)v92 << 32);
            std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>((uint64_t **)(v132 + 88 * v135 + 48), (unsigned int *)&v141);
            *v130 |= 0x10000uLL;
            *(_DWORD *)&v48[64 * v47 + 52] = *((_DWORD *)v138 + 2) + v137;
LABEL_118:
            id v17 = *(id *)v89;
            goto LABEL_145;
          }
          v125 = "MTLRangeAllocatorGetMaxFreeSize(&buffer.allocator, kMinAlignment) == buffer.freeSize && \"Bad initial f"
                 "ree size computed\"";
          int v126 = 363;
        }
        else
        {
          v125 = "false && \"Failed to suballocate from fresh block\"";
          int v126 = 356;
        }
        __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", v126, v125);
      }
    }
    else
    {
      v97 = objc_opt_new();
      [v97 setLength:0x20000];
      [v97 setResourceOptions:*v131];
      [v97 setAlignment:v136];
      *(void *)v89 = [*(id *)(v132 + 2816) newBufferWithDescriptor:v97];

      if (*(void *)v89)
      {
        [*(id *)v89 gpuAddress];
        MTLRangeAllocatorInitWithStartRange();
        [*(id *)v89 gpuAddress];
        if (MTLRangeAllocatorAllocateRange())
        {
          v138[1] = 0;
          *((_WORD *)v138 + 8) = v50;
          _DWORD *v90 = 1;
          unsigned int v98 = MTLRangeAllocatorGetMaxFreeSize();
          *(_DWORD *)&v48[64 * v47 + 56] = v98;
          if (0x20000 - ((v137 + 255) & 0x1FFFFFF00) == v98)
          {
            unint64_t v141 = v98 | ((unint64_t)(unsigned __int16)v50 << 32);
            std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>((uint64_t **)(v132 + 88 * v135 + 48), (unsigned int *)&v141);
            *v130 |= 0x10000uLL;
            *(_DWORD *)&v48[64 * v47 + 52] = v137;
            goto LABEL_118;
          }
          v127 = "kBufferSize - ((bytes + kMinAlignment - 1) & ~(kMinAlignment - 1)) == buffer.freeSize && \"Bad initial "
                 "free size computed\"";
          int v128 = 405;
        }
        else
        {
          v127 = "false && \"Failed to suballocate from fresh block\"";
          int v128 = 397;
        }
        __assert_rtn("IOGPUMetalSuballocatorAllocate", "IOGPUMetalSuballocator.mm", v128, v127);
      }
    }
    v99 = v49;
    v100 = *v49;
    uint64_t v101 = v132 + 88 * v135;
    unint64_t v104 = *(void *)(v101 + 40);
    v103 = (char **)(v101 + 40);
    unint64_t v102 = v104;
    if ((unint64_t)*v49 >= v104)
    {
      v106 = *(_WORD **)v44;
      uint64_t v107 = (uint64_t)v100 - *(void *)v44;
      if (v107 <= -3) {
        std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
      }
      __int16 v108 = v50;
      uint64_t v109 = v107 >> 1;
      unint64_t v110 = v102 - (void)v106;
      if (v110 <= (v107 >> 1) + 1) {
        unint64_t v111 = v109 + 1;
      }
      else {
        unint64_t v111 = v110;
      }
      if (v110 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v112 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v112 = v111;
      }
      if (v112)
      {
        v113 = (char *)IOGPUMetalSuballocatorHeap::Allocator<short>::allocate((uint64_t)v103, v112);
        v100 = *v99;
        v106 = *(_WORD **)v44;
      }
      else
      {
        v113 = 0;
      }
      v114 = &v113[2 * v109];
      v115 = &v113[2 * v112];
      *(_WORD *)v114 = v108;
      v105 = v114 + 2;
      while (v100 != v106)
      {
        __int16 v116 = *--v100;
        *((_WORD *)v114 - 1) = v116;
        v114 -= 2;
      }
      *(void *)uint64_t v44 = v114;
      *v99 = v105;
      *v103 = v115;
      if (v106) {
        free(v106);
      }
    }
    else
    {
      _WORD *v100 = v50;
      v105 = v100 + 1;
    }
    id v17 = 0;
    *v99 = v105;
    goto LABEL_145;
  }
  return v17;
}

void sub_21C710F98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock)
{
}

_DWORD *std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__emplace_multi<std::pair<unsigned int,short>>(uint64_t **a1, unsigned int *a2)
{
  uint64_t v4 = a1 + 1;
  uint64_t v5 = IOGPUMetalSuballocatorHeap::Allocator<std::__tree_node<std::__value_type<unsigned int,short>,void *>>::allocate((uint64_t)(a1 + 1), 1);
  unsigned int v6 = *a2;
  v5[7] = *a2;
  *((_WORD *)v5 + 16) = *((_WORD *)a2 + 2);
  uint64_t v7 = a1[1];
  if (v7)
  {
    do
    {
      while (1)
      {
        uint64_t v4 = (uint64_t **)v7;
        if (v6 >= *((_DWORD *)v7 + 7)) {
          break;
        }
        uint64_t v7 = (uint64_t *)*v7;
        uint64_t v8 = v4;
        if (!*v4) {
          goto LABEL_8;
        }
      }
      uint64_t v7 = (uint64_t *)v7[1];
    }
    while (v7);
    uint64_t v8 = v4 + 1;
  }
  else
  {
    uint64_t v8 = v4;
  }
LABEL_8:
  std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__insert_node_at(a1, (uint64_t)v4, v8, (uint64_t *)v5);
  return v5;
}

uint64_t *std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
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
      CFTypeID v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
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
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            CFTypeID v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *CFTypeID v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        CFTypeID v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *CFTypeID v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *IOGPUMetalSuballocatorHeap::Allocator<std::__tree_node<std::__value_type<unsigned int,short>,void *>>::allocate(uint64_t a1, uint64_t a2)
{
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 40 * a2, 0x102004081A36325uLL)) {
    return 0;
  }
  else {
    return memptr;
  }
}

uint64_t *std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  CFTypeID v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      CFTypeID v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  int v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *int v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *unint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    unsigned int v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      unsigned int v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        unsigned int v16 = v7;
      }
      else
      {
        unsigned int v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }
    unsigned int v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    id v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      id v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    id v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *uint64_t v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void std::vector<short,IOGPUMetalSuballocatorHeap::Allocator<short>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 1)
  {
    if ((a2 & 0x8000000000000000) != 0) {
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    }
    int64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v7 = (char *)IOGPUMetalSuballocatorHeap::Allocator<short>::allocate(v3, a2);
    int v8 = &v7[v6 & 0xFFFFFFFFFFFFFFFELL];
    uint64_t v9 = &v7[2 * a2];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v8;
    if (v11 != *a1)
    {
      uint64_t v12 = v8;
      do
      {
        __int16 v13 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v12 - 1) = v13;
        v12 -= 2;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v8;
    a1[2] = v9;
    if (v10)
    {
      free(v10);
    }
  }
}

void std::vector<IOGPUMetalSuballocatorHeap::Buffer,IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 6)
  {
    if (a2 >> 58) {
      std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
    }
    int64_t v6 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v7 = (char *)IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>::allocate(v3, a2);
    int v8 = &v7[v6 & 0xFFFFFFFFFFFFFFC0];
    uint64_t v9 = &v7[64 * a2];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v8;
    if (v10 != *a1)
    {
      do
      {
        long long v14 = *((_OWORD *)v10 - 2);
        long long v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 3) = *((_OWORD *)v10 - 3);
        *((_OWORD *)v12 - 2) = v14;
        *((_OWORD *)v12 - 1) = v13;
        *((_OWORD *)v12 - 4) = *((_OWORD *)v10 - 4);
        v12 -= 64;
        v10 -= 64;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v8;
    a1[2] = v9;
    if (v10)
    {
      free(v10);
    }
  }
}

void *IOGPUMetalSuballocatorHeap::Allocator<short>::allocate(uint64_t a1, uint64_t a2)
{
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 2 * a2, 0x1000040BDFB0063uLL)) {
    return 0;
  }
  else {
    return memptr;
  }
}

void *IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocatorHeap::Buffer>::allocate(uint64_t a1, uint64_t a2)
{
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 0x40uLL, a2 << 6, 0x10A0040958DC350uLL)) {
    return 0;
  }
  else {
    return memptr;
  }
}

uint64_t IOGPUMetalCommandBufferStorageBeginSegment(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!*(void *)(a1 + 120)) {
    _mtlIOGPUCommandBufferStorageBeginSegmentList(a1);
  }
  uint64_t v5 = *(void *)(a1 + 136);
  unint64_t v6 = *(void *)(a1 + 112);
  if (v5 + 2048 >= v6)
  {
    IOGPUMetalCommandBufferStorageGrowSegmentList(a1);
    unint64_t v6 = *(void *)(a1 + 112);
    uint64_t v5 = *(void *)(a1 + 136);
  }
  uint64_t v7 = *(_DWORD **)(a1 + 128);
  v7[6] = 0;
  v7[3] = 0;
  v7[4] = 0;
  v7[2] = a2 - v4;
  *(_OWORD *)(a1 + 848) = 0u;
  IOGPUResourceListReset(a1 + 144, (uint64_t)(v7 + 8), v6 - v5, 1);
  uint64_t result = [*(id *)(a1 + 776) globalTraceObjectID];
  **(void **)(a1 + 128) = result;
  return result;
}

void IOGPUResourceListReset(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a3 <= 0) {
    IOGPUResourceListReset_cold_1();
  }
  *(void *)(a1 + 512) = a2;
  *(_DWORD *)(a1 + 536) = (unint64_t)a3 >> 6;
  if (a2 + (a3 & 0x3FFFFFFFC0uLL) > *(void *)(*(void *)(a1 + 576) + 112)) {
    IOGPUResourceListReset_cold_2();
  }
  if (a4)
  {
    *(void *)(a1 + 520) = *(void *)(a1 + 528);
    *(void *)(a1 + 540) = 0;
    *(_DWORD *)(a1 + 504) = 0;
    *(_DWORD *)(a1 + 480) = 2048;
    *(_DWORD *)(a1 + 488) = 11;
    *(void *)(a1 + 496) = 31;
    bzero(*(void **)(a1 + 456), 0x2000uLL);
    uint64_t v5 = *(void **)(a1 + 464);
    size_t v6 = (unint64_t)*(unsigned int *)(a1 + 480) >> 3;
    bzero(v5, v6);
  }
}

uint64_t IOGPUDeviceTraceObjectLabel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = kdebug_trace_string();
  if (v6 != -1)
  {
    uint64_t v7 = v6;
    kdebug_trace();
    return v7;
  }
  return a5;
}

uint64_t IOGPUDeviceTraceEvent()
{
  return kdebug_trace();
}

uint64_t IOGPUDeviceGetNextGlobalTraceID(uint64_t a1)
{
  do
  {
    uint64_t v2 = *(void *)(a1 + 152);
    uint64_t v3 = *(void *)(a1 + 144);
    uint64_t v4 = v3;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 152), (unint64_t *)&v4, 0);
    if (v4 == v3)
    {
      size_t outputStructCnt = 16;
      uint64_t outputStruct = 0;
      uint64_t v11 = 0;
      if (IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, &outputStruct, &outputStructCnt))
      {
        *(void *)(a1 + 136) = 1;
        uint64_t v5 = 0x100000000;
        uint64_t v6 = 1;
      }
      else
      {
        uint64_t v6 = outputStruct;
        if (!outputStruct) {
          IOGPUDeviceGetNextGlobalTraceID_cold_1();
        }
        *(void *)(a1 + 136) = outputStruct;
        uint64_t v5 = v11;
      }
      *(void *)(a1 + 144) = v5;
      *(void *)(a1 + 152) = v6;
    }
    else
    {
      *(void *)(a1 + 144) = v4;
      while (!*(void *)(a1 + 152))
        ;
    }
    uint64_t result = v2 + 1;
    uint64_t v8 = v2;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(a1 + 152), (unint64_t *)&v8, v2 + 1);
  }
  while (v8 != v2);
  return result;
}

void _iogpuMetalCommandBufferStorageReleaseExtraResources(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 744);
  if (v1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = (unint64_t *)(a1 + 744);
    do
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 760) + 8 * v3);
      if (v5)
      {
        IOGPUMetalPooledResourceRelease(v5);
        unint64_t v1 = *v4;
      }
      ++v3;
    }
    while (v3 < v1);
    free(*(void **)(a1 + 760));
    *uint64_t v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
  }
}

void IOGPUMetalPooledResourceRelease(void *a1)
{
  uint64_t v2 = a1 + 36;
  unint64_t v3 = (char *)a1[36];
  if (v3)
  {
    uint64_t v9 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      IOGPUMetalPooledResourceRelease_cold_1();
    }
    *uint64_t v2 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)v9 + 10);
    if (*((_DWORD *)v2 + 8) == *((_DWORD *)v9 + 22))
    {
      uint64_t v5 = *((void *)v9 + 3);
      uint64_t v4 = v9 + 24;
      a1[37] = v5;
      uint64_t v6 = (void *)(v5 + 304);
      if (v5) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = v9 + 32;
      }
      *uint64_t v7 = a1 + 37;
      *uint64_t v4 = a1;
      a1[38] = v4;
      ++*((_DWORD *)v9 + 11);
      v2[3] = mach_absolute_time();
    }
    else
    {
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v9 + 10);
    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v8 = a1;
  }
}

uint64_t _mtlIOGPUCommandBufferStorageBeginSegmentList(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 832);
  if (v1 != -1)
  {
    if (v1 == 1)
    {
      uint64_t v3 = *(void *)(result + 816);
      unsigned int v4 = *(_DWORD *)(result + 824) + 1;
      *(_DWORD *)(v3 + 8) = v4;
      uint64_t v2 = (void *)(v3 + 8 * v4 + 16);
      *(void *)(result + 808) = v2;
      *(void *)(result + 816) = 0;
      goto LABEL_6;
    }
    uint64_t result = MTLReleaseAssertionFailure();
  }
  uint64_t v2 = *(void **)(result + 808);
LABEL_6:
  *(_DWORD *)(result + 832) = 0;
  *(void *)(result + 120) = v2;
  *uint64_t v2 = *(void *)(result + 800);
  v2[1] = 0;
  *(void *)(result + 128) = v2 + 2;
  *(void *)(result + 136) = v2 + 6;
  return result;
}

uint64_t IOGPUMetalCommandBufferStorageEndKernelCommands(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 816);
  int v3 = a2 - *(_DWORD *)(result + 40);
  uint64_t v4 = *(unsigned int *)(result + 824);
  *(_DWORD *)(result + 828) = v4 + 1;
  *(_DWORD *)(v2 + 8 * v4 + 20) = v3;
  return result;
}

void IOGPUMetalCommandBufferStorageFinalizeShmemHeader(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 808);
  if (*(void *)(a1 + 888))
  {
    uint64_t v3 = 0;
    char v4 = 1;
    do
    {
      char v5 = v4;
      uint64_t v6 = a1 + 8 * v3;
      uint64_t v7 = *(void **)(v6 + 896);
      if (v7 && [v7 count])
      {
        v14[0] = 0;
        v14[1] = v14;
        size_t v14[2] = 0x2020000000;
        v14[3] = *(void *)(a1 + 888);
        uint64_t v8 = *(void **)(v6 + 896);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __IOGPUMetalCommandBufferStorageFinalizeShmemHeader_block_invoke;
        v13[3] = &unk_26441A4E0;
        v13[4] = v14;
        [v8 enumerateObjectsUsingBlock:v13];
        _Block_object_dispose(v14, 8);
      }
      char v4 = 0;
      uint64_t v3 = 1;
    }
    while ((v5 & 1) != 0);
  }
  int v9 = *(_DWORD *)(a1 + 832);
  if (v9 == 1)
  {
    uint64_t v11 = *(void *)(a1 + 816);
    unsigned int v12 = *(_DWORD *)(a1 + 824) + 1;
    *(_DWORD *)(v11 + 8) = v12;
    *(void *)(a1 + 808) = v11 + 8 * v12 + 16;
    *(_DWORD *)(a1 + 832) = -1;
    *(void *)(a1 + 816) = 0;
    goto LABEL_13;
  }
  if (!v9) {
    goto LABEL_11;
  }
  if (*(void *)(a1 + 808) == *(void *)(a1 + 104))
  {
    _mtlIOGPUCommandBufferStorageBeginSegmentList(a1);
LABEL_11:
    uint64_t v10 = *(void *)(a1 + 128);
    *(_DWORD *)(*(void *)(a1 + 120) + 12) = v10 - *(void *)(a1 + 120);
    *(void *)(a1 + 808) = v10;
    *(_DWORD *)(a1 + 832) = -1;
    *(void *)(a1 + 120) = 0;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 848) = 0u;
  }
LABEL_13:
  *(_DWORD *)(v2 + 12) |= 0x80000000;
}

void sub_21C713B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IOGPUCommandQueueSubmitCommandBuffers(uint64_t a1, unsigned int a2, unsigned int a3, const void *a4, uintptr_t a5)
{
  input[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUCommandQueueID)
  {
    uint64_t v11 = *(dispatch_semaphore_t **)(a1 + 40);
    if (v11)
    {
      if (a4)
      {
        IOGPUNotificationQueueWillSubmit(v11, 2 * a3);
        if (a3 == 1 && a5 <= 0x40)
        {
          uint64_t v12 = IOConnectTrap3(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0, *(void *)(a1 + 24), a5, (uintptr_t)a4);
        }
        else
        {
          uint64_t v13 = *(void *)(a1 + 16);
          input[0] = *(void *)(a1 + 24);
          input[1] = a2;
          input[2] = a3;
          input[3] = a5;
          uint64_t v12 = IOConnectCallMethod(*(_DWORD *)(v13 + 20), 0x1Au, input, 4u, a4, a3 * a5, 0, 0, 0, 0);
        }
        uint64_t v5 = v12;
        if (v12) {
          IOGPUNotificationQueueDidSubmit(*(dispatch_semaphore_t **)(a1 + 40), 2 * a3);
        }
      }
    }
    else
    {
      return 3758096385;
    }
  }
  return v5;
}

dispatch_semaphore_t *IOGPUNotificationQueueWillSubmit(dispatch_semaphore_t *result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = (dispatch_semaphore_t *)CFGetTypeID(result);
    if (result == (dispatch_semaphore_t *)kIOGPUNotificationQueueID && a2 != 0)
    {
      do
      {
        uint64_t result = (dispatch_semaphore_t *)dispatch_semaphore_wait(v3[8], 0xFFFFFFFFFFFFFFFFLL);
        --a2;
      }
      while (a2);
    }
  }
  return result;
}

void IOGPUMetalCommandBufferStoragePoolPurge(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v3 = *(void **)a1;
  if (*(void *)a1)
  {
    do
    {
      uint64_t v5 = (void *)v3[2];
      char v4 = (void *)v3[3];
      if (v5)
      {
        v5[3] = v4;
        char v4 = (void *)v3[3];
      }
      else
      {
        *(void *)(a1 + 8) = v4;
      }
      *char v4 = v5;
      --*(_DWORD *)(a1 + 20);
      IOGPUMetalCommandBufferStorageDealloc(v3);
      uint64_t v3 = v5;
    }
    while (v5);
  }
  os_unfair_lock_unlock(v2);
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer(void *a1, int a2)
{
  uint64_t v2 = a1[4];
  if (!v2) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_1();
  }
  unint64_t v4 = a1[5];
  if (!v4 || (unint64_t v5 = a1[7]) == 0 || (v6 = a1[6]) == 0) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_2();
  }
  if (v5 < v4) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_3();
  }
  unsigned int v7 = v6 - v4;
  if (v6 < v4) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_4();
  }
  unsigned int v8 = a2 + 24 + v5 - v4;
  uint64_t v9 = *(void *)(v2 + 8);
  unsigned int v10 = *(_DWORD *)(v9 + 48);
  while (v10 < v8)
  {
    if (v10 >= 0x200000) {
      v10 += 0x100000;
    }
    else {
      v10 *= 2;
    }
  }
  objc_msgSend(*(id *)(v2 + 8), "setShmemSize:");
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(v9);
  a1[4] = Shmem;
  if (!Shmem)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_5((uint64_t)a1);
    }
    abort();
  }
  uint64_t v12 = a1[111];
  if (v12) {
    a1[111] = v12 - *(void *)(v2 + 136) + Shmem[17];
  }
  uint64_t v13 = *((unsigned int *)Shmem + 33);
  long long v14 = (char *)Shmem[17];
  a1[5] = v14;
  if (v13 < v8) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_6();
  }
  a1[7] = &v14[v13];
  unsigned int v15 = *(const void **)(v2 + 136);
  if (!v15) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_7();
  }
  if (v13 <= v7) {
    IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_8();
  }
  memcpy(v14, v15, v7);
  IOGPUMetalDeviceShmemRelease((os_unfair_lock_s *)v2);
  a1[6] = a1[5] + v7;
}

void *IOGPUMetalCommandBufferStorageAllocSidebandBuffer(void *a1, unsigned int a2)
{
  if (!a1) {
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_1();
  }
  if (!*a1) {
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_2();
  }
  if (a1[8]) {
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_4();
  }
  uint64_t v3 = *(void **)(*a1 + 632);
  if (!v3) {
    IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_3();
  }
  while ([v3 shmemSize] < a2)
  {
    unsigned int v5 = [v3 shmemSize];
    int v6 = [v3 shmemSize];
    if (v5 >= 0x200000) {
      uint64_t v7 = (v6 + 0x100000);
    }
    else {
      uint64_t v7 = (2 * v6);
    }
    [v3 setShmemSize:v7];
  }
  uint64_t result = IOGPUMetalDeviceShmemPoolCreateShmem((uint64_t)v3);
  if (result)
  {
    uint64_t v9 = result[17];
    a1[8] = result;
    a1[9] = v9;
    uint64_t v10 = v9 + *((unsigned int *)result + 33);
    a1[10] = v9;
    a1[11] = v10;
  }
  return result;
}

void *IOGPUMetalCommandBufferStorageCreateExt(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v8 = malloc_type_calloc(0x398uLL, 1uLL, 0xBED2C1E0uLL);
  *unsigned int v8 = a1;
  v8[100] = a3;
  IOGPUResourceListInit((uint64_t)(v8 + 18), 0, 0, *(void *)(a1 + 728), *(_DWORD *)(a1 + 720), (uint64_t)IOGPUMetalCommandBufferStorageGrowSegmentList, (uint64_t)v8);
  uint64_t v9 = *(unsigned int *)(a2 + 32);
  if (v9)
  {
    v8[98] = *(void *)(a2 + 24);
    uint64_t v10 = malloc_type_calloc(1uLL, v9 << 6, 0x10B0040CDE4EDB6uLL);
    LODWORD(v9) = *(_DWORD *)(a2 + 32);
  }
  else
  {
    uint64_t v10 = 0;
  }
  v8[96] = v10;
  *((_DWORD *)v8 + 198) = v9;
  uint64_t ResourceList = *(void *)(a2 + 48);
  if (ResourceList) {
    uint64_t ResourceList = MTLResourceListPoolCreateResourceList();
  }
  v8[92] = ResourceList;
  if (a4) {
    uint64_t v12 = MTLResourceListPoolCreateResourceList();
  }
  else {
    uint64_t v12 = 0;
  }
  v8[91] = v12;
  if ((_iogpuMetalCommandBufferStorageSetupShmems((uint64_t)v8, (uint64_t *)a2) & 1) == 0)
  {
    _iogpuMetalCommandBufferStorageFree((uint64_t)v8);
    return 0;
  }
  return v8;
}

uint64_t iogpumetal_atomic_add(atomic_uint *a1, unsigned int a2)
{
  return atomic_fetch_add_explicit(a1, a2, memory_order_relaxed) + a2;
}

void *IOGPUMetalCommandBufferStoragePoolCreateStorage(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  Ext = *(void **)a1;
  if (!*(void *)a1)
  {
    os_unfair_lock_unlock(v6);
    Ext = IOGPUMetalCommandBufferStorageCreateExt(*(void *)(a1 + 32), *(void *)(a1 + 32) + 616, a2, a3);
    if (!Ext) {
      return Ext;
    }
    goto LABEL_14;
  }
  uint64_t v8 = Ext[2];
  uint64_t v9 = (void *)Ext[3];
  if (v8)
  {
    *(void *)(v8 + 24) = v9;
    uint64_t v9 = (void *)Ext[3];
  }
  else
  {
    *(void *)(a1 + 8) = v9;
  }
  *uint64_t v9 = v8;
  --*(_DWORD *)(a1 + 20);
  Ext[2] = 0;
  Ext[3] = 0;
  os_unfair_lock_unlock(v6);
  Ext[100] = a2;
  uint64_t v10 = Ext[91];
  if (a3)
  {
    if (v10) {
      goto LABEL_13;
    }
    uint64_t ResourceList = MTLResourceListPoolCreateResourceList();
  }
  else
  {
    if (!v10) {
      goto LABEL_13;
    }
    MTLResourceListRelease();
    uint64_t ResourceList = 0;
  }
  Ext[91] = ResourceList;
LABEL_13:
  if ((_iogpuMetalCommandBufferStorageSetupShmems((uint64_t)Ext, (uint64_t *)(*(void *)(a1 + 32) + 616)) & 1) == 0)
  {
    _iogpuMetalCommandBufferStorageFree((uint64_t)Ext);
    return 0;
  }
LABEL_14:
  Ext[1] = a1;
  return Ext;
}

uint64_t _iogpuMetalCommandBufferStorageSetupShmems(uint64_t a1, uint64_t *a2)
{
  uint64_t result = (uint64_t)IOGPUMetalDeviceShmemPoolCreateShmem(*a2);
  if (result)
  {
    uint64_t v5 = *(void *)(result + 136);
    *(void *)(a1 + 104) = v5;
    uint64_t v6 = *(void *)(result + 136);
    uint64_t v7 = *(unsigned int *)(result + 132);
    *(void *)(a1 + 96) = result;
    *(void *)(a1 + 808) = v5;
    *(_DWORD *)(a1 + 832) = -1;
    *(_DWORD *)(a1 + 840) = 0;
    *(void *)(a1 + 816) = 0;
    *(void *)(a1 + 128) = 0;
    *(void *)(a1 + 136) = 0;
    *(void *)(a1 + 112) = v6 + v7;
    *(void *)(a1 + 120) = 0;
    Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(a2[1]);
    if (Shmem)
    {
      uint64_t v9 = Shmem[17];
      *(void *)(a1 + 32) = Shmem;
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 56) = Shmem[17] + *((unsigned int *)Shmem + 33);
      uint64_t v10 = Shmem[17];
      *(void *)(a1 + 48) = v10;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      *(_OWORD *)(a1 + 64) = 0u;
      *(_OWORD *)(a1 + 80) = 0u;
      if (*(void *)(StatusReg + 288) == 11181)
      {
        *(void *)(a1 + 888) = 0;
      }
      else
      {
        *(void *)uint64_t v10 = 0xAC0000000FLL;
        *(_OWORD *)(v10 + 24) = 0uLL;
        *(_OWORD *)(v10 + 40) = 0uLL;
        *(_OWORD *)(v10 + 56) = 0uLL;
        *(_OWORD *)(v10 + 72) = 0uLL;
        *(_OWORD *)(v10 + 88) = 0uLL;
        *(_OWORD *)(v10 + 104) = 0uLL;
        *(_OWORD *)(v10 + 120) = 0uLL;
        *(_OWORD *)(v10 + 136) = 0uLL;
        *(_OWORD *)(v10 + 152) = 0uLL;
        *(_DWORD *)(v10 + 168) = 0;
        *(_OWORD *)(v10 + 8) = 0uLL;
        *(void *)(a1 + 888) = v10 + 8;
        int v12 = v10 + 172;
        *(void *)(a1 + 48) = v10 + 172;
        IOGPUMetalCommandBufferStorageBeginKernelCommands(a1, v10);
        uint64_t v13 = *(void *)(a1 + 816);
        int v14 = v12 - *(_DWORD *)(a1 + 40);
        uint64_t v15 = *(unsigned int *)(a1 + 824);
        *(_DWORD *)(a1 + 828) = v15 + 1;
        *(_DWORD *)(v13 + 8 * v15 + 20) = v14;
      }
      return 1;
    }
    else
    {
      IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 96));
      uint64_t result = 0;
      *(void *)(a1 + 96) = 0;
    }
  }
  return result;
}

void *IOGPUMetalDeviceShmemPoolCreateShmem(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3)
  {
    unint64_t v4 = v3 + 1;
    uint64_t v5 = v3[2];
    uint64_t v6 = (void *)v3[3];
    if (v5)
    {
      *(void *)(v5 + 24) = v6;
      uint64_t v7 = v3[2];
      uint64_t v6 = (void *)v3[3];
    }
    else
    {
      uint64_t v7 = 0;
      *(void *)(a1 + 16) = v6;
    }
    *uint64_t v6 = v7;
    --*(_DWORD *)(a1 + 28);
    v3[2] = 0;
    v3[3] = 0;
    os_unfair_lock_unlock(v2);
    goto LABEL_8;
  }
  os_unfair_lock_unlock(v2);
  uint64_t v8 = [objc_alloc(*(Class *)(a1 + 32)) initWithDevice:*(void *)(a1 + 40) shmemSize:*(unsigned int *)(a1 + 48) shmemType:*(unsigned int *)(a1 + 52)];
  uint64_t v3 = (void *)v8;
  if (v8)
  {
    unint64_t v4 = (void *)(v8 + 8);
LABEL_8:
    *unint64_t v4 = a1;
    id v9 = (id)a1;
  }
  return v3;
}

void IOGPUMetalCommandBufferStorageBeginKernelCommands(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 816);
  if (v4)
  {
    int v5 = a2 - *(_DWORD *)(a1 + 40);
    goto LABEL_11;
  }
  int v6 = *(_DWORD *)(a1 + 832);
  if (v6 != -1)
  {
    if (!v6)
    {
      uint64_t v4 = *(void *)(a1 + 128);
      *(_DWORD *)(*(void *)(a1 + 120) + 12) = v4 - *(void *)(a1 + 120);
      *(void *)(a1 + 808) = v4;
      *(void *)(a1 + 120) = 0;
      *(_OWORD *)(a1 + 128) = 0u;
      *(_OWORD *)(a1 + 848) = 0u;
      goto LABEL_8;
    }
    MTLReleaseAssertionFailure();
  }
  uint64_t v4 = *(void *)(a1 + 808);
LABEL_8:
  *(void *)(a1 + 816) = v4;
  *(_DWORD *)(a1 + 832) = 1;
  *(void *)(a1 + 824) = 0;
  if ((unint64_t)(v4 + 48) >= *(void *)(a1 + 112))
  {
    IOGPUMetalCommandBufferStorageGrowSegmentList(a1);
    uint64_t v4 = *(void *)(a1 + 816);
  }
  *(void *)uint64_t v4 = *(void *)(a1 + 800);
  *(void *)(v4 + 8) = 0x4000000100000000;
  int v5 = a2 - *(_DWORD *)(a1 + 40);
  *(_DWORD *)(v4 + 16) = v5;
LABEL_11:
  unsigned int v7 = *(_DWORD *)(a1 + 824);
  int v8 = *(_DWORD *)(a1 + 828);
  if (v8)
  {
    if (*(_DWORD *)(v4 + 8 * (v8 - 1) + 20) == v5) {
      return;
    }
    ++v7;
  }
  if (v4 + 8 * (unint64_t)(v7 + 1) + 16 >= *(void *)(a1 + 112))
  {
    IOGPUMetalCommandBufferStorageGrowSegmentList(a1);
    uint64_t v4 = *(void *)(a1 + 816);
  }
  *(_DWORD *)(v4 + 8 * v7 + 16) = v5;
  *(_DWORD *)(a1 + 824) = v7;
}

double IOGPUResourceListInit(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  *(_DWORD *)(a1 + 480) = 2048;
  *(void *)(a1 + 488) = 0x8000000000BLL;
  *(void *)(a1 + 456) = malloc_type_calloc(0x800uLL, 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 472) = malloc_type_malloc(8 * *(unsigned int *)(a1 + 492), 0x100004000313F17uLL);
  *(void *)(a1 + 464) = malloc_type_calloc((unint64_t)*(unsigned int *)(a1 + 492) >> 3, 1uLL, 0x527F2B0CuLL);
  *(_DWORD *)(a1 + 496) = (*(_DWORD *)(a1 + 480) >> 6) - 1;
  *(_DWORD *)(a1 + 536) = a3 >> 6;
  *(void *)(a1 + 528) = a4;
  *(void *)(a1 + 512) = a2;
  *(void *)(a1 + 520) = a4;
  *(_DWORD *)(a1 + 540) = 0;
  double result = 0.0;
  *(void *)(a1 + 544) = 0;
  *(_DWORD *)(a1 + 504) = 0;
  *(_DWORD *)(a1 + 560) = a5;
  *(void *)(a1 + 568) = a6;
  *(void *)(a1 + 576) = a7;
  return result;
}

uint64_t IOGPUDeviceCreateDeviceShmem(uint64_t a1, unsigned int a2, unsigned int a3, void *a4, _DWORD *a5, _DWORD *a6)
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a2;
  input[1] = a3;
  uint64_t outputStruct = 0;
  uint64_t v18 = 0;
  size_t v16 = 16;
  uint64_t v10 = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xDu, input, 2u, 0, 0, 0, 0, &outputStruct, &v16);
  if (v10)
  {
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
  }
  else
  {
    *a4 = outputStruct;
    int v12 = HIDWORD(v18);
    *a5 = v18;
    *a6 = v12;
    uint64_t v13 = (void (*)(uint64_t, void, void, void, uint64_t, void))*MEMORY[0x263EF8360];
    if (*MEMORY[0x263EF8360])
    {
      int v14 = malloc_type_malloc(0x18uLL, 0x10200403ED2C137uLL);
      if (v14)
      {
        uint64_t v15 = v14;
        *int v14 = outputStruct;
        v14[1] = v18;
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
        v15[2] = *(void *)(a1 + 128);
        *(void *)(a1 + 128) = v15;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
        v13(1677721616, *MEMORY[0x263EF8960], v18, 0, outputStruct, 0);
      }
    }
  }
  return v10;
}

void __IOGPUNotificationQueueSetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 40) + 72));
    *(void *)(*(void *)(a1 + 40) + 72) = 0;
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 40) + 48));
    *(void *)(*(void *)(a1 + 40) + 48) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 56));
    uint64_t v3 = *(const void **)(a1 + 40);
    CFRelease(v3);
  }
  else if (a2 == 2)
  {
    dispatch_mach_msg_get_msg();
    (*(void (**)(void))(a1 + 32))(*(void *)(a1 + 40));
  }
}

void IOGPUNotificationQueueDispatchAvailableCompletionNotifications(uint64_t a1)
{
  uint64_t v5 = 0;
  long long v3 = 0u;
  long long v4 = 0u;
  for (uint32_t dataSize = 40; !IODataQueueDequeue(*(IODataQueueMemory **)(a1 + 32), &v3, &dataSize); uint32_t dataSize = 40)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    uint64_t v2 = (const void *)v3;
    (*(void (**)(void, unint64_t, unint64_t, void, uint64_t))(v3 + 16))(v3, *((void *)&v3 + 1) * (unint64_t)*(unsigned int *)algn_26AA49254 / _iogpuTimebaseInfo, (unint64_t)v4 * *(unsigned int *)algn_26AA49254 / _iogpuTimebaseInfo, DWORD2(v4), v5);
    _Block_release(v2);
    uint64_t v5 = 0;
    long long v3 = 0u;
    long long v4 = 0u;
  }
  IOGPUDeviceCheckAndLogSoftFaultCount(*(void *)(a1 + 16));
}

void IOGPUDeviceCheckAndLogSoftFaultCount(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 104);
  if (v1 && *(void *)(v1 + 8) > *(void *)(a1 + 64))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    unint64_t v3 = *(void *)(*(void *)(a1 + 104) + 8);
    if (v3 > *(void *)(a1 + 64) && (*(void *)(a1 + 64) = v3, uint64_t v4 = mach_absolute_time(), v4 >= *(void *)(a1 + 72)))
    {
      *(void *)(a1 + 72) = *(void *)(a1 + 80) + v4;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        IOGPUDeviceCheckAndLogSoftFaultCount_cold_1(v3);
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
    }
  }
}

void _iogpuMetalCommandBufferStorageFree(uint64_t a1)
{
  IOGPUResourceListDestroy(a1 + 144);
  if (*(void *)(a1 + 32)) {
    _iogpuMetalCommandBufferStorageFree_cold_2();
  }
  if (*(void *)(a1 + 96)) {
    _iogpuMetalCommandBufferStorageFree_cold_1();
  }
  if (*(void *)(a1 + 768))
  {
    _iogpuMetalCommandBufferStorageReleaseCurrentResources(a1);
    free(*(void **)(a1 + 768));
    *(void *)(a1 + 768) = 0;
  }
  _iogpuMetalCommandBufferStorageReleaseExtraResources(a1);
  uint64_t v2 = *(void **)(a1 + 728);
  if (v2)
  {
    [v2 releaseAllObjectsAndReset];
    MTLResourceListRelease();
    *(void *)(a1 + 728) = 0;
  }
  unint64_t v3 = *(void **)(a1 + 736);
  if (v3)
  {
    [v3 releaseAllObjectsAndReset];
    MTLResourceListRelease();
    *(void *)(a1 + 736) = 0;
  }

  *(void *)(a1 + 896) = 0;
  *(void *)(a1 + 904) = 0;
  free((void *)a1);
}

void IOGPUMetalCommandBufferStorageDealloc(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    IOGPUMetalDeviceShmemUpdateTrimLevel(v2, a1[6]);
  }
  uint64_t v3 = a1[12];
  if (v3) {
    IOGPUMetalDeviceShmemUpdateTrimLevel(v3, a1[101]);
  }
  uint64_t v4 = a1[8];
  if (v4) {
    IOGPUMetalDeviceShmemUpdateTrimLevel(v4, a1[10]);
  }
  IOGPUMetalCommandBufferStorageReset(a1);
  uint64_t v5 = (uint64_t *)a1[1];
  if (!v5 || !IOGPUMetalCommandBufferStoragePoolReturnStorage(v5, a1))
  {
    _iogpuMetalCommandBufferStorageFree((uint64_t)a1);
  }
}

uint64_t IOGPUMetalDeviceShmemUpdateTrimLevel(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 136);
  unint64_t v3 = a2 - v2;
  if (a2 - v2 >= 0)
  {
    uint64_t v4 = result;
    if (v3 < *(unsigned int *)(result + 132))
    {
      uint64_t v5 = 0;
      uint64_t v6 = *MEMORY[0x263EF8AE8];
      uint64_t v7 = ~*MEMORY[0x263EF8AE8];
      int64_t v8 = (v3 + *MEMORY[0x263EF8AE8]) & v7;
      int v9 = *(_DWORD *)(result + 112);
      *(_DWORD *)(result + 112) = v9 + 1;
      BOOL v10 = -v9 < 0;
      int v11 = -v9 & 7;
      int v12 = v9 & 7;
      if (v10) {
        int v13 = v12;
      }
      else {
        int v13 = -v11;
      }
      *(void *)(result + 48 + 8 * v13) = v8;
      int64x2_t v14 = 0uLL;
      do
      {
        int64x2_t v14 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(*(int64x2_t *)(result + 48 + v5), v14), *(int8x16_t *)(result + 48 + v5), (int8x16_t)v14);
        v5 += 16;
      }
      while (v5 != 64);
      uint64_t v15 = vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).u64[0];
      uint64_t v16 = (16 * *(void *)&vbsl_s8((int8x8_t)vcgtd_s64(v14.i64[0], v15), *(int8x8_t *)v14.i8, (int8x8_t)v15) / 10
           + v6) & v7;
      int64_t v17 = *(void *)(result + 40);
      uint64_t v18 = v17 - v16 + 3;
      if (v17 >= v16) {
        uint64_t v18 = v17 - v16;
      }
      int64_t v19 = v7 & (v18 >> 2);
      if (v19 <= 0x10000)
      {
        if (v8 <= v17) {
          return result;
        }
      }
      else
      {
        uint64_t v20 = v17 - v16 - v19;
        double result = madvise((void *)(v2 + v17 - v19), v19, 5);
        int64_t v8 = v20 + v16;
      }
      *(void *)(v4 + 40) = v8;
    }
  }
  return result;
}

void IOGPUMetalCommandBufferStorageReset(void *a1)
{
  _iogpuMetalCommandBufferStorageReleaseExtraResources((uint64_t)a1);
  uint64_t v2 = (void *)a1[91];
  if (v2) {
    [v2 releaseAllObjectsAndReset];
  }
  unint64_t v3 = (void *)a1[92];
  if (v3) {
    [v3 releaseAllObjectsAndReset];
  }
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    uint64_t v7 = (void *)a1[v4 + 112];
    if (v7) {
      [v7 removeAllObjects];
    }
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  a1[111] = 0;
  IOGPUMetalCommandBufferStorageReleaseDeviceShmems((uint64_t)a1);
  if (a1[96]) {
    _iogpuMetalCommandBufferStorageReleaseCurrentResources((uint64_t)a1);
  }
  a1[97] = 0;
}

void _iogpuMetalCommandBufferStorageReleaseCurrentResources(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 792);
  if (v1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = v1 << 6;
    do
    {
      uint64_t v5 = *(void *)(a1 + 768) + v3;
      char v6 = *(void **)(v5 + 32);
      if (v6)
      {
        IOGPUMetalPooledResourceRelease(v6);
        *(_DWORD *)(v5 + 56) = 0;
        *(void *)(v5 + 24) = 0;
        *(void *)(v5 + 32) = 0;
      }
      v3 += 64;
    }
    while (v4 != v3);
  }
}

void IOGPUMetalCommandBufferStorageReleaseDeviceShmems(uint64_t a1)
{
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  if (v2)
  {
    IOGPUMetalDeviceShmemRelease(v2);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v3 = *(os_unfair_lock_s **)(a1 + 96);
  if (v3)
  {
    IOGPUMetalDeviceShmemRelease(v3);
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v4 = *(os_unfair_lock_s **)(a1 + 64);
  if (v4)
  {
    IOGPUMetalDeviceShmemRelease(v4);
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
  }
  uint64_t v5 = *(os_unfair_lock_s **)(a1 + 864);
  if (v5)
  {
    char v6 = (void *)(a1 + 864);
    IOGPUMetalDeviceShmemRelease(v5);
    *char v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
  }
}

void IOGPUMetalDeviceShmemRelease(os_unfair_lock_s *a1)
{
  uint64_t v1 = *(os_unfair_lock_s **)&a1[2]._os_unfair_lock_opaque;
  if (v1)
  {
    uint64_t v2 = v1 + 2;
    *(void *)&a1[2]._os_unfair_lock_opaque = 0;
    uint64_t v5 = a1;
    os_unfair_lock_lock(v1 + 6);
    if (v5[33]._os_unfair_lock_opaque >= v1[12]._os_unfair_lock_opaque)
    {
      uint64_t v3 = *(os_unfair_lock_s **)&v2->_os_unfair_lock_opaque;
      *(void *)&v5[4]._os_unfair_lock_opaque = *(void *)&v2->_os_unfair_lock_opaque;
      if (v3) {
        uint64_t v4 = v3 + 6;
      }
      else {
        uint64_t v4 = v1 + 4;
      }
      *(void *)&v4->_os_unfair_lock_opaque = v5 + 4;
      *(void *)&v2->_os_unfair_lock_opaque = v5;
      *(void *)&v5[6]._os_unfair_lock_opaque = v2;
      ++v1[7]._os_unfair_lock_opaque;
    }
    else
    {
    }
    os_unfair_lock_unlock(v1 + 6);
    a1 = v1;
  }
}

BOOL IOGPUMetalCommandBufferStoragePoolReturnStorage(uint64_t *a1, void *a2)
{
  a2[1] = 0;
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 2);
  os_unfair_lock_lock((os_unfair_lock_t)a1 + 4);
  int v5 = *((_DWORD *)a1 + 5);
  int v6 = *((_DWORD *)a1 + 7);
  if (v5 < v6)
  {
    uint64_t v7 = *a1;
    a2[2] = *a1;
    if (v7) {
      int64_t v8 = (void *)(v7 + 24);
    }
    else {
      int64_t v8 = a1 + 1;
    }
    *int64_t v8 = a2 + 2;
    *a1 = (uint64_t)a2;
    a2[3] = a1;
    *((_DWORD *)a1 + 5) = v5 + 1;
  }
  BOOL v9 = v5 < v6;
  os_unfair_lock_unlock(v4);
  return v9;
}

double IOGPUResourceListDestroy(uint64_t a1)
{
  free(*(void **)(a1 + 456));
  free(*(void **)(a1 + 472));
  free(*(void **)(a1 + 464));
  double result = 0.0;
  *(_OWORD *)(a1 + 568) = 0u;
  return result;
}

uint64_t IOGPUDeviceDestroyDeviceShmem(uint64_t a1, unsigned int a2)
{
  uint64_t input = a2;
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
  int v6 = (void *)(a1 + 128);
  int v5 = *(void **)(a1 + 128);
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 128);
    while (*((_DWORD *)v7 + 3) != a2)
    {
      uint64_t v7 = (void *)v7[2];
      if (!v7) {
        goto LABEL_12;
      }
    }
    if (*MEMORY[0x263EF8360])
    {
      ((void (*)(uint64_t, void, void, void, void, void))*MEMORY[0x263EF8360])(1677721632, *MEMORY[0x263EF8960], *v7, *((unsigned int *)v7 + 2), 0, 0);
      int v5 = (void *)*v6;
    }
    if (v5 != v7)
    {
      do
      {
        int64_t v8 = v5;
        int v5 = (void *)v5[2];
      }
      while (v5 != v7);
      int v6 = v8 + 2;
    }
    *int v6 = v7[2];
    free(v7);
  }
LABEL_12:
  os_unfair_lock_unlock(v4);
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 20), 0xEu, &input, 1u, 0, 0);
}

void *IOGPUCommandQueueGetID(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFGetTypeID(result) == kIOGPUCommandQueueID) {
      return (void *)v1[3];
    }
    else {
      return 0;
    }
  }
  return result;
}

void *IOGPUCommandQueueGetConnect(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFGetTypeID(result) == kIOGPUCommandQueueID) {
      return (void *)*(unsigned int *)(v1[2] + 20);
    }
    else {
      return 0;
    }
  }
  return result;
}

unint64_t validateGPUPriority(unint64_t result, char a2)
{
  if (result > 5 || result == 3 && (a2 & 1) == 0) {
    return MTLReportFailure();
  }
  return result;
}

uint64_t IOGPUCommandQueueSetPriorityAndBackground(uint64_t a1, void *inputStruct, _DWORD *a3)
{
  uint32_t outputCnt = 1;
  uint64_t output = 3;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x1Bu, (const uint64_t *)(a1 + 24), 1u, inputStruct, 0xCuLL, &output, &outputCnt, 0, 0);
  if (a3)
  {
    if (!result) {
      *a3 = output;
    }
  }
  return result;
}

unsigned int *IOGPUDeviceGetConnect(unsigned int *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFGetTypeID(result) == kIOGPUDeviceID) {
      return (unsigned int *)v1[5];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t __IOGPUNotificationQueueCreate_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_iogpuTimebaseInfo);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

uint64_t IOGPUDeviceGetGlobalTraceObjectID(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t IOGPUDeviceCreateWithAPIProperty(io_service_t a1, const char *a2, int a3)
{
  kern_return_t v5;
  int v6;
  mach_port_t v7;
  uint64_t Instance;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  size_t v14;
  size_t outputStruct[2];
  long long v16;
  size_t outputStructCnt;
  io_connect_t connect;
  char __dst[16];
  _OWORD v20[32];
  uint64_t v21;

  BOOL v21 = *MEMORY[0x263EF8340];
  connect = 0;
  int v5 = IOServiceOpen(a1, *MEMORY[0x263EF8960], (a3 << 16) | 1, &connect);
  if (v5)
  {
    int v6 = v5;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      IOGPUDeviceCreateWithAPIProperty_cold_1(v6);
    }
    return 0;
  }
  if (a2)
  {
    strncpy(__dst, a2, 0x10uLL);
    IOConnectCallStructMethod(connect, 6u, __dst, 0x10uLL, 0, 0);
  }
  uint64_t v7 = connect;
  if (IOGPUDeviceGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUDeviceGetTypeID_onceToken, &__block_literal_global_4);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  BOOL v9 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = a1;
    *(_DWORD *)(Instance + 20) = v7;
    *(void *)(Instance + 68) = 0;
    *(void *)(Instance + 60) = 0;
    *(_DWORD *)(Instance + 76) = 0;
    *(void *)(Instance + 80) = 300000000000
                               * (unint64_t)*(unsigned int *)algn_26AA4924C
                               / timebase_info;
    memset(v20, 0, 496);
    *(_OWORD *)__dst = 0u;
    size_t outputStructCnt = 536;
    if (IOConnectCallStructMethod(v7, 2u, 0, 0, __dst, &outputStructCnt)) {
      goto LABEL_17;
    }
    *(void *)(v9 + 24) = *(void *)__dst;
    BOOL v10 = DWORD1(v20[0]);
    *(_DWORD *)(v9 + 40) = DWORD1(v20[0]);
    if ((int)v10 < 2)
    {
      *(void *)(v9 + 32) = v9 + 24;
    }
    else
    {
      *(void *)(v9 + 32) = malloc_type_malloc(8 * v10, 0x10040436913F5uLL);
      int v11 = *(unsigned int *)(v9 + 40);
      if ((int)v11 >= 1)
      {
        for (i = 0; i != v11; ++i)
          *(void *)(*(void *)(v9 + 32) + 8 * i) = *((unsigned int *)v20 + i + 2) + *(void *)(v9 + 24);
      }
    }
    *(void *)(v9 + 44) = *(void *)&__dst[8];
    *(_DWORD *)(v9 + 52) = v20[0];
    outputStruct[0] = 64;
    if (IOConnectCallStructMethod(*(_DWORD *)(v9 + 20), 0, 0, 0, (void *)(v9 + 160), outputStruct))
    {
LABEL_17:
      CFRelease((CFTypeRef)v9);
      return 0;
    }
    *(_OWORD *)uint64_t outputStruct = 0u;
    uint64_t v16 = 0u;
    int64x2_t v14 = 32;
    if (!IOConnectCallStructMethod(*(_DWORD *)(v9 + 20), 4u, 0, 0, outputStruct, &v14))
    {
      *(void *)(v9 + 88) = outputStruct[0];
      if (DWORD2(v16) >= 4) {
        *(void *)(v9 + 96) = outputStruct[1];
      }
      *(void *)(v9 + 104) = v16;
    }
    if (__globalGPUCommPageInit != -1) {
      dispatch_once(&__globalGPUCommPageInit, &__block_literal_global_3_1);
    }
    *(void *)(v9 + 112) = 0;
    *(_DWORD *)(v9 + 120) = 0;
    *(_OWORD *)(v9 + 128) = 0u;
    *(_OWORD *)(v9 + 144) = 0u;
  }
  return v9;
}

void IOGPUMetalSuballocatorCreate(IOGPUMetalDevice *a1)
{
  char v3 = 0;
  if (a1)
  {
    uint64_t v2 = (IOGPUMetalSuballocator *)IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocator>::allocate((uint64_t)&v3, 1);
    if (v2) {
      IOGPUMetalSuballocator::IOGPUMetalSuballocator(v2, a1);
    }
  }
}

void *IOGPUMetalSuballocatorHeap::Allocator<IOGPUMetalSuballocator>::allocate(uint64_t a1, uint64_t a2)
{
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 2824 * a2, 0x10F0040732811FFuLL)) {
    return 0;
  }
  else {
    return memptr;
  }
}

void IOGPUMetalSuballocator::IOGPUMetalSuballocator(IOGPUMetalSuballocator *this, IOGPUMetalDevice *a2)
{
  for (uint64_t i = 0; i != 2816; i += 88)
  {
    uint64_t v4 = (char *)this + i;
    *(void *)((char *)this + i + 56) = 0;
    *(_OWORD *)uint64_t v4 = 0uLL;
    *((_OWORD *)v4 + 1) = 0uLL;
    *((_OWORD *)v4 + 2) = 0uLL;
    *((void *)v4 + 6) = (char *)this + i + 56;
    *((void *)v4 + 8) = 0;
    *((void *)v4 + 9) = -1;
    *((_DWORD *)v4 + 20) = 0;
  }
  *((void *)this + 352) = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("IOGPUMetalSuballocator", "IOGPUMetalSuballocator.mm", 117, "[device isKindOfClass:[IOGPUMetalDevice class]] && \"Bad device instance\"");
  }
  int v5 = a2;
}

double IOGPUMetalCommandBufferStoragePoolCreate(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x28uLL, 0x10A004036F81E10uLL);
  if (v2)
  {
    v2[4] = a1;
    double result = 0.0;
    *((_OWORD *)v2 + 1) = xmmword_21C736DE0;
    *uint64_t v2 = 0;
    v2[1] = v2;
  }
  return result;
}

uint64_t IOGPUDeviceGetSharedMemorySize(void *a1, void *a2)
{
  uint64_t v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUDeviceID)
  {
    uint64_t v2 = 0;
    *a2 = a1[24];
  }
  return v2;
}

uint64_t IOGPUDeviceGetConfig64(uint64_t a1, _DWORD *a2, _DWORD *a3, void *a4, void *a5, _DWORD *a6)
{
  uint64_t v6 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUDeviceID)
  {
    uint64_t v6 = 0;
    *a2 = *(_DWORD *)(a1 + 160);
    *a3 = *(_DWORD *)(a1 + 164);
    *a4 = *(void *)(a1 + 168);
    *a5 = *(void *)(a1 + 176);
    *a6 = *(_DWORD *)(a1 + 184);
  }
  return v6;
}

void __ioGPUCommandQueueFinalize_block_invoke_2(uint64_t a1)
{
  IOGPUNotificationQueueSetDispatchQueue(*(dispatch_queue_t **)(a1 + 32), 0, 0);
  uint64_t v2 = *(const void **)(a1 + 32);
  IOGPUNotificationQueueRelease(v2);
}

dispatch_queue_t *IOGPUNotificationQueueSetDispatchQueue(dispatch_queue_t *result, NSObject *a2, int a3)
{
  if (result)
  {
    int v5 = result;
    double result = (dispatch_queue_t *)CFGetTypeID(result);
    if (result == (dispatch_queue_t *)kIOGPUNotificationQueueID)
    {
      if (v5[9])
      {
        dispatch_assert_queue_not_V2(v5[6]);
        dispatch_mach_cancel();
        double result = (dispatch_queue_t *)dispatch_semaphore_wait(v5[7], 0xFFFFFFFFFFFFFFFFLL);
        if (v5[6]) {
          IOGPUNotificationQueueSetDispatchQueue_cold_2();
        }
        if (v5[9]) {
          IOGPUNotificationQueueSetDispatchQueue_cold_1();
        }
      }
      if (a2 && (a3 == 1 || a3 == 2))
      {
        label = dispatch_queue_get_label(a2);
        if (*label) {
          uint64_t v7 = label;
        }
        else {
          uint64_t v7 = "IOGPUNotificationQueueDispatchQueue";
        }
        CFRetain(v5);
        dispatch_queue_t v8 = dispatch_queue_create_with_target_V2(v7, 0, a2);
        uint64_t v9 = dispatch_mach_create();
        v5[6] = v8;
        v5[9] = (dispatch_queue_t)v9;
        return (dispatch_queue_t *)dispatch_mach_connect();
      }
    }
  }
  return result;
}

dispatch_queue_t *IOGPUCommandQueueSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  return IOGPUNotificationQueueSetDispatchQueue(*(dispatch_queue_t **)(a1 + 40), a2, 1);
}

mach_port_t *IOGPUCommandQueueCreateWithQoS(mach_port_t *a1, int a2, char a3)
{
  kern_return_t v7;
  mach_port_t *v8;
  uint64_t v9;
  void *v10;
  kern_return_t v11;
  int v12;
  int x;
  size_t v15;
  uint64_t outputStruct;
  uint64_t v17;
  uint64_t input[2];
  _OWORD buffer[64];
  int v20;
  char v21;
  uint64_t v22;

  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v15 = 16;
  if (IOGPUCommandQueueGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUCommandQueueGetTypeID_onceToken, &__block_literal_global_5);
  }
  uint64_t Instance = (mach_port_t *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    memset(buffer, 0, 512);
    uint64_t outputStruct = 0;
    int64_t v17 = 0;
    CFRetain(a1);
    *((void *)Instance + 2) = a1;
    *((void *)Instance + 3) = 0;
    *((void *)Instance + 5) = 0;
    x = 0;
    pid_for_task(*MEMORY[0x263EF8960], &x);
    proc_pidpath(x, buffer, 0x400u);
    uint64_t v20 = a2;
    BOOL v21 = a3;
    uint64_t v7 = IOConnectCallMethod(a1[5], 7u, 0, 0, buffer, 0x408uLL, 0, 0, &outputStruct, &v15);
    if (v7)
    {
      if (v7 == -536379391) {
        abort();
      }
      dispatch_queue_t v8 = a1;
      goto LABEL_15;
    }
    if (!outputStruct) {
      IOGPUCommandQueueCreateWithQoS_cold_1();
    }
    uint64_t v9 = v17;
    *((void *)Instance + 3) = outputStruct;
    *((void *)Instance + 4) = v9;
    BOOL v10 = (void *)IOGPUNotificationQueueCreate(a1, 0x100u, 0x28u);
    *((void *)Instance + 5) = v10;
    if (!v10)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        IOGPUCommandQueueCreateWithQoS_cold_2();
      }
      goto LABEL_14;
    }
    input[0] = *((void *)Instance + 3);
    input[1] = (uint64_t)IOGPUNotificationQueueGetID(v10);
    int v11 = IOConnectCallMethod(a1[5], 0x19u, input, 2u, 0, 0, 0, 0, 0, 0);
    if (v11)
    {
      int v12 = v11;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        IOGPUCommandQueueCreateWithQoS_cold_3(v12);
      }
LABEL_14:
      dispatch_queue_t v8 = Instance;
LABEL_15:
      CFRelease(v8);
      return 0;
    }
  }
  return Instance;
}

void *IOGPUNotificationQueueGetID(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFGetTypeID(result) == kIOGPUNotificationQueueID) {
      return (void *)v1[3];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOGPUNotificationQueueCreate(mach_port_t *a1, unsigned int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  size_t v11 = 16;
  if (IOGPUNotificationQueueCreate_once != -1) {
    dispatch_once(&IOGPUNotificationQueueCreate_once, &__block_literal_global_3);
  }
  if (IOGPUNotificationQueueGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUNotificationQueueGetTypeID_onceToken, &__block_literal_global_0);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    uint64_t outputStruct = 0;
    uint64_t v13 = 0;
    CFRetain(a1);
    *(void *)(Instance + 24) = 0;
    *(void *)(Instance + 16) = a1;
    *(void *)(Instance + 72) = 0;
    *(void *)(Instance + 32) = 0;
    *(_DWORD *)(Instance + 40) = 0;
    *(void *)(Instance + 48) = 0;
    *(void *)(Instance + 56) = 0;
    input[0] = a2;
    input[1] = a3;
    if (IOConnectCallMethod(a1[5], 0xFu, input, 2u, 0, 0, 0, 0, &outputStruct, &v11))
    {
      uint64_t v7 = a1;
    }
    else
    {
      if (!v13) {
        IOGPUNotificationQueueCreate_cold_1();
      }
      uint64_t v8 = outputStruct;
      *(void *)(Instance + 24) = v13;
      *(void *)(Instance + 32) = v8;
      uint64_t NotificationPort = IODataQueueAllocateNotificationPort();
      *(_DWORD *)(Instance + 40) = NotificationPort;
      if (NotificationPort
        && !MEMORY[0x21D4AE580](a1[5], 0, NotificationPort, *(void *)(Instance + 24)))
      {
        *(void *)(Instance + 56) = dispatch_semaphore_create(0);
        *(void *)(Instance + 64) = dispatch_semaphore_create(a2);
        return Instance;
      }
      uint64_t v7 = (const void *)Instance;
    }
    CFRelease(v7);
    return 0;
  }
  return Instance;
}

uint64_t IOGPUCommandQueueGetGlobalTraceObjectID(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void IOGPUCommandQueueRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t IOGPUDeviceSetAppGPURole(uint64_t a1, int a2, unsigned int a3)
{
  input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097088;
  if (a1)
  {
    mach_port_t v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x22u, input, 2u, 0, 0);
    }
  }
  return result;
}

void IOGPUNotificationQueueRelease(const void *a1)
{
  if (a1 && CFGetTypeID(a1) == kIOGPUNotificationQueueID)
  {
    CFRelease(a1);
  }
}

uint64_t __IOGPUResourceGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOGPUResourceID = result;
  return result;
}

uint64_t __IOGPUNotificationQueueGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOGPUNotificationQueueID = result;
  return result;
}

uint64_t __IOGPUCommandQueueGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOGPUCommandQueueID = result;
  return result;
}

uint64_t __IOGPUDeviceGetTypeID_block_invoke()
{
  kIOGPUDeviceID = _CFRuntimeRegisterClass();
  return mach_timebase_info((mach_timebase_info_t)&timebase_info);
}

uint64_t IOGPUDeviceGetMaxResourceSize(void *a1, void *a2)
{
  uint64_t v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUDeviceID)
  {
    uint64_t v2 = 0;
    *a2 = a1[25];
  }
  return v2;
}

_DWORD *__IOGPUDeviceCreateWithAPIProperty_block_invoke()
{
  uint64_t result = (_DWORD *)IOSurfaceGetGraphicsCommPageAddress();
  __globalGPUCommPage = (uint64_t)result;
  if (!result)
  {
    uint64_t result = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    __globalGPUCommPage = (uint64_t)result;
    *uint64_t result = 0;
  }
  return result;
}

void ioGPUNotificationQueueFinalize(uint64_t a1)
{
  kern_return_t v5;
  int v6;

  mach_port_name_t v2 = *(_DWORD *)(a1 + 40);
  if (v2)
  {
    mach_port_mod_refs(*MEMORY[0x263EF8960], v2, 1u, -1);
    *(_DWORD *)(a1 + 40) = 0;
  }
  if (*(void *)(a1 + 72)) {
    ioGPUNotificationQueueFinalize_cold_3();
  }
  if (*(void *)(a1 + 48)) {
    ioGPUNotificationQueueFinalize_cold_2();
  }
  char v3 = *(NSObject **)(a1 + 56);
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = *(NSObject **)(a1 + 64);
  if (v4) {
    dispatch_release(v4);
  }
  if (*(void *)(a1 + 24))
  {
    mach_port_t v5 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x10u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
    if (v5)
    {
      uint64_t v6 = v5;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        ioGPUNotificationQueueFinalize_cold_1(v6);
      }
    }
  }
  *(void *)(a1 + 24) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 16));
}

void ioGPUCommandQueueFinalize(uint64_t a1)
{
  kern_return_t v3;
  void block[5];

  if (_cmdq_finalize_queue_once_0 != -1) {
    dispatch_once(&_cmdq_finalize_queue_once_0, &__block_literal_global_6);
  }
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ioGPUCommandQueueFinalize_block_invoke_2;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)_cmdq_finalize_queue_0, block);
  }
  if (*(void *)(a1 + 24))
  {
    char v3 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 8u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
    if (v3) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOGPUCommandQueue delete failed with error 0x%x", v3);
    }
  }
  *(void *)(a1 + 24) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 16));
}

dispatch_queue_t __ioGPUCommandQueueFinalize_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.Metal.NotificationQueueCleaupQueue", 0);
  _cmdq_finalize_queue_0 = (uint64_t)result;
  return result;
}

void IOGPUMetalCommandBufferStorageGrowSegmentList(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  unsigned int v3 = *(_DWORD *)(v2 + 132);
  if (v3 >= 0x200000) {
    uint64_t v4 = v3 + 0x100000;
  }
  else {
    uint64_t v4 = 2 * v3;
  }
  [*(id *)(v2 + 8) setShmemSize:v4];
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(*(void *)(v2 + 8));
  if (!Shmem)
  {
    uint64_t v26 = *(uint64_t **)(a1 + 120);
    BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v26)
    {
      if (v27)
      {
        IOGPUMetalCommandBufferStorageGrowSegmentList_cold_2(v26);
        abort();
      }
    }
    else if (v27)
    {
      IOGPUMetalCommandBufferStorageGrowSegmentList_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    abort();
  }
  uint64_t v6 = Shmem;
  memcpy((void *)Shmem[17], *(const void **)(a1 + 104), *(unsigned int *)(*(void *)(a1 + 96) + 132));
  IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 96));
  *(void *)(a1 + 96) = v6;
  if (*(_DWORD *)(a1 + 836))
  {
    uint64_t v7 = v6[17];
    uint64_t v8 = *(void *)(a1 + 128) - *(void *)(a1 + 104);
    uint64_t v9 = v7 + *((unsigned int *)v6 + 33);
    *(void *)(a1 + 104) = v7;
    *(void *)(a1 + 112) = v9;
    uint64_t v10 = v7 + v8;
    *(void *)(a1 + 120) = v7;
    *(void *)(a1 + 128) = v10;
    uint64_t v11 = v10 + 32;
    *(void *)(a1 + 136) = v10 + 32;
    uint64_t v12 = a1 + 144;
    uint64_t v13 = v9 - (v10 + 32);
  }
  else
  {
    int v14 = *(_DWORD *)(a1 + 832);
    if (v14)
    {
      if (v14 == 1)
      {
        uint64_t v15 = *(void *)(a1 + 816) - *(void *)(a1 + 104);
        uint64_t v16 = v6[17];
        uint64_t v17 = v16 + *((unsigned int *)v6 + 33);
        *(void *)(a1 + 104) = v16;
        *(void *)(a1 + 112) = v17;
        uint64_t v18 = v16 + v15;
        *(void *)(a1 + 816) = v18;
        *(void *)(a1 + 808) = v18;
      }
      else
      {
        uint64_t v35 = MTLReleaseAssertionFailure();
        __IOGPUMetalCommandBufferStorageFinalizeShmemHeader_block_invoke(v35, v36, v37);
      }
      return;
    }
    uint64_t v19 = *(void *)(a1 + 104);
    uint64_t v20 = *(void *)(a1 + 120) - v19;
    uint64_t v21 = *(void *)(a1 + 128) - v19;
    uint64_t v22 = v6[17];
    uint64_t v23 = v22 + *((unsigned int *)v6 + 33);
    *(void *)(a1 + 104) = v22;
    *(void *)(a1 + 112) = v23;
    uint64_t v24 = v22 + v20;
    *(void *)(a1 + 808) = v24;
    uint64_t v25 = v22 + v21;
    *(void *)(a1 + 120) = v24;
    *(void *)(a1 + 128) = v25;
    uint64_t v11 = v25 + 32;
    *(void *)(a1 + 136) = v25 + 32;
    uint64_t v12 = a1 + 144;
    uint64_t v13 = v23 - (v25 + 32);
  }
  IOGPUResourceListReset(v12, v11, v13, 0);
}

uint64_t __IOGPUMetalCommandBufferStorageFinalizeShmemHeader_block_invoke(uint64_t result, uint64_t a2, BOOL *a3)
{
  unsigned int v3 = *(unsigned int **)(*(void *)(*(void *)(result + 32) + 8) + 24);
  uint64_t v4 = *v3;
  v3[v4 + 1] = *(_DWORD *)(a2 + 40);
  **(_DWORD **)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4 + 1;
  *a3 = v4 == 39;
  return result;
}

uint64_t IOGPUMetalCommandBufferStorageGetSegmentListPointers(uint64_t result, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (void *)result;
  if (*(void *)(result + 120))
  {
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_queue_t result = _mtlIOGPUCommandBufferStorageBeginSegmentList(result);
  if (a2) {
LABEL_3:
  }
    *a2 = v7[15];
LABEL_4:
  if (a3) {
    *a3 = v7[16];
  }
  if (a4) {
    *a4 = v7[14];
  }
  return result;
}

uint64_t IOGPUMetalCommandBufferStorageResumeSegment(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 120);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 848);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 856);
  if (!v3) {
    return 0;
  }
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 136) = v3;
  *(void *)(a1 + 848) = 0;
  *(void *)(a1 + 856) = 0;
  --*(_DWORD *)(v1 + 8);
  --*(_DWORD *)(a1 + 840);
  *(void *)(v2 + 24) = 0;
  *(_DWORD *)(v2 + 12) = 0;
  return 1;
}

void IOGPUMetalCommandBufferStoragePoolDealloc(void *a1)
{
  uint64_t v2 = (void *)*a1;
  if (v2)
  {
    do
    {
      uint64_t v4 = (void *)v2[2];
      uint64_t v3 = (void *)v2[3];
      if (v4)
      {
        v4[3] = v3;
        uint64_t v3 = (void *)v2[3];
      }
      else
      {
        a1[1] = v3;
      }
      *uint64_t v3 = v4;
      --*((_DWORD *)a1 + 5);
      IOGPUMetalCommandBufferStorageDealloc(v2);
      uint64_t v2 = v4;
    }
    while (v4);
  }
  free(a1);
}

void *IOGPUMetalCommandBufferStorageAllocDebugBuffer(void *a1)
{
  dispatch_queue_t result = IOGPUMetalDeviceShmemPoolCreateShmem(*(void *)(*a1 + 672));
  if (result)
  {
    a1[109] = result[17];
    uint64_t v3 = result[17];
    a1[108] = result;
    a1[110] = v3 + *((unsigned int *)result + 33);
  }
  return result;
}

void IOGPUMetalCommandBufferStorageGrowDebugBuffer(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 864);
  unsigned int v4 = *(_DWORD *)(v3 + 132);
  unsigned int v5 = v4 + a2;
  while (v4 < v5)
  {
    if (v4 >= 0x200000) {
      v4 += 0x100000;
    }
    else {
      v4 *= 2;
    }
  }
  objc_msgSend(*(id *)(v3 + 8), "setShmemSize:");
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem(*(void *)(v3 + 8));
  if (!Shmem)
  {
    uint64_t v9 = *(void *)(a1 + 120);
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v9)
    {
      if (v10)
      {
        IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_2();
        abort();
      }
    }
    else if (v10)
    {
      IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    abort();
  }
  uint64_t v7 = Shmem;
  IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 864));
  *(void *)(a1 + 872) = v7[17];
  uint64_t v8 = v7[17];
  *(void *)(a1 + 864) = v7;
  *(void *)(a1 + 880) = v8 + *((unsigned int *)v7 + 33);
}

uint64_t IOGPUMetalCommandBufferStorageGetDebugBufferPointers(uint64_t result, void *a2, void *a3)
{
  if (a2) {
    *a2 = *(void *)(result + 872);
  }
  if (a3) {
    *a3 = *(void *)(result + 880);
  }
  return result;
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (!v2) {
    IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_1();
  }
  unsigned int v4 = *(_DWORD *)(v2 + 132) + a2;
  for (uint64_t i = *(void **)(*(void *)a1 + 632);
        [i shmemSize] < v4;
        [i setShmemSize:v8])
  {
    unsigned int v6 = [i shmemSize];
    int v7 = [i shmemSize];
    if (v6 >= 0x200000) {
      uint64_t v8 = (v7 + 0x100000);
    }
    else {
      uint64_t v8 = (2 * v7);
    }
  }
  Shmem = IOGPUMetalDeviceShmemPoolCreateShmem((uint64_t)i);
  if (!Shmem)
  {
    uint64_t v12 = *(void *)(a1 + 120);
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v12)
    {
      if (v13)
      {
        IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_3();
        abort();
      }
    }
    else if (v13)
    {
      IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    abort();
  }
  BOOL v10 = Shmem;
  size_t v11 = *(void *)(a1 + 80) - *(void *)(a1 + 72);
  memcpy((void *)Shmem[17], *(const void **)(v2 + 136), v11);
  IOGPUMetalDeviceShmemRelease(*(os_unfair_lock_s **)(a1 + 64));
  *(void *)(a1 + 72) = v10[17];
  *(void *)(a1 + 88) = v10[17] + *((unsigned int *)v10 + 33);
  *(void *)(a1 + 80) = v10[17] + v11;
  *(void *)(a1 + 64) = v10;
}

unint64_t IOGPUMetalCommandBufferStorageAddResidencySets(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int a4)
{
  if (a4) {
    unsigned int v6 = 8;
  }
  else {
    unsigned int v6 = 32;
  }
  int v7 = (id *)(a1 + 8 * a4 + 896);
  id v8 = *v7;
  if (!*v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08760]);
    *int v7 = v8;
  }
  if (a3)
  {
    do
    {
      uint64_t v9 = *a2++;
      [*v7 addObject:v9];
      --a3;
    }
    while (a3);
    id v8 = *v7;
  }
  unint64_t result = [v8 count];
  if (result > v6) {
    return MTLReportFailure();
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void _addResidencySets(os_unfair_lock_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_lock(a1 + 110);
  if (!*(void *)&a1[2 * a4 + 106]._os_unfair_lock_opaque) {
    *(void *)&a1[2 * a4 + 106]._os_unfair_lock_opaque = objc_opt_new();
  }
  for (; a3; --a3)
  {
    [*(id *)&a1[2 * a4 + 106]._os_unfair_lock_opaque addObject:*a2];
    if (*(_DWORD *)__globalGPUCommPage) {
      IOGPUDeviceTraceEvent();
    }
    ++a2;
  }
  if (a4 == 1) {
    unint64_t v8 = 8;
  }
  else {
    unint64_t v8 = 32;
  }
  if ([*(id *)&a1[2 * a4 + 106]._os_unfair_lock_opaque count] > v8) {
    MTLReportFailure();
  }
  _updateResidencySets((uint64_t)a1);
  os_unfair_lock_unlock(a1 + 110);
}

void _removeResidencySets(os_unfair_lock_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_lock(a1 + 110);
  if (*(void *)&a1[2 * a4 + 106]._os_unfair_lock_opaque)
  {
    if (!a3) {
      goto LABEL_9;
    }
  }
  else
  {
    *(void *)&a1[2 * a4 + 106]._os_unfair_lock_opaque = objc_opt_new();
    if (!a3) {
      goto LABEL_9;
    }
  }
  unint64_t v8 = &a1[2 * a4];
  do
  {
    [*(id *)&v8[106]._os_unfair_lock_opaque removeObject:*a2];
    if (*(_DWORD *)__globalGPUCommPage) {
      IOGPUDeviceTraceEvent();
    }
    ++a2;
    --a3;
  }
  while (a3);
LABEL_9:
  _updateResidencySets((uint64_t)a1);
  os_unfair_lock_unlock(a1 + 110);
}

void _updateResidencySets(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  uint64_t v3 = MEMORY[0x263EF8330];
  char v4 = 1;
  do
  {
    char v5 = v4;
    unsigned int v6 = *(void **)(a1 + 424 + 8 * v2);
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = ___updateResidencySets_block_invoke;
    v8[3] = &unk_26441A550;
    v8[4] = &v9;
    v8[5] = v13;
    [v6 enumerateObjectsUsingBlock:v8];
    char v4 = 0;
    uint64_t v2 = 1;
  }
  while ((v5 & 1) != 0);
  int v7 = IOGPUCommandQueueSetResourceGroups(*(void *)(a1 + 384), *((unsigned int *)v10 + 6), (uintptr_t)v13);
  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    _updateResidencySets_cold_1(v7);
  }
  _Block_object_dispose(&v9, 8);
}

void sub_21C71CA08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t ___updateResidencySets_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v4 = *(unsigned int *)(v3 + 24);
  if (v4 <= 0x27)
  {
    int v5 = *(_DWORD *)(a2 + 40);
    uint64_t v6 = *(void *)(result + 40);
    *(_DWORD *)(v3 + 24) = v4 + 1;
    *(_DWORD *)(v6 + 4 * v4) = v5;
  }
  *a3 = 0;
  return result;
}

void sub_21C71D740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21C71E1D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<NSObject *>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26441A3E0, MEMORY[0x263F8C060]);
}

void sub_21C71E480(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<NSObject *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

BOOL IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::init(int32x2_t *a1, size_t size, unsigned int a3)
{
  if (a3 < 2 * (int)size) {
    return 0;
  }
  a1[6].i32[0] = size;
  a1[6].i32[1] = size - 1;
  a1[7] = vadd_s32((int32x2_t)vshl_u32((uint32x2_t)vadd_s32(vdup_n_s32(size), (int32x2_t)0xFFF0000003FLL), (uint32x2_t)0xFFFFFFF4FFFFFFFALL), (int32x2_t)-1);
  a1[8].i32[0] = __clz(__rbit32(size));
  a1[9].i32[1] = a3;
  a1[2] = (int32x2_t)malloc_type_calloc(4uLL, size, 0xDE804F0AuLL);
  *a1 = (int32x2_t)malloc_type_calloc(8uLL, a1[6].u32[0], 0xD53F19F6uLL);
  a1[1] = (int32x2_t)malloc_type_calloc(8uLL, a1[6].u32[0], 0xD53F19F6uLL);
  a1[3] = (int32x2_t)malloc_type_calloc(8uLL, (a1[6].i32[0] + 63) >> 6, 0xDE804F0AuLL);
  a1[4] = (int32x2_t)malloc_type_calloc(8uLL, (a1[6].i32[0] + 63) >> 6, 0xDE804F0AuLL);
  int v5 = malloc_type_calloc(8uLL, (a1[6].i32[0] + 4095) >> 12, 0xDE804F0AuLL);
  a1[5] = (int32x2_t)v5;
  if (!*(void *)&a1[2] || !*(void *)a1 || !*(void *)&a1[1] || !*(void *)&a1[3]) {
    return 0;
  }
  if (a1[4]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

void IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::releaseAllKeys(uint64_t *a1)
{
  if (a1[2])
  {
    if (*a1)
    {
      uint64_t v2 = a1[3];
      if (v2)
      {
        if (a1[1])
        {
          unsigned int v3 = 0;
          do
          {
            unint64_t v4 = *(void *)(v2 + 8 * v3);
            uint64_t v5 = v3;
            if (v4)
            {
              uint64_t v6 = v3 << 6;
              do
              {
                unint64_t v7 = __clz(__rbit64(v4));
                v4 &= ~(1 << v7);
                uint64_t v8 = v7 + v6;
                uint64_t v9 = *a1;

                *(void *)(v9 + 8 * v8) = 0;
                --*((_DWORD *)a1 + 17);
              }
              while (v4);
              uint64_t v2 = a1[3];
              *(void *)(v2 + 8 * v5) = 0;
            }
            unsigned int v3 = v5 + 1;
          }
          while ((v5 + 1) <= *((_DWORD *)a1 + 14));
        }
      }
    }
  }
}

void sub_21C721AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if ((char *)STACK[0x1008] != &a10) {
    free((void *)STACK[0x1008]);
  }
  _Unwind_Resume(a1);
}

void sub_21C721D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((uint64_t *)STACK[0x800] != &a9) {
    free((void *)STACK[0x800]);
  }
  if ((unint64_t *)STACK[0x1008] != &STACK[0x808]) {
    free((void *)STACK[0x1008]);
  }
  if ((unint64_t *)STACK[0x1810] != &STACK[0x1010]) {
    free((void *)STACK[0x1810]);
  }
  if ((unint64_t *)STACK[0x2018] != &STACK[0x1818]) {
    free((void *)STACK[0x2018]);
  }
  _Unwind_Resume(a1);
}

void sub_21C721F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((uint64_t *)STACK[0x800] != &a9) {
    free((void *)STACK[0x800]);
  }
  if ((unint64_t *)STACK[0xC08] != &STACK[0x808]) {
    free((void *)STACK[0xC08]);
  }
  _Unwind_Resume(a1);
}

void sub_21C722140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ((uint64_t *)STACK[0x800] != &a9) {
    free((void *)STACK[0x800]);
  }
  if ((unint64_t *)STACK[0xC08] != &STACK[0x808]) {
    free((void *)STACK[0xC08]);
  }
  _Unwind_Resume(a1);
}

void IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::rehash(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 48);
  unsigned int v3 = 2 * v2;
  if (a2) {
    unsigned int v3 = a2;
  }
  do
  {
    unsigned int v4 = v2;
    v2 *= 2;
  }
  while (v4 < v3);
  operator new();
}

void IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::swap(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  *a2 = *a3;
  *a3 = v3;
  uint64_t v4 = a2[1];
  a2[1] = a3[1];
  a3[1] = v4;
  uint64_t v5 = a2[2];
  a2[2] = a3[2];
  a3[2] = v5;
  uint64_t v6 = a2[3];
  a2[3] = a3[3];
  a3[3] = v6;
  uint64_t v7 = a2[4];
  a2[4] = a3[4];
  a3[4] = v7;
  uint64_t v8 = a2[5];
  a2[5] = a3[5];
  a3[5] = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 15);
  *((_DWORD *)a2 + 15) = *((_DWORD *)a3 + 15);
  *((_DWORD *)a3 + 15) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = *((_DWORD *)a3 + 12);
  *((_DWORD *)a3 + 12) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 19);
  *((_DWORD *)a2 + 19) = *((_DWORD *)a3 + 19);
  *((_DWORD *)a3 + 19) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 13);
  *((_DWORD *)a2 + 13) = *((_DWORD *)a3 + 13);
  *((_DWORD *)a3 + 13) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 14);
  *((_DWORD *)a2 + 14) = *((_DWORD *)a3 + 14);
  *((_DWORD *)a3 + 14) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = *((_DWORD *)a3 + 16);
  *((_DWORD *)a3 + 16) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 17);
  *((_DWORD *)a2 + 17) = *((_DWORD *)a3 + 17);
  *((_DWORD *)a3 + 17) = v8;
  LODWORD(v8) = *((_DWORD *)a2 + 18);
  *((_DWORD *)a2 + 18) = *((_DWORD *)a3 + 18);
  *((_DWORD *)a3 + 18) = v8;
  uint64_t v9 = a2[10];
  a2[10] = a3[10];
  a3[10] = v9;
}

void __clang_call_terminate(void *a1)
{
}

uint64_t IOGPUGenerationalSet<objc_object *,IOGPUMTLIdKey,IOGPUMTLObjectHashAllocator>::~IOGPUGenerationalSet(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 16) = 0;
  }
  if (*(void *)a1)
  {
    free(*(void **)a1);
    *(void *)a1 = 0;
  }
  uint64_t v3 = *(void **)(a1 + 8);
  if (v3)
  {
    free(v3);
    *(void *)(a1 + 8) = 0;
  }
  uint64_t v4 = *(void **)(a1 + 24);
  if (v4)
  {
    free(v4);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    free(v5);
    *(void *)(a1 + 32) = 0;
  }
  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 40) = 0;
  }
  return a1;
}

uint64_t IOGPUNotificationQueueGetTypeID()
{
  if (IOGPUNotificationQueueGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUNotificationQueueGetTypeID_onceToken, &__block_literal_global_0);
  }
  return kIOGPUNotificationQueueID;
}

uint64_t ioGPUNotificationQueueIODispatch(uint64_t a1)
{
  data = 0;
  uint64_t v7 = 0;
  uint32_t dataSize = 16;
  for (uint64_t i = *(IODataQueueMemory **)(a1 + 32); ; uint64_t i = *(IODataQueueMemory **)(a1 + 32))
  {
    uint64_t result = IODataQueueDequeue(i, &data, &dataSize);
    if (result) {
      break;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
    uint64_t v4 = data;
    data[2](data, v7);
    _Block_release(v4);
    data = 0;
    uint64_t v7 = 0;
    uint32_t dataSize = 16;
  }
  return result;
}

dispatch_semaphore_t *IOGPUNotificationQueueDidSubmit(dispatch_semaphore_t *result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = (dispatch_semaphore_t *)CFGetTypeID(result);
    if (result == (dispatch_semaphore_t *)kIOGPUNotificationQueueID && a2 != 0)
    {
      do
      {
        uint64_t result = (dispatch_semaphore_t *)dispatch_semaphore_signal(v3[8]);
        --a2;
      }
      while (a2);
    }
  }
  return result;
}

CFStringRef ioGPUNotificationQueueCopyFormatDescription(void *a1, const __CFDictionary *a2)
{
  uint64_t v4 = a1[3];
  CFIndex v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOGPUNotificationQueue %p ID=0x%llu refcnt=%d>", a1, v4, v5);
}

CFStringRef ioGPUNotificationQueueCopyDebugDescription(void *a1)
{
  uint64_t v2 = a1[3];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, @"<IOGPUNotificationQueue %p ID=0x%llu refcnt=%d>", a1, v2, v3);
}

uint64_t IOGPUIOCommandQueueGetTypeID()
{
  if (IOGPUIOCommandQueueGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUIOCommandQueueGetTypeID_onceToken, &__block_literal_global_1);
  }
  return kIOGPUIOCommandQueueID;
}

uint64_t __IOGPUIOCommandQueueGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  kIOGPUIOCommandQueueID = result;
  return result;
}

void *IOGPUIOCommandQueueCreate(mach_port_t *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  input[2] = *MEMORY[0x263EF8340];
  if (IOGPUIOCommandQueueGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUIOCommandQueueGetTypeID_onceToken, &__block_literal_global_1);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v18) {
      IOGPUIOCommandQueueCreate_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return 0;
  }
  uint64_t v8 = (void *)Instance;
  CFRetain(a1);
  v8[2] = a1;
  v8[3] = 0;
  v8[5] = 0;
  input[0] = a3;
  input[1] = a4;
  uint32_t outputCnt = 2;
  if (IOConnectCallMethod(a1[5], 0x2Bu, input, 2u, 0, 0, output, &outputCnt, 0, 0))
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v9) {
      IOGPUIOCommandQueueCreate_cold_4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v17 = a1;
    goto LABEL_17;
  }
  *(_OWORD *)(v8 + 3) = *(_OWORD *)output;
  uint64_t v26 = (void *)IOGPUNotificationQueueCreate(a1, 0x2000u, 0x10u);
  v8[5] = v26;
  if (!v26)
  {
    BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v27) {
      IOGPUIOCommandQueueCreate_cold_2(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_16;
  }
  v37[0] = v8[3];
  v37[1] = (uint64_t)IOGPUNotificationQueueGetID(v26);
  if (IOConnectCallMethod(a1[5], 0x2Du, v37, 2u, 0, 0, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      IOGPUIOCommandQueueCreate_cold_3();
    }
LABEL_16:
    uint64_t v17 = (mach_port_t *)v8;
LABEL_17:
    CFRelease(v17);
    return 0;
  }
  return v8;
}

dispatch_queue_t *IOGPUIOCommandQueueSetDispatchQueue(dispatch_queue_t *result, NSObject *a2)
{
  if (result)
  {
    CFIndex v3 = result;
    uint64_t result = (dispatch_queue_t *)CFGetTypeID(result);
    if (result == (dispatch_queue_t *)kIOGPUIOCommandQueueID)
    {
      uint64_t v4 = (dispatch_queue_t *)v3[5];
      return IOGPUNotificationQueueSetDispatchQueue(v4, a2, 2);
    }
  }
  return result;
}

uint64_t IOGPUIOCommandQueueGetConnect(void *a1)
{
  uint64_t v1 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUIOCommandQueueID) {
    return *(unsigned int *)(a1[2] + 20);
  }
  return v1;
}

void *IOGPUIOCommandQueueGetID(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFGetTypeID(result) == kIOGPUIOCommandQueueID) {
      return (void *)v1[3];
    }
    else {
      return 0;
    }
  }
  return result;
}

void IOGPUIOCommandQueueRelease(const void *a1)
{
  if (a1 && CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
  {
    CFRelease(a1);
  }
}

void *IOGPUIOCommandQueueGetGlobalTraceObjectID(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFGetTypeID(result) == kIOGPUIOCommandQueueID) {
      return (void *)v1[4];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOGPUIOCommandQueueSubmitIOCommands(uint64_t a1, _DWORD *a2, unsigned int a3)
{
  uint64_t v3 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUIOCommandQueueID)
  {
    uint64_t v7 = *(dispatch_semaphore_t **)(a1 + 40);
    if (!v7) {
      return 3758096385;
    }
    if (!a2) {
      return v3;
    }
    if (!*a2) {
      return 3758096385;
    }
    if (a3 <= 0x2000)
    {
      size_t v17 = 24 * *a2 + 8;
      IOGPUNotificationQueueWillSubmit(v7, a3);
      uint64_t v3 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x2Eu, (const uint64_t *)(a1 + 24), 1u, a2, v17, 0, 0, 0, 0);
      if (v3)
      {
        BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
        if (v18) {
          IOGPUIOCommandQueueSubmitIOCommands_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        IOGPUNotificationQueueDidSubmit(*(dispatch_semaphore_t **)(a1 + 40), a3);
      }
    }
    else
    {
      BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      uint64_t v3 = 3758097131;
      if (v8) {
        IOGPUIOCommandQueueSubmitIOCommands_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  return v3;
}

uint64_t IOGPUIOCommandQueueCreateIOCommandBuffer(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  output[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097090;
  if (a1)
  {
    BOOL v7 = CFGetTypeID((CFTypeRef)a1) != kIOGPUIOCommandQueueID || a2 == 0;
    if (!v7 && a3 != 0)
    {
      uint32_t outputCnt = 2;
      uint64_t v3 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x2Fu, (const uint64_t *)(a1 + 24), 1u, 0, 0, output, &outputCnt, 0, 0);
      if (v3)
      {
        BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
        if (v9) {
          IOGPUIOCommandQueueCreateIOCommandBuffer_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
        }
        uint64_t v17 = 0;
        *a2 = 0;
      }
      else
      {
        CFRetain((CFTypeRef)a1);
        uint64_t v17 = output[1];
        *a2 = output[0];
      }
      *a3 = v17;
    }
  }
  return v3;
}

uint64_t IOGPUIOCommandQueueDestroyIOCommandBuffer(void *a1, unsigned int a2)
{
  input[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  if (a1 && CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
  {
    uint64_t v5 = a1[2];
    input[0] = a1[3];
    input[1] = a2;
    uint64_t v2 = IOConnectCallMethod(*(_DWORD *)(v5 + 20), 0x30u, input, 2u, 0, 0, 0, 0, 0, 0);
    if (v2)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        IOGPUIOCommandQueueDestroyIOCommandBuffer_cold_1();
      }
    }
    else
    {
      CFRelease(a1);
    }
  }
  return v2;
}

uint64_t IOGPUIOCommandQueueTryCancelIOCommandBuffer(void *a1, unsigned int a2)
{
  input[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = 3758097090;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
    {
      uint64_t v5 = a1[2];
      input[0] = a1[3];
      input[1] = a2;
      uint64_t v2 = IOConnectCallMethod(*(_DWORD *)(v5 + 20), 0x31u, input, 2u, 0, 0, 0, 0, 0, 0);
      if (v2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          IOGPUIOCommandQueueTryCancelIOCommandBuffer_cold_1();
        }
      }
    }
  }
  return v2;
}

uint64_t IOGPUIOCommandQueuePerformIO(uint64_t a1)
{
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUIOCommandQueueID) {
    return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x32u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOGPUIOCommandQueueIOCommandBufferComplete(uint64_t a1)
{
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUIOCommandQueueID) {
    return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x33u, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
  }
  else {
    return 3758097090;
  }
}

uint64_t IOGPUIOCommandQueueIOCommandBufferBarrierComplete(void *a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097090;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUIOCommandQueueID)
    {
      uint64_t v7 = a1[2];
      input[0] = a1[3];
      input[1] = a2;
      input[2] = a3;
      uint64_t v3 = IOConnectCallMethod(*(_DWORD *)(v7 + 20), 0x34u, input, 3u, 0, 0, 0, 0, 0, 0);
      if (v3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          IOGPUIOCommandQueueIOCommandBufferBarrierComplete_cold_1();
        }
      }
    }
  }
  return v3;
}

void ioGPUIOCommandQueueFinalize(uint64_t a1)
{
  kern_return_t v3;
  void block[5];

  if (_cmdq_finalize_queue_once != -1) {
    dispatch_once(&_cmdq_finalize_queue_once, &__block_literal_global_4);
  }
  uint64_t v2 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ioGPUIOCommandQueueFinalize_block_invoke_2;
    block[3] = &__block_descriptor_tmp_6;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)_cmdq_finalize_queue, block);
  }
  if (*(void *)(a1 + 24))
  {
    uint64_t v3 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x2Cu, (const uint64_t *)(a1 + 24), 1u, 0, 0, 0, 0, 0, 0);
    if (v3) {
      fprintf((FILE *)*MEMORY[0x263EF8348], "IOGPUCommandQueue delete failed with error 0x%x", v3);
    }
  }
  *(void *)(a1 + 24) = 0;
  CFRelease(*(CFTypeRef *)(a1 + 16));
}

CFStringRef ioGPUIOCommandQueueCopyFormatDescription(void *a1, const __CFDictionary *a2)
{
  uint64_t v4 = a1[3];
  CFIndex v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOGPUIOCommandQueue %p ID=0x%llu refcnt=%d>", a1, v4, v5);
}

CFStringRef ioGPUIOCommandQueueCopyDebugDescription(void *a1)
{
  uint64_t v2 = a1[3];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, @"<IOGPUIOCommandQueue %p ID=0x%llu refcnt=%d>", a1, v2, v3);
}

dispatch_queue_t __ioGPUIOCommandQueueFinalize_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.Metal.NotificationQueueCleaupQueue", 0);
  _cmdq_finalize_queue = (uint64_t)result;
  return result;
}

void __ioGPUIOCommandQueueFinalize_block_invoke_2(uint64_t a1)
{
  IOGPUNotificationQueueSetDispatchQueue(*(dispatch_queue_t **)(a1 + 32), 0, 0);
  uint64_t v2 = *(const void **)(a1 + 32);
  IOGPUNotificationQueueRelease(v2);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

uint64_t IOGPUDeviceGetTypeID()
{
  if (IOGPUDeviceGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUDeviceGetTypeID_onceToken, &__block_literal_global_4);
  }
  return kIOGPUDeviceID;
}

uint64_t IOGPUDeviceCreate(io_service_t a1)
{
  return IOGPUDeviceCreateWithAPIProperty(a1, 0, 0);
}

void IOGPUDeviceRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t IOGPUDeviceGetConfig(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v6 = 3758097090;
  if (a1 && CFGetTypeID((CFTypeRef)a1) == kIOGPUDeviceID)
  {
    uint64_t v6 = 0;
    *a2 = *(_DWORD *)(a1 + 160);
    *a3 = *(_DWORD *)(a1 + 164);
    uint64_t v13 = *(void *)(a1 + 176);
    *a4 = *(void *)(a1 + 168);
    *a5 = v13;
    *a6 = *(_DWORD *)(a1 + 184);
  }
  return v6;
}

uint64_t IOGPUDeviceGetName(mach_port_t *a1, char *a2, size_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = 3758097090;
  size_t v8 = 64;
  if (a1)
  {
    if (CFGetTypeID(a1) == kIOGPUDeviceID)
    {
      uint64_t v3 = IOConnectCallStructMethod(a1[5], 1u, 0, 0, outputStruct, &v8);
      if (!v3) {
        strncpy(a2, outputStruct, a3);
      }
    }
  }
  return v3;
}

uint64_t IOGPUDeviceTraceEventStart()
{
  return kdebug_trace();
}

uint64_t IOGPUDeviceTraceEventEnd()
{
  return kdebug_trace();
}

uint64_t IOGPUDeviceGetCurrentTraceFilter(mach_port_t *a1)
{
  uint64_t v1 = 3758097090;
  size_t v4 = 8;
  if (a1 && CFGetTypeID(a1) == kIOGPUDeviceID)
  {
    uint64_t outputStruct = 0;
    return IOConnectCallMethod(a1[5], 3u, 0, 0, 0, 0, 0, 0, &outputStruct, &v4);
  }
  return v1;
}

void *IOGPUDeviceSetWaitForGPUCallback(uint64_t a1, void *aBlock)
{
  dispatch_queue_t result = _Block_copy(aBlock);
  *(void *)(a1 + 112) = result;
  return result;
}

uint64_t IOGPUDeviceGetMemoryData(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long outputStruct = 0u;
  size_t outputStructCnt = 48;
  uint64_t result = IOConnectCallStructMethod(*(_DWORD *)(a1 + 20), 0x16u, 0, 0, &outputStruct, &outputStructCnt);
  if (!result)
  {
    if (a2) {
      *a2 = outputStruct;
    }
    if (a3) {
      *a3 = *((void *)&outputStruct + 1);
    }
    if (a4) {
      *a4 = v16;
    }
    if (a5) {
      *a5 = *((void *)&v16 + 1);
    }
    if (a6) {
      *a6 = v17;
    }
    if (a7) {
      *a7 = *((void *)&v17 + 1);
    }
  }
  return result;
}

uint64_t IOGPUDeviceGetAppGPURole(uint64_t a1, int a2, _DWORD *a3)
{
  input[1] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097088;
  if (a1)
  {
    mach_port_t v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      uint64_t output = 0;
      input[0] = a2;
      uint32_t outputCnt = 1;
      uint64_t result = IOConnectCallScalarMethod(v5, 0x23u, input, 1u, &output, &outputCnt);
      if (!result) {
        *a3 = output;
      }
    }
  }
  return result;
}

uint64_t IOGPUDeviceSetDisplayParams(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t result = 3758097088;
  if (a1)
  {
    mach_port_t v5 = *(_DWORD *)(a1 + 20);
    if (v5)
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x21u, input, 2u, 0, 0);
    }
  }
  return result;
}

uint64_t IOGPUDeviceCreateVNIODesc(_DWORD *cf, int a2, _DWORD *a3, void *a4)
{
  *(void *)&uint64_t input[5] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097088;
  input[0] = a2;
  if (cf)
  {
    if (cf[5])
    {
      if (CFGetTypeID(cf) == kIOGPUDeviceID)
      {
        uint64_t v4 = 3758097090;
        if (a3)
        {
          if (a4)
          {
            uint32_t outputCnt = 2;
            uint64_t v4 = IOConnectCallMethod(cf[5], 0x29u, (const uint64_t *)input, 1u, 0, 0, (uint64_t *)&input[1], &outputCnt, 0, 0);
            if (v4)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                IOGPUDeviceCreateVNIODesc_cold_1();
              }
              uint64_t v8 = 0;
              *a3 = 0;
            }
            else
            {
              uint64_t v8 = *(void *)&input[3];
              *a3 = input[1];
            }
            *a4 = v8;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t IOGPUDeviceDestroyVNIODesc(_DWORD *cf, int a2)
{
  uint64_t v2 = 3758097088;
  LODWORD(input) = a2;
  if (cf && cf[5] && CFGetTypeID(cf) == kIOGPUDeviceID) {
    return IOConnectCallMethod(cf[5], 0x2Au, &input, 1u, 0, 0, 0, 0, 0, 0);
  }
  return v2;
}

uint64_t IOGPUDeviceCreateDeviceAssertion(_DWORD *cf, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097088;
  if (cf)
  {
    if (cf[5])
    {
      if (CFGetTypeID(cf) == kIOGPUDeviceID)
      {
        input[0] = a2;
        input[1] = a3;
        uint64_t output = 0;
        uint32_t outputCnt = 1;
        uint64_t v4 = IOConnectCallScalarMethod(cf[5], 0x37u, input, 2u, &output, &outputCnt);
        if (!v4) {
          *a4 = output;
        }
      }
    }
  }
  return v4;
}

void ioGPUDeviceFinalize(uint64_t a1)
{
  _Block_release(*(const void **)(a1 + 112));
  *(void *)(a1 + 112) = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v3 = v2 == (void *)(a1 + 24);
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    free(v2);
  }
  IOConnectRelease(*(_DWORD *)(a1 + 20));
  *(_DWORD *)(a1 + 20) = 0;
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
  uint64_t v7 = *(void **)(a1 + 128);
  mach_port_t v5 = (void *)(a1 + 128);
  uint64_t v6 = v7;
  if (v7)
  {
    uint64_t v8 = (void (**)(uint64_t, void, void, void, void, void))MEMORY[0x263EF8360];
    uint64_t v9 = (unsigned int *)MEMORY[0x263EF8960];
    do
    {
      uint64_t v10 = (void *)v6[2];
      if (*v8) {
        (*v8)(1677721632, *v9, *v6, *((unsigned int *)v6 + 2), 0, 0);
      }
      uint64_t v11 = (void *)*v5;
      uint64_t v12 = v5;
      if ((void *)*v5 != v6)
      {
        do
        {
          uint64_t v13 = v11;
          uint64_t v11 = (void *)v11[2];
        }
        while (v11 != v6);
        uint64_t v12 = v13 + 2;
      }
      *uint64_t v12 = v6[2];
      free(v6);
      uint64_t v6 = v10;
    }
    while (v10);
  }
  os_unfair_lock_unlock(v4);
}

CFStringRef ioGPUDeviceCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4 = a1[5];
  CFIndex v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOGPUDevice %p connect=%08x refcnt=%d>", a1, v4, v5);
}

CFStringRef ioGPUDeviceCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2 = a1[5];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, @"<IOGPUDevice %p connect=%08x refcnt=%d>", a1, v2, v3);
}

void _eventMisused()
{
}

void IOGPUKillClient_LeakingCommandQueue()
{
}

uint64_t IOGPUCommandQueueGetTypeID()
{
  if (IOGPUCommandQueueGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUCommandQueueGetTypeID_onceToken, &__block_literal_global_5);
  }
  return kIOGPUCommandQueueID;
}

mach_port_t *IOGPUCommandQueueCreate(mach_port_t *a1)
{
  return IOGPUCommandQueueCreateWithQoS(a1, 2, 0);
}

uint64_t IOGPUCommandQueueSetQualityOfService(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x1Cu, (const uint64_t *)(a1 + 24), 1u, inputStruct, 4uLL, 0, 0, 0, 0);
}

void IOGPUCommandQueueDispatchAvailableCompletionNotifications(uint64_t a1)
{
}

uint64_t IOGPUCommandQueueSetResourceGroups(uint64_t a1, uintptr_t p2, uintptr_t a3)
{
  uintptr_t v4 = *(void *)(a1 + 24);
  io_connect_t v5 = *(_DWORD *)(*(void *)(a1 + 16) + 20);
  if (p2 <= 1) {
    a3 = *(unsigned int *)a3;
  }
  return IOConnectTrap3(v5, 7u, v4, p2, a3);
}

CFStringRef ioGPUCommandQueueCopyFormatDescription(void *a1, const __CFDictionary *a2)
{
  uint64_t v4 = a1[3];
  CFIndex v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOGPUCommandQueue %p ID=0x%llu refcnt=%d>", a1, v4, v5);
}

CFStringRef ioGPUCommandQueueCopyDebugDescription(void *a1)
{
  uint64_t v2 = a1[3];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, @"<IOGPUCommandQueue %p ID=0x%llu refcnt=%d>", a1, v2, v3);
}

uint64_t IOGPUResourceGetTypeID()
{
  if (IOGPUResourceGetTypeID_onceToken != -1) {
    dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
  }
  return kIOGPUResourceID;
}

uint64_t IOGPUResourceGetDataSize(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t IOGPUResourceGetGPUVirtualAddressLength(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t IOGPUResourceGetPrivate(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 16) + 52)) {
    return a1 + 112;
  }
  else {
    return 0;
  }
}

void *IOGPUResourceGetClientSharedPrivate(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (IOGPUResourceGetTypeID_onceToken != -1) {
      dispatch_once(&IOGPUResourceGetTypeID_onceToken, &__block_literal_global_6);
    }
    if (v2 == kIOGPUResourceID && *(_DWORD *)(v1[2] + 44)) {
      return (void *)(v1[9] + 128);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOGPUResourceTestEvent(uint64_t a1, unsigned int a2)
{
  return IOGPUDeviceTestEventFast(*(void *)(a1 + 16), (_DWORD *)(*(void *)(a1 + 72) + ((unint64_t)a2 << 6)));
}

CFTypeID IOGPUResourceFinishEvent(uint64_t a1, unsigned int a2)
{
  uintptr_t v3 = a2;
  CFTypeID result = IOGPUDeviceTestEventFast(*(void *)(a1 + 16), (_DWORD *)(*(void *)(a1 + 72) + ((unint64_t)a2 << 6)));
  if (a1)
  {
    if (!result)
    {
      CFTypeID result = CFGetTypeID((CFTypeRef)a1);
      if (result == kIOGPUResourceID)
      {
        uintptr_t v5 = *(unsigned int *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 16);
        uint64_t v7 = *(void *)(v6 + 112);
        if (v7)
        {
          (*(void (**)(void))(v7 + 16))();
          uint64_t v6 = *(void *)(a1 + 16);
        }
        io_connect_t v8 = *(_DWORD *)(v6 + 20);
        return IOConnectTrap2(v8, 2u, v5, v3);
      }
    }
  }
  return result;
}

uint64_t IOGPUResourceCheckSysMem(uint64_t a1, int a2)
{
  if ((*(unsigned char *)(a1 + 52) & 0x80) != 0) {
    return IOGPUDeviceTestEventFast(*(void *)(a1 + 16), (_DWORD *)(*(void *)(a1 + 72) + ((unint64_t)(a2 == 0) << 6)));
  }
  else {
    return 1;
  }
}

CFTypeID IOGPUResourceFinishSysMem(CFTypeID result, int a2)
{
  if ((*(unsigned char *)(result + 52) & 0x80) != 0) {
    return IOGPUResourceFinishEvent(result, a2 == 0);
  }
  return result;
}

uint64_t IOGPUResourceSetOwnerIdentity(uint64_t a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x263EF8340];
  input[0] = *(unsigned int *)(a1 + 48);
  input[1] = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x24u, input, 2u, 0, 0);
}

IOSurfaceRef IOGPUResourceCreateIOSurface(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t input[3] = *MEMORY[0x263EF8340];
  input[0] = *(unsigned int *)(a1 + 48);
  input[1] = a2;
  uint64_t input[2] = a3;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  IOSurfaceRef v3 = 0;
  if (!IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x25u, input, 3u, &output, &outputCnt))
  {
    IOSurfaceRef v3 = IOSurfaceLookupFromMachPort(output);
    mach_port_mod_refs(*MEMORY[0x263EF8960], output, 0, -1);
  }
  return v3;
}

unint64_t IOGPUResourceGroupUpdateResources(uint64_t a1, uintptr_t p2, unsigned int *p3, uintptr_t a4, void *a5)
{
  uintptr_t v5 = (uintptr_t)p3;
  unint64_t v6 = p2;
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (p2 > 0x100 || a4 > 0x100)
  {
    if (!a4) {
      goto LABEL_27;
    }
    if (a4 > 0x100)
    {
      uint64_t input = *(unsigned int *)(a1 + 48);
      uintptr_t v42 = a4;
      uint64_t v22 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x36u, &input, 2u, a5, 8 * a4, 0, 0, 0, 0);
    }
    else
    {
      if (a4 == 1)
      {
        unint64_t v10 = *a5;
        uintptr_t v11 = HIDWORD(*a5);
      }
      else
      {
        unint64_t v10 = 0;
        uintptr_t v11 = 0;
      }
      io_connect_t v23 = *(_DWORD *)(*(void *)(a1 + 16) + 20);
      if (a4 <= 1) {
        a5 = (void *)v10;
      }
      uint64_t v22 = IOConnectTrap4(v23, 5u, *(unsigned int *)(a1 + 48), a4, (uintptr_t)a5, v11);
    }
    uint64_t v24 = v22;
    if (v22 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      IOGPUResourceGroupUpdateResources_cold_3(v24, v25, v26, v27, v28, v29, v30, v31);
      if (!v6) {
        return v6;
      }
    }
    else
    {
LABEL_27:
      if (!v6) {
        return v6;
      }
    }
    if (v6 > 0x100)
    {
      uint64_t input = *(unsigned int *)(a1 + 48);
      uintptr_t v42 = v6;
      unint64_t v32 = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x35u, &input, 2u, (const void *)v5, 4 * v6, 0, 0, 0, 0);
    }
    else
    {
      if (v6 == 1) {
        uintptr_t v5 = *(unsigned int *)v5;
      }
      unint64_t v32 = IOConnectTrap3(*(_DWORD *)(*(void *)(a1 + 16) + 20), 4u, *(unsigned int *)(a1 + 48), v6, v5);
    }
    unint64_t v6 = v32;
    if (v32 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      IOGPUResourceGroupUpdateResources_cold_2(v6, v33, v34, v35, v36, v37, v38, v39);
    }
  }
  else
  {
    if (a4 == 1)
    {
      unint64_t v8 = *a5;
      uint64_t v9 = HIDWORD(*a5);
    }
    else
    {
      unint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    uintptr_t v12 = p2;
    if (p2)
    {
      if (p2 == 1) {
        uintptr_t v12 = *p3;
      }
      else {
        uintptr_t v12 = (uintptr_t)p3;
      }
    }
    uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 16) + 20);
    if (a4 <= 1) {
      uint64_t v14 = (void *)v8;
    }
    else {
      uint64_t v14 = a5;
    }
    unint64_t v6 = MEMORY[0x21D4AE5D0](v13, 6, *(unsigned int *)(a1 + 48), p2, v12, a4, v14, v9);
    if (v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      IOGPUResourceGroupUpdateResources_cold_1(v6, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  return v6;
}

unint64_t IOGPUResourceGroupGetAllocationSize(uint64_t a1)
{
  return atomic_load(*(unint64_t **)(a1 + 72));
}

uint64_t IOGPUResourceDetachBacking(uint64_t a1)
{
  input[1] = *MEMORY[0x263EF8340];
  input[0] = *(unsigned int *)(a1 + 48);
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x26u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOGPUResourceReplaceBackingWithBytes(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a1 + 48);
  inputStruct[1] = a2;
  inputStruct[0] = v3;
  inputStruct[2] = a3;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x27u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t IOGPUResourceReplaceBackingWithRanges(uint64_t a1, uint64_t a2, uint64_t a3, char a4, int a5, void *a6)
{
  output[1] = *MEMORY[0x263EF8340];
  unsigned int v8 = *(_DWORD *)(a1 + 48);
  inputStruct[1] = a2;
  uint32_t outputCnt = 1;
  inputStruct[0] = v8;
  if (a5) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  BYTE4(inputStruct[0]) = v9 | a4;
  inputStruct[2] = a3;
  uint64_t result = IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x28u, 0, 0, inputStruct, 0x18uLL, output, &outputCnt, 0, 0);
  if (result) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = a5 == 0;
  }
  if (!v11) {
    *a6 = output[0];
  }
  return result;
}

CFStringRef ioGPUResourceCopyFormatDescription(unsigned int *a1, const __CFDictionary *a2)
{
  uint64_t v4 = a1[12];
  CFIndex v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, @"<IOGPUResource %p id=%08x refcnt=%d>", a1, v4, v5);
}

CFStringRef ioGPUResourceCopyDebugDescription(unsigned int *a1)
{
  uint64_t v2 = a1[12];
  CFIndex v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, 0, @"<IOGPUResource %p id=%08x refcnt=%d>", a1, v2, v3);
}

uint64_t IOGPUDeviceTestEventFast(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unsigned int v3 = *a2 | 0x8000;
  unsigned int v4 = __clz(__rbit32(v3));
  uint64_t result = 1;
  if (v4 != 15)
  {
    while (1)
    {
      int v6 = a2[v4 + 1];
      if (v6 << 24 != -16777216 && (int)((v6 & 0xFFFFFF00) - **(_DWORD **)(v2 + 8 * (char)v6)) > 0) {
        break;
      }
      v3 ^= 1 << v4;
      unsigned int v4 = __clz(__rbit32(v3));
      if (v4 >= 0xF) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t IOGPUResourceListAddResourceNoThreshold(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned int *)(a2 + 16);
  unint64_t v4 = (0x9E3779B97F4A7C15 * v3) >> -*(unsigned char *)(a1 + 488);
  unsigned int v5 = *(_DWORD *)(*(void *)(a1 + 456) + 4 * v4);
  do
  {
    if (!v5) {
      return _ioGPUResourceListAddResourceEntry(a1, a2, a3, 1);
    }
    unsigned int v6 = __clz(__rbit32(v5));
    v5 &= ~(1 << v6);
    uint64_t v7 = (v6 + v4) & (*(_DWORD *)(a1 + 480) - 1);
    uint64_t v8 = *(void *)(a1 + 472);
    unint64_t v9 = *(void *)(v8 + 8 * v7);
  }
  while ((*(_DWORD *)(v8 + 8 * v7) & 0xFFFFFF) != v3);
  int v10 = (unsigned __int16)(HIWORD(v9) | a3);
  if (v10 != HIWORD(v9))
  {
    *(void *)(v8 + 8 * v7) = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
    *(_WORD *)(*(void *)(a1 + 512) + (((v9 >> 27) & 0x1FFFFF) << 6) + 2 * ((v9 >> 24) & 7) + 48) = HIWORD(v9) | a3;
    unint64_t v9 = v9 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 48);
  }
  return (v9 >> 24) & 0xFFFFFF;
}

BOOL IOGPUResourceListMerge(uint64_t a1, uint64_t a2)
{
  return _ioGPUResourceListMergeGroup(a1, a2 + 32, *(_DWORD *)(a2 + 28));
}

BOOL _ioGPUResourceListMergeGroup(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v5 = 0;
    BOOL v6 = 0;
    uint64_t v7 = a2;
    unint64_t v8 = a3;
    while (1)
    {
      uint64_t v9 = a2 + (v5 << 6);
      uint64_t v10 = *(unsigned __int16 *)(v9 + 62);
      if (*(_WORD *)(v9 + 62)) {
        break;
      }
LABEL_7:
      ++v5;
      v7 += 64;
      BOOL v6 = v5 >= v8;
      if (v5 == v8) {
        return 1;
      }
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v16 = 0;
      uintptr_t v12 = (_DWORD *)(v7 + 4 * v11);
      LODWORD(v16) = *v12;
      uint64_t v13 = (v12[6] << 10);
      v15[0] = 0;
      v15[1] = v13;
      if (IOGPUResourceListAddResource(a1, (uint64_t)v15, *(unsigned __int16 *)(v7 + 2 * v11 + 48)) == -1) {
        break;
      }
      if (v10 == ++v11) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    return 1;
  }
  return v6;
}

BOOL IOGPUResourceListMergeLists(uint64_t a1, uint64_t a2)
{
  return _ioGPUResourceListMergeGroup(a1, *(void *)(a2 + 512), *(_DWORD *)(a2 + 544));
}

uint64_t IOGPUResourceListShowResources(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 544);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(result + 512);
    uint64_t v4 = v3;
    do
    {
      uint64_t v5 = v3 + (v2 << 6);
      uint64_t v6 = *(unsigned __int16 *)(v5 + 62);
      if (*(_WORD *)(v5 + 62))
      {
        uint64_t v7 = 0;
        do
        {
          uint64_t result = printf("Resource at %d(%d,%d) is %08x\n", (8 * v2) | v7, v2, v7, *(_DWORD *)(v4 + 4 * v7));
          ++v7;
        }
        while (v6 != v7);
      }
      ++v2;
      v4 += 64;
    }
    while (v2 != v1);
  }
  return result;
}

void ioGPUResourceListRebuild(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unsigned int v1 = *(_DWORD *)(a1 + 480);
  unsigned int v2 = 2 * v1;
  *(_DWORD *)(a1 + 480) = 2 * v1;
  ++*(_DWORD *)(a1 + 488);
  *(_DWORD *)(a1 + 484) = 2 * v1 - 1;
  *(_DWORD *)(a1 + 496) = ((v1 >> 5) & 0x3FFFFFF) - 1;
  if (((2 * v1) & 0x80000000) != 0)
  {
LABEL_18:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "ioGPUResourceListRebuild() failed.  Hash limit reached", buf, 2u);
    }
    abort();
  }
  while (1)
  {
    uint64_t v4 = *(void **)(a1 + 456);
    if (*(_DWORD *)(a1 + 492) >= v2)
    {
      bzero(v4, 4 * v2);
      bzero(*(void **)(a1 + 464), (unint64_t)*(unsigned int *)(a1 + 480) >> 3);
    }
    else
    {
      free(v4);
      free(*(void **)(a1 + 472));
      free(*(void **)(a1 + 464));
      *(void *)(a1 + 456) = malloc_type_calloc(*(unsigned int *)(a1 + 480), 4uLL, 0x100004052888210uLL);
      *(void *)(a1 + 472) = malloc_type_malloc(8 * *(unsigned int *)(a1 + 480), 0x100004000313F17uLL);
      *(void *)(a1 + 464) = malloc_type_calloc((unint64_t)*(unsigned int *)(a1 + 480) >> 3, 1uLL, 0x95E4CA4AuLL);
      *(_DWORD *)(a1 + 492) = *(_DWORD *)(a1 + 480);
    }
    uint64_t v17 = *(unsigned int *)(a1 + 544);
    if (!v17) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v6 = *(_DWORD **)(a1 + 512);
    uint64_t v7 = (unsigned __int16 *)(v6 + 12);
    uint64_t v18 = v6;
    while (!HIWORD(v18[16 * v5 + 15]))
    {
LABEL_11:
      ++v5;
      v6 += 16;
      v7 += 32;
      if (v5 == v17) {
        return;
      }
    }
    uint64_t v8 = 0;
    unint64_t v9 = (unint64_t)HIWORD(v18[16 * v5 + 15]) << 24;
    uint64_t v10 = v7;
    uint64_t v11 = v6;
    while (1)
    {
      int v12 = *v11++;
      uint64_t v13 = v12 & 0xFFFFFF;
      unsigned int v14 = *v10++;
      if ((ioGPUResourceListAddHashValue(a1, v13 | ((unint64_t)v14 << 48) | ((v5 << 27) | v8) & 0xFFFFFF000000) & 1) == 0)break; {
      v8 += 0x1000000;
      }
      if (v9 == v8) {
        goto LABEL_11;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      int v16 = *(_DWORD *)(a1 + 480);
      *(_DWORD *)buf = 67109376;
      int v20 = v16;
      __int16 v21 = 1024;
      int v22 = 2 * v16;
      _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "intermediate rebuild failed, trying larger hash table %d -> %d...\n", buf, 0xEu);
    }
    unsigned int v15 = *(_DWORD *)(a1 + 480);
    unsigned int v2 = 2 * v15;
    *(_DWORD *)(a1 + 480) = 2 * v15;
    ++*(_DWORD *)(a1 + 488);
    *(_DWORD *)(a1 + 484) = 2 * v15 - 1;
    *(_DWORD *)(a1 + 496) = ((v15 >> 5) & 0x3FFFFFF) - 1;
    if (((2 * v15) & 0x80000000) != 0) {
      goto LABEL_18;
    }
  }
}

void IOGPUMetalSuballocatorDestroy(IOGPUMetalSuballocator *a1)
{
  if (!a1) {
    IOGPUMetalSuballocatorDestroy_cold_1();
  }
  IOGPUMetalSuballocator::~IOGPUMetalSuballocator(a1);
  free(v1);
}

void IOGPUMetalSuballocator::~IOGPUMetalSuballocator(IOGPUMetalSuballocator *this)
{
  for (uint64_t i = 2728; i != -88; i -= 88)
    IOGPUMetalSuballocatorHeap::~IOGPUMetalSuballocatorHeap((IOGPUMetalSuballocatorHeap *)((char *)this + i));
}

void IOGPUMetalSuballocatorHeap::~IOGPUMetalSuballocatorHeap(IOGPUMetalSuballocatorHeap *this)
{
  for (uint64_t i = *(void *)this; i != *((void *)this + 1); i += 64)
  {
    if (*(_DWORD *)(i + 48)) {
      __assert_rtn("~IOGPUMetalSuballocatorHeap", "IOGPUMetalSuballocator.mm", 97, "false && \"At least one suballocation was not freed before suballocator is destroyed, primary buffer is leaked!\"");
    }
  }
  std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy((uint64_t)this + 48, *((void **)this + 7));
  uint64_t v3 = (void *)*((void *)this + 3);
  if (v3)
  {
    *((void *)this + 4) = v3;
    free(v3);
  }
  uint64_t v4 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v4;
    free(v4);
  }
}

void std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,short>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,short>,std::less<unsigned int>,true>,IOGPUMetalSuballocatorHeap::Allocator<std::__value_type<unsigned int,short>>>::destroy(a1, a2[1]);
    free(a2);
  }
}

void sub_21C72B0C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *__p,uint64_t a37)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v39 = *(void **)(v37 - 216);
  if (v39)
  {
    *(void *)(v37 - 208) = v39;
    operator delete(v39);
  }
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_64c66_ZTSNSt3__16vectorI24IOGPUIODecompressionArgsNS_9allocatorIS1_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  unsigned int v2 = (void *)(a1 + 64);
  v2[2] = 0;
  return std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(v2, *(const void **)(a2 + 64), *(void *)(a2 + 72), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 72) - *(void *)(a2 + 64)) >> 3));
}

void __destroy_helper_block_e8_64c66_ZTSNSt3__16vectorI24IOGPUIODecompressionArgsNS_9allocatorIS1_EEEE(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(void *)(a1 + 72) = v2;
    operator delete(v2);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<IOGPUIODecompressionArgs>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void *std::vector<IOGPUIODecompressionArgs>::__init_with_size[abi:ne180100]<IOGPUIODecompressionArgs*,IOGPUIODecompressionArgs*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<IOGPUIODecompressionArgs>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21C72C8C4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<IOGPUIODecompressionArgs>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<NSObject *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOGPUIODecompressionArgs>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void IOGPUMetalCommandBufferStorageGrowSegmentList_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUMetalCommandBufferStorageGrowSegmentList_cold_2(uint64_t *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = *((_DWORD *)a1 + 2);
  int v3 = *((_DWORD *)a1 + 3);
  int v4 = 136315906;
  uint64_t v5 = "IOGPUMetalCommandBufferStorageGrowSegmentList";
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  __int16 v8 = 1024;
  int v9 = v2;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: failed to allocate shmem for the segmentList {commandBufferID: 0x%llx, segmentCount: %u, reserved:%u}", (uint8_t *)&v4, 0x22u);
}

void _iogpuMetalCommandBufferStorageFree_cold_1()
{
}

void _iogpuMetalCommandBufferStorageFree_cold_2()
{
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_1()
{
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_2()
{
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_3()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 348, "storage->kernelCommandBufferEnd >= storage->kernelCommandBufferStart");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_4()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 349, "storage->kernelCommandBufferCurrent >= storage->kernelCommandBufferStart");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_5(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(uint64_t **)(a1 + 120);
  uint64_t v2 = *v1;
  int v3 = *((_DWORD *)v1 + 2);
  LODWORD(v1) = *((_DWORD *)v1 + 3);
  int v4 = 136316162;
  uint64_t v5 = "IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer";
  __int16 v6 = 2048;
  uint64_t v7 = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = (int)v1;
  __int16 v12 = 1024;
  int v13 = 0;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: failed to allocate shmem to grow commandBuffer {commandBufferID: 0x%llx, segmentCount: %u, reserved:%u}, 0x%x bytes failed to be allocated", (uint8_t *)&v4, 0x28u);
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_6()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 385, "bytes_allocated >= new_space_required");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_7()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer", "IOGPUMetalCommandBufferStorage.m", 390, "NULL != lastkernelCommandBufferResource->_virtualAddress");
}

void IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer_cold_8()
{
}

void IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_1()
{
}

void IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_2(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "IOGPUMetalCommandBufferStorageAllocResourceAtIndex";
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: failed to allocate pooled resource at dbClass: %d", (uint8_t *)&v1, 0x12u);
}

void IOGPUMetalCommandBufferStorageAllocResourceAtIndex_cold_3()
{
}

void IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUMetalCommandBufferStorageGrowDebugBuffer_cold_2()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: failed to allocate shmem for the enhanced error debug buffer {commandBufferID: 0x%llx}", (uint8_t *)v0, 0x16u);
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_1()
{
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_2()
{
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_3()
{
}

void IOGPUMetalCommandBufferStorageAllocSidebandBuffer_cold_4()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageAllocSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1117, "storage->sidebandBuffer.shmem == nil");
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_1()
{
  __assert_rtn("IOGPUMetalCommandBufferStorageGrowSidebandBuffer", "IOGPUMetalCommandBufferStorage.m", 1143, "storage->sidebandBuffer.shmem != nil");
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUMetalCommandBufferStorageGrowSidebandBuffer_cold_3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "%s: failed to allocate shmem for the sideband buffer {commandBufferID: 0x%llx}", (uint8_t *)v0, 0x16u);
}

void _updateResidencySets_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "IOGPUCommandQueueSetResourceGroups() failed: %08x", (uint8_t *)v1, 8u);
}

void IOGPUNotificationQueueCreate_cold_1()
{
}

void IOGPUNotificationQueueSetDispatchQueue_cold_1()
{
  __assert_rtn("IOGPUNotificationQueueSetDispatchQueue", "IOGPUNotificationQueue.c", 207, "notificationQueueRef->dispatchMach == NULL");
}

void IOGPUNotificationQueueSetDispatchQueue_cold_2()
{
  __assert_rtn("IOGPUNotificationQueueSetDispatchQueue", "IOGPUNotificationQueue.c", 206, "notificationQueueRef->dispatchQueue == NULL");
}

void ioGPUNotificationQueueFinalize_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "IOGPUNotificationQueue delete failed with error 0x%x", (uint8_t *)v1, 8u);
}

void ioGPUNotificationQueueFinalize_cold_2()
{
}

void ioGPUNotificationQueueFinalize_cold_3()
{
}

void IOGPUIOCommandQueueCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUIOCommandQueueCreate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUIOCommandQueueCreate_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, v0, "Failed to set Notification Queue for IO Command Queue: %08x", v1, v2, v3, v4, v5);
}

void IOGPUIOCommandQueueCreate_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUIOCommandQueueSubmitIOCommands_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUIOCommandQueueSubmitIOCommands_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUIOCommandQueueCreateIOCommandBuffer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IOGPUIOCommandQueueDestroyIOCommandBuffer_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, v0, "Failed to Destroy IO Command Buffer: 0x%08x", v1, v2, v3, v4, v5);
}

void IOGPUIOCommandQueueTryCancelIOCommandBuffer_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, v0, "Failed to Try Cancel IO Command Buffer: 0x%08x", v1, v2, v3, v4, v5);
}

void IOGPUIOCommandQueueIOCommandBufferBarrierComplete_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, v0, "Failed to Complete Barrier for IO Command Buffer: 0x%08x", v1, v2, v3, v4, v5);
}

void IOGPUMetalPooledResourceRelease_cold_1()
{
}

void IOGPUDeviceCreateWithAPIProperty_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to create an IOAccelDevice... IOServiceOpen returned kIOReturn(0x%X)", (uint8_t *)v1, 8u);
}

void IOGPUDeviceGetNextGlobalTraceID_cold_1()
{
  __assert_rtn("getNextGIDGroup", "IOGPUDeviceRef.c", 428, "0 != gid_group_data.gid_group_min");
}

void IOGPUDeviceCheckAndLogSoftFaultCount_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "GPU Soft Fault count: %lld\n", (uint8_t *)&v1, 0xCu);
}

void IOGPUDeviceCreateVNIODesc_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to create VNIO object", v0, 2u);
}

void IOGPUCommandQueueCreateWithQoS_cold_1()
{
}

void IOGPUCommandQueueCreateWithQoS_cold_2()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to create an a notification queue for cmd queue", v0, 2u);
}

void IOGPUCommandQueueCreateWithQoS_cold_3(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_21C70C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Failed to set notification queue for cmd queue: %08x", (uint8_t *)v1, 8u);
}

void IOGPUResourceGroupUpdateResources_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, a3, "Group Update Resources Failed = 0x%X", a5, a6, a7, a8, 0);
}

void IOGPUResourceGroupUpdateResources_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, a3, "Group Add Resources Failed = 0x%X", a5, a6, a7, a8, 0);
}

void IOGPUResourceGroupUpdateResources_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21C70C000, &_os_log_internal, a3, "Group Remove Resources Failed = 0x%X", a5, a6, a7, a8, 0);
}

void ioGPUResourceFinalize_cold_1()
{
}

void IOGPUResourceListReset_cold_1()
{
}

void IOGPUResourceListReset_cold_2()
{
  __assert_rtn("IOGPUResourceListReset", "IOGPUResourceList.m", 531, "(uint8_t *)&l->resourceGroups[l->capacity] <= storage->segmentListEnd");
}

void IOGPUMetalSuballocatorDestroy_cold_1()
{
}

void IOGPUMetalSuballocatorAllocate_cold_1()
{
}

void IOGPUMetalSuballocatorFree_cold_1()
{
}

void IOGPUMetalSuballocatorFree_cold_2()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 426, "record->bufferOffset + record->length <= kBufferSize && \"Bad buffer offset\"");
}

void IOGPUMetalSuballocatorFree_cold_3()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 428, "record->bufferIndex >= 0 && record->bufferIndex < kMaxNumBuffers && \"Bad buffer index\"");
}

void IOGPUMetalSuballocatorFree_cold_4()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 427, "record->heapIndex >= 0 && record->heapIndex < kNumHeaps && \"Bad heap index\"");
}

void IOGPUMetalSuballocatorFree_cold_5()
{
  __assert_rtn("IOGPUMetalSuballocatorFree", "IOGPUMetalSuballocator.mm", 425, "record->length > 0 && record->length <= kBufferSize && \"Bad buffer length\"");
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectRelease(io_connect_t connect)
{
  return MEMORY[0x270EF3F60](*(void *)&connect);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectTrap1(io_connect_t connect, uint32_t index, uintptr_t p1)
{
  return MEMORY[0x270EF3F88](*(void *)&connect, *(void *)&index, p1);
}

kern_return_t IOConnectTrap2(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2)
{
  return MEMORY[0x270EF3F90](*(void *)&connect, *(void *)&index, p1, p2);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x270EF3F98](*(void *)&connect, *(void *)&index, p1, p2, p3);
}

kern_return_t IOConnectTrap4(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4)
{
  return MEMORY[0x270EF3FA0](*(void *)&connect, *(void *)&index, p1, p2, p3, p4);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x270EF3FB0](*(void *)&connect, *(void *)&index, p1, p2, p3, p4, p5, p6);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49E0](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C08](buffer);
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x270EF4C10]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CA0](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetElementHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D10](buffer);
}

uint64_t IOSurfaceGetGraphicsCommPageAddress()
{
  return MEMORY[0x270EF4D38]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D88](buffer);
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E30](*(void *)&port);
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  return MEMORY[0x270EF4E68](buffer, *(void *)&newState, oldState);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

uint64_t MTLAddDevice()
{
  return MEMORY[0x270EF5DF8]();
}

uint64_t MTLCPUCacheModeString()
{
  return MEMORY[0x270EF5E00]();
}

uint64_t MTLCalculateSourceBufferSizeAndAlignment()
{
  return MEMORY[0x270EF5E08]();
}

uint64_t MTLGetDisallowedTextureUsagesWhenSwizzling()
{
  return MEMORY[0x270EF5E78]();
}

uint64_t MTLGetEnvDefault()
{
  return MEMORY[0x270EF5E80]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x270EF5EA0]();
}

uint64_t MTLHazardTrackingModeString()
{
  return MEMORY[0x270EF5EA8]();
}

uint64_t MTLIOQosClassForPriority()
{
  return MEMORY[0x270EF5EB8]();
}

uint64_t MTLPackColor()
{
  return MEMORY[0x270EF5EC0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x270EF5EF0]();
}

uint64_t MTLPurgeableStateString()
{
  return MEMORY[0x270EF5EF8]();
}

uint64_t MTLRangeAllocatorAllocate()
{
  return MEMORY[0x270EF5F00]();
}

uint64_t MTLRangeAllocatorAllocateRange()
{
  return MEMORY[0x270EF5F08]();
}

uint64_t MTLRangeAllocatorDeallocate()
{
  return MEMORY[0x270EF5F10]();
}

uint64_t MTLRangeAllocatorDestroy()
{
  return MEMORY[0x270EF5F18]();
}

uint64_t MTLRangeAllocatorGetFreeSize()
{
  return MEMORY[0x270EF5F20]();
}

uint64_t MTLRangeAllocatorGetMaxFreeSize()
{
  return MEMORY[0x270EF5F28]();
}

uint64_t MTLRangeAllocatorInit()
{
  return MEMORY[0x270EF5F30]();
}

uint64_t MTLRangeAllocatorInitWithStartRange()
{
  return MEMORY[0x270EF5F38]();
}

uint64_t MTLReleaseAssertionFailure()
{
  return MEMORY[0x270EF5F50]();
}

uint64_t MTLReportFailure()
{
  return MEMORY[0x270EF5F58]();
}

uint64_t MTLResourceListAddResource()
{
  return MEMORY[0x270EF5F68]();
}

uint64_t MTLResourceListPoolCreateResourceList()
{
  return MEMORY[0x270EF5F70]();
}

uint64_t MTLResourceListRelease()
{
  return MEMORY[0x270EF5F78]();
}

uint64_t MTLResourceOptionsString()
{
  return MEMORY[0x270EF5F80]();
}

uint64_t MTLStorageModeString()
{
  return MEMORY[0x270EF5F90]();
}

uint64_t MTLTextureSwizzleChannelsToKey()
{
  return MEMORY[0x270EF5F98]();
}

uint64_t MTLTextureSwizzleString()
{
  return MEMORY[0x270EF5FA8]();
}

uint64_t MTLTextureTypeString()
{
  return MEMORY[0x270EF5FB0]();
}

uint64_t MTLTextureUsageString()
{
  return MEMORY[0x270EF5FB8]();
}

uint64_t MTLValidationEnabled()
{
  return MEMORY[0x270EF5FD8]();
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
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

uint64_t _mtlValidateArgumentsForTextureViewOnDevice()
{
  return MEMORY[0x270EF6080]();
}

uint64_t _mtlValidateMTLTextureSwizzleKey()
{
  return MEMORY[0x270EF6088]();
}

uint64_t _mtlValidateStrideTextureParameters()
{
  return MEMORY[0x270EF6090]();
}

uint64_t _mtlValidateTextureUsage()
{
  return MEMORY[0x270EF6098]();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x270ED93C8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x270ED93D0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x270ED93D8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x270ED93F8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t kdebug_trace_string()
{
  return MEMORY[0x270ED9F58]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

uint64_t mach_right_send_release()
{
  return MEMORY[0x270EDA260]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x270EDAC18](*(void *)&t, x);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}