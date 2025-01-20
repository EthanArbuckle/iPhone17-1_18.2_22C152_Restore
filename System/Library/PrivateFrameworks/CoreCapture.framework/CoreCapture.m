uint64_t CCPipe_getTypeID()
{
  uint64_t result;

  result = __kCCPipeTypeID;
  if (!__kCCPipeTypeID)
  {
    pthread_once(&__gCCPipeTypeInit, (void (*)(void))__CCPipeRegister);
    return __kCCPipeTypeID;
  }
  return result;
}

uint64_t __CCPipeRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kCCPipeTypeID = result;
  return result;
}

CFStringRef __CCPipeCopyDebugDesc(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"CCPipe@%p", a1);
}

CFStringRef __CCPipeCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"CCPipe@%p", a1);
}

BOOL __CCPipeEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

double __CCPipeRelease(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (*(unsigned char *)(a1 + 88))
  {
    *(void *)(a1 + 56) = 0;
    v3 = (const void *)(a1 + 24);
    IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 7u, 0, 0, (const void *)(a1 + 24), 8uLL, 0, 0, 0, 0);
    IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 3u, 0, 0, v3, 8uLL, 0, 0, 0, 0);
  }
  if (*(void *)v1) {
    CFRelease(*(CFTypeRef *)v1);
  }
  *(void *)(v1 + 80) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)uint64_t v1 = 0u;
  return result;
}

uint64_t CCPipe_create(uint64_t *a1, uint64_t a2, mach_port_t *a3, const char *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  if (!__kCCPipeTypeID) {
    pthread_once(&__gCCPipeTypeInit, (void (*)(void))__CCPipeRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    uint64_t v13 = 3825187585;
    if (!a3) {
      return v13;
    }
    goto LABEL_15;
  }
  uint64_t v8 = Instance;
  *a1 = Instance;
  *(_OWORD *)(Instance + 24) = 0u;
  outputStruct = (void *)(Instance + 24);
  *(_OWORD *)(Instance + 72) = 0u;
  *(_OWORD *)(Instance + 88) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(void *)(Instance + 16) = a3;
  CFRetain(a3);
  size_t v15 = 8;
  uint64_t v10 = IOConnectCallMethod(a3[5], 2u, 0, 0, a4, 0x448uLL, 0, 0, outputStruct, &v15);
  if (v10) {
    goto LABEL_10;
  }
  *(_DWORD *)(v8 + 32) = *((_DWORD *)a4 + 3);
  int v11 = *(_DWORD *)a4;
  *(_DWORD *)(v8 + 28) = *(_DWORD *)a4;
  *(void *)(v8 + 40) = *((void *)a4 + 3);
  *(_DWORD *)(v8 + 48) = 0;
  if (!v11)
  {
    v16[0] = 24;
    uint64_t v10 = IOConnectCallMethod(*(_DWORD *)(*(void *)(v8 + 16) + 20), 6u, 0, 0, outputStruct, 8uLL, 0, 0, (void *)(v8 + 64), v16);
    if (!v10)
    {
      os_log_t v12 = os_log_create(a4 + 580, a4 + 836);
      *(void *)(v8 + 96) = v12;
      if (v12) {
        goto LABEL_8;
      }
      uint64_t v13 = 3825187587;
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v13 = v10;
LABEL_14:
    CFRelease((CFTypeRef)v8);
LABEL_15:
    CFRelease(a3);
    return v13;
  }
LABEL_8:
  uint64_t v13 = 0;
  *(void *)(v8 + 56) = 0;
  *(unsigned char *)(v8 + 88) = 1;
  return v13;
}

uint64_t CCPipe_getClientRef(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t CCPipe_getPipeInfo(uint64_t a1)
{
  return a1 + 24;
}

uint64_t CCPipe_capture(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v12 = v2;
  long long v11 = v2;
  long long v10 = v2;
  long long v9 = v2;
  long long v8 = v2;
  long long v7 = v2;
  long long v6 = v2;
  long long v5 = v2;
  uint64_t inputStruct = *(void *)(a1 + 24);
  __strlcpy_chk();
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0xAu, 0, 0, &inputStruct, 0x88uLL, 0, 0, 0, 0);
}

uint64_t CCPipe_willDropMessage(uint64_t result)
{
  return result;
}

uint64_t CCPipe_logw(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  if (a7)
  {
    time_t v53 = 0xAAAAAAAAAAAAAAAALL;
    memset(v63, 170, 20);
    memset(&v52, 0, sizeof(v52));
    time(&v53);
    localtime_r(&v53, &v52);
    strftime(v63, 0x14uLL, "%b %d %H:%M:%S", &v52);
    *(void *)v61 = 0;
    uint64_t v62 = 0;
    strftime(v61, 0x10uLL, "%z", &v52);
    unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v12;
    long long v59 = v12;
    uint64_t v13 = a3 > 7 ? 45 : dword_237B6CE08[a3];
    snprintf(__str, 0x28uLL, "%s.%06d %s <%c>", v63, v52.tm_sec, v61, v13);
    v14 = *(NSObject **)(a1 + 96);
    if (v14)
    {
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      switch(a3)
      {
        case 0u:
        case 1u:
          goto LABEL_11;
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_10;
        case 5u:
          os_log_type_t v15 = OS_LOG_TYPE_INFO;
          goto LABEL_11;
        case 6u:
        case 7u:
          goto LABEL_9;
        default:
          if (a3 == 127) {
LABEL_9:
          }
            os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
          else {
LABEL_10:
          }
            os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_11:
          if (os_log_type_enabled(*(os_log_t *)(a1 + 96), v15))
          {
            *(_DWORD *)buf = 136315394;
            v55 = __str;
            __int16 v56 = 2080;
            uint64_t v57 = a4;
            _os_log_impl(&dword_237B6A000, v14, v15, "%s %s", buf, 0x16u);
          }
          break;
      }
    }
  }
  if (a6)
  {
    char v51 = a3;
    a6 = 3758097086;
    *(void *)&v52.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v52.uint64_t tm_hour = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday((timeval *)&v52, 0);
    unint64_t v16 = *(void *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 72);
    v18 = *(_DWORD **)(a1 + 80);
    *(_DWORD *)buf = -1431655766;
    *(_DWORD *)buf = v18[1];
    *(_DWORD *)v63 = -1431655766;
    *(_DWORD *)v63 = *v18;
    if (*(_DWORD *)buf >= v17) {
      return 3758097097;
    }
    uint64_t tm_hour = v52.tm_hour;
    uint64_t v50 = *(void *)&v52.tm_sec;
    if (*(_DWORD *)v63 < *(_DWORD *)buf) {
      LODWORD(v19) = *(_DWORD *)v63 + v17 - *(_DWORD *)buf;
    }
    else {
      LODWORD(v19) = *(_DWORD *)v63 - *(_DWORD *)buf;
    }
    if (*(_DWORD *)v63 == *(_DWORD *)buf) {
      uint64_t v19 = v17;
    }
    else {
      uint64_t v19 = v19;
    }
    unint64_t v20 = v19 - 4;
    unint64_t v21 = (a5 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v22 = v21 + 36;
    if ((v17 - *(_DWORD *)buf) <= 0x23) {
      v22 += (v17 - *(_DWORD *)buf);
    }
    if (v20 < v22)
    {
      if (__isCCDaemonRunning() && (*(_DWORD *)(a1 + 32) || v18[2])) {
        return a6;
      }
      unint64_t v46 = v20;
      v47 = v18;
      uint64_t v48 = a1;
      uint64_t v23 = *(void *)(a1 + 64);
      uint64_t v24 = *(void *)(a1 + 72);
      v25 = *(atomic_uint **)(a1 + 80);
      unint64_t v45 = v22;
      unsigned int v26 = 0;
      unint64_t v27 = v22 + 4;
      if (v27)
      {
        do
        {
          *(_DWORD *)__str = *v25;
          int v28 = *(_DWORD *)__str;
          uint64_t v29 = v23 + *(unsigned int *)__str;
          if (*(_DWORD *)v29 == 80)
          {
            v26 += 4;
            unsigned int v30 = *(_DWORD *)__str + 4;
          }
          else
          {
            if (*(_DWORD *)v29 == 82) {
              break;
            }
            int v31 = *(unsigned __int16 *)(v29 + 24) + *(unsigned __int8 *)(v29 + 26) + 36;
            v26 += v31;
            unsigned int v30 = v31 + *(_DWORD *)__str;
          }
          *(_DWORD *)__str = v30 % v24;
          int v32 = v28;
          atomic_compare_exchange_strong_explicit(v25, (unsigned int *)&v32, v30 % v24, memory_order_relaxed, memory_order_relaxed);
          if (v32 != v28) {
            printf("Someone changed readPtr %d->%d.\n", v28, *v25);
          }
        }
        while (v27 > v26);
      }
      LODWORD(v22) = v45;
      unint64_t v21 = (a5 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      BOOL v33 = v45 >= v26;
      v18 = v47;
      a1 = v48;
      unint64_t v20 = v46;
      if (v33)
      {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v48 + 48), 1u, memory_order_relaxed);
        return a6;
      }
    }
    int v34 = v22;
    unint64_t v35 = (unint64_t)*(unsigned int *)buf >> 2;
    unint64_t v36 = v17 >> 2;
    if ((v17 - *(_DWORD *)buf) > 0x23)
    {
      v37 = (unsigned char *)(v16 + 4 * v35);
    }
    else
    {
      v37 = (unsigned char *)v16;
      if (v36 > v35)
      {
        unint64_t v38 = v16 + 4 * v35 + 4;
        if (v38 <= v16 + 4 * v36) {
          unint64_t v38 = v16 + 4 * v36;
        }
        memset_pattern16((void *)(v16 + 4 * v35), &unk_237B6CDC0, ((~v16 - 4 * v35 + v38) & 0xFFFFFFFFFFFFFFFCLL) + 4);
        v37 = (unsigned char *)v16;
      }
    }
    v39 = v37 + 36;
    v40 = (unsigned char *)(v16 + 4 * v36);
    if (v37 + 36 == v40) {
      v39 = (unsigned char *)v16;
    }
    *(_DWORD *)v37 = 82;
    *((_WORD *)v37 + 3) = atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 48), 1u, memory_order_relaxed) + 1;
    *(_DWORD *)buf += v34;
    *(_DWORD *)buf %= v17;
    v18[1] = *(_DWORD *)buf;
    *((_WORD *)v37 + 2) = 0;
    *((void *)v37 + 1) = v50;
    *((void *)v37 + 2) = tm_hour;
    *((_WORD *)v37 + 12) = a5;
    v37[26] = v21 - a5;
    v37[27] = v51;
    *(void *)(v37 + 28) = 0;
    if (a5)
    {
      unint64_t v41 = 0;
      unsigned int v42 = 1;
      do
      {
        *v39++ = *(unsigned char *)(a4 + v41);
        if (v39 == v40) {
          v39 = (unsigned char *)v16;
        }
        unint64_t v41 = v42++;
      }
      while (v41 < a5);
    }
    if (v21 > a5)
    {
      unint64_t v43 = a5 - v21;
      do
      {
        *v39++ = 0;
        if (v39 == v40) {
          v39 = (unsigned char *)v16;
        }
        BOOL v33 = __CFADD__(v43++, 1);
      }
      while (!v33);
    }
    __dmb(0xBu);
    *(_DWORD *)v37 = 87;
    if (*(_DWORD *)(a1 + 32) == 1 && __isCCDaemonRunning() && v20 < *(void *)(a1 + 40) && !v18[2]) {
      __sendNotification(a1);
    }
    return 0;
  }
  return a6;
}

BOOL __isCCDaemonRunning()
{
  CFDictionaryRef v0 = IOServiceMatching("CCCapture");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v0);
  io_service_t v2 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v2 != 0;
}

uint64_t __sendNotification(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 9u, 0, 0, (const void *)(a1 + 24), 8uLL, 0, 0, 0, 0);
}

uint64_t CCStream_getTypeID()
{
  uint64_t result = __kCCStreamTypeID;
  if (!__kCCStreamTypeID)
  {
    pthread_once(&__gCCStreamTypeInit, (void (*)(void))__CCStreamRegister);
    return __kCCStreamTypeID;
  }
  return result;
}

uint64_t __CCStreamRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kCCStreamTypeID = result;
  return result;
}

CFStringRef __CCStreamCopyDebugDesc(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"CCStream@%p", a1);
}

CFStringRef __CCStreamCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"CCStream@%p", a1);
}

BOOL __CCStreamEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

double __CCStreamRelease(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  if (*(unsigned char *)(a1 + 112))
  {
    v3 = *(void **)(a1 + 40);
    if (v3) {
      free(v3);
    }
    IOConnectCallMethod(*(_DWORD *)(*(void *)v2 + 20), 5u, 0, 0, (const void *)(a1 + 32), 0x50uLL, 0, 0, 0, 0);
  }
  if (*(void *)v2)
  {
    CFRelease(*(CFTypeRef *)v2);
    *(void *)uint64_t v2 = 0;
  }
  v4 = *(const void **)(a1 + 24);
  if (v4) {
    CFRelease(v4);
  }
  *(void *)(v2 + 96) = 0;
  double result = 0.0;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  return result;
}

uint64_t CCStream_create(uint64_t *a1, uint64_t a2, void *a3, const void *a4)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (!__kCCStreamTypeID) {
    pthread_once(&__gCCStreamTypeInit, (void (*)(void))__CCStreamRegister);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    uint64_t v12 = 3825187585;
    if (!a3) {
      return v12;
    }
    goto LABEL_13;
  }
  uint64_t v8 = Instance;
  *a1 = Instance;
  long long v9 = (mach_port_t *)a3[2];
  *(_OWORD *)(Instance + 104) = 0u;
  *(_OWORD *)(Instance + 88) = 0u;
  *(_OWORD *)(Instance + 72) = 0u;
  *(_OWORD *)(Instance + 56) = 0u;
  *(_OWORD *)(Instance + 40) = 0u;
  *(_OWORD *)(Instance + 24) = 0u;
  *(void *)(Instance + 16) = v9;
  CFRetain(v9);
  *(void *)(v8 + 24) = a3;
  CFRetain(a3);
  v14[0] = 80;
  uint64_t v10 = IOConnectCallMethod(v9[5], 4u, 0, 0, a4, 0x450uLL, 0, 0, (void *)(v8 + 32), v14);
  if (v10)
  {
    uint64_t v12 = v10;
LABEL_12:
    CFRelease((CFTypeRef)v8);
    CFRelease(v9);
LABEL_13:
    CFRelease(a3);
    return v12;
  }
  *(void *)(v8 + 48) = 2048;
  long long v11 = malloc_type_malloc(0x800uLL, 0x9B3177B2uLL);
  *(void *)(v8 + 40) = v11;
  if (!v11)
  {
    uint64_t v12 = 3825187586;
    goto LABEL_12;
  }
  bzero(v11, 0x800uLL);
  uint64_t v12 = 0;
  *(void *)(v8 + 64) = 0xFFFFFFFF0000007FLL;
  *(_OWORD *)(v8 + 80) = xmmword_237B6CDB0;
  *(unsigned char *)(v8 + 112) = 1;
  return v12;
}

uint64_t CCStream_setFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  uint64_t v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0xBu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

unint64_t CCStream_getFlags(uint64_t a1)
{
  _DWORD inputStruct[2] = *MEMORY[0x263EF8340];
  inputStruct[0] = 0xAAAAAAAAAAAAAAAALL;
  inputStruct[1] = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(inputStruct[0]) = *(_DWORD *)(a1 + 32);
  size_t v2 = 8;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  if (IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0xCu, 0, 0, inputStruct, 0x10uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

uint64_t CCStream_setLogFlag(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  uint64_t v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0xDu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_clearLogFlag(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  uint64_t v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0xEu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_setConsoleFlags(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  uint64_t v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0xFu, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

unint64_t CCStream_getConsoleFlags(uint64_t a1)
{
  _DWORD inputStruct[2] = *MEMORY[0x263EF8340];
  inputStruct[0] = 0xAAAAAAAAAAAAAAAALL;
  inputStruct[1] = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(inputStruct[0]) = *(_DWORD *)(a1 + 32);
  size_t v2 = 8;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  if (IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x10u, 0, 0, inputStruct, 0x10uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

uint64_t CCStream_setConsoleLogFlag(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  uint64_t v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x11u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_clearConsoleLogFlag(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  uint64_t v5 = a2;
  inputStruct[0] = v2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x12u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t CCStream_setLevel(uint64_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = a2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x13u, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t CCStream_getLevel(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  unsigned int outputStruct = -1431655766;
  size_t v2 = 4;
  if (IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x14u, 0, 0, inputStruct, 8uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

uint64_t CCStream_setConsoleLevel(uint64_t a1, int a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = a2;
  return IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x15u, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t CCStream_getConsoleLevel(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  inputStruct[0] = *(_DWORD *)(a1 + 32);
  inputStruct[1] = -1431655766;
  unsigned int outputStruct = -1431655766;
  size_t v2 = 4;
  if (IOConnectCallMethod(*(_DWORD *)(*(void *)(a1 + 16) + 20), 0x16u, 0, 0, inputStruct, 8uLL, 0, 0, &outputStruct, &v2))
  {
    return 0;
  }
  else
  {
    return outputStruct;
  }
}

unint64_t CCStream_logEmergency(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 0, -1, a2, &a9);
}

unint64_t __logv(uint64_t a1, signed int a2, uint64_t a3, const char *a4, va_list a5)
{
  uint64_t v9 = *(void *)(a1 + 24);
  signed int Level = CCStream_getLevel(a1);
  Consolesigned int Level = CCStream_getConsoleLevel(a1);
  unint64_t Flags = CCStream_getFlags(a1);
  unint64_t result = CCStream_getConsoleFlags(a1);
  BOOL v15 = (Flags & a3) != 0 || a3 == -1;
  uint64_t v16 = Level >= a2 && v15;
  BOOL v18 = (result & a3) != 0 || a3 == -1;
  int v19 = ConsoleLevel >= a2 && v18;
  BOOL v20 = ConsoleLevel < a2 && Level < a2;
  if (!v20 && v16 | v19)
  {
    unint64_t v21 = *(char **)(a1 + 40);
    if (v21)
    {
      unint64_t v22 = (unsigned char *)(a1 + 56);
      if (!*(unsigned char *)(a1 + 56))
      {
        size_t v23 = *(void *)(a1 + 48);
        *unint64_t v22 = 1;
        unint64_t result = vsnprintf(v21, v23, a4, a5);
        if ((result & 0x80000000) != 0)
        {
LABEL_39:
          *unint64_t v22 = 0;
          return result;
        }
        if (v23 > result)
        {
          unint64_t v25 = result;
LABEL_29:
          unint64_t result = CCPipe_logw(v9, v24, a2, (uint64_t)v21, v25, v16, v19);
          goto LABEL_39;
        }
        if (result <= 0x5000)
        {
          size_t v28 = (result + 1);
          unint64_t result = (unint64_t)malloc_type_malloc(v28, 0x227BF63uLL);
          if (result)
          {
            uint64_t v29 = (char *)result;
            free(v21);
            *(void *)(a1 + 40) = v29;
            *(void *)(a1 + 48) = v28;
            unint64_t result = vsnprintf(v29, v28, a4, a5);
            if ((result & 0x80000000) != 0) {
              goto LABEL_39;
            }
            unint64_t v25 = result;
            unint64_t v21 = v29;
            goto LABEL_29;
          }
        }
        else
        {
          unint64_t result = printf("CCLogStream::log - Grown more than expected (%d)\n", result);
        }
        atomic_fetch_add_explicit((atomic_uint *volatile)(v9 + 48), 1u, memory_order_relaxed);
        goto LABEL_39;
      }
    }
    else
    {
      unint64_t result = printf("%s(): scratchBuffer is NULL\n", "__logv");
      int v27 = *(unsigned __int8 *)(a1 + 56);
      unsigned int v26 = (unsigned char *)(a1 + 56);
      if (!v27)
      {
        *unsigned int v26 = 1;
        unint64_t v22 = v26;
        goto LABEL_39;
      }
    }
    atomic_fetch_add_explicit((atomic_uint *volatile)(v9 + 48), 1u, memory_order_relaxed);
  }
  return result;
}

unint64_t CCStream_logEmergencyIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 0, a2, a3, &a9);
}

unint64_t CCStream_logAlert(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 1, -1, a2, &a9);
}

unint64_t CCStream_logAlertIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 1, a2, a3, &a9);
}

unint64_t CCStream_logCrit(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 2, -1, a2, &a9);
}

unint64_t CCStream_logCritIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 2, a2, a3, &a9);
}

unint64_t CCStream_logWarn(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 3, -1, a2, &a9);
}

unint64_t CCStream_logWarnIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 3, a2, a3, &a9);
}

unint64_t CCStream_logNotice(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 4, -1, a2, &a9);
}

unint64_t CCStream_logNoticeIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 4, a2, a3, &a9);
}

unint64_t CCStream_logInfo(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 5, -1, a2, &a9);
}

unint64_t CCStream_logInfoIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 5, a2, a3, &a9);
}

unint64_t CCStream_logDebug(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 6, -1, a2, &a9);
}

unint64_t CCStream_logDebugIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 6, a2, a3, &a9);
}

unint64_t CCStream_logSpam(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 7, -1, a2, &a9);
}

unint64_t CCStream_logSpamIf(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, 7, a2, a3, &a9);
}

unint64_t CCStream_log(uint64_t a1, signed int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, a2, -1, a3, &a9);
}

unint64_t CCStream_logIf(uint64_t a1, signed int a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return __logv(a1, a2, a3, a4, &a9);
}

uint64_t CC_getTypeID()
{
  uint64_t result = __kCCTypeID;
  if (!__kCCTypeID)
  {
    pthread_once(&__gCCTypeInit, (void (*)(void))__CCRegister);
    return __kCCTypeID;
  }
  return result;
}

uint64_t __CCRegister()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kCCTypeID = result;
  return result;
}

CFStringRef __CCCopyDebugDesc(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"CC@%p", a1);
}

CFStringRef __CCCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, @"CC@%p", a1);
}

BOOL __CCEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void __CCRelease(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  if (*(unsigned char *)(a1 + 32))
  {
    mach_port_t v3 = *(_DWORD *)(a1 + 20);
    if (v3)
    {
      IOConnectCallScalarMethod(v3, 1u, 0, 0, 0, 0);
      IOServiceClose(*(_DWORD *)(a1 + 20));
    }
  }
  if (*(_DWORD *)v2)
  {
    IOObjectRelease(*(_DWORD *)v2);
    *(_DWORD *)uint64_t v2 = 0;
  }
  os_activity_end(*(os_activity_t *)(a1 + 24));
  *(void *)uint64_t v2 = 0;
  *(void *)(v2 + 8) = 0;
  *(void *)(v2 + 16) = 0;
}

uint64_t CC_create(void *a1)
{
  if (!__kCCTypeID) {
    pthread_once(&__gCCTypeInit, (void (*)(void))__CCRegister);
  }
  uint64_t Instance = (void *)_CFRuntimeCreateInstance();
  if (!Instance) {
    return 3825187585;
  }
  mach_port_t v3 = Instance;
  *a1 = Instance;
  Instance[2] = 0;
  Instance[3] = 0;
  Instance[4] = 0;
  CFDictionaryRef v4 = IOServiceMatching("CoreCaptureResponder");
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v4);
  if (!MatchingService)
  {
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  *((_DWORD *)v3 + 4) = MatchingService;
  uint64_t v6 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0x123u, (io_connect_t *)v3 + 5);
  if (v6)
  {
    uint64_t v7 = v6;
    goto LABEL_12;
  }
  uint64_t v7 = IOConnectCallScalarMethod(*((_DWORD *)v3 + 5), 0, 0, 0, 0, 0);
  if (v7)
  {
LABEL_12:
    CFRelease(v3);
    return v7;
  }
  v3[3] = _os_activity_start(&dword_237B6A000, "CoreCapture Userspace", OS_ACTIVITY_FLAG_DEFAULT);
  *((unsigned char *)v3 + 32) = 1;
  return v7;
}

uint64_t CC_getConnectRef(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

os_activity_t _os_activity_start(void *dso, const char *description, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8040](dso, description, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void os_activity_end(os_activity_t activity)
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

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}