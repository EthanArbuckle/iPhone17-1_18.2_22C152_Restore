void sub_453C(std::exception *a1)
{
  uint64_t vars8;

  std::exception::~exception(a1);

  operator delete();
}

void sub_4578(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

const char *sub_45B0()
{
  return "CAException";
}

uint64_t sub_45BC(uint64_t a1)
{
  return a1 + 8;
}

uint64_t sub_45C4(uint64_t a1)
{
  return 0;
}

char *sub_4600(uint64_t a1, size_t a2, const void *a3)
{
  v6 = (char *)malloc_type_malloc(a2 + 14, 0x6BE2FA03uLL);
  *(_DWORD *)v6 = 1;
  *(void *)(v6 + 4) = a1;
  *((_WORD *)v6 + 6) = a2;
  memcpy(v6 + 14, a3, a2);
  return v6;
}

char *sub_4668(unsigned char *a1, unint64_t a2)
{
  unsigned int v2 = *a1 >> 4;
  if (v2 > 0xF) {
    goto LABEL_13;
  }
  if (((1 << v2) & 0x4F00) != 0)
  {
    v3 = a1 + 3;
LABEL_4:
    if ((unint64_t)v3 >= a2) {
      return (char *)a2;
    }
    else {
      return v3;
    }
  }
  if (((1 << v2) & 0x3000) != 0)
  {
LABEL_8:
    if ((unint64_t)(a1 + 2) >= a2) {
      return (char *)a2;
    }
    else {
      return a1 + 2;
    }
  }
  if (v2 != 15)
  {
LABEL_13:
    v5 = a1 + 1;
    do
    {
      v3 = v5;
      if ((unint64_t)v5 >= a2) {
        break;
      }
      ++v5;
      int v6 = *v3;
    }
    while ((v6 & 0x80000000) == 0 || v6 == -9);
    goto LABEL_4;
  }
  switch(*a1)
  {
    case 0xF0:
      goto LABEL_13;
    case 0xF1:
    case 0xF3:
      goto LABEL_8;
    case 0xF2:
      if ((unint64_t)(a1 + 3) >= a2) {
        result = (char *)a2;
      }
      else {
        result = a1 + 3;
      }
      break;
    default:
      if ((unint64_t)(a1 + 1) >= a2) {
        result = (char *)a2;
      }
      else {
        result = a1 + 1;
      }
      break;
  }
  return result;
}

uint64_t sub_4740(uint64_t a1)
{
  *(void *)a1 = off_1C690;
  unsigned int v2 = *(__CFNetService **)(a1 + 8);
  if (v2)
  {
    Current = CFRunLoopGetCurrent();
    CFNetServiceUnscheduleFromRunLoop(v2, Current, kCFRunLoopCommonModes);
    CFNetServiceSetClient(*(CFNetServiceRef *)(a1 + 8), 0, 0);
    CFNetServiceCancel(*(CFNetServiceRef *)(a1 + 8));
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + 8) = 0;
  }
  return a1;
}

void sub_47CC(uint64_t a1)
{
  v1 = *(__CFNetService **)(a1 + 8);
  if (v1)
  {
    Current = CFRunLoopGetCurrent();
    CFNetServiceUnscheduleFromRunLoop(v1, Current, kCFRunLoopCommonModes);
    CFNetServiceSetClient(*(CFNetServiceRef *)(a1 + 8), 0, 0);
    CFNetServiceCancel(*(CFNetServiceRef *)(a1 + 8));
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(void *)(a1 + 8) = 0;
  }
}

void sub_4834(void *a1)
{
}

void sub_484C(uint64_t a1)
{
  sub_4740(a1);

  operator delete();
}

uint64_t sub_4884(CFNetServiceRef *a1, CFStringRef serviceType, CFStringRef name, CFStringRef domain, SInt32 a5)
{
  clientContext.version = 0;
  clientContext.info = a1;
  memset(&clientContext.retain, 0, 24);
  int v6 = CFNetServiceCreate(kCFAllocatorDefault, domain, serviceType, name, a5);
  a1[1] = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0(__str, 0xFFFFFFFF);
      *(_DWORD *)buf = 136315906;
      v15 = "NetServicePublisher.cpp";
      __int16 v16 = 1024;
      int v17 = 24;
      __int16 v18 = 2080;
      v19 = __str;
      __int16 v20 = 2080;
      v21 = "CFNetServiceCreate failed";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)exception, "CFNetServiceCreate failed", -1);
  }
  CFNetServiceSetClient(v6, (CFNetServiceClientCallBack)sub_4BAC, &clientContext);
  v7 = a1[1];
  Current = CFRunLoopGetCurrent();
  CFNetServiceScheduleWithRunLoop(v7, Current, kCFRunLoopCommonModes);
  uint64_t result = CFNetServiceRegisterWithOptions(a1[1], 0, &error);
  if (!result)
  {
    sub_47CC((uint64_t)a1);
    snprintf((char *)buf, 0x100uLL, "CFNetServiceRegisterWithOptions returned (domain = %d, CFStreamError error = %d)", LODWORD(error.domain), error.error);
    v11 = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)v11, (char *)buf, error.error);
  }
  return result;
}

void sub_4A98(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_4AAC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_4AC4(uint64_t result, char *__s, int a3)
{
  uint64_t v3 = result;
  *(void *)uint64_t result = &off_1C668;
  *(_DWORD *)(result + 264) = a3;
  if (__s)
  {
    size_t v5 = strlen(__s);
    int v6 = (char *)(v3 + 8);
    if (v5 < 0x100)
    {
      strlcpy(v6, __s, 0x100uLL);
    }
    else
    {
      long long v7 = *(_OWORD *)__s;
      long long v8 = *((_OWORD *)__s + 1);
      long long v9 = *((_OWORD *)__s + 3);
      *(_OWORD *)(v3 + 40) = *((_OWORD *)__s + 2);
      *(_OWORD *)(v3 + 56) = v9;
      *(_OWORD *)int v6 = v7;
      *(_OWORD *)(v3 + 24) = v8;
      long long v10 = *((_OWORD *)__s + 4);
      long long v11 = *((_OWORD *)__s + 5);
      long long v12 = *((_OWORD *)__s + 7);
      *(_OWORD *)(v3 + 104) = *((_OWORD *)__s + 6);
      *(_OWORD *)(v3 + 120) = v12;
      *(_OWORD *)(v3 + 72) = v10;
      *(_OWORD *)(v3 + 88) = v11;
      long long v13 = *((_OWORD *)__s + 8);
      long long v14 = *((_OWORD *)__s + 9);
      long long v15 = *((_OWORD *)__s + 11);
      *(_OWORD *)(v3 + 168) = *((_OWORD *)__s + 10);
      *(_OWORD *)(v3 + 184) = v15;
      *(_OWORD *)(v3 + 136) = v13;
      *(_OWORD *)(v3 + 152) = v14;
      long long v16 = *((_OWORD *)__s + 12);
      long long v17 = *((_OWORD *)__s + 13);
      long long v18 = *((_OWORD *)__s + 14);
      *(_OWORD *)(v3 + 247) = *(_OWORD *)(__s + 239);
      *(_OWORD *)(v3 + 216) = v17;
      *(_OWORD *)(v3 + 232) = v18;
      *(_OWORD *)(v3 + 200) = v16;
      *(unsigned char *)(v3 + 263) = 0;
    }
    return v3;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

void sub_4B98(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void sub_4BAC(uint64_t a1, uint64_t *a2, CFNetServiceRef *a3)
{
  if (*a2 == kCFStreamErrorDomainNetServices)
  {
    size_t v5 = a3[1];
    if (*((_DWORD *)a2 + 2) == -72001)
    {
      if (v5)
      {
        Current = CFRunLoopGetCurrent();
        CFNetServiceUnscheduleFromRunLoop(v5, Current, kCFRunLoopCommonModes);
        CFNetServiceSetClient(a3[1], 0, 0);
        CFNetServiceCancel(a3[1]);
        CFRelease(a3[1]);
        a3[1] = 0;
      }
      long long v7 = (void (*)(CFNetServiceRef *))*((void *)*a3 + 2);
      v7(a3);
    }
    else
    {
      if (v5)
      {
        long long v8 = CFRunLoopGetCurrent();
        CFNetServiceUnscheduleFromRunLoop(v5, v8, kCFRunLoopCommonModes);
        CFNetServiceSetClient(a3[1], 0, 0);
        CFNetServiceCancel(a3[1]);
        CFRelease(a3[1]);
        a3[1] = 0;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *a2;
        int v10 = *((_DWORD *)a2 + 2);
        int v11 = 136315906;
        long long v12 = "NetServicePublisher.cpp";
        __int16 v13 = 1024;
        int v14 = 56;
        __int16 v15 = 1024;
        int v16 = v9;
        __int16 v17 = 1024;
        int v18 = v10;
        _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d NetServicePublisher::RegisterCallback: domain = %d, CFStreamError error = %d", (uint8_t *)&v11, 0x1Eu);
      }
    }
  }
}

char *sub_4DA0(char *__str, unsigned int a2)
{
  unsigned int v4 = bswap32(a2);
  *(_DWORD *)(__str + 1) = v4;
  if ((v4 & 0x80) != 0)
  {
    if (!__maskrune((char)v4, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((_DefaultRuneLocale.__runetype[(char)v4] & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  __darwin_ct_rune_t v5 = __str[2];
  if (v5 < 0)
  {
    if (!__maskrune(v5, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((_DefaultRuneLocale.__runetype[v5] & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  __darwin_ct_rune_t v6 = __str[3];
  if (v6 < 0)
  {
    if (!__maskrune(v6, 0x40000uLL)) {
      goto LABEL_17;
    }
  }
  else if ((_DefaultRuneLocale.__runetype[v6] & 0x40000) == 0)
  {
    goto LABEL_17;
  }
  __darwin_ct_rune_t v7 = __str[4];
  if (v7 < 0)
  {
    if (__maskrune(v7, 0x40000uLL)) {
      goto LABEL_15;
    }
  }
  else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) != 0)
  {
LABEL_15:
    *(_WORD *)(__str + 5) = 39;
    *__str = 39;
    return __str;
  }
LABEL_17:
  if (a2 + 199999 > 0x61A7E) {
    snprintf(__str, 0x10uLL, "0x%x");
  }
  else {
    snprintf(__str, 0x10uLL, "%d");
  }
  return __str;
}

uint64_t sub_4EE8(char *a1, size_t a2)
{
  snprintf(a1, a2, "0.0.0.0");
  *(void *)&v15.sa_len = 0;
  *(void *)&v15.sa_data[6] = 0;
  int v17 = 0;
  uint64_t v16 = 0;
  *(void *)&v12.sa_len = 0;
  *(void *)&v12.sa_data[6] = 0;
  int v14 = 0;
  uint64_t v13 = 0;
  int v4 = socket(2, 2, 0);
  if (v4 >= 1)
  {
    int v5 = v4;
    sub_50C4("8.8.8.8", "5000", &v15);
    if (!connect(v5, &v15, v15.sa_len))
    {
      socklen_t v11 = 28;
      if (!getsockname(v5, &v12, &v11))
      {
LABEL_8:
        if (v12.sa_family == 30)
        {
          *(_OWORD *)int v18 = 0u;
          memset(v19, 0, sizeof(v19));
          uint64_t v9 = inet_ntop(30, &v12.sa_data[6], v18, 0x2Eu);
          if (v9)
          {
            int v10 = v9;
            if (strlen(v9) < a2) {
              strlcpy(a1, v10, a2);
            }
          }
        }
        else if (v12.sa_family == 2)
        {
          v7.s_addr = *(_DWORD *)&v12.sa_data[2];
          long long v8 = inet_ntoa(v7);
          snprintf(a1, a2, "%s", v8);
        }
        return close(v5);
      }
    }
    close(v5);
  }
  uint64_t result = socket(30, 2, 0);
  if ((int)result < 1) {
    return result;
  }
  int v5 = result;
  sub_50C4("1234::1234", "5000", &v15);
  if (!connect(v5, &v15, v15.sa_len))
  {
    socklen_t v11 = 28;
    if (!getsockname(v5, &v12, &v11)) {
      goto LABEL_8;
    }
  }
  return close(v5);
}

void sub_50C4(const char *a1, const char *a2, void *a3)
{
  memset(&v10, 0, sizeof(v10));
  v10.ai_flags = 1536;
  v10.ai_socktype = 2;
  uint64_t v9 = 0;
  int v4 = getaddrinfo(a1, a2, &v10, &v9);
  if (v4)
  {
    unsigned int v8 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0(__str, v8);
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "NetUtils.cpp";
      __int16 v14 = 1024;
      int v15 = 255;
      __int16 v16 = 2080;
      int v17 = __str;
      __int16 v18 = 2080;
      v19 = "getaddrinfo";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)exception, "getaddrinfo", v8);
  }
  int v5 = v9;
  if (v9)
  {
    ai_addr = v9->ai_addr;
    if (ai_addr) {
      memcpy(a3, ai_addr, ai_addr->sa_len);
    }
  }
  freeaddrinfo(v5);
}

void sub_5240(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_5258(uint64_t a1, char *a2, size_t a3)
{
  int v5 = *(unsigned __int8 *)(a1 + 1);
  if (v5 == 30)
  {
    *(_OWORD *)socklen_t v11 = 0u;
    memset(v12, 0, sizeof(v12));
    unsigned int v8 = inet_ntop(30, (const void *)(a1 + 8), v11, 0x2Eu);
    if (v8)
    {
      uint64_t v9 = v8;
      if (strlen(v8) < a3)
      {
        strlcpy(a2, v9, a3);
        return 0;
      }
    }
  }
  else if (v5 == 2)
  {
    v6.s_addr = *(_DWORD *)(a1 + 4);
    in_addr v7 = inet_ntoa(v6);
    snprintf(a2, a3, "%s", v7);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void sub_5354(CFStringRef serviceType, CFStringRef name, CFStringRef domain, sockaddr *a4)
{
  int v4 = CFNetServiceCreate(kCFAllocatorDefault, domain, serviceType, name, 0);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0((char *)&v47, 0xFFFFFFFF);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 273;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceCreate failed";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)__str, 0x26u);
    }
    exception = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)exception, "CFNetServiceCreate failed", -1);
  }
  int v5 = v4;
  if (!CFNetServiceResolveWithTimeout(v4, 5.0, &error))
  {
    CFRelease(v5);
    SInt32 v30 = error.error;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0((char *)&v47, v30);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 278;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceResolve failed";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)__str, 0x26u);
    }
    v31 = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)v31, "CFNetServiceResolve failed", v30);
  }
  CFArrayRef Addressing = CFNetServiceGetAddressing(v5);
  int Count = CFArrayGetCount(Addressing);
  if (Addressing) {
    BOOL v8 = Count < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    CFRelease(v5);
    SInt32 v32 = error.error;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0((char *)&v47, v32);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 284;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceGetAddressing failed";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)__str, 0x26u);
    }
    v33 = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)v33, "CFNetServiceGetAddressing failed", v32);
  }
  CFIndex v9 = 0;
  unsigned __int8 v10 = 0;
  char v11 = 0;
  uint64_t v12 = Count;
  do
  {
    while (1)
    {
      CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Addressing, v9);
      BytePtr = CFDataGetBytePtr(ValueAtIndex);
      int v15 = BytePtr[1];
      if (v15 != 30 && v15 != 2) {
        break;
      }
      SCNetworkReachabilityFlags flags = 0;
      int v17 = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)BytePtr);
      __int16 v18 = v17;
      if (v17)
      {
        SCNetworkReachabilityGetFlags(v17, &flags);
        CFRelease(v18);
      }
      int v19 = (2 * flags) & 4;
      int v20 = BytePtr[1];
      if (v20 == 30)
      {
        long long v47 = 0u;
        memset(v48, 0, sizeof(v48));
        v23 = inet_ntop(30, BytePtr + 8, (char *)&v47, 0x2Eu);
        v24 = v23;
        if (v23 && strlen(v23) < 0x100)
        {
          strlcpy(__str, v24, 0x100uLL);
          goto LABEL_22;
        }
      }
      else if (v20 == 2)
      {
        v21.s_addr = *((_DWORD *)BytePtr + 1);
        v22 = inet_ntoa(v21);
        snprintf(__str, 0x100uLL, "%s", v22);
LABEL_22:
        v19 |= 2u;
      }
      if (BytePtr[1] == 30) {
        unsigned int v25 = v19 + 1;
      }
      else {
        unsigned int v25 = v19;
      }
      if (((v25 <= v10) & v11) == 0)
      {
        sockaddr v26 = *(sockaddr *)BytePtr;
        *(sockaddr *)&a4->sa_data[10] = *(sockaddr *)(BytePtr + 12);
        *a4 = v26;
        unsigned __int8 v10 = v25;
      }
      long long v47 = 0u;
      memset(v48, 0, sizeof(v48));
      int v27 = BytePtr[1];
      if (v27 == 2) {
        v28 = BytePtr + 4;
      }
      else {
        v28 = BytePtr + 8;
      }
      inet_ntop(v27, v28, (char *)&v47, 0x2Eu);
      ++v9;
      char v11 = 1;
      if (v9 == v12)
      {
        CFRelease(v5);
        return;
      }
    }
    ++v9;
  }
  while (v12 != v9);
  CFRelease(v5);
  if ((v11 & 1) == 0)
  {
    SInt32 v34 = error.error;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0((char *)&v47, v34);
      *(_DWORD *)__str = 136315906;
      v40 = "NetUtils.cpp";
      __int16 v41 = 1024;
      int v42 = 349;
      __int16 v43 = 2080;
      v44 = &v47;
      __int16 v45 = 2080;
      v46 = "CFNetServiceGetAddressing was not able to resolve the address address";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)__str, 0x26u);
    }
    v35 = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)v35, "CFNetServiceGetAddressing was not able to resolve the address address", v34);
  }
}

void sub_5908(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_591C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_5930(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_5944(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_595C(const __CFString *a1, CFStringRef theString, sockaddr *a3)
{
  long long v42 = 0u;
  long long v43 = 0u;
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
  *(_OWORD *)buffer = 0u;
  long long v29 = 0u;
  if (!CFStringGetCString(theString, buffer, 256, 0x8000100u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0(v19, 0xFFFFFFFF);
      *(_DWORD *)buf = 136315906;
      in_addr v21 = "NetUtils.cpp";
      __int16 v22 = 1024;
      int v23 = 356;
      __int16 v24 = 2080;
      unsigned int v25 = v19;
      __int16 v26 = 2080;
      int v27 = "string conversion failed";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)exception, "string conversion failed", -1);
  }
  if (buffer[0] == 9)
  {
    int v5 = strchr(&buffer[1], 9);
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_4DA0(v19, 0xFFFFFFFF);
        *(_DWORD *)buf = 136315906;
        in_addr v21 = "NetUtils.cpp";
        __int16 v22 = 1024;
        int v23 = 398;
        __int16 v24 = 2080;
        unsigned int v25 = v19;
        __int16 v26 = 2080;
        int v27 = "invalid Bonjour name";
        _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      __int16 v16 = __cxa_allocate_exception(0x110uLL);
      sub_4AC4((uint64_t)v16, "invalid Bonjour name", -1);
    }
    char *v5 = 0;
    in_addr v6 = v5 + 1;
    CFStringRef v7 = CFStringCreateWithCString(0, &buffer[1], 0x8000100u);
    CFStringRef v8 = CFStringCreateWithCString(0, v6, 0x8000100u);
    sub_5354(a1, v7, v8, a3);
    CFRelease(v7);
    CFRelease(v8);
  }
  else
  {
    CFIndex v9 = strchr(buffer, 91);
    if (v9)
    {
      unsigned __int8 v10 = v9;
      char v11 = strstr(buffer, "]:");
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_4DA0(v19, 0xFFFFFFFF);
          *(_DWORD *)buf = 136315906;
          in_addr v21 = "NetUtils.cpp";
          __int16 v22 = 1024;
          int v23 = 367;
          __int16 v24 = 2080;
          unsigned int v25 = v19;
          __int16 v26 = 2080;
          int v27 = "invalid ipv6 [host]:port string";
          _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        int v17 = __cxa_allocate_exception(0x110uLL);
        sub_4AC4((uint64_t)v17, "invalid ipv6 [host]:port string", -1);
      }
      char *v11 = 0;
      uint64_t v12 = v11 + 2;
      uint64_t v13 = v10 + 1;
    }
    else
    {
      __int16 v14 = strchr(buffer, 58);
      if (!v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_4DA0(v19, 0xFFFFFFFF);
          *(_DWORD *)buf = 136315906;
          in_addr v21 = "NetUtils.cpp";
          __int16 v22 = 1024;
          int v23 = 377;
          __int16 v24 = 2080;
          unsigned int v25 = v19;
          __int16 v26 = 2080;
          int v27 = "invalid host:port string";
          _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
        }
        __int16 v18 = __cxa_allocate_exception(0x110uLL);
        sub_4AC4((uint64_t)v18, "invalid host:port string", -1);
      }
      *__int16 v14 = 0;
      uint64_t v12 = v14 + 1;
      uint64_t v13 = buffer;
    }
    sub_50C4(v13, v12, a3);
  }
}

void sub_5E28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_5E3C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_5E50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_5E64(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_5E7C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = a1[1];
  if (v2 == a2[1] && *a1 == *a2)
  {
    if (v2 == 30)
    {
      BOOL v4 = *((void *)a1 + 1) == *((void *)a2 + 1) && *((void *)a1 + 2) == *((void *)a2 + 2);
      if (v4
        && *((unsigned __int16 *)a1 + 1) == *((unsigned __int16 *)a2 + 1)
        && *((_DWORD *)a1 + 1) == *((_DWORD *)a2 + 1)
        && *((_DWORD *)a1 + 6) == *((_DWORD *)a2 + 6))
      {
        return 1;
      }
    }
    else if (v2 == 2 {
           && *((_DWORD *)a1 + 1) == *((_DWORD *)a2 + 1)
    }
           && *((unsigned __int16 *)a1 + 1) == *((unsigned __int16 *)a2 + 1))
    {
      return 1;
    }
  }
  return 0;
}

MIDIPacket *sub_5F28(uint64_t a1, MIDITimeStamp time, int a3, Byte *data)
{
  CFStringRef v7 = (MIDIPacketList *)(a1 + 48);
  size_t v8 = a3;
  uint64_t result = MIDIPacketListAdd((MIDIPacketList *)(a1 + 48), 0x400uLL, *(MIDIPacket **)(a1 + 40), time, a3, data);
  if (result
    || v7->numPackets
    && ((*(void (**)(uint64_t, MIDIPacketList *))(*(void *)a1 + 16))(a1, v7),
        unsigned __int8 v10 = MIDIPacketListInit(v7),
        (uint64_t result = MIDIPacketListAdd(v7, 0x400uLL, v10, time, v8, data)) != 0))
  {
    *(void *)(a1 + 40) = result;
  }
  else
  {
    char v11 = sub_4600(time, v8, data);
    (*(void (**)(uint64_t, char *))(*(void *)a1 + 16))(a1, v11);
    free(v11);
    *(void *)(a1 + 40) = MIDIPacketListInit(v7);
    uint64_t result = MIDIPacketListInit(v7);
    *(void *)(a1 + 40) = result;
  }
  return result;
}

MIDIPacket *sub_6060(MIDIPacket *result, int *a2)
{
  if (*a2 >= 1)
  {
    uint64_t v2 = (uint64_t)result;
    unint64_t v3 = (unint64_t)(a2 + 1);
    unsigned int v4 = *a2 + 1;
    do
    {
      uint64_t result = sub_5F28(v2, *(void *)v3, *(unsigned __int16 *)(v3 + 8), (Byte *)(v3 + 10));
      unint64_t v3 = (v3 + *(unsigned __int16 *)(v3 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
      --v4;
    }
    while (v4 > 1);
  }
  return result;
}

BOOL sub_60CC(uint64_t a1, unsigned int a2)
{
  if (a2 <= 7)
  {
    *(_DWORD *)(a1 + 8) = byte_1B028[a2];
    BOOL v3 = a2 == 2 || a2 == 5;
    *(unsigned char *)(a1 + 4) = v3;
    *(void *)(a1 + 16) = qword_1B030[a2];
    *(_DWORD *)(a1 + 24) = byte_1B070[a2];
    *(_DWORD *)a1 = a2;
  }
  return a2 < 8;
}

uint64_t sub_6128(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 >= 1)
  {
    int v3 = *(_DWORD *)(a1 + 24);
    if (*(unsigned char *)(a1 + 4))
    {
      do
      {
        while (1)
        {
          a2 = (a2 + 1);
          if (v3 == a2)
          {
            a2 = (a2 & 0xFFFFFF00) + 256;
            if ((a2 & 0xFF00) == 0x3C00)
            {
              a2 = (a2 & 0xFFFF0000) + 0x10000;
              if ((a2 & 0xFF0000) == 0x3C0000)
              {
                unsigned int v5 = (a2 & 0xFF000000) + 0x1000000;
                if ((v5 & 0x1F000000) == 0x18000000) {
                  a2 = v5 & 0xE0000000;
                }
                else {
                  a2 = v5;
                }
              }
            }
          }
          if ((a2 & 0xFFFE) == 0) {
            break;
          }
          BOOL v4 = __OFSUB__(a3--, 1);
          if ((a3 < 0) ^ v4 | (a3 == 0)) {
            return a2;
          }
        }
        HIDWORD(v6) = -858993459 * BYTE2(a2);
        LODWORD(v6) = HIDWORD(v6);
        if ((v6 >> 1) >= 0x1999999A) {
          a2 = (a2 + 2);
        }
        else {
          a2 = a2;
        }
        BOOL v4 = __OFSUB__(a3--, 1);
      }
      while (!((a3 < 0) ^ v4 | (a3 == 0)));
    }
    else
    {
      do
      {
        a2 = (a2 + 1);
        if (v3 == a2)
        {
          a2 = (a2 & 0xFFFFFF00) + 256;
          if ((a2 & 0xFF00) == 0x3C00)
          {
            a2 = (a2 & 0xFFFF0000) + 0x10000;
            if ((a2 & 0xFF0000) == 0x3C0000)
            {
              unsigned int v8 = (a2 & 0xFF000000) + 0x1000000;
              if ((v8 & 0x1F000000) == 0x18000000) {
                a2 = v8 & 0xE0000000;
              }
              else {
                a2 = v8;
              }
            }
          }
        }
        BOOL v4 = __OFSUB__(a3--, 1);
      }
      while (!((a3 < 0) ^ v4 | (a3 == 0)));
    }
  }
  return a2;
}

uint64_t sub_624C(uint64_t a1, unsigned int a2)
{
  int v2 = HIBYTE(a2) & 0x1F;
  unsigned int v3 = *(_DWORD *)(a1 + 24) * (60 * (60 * v2 + BYTE2(a2)) + BYTE1(a2)) + a2;
  if (*(unsigned char *)(a1 + 4)) {
    return -108 * v2 - 18 * (BYTE2(a2) / 0xAu) - 2 * ((BYTE2(a2) % 0xAu) & 0x7F) + v3;
  }
  else {
    return v3;
  }
}

void sub_62BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_6318(exception, a1);
}

void sub_6304(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_6318(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_634C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_6380()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_1C770;
}

void sub_63D0(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

uint64_t sub_6408(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5, char a6, const char *a7)
{
  *(void *)a1 = off_1C798;
  *(void *)(a1 + 8) = 0;
  __int16 v14 = pthread_self();
  *(_DWORD *)(a1 + 16) = sub_64C8(v14, 0);
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = a3;
  *(void *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 104) = a4;
  *(_DWORD *)(a1 + 108) = 0;
  *(_WORD *)(a1 + 120) = 1;
  *(unsigned char *)(a1 + 122) = a5;
  int v15 = (char *)(a1 + 40);
  *(unsigned char *)(a1 + 123) = a6;
  if (a7)
  {
    strlcpy(v15, a7, 0x40uLL);
  }
  else
  {
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)int v15 = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
  }
  return a1;
}

_opaque_pthread_t *sub_64C8(_opaque_pthread_t *result, int a2)
{
  if (result)
  {
    unsigned int v3 = result;
    mach_msg_type_number_t thread_info_outCnt = 10;
    thread_inspect_t v4 = pthread_mach_thread_np(result);
    thread_info(v4, 3u, thread_info_out, &thread_info_outCnt);
    switch(v13)
    {
      case 4:
        mach_msg_type_number_t thread_info_outCnt = 4;
        thread_inspect_t v6 = pthread_mach_thread_np(v3);
        thread_info(v6, 0xCu, v11, &thread_info_outCnt);
        if (a2 == 1 && v11[2]) {
          return (_opaque_pthread_t *)v11[3];
        }
        else {
          return (_opaque_pthread_t *)v11[1];
        }
      case 2:
        mach_msg_type_number_t thread_info_outCnt = 5;
        thread_inspect_t v7 = pthread_mach_thread_np(v3);
        thread_info(v7, 0xBu, v10, &thread_info_outCnt);
        if (a2 == 1 && v10[3]) {
          return (_opaque_pthread_t *)v10[4];
        }
        else {
          return (_opaque_pthread_t *)v10[1];
        }
      case 1:
        mach_msg_type_number_t thread_info_outCnt = 5;
        thread_inspect_t v5 = pthread_mach_thread_np(v3);
        thread_info(v5, 0xAu, v9, &thread_info_outCnt);
        if (a2 == 1) {
          return (_opaque_pthread_t *)v9[2];
        }
        else {
          return (_opaque_pthread_t *)v9[1];
        }
      default:
        return 0;
    }
  }
  return result;
}

void sub_65FC()
{
}

void sub_6610(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v10;
  int v11;
  unsigned char v12[5];
  integer_t policy_info[2];
  int v14;
  int v15;

  *(_DWORD *)(a1 + 108) = a2;
  *(_DWORD *)(a1 + 112) = a3;
  *(_DWORD *)(a1 + 116) = a4;
  *(unsigned char *)(a1 + 120) = a5;
  *(unsigned char *)(a1 + 121) = 1;
  if (atomic_load((unint64_t *)(a1 + 8)))
  {
    int v6 = *(_DWORD *)(a1 + 116);
    *(void *)policy_info = *(void *)(a1 + 108);
    int v7 = *(unsigned __int8 *)(a1 + 120);
    __int16 v14 = v6;
    int v15 = v7;
    unsigned int v8 = (_opaque_pthread_t *)atomic_load((unint64_t *)(a1 + 8));
    thread_act_t v9 = pthread_mach_thread_np(v8);
    unsigned __int8 v10 = thread_policy_set(v9, 2u, policy_info, 4u);
    if (v10)
    {
      v12[0] = HIBYTE(v10);
      v12[1] = BYTE2(v10);
      v12[2] = BYTE1(v10);
      char v11 = v10;
      v12[3] = v10;
      v12[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_18A88((uint64_t)v12, v11);
      }
      __break(1u);
    }
  }
}

uint64_t sub_66C4(uint64_t result)
{
  if (atomic_load((unint64_t *)(result + 8)))
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_18BC8(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    __break(1u);
  }
  if (!atomic_load((unint64_t *)(result + 8)))
  {
    uint64_t v3 = result;
    int v4 = pthread_attr_init(&v43);
    if (v4)
    {
      int v15 = v4;
      BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v16) {
        sub_18B8C(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    else
    {
      int v5 = pthread_attr_setdetachstate(&v43, 2);
      if (v5)
      {
        int v15 = v5;
        BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v24) {
          sub_18B50(v24, v25, v26, v27, v28, v29, v30, v31);
        }
      }
      else
      {
        pthread_attr_getschedparam(&v43, &v42);
        v42.sched_priority = *(_DWORD *)(v3 + 104);
        pthread_attr_setschedparam(&v43, &v42);
        if (*(unsigned char *)(v3 + 122)) {
          pthread_attr_setschedpolicy(&v43, 4);
        }
        pthread_t v41 = 0;
        int v6 = pthread_create(&v41, &v43, (void *(__cdecl *)(void *))sub_6878, (void *)v3);
        if (!v6 && v41)
        {
          atomic_store((unint64_t)v41, (unint64_t *)(v3 + 8));
          return pthread_attr_destroy(&v43);
        }
        int v15 = v6;
        BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v32) {
          sub_18B14(v32, v33, v34, v35, v36, v37, v38, v39);
        }
      }
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_1C640;
    exception[2] = v15;
  }
  return result;
}

uint64_t sub_6878(uint64_t a1)
{
  atomic_store((unint64_t)pthread_self(), (unint64_t *)(a1 + 8));
  if (*(unsigned char *)(a1 + 40)) {
    pthread_setname_np((const char *)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 121)) {
    sub_6610(a1, *(_DWORD *)(a1 + 108), *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), *(unsigned char *)(a1 + 120));
  }
  int v2 = *(uint64_t (**)(void))(a1 + 24);
  if (!v2)
  {
    uint64_t v3 = 0;
    atomic_store(0, (unint64_t *)(a1 + 8));
    if (!*(unsigned char *)(a1 + 123)) {
      return v3;
    }
    goto LABEL_7;
  }
  uint64_t v3 = v2(*(void *)(a1 + 32));
  atomic_store(0, (unint64_t *)(a1 + 8));
  if (*(unsigned char *)(a1 + 123)) {
LABEL_7:
  }
    (*(void (**)(uint64_t))(*(void *)a1 + 8))(a1);
  return v3;
}

void sub_6940(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_695C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1C7E8;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0;
  int v3 = pthread_mutex_init((pthread_mutex_t *)(a1 + 24), 0);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_18C04(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_1C640;
    exception[2] = v5;
  }
  return a1;
}

uint64_t sub_6A14(uint64_t a1)
{
  *(void *)a1 = off_1C7E8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  return a1;
}

void sub_6A5C(uint64_t a1)
{
  *(void *)a1 = off_1C7E8;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));

  operator delete();
}

uint64_t sub_6AC4(uint64_t a1)
{
  int v2 = pthread_self();
  if (pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire))) {
    return 0;
  }
  int v4 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 24));
  if (v4)
  {
    int v5 = v4;
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_18C40(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &off_1C640;
    exception[2] = v5;
  }
  atomic_store((unint64_t)v2, (unint64_t *)(a1 + 16));
  return 1;
}

void sub_6B9C(uint64_t a1)
{
  int v2 = pthread_self();
  if (pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)))
  {
    atomic_store(0, (unint64_t *)(a1 + 16));
    int v3 = pthread_mutex_unlock((pthread_mutex_t *)(a1 + 24));
    if (v3)
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v5) {
        sub_18C7C(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_1C640;
      exception[2] = v4;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", v14, 2u);
  }
}

uint64_t sub_6C98(uint64_t a1, char *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  if (pthread_equal(v4, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)))
  {
    char v5 = 0;
LABEL_6:
    uint64_t result = 1;
    *a2 = v5;
    return result;
  }
  int v6 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 24));
  if (v6 != 16)
  {
    if (v6)
    {
      v10[0] = HIBYTE(v6);
      v10[1] = BYTE2(v6);
      v10[2] = BYTE1(v6);
      int v8 = v6;
      v10[3] = v6;
      v10[4] = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_18CB8((uint64_t)v10, v8);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_1C640;
      exception[2] = v8;
    }
    atomic_store((unint64_t)v4, (unint64_t *)(a1 + 16));
    char v5 = 1;
    goto LABEL_6;
  }
  uint64_t result = 0;
  *a2 = 0;
  return result;
}

BOOL sub_6DC0(uint64_t a1)
{
  return atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire) == 0;
}

BOOL sub_6DD4(uint64_t a1)
{
  int v2 = pthread_self();
  return pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)(a1 + 16), memory_order_acquire)) != 0;
}

void sub_6E0C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_4DA0((char *)&v2, *(_DWORD *)(a1 + 264));
    strlcpy(__dst, (const char *)&v2, 0x100uLL);
    int v2 = 136315906;
    int v3 = "MIDIRTPSession.cpp";
    __int16 v4 = 1024;
    int v5 = 102;
    __int16 v6 = 2080;
    uint64_t v7 = a1 + 8;
    __int16 v8 = 2080;
    uint64_t v9 = __dst;
    _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: %s\n", (uint8_t *)&v2, 0x26u);
  }
}

uint64_t sub_6F04(uint64_t a1)
{
  *(void *)a1 = off_1C830;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 24) = 1;
  *(unsigned char *)(a1 + 104) = 1;
  *(_DWORD *)(a1 + 136) = -1;
  *(_WORD *)(a1 + 140) = 0;
  *(void *)(a1 + 120) = off_1C8C8;
  *(void *)(a1 + 128) = 0;
  *(void *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 176) = -1;
  *(_WORD *)(a1 + 180) = 0;
  *(void *)(a1 + 152) = a1;
  *(void *)(a1 + 160) = off_1C8C8;
  *(void *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 216) = -1;
  *(_WORD *)(a1 + 220) = 0;
  *(void *)(a1 + 192) = a1;
  *(void *)(a1 + 200) = off_1C918;
  *(void *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 256) = -1;
  *(_WORD *)(a1 + 260) = 0;
  *(void *)(a1 + 232) = a1;
  *(void *)(a1 + 240) = off_1C918;
  *(void *)(a1 + 288) = 0;
  *(void *)(a1 + 296) = a1;
  *(void *)(a1 + 272) = a1;
  *(void *)(a1 + 280) = &off_1C940;
  sub_6A10(a1 + 304, (uint64_t)"MIDIRTPSession.mSessionLock");
  *(_OWORD *)(a1 + 424) = 0u;
  *(void *)(a1 + 416) = a1 + 424;
  *(_WORD *)(a1 + 440) = 0;
  *(void *)(a1 + 444) = 0;
  *(_OWORD *)(a1 + 456) = 0u;
  *(unsigned char *)(a1 + 472) = 7;
  *(void *)(a1 + 528) = 0;
  *(_DWORD *)(a1 + 508) = 0;
  *(_OWORD *)(a1 + 476) = 0u;
  *(_OWORD *)(a1 + 492) = 0u;
  *(void *)(a1 + 536) = 0x3F847AE147AE147BLL;
  *(void *)(a1 + 544) = off_1C990;
  *(void *)(a1 + 576) = 0;
  *(void *)(a1 + 584) = MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
  *(void *)(a1 + 544) = &off_1C968;
  *(void *)(a1 + 1616) = a1;
  *(unsigned char *)(a1 + 1625) = 0;
  *(_OWORD *)(a1 + 1632) = 0u;
  *(_OWORD *)(a1 + 1648) = 0u;
  *(void *)(a1 + 1664) = a1 + 1664;
  *(void *)(a1 + 1672) = a1 + 1664;
  *(void *)(a1 + 1680) = 0;
  sub_72E8(a1 + 1632, 0x10uLL);
  uint64_t v2 = *(void *)(a1 + 1656);
  *(void *)(a1 + 1656) = 0;
  if (v2)
  {
    int v3 = *(const void **)(v2 + 16);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(v2 + 16) = 0;
    }
    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v2 + 24));
    operator delete();
  }
  return a1;
}

void sub_718C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  sub_7414(v19);
  sub_7478(v18);
  sub_74DC(v17);
  sub_D62C(v16);
  sub_D358(v22, *v20);
  sub_6A14(v21);
  sub_4740(a10);
  sub_72A0(a11);
  sub_72A0(a12);
  sub_7258(a13);
  sub_7258(a14);
  sub_7598(v15);
  sub_7598(v14);
  _Unwind_Resume(a1);
}

void *sub_7258(void *a1)
{
  *a1 = off_1C8F0;
  sub_150DC((uint64_t)a1);
  return a1;
}

void *sub_72A0(void *a1)
{
  *a1 = off_1C8F0;
  sub_150DC((uint64_t)a1);
  return a1;
}

void sub_72E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(char **)a1;
  if (a2 <= (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) {
    return;
  }
  if (a2 >> 60) {
    sub_D614();
  }
  __int16 v4 = *(char **)(a1 + 8);
  uint64_t v5 = 16 * a2;
  __int16 v6 = (char *)operator new(16 * a2);
  uint64_t v7 = &v6[v5];
  __int16 v8 = &v6[v4 - v2];
  if (v4 == v2)
  {
    *(void *)a1 = v8;
    *(void *)(a1 + 8) = v8;
    *(void *)(a1 + 16) = v7;
    if (!v2) {
      return;
    }
    goto LABEL_14;
  }
  uint64_t v9 = &v6[v4 - v2];
  do
  {
    long long v10 = *((_OWORD *)v4 - 1);
    v4 -= 16;
    *((_OWORD *)v9 - 1) = v10;
    v9 -= 16;
    *(void *)__int16 v4 = 0;
    *((void *)v4 + 1) = 0;
  }
  while (v4 != v2);
  uint64_t v11 = *(char **)a1;
  uint64_t v2 = *(char **)(a1 + 8);
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 16) = v7;
  if (v2 != v11)
  {
    do
    {
      uint64_t v12 = (std::__shared_weak_count *)*((void *)v2 - 1);
      if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
      v2 -= 16;
    }
    while (v2 != v11);
    uint64_t v2 = v11;
  }
  if (v2)
  {
LABEL_14:
    operator delete(v2);
  }
}

uint64_t *sub_7414(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    uint64_t v2 = (uint64_t *)a1[1];
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0;
    if (v2 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v2[1];
        operator delete(v2);
        uint64_t v2 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t *sub_7478(uint64_t *result)
{
  uint64_t v1 = *result;
  std::logic_error *result = 0;
  if (v1)
  {
    uint64_t v2 = *(const void **)(v1 + 16);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 16) = 0;
    }
    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v1 + 24));
    operator delete();
  }
  return result;
}

void **sub_74DC(void **a1)
{
  uint64_t v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    uint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v5 = (std::__shared_weak_count *)*((void *)v3 - 1);
        if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        v3 -= 16;
      }
      while (v3 != v2);
      uint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_7598(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t sub_75D4(uint64_t a1)
{
  *(void *)a1 = off_1C830;
  sub_7820(a1);
  if (*(void *)(a1 + 1680))
  {
    uint64_t v2 = *(uint64_t **)(a1 + 1672);
    uint64_t v3 = *(void *)(a1 + 1664);
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v4;
    *(void *)(a1 + 1680) = 0;
    if (v2 != (uint64_t *)(a1 + 1664))
    {
      do
      {
        uint64_t v5 = (uint64_t *)v2[1];
        operator delete(v2);
        uint64_t v2 = v5;
      }
      while (v5 != (uint64_t *)(a1 + 1664));
    }
  }
  uint64_t v6 = *(void *)(a1 + 1656);
  *(void *)(a1 + 1656) = 0;
  if (v6)
  {
    uint64_t v7 = *(const void **)(v6 + 16);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(v6 + 16) = 0;
    }
    std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)(v6 + 24));
    operator delete();
  }
  uint64_t v8 = *(void *)(a1 + 1632);
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 1640);
    long long v10 = *(void **)(a1 + 1632);
    if (v9 != v8)
    {
      do
      {
        uint64_t v11 = *(std::__shared_weak_count **)(v9 - 8);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        v9 -= 16;
      }
      while (v9 != v8);
      long long v10 = *(void **)(a1 + 1632);
    }
    *(void *)(a1 + 1640) = v8;
    operator delete(v10);
  }
  sub_D62C((MIDIPacketList *)(a1 + 544));
  sub_D358(a1 + 416, *(void **)(a1 + 424));
  sub_6A14(a1 + 304);
  sub_4740(a1 + 280);
  *(void *)(a1 + 240) = off_1C8F0;
  sub_150DC(a1 + 240);
  *(void *)(a1 + 200) = off_1C8F0;
  sub_150DC(a1 + 200);
  *(void *)(a1 + 160) = off_1C8F0;
  sub_150DC(a1 + 160);
  *(void *)(a1 + 120) = off_1C8F0;
  sub_150DC(a1 + 120);
  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v12 = *(const void **)(a1 + 96);
    if (v12) {
      CFRelease(v12);
    }
  }
  if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v13 = *(const void **)(a1 + 16);
    if (v13) {
      CFRelease(v13);
    }
  }
  return a1;
}

void sub_7820(uint64_t a1)
{
  uint64_t v14 = a1 + 304;
  char v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 16))();
  uint64_t v2 = *(void *)(a1 + 1656);
  std::recursive_mutex::lock((std::recursive_mutex *)(v2 + 24));
  CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(v2 + 16));
  std::recursive_mutex::unlock((std::recursive_mutex *)(v2 + 24));
  uint64_t v3 = *(void **)(a1 + 504);
  if (v3)
  {
    if (*v3) {
      MIDITimerTaskDispose();
    }
    operator delete();
  }
  *(void *)(a1 + 504) = 0;
  uint64_t v4 = *(void **)(a1 + 528);
  if (v4)
  {
    if (*v4) {
      MIDITimerTaskDispose();
    }
    operator delete();
  }
  *(void *)(a1 + 528) = 0;
  for (uint64_t i = *(void *)(a1 + 1640); *(void *)(a1 + 1632) != i; uint64_t i = *(void *)(a1 + 1640))
  {
    v13[0] = *(void *)(i - 16);
    uint64_t v6 = *(std::__shared_weak_count **)(i - 8);
    v13[1] = (uint64_t)v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_8574(a1, v13, 1, 1);
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  sub_150DC(a1 + 120);
  sub_150DC(a1 + 160);
  sub_150DC(a1 + 200);
  sub_150DC(a1 + 240);
  sub_47CC(a1 + 280);
  uint64_t v7 = (uint64_t *)(a1 + 1664);
  uint64_t v8 = *(void *)(a1 + 1672);
  if (v8 != a1 + 1664)
  {
    do
    {
      free(*(void **)(v8 + 32));
      uint64_t v8 = *(void *)(v8 + 8);
    }
    while ((uint64_t *)v8 != v7);
  }
  if (*(void *)(a1 + 1680))
  {
    uint64_t v9 = *(uint64_t **)(a1 + 1672);
    uint64_t v10 = *(void *)(a1 + 1664);
    uint64_t v11 = *v9;
    *(void *)(v11 + 8) = *(void *)(v10 + 8);
    **(void **)(v10 + 8) = v11;
    *(void *)(a1 + 1680) = 0;
    if (v9 != v7)
    {
      do
      {
        uint64_t v12 = (uint64_t *)v9[1];
        operator delete(v9);
        uint64_t v9 = v12;
      }
      while (v12 != v7);
    }
  }
  *(unsigned char *)(a1 + 8) = 0;
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
  }
}

void sub_7A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::recursive_mutex::unlock(v11);
  sub_88C4(&a11);
  _Unwind_Resume(a1);
}

void sub_7A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_88C4(va);
  _Unwind_Resume(a1);
}

void sub_7AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

BOOL sub_7AC4(uint64_t a1, unsigned int a2)
{
  *(_WORD *)(a1 + 112) = a2;
  *(_WORD *)(a1 + 114) = a2 + 1;
  uint64_t v6 = 0;
  *(void *)&v5.sa_data[6] = 0;
  int v7 = 0;
  *(_WORD *)&v5.sa_len = 528;
  *(_DWORD *)&v5.sa_data[2] = 0;
  *(_WORD *)v5.sa_data = __rev16(a2);
  if (bind(*(_DWORD *)(a1 + 136), &v5, 0x10u) < 0)
  {
    if ((*__error() & 0xFFFFFFFE) == 0x30)
    {
      BOOL v3 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    *(_WORD *)(a1 + 140) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
  }
  *(_WORD *)v5.sa_data = bswap32(*(unsigned __int16 *)(a1 + 114)) >> 16;
  if (bind(*(_DWORD *)(a1 + 216), &v5, v5.sa_len) < 0)
  {
    BOOL v3 = (*__error() & 0xFFFFFFFE) != 48;
  }
  else
  {
    *(_WORD *)(a1 + 220) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
    BOOL v3 = 1;
  }
LABEL_8:
  int v7 = 0;
  *(_DWORD *)&v5.sa_data[2] = 0;
  *(_WORD *)&v5.sa_len = 7708;
  uint64_t v6 = 0;
  *(void *)&v5.sa_data[6] = 0;
  *(_WORD *)v5.sa_data = bswap32(*(unsigned __int16 *)(a1 + 112)) >> 16;
  if (bind(*(_DWORD *)(a1 + 176), &v5, 0x1Cu) < 0)
  {
    if ((*__error() & 0xFFFFFFFE) == 0x30) {
      return 0;
    }
  }
  else
  {
    *(_WORD *)(a1 + 180) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
  }
  *(_WORD *)v5.sa_data = bswap32(*(unsigned __int16 *)(a1 + 114)) >> 16;
  if (bind(*(_DWORD *)(a1 + 256), &v5, v5.sa_len) < 0) {
    return v3 & ((*__error() & 0xFFFFFFFE) != 48);
  }
  *(_WORD *)(a1 + 260) = bswap32(*(unsigned __int16 *)v5.sa_data) >> 16;
  return v3;
}

void sub_7C8C(uint64_t a1, const void *a2, unsigned int a3)
{
  if (!qword_20088) {
    operator new();
  }
  if (!*(unsigned char *)(a1 + 104))
  {
    *(void *)(a1 + 96) = a2;
    *(unsigned char *)(a1 + 105) = 0;
    goto LABEL_11;
  }
  uint64_t v6 = *(const void **)(a1 + 96);
  if (v6)
  {
    CFRelease(v6);
    int v7 = *(unsigned __int8 *)(a1 + 104);
    *(void *)(a1 + 96) = a2;
    *(unsigned char *)(a1 + 105) = 0;
    if (!a2 || !v7) {
      goto LABEL_11;
    }
  }
  else
  {
    *(void *)(a1 + 96) = a2;
    *(unsigned char *)(a1 + 105) = 0;
    if (!a2) {
      goto LABEL_11;
    }
  }
  CFRetain(a2);
LABEL_11:
  sub_8324(a1);
  sub_15128(a1 + 120, qword_20088, 2, 2, 0, 32769);
  sub_15128(a1 + 160, qword_20088, 30, 2, 0, 32769);
  sub_15128(a1 + 200, qword_20088, 2, 2, 0, 1);
  sub_15128(a1 + 240, qword_20088, 30, 2, 0, 1);
  if (!a3 || !sub_7AC4(a1, a3))
  {
    unsigned __int16 v8 = 5004;
    while (!sub_7AC4(a1, v8))
    {
      v8 += 2;
      if (v8 == 65534)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_4DA0(__str, 0xFFFFFFFF);
          int buf = 136315906;
          buf_4 = "MIDIRTPSession.cpp";
          __int16 v19 = 1024;
          int v20 = 329;
          __int16 v21 = 2080;
          uint64_t v22 = __str;
          __int16 v23 = 2080;
          BOOL v24 = "Couldn't find free port";
          _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)&buf, 0x26u);
        }
        exception = __cxa_allocate_exception(0x110uLL);
        sub_4AC4((uint64_t)exception, "Couldn't find free port", -1);
      }
    }
    if (a3 != v8) {
      (*(void (**)(uint64_t, void))(*(void *)a1 + 48))(a1, v8);
    }
  }
  fcntl(*(_DWORD *)(a1 + 136), 4, 4);
  fcntl(*(_DWORD *)(a1 + 176), 4, 4);
  fcntl(*(_DWORD *)(a1 + 216), 4, 4);
  fcntl(*(_DWORD *)(a1 + 256), 4, 4);
  CFStringRef v10 = *(const __CFString **)(a1 + 96);
  if (v10 && CFStringGetLength(v10) >= 1) {
    sub_4884((CFNetServiceRef *)(a1 + 280), @"_apple-midi._udp", *(CFStringRef *)(a1 + 96), @"local.", *(unsigned __int16 *)(a1 + 112));
  }
  int v11 = open("/dev/urandom", 4);
  int v12 = v11;
  int buf = 0;
  if (v11 < 0 || read(v11, &buf, 4uLL) < 0)
  {
    *(_DWORD *)(a1 + 392) = rand();
    int buf = 0;
    if (v12 < 0) {
      goto LABEL_30;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 392) = buf;
    int buf = 0;
  }
  if ((read(v12, &buf, 4uLL) & 0x8000000000000000) == 0)
  {
    unsigned __int16 v13 = buf;
LABEL_31:
    *(_DWORD *)(a1 + 408) = v13 + 1;
    uint64_t v14 = mach_absolute_time();
    int buf = 0;
    if (v12 < 0 || read(v12, &buf, 4uLL) < 0) {
      int v15 = rand();
    }
    else {
      int v15 = buf;
    }
    *(void *)(a1 + 400) = v14 ^ v15 & 0xFFFFFF;
    sub_D358(a1 + 416, *(void **)(a1 + 424));
    *(void *)(a1 + 416) = a1 + 424;
    *(_OWORD *)(a1 + 424) = 0u;
    *(_WORD *)(a1 + 440) = 0;
    *(void *)(a1 + 444) = 0;
    *(_OWORD *)(a1 + 456) = 0u;
    *(unsigned char *)(a1 + 472) = 7;
    *(void *)(a1 + 476) = 0;
    *(void *)(a1 + 492) = 0;
    *(void *)(a1 + 484) = 0;
    *(_DWORD *)(a1 + 500) = 0;
    *(unsigned char *)(a1 + 8) = 1;
    CFRunLoopGetCurrent();
    operator new();
  }
LABEL_30:
  unsigned __int16 v13 = rand();
  goto LABEL_31;
}

void sub_822C()
{
}

void sub_8254(uint64_t a1, int a2)
{
  if (a2) {
    operator delete();
  }
  JUMPOUT(0x8314);
}

void sub_8300()
{
}

void sub_830C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_4834(exception_object);
}

uint64_t sub_8324(uint64_t a1)
{
  CFStringRef v2 = *(const __CFString **)(a1 + 96);
  if (v2 && CFStringGetLength(v2) >= 1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      BOOL v3 = *(const void **)(a1 + 16);
      if (v3) {
        CFRelease(v3);
      }
    }
    CFStringRef v4 = *(CFStringRef *)(a1 + 96);
    *(void *)(a1 + 16) = v4;
    int v5 = *(unsigned __int8 *)(a1 + 104);
    *(unsigned char *)(a1 + 24) = v5;
    *(unsigned char *)(a1 + 25) = *(unsigned char *)(a1 + 105);
    if (v5 && v4)
    {
      CFRetain(v4);
      CFStringRef v4 = *(CFStringRef *)(a1 + 16);
    }
  }
  else
  {
    sub_4EE8(cStr, 0x80uLL);
    CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
    if (*(unsigned char *)(a1 + 24))
    {
      uint64_t v6 = *(const void **)(a1 + 16);
      if (v6) {
        CFRelease(v6);
      }
    }
    *(void *)(a1 + 16) = v4;
    *(unsigned char *)(a1 + 25) = 0;
  }
  return CFStringGetCString(v4, (char *)(a1 + 32), 64, 0x8000100u);
}

double sub_8428(uint64_t a1)
{
  CFStringRef v2 = (_OWORD *)(a1 + 8);
  sub_D358(a1, *(void **)(a1 + 8));
  *(void *)a1 = v2;
  double result = 0.0;
  *CFStringRef v2 = 0u;
  *(_WORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(unsigned char *)(a1 + 56) = 7;
  *(void *)(a1 + 60) = 0;
  *(void *)(a1 + 76) = 0;
  *(void *)(a1 + 68) = 0;
  *(_DWORD *)(a1 + 84) = 0;
  return result;
}

uint64_t sub_8488(uint64_t a1)
{
  uint64_t v2 = a1 + 304;
  int v3 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16))(a1 + 304);
  v5[0] = 0;
  *(void *)(a1 + 512) = -1;
  uint64_t result = sub_B1D4(a1, v5, 0);
  if (v3) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  return result;
}

void sub_8534(_Unwind_Exception *exception_object)
{
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_8574(uint64_t a1, uint64_t *a2, char a3, int a4)
{
  unsigned __int16 v8 = (uint64_t *)(a1 + 1664);
  uint64_t v9 = *(uint64_t **)(a1 + 1672);
  if (v9 != (uint64_t *)(a1 + 1664))
  {
    do
    {
      uint64_t v14 = (uint64_t *)v9[1];
      if (v9[3] == *a2)
      {
        free((void *)v9[4]);
        uint64_t v15 = *v9;
        *(void *)(v15 + 8) = v9[1];
        *(void *)v9[1] = v15;
        --*(void *)(a1 + 1680);
        operator delete(v9);
      }
      uint64_t v9 = v14;
    }
    while (v14 != v8);
  }
  if (a3)
  {
    uint64_t v10 = *a2;
    if (*(int *)(*a2 + 28) >= 1)
    {
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
      uint64_t v21 = 0x20000005942FFFFLL;
      unsigned int v11 = bswap32(*(_DWORD *)(a1 + 392));
      int v22 = 0;
      unsigned int v23 = v11;
      *(_OWORD *)int v20 = *(_OWORD *)(v10 + 64);
      *(_OWORD *)&v20[12] = *(_OWORD *)(v10 + 76);
      sub_5258((uint64_t)v20, v40, 0x100uLL);
      if ((sendto(*(_DWORD *)(a1 + 40 * (v20[1] == 30) + 136), &v21, 0x10uLL, 0, (const sockaddr *)v20, v20[0]) & 0x80000000) != 0) {
        __error();
      }
    }
  }
  int v12 = *(void **)(a1 + 1632);
  unsigned __int16 v13 = *(void **)(a1 + 1640);
  if (v12 == v13)
  {
LABEL_9:
    if (a4) {
LABEL_28:
    }
      (*(void (**)(uint64_t, void))(*(void *)a1 + 40))(a1, *(void *)(*a2 + 48));
  }
  else
  {
    while (*v12 != *a2)
    {
      v12 += 2;
      if (v12 == v13) {
        goto LABEL_9;
      }
    }
    BOOL v16 = v12 + 2;
    if (v12 + 2 != v13)
    {
      do
      {
        int v12 = v16;
        long long v17 = *(_OWORD *)v16;
        *BOOL v16 = 0;
        v16[1] = 0;
        uint64_t v18 = (std::__shared_weak_count *)*(v16 - 1);
        *((_OWORD *)v16 - 1) = v17;
        if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
        BOOL v16 = v12 + 2;
      }
      while (v12 + 2 != v13);
      unsigned __int16 v13 = *(void **)(a1 + 1640);
    }
    for (; v13 != v12; v13 -= 2)
    {
      __int16 v19 = (std::__shared_weak_count *)*(v13 - 1);
      if (v19)
      {
        if (!atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
      }
    }
    *(void *)(a1 + 1640) = v12;
    if (a4) {
      goto LABEL_28;
    }
  }
}

uint64_t sub_8848(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

unsigned char *sub_88C4(unsigned char *a1)
{
  if (a1[8]) {
    (*(void (**)(void))(**(void **)a1 + 24))();
  }
  return a1;
}

uint64_t sub_891C(uint64_t a1, const __CFString *a2)
{
  CFStringRef v4 = (CFNetServiceRef *)(a1 + 280);
  sub_47CC(a1 + 280);
  if (!*(unsigned char *)(a1 + 104))
  {
    *(void *)(a1 + 96) = a2;
    *(unsigned char *)(a1 + 105) = 0;
    goto LABEL_7;
  }
  int v5 = *(const void **)(a1 + 96);
  if (v5)
  {
    CFRelease(v5);
    int v6 = *(unsigned __int8 *)(a1 + 104);
    *(void *)(a1 + 96) = a2;
    *(unsigned char *)(a1 + 105) = 0;
    if (!a2 || !v6)
    {
LABEL_7:
      if (!a2) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else
  {
    *(void *)(a1 + 96) = a2;
    *(unsigned char *)(a1 + 105) = 0;
    if (!a2) {
      goto LABEL_8;
    }
  }
  CFRetain(a2);
  a2 = *(const __CFString **)(a1 + 96);
  if (!a2) {
    goto LABEL_8;
  }
LABEL_13:
  if (CFStringGetLength(a2) < 1)
  {
LABEL_8:
    uint64_t v7 = a1;
    return sub_8324(v7);
  }
  sub_4884(v4, @"_apple-midi._udp", *(CFStringRef *)(a1 + 96), @"local.", *(unsigned __int16 *)(a1 + 112));
  uint64_t v7 = a1;

  return sub_8324(v7);
}

uint64_t sub_8A10(uint64_t a1)
{
  CFStringGetCString(*(CFStringRef *)(a1 + 96), buffer, 55, 0x8000100u);
  int v2 = strrchr(buffer, 32);
  if (!v2) {
    int v2 = &buffer[strlen(buffer)];
  }
  int v3 = (unsigned __int16)word_20000++;
  snprintf(v2, 8uLL, " %d", v3);
  CFStringRef v4 = CFStringCreateWithCString(0, buffer, 0x8000100u);
  if (*(unsigned char *)(a1 + 104))
  {
    int v5 = *(const void **)(a1 + 96);
    if (v5) {
      CFRelease(v5);
    }
  }
  *(void *)(a1 + 96) = v4;
  *(unsigned char *)(a1 + 105) = 0;
  (*(void (**)(uint64_t, CFStringRef))(*(void *)a1 + 24))(a1, v4);
  sub_4884((CFNetServiceRef *)(a1 + 280), @"_apple-midi._udp", *(CFStringRef *)(a1 + 96), @"local.", *(unsigned __int16 *)(a1 + 112));
  return sub_8324(a1);
}

ssize_t sub_8B48(uint64_t a1, int a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6)
{
  long long v15 = 0u;
  memset(v14, 0, sizeof(v14));
  v13[0] = bswap32(a3);
  v13[1] = 0x2000000;
  unsigned int v10 = bswap32(*(_DWORD *)(a1 + 392));
  uint64_t v13[2] = bswap32(a4);
  v13[3] = v10;
  if (a6)
  {
    CFStringGetCString(*(CFStringRef *)(a1 + 16), (char *)v14, 256, 0x8000100u);
    HIBYTE(v15) = 0;
    int v11 = strlen((const char *)v14) + 17;
  }
  else
  {
    int v11 = 16;
  }
  return sub_BC3C((void *)a1, a2, a3, a5, v13, v11);
}

void sub_8C70(void *a1, const __CFString *a2, int a3)
{
  int v12 = a3;
  unsigned int v10 = a1 + 38;
  char v11 = (*(uint64_t (**)(void))(a1[38] + 16))();
  sub_595C(@"_apple-midi._udp", a2, &__s2);
  uint64_t v5 = a1[204];
  for (uint64_t i = a1[205]; v5 != i; v5 += 16)
  {
    if (!memcmp((const void *)(*(void *)v5 + 64), &__s2, *(unsigned __int8 *)(*(void *)v5 + 64)))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_4DA0(__str, 0xFFFFFFFD);
        int buf = 136315906;
        buf_4 = "MIDIRTPSession.cpp";
        __int16 v16 = 1024;
        int v17 = 558;
        __int16 v18 = 2080;
        __int16 v19 = __str;
        __int16 v20 = 2080;
        uint64_t v21 = "";
        _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", (uint8_t *)&buf, 0x26u);
      }
      exception = __cxa_allocate_exception(0x110uLL);
      sub_4AC4((uint64_t)exception, "", -3);
    }
  }
  unsigned __int8 v8 = 1;
  sub_DD74((uint64_t)&buf, (uint64_t)a1, &v8);
}

void sub_91BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_920C(uint64_t result, long long *a2)
{
  long long v2 = *a2;
  *(_OWORD *)(result + 76) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)(result + 64) = v2;
  int v3 = *(_DWORD *)(result + 28);
  if (v3 == 1) {
    goto LABEL_6;
  }
  if (!v3 && *(_WORD *)(result + 66) && *(_WORD *)(result + 94))
  {
    *(_DWORD *)(result + 28) = 1;
LABEL_6:
    if (*(int *)(result + 144) >= 5) {
      *(_DWORD *)(result + 28) = 2;
    }
  }
  return result;
}

uint64_t sub_925C(uint64_t result, long long *a2)
{
  long long v2 = *a2;
  *(_OWORD *)(result + 104) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)(result + 92) = v2;
  int v3 = *(_DWORD *)(result + 28);
  if (v3 == 1) {
    goto LABEL_6;
  }
  if (!v3 && *(_WORD *)(result + 66) && *(_WORD *)(result + 94))
  {
    *(_DWORD *)(result + 28) = 1;
LABEL_6:
    if (*(int *)(result + 144) >= 5) {
      *(_DWORD *)(result + 28) = 2;
    }
  }
  return result;
}

_OWORD *sub_92AC(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)(a1 + 8);
  if ((unint64_t)v3 >= *(void *)(a1 + 16))
  {
    uint64_t result = sub_D920(a1, (long long *)a2);
    *(void *)(a1 + 8) = result;
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 8);
    void *v3 = *(void *)a2;
    v3[1] = v4;
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t result = v3 + 2;
    *(void *)(a1 + 8) = v3 + 2;
  }
  return result;
}

void sub_9310(void *a1, const void *a2)
{
  unsigned __int8 v8 = a1 + 38;
  char v9 = (*(uint64_t (**)(void))(a1[38] + 16))();
  uint64_t v4 = (void *)a1[204];
  uint64_t v5 = (void *)a1[205];
  if (v4 != v5)
  {
    while (!CFEqual(*(CFTypeRef *)(*v4 + 48), a2))
    {
      v4 += 2;
      if (v4 == v5) {
        goto LABEL_4;
      }
    }
    int v6 = (std::__shared_weak_count *)v4[1];
    v7[0] = *v4;
    v7[1] = (uint64_t)v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    sub_8574((uint64_t)a1, v7, 1, 0);
    if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
LABEL_4:
  if (v9) {
    (*(void (**)(void *))(*v8 + 24))(v8);
  }
}

void sub_9448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_9468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_88C4(va);
  _Unwind_Resume(a1);
}

uint64_t sub_947C(void *a1, const void *a2, int a3)
{
  int v6 = a1 + 38;
  uint64_t result = (*(uint64_t (**)(void *))(a1[38] + 16))(a1 + 38);
  int v8 = result;
  char v9 = (uint64_t *)a1[204];
  unsigned int v10 = (uint64_t *)a1[205];
  if (v9 == v10)
  {
LABEL_7:
    if (!v8) {
      return result;
    }
    return (*(uint64_t (**)(void *))(*v6 + 24))(v6);
  }
  while (1)
  {
    uint64_t result = CFEqual(*(CFTypeRef *)(*v9 + 48), a2);
    if (result) {
      break;
    }
    v9 += 2;
    if (v9 == v10) {
      goto LABEL_7;
    }
  }
  uint64_t v11 = *v9;
  if ((a3 & 0x80000000) == 0)
  {
    uint64_t result = __udivti3();
    *(void *)(v11 + 128) = result;
    goto LABEL_7;
  }
  uint64_t result = __udivti3();
  *(void *)(v11 + 128) = -result;
  if (!v8) {
    return result;
  }
  return (*(uint64_t (**)(void *))(*v6 + 24))(v6);
}

void sub_95B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

MIDIPacketList *sub_95CC(void *a1, int a2)
{
  *(void *)&v86.packet[0].data[18] = 0;
  *(void *)&v86.packet[0].data[26] = MIDIPacketListInit((MIDIPacketList *)&v86.packet[0].data[34]);
  *(void *)&v86.numPackets = &off_1C8A0;
  char v89 = 0;
  v90 = a1;
  while (1)
  {
    v83[0] = 28;
    ssize_t v4 = recvfrom(a1[5 * (a2 == 30) + 27], v91, 0x5C1uLL, 0, &v85, v83);
    unsigned int v5 = v4;
    if (v4 != (int)v4)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = &off_1CAC0;
    }
    if ((int)v4 < 1) {
      break;
    }
    if (v4 >= 4)
    {
      *(void *)v83 = a1 + 38;
      char v84 = 0;
      char v84 = (*(uint64_t (**)(void *))(a1[38] + 16))(a1 + 38);
      unsigned int v6 = bswap32(v91[0]);
      if (v6 >= 0xFFFF0000)
      {
        sub_A0A8((uint64_t)a1, 0, (uint64_t)v91, v5, (uint64_t)&v85);
        goto LABEL_18;
      }
      if (LOBYTE(v91[0]) == 128 && v5 >= 0xE && (v91[0] & 0xFF00) == 0x6100)
      {
        uint64_t v7 = (void *)a1[204];
        int v8 = (void *)a1[205];
        if (v7 != v8)
        {
          unsigned int v9 = bswap32(v91[2]);
          while (1)
          {
            unsigned int v10 = (void *)*v7;
            if (*(_DWORD *)(*v7 + 120) == v9) {
              break;
            }
            v7 += 2;
            if (v7 == v8) {
              goto LABEL_14;
            }
          }
          int v12 = (std::__shared_weak_count *)v7[1];
          v81 = v10;
          v82 = v12;
          if (v12) {
            atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (*((_DWORD *)v10 + 7) != 2) {
            goto LABEL_15;
          }
          char v13 = v92;
          if ((char)v92 < 0)
          {
            unsigned int v14 = bswap32(v92 & 0xFF0F) >> 16;
            unsigned int v15 = 14;
          }
          else
          {
            unsigned int v14 = v92 & 0xF;
            unsigned int v15 = 13;
          }
          uint64_t v77 = bswap32(v91[1]);
          if (v5 - v15 >= v14) {
            uint64_t v16 = v14;
          }
          else {
            uint64_t v16 = v5 - v15;
          }
          uint64_t v17 = v15;
          uint64_t v18 = v16 + v15;
          unsigned int v19 = v5 - v18;
          BOOL v21 = (v92 & 0x40) == 0 || v19 < 3;
          unsigned int v22 = (unsigned __int16)v6;
          int v23 = *((_DWORD *)v10 + 75);
          __int16 v24 = v6 - v23;
          int v25 = v23 + (__int16)(v22 - v23);
          if (v23) {
            unsigned int v22 = v23 + (__int16)(v22 - v23);
          }
          unsigned int v76 = v22;
          __int16 v87 = v22;
          char v88 = 1;
          if (v23)
          {
            if (v25 - (v23 + 1) < 0)
            {
              *((_DWORD *)v10 + 75) = v25;
              goto LABEL_15;
            }
            char v26 = v24 == 1 || v21;
            if ((v26 & 1) == 0)
            {
              uint64_t v27 = v10[32];
              if (v27) {
                uint64_t v28 = v27 + (int)v77 - (int)v27;
              }
              else {
                uint64_t v28 = v77;
              }
              MIDITimeStamp v29 = v10[16] + a1[50] + (uint64_t)((double)(unint64_t)(v28 + v10[21]) * 2400.0);
              v10[32] = v28;
              sub_1780C(v10 + 39, (char *)v91 + v18, v19, v23 + 1, v25, v29, (uint64_t)&v86);
              if (v89)
              {
                char v89 = 0;
                long long v30 = (void *)a1[204];
                long long v31 = (void *)a1[205];
                uint64_t v75 = v17;
                if (v30 == v31)
                {
LABEL_50:
                  long long v32 = 0;
                  unsigned int v10 = 0;
                }
                else
                {
                  while (1)
                  {
                    unsigned int v10 = (void *)*v30;
                    if (*(_DWORD *)(*v30 + 120) == v9) {
                      break;
                    }
                    v30 += 2;
                    if (v30 == v31) {
                      goto LABEL_50;
                    }
                  }
                  long long v32 = (std::__shared_weak_count *)v30[1];
                  if (v32) {
                    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
                  }
                }
                long long v33 = v82;
                v81 = v10;
                v82 = v32;
                if (v33)
                {
                  if (!atomic_fetch_add(&v33->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                  {
                    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
                    std::__shared_weak_count::__release_weak(v33);
                  }
                  unsigned int v10 = v81;
                }
                uint64_t v17 = v75;
                if (v10) {
                  goto LABEL_60;
                }
LABEL_15:
                uint64_t v11 = v82;
                if (v82 && !atomic_fetch_add(&v82->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
                  std::__shared_weak_count::__release_weak(v11);
                }
                goto LABEL_18;
              }
              unsigned int v10 = v81;
            }
          }
LABEL_60:
          *((_DWORD *)v10 + 75) = v76;
          if (!v21)
          {
            unsigned int v34 = bswap32(*(unsigned __int16 *)((char *)v91 + v18 + 1)) >> 16;
            if (v76) {
              unsigned int v35 = v76 + (__int16)(v34 - v76);
            }
            else {
              unsigned int v35 = v34;
            }
            sub_183E4((uint64_t)(v10 + 39), v35);
            unsigned int v10 = v81;
          }
          if ((atomic_fetch_or((atomic_uchar *volatile)v10 + 296, 1u) & 1) == 0)
          {
            uint64_t v36 = v81[36];
            double Current = CFAbsoluteTimeGetCurrent();
            double v38 = Current + 1.0;
            CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v36 + 16), Current + 1.0);
            double NextFireDate = CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v36 + 16));
            double v40 = Current + 1.0001;
            while (NextFireDate > v40)
            {
              CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v36 + 16), v38);
              double NextFireDate = CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v36 + 16));
            }
          }
          if (v16)
          {
            pthread_t v41 = (unsigned __int8 *)v91 + v17;
            sched_param v42 = (unsigned __int8 *)v91 + v17 + v16;
            uint64_t v43 = 0;
            BOOL v44 = (v13 & 0x20) == 0;
            while (1)
            {
              if (v44)
              {
                __int16 v45 = v41;
                int v46 = (char)*v41++;
                uint64_t v47 = v46;
                if ((v46 & 0x80000000) == 0) {
                  goto LABEL_73;
                }
              }
              else
              {
                __int16 v45 = v41 + 1;
                int v49 = *v41;
                if ((char)*v41 < 0)
                {
                  int v50 = v49 & 0x7F;
                  while (v45 < v42)
                  {
                    char v51 = *v45++;
                    int v49 = v51 & 0x7F | (v50 << 7);
                    int v50 = v49;
                    if ((v51 & 0x80) == 0) {
                      goto LABEL_85;
                    }
                  }
                  int v49 = v50;
                }
LABEL_85:
                if (v45 == v42) {
                  goto LABEL_15;
                }
                LODWORD(v77) = v49 + v77;
                pthread_t v41 = v45 + 1;
                uint64_t v47 = *v45;
                if (((char)*v45 & 0x80000000) == 0)
                {
LABEL_73:
                  if (!v43) {
                    goto LABEL_15;
                  }
                  char v78 = v43;
                  unsigned __int8 v79 = v47;
                  if ((v43 & 0xE0) == 0xC0)
                  {
                    int v48 = 2;
                  }
                  else
                  {
                    if (v41 == v42) {
                      goto LABEL_15;
                    }
                    pthread_t v41 = v45 + 2;
                    unsigned __int8 v52 = v45[1];
LABEL_83:
                    unsigned __int8 v80 = v52;
                    int v48 = 3;
                  }
                  goto LABEL_121;
                }
              }
              if (v47 > 0xEF)
              {
                if (v47 > 0xF7)
                {
                  char v78 = v47;
LABEL_120:
                  int v48 = 1;
LABEL_121:
                  v63 = (Byte *)&v78;
                  goto LABEL_122;
                }
                switch((int)v47)
                {
                  case 240:
                  case 247:
                    v53 = v41;
                    do
                    {
                      if (v53 >= v42) {
                        break;
                      }
                      int v54 = *v53++;
                      int v55 = (1 << (v54 + 16)) & 0x91;
                    }
                    while ((v54 - 240) > 7 || v55 == 0);
                    int v57 = *(v53 - 1);
                    int v58 = v53 - 1 - v45;
                    int v59 = v58 - 1;
                    if (v57 == 247) {
                      v60 = v41;
                    }
                    else {
                      v60 = v45;
                    }
                    if (v57 == 247) {
                      int v61 = v53 - 1 - v45;
                    }
                    else {
                      int v61 = v53 - v45;
                    }
                    if (v57 == 244)
                    {
                      v60 = v45;
                      int v61 = 1;
                    }
                    if (v57 == 240) {
                      v62 = v41;
                    }
                    else {
                      v62 = v60;
                    }
                    if (v57 != 240)
                    {
                      int v59 = v61;
                      int v58 = v53 - v45;
                    }
                    uint64_t v43 = 0;
                    if (v47 == 240) {
                      v63 = v45;
                    }
                    else {
                      v63 = v62;
                    }
                    if (v47 == 240) {
                      int v48 = v58;
                    }
                    else {
                      int v48 = v59;
                    }
                    pthread_t v41 = v53;
                    break;
                  case 241:
                  case 243:
                    char v78 = v47;
                    if (v41 == v42) {
                      goto LABEL_150;
                    }
                    uint64_t v43 = 0;
                    pthread_t v41 = v45 + 2;
                    unsigned __int8 v79 = v45[1];
                    int v48 = 2;
                    goto LABEL_121;
                  case 242:
                    char v78 = -14;
                    if (v41 != v42)
                    {
                      unsigned __int8 v79 = v45[1];
                      if (v45 + 2 != v42)
                      {
                        uint64_t v43 = 0;
                        pthread_t v41 = v45 + 3;
                        unsigned __int8 v52 = v45[2];
                        goto LABEL_83;
                      }
                    }
LABEL_150:
                    uint64_t v43 = 0;
                    int v48 = 2;
                    v63 = (Byte *)&v78;
                    pthread_t v41 = v42;
                    break;
                  case 246:
                    uint64_t v43 = 0;
                    char v78 = -10;
                    goto LABEL_120;
                  default:
                    goto LABEL_15;
                }
              }
              else
              {
                char v78 = v47;
                if (v41 == v42) {
                  goto LABEL_15;
                }
                pthread_t v41 = v45 + 2;
                unsigned __int8 v79 = v45[1];
                if ((v47 & 0xE0) == 0xC0)
                {
                  int v48 = 2;
                }
                else
                {
                  if (v41 == v42) {
                    goto LABEL_15;
                  }
                  pthread_t v41 = v45 + 3;
                  unsigned __int8 v80 = v45[2];
                  int v48 = 3;
                }
                v63 = (Byte *)&v78;
                uint64_t v43 = v47;
              }
LABEL_122:
              uint64_t v64 = v81[32];
              if (v64) {
                uint64_t v65 = v64 + (int)v77 - (int)v64;
              }
              else {
                uint64_t v65 = v77;
              }
              uint64_t v66 = v81[16] + a1[50] + (uint64_t)((double)(unint64_t)(v65 + v81[21]) * 2400.0);
              v81[32] = v65;
              sub_5F28((uint64_t)&v86, v66, v48, v63);
              if (v89)
              {
                char v89 = 0;
                v67 = (void *)a1[204];
                v68 = (void *)a1[205];
                if (v67 == v68)
                {
LABEL_129:
                  uint64_t v70 = v43;
                  v69 = 0;
                  v71 = v82;
                  v81 = 0;
                  v82 = 0;
                  if (!v71) {
                    goto LABEL_142;
                  }
                }
                else
                {
                  while (1)
                  {
                    v69 = (void *)*v67;
                    if (*(_DWORD *)(*v67 + 120) == v9) {
                      break;
                    }
                    v67 += 2;
                    if (v67 == v68) {
                      goto LABEL_129;
                    }
                  }
                  v72 = (std::__shared_weak_count *)v67[1];
                  if (v72)
                  {
                    uint64_t v70 = v43;
                    atomic_fetch_add_explicit(&v72->__shared_owners_, 1uLL, memory_order_relaxed);
                    v71 = v82;
                    v81 = v69;
                    v82 = v72;
                    if (!v71) {
                      goto LABEL_142;
                    }
                  }
                  else
                  {
                    uint64_t v70 = v43;
                    v71 = v82;
                    v81 = v69;
                    v82 = 0;
                    if (!v71) {
                      goto LABEL_142;
                    }
                  }
                }
                if (!atomic_fetch_add(&v71->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
                  std::__shared_weak_count::__release_weak(v71);
                }
                v69 = v81;
LABEL_142:
                uint64_t v43 = v70;
                if (!v69) {
                  goto LABEL_15;
                }
                goto LABEL_143;
              }
              v69 = v81;
LABEL_143:
              sub_16154(v69 + 39, v76, v66, (char *)v63);
              BOOL v44 = 0;
              if (v41 >= v42) {
                goto LABEL_15;
              }
            }
          }
          goto LABEL_15;
        }
LABEL_14:
        v81 = 0;
        v82 = 0;
        goto LABEL_15;
      }
LABEL_18:
      if (v84) {
        (*(void (**)(void))(**(void **)v83 + 24))(*(void *)v83);
      }
    }
  }
  char v88 = 0;
  if (*(_DWORD *)&v86.packet[0].data[34]) {
    (*(void (**)(MIDIPacketList *, Byte *))(*(void *)&v86.numPackets + 16))(&v86, &v86.packet[0].data[34]);
  }
  *(void *)&v86.packet[0].data[26] = MIDIPacketListInit((MIDIPacketList *)&v86.packet[0].data[34]);
  if (v5) {
    __error();
  }
  return sub_DA8C(&v86);
}

void sub_9FE8(_Unwind_Exception *a1)
{
  sub_DA8C(&v2);
  _Unwind_Resume(a1);
}

void sub_A0A8(uint64_t a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4 <= 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_CAB0(exception, "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/Drivers/RTP/MIDIRTPSession.cpp: 1704");
  }
  unint64_t v5 = a4;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  *(_OWORD *)__str = 0u;
  long long v77 = 0u;
  memset(v75, 0, sizeof(v75));
  if (*(_DWORD *)a3 == 1262747647)
  {
    if (a4 >= 0x14)
    {
      sub_C7E8(a1, a3);
    }
    return;
  }
  int v10 = bswap32(*(_DWORD *)a3);
  if (sub_5258(a5, (char *)v75, 0x100uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315650;
      *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1712;
      __int16 v69 = 2048;
      uint64_t v70 = a5;
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d NetUtils::AddressToName(%p, peerNameAddrWithoutPort, sizeof(peerNameAddrWithoutPort) failed. Cannot handle control packet.", buf, 0x1Cu);
    }
    if (v10 <= -45238)
    {
LABEL_9:
      if (v10 == -48551)
      {
        if (v5 >= 0x10)
        {
          *(void *)int buf = a1 + 304;
          buf[8] = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 16))();
          int v23 = *(uint64_t **)(a1 + 1632);
          __int16 v24 = *(uint64_t **)(a1 + 1640);
          if (v23 != v24)
          {
            unsigned int v25 = bswap32(*(_DWORD *)(a3 + 12));
            while (1)
            {
              uint64_t v26 = *v23;
              if (*(_DWORD *)(*v23 + 120) == v25) {
                break;
              }
              v23 += 2;
              if (v23 == v24) {
                goto LABEL_132;
              }
            }
            pthread_t v41 = (std::__shared_weak_count *)v23[1];
            uint64_t v65 = (unsigned int *)*v23;
            uint64_t v66 = v41;
            if (v41)
            {
              atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
              uint64_t v56 = v26;
              int v57 = v41;
              atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            else
            {
              uint64_t v56 = v26;
              int v57 = 0;
            }
            sub_8574(a1, &v56, 0, 1);
            sub_8848((uint64_t)&v56);
            if (v41 && !atomic_fetch_add(&v41->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
              std::__shared_weak_count::__release_weak(v41);
            }
          }
LABEL_132:
          if (buf[8]) {
            (*(void (**)(void))(**(void **)buf + 24))(*(void *)buf);
          }
        }
      }
      else if (v10 == -46770)
      {
        if (v5 >= 0x10)
        {
          uint64_t v65 = (unsigned int *)(a1 + 304);
          LOBYTE(v66) = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 16))();
          uint64_t v27 = *(uint64_t **)(a1 + 1632);
          uint64_t v28 = *(uint64_t **)(a1 + 1640);
          if (v27 == v28)
          {
LABEL_45:
            uint64_t v63 = 0;
            uint64_t v64 = 0;
            unsigned __int8 v62 = 0;
            int v61 = 0;
            sub_E5D0((uint64_t)&v67, a1, &v62);
          }
          unsigned int v29 = bswap32(*(_DWORD *)(a3 + 12));
          while (1)
          {
            uint64_t v30 = *v27;
            if (*(_DWORD *)(*v27 + 120) == v29) {
              break;
            }
            v27 += 2;
            if (v27 == v28) {
              goto LABEL_45;
            }
          }
          uint64_t v43 = v27[1];
          uint64_t v63 = v30;
          uint64_t v64 = v43;
          if (v43) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v43 + 8), 1uLL, memory_order_relaxed);
          }
          if (a2)
          {
            sub_920C(v63, (long long *)a5);
            CFStringRef v44 = CFStringCreateWithCString(0, __str, 0x8000100u);
            if (!v44)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int buf = 136315394;
                *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 1755;
                _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d CoreMIDI network peer address name CFStringRef was NULL! This should never happen.", buf, 0x12u);
              }
              CFStringRef v44 = CFStringCreateWithCString(0, "??????", 0x8000100u);
            }
            uint64_t v45 = v63;
            if (*(unsigned char *)(v63 + 56))
            {
              int v46 = *(const void **)(v63 + 48);
              if (v46) {
                CFRelease(v46);
              }
            }
            *(void *)(v63 + 48) = v44;
            *(unsigned char *)(v45 + 57) = 0;
          }
          else
          {
            sub_925C(v63, (long long *)a5);
          }
          uint64_t v47 = v63;
          *(_DWORD *)(v63 + 120) = bswap32(*(_DWORD *)(a3 + 12));
          if (v5 >= 0x11) {
            LODWORD(v5) = v5 - (*(unsigned char *)(a3 + (int)v5 - 1) == 0);
          }
          CFStringRef v48 = CFStringCreateWithBytes(0, (const UInt8 *)(a3 + 16), (int)v5 - 16, 0x8000100u, 1u);
          if (*(unsigned char *)(v47 + 40))
          {
            int v49 = *(const void **)(v47 + 32);
            if (v49) {
              CFRelease(v49);
            }
          }
          *(void *)(v47 + 32) = v48;
          *(unsigned char *)(v47 + 41) = 0;
          uint64_t v50 = v63;
          *(_DWORD *)(v63 + 408) = *(_DWORD *)(a1 + 408) - 1;
          unsigned int v51 = bswap32(*(_DWORD *)(a3 + 4));
          if (v51 > 1)
          {
            sub_8B48(a1, a2, 0xFFFF4F4B, bswap32(*(_DWORD *)(a3 + 8)), v50, 1);
            sub_C3A8(v63);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 136316162;
              *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 1772;
              __int16 v69 = 2080;
              uint64_t v70 = a1 + 32;
              __int16 v71 = 2080;
              v72 = __str;
              __int16 v73 = 1024;
              unsigned int v74 = v51;
              _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: rejected connection from %s: unsupported version %d protocol\n", buf, 0x2Cu);
            }
            sub_CAE8(buf, (CFStringRef)qword_200A8, (uint64_t)__str);
            (*(void (**)(uint64_t, void))(*(void *)a1 + 56))(a1, *(void *)&buf[8]);
            sub_C798(buf);
            sub_8B48(a1, a2, 0xFFFF4E4F, bswap32(*(_DWORD *)(a3 + 8)), v63, 0);
            v60[0] = v63;
            v60[1] = v64;
            if (v64) {
              atomic_fetch_add_explicit((atomic_ullong *volatile)(v64 + 8), 1uLL, memory_order_relaxed);
            }
            sub_8574(a1, v60, 1, 1);
            sub_8848((uint64_t)v60);
          }
          v53 = (std::__shared_weak_count *)v64;
          if (v64 && !atomic_fetch_add((atomic_ullong *volatile)(v64 + 8), 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
            std::__shared_weak_count::__release_weak(v53);
          }
          if ((_BYTE)v66) {
            (*(void (**)(unsigned int *))(*(void *)v65 + 24))(v65);
          }
        }
      }
      else if (v10 == -45489 && v5 >= 0x10)
      {
        uint64_t v65 = (unsigned int *)(a1 + 304);
        LOBYTE(v66) = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 16))();
        uint64_t v11 = *(uint64_t **)(a1 + 1632);
        int v12 = *(uint64_t **)(a1 + 1640);
        if (v11 == v12)
        {
LABEL_17:
          unsigned int v15 = 0;
          uint64_t v63 = 0;
          uint64_t v64 = 0;
        }
        else
        {
          unsigned int v13 = bswap32(*(_DWORD *)(a3 + 8));
          while (1)
          {
            uint64_t v14 = *v11;
            if (*(_DWORD *)(*v11 + 24) == v13) {
              break;
            }
            v11 += 2;
            if (v11 == v12) {
              goto LABEL_17;
            }
          }
          unsigned int v15 = (std::__shared_weak_count *)v11[1];
          uint64_t v63 = *v11;
          uint64_t v64 = (uint64_t)v15;
          if (v15)
          {
            atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
            sub_CB4C((void *)a1, -46770, v14);
            uint64_t v58 = v14;
            int v59 = v15;
            atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          else
          {
            sub_CB4C((void *)a1, -46770, v14);
            uint64_t v58 = v14;
            int v59 = 0;
          }
          sub_8574(a1, &v58, 0, 1);
          sub_8848((uint64_t)&v58);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136315906;
          *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1846;
          __int16 v69 = 2080;
          uint64_t v70 = a1 + 32;
          __int16 v71 = 2080;
          v72 = __str;
          _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: connection attempt to %s rejected\n", buf, 0x26u);
        }
        CFStringRef v54 = CFStringCreateWithFormat(0, 0, (CFStringRef)qword_200A0, __str);
        *(void *)int buf = off_1CAE8;
        *(void *)&buf[8] = v54;
        (*(void (**)(uint64_t))(*(void *)a1 + 56))(a1);
        *(void *)int buf = off_1CA28;
        if (*(void *)&buf[8]) {
          CFRelease(*(CFTypeRef *)&buf[8]);
        }
        if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
        if ((_BYTE)v66) {
          (*(void (**)(unsigned int *))(*(void *)v65 + 24))(v65);
        }
      }
      return;
    }
  }
  else
  {
    unsigned int v16 = bswap32(*(unsigned __int16 *)(a5 + 2)) >> 16;
    if (*(unsigned char *)(a5 + 1) == 30)
    {
      snprintf(__str, 0x100uLL, "[%s]:%d", (const char *)v75, v16);
      if (v10 <= -45238) {
        goto LABEL_9;
      }
    }
    else
    {
      snprintf(__str, 0x100uLL, "%s:%d", (const char *)v75, v16);
      if (v10 <= -45238) {
        goto LABEL_9;
      }
    }
  }
  if (v10 == -45237)
  {
    if (v5 >= 0x10)
    {
      *(void *)int buf = a1 + 304;
      buf[8] = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 16))();
      long long v31 = *(unsigned int ***)(a1 + 1632);
      long long v32 = *(unsigned int ***)(a1 + 1640);
      if (v31 != v32)
      {
        unsigned int v33 = bswap32(*(_DWORD *)(a3 + 8));
        while (1)
        {
          unsigned int v34 = *v31;
          if ((*v31)[6] == v33) {
            break;
          }
          v31 += 2;
          if (v31 == v32) {
            goto LABEL_115;
          }
        }
        sched_param v42 = (std::__shared_weak_count *)v31[1];
        uint64_t v65 = *v31;
        uint64_t v66 = v42;
        if (v42) {
          atomic_fetch_add_explicit(&v42->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_CB4C((void *)a1, -46770, (uint64_t)v34);
        v34[30] = bswap32(*(_DWORD *)(a3 + 12));
        v34[102] = *(_DWORD *)(a1 + 408) - 1;
        sub_C3A8((uint64_t)v34);
        if (a2) {
          sub_8B48(a1, 0, 0xFFFF494E, v34[6], (uint64_t)v34, 1);
        }
        else {
          sub_C228((uint64_t)v34);
        }
        if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
      }
LABEL_115:
      if (buf[8]) {
        goto LABEL_105;
      }
    }
  }
  else
  {
    if (v10 != -44468)
    {
      if (v10 == -44461 && v5 >= 0xA)
      {
        uint64_t v17 = a1 + 304;
        int v18 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16))(a1 + 304);
        unsigned int v19 = *(void **)(a1 + 1632);
        __int16 v20 = *(void **)(a1 + 1640);
        if (v19 != v20)
        {
          unsigned int v21 = bswap32(*(_DWORD *)(a3 + 4));
          while (1)
          {
            uint64_t v22 = *v19;
            if (*(_DWORD *)(*v19 + 120) == v21) {
              break;
            }
            v19 += 2;
            if (v19 == v20) {
              goto LABEL_67;
            }
          }
          double v38 = (std::__shared_weak_count *)v19[1];
          if (v38) {
            atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          unsigned int v39 = bswap32(*(unsigned __int16 *)(a3 + 8)) >> 16;
          int v40 = *(_DWORD *)(v22 + 408);
          if (v40) {
            unsigned int v39 = v40 + (__int16)(v39 - v40);
          }
          *(_DWORD *)(v22 + 408) = v39;
          if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }
LABEL_67:
        if (v18) {
          (*(void (**)(uint64_t))(*(void *)v17 + 24))(v17);
        }
      }
      return;
    }
    if (v5 >= 0xC)
    {
      *(void *)int buf = a1 + 304;
      buf[8] = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 16))();
      unsigned int v35 = *(unsigned int ***)(a1 + 1632);
      uint64_t v36 = *(unsigned int ***)(a1 + 1640);
      if (v35 != v36)
      {
        unsigned int v37 = bswap32(*(_DWORD *)(a3 + 4));
        while ((*v35)[30] != v37)
        {
          v35 += 2;
          if (v35 == v36) {
            goto LABEL_104;
          }
        }
        unsigned __int8 v52 = (std::__shared_weak_count *)v35[1];
        uint64_t v65 = *v35;
        uint64_t v66 = v52;
        if (v52) {
          atomic_fetch_add_explicit(&v52->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        (*(void (**)(uint64_t, void))(*(void *)a1 + 64))(a1, bswap32(*(_DWORD *)(a3 + 8)));
        if (v52 && !atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
          std::__shared_weak_count::__release_weak(v52);
        }
      }
LABEL_104:
      if (buf[8]) {
LABEL_105:
      }
        (*(void (**)(void))(**(void **)buf + 24))(*(void *)buf);
    }
  }
}

void sub_AFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v14 = va_arg(va2, void);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v17 = va_arg(va2, void);
  sub_8848((uint64_t)va);
  sub_8848((uint64_t)va1);
  sub_88C4(va2);
  _Unwind_Resume(a1);
}

void sub_AFC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v12 = va_arg(va2, void);
  uint64_t v14 = va_arg(va2, void);
  sub_8848((uint64_t)va);
  sub_8848((uint64_t)va1);
  sub_88C4(va2);
  _Unwind_Resume(a1);
}

void sub_B074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  sub_8848((uint64_t)va);
  sub_88C4(va1);
  _Unwind_Resume(a1);
}

void sub_B09C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_B0B0(uint64_t result, long long *a2)
{
  uint64_t v2 = result;
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(result + 8);
  *(_OWORD *)uint64_t result = v3;
  if (v4)
  {
    if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      return v2;
    }
  }
  return result;
}

uint64_t sub_B13C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 1075) = 1;
  if (*(unsigned char *)(a1 + 1074)) {
    sub_6B9C(*(void *)(a1 + 1080) + 304);
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 1080) + 16))(*(void *)(a1 + 1080), a2);
  if (*(unsigned char *)(a1 + 1074))
  {
    uint64_t v5 = *(void *)(a1 + 1080) + 304;
    return sub_6AC4(v5);
  }
  return result;
}

uint64_t sub_B1D4(uint64_t a1, int *a2, char a3)
{
  uint64_t v6 = a1 + 304;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16))(a1 + 304);
  int v8 = result;
  if (!*(unsigned char *)(a1 + 8)) {
    goto LABEL_8;
  }
  if ((a3 & 2) != 0) {
    *(unsigned char *)(a1 + 1625) = 1;
  }
  uint64_t result = (uint64_t)sub_6060((MIDIPacket *)(a1 + 544), a2);
  if (!*(_DWORD *)(a1 + 592))
  {
LABEL_8:
    if (!v8) {
      return result;
    }
    return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 24))(v6);
  }
  if ((a3 & 1) == 0)
  {
    if (!*(unsigned char *)(a1 + 1624))
    {
      *(unsigned char *)(a1 + 1624) = 1;
      mach_absolute_time();
      uint64_t result = MIDITimerTaskSetNextWakeTime();
    }
    goto LABEL_8;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 544) + 16))(a1 + 544, a1 + 592);
  uint64_t result = (uint64_t)MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
  *(void *)(a1 + 584) = result;
  if (!v8) {
    return result;
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 24))(v6);
}

void sub_B328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_B340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

MIDIPacket *sub_B354(uint64_t a1)
{
  uint64_t v2 = a1 + 304;
  uint64_t result = (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)(a1 + 304) + 16))(a1 + 304);
  int v4 = (int)result;
  if (*(unsigned char *)(a1 + 8))
  {
    if (*(_DWORD *)(a1 + 592)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 544) + 16))(a1 + 544, a1 + 592);
    }
    uint64_t result = MIDIPacketListInit((MIDIPacketList *)(a1 + 592));
    *(void *)(a1 + 584) = result;
    *(unsigned char *)(a1 + 1624) = 0;
  }
  if (v4) {
    return (MIDIPacket *)(*(uint64_t (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  return result;
}

void sub_B43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t sub_B450(uint64_t a1, uint64_t a2)
{
  unint64_t v10 = a2 + 4;
  unsigned int v9 = 0;
  int v8 = (char *)(a2 + 14);
  __int16 v7 = 0;
  do
    uint64_t result = sub_B558(a1, (unsigned int *)a2, &v9, &v10, &v8, (unsigned char *)&v7 + 1, &v7);
  while (!result);
  if (*(_DWORD *)a2)
  {
    double v5 = dbl_1B170[(_BYTE)v7 == 0];
  }
  else
  {
    if (!HIBYTE(v7)) {
      return result;
    }
    double v5 = fmin(*(double *)(a1 + 520) + *(double *)(a1 + 520), 1.0);
  }
  uint64_t result = mach_absolute_time();
  unint64_t v6 = result + (uint64_t)(v5 * 24000000.0);
  *(double *)(a1 + 520) = v5;
  if (v6 < *(void *)(a1 + 512))
  {
    *(void *)(a1 + 512) = v6;
    return MIDITimerTaskSetNextWakeTime();
  }
  return result;
}

uint64_t sub_B558(uint64_t a1, unsigned int *a2, unsigned int *a3, unint64_t *a4, char **a5, unsigned char *a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(a1 + 1632);
  uint64_t v8 = *(void *)(a1 + 1640);
  if (v7 != v8)
  {
    char v15 = 0;
    unsigned int v16 = *(_DWORD *)(a1 + 408);
    unsigned int v17 = v16;
    do
    {
      if (*(_DWORD *)(*(void *)v7 + 28) == 2)
      {
        unsigned int v18 = *(_DWORD *)(*(void *)v7 + 408);
        if (v18 < v17 && v18 != 0) {
          unsigned int v17 = v18 + 1;
        }
        char v15 = 1;
      }
      v7 += 16;
    }
    while (v7 != v8);
    if (v15)
    {
      unint64_t v20 = *a4;
      unsigned int v21 = *a5;
      if (!*a2 || (uint64_t v22 = *(void *)v20) == 0)
      {
        uint64_t v22 = mach_absolute_time();
        unsigned int v16 = *(_DWORD *)(a1 + 408);
      }
      uint64_t v75 = a6;
      unint64_t v23 = (unint64_t)((double)(uint64_t)(v22 - *(void *)(a1 + 400)) * 0.000416666667 + 0.5);
      v88[0] = 24960;
      v88[1] = bswap32(v16) >> 16;
      unsigned int v24 = bswap32(*(_DWORD *)(a1 + 392));
      unsigned int v89 = bswap32(v23);
      unsigned int v90 = v24;
      int v25 = sub_167F4(a1 + 416, v17, v16, v87, 1400);
      int v26 = v25;
      int v76 = v25;
      if (*a3 < *a2)
      {
        uint64_t v70 = a2;
        __int16 v71 = a3;
        v72 = a4;
        __int16 v73 = a5;
        unsigned int v27 = 0;
        char v77 = 0;
        if (v25 <= 3) {
          int v28 = 1472;
        }
        else {
          int v28 = 1472 - v25;
        }
        long long v78 = (char *)v88 + v28;
        char v29 = 1;
        uint64_t v30 = v92;
LABEL_20:
        uint64_t v31 = *(unsigned __int16 *)(v20 + 8);
        uint64_t v32 = *(void *)v20;
        if (!*(void *)v20) {
          uint64_t v32 = mach_absolute_time();
        }
        unint64_t v33 = v20 + v31 + 10;
        unint64_t v34 = (unint64_t)((double)(uint64_t)(v32 - *(void *)(a1 + 400)) * 0.000416666667 + 0.5);
        while (1)
        {
          unsigned int v35 = *v21;
          if ((v29 & 1) == 0)
          {
            unsigned int v36 = v34 - v23;
            unsigned int v37 = (v34 - v23) & 0x7F;
            if ((v34 - v23) >= 0x80)
            {
              do
              {
                int v38 = (v37 << 8) | (v36 >> 7) & 0x7F;
                unsigned int v39 = v36 >> 14;
                v36 >>= 7;
                unsigned int v37 = v38 | 0x80;
              }
              while (v39);
            }
            do
            {
              char v40 = v37;
              *v30++ = v37;
              v37 >>= 8;
            }
            while (v40 < 0);
            LODWORD(v23) = v34;
          }
          sub_16154((uint64_t *)(a1 + 416), *(_DWORD *)(a1 + 408), *(void *)v20, v21);
          pthread_t v41 = sub_4668(v21, v33);
          if (v27 && v35 == v27)
          {
            char v42 = 0;
            ++v21;
          }
          else
          {
            if ((v35 & 0x80) == 0)
            {
              int v46 = *(v41 - 1);
              unint64_t v43 = v41 - v21;
              if (v46 == 247) {
                int v47 = v41 - v21;
              }
              else {
                int v47 = v43 + 1;
              }
              int v48 = v47 + 1;
              int v49 = v78 - v30;
              if ((int)v78 - (int)v30 < v48)
              {
                int v62 = v49 - 2;
                if (v49 - 2 >= v48) {
                  int v62 = v48;
                }
                if (v62 >= 32)
                {
                  *v30++ = -9;
                  int v26 = v76;
                  uint64_t v63 = v73;
LABEL_87:
                  uint64_t v64 = v62;
                  memcpy(v30, v21, v62);
                  uint64_t v65 = &v30[v64];
                  *uint64_t v65 = -16;
                  uint64_t v30 = v65 + 1;
                  v21 += v64;
                  goto LABEL_89;
                }
                int v26 = v76;
                uint64_t v63 = v73;
LABEL_89:
                uint64_t v59 = 0;
                unint64_t *v72 = v20;
                Byte *v63 = v21;
                int v60 = v30 - v92;
                if (v60 <= 15) {
                  goto LABEL_77;
                }
LABEL_90:
                int v61 = v60 + 14;
                __int16 v91 = bswap32(v60 | 0x8000) >> 16;
                LOBYTE(v60) = v91;
                if (v26 >= 4) {
                  goto LABEL_91;
                }
                goto LABEL_92;
              }
              unsigned int v27 = 0;
              if (v46 == 247) {
                char v42 = 0;
              }
              else {
                char v42 = -16;
              }
              *v30++ = -9;
              if (v21 >= v41) {
                goto LABEL_57;
              }
              goto LABEL_47;
            }
            if (v35 > 0xEF)
            {
              if (v35 > 0xF7)
              {
                char v42 = 0;
                char v77 = 1;
              }
              else if (v35 == 247 || v35 == 240)
              {
                unsigned int v27 = 0;
                if (v35 == 247) {
                  char v57 = -12;
                }
                else {
                  char v57 = 0;
                }
                if (*(v41 - 1) == 247) {
                  char v42 = v57;
                }
                else {
                  char v42 = -16;
                }
              }
              else
              {
                unsigned int v27 = 0;
                char v42 = 0;
              }
            }
            else
            {
              char v42 = 0;
              v77 |= v35 < 0xA0;
              unsigned int v27 = v35;
            }
          }
          unint64_t v43 = v41 - v21;
          if (v42) {
            int v44 = v43 + 1;
          }
          else {
            int v44 = v41 - v21;
          }
          int v45 = v78 - v30;
          if ((int)v78 - (int)v30 < v44)
          {
            int v62 = v45 - 2;
            if (v45 - 2 >= v44) {
              int v62 = v44;
            }
            int v26 = v76;
            uint64_t v63 = v73;
            if (v62 > 31) {
              goto LABEL_87;
            }
            goto LABEL_89;
          }
          if (v21 >= v41) {
            goto LABEL_57;
          }
LABEL_47:
          if (v43 < 0x20 || (unint64_t)(v30 - v21) < 0x20)
          {
            uint64_t v50 = v30;
            unsigned int v51 = v21;
LABEL_54:
            uint64_t v30 = v50;
            do
            {
              char v56 = *v51++;
              *v30++ = v56;
            }
            while (v51 != &v21[v43]);
            v21 += v43;
            goto LABEL_57;
          }
          uint64_t v50 = &v30[v43 & 0xFFFFFFFFFFFFFFE0];
          unsigned int v51 = &v21[v43 & 0xFFFFFFFFFFFFFFE0];
          unsigned __int8 v52 = (long long *)(v21 + 16);
          v53 = v30 + 16;
          unint64_t v54 = v43 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v55 = *v52;
            *(v53 - 1) = *(v52 - 1);
            _OWORD *v53 = v55;
            v52 += 2;
            v53 += 2;
            v54 -= 32;
          }
          while (v54);
          if (v43 != (v43 & 0xFFFFFFFFFFFFFFE0)) {
            goto LABEL_54;
          }
          v21 += v43;
          v30 += v43 & 0xFFFFFFFFFFFFFFE0;
LABEL_57:
          if (v42) {
            *v30++ = v42;
          }
          char v29 = 0;
          if ((unint64_t)v21 >= v33)
          {
            char v29 = 0;
            unint64_t v20 = (v20 + *(unsigned __int16 *)(v20 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
            unsigned int v21 = (char *)(v20 + 10);
            unsigned int v58 = *v71 + 1;
            unsigned int *v71 = v58;
            uint64_t v59 = 1;
            int v26 = v76;
            if (v58 < *v70) {
              goto LABEL_20;
            }
            goto LABEL_76;
          }
        }
      }
      char v77 = 0;
      uint64_t v59 = 1;
      uint64_t v30 = v92;
LABEL_76:
      int v60 = v30 - v92;
      if (v60 > 15) {
        goto LABEL_90;
      }
LABEL_77:
      memmove((char *)&v91 + 1, v92, v60);
      LOBYTE(v91) = v60;
      int v61 = v60 + 13;
      --v30;
      if (v26 >= 4)
      {
LABEL_91:
        LOBYTE(v91) = v60 | 0x40;
        memcpy(v30, v87, v26);
        v61 += v26;
      }
LABEL_92:
      if (v61 >= 14)
      {
        if (*(unsigned char *)(a1 + 1625))
        {
          *(unsigned char *)(a1 + 1625) = 0;
        }
        else
        {
          uint64_t v67 = *(void *)(a1 + 1632);
          for (uint64_t i = *(void *)(a1 + 1640); v67 != i; v67 += 16)
          {
            if (*(_DWORD *)(*(void *)v67 + 28) == 2
              && (sendto(*(_DWORD *)(a1 + 216 + 40 * (*(unsigned char *)(*(void *)v67 + 93) == 30)), v88, v61, 0, (const sockaddr *)(*(void *)v67 + 92), *(unsigned __int8 *)(*(void *)v67 + 92)) & 0x80000000) != 0)
            {
              int v69 = *__error();
              if (v69 < 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)int buf = 136315906;
                long long v80 = "MIDIRTPSession.cpp";
                __int16 v81 = 1024;
                int v82 = 1398;
                __int16 v83 = 2080;
                uint64_t v84 = a1 + 32;
                __int16 v85 = 1024;
                int v86 = v69;
                _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: couldn't send (%d)\n", buf, 0x22u);
              }
            }
          }
        }
      }
      ++*(_DWORD *)(a1 + 408);
      if (v77)
      {
        *a7 = 1;
        if (v76 < 4) {
          return v59;
        }
      }
      else if (v76 < 4)
      {
        return v59;
      }
      *uint64_t v75 = 1;
      return v59;
    }
  }
  return 1;
}

ssize_t sub_BC3C(void *a1, int a2, int a3, uint64_t a4, void *a5, int a6)
{
  uint64_t v10 = 92;
  if (a2) {
    uint64_t v10 = 64;
  }
  uint64_t v11 = (_OWORD *)(a4 + v10);
  *(_OWORD *)unint64_t v23 = *v11;
  *(_OWORD *)&v23[12] = *(_OWORD *)((char *)v11 + 12);
  if (a3 != -48309)
  {
    if (a3 == -46770)
    {
      uint64_t v13 = malloc_type_malloc(a6, 0xACE5F70AuLL);
      memcpy(v13, a5, a6);
      double Current = CFAbsoluteTimeGetCurrent();
      unsigned int v24 = a1 + 38;
      int v15 = (*(uint64_t (**)(void *))(a1[38] + 16))(a1 + 38);
      char v25 = v15;
      unsigned int v16 = (char *)operator new(0x58uLL);
      v16[16] = a2;
      *((_DWORD *)v16 + 5) = -46770;
      *((void *)v16 + 3) = a4;
      *((void *)v16 + 4) = v13;
      *((_DWORD *)v16 + 10) = a6;
      *(_OWORD *)(v16 + 44) = *(_OWORD *)v23;
      *(_OWORD *)(v16 + 56) = *(_OWORD *)&v23[12];
      *((_DWORD *)v16 + 18) = 1;
      *((double *)v16 + 10) = Current + 1.0;
      uint64_t v17 = a1[208];
      *(void *)unsigned int v16 = v17;
      *((void *)v16 + 1) = a1 + 208;
      *(void *)(v17 + 8) = v16;
      a1[208] = v16;
      ++a1[210];
      uint64_t v18 = a1[207];
      uint64_t v19 = a1[209];
      for (i = 1.0e40; (void *)v19 != a1 + 208; uint64_t v19 = *(void *)(v19 + 8))
        double i = fmin(*(double *)(v19 + 80), i);
      do
        CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v18 + 16), i);
      while (CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v18 + 16)) > i + 0.0001);
      if (v15) {
        (*(void (**)(void *))(a1[38] + 24))(a1 + 38);
      }
    }
    sub_5258((uint64_t)v23, (char *)&v24, 0x100uLL);
  }
  unsigned int v21 = &a1[5 * (v23[1] == 30)];
  if (a2) {
    ssize_t result = sendto(*((_DWORD *)v21 + 34), a5, a6, 0, (const sockaddr *)v23, v23[0]);
  }
  else {
    ssize_t result = sendto(*((_DWORD *)v21 + 54), a5, a6, 0, (const sockaddr *)v23, v23[0]);
  }
  if ((result & 0x80000000) != 0) {
    return (ssize_t)__error();
  }
  return result;
}

void sub_BEC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_BEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  sub_88C4(va);
  _Unwind_Resume(a1);
}

void sub_BF08(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3 = bswap64(*(void *)(a3 + 12));
  unint64_t v4 = bswap64(*(void *)(a3 + 20));
  unint64_t v5 = bswap64(*(void *)(a3 + 28));
  unint64_t v6 = v3 + ((v5 - v3) >> 1);
  uint64_t v7 = v6 - v4;
  if (!a2) {
    uint64_t v7 = v4 - v6;
  }
  int v8 = *(_DWORD *)(a1 + 144);
  int v9 = v8 + 1;
  *(_DWORD *)(a1 + 144) = v8 + 1;
  if (v8 == -1) {
    return;
  }
  char v11 = a2;
  double v13 = (double)v7;
  if (!a2) {
    unint64_t v6 = v4;
  }
  double v14 = *(double *)(a1 + 152);
  double v15 = *(double *)(a1 + 160);
  if (v8 < 5)
  {
    if (!v8)
    {
      double v14 = 0.0;
      double v15 = (double)v7;
    }
    double v26 = 0.7;
    if (v8)
    {
      double v27 = 0.9;
    }
    else
    {
      double v26 = 0.0;
      double v27 = 0.0;
    }
    double v28 = 0.1;
    if (v8)
    {
      int v29 = 0;
    }
    else
    {
      double v28 = 0.0;
      int v29 = -1;
    }
    double v25 = -1.0;
    goto LABEL_30;
  }
  if (v9 >= 0xA) {
    uint64_t v16 = 10;
  }
  else {
    uint64_t v16 = v9;
  }
  uint64_t v17 = (double *)(a1 + 176);
  double v18 = 0.0;
  uint64_t v19 = v16;
  unint64_t v20 = (double *)(a1 + 176);
  do
  {
    double v21 = *v20++;
    double v18 = v21 + v18;
    --v19;
  }
  while (v19);
  double v22 = v18 * 0.1;
  double v23 = 0.0;
  do
  {
    double v24 = *v17++;
    double v23 = v23 + (v24 - v22) * (v24 - v22);
    --v16;
  }
  while (v16);
  double v25 = sqrt(v23 * 0.1);
  if (v25 <= 30.0)
  {
    int v29 = 1;
    double v28 = 0.8;
    double v27 = 0.97;
    double v26 = 0.9;
  }
  else
  {
    double v26 = dbl_1B180[v25 > 300.0];
    double v27 = 0.9;
    if (v25 <= 300.0) {
      double v27 = 0.95;
    }
    double v28 = 0.15;
    if (v25 <= 300.0)
    {
      int v29 = 2;
    }
    else
    {
      double v28 = 0.04;
      int v29 = 3;
    }
  }
  if (v8 < 12) {
    double v27 = 0.5;
  }
  double v31 = fmax(v25 * 3.0, 100.0);
  if (v13 - v15 < v14 - v31)
  {
    double v30 = v14 - v31 + v15;
    goto LABEL_38;
  }
  double v32 = v31 + v14;
  if (v13 - v15 <= v32)
  {
LABEL_30:
    double v30 = (double)v7;
    goto LABEL_38;
  }
  double v30 = v32 + v15;
LABEL_38:
  double v33 = v30 + v14 * v28 + (v15 - v30) * v26;
  double v34 = v30 - v33 + (v14 - (v30 - v33)) * v27;
  *(void *)(a1 + 168) = (uint64_t)v33;
  *(double *)(a1 + 8 * (v9 % 10) + 176) = v30 - v33;
  *(double *)(a1 + 152) = v34;
  *(double *)(a1 + 160) = v33;
  if (!a2) {
    unint64_t v4 = v5;
  }
  *(void *)(a1 + 256) = v4;
  unsigned int v35 = *(FILE **)(a1 + 280);
  if (v35)
  {
    fprintf(v35, "%d\t%.f\t%.f\t%.f\t%.1f\t%.1f\t%.1f\t%d", v9, (double)v6, v13, v33, v34, v30 - v33, v25, v29);
    fflush(*(FILE **)(a1 + 280));
    int v9 = *(_DWORD *)(a1 + 144);
  }
  if (v9 > 4 || *(unsigned char *)(a3 + 8) != 2 || (v11 & 1) != 0)
  {
    sub_C2FC(a1);
    int v36 = *(_DWORD *)(a1 + 28);
    if (v36 != 1)
    {
      if (v36 || !*(_WORD *)(a1 + 66) || !*(_WORD *)(a1 + 94)) {
        return;
      }
      *(_DWORD *)(a1 + 28) = 1;
    }
    if (*(int *)(a1 + 144) >= 5) {
      *(_DWORD *)(a1 + 28) = 2;
    }
  }
  else
  {
    sub_C228(a1);
  }
}

void sub_C228(uint64_t a1)
{
  long long v6 = 0uLL;
  int v8 = 0;
  uint64_t v7 = 0;
  uint64_t v2 = *(void *)(a1 + 16);
  unsigned int v3 = bswap32(*(_DWORD *)(v2 + 392));
  v5[0] = 1262747647;
  v5[1] = v3;
  *(void *)((char *)&v6 + 4) = bswap64((unint64_t)((double)(uint64_t)(mach_absolute_time()
                                                                            - *(void *)(v2 + 400))
                                                          * 0.000416666667
                                                          + 0.5));
  *(CFAbsoluteTime *)(a1 + 272) = CFAbsoluteTimeGetCurrent();
  uint64_t v4 = *(void *)(a1 + 16);
  v9[0] = *(sockaddr *)(a1 + 92);
  *(sockaddr *)&v9[0].sa_data[10] = *(sockaddr *)(a1 + 104);
  if ((sendto(*(_DWORD *)(v4 + 40 * (v9[0].sa_family == 30) + 216), v5, 0x24uLL, 0, v9, v9[0].sa_len) & 0x80000000) != 0) {
    __error();
  }
  sub_C2FC(a1);
}

void sub_C2FC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  if (*(_DWORD *)(a1 + 24))
  {
    if (*(int *)(a1 + 144) >= 5) {
      double v3 = 10.0;
    }
    else {
      double v3 = 1.5;
    }
    double Current = *(double *)(a1 + 272);
  }
  else
  {
    double v3 = 60.0;
    double Current = CFAbsoluteTimeGetCurrent();
  }
  double v5 = fmax(*(double *)(a1 + 264), Current) + v3;
  CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v2 + 16), v5);
  while (CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v2 + 16)) > v5 + 0.0001)
    CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v2 + 16), v5);
}

uint64_t sub_C3A8(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 28);
  if (v1 == 1) {
    goto LABEL_6;
  }
  if (!v1 && *(_WORD *)(result + 66) && *(_WORD *)(result + 94))
  {
    *(_DWORD *)(result + 28) = 1;
LABEL_6:
    if (*(int *)(result + 144) >= 5) {
      *(_DWORD *)(result + 28) = 2;
    }
  }
  return result;
}

void sub_C3E8(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = *(double *)(a1 + 264);
  if (Current > v3 + 59.0)
  {
    uint64_t v13 = *(void *)(a1 + 16) + 304;
    char v14 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 16))(v13);
    CFStringGetCString(*(CFStringRef *)(a1 + 48), buffer, 64, 0x8000100u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 16) + 32;
      *(_DWORD *)int buf = 136315906;
      *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1626;
      __int16 v16 = 2080;
      uint64_t v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = buffer;
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: connection to %s timed out\n", buf, 0x26u);
    }
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, (CFStringRef)qword_200B0, *(void *)(a1 + 48));
    *(void *)int buf = off_1CAE8;
    *(void *)&buf[8] = v5;
    (*(void (**)(void))(**(void **)(a1 + 16) + 56))(*(void *)(a1 + 16));
    long long v6 = *(std::__shared_weak_count **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    uint64_t v11 = *(void *)a1;
    if (v6)
    {
      int v8 = std::__shared_weak_count::lock(v6);
      uint64_t v12 = v8;
      if (v8)
      {
        int v9 = v8;
        sub_8574(v7, &v11, 1, 1);
        if (atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          *(void *)int buf = off_1CA28;
          uint64_t v10 = *(const void **)&buf[8];
          if (!*(void *)&buf[8])
          {
LABEL_19:
            if (v14) {
              (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
            }
            return;
          }
        }
        else
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
          *(void *)int buf = off_1CA28;
          uint64_t v10 = *(const void **)&buf[8];
          if (!*(void *)&buf[8]) {
            goto LABEL_19;
          }
        }
        CFRelease(v10);
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    sub_E584();
  }
  if (*(_DWORD *)(a1 + 24) && Current > dbl_1B190[*(_DWORD *)(a1 + 144) < 5] + fmax(v3, *(double *)(a1 + 272)))
  {
    sub_C228(a1);
  }
  else
  {
    sub_C2FC(a1);
  }
}

void sub_C74C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *sub_C798(void *a1)
{
  *a1 = off_1CA28;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_C7E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 1632);
  double v3 = *(uint64_t **)(a1 + 1640);
  if (v2 != v3)
  {
    unsigned int v6 = bswap32(*(_DWORD *)(a2 + 4));
    while (1)
    {
      uint64_t v7 = *v2;
      if (*(_DWORD *)(*v2 + 120) == v6) {
        break;
      }
      v2 += 2;
      if (v2 == v3) {
        return;
      }
    }
    int v8 = (std::__shared_weak_count *)v2[1];
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unsigned int v9 = *(char *)(a2 + 8);
    *(CFAbsoluteTime *)(v7 + 264) = CFAbsoluteTimeGetCurrent();
    if (v9 >= 2)
    {
      if (v9 == 2) {
        sub_BF08(v7, 0, a2);
      }
    }
    else
    {
      *(unsigned char *)(a2 + 8) = v9 + 1;
      *(_DWORD *)(a2 + 4) = bswap32(*(_DWORD *)(a1 + 392));
      *(void *)(a2 + 8 * v9 + 20) = bswap64((unint64_t)((double)(uint64_t)(mach_absolute_time()
                                                                                   - *(void *)(a1 + 400))
                                                                 * 0.000416666667
                                                                 + 0.5));
      if (v9 == 1) {
        sub_BF08(v7, 1, a2);
      }
      v10[0] = *(sockaddr *)(v7 + 92);
      *(sockaddr *)&v10[0].sa_data[10] = *(sockaddr *)(v7 + 104);
      if ((sendto(*(_DWORD *)(a1 + 40 * (v10[0].sa_family == 30) + 216), (const void *)a2, 0x24uLL, 0, v10, v10[0].sa_len) & 0x80000000) != 0)__error(); {
    }
      }
    if (v8)
    {
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_C99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

ssize_t sub_C9B0(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 40 * (a2 == 30);
  socklen_t v6 = 28;
  ssize_t result = recvfrom(*(_DWORD *)(v3 + 136), v7, 0x5C1uLL, 0, &v5, &v6);
  if ((int)result >= 1)
  {
    do
    {
      if (result >= 4) {
        sub_A0A8(a1, 1, (uint64_t)v7, result, (uint64_t)&v5);
      }
      socklen_t v6 = 28;
      ssize_t result = recvfrom(*(_DWORD *)(v3 + 136), v7, 0x5C1uLL, 0, &v5, &v6);
    }
    while ((int)result > 0);
  }
  return result;
}

std::runtime_error *sub_CAB0(std::runtime_error *a1, const char *a2)
{
  ssize_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&off_1CA48;
  return result;
}

void *sub_CAE8(void *a1, CFStringRef format, uint64_t a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, format, a3);
  *a1 = off_1CAE8;
  a1[1] = v4;
  return a1;
}

void sub_CB4C(void *a1, int a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1[209];
  if (v3 != a1 + 208)
  {
    while (*((_DWORD *)v3 + 5) != a2 || v3[3] != a3)
    {
      uint64_t v3 = (void *)v3[1];
      if (v3 == a1 + 208) {
        return;
      }
    }
    free((void *)v3[4]);
    uint64_t v5 = *v3;
    *(void *)(v5 + 8) = v3[1];
    *(void *)v3[1] = v5;
    --a1[210];
    operator delete(v3);
  }
}

BOOL sub_CBE8(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 4);
  if (v2 != -46770) {
    return v2 == -46770;
  }
  sub_5258(a2 + 28, v19, 0x100uLL);
  snprintf(__str, 0x100uLL, "%s:%d", v19, bswap32(*(unsigned __int16 *)(a2 + 30)) >> 16);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 136315906;
    *(void *)&uint8_t buf[4] = "MIDIRTPSession.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1926;
    __int16 v15 = 2080;
    uint64_t v16 = a1 + 32;
    __int16 v17 = 2080;
    __int16 v18 = __str;
    _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Connection attempt to %s timed out\n", buf, 0x26u);
  }
  CFStringRef v5 = CFStringCreateWithFormat(0, 0, (CFStringRef)qword_20098, __str);
  *(void *)int buf = off_1CAE8;
  *(void *)&buf[8] = v5;
  (*(void (**)(uint64_t))(*(void *)a1 + 56))(a1);
  socklen_t v6 = *(uint64_t **)(a2 + 8);
  uint64_t v7 = (std::__shared_weak_count *)v6[1];
  uint64_t v12 = *v6;
  if (!v7)
  {
    uint64_t v13 = 0;
LABEL_13:
    sub_E584();
  }
  int v8 = std::__shared_weak_count::lock(v7);
  uint64_t v13 = v8;
  if (!v8) {
    goto LABEL_13;
  }
  unsigned int v9 = v8;
  sub_8574(a1, &v12, 1, 1);
  if (atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    *(void *)int buf = off_1CA28;
    uint64_t v10 = *(const void **)&buf[8];
    if (!*(void *)&buf[8]) {
      return v2 == -46770;
    }
    goto LABEL_10;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  *(void *)int buf = off_1CA28;
  uint64_t v10 = *(const void **)&buf[8];
  if (*(void *)&buf[8]) {
LABEL_10:
  }
    CFRelease(v10);
  return v2 == -46770;
}

void sub_CE60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_CE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_C798((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_CEB0(void *a1)
{
  uint64_t v16 = a1 + 38;
  char v17 = (*(uint64_t (**)(void))(a1[38] + 16))();
  int v2 = (char *)(a1 + 208);
  while (1)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    CFStringRef v4 = (char *)a1[209];
    if (v4 == v2) {
      break;
    }
    while (*((double *)v4 + 10) >= Current)
    {
LABEL_4:
      CFStringRef v4 = (char *)*((void *)v4 + 1);
      if (v4 == v2)
      {
        uint64_t v13 = a1[209];
        uint64_t v14 = a1[207];
        for (i = 1.0e40; (char *)v13 != v2; uint64_t v13 = *(void *)(v13 + 8))
          double i = fmin(*(double *)(v13 + 80), i);
        goto LABEL_16;
      }
    }
    int v5 = *((_DWORD *)v4 + 18);
    *((_DWORD *)v4 + 18) = v5 + 1;
    if (v5 != 12)
    {
      CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent();
      uint64_t v7 = (const sockaddr *)(v4 + 44);
      socklen_t v8 = v4[44];
      *((CFAbsoluteTime *)v4 + 10) = v6 + 1.0;
      unsigned int v9 = (const void *)*((void *)v4 + 4);
      size_t v10 = *((int *)v4 + 10);
      if (v4[16]) {
        int v11 = sendto(a1[5 * (v4[45] == 30) + 17], v9, v10, 0, v7, v8);
      }
      else {
        int v11 = sendto(a1[5 * (v4[45] == 30) + 27], v9, v10, 0, v7, v8);
      }
      if (v11 < 0) {
        __error();
      }
      goto LABEL_4;
    }
    if (!sub_CBE8((uint64_t)a1, (uint64_t)(v4 + 16)))
    {
      free(*((void **)v4 + 4));
      uint64_t v12 = *(void *)v4;
      *(void *)(v12 + 8) = *((void *)v4 + 1);
      **((void **)v4 + 1) = v12;
      --a1[210];
      operator delete(v4);
    }
  }
  uint64_t v14 = a1[207];
  double i = 1.0e40;
  do
LABEL_16:
    CFRunLoopTimerSetNextFireDate(*(CFRunLoopTimerRef *)(v14 + 16), i);
  while (CFRunLoopTimerGetNextFireDate(*(CFRunLoopTimerRef *)(v14 + 16)) > i + 0.0001);
  if (v17) {
    (*(void (**)(void *))(*v16 + 24))(v16);
  }
}

void sub_D0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_D13C(MIDIPacketList *a1)
{
  sub_DA8C(a1);

  operator delete();
}

void sub_D174(void *a1)
{
  *a1 = off_1C8F0;
  sub_150DC((uint64_t)a1);

  operator delete();
}

ssize_t sub_D1DC(uint64_t a1)
{
  return sub_C9B0(*(void *)(a1 + 32), *(_DWORD *)(a1 + 28));
}

void *sub_D1EC(void *a1)
{
  *a1 = off_1C8F0;
  sub_150DC((uint64_t)a1);
  return a1;
}

void sub_D234(void *a1)
{
  *a1 = off_1C8F0;
  sub_150DC((uint64_t)a1);

  operator delete();
}

void sub_D2A0(void *a1)
{
  *a1 = off_1C8F0;
  sub_150DC((uint64_t)a1);

  operator delete();
}

MIDIPacketList *sub_D308(uint64_t a1)
{
  return sub_95CC(*(void **)(a1 + 32), *(_DWORD *)(a1 + 28));
}

void sub_D318(uint64_t a1)
{
  sub_4740(a1);

  operator delete();
}

uint64_t sub_D350(uint64_t a1)
{
  return sub_8A10(*(void *)(a1 + 16));
}

void sub_D358(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_D358(a1, *a2);
    sub_D358(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_D3AC(MIDIPacketList *a1)
{
  sub_D62C(a1);

  operator delete();
}

uint64_t sub_D3E4(uint64_t a1, uint64_t a2)
{
  return sub_B450(*(void *)(a1 + 1072), a2);
}

uint64_t sub_D3EC(uint64_t a1)
{
  *(void *)a1 = off_1C990;
  if (*(_DWORD *)(a1 + 48)) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 == v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 32))(v2);
    return a1;
  }
  else
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    return a1;
  }
}

void sub_D4CC(uint64_t a1)
{
  *(void *)a1 = off_1C990;
  if (!*(_DWORD *)(a1 + 48))
  {
    uint64_t v1 = a1 + 8;
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2 == v1)
    {
      (*(void (**)(uint64_t))(*(void *)v1 + 32))(v1);
    }
    else if (v2)
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
    }
    operator delete();
  }
  __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
}

uint64_t sub_D5C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    sub_6380();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void sub_D614()
{
}

MIDIPacketList *sub_D62C(MIDIPacketList *pktlist)
{
  *(void *)&pktlist->numPackets = &off_1C968;
  uint64_t v2 = (MIDIPacketList *)&pktlist->packet[0].data[34];
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    sub_B450(*(void *)&pktlist[3].packet[0].data[242], (uint64_t)v2);
  }
  *(void *)&pktlist->packet[0].data[26] = MIDIPacketListInit(v2);
  *(void *)&pktlist->numPackets = off_1C990;
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  uint64_t v3 = *(MIDIPacketList **)&pktlist->packet[0].data[18];
  if (v3 == (MIDIPacketList *)((char *)&pktlist->packet[0].timeStamp + 4))
  {
    (*(void (**)(char *))(*(MIDITimeStamp *)((char *)&pktlist->packet[0].timeStamp + 4) + 32))((char *)&pktlist->packet[0].timeStamp + 4);
    return pktlist;
  }
  else
  {
    if (v3) {
      (*(void (**)(MIDIPacketList *))(*(void *)&v3->numPackets + 40))(v3);
    }
    return pktlist;
  }
}

uint64_t sub_D750(uint64_t a1, int a2)
{
  *(void *)a1 = off_1C9F0;
  uint64_t v3 = sub_6408(a1, (uint64_t)sub_45C4, a1, a2, 0, 0, 0);
  *(void *)(v3 + 128) = "SSThread";
  *(unsigned char *)(v3 + 136) = 0;
  *(void *)uint64_t v3 = &off_1C9B8;
  *(void *)(v3 + 144) = v3;
  sub_6A10(v3 + 152, (uint64_t)"SSThreadLock");
  *(void *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 272) = 0;
  *(void *)(a1 + 256) = 0;
  *(void *)(a1 + 264) = 0;
  context.version = 0;
  context.info = (void *)a1;
  memset(&context.retain, 0, 24);
  *(void *)(a1 + 280) = CFRunLoopTimerCreate(0, 0.0, 1.0e11, 0, 0, (CFRunLoopTimerCallBack)sub_D8C8, &context);
  double Current = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(Current, *(CFRunLoopTimerRef *)(a1 + 280), kCFRunLoopDefaultMode);
  pipe((int *)(a1 + 240));
  sub_66C4(a1);
  return a1;
}

void sub_D884(_Unwind_Exception *a1)
{
  nullsub_2(v1);
  _Unwind_Resume(a1);
}

void sub_D898(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  CFAbsoluteTime v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 256) = v6;
    operator delete(v6);
  }
  sub_6A14(v2);
  nullsub_2(v1);
  _Unwind_Resume(a1);
}

void sub_D8C8(uint64_t a1, uint64_t a2)
{
}

void sub_D8D4(uint64_t a1)
{
  nullsub_2(a1);

  operator delete();
}

uint64_t sub_D90C(uint64_t result)
{
  *(unsigned char *)(result + 136) = 1;
  return result;
}

void sub_D918(uint64_t a1)
{
}

_OWORD *sub_D920(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = ((uint64_t)v4 - *(void *)a1) >> 4;
  unint64_t v6 = v5 + 1;
  if ((unint64_t)(v5 + 1) >> 60) {
    sub_D614();
  }
  uint64_t v7 = *(void *)(a1 + 16) - (void)v3;
  if (v7 >> 3 > v6) {
    unint64_t v6 = v7 >> 3;
  }
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v6 = 0xFFFFFFFFFFFFFFFLL;
  }
  if (v6 >> 60) {
    sub_634C();
  }
  uint64_t v9 = 16 * v6;
  size_t v10 = (char *)operator new(16 * v6);
  int v11 = &v10[16 * v5];
  long long v12 = *a2;
  *(_OWORD *)int v11 = *a2;
  if (*((void *)&v12 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
    uint64_t v3 = *(void **)a1;
    uint64_t v4 = *(void **)(a1 + 8);
  }
  uint64_t v13 = &v10[v9];
  uint64_t v14 = v11 + 16;
  if (v4 == v3)
  {
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v14;
    *(void *)(a1 + 16) = v13;
    if (!v3) {
      return v14;
    }
    goto LABEL_19;
  }
  do
  {
    long long v15 = *((_OWORD *)v4 - 1);
    v4 -= 2;
    *((_OWORD *)v11 - 1) = v15;
    v11 -= 16;
    *uint64_t v4 = 0;
    v4[1] = 0;
  }
  while (v4 != v3);
  uint64_t v16 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)a1 = v11;
  *(void *)(a1 + 8) = v14;
  *(void *)(a1 + 16) = v13;
  if (v3 != v16)
  {
    do
    {
      char v17 = (std::__shared_weak_count *)*(v3 - 1);
      if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
      v3 -= 2;
    }
    while (v3 != v16);
    uint64_t v3 = v16;
  }
  if (v3) {
LABEL_19:
  }
    operator delete(v3);
  return v14;
}

MIDIPacketList *sub_DA8C(MIDIPacketList *pktlist)
{
  *(void *)&pktlist->numPackets = &off_1C8A0;
  uint64_t v2 = (MIDIPacketList *)&pktlist->packet[0].data[34];
  if (*(_DWORD *)&pktlist->packet[0].data[34])
  {
    pktlist[3].packet[0].data[245] = 1;
    if (pktlist[3].packet[0].data[244]) {
      sub_6B9C(*(void *)&pktlist[3].packet[0].data[250] + 304);
    }
    (*(void (**)(void, MIDIPacketList *))(**(void **)&pktlist[3].packet[0].data[250] + 16))(*(void *)&pktlist[3].packet[0].data[250], v2);
    if (pktlist[3].packet[0].data[244]) {
      sub_6AC4(*(void *)&pktlist[3].packet[0].data[250] + 304);
    }
  }
  *(void *)&pktlist->packet[0].data[26] = MIDIPacketListInit(v2);
  *(void *)&pktlist->numPackets = off_1C990;
  if (*(_DWORD *)&pktlist->packet[0].data[34]) {
    __assert_rtn("~MIDIPacketEmitter", "MIDIPacketEmitter.h", 33, "TheList()->numPackets == 0");
  }
  uint64_t v3 = *(MIDIPacketList **)&pktlist->packet[0].data[18];
  if (v3 == (MIDIPacketList *)((char *)&pktlist->packet[0].timeStamp + 4))
  {
    (*(void (**)(char *))(*(MIDITimeStamp *)((char *)&pktlist->packet[0].timeStamp + 4) + 32))((char *)&pktlist->packet[0].timeStamp + 4);
    return pktlist;
  }
  else
  {
    if (v3) {
      (*(void (**)(MIDIPacketList *))(*(void *)&v3->numPackets + 40))(v3);
    }
    return pktlist;
  }
}

void *sub_DC00(void *a1)
{
  *a1 = off_1CA28;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_DC50(void *a1)
{
  *a1 = off_1CA28;
  uint64_t v1 = (const void *)a1[1];
  if (v1) {
    CFRelease(v1);
  }

  operator delete();
}

void sub_DCC0(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);

  operator delete();
}

void sub_DCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (std::recursive_mutex *)(a2 + 24);
  if (std::recursive_mutex::try_lock((std::recursive_mutex *)(a2 + 24)))
  {
    uint64_t v4 = *(__CFRunLoopTimer **)(a2 + 16);
    if (v4 && CFRunLoopTimerIsValid(v4)) {
      (*(void (**)(void))(a2 + 8))(*(void *)a2);
    }
    std::recursive_mutex::unlock(v3);
  }
}

void sub_DD60(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_DD74(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v5 = operator new(0x1B8uLL);
  v5[1] = 0;
  _DWORD v5[2] = 0;
  void *v5 = off_1CA70;
  sub_DF48((uint64_t)(v5 + 3), a2, *a3);
}

void sub_DEB0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_DEC8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1CA70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_DEE8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1CA70;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_DF3C(uint64_t a1)
{
  return sub_E3EC(a1 + 24);
}

void sub_DF48(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 56) = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(void *)(a1 + 168) = 0;
  *(unsigned char *)(a1 + 296) = 0;
  *(void *)(a1 + 300) = 0;
  *(void *)(a1 + 320) = 0;
  *(void *)(a1 + 328) = 0;
  *(void *)(a1 + 312) = a1 + 320;
  *(_WORD *)(a1 + 336) = 0;
  *(void *)(a1 + 340) = 0;
  *(void *)(a1 + 352) = 0;
  *(void *)(a1 + 360) = 0;
  *(unsigned char *)(a1 + 368) = 7;
  *(_OWORD *)(a1 + 372) = 0u;
  *(_OWORD *)(a1 + 388) = 0u;
  if (a3)
  {
    do
    {
      int v4 = random();
      *(_DWORD *)(a1 + 24) = v4;
    }
    while (!v4);
  }
  else
  {
    *(_DWORD *)(a1 + 24) = 0;
  }
  *(_WORD *)(a1 + 66) = 0;
  *(_WORD *)(a1 + 94) = 0;
  sub_E0A0(a1);
}

void sub_E068(_Unwind_Exception *a1)
{
  sub_D358(v4, *(void **)(v1 + 320));
  sub_7598(v3);
  sub_7598(v2);
  unint64_t v6 = *(std::__shared_weak_count **)(v1 + 8);
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  _Unwind_Resume(a1);
}

void sub_E0A0(uint64_t a1)
{
  CFRunLoopGetCurrent();
  *(_DWORD *)(a1 + 144) = -1;
  *(void *)(a1 + 280) = 0;
  *(void *)(a1 + 256) = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *(CFAbsoluteTime *)(a1 + 264) = Current;
  *(CFAbsoluteTime *)(a1 + 272) = Current;
  operator new();
}

void sub_E2B0()
{
}

ssize_t sub_E2F4(ssize_t result)
{
  *(unsigned char *)(result + 296) = 0;
  unsigned int v1 = *(_DWORD *)(result + 300);
  if (v1)
  {
    ssize_t v2 = result;
    int v3 = *(_DWORD *)(result + 304);
    if (v3) {
      BOOL v4 = v3 == v1;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4)
    {
      uint64_t v5 = *(void *)(result + 16);
      unsigned int v6 = bswap32(*(_DWORD *)(v5 + 392));
      v7[0] = 1397948415;
      v7[1] = v6;
      __int16 v8 = bswap32(v1) >> 16;
      *(_OWORD *)uint64_t v9 = *(_OWORD *)(result + 64);
      *(_OWORD *)&v9[12] = *(_OWORD *)(result + 76);
      sub_5258((uint64_t)v9, v10, 0x100uLL);
      ssize_t result = sendto(*(_DWORD *)(v5 + 40 * (v9[1] == 30) + 136), v7, 0xCuLL, 0, (const sockaddr *)v9, v9[0]);
      if ((result & 0x80000000) != 0) {
        ssize_t result = (ssize_t)__error();
      }
    }
    *(_DWORD *)(v2 + 304) = v1;
  }
  return result;
}

uint64_t sub_E3EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 288);
  std::recursive_mutex::lock((std::recursive_mutex *)(v2 + 24));
  CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(v2 + 16));
  std::recursive_mutex::unlock((std::recursive_mutex *)(v2 + 24));
  uint64_t v3 = *(void *)(a1 + 136);
  std::recursive_mutex::lock((std::recursive_mutex *)(v3 + 24));
  CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(v3 + 16));
  std::recursive_mutex::unlock((std::recursive_mutex *)(v3 + 24));
  BOOL v4 = *(FILE **)(a1 + 280);
  if (v4) {
    fclose(v4);
  }
  sub_D358(a1 + 312, *(void **)(a1 + 320));
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = *(const void **)(a1 + 48);
    if (v5) {
      CFRelease(v5);
    }
  }
  if (*(unsigned char *)(a1 + 40))
  {
    unsigned int v6 = *(const void **)(a1 + 32);
    if (v6) {
      CFRelease(v6);
    }
  }
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 8);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  return a1;
}

void sub_E4AC(void *a1)
{
  std::recursive_mutex::unlock(v1);
  sub_4834(a1);
}

void sub_E4C0(void *a1)
{
  std::recursive_mutex::unlock(v1);
  sub_4834(a1);
}

void sub_E4DC(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

void sub_E514(void *a1)
{
  *a1 = off_1CA28;
  unsigned int v1 = (const void *)a1[1];
  if (v1) {
    CFRelease(v1);
  }

  operator delete();
}

void sub_E584()
{
  exception = __cxa_allocate_exception(8uLL);
}

void sub_E5D0(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v5 = operator new(0x1B8uLL);
  v5[1] = 0;
  _DWORD v5[2] = 0;
  void *v5 = off_1CA70;
  sub_DF48((uint64_t)(v5 + 3), a2, *a3);
}

void sub_E70C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void sub_E724(uint64_t a1, CFUUIDRef factoryID)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)a1 = off_1CB20;
  *(void *)(a1 + 8) = &unk_20008;
  *(void *)(a1 + 16) = factoryID;
  CFPlugInAddInstanceForFactory(factoryID);
  *(void *)(a1 + 24) = 1;
  uint64_t v3 = off_1CBD8;
  uint64_t v4 = a1;
  operator new();
}

void sub_EA5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  sub_4834(exception_object);
}

void *sub_EB7C(void *a1)
{
  *a1 = off_1CB20;
  CFUUIDRef v2 = (const __CFUUID *)a1[2];
  if (v2) {
    CFPlugInRemoveInstanceForFactory(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)a1[10];
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[7];
  if (!v4 || atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_EC70(void *a1)
{
  sub_EB7C(a1);

  operator delete();
}

uint64_t sub_ECA8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1[6];
  if (!v5) {
    return 7;
  }
  a1[4] = a3;
  a1[5] = a4;
  (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
  return 0;
}

uint64_t sub_ED00(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 72);
  if (!v4) {
    return 7;
  }
  *(_DWORD *)(a1 + 64) = a2;
  (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 16))(v4, a3);
  return 0;
}

uint64_t sub_ED5C()
{
  return 0;
}

uint64_t sub_ED64()
{
  return 0;
}

uint64_t sub_ED6C()
{
  return 0;
}

uint64_t sub_ED74()
{
  return 0;
}

uint64_t sub_ED7C()
{
  return 0;
}

uint64_t sub_ED84()
{
  return 0;
}

uint64_t sub_ED8C()
{
  return 0;
}

uint64_t sub_ED94()
{
  return 0;
}

uint64_t sub_ED9C(_DWORD *a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Fu, 0xD9u, 0x4Du, 0xFu, 0x8Cu, 0x2Au, 0x48u, 0x2Au, 0x8Au, 0xD8u, 0x7Du, 0x9Eu, 0xA3u, 0x81u, 0xC9u, 0xC1u);
  if (CFEqual(v5, v6))
  {
    (*(void (**)(_DWORD *))(*(void *)a1 + 16))(a1);
    *a3 = a1;
    CFRelease(v5);
    uint64_t result = 0;
    a1[5] = 3;
  }
  else
  {
    CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x43u, 0xC9u, 0x8Cu, 0x3Cu, 0x30u, 0x6Cu, 0x11u, 0xD5u, 0xAFu, 0x73u, 0, 0x30u, 0x65u, 0xA8u, 0x30u, 0x1Eu);
    if (CFEqual(v5, v8))
    {
      (*(void (**)(_DWORD *))(*(void *)a1 + 16))(a1);
      *a3 = a1;
      CFRelease(v5);
      uint64_t result = 0;
      a1[5] = 2;
    }
    else
    {
      CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
      if (CFEqual(v5, v9))
      {
        (*(void (**)(_DWORD *))(*(void *)a1 + 16))(a1);
        *a3 = a1;
        CFRelease(v5);
        return 0;
      }
      else
      {
        *a3 = 0;
        CFRelease(v5);
        return 2147483652;
      }
    }
  }
  return result;
}

uint64_t sub_EF88(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_EF9C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  uint64_t v2 = (v1 - 1);
  *(_DWORD *)(a1 + 16) = v2;
  if (v1 != 1) {
    return (v1 - 1);
  }
  (*(void (**)(void))(*(void *)(a1 - 8) + 8))();
  return v2;
}

uint64_t sub_F000(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 16))();
}

uint64_t sub_F024(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 24))();
}

uint64_t sub_F048(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 32))();
}

uint64_t sub_F06C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 40))();
}

uint64_t sub_F090(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 48))();
}

uint64_t sub_F0B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 56))();
}

uint64_t sub_F0D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 64))();
}

uint64_t sub_F0FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 72))();
}

uint64_t sub_F120(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 80))();
}

uint64_t sub_F144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 - 8) + 88))();
}

void *sub_F168(void *a1)
{
  *a1 = off_1CB90;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);
  return a1;
}

void sub_F1BC(void *a1)
{
  *a1 = off_1CB90;
  (*(void (**)(void *))(a1[1] + 24))(a1 + 2);

  operator delete();
}

uint64_t sub_F230(uint64_t *a1, _DWORD *a2)
{
  uint64_t v8 = a1[1];
  (*(void (**)(unsigned char *, uint64_t *))(v8 + 8))(v9, a1 + 2);
  int v11 = 0;
  size_t v10 = v12;
  if (*a2 == 2)
  {
    v6[0] = a1;
    v6[1] = &v8;
    uint64_t v7 = v6;
    sub_FEA4((uint64_t)a2, &v7);
  }
  else
  {
    if (*a2 != 1)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventConversion.h: 657");
      exception->__vftable = (std::runtime_error_vtbl *)&off_1CA48;
    }
    uint64_t v7 = (uint64_t **)&v8;
    v6[0] = (uint64_t *)&v7;
    sub_F520((uint64_t)a2, v6);
  }
  if (v11)
  {
    v6[0] = (uint64_t *)&v11;
    (*(void (**)(unsigned char *, uint64_t **))v8)(v9, v6);
  }
  int v11 = 0;
  size_t v10 = v12;
  return (*(uint64_t (**)(unsigned char *))(v8 + 24))(v9);
}

void sub_F3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_F4AC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_F3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  __cxa_free_exception(v12);
  sub_F4AC((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_F3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_F4AC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_F3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  sub_F4AC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_F400(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_F420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return (**(uint64_t (***)(uint64_t, uint64_t *))(a1 + 8))(a1 + 16, &v3);
}

void sub_F454()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_1C770;
}

uint64_t sub_F4AC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64))
  {
    uint64_t v3 = a1 + 64;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v3);
  }
  *(_DWORD *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = a1 + 68;
  (*(void (**)(uint64_t))(*(void *)a1 + 24))(a1 + 8);
  return a1;
}

uint64_t sub_F520(uint64_t result, uint64_t **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      unint64_t v6 = *(unsigned int *)(v5 + 8);
      uint64_t v19 = v5 + 12;
      unint64_t v20 = v6;
      uint64_t v21 = *(void *)v5;
      unint64_t v22 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v16 = 0;
      uint64_t result = sub_F700(&v19, &v18, &v16);
      if (result)
      {
        uint64_t v7 = *a2;
        uint64_t v8 = v18;
        while (1)
        {
          uint64_t v24 = v8;
          v23[0] = *v7;
          v23[1] = (uint64_t)&v24;
          uint64_t result = (uint64_t)sub_F824((unsigned __int8 *)&v16, v23);
          uint64_t v17 = 0;
          uint64_t v18 = 0;
          uint64_t v16 = 0;
          if (v22 >= v20) {
            break;
          }
          int v11 = (unsigned int *)(v19 + 4 * v22);
          unint64_t v10 = *v11;
          unint64_t v13 = v22 + byte_1B1E8[v10 >> 28];
          if (v13 > v20) {
            break;
          }
          uint64_t v8 = v21;
          uint64_t v18 = v21;
          CFUUIDRef v9 = &v16;
          switch((uint64_t)(4 * v13 - 4 * v22) >> 2)
          {
            case 0:
              goto LABEL_9;
            case 1:
              goto LABEL_8;
            case 2:
              goto LABEL_7;
            case 3:
              goto LABEL_6;
            case 4:
              LODWORD(v16) = v10;
              unsigned int v14 = v11[1];
              ++v11;
              LODWORD(v10) = v14;
              CFUUIDRef v9 = (uint64_t *)((char *)&v16 + 4);
LABEL_6:
              *(_DWORD *)CFUUIDRef v9 = v10;
              CFUUIDRef v9 = (uint64_t *)((char *)v9 + 4);
              unsigned int v12 = v11[1];
              ++v11;
              LODWORD(v10) = v12;
LABEL_7:
              *(_DWORD *)CFUUIDRef v9 = v10;
              CFUUIDRef v9 = (uint64_t *)((char *)v9 + 4);
              LODWORD(v10) = v11[1];
LABEL_8:
              *(_DWORD *)CFUUIDRef v9 = v10;
LABEL_9:
              unint64_t v22 = v13;
              uint64_t v7 = *a2;
              break;
            default:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              sub_CAB0(exception, "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventList.h: 74");
          }
        }
      }
      v5 += 4 * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }
    while (v4 < *(_DWORD *)(v3 + 4));
  }
  return result;
}

void sub_F6D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_F700(uint64_t *a1, void *a2, _DWORD *a3)
{
  unint64_t v3 = a1[1];
  unint64_t v4 = a1[3];
  if (v4 >= v3) {
    return 0;
  }
  uint64_t v5 = *a1;
  unint64_t v6 = (unsigned int *)(*a1 + 4 * v4);
  unint64_t v7 = *v6;
  unint64_t v8 = v4 + byte_1B1E8[v7 >> 28];
  if (v8 > v3) {
    return 0;
  }
  *a2 = a1[2];
  switch((uint64_t)(v5 + 4 * v8 - (void)v6) >> 2)
  {
    case 0:
      goto LABEL_9;
    case 1:
      goto LABEL_8;
    case 2:
      goto LABEL_7;
    case 3:
      goto LABEL_6;
    case 4:
      *a3++ = v7;
      unsigned int v10 = v6[1];
      ++v6;
      LODWORD(v7) = v10;
LABEL_6:
      *a3++ = v7;
      unsigned int v11 = v6[1];
      ++v6;
      LODWORD(v7) = v11;
LABEL_7:
      *a3++ = v7;
      LODWORD(v7) = v6[1];
LABEL_8:
      *a3 = v7;
LABEL_9:
      a1[3] = v8;
      uint64_t result = 1;
      break;
    default:
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_CAB0(exception, "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventList.h: 74");
  }
  return result;
}

void sub_F7FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_F824(unsigned __int8 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    if (v13 > 6 || BYTE2(v3) > 0x3Fu) {
      return result;
    }
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v33[0] = bswap32(v3);
    v33[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1;
      if (!v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v26 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v27 = v7 + 1088;
        int v28 = *(_DWORD *)(v7 + 64);
        if (v28)
        {
          uint64_t v29 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v26 && *(unsigned __int8 *)(v9 + v29 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v29 + 10 <= v27) {
              goto LABEL_53;
            }
            goto LABEL_51;
          }
          unint64_t v9 = (v9 + v29 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v27)
        {
          LODWORD(v29) = 0;
          *(_DWORD *)(v7 + 64) = v28 + 1;
          *(void *)unint64_t v9 = v26;
          *(_WORD *)(v9 + 8) = 0;
LABEL_53:
          uint64_t result = (unsigned __int8 *)(v9 + v29 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_62;
            case 2uLL:
              goto LABEL_61;
            case 3uLL:
              goto LABEL_60;
            case 4uLL:
LABEL_59:
              p_src = (unsigned __int8 *)&v35;
              *result++ = __src;
LABEL_60:
              unsigned __int8 v31 = *p_src++;
              *result++ = v31;
LABEL_61:
              unsigned __int8 v32 = *p_src++;
              *result++ = v32;
LABEL_62:
              std::runtime_error *result = *p_src;
              break;
            default:
LABEL_66:
              uint64_t result = (unsigned __int8 *)memmove(result, &__src, v6);
              break;
          }
          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_64;
        }
LABEL_51:
        uint64_t result = (unsigned __int8 *)sub_FCA4(v7, v26, (char *)&__src, v6);
        unint64_t v9 = (unint64_t)result;
LABEL_64:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }
    memcpy(&__src + v6, (char *)v33 + 2, v13);
    v6 += (v13 - 1) + 1;
    goto LABEL_39;
  }
  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v35 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2;
    }
    else {
      size_t v17 = 3;
    }
    if (v16 != 12582912) {
      char v36 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    unint64_t v20 = *(void *)(*a2 + 56);
    unint64_t v21 = *a2 + 1088;
    int v22 = *(_DWORD *)(*a2 + 64);
    if (v22)
    {
      uint64_t v23 = *(unsigned __int16 *)(v20 + 8);
      if (*(void *)v20 == v19 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v20 + v23 + 9) != 247)
      {
        if (v20 + v17 + v23 + 10 <= v21) {
          goto LABEL_35;
        }
        goto LABEL_33;
      }
      unint64_t v20 = (v20 + v23 + 13) & 0xFFFFFFFFFFFFFFFCLL;
    }
    if (v20 + v17 + 10 <= v21)
    {
      LODWORD(v23) = 0;
      *(_DWORD *)(v18 + 64) = v22 + 1;
      *(void *)unint64_t v20 = v19;
      *(_WORD *)(v20 + 8) = 0;
LABEL_35:
      uint64_t v24 = (unsigned __int8 *)(v20 + v23 + 10);
      if (v16 == 12582912)
      {
        double v25 = &__src;
      }
      else
      {
        double v25 = (unsigned __int8 *)&v35;
        unsigned __int8 *v24 = __src;
        uint64_t v24 = (unsigned __int8 *)(v20 + v23 + 11);
      }
      unsigned __int8 *v24 = *v25;
      v24[1] = v25[1];
      *(_WORD *)(v20 + 8) += v17;
      *(void *)(v18 + 56) = v20;
      return result;
    }
LABEL_33:
    uint64_t result = (unsigned __int8 *)sub_FCA4(*a2, v19, (char *)&__src, v17);
    *(void *)(v18 + 56) = result;
    return result;
  }
  if (v4 == 1)
  {
    unsigned int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_20078[v5];
      if (byte_20078[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if (v6 != 1)
        {
          char v35 = BYTE1(v3) & 0x7F;
          if (v6 >= 3) {
            char v36 = v3 & 0x7F;
          }
        }
        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v9 + v12 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_58;
            }
LABEL_56:
            uint64_t result = (unsigned __int8 *)sub_FCA4(v7, v8, (char *)&__src, v6);
            *(void *)(v7 + 56) = result;
            return result;
          }
          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_58:
          uint64_t result = (unsigned __int8 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_62;
            case 2:
              goto LABEL_61;
            case 3:
              goto LABEL_60;
            case 4:
              goto LABEL_59;
            default:
              goto LABEL_66;
          }
        }
        goto LABEL_56;
      }
    }
  }
  return result;
}

uint64_t sub_FCA4(uint64_t a1, uint64_t a2, char *a3, size_t a4)
{
  if (*(_DWORD *)(a1 + 64)
    && (uint64_t v16 = a1 + 64,
        (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16),
        *(_DWORD *)(a1 + 64) = 0,
        uint64_t v8 = a1 + 68,
        a1 + 68 + a4 + 10 <= a1 + 1088))
  {
    *(_DWORD *)(a1 + 64) = 1;
    *(void *)(a1 + 68) = a2;
    *(_WORD *)(a1 + 76) = 0;
    unint64_t v9 = (char *)(a1 + 78);
    __int16 v10 = 0;
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        goto LABEL_10;
      case 2uLL:
        goto LABEL_9;
      case 3uLL:
        goto LABEL_8;
      case 4uLL:
        char v11 = *a3++;
        unint64_t v9 = (char *)(a1 + 79);
        *(unsigned char *)(a1 + 78) = v11;
LABEL_8:
        char v12 = *a3++;
        *v9++ = v12;
LABEL_9:
        char v13 = *a3++;
        *v9++ = v13;
LABEL_10:
        *unint64_t v9 = *a3;
        __int16 v10 = *(_WORD *)(a1 + 76);
        break;
      default:
        if (a4) {
          memmove(v9, a3, a4);
        }
        __int16 v10 = 0;
        break;
    }
    *(_WORD *)(a1 + 76) = v10 + a4;
  }
  else
  {
    MIDI::LegacyPacketList::create();
    uint64_t v16 = v15;
    (**(void (***)(uint64_t, uint64_t *))a1)(a1 + 8, &v16);
    if (v15) {
      MIDI::LegacyPacketListDeleter::operator()();
    }
    *(void *)(a1 + 56) = a1 + 68;
    *(_DWORD *)(a1 + 64) = 0;
    return a1 + 68;
  }
  return v8;
}

void sub_FE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t *sub_FE68(uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2) {
    MIDI::LegacyPacketListDeleter::operator()();
  }
  return a1;
}

uint64_t sub_FEA4(uint64_t result, void **a2)
{
  if (*(_DWORD *)(result + 4))
  {
    uint64_t v3 = result;
    unsigned int v4 = 0;
    uint64_t v5 = result + 8;
    do
    {
      unint64_t v6 = *(unsigned int *)(v5 + 8);
      uint64_t v20 = v5 + 12;
      unint64_t v21 = v6;
      uint64_t v22 = *(void *)v5;
      unint64_t v23 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      uint64_t v17 = 0;
      uint64_t result = sub_F700(&v20, &v19, &v17);
      if (result)
      {
        uint64_t v7 = v19;
        while (1)
        {
          char v12 = *a2;
          uint64_t v25 = v7;
          char v13 = (unsigned __int8 *)(*v12 + 64);
          *(void *)&long long v24 = v12[1];
          *((void *)&v24 + 1) = &v25;
          uint64_t result = (uint64_t)sub_10084(v13, (unsigned __int8 *)&v17, &v24);
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          uint64_t v17 = 0;
          if (v23 >= v21) {
            break;
          }
          __int16 v10 = (unsigned int *)(v20 + 4 * v23);
          unint64_t v9 = *v10;
          unint64_t v14 = v23 + byte_1B1E8[v9 >> 28];
          if (v14 > v21) {
            break;
          }
          uint64_t v7 = v22;
          uint64_t v19 = v22;
          uint64_t v8 = &v17;
          switch((uint64_t)(4 * v14 - 4 * v23) >> 2)
          {
            case 0:
              goto LABEL_9;
            case 1:
              goto LABEL_8;
            case 2:
              goto LABEL_7;
            case 3:
              goto LABEL_6;
            case 4:
              LODWORD(v17) = v9;
              unsigned int v15 = v10[1];
              ++v10;
              LODWORD(v9) = v15;
              uint64_t v8 = (uint64_t *)((char *)&v17 + 4);
LABEL_6:
              *(_DWORD *)uint64_t v8 = v9;
              uint64_t v8 = (uint64_t *)((char *)v8 + 4);
              unsigned int v11 = v10[1];
              ++v10;
              LODWORD(v9) = v11;
LABEL_7:
              *(_DWORD *)uint64_t v8 = v9;
              uint64_t v8 = (uint64_t *)((char *)v8 + 4);
              LODWORD(v9) = v10[1];
LABEL_8:
              *(_DWORD *)uint64_t v8 = v9;
LABEL_9:
              unint64_t v23 = v14;
              break;
            default:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              sub_CAB0(exception, "GSL: Precondition failure at /Library/Caches/com.apple.xbs/Sources/CoreMIDI_Drivers/Source/MIDI/CppSPI/EventList.h: 74");
          }
        }
      }
      v5 += 4 * *(unsigned int *)(v5 + 8) + 12;
      ++v4;
    }
    while (v4 < *(_DWORD *)(v3 + 4));
  }
  return result;
}

void sub_1005C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10084(unsigned __int8 *result, unsigned __int8 *a2, long long *a3)
{
  unint64_t v3 = *(unsigned int *)a2;
  if (((1 << (v3 >> 28)) & 0xA02F) != 0)
  {
    long long v29 = *a3;
    uint64_t v5 = a2;
    return sub_103D0(v5, (uint64_t *)&v29);
  }
  else if (v3 >> 28 == 4)
  {
    unsigned int v6 = BYTE3(v3) & 0xF | 0x20;
    unsigned int v7 = *((_DWORD *)a2 + 1);
    switch(BYTE2(v3) >> 4)
    {
      case 2:
      case 3:
        __int16 v10 = &result[48 * (BYTE3(v3) & 0xF)];
        uint64_t v11 = (v3 >> 16) & 0xF;
        char v12 = &v10[3 * v11];
        unsigned int v13 = (v3 >> 8) & 0x7F;
        int v14 = *(_DWORD *)a2 & 0x7F;
        int v15 = (v7 >> 18) & 0x7F;
        if ((v3 & 0x100000) != 0) {
          int v16 = 2;
        }
        else {
          int v16 = 1;
        }
        if (v16 == *v12 && v13 == v12[1])
        {
          int v17 = v11 | 0xB0;
          if (v14 == v12[2])
          {
            int v18 = (v6 << 24) | (v17 << 16);
            goto LABEL_22;
          }
        }
        else
        {
          int v17 = v11 | 0xB0;
        }
        if ((v3 & 0x100000) != 0) {
          int v19 = 25344;
        }
        else {
          int v19 = 25856;
        }
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        int v18 = (v6 << 24) | (v17 << 16);
        int v20 = v18 | v19;
        *(void *)unint64_t v27 = v18 | v19 | v13;
        long long v29 = *a3;
        uint64_t v26 = v10;
        sub_103D0(v27, (uint64_t *)&v29);
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)unint64_t v27 = (v20 | v14) - 256;
        long long v29 = *a3;
        sub_103D0(v27, (uint64_t *)&v29);
        *char v12 = v16;
        unint64_t v21 = &v26[3 * v11];
        v21[1] = v13;
        v21[2] = v14;
LABEL_22:
        int v28 = 0;
        *(_DWORD *)&v27[8] = 0;
        *(void *)unint64_t v27 = v18 | (v7 >> 25) | 0x600;
        long long v29 = *a3;
        uint64_t result = sub_103D0(v27, (uint64_t *)&v29);
        if (v15)
        {
          int v28 = 0;
          *(void *)&v27[4] = 0;
          int v8 = v15 | v18;
          int v9 = 9728;
          goto LABEL_24;
        }
        break;
      case 8:
      case 9:
      case 10:
      case 11:
        int v8 = v7 >> 25;
        if (!(v7 >> 25)) {
          int v8 = BYTE2(v3) >> 4 == 9;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v9 = (BYTE2(v3) << 16) | (v6 << 24) | v3 & 0x7F00;
LABEL_24:
        int v22 = v8 | v9;
        goto LABEL_25;
      case 12:
        if (v3)
        {
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
          int v25 = (v6 << 24) | (v24 - 0x100000);
          *(void *)unint64_t v27 = (v6 << 24) | (v24 - 0x100000) & 0xFFFFFF80 | (v7 >> 8) & 0x7F;
          long long v29 = *a3;
          sub_103D0(v27, (uint64_t *)&v29);
          int v28 = 0;
          *(_DWORD *)&v27[8] = 0;
          *(void *)unint64_t v27 = v25 & 0xFFFFFF80 | v7 & 0x7F | 0x2000;
          long long v29 = *a3;
          sub_103D0(v27, (uint64_t *)&v29);
        }
        else
        {
          unsigned int v23 = v6 << 24;
          int v24 = BYTE2(v3) << 16;
        }
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v22 = HIWORD(v7) & 0x7F00 | v23 | v24;
        goto LABEL_25;
      case 13:
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v22 = (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25 << 8);
        goto LABEL_25;
      case 14:
        int v28 = 0;
        *(void *)&v27[4] = 0;
        int v22 = (v7 >> 10) & 0x7F00 | (BYTE2(v3) << 16) | (v6 << 24) | (v7 >> 25);
LABEL_25:
        *(_DWORD *)unint64_t v27 = v22;
        long long v29 = *a3;
        uint64_t v5 = v27;
        return sub_103D0(v5, (uint64_t *)&v29);
      default:
        return result;
    }
  }
  return result;
}

unsigned __int8 *sub_103D0(unsigned __int8 *result, uint64_t *a2)
{
  unint64_t v3 = *(unsigned int *)result;
  unsigned int v4 = v3 >> 28;
  if (v3 >> 28 == 3)
  {
    size_t v13 = (v3 >> 16) & 0xF;
    if (v13 > 6 || BYTE2(v3) > 0x3Fu) {
      return result;
    }
    unsigned int v14 = (v3 >> 20) + 3;
    unsigned int v15 = bswap32(*((_DWORD *)result + 1));
    v33[0] = bswap32(v3);
    v33[1] = v15;
    if ((v3 & 0x200000) != 0)
    {
      size_t v6 = 0;
      if (!v13) {
        goto LABEL_39;
      }
    }
    else
    {
      unsigned __int8 __src = -16;
      size_t v6 = 1;
      if (!v13)
      {
LABEL_39:
        if ((v14 & 2) != 0) {
          *(&__src + v6++) = -9;
        }
        uint64_t v7 = *a2;
        uint64_t v26 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v27 = v7 + 1088;
        int v28 = *(_DWORD *)(v7 + 64);
        if (v28)
        {
          uint64_t v29 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v26 && *(unsigned __int8 *)(v9 + v29 + 9) != 247 && __src != 240)
          {
            if (v9 + v6 + v29 + 10 <= v27) {
              goto LABEL_53;
            }
            goto LABEL_51;
          }
          unint64_t v9 = (v9 + v29 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v27)
        {
          LODWORD(v29) = 0;
          *(_DWORD *)(v7 + 64) = v28 + 1;
          *(void *)unint64_t v9 = v26;
          *(_WORD *)(v9 + 8) = 0;
LABEL_53:
          uint64_t result = (unsigned __int8 *)(v9 + v29 + 10);
          p_src = &__src;
          switch(v6)
          {
            case 0uLL:
              break;
            case 1uLL:
              goto LABEL_62;
            case 2uLL:
              goto LABEL_61;
            case 3uLL:
              goto LABEL_60;
            case 4uLL:
LABEL_59:
              p_src = (unsigned __int8 *)&v35;
              *result++ = __src;
LABEL_60:
              unsigned __int8 v31 = *p_src++;
              *result++ = v31;
LABEL_61:
              unsigned __int8 v32 = *p_src++;
              *result++ = v32;
LABEL_62:
              std::runtime_error *result = *p_src;
              break;
            default:
LABEL_66:
              uint64_t result = (unsigned __int8 *)memmove(result, &__src, v6);
              break;
          }
          *(_WORD *)(v9 + 8) += v6;
          goto LABEL_64;
        }
LABEL_51:
        uint64_t result = (unsigned __int8 *)sub_FCA4(v7, v26, (char *)&__src, v6);
        unint64_t v9 = (unint64_t)result;
LABEL_64:
        *(void *)(v7 + 56) = v9;
        return result;
      }
    }
    memcpy(&__src + v6, (char *)v33 + 2, v13);
    v6 += (v13 - 1) + 1;
    goto LABEL_39;
  }
  if (v4 == 2)
  {
    int v16 = v3 & 0xE00000;
    unsigned __int8 __src = BYTE2(*(_DWORD *)result);
    char v35 = BYTE1(v3) & 0x7F;
    if ((v3 & 0xE00000) == 0xC00000) {
      size_t v17 = 2;
    }
    else {
      size_t v17 = 3;
    }
    if (v16 != 12582912) {
      char v36 = v3 & 0x7F;
    }
    uint64_t v18 = *a2;
    uint64_t v19 = *(void *)a2[1];
    unint64_t v20 = *(void *)(*a2 + 56);
    unint64_t v21 = *a2 + 1088;
    int v22 = *(_DWORD *)(*a2 + 64);
    if (v22)
    {
      uint64_t v23 = *(unsigned __int16 *)(v20 + 8);
      if (*(void *)v20 == v19 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v20 + v23 + 9) != 247)
      {
        if (v20 + v17 + v23 + 10 <= v21) {
          goto LABEL_35;
        }
        goto LABEL_33;
      }
      unint64_t v20 = (v20 + v23 + 13) & 0xFFFFFFFFFFFFFFFCLL;
    }
    if (v20 + v17 + 10 <= v21)
    {
      LODWORD(v23) = 0;
      *(_DWORD *)(v18 + 64) = v22 + 1;
      *(void *)unint64_t v20 = v19;
      *(_WORD *)(v20 + 8) = 0;
LABEL_35:
      int v24 = (unsigned __int8 *)(v20 + v23 + 10);
      if (v16 == 12582912)
      {
        int v25 = &__src;
      }
      else
      {
        int v25 = (unsigned __int8 *)&v35;
        unsigned __int8 *v24 = __src;
        int v24 = (unsigned __int8 *)(v20 + v23 + 11);
      }
      unsigned __int8 *v24 = *v25;
      v24[1] = v25[1];
      *(_WORD *)(v20 + 8) += v17;
      *(void *)(v18 + 56) = v20;
      return result;
    }
LABEL_33:
    uint64_t result = (unsigned __int8 *)sub_FCA4(*a2, v19, (char *)&__src, v17);
    *(void *)(v18 + 56) = result;
    return result;
  }
  if (v4 == 1)
  {
    int v5 = BYTE2(v3) - 240;
    if (BYTE2(v3) >= 0xF0u)
    {
      size_t v6 = byte_20078[v5];
      if (byte_20078[v5])
      {
        unsigned __int8 __src = BYTE2(*(_DWORD *)result);
        if (v6 != 1)
        {
          char v35 = BYTE1(v3) & 0x7F;
          if (v6 >= 3) {
            char v36 = v3 & 0x7F;
          }
        }
        uint64_t v7 = *a2;
        uint64_t v8 = *(void *)a2[1];
        unint64_t v9 = *(void *)(*a2 + 56);
        unint64_t v10 = v7 + 1088;
        int v11 = *(_DWORD *)(v7 + 64);
        if (v11)
        {
          uint64_t v12 = *(unsigned __int16 *)(v9 + 8);
          if (*(void *)v9 == v8 && BYTE2(v3) != 240 && *(unsigned __int8 *)(v9 + v12 + 9) != 247)
          {
            if (v9 + v12 + v6 + 10 <= v10) {
              goto LABEL_58;
            }
LABEL_56:
            uint64_t result = (unsigned __int8 *)sub_FCA4(v7, v8, (char *)&__src, v6);
            *(void *)(v7 + 56) = result;
            return result;
          }
          unint64_t v9 = (v9 + v12 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        }
        if (v9 + v6 + 10 <= v10)
        {
          LODWORD(v12) = 0;
          *(_DWORD *)(v7 + 64) = v11 + 1;
          *(void *)unint64_t v9 = v8;
          *(_WORD *)(v9 + 8) = 0;
LABEL_58:
          uint64_t result = (unsigned __int8 *)(v9 + v12 + 10);
          p_src = &__src;
          switch((int)v6)
          {
            case 1:
              goto LABEL_62;
            case 2:
              goto LABEL_61;
            case 3:
              goto LABEL_60;
            case 4:
              goto LABEL_59;
            default:
              goto LABEL_66;
          }
        }
        goto LABEL_56;
      }
    }
  }
  return result;
}

uint64_t sub_10850(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)*a1 + 72))(*a1, *(unsigned int *)(*a1 + 64), *a2);
}

void *sub_10880(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

void *sub_1088C(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

void sub_108A0(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_108D8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_1090C(void *a1, void *a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)*a1 + 48))(*a1, *a2, *(void *)(*a1 + 32), *(void *)(*a1 + 40));
}

void *sub_1093C(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

void *sub_10948(void *result, void *a2)
{
  std::runtime_error *result = *a2;
  return result;
}

uint64_t NewRTPDriver(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xECu, 0xDEu, 0x95u, 0x74u, 0xFu, 0xE4u, 0x11u, 0xD4u, 0xBBu, 0x1Au, 0, 0x50u, 0xE4u, 0xCEu, 0xA5u, 0x26u);
  if (CFEqual(a2, v3)) {
    operator new();
  }
  return 0;
}

void sub_10A08()
{
}

void sub_10A2C(uint64_t a1)
{
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(0, 0x70u, 0xC9u, 0xC5u, 0xEAu, 0x7Cu, 0x65u, 0x11u, 0xD8u, 0xB3u, 0x17u, 0, 3u, 0x93u, 0xA3u, 0x4Bu, 0x5Au);
  sub_E724(a1, v2);
}

void sub_10AF0(_Unwind_Exception *a1)
{
  unsigned int v4 = (void *)v1[16];
  if (v4)
  {
    v1[17] = v4;
    operator delete(v4);
    int v5 = *v2;
    if (!*v2)
    {
LABEL_3:
      sub_EB7C(v1);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    int v5 = *v2;
    if (!*v2) {
      goto LABEL_3;
    }
  }
  v1[14] = v5;
  operator delete(v5);
  sub_EB7C(v1);
  _Unwind_Resume(a1);
}

void *sub_10B3C(void *a1)
{
  *a1 = off_1CC70;
  for (double i = (uint64_t *)a1[13]; i != (uint64_t *)a1[14]; ++i)
  {
    if (*i)
    {
      sub_1278C(*i);
      operator delete();
    }
  }
  sub_6A14((uint64_t)(a1 + 19));
  CFUUIDRef v3 = (void *)a1[16];
  if (v3)
  {
    a1[17] = v3;
    operator delete(v3);
  }
  unsigned int v4 = (void *)a1[13];
  if (v4)
  {
    a1[14] = v4;
    operator delete(v4);
  }

  return sub_EB7C(a1);
}

void sub_10BF4(void *a1)
{
  sub_10B3C(a1);

  operator delete();
}

const void *sub_10C2C(uint64_t a1)
{
  CFDictionaryRef outDict = 0;
  Value = 0;
  if (MIDIObjectGetDictionaryProperty(*(_DWORD *)(a1 + 100), @"apple.midirtp.addressbook", &outDict)) {
    return Value;
  }
  if (outDict)
  {
    CFTypeID v3 = CFGetTypeID(outDict);
    if (v3 == CFDictionaryGetTypeID())
    {
      CFDictionaryRef v4 = outDict;
      if (outDict)
      {
        Value = CFDictionaryGetValue(outDict, @"entries");
        CFRelease(v4);
        return Value;
      }
    }
  }
  return 0;
}

void sub_10CE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10CF4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10CF4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    CFUUIDRef v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void sub_10D30(uint64_t a1, const void *a2)
{
  uint64_t v5 = a1 + 152;
  uint64_t v4 = *(void *)(a1 + 152);
  uint64_t v26 = a1 + 152;
  int v6 = (*(uint64_t (**)(uint64_t))(v4 + 16))(a1 + 152);
  char v27 = v6;
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v9 = *(double **)(a1 + 128);
  uint64_t v8 = (double **)(a1 + 128);
  if (*(double **)(a1 + 136) != v9)
  {
    while (*v9 <= Current + -300.0)
    {
      CFRelease(*((CFTypeRef *)v9 + 1));
      v9[1] = 0.0;
      uint64_t v11 = *(void *)(a1 + 128);
      uint64_t v10 = *(void *)(a1 + 136);
      uint64_t v12 = v10 - (v11 + 16);
      if (v10 == v11 + 16)
      {
        unint64_t v9 = *(double **)(a1 + 128);
        *(void *)(a1 + 136) = v10 - 16;
        if (v10 - 16 == v11) {
          break;
        }
      }
      else
      {
        memmove(*(void **)(a1 + 128), (const void *)(v11 + 16), v10 - (v11 + 16));
        unint64_t v9 = *v8;
        *(void *)(a1 + 136) = v11 + v12;
        if ((double *)(v11 + v12) == v9) {
          break;
        }
      }
    }
  }
  if (a2)
  {
    CFRetain(a2);
    unsigned int v14 = *(double **)(a1 + 136);
    unint64_t v13 = *(void *)(a1 + 144);
    if ((unint64_t)v14 >= v13)
    {
      int v16 = *v8;
      uint64_t v17 = ((char *)v14 - (char *)*v8) >> 4;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60) {
        sub_D614();
      }
      uint64_t v19 = v13 - (void)v16;
      if (v19 >> 3 > v18) {
        unint64_t v18 = v19 >> 3;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        if (v20 >> 60) {
          sub_634C();
        }
        unint64_t v21 = (char *)operator new(16 * v20);
      }
      else
      {
        unint64_t v21 = 0;
      }
      int v22 = &v21[16 * v17];
      *(double *)int v22 = Current;
      *((void *)v22 + 1) = a2;
      unsigned int v15 = (double *)(v22 + 16);
      if (v14 != v16)
      {
        do
        {
          *((_OWORD *)v22 - 1) = *((_OWORD *)v14 - 1);
          v22 -= 16;
          v14 -= 2;
        }
        while (v14 != v16);
        unsigned int v14 = *v8;
      }
      *(void *)(a1 + 128) = v22;
      *(void *)(a1 + 136) = v15;
      *(void *)(a1 + 144) = &v21[16 * v20];
      if (v14) {
        operator delete(v14);
      }
    }
    else
    {
      *unsigned int v14 = Current;
      *((void *)v14 + 1) = a2;
      unsigned int v15 = v14 + 2;
    }
    *(void *)(a1 + 136) = v15;
  }
  Mutable = CFDataCreateMutable(0, 0);
  for (uint64_t i = *(void *)(a1 + 128); i != *(void *)(a1 + 136); i += 16)
  {
    CFDataAppendBytes(Mutable, (const UInt8 *)i, 8);
    bzero(buffer, 0x400uLL);
    CFStringGetCString(*(CFStringRef *)(i + 8), buffer, 1024, 0x8000100u);
    buffer[1023] = 0;
    *(_WORD *)bytes = strlen(buffer) + 1;
    CFDataAppendBytes(Mutable, bytes, 2);
    CFDataAppendBytes(Mutable, (const UInt8 *)buffer, *(unsigned __int16 *)bytes);
  }
  MIDIObjectSetDataProperty(*(_DWORD *)(a1 + 100), @"apple.midirtp.errors", Mutable);
  CFRelease(Mutable);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
}

void sub_11030(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1106C(uint64_t notifyRefCon, MIDIDeviceListRef devList)
{
  if (!qword_20090)
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.AppleMIDIRTPDriver");
    if (BundleWithIdentifier)
    {
      uint64_t v5 = BundleWithIdentifier;
      CFRetain(BundleWithIdentifier);
      qword_20090 = (uint64_t)CFBundleCopyLocalizedString(v5, @"BadHostErr", @"BadHostErr", @"RTPMIDILocalizable");
      qword_20098 = (uint64_t)CFBundleCopyLocalizedString(v5, @"NoConnectResponseErr", @"NoConnectResponseErr", @"RTPMIDILocalizable");
      qword_200A0 = (uint64_t)CFBundleCopyLocalizedString(v5, @"RefusedConnectionErr", @"RefusedConnectionErr", @"RTPMIDILocalizable");
      qword_200A8 = (uint64_t)CFBundleCopyLocalizedString(v5, @"IncompatibleProtocolErr", @"IncompatibleProtocolErr", @"RTPMIDILocalizable");
      qword_200B0 = (uint64_t)CFBundleCopyLocalizedString(v5, @"LostConnectionErr", @"LostConnectionErr", @"RTPMIDILocalizable");
      qword_200B8 = (uint64_t)CFBundleCopyLocalizedString(v5, @"NetworkDevice", @"NetworkDevice", @"RTPMIDILocalizable");
      CFRelease(v5);
    }
  }
  if (!*(_DWORD *)(notifyRefCon + 96))
  {
    OSStatus v6 = MIDIClientCreate(@"MIDIRTP driver", (MIDINotifyProc)sub_115F0, (void *)notifyRefCon, (MIDIClientRef *)(notifyRefCon + 96));
    if (v6)
    {
      unsigned int v11 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_4DA0(v15, v11);
        *(_DWORD *)int buf = 136315906;
        uint64_t v17 = "RTPDriver.cpp";
        __int16 v18 = 1024;
        int v19 = 155;
        __int16 v20 = 2080;
        unint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "MIDIClientCreate";
        _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      exception = __cxa_allocate_exception(0x110uLL);
      sub_4AC4((uint64_t)exception, "MIDIClientCreate", v11);
    }
  }
  if (MIDIDeviceListGetNumberOfDevices(devList))
  {
    MIDIObjectRef Device = MIDIDeviceListGetDevice(devList, 0);
    *(_DWORD *)(notifyRefCon + 100) = Device;
    if ((byte_200C0 & 1) == 0)
    {
      MIDIObjectSetStringProperty(Device, kMIDIPropertyName, (CFStringRef)qword_200B8);
      byte_200C0 = 1;
    }
  }
  else
  {
    OSStatus v8 = MIDIDeviceCreate((MIDIDriverRef)(notifyRefCon + 8), (CFStringRef)qword_200B8, &stru_1CFC0, &stru_1CFC0, (MIDIDeviceRef *)(notifyRefCon + 100));
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_4DA0(v15, v8);
        *(_DWORD *)int buf = 136315906;
        uint64_t v17 = "RTPDriver.cpp";
        __int16 v18 = 1024;
        int v19 = 167;
        __int16 v20 = 2080;
        unint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "MIDIDeviceCreate";
        _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      unint64_t v13 = __cxa_allocate_exception(0x110uLL);
      sub_4AC4((uint64_t)v13, "MIDIDeviceCreate", v8);
    }
    OSStatus v9 = MIDISetupAddDevice(*(_DWORD *)(notifyRefCon + 100));
    if (v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_4DA0(v15, v9);
        *(_DWORD *)int buf = 136315906;
        uint64_t v17 = "RTPDriver.cpp";
        __int16 v18 = 1024;
        int v19 = 168;
        __int16 v20 = 2080;
        unint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "MIDISetupAddDevice";
        _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
      }
      unsigned int v14 = __cxa_allocate_exception(0x110uLL);
      sub_4AC4((uint64_t)v14, "MIDISetupAddDevice", v9);
    }
  }
  sub_10D30(notifyRefCon, 0);
  MIDIObjectSetIntegerProperty(*(_DWORD *)(notifyRefCon + 100), kMIDIPropertyOffline, 0);
  MIDIObjectSetIntegerProperty(*(_DWORD *)(notifyRefCon + 100), kMIDIPropertyAdvanceScheduleTimeMuSec, 50000);
  MIDIObjectSetStringProperty(*(_DWORD *)(notifyRefCon + 100), kMIDIPropertyImage, @"/System/Library/Audio/MIDI Drivers/AppleMIDIRTPDriver.plugin/Contents/Resources/RTPDriverIcon.tiff");
  sub_1178C(notifyRefCon);
  return 0;
}

void sub_1154C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    CFTypeID v3 = __cxa_begin_catch(exception_object);
    if (a2 == 2) {
      sub_6E0C((uint64_t)v3);
    }
    __cxa_end_catch();
    JUMPOUT(0x112A0);
  }
  _Unwind_Resume(exception_object);
}

void sub_115F0(CFTypeRef *a1, uint64_t a2)
{
  int v3 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (v3 == 4 && *((_DWORD *)a1 + 3) == 1)
    {
      uint64_t v4 = *(uint64_t **)(a2 + 104);
      uint64_t v5 = *(uint64_t **)(a2 + 112);
      if (v4 != v5)
      {
        while (1)
        {
          uint64_t v6 = *v4;
          if (*(_DWORD *)(*v4 + 8) == *((_DWORD *)a1 + 2)) {
            break;
          }
          if (++v4 == v5) {
            return;
          }
        }
        if (CFEqual(a1[2], @"apple.midirtp.session"))
        {
          sub_11AE4(v6);
        }
      }
    }
  }
  else if (*((_DWORD *)a1 + 2) == *(_DWORD *)(a2 + 100))
  {
    if (v3 == 2)
    {
      sub_1178C(a2);
    }
    else
    {
      OSStatus v8 = *(uint64_t **)(a2 + 104);
      uint64_t v7 = *(uint64_t **)(a2 + 112);
      if (v8 != v7)
      {
        int v9 = *((_DWORD *)a1 + 4);
        uint64_t v10 = *(uint64_t **)(a2 + 104);
        do
        {
          uint64_t v11 = *v10;
          if (*(_DWORD *)(*v10 + 8) == v9)
          {
            while (*(_DWORD *)(*v8 + 8) != v9)
            {
              if (++v8 == v7) {
                goto LABEL_29;
              }
            }
            uint64_t v12 = (char *)v7 - (char *)(v8 + 1);
            if (v7 != v8 + 1) {
              memmove(v8, v8 + 1, (char *)v7 - (char *)(v8 + 1));
            }
            *(void *)(a2 + 112) = (char *)v8 + v12;
LABEL_29:
            sub_1278C(v11);
            operator delete();
          }
          ++v10;
        }
        while (v10 != v7);
      }
    }
  }
}

ItemCount sub_1178C(uint64_t a1)
{
  if ((byte_200C1 & 1) == 0) {
    byte_200C1 = 1;
  }
  ItemCount result = MIDIDeviceGetNumberOfEntities(*(_DWORD *)(a1 + 100));
  if (result)
  {
    ItemCount v3 = result;
    for (ItemCount i = 0; i != v3; ++i)
    {
      ItemCount result = MIDIDeviceGetEntity(*(_DWORD *)(a1 + 100), i);
      if (result)
      {
        uint64_t v5 = *(void *)(a1 + 104);
        uint64_t v6 = *(void *)(a1 + 112);
        if (v5 == v6) {
LABEL_10:
        }
          operator new();
        while (*(_DWORD *)(*(void *)v5 + 8) != result)
        {
          v5 += 8;
          if (v5 == v6) {
            goto LABEL_10;
          }
        }
      }
    }
  }
  return result;
}

void sub_11A34(_Unwind_Exception *a1)
{
}

uint64_t sub_11A48(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    sub_B1D4(a4, a2, 0);
  }
  return 0;
}

uint64_t sub_11A88(void *a1, int a2)
{
  ItemCount v3 = (unsigned int *)__cxa_begin_catch(a1);
  if (a2 == 2)
  {
    uint64_t v4 = v3;
    sub_6E0C((uint64_t)v3);
    uint64_t v5 = v4[66];
    __cxa_end_catch();
    return v5;
  }
  else
  {
    __cxa_end_catch();
    return 0xFFFFFFFFLL;
  }
}

void sub_11AD0(_Unwind_Exception *a1)
{
}

void sub_11AE4(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_200D0))
  {
    qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
    __cxa_guard_release(&qword_200D0);
  }
  CFUUIDRef v2 = qword_200C8;
  if (os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    int v4 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)int buf = 136315906;
    *(void *)&uint8_t buf[4] = "RTPDriver.cpp";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 418;
    *(_WORD *)&unsigned char buf[18] = 2112;
    *(void *)&buf[20] = v3;
    __int16 v29 = 1024;
    int v30 = v4;
    _os_log_impl(&def_13FA0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): EntityInfoPropertyChanged", buf, 0x22u);
  }
  CFDictionaryRef outDict = 0;
  memset(buf, 0, 24);
  if (!MIDIObjectGetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", &outDict))
  {
    CFDictionaryRef v5 = outDict;
    CFTypeRef cf = outDict;
    __int16 v26 = 257;
    if (outDict
      && (CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(outDict, @"flags"), v7 = v6, LODWORD(valuePtr) = 0, v6)
      && (CFTypeID v8 = CFGetTypeID(v6), v8 == CFNumberGetTypeID())
      && (CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr), (valuePtr & 1) != 0))
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v5, @"port");
      CFNumberRef v19 = Value;
      LODWORD(valuePtr) = 0;
      if (Value)
      {
        CFTypeID v20 = CFGetTypeID(Value);
        if (v20 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v19, kCFNumberSInt32Type, &valuePtr);
          uint64_t v21 = *(void *)(a1 + 72);
          if (v21)
          {
            if ((int)valuePtr >= 1 && valuePtr != *(unsigned __int16 *)(v21 + 140)) {
              sub_12800(a1);
            }
          }
        }
      }
      sub_12460(a1);
      CFTypeRef valuePtr = 0;
      unsigned __int8 v23 = 1;
    }
    else
    {
      sub_12800(a1);
      CFTypeRef valuePtr = 0;
      unsigned __int8 v23 = 1;
      if (!v5)
      {
LABEL_25:
        sub_129E8(a1, (const __CFDictionary **)&cf, (uint64_t)buf);
        CFDictionaryRef DeepCopy = (const __CFDictionary *)CFPropertyListCreateDeepCopy(0, outDict, 1uLL);
        if (*(unsigned char *)(a1 + 64))
        {
          int v16 = *(const void **)(a1 + 56);
          if (v16) {
            CFRelease(v16);
          }
        }
        *(void *)(a1 + 56) = DeepCopy;
        *(unsigned char *)(a1 + 65) = 1;
        uint64_t v17 = *(void *)&buf[8];
        if (*(void *)&buf[8] != *(void *)buf)
        {
          if (DeepCopy)
          {
            CFDictionaryRef DeepCopy = (const __CFDictionary *)CFDictionaryGetValue(DeepCopy, @"peers");
            uint64_t v17 = *(void *)&buf[8];
          }
          do
          {
            CFArrayRemoveValueAtIndex(DeepCopy, *(int *)(v17 - 4));
            uint64_t v17 = *(void *)&buf[8] - 4;
            *(void *)&buf[8] = v17;
          }
          while (v17 != *(void *)buf);
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), @"peers", DeepCopy);
          MIDIObjectSetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", *(CFDictionaryRef *)(a1 + 56));
        }
        if (v23 && valuePtr) {
          CFRelease(valuePtr);
        }
        if ((_BYTE)v26 && cf) {
          CFRelease(cf);
        }
        goto LABEL_5;
      }
    }
    if (CFDictionaryContainsKey(v5, @"dns-sd-name"))
    {
      int v9 = CFDictionaryGetValue(v5, @"dns-sd-name");
      uint64_t v10 = v9;
      CFTypeRef valuePtr = v9;
      char v24 = 0;
      if (v9) {
        CFRetain(v9);
      }
      if (!CFEqual(v10, *(CFTypeRef *)(a1 + 40)))
      {
        if (*(unsigned char *)(a1 + 48))
        {
          uint64_t v11 = *(const void **)(a1 + 40);
          if (v11) {
            CFRelease(v11);
          }
        }
        CFTypeRef v12 = valuePtr;
        *(void *)(a1 + 40) = valuePtr;
        int v13 = v23;
        *(unsigned char *)(a1 + 48) = v23;
        *(unsigned char *)(a1 + 49) = v24;
        if (v13 && v12) {
          CFRetain(v12);
        }
        uint64_t v14 = *(void *)(a1 + 72);
        if (v14) {
          sub_891C(v14, *(const __CFString **)(a1 + 40));
        }
      }
    }
    goto LABEL_25;
  }
LABEL_5:
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
}

void sub_11EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_11F3C()
{
  return 0;
}

uint64_t sub_11F44(uint64_t a1, uint64_t a2, MIDIEntityRef a3, int a4)
{
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  *(void *)(a1 + 24) = 0;
  CFNumberRef v7 = (CFTypeRef *)(a1 + 24);
  *(unsigned char *)(a1 + 32) = 1;
  *(void *)(a1 + 40) = 0;
  CFTypeID v8 = (CFTypeRef *)(a1 + 40);
  *(unsigned char *)(a1 + 48) = 1;
  int v9 = (CFDictionaryRef *)(a1 + 56);
  *(void *)(a1 + 56) = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  *(_WORD *)(a1 + 64) = 257;
  *(void *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 12) = MIDIEntityGetSource(a3, 0);
  *(_DWORD *)(a1 + 16) = MIDIEntityGetDestination(a3, 0);
  CFStringRef str = 0;
  MIDIObjectGetStringProperty(a3, kMIDIPropertyName, &str);
  CFStringRef v10 = str;
  if (str)
  {
    if (!*(unsigned char *)(a1 + 32))
    {
      *(void *)(a1 + 24) = str;
      *(unsigned char *)(a1 + 33) = 0;
      goto LABEL_9;
    }
    if (*v7)
    {
      CFRelease(*v7);
      int v11 = *(unsigned __int8 *)(a1 + 32);
      *(void *)(a1 + 24) = v10;
      *(unsigned char *)(a1 + 33) = 0;
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      *(void *)(a1 + 24) = str;
      *(unsigned char *)(a1 + 33) = 0;
    }
    CFRetain(v10);
  }
LABEL_9:
  sub_122E4(a1);
  if (a4)
  {
    uint64_t v12 = MGCopyAnswer();
    if (v12) {
      CFStringRef Value = (const __CFString *)v12;
    }
    else {
      CFStringRef Value = @"Unknown";
    }
    if (*(unsigned char *)(a1 + 48))
    {
      CFTypeRef v14 = *v8;
      if (*v8)
      {
LABEL_23:
        CFRelease(v14);
        int v15 = *(unsigned __int8 *)(a1 + 48);
        *(void *)(a1 + 40) = Value;
        *(unsigned char *)(a1 + 49) = 0;
        if (!v15) {
          goto LABEL_29;
        }
        goto LABEL_26;
      }
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  if (!*v9 || !CFDictionaryContainsKey(*v9, @"dns-sd-name"))
  {
    if (*(unsigned char *)(a1 + 48))
    {
      CFTypeRef v14 = *v8;
      CFStringRef Value = &stru_1CFC0;
      if (*v8) {
        goto LABEL_23;
      }
LABEL_25:
      *(void *)(a1 + 40) = Value;
      *(unsigned char *)(a1 + 49) = 0;
      goto LABEL_26;
    }
    CFStringRef Value = &stru_1CFC0;
LABEL_28:
    *(void *)(a1 + 40) = Value;
    *(unsigned char *)(a1 + 49) = 0;
    goto LABEL_29;
  }
  if (*v9)
  {
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*v9, @"dns-sd-name");
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_28;
    }
  }
  else
  {
    CFStringRef Value = 0;
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_28;
    }
  }
  if (!*v8)
  {
    *(void *)(a1 + 40) = Value;
    *(unsigned char *)(a1 + 49) = 0;
    if (!Value) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  CFRelease(*v8);
  int v24 = *(unsigned __int8 *)(a1 + 48);
  *(void *)(a1 + 40) = Value;
  *(unsigned char *)(a1 + 49) = 0;
  if (Value && v24) {
LABEL_26:
  }
    CFRetain(Value);
LABEL_29:
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFDictionarySetValue(*v9, @"peers", Mutable);
  MIDIObjectSetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", *(CFDictionaryRef *)(a1 + 56));
  if (*v9)
  {
    CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(*v9, @"flags");
    CFNumberRef v18 = v17;
    int valuePtr = 0;
    if (v17)
    {
      CFTypeID v19 = CFGetTypeID(v17);
      if (v19 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
        if (valuePtr)
        {
          if (*v9)
          {
            CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(*v9, @"port");
            CFNumberRef v21 = v20;
            int valuePtr = 0;
            if (v20)
            {
              CFTypeID v22 = CFGetTypeID(v20);
              if (v22 == CFNumberGetTypeID()) {
                CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
              }
            }
          }
          sub_12460(a1);
        }
      }
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return a1;
}

void sub_1228C(_Unwind_Exception *a1)
{
  sub_10CF4(v3);
  sub_7598(v2);
  sub_7598(v1);
  _Unwind_Resume(a1);
}

void sub_122E4(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_200D0))
  {
    qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
    __cxa_guard_release(&qword_200D0);
  }
  uint64_t v2 = qword_200C8;
  if (os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 24);
    int v4 = *(_DWORD *)(a1 + 8);
    *(_DWORD *)propertyList = 136315906;
    *(void *)&propertyList[4] = "RTPDriver.cpp";
    __int16 v8 = 1024;
    int v9 = 350;
    __int16 v10 = 2112;
    uint64_t v11 = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&def_13FA0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): LoadState:", propertyList, 0x22u);
  }
  *(void *)propertyList = 0;
  if (!MIDIObjectGetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", (CFDictionaryRef *)propertyList))
  {
    CFPropertyListRef DeepCopy = CFPropertyListCreateDeepCopy(0, *(CFPropertyListRef *)propertyList, 1uLL);
    if (*(unsigned char *)(a1 + 64))
    {
      CFNumberRef v6 = *(const void **)(a1 + 56);
      if (v6) {
        CFRelease(v6);
      }
    }
    *(void *)(a1 + 56) = DeepCopy;
    *(unsigned char *)(a1 + 65) = 1;
    CFRelease(*(CFTypeRef *)propertyList);
  }
}

uint64_t sub_12460(uint64_t result)
{
  if (!*(void *)(result + 72))
  {
    uint64_t v1 = result;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_200D0))
    {
      qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
      __cxa_guard_release(&qword_200D0);
    }
    uint64_t v2 = qword_200C8;
    if (os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v3 = *(void *)(v1 + 24);
      int v4 = *(_DWORD *)(v1 + 8);
      int v5 = 136315906;
      CFNumberRef v6 = "RTPDriver.cpp";
      __int16 v7 = 1024;
      int v8 = 376;
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      __int16 v11 = 1024;
      int v12 = v4;
      _os_log_impl(&def_13FA0, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): Session starting", (uint8_t *)&v5, 0x22u);
    }
    MIDIObjectRemoveProperty(*(_DWORD *)(v1 + 8), kMIDIPropertyMaxSysExSpeed);
    operator new();
  }
  return result;
}

void sub_1268C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_12750(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t sub_1278C(uint64_t a1)
{
  sub_12800(a1);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(const void **)(a1 + 56);
    if (v2) {
      CFRelease(v2);
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(const void **)(a1 + 40);
    if (v3) {
      CFRelease(v3);
    }
  }
  if (*(unsigned char *)(a1 + 32))
  {
    int v4 = *(const void **)(a1 + 24);
    if (v4) {
      CFRelease(v4);
    }
  }
  return a1;
}

void sub_12800(uint64_t a1)
{
  MIDIEndpointSetRefCons(*(_DWORD *)(a1 + 16), 0, 0);
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    sub_7820(v2);
    uint64_t v3 = *(void *)(a1 + 72);
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    *(void *)(a1 + 72) = 0;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_200D0))
    {
      qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
      __cxa_guard_release(&qword_200D0);
    }
    int v4 = qword_200C8;
    if (os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 24);
      int v6 = *(_DWORD *)(a1 + 8);
      int v7 = 136315906;
      int v8 = "RTPDriver.cpp";
      __int16 v9 = 1024;
      int v10 = 410;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 1024;
      int v14 = v6;
      _os_log_impl(&def_13FA0, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ (0x%x): Session ended", (uint8_t *)&v7, 0x22u);
    }
  }
}

void sub_129C4(_Unwind_Exception *a1)
{
}

void sub_129D0(void *a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x129D8);
  }
  sub_4834(a1);
}

void sub_129E8(uint64_t a1, const __CFDictionary **a2, uint64_t a3)
{
  if (!*(void *)(a1 + 72)) {
    return;
  }
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 56);
  if (v6)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v6, @"peers");
    CFDictionaryRef v8 = *a2;
    if (*a2)
    {
LABEL_4:
      __int16 v9 = CFDictionaryGetValue(v8, @"peers");
      goto LABEL_7;
    }
  }
  else
  {
    CFArrayRef Value = 0;
    CFDictionaryRef v8 = *a2;
    if (*a2) {
      goto LABEL_4;
    }
  }
  __int16 v9 = 0;
LABEL_7:
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArrayRef v30 = Mutable;
  __int16 v31 = 257;
  CFTypeRef cf = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  __int16 v29 = 257;
  if (!Value)
  {
    CFArrayRef Value = Mutable;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  CFArrayRef v30 = Value;
  HIBYTE(v31) = 0;
  CFRetain(Value);
  if (v9)
  {
LABEL_13:
    if (cf) {
      CFRelease(cf);
    }
    CFTypeRef cf = v9;
    HIBYTE(v29) = 0;
    CFRetain(v9);
  }
LABEL_16:
  sub_13038((CFStringRef **)&v26, &v30);
  sub_13038((CFStringRef **)&__p, (CFArrayRef *)&cf);
  v44[0] = off_1CD38;
  v44[1] = a1;
  int v45 = v44;
  __int16 v11 = operator new(0x20uLL);
  void *v11 = off_1CD80;
  v11[1] = a1;
  uint64_t v12 = v11 + 1;
  v11[2] = &cf;
  v11[3] = a3;
  unint64_t v43 = v11;
  unsigned int v39 = off_1CDC8;
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = &cf;
  pthread_t v41 = &v39;
  __int16 v13 = v26;
  unint64_t v14 = (unint64_t)v27;
  int v15 = (CFStringRef *)__p;
  unint64_t v16 = v25;
  int v38 = v37;
  v37[0] = off_1CD38;
  v37[1] = a1;
  CFNumberRef v17 = (char *)operator new(0x20uLL);
  *(void *)CFNumberRef v17 = off_1CD80;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)v12;
  *((void *)v17 + 3) = v12[2];
  char v36 = v17;
  double v34 = &v32;
  unsigned __int8 v32 = off_1CDC8;
  long long v33 = v40;
  sub_13254((uint64_t)v13, v14, v15, v16, (uint64_t)v37, (uint64_t)v35, (uint64_t)&v32);
  if (v34 == &v32)
  {
    ((void (*)(uint64_t (***)()))v32[4])(&v32);
    CFNumberRef v18 = v36;
    if (v36 != v35) {
      goto LABEL_20;
    }
LABEL_45:
    (*(void (**)(void *))(v35[0] + 32))(v35);
    CFTypeID v19 = v38;
    if (v38 != v37) {
      goto LABEL_23;
    }
LABEL_46:
    (*(void (**)(void *))(v37[0] + 32))(v37);
    CFNumberRef v20 = v41;
    if (v41 != &v39) {
      goto LABEL_26;
    }
LABEL_47:
    ((void (*)(uint64_t (***)()))v39[4])(&v39);
    CFNumberRef v21 = v43;
    if (v43 != v42) {
      goto LABEL_29;
    }
LABEL_48:
    (*(void (**)(void *))(v42[0] + 32))(v42);
    CFTypeID v22 = v45;
    if (v45 != v44) {
      goto LABEL_32;
    }
LABEL_49:
    (*(void (**)(void *))(v44[0] + 32))(v44);
    unsigned __int8 v23 = __p;
    if (!__p) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (v34) {
    (*v34)[5]();
  }
  CFNumberRef v18 = v36;
  if (v36 == v35) {
    goto LABEL_45;
  }
LABEL_20:
  if (v18) {
    (*(void (**)(void *))(*v18 + 40))(v18);
  }
  CFTypeID v19 = v38;
  if (v38 == v37) {
    goto LABEL_46;
  }
LABEL_23:
  if (v19) {
    (*(void (**)(void *))(*v19 + 40))(v19);
  }
  CFNumberRef v20 = v41;
  if (v41 == &v39) {
    goto LABEL_47;
  }
LABEL_26:
  if (v20) {
    ((void (*)(uint64_t (***)()))(*v20)[5])(v20);
  }
  CFNumberRef v21 = v43;
  if (v43 == v42) {
    goto LABEL_48;
  }
LABEL_29:
  if (v21) {
    (*(void (**)(void *))(*v21 + 40))(v21);
  }
  CFTypeID v22 = v45;
  if (v45 == v44) {
    goto LABEL_49;
  }
LABEL_32:
  if (v22) {
    (*(void (**)(void *))(*v22 + 40))(v22);
  }
  unsigned __int8 v23 = __p;
  if (!__p) {
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v25 = (unint64_t)v23;
  operator delete(v23);
LABEL_36:
  if (v26)
  {
    char v27 = v26;
    operator delete(v26);
  }
  if ((_BYTE)v29 && cf) {
    CFRelease(cf);
  }
  if (Value) {
    CFRelease(Value);
  }
}

void sub_12F8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, char a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  if (a2) {
    sub_4834(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_13038(CFStringRef **a1, CFArrayRef *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  int Count = CFArrayGetCount(*a2);
  if (Count >= 1)
  {
    uint64_t v5 = 0;
    CFIndex v6 = 0;
    uint64_t v7 = Count;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*a2, v6);
      if (!ValueAtIndex || (CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"address")) == 0) {
        CFStringRef Value = &stru_1CFC0;
      }
      int v10 = a1[2];
      if (v5 < v10)
      {
        CFStringRef *v5 = Value;
        *((_DWORD *)v5 + 2) = v6;
        v5 += 2;
      }
      else
      {
        __int16 v11 = *a1;
        uint64_t v12 = ((char *)v5 - (char *)*a1) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          sub_D614();
        }
        uint64_t v14 = (char *)v10 - (char *)v11;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          if (v15 >> 60) {
            sub_634C();
          }
          unint64_t v16 = (char *)operator new(16 * v15);
          uint64_t v17 = (uint64_t)&v16[16 * v12];
          *(void *)uint64_t v17 = Value;
          *(_DWORD *)(v17 + 8) = v6;
          if (v5 != v11)
          {
LABEL_18:
            uint64_t v18 = v17;
            do
            {
              *(_OWORD *)(v18 - 16) = *((_OWORD *)v5 - 1);
              v18 -= 16;
              v5 -= 2;
            }
            while (v5 != v11);
            CFTypeID v19 = *a1;
            uint64_t v5 = (CFStringRef *)(v17 + 16);
            *a1 = (CFStringRef *)v18;
            a1[1] = (CFStringRef *)(v17 + 16);
            a1[2] = (CFStringRef *)&v16[16 * v15];
            if (!v19) {
              goto LABEL_4;
            }
LABEL_24:
            operator delete(v19);
            goto LABEL_4;
          }
        }
        else
        {
          unint64_t v16 = 0;
          uint64_t v17 = 16 * v12;
          *(void *)uint64_t v17 = Value;
          *(_DWORD *)(v17 + 8) = v6;
          if (v5 != v11) {
            goto LABEL_18;
          }
        }
        CFTypeID v19 = v5;
        uint64_t v5 = (CFStringRef *)(v17 + 16);
        *a1 = (CFStringRef *)v17;
        a1[1] = (CFStringRef *)(v17 + 16);
        a1[2] = (CFStringRef *)&v16[16 * v15];
        if (v19) {
          goto LABEL_24;
        }
      }
LABEL_4:
      a1[1] = v5;
      if (++v6 == v7)
      {
        CFNumberRef v20 = *a1;
        goto LABEL_27;
      }
    }
  }
  uint64_t v5 = 0;
  CFNumberRef v20 = 0;
LABEL_27:
  unint64_t v21 = 126 - 2 * __clz(((char *)v5 - (char *)v20) >> 4);
  if (v5 == v20) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v21;
  }
  sub_13DBC(v20, v5, (uint64_t)&v23, v22, 1);
}

void sub_13230(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_13254(uint64_t result, unint64_t a2, CFStringRef *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v13 = (CFStringRef *)result;
  while ((unint64_t)v13 < a2)
  {
    if ((unint64_t)a3 >= a4 || (CFStringCompare(*v13, *a3, 0) & 0x80000000) != 0)
    {
      uint64_t v18 = v13;
      uint64_t v14 = *(void *)(a5 + 24);
      if (!v14) {
        goto LABEL_14;
      }
      ItemCount result = (*(uint64_t (**)(uint64_t, CFStringRef **))(*(void *)v14 + 48))(v14, &v18);
      v13 += 2;
    }
    else if ((CFStringCompare(*a3, *v13, 0) & 0x80000000) != 0)
    {
LABEL_12:
      uint64_t v18 = a3;
      uint64_t v16 = *(void *)(a6 + 24);
      if (!v16) {
LABEL_14:
      }
        sub_6380();
      ItemCount result = (*(uint64_t (**)(uint64_t, CFStringRef **))(*(void *)v16 + 48))(v16, &v18);
      a3 += 2;
    }
    else
    {
      uint64_t v17 = a3;
      uint64_t v18 = v13;
      uint64_t v15 = *(void *)(a7 + 24);
      if (!v15) {
        goto LABEL_14;
      }
      v13 += 2;
      ItemCount result = (*(uint64_t (**)(uint64_t, CFStringRef **, CFStringRef **))(*(void *)v15 + 48))(v15, &v18, &v17);
      a3 += 2;
    }
  }
  if ((unint64_t)a3 < a4) {
    goto LABEL_12;
  }
  return result;
}

void *sub_133B0(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

void *sub_13440(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

uint64_t sub_134D0(uint64_t result, const void *a2)
{
  if (!a2) {
    return result;
  }
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 48))
  {
    int v4 = *(const void **)(result + 40);
    if (v4)
    {
      CFRelease(v4);
      int v5 = *(unsigned __int8 *)(v3 + 48);
      *(void *)(v3 + 40) = a2;
      *(unsigned char *)(v3 + 49) = 0;
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      *(void *)(v3 + 40) = a2;
      *(unsigned char *)(v3 + 49) = 0;
    }
    CFRetain(a2);
  }
  else
  {
    *(void *)(result + 40) = a2;
    *(unsigned char *)(result + 49) = 0;
  }
LABEL_10:
  sub_122E4(v3);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 56), @"dns-sd-name", a2);
  MIDIObjectRef v6 = *(_DWORD *)(v3 + 8);
  CFDictionaryRef v7 = *(const __CFDictionary **)(v3 + 56);

  return MIDIObjectSetDictionaryProperty(v6, @"apple.midirtp.session", v7);
}

uint64_t sub_1357C(uint64_t a1, const MIDIPacketList *a2)
{
  return MIDIReceived(*(_DWORD *)(*(void *)(a1 + 1688) + 12), a2);
}

BOOL sub_13588(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 56);
  if (v6)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"join-policy");
    *(_DWORD *)int valuePtr = 0;
    if (Value)
    {
      CFNumberRef v8 = Value;
      CFTypeID v9 = CFGetTypeID(Value);
      if (v9 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v8, kCFNumberSInt32Type, valuePtr);
        if (*(_DWORD *)valuePtr == 1)
        {
          if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
            && __cxa_guard_acquire(&qword_200D0))
          {
            qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
            __cxa_guard_release(&qword_200D0);
          }
          uint64_t v15 = qword_200C8;
          if (os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int valuePtr = 136315906;
            *(void *)&valuePtr[4] = "RTPDriver.cpp";
            __int16 v39 = 1024;
            int v40 = 631;
            __int16 v41 = 2112;
            CFStringRef v42 = a2;
            __int16 v43 = 2112;
            CFStringRef v44 = a3;
            _os_log_impl(&def_13FA0, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d Join policy is kRTPJoinPolicy_UsersInDirectory: Looking up %@ %@", valuePtr, 0x26u);
          }
          sub_595C(&stru_1CFC0, a3, &v28);
          sub_5258((uint64_t)&v28, valuePtr, 0x100uLL);
          CFArrayRef v16 = (const __CFArray *)sub_10C2C(*(void *)a1);
          CFArrayRef v17 = v16;
          if (v16)
          {
            int Count = CFArrayGetCount(v16);
            if (Count >= 1)
            {
              CFIndex v18 = 0;
              BOOL v19 = 1;
              while (1)
              {
                CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v17, v18);
                if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
                  && __cxa_guard_acquire(&qword_200D0))
                {
                  qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
                  __cxa_guard_release(&qword_200D0);
                }
                unint64_t v21 = qword_200C8;
                if (os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)int buf = 136316162;
                  *(void *)&uint8_t buf[4] = "RTPDriver.cpp";
                  __int16 v30 = 1024;
                  int v31 = 651;
                  __int16 v32 = 1024;
                  int v33 = v18;
                  __int16 v34 = 1024;
                  int v35 = Count;
                  __int16 v36 = 2112;
                  unsigned int v37 = ValueAtIndex;
                  _os_log_impl(&def_13FA0, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d   Address Book entry %d/%d: %@", buf, 0x28u);
                }
                if (ValueAtIndex)
                {
                  CFTypeID v22 = CFGetTypeID(ValueAtIndex);
                  if (v22 == CFDictionaryGetTypeID())
                  {
                    CFStringRef v23 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"address");
                    CFStringRef v24 = v23;
                    if (v23)
                    {
                      CFTypeID v25 = CFGetTypeID(v23);
                      if (v25 == CFStringGetTypeID())
                      {
                        sub_595C(&stru_1CFC0, v24, &v27);
                        sub_5258((uint64_t)&v27, buf, 0x100uLL);
                        if (sub_5E7C(&v27.sa_len, &v28.sa_len)) {
                          break;
                        }
                      }
                    }
                  }
                }
                BOOL v19 = ++v18 < Count;
                if (Count == v18) {
                  return 0;
                }
              }
              if (v19) {
                goto LABEL_6;
              }
            }
          }
          return 0;
        }
        if (*(_DWORD *)valuePtr == 2)
        {
LABEL_6:
          CFArrayRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          *(void *)int valuePtr = Mutable;
          *(_WORD *)&valuePtr[8] = 257;
          if (CFStringGetLength(a2)) {
            CFStringRef v11 = a2;
          }
          else {
            CFStringRef v11 = a3;
          }
          CFDictionarySetValue(Mutable, @"name", v11);
          CFDictionarySetValue(Mutable, @"address", a3);
          sub_122E4(a1);
          CFDictionaryRef v12 = *(const __CFDictionary **)(a1 + 56);
          if (v12) {
            CFDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(v12, @"peers");
          }
          *(void *)int buf = v12;
          *(_WORD *)&buf[8] = 256;
          CFArrayAppendValue(v12, Mutable);
          MIDIObjectSetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", *(CFDictionaryRef *)(a1 + 56));
          if (Mutable) {
            CFRelease(Mutable);
          }
          return 1;
        }
      }
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_200D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_200D0))
  {
    qword_200C8 = (uint64_t)os_log_create("com.apple.coremidi", "rtpdrv");
    __cxa_guard_release(&qword_200D0);
  }
  uint64_t v14 = qword_200C8;
  BOOL result = os_log_type_enabled((os_log_t)qword_200C8, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    *(_DWORD *)int valuePtr = 136315906;
    *(void *)&valuePtr[4] = "RTPDriver.cpp";
    __int16 v39 = 1024;
    int v40 = 627;
    __int16 v41 = 2112;
    CFStringRef v42 = a2;
    __int16 v43 = 2112;
    CFStringRef v44 = a3;
    _os_log_impl(&def_13FA0, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d Join policy is kRTPJoinPolicy_NoOne: %@ %@ is not allowed to connect", valuePtr, 0x26u);
    return 0;
  }
  return result;
}

void sub_13AC8(_Unwind_Exception *a1)
{
}

void sub_13AD4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_4834(a1);
  }
  _Unwind_Resume(a1);
}

void sub_13AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_13AF8(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      int v4 = v3;
      sub_6E0C((uint64_t)v3);
      int v5 = v4[66];
      __cxa_end_catch();
      if (!v5) {
        JUMPOUT(0x1384CLL);
      }
    }
    else
    {
      __cxa_end_catch();
    }
    JUMPOUT(0x13764);
  }
  _Unwind_Resume(a1);
}

void sub_13B34(_Unwind_Exception *a1)
{
}

void sub_13B40(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x13ADCLL);
}

void sub_13B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_13B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

CFIndex sub_13B88(uint64_t a1, const void *a2)
{
  sub_122E4(a1);
  CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 56);
  if (v4) {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v4, @"peers");
  }
  else {
    CFArrayRef Value = 0;
  }
  CFIndex result = CFArrayGetCount(Value);
  if ((int)result >= 1)
  {
    CFIndex v7 = 0;
    uint64_t v8 = result;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v7);
      if (!ValueAtIndex || (CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"address")) == 0) {
        CFStringRef v10 = &stru_1CFC0;
      }
      CFIndex result = CFEqual(v10, a2);
      if (result) {
        break;
      }
      if (v8 == ++v7) {
        return result;
      }
    }
    CFArrayRemoveValueAtIndex(Value, v7);
    return MIDIObjectSetDictionaryProperty(*(_DWORD *)(a1 + 8), @"apple.midirtp.session", *(CFDictionaryRef *)(a1 + 56));
  }
  return result;
}

void sub_13C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_13C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_13CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_13CBC(uint64_t a1, const void *a2)
{
}

void sub_13CCC(uint64_t a1)
{
  sub_75D4(a1);

  operator delete();
}

uint64_t sub_13D04(uint64_t a1, const void *a2)
{
  return sub_134D0(*(void *)(a1 + 1688), a2);
}

BOOL sub_13D0C(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  return sub_13588(*(void *)(a1 + 1688), a2, a3);
}

CFIndex sub_13D14(uint64_t a1, const void *a2)
{
  return sub_13B88(*(void *)(a1 + 1688), a2);
}

uint64_t sub_13D1C(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 1688);
  sub_122E4(v3);
  int valuePtr = a2;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 56), @"port", v4);
  CFRelease(v4);
  return MIDIObjectSetDictionaryProperty(*(_DWORD *)(v3 + 8), @"apple.midirtp.session", *(CFDictionaryRef *)(v3 + 56));
}

uint64_t sub_13D98(uint64_t a1, SInt32 value)
{
  MIDIObjectRef v2 = *(_DWORD *)(*(void *)(a1 + 1688) + 8);
  if (value) {
    return MIDIObjectSetIntegerProperty(v2, kMIDIPropertyMaxSysExSpeed, value);
  }
  else {
    return MIDIObjectRemoveProperty(v2, kMIDIPropertyMaxSysExSpeed);
  }
}

void sub_13DBC(CFStringRef *a1, CFStringRef *a2, uint64_t a3, uint64_t a4, char a5)
{
  while (2)
  {
    CFDictionaryRef v12 = a2 - 2;
    unint64_t v13 = a1;
LABEL_2:
    uint64_t v14 = a4 - 1;
    while (1)
    {
      a1 = v13;
      uint64_t v15 = (char *)a2 - (char *)v13;
      unint64_t v16 = ((char *)a2 - (char *)v13) >> 4;
      if (!(!v6 & v5))
      {
        switch(v16)
        {
          case 0uLL:
          case 1uLL:
            return;
          case 2uLL:
            if ((CFStringCompare(*v12, *v13, 0) & 0x80000000) != 0)
            {
              long long v43 = *(_OWORD *)v13;
              *(_OWORD *)unint64_t v13 = *(_OWORD *)v12;
              *(_OWORD *)CFDictionaryRef v12 = v43;
            }
            break;
          case 3uLL:
            sub_14238(v13, v13 + 2, a2 - 2);
            break;
          case 4uLL:
            sub_147A0(v13, v13 + 2, v13 + 4, a2 - 2);
            break;
          case 5uLL:
            sub_14850(v13, v13 + 2, v13 + 4, v13 + 6, a2 - 2);
            break;
          default:
            JUMPOUT(0);
        }
        return;
      }
      if (v15 <= 383)
      {
        unint64_t v21 = v13 + 2;
        BOOL v23 = v13 == a2 || v21 == a2;
        if (a5)
        {
          if (!v23)
          {
            uint64_t v24 = 0;
            CFTypeID v25 = v13;
            do
            {
              if ((CFStringCompare(*v21, *v25, 0) & 0x80000000) != 0)
              {
                unint64_t v27 = 0;
                CFStringRef v28 = *v21;
                CFStringRef v29 = v25[3];
                do
                {
                  __int16 v30 = &v25[v27 / 8];
                  *(_OWORD *)&v25[v27 / 8 + 2] = *(_OWORD *)&v25[v27 / 8];
                  if (v24 == v27)
                  {
                    __int16 v26 = v13;
                    goto LABEL_40;
                  }
                  v27 -= 16;
                }
                while ((CFStringCompare(v28, *(v30 - 2), 0) & 0x80000000) != 0);
                __int16 v26 = &v21[v27 / 8];
LABEL_40:
                *__int16 v26 = v28;
                v26[1] = v29;
              }
              v21 += 2;
              v24 -= 16;
              v25 += 2;
            }
            while (v21 != a2);
          }
        }
        else if (!v23)
        {
          do
          {
            __int16 v36 = v21;
            if ((CFStringCompare(a1[2], *a1, 0) & 0x80000000) != 0)
            {
              CFStringRef v37 = *v21;
              CFStringRef v38 = a1[3];
              __int16 v39 = v21;
              do
              {
                int v40 = v39 - 2;
                *(_OWORD *)__int16 v39 = *((_OWORD *)v39 - 1);
                int v41 = CFStringCompare(v37, *(v39 - 4), 0);
                __int16 v39 = v40;
              }
              while (v41 < 0);
              const char *v40 = v37;
              v40[1] = v38;
            }
            unint64_t v21 = v36 + 2;
            a1 = v36;
          }
          while (v36 + 2 != a2);
        }
        return;
      }
      a4 = v14;
      if (v14 == -1)
      {
        if (v13 != a2)
        {
          unint64_t v31 = (v16 - 2) >> 1;
          unint64_t v32 = v31 + 1;
          int v33 = &v13[2 * v31];
          do
          {
            sub_14930((CFComparisonResult)v13, a3, ((char *)a2 - (char *)v13) >> 4, v33);
            v33 -= 2;
            --v32;
          }
          while (v32);
          unint64_t v34 = (unint64_t)v15 >> 4;
          do
          {
            sub_14A64((__n128 *)v13, (uint64_t)a2, a3, v34);
            a2 -= 2;
          }
          while (v34-- > 2);
        }
        return;
      }
      CFArrayRef v17 = &v13[2 * (v16 >> 1)];
      if ((unint64_t)v15 < 0x801)
      {
        sub_14238(v17, v13, a2 - 2);
        if (a5) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_14238(v13, v17, a2 - 2);
        sub_14238(v13 + 2, v17 - 2, a2 - 4);
        sub_14238(v13 + 4, v17 + 2, a2 - 6);
        sub_14238(v17 - 2, v17, v17 + 2);
        long long v42 = *(_OWORD *)v13;
        *(_OWORD *)unint64_t v13 = *(_OWORD *)v17;
        *(_OWORD *)CFArrayRef v17 = v42;
        if (a5) {
          goto LABEL_12;
        }
      }
      if ((CFStringCompare(*(v13 - 2), *v13, 0) & 0x80000000) == 0)
      {
        unint64_t v13 = sub_14394(v13, a2);
        a5 = 0;
        goto LABEL_2;
      }
LABEL_12:
      CFIndex v18 = sub_144B0((unint64_t)v13, a2);
      if ((v19 & 1) == 0) {
        goto LABEL_15;
      }
      BOOL v20 = sub_145C4(v13, v18);
      unint64_t v13 = (CFStringRef *)(v18 + 1);
      if (sub_145C4((CFStringRef *)v18 + 2, (long long *)a2)) {
        break;
      }
      uint64_t v14 = a4 - 1;
      if (!v20)
      {
LABEL_15:
        sub_13DBC(a1, v18, a3, a4, a5 & 1);
        a5 = 0;
        unint64_t v13 = (CFStringRef *)(v18 + 1);
        goto LABEL_2;
      }
    }
    a2 = (CFStringRef *)v18;
    if (!v20) {
      continue;
    }
    break;
  }
}

uint64_t sub_14238(CFStringRef *a1, CFStringRef *a2, CFStringRef *a3)
{
  int v6 = CFStringCompare(*a2, *a1, 0);
  int v7 = CFStringCompare(*a3, *a2, 0);
  if (v6 < 0)
  {
    if (v7 < 0)
    {
      long long v11 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v11;
      return 1;
    }
    else
    {
      long long v9 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)a2 = v9;
      if ((CFStringCompare(*a3, *a2, 0) & 0x80000000) != 0)
      {
        long long v12 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v12;
        return 2;
      }
      else
      {
        return 1;
      }
    }
  }
  else if (v7 < 0)
  {
    long long v10 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v10;
    if ((CFStringCompare(*a2, *a1, 0) & 0x80000000) != 0)
    {
      long long v13 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)a2 = v13;
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return 0;
  }
}

CFStringRef *sub_14394(const __CFString **a1, CFStringRef *a2)
{
  MIDIObjectRef v2 = a2;
  CFStringRef v4 = *a1;
  CFStringRef v5 = a1[1];
  if ((CFStringCompare(*a1, *(a2 - 2), 0) & 0x80000000) != 0)
  {
    int v7 = a1;
    do
    {
      CFStringRef v8 = v7[2];
      v7 += 2;
    }
    while ((CFStringCompare(v4, v8, 0) & 0x80000000) == 0);
  }
  else
  {
    unint64_t v6 = (unint64_t)(a1 + 2);
    do
    {
      int v7 = (CFStringRef *)v6;
      if (v6 >= (unint64_t)v2) {
        break;
      }
      v6 += 16;
    }
    while ((CFStringCompare(v4, *v7, 0) & 0x80000000) == 0);
  }
  if (v7 < v2)
  {
    do
    {
      CFStringRef v9 = *(v2 - 2);
      v2 -= 2;
    }
    while ((CFStringCompare(v4, v9, 0) & 0x80000000) != 0);
  }
  while (v7 < v2)
  {
    long long v13 = *(_OWORD *)v7;
    *(_OWORD *)int v7 = *(_OWORD *)v2;
    *(_OWORD *)MIDIObjectRef v2 = v13;
    do
    {
      CFStringRef v10 = v7[2];
      v7 += 2;
    }
    while ((CFStringCompare(v4, v10, 0) & 0x80000000) == 0);
    do
    {
      CFStringRef v11 = *(v2 - 2);
      v2 -= 2;
    }
    while ((CFStringCompare(v4, v11, 0) & 0x80000000) != 0);
  }
  if (v7 - 2 != a1) {
    *(_OWORD *)a1 = *((_OWORD *)v7 - 1);
  }
  *(v7 - 2) = v4;
  *(v7 - 1) = v5;
  return v7;
}

_OWORD *sub_144B0(unint64_t a1, _OWORD *a2)
{
  CFStringRef v4 = *(const __CFString **)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = a1;
  do
  {
    unint64_t v7 = v6;
    CFStringRef v8 = *(const __CFString **)(v6 + 16);
    v6 += 16;
  }
  while ((CFStringCompare(v8, v4, 0) & 0x80000000) != 0);
  if (v7 == a1)
  {
    do
    {
      if (v6 >= (unint64_t)a2) {
        break;
      }
      CFStringRef v10 = (const __CFString *)*((void *)a2-- - 2);
    }
    while ((CFStringCompare(v10, v4, 0) & 0x80000000) == 0);
  }
  else
  {
    do
      CFStringRef v9 = (const __CFString *)*((void *)a2-- - 2);
    while ((CFStringCompare(v9, v4, 0) & 0x80000000) == 0);
  }
  unint64_t v11 = v6;
  if (v6 < (unint64_t)a2)
  {
    long long v12 = a2;
    do
    {
      long long v13 = *(_OWORD *)v11;
      *(_OWORD *)unint64_t v11 = *v12;
      *long long v12 = v13;
      do
      {
        CFStringRef v14 = *(const __CFString **)(v11 + 16);
        v11 += 16;
      }
      while ((CFStringCompare(v14, v4, 0) & 0x80000000) != 0);
      do
        CFStringRef v15 = (const __CFString *)*((void *)v12-- - 2);
      while ((CFStringCompare(v15, v4, 0) & 0x80000000) == 0);
    }
    while (v11 < (unint64_t)v12);
  }
  CFIndex result = (_OWORD *)(v11 - 16);
  if (v11 - 16 != a1) {
    *(_OWORD *)a1 = *result;
  }
  *(void *)(v11 - 16) = v4;
  *(void *)(v11 - 8) = v5;
  return result;
}

BOOL sub_145C4(CFStringRef *a1, long long *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      unint64_t v6 = a2 - 1;
      if ((CFStringCompare(*((CFStringRef *)a2 - 2), *a1, 0) & 0x80000000) != 0)
      {
        long long v7 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *v6;
        long long *v6 = v7;
      }
      return 1;
    case 3:
      sub_14238(a1, a1 + 2, (CFStringRef *)a2 - 2);
      return 1;
    case 4:
      sub_147A0(a1, a1 + 2, a1 + 4, (CFStringRef *)a2 - 2);
      return 1;
    case 5:
      sub_14850(a1, a1 + 2, a1 + 4, a1 + 6, (CFStringRef *)a2 - 2);
      return 1;
    default:
      CFStringRef v8 = a1 + 4;
      sub_14238(a1, a1 + 2, a1 + 4);
      CFStringRef v9 = (long long *)(a1 + 6);
      if (a1 + 6 == (CFStringRef *)a2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      break;
  }
  while ((CFStringCompare(*(CFStringRef *)v9, *v8, 0) & 0x80000000) == 0)
  {
LABEL_13:
    CFStringRef v8 = (CFStringRef *)v9;
    v10 += 16;
    if (++v9 == a2) {
      return 1;
    }
  }
  CFStringRef v12 = *(const __CFString **)v9;
  CFStringRef v13 = (const __CFString *)*((void *)v9 + 1);
  uint64_t v14 = v10;
  do
  {
    uint64_t v15 = (uint64_t)a1 + v14;
    *(_OWORD *)((char *)a1 + v14 + 48) = *(_OWORD *)((char *)a1 + v14 + 32);
    if (v14 == -32)
    {
      *a1 = v12;
      a1[1] = v13;
      if (++v11 != 8) {
        goto LABEL_13;
      }
      return v9 + 1 == a2;
    }
    v14 -= 16;
  }
  while ((CFStringCompare(v12, *(CFStringRef *)(v15 + 16), 0) & 0x80000000) != 0);
  uint64_t v16 = (uint64_t)a1 + v14;
  *(void *)(v16 + 48) = v12;
  *(void *)(v16 + 56) = v13;
  if (++v11 != 8) {
    goto LABEL_13;
  }
  return v9 + 1 == a2;
}

__n128 sub_147A0(CFStringRef *a1, CFStringRef *a2, CFStringRef *a3, CFStringRef *a4)
{
  sub_14238(a1, a2, a3);
  if ((CFStringCompare(*a4, *a3, 0) & 0x80000000) != 0)
  {
    long long v9 = *(_OWORD *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_OWORD *)a4 = v9;
    if ((CFStringCompare(*a3, *a2, 0) & 0x80000000) != 0)
    {
      long long v10 = *(_OWORD *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v10;
      if ((CFStringCompare(*a2, *a1, 0) & 0x80000000) != 0)
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 sub_14850(CFStringRef *a1, CFStringRef *a2, CFStringRef *a3, CFStringRef *a4, CFStringRef *a5)
{
  sub_147A0(a1, a2, a3, a4);
  if ((CFStringCompare(*a5, *a4, 0) & 0x80000000) != 0)
  {
    long long v11 = *(_OWORD *)a4;
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(_OWORD *)a5 = v11;
    if ((CFStringCompare(*a4, *a3, 0) & 0x80000000) != 0)
    {
      long long v12 = *(_OWORD *)a3;
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(_OWORD *)a4 = v12;
      if ((CFStringCompare(*a3, *a2, 0) & 0x80000000) != 0)
      {
        long long v13 = *(_OWORD *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(_OWORD *)a3 = v13;
        if ((CFStringCompare(*a2, *a1, 0) & 0x80000000) != 0)
        {
          __n128 result = *(__n128 *)a1;
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(__n128 *)a2 = result;
        }
      }
    }
  }
  return result;
}

CFComparisonResult sub_14930(CFComparisonResult result, uint64_t a2, uint64_t a3, CFStringRef *a4)
{
  unint64_t v4 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v5 = a4;
    CFComparisonResult v6 = result;
    uint64_t v7 = (uint64_t)a4 - result;
    uint64_t v8 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 4)
    {
      uint64_t v10 = v7 >> 3;
      uint64_t v11 = (v7 >> 3) + 1;
      uint64_t v12 = result + 2 * v7;
      long long v13 = (CFStringRef *)(v12 + 16);
      uint64_t v14 = v10 + 2;
      if (v10 + 2 < a3 && (CFStringCompare(*v13, *(CFStringRef *)(v12 + 32), 0) & 0x80000000) != 0)
      {
        v13 += 2;
        uint64_t v11 = v14;
      }
      __n128 result = CFStringCompare(*v13, *v5, 0);
      if ((result & 0x80000000) == 0)
      {
        CFStringRef v15 = *v5;
        CFStringRef v16 = v5[1];
        uint64_t v17 = v6 + 16;
        do
        {
          CFIndex v18 = v5;
          uint64_t v5 = v13;
          *(_OWORD *)CFIndex v18 = *(_OWORD *)v13;
          if (v8 < v11) {
            break;
          }
          uint64_t v19 = (2 * v11) | 1;
          long long v13 = (CFStringRef *)(v17 + 32 * v11);
          uint64_t v20 = 2 * v11 + 2;
          if (v20 < a3 && (CFStringCompare(*v13, v13[2], 0) & 0x80000000) != 0)
          {
            v13 += 2;
            uint64_t v19 = v20;
          }
          __n128 result = CFStringCompare(*v13, v15, 0);
          uint64_t v11 = v19;
        }
        while ((result & 0x80000000) == 0);
        CFStringRef *v5 = v15;
        v5[1] = v16;
      }
    }
  }
  return result;
}

__n128 sub_14A64(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    uint64_t v7 = 0;
    __n128 v21 = *a1;
    int64_t v8 = (unint64_t)(a4 - 2) >> 1;
    long long v9 = a1;
    do
    {
      uint64_t v10 = (uint64_t)&v9[v7 + 1];
      uint64_t v11 = (2 * v7) | 1;
      uint64_t v12 = 2 * v7 + 2;
      if (v12 < a4 && (CFStringCompare(*(CFStringRef *)v10, *(CFStringRef *)&v9[v7 + 2], 0) & 0x80000000) != 0)
      {
        v10 += 16;
        uint64_t v11 = v12;
      }
      *long long v9 = *(_OWORD *)v10;
      long long v9 = (_OWORD *)v10;
      uint64_t v7 = v11;
    }
    while (v11 <= v8);
    long long v13 = (__n128 *)(a2 - 16);
    if (v10 == a2 - 16)
    {
      __n128 result = v21;
      *(__n128 *)uint64_t v10 = v21;
    }
    else
    {
      *(__n128 *)uint64_t v10 = *v13;
      __n128 result = v21;
      *long long v13 = v21;
      uint64_t v15 = v10 - (void)a1 + 16;
      if (v15 >= 17)
      {
        unint64_t v16 = (((unint64_t)v15 >> 4) - 2) >> 1;
        uint64_t v17 = (CFStringRef *)&a1[v16];
        if ((CFStringCompare(*v17, *(CFStringRef *)v10, 0) & 0x80000000) != 0)
        {
          CFStringRef v18 = *(const __CFString **)v10;
          uint64_t v19 = *(void *)(v10 + 8);
          do
          {
            uint64_t v20 = (_OWORD *)v10;
            uint64_t v10 = (uint64_t)v17;
            __n128 result = *(__n128 *)v17;
            *uint64_t v20 = *(_OWORD *)v17;
            if (!v16) {
              break;
            }
            unint64_t v16 = (v16 - 1) >> 1;
            uint64_t v17 = (CFStringRef *)&a1[v16];
          }
          while ((CFStringCompare(*v17, v18, 0) & 0x80000000) != 0);
          *(void *)uint64_t v10 = v18;
          *(void *)(v10 + 8) = v19;
        }
      }
    }
  }
  return result;
}

void sub_14BD0()
{
}

void *sub_14BE4(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_1CD38;
  result[1] = v3;
  return result;
}

uint64_t sub_14C2C(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_1CD38;
  a2[1] = v2;
  return result;
}

void sub_14C58(uint64_t a1, const void ***a2)
{
}

void sub_14C70()
{
}

__n128 sub_14C84(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = off_1CD80;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 sub_14CD8(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_1CD80;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void sub_14D10(uint64_t a1, const __CFString ***a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 8) + 72);
  CFStringRef v3 = **a2;
  CFIndex v4 = *((int *)*a2 + 2);
  CFArrayRef v5 = **(const __CFArray ***)(a1 + 16);
  int valuePtr = 0;
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v4);
  if (ValueAtIndex && (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"latency")) != 0)
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    int v8 = valuePtr;
  }
  else
  {
    int v8 = 0;
  }
  sub_8C70(v2, v3, v8);
}

void sub_14DA8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf)
{
  uint64_t v15 = __cxa_begin_catch(a1);
  if (a2 == 2)
  {
    unint64_t v16 = v15;
    sub_6E0C((uint64_t)v15);
    int v17 = v16[66];
    __cxa_end_catch();
    if (v17 == -3)
    {
LABEL_8:
      uint64_t v18 = *(void *)(v11 + 24);
      uint64_t v20 = *(char **)(v18 + 8);
      unint64_t v19 = *(void *)(v18 + 16);
      if ((unint64_t)v20 >= v19)
      {
        CFTypeID v22 = *(char **)v18;
        uint64_t v23 = (uint64_t)&v20[-*(void *)v18];
        uint64_t v24 = v23 >> 2;
        unint64_t v25 = (v23 >> 2) + 1;
        if (v25 >> 62) {
          sub_D614();
        }
        uint64_t v26 = v19 - (void)v22;
        if (v26 >> 1 > v25) {
          unint64_t v25 = v26 >> 1;
        }
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v27 = v25;
        }
        if (v27)
        {
          if (v27 >> 62) {
            sub_634C();
          }
          CFStringRef v28 = operator new(4 * v27);
        }
        else
        {
          CFStringRef v28 = 0;
        }
        CFStringRef v29 = &v28[4 * v24];
        *CFStringRef v29 = *(_DWORD *)(v12 + 8);
        __n128 v21 = v29 + 1;
        if (v20 != v22)
        {
          unint64_t v30 = v20 - v22 - 4;
          if (v30 < 0x2C) {
            goto LABEL_35;
          }
          if ((unint64_t)(v20 - v28 - v23) < 0x20) {
            goto LABEL_35;
          }
          uint64_t v31 = (v30 >> 2) + 1;
          uint64_t v32 = 4 * (v31 & 0x7FFFFFFFFFFFFFF8);
          int v33 = &v20[-v32];
          CFStringRef v29 = (_DWORD *)((char *)v29 - v32);
          unint64_t v34 = &v28[4 * v24 - 16];
          int v35 = v20 - 16;
          uint64_t v36 = v31 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v37 = *(_OWORD *)v35;
            *(v34 - 1) = *((_OWORD *)v35 - 1);
            *unint64_t v34 = v37;
            v34 -= 2;
            v35 -= 32;
            v36 -= 8;
          }
          while (v36);
          uint64_t v20 = v33;
          if (v31 != (v31 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_35:
            do
            {
              int v38 = *((_DWORD *)v20 - 1);
              v20 -= 4;
              *--CFStringRef v29 = v38;
            }
            while (v20 != v22);
          }
        }
        *(void *)uint64_t v18 = v29;
        *(void *)(v18 + 8) = v21;
        *(void *)(v18 + 16) = &v28[4 * v27];
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v20 = *(_DWORD *)(v12 + 8);
        __n128 v21 = v20 + 4;
      }
      *(void *)(v18 + 8) = v21;
LABEL_32:
      JUMPOUT(0x14D8CLL);
    }
    if (!v17) {
      goto LABEL_32;
    }
  }
  else
  {
    __cxa_end_catch();
  }
  CFStringRef cfa = CFStringCreateWithFormat(0, 0, (CFStringRef)qword_20090);
  sub_10D30(*v13, cfa);
  if (cfa) {
    CFRelease(cfa);
  }
  goto LABEL_8;
}

void sub_14F80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf)
{
}

void sub_14FD0()
{
}

__n128 sub_14FE4(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = off_1CDC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 sub_15030(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_1CDC8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_15060(uint64_t a1, uint64_t a2, const void ***a3)
{
  CFStringRef v3 = *(void **)(*(void *)(a1 + 8) + 72);
  CFArrayRef v4 = **(const __CFArray ***)(a1 + 16);
  CFArrayRef v5 = **a3;
  CFIndex v6 = *((int *)*a3 + 2);
  int valuePtr = 0;
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v6);
  if (ValueAtIndex && (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"latency")) != 0)
  {
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    int v9 = valuePtr;
  }
  else
  {
    int v9 = 0;
  }
  return sub_947C(v3, v5, v9);
}

uint64_t sub_150DC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    sub_156BC(v2, a1);
    *(void *)(a1 + 8) = 0;
  }
  uint64_t result = *(unsigned int *)(a1 + 16);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a1 + 16) = -1;
  }
  *(_WORD *)(a1 + 20) = 0;
  return result;
}

ssize_t sub_15128(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    sub_156BC(v12, a1);
    *(void *)(a1 + 8) = 0;
  }
  int v13 = *(_DWORD *)(a1 + 16);
  if ((v13 & 0x80000000) == 0)
  {
    close(v13);
    *(_DWORD *)(a1 + 16) = -1;
  }
  *(_WORD *)(a1 + 20) = 0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 28) = a3;
  ssize_t result = socket(a3, a4, a5);
  *(_DWORD *)(a1 + 16) = result;
  if ((result & 0x80000000) != 0)
  {
    int v15 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_4DA0(v17, v15);
      *(_DWORD *)int buf = 136315906;
      unint64_t v19 = "Socket.cpp";
      __int16 v20 = 1024;
      int v21 = 42;
      __int16 v22 = 2080;
      uint64_t v23 = v17;
      __int16 v24 = 2080;
      unint64_t v25 = "couldn't create socket";
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d about to throw %s: %s", buf, 0x26u);
    }
    exception = __cxa_allocate_exception(0x110uLL);
    sub_4AC4((uint64_t)exception, "couldn't create socket", v15);
  }
  *(_DWORD *)(a1 + 24) = a6;
  if (a2)
  {
    return sub_1532C(a2, a1);
  }
  return result;
}

void sub_15314(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

ssize_t sub_1532C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1 + 152;
  uint64_t v4 = *(void *)(a1 + 152);
  __int buf = a1 + 152;
  int v6 = (*(uint64_t (**)(uint64_t))(v4 + 16))(a1 + 152);
  char v19 = v6;
  uint64_t v15 = a2;
  char v16 = 0;
  int v17 = 0;
  int v8 = *(char **)(a1 + 248);
  uint64_t v7 = *(char **)(a1 + 256);
  if (v7 != v8)
  {
    unint64_t v9 = (v7 - v8) >> 4;
    do
    {
      unint64_t v10 = v9 >> 1;
      uint64_t v11 = &v8[16 * (v9 >> 1)];
      uint64_t v13 = *(void *)v11;
      uint64_t v12 = v11 + 16;
      v9 += ~(v9 >> 1);
      if (*(_DWORD *)(v13 + 16) < *(_DWORD *)(a2 + 16)) {
        int v8 = v12;
      }
      else {
        unint64_t v9 = v10;
      }
    }
    while (v9);
    uint64_t v7 = v8;
  }
  sub_15458((char **)(a1 + 248), v7, (char *)&v15);
  ++*(_DWORD *)(a1 + 272);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }
  LOBYTE(__buf) = 88;
  return write(*(_DWORD *)(a1 + 244), &__buf, 1uLL);
}

void sub_15444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_88C4(va);
  _Unwind_Resume(a1);
}

char *sub_15458(char **a1, char *a2, char *a3)
{
  CFStringRef v3 = a3;
  int v6 = *a1;
  unint64_t v5 = (unint64_t)a1[1];
  uint64_t v7 = a2 - *a1;
  int v8 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFF0];
  unint64_t v9 = (unint64_t)a1[2];
  if (v5 < v9)
  {
    if (v8 == (char *)v5)
    {
      *(_OWORD *)int v8 = *(_OWORD *)a3;
      a1[1] = v8 + 16;
    }
    else
    {
      unint64_t v10 = v8 + 16;
      uint64_t v11 = (long long *)(v5 - 16);
      uint64_t v12 = a1[1];
      if (v5 >= 0x10)
      {
        do
        {
          long long v13 = *v11++;
          *(_OWORD *)uint64_t v12 = v13;
          v12 += 16;
        }
        while ((unint64_t)v11 < v5);
      }
      a1[1] = v12;
      if ((_OWORD *)v5 != v10) {
        memmove((void *)(v5 - 16 * ((uint64_t)(v5 - (void)v10) >> 4)), v8, v5 - (void)v10);
      }
      if (v8 <= v3) {
        v3 += 16 * (a1[1] > v3);
      }
      *(_OWORD *)int v8 = *(_OWORD *)v3;
    }
    return v8;
  }
  unint64_t v14 = ((uint64_t)(v5 - (void)v6) >> 4) + 1;
  if (v14 >> 60) {
    sub_D614();
  }
  uint64_t v16 = v9 - (void)v6;
  if (v16 >> 3 > v14) {
    unint64_t v14 = v16 >> 3;
  }
  if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v17 = v14;
  }
  if (v17)
  {
    if (v17 >> 60) {
      sub_634C();
    }
    uint64_t v18 = (char *)operator new(16 * v17);
    uint64_t v19 = v7 >> 4;
    __int16 v20 = &v18[16 * (v7 >> 4)];
    int v21 = &v18[16 * v17];
    if (v7 >> 4 != v17) {
      goto LABEL_33;
    }
    goto LABEL_22;
  }
  uint64_t v18 = 0;
  uint64_t v19 = v7 >> 4;
  __int16 v20 = (char *)(16 * (v7 >> 4));
  int v21 = 0;
  if (!(v7 >> 4))
  {
LABEL_22:
    if (v7 < 1)
    {
      if (v6 == a2) {
        unint64_t v23 = 1;
      }
      else {
        unint64_t v23 = v7 >> 3;
      }
      if (v23 >> 60) {
        sub_634C();
      }
      __int16 v24 = (char *)operator new(16 * v23);
      __int16 v20 = &v24[16 * (v23 >> 2)];
      int v21 = &v24[16 * v23];
      if (v18)
      {
        operator delete(v18);
        int v6 = *a1;
      }
    }
    else
    {
      if (v19 >= -1) {
        unint64_t v22 = v19 + 1;
      }
      else {
        unint64_t v22 = v19 + 2;
      }
      v20 -= 16 * (v22 >> 1);
    }
  }
LABEL_33:
  *(_OWORD *)__int16 v20 = *(_OWORD *)v3;
  unint64_t v25 = v20;
  if (v6 != v8)
  {
    uint64_t v26 = v8;
    unint64_t v27 = v20;
    do
    {
      unint64_t v25 = v27 - 16;
      *((_OWORD *)v27 - 1) = *((_OWORD *)v26 - 1);
      v26 -= 16;
      v27 -= 16;
    }
    while (v26 != v6);
  }
  CFStringRef v28 = a1[1];
  int64_t v29 = v28 - v8;
  if (v28 != v8) {
    memmove(v20 + 16, v8, v28 - v8);
  }
  unint64_t v30 = *a1;
  *a1 = v25;
  a1[1] = &v20[v29 + 16];
  a1[2] = v21;
  if (v30) {
    operator delete(v30);
  }
  return v20;
}

void sub_156A4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

ssize_t sub_156BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)(a1 + 152);
  int v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 152) + 16))(a1 + 152);
  int v6 = v5;
  int v8 = (char *)v4[12];
  uint64_t v7 = (char *)v4[13];
  if (v8 == v7)
  {
LABEL_4:
    ++*(_DWORD *)(a1 + 272);
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  while (*(void *)v8 != a2)
  {
    v8 += 16;
    if (v8 == v7) {
      goto LABEL_4;
    }
  }
  int64_t v9 = v7 - (v8 + 16);
  if (v7 != v8 + 16) {
    memmove(v8, v8 + 16, v7 - (v8 + 16));
  }
  *(void *)(a1 + 256) = &v8[v9];
  ++*(_DWORD *)(a1 + 272);
  if (v6) {
LABEL_9:
  }
    (*(void (**)(void *))(*v4 + 24))(v4);
LABEL_10:
  __int buf = 88;
  return write(*(_DWORD *)(a1 + 244), &__buf, 1uLL);
}

void sub_157D4(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  int v5 = *(unsigned char **)a3;
  if ((a2 & 1) == 0 && (v5[25] & 0x80) != 0)
  {
    *(_DWORD *)(a3 + 12) |= a4;
    uint64_t v7 = *(__CFRunLoopTimer **)(a1 + 280);
    double Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v7, Current);
  }
  else
  {
    uint64_t v6 = a1 + 152;
    sub_6B9C(a1 + 152);
    (*(void (**)(unsigned char *, uint64_t))(*(void *)v5 + 16))(v5, a4);
    sub_6AC4(v6);
  }
}

uint64_t sub_15890(void *a1, int a2)
{
  uint64_t v4 = __cxa_begin_catch(a1);
  if (a2 == 2) {
    sub_158E4(v4[66]);
  }
  __cxa_end_catch();
  return sub_6AC4(v2);
}

void sub_158D0(_Unwind_Exception *a1)
{
}

void sub_158E4(unsigned int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_4DA0((char *)&v2, a1);
    strlcpy(__dst, (const char *)&v2, 0x100uLL);
    int v2 = 136315650;
    CFStringRef v3 = "SocketServer.cpp";
    __int16 v4 = 1024;
    int v5 = 75;
    __int16 v6 = 2080;
    uint64_t v7 = __dst;
    _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s\n", (uint8_t *)&v2, 0x1Cu);
  }
}

void sub_159C8(uint64_t a1)
{
  int v29 = *(_DWORD *)(a1 + 240);
  uint64_t v2 = a1 + 152;
  sub_6AC4(a1 + 152);
  if (*(unsigned char *)(a1 + 136)) {
    goto LABEL_2;
  }
  int v28 = 1 << v29;
  unint64_t v27 = (unint64_t)v29 >> 5;
  while (1)
  {
    memset(&v31, 0, sizeof(v31));
    memset(&v30, 0, sizeof(v30));
    if (__darwin_check_fd_set_overflow(v29, &v31, 0)) {
      v31.fds_bits[v27] |= v28;
    }
    uint64_t v4 = *(void *)(a1 + 248);
    uint64_t v3 = *(void *)(a1 + 256);
    int v5 = v29;
    while (v4 != v3)
    {
      if (!*(_DWORD *)(v4 + 12))
      {
        int v6 = *(_DWORD *)(*(void *)v4 + 24);
        unint64_t v7 = *(int *)(*(void *)v4 + 16);
        if ((v6 & 3) != 0)
        {
          if (__darwin_check_fd_set_overflow(*(_DWORD *)(*(void *)v4 + 16), &v31, 0)) {
            *(__int32_t *)((char *)v31.fds_bits + ((v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
          }
          if ((int)v7 > v5) {
            int v5 = v7;
          }
        }
        if ((v6 & 4) != 0 && !*(unsigned char *)(v4 + 8))
        {
          if (__darwin_check_fd_set_overflow(v7, &v30, 0)) {
            *(__int32_t *)((char *)v30.fds_bits + ((v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
          }
          if ((int)v7 > v5) {
            int v5 = v7;
          }
        }
      }
      v4 += 16;
      uint64_t v3 = *(void *)(a1 + 256);
    }
    sub_6B9C(v2);
    int v8 = select(v5 + 1, &v31, &v30, 0, 0);
    sub_6AC4(v2);
    if (v8 != -1)
    {
      int64_t v9 = *(char **)(a1 + 248);
      if (v9 != *(char **)(a1 + 256))
      {
        int v10 = *(_DWORD *)(a1 + 272);
        do
        {
          while (1)
          {
            int v11 = *(_DWORD *)(*(void *)v9 + 24);
            int v12 = *(_DWORD *)(*(void *)v9 + 16);
            if (__darwin_check_fd_set_overflow(v12, &v31, 0)
              && ((*(unsigned int *)((char *)v31.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v12) & 1) != 0)
            {
              if (v11) {
                uint64_t v13 = 1;
              }
              else {
                uint64_t v13 = 2;
              }
              uint64_t v14 = *(void *)v9;
              if ((*(unsigned char *)(*(void *)v9 + 25) & 0x80) != 0)
              {
                *((_DWORD *)v9 + 3) |= v13;
                uint64_t v15 = *(__CFRunLoopTimer **)(a1 + 280);
                CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
                CFRunLoopTimerSetNextFireDate(v15, Current);
              }
              else
              {
                sub_6B9C(v2);
                (*(void (**)(uint64_t, uint64_t))(*(void *)v14 + 16))(v14, v13);
                sub_6AC4(v2);
              }
            }
            if (__darwin_check_fd_set_overflow(v12, &v30, 0)
              && ((*(unsigned int *)((char *)v30.fds_bits + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v12) & 1) != 0)
            {
              v9[8] = 1;
              uint64_t v17 = *(void *)v9;
              if ((*(unsigned char *)(*(void *)v9 + 25) & 0x80) != 0)
              {
                *((_DWORD *)v9 + 3) |= 4u;
                uint64_t v18 = *(__CFRunLoopTimer **)(a1 + 280);
                CFAbsoluteTime v19 = CFAbsoluteTimeGetCurrent();
                CFRunLoopTimerSetNextFireDate(v18, v19);
              }
              else
              {
                sub_6B9C(v2);
                (*(void (**)(uint64_t, uint64_t))(*(void *)v17 + 16))(v17, 4);
                sub_6AC4(v2);
              }
            }
            __int16 v20 = *(char **)(a1 + 256);
            if (*(_DWORD *)(a1 + 272) != v10) {
              break;
            }
            v9 += 16;
            if (v9 == v20) {
              goto LABEL_47;
            }
          }
          int64_t v9 = *(char **)(a1 + 248);
          if (v20 == v9) {
            break;
          }
          unint64_t v21 = (v20 - v9) >> 4;
          do
          {
            unint64_t v22 = v21 >> 1;
            unint64_t v23 = (uint64_t *)&v9[16 * (v21 >> 1)];
            uint64_t v25 = *v23;
            __int16 v24 = (char *)(v23 + 2);
            v21 += ~(v21 >> 1);
            if (*(_DWORD *)(v25 + 16) <= v12) {
              int64_t v9 = v24;
            }
            else {
              unint64_t v21 = v22;
            }
          }
          while (v21);
          int v10 = *(_DWORD *)(a1 + 272);
        }
        while (v9 != v20);
      }
LABEL_47:
      if (__darwin_check_fd_set_overflow(v29, &v31, 0) && (v31.fds_bits[v27] & v28) != 0) {
        read(v29, buf, 0x20uLL);
      }
      goto LABEL_4;
    }
    if (*__error() != 9) {
      break;
    }
LABEL_4:
    if (*(unsigned char *)(a1 + 136)) {
      goto LABEL_2;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v26 = *__error();
    *(_DWORD *)int buf = 136315650;
    int v33 = "SocketServer.cpp";
    __int16 v34 = 1024;
    int v35 = 153;
    __int16 v36 = 1024;
    int v37 = v26;
    _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d select failed: %d\n", buf, 0x18u);
  }
LABEL_2:
  sub_6B9C(v2);
}

void sub_15FAC(_Unwind_Exception *a1)
{
}

void sub_15FD0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    JUMPOUT(0x15FD4);
  }
  _Unwind_Resume(a1);
}

void sub_15FDC(uint64_t a1)
{
  uint64_t v2 = a1 + 152;
  sub_6AC4(a1 + 152);
  uint64_t v4 = *(char **)(a1 + 248);
  uint64_t v3 = *(char **)(a1 + 256);
  if (v4 == v3) {
    goto LABEL_24;
  }
  char v5 = 0;
  int v6 = *(_DWORD *)(a1 + 272);
  do
  {
    while (1)
    {
      while (1)
      {
        int v7 = *((_DWORD *)v4 + 3);
        if (v7) {
          break;
        }
        v4 += 16;
        if (v4 == v3) {
          goto LABEL_22;
        }
      }
      int v8 = *(_DWORD *)(*(void *)v4 + 16);
      *((_DWORD *)v4 + 3) = 0;
      if ((v7 & 1) == 0) {
        break;
      }
      sub_157D4(a1, 1, (uint64_t)v4, 1);
      if ((v7 & 4) != 0) {
        goto LABEL_14;
      }
LABEL_8:
      int v9 = *(_DWORD *)(a1 + 272);
      uint64_t v3 = *(char **)(a1 + 256);
      if (v9 != v6) {
        goto LABEL_15;
      }
LABEL_9:
      v4 += 16;
      char v5 = 1;
      if (v4 == v3) {
        goto LABEL_22;
      }
    }
    if ((v7 & 2) != 0)
    {
      sub_157D4(a1, 1, (uint64_t)v4, 2);
      if ((v7 & 4) != 0) {
        goto LABEL_14;
      }
      goto LABEL_8;
    }
    if ((v7 & 4) == 0) {
      goto LABEL_8;
    }
LABEL_14:
    sub_157D4(a1, 1, (uint64_t)v4, 4);
    int v9 = *(_DWORD *)(a1 + 272);
    uint64_t v3 = *(char **)(a1 + 256);
    if (v9 == v6) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v4 = *(char **)(a1 + 248);
    if (v3 == v4) {
      goto LABEL_23;
    }
    unint64_t v10 = (v3 - v4) >> 4;
    do
    {
      unint64_t v11 = v10 >> 1;
      int v12 = &v4[16 * (v10 >> 1)];
      uint64_t v14 = *(void *)v12;
      uint64_t v13 = v12 + 16;
      v10 += ~(v10 >> 1);
      if (*(_DWORD *)(v14 + 16) <= v8) {
        uint64_t v4 = v13;
      }
      else {
        unint64_t v10 = v11;
      }
    }
    while (v10);
    char v5 = 1;
    int v6 = v9;
  }
  while (v4 != v3);
LABEL_22:
  if ((v5 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_23:
  __int buf = 88;
  write(*(_DWORD *)(a1 + 244), &__buf, 1uLL);
LABEL_24:
  sub_6B9C(v2);
}

uint64_t *sub_16154(uint64_t *result, unsigned int a2, uint64_t a3, char *a4)
{
  int v7 = result;
  unsigned int v8 = *a4;
  if (*a4 > -17)
  {
    switch(*a4)
    {
      case -15:
        char v14 = *((unsigned char *)result + 56);
        unsigned int v15 = a4[1];
        unsigned int v16 = v15 >> 4;
        if (v15 >> 4 == ((v14 + 1) & 7))
        {
          int v17 = ((v15 & 0xF) << (4 * v16)) | *((_DWORD *)result + 16);
          if (v15 > 0x6F)
          {
            *((_DWORD *)result + 15) = v17;
            char v18 = v14 & 0x98 | 0x47;
            int v17 = 0;
LABEL_84:
            *((unsigned char *)result + 56) = v18;
            *((_DWORD *)result + 16) = v17;
            *((_DWORD *)result + 17) = a2;
            uint64_t v51 = result[9];
            if (v51)
            {
              double v52 = (double)(unint64_t)(a3 - v51);
              double v53 = v52 * 0.0000000416666667;
              if (v52 * 0.0000000416666667 > 0.0420833333 || v53 < 0.002)
              {
                result[10] = 0;
              }
              else
              {
                double v54 = *((double *)result + 10);
                if (v54 <= 0.0) {
                  *((double *)result + 10) = v53;
                }
                else {
                  *((double *)result + 10) = v52 * 0.00000000416666667 + v54 * 0.9;
                }
              }
            }
            result[9] = a3;
            return result;
          }
        }
        else
        {
          char v14 = 7;
          *((unsigned char *)result + 56) = 7;
          *(uint64_t *)((char *)result + 60) = 0;
          *(uint64_t *)((char *)result + 76) = 0;
          *(uint64_t *)((char *)result + 68) = 0;
          *((_DWORD *)result + 21) = 0;
          if (v15 > 0xF) {
            return result;
          }
          int v17 = (a4[1] & 0xF) << (4 * v16);
        }
        char v18 = v16 | v14 & 0xF8 | 0x20;
        goto LABEL_84;
      case -14:
        *((_DWORD *)result + 8) = a2;
        *((_DWORD *)result + 7) = a4[1] | (a4[2] << 7);
        *((unsigned char *)result + 25) = 1;
        return result;
      case -8:
        if ((result[3] & 0x40) != 0)
        {
          ++*((_DWORD *)result + 7);
          *((_DWORD *)result + 8) = a2;
          *((unsigned char *)result + 25) = 1;
        }
        uint64_t v38 = result[5];
        if (v38)
        {
          double v39 = (double)(unint64_t)(a3 - v38);
          if (60000000.0 / v39 >= 40.0 && 60000000.0 / v39 <= 500.0)
          {
            double v55 = *((double *)result + 6);
            if (v55 <= 0.0) {
              double v56 = v39 * 0.0000000416666667;
            }
            else {
              double v56 = v39 * 0.00000000416666667 + v55 * 0.9;
            }
            *((double *)result + 6) = v56;
          }
          else
          {
            result[6] = 0;
          }
        }
        result[5] = a3;
        return result;
      case -6:
        *((_DWORD *)result + 7) = 0;
        *((_DWORD *)result + 8) = a2;
        *((unsigned char *)result + 25) = 1;
        goto LABEL_47;
      case -5:
        *((_DWORD *)result + 8) = a2;
LABEL_47:
        char v41 = *((unsigned char *)result + 24) | 0x40;
        goto LABEL_49;
      case -4:
        *((_DWORD *)result + 8) = a2;
        char v41 = result[3] & 0xBF;
LABEL_49:
        *((unsigned char *)result + 24) = v41;
        return result;
      default:
        return result;
    }
  }
  int v9 = v8 & 0xF;
  if (v8 > 0x9F)
  {
    unsigned int v19 = v8 >> 4;
    switch(v19)
    {
      case 0xAu:
        unsigned __int8 v4 = a4[2];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF | (a4[1] << 16) | 0x700;
        if (v20) {
          goto LABEL_57;
        }
        goto LABEL_76;
      case 0xBu:
        unsigned __int8 v4 = a4[2];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF | (a4[1] << 16) | 0x100;
        if (!v20) {
          goto LABEL_76;
        }
        goto LABEL_57;
      case 0xCu:
        unsigned __int8 v4 = a4[1];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF;
        if (v20) {
          goto LABEL_57;
        }
        goto LABEL_76;
      case 0xDu:
        unsigned __int8 v4 = a4[1];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00F9FF | 0x600;
        if (!v20) {
          goto LABEL_76;
        }
        goto LABEL_57;
      case 0xEu:
        unsigned __int8 v4 = a4[1];
        unsigned __int8 v5 = a4[2];
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FCFF | 0x300;
        if (!v20) {
          goto LABEL_76;
        }
        goto LABEL_57;
      default:
        unint64_t v21 = result + 1;
        uint64_t v20 = result[1];
        unsigned int v22 = v9 & 0xFF00FFFF | (v19 << 16);
        if (v20)
        {
LABEL_57:
          unsigned int v42 = bswap32(v22);
          long long v43 = v21;
          uint64_t v44 = v20;
          do
          {
            unsigned int v45 = bswap32(*(_DWORD *)(v44 + 28));
            BOOL v46 = v45 >= v42;
            if (v45 >= v42) {
              int v47 = (uint64_t *)v44;
            }
            else {
              int v47 = (uint64_t *)(v44 + 8);
            }
            if (v46) {
              long long v43 = (void *)v44;
            }
            uint64_t v44 = *v47;
          }
          while (*v47);
          if (v43 != v21 && v42 >= bswap32(*((_DWORD *)v43 + 7)))
          {
            *((unsigned char *)v43 + 32) = v4;
            *((unsigned char *)v43 + 33) = v5;
            *((_DWORD *)v43 + 9) = a2;
            *((_DWORD *)v43 + 10) = a2;
            return result;
          }
          do
          {
            while (1)
            {
              int v48 = (void *)v20;
              unsigned int v49 = bswap32(*(_DWORD *)(v20 + 28));
              if (v42 >= v49) {
                break;
              }
              uint64_t v20 = *(void *)v20;
              unint64_t v21 = v48;
              if (!*v48) {
                goto LABEL_77;
              }
            }
            if (v49 >= v42) {
              return result;
            }
            uint64_t v20 = *(void *)(v20 + 8);
          }
          while (v20);
          unint64_t v21 = v48 + 1;
        }
        else
        {
LABEL_76:
          int v48 = v21;
        }
LABEL_77:
        int v35 = operator new(0x30uLL);
        v35[7] = v22;
        *((unsigned char *)v35 + 32) = v4;
        *((unsigned char *)v35 + 33) = v5;
        v35[9] = a2;
        v35[10] = a2;
        *(void *)int v35 = 0;
        *((void *)v35 + 1) = 0;
        *((void *)v35 + 2) = v48;
        void *v21 = v35;
        uint64_t v50 = *(void **)*v7;
        if (!v50) {
          goto LABEL_79;
        }
        uint64_t *v7 = (uint64_t)v50;
        int v37 = (uint64_t *)*v21;
        break;
    }
    goto LABEL_80;
  }
  if (v8 < 0x90)
  {
    BOOL v10 = 1;
    int v12 = result + 1;
    uint64_t v11 = result[1];
    int v13 = v9 | (a4[1] << 16);
    if (!v11) {
      goto LABEL_24;
    }
LABEL_14:
    unsigned int v23 = bswap32(v13 | 0x400);
    __int16 v24 = v12;
    uint64_t v25 = v11;
    do
    {
      unsigned int v26 = bswap32(*(_DWORD *)(v25 + 28));
      BOOL v27 = v26 >= v23;
      if (v26 >= v23) {
        int v28 = (uint64_t *)v25;
      }
      else {
        int v28 = (uint64_t *)(v25 + 8);
      }
      if (v27) {
        __int16 v24 = (uint64_t *)v25;
      }
      uint64_t v25 = *v28;
    }
    while (*v28);
    if (v24 != v12 && v23 >= bswap32(*((_DWORD *)v24 + 7)))
    {
      if (v10)
      {
        *((_DWORD *)v24 + 10) = a2;
      }
      else
      {
        *((unsigned char *)v24 + 32) = a4[2];
        *(uint64_t *)((char *)v24 + 36) = a2;
      }
      return result;
    }
    goto LABEL_24;
  }
  BOOL v10 = a4[2] == 0;
  int v12 = result + 1;
  uint64_t v11 = result[1];
  int v13 = v9 | (a4[1] << 16);
  if (v11) {
    goto LABEL_14;
  }
LABEL_24:
  if (v10)
  {
    unsigned __int8 v29 = 0;
    unsigned int v30 = a2;
    unsigned int v31 = v13 | 0x400;
    uint64_t v32 = v12;
    if (!v11)
    {
LABEL_34:
      int v35 = operator new(0x30uLL);
      v35[7] = v31;
      *((unsigned char *)v35 + 32) = v29;
      v35[9] = a2;
      v35[10] = v30;
      *(void *)int v35 = 0;
      *((void *)v35 + 1) = 0;
      *((void *)v35 + 2) = v32;
      *int v12 = (uint64_t)v35;
      __int16 v36 = *(void **)*v7;
      if (v36)
      {
        uint64_t *v7 = (uint64_t)v36;
        int v37 = (uint64_t *)*v12;
      }
      else
      {
LABEL_79:
        int v37 = (uint64_t *)v35;
      }
LABEL_80:
      ssize_t result = sub_18510((uint64_t *)v7[1], v37);
      ++v7[2];
      return result;
    }
  }
  else
  {
    unsigned int v30 = 0;
    unsigned __int8 v29 = a4[2];
    unsigned int v31 = v13 | 0x400;
    uint64_t v32 = v12;
    if (!v11) {
      goto LABEL_34;
    }
  }
  unsigned int v33 = bswap32(v31);
  while (1)
  {
    while (1)
    {
      uint64_t v32 = (uint64_t *)v11;
      unsigned int v34 = bswap32(*(_DWORD *)(v11 + 28));
      if (v33 >= v34) {
        break;
      }
      uint64_t v11 = *v32;
      int v12 = v32;
      if (!*v32) {
        goto LABEL_34;
      }
    }
    if (v34 >= v33) {
      return result;
    }
    uint64_t v11 = v32[1];
    if (!v11)
    {
      int v12 = v32 + 1;
      goto LABEL_34;
    }
  }
}

uint64_t sub_167F4(uint64_t a1, unsigned int a2, int a3, char *a4, int a5)
{
  *a4 = 0x80;
  *(_WORD *)(a4 + 1) = bswap32(a2) >> 16;
  int v114 = a3 - 1;
  unsigned int v8 = *(_DWORD *)(a1 + 32);
  unsigned int v9 = *(_DWORD *)(a1 + 68);
  BOOL v10 = v9 >= a2;
  if (v9 >= a2) {
    char v11 = (16 * (v8 >= a2)) | 8;
  }
  else {
    char v11 = 16 * (v8 >= a2);
  }
  BOOL v12 = v10 || v8 >= a2;
  int v13 = a4 + 3;
  if (v12)
  {
    char v14 = *a4 | 0x40;
    *a4 = v14;
    int v13 = a4 + 5;
    char v15 = v11 | 0x80;
    if (v8 < a2) {
      goto LABEL_18;
    }
    if (*(_DWORD *)(a1 + 32) == v114)
    {
      v14 &= ~0x80u;
      *a4 = v14;
      char v15 = v11;
      int v16 = *(unsigned __int8 *)(a1 + 24);
      unsigned int v17 = *(_DWORD *)(a1 + 28);
      if ((v17 & 0x70000) != 0) {
        goto LABEL_15;
      }
    }
    else
    {
      int v16 = *(unsigned __int8 *)(a1 + 24) | 0x80;
      unsigned int v17 = *(_DWORD *)(a1 + 28);
      if ((v17 & 0x70000) != 0) {
        goto LABEL_15;
      }
    }
    if (!*(unsigned char *)(a1 + 25))
    {
LABEL_16:
      a4[5] = v16;
      if ((v16 & 0x10) != 0)
      {
        int v13 = a4 + 8;
        *((_WORD *)a4 + 3) = bswap32(v17) >> 16;
        if ((v15 & 8) == 0) {
          goto LABEL_28;
        }
        goto LABEL_21;
      }
      int v13 = a4 + 6;
LABEL_18:
      if ((v15 & 8) == 0) {
        goto LABEL_28;
      }
LABEL_21:
      if (*(_DWORD *)(a1 + 68) == v114)
      {
        v15 &= ~0x80u;
        *a4 = v14 & 0x7F;
        char v18 = *(unsigned char *)(a1 + 56);
        char v19 = v18;
        *int v13 = v18;
        uint64_t v20 = v13 + 1;
        if ((v18 & 0x40) != 0) {
          goto LABEL_23;
        }
      }
      else
      {
        char v21 = *(unsigned char *)(a1 + 56) | 0x80;
        char v19 = v21;
        *int v13 = v21;
        uint64_t v20 = v13 + 1;
        if ((v21 & 0x40) != 0)
        {
LABEL_23:
          *(_DWORD *)(v13 + 1) = bswap32(*(_DWORD *)(a1 + 60));
          v13 += 5;
          if ((v19 & 0x20) == 0) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      int v13 = v20;
      if ((v19 & 0x20) != 0)
      {
LABEL_27:
        unsigned int v22 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)int v13 = bswap32((v22 << 20) & 0xF000000 | (v22 << 28) | (((v22 >> 8) & 0xF) << 20) | ((unsigned __int16)v22 >> 12 << 16) | (v22 >> 4) & 0xF000 | (v22 >> 12) & 0xF00 | (v22 >> 20) & 0xF0 | (v22 >> 28));
        v13 += 4;
      }
LABEL_28:
      __int16 v23 = (_WORD)v13 - ((_WORD)a4 + 3);
      a4[3] = HIBYTE(v23) & 3 | v15;
      a4[4] = v23;
      goto LABEL_29;
    }
LABEL_15:
    v16 |= HIWORD(v17) & 7 | 0x10;
    goto LABEL_16;
  }
LABEL_29:
  uint64_t v25 = (void *)(a1 + 8);
  __int16 v24 = *(void **)a1;
  if (*(void *)a1 == a1 + 8) {
    return (v13 - a4);
  }
  unsigned int v26 = 0;
  unsigned __int8 v112 = -1;
  unint64_t v113 = (unint64_t)&a4[a5];
  while (2)
  {
    while (1)
    {
      unsigned int v28 = *((_DWORD *)v24 + 10);
      BOOL v29 = v28 >= a2 || v28 == 0;
      if (v29) {
        break;
      }
      unsigned int v30 = (void *)v24[1];
      unsigned int v31 = v30;
      uint64_t v32 = v24;
      if (v30)
      {
        do
        {
          unsigned int v33 = v31;
          unsigned int v31 = (void *)*v31;
        }
        while (v31);
      }
      else
      {
        do
        {
          unsigned int v33 = (void *)v32[2];
          BOOL v29 = *v33 == (void)v32;
          uint64_t v32 = v33;
        }
        while (!v29);
      }
      unsigned int v34 = v24;
      if (v30)
      {
        do
        {
          int v35 = v30;
          unsigned int v30 = (void *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          int v35 = (void *)v34[2];
          BOOL v29 = *v35 == (void)v34;
          unsigned int v34 = v35;
        }
        while (!v29);
      }
      if (*(void **)a1 == v24) {
        *(void *)a1 = v35;
      }
      BOOL v27 = *(uint64_t **)(a1 + 8);
      --*(void *)(a1 + 16);
      sub_186C4(v27, v24);
      operator delete(v24);
      __int16 v24 = v33;
      if (v33 == v25)
      {
LABEL_229:
        LODWORD(v38) = v13;
        goto LABEL_230;
      }
    }
    __int16 v36 = (char *)v24 + 28;
    int v37 = *((unsigned __int8 *)v24 + 28);
    if (v37 == v112)
    {
      uint64_t v38 = v13;
    }
    else
    {
      uint64_t v38 = v13 + 3;
      if ((unint64_t)(v13 + 3) >= v113) {
        goto LABEL_229;
      }
      if ((*a4 & 0x20) != 0)
      {
        unsigned int v40 = bswap32((*(unsigned __int16 *)v26 << 8) & 0xFC00 | (v13 - v26)) >> 16;
        *(_WORD *)unsigned int v26 = v40;
        if ((v40 & 0x80) != 0) {
          char v41 = *a4;
        }
        else {
          char v41 = *a4 & 0x7F;
        }
        char v39 = v41 + 1;
      }
      else
      {
        char v39 = *a4 | 0x20;
      }
      *a4 = v39;
      *int v13 = (8 * v37) | 0x80;
      *(_WORD *)(v13 + 1) = 0;
      unsigned __int8 v112 = v37;
      unsigned int v26 = v13;
    }
    int v42 = *((_DWORD *)v24 + 9);
    if (v42 == v114) {
      char v43 = 0;
    }
    else {
      char v43 = 0x80;
    }
    switch(*((unsigned char *)v24 + 29))
    {
      case 0:
        uint64_t v44 = v38 + 3;
        if ((unint64_t)(v38 + 3) < v113)
        {
          v26[2] |= 0x80u;
          *uint64_t v38 = *((unsigned char *)v24 + 32) | v43;
          *(_WORD *)(v38 + 1) = 0;
          unsigned int v45 = (void *)v24[1];
          if (v45)
          {
            do
            {
              BOOL v46 = v45;
              unsigned int v45 = (void *)*v45;
            }
            while (v45);
          }
          else
          {
            do
            {
              BOOL v46 = (void *)v24[2];
              BOOL v29 = *v46 == (void)v24;
              __int16 v24 = v46;
            }
            while (!v29);
          }
          goto LABEL_172;
        }
        goto LABEL_230;
      case 1:
        if ((unint64_t)(v38 + 3) < v113)
        {
          int v111 = v37;
          v26[2] |= 0x40u;
          *uint64_t v38 = v43;
          int v47 = v38 + 1;
          if (v42 == v114) {
            *v26 &= ~0x80u;
          }
          while (1)
          {
            *int v47 = *((unsigned char *)v24 + 30) | v43;
            v47[1] = *((unsigned char *)v24 + 32);
            int v48 = (void *)v24[1];
            unsigned int v49 = v24;
            if (v48)
            {
              do
              {
                __int16 v24 = v48;
                int v48 = (void *)*v48;
              }
              while (v48);
            }
            else
            {
              do
              {
                __int16 v24 = (void *)v49[2];
                BOOL v29 = *v24 == (void)v49;
                unsigned int v49 = v24;
              }
              while (!v29);
            }
            uint64_t v50 = v47 + 2;
            if (v24 == v25) {
              goto LABEL_235;
            }
            while (1)
            {
              unsigned int v52 = *((_DWORD *)v24 + 10);
              if (v52 >= a2 || v52 == 0) {
                break;
              }
              double v54 = (void *)v24[1];
              double v55 = v54;
              double v56 = v24;
              if (v54)
              {
                do
                {
                  char v57 = v55;
                  double v55 = (void *)*v55;
                }
                while (v55);
              }
              else
              {
                do
                {
                  char v57 = (void *)v56[2];
                  BOOL v29 = *v57 == (void)v56;
                  double v56 = v57;
                }
                while (!v29);
              }
              unsigned int v58 = v24;
              if (v54)
              {
                do
                {
                  uint64_t v59 = v54;
                  double v54 = (void *)*v54;
                }
                while (v54);
              }
              else
              {
                do
                {
                  uint64_t v59 = (void *)v58[2];
                  BOOL v29 = *v59 == (void)v58;
                  unsigned int v58 = v59;
                }
                while (!v29);
              }
              if (*(void **)a1 == v24) {
                *(void *)a1 = v59;
              }
              uint64_t v51 = *(uint64_t **)(a1 + 8);
              --*(void *)(a1 + 16);
              sub_186C4(v51, v24);
              operator delete(v24);
              __int16 v24 = v57;
              if (v57 == v25) {
                goto LABEL_235;
              }
            }
            if (*((unsigned __int8 *)v24 + 28) != v111 || *((unsigned char *)v24 + 29) != 1) {
              goto LABEL_228;
            }
            if ((unint64_t)(v47 + 5) >= v113) {
              goto LABEL_235;
            }
            char v61 = *v38;
            if (*((_DWORD *)v24 + 9) == v114)
            {
              char v43 = 0;
              *uint64_t v38 = (v61 & 0x7F) + 1;
              *v26 &= ~0x80u;
            }
            else
            {
              *uint64_t v38 = v61 + 1;
              char v43 = 0x80;
            }
            v47 += 2;
          }
        }
        goto LABEL_230;
      case 3:
        uint64_t v44 = v38 + 2;
        if ((unint64_t)(v38 + 2) < v113)
        {
          v26[2] |= 0x10u;
          *uint64_t v38 = *((unsigned char *)v24 + 32) | v43;
          v38[1] = *((unsigned char *)v24 + 33);
          int v62 = (void *)v24[1];
          if (v62)
          {
            do
            {
              BOOL v46 = v62;
              int v62 = (void *)*v62;
            }
            while (v62);
          }
          else
          {
            do
            {
              BOOL v46 = (void *)v24[2];
              BOOL v29 = *v46 == (void)v24;
              __int16 v24 = v46;
            }
            while (!v29);
          }
          goto LABEL_172;
        }
        goto LABEL_230;
      case 4:
        uint64_t v50 = v38 + 2;
        if ((unint64_t)(v38 + 2) >= v113) {
          goto LABEL_230;
        }
        uint64_t v63 = v24 + 4;
        v115[0] = 0;
        v115[1] = 0;
        if (*((_DWORD *)v24 + 10) == v114) {
          char v64 = 0;
        }
        else {
          char v64 = 0x80;
        }
        v26[2] |= 8u;
        *(_WORD *)uint64_t v38 = -3712;
        int v65 = 1;
        int v66 = 15;
        if (*((unsigned char *)v24 + 32)) {
          goto LABEL_118;
        }
LABEL_122:
        unint64_t v67 = v36[2];
        *((unsigned char *)v115 + (v67 >> 3)) |= 0x80u >> (v67 & 7);
        if ((int)(v67 >> 3) < v66) {
          int v66 = v67 >> 3;
        }
        if (v65 <= (int)(v67 >> 3)) {
          int v65 = v67 >> 3;
        }
        if (!v64)
        {
          *v38 &= ~0x80u;
LABEL_128:
          *v26 &= ~0x80u;
        }
LABEL_129:
        int v109 = v65;
        int v110 = v66;
        v68 = (void *)v24[1];
        if (v68)
        {
          do
          {
            int v69 = v68;
            v68 = (void *)*v68;
          }
          while (v68);
        }
        else
        {
          do
          {
            int v69 = (void *)v24[2];
            BOOL v29 = *v69 == (void)v24;
            __int16 v24 = v69;
          }
          while (!v29);
        }
        if (v69 == v25)
        {
LABEL_214:
          __int16 v24 = (void *)(a1 + 8);
          char v96 = v109;
          unsigned int v95 = v110;
          uint64_t v97 = (v109 - v110);
          if (v109 < v110) {
            goto LABEL_228;
          }
          goto LABEL_215;
        }
        while (1)
        {
          unsigned int v71 = *((_DWORD *)v69 + 10);
          if (v71 >= a2 || v71 == 0) {
            break;
          }
          __int16 v73 = (void *)v69[1];
          unsigned int v74 = v73;
          uint64_t v75 = v69;
          if (v73)
          {
            do
            {
              int v76 = v74;
              unsigned int v74 = (void *)*v74;
            }
            while (v74);
          }
          else
          {
            do
            {
              int v76 = (void *)v75[2];
              BOOL v29 = *v76 == (void)v75;
              uint64_t v75 = v76;
            }
            while (!v29);
          }
          char v77 = v69;
          if (v73)
          {
            do
            {
              long long v78 = v73;
              __int16 v73 = (void *)*v73;
            }
            while (v73);
          }
          else
          {
            do
            {
              long long v78 = (void *)v77[2];
              BOOL v29 = *v78 == (void)v77;
              char v77 = v78;
            }
            while (!v29);
          }
          if (*(void **)a1 == v69) {
            *(void *)a1 = v78;
          }
          uint64_t v70 = *(uint64_t **)(a1 + 8);
          --*(void *)(a1 + 16);
          sub_186C4(v70, v69);
          operator delete(v69);
          int v69 = v76;
          if (v76 == v25) {
            goto LABEL_214;
          }
        }
        __int16 v36 = (char *)v69 + 28;
        if (*((unsigned __int8 *)v69 + 28) != v37 || *((unsigned char *)v69 + 29) != 4)
        {
          __int16 v24 = v69;
          char v96 = v109;
          unsigned int v95 = v110;
          uint64_t v97 = (v109 - v110);
          if (v109 < v110) {
            goto LABEL_228;
          }
LABEL_215:
          if ((unint64_t)&v50[(int)v97 + 1] >= v113) {
            goto LABEL_235;
          }
          v38[1] = v96 | (16 * v95);
          if ((v97 & 0x80000000) != 0)
          {
LABEL_228:
            uint64_t v38 = v50;
            goto LABEL_175;
          }
          int v98 = v97 + 1;
          v99 = (char *)v115 + v95;
          if (v97 >= 0x1F && v50 - (unsigned char *)v115 - (unint64_t)v95 >= 0x20)
          {
            uint64_t v102 = v97 + 1;
            v99 += v102 & 0x1FFFFFFE0;
            v98 -= v102 & 0xFFFFFFE0;
            uint64_t v38 = &v50[v102 & 0x1FFFFFFE0];
            v103 = v50 + 16;
            v104 = (long long *)((char *)&v115[2] + v95);
            uint64_t v105 = v102 & 0x1FFFFFFE0;
            do
            {
              long long v106 = *v104;
              *(v103 - 1) = *(v104 - 1);
              _OWORD *v103 = v106;
              v103 += 2;
              v104 += 2;
              v105 -= 32;
            }
            while (v105);
            if (v102 == (v102 & 0x1FFFFFFE0)) {
              goto LABEL_175;
            }
          }
          else
          {
            uint64_t v38 = v50;
          }
          unsigned int v100 = v98 + 1;
          do
          {
            char v101 = *v99++;
            *v38++ = v101;
            --v100;
          }
          while (v100 > 1);
LABEL_175:
          int v13 = v38;
          if (v24 == v25) {
            goto LABEL_230;
          }
          continue;
        }
        uint64_t v63 = v69 + 4;
        if (*((_DWORD *)v69 + 9) == v114) {
          char v43 = 0;
        }
        else {
          char v43 = 0x80;
        }
        if (v71 == v114) {
          char v64 = 0;
        }
        else {
          char v64 = 0x80;
        }
        __int16 v24 = v69;
        int v65 = v109;
        int v66 = v110;
        if (!*((unsigned char *)v69 + 32)) {
          goto LABEL_122;
        }
LABEL_118:
        if (*((_DWORD *)v63 + 2) >= *((_DWORD *)v63 + 1)) {
          goto LABEL_122;
        }
        ++*v38;
        if ((unint64_t)(v50 + 2) < v113)
        {
          *uint64_t v50 = v36[2] | v43;
          v50[1] = *((unsigned char *)v24 + 32);
          v50 += 2;
          if (!v43) {
            goto LABEL_128;
          }
          goto LABEL_129;
        }
LABEL_235:
        LODWORD(v38) = v50;
LABEL_230:
        if (v26)
        {
          unsigned int v107 = bswap32((*(unsigned __int16 *)v26 << 8) & 0xFC00 | (v38 - v26)) >> 16;
          *(_WORD *)unsigned int v26 = v107;
          LODWORD(v13) = v38;
          if ((v107 & 0x80) == 0)
          {
            *a4 &= ~0x80u;
            goto LABEL_233;
          }
        }
        else
        {
LABEL_233:
          LODWORD(v13) = v38;
        }
        return (v13 - a4);
      case 6:
        uint64_t v44 = v38 + 1;
        if ((unint64_t)(v38 + 1) >= v113) {
          goto LABEL_230;
        }
        *uint64_t v38 = *((unsigned char *)v24 + 32) | v43;
        long long v80 = (void *)v24[1];
        if (v80)
        {
          do
          {
            BOOL v46 = v80;
            long long v80 = (void *)*v80;
          }
          while (v80);
        }
        else
        {
          do
          {
            BOOL v46 = (void *)v24[2];
            BOOL v29 = *v46 == (void)v24;
            __int16 v24 = v46;
          }
          while (!v29);
        }
LABEL_172:
        if (v42 == v114) {
          *v26 &= ~0x80u;
        }
        __int16 v24 = v46;
        uint64_t v38 = v44;
        goto LABEL_175;
      case 7:
        if ((unint64_t)(v38 + 3) >= v113) {
          goto LABEL_230;
        }
        v26[2] |= 1u;
        *uint64_t v38 = v43;
        __int16 v81 = v38 + 1;
        if (v42 == v114) {
          *v26 &= ~0x80u;
        }
        while (2)
        {
          unsigned char *v81 = *((unsigned char *)v24 + 30) | v43;
          v81[1] = *((unsigned char *)v24 + 32);
          int v82 = (void *)v24[1];
          __int16 v83 = v24;
          if (v82)
          {
            do
            {
              __int16 v24 = v82;
              int v82 = (void *)*v82;
            }
            while (v82);
          }
          else
          {
            do
            {
              __int16 v24 = (void *)v83[2];
              BOOL v29 = *v24 == (void)v83;
              __int16 v83 = v24;
            }
            while (!v29);
          }
          if (v24 == v25) {
            goto LABEL_236;
          }
          while (1)
          {
            unsigned int v85 = *((_DWORD *)v24 + 10);
            if (v85 >= a2 || v85 == 0) {
              break;
            }
            long long v87 = (void *)v24[1];
            long long v88 = v87;
            unsigned int v89 = v24;
            if (v87)
            {
              do
              {
                unsigned int v90 = v88;
                long long v88 = (void *)*v88;
              }
              while (v88);
            }
            else
            {
              do
              {
                unsigned int v90 = (void *)v89[2];
                BOOL v29 = *v90 == (void)v89;
                unsigned int v89 = v90;
              }
              while (!v29);
            }
            __int16 v91 = v24;
            if (v87)
            {
              do
              {
                __int16 v92 = v87;
                long long v87 = (void *)*v87;
              }
              while (v87);
            }
            else
            {
              do
              {
                __int16 v92 = (void *)v91[2];
                BOOL v29 = *v92 == (void)v91;
                __int16 v91 = v92;
              }
              while (!v29);
            }
            if (*(void **)a1 == v24) {
              *(void *)a1 = v92;
            }
            uint64_t v84 = *(uint64_t **)(a1 + 8);
            --*(void *)(a1 + 16);
            sub_186C4(v84, v24);
            operator delete(v24);
            __int16 v24 = v90;
            if (v90 == v25) {
              goto LABEL_236;
            }
          }
          if (*((unsigned __int8 *)v24 + 28) == v37 && *((unsigned char *)v24 + 29) == 7)
          {
            if ((unint64_t)(v81 + 5) < v113)
            {
              char v94 = *v38;
              if (*((_DWORD *)v24 + 9) == v114)
              {
                char v43 = 0;
                *uint64_t v38 = (v94 & 0x7F) + 1;
                *v26 &= ~0x80u;
              }
              else
              {
                *uint64_t v38 = v94 + 1;
                char v43 = 0x80;
              }
              v81 += 2;
              continue;
            }
LABEL_236:
            LODWORD(v38) = v81 + 2;
            goto LABEL_230;
          }
          break;
        }
        uint64_t v38 = v81 + 2;
        goto LABEL_175;
      default:
        goto LABEL_175;
    }
  }
}

uint64_t sub_173FC(uint64_t a1, unsigned __int16 *a2, unsigned int a3, MIDITimeStamp time, uint64_t a5)
{
  char v10 = *(unsigned char *)a2;
  BOOL v12 = (unsigned __int8 *)(a2 + 1);
  int v11 = *a2;
  if ((*(unsigned char *)a2 & 0x10) == 0) {
    goto LABEL_17;
  }
  char v13 = *v12;
  if ((*v12 & 0x10) != 0)
  {
    unsigned int v14 = (bswap32(*(unsigned __int16 *)((char *)a2 + 3)) >> 16) & 0xFFF8FFFF | ((v13 & 7) << 16);
    BOOL v12 = (unsigned __int8 *)a2 + 5;
    char v15 = *(unsigned char *)(a1 + 24);
    if ((v13 & 0x40) != 0) {
      goto LABEL_4;
    }
  }
  else
  {
    unsigned int v14 = 0;
    BOOL v12 = (unsigned __int8 *)a2 + 3;
    char v15 = *(unsigned char *)(a1 + 24);
    if ((v13 & 0x40) != 0)
    {
LABEL_4:
      if ((v15 & 0x40) == 0)
      {
        if (v14)
        {
          Byte data = -14;
          char v46 = v14 & 0x7F;
          char v47 = (v14 >> 7) & 0x7F;
          sub_5F28(a5, time, 3, &data);
          sub_16154((uint64_t *)a1, a3, time, (char *)&data);
          Byte v16 = -5;
        }
        else
        {
          Byte v16 = -6;
        }
        goto LABEL_16;
      }
      uint64_t v17 = v14 - *(_DWORD *)(a1 + 28);
      if ((int)v17 >= 1)
      {
        double v18 = *(double *)(a1 + 48);
        if (v18 > 0.0)
        {
          int v42 = *a2;
          Byte data = -8;
          unint64_t v19 = (unint64_t)(v18 * 24000000.0);
          MIDITimeStamp v20 = time - v19 * v17;
          unsigned int v21 = v17 + 1;
          do
          {
            sub_5F28(a5, v20, 1, &data);
            sub_16154((uint64_t *)a1, a3, v20, (char *)&data);
            v20 += v19;
            --v21;
          }
          while (v21 > 1);
          int v11 = v42;
        }
      }
      goto LABEL_17;
    }
  }
  if ((v15 & 0x40) != 0)
  {
    Byte v16 = -4;
LABEL_16:
    Byte data = v16;
    sub_5F28(a5, time, 1, &data);
    sub_16154((uint64_t *)a1, a3, time, (char *)&data);
  }
LABEL_17:
  if ((v10 & 8) == 0) {
    return (uint64_t)a2 + (bswap32(v11 & 0xFFFFFF03) >> 16);
  }
  int v22 = *v12;
  unsigned int v23 = (v22 & 0x40) != 0 ? bswap32(*(_DWORD *)(v12 + 1)) : 0;
  if ((v22 & 0x40) == 0 || (*(unsigned char *)(a1 + 56) & 0x40) == 0 || *(double *)(a1 + 80) <= 0.0) {
    return (uint64_t)a2 + (bswap32(v11 & 0xFFFFFF03) >> 16);
  }
  sub_60CC((uint64_t)v44, (v23 >> 29) & 3);
  double v24 = *(double *)(a1 + 80);
  int v25 = (v22 + 1) & 7;
  unsigned int v41 = v23;
  if ((v22 & 0x40) != 0)
  {
    signed int v26 = v25 + 4 * sub_624C((uint64_t)v44, v23);
    int v43 = v11;
    int v30 = *(unsigned __int8 *)(a1 + 56);
    int v28 = (v30 + 1) & 7;
    if ((v30 & 0x40) != 0) {
      goto LABEL_26;
    }
LABEL_28:
    signed int v29 = v28 | 0xFFFFFFF8;
    goto LABEL_29;
  }
  signed int v26 = v25 | 0xFFFFFFF8;
  int v43 = v11;
  int v27 = *(unsigned __int8 *)(a1 + 56);
  int v28 = (v27 + 1) & 7;
  if ((v27 & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_26:
  signed int v29 = v28 + 4 * sub_624C((uint64_t)v44, *(_DWORD *)(a1 + 60));
LABEL_29:
  uint64_t v31 = (v26 - v29);
  if ((v31 - 1) <= 0x30)
  {
    int v40 = v25;
    char v32 = *(unsigned char *)(a1 + 56);
    uint64_t v33 = sub_6128((uint64_t)v44, *(unsigned int *)(a1 + 60), 2);
    if (v26 > v29)
    {
      uint64_t v34 = v33;
      char v35 = v32;
      unint64_t v36 = (unint64_t)(v24 * 24000000.0);
      LOBYTE(v37) = (v35 + 1) & 7;
      MIDITimeStamp v38 = time - v31 * v36;
      do
      {
        Byte data = -15;
        char v46 = (v34 >> (4 * v37)) & 0xF | (16 * v37);
        sub_5F28(a5, v38, 2, &data);
        sub_16154((uint64_t *)a1, a3, v38, (char *)&data);
        int v37 = ((_BYTE)v37 + 1) & 7;
        if (!v37) {
          uint64_t v34 = sub_6128((uint64_t)v44, v34, 2);
        }
        v38 += v36;
        LODWORD(v31) = v31 - 1;
      }
      while (v31);
    }
    if ((*(_DWORD *)(a1 + 60) != v41 || ((*(unsigned char *)(a1 + 56) + 1) & 7) != v40)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136315394;
      unsigned int v49 = "RecoveryJournal.cpp";
      __int16 v50 = 1024;
      int v51 = 640;
      _os_log_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d MTC recovery error\n", buf, 0x12u);
    }
  }
  int v11 = v43;
  return (uint64_t)a2 + (bswap32(v11 & 0xFFFFFF03) >> 16);
}

uint64_t *sub_1780C(uint64_t *result, char *a2, int a3, int a4, int a5, MIDITimeStamp time, uint64_t a7)
{
  uint64_t v7 = a7;
  char v10 = result;
  int v11 = (uint64_t *)(a2 + 3);
  unsigned int v128 = a5 - 1;
  char v12 = *a2;
  v127 = result;
  if (a5 - a4 != 1 || *a2 < 0)
  {
    if ((*a2 & 0x40) != 0)
    {
      ssize_t result = (uint64_t *)sub_173FC((uint64_t)result, (unsigned __int16 *)(a2 + 3), v128, time, a7);
      int v11 = result;
      char v12 = *a2;
    }
    unsigned int v48 = v128;
    if ((v12 & 0x20) == 0) {
      return result;
    }
    int v49 = 0;
    int v116 = (v12 & 0xF) + 1;
    __int16 v50 = v10 + 1;
    while (1)
    {
      int v118 = v49;
      int v51 = (unsigned __int8 *)v11 + 3;
      unsigned int v122 = *(unsigned __int8 *)v11;
      int v52 = (v122 >> 3) & 0xF;
      int v53 = *((char *)v11 + 2);
      if ((v53 & 0x80000000) == 0) {
        break;
      }
      uint64_t v54 = *v50;
      if (!*v50) {
        goto LABEL_89;
      }
      unsigned int v55 = v52 << 24;
      double v56 = v50;
      do
      {
        unsigned int v57 = bswap32(*(_DWORD *)(v54 + 28));
        BOOL v58 = v57 >= v55;
        if (v57 >= v55) {
          uint64_t v59 = (uint64_t *)v54;
        }
        else {
          uint64_t v59 = (uint64_t *)(v54 + 8);
        }
        if (v58) {
          double v56 = (void *)v54;
        }
        uint64_t v54 = *v59;
      }
      while (*v59);
      if (v56 == v50 || v55 < bswap32(*((_DWORD *)v56 + 7)) || *((unsigned char *)v56 + 32) != (*v51 & 0x7F))
      {
LABEL_89:
        Byte data = v52 | 0xC0;
        char v130 = *v51 & 0x7F;
        sub_5F28(v7, time, 2, &data);
        ssize_t result = sub_16154(v10, v48, time, (char *)&data);
      }
      int v51 = (unsigned __int8 *)v11 + 6;
      unsigned __int8 v124 = v53;
      if ((v53 & 0x40) != 0) {
        goto LABEL_96;
      }
LABEL_91:
      unsigned __int8 v60 = v124;
      if ((v124 & 0x10) != 0)
      {
        uint64_t v70 = *v50;
        if (!*v50) {
          goto LABEL_125;
        }
        unsigned int v71 = bswap32(v52 | 0x300);
        v72 = v50;
        do
        {
          unsigned int v73 = bswap32(*(_DWORD *)(v70 + 28));
          BOOL v74 = v73 >= v71;
          if (v73 >= v71) {
            uint64_t v75 = (uint64_t *)v70;
          }
          else {
            uint64_t v75 = (uint64_t *)(v70 + 8);
          }
          if (v74) {
            v72 = (void *)v70;
          }
          uint64_t v70 = *v75;
        }
        while (*v75);
        if (v72 == v50
          || v71 < bswap32(*((_DWORD *)v72 + 7))
          || *((unsigned char *)v72 + 32) != (*v51 & 0x7F)
          || *((unsigned __int8 *)v72 + 33) != v51[1])
        {
LABEL_125:
          Byte data = v52 | 0xE0;
          char v130 = *v51 & 0x7F;
          char v131 = v51[1];
          sub_5F28(v7, time, 3, &data);
          ssize_t result = sub_16154(v10, v48, time, (char *)&data);
        }
        v51 += 2;
        if ((v124 & 8) != 0)
        {
LABEL_127:
          v120 = (unsigned __int8 *)v11;
          unsigned int v114 = v51[1];
          int v76 = v51 + 2;
          int v77 = *v51 & 0x7F;
          if ((*v51 & 0x7F) == 0)
          {
LABEL_147:
            unsigned int v86 = v114 >> 4;
            unsigned int v87 = v114 & 0xF;
            if (v87 >= v114 >> 4)
            {
              uint64_t v115 = v87 - v86;
              int v88 = 8 * v86;
              unsigned int v89 = v76;
              do
              {
                int v91 = *v89++;
                int v90 = v91;
                if (v91)
                {
                  unsigned int v92 = 128;
                  do
                  {
                    if ((v92 & v90) != 0)
                    {
                      uint64_t v93 = *v50;
                      if (*v50)
                      {
                        unsigned int v94 = bswap32((v122 >> 3) & 0xF | ((v88 & 0x7F) << 16) | 0x400);
                        unsigned int v95 = v50;
                        do
                        {
                          unsigned int v96 = bswap32(*(_DWORD *)(v93 + 28));
                          BOOL v97 = v96 >= v94;
                          if (v96 >= v94) {
                            int v98 = (uint64_t *)v93;
                          }
                          else {
                            int v98 = (uint64_t *)(v93 + 8);
                          }
                          if (v97) {
                            unsigned int v95 = (void *)v93;
                          }
                          uint64_t v93 = *v98;
                        }
                        while (*v98);
                        if (v95 != v50
                          && v94 >= bswap32(*((_DWORD *)v95 + 7))
                          && *((unsigned char *)v95 + 32)
                          && *((_DWORD *)v95 + 10) < *((_DWORD *)v95 + 9))
                        {
                          Byte data = (v122 >> 3) | 0x90;
                          char v130 = v88;
                          char v131 = 0;
                          sub_5F28(a7, time, 3, &data);
                          ssize_t result = sub_16154(v127, v128, time, (char *)&data);
                        }
                      }
                    }
                    ++v88;
                    BOOL v39 = v92 >= 2;
                    v92 >>= 1;
                  }
                  while (v39);
                }
                else
                {
                  v88 += 8;
                }
                BOOL v31 = v86++ == v87;
              }
              while (!v31);
              int v51 = &v76[v115 + 1];
              uint64_t v7 = a7;
              char v10 = v127;
              unsigned int v48 = v128;
              int v11 = (uint64_t *)v120;
              unsigned __int8 v60 = v124;
              if ((v124 & 2) == 0) {
                goto LABEL_94;
              }
            }
            else
            {
              int v51 = v76;
              uint64_t v7 = a7;
              int v11 = (uint64_t *)v120;
              unsigned __int8 v60 = v124;
              if ((v124 & 2) == 0) {
                goto LABEL_94;
              }
            }
LABEL_173:
            uint64_t v99 = *v50;
            if (!*v50) {
              goto LABEL_185;
            }
            unsigned int v100 = bswap32(v52 | 0x600);
            char v101 = v50;
            do
            {
              unsigned int v102 = bswap32(*(_DWORD *)(v99 + 28));
              BOOL v103 = v102 >= v100;
              if (v102 >= v100) {
                v104 = (uint64_t *)v99;
              }
              else {
                v104 = (uint64_t *)(v99 + 8);
              }
              if (v103) {
                char v101 = (void *)v99;
              }
              uint64_t v99 = *v104;
            }
            while (*v104);
            if (v101 == v50 || v100 < bswap32(*((_DWORD *)v101 + 7)) || *((unsigned char *)v101 + 32) != (*v51 & 0x7F))
            {
LABEL_185:
              Byte data = (v122 >> 3) | 0xD0;
              char v130 = *v51 & 0x7F;
              sub_5F28(v7, time, 2, &data);
              ssize_t result = sub_16154(v10, v48, time, (char *)&data);
            }
            ++v51;
            if ((v60 & 1) == 0) {
              goto LABEL_73;
            }
LABEL_187:
            unsigned __int8 v106 = *v51;
            uint64_t v105 = v51 + 1;
            int v107 = v106 & 0x7F;
            do
            {
              uint64_t v108 = *v50;
              if (!*v50) {
                goto LABEL_188;
              }
              unsigned int v109 = bswap32((v122 >> 3) & 0xF | ((*v105 & 0x7F) << 16) | 0x700);
              int v110 = v50;
              do
              {
                unsigned int v111 = bswap32(*(_DWORD *)(v108 + 28));
                BOOL v112 = v111 >= v109;
                if (v111 >= v109) {
                  unint64_t v113 = (uint64_t *)v108;
                }
                else {
                  unint64_t v113 = (uint64_t *)(v108 + 8);
                }
                if (v112) {
                  int v110 = (void *)v108;
                }
                uint64_t v108 = *v113;
              }
              while (*v113);
              if (v110 == v50 || v109 < bswap32(*((_DWORD *)v110 + 7)) || *((unsigned char *)v110 + 32) != (v105[1] & 0x7F))
              {
LABEL_188:
                Byte data = v52 | 0xA0;
                char v130 = *v105 & 0x7F;
                char v131 = v105[1];
                sub_5F28(v7, time, 3, &data);
                ssize_t result = sub_16154(v10, v48, time, (char *)&data);
              }
              v105 += 2;
              BOOL v63 = v107-- <= 0;
            }
            while (!v63);
            goto LABEL_73;
          }
          while (2)
          {
            long long v78 = v76;
            int v79 = v51[2] & 0x7F;
            uint64_t v80 = *v50;
            if (!*v50) {
              goto LABEL_143;
            }
            unsigned int v81 = bswap32(v52 | (v79 << 16) | 0x400);
            int v82 = v50;
            do
            {
              unsigned int v83 = bswap32(*(_DWORD *)(v80 + 28));
              BOOL v84 = v83 >= v81;
              if (v83 >= v81) {
                unsigned int v85 = (uint64_t *)v80;
              }
              else {
                unsigned int v85 = (uint64_t *)(v80 + 8);
              }
              if (v84) {
                int v82 = (void *)v80;
              }
              uint64_t v80 = *v85;
            }
            while (*v85);
            if (v82 != v50
              && v81 >= bswap32(*((_DWORD *)v82 + 7))
              && *((unsigned char *)v82 + 32)
              && *((_DWORD *)v82 + 10) < *((_DWORD *)v82 + 9))
            {
              if (*((unsigned __int8 *)v82 + 32) != v51[3])
              {
                Byte data = (v122 >> 3) | 0x90;
                char v130 = v79;
                char v131 = 0;
                sub_5F28(v7, time, 3, &data);
                goto LABEL_144;
              }
            }
            else
            {
LABEL_143:
              Byte data = (v122 >> 3) | 0x90;
              char v130 = v79;
LABEL_144:
              char v131 = v51[3];
              sub_5F28(v7, time, 3, &data);
              ssize_t result = sub_16154(v10, v48, time, (char *)&data);
            }
            v76 += 2;
            int v51 = v78;
            BOOL v63 = v77-- <= 1;
            if (v63) {
              goto LABEL_147;
            }
            continue;
          }
        }
      }
      else if ((v124 & 8) != 0)
      {
        goto LABEL_127;
      }
      if ((v124 & 2) != 0) {
        goto LABEL_173;
      }
LABEL_94:
      if (v60) {
        goto LABEL_187;
      }
LABEL_73:
      int v11 = (uint64_t *)((char *)v11 + (bswap32(*(_WORD *)v11 & 0xFF03) >> 16));
      int v49 = v118 + 1;
      if (v118 + 1 == v116) {
        return result;
      }
    }
    unsigned __int8 v124 = *((unsigned char *)v11 + 2);
    if ((v53 & 0x40) == 0) {
      goto LABEL_91;
    }
LABEL_96:
    char v61 = *v51++;
    int v62 = v61 & 0x7F;
    do
    {
      uint64_t v64 = *v50;
      if (!*v50) {
        goto LABEL_97;
      }
      unsigned int v65 = bswap32((v122 >> 3) & 0xF | ((*v51 & 0x7F) << 16) | 0x100);
      int v66 = v50;
      do
      {
        unsigned int v67 = bswap32(*(_DWORD *)(v64 + 28));
        BOOL v68 = v67 >= v65;
        if (v67 >= v65) {
          int v69 = (uint64_t *)v64;
        }
        else {
          int v69 = (uint64_t *)(v64 + 8);
        }
        if (v68) {
          int v66 = (void *)v64;
        }
        uint64_t v64 = *v69;
      }
      while (*v69);
      if (v66 == v50 || v65 < bswap32(*((_DWORD *)v66 + 7)) || *((unsigned char *)v66 + 32) != (v51[1] & 0x7F))
      {
LABEL_97:
        Byte data = (v122 >> 3) | 0xB0;
        char v130 = *v51 & 0x7F;
        char v131 = v51[1];
        sub_5F28(v7, time, 3, &data);
        ssize_t result = sub_16154(v10, v48, time, (char *)&data);
      }
      v51 += 2;
      BOOL v63 = v62-- <= 0;
    }
    while (!v63);
    goto LABEL_91;
  }
  if ((*a2 & 0x40) != 0)
  {
    ssize_t result = (uint64_t *)sub_173FC((uint64_t)result, (unsigned __int16 *)(a2 + 3), v128, time, a7);
    int v11 = result;
    char v12 = *a2;
  }
  if ((v12 & 0x20) != 0)
  {
    int v13 = 0;
    int v121 = (v12 & 0xF) + 1;
    unsigned int v14 = v10 + 1;
    while (1)
    {
      Byte v16 = (char *)v11 + 3;
      unsigned int v15 = *(char *)v11;
      if ((v15 & 0x80000000) != 0) {
        goto LABEL_7;
      }
      int v17 = (v15 >> 3) & 0xF;
      int v18 = *((char *)v11 + 2);
      if (v18 < 0) {
        break;
      }
      unint64_t v19 = v127;
      unsigned int v20 = *(unsigned __int8 *)v11;
      unsigned __int8 v126 = *((unsigned char *)v11 + 2);
      unsigned int v117 = v20;
      if ((v18 & 0x40) != 0) {
        goto LABEL_15;
      }
LABEL_21:
      int v123 = v13;
      if ((v126 & 0x10) != 0)
      {
        if (((char)*v16 & 0x80000000) == 0)
        {
          Byte data = v17 | 0xE0;
          char v130 = *v16 & 0x7F;
          char v131 = v16[1];
          sub_5F28(v7, time, 3, &data);
          ssize_t result = sub_16154(v19, v128, time, (char *)&data);
        }
        v16 += 2;
      }
      v119 = (unsigned __int8 *)v11;
      if ((v126 & 8) != 0)
      {
        uint64_t v26 = *v16 & 0x7F;
        unsigned int v27 = v16[1];
        unsigned int v28 = v27 >> 4;
        uint64_t v29 = v27 & 0xF;
        if ((*v16 & 0x80) != 0)
        {
          if ((*v16 & 0x7F) != 0)
          {
            unsigned int v41 = v26 + 1;
            int v42 = v16;
            do
            {
              int v44 = (char)v42[2];
              v42 += 2;
              char v43 = v44;
              if ((v44 & 0x80000000) == 0)
              {
                Byte data = (v117 >> 3) | 0x90;
                char v130 = v43;
                char v131 = v16[3];
                sub_5F28(v7, time, 3, &data);
                ssize_t result = sub_16154(v127, v128, time, (char *)&data);
              }
              --v41;
              Byte v16 = v42;
            }
            while (v41 > 1);
          }
          else
          {
            int v42 = v16;
          }
          Byte v16 = &v42[v29 - v28 + 3];
          unint64_t v19 = v127;
        }
        else
        {
          v16 += 2 * v26 + 2;
          if (v28 <= v29)
          {
            int v30 = 8 * v28;
            do
            {
              int v33 = *v16++;
              int v32 = v33;
              if (v33)
              {
                unsigned int v34 = 128;
                do
                {
                  if ((v34 & v32) != 0)
                  {
                    uint64_t v35 = *v14;
                    if (*v14)
                    {
                      unsigned int v36 = bswap32(v17 & 0xFF80FFFF | ((v30 & 0x7F) << 16) | 0x400);
                      int v37 = v14;
                      do
                      {
                        unsigned int v38 = bswap32(*(_DWORD *)(v35 + 28));
                        BOOL v39 = v38 >= v36;
                        if (v38 >= v36) {
                          int v40 = (uint64_t *)v35;
                        }
                        else {
                          int v40 = (uint64_t *)(v35 + 8);
                        }
                        if (v39) {
                          int v37 = (void *)v35;
                        }
                        uint64_t v35 = *v40;
                      }
                      while (*v40);
                      if (v37 != v14
                        && v36 >= bswap32(*((_DWORD *)v37 + 7))
                        && *((unsigned char *)v37 + 32)
                        && *((_DWORD *)v37 + 10) < *((_DWORD *)v37 + 9))
                      {
                        Byte data = (v117 >> 3) | 0x90;
                        char v130 = v30;
                        char v131 = 0;
                        sub_5F28(a7, time, 3, &data);
                        ssize_t result = sub_16154(v127, v128, time, (char *)&data);
                      }
                    }
                  }
                  ++v30;
                  BOOL v39 = v34 >= 2;
                  v34 >>= 1;
                }
                while (v39);
              }
              else
              {
                v30 += 8;
              }
              BOOL v31 = v28++ == v29;
              unint64_t v19 = v127;
            }
            while (!v31);
          }
        }
      }
      if ((v126 & 2) != 0)
      {
        uint64_t v7 = a7;
        if (((char)*v16 & 0x80000000) == 0)
        {
          Byte data = (v117 >> 3) | 0xD0;
          char v130 = *v16 & 0x7F;
          sub_5F28(a7, time, 2, &data);
          ssize_t result = sub_16154(v19, v128, time, (char *)&data);
        }
        ++v16;
        int v11 = (uint64_t *)v119;
        int v13 = v123;
        if ((v126 & 1) == 0) {
          goto LABEL_7;
        }
LABEL_63:
        if (((char)*v16 & 0x80000000) == 0)
        {
          unsigned int v45 = v16 + 1;
          int v46 = *v16 + 1;
          do
          {
            if ((*v45 & 0x80000000) == 0)
            {
              Byte data = v17 | 0xA0;
              char v130 = *v45 & 0x7F;
              char v131 = v45[1];
              sub_5F28(v7, time, 3, &data);
              ssize_t result = sub_16154(v127, v128, time, (char *)&data);
            }
            v45 += 2;
            BOOL v47 = __OFSUB__(v46--, 1);
          }
          while (!((v46 < 0) ^ v47 | (v46 == 0)));
        }
        goto LABEL_7;
      }
      uint64_t v7 = a7;
      int v11 = (uint64_t *)v119;
      int v13 = v123;
      if (v126) {
        goto LABEL_63;
      }
LABEL_7:
      int v11 = (uint64_t *)((char *)v11 + (bswap32(*(_WORD *)v11 & 0xFF03) >> 16));
      if (++v13 == v121) {
        return result;
      }
    }
    int v21 = (char)*v16;
    unint64_t v19 = v127;
    if ((v21 & 0x80000000) == 0)
    {
      Byte data = v17 | 0xC0;
      char v130 = v21;
      sub_5F28(v7, time, 2, &data);
      ssize_t result = sub_16154(v127, v128, time, (char *)&data);
    }
    Byte v16 = (char *)v11 + 6;
    unsigned int v20 = v15;
    unsigned __int8 v126 = v18;
    unsigned int v117 = v15;
    if ((v18 & 0x40) == 0) {
      goto LABEL_21;
    }
LABEL_15:
    int v22 = (char)*v16;
    int v23 = v22 & 0x7F;
    if (v22 < 0)
    {
      v16 += (2 * (v23 + 1)) + 1;
    }
    else
    {
      ++v16;
      unsigned int v24 = (v20 >> 3) | 0xFFFFFFB0;
      unsigned int v25 = v23 + 2;
      do
      {
        if (((char)*v16 & 0x80000000) == 0)
        {
          Byte data = v24;
          char v130 = *v16 & 0x7F;
          char v131 = v16[1];
          sub_5F28(v7, time, 3, &data);
          ssize_t result = sub_16154(v19, v128, time, (char *)&data);
        }
        v16 += 2;
        --v25;
      }
      while (v25 > 1);
    }
    goto LABEL_21;
  }
  return result;
}

void sub_183E4(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 88) != a2)
  {
    unsigned __int8 v5 = (void *)(a1 + 8);
    unsigned __int8 v4 = *(void **)a1;
    if (*(void *)a1 != a1 + 8)
    {
      do
      {
        unsigned int v7 = *((_DWORD *)v4 + 10);
        unsigned int v8 = (void *)v4[1];
        BOOL v9 = v7 >= a2 || v7 == 0;
        if (v9)
        {
          if (v8)
          {
            do
            {
              char v10 = v8;
              unsigned int v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              char v10 = (void *)v4[2];
              BOOL v9 = *v10 == (void)v4;
              unsigned __int8 v4 = v10;
            }
            while (!v9);
          }
        }
        else
        {
          int v11 = (void *)v4[1];
          char v12 = v4;
          if (v8)
          {
            do
            {
              char v10 = v11;
              int v11 = (void *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              char v10 = (void *)v12[2];
              BOOL v9 = *v10 == (void)v12;
              char v12 = v10;
            }
            while (!v9);
          }
          int v13 = v4;
          if (v8)
          {
            do
            {
              unsigned int v14 = v8;
              unsigned int v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              unsigned int v14 = (void *)v13[2];
              BOOL v9 = *v14 == (void)v13;
              int v13 = v14;
            }
            while (!v9);
          }
          if (*(void **)a1 == v4) {
            *(void *)a1 = v14;
          }
          int v6 = *(uint64_t **)(a1 + 8);
          --*(void *)(a1 + 16);
          sub_186C4(v6, v4);
          operator delete(v4);
        }
        unsigned __int8 v4 = v10;
      }
      while (v10 != v5);
    }
    *(_DWORD *)(a1 + 88) = a2;
  }
}

uint64_t *sub_18510(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), unsigned __int8 v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        sockaddr v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *BOOL v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    unsigned char *v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    unsigned __int8 v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  int v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  uint64_t v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  *int v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t *sub_186C4(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_10;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (!v2)
  {
    int v5 = 1;
    int v6 = (uint64_t **)v3[2];
    uint64_t v7 = *v6;
    if (*v6 == v3) {
      goto LABEL_6;
    }
LABEL_11:
    v6[1] = (uint64_t *)v2;
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_10:
  int v5 = 0;
  *(void *)(v2 + 16) = v3[2];
  int v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 != v3) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t *v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    uint64_t v7 = v6[1];
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
LABEL_12:
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      ssize_t result = v3;
    }
    goto LABEL_16;
  }
  uint64_t v7 = 0;
  ssize_t result = (uint64_t *)v2;
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2) {
    goto LABEL_12;
  }
LABEL_16:
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
    uint64_t v14 = (uint64_t **)v7[2];
    if (*v14 == v7) {
      break;
    }
    if (*((unsigned char *)v7 + 24))
    {
      unsigned int v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    else
    {
      *((unsigned char *)v7 + 24) = 1;
      *((unsigned char *)v14 + 24) = 0;
      int v17 = v14[1];
      int v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18) {
        v18[2] = (uint64_t)v14;
      }
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (void)v14] = (uint64_t)v17;
      *int v17 = (uint64_t)v14;
      v14[2] = v17;
      if (result == (uint64_t *)*v7) {
        ssize_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
      unsigned int v15 = (void *)*v7;
      if (!*v7) {
        goto LABEL_38;
      }
    }
    if (!*((unsigned char *)v15 + 24))
    {
      unint64_t v19 = (uint64_t *)v7[1];
      if (!v19) {
        goto LABEL_64;
      }
LABEL_63:
      if (*((unsigned char *)v19 + 24))
      {
LABEL_64:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v23 = v15[1];
        uint64_t *v7 = v23;
        if (v23) {
          *(void *)(v23 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        _DWORD v7[2] = (uint64_t)v15;
        unint64_t v19 = v7;
      }
      else
      {
        unsigned int v15 = v7;
      }
      uint64_t v27 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v27 + 24);
      *(unsigned char *)(v27 + 24) = 1;
      *((unsigned char *)v19 + 24) = 1;
      unsigned int v28 = *(uint64_t **)(v27 + 8);
      uint64_t v29 = *v28;
      *(void *)(v27 + 8) = *v28;
      if (v29) {
        *(void *)(v29 + 16) = v27;
      }
      v28[2] = *(void *)(v27 + 16);
      *(void *)(*(void *)(v27 + 16) + 8 * (**(void **)(v27 + 16) != v27)) = v28;
      uint64_t *v28 = v27;
      *(void *)(v27 + 16) = v28;
      return result;
    }
LABEL_38:
    unint64_t v19 = (uint64_t *)v7[1];
    if (v19 && !*((unsigned char *)v19 + 24)) {
      goto LABEL_63;
    }
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      uint64_t v12 = result;
LABEL_61:
      *((unsigned char *)v12 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v12 + 24)) {
      goto LABEL_61;
    }
LABEL_24:
    uint64_t v7 = *(uint64_t **)(v12[2] + 8 * (*(void *)v12[2] == (void)v12));
  }
  if (*((unsigned char *)v7 + 24))
  {
    Byte v16 = (void *)*v7;
    if (!*v7) {
      goto LABEL_49;
    }
LABEL_48:
    if (!*((unsigned char *)v16 + 24)) {
      goto LABEL_67;
    }
  }
  else
  {
    *((unsigned char *)v7 + 24) = 1;
    *((unsigned char *)v14 + 24) = 0;
    unsigned int v20 = (uint64_t *)v7[1];
    *uint64_t v14 = v20;
    if (v20) {
      v20[2] = (uint64_t)v14;
    }
    _DWORD v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (void)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    v14[2] = v7;
    if (result == (uint64_t *)v14) {
      ssize_t result = v7;
    }
    uint64_t v7 = *v14;
    Byte v16 = (void *)**v14;
    if (v16) {
      goto LABEL_48;
    }
  }
LABEL_49:
  int v21 = (uint64_t *)v7[1];
  if (!v21 || *((unsigned char *)v21 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v12 = (uint64_t *)v7[2];
    if (*((unsigned char *)v12 + 24)) {
      BOOL v13 = v12 == result;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_61;
    }
    goto LABEL_24;
  }
  if (v16 && !*((unsigned char *)v16 + 24))
  {
LABEL_67:
    int v21 = v7;
  }
  else
  {
    *((unsigned char *)v21 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v22 = *v21;
    v7[1] = *v21;
    if (v22) {
      *(void *)(v22 + 16) = v7;
    }
    v21[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v21;
    uint64_t *v21 = (uint64_t)v7;
    _DWORD v7[2] = (uint64_t)v21;
    Byte v16 = v7;
  }
  unsigned int v24 = (uint64_t *)v21[2];
  *((unsigned char *)v21 + 24) = *((unsigned char *)v24 + 24);
  *((unsigned char *)v24 + 24) = 1;
  *((unsigned char *)v16 + 24) = 1;
  uint64_t v25 = *v24;
  uint64_t v26 = *(void *)(*v24 + 8);
  uint64_t *v24 = v26;
  if (v26) {
    *(void *)(v26 + 16) = v24;
  }
  *(void *)(v25 + 16) = v24[2];
  *(void *)(v24[2] + 8 * (*(void *)v24[2] != (void)v24)) = v25;
  *(void *)(v25 + 8) = v24;
  v24[2] = v25;
  return result;
}

void sub_18A88(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CAPThread::SetTimeConstraints: thread_policy_set failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

void sub_18B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18CB8(uint64_t a1, int a2)
{
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&def_13FA0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

uint64_t sub_18D4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

uint64_t sub_18D70(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 32))(a1);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return _CFBundleCopyLocalizedString(bundle, key, value, tableName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return _CFBundleGetBundleWithIdentifier(bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNetServiceCancel(CFNetServiceRef theService)
{
}

CFNetServiceRef CFNetServiceCreate(CFAllocatorRef alloc, CFStringRef domain, CFStringRef serviceType, CFStringRef name, SInt32 port)
{
  return _CFNetServiceCreate(alloc, domain, serviceType, name, port);
}

CFArrayRef CFNetServiceGetAddressing(CFNetServiceRef theService)
{
  return _CFNetServiceGetAddressing(theService);
}

Boolean CFNetServiceRegisterWithOptions(CFNetServiceRef theService, CFOptionFlags options, CFStreamError *error)
{
  return _CFNetServiceRegisterWithOptions(theService, options, error);
}

Boolean CFNetServiceResolveWithTimeout(CFNetServiceRef theService, CFTimeInterval timeout, CFStreamError *error)
{
  return _CFNetServiceResolveWithTimeout(theService, timeout, error);
}

void CFNetServiceScheduleWithRunLoop(CFNetServiceRef theService, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

Boolean CFNetServiceSetClient(CFNetServiceRef theService, CFNetServiceClientCallBack clientCB, CFNetServiceClientContext *clientContext)
{
  return _CFNetServiceSetClient(theService, clientCB, clientContext);
}

void CFNetServiceUnscheduleFromRunLoop(CFNetServiceRef theService, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

CFAbsoluteTime CFRunLoopTimerGetNextFireDate(CFRunLoopTimerRef timer)
{
  return _CFRunLoopTimerGetNextFireDate(timer);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

Boolean CFRunLoopTimerIsValid(CFRunLoopTimerRef timer)
{
  return _CFRunLoopTimerIsValid(timer);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

OSStatus MIDIClientCreate(CFStringRef name, MIDINotifyProc notifyProc, void *notifyRefCon, MIDIClientRef *outClient)
{
  return _MIDIClientCreate(name, notifyProc, notifyRefCon, outClient);
}

OSStatus MIDIDeviceCreate(MIDIDriverRef owner, CFStringRef name, CFStringRef manufacturer, CFStringRef model, MIDIDeviceRef *outDevice)
{
  return _MIDIDeviceCreate(owner, name, manufacturer, model, outDevice);
}

MIDIEntityRef MIDIDeviceGetEntity(MIDIDeviceRef device, ItemCount entityIndex0)
{
  return _MIDIDeviceGetEntity(device, entityIndex0);
}

ItemCount MIDIDeviceGetNumberOfEntities(MIDIDeviceRef device)
{
  return _MIDIDeviceGetNumberOfEntities(device);
}

MIDIDeviceRef MIDIDeviceListGetDevice(MIDIDeviceListRef devList, ItemCount index0)
{
  return _MIDIDeviceListGetDevice(devList, index0);
}

ItemCount MIDIDeviceListGetNumberOfDevices(MIDIDeviceListRef devList)
{
  return _MIDIDeviceListGetNumberOfDevices(devList);
}

OSStatus MIDIEndpointSetRefCons(MIDIEndpointRef endpt, void *ref1, void *ref2)
{
  return _MIDIEndpointSetRefCons(endpt, ref1, ref2);
}

MIDIEndpointRef MIDIEntityGetDestination(MIDIEntityRef entity, ItemCount destIndex0)
{
  return _MIDIEntityGetDestination(entity, destIndex0);
}

MIDIEndpointRef MIDIEntityGetSource(MIDIEntityRef entity, ItemCount sourceIndex0)
{
  return _MIDIEntityGetSource(entity, sourceIndex0);
}

OSStatus MIDIObjectGetDictionaryProperty(MIDIObjectRef obj, CFStringRef propertyID, CFDictionaryRef *outDict)
{
  return _MIDIObjectGetDictionaryProperty(obj, propertyID, outDict);
}

OSStatus MIDIObjectGetStringProperty(MIDIObjectRef obj, CFStringRef propertyID, CFStringRef *str)
{
  return _MIDIObjectGetStringProperty(obj, propertyID, str);
}

OSStatus MIDIObjectRemoveProperty(MIDIObjectRef obj, CFStringRef propertyID)
{
  return _MIDIObjectRemoveProperty(obj, propertyID);
}

OSStatus MIDIObjectSetDataProperty(MIDIObjectRef obj, CFStringRef propertyID, CFDataRef data)
{
  return _MIDIObjectSetDataProperty(obj, propertyID, data);
}

OSStatus MIDIObjectSetDictionaryProperty(MIDIObjectRef obj, CFStringRef propertyID, CFDictionaryRef dict)
{
  return _MIDIObjectSetDictionaryProperty(obj, propertyID, dict);
}

OSStatus MIDIObjectSetIntegerProperty(MIDIObjectRef obj, CFStringRef propertyID, SInt32 value)
{
  return _MIDIObjectSetIntegerProperty(obj, propertyID, value);
}

OSStatus MIDIObjectSetStringProperty(MIDIObjectRef obj, CFStringRef propertyID, CFStringRef str)
{
  return _MIDIObjectSetStringProperty(obj, propertyID, str);
}

MIDIPacket *__cdecl MIDIPacketListAdd(MIDIPacketList *pktlist, ByteCount listSize, MIDIPacket *curPacket, MIDITimeStamp time, ByteCount nData, const Byte *data)
{
  return _MIDIPacketListAdd(pktlist, listSize, curPacket, time, nData, data);
}

MIDIPacket *__cdecl MIDIPacketListInit(MIDIPacketList *pktlist)
{
  return _MIDIPacketListInit(pktlist);
}

OSStatus MIDIReceived(MIDIEndpointRef src, const MIDIPacketList *pktlist)
{
  return _MIDIReceived(src, pktlist);
}

OSStatus MIDISetupAddDevice(MIDIDeviceRef device)
{
  return _MIDISetupAddDevice(device);
}

uint64_t MIDITimerTaskCreate()
{
  return _MIDITimerTaskCreate();
}

uint64_t MIDITimerTaskDispose()
{
  return _MIDITimerTaskDispose();
}

uint64_t MIDITimerTaskSetNextWakeTime()
{
  return _MIDITimerTaskSetNextWakeTime();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MIDI::LegacyPacketList::create()
{
  return MIDI::LegacyPacketList::create();
}

uint64_t MIDI::LegacyPacketListDeleter::operator()()
{
  return MIDI::LegacyPacketListDeleter::operator()();
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

BOOL std::recursive_mutex::try_lock(std::recursive_mutex *this)
{
  return std::recursive_mutex::try_lock(this);
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return std::recursive_mutex::recursive_mutex(this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

uint64_t __udivti3()
{
  return ___udivti3();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return _pthread_attr_getschedparam(a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return _pthread_attr_setschedparam(a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setschedpolicy(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return _pthread_equal(a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int rand(void)
{
  return _rand();
}

uint64_t random(void)
{
  return _random();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}