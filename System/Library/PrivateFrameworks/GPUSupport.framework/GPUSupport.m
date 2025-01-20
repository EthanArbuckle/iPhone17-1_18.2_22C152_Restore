void gpusLoadTransformFeedbackBuffers(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  if (!*(void *)(a1 + 816))
  {
    v2 = malloc_type_zone_malloc(*(malloc_zone_t **)(*(void *)a1 + 232), 0x28uLL, 0x1357CB10uLL);
    if (!v2) {
      abort();
    }
    *(void *)(a1 + 816) = v2;
  }
  v3 = 0;
  while (1)
  {
    v4 = *(void *)(*(void *)(a1 + 40) + v3 + 376);
    if (!v4 || !**(_DWORD **)(v4 + 8)) {
      goto LABEL_9;
    }
    if (!(*(unsigned int (**)(void, uint64_t, void))(*(void *)(a1 + 8) + 320))(*(void *)(a1 + 16), v4, **(_DWORD **)(v4 + 8)))break; {
    **(_DWORD **)(v4 + 8) = 0;
    }
LABEL_9:
    *(void *)(*(void *)(a1 + 816) + v3) = v4;
    v3 += 8;
    if (v3 == 40) {
      return;
    }
  }
  malloc_zone_free(*(malloc_zone_t **)(*(void *)a1 + 232), *(void **)(a1 + 816));
  *(void *)(a1 + 816) = 0;
}

uint64_t gldCreateBuffer(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 128), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  (*(void (**)(void *, void *))(a1[1] + 128))(a1, v8);
  *a2 = v9;
  return 0;
}

BOOL gldLoadBuffer(uint64_t a1, uint64_t a2)
{
  v2 = *(unsigned char **)(a2 + 8);
  uint64_t v3 = *v2;
  if (*v2)
  {
    if (!*(unsigned char *)(a1 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)), v6 = *(unsigned char **)(a2 + 8), uint64_t v3 = *v6, *v6))
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 320))(a1, a2, v3))
      {
        LODWORD(v3) = 0;
        **(_DWORD **)(a2 + 8) = 0;
      }
    }
    if (*(unsigned char *)(a1 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    }
  }
  return v3 == 0;
}

uint64_t gldDestroyBuffer(void *a1, void *a2)
{
  (*(void (**)(void))(a1[1] + 136))();
  v4 = (_OWORD *)a2[2];
  if (v4)
  {
    gldDestroyMemoryPlugin((uint64_t)a1, v4);
    a2[2] = 0;
  }
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
  return 0;
}

uint64_t gldDestroyMemoryPlugin(uint64_t a1, _OWORD *a2)
{
  if (*(void *)a2)
  {
    if (*(unsigned char *)(a1 + 288)) {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    }
    gpusWaitResource();
    IOAccelResourceRelease();
    *a2 = 0u;
    a2[1] = 0u;
    if (*(unsigned char *)(a1 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    }
  }
  (*(void (**)(uint64_t, _OWORD *))(*(void *)(a1 + 8) + 152))(a1, a2);
  malloc_zone_free(*(malloc_zone_t **)(*(void *)a1 + 232), a2);
  return 0;
}

uint64_t gldUnbindBuffer(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a2 + 16);
    if (v2)
    {
      uint64_t v3 = *(void *)(v2 + 16);
      if (v3)
      {
        if (*(_DWORD *)(v3 + 24) != 1) {
          return (*(uint64_t (**)(void))(*(void *)(result + 8) + 472))();
        }
      }
    }
  }
  return result;
}

void gldRestoreBufferData(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[2];
  if (!v2) {
    return;
  }
  uint64_t v3 = *(void *)(v2 + 8);
  if (!v3) {
    return;
  }
  if (*(unsigned char *)(a1 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    uint64_t v2 = a2[2];
    uint64_t v3 = *(void *)(v2 + 8);
  }
  v6 = *(unsigned __int16 **)(v2 + 16);
  CFTypeRef v7 = *(CFTypeRef *)v2;
  CFRetain(*(CFTypeRef *)v2);
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  if (v3)
  {
    int v8 = *(_DWORD *)(v3 + 260);
    if (v8 == 128)
    {
      int v9 = *v6;
      if ((v6[6] & 1 & ~v9) != 0) {
        unsigned __int16 *v6 = v6[6] & 1 | v9;
      }
      if (!*(unsigned char *)(*a2 + 29)) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    if (v8 == 192)
    {
      if (v6[6] & ~*v6)
      {
        IOAccelResourcePageoff();
        goto LABEL_17;
      }
LABEL_16:
      IOAccelResourceFinishEvent();
    }
  }
LABEL_17:
  CFRelease(v7);
}

uint64_t gpusGetKernelBufferResource(void *a1, uint64_t a2, int a3, unint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, int a8, uint64_t a9)
{
  v16 = *(_OWORD **)(a2 + 16);
  if (!v16)
  {
    v23 = 0;
    gldCreateMemoryPlugin(a1, &v23);
    v16 = v23;
    *(void *)(a2 + 16) = v23;
  }
  _OWORD *v16 = 0u;
  v16[1] = 0u;
  *(void *)(a9 + 80) = a4;
  *(void *)(a9 + 88) = a7;
  *(void *)(a9 + 64) = a5;
  *(void *)(a9 + 72) = a6;
  if (a7 >= a4) {
    __int16 v17 = a4;
  }
  else {
    __int16 v17 = a7;
  }
  *(_WORD *)(a9 + 8) = v17;
  *(_DWORD *)(a9 + 10) = 65537;
  *(void *)(a9 + 16) = a4;
  *(void *)(a9 + 24) = a7;
  *(_DWORD *)a9 = a3;
  *(_DWORD *)(a9 + 4) = a8;
  *(void *)(a9 + 32) = 16777473;
  uint64_t v18 = IOAccelResourceCreate();
  **(void **)(a2 + 16) = v18;
  if (v18)
  {
    uint64_t ClientShared = IOAccelResourceGetClientShared();
    uint64_t v20 = *(void *)(a2 + 16);
    *(void *)(v20 + 8) = ClientShared;
    uint64_t v21 = 1;
    *(unsigned char *)(*(void *)(v20 + 16) + 28) = 1;
    *(void *)(*(void *)(a2 + 16) + 24) = IOAccelResourceGetDataBytes();
  }
  else
  {
    uint64_t v21 = 0;
  }
  IOAccelResourceRelease();
  return v21;
}

uint64_t gldCreateMemoryPlugin(void *a1, void *a2)
{
  v4 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 152), 0xD68DC258uLL);
  if (!v4) {
    abort();
  }
  v5 = v4;
  (*(void (**)(void *, void *))(a1[1] + 144))(a1, v4);
  *a2 = v5;
  return 0;
}

void gldGetMemoryPlugin(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a2 + 16);
    *(void *)(a2 + 16) = 0;
    *a3 = v3;
    if (v3)
    {
      **(_DWORD **)(a2 + 8) |= 1u;
      uint64_t v4 = *(void *)(v3 + 8);
      if (v4)
      {
        if (*(_DWORD *)(v4 + 260) == 192)
        {
          uint64_t v5 = *(void *)(v3 + 16);
          if (*(_DWORD *)(v5 + 24) == 1)
          {
            *(_WORD *)uint64_t v5 = 0;
            *(_WORD *)(v5 + 12) = 0;
          }
        }
      }
    }
  }
}

void gldSetMemoryPlugin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a3 + 8);
    uint64_t v3 = *(void *)(a3 + 16);
    *(void *)(a2 + 16) = a3;
    if (v3)
    {
      *(unsigned char *)(v3 + 28) = 1;
      if (*(_DWORD *)(v4 + 260) == 192)
      {
        *(_WORD *)(v3 + 12) = 0;
        *(_WORD *)uint64_t v3 = 0;
      }
      **(_DWORD **)(a2 + 8) &= ~1u;
    }
  }
}

uint64_t gldFlushMemoryPlugin(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 24) != 1) {
      return (*(uint64_t (**)(void))(*(void *)(result + 8) + 472))();
    }
  }
  return result;
}

uint64_t gldTestMemoryPlugin(uint64_t a1, uint64_t *a2)
{
  if (*a2) {
    return gpusCheckResource(*a2, 0);
  }
  else {
    return 1;
  }
}

uint64_t gldBufferSubData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v10 = (unsigned char *)a2[1];
  uint64_t v11 = *v10;
  if (*v10 && !*(unsigned char *)(*a2 + 31))
  {
    uint64_t v12 = *(void *)(a1 + 16);
    if (!*(unsigned char *)(v12 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(v12 + 48)), v13 = (unsigned char *)a2[1], uint64_t v11 = *v13, *v13))
    {
      if ((*(unsigned int (**)(void, void *, uint64_t))(*(void *)(a1 + 8) + 320))(*(void *)(a1 + 16), a2, v11))
      {
        LODWORD(v11) = 0;
        *(_DWORD *)a2[1] = 0;
      }
    }
    uint64_t v14 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v14 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 48));
    }
  }
  if (v11) {
    return 0;
  }
  v16 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 432);
  return v16(a1, a2, a3, a4, a5);
}

uint64_t gldCopyBufferSubData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v12 = **(_DWORD **)(a2 + 8);
  int v13 = **(_DWORD **)(a3 + 8);
  if (v13 | v12)
  {
    uint64_t v14 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v14 + 288))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v14 + 48));
      LOBYTE(v12) = **(unsigned char **)(a2 + 8);
    }
    if ((_BYTE)v12
      && (*(unsigned int (**)(void, uint64_t, void))(*(void *)(a1 + 8) + 320))(*(void *)(a1 + 16), a2, v12))
    {
      LOBYTE(v12) = 0;
      **(_DWORD **)(a2 + 8) = 0;
    }
    int v13 = **(unsigned __int8 **)(a3 + 8);
    if ((_BYTE)v12) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = v13 == 0;
    }
    if (!v15
      && (*(unsigned int (**)(void, uint64_t, void))(*(void *)(a1 + 8) + 320))(*(void *)(a1 + 16), a3, **(unsigned __int8 **)(a3 + 8)))
    {
      LOBYTE(v13) = 0;
      **(_DWORD **)(a3 + 8) = 0;
    }
    uint64_t v16 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v16 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v16 + 48));
    }
  }
  if (v13 | v12) {
    return 0;
  }
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 440);
  return v18(a1, a2, a3, a4, a5, a6);
}

uint64_t gpumUpdateUniformBuffers(void *a1)
{
  uint64_t v2 = 0;
  while (1)
  {
    uint64_t v3 = *(void **)(a1[5] + 8 * v2 + 328);
    if (!v3) {
      goto LABEL_20;
    }
    uint64_t v4 = *v3;
    uint64_t v5 = *(unsigned int *)(*v3 + 60);
    if ((int)v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 4 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1[5] + 8 * *(int *)(*v3 + v6 + 64) + 528);
        if (v8 && **(unsigned char **)(v8 + 8))
        {
          uint64_t result = (*(uint64_t (**)(void, uint64_t))(a1[1] + 320))(a1[2], v8);
          if (!result) {
            return result;
          }
          **(_DWORD **)(v8 + 8) = 0;
        }
        v6 += 4;
      }
      while (v7 != v6);
      uint64_t v4 = *v3;
    }
    uint64_t v10 = *(unsigned int *)(v4 + 28);
    if (!v10) {
      goto LABEL_20;
    }
    if (*(_DWORD *)(v4 + 24)) {
      return 0;
    }
    if ((*(unsigned char *)(v3[1] + 64) & 8) != 0 && (int)v10 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 8 * v10;
      do
      {
        uint64_t v13 = *(void *)(*(void *)(v3[1] + 40) + v11);
        if (**(unsigned char **)(v13 + 8))
        {
          uint64_t result = (*(uint64_t (**)(void, void))(a1[1] + 320))(a1[2], *(void *)(*(void *)(v3[1] + 40) + v11));
          if (!result) {
            return result;
          }
          **(_DWORD **)(v13 + 8) = 0;
        }
        v11 += 8;
      }
      while (v12 != v11);
    }
LABEL_20:
    if (++v2 == 5) {
      return 1;
    }
  }
}

uint64_t gldGetBufferAllocationIdentifiers(uint64_t result, _DWORD *a2)
{
  *a2 = 0;
  uint64_t v2 = *(uint64_t **)(result + 16);
  if (v2)
  {
    uint64_t result = *v2;
    if (*v2) {
      return IOAccelResourceCreateAllocationIdentifierSet();
    }
  }
  return result;
}

void gpus_ReturnContextErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnObjectErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnTextureErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnCmdBufferErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnTokenErrorKillClient()
{
  MEMORY[1] = -559038737;
}

void gpus_ReturnNotPermittedKillClient()
{
  MEMORY[1] = -559038737;
}

uint64_t gpus_ReturnUnexpectedKillClient(uint64_t result)
{
  MEMORY[1] = result;
  return result;
}

void gpus_ReturnGuiltyForHardwareRestart()
{
  MEMORY[1] = -559038737;
}

void gpusGenerateCrashLog(uint64_t a1, int a2, uint64_t a3)
{
  if ((a2 & 0x20000000) != 0)
  {
    gpus_ReturnGuiltyForHardwareRestart();
  }
  else
  {
    switch((int)a3)
    {
      case -5:
        gpus_ReturnTokenErrorKillClient();
        break;
      case -4:
        gpus_ReturnCmdBufferErrorKillClient();
        break;
      case -3:
        gpus_ReturnTextureErrorKillClient();
        break;
      case -2:
        gpus_ReturnObjectErrorKillClient();
        break;
      case -1:
        gpus_ReturnContextErrorKillClient();
        break;
      default:
        if (a3 == -536870174) {
          gpus_ReturnNotPermittedKillClient();
        }
        else {
          gpus_ReturnUnexpectedKillClient(a3);
        }
        break;
    }
  }
}

uint64_t gpumCreateComputeContext()
{
  return 10015;
}

uint64_t gpumDestroyComputeContext()
{
  return 10015;
}

uint64_t gpumCompCreateFence(void *a1, void *a2)
{
  uint64_t v4 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, 0x18uLL, 0xD68DC258uLL);
  if (!v4) {
    abort();
  }
  uint64_t v5 = v4;
  unint64_t v6 = a1[145];
  unint64_t v7 = v6 >> 5;
  if ((v6 >> 5))
  {
    uint64_t v8 = 0;
    uint64_t v9 = (v6 >> 5);
    while (1)
    {
      unsigned int v10 = *(_DWORD *)(a1[144] + 4 * v8);
      if (v10 != -1) {
        break;
      }
      if (v9 == ++v8) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    LODWORD(v8) = 0;
    unsigned int v10 = 0;
  }
  if (v8 == v7)
  {
LABEL_9:
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v4);
    uint64_t v5 = 0;
    uint64_t result = 10016;
  }
  else
  {
    for (int i = 0; i != 32; ++i)
    {
      if (((v10 >> i) & 1) == 0) {
        break;
      }
    }
    uint64_t result = 0;
    *(_DWORD *)(a1[144] + 4 * v8) |= 1 << i;
    v5[4] = i + 32 * v8;
    *((unsigned char *)v5 + 20) = 1;
  }
  *a2 = v5;
  return result;
}

void *__abort_malloc_zone_calloc(malloc_zone_t *a1, size_t size)
{
  uint64_t result = malloc_type_zone_calloc(a1, 1uLL, size, 0xD68DC258uLL);
  if (!result) {
    abort();
  }
  return result;
}

uint64_t gpumCompTestFence(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = *(unsigned char *)(a2 + 20);
  if (v2) {
    return v2;
  }
  if (!*(_DWORD *)(*(void *)(a1 + 1128) + 16 * *(unsigned int *)(a2 + 16)))
  {
    unsigned __int8 v2 = IOAccelDeviceTestEvent();
    *(unsigned char *)(a2 + 20) = v2;
    return v2;
  }
  return 0;
}

uint64_t gpumCompFinishFence(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 20)) {
    return 1;
  }
  if (!*(_DWORD *)(*(void *)(a1 + 1128) + 16 * *(unsigned int *)(a2 + 16)))
  {
    char v4 = IOAccelDeviceTestEvent();
    if ((v4 & 0xFE) == 0) {
      char v4 = 1;
    }
    *(unsigned char *)(a2 + 20) = v4;
    return 1;
  }
  return 0;
}

void gpumCompDestroyFence(void *a1, unsigned int *a2)
{
  *(_DWORD *)(a1[144] + (((unint64_t)a2[4] >> 3) & 0x1FFFFFFC)) &= ~(1 << a2[4]);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a2);
}

BOOL gpumCompGetFenceStatus(uint64_t a1, uint64_t a2, int *a3)
{
  int v4 = gpumCompTestFence(a1, a2);
  BOOL v5 = v4 == 0;
  BOOL result = v4 != 0;
  if (v5) {
    int v7 = 3;
  }
  else {
    int v7 = 1;
  }
  *a3 = v7;
  return result;
}

uint64_t gpumCompGetFenceProfilingInfo()
{
  return 0;
}

uint64_t gldCreateQueue(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  int v7 = *(uint64_t **)(a1 + 8);
  uint64_t v8 = *v7;
  uint64_t v9 = malloc_type_zone_calloc(*(malloc_zone_t **)(*v7 + 232), 1uLL, *(void *)(*v7 + 160), 0xD68DC258uLL);
  if (!v9) {
    abort();
  }
  uint64_t v10 = (uint64_t)v9;
  void *v9 = v8;
  v9[1] = v7;
  v9[2] = a1;
  v9[3] = a4;
  *((_DWORD *)v9 + 8) = 0;
  uint64_t v11 = IOAccelCLContextCreate();
  *(void *)(v10 + 40) = v11;
  if (!v11) {
    goto LABEL_19;
  }
  *(void *)(v10 + 1104) = 0;
  if (MEMORY[0x230F45850](v11, v10 + 1104, v10 + 1112)
    || MEMORY[0x230F45840](*(void *)(v10 + 40), v10 + 1136, v10 + 1152, v10 + 1120, v10 + 1128))
  {
LABEL_18:
    IOAccelCLContextRelease();
LABEL_19:
    malloc_zone_free(*(malloc_zone_t **)(v8 + 232), (void *)v10);
    return 10015;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  unint64_t v12 = *(void *)(v10 + 1128);
  *(void *)(v10 + 1168) = v12 >> 6;
  vm_size_t v13 = 24 * (v12 >> 6);
  uint64_t v14 = (uint64_t *)(v10 + 1184);
  *(void *)(v10 + 1200) = v13;
  *(void *)(v10 + 1192) = v13;
  *(_DWORD *)(v10 + 1208) = -2001041176;
  *(unsigned char *)(v10 + 1212) = 0;
  *(_DWORD *)(v10 + 1240) = -1;
  BOOL v15 = (unsigned int *)MEMORY[0x263EF8960];
  if (vm_allocate(*MEMORY[0x263EF8960], (vm_address_t *)(v10 + 1184), v13, 1))
  {
LABEL_17:
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    goto LABEL_18;
  }
  *(void *)(v10 + 1144) = *(void *)(v10 + 1184);
  uint64_t v16 = (void **)(v10 + 1176);
  if (gldCreateBuffer((void *)a1, (void *)(v10 + 1176), v10 + 1184, v10 + 1240))
  {
    uint64_t v17 = *v15;
    uint64_t v18 = *(void *)(v10 + 1184);
    uint64_t v19 = *(void *)(v10 + 1200);
LABEL_16:
    MEMORY[0x230F45C50](v17, v18, v19);
    goto LABEL_17;
  }
  int v20 = ((uint64_t (*)(uint64_t))v7[40])(a1);
  uint64_t v21 = (uint64_t)*v16;
  if (!v20)
  {
    gldDestroyBuffer((void *)a1, (void *)v21);
    uint64_t v17 = *v15;
    uint64_t v18 = *(void *)(v10 + 1184);
LABEL_15:
    uint64_t v19 = *(void *)(v10 + 1192);
    goto LABEL_16;
  }
  **(_DWORD **)(v21 + 8) = 0;
  *(_DWORD *)(v10 + 1084) = 16;
  if (gpusQueueSubmitDataBuffers(v10))
  {
    if (*v16) {
      gldDestroyBuffer((void *)a1, *v16);
    }
    uint64_t v18 = *v14;
    if (!*v14) {
      goto LABEL_17;
    }
    uint64_t v17 = *v15;
    goto LABEL_15;
  }
  *(void *)(v10 + 1160) = __abort_malloc_zone_calloc(*(malloc_zone_t **)(v8 + 232), (*(void *)(v10 + 1168) >> 3) & 0x1FFFFFFFFFFFFFFCLL);
  ++*(_DWORD *)(a1 + 292);
  *(unsigned char *)(a1 + 288) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  ((void (*)(uint64_t))v7[6])(v10);
  uint64_t result = 0;
  *a2 = v10;
  return result;
}

uint64_t gpusQueueSubmitDataBuffers(uint64_t a1)
{
  int v15 = 0;
  if (*(_DWORD *)(a1 + 1084))
  {
    unint64_t v2 = 0;
    uint64_t v3 = (_DWORD *)(a1 + 100);
    do
    {
      *v3 += *(v3 - 9) - *(v3 - 13);
      MEMORY[0x230F45880](*(void *)(a1 + 40), v2);
      *(void *)(v3 - 3) = 0;
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 1084));
  }
  uint64_t v4 = MEMORY[0x230F45890](*(void *)(a1 + 40), *(unsigned int *)(a1 + 1072), a1 + 1076, &v15);
  if (!v4)
  {
    if ((*(_DWORD *)(a1 + 1076) & 0x20000000) != 0)
    {
      BOOL v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
    }
    else
    {
      if (!v15) {
        goto LABEL_10;
      }
      BOOL v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
    }
    v5();
  }
LABEL_10:
  int v6 = MEMORY[0x230F45820](*(void *)(a1 + 40));
  *(_DWORD *)(a1 + 1084) = v6;
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = (void *)(a1 + 56);
    do
    {
      v8[4] = MEMORY[0x230F45830](*(void *)(a1 + 40), v7);
      uint64_t DataBytes = IOAccelResourceGetDataBytes();
      *(v8 - 1) = DataBytes;
      uint64_t DataSize = IOAccelResourceGetDataSize();
      uint64_t v11 = *(v8 - 1);
      void *v8 = DataBytes + DataSize - 128;
      v8[1] = v11;
      v8[2] = IOAccelResourceGetClientShared();
      IOAccelContextAddResource();
      *(void *)((char *)v8 + 44) = 0x100000000;
      ++v7;
      v8 += 8;
    }
    while (v7 < *(unsigned int *)(a1 + 1084));
  }
  *(_DWORD *)(a1 + 1072) = 0;
  unint64_t v12 = *(unsigned int **)(a1 + 1104);
  uint64_t v13 = *v12;
  *((void *)v12 + 2) = 131328;
  *(void *)(a1 + 1096) = &v12[v13 - 28];
  *(void *)(a1 + 1088) = v12 + 6;
  return v4;
}

uint64_t gldDestroyQueue(void *a1)
{
  (*(void (**)(void))(a1[1] + 56))();
  gldDestroyBuffer((void *)a1[2], (void *)a1[147]);
  MEMORY[0x230F45C50](*MEMORY[0x263EF8960], a1[148], a1[149]);
  IOAccelCLContextRelease();
  unint64_t v2 = (void *)a1[145];
  if (v2) {
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v2);
  }
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), a1);
  return 0;
}

uint64_t gldCreateComputeModule(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 168), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  uint64_t v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  (*(void (**)(void *, void *))(a1[1] + 160))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldDestroyComputeModule(void *a1, void *a2)
{
  return 0;
}

uint64_t gldCreateComputeProgram(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 176), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  uint64_t v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  (*(void (**)(void *, void *))(a1[1] + 176))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldDestroyComputeProgram(void *a1, void *a2)
{
  return 0;
}

uint64_t gldCreateKernel(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v12 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 184), 0xD68DC258uLL);
  if (!v12) {
    abort();
  }
  uint64_t v13 = v12;
  *unint64_t v12 = a4;
  v12[1] = a5;
  v12[2] = a6;
  (*(void (**)(void *, uint64_t, void *))(a1[1] + 192))(a1, a2, v12);
  *a3 = v13;
  return 0;
}

uint64_t gldDestroyKernel(void *a1, uint64_t a2, void *a3)
{
  return 0;
}

uint64_t gpusComputeSubmitDataBuffers(uint64_t a1)
{
  int v16 = 0;
  if (*(_DWORD *)(a1 + 1076))
  {
    unint64_t v2 = 0;
    uint64_t v3 = (_DWORD *)(a1 + 92);
    do
    {
      *v3 += *(v3 - 9) - *(v3 - 13);
      MEMORY[0x230F45880](*(void *)(a1 + 32), v2);
      *(void *)(v3 - 3) = 0;
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 1076));
  }
  uint64_t v4 = MEMORY[0x230F45890](*(void *)(a1 + 32), *(unsigned int *)(a1 + 1064), a1 + 1068, &v16);
  if (v4)
  {
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  int v15 = *(_DWORD *)(a1 + 1068);
  if ((v15 & 0x68000000) != 0)
  {
    if ((v15 & 0x8000000) != 0)
    {
      BOOL v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    BOOL v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
    goto LABEL_6;
  }
LABEL_7:
  int v6 = MEMORY[0x230F45820](*(void *)(a1 + 32));
  *(_DWORD *)(a1 + 1076) = v6;
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = (void *)(a1 + 48);
    do
    {
      v8[4] = MEMORY[0x230F45830](*(void *)(a1 + 32), v7);
      uint64_t DataBytes = IOAccelResourceGetDataBytes();
      *(v8 - 1) = DataBytes;
      uint64_t DataSize = IOAccelResourceGetDataSize();
      uint64_t v11 = *(v8 - 1);
      void *v8 = DataBytes + DataSize - 128;
      v8[1] = v11;
      v8[2] = IOAccelResourceGetClientShared();
      IOAccelContextAddResource();
      *(void *)((char *)v8 + 44) = 0x100000000;
      ++v7;
      v8 += 8;
    }
    while (v7 < *(unsigned int *)(a1 + 1076));
  }
  *(_DWORD *)(a1 + 1064) = 0;
  unint64_t v12 = *(unsigned int **)(a1 + 1096);
  uint64_t v13 = *v12;
  *((void *)v12 + 2) = 131328;
  *(void *)(a1 + 1088) = &v12[v13 - 28];
  *(void *)(a1 + 1080) = v12 + 6;
  return v4;
}

uint64_t gpusComputeGetDataBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x230F45870](*(void *)(a1 + 32));
  if (!v4)
  {
    uint64_t v5 = a1 + ((unint64_t)a2 << 6);
    *(_DWORD *)(v5 + 92) += *(_DWORD *)(v5 + 56) - *(_DWORD *)(v5 + 40);
    *(void *)(v5 + 80) = MEMORY[0x230F45830](*(void *)(a1 + 32), a2);
    uint64_t DataBytes = IOAccelResourceGetDataBytes();
    *(void *)(v5 + 40) = DataBytes;
    uint64_t DataSize = IOAccelResourceGetDataSize();
    uint64_t v8 = *(void *)(v5 + 40);
    *(void *)(v5 + 48) = DataBytes + DataSize - 128;
    *(void *)(v5 + 56) = v8;
    *(void *)(v5 + 64) = IOAccelResourceGetClientShared();
    IOAccelContextAddResource();
    ++*(_DWORD *)(v5 + 96);
  }
  return v4;
}

uint64_t gpusQueueGetDataBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x230F45870](*(void *)(a1 + 40));
  if (!v4)
  {
    uint64_t v5 = a1 + ((unint64_t)a2 << 6);
    *(_DWORD *)(v5 + 100) += *(_DWORD *)(v5 + 64) - *(_DWORD *)(v5 + 48);
    *(void *)(v5 + 88) = MEMORY[0x230F45830](*(void *)(a1 + 40), a2);
    uint64_t DataBytes = IOAccelResourceGetDataBytes();
    *(void *)(v5 + 48) = DataBytes;
    uint64_t DataSize = IOAccelResourceGetDataSize();
    uint64_t v8 = *(void *)(v5 + 48);
    *(void *)(v5 + 56) = DataBytes + DataSize - 128;
    *(void *)(v5 + 64) = v8;
    *(void *)(v5 + 72) = IOAccelResourceGetClientShared();
    IOAccelContextAddResource();
    ++*(_DWORD *)(v5 + 104);
  }
  return v4;
}

uint64_t gldCreateContext(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v12 = *(uint64_t **)(a1 + 8);
  uint64_t v13 = *v12;
  *a2 = 0;
  uint64_t result = ((uint64_t (*)(uint64_t *, uint64_t))v12[31])(v12, a3);
  if (!result)
  {
    int v15 = *(_DWORD *)(a3 + 52);
    int v16 = *((_DWORD *)v12 + 149);
    if ((v16 & v15) != 0 && (v15 & ~v16) == 0)
    {
      uint64_t v17 = malloc_type_zone_calloc(*(malloc_zone_t **)(v13 + 232), 1uLL, *(void *)(v13 + 80), 0xD68DC258uLL);
      if (!v17) {
        abort();
      }
      uint64_t v18 = v17;
      __CFSetLastAllocationEventName();
      uint64_t v19 = IOAccelGLContextCreate();
      v18[8] = v19;
      if (v19)
      {
        v18[271] = 0;
        if (MEMORY[0x230F45990](v19, v18 + 271, v18 + 272)
          || MEMORY[0x230F45980](v18[8], v18 + 275, v18 + 276, v18 + 273, v18 + 274)
          || (v18[278] = v18[274] >> 6,
              *((_DWORD *)v18 + 537) = 16,
              v18[1] = v12,
              gpusSubmitDataBuffers((uint64_t)v18)))
        {
          IOAccelGLContextRelease();
          malloc_zone_free(*(malloc_zone_t **)(v13 + 232), v18);
          return 10015;
        }
        else
        {
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
          unsigned int v20 = *(_DWORD *)(a1 + 292) + 1;
          *(_DWORD *)(a1 + 292) = v20;
          if (v20 >= 3)
          {
            *(unsigned char *)(a1 + 288) = 1;
            glgSetTakeLock();
          }
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
          *((_DWORD *)v18 + 20) = *(_DWORD *)(a1 + 296);
          v18[11] = v12[98];
          v18[277] = __abort_malloc_zone_calloc_0(*(malloc_zone_t **)(v13 + 232), (v18[278] >> 3) & 0x1FFFFFFFFFFFFFFCLL);
          if ((MEMORY[0xFFFFFC020] & 0x20) != 0)
          {
            char v21 = 64;
          }
          else if ((MEMORY[0xFFFFFC020] & 0x40) != 0)
          {
            char v21 = 0x80;
          }
          else
          {
            char v21 = 32;
          }
          *((unsigned char *)v18 + 72) = v21;
          v18[19] = glgCreateProcessor();
          *uint64_t v18 = v13;
          v18[1] = v12;
          v18[2] = a1;
          v18[3] = a5;
          v18[5] = a6;
          *((unsigned char *)v18 + 2366) = 1;
          *((unsigned char *)v18 + 2363) = 1;
          *((_DWORD *)v18 + 28) = 3;
          ((void (*)(void *, uint64_t))v12[4])(v18, a3);
          if ((v18[10] & 0x80) != 0) {
            int v22 = 1;
          }
          else {
            int v22 = 3;
          }
          *(_DWORD *)(a4 + 120) = v22;
          ((void (*)(void *, uint64_t, uint64_t))v12[32])(v18, a4, a3);
          uint64_t result = 0;
          v18[4] = a4;
          *a2 = v18;
        }
      }
      else
      {
        return 10004;
      }
    }
    else
    {
      return 10006;
    }
  }
  return result;
}

void *__abort_malloc_zone_calloc_0(malloc_zone_t *a1, size_t size)
{
  uint64_t result = malloc_type_zone_calloc(a1, 1uLL, size, 0xD68DC258uLL);
  if (!result) {
    abort();
  }
  return result;
}

uint64_t gpusSubmitDataBuffers(uint64_t a1)
{
  uint64_t v14 = 0;
  if (*(_DWORD *)(a1 + 2148))
  {
    unint64_t v2 = 0;
    uint64_t v3 = (_DWORD *)(a1 + 1164);
    do
    {
      *v3 += *(v3 - 9) - *(v3 - 13);
      MEMORY[0x230F459D0](*(void *)(a1 + 64), v2);
      *(void *)(v3 - 3) = 0;
      ++v2;
      v3 += 16;
    }
    while (v2 < *(unsigned int *)(a1 + 2148));
  }
  uint64_t v4 = MEMORY[0x230F459E0](*(void *)(a1 + 64), *(unsigned int *)(a1 + 2136), a1 + 2140, (char *)&v14 + 4, &v14, a1 + 2144);
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  int v13 = *(_DWORD *)(a1 + 2140);
  if ((v13 & 0x6C000000) != 0)
  {
    if ((v13 & 0x8000000) != 0)
    {
      *(unsigned char *)(a1 + 76) = 2;
      if (!no_crash_upon_reset && !*(unsigned char *)(a1 + 77))
      {
        uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
        goto LABEL_6;
      }
    }
    else if ((v13 & 0x20000000) != 0)
    {
      *(unsigned char *)(a1 + 76) = 1;
    }
  }
  else if (HIDWORD(v14))
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 8) + 504);
    goto LABEL_6;
  }
LABEL_7:
  int v6 = MEMORY[0x230F45960](*(void *)(a1 + 64));
  *(_DWORD *)(a1 + 2148) = v6;
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = (void *)(a1 + 1164);
    do
    {
      *(void *)((char *)v8 - 12) = MEMORY[0x230F45970](*(void *)(a1 + 64), v7);
      uint64_t DataBytes = IOAccelResourceGetDataBytes();
      *(void *)((char *)v8 - 52) = DataBytes;
      *(void *)((char *)v8 - 44) = DataBytes + IOAccelResourceGetDataSize() - 128;
      *(void *)((char *)v8 - 36) = *(void *)((char *)v8 - 52);
      *(void *)((char *)v8 - 28) = IOAccelResourceGetClientShared();
      IOAccelContextAddResource();
      void *v8 = 0x100000000;
      v8 += 8;
      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 2148));
  }
  *(_DWORD *)(a1 + 2136) = 0;
  uint64_t v10 = *(unsigned int **)(a1 + 2168);
  uint64_t v11 = *v10;
  *((void *)v10 + 2) = 131328;
  *(void *)(a1 + 2160) = &v10[v11 - 28];
  *(void *)(a1 + 2152) = v10 + 6;
  return v4;
}

uint64_t gldDestroyContext(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    if (!*(unsigned char *)(v2 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(v2 + 48)), v4 = a1[2], (uint64_t v3 = *(void *)(v4 + 24)) != 0))
    {
      do
      {
        gpuiCleanContextFromProgram((uint64_t)a1, v3);
        uint64_t v3 = *(void *)(v3 + 32);
      }
      while (v3);
      uint64_t v4 = a1[2];
    }
    if (*(unsigned char *)(v4 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 48));
    }
  }
  gpuiReleaseDrawable(a1);
  (*(void (**)(void *))(a1[1] + 40))(a1);
  glgDestroyProcessor();
  IOAccelGLContextRelease();
  uint64_t v5 = (void *)a1[277];
  if (v5) {
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), v5);
  }
  uint64_t v6 = *a1;
  if (*(unsigned char *)(*a1 + 231) && a1[103])
  {
    gpuiDestroyQueryBufferClientAlloc((uint64_t)a1);
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), (void *)a1[103]);
    uint64_t v6 = *a1;
  }
  unint64_t v7 = (void *)a1[280];
  if (v7)
  {
    malloc_zone_free(*(malloc_zone_t **)(v6 + 232), v7);
    uint64_t v6 = *a1;
  }
  uint64_t v8 = (void *)a1[102];
  if (v8)
  {
    malloc_zone_free(*(malloc_zone_t **)(v6 + 232), v8);
    uint64_t v6 = *a1;
  }
  malloc_zone_free(*(malloc_zone_t **)(v6 + 232), a1);
  return 0;
}

void gldReclaimContext(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 8) + 472))();
  JUMPOUT(0x230F459A0);
}

uint64_t gpusGetDataBuffer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x230F459C0](*(void *)(a1 + 64));
  if (!v4)
  {
    uint64_t v5 = a1 + ((unint64_t)a2 << 6);
    *(_DWORD *)(v5 + 1164) += *(_DWORD *)(v5 + 1128) - *(_DWORD *)(v5 + 1112);
    *(void *)(v5 + 1152) = MEMORY[0x230F45970](*(void *)(a1 + 64), a2);
    uint64_t DataBytes = IOAccelResourceGetDataBytes();
    *(void *)(v5 + 1112) = DataBytes;
    *(void *)(v5 + 1120) = DataBytes + IOAccelResourceGetDataSize() - 128;
    *(void *)(v5 + 1128) = *(void *)(v5 + 1112);
    *(void *)(v5 + 1136) = IOAccelResourceGetClientShared();
    IOAccelContextAddResource();
    ++*(_DWORD *)(v5 + 1168);
  }
  return v4;
}

uint64_t gpumCreateDevice(void *a1, int a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  int v8 = *(_DWORD *)(a4 + 216);
  uint64_t v9 = *(void *)(a4 + 208);
  int v10 = 0;
  if (v8)
  {
    while ((*(_DWORD *)(v9 + 596) & a2) == 0)
    {
      ++v10;
      v9 += *(void *)(a4 + 64);
      if (v8 == v10) {
        return 10006;
      }
    }
  }
  if (v10 == v8 || (a2 & ~*(_DWORD *)(v9 + 596)) != 0) {
    return 10006;
  }
  *(_DWORD *)a3 = *(_DWORD *)(v9 + 772);
  IORegistryEntryGetRegistryEntryID(*(_DWORD *)(v9 + 592), (uint64_t *)(a3 + 384));
  if ((*(unsigned char *)(v9 + 765) & 0x20) != 0) {
    *(unsigned char *)(a3 + 5) = 1;
  }
  *(unsigned char *)(a3 + 4) = 0;
  *(void *)(a3 + 392) = getpagesize();
  a5(v9, a3);
  uint64_t result = 0;
  *(void *)(v9 + 8) = a3;
  *a1 = v9;
  return result;
}

uint64_t gldDestroyDevice()
{
  return 0;
}

uint64_t gldGetError(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(a1 + 116);
  *(_DWORD *)(a1 + 116) = 0;
  if (!result)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    uint64_t result = *(unsigned int *)(v3 + 300);
    *(_DWORD *)(v3 + 300) = 0;
  }
  return result;
}

uint64_t gpumAcquireFenceOnQueue(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 8) != result)
  {
    uint64_t v3 = result;
    gldClearFence(result, a2);
    uint64_t result = gpulAllocFenceIndexOnQueue(v3, (_DWORD *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) = v3;
    }
  }
  return result;
}

void gldClearFence(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v2 = (void *)(*(void *)a2 + 2216);
    uint64_t v3 = (void *)a2;
  }
  else
  {
    uint64_t v3 = (void *)(a2 + 8);
    uint64_t v4 = *(void *)(a2 + 8);
    if (!v4) {
      return;
    }
    uint64_t v2 = (void *)(v4 + 1160);
  }
  *(_DWORD *)(*v2 + (((unint64_t)*(unsigned int *)(a2 + 16) >> 3) & 0x1FFFFFFC)) &= ~(1 << *(_DWORD *)(a2 + 16));
  *uint64_t v3 = 0;
  *(unsigned char *)(a2 + 20) = 1;
  *(_DWORD *)(a2 + 16) = -1;
}

uint64_t gpulAllocFenceIndexOnQueue(uint64_t a1, _DWORD *a2)
{
  unsigned int v3 = 0;
  uint64_t v4 = (vm_map_t *)MEMORY[0x263EF8960];
  unint64_t v5 = *(void *)(a1 + 1168);
  unint64_t v6 = v5 >> 5;
  if ((v5 >> 5))
  {
    uint64_t v7 = 0;
    uint64_t v8 = (v5 >> 5);
    while (1)
    {
      unsigned int v3 = *(_DWORD *)(*(void *)(a1 + 1160) + 4 * v7);
      if (v3 != -1) {
        break;
      }
      if (v8 == ++v7) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    LODWORD(v7) = 0;
  }
  if (v7 == v6)
  {
LABEL_8:
    if (!MEMORY[0x230F45840](*(void *)(a1 + 40), a1 + 1136, a1 + 1152, a1 + 1120, a1 + 1128))
    {
      vm_address_t address = 0;
      unint64_t v9 = *(void *)(a1 + 1128);
      *(void *)(a1 + 1168) = v9 >> 6;
      size_t v10 = (v9 >> 9) & 0x7FFFFFFFFFFFFCLL;
      uint64_t v11 = (char *)malloc_type_zone_realloc(*(malloc_zone_t **)(*(void *)a1 + 232), *(void **)(a1 + 1160), v10, 0xDB6CA469uLL);
      if (!v11) {
        abort();
      }
      *(void *)(a1 + 1160) = v11;
      bzero(&v11[v10 >> 1], v10 >> 1);
      if (!vm_allocate(*v4, &address, 24 * *(void *)(a1 + 1168), 1)) {
        gpusFinishQueueResourceUsingFlushFunc();
      }
    }
    return 0;
  }
  else
  {
    for (int i = 0; i != 32; ++i)
    {
      if (((v3 >> i) & 1) == 0) {
        break;
      }
    }
    uint64_t result = 1;
    *(_DWORD *)(*(void *)(a1 + 1160) + 4 * v7) |= 1 << i;
    *a2 = i + 32 * v7;
  }
  return result;
}

uint64_t gpumAcquireFenceOnQueueNolock(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 8) != result)
  {
    uint64_t v3 = result;
    gldClearFence(result, a2);
    uint64_t result = gpulAllocFenceIndexOnQueue(v3, (_DWORD *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) = v3;
    }
  }
  return result;
}

uint64_t gpumSetFenceOnQueue(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 464))();
  if (result)
  {
    *(unsigned char *)(a2 + 20) = 0;
    *(_DWORD *)(*(void *)(a1 + 1136) + 16 * *(unsigned int *)(a2 + 16)) = 1;
  }
  return result;
}

uint64_t gldCreateFence(uint64_t a1, void *a2)
{
  uint64_t v3 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, 0x18uLL, 0xD68DC258uLL);
  if (!v3) {
    abort();
  }
  *uint64_t v3 = 0;
  v3[1] = 0;
  *((unsigned char *)v3 + 20) = 1;
  *((_DWORD *)v3 + 4) = -1;
  *a2 = v3;
  return 0;
}

uint64_t gldDestroyFence(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t gldSetFenceOnContext(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 != a1)
  {
    gldClearFence(a1, a2);
    unsigned int v4 = 0;
    while (1)
    {
      unint64_t v5 = *(void *)(a1 + 2224);
      unint64_t v6 = v5 >> 5;
      if ((v5 >> 5))
      {
        uint64_t v7 = 0;
        uint64_t v8 = (v5 >> 5);
        while (1)
        {
          unsigned int v4 = *(_DWORD *)(*(void *)(a1 + 2216) + 4 * v7);
          if (v4 != -1) {
            break;
          }
          if (v8 == ++v7)
          {
            unsigned int v4 = -1;
            goto LABEL_10;
          }
        }
      }
      else
      {
        LODWORD(v7) = 0;
      }
      if (v7 != v6) {
        break;
      }
LABEL_10:
      uint64_t result = MEMORY[0x230F45980](*(void *)(a1 + 64), a1 + 2200, a1 + 2208, a1 + 2184, a1 + 2192);
      if (result) {
        return result;
      }
      unint64_t v10 = *(void *)(a1 + 2192);
      *(void *)(a1 + 2224) = v10 >> 6;
      size_t v11 = (v10 >> 9) & 0x7FFFFFFFFFFFFCLL;
      unint64_t v12 = (char *)malloc_type_zone_realloc(*(malloc_zone_t **)(*(void *)a1 + 232), *(void **)(a1 + 2216), v11, 0xDB6CA469uLL);
      if (!v12) {
        abort();
      }
      *(void *)(a1 + 2216) = v12;
      bzero(&v12[v11 >> 1], v11 >> 1);
    }
    for (int i = 0; i != 32; ++i)
    {
      if (((v4 >> i) & 1) == 0) {
        break;
      }
    }
    *(_DWORD *)(*(void *)(a1 + 2216) + 4 * v7) |= 1 << i;
    *(_DWORD *)(a2 + 16) = i + 32 * v7;
    *(void *)a2 = a1;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 456))(a1, a2);
  if (result)
  {
    *(unsigned char *)(a2 + 20) = 0;
    *(_DWORD *)(*(void *)(a1 + 2200) + 16 * *(unsigned int *)(a2 + 16)) = 1;
  }
  return result;
}

uint64_t gldSetFenceOnQueue(uint64_t a1, uint64_t a2)
{
  gpumAcquireFenceOnQueue(a1, a2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 464))(a1, a2);
  if (result)
  {
    *(unsigned char *)(a2 + 20) = 0;
    *(_DWORD *)(*(void *)(a1 + 1136) + 16 * *(unsigned int *)(a2 + 16)) = 1;
  }
  return result;
}

uint64_t gldFlushFenceOnQueue(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 20) && *(void *)(a2 + 8) == result)
  {
    if (*(_DWORD *)(*(void *)(result + 1136) + 16 * *(unsigned int *)(a2 + 16))) {
      return (*(uint64_t (**)(void))(*(void *)(result + 8) + 480))();
    }
  }
  return result;
}

uint64_t gldFinishFenceOnQueue(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 20)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  if (*(_DWORD *)(*(void *)(v4 + 1136) + 16 * *(unsigned int *)(a2 + 16)))
  {
    if (v4 != a1) {
      return 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 8) + 480))();
  }
  char v5 = IOAccelDeviceTestEvent();
  *(unsigned char *)(a2 + 20) = v5;
  if (!v5)
  {
    MEMORY[0x230F45800](*(void *)(v4 + 40), *(unsigned int *)(a2 + 16));
    *(unsigned char *)(a2 + 20) = 1;
  }
  uint64_t result = *(unsigned int *)(v4 + 32);
  if (result) {
    *(_DWORD *)(v4 + 32) = 0;
  }
  return result;
}

uint64_t gldGetFenceStatus(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 20)) {
    return 3;
  }
  if (!*(void *)a2)
  {
    uint64_t v4 = *(void *)(a2 + 8);
    if (!v4) {
      return 3;
    }
    if (!*(_DWORD *)(*(void *)(v4 + 1136) + 16 * *(unsigned int *)(a2 + 16))) {
      goto LABEL_9;
    }
    return 0;
  }
  if (*(_DWORD *)(*(void *)(*(void *)a2 + 2200) + 16 * *(unsigned int *)(a2 + 16))) {
    return 0;
  }
LABEL_9:
  char v5 = IOAccelDeviceTestEvent();
  *(unsigned char *)(a2 + 20) = v5;
  if (v5) {
    return 3;
  }
  else {
    return 1;
  }
}

uint64_t gpuiTestFence(uint64_t a1, uint64_t a2, int a3)
{
  LOBYTE(v3) = *(unsigned char *)(a2 + 20);
  if ((_BYTE)v3) {
    return v3;
  }
  if (!*(_DWORD *)(*(void *)(*(void *)a2 + 2200) + 16 * *(unsigned int *)(a2 + 16)))
  {
LABEL_6:
    LOBYTE(v3) = IOAccelDeviceTestEvent();
    *(unsigned char *)(a2 + 20) = v3;
    return v3;
  }
  uint64_t v3 = 0;
  if (a3 && *(void *)a2 == a1)
  {
    (*(void (**)(void))(*(void *)(a1 + 8) + 472))();
    goto LABEL_6;
  }
  return v3;
}

uint64_t gpuiFlushFence(uint64_t result, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 20) && *(void *)a2 == result)
  {
    if (*(_DWORD *)(*(void *)(result + 2200) + 16 * *(unsigned int *)(a2 + 16))) {
      return (*(uint64_t (**)(void))(*(void *)(result + 8) + 472))();
    }
  }
  return result;
}

uint64_t gpuiFinishFence(uint64_t result, uint64_t *a2)
{
  if (!*((unsigned char *)a2 + 20))
  {
    uint64_t v3 = *a2;
    if (*(_DWORD *)(*(void *)(*a2 + 2200) + 16 * *((unsigned int *)a2 + 4)))
    {
      if (v3 != result) {
        return result;
      }
      (*(void (**)(void))(*(void *)(result + 8) + 472))();
    }
    uint64_t result = IOAccelDeviceTestEvent();
    *((unsigned char *)a2 + 20) = result;
    if (!(_BYTE)result)
    {
      uint64_t result = MEMORY[0x230F45930](*(void *)(v3 + 64), *((unsigned int *)a2 + 4));
      *((unsigned char *)a2 + 20) = 1;
    }
  }
  return result;
}

void gpuiWaitForFence(uint64_t a1, uint64_t *a2)
{
  if (!*((unsigned char *)a2 + 20))
  {
    uint64_t v3 = *a2;
    if (*a2)
    {
      if (*(_DWORD *)(*(void *)(v3 + 2200) + 16 * *((unsigned int *)a2 + 4))) {
        return;
      }
      char v4 = IOAccelDeviceTestEvent();
      *((unsigned char *)a2 + 20) = v4;
      if (v4) {
        return;
      }
      MEMORY[0x230F45930](*(void *)(v3 + 64), *((unsigned int *)a2 + 4));
    }
    else
    {
      uint64_t v5 = a2[1];
      if (!v5) {
        return;
      }
      if (*(_DWORD *)(*(void *)(v5 + 1136) + 16 * *((unsigned int *)a2 + 4))) {
        return;
      }
      char v6 = IOAccelDeviceTestEvent();
      *((unsigned char *)a2 + 20) = v6;
      if (v6) {
        return;
      }
      MEMORY[0x230F45800](*(void *)(v5 + 40), *((unsigned int *)a2 + 4));
    }
    *((unsigned char *)a2 + 20) = 1;
  }
}

uint64_t gpumChoosePixelFormat(char **a1, int *a2, uint64_t a3, uint64_t (*a4)(uint64_t *, unint64_t, void, void))
{
  uint64_t v81 = 0;
  uint64_t v4 = a3;
  unsigned int v83 = 0;
  uint64_t v82 = 0;
  LOWORD(v6) = 0;
  int v7 = 0;
  char v8 = 0;
  unsigned int v9 = 0;
  signed int v10 = 0;
  signed int v11 = 0;
  int v12 = 0;
  unsigned int v13 = 0;
  uint64_t v102 = *MEMORY[0x263EF8340];
  *a1 = 0;
  int v84 = *(_DWORD *)(a3 + 220);
  int v14 = 16777212;
  int v15 = 1280;
  int v16 = a2;
  while (2)
  {
    int v17 = *v16;
    if (*v16)
    {
      uint64_t v18 = v16 + 1;
      uint64_t v19 = 10000;
      switch(v17)
      {
        case '3':
          HIDWORD(v81) = 1;
          goto LABEL_48;
        case '4':
          LODWORD(v82) = 1;
          goto LABEL_48;
        case '5':
          v15 |= 4u;
          goto LABEL_48;
        case '6':
          v15 |= 2u;
          goto LABEL_48;
        case '7':
          int v21 = *v18;
          if (*v18 < 0) {
            return 10008;
          }
          uint64_t v18 = v16 + 2;
          HIDWORD(v82) = (unsigned __int16)v21;
          goto LABEL_48;
        case '8':
          int v6 = *v18;
          if (*v18 < 0) {
            return 10008;
          }
LABEL_28:
          uint64_t v18 = v16 + 2;
LABEL_48:
          int v16 = v18;
          if ((char *)v18 - (char *)a2 <= 192) {
            continue;
          }
          uint64_t v19 = 10000;
          break;
        case '9':
          v15 |= 0x800u;
          goto LABEL_48;
        case ':':
          int v14 = 1056964608;
          goto LABEL_48;
        case ';':
          int v7 = 2;
          goto LABEL_48;
        case '<':
          int v7 = 1;
          goto LABEL_48;
        case '=':
          char v8 = 1;
          goto LABEL_48;
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'Q':
        case 'R':
        case 'S':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
          return v19;
        case 'L':
          v15 |= 8u;
          goto LABEL_48;
        case 'M':
          v15 |= 0x10u;
          goto LABEL_48;
        case 'P':
          v15 |= 1u;
          goto LABEL_48;
        case 'T':
          uint64_t v18 = v16 + 2;
          v84 &= v16[1];
          goto LABEL_48;
        case 'Z':
          v15 |= 0x2000u;
          goto LABEL_48;
        default:
          switch(v17)
          {
            case 3:
              int v20 = v83 | 0x18;
              goto LABEL_26;
            case 4:
              goto LABEL_48;
            case 5:
              int v20 = v83 | 8;
              goto LABEL_26;
            case 6:
              int v20 = v83 | 2;
LABEL_26:
              unsigned int v83 = v20;
              goto LABEL_48;
            case 7:
              LODWORD(v81) = *v18;
              if ((*v18 & 0x80000000) == 0) {
                goto LABEL_28;
              }
              return 10008;
            case 8:
              signed int v22 = *v18;
              if (*v18 < 0) {
                return 10008;
              }
              uint64_t v18 = v16 + 2;
              if (v22 > (int)v9) {
                unsigned int v9 = v22;
              }
              break;
            case 11:
              signed int v23 = *v18;
              if (*v18 < 0) {
                return 10008;
              }
              uint64_t v18 = v16 + 2;
              if (v23 > (int)v13) {
                unsigned int v13 = v23;
              }
              break;
            case 12:
              signed int v24 = *v18;
              if (*v18 < 0) {
                return 10008;
              }
              uint64_t v18 = v16 + 2;
              if (v24 > v10) {
                signed int v10 = v24;
              }
              break;
            case 13:
              signed int v25 = *v18;
              if (*v18 < 0) {
                return 10008;
              }
              uint64_t v18 = v16 + 2;
              if (v25 > v11) {
                signed int v11 = v25;
              }
              break;
            case 14:
              int v26 = *v18;
              if (*v18 < 0) {
                return 10008;
              }
              uint64_t v18 = v16 + 2;
              if (v26 > v12) {
                int v12 = v26;
              }
              break;
            default:
              return v19;
          }
          goto LABEL_48;
      }
    }
    else
    {
      int v76 = v15;
      int v79 = gpulGLIBitsGE(v11);
      int v78 = gpulGLIBitsGE(v10);
      BOOL v28 = (int)v13 < 9 && (int)v9 < 33;
      int v29 = v14 & 0x3F0FFFFC;
      if (!v28) {
        int v29 = v14;
      }
      if (v9 <= 0x100)
      {
        if (v9 <= 0x80)
        {
          if (v9 <= 0x40)
          {
            if (v9 <= 0x20)
            {
              if (v9 <= 0x10)
              {
                if (v9 <= 8)
                {
                  if (v9) {
                    int v30 = 1073741820;
                  }
                  else {
                    int v30 = -1073741828;
                  }
                }
                else
                {
                  int v30 = 1073741760;
                }
              }
              else
              {
                int v30 = 1073725440;
              }
            }
            else
            {
              int v30 = 1072693248;
            }
          }
          else
          {
            int v30 = 201326592;
          }
        }
        else
        {
          int v30 = 805306368;
        }
      }
      else
      {
        int v30 = 0;
      }
      int v31 = v76;
      if (v13 <= 0x20)
      {
        if (v13 <= 0x10)
        {
          if (v13 <= 0xC)
          {
            if (v13 <= 8)
            {
              int v32 = 178891048;
              if (v13 <= 4)
              {
                if (v13 <= 2)
                {
                  if (v13) {
                    int v33 = 179154344;
                  }
                  else {
                    int v33 = -1073741828;
                  }
                  if (v13 == 2) {
                    int v32 = 179153320;
                  }
                  else {
                    int v32 = v33;
                  }
                }
                else
                {
                  int v32 = 178891176;
                }
              }
            }
            else
            {
              int v32 = 178257920;
            }
          }
          else
          {
            int v32 = 176160768;
          }
        }
        else
        {
          int v32 = 0x8000000;
        }
      }
      else
      {
        int v32 = 0;
      }
      if (v12) {
        unsigned int v34 = 0x8000000;
      }
      else {
        unsigned int v34 = 0x80000000;
      }
      unsigned int v77 = v34;
      if (HIDWORD(v82)) {
        __int16 v35 = v6;
      }
      else {
        __int16 v35 = 0;
      }
      __int16 v75 = v35;
      if (HIDWORD(v82)) {
        int v36 = v7;
      }
      else {
        int v36 = 0;
      }
      if (!HIDWORD(v82)) {
        char v8 = 0;
      }
      BOOL v37 = (v31 & 0x2006) == 0;
      if (*(_DWORD *)(v4 + 216))
      {
        unint64_t v38 = 0;
        int v70 = 0;
        ptr = 0;
        uint64_t v72 = v4;
        int v39 = v29 & 0x3FFFFFFC & v30 & v32;
        int v40 = v31 | v37;
        int v74 = v31 | v37 | 0x200;
        do
        {
          unint64_t v41 = *(void *)(v4 + 208) + *(void *)(v4 + 64) * v38;
          int v42 = *(_DWORD *)(v41 + 596) & v84;
          if (v42)
          {
            char v43 = 0;
            LODWORD(v27) = *(_DWORD *)(v41 + 596) & v84;
            uint8x8_t v44 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&v27);
            v44.i16[0] = vaddlv_u8(v44);
            unsigned int v45 = v44.i32[0];
            unint64_t v73 = v38;
            int v46 = (v38 << 24) + 0x1000000;
            char v47 = 1;
            while (1)
            {
              uint64_t v85 = 0;
              int v86 = 0;
              int v87 = v40;
              unsigned int v88 = v83;
              int v89 = v39;
              unsigned int v90 = v77;
              int v91 = v78;
              int v92 = v79;
              __int16 v93 = 0;
              __int16 v94 = v81;
              __int16 v95 = WORD2(v82);
              __int16 v96 = v75;
              int v97 = v36;
              char v98 = v8;
              __int16 v99 = 0;
              char v100 = 0;
              int v101 = v84;
              if (v43) {
                unsigned int v88 = v83 & 0xFFFFFFEF;
              }
              if (v45 >= 2) {
                int v87 = v74;
              }
              int v86 = *(_DWORD *)(v41 + 780) | v46;
              int v101 = v42;
              int v48 = a4(&v85, v41, HIDWORD(v81), v82);
              if (v48) {
                break;
              }
              int v49 = *(_DWORD *)&v47 & ((v88 & 0x10) >> 4);
              char v43 = 1;
              char v47 = 0;
              if ((v49 & 1) == 0)
              {
                uint64_t v4 = v72;
                unint64_t v38 = v73;
                goto LABEL_123;
              }
            }
            uint64_t v50 = (v48 + v70);
            v51 = (char *)malloc_type_zone_malloc(*(malloc_zone_t **)(v72 + 232), 56 * (int)v50, 0x1357CB10uLL);
            if (!v51) {
              abort();
            }
            v52 = v51;
            unint64_t v38 = v73;
            if (v70 < 1)
            {
              unsigned int v60 = 0;
              uint64_t v56 = v50;
            }
            else
            {
              uint64_t v53 = v70;
              v54 = v51 + 56;
              v55 = ptr;
              uint64_t v56 = v50;
              do
              {
                long long v57 = v55[1];
                long long v27 = v55[2];
                uint64_t v58 = *((void *)v55 + 6);
                long long v59 = *v55;
                v55 = (_OWORD *)((char *)v55 + 56);
                *(_OWORD *)(v54 - 56) = v59;
                *((void *)v54 - 1) = v58;
                *(_OWORD *)(v54 - 24) = v27;
                *(_OWORD *)(v54 - 40) = v57;
                *((void *)v54 - 7) = v54;
                v54 += 56;
                --v53;
              }
              while (v53);
              unsigned int v60 = v70;
            }
            uint64_t v4 = v72;
            if ((int)v60 < (int)v56)
            {
              unsigned int v61 = v60 - v70;
              uint64_t v62 = (uint64_t)&v51[56 * v60 + 56];
              uint64_t v63 = v56 - v60;
              do
              {
                v64 = &v85 + 7 * v61;
                long long v65 = *((_OWORD *)v64 + 1);
                long long v27 = *((_OWORD *)v64 + 2);
                uint64_t v66 = v64[6];
                *(_OWORD *)(v62 - 56) = *(_OWORD *)v64;
                *(void *)(v62 - 8) = v66;
                *(_OWORD *)(v62 - 24) = v27;
                *(_OWORD *)(v62 - 40) = v65;
                *(void *)(v62 - 56) = v62;
                ++v61;
                v62 += 56;
                --v63;
              }
              while (v63);
              unsigned int v60 = v56;
            }
            *(void *)&v51[56 * (v60 - 1)] = 0;
            if (ptr) {
              malloc_zone_free(*(malloc_zone_t **)(v72 + 232), ptr);
            }
            ptr = v52;
            int v70 = v56;
          }
LABEL_123:
          ++v38;
        }
        while (v38 < *(unsigned int *)(v4 + 216));
        v67 = a1;
        v68 = ptr;
        if (ptr && v70 <= 0)
        {
          malloc_zone_free(*(malloc_zone_t **)(v4 + 232), ptr);
          v68 = 0;
        }
      }
      else
      {
        v68 = 0;
        v67 = a1;
      }
      uint64_t v19 = 0;
      *v67 = v68;
    }
    return v19;
  }
}

uint64_t gpulGLIBitsGE(unsigned int a1)
{
  if (a1 > 0x7F) {
    return 0x10000;
  }
  if (a1 > 0x5F) {
    return 98304;
  }
  if (a1 > 0x3F) {
    return 114688;
  }
  if (a1 > 0x2F) {
    return 122880;
  }
  if (a1 > 0x1F) {
    return 126976;
  }
  if (a1 > 0x17) {
    return 129024;
  }
  if (a1 > 0xF) {
    return 130048;
  }
  if (a1 > 0xB) {
    return 130560;
  }
  if (a1 > 9) {
    return 130816;
  }
  if (a1 > 7) {
    return 130944;
  }
  if (a1 > 5) {
    return 131008;
  }
  if (a1 == 5) {
    return 131040;
  }
  if (a1 > 3) {
    return 131056;
  }
  if (a1 == 3) {
    return 131064;
  }
  if (a1 > 1) {
    return 131068;
  }
  if (a1 == 1) {
    return 131070;
  }
  return 0x3FFFFLL;
}

uint64_t gpumDestroyPixelFormat(void *ptr, uint64_t a2)
{
  if (ptr) {
    malloc_zone_free(*(malloc_zone_t **)(a2 + 232), ptr);
  }
  return 0;
}

uint64_t gldCreateFramebuffer(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 96), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  unsigned int v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  *((_DWORD *)v8 + 4) = 0;
  (*(void (**)(void *, void *))(a1[1] + 64))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldDestroyFramebuffer(void *a1, void *a2)
{
  return 0;
}

uint64_t gldUnbindFramebuffer(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (*(void *)(result + 48) == a2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)(result + 8) + 352))(result, 0);
    *(void *)(v3 + 48) = 0;
    *(_DWORD *)(v3 + 840) = 0;
  }
  if (*(void *)(v3 + 56) == a2)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)(v3 + 8) + 360))(v3, 0);
    *(void *)(v3 + 56) = 0;
    *(_DWORD *)(v3 + 844) = 0;
  }
  return result;
}

BOOL gldLoadFramebuffer(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(*(void *)a2 + 200);
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  }
  for (*(unsigned char *)(*(void *)(a2 + 8) + 81) = 1; v4; v4 ^= 1 << v5)
  {
    unsigned int v5 = __clz(__rbit32(v4));
    uint64_t v6 = *(void *)(*(void *)(a2 + 8) + 8 * v5);
    if (*(unsigned char *)(*(void *)(v6 + 8) + 20))
    {
      int v7 = *(_DWORD *)(a1 + 316) + 1;
      *(_DWORD *)(a1 + 316) = v7;
      *(_DWORD *)(v6 + 56) = v7;
      if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 296))(a1, v6)) {
        goto LABEL_9;
      }
      uint64_t v8 = *(void *)(v6 + 8);
      *(void *)(v8 + 13) = 0;
      *(void *)(v8 + 8) = 0;
    }
  }
  int v9 = *(_DWORD *)(a1 + 312) + 1;
  *(_DWORD *)(a1 + 312) = v9;
  *(_DWORD *)(a2 + 16) = v9;
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 264))(a1, a2, 7);
  uint64_t v11 = *(void *)(a2 + 8);
  *(unsigned char *)(v11 + 81) = v10 == 0;
  *(unsigned char *)(v11 + 80) = 0;
LABEL_9:
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return *(unsigned char *)(*(void *)(a2 + 8) + 81) == 0;
}

uint64_t gldUpdateReadFramebuffer(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(v3 + 424);
    if (v4)
    {
      gpulCheckForFramebufferIOSurfaceChanges(*(void *)(a1 + 16), *(void **)(v3 + 424));
      int v5 = *(_DWORD *)(v4 + 16);
      if (*(_DWORD *)(a1 + 844) != v5)
      {
        *(_DWORD *)(a1 + 844) = v5;
        (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 360))(a1, v4);
      }
    }
    else
    {
      *(_DWORD *)(a1 + 844) = 0;
      (*(void (**)(uint64_t, void))(*(void *)(a1 + 8) + 360))(a1, 0);
    }
    *(void *)(a1 + 56) = v4;
  }
  return 1;
}

uint64_t gpulCheckForFramebufferIOSurfaceChanges(uint64_t a1, void *a2)
{
  for (unsigned int i = *(_DWORD *)(*a2 + 200); i; i ^= 1 << v4)
  {
    unsigned int v4 = __clz(__rbit32(i));
    if ((***(_WORD ***)(a2[1] + 8 * v4) & 0x800) != 0) {
      uint64_t result = IOSurfaceBindAccel();
    }
  }
  return result;
}

uint64_t gldUpdateDrawFramebuffer(uint64_t a1, int a2)
{
  if ((a2 & 0x40000000) == 0)
  {
    if ((a2 & 0x43C0478) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 328))(a1);
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 416);
  if (v5)
  {
    gpulCheckForFramebufferIOSurfaceChanges(*(void *)(a1 + 16), *(void **)(v4 + 416));
    int v6 = *(_DWORD *)(v5 + 16);
    if (*(_DWORD *)(a1 + 840) != v6)
    {
      *(_DWORD *)(a1 + 840) = v6;
      (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 352))(a1, v5);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 840) = 0;
    (*(void (**)(uint64_t, void))(*(void *)(a1 + 8) + 352))(a1, 0);
  }
  *(void *)(a1 + 48) = v5;
  int v7 = *(_DWORD *)(a1 + 832) | a2 & 0x43C0478;
  *(_DWORD *)(a1 + 832) = 0;
  if (v7) {
    goto LABEL_9;
  }
LABEL_10:
  if (*(_DWORD *)(a1 + 836)) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t gldUpdateTransformFeedbackState(uint64_t a1)
{
  return 0;
}

uint64_t gldPopulateRendererInfo(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = 0;
  if (*(unsigned char *)(*(void *)(a1 + 8) + 5)) {
    int v2 = 566683;
  }
  else {
    int v2 = 42395;
  }
  int v3 = *(_DWORD *)(a1 + 596);
  *(_DWORD *)(a2 + 8) = ((*(_DWORD *)(a1 + 776) << 24) + 0x1000000) | *(_DWORD *)(a1 + 780);
  *(_DWORD *)(a2 + 12) = v2;
  *(void *)(a2 + 52) = *(void *)(*(void *)(a1 + 8) + 384);
  *(_OWORD *)(a2 + 16) = xmmword_22B318CD0;
  *(_DWORD *)(a2 + 32) = 128;
  *(_DWORD *)(a2 + 36) = v3;
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  *(_DWORD *)(a2 + 43) = 0;
  *(void *)(a2 + 68) = 0;
  *(void *)(a2 + 60) = 0;
  *(void *)(a2 + 76) = (*(void *)(a1 + 792) >> 20);
  *(_DWORD *)(a2 + 84) = *(void *)(a1 + 784) >> 20;
  *(_OWORD *)(a2 + 120) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  (*(void (**)(uint64_t, uint64_t))(a1 + 240))(a2, a1);
  return 0;
}

void gpumInitializeIOData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, void (*a8)(uint64_t))
{
  uint64_t v9 = 0;
  unsigned int v10 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)a7 = a4;
  *(void *)(a7 + 8) = a5;
  *(_DWORD *)(a7 + 220) = a3;
  *(_DWORD *)(a7 + 224) = a6;
  *(unsigned char *)(a7 + 230) = a6;
  do
  {
    int v11 = 1 << v9;
    v23[v9 + 64] = 0;
    v23[v9 + 32] = 0;
    v23[v9] = 0;
    uint64_t v12 = v10;
    if (((1 << v9) & a3) != 0)
    {
      int v13 = *(_DWORD *)(a1 + 4 * v9);
      if (!v10) {
        goto LABEL_11;
      }
      uint64_t v14 = 0;
      while (v23[v14 + 64] != v13)
      {
        if (v10 == ++v14) {
          goto LABEL_11;
        }
      }
      if ((v14 & 0x80000000) != 0)
      {
LABEL_11:
        v23[v10++ + 64] = v13;
        v23[v12 + 32] |= v11;
      }
      else
      {
        v23[v14 + 32] |= v11;
        ++v23[v14];
      }
    }
    ++v9;
  }
  while (v9 != 32);
  a8(a7);
  if (v10)
  {
    uint64_t v15 = v10;
    int v16 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(a7 + 232), 1uLL, *(void *)(a7 + 64) * v10, 0xD68DC258uLL);
    if (!v16) {
      abort();
    }
    int v17 = v16;
    uint64_t v18 = 0;
    *(void *)(a7 + 208) = v16;
    while (1)
    {
      uint64_t v19 = &v17[*(void *)(a7 + 64) * v18];
      *((_DWORD *)v19 + 194) = v18;
      *(void *)uint64_t v19 = a7;
      *((_DWORD *)v19 + 148) = v23[v18 + 64];
      *((_DWORD *)v19 + 149) = v23[v18 + 32];
      *((_DWORD *)v19 + 150) = v23[v18];
      uint64_t v20 = IOAccelDeviceCreateWithAPIProperty();
      if (!v20) {
        break;
      }
      *((void *)v19 + 73) = v20;
      if (IOAccelDeviceGetConfig64()) {
        break;
      }
      int v21 = *(unsigned int (**)(char *, uint64_t))(a7 + 16);
      uint64_t Connect = IOAccelDeviceGetConnect();
      if (v21(v19, Connect)) {
        break;
      }
      if (v15 == ++v18)
      {
        LODWORD(v18) = v15;
        break;
      }
    }
    *(_DWORD *)(a7 + 216) = v18;
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    gpumInitializeIOData_cold_1();
  }
}

void gpumTerminateIOData(uint64_t a1)
{
  int v2 = *(char **)(a1 + 208);
  uint64_t v3 = *(unsigned int *)(a1 + 216);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = &v2[*(void *)(a1 + 64) * i];
      (*(void (**)(char *))(a1 + 24))(v5);
      IOAccelDeviceRelease();
      *((void *)v5 + 73) = 0;
    }
    int v2 = *(char **)(a1 + 208);
  }
  *(void *)(a1 + 216) = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (v2)
  {
    malloc_zone_free(*(malloc_zone_t **)(a1 + 232), v2);
    *(void *)(a1 + 208) = 0;
  }
}

uint64_t gldSetInteger(uint64_t a1, int a2, int *a3)
{
  if (!a3) {
    return 10014;
  }
  if (a2 > 665)
  {
    if (a2 > 700)
    {
      if (a2 == 701) {
        return 0;
      }
      if (a2 == 1402)
      {
        uint64_t result = 0;
        *(unsigned char *)(*(void *)(a1 + 16) + 308) = *a3 != 0;
        return result;
      }
      goto LABEL_31;
    }
    if (a2 == 666)
    {
      int v7 = *(_DWORD *)(a1 + 144);
      uint64_t result = 0;
      if (*a3) {
        unsigned int v6 = v7 & 0xFFFFFDFF;
      }
      else {
        unsigned int v6 = v7 | 0x200;
      }
    }
    else
    {
      if (a2 != 667)
      {
LABEL_31:
        int v16 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 496);
LABEL_32:
        return v16();
      }
      int v5 = *(_DWORD *)(a1 + 144);
      uint64_t result = 0;
      if (*a3) {
        unsigned int v6 = v5 & 0xFFDFFFFF;
      }
      else {
        unsigned int v6 = v5 | 0x200000;
      }
    }
    *(_DWORD *)(a1 + 144) = v6;
    return result;
  }
  if (a2 <= 606)
  {
    if (a2 == 318)
    {
      uint64_t result = 0;
      *(unsigned char *)(a1 + 77) = *a3 == 0;
      return result;
    }
    if (a2 == 321)
    {
      IOAccelContextSetBackgroundRendering();
      return 0;
    }
    goto LABEL_31;
  }
  if (a2 != 607)
  {
    if (a2 == 610)
    {
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(a1 + 16) + 309) = *a3 != 0;
      return result;
    }
    goto LABEL_31;
  }
  int v8 = *a3;
  if (!*a3)
  {
    uint64_t result = 0;
    no_crash_upon_reset = 1;
    return result;
  }
  if (v8 == 1)
  {
    unint64_t v17 = *(unsigned int *)(a1 + 2148);
    if (!v17) {
      return 0;
    }
    for (unint64_t i = 0; i < v17; ++i)
    {
      uint64_t v19 = a1 + (i << 6);
      uint64_t v20 = *(_DWORD **)(v19 + 1112);
      if ((unint64_t)v20 < *(void *)(v19 + 1128))
      {
        int v21 = (void *)(v19 + 1128);
        do
          *v20++ = random();
        while ((unint64_t)v20 < *v21);
        unint64_t v17 = *(unsigned int *)(a1 + 2148);
      }
      uint64_t result = 0;
    }
  }
  else
  {
    if (v8 != 2)
    {
      int v16 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 496);
      goto LABEL_32;
    }
    if (!*(_DWORD *)(a1 + 2148)) {
      return 0;
    }
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = a1 + (v9 << 6);
      int v11 = (void *)(v10 + 1112);
      unint64_t v12 = ((*(void *)(v10 + 1128) - *(void *)(v10 + 1112)) >> 2);
      unint64_t v13 = random();
      do
      {
        unint64_t v14 = v13;
        v13 >>= 1;
      }
      while (v14 > v12);
      int v15 = random();
      uint64_t result = 0;
      *(_DWORD *)(*v11 + 4 * v14) = v15;
      ++v9;
    }
    while (v9 < *(unsigned int *)(a1 + 2148));
  }
  return result;
}

uint64_t gldGetInteger(uint64_t a1, int a2, int *a3)
{
  if (!a3) {
    return 10014;
  }
  if (a2 <= 666)
  {
    switch(a2)
    {
      case 317:
        int v4 = *(unsigned __int8 *)(a1 + 76);
        *a3 = v4;
        uint64_t result = 0;
        if (v4 == 1) {
          *(unsigned char *)(a1 + 76) = 0;
        }
        return result;
      case 318:
        uint64_t result = 0;
        int v6 = *(unsigned __int8 *)(a1 + 77) == 0;
        goto LABEL_21;
      case 319:
        uint64_t result = 0;
        int v6 = (*(_DWORD *)(a1 + 80) >> 8) & 1;
        goto LABEL_21;
      case 320:
        uint64_t result = 0;
        int v6 = (*(_DWORD *)(a1 + 80) >> 9) & 1;
        goto LABEL_21;
      default:
        if (a2 != 666) {
          return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 488))(a1);
        }
        uint64_t result = 0;
        int v6 = ((*(_DWORD *)(a1 + 144) >> 9) & 1) == 0;
        goto LABEL_21;
    }
  }
  if (a2 > 1400)
  {
    if (a2 == 1401)
    {
      uint64_t result = 0;
      uint64_t v7 = *(void *)(a1 + 16);
      *a3 = *(_DWORD *)(v7 + 304) | *(_DWORD *)(a1 + 2392);
      *(_DWORD *)(a1 + 2392) = 0;
      *(_DWORD *)(v7 + 304) = 0;
      return result;
    }
    if (a2 == 1402)
    {
      uint64_t result = 0;
      int v6 = *(unsigned __int8 *)(*(void *)(a1 + 16) + 308);
      goto LABEL_21;
    }
  }
  else
  {
    if (a2 == 667)
    {
      uint64_t result = 0;
      int v6 = ((*(_DWORD *)(a1 + 144) >> 21) & 1) == 0;
      goto LABEL_21;
    }
    if (a2 == 1400)
    {
      uint64_t result = 0;
      int v6 = 1;
LABEL_21:
      *a3 = v6;
      return result;
    }
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 488))(a1);
}

uint64_t gpusPixelBytes(int a1, int a2)
{
  uint64_t result = 1;
  if (a2 > 33633)
  {
    if (a2 > 34233)
    {
      if (a2 <= 36192)
      {
        if ((a2 - 34234) >= 2) {
          return 4;
        }
        return 2;
      }
      if (a2 != 36193)
      {
        if (a2 == 36269) {
          return 8;
        }
        return 4;
      }
      return 2 * gpulComponents(a1);
    }
    if (a2 > 33638) {
      return 4;
    }
    if ((a2 - 33635) < 4) {
      return 2;
    }
    int v5 = 33634;
LABEL_29:
    if (a2 != v5) {
      return 4;
    }
    return result;
  }
  if (a2 > 32817)
  {
    if ((a2 - 32819) < 2) {
      return 2;
    }
    if ((a2 - 32821) < 2) {
      return 4;
    }
    int v5 = 32818;
    goto LABEL_29;
  }
  if ((a2 - 5120) > 0xB)
  {
LABEL_27:
    if (!a2)
    {
      if (a1 <= 37807)
      {
        uint64_t result = 8;
        if (a1 > 36282)
        {
          if ((a1 - 37488) > 9)
          {
            if ((a1 - 36283) < 2) {
              return result;
            }
          }
          else if (((1 << (a1 - 112)) & 0xF3) != 0)
          {
            return result;
          }
        }
        else if (a1 > 35411)
        {
          if ((a1 - 35412) < 4 || (a1 - 35420) >= 4 && (a1 - 35840) < 4) {
            return result;
          }
        }
        else if ((a1 - 33776) < 2)
        {
          return result;
        }
      }
      return 16;
    }
    int v5 = 6656;
    goto LABEL_29;
  }
  if (((1 << a2) & 0x70) != 0) {
    return 4 * gpulComponents(a1);
  }
  if (((1 << a2) & 0x80C) != 0) {
    return 2 * gpulComponents(a1);
  }
  if (((1 << a2) & 3) == 0) {
    goto LABEL_27;
  }
  char v4 = a1 - 101;
  if ((a1 - 35429) > 0xF)
  {
    if ((a1 - 37883) < 3) {
      return result;
    }
    if (a1 == 37902 || (a1 - 37875) < 6) {
      return 2;
    }
    if ((a1 - 37903) >= 2)
    {
      return gpulComponents(a1);
    }
    return 4;
  }
  if (((1 << v4) & 0xE2E2) != 0) {
    return 2;
  }
  if (((1 << v4) & 0xD0D) == 0) {
    return 4;
  }
  return result;
}

uint64_t gpulComponents(int a1)
{
  uint64_t result = 1;
  if (a1 > 35428)
  {
    if ((a1 - 35429) < 0x10 || (a1 - 37875) <= 0x1B && ((1 << (a1 + 13)) & 0x800073F) != 0) {
      return 3;
    }
    unsigned int v3 = a1 - 36244;
    if (v3 > 9) {
      return 4;
    }
    if (((1 << v3) & 0x10F) != 0) {
      return result;
    }
    if (((1 << v3) & 0x50) != 0) {
      return 3;
    }
    if (v3 != 9) {
      return 4;
    }
    return 2;
  }
  if (a1 > 32991)
  {
    if (a1 > 34040)
    {
      if (a1 != 34041 && a1 != 34233) {
        return 4;
      }
    }
    else if ((a1 - 33319) >= 2)
    {
      if (a1 == 32992) {
        return 3;
      }
      return 4;
    }
    return 2;
  }
  switch(a1)
  {
    case 6400:
    case 6401:
    case 6402:
    case 6403:
    case 6404:
    case 6405:
    case 6406:
    case 6409:
      return result;
    case 6407:
      return 3;
    case 6408:
      return 4;
    case 6410:
      return 2;
    default:
      if (a1 != 32841) {
        return 4;
      }
      break;
  }
  return result;
}

uint64_t gpusRowBytes(int a1, int a2, int a3)
{
  if (a2)
  {
    if (a2 == 6656) {
      return ((a3 + 7) >> 3);
    }
    else {
      return gpusPixelBytes(a1, a2) * a3;
    }
  }
  else
  {
    int v4 = 4;
    int v5 = 4;
    switch(a1)
    {
      case 37808:
      case 37840:
      case 37886:
      case 37887:
LABEL_8:
        int v5 = 1;
        break;
      case 37809:
      case 37810:
      case 37841:
      case 37842:
      case 37888:
      case 37889:
        int v5 = 1;
        int v4 = 5;
        break;
      case 37811:
      case 37812:
      case 37843:
      case 37844:
      case 37890:
      case 37891:
        int v5 = 1;
        int v4 = 6;
        break;
      case 37813:
      case 37814:
      case 37815:
      case 37845:
      case 37846:
      case 37847:
      case 37892:
      case 37893:
      case 37894:
      case 37895:
LABEL_9:
        int v5 = 1;
        int v4 = 8;
        break;
      case 37816:
      case 37817:
      case 37818:
      case 37819:
      case 37848:
      case 37849:
      case 37850:
      case 37851:
      case 37896:
      case 37897:
      case 37898:
      case 37899:
        int v5 = 1;
        int v4 = 10;
        break;
      case 37820:
      case 37821:
      case 37852:
      case 37853:
      case 37900:
      case 37901:
        int v5 = 1;
        int v4 = 12;
        break;
      case 37822:
      case 37823:
      case 37824:
      case 37825:
      case 37826:
      case 37827:
      case 37828:
      case 37829:
      case 37830:
      case 37831:
      case 37832:
      case 37833:
      case 37834:
      case 37835:
      case 37836:
      case 37837:
      case 37838:
      case 37839:
      case 37854:
      case 37855:
      case 37856:
      case 37857:
      case 37858:
      case 37859:
      case 37860:
      case 37861:
      case 37862:
      case 37863:
      case 37864:
      case 37865:
      case 37866:
      case 37867:
      case 37868:
      case 37869:
      case 37870:
      case 37871:
      case 37872:
      case 37873:
      case 37874:
      case 37875:
      case 37876:
      case 37877:
      case 37878:
      case 37879:
      case 37880:
      case 37881:
      case 37882:
      case 37883:
      case 37884:
      case 37885:
        return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
      default:
        int v5 = 4;
        switch(a1)
        {
          case 35412:
          case 35414:
LABEL_15:
            int v5 = 8;
            int v4 = 16;
            break;
          case 35413:
          case 35415:
LABEL_14:
            int v4 = 8;
            int v5 = 8;
            break;
          case 35416:
          case 35417:
          case 35418:
          case 35419:
            return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
          case 35420:
          case 35422:
            goto LABEL_8;
          case 35421:
          case 35423:
            goto LABEL_9;
          default:
            int v5 = 4;
            switch(a1)
            {
              case 35840:
              case 35842:
                goto LABEL_14;
              case 35841:
              case 35843:
                goto LABEL_15;
              default:
                return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
            }
        }
        break;
    }
    return ((int)((a3 + v4 - 1) / v4 * gpusPixelBytes(a1, 0)) / v5);
  }
}

uint64_t gpusPixelSettings(int a1, int a2, int a3, int a4, int *a5, _DWORD *a6, _DWORD *a7, int *a8, char a9)
{
  uint64_t result = gpusPixelBytes(a1, a2);
  *a6 = result;
  if (a2 && a8)
  {
    int v18 = result;
    int v19 = a8[1];
    if (!v19)
    {
      int v20 = *a8;
      if (*a8 < 1)
      {
        uint64_t result = gpusRowBytes(a1, a2, a3);
      }
      else
      {
        unsigned int v21 = v20 * result;
        unsigned int v22 = (v20 + 7) >> 3;
        uint64_t result = a2 == 6656 ? v22 : v21;
      }
      unsigned int v23 = a8[7];
      unsigned int v24 = result % v23;
      int v19 = v23 + result - result % v23;
      if (!v24) {
        int v19 = result;
      }
    }
    *a5 = v19;
    int v25 = a8[3];
    if (!v25)
    {
      int v26 = a8[2];
      if (v26 <= 0) {
        int v26 = a4;
      }
      int v25 = v26 * v19;
    }
    int v27 = a8[5];
    int v28 = v27 >> 3;
    int v29 = v27 * v18;
    if (a2 == 6656) {
      int v29 = v28;
    }
    if ((a9 & 4) != 0) {
      int v30 = a8[6];
    }
    else {
      int v30 = 0;
    }
    *a7 = v29 + v30 * v25 + a8[4] * v19;
  }
  else
  {
    *a7 = 0;
    uint64_t result = gpusRowBytes(a1, a2, a3);
    *a5 = result;
  }
  return result;
}

uint64_t gldCreateProgram(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, *(void *)(*(void *)a1 + 136), 0xD68DC258uLL);
  if (!v7) {
    abort();
  }
  *uint64_t v7 = a3;
  v7[1] = a4;
  *a2 = v7;
  return 0;
}

uint64_t gldDestroyProgram(uint64_t a1, void *a2)
{
  return 0;
}

unint64_t *gpusPPParameterOffset(unint64_t *result, unsigned int *a2, _DWORD *a3)
{
  unint64_t v3 = *result;
  *a3 = 4;
  if ((v3 & 0x1F00) == 0xE00)
  {
    *a2 = (v3 >> 14) & 0x3FFFC;
    *a3 = (v3 >> 30) & 0x1C;
  }
  return result;
}

void gpumDeleteCachedProgram(uint64_t a1, uint64_t a2, void *ptr)
{
  uint64_t v6 = ptr[1];
  uint64_t v5 = ptr[2];
  if (v5)
  {
    *(void *)(v5 + 8) = v6;
    uint64_t v6 = ptr[1];
  }
  else
  {
    *(void *)(a2 + 16) = v6;
  }
  if (v6) {
    uint64_t v7 = (void *)(v6 + 16);
  }
  else {
    uint64_t v7 = (void *)(a2 + 24);
  }
  *uint64_t v7 = v5;
  --*(_DWORD *)(a2 + 48);
  if (ptr[3]) {
    (*(void (**)(void))(*(void *)a1 + 40))(*ptr);
  }
  int v8 = *(malloc_zone_t **)(*(void *)a1 + 232);
  malloc_zone_free(v8, ptr);
}

void *gpumGetCachedProgram(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    uint64_t v5 = *(void **)(a2 + 16);
    while ((uint64_t *)*v5 != a1)
    {
      uint64_t v5 = (void *)v5[1];
      if (!v5) {
        goto LABEL_5;
      }
    }
    uint64_t v10 = v5[2];
    if (v10)
    {
      *(void *)(v10 + 8) = v5[1];
      uint64_t v11 = v5[1];
      if (v11) {
        unint64_t v12 = (void *)(v11 + 16);
      }
      else {
        unint64_t v12 = (void *)(a2 + 24);
      }
      *unint64_t v12 = v10;
      v5[1] = v4;
      v5[2] = 0;
      *(void *)(v4 + 16) = v5;
      *(void *)(a2 + 16) = v5;
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = malloc_type_zone_malloc(*(malloc_zone_t **)(*a1 + 232), 0x40uLL, 0x1357CB10uLL);
    if (!v6) {
      abort();
    }
    uint64_t v5 = v6;
    v6[2] = 0;
    uint64_t v7 = *(void *)(a2 + 16);
    void *v6 = a1;
    v6[1] = v7;
    if (v7) {
      *(void *)(v7 + 16) = v6;
    }
    v6[3] = 0;
    (*(void (**)(void *))(*a1 + 56))(v6 + 4);
    *(void *)(a2 + 16) = v5;
    int v8 = *(void **)(a2 + 24);
    if (!v8)
    {
      *(void *)(a2 + 24) = v5;
      int v8 = v5;
    }
    unsigned int v9 = *(_DWORD *)(a2 + 48) + 1;
    *(_DWORD *)(a2 + 48) = v9;
    if (v9 >= 5) {
      gpumDeleteCachedProgram(a1[2], a2, v8);
    }
  }
  return v5;
}

void gpuiCleanContextFromProgram(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a2 + 16);
  if (v2)
  {
    while (*v2 != a1)
    {
      int v2 = (void *)v2[1];
      if (!v2) {
        return;
      }
    }
    gpumDeleteCachedProgram(*(void *)(a1 + 16), a2, v2);
  }
}

uint64_t gldObjectPurgeable(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = a5;
  if (a2 != 3)
  {
    if (a2 != 1) {
      return 35355;
    }
    uint64_t v8 = *(void *)(a3 + 32);
    if (v8)
    {
      uint64_t v9 = a1[1];
      uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v9 + 512);
      if (v10)
      {
        LODWORD(result) = v10(a1, a3, a4, a5);
      }
      else if (a4 == 35353)
      {
        unint64_t v17 = (_DWORD *)a1[269];
        if ((unint64_t)(v17 + 3) > a1[270])
        {
          (*(void (**)(void *, uint64_t))(v9 + 472))(a1, 2);
          unint64_t v17 = (_DWORD *)a1[269];
        }
        a1[269] = v17 + 3;
        *unint64_t v17 = 197888;
        v17[1] = (a1[141] - a1[139]) >> 2;
        IOAccelContextAddResource();
        IOAccelResourceRelease();
        *(void *)(a3 + 24) = 0;
        *(void *)(a3 + 32) = 0;
        *(void *)(a3 + 40) = 0;
        *(unsigned char *)(*(void *)(a3 + 8) + 20) = 3;
        LODWORD(result) = 35353;
      }
      else if ((*(unsigned char *)(v8 + 260) & 0xF) != 0)
      {
        LODWORD(result) = 35355;
      }
      else
      {
        uint64_t v22 = a1[269];
        if ((unint64_t)(v22 + 16) > a1[270])
        {
          (*(void (**)(void *, uint64_t))(v9 + 472))(a1, 2);
          uint64_t v22 = a1[269];
        }
        a1[269] = v22 + 16;
        *(_DWORD *)uint64_t v22 = 263168;
        *(_DWORD *)(v22 + 4) = (a1[141] - a1[139]) >> 2;
        IOAccelContextAddResource();
        *(unsigned char *)(v22 + 14) = 0;
        int v23 = *(_DWORD *)(v8 + 260);
        *(unsigned char *)(v22 + 13) = (v23 & 0x40) != 0;
        *(unsigned char *)(v22 + 12) = (v23 & 0x80) == 0 || !v5;
        LODWORD(result) = 35354;
      }
      if ((*(unsigned char *)(*(void *)(a3 + 8) + 20) & 0xF) != 0) {
        return 35355;
      }
      else {
        return result;
      }
    }
    BOOL v16 = (*(unsigned char *)(*(void *)(a3 + 8) + 20) & 0xF) == 0;
LABEL_13:
    if (v16) {
      return 35353;
    }
    else {
      return 35355;
    }
  }
  uint64_t v12 = *(void *)(a3 + 16);
  if (!v12 || (uint64_t v13 = *(void *)(v12 + 8)) == 0)
  {
    BOOL v16 = **(void **)a3 == 0;
    goto LABEL_13;
  }
  uint64_t v14 = a1[1];
  int v15 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t))(v14 + 528);
  if (v15)
  {
    uint64_t result = v15(a1, a3, a4, a5);
  }
  else if (a4 == 35353)
  {
    int v18 = (_DWORD *)a1[269];
    if ((unint64_t)(v18 + 3) > a1[270])
    {
      (*(void (**)(void *, uint64_t))(v14 + 472))(a1, 2);
      int v18 = (_DWORD *)a1[269];
    }
    a1[269] = v18 + 3;
    *int v18 = 197888;
    v18[1] = (a1[141] - a1[139]) >> 2;
    IOAccelContextAddResource();
    IOAccelResourceRelease();
    int v19 = *(_OWORD **)(a3 + 16);
    *int v19 = 0u;
    v19[1] = 0u;
    (*(void (**)(void))(a1[1] + 152))(a1[2]);
    malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), *(void **)(a3 + 16));
    *(void *)(a3 + 16) = 0;
    **(_DWORD **)(a3 + 8) = 1;
    uint64_t result = 35353;
  }
  else
  {
    if ((*(unsigned char *)(v13 + 260) & 0xF) == 0)
    {
      uint64_t v20 = a1[269];
      if ((unint64_t)(v20 + 16) > a1[270])
      {
        (*(void (**)(void *, uint64_t))(v14 + 472))(a1, 2);
        uint64_t v20 = a1[269];
      }
      a1[269] = v20 + 16;
      *(_DWORD *)uint64_t v20 = 263168;
      *(_DWORD *)(v20 + 4) = (a1[141] - a1[139]) >> 2;
      IOAccelContextAddResource();
      *(unsigned char *)(v20 + 14) = 0;
      int v21 = *(_DWORD *)(v13 + 260);
      *(unsigned char *)(v20 + 13) = (v21 & 0x40) != 0;
      *(unsigned char *)(v20 + 12) = (v21 & 0x80) == 0 || !v5;
    }
    uint64_t result = 35355;
  }
  if ((**(unsigned char **)(a3 + 8) & 5) != 0)
  {
    if (**(void **)a3) {
      return 35355;
    }
    else {
      return 35356;
    }
  }
  return result;
}

uint64_t gldObjectUnpurgeable(void *a1, int a2, void *a3, int a4, _DWORD *a5)
{
  if (a2 != 3)
  {
    if (a2 != 1) {
      return 35355;
    }
    uint64_t v8 = (unsigned __int16 *)a3[5];
    if ((*(unsigned char *)(a3[1] + 20) & 0xF) != 0)
    {
      if (v8) {
        *((unsigned char *)v8 + 29) = 0;
      }
      goto LABEL_26;
    }
    if (!v8)
    {
LABEL_26:
      *a5 = 1;
      return 35356;
    }
    uint64_t v11 = a3[4];
    *a5 = (*(_DWORD *)(v11 + 260) & 0xFFFFFFBF) == 0;
    uint64_t v12 = a1[1];
    uint64_t v13 = *(uint64_t (**)(void))(v12 + 520);
    if (!v13)
    {
      if ((*(unsigned char *)(v11 + 260) & 0xF) == 0)
      {
        uint64_t v14 = a1[269];
        if ((unint64_t)(v14 + 16) > a1[270])
        {
          (*(void (**)(void *, uint64_t))(v12 + 472))(a1, 2);
          uint64_t v14 = a1[269];
        }
        a1[269] = v14 + 16;
        *(_DWORD *)uint64_t v14 = 263168;
        *(_DWORD *)(v14 + 4) = (a1[141] - a1[139]) >> 2;
        IOAccelContextAddResource();
        *(_WORD *)(v14 + 12) = 0;
        if (a4 == 35355)
        {
          *(unsigned char *)(v14 + 14) = 0;
          if (a1[141] > a1[139] || a1[269] > (unint64_t)(a1[271] + 16)) {
            (*(void (**)(void *, uint64_t))(a1[1] + 472))(a1, 2);
          }
          uint64_t v15 = *(unsigned __int8 *)(*a3 + 211);
          if (!*(unsigned char *)(*a3 + 211)) {
            return 35356;
          }
          int v16 = 0;
          do
          {
            v16 |= *v8;
            if ((*(_DWORD *)(v11 + 260) & 0x40) != 0) {
              v16 |= v8[6];
            }
            ++v8;
            --v15;
          }
          while (v15);
          if (!v16) {
            return 35356;
          }
          return 35355;
        }
LABEL_45:
        *(unsigned char *)(v14 + 14) = 1;
        return 35356;
      }
      return 35355;
    }
    goto LABEL_29;
  }
  uint64_t v9 = a3[2];
  if ((*(unsigned char *)a3[1] & 5) != 0)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(v9 + 16);
      if (v10) {
        *(unsigned char *)(v10 + 29) = 0;
      }
    }
    goto LABEL_26;
  }
  uint64_t v18 = *(void *)(v9 + 8);
  *a5 = (*(_DWORD *)(v18 + 260) & 0xFFFFFFBF) == 0;
  uint64_t v19 = a1[1];
  uint64_t v13 = *(uint64_t (**)(void))(v19 + 536);
  if (v13)
  {
LABEL_29:
    return v13();
  }
  if ((*(unsigned char *)(v18 + 260) & 0xF) != 0) {
    return 35355;
  }
  uint64_t v20 = *(unsigned __int16 **)(v9 + 16);
  uint64_t v14 = a1[269];
  if ((unint64_t)(v14 + 16) > a1[270])
  {
    (*(void (**)(void *, uint64_t))(v19 + 472))(a1, 2);
    uint64_t v14 = a1[269];
  }
  a1[269] = v14 + 16;
  *(_DWORD *)uint64_t v14 = 263168;
  *(_DWORD *)(v14 + 4) = (a1[141] - a1[139]) >> 2;
  IOAccelContextAddResource();
  *(_WORD *)(v14 + 12) = 0;
  if (a4 != 35355) {
    goto LABEL_45;
  }
  *(unsigned char *)(v14 + 14) = 0;
  if (a1[141] > a1[139] || a1[269] > (unint64_t)(a1[271] + 16)) {
    (*(void (**)(void *, uint64_t))(a1[1] + 472))(a1, 2);
  }
  int v21 = *v20;
  if ((*(unsigned char *)(v18 + 260) & 0x40) != 0) {
    v21 |= v20[6];
  }
  if (v21) {
    return 35355;
  }
  else {
    return 35356;
  }
}

uint64_t gpuiDestroyQueryBufferClientAlloc(uint64_t a1)
{
  if (**(void **)(a1 + 824))
  {
    IOAccelResourceRelease();
    int v2 = *(void **)(a1 + 824);
    void *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
  }
  (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 232))(a1);
  return 0;
}

uint64_t gpumCreateQuery(uint64_t a1, void *a2, size_t a3)
{
  int v5 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, *(void *)(*(void *)a1 + 192), 0xD68DC258uLL);
  if (!v5) {
LABEL_40:
  }
    abort();
  unsigned int v6 = 0;
  *(void *)int v5 = 0xCFFFFFFFFLL;
  ptr = v5;
  v5[2] = 0;
  while (1)
  {
    unsigned int v7 = *(_DWORD *)(a1 + 2252);
    unsigned int v8 = v7 >> 5;
    if (v7 >= 0x20)
    {
      uint64_t v10 = 0;
      uint64_t v9 = v8 <= 1 ? 1 : v8;
      while (1)
      {
        unsigned int v6 = *(_DWORD *)(*(void *)(a1 + 2240) + 4 * v10);
        if (v6 != -1) {
          break;
        }
        if (v9 == ++v10)
        {
          unsigned int v6 = -1;
          goto LABEL_12;
        }
      }
      LODWORD(v9) = v10;
    }
    else
    {
      LODWORD(v9) = 0;
    }
LABEL_12:
    if (v9 != v8) {
      break;
    }
    uint64_t v11 = *(void *)(a1 + 8);
    uint64_t v12 = *(void *)(v11 + 568);
    uint64_t v13 = *(void *)(v11 + 560);
    uint64_t v14 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, a3, 0xD68DC258uLL);
    if (!v14) {
      goto LABEL_40;
    }
    uint64_t v15 = (uint64_t *)v14;
    if (*(_DWORD *)(a1 + 2248))
    {
      int v16 = 2 * *(_DWORD *)(a1 + 2252);
      unsigned int v17 = v13 + v12 + v12 * v16;
    }
    else
    {
      unsigned int v17 = v13 + v12 + 32 * v12;
      int v16 = 32;
    }
    *((void *)v14 + 2) = 0;
    uint64_t v18 = v14 + 16;
    *((void *)v14 + 1) = 0;
    *((_DWORD *)v14 + 6) = 0;
    *((void *)v14 + 11) = 0;
    *((void *)v14 + 12) = 0;
    *((void *)v14 + 13) = 0;
    *((void *)v14 + 14) = v17;
    *((_WORD *)v14 + 28) = 257;
    v14[58] = 0;
    *((_WORD *)v14 + 16) = v17;
    *(_DWORD *)(v14 + 34) = 65537;
    *((void *)v14 + 5) = 0;
    *((void *)v14 + 6) = v17;
    uint64_t v19 = IOAccelResourceCreate();
    *uint64_t v15 = v19;
    v15[1] = IOAccelResourceGetClientShared();
    *(unsigned char *)(*(void *)v18 + 28) = 1;
    IOAccelResourceRelease();
    if (!v19)
    {
      malloc_zone_free(*(malloc_zone_t **)(*(void *)a1 + 232), ptr);
      __int16 v35 = 0;
      uint64_t result = 10016;
      int v32 = a2;
      goto LABEL_39;
    }
    uint64_t DataBytes = IOAccelResourceGetDataBytes();
    int v21 = (void *)DataBytes;
    uint64_t v22 = *(const void **)(a1 + 2232);
    if (v22 && DataBytes)
    {
      uint64_t v23 = *(void *)(a1 + 824);
      if (v23)
      {
        if (*(_DWORD *)(*(void *)(v23 + 16) + 24) != 1) {
          (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 472))(a1, 2);
        }
        IOAccelResourceFinishEvent();
        uint64_t v22 = *(const void **)(a1 + 2232);
      }
      memcpy(v21, v22, *(unsigned int *)(a1 + 2248));
    }
    unsigned int v24 = *(void **)(a1 + 824);
    if (v24)
    {
      if (*v24)
      {
        gpuiDestroyQueryBufferClientAlloc(a1);
        unsigned int v24 = *(void **)(a1 + 824);
      }
      malloc_zone_free(*(malloc_zone_t **)(*(void *)a1 + 232), v24);
    }
    *(void *)(a1 + 824) = v15;
    *(void *)(a1 + 2232) = v21;
    *(_DWORD *)(a1 + 2252) = v16;
    *(_DWORD *)(a1 + 2248) = v17;
    (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 224))(a1);
    unint64_t v25 = *(unsigned int *)(a1 + 2252);
    size_t v26 = v25 >> 3;
    int v27 = *(void **)(a1 + 2240);
    int v28 = *(malloc_zone_t **)(*(void *)a1 + 232);
    if (v27)
    {
      int v29 = (char *)malloc_type_zone_realloc(v28, v27, v26, 0xDB6CA469uLL);
      if (!v29) {
        goto LABEL_40;
      }
      *(void *)(a1 + 2240) = v29;
      bzero(&v29[v25 >> 4], v25 >> 4);
    }
    else
    {
      int v30 = malloc_type_zone_calloc(v28, 1uLL, v26, 0xD68DC258uLL);
      if (!v30) {
        goto LABEL_40;
      }
      *(void *)(a1 + 2240) = v30;
    }
  }
  int v31 = 0;
  int v32 = a2;
  do
  {
    if (((v6 >> v31) & 1) == 0) {
      break;
    }
    ++v31;
  }
  while (v31 != 32);
  uint64_t result = 0;
  *(_DWORD *)(*(void *)(a1 + 2240) + 4 * v9) |= 1 << v31;
  int v34 = v31 + 32 * v9;
  __int16 v35 = ptr;
  ptr[2] = v34;
LABEL_39:
  *int v32 = v35;
  return result;
}

uint64_t gpumModifyQuery(uint64_t a1, uint64_t a2, int a3, void *a4, void (*a5)(uint64_t, uint64_t, void), void (*a6)(uint64_t, uint64_t, void))
{
  uint64_t v11 = *(int *)(a2 + 4);
  if (v11 != 12)
  {
    a5(a1, a2, *(int *)(a2 + 4));
    *(_DWORD *)(a2 + 4) = 12;
    *(void *)(a1 + 8 * v11 + 712) = 0;
  }
  if (a3) {
    return 10010;
  }
  a6(a1, a2, *a4);
  return 0;
}

uint64_t gpumGetQueryInfo(uint64_t a1, _DWORD *a2, uint64_t a3, void *a4, void (*a5)(uint64_t, void, uint64_t), void (*a6)(uint64_t, _DWORD *, uint64_t), uint64_t (*a7)(void, void, void, void))
{
  if (!a3)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 520);
    if (v14 == *(void *)(a1 + 800))
    {
      uint64_t v15 = (int)a2[1];
      if ((int)v15 > 9) {
        return 0;
      }
    }
    else
    {
      a5(a1, *(void *)(*(void *)(a1 + 40) + 520), 11);
      *(_DWORD *)(v14 + 4) = 11;
      *(void *)(a1 + 800) = v14;
      uint64_t v15 = (int)a2[1];
    }
    a6(a1, a2, v15);
    uint64_t result = 0;
    a2[1] = 12;
    *(void *)(a1 + 8 * v15 + 712) = 0;
    return result;
  }
  if (*a2 == -1)
  {
    if (a3 == 34918)
    {
      uint64_t result = 0;
      *a4 = 0;
    }
    else if (a3 == 34919)
    {
      uint64_t result = 0;
      *a4 = 1;
    }
    else
    {
      return 10010;
    }
  }
  else
  {
    uint64_t v12 = (int)a2[1];
    if ((int)v12 <= 9)
    {
      int v16 = a7;
      a6(a1, a2, (int)a2[1]);
      a7 = v16;
      a2[1] = 12;
      *(void *)(a1 + 8 * v12 + 712) = 0;
    }
    return a7(a1, a2, a3, a4);
  }
  return result;
}

uint64_t gpumDestroyQuery(void *a1, int *ptr, void (*a3)(void *, int *, void))
{
  uint64_t v5 = ptr[1];
  if (v5 != 12)
  {
    a3(a1, ptr, ptr[1]);
    ptr[1] = 12;
    a1[v5 + 89] = 0;
  }
  *(_DWORD *)(a1[280] + (((unint64_t)ptr[2] >> 3) & 0x1FFFFFFC)) &= ~(1 << ptr[2]);
  malloc_zone_free(*(malloc_zone_t **)(*a1 + 232), ptr);
  return 0;
}

uint64_t gpumLoadCurrentQueries(uint64_t result, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = result;
  for (uint64_t i = 0; i != 11; ++i)
  {
    uint64_t v7 = *(void *)(v5 + 40) + 8 * i;
    uint64_t v8 = *(void *)(v7 + 432);
    uint64_t v9 = v5 + 8 * i;
    uint64_t v10 = *(void *)(v9 + 712);
    if (v8 != v10)
    {
      if (v8)
      {
        uint64_t v11 = *(int *)(v8 + 4);
        if (v11 != 12)
        {
          uint64_t result = a3(v5, *(void *)(v7 + 432), *(int *)(v8 + 4));
          *(_DWORD *)(v8 + 4) = 12;
          *(void *)(v5 + 8 * v11 + 712) = 0;
          uint64_t v10 = *(void *)(v9 + 712);
        }
      }
      if (v10)
      {
        uint64_t v12 = *(int *)(v10 + 4);
        uint64_t result = a3(v5, v10, v12);
        *(_DWORD *)(v10 + 4) = 12;
        *(void *)(v5 + 8 * v12 + 712) = 0;
      }
      if (v8)
      {
        uint64_t result = a2(v5, v8, i);
        *(_DWORD *)(v8 + 4) = i;
        *(void *)(v9 + 712) = v8;
      }
    }
  }
  return result;
}

uint64_t gldReadFramebufferData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    int v17 = **(_DWORD **)(a10 + 8);
    if (v17)
    {
      uint64_t v18 = *(void *)(a1 + 16);
      if (*(unsigned char *)(v18 + 288))
      {
        pthread_mutex_lock((pthread_mutex_t *)(v18 + 48));
        LOBYTE(v17) = **(unsigned char **)(a10 + 8);
      }
      if ((_BYTE)v17
        && (*(unsigned int (**)(void, uint64_t, void))(*(void *)(a1 + 8) + 320))(*(void *)(a1 + 16), a10, v17))
      {
        LOBYTE(v17) = 0;
        **(_DWORD **)(a10 + 8) = 0;
      }
      uint64_t v19 = *(void *)(a1 + 16);
      if (*(unsigned char *)(v19 + 288)) {
        pthread_mutex_unlock((pthread_mutex_t *)(v19 + 48));
      }
      if ((_BYTE)v17) {
        return 0;
      }
    }
  }
  int v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8)
                                                                                                + 448);
  return v21(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t gldCreateSampler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, *(void *)(*(void *)a1 + 120), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  uint64_t v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  int v10 = *(_DWORD *)(a1 + 320) + 1;
  *(_DWORD *)(a1 + 320) = v10;
  *((_DWORD *)v8 + 4) = v10;
  (*(void (**)(uint64_t, void *))(*(void *)(a1 + 8) + 112))(a1, v8);
  *a2 = v9;
  return 0;
}

BOOL gldLoadSampler(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned char **)(a2 + 8);
  uint64_t v3 = *v2;
  if (!*v2) {
    return v3 == 0;
  }
  if (!*(unsigned char *)(a1 + 288))
  {
    int v7 = *(_DWORD *)(a1 + 320) + 1;
    *(_DWORD *)(a1 + 320) = v7;
    *(_DWORD *)(a2 + 16) = v7;
LABEL_6:
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 312))(a1, a2, v3))
    {
      LODWORD(v3) = 0;
      **(unsigned char **)(a2 + 8) = 0;
    }
    goto LABEL_8;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  uint64_t v3 = **(unsigned __int8 **)(a2 + 8);
  int v6 = *(_DWORD *)(a1 + 320) + 1;
  *(_DWORD *)(a1 + 320) = v6;
  *(_DWORD *)(a2 + 16) = v6;
  if (v3) {
    goto LABEL_6;
  }
LABEL_8:
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return v3 == 0;
}

uint64_t gldDestroySampler(void *a1, void *a2)
{
  return 0;
}

uint64_t gpusLoadCurrentSamplers(uint64_t result, unsigned __int16 a2)
{
  uint64_t v2 = *(void *)(result + 24);
  if (!*(unsigned char *)(v2 + 12724)) {
    return result;
  }
  uint64_t v3 = (void *)result;
  unsigned int v4 = 0;
  uint64_t v5 = *(void *)(result + 16);
  unsigned int v6 = a2;
  unsigned int v15 = a2;
  do
  {
    if (!v6) {
      goto LABEL_21;
    }
    unsigned int v16 = v4;
    int v7 = 16 * v4;
    do
    {
      unsigned int v8 = __clz(__rbit32(v6));
      uint64_t v9 = v8 + v7;
      uint64_t v10 = *(void *)(v3[5] + 8 * v9 + 720);
      if (!v10)
      {
        if (!v3[v9 + 57])
        {
          uint64_t v10 = 0;
          goto LABEL_18;
        }
        uint64_t v10 = 0;
        *((_DWORD *)v3 + v9 + 244) = 0;
        uint64_t v13 = 1;
        goto LABEL_17;
      }
      uint64_t v11 = (_DWORD *)v3 + v9 + 244;
      int v12 = *(_DWORD *)(v10 + 16);
      if (*v11 == v12) {
        uint64_t v13 = **(unsigned __int8 **)(v10 + 8);
      }
      else {
        uint64_t v13 = 1;
      }
      if (**(unsigned char **)(v10 + 8))
      {
        int v14 = *(_DWORD *)(v5 + 320) + 1;
        *(_DWORD *)(v5 + 320) = v14;
        *(_DWORD *)(v10 + 16) = v14;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v3[1] + 312))(v5, v10);
        if (result)
        {
          **(unsigned char **)(v10 + 8) = 0;
          int v12 = *(_DWORD *)(v10 + 16);
          goto LABEL_12;
        }
        uint64_t v10 = 0;
        *uint64_t v11 = 0;
        uint64_t v13 = v3[v9 + 57] != 0;
        if (!v3[v9 + 57]) {
          goto LABEL_18;
        }
LABEL_17:
        uint64_t result = (*(uint64_t (**)(void *, uint64_t, void, uint64_t))(v3[1] + 384))(v3, v10, v8 + v7, v13);
        goto LABEL_18;
      }
LABEL_12:
      *uint64_t v11 = v12;
      if (v13) {
        goto LABEL_17;
      }
LABEL_18:
      v3[v9 + 57] = v10;
      v6 ^= 1 << v8;
    }
    while (v6);
    uint64_t v2 = v3[3];
    unsigned int v6 = v15;
    unsigned int v4 = v16;
LABEL_21:
    ++v4;
  }
  while (v4 < *(unsigned __int8 *)(v2 + 12724));
  return result;
}

uint64_t gldCreateShareGroup(uint64_t a1, char **a2, uint64_t a3)
{
  *a2 = 0;
  uint64_t v6 = IOAccelSharedCreate();
  if (!v6) {
    return 10015;
  }
  uint64_t v7 = v6;
  unsigned int v8 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, *(void *)(*(void *)a1 + 72), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  uint64_t v9 = v8;
  *(void *)unsigned int v8 = *(void *)a1;
  *((void *)v8 + 1) = a1;
  *((void *)v8 + 2) = a3;
  *((void *)v8 + 5) = v7;
  *((_DWORD *)v8 + 74) = *(_DWORD *)(a1 + 764);
  pthread_mutex_init((pthread_mutex_t *)(v8 + 48), 0);
  v9[288] = 0;
  *((_DWORD *)v9 + 73) = 1;
  *((_DWORD *)v9 + 75) = 0;
  *((void *)v9 + 4) = glgCreateProcessor();
  (*(void (**)(char *, void))(a1 + 16))(v9, 0);
  uint64_t result = 10020;
  if (*((_DWORD *)v9 + 75) != 10020)
  {
    uint64_t result = 0;
    *a2 = v9;
  }
  return result;
}

uint64_t gldDestroyShareGroup(uint64_t a1)
{
  for (uint64_t i = 0; i != 88; i += 8)
  {
    uint64_t v3 = a1 + i;
    unsigned int v4 = *(void **)(a1 + i + 112);
    if (v4)
    {
      gpusDestroyZeroTexture((void *)a1, v4);
      *(void *)(v3 + 112) = 0;
    }
    uint64_t v5 = *(void **)(v3 + 200);
    if (v5)
    {
      gpusDestroyZeroTexture((void *)a1, v5);
      *(void *)(v3 + 200) = 0;
    }
  }
  (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 24))(a1);
  IOAccelSharedRelease();
  glgDestroyProcessor();
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 48));
  malloc_zone_free(*(malloc_zone_t **)(*(void *)a1 + 232), (void *)a1);
  return 0;
}

uint64_t gpusPixelSize(int a1)
{
  unsigned int v1 = ((a1 & 0x30000000) != 0) << 8;
  if ((a1 & 0xC000000) != 0) {
    unsigned int v1 = 128;
  }
  if ((a1 & 0x3F00000) != 0) {
    unsigned int v1 = 64;
  }
  if ((a1 & 0xFC000) != 0) {
    unsigned int v1 = 32;
  }
  if ((a1 & 0x3FC0) != 0) {
    unsigned int v1 = 16;
  }
  if ((a1 & 0x3C) != 0) {
    return 8;
  }
  else {
    return v1;
  }
}

uint64_t gpusDepthSize(unsigned int a1)
{
  if ((a1 & 0x400) != 0) {
    int v1 = 16;
  }
  else {
    int v1 = (a1 >> 4) & 8;
  }
  if ((a1 & 0x800) != 0) {
    unsigned int v2 = 24;
  }
  else {
    unsigned int v2 = v1;
  }
  if ((a1 & 0x1000) != 0) {
    return 32;
  }
  else {
    return v2;
  }
}

uint64_t gpusAlphaSize(unsigned int a1)
{
  if ((a1 & 0x2800000) != 0) {
    int v1 = 16;
  }
  else {
    int v1 = (a1 >> 22) & 0x20;
  }
  if ((a1 & 0x200000) != 0) {
    int v2 = 12;
  }
  else {
    int v2 = v1;
  }
  if ((a1 & 0x9A928) != 0) {
    int v3 = 8;
  }
  else {
    int v3 = v2;
  }
  if ((a1 & 0x80) != 0) {
    int v4 = 4;
  }
  else {
    int v4 = v3;
  }
  if ((a1 & 0x40000) != 0) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = v4;
  }
  if ((a1 & 0x400) != 0) {
    return 1;
  }
  else {
    return v5;
  }
}

uint64_t gpusColorSizes(unsigned int a1, uint64_t a2)
{
  *(_WORD *)(a2 + 8) = 0;
  *(void *)a2 = 0;
  if ((a1 & 0x3C) != 0)
  {
    __int16 v2 = 2;
    __int16 v3 = 3;
    __int16 v4 = 3;
LABEL_10:
    *(_WORD *)a2 = v3;
    *(_WORD *)(a2 + 2) = v4;
    *(_WORD *)(a2 + 4) = v2;
    *(_WORD *)(a2 + 6) = gpusAlphaSize(a1);
    return 1;
  }
  if ((a1 & 0x1C0) != 0)
  {
    __int16 v3 = 4;
    __int16 v4 = 4;
    __int16 v2 = 4;
    goto LABEL_10;
  }
  if ((a1 & 0xE00) != 0)
  {
    __int16 v3 = 5;
    __int16 v4 = 5;
LABEL_9:
    __int16 v2 = 5;
    goto LABEL_10;
  }
  if ((a1 & 0x3000) != 0)
  {
    __int16 v4 = 6;
    __int16 v3 = 5;
    goto LABEL_9;
  }
  if ((a1 & 0x1C000) != 0)
  {
    __int16 v3 = 8;
    __int16 v4 = 8;
    __int16 v2 = 8;
    goto LABEL_10;
  }
  if ((a1 & 0xE0000) != 0)
  {
    __int16 v3 = 10;
    __int16 v4 = 10;
    __int16 v2 = 10;
    goto LABEL_10;
  }
  if ((a1 & 0x300000) != 0)
  {
    __int16 v3 = 12;
    __int16 v4 = 12;
    __int16 v2 = 12;
    goto LABEL_10;
  }
  if ((a1 & 0x2C00000) != 0)
  {
    __int16 v3 = 16;
    __int16 v4 = 16;
    __int16 v2 = 16;
    goto LABEL_10;
  }
  if ((a1 & 0x8000000) != 0)
  {
    __int16 v3 = 32;
    __int16 v4 = 32;
    __int16 v2 = 32;
    goto LABEL_10;
  }
  return 0;
}

uint64_t gldFlushContext(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 472))();
}

uint64_t gldWaitForContext(uint64_t a1)
{
  __int16 v2 = *(void (**)(uint64_t))(*(void *)(a1 + 8) + 544);
  if (v2) {
    v2(a1);
  }
  do
    uint64_t result = MEMORY[0x230F45920](*(void *)(a1 + 64));
  while (result == -536870186);
  return result;
}

uint64_t gldFinishContext(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 8) + 472))();
  __int16 v2 = *(void (**)(uint64_t))(*(void *)(a1 + 8) + 544);
  if (v2) {
    v2(a1);
  }
  do
    uint64_t result = MEMORY[0x230F45920](*(void *)(a1 + 64));
  while (result == -536870186);
  return result;
}

uint64_t gpusCheckResource(uint64_t a1, int a2)
{
  return MEMORY[0x270F3D2B8](a1, a2 == 0);
}

uint64_t gpusWaitResource()
{
  return IOAccelResourceFinishSysMem();
}

void gpusTestContextResource()
{
}

void gpusFlushContextResource()
{
}

void gpusFinishContextResource()
{
}

void gpusFinishQueueResourceUsingFlushFunc()
{
}

uint64_t gldTestObject(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  uint64_t result = 1;
  switch(a2)
  {
    case 0:
      uint64_t result = gpuiTestFence(a1, a5, a4);
      break;
    case 1:
      uint64_t v7 = *(void *)(a5 + 24);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_5;
    case 2:
      return result;
    case 3:
      unsigned int v8 = *(uint64_t **)(a5 + 16);
      if (v8)
      {
        uint64_t v7 = *v8;
        if (a4)
        {
LABEL_5:
          if (v7) {
            JUMPOUT(0x230F459F0);
          }
        }
        else
        {
LABEL_9:
          if (v7) {
            uint64_t result = MEMORY[0x270F3D2B8](v7, a3 == 0);
          }
        }
      }
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t gldFlushObject(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 0:
      gpuiFlushFence(a1, a4);
      goto LABEL_9;
    case 1:
      if (!*(void *)(a4 + 24)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      uint64_t v6 = *(void **)(a4 + 16);
      if (v6 && *v6) {
LABEL_8:
      }
        MEMORY[0x230F45950](*(void *)(a1 + 64));
LABEL_9:
      uint64_t result = 0;
      break;
    default:
      uint64_t result = 10010;
      break;
  }
  return result;
}

uint64_t gldFinishObject(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 0:
      gpuiFinishFence(a1, a4);
      goto LABEL_9;
    case 1:
      if (!a4[3]) {
        goto LABEL_9;
      }
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      uint64_t v6 = (void *)a4[2];
      if (v6 && *v6) {
LABEL_8:
      }
        MEMORY[0x230F45940](*(void *)(a1 + 64));
LABEL_9:
      uint64_t result = 0;
      break;
    default:
      uint64_t result = 10010;
      break;
  }
  return result;
}

uint64_t gldWaitForObject(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 0:
      gpuiWaitForFence(a1, a4);
      return 0;
    case 1:
      uint64_t result = a4[3];
      if (!result) {
        return result;
      }
      goto LABEL_8;
    case 2:
      return result;
    case 3:
      uint64_t v6 = (uint64_t *)a4[2];
      if (!v6) {
        return 0;
      }
      uint64_t result = *v6;
      if (*v6)
      {
LABEL_8:
        IOAccelResourceFinishSysMem();
        return 0;
      }
      return result;
    default:
      return 10010;
  }
}

uint64_t gldFinishBufferCPUAccess(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 416))(a2);
}

uint64_t gldCreateTexture(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, *(void *)(*(void *)a1 + 112), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  uint64_t v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  v8[6] = 0;
  int v10 = *(_DWORD *)(a1 + 316) + 1;
  *(_DWORD *)(a1 + 316) = v10;
  *((_DWORD *)v8 + 14) = v10;
  (*(void (**)(uint64_t, void *))(*(void *)(a1 + 8) + 96))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldModifyTexture(uint64_t a1, void *a2)
{
  __int16 v3 = a2 + 3;
  uint64_t v2 = a2[3];
  *(unsigned char *)(a2[1] + 20) |= 2u;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 288)) {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    }
    uint64_t v6 = a2[4];
    if (v6 && (*(_DWORD *)(v6 + 260) & 0x8F) == 0x80)
    {
      IOAccelResourceRelease();
      *__int16 v3 = 0;
      v3[1] = 0;
      v3[2] = 0;
    }
    if (*(unsigned char *)(a1 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    }
  }
  return 0;
}

BOOL gldLoadTexture(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a2 + 8);
  uint64_t v3 = *((unsigned __int8 *)v2 + 20);
  if (!*((unsigned char *)v2 + 20)) {
    return v3 == 0;
  }
  int v6 = **(_WORD **)a2 & 0xF;
  if (*(unsigned char *)(a1 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    uint64_t v2 = *(uint64_t **)(a2 + 8);
    uint64_t v3 = *((unsigned __int8 *)v2 + 20);
  }
  int v7 = *(_DWORD *)(a1 + 316) + 1;
  *(_DWORD *)(a1 + 316) = v7;
  *(_DWORD *)(a2 + 56) = v7;
  uint64_t v8 = *v2;
  if (v6 == 7 || v8 != 0)
  {
    BOOL v10 = (v3 & 8) == 0;
    if ((v3 & 8) != 0 && v8)
    {
      uint64_t v11 = *(_DWORD **)(v8 + 8);
      if (*v11)
      {
        if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(a1 + 8) + 320))(a1, v8, *v11))goto LABEL_23; {
        uint64_t v11 = *(_DWORD **)(v8 + 8);
        }
      }
      *uint64_t v11 = 0;
      BOOL v10 = 1;
    }
    BOOL v12 = !v10 || v3 == 0;
    if (v12
      || !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 296))(a1, a2, v3, *(void *)(a2 + 8) + 8))
    {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v3
    && (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)(a1 + 8) + 296))(a1, a2, v3, v2 + 1))
  {
LABEL_22:
    LODWORD(v3) = 0;
    uint64_t v13 = *(void *)(a2 + 8);
    *(void *)(v13 + 13) = 0;
    *(void *)(v13 + 8) = 0;
  }
LABEL_23:
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return v3 == 0;
}

uint64_t gldReclaimTexture(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  }
  uint64_t result = gpulDeleteKernelTexture(a2);
  if (*(unsigned char *)(a1 + 288)) {
    uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  *(unsigned char *)(*(void *)(a2 + 8) + 20) = 15;
  return result;
}

uint64_t gpulDeleteKernelTexture(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = (_OWORD *)(a1 + 24);
  uint64_t v4 = a1 + 64;
  unsigned int v5 = (uint64_t *)(a1 + 80);
  do
  {
    uint64_t result = *v5;
    if (*v5)
    {
      if (result == *(void *)v3)
      {
        *uint64_t v3 = 0u;
        v3[1] = 0u;
      }
      gpusWaitResource();
      uint64_t result = IOAccelResourceRelease();
      uint64_t *v5 = 0;
      v5[4] = 0;
      v5[8] = 0;
      *(_DWORD *)(v4 + v2) = 0;
    }
    v2 += 4;
    ++v5;
  }
  while (v2 != 16);
  if (*(void *)v3)
  {
    gpusWaitResource();
    uint64_t result = IOAccelResourceRelease();
    *uint64_t v3 = 0u;
    v3[1] = 0u;
  }
  *(_DWORD *)(a1 + 216) = -1;
  return result;
}

uint64_t gldDestroyTexture(void *a1, void *a2)
{
  return 0;
}

uint64_t gldUnbindTexture(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if ((**(_WORD **)a2 & 0xF) == 7 && (uint64_t v4 = **(void **)(a2 + 8)) != 0 && (v5 = *(void *)(v4 + 16)) != 0) {
    int v6 = (uint64_t *)(v5 + 16);
  }
  else {
    int v6 = (uint64_t *)(a2 + 40);
  }
  uint64_t v7 = *v6;
  if (*v6)
  {
    for (uint64_t i = 0; i != 32; ++i)
    {
      uint64_t v9 = v3 + 8 * i;
      if (*(void *)(v9 + 200) == a2)
      {
        uint64_t result = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 + 8) + 376))(v3, 0, i, 143);
        *(void *)(v9 + 200) = 0;
        *(_DWORD *)(v3 + 4 * i + 848) = 0;
      }
    }
    if (*(_DWORD *)(v7 + 24) != 1)
    {
      BOOL v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 + 8) + 472);
      return v10(v3, 2);
    }
  }
  return result;
}

BOOL gldIsTextureResident(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24) != 0;
}

uint64_t gpumGetTextureLevelInfo(void *a1, unsigned __int16 **a2, uint64_t a3, uint64_t a4, int a5, _DWORD *a6, void (*a7)(uint64_t, unsigned __int16 **, uint64_t, uint64_t, unint64_t *))
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v23 = 0;
  if ((a2[1][10] & 2) != 0)
  {
    uint64_t v14 = a1[2];
    if (!*(unsigned char *)(v14 + 288)
      || (pthread_mutex_lock((pthread_mutex_t *)(v14 + 48)), uint64_t v14 = a1[2], (a2[1][10] & 2) != 0))
    {
      (*(void (**)(uint64_t, unsigned __int16 **))(a1[1] + 304))(v14, a2);
      *((unsigned char *)a2[1] + 20) &= ~2u;
      uint64_t v14 = a1[2];
    }
    if (*(unsigned char *)(v14 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 48));
    }
  }
  unint64_t v22 = ((unint64_t)**a2 >> 8) & 1;
  a7(a1[2], a2, a3, a4, &v22);
  if ((**a2 & 0x100) == 0) {
    goto LABEL_20;
  }
  uint64_t v15 = 0;
  unint64_t v16 = v22;
  do
  {
    uint64_t v17 = *(void *)(a1[5] + v15);
    if (v17)
    {
      memset(v21, 0, sizeof(v21));
      uint64_t v18 = a1[2];
      if ((*(unsigned char *)(*(void *)(v17 + 8) + 20) & 2) != 0)
      {
        if (!*(unsigned char *)(v18 + 288)
          || (pthread_mutex_lock((pthread_mutex_t *)(v18 + 48)),
              uint64_t v18 = a1[2],
              (*(unsigned char *)(*(void *)(v17 + 8) + 20) & 2) != 0))
        {
          (*(void (**)(uint64_t, uint64_t))(a1[1] + 304))(v18, v17);
          *(unsigned char *)(*(void *)(v17 + 8) + 20) &= ~2u;
          uint64_t v18 = a1[2];
        }
        if (*(unsigned char *)(v18 + 288))
        {
          pthread_mutex_unlock((pthread_mutex_t *)(v18 + 48));
          uint64_t v18 = a1[2];
        }
      }
      *(void *)&v21[0] = 1;
      a7(v18, (unsigned __int16 **)v17, a3, a4, (unint64_t *)v21);
      v16 += *(void *)&v21[0];
    }
    v15 += 8;
  }
  while (v15 != 256);
  if (v16 > a1[11])
  {
    int v19 = 0;
    uint64_t result = 10016;
  }
  else
  {
LABEL_20:
    uint64_t result = 10010;
    if (a5 > 34889)
    {
      if (a5 > 36010)
      {
        if (a5 == 36011 || a5 == 37126)
        {
          uint64_t result = 0;
          int v19 = WORD2(v25);
        }
        else
        {
          if (a5 != 37127) {
            return result;
          }
          uint64_t result = 0;
          int v19 = BYTE6(v25);
        }
      }
      else
      {
        switch(a5)
        {
          case 34890:
            uint64_t result = 0;
            int v19 = HIWORD(v24);
            break;
          case 35057:
            uint64_t result = 0;
            int v19 = (unsigned __int16)v25;
            break;
          case 35903:
            uint64_t result = 0;
            int v19 = WORD1(v25);
            break;
          default:
            return result;
        }
      }
    }
    else
    {
      switch(a5)
      {
        case 32860:
          uint64_t result = 0;
          int v19 = WORD1(v23);
          break;
        case 32861:
          uint64_t result = 0;
          int v19 = WORD2(v23);
          break;
        case 32862:
          uint64_t result = 0;
          int v19 = HIWORD(v23);
          break;
        case 32863:
          uint64_t result = 0;
          int v19 = (unsigned __int16)v24;
          break;
        case 32864:
          uint64_t result = 0;
          int v19 = WORD1(v24);
          break;
        case 32865:
          uint64_t result = 0;
          int v19 = WORD2(v24);
          break;
        default:
          if (a5 != 4099) {
            return result;
          }
          uint64_t result = 0;
          int v19 = (unsigned __int16)v23;
          break;
      }
    }
  }
  *a6 = v19;
  return result;
}

uint64_t gpumRestoreTextureData(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, void *, uint64_t, uint64_t))
{
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  }
  uint64_t v12 = a2[4];
  uint64_t v11 = a2[5];
  if ((*(_DWORD *)(v12 + 260) | 0x80) != 0xC0)
  {
    uint64_t v13 = (unsigned __int16 *)(v11 + 2 * (int)a3);
    int v14 = v13[6];
    int v15 = *v13;
    if ((v14 & ~v15 & (1 << a4)) != 0) {
      *(_WORD *)(v11 + 2 * (int)a3) = v14 & (1 << a4) | v15;
    }
    IOAccelResourceFinishEvent();
    goto LABEL_9;
  }
  if (((1 << a4) & *(unsigned __int16 *)(v11 + 2 * (int)a3 + 12) & ~*(unsigned __int16 *)(v11 + 2 * (int)a3)) != 0)
  {
    IOAccelResourcePageoff();
LABEL_9:
    int v16 = *(_DWORD *)(v12 + 260);
    goto LABEL_10;
  }
  IOAccelResourceFinishEvent();
  int v16 = *(_DWORD *)(v12 + 260);
  if (v16 == 192)
  {
    if ((*(unsigned char *)(a1 + 296) & 0x80) != 0)
    {
      uint64_t v19 = *a2 + 480 * (int)a3 + 32 * (int)a4;
      int v20 = gpusRowBytes(*(unsigned __int16 *)(v19 + 280), *(unsigned __int16 *)(v19 + 282), *(unsigned __int16 *)(v19 + 276));
      gpusFlushMemoryForIn(*(void **)(v19 + 288), *(unsigned __int16 *)(v19 + 278) * (uint64_t)v20 * *(unsigned __int16 *)(v19 + 272));
    }
    goto LABEL_9;
  }
LABEL_10:
  if ((v16 | 0x40) == 0x40) {
    uint64_t v17 = a6(a1, a2, a3, a4);
  }
  else {
    uint64_t v17 = 0;
  }
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return v17;
}

uint64_t gpumReadTextureData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  }
  uint64_t v16 = a9(a1, a2, a3, a4, a5, a6, a7);
  if (*(unsigned char *)(a1 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  }
  return v16;
}

uint64_t gpusLoadCurrentTextures(uint64_t result, unsigned __int16 a2, uint64_t a3)
{
  unsigned int v3 = a2;
  *(_DWORD *)(result + 140) &= ~a2;
  uint64_t v4 = *(void *)(result + 24);
  if (!*(unsigned char *)(v4 + 12724)) {
    return result;
  }
  uint64_t v5 = a3;
  uint64_t v6 = result;
  unint64_t v7 = 0;
  uint64_t v36 = *(void *)(result + 16);
  unsigned int v34 = a2;
  do
  {
    if (!v3) {
      goto LABEL_55;
    }
    do
    {
      unsigned int v8 = __clz(__rbit32(v3));
      int v9 = 1 << v8;
      uint64_t v10 = v8 + 16 * v7;
      uint64_t v11 = *(void *)(v5 + 8 * v7) >> (4 * v8);
      unsigned int v12 = v11 & 0xF;
      if (v12 > 0xA)
      {
        if (!*(void *)(v6 + 8 * v10 + 200))
        {
          uint64_t v13 = 0;
          goto LABEL_51;
        }
        uint64_t v13 = 0;
        *(_DWORD *)(v6 + 4 * v10 + 848) = 0;
        goto LABEL_22;
      }
      uint64_t v13 = *(void *)(*(void *)(v6 + 40) + 8 * v10);
      if (v13)
      {
        int v14 = *(uint64_t **)(v13 + 8);
        int v15 = *((unsigned __int8 *)v14 + 20);
        uint64_t v16 = (_DWORD *)(v6 + 4 * v10 + 848);
        int v17 = *v16;
        if (*v16 == *(_DWORD *)(v13 + 56)) {
          unsigned __int8 v18 = *((unsigned char *)v14 + 20);
        }
        else {
          unsigned __int8 v18 = -113;
        }
        if (v12 != 7)
        {
          int v20 = *(_WORD **)v13;
          if (((unsigned __int16)v9 & *(_WORD *)(*(void *)(v6 + 24) + 2 * v7 + 12720)) == 0 || *((unsigned char *)v20 + 2))
          {
            int v21 = (unsigned __int16)v20[2];
            BOOL v23 = v21 == 6402 || v21 == 34041;
            uint64_t result = v36;
            uint64_t v24 = v36 + 88 * v23 + 8 * (v11 & 0xF);
            uint64_t v26 = *(void *)(v24 + 112);
            uint64_t v25 = (uint64_t *)(v24 + 112);
            uint64_t v13 = v26;
            if (!v26)
            {
              uint64_t result = gpusCreateZeroTexture(v36, v23, v12);
              uint64_t v16 = (_DWORD *)(v6 + 4 * v10 + 848);
              uint64_t v13 = result;
              *uint64_t v25 = result;
              int v17 = *v16;
            }
            int v15 = *(unsigned __int8 *)(*(void *)(v13 + 8) + 20);
            if (v17 == *(_DWORD *)(v13 + 56)) {
              unsigned __int8 v18 = *(unsigned char *)(*(void *)(v13 + 8) + 20);
            }
            else {
              unsigned __int8 v18 = -113;
            }
          }
          if (!v15)
          {
            uint64_t v5 = a3;
LABEL_47:
            _DWORD *v16 = *(_DWORD *)(v13 + 56);
            if ((**(_WORD **)v13 & 0x800) != 0) {
              uint64_t result = IOSurfaceBindAccel();
            }
LABEL_49:
            if (!v18) {
              goto LABEL_51;
            }
            goto LABEL_50;
          }
          int v27 = v16;
          int v28 = *(_DWORD *)(v36 + 316) + 1;
          *(_DWORD *)(v36 + 316) = v28;
          *(_DWORD *)(v13 + 56) = v28;
          uint64_t result = (*(uint64_t (**)(void))(*(void *)(v6 + 8) + 296))();
          if (result)
          {
            uint64_t v16 = v27;
            uint64_t v5 = a3;
LABEL_45:
            uint64_t v33 = *(void *)(v13 + 8);
            *(void *)(v33 + 13) = 0;
            *(void *)(v33 + 8) = 0;
            goto LABEL_47;
          }
          uint64_t v5 = a3;
          goto LABEL_16;
        }
        if ((v15 & 8) == 0)
        {
          if (!*((unsigned char *)v14 + 20))
          {
            uint64_t v5 = a3;
            goto LABEL_47;
          }
          goto LABEL_44;
        }
        uint64_t v29 = *v14;
        if (*v14)
        {
          int v30 = **(_DWORD **)(v29 + 8);
          if (!(_BYTE)v30) {
            goto LABEL_44;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(v6 + 8) + 320))(v36, v29, v30);
          if (result)
          {
            **(_DWORD **)(v29 + 8) = 0;
            uint64_t v16 = (_DWORD *)(v6 + 4 * v10 + 848);
LABEL_44:
            int v31 = *(_DWORD *)(v36 + 316) + 1;
            *(_DWORD *)(v36 + 316) = v31;
            *(_DWORD *)(v13 + 56) = v31;
            int v32 = v16;
            uint64_t result = (*(uint64_t (**)(void))(*(void *)(v6 + 8) + 296))();
            uint64_t v16 = v32;
            uint64_t v5 = a3;
            if (result) {
              goto LABEL_45;
            }
            goto LABEL_16;
          }
        }
        uint64_t v5 = a3;
      }
      else
      {
        unsigned __int8 v18 = 0;
      }
LABEL_16:
      uint64_t v13 = 0;
      if (v12 == 7 && *(_DWORD *)(v6 + 84) != 0) {
        goto LABEL_49;
      }
      *(_DWORD *)(v6 + 140) |= 1 << v10;
      *(_DWORD *)(v6 + 4 * v10 + 848) = 0;
      if (!*(void *)(v6 + 8 * v10 + 200)) {
        goto LABEL_51;
      }
LABEL_22:
      unsigned __int8 v18 = -113;
LABEL_50:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v6 + 8) + 376))(v6, v13, v10, v18);
LABEL_51:
      *(void *)(v6 + 8 * v10 + 200) = v13;
      v3 ^= v9;
    }
    while (v3);
    uint64_t v4 = *(void *)(v6 + 24);
    unsigned int v3 = v34;
LABEL_55:
    ++v7;
  }
  while (v7 < *(unsigned __int8 *)(v4 + 12724));
  return result;
}

uint64_t gpusCreateZeroTexture(uint64_t a1, int a2, int a3)
{
  if (a3 == 10)
  {
    unsigned int v11 = 15;
    int v7 = 1;
    unsigned int v9 = 6;
    char v8 = 2;
    BOOL v10 = 1;
  }
  else
  {
    if (a3) {
      int v6 = 1;
    }
    else {
      int v6 = 6;
    }
    if (a3 == 2) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
    char v8 = 0;
    unsigned int v9 = 1;
    BOOL v10 = a3 != 2;
    if (a3 == 2) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = 15;
    }
  }
  uint64_t v12 = 32 * v7 * v11 + 264;
  uint64_t v13 = (char *)malloc_type_zone_calloc(*(malloc_zone_t **)(*(void *)a1 + 232), 1uLL, v12 + 4 * v9 + 24, 0xD68DC258uLL);
  if (!v13) {
    abort();
  }
  uint64_t v14 = (uint64_t)v13;
  uint64_t v15 = 0;
  uint64_t v16 = (uint64_t)&v13[v12];
  uint64_t v17 = (uint64_t)&v13[v12 + 24];
  do
  {
    *(_DWORD *)(v17 + v15) = -16777216;
    v15 += 4;
  }
  while (4 * v9 != v15);
  *(_WORD *)uint64_t v13 = a3 & 0xF | 0x1000;
  *((_WORD *)v13 + 3) = 1028;
  *((_DWORD *)v13 + 2) = 1065353216;
  if (a2) {
    __int16 v18 = 6402;
  }
  else {
    __int16 v18 = 6408;
  }
  *((_WORD *)v13 + 2) = v18;
  v13[24] = v13[24] & 0xE7 | 8;
  *((_DWORD *)v13 + 38) = 687941889;
  *((_WORD *)v13 + 78) = 10497;
  *((_OWORD *)v13 + 10) = xmmword_22B318CF0;
  *((void *)v13 + 18) = 0x20326002600;
  *(void *)(v13 + 116) = 0x3E800000000;
  *((_DWORD *)v13 + 31) = 0;
  v13[130] &= 0xFAu;
  *((_DWORD *)v13 + 28) = 420054461;
  *((_DWORD *)v13 + 33) = 0;
  __int16 v19 = *((_WORD *)v13 + 64) & 0xF000;
  *((void *)v13 + 17) = 0;
  *((_WORD *)v13 + 64) = v19 | 0x688;
  switch(a3)
  {
    case 1:
      __int16 v20 = *((_WORD *)v13 + 107);
      char v21 = 20;
      goto LABEL_27;
    case 2:
    case 8:
      __int16 v20 = *((_WORD *)v13 + 107);
      char v21 = 5;
      goto LABEL_27;
    case 4:
      __int16 v22 = *((_WORD *)v13 + 107) & 0xC0FF;
      break;
    case 5:
    case 10:
      __int16 v20 = *((_WORD *)v13 + 107);
      char v21 = 36;
      goto LABEL_27;
    case 6:
      __int16 v22 = *((_WORD *)v13 + 107) & 0xC0FF | 0x2000;
      break;
    case 7:
      __int16 v22 = *((_WORD *)v13 + 107) & 0xC0FF | 0x100;
      break;
    case 9:
      __int16 v20 = *((_WORD *)v13 + 107);
      char v21 = 37;
LABEL_27:
      __int16 v22 = v20 & 0xC0FF | ((v21 & 0x3F) << 8);
      break;
    default:
      __int16 v22 = *((_WORD *)v13 + 107) & 0xC0FF | 0x400;
      break;
  }
  uint64_t v23 = 0;
  v13[211] = v7;
  v13[213] = v11;
  *((_DWORD *)v13 + 50) = -2090368799;
  *((_WORD *)v13 + 98) = 1;
  *((_WORD *)v13 + 99) = v9;
  *((_WORD *)v13 + 107) = v22 & 0xBF00 | 0x4000;
  *((_DWORD *)v13 + 48) = 98392;
  *((_WORD *)v13 + 102) = 0;
  if (v11 <= 2) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = v11;
  }
  v13[206] = v8;
  *(_DWORD *)(v13 + 207) = 0x10000;
  *(unsigned char *)(v16 + 20) = -113;
  uint64_t v25 = v13 + 314;
  uint64_t v26 = v24 - 1;
  *(void *)(v16 + 8) = -1;
  *(_DWORD *)(v16 + 16) = -1;
  do
  {
    uint64_t v27 = v14 + 480 * v23;
    *(_DWORD *)(v27 + 268) = 65537;
    *(_WORD *)(v27 + 272) = v9;
    *(void *)(v27 + 288) = v17;
    *(void *)(v27 + 276) = 0x836780E100010001;
    *(unsigned char *)(v27 + 275) = 48;
    uint64_t v28 = v14 + 2 * v23;
    *(_WORD *)(v28 + 216) |= 1u;
    *(_WORD *)(v28 + 228) |= 1u;
    if (v10)
    {
      uint64_t v29 = v26;
      int v30 = v25;
      do
      {
        *(_DWORD *)(v30 - 2) = 335616264;
        v30 += 32;
        --v29;
      }
      while (v29);
    }
    ++v23;
    v25 += 480;
  }
  while (v23 != v7);
  uint64_t v32 = 0;
  gldCreateTexture(a1, &v32, v14, v16);
  uint64_t result = v32;
  *(void *)(v32 + 16) = v14;
  return result;
}

uint64_t gldModifyTexSubImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17 = *(void *)(a2 + 8);
  int v18 = *(unsigned __int8 *)(v17 + 20);
  if (*(unsigned char *)(v17 + 20) || a13 && **(unsigned char **)(a13 + 8))
  {
    if (((unsigned __int16)(*(_WORD *)(*(void *)a2 + 2 * (int)a3 + 228) & *(_WORD *)(v17 + 2 * (int)a3 + 8)) >> a4))
    {
      if (!*(unsigned char *)(v17 + 20)) {
        goto LABEL_23;
      }
      return 0;
    }
    uint64_t v19 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v19 + 288))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v19 + 48));
      int v18 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 20);
    }
    if (v18)
    {
      uint64_t v21 = *(void *)(a1 + 8);
      uint64_t v20 = *(void *)(a1 + 16);
      int v22 = *(_DWORD *)(v20 + 316) + 1;
      *(_DWORD *)(v20 + 316) = v22;
      *(_DWORD *)(a2 + 56) = v22;
      if (!(*(unsigned int (**)(void))(v21 + 296))()) {
        goto LABEL_19;
      }
      uint64_t v23 = *(void *)(a2 + 8);
      *(void *)(v23 + 13) = 0;
      *(void *)(v23 + 8) = 0;
    }
    if (a13 && **(unsigned char **)(a13 + 8))
    {
      if ((*(unsigned int (**)(void, uint64_t))(*(void *)(a1 + 8) + 320))(*(void *)(a1 + 16), a13))
      {
        int v18 = 0;
        **(_DWORD **)(a13 + 8) = 0;
      }
      else
      {
        int v18 = 1;
      }
    }
    else
    {
      int v18 = 0;
    }
LABEL_19:
    uint64_t v24 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v24 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v24 + 48));
    }
    if (!v18) {
      goto LABEL_23;
    }
    return 0;
  }
LABEL_23:
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 392);
  return v26(a1, a2, a3, a4);
}

uint64_t gldCopyTexSubImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(*(void *)(a2 + 8) + 20)) {
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v10 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v10 + 48));
    uint64_t v11 = *(void *)(a1 + 16);
    int v12 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 20);
    int v13 = *(_DWORD *)(v11 + 316) + 1;
    *(_DWORD *)(v11 + 316) = v13;
    *(_DWORD *)(a2 + 56) = v13;
    if (!v12) {
      goto LABEL_8;
    }
  }
  else
  {
    int v14 = *(_DWORD *)(v10 + 316) + 1;
    *(_DWORD *)(v10 + 316) = v14;
    *(_DWORD *)(a2 + 56) = v14;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 8) + 296))())
  {
    uint64_t v15 = *(void *)(a2 + 8);
    *(void *)(v15 + 13) = 0;
    *(void *)(v15 + 8) = 0;
LABEL_8:
    int v16 = 1;
    goto LABEL_10;
  }
  int v16 = 0;
LABEL_10:
  uint64_t v17 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v17 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(v17 + 48));
  }
  if (!v16) {
    return 0;
  }
LABEL_13:
  int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 400);
  return v18(a1, a2, a3, a4, a5);
}

uint64_t gldCopyTextureData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = *(void *)(a2 + 8);
  int v17 = *(unsigned __int8 *)(v16 + 20);
  int v18 = *(unsigned __int8 *)(*(void *)(a5 + 8) + 20);
  if (!*(unsigned char *)(v16 + 20)) {
    goto LABEL_10;
  }
  uint64_t v19 = *(void *)(a1 + 16);
  if (!*(unsigned char *)(v19 + 288))
  {
    int v22 = *(_DWORD *)(v19 + 316) + 1;
    *(_DWORD *)(v19 + 316) = v22;
    *(_DWORD *)(a2 + 56) = v22;
LABEL_6:
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 8) + 296))())
    {
      int v17 = 0;
      uint64_t v23 = *(void *)(a2 + 8);
      *(void *)(v23 + 13) = 0;
      *(void *)(v23 + 8) = 0;
    }
    goto LABEL_8;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v19 + 48));
  uint64_t v20 = *(void *)(a1 + 16);
  int v17 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 20);
  int v21 = *(_DWORD *)(v20 + 316) + 1;
  *(_DWORD *)(v20 + 316) = v21;
  *(_DWORD *)(a2 + 56) = v21;
  if (v17) {
    goto LABEL_6;
  }
LABEL_8:
  uint64_t v24 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v24 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(v24 + 48));
  }
LABEL_10:
  if (v18)
  {
    uint64_t v25 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v25 + 288))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v25 + 48));
      uint64_t v25 = *(void *)(a1 + 16);
    }
    int v26 = *(_DWORD *)(v25 + 316) + 1;
    *(_DWORD *)(v25 + 316) = v26;
    *(_DWORD *)(a5 + 56) = v26;
    uint64_t v27 = *(void *)(a5 + 8);
    int v18 = *(unsigned __int8 *)(v27 + 20);
    if (*(unsigned char *)(v27 + 20) && (*(unsigned int (**)(void))(*(void *)(a1 + 8) + 296))())
    {
      int v18 = 0;
      uint64_t v28 = *(void *)(a5 + 8);
      *(void *)(v28 + 13) = 0;
      *(void *)(v28 + 8) = 0;
    }
    uint64_t v29 = *(void *)(a1 + 16);
    if (*(unsigned char *)(v29 + 288)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v29 + 48));
    }
  }
  if (v18 | v17) {
    return 0;
  }
  int v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 408);
  return v31(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t gldGenerateTexMipmaps(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(unsigned char *)(*(void *)(a2 + 8) + 20)) {
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v8 + 288))
  {
    pthread_mutex_lock((pthread_mutex_t *)(v8 + 48));
    uint64_t v9 = *(void *)(a1 + 16);
    int v10 = *(unsigned __int8 *)(*(void *)(a2 + 8) + 20);
    int v11 = *(_DWORD *)(v9 + 316) + 1;
    *(_DWORD *)(v9 + 316) = v11;
    *(_DWORD *)(a2 + 56) = v11;
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    int v12 = *(_DWORD *)(v8 + 316) + 1;
    *(_DWORD *)(v8 + 316) = v12;
    *(_DWORD *)(a2 + 56) = v12;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 8) + 296))())
  {
    uint64_t v13 = *(void *)(a2 + 8);
    *(void *)(v13 + 13) = 0;
    *(void *)(v13 + 8) = 0;
LABEL_8:
    int v14 = 1;
    goto LABEL_10;
  }
  int v14 = 0;
LABEL_10:
  uint64_t v15 = *(void *)(a1 + 16);
  if (*(unsigned char *)(v15 + 288)) {
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 48));
  }
  if (!v14) {
    return 0;
  }
LABEL_13:
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 424);
  return v16(a1, a2, a3, a4);
}

uint64_t gpusGetKernelTexture(uint64_t a1, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, unsigned int a7, unsigned int a8, uint64_t a9, unsigned int a10, int a11, int a12, uint64_t a13)
{
  uint64_t v15 = a9;
  uint64_t v16 = a2[3];
  uint64_t v17 = *a2;
  char v18 = *(unsigned char *)(*a2 + 208);
  int v19 = (*(unsigned __int16 *)(*a2 + 198) >> v18) | (*(unsigned __int16 *)(*a2 + 198) >> v18 == 0);
  if (v18) {
    int v20 = (*(unsigned __int16 *)(*a2 + 194) >> v18) | (*(unsigned __int16 *)(*a2 + 194) >> v18 == 0);
  }
  else {
    LOWORD(v20) = *(_WORD *)(*a2 + 194);
  }
  if (*(unsigned char *)(*a2 + 208)) {
    __int16 v21 = (*(unsigned __int16 *)(*a2 + 196) >> v18) | (*(unsigned __int16 *)(*a2 + 196) >> v18 == 0);
  }
  else {
    __int16 v21 = *(_WORD *)(*a2 + 196);
  }
  if (!*(unsigned char *)(*a2 + 208)) {
    LOWORD(v19) = *(_WORD *)(*a2 + 198);
  }
  *(_OWORD *)(a2 + 3) = 0u;
  *(_OWORD *)(a2 + 5) = 0u;
  if (!a6 && v16)
  {
    unsigned int v32 = a8;
    char v22 = a4;
    unsigned int v23 = a7;
    uint64_t v24 = a5;
    __int16 v31 = v20;
    __int16 v30 = v19;
    IOAccelResourceRelease();
    LOWORD(v19) = v30;
    LOWORD(v20) = v31;
    uint64_t v15 = a9;
    a5 = v24;
    a7 = v23;
    a4 = v22;
    a8 = v32;
  }
  if (a6 || !v15)
  {
    if (a6 && v15)
    {
      int v25 = 192;
    }
    else
    {
      if (v15) {
        BOOL v26 = 1;
      }
      else {
        BOOL v26 = a6 == 0;
      }
      if (v26) {
        int v25 = 0;
      }
      else {
        int v25 = 128;
      }
    }
  }
  else
  {
    int v25 = 64;
  }
  *(void *)(a13 + 64) = a5;
  *(void *)(a13 + 72) = a6;
  *(void *)(a13 + 80) = v15;
  *(void *)(a13 + 88) = a7;
  *(unsigned char *)(a13 + 32) = *(unsigned char *)(v17 + 211);
  *(unsigned char *)(a13 + 33) = *(unsigned char *)(v17 + 209);
  *(unsigned char *)(a13 + 34) = v18;
  *(_WORD *)(a13 + 8) = v20;
  *(_WORD *)(a13 + 10) = v21;
  *(_WORD *)(a13 + 12) = v19;
  *(_DWORD *)a13 = v25;
  *(_DWORD *)(a13 + 4) = a12;
  *(unsigned char *)(a13 + 35) = a4;
  *(void *)(a13 + 16) = a10;
  *(void *)(a13 + 24) = a8;
  uint64_t v27 = IOAccelResourceCreate();
  if (!v27) {
    return 0;
  }
  a2[3] = v27;
  a2[4] = IOAccelResourceGetClientShared();
  uint64_t v28 = 1;
  *(unsigned char *)(a2[5] + 28) = 1;
  a2[6] = IOAccelResourceGetDataBytes();
  IOAccelResourceRelease();
  return v28;
}

uint64_t gldGetTextureAllocationIdentifiers(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unsigned int v5 = *a2;
  *a2 = 0;
  if ((**(_WORD **)a1 & 0x800) != 0)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a1 + 80;
    do
    {
      uint64_t result = *(void *)(v10 + v9);
      if (result)
      {
        uint64_t result = IOAccelResourceCreateAllocationIdentifierSet();
        uint64_t v11 = *a2;
        if (v11 < v5)
        {
          *(void *)(a3 + 8 * v11) = 0xDEADBEEFDEADBEEFLL;
          *a2 = v11 + 1;
        }
        uint64_t v12 = *a2;
        if (v12 < v5)
        {
          *(void *)(a3 + 8 * v12) = 0xDEADBEEFDEADBEEFLL;
          *a2 = v12 + 1;
        }
      }
      v9 += 8;
    }
    while (v9 != 32);
  }
  else
  {
    uint64_t result = *(void *)(a1 + 24);
    if (result)
    {
      uint64_t result = IOAccelResourceCreateAllocationIdentifierSet();
      uint64_t v7 = *a2;
      if (v7 < v5)
      {
        *(void *)(a3 + 8 * v7) = 0xDEADBEEFDEADBEEFLL;
        *a2 = v7 + 1;
      }
      uint64_t v8 = *a2;
      if (v8 < v5)
      {
        *(void *)(a3 + 8 * v8) = 0xDEADBEEFDEADBEEFLL;
        *a2 = v8 + 1;
      }
    }
  }
  return result;
}

uint64_t gpusGetKernelTextureSurface()
{
  return 0;
}

uint64_t gpusReleaseAccumIOSurface(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 204))
  {
    uint64_t result = IOAccelResourceRelease();
    *(void *)(a2 + 176) = 0;
  }
  *(_DWORD *)(a2 + 204) = 0;
  *(void *)(a2 + 184) = 0;
  *(void *)(a2 + 192) = 0;
  return result;
}

uint64_t gpusGetKernelTextureIOSurface(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  uint64_t v5 = *(void *)a2;
  unsigned int v6 = *(unsigned __int16 *)(*(void *)a2 + 196);
  unsigned int v7 = *(unsigned __int16 *)(*(void *)a2 + 198);
  char v8 = *(unsigned char *)(*(void *)a2 + 208);
  if (v8) {
    int v9 = (*(unsigned __int16 *)(*(void *)a2 + 194) >> v8) | (*(unsigned __int16 *)(*(void *)a2 + 194) >> v8 == 0);
  }
  else {
    int v9 = *(unsigned __int16 *)(*(void *)a2 + 194);
  }
  if (*(unsigned char *)(*(void *)a2 + 208))
  {
    unsigned int v6 = (v6 >> v8) | (v6 >> v8 == 0);
    unsigned int v7 = (v7 >> v8) | (v7 >> v8 == 0);
  }
  uint64_t v10 = *(void *)(v5 + 256);
  if (!v10) {
    return 0;
  }
  char v12 = a4;
  int v13 = a3;
  unsigned int v32 = v7;
  unsigned int v33 = v6;
  uint64_t v15 = 0;
  unsigned int v16 = -1;
  do
  {
    if (v10 == *(void *)(v5 + 48 + 8 * v15)) {
      unsigned int v16 = v15;
    }
    ++v15;
  }
  while (v15 != 4);
  uint64_t v17 = *(void *)(a2 + 24);
  if (v17)
  {
    int v29 = v9;
    uint64_t v18 = 0;
    uint64_t v19 = a2 + 64;
    int v20 = (uint64_t *)(a2 + 80);
    while (1)
    {
      uint64_t v21 = *v20;
      if (*v20)
      {
        if (!*(void *)(v5 + 48 + 8 * v18)) {
          goto LABEL_17;
        }
        if (IOSurfaceGetID(*(IOSurfaceRef *)(v5 + 48 + 8 * v18)) != *(_DWORD *)(v19 + 4 * v18)) {
          break;
        }
      }
LABEL_23:
      ++v18;
      ++v20;
      if (v18 == 4)
      {
        int v13 = a3;
        char v12 = a4;
        LOWORD(v9) = v29;
        if (*(_DWORD *)a5 != 130
          || *(_DWORD *)(a5 + 68) != *(unsigned __int16 *)(v5 + 248)
          || *(_DWORD *)(a5 + 72) != *(unsigned __int16 *)(v5 + 250)
          || *(_DWORD *)(a5 + 76) != a3
          || *(unsigned __int8 *)(a5 + 32) != *(unsigned __int8 *)(v5 + 211)
          || *(unsigned __int8 *)(a5 + 33) != *(unsigned __int8 *)(v5 + 209)
          || *(unsigned __int8 *)(a5 + 34) != *(unsigned __int8 *)(v5 + 208)
          || *(unsigned __int8 *)(a5 + 35) != a4
          || v29 != *(unsigned __int16 *)(a5 + 8)
          || v33 != *(unsigned __int16 *)(a5 + 10)
          || v32 != *(unsigned __int16 *)(a5 + 12))
        {
          if (*(_DWORD *)(a2 + 204))
          {
            IOAccelResourceRelease();
            *(void *)(a2 + 176) = 0;
          }
          *(_DWORD *)(a2 + 204) = 0;
          *(void *)(a2 + 184) = 0;
          *(void *)(a2 + 192) = 0;
        }
        goto LABEL_38;
      }
    }
    uint64_t v21 = *v20;
LABEL_17:
    if (v21 == *(void *)(a2 + 176))
    {
      *(_DWORD *)(a2 + 204) = 1;
    }
    else
    {
      gpusWaitResource();
      IOAccelResourceRelease();
      uint64_t v21 = *v20;
    }
    if (v21 == v17)
    {
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
    }
    *int v20 = 0;
    v20[4] = 0;
    v20[8] = 0;
    *(_DWORD *)(v19 + 4 * v18) = 0;
    goto LABEL_23;
  }
LABEL_38:
  uint64_t v22 = 0;
  *(_DWORD *)(a5 + 68) = *(unsigned __int16 *)(v5 + 248);
  *(_DWORD *)(a5 + 72) = *(unsigned __int16 *)(v5 + 250);
  *(_DWORD *)(a5 + 76) = v13;
  *(unsigned char *)(a5 + 32) = *(unsigned char *)(v5 + 211);
  *(unsigned char *)(a5 + 33) = *(unsigned char *)(v5 + 209);
  *(unsigned char *)(a5 + 34) = *(unsigned char *)(v5 + 208);
  *(_WORD *)(a5 + 8) = v9;
  *(_WORD *)(a5 + 10) = v33;
  *(_WORD *)(a5 + 12) = v32;
  *(unsigned char *)(a5 + 35) = v12;
  *(void *)a5 = 130;
  for (uint64_t i = a2 + 144; ; i += 8)
  {
    uint64_t v24 = *(__IOSurface **)(v5 + 48 + 8 * v22);
    if (!v24 || *(void *)(i - 64)) {
      goto LABEL_43;
    }
    *(_DWORD *)(a5 + 64) = IOSurfaceGetID(v24);
    uint64_t v25 = IOAccelResourceCreate();
    if (!v25) {
      break;
    }
    *(void *)(i - 64) = v25;
    *(void *)(i - 32) = IOAccelResourceGetClientShared();
    *(_DWORD *)(a2 + 4 * v22 + 64) = *(_DWORD *)(a5 + 64);
LABEL_43:
    if (++v22 == 4)
    {
      BOOL v26 = (void *)(a2 + 8 * v16);
      uint64_t v27 = v26[14];
      *(void *)(a2 + 24) = v26[10];
      *(void *)(a2 + 32) = v27;
      *(void *)(a2 + 40) = v26[18];
      *(void *)(a2 + 48) = 0;
      *(_DWORD *)(a2 + 216) = v16;
      return 1;
    }
  }
  gpulDeleteKernelTexture(a2);
  return 0;
}

void gpusDestroyZeroTexture(void *a1, void *a2)
{
  unsigned int v3 = (void *)a2[2];
  a2[2] = 0;
  gldDestroyTexture(a1, a2);
  uint64_t v4 = *(malloc_zone_t **)(*a1 + 232);
  malloc_zone_free(v4, v3);
}

uint64_t gldCreateVertexArray(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  char v8 = malloc_type_zone_calloc(*(malloc_zone_t **)(*a1 + 232), 1uLL, *(void *)(*a1 + 104), 0xD68DC258uLL);
  if (!v8) {
    abort();
  }
  int v9 = v8;
  void *v8 = a3;
  v8[1] = a4;
  v8[4] = 0;
  (*(void (**)(void *, void *))(a1[1] + 80))(a1, v8);
  *a2 = v9;
  return 0;
}

uint64_t gldModifyVertexArray()
{
  return 0;
}

uint64_t gldFlushVertexArray(uint64_t a1, int a2, void *start, size_t len, int a5)
{
  if (!a5) {
    return 0;
  }
  if ((*(unsigned char *)(a1 + 296) & 0x80) != 0) {
    gpusFlushMemoryForOut(start, len);
  }
  return 1;
}

uint64_t gldDestroyVertexArray(void *a1, void *a2)
{
  return 0;
}

uint64_t gldUnbindVertexArray(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 808) == a2)
  {
    uint64_t v2 = result;
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 8) + 368))();
    *(void *)(v2 + 808) = 0;
    *(_DWORD *)(v2 + 1104) = 0;
  }
  return result;
}

void *gpusLoadCurrentVertexArray(void *result)
{
  int v1 = result;
  uint64_t v2 = result[5];
  unsigned int v3 = *(uint64_t **)(v2 + 368);
  if (*(unsigned char *)(result[15] + 12))
  {
    uint64_t v4 = *(void *)(v2 + 976);
    if (v4)
    {
      if (**(_DWORD **)(v4 + 8))
      {
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)(result[2] + 8) + 320))();
        if (!result) {
          goto LABEL_17;
        }
        **(_DWORD **)(v4 + 8) = 0;
      }
    }
  }
  if (v3)
  {
    uint64_t v5 = *v3;
    uint64_t v6 = *(void *)(v3[1] + 272);
    int v7 = *((_DWORD *)v3 + 9);
    if (*((_DWORD *)v1 + 277) == v7) {
      uint64_t v8 = *(void *)(v3[1] + 272);
    }
    else {
      uint64_t v8 = -1;
    }
    if (v6)
    {
      uint64_t v10 = v1[1];
      uint64_t v9 = v1[2];
      int v11 = *(_DWORD *)(v9 + 328) + 1;
      *(_DWORD *)(v9 + 328) = v11;
      *((_DWORD *)v3 + 9) = v11;
      uint64_t result = (void *)(*(uint64_t (**)(void))(v10 + 272))();
      int v7 = *((_DWORD *)v3 + 9);
    }
    *((_DWORD *)v1 + 277) = v7;
    if (v8) {
      uint64_t result = (void *)(*(uint64_t (**)(void *, uint64_t *, uint64_t))(v1[1] + 344))(v1, v3, v8);
    }
    uint64_t v12 = *(void *)(v5 + 768);
    if ((*(char *)(v1[4] + 25) < 0 || v12) && (v12 & ~*(void *)(v5 + 776)) == 0)
    {
      int v14 = *(uint64_t (**)(void, uint64_t *, uint64_t, uint64_t))(v1[1] + 280);
      if (v14)
      {
        uint64_t v15 = v3[1];
        uint64_t v16 = *(void *)(v15 + 264);
        if (v16 != 128)
        {
          int v17 = *((_DWORD *)v3 + 8);
          if (*((_DWORD *)v1 + 276) == v17) {
            uint64_t v13 = *(void *)(v15 + 264);
          }
          else {
            uint64_t v13 = -1;
          }
          if (!v16)
          {
LABEL_45:
            *((_DWORD *)v1 + 276) = v17;
            if (!v13) {
              goto LABEL_22;
            }
            goto LABEL_21;
          }
          uint64_t v18 = v1[2];
          int v19 = *(_DWORD *)(v18 + 324) + 1;
          *(_DWORD *)(v18 + 324) = v19;
          uint64_t v20 = v3[2];
          *((_DWORD *)v3 + 8) = v19;
          uint64_t v28 = v20;
          uint64_t v27 = v3[3];
          uint64_t v29 = v27 | v6;
          uint64_t v30 = v20 | v16;
          if (((v20 | v16) & 0x10) == 0) {
            goto LABEL_43;
          }
          uint64_t v21 = *v3;
          if ((v30 & 4) == 0)
          {
LABEL_38:
            for (unint64_t i = *(void *)(v21 + 768) & v30; i; i ^= 1 << v25)
            {
              unint64_t v25 = __clz(__rbit64(i));
              uint64_t v26 = *(void *)(v3[1] + 8 * v25 - 128);
              if (**(_DWORD **)(v26 + 8))
              {
                uint64_t result = (void *)(*(uint64_t (**)(uint64_t, void, void))(*(void *)(v18 + 8) + 320))(v18, *(void *)(v3[1] + 8 * v25 - 128), **(_DWORD **)(v26 + 8));
                if (!result) {
                  goto LABEL_47;
                }
                **(_DWORD **)(v26 + 8) = 0;
              }
            }
LABEL_43:
            uint64_t result = (void *)v14(v1[2], v3, v30, v29);
            if (result)
            {
              v13 |= v28;
              v8 |= v27;
              v3[2] = 0;
              v3[3] = 0;
              *(void *)(v3[1] + 264) = 0;
              *(void *)(v3[1] + 272) = 0;
              int v17 = *((_DWORD *)v3 + 8);
              goto LABEL_45;
            }
LABEL_47:
            v3[2] = v30;
            v3[3] = v29;
            *(void *)(v3[1] + 264) = 128;
            *(void *)(v3[1] + 272) = 0;
            goto LABEL_17;
          }
          uint64_t v22 = *(void *)(v15 + 256);
          if (v22)
          {
            if (!**(_DWORD **)(v22 + 8))
            {
LABEL_35:
              char v23 = 1;
LABEL_37:
              *((unsigned char *)v3 + 40) = v23;
              goto LABEL_38;
            }
            if ((*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v18 + 8) + 320))(v18, v22, **(_DWORD **)(v22 + 8)))
            {
              **(_DWORD **)(v22 + 8) = 0;
              goto LABEL_35;
            }
          }
          char v23 = 0;
          goto LABEL_37;
        }
      }
    }
  }
LABEL_17:
  unsigned int v3 = 0;
  *((_DWORD *)v1 + 276) = 0;
  if (v1[101]) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v8 = v13;
  if (v13) {
LABEL_21:
  }
    uint64_t result = (void *)(*(uint64_t (**)(void *, uint64_t *, uint64_t, uint64_t))(v1[1] + 368))(v1, v3, v13, v8);
LABEL_22:
  v1[101] = v3;
  return result;
}

uint64_t gstctxOpState()
{
  return 0;
}

uint64_t gldAttachDrawable()
{
  return 10010;
}

void gpumInitializeIOData_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_22B30F000, &_os_log_internal, OS_LOG_TYPE_FAULT, "No devices found while initializing the GLContext", v0, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t IOAccelCLContextCreate()
{
  return MEMORY[0x270F3D1A0]();
}

uint64_t IOAccelCLContextFinishFenceEvent()
{
  return MEMORY[0x270F3D1A8]();
}

uint64_t IOAccelCLContextFinishResourceSysMem()
{
  return MEMORY[0x270F3D1B0]();
}

uint64_t IOAccelCLContextGetDataBufferClassCount()
{
  return MEMORY[0x270F3D1B8]();
}

uint64_t IOAccelCLContextGetDataBufferResource()
{
  return MEMORY[0x270F3D1C0]();
}

uint64_t IOAccelCLContextGetFenceBuffer()
{
  return MEMORY[0x270F3D1C8]();
}

uint64_t IOAccelCLContextGetSidebandBuffer()
{
  return MEMORY[0x270F3D1D0]();
}

uint64_t IOAccelCLContextRelease()
{
  return MEMORY[0x270F3D1D8]();
}

uint64_t IOAccelCLContextRequestDataBuffer()
{
  return MEMORY[0x270F3D1E0]();
}

uint64_t IOAccelCLContextSetDataBufferClassUsedBytes()
{
  return MEMORY[0x270F3D1E8]();
}

uint64_t IOAccelCLContextSubmitDataBuffers()
{
  return MEMORY[0x270F3D1F0]();
}

uint64_t IOAccelContextAddResource()
{
  return MEMORY[0x270F3D1F8]();
}

uint64_t IOAccelContextSetBackgroundRendering()
{
  return MEMORY[0x270F3D200]();
}

uint64_t IOAccelDeviceCreateWithAPIProperty()
{
  return MEMORY[0x270F3D208]();
}

uint64_t IOAccelDeviceGetConfig64()
{
  return MEMORY[0x270F3D210]();
}

uint64_t IOAccelDeviceGetConnect()
{
  return MEMORY[0x270F3D218]();
}

uint64_t IOAccelDeviceRelease()
{
  return MEMORY[0x270F3D220]();
}

uint64_t IOAccelDeviceTestEvent()
{
  return MEMORY[0x270F3D228]();
}

uint64_t IOAccelGLContextCreate()
{
  return MEMORY[0x270F3D230]();
}

uint64_t IOAccelGLContextFinish()
{
  return MEMORY[0x270F3D238]();
}

uint64_t IOAccelGLContextFinishFenceEvent()
{
  return MEMORY[0x270F3D240]();
}

uint64_t IOAccelGLContextFinishResourceSysMem()
{
  return MEMORY[0x270F3D248]();
}

uint64_t IOAccelGLContextFlushResourceSysMem()
{
  return MEMORY[0x270F3D250]();
}

uint64_t IOAccelGLContextGetDataBufferClassCount()
{
  return MEMORY[0x270F3D258]();
}

uint64_t IOAccelGLContextGetDataBufferResource()
{
  return MEMORY[0x270F3D260]();
}

uint64_t IOAccelGLContextGetFenceBuffer()
{
  return MEMORY[0x270F3D268]();
}

uint64_t IOAccelGLContextGetSidebandBuffer()
{
  return MEMORY[0x270F3D270]();
}

uint64_t IOAccelGLContextReclaimResources()
{
  return MEMORY[0x270F3D278]();
}

uint64_t IOAccelGLContextRelease()
{
  return MEMORY[0x270F3D280]();
}

uint64_t IOAccelGLContextRequestDataBuffer()
{
  return MEMORY[0x270F3D288]();
}

uint64_t IOAccelGLContextSetDataBufferClassUsedBytes()
{
  return MEMORY[0x270F3D290]();
}

uint64_t IOAccelGLContextSubmitDataBuffersExt2()
{
  return MEMORY[0x270F3D298]();
}

uint64_t IOAccelGLContextTestResourceSysMem()
{
  return MEMORY[0x270F3D2A0]();
}

uint64_t IOAccelResourceCreate()
{
  return MEMORY[0x270F3D2C0]();
}

uint64_t IOAccelResourceCreateAllocationIdentifierSet()
{
  return MEMORY[0x270F3D2C8]();
}

uint64_t IOAccelResourceFinishEvent()
{
  return MEMORY[0x270F3D2D0]();
}

uint64_t IOAccelResourceFinishSysMem()
{
  return MEMORY[0x270F3D2D8]();
}

uint64_t IOAccelResourceGetClientShared()
{
  return MEMORY[0x270F3D2E0]();
}

uint64_t IOAccelResourceGetDataBytes()
{
  return MEMORY[0x270F3D2E8]();
}

uint64_t IOAccelResourceGetDataSize()
{
  return MEMORY[0x270F3D2F0]();
}

uint64_t IOAccelResourcePageoff()
{
  return MEMORY[0x270F3D2F8]();
}

uint64_t IOAccelResourceRelease()
{
  return MEMORY[0x270F3D300]();
}

uint64_t IOAccelSharedCreate()
{
  return MEMORY[0x270F3D308]();
}

uint64_t IOAccelSharedRelease()
{
  return MEMORY[0x270F3D310]();
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

uint64_t IOSurfaceBindAccel()
{
  return MEMORY[0x270EF4C10]();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

uint64_t __CFSetLastAllocationEventName()
{
  return MEMORY[0x270EE57E8]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

uint64_t glgCreateProcessor()
{
  return MEMORY[0x270EF9DB0]();
}

uint64_t glgDestroyProcessor()
{
  return MEMORY[0x270EF9DB8]();
}

uint64_t glgSetTakeLock()
{
  return MEMORY[0x270EF9DF0]();
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3B0](zone, count, size, type_id);
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3B8](zone, size, type_id);
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3C8](zone, ptr, size, type_id);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
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

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

void sys_dcache_flush(void *start, size_t len)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}