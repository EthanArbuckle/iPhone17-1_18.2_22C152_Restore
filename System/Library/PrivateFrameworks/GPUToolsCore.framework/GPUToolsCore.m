uint64_t FBDecoder_DecodeArguments(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int v7;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  unint64_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned __int16 *v21;
  int v22;
  unsigned __int16 v23;
  int v24;
  char *v25;
  __int16 v26;
  char *v27;
  BOOL v28;
  int v29;
  int v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t result;
  unsigned int v35;
  unint64_t v36;
  char *v37;
  unint64_t v38;
  int v39;
  _DWORD *v40;

  v7 = a2;
  v9 = a2 + a3;
  v10 = *a1;
  v11 = (char *)(a2 + v10);
  v12 = (char *)memchr((void *)(a2 + v10), 0, a3 - v10);
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  v13 = v12;
  v39 = v7;
  v40 = a1;
  v14 = a1[1];
  v15 = v12 + 1;
  if (v11 == v12)
  {
LABEL_36:
    result = 0;
    *v40 = ((v15 + 3) & 0xFFFFFFFC) - v39;
    v40[1] = v14;
    return result;
  }
  while (1)
  {
    v16 = v14;
    if (v14 >= a5) {
      return 2;
    }
    v17 = (unint64_t *)(a4 + 16 * v14);
    v18 = a4 + 16 * v16;
    *(unsigned char *)(v18 + 11) = 0;
    v19 = (char *)(v18 + 11);
    v20 = a4 + 16 * v16;
    *(_WORD *)(v20 + 8) = 1;
    v21 = (unsigned __int16 *)(v20 + 8);
    v22 = *v11;
    if (v22 == 64)
    {
      v23 = 0;
      v25 = v11 + 1;
      v24 = v11[1];
      if (v11 + 1 != v13)
      {
        v26 = v24 - 48;
        if ((v24 - 48) <= 9)
        {
          v23 = 0;
          v27 = v11 + 2;
          do
          {
            v23 = v26 + 10 * v23;
            v28 = v27 == v13;
            v30 = *v27++;
            v29 = v30;
            if (v28) {
              break;
            }
            v26 = v29 - 48;
          }
          while ((v29 - 48) < 0xA);
          v25 = v27 - 1;
        }
      }
      *v19 = 1;
      v31 = v23;
      *v21 = v23;
      v22 = *v25;
      v32 = 3;
      v11 = v25;
    }
    else
    {
      v32 = 2;
      v31 = 1;
    }
    if (v22 == 117)
    {
      *v19 = v32;
      v33 = *++v11;
      LOBYTE(v22) = v33;
    }
    *(unsigned char *)(a4 + 16 * v16 + 10) = v22;
    result = 0xFFFFFFFFLL;
    if ((char)v22 <= 97)
    {
      if ((char)v22 != 67)
      {
        if ((char)v22 != 83 && (char)v22 != 85) {
          return result;
        }
        if (v9 - (unint64_t)v15 >= 8 && *v15 == 0xFFFFFFFFLL)
        {
          *v17 = 0;
          *v21 = 0;
          ++v15;
        }
        else
        {
          *v17 = (unint64_t)v15;
          v37 = (char *)memchr(v15, 0, v9 - (void)v15);
          if (!v37) {
            return 0xFFFFFFFFLL;
          }
          *v21 = (_WORD)v37 - (_WORD)v15;
          v15 = v37 + 1;
        }
        goto LABEL_31;
      }
    }
    else
    {
      v35 = (char)v22 - 98;
      if (v35 > 0x15) {
        return result;
      }
      if (((1 << v35) & 0x244404) == 0)
      {
        if (((1 << v35) & 0x90) != 0)
        {
          v38 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          *v17 = v38;
          v15 = (void *)(v38 + 4 * v31);
        }
        else
        {
          if ((char)v22 != 98) {
            return result;
          }
          *v17 = (unint64_t)v15;
          v15 = (void *)((char *)v15 + v31);
        }
        goto LABEL_31;
      }
    }
    v36 = ((unint64_t)v15 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    *v17 = v36;
    v15 = (void *)(v36 + 8 * v31);
LABEL_31:
    if (v9 < (unint64_t)v15) {
      return 0xFFFFFFFFLL;
    }
    if ((unint64_t)(v11 + 1) < v9 && v11[1] == 60) {
      v11 = (char *)memchr(v11 + 2, 62, v13 - (v11 + 2));
    }
    v14 = v16 + 1;
    if (++v11 == v13) {
      goto LABEL_36;
    }
  }
}

void GPUTools::Interpose::DYInterposeCommonInit(GPUTools::Interpose *this, DYGuestAppClient *(*a2)(void))
{
  int v2 = (int)a2;
  v4 = (void *)MEMORY[0x253361500]();
  if (GPUTools::Interpose::DYInterposeCommonInit(DYGuestAppClient * (*)(void),int)::onceToken != -1) {
    dispatch_once(&GPUTools::Interpose::DYInterposeCommonInit(DYGuestAppClient * (*)(void),int)::onceToken, &__block_literal_global);
  }
  uint64_t v5 = ((uint64_t (*)(void))this)();
  if (!v5) {
    dy_abort("platform initialization failed");
  }
  v6 = (void *)v5;
  DYSetGuestAppClient(v2, v5);
  dispatch_resume((dispatch_object_t)[v6 globalSyncQueue]);
  [v6 sendTimebaseUpdate];
  MainBundle = CFBundleGetMainBundle();
  uint64_t v8 = [(__CFURL *)CFBundleCopyBundleURL(MainBundle) path];
  if (!v8)
  {
    v13 = "bundlePath";
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  uint64_t v10 = [(__CFURL *)CFBundleCopyExecutableURL(MainBundle) path];
  if (!v10)
  {
    v13 = "executablePath";
LABEL_11:
    __assert_rtn("void GPUTools::Interpose::DYInterposeCommonInit(initializePlatform_fn, int)", "", 0, v13);
  }
  uint64_t v11 = v10;
  CFStringRef Identifier = CFBundleGetIdentifier(MainBundle);
  objc_msgSend(v6, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:payload:](DYTransportMessage, "messageWithKind:attributes:payload:", 1536, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithInt:", getpid()), @"pid", v9, @"path", v11, @"executable-path", Identifier, @"identifier", 0), 0));
}

char *___ZN8GPUTools9Interpose21DYInterposeCommonInitEPFP16DYGuestAppClientvEi_block_invoke()
{
  GPUTools::Interpose::gHostPort = MEMORY[0x253361360]();
  v0 = (GPUTools::Interpose *)mach_timebase_info((mach_timebase_info_t)&g_DYTimebaseInfo);

  return GPUTools::Interpose::DYFetchSandboxEntitlements(v0);
}

char *GPUTools::Interpose::DYFetchSandboxEntitlements(GPUTools::Interpose *this)
{
  if (getenv("DY_SANDBOX_SOCKET")) {
    sandbox_extension_consume();
  }
  result = getenv("DY_SANDBOX_GENERIC");
  if (result)
  {
    return (char *)sandbox_extension_consume();
  }
  return result;
}

DYUNIXDomainSocketTransport *GPUTools::Interpose::DYCreateTransport(GPUTools::Interpose *this, const char *a2)
{
  int v2 = getenv((const char *)this);
  if (!v2) {
    dy_abort("[create_transport] GT_HOST_URL environment not set");
  }
  v3 = v2;
  uint64_t v4 = [NSString stringWithCString:v2 encoding:4];
  if (!v4) {
    __assert_rtn("DYTransport *GPUTools::Interpose::DYCreateTransport(const char *)", "", 0, "url_str");
  }
  uint64_t v5 = (void *)[NSURL URLWithString:v4];
  if (!v5) {
    dy_abort("[create_transport] failed to parse GT_HOST_URL: %s", v3);
  }
  v6 = v5;
  v7 = (void *)[v5 scheme];
  if (([v7 isEqualToString:@"null"] & 1) == 0)
  {
    if ([v7 isEqualToString:@"file"])
    {
      uint64_t v9 = [[DYUNIXDomainSocketTransport alloc] initWithMode:1];
    }
    else
    {
      if (([v7 isEqualToString:@"dysmt"] & 1) == 0
        && ![v7 isEqualToString:@"dysmtdeferred"])
      {
        goto LABEL_16;
      }
      uint64_t v9 = [[DYSharedMemoryTransport alloc] initWithMode:1 uniqueIdentifier:0];
    }
    uint64_t v8 = v9;
    [(DYUNIXDomainSocketTransport *)v9 setUrl:v6];
    if (v8) {
      return v8;
    }
LABEL_16:
    dy_abort("[create_transport] failed to create transport; GT_HOST_URL: %s", v3);
  }
  return 0;
}

uint64_t (*GPUTools::Interpose::DYInterposeSetMessageDispatcher(uint64_t (*result)(GPUTools::Interpose *__hidden this, DYGuestAppClient *, GPUTools::FB::Stream *, const void *, unint64_t), uint64_t (*a2)(GPUTools::Interpose *__hidden this, DYGuestAppClient *, DYTransportMessage *, const char *, const void *, unint64_t)))(GPUTools::Interpose *__hidden this, DYGuestAppClient *, GPUTools::FB::Stream *, const void *, unint64_t)
{
  GPUTools::Interpose::sDispatcher = result;
  off_26BB20770 = a2;
  return result;
}

void GPUTools::Interpose::DYInterposeDefaultFlushStream(GPUTools::Interpose *this, DYGuestAppClient *a2, GPUTools::FB::Stream *a3, const void *a4)
{
  uint64_t v8 = (void *)MEMORY[0x253361500]();
  id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
  saveptrQueue = a2->_saveptrQueue;
  uint64_t v11 = [NSNumber numberWithBool:BYTE4(a2->_stopCaptureQueue) == 0];
  v12 = objc_msgSend(v9, "initWithObjectsAndKeys:", saveptrQueue, @"buffer name", v11, @"has pstream header", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)-[GPUTools::Interpose activeCaptureDescriptor](this, "activeCaptureDescriptor"), "sessionId")), @"capture serial", 0);
  v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  v14 = [[DYTransportMessage alloc] initWithKind:1792 attributes:v12 payload:v13];

  [(GPUTools::Interpose *)this sendTimebaseUpdate];
  [(GPUTools::Interpose *)this sendMessage:v14];
}

void GPUTools::Interpose::DYInterposeDefaultStorePointer(GPUTools::Interpose *this, DYGuestAppClient *a2, DYTransportMessage *a3, const char *a4, const void *a5)
{
  id v8 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
  -[GPUTools::Interpose sendCaptureData:name:inReplyTo:](this, "sendCaptureData:name:inReplyTo:", v8, [NSString stringWithUTF8String:a3], a2);
}

void GPUTools::Interpose::DYFlushFbufStream(GPUTools::Interpose *this, DYGuestAppClient *a2, Stream *a3)
{
  uint64_t v4 = this;
  transport = a2->_transport;
  if (BYTE4(a2->_stopCaptureQueue)) {
    v7 = (char *)((char *)a2->_source - (char *)transport - 8);
  }
  else {
    v7 = (char *)((char *)a2->_source - (char *)transport);
  }
  if (v7)
  {
    if (BYTE4(a2->_stopCaptureQueue)) {
      p_url = (DYTransport *)&transport->_url;
    }
    else {
      p_url = a2->_transport;
    }
    GPUTools::Interpose::sDispatcher(this, a2, (GPUTools::FB::Stream *)p_url, v7, v5);
  }
}

BOOL GPUTools::Interpose::DYSavePointer(GPUTools::Interpose *this, DYGuestAppClient *a2, void *data, char *__dst, char *a5, uint64_t a6, DYTransportMessage *a7, char a8, unsigned char *a9, BOOL *a10)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!a2 || !data)
  {
    strcpy(__dst, kDYNullURL[0]);
    return 0;
  }
  char v13 = (char)a7;
  CC_SHA256(data, (CC_LONG)a2, md);
  if ((unint64_t)a5 >= 0x41)
  {
    uint64_t v17 = 0;
    v18 = __dst;
    do
    {
      snprintf(v18, (size_t)a5, "%02x", md[v17++]);
      v18 += 2;
      a5 -= 2;
    }
    while (v17 != 32);
  }
  if ((v13 & 1) == 0 && (a8 & 1) == 0) {
    return 0;
  }
  if ([(GPUTools::Interpose *)this liveDebugging])
  {
    uint64_t v19 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:a2];
    -[GPUTools::Interpose sendCaptureData:name:inReplyTo:](this, "sendCaptureData:name:inReplyTo:", v19, [NSString stringWithUTF8String:__dst], 0);
    return 1;
  }
  else
  {
    *(void *)md = 0;
    v31 = md;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 1;
    v22 = [(GPUTools::Interpose *)this saveptrQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN8GPUTools9Interpose13DYSavePointerEP16DYGuestAppClientmPKvPcmP18DYTransportMessagebbPb_block_invoke;
    block[3] = &unk_265335C00;
    block[8] = __dst;
    block[9] = data;
    block[10] = a2;
    block[4] = this;
    block[5] = a6;
    block[6] = &v26;
    block[7] = md;
    char v25 = a8;
    dispatch_sync(v22, block);
    if (a9) {
      *a9 = *((unsigned char *)v27 + 24);
    }
    BOOL v20 = v31[24] != 0;
    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(md, 8);
  }
  return v20;
}

void sub_24F659A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools9Interpose13DYSavePointerEP16DYGuestAppClientmPKvPcmP18DYTransportMessagebbPb_block_invoke(uint64_t a1)
{
  id v6 = (id)[[NSString alloc] initWithCString:*(void *)(a1 + 64) encoding:1];
  int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "saveptrPtrInfoDict"), "objectForKey:", v6);
  uint64_t v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 72)];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ptrUrlInfoDict"), "objectForKeyedSubscript:", v3);
  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 compare:v6] != 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "ptrUrlInfoDict"), "setObject:forKeyedSubscript:", v6, v3);
  }
  if (v2)
  {
    if (!*(unsigned char *)(a1 + 88)) {
      [v2 incrementUsage];
    }
  }
  else
  {
    unint64_t v5 = [[BufferInfo alloc] initWithSize:*(void *)(a1 + 80) usage:1];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "saveptrPtrInfoDict"), "setObject:forKey:", v5, v6);
    ((void (*)(GPUTools::Interpose *, DYGuestAppClient *, DYTransportMessage *, const char *, const void *))off_26BB20770)(*(GPUTools::Interpose **)(a1 + 32), *(DYGuestAppClient **)(a1 + 40), (DYTransportMessage *)[v6 UTF8String], *(const char **)(a1 + 72), *(const void **)(a1 + 80));

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

uint64_t GPUTools::Interpose::DYStorePointer(GPUTools::Interpose *this, const void *a2, DYTransportMessage *a3, GPUTools::Interpose *a4, DYGuestAppClient *a5, DYTransportMessage *a6)
{
  return off_26BB20770(a4, a5, a3, (const char *)this, a2, (unint64_t)off_26BB20770);
}

Method GPUTools::Interpose::DYInstallObjCMethodOverrides(Method result)
{
  uint64_t v1 = *(void *)result;
  if (*((void *)result + 1) != *(void *)result)
  {
    int v2 = (uint64_t *)result;
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      result = class_getInstanceMethod(*(Class *)(v1 + v3), *(SEL *)(v1 + v3 + 8));
      if (result)
      {
        unint64_t v5 = result;
        **(void **)(*v2 + v3 + 16) = method_getImplementation(result);
        uint64_t v6 = *v2 + v3;
        if (!**(void **)(v6 + 16)) {
          __assert_rtn("void GPUTools::Interpose::DYInstallObjCMethodOverrides(const std::vector<DYObjCMethodOverride> &)", "", 0, "*overrides[i].original");
        }
        v7 = *(objc_class **)v6;
        id v8 = *(const char **)(v6 + 8);
        id v9 = *(void (**)(void))(v6 + 24);
        TypeEncoding = method_getTypeEncoding(v5);
        result = (Method)class_addMethod(v7, v8, v9, TypeEncoding);
        if ((result & 1) == 0) {
          result = (Method)method_setImplementation(v5, *(IMP *)(*v2 + v3 + 24));
        }
      }
      ++v4;
      uint64_t v1 = *v2;
      v3 += 32;
    }
    while (v4 < (v2[1] - *v2) >> 5);
  }
  return result;
}

void dy_abort(char *a1, ...)
{
  va_start(va, a1);
  __s[0] = 0;
  va_copy((va_list)&__s[1], va);
  vasprintf(__s, a1, va);
  if (__crashreporter_info__)
  {
    size_t v2 = strlen((const char *)__crashreporter_info__);
    size_t v3 = v2 + strlen(__s[0]) + 2;
    uint64_t v1 = (char *)malloc_type_malloc(v3, 0xBD3F99FDuLL);
    strlcpy(v1, (const char *)__crashreporter_info__, v3);
    strlcat(v1, "\n", v3);
    strlcat(v1, __s[0], v3);
    free(__s[0]);
  }
  else
  {
    uint64_t v1 = __s[0];
  }
  __crashreporter_info__ = (uint64_t)v1;
  syslog(3, "aborting: %s\n", v1);
  abort();
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_24F659F20(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t DYTimingBenchmark()
{
  MEMORY[0x270FA5388]();
  uint64_t v0 = 0;
  uint64_t v6 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v1 = mach_absolute_time();
    uint64_t v2 = mach_absolute_time() - v1;
    if (g_DYTimebaseInfo != dword_269A2916C) {
      uint64_t v2 = __udivti3();
    }
    *(void *)&v4[v0] = v2;
    v0 += 8;
  }
  while (v0 != 80008);
  qsort_b(v4, 0x2711uLL, 8uLL, &__block_literal_global_0);
  return v5;
}

uint64_t __DYTimingBenchmark_block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

void sub_24F65AE24(_Unwind_Exception *exception_object)
{
}

void sub_24F65AE54(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    if (a2 == 2)
    {
      *(void *)(v2 + 40) = 0;
      objc_end_catch();
    }
    JUMPOUT(0x24F65ADB8);
  }
  JUMPOUT(0x24F65AE48);
}

void dy_ProbesInit()
{
  uint64_t v0 = (void *)MEMORY[0x253361500]();
  g_signpostLog = MEMORY[0x263EF8440];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"GPUToolsPerfLogging"))g_signpostLog = (uint64_t)os_log_create("com.apple.gputools", "GPUToolsCore"); {
}
  }

void sub_24F65BE34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, std::random_device a13, std::random_device a14)
{
}

std::random_device *std::random_device::random_device[abi:ne180100](std::random_device *a1)
{
  std::string::basic_string[abi:ne180100]<0>(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__token.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_24F65BEA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_24F65CA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t smt_poll_thread_entry(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[1];
  size_t v3 = (void *)a1[2];
  snprintf(__str, 0x40uLL, "gputools.smt_poll.%p", a1);
  pthread_setname_np(__str);
  while (!*((unsigned char *)a1 + 24))
  {
    dispatch_sync(v2, v3);
    usleep(0x1F40u);
  }

  return 0;
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

uint64_t GPUTools::SM::ProcessStateSettingReturnCode(uint64_t result, int a2)
{
  switch(a2)
  {
    case 1:
      unsigned int v2 = 1;
      BOOL v3 = (result | 2) == 2;
      goto LABEL_4;
    case 2:
      BOOL v3 = result == 0;
      unsigned int v2 = 2;
LABEL_4:
      if (v3) {
        result = v2;
      }
      else {
        result = result;
      }
      break;
    case 3:
      if (result == 4) {
        result = 4;
      }
      else {
        result = 3;
      }
      break;
    case 4:
      result = 4;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GPUTools::FB::Stream::Stream(uint64_t a1, void *aBlock, const void *a3)
{
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 0;
  if (!aBlock) {
    __assert_rtn("GPUTools::FB::Stream::Stream(callback, callback)", "", 0, "flush_handler");
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 40) = _Block_copy(aBlock);
  if (a3) {
    *(void *)(a1 + 48) = _Block_copy(a3);
  }
  return a1;
}

{
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 0;
  if (!aBlock) {
    __assert_rtn("GPUTools::FB::Stream::Stream(callback, callback)", "", 0, "flush_handler");
  }
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 40) = _Block_copy(aBlock);
  if (a3) {
    *(void *)(a1 + 48) = _Block_copy(a3);
  }
  return a1;
}

GPUTools::FB::Stream *GPUTools::FB::Stream::Stream(GPUTools::FB::Stream *this, __CFData *a2)
{
  v5[4] = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_0;
  aBlock[4] = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 5) = _Block_copy(aBlock);
  *((void *)this + 6) = _Block_copy(v5);
  if (!a2) {
    __assert_rtn("GPUTools::FB::Stream::Stream(CFMutableDataRef)", "", 0, "data");
  }
  CFRetain(a2);
  return this;
}

{
  void v5[5];
  void aBlock[5];

  v5[4] = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_5;
  aBlock[4] = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_6;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((void *)this + 6) = 0;
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 5) = _Block_copy(aBlock);
  *((void *)this + 6) = _Block_copy(v5);
  if (!a2) {
    __assert_rtn("GPUTools::FB::Stream::Stream(CFMutableDataRef)", "", 0, "data");
  }
  CFRetain(a2);
  return this;
}

void sub_24F65DDC8(_Unwind_Exception *a1)
{
  GPUTools::FB::Stream::~Stream(v1);
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  CFIndex v3 = *(void *)(a2 + 16) - v2;
  BOOL v4 = *(unsigned char *)(a2 + 60) == 0;
  if (*(unsigned char *)(a2 + 60)) {
    size_t v5 = (const UInt8 *)(v2 + 8);
  }
  else {
    size_t v5 = *(const UInt8 **)(a2 + 8);
  }
  if (v4) {
    CFIndex v6 = v3;
  }
  else {
    CFIndex v6 = v3 - 8;
  }
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), v5, v6);
}

void ___ZN8GPUTools2FB6StreamC2EP8__CFData_block_invoke_2(uint64_t a1)
{
}

void GPUTools::FB::Stream::~Stream(GPUTools::FB::Stream *this)
{
  if (*((void *)this + 1))
  {
    while (atomic_exchange((atomic_uint *volatile)this + 14, 1u) == 1)
    {
      while (*((_DWORD *)this + 14) == 1)
        ;
    }
    if (!*((void *)this + 1)) {
      __assert_rtn("void GPUTools::FB::Stream::Close()", "", 0, "_bh.buffer != nullptr");
    }
    CFRelease(*((CFTypeRef *)this + 4));
    *((void *)this + 4) = 0;
    if (*(void *)this)
    {
      GPUTools::VMBuffer::~VMBuffer(*(GPUTools::VMBuffer **)this);
      MEMORY[0x253360DD0]();
    }
    *((unsigned char *)this + 60) = 0;
    *(_OWORD *)this = 0u;
    *((_OWORD *)this + 1) = 0u;
    atomic_store(0, (unsigned int *)this + 14);
  }
  uint64_t v2 = *((void *)this + 6);
  if (v2)
  {
    (*(void (**)(uint64_t, GPUTools::FB::Stream *))(v2 + 16))(v2, this);
    _Block_release(*((const void **)this + 6));
  }
  CFIndex v3 = (const void *)*((void *)this + 5);
  if (v3) {
    _Block_release(v3);
  }
}

void sub_24F65DF04(void *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  __clang_call_terminate(a1);
}

void sub_24F65E024(_Unwind_Exception *a1)
{
  GPUTools::FB::Stream::~Stream(v1);
  _Unwind_Resume(a1);
}

void ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  CFIndex v3 = *(void *)(a2 + 16) - v2;
  BOOL v4 = *(unsigned char *)(a2 + 60) == 0;
  if (*(unsigned char *)(a2 + 60)) {
    size_t v5 = (const UInt8 *)(v2 + 8);
  }
  else {
    size_t v5 = *(const UInt8 **)(a2 + 8);
  }
  if (v4) {
    CFIndex v6 = v3;
  }
  else {
    CFIndex v6 = v3 - 8;
  }
  CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), v5, v6);
}

void ___ZN8GPUTools2FB6StreamC1EP8__CFData_block_invoke_2(uint64_t a1)
{
}

uint64_t GPUTools::FB::Stream::Stream(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 0;
  return GPUTools::FB::Stream::operator=(a1, a2);
}

{
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 60) = 0;
  return GPUTools::FB::Stream::operator=(a1, a2);
}

uint64_t GPUTools::FB::Stream::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    while (atomic_exchange((atomic_uint *volatile)(a1 + 56), 1u) == 1)
    {
      while (*(_DWORD *)(a1 + 56) == 1)
        ;
    }
    while (atomic_exchange((atomic_uint *volatile)(a2 + 56), 1u) == 1)
    {
      while (*(_DWORD *)(a2 + 56) == 1)
        ;
    }
    while (atomic_exchange((atomic_uint *volatile)(a1 + 56), 1u) == 1)
    {
      while (*(_DWORD *)(a1 + 56) == 1)
        ;
    }
    if (!*(void *)(a1 + 8)) {
      __assert_rtn("void GPUTools::FB::Stream::Close()", "", 0, "_bh.buffer != nullptr");
    }
    CFRelease(*(CFTypeRef *)(a1 + 32));
    *(void *)(a1 + 32) = 0;
    if (*(void *)a1)
    {
      GPUTools::VMBuffer::~VMBuffer(*(GPUTools::VMBuffer **)a1);
      MEMORY[0x253360DD0]();
    }
    *(unsigned char *)(a1 + 60) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    atomic_store(0, (unsigned int *)(a1 + 56));
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = *(void *)(a2 + 8);
    uint64_t v4 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v4;
    *(unsigned char *)(a1 + 60) = *(unsigned char *)(a2 + 60);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(unsigned char *)(a2 + 60) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(void *)(a2 + 48) = 0;
    atomic_store(0, (unsigned int *)(a2 + 56));
    atomic_store(0, (unsigned int *)(a1 + 56));
  }
  return a1;
}

void sub_24F65E1FC(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  atomic_store(0, (unsigned int *)(v2 + 56));
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

double GPUTools::FB::Stream::Close(GPUTools::FB::Stream *this)
{
  while (atomic_exchange((atomic_uint *volatile)this + 14, 1u) == 1)
  {
    while (*((_DWORD *)this + 14) == 1)
      ;
  }
  if (!*((void *)this + 1)) {
    __assert_rtn("void GPUTools::FB::Stream::Close()", "", 0, "_bh.buffer != nullptr");
  }
  CFRelease(*((CFTypeRef *)this + 4));
  *((void *)this + 4) = 0;
  if (*(void *)this)
  {
    GPUTools::VMBuffer::~VMBuffer(*(GPUTools::VMBuffer **)this);
    MEMORY[0x253360DD0]();
  }
  *((unsigned char *)this + 60) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_24F65E2EC(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void GPUTools::FB::Stream::Open(GPUTools::FB::Stream *this, const __CFString *a2)
{
  while (atomic_exchange((atomic_uint *volatile)this + 14, 1u) == 1)
  {
    while (*((_DWORD *)this + 14) == 1)
      ;
  }
  if (a2)
  {
    if (!*((void *)this + 1)) {
      operator new();
    }
    uint64_t v2 = "_bh.buffer == nullptr";
  }
  else
  {
    uint64_t v2 = "filename";
  }
  __assert_rtn("BOOL GPUTools::FB::Stream::Open(CFStringRef)", "", 0, v2);
}

void sub_24F65E458(_Unwind_Exception *a1)
{
  MEMORY[0x253360DD0](v2, 0x1000C40EED21634);
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void sub_24F65E484(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void sub_24F65E490(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FB::Stream::Send(GPUTools::FB::Stream *this)
{
  while (atomic_exchange((atomic_uint *volatile)this + 14, 1u) == 1)
  {
    while (*((_DWORD *)this + 14) == 1)
      ;
  }
  char v2 = *((unsigned char *)this + 60);
  *((unsigned char *)this + 60) = 0;
  uint64_t result = (*(uint64_t (**)(void))(*((void *)this + 5) + 16))();
  *((unsigned char *)this + 60) = v2;
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_24F65E514(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void GPUTools::FB::Stream::WriteFunction(GPUTools::FB::Stream *this, const GPUTools::FD::Function *a2)
{
  char v2 = a2;
  unint64_t v4 = 0;
  size_t v5 = a2;
  do
  {
    ++v4;
    size_t v5 = (const GPUTools::FD::Function *)*((void *)v5 + 65);
  }
  while (v5);
  std::vector<GPUTools::FB::Fbuf>::vector(&v25, v4);
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = v25;
    GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v22, v2, 0);
    id v9 = (char **)&v7[v6];
    if (v24 >= 0) {
      uint64_t v10 = &v23;
    }
    else {
      uint64_t v10 = v23;
    }
    GPUTools::FB::Encode(v9, (GPUTools::FB::Fbuf *)*(unsigned int *)v2, *((_DWORD *)v2 + 1) & 0xFFFFFBC6, (uint64_t)v10, v22, v8);
    *((void *)*v9 + 2) = *((void *)v2 + 57);
    *((void *)*v9 + 3) = *((void *)v2 + 58);
    *((void *)*v9 + 1) = *((void *)v2 + 64);
    int v11 = *((_DWORD *)v2 + 1);
    if (v11)
    {
      GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v19, v2, 1);
      if (v21 >= 0) {
        char v13 = &v20;
      }
      else {
        char v13 = v20;
      }
      GPUTools::FB::Encode((char **)&v25[v6], (GPUTools::FB::Fbuf *)0xFFFFD000, 0, (uint64_t)v13, v19, v12);
      GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v19);
      int v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 8) != 0)
    {
      GPUTools::FB::EncodeStaticBacktrace((GPUTools::FB *)v9, *((GPUTools::FB::Fbuf **)v2 + 59), (unint64_t *)*((unsigned __int16 *)v2 + 240));
      int v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 0x10) != 0)
    {
      GPUTools::FB::EncodeGLError((GPUTools::FB *)v9, (GPUTools::FB::Fbuf *)*((unsigned __int16 *)v2 + 241));
      int v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 0x20) != 0)
    {
      GPUTools::FB::EncodePerfEvents((GPUTools::FB::Fbuf *)v9, *((_DWORD *)v2 + 121), *((const void **)v2 + 61), *((unsigned int *)v2 + 124));
      int v11 = *((_DWORD *)v2 + 1);
    }
    if ((v11 & 0x400) != 0) {
      GPUTools::FB::EncodeGCDQueueInfo((GPUTools::FB *)v9, *((GPUTools::FB::Fbuf **)v2 + 63), *((_DWORD *)v2 + 125));
    }
    char v2 = (const GPUTools::FD::Function *)*((void *)v2 + 65);
    GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider((GPUTools::FB::FunctionArgumentProvider *)v22);
    ++v6;
  }
  while (v2);
  GPUTools::FB::Stream::Writev_partial(this, v25, v4, 1);
  v14 = v25;
  if (v25)
  {
    v15 = v26;
    v16 = v25;
    if (v26 != v25)
    {
      do
      {
        var0 = v15[-1].var0.var0;
        --v15;
        uint64_t v17 = var0;
        if (var0) {
          free(v17);
        }
        v15->var0.var0 = 0;
        v15->var1 = 0;
        v15->var2 = 0;
      }
      while (v15 != v14);
      v16 = v25;
    }
    uint64_t v26 = v14;
    operator delete(v16);
  }
}

void sub_24F65E71C(_Unwind_Exception *a1)
{
  std::vector<GPUTools::FB::Fbuf>::~vector[abi:ne180100]((void **)(v1 - 104));
  _Unwind_Resume(a1);
}

void *std::vector<GPUTools::FB::Fbuf>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v3 = 3 * a2;
    unint64_t v4 = operator new(24 * a2);
    *a1 = v4;
    a1[1] = v4;
    size_t v5 = (char *)&v4[v3];
    a1[2] = &v4[v3];
    do
    {
      void *v4 = 0;
      v4[1] = 0;
      *((_DWORD *)v4 + 4) = 0;
      v4 += 3;
      v3 -= 3;
    }
    while (v3 * 8);
    a1[1] = v5;
  }
  return a1;
}

void sub_24F65E7FC(_Unwind_Exception *exception_object)
{
  if (*(void *)v1) {
    std::vector<GPUTools::FB::Fbuf>::vector((void **)(v1 + 8), *(char **)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void **std::vector<GPUTools::FB::Fbuf>::~vector[abi:ne180100](void **a1)
{
  char v2 = (char *)*a1;
  if (*a1)
  {
    uint64_t v3 = (char *)a1[1];
    unint64_t v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v3 - 3);
        v3 -= 24;
        size_t v5 = v6;
        if (v6) {
          free(v5);
        }
        *(void *)uint64_t v3 = 0;
        *((void *)v3 + 1) = 0;
        *((_DWORD *)v3 + 4) = 0;
      }
      while (v3 != v2);
      unint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

double GPUTools::FB::Stream::Write_nolock(GPUTools::FB::Stream *this, Fbuf *a2, size_t __n, int a4)
{
  size_t v4 = *((void *)this + 3);
  if (__n > v4) {
    dy_abort("fbuf exceeded capacity of fbuf stream by %lu bytes", __n - v4);
  }
  uint64_t v10 = *((void *)this + 1);
  id v9 = (void *)*((void *)this + 2);
  if ((unint64_t)v9 + __n - v10 - 8 > v4)
  {
    (*(void (**)(void))(*((void *)this + 5) + 16))();
    id v9 = (void *)(*((void *)this + 1) + 8);
    *((void *)this + 2) = v9;
    *((unsigned char *)this + 60) = 1;
  }
  memcpy(v9, a2->var0.var0, __n);
  *((void *)this + 2) += __n;
  if (a4)
  {
    var0 = a2->var0.var0;
    a2->var1 = a2->var0.var0;
    if (a2->var2 >= 0x24)
    {
      var0[8] = 0;
      double result = 0.0;
      *(_OWORD *)var0 = 0u;
      *((_OWORD *)var0 + 1) = 0u;
    }
  }
  return result;
}

void *GPUTools::FB::Stream::Writev_nopartial(GPUTools::FB::Stream *this, Fbuf *a2, uint64_t a3, char a4)
{
  uint64_t v5 = a3;
  uint64_t v6 = a2;
  if (!a3)
  {
    unint64_t v8 = 0;
    if (atomic_exchange((atomic_uint *volatile)this + 14, 1u) != 1) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (a3 == 1)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0;
LABEL_9:
    uint64_t v14 = a3 - v9;
    v15 = &a2[v9];
    do
    {
      var0 = (unsigned int *)v15->var0.var0;
      ++v15;
      v8 += *var0;
      --v14;
    }
    while (v14);
    goto LABEL_11;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v9 = a3 & 0xFFFFFFFFFFFFFFFELL;
  unint64_t v12 = a3 & 0xFFFFFFFFFFFFFFFELL;
  char v13 = a2;
  do
  {
    v10 += *(unsigned int *)v13->var0.var0;
    v11 += *(unsigned int *)v13[1].var0.var0;
    v13 += 2;
    v12 -= 2;
  }
  while (v12);
  unint64_t v8 = v11 + v10;
  if (v9 != a3) {
    goto LABEL_9;
  }
LABEL_11:
  unint64_t v17 = *((void *)this + 3);
  BOOL v18 = v8 >= v17;
  uint64_t v19 = v8 - v17;
  if (v19 != 0 && v18) {
    dy_abort("fbufs exceeded capacity of fbuf stream by %lu bytes", v19);
  }
  while (atomic_exchange((atomic_uint *volatile)this + 14, 1u) == 1)
  {
LABEL_13:
    while (*((_DWORD *)this + 14) == 1)
      ;
  }
LABEL_15:
  double result = (void *)*((void *)this + 2);
  if ((unint64_t)result + v8 - *((void *)this + 1) - 8 > *((void *)this + 3))
  {
    (*(void (**)(void))(*((void *)this + 5) + 16))();
    double result = (void *)(*((void *)this + 1) + 8);
    *((void *)this + 2) = result;
    *((unsigned char *)this + 60) = 1;
    if (!v5) {
      goto LABEL_23;
    }
  }
  else if (!a3)
  {
    goto LABEL_23;
  }
  if (a4)
  {
    do
    {
      size_t v21 = *(unsigned int *)v6->var0.var0;
      double result = memcpy(*((void **)this + 2), v6->var0.var0, v21);
      *((void *)this + 2) += v21;
      v22 = v6->var0.var0;
      v6->var1 = v6->var0.var0;
      if (v6->var2 >= 0x24)
      {
        v22[8] = 0;
        *(_OWORD *)v22 = 0u;
        *((_OWORD *)v22 + 1) = 0u;
      }
      ++v6;
      --v5;
    }
    while (v5);
  }
  else
  {
    do
    {
      v23 = (unsigned int *)v6->var0.var0;
      ++v6;
      size_t v24 = *v23;
      memcpy(result, v23, v24);
      double result = (void *)(*((void *)this + 2) + v24);
      *((void *)this + 2) = result;
      --v5;
    }
    while (v5);
  }
LABEL_23:
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_24F65EB50(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

_DWORD *GPUTools::FB::Stream::Writev_partial(_DWORD *this, Fbuf *a2, uint64_t a3, char a4)
{
  uint64_t v4 = a3;
  uint64_t v6 = (uint64_t)this;
  while (atomic_exchange(this + 14, 1u) == 1)
  {
    while (this[14] == 1)
      ;
  }
  if (a3)
  {
    if (a4)
    {
      while (1)
      {
        var0 = a2->var0.var0;
        size_t v8 = *(unsigned int *)a2->var0.var0;
        unint64_t v9 = *(void *)(v6 + 24);
        if (v9 < v8) {
          break;
        }
        uint64_t v10 = *(void **)(v6 + 16);
        if ((unint64_t)v10 + v8 - *(void *)(v6 + 8) - 8 > v9)
        {
          (*(void (**)(void))(*(void *)(v6 + 40) + 16))();
          uint64_t v10 = (void *)(*(void *)(v6 + 8) + 8);
          *(void *)(v6 + 16) = v10;
          *(unsigned char *)(v6 + 60) = 1;
          var0 = a2->var0.var0;
        }
        this = memcpy(v10, var0, v8);
        *(void *)(v6 + 16) += v8;
        uint64_t v11 = a2->var0.var0;
        a2->var1 = a2->var0.var0;
        if (a2->var2 >= 0x24)
        {
          v11[8] = 0;
          *(_OWORD *)uint64_t v11 = 0u;
          *((_OWORD *)v11 + 1) = 0u;
        }
        ++a2;
        if (!--v4) {
          goto LABEL_17;
        }
      }
    }
    else
    {
      while (1)
      {
        unint64_t v12 = a2->var0.var0;
        size_t v8 = *(unsigned int *)a2->var0.var0;
        unint64_t v9 = *(void *)(v6 + 24);
        if (v9 < v8) {
          break;
        }
        char v13 = *(void **)(v6 + 16);
        if ((unint64_t)v13 + v8 - *(void *)(v6 + 8) - 8 > v9)
        {
          (*(void (**)(void))(*(void *)(v6 + 40) + 16))();
          char v13 = (void *)(*(void *)(v6 + 8) + 8);
          *(void *)(v6 + 16) = v13;
          *(unsigned char *)(v6 + 60) = 1;
          unint64_t v12 = a2->var0.var0;
        }
        this = memcpy(v13, v12, v8);
        *(void *)(v6 + 16) += v8;
        ++a2;
        if (!--v4) {
          goto LABEL_17;
        }
      }
    }
    dy_abort("fbuf exceeded capacity of fbuf stream by %lu bytes", v8 - v9);
  }
LABEL_17:
  atomic_store(0, (unsigned int *)(v6 + 56));
  return this;
}

void sub_24F65ED10(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void sub_24F65ED1C(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void sub_24F65ED28(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]()
{
}

void GPUTools::DYLockUtils::Lock(os_unfair_lock_t lock, volatile int *a2)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1) {
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  }
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock)
  {
    MEMORY[0x270ED80C8](lock);
  }
  else
  {
    os_unfair_lock_lock(lock);
  }
}

uint64_t GPUTools::DYLockUtils::ShouldUseLegacyLock(GPUTools::DYLockUtils *this)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1) {
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  }
  return GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock;
}

void GPUTools::DYLockUtils::Unlock(os_unfair_lock_t lock, volatile int *a2)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1) {
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  }
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock)
  {
    MEMORY[0x270ED80D8](lock);
  }
  else
  {
    os_unfair_lock_unlock(lock);
  }
}

uint64_t GPUTools::DYLockUtils::TryLock(os_unfair_lock_t lock, volatile int *a2)
{
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken != -1) {
    dispatch_once(&GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::onceToken, &__block_literal_global_2);
  }
  if (GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock)
  {
    return MEMORY[0x270ED80D0](lock);
  }
  else
  {
    return os_unfair_lock_trylock(lock);
  }
}

void *___ZN8GPUTools11DYLockUtils19ShouldUseLegacyLockEv_block_invoke()
{
  GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock = 1;
  double result = dlsym((void *)0xFFFFFFFFFFFFFFFELL, "os_unfair_lock_lock");
  GPUTools::DYLockUtils::ShouldUseLegacyLock(void)::shouldUseLegacyLock = result == 0;
  return result;
}

void sub_24F6605D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

CFTypeRef DYCreateDictionaryFromVMStatistics(char *valuePtr)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v12 = *(_OWORD *)&off_265336558;
  long long v13 = xmmword_265336568;
  *(_OWORD *)keys = xmmword_265336508;
  long long v8 = *(_OWORD *)&off_265336518;
  long long v9 = xmmword_265336528;
  uint64_t v14 = @"speculative_count";
  long long v10 = *(_OWORD *)&off_265336538;
  long long v11 = xmmword_265336548;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, valuePtr);
  values[1] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 4);
  values[2] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 8);
  values[3] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 12);
  values[4] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 16);
  values[5] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 24);
  values[6] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 32);
  values[7] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 40);
  values[8] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 48);
  values[9] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 56);
  values[10] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 64);
  values[11] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 72);
  values[12] = CFNumberCreate(v2, kCFNumberLongLongType, valuePtr + 80);
  values[13] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 88);
  values[14] = CFNumberCreate(v2, kCFNumberIntType, valuePtr + 92);
  CFDictionaryRef v3 = CFDictionaryCreate(v2, (const void **)keys, (const void **)values, 15, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  for (uint64_t i = 0; i != 15; ++i)
    CFRelease(values[i]);
  return CFMakeCollectable(v3);
}

uint64_t DYFillVMStatisticsFromDictionary(uint64_t a1, CFDictionaryRef theDict)
{
  *(void *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  uint64_t v4 = (void *)(a1 + 80);
  *(_OWORD *)(a1 + 64) = 0u;
  uint64_t v5 = (void *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = 0u;
  uint64_t v6 = (void *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v7 = (void *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = 0u;
  long long v8 = (void *)(a1 + 16);
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"free_count");
  CFNumberGetValue(Value, kCFNumberIntType, (void *)a1);
  CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"active_count");
  CFNumberGetValue(v10, kCFNumberIntType, (void *)(a1 + 4));
  CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"inactive_count");
  CFNumberGetValue(v11, kCFNumberIntType, (void *)(a1 + 8));
  CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"wire_count");
  CFNumberGetValue(v12, kCFNumberIntType, (void *)(a1 + 12));
  CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"zero_fill_count");
  CFNumberGetValue(v13, kCFNumberLongLongType, v8);
  CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"reactivations");
  CFNumberGetValue(v14, kCFNumberLongLongType, (void *)(a1 + 24));
  CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"pageins");
  CFNumberGetValue(v15, kCFNumberLongLongType, v7);
  CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"pageouts");
  CFNumberGetValue(v16, kCFNumberLongLongType, (void *)(a1 + 40));
  CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"faults");
  CFNumberGetValue(v17, kCFNumberLongLongType, v6);
  CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"cow_faults");
  CFNumberGetValue(v18, kCFNumberLongLongType, (void *)(a1 + 56));
  CFNumberRef v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"lookups");
  CFNumberGetValue(v19, kCFNumberLongLongType, v5);
  CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"hits");
  CFNumberGetValue(v20, kCFNumberLongLongType, (void *)(a1 + 72));
  CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"purges");
  CFNumberGetValue(v21, kCFNumberLongLongType, v4);
  CFNumberRef v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"purgeable_count");
  CFNumberGetValue(v22, kCFNumberIntType, (void *)(a1 + 88));
  CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"speculative_count");

  return CFNumberGetValue(v23, kCFNumberIntType, (void *)(a1 + 92));
}

void sub_24F662EAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a55 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t DYSetGTMTLCaptureMode(uint64_t result)
{
  sGTMTLCaptureMode = result;
  return result;
}

BOOL DYCheckGLDispatchTableSize(uint64_t a1)
{
  uint64_t v1 = (void *)[MEMORY[0x263F086E0] bundleWithIdentifier:a1];
  if (!v1)
  {
    CFNumberRef v12 = "gl_bundle";
    goto LABEL_19;
  }
  uint64_t v2 = [v1 pathForResource:@"GLEngine.bundle" ofType:0];
  if (!v2) {
    __assert_rtn("BOOL DYCheckGLDispatchTableSize(NSString *)", "", 0, "engine_bundle_path");
  }
  CFDictionaryRef v3 = (void *)[MEMORY[0x263F086E0] bundleWithPath:v2];
  if (!v3)
  {
    CFNumberRef v12 = "engine_bundle";
    goto LABEL_19;
  }
  CFStringRef v4 = (const __CFString *)[v3 executablePath];
  if (!v4)
  {
    CFNumberRef v12 = "engine_exec_path";
    goto LABEL_19;
  }
  CFStringRef v5 = v4;
  CFIndex MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v4);
  uint64_t v7 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation, 0x9868CDE3uLL);
  if (!v7)
  {
    CFNumberRef v12 = "engine_exec_path_c";
    goto LABEL_19;
  }
  long long v8 = v7;
  if (!CFStringGetFileSystemRepresentation(v5, v7, MaximumSizeOfFileSystemRepresentation))
  {
    CFNumberRef v12 = "ok";
    goto LABEL_19;
  }
  long long v9 = dlopen(v8, 5);
  free(v8);
  if (!v9)
  {
    CFNumberRef v13 = dlerror();
    dy_abort("failed to dlopen interpose dylib: %s", v13);
  }
  CFNumberRef v10 = (unsigned int (*)(void, uint64_t, int *))dlsym(v9, "gliGetInteger");
  if (!v10)
  {
    CFNumberRef v12 = "gliGetInteger_ptr";
LABEL_19:
    __assert_rtn("BOOL DYCheckGLDispatchTableSize(NSString *)", "", 0, v12);
  }
  int v14 = 0;
  if (v10(0, 224, &v14)) {
    dy_abort("dispatch table size query failed");
  }
  dlclose(v9);
  return v14 == 8288;
}

const char *DYGetGLInterposeDylibPath()
{
  return "/usr/lib/libglInterpose.dylib";
}

char *DYGetMTLInterposeDylibPath(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  if (sGTMTLCaptureMode != 1
    || (CFStringRef v5 = &DYGetCapturePath(void)::libPath,
        DYGetCapturePathForLibrary(&DYGetCapturePath(void)::libPath, (uint64_t)"/System/Library/PrivateFrameworks/GPUToolsCapture.framework/GPUToolsCapture", "/usr/lib/libMTLCapture.dylib", a4, a5), !DYGetCapturePath(void)::libPath))
  {
    DYGetLegacyCapturePath();
    return DYGetLegacyCapturePath(void)::libPath;
  }
  return v5;
}

char *DYGetLegacyCapturePath(void)
{
  uint64_t v0 = (void *)[NSURL fileURLWithPath:objc_msgSend(@"/", "stringByAppendingPathComponent:", @"/Developer/Library/PrivateFrameworks/MTLToolsDeviceSupport.framework/libMTLInterpose.dylib"];
  double result = (char *)stat((const char *)[v0 fileSystemRepresentation], &v2);
  if (!result) {
    return strncpy(DYGetLegacyCapturePath(void)::libPath, (const char *)[v0 fileSystemRepresentation], 0x400uLL);
  }
  return result;
}

char *DYGetMTLDiagnosticsDylibPath(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  return DYGetMTLDiagnosticsDylibPath::libPath;
}

char *DYGetCapturePathForLibrary(char *a1, uint64_t a2, const char *a3, const char *a4, const char *a5)
{
  uint64_t v7 = (void *)[NSURL fileURLWithPath:objc_msgSend(@"/", "stringByAppendingPathComponent:", objc_msgSend(NSString, "stringWithUTF8String:", a2, a4, a5))];
  double result = (char *)stat((const char *)[v7 fileSystemRepresentation], &v10);
  if (!result) {
    double result = strncpy(a1, (const char *)[v7 fileSystemRepresentation], 0x400uLL);
  }
  if (!*a1)
  {
    long long v9 = (void *)[NSURL fileURLWithPath:objc_msgSend(@"/", "stringByAppendingPathComponent:", objc_msgSend(NSString, "stringWithUTF8String:", a3))];
    double result = (char *)stat((const char *)[v9 fileSystemRepresentation], &v10);
    if (!result) {
      return strncpy(a1, (const char *)[v9 fileSystemRepresentation], 0x400uLL);
    }
  }
  return result;
}

uint64_t DYModifyEnvironmentForDualCaptureSupport(uint64_t result, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  if (sGTMTLCaptureMode == 2)
  {
    CFStringRef v5 = (void *)result;
    uint64_t v6 = NSString;
    DYGetCapturePathForLibrary(&DYGetCapturePath(void)::libPath, (uint64_t)"/System/Library/PrivateFrameworks/GPUToolsCapture.framework/GPUToolsCapture", "/usr/lib/libMTLCapture.dylib", a4, a5);
    uint64_t v7 = [v6 stringWithUTF8String:&DYGetCapturePath(void)::libPath];
    long long v8 = NSString;
    DYGetLegacyCapturePath();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v8, "stringWithUTF8String:", DYGetLegacyCapturePath(void)::libPath), @"GPUTOOLS_LEGACY_INTERPOSER_PATH");
    [v5 setObject:v7 forKeyedSubscript:@"DYMTL_TOOLS_DYLIB_PATH"];
    long long v9 = (__CFString *)[v5 objectForKey:@"DYLD_INSERT_LIBRARIES"];
    if (!v9) {
      long long v9 = &stru_2700E6440;
    }
    uint64_t v10 = [(__CFString *)v9 dy_appendComponentsString:v7 usingSeparator:@":" unique:1];
    return [v5 setObject:v10 forKey:@"DYLD_INSERT_LIBRARIES"];
  }
  return result;
}

uint64_t DYAppendInsertLibrary(void *a1, uint64_t a2)
{
  CFStringRef v4 = (__CFString *)[a1 objectForKey:@"DYLD_INSERT_LIBRARIES"];
  if (!v4) {
    CFStringRef v4 = &stru_2700E6440;
  }
  uint64_t v5 = [(__CFString *)v4 dy_appendComponentsString:a2 usingSeparator:@":" unique:1];

  return [a1 setObject:v5 forKey:@"DYLD_INSERT_LIBRARIES"];
}

void *DYGetInterposeDylibHandle(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  int v5 = a1;
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = DYGetMTLInterposeDylibPath(a1, a2, a3, a4, a5);
  uint64_t v7 = 0;
  v12[0] = v6;
  v12[1] = "/usr/lib/libglInterpose.dylib";
  char v8 = 1;
  do
  {
    while (1)
    {
      char v9 = v8;
      uint64_t v10 = (const char *)v12[v7];
      if (!v10) {
        break;
      }
      double result = dlopen(v10, v5);
      char v8 = 0;
      uint64_t v7 = 1;
      if (((result == 0) & v9) == 0) {
        return result;
      }
    }
    char v8 = 0;
    uint64_t v7 = 1;
  }
  while ((v9 & 1) != 0);
  return 0;
}

void DYPrependInsertLibrary(void *a1, uint64_t a2)
{
  if (a2)
  {
    id v5 = (id)[a1 objectForKey:@"DYLD_INSERT_LIBRARIES"];
    [a1 setObject:a2 forKey:@"DYLD_INSERT_LIBRARIES"];
    CFStringRef v4 = (__CFString *)[a1 objectForKey:@"DYLD_INSERT_LIBRARIES"];
    if (!v4) {
      CFStringRef v4 = &stru_2700E6440;
    }
    objc_msgSend(a1, "setObject:forKey:", -[__CFString dy_appendComponentsString:usingSeparator:unique:](v4, "dy_appendComponentsString:usingSeparator:unique:", v5, @":", 1), @"DYLD_INSERT_LIBRARIES");
  }
}

void *DYSetBlockPointer(void *aBlock, const void **a2)
{
  if (!a2) {
    __assert_rtn("void DYSetBlockPointer(void *, void **)", "", 0, "target");
  }
  if (*a2) {
    _Block_release(*a2);
  }
  if (aBlock) {
    double result = _Block_copy(aBlock);
  }
  else {
    double result = 0;
  }
  *a2 = result;
  return result;
}

__CFString *DYSystemRootDirectory()
{
  return @"/";
}

void DYLog(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void DYLogv(int a1, const char *a2, va_list a3)
{
  CFStringRef v4 = 0;
  vasprintf(&v4, a2, a3);
  _log_asl(a1, (uint64_t)v4);
  free(v4);
}

void _log_asl(int a1, uint64_t a2)
{
  if (_log_asl_aslc_once != -1) {
    dispatch_once(&_log_asl_aslc_once, &__block_literal_global_4);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___log_asl_block_invoke_2;
  v5[3] = &__block_descriptor_44_e5_v8__0l;
  if (a1 <= 1) {
    int v4 = 1;
  }
  else {
    int v4 = a1;
  }
  int v6 = v4;
  v5[4] = a2;
  dispatch_sync((dispatch_queue_t)_log_asl_log_queue, v5);
}

void _DYOLog(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = [NSString alloc];
  CFNumberRef v13 = (objc_class *)objc_opt_class();
  int v14 = (void *)[v12 initWithFormat:@"<%@: %p>: %@", NSStringFromClass(v13), a1, a3];
  CFNumberRef v15 = (void *)[[NSString alloc] initWithFormat:v14 arguments:&a9];
  _log_asl(a2, [v15 UTF8String]);
}

void _DYOCondLog(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id v12 = [NSString alloc];
    CFNumberRef v13 = (objc_class *)objc_opt_class();
    int v14 = (void *)[v12 initWithFormat:@"<%@: %p>: %@", NSStringFromClass(v13), a2, a4];
    CFNumberRef v15 = (void *)[[NSString alloc] initWithFormat:v14 arguments:&a9];
    _log_asl(a3, [v15 UTF8String]);
  }
}

asl_object_t ___log_asl_block_invoke()
{
  _log_asl_log_queue = (uint64_t)dispatch_queue_create("com.apple.gt.log", 0);
  _log_asl_log_stderr = getenv("GT_LOG_TO_STDERR") != 0;
  asl_object_t result = asl_open(0, 0, 2u);
  _log_asl_aslc = (uint64_t)result;
  return result;
}

uint64_t ___log_asl_block_invoke_2(uint64_t a1)
{
  uint64_t result = asl_log((asl_object_t)_log_asl_aslc, 0, *(_DWORD *)(a1 + 40), "%s", *(const char **)(a1 + 32));
  if (_log_asl_log_stderr) {
    return fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", *(const char **)(a1 + 32));
  }
  return result;
}

uint64_t DYFSFileExists(uint64_t a1)
{
  char v2 = 0;
  LODWORD(result) = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", a1, &v2);
  if (v2) {
    return 0;
  }
  else {
    return result;
  }
}

uint64_t DYFSDirectoryExists(uint64_t a1)
{
  char v2 = 0;
  LODWORD(result) = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", a1, &v2);
  if (v2) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t DYFSCreateTempFileURL(uint64_t a1, uint64_t a2, __CFString *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = (void *)[MEMORY[0x263F08850] defaultManager];
  if (!a3) {
    a3 = &stru_2700E6440;
  }
  CFStringRef v11 = [(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:[(__CFString *)a3 stringByAppendingString:@"XXXXXX"]];
  CFStringGetFileSystemRepresentation(v11, buffer, 1024);
  int v12 = mkstemp(buffer);
  if (v12 == -1)
  {
    if (a5)
    {
      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      uint64_t result = 0;
      *a5 = v16;
      return result;
    }
    return 0;
  }
  close(v12);
  CFNumberRef v13 = (void *)[v10 stringWithFileSystemRepresentation:buffer length:strlen(buffer)];
  if (![v10 removeItemAtPath:v13 error:a5]) {
    return 0;
  }
  if (a1)
  {
    int v14 = [v10 createDirectoryAtPath:v13 withIntermediateDirectories:0 attributes:0 error:a5];
    uint64_t result = 0;
    if (!v14) {
      return result;
    }
    CFNumberRef v13 = (void *)[v13 stringByAppendingPathComponent:a1];
  }
  if (a2) {
    CFNumberRef v13 = (void *)[v13 stringByAppendingPathExtension:a2];
  }
  return [NSURL fileURLWithPath:v13 isDirectory:a4];
}

NSUInteger DYFSCreateDirectory(uint64_t a1, NSSearchPathDirectory directory, void *a3)
{
  uint64_t v8 = 0;
  id v5 = NSSearchPathForDirectoriesInDomains(directory, 1uLL, 1);
  NSUInteger result = [(NSArray *)v5 count];
  if (result)
  {
    uint64_t v7 = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "stringByAppendingPathComponent:", a1);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v8);
    if (v8)
    {
      NSUInteger result = 0;
      if (a3) {
        *a3 = v8;
      }
    }
    else
    {
      return [NSURL fileURLWithPath:v7 isDirectory:1];
    }
  }
  return result;
}

void *DYFSCanWriteAtURL(void *result)
{
  if (result)
  {
    NSUInteger result = (void *)[result URLByDeletingLastPathComponent];
    if (result) {
      return (void *)(access((const char *)objc_msgSend((id)objc_msgSend(result, "path"), "UTF8String"), 2) == 0);
    }
  }
  return result;
}

const char *GTMessageKindAsString(int a1)
{
  if (a1 > 1791)
  {
    if (a1 <= 4095)
    {
      switch(a1)
      {
        case 2304:
          uint64_t v1 = "kDYMessageFSStreamInitializeTransfer";
          break;
        case 2305:
          uint64_t v1 = "kDYMessageFSStreamInitializeTransferAck";
          break;
        case 2306:
          uint64_t v1 = "kDYMessageFSStreamItemData";
          break;
        case 2307:
          uint64_t v1 = "kDYMessageFSStreamFinishedSending";
          break;
        case 2308:
          uint64_t v1 = "kDYMessageFSStreamFinishedSendingAck";
          break;
        case 2309:
          uint64_t v1 = "kDYMessageFSStreamAbort";
          break;
        default:
          switch(a1)
          {
            case 1792:
              uint64_t v1 = "kDYMessageTraceBufferedFstreamData";
              break;
            case 1793:
              uint64_t v1 = "kDYMessageTraceConfiguration";
              break;
            case 1794:
              uint64_t v1 = "kDYMessageTraceOverridesConfiguration";
              break;
            case 1795:
              uint64_t v1 = "kDYMessageTraceFlushBuffers";
              break;
            case 1796:
              uint64_t v1 = "kDYMessageTraceModeChanged";
              break;
            default:
LABEL_109:
              uint64_t v1 = (char *)GTMessageKindAsString_str();
              snprintf(v1, 0x40uLL, "Unrecognized message: %d", v2);
              break;
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 4096:
          return "kDYMessageReplayerAppReady";
        case 4097:
        case 4123:
        case 4124:
        case 4125:
        case 4126:
        case 4127:
        case 4128:
          goto LABEL_109;
        case 4098:
          return "kDYMessageReplayerReplayArchive";
        case 4099:
          return "kDYMessageReplayerExperimentResult";
        case 4100:
          return "kDYMessageReplayerReplayFinished";
        case 4101:
          return "kDYMessageReplayerSetBackgroundImage";
        case 4102:
          return "kDYMessageReplayerDeleteAllArchives";
        case 4103:
          return "kDYMessageReplayerBeginDebugArchive";
        case 4104:
          return "kDYMessageReplayerEndDebugArchive";
        case 4105:
          return "kDYMessageReplayerDebugStatus";
        case 4106:
          return "kDYMessageReplayerDebugFuncStop";
        case 4107:
          return "kDYMessageReplayerDebugEnableWireframePresent";
        case 4108:
          return "kDYMessageReplayerDebugEnableDrawCallPresent";
        case 4109:
          return "kDYMessageReplayerDebugWireframeLineWidth";
        case 4110:
          return "kDYMessageReplayerDebugWireframeLineColor";
        case 4111:
          return "kDYMessageReplayerDebugDisableFunctions";
        case 4112:
          return "kDYMessageReplayerDebugEnableFunctions";
        case 4113:
          return "kDYMessageReplayerSetBackgroundImageData";
        case 4114:
          return "kDYMessageReplayerLoadArchives";
        case 4115:
          return "kDYMessageReplayerQueryLoadedArchivesInfo";
        case 4116:
          return "kDYMessageReplayerArchivesDirectoryPath";
        case 4117:
          return "kDYMessageReplayerQueryShaderInfo";
        case 4118:
          return "kDYMessageReplayerDerivedCounterData";
        case 4119:
          return "kDYMessageReplayerGenerateThumbnails";
        case 4120:
          return "kDYMessageReplayerGenerateDependencyGraphThumbnails";
        case 4121:
          return "kDYMessageFetchResourceObjectBatch";
        case 4122:
          return "kDYMessageReplayerDebugEnableOutlinePresent";
        case 4129:
          return "kGTMessageReplayerResourcesUsedForFunctionIndex";
        default:
          if (a1 == 4353)
          {
            uint64_t v1 = "kGTMessageDiagnosticsReceivedData";
          }
          else
          {
            if (a1 != 4865) {
              goto LABEL_109;
            }
            uint64_t v1 = "kGTMessageRunnablePID";
          }
          break;
      }
    }
  }
  else if (a1 <= 1279)
  {
    if (a1 > 511)
    {
      switch(a1)
      {
        case 1024:
          uint64_t v1 = "kDYMessageCurrentDrawFramebufferImage";
          break;
        case 1025:
          uint64_t v1 = "kDYMessageFetchResourceList";
          break;
        case 1026:
          uint64_t v1 = "kDYMessageFetchResourceObject";
          break;
        case 1027:
          uint64_t v1 = "kDYMessageFetchState";
          break;
        case 1028:
          uint64_t v1 = "kDYMessageUpdateResourceObject";
          break;
        case 1029:
          uint64_t v1 = "kDYMessageClearResourceOverrides";
          break;
        case 1030:
          uint64_t v1 = "kDYGenerateShaderDebuggerTrace";
          break;
        default:
          if (a1 == 512)
          {
            uint64_t v1 = "kDYMessageBreakpoint";
          }
          else
          {
            if (a1 != 513) {
              goto LABEL_109;
            }
            uint64_t v1 = "kDYMessageBreakpointContinue";
          }
          break;
      }
    }
    else
    {
      uint64_t v1 = "kDYMessageCaptureStart";
      switch(a1)
      {
        case 256:
          return v1;
        case 257:
          uint64_t v1 = "kDYMessageCaptureStarted";
          break;
        case 258:
          uint64_t v1 = "kDYMessageCaptureData";
          break;
        case 259:
          uint64_t v1 = "kDYMessageCaptureCreateAlias";
          break;
        case 260:
          uint64_t v1 = "kDYMessageCaptureStop";
          break;
        case 262:
          uint64_t v1 = "kDYMessageCaptureDataReferenceCounts";
          break;
        case 263:
          uint64_t v1 = "kDYMessageCaptureSentAllData";
          break;
        case 264:
          uint64_t v1 = "kDYMessageCaptureActivateSession";
          break;
        case 265:
          uint64_t v1 = "kDYMessageCaptureInvalidateSession";
          break;
        case 266:
          uint64_t v1 = "kDYMessageCaptureSentUsedData";
          break;
        case 267:
          uint64_t v1 = "kDYMessageCaptureSentAllMetadata";
          break;
        case 271:
          uint64_t v1 = "kDYMessageCaptureDataChunk";
          break;
        default:
          goto LABEL_109;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        uint64_t v1 = "kDYMessageLaunchGuestApp";
        break;
      case 1281:
        uint64_t v1 = "kDYMessageKillGuestApp";
        break;
      case 1282:
        uint64_t v1 = "kDYMessageGuestAppTerminated";
        break;
      case 1283:
        uint64_t v1 = "kDYMessageTerminateDaemon";
        break;
      case 1284:
        uint64_t v1 = "kDYMessageApplicationList";
        break;
      case 1285:
        uint64_t v1 = "kDYMessageApplicationIcon";
        break;
      case 1286:
        uint64_t v1 = "kDYMessageDaemonCreateGuestAppTransport";
        break;
      case 1287:
        uint64_t v1 = "kDYMessageMobileDaemonReloadUIServer";
        break;
      case 1288:
        uint64_t v1 = "kDYMessageSendGuestAppToBackground";
        break;
      case 1289:
        uint64_t v1 = "kDYMessageBringGuestAppToForeground";
        break;
      case 1290:
        uint64_t v1 = "kDYMessageGPUToolsVersionQuery";
        break;
      case 1291:
        uint64_t v1 = "kDYMessageMobileDaemonPosixSpawn";
        break;
      case 1292:
        uint64_t v1 = "kDYMessageDaemonRegisterInferior";
        break;
      case 1293:
        uint64_t v1 = "kDYDaemonResumeInferior";
        break;
      case 1294:
        uint64_t v1 = "kDYMessageDaemonDeviceCapabilities";
        break;
      case 1295:
        uint64_t v1 = "kDYMessageDaemonLaunchDebugServer";
        break;
      case 1296:
      case 1297:
        goto LABEL_109;
      case 1298:
        uint64_t v1 = "kDYMessageDeviceCompatibilityCapabilities";
        break;
      default:
        switch(a1)
        {
          case 1536:
            uint64_t v1 = "kDYMessageInferiorLaunched";
            break;
          case 1537:
            uint64_t v1 = "kDYMessageInferiorSignalInterposeSemaphore";
            break;
          case 1538:
            uint64_t v1 = "kDYMessageGuestAppCSSignature";
            break;
          case 1539:
            uint64_t v1 = "kDYMessageGuestAppTimebase";
            break;
          case 1540:
            uint64_t v1 = "kDYMessageGuestAppInvalidateSavePointerAliases";
            break;
          case 1541:
            uint64_t v1 = "kDYMessageGuestAppProfilingData";
            break;
          case 1542:
            uint64_t v1 = "kDYMessageGuestAppGLContextsInfo";
            break;
          case 1543:
            uint64_t v1 = "kDYMessageGuestAppCADisplayLinkEvent";
            break;
          case 1544:
            uint64_t v1 = "kDYMessageGuestAppMultitaskingSuspensionState";
            break;
          case 1545:
            uint64_t v1 = "kDYMessageGuestAppLockGraphics";
            break;
          case 1546:
            uint64_t v1 = "kDYMessageGuestAppUnlockGraphics";
            break;
          case 1547:
            uint64_t v1 = "kDYMessageGuestAppMTLCommandQueuesInfo";
            break;
          case 1548:
            uint64_t v1 = "kDYMessageGuestAppMTLCommandBuffersCaptured";
            break;
          case 1549:
            uint64_t v1 = "kDYMessageGuestAppMTLCaptureScopesInfo";
            break;
          case 1550:
            uint64_t v1 = "kDYMessageGuestAppCAMetalLayersInfo";
            break;
          case 1551:
            uint64_t v1 = "kDYMessageGuestAppMTLDevicesInfo";
            break;
          default:
            goto LABEL_109;
        }
        break;
    }
  }
  return v1;
}

const char *GTResourceTypeAsString(uint64_t a1)
{
  if (a1 <= 21)
  {
    if (a1 == 1) {
      return "Texture";
    }
    if (a1 == 2) {
      return "Buffer";
    }
  }
  else
  {
    switch(a1)
    {
      case 22:
        return "Threadgroup buffer";
      case 24:
        return "Indirect command buffer";
      case 39:
        return "Rasterization rate map";
    }
  }
  return "Resource";
}

size_t DYIOSurfaceUtilsPlaneCount(__IOSurface *a1)
{
  size_t result = IOSurfaceGetPlaneCount(a1);
  if (!result) {
    return IOSurfaceGetAllocSize(a1) != 0;
  }
  return result;
}

uint64_t DYIOSurfaceUtilsGetPlaneInfo@<X0>(__IOSurface *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 40) = 0;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 8) = 0u;
  *(void *)a3 = a2;
  *(void *)(a3 + 16) = IOSurfaceGetHeightOfPlane(a1, a2);
  *(void *)(a3 + 8) = IOSurfaceGetWidthOfPlane(a1, a2);
  *(void *)(a3 + 24) = IOSurfaceGetBytesPerRowOfPlane(a1, a2);
  *(void *)(a3 + 32) = IOSurfaceGetBytesPerElementOfPlane(a1, a2);
  uint64_t result = IOSurfaceGetPixelFormat(a1);
  *(_DWORD *)(a3 + 40) = result;
  if (result == 1647534392)
  {
    uint64_t v7 = 4;
    if (a2) {
      uint64_t v7 = 1;
    }
    *(void *)(a3 + 32) = v7;
  }
  return result;
}

size_t DYIOSurfaceUtilsPerPlaneInfo(__IOSurface *a1, uint64_t a2, uint64_t (*a3)(uint64_t, unsigned char *))
{
  size_t result = DYIOSurfaceUtilsPlaneCount(a1);
  if (result)
  {
    size_t v7 = result;
    for (size_t i = 0; i != v7; ++i)
    {
      DYIOSurfaceUtilsGetPlaneInfo(a1, i, (uint64_t)v9);
      size_t result = a3(a2, v9);
    }
  }
  return result;
}

uint64_t DYIOSurfaceUtilsStorePlaneData(__IOSurface *a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, char a5)
{
  v7[3] = a3;
  v7[0] = a1;
  v7[1] = a2;
  uint64_t v8 = a4;
  BYTE1(v8) = a5;
  BYTE2(v8) = 1;
  v7[2] = 0;
  IOSurfaceLock(a1, 1u, 0);
  DYIOSurfaceUtilsPerPlaneInfo(a1, (uint64_t)v7, (uint64_t (*)(uint64_t, unsigned char *))StorePlaneData);
  return IOSurfaceUnlock(a1, 1u, 0);
}

void StorePlaneData()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  int v2 = v1;
  uint64_t v3 = v0;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(v0 + 34) || *(void *)(v0 + 24) == *v1)
  {
    if (*(unsigned char *)(v0 + 32)) {
      size_t v4 = v1[4] * v1[1];
    }
    else {
      size_t v4 = v1[3];
    }
    id v5 = *(char **)(v0 + 8);
    uint64_t v6 = *(void *)(v0 + 16);
    BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(*(IOSurfaceRef *)v0, *v1);
    if (BaseAddressOfPlane)
    {
      uint64_t v8 = BaseAddressOfPlane;
      if (*(unsigned char *)(v3 + 33))
      {
        size_t v9 = v2[3];
        if (v9 <= 0x10000) {
          uint64_t v10 = &v13;
        }
        else {
          uint64_t v10 = (char *)malloc_type_malloc(v9, 0xEC887224uLL);
        }
        if (v2[2])
        {
          size_t v12 = 0;
          do
          {
            memcpy(v10, &v8[v2[3] * v12], v2[3]);
            memcpy(&v5[v6], v10, v4);
            v6 += v4;
            ++v12;
          }
          while (v12 < v2[2]);
        }
        if (v2[3] > 0x10000) {
          free(v10);
        }
      }
      else if (v2[2])
      {
        size_t v11 = 0;
        do
        {
          memcpy(&v5[v6], &v8[v2[3] * v11], v4);
          v6 += v4;
          ++v11;
        }
        while (v11 < v2[2]);
      }
    }
    else
    {
      bzero(v5, v2[2] * v4);
    }
    *(void *)(v3 + 16) = v6;
  }
}

uint64_t DYIOSurfaceUtilsStoreData(__IOSurface *a1, uint64_t a2, unsigned __int8 a3, char a4)
{
  v6[3] = 0;
  v6[1] = a2;
  v6[2] = 0;
  v6[0] = a1;
  uint64_t v7 = a3;
  BYTE1(v7) = a4;
  IOSurfaceLock(a1, 1u, 0);
  DYIOSurfaceUtilsPerPlaneInfo(a1, (uint64_t)v6, (uint64_t (*)(uint64_t, unsigned char *))StorePlaneData);
  return IOSurfaceUnlock(a1, 1u, 0);
}

uint64_t DYGetGuestAppClient(int a1)
{
  if (g_init_guest_app_client_once != -1) {
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  }
  dispatch_sync((dispatch_queue_t)g_set_app_client[a1], &__block_literal_global_5);
  return g_app_client[a1];
}

void init_guest_app_client(void *a1)
{
  g_set_app_client = (uint64_t)dispatch_queue_create(0, 0);
  dispatch_suspend((dispatch_object_t)g_set_app_client);
  uint64_t v1 = dispatch_queue_create(0, 0);
  qword_269A18F88 = (uint64_t)v1;

  dispatch_suspend(v1);
}

void DYSetGuestAppClient(int a1, uint64_t a2)
{
  if (g_init_guest_app_client_once != -1) {
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  }
  size_t v4 = (dispatch_once_t *)((char *)&DYSetGuestAppClient::onceToken + 8 * a1);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __DYSetGuestAppClient_block_invoke;
  v5[3] = &unk_265336768;
  int v6 = a1;
  v5[4] = a2;
  if (*v4 != -1) {
    dispatch_once(v4, v5);
  }
}

void __DYSetGuestAppClient_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 40);
  g_app_client[v1] = *(void *)(a1 + 32);
  dispatch_resume((dispatch_object_t)g_set_app_client[v1]);
}

uint64_t DYGetGlobalClientTransport(void *a1)
{
  if (g_init_guest_app_client_once != -1) {
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  }

  return [a1 valueForKey:@"transport"];
}

uint64_t DYGetGlobalTransportSource(void *a1)
{
  if (g_init_guest_app_client_once != -1) {
    dispatch_once_f(&g_init_guest_app_client_once, 0, (dispatch_function_t)init_guest_app_client);
  }

  return [a1 valueForKey:@"source"];
}

uint64_t DYDisableBufferSwaps(uint64_t a1)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  int v2 = (uint64_t (*)(uint64_t))g_interpose_api;

  return v2(a1);
}

uint64_t init_interpose_api(void *a1, uint64_t a2, uint64_t a3, const char *a4, const char *a5)
{
  id v5 = DYGetInterposeDylibHandle(272, a2, a3, a4, a5);
  if (!v5)
  {
    uint64_t v8 = dlerror();
    dy_abort("failed to dlopen interpose dylib: %s", v8);
  }
  int v6 = v5;
  g_interpose_apsize_t i = dlsym(v5, "reset_graphics_timing");
  if (!g_interpose_api)
  {
    size_t v9 = "g_interpose_api.reset_graphics_timing != nullptr";
    goto LABEL_16;
  }
  g_interpose_apsize_t i = dlsym(v6, "get_graphics_timing");
  if (!g_interpose_api)
  {
    size_t v9 = "g_interpose_api.get_graphics_timing != nullptr";
    goto LABEL_16;
  }
  g_interpose_apsize_t i = dlsym(v6, "get_profiling_data");
  if (!g_interpose_api)
  {
    size_t v9 = "g_interpose_api.get_profiling_data != nullptr";
    goto LABEL_16;
  }
  g_interpose_apsize_t i = dlsym(v6, "get_all_per_function_profiling_data");
  if (!g_interpose_api)
  {
    size_t v9 = "g_interpose_api.get_all_per_function_profiling_data != nullptr";
    goto LABEL_16;
  }
  g_interpose_apsize_t i = dlsym(v6, "disable_buffer_swaps");
  if (!g_interpose_api)
  {
    size_t v9 = "g_interpose_api.disable_buffer_swaps != nullptr";
LABEL_16:
    __assert_rtn("void init_interpose_api(void *)", "", 0, v9);
  }

  return dlclose(v6);
}

uint64_t DYResetGraphicsTiming()
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v0 = (uint64_t (*)(void))g_interpose_api;

  return v0();
}

uint64_t DYGetGraphicsTiming(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  int v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))g_interpose_api;

  return v6(a1, a2, a3);
}

uint64_t DYGetProfilingData()
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v0 = (uint64_t (*)(void))g_interpose_api;

  return v0();
}

uint64_t DYGetAllPerFunctionProfilingData()
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v0 = (uint64_t (*)(void))g_interpose_api;

  return v0();
}

uint64_t DYGetInterposeVersion()
{
  return 65538;
}

void sub_24F667A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  MEMORY[0x253360DD0](v3, 0x10B0C40F47DA5FCLL);
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder((GPUTools::FD::IFunctionDecoder *)va);
  _Unwind_Resume(a1);
}

void sub_24F667EB0(_Unwind_Exception *a1, volatile int *a2)
{
}

void sub_24F667FEC(_Unwind_Exception *a1, volatile int *a2)
{
}

uint64_t DYCADisplayLinkInterposeInit(DYGuestAppClient *a1)
{
  if (DYCADisplayLinkInterposeInit(DYGuestAppClient *)::onceToken != -1) {
    dispatch_once(&DYCADisplayLinkInterposeInit(DYGuestAppClient *)::onceToken, &__block_literal_global_6);
  }
  int v2 = (void *)_appClients;

  return [v2 addObject:a1];
}

void ___Z28DYCADisplayLinkInterposeInitP16DYGuestAppClient_block_invoke()
{
  uint64_t v9 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  id v5 = operator new(0xE0uLL);
  __p = v5;
  size_t v12 = v5 + 28;
  *id v5 = v9;
  v5[1] = sel__initWithDisplayLink_;
  v5[2] = &o_CADisplayLink_initWithDisplayLink;
  v5[3] = CADisplayLink_initWithDisplayLink;
  v5[4] = v8;
  void v5[5] = sel__initWithDisplayLinkItem_;
  v5[6] = &o_CADisplayLink_initWithDisplayLink;
  v5[7] = CADisplayLink_initWithDisplayLink;
  v5[8] = v0;
  v5[9] = sel_setFrameInterval_;
  v5[10] = &o_CADisplayLink_setFrameInterval;
  v5[11] = CADisplayLink_setFrameInterval;
  v5[12] = v1;
  v5[13] = sel_setPreferredFramesPerSecond_;
  v5[14] = &o_CADisplayLink_setPreferredFramesPerSecond;
  v5[15] = CADisplayLink_setPreferredFramesPerSecond;
  v5[16] = v2;
  v5[17] = sel_addToRunLoop_forMode_;
  v5[18] = &o_CADisplayLink_addToRunLoopForMode;
  v5[19] = CADisplayLink_addToRunLoopForMode;
  v5[20] = v3;
  v5[21] = sel_removeFromRunLoop_forMode_;
  v5[22] = &o_CADisplayLink_removeFromRunLoopForMode;
  v5[23] = CADisplayLink_removeFromRunLoopForMode;
  v5[24] = v4;
  v5[25] = sel_invalidate;
  v5[26] = &o_CADisplayLink_invalidate;
  v5[27] = CADisplayLink_invalidate;
  size_t v11 = v5 + 28;
  GPUTools::Interpose::DYInstallObjCMethodOverrides((Method)&__p);
  int v6 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v6, sel_displayLinkWithDisplay_target_selector_);
  if (!ClassMethod) {
    __assert_rtn("void DYCADisplayLinkInterposeInit(DYGuestAppClient *)_block_invoke", "", 0, "method");
  }
  o_CADisplayLink_displayLinkWithDisplay_target_selector = (uint64_t (*)(void, void, void, void, void))method_setImplementation(ClassMethod, (IMP)CADisplayLink_displayLinkWithDisplay_target_selector);
  _appClients = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);
  if (__p)
  {
    size_t v11 = __p;
    operator delete(__p);
  }
}

void sub_24F6682F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CADisplayLink *CADisplayLink_initWithDisplayLink(CADisplayLink *a1, objc_selector *a2, void *a3)
{
  uint64_t v4 = (CADisplayLink *)o_CADisplayLink_initWithDisplayLink(a1, a2, a3);
  if (v4)
  {
    GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v3);
    if (!spDisplayLinkIdentifierMap) {
      operator new();
    }
    uint64_t v5 = ++_CreateCADisplayLinkIdentifierFor(CADisplayLink *)::sDisplayLinkIdentifier;
    size_t v11 = v4;
    size_t v12 = &v11;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>(spDisplayLinkIdentifierMap, &v11, (uint64_t)&std::piecewise_construct, &v12)[3] = v5;
    GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v6);
    uint64_t IntervalDictionary = _GetIntervalDictionary(v4, v7);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = ___ZL33CADisplayLink_initWithDisplayLinkP13CADisplayLinkP13objc_selectorPv_block_invoke;
    v10[3] = &unk_265336790;
    v10[4] = IntervalDictionary;
    [(id)_appClients enumerateObjectsUsingBlock:v10];
  }
  return v4;
}

void sub_24F66843C(_Unwind_Exception *a1, volatile int *a2)
{
}

uint64_t CADisplayLink_setFrameInterval(CADisplayLink *a1, objc_selector *a2)
{
  o_CADisplayLink_setFrameInterval(a1, a2);
  uint64_t IntervalDictionary = _GetIntervalDictionary(a1, v3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___ZL30CADisplayLink_setFrameIntervalP13CADisplayLinkP13objc_selectorl_block_invoke;
  v6[3] = &unk_265336790;
  void v6[4] = IntervalDictionary;
  return [(id)_appClients enumerateObjectsUsingBlock:v6];
}

uint64_t CADisplayLink_setPreferredFramesPerSecond(CADisplayLink *a1, objc_selector *a2)
{
  o_CADisplayLink_setPreferredFramesPerSecond(a1, a2);
  uint64_t IntervalDictionary = _GetIntervalDictionary(a1, v3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___ZL41CADisplayLink_setPreferredFramesPerSecondP13CADisplayLinkP13objc_selectorl_block_invoke;
  v6[3] = &unk_265336790;
  void v6[4] = IntervalDictionary;
  return [(id)_appClients enumerateObjectsUsingBlock:v6];
}

uint64_t CADisplayLink_addToRunLoopForMode(CADisplayLink *a1, objc_selector *a2, NSRunLoop *a3, NSString *a4)
{
  o_CADisplayLink_addToRunLoopForMode(a1, a2);
  uint64_t CADisplayLinkIdentifierFor = _GetCADisplayLinkIdentifierFor(a1, v7);
  uint64_t v9 = NSDictionary;
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:CADisplayLinkIdentifierFor];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", &unk_2700EF508, @"event", v10, @"identifier", objc_msgSend(NSNumber, "numberWithUnsignedLong:", a3), @"runLoop", a4, @"mode", 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = ___ZL33CADisplayLink_addToRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke;
  v13[3] = &unk_265336790;
  v13[4] = v11;
  return [(id)_appClients enumerateObjectsUsingBlock:v13];
}

uint64_t CADisplayLink_removeFromRunLoopForMode(CADisplayLink *a1, objc_selector *a2, NSRunLoop *a3, NSString *a4)
{
  o_CADisplayLink_removeFromRunLoopForMode(a1, a2);
  uint64_t CADisplayLinkIdentifierFor = _GetCADisplayLinkIdentifierFor(a1, v7);
  uint64_t v9 = NSDictionary;
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:CADisplayLinkIdentifierFor];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", &unk_2700EF520, @"event", v10, @"identifier", objc_msgSend(NSNumber, "numberWithUnsignedLong:", a3), @"runLoop", a4, @"mode", 0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = ___ZL38CADisplayLink_removeFromRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke;
  v13[3] = &unk_265336790;
  v13[4] = v11;
  return [(id)_appClients enumerateObjectsUsingBlock:v13];
}

uint64_t CADisplayLink_invalidate(CADisplayLink *a1, objc_selector *a2)
{
  uint64_t v4 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", &unk_2700EF538, @"event", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", _GetCADisplayLinkIdentifierFor(a1, (volatile int *)a2)), @"identifier", 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = ___ZL24CADisplayLink_invalidateP13CADisplayLinkP13objc_selector_block_invoke;
  v8[3] = &unk_265336790;
  v8[4] = v4;
  [(id)_appClients enumerateObjectsUsingBlock:v8];
  GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v5);
  if (spDisplayLinkIdentifierMap)
  {
    uint64_t v9 = a1;
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__erase_unique<void *>((void *)spDisplayLinkIdentifierMap, &v9);
  }
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v6);
  return o_CADisplayLink_invalidate(a1, a2);
}

void sub_24F6688D8(_Unwind_Exception *a1, volatile int *a2)
{
}

uint64_t CADisplayLink_displayLinkWithDisplay_target_selector(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = [[DYDisplayLinkInterposer alloc] initWithTarget:a4 selector:a5];
  uint64_t v9 = o_CADisplayLink_displayLinkWithDisplay_target_selector(a1, a2, a3, v8, sel_forwardDisplayLinkCallback_);

  return v9;
}

uint64_t _GetIntervalDictionary(CADisplayLink *a1, volatile int *a2)
{
  uint64_t CADisplayLinkIdentifierFor = _GetCADisplayLinkIdentifierFor(a1, a2);
  uint64_t v4 = NSDictionary;
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:CADisplayLinkIdentifierFor];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CADisplayLink preferredFramesPerSecond](a1, "preferredFramesPerSecond"));
  return objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", &unk_2700EF4F0, @"event", v5, @"identifier", v6, @"targetFPS", objc_msgSend(NSNumber, "numberWithInteger:", -[CADisplayLink frameInterval](a1, "frameInterval")), @"interval", 0);
}

uint64_t ___ZL33CADisplayLink_initWithDisplayLinkP13CADisplayLinkP13objc_selectorPv_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = +[DYTransportMessage messageWithKind:1543 attributes:0 plistPayload:*(void *)(a1 + 32)];

  return [a2 sendMessage:v3];
}

void *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    size_t v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (size_t i = *v12; i; size_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2) {
            return i;
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
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  size_t i = operator new(0x20uLL);
  *size_t i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    BOOL v17 = 1;
    if (v10 >= 3) {
      BOOL v17 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v10);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v20);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v21 = *(void *)a1;
  CFNumberRef v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *size_t i = *v22;
LABEL_38:
    void *v22 = i;
    goto LABEL_39;
  }
  *size_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10) {
        v23 %= v10;
      }
    }
    else
    {
      v23 &= v10 - 1;
    }
    CFNumberRef v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_24F668CE8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      uint8x8_t v11 = (void *)*v7;
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
            void *v7 = *v11;
            *uint8x8_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint8x8_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint8x8_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t _GetCADisplayLinkIdentifierFor(CADisplayLink *a1, volatile int *a2)
{
  GPUTools::DYLockUtils::Lock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, a2);
  if (spDisplayLinkIdentifierMap
    && (uint64_t v7 = a1,
        (int8x8_t v4 = std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::find<void *>((void *)spDisplayLinkIdentifierMap, &v7)) != 0))
  {
    uint64_t v5 = v4[3];
  }
  else
  {
    uint64_t v5 = 0;
  }
  GPUTools::DYLockUtils::Unlock((os_unfair_lock_t)&sDisplayLinkIdentifierMapLock, v3);
  return v5;
}

void sub_24F668FB4(_Unwind_Exception *a1, volatile int *a2)
{
}

void *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::find<void *>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  size_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      size_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t ___ZL41CADisplayLink_setPreferredFramesPerSecondP13CADisplayLinkP13objc_selectorl_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = +[DYTransportMessage messageWithKind:1543 attributes:0 plistPayload:*(void *)(a1 + 32)];

  return [a2 sendMessage:v3];
}

uint64_t ___ZL30CADisplayLink_setFrameIntervalP13CADisplayLinkP13objc_selectorl_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = +[DYTransportMessage messageWithKind:1543 attributes:0 plistPayload:*(void *)(a1 + 32)];

  return [a2 sendMessage:v3];
}

uint64_t ___ZL33CADisplayLink_addToRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = +[DYTransportMessage messageWithKind:1543 attributes:0 plistPayload:*(void *)(a1 + 32)];

  return [a2 sendMessage:v3];
}

uint64_t ___ZL38CADisplayLink_removeFromRunLoopForModeP13CADisplayLinkP13objc_selectorP9NSRunLoopP8NSString_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = +[DYTransportMessage messageWithKind:1543 attributes:0 plistPayload:*(void *)(a1 + 32)];

  return [a2 sendMessage:v3];
}

uint64_t ___ZL24CADisplayLink_invalidateP13CADisplayLinkP13objc_selector_block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = +[DYTransportMessage messageWithKind:1543 attributes:0 plistPayload:*(void *)(a1 + 32)];

  return [a2 sendMessage:v3];
}

uint64_t *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__erase_unique<void *>(void *a1, void *a2)
{
  size_t result = std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::find<void *>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
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
  uint8x8_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint8x8_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
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
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
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
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
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
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void *std::__hash_table<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::__unordered_map_hasher<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::hash<_opaque_pthread_t *>,std::equal_to<_opaque_pthread_t *>,true>,std::__unordered_map_equal<_opaque_pthread_t *,std::__hash_value_type<_opaque_pthread_t *,unsigned long long>,std::equal_to<_opaque_pthread_t *>,std::hash<_opaque_pthread_t *>,true>,std::allocator<std::__hash_value_type<_opaque_pthread_t *,unsigned long long>>>::__emplace_unique_key_args<_opaque_pthread_t *,std::piecewise_construct_t const&,std::tuple<_opaque_pthread_t *&&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }
    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }
    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (size_t i = *v12; i; size_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2) {
            return i;
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
          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }
  size_t i = operator new(0x20uLL);
  *size_t i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    BOOL v17 = 1;
    if (v10 >= 3) {
      BOOL v17 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v10);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v20);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }
    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }
  uint64_t v21 = *(void *)a1;
  CFNumberRef v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    *size_t i = *v22;
LABEL_38:
    void *v22 = i;
    goto LABEL_39;
  }
  *size_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10) {
        v23 %= v10;
      }
    }
    else
    {
      v23 &= v10 - 1;
    }
    CFNumberRef v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_24F669658(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Interpose::DYInterposeThreadEntry(GPUTools::Interpose *this, void *a2)
{
  if ((int)this >= 2) {
    __assert_rtn("void *GPUTools::Interpose::DYInterposeThreadEntry(void *)", "", 0, "idx < kDYGraphicsAPIMax");
  }
  GPUTools::Interpose::DYInterposeCommonInit(*((GPUTools::Interpose **)&GPUTools::Interpose::g_context + (int)this), (DYGuestAppClient *(*)(void))this);
  return 0;
}

uint64_t GPUTools::Interpose::DYInitInterpose(GPUTools::Interpose *this, DYGuestAppClient *(*a2)(void))
{
  int v2 = (int)a2;
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v4 = getenv("GT_TRUE_BINARY");
  if (!v4
    || (uint8x8_t v5 = v4,
        MainBundle = CFBundleGetMainBundle(),
        CFURLRef v7 = CFBundleCopyExecutableURL(MainBundle),
        CFURLGetFileSystemRepresentation(v7, 1u, (UInt8 *)buffer, 1024),
        CFRelease(v7),
        fprintf((FILE *)*MEMORY[0x263EF8348], "true_binary=%s\npath=%s\n", v5, (const char *)buffer),
        uint64_t result = strcmp((const char *)buffer, v5),
        !result))
  {
    unsetenv("DYLD_INSERT_LIBRARIES");
    unint64_t v9 = getenv("GT_CWD");
    if (v9) {
      chdir(v9);
    }
    if (GPUTools::Interpose::DYInitInterpose(DYGuestAppClient * (*)(void),int)::onceToken != -1) {
      dispatch_once(&GPUTools::Interpose::DYInitInterpose(DYGuestAppClient * (*)(void),int)::onceToken, &__block_literal_global_7);
    }
    GPUTools::Interpose::g_context[v2] = this;
    __dmb(0xBu);
    pthread_attr_init(buffer);
    pthread_attr_setdetachstate(buffer, 2);
    pthread_t v15 = 0;
    pthread_create(&v15, buffer, (void *(__cdecl *)(void *))GPUTools::Interpose::DYInterposeThreadEntry, (void *)v2);
    pthread_attr_destroy(buffer);
    unint64_t v10 = (void *)DYGetGuestAppClient(v2);
    uint8x8_t v11 = (void *)DYGetGlobalClientTransport(v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t result = [v11 deferred], (result & 1) == 0))
    {
      do
      {
        unint64_t v12 = (void *)DYGetGuestAppClient(v2);
        uint64_t result = [(id)DYGetGlobalClientTransport(v12) invalid];
        if (result) {
          break;
        }
        char v13 = GPUTools::Interpose::gInterposeSemaphore;
        dispatch_time_t v14 = dispatch_time(0, 2000000000);
        uint64_t result = dispatch_semaphore_wait(v13, v14);
      }
      while (result);
    }
  }
  return result;
}

dispatch_semaphore_t ___ZN8GPUTools9Interpose15DYInitInterposeEPFP16DYGuestAppClientvEi_block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(0);
  GPUTools::Interpose::gInterposeSemaphore = (uint64_t)result;
  return result;
}

DYError *DYErrorFromDictionary(void *a1)
{
  dispatch_semaphore_t result = (DYError *)[a1 objectForKey:@"error domain"];
  if (result)
  {
    int8x8_t v3 = result;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"error code"), "integerValue");
    uint64_t v5 = [a1 objectForKey:@"error description"];
    uint64_t v6 = [NSDictionary dictionaryWithObject:v5 forKey:*MEMORY[0x263F08320]];
    return +[DYError errorWithDomain:v3 code:v4 userInfo:v6];
  }
  return result;
}

void *DYDictionaryFromError(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    int v2 = NSDictionary;
    uint64_t v3 = [result domain];
    return objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"error domain", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v1, "code")), @"error code", objc_msgSend(v1, "localizedDescription"), @"error description", 0);
  }
  return result;
}

uint64_t DYErrorIsTransportError(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [a1 code];
  if ((unint64_t)(v2 - 31) >= 0xA && (v2 & 0xFFFFFFFFFFFFFF00) != 0x100) {
    return 0;
  }
  uint64_t v4 = (void *)[a1 domain];

  return [v4 isEqualToString:@"DYErrorDomain"];
}

__CFString *_StringForError(uint64_t a1)
{
  if (a1 <= 511)
  {
    switch(a1)
    {
      case 1:
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid filename (%ld)", 1);
      case 2:
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"data is too large (%ld)", 2);
      case 3:
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"IO failure (%ld)", 3);
      case 4:
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"out of memory (%ld)", 4);
      case 5:
        uint64_t v3 = NSString;
        uint64_t v4 = 5;
        goto LABEL_64;
      case 6:
        uint64_t v3 = NSString;
        uint64_t v4 = 6;
LABEL_64:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(v3, "stringWithFormat:", @"Unable to connect to the device. (%ld)", v4);
        break;
      case 7:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"read-only capture archive (%ld)", 7);
        break;
      case 8:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"truncated capture archive store (%ld)", 8);
        break;
      case 9:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"truncated capture archive index (%ld)", 9);
        break;
      case 10:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid capture archive index (%ld)", 10);
        break;
      case 11:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"unknown capture archive index version (%ld)", 11);
        break;
      case 12:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"file exists in capture archive (%ld)", 12);
        break;
      case 13:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"file does not exists in capture archive (%ld)", 13);
        break;
      case 14:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"capture archive does not exist (%ld)", 14);
        break;
      case 15:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"missing capture archive index (%ld)", 15);
        break;
      case 16:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid capture archive metadata (%ld)", 16);
        break;
      case 17:
      case 27:
        return 0;
      case 18:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"corrupted capture archive store (%ld)", 18);
        break;
      case 19:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"could not write capture archive metadata (%ld)", 19);
        break;
      case 20:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"capture archive has been closed (%ld)", 20);
        break;
      case 21:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"already tried to launch guest app (%ld)", 21);
        break;
      case 22:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid launch dictionary (%ld)", 22);
        break;
      case 23:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"guest app not found (%ld)", 23);
        break;
      case 24:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"guest app launch timed out (%ld)", 24);
        break;
      case 25:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid guest app session (%ld)", 25);
        break;
      case 26:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"guest app has not been launched yet (%ld)", 26);
        break;
      case 28:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"did not find interpose dylib (%ld)", 28);
        break;
      case 29:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"failed to launch guest app (%ld)", 29);
        break;
      case 30:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"guest app terminated (%ld)", 30);
        break;
      case 31:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"lost transport connection (%ld)", 31);
        break;
      case 32:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid transport (%ld)", 32);
        break;
      case 33:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"transport is not connected (%ld)", 33);
        break;
      case 34:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"message has already been sent (%ld)", 34);
        break;
      case 35:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"in-reply-to message has not been sent (%ld)", 35);
        break;
      case 36:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"failed to encode message attributes (%ld)", 36);
        break;
      case 37:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"connect timed out (%ld)", 37);
        break;
      case 38:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"undefined socket path (%ld)", 38);
        break;
      case 39:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"socket path is too long (%ld)", 39);
        break;
      case 40:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"message originated from this transport (%ld)", 40);
        break;
      case 41:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"initialized function stream with immutable data but swapping is required (%ld)", 41);
        break;
      case 42:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"transfer refused (%ld)", 42);
        break;
      case 43:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"protocol error (%ld)", 43);
        break;
      case 44:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"path outside destination root (%ld)", 44);
        break;
      case 45:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"transfer aborted (%ld)", 45);
        break;
      case 46:
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"unknown item type (%ld)", 46);
        break;
      default:
        switch(a1)
        {
          case 256:
            dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid socket descriptor (%ld)", 256);
            break;
          case 257:
            dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid socket url (%ld)", 257);
            break;
          case 258:
            dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"transport source cancelled (%ld)", 258);
            break;
          case 259:
            dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"corrupt transport message header (%ld)", 259);
            break;
          case 260:
            dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"corrupt transport message attributes (%ld)", 260);
            break;
          case 261:
            dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"message too large (%ld)", 261);
            break;
          default:
            return 0;
        }
        break;
    }
    return result;
  }
  if (a1 <= 2047)
  {
    if (a1 <= 1023)
    {
      uint64_t v2 = a1 - 512;
      dispatch_semaphore_t result = @"Device connection lost.";
      switch(v2)
      {
        case 0:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"guest app crashed (%ld)", 512);
          break;
        case 1:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"another capture session is active (%ld)", 513);
          break;
        case 2:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"capture session is already active (%ld)", 514);
          break;
        case 3:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"capture session activation failed (%ld)", 515);
          break;
        case 4:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"inferior already running (%ld)", 516);
          break;
        case 5:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"GL dispatch table mismatch (%ld)", 517);
          break;
        case 6:
          dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"inferior and host session ids mismatch (%ld)", 518);
          break;
        case 7:
          return result;
        default:
          return 0;
      }
      return result;
    }
    if (a1 <= 1279)
    {
      switch(a1)
      {
        case 1024:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"truncated data (%ld)", 1024);
        case 1025:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid transport message payload (%ld)", 1025);
        case 1026:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"unexpected transport message (%ld)", 1026);
      }
    }
    else if (a1 > 1791)
    {
      if (a1 == 1792) {
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no data (%ld)", 1792);
      }
      if (a1 == 1793) {
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"guest app session error (%ld)", 1793);
      }
    }
    else
    {
      if (a1 == 1280) {
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"invalid function stream header (%ld)", 1280);
      }
      if (a1 == 1536) {
        return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"position does not exist in archive (%ld)", 1536);
      }
    }
    return 0;
  }
  if (a1 <= 4351)
  {
    if (a1 > 2304)
    {
      switch(a1)
      {
        case 2305:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no archive data (%ld)", 2305);
        case 2306:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no thumbnail support (%ld)", 2306);
        case 4096:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"failed to create core symbolicator (%ld)", 4096);
      }
    }
    else
    {
      switch(a1)
      {
        case 2048:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"already replaying (%ld)", 2048);
        case 2049:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no loaded archives (%ld)", 2049);
        case 2304:
          return (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"no resource streamer (%ld)", 2304);
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 4608:
      dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Cannot find the specified username and host (%ld)", 4608);
      break;
    case 4609:
      dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Specified remote machine is not available. Please make sure to login with specified user (%ld)", 4609);
      break;
    case 4610:
      dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Cannot find the target path provided (%ld)", 4610);
      break;
    case 4611:
      dispatch_semaphore_t result = (__CFString *)[NSString stringWithFormat:@"Cannot authenticate SSH, make sure the authentication is done right (%ld)", 4611];
      break;
    case 4612:
      dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Cannot find Xcode.app on the remote machine. Please make sure that Xcode.app is in the Applications folder (%ld)", 4612);
      break;
    case 4613:
      dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Metal.framework is not available on the remote machine (%ld)", 4613);
      break;
    case 4614:
      dispatch_semaphore_t result = (__CFString *)[NSString stringWithFormat:@"Missing environment variables, please make sure all the required environment variables are enabled (%ld)", 4614];
      break;
    default:
      if (a1 == 4352)
      {
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Shader profiler failed due to an internal error (%ld)", 4352);
      }
      else
      {
        if (a1 != 4353) {
          return 0;
        }
        dispatch_semaphore_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Shader profiler does not support multi-context captures (%ld)", 4353);
      }
      break;
  }
  return result;
}

void *GPUTools::error::__init@<X0>(GPUTools::error *this@<X0>, void *a2@<X8>)
{
  uint64_t v4 = _StringForError((uint64_t)this);
  if (!v4) {
    uint64_t v4 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"unknown error (%ld)", this);
  }
  uint64_t v5 = (char *)[(__CFString *)v4 UTF8String];

  return std::string::basic_string[abi:ne180100]<0>(a2, v5);
}

void GPUTools::FB::Decoder::EmitRichSemanticTypes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t v5 = *(void *)(a2 + 24);
  int v6 = *(_DWORD *)v5;
  switch(a4)
  {
    case 1u:
      int v7 = 29;
      if (v6 > 469)
      {
        if (v6 > 799)
        {
          if ((v6 - 800) > 0x2D) {
            goto LABEL_62;
          }
          if (((1 << (v6 - 32)) & 0x3C0001800000) != 0) {
            goto LABEL_31;
          }
          if (v6 != 800)
          {
LABEL_62:
            if (v6 == 897)
            {
              int v8 = 31;
              goto LABEL_71;
            }
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        if (v6 == 470)
        {
          int v8 = 22;
          goto LABEL_71;
        }
        if (v6 == 497) {
          goto LABEL_67;
        }
      }
      else
      {
        if (v6 > 138)
        {
          if (v6 <= 381)
          {
            switch(v6)
            {
              case 139:
              case 143:
              case 146:
                goto LABEL_31;
              case 140:
                goto LABEL_67;
              default:
                goto LABEL_65;
            }
          }
          if (v6 != 382 && v6 != 384)
          {
            if (v6 == 469)
            {
              int v8 = 21;
              goto LABEL_71;
            }
            goto LABEL_65;
          }
LABEL_31:
          int v7 = 27;
          goto LABEL_67;
        }
        if (v6 <= 35)
        {
          if (v6 != 2)
          {
            if (v6 != 10) {
              goto LABEL_65;
            }
            goto LABEL_31;
          }
LABEL_66:
          int v7 = 32;
LABEL_67:
          *(_DWORD *)(a3 + 12) = v7;
          goto LABEL_68;
        }
        if (v6 == 36)
        {
LABEL_8:
          int v8 = 20;
LABEL_71:
          *(_DWORD *)(a3 + 12) = v8;
          return;
        }
        if (v6 == 44) {
          goto LABEL_66;
        }
      }
LABEL_65:
      if ((v6 - 386) <= 0x1F) {
        goto LABEL_66;
      }
LABEL_68:
      if (a4 && (v6 & 0xFFFFFFFE) == 0x1A)
      {
        int v8 = 28;
        goto LABEL_71;
      }
      if (a4)
      {
        int v8 = 17;
        if (v6 == 78 || v6 == 131 || a4 >= 2 && v6 == 79) {
          goto LABEL_71;
        }
      }
      if (a5 == 1 && v6 == 235)
      {
        int v8 = 30;
        goto LABEL_71;
      }
      return;
    case 2u:
      if (v6 > 246)
      {
        int v7 = 25;
        switch(v6)
        {
          case 879:
          case 881:
          case 885:
            goto LABEL_67;
          case 880:
          case 883:
          case 884:
            goto LABEL_68;
          case 882:
            goto LABEL_47;
          default:
            if (v6 == 247) {
              goto LABEL_47;
            }
            if (v6 != 920) {
              goto LABEL_68;
            }
            int v8 = 24;
            break;
        }
        goto LABEL_71;
      }
      if (v6 > 233)
      {
        if (v6 == 234 || v6 == 238)
        {
LABEL_47:
          if (**(_DWORD **)(v5 + 72) >> 1 == 17008) {
            goto LABEL_66;
          }
        }
      }
      else
      {
        if (v6 == 141) {
          goto LABEL_26;
        }
        if (v6 == 217) {
          goto LABEL_18;
        }
      }
      goto LABEL_68;
    case 3u:
      if (v6 > 860)
      {
        if ((v6 - 861) > 0x18) {
          goto LABEL_68;
        }
        int v11 = 1 << (v6 - 93);
        if ((v11 & 0xA03) == 0)
        {
          if ((v11 & 0x1040000) == 0) {
            goto LABEL_68;
          }
          int v7 = 26;
          goto LABEL_67;
        }
      }
      else if ((v6 - 598) >= 4 && (v6 - 294) >= 2)
      {
        if (v6 != 216) {
          goto LABEL_68;
        }
LABEL_18:
        int v8 = 17;
        goto LABEL_71;
      }
      if (**(_DWORD **)(v5 + 96) != 34892) {
        goto LABEL_68;
      }
      int v7 = 29;
      goto LABEL_67;
    case 4u:
      if (v6 == 865)
      {
        int v8 = 23;
        goto LABEL_71;
      }
      if (v6 != 240) {
        goto LABEL_68;
      }
      int v9 = **(_DWORD **)(v5 + 120);
      if (v9 == 36048 || v9 == 36051)
      {
LABEL_26:
        int v8 = 29;
        goto LABEL_71;
      }
      return;
    default:
      if (a4 == 9 && v6 == 28) {
        goto LABEL_8;
      }
      goto LABEL_68;
  }
}

void GPUTools::FB::Decoder::DecodeArguments(unsigned char *a1, uint64_t a2, char *a3, int a4, uint64_t a5)
{
  uint64_t v5 = (void *)a2;
  __endptr[0] = a3;
  int v6 = *(char **)(a2 + 16);
  unsigned int v93 = 0;
  unsigned __int8 v7 = *a3;
  if (*a3)
  {
    uint64_t v8 = a5;
    int v9 = a1;
    int v10 = 0;
    size_t v11 = 0;
    unint64_t v12 = 0;
    unsigned int v13 = 0;
    int v14 = 0;
    v79 = (GPUTools::AlignmentBuffer *)(a2 + 32);
    v78 = (void **)(a2 + 64);
    while (1)
    {
      BOOL v15 = v7 == 117;
      if (v7 == 117) {
        goto LABEL_4;
      }
      uint64_t v16 = 0;
      if (v7 <= 0x3Fu)
      {
        if (v7 == 35)
        {
          __endptr[0] = a3 + 1;
          unsigned int v58 = strtoul(a3 + 1, __endptr, 10);
          int v9 = a1;
          int v14 = v58;
          if (a1[13]) {
            int v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          }
          if (!a1[12]) {
            goto LABEL_116;
          }
          if (v58)
          {
            uint64_t v73 = v58;
            v74 = (unsigned int *)v6;
            do
            {
              unsigned int *v74 = bswap32(*v74);
              ++v74;
              --v73;
            }
            while (v73);
LABEL_116:
            unsigned int v59 = (unsigned __int16)v10;
            *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) = 2;
            if (v58 >= 0x10000)
            {
              v77 = "array_to_decode_count <= std::numeric_limits<decltype(arguments[argument_count].length)>::max()";
              goto LABEL_245;
            }
          }
          else
          {
            unsigned int v59 = (unsigned __int16)v10;
            *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) = 2;
          }
          unsigned int v13 = 0;
          *(_WORD *)(v8 + 24 * v59 + 20) = v58;
          v11 += 4 * v58;
          unint64_t v12 = v6;
          goto LABEL_191;
        }
        if (v7 == 60)
        {
          int v50 = a3[1];
          __endptr[0] = a3 + 1;
          BOOL v51 = v50 != 117;
          if (v50 == 117 || v50 == 99)
          {
            char v54 = a3[2];
            v52 = a3 + 2;
            char v53 = v54;
            __endptr[0] = v52;
          }
          else
          {
            BOOL v51 = 0;
            v52 = a3 + 1;
            char v53 = v50;
          }
          uint64_t v61 = v53;
          if ((int)v61 <= 114)
          {
            int v62 = 9;
            switch((int)v61)
            {
              case 'b':
                if (v50 == 117) {
                  int v62 = 2;
                }
                else {
                  int v62 = 1;
                }
                goto LABEL_211;
              case 'd':
                int v62 = 10;
                goto LABEL_211;
              case 'f':
                goto LABEL_211;
              case 'i':
                if (v50 == 117) {
                  int v62 = 6;
                }
                else {
                  int v62 = 5;
                }
                goto LABEL_211;
              case 'l':
                if (v50 == 117) {
                  int v62 = 12;
                }
                else {
                  int v62 = 11;
                }
                goto LABEL_211;
              default:
                goto LABEL_250;
            }
          }
          switch(v61)
          {
            case 's':
              if (v50 == 117) {
                int v62 = 4;
              }
              else {
                int v62 = 3;
              }
              break;
            case 't':
              int v62 = 13;
              break;
            case 'w':
              if (v50 == 117) {
                int v62 = 8;
              }
              else {
                int v62 = 7;
              }
              break;
            default:
LABEL_250:
              dy_abort("unknown or invalid format character: '%c' (in '%s')\n", v61, v52);
          }
LABEL_211:
          int v70 = (unsigned __int16)v10 - 1;
          *(_DWORD *)(v8 + 24 * v70 + 12) = v62;
          if (v51) {
            *(_WORD *)(v8 + 24 * v70 + 22) |= 4u;
          }
          __endptr[0] = v52 + 2;
          goto LABEL_191;
        }
        signed __int8 v17 = v7;
        if (v7 == 58) {
          dy_abort("url list decoding is no longer supported");
        }
        goto LABEL_5;
      }
      if (v7 != 64) {
        break;
      }
      __endptr[0] = a3 + 1;
      unsigned int v60 = strtoul(a3 + 1, __endptr, 10);
      unsigned int v93 = v60;
      *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) = 1;
      if (v60 >= 0x10000)
      {
        v77 = "array_lengths[0] <= std::numeric_limits<decltype(arguments[argument_count].length)>::max()";
LABEL_245:
        __assert_rtn("void GPUTools::FB::Decoder::DecodeArguments(DecodeJob &, const char *, uint32_t, Argument *) const", "", 0, v77);
      }
      unsigned int v13 = 0;
      *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 20) = v60;
      unint64_t v12 = (char *)&v93;
      int v14 = 1;
      int v9 = a1;
LABEL_191:
      a3 = __endptr[0];
      unsigned __int8 v7 = *__endptr[0];
      if (!*__endptr[0]) {
        goto LABEL_240;
      }
    }
    if (v7 == 99)
    {
LABEL_4:
      uint64_t v16 = v7 != 117;
      signed __int8 v18 = *++a3;
      signed __int8 v17 = v18;
      __endptr[0] = a3;
    }
    else
    {
      signed __int8 v17 = v7;
    }
LABEL_5:
    uint64_t v19 = v17;
    int v90 = v10;
    int v91 = v16;
    if (v14)
    {
      int v20 = v19 - 65;
      if ((v19 - 65) > 0x37 || ((1 << v20) & 0xCCA93A01BFFDBFLL) == 0) {
LABEL_248:
      }
        dy_abort("unknown format character: '%c' (in '%s')\n", v19, a3);
      v83 = &v6[v11];
      size_t v84 = v11;
      uint64_t v21 = v8 + 24 * (unsigned __int16)v10;
      CFNumberRef v22 = (int *)(v21 + 8);
      unint64_t v85 = (unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      v86 = (_WORD *)(v21 + 22);
      uint64_t v23 = 1;
      do
      {
        size_t v24 = &v6[v11];
        switch(v20)
        {
          case 0:
          case 1:
          case 4:
          case 5:
          case 7:
          case 8:
          case 10:
          case 11:
          case 14:
          case 16:
          case 17:
          case 19:
          case 23:
          case 36:
            LOBYTE(v15) = 1;
            goto LABEL_11;
          case 2:
          case 13:
          case 15:
          case 47:
            LOBYTE(v15) = 1;
            goto LABEL_28;
          case 3:
          case 12:
          case 24:
          case 51:
            LOBYTE(v15) = 1;
            goto LABEL_20;
          case 33:
            if (v15) {
              int v41 = 2;
            }
            else {
              int v41 = 1;
            }
            int *v22 = v41;
            uint64_t v42 = *(unsigned int *)&v12[4 * v13];
            v11 += v42;
            *(_DWORD *)&v12[4 * v13] = v11 - v42;
            break;
          case 35:
            if (v9[13]) {
              v43 = (unint64_t *)((unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            }
            else {
              v43 = (unint64_t *)&v6[v11];
            }
            int v30 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v30)
            {
              uint64_t v49 = *(unsigned int *)&v12[4 * v13];
              do
              {
                unint64_t *v43 = bswap64(*v43);
                ++v43;
                --v49;
              }
              while (v49);
            }
            uint64_t v31 = v13;
            int v32 = 10;
            goto LABEL_35;
          case 37:
          case 45:
            if (v9[13]) {
              unint64_t v34 = (unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL;
            }
            else {
              unint64_t v34 = (unint64_t)&v6[v11];
            }
            uint64_t v26 = v13;
            LODWORD(v27) = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v27)
            {
              unint64_t v47 = 0;
              do
              {
                *(_DWORD *)(v34 + 4 * v47) = bswap32(*(_DWORD *)(v34 + 4 * v47));
                ++v47;
                unint64_t v27 = *(unsigned int *)&v12[4 * v13];
              }
              while (v47 < v27);
            }
            int v28 = 9;
            goto LABEL_18;
          case 40:
          case 55:
LABEL_11:
            if (v9[13]) {
              unint64_t v25 = (unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL;
            }
            else {
              unint64_t v25 = (unint64_t)&v6[v11];
            }
            uint64_t v26 = v13;
            LODWORD(v27) = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v27)
            {
              unint64_t v44 = 0;
              do
              {
                *(_DWORD *)(v25 + 4 * v44) = bswap32(*(_DWORD *)(v25 + 4 * v44));
                ++v44;
                unint64_t v27 = *(unsigned int *)&v12[4 * v13];
              }
              while (v44 < v27);
            }
            if (v15) {
              int v28 = 6;
            }
            else {
              int v28 = 5;
            }
LABEL_18:
            int *v22 = v28;
            v11 += (4 * v27);
            *(_DWORD *)&v12[4 * v26] = v11 - 4 * v27;
            goto LABEL_36;
          case 43:
LABEL_20:
            if (v9[13]) {
              char v29 = (unint64_t *)((unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            }
            else {
              char v29 = (unint64_t *)&v6[v11];
            }
            int v30 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v30)
            {
              uint64_t v45 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *char v29 = bswap64(*v29);
                ++v29;
                --v45;
              }
              while (v45);
            }
            uint64_t v31 = v13;
            if (v15) {
              int v32 = 12;
            }
            else {
              int v32 = 11;
            }
            goto LABEL_35;
          case 50:
            if (v9[13]) {
              v38 = (char *)((unint64_t)(v24 + 1) & 0xFFFFFFFFFFFFFFFELL);
            }
            else {
              v38 = &v6[v11];
            }
            int v39 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v39)
            {
              uint64_t v48 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *(_WORD *)v38 = bswap32(*(unsigned __int16 *)v38) >> 16;
                v38 += 2;
                --v48;
              }
              while (v48);
            }
            if (v15) {
              int v40 = 4;
            }
            else {
              int v40 = 3;
            }
            int *v22 = v40;
            v11 += (2 * v39);
            *(_DWORD *)&v12[4 * v13] = v11 - 2 * v39;
            uint64_t v23 = 2;
            break;
          case 54:
LABEL_28:
            if (v9[13]) {
              char v33 = (unint64_t *)((unint64_t)(v24 + 3) & 0xFFFFFFFFFFFFFFFCLL);
            }
            else {
              char v33 = (unint64_t *)&v6[v11];
            }
            int v30 = *(_DWORD *)&v12[4 * v13];
            if (v9[12] && v30)
            {
              uint64_t v46 = *(unsigned int *)&v12[4 * v13];
              do
              {
                *char v33 = bswap64(*v33);
                ++v33;
                --v46;
              }
              while (v46);
            }
            uint64_t v31 = v13;
            if (v15) {
              int v32 = 8;
            }
            else {
              int v32 = 7;
            }
LABEL_35:
            int *v22 = v32;
            v11 += (8 * v30);
            *(_DWORD *)&v12[4 * v31] = v11 - 8 * v30;
LABEL_36:
            uint64_t v23 = 4;
            break;
          default:
            uint64_t v87 = v19;
            v88 = v6;
            int *v22 = 13;
            *v86 |= 0x40u;
            int v35 = v9[13];
            if (v9[13])
            {
              uint64_t v23 = 4;
              size_t v24 = (char *)v85;
            }
            uint64_t v36 = *(unsigned int *)&v24[4 * (*(_DWORD *)&v12[4 * v13] - 1)];
            uint64_t v16 = strlen(&v24[v36]);
            if (v35) {
              int v37 = v16 + 1;
            }
            else {
              int v37 = (v16 & 0xFFFFFFFC) + 4;
            }
            v11 += (v36 + v37);
            uint64_t v5 = (void *)a2;
            int v6 = v88;
            int v9 = a1;
            uint64_t v19 = v87;
            break;
        }
        ++v13;
        --v14;
      }
      while (v14);
      if (v9[13])
      {
        int v6 = (char *)(((unint64_t)&v83[v23 - 1] & -v23) - v84);
        uint64_t v8 = a5;
        goto LABEL_154;
      }
      uint64_t v8 = a5;
    }
    else
    {
      *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 20) = 1;
      switch(v17)
      {
        case 'A':
        case 'B':
        case 'E':
        case 'F':
        case 'H':
        case 'I':
        case 'K':
        case 'L':
        case 'O':
        case 'Q':
        case 'R':
        case 'T':
        case 'X':
        case 'e':
          BOOL v15 = 1;
          goto LABEL_101;
        case 'C':
        case 'N':
        case 'P':
        case 'p':
          BOOL v15 = 1;
          goto LABEL_135;
        case 'D':
        case 'M':
        case 'Y':
        case 't':
          BOOL v15 = 1;
          goto LABEL_143;
        case 'S':
        case 'U':
        case 'V':
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 8) = 13;
          if (v5[1] - (void)v6 + v5[2] >= 4uLL && *(_DWORD *)v6 == -1)
          {
            *(void *)(v8 + 24 * (unsigned __int16)v10) = 0;
            size_t v11 = 8;
            goto LABEL_155;
          }
          uint64_t v69 = v17;
          uint64_t v16 = strlen(v6);
          int v9 = a1;
          if (a1[13])
          {
            size_t v11 = v16 + 1;
            uint64_t v19 = v69;
            goto LABEL_154;
          }
          size_t v11 = (v16 & 0xFFFFFFFFFFFFFFFCLL) + 4;
          uint64_t v23 = 1;
          uint64_t v19 = v69;
          break;
        case 'b':
          if (v7 == 117) {
            int v71 = 2;
          }
          else {
            int v71 = 1;
          }
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 8) = v71;
          int v55 = v9[13];
          uint64_t v23 = 1;
          size_t v11 = 1;
          goto LABEL_152;
        case 'd':
          int v55 = v9[13];
          if (v9[13]) {
            int v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          }
          if (v9[12]) {
            *(void *)int v6 = bswap64(*(void *)v6);
          }
          uint64_t v64 = v8 + 24 * (unsigned __int16)v10;
          int v63 = 10;
          goto LABEL_151;
        case 'f':
        case 'n':
          int v55 = v9[13];
          if (v9[13]) {
            int v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          }
          if (v9[12]) {
            *(_DWORD *)int v6 = bswap32(*(_DWORD *)v6);
          }
          uint64_t v57 = v8 + 24 * (unsigned __int16)v10;
          int v56 = 9;
          goto LABEL_109;
        case 'i':
        case 'x':
LABEL_101:
          int v55 = v9[13];
          if (v9[13]) {
            int v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          }
          if (v9[12]) {
            *(_DWORD *)int v6 = bswap32(*(_DWORD *)v6);
          }
          if (v15) {
            int v56 = 6;
          }
          else {
            int v56 = 5;
          }
          uint64_t v57 = v8 + 24 * (unsigned __int16)v10;
LABEL_109:
          *(_DWORD *)(v57 + 8) = v56;
          uint64_t v23 = 4;
          size_t v11 = 4;
          goto LABEL_152;
        case 'l':
LABEL_143:
          int v55 = v9[13];
          if (v9[13]) {
            int v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          }
          if (v9[12]) {
            *(void *)int v6 = bswap64(*(void *)v6);
          }
          if (v15) {
            int v63 = 12;
          }
          else {
            int v63 = 11;
          }
          goto LABEL_150;
        case 's':
          int v55 = v9[13];
          if (v9[13]) {
            int v6 = (char *)((unint64_t)(v6 + 1) & 0xFFFFFFFFFFFFFFFELL);
          }
          if (v9[12]) {
            *(_WORD *)int v6 = bswap32(*(unsigned __int16 *)v6) >> 16;
          }
          if (v7 == 117) {
            int v72 = 4;
          }
          else {
            int v72 = 3;
          }
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 8) = v72;
          uint64_t v23 = 2;
          size_t v11 = 2;
          goto LABEL_152;
        case 'w':
LABEL_135:
          int v55 = v9[13];
          if (v9[13]) {
            int v6 = (char *)((unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL);
          }
          if (v9[12]) {
            *(void *)int v6 = bswap64(*(void *)v6);
          }
          if (v15) {
            int v63 = 8;
          }
          else {
            int v63 = 7;
          }
LABEL_150:
          uint64_t v64 = v8 + 24 * (unsigned __int16)v10;
LABEL_151:
          *(_DWORD *)(v64 + 8) = v63;
          uint64_t v23 = 4;
          size_t v11 = 8;
LABEL_152:
          if (!v55) {
            break;
          }
          goto LABEL_154;
        default:
          goto LABEL_248;
      }
    }
    if ((char *)((unint64_t)&v6[v23 - 1] & -v23) != v6)
    {
      uint64_t v75 = v19;
      uint64_t v76 = GPUTools::AlignmentBuffer::CopyAndAlign(v79, v6, v11, v23);
      int v10 = v90;
      *(void *)(v8 + 24 * (unsigned __int16)v90) = v76;
      uint64_t v92 = v8 + 24 * (unsigned __int16)v90;
      std::vector<void **>::push_back[abi:ne180100](v78, &v92);
      uint64_t v19 = v75;
      int v9 = a1;
LABEL_155:
      switch((int)v19)
      {
        case 'A':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 45;
          goto LABEL_183;
        case 'B':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 37;
          goto LABEL_183;
        case 'C':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 15;
          goto LABEL_183;
        case 'D':
        case 'H':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 40;
          goto LABEL_183;
        case 'E':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 46;
          goto LABEL_183;
        case 'F':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 38;
          goto LABEL_183;
        case 'I':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 42;
          goto LABEL_183;
        case 'K':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 44;
          goto LABEL_183;
        case 'L':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 36;
          goto LABEL_183;
        case 'M':
        case 'O':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 41;
          goto LABEL_183;
        case 'N':
        case 'e':
        case 'n':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 18;
          goto LABEL_183;
        case 'P':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 47;
          goto LABEL_183;
        case 'Q':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 43;
          goto LABEL_183;
        case 'R':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 35;
          goto LABEL_183;
        case 'S':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 14;
          goto LABEL_183;
        case 'T':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 34;
          goto LABEL_183;
        case 'U':
          uint64_t v67 = v8 + 24 * (unsigned __int16)v10;
          *(_DWORD *)(v67 + 12) = 0;
          __int16 v68 = *(_WORD *)(v67 + 22) | 8;
          goto LABEL_179;
        case 'V':
          uint64_t v67 = v8 + 24 * (unsigned __int16)v10;
          *(_DWORD *)(v67 + 12) = 12;
          __int16 v68 = *(_WORD *)(v67 + 22) | 0x10;
LABEL_179:
          *(_WORD *)(v67 + 22) = v68;
          goto LABEL_184;
        case 'X':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 39;
          goto LABEL_183;
        case 'Y':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 33;
          goto LABEL_183;
        case 'b':
        case 'd':
        case 'f':
        case 'i':
        case 'l':
        case 's':
        case 'w':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = *(_DWORD *)(v65 + 8);
          goto LABEL_183;
        case 'p':
        case 't':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 13;
          goto LABEL_183;
        case 'x':
          uint64_t v65 = v8 + 24 * (unsigned __int16)v10;
          int v66 = 19;
LABEL_183:
          *(_DWORD *)(v65 + 12) = v66;
LABEL_184:
          if (v9[14])
          {
            GPUTools::FB::Decoder::EmitRichSemanticTypes(v16, (uint64_t)v5, v8 + 24 * (unsigned __int16)v10, (unsigned __int16)v10, a4);
            int v9 = a1;
          }
          if (v91) {
            *(_WORD *)(v8 + 24 * (unsigned __int16)v10 + 22) |= 4u;
          }
          *(_DWORD *)(v8 + 24 * (unsigned __int16)v10 + 16) = v11;
          v6 += v11;
          if (v5[1] < (unint64_t)&v6[-v5[2]])
          {
            v77 = "job.capacity >= BUFFER_DELTA(job.read_ptr, read_ptr)";
            goto LABEL_245;
          }
          ++__endptr[0];
          if ((unsigned __int16)++v10 >= 0x11u)
          {
            v77 = "argument_count <= FBUF_MAX_ARGUMENTS";
            goto LABEL_245;
          }
          int v14 = 0;
          size_t v11 = 0;
          break;
        default:
          dy_abort("unknown format character: '%c' (in '%s')\n", v19, __endptr[0]);
      }
      goto LABEL_191;
    }
LABEL_154:
    int v10 = v90;
    *(void *)(v8 + 24 * (unsigned __int16)v90) = v6;
    goto LABEL_155;
  }
  LOWORD(v10) = 0;
LABEL_240:
  if (!a4) {
    *(_WORD *)(v5[3] + 10) = v10;
  }
  v5[2] = (unint64_t)(v6 + 3) & 0xFFFFFFFFFFFFFFFCLL;
}

void std::vector<void **>::push_back[abi:ne180100](void **a1, void *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unsigned __int8 v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((char *)v7 - (unsigned char *)*a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      unsigned int v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v4, v12);
    }
    else {
      unsigned int v13 = 0;
    }
    int v14 = &v13[8 * v9];
    BOOL v15 = &v13[8 * v12];
    *(void *)int v14 = *a2;
    uint64_t v8 = v14 + 8;
    signed __int8 v17 = (char *)*a1;
    uint64_t v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      uint64_t v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    void *v7 = *a2;
    uint64_t v8 = v7 + 1;
  }
  a1[1] = v8;
}

uint64_t GPUTools::FB::Decoder::Decoder(uint64_t result, int a2, char a3)
{
  *(void *)dispatch_semaphore_t result = &unk_2700E5E88;
  *(_DWORD *)(result + 8) = a2;
  *(unsigned char *)(result + 12) = a3;
  *(unsigned char *)(result + 14) = 1;
  if (a2 >= 5) {
    dy_abort("unknown or unsupported fbuf version: %d", a2);
  }
  *(unsigned char *)(result + 13) = a2 == 4;
  return result;
}

void sub_24F66BC38(_Unwind_Exception *a1)
{
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder(v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FB::Decoder::DecodeHeader(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 8);
  if ((v2 - 3) < 2)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3 > 0x23)
    {
      uint64_t v4 = *(void *)(a2 + 16);
      if (*(unsigned char *)(result + 12))
      {
        *(int8x8_t *)uint64_t v4 = vrev32_s8(*(int8x8_t *)v4);
        *(int8x16_t *)(v4 + 8) = vrev64q_s8(*(int8x16_t *)(v4 + 8));
        *(void *)(v4 + 24) = bswap64(*(void *)(v4 + 24));
        *(_DWORD *)(v4 + 32) = bswap32(*(_DWORD *)(v4 + 32));
      }
      int v5 = *(_DWORD *)(v4 + 32);
      long long v6 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(a2 + 88) = *(_OWORD *)v4;
      *(_DWORD *)(a2 + 120) = v5;
      *(_OWORD *)(a2 + 104) = v6;
      unsigned __int8 v7 = (__int8 *)(v4 + 36);
      unsigned int v8 = *(_DWORD *)(a2 + 88);
      goto LABEL_6;
    }
    int v20 = "job.capacity >= sizeof(dy_fbuf_header_v4_t)";
LABEL_26:
    __assert_rtn("void GPUTools::FB::Decoder::DecodeHeader(DecodeJob &) const", "", 0, v20);
  }
  if (v2)
  {
    if (v2 == 1)
    {
      unint64_t v3 = *(void *)(a2 + 8);
      if (v3 <= 0x17)
      {
        int v20 = "job.capacity >= sizeof(dy_fbuf_header_v1_t)";
        goto LABEL_26;
      }
      unint64_t v12 = *(int8x16_t **)(a2 + 16);
      unsigned int v8 = v12->i32[0];
      if (*(unsigned char *)(result + 12))
      {
        int8x16_t v21 = vrev32q_s8(*v12);
        int8x16_t *v12 = v21;
        v12[1].i64[0] = bswap64(v12[1].u64[0]);
        unsigned int v8 = v21.i32[0];
      }
      __int32 v13 = v12->i32[1];
      __int32 v14 = v12->i32[2];
      uint64_t v15 = v12->u32[3];
      uint64_t v16 = v12[1].i64[0];
      *(_DWORD *)(a2 + 88) = v8;
      *(_DWORD *)(a2 + 92) = v13;
      *(void *)(a2 + 104) = v16;
      *(void *)(a2 + 112) = v15;
      *(void *)(a2 + 96) = 0;
      *(_DWORD *)(a2 + 120) = v14;
      unsigned __int8 v7 = &v12[1].i8[8];
    }
    else
    {
      if (v2 != 2) {
        dy_abort("unknown or unsupported fbuf version: %d", *(_DWORD *)(result + 8));
      }
      unint64_t v3 = *(void *)(a2 + 8);
      if (v3 <= 0x1B)
      {
        int v20 = "job.capacity >= sizeof(dy_fbuf_header_v2_t)";
        goto LABEL_26;
      }
      uint64_t v17 = *(void *)(a2 + 16);
      unsigned int v8 = *(_DWORD *)v17;
      if (*(unsigned char *)(result + 12))
      {
        unsigned int v8 = bswap32(v8);
        unsigned int v22 = bswap32(*(_DWORD *)(v17 + 4));
        *(_DWORD *)uint64_t v17 = v8;
        *(_DWORD *)(v17 + 4) = v22;
        *(int8x16_t *)(v17 + 8) = vrev64q_s8(*(int8x16_t *)(v17 + 8));
        *(_DWORD *)(v17 + 24) = bswap32(*(_DWORD *)(v17 + 24));
      }
      int v18 = *(_DWORD *)(v17 + 4);
      int v19 = *(_DWORD *)(v17 + 24);
      *(_DWORD *)(a2 + 88) = v8;
      *(_DWORD *)(a2 + 92) = v18;
      *(_OWORD *)(a2 + 104) = *(_OWORD *)(v17 + 8);
      *(void *)(a2 + 96) = 0;
      *(_DWORD *)(a2 + 120) = v19;
      unsigned __int8 v7 = (__int8 *)(v17 + 28);
    }
  }
  else
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3 <= 0xB)
    {
      int v20 = "job.capacity >= sizeof(dy_fbuf_header_v0_t)";
      goto LABEL_26;
    }
    uint64_t v9 = *(void *)(a2 + 16);
    unsigned int v8 = *(_DWORD *)v9;
    if (*(unsigned char *)(result + 12))
    {
      unsigned int v8 = bswap32(v8);
      *(_DWORD *)uint64_t v9 = v8;
      *(int8x8_t *)(v9 + 4) = vrev32_s8(*(int8x8_t *)(v9 + 4));
    }
    int v10 = *(_DWORD *)(v9 + 4);
    int v11 = *(_DWORD *)(v9 + 8);
    *(_DWORD *)(a2 + 88) = v8;
    *(_DWORD *)(a2 + 92) = v10;
    *(void *)(a2 + 104) = 0;
    *(void *)(a2 + 112) = 0;
    *(void *)(a2 + 96) = 0;
    *(_DWORD *)(a2 + 120) = v11;
    unsigned __int8 v7 = (__int8 *)(v9 + 12);
  }
LABEL_6:
  if (v3 < v8)
  {
    int v20 = "job.capacity >= job.header.length";
    goto LABEL_26;
  }
  *(void *)(a2 + 16) = v7;
  return result;
}

void GPUTools::FB::Decoder::DecodeCore(uint64_t a1, uint64_t a2)
{
  GPUTools::FB::Decoder::DecodeHeader(a1, a2);
  uint64_t v4 = *(char **)(a2 + 16);
  if (*(int *)(a1 + 8) <= 2)
  {
    strlen(*(const char **)(a2 + 16));
    operator new[]();
  }
  size_t v5 = strlen(v4);
  unint64_t v6 = *(void *)(a2 + 8);
  unint64_t v7 = (v5 & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(a2 + 16) + 4;
  *(void *)(a2 + 16) = v7;
  uint64_t v8 = *(void *)a2;
  if (v6 < v7 - *(void *)a2) {
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a2 + 24);
  int v10 = *(_DWORD *)(a2 + 120);
  int v11 = *(_DWORD *)(a2 + 88);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(v9 + 4) = v10;
  *(void *)(v9 + 440) = v8;
  *(_DWORD *)(v9 + 432) = v11;
  GPUTools::FB::Decoder::DecodeArguments((unsigned char *)a1, a2, v4, 0, v9 + 48);
  unint64_t v12 = *(char **)(a2 + 16);
  if (*(void *)(a2 + 8) < (unint64_t)&v12[-*(void *)a2]) {
LABEL_7:
  }
    __assert_rtn("void GPUTools::FB::Decoder::DecodeCore(DecodeJob &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
  int v13 = *(_DWORD *)(a2 + 120);
  if ((v13 & 1) == 0)
  {
    if ((v13 & 0x40) == 0) {
      return;
    }
LABEL_13:
    *(_DWORD *)(*(void *)(a2 + 24) + 4) |= 6u;
    return;
  }
  if (*(int *)(a1 + 8) <= 2)
  {
    strlen(v12);
    operator new[]();
  }
  size_t v14 = (strlen(v12) & 0xFFFFFFFFFFFFFFFCLL) + *(void *)(a2 + 16) + 4;
  *(void *)(a2 + 16) = v14;
  if (*(void *)(a2 + 8) < v14 - *(void *)a2
    || (GPUTools::FB::Decoder::DecodeArguments((unsigned char *)a1, a2, v12, 1, *(void *)(a2 + 24) + 24),
        *(void *)(a2 + 8) < *(void *)(a2 + 16) - *(void *)a2))
  {
    __assert_rtn("void GPUTools::FB::Decoder::DecodeCore(DecodeJob &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
  }
  if ((*(_DWORD *)(a2 + 120) & 0x40) != 0) {
    goto LABEL_13;
  }
}

void sub_24F66C228(_Unwind_Exception *exception_object)
{
  if (v1) {
    MEMORY[0x253360DB0](v1, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

void GPUTools::FB::Decoder::FinalizeDecode(uint64_t a1, void *a2)
{
  uint64_t v2 = a2[3];
  *(void *)(v2 + 448) = a2[4];
  *(_DWORD *)(v2 + 436) = a2[6];
  unint64_t v3 = (void **)a2[8];
  uint64_t v4 = (void **)a2[9];
  if (v3 != v4)
  {
    do
    {
      size_t v5 = *v3++;
      *v5 += a2[4];
    }
    while (v3 != v4);
    uint64_t v2 = a2[3];
  }
  if (*(_WORD *)(v2 + 10) && *(_DWORD *)(v2 + 60) == 15 && *(_DWORD *)v2 != -8191 && *(_DWORD *)v2 != -8188) {
    *(void *)(v2 + 16) = **(void **)(v2 + 48);
  }
}

uint64_t GPUTools::FB::Decoder::HasFastEncodedSize(GPUTools::FB::Decoder *this)
{
  return 1;
}

uint64_t GPUTools::FB::Decoder::HasRichSemanticTypes(GPUTools::FB::Decoder *this)
{
  return 1;
}

uint64_t GPUTools::FB::Decoder::EmitsRichSemanticTypes(GPUTools::FB::Decoder *this)
{
  return *((unsigned __int8 *)this + 14);
}

uint64_t GPUTools::FB::Decoder::SetEmitsRichSemanticTypes(uint64_t this, char a2)
{
  *(unsigned char *)(this + 14) = a2;
  return this;
}

uint64_t GPUTools::FB::Decoder::GetEncodedSize(GPUTools::FB::Decoder *this, const void *a2, uint64_t a3)
{
  long long v7 = 0u;
  uint64_t v8 = 64;
  __p = 0;
  long long v10 = 0u;
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a2;
  long long v6 = 0u;
  GPUTools::FB::Decoder::DecodeHeader((uint64_t)this, (uint64_t)v5);
  uint64_t v3 = v11;
  if (__p) {
    operator delete(__p);
  }
  return v3;
}

void sub_24F66C350(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GPUTools::FB::Decoder::DecodeFlags(GPUTools::FB::Decoder *this, const void *a2, uint64_t a3)
{
  long long v7 = 0u;
  uint64_t v8 = 64;
  __p = 0;
  long long v10 = 0u;
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a2;
  long long v6 = 0u;
  GPUTools::FB::Decoder::DecodeHeader((uint64_t)this, (uint64_t)v5);
  unsigned __int16 v3 = v11;
  if (__p) {
    operator delete(__p);
  }
  return v3;
}

void sub_24F66C3C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GPUTools::FB::Decoder::Decode(GPUTools::FB::Decoder *this, const void *a2, uint64_t a3, GPUTools::FD::CoreFunction *a4)
{
  if (!a2) {
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::CoreFunction &) const", "", 0, "fbuf");
  }
  if ((a2 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=4", a2);
  }
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v10);
  GPUTools::FD::CoreFunction::operator=((uint64_t)a4, (uint64_t)v10);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v10);
  memset(&v10[4], 0, 24);
  v10[7] = 64;
  unint64_t v12 = 0;
  uint64_t v13 = 0;
  __p = 0;
  v10[0] = a2;
  v10[1] = a3;
  v10[2] = a2;
  v10[3] = a4;
  GPUTools::FB::Decoder::DecodeCore((uint64_t)this, (uint64_t)v10);
  GPUTools::FB::Decoder::FinalizeDecode(v8, v10);
  if (__p)
  {
    unint64_t v12 = __p;
    operator delete(__p);
  }
  return 1;
}

void sub_24F66C4C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t GPUTools::FB::Decoder::Decode(GPUTools::FB::Decoder *this, char *a2, unint64_t a3, GPUTools::FD::Function *a4)
{
  if (!a2) {
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "fbuf");
  }
  if ((a2 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=4", a2);
  }
  GPUTools::FD::Function::Function((GPUTools::FD::Function *)&v55);
  GPUTools::FD::Function::operator=((uint64_t)a4, (uint64_t)&v55);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)&v55);
  memset(v59, 0, 24);
  v59[3] = 64;
  uint64_t v61 = 0;
  v62[0] = 0;
  __p = 0;
  int v55 = a2;
  unint64_t v56 = a3;
  __s = a2;
  unsigned int v58 = a4;
  GPUTools::FB::Decoder::DecodeCore((uint64_t)this, (uint64_t)&v55);
  *(_OWORD *)((char *)a4 + 456) = v63;
  *((void *)a4 + 64) = v62[2];
  if ((*((unsigned char *)a4 + 4) & 8) != 0)
  {
    if (*((int *)this + 2) <= 2)
    {
      uint64_t v48 = __s;
      __s += (strlen(__s) & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if (v56 < __s - v55) {
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      }
      GPUTools::FB::Decoder::DecodeArguments(this, (uint64_t)&v55, v48, 8, (uint64_t)v53);
      if (__s - v55 > a3) {
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      }
      *((_WORD *)a4 + 240) = v54;
      *((void *)a4 + 59) = v53[0];
      if (*((void **)v61 - 1) == v53) {
        *((void *)v61 - 1) = (char *)a4 + 472;
      }
    }
    else
    {
      long long v10 = v55;
      unint64_t v9 = v56;
      int v11 = __s;
      if (v56 < __s - v55 + 8) {
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + backtrace_header_size");
      }
      unsigned int v12 = *(_DWORD *)__s;
      *((_WORD *)a4 + 240) = *(_DWORD *)__s;
      unsigned int v13 = *((_DWORD *)v11 + 1);
      if (*((unsigned char *)this + 12))
      {
        unsigned int v12 = bswap32(v12) >> 16;
        *((_WORD *)a4 + 240) = v12;
        unsigned int v13 = bswap32(v13);
      }
      size_t v14 = v11 + 8;
      __s = v11 + 8;
      if (v9 < v11 + 8 - v10 + 8 * (unint64_t)(unsigned __int16)v12) {
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + addresses_size");
      }
      uint64_t v15 = 8 * (unsigned __int16)v12;
      if (v13 == 4)
      {
        uint64_t v8 = (char *)GPUTools::AlignmentBuffer::CopyAndAlign((GPUTools::AlignmentBuffer *)v59, v14, 8 * (unsigned __int16)v12, 8);
        uint64_t v16 = v8;
        uint64_t v17 = (char *)a4 + 472;
        *((void *)a4 + 59) = v8;
        uint64_t v18 = v59[0];
        int v19 = v61;
        if ((unint64_t)v61 >= v62[0])
        {
          uint64_t v23 = (v61 - (unsigned char *)__p) >> 3;
          if ((unint64_t)(v23 + 1) >> 61) {
            std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v24 = (uint64_t)(v62[0] - (void)__p) >> 2;
          if (v24 <= v23 + 1) {
            unint64_t v24 = v23 + 1;
          }
          if (v62[0] - (void)__p >= 0x7FFFFFFFFFFFFFF8uLL) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v24;
          }
          if (v25) {
            uint64_t v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)v62, v25);
          }
          else {
            uint64_t v26 = 0;
          }
          unint64_t v27 = &v26[8 * v23];
          int v28 = &v26[8 * v25];
          *(void *)unint64_t v27 = v17;
          int v20 = v27 + 8;
          char v29 = (char *)__p;
          uint64_t v8 = v61;
          if (v61 != __p)
          {
            do
            {
              uint64_t v30 = *((void *)v8 - 1);
              v8 -= 8;
              *((void *)v27 - 1) = v30;
              v27 -= 8;
            }
            while (v8 != v29);
            uint64_t v8 = (char *)__p;
          }
          __p = v27;
          uint64_t v61 = v20;
          v62[0] = v28;
          if (v8) {
            operator delete(v8);
          }
        }
        else
        {
          *(void *)uint64_t v61 = v17;
          int v20 = v19 + 8;
        }
        uint64_t v31 = &v16[v18];
        uint64_t v61 = v20;
        uint64_t v32 = *((unsigned __int16 *)a4 + 240);
        if (*((unsigned char *)this + 12))
        {
          if (*((_WORD *)a4 + 240))
          {
            uint64_t v51 = v32 - 1;
            do
            {
              *(void *)&v31[8 * v51] = bswap32(*(_DWORD *)&v31[4 * v51]);
              unint64_t v52 = v51-- + 1;
            }
            while (v52 > 1);
          }
        }
        else if (*((_WORD *)a4 + 240))
        {
          uint64_t v33 = v32 - 1;
          do
          {
            *(void *)&v31[8 * v33] = *(unsigned int *)&v31[4 * v33];
            unint64_t v34 = v33-- + 1;
          }
          while (v34 > 1);
        }
      }
      else
      {
        *((void *)a4 + 59) = v14;
        if (v13 != 8) {
          dy_abort("unsupported backtrace pointer size: %u", v13);
        }
        if (*((unsigned char *)this + 12))
        {
          unint64_t v21 = *((unsigned __int16 *)a4 + 240);
          if (*((_WORD *)a4 + 240))
          {
            do
              *(void *)&v11[8 * v21] = bswap64(*(void *)&v11[8 * v21]);
            while (v21-- > 1);
          }
        }
      }
      __s += v15;
    }
  }
  int v35 = *((_DWORD *)a4 + 1);
  if ((v35 & 0x10) != 0)
  {
    if (*((int *)this + 2) <= 2)
    {
      uint64_t v49 = __s;
      __s += (strlen(__s) & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if (v56 < __s - v55) {
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      }
      GPUTools::FB::Decoder::DecodeArguments(this, (uint64_t)&v55, v49, 16, (uint64_t)v53);
      if (__s - v55 > a3) {
        __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr)");
      }
      *((_WORD *)a4 + 241) = *(_DWORD *)v53[0];
      if (*((void **)v61 - 1) == v53) {
        v61 -= 8;
      }
      int v35 = *((_DWORD *)a4 + 1);
      if ((v35 & 0x20) == 0) {
        goto LABEL_48;
      }
      goto LABEL_43;
    }
    uint64_t v36 = __s;
    if (v56 < __s - v55 + 4)
    {
      int v50 = "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + sizeof(uint32_t)";
      goto LABEL_72;
    }
    unsigned int v37 = *(_DWORD *)__s;
    *((_WORD *)a4 + 241) = *(_DWORD *)__s;
    if (*((unsigned char *)this + 12)) {
      *((_WORD *)a4 + 241) = bswap32(v37) >> 16;
    }
    __s = v36 + 4;
  }
  if ((v35 & 0x20) == 0) {
    goto LABEL_48;
  }
LABEL_43:
  int v39 = v55;
  unint64_t v38 = v56;
  int v40 = __s;
  if (v56 < __s - v55 + 8)
  {
    int v50 = "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + (2 * sizeof(uint32_t))";
    goto LABEL_72;
  }
  unsigned int v41 = *(_DWORD *)__s;
  if (*((unsigned char *)this + 12))
  {
    unsigned int v41 = bswap32(v41);
    unsigned int v42 = bswap32(*((_DWORD *)__s + 1));
    *(_DWORD *)__s = v41;
    *((_DWORD *)v40 + 1) = v42;
  }
  else
  {
    unsigned int v42 = *((_DWORD *)__s + 1);
  }
  *((_DWORD *)a4 + 121) = v41;
  v43 = v40 + 8;
  __s = v43;
  if (v38 < v43 - v39 + (unint64_t)v42) {
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + events_size");
  }
  *((void *)a4 + 61) = v43;
  *((_DWORD *)a4 + 124) = v42;
  __s = &v43[v42];
  int v35 = *((_DWORD *)a4 + 1);
LABEL_48:
  if ((v35 & 0x400) == 0) {
    goto LABEL_53;
  }
  unint64_t v44 = __s;
  if (v56 < __s - v55 + 12)
  {
    int v50 = "job.capacity >= BUFFER_DELTA(job.fbuf, job.read_ptr) + (sizeof(uint64_t) + sizeof(uint32_t))";
LABEL_72:
    __assert_rtn("virtual BOOL GPUTools::FB::Decoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, v50);
  }
  unint64_t v45 = *(void *)__s;
  *((void *)a4 + 63) = *(void *)__s;
  unsigned int v46 = *((_DWORD *)v44 + 2);
  *((_DWORD *)a4 + 125) = v46;
  if (*((unsigned char *)this + 12))
  {
    *((void *)a4 + 63) = bswap64(v45);
    *((_DWORD *)a4 + 125) = bswap32(v46);
  }
  __s = v44 + 12;
LABEL_53:
  GPUTools::FB::Decoder::FinalizeDecode((uint64_t)v8, &v55);
  if (__p)
  {
    uint64_t v61 = (char *)__p;
    operator delete(__p);
  }
  return 1;
}

void sub_24F66CB54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void GPUTools::FB::Decoder::~Decoder(GPUTools::FB::Decoder *this)
{
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder(this);

  JUMPOUT(0x253360DD0);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t DYCALayerInterposeInit(DYGuestAppClient *a1)
{
  if (DYCALayerInterposeInit(DYGuestAppClient *)::onceToken != -1) {
    dispatch_once(&DYCALayerInterposeInit(DYGuestAppClient *)::onceToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)_appClients;

  return [v2 addObject:a1];
}

void ___Z22DYCALayerInterposeInitP16DYGuestAppClient_block_invoke()
{
}

void sub_24F66CDF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CALayer_setTransform(CALayer *a1, objc_selector *a2, CATransform3D *a3)
{
  long long v4 = *(_OWORD *)&a3->m33;
  v10[4] = *(_OWORD *)&a3->m31;
  void v10[5] = v4;
  long long v5 = *(_OWORD *)&a3->m43;
  v10[6] = *(_OWORD *)&a3->m41;
  v10[7] = v5;
  long long v6 = *(_OWORD *)&a3->m13;
  v10[0] = *(_OWORD *)&a3->m11;
  v10[1] = v6;
  long long v7 = *(_OWORD *)&a3->m23;
  v10[2] = *(_OWORD *)&a3->m21;
  v10[3] = v7;
  o_CALayer_setTransform(a1, a2, v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZL20CALayer_setTransformP7CALayerP13objc_selector13CATransform3D_block_invoke;
  v9[3] = &unk_265336790;
  v9[4] = a1;
  return [(id)_appClients enumerateObjectsUsingBlock:v9];
}

uint64_t CALayer_setSublayerTransform(CALayer *a1, objc_selector *a2, CATransform3D *a3)
{
  long long v4 = *(_OWORD *)&a3->m33;
  v10[4] = *(_OWORD *)&a3->m31;
  void v10[5] = v4;
  long long v5 = *(_OWORD *)&a3->m43;
  v10[6] = *(_OWORD *)&a3->m41;
  v10[7] = v5;
  long long v6 = *(_OWORD *)&a3->m13;
  v10[0] = *(_OWORD *)&a3->m11;
  v10[1] = v6;
  long long v7 = *(_OWORD *)&a3->m23;
  v10[2] = *(_OWORD *)&a3->m21;
  v10[3] = v7;
  o_CALayer_setSublayerTransform(a1, a2, v10);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = ___ZL28CALayer_setSublayerTransformP7CALayerP13objc_selector13CATransform3D_block_invoke;
  v9[3] = &unk_265336790;
  v9[4] = a1;
  return [(id)_appClients enumerateObjectsUsingBlock:v9];
}

uint64_t CALayer_setPosition(CALayer *a1, objc_selector *a2, CGPoint a3)
{
  o_CALayer_setPosition(a1, a2, (__n128)a3, *(__n128 *)&a3.y);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___ZL19CALayer_setPositionP7CALayerP13objc_selector7CGPoint_block_invoke;
  void v5[3] = &unk_265336790;
  v5[4] = a1;
  return [(id)_appClients enumerateObjectsUsingBlock:v5];
}

uint64_t CALayer_setAnchorPoint(CALayer *a1, objc_selector *a2, CGPoint a3)
{
  o_CALayer_setAnchorPoint(a1, a2, (__n128)a3, *(__n128 *)&a3.y);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___ZL22CALayer_setAnchorPointP7CALayerP13objc_selector7CGPoint_block_invoke;
  void v5[3] = &unk_265336790;
  v5[4] = a1;
  return [(id)_appClients enumerateObjectsUsingBlock:v5];
}

CGFloat DYOrderedDimensionsFromBounds(const CGRect *a1)
{
  if (a1->size.width >= a1->size.height) {
    return a1->size.width;
  }
  else {
    return a1->size.height;
  }
}

void DYEncodeCALayerTransforms(GPUTools::FB::Stream *a1, CALayer *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (!*(void *)(gLayersSetPtr + 24)) {
    return;
  }
  memset(&v25, 0, 20);
  {
    long long v6 = (char *)getprogname();
    std::string::basic_string[abi:ne180100]<0>(&__p, v6);
    BOOL v7 = std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, "backboardd");
    if (SBYTE7(v28) < 0) {
      operator delete((void *)__p);
    }
    DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddProg = v7;
  }
  {
    if (DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddBundle)
    {
LABEL_5:
      double v4 = 240.0;
      double v5 = 320.0;
      goto LABEL_23;
    }
  }
  else
  {
    if (DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddProg) {
      int v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", @"com.apple.backboardd");
    }
    else {
      int v8 = 0;
    }
    DYEncodeCALayerTransforms(GPUTools::FB::Stream *,CALayer *)::isBackboarddBundle = v8;
    if (v8) {
      goto LABEL_5;
    }
  }
  Class v9 = NSClassFromString(&cfstr_Nsscreen.isa);
  Class v10 = NSClassFromString(&cfstr_Uiscreen.isa);
  if (v9)
  {
    int v11 = (void *)[(objc_class *)v9 performSelector:sel_mainScreen];
    ((void (*)(void *, char *))[v11 methodForSelector:sel_frame])(v11, sel_frame);
  }
  else
  {
    if (!v10) {
      goto LABEL_5;
    }
    size_t v14 = (void *)[(objc_class *)v10 performSelector:sel_mainScreen];
    ((void (*)(void *, char *))[v14 methodForSelector:sel_bounds])(v14, sel_bounds);
  }
  if (v12 >= v13) {
    double v5 = v12;
  }
  else {
    double v5 = v13;
  }
  if (v12 >= v13) {
    double v4 = v13;
  }
  else {
    double v4 = v12;
  }
LABEL_23:
  uint64_t v15 = *(uint64_t ***)(gLayersSetPtr + 16);
  if (v15)
  {
    do
    {
      uint64_t v16 = (CALayer *)v15[2];
      if (!a2 || [v15[2] isDescendantOf:a2])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long __p = 0u;
        long long v28 = 0u;
        DYFinalLayerTransform(v16, &__p);
        v26[4] = v31;
        v26[5] = v32;
        v26[6] = v33;
        v26[7] = v34;
        v26[0] = __p;
        v26[1] = v28;
        v26[2] = v29;
        v26[3] = v30;
        [(CALayer *)v16 bounds];
        if (v18 >= v19) {
          double v20 = v19;
        }
        else {
          double v20 = v18;
        }
        if (v18 >= v19) {
          double v21 = v18;
        }
        else {
          double v21 = v19;
        }
        GPUTools::FB::Encode((char **)&v25, (GPUTools::FB::Fbuf *)0xFFFFE009, 65540, (uint64_t)"p@16ddd", v17, v16, v26, v5 / v21, v4 / v20);
        GPUTools::FB::Stream::Write(a1, &v25, 1);
        [(CALayer *)v16 anchorPoint];
        *(void *)&long long __p = v22;
        [(CALayer *)v16 anchorPoint];
        *((void *)&__p + 1) = v23;
        GPUTools::FB::Encode((char **)&v25, (GPUTools::FB::Fbuf *)0xFFFFE00BLL, 65540, (uint64_t)"p@2d", v24, v16, &__p);
        GPUTools::FB::Stream::Write(a1, &v25, 1);
      }
      uint64_t v15 = (uint64_t **)*v15;
    }
    while (v15);
    if (v25.var0.var0) {
      free(v25.var0.var0);
    }
  }
}

void sub_24F66D3C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  if (a14) {
    free(a14);
  }
  _Unwind_Resume(exception_object);
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1) {
LABEL_10:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) == 0;
  }
  return 0;
}

void GPUTools::FB::Encode(char **this, GPUTools::FB::Fbuf *a2, int a3, uint64_t a4, const char *a5, ...)
{
  va_start(va, a5);
  va_copy(v11, va);
  GPUTools::FB::VAListArgumentProvider::VAListArgumentProvider(v10, va);
  GPUTools::FB::Encode(this, a2, a3, a4, v10, v9);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)v10);
}

void sub_24F66D518(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)va);
  _Unwind_Resume(a1);
}

void GPUTools::FB::Stream::Write(GPUTools::FB::Stream *this, Fbuf *a2, int a3)
{
  for (size_t i = (atomic_uint *)((char *)this + 56); atomic_exchange(i, 1u) == 1; size_t i = (atomic_uint *)((char *)this + 56))
  {
    while (*((_DWORD *)this + 14) == 1)
      ;
  }
  GPUTools::FB::Stream::Write_nolock(this, a2, *(unsigned int *)a2->var0.var0, a3);
  atomic_store(0, (unsigned int *)this + 14);
}

void sub_24F66D590(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

CGFloat DYFinalLayerTransform@<D0>(CALayer *a1@<X0>, long long *a2@<X8>)
{
  size_t v4 = (long long *)MEMORY[0x263F15740];
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  a2[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  a2[5] = v5;
  long long v6 = v4[7];
  a2[6] = v4[6];
  a2[7] = v6;
  long long v7 = v4[1];
  *a2 = *v4;
  a2[1] = v7;
  long long v8 = v4[3];
  a2[2] = v4[2];
  a2[3] = v8;
  Class v9 = a1;
  do
  {
    if (v9 != a1)
    {
      [(CALayer *)v9 anchorPoint];
      double v11 = v10;
      [(CALayer *)v9 bounds];
      double v13 = v12;
      [(CALayer *)v9 anchorPoint];
      double v15 = v14;
      [(CALayer *)v9 bounds];
      CGFloat v16 = -(v11 * v13);
      CGFloat v18 = -(v15 * v17);
      [(CALayer *)v9 anchorPointZ];
      CATransform3DMakeTranslation(&v104, v16, v18, -v19);
      long long v20 = a2[5];
      *(_OWORD *)&a.m31 = a2[4];
      *(_OWORD *)&a.m33 = v20;
      long long v21 = a2[7];
      *(_OWORD *)&a.double m41 = a2[6];
      *(_OWORD *)&a.m43 = v21;
      long long v22 = a2[1];
      *(_OWORD *)&a.m11 = *a2;
      *(_OWORD *)&a.m13 = v22;
      long long v23 = a2[3];
      *(_OWORD *)&a.m21 = a2[2];
      *(_OWORD *)&a.m23 = v23;
      CATransform3D b = v104;
      CATransform3DConcat(&v114, &a, &b);
      long long v24 = *(_OWORD *)&v114.m33;
      a2[4] = *(_OWORD *)&v114.m31;
      a2[5] = v24;
      long long v25 = *(_OWORD *)&v114.m43;
      a2[6] = *(_OWORD *)&v114.m41;
      a2[7] = v25;
      long long v26 = *(_OWORD *)&v114.m13;
      *a2 = *(_OWORD *)&v114.m11;
      a2[1] = v26;
      long long v27 = *(_OWORD *)&v114.m23;
      a2[2] = *(_OWORD *)&v114.m21;
      a2[3] = v27;
    }
    long long v28 = a2[5];
    *(_OWORD *)&v101.m31 = a2[4];
    *(_OWORD *)&v101.m33 = v28;
    long long v29 = a2[7];
    *(_OWORD *)&v101.double m41 = a2[6];
    *(_OWORD *)&v101.m43 = v29;
    long long v30 = a2[1];
    *(_OWORD *)&v101.m11 = *a2;
    *(_OWORD *)&v101.m13 = v30;
    long long v31 = a2[3];
    *(_OWORD *)&v101.m21 = a2[2];
    *(_OWORD *)&v101.m23 = v31;
    if (v9) {
      [(CALayer *)v9 transform];
    }
    else {
      memset(&v100, 0, sizeof(v100));
    }
    CATransform3DConcat(&v114, &v101, &v100);
    long long v32 = *(_OWORD *)&v114.m33;
    a2[4] = *(_OWORD *)&v114.m31;
    a2[5] = v32;
    long long v33 = *(_OWORD *)&v114.m43;
    a2[6] = *(_OWORD *)&v114.m41;
    a2[7] = v33;
    long long v34 = *(_OWORD *)&v114.m13;
    *a2 = *(_OWORD *)&v114.m11;
    a2[1] = v34;
    long long v35 = *(_OWORD *)&v114.m23;
    a2[2] = *(_OWORD *)&v114.m21;
    a2[3] = v35;
    if (v9 != a1)
    {
      long long v36 = a2[5];
      *(_OWORD *)&v99.m31 = a2[4];
      *(_OWORD *)&v99.m33 = v36;
      long long v37 = a2[7];
      *(_OWORD *)&v99.double m41 = a2[6];
      *(_OWORD *)&v99.m43 = v37;
      long long v38 = a2[1];
      *(_OWORD *)&v99.m11 = *a2;
      *(_OWORD *)&v99.m13 = v38;
      long long v39 = a2[3];
      *(_OWORD *)&v99.m21 = a2[2];
      *(_OWORD *)&v99.m23 = v39;
      if (v9) {
        [(CALayer *)v9 sublayerTransform];
      }
      else {
        memset(&v98, 0, sizeof(v98));
      }
      CATransform3DConcat(&v114, &v99, &v98);
      long long v40 = *(_OWORD *)&v114.m33;
      a2[4] = *(_OWORD *)&v114.m31;
      a2[5] = v40;
      long long v41 = *(_OWORD *)&v114.m43;
      a2[6] = *(_OWORD *)&v114.m41;
      a2[7] = v41;
      long long v42 = *(_OWORD *)&v114.m13;
      *a2 = *(_OWORD *)&v114.m11;
      a2[1] = v42;
      long long v43 = *(_OWORD *)&v114.m23;
      a2[2] = *(_OWORD *)&v114.m21;
      a2[3] = v43;
    }
    [(CALayer *)v9 position];
    CGFloat v45 = v44;
    [(CALayer *)v9 position];
    CGFloat v47 = v46;
    [(CALayer *)v9 zPosition];
    CATransform3DMakeTranslation(&v114, v45, v47, v48);
    CATransform3D v104 = v114;
    long long v49 = *a2;
    long long v50 = a2[1];
    long long v51 = a2[3];
    *(_OWORD *)&v97.m21 = a2[2];
    *(_OWORD *)&v97.m23 = v51;
    *(_OWORD *)&v97.m11 = v49;
    *(_OWORD *)&v97.m13 = v50;
    long long v52 = a2[4];
    long long v53 = a2[5];
    long long v54 = a2[7];
    *(_OWORD *)&v97.double m41 = a2[6];
    *(_OWORD *)&v97.m43 = v54;
    *(_OWORD *)&v97.m31 = v52;
    *(_OWORD *)&v97.m33 = v53;
    CATransform3D v96 = v114;
    CATransform3DConcat(&v114, &v97, &v96);
    long long v55 = *(_OWORD *)&v114.m33;
    a2[4] = *(_OWORD *)&v114.m31;
    a2[5] = v55;
    long long v56 = *(_OWORD *)&v114.m43;
    a2[6] = *(_OWORD *)&v114.m41;
    a2[7] = v56;
    long long v57 = *(_OWORD *)&v114.m13;
    *a2 = *(_OWORD *)&v114.m11;
    a2[1] = v57;
    long long v58 = *(_OWORD *)&v114.m23;
    a2[2] = *(_OWORD *)&v114.m21;
    a2[3] = v58;
    Class v9 = [(CALayer *)v9 superlayer];
  }
  while (v9);
  long long v59 = a2[3];
  long long v92 = a2[2];
  long long v93 = v59;
  long long v60 = a2[5];
  long long v94 = a2[4];
  long long v95 = v60;
  long long v61 = a2[1];
  long long v90 = *a2;
  long long v91 = v61;
  double m41 = *((double *)a2 + 12);
  double m42 = *((double *)a2 + 13);
  uint64_t v64 = a2 + 7;
  long long v89 = a2[7];
  Class v65 = NSClassFromString(&cfstr_Uiscreen.isa);
  if (!v65)
  {
    v74 = a2;
    uint64_t v73 = a2 + 7;
    goto LABEL_26;
  }
  int v66 = (void *)-[objc_class performSelector:](v65, "performSelector:", sel_getUid("mainScreen"), v89, v90, v91, v92, v93, v94, v95);
  uint64_t v67 = (void *)[v66 performSelector:sel_getUid("coordinateSpace")];
  uint64_t v68 = [v66 performSelector:sel_getUid("fixedCoordinateSpace")];
  SEL Uid = sel_getUid("convertPoint:toCoordinateSpace:");
  double v71 = fabs(((double (*)(void *, SEL, uint64_t, double, double))[v67 methodForSelector:Uid])(v67, Uid, v68, 0.0, 0.0));
  if (v71 >= 0.001 && v71 >= fmax(v71, 0.0) * 0.001)
  {
    double v75 = fabs(v70);
    if (v75 >= 0.001 && v75 >= fmax(v75, 0.0) * 0.001)
    {
      memset(&v114, 0, sizeof(v114));
      CATransform3DMakeRotation(&v114, 3.14159265, 0.0, 0.0, 1.0);
      memset(&v113, 0, sizeof(v113));
      CATransform3DMakeTranslation(&v113, -m41, -m42, 0.0);
      memset(&v112, 0, sizeof(v112));
      CGFloat v77 = m41;
      CGFloat v78 = m42;
      goto LABEL_25;
    }
    memset(&v114, 0, sizeof(v114));
    CGFloat v76 = 1.57079633;
LABEL_24:
    CATransform3DMakeRotation(&v114, v76, 0.0, 0.0, 1.0);
    memset(&v113, 0, sizeof(v113));
    CATransform3DMakeTranslation(&v113, -m41, -m42, 0.0);
    memset(&v112, 0, sizeof(v112));
    CGFloat v77 = m42;
    CGFloat v78 = m41;
LABEL_25:
    CATransform3DMakeTranslation(&v112, v77, v78, 0.0);
    long long v79 = a2[3];
    *(_OWORD *)&v110.m21 = a2[2];
    *(_OWORD *)&v110.m23 = v79;
    long long v80 = a2[5];
    *(_OWORD *)&v110.m31 = a2[4];
    *(_OWORD *)&v110.m33 = v80;
    long long v81 = a2[1];
    *(_OWORD *)&v110.m11 = *a2;
    *(_OWORD *)&v110.m13 = v81;
    v110.double m41 = m41;
    v110.double m42 = m42;
    *(_OWORD *)&v110.m43 = *v64;
    CATransform3D v109 = v113;
    CATransform3DConcat(&v111, &v110, &v109);
    CATransform3D v108 = v111;
    CATransform3D v107 = v114;
    CATransform3DConcat(&v111, &v108, &v107);
    CATransform3D v106 = v111;
    CATransform3D v105 = v112;
    CATransform3DConcat(&v111, &v106, &v105);
    long long v92 = *(_OWORD *)&v111.m21;
    long long v93 = *(_OWORD *)&v111.m23;
    long long v94 = *(_OWORD *)&v111.m31;
    long long v95 = *(_OWORD *)&v111.m33;
    long long v90 = *(_OWORD *)&v111.m11;
    long long v91 = *(_OWORD *)&v111.m13;
    double m41 = v111.m41;
    double m42 = v111.m42;
    uint64_t v73 = &v89;
    v74 = &v90;
    long long v89 = *(_OWORD *)&v111.m43;
    goto LABEL_26;
  }
  double v72 = fabs(v70);
  if (v72 >= 0.001 && v72 >= fmax(v72, 0.0) * 0.001)
  {
    memset(&v114, 0, sizeof(v114));
    CGFloat v76 = -1.57079633;
    goto LABEL_24;
  }
  uint64_t v73 = &v89;
  v74 = &v90;
LABEL_26:
  long long v82 = v74[3];
  *(_OWORD *)&v114.m21 = v74[2];
  *(_OWORD *)&v114.m23 = v82;
  long long v83 = v74[5];
  *(_OWORD *)&v114.m31 = v74[4];
  *(_OWORD *)&v114.m33 = v83;
  long long v84 = v74[1];
  *(_OWORD *)&v114.m11 = *v74;
  *(_OWORD *)&v114.m13 = v84;
  *(_OWORD *)&v113.m11 = *v73;
  long long v85 = *(_OWORD *)&v114.m23;
  a2[2] = *(_OWORD *)&v114.m21;
  a2[3] = v85;
  long long v86 = *(_OWORD *)&v114.m33;
  a2[4] = *(_OWORD *)&v114.m31;
  a2[5] = v86;
  long long v87 = *(_OWORD *)&v114.m13;
  *a2 = *(_OWORD *)&v114.m11;
  a2[1] = v87;
  *((double *)a2 + 12) = m41;
  *((double *)a2 + 13) = m42;
  CGFloat result = v113.m11;
  *uint64_t v64 = *(_OWORD *)&v113.m11;
  return result;
}

void ___ZL20CALayer_setTransformP7CALayerP13objc_selector13CATransform3D_block_invoke(uint64_t a1, void *a2)
{
  if ((int)[a2 traceMode] >= 4 && objc_msgSend(a2, "traceMode") != 7)
  {
    size_t v4 = (GPUTools::FB::Stream *)[a2 defaultFbufStream];
    long long v5 = *(CALayer **)(a1 + 32);
    DYEncodeCALayerTransforms(v4, v5);
  }
}

void ___ZL28CALayer_setSublayerTransformP7CALayerP13objc_selector13CATransform3D_block_invoke(uint64_t a1, void *a2)
{
  if ((int)[a2 traceMode] >= 4 && objc_msgSend(a2, "traceMode") != 7)
  {
    size_t v4 = (GPUTools::FB::Stream *)[a2 defaultFbufStream];
    long long v5 = *(CALayer **)(a1 + 32);
    DYEncodeCALayerTransforms(v4, v5);
  }
}

void ___ZL19CALayer_setPositionP7CALayerP13objc_selector7CGPoint_block_invoke(uint64_t a1, void *a2)
{
  if ((int)[a2 traceMode] >= 4 && objc_msgSend(a2, "traceMode") != 7)
  {
    size_t v4 = (GPUTools::FB::Stream *)[a2 defaultFbufStream];
    long long v5 = *(CALayer **)(a1 + 32);
    DYEncodeCALayerTransforms(v4, v5);
  }
}

void ___ZL22CALayer_setAnchorPointP7CALayerP13objc_selector7CGPoint_block_invoke(uint64_t a1, void *a2)
{
  if ((int)[a2 traceMode] >= 4 && objc_msgSend(a2, "traceMode") != 7)
  {
    size_t v4 = (GPUTools::FB::Stream *)[a2 defaultFbufStream];
    long long v5 = *(CALayer **)(a1 + 32);
    DYEncodeCALayerTransforms(v4, v5);
  }
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_24F66DFD8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  CGFloat result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void sub_24F66EF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void GPUTools::FB::EncodeStaticBacktrace(GPUTools::FB *this, GPUTools::FB::Fbuf *a2, unint64_t *a3)
{
  int v3 = (int)a3;
  long long v6 = (char *)*((void *)this + 1);
  *(_DWORD *)(*(void *)this + 32) |= 8u;
  size_t v7 = 8 * a3;
  size_t v8 = v7 + 8;
  Class v9 = *(unsigned char **)this;
  int64_t v10 = v6 - v9;
  uint64_t v11 = *((unsigned int *)this + 4);
  unint64_t v12 = v11 - (v6 - v9);
  if (v7 + 8 <= v12) {
    goto LABEL_2;
  }
  int v19 = (v8 - v12 + 255) & 0xFFFFFF00;
  size_t v20 = (v19 + v11);
  *((_DWORD *)this + 4) = v20;
  if (v9)
  {
    long long v21 = (char *)reallocf(v9, v20);
    *(void *)this = v21;
    if (v21) {
      goto LABEL_7;
    }
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  long long v21 = (char *)malloc_type_malloc((v19 + v11), 0xC56234FuLL);
  *(void *)this = v21;
  if (!v21) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v21 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v21, 4uLL);
  }
  long long v6 = &v21[v10];
  *((void *)this + 1) = &v21[v10];
LABEL_2:
  bzero(v6, v7 + 8);
  double v13 = (_DWORD *)*((void *)this + 1);
  _DWORD *v13 = v3;
  v13[1] = 8;
  memcpy(v13 + 2, a2, v7);
  double v14 = *(_DWORD **)this;
  size_t v15 = v8 + *((void *)this + 1);
  *((void *)this + 1) = v15;
  size_t v16 = v15 - (void)v14;
  _DWORD *v14 = v16;
  unint64_t v17 = (v16 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  int v18 = v17 - v16;
  if (v17 != v16)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v17 - v16);
    **(_DWORD **)this += v18;
  }
}

void GPUTools::FB::Fbuf::grow(GPUTools::FB::Fbuf *this, size_t a2)
{
  size_t v4 = *(unsigned char **)this;
  long long v5 = (char *)*((void *)this + 1);
  int64_t v6 = v5 - v4;
  uint64_t v7 = *((unsigned int *)this + 4);
  size_t v8 = v7 - (v5 - v4);
  if (a2 <= v8) {
    goto LABEL_2;
  }
  int v9 = (a2 - v8 + 255) & 0xFFFFFF00;
  size_t v10 = (v9 + v7);
  *((_DWORD *)this + 4) = v10;
  if (v4)
  {
    uint64_t v11 = (char *)reallocf(v4, v10);
    *(void *)this = v11;
    if (v11) {
      goto LABEL_7;
    }
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  uint64_t v11 = (char *)malloc_type_malloc((v9 + v7), 0xC56234FuLL);
  *(void *)this = v11;
  if (!v11) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v11 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v11, 4uLL);
  }
  long long v5 = &v11[v6];
  *((void *)this + 1) = &v11[v6];
LABEL_2:

  bzero(v5, a2);
}

void GPUTools::FB::EncodeCurrentBacktrace(GPUTools::FB *this, GPUTools::FB::Fbuf *a2)
{
  int v3 = (char *)*((void *)this + 1);
  *(_DWORD *)(*(void *)this + 32) |= 8u;
  size_t v4 = *(unsigned char **)this;
  uint64_t v5 = v3 - v4;
  uint64_t v6 = *((unsigned int *)this + 4);
  unint64_t v7 = v6 - (v3 - v4);
  if (v7 > 0x107) {
    goto LABEL_2;
  }
  int v14 = (519 - v7) & 0xFFFFFF00;
  size_t v15 = (v14 + v6);
  *((_DWORD *)this + 4) = v15;
  if (v4)
  {
    size_t v16 = (char *)reallocf(v4, v15);
    *(void *)this = v16;
    if (v16) {
      goto LABEL_8;
    }
LABEL_15:
    dy_abort("failed to allocate fbuf buffer");
  }
  size_t v16 = (char *)malloc_type_malloc((v14 + v6), 0xC56234FuLL);
  *(void *)this = v16;
  if (!v16) {
    goto LABEL_15;
  }
LABEL_8:
  if ((v16 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v16, 4uLL);
  }
  int v3 = &v16[v5];
  *((void *)this + 1) = &v16[v5];
LABEL_2:
  *((void *)v3 + 32) = 0;
  *((_OWORD *)v3 + 14) = 0u;
  *((_OWORD *)v3 + 15) = 0u;
  *((_OWORD *)v3 + 12) = 0u;
  *((_OWORD *)v3 + 13) = 0u;
  *((_OWORD *)v3 + 10) = 0u;
  *((_OWORD *)v3 + 11) = 0u;
  *((_OWORD *)v3 + 8) = 0u;
  *((_OWORD *)v3 + 9) = 0u;
  *((_OWORD *)v3 + 6) = 0u;
  *((_OWORD *)v3 + 7) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *(_OWORD *)int v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  int v8 = backtrace((void **)(*((void *)this + 1) + 8), 32);
  if (v8 == 32)
  {
    int v17 = 32;
    do
    {
      int v18 = 2 * v17;
      GPUTools::FB::Fbuf::grow(this, (16 * ((unint64_t)(2 * v17) >> 1)) | 8);
      int v8 = backtrace((void **)(*((void *)this + 1) + 8), 2 * v17);
      if (v17 >= 0x80000) {
        break;
      }
      v17 *= 2;
    }
    while (v8 >= v18);
  }
  int v9 = (int *)*((void *)this + 1);
  *int v9 = v8;
  v9[1] = 8;
  uint64_t v10 = (uint64_t)&v9[2 * v8 + 2];
  *((void *)this + 1) = v10;
  uint64_t v11 = v10 - *(void *)this;
  **(_DWORD **)this = v11;
  unint64_t v12 = (v11 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  int v13 = v12 - v11;
  if (v12 != v11)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v12 - v11);
    **(_DWORD **)this += v13;
  }
}

void GPUTools::FB::EncodeGLError(GPUTools::FB *this, GPUTools::FB::Fbuf *a2)
{
  int v2 = (int)a2;
  size_t v4 = (char *)*((void *)this + 1);
  *(_DWORD *)(*(void *)this + 32) |= 0x10u;
  uint64_t v5 = *(unsigned char **)this;
  int64_t v6 = v4 - v5;
  uint64_t v7 = *((unsigned int *)this + 4);
  unint64_t v8 = v7 - (v4 - v5);
  if (v8 > 3) {
    goto LABEL_2;
  }
  int v13 = (259 - v8) & 0xFFFFFF00;
  size_t v14 = (v13 + v7);
  *((_DWORD *)this + 4) = v14;
  if (v5)
  {
    size_t v15 = (char *)reallocf(v5, v14);
    *(void *)this = v15;
    if (v15) {
      goto LABEL_7;
    }
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  size_t v15 = (char *)malloc_type_malloc((v13 + v7), 0xC56234FuLL);
  *(void *)this = v15;
  if (!v15) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v15 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v15, 4uLL);
  }
  size_t v4 = &v15[v6];
  *((void *)this + 1) = &v15[v6];
LABEL_2:
  *(_DWORD *)size_t v4 = 0;
  int v9 = (_DWORD *)*((void *)this + 1);
  *v9++ = v2;
  *((void *)this + 1) = v9;
  uint64_t v10 = (char *)v9 - *(void *)this;
  **(_DWORD **)this = v10;
  unint64_t v11 = (unint64_t)(v10 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  int v12 = v11 - v10;
  if ((char *)v11 != v10)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v11 - (void)v10);
    **(_DWORD **)this += v12;
  }
}

void GPUTools::FB::EncodePerfEvents(GPUTools::FB::Fbuf *a1, int a2, const void *a3, size_t a4)
{
  unint64_t v8 = (char *)*((void *)a1 + 1);
  *(_DWORD *)(*(void *)a1 + 32) |= 0x20u;
  size_t v9 = a4 + 8;
  uint64_t v10 = *(unsigned char **)a1;
  int64_t v11 = v8 - v10;
  uint64_t v12 = *((unsigned int *)a1 + 4);
  unint64_t v13 = v12 - (v8 - v10);
  if (a4 + 8 <= v13) {
    goto LABEL_2;
  }
  int v20 = (v9 - v13 + 255) & 0xFFFFFF00;
  size_t v21 = (v20 + v12);
  *((_DWORD *)a1 + 4) = v21;
  if (v10)
  {
    long long v22 = (char *)reallocf(v10, v21);
    *(void *)a1 = v22;
    if (v22) {
      goto LABEL_7;
    }
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  long long v22 = (char *)malloc_type_malloc((v20 + v12), 0xC56234FuLL);
  *(void *)a1 = v22;
  if (!v22) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v22 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v22, 4uLL);
  }
  unint64_t v8 = &v22[v11];
  *((void *)a1 + 1) = &v22[v11];
LABEL_2:
  bzero(v8, v9);
  size_t v14 = (_DWORD *)*((void *)a1 + 1);
  _DWORD *v14 = a2;
  v14[1] = a4;
  *((void *)a1 + 1) = v14 + 2;
  memcpy(v14 + 2, a3, a4);
  size_t v15 = *(_DWORD **)a1;
  size_t v16 = *((void *)a1 + 1) + a4;
  *((void *)a1 + 1) = v16;
  size_t v17 = v16 - (void)v15;
  _DWORD *v15 = v17;
  unint64_t v18 = (v17 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  int v19 = v18 - v17;
  if (v18 != v17)
  {
    GPUTools::FB::Fbuf::grow_advance(a1, v18 - v17);
    **(_DWORD **)a1 += v19;
  }
}

void GPUTools::FB::EncodeGCDQueueInfo(GPUTools::FB *this, GPUTools::FB::Fbuf *a2, int a3)
{
  int64_t v6 = (char *)*((void *)this + 1);
  *(_DWORD *)(*(void *)this + 32) |= 0x400u;
  uint64_t v7 = *(unsigned char **)this;
  uint64_t v8 = v6 - v7;
  uint64_t v9 = *((unsigned int *)this + 4);
  unint64_t v10 = v9 - (v6 - v7);
  if (v10 > 0xB) {
    goto LABEL_2;
  }
  int v15 = (267 - v10) & 0xFFFFFF00;
  size_t v16 = (v15 + v9);
  *((_DWORD *)this + 4) = v16;
  if (v7)
  {
    size_t v17 = (char *)reallocf(v7, v16);
    *(void *)this = v17;
    if (v17) {
      goto LABEL_7;
    }
LABEL_10:
    dy_abort("failed to allocate fbuf buffer");
  }
  size_t v17 = (char *)malloc_type_malloc((v15 + v9), 0xC56234FuLL);
  *(void *)this = v17;
  if (!v17) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v17 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v17, 4uLL);
  }
  int64_t v6 = &v17[v8];
  *((void *)this + 1) = &v17[v8];
LABEL_2:
  *((_DWORD *)v6 + 2) = 0;
  *(void *)int64_t v6 = 0;
  uint64_t v11 = *((void *)this + 1);
  *(void *)uint64_t v11 = a2;
  *(_DWORD *)(v11 + 8) = a3;
  v11 += 12;
  *((void *)this + 1) = v11;
  uint64_t v12 = v11 - *(void *)this;
  **(_DWORD **)this = v12;
  unint64_t v13 = (v12 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  int v14 = v13 - v12;
  if (v13 != v12)
  {
    GPUTools::FB::Fbuf::grow_advance(this, v13 - v12);
    **(_DWORD **)this += v14;
  }
}

GPUTools::FB::Fbuf *GPUTools::FB::EncodeCurrentGCDQueueInfo(GPUTools::FB *this, GPUTools::FB::Fbuf *a2)
{
  int v2 = *(GPUTools::FB::Fbuf **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 160);
  if (v2)
  {
    int v3 = 0;
    switch(*(_WORD *)(MEMORY[0x263EF8850] + 16))
    {
      case 1:
        int v3 = *((unsigned __int8 *)v2 + *(unsigned __int16 *)(MEMORY[0x263EF8850] + 14));
        break;
      case 2:
        int v3 = *(unsigned __int16 *)((char *)v2 + *(unsigned __int16 *)(MEMORY[0x263EF8850] + 14));
        break;
      case 4:
      case 8:
        int v3 = *(_DWORD *)((char *)v2 + *(unsigned __int16 *)(MEMORY[0x263EF8850] + 14));
        break;
      default:
        break;
    }
    GPUTools::FB::EncodeGCDQueueInfo(this, v2, v3);
  }
  return v2;
}

_DWORD *GPUTools::FB::EncodeThreadLocalFlags(GPUTools::FB *this)
{
  _DWORD *result = v2;
  return result;
}

void *GPUTools::FB::Encode(char **this, GPUTools::FB::Fbuf *a2, int a3, uint64_t a4, const char *a5, GPUTools::FB::ArgumentProvider *a6)
{
  int v8 = (int)a2;
  uint64_t v121 = *MEMORY[0x263EF8340];
  int v116 = a3;
  pthread_mutex_lock(&sFunctionChainLock);
  v118 = 0;
  v119[0] = (__uint64_t)&unk_2700E5F60;
  v119[1] = (__uint64_t)&v116;
  v120 = v119;
  std::__function::__value_func<void ()(void)>::swap[abi:ne180100](v119, v117);
  if (v120 == v119)
  {
    (*(void (**)(__uint64_t *))(v119[0] + 32))(v119);
  }
  else if (v120)
  {
    (*(void (**)(void))(*v120 + 40))();
  }
  int v116 = v10;
  if ((v8 + 12281) < 2 || v8 == -12272)
  {
    if (v8 == -12272) {
      int v12 = 198;
    }
    else {
      int v12 = 70;
    }
    v10 |= v12;
    int v116 = v10;
  }
  else if (v8 == -12288)
  {
    *((_DWORD *)*this + 8) |= 1u;
    uint64_t v11 = this[1];
    goto LABEL_17;
  }
  unint64_t v13 = *this;
  int v14 = this[1];
  int v15 = (char *)(v14 - *this);
  uint64_t v16 = *((unsigned int *)this + 4);
  if ((unint64_t)(v16 - (void)v15) <= 0x23)
  {
    int v106 = (291 - (v16 - v15)) & 0xFFFFFF00;
    size_t v107 = (v106 + v16);
    *((_DWORD *)this + 4) = v107;
    if (v13)
    {
      CATransform3D v108 = (char *)reallocf(v13, v107);
      *this = v108;
      if (v108) {
        goto LABEL_134;
      }
    }
    else
    {
      CATransform3D v108 = (char *)malloc_type_malloc((v106 + v16), 0xC56234FuLL);
      *this = v108;
      if (v108)
      {
LABEL_134:
        if ((v108 & 3) != 0) {
          dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v108, 4uLL);
        }
        int v14 = &v108[(void)v15];
        this[1] = &v108[(void)v15];
        int v10 = v116;
        goto LABEL_14;
      }
    }
    dy_abort("failed to allocate fbuf buffer");
  }
LABEL_14:
  *((_DWORD *)v14 + 8) = 0;
  *(_OWORD *)int v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_DWORD *)*this + 1) = v8;
  *((_DWORD *)*this + 8) = v10;
  v119[0] = 0;
  pthread_threadid_np(0, v119);
  *((void *)*this + 1) = v119[0];
  uint64_t v17 = mach_absolute_time();
  if (g_DYTimebaseInfo != dword_269A2916C) {
    uint64_t v17 = __udivti3();
  }
  *((void *)*this + 2) = v17;
  *((void *)*this + 3) = 0;
  uint64_t v11 = this[1] + 36;
  this[1] = v11;
LABEL_17:
  size_t v18 = (strlen((const char *)a4) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  int v19 = *this;
  int v20 = (char *)(v11 - *this);
  uint64_t v21 = *((unsigned int *)this + 4);
  if (v18 <= v21 - (uint64_t)v20) {
    goto LABEL_18;
  }
  int v103 = (v18 - (v21 - v20) + 255) & 0xFFFFFF00;
  size_t v104 = (v103 + v21);
  *((_DWORD *)this + 4) = v104;
  if (v19)
  {
    CATransform3D v105 = (char *)reallocf(v19, v104);
    *this = v105;
    if (v105) {
      goto LABEL_130;
    }
LABEL_148:
    dy_abort("failed to allocate fbuf buffer");
  }
  CATransform3D v105 = (char *)malloc_type_malloc((v103 + v21), 0xC56234FuLL);
  *this = v105;
  if (!v105) {
    goto LABEL_148;
  }
LABEL_130:
  if ((v105 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v105, 4uLL);
  }
  uint64_t v11 = &v105[(void)v20];
  this[1] = &v105[(void)v20];
LABEL_18:
  bzero(v11, v18);
  strlcpy(this[1], (const char *)a4, v18);
  size_t v22 = (size_t)&this[1][v18];
  this[1] = (char *)v22;
  int v115 = 0;
  v119[0] = 0;
  char v23 = *(unsigned char *)a4;
  if (*(unsigned char *)a4)
  {
    CATransform3D v112 = 0;
    __src = 0;
    unsigned int v24 = 0;
    unsigned int v25 = 0;
    CATransform3D v109 = a5;
    while (2)
    {
      switch(v23)
      {
        case '#':
          int v32 = *(char *)++a4;
          LOBYTE(v31) = v32;
          if (v32 < 0)
          {
            unsigned int v25 = 0;
          }
          else
          {
            unsigned int v25 = 0;
            uint64_t v31 = v31;
            do
            {
              if (!v31) {
                break;
              }
              if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v31 + 60) & 0x400) == 0) {
                break;
              }
              unsigned int v25 = 10 * v25 + v31 - 48;
              int v33 = *(char *)++a4;
              uint64_t v31 = v33;
            }
            while ((v33 & 0x80000000) == 0);
          }
          __src = (int *)(*(uint64_t (**)(const char *))(*(void *)a5 + 72))(a5);
          CATransform3D v112 = (__uint64_t *)(*(uint64_t (**)(const char *))(*(void *)a5 + 72))(a5);
          long long v83 = *this;
          long long v82 = this[1];
          unint64_t v84 = ((unint64_t)(v82 + 3) & 0xFFFFFFFFFFFFFFFCLL) - (void)v82;
          uint64_t v85 = 4 * v25;
          unint64_t v86 = v84 + v85;
          long long v87 = (char *)(v82 - *this);
          uint64_t v88 = *((unsigned int *)this + 4);
          if (v84 + v85 <= v88 - (uint64_t)v87) {
            goto LABEL_89;
          }
          int v93 = (v86 - (v88 - v87) + 255) & 0xFFFFFF00;
          size_t v94 = (v93 + v88);
          *((_DWORD *)this + 4) = v94;
          if (v83)
          {
            long long v95 = (char *)reallocf(v83, v94);
            *this = v95;
            if (!v95) {
LABEL_142:
            }
              dy_abort("failed to allocate fbuf buffer");
          }
          else
          {
            long long v95 = (char *)malloc_type_malloc((v93 + v88), 0xC56234FuLL);
            *this = v95;
            if (!v95) {
              goto LABEL_142;
            }
          }
          if ((v95 & 3) != 0) {
            dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v95, 4uLL);
          }
          long long v82 = &v95[(void)v87];
          this[1] = v82;
LABEL_89:
          bzero(v82, v84 + v85);
          memcpy(&this[1][v84], __src, 4 * v25);
          unsigned int v24 = 0;
          this[1] += v86;
          goto LABEL_24;
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case ';':
        case '=':
        case '>':
        case '?':
          goto LABEL_34;
        case ':':
          dy_abort("url list encoding is no longer supported");
        case '<':
          int v73 = *(unsigned __int8 *)(a4 + 1);
          BOOL v74 = v73 == 99 || v73 == 117;
          uint64_t v75 = 1;
          if (v74) {
            uint64_t v75 = 2;
          }
          a4 += v75 + 2;
          goto LABEL_24;
        case '@':
          int v115 = 0;
          int v77 = *(char *)++a4;
          LOBYTE(v76) = v77;
          if ((v77 & 0x80000000) == 0)
          {
            int v78 = 0;
            uint64_t v76 = v76;
            do
            {
              if (!v76) {
                break;
              }
              if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v76 + 60) & 0x400) == 0) {
                break;
              }
              int v78 = 10 * v78 + v76 - 48;
              int v115 = v78;
              int v79 = *(char *)++a4;
              uint64_t v76 = v79;
            }
            while ((v79 & 0x80000000) == 0);
          }
          unsigned int v24 = 0;
          v119[0] = (*(uint64_t (**)(const char *))(*(void *)a5 + 72))(a5);
          CATransform3D v112 = v119;
          __src = &v115;
          unsigned int v25 = 1;
          goto LABEL_24;
        default:
          if (v23 == 99 || v23 == 117) {
            goto LABEL_23;
          }
LABEL_34:
          uint64_t v34 = v23;
          uint64_t v110 = a4;
          if (v25)
          {
            int v35 = v34 - 65;
            if ((v34 - 65) > 0x37 || ((1 << v35) & 0xCCA93A01BFFDBFLL) == 0) {
              dy_abort("unknown format character: '%c' (in '%s')\n", v34, (const char *)a4);
            }
            uint64_t v36 = 1;
            while (1)
            {
              long long v37 = (const void *)v112[v24];
              uint64_t v38 = v24;
              switch(v35)
              {
                case 0:
                case 1:
                case 4:
                case 5:
                case 7:
                case 8:
                case 10:
                case 11:
                case 14:
                case 16:
                case 17:
                case 19:
                case 23:
                case 36:
                case 37:
                case 40:
                case 45:
                case 55:
                  size_t v39 = 4 * __src[v24];
                  goto LABEL_41;
                case 2:
                case 3:
                case 12:
                case 13:
                case 15:
                case 24:
                case 35:
                case 43:
                case 47:
                case 51:
                case 54:
                  size_t v39 = 8 * __src[v24];
LABEL_41:
                  uint64_t v36 = 4;
                  goto LABEL_42;
                case 33:
                  size_t v39 = __src[v24];
                  goto LABEL_42;
                case 50:
                  size_t v39 = 2 * __src[v24];
                  uint64_t v36 = 2;
LABEL_42:
                  long long v41 = *this;
                  long long v40 = this[1];
                  unint64_t v42 = ((unint64_t)&v40[v36 - 1] & -v36) - (void)v40;
                  unint64_t v43 = v42 + v39;
                  double v44 = (char *)(v40 - *this);
                  uint64_t v45 = *((unsigned int *)this + 4);
                  if (v42 + v39 <= v45 - (uint64_t)v44) {
                    goto LABEL_43;
                  }
                  int v66 = (v43 - (v45 - v44) + 255) & 0xFFFFFF00;
                  size_t v67 = (v66 + v45);
                  *((_DWORD *)this + 4) = v67;
                  if (v41)
                  {
                    uint64_t v68 = (char *)reallocf(v41, v67);
                    *this = v68;
                    if (!v68) {
LABEL_136:
                    }
                      dy_abort("failed to allocate fbuf buffer");
                  }
                  else
                  {
                    uint64_t v68 = (char *)malloc_type_malloc((v66 + v45), 0xC56234FuLL);
                    *this = v68;
                    if (!v68) {
                      goto LABEL_136;
                    }
                  }
                  if ((v68 & 3) != 0) {
                    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v68, 4uLL);
                  }
                  long long v40 = &v68[(void)v44];
                  this[1] = v40;
LABEL_43:
                  bzero(v40, v42 + v39);
                  memcpy(&this[1][v42], v37, v39);
                  this[1] += v43;
                  goto LABEL_44;
                default:
                  CGFloat v47 = *this;
                  double v46 = this[1];
                  unint64_t v48 = ((unint64_t)(v46 + 3) & 0xFFFFFFFFFFFFFFFCLL) - (void)v46;
                  long long v49 = __src;
                  uint64_t v50 = 4 * __src[v24];
                  unint64_t v51 = v48 + v50;
                  uint64_t v52 = *((unsigned int *)this + 4);
                  unint64_t v53 = v52 - (v46 - *this);
                  if (v48 + v50 <= v53) {
                    goto LABEL_47;
                  }
                  uint64_t v69 = (char *)(v46 - *this);
                  int v70 = (v51 - v53 + 255) & 0xFFFFFF00;
                  size_t v71 = (v70 + v52);
                  *((_DWORD *)this + 4) = v71;
                  if (v47)
                  {
                    double v72 = (char *)reallocf(v47, v71);
                    *this = v72;
                    if (!v72) {
LABEL_145:
                    }
                      dy_abort("failed to allocate fbuf buffer");
                  }
                  else
                  {
                    double v72 = (char *)malloc_type_malloc((v70 + v52), 0xC56234FuLL);
                    *this = v72;
                    if (!v72) {
                      goto LABEL_145;
                    }
                  }
                  if ((v72 & 3) != 0) {
                    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v72, 4uLL);
                  }
                  double v46 = &v72[(void)v69];
                  this[1] = v46;
                  long long v49 = __src;
LABEL_47:
                  bzero(v46, v48 + v50);
                  long long v54 = *this;
                  long long v55 = this[1];
                  this[1] = &v55[v51];
                  if (v49[v38])
                  {
                    unint64_t v56 = 0;
                    CATransform3D v111 = &v55[v48 - (void)v54];
                    do
                    {
                      size_t v57 = strlen(*((const char **)v37 + v56)) + 1;
                      long long v58 = *this;
                      long long v59 = this[1];
                      long long v60 = (char *)(v59 - *this);
                      uint64_t v61 = *((unsigned int *)this + 4);
                      if (v57 > v61 - (uint64_t)v60)
                      {
                        int v63 = (v57 - (v61 - v60) + 255) & 0xFFFFFF00;
                        size_t v64 = (v63 + v61);
                        *((_DWORD *)this + 4) = v64;
                        if (v58)
                        {
                          Class v65 = (char *)reallocf(v58, v64);
                          *this = v65;
                          if (!v65) {
LABEL_138:
                          }
                            dy_abort("failed to allocate fbuf buffer");
                        }
                        else
                        {
                          Class v65 = (char *)malloc_type_malloc((v63 + v61), 0xC56234FuLL);
                          *this = v65;
                          if (!v65) {
                            goto LABEL_138;
                          }
                        }
                        if ((v65 & 3) != 0) {
                          dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v65, 4uLL);
                        }
                        long long v59 = &v65[(void)v60];
                        this[1] = &v65[(void)v60];
                      }
                      bzero(v59, v57);
                      memcpy(this[1], *((const void **)v37 + v56), v57);
                      int v62 = *this;
                      this[1] += v57;
                      *(_DWORD *)&v62[4 * v56 + (void)v111] = v50;
                      v50 += v57;
                      ++v56;
                    }
                    while (v56 < __src[v38]);
                  }
LABEL_44:
                  unsigned int v24 = v38 + 1;
                  if (!--v25) {
                    goto LABEL_22;
                  }
                  break;
              }
            }
          }
          switch(v23)
          {
            case 'A':
            case 'B':
            case 'E':
            case 'F':
            case 'H':
            case 'I':
            case 'K':
            case 'L':
            case 'O':
            case 'Q':
            case 'R':
            case 'T':
            case 'X':
            case 'e':
            case 'i':
            case 'x':
              LODWORD(v114) = (*(uint64_t (**)(const char *))(*(void *)a5 + 32))(a5);
              goto LABEL_86;
            case 'C':
            case 'D':
            case 'M':
            case 'P':
            case 'Y':
            case 'l':
            case 'p':
            case 't':
              uint64_t v89 = (*(uint64_t (**)(const char *))(*(void *)a5 + 72))(a5);
              goto LABEL_91;
            case 'N':
            case 'w':
              uint64_t v89 = (*(uint64_t (**)(const char *))(*(void *)a5 + 40))(a5);
LABEL_91:
              double v114 = *(double *)&v89;
              goto LABEL_92;
            case 'S':
            case 'U':
            case 'V':
              long long v90 = (const char *)(*(uint64_t (**)(const char *))(*(void *)a5 + 80))(a5);
              double v114 = *(double *)&v90;
              if (v90) {
                size_t v80 = strlen(v90) + 1;
              }
              else {
                size_t v80 = 8;
              }
              goto LABEL_101;
            case 'b':
              LOBYTE(v114) = (*(uint64_t (**)(const char *))(*(void *)a5 + 16))(a5);
              size_t v80 = 1;
LABEL_101:
              uint64_t v81 = 1;
              break;
            case 'd':
              double v114 = (*(double (**)(const char *))(*(void *)a5 + 64))(a5);
LABEL_92:
              size_t v80 = 8;
              uint64_t v81 = 4;
              break;
            case 'f':
            case 'n':
              LODWORD(v114) = (*(float (**)(const char *))(*(void *)a5 + 56))(a5);
LABEL_86:
              size_t v80 = 4;
              uint64_t v81 = 4;
              break;
            case 's':
              LOWORD(v114) = (*(uint64_t (**)(const char *))(*(void *)a5 + 24))(a5);
              size_t v80 = 2;
              uint64_t v81 = 2;
              break;
            default:
              dy_abort("unknown format character: '%c' (in '%s')\n", v23, (const char *)a4);
          }
          long long v91 = this[1];
          long long v92 = (int *)&v114;
          if (v34 - 83 <= 3 && v34 != 84)
          {
            if (v114 == 0.0) {
              long long v92 = &GPUTools::FB::g_null_string_token;
            }
            else {
              long long v92 = *(int **)&v114;
            }
          }
          unint64_t v26 = ((unint64_t)&v91[v81 - 1] & -v81) - (void)v91;
          unint64_t v27 = v26 + v80;
          long long v28 = *this;
          long long v29 = (char *)(v91 - *this);
          uint64_t v30 = *((unsigned int *)this + 4);
          if (v26 + v80 <= v30 - (uint64_t)v29) {
            goto LABEL_21;
          }
          int v96 = (v27 - (v30 - v29) + 255) & 0xFFFFFF00;
          size_t v97 = (v96 + v30);
          *((_DWORD *)this + 4) = v97;
          if (v28)
          {
            CATransform3D v98 = (char *)reallocf(v28, v97);
            *this = v98;
            if (!v98) {
LABEL_118:
            }
              dy_abort("failed to allocate fbuf buffer");
          }
          else
          {
            CATransform3D v98 = (char *)malloc_type_malloc((v96 + v30), 0xC56234FuLL);
            *this = v98;
            if (!v98) {
              goto LABEL_118;
            }
          }
          if ((v98 & 3) != 0) {
            dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v98, 4uLL);
          }
          long long v91 = &v98[(void)v29];
          this[1] = v91;
LABEL_21:
          bzero(v91, v26 + v80);
          memcpy(&this[1][v26], v92, v80);
          this[1] += v27;
LABEL_22:
          unsigned int v25 = 0;
          a5 = v109;
          a4 = v110;
LABEL_23:
          ++a4;
LABEL_24:
          char v23 = *(unsigned char *)a4;
          if (*(unsigned char *)a4) {
            continue;
          }
          size_t v22 = (size_t)this[1];
          break;
      }
      break;
    }
  }
  size_t v99 = v22 - (void)*this;
  *(_DWORD *)*this = v99;
  unint64_t v100 = (v99 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  int v101 = v100 - v99;
  if (v100 != v99)
  {
    GPUTools::FB::Fbuf::grow_advance((GPUTools::FB::Fbuf *)this, v100 - v99);
    *(_DWORD *)*this += v101;
  }
  if (!v118) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(void *))(*v118 + 48))(v118);
  CGFloat result = v118;
  if (v118 == v117) {
    return (void *)(*(uint64_t (**)(void *))(v117[0] + 32))(v117);
  }
  if (v118) {
    return (void *)(*(uint64_t (**)(void))(*v118 + 40))();
  }
  return result;
}

void sub_24F671774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  dy_defer::~dy_defer((dy_defer *)va);
  _Unwind_Resume(a1);
}

void dy_defer::~dy_defer(dy_defer *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  int v3 = (dy_defer *)*((void *)this + 3);
  if (v3 == this)
  {
    (*(void (**)(dy_defer *))(*(void *)this + 32))(this);
  }
  else if (v3)
  {
    (*(void (**)(dy_defer *))(*(void *)v3 + 40))(v3);
  }
}

void GPUTools::FB::CreateFunction(GPUTools::FB *this@<X0>, char *a2@<X3>, uint64_t a3@<X4>, int a4@<W1>, uint64_t a5@<X2>, GPUTools::FD::Function *a6@<X8>, ...)
{
  va_start(va, a6);
  unsigned int v25 = 0;
  uint64_t v26 = 0;
  unsigned int v27 = 0;
  GPUTools::FD::Function::Function((GPUTools::FD::Function *)v22);
  va_copy(v21, va);
  GPUTools::FB::VAListArgumentProvider::VAListArgumentProvider(v20, va);
  GPUTools::FB::Encode(&v25, this, a4, a3, v20, v13);
  if (a5)
  {
    uint64_t v16 = &unk_2700E6160;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    GPUTools::FB::FIFOPointerArgumentProvider::push((GPUTools::FB::FIFOPointerArgumentProvider *)&v16, a2);
    GPUTools::FB::Encode(&v25, (GPUTools::FB::Fbuf *)0xFFFFD000, 0, a5, (const char *)&v16, v14);
    GPUTools::FB::FIFOPointerArgumentProvider::~FIFOPointerArgumentProvider((GPUTools::FB::FIFOPointerArgumentProvider *)&v16);
  }
  GPUTools::FB::Decoder::Decoder(&v16, 4, 0);
  GPUTools::FB::Decoder::Decode((GPUTools::FB::Decoder *)&v16, v25, v27, (GPUTools::FD::Function *)v22);
  if (v24)
  {
    GPUTools::FD::Function::Function(a6, (const GPUTools::FD::Function *)v22);
  }
  else
  {
    int v15 = v25;
    int v23 = v26 - v25;
    unsigned int v25 = 0;
    uint64_t v26 = 0;
    unsigned int v27 = 0;
    unsigned int v24 = v15;
    GPUTools::FD::Function::Function(a6, v22);
  }
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder((GPUTools::FD::IFunctionDecoder *)&v16);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)v20);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v22);
  if (v25) {
    free(v25);
  }
}

void sub_24F671C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider((GPUTools::FB::VAListArgumentProvider *)va);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)va1);
  int v10 = *(void **)(v8 - 88);
  if (v10) {
    free(v10);
  }
  _Unwind_Resume(a1);
}

void GPUTools::FB::Fbuf::grow_advance(GPUTools::FB::Fbuf *this, size_t a2)
{
  size_t v4 = *(unsigned char **)this;
  uint64_t v5 = (char *)*((void *)this + 1);
  int64_t v6 = v5 - v4;
  uint64_t v7 = *((unsigned int *)this + 4);
  size_t v8 = v7 - (v5 - v4);
  if (a2 <= v8) {
    goto LABEL_2;
  }
  int v9 = (a2 - v8 + 255) & 0xFFFFFF00;
  size_t v10 = (v9 + v7);
  *((_DWORD *)this + 4) = v10;
  if (v4)
  {
    uint64_t v11 = (char *)reallocf(v4, v10);
    *(void *)this = v11;
    if (v11) {
      goto LABEL_5;
    }
LABEL_8:
    dy_abort("failed to allocate fbuf buffer");
  }
  uint64_t v11 = (char *)malloc_type_malloc((v9 + v7), 0xC56234FuLL);
  *(void *)this = v11;
  if (!v11) {
    goto LABEL_8;
  }
LABEL_5:
  if ((v11 & 3) != 0) {
    dy_abort("misaligned fbuf buffer: %p, required alignment=%zu", v11, 4uLL);
  }
  uint64_t v5 = &v11[v6];
  *((void *)this + 1) = &v11[v6];
LABEL_2:
  bzero(v5, a2);
  *((void *)this + 1) += a2;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x253360DD0);
}

void std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::~__func()
{
}

void *std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::__clone(uint64_t a1)
{
  CGFloat result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_2700E5F60;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_2700E5F60;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0,std::allocator<GPUTools::FB::Encode(GPUTools::FB::Fbuf &,unsigned int,int,char const*,GPUTools::FB::ArgumentProvider &)::$_0>,void ()(void)>::operator()(uint64_t result)
{
  if ((**(_DWORD **)(result + 8) & 0x3000) != 0x1000)
  {
    uint64_t v1 = result;
    CGFloat result = pthread_mutex_unlock(&sFunctionChainLock);
    if ((*(unsigned char *)(*(void *)(v1 + 8) + 1) & 0x20) != 0)
    {
      return pthread_mutex_unlock(&sFunctionChainLock);
    }
  }
  return result;
}

void *std::__function::__value_func<void ()(void)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    size_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        CGFloat result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        CGFloat result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      CGFloat result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_24F67218C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t GPUTools::FD::Argument::GetCoreTypeSize(int a1)
{
  if ((a1 - 1) >= 0xD) {
    dy_abort("unknown or invalid parameter core type: 0x%x", a1);
  }
  return qword_24F695460[a1 - 1];
}

char *GPUTools::FD::Argument::GetCoreTypeCString(unsigned int a1)
{
  if (a1 >= 0x30) {
    dy_abort("%s: unknown or invalid parameter core type: 0x%x", "static const char *GPUTools::FD::Argument::GetCoreTypeCString(Type)", a1);
  }
  return off_265336BE8[a1];
}

size_t GPUTools::FD::Argument::GLObjectNameFromVariable(GPUTools::FD::Argument *this, const char *a2)
{
  if (!this) {
    __assert_rtn("static uint32_t GPUTools::FD::Argument::GLObjectNameFromVariable(const char *)", "", 0, "variable");
  }
  size_t result = strlen((const char *)this);
  if (result)
  {
    size_t v4 = (char *)this + result - 1;
    do
    {
      uint64_t v5 = v4;
      if (v4 < (char *)this) {
        break;
      }
      int v6 = *v4;
      if (v6 < 0) {
        break;
      }
      int v7 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60);
      size_t v4 = v5 - 1;
    }
    while ((v7 & 0x400) != 0);
    return strtol(v5 + 1, 0, 10);
  }
  return result;
}

uint64_t GPUTools::FD::Argument::UniformLocationFromVariable(GPUTools::FD::Argument *this, const char *a2)
{
  if (!this) {
    __assert_rtn("static int32_t GPUTools::FD::Argument::UniformLocationFromVariable(const char *)", "", 0, "variable");
  }
  size_t v3 = strlen((const char *)this);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  size_t v4 = (char *)this + v3 - 1;
  do
  {
    uint64_t v5 = v4;
    if (v4 < (char *)this) {
      break;
    }
    int v6 = *v4;
    if (v6 < 0) {
      break;
    }
    int v7 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60);
    size_t v4 = v5 - 1;
  }
  while ((v7 & 0x400) != 0);
  return strtol(v5 + 1, 0, 10);
}

uint64_t GPUTools::FD::Argument::ProgramAndUniformBlockIndexFromVariable(GPUTools::FD::Argument *this, char *a2, unsigned int *a3, unsigned int *a4)
{
  *(_DWORD *)a2 = 0;
  *a3 = -1;
  uint64_t result = strlen((const char *)this);
  if (result)
  {
    size_t v8 = (char *)this + result - 1;
    uint64_t v9 = MEMORY[0x263EF8318];
    do
    {
      size_t v10 = v8;
      if (v8 < (char *)this) {
        break;
      }
      int v11 = *v8;
      if (v11 < 0) {
        break;
      }
      int v12 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60);
      size_t v8 = v10 - 1;
    }
    while ((v12 & 0x400) != 0);
    *a3 = strtol(v10 + 1, 0, 10);
    uint64_t v13 = v10 - 1;
    do
    {
      uint64_t v14 = v13;
      if (v13 < (char *)this) {
        break;
      }
      int v15 = *v13;
      if (v15 < 0) {
        break;
      }
      int v16 = *(_DWORD *)(v9 + 4 * v15 + 60);
      uint64_t v13 = v14 - 1;
    }
    while ((v16 & 0x400) != 0);
    uint64_t result = strtol(v14 + 1, 0, 10);
    *(_DWORD *)a2 = result;
  }
  return result;
}

uint64_t GPUTools::FD::Argument::ProgramAndUniformLocationFromVariable(GPUTools::FD::Argument *this, char *a2, unsigned int *a3, int *a4)
{
  *(_DWORD *)a2 = 0;
  *a3 = -1;
  uint64_t result = strlen((const char *)this);
  if (result)
  {
    size_t v8 = (char *)this + result - 1;
    uint64_t v9 = MEMORY[0x263EF8318];
    do
    {
      size_t v10 = v8;
      if (v8 < (char *)this) {
        break;
      }
      int v11 = *v8;
      if (v11 < 0) {
        break;
      }
      int v12 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60);
      size_t v8 = v10 - 1;
    }
    while ((v12 & 0x400) != 0);
    *a3 = strtol(v10 + 1, 0, 10);
    uint64_t v13 = v10 - 1;
    do
    {
      uint64_t v14 = v13;
      if (v13 < (char *)this) {
        break;
      }
      int v15 = *v13;
      if (v15 < 0) {
        break;
      }
      int v16 = *(_DWORD *)(v9 + 4 * v15 + 60);
      uint64_t v13 = v14 - 1;
    }
    while ((v16 & 0x400) != 0);
    uint64_t result = strtol(v14 + 1, 0, 10);
    *(_DWORD *)a2 = result;
  }
  return result;
}

size_t GPUTools::FD::Argument::ViewAsGLObjectName(const char **this)
{
  if ((*((_WORD *)this + 11) & 0x10) != 0)
  {
    size_t v3 = *this;
    if (!*this) {
      __assert_rtn("static uint32_t GPUTools::FD::Argument::GLObjectNameFromVariable(const char *)", "", 0, "variable");
    }
    size_t result = strlen(*this);
    if (result)
    {
      size_t v4 = &v3[result - 1];
      do
      {
        uint64_t v5 = v4;
        if (v4 < v3) {
          break;
        }
        int v6 = *v4;
        if (v6 < 0) {
          break;
        }
        int v7 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60);
        size_t v4 = v5 - 1;
      }
      while ((v7 & 0x400) != 0);
      return strtol(v5 + 1, 0, 10);
    }
  }
  else
  {
    int v1 = *((_DWORD *)this + 2);
    if (v1 != 6 && v1 != 12) {
      dy_abort("cannot view argument as OpenGL object name: core_type=%u, sem_type=%u", *((_DWORD *)this + 2), *((_DWORD *)this + 3));
    }
    return *(unsigned int *)*this;
  }
  return result;
}

uint64_t GPUTools::FD::Argument::ViewAsUniformLocation(const char **this)
{
  if ((*((_WORD *)this + 11) & 0x10) != 0)
  {
    uint64_t v2 = *this;
    if (!*this) {
      __assert_rtn("static int32_t GPUTools::FD::Argument::UniformLocationFromVariable(const char *)", "", 0, "variable");
    }
    size_t v3 = strlen(*this);
    if (v3)
    {
      size_t v4 = &v2[v3 - 1];
      do
      {
        uint64_t v5 = v4;
        if (v4 < v2) {
          break;
        }
        int v6 = *v4;
        if (v6 < 0) {
          break;
        }
        int v7 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60);
        size_t v4 = v5 - 1;
      }
      while ((v7 & 0x400) != 0);
      return strtol(v5 + 1, 0, 10);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    if (*((_DWORD *)this + 2) != 5) {
      dy_abort("cannot view argument as uniform location: core_type=%u, sem_type=%u", *((_DWORD *)this + 2), *((_DWORD *)this + 3));
    }
    return *(unsigned int *)*this;
  }
}

__n128 GPUTools::FD::CoreFunction::DoCommonCopyMove(GPUTools::FD::CoreFunction *this, CoreFunction *a2, const CoreFunction *a3)
{
  *(void *)this = *(void *)&a2->var0;
  *((_WORD *)this + 5) = a2->var3;
  *((void *)this + 2) = a2->var4.var0;
  long long v3 = *(_OWORD *)&a2->var5.var0;
  *((void *)this + 5) = *(void *)&a2->var5.var3;
  *(_OWORD *)((char *)this + 24) = v3;
  long long v4 = *(_OWORD *)&a2->var6[0].var0;
  *((void *)this + 8) = *(void *)&a2->var6[0].var3;
  *((_OWORD *)this + 3) = v4;
  long long v5 = *(_OWORD *)&a2->var6[1].var0;
  *((void *)this + 11) = *(void *)&a2->var6[1].var3;
  *(_OWORD *)((char *)this + 72) = v5;
  long long v6 = *(_OWORD *)&a2->var6[2].var0;
  *((void *)this + 14) = *(void *)&a2->var6[2].var3;
  *((_OWORD *)this + 6) = v6;
  long long v7 = *(_OWORD *)&a2->var6[3].var0;
  *((void *)this + 17) = *(void *)&a2->var6[3].var3;
  *(_OWORD *)((char *)this + 120) = v7;
  long long v8 = *(_OWORD *)&a2->var6[4].var0;
  *((void *)this + 20) = *(void *)&a2->var6[4].var3;
  *((_OWORD *)this + 9) = v8;
  long long v9 = *(_OWORD *)&a2->var6[5].var0;
  *((void *)this + 23) = *(void *)&a2->var6[5].var3;
  *(_OWORD *)((char *)this + 168) = v9;
  long long v10 = *(_OWORD *)&a2->var6[6].var0;
  *((void *)this + 26) = *(void *)&a2->var6[6].var3;
  *((_OWORD *)this + 12) = v10;
  long long v11 = *(_OWORD *)&a2->var6[7].var0;
  *((void *)this + 29) = *(void *)&a2->var6[7].var3;
  *(_OWORD *)((char *)this + 216) = v11;
  long long v12 = *(_OWORD *)&a2->var6[8].var0;
  *((void *)this + 32) = *(void *)&a2->var6[8].var3;
  *((_OWORD *)this + 15) = v12;
  long long v13 = *(_OWORD *)&a2->var6[9].var0;
  *((void *)this + 35) = *(void *)&a2->var6[9].var3;
  *(_OWORD *)((char *)this + 264) = v13;
  long long v14 = *(_OWORD *)&a2->var6[10].var0;
  *((void *)this + 38) = *(void *)&a2->var6[10].var3;
  *((_OWORD *)this + 18) = v14;
  long long v15 = *(_OWORD *)&a2->var6[11].var0;
  *((void *)this + 41) = *(void *)&a2->var6[11].var3;
  *(_OWORD *)((char *)this + 312) = v15;
  long long v16 = *(_OWORD *)&a2->var6[12].var0;
  *((void *)this + 44) = *(void *)&a2->var6[12].var3;
  *((_OWORD *)this + 21) = v16;
  long long v17 = *(_OWORD *)&a2->var6[13].var0;
  *((void *)this + 47) = *(void *)&a2->var6[13].var3;
  *(_OWORD *)((char *)this + 360) = v17;
  long long v18 = *(_OWORD *)&a2->var6[14].var0;
  *((void *)this + 50) = *(void *)&a2->var6[14].var3;
  *((_OWORD *)this + 24) = v18;
  __n128 result = *(__n128 *)&a2->var6[15].var0;
  *((void *)this + 53) = *(void *)&a2->var6[15].var3;
  *(__n128 *)((char *)this + 408) = result;
  *((_DWORD *)this + 108) = a2->var7;
  return result;
}

void *GPUTools::FD::CoreFunction::Relocate(GPUTools::FD::CoreFunction *this, GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  uint64_t v5 = *((unsigned int *)a2 + 108);
  size_t v6 = *((void *)a2 + 56);
  size_t v31 = *((void *)a2 + 55);
  size_t v32 = v5 + v31;
  size_t v7 = *((unsigned int *)a2 + 109);
  size_t v8 = v7 + v6;
  size_t v33 = v6;
  size_t v34 = v7 + v6;
  long long v9 = (void **)v35;
  long long v10 = (void **)v36;
  long long v37 = v35;
  uint64_t v38 = v36;
  size_t v11 = *((void *)a2 + 3);
  if (!v11) {
    goto LABEL_8;
  }
  if (v31 > v11 || v11 >= v5 + v31)
  {
    if (v6 > v11) {
      goto LABEL_8;
    }
    long long v13 = v36;
    long long v14 = &v38;
    long long v12 = &v33;
    if (v11 >= v8) {
      goto LABEL_8;
    }
  }
  else
  {
    long long v12 = &v31;
    long long v13 = v35;
    long long v14 = &v37;
  }
  *(void *)long long v13 = (char *)this + 24;
  *v14 += 8;
  *((void *)this + 3) = v11 - *v12;
LABEL_8:
  for (uint64_t i = 48; i != 432; i += 24)
  {
    size_t v18 = *(void *)((char *)a2 + i);
    if (v18)
    {
      if (v31 <= v18 && v32 > v18)
      {
        long long v16 = &v31;
        long long v17 = &v37;
LABEL_10:
        *(void *)*long long v17 = (char *)this + i;
        *v17 += 8;
        *(void *)((char *)this + i) = v18 - *v16;
        continue;
      }
      BOOL v20 = v33 <= v18 && v34 > v18;
      long long v17 = &v38;
      long long v16 = &v33;
      if (v20) {
        goto LABEL_10;
      }
    }
  }
  if (*((void *)a2 + 55) == *((void *)a2 + 56))
  {
    *((_DWORD *)this + 109) = v7;
    unsigned int v27 = malloc_type_malloc(v7, 0xFD037C57uLL);
    *((void *)this + 56) = v27;
    __n128 result = memcpy(v27, *((const void **)a2 + 56), *((unsigned int *)a2 + 109));
    unsigned int v21 = 0;
  }
  else
  {
    unsigned int v21 = (v5 + 15) & 0xFFFFFFF0;
    size_t v22 = v7 + v21;
    *((_DWORD *)this + 109) = v22;
    int v23 = malloc_type_malloc(v22, 0xFF435406uLL);
    *((void *)this + 56) = v23;
    __n128 result = memcpy(v23, *((const void **)a2 + 55), *((unsigned int *)a2 + 108));
    unsigned int v25 = (const void *)*((void *)a2 + 56);
    if (v25)
    {
      __n128 result = memcpy((void *)(*((void *)this + 56) + v21), v25, *((unsigned int *)a2 + 109));
      uint64_t v26 = *((void *)this + 56);
      *((void *)this + 55) = v26;
      if (v35 == v37) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  uint64_t v26 = *((void *)this + 56);
  *((void *)this + 55) = v26;
  if (v35 == v37) {
    goto LABEL_29;
  }
  do
  {
LABEL_28:
    long long v28 = *v9++;
    *v28 += v26;
  }
  while (v9 != (void **)v37);
LABEL_29:
  if (v36 != v38)
  {
    uint64_t v29 = v26 + v21;
    do
    {
      uint64_t v30 = *v10++;
      *v30 += v29;
    }
    while (v10 != (void **)v38);
  }
  return result;
}

double GPUTools::FD::CoreFunction::CoreFunction(GPUTools::FD::CoreFunction *this)
{
  *(void *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((void *)this + 56) = 0;
  return result;
}

{
  double result;

  *(void *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *((void *)this + 56) = 0;
  return result;
}

GPUTools::FD::CoreFunction *GPUTools::FD::CoreFunction::CoreFunction(GPUTools::FD::CoreFunction *this, const GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  *((_DWORD *)this + 109) = 0;
  *((void *)this + 56) = 0;
  if (this != a2)
  {
    *(void *)this = *(void *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((void *)this + 2) = *((void *)a2 + 2);
    long long v4 = *(_OWORD *)((char *)a2 + 24);
    *((void *)this + 5) = *((void *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v4;
    long long v5 = *((_OWORD *)a2 + 3);
    *((void *)this + 8) = *((void *)a2 + 8);
    *((_OWORD *)this + 3) = v5;
    long long v6 = *(_OWORD *)((char *)a2 + 72);
    *((void *)this + 11) = *((void *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v6;
    long long v7 = *((_OWORD *)a2 + 6);
    *((void *)this + 14) = *((void *)a2 + 14);
    *((_OWORD *)this + 6) = v7;
    long long v8 = *(_OWORD *)((char *)a2 + 120);
    *((void *)this + 17) = *((void *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v8;
    long long v9 = *((_OWORD *)a2 + 9);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((_OWORD *)this + 9) = v9;
    long long v10 = *(_OWORD *)((char *)a2 + 168);
    *((void *)this + 23) = *((void *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v10;
    long long v11 = *((_OWORD *)a2 + 12);
    *((void *)this + 26) = *((void *)a2 + 26);
    *((_OWORD *)this + 12) = v11;
    long long v12 = *(_OWORD *)((char *)a2 + 216);
    *((void *)this + 29) = *((void *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v12;
    long long v13 = *((_OWORD *)a2 + 15);
    *((void *)this + 32) = *((void *)a2 + 32);
    *((_OWORD *)this + 15) = v13;
    long long v14 = *(_OWORD *)((char *)a2 + 264);
    *((void *)this + 35) = *((void *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v14;
    long long v15 = *((_OWORD *)a2 + 18);
    *((void *)this + 38) = *((void *)a2 + 38);
    *((_OWORD *)this + 18) = v15;
    long long v16 = *(_OWORD *)((char *)a2 + 312);
    *((void *)this + 41) = *((void *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v16;
    long long v17 = *((_OWORD *)a2 + 21);
    *((void *)this + 44) = *((void *)a2 + 44);
    *((_OWORD *)this + 21) = v17;
    long long v18 = *(_OWORD *)((char *)a2 + 360);
    *((void *)this + 47) = *((void *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v18;
    long long v19 = *((_OWORD *)a2 + 24);
    *((void *)this + 50) = *((void *)a2 + 50);
    *((_OWORD *)this + 24) = v19;
    long long v20 = *(_OWORD *)((char *)a2 + 408);
    *((void *)this + 53) = *((void *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v20;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  return this;
}

{
  long long v4;
  long long v5;
  long long v6;
  long long v7;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;

  *((_DWORD *)this + 109) = 0;
  *((void *)this + 56) = 0;
  if (this != a2)
  {
    *(void *)this = *(void *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((void *)this + 2) = *((void *)a2 + 2);
    long long v4 = *(_OWORD *)((char *)a2 + 24);
    *((void *)this + 5) = *((void *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v4;
    long long v5 = *((_OWORD *)a2 + 3);
    *((void *)this + 8) = *((void *)a2 + 8);
    *((_OWORD *)this + 3) = v5;
    long long v6 = *(_OWORD *)((char *)a2 + 72);
    *((void *)this + 11) = *((void *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v6;
    long long v7 = *((_OWORD *)a2 + 6);
    *((void *)this + 14) = *((void *)a2 + 14);
    *((_OWORD *)this + 6) = v7;
    long long v8 = *(_OWORD *)((char *)a2 + 120);
    *((void *)this + 17) = *((void *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v8;
    long long v9 = *((_OWORD *)a2 + 9);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((_OWORD *)this + 9) = v9;
    long long v10 = *(_OWORD *)((char *)a2 + 168);
    *((void *)this + 23) = *((void *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v10;
    long long v11 = *((_OWORD *)a2 + 12);
    *((void *)this + 26) = *((void *)a2 + 26);
    *((_OWORD *)this + 12) = v11;
    long long v12 = *(_OWORD *)((char *)a2 + 216);
    *((void *)this + 29) = *((void *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v12;
    long long v13 = *((_OWORD *)a2 + 15);
    *((void *)this + 32) = *((void *)a2 + 32);
    *((_OWORD *)this + 15) = v13;
    long long v14 = *(_OWORD *)((char *)a2 + 264);
    *((void *)this + 35) = *((void *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v14;
    long long v15 = *((_OWORD *)a2 + 18);
    *((void *)this + 38) = *((void *)a2 + 38);
    *((_OWORD *)this + 18) = v15;
    long long v16 = *(_OWORD *)((char *)a2 + 312);
    *((void *)this + 41) = *((void *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v16;
    long long v17 = *((_OWORD *)a2 + 21);
    *((void *)this + 44) = *((void *)a2 + 44);
    *((_OWORD *)this + 21) = v17;
    long long v18 = *(_OWORD *)((char *)a2 + 360);
    *((void *)this + 47) = *((void *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v18;
    long long v19 = *((_OWORD *)a2 + 24);
    *((void *)this + 50) = *((void *)a2 + 50);
    *((_OWORD *)this + 24) = v19;
    long long v20 = *(_OWORD *)((char *)a2 + 408);
    *((void *)this + 53) = *((void *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v20;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  return this;
}

GPUTools::FD::CoreFunction *GPUTools::FD::CoreFunction::operator=(GPUTools::FD::CoreFunction *this, GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  if (this != a2)
  {
    long long v5 = (void *)*((void *)this + 56);
    if (v5) {
      free(v5);
    }
    *(void *)this = *(void *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((void *)this + 2) = *((void *)a2 + 2);
    long long v6 = *(_OWORD *)((char *)a2 + 24);
    *((void *)this + 5) = *((void *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v6;
    long long v7 = *((_OWORD *)a2 + 3);
    *((void *)this + 8) = *((void *)a2 + 8);
    *((_OWORD *)this + 3) = v7;
    long long v8 = *(_OWORD *)((char *)a2 + 72);
    *((void *)this + 11) = *((void *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v8;
    long long v9 = *((_OWORD *)a2 + 6);
    *((void *)this + 14) = *((void *)a2 + 14);
    *((_OWORD *)this + 6) = v9;
    long long v10 = *(_OWORD *)((char *)a2 + 120);
    *((void *)this + 17) = *((void *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v10;
    long long v11 = *((_OWORD *)a2 + 9);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((_OWORD *)this + 9) = v11;
    long long v12 = *(_OWORD *)((char *)a2 + 168);
    *((void *)this + 23) = *((void *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v12;
    long long v13 = *((_OWORD *)a2 + 12);
    *((void *)this + 26) = *((void *)a2 + 26);
    *((_OWORD *)this + 12) = v13;
    long long v14 = *(_OWORD *)((char *)a2 + 216);
    *((void *)this + 29) = *((void *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v14;
    long long v15 = *((_OWORD *)a2 + 15);
    *((void *)this + 32) = *((void *)a2 + 32);
    *((_OWORD *)this + 15) = v15;
    long long v16 = *(_OWORD *)((char *)a2 + 264);
    *((void *)this + 35) = *((void *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v16;
    long long v17 = *((_OWORD *)a2 + 18);
    *((void *)this + 38) = *((void *)a2 + 38);
    *((_OWORD *)this + 18) = v17;
    long long v18 = *(_OWORD *)((char *)a2 + 312);
    *((void *)this + 41) = *((void *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v18;
    long long v19 = *((_OWORD *)a2 + 21);
    *((void *)this + 44) = *((void *)a2 + 44);
    *((_OWORD *)this + 21) = v19;
    long long v20 = *(_OWORD *)((char *)a2 + 360);
    *((void *)this + 47) = *((void *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v20;
    long long v21 = *((_OWORD *)a2 + 24);
    *((void *)this + 50) = *((void *)a2 + 50);
    *((_OWORD *)this + 24) = v21;
    long long v22 = *(_OWORD *)((char *)a2 + 408);
    *((void *)this + 53) = *((void *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v22;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  return this;
}

__n128 GPUTools::FD::CoreFunction::CoreFunction(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 436) = 0;
  *(void *)(a1 + 448) = 0;
  if (a1 != a2)
  {
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(void *)a1 = *(void *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    long long v2 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v2;
    long long v3 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v3;
    long long v4 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v4;
    long long v5 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v5;
    long long v6 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v6;
    long long v7 = *(_OWORD *)(a2 + 144);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v7;
    long long v8 = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v8;
    long long v9 = *(_OWORD *)(a2 + 192);
    *(void *)(a1 + 208) = *(void *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v9;
    long long v10 = *(_OWORD *)(a2 + 216);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v10;
    long long v11 = *(_OWORD *)(a2 + 240);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v11;
    long long v12 = *(_OWORD *)(a2 + 264);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v12;
    long long v13 = *(_OWORD *)(a2 + 288);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v13;
    long long v14 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v14;
    long long v15 = *(_OWORD *)(a2 + 336);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v15;
    long long v16 = *(_OWORD *)(a2 + 360);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v16;
    long long v17 = *(_OWORD *)(a2 + 384);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v17;
    __n128 result = *(__n128 *)(a2 + 408);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(__n128 *)(a1 + 408) = result;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(void *)(a2 + 440) = 0;
    *(void *)(a2 + 448) = 0;
    *(void *)(a2 + 432) = 0;
  }
  return result;
}

{
  long long v2;
  long long v3;
  long long v4;
  long long v5;
  long long v6;
  long long v7;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  __n128 result;

  *(_DWORD *)(a1 + 436) = 0;
  *(void *)(a1 + 448) = 0;
  if (a1 != a2)
  {
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(void *)a1 = *(void *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    long long v2 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v2;
    long long v3 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v3;
    long long v4 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v4;
    long long v5 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v5;
    long long v6 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v6;
    long long v7 = *(_OWORD *)(a2 + 144);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v7;
    long long v8 = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v8;
    long long v9 = *(_OWORD *)(a2 + 192);
    *(void *)(a1 + 208) = *(void *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v9;
    long long v10 = *(_OWORD *)(a2 + 216);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v10;
    long long v11 = *(_OWORD *)(a2 + 240);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v11;
    long long v12 = *(_OWORD *)(a2 + 264);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v12;
    long long v13 = *(_OWORD *)(a2 + 288);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v13;
    long long v14 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v14;
    long long v15 = *(_OWORD *)(a2 + 336);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v15;
    long long v16 = *(_OWORD *)(a2 + 360);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v16;
    long long v17 = *(_OWORD *)(a2 + 384);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v17;
    __n128 result = *(__n128 *)(a2 + 408);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(__n128 *)(a1 + 408) = result;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(void *)(a2 + 440) = 0;
    *(void *)(a2 + 448) = 0;
    *(void *)(a2 + 432) = 0;
  }
  return result;
}

uint64_t GPUTools::FD::CoreFunction::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    long long v4 = *(void **)(a1 + 448);
    if (v4) {
      free(v4);
    }
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(void *)a1 = *(void *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    long long v5 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v5;
    long long v6 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v6;
    long long v7 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v7;
    long long v8 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v8;
    long long v9 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v9;
    long long v10 = *(_OWORD *)(a2 + 144);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v10;
    long long v11 = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v11;
    long long v12 = *(_OWORD *)(a2 + 192);
    *(void *)(a1 + 208) = *(void *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v12;
    long long v13 = *(_OWORD *)(a2 + 216);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v13;
    long long v14 = *(_OWORD *)(a2 + 240);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v14;
    long long v15 = *(_OWORD *)(a2 + 264);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v15;
    long long v16 = *(_OWORD *)(a2 + 288);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v16;
    long long v17 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v17;
    long long v18 = *(_OWORD *)(a2 + 336);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v18;
    long long v19 = *(_OWORD *)(a2 + 360);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v19;
    long long v20 = *(_OWORD *)(a2 + 384);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v20;
    long long v21 = *(_OWORD *)(a2 + 408);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(_OWORD *)(a1 + 408) = v21;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(void *)(a2 + 440) = 0;
    *(void *)(a2 + 448) = 0;
    *(void *)(a2 + 432) = 0;
  }
  return a1;
}

void GPUTools::FD::CoreFunction::~CoreFunction(GPUTools::FD::CoreFunction *this)
{
  int v1 = (void *)*((void *)this + 56);
  if (v1) {
    free(v1);
  }
}

{
  void *v1;

  int v1 = (void *)*((void *)this + 56);
  if (v1) {
    free(v1);
  }
}

double GPUTools::FD::Function::DoCommonCopyMove(GPUTools::FD::Function *this, Function *a2, const Function *a3)
{
  *(_OWORD *)((char *)this + 456) = *(_OWORD *)((char *)a2 + 456);
  *(_OWORD *)((char *)this + 472) = *(_OWORD *)((char *)a2 + 472);
  *((void *)this + 61) = *((void *)a2 + 61);
  uint64_t v3 = *((void *)a2 + 64);
  *((void *)this + 63) = *((void *)a2 + 63);
  *((void *)this + 64) = v3;
  double result = *((double *)a2 + 62);
  *((double *)this + 62) = result;
  *((void *)this + 66) = *((void *)a2 + 66);
  return result;
}

void *GPUTools::FD::Function::Relocate(void *this, GPUTools::FD::Function *a2, const GPUTools::FD::Function *a3)
{
  uint64_t v3 = *((unsigned int *)a2 + 108);
  unint64_t v5 = *((void *)a2 + 55);
  unint64_t v4 = *((void *)a2 + 56);
  unint64_t v22 = v3 + v5;
  long long v6 = &v23;
  unint64_t v7 = *((unsigned int *)a2 + 109) + v4;
  unint64_t v23 = v4;
  unint64_t v24 = v7;
  long long v8 = (void **)v25;
  long long v9 = (void **)v26;
  long long v10 = &v28;
  unsigned int v27 = v25;
  long long v28 = v26;
  unint64_t v11 = *((void *)a2 + 59);
  if (v11)
  {
    if (v5 <= v11 && v11 < v3 + v5)
    {
      long long v12 = &v21;
      long long v13 = v25;
      long long v14 = &v27;
LABEL_7:
      *(void *)long long v13 = this + 59;
      *v14 += 8;
      this[59] = v11 - *v12;
      goto LABEL_8;
    }
    if (v4 <= v11)
    {
      long long v13 = v26;
      long long v14 = &v28;
      long long v12 = &v23;
      if (v11 < v7) {
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  unint64_t v15 = *((void *)a2 + 61);
  if (!v15) {
    goto LABEL_15;
  }
  if (v21 <= v15 && v22 > v15)
  {
    long long v6 = &v21;
    long long v10 = &v27;
LABEL_14:
    *(void *)*long long v10 = this + 61;
    *v10 += 8;
    this[61] = v15 - *v6;
    goto LABEL_15;
  }
  if (v23 <= v15 && v24 > v15) {
    goto LABEL_14;
  }
LABEL_15:
  uint64_t v16 = (v3 + 15) & 0xFFFFFFF0;
  if (*((void *)a2 + 55) == *((void *)a2 + 56)) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = this[56];
  if (v25 != v27)
  {
    uint64_t v18 = this[55];
    do
    {
      long long v19 = *v8++;
      *v19 += v18;
    }
    while (v8 != (void **)v27);
  }
  if (v26 != v28)
  {
    do
    {
      long long v20 = *v9++;
      *v20 += v16 + v17;
    }
    while (v9 != (void **)v28);
  }
  return this;
}

GPUTools::FD::Function *GPUTools::FD::Function::Function(GPUTools::FD::Function *this)
{
  *(void *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  bzero((char *)this + 16, 0x208uLL);
  return this;
}

{
  *(void *)this = 0xFFFFFFFFLL;
  *((_WORD *)this + 5) = 0;
  bzero((char *)this + 16, 0x208uLL);
  return this;
}

GPUTools::FD::Function *GPUTools::FD::Function::Function(GPUTools::FD::Function *this, const GPUTools::FD::Function *a2, const GPUTools::FD::CoreFunction *a3)
{
  *((_DWORD *)this + 109) = 0;
  *((void *)this + 56) = 0;
  if (this != a2)
  {
    *(void *)this = *(void *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((void *)this + 2) = *((void *)a2 + 2);
    long long v5 = *(_OWORD *)((char *)a2 + 24);
    *((void *)this + 5) = *((void *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v5;
    long long v6 = *((_OWORD *)a2 + 3);
    *((void *)this + 8) = *((void *)a2 + 8);
    *((_OWORD *)this + 3) = v6;
    long long v7 = *(_OWORD *)((char *)a2 + 72);
    *((void *)this + 11) = *((void *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v7;
    long long v8 = *((_OWORD *)a2 + 6);
    *((void *)this + 14) = *((void *)a2 + 14);
    *((_OWORD *)this + 6) = v8;
    long long v9 = *(_OWORD *)((char *)a2 + 120);
    *((void *)this + 17) = *((void *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v9;
    long long v10 = *((_OWORD *)a2 + 9);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((_OWORD *)this + 9) = v10;
    long long v11 = *(_OWORD *)((char *)a2 + 168);
    *((void *)this + 23) = *((void *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v11;
    long long v12 = *((_OWORD *)a2 + 12);
    *((void *)this + 26) = *((void *)a2 + 26);
    *((_OWORD *)this + 12) = v12;
    long long v13 = *(_OWORD *)((char *)a2 + 216);
    *((void *)this + 29) = *((void *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v13;
    long long v14 = *((_OWORD *)a2 + 15);
    *((void *)this + 32) = *((void *)a2 + 32);
    *((_OWORD *)this + 15) = v14;
    long long v15 = *(_OWORD *)((char *)a2 + 264);
    *((void *)this + 35) = *((void *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v15;
    long long v16 = *((_OWORD *)a2 + 18);
    *((void *)this + 38) = *((void *)a2 + 38);
    *((_OWORD *)this + 18) = v16;
    long long v17 = *(_OWORD *)((char *)a2 + 312);
    *((void *)this + 41) = *((void *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v17;
    long long v18 = *((_OWORD *)a2 + 21);
    *((void *)this + 44) = *((void *)a2 + 44);
    *((_OWORD *)this + 21) = v18;
    long long v19 = *(_OWORD *)((char *)a2 + 360);
    *((void *)this + 47) = *((void *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v19;
    long long v20 = *((_OWORD *)a2 + 24);
    *((void *)this + 50) = *((void *)a2 + 50);
    *((_OWORD *)this + 24) = v20;
    long long v21 = *(_OWORD *)((char *)a2 + 408);
    *((void *)this + 53) = *((void *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v21;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
  }
  if (*((void *)a2 + 65)) {
    operator new();
  }
  *((void *)this + 65) = 0;
  *(_OWORD *)((char *)this + 456) = *(_OWORD *)((char *)a2 + 456);
  *((void *)this + 59) = *((void *)a2 + 59);
  *((_DWORD *)this + 120) = *((_DWORD *)a2 + 120);
  *((_DWORD *)this + 121) = *((_DWORD *)a2 + 121);
  *((void *)this + 61) = *((void *)a2 + 61);
  uint64_t v22 = *((void *)a2 + 64);
  *((void *)this + 63) = *((void *)a2 + 63);
  *((void *)this + 64) = v22;
  *((void *)this + 62) = *((void *)a2 + 62);
  *((void *)this + 66) = *((void *)a2 + 66);
  GPUTools::FD::Function::Relocate(this, a2, a3);
  return this;
}

void sub_24F673984(_Unwind_Exception *a1)
{
  MEMORY[0x253360DD0](v2, 0x10B0C40F47DA5FCLL);
  unint64_t v4 = *(void **)(v1 + 448);
  if (!v4) {
    _Unwind_Resume(a1);
  }
  free(v4);
  _Unwind_Resume(a1);
}

double GPUTools::FD::Function::Function(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 436) = 0;
  *(void *)(a1 + 448) = 0;
  if (a1 != a2)
  {
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(void *)a1 = *(void *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    long long v2 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v2;
    long long v3 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v3;
    long long v4 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v4;
    long long v5 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v5;
    long long v6 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v6;
    long long v7 = *(_OWORD *)(a2 + 144);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v7;
    long long v8 = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v8;
    long long v9 = *(_OWORD *)(a2 + 192);
    *(void *)(a1 + 208) = *(void *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v9;
    long long v10 = *(_OWORD *)(a2 + 216);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v10;
    long long v11 = *(_OWORD *)(a2 + 240);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v11;
    long long v12 = *(_OWORD *)(a2 + 264);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v12;
    long long v13 = *(_OWORD *)(a2 + 288);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v13;
    long long v14 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v14;
    long long v15 = *(_OWORD *)(a2 + 336);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v15;
    long long v16 = *(_OWORD *)(a2 + 360);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v16;
    long long v17 = *(_OWORD *)(a2 + 384);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v17;
    long long v18 = *(_OWORD *)(a2 + 408);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(_OWORD *)(a1 + 408) = v18;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(void *)(a2 + 440) = 0;
    *(void *)(a2 + 448) = 0;
    *(void *)(a2 + 432) = 0;
  }
  *(void *)(a1 + 520) = *(void *)(a2 + 520);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(void *)(a1 + 472) = *(void *)(a2 + 472);
  *(_DWORD *)(a1 + 480) = *(_DWORD *)(a2 + 480);
  *(_DWORD *)(a1 + 484) = *(_DWORD *)(a2 + 484);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  uint64_t v19 = *(void *)(a2 + 512);
  *(void *)(a1 + 504) = *(void *)(a2 + 504);
  *(void *)(a1 + 512) = v19;
  double result = *(double *)(a2 + 496);
  *(double *)(a1 + 496) = result;
  *(void *)(a1 + 528) = *(void *)(a2 + 528);
  *(void *)(a2 + 520) = 0;
  return result;
}

GPUTools::FD::CoreFunction *GPUTools::FD::Function::operator=(GPUTools::FD::CoreFunction *this, GPUTools::FD::CoreFunction *a2, const GPUTools::FD::CoreFunction *a3)
{
  if (this != a2)
  {
    long long v5 = (void *)*((void *)this + 56);
    if (v5) {
      free(v5);
    }
    *(void *)this = *(void *)a2;
    *((_WORD *)this + 5) = *((_WORD *)a2 + 5);
    *((void *)this + 2) = *((void *)a2 + 2);
    long long v6 = *(_OWORD *)((char *)a2 + 24);
    *((void *)this + 5) = *((void *)a2 + 5);
    *(_OWORD *)((char *)this + 24) = v6;
    long long v7 = *((_OWORD *)a2 + 3);
    *((void *)this + 8) = *((void *)a2 + 8);
    *((_OWORD *)this + 3) = v7;
    long long v8 = *(_OWORD *)((char *)a2 + 72);
    *((void *)this + 11) = *((void *)a2 + 11);
    *(_OWORD *)((char *)this + 72) = v8;
    long long v9 = *((_OWORD *)a2 + 6);
    *((void *)this + 14) = *((void *)a2 + 14);
    *((_OWORD *)this + 6) = v9;
    long long v10 = *(_OWORD *)((char *)a2 + 120);
    *((void *)this + 17) = *((void *)a2 + 17);
    *(_OWORD *)((char *)this + 120) = v10;
    long long v11 = *((_OWORD *)a2 + 9);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((_OWORD *)this + 9) = v11;
    long long v12 = *(_OWORD *)((char *)a2 + 168);
    *((void *)this + 23) = *((void *)a2 + 23);
    *(_OWORD *)((char *)this + 168) = v12;
    long long v13 = *((_OWORD *)a2 + 12);
    *((void *)this + 26) = *((void *)a2 + 26);
    *((_OWORD *)this + 12) = v13;
    long long v14 = *(_OWORD *)((char *)a2 + 216);
    *((void *)this + 29) = *((void *)a2 + 29);
    *(_OWORD *)((char *)this + 216) = v14;
    long long v15 = *((_OWORD *)a2 + 15);
    *((void *)this + 32) = *((void *)a2 + 32);
    *((_OWORD *)this + 15) = v15;
    long long v16 = *(_OWORD *)((char *)a2 + 264);
    *((void *)this + 35) = *((void *)a2 + 35);
    *(_OWORD *)((char *)this + 264) = v16;
    long long v17 = *((_OWORD *)a2 + 18);
    *((void *)this + 38) = *((void *)a2 + 38);
    *((_OWORD *)this + 18) = v17;
    long long v18 = *(_OWORD *)((char *)a2 + 312);
    *((void *)this + 41) = *((void *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v18;
    long long v19 = *((_OWORD *)a2 + 21);
    *((void *)this + 44) = *((void *)a2 + 44);
    *((_OWORD *)this + 21) = v19;
    long long v20 = *(_OWORD *)((char *)a2 + 360);
    *((void *)this + 47) = *((void *)a2 + 47);
    *(_OWORD *)((char *)this + 360) = v20;
    long long v21 = *((_OWORD *)a2 + 24);
    *((void *)this + 50) = *((void *)a2 + 50);
    *((_OWORD *)this + 24) = v21;
    long long v22 = *(_OWORD *)((char *)a2 + 408);
    *((void *)this + 53) = *((void *)a2 + 53);
    *(_OWORD *)((char *)this + 408) = v22;
    *((_DWORD *)this + 108) = *((_DWORD *)a2 + 108);
    GPUTools::FD::CoreFunction::Relocate(this, a2, a3);
    unint64_t v24 = (GPUTools::FD::Function *)*((void *)this + 65);
    if (v24)
    {
      GPUTools::FD::Function::~Function(v24);
      MEMORY[0x253360DD0]();
    }
    if (*((void *)a2 + 65)) {
      operator new();
    }
    *((void *)this + 65) = 0;
    *(_OWORD *)((char *)this + 456) = *(_OWORD *)((char *)a2 + 456);
    *((void *)this + 59) = *((void *)a2 + 59);
    *((_DWORD *)this + 120) = *((_DWORD *)a2 + 120);
    *((_DWORD *)this + 121) = *((_DWORD *)a2 + 121);
    *((void *)this + 61) = *((void *)a2 + 61);
    uint64_t v25 = *((void *)a2 + 64);
    *((void *)this + 63) = *((void *)a2 + 63);
    *((void *)this + 64) = v25;
    *((void *)this + 62) = *((void *)a2 + 62);
    *((void *)this + 66) = *((void *)a2 + 66);
    GPUTools::FD::Function::Relocate(this, a2, v23);
  }
  return this;
}

void sub_24F673DFC(_Unwind_Exception *a1)
{
  MEMORY[0x253360DD0](v1, 0x10B0C40F47DA5FCLL);
  _Unwind_Resume(a1);
}

void GPUTools::FD::Function::~Function(GPUTools::FD::Function *this)
{
  long long v2 = (GPUTools::FD::Function *)*((void *)this + 65);
  if (!v2)
  {
    long long v3 = (void *)*((void *)this + 56);
    if (!v3) {
      return;
    }
LABEL_5:
    free(v3);
    return;
  }
  GPUTools::FD::Function::~Function(v2);
  MEMORY[0x253360DD0]();
  long long v3 = (void *)*((void *)this + 56);
  if (v3) {
    goto LABEL_5;
  }
}

{
  GPUTools::FD::Function *v2;
  void *v3;

  long long v2 = (GPUTools::FD::Function *)*((void *)this + 65);
  if (!v2)
  {
    long long v3 = (void *)*((void *)this + 56);
    if (!v3) {
      return;
    }
LABEL_5:
    free(v3);
    return;
  }
  GPUTools::FD::Function::~Function(v2);
  MEMORY[0x253360DD0]();
  long long v3 = (void *)*((void *)this + 56);
  if (v3) {
    goto LABEL_5;
  }
}

uint64_t GPUTools::FD::Function::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    long long v4 = *(void **)(a1 + 448);
    if (v4) {
      free(v4);
    }
    *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
    *(_DWORD *)(a1 + 436) = *(_DWORD *)(a2 + 436);
    *(void *)a1 = *(void *)a2;
    *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    long long v5 = *(_OWORD *)(a2 + 24);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = v5;
    long long v6 = *(_OWORD *)(a2 + 48);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(_OWORD *)(a1 + 48) = v6;
    long long v7 = *(_OWORD *)(a2 + 72);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_OWORD *)(a1 + 72) = v7;
    long long v8 = *(_OWORD *)(a2 + 96);
    *(void *)(a1 + 112) = *(void *)(a2 + 112);
    *(_OWORD *)(a1 + 96) = v8;
    long long v9 = *(_OWORD *)(a2 + 120);
    *(void *)(a1 + 136) = *(void *)(a2 + 136);
    *(_OWORD *)(a1 + 120) = v9;
    long long v10 = *(_OWORD *)(a2 + 144);
    *(void *)(a1 + 160) = *(void *)(a2 + 160);
    *(_OWORD *)(a1 + 144) = v10;
    long long v11 = *(_OWORD *)(a2 + 168);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(_OWORD *)(a1 + 168) = v11;
    long long v12 = *(_OWORD *)(a2 + 192);
    *(void *)(a1 + 208) = *(void *)(a2 + 208);
    *(_OWORD *)(a1 + 192) = v12;
    long long v13 = *(_OWORD *)(a2 + 216);
    *(void *)(a1 + 232) = *(void *)(a2 + 232);
    *(_OWORD *)(a1 + 216) = v13;
    long long v14 = *(_OWORD *)(a2 + 240);
    *(void *)(a1 + 256) = *(void *)(a2 + 256);
    *(_OWORD *)(a1 + 240) = v14;
    long long v15 = *(_OWORD *)(a2 + 264);
    *(void *)(a1 + 280) = *(void *)(a2 + 280);
    *(_OWORD *)(a1 + 264) = v15;
    long long v16 = *(_OWORD *)(a2 + 288);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v16;
    long long v17 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v17;
    long long v18 = *(_OWORD *)(a2 + 336);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v18;
    long long v19 = *(_OWORD *)(a2 + 360);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(_OWORD *)(a1 + 360) = v19;
    long long v20 = *(_OWORD *)(a2 + 384);
    *(void *)(a1 + 400) = *(void *)(a2 + 400);
    *(_OWORD *)(a1 + 384) = v20;
    long long v21 = *(_OWORD *)(a2 + 408);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(_OWORD *)(a1 + 408) = v21;
    *(_DWORD *)(a1 + 432) = *(_DWORD *)(a2 + 432);
    *(_DWORD *)a2 = -1;
    *(void *)(a2 + 440) = 0;
    *(void *)(a2 + 448) = 0;
    *(void *)(a2 + 432) = 0;
    long long v22 = *(GPUTools::FD::Function **)(a1 + 520);
    if (v22)
    {
      GPUTools::FD::Function::~Function(v22);
      MEMORY[0x253360DD0]();
    }
    *(void *)(a1 + 520) = *(void *)(a2 + 520);
    *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
    *(void *)(a1 + 472) = *(void *)(a2 + 472);
    *(_DWORD *)(a1 + 480) = *(_DWORD *)(a2 + 480);
    *(_DWORD *)(a1 + 484) = *(_DWORD *)(a2 + 484);
    *(void *)(a1 + 488) = *(void *)(a2 + 488);
    uint64_t v23 = *(void *)(a2 + 512);
    *(void *)(a1 + 504) = *(void *)(a2 + 504);
    *(void *)(a1 + 512) = v23;
    *(void *)(a1 + 496) = *(void *)(a2 + 496);
    *(void *)(a1 + 528) = *(void *)(a2 + 528);
    *(void *)(a2 + 520) = 0;
  }
  return a1;
}

void GTFunctionDecoder::GTFunctionDecoder(GTFunctionDecoder *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = malloc_type_malloc(0x100uLL, 0x10C004028F705ECuLL);
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = malloc_type_malloc(0x100uLL, 0x10C004028F705ECuLL);
}

void GTFunctionDecoder::~GTFunctionDecoder(void **this)
{
}

{
  free(*this);
  free(this[2]);
}

uint64_t GTFunctionDecoder::_push(GTFunctionDecoder *this)
{
  int v2 = *((_DWORD *)this + 2);
  int v3 = *((_DWORD *)this + 3);
  long long v4 = *(void **)this;
  if (v2 == v3)
  {
    if (v2 >= 1) {
      unsigned int v5 = 2 * v2;
    }
    else {
      unsigned int v5 = 32;
    }
    *((_DWORD *)this + 3) = v5;
    long long v4 = malloc_type_realloc(v4, 536 * v5, 0x10B0040F47DA5FCuLL);
    *(void *)this = v4;
    int v2 = *((_DWORD *)this + 2);
  }
  *((_DWORD *)this + 2) = v2 + 1;
  return (uint64_t)v4 + 536 * v2;
}

void GTFunctionDecoder::_decode(_DWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v21 = 0;
  uint64_t v7 = a2 + 36;
  unint64_t v8 = a4;
  FBDecoder_DecodeArguments((unsigned int *)&v21, a2 + 36, (*(_DWORD *)a2 - 36), a3, a4);
  bzero(a1, 0x218uLL);
  *(_OWORD *)(a1 + 114) = *(_OWORD *)(a2 + 16);
  *((void *)a1 + 64) = *(void *)(a2 + 8);
  *((void *)a1 + 55) = a2;
  int v9 = *(_DWORD *)(a2 + 4);
  a1[108] = *(_DWORD *)a2;
  int v10 = *(_DWORD *)(a2 + 32);
  *a1 = v9;
  a1[1] = v10;
  uint64_t v11 = HIDWORD(v21);
  *((_WORD *)a1 + 5) = WORD2(v21);
  if (v11)
  {
    if (*(unsigned char *)(a3 + 10) == 67) {
      uint64_t v12 = **(void **)a3;
    }
    else {
      uint64_t v12 = 0;
    }
    *((void *)a1 + 2) = v12;
    long long v13 = a1 + 12;
    long long v14 = (char *)(a3 + 11);
    do
    {
      *(void *)long long v13 = *(void *)(v14 - 11);
      int v15 = *(v14 - 1);
      v13[2] = core_type(*(v14 - 1));
      *(void *)(v13 + 3) = sem_type(v15);
      *((_WORD *)v13 + 10) = *(_WORD *)(v14 - 3);
      char v16 = *v14;
      v14 += 16;
      __int16 v17 = v16 & 1;
      if (v15 == 85) {
        __int16 v18 = v17 | 8;
      }
      else {
        __int16 v18 = v17;
      }
      *((_WORD *)v13 + 11) = v18;
      v13 += 6;
      --v11;
    }
    while (v11);
  }
  else
  {
    *((void *)a1 + 2) = 0;
  }
  if (*(unsigned char *)(a2 + 32))
  {
    HIDWORD(v21) = 0;
    FBDecoder_DecodeArguments((unsigned int *)&v21, v7, (*(_DWORD *)a2 - 36), a3, v8);
    *((void *)a1 + 3) = *(void *)a3;
    int v19 = *(unsigned __int8 *)(a3 + 10);
    a1[8] = core_type(*(unsigned char *)(a3 + 10));
    *(void *)(a1 + 9) = sem_type(v19);
    *((_WORD *)a1 + 22) = *(_WORD *)(a3 + 8);
    if (v19 == 85) {
      __int16 v20 = *(unsigned char *)(a3 + 11) & 1 | 8;
    }
    else {
      __int16 v20 = *(unsigned char *)(a3 + 11) & 1;
    }
    *((_WORD *)a1 + 23) = v20;
  }
}

uint64_t core_type(char a1)
{
  int v1 = a1 - 67;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
    case 45:
    case 52:
      uint64_t result = 7;
      break;
    case 16:
    case 18:
      uint64_t result = 13;
      break;
    case 31:
      return result;
    case 33:
      uint64_t result = 10;
      break;
    case 35:
      uint64_t result = 9;
      break;
    case 38:
      uint64_t result = 5;
      break;
    case 41:
    case 49:
      uint64_t result = 11;
      break;
    case 48:
      uint64_t result = 3;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sem_type(char a1)
{
  int v1 = a1 - 67;
  uint64_t result = 1;
  switch(v1)
  {
    case 0:
      uint64_t result = 15;
      break;
    case 16:
      uint64_t result = 14;
      break;
    case 31:
      return result;
    case 33:
      uint64_t result = 10;
      break;
    case 35:
      uint64_t result = 9;
      break;
    case 38:
      uint64_t result = 5;
      break;
    case 41:
      uint64_t result = 11;
      break;
    case 45:
    case 49:
      uint64_t result = 13;
      break;
    case 48:
      uint64_t result = 3;
      break;
    case 52:
      uint64_t result = 7;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void *GTFunctionDecoder::Decode(uint64_t a1, unsigned int *a2)
{
  *(_DWORD *)(a1 + 8) = 0;
  int v4 = *(_DWORD *)(a1 + 12);
  unsigned int v5 = *(void **)a1;
  if (v4)
  {
    int v6 = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 12) = 32;
    unsigned int v5 = malloc_type_realloc(v5, 0x4300uLL, 0x10B0040F47DA5FCuLL);
    *(void *)a1 = v5;
    int v6 = *(_DWORD *)(a1 + 8);
  }
  *(_DWORD *)(a1 + 8) = v6 + 1;
  GTFunctionDecoder::_decode(&v5[67 * v6], (uint64_t)a2, *(void *)(a1 + 16), 16);
  if ((*((unsigned char *)a2 + 33) & 0x10) != 0)
  {
    do
    {
      uint64_t v10 = *a2;
      int v11 = *(_DWORD *)(a1 + 8);
      uint64_t v12 = *(void **)a1;
      if (v11 == *(_DWORD *)(a1 + 12))
      {
        if (v11 >= 1) {
          unsigned int v13 = 2 * v11;
        }
        else {
          unsigned int v13 = 32;
        }
        *(_DWORD *)(a1 + 12) = v13;
        uint64_t v12 = malloc_type_realloc(v12, 536 * v13, 0x10B0040F47DA5FCuLL);
        *(void *)a1 = v12;
        int v11 = *(_DWORD *)(a1 + 8);
      }
      a2 = (unsigned int *)((char *)a2 + v10);
      *(_DWORD *)(a1 + 8) = v11 + 1;
      GTFunctionDecoder::_decode(&v12[67 * v11], (uint64_t)a2, *(void *)(a1 + 16), 16);
    }
    while ((*((unsigned char *)a2 + 33) & 0x20) == 0);
  }
  uint64_t v7 = *(unsigned int *)(a1 + 8);
  uint64_t result = *(void **)a1;
  if ((int)v7 >= 2)
  {
    if (v7 == 2)
    {
      uint64_t v9 = 1;
LABEL_18:
      char v16 = (char *)&result[67 * v9];
      uint64_t v17 = v7 - v9;
      do
      {
        *((void *)v16 - 2) = v16;
        v16 += 536;
        --v17;
      }
      while (v17);
      goto LABEL_20;
    }
    uint64_t v9 = (v7 - 1) | 1;
    long long v14 = (char *)(result + 67);
    unint64_t v15 = (v7 - 1) & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *((void *)v14 - 2) = v14;
      *((void *)v14 + 65) = v14 + 536;
      v14 += 1072;
      v15 -= 2;
    }
    while (v15);
    if (v7 - 1 != ((v7 - 1) & 0xFFFFFFFFFFFFFFFELL)) {
      goto LABEL_18;
    }
  }
LABEL_20:
  result[67 * (int)v7 - 2] = 0;
  return result;
}

void sub_24F674918(_Unwind_Exception *a1)
{
  MEMORY[0x253360DD0](v1, 0x10A0C408EF24B1CLL);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<long long,objc_object  {objcproto8NSObject}*>::unordered_map(uint64_t a1, size_t __n)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (__n == 1)
  {
    size_t prime = 2;
LABEL_17:
    std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__do_rehash<true>(a1, prime);
    return a1;
  }
  size_t prime = __n;
  if ((__n & (__n - 1)) != 0)
  {
    size_t prime = std::__next_prime(__n);
    int8x8_t v4 = *(int8x8_t *)(a1 + 8);
    BOOL v5 = prime >= *(void *)&v4;
    if (prime > *(void *)&v4) {
      goto LABEL_17;
    }
  }
  else
  {
    int8x8_t v4 = 0;
    BOOL v5 = 1;
    if (__n) {
      goto LABEL_17;
    }
  }
  if (!v5)
  {
    unint64_t v6 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v7 = (uint8x8_t)vcnt_s8(v4), v7.i16[0] = vaddlv_u8(v7), v7.u32[0] > 1uLL))
    {
      unint64_t v6 = std::__next_prime(v6);
    }
    else
    {
      uint64_t v8 = 1 << -(char)__clz(v6 - 1);
      if (v6 >= 2) {
        unint64_t v6 = v8;
      }
    }
    if (prime <= v6) {
      size_t prime = v6;
    }
    if (prime < *(void *)&v4) {
      goto LABEL_17;
    }
  }
  return a1;
}

void sub_24F67539C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::~__hash_table(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      operator delete(v2);
      int v2 = v3;
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

void std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    unint64_t v15 = *(void **)a1;
    *(void *)a1 = 0;
    if (v15) {
      operator delete(v15);
    }
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  int8x8_t v4 = operator new(8 * a2);
  BOOL v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = 0;
  *(void *)(a1 + 8) = a2;
  do
    *(void *)(*(void *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  uint64_t v8 = a1 + 16;
  uint8x8_t v7 = *(void **)(a1 + 16);
  if (v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      uint64_t v11 = v9 & v10;
      *(void *)(*(void *)a1 + 8 * v11) = v8;
      while (1)
      {
        uint64_t v12 = (void *)*v7;
        if (!*v7) {
          break;
        }
        uint64_t v13 = v12[1] & v10;
        if (v13 == v11)
        {
          uint8x8_t v7 = (void *)*v7;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          void *v7 = *v12;
          uint64_t v14 = 8 * v13;
          void *v12 = **(void **)(*(void *)a1 + v14);
          **(void **)(*(void *)a1 + v14) = v12;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          uint8x8_t v7 = v12;
          uint64_t v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2) {
      v9 %= a2;
    }
    *(void *)(*(void *)a1 + 8 * v9) = v8;
    char v16 = (void *)*v7;
    if (*v7)
    {
      while (1)
      {
        unint64_t v18 = v16[1];
        if (v18 >= a2) {
          v18 %= a2;
        }
        if (v18 == v9) {
          goto LABEL_25;
        }
        if (*(void *)(*(void *)a1 + 8 * v18))
        {
          void *v7 = *v16;
          uint64_t v17 = 8 * v18;
          void *v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          char v16 = v7;
LABEL_25:
          uint8x8_t v7 = v16;
          char v16 = (void *)*v16;
          if (!v16) {
            return;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v18) = v7;
          uint8x8_t v7 = v16;
          char v16 = (void *)*v16;
          unint64_t v9 = v18;
          if (!v16) {
            return;
          }
        }
      }
    }
  }
}

void *std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__emplace_unique_key_args<long long,std::pair<long long const,objc_object  {objcproto8NSObject}>>(uint64_t a1, unint64_t *a2, _OWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    unint64_t v9 = *(void **)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = (void *)*v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v12 = v10[1];
            if (v12 == v6)
            {
              if (v10[2] == v6) {
                return v10;
              }
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            unint64_t v10 = (void *)*v10;
            if (!v10) {
              goto LABEL_23;
            }
          }
        }
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6) {
              return v10;
            }
          }
          else
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
            if (v11 != v3) {
              break;
            }
          }
          unint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  uint64_t v14 = operator new(0x20uLL);
  void *v14 = 0;
  v14[1] = v6;
  *((_OWORD *)v14 + 1) = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (v7 && (float)(v16 * (float)v7) >= v15)
  {
    uint64_t v17 = *(void *)a1;
    unint64_t v18 = *(void **)(*(void *)a1 + 8 * v3);
    if (v18)
    {
LABEL_26:
      void *v14 = *v18;
LABEL_61:
      void *v18 = v14;
      goto LABEL_62;
    }
  }
  else
  {
    BOOL v19 = 1;
    if (v7 >= 3) {
      BOOL v19 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v7);
    unint64_t v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21) {
      size_t prime = v21;
    }
    else {
      size_t prime = v20;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v7 = *(void *)(a1 + 8);
    }
    if (prime > v7) {
      goto LABEL_37;
    }
    if (prime < v7)
    {
      unint64_t v23 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (uint8x8_t v24 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
      {
        unint64_t v23 = std::__next_prime(v23);
      }
      else
      {
        uint64_t v25 = 1 << -(char)__clz(v23 - 1);
        if (v23 >= 2) {
          unint64_t v23 = v25;
        }
      }
      if (prime <= v23) {
        size_t prime = v23;
      }
      if (prime < v7) {
LABEL_37:
      }
        std::__hash_table<std::__hash_value_type<long long,objc_object  {objcproto8NSObject}*>,std::__unordered_map_hasher<long long,objc_object  {objcproto8NSObject}*,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,objc_object  {objcproto8NSObject}*,std::equal_to,std::hash,true>,std::allocator<objc_object  {objcproto8NSObject}*>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v7 = *(void *)(a1 + 8);
    unint64_t v26 = v7 - 1;
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
      {
        unint64_t v3 = v6 % v7;
        uint64_t v17 = *(void *)a1;
        unint64_t v18 = *(void **)(*(void *)a1 + 8 * (v6 % v7));
        if (v18) {
          goto LABEL_26;
        }
      }
      else
      {
        unint64_t v3 = v6;
        uint64_t v17 = *(void *)a1;
        unint64_t v18 = *(void **)(*(void *)a1 + 8 * v6);
        if (v18) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      unint64_t v3 = v26 & v6;
      uint64_t v17 = *(void *)a1;
      unint64_t v18 = *(void **)(*(void *)a1 + 8 * (v26 & v6));
      if (v18) {
        goto LABEL_26;
      }
    }
  }
  void *v14 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v14;
  *(void *)(v17 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    unint64_t v27 = *(void *)(*v14 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v27 >= v7) {
        v27 %= v7;
      }
    }
    else
    {
      v27 &= v7 - 1;
    }
    unint64_t v18 = (void *)(*(void *)a1 + 8 * v27);
    goto LABEL_61;
  }
LABEL_62:
  ++*(void *)(a1 + 24);
  return v14;
}

void sub_24F6758BC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t GPUTools::VMBuffer::round_size(unint64_t this)
{
  if (3 * *MEMORY[0x263EF8AF8] <= this) {
    return (this + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  }
  else {
    return 3 * *MEMORY[0x263EF8AF8];
  }
}

GPUTools::VMBuffer *GPUTools::VMBuffer::VMBuffer(GPUTools::VMBuffer *this, unint64_t a2, uint64_t a3)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 1;
  GPUTools::VMBuffer::_dealloc(this);
  GPUTools::VMBuffer::_alloc(this, a2, a3);
  return this;
}

{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 1;
  GPUTools::VMBuffer::_dealloc(this);
  GPUTools::VMBuffer::_alloc(this, a2, a3);
  return this;
}

uint64_t GPUTools::VMBuffer::alloc(GPUTools::VMBuffer *this, unint64_t a2, uint64_t a3)
{
  GPUTools::VMBuffer::_dealloc(this);

  return GPUTools::VMBuffer::_alloc(this, a2, a3);
}

void GPUTools::VMBuffer::~VMBuffer(GPUTools::VMBuffer *this)
{
}

{
  GPUTools::VMBuffer::_dealloc(this);
}

void *GPUTools::VMBuffer::_dealloc(void *this)
{
  if (*this)
  {
    uint64_t v1 = this;
    this = (void *)MEMORY[0x253361B90](*MEMORY[0x263EF8960], *this, *MEMORY[0x263EF8AF8] + this[1] + this[1] * this[2]);
    v1[1] = 0;
    v1[2] = 0;
    *uint64_t v1 = 0;
  }
  return this;
}

GPUTools::VMBuffer *GPUTools::VMBuffer::operator=(GPUTools::VMBuffer *this, uint64_t a2)
{
  if (this != (GPUTools::VMBuffer *)a2)
  {
    GPUTools::VMBuffer::_dealloc(this);
    *(_OWORD *)this = *(_OWORD *)a2;
    *((_OWORD *)this + 1) = *(_OWORD *)(a2 + 16);
    *((_OWORD *)this + 2) = *(_OWORD *)(a2 + 32);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  return this;
}

uint64_t GPUTools::VMBuffer::_alloc(GPUTools::VMBuffer *this, unint64_t a2, uint64_t a3)
{
  char v3 = (char)this;
  int v4 = 0;
  vm_address_t address = 0;
  BOOL v5 = (void *)MEMORY[0x263EF8AF8];
  if (3 * *MEMORY[0x263EF8AF8] <= a2) {
    vm_size_t v6 = (a2 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  }
  else {
    vm_size_t v6 = 3 * *MEMORY[0x263EF8AF8];
  }
  vm_size_t v7 = v6 + v6 * a3;
  uint8x8_t v8 = (vm_map_t *)MEMORY[0x263EF8960];
  do
  {
    uint64_t v9 = *v8;
    vm_size_t v10 = *v5 + v7;
    mach_error_t v11 = vm_allocate(*v8, &address, v10, 1);
    if (!v11)
    {
      vm_address_t v12 = address;
      target_vm_address_t address = address + v6;
      uint64_t v13 = a3;
      if (a3)
      {
        while (1)
        {
          mach_error_t v11 = MEMORY[0x253361B90](v9);
          if (v11) {
            break;
          }
          uint64_t cur_protection = 0;
          mach_error_t v11 = vm_remap(v9, &target_address, v6, 0, 0, v9, address, 0, (vm_prot_t *)&cur_protection + 1, (vm_prot_t *)&cur_protection, 2u);
          if (v11) {
            break;
          }
          target_address += v6;
          if (!--v13)
          {
            vm_address_t v12 = address;
            goto LABEL_11;
          }
        }
        char v3 = (char)this;
        uint8x8_t v8 = (vm_map_t *)MEMORY[0x263EF8960];
      }
      else
      {
LABEL_11:
        mach_error_t v11 = MEMORY[0x253361BB0](v9, v12 + v10 - *v5, *v5, 0, 0);
        char v3 = (char)this;
        uint8x8_t v8 = (vm_map_t *)MEMORY[0x263EF8960];
        if (!v11)
        {
          *(void *)this = address;
          *((void *)this + 1) = v6;
          *((void *)this + 2) = a3;
          return 1;
        }
      }
    }
    mach_error_string(v11);
    DYLog(3, "<VMBuffer: %p> allocation failed: %s", v14, v15, v16, v17, v18, v19, v3);
    MEMORY[0x253361B90](*v8, address, *v5 + v7);
    ++v4;
  }
  while (v4 != 5);
  return 0;
}

uint64_t GPUTools::VMBuffer::resize(GPUTools::VMBuffer *this, unint64_t a2)
{
  vm_address_t v3 = *(void *)this;
  vm_size_t v4 = *((void *)this + 1);
  uint64_t v5 = *((void *)this + 2);
  uint64_t result = GPUTools::VMBuffer::_alloc(this, a2, v5);
  if (result)
  {
    if (v4 >= *((void *)this + 1)) {
      vm_size_t v7 = *((void *)this + 1);
    }
    else {
      vm_size_t v7 = v4;
    }
    uint8x8_t v8 = (unsigned int *)MEMORY[0x263EF8960];
    mach_error_t v9 = vm_copy(*MEMORY[0x263EF8960], v3, v7, *(void *)this);
    if (v9)
    {
      mach_error_string(v9);
      DYLog(3, "<VMBuffer: %p> vm_copy failed: %s", v10, v11, v12, v13, v14, v15, (char)this);
      GPUTools::VMBuffer::_dealloc(this);
      return 0;
    }
    else
    {
      MEMORY[0x253361B90](*v8, v3, *MEMORY[0x263EF8AF8] + v4 + v4 * v5);
      return 1;
    }
  }
  return result;
}

BOOL GPUTools::VMBuffer::protect_readonly(GPUTools::VMBuffer *this)
{
  return MEMORY[0x253361BB0](*MEMORY[0x263EF8960], *(void *)this, *((void *)this + 2) * *((void *)this + 1), 0, 1) == 0;
}

const char *dy_fenum_to_function_name_nsstring(int a1, __int16 a2, int a3)
{
  uint64_t result = dy_fenum_to_function_name(a1, a2, a3);
  if (result)
  {
    vm_size_t v4 = (void *)[[NSString alloc] initWithBytesNoCopy:result length:strlen(result) encoding:1 freeWhenDone:0];
    return (const char *)v4;
  }
  return result;
}

void *GPUTools::FB::VAListArgumentProvider::VAListArgumentProvider(void *this, char *a2)
{
  *this = &unk_2700E6028;
  this[1] = a2;
  return this;
}

{
  *this = &unk_2700E6028;
  this[1] = a2;
  return this;
}

void GPUTools::FB::VAListArgumentProvider::~VAListArgumentProvider(GPUTools::FB::VAListArgumentProvider *this)
{
  *(void *)this = &unk_2700E6028;
}

{
  *(void *)this = &unk_2700E6028;
}

{
  *(void *)this = &unk_2700E6028;
  JUMPOUT(0x253360DD0);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GenFormatString(GPUTools::FB::FunctionArgumentProvider *this, const GPUTools::FD::Argument *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v12);
  __int16 v3 = *((_WORD *)this + 11);
  if ((v3 & 1) != 0 || (v3 & 2) != 0)
  {
    std::ostream::put();
    std::ostream::operator<<();
  }
  __int16 v4 = *((_WORD *)this + 11);
  if ((v4 & 4) != 0)
  {
    std::ostream::put();
    __int16 v4 = *((_WORD *)this + 11);
  }
  if ((v4 & 8) != 0)
  {
    std::ostream::put();
    if (*((_DWORD *)this + 3))
    {
      std::ostream::put();
      goto LABEL_11;
    }
  }
  else if ((v4 & 0x10) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"V<", 2);
LABEL_11:
    int v5 = 1;
    goto LABEL_13;
  }
  int v5 = 0;
LABEL_13:
  vm_size_t v6 = "ub";
  switch(*((_DWORD *)this + 3))
  {
    case 0:
      if (*((_DWORD *)this + 2) != 13) {
        __assert_rtn("static std::string GPUTools::FB::FunctionArgumentProvider::GenFormatString(const GPUTools::FD::Argument &)", "", 0, "argument.core_type == Argument::Type::Pointer");
      }
      break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
    case 0xA:
    case 0xB:
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x13:
    case 0x21:
    case 0x22:
    case 0x23:
    case 0x24:
    case 0x25:
    case 0x26:
    case 0x27:
    case 0x2A:
    case 0x2B:
    case 0x2C:
    case 0x2D:
    case 0x2E:
    case 0x2F:
      goto LABEL_32;
    case 2:
    case 0x11:
      goto LABEL_27;
    case 4:
      vm_size_t v6 = "us";
      goto LABEL_27;
    case 6:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
      vm_size_t v6 = "ui";
      goto LABEL_27;
    case 8:
    case 0x1A:
      vm_size_t v6 = "uw";
      goto LABEL_27;
    case 0xC:
      vm_size_t v6 = "ul";
LABEL_27:
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v6, 2);
      break;
    case 0x10:
      dy_abort("objc objects cannot be encoded in function buffers", 98);
    case 0x12:
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
      int v7 = *((_DWORD *)this + 2);
      if (v7 != 6 && v7 != 9 && v7 != 8) {
        dy_abort("invalid core type for GL enum: %u", 98);
      }
      goto LABEL_32;
    case 0x28:
      int v9 = *((_DWORD *)this + 2);
      if (v9 != 12 && v9 != 6) {
        dy_abort("invalid core type for GL shader: %u", 98);
      }
      goto LABEL_32;
    case 0x29:
      int v8 = *((_DWORD *)this + 2);
      if (v8 != 12 && v8 != 6) {
        dy_abort("invalid core type for GL program: %u", 98);
      }
LABEL_32:
      std::ostream::put();
      break;
    default:
      break;
  }
  if (v5) {
    std::ostream::put();
  }
  std::stringbuf::str();
  v12[0] = *MEMORY[0x263F8C2B8];
  uint64_t v10 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v12 + *(void *)(v12[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v13[0] = v10;
  v13[1] = MEMORY[0x263F8C318] + 16;
  if (v14 < 0) {
    operator delete((void *)v13[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x253360D80](&v15);
}

void sub_24F676E94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  int v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  int v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_24F677218(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x253360D80](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x253360D80](a1 + 128);
  return a1;
}

GPUTools::FB::FunctionArgumentProvider *GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(GPUTools::FB::FunctionArgumentProvider *this, const GPUTools::FD::CoreFunction *a2, int a3)
{
  *(void *)this = &unk_2700E6090;
  *((void *)this + 1) = 0;
  int v5 = (void **)((char *)this + 8);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = a2;
  *(_OWORD *)((char *)this + 40) = 0u;
  uint64_t v6 = (std::string *)((char *)this + 40);
  *(_OWORD *)((char *)this + 56) = 0u;
  unsigned __int16 v7 = *((_WORD *)a2 + 5);
  if (a3)
  {
    unsigned __int16 v7 = 1;
    int v8 = (char *)a2 + 24;
  }
  else
  {
    int v8 = (char *)a2 + 48;
  }
  uint64_t v9 = v7;
  unint64_t v86 = v5;
  std::vector<std::pair<dy_polymorphic_scalar_t,BOOL>>::reserve(v5, v7);
  if (v9)
  {
    uint64_t v11 = 0;
    uint64_t v85 = (char *)this + 24;
    do
    {
      uint64_t v12 = (GPUTools::FB::FunctionArgumentProvider *)&v8[24 * v11];
      GPUTools::FB::FunctionArgumentProvider::GenFormatString((uint64_t *)__p, v12, (const GPUTools::FD::Argument *)v10);
      if ((v88 & 0x80u) == 0) {
        uint64_t v13 = __p;
      }
      else {
        uint64_t v13 = (void **)__p[0];
      }
      if ((v88 & 0x80u) == 0) {
        std::string::size_type v14 = v88;
      }
      else {
        std::string::size_type v14 = (std::string::size_type)__p[1];
      }
      std::string::append(v6, (const std::string::value_type *)v13, v14);
      __int16 v15 = *(_WORD *)&v8[24 * v11 + 22];
      if ((v15 & 2) != 0)
      {
        unint64_t v23 = &v8[24 * v11];
        unsigned int v25 = *((unsigned __int16 *)v23 + 10);
        uint8x8_t v24 = v23 + 20;
        uint64_t v3 = (void ***)malloc_type_malloc(8 * v25, 0x80040B8603338uLL);
        if (!v3) {
          __assert_rtn("GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(const GPUTools::FD::CoreFunction &, BOOL)", "", 0, "ppArrays");
        }
        unint64_t v26 = v6;
        unint64_t v27 = malloc_type_malloc(4 * (unsigned __int16)*v24, 0x100004052888210uLL);
        if (!v27) {
          __assert_rtn("GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(const GPUTools::FD::CoreFunction &, BOOL)", "", 0, "pLengths");
        }
        unint64_t CoreTypeSize = GPUTools::FD::Argument::GetCoreTypeSize(*(_DWORD *)&v8[24 * v11 + 8]);
        unint64_t v29 = (unsigned __int16)*v24;
        if (*v24)
        {
          uint64_t v30 = 0;
          size_t v31 = *(void ****)v12;
          uint64_t v32 = *(void *)v12 + 4;
          do
          {
            size_t v33 = (void **)(*(unsigned int *)(v32 - 4) + *(void *)v12);
            v3[v30] = v33;
            uint64_t v34 = v30 + 1;
            if (v30 + 1 >= v29) {
              int v35 = &v8[24 * v11 + 16];
            }
            else {
              int v35 = (char *)v32;
            }
            v27[v30] = ((char *)v31 + *(unsigned int *)v35 - (char *)v33) / CoreTypeSize;
            v32 += 4;
            ++v30;
          }
          while (v29 != v34);
        }
        unint64_t v37 = *((void *)this + 2);
        unint64_t v36 = *((void *)this + 3);
        if (v37 >= v36)
        {
          uint64_t v39 = (uint64_t)(v37 - (void)*v86) >> 4;
          unint64_t v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 60) {
            std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v41 = v36 - (void)*v86;
          if (v41 >> 3 > v40) {
            unint64_t v40 = v41 >> 3;
          }
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v10 = v40;
          }
          if (v10) {
            unint64_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
          }
          else {
            unint64_t v42 = 0;
          }
          unint64_t v56 = &v42[16 * v39];
          *(void *)unint64_t v56 = v27;
          v56[8] = 1;
          long long v58 = (char *)*((void *)this + 1);
          size_t v57 = (char *)*((void *)this + 2);
          long long v59 = v56;
          uint64_t v6 = v26;
          if (v57 != v58)
          {
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v57 - 1);
              v59 -= 16;
              v57 -= 16;
            }
            while (v57 != v58);
            size_t v57 = (char *)*v86;
          }
          uint64_t v38 = v56 + 16;
          *((void *)this + 1) = v59;
          *((void *)this + 2) = v56 + 16;
          *((void *)this + 3) = &v42[16 * v10];
          if (v57) {
            operator delete(v57);
          }
        }
        else
        {
          *(void *)unint64_t v37 = v27;
          *(unsigned char *)(v37 + 8) = 1;
          uint64_t v38 = (char *)(v37 + 16);
          uint64_t v6 = v26;
        }
        *((void *)this + 2) = v38;
        unint64_t v60 = *((void *)this + 3);
        if ((unint64_t)v38 >= v60)
        {
          uint64_t v61 = (v38 - (unsigned char *)*v86) >> 4;
          if ((unint64_t)(v61 + 1) >> 60) {
            std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v62 = v60 - (void)*v86;
          uint64_t v63 = v62 >> 3;
          if (v62 >> 3 <= (unint64_t)(v61 + 1)) {
            uint64_t v63 = v61 + 1;
          }
          if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v10 = v63;
          }
          if (v10) {
            long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
          }
          else {
            long long v22 = 0;
          }
          size_t v64 = &v22[16 * v61];
          *(void *)size_t v64 = v3;
          v64[8] = 1;
          int v66 = (char *)*((void *)this + 1);
          Class v65 = (char *)*((void *)this + 2);
          size_t v67 = v64;
          if (v65 != v66)
          {
            do
            {
              *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
              v67 -= 16;
              v65 -= 16;
            }
            while (v65 != v66);
LABEL_125:
            Class v65 = (char *)*v86;
          }
LABEL_126:
          long long v55 = v64 + 16;
          *((void *)this + 1) = v67;
          *((void *)this + 2) = v64 + 16;
          *((void *)this + 3) = &v22[16 * v10];
          if (v65) {
            operator delete(v65);
          }
          goto LABEL_128;
        }
        *(void *)uint64_t v38 = v3;
        v38[8] = 1;
        long long v55 = v38 + 16;
      }
      else
      {
        if (*(_DWORD *)&v8[24 * v11 + 12] != 14 && (v15 & 0x18) == 0)
        {
          if ((v15 & 1) == 0)
          {
            switch(*(_DWORD *)&v8[24 * v11 + 8])
            {
              case 1:
              case 2:
                uint64_t v74 = **(unsigned __int8 **)v12;
                unint64_t v75 = (unint64_t)v3 & 0xFFFFFFFFFFFFFF00;
                goto LABEL_110;
              case 3:
              case 4:
                uint64_t v74 = **(unsigned __int16 **)v12;
                unint64_t v75 = (unint64_t)v3 & 0xFFFFFFFFFFFF0000;
                goto LABEL_110;
              case 5:
              case 6:
              case 9:
                uint64_t v74 = **(unsigned int **)v12;
                unint64_t v75 = (unint64_t)v3 & 0xFFFFFFFF00000000;
LABEL_110:
                uint64_t v3 = (void ***)(v75 | v74);
                break;
              case 7:
              case 8:
              case 0xA:
              case 0xB:
              case 0xC:
                uint64_t v3 = **(void *****)v12;
                break;
              case 0xD:
                uint64_t v3 = *(void ****)v12;
                break;
              default:
                dy_abort("invalid core type: %u", *(_DWORD *)&v8[24 * v11 + 8]);
            }
            unint64_t v53 = *((void *)this + 2);
            unint64_t v79 = *((void *)this + 3);
            if (v53 >= v79)
            {
              uint64_t v80 = (uint64_t)(v53 - (void)*v86) >> 4;
              unint64_t v81 = v80 + 1;
              if ((unint64_t)(v80 + 1) >> 60) {
                std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v82 = v79 - (void)*v86;
              if (v82 >> 3 > v81) {
                unint64_t v81 = v82 >> 3;
              }
              if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v10 = v81;
              }
              if (v10) {
                long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
              }
              else {
                long long v22 = 0;
              }
              size_t v64 = &v22[16 * v80];
              *(void *)size_t v64 = v3;
              v64[8] = 0;
              long long v83 = (char *)*((void *)this + 1);
              Class v65 = (char *)*((void *)this + 2);
              size_t v67 = v64;
              if (v65 != v83)
              {
                do
                {
                  *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                  v67 -= 16;
                  v65 -= 16;
                }
                while (v65 != v83);
                goto LABEL_125;
              }
              goto LABEL_126;
            }
            *(void *)unint64_t v53 = v3;
            *(unsigned char *)(v53 + 8) = 0;
            goto LABEL_113;
          }
          uint64_t v3 = *(void ****)v12;
          unint64_t v17 = *((void *)this + 2);
          unint64_t v54 = *((void *)this + 3);
          if (v17 >= v54)
          {
            uint64_t v68 = (uint64_t)(v17 - (void)*v86) >> 4;
            unint64_t v69 = v68 + 1;
            if ((unint64_t)(v68 + 1) >> 60) {
              std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v70 = v54 - (void)*v86;
            if (v70 >> 3 > v69) {
              unint64_t v69 = v70 >> 3;
            }
            if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v10 = v69;
            }
            if (v10) {
              long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
            }
            else {
              long long v22 = 0;
            }
            size_t v64 = &v22[16 * v68];
            *(void *)size_t v64 = v3;
            v64[8] = 0;
            int v77 = (char *)*((void *)this + 1);
            Class v65 = (char *)*((void *)this + 2);
            size_t v67 = v64;
            if (v65 != v77)
            {
              do
              {
                *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                v67 -= 16;
                v65 -= 16;
              }
              while (v65 != v77);
              goto LABEL_125;
            }
            goto LABEL_126;
          }
        }
        else
        {
          if ((v15 & 0x40) != 0)
          {
            unint64_t v43 = &v8[24 * v11];
            unsigned int v45 = *((unsigned __int16 *)v43 + 10);
            double v44 = v43 + 20;
            uint64_t v3 = (void ***)malloc_type_malloc(8 * v45, 0x10040436913F5uLL);
            if (!v3) {
              __assert_rtn("GPUTools::FB::FunctionArgumentProvider::FunctionArgumentProvider(const GPUTools::FD::CoreFunction &, BOOL)", "", 0, "ppStrings");
            }
            uint64_t v46 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)&v8[24 * v11]);
            uint64_t v47 = (unsigned __int16)*v44;
            if (*v44)
            {
              uint64_t v48 = 0;
              __int16 v49 = *(_WORD *)(v46 + 22);
              do
              {
                uint64_t v50 = *(void *)v46;
                if ((v49 & 0x40) != 0) {
                  unint64_t v51 = (void **)(*(unsigned int *)(v50 + 4 * v48) + v50);
                }
                else {
                  unint64_t v51 = *(void ***)(v50 + 8 * v48);
                }
                v3[v48++] = v51;
              }
              while (v47 != v48);
            }
            unint64_t v53 = *((void *)this + 2);
            unint64_t v52 = *((void *)this + 3);
            if (v53 >= v52)
            {
              uint64_t v71 = (uint64_t)(v53 - (void)*v86) >> 4;
              unint64_t v72 = v71 + 1;
              if ((unint64_t)(v71 + 1) >> 60) {
                std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v73 = v52 - (void)*v86;
              if (v73 >> 3 > v72) {
                unint64_t v72 = v73 >> 3;
              }
              if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v10 = v72;
              }
              if (v10) {
                long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
              }
              else {
                long long v22 = 0;
              }
              size_t v64 = &v22[16 * v71];
              *(void *)size_t v64 = v3;
              v64[8] = 1;
              int v78 = (char *)*((void *)this + 1);
              Class v65 = (char *)*((void *)this + 2);
              size_t v67 = v64;
              if (v65 != v78)
              {
                do
                {
                  *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                  v67 -= 16;
                  v65 -= 16;
                }
                while (v65 != v78);
                goto LABEL_125;
              }
              goto LABEL_126;
            }
            *(void *)unint64_t v53 = v3;
            *(unsigned char *)(v53 + 8) = 1;
LABEL_113:
            long long v55 = (char *)(v53 + 16);
            goto LABEL_128;
          }
          uint64_t v3 = *(void ****)v12;
          unint64_t v17 = *((void *)this + 2);
          unint64_t v18 = *((void *)this + 3);
          if (v17 >= v18)
          {
            uint64_t v19 = (uint64_t)(v17 - (void)*v86) >> 4;
            unint64_t v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 60) {
              std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v21 = v18 - (void)*v86;
            if (v21 >> 3 > v20) {
              unint64_t v20 = v21 >> 3;
            }
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v10 = v20;
            }
            if (v10) {
              long long v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>((uint64_t)v85, v10);
            }
            else {
              long long v22 = 0;
            }
            size_t v64 = &v22[16 * v19];
            *(void *)size_t v64 = v3;
            v64[8] = 0;
            uint64_t v76 = (char *)*((void *)this + 1);
            Class v65 = (char *)*((void *)this + 2);
            size_t v67 = v64;
            if (v65 != v76)
            {
              do
              {
                *((_OWORD *)v67 - 1) = *((_OWORD *)v65 - 1);
                v67 -= 16;
                v65 -= 16;
              }
              while (v65 != v76);
              goto LABEL_125;
            }
            goto LABEL_126;
          }
        }
        *(void *)unint64_t v17 = v3;
        *(unsigned char *)(v17 + 8) = 0;
        long long v55 = (char *)(v17 + 16);
      }
LABEL_128:
      *((void *)this + 2) = v55;
      if ((char)v88 < 0) {
        operator delete(__p[0]);
      }
      ++v11;
    }
    while (v11 != v9);
  }
  return this;
}

void sub_24F677B70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v17 + 63) < 0) {
    operator delete(*v18);
  }
  unint64_t v20 = *a11;
  if (*a11)
  {
    *(void *)(v17 + 16) = v20;
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<dy_polymorphic_scalar_t,BOOL>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>(v3, a2);
    unsigned __int16 v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
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

void GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider(GPUTools::FB::FunctionArgumentProvider *this)
{
  *(void *)this = &unk_2700E6090;
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *((void *)this + 2);
  while (v2 != v3)
  {
    if (*(unsigned char *)(v2 + 8)) {
      free(*(void **)v2);
    }
    v2 += 16;
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  uint64_t v4 = (void *)*((void *)this + 1);
  if (v4)
  {
    *((void *)this + 2) = v4;
    operator delete(v4);
  }
}

{
  uint64_t vars8;

  GPUTools::FB::FunctionArgumentProvider::~FunctionArgumentProvider(this);

  JUMPOUT(0x253360DD0);
}

void GPUTools::FB::FIFOArgumentProvider::~FIFOArgumentProvider(GPUTools::FB::FIFOArgumentProvider *this)
{
  *(void *)this = &unk_2700E60F8;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((void *)this + 1);
}

{
  *(void *)this = &unk_2700E60F8;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((void *)this + 1);
}

{
  uint64_t vars8;

  *(void *)this = &unk_2700E60F8;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((void *)this + 1);

  JUMPOUT(0x253360DD0);
}

void GPUTools::FB::FIFOArgumentProvider::push(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)(a1 + 8), &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, unsigned int a2)
{
  uint64_t v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

{
  uint64_t v2;

  uint64_t v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, uint64_t a2)
{
  uint64_t v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

{
  uint64_t v2;

  uint64_t v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, float a2)
{
  uint64_t v2 = LODWORD(a2);
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, double a2)
{
  double v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

void GPUTools::FB::FIFOArgumentProvider::push(GPUTools::FB::FIFOArgumentProvider *this, void *a2)
{
  double v2 = a2;
  std::deque<dy_polymorphic_scalar_t>::push_back((void *)this + 1, &v2);
}

uint64_t GPUTools::FB::FIFOArgumentProvider::size(GPUTools::FB::FIFOArgumentProvider *this)
{
  return *((void *)this + 6);
}

void GPUTools::FB::FIFOPointerArgumentProvider::~FIFOPointerArgumentProvider(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  *(void *)this = &unk_2700E6160;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((void *)this + 1);
}

{
  *(void *)this = &unk_2700E6160;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((void *)this + 1);
}

{
  uint64_t vars8;

  *(void *)this = &unk_2700E6160;
  std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100]((void *)this + 1);

  JUMPOUT(0x253360DD0);
}

void GPUTools::FB::FIFOPointerArgumentProvider::push(GPUTools::FB::FIFOPointerArgumentProvider *this, void *a2)
{
  double v2 = a2;
  std::deque<dy_polymorphic_vector_t>::push_back((void *)this + 1, &v2);
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::size(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  return *((void *)this + 6);
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt8(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                          + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt16(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(unsigned __int16 *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                           + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt32(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(unsigned int *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                       + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUInt64(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(void *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetUIntPtr(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(void *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

float GPUTools::FB::FIFOArgumentProvider::GetFloat(GPUTools::FB::FIFOArgumentProvider *this)
{
  float v1 = *(float *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

double GPUTools::FB::FIFOArgumentProvider::GetDouble(GPUTools::FB::FIFOArgumentProvider *this)
{
  double v1 = *(double *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetVoidPointer(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(void *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOArgumentProvider::GetCharPointer(GPUTools::FB::FIFOArgumentProvider *this)
{
  uint64_t v1 = *(void *)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt8(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = (unsigned __int8 *)*((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt16(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = (unsigned __int16 *)*((void *)this + 1);
  *((void *)this + 1) = v1 + 4;
  return *v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt32(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = (unsigned int *)*((void *)this + 1);
  *((void *)this + 1) = v1 + 2;
  return *v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUInt64(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *(void *)v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetUIntPtr(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *(void *)v1;
}

float GPUTools::FB::VAListArgumentProvider::GetFloat(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *(double *)v1;
}

double GPUTools::FB::VAListArgumentProvider::GetDouble(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *(double *)v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetVoidPointer(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *(void *)v1;
}

uint64_t GPUTools::FB::VAListArgumentProvider::GetCharPointer(GPUTools::FB::VAListArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 1);
  *((void *)this + 1) = v1 + 8;
  return *(void *)v1;
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt8(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(unsigned __int8 *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt16(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(unsigned __int16 *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt32(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(unsigned int *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUInt64(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(void *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetUIntPtr(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(void *)(*((void *)this + 1) + 16 * v1);
}

float GPUTools::FB::FunctionArgumentProvider::GetFloat(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(float *)(*((void *)this + 1) + 16 * v1);
}

double GPUTools::FB::FunctionArgumentProvider::GetDouble(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(double *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetVoidPointer(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(void *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FunctionArgumentProvider::GetCharPointer(GPUTools::FB::FunctionArgumentProvider *this)
{
  uint64_t v1 = *((void *)this + 8);
  *((void *)this + 8) = v1 + 1;
  return *(void *)(*((void *)this + 1) + 16 * v1);
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt8(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(unsigned __int8 **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                            + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt16(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(unsigned __int16 **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                             + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt32(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(unsigned int **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUInt64(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(void **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetUIntPtr(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(void **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

float GPUTools::FB::FIFOPointerArgumentProvider::GetFloat(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  float v1 = **(float **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                  + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

double GPUTools::FB::FIFOPointerArgumentProvider::GetDouble(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  double v1 = **(double **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetVoidPointer(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(void **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t GPUTools::FB::FIFOPointerArgumentProvider::GetCharPointer(GPUTools::FB::FIFOPointerArgumentProvider *this)
{
  uint64_t v1 = **(void **)(*(void *)(*((void *)this + 2) + ((*((void *)this + 5) >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (*((void *)this + 5) & 0x1FFLL));
  *(int64x2_t *)((char *)this + 40) = vaddq_s64(*(int64x2_t *)((char *)this + 40), (int64x2_t)xmmword_24F6954D0);
  std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 8, 1);
  return v1;
}

uint64_t std::deque<dy_polymorphic_scalar_t>::~deque[abi:ne180100](void *a1)
{
  double v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      double v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 256;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    unsigned __int16 v7 = *v2++;
    operator delete(v7);
  }

  return std::__split_buffer<dy_polymorphic_scalar_t *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<dy_polymorphic_scalar_t *>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::deque<dy_polymorphic_scalar_t>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x253360C10](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x253360C20](v13);
  return a1;
}

void sub_24F678C88(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x253360C20](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24F678C68);
}

void sub_24F678CDC(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_24F678E5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__CATransform3D b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_polymorphic_scalar_t,BOOL>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void std::deque<dy_polymorphic_scalar_t>::push_back(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<dy_polymorphic_scalar_t>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  *(void *)(*(void *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

void std::deque<dy_polymorphic_scalar_t>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    size_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    int v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)size_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v5, v33);
      int v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      size_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        size_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      int v9 = (char *)a1[1];
    }
    size_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)a1, &v54);
    double v44 = (void *)a1[1];
    size_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    int v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v46);
      int v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      size_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        size_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        unint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)unint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        size_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  unint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  unint64_t v53 = operator new(0x1000uLL);
  std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(&v54, &v53);
  unint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)&v54, v27);
  }
  unint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_24F6792B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      unint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      unint64_t v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<dy_polymorphic_scalar_t *>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      int64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        int64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::deque<dy_polymorphic_vector_t>::push_back(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = ((v4 - v5) << 6) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<dy_polymorphic_vector_t>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  *(void *)(*(void *)(v5 + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v7 & 0x1FF)) = *a2;
  ++a1[5];
}

void std::deque<dy_polymorphic_vector_t>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>(v5, v33);
      int v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        uint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)uint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)a1, &v54);
    double v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v46);
      int v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        unint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)unint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  unint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<void **>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  unint64_t v53 = operator new(0x1000uLL);
  std::__split_buffer<dy_polymorphic_scalar_t *>::push_back(&v54, &v53);
  unint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<dy_polymorphic_scalar_t *>::push_front((uint64_t)&v54, v27);
  }
  unint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_24F679AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

float *DYVec3Set(float *result, float a2, float a3, float a4)
{
  const char *result = a2;
  result[1] = a3;
  result[2] = a4;
  return result;
}

float32_t DYVec3Scale(float32x2_t *a1, float32x2_t *a2, float a3)
{
  *a2 = vmul_n_f32(*a1, a3);
  float32_t result = a1[1].f32[0] * a3;
  a2[1].f32[0] = result;
  return result;
}

float32_t DYVec3Add(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3)
{
  *a3 = vadd_f32(*a1, *a2);
  float32_t result = a1[1].f32[0] + a2[1].f32[0];
  a3[1].f32[0] = result;
  return result;
}

float32_t DYVec3Subtract(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3)
{
  *a3 = vsub_f32(*a1, *a2);
  float32_t result = a1[1].f32[0] - a2[1].f32[0];
  a3[1].f32[0] = result;
  return result;
}

float DYVec3Normalize(float *a1, float *a2)
{
  float v2 = a1[1];
  float v3 = a1[2];
  float v4 = sqrtf((float)((float)(v2 * v2) + (float)(*a1 * *a1)) + (float)(v3 * v3));
  *a2 = *a1 / v4;
  a2[1] = v2 / v4;
  float result = v3 / v4;
  a2[2] = v3 / v4;
  return result;
}

float DYVec3Length(float *a1)
{
  return sqrtf((float)((float)(a1[1] * a1[1]) + (float)(*a1 * *a1)) + (float)(a1[2] * a1[2]));
}

float DYVec3LengthSquared(float *a1)
{
  return (float)((float)(a1[1] * a1[1]) + (float)(*a1 * *a1)) + (float)(a1[2] * a1[2]);
}

float DYVec3DotProduct(float *a1, float *a2)
{
  return (float)((float)(a1[1] * a2[1]) + (float)(*a1 * *a2)) + (float)(a1[2] * a2[2]);
}

float DYVec3Distance(float *a1, float *a2)
{
  float v2 = a1[1] - a2[1];
  float v3 = a1[2] - a2[2];
  return sqrtf((float)((float)(v2 * v2) + (float)((float)(*a1 - *a2) * (float)(*a1 - *a2))) + (float)(v3 * v3));
}

float DYVec3DistanceSquared(float *a1, float *a2)
{
  float v2 = a1[1] - a2[1];
  float v3 = a1[2] - a2[2];
  return (float)((float)(v2 * v2) + (float)((float)(*a1 - *a2) * (float)(*a1 - *a2))) + (float)(v3 * v3);
}

float DYVec3CrossProduct(float *a1, float *a2, float *a3)
{
  float v4 = a2[1];
  float v3 = a2[2];
  float v6 = a1[1];
  float v5 = a1[2];
  float v7 = (float)(v6 * v3) - (float)(v4 * v5);
  float result = (float)(*a2 * v5) - (float)(*a1 * v3);
  float v9 = (float)(*a1 * v4) - (float)(*a2 * v6);
  *a3 = v7;
  a3[1] = result;
  a3[2] = v9;
  return result;
}

float32_t DYVec3Lerp(float32x2_t *a1, float32x2_t *a2, float32x2_t *a3, float a4)
{
  *a3 = vmla_n_f32(*a1, vsub_f32(*a2, *a1), a4);
  float32_t result = a1[1].f32[0] + (float)((float)(a2[1].f32[0] - a1[1].f32[0]) * a4);
  a3[1].f32[0] = result;
  return result;
}

float DYVec3Reflect(float *a1, float *a2, float *a3)
{
  float v3 = a2[1];
  float v4 = a2[2];
  float v5 = sqrtf((float)((float)(v3 * v3) + (float)(*a2 * *a2)) + (float)(v4 * v4));
  float v6 = *a2 / v5;
  float v7 = v3 / v5;
  float v8 = v4 / v5;
  float v9 = a1[1];
  float v10 = a1[2];
  float v11 = (float)((float)(v9 * v7) + (float)(v6 * *a1)) + (float)(v8 * v10);
  float v12 = v11 + v11;
  *a3 = *a1 - (float)(v6 * v12);
  a3[1] = v9 - (float)(v7 * v12);
  float result = v10 - (float)(v8 * v12);
  a3[2] = result;
  return result;
}

float DYVec3Project(float *a1, float *a2, float *a3)
{
  float v3 = a2[1];
  float v4 = a2[2];
  float v5 = sqrtf((float)((float)(v3 * v3) + (float)(*a2 * *a2)) + (float)(v4 * v4));
  float v6 = *a2 / v5;
  float v7 = v3 / v5;
  float v8 = v4 / v5;
  float v9 = (float)((float)(a1[1] * v7) + (float)(v6 * *a1)) + (float)(v8 * a1[2]);
  *a3 = v6 * v9;
  a3[1] = v7 * v9;
  float result = v8 * v9;
  a3[2] = v8 * v9;
  return result;
}

void *PrettifyFenumString(void *result, int a2, int a3)
{
  if (result)
  {
    float v5 = result;
    if ([result hasPrefix:@"kDYFE"]) {
      float v5 = (void *)[v5 substringFromIndex:5];
    }
    uint64_t v6 = [v5 rangeOfString:@"_"];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      float v5 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", @"_", @" ", 0, v6, v7);
    }
    uint64_t v8 = [v5 stringByReplacingOccurrencesOfString:@"_" withString:@":"];
    float v9 = @"+";
    if (!a2) {
      float v9 = @"-";
    }
    if (a3) {
      float v10 = @":";
    }
    else {
      float v10 = &stru_2700E6440;
    }
    return (void *)[NSString stringWithFormat:@"%@[%@%@]", v9, v8, v10];
  }
  return result;
}

double DYMtxIdentity(_OWORD *a1)
{
  *a1 = xmmword_24F6954E0;
  a1[1] = xmmword_24F6954F0;
  double result = 0.0;
  a1[2] = xmmword_24F695500;
  a1[3] = xmmword_24F695510;
  return result;
}

double DYMtxScale(uint64_t a1, float a2, float a3, float a4)
{
  *(float *)a1 = a2;
  *(float *)(a1 + 20) = a3;
  *(float *)(a1 + 40) = a4;
  double result = 0.0;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

double DYMtxTranslate(uint64_t a1, float a2, float a3, float a4)
{
  *(float *)(a1 + 48) = a2;
  *(float *)(a1 + 52) = a3;
  *(float *)(a1 + 56) = a4;
  *(_OWORD *)a1 = xmmword_24F6954E0;
  *(_OWORD *)(a1 + 16) = xmmword_24F6954F0;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = xmmword_24F695500;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

double DYMtxRotateZ(uint64_t a1, float a2)
{
  __float2 v3 = __sincosf_stret((float)(a2 * 3.1416) / 180.0);
  *(float *)a1 = v3.__cosval;
  *(float *)(a1 + 4) = v3.__sinval;
  *(float *)(a1 + 16) = -v3.__sinval;
  *(float *)(a1 + 20) = v3.__cosval;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)(a1 + 40) = xmmword_24F6954E0;
  double result = 0.0078125;
  *(void *)(a1 + 56) = 0x3F80000000000000;
  return result;
}

float DYMtxRotateAxis(uint64_t a1, float a2, float a3, float a4, float a5)
{
  __float2 v9 = __sincosf_stret((float)(a2 * 3.1416) / 180.0);
  float v20 = 0.0;
  uint64_t v19 = 0;
  int v18 = 0;
  uint64_t v17 = 0;
  DYVec3Set((float *)&v17, a3, a4, a5);
  DYVec3Normalize((float *)&v17, (float *)&v19);
  uint64_t v10 = v19;
  float v11 = v20;
  float v12 = (float)((float)(*(float *)&v19 * *((float *)&v19 + 1)) * (float)(1.0 - v9.__cosval))
      - (float)(v20 * v9.__sinval);
  float v13 = *(float *)&v19 * v20;
  float v14 = (float)(v9.__sinval * v20)
      + (float)((float)(*(float *)&v19 * *((float *)&v19 + 1)) * (float)(1.0 - v9.__cosval));
  float v15 = (float)(v9.__sinval * *((float *)&v19 + 1))
      + (float)((float)(*(float *)&v19 * v20) * (float)(1.0 - v9.__cosval));
  *(float *)a1 = v9.__cosval + (float)((float)(*(float *)&v19 * *(float *)&v19) * (float)(1.0 - v9.__cosval));
  *(float *)(a1 + 4) = v14;
  *(float *)(a1 + 16) = v12;
  *(float *)(a1 + 20) = v9.__cosval
                      + (float)((float)(*((float *)&v10 + 1) * *((float *)&v10 + 1)) * (float)(1.0 - v9.__cosval));
  *(float *)(a1 + 32) = v15;
  *(float *)(a1 + 36) = (float)((float)(*((float *)&v10 + 1) * v11) * (float)(1.0 - v9.__cosval))
                      - (float)(*(float *)&v10 * v9.__sinval);
  *(float *)(a1 + 8) = (float)(v13 * (float)(1.0 - v9.__cosval)) - (float)(*((float *)&v10 + 1) * v9.__sinval);
  *(float *)(a1 + 24) = (float)(v9.__sinval * *(float *)&v10)
                      + (float)((float)(*((float *)&v10 + 1) * v11) * (float)(1.0 - v9.__cosval));
  float result = v9.__cosval + (float)((float)(v11 * v11) * (float)(1.0 - v9.__cosval));
  *(float *)(a1 + 40) = result;
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 28) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

float DYMtxTranspose(uint64_t a1, _DWORD *a2)
{
  float result = *(float *)a1;
  int v3 = *(_DWORD *)(a1 + 4);
  int v4 = *(_DWORD *)(a1 + 8);
  int v5 = *(_DWORD *)(a1 + 12);
  int v6 = *(_DWORD *)(a1 + 16);
  int v7 = *(_DWORD *)(a1 + 20);
  int v8 = *(_DWORD *)(a1 + 24);
  int v9 = *(_DWORD *)(a1 + 28);
  int v10 = *(_DWORD *)(a1 + 32);
  int v11 = *(_DWORD *)(a1 + 36);
  int v12 = *(_DWORD *)(a1 + 40);
  int v13 = *(_DWORD *)(a1 + 44);
  int v14 = *(_DWORD *)(a1 + 48);
  int v15 = *(_DWORD *)(a1 + 52);
  int v16 = *(_DWORD *)(a1 + 56);
  int v17 = *(_DWORD *)(a1 + 60);
  *a2 = *(_DWORD *)a1;
  a2[1] = v6;
  a2[2] = v10;
  a2[3] = v14;
  a2[4] = v3;
  a2[5] = v7;
  a2[6] = v11;
  a2[7] = v15;
  a2[8] = v4;
  a2[9] = v8;
  a2[10] = v12;
  a2[11] = v16;
  a2[12] = v5;
  a2[13] = v9;
  a2[14] = v13;
  a2[15] = v17;
  return result;
}

float DYMtxSubtract(float *a1, float *a2, float *a3)
{
  *a3 = *a1 - *a2;
  a3[4] = a1[4] - a2[4];
  a3[8] = a1[8] - a2[8];
  a3[12] = a1[12] - a2[12];
  a3[1] = a1[1] - a2[1];
  a3[5] = a1[5] - a2[5];
  a3[9] = a1[9] - a2[9];
  a3[13] = a1[13] - a2[13];
  a3[2] = a1[2] - a2[2];
  a3[6] = a1[6] - a2[6];
  a3[10] = a1[10] - a2[10];
  a3[14] = a1[14] - a2[14];
  a3[3] = a1[3] - a2[3];
  a3[7] = a1[7] - a2[7];
  a3[11] = a1[11] - a2[11];
  float result = a1[15] - a2[15];
  a3[15] = result;
  return result;
}

float DYMtxConcat(float *a1, float *a2, float *a3)
{
  float v3 = a2[1];
  float v4 = a1[1];
  float v5 = a1[4];
  float v6 = a1[5];
  float v7 = a2[2];
  float v8 = a2[3];
  float v9 = a1[8];
  float v10 = a1[9];
  float v11 = a1[12];
  float v12 = a1[13];
  float v13 = (float)((float)((float)((float)(*a1 * *a2) + 0.0) + (float)(v5 * v3)) + (float)(v9 * v7)) + (float)(v11 * v8);
  float v14 = a2[4];
  float v15 = a2[5];
  float v16 = a2[6];
  float v17 = a2[7];
  float v18 = (float)((float)((float)((float)(*a1 * v14) + 0.0) + (float)(v5 * v15)) + (float)(v9 * v16)) + (float)(v11 * v17);
  float v19 = a2[8];
  float v20 = a2[9];
  float v21 = a2[10];
  float v22 = a2[11];
  float v23 = (float)((float)((float)((float)(*a1 * v19) + 0.0) + (float)(v5 * v20)) + (float)(v9 * v21)) + (float)(v11 * v22);
  float v24 = a2[12];
  float v25 = a2[13];
  float v26 = (float)((float)(*a1 * v24) + 0.0) + (float)(v5 * v25);
  float v27 = a2[14];
  float v28 = a2[15];
  float v51 = (float)(v26 + (float)(v9 * v27)) + (float)(v11 * v28);
  float v52 = v13;
  float v29 = (float)((float)((float)((float)(v4 * *a2) + 0.0) + (float)(v6 * v3)) + (float)(v10 * v7)) + (float)(v12 * v8);
  float v30 = (float)((float)((float)((float)(v4 * v14) + 0.0) + (float)(v6 * v15)) + (float)(v10 * v16)) + (float)(v12 * v17);
  float v31 = (float)((float)((float)((float)(v4 * v19) + 0.0) + (float)(v6 * v20)) + (float)(v10 * v21)) + (float)(v12 * v22);
  float v32 = (float)((float)((float)((float)(v4 * v24) + 0.0) + (float)(v6 * v25)) + (float)(v10 * v27)) + (float)(v12 * v28);
  float v33 = a1[2];
  float v34 = a1[3];
  float v35 = a1[6];
  float v36 = a1[7];
  float v37 = (float)((float)(v33 * *a2) + 0.0) + (float)(v35 * v3);
  float v38 = (float)((float)(v33 * v14) + 0.0) + (float)(v35 * v15);
  float v39 = (float)((float)(v33 * v19) + 0.0) + (float)(v35 * v20);
  float v40 = (float)((float)(v33 * v24) + 0.0) + (float)(v35 * v25);
  float v42 = a1[10];
  float v41 = a1[11];
  float v43 = v37 + (float)(v42 * v7);
  float v44 = v38 + (float)(v42 * v16);
  float v45 = v39 + (float)(v42 * v21);
  float v46 = v40 + (float)(v42 * v27);
  float v48 = a1[14];
  float v47 = a1[15];
  float v49 = (float)((float)((float)((float)(v34 * *a2) + 0.0) + (float)(v36 * a2[1])) + (float)(v41 * v7))
      + (float)(v47 * v8);
  *a3 = v52;
  a3[1] = v29;
  a3[2] = v43 + (float)(v48 * v8);
  a3[3] = v49;
  a3[4] = v18;
  a3[5] = v30;
  a3[6] = v44 + (float)(v48 * v17);
  a3[7] = (float)((float)((float)((float)(v34 * v14) + 0.0) + (float)(v36 * v15)) + (float)(v41 * v16))
        + (float)(v47 * v17);
  a3[8] = v23;
  a3[9] = v31;
  a3[10] = v45 + (float)(v48 * v22);
  a3[11] = (float)((float)((float)((float)(v34 * v19) + 0.0) + (float)(v36 * v20)) + (float)(v41 * v21))
         + (float)(v47 * v22);
  a3[12] = v51;
  a3[13] = v32;
  float result = (float)((float)((float)((float)(v34 * v24) + 0.0) + (float)(v36 * v25)) + (float)(v41 * v27))
         + (float)(v47 * v28);
  a3[14] = v46 + (float)(v48 * v28);
  a3[15] = result;
  return result;
}

float32x2_t DYMtxMultVec3(float32x2_t *a1, float *a2, float32x2_t *a3)
{
  float v3 = a2[1];
  float v4 = a2[2];
  float32_t v5 = a1[7].f32[0]
     + (float)((float)((float)(v3 * a1[3].f32[0]) + (float)(a1[1].f32[0] * *a2)) + (float)(a1[5].f32[0] * v4));
  float32x2_t result = vadd_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(a1[2], v3), *a1, *a2), a1[4], v4), a1[6]);
  *a3 = result;
  a3[1].f32[0] = v5;
  return result;
}

float32x2_t DYMtxMult3x3Vec3(float32x2_t *a1, float *a2, float32x2_t *a3)
{
  float v3 = a2[1];
  float v4 = a2[2];
  float32_t v5 = (float)((float)(v3 * a1[3].f32[0]) + (float)(a1[1].f32[0] * *a2)) + (float)(a1[5].f32[0] * v4);
  float32x2_t result = a1[4];
  *a3 = vmla_n_f32(vmla_n_f32(vmul_n_f32(a1[2], v3), *a1, *a2), result, v4);
  a3[1].f32[0] = v5;
  return result;
}

float32x4_t DYMtxMultVec4(float32x4_t *a1, float *a2, float32x4_t *a3)
{
  float32x4_t result = a1[2];
  *a3 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a1[1], a2[1]), *a1, *a2), result, a2[2]), a1[3], a2[3]);
  return result;
}

float DYMtxFrobeniusNorm(float *a1)
{
  float v1 = a1[3];
  float v2 = a1[7];
  float v3 = a1[11];
  float v4 = a1[14];
  float v5 = a1[15];
  return sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(*a1 * *a1) + 0.0) + (float)(a1[4] * a1[4])) + (float)(a1[8] * a1[8])) + (float)(a1[12] * a1[12]))+ (float)(a1[1] * a1[1]))+ (float)(a1[5] * a1[5]))+ (float)(a1[9] * a1[9]))+ (float)(a1[13] * a1[13]))+ (float)(a1[2] * a1[2]))+ (float)(a1[6] * a1[6]))+ (float)(a1[10] * a1[10]))+ (float)(v4 * v4))+ (float)(v1 * v1))+ (float)(v2 * v2))+ (float)(v3 * v3))+ (float)(v5 * v5));
}

double DYMtxFrustum(uint64_t a1, float a2, float a3, float a4, float a5, float a6, float a7)
{
  *(float *)a1 = (float)(a6 + a6) / (float)(a3 - a2);
  *(float *)(a1 + 20) = (float)(a6 + a6) / (float)(a5 - a4);
  *(float *)(a1 + 32) = (float)(a2 + a3) / (float)(a3 - a2);
  *(float *)(a1 + 36) = (float)(a4 + a5) / (float)(a5 - a4);
  *(_DWORD *)(a1 + 52) = 0;
  *(float *)(a1 + 40) = (float)-(float)(a6 + a7) / (float)(a7 - a6);
  *(float *)(a1 + 56) = (float)((float)(a7 * -2.0) * a6) / (float)(a7 - a6);
  *(_DWORD *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 4) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)&double result = 3212836864;
  *(void *)(a1 + 44) = 3212836864;
  *(_DWORD *)(a1 + 60) = 0;
  return result;
}

double DYMtxOrtho(uint64_t a1, float a2, float a3, float a4, float a5, float a6, float a7)
{
  *(float *)a1 = 2.0 / (float)(a3 - a2);
  *(float *)(a1 + 20) = 2.0 / (float)(a5 - a4);
  *(float *)(a1 + 48) = (float)-(float)(a2 + a3) / (float)(a3 - a2);
  *(float *)(a1 + 52) = (float)-(float)(a4 + a5) / (float)(a5 - a4);
  *(float *)(a1 + 40) = -2.0 / (float)(a7 - a6);
  *(float *)(a1 + 56) = (float)-(float)(a6 + a7) / (float)(a7 - a6);
  double result = 0.0;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 60) = 1065353216;
  return result;
}

float DYMtxGetColumnMajor(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 4);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 12);
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 20);
  *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a2 + 28) = *(_DWORD *)(a1 + 28);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a2 + 36) = *(_DWORD *)(a1 + 36);
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(a2 + 44) = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(a2 + 48) = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(a2 + 52) = *(_DWORD *)(a1 + 52);
  *(_DWORD *)(a2 + 56) = *(_DWORD *)(a1 + 56);
  float result = *(float *)(a1 + 60);
  *(float *)(a2 + 60) = result;
  return result;
}

float DYMtxSetColumnMajor(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  float result = *(float *)(a2 + 60);
  *(float *)(a1 + 60) = result;
  return result;
}

float *DYMtxInverse(float *result, int a2, uint64_t a3)
{
  float v3 = result[10];
  float v4 = result[14];
  float v5 = result[5];
  float v6 = result[6];
  float v7 = result[9];
  float v8 = result[13];
  float v9 = result[1];
  float v10 = result[2];
  float v11 = result[15];
  float v12 = result[11];
  float v13 = (float)(v3 * v11) - (float)(v12 * v4);
  v14.i32[1] = 0;
  float v15 = result[7];
  float v16 = (float)(v6 * v11) - (float)(v15 * v4);
  float v17 = (float)(v6 * v12) - (float)(v15 * v3);
  float v18 = (float)((float)((float)(v5 * v13) + 0.0) - (float)(v7 * v16)) + (float)(v8 * v17);
  float v19 = result[3];
  float v20 = (float)(v10 * v11) - (float)(v19 * v4);
  float v21 = (float)(v10 * v12) - (float)(v19 * v3);
  float v22 = (float)((float)((float)(v9 * v13) + 0.0) - (float)(v7 * v20)) + (float)(v8 * v21);
  float v23 = -v22;
  float v24 = (float)(v10 * v15) - (float)(v19 * v6);
  float32_t v25 = (float)((float)((float)(v9 * v16) + 0.0) - (float)(v5 * v20)) + (float)(v8 * v24);
  float v26 = (float)((float)((float)(v9 * v17) + 0.0) - (float)(v5 * v21)) + (float)(v7 * v24);
  float32_t v27 = -v26;
  float v28 = (float)((float)((float)((float)(v18 * *result) + 0.0) - (float)(v22 * result[4])) + (float)(v25 * result[8]))
      - (float)(v26 * result[12]);
  float v29 = result[10];
  float v30 = result[14];
  float v31 = result[6];
  float v32 = result[15];
  float v33 = result[11];
  float v34 = (float)(v29 * v32) - (float)(v33 * v30);
  float v35 = result[4];
  float v36 = result[7];
  float v37 = (float)(v31 * v32) - (float)(v36 * v30);
  float v38 = result[8];
  float v39 = (float)(v31 * v33) - (float)(v36 * v29);
  float v40 = result[12];
  float32_t v41 = -(float)((float)((float)((float)(v35 * v34) + 0.0) - (float)(v38 * v37)) + (float)(v40 * v39));
  float v42 = result[3];
  float v43 = (float)(v10 * v32) - (float)(v42 * v30);
  float v44 = (float)(v10 * v33) - (float)(v42 * v29);
  float v45 = (float)((float)((float)(*result * v34) + 0.0) - (float)(v38 * v43)) + (float)(v40 * v44);
  float v46 = (float)(v10 * v36) - (float)(v42 * v31);
  v89.f32[3] = v25;
  v90.f32[0] = -(float)((float)((float)((float)(*result * v37) + 0.0) - (float)(v35 * v43)) + (float)(v40 * v46));
  float v47 = result[9];
  float v48 = result[13];
  float v49 = v35;
  float v50 = result[5];
  float32_t v51 = (float)((float)((float)(*result * v39) + 0.0) - (float)(v35 * v44)) + (float)(v38 * v46);
  float v52 = v38;
  float v53 = v40;
  v90.f32[3] = v27;
  v91.f32[0] = v51;
  float v54 = result[1];
  float v55 = result[15];
  float v56 = result[11];
  float v57 = (float)(v47 * v55) - (float)(v56 * v48);
  float v58 = result[7];
  float v59 = (float)(v50 * v55) - (float)(v58 * v48);
  float v60 = (float)(v50 * v56) - (float)(v58 * v47);
  v86.f32[0] = v41;
  v86.f32[1] = (float)((float)((float)(v49 * v57) + 0.0) - (float)(v38 * v59)) + (float)(v53 * v60);
  float v61 = result[3];
  float v62 = (float)(v54 * v55) - (float)(v61 * v48);
  float v63 = (float)(v54 * v56) - (float)(v61 * v47);
  float v64 = result[4];
  float v65 = v50;
  float v66 = result[6];
  v89.f32[0] = v45;
  v89.f32[1] = -(float)((float)((float)((float)(*result * v57) + 0.0) - (float)(v52 * v62)) + (float)(v53 * v63));
  float v67 = (float)(v54 * v58) - (float)(v61 * v50);
  float v68 = (float)((float)((float)(*result * v59) + 0.0) - (float)(v49 * v62)) + (float)(v53 * v67);
  float v69 = -(float)((float)((float)((float)(*result * v60) + 0.0) - (float)(v49 * v63)) + (float)(v52 * v67));
  float v70 = result[9];
  float v71 = result[14];
  float v72 = result[10];
  float v73 = result[13];
  float v74 = (float)(v70 * v71) - (float)(v72 * v73);
  float v75 = (float)(v65 * v71) - (float)(v66 * v73);
  float v76 = result[8];
  float v77 = (float)(v65 * v72) - (float)(v66 * v70);
  float v78 = result[12];
  float v79 = result[1];
  float v87 = -(float)((float)((float)((float)(v64 * v74) + 0.0) - (float)(v76 * v75)) + (float)(v78 * v77));
  float v88 = v23;
  float v80 = result[2];
  float v81 = (float)(v79 * v71) - (float)(v80 * v73);
  float v82 = (float)(v79 * v72) - (float)(v80 * v70);
  v89.f32[2] = (float)((float)((float)(*result * v74) + 0.0) - (float)(v76 * v81)) + (float)(v78 * v82);
  float v83 = (float)(v79 * v66) - (float)(v80 * v65);
  v90.f32[1] = v68;
  v90.f32[2] = -(float)((float)((float)((float)(*result * v75) + 0.0) - (float)(v64 * v81)) + (float)(v78 * v83));
  v91.f32[1] = v69;
  float v92 = (float)((float)((float)(*result * v77) + 0.0) - (float)(v64 * v82)) + (float)(v76 * v83);
  if (v28 != 0.0)
  {
    *(float *)v14.i32 = 1.0 / v28;
    *(float *)a3 = (float)(1.0 / v28) * v18;
    float v84 = (float)(1.0 / v28) * v88;
    if (a2)
    {
      float32x2_t v85 = (float32x2_t)vdupq_lane_s32(v14, 0).u64[0];
      *(float32x2_t *)(a3 + 4) = vmul_f32(v85, v86);
      *(float32x2_t *)(a3 + 52) = vmul_f32(v85, v91);
      *(float *)(a3 + 12) = *(float *)v14.i32 * v87;
      *(float *)(a3 + 16) = v84;
      *(float32x4_t *)(a3 + 20) = vmulq_n_f32(v89, *(float *)v14.i32);
      *(float32x4_t *)(a3 + 36) = vmulq_n_f32(v90, *(float *)v14.i32);
    }
    else
    {
      *(float *)(a3 + 4) = v84;
      *(float *)(a3 + 8) = *(float *)v14.i32 * v89.f32[3];
      *(float *)(a3 + 12) = *(float *)v14.i32 * v90.f32[3];
      *(float *)(a3 + 16) = *(float *)v14.i32 * v86.f32[0];
      *(float *)(a3 + 20) = *(float *)v14.i32 * v45;
      *(float *)(a3 + 24) = *(float *)v14.i32 * v90.f32[0];
      *(float *)(a3 + 28) = *(float *)v14.i32 * v91.f32[0];
      *(float *)(a3 + 32) = *(float *)v14.i32 * v86.f32[1];
      *(float *)(a3 + 36) = *(float *)v14.i32 * v89.f32[1];
      *(float *)(a3 + 40) = *(float *)v14.i32 * v68;
      *(float *)(a3 + 44) = *(float *)v14.i32 * v69;
      *(float *)(a3 + 48) = *(float *)v14.i32 * v87;
      *(float *)(a3 + 52) = *(float *)v14.i32 * v89.f32[2];
      *(float *)(a3 + 56) = *(float *)v14.i32 * v90.f32[2];
    }
    *(float *)(a3 + 60) = *(float *)v14.i32 * v92;
  }
  return result;
}

float DYMtxNormalizedFrobeniusNormDelta(float *a1, float *a2)
{
  float v2 = *a1;
  float v3 = a1[1];
  float v35 = *a2;
  float v4 = a1[4];
  float v5 = a1[5];
  float v6 = a2[4];
  float v33 = a2[1];
  float v34 = a2[5];
  float v7 = a1[8];
  float v8 = a1[9];
  float v10 = a2[8];
  float v9 = a2[9];
  float v11 = a1[12];
  float v12 = a1[13];
  float v14 = a2[12];
  float v13 = a2[13];
  float v15 = a1[2];
  float v16 = a1[3];
  float v17 = a2[2];
  float v18 = a2[3];
  float v19 = a1[6];
  float v20 = a1[7];
  float v21 = a2[6];
  float v22 = a2[7];
  float v23 = a1[10];
  float v24 = a1[11];
  float v25 = a2[10];
  float v26 = a2[11];
  float v28 = a1[14];
  float v27 = a1[15];
  float v29 = a2[14];
  float v30 = a2[15];
  float v31 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v2 - v35) * (float)(v2 - v35)) + 0.0) + (float)((float)(v4 - v6) * (float)(v4 - v6))) + (float)((float)(v7 - v10) * (float)(v7 - v10))) + (float)((float)(v11 - v14) * (float)(v11 - v14)))
                                                                                              + (float)((float)(v3 - v33) * (float)(v3 - v33)))
                                                                                      + (float)((float)(v5 - v34)
                                                                                              * (float)(v5 - v34)))
                                                                              + (float)((float)(v8 - v9)
                                                                                      * (float)(v8 - v9)))
                                                                      + (float)((float)(v12 - v13) * (float)(v12 - v13)))
                                                              + (float)((float)(v15 - v17) * (float)(v15 - v17)))
                                                      + (float)((float)(v19 - v21) * (float)(v19 - v21)))
                                              + (float)((float)(v23 - v25) * (float)(v23 - v25)))
                                      + (float)((float)(v28 - v29) * (float)(v28 - v29)))
                              + (float)((float)(v16 - v18) * (float)(v16 - v18)))
                      + (float)((float)(v20 - v22) * (float)(v20 - v22)))
              + (float)((float)(v24 - v26) * (float)(v24 - v26)))
      + (float)((float)(v27 - v30) * (float)(v27 - v30));
  return sqrtf(v31)
       / (float)((float)(sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v2 * v2) + 0.0) + (float)(v4 * v4)) + (float)(v7 * v7)) + (float)(v11 * v11)) + (float)(v3 * v3)) + (float)(v5 * v5))+ (float)(v8 * v8))+ (float)(v12 * v12))+ (float)(v15 * v15))+ (float)(v19 * v19))+ (float)(v23 * v23))+ (float)(v28 * v28))+ (float)(v16 * v16))+ (float)(v20 * v20))+ (float)(v24 * v24))+ (float)(v27 * v27))+ sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v35 * v35) + 0.0) + (float)(v6 * v6)) + (float)(v10 * v10)) + (float)(v14 * v14)) + (float)(v33 * v33)) + (float)(v34 * v34))+ (float)(v9 * v9))+ (float)(v13 * v13))+ (float)(v17 * v17))+ (float)(v21 * v21))+ (float)(v25 * v25))+ (float)(v29 * v29))
                                                 + (float)(v18 * v18))
                                         + (float)(v22 * v22))
                                 + (float)(v26 * v26))
                         + (float)(v30 * v30)))
               * 0.5);
}

BOOL DYMtxDecomposition(float *a1, uint64_t a2, uint64_t a3, float *a4, float *a5)
{
  long long v178 = 0u;
  long long v179 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  float v10 = a1[3];
  float v11 = a1[7];
  float v12 = a1[11];
  float v13 = a1[15];
  long long v14 = *((_OWORD *)a1 + 1);
  long long v173 = *(_OWORD *)a1;
  long long v174 = v14;
  *(_OWORD *)v175 = *((_OWORD *)a1 + 2);
  *(_OWORD *)&v175[12] = *(_OWORD *)(a1 + 11);
  HIDWORD(v173) = 0;
  HIDWORD(v174) = 0;
  *(_DWORD *)&v175[12] = 0;
  *(_DWORD *)&v175[28] = 1065353216;
  DYMtxInverse((float *)&v173, 1, (uint64_t)&v176);
  BOOL result = 0;
  if (fabsf(v16) >= 0.0001)
  {
    float v17 = (float)((float)((float)(*(float *)&v177 * v11) + (float)(*(float *)&v176 * v10))
                + (float)(*(float *)&v178 * v12))
        + (float)(*(float *)&v179 * v13);
    float v18 = (float)((float)((float)(v11 * *((float *)&v177 + 1)) + (float)(*((float *)&v176 + 1) * v10))
                + (float)(*((float *)&v178 + 1) * v12))
        + (float)(*((float *)&v179 + 1) * v13);
    float v19 = (float)((float)((float)(v11 * *((float *)&v177 + 2)) + (float)(*((float *)&v176 + 2) * v10))
                + (float)(*((float *)&v178 + 2) * v12))
        + (float)(*((float *)&v179 + 2) * v13);
    float v20 = (float)((float)((float)(v11 * *((float *)&v177 + 3)) + (float)(*((float *)&v176 + 3) * v10))
                + (float)(*((float *)&v178 + 3) * v12))
        + (float)(*((float *)&v179 + 3) * v13);
    *(void *)a2 = 1065353216;
    *(void *)(a2 + 16) = 0x3F80000000000000;
    *(void *)(a2 + 32) = 0;
    *(void *)(a2 + 48) = 0;
    *(_DWORD *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 40) = 1065353216;
    *(_DWORD *)(a2 + 56) = 0;
    *(float *)(a2 + 12) = v17;
    *(float *)(a2 + 28) = v18;
    *(float *)(a2 + 44) = v19;
    *(float *)(a2 + 60) = v20;
    int v21 = *(_DWORD *)&v175[24];
    *(_OWORD *)a3 = xmmword_24F6954E0;
    *(_OWORD *)(a3 + 16) = xmmword_24F6954F0;
    *(_OWORD *)(a3 + 32) = xmmword_24F695500;
    *(void *)(a3 + 48) = *(void *)&v175[16];
    *(_DWORD *)(a3 + 56) = v21;
    *(_DWORD *)(a3 + 60) = 1065353216;
    *(_OWORD *)&v175[16] = xmmword_24F695510;
    *((_OWORD *)a4 + 2) = *(_OWORD *)v175;
    *((_OWORD *)a4 + 3) = xmmword_24F695510;
    long long v22 = v174;
    *(_OWORD *)a4 = v173;
    *((_OWORD *)a4 + 1) = v22;
    int v23 = 19;
    do
    {
      long long v171 = 0u;
      long long v172 = 0u;
      long long v169 = 0u;
      long long v170 = 0u;
      DYMtxInverse(a4, 1, (uint64_t)&v169);
      float v24 = a4[1];
      float v26 = a4[4];
      float v25 = a4[5];
      float v28 = a4[8];
      float v27 = a4[9];
      float v30 = a4[12];
      float v29 = a4[13];
      float v31 = a4[2];
      float v32 = a4[3];
      float v34 = a4[6];
      float v33 = a4[7];
      float v35 = (float)(*a4 + *(float *)&v169) * 0.5;
      float v36 = (float)(v26 + *(float *)&v170) * 0.5;
      float v37 = (float)(v28 + *(float *)&v171) * 0.5;
      float v38 = (float)((float)((float)((float)(v35 - *a4) * (float)(v35 - *a4)) + 0.0)
                  + (float)((float)(v36 - v26) * (float)(v36 - v26)))
          + (float)((float)(v37 - v28) * (float)(v37 - v28));
      float v39 = (float)(v30 + *(float *)&v172) * 0.5;
      float v40 = (float)(v24 + *((float *)&v169 + 1)) * 0.5;
      float v41 = (float)(v38 + (float)((float)(v39 - v30) * (float)(v39 - v30)))
          + (float)((float)(v40 - v24) * (float)(v40 - v24));
      float v42 = a4[10];
      float v43 = a4[11];
      float v44 = (float)(v25 + *((float *)&v170 + 1)) * 0.5;
      float v45 = (float)(v27 + *((float *)&v171 + 1)) * 0.5;
      float v46 = (float)(v29 + *((float *)&v172 + 1)) * 0.5;
      float v47 = (float)(v31 + *((float *)&v169 + 2)) * 0.5;
      float v48 = (float)((float)((float)(v41 + (float)((float)(v44 - v25) * (float)(v44 - v25)))
                          + (float)((float)(v45 - v27) * (float)(v45 - v27)))
                  + (float)((float)(v46 - v29) * (float)(v46 - v29)))
          + (float)((float)(v47 - v31) * (float)(v47 - v31));
      float v49 = a4[14];
      float v50 = a4[15];
      float v51 = (float)(v34 + *((float *)&v170 + 2)) * 0.5;
      float v52 = (float)(v42 + *((float *)&v171 + 2)) * 0.5;
      float v53 = (float)(v48 + (float)((float)(v51 - v34) * (float)(v51 - v34)))
          + (float)((float)(v52 - v42) * (float)(v52 - v42));
      float v54 = (float)(v49 + *((float *)&v172 + 2)) * 0.5;
      float v55 = v53 + (float)((float)(v54 - v49) * (float)(v54 - v49));
      float v56 = (float)(v32 + *((float *)&v169 + 3)) * 0.5;
      float v57 = v55 + (float)((float)(v56 - v32) * (float)(v56 - v32));
      float v58 = (float)(v33 + *((float *)&v170 + 3)) * 0.5;
      float v59 = (float)(v43 + *((float *)&v171 + 3)) * 0.5;
      float v60 = (float)(v57 + (float)((float)(v58 - v33) * (float)(v58 - v33)))
          + (float)((float)(v59 - v43) * (float)(v59 - v43));
      float v61 = (float)(v50 + *((float *)&v172 + 3)) * 0.5;
      *a4 = v35;
      a4[1] = v40;
      a4[2] = v47;
      a4[3] = v56;
      a4[4] = v36;
      a4[5] = v44;
      a4[6] = v51;
      a4[7] = v58;
      a4[8] = v37;
      a4[9] = v45;
      a4[10] = v52;
      a4[11] = v59;
      a4[12] = v39;
      a4[13] = v46;
      a4[14] = v54;
      a4[15] = v61;
    }
    while (sqrtf(v60 + (float)((float)(v61 - v50) * (float)(v61 - v50))) >= 0.000001 && v23-- != 0);
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    DYMtxInverse(a4, 0, (uint64_t)&v169);
    float v63 = (float)((float)((float)((float)(*(float *)&v169 * *(float *)&v174) + 0.0)
                        + (float)(*(float *)&v170 * *((float *)&v174 + 1)))
                + (float)(*(float *)&v171 * *((float *)&v174 + 2)))
        + (float)(*(float *)&v172 * 0.0);
    float v64 = (float)((float)((float)((float)(*(float *)&v169 * *(float *)v175) + 0.0)
                        + (float)(*(float *)&v170 * *(float *)&v175[4]))
                + (float)(*(float *)&v171 * *(float *)&v175[8]))
        + (float)(*(float *)&v172 * 0.0);
    float v65 = *(float *)&v172
        + (float)((float)((float)((float)(*(float *)&v169 * *(float *)&v175[16]) + 0.0) + (float)(*(float *)&v170 * 0.0))
                + (float)(*(float *)&v171 * 0.0));
    float v66 = (float)((float)((float)((float)(*((float *)&v169 + 1) * *(float *)&v173) + 0.0)
                        + (float)(*((float *)&v170 + 1) * *((float *)&v173 + 1)))
                + (float)(*((float *)&v171 + 1) * *((float *)&v173 + 2)))
        + (float)(*((float *)&v172 + 1) * *((float *)&v173 + 3));
    float v67 = (float)((float)((float)((float)(*((float *)&v169 + 1) * *(float *)&v174) + 0.0)
                        + (float)(*((float *)&v170 + 1) * *((float *)&v174 + 1)))
                + (float)(*((float *)&v171 + 1) * *((float *)&v174 + 2)))
        + (float)(*((float *)&v172 + 1) * 0.0);
    float v68 = (float)((float)((float)((float)(*((float *)&v169 + 1) * *(float *)v175) + 0.0)
                        + (float)(*((float *)&v170 + 1) * *(float *)&v175[4]))
                + (float)(*((float *)&v171 + 1) * *(float *)&v175[8]))
        + (float)(*((float *)&v172 + 1) * 0.0);
    float v69 = *((float *)&v172 + 1)
        + (float)((float)((float)((float)(*((float *)&v169 + 1) * *(float *)&v175[16]) + 0.0)
                        + (float)(*((float *)&v170 + 1) * 0.0))
                + (float)(*((float *)&v171 + 1) * 0.0));
    float v70 = *((float *)&v171 + 3);
    float v71 = *((float *)&v172 + 3);
    float v72 = (float)((float)((float)((float)(*((float *)&v169 + 2) * *(float *)&v173) + 0.0)
                        + (float)(*((float *)&v170 + 2) * *((float *)&v173 + 1)))
                + (float)(*((float *)&v171 + 2) * *((float *)&v173 + 2)))
        + (float)(*((float *)&v172 + 2) * *((float *)&v173 + 3));
    float v73 = (float)((float)((float)((float)(*((float *)&v169 + 2) * *(float *)&v174) + 0.0)
                        + (float)(*((float *)&v170 + 2) * *((float *)&v174 + 1)))
                + (float)(*((float *)&v171 + 2) * *((float *)&v174 + 2)))
        + (float)(*((float *)&v172 + 2) * 0.0);
    float v74 = (float)((float)((float)((float)(*((float *)&v169 + 2) * *(float *)v175) + 0.0)
                        + (float)(*((float *)&v170 + 2) * *(float *)&v175[4]))
                + (float)(*((float *)&v171 + 2) * *(float *)&v175[8]))
        + (float)(*((float *)&v172 + 2) * 0.0);
    float v75 = *((float *)&v172 + 2)
        + (float)((float)((float)((float)(*((float *)&v169 + 2) * *(float *)&v175[16]) + 0.0)
                        + (float)(*((float *)&v170 + 2) * 0.0))
                + (float)(*((float *)&v171 + 2) * 0.0));
    float v76 = (float)((float)((float)((float)(*((float *)&v169 + 3) * *(float *)&v173) + 0.0)
                        + (float)(*((float *)&v170 + 3) * *((float *)&v173 + 1)))
                + (float)(*((float *)&v171 + 3) * *((float *)&v173 + 2)))
        + (float)(*((float *)&v172 + 3) * *((float *)&v173 + 3));
    float v77 = (float)((float)((float)((float)(*((float *)&v169 + 3) * *(float *)&v174) + 0.0)
                        + (float)(*((float *)&v170 + 3) * *((float *)&v174 + 1)))
                + (float)(*((float *)&v171 + 3) * *((float *)&v174 + 2)))
        + (float)(*((float *)&v172 + 3) * 0.0);
    float v78 = (float)((float)((float)((float)(*((float *)&v169 + 3) * *(float *)v175) + 0.0)
                        + (float)(*((float *)&v170 + 3) * *(float *)&v175[4]))
                + (float)(*((float *)&v171 + 3) * *(float *)&v175[8]))
        + (float)(*((float *)&v172 + 3) * 0.0);
    float v79 = (float)((float)(*((float *)&v169 + 3) * *(float *)&v175[16]) + 0.0) + (float)(*((float *)&v170 + 3) * 0.0);
    *a5 = (float)((float)((float)((float)(*(float *)&v169 * *(float *)&v173) + 0.0)
                        + (float)(*(float *)&v170 * *((float *)&v173 + 1)))
                + (float)(*(float *)&v171 * *((float *)&v173 + 2)))
        + (float)(*(float *)&v172 * *((float *)&v173 + 3));
    a5[1] = v66;
    a5[2] = v72;
    a5[3] = v76;
    a5[4] = v63;
    a5[5] = v67;
    a5[6] = v73;
    a5[7] = v77;
    a5[8] = v64;
    a5[9] = v68;
    a5[10] = v74;
    a5[11] = v78;
    a5[12] = v65;
    a5[13] = v69;
    a5[14] = v75;
    a5[15] = v71 + (float)(v79 + (float)(v70 * 0.0));
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    DYMtxConcat(a4, a5, (float *)&v165);
    float v80 = *(float *)(a3 + 4);
    float v81 = *(float *)(a3 + 16);
    float v82 = *(float *)(a3 + 20);
    float v83 = *(float *)(a3 + 32);
    float v84 = *(float *)(a3 + 36);
    float v85 = *(float *)(a3 + 48);
    float v86 = *(float *)(a3 + 52);
    float v161 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v165) + 0.0) + (float)(v81 * *((float *)&v165 + 1)))
                 + (float)(v83 * *((float *)&v165 + 2)))
         + (float)(v85 * *((float *)&v165 + 3));
    float v163 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v166) + 0.0) + (float)(v81 * *((float *)&v166 + 1)))
                 + (float)(v83 * *((float *)&v166 + 2)))
         + (float)(v85 * *((float *)&v166 + 3));
    float v162 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v167) + 0.0) + (float)(v81 * *((float *)&v167 + 1)))
                 + (float)(v83 * *((float *)&v167 + 2)))
         + (float)(v85 * *((float *)&v167 + 3));
    float v87 = (float)((float)((float)((float)(*(float *)a3 * *(float *)&v168) + 0.0) + (float)(v81 * *((float *)&v168 + 1)))
                + (float)(v83 * *((float *)&v168 + 2)))
        + (float)(v85 * *((float *)&v168 + 3));
    float v88 = (float)((float)((float)((float)(v80 * *(float *)&v165) + 0.0) + (float)(v82 * *((float *)&v165 + 1)))
                + (float)(v84 * *((float *)&v165 + 2)))
        + (float)(v86 * *((float *)&v165 + 3));
    float v159 = (float)((float)((float)((float)(v80 * *(float *)&v166) + 0.0) + (float)(v82 * *((float *)&v166 + 1)))
                 + (float)(v84 * *((float *)&v166 + 2)))
         + (float)(v86 * *((float *)&v166 + 3));
    float v160 = v87;
    float v89 = (float)((float)((float)((float)(v80 * *(float *)&v167) + 0.0) + (float)(v82 * *((float *)&v167 + 1)))
                + (float)(v84 * *((float *)&v167 + 2)))
        + (float)(v86 * *((float *)&v167 + 3));
    float v90 = (float)((float)((float)((float)(v80 * *(float *)&v168) + 0.0) + (float)(v82 * *((float *)&v168 + 1)))
                + (float)(v84 * *((float *)&v168 + 2)))
        + (float)(v86 * *((float *)&v168 + 3));
    float v91 = *(float *)(a3 + 8);
    float v92 = *(float *)(a3 + 12);
    float v94 = *(float *)(a3 + 24);
    float v93 = *(float *)(a3 + 28);
    float v95 = (float)((float)(v91 * *(float *)&v165) + 0.0) + (float)(v94 * *((float *)&v165 + 1));
    float v96 = (float)((float)(v91 * *(float *)&v166) + 0.0) + (float)(v94 * *((float *)&v166 + 1));
    float v97 = (float)((float)(v91 * *(float *)&v167) + 0.0) + (float)(v94 * *((float *)&v167 + 1));
    float v98 = (float)((float)(v91 * *(float *)&v168) + 0.0) + (float)(v94 * *((float *)&v168 + 1));
    float v100 = *(float *)(a3 + 40);
    float v99 = *(float *)(a3 + 44);
    float v101 = v95 + (float)(v100 * *((float *)&v165 + 2));
    float v102 = v96 + (float)(v100 * *((float *)&v166 + 2));
    float v103 = v97 + (float)(v100 * *((float *)&v167 + 2));
    float v104 = v98 + (float)(v100 * *((float *)&v168 + 2));
    float v106 = *(float *)(a3 + 56);
    float v105 = *(float *)(a3 + 60);
    float v107 = v101 + (float)(v106 * *((float *)&v165 + 3));
    float v108 = v102 + (float)(v106 * *((float *)&v166 + 3));
    float v109 = v103 + (float)(v106 * *((float *)&v167 + 3));
    float v110 = v104 + (float)(v106 * *((float *)&v168 + 3));
    float v111 = (float)((float)((float)((float)(v92 * *(float *)&v165) + 0.0) + (float)(v93 * *((float *)&v165 + 1)))
                 + (float)(v99 * *((float *)&v165 + 2)))
         + (float)(v105 * *((float *)&v165 + 3));
    float v112 = (float)((float)((float)((float)(v92 * *(float *)&v166) + 0.0) + (float)(v93 * *((float *)&v166 + 1)))
                 + (float)(v99 * *((float *)&v166 + 2)))
         + (float)(v105 * *((float *)&v166 + 3));
    float v113 = (float)((float)((float)((float)(v92 * *(float *)&v167) + 0.0) + (float)(v93 * *((float *)&v167 + 1)))
                 + (float)(v99 * *((float *)&v167 + 2)))
         + (float)(v105 * *((float *)&v167 + 3));
    float v114 = (float)((float)((float)((float)(v92 * *(float *)&v168) + 0.0) + (float)(v93 * *((float *)&v168 + 1)))
                 + (float)(v99 * *((float *)&v168 + 2)))
         + (float)(v105 * *((float *)&v168 + 3));
    float v115 = *(float *)(a2 + 4);
    float v116 = *(float *)(a2 + 16);
    float v117 = *(float *)(a2 + 20);
    float v119 = *(float *)(a2 + 32);
    float v118 = *(float *)(a2 + 36);
    float v121 = *(float *)(a2 + 48);
    float v120 = *(float *)(a2 + 52);
    float v156 = (float)((float)((float)((float)(*(float *)a2 * v161) + 0.0) + (float)(v116 * v88)) + (float)(v119 * v107))
         + (float)(v121 * v111);
    float v158 = (float)((float)((float)((float)(*(float *)a2 * v163) + 0.0) + (float)(v116 * v159)) + (float)(v119 * v108))
         + (float)(v121 * v112);
    float v157 = (float)((float)((float)((float)(*(float *)a2 * v162) + 0.0) + (float)(v116 * v89)) + (float)(v119 * v109))
         + (float)(v121 * v113);
    float v164 = (float)((float)((float)((float)(*(float *)a2 * v160) + 0.0) + (float)(v116 * v90)) + (float)(v119 * v110))
         + (float)(v121 * v114);
    float v122 = (float)((float)((float)((float)(v115 * v161) + 0.0) + (float)(v117 * v88)) + (float)(v118 * v107))
         + (float)(v120 * v111);
    float v123 = (float)((float)((float)((float)(v115 * v163) + 0.0) + (float)(v117 * v159)) + (float)(v118 * v108))
         + (float)(v120 * v112);
    float v124 = (float)((float)((float)((float)(v115 * v162) + 0.0) + (float)(v117 * v89)) + (float)(v118 * v109))
         + (float)(v120 * v113);
    float v125 = (float)((float)((float)((float)(v115 * v160) + 0.0) + (float)(v117 * v90)) + (float)(v118 * v110))
         + (float)(v120 * v114);
    float v126 = *(float *)(a2 + 8);
    float v127 = *(float *)(a2 + 12);
    float v128 = *(float *)(a2 + 24);
    float v129 = *(float *)(a2 + 28);
    float v130 = (float)((float)(v126 * v161) + 0.0) + (float)(v128 * v88);
    float v131 = (float)((float)(v126 * v163) + 0.0) + (float)(v128 * v159);
    float v132 = (float)((float)(v126 * v162) + 0.0) + (float)(v128 * v89);
    float v133 = (float)((float)(v126 * v160) + 0.0) + (float)(v128 * v90);
    float v134 = *(float *)(a2 + 40);
    float v135 = *(float *)(a2 + 44);
    float v136 = v130 + (float)(v134 * v107);
    float v137 = v131 + (float)(v134 * v108);
    float v138 = v132 + (float)(v134 * v109);
    float v139 = v133 + (float)(v134 * v110);
    float v141 = *(float *)(a2 + 56);
    float v140 = *(float *)(a2 + 60);
    float v142 = v136 + (float)(v141 * v111);
    float v143 = v137 + (float)(v141 * v112);
    float v144 = v138 + (float)(v141 * v113);
    float v145 = v139 + (float)(v141 * v114);
    float v146 = (float)((float)((float)((float)(v127 * v161) + 0.0) + (float)(v129 * v88)) + (float)(v135 * v107))
         + (float)(v140 * v111);
    float v147 = (float)((float)((float)((float)(v127 * v163) + 0.0) + (float)(v129 * v159)) + (float)(v135 * v108))
         + (float)(v140 * v112);
    float v148 = (float)((float)((float)((float)(v127 * v162) + 0.0) + (float)(v129 * v89)) + (float)(v135 * v109))
         + (float)(v140 * v113);
    float v149 = (float)((float)((float)((float)(v127 * v160) + 0.0) + (float)(v129 * v90)) + (float)(v135 * v110))
         + (float)(v140 * v114);
    float v150 = a1[3];
    float v151 = v142 - a1[2];
    float v152 = a1[7];
    float v153 = a1[11];
    float v154 = a1[15];
    float v155 = (float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v156 - *a1) * (float)(v156 - *a1)) + 0.0) + (float)((float)(v158 - a1[4]) * (float)(v158 - a1[4]))) + (float)((float)(v157 - a1[8]) * (float)(v157 - a1[8]))) + (float)((float)(v164 - a1[12]) * (float)(v164 - a1[12])))
                                                                                                 + (float)((float)(v122 - a1[1]) * (float)(v122 - a1[1])))
                                                                                         + (float)((float)(v123 - a1[5])
                                                                                                 * (float)(v123 - a1[5])))
                                                                                 + (float)((float)(v124 - a1[9])
                                                                                         * (float)(v124 - a1[9])))
                                                                         + (float)((float)(v125 - a1[13])
                                                                                 * (float)(v125 - a1[13])))
                                                                 + (float)(v151 * v151))
                                                         + (float)((float)(v143 - a1[6]) * (float)(v143 - a1[6])))
                                                 + (float)((float)(v144 - a1[10]) * (float)(v144 - a1[10])))
                                         + (float)((float)(v145 - a1[14]) * (float)(v145 - a1[14])))
                                 + (float)((float)(v146 - v150) * (float)(v146 - v150)))
                         + (float)((float)(v147 - v152) * (float)(v147 - v152)))
                 + (float)((float)(v148 - v153) * (float)(v148 - v153)))
         + (float)((float)(v149 - v154) * (float)(v149 - v154));
    return (float)(sqrtf(v155)
                 / sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v156 * v156) + 0.0) + (float)(v158 * v158)) + (float)(v157 * v157)) + (float)(v164 * v164)) + (float)(v122 * v122)) + (float)(v123 * v123))+ (float)(v124 * v124))+ (float)(v125 * v125))+ (float)(v142 * v142))+ (float)(v143 * v143))+ (float)(v144 * v144))+ (float)(v145 * v145))+ (float)(v146 * v146))+ (float)(v147 * v147))+ (float)(v148 * v148))+ (float)(v149 * v149))) <= 0.0001;
  }
  return result;
}

uint64_t DYMtxTridiagonalDecomposition(float *a1, float *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, int32x4_t _Q6)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v185 = *MEMORY[0x263EF8340];
  long long v179 = 0u;
  long long v180 = 0u;
  int32x4_t v177 = 0u;
  long long v178 = 0u;
  long long v15 = *((_OWORD *)a1 + 3);
  long long v17 = *(_OWORD *)a1;
  long long v16 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(a3 + 32) = *((_OWORD *)a1 + 2);
  *(_OWORD *)(a3 + 48) = v15;
  *(_OWORD *)a3 = v17;
  *(_OWORD *)(a3 + 16) = v16;
  *(_OWORD *)a2 = xmmword_24F6954E0;
  *((_OWORD *)a2 + 1) = xmmword_24F6954F0;
  char v18 = 1;
  *((_OWORD *)a2 + 2) = xmmword_24F695500;
  *((_OWORD *)a2 + 3) = xmmword_24F695510;
  do
  {
    char v19 = v18;
    float32x4_t v181 = 0uLL;
    uint64_t v20 = a3 + 4 * v14 + 1 * v13;
    float v21 = *(float *)(v20 + 16);
    v181.f32[v13 + 1] = v21;
    float v22 = (float)(v21 * v21) + 0.0;
    if (v13 != 2)
    {
      float v23 = *(float *)(v20 + 32);
      v181.f32[v13 + 2] = v23;
      float v22 = v22 + (float)(v23 * v23);
      if (v13 != 1)
      {
        float v24 = *(float *)(a3 + 4 * v14 + 1 * v13 + 48);
        v181.f32[v13 + 3] = v24;
        float v22 = v22 + (float)(v24 * v24);
      }
    }
    v181.f32[v14 + 1] = sqrtf(v22) + v181.f32[v14 + 1];
    _S1 = v181.i32[1];
    __asm { FMLA            S3, S1, V2.S[1] }
    _S0 = v181.i32[2];
    __asm { FMLA            S3, S0, V2.S[2] }
    _S0 = v181.i32[3];
    __asm { FMLA            S3, S0, V2.S[3] }
    if (_S3 >= 1.0e-10)
    {
      *(float *)&a8 = _S3 * 0.5;
      _Q7 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a8, 0);
      _Q0 = (int32x4_t)vsubq_f32((float32x4_t)xmmword_24F6954E0, vdivq_f32(vmulq_n_f32(v181, v181.f32[0]), _Q7));
      _Q6.i32[0] = *(_DWORD *)a3;
      _S29 = *(_DWORD *)(a3 + 4);
      __asm { FMLA            S3, S29, V0.S[1] }
      _S22 = *(_DWORD *)(a3 + 8);
      _S20 = *(float *)(a3 + 12);
      __asm
      {
        FMLA            S3, S22, V0.S[2]
        FMLA            S3, S20, V0.S[3]
      }
      _S24 = *(_DWORD *)(a3 + 16);
      _S21 = *(_DWORD *)(a3 + 20);
      __asm { FMLA            S5, S21, V0.S[1] }
      _S23 = *(_DWORD *)(a3 + 24);
      _S27 = *(float *)(a3 + 28);
      __asm
      {
        FMLA            S5, S23, V0.S[2]
        FMLA            S5, S27, V0.S[3]
      }
      _S30 = *(_DWORD *)(a3 + 32);
      _S28 = *(_DWORD *)(a3 + 36);
      __asm { FMLA            S17, S28, V0.S[1] }
      _S25 = *(_DWORD *)(a3 + 40);
      _S26 = *(float *)(a3 + 44);
      __asm
      {
        FMLA            S17, S25, V0.S[2]
        FMLA            S17, S26, V0.S[3]
        FMLA            S16, S6, V0.S[1]
      }
      *(float *)&unsigned int v58 = 1.0 - (float)((float)(v181.f32[1] * v181.f32[1]) / *(float *)&a8);
      __asm
      {
        FMLA            S16, S6, V0.S[2]
        FMLA            S31, S6, V0.S[3]
      }
      _D13 = (float32x2_t)vextq_s8((int8x16_t)v181, (int8x16_t)v181, 8uLL).u64[0];
      *(float32x2_t *)_Q6.i8 = vsub_f32(0, vdiv_f32(vmul_lane_f32(_D13, *(float32x2_t *)v181.f32, 1), *(float32x2_t *)_Q7.f32));
      __asm { FMLA            S31, S29, V6.S[1] }
      _S15 = *(_DWORD *)(a3 + 48);
      _S9 = *(_DWORD *)(a3 + 52);
      __asm { FMLA            S14, S9, V0.S[1] }
      _D2 = (int32x2_t)vsub_f32((float32x2_t)1065353216, vdiv_f32(vmul_laneq_f32(_D13, v181, 2), *(float32x2_t *)_Q7.f32));
      __asm
      {
        FMLA            S18, S20, V6.S[1]
        FMLA            S31, S22, V2.S[1]
        FMLA            S7, S24, V0.S[1]
        FMLA            S13, S27, V6.S[1]
        FMLA            S16, S20, V2.S[1]
        FMLA            S29, S24, V0.S[2]
      }
      float v71 = 1.0 - (float)((float)(v181.f32[3] * v181.f32[3]) / *(float *)&a8);
      _Q7.f32[0] = _S31 + (float)(v71 * _S20);
      __asm
      {
        FMLA            S19, S24, V0.S[3]
        FMLA            S20, S30, V0.S[1]
        FMLA            S29, S27, V2.S[1]
        FMLA            S19, S21, V6.S[1]
        FMLA            S31, S30, V0.S[2]
        FMLA            S19, S23, V2.S[1]
      }
      _S19 = _S19 + (float)(v71 * _S27);
      __asm { FMLA            S21, S30, V0.S[3] }
      _S22 = *(_DWORD *)(a3 + 56);
      _S23 = *(float *)(a3 + 60);
      __asm
      {
        FMLA            S14, S22, V0.S[2]
        FMLA            S14, S23, V0.S[3]
        FMLA            S30, S26, V6.S[1]
        FMLA            S21, S28, V6.S[1]
        FMLA            S20, S15, V0.S[1]
        FMLA            S28, S23, V6.S[1]
        FMLA            S31, S26, V2.S[1]
        FMLA            S21, S25, V2.S[1]
        FMLA            S27, S15, V0.S[2]
        FMLA            S27, S23, V2.S[1]
      }
      _S20 = _S21 + (float)(v71 * _S26);
      __asm
      {
        FMLA            S21, S15, V0.S[3]
        FMLA            S21, S9, V6.S[1]
        FMLA            S21, S22, V2.S[1]
      }
      _S22 = _S21 + (float)(v71 * _S23);
      __asm
      {
        FMLA            S21, S5, V0.S[1]
        FMLA            S21, S17, V0.S[2]
        FMLA            S21, S14, V0.S[3]
        FMLA            S23, S3, V0.S[1]
      }
      *(void *)&long long v178 = __PAIR64__(v58, _Q0.u32[1]);
      __asm
      {
        FMLA            S23, S14, V6.S[1]
        FMLA            S24, S3, V0.S[2]
      }
      *(int32x2_t *)((char *)&v180 + 4) = vzip2_s32(*(int32x2_t *)_Q6.i8, _D2);
      __asm
      {
        FMLA            S24, S14, V2.S[1]
        FMLA            S25, S3, V0.S[3]
        FMLA            S25, S5, V6.S[1]
        FMLA            S25, S17, V2.S[1]
      }
      float v107 = _S25 + (float)(_S14 * v71);
      __asm
      {
        FMLA            S5, S13, V0.S[1]
        FMLA            S5, S30, V0.S[2]
        FMLA            S5, S28, V0.S[3]
        FMLA            S17, S18, V0.S[1]
        FMLA            S17, S28, V6.S[1]
        FMLA            S25, S18, V0.S[2]
        FMLA            S25, S28, V2.S[1]
        FMLA            S26, S18, V0.S[3]
        FMLA            S26, S13, V6.S[1]
        FMLA            S26, S30, V2.S[1]
      }
      float v118 = _S26 + (float)(_S28 * v71);
      __asm
      {
        FMLA            S26, S29, V0.S[1]
        FMLA            S26, S31, V0.S[2]
        FMLA            S26, S27, V0.S[3]
        FMLA            S28, S16, V0.S[1]
        FMLA            S28, S27, V6.S[1]
        FMLA            S30, S16, V0.S[2]
        FMLA            S30, S27, V2.S[1]
        FMLA            S9, S16, V0.S[3]
        FMLA            S9, S29, V6.S[1]
        FMLA            S9, S31, V2.S[1]
      }
      float v129 = _S9 + (float)(_S27 * v71);
      __asm
      {
        FMLA            S29, S7, V0.S[1]
        FMLA            S31, S7, V0.S[2]
        FMLA            S9, S7, V0.S[3]
      }
      int32x4_t v177 = _Q0;
      LODWORD(v180) = _Q0.i32[3];
      __asm
      {
        FMLA            S27, S19, V0.S[1]
        FMLA            S27, S20, V0.S[2]
        FMLA            S27, S22, V0.S[3]
        FMLA            S9, S19, V6.S[1]
      }
      *((void *)&v178 + 1) = _Q6.i64[0];
      *(void *)&long long v179 = vzip2q_s32(_Q0, vuzp1q_s32(_Q0, _Q6)).u64[0];
      __asm
      {
        FMLA            S0, S22, V6.S[1]
        FMLA            S9, S20, V2.S[1]
      }
      *((int32x2_t *)&v179 + 1) = _D2;
      __asm { FMLA            S31, S22, V2.S[1] }
      *((float *)&v180 + 3) = v71;
      *(_DWORD *)a3 = _S21;
      *(_DWORD *)(a3 + 4) = _S5;
      *(_DWORD *)(a3 + 8) = _S26;
      *(_DWORD *)(a3 + 12) = _S27;
      *(_DWORD *)(a3 + 16) = _S23;
      *(_DWORD *)(a3 + 20) = _S17;
      *(_DWORD *)(a3 + 24) = _S28;
      *(_DWORD *)(a3 + 28) = _Q0.i32[0];
      *(_DWORD *)(a3 + 32) = _S24;
      *(_DWORD *)(a3 + 36) = _S25;
      *(_DWORD *)(a3 + 40) = _S30;
      *(_DWORD *)(a3 + 44) = _S31;
      *(float *)(a3 + 48) = v107;
      *(float *)(a3 + 52) = v118;
      *(float *)(a3 + 56) = v129;
      *(float *)(a3 + 60) = _S9 + (float)(_S22 * v71);
      DYMtxConcat(a2, (float *)v177.i32, a2);
    }
    char v18 = 0;
    ++v13;
    uint64_t v14 = 1;
  }
  while ((v19 & 1) != 0);
  long long v183 = 0u;
  *(_OWORD *)v184 = 0u;
  float32x4_t v181 = 0u;
  long long v182 = 0u;
  float v174 = a2[2];
  float v175 = a2[3];
  float v168 = a2[4];
  float v169 = *a2;
  float v170 = a2[5];
  float v171 = a2[6];
  float v172 = a2[1];
  float v139 = a2[8];
  float v173 = a2[7];
  float v141 = a2[9];
  float v140 = a2[10];
  float v143 = a2[11];
  float v142 = a2[12];
  float v144 = a2[13];
  float v145 = a2[14];
  float v167 = a2[15];
  DYMtxConcat(a2, (float *)a3, v181.f32);
  *(float *)&unsigned int v146 = (float)((float)((float)((float)(v181.f32[0] * v172) + 0.0) + (float)(*(float *)&v182 * v170))
                          + (float)(*(float *)&v183 * v141))
                  + (float)(v184[0] * v144);
  *(float *)&unsigned int v147 = (float)((float)((float)((float)(v181.f32[0] * v174) + 0.0) + (float)(*(float *)&v182 * v171))
                          + (float)(*(float *)&v183 * v140))
                  + (float)(v184[0] * v145);
  *(float *)&unsigned int v176 = (float)((float)((float)((float)(v181.f32[0] * v175) + 0.0) + (float)(*(float *)&v182 * v173))
                          + (float)(*(float *)&v183 * v143))
                  + (float)(v184[0] * v167);
  *(float *)&unsigned int v148 = (float)((float)((float)((float)(v181.f32[1] * v172) + 0.0) + (float)(*((float *)&v182 + 1) * v170))
                          + (float)(*((float *)&v183 + 1) * v141))
                  + (float)(v184[1] * v144);
  *(float *)&unsigned int v149 = (float)((float)((float)((float)(v181.f32[1] * v174) + 0.0) + (float)(*((float *)&v182 + 1) * v171))
                          + (float)(*((float *)&v183 + 1) * v140))
                  + (float)(v184[1] * v145);
  *(float *)&unsigned int v150 = (float)((float)((float)((float)(v181.f32[1] * v175) + 0.0) + (float)(*((float *)&v182 + 1) * v173))
                          + (float)(*((float *)&v183 + 1) * v143))
                  + (float)(v184[1] * v167);
  *(float *)&unsigned int v151 = (float)((float)((float)((float)(v181.f32[2] * v172) + 0.0) + (float)(*((float *)&v182 + 2) * v170))
                          + (float)(*((float *)&v183 + 2) * v141))
                  + (float)(v184[2] * v144);
  *(float *)&unsigned int v152 = (float)((float)((float)((float)(v181.f32[2] * v174) + 0.0) + (float)(*((float *)&v182 + 2) * v171))
                          + (float)(*((float *)&v183 + 2) * v140))
                  + (float)(v184[2] * v145);
  float v153 = (float)((float)((float)((float)(v181.f32[2] * v175) + 0.0) + (float)(*((float *)&v182 + 2) * v173))
               + (float)(*((float *)&v183 + 2) * v143))
       + (float)(v184[2] * v167);
  *(float *)&unsigned int v154 = (float)((float)((float)((float)(v181.f32[3] * v172) + 0.0) + (float)(*((float *)&v182 + 3) * v170))
                          + (float)(*((float *)&v183 + 3) * v141))
                  + (float)(v184[3] * v144);
  *(float *)&unsigned int v155 = (float)((float)((float)((float)(v181.f32[3] * v174) + 0.0) + (float)(*((float *)&v182 + 3) * v171))
                          + (float)(*((float *)&v183 + 3) * v140))
                  + (float)(v184[3] * v145);
  float v156 = (float)((float)((float)(v181.f32[3] * v175) + 0.0) + (float)(*((float *)&v182 + 3) * v173))
       + (float)(*((float *)&v183 + 3) * v143);
  v181.f32[0] = (float)((float)((float)((float)(v181.f32[0] * v169) + 0.0) + (float)(*(float *)&v182 * v168))
                      + (float)(*(float *)&v183 * v139))
              + (float)(v184[0] * v142);
  v181.f32[1] = (float)((float)((float)((float)(v181.f32[1] * v169) + 0.0) + (float)(*((float *)&v182 + 1) * v168))
                      + (float)(*((float *)&v183 + 1) * v139))
              + (float)(v184[1] * v142);
  v181.f32[2] = (float)((float)((float)((float)(v181.f32[2] * v169) + 0.0) + (float)(*((float *)&v182 + 2) * v168))
                      + (float)(*((float *)&v183 + 2) * v139))
              + (float)(v184[2] * v142);
  v181.f32[3] = (float)((float)((float)((float)(v181.f32[3] * v169) + 0.0) + (float)(*((float *)&v182 + 3) * v168))
                      + (float)(*((float *)&v183 + 3) * v139))
              + (float)(v184[3] * v142);
  *(void *)&long long v182 = __PAIR64__(v148, v146);
  *((void *)&v182 + 1) = __PAIR64__(v154, v151);
  *(void *)&long long v183 = __PAIR64__(v149, v147);
  *((void *)&v183 + 1) = __PAIR64__(v155, v152);
  *(void *)v184 = __PAIR64__(v150, v176);
  v184[2] = v153;
  v184[3] = v156 + (float)(v184[3] * v167);
  if (DYMtxNormalizedFrobeniusNormDelta(a1, v181.f32) > 0.0001) {
    return 0;
  }
  float v158 = *(float *)(a3 + 32);
  float v160 = *(float *)(a3 + 48);
  float v159 = *(float *)(a3 + 52);
  float v162 = *(float *)(a3 + 8);
  float v161 = *(float *)(a3 + 12);
  float v163 = *(float *)(a3 + 28);
  float v164 = *(float *)(a3 + 44);
  float v165 = *(float *)(a3 + 60);
  float v166 = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(*(float *)a3 * *(float *)a3) + 0.0) + (float)(*(float *)(a3 + 16) * *(float *)(a3 + 16))) + (float)(v158 * v158)) + (float)(v160 * v160))+ (float)(*(float *)(a3 + 4) * *(float *)(a3 + 4)))+ (float)(*(float *)(a3 + 20)* *(float *)(a3 + 20)))+ (float)(*(float *)(a3 + 36)* *(float *)(a3 + 36)))+ (float)(v159 * v159))+ (float)(v162 * v162))+ (float)(*(float *)(a3 + 24) * *(float *)(a3 + 24)))+ (float)(*(float *)(a3 + 40) * *(float *)(a3 + 40)))+ (float)(*(float *)(a3 + 56) * *(float *)(a3 + 56)))+ (float)(v161 * v161))+ (float)(v163 * v163))+ (float)(v164 * v164))+ (float)(v165 * v165));
  uint64_t result = 0;
  if ((float)(fabsf(v158) / v166) <= 0.0001)
  {
    *(_DWORD *)(a3 + 32) = 0;
    if ((float)(fabsf(v160) / v166) <= 0.0001)
    {
      uint64_t result = 0;
      *(_DWORD *)(a3 + 48) = 0;
      if ((float)(fabsf(v159) / v166) <= 0.0001)
      {
        uint64_t result = 0;
        *(_DWORD *)(a3 + 52) = 0;
        if ((float)(fabsf(v162) / v166) <= 0.0001)
        {
          uint64_t result = 0;
          *(_DWORD *)(a3 + 8) = 0;
          if ((float)(fabsf(v161) / v166) <= 0.0001)
          {
            uint64_t result = 0;
            *(_DWORD *)(a3 + 12) = 0;
            if ((float)(fabsf(v163) / v166) <= 0.0001)
            {
              *(_DWORD *)(a3 + 28) = 0;
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DYMtxEigenDecomposition(float *a1, _OWORD *a2, _DWORD *a3, double a4, double a5, double a6, double a7, double a8, double a9, int32x4_t a10)
{
  long long v223 = 0u;
  long long v224 = 0u;
  long long v221 = 0u;
  long long v222 = 0u;
  memset(v220, 0, sizeof(v220));
  uint64_t result = DYMtxTridiagonalDecomposition(a1, (float *)&v221, (uint64_t)v220, 0.0, a5, a6, a7, a8, a9, a10);
  if (result)
  {
    int v14 = 0;
    float v16 = *((float *)v220 + 1);
    float v15 = *(float *)v220;
    float v18 = *((float *)&v220[2] + 1);
    float v17 = *(float *)&v220[2];
    float v20 = *((float *)&v220[3] + 1);
    float v19 = *(float *)&v220[3];
    float v21 = *((float *)v220 + 2);
    float v22 = *((float *)&v220[1] + 2);
    float v23 = *((float *)&v220[1] + 1);
    float v24 = *(float *)&v220[1];
    float v210 = *((float *)&v220[1] + 3);
    float v212 = *((float *)&v220[2] + 3);
    float v208 = *((float *)&v220[3] + 3);
    float v25 = *((float *)&v220[3] + 2);
    float v209 = *((float *)&v220[2] + 2);
    float v27 = *((float *)&v221 + 1);
    float v26 = *(float *)&v221;
    float v29 = *((float *)&v222 + 1);
    float v28 = *(float *)&v222;
    float v31 = *((float *)&v223 + 1);
    float v30 = *(float *)&v223;
    float v32 = *((float *)&v223 + 3);
    uint64_t v207 = v224;
    float v204 = *((float *)&v221 + 3);
    float v205 = *((float *)&v221 + 2);
    float v34 = *((float *)&v222 + 3);
    float v33 = *((float *)&v222 + 2);
    float v35 = *((float *)&v223 + 2);
    uint64_t v206 = *((void *)&v224 + 1);
    float v36 = *((float *)v220 + 3);
    do
    {
      float v37 = sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v24 * v24) + 0.0)+ (float)(v17 * v17))+ (float)(v19 * v19))+ (float)(v16 * v16))+ (float)(v18 * v18))+ (float)(v20 * v20))+ (float)(v21 * v21))+ (float)(v22 * v22))+ (float)(v25 * v25))+ (float)(v36 * v36))+ (float)(v210 * v210))+ (float)(v212 * v212));
      if (v37 < 0.0000001
        && (float)(v37
                 / sqrtf((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)((float)(v15 * v15) + 0.0) + (float)(v24 * v24)) + (float)(v17 * v17)) + (float)(v19 * v19)) + (float)(v16 * v16)) + (float)(v23 * v23))+ (float)(v18 * v18))+ (float)(v20 * v20))+ (float)(v21 * v21))+ (float)(v22 * v22))+ (float)(v209 * v209))+ (float)(v25 * v25))+ (float)(v36 * v36))+ (float)(v210 * v210))+ (float)(v212 * v212))+ (float)(v208 * v208))) < 0.0000001)
      {
        break;
      }
      float v214 = v19;
      for (uint64_t i = 0; i != 48; i += 8)
      {
        uint64_t v39 = *(int *)((char *)&unk_24F695548 + i);
        uint64_t v40 = *(int *)((char *)&unk_24F695548 + i + 4);
        float v41 = *((float *)&v220[v40] + v39);
        if (fabsf(v41) >= 0.0000001)
        {
          uint64_t v42 = 16 * v40;
          float v43 = &v220[v40];
          uint64_t v44 = 4 * v40;
          float v45 = *(float *)((char *)v43 + v44);
          uint64_t v46 = 16 * v39;
          float v47 = &v220[v39];
          uint64_t v48 = 4 * v39;
          float v49 = (float)(v45 - *(float *)((char *)v47 + v48)) / (float)(v41 + v41);
          float v50 = 1.0 / (float)(fabsf(v49) + sqrtf((float)(v49 * v49) + 1.0));
          if (v49 >= 0.0) {
            float v51 = v50;
          }
          else {
            float v51 = -v50;
          }
          float v52 = 1.0 / sqrtf((float)(v51 * v51) + 1.0);
          long long v216 = xmmword_24F6954E0;
          long long v217 = xmmword_24F6954F0;
          long long v218 = xmmword_24F695500;
          long long v219 = xmmword_24F695510;
          float v53 = (char *)&v216 + v46;
          *(float *)&v53[v48] = v52;
          float v54 = (char *)&v216 + v42;
          *(float *)&v54[v44] = v52;
          *(float *)&v54[v48] = v51 * v52;
          *(float *)&v53[v44] = -(float)(v51 * v52);
          float v198 = v25;
          float v201 = v30;
          float v189 = v28;
          float v192 = v35;
          float v55 = (float)((float)(*(float *)&v216 * v15) + 0.0) + (float)(*((float *)&v216 + 1) * v16);
          float v179 = v33;
          float v180 = v26;
          float v56 = (float)((float)(*(float *)&v217 * v15) + 0.0) + (float)(*((float *)&v217 + 1) * v16);
          float v57 = (float)((float)(*(float *)&v218 * v15) + 0.0) + (float)(*((float *)&v218 + 1) * v16);
          float v194 = v32;
          float v195 = v31;
          float v58 = (float)((float)(*(float *)&v219 * v15) + 0.0) + (float)(*((float *)&v219 + 1) * v16);
          float v59 = (float)(v55 + (float)(*((float *)&v216 + 2) * v21)) + (float)(*((float *)&v216 + 3) * v36);
          float v60 = (float)(v56 + (float)(*((float *)&v217 + 2) * v21)) + (float)(*((float *)&v217 + 3) * v36);
          float v61 = (float)(v57 + (float)(*((float *)&v218 + 2) * v21)) + (float)(*((float *)&v218 + 3) * v36);
          float v62 = (float)(v58 + (float)(*((float *)&v219 + 2) * v21)) + (float)(*((float *)&v219 + 3) * v36);
          float v183 = v34;
          float v63 = (float)((float)((float)((float)(*(float *)&v216 * v24) + 0.0) + (float)(*((float *)&v216 + 1) * v23))
                      + (float)(*((float *)&v216 + 2) * v22))
              + (float)(*((float *)&v216 + 3) * v210);
          float v64 = (float)((float)((float)((float)(*(float *)&v217 * v24) + 0.0) + (float)(*((float *)&v217 + 1) * v23))
                      + (float)(*((float *)&v217 + 2) * v22))
              + (float)(*((float *)&v217 + 3) * v210);
          float v65 = (float)((float)((float)((float)(*(float *)&v218 * v24) + 0.0) + (float)(*((float *)&v218 + 1) * v23))
                      + (float)(*((float *)&v218 + 2) * v22))
              + (float)(*((float *)&v218 + 3) * v210);
          float v66 = (float)((float)((float)((float)(*(float *)&v219 * v24) + 0.0) + (float)(*((float *)&v219 + 1) * v23))
                      + (float)(*((float *)&v219 + 2) * v22))
              + (float)(*((float *)&v219 + 3) * v210);
          float v181 = (float)((float)(v60 * *(float *)&v217) + 0.0) + (float)(v64 * *((float *)&v217 + 1));
          float v182 = (float)((float)(v60 * *(float *)&v216) + 0.0) + (float)(v64 * *((float *)&v216 + 1));
          float v67 = (float)((float)(v60 * *(float *)&v218) + 0.0) + (float)(v64 * *((float *)&v218 + 1));
          float v68 = (float)((float)(v60 * *(float *)&v219) + 0.0) + (float)(v64 * *((float *)&v219 + 1));
          float v178 = (float)((float)(v61 * *(float *)&v219) + 0.0) + (float)(v65 * *((float *)&v219 + 1));
          float v176 = (float)((float)(v62 * *(float *)&v217) + 0.0) + (float)(v66 * *((float *)&v217 + 1));
          float v177 = (float)((float)(v62 * *(float *)&v216) + 0.0) + (float)(v66 * *((float *)&v216 + 1));
          float v174 = (float)((float)(v62 * *(float *)&v219) + 0.0) + (float)(v66 * *((float *)&v219 + 1));
          float v175 = (float)((float)(v62 * *(float *)&v218) + 0.0) + (float)(v66 * *((float *)&v218 + 1));
          float v173 = (float)((float)(v180 * *(float *)&v216) + 0.0) + (float)(v189 * *((float *)&v216 + 1));
          float v69 = (float)((float)((float)((float)(*(float *)&v216 * v17) + 0.0) + (float)(*((float *)&v216 + 1) * v18))
                      + (float)(*((float *)&v216 + 2) * v209))
              + (float)(*((float *)&v216 + 3) * v212);
          float v70 = (float)((float)((float)((float)(*(float *)&v217 * v17) + 0.0) + (float)(*((float *)&v217 + 1) * v18))
                      + (float)(*((float *)&v217 + 2) * v209))
              + (float)(*((float *)&v217 + 3) * v212);
          float v71 = (float)((float)((float)((float)(*(float *)&v218 * v17) + 0.0) + (float)(*((float *)&v218 + 1) * v18))
                      + (float)(*((float *)&v218 + 2) * v209))
              + (float)(*((float *)&v218 + 3) * v212);
          float v72 = (float)((float)((float)((float)(*(float *)&v219 * v17) + 0.0) + (float)(*((float *)&v219 + 1) * v18))
                      + (float)(*((float *)&v219 + 2) * v209))
              + (float)(*((float *)&v219 + 3) * v212);
          float v73 = (float)((float)((float)(v180 * *(float *)&v217) + 0.0) + (float)(v189 * *((float *)&v217 + 1)))
              + (float)(v30 * *((float *)&v217 + 2));
          float v74 = (float)((float)((float)(v180 * *(float *)&v218) + 0.0) + (float)(v189 * *((float *)&v218 + 1)))
              + (float)(v30 * *((float *)&v218 + 2));
          float v75 = (float)((float)((float)(v180 * *(float *)&v219) + 0.0) + (float)(v189 * *((float *)&v219 + 1)))
              + (float)(v30 * *((float *)&v219 + 2));
          float v190 = (float)((float)((float)(v27 * *(float *)&v216) + 0.0) + (float)(v29 * *((float *)&v216 + 1)))
               + (float)(v195 * *((float *)&v216 + 2));
          float v185 = (float)((float)((float)(v27 * *(float *)&v218) + 0.0) + (float)(v29 * *((float *)&v218 + 1)))
               + (float)(v195 * *((float *)&v218 + 2));
          float v186 = (float)((float)((float)(v27 * *(float *)&v217) + 0.0) + (float)(v29 * *((float *)&v217 + 1)))
               + (float)(v195 * *((float *)&v217 + 2));
          float v184 = (float)((float)((float)(v27 * *(float *)&v219) + 0.0) + (float)(v29 * *((float *)&v219 + 1)))
               + (float)(v195 * *((float *)&v219 + 2));
          float v76 = (float)((float)((float)((float)(*(float *)&v216 * v214) + 0.0) + (float)(*((float *)&v216 + 1) * v20))
                      + (float)(*((float *)&v216 + 2) * v198))
              + (float)(*((float *)&v216 + 3) * v208);
          float v77 = (float)((float)((float)((float)(*(float *)&v217 * v214) + 0.0) + (float)(*((float *)&v217 + 1) * v20))
                      + (float)(*((float *)&v217 + 2) * v198))
              + (float)(*((float *)&v217 + 3) * v208);
          float v78 = (float)((float)((float)((float)(*(float *)&v218 * v214) + 0.0) + (float)(*((float *)&v218 + 1) * v20))
                      + (float)(*((float *)&v218 + 2) * v198))
              + (float)(*((float *)&v218 + 3) * v208);
          float v79 = (float)((float)((float)((float)(*(float *)&v219 * v214) + 0.0) + (float)(*((float *)&v219 + 1) * v20))
                      + (float)(*((float *)&v219 + 2) * v198))
              + (float)(*((float *)&v219 + 3) * v208);
          *(float *)&unsigned int v80 = (float)((float)((float)((float)(v59 * *(float *)&v216) + 0.0)
                                         + (float)(v63 * *((float *)&v216 + 1)))
                                 + (float)(v69 * *((float *)&v216 + 2)))
                         + (float)(v76 * *((float *)&v216 + 3));
          *(float *)&unsigned int v199 = (float)((float)((float)((float)(v59 * *(float *)&v217) + 0.0)
                                          + (float)(v63 * *((float *)&v217 + 1)))
                                  + (float)(v69 * *((float *)&v217 + 2)))
                          + (float)(v76 * *((float *)&v217 + 3));
          *(float *)&unsigned int v81 = (float)((float)((float)((float)(v59 * *(float *)&v218) + 0.0)
                                         + (float)(v63 * *((float *)&v218 + 1)))
                                 + (float)(v69 * *((float *)&v218 + 2)))
                         + (float)(v76 * *((float *)&v218 + 3));
          *(float *)&unsigned int v82 = (float)((float)((float)((float)(v59 * *(float *)&v219) + 0.0)
                                         + (float)(v63 * *((float *)&v219 + 1)))
                                 + (float)(v69 * *((float *)&v219 + 2)))
                         + (float)(v76 * *((float *)&v219 + 3));
          *(float *)&unsigned int v196 = (float)(v182 + (float)(v70 * *((float *)&v216 + 2))) + (float)(v77 * *((float *)&v216 + 3));
          *(float *)&unsigned int v83 = (float)(v181 + (float)(v70 * *((float *)&v217 + 2))) + (float)(v77 * *((float *)&v217 + 3));
          float v84 = (float)(v67 + (float)(v70 * *((float *)&v218 + 2))) + (float)(v77 * *((float *)&v218 + 3));
          float v20 = (float)(v68 + (float)(v70 * *((float *)&v219 + 2))) + (float)(v77 * *((float *)&v219 + 3));
          float v21 = (float)((float)((float)((float)(v61 * *(float *)&v216) + 0.0) + (float)(v65 * *((float *)&v216 + 1)))
                      + (float)(v71 * *((float *)&v216 + 2)))
              + (float)(v78 * *((float *)&v216 + 3));
          float v22 = (float)((float)((float)((float)(v61 * *(float *)&v217) + 0.0) + (float)(v65 * *((float *)&v217 + 1)))
                      + (float)(v71 * *((float *)&v217 + 2)))
              + (float)(v78 * *((float *)&v217 + 3));
          *(float *)&unsigned int v85 = (float)((float)((float)((float)(v61 * *(float *)&v218) + 0.0)
                                         + (float)(v65 * *((float *)&v218 + 1)))
                                 + (float)(v71 * *((float *)&v218 + 2)))
                         + (float)(v78 * *((float *)&v218 + 3));
          *(float *)&unsigned int v86 = (float)(v178 + (float)(v71 * *((float *)&v219 + 2))) + (float)(v78 * *((float *)&v219 + 3));
          *(float *)&unsigned int v87 = (float)(v177 + (float)(v72 * *((float *)&v216 + 2))) + (float)(v79 * *((float *)&v216 + 3));
          *(float *)&unsigned int v88 = (float)(v176 + (float)(v72 * *((float *)&v217 + 2))) + (float)(v79 * *((float *)&v217 + 3));
          float v210 = *(float *)&v88;
          *(float *)&unsigned int v89 = (float)(v175 + (float)(v72 * *((float *)&v218 + 2))) + (float)(v79 * *((float *)&v218 + 3));
          *(float *)&unsigned int v90 = (float)(v174 + (float)(v72 * *((float *)&v219 + 2))) + (float)(v79 * *((float *)&v219 + 3));
          float v202 = (float)(v173 + (float)(v201 * *((float *)&v216 + 2)))
               + (float)(*(float *)&v207 * *((float *)&v216 + 3));
          float v91 = v73 + (float)(*(float *)&v207 * *((float *)&v217 + 3));
          float v18 = v84;
          float v92 = v74 + (float)(*(float *)&v207 * *((float *)&v218 + 3));
          float v93 = v75 + (float)(*(float *)&v207 * *((float *)&v219 + 3));
          float v94 = v190 + (float)(*((float *)&v207 + 1) * *((float *)&v216 + 3));
          float v95 = v186 + (float)(*((float *)&v207 + 1) * *((float *)&v217 + 3));
          float v96 = v185 + (float)(*((float *)&v207 + 1) * *((float *)&v218 + 3));
          *(float *)&uint64_t v207 = v93;
          *((float *)&v207 + 1) = v184 + (float)(*((float *)&v207 + 1) * *((float *)&v219 + 3));
          float v97 = (float)((float)((float)((float)(v205 * *(float *)&v216) + 0.0) + (float)(v179 * *((float *)&v216 + 1)))
                      + (float)(v192 * *((float *)&v216 + 2)))
              + (float)(*(float *)&v206 * *((float *)&v216 + 3));
          float v98 = (float)((float)((float)((float)(v205 * *(float *)&v217) + 0.0) + (float)(v179 * *((float *)&v217 + 1)))
                      + (float)(v192 * *((float *)&v217 + 2)))
              + (float)(*(float *)&v206 * *((float *)&v217 + 3));
          float v99 = (float)((float)((float)((float)(v205 * *(float *)&v218) + 0.0) + (float)(v179 * *((float *)&v218 + 1)))
                      + (float)(v192 * *((float *)&v218 + 2)))
              + (float)(*(float *)&v206 * *((float *)&v218 + 3));
          *(float *)&uint64_t v206 = (float)((float)((float)((float)(v205 * *(float *)&v219) + 0.0)
                                          + (float)(v179 * *((float *)&v219 + 1)))
                                  + (float)(v192 * *((float *)&v219 + 2)))
                          + (float)(*(float *)&v206 * *((float *)&v219 + 3));
          float v100 = (float)((float)((float)((float)(v204 * *(float *)&v216) + 0.0) + (float)(v183 * *((float *)&v216 + 1)))
                       + (float)(v32 * *((float *)&v216 + 2)))
               + (float)(*((float *)&v206 + 1) * *((float *)&v216 + 3));
          float v34 = (float)((float)((float)((float)(v204 * *(float *)&v217) + 0.0) + (float)(v183 * *((float *)&v217 + 1)))
                      + (float)(v32 * *((float *)&v217 + 2)))
              + (float)(*((float *)&v206 + 1) * *((float *)&v217 + 3));
          float v17 = *(float *)&v81;
          float v32 = (float)((float)((float)((float)(v204 * *(float *)&v218) + 0.0) + (float)(v183 * *((float *)&v218 + 1)))
                      + (float)(v32 * *((float *)&v218 + 2)))
              + (float)(*((float *)&v206 + 1) * *((float *)&v218 + 3));
          *((float *)&v206 + 1) = (float)((float)((float)((float)(v204 * *(float *)&v219) + 0.0)
                                                + (float)(v183 * *((float *)&v219 + 1)))
                                        + (float)(v194 * *((float *)&v219 + 2)))
                                + (float)(*((float *)&v206 + 1) * *((float *)&v219 + 3));
          float v16 = *(float *)&v196;
          float v36 = *(float *)&v87;
          *(void *)&v220[0] = __PAIR64__(v196, v80);
          *((void *)&v220[0] + 1) = __PAIR64__(v87, LODWORD(v21));
          *(void *)&v220[1] = __PAIR64__(v83, v199);
          *((void *)&v220[1] + 1) = __PAIR64__(v88, LODWORD(v22));
          *(void *)&v220[2] = __PAIR64__(LODWORD(v18), v81);
          float v208 = *(float *)&v90;
          float v209 = *(float *)&v85;
          *((void *)&v220[2] + 1) = __PAIR64__(v89, v85);
          float v212 = *(float *)&v89;
          float v214 = *(float *)&v82;
          float v204 = v100;
          float v205 = v97;
          float v35 = v99;
          *(void *)&v220[3] = __PAIR64__(LODWORD(v20), v82);
          float v15 = *(float *)&v80;
          float v33 = v98;
          float v31 = v96;
          float v29 = v95;
          float v25 = *(float *)&v86;
          *((void *)&v220[3] + 1) = __PAIR64__(v90, v86);
          float v23 = *(float *)&v83;
          float v27 = v94;
          float v24 = *(float *)&v199;
          float v30 = v92;
          float v28 = v91;
          float v26 = v202;
        }
      }
      ++v14;
      float v19 = v214;
    }
    while (v14 != 50);
    *(_OWORD *)((char *)v220 + 4) = 0uLL;
    float v101 = v28;
    float v102 = (float)((float)((float)((float)(v26 * *(float *)v220) + 0.0) + (float)(v28 * 0.0)) + (float)(v30 * 0.0))
         + (float)(*(float *)&v207 * 0.0);
    float v203 = v30;
    *((void *)&v220[1] + 1) = 0;
    *(void *)&v220[2] = 0;
    float v103 = (float)((float)((float)((float)(v26 * 0.0) + 0.0) + (float)(v28 * *((float *)&v220[1] + 1)))
                 + (float)(v30 * 0.0))
         + (float)(*(float *)&v207 * 0.0);
    int v213 = DWORD1(v220[1]);
    int v215 = v220[0];
    float v104 = v33;
    float v211 = (float)((float)(v26 * 0.0) + 0.0) + (float)(v28 * 0.0);
    *(_OWORD *)((char *)&v220[2] + 12) = 0uLL;
    float v105 = (float)((float)((float)((float)(v27 * *(float *)v220) + 0.0) + (float)(v29 * 0.0)) + (float)(v31 * 0.0))
         + (float)(*((float *)&v207 + 1) * 0.0);
    float v106 = (float)((float)((float)(v204 * *(float *)v220) + 0.0) + (float)(v34 * 0.0)) + (float)(v32 * 0.0);
    float v107 = v32;
    float v108 = (float)((float)((float)((float)(v27 * 0.0) + 0.0) + (float)(v29 * *((float *)&v220[1] + 1)))
                 + (float)(v31 * 0.0))
         + (float)(*((float *)&v207 + 1) * 0.0);
    float v109 = (float)((float)((float)((float)(v205 * *(float *)v220) + 0.0) + (float)(v33 * 0.0)) + (float)(v35 * 0.0))
         + (float)(*(float *)&v206 * 0.0);
    float v191 = v106 + (float)(*((float *)&v206 + 1) * 0.0);
    float v110 = v27;
    float v111 = (float)((float)((float)((float)(v205 * 0.0) + 0.0) + (float)(v33 * *((float *)&v220[1] + 1)))
                 + (float)(v35 * 0.0))
         + (float)(*(float *)&v206 * 0.0);
    float v187 = (float)((float)((float)((float)(v204 * 0.0) + 0.0) + (float)(v34 * *((float *)&v220[1] + 1)))
                 + (float)(v107 * 0.0))
         + (float)(*((float *)&v206 + 1) * 0.0);
    float v200 = (float)((float)(v205 * 0.0) + 0.0) + (float)(v33 * 0.0);
    float v197 = (float)((float)(v204 * 0.0) + 0.0) + (float)(v34 * 0.0);
    float v112 = v26;
    float v113 = (float)((float)(v26 * 0.0) + 0.0) + (float)(v101 * 0.0);
    float v114 = (float)((float)(v27 * 0.0) + 0.0) + (float)(v29 * 0.0);
    float v193 = (float)((float)(v102 * v26) + 0.0) + (float)(v103 * v101);
    float v115 = v101;
    float v116 = (float)((float)(v102 * v27) + 0.0) + (float)(v103 * v29);
    float v117 = v34;
    float v118 = (float)((float)(v102 * v205) + 0.0) + (float)(v103 * v104);
    float v119 = (float)((float)(v102 * v204) + 0.0) + (float)(v103 * v117);
    float v188 = (float)((float)(v105 * v112) + 0.0) + (float)(v108 * v101);
    float v120 = (float)((float)(v105 * v27) + 0.0) + (float)(v108 * v29);
    float v121 = (float)((float)(v105 * v205) + 0.0) + (float)(v108 * v104);
    float v122 = (float)((float)(v105 * v204) + 0.0) + (float)(v108 * v117);
    float v123 = (float)((float)(v109 * v112) + 0.0) + (float)(v111 * v115);
    float v124 = (float)((float)(v109 * v27) + 0.0) + (float)(v111 * v29);
    float v125 = (float)((float)(v109 * v205) + 0.0) + (float)(v111 * v104);
    float v126 = (float)((float)(v109 * v204) + 0.0) + (float)(v111 * v117);
    *((float *)&v221 + 3) = v204;
    float v127 = (float)((float)(v191 * v112) + 0.0) + (float)(v187 * v115);
    *(void *)&long long v222 = __PAIR64__(LODWORD(v29), LODWORD(v115));
    float v128 = (float)((float)(v191 * v110) + 0.0) + (float)(v187 * v29);
    float v129 = (float)((float)(v191 * v205) + 0.0) + (float)(v187 * v104);
    float v130 = (float)((float)(v191 * v204) + 0.0) + (float)(v187 * v117);
    *((void *)&v222 + 1) = __PAIR64__(LODWORD(v117), LODWORD(v104));
    *(float *)&long long v221 = v112;
    *(void *)((char *)&v221 + 4) = __PAIR64__(LODWORD(v205), LODWORD(v110));
    int v131 = DWORD2(v220[2]);
    float v132 = (float)(v211 + (float)(v203 * *((float *)&v220[2] + 2))) + (float)(*(float *)&v207 * 0.0);
    float v133 = (float)(v114 + (float)(v31 * *((float *)&v220[2] + 2))) + (float)(*((float *)&v207 + 1) * 0.0);
    float v134 = (float)(v200 + (float)(v35 * *((float *)&v220[2] + 2))) + (float)(*(float *)&v206 * 0.0);
    float v135 = (float)(v197 + (float)(v107 * *((float *)&v220[2] + 2))) + (float)(*((float *)&v206 + 1) * 0.0);
    float v136 = v114 + (float)(v31 * 0.0);
    float v137 = v200 + (float)(v35 * 0.0);
    float v138 = v193 + (float)(v132 * v203);
    float v139 = v116 + (float)(v132 * v31);
    float v140 = v118 + (float)(v132 * v35);
    float v141 = v119 + (float)(v132 * v107);
    float v142 = v188 + (float)(v133 * v203);
    float v143 = v120 + (float)(v133 * v31);
    float v144 = v121 + (float)(v133 * v35);
    float v145 = v122 + (float)(v133 * v107);
    float v146 = v123 + (float)(v134 * v203);
    float v147 = v124 + (float)(v134 * v31);
    float v148 = v125 + (float)(v134 * v35);
    float v149 = v126 + (float)(v134 * v107);
    float v150 = v127 + (float)(v135 * v203);
    *(void *)&long long v223 = __PAIR64__(LODWORD(v31), LODWORD(v203));
    float v151 = v128 + (float)(v135 * v31);
    *((void *)&v223 + 1) = __PAIR64__(LODWORD(v107), LODWORD(v35));
    float v152 = v129 + (float)(v135 * v35);
    *(void *)&long long v224 = v207;
    *((void *)&v224 + 1) = v206;
    float v153 = v130 + (float)(v135 * v107);
    long long v154 = v224;
    a2[2] = v223;
    a2[3] = v154;
    int v155 = HIDWORD(v220[3]);
    float v156 = (float)(v113 + (float)(v203 * 0.0)) + (float)(*(float *)&v207 * *((float *)&v220[3] + 3));
    *(float *)&unsigned int v157 = v138 + (float)(v156 * *(float *)&v207);
    *(float *)&unsigned int v158 = v139 + (float)(v156 * *((float *)&v207 + 1));
    *(float *)&long long v154 = v140 + (float)(v156 * *(float *)&v206);
    *(float *)&unsigned int v159 = v141 + (float)(v156 * *((float *)&v206 + 1));
    float v160 = v136 + (float)(*((float *)&v207 + 1) * *((float *)&v220[3] + 3));
    *(float *)&unsigned int v161 = v142 + (float)(v160 * *(float *)&v207);
    *(float *)&unsigned int v162 = v143 + (float)(v160 * *((float *)&v207 + 1));
    *(float *)&unsigned int v163 = v144 + (float)(v160 * *(float *)&v206);
    *(float *)&unsigned int v164 = v145 + (float)(v160 * *((float *)&v206 + 1));
    float v165 = v137 + (float)(*(float *)&v206 * *((float *)&v220[3] + 3));
    float v166 = v146 + (float)(v165 * *(float *)&v207);
    float v167 = v147 + (float)(v165 * *((float *)&v207 + 1));
    *(float *)&unsigned int v168 = v148 + (float)(v165 * *(float *)&v206);
    float v169 = v149 + (float)(v165 * *((float *)&v206 + 1));
    float v170 = (float)(v197 + (float)(v107 * 0.0)) + (float)(*((float *)&v206 + 1) * *((float *)&v220[3] + 3));
    *(float *)&unsigned int v171 = v152 + (float)(v170 * *(float *)&v206);
    long long v172 = v222;
    *a2 = v221;
    a2[1] = v172;
    *a3 = v215;
    a3[1] = v213;
    a3[2] = v131;
    a3[3] = v155;
    *(void *)&long long v216 = __PAIR64__(v161, v157);
    *((float *)&v216 + 2) = v166;
    *((float *)&v216 + 3) = v150 + (float)(v170 * *(float *)&v207);
    *(void *)&long long v217 = __PAIR64__(v162, v158);
    *((float *)&v217 + 2) = v167;
    *((float *)&v217 + 3) = v151 + (float)(v170 * *((float *)&v207 + 1));
    *(void *)&long long v218 = __PAIR64__(v163, v154);
    *((void *)&v218 + 1) = __PAIR64__(v171, v168);
    *(void *)&long long v219 = __PAIR64__(v164, v159);
    *((float *)&v219 + 2) = v169;
    *((float *)&v219 + 3) = v153 + (float)(v170 * *((float *)&v206 + 1));
    return DYMtxNormalizedFrobeniusNormDelta(a1, (float *)&v216) <= 0.0001;
  }
  return result;
}

void DYAddInternalDataNameEntries(uint64_t a1, uint64_t a2)
{
  if (sInternalDataNameTableOnce != -1) {
    dispatch_once_f(&sInternalDataNameTableOnce, 0, (dispatch_function_t)_BuildInternalDataNameTable);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __DYAddInternalDataNameEntries_block_invoke;
  v4[3] = &__block_descriptor_tmp_2;
  v4[4] = a2;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)sInternalDataNameTableQueue, v4);
}

void _BuildInternalDataNameTable(void *a1)
{
  sInternalDataNameTableQueue = (uint64_t)dispatch_queue_create("gputools.sInternalDataNameTableQueue", 0);
  operator new();
}

uint64_t *__DYAddInternalDataNameEntries_block_invoke(uint64_t *result)
{
  if (result[4])
  {
    float v1 = result;
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t result = std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int const&,char const* const&>(spInternalDataNameMap, (int *)(v1[5] + v2), (_DWORD *)(v1[5] + v2), (char **)(v1[5] + v2 + 8));
      ++v3;
      v2 += 16;
    }
    while (v3 < v1[4]);
  }
  return result;
}

void DYInternalDataTypeAsString(int a1@<W0>, std::string *a2@<X8>)
{
  if (sInternalDataNameTableOnce != -1) {
    dispatch_once_f(&sInternalDataNameTableOnce, 0, (dispatch_function_t)_BuildInternalDataNameTable);
  }
  uint64_t v7 = 0;
  float v8 = &v7;
  uint64_t v9 = 0x4002000000;
  float v10 = __Block_byref_object_copy__2;
  float v11 = __Block_byref_object_dispose__2;
  long long __p = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___Z26DYInternalDataTypeAsStringi_block_invoke;
  void v5[3] = &unk_265336ED8;
  int v6 = a1;
  v5[4] = &v7;
  dispatch_sync((dispatch_queue_t)sInternalDataNameTableQueue, v5);
  if (*((char *)v8 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a2, (const std::string::value_type *)v8[5], v8[6]);
  }
  else
  {
    long long v4 = *(_OWORD *)(v8 + 5);
    a2->__r_.__value_.__r.__words[2] = v8[7];
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p);
  }
}

void sub_24F67CEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

std::string *___Z26DYInternalDataTypeAsStringi_block_invoke(uint64_t a1)
{
  __n128 result = (std::string *)std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>((void *)spInternalDataNameMap, (int *)(a1 + 40));
  if (result)
  {
    unint64_t v3 = result + 1;
    long long v4 = (std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return std::string::operator=(v4, v3);
  }
  return result;
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[8]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[8]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67D17C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[8]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67D224(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0) {
      operator delete(__p[3]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[20]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[20]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67D4B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[20]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67D55C(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[21]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[21]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67D78C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[21]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67D834(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[16]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[16]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67DA64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[16]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67DB0C(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[15]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[15]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67DD3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[15]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67DDE4(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[34]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[34]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67E014(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[34]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67E0BC(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[17]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[17]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67E2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[17]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67E394(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[12]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[12]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67E5C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[12]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67E66C(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[11]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[11]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67E89C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[11]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67E944(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[31]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[31]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67EB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[31]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67EC1C(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[23]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[23]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67EE4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[23]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67EEF4(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[13]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[13]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67F124(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[13]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67F1CC(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int,char const(&)[29]>(uint64_t a1, int *a2, _DWORD *a3, char *a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[29]>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67F3FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int,char const(&)[29]>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67F4A4(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,int const&,char const* const&>(uint64_t a1, int *a2, _DWORD *a3, char **a4)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(uint64_t ***)(*(void *)a1 + 8 * v4);
    if (v9)
    {
      for (__n128 result = *v9; result; __n128 result = (uint64_t *)*result)
      {
        unint64_t v11 = result[1];
        if (v11 == v6)
        {
          if (*((_DWORD *)result + 4) == v6) {
            return result;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int const&,char const* const&>(a1, *a2, a3, a4, (uint64_t)v20);
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v4 = v6 % v7;
      }
      else {
        unint64_t v4 = v6;
      }
    }
    else
    {
      unint64_t v4 = (v7 - 1) & v6;
    }
  }
  float v18 = *(void **)(*(void *)a1 + 8 * v4);
  if (v18)
  {
    *(void *)v20[0] = *v18;
    void *v18 = v20[0];
  }
  else
  {
    *(void *)v20[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v20[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v20[0])
    {
      unint64_t v19 = *(void *)(*(void *)v20[0] + 8);
      if ((v7 & (v7 - 1)) != 0)
      {
        if (v19 >= v7) {
          v19 %= v7;
        }
      }
      else
      {
        v19 &= v7 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v19) = v20[0];
    }
  }
  __n128 result = (uint64_t *)v20[0];
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F67F6D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__construct_node_hash<int const&,char const* const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, char **a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  float v10 = operator new(0x30uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *float v10 = 0;
  v10[1] = a2;
  *((_DWORD *)v10 + 4) = *a3;
  __n128 result = std::string::basic_string[abi:ne180100]<0>(v10 + 3, *a4);
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_24F67F77C(_Unwind_Exception *a1)
{
  *float v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (__n128 result = *v6; result; __n128 result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
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
    unint64_t v8 = (std::string *)operator new(v6 + 1);
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

uint64_t _log_assert(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  __vsprintf_chk(v11, 0, 0x200uLL, a4, &a9);
  if (_log_assert_once != -1) {
    dispatch_once(&_log_assert_once, &__block_literal_global_10);
  }
  uint64_t v9 = _log_assert_assertLogger;
  if (os_log_type_enabled((os_log_t)_log_assert_assertLogger, OS_LOG_TYPE_ERROR)) {
    _log_assert_cold_1((uint64_t)v11, v9);
  }
  return 1;
}

void ___log_assert_block_invoke()
{
  _log_assert_assertLogger = (uint64_t)os_log_create("com.apple.gdt", "assertions");
  if (!_log_assert_assertLogger)
  {
    uint64_t v0 = &_os_log_internal;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ___log_assert_block_invoke_cold_1();
    }
    _log_assert_assertLogger = v0;
  }
}

char *DYArgumentsCLIDecode(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(unsigned int *)(a3 + 8);
  if ((int)v7 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(void *)(a3 + 16) + v8;
      int v10 = *(_DWORD *)(v9 + 32);
      uint64_t v13 = v9 + 40;
      uint64_t v12 = *(void *)(v9 + 40);
      uint64_t v11 = *(void *)(v13 + 8);
      if (v10)
      {
        if (v10 == 2 || v10 == 1) {
          *(void *)(v11 + a4) = v12;
        }
      }
      else
      {
        *(unsigned char *)(v11 + a4) = v12 != 0;
      }
      v8 += 56;
    }
    while (56 * v7 != v8);
  }
  if (a1 <= 1) {
    return 0;
  }
  LODWORD(v14) = 1;
  while ((int)v7 < 1)
  {
LABEL_33:
    LODWORD(v14) = v14 + 1;
    if ((int)v14 >= a1) {
      return 0;
    }
  }
  uint64_t v15 = 0;
  while (1)
  {
    unint64_t v16 = *(const char **)(a2 + 8 * (int)v14);
    uint64_t v17 = *(void *)(a3 + 16);
    float v18 = (const char **)(v17 + 56 * v15);
    size_t v19 = strlen(*v18);
    int v20 = strncmp(v16, *v18, v19);
    float v21 = v18[1];
    if (v21)
    {
      size_t v22 = strlen(v21);
      BOOL v23 = strncmp(v16, v21, v22) == 0;
    }
    else
    {
      BOOL v23 = 0;
    }
    if (v20) {
      BOOL v24 = !v23;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24) {
      goto LABEL_32;
    }
    int v25 = *(_DWORD *)(v17 + 56 * v15 + 32);
    if (!v25)
    {
      *(unsigned char *)(*(void *)(v17 + 56 * v15 + 48) + a4) = 1;
      goto LABEL_32;
    }
    if (v25 == 2) {
      break;
    }
    if (v25 == 1)
    {
      uint64_t v14 = (int)v14 + 1;
      if (v14 == a1)
      {
        malloc_type_id_t v31 = 4052541127;
LABEL_39:
        float v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, v31);
        snprintf(v29, 0x400uLL, "missing argument for %s");
        return v29;
      }
      *(void *)(*(void *)(v17 + 56 * v15 + 48) + a4) = *(void *)(a2 + 8 * v14);
    }
LABEL_32:
    if (++v15 == v7) {
      goto LABEL_33;
    }
  }
  uint64_t v14 = (int)v14 + 1;
  if (v14 == a1)
  {
    malloc_type_id_t v31 = 3888998730;
    goto LABEL_39;
  }
  float v26 = *(const char **)(a2 + 8 * v14);
  size_t v27 = strlen(v26);
  if (!v27)
  {
LABEL_31:
    *(void *)(*(void *)(v17 + 56 * v15 + 48) + a4) = atoi(v26);
    goto LABEL_32;
  }
  uint64_t v28 = 0;
  while ((v26[v28] - 48) < 0xA)
  {
    if (v27 == ++v28) {
      goto LABEL_31;
    }
  }
  float v29 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0xA607A53FuLL);
  snprintf(v29, 0x400uLL, "\"%s\" is not valid number for %s");
  return v29;
}

char *DYArgumentsCLIHelp(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  float v1 = *(const char ***)(a1 + 16);
  if (v1)
  {
    if (*(_DWORD *)(a1 + 8))
    {
      size_t v3 = strlen(*v1);
      uint8x8_t v4 = getprogname();
      int v5 = snprintf(DYArgumentsCLIHelp_buffer, 0x10000uLL, "%s - %s\n\n", v4, *(const char **)a1);
      size_t v6 = 0x10000 - v5;
      uint64_t v7 = getprogname();
      int v8 = snprintf(&DYArgumentsCLIHelp_buffer[v5], v6, "usage: %s ", v7);
      if (*(int *)(a1 + 8) < 1)
      {
        uint64_t v19 = v5;
      }
      else
      {
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = *(void *)(a1 + 16);
        int v31 = v8;
        LODWORD(v12) = v8;
        do
        {
          uint64_t v13 = &DYArgumentsCLIHelp_buffer[v5];
          uint64_t v14 = snprintf(&v13[(int)v12], 0x10000 - v5, "[%s", *(const char **)(v11 + v9)) + (uint64_t)(int)v12;
          uint64_t v15 = *(void *)(a1 + 16) + v9;
          if (*(_DWORD *)(v15 + 32)) {
            LODWORD(v14) = snprintf(&v13[v14], 0x10000 - v5, " %s", *(const char **)(v15 + 24)) + v14;
          }
          uint64_t v12 = snprintf(&v13[(int)v14], 0x10000 - v5, "] ") + (uint64_t)(int)v14;
          ++v10;
          if ((int)v12 > 80 || (uint64_t v16 = *(unsigned int *)(a1 + 8), v10 == v16))
          {
            uint64_t v17 = v5 + (uint64_t)snprintf(&v13[v12], 0x10000 - v5, "\n");
            int v5 = snprintf(&DYArgumentsCLIHelp_buffer[v12 + v17], 0x10000 - v17, "%*s", v31, "") + v12 + v17;
            LODWORD(v16) = *(_DWORD *)(a1 + 8);
            LODWORD(v12) = 0;
          }
          uint64_t v11 = *(void *)(a1 + 16);
          size_t v18 = strlen(*(const char **)(v11 + v9));
          if (v18 > v3) {
            size_t v3 = v18;
          }
          v9 += 56;
        }
        while (v10 < (int)v16);
        uint64_t v19 = v5;
        size_t v6 = 0x10000 - v5;
        int v8 = v12;
      }
      int v20 = snprintf(&DYArgumentsCLIHelp_buffer[v19 + v8], v6, "\noptions:\n") + v5;
      if (*(int *)(a1 + 8) >= 1)
      {
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        do
        {
          BOOL v23 = (const char **)(*(void *)(a1 + 16) + v21);
          if (v23[1]) {
            BOOL v24 = v23[1];
          }
          else {
            BOOL v24 = "  ";
          }
          int v25 = strlen(*v23);
          int v26 = snprintf(__str, 0x400uLL, "%s %s%*s %s", v24, *v23, v3 - v25, "", v23[2]);
          uint64_t v27 = *(void *)(a1 + 16);
          int v28 = *(_DWORD *)(v27 + v21 + 32);
          if (v28 == 2)
          {
            snprintf(&__str[v26], 0x400uLL, " [default = %zu]", *(void *)(v27 + v21 + 40));
          }
          else if (v28 == 1)
          {
            float v29 = *(const char **)(v27 + v21 + 40);
            if (v29) {
              snprintf(&__str[v26], 0x400uLL, " [default = \"%s\"]", v29);
            }
          }
          v20 += snprintf(&DYArgumentsCLIHelp_buffer[v20], 0x10000 - v20, "\t%s\n", __str);
          ++v22;
          v21 += 56;
        }
        while (v22 < *(int *)(a1 + 8));
      }
      DYArgumentsCLIHelp_buffer[v20] = 10;
      float v1 = (const char **)(v20 + 1);
    }
    else
    {
      float v1 = 0;
    }
  }
  DYArgumentsCLIHelp_buffer[(void)v1] = 0;
  return DYArgumentsCLIHelp_buffer;
}

void sub_24F6819A4(_Unwind_Exception *a1)
{
  MEMORY[0x253360DD0](v1, 0x1000C40EED21634);
  _Unwind_Resume(a1);
}

void sub_24F681A68(_Unwind_Exception *a1)
{
  MEMORY[0x253360DD0](v1, 0x1000C40EED21634);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::AlignmentBuffer::CopyAndAlign(GPUTools::AlignmentBuffer *this, const void *__src, size_t __n, uint64_t a4)
{
  size_t v7 = *((void *)this + 1);
  uint64_t v8 = (a4 + *((void *)this + 2) - 1) & -a4;
  unint64_t v9 = v8 + __n;
  if (v8 + __n <= v7)
  {
    uint64_t v11 = *(char **)this;
  }
  else
  {
    if (v7)
    {
      if (v9 <= 2 * v7) {
        size_t v10 = 2 * v7;
      }
      else {
        size_t v10 = v8 + __n;
      }
      *((void *)this + 1) = v10;
      uint64_t v11 = (char *)reallocf(*(void **)this, v10);
      *(void *)this = v11;
      if (!v11) {
        dy_abort("failed to reallocate misaligned values buffer");
      }
    }
    else
    {
      if (v9 <= *((void *)this + 3)) {
        size_t v12 = *((void *)this + 3);
      }
      else {
        size_t v12 = v8 + __n;
      }
      *((void *)this + 1) = v12;
      uint64_t v11 = (char *)malloc_type_malloc(v12, 0x5617A68CuLL);
      *(void *)this = v11;
      if (!v11) {
        dy_abort("failed to allocate misaligned values buffer");
      }
    }
    if ((v11 & 0xF) != 0) {
      dy_abort("misaligned misaligned values buffer: %p, required alignment=16", v11);
    }
  }
  memcpy(&v11[v8], __src, __n);
  *((void *)this + 2) = v9;
  return v8;
}

uint64_t GPUTools::Statistics::Statistics(uint64_t a1, void *a2, std::vector<unsigned int>::size_type __n)
{
  *(void *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (!a2 || !__n) {
    return a1;
  }
  unint64_t v6 = __n - 1;
  if (__n == 1)
  {
    uint64_t v7 = *a2;
    *(void *)(a1 + 16) = *a2;
    *(void *)(a1 + 24) = v7;
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v7;
    uint64_t v8 = 2 * a2[1];
    *(void *)(a1 + 48) = v8 * v7;
    *(void *)(a1 + 56) = v8;
    *(void *)(a1 + 64) = v7;
    return a1;
  }
  memset(&v62, 0, sizeof(v62));
  std::vector<unsigned int>::__append(&v62, __n);
  std::vector<unsigned int>::pointer begin = v62.__begin_;
  uint64_t v10 = *(void *)(a1 + 40);
  if (__n < 8)
  {
    std::vector<unsigned int>::size_type v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    goto LABEL_7;
  }
  unsigned int v12 = 0;
  std::vector<unsigned int>::size_type v11 = 0;
  if (v6 == -1)
  {
    unint64_t v13 = 0;
    do
    {
LABEL_7:
      begin[v11] = v12;
      uint64_t v14 = a2[2 * v11 + 1];
      v13 += v14;
      v10 += a2[2 * v11] * v14;
      std::vector<unsigned int>::size_type v11 = ++v12;
    }
    while (v12 < __n);
    goto LABEL_8;
  }
  unint64_t v13 = 0;
  if (HIDWORD(v6)) {
    goto LABEL_7;
  }
  std::vector<unsigned int>::size_type v11 = __n & 0xFFFFFFFFFFFFFFF8;
  unsigned int v12 = __n & 0xFFFFFFF8;
  int64x2_t v20 = 0uLL;
  int64x2_t v21 = (int64x2_t)*(unint64_t *)(a1 + 40);
  uint64_t v22 = (const double *)(a2 + 8);
  v23.i64[0] = 0x400000004;
  v23.i64[1] = 0x400000004;
  v24.i64[0] = 0x800000008;
  v24.i64[1] = 0x800000008;
  int32x4_t v25 = (int32x4_t)xmmword_24F6955C0;
  int v26 = (int32x4_t *)(v62.__begin_ + 4);
  std::vector<unsigned int>::size_type v27 = __n & 0xFFFFFFFFFFFFFFF8;
  int64x2_t v28 = 0uLL;
  int64x2_t v29 = 0uLL;
  int64x2_t v30 = 0uLL;
  int64x2_t v31 = 0uLL;
  int64x2_t v32 = 0uLL;
  int64x2_t v33 = 0uLL;
  do
  {
    v26[-1] = v25;
    *int v26 = vaddq_s32(v25, v23);
    float v34 = v22 - 8;
    float64x2x2_t v63 = vld2q_f64(v34);
    float v35 = v22 - 4;
    float64x2x2_t v64 = vld2q_f64(v35);
    float v36 = v22;
    float64x2x2_t v65 = vld2q_f64(v36);
    v36 += 4;
    float64x2x2_t v66 = vld2q_f64(v36);
    int64x2_t v31 = vaddq_s64((int64x2_t)v64.val[1], v31);
    int64x2_t v30 = vaddq_s64((int64x2_t)v63.val[1], v30);
    int64x2_t v32 = vaddq_s64((int64x2_t)v65.val[1], v32);
    *(void *)&v63.val[0].f64[0] *= *(void *)&v63.val[1].f64[0];
    int64x2_t v33 = vaddq_s64((int64x2_t)v66.val[1], v33);
    *(void *)&v63.val[1].f64[0] = *(void *)&v64.val[0].f64[0] * *(void *)&v64.val[1].f64[0];
    *(void *)&v63.val[0].f64[1] *= *(void *)&v63.val[1].f64[1];
    *(void *)&v63.val[1].f64[1] = *(void *)&v64.val[0].f64[1] * *(void *)&v64.val[1].f64[1];
    *(void *)&v64.val[0].f64[0] = *(void *)&v66.val[0].f64[0] * *(void *)&v66.val[1].f64[0];
    *(void *)&v64.val[0].f64[1] = *(void *)&v66.val[0].f64[1] * *(void *)&v66.val[1].f64[1];
    *(void *)&v64.val[1].f64[0] = *(void *)&v65.val[0].f64[0] * *(void *)&v65.val[1].f64[0];
    *(void *)&v64.val[1].f64[1] = *(void *)&v65.val[0].f64[1] * *(void *)&v65.val[1].f64[1];
    int64x2_t v20 = vaddq_s64(v20, (int64x2_t)v63.val[1]);
    int64x2_t v21 = vaddq_s64(v21, (int64x2_t)v63.val[0]);
    int64x2_t v28 = vaddq_s64(v28, (int64x2_t)v64.val[1]);
    int64x2_t v29 = vaddq_s64(v29, (int64x2_t)v64.val[0]);
    int32x4_t v25 = vaddq_s32(v25, v24);
    v22 += 16;
    v26 += 2;
    v27 -= 8;
  }
  while (v27);
  unint64_t v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v32, v30), vaddq_s64(v33, v31)));
  uint64_t v10 = vaddvq_s64(vaddq_s64(vaddq_s64(v28, v21), vaddq_s64(v29, v20)));
  if (v11 != __n) {
    goto LABEL_7;
  }
LABEL_8:
  *(void *)(a1 + 40) = v10;
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 0x40000000;
  v61[2] = ___ZN8GPUTools10StatisticsC2EPKNS0_7elementEm_block_invoke;
  v61[3] = &__block_descriptor_tmp_3;
  v61[4] = a2;
  qsort_b(begin, __n, 4uLL, v61);
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  *(void *)(a1 + 40) = (*(void *)(a1 + 40) + (v13 >> 1)) / v13;
  uint64_t v17 = v62.__begin_;
  *(void *)a1 = a2[2 * *v62.__begin_];
  *(void *)(a1 + 32) = a2[2 * v17[v6]];
  unint64_t v18 = 2 * v13;
  while (1)
  {
    uint64_t v19 = v17[v16];
    v15 += 4 * a2[2 * v19 + 1];
    if (v15 == v18)
    {
      uint64_t v37 = (a2[2 * v17[v16 + 1]] + a2[2 * v19]) >> 1;
      goto LABEL_21;
    }
    if (v15 > v18) {
      break;
    }
    if (__n == ++v16) {
      goto LABEL_22;
    }
  }
  uint64_t v37 = a2[2 * v19];
LABEL_21:
  *(void *)(a1 + 16) = v37;
LABEL_22:
  unint64_t v38 = 0;
  std::vector<unsigned int>::size_type v39 = 0;
  while (1)
  {
    v38 += 4 * a2[2 * v17[v39] + 1];
    uint64_t v40 = v38 - v13;
    if (v38 > v13) {
      break;
    }
    if (__n == ++v39)
    {
      std::vector<unsigned int>::size_type v39 = __n;
      break;
    }
  }
  if (v6 >= v39)
  {
    unint64_t v41 = 0;
    do
    {
      v41 += 4 * a2[2 * v17[v6] + 1];
      if (v41 > v13) {
        break;
      }
      --v6;
    }
    while (v6 >= v39);
  }
  else
  {
    unint64_t v41 = 0;
  }
  unint64_t v42 = v41 - v13;
  uint64_t v43 = v17[v39];
  if (v39 == v6)
  {
    uint64_t v44 = &a2[2 * v43];
    uint64_t v45 = *v44;
    *(void *)(a1 + 24) = *v44;
    *(void *)(a1 + 8) = v45;
    unint64_t v18 = v42 + v40 - 4 * v44[1];
    *(void *)(a1 + 56) = v18;
    unint64_t v46 = v18 * v45;
  }
  else
  {
    if (v40 == 4 * a2[2 * v43 + 1])
    {
      unint64_t v47 = a2[2 * v43];
      unint64_t v48 = (v47 + a2[2 * v17[v39 - 1]]) >> 1;
    }
    else
    {
      unint64_t v47 = a2[2 * v43];
      unint64_t v48 = v47;
    }
    *(void *)(a1 + 8) = v48;
    unint64_t v49 = a2[2 * v17[v6]];
    unint64_t v50 = v49;
    if (v42 == 4 * a2[2 * v17[v6] + 1]) {
      unint64_t v50 = (a2[2 * v17[v6 + 1]] + v49) >> 1;
    }
    *(void *)(a1 + 24) = v50;
    *(void *)(a1 + 56) = v18;
    unint64_t v46 = v47 * v40 + v49 * v42;
    std::vector<unsigned int>::size_type v51 = v39 + 1;
    if (v39 + 1 < v6)
    {
      unint64_t v52 = v6 + ~v39;
      if (v52 < 2) {
        goto LABEL_43;
      }
      uint64_t v53 = 0;
      v51 += v52 & 0xFFFFFFFFFFFFFFFELL;
      float v54 = &v17[v39 + 2];
      unint64_t v55 = v52 & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        float v56 = &a2[2 * *(v54 - 1)];
        v46 += 4 * *v56 * v56[1];
        v53 += 4 * a2[2 * *v54] * a2[2 * *v54 + 1];
        v54 += 2;
        v55 -= 2;
      }
      while (v55);
      v46 += v53;
      if (v52 != (v52 & 0xFFFFFFFFFFFFFFFELL))
      {
LABEL_43:
        unint64_t v57 = v6 - v51;
        float v58 = &v17[v51];
        do
        {
          unsigned int v59 = *v58++;
          v46 += 4 * a2[2 * v59] * a2[2 * v59 + 1];
          --v57;
        }
        while (v57);
      }
    }
  }
  *(void *)(a1 + 48) = v46;
  *(void *)(a1 + 64) = (v46 + (v18 >> 1)) / v18;
  v62.__end_ = v17;
  operator delete(v17);
  return a1;
}

void sub_24F682234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN8GPUTools10StatisticsC2EPKNS0_7elementEm_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 16 * *a2);
  unint64_t v5 = *(void *)(v3 + 16 * *a3);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  if (v6) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::vector<unsigned int>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  BOOL v6 = end;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(end, 4 * __n);
      BOOL v6 = &end[__n];
    }
    this->__end_ = v6;
  }
  else
  {
    std::vector<unsigned int>::pointer begin = this->__begin_;
    uint64_t v8 = (char *)end - (char *)this->__begin_;
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + __n;
    if (v10 >> 62) {
      std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = (char *)value - (char *)begin;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v13 = operator new(4 * v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    size_t v15 = 4 * __n;
    uint64_t v16 = (unsigned int *)&v13[4 * v12];
    bzero(v14, v15);
    uint64_t v17 = (unsigned int *)&v14[v15];
    if (end != begin)
    {
      unint64_t v18 = (char *)end - (char *)begin - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)((char *)end - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      BOOL v6 = &end[v20 / 0xFFFFFFFFFFFFFFFCLL];
      v14 -= v20;
      int64x2_t v21 = &v13[4 * v9 - 16];
      uint64_t v22 = (long long *)(end - 4);
      uint64_t v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v24 = *v22;
        *(v21 - 1) = *(v22 - 1);
        *int64x2_t v21 = v24;
        v21 -= 2;
        v22 -= 2;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v25 = *--v6;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != begin);
      }
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v14;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

uint64_t GPUTools::SM::DecodeArgumentToString(std::string *a1, uint64_t a2, int a3, unsigned int a4)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v21);
  __int16 v8 = *(_WORD *)(a2 + 22);
  if (v8)
  {
    if (*(unsigned __int16 *)(a2 + 20) <= a4) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
LABEL_3:
    if (a3) {
      goto LABEL_44;
    }
    uint64_t v9 = "";
LABEL_12:
    MEMORY[0x253360BD0](a1, v9);
    goto LABEL_44;
  }
  unint64_t v10 = *(const char **)a2;
  if (!*(void *)a2)
  {
    if (a3)
    {
      std::string::push_back(a1, 32);
      std::string::append(a1, "null");
      goto LABEL_44;
    }
    uint64_t v9 = "null";
    goto LABEL_12;
  }
  switch(*(_DWORD *)(a2 + 8))
  {
    case 1:
    case 2:
      LOBYTE(__p[0]) = v10[a4];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)__p, 1);
      goto LABEL_33;
    case 3:
      std::ostream::operator<<();
      goto LABEL_33;
    case 4:
      std::ostream::operator<<();
      goto LABEL_33;
    case 5:
      if (*(_DWORD *)(a2 + 12) == 19) {
        goto LABEL_23;
      }
      std::ostream::operator<<();
      goto LABEL_33;
    case 6:
      goto LABEL_32;
    case 7:
      std::ostream::operator<<();
      goto LABEL_33;
    case 8:
      std::ostream::operator<<();
      goto LABEL_33;
    case 9:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xA:
LABEL_23:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xB:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xC:
      std::ostream::operator<<();
      goto LABEL_33;
    case 0xD:
      if ((v8 & 0x10) != 0)
      {
        GPUTools::FD::Argument::ViewAsGLObjectName((const char **)a2);
LABEL_32:
        std::ostream::operator<<();
      }
      else if ((v8 & 0x18) != 0 || *(_DWORD *)(a2 + 12) == 14)
      {
        if (v8)
        {
          uint64_t v15 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)a2);
          uint64_t v16 = *(void *)v15;
          if ((*(_WORD *)(v15 + 22) & 0x40) != 0) {
            uint64_t v17 = (const char *)(*(unsigned int *)(v16 + 4 * a4) + v16);
          }
          else {
            uint64_t v17 = *(const char **)(v16 + 8 * a4);
          }
          size_t v18 = strlen(v17);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v17, v18);
        }
        else
        {
          size_t v11 = strlen(*(const char **)a2);
LABEL_15:
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v10, v11);
        }
      }
LABEL_33:
      if (a3)
      {
        std::string::append(a1, " ");
        std::stringbuf::str();
        if (v20 >= 0) {
          unint64_t v12 = __p;
        }
        else {
          unint64_t v12 = (void **)__p[0];
        }
        std::string::append(a1, (const std::string::value_type *)v12);
      }
      else
      {
        std::stringbuf::str();
        if (v20 >= 0) {
          unint64_t v13 = __p;
        }
        else {
          unint64_t v13 = (void **)__p[0];
        }
        MEMORY[0x253360BD0](a1, v13);
      }
      if (v20 < 0) {
        operator delete(__p[0]);
      }
      break;
    default:
      unint64_t v10 = "UnknownParameterType";
      size_t v11 = 20;
      goto LABEL_15;
  }
LABEL_44:
  v21[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v21 + *(void *)(v21[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v21[1] = MEMORY[0x263F8C318] + 16;
  if (v22 < 0) {
    operator delete((void *)v21[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x253360D80](&v23);
}

void sub_24F682804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  unint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_24F6829E4(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x253360D80](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x253360D80](a1 + 112);
  return a1;
}

uint64_t GPUTools::SM::__DYDecodeArgumentSingleComponentDispatch(std::string *a1, uint64_t a2, unsigned int a3)
{
  return GPUTools::SM::DecodeArgumentToString(a1, a2, 0, a3);
}

uint64_t GPUTools::SM::__DYDecodeArgumentDispatch(std::string *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v6 = a2 + 24 * a3 + 48;
  uint64_t result = GPUTools::SM::DecodeArgumentToString(a1, v6, 0, 0);
  if (a4 >= 2)
  {
    unsigned int v8 = 1;
    do
      uint64_t result = GPUTools::SM::DecodeArgumentToString(a1, v6, 1, v8++);
    while (a4 != v8);
  }
  return result;
}

float GPUTools::SM::__DYDecodeArgumentDispatch(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  memset(v7, 0, sizeof(v7));
  GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,16u>>(v7, a2, a3, a4, a5);
  return DYMtxSetColumnMajor(a1, (uint64_t)v7);
}

{
  float result;
  uint64_t v7;
  float v8;

  unsigned int v8 = 0.0;
  BOOL v7 = 0;
  GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,3u>>(&v7, a2, a3, a4, a5);
  *(void *)a1 = v7;
  uint64_t result = v8;
  *(float *)(a1 + 8) = v8;
  return result;
}

void GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,16u>>(_DWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5 = a3;
  uint64_t v8 = a2 + 24 * a3;
  if (*(_WORD *)(v8 + 70))
  {
    unsigned int v11 = *(unsigned __int16 *)(a2 + 24 * a3 + 68);
    if (v11 >= 0x10) {
      unsigned int v11 = 16;
    }
    if (v11 >= a4) {
      uint64_t v12 = a4;
    }
    else {
      uint64_t v12 = v11;
    }
    if (v12)
    {
      uint64_t v14 = v8 + 48;
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(v14, a5++).n128_u32[0];
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 10) - a3;
    if (v9 >= a4) {
      unsigned int v9 = a4;
    }
    if (v9 >= 0x10) {
      uint64_t v10 = 16;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v10)
    {
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(a2 + 24 * (unint64_t)v5++ + 48, 0).n128_u32[0];
        --v10;
      }
      while (v10);
    }
  }
}

double GPUTools::SM::__DYDecodeArgumentDispatch(_OWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  long long v7 = 0uLL;
  GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,4u>>(&v7, a2, a3, a4, a5);
  double result = *(double *)&v7;
  *a1 = v7;
  return result;
}

void GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,4u>>(_DWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5 = a3;
  uint64_t v8 = a2 + 24 * a3;
  if (*(_WORD *)(v8 + 70))
  {
    unsigned int v11 = *(unsigned __int16 *)(a2 + 24 * a3 + 68);
    if (v11 >= 4) {
      unsigned int v11 = 4;
    }
    if (v11 >= a4) {
      uint64_t v12 = a4;
    }
    else {
      uint64_t v12 = v11;
    }
    if (v12)
    {
      uint64_t v14 = v8 + 48;
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(v14, a5++).n128_u32[0];
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 10) - a3;
    if (v9 >= a4) {
      unsigned int v9 = a4;
    }
    if (v9 >= 4) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v10)
    {
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(a2 + 24 * (unint64_t)v5++ + 48, 0).n128_u32[0];
        --v10;
      }
      while (v10);
    }
  }
}

void GPUTools::SM::DYDecodeArgumentToVecNType<GPUTools::SM::VecN<float,3u>>(_DWORD *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v5 = a3;
  uint64_t v8 = a2 + 24 * a3;
  if (*(_WORD *)(v8 + 70))
  {
    unsigned int v11 = *(unsigned __int16 *)(a2 + 24 * a3 + 68);
    if (v11 >= 3) {
      unsigned int v11 = 3;
    }
    if (v11 >= a4) {
      uint64_t v12 = a4;
    }
    else {
      uint64_t v12 = v11;
    }
    if (v12)
    {
      uint64_t v14 = v8 + 48;
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(v14, a5++).n128_u32[0];
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 10) - a3;
    if (v9 >= a4) {
      unsigned int v9 = a4;
    }
    if (v9 >= 3) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v10)
    {
      do
      {
        *a1++ = GPUTools::FD::Argument::ViewAsScalarArray<float>(a2 + 24 * (unint64_t)v5++ + 48, 0).n128_u32[0];
        --v10;
      }
      while (v10);
    }
  }
}

__n128 GPUTools::FD::Argument::ViewAsScalarArray<float>(uint64_t a1, unint64_t a2)
{
  __int16 v2 = *(_WORD *)(a1 + 22);
  if (v2)
  {
    result.n128_u32[0] = 0;
    if (*(unsigned __int16 *)(a1 + 20) <= a2) {
      return result;
    }
  }
  else
  {
    result.n128_u32[0] = 0;
    if (a2) {
      return result;
    }
  }
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      int v5 = *(char *)(*(void *)a1 + a2);
      goto LABEL_18;
    case 2:
      result.n128_u8[0] = *(unsigned char *)(*(void *)a1 + a2);
      goto LABEL_20;
    case 3:
      int v5 = *(__int16 *)(*(void *)a1 + 2 * a2);
      goto LABEL_18;
    case 4:
      result.n128_u16[0] = *(_WORD *)(*(void *)a1 + 2 * a2);
      goto LABEL_20;
    case 5:
      int v5 = *(_DWORD *)(*(void *)a1 + 4 * a2);
      if (*(_DWORD *)(a1 + 12) == 19)
      {
        double v4 = (double)v5 * 0.0000152587891;
LABEL_17:
        result.n128_f32[0] = v4;
      }
      else
      {
LABEL_18:
        result.n128_f32[0] = (float)v5;
      }
      break;
    case 6:
      result.n128_u32[0] = *(_DWORD *)(*(void *)a1 + 4 * a2);
LABEL_20:
      result.n128_f32[0] = (float)result.n128_u32[0];
      return result;
    case 7:
    case 0xB:
      result.n128_f32[0] = (float)*(uint64_t *)(*(void *)a1 + 8 * a2);
      return result;
    case 8:
    case 0xC:
      result.n128_f32[0] = (float)*(unint64_t *)(*(void *)a1 + 8 * a2);
      return result;
    case 9:
      result.n128_u32[0] = *(_DWORD *)(*(void *)a1 + 4 * a2);
      return result;
    case 0xA:
      double v4 = *(double *)(*(void *)a1 + 8 * a2);
      goto LABEL_17;
    case 0xD:
      if ((v2 & 0x10) != 0) {
        result.n128_f32[0] = (float)GPUTools::FD::Argument::ViewAsGLObjectName((const char **)a1);
      }
      return result;
    default:
      return result;
  }
  return result;
}

uint64_t DYGetHostInfo(void)
{
  return gHostInfo;
}

uint64_t DYSetHostInfo(uint64_t result)
{
  gHostInfo = result;
  return result;
}

void sub_24F6838B0(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

unint64_t handle_exit(void)
{
  unint64_t result = [(id)_gWeakAppClients count];
  if (result)
  {
    uint64_t v1 = 0;
    int v2 = 0;
    do
    {
      id v3 = (id)[(id)_gWeakAppClients pointerAtIndex:v1];
      [v3 atexit];

      uint64_t v1 = ++v2;
      unint64_t result = [(id)_gWeakAppClients count];
    }
    while (result > v2);
  }
  return result;
}

uint64_t GPUTools::FB::Stream::Flush(GPUTools::FB::Stream *this)
{
  for (uint64_t i = (atomic_uint *)((char *)this + 56); atomic_exchange(i, 1u) == 1; uint64_t i = (atomic_uint *)((char *)this + 56))
  {
    while (*((_DWORD *)this + 14) == 1)
      ;
  }
  uint64_t result = (*(uint64_t (**)(void))(*((void *)this + 5) + 16))();
  *((void *)this + 2) = *((void *)this + 1) + 8;
  *((unsigned char *)this + 60) = 1;
  atomic_store(0, (unsigned int *)this + 14);
  return result;
}

void sub_24F6840D8(_Unwind_Exception *a1)
{
  atomic_store(0, (unsigned int *)(v1 + 56));
  _Unwind_Resume(a1);
}

void sub_24F68497C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<void const*,std::string>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__emplace_unique_key_args<void const*,std::pair<void const* const,std::string> const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_24F685928(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__emplace_unique_key_args<void const*,std::pair<void const* const,std::string> const&>(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v5 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v6 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v5 >> 47) ^ v5);
  std::string::size_type v7 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47));
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }
    else
    {
      unint64_t v3 = v7 & (v8 - 1);
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v3);
    if (v10)
    {
      uint64_t result = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = result[1];
          if (v12 == v7)
          {
            if (result[2] == *a2) {
              return result;
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
          uint64_t result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__construct_node_hash<std::pair<void const* const,std::string> const&>(a1, v7, a3, (uint64_t)&v21);
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v18);
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
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *int64x2_t v21 = *v19;
    *uint64_t v19 = v21;
  }
  else
  {
    *int64x2_t v21 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v21;
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*v21)
    {
      unint64_t v20 = *(void *)(*v21 + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v20 >= v8) {
          v20 %= v8;
        }
      }
      else
      {
        v20 &= v8 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v20) = v21;
    }
  }
  uint64_t result = v21;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F685B8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__construct_node_hash<std::pair<void const* const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (std::string *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  v8->__r_.__value_.__r.__words[2] = *(void *)a3;
  uint8x8_t v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(void *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(void *)(a3 + 24);
  }
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_24F685C48(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    int v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0) {
        operator delete(v2[3]);
      }
      operator delete(v2);
      int v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::unordered_map<unsigned long long,std::string>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(void **)(a2 + 16); i; uint64_t i = (void *)*i)
    std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::string> const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_24F685D4C(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<void const*,std::string>,std::__unordered_map_hasher<void const*,std::__hash_value_type<void const*,std::string>,std::hash<void const*>,std::equal_to<void const*>,true>,std::__unordered_map_equal<void const*,std::__hash_value_type<void const*,std::string>,std::equal_to<void const*>,std::hash<void const*>,true>,std::allocator<std::__hash_value_type<void const*,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::string> const&>(uint64_t a1, std::string::size_type *a2, uint64_t a3)
{
  std::string::size_type v5 = *a2;
  unint64_t v6 = *(void *)(a1 + 8);
  if (v6)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      std::string::size_type v3 = *a2;
      if (v5 >= v6) {
        std::string::size_type v3 = v5 % v6;
      }
    }
    else
    {
      std::string::size_type v3 = (v6 - 1) & v5;
    }
    unint64_t v8 = *(void **)(*(void *)a1 + 8 * v3);
    if (v8)
    {
      uint64_t result = (void *)*v8;
      if (*v8)
      {
        do
        {
          unint64_t v10 = result[1];
          if (v10 == v5)
          {
            if (result[2] == v5) {
              return result;
            }
          }
          else
          {
            if (v7.u32[0] > 1uLL)
            {
              if (v10 >= v6) {
                v10 %= v6;
              }
            }
            else
            {
              v10 &= v6 - 1;
            }
            if (v10 != v3) {
              break;
            }
          }
          uint64_t result = (void *)*result;
        }
        while (result);
      }
    }
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__construct_node_hash<std::pair<unsigned long long const,std::string> const&>(a1, *a2, a3, (uint64_t)&v19);
  float v11 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v12 = *(float *)(a1 + 32);
  if (!v6 || (float)(v12 * (float)v6) < v11)
  {
    BOOL v13 = 1;
    if (v6 >= 3) {
      BOOL v13 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v14 = v13 | (2 * v6);
    unint64_t v15 = vcvtps_u32_f32(v11 / v12);
    if (v14 <= v15) {
      size_t v16 = v15;
    }
    else {
      size_t v16 = v14;
    }
    std::__hash_table<std::__hash_value_type<void *,unsigned long long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long long>>>::__rehash<true>(a1, v16);
    unint64_t v6 = *(void *)(a1 + 8);
    if ((v6 & (v6 - 1)) != 0)
    {
      if (v5 >= v6) {
        std::string::size_type v3 = v5 % v6;
      }
      else {
        std::string::size_type v3 = v5;
      }
    }
    else
    {
      std::string::size_type v3 = (v6 - 1) & v5;
    }
  }
  unint64_t v17 = *(void **)(*(void *)a1 + 8 * v3);
  if (v17)
  {
    *uint64_t v19 = *v17;
    *unint64_t v17 = v19;
  }
  else
  {
    *uint64_t v19 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v19;
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*v19)
    {
      unint64_t v18 = *(void *)(*v19 + 8);
      if ((v6 & (v6 - 1)) != 0)
      {
        if (v18 >= v6) {
          v18 %= v6;
        }
      }
      else
      {
        v18 &= v6 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v18) = v19;
    }
  }
  uint64_t result = v19;
  ++*(void *)(a1 + 24);
  return result;
}

void sub_24F685F78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::string>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::string>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::string>>>::__construct_node_hash<std::pair<unsigned long long const,std::string> const&>(uint64_t a1@<X0>, std::string::size_type a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (std::string *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  v8->__r_.__value_.__l.__size_ = a2;
  v8->__r_.__value_.__r.__words[2] = *(void *)a3;
  uint8x8_t v9 = v8 + 1;
  if (*(char *)(a3 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a3 + 8), *(void *)(a3 + 16));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 8);
    v9->__r_.__value_.__r.__words[2] = *(void *)(a3 + 24);
  }
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_24F686034(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t dy_dispatch(uint64_t a1, uint64_t a2, int a3, uint64_t a4, _DWORD *a5, __n128 a6, __n128 a7, __n128 a8, __n128 a9, __n128 a10, __n128 a11)
{
  switch(a3)
  {
    case 2:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2736);
      goto LABEL_550;
    case 3:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 8);
      goto LABEL_310;
    case 6:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 4784);
      goto LABEL_162;
    case 9:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5096);
      goto LABEL_574;
    case 10:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 5568);
      goto LABEL_550;
    case 11:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5040);
      goto LABEL_425;
    case 12:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5136);
      goto LABEL_574;
    case 13:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5560);
      goto LABEL_555;
    case 15:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5544);
      goto LABEL_435;
    case 17:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5376);
      goto LABEL_574;
    case 19:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5328);
      goto LABEL_574;
    case 20:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 40);
      goto LABEL_574;
    case 23:
      size_t v16 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128))(a1 + 2696);
      goto LABEL_252;
    case 24:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2704);
      goto LABEL_550;
    case 25:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3664);
      goto LABEL_574;
    case 26:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 56);
      goto LABEL_574;
    case 27:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2688);
      goto LABEL_524;
    case 28:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6040);
      uint64_t v28 = **(unsigned int **)(a4 + 8);
      uint64_t v29 = **(unsigned int **)(a4 + 16);
      uint64_t v30 = **(unsigned int **)(a4 + 24);
      uint64_t v31 = **(unsigned int **)(a4 + 32);
      uint64_t v32 = **(unsigned int **)(a4 + 40);
      uint64_t v33 = **(unsigned int **)(a4 + 48);
      uint64_t v34 = **(unsigned int **)(a4 + 56);
      int v35 = **(_DWORD **)(a4 + 64);
      HIDWORD(v135) = **(_DWORD **)(a4 + 72);
      LODWORD(v136) = **(_DWORD **)(a4 + 80);
      goto LABEL_276;
    case 29:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5168);
      uint64_t v18 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(void **)(a4 + 16);
      unint64_t v20 = *(unsigned int **)(a4 + 32);
      uint64_t v21 = **(void **)(a4 + 24);
      uint64_t v22 = *v20;
      uint64_t v23 = a2;
      uint64_t v24 = v18;
      return v17(v23, v24, v19, v21, v22);
    case 31:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5176);
      uint64_t v25 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(void **)(a4 + 16);
      int v26 = *(uint64_t **)(a4 + 32);
      uint64_t v21 = **(void **)(a4 + 24);
      uint64_t v22 = *v26;
      uint64_t v23 = a2;
      uint64_t v24 = v25;
      return v17(v23, v24, v19, v21, v22);
    case 34:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5400))(a2, **(unsigned int **)(a4 + 8));
      *a5 = result;
      return result;
    case 36:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 80);
      goto LABEL_550;
    case 38:
      size_t v16 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128))(a1 + 96);
      goto LABEL_252;
    case 43:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 120);
      goto LABEL_550;
    case 44:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2728);
      goto LABEL_550;
    case 66:
      size_t v16 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128))(a1 + 296);
      goto LABEL_252;
    case 72:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
      goto LABEL_546;
    case 78:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 392);
LABEL_546:
      uint64_t v131 = **(unsigned __int8 **)(a4 + 8);
      uint64_t v19 = **(unsigned __int8 **)(a4 + 16);
      float v133 = *(unsigned __int8 **)(a4 + 32);
      uint64_t v21 = **(unsigned __int8 **)(a4 + 24);
      uint64_t v22 = *v133;
      goto LABEL_525;
    case 81:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 408);
      goto LABEL_569;
    case 93:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4768);
      goto LABEL_367;
    case 95:
      return (*(uint64_t (**)(uint64_t, void, void, void, void, void, void, void, void))(a1 + 3040))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(unsigned int **)(a4 + 24), **(unsigned int **)(a4 + 32), **(unsigned int **)(a4 + 40), **(unsigned int **)(a4 + 48), **(unsigned int **)(a4 + 56), **(void **)(a4 + 64));
    case 96:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3032);
      goto LABEL_87;
    case 98:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3064);
      goto LABEL_87;
    case 99:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3056);
      goto LABEL_156;
    case 112:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 432);
      goto LABEL_158;
    case 114:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 448);
LABEL_158:
      uint64_t v28 = **(unsigned int **)(a4 + 8);
      uint64_t v29 = **(unsigned int **)(a4 + 16);
      uint64_t v30 = **(unsigned int **)(a4 + 24);
      uint64_t v31 = **(unsigned int **)(a4 + 32);
      uint64_t v32 = **(unsigned int **)(a4 + 40);
      uint64_t v33 = **(unsigned int **)(a4 + 48);
      uint64_t v34 = **(unsigned int **)(a4 + 56);
      int v35 = **(_DWORD **)(a4 + 64);
      goto LABEL_276;
    case 115:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3520);
      uint64_t v28 = **(unsigned int **)(a4 + 8);
      uint64_t v29 = **(unsigned int **)(a4 + 16);
      uint64_t v30 = **(unsigned int **)(a4 + 24);
      uint64_t v31 = **(unsigned int **)(a4 + 32);
      uint64_t v32 = **(unsigned int **)(a4 + 40);
      uint64_t v33 = **(unsigned int **)(a4 + 48);
      uint64_t v34 = **(unsigned int **)(a4 + 56);
      int v35 = **(_DWORD **)(a4 + 64);
      int v36 = **(_DWORD **)(a4 + 72);
      goto LABEL_275;
    case 116:
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 4776))(a2);
      *(void *)a5 = result;
      return result;
    case 117:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 4752))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_213;
    case 118:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 456);
      goto LABEL_550;
    case 119:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5144);
      goto LABEL_565;
    case 120:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3712);
      goto LABEL_565;
    case 121:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5384);
      goto LABEL_565;
    case 123:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4728);
      goto LABEL_367;
    case 125:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5080);
      goto LABEL_565;
    case 126:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5336);
      goto LABEL_565;
    case 127:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 472);
      goto LABEL_565;
    case 130:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 480);
      goto LABEL_550;
    case 131:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 488);
      uint64_t v79 = **(unsigned __int8 **)(a4 + 8);
      goto LABEL_551;
    case 133:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 4744);
LABEL_162:
      uint64_t v80 = **(void **)(a4 + 16);
      uint64_t v81 = a2;
      uint64_t v82 = **(void **)(a4 + 8);
      return v14(v81, v82, v80);
    case 134:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 504);
      goto LABEL_550;
    case 135:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 512);
      goto LABEL_550;
    case 138:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4104);
      goto LABEL_550;
    case 139:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 520);
      goto LABEL_555;
    case 141:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5232);
      goto LABEL_565;
    case 143:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 536);
      goto LABEL_569;
    case 146:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3240);
      uint64_t v58 = **(unsigned int **)(a4 + 8);
      uint64_t v59 = **(unsigned int **)(a4 + 16);
      uint64_t v60 = **(unsigned int **)(a4 + 24);
      uint64_t v61 = **(unsigned int **)(a4 + 32);
      goto LABEL_166;
    case 151:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 576);
      goto LABEL_550;
    case 152:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 584);
      goto LABEL_550;
    case 155:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4096);
      goto LABEL_550;
    case 159:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 5104);
      goto LABEL_550;
    case 160:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 5576);
      uint64_t v72 = a2;
      return v71(v72);
    case 175:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 712);
      uint64_t v72 = a2;
      return v71(v72);
    case 176:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 3744);
      goto LABEL_550;
    case 177:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3760);
      goto LABEL_574;
    case 179:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 720);
      uint64_t v72 = a2;
      return v71(v72);
    case 188:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 728);
      goto LABEL_310;
    case 189:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 736);
      goto LABEL_565;
    case 192:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5432);
      goto LABEL_524;
    case 194:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5416);
      goto LABEL_560;
    case 198:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5528);
      goto LABEL_560;
    case 199:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 760);
      goto LABEL_550;
    case 201:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5152);
      goto LABEL_565;
    case 202:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3704);
      goto LABEL_565;
    case 203:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5392);
      goto LABEL_565;
    case 206:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5072);
      goto LABEL_565;
    case 207:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5344);
      goto LABEL_565;
    case 208:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 784);
      goto LABEL_565;
    case 210:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 5448);
      goto LABEL_550;
    case 211:
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5048);
      goto LABEL_191;
    case 212:
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5008);
LABEL_191:
      uint64_t v44 = **(unsigned int **)(a4 + 16);
      uint64_t v45 = **(void **)(a4 + 32);
      uint64_t v46 = **(void **)(a4 + 40);
      uint64_t v47 = **(void **)(a4 + 48);
      uint64_t v48 = **(void **)(a4 + 56);
      uint64_t v49 = a2;
      uint64_t v50 = **(void **)(a4 + 8);
      uint64_t v51 = **(unsigned int **)(a4 + 24);
      goto LABEL_540;
    case 214:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6072);
      goto LABEL_439;
    case 215:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 5056))(a2, **(void **)(a4 + 8), **(void **)(a4 + 16));
      goto LABEL_196;
    case 217:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 792);
      goto LABEL_565;
    case 218:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5208);
      goto LABEL_443;
    case 219:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5216);
      goto LABEL_443;
    case 230:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3080);
      goto LABEL_443;
    case 235:
      uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 816))(a2);
      *a5 = result;
      return result;
    case 238:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 824);
      goto LABEL_565;
    case 239:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 5952))(a2, **(unsigned int **)(a4 + 8), **(void **)(a4 + 16));
      goto LABEL_390;
    case 240:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5440);
      goto LABEL_569;
    case 246:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5600);
      goto LABEL_443;
    case 247:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 832);
      goto LABEL_565;
    case 248:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 840);
      goto LABEL_443;
    case 253:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 880);
      goto LABEL_443;
    case 264:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 920);
      goto LABEL_565;
    case 268:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5280);
      goto LABEL_439;
    case 272:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5264);
      goto LABEL_443;
    case 274:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5120);
      goto LABEL_443;
    case 275:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5128);
      goto LABEL_443;
    case 276:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5112);
      goto LABEL_443;
    case 277:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5360);
      goto LABEL_443;
    case 279:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5272);
      goto LABEL_439;
    case 280:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5032);
      goto LABEL_262;
    case 281:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5256);
      goto LABEL_443;
    case 282:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 936))(a2, **(unsigned int **)(a4 + 8));
LABEL_213:
      *(void *)a5 = result;
      return result;
    case 283:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 944);
      goto LABEL_443;
    case 284:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 952);
      goto LABEL_443;
    case 288:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 984);
      goto LABEL_534;
    case 290:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1000);
      goto LABEL_569;
    case 294:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1008);
      goto LABEL_443;
    case 295:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1016);
      goto LABEL_443;
    case 296:
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5592);
      uint64_t v44 = **(unsigned int **)(a4 + 16);
      uint64_t v45 = **(void **)(a4 + 32);
      uint64_t v46 = **(void **)(a4 + 40);
      uint64_t v47 = **(void **)(a4 + 48);
      uint64_t v48 = **(void **)(a4 + 56);
      uint64_t v49 = a2;
      uint64_t v50 = **(unsigned int **)(a4 + 8);
      uint64_t v51 = **(unsigned int **)(a4 + 24);
      goto LABEL_540;
    case 299:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 5000))(a2, **(void **)(a4 + 8), **(void **)(a4 + 16));
LABEL_196:
      *a5 = result;
      return result;
    case 300:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5016);
      goto LABEL_425;
    case 301:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5024);
      goto LABEL_425;
    case 302:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5936);
      goto LABEL_443;
    case 303:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5856);
      goto LABEL_443;
    case 304:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5864);
      goto LABEL_443;
    case 305:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4136);
      goto LABEL_443;
    case 307:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4120);
      goto LABEL_443;
    case 308:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4128);
      goto LABEL_443;
    case 309:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1024);
      goto LABEL_574;
    case 325:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5160))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 326:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1144))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 328:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 3728))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 329:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5368))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 331:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5248))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 333:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5088))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 334:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5320))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 335:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5240))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 336:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 1160))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 339:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 1168);
      goto LABEL_310;
    case 340:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1176);
      goto LABEL_565;
    case 343:
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a1 + 1200);
      goto LABEL_453;
    case 344:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1208);
      goto LABEL_443;
    case 348:
      unint64_t v38 = *(uint64_t (**)(uint64_t, __n128))(a1 + 1240);
      goto LABEL_329;
    case 349:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4792);
      goto LABEL_367;
    case 351:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 1256);
      uint64_t v72 = a2;
      return v71(v72);
    case 353:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1272);
      goto LABEL_367;
    case 358:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1288);
      goto LABEL_550;
    case 363:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 5192))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
      goto LABEL_418;
    case 372:
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a1 + 1360);
      goto LABEL_453;
    case 373:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1368);
      goto LABEL_443;
    case 376:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1392);
      goto LABEL_550;
    case 379:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1408);
      goto LABEL_367;
    case 412:
      std::vector<unsigned int>::size_type v39 = *(unsigned int **)(a4 + 8);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      uint64_t v40 = *(unsigned __int32 **)(a4 + 32);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      unint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(a1 + 2952);
      goto LABEL_319;
    case 423:
      uint64_t v53 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128))(a1 + 1456);
      goto LABEL_281;
    case 429:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1504);
      goto LABEL_443;
    case 438:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 1560);
      goto LABEL_574;
    case 444:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 4320);
      goto LABEL_310;
    case 445:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 4328);
      goto LABEL_565;
    case 448:
      unint64_t v38 = *(uint64_t (**)(uint64_t, __n128))(a1 + 1592);
      goto LABEL_329;
    case 450:
      unint64_t v42 = *(uint64_t (**)(uint64_t, __n128, __n128))(a1 + 1608);
      goto LABEL_336;
    case 454:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 1640);
      uint64_t v72 = a2;
      return v71(v72);
    case 467:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5512);
      goto LABEL_555;
    case 471:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 1680);
      uint64_t v72 = a2;
      return v71(v72);
    case 497:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 1888);
      goto LABEL_550;
    case 498:
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 1896);
      uint64_t v44 = **(unsigned int **)(a4 + 16);
      uint64_t v45 = **(unsigned int **)(a4 + 32);
      uint64_t v46 = **(unsigned int **)(a4 + 40);
      uint64_t v47 = **(unsigned int **)(a4 + 48);
      uint64_t v48 = **(void **)(a4 + 56);
      uint64_t v49 = a2;
      uint64_t v50 = **(unsigned int **)(a4 + 8);
      uint64_t v51 = **(unsigned int **)(a4 + 24);
      goto LABEL_540;
    case 508:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5352);
      goto LABEL_524;
    case 509:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6048);
      goto LABEL_560;
    case 513:
      size_t v16 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128))(a1 + 1984);
LABEL_252:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      a9.n128_u32[0] = **(_DWORD **)(a4 + 32);
      return v16(a2, a6, a7, a8, a9);
    case 514:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 3672);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      uint64_t v88 = a2;
      uint64_t v89 = **(unsigned __int8 **)(a4 + 16);
      return v78(v88, v89, a6);
    case 517:
      uint64_t v53 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128))(a1 + 2000);
      goto LABEL_281;
    case 518:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2008);
      goto LABEL_524;
    case 538:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 3720);
      goto LABEL_550;
    case 539:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2024);
      goto LABEL_550;
    case 540:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4760);
LABEL_262:
      uint64_t v90 = **(void **)(a4 + 8);
      uint64_t v19 = **(unsigned int **)(a4 + 16);
      float v91 = *(uint64_t **)(a4 + 32);
      uint64_t v21 = **(void **)(a4 + 24);
      uint64_t v22 = *v91;
      uint64_t v23 = a2;
      uint64_t v24 = v90;
      return v17(v23, v24, v19, v21, v22);
    case 541:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2032);
      goto LABEL_555;
    case 542:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5288);
      goto LABEL_524;
    case 544:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 2040);
      goto LABEL_550;
    case 545:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5296);
      goto LABEL_574;
    case 546:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2048);
      goto LABEL_555;
    case 547:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4688);
      goto LABEL_524;
    case 548:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 3736))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 549:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 3752))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
      *(unsigned char *)a5 = result;
      return result;
    case 582:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2312);
      goto LABEL_569;
    case 583:
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a1 + 2320);
      goto LABEL_453;
    case 584:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2328);
      goto LABEL_443;
    case 585:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2336);
      goto LABEL_555;
    case 586:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2344);
      goto LABEL_443;
    case 594:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2408);
      goto LABEL_87;
    case 595:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3504);
      uint64_t v28 = **(unsigned int **)(a4 + 8);
      uint64_t v29 = **(unsigned int **)(a4 + 16);
      uint64_t v30 = **(unsigned int **)(a4 + 24);
      uint64_t v31 = **(unsigned int **)(a4 + 32);
      uint64_t v32 = **(unsigned int **)(a4 + 40);
      uint64_t v33 = **(unsigned int **)(a4 + 48);
      uint64_t v34 = **(unsigned int **)(a4 + 56);
      int v35 = **(_DWORD **)(a4 + 64);
      int v36 = **(_DWORD **)(a4 + 72);
      uint64_t v136 = **(void **)(a4 + 80);
      goto LABEL_275;
    case 598:
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a1 + 2416);
      goto LABEL_453;
    case 599:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2424);
      goto LABEL_443;
    case 600:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2432);
      goto LABEL_555;
    case 601:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2440);
      goto LABEL_443;
    case 603:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2456);
LABEL_87:
      uint64_t v28 = **(unsigned int **)(a4 + 8);
      uint64_t v29 = **(unsigned int **)(a4 + 16);
      uint64_t v30 = **(unsigned int **)(a4 + 24);
      uint64_t v31 = **(unsigned int **)(a4 + 32);
      uint64_t v32 = **(unsigned int **)(a4 + 40);
      uint64_t v33 = **(unsigned int **)(a4 + 48);
      uint64_t v34 = **(unsigned int **)(a4 + 56);
      int v35 = **(_DWORD **)(a4 + 64);
      uint64_t v136 = **(void **)(a4 + 72);
      goto LABEL_276;
    case 604:
      std::vector<unsigned int>::size_type v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3512);
LABEL_156:
      uint64_t v28 = **(unsigned int **)(a4 + 8);
      uint64_t v29 = **(unsigned int **)(a4 + 16);
      uint64_t v30 = **(unsigned int **)(a4 + 24);
      uint64_t v31 = **(unsigned int **)(a4 + 32);
      uint64_t v32 = **(unsigned int **)(a4 + 40);
      uint64_t v33 = **(unsigned int **)(a4 + 48);
      uint64_t v34 = **(unsigned int **)(a4 + 56);
      int v35 = **(_DWORD **)(a4 + 64);
      int v36 = **(_DWORD **)(a4 + 72);
      uint64_t v137 = **(void **)(a4 + 88);
      LODWORD(v136) = **(_DWORD **)(a4 + 80);
LABEL_275:
      HIDWORD(v135) = v36;
LABEL_276:
      LODWORD(v135) = v35;
      return v27(a2, v28, v29, v30, v31, v32, v33, v34, v135, v136, v137);
    case 606:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5584);
      goto LABEL_488;
    case 608:
      uint64_t v53 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128))(a1 + 2472);
LABEL_281:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      return v53(a2, a6, a7, a8);
    case 609:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 4816);
      goto LABEL_310;
    case 610:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4880);
      goto LABEL_443;
    case 611:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 4848);
      goto LABEL_574;
    case 612:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4912);
      goto LABEL_443;
    case 613:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5872);
      goto LABEL_574;
    case 614:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5904);
      goto LABEL_443;
    case 615:
      float v54 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128))(a1 + 4824);
      goto LABEL_104;
    case 616:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4888);
      goto LABEL_443;
    case 617:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4856);
      goto LABEL_555;
    case 618:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4920);
      goto LABEL_443;
    case 619:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5880);
      goto LABEL_555;
    case 620:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5912);
      goto LABEL_443;
    case 621:
      float v92 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128))(a1 + 4832);
      goto LABEL_314;
    case 622:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4896);
      goto LABEL_443;
    case 623:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4864);
      goto LABEL_524;
    case 624:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4928);
      goto LABEL_443;
    case 625:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5888);
      goto LABEL_524;
    case 626:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5920);
      goto LABEL_443;
    case 627:
      std::vector<unsigned int>::size_type v39 = *(unsigned int **)(a4 + 8);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      uint64_t v40 = *(unsigned __int32 **)(a4 + 32);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      unint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(a1 + 4840);
      goto LABEL_319;
    case 628:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4904);
      goto LABEL_443;
    case 629:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4872);
      goto LABEL_560;
    case 630:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4936);
      goto LABEL_443;
    case 631:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5896);
      goto LABEL_560;
    case 632:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5928);
      goto LABEL_443;
    case 634:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4944);
      goto LABEL_307;
    case 635:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5992);
      goto LABEL_307;
    case 636:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6008);
      goto LABEL_307;
    case 637:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4952);
      goto LABEL_307;
    case 638:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6000);
      goto LABEL_307;
    case 639:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6024);
      goto LABEL_307;
    case 640:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4960);
      goto LABEL_307;
    case 641:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6016);
      goto LABEL_307;
    case 642:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6032);
LABEL_307:
      uint64_t v93 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(unsigned int **)(a4 + 16);
      float v94 = *(uint64_t **)(a4 + 32);
      uint64_t v21 = **(unsigned __int8 **)(a4 + 24);
      goto LABEL_570;
    case 644:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 5200))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 645:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4800);
      goto LABEL_367;
    case 646:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 4808);
      goto LABEL_367;
    case 675:
      float v78 = *(uint64_t (**)(uint64_t, uint64_t, __n128))(a1 + 3808);
LABEL_310:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      uint64_t v88 = a2;
      uint64_t v89 = **(unsigned int **)(a4 + 8);
      return v78(v88, v89, a6);
    case 676:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3912);
      goto LABEL_565;
    case 681:
      float v54 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128))(a1 + 3832);
LABEL_104:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      uint64_t v56 = **(unsigned int **)(a4 + 8);
      return v54(a2, v56, a6, a7);
    case 682:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3936);
      goto LABEL_565;
    case 687:
      float v92 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128))(a1 + 3856);
LABEL_314:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 32);
      uint64_t v96 = **(unsigned int **)(a4 + 8);
      return v92(a2, v96, a6, a7, a8);
    case 688:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 3960);
      goto LABEL_565;
    case 701:
      std::vector<unsigned int>::size_type v39 = *(unsigned int **)(a4 + 8);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 16);
      uint64_t v40 = *(unsigned __int32 **)(a4 + 32);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 24);
      unint64_t v41 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128, __n128, __n128))(a1 + 3880);
LABEL_319:
      a8.n128_u32[0] = *v40;
      a9.n128_u32[0] = **(_DWORD **)(a4 + 40);
      uint64_t v98 = *v39;
      return v41(a2, v98, a6, a7, a8, a9);
    case 702:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 4024);
      goto LABEL_565;
    case 722:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5712);
      goto LABEL_560;
    case 723:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5776);
      goto LABEL_565;
    case 726:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5744);
      goto LABEL_560;
    case 727:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 5808);
      goto LABEL_565;
    case 729:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 5848);
      goto LABEL_534;
    case 730:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 4088);
      uint64_t v58 = **(unsigned int **)(a4 + 8);
      uint64_t v59 = **(unsigned int **)(a4 + 16);
      uint64_t v60 = **(unsigned int **)(a4 + 24);
      uint64_t v61 = **(unsigned __int8 **)(a4 + 32);
LABEL_166:
      uint64_t v83 = **(unsigned int **)(a4 + 40);
      uint64_t v84 = **(void **)(a4 + 48);
      uint64_t v85 = a2;
      uint64_t v86 = v58;
      uint64_t v87 = v60;
      return v57(v85, v86, v59, v87, v61, v83, v84);
    case 732:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2672);
      goto LABEL_569;
    case 733:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 2680);
      goto LABEL_524;
    case 759:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7744);
      goto LABEL_574;
    case 760:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7752);
      goto LABEL_524;
    case 761:
      unint64_t v38 = *(uint64_t (**)(uint64_t, __n128))(a1 + 7024);
LABEL_329:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      return v38(a2, a6);
    case 762:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 7760);
      goto LABEL_550;
    case 763:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7768);
      goto LABEL_565;
    case 764:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7776);
      goto LABEL_565;
    case 765:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7784);
      goto LABEL_524;
    case 766:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8088);
      goto LABEL_550;
    case 767:
      unint64_t v42 = *(uint64_t (**)(uint64_t, __n128, __n128))(a1 + 7016);
LABEL_336:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      return v42(a2, a6, a7);
    case 768:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7792);
      goto LABEL_574;
    case 769:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      std::vector<unsigned int> v62 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128, __n128))(a1 + 8168);
      a9.n128_u32[0] = **(_DWORD **)(a4 + 32);
      a10.n128_u32[0] = **(_DWORD **)(a4 + 40);
      return v62(a2, a6, a7, a8, a9, a10);
    case 770:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8176);
      goto LABEL_367;
    case 771:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8128);
      goto LABEL_560;
    case 772:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8152);
      goto LABEL_367;
    case 773:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8120);
      uint64_t v99 = **(__int16 **)(a4 + 8);
      uint64_t v65 = **(__int16 **)(a4 + 16);
      uint64_t v100 = **(__int16 **)(a4 + 24);
      uint64_t v66 = **(__int16 **)(a4 + 32);
      uint64_t v67 = **(__int16 **)(a4 + 40);
      goto LABEL_561;
    case 774:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8144);
      goto LABEL_367;
    case 775:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8136);
      goto LABEL_560;
    case 776:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8160);
      goto LABEL_367;
    case 777:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7800);
      goto LABEL_574;
    case 778:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7808);
      goto LABEL_565;
    case 779:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      float64x2x2_t v63 = *(unsigned __int32 **)(a4 + 32);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      float64x2x2_t v64 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))(a1 + 7816);
      goto LABEL_346;
    case 780:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7824);
      goto LABEL_530;
    case 781:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7832);
      goto LABEL_565;
    case 782:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7840);
      goto LABEL_565;
    case 783:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7848);
      goto LABEL_565;
    case 784:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7856);
      goto LABEL_443;
    case 785:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7864);
      goto LABEL_443;
    case 786:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7008);
      goto LABEL_439;
    case 787:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7872);
      goto LABEL_443;
    case 788:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7880);
      goto LABEL_443;
    case 789:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7888);
      goto LABEL_574;
    case 790:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7896);
      goto LABEL_565;
    case 791:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7904);
      goto LABEL_555;
    case 792:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7912);
      goto LABEL_443;
    case 793:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 7920);
      goto LABEL_550;
    case 794:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 7928);
      goto LABEL_367;
    case 795:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 8096);
      uint64_t v72 = a2;
      return v71(v72);
    case 796:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7936);
      goto LABEL_555;
    case 797:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7944);
      goto LABEL_443;
    case 798:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8104);
      goto LABEL_569;
    case 799:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 7952);
      goto LABEL_367;
    case 800:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8056);
      goto LABEL_560;
    case 801:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7960);
      goto LABEL_555;
    case 802:
      a6.n128_u32[0] = **(_DWORD **)(a4 + 8);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 16);
      float64x2x2_t v63 = *(unsigned __int32 **)(a4 + 32);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 24);
      float64x2x2_t v64 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128, __n128, __n128))(a1 + 7968);
LABEL_346:
      a9.n128_u32[0] = *v63;
      a10.n128_u32[0] = **(_DWORD **)(a4 + 40);
      a11.n128_u32[0] = **(_DWORD **)(a4 + 48);
      return v64(a2, a6, a7, a8, a9, a10, a11);
    case 803:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7976);
      goto LABEL_530;
    case 804:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8072);
      goto LABEL_574;
    case 805:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8080);
      goto LABEL_565;
    case 806:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6176);
      goto LABEL_443;
    case 807:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 7984);
      goto LABEL_550;
    case 808:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7992);
      goto LABEL_574;
    case 810:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8000);
      goto LABEL_524;
    case 811:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8064);
      uint64_t v103 = **(unsigned int **)(a4 + 8);
      uint64_t v80 = **(unsigned __int8 **)(a4 + 16);
      goto LABEL_575;
    case 812:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8008);
      goto LABEL_555;
    case 814:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8016);
      goto LABEL_555;
    case 815:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8024);
      goto LABEL_443;
    case 816:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8032);
      goto LABEL_555;
    case 817:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8040);
      goto LABEL_443;
    case 818:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8048);
      goto LABEL_555;
    case 819:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8112);
      goto LABEL_569;
    case 823:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6096);
      goto LABEL_524;
    case 824:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6104);
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v66 = **(void **)(a4 + 32);
      uint64_t v67 = **(unsigned int **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = **(unsigned int **)(a4 + 8);
      uint64_t v70 = **(unsigned int **)(a4 + 24);
      goto LABEL_563;
    case 825:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 0x2000);
      goto LABEL_443;
    case 826:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3568);
      goto LABEL_435;
    case 827:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3560);
      goto LABEL_569;
    case 829:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3536);
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v66 = **(unsigned int **)(a4 + 32);
      uint64_t v67 = **(void **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = **(unsigned int **)(a4 + 8);
      uint64_t v70 = **(void **)(a4 + 24);
      goto LABEL_563;
    case 830:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 3552))(a2, **(unsigned int **)(a4 + 8), **(void **)(a4 + 16));
LABEL_390:
      *a5 = result;
      return result;
    case 831:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3528);
      goto LABEL_439;
    case 832:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 3576);
      goto LABEL_555;
    case 833:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6088);
      goto LABEL_574;
    case 835:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8184);
      goto LABEL_443;
    case 837:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 8208);
      uint64_t v72 = a2;
      return v71(v72);
    case 838:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 6144);
      goto LABEL_550;
    case 839:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6152);
      goto LABEL_565;
    case 840:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6160);
      goto LABEL_565;
    case 841:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 6168))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 850:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6424);
      goto LABEL_574;
    case 851:
      float v104 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(a1 + 6216);
      uint64_t v105 = **(unsigned int **)(a4 + 8);
      uint64_t v106 = **(unsigned int **)(a4 + 16);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 24);
      uint64_t v107 = **(unsigned int **)(a4 + 32);
      return v104(a2, v105, v106, v107, a6);
    case 852:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6208);
      goto LABEL_443;
    case 853:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6192);
      goto LABEL_443;
    case 854:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6200);
      goto LABEL_443;
    case 855:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6328);
      goto LABEL_484;
    case 856:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6408);
      goto LABEL_565;
    case 857:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6368);
      uint64_t v73 = **(unsigned int **)(a4 + 8);
      uint64_t v74 = **(void **)(a4 + 16);
      uint64_t v75 = **(void **)(a4 + 24);
      uint64_t v76 = a2;
      uint64_t v77 = v73;
      goto LABEL_557;
    case 858:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6400);
      goto LABEL_565;
    case 861:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6488);
      goto LABEL_443;
    case 862:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6480);
      goto LABEL_443;
    case 863:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 6224))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
      goto LABEL_418;
    case 864:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 6416))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 865:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void, void))(a1 + 6360))(a2, **(unsigned int **)(a4 + 8), **(void **)(a4 + 16), **(void **)(a4 + 24), **(unsigned int **)(a4 + 32));
      *(void *)a5 = result;
      return result;
    case 870:
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a1 + 6448);
      goto LABEL_453;
    case 871:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6456);
      goto LABEL_443;
    case 872:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6432);
      goto LABEL_555;
    case 873:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6440);
      goto LABEL_443;
    case 875:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6392);
      goto LABEL_443;
    case 876:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6384);
      goto LABEL_443;
    case 879:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(a1 + 6256))(a2, **(void **)(a4 + 8), **(unsigned int **)(a4 + 16), **(void **)(a4 + 24));
      *a5 = result;
      return result;
    case 880:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 6248);
LABEL_367:
      uint64_t v101 = a2;
      uint64_t v102 = **(void **)(a4 + 8);
      return v12(v101, v102);
    case 881:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(a1 + 6232))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16));
LABEL_418:
      *(void *)a5 = result;
      return result;
    case 882:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6272);
      goto LABEL_565;
    case 883:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6280);
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v66 = **(void **)(a4 + 32);
      uint64_t v67 = **(void **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = **(void **)(a4 + 8);
      uint64_t v70 = **(unsigned int **)(a4 + 24);
      goto LABEL_563;
    case 884:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 6240))(a2, **(void **)(a4 + 8));
      *(unsigned char *)a5 = result;
      return result;
    case 885:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6264);
LABEL_425:
      uint64_t v108 = **(void **)(a4 + 8);
      uint64_t v74 = **(unsigned int **)(a4 + 16);
      uint64_t v75 = **(void **)(a4 + 24);
      uint64_t v76 = a2;
      uint64_t v77 = v108;
      goto LABEL_557;
    case 886:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6560);
      goto LABEL_574;
    case 887:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 6576);
      goto LABEL_550;
    case 888:
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(a1 + 6568))(a2, **(unsigned int **)(a4 + 8), **(unsigned int **)(a4 + 16), **(void **)(a4 + 24));
      *a5 = result;
      return result;
    case 889:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6584);
      goto LABEL_565;
    case 890:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6592);
      goto LABEL_565;
    case 891:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8200);
      goto LABEL_443;
    case 892:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6520);
LABEL_435:
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v66 = **(void **)(a4 + 32);
      uint64_t v67 = **(void **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = **(unsigned int **)(a4 + 8);
      uint64_t v70 = **(unsigned int **)(a4 + 24);
      goto LABEL_563;
    case 893:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6624);
LABEL_439:
      uint64_t v109 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(unsigned int **)(a4 + 16);
      float v110 = *(uint64_t **)(a4 + 32);
      uint64_t v21 = **(void **)(a4 + 24);
      uint64_t v22 = *v110;
      uint64_t v23 = a2;
      uint64_t v24 = v109;
      return v17(v23, v24, v19, v21, v22);
    case 894:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6608);
LABEL_443:
      uint64_t v111 = **(unsigned int **)(a4 + 8);
      uint64_t v74 = **(unsigned int **)(a4 + 16);
      uint64_t v75 = **(void **)(a4 + 24);
      uint64_t v76 = a2;
      uint64_t v77 = v111;
      goto LABEL_557;
    case 895:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6528);
      goto LABEL_565;
    case 896:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 6600))(a2, **(unsigned int **)(a4 + 8));
      goto LABEL_516;
    case 897:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6512);
      goto LABEL_569;
    case 898:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 6544);
      uint64_t v72 = a2;
      return v71(v72);
    case 900:
      uint64_t v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128))(a1 + 6664);
LABEL_453:
      uint64_t v112 = **(unsigned int **)(a4 + 16);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 24);
      uint64_t v114 = **(unsigned int **)(a4 + 8);
      return v37(a2, v114, v112, a6);
    case 901:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6728);
      goto LABEL_569;
    case 902:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6632);
      goto LABEL_555;
    case 903:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6696);
      goto LABEL_569;
    case 904:
      float v115 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128, __n128))(a1 + 6672);
      uint64_t v116 = **(unsigned int **)(a4 + 16);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 24);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 32);
      uint64_t v118 = **(unsigned int **)(a4 + 8);
      return v115(a2, v118, v116, a6, a7);
    case 905:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6736);
      goto LABEL_569;
    case 906:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6640);
      goto LABEL_524;
    case 907:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6704);
      goto LABEL_569;
    case 908:
      float v119 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128, __n128, __n128))(a1 + 6680);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 24);
      uint64_t v120 = **(unsigned int **)(a4 + 16);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 32);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 40);
      uint64_t v122 = **(unsigned int **)(a4 + 8);
      return v119(a2, v122, v120, a6, a7, a8);
    case 909:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6744);
      goto LABEL_569;
    case 910:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6648);
      goto LABEL_560;
    case 911:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6712);
      goto LABEL_569;
    case 912:
      float v123 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))(a1 + 6688);
      a6.n128_u32[0] = **(_DWORD **)(a4 + 24);
      uint64_t v124 = **(unsigned int **)(a4 + 16);
      a7.n128_u32[0] = **(_DWORD **)(a4 + 32);
      a8.n128_u32[0] = **(_DWORD **)(a4 + 40);
      a9.n128_u32[0] = **(_DWORD **)(a4 + 48);
      uint64_t v126 = **(unsigned int **)(a4 + 8);
      return v123(a2, v126, v124, a6, a7, a8, a9);
    case 913:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6752);
      goto LABEL_569;
    case 914:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6656);
      goto LABEL_530;
    case 915:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6720);
      goto LABEL_569;
    case 916:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6760);
      goto LABEL_505;
    case 917:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6768);
      goto LABEL_505;
    case 918:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6776);
      goto LABEL_505;
    case 919:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 6536);
      goto LABEL_565;
    case 920:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6552);
      goto LABEL_555;
    case 921:
      float v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 6616);
LABEL_550:
      uint64_t v79 = **(unsigned int **)(a4 + 8);
LABEL_551:
      uint64_t v101 = a2;
      uint64_t v102 = v79;
      return v12(v101, v102);
    case 934:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7096);
LABEL_484:
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v66 = **(void **)(a4 + 32);
      uint64_t v67 = **(void **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = **(unsigned int **)(a4 + 8);
      uint64_t v70 = **(void **)(a4 + 24);
      goto LABEL_563;
    case 937:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7104);
LABEL_488:
      uint64_t v127 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(unsigned int **)(a4 + 16);
      float v128 = *(unsigned int **)(a4 + 32);
      uint64_t v21 = **(void **)(a4 + 24);
      uint64_t v22 = *v128;
      uint64_t v23 = a2;
      uint64_t v24 = v127;
      return v17(v23, v24, v19, v21, v22);
    case 940:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6784);
      goto LABEL_555;
    case 941:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6816);
      goto LABEL_569;
    case 944:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6792);
      goto LABEL_524;
    case 945:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6824);
      goto LABEL_569;
    case 948:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6800);
      goto LABEL_560;
    case 949:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6832);
      goto LABEL_569;
    case 952:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6808);
      goto LABEL_530;
    case 953:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6840);
LABEL_569:
      uint64_t v93 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(unsigned int **)(a4 + 16);
      float v94 = *(uint64_t **)(a4 + 32);
      uint64_t v21 = **(unsigned int **)(a4 + 24);
LABEL_570:
      uint64_t v22 = *v94;
      uint64_t v23 = a2;
      uint64_t v24 = v93;
      return v17(v23, v24, v19, v21, v22);
    case 956:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6848);
      goto LABEL_505;
    case 958:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6864);
      goto LABEL_505;
    case 961:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6856);
      goto LABEL_505;
    case 963:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6880);
      goto LABEL_505;
    case 966:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6872);
      goto LABEL_505;
    case 968:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6888);
LABEL_505:
      uint64_t v129 = **(unsigned int **)(a4 + 8);
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v130 = **(unsigned int **)(a4 + 24);
      uint64_t v66 = **(unsigned __int8 **)(a4 + 32);
      goto LABEL_535;
    case 969:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 6992);
      uint64_t v72 = a2;
      return v71(v72);
    case 970:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 7000);
      uint64_t v65 = **(void **)(a4 + 16);
      uint64_t v66 = **(void **)(a4 + 32);
      uint64_t v67 = **(unsigned int **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = **(unsigned int **)(a4 + 8);
      uint64_t v70 = **(unsigned int **)(a4 + 24);
      goto LABEL_563;
    case 980:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7232);
LABEL_574:
      uint64_t v103 = **(unsigned int **)(a4 + 8);
      uint64_t v80 = **(unsigned int **)(a4 + 16);
LABEL_575:
      uint64_t v81 = a2;
      uint64_t v82 = v103;
      return v14(v81, v82, v80);
    case 981:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7248);
      goto LABEL_565;
    case 987:
      unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 7240);
LABEL_565:
      uint64_t v80 = **(void **)(a4 + 16);
      uint64_t v81 = a2;
      uint64_t v82 = **(unsigned int **)(a4 + 8);
      return v14(v81, v82, v80);
    case 1000:
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(a1 + 7272))(a2, **(unsigned int **)(a4 + 8));
LABEL_516:
      *(unsigned char *)a5 = result;
      return result;
    case 1004:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 7256);
      uint64_t v72 = a2;
      return v71(v72);
    case 1005:
      float v71 = *(uint64_t (**)(uint64_t))(a1 + 7264);
      uint64_t v72 = a2;
      return v71(v72);
    case 1039:
      unint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8216);
LABEL_524:
      uint64_t v131 = **(unsigned int **)(a4 + 8);
      uint64_t v19 = **(unsigned int **)(a4 + 16);
      float v132 = *(unsigned int **)(a4 + 32);
      uint64_t v21 = **(unsigned int **)(a4 + 24);
      uint64_t v22 = *v132;
LABEL_525:
      uint64_t v23 = a2;
      uint64_t v24 = v131;
      return v17(v23, v24, v19, v21, v22);
    case 1040:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8248);
LABEL_560:
      uint64_t v99 = **(unsigned int **)(a4 + 8);
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v100 = **(unsigned int **)(a4 + 24);
      uint64_t v66 = **(unsigned int **)(a4 + 32);
      uint64_t v67 = **(unsigned int **)(a4 + 40);
LABEL_561:
      uint64_t v68 = a2;
      uint64_t v69 = v99;
      uint64_t v70 = v100;
      goto LABEL_563;
    case 1042:
      unint64_t v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8256);
LABEL_530:
      uint64_t v59 = **(unsigned int **)(a4 + 16);
      uint64_t v61 = **(unsigned int **)(a4 + 32);
      uint64_t v83 = **(unsigned int **)(a4 + 40);
      uint64_t v84 = **(unsigned int **)(a4 + 48);
      uint64_t v85 = a2;
      uint64_t v86 = **(unsigned int **)(a4 + 8);
      uint64_t v87 = **(unsigned int **)(a4 + 24);
      return v57(v85, v86, v59, v87, v61, v83, v84);
    case 1043:
      unint64_t v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8232);
LABEL_534:
      uint64_t v129 = **(unsigned int **)(a4 + 8);
      uint64_t v65 = **(unsigned int **)(a4 + 16);
      uint64_t v130 = **(unsigned int **)(a4 + 24);
      uint64_t v66 = **(unsigned int **)(a4 + 32);
LABEL_535:
      uint64_t v67 = **(void **)(a4 + 40);
      uint64_t v68 = a2;
      uint64_t v69 = v129;
      uint64_t v70 = v130;
LABEL_563:
      uint64_t result = v52(v68, v69, v65, v70, v66, v67);
      break;
    case 1044:
      uint64_t v43 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8224);
      uint64_t v44 = **(unsigned int **)(a4 + 16);
      uint64_t v45 = **(unsigned int **)(a4 + 32);
      uint64_t v46 = **(unsigned int **)(a4 + 40);
      uint64_t v47 = **(unsigned int **)(a4 + 48);
      uint64_t v48 = **(unsigned int **)(a4 + 56);
      uint64_t v49 = a2;
      uint64_t v50 = **(unsigned int **)(a4 + 8);
      uint64_t v51 = **(void **)(a4 + 24);
LABEL_540:
      uint64_t result = v43(v49, v50, v44, v51, v45, v46, v47, v48);
      break;
    case 1046:
      BOOL v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 8264);
LABEL_555:
      uint64_t v134 = **(unsigned int **)(a4 + 8);
      uint64_t v74 = **(unsigned int **)(a4 + 16);
      uint64_t v75 = **(unsigned int **)(a4 + 24);
      uint64_t v76 = a2;
      uint64_t v77 = v134;
LABEL_557:
      uint64_t result = v13(v76, v77, v74, v75);
      break;
    default:
      dy_abort("unknown fenum: %u", a3);
  }
  return result;
}

void dy_add_fenum_string_tables(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (_MergedGlobals_2237 != -1) {
    dispatch_once_f(&_MergedGlobals_2237, 0, (dispatch_function_t)_BuildTextTableEntries);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __dy_add_fenum_string_tables_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  block[4] = a1;
  block[5] = a2;
  int v9 = a3;
  int v10 = a4;
  dispatch_async((dispatch_queue_t)qword_269A29108, block);
}

void _BuildTextTableEntries(void *a1)
{
  qword_269A29108 = (uint64_t)dispatch_queue_create("gputools.fenums.textTable", 0);
  operator new();
}

char *__dy_add_fenum_string_tables_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)qword_269A29110;
  uint64_t v1 = *(void *)(qword_269A29110 + 8);
  if (*(void *)qword_269A29110 == v1)
  {
    int v4 = 0;
    goto LABEL_9;
  }
  unint64_t v3 = v1 - v2 - 32;
  if (v3 < 0x20)
  {
    int v4 = 0;
    uint64_t v5 = *(void *)qword_269A29110;
    do
    {
LABEL_8:
      v4 += *(_DWORD *)(v5 + 20) - *(_DWORD *)(v5 + 16);
      v5 += 32;
    }
    while (v5 != v1);
    goto LABEL_9;
  }
  int v6 = 0;
  int v7 = 0;
  uint64_t v8 = (v3 >> 5) + 1;
  uint64_t v5 = v2 + 32 * (v8 & 0xFFFFFFFFFFFFFFELL);
  int v9 = (int *)(v2 + 48);
  uint64_t v10 = v8 & 0xFFFFFFFFFFFFFFELL;
  do
  {
    int v11 = *(v9 - 8);
    int v12 = *(v9 - 7);
    int v14 = *v9;
    int v13 = v9[1];
    v9 += 16;
    v6 += v12 - v11;
    v7 += v13 - v14;
    v10 -= 2;
  }
  while (v10);
  int v4 = v7 + v6;
  if (v8 != (v8 & 0xFFFFFFFFFFFFFFELL)) {
    goto LABEL_8;
  }
LABEL_9:
  int v16 = v4;
  return std::vector<TextTableEntry>::emplace_back<char const** const&,char const** const&,unsigned int const&,unsigned int const&,unsigned int &>((char **)qword_269A29110, (void *)(a1 + 32), (uint64_t *)(a1 + 40), (int *)(a1 + 48), (int *)(a1 + 52), &v16);
}

char *std::vector<TextTableEntry>::emplace_back<char const** const&,char const** const&,unsigned int const&,unsigned int const&,unsigned int &>(char **a1, void *a2, uint64_t *a3, int *a4, int *a5, int *a6)
{
  int v13 = a1[1];
  unint64_t v12 = (unint64_t)a1[2];
  if ((unint64_t)v13 < v12)
  {
    uint64_t v14 = *a3;
    int v15 = *a4;
    int v16 = *a5;
    int v17 = *a6;
    *(void *)int v13 = *a2;
    *((void *)v13 + 1) = v14;
    *((_DWORD *)v13 + 4) = v15;
    *((_DWORD *)v13 + 5) = v16 + v15;
    *((_DWORD *)v13 + 6) = v17;
    uint64_t v18 = v13 + 32;
    goto LABEL_13;
  }
  uint64_t v19 = *a1;
  uint64_t v20 = (v13 - *a1) >> 5;
  unint64_t v21 = v20 + 1;
  if ((unint64_t)(v20 + 1) >> 59) {
    std::vector<GPUTools::FB::Fbuf>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v22 = v12 - (void)v19;
  if (v22 >> 4 > v21) {
    unint64_t v21 = v22 >> 4;
  }
  BOOL v23 = (unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0;
  unint64_t v24 = 0x7FFFFFFFFFFFFFFLL;
  if (!v23) {
    unint64_t v24 = v21;
  }
  if (v24 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v25 = 32 * v24;
  int v26 = (char *)operator new(32 * v24);
  std::vector<unsigned int>::size_type v27 = &v26[32 * v20];
  uint64_t v28 = &v26[v25];
  uint64_t v29 = *a3;
  int v30 = *a4;
  int v31 = *a5;
  int v32 = *a6;
  *(void *)std::vector<unsigned int>::size_type v27 = *a2;
  *((void *)v27 + 1) = v29;
  *((_DWORD *)v27 + 4) = v30;
  *((_DWORD *)v27 + 5) = v31 + v30;
  *((_DWORD *)v27 + 6) = v32;
  uint64_t v18 = v27 + 32;
  if (v13 == v19)
  {
    *a1 = v27;
    a1[1] = v18;
    a1[2] = v28;
    if (!v19) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  do
  {
    long long v33 = *((_OWORD *)v13 - 1);
    uint64_t v34 = v27 - 32;
    *((_OWORD *)v27 - 2) = *((_OWORD *)v13 - 2);
    *((_OWORD *)v27 - 1) = v33;
    v13 -= 32;
    v27 -= 32;
  }
  while (v13 != v19);
  *a1 = v34;
  a1[1] = v18;
  a1[2] = v28;
  if (v19) {
LABEL_12:
  }
    operator delete(v19);
LABEL_13:
  a1[1] = v18;
  return v18 - 32;
}

uint64_t dy_fenum_get_unified_index(int a1)
{
  if (_MergedGlobals_2237 != -1) {
    dispatch_once_f(&_MergedGlobals_2237, 0, (dispatch_function_t)_BuildTextTableEntries);
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = -1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __dy_fenum_get_unified_index_block_invoke;
  void v5[3] = &unk_2653370E8;
  int v6 = a1;
  v5[4] = &v7;
  dispatch_sync((dispatch_queue_t)qword_269A29108, v5);
  unsigned int v2 = *((_DWORD *)v8 + 6);
  if (v2 == -1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  _Block_object_dispose(&v7, 8);
  return v3;
}

uint64_t __dy_fenum_get_unified_index_block_invoke(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)qword_269A29110;
  unsigned int v2 = *(_DWORD **)(qword_269A29110 + 8);
  if (*(_DWORD **)qword_269A29110 != v2)
  {
    unsigned int v3 = *(_DWORD *)(result + 40);
    while (1)
    {
      unsigned int v4 = v1[4];
      BOOL v6 = v3 >= v4;
      unsigned int v5 = v3 - v4;
      BOOL v6 = !v6 || v3 >= v1[5];
      if (!v6) {
        break;
      }
      v1 += 8;
      if (v1 == v2) {
        return result;
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5 + v1[6];
  }
  return result;
}

const char *dy_fenum_to_function_name(int a1, __int16 a2, int a3)
{
  char v3 = a3;
  if ((a2 & 0x4000) != 0)
  {
    uint64_t v7 = "glDiscardFramebufferEXT";
    if (a3) {
      uint64_t v7 = "DiscardFramebuffer";
    }
    if (a1 == 835) {
      return v7;
    }
    else {
      return 0;
    }
  }
  else if (a1 == -1)
  {
    return 0;
  }
  else
  {
    if (_MergedGlobals_2237 != -1) {
      dispatch_once_f(&_MergedGlobals_2237, 0, (dispatch_function_t)_BuildTextTableEntries);
    }
    uint64_t v12 = 0;
    int v13 = &v12;
    uint64_t v14 = 0x2000000000;
    uint64_t v15 = 0;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___ZL22fenum_to_function_namejb_block_invoke;
    v9[3] = &unk_265337110;
    int v10 = a1;
    v9[4] = &v12;
    char v11 = v3;
    dispatch_sync((dispatch_queue_t)qword_269A29108, v9);
    uint64_t v5 = v13[3];
    _Block_object_dispose(&v12, 8);
    return (const char *)v5;
  }
}

uint64_t ___ZL22fenum_to_function_namejb_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)qword_269A29110;
  uint64_t v2 = *(void *)(qword_269A29110 + 8);
  if (*(void *)qword_269A29110 != v2)
  {
    unsigned int v3 = *(_DWORD *)(result + 40);
    while (1)
    {
      unsigned int v4 = *(_DWORD *)(v1 + 16);
      BOOL v6 = v3 >= v4;
      unsigned int v5 = v3 - v4;
      BOOL v6 = !v6 || v3 >= *(_DWORD *)(v1 + 20);
      if (!v6) {
        break;
      }
      v1 += 32;
      if (v1 == v2) {
        return result;
      }
    }
    if (*(unsigned char *)(result + 44)) {
      v1 += 8;
    }
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)v1 + 8 * v5);
  }
  return result;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    unsigned int v5 = (void *)MEMORY[0x263F08910];
    uint64_t v8 = 0;
    id v6 = a1;
    id v7 = [v5 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
    xpc_dictionary_set_data(v6, a2, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
}

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  if (a3)
  {
    id v5 = a3;
    xpc_object_t xdict = a1;
    id v6 = (const void *)[v5 bytes];
    size_t v7 = [v5 length];

    xpc_dictionary_set_data(xdict, a2, v6, v7);
  }
}

const void *xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  size_t length = 0;
  uint64_t result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    unsigned int v3 = result;
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    return (const void *)[v4 initWithBytes:v3 length:length];
  }
  return result;
}

const void *xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  size_t length = 0;
  uint64_t result = xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    unsigned int v3 = result;
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    return (const void *)[v4 initWithBytesNoCopy:v3 length:length freeWhenDone:0];
  }
  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy) {
    goto LABEL_5;
  }
  uint64_t v7 = 0;
  id v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:nsdata_nocopy error:&v7];
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    id v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsobject_any(void *a1, const char *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x263EFFA08];
  id v3 = a1;
  id v4 = [v2 alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  int v13 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t nsobject_classes = xpc_dictionary_get_nsobject_classes(v3, a2, v13);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v7 = 0;
    uint64_t v5 = [MEMORY[0x263F08928] unarchivedArrayOfObjectsOfClass:a3 fromData:nsdata_nocopy error:&v7];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedDictionaryWithKeysOfClass:a3 objectsOfClass:a4 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5 = a3;
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v5 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id xpc_dictionary_get_nsarray_any(void *a1, const char *a2)
{
  nsobject_any = (void *)xpc_dictionary_get_nsobject_any(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = nsobject_any;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  nsobject_any = (void *)xpc_dictionary_get_nsobject_any(a1, a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = nsobject_any;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

const char *xpc_error_string(void *a1)
{
  uint64_t result = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  if (!result) {
    return "Unknown";
  }
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  xpc_object_t xdict = a1;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1 << a3));
}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

id xpc_array_pop(void *a1)
{
  id v1 = a1;
  size_t count = xpc_array_get_count(v1);
  if (count)
  {
    size_t v3 = count - 1;
    uint64_t v4 = MEMORY[0x263EF8758];
    while (1)
    {
      id v5 = xpc_array_get_value(v1, v3);
      if (MEMORY[0x253361D90]() != v4) {
        break;
      }

      if (--v3 == -1) {
        goto LABEL_5;
      }
    }
    xpc_object_t v6 = xpc_null_create();
    xpc_array_set_value(v1, v3, v6);
  }
  else
  {
LABEL_5:
    id v5 = 0;
  }

  return v5;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  xpc_object_t value = a3;
  id v5 = a1;
  empty = xpc_dictionary_get_array(v5, a2);
  if (!empty) {
    empty = xpc_array_create_empty();
  }
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);
}

id xpc_dictionary_array_pop(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = xpc_dictionary_get_array(v3, a2);
  id v5 = v4;
  if (v4)
  {
    xpc_object_t v6 = xpc_array_pop(v4);
    xpc_dictionary_set_value(v3, a2, v5);
  }
  else
  {
    xpc_object_t v6 = 0;
  }

  return v6;
}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = xpc_dictionary_get_array(a1, a2);
  id v5 = (void *)v4;
  if (v4 && MEMORY[0x253361D90](v4) == MEMORY[0x263EF86D8])
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __xpc_dictionary_string_array_contains_block_invoke;
    v8[3] = &unk_265337138;
    v8[4] = &v9;
    void v8[5] = a3;
    xpc_array_apply(v5, v8);
    BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __xpc_dictionary_string_array_contains_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr) {
    return 1;
  }
  int v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  uint64_t result = 1;
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

const void *xpc_array_get_nsdata_nocopy(void *a1, size_t a2)
{
  size_t length = 0;
  uint64_t result = xpc_array_get_data(a1, a2, &length);
  if (result)
  {
    id v3 = result;
    id v4 = objc_alloc(MEMORY[0x263EFF8F8]);
    return (const void *)[v4 initWithBytesNoCopy:v3 length:length freeWhenDone:0];
  }
  return result;
}

uint64_t xpc_array_get_nsobject_classes(void *a1, size_t a2, void *a3)
{
  id v5 = a3;
  nsdata_nocopy = (void *)xpc_array_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    uint64_t v9 = 0;
    uint64_t v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v5 fromData:nsdata_nocopy error:&v9];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void *xpc_array_get_nsobject(void *a1, size_t a2, uint64_t a3)
{
  nsdata_nocopy = (void *)xpc_array_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy) {
    goto LABEL_5;
  }
  uint64_t v7 = 0;
  id v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:a3 fromData:nsdata_nocopy error:&v7];
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    id v5 = 0;
  }

  return v5;
}

void xpc_array_set_nsobject(void *a1, size_t a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = (void *)MEMORY[0x263F08910];
    uint64_t v8 = 0;
    id v6 = a1;
    id v7 = [v5 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v8];
    xpc_array_set_data(v6, a2, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
}

xpc_object_t xpc_nsobject_create(void *a1)
{
  if (a1)
  {
    uint64_t v4 = 0;
    a1 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v4];
  }
  id v1 = a1;
  xpc_object_t v2 = xpc_data_create((const void *)[v1 bytes], objc_msgSend(v1, "length"));

  return v2;
}

id gt_xpc_dictionary_create_reply(void *a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);

  return reply;
}

char *__cdecl apr_cpystrn(char *dst, const char *src, apr_size_t dst_size)
{
  if (dst_size)
  {
    if (src && (id v3 = &dst[dst_size - 1], v3 > dst))
    {
      apr_size_t v4 = dst_size - 1;
      while (1)
      {
        int v5 = *(unsigned __int8 *)src;
        *dst = v5;
        if (!v5) {
          break;
        }
        ++dst;
        ++src;
        if (!--v4)
        {
          dst = v3;
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      *dst = 0;
    }
  }
  return dst;
}

apr_status_t apr_tokenize_to_argv(const char *arg_str, char ***argv_out, apr_pool_t *token_context)
{
  while (1)
  {
    int v6 = *(unsigned __int8 *)arg_str;
    if (v6 != 9 && v6 != 32) {
      break;
    }
    ++arg_str;
  }
  if (!*arg_str)
  {
    int v7 = 1;
    goto LABEL_48;
  }
  int v7 = 1;
  uint64_t v8 = arg_str;
  do
  {
    if (v6 == 39) {
      uint64_t v9 = v8 + 1;
    }
    else {
      uint64_t v9 = v8;
    }
    if (v6 == 34) {
      ++v8;
    }
    else {
      uint64_t v8 = v9;
    }
    BOOL v10 = v6 != 34 && v6 != 39;
    BOOL v11 = v6 != 34 && v6 == 39;
    while (1)
    {
      int v12 = *(unsigned __int8 *)v8;
      if (v12 == 92)
      {
        unsigned int v15 = *((unsigned __int8 *)v8 + 1);
        BOOL v16 = v15 > 0x27;
        uint64_t v17 = (1 << v15) & 0x8500000200;
        if (!v16 && v17 != 0)
        {
          ++v8;
          goto LABEL_38;
        }
      }
      else if (!*v8)
      {
        break;
      }
      if (v10 && (v12 == 9 || v12 == 32)) {
        break;
      }
      BOOL v13 = v12 == 39 && v11;
      BOOL v14 = v12 == 34 && v6 == 34;
      if (v14 || v13) {
        break;
      }
LABEL_38:
      ++v8;
    }
    if (*v8) {
      ++v8;
    }
    while (1)
    {
      int v6 = *(unsigned __int8 *)v8;
      if (v6 != 32 && v6 != 9) {
        break;
      }
      ++v8;
    }
    ++v7;
  }
  while (*v8);
LABEL_48:
  uint64_t v20 = (char **)apr_palloc(token_context, 8 * v7);
  *argv_out = v20;
  if (v7 < 2)
  {
    uint64_t v22 = 0;
    goto LABEL_106;
  }
  uint64_t v21 = 0;
  uint64_t v22 = (v7 - 1);
  while (2)
  {
    while (1)
    {
      int v23 = *(unsigned __int8 *)arg_str;
      if (v23 != 32 && v23 != 9) {
        break;
      }
      ++arg_str;
    }
    if (v23 == 39) {
      uint64_t v25 = arg_str + 1;
    }
    else {
      uint64_t v25 = arg_str;
    }
    if (v23 == 34) {
      int v26 = arg_str + 1;
    }
    else {
      int v26 = v25;
    }
    BOOL v27 = v23 != 34 && v23 != 39;
    BOOL v28 = v23 != 34 && v23 == 39;
    uint64_t v29 = v26;
    while (2)
    {
      int v30 = *(unsigned __int8 *)v29;
      if (v30 == 92)
      {
        unsigned int v33 = *((unsigned __int8 *)v29 + 1);
        BOOL v16 = v33 > 0x27;
        uint64_t v34 = (1 << v33) & 0x8500000200;
        if (v16 || v34 == 0) {
          goto LABEL_71;
        }
        ++v29;
LABEL_88:
        ++v29;
        continue;
      }
      break;
    }
    if (!*v29) {
      goto LABEL_89;
    }
LABEL_71:
    if (!v27 || v30 != 9 && v30 != 32)
    {
      BOOL v31 = v30 == 39 && v28;
      BOOL v32 = v30 == 34 && v23 == 34;
      if (!v32 && !v31) {
        goto LABEL_88;
      }
    }
LABEL_89:
    arg_str = v29 + 1;
    (*argv_out)[v21] = (char *)apr_palloc(token_context, v29 + 1 - v26);
    if (v29 + 1 != v26)
    {
      int v36 = (*argv_out)[v21];
      uint64_t v37 = &v36[v29 - v26];
      if (v37 <= v36)
      {
LABEL_95:
        *int v36 = 0;
      }
      else
      {
        int64_t v38 = v29 - v26;
        while (1)
        {
          int v39 = *(unsigned __int8 *)v26;
          *int v36 = v39;
          if (!v39) {
            break;
          }
          ++v36;
          ++v26;
          if (!--v38)
          {
            int v36 = v37;
            goto LABEL_95;
          }
        }
      }
    }
    uint64_t v40 = (*argv_out)[v21];
    int v41 = *v40;
    if (*v40)
    {
      int v42 = 0;
      uint64_t v43 = (unsigned __int8 *)(v40 + 1);
      do
      {
        if (v42 || v41 != 92)
        {
          int v42 = 0;
          *v40++ = v41;
        }
        else
        {
          int v42 = 1;
        }
        int v44 = *v43++;
        int v41 = v44;
      }
      while (v44);
    }
    *uint64_t v40 = 0;
    if (++v21 != v22) {
      continue;
    }
    break;
  }
  uint64_t v20 = *argv_out;
LABEL_106:
  v20[v22] = 0;
  return 0;
}

const char *__cdecl apr_filepath_name_get(const char *pathname)
{
  xpc_object_t v2 = strrchr((char *)pathname, 47);
  if (v2) {
    return v2 + 1;
  }
  else {
    return pathname;
  }
}

char *__cdecl apr_collapse_spaces(char *dest, const char *src)
{
  unsigned int v3 = *(unsigned __int8 *)src;
  if (*src)
  {
    apr_size_t v4 = src + 1;
    uint64_t v5 = MEMORY[0x263EF8318];
    while ((v3 & 0x80) == 0)
    {
      if ((*(_DWORD *)(v5 + 4 * v3 + 60) & 0x4000) == 0) {
        goto LABEL_5;
      }
LABEL_6:
      unsigned int v6 = *(unsigned __int8 *)v4++;
      unsigned int v3 = v6;
      if (!v6) {
        goto LABEL_10;
      }
    }
    if (__maskrune(v3, 0x4000uLL)) {
      goto LABEL_6;
    }
LABEL_5:
    *dest++ = v3;
    goto LABEL_6;
  }
LABEL_10:
  *dest = 0;
  return dest;
}

char *__cdecl apr_strerror(apr_status_t statcode, char *buf, apr_size_t bufsize)
{
  if (statcode <= 19999)
  {
    if ((strerror_r(statcode, buf, bufsize) & 0x80000000) == 0 || !bufsize) {
      return buf;
    }
    uint64_t v5 = &buf[bufsize - 1];
    unsigned int v6 = buf;
    if (v5 > buf)
    {
      uint64_t v7 = 0;
      while (1)
      {
        buf[v7] = aAprDoesNotUnde[v7];
        if (v7 == 39) {
          return buf;
        }
        if (bufsize - 1 == ++v7) {
          goto LABEL_39;
        }
      }
    }
LABEL_89:
    char *v6 = 0;
    return buf;
  }
  if (statcode >> 6 > 0x752)
  {
    if (statcode > 0xA392F)
    {
      if (statcode > 0xAFC7F)
      {
        if (!bufsize) {
          return buf;
        }
        uint64_t v5 = &buf[bufsize - 1];
        unsigned int v6 = buf;
        if (v5 <= buf) {
          goto LABEL_89;
        }
        BOOL v14 = "Unrecognized resolver error";
        if (statcode == 720004) {
          BOOL v14 = "No address for host";
        }
        if (statcode == 720001) {
          unsigned int v15 = "Unknown host";
        }
        else {
          unsigned int v15 = v14;
        }
        apr_size_t v16 = bufsize - 1;
        uint64_t v17 = buf;
        while (1)
        {
          int v18 = *(unsigned __int8 *)v15;
          *uint64_t v17 = v18;
          if (!v18) {
            break;
          }
          ++v17;
          ++v15;
          if (!--v16)
          {
LABEL_39:
            unsigned int v6 = v5;
            goto LABEL_89;
          }
        }
      }
      else
      {
        BOOL v10 = gai_strerror(statcode - 670000);
        if (!bufsize) {
          return buf;
        }
        unsigned int v6 = buf;
        if (!v10) {
          goto LABEL_89;
        }
        uint64_t v5 = &buf[bufsize - 1];
        unsigned int v6 = buf;
        if (v5 <= buf) {
          goto LABEL_89;
        }
        apr_size_t v11 = bufsize - 1;
        int v12 = buf;
        while (1)
        {
          int v13 = *(unsigned __int8 *)v10;
          char *v12 = v13;
          if (!v13) {
            break;
          }
          ++v12;
          ++v10;
          if (!--v11) {
            goto LABEL_39;
          }
        }
      }
    }
    else
    {
      if (!bufsize) {
        return buf;
      }
      uint64_t v5 = &buf[bufsize - 1];
      unsigned int v6 = buf;
      if (v5 <= buf) {
        goto LABEL_89;
      }
      uint64_t v9 = 0;
      while (1)
      {
        buf[v9] = aAprDoesNotUnde[v9];
        if (v9 == 39) {
          break;
        }
        if (bufsize - 1 == ++v9) {
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    uint64_t v8 = "Could not perform a stat on the file.";
    switch(statcode)
    {
      case 20001:
        break;
      case 20002:
        uint64_t v8 = "A new pool could not be created.";
        break;
      case 20003:
      case 20018:
LABEL_70:
        uint64_t v8 = "Error string not specified yet";
        break;
      case 20004:
        uint64_t v8 = "An invalid date has been provided";
        break;
      case 20005:
        uint64_t v8 = "An invalid socket was returned";
        break;
      case 20006:
        uint64_t v8 = "No process was provided and one was required.";
        break;
      case 20007:
        uint64_t v8 = "No time was provided and one was required.";
        break;
      case 20008:
        uint64_t v8 = "No directory was provided and one was required.";
        break;
      case 20009:
        uint64_t v8 = "No lock was provided and one was required.";
        break;
      case 20010:
        uint64_t v8 = "No poll structure was provided and one was required.";
        break;
      case 20011:
        uint64_t v8 = "No socket was provided and one was required.";
        break;
      case 20012:
        uint64_t v8 = "No thread was provided and one was required.";
        break;
      case 20013:
        uint64_t v8 = "No thread key structure was provided and one was required.";
        break;
      case 20014:
        uint64_t v8 = "Internal error (specific information not available)";
        break;
      case 20015:
        uint64_t v8 = "No shared memory is currently available";
        break;
      case 20016:
        uint64_t v8 = "The specified IP address is invalid.";
        break;
      case 20017:
        uint64_t v8 = "The specified network mask is invalid.";
        break;
      case 20019:
        uint64_t v8 = "DSO load failed";
        break;
      case 20020:
        uint64_t v8 = "The given path is absolute";
        break;
      case 20021:
        uint64_t v8 = "The given path is relative";
        break;
      case 20022:
        uint64_t v8 = "The given path is incomplete";
        break;
      case 20023:
        uint64_t v8 = "The given path was above the root path";
        break;
      case 20024:
        uint64_t v8 = "The given path is misformatted or contained invalid characters";
        break;
      case 20025:
        uint64_t v8 = "The given path contained wildcard characters";
        break;
      case 20026:
        uint64_t v8 = "Could not find the requested symbol.";
        break;
      case 20027:
        uint64_t v8 = "The process is not recognized.";
        break;
      case 20028:
        uint64_t v8 = "Not enough entropy to continue.";
        break;
      default:
        switch(statcode)
        {
          case 70001:
            uint64_t v8 = "Your code just forked, and you are currently executing in the child process";
            break;
          case 70002:
            uint64_t v8 = "Your code just forked, and you are currently executing in the parent process";
            break;
          case 70003:
            uint64_t v8 = "The specified thread is detached";
            break;
          case 70004:
            uint64_t v8 = "The specified thread is not detached";
            break;
          case 70005:
            uint64_t v8 = "The specified child process is done executing";
            break;
          case 70006:
            uint64_t v8 = "The specified child process is not done executing";
            break;
          case 70007:
            uint64_t v8 = "The timeout specified has expired";
            break;
          case 70008:
            uint64_t v8 = "Partial results are valid but processing is incomplete";
            break;
          case 70012:
            uint64_t v8 = "Bad character specified on command line";
            break;
          case 70013:
            uint64_t v8 = "Missing parameter for the specified command line option";
            break;
          case 70014:
            uint64_t v8 = "End of file found";
            break;
          case 70015:
            uint64_t v8 = "Could not find specified socket in poll list.";
            break;
          case 70019:
            uint64_t v8 = "Shared memory is implemented anonymously";
            break;
          case 70020:
            uint64_t v8 = "Shared memory is implemented using files";
            break;
          case 70021:
            uint64_t v8 = "Shared memory is implemented using a key system";
            break;
          case 70022:
            uint64_t v8 = "There is no error, this value signifies an initialized error code";
            break;
          case 70023:
            uint64_t v8 = "This function has not been implemented on this platform";
            break;
          case 70024:
            uint64_t v8 = "passwords do not match";
            break;
          case 70025:
            uint64_t v8 = "The given lock was busy.";
            break;
          default:
            goto LABEL_70;
        }
        break;
    }
    if (!bufsize) {
      return buf;
    }
    unsigned int v6 = buf;
    if (&buf[bufsize - 1] <= buf) {
      goto LABEL_89;
    }
    apr_size_t v19 = bufsize - 1;
    uint64_t v20 = buf;
    while (1)
    {
      int v21 = *(unsigned __int8 *)v8;
      *uint64_t v20 = v21;
      if (!v21) {
        break;
      }
      ++v20;
      ++v8;
      if (!--v19)
      {
        unsigned int v6 = &buf[bufsize - 1];
        goto LABEL_89;
      }
    }
  }
  return buf;
}

apr_hash_t *__cdecl apr_hash_make(apr_pool_t *pool)
{
  v6.__darwin_time_t tv_sec = 0;
  *(void *)&v6.tv_usec = 0;
  gettimeofday(&v6, 0);
  v6.__darwin_time_t tv_sec = v6.tv_usec + 1000000 * v6.tv_sec;
  __darwin_time_t tv_sec = v6.tv_sec;
  unsigned int v3 = apr_palloc(pool, 0x50uLL);
  void *v3 = pool;
  v3[9] = 0;
  v3[6] = 0xF00000000;
  *((_DWORD *)v3 + 14) = (&v6 ^ pool ^ v3 ^ tv_sec ^ HIDWORD(tv_sec)) - 1;
  apr_size_t v4 = apr_palloc(pool, 0x80uLL);
  if (v4)
  {
    void v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
  }
  v3[1] = v4;
  v3[8] = 0;
  return (apr_hash_t *)v3;
}

apr_hash_t *__cdecl apr_hash_make_custom(apr_pool_t *pool, apr_hashfunc_t hash_func)
{
  uint64_t result = apr_hash_make(pool);
  *((void *)result + 8) = hash_func;
  return result;
}

apr_hash_index_t *__cdecl apr_hash_next(apr_hash_index_t *hi)
{
  id v1 = (void *)*((void *)hi + 2);
  *((void *)hi + 1) = v1;
  if (v1)
  {
LABEL_5:
    *((void *)hi + 2) = *v1;
  }
  else
  {
    uint64_t v2 = *(void *)hi;
    unsigned int v3 = *(_DWORD *)(*(void *)hi + 52);
    unsigned int v4 = *((_DWORD *)hi + 6);
    while (v4 <= v3)
    {
      id v1 = *(void **)(*(void *)(v2 + 8) + 8 * v4++);
      *((_DWORD *)hi + 6) = v4;
      *((void *)hi + 1) = v1;
      if (v1) {
        goto LABEL_5;
      }
    }
    return 0;
  }
  return hi;
}

apr_hash_index_t *__cdecl apr_hash_first(apr_pool_t *p, apr_hash_t *ht)
{
  if (p) {
    unsigned int v3 = (char *)apr_palloc(p, 0x20uLL);
  }
  else {
    unsigned int v3 = (char *)ht + 16;
  }
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)unsigned int v3 = ht;
  *((_DWORD *)v3 + 6) = 0;

  return apr_hash_next((apr_hash_index_t *)v3);
}

void apr_hash_this(apr_hash_index_t *hi, const void **key, apr_ssize_t *klen, void **val)
{
  if (key) {
    *key = *(const void **)(*((void *)hi + 1) + 16);
  }
  if (klen) {
    *klen = *(void *)(*((void *)hi + 1) + 24);
  }
  if (val) {
    *val = *(void **)(*((void *)hi + 1) + 32);
  }
}

const void *__cdecl apr_hash_this_key(apr_hash_index_t *hi)
{
  return *(const void **)(*((void *)hi + 1) + 16);
}

apr_ssize_t apr_hash_this_key_len(apr_hash_index_t *hi)
{
  return *(void *)(*((void *)hi + 1) + 24);
}

void *__cdecl apr_hash_this_val(apr_hash_index_t *hi)
{
  return *(void **)(*((void *)hi + 1) + 32);
}

unsigned int apr_hashfunc_default(const char *key, apr_ssize_t *klen)
{
  return hashfunc_default(key, klen, 0);
}

uint64_t hashfunc_default(unsigned char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (*a2 == -1)
  {
    int v5 = *a1;
    if (*a1)
    {
      timeval v6 = a1;
      do
      {
        a3 = (33 * a3 + v5);
        int v7 = *++v6;
        int v5 = v7;
      }
      while (v7);
    }
    else
    {
      timeval v6 = a1;
    }
    *a2 = v6 - a1;
  }
  else
  {
    for (; v3; --v3)
    {
      int v4 = *a1++;
      a3 = (33 * a3 + v4);
    }
  }
  return a3;
}

apr_hash_t *__cdecl apr_hash_copy(apr_pool_t *pool, const apr_hash_t *h)
{
  uint64_t result = (apr_hash_t *)apr_palloc(pool, 40 * *((unsigned int *)h + 12) + 8 * (*((_DWORD *)h + 13) + 1) + 80);
  uint64_t v5 = 0;
  timeval v6 = 0;
  *((_DWORD *)result + 12) = *((_DWORD *)h + 12);
  uint64_t v7 = *(void *)((char *)h + 52);
  *(void *)((char *)result + 52) = v7;
  *((void *)result + 8) = *((void *)h + 8);
  *((void *)result + 9) = 0;
  *(void *)uint64_t result = pool;
  *((void *)result + 1) = (char *)result + 80;
  uint64_t v8 = (char *)result + 8 * (*((_DWORD *)h + 13) + 1) + 80;
  if ((v7 + 1) > 1) {
    uint64_t v9 = (v7 + 1);
  }
  else {
    uint64_t v9 = 1;
  }
  do
  {
    BOOL v10 = (char **)(*((void *)result + 1) + 8 * v5);
    apr_size_t v11 = *(uint64_t **)(*((void *)h + 1) + 8 * v5);
    if (v11)
    {
      do
      {
        int v12 = (char **)(v6 + 1);
        int v13 = &v8[40 * v6];
        *BOOL v10 = v13;
        *((_DWORD *)v13 + 2) = *((_DWORD *)v11 + 2);
        BOOL v14 = (char *)v11[3];
        *((void *)v13 + 2) = v11[2];
        timeval v6 = (char **)*v10;
        unsigned int v15 = (char *)v11[4];
        v6[3] = v14;
        void v6[4] = v15;
        BOOL v10 = (char **)*v10;
        apr_size_t v11 = (uint64_t *)*v11;
        LODWORD(v6) = v12;
      }
      while (v11);
    }
    else
    {
      int v12 = v6;
    }
    *BOOL v10 = 0;
    ++v5;
    timeval v6 = v12;
  }
  while (v5 != v9);
  return result;
}

void *__cdecl apr_hash_get(apr_hash_t *ht, const void *key, apr_ssize_t klen)
{
  entry = find_entry((uint64_t)ht, key, klen, 0);
  if (*entry) {
    return *(void **)(*entry + 32);
  }
  else {
    return 0;
  }
}

void *find_entry(uint64_t a1, unsigned char *a2, size_t a3, uint64_t a4)
{
  size_t __n = a3;
  uint64_t v7 = *(uint64_t (**)(unsigned char *, size_t *))(a1 + 64);
  if (v7) {
    unsigned int v8 = v7(a2, &__n);
  }
  else {
    unsigned int v8 = hashfunc_default(a2, (uint64_t *)&__n, *(unsigned int *)(a1 + 56));
  }
  unsigned int v9 = v8;
  BOOL v10 = (void *)(*(void *)(a1 + 8) + 8 * (*(_DWORD *)(a1 + 52) & v8));
  uint64_t v11 = *v10;
  if (*v10)
  {
    size_t v12 = __n;
    while (1)
    {
      int v13 = v10;
      BOOL v10 = (void *)v11;
      if (*(_DWORD *)(v11 + 8) == v9 && *(void *)(v11 + 24) == v12 && !memcmp(*(const void **)(v11 + 16), a2, v12)) {
        break;
      }
      uint64_t v11 = *v10;
      if (!*v10) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (a4)
    {
      BOOL v14 = *(_DWORD **)(a1 + 72);
      if (v14) {
        *(void *)(a1 + 72) = *(void *)v14;
      }
      else {
        BOOL v14 = apr_palloc(*(apr_pool_t **)a1, 0x28uLL);
      }
      *(void *)BOOL v14 = 0;
      v14[2] = v9;
      size_t v15 = __n;
      *((void *)v14 + 2) = a2;
      *((void *)v14 + 3) = v15;
      *((void *)v14 + 4) = a4;
      *BOOL v10 = v14;
      ++*(_DWORD *)(a1 + 48);
    }
    return v10;
  }
  return v13;
}

void apr_hash_set(apr_hash_t *ht, const void *key, apr_ssize_t klen, const void *val)
{
  entry = find_entry((uint64_t)ht, key, klen, (uint64_t)val);
  uint64_t v7 = (void *)*entry;
  if (*entry)
  {
    if (val)
    {
      _OWORD v7[4] = val;
      unsigned int v8 = *((_DWORD *)ht + 13);
      if (*((_DWORD *)ht + 12) > v8)
      {
        int v9 = (2 * v8) | 1;
        apr_size_t v10 = 8 * (2 * v8 + 2);
        uint64_t v11 = apr_palloc(*(apr_pool_t **)ht, v10);
        size_t v12 = v11;
        if (v11) {
          bzero(v11, v10);
        }
        int v13 = (apr_hash_t *)((char *)ht + 16);
        *((void *)ht + 3) = 0;
        *((void *)ht + 4) = 0;
        *((void *)ht + 2) = ht;
        *((_DWORD *)ht + 10) = 0;
        while (1)
        {
          int v13 = apr_hash_next(v13);
          if (!v13) {
            break;
          }
          uint64_t v14 = *((void *)v13 + 1);
          unsigned int v15 = *(_DWORD *)(v14 + 8) & v9;
          *(void *)uint64_t v14 = v12[v15];
          v12[v15] = v14;
        }
        *((void *)ht + 1) = v12;
        *((_DWORD *)ht + 13) = v9;
      }
    }
    else
    {
      void *entry = *v7;
      void *v7 = *((void *)ht + 9);
      *((void *)ht + 9) = v7;
      --*((_DWORD *)ht + 12);
    }
  }
}

unsigned int apr_hash_count(apr_hash_t *ht)
{
  return *((_DWORD *)ht + 12);
}

void apr_hash_clear(apr_hash_t *ht)
{
  *((void *)ht + 4) = 0;
  *((void *)ht + 2) = ht;
  *((void *)ht + 3) = 0;
  *((_DWORD *)ht + 10) = 0;
  uint64_t v2 = apr_hash_next((apr_hash_t *)((char *)ht + 16));
  if (v2)
  {
    uint64_t v3 = v2;
    do
    {
      apr_hash_set(ht, *(const void **)(*((void *)v3 + 1) + 16), *(void *)(*((void *)v3 + 1) + 24), 0);
      uint64_t v3 = apr_hash_next(v3);
    }
    while (v3);
  }
}

apr_hash_t *__cdecl apr_hash_overlay(apr_pool_t *p, const apr_hash_t *overlay, const apr_hash_t *base)
{
  return apr_hash_merge(p, overlay, base, 0, 0);
}

apr_hash_t *__cdecl apr_hash_merge(apr_pool_t *p, const apr_hash_t *h1, const apr_hash_t *h2, void *(__cdecl *merger)(apr_pool_t *, const void *, apr_ssize_t, const void *, const void *, const void *), const void *data)
{
  unsigned int v8 = apr_palloc(p, 0x50uLL);
  int v9 = v8;
  *unsigned int v8 = p;
  v8[8] = *((void *)h2 + 8);
  v8[9] = 0;
  unsigned int v10 = *((_DWORD *)h2 + 13);
  *((_DWORD *)v8 + 12) = *((_DWORD *)h2 + 12);
  int v12 = *((_DWORD *)h1 + 12);
  unsigned int v11 = *((_DWORD *)h1 + 13);
  if (v11 <= v10) {
    unsigned int v11 = v10;
  }
  *((_DWORD *)v8 + 13) = v11;
  if (v12 + *((_DWORD *)h2 + 12) > v11)
  {
    unsigned int v11 = (2 * v11) | 1;
    *((_DWORD *)v8 + 13) = v11;
  }
  *((_DWORD *)v8 + 14) = *((_DWORD *)h2 + 14);
  apr_size_t v13 = 8 * (v11 + 1);
  uint64_t v14 = apr_palloc(p, v13);
  unsigned int v15 = v14;
  if (v14) {
    bzero(v14, v13);
  }
  v9[1] = v15;
  unsigned int v16 = *((_DWORD *)h1 + 12) + *((_DWORD *)h2 + 12);
  if (v16) {
    uint64_t v17 = (char *)apr_palloc(p, 40 * v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = 0;
  int v19 = 0;
  int v20 = *((_DWORD *)h2 + 13);
  if ((v20 + 1) > 1) {
    uint64_t v21 = (v20 + 1);
  }
  else {
    uint64_t v21 = 1;
  }
  do
  {
    uint64_t v22 = *(uint64_t **)(*((void *)h2 + 1) + 8 * v18);
    if (v22)
    {
      int v23 = *((_DWORD *)v9 + 13);
      do
      {
        unsigned int v24 = *((_DWORD *)v22 + 2);
        uint64_t v25 = &v17[40 * v19];
        *((_OWORD *)v25 + 1) = *((_OWORD *)v22 + 1);
        *((void *)v25 + 4) = v22[4];
        uint64_t v26 = v9[1];
        uint64_t v27 = *(void *)(v26 + 8 * (v23 & v24));
        *((_DWORD *)v25 + 2) = v24;
        *(void *)uint64_t v25 = v27;
        *(void *)(v26 + 8 * (v23 & v24)) = v25;
        ++v19;
        uint64_t v22 = (uint64_t *)*v22;
      }
      while (v22);
    }
    ++v18;
  }
  while (v18 != v21);
  int v44 = p;
  unsigned int v28 = 0;
  int v42 = h1;
  do
  {
    unsigned int v43 = v28;
    for (uint64_t i = *(void **)(*((void *)h1 + 1) + 8 * v28); i; uint64_t i = (void *)*i)
    {
      int v30 = (uint64_t (*)(unsigned char *, void *))v9[8];
      BOOL v31 = (unsigned char *)i[2];
      if (v30) {
        unsigned int v32 = v30(v31, i + 3);
      }
      else {
        unsigned int v32 = hashfunc_default(v31, i + 3, *((unsigned int *)v9 + 14));
      }
      unsigned int v33 = v32;
      uint64_t v34 = *((_DWORD *)v9 + 13) & v32;
      uint64_t v35 = v9[1];
      int v36 = *(uint64_t ***)(v35 + 8 * v34);
      size_t v37 = i[3];
      if (v36)
      {
        while (1)
        {
          if (v36[3] == (uint64_t *)v37)
          {
            int64_t v38 = (const void *)i[2];
            if (!memcmp(v36[2], v38, v37)) {
              break;
            }
          }
          int v36 = (uint64_t **)*v36;
          if (!v36) {
            goto LABEL_26;
          }
        }
        uint64_t v40 = (uint64_t *)i[4];
        if (merger) {
          v36[4] = (uint64_t *)((uint64_t (*)(apr_pool_t *, const void *, size_t, uint64_t *, uint64_t *, const void *))merger)(v44, v38, v37, v40, v36[4], data);
        }
        else {
          v36[4] = v40;
        }
      }
      else
      {
LABEL_26:
        int v39 = &v17[40 * v19];
        *((void *)v39 + 2) = i[2];
        *((void *)v39 + 3) = v37;
        *((void *)v39 + 4) = i[4];
        *((_DWORD *)v39 + 2) = v33;
        *(void *)int v39 = *(void *)(v35 + 8 * v34);
        *(void *)(v35 + 8 * v34) = v39;
        ++*((_DWORD *)v9 + 12);
        ++v19;
      }
    }
    unsigned int v28 = v43 + 1;
    h1 = v42;
  }
  while (v43 + 1 <= *((_DWORD *)v42 + 13));
  return (apr_hash_t *)v9;
}

int apr_hash_do(apr_hash_do_callback_fn_t *comp, void *rec, const apr_hash_t *ht)
{
  unsigned int v5 = 0;
  uint64_t v12 = 0;
  v11[0] = ht;
  unsigned int v6 = *((_DWORD *)ht + 13);
  uint64_t v7 = *((void *)ht + 1);
  while (1)
  {
    unsigned int v8 = *(void **)(v7 + 8 * v5++);
    v11[1] = v8;
    if (v8) {
      break;
    }
    if (v5 > v6) {
      return 1;
    }
  }
  LODWORD(v12) = v5;
  v11[2] = *v8;
  int v9 = (apr_hash_index_t *)v11;
  while (1)
  {
    int result = ((uint64_t (*)(void *, void, void, void))comp)(rec, *(void *)(*((void *)v9 + 1) + 16), *(void *)(*((void *)v9 + 1) + 24), *(void *)(*((void *)v9 + 1) + 32));
    if (!result) {
      break;
    }
    int v9 = apr_hash_next(v9);
    if (!v9) {
      return 1;
    }
  }
  return result;
}

apr_pool_t *__cdecl apr_hash_pool_get(const apr_hash_t *thehash)
{
  return *(apr_pool_t **)thehash;
}

uint64_t GTCoreAllocatorInit(uint64_t result)
{
  hideMemory = result & 1;
  return result;
}

uint64_t GTCoreAllocatorIsHiddingMemory()
{
  return hideMemory;
}

vm_address_t GTCoreAlloc(uint64_t a1, memory_object_size_t a2)
{
  kern_return_t v13;
  FILE *v15;
  void block[4];
  kern_return_t v17;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  uint64_t v25 = *MEMORY[0x263EF8340];
  vm_address_t address = 0;
  object_handle = 0;
  size = a2;
  uint64_t v3 = (vm_map_t *)MEMORY[0x263EF8960];
  mach_error_t memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x263EF8960], &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    mach_error_t v5 = memory_entry_64;
    if (!s_logUsingOsLog)
    {
      uint64_t v12 = (FILE *)*MEMORY[0x263EF8348];
      mach_error_string(memory_entry_64);
      fprintf(v12, "warning: failed to create memory entry error 0x%x (%s)\n");
      return 0;
    }
    unsigned int v6 = gt_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = mach_error_string(v5);
      *(_DWORD *)buf = 67109378;
      uint64_t v22 = v5;
      int v23 = 2080;
      unsigned int v24 = v7;
      unsigned int v8 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_9:
      _os_log_error_impl(&dword_24F657000, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  mach_error_t v9 = vm_map(*v3, &address, a2, 0, 1, object_handle, 0, 0, 3, 3, 1u);
  if (v9)
  {
    mach_error_t v10 = v9;
    if (!s_logUsingOsLog)
    {
      unsigned int v15 = (FILE *)*MEMORY[0x263EF8348];
      mach_error_string(v9);
      fprintf(v15, "warning: failed to map memory error 0x%x (%s)\n");
      return 0;
    }
    unsigned int v6 = gt_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unsigned int v11 = mach_error_string(v10);
      *(_DWORD *)buf = 67109378;
      uint64_t v22 = v10;
      int v23 = 2080;
      unsigned int v24 = v11;
      unsigned int v8 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_9;
    }
    return 0;
  }
  if (hideMemory)
  {
    apr_size_t v13 = mach_memory_entry_ownership(object_handle, *v3, 4, 1);
    if (v13)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __GTCoreAlloc_block_invoke;
      block[3] = &__block_descriptor_tmp_5;
      uint64_t v17 = v13;
      if (GTCoreAlloc_onceToken != -1) {
        dispatch_once(&GTCoreAlloc_onceToken, block);
      }
    }
  }
  mach_port_deallocate(*v3, object_handle);
  return address;
}

void __GTCoreAlloc_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (s_logUsingOsLog)
  {
    uint64_t v2 = gt_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      mach_error_t v3 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109378;
      mach_error_t v8 = v3;
      __int16 v9 = 2080;
      mach_error_t v10 = mach_error_string(v3);
      _os_log_error_impl(&dword_24F657000, v2, OS_LOG_TYPE_ERROR, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)", buf, 0x12u);
    }
  }
  else
  {
    int v4 = (FILE *)*MEMORY[0x263EF8348];
    mach_error_t v5 = *(_DWORD *)(a1 + 32);
    unsigned int v6 = mach_error_string(v5);
    fprintf(v4, "warning: failed to mark memory(GRAPHICS) error 0x%x (%s)\n", v5, v6);
  }
}

void *GTCoreFree(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    int result = (void *)MEMORY[0x253361B90](*MEMORY[0x263EF8960], *result, a2);
    *uint64_t v2 = 0;
  }
  return result;
}

apr_status_t apr_atomic_init(apr_pool_t *p)
{
  if (hash_mutex) {
    return 0;
  }
  uint64_t v2 = apr_palloc(p, 0x38uLL);
  hash_mutex = (uint64_t)v2;
  mach_error_t v3 = (void *)*((void *)p + 5);
  if (v3) {
    *((void *)p + 5) = *v3;
  }
  else {
    mach_error_t v3 = apr_palloc(p, 0x20uLL);
  }
  uint64_t v4 = 0;
  v3[1] = v2;
  v3[2] = atomic_cleanup;
  v3[3] = apr_pool_cleanup_null;
  void *v3 = *((void *)p + 4);
  *((void *)p + 4) = v3;
  while (1)
  {
    apr_status_t result = apr_thread_mutex_create((apr_thread_mutex_t **)(hash_mutex + v4), 0, p);
    if (result) {
      break;
    }
    v4 += 8;
    if (v4 == 56) {
      return 0;
    }
  }
  return result;
}

uint64_t atomic_cleanup(uint64_t a1)
{
  if (hash_mutex == a1) {
    hash_mutex = 0;
  }
  return 0;
}

apr_uint32_t apr_atomic_read32(apr_uint32_t *mem)
{
  return *mem;
}

void apr_atomic_set32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (*mem = val, pthread_mutex_unlock(v4))) {
    abort();
  }
}

apr_uint32_t apr_atomic_add32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem += val, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void apr_atomic_sub32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (*mem -= val, pthread_mutex_unlock(v4))) {
    abort();
  }
}

apr_uint32_t apr_atomic_inc32(apr_uint32_t *mem)
{
  return apr_atomic_add32(mem, 1u);
}

int apr_atomic_dec32(apr_uint32_t *mem)
{
  uint64_t v2 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v2) || (--*mem, apr_uint32_t v3 = *mem, pthread_mutex_unlock(v2))) {
    abort();
  }
  return v3;
}

apr_uint32_t apr_atomic_cas32(apr_uint32_t *mem, apr_uint32_t with, apr_uint32_t cmp)
{
  unsigned int v6 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v6)) {
    goto LABEL_6;
  }
  apr_uint32_t v7 = *mem;
  if (*mem == cmp) {
    *mem = with;
  }
  if (pthread_mutex_unlock(v6)) {
LABEL_6:
  }
    abort();
  return v7;
}

apr_uint32_t apr_atomic_xchg32(apr_uint32_t *mem, apr_uint32_t val)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)mem / 0x1C) + ((unint64_t)mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem = val, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void *__cdecl apr_atomic_casptr(void **mem, void *with, const void *cmp)
{
  unsigned int v6 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)*mem / 0x1C) + ((unint64_t)*mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v6)) {
    goto LABEL_6;
  }
  apr_uint32_t v7 = *mem;
  if (*mem == cmp) {
    *mem = with;
  }
  if (pthread_mutex_unlock(v6)) {
LABEL_6:
  }
    abort();
  return v7;
}

void *__cdecl apr_atomic_xchgptr(void **mem, void *with)
{
  uint64_t v4 = (pthread_mutex_t *)(*(void *)(hash_mutex
                                     + 8 * (-7 * ((unint64_t)*mem / 0x1C) + ((unint64_t)*mem >> 2)))
                         + 8);
  if (pthread_mutex_lock(v4) || (apr_uint32_t v5 = *mem, *mem = with, pthread_mutex_unlock(v4))) {
    abort();
  }
  return v5;
}

void apr_pool_attribute_cleanup_destroy(apr_pool_t **a1)
{
}

void apr_pool_destroy(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }
  *((void *)p + 14) = 0;
  while (1)
  {
    apr_uint32_t v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }
  while (1)
  {
    uint64_t v4 = *((void *)p + 4);
    if (!v4) {
      break;
    }
    *((void *)p + 4) = *(void *)v4;
    (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
  }
  free_proc_chain(*((void *)p + 7));
  if (*(void *)p)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)p + 48) + 24);
    if (v5) {
      pthread_mutex_lock((pthread_mutex_t *)(v5 + 8));
    }
    uint64_t v6 = *((void *)p + 2);
    **((void **)p + 3) = v6;
    if (v6) {
      *(void *)(*((void *)p + 2) + 24) = *((void *)p + 3);
    }
    if (v5) {
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 8));
    }
  }
  apr_uint32_t v7 = (unint64_t *)*((void *)p + 6);
  mach_error_t v8 = (uint64_t **)*((void *)p + 12);
  *v8[1] = 0;
  if ((apr_pool_t *)v7[4] == p)
  {
    v7[3] = 0;
  }
  else
  {
    unint64_t v9 = v7[3];
    if (v9) {
      pthread_mutex_lock((pthread_mutex_t *)(v9 + 8));
    }
  }
  mach_error_t v10 = 0;
  unint64_t v11 = *v7;
  unint64_t v12 = v7[1];
  unint64_t v13 = v7[2];
  do
  {
    while (1)
    {
      while (1)
      {
        uint64_t v14 = (uint64_t *)v8;
        mach_error_t v8 = (uint64_t **)*v8;
        unint64_t v15 = *((unsigned int *)v14 + 4);
        if (!v12 || v13 > v15) {
          break;
        }
        uint64_t *v14 = (uint64_t)v10;
        mach_error_t v10 = v14;
        if (!v8) {
          goto LABEL_38;
        }
      }
      if (v15 > 0x13) {
        break;
      }
      unsigned int v16 = (uint64_t *)&v7[v15];
      uint64_t v17 = v16[5];
      uint64_t *v14 = v17;
      if (v11 < v15 && v17 == 0) {
        unint64_t v11 = v15;
      }
      v16[5] = (uint64_t)v14;
      if (v13 <= v15)
      {
        unint64_t v13 = 0;
        if (!v8) {
          goto LABEL_38;
        }
      }
      else
      {
        v13 += ~v15;
        if (!v8) {
          goto LABEL_38;
        }
      }
    }
    uint64_t *v14 = v7[5];
    v7[5] = (unint64_t)v14;
    BOOL v19 = v13 > v15;
    v13 += ~v15;
    if (!v19) {
      unint64_t v13 = 0;
    }
  }
  while (v8);
LABEL_38:
  unint64_t *v7 = v11;
  v7[2] = v13;
  unint64_t v20 = v7[3];
  if (v20) {
    pthread_mutex_unlock((pthread_mutex_t *)(v20 + 8));
  }
  if (v10)
  {
    uint64_t v21 = (unsigned int *)MEMORY[0x263EF8960];
    do
    {
      uint64_t v22 = (uint64_t *)*v10;
      MEMORY[0x253361B90](*v21, v10, ((*((_DWORD *)v10 + 4) << 12) + 4096));
      mach_error_t v10 = v22;
    }
    while (v22);
  }
  if ((apr_pool_t *)v7[4] == p)
  {
    apr_allocator_destroy((apr_allocator_t *)v7);
  }
}

uint64_t free_proc_chain(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t v2 = result;
  do
  {
    apr_status_t result = apr_proc_wait(*(apr_proc_t **)v2, 0, 0, APR_NOWAIT);
    if (result != 70006) {
      *(_DWORD *)(v2 + 8) = 0;
    }
    uint64_t v2 = *(void *)(v2 + 16);
  }
  while (v2);
  uint64_t v3 = v1;
  do
  {
    int v4 = *(_DWORD *)(v3 + 8);
    if (v4 == 1)
    {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v3, 9);
    }
    else if (v4 == 4 || v4 == 2)
    {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v3, 15);
      if (!result) {
        LODWORD(v2) = 1;
      }
    }
    uint64_t v3 = *(void *)(v3 + 16);
  }
  while (v3);
  uint64_t v6 = v1;
  if (!v2) {
    goto LABEL_29;
  }
  long long v11 = xmmword_24F695640;
  apr_status_t result = select(0, 0, 0, 0, (timeval *)&v11);
  unint64_t v7 = 46875;
  while (2)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v1;
    do
    {
      uint64_t v10 = v8;
      if (*(_DWORD *)(v9 + 8) == 2)
      {
        uint64_t v8 = 1;
        apr_status_t result = apr_proc_wait(*(apr_proc_t **)v9, 0, 0, APR_NOWAIT);
        if (result == 70006) {
          goto LABEL_24;
        }
        *(_DWORD *)(v9 + 8) = 0;
      }
      uint64_t v8 = v10;
LABEL_24:
      uint64_t v9 = *(void *)(v9 + 16);
    }
    while (v9);
    if (v8 && v7 <= 0x2DC6BF)
    {
      *(void *)&long long v11 = v7 / 0xF4240;
      *((void *)&v11 + 1) = v7 % 0xF4240;
      apr_status_t result = select(0, 0, 0, 0, (timeval *)&v11);
      v7 *= 2;
      continue;
    }
    break;
  }
  uint64_t v6 = v1;
  do
  {
LABEL_29:
    if (*(_DWORD *)(v6 + 8) == 2) {
      apr_status_t result = apr_proc_kill(*(apr_proc_t **)v6, 9);
    }
    uint64_t v6 = *(void *)(v6 + 16);
  }
  while (v6);
  do
  {
    if (*(_DWORD *)(v1 + 8)) {
      apr_status_t result = apr_proc_wait(*(apr_proc_t **)v1, 0, 0, APR_WAIT);
    }
    uint64_t v1 = *(void *)(v1 + 16);
  }
  while (v1);
  return result;
}

void apr_allocator_destroy(apr_allocator_t *allocator)
{
  uint64_t v2 = 0;
  uint64_t v3 = (unsigned int *)MEMORY[0x263EF8960];
  while (1)
  {
    int v4 = (char *)allocator + 8 * v2;
    unint64_t v7 = (void *)*((void *)v4 + 5);
    uint64_t v6 = v4 + 40;
    uint64_t v5 = v7;
    if (v7)
    {
      do
      {
        void *v6 = *v5;
        MEMORY[0x253361B90](*v3);
        uint64_t v5 = (void *)*v6;
      }
      while (*v6);
    }
    if (++v2 == 20)
    {
      JUMPOUT(0x253361B90);
    }
  }
}

apr_status_t apr_allocator_create(apr_allocator_t **allocator)
{
  *allocator = 0;
  vm_address_t v2 = GTCoreAlloc((uint64_t)allocator, 0xC8uLL);
  if (!v2) {
    return 12;
  }
  vm_address_t v3 = v2;
  apr_status_t result = 0;
  *(void *)(v3 + 192) = 0;
  *(_OWORD *)(v3 + 160) = 0u;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)vm_address_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *allocator = (apr_allocator_t *)v3;
  return result;
}

void apr_allocator_mutex_set(apr_allocator_t *allocator, apr_thread_mutex_t *mutex)
{
  *((void *)allocator + 3) = mutex;
}

apr_thread_mutex_t *__cdecl apr_allocator_mutex_get(apr_allocator_t *allocator)
{
  return (apr_thread_mutex_t *)*((void *)allocator + 3);
}

void apr_allocator_owner_set(apr_allocator_t *allocator, apr_pool_t *pool)
{
  *((void *)allocator + 4) = pool;
}

apr_pool_t *__cdecl apr_allocator_owner_get(apr_allocator_t *allocator)
{
  return (apr_pool_t *)*((void *)allocator + 4);
}

void apr_allocator_max_free_set(apr_allocator_t *allocator, apr_size_t size)
{
  uint64_t v4 = *((void *)allocator + 3);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  }
  apr_size_t v5 = (size + 4095) >> 12;
  apr_size_t v6 = *((void *)allocator + 2) + v5 - *((void *)allocator + 1);
  *((void *)allocator + 1) = v5;
  *((void *)allocator + 2) = v6;
  if (v6 > v5) {
    *((void *)allocator + 2) = v5;
  }
  if (v4)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 8));
  }
}

unint64_t apr_allocator_align(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v3 = 0x2000;
  if (v2 > 0x2000) {
    unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v2 >= a2) {
    return v3;
  }
  else {
    return 0;
  }
}

vm_address_t allocator_alloc(uint64_t a1, unint64_t a2)
{
  vm_address_t v2 = 0;
  unint64_t v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  unint64_t v4 = 0x2000;
  if (v3 > 0x2000) {
    unint64_t v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  }
  if (v3 >= a2) {
    memory_object_size_t v5 = v4;
  }
  else {
    memory_object_size_t v5 = 0;
  }
  if (v3 >= a2)
  {
    unint64_t v6 = v4 >> 12;
    unint64_t v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7)) {
      return 0;
    }
    uint64_t v8 = (unint64_t *)a1;
    unint64_t v9 = *(void *)a1;
    if (v7 <= *(void *)a1)
    {
      uint64_t v14 = *(void *)(a1 + 24);
      if (v14)
      {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        unint64_t v9 = *v8;
      }
      unint64_t v15 = &v8[v7];
      vm_address_t v17 = v15[5];
      unsigned int v16 = v15 + 5;
      vm_address_t v2 = v17;
      BOOL v18 = v17 == 0;
      BOOL v19 = v7 < v9;
      if (v17) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v7 >= v9;
      }
      if (!v20)
      {
        do
        {
          vm_address_t v21 = v16[1];
          ++v16;
          vm_address_t v2 = v21;
          BOOL v18 = v21 == 0;
          BOOL v19 = v6 < v9;
          if (v21) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v6 >= v9;
          }
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        vm_address_t v25 = *(void *)v2;
        void *v16 = *(void *)v2;
        if (v25) {
          BOOL v19 = 1;
        }
        if (!v19)
        {
          uint64_t v26 = v16 - 1;
          do
          {
            if (*v26--) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v9 == 1;
            }
            --v9;
          }
          while (!v28);
          *uint64_t v8 = v9;
        }
        uint64_t v13 = (*(_DWORD *)(v2 + 16) + 1);
LABEL_43:
        unint64_t v29 = v8[2] + v13;
        if (v29 >= v8[1]) {
          unint64_t v29 = v8[1];
        }
        v8[2] = v29;
        unint64_t v30 = v8[3];
        if (v30) {
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        }
        goto LABEL_47;
      }
    }
    else
    {
      vm_address_t v2 = a1 + 40;
      if (!*(void *)(a1 + 40))
      {
LABEL_30:
        vm_address_t v24 = GTCoreAlloc(a1, v5);
        vm_address_t v2 = v24;
        if (!v24) {
          return v2;
        }
        *(_DWORD *)(v24 + 16) = v7;
        *(void *)(v24 + 32) = v24 + v5;
LABEL_47:
        *(void *)vm_address_t v2 = 0;
        *(void *)(v2 + 24) = v2 + 40;
        return v2;
      }
      uint64_t v10 = *(void *)(a1 + 24);
      if (v10) {
        a1 = pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      while (1)
      {
        long long v11 = (void *)v2;
        vm_address_t v2 = *(void *)v2;
        if (!v2) {
          break;
        }
        unint64_t v12 = *(unsigned int *)(v2 + 16);
        if (v7 <= v12)
        {
          *long long v11 = *(void *)v2;
          uint64_t v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    unint64_t v23 = v8[3];
    if (v23) {
      a1 = pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    }
    goto LABEL_30;
  }
  return v2;
}

void apr_allocator_free(apr_allocator_t *allocator, apr_memnode_t *memnode)
{
  uint64_t v4 = *((void *)allocator + 3);
  if (v4) {
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 8));
  }
  memory_object_size_t v5 = 0;
  unint64_t v6 = *(void *)allocator;
  uint64_t v7 = *((void *)allocator + 1);
  unint64_t v8 = *((void *)allocator + 2);
  do
  {
    while (1)
    {
      while (1)
      {
        unint64_t v9 = memnode;
        memnode = memnode->next;
        unint64_t index = v9->index;
        if (!v7 || v8 > index) {
          break;
        }
        v9->next = v5;
        memory_object_size_t v5 = v9;
        if (!memnode) {
          goto LABEL_22;
        }
      }
      if (index > 0x13) {
        break;
      }
      long long v11 = (char *)allocator + 8 * index;
      unint64_t v12 = (apr_memnode_t *)*((void *)v11 + 5);
      v9->next = v12;
      if (v6 < index && v12 == 0) {
        unint64_t v6 = index;
      }
      *((void *)v11 + 5) = v9;
      if (v8 <= index)
      {
        unint64_t v8 = 0;
        if (!memnode) {
          goto LABEL_22;
        }
      }
      else
      {
        v8 += ~index;
        if (!memnode) {
          goto LABEL_22;
        }
      }
    }
    v9->next = (apr_memnode_t *)*((void *)allocator + 5);
    *((void *)allocator + 5) = v9;
    BOOL v14 = v8 > index;
    v8 += ~index;
    if (!v14) {
      unint64_t v8 = 0;
    }
  }
  while (memnode);
LABEL_22:
  *(void *)allocator = v6;
  *((void *)allocator + 2) = v8;
  uint64_t v15 = *((void *)allocator + 3);
  if (v15) {
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  }
  if (v5)
  {
    unsigned int v16 = (unsigned int *)MEMORY[0x263EF8960];
    do
    {
      next = v5->next;
      MEMORY[0x253361B90](*v16, v5, (v5->index << 12) + 4096);
      memory_object_size_t v5 = next;
    }
    while (next);
  }
}

apr_status_t apr_pool_initialize(void)
{
  if (apr_pools_shared_initialized) {
    return 0;
  }
  if (apr_pools_initialized++) {
    return 0;
  }
  global_allocator = 0;
  vm_address_t v4 = GTCoreAlloc(v0, 0xC8uLL);
  if (v4)
  {
    *(void *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    *(_OWORD *)vm_address_t v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    global_allocator = v4;
    apr_allocator_max_free_set((apr_allocator_t *)v4, 0x8000000uLL);
    apr_status_t v5 = apr_pool_create_ex((apr_pool_t **)&global_pool, 0, 0, (apr_allocator_t *)global_allocator);
    if (v5)
    {
      apr_status_t v2 = v5;
      apr_allocator_destroy((apr_allocator_t *)global_allocator);
      global_allocator = 0;
      apr_pools_initialized = 0;
    }
    else
    {
      unint64_t v6 = (apr_pool_t *)global_pool;
      *(void *)(global_pool + 80) = "apr_global_pool";
      apr_status_t v2 = apr_atomic_init(v6);
      if (!v2)
      {
        mutex = 0;
        apr_status_t v2 = apr_thread_mutex_create(&mutex, 0, (apr_pool_t *)global_pool);
        if (!v2)
        {
          uint64_t v7 = global_allocator;
          uint64_t v8 = global_pool;
          *(void *)(global_allocator + 24) = mutex;
          *(void *)(v7 + 32) = v8;
        }
      }
    }
  }
  else
  {
    apr_pools_initialized = 0;
    return 12;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  vm_address_t v4 = allocator;
  apr_abortfunc_t v5 = abort_fn;
  *newpool = 0;
  if (parent) {
    uint64_t v7 = parent;
  }
  else {
    uint64_t v7 = (apr_pool_t *)global_pool;
  }
  if (!abort_fn && v7) {
    apr_abortfunc_t v5 = (apr_abortfunc_t)*((void *)v7 + 8);
  }
  if (!allocator) {
    vm_address_t v4 = (apr_allocator_t *)*((void *)v7 + 6);
  }
  uint64_t v8 = (apr_pool_t *)allocator_alloc((uint64_t)v4, 0x1FD8uLL);
  if (v8)
  {
    *(void *)uint64_t v8 = v8;
    *((void *)v8 + 1) = v8;
    unint64_t v9 = (apr_pool_t **)*((void *)v8 + 3);
    *((void *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    v9[6] = v4;
    v9[7] = 0;
    v9[4] = 0;
    void v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    *unint64_t v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      uint64_t v10 = *(void *)(*((void *)v7 + 6) + 24);
      if (v10) {
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      }
      uint64_t v13 = (apr_pool_t *)*((void *)v7 + 1);
      unint64_t v12 = (apr_pool_t ***)((char *)v7 + 8);
      long long v11 = v13;
      v9[2] = v13;
      if (v13) {
        *((void *)v11 + 3) = v9 + 2;
      }
      apr_memnode_t *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10) {
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
      }
    }
    else
    {
      v9[2] = 0;
      v9[3] = 0;
    }
    apr_status_t v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }
  else
  {
    apr_status_t v14 = 12;
    if (v5) {
      ((void (*)(uint64_t))v5)(12);
    }
  }
  return v14;
}

void apr_pool_tag(apr_pool_t *pool, const char *tag)
{
  *((void *)pool + 10) = tag;
}

uint64_t apr_pool_shared_initialize(uint64_t a1)
{
  apr_pools_initialized = 1;
  apr_pools_shared_initialized = 1;
  global_pool = a1;
  global_allocator = *(void *)(a1 + 48);
  return 0;
}

void apr_pool_terminate(void)
{
  if ((apr_pools_shared_initialized & 1) == 0 && apr_pools_initialized && !--apr_pools_initialized)
  {
    apr_pool_destroy((apr_pool_t *)global_pool);
    global_pool = 0;
    global_allocator = 0;
  }
}

void *__cdecl apr_palloc(apr_pool_t *p, apr_size_t size)
{
  apr_size_t v3 = (size + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < size)
  {
LABEL_2:
    vm_address_t v4 = (void (*)(uint64_t))*((void *)p + 8);
    if (v4) {
      v4(12);
    }
    return 0;
  }
  unint64_t v6 = (vm_address_t *)*((void *)p + 11);
  apr_status_t result = (void *)v6[3];
  if (v3 <= v6[4] - (unint64_t)result)
  {
    v6[3] = (vm_address_t)result + v3;
    return result;
  }
  vm_address_t v7 = *v6;
  if (v3 <= *(void *)(*v6 + 32) - *(void *)(*v6 + 24))
  {
    **(void **)(v7 + 8) = *(void *)v7;
    *(void *)(*(void *)v7 + 8) = *(void *)(v7 + 8);
  }
  else
  {
    vm_address_t v7 = allocator_alloc(*((void *)p + 6), (size + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7) {
      goto LABEL_2;
    }
  }
  *(_DWORD *)(v7 + 20) = 0;
  apr_status_t result = *(void **)(v7 + 24);
  *(void *)(v7 + 24) = (char *)result + v3;
  uint64_t v8 = (vm_address_t *)v6[1];
  *(void *)(v7 + 8) = v8;
  *uint64_t v8 = v7;
  *(void *)vm_address_t v7 = v6;
  v6[1] = v7;
  *((void *)p + 11) = v7;
  unint64_t v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    vm_address_t v10 = *v6;
    do
      vm_address_t v10 = *(void *)v10;
    while (*(_DWORD *)(v10 + 20) > v9);
    *(void *)vm_address_t v7 = *v6;
    *(void *)(*v6 + 8) = v6[1];
    long long v11 = *(vm_address_t ***)(v10 + 8);
    v6[1] = (vm_address_t)v11;
    *long long v11 = v6;
    vm_address_t *v6 = v10;
    *(void *)(v10 + 8) = v6;
  }
  return result;
}

void *apr_pcalloc(apr_pool_t *a1, apr_size_t a2)
{
  apr_size_t v3 = apr_palloc(a1, a2);
  vm_address_t v4 = v3;
  if (v3) {
    bzero(v3, a2);
  }
  return v4;
}

void apr_pool_clear(apr_pool_t *p)
{
  for (uint64_t i = *((void *)p + 14); i; uint64_t i = *((void *)p + 14))
  {
    *((void *)p + 14) = *(void *)i;
    (*(void (**)(void))(i + 16))(*(void *)(i + 8));
  }
  *((void *)p + 14) = 0;
  while (1)
  {
    apr_size_t v3 = (apr_pool_t *)*((void *)p + 1);
    if (!v3) {
      break;
    }
    apr_pool_destroy(v3);
  }
  apr_abortfunc_t v5 = (uint64_t *)((char *)p + 32);
  uint64_t v4 = *((void *)p + 4);
  if (v4)
  {
    do
    {
      *apr_abortfunc_t v5 = *(void *)v4;
      (*(void (**)(void))(v4 + 16))(*(void *)(v4 + 8));
      uint64_t v4 = *v5;
    }
    while (*v5);
  }
  *apr_abortfunc_t v5 = 0;
  *((void *)p + 5) = 0;
  free_proc_chain(*((void *)p + 7));
  *((void *)p + 7) = 0;
  *((void *)p + 9) = 0;
  uint64_t v7 = *((void *)p + 12);
  uint64_t v6 = *((void *)p + 13);
  *((void *)p + 11) = v7;
  *(void *)(v7 + 24) = v6;
  if (*(void *)v7 != v7)
  {
    **(void **)(v7 + 8) = 0;
    uint64_t v8 = (unint64_t *)*((void *)p + 6);
    unint64_t v9 = *(unint64_t **)v7;
    unint64_t v10 = v8[3];
    if (v10) {
      pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
    }
    long long v11 = 0;
    unint64_t v12 = *v8;
    unint64_t v13 = v8[1];
    unint64_t v14 = v8[2];
    do
    {
      while (1)
      {
        while (1)
        {
          uint64_t v15 = v9;
          unint64_t v9 = (unint64_t *)*v9;
          unint64_t v16 = *((unsigned int *)v15 + 4);
          if (!v13 || v14 > v16) {
            break;
          }
          unint64_t *v15 = (unint64_t)v11;
          long long v11 = v15;
          if (!v9) {
            goto LABEL_30;
          }
        }
        if (v16 > 0x13) {
          break;
        }
        vm_address_t v17 = &v8[v16];
        unint64_t v18 = v17[5];
        unint64_t *v15 = v18;
        if (v12 < v16 && v18 == 0) {
          unint64_t v12 = v16;
        }
        v17[5] = (unint64_t)v15;
        if (v14 <= v16)
        {
          unint64_t v14 = 0;
          if (!v9) {
            goto LABEL_30;
          }
        }
        else
        {
          v14 += ~v16;
          if (!v9) {
            goto LABEL_30;
          }
        }
      }
      unint64_t *v15 = v8[5];
      void v8[5] = (unint64_t)v15;
      BOOL v20 = v14 > v16;
      v14 += ~v16;
      if (!v20) {
        unint64_t v14 = 0;
      }
    }
    while (v9);
LABEL_30:
    *uint64_t v8 = v12;
    v8[2] = v14;
    unint64_t v21 = v8[3];
    if (v21) {
      pthread_mutex_unlock((pthread_mutex_t *)(v21 + 8));
    }
    if (v11)
    {
      BOOL v22 = (unsigned int *)MEMORY[0x263EF8960];
      do
      {
        unint64_t v23 = (void *)*v11;
        MEMORY[0x253361B90](*v22, v11, ((*((_DWORD *)v11 + 4) << 12) + 4096));
        long long v11 = v23;
      }
      while (v23);
    }
    *(void *)uint64_t v7 = v7;
    *(void *)(v7 + 8) = v7;
  }
}

apr_status_t apr_pool_create_unmanaged_ex(apr_pool_t **newpool, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  *newpool = 0;
  if (!apr_pools_initialized) {
    return 20002;
  }
  uint64_t v6 = allocator;
  if (!allocator)
  {
    vm_address_t v7 = GTCoreAlloc((uint64_t)newpool, 0xC8uLL);
    if (!v7) {
      goto LABEL_10;
    }
    uint64_t v6 = (apr_allocator_t *)v7;
    *(void *)(v7 + 192) = 0;
    *(_OWORD *)(v7 + 160) = 0u;
    *(_OWORD *)(v7 + 176) = 0u;
    *(_OWORD *)(v7 + 128) = 0u;
    *(_OWORD *)(v7 + 144) = 0u;
    *(_OWORD *)(v7 + 96) = 0u;
    *(_OWORD *)(v7 + 112) = 0u;
    *(_OWORD *)(v7 + 64) = 0u;
    *(_OWORD *)(v7 + 80) = 0u;
    *(_OWORD *)(v7 + 32) = 0u;
    *(_OWORD *)(v7 + 48) = 0u;
    *(_OWORD *)vm_address_t v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
  }
  uint64_t v8 = (void *)allocator_alloc((uint64_t)v6, 0x1FD8uLL);
  if (v8)
  {
    *uint64_t v8 = v8;
    v8[1] = v8;
    uint64_t v9 = v8[3];
    v8[3] = v9 + 120;
    *(void *)(v9 + 96) = v8;
    *(void *)(v9 + 104) = v9 + 120;
    *(void *)(v9 + 112) = 0;
    *(void *)(v9 + 48) = v6;
    *(void *)(v9 + 56) = 0;
    *(_OWORD *)uint64_t v9 = 0u;
    *(_OWORD *)(v9 + 16) = 0u;
    *(_OWORD *)(v9 + 32) = 0u;
    *(void *)(v9 + 80) = 0;
    *(void *)(v9 + 88) = v8;
    *(void *)(v9 + 64) = abort_fn;
    *(void *)(v9 + 72) = 0;
    if (!allocator) {
      *((void *)v6 + 4) = v9;
    }
    apr_status_t v10 = 0;
    *newpool = (apr_pool_t *)v9;
    return v10;
  }
LABEL_10:
  apr_status_t v10 = 12;
  if (abort_fn) {
    ((void (*)(uint64_t))abort_fn)(12);
  }
  return v10;
}

char *__cdecl apr_pvsprintf(apr_pool_t *p, const char *fmt, va_list ap)
{
  uint64_t v51 = 0;
  unint64_t v52 = 0;
  uint64_t v49 = *((void *)p + 11);
  uint64_t v50 = p;
  uint64_t v6 = *(char **)(v49 + 32);
  v48.curpos = *(char **)(v49 + 24);
  v48.endpos = v6 - 1;
  if (v48.curpos == v6 && psprintf_flush((uint64_t)&v48) == -1
    || apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))psprintf_flush, &v48, fmt, ap) == -1)
  {
    BOOL v31 = (void (*)(void))*((void *)p + 8);
    if (v31) {
      v31(12);
    }
    if ((_BYTE)v51)
    {
      unsigned int v32 = (unint64_t *)v49;
      *(void *)uint64_t v49 = v52;
      unsigned int v33 = (unint64_t *)*((void *)p + 6);
      unint64_t v34 = v33[3];
      if (v34) {
        pthread_mutex_lock((pthread_mutex_t *)(v34 + 8));
      }
      uint64_t v35 = 0;
      unint64_t v36 = *v33;
      unint64_t v37 = v33[1];
      unint64_t v38 = v33[2];
      do
      {
        while (1)
        {
          while (1)
          {
            int v39 = v32;
            unsigned int v32 = (unint64_t *)*v32;
            unint64_t v40 = *((unsigned int *)v39 + 4);
            if (!v37 || v38 > v40) {
              break;
            }
            *int v39 = (unint64_t)v35;
            uint64_t v35 = v39;
            if (!v32) {
              goto LABEL_60;
            }
          }
          if (v40 > 0x13) {
            break;
          }
          int v41 = &v33[v40];
          unint64_t v42 = v41[5];
          *int v39 = v42;
          if (v36 < v40 && v42 == 0) {
            unint64_t v36 = v40;
          }
          v41[5] = (unint64_t)v39;
          if (v38 <= v40)
          {
            unint64_t v38 = 0;
            if (!v32) {
              goto LABEL_60;
            }
          }
          else
          {
            v38 += ~v40;
            if (!v32) {
              goto LABEL_60;
            }
          }
        }
        *int v39 = v33[5];
        v33[5] = (unint64_t)v39;
        BOOL v21 = v38 > v40;
        v38 += ~v40;
        if (!v21) {
          unint64_t v38 = 0;
        }
      }
      while (v32);
LABEL_60:
      *unsigned int v33 = v36;
      v33[2] = v38;
      unint64_t v44 = v33[3];
      if (v44) {
        pthread_mutex_unlock((pthread_mutex_t *)(v44 + 8));
      }
      if (v35)
      {
        uint64_t v45 = (unsigned int *)MEMORY[0x263EF8960];
        do
        {
          uint64_t v46 = (void *)*v35;
          MEMORY[0x253361B90](*v45, v35, ((*((_DWORD *)v35 + 4) << 12) + 4096));
          uint64_t v35 = v46;
        }
        while (v46);
      }
    }
    return 0;
  }
  else
  {
    vm_address_t v7 = v48.curpos++;
    char *v7 = 0;
    uint64_t v8 = *(char **)(v49 + 24);
    *(void *)(v49 + 24) = &v8[(v48.curpos - v8 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = v52;
    if (v52)
    {
      apr_status_t v10 = (unint64_t *)*((void *)p + 6);
      unint64_t v11 = v10[3];
      if (v11) {
        pthread_mutex_lock((pthread_mutex_t *)(v11 + 8));
      }
      unint64_t v12 = 0;
      unint64_t v13 = *v10;
      unint64_t v14 = v10[1];
      unint64_t v15 = v10[2];
      do
      {
        while (1)
        {
          while (1)
          {
            unint64_t v16 = v9;
            uint64_t v9 = (unint64_t *)*v9;
            unint64_t v17 = *((unsigned int *)v16 + 4);
            if (!v14 || v15 > v17) {
              break;
            }
            unint64_t *v16 = (unint64_t)v12;
            unint64_t v12 = v16;
            if (!v9) {
              goto LABEL_26;
            }
          }
          if (v17 > 0x13) {
            break;
          }
          unint64_t v18 = &v10[v17];
          unint64_t v19 = v18[5];
          unint64_t *v16 = v19;
          if (v13 < v17 && v19 == 0) {
            unint64_t v13 = v17;
          }
          v18[5] = (unint64_t)v16;
          if (v15 <= v17)
          {
            unint64_t v15 = 0;
            if (!v9) {
              goto LABEL_26;
            }
          }
          else
          {
            v15 += ~v17;
            if (!v9) {
              goto LABEL_26;
            }
          }
        }
        unint64_t *v16 = v10[5];
        void v10[5] = (unint64_t)v16;
        BOOL v21 = v15 > v17;
        v15 += ~v17;
        if (!v21) {
          unint64_t v15 = 0;
        }
      }
      while (v9);
LABEL_26:
      *apr_status_t v10 = v13;
      v10[2] = v15;
      unint64_t v22 = v10[3];
      if (v22) {
        pthread_mutex_unlock((pthread_mutex_t *)(v22 + 8));
      }
      if (v12)
      {
        unint64_t v23 = (unsigned int *)MEMORY[0x263EF8960];
        do
        {
          vm_address_t v24 = (void *)*v12;
          MEMORY[0x253361B90](*v23, v12, ((*((_DWORD *)v12 + 4) << 12) + 4096));
          unint64_t v12 = v24;
        }
        while (v24);
      }
    }
    if ((_BYTE)v51)
    {
      vm_address_t v25 = (uint64_t *)*((void *)p + 11);
      uint64_t v26 = (void *)v49;
      *(_DWORD *)(v49 + 20) = 0;
      uint64_t v27 = (void *)v25[1];
      v26[1] = v27;
      void *v27 = v26;
      *uint64_t v26 = v25;
      v25[1] = (uint64_t)v26;
      *((void *)p + 11) = v26;
      unint64_t v28 = (v25[4] - v25[3]) >> 12;
      *((_DWORD *)v25 + 5) = v28;
      if (v28 < *(unsigned int *)(*v25 + 20))
      {
        unint64_t v29 = (uint64_t *)*v25;
        do
          unint64_t v29 = (uint64_t *)*v29;
        while (*((_DWORD *)v29 + 5) > v28);
        *uint64_t v26 = *v25;
        *(void *)(*v25 + 8) = v25[1];
        unint64_t v30 = (void *)v29[1];
        v25[1] = (uint64_t)v30;
        *unint64_t v30 = v25;
        *vm_address_t v25 = (uint64_t)v29;
        v29[1] = (uint64_t)v25;
      }
    }
  }
  return v8;
}

uint64_t psprintf_flush(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 24);
  size_t v4 = *(void *)a1 - *(void *)(v3 + 24);
  if (2 * v4 <= 0x20) {
    unint64_t v5 = 32;
  }
  else {
    unint64_t v5 = 2 * v4;
  }
  if (!*(unsigned char *)(a1 + 32))
  {
    vm_address_t v6 = *(void *)v3;
    if (v5 <= *(void *)(*(void *)v3 + 32) - *(void *)(*(void *)v3 + 24))
    {
      **(void **)(v6 + 8) = *(void *)v6;
      *(void *)(*(void *)v6 + 8) = *(void *)(v6 + 8);
      apr_status_t v10 = *(vm_address_t **)(v3 + 8);
      *(void *)(v6 + 8) = v10;
      *apr_status_t v10 = v6;
      *(void *)vm_address_t v6 = v3;
      *(void *)(v3 + 8) = v6;
      *(_DWORD *)(v6 + 20) = 0;
      *(void *)(v2 + 88) = v6;
      unint64_t v11 = (uint64_t)(*(void *)(v3 + 32) - *(void *)(v3 + 24)) >> 12;
      *(_DWORD *)(v3 + 20) = v11;
      if (v11 < *(unsigned int *)(*(void *)v3 + 20))
      {
        vm_address_t v12 = *(void *)v3;
        do
          vm_address_t v12 = *(void *)v12;
        while (*(_DWORD *)(v12 + 20) > v11);
        *(void *)vm_address_t v6 = *(void *)v3;
        *(void *)(*(void *)v3 + 8) = *(void *)(v3 + 8);
        unint64_t v13 = *(void **)(v12 + 8);
        *(void *)(v3 + 8) = v13;
        void *v13 = v3;
        *(void *)uint64_t v3 = v12;
        *(void *)(v12 + 8) = v3;
        vm_address_t v6 = *(void *)(v2 + 88);
      }
      goto LABEL_10;
    }
  }
  vm_address_t v7 = allocator_alloc(*(void *)(v2 + 48), v5);
  if (v7)
  {
    vm_address_t v6 = v7;
    if (*(unsigned char *)(a1 + 32))
    {
      *(void *)uint64_t v3 = *(void *)(a1 + 40);
      *(void *)(a1 + 40) = v3;
    }
    *(unsigned char *)(a1 + 32) = 1;
LABEL_10:
    memcpy(*(void **)(v6 + 24), *(const void **)(v3 + 24), v4);
    uint64_t result = 0;
    *(void *)(a1 + 16) = v6;
    uint64_t v9 = *(void *)(v6 + 32) - 1;
    *(void *)a1 = *(void *)(v6 + 24) + v4;
    *(void *)(a1 + 8) = v9;
    return result;
  }
  return 0xFFFFFFFFLL;
}

char *apr_psprintf(apr_pool_t *p, const char *fmt, ...)
{
  va_start(va, fmt);
  return apr_pvsprintf(p, fmt, va);
}

void apr_pool_abort_set(apr_abortfunc_t abortfunc, apr_pool_t *pool)
{
  *((void *)pool + 8) = abortfunc;
}

apr_abortfunc_t apr_pool_abort_get(apr_pool_t *pool)
{
  return (apr_abortfunc_t)*((void *)pool + 8);
}

apr_pool_t *__cdecl apr_pool_parent_get(apr_pool_t *pool)
{
  return *(apr_pool_t **)pool;
}

apr_allocator_t *__cdecl apr_pool_allocator_get(apr_pool_t *pool)
{
  return (apr_allocator_t *)*((void *)pool + 6);
}

int apr_pool_is_ancestor(apr_pool_t *a, apr_pool_t *b)
{
  if (a)
  {
    if (!b) {
      return 0;
    }
    while (b != a)
    {
      CATransform3D b = *(apr_pool_t **)b;
      if (!b) {
        return 0;
      }
    }
  }
  return 1;
}

apr_status_t apr_pool_userdata_set(const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  uint64_t v8 = (apr_hash_t *)*((void *)pool + 9);
  if (!v8)
  {
    uint64_t v8 = apr_hash_make(pool);
    *((void *)pool + 9) = v8;
  }
  uint64_t v9 = *find_entry((uint64_t)v8, key, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (v9 && *(void *)(v9 + 32))
  {
    apr_status_t v10 = (apr_hash_t *)*((void *)pool + 9);
    unint64_t v11 = key;
  }
  else
  {
    apr_size_t v12 = strlen(key) + 1;
    unint64_t v13 = apr_palloc(pool, v12);
    memcpy(v13, key, v12);
    apr_status_t v10 = (apr_hash_t *)*((void *)pool + 9);
    unint64_t v11 = (const char *)v13;
  }
  apr_hash_set(v10, v11, -1, data);
  if (cleanup)
  {
    unint64_t v14 = (void *)*((void *)pool + 5);
    if (v14) {
      *((void *)pool + 5) = *v14;
    }
    else {
      unint64_t v14 = apr_palloc(pool, 0x20uLL);
    }
    v14[2] = cleanup;
    v14[3] = cleanup;
    void *v14 = *((void *)pool + 4);
    v14[1] = data;
    *((void *)pool + 4) = v14;
  }
  return 0;
}

void apr_pool_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v8 = (void *)*((void *)p + 5);
    if (v8) {
      *((void *)p + 5) = *v8;
    }
    else {
      uint64_t v8 = apr_palloc(p, 0x20uLL);
    }
    v8[2] = plain_cleanup;
    v8[3] = child_cleanup;
    *uint64_t v8 = *((void *)p + 4);
    v8[1] = data;
    *((void *)p + 4) = v8;
  }
}

apr_status_t apr_pool_userdata_setn(const void *data, const char *key, apr_status_t (__cdecl *cleanup)(void *), apr_pool_t *pool)
{
  uint64_t v8 = (apr_hash_t *)*((void *)pool + 9);
  if (!v8)
  {
    uint64_t v8 = apr_hash_make(pool);
    *((void *)pool + 9) = v8;
  }
  apr_hash_set(v8, key, -1, data);
  if (cleanup)
  {
    uint64_t v9 = (void *)*((void *)pool + 5);
    if (v9) {
      *((void *)pool + 5) = *v9;
    }
    else {
      uint64_t v9 = apr_palloc(pool, 0x20uLL);
    }
    v9[2] = cleanup;
    v9[3] = cleanup;
    *uint64_t v9 = *((void *)pool + 4);
    v9[1] = data;
    *((void *)pool + 4) = v9;
  }
  return 0;
}

apr_status_t apr_pool_userdata_get(void **data, const char *key, apr_pool_t *pool)
{
  uint64_t v4 = *((void *)pool + 9);
  if (v4)
  {
    unint64_t v5 = (void *)*find_entry(v4, key, 0xFFFFFFFFFFFFFFFFLL, 0);
    if (v5) {
      unint64_t v5 = (void *)v5[4];
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  *datCATransform3D a = v5;
  return 0;
}

void apr_pool_pre_cleanup_register(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *))
{
  if (p)
  {
    vm_address_t v6 = (void *)*((void *)p + 5);
    if (v6) {
      *((void *)p + 5) = *v6;
    }
    else {
      vm_address_t v6 = apr_palloc(p, 0x20uLL);
    }
    v6[2] = plain_cleanup;
    void *v6 = *((void *)p + 14);
    v6[1] = data;
    *((void *)p + 14) = v6;
  }
}

void apr_pool_cleanup_kill(apr_pool_t *p, const void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  if (p)
  {
    uint64_t v3 = (void *)((char *)p + 32);
    uint64_t v4 = (uint64_t *)*((void *)p + 4);
    if (v4)
    {
      while (1)
      {
        unint64_t v5 = v4;
        if ((const void *)v4[1] == data && (apr_status_t (__cdecl *)(void *))v4[2] == cleanup) {
          break;
        }
        uint64_t v4 = (uint64_t *)*v4;
        uint64_t v3 = v5;
        if (!*v5) {
          goto LABEL_8;
        }
      }
      void *v3 = *v4;
      uint64_t *v4 = *((void *)p + 5);
      *((void *)p + 5) = v4;
    }
LABEL_8:
    vm_address_t v6 = (void *)((char *)p + 112);
    vm_address_t v7 = (uint64_t *)*((void *)p + 14);
    if (v7)
    {
      while (1)
      {
        uint64_t v8 = v7;
        if ((const void *)v7[1] == data && (apr_status_t (__cdecl *)(void *))v7[2] == cleanup) {
          break;
        }
        vm_address_t v7 = (uint64_t *)*v7;
        vm_address_t v6 = v8;
        if (!*v8) {
          return;
        }
      }
      void *v6 = *v7;
      uint64_t *v7 = *((void *)p + 5);
      *((void *)p + 5) = v7;
    }
  }
}

void apr_pool_child_cleanup_set(apr_pool_t *p, const void *data, apr_status_t (__cdecl *plain_cleanup)(void *), apr_status_t (__cdecl *child_cleanup)(void *))
{
  if (p)
  {
    uint64_t v4 = (uint64_t **)*((void *)p + 4);
    if (v4)
    {
      while (v4[1] != data || v4[2] != (uint64_t *)plain_cleanup)
      {
        uint64_t v4 = (uint64_t **)*v4;
        if (!v4) {
          return;
        }
      }
      v4[3] = (uint64_t *)child_cleanup;
    }
  }
}

apr_status_t apr_pool_cleanup_run(apr_pool_t *p, void *data, apr_status_t (__cdecl *cleanup)(void *))
{
  apr_pool_cleanup_kill(p, data, cleanup);

  return ((uint64_t (*)(void *))cleanup)(data);
}

void apr_pool_cleanup_for_exec(void)
{
}

uint64_t cleanup_pool_for_exec(uint64_t result)
{
  uint64_t v1 = result;
  for (uint64_t i = *(void *)(result + 32); i; uint64_t i = *(void *)(v1 + 32))
  {
    *(void *)(v1 + 32) = *(void *)i;
    uint64_t result = (*(uint64_t (**)(void))(i + 24))(*(void *)(i + 8));
  }
  for (uint64_t j = *(void *)(v1 + 8); j; uint64_t j = *(void *)(j + 16))
    uint64_t result = cleanup_pool_for_exec(j);
  return result;
}

apr_status_t apr_pool_cleanup_null(void *data)
{
  return 0;
}

void apr_pool_note_subprocess(apr_pool_t *a, apr_proc_t *proc, apr_kill_conditions_e how)
{
  vm_address_t v6 = apr_palloc(a, 0x18uLL);
  *(void *)vm_address_t v6 = proc;
  v6[2] = how;
  *((void *)v6 + 2) = *((void *)a + 7);
  *((void *)a + 7) = v6;
}

void *__cdecl apr_pcalloc_debug(apr_pool_t *p, apr_size_t size, const char *file_line)
{
  uint64_t v4 = apr_palloc(p, size);
  unint64_t v5 = v4;
  if (v4) {
    bzero(v4, size);
  }
  return v5;
}

apr_status_t apr_procattr_create(apr_procattr_t **new_attr, apr_pool_t *cont)
{
  uint64_t v4 = (char *)apr_palloc(cont, 0x88uLL);
  if (v4)
  {
    unint64_t v5 = v4;
    apr_status_t result = 0;
    *(_OWORD *)(v5 + 120) = 0u;
    *(_OWORD *)(v5 + 104) = 0u;
    *(_OWORD *)(v5 + 88) = 0u;
    *(_OWORD *)(v5 + 72) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    *new_attr = (apr_procattr_t *)v5;
    *(void *)unint64_t v5 = cont;
    vm_address_t v7 = *new_attr;
    *((_DWORD *)v7 + 16) = 1;
    *(void *)((char *)v7 + 116) = -1;
  }
  else
  {
    *new_attr = 0;
    return 12;
  }
  return result;
}

apr_status_t apr_procattr_io_set(apr_procattr_t *attr, apr_int32_t in, apr_int32_t out, apr_int32_t err)
{
  return 0;
}

apr_status_t apr_procattr_child_in_set(apr_procattr_t *attr, apr_file_t *child_in, apr_file_t *parent_in)
{
  return 0;
}

apr_status_t apr_procattr_child_out_set(apr_procattr_t *attr, apr_file_t *child_out, apr_file_t *parent_out)
{
  return 0;
}

apr_status_t apr_procattr_child_err_set(apr_procattr_t *attr, apr_file_t *child_err, apr_file_t *parent_err)
{
  return 0;
}

apr_status_t apr_procattr_dir_set(apr_procattr_t *attr, const char *dir)
{
  uint64_t v3 = apr_pstrdup(*(apr_pool_t **)attr, dir);
  *((void *)attr + 7) = v3;
  if (v3) {
    return 0;
  }
  else {
    return 12;
  }
}

apr_status_t apr_procattr_cmdtype_set(apr_procattr_t *attr, apr_cmdtype_e cmd)
{
  *((_DWORD *)attr + 16) = cmd;
  return 0;
}

apr_status_t apr_procattr_detach_set(apr_procattr_t *attr, apr_int32_t detach)
{
  *((_DWORD *)attr + 17) = detach;
  return 0;
}

apr_status_t apr_proc_fork(apr_proc_t *proc, apr_pool_t *cont)
{
  *(_OWORD *)&proc->pid = 0u;
  *(_OWORD *)&proc->out = 0u;
  pid_t v3 = fork();
  if (v3 < 0) {
    return *__error();
  }
  apr_status_t v4 = 70001;
  if (v3)
  {
    proc->pid = v3;
    return 70002;
  }
  else
  {
    proc->pid = getpid();
    apr_random_after_fork(proc);
  }
  return v4;
}

apr_status_t apr_procattr_child_errfn_set(apr_procattr_t *attr, apr_child_errfn_t *errfn)
{
  *((void *)attr + 13) = errfn;
  return 0;
}

apr_status_t apr_procattr_error_check_set(apr_procattr_t *attr, apr_int32_t chk)
{
  *((_DWORD *)attr + 28) = chk;
  return 0;
}

apr_status_t apr_procattr_addrspace_set(apr_procattr_t *attr, apr_int32_t addrspace)
{
  return 0;
}

apr_status_t apr_procattr_user_set(apr_procattr_t *attr, const char *username, const char *password)
{
  return 0;
}

apr_status_t apr_procattr_group_set(apr_procattr_t *attr, const char *groupname)
{
  return 0;
}

apr_status_t apr_proc_create(apr_proc_t *new_proc, const char *progname, const char *const *args, const char *const *env, apr_procattr_t *attr, apr_pool_t *pool)
{
  return 0;
}

apr_status_t apr_proc_wait_all_procs(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow, apr_pool_t *p)
{
  proc->pid = -1;
  return apr_proc_wait(proc, exitcode, exitwhy, waithow);
}

apr_status_t apr_proc_wait(apr_proc_t *proc, int *exitcode, apr_exit_why_e *exitwhy, apr_wait_how_e waithow)
{
  int v14 = 0;
  if (waithow) {
    int v7 = 3;
  }
  else {
    int v7 = 2;
  }
  while (1)
  {
    pid_t v8 = waitpid(proc->pid, &v14, v7);
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return *__error();
    }
  }
  pid_t v10 = v8;
  apr_status_t result = 70005;
  if (!v10) {
    return 70006;
  }
  proc->pid = v10;
  unsigned __int8 v11 = BYTE1(v14);
  int v12 = v14 & 0x7F;
  if (v12 == 127) {
    return 20014;
  }
  if ((v14 & 0x7F) != 0)
  {
    if (exitwhy)
    {
      if ((v14 & 0x80) != 0) {
        apr_exit_why_e v13 = APR_PROC_SIGNAL_CORE|APR_PROC_SIGNAL;
      }
      else {
        apr_exit_why_e v13 = APR_PROC_SIGNAL;
      }
      *exitwhy = v13;
    }
  }
  else
  {
    if (exitwhy) {
      *exitwhy = APR_PROC_EXIT;
    }
    int v12 = v11;
  }
  if (exitcode) {
    *exitcode = v12;
  }
  return result;
}

uint64_t apr_procattr_perms_set_register(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  pid_t v8 = apr_palloc(*(apr_pool_t **)a1, 0x20uLL);
  v8[3] = a3;
  *((_DWORD *)v8 + 4) = a4;
  *pid_t v8 = *(void *)(a1 + 128);
  v8[1] = a2;
  *(void *)(a1 + 128) = v8;
  return 0;
}

void apr_random_init(apr_random_t *g, apr_pool_t *p, apr_crypto_hash_t *pool_hash, apr_crypto_hash_t *key_hash, apr_crypto_hash_t *prng_hash)
{
  *(void *)g = p;
  *((void *)g + 1) = pool_hash;
  *((void *)g + 7) = key_hash;
  *((void *)g + 8) = prng_hash;
  *((_DWORD *)g + 4) = 32;
  int v7 = apr_palloc(p, 0x200uLL);
  *((void *)g + 3) = v7;
  uint64_t v8 = *((unsigned int *)g + 4);
  if (v8) {
    bzero(v7, 16 * v8);
  }
  *((void *)g + 4) = 0;
  *((void *)g + 5) = 2
                     * *(void *)(*((void *)g + 1) + 24)
                     * (((unint64_t)(2 * *(void *)(*((void *)g + 1) + 24) + 1023)
                       / *(void *)(*((void *)g + 1) + 24)) >> 1);
  *((void *)g + 6) = 32;
  apr_size_t v9 = *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24);
  pid_t v10 = apr_palloc(p, v9);
  unsigned __int8 v11 = v10;
  if (v10) {
    bzero(v10, v9);
  }
  *((void *)g + 9) = v11;
  apr_size_t v12 = *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24);
  apr_exit_why_e v13 = apr_palloc(p, v12);
  int v14 = v13;
  if (v13) {
    bzero(v13, v12);
  }
  *((void *)g + 10) = v14;
  *((void *)g + 11) = apr_palloc(p, *(void *)(*((void *)g + 8) + 24));
  *((void *)g + 12) = 0;
  *((_DWORD *)g + 28) = 0;
  *((void *)g + 13) = 0x14000000020;
  *((unsigned char *)g + 116) &= 0xFCu;
  *((void *)g + 15) = all_random;
  all_random = (uint64_t)g;
  unint64_t v15 = (void *)*((void *)p + 5);
  if (v15) {
    *((void *)p + 5) = *v15;
  }
  else {
    unint64_t v15 = apr_palloc(p, 0x20uLL);
  }
  v15[1] = g;
  v15[2] = random_cleanup;
  v15[3] = apr_pool_cleanup_null;
  void *v15 = *((void *)p + 4);
  *((void *)p + 4) = v15;
}

uint64_t random_cleanup(uint64_t a1)
{
  uint64_t v1 = all_random;
  if (all_random)
  {
    if (all_random == a1)
    {
      pid_t v3 = &all_random;
LABEL_7:
      uint64_t *v3 = *(void *)(a1 + 120);
    }
    else
    {
      while (1)
      {
        uint64_t v2 = v1;
        uint64_t v1 = *(void *)(v1 + 120);
        if (!v1) {
          break;
        }
        if (v1 == a1)
        {
          pid_t v3 = (uint64_t *)(v2 + 120);
          goto LABEL_7;
        }
      }
    }
  }
  return 0;
}

void apr_random_after_fork(apr_proc_t *proc)
{
  for (uint64_t i = all_random; i; uint64_t i = *(void *)(i + 120))
  {
    if ((*(unsigned char *)(i + 116) & 3) == 1) {
      uint64_t v2 = 80;
    }
    else {
      uint64_t v2 = 72;
    }
    uint64_t v3 = *(void *)(i + v2);
    mix_pid(i);
    if (v3 != *(void *)(i + 72)) {
      mix_pid(i);
    }
    --*(_DWORD *)(i + 36);
    *(void *)(i + 96) = 0;
  }
}

uint64_t mix_pid(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

apr_random_t *__cdecl apr_random_standard_new(apr_pool_t *p)
{
  return (apr_random_t *)apr_palloc(p, 0x80uLL);
}

void apr_random_add_entropy(apr_random_t *g, const void *entropy_, apr_size_t bytes)
{
  if (bytes)
  {
    uint64_t v6 = 0;
    for (i = 0; i < bytes; uint64_t v6 = ++i)
    {
      uint64_t v8 = *((unsigned int *)g + 8);
      uint64_t v9 = *((void *)g + 3) + 16 * v8;
      if (v8 + 1 == *((_DWORD *)g + 4)) {
        int v10 = 0;
      }
      else {
        int v10 = v8 + 1;
      }
      *((_DWORD *)g + 8) = v10;
      apr_size_t v12 = (unsigned int *)(v9 + 8);
      unsigned int v11 = *(_DWORD *)(v9 + 8);
      unsigned int v13 = v11 + 1;
      if (*(_DWORD *)(v9 + 12) >= v11 + 1)
      {
        int v14 = *(void **)v9;
      }
      else
      {
        int v14 = apr_palloc(*(apr_pool_t **)g, 2 * v13);
        memcpy(v14, *(const void **)v9, *v12);
        *(void *)uint64_t v9 = v14;
        unsigned int v11 = *v12;
        *(_DWORD *)(v9 + 12) = 2 * *v12 + 2;
        unsigned int v13 = v11 + 1;
      }
      char v15 = *((unsigned char *)entropy_ + v6);
      unsigned int *v12 = v13;
      *((unsigned char *)v14 + v11) = v15;
      unint64_t v16 = *v12;
      if (*((void *)g + 5) == v16)
      {
        if (v16 >= 2)
        {
          unint64_t v17 = 0;
          uint64_t v18 = *((void *)g + 1);
          do
          {
            (*(void (**)(void))v18)();
            (*(void (**)(void))(*((void *)g + 1) + 8))();
            (*(void (**)(void))(*((void *)g + 1) + 16))();
            uint64_t v18 = *((void *)g + 1);
            v17 += *(void *)(v18 + 24);
            unint64_t v19 = *v12;
          }
          while (v17 < v19 >> 1);
          unint64_t v16 = v19 >> 1;
        }
        else
        {
          LODWORD(v16) = v16 >> 1;
        }
        unsigned int *v12 = v16;
      }
    }
  }
  if (*((void *)g + 6) <= (unint64_t)*(unsigned int *)(*((void *)g + 3) + 8))
  {
    (**((void (***)(void))g + 7))();
    (*(void (**)(void))(*((void *)g + 7) + 8))();
    if (*((_DWORD *)g + 4))
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      do
      {
        if (v21 && ((*((_DWORD *)g + 9) >> (v21 - 1)) & 1) == 0) {
          break;
        }
        (*(void (**)(void))(*((void *)g + 7) + 8))();
        *(_DWORD *)(*((void *)g + 3) + v20 + 8) = 0;
        ++v21;
        v20 += 16;
      }
      while (v21 < *((unsigned int *)g + 4));
    }
    (*(void (**)(void))(*((void *)g + 7) + 16))();
    unsigned int v22 = *((_DWORD *)g + 9) + 1;
    *((_DWORD *)g + 9) = v22;
    char v23 = *((unsigned char *)g + 116);
    if ((v23 & 1) != 0 || v22 <= *((_DWORD *)g + 26))
    {
      char v24 = *((unsigned char *)g + 116);
      if ((v24 & 2) != 0) {
        return;
      }
    }
    else
    {
      char v24 = v23 | 1;
      *((unsigned char *)g + 116) = v23 | 1;
      if ((v23 & 2) == 0)
      {
        memcpy(*((void **)g + 10), *((const void **)g + 9), *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24));
        unsigned int v22 = *((_DWORD *)g + 9);
        *((_DWORD *)g + 28) = v22;
        char v24 = *((unsigned char *)g + 116);
      }
      if ((v24 & 2) != 0) {
        return;
      }
    }
    if (v22 > *((_DWORD *)g + 27) + *((_DWORD *)g + 28))
    {
      *((unsigned char *)g + 116) = v24 | 2;
      vm_address_t v25 = (void *)*((void *)g + 9);
      uint64_t v26 = (const void *)*((void *)g + 10);
      size_t v27 = *(void *)(*((void *)g + 7) + 24) + *(void *)(*((void *)g + 8) + 24);
      memcpy(v25, v26, v27);
    }
  }
}

apr_status_t apr_random_secure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((unsigned char *)g + 116) & 2) == 0) {
    return 20028;
  }
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void *apr_random_bytes(void *result, uint64_t a2, unint64_t a3)
{
  if (a3)
  {
    unint64_t v5 = result;
    unint64_t v6 = 0;
    size_t v7 = result[12];
    do
    {
      uint64_t v8 = v5[8];
      if (v7)
      {
        size_t v9 = *(void *)(v8 + 24);
      }
      else
      {
        (*(void (**)(void))v8)();
        (*(void (**)(void))(v5[8] + 8))();
        (*(void (**)(void))(v5[8] + 16))();
        (*(void (**)(void))v5[8])();
        (*(void (**)(void, void, void))(v5[8] + 8))(v5[8], v5[9], *(void *)(v5[8] + 24));
        (*(void (**)(void))(v5[8] + 16))();
        size_t v9 = *(void *)(v5[8] + 24);
        v5[12] = v9;
        size_t v7 = v9;
      }
      if (a3 - v6 >= v7) {
        size_t v10 = v7;
      }
      else {
        size_t v10 = a3 - v6;
      }
      apr_status_t result = memcpy((void *)(a2 + v6), (const void *)(v5[11] + v9 - v7), v10);
      size_t v7 = v5[12] - v10;
      v5[12] = v7;
      v6 += v10;
    }
    while (v6 < a3);
  }
  return result;
}

apr_status_t apr_random_insecure_bytes(apr_random_t *g, void *random, apr_size_t bytes)
{
  if ((*((unsigned char *)g + 116) & 1) == 0) {
    return 20028;
  }
  apr_random_bytes(g, (uint64_t)random, bytes);
  return 0;
}

void apr_random_barrier(apr_random_t *g)
{
  *((unsigned char *)g + 116) &= ~2u;
  *((_DWORD *)g + 28) = *((_DWORD *)g + 9);
}

apr_status_t apr_random_secure_ready(apr_random_t *r)
{
  if ((*((unsigned char *)r + 116) & 2) != 0) {
    return 0;
  }
  else {
    return 20028;
  }
}

apr_status_t apr_random_insecure_ready(apr_random_t *r)
{
  if (*((unsigned char *)r + 116)) {
    return 0;
  }
  else {
    return 20028;
  }
}

int apr_vformatter(int (__cdecl *flush_func)(apr_vformatter_buff_t *), apr_vformatter_buff_t *c, const char *fmt, va_list ap)
{
  apr_status_t v4 = fmt;
  unint64_t v5 = c;
  unint64_t v174 = 0;
  unsigned int v172 = 0;
  unint64_t v6 = 0;
  p_n_4 = 0;
  int v8 = 0;
  uint64_t v190 = *MEMORY[0x263EF8340];
  size_t v180 = 0;
  va_list v181 = ap;
  unsigned int v178 = 0;
  curpos = c->curpos;
  endpos = c->endpos;
LABEL_2:
  LOBYTE(v10) = *v4;
  while (1)
  {
LABEL_3:
    if (v10 != 37)
    {
      unint64_t v55 = endpos;
      if (!(_BYTE)v10)
      {
        v5->curpos = curpos;
        return v8;
      }
      if (curpos)
      {
        if (curpos >= endpos)
        {
          v5->curpos = curpos;
          if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t))flush_func)(v5, 10)) {
            return -1;
          }
          curpos = v5->curpos;
          unint64_t v55 = v5->endpos;
          LOBYTE(v10) = *v4;
        }
        *curpos++ = v10;
      }
      ++v8;
LABEL_426:
      endpos = v55;
      ++v4;
      goto LABEL_2;
    }
    int v12 = v4[1];
    unsigned int v11 = (char *)(v4 + 1);
    uint64_t v13 = v12;
    if (v12 < 0)
    {
      if (__maskrune(v13, 0x1000uLL))
      {
LABEL_6:
        int v14 = 0;
        int v15 = 0;
        int v16 = 0;
        uint64_t v17 = 1;
        int v18 = 32;
        int v176 = 0;
        int v177 = 1;
        goto LABEL_41;
      }
    }
    else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x1000) != 0)
    {
      goto LABEL_6;
    }
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v19 = 1;
    int v18 = 32;
    while (1)
    {
      unsigned int v20 = *v11;
      if (v20 <= 0x2A) {
        break;
      }
      switch(v20)
      {
        case '0':
          int v18 = 48;
          break;
        case '-':
          int v19 = 0;
          break;
        case '+':
          int v15 = 1;
          break;
        default:
          goto LABEL_21;
      }
LABEL_20:
      ++v11;
    }
    if (v20 == 32)
    {
      int v14 = 1;
      goto LABEL_20;
    }
    if (v20 == 35)
    {
      int v16 = 1;
      goto LABEL_20;
    }
LABEL_21:
    int v177 = v19;
    if (v20 - 48 <= 9)
    {
      unint64_t v6 = *v11 - 48;
      unsigned int v21 = *++v11;
      unsigned int v20 = v21;
      if (v21 - 48 <= 9)
      {
        do
        {
          unint64_t v6 = 10 * v6 + (char)v20 - 48;
          unsigned int v22 = *++v11;
          unsigned int v20 = v22;
        }
        while (v22 - 48 < 0xA);
      }
      goto LABEL_31;
    }
    if (v20 == 42)
    {
      char v23 = (unsigned int *)v181;
      v181 += 8;
      uint64_t v24 = *v23;
      unsigned int v25 = *++v11;
      unsigned int v20 = v25;
      int v26 = v19;
      if ((int)v24 < 0) {
        int v26 = 0;
      }
      int v177 = v26;
      unint64_t v6 = (int)v24 >= 0 ? v24 : -(int)v24;
LABEL_31:
      int v176 = 1;
    }
    else
    {
      int v176 = 0;
    }
    if (v20 == 46)
    {
      int v27 = v11[1];
      if ((v27 - 48) > 9)
      {
        uint64_t v17 = 0;
        if ((char)v27 == 42)
        {
          unint64_t v40 = v181;
          v181 += 8;
          v11 += 2;
          unint64_t v174 = *v40 & ~((int)*v40 >> 31);
        }
        else
        {
          unint64_t v174 = 0;
          ++v11;
        }
      }
      else
      {
        int v29 = v11[2];
        v11 += 2;
        char v28 = v29;
        unint64_t v174 = (char)v27 - 48;
        if ((v29 - 48) <= 9)
        {
          uint64_t v30 = (char)v27 - 48;
          do
          {
            int v31 = *++v11;
            uint64_t v30 = 10 * v30 + v28 - 48;
            char v28 = v31;
          }
          while ((v31 - 48) < 0xA);
          unint64_t v174 = v30;
        }
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 1;
    }
LABEL_41:
    int v32 = *v11;
    BOOL v33 = v32 == 108;
    if (v32 == 108) {
      unint64_t v34 = (unsigned __int8 *)(v11 + 1);
    }
    else {
      unint64_t v34 = (unsigned __int8 *)v11;
    }
    if (v32 == 113)
    {
      BOOL v33 = 1;
      unint64_t v34 = (unsigned __int8 *)(v11 + 1);
    }
    BOOL v35 = v32 == 104;
    if (v32 == 104) {
      BOOL v33 = 0;
    }
    LODWORD(v36) = v32 == 104;
    apr_status_t v4 = v35 ? v11 + 1 : (const char *)v34;
    int v37 = *v4;
    if (v37 > 70) {
      break;
    }
    LOBYTE(v10) = *v4;
    if (*v4)
    {
      if (v37 == 37)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        LOBYTE(v87) = 37;
LABEL_140:
        v179[0] = v87;
        uint64_t v86 = 1;
      }
      else
      {
        if (v37 == 69)
        {
LABEL_86:
          uint64_t v59 = (double *)v181;
          v181 += 8;
          long double v60 = *v59;
          int v41 = v177;
          if (fabs(*v59) == INFINITY)
          {
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            size_t v180 = 3;
            p_n_4 = "inf";
            unint64_t v42 = flush_func;
            goto LABEL_384;
          }
          int v61 = *(unsigned __int8 *)v4;
          if (v17) {
            int v62 = 6;
          }
          else {
            int v62 = v174;
          }
          int __n = 0;
          int v169 = v61;
          unsigned int v171 = v5;
          if (v61 == 102)
          {
            int v63 = v62;
            int v64 = 0;
          }
          else
          {
            int v63 = v62 + 1;
            int v64 = 1;
          }
          apr_cvt(v63, &__n, &v178, v64, __s, v60);
          char v104 = __s[0];
          if (__s[0] < 0)
          {
            if (__maskrune(__s[0], 0x100uLL)) {
              goto LABEL_174;
            }
          }
          else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * __s[0] + 60) & 0x100) != 0)
          {
LABEL_174:
            size_t v180 = strlen(__s);
            p_n_4 = __n_5;
            __memcpy_chk();
            unsigned int v178 = 0;
            int v41 = v177;
            goto LABEL_175;
          }
          int v122 = v169;
          if (v169 == 102)
          {
            if (__n < 1)
            {
              __n_5[0] = 48;
              if (v62 < 1)
              {
                if (v16)
                {
                  char __n_6 = 46;
                  uint64_t v124 = __s;
                  p_n_6 = __n_7;
                }
                else
                {
                  uint64_t v124 = __s;
                  p_n_6 = &__n_6;
                }
              }
              else
              {
                char __n_6 = 46;
                p_n_6 = __n_7;
                if (__n < 0)
                {
                  uint64_t v144 = ~__n;
                  memset(__n_7, 48, v144 + 1);
                  int v122 = 102;
                  p_n_6 = &__n_5[v144 + 3];
                }
                int __n = 1;
                uint64_t v124 = __s;
              }
            }
            else
            {
              uint64_t v123 = __n;
              memcpy(__n_5, __s, __n);
              uint64_t v124 = &__s[v123];
              p_n_6 = &__n_5[v123];
              int __n = -1;
              if (v16 || v62 > 0)
              {
                char *p_n_6 = 46;
                p_n_6 = &__n_7[(v123 - 1)];
              }
              int v122 = 102;
            }
          }
          else
          {
            __n_5[0] = v104;
            if (v16 || (p_n_6 = &__n_6, uint64_t v124 = &__s[1], v62 >= 1))
            {
              char __n_6 = 46;
              p_n_6 = __n_7;
              uint64_t v124 = &__s[1];
            }
          }
          char v153 = *v124;
          if (*v124)
          {
            long long v154 = (unsigned __int8 *)(v124 + 1);
            do
            {
              *p_n_6++ = v153;
              int v155 = *v154++;
              char v153 = v155;
            }
            while (v155);
          }
          p_n_4 = __n_5;
          if (v122 != 102)
          {
            char *p_n_6 = v122;
            int v156 = __n;
            int v157 = --__n;
            if (__n)
            {
              if (v157 >= 0) {
                unsigned int v158 = v157;
              }
              else {
                unsigned int v158 = -v157;
              }
              uint64_t v159 = -1;
              float v160 = v188;
              do
              {
                uint64_t v161 = v159;
                *--float v160 = v158 % 0xA + 48;
                --v159;
                BOOL v79 = v158 > 9;
                v158 /= 0xAu;
              }
              while (v79);
              if (v156 <= 0) {
                char v162 = 45;
              }
              else {
                char v162 = 43;
              }
              unsigned int v163 = p_n_6 + 2;
              p_n_6[1] = v162;
              unsigned int v164 = (unsigned char *)(v188 - v160);
              if (v164)
              {
                if (v164 == (unsigned char *)1)
                {
                  unsigned int v163 = p_n_6 + 3;
                  p_n_6[2] = 48;
                }
                do
                {
                  *v163++ = v188[v161];
                  BOOL v68 = __CFADD__(v161++, 1);
                }
                while (!v68);
              }
            }
            else
            {
              *(_WORD *)(p_n_6 + 1) = 12331;
              unsigned int v163 = p_n_6 + 4;
              p_n_6[3] = 48;
            }
            p_n_6 = v163;
          }
          size_t v180 = p_n_6 - __n_5;
          int v41 = v177;
          if (v178)
          {
            int v103 = 45;
LABEL_379:
            unint64_t v42 = flush_func;
            goto LABEL_380;
          }
LABEL_175:
          if (v15) {
            int v103 = 43;
          }
          else {
            int v103 = 32 * (v14 != 0);
          }
          goto LABEL_379;
        }
LABEL_137:
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        v179[0] = 37;
        v179[1] = *v4;
        uint64_t v86 = 2;
      }
      size_t v180 = v86;
      p_n_4 = v179;
LABEL_142:
      int v18 = 32;
LABEL_297:
      unint64_t v42 = flush_func;
LABEL_313:
      int v41 = v177;
      goto LABEL_384;
    }
  }
  switch(*v4)
  {
    case 'c':
      LOBYTE(v36) = 0;
      LOBYTE(v16) = 0;
      uint64_t v88 = v181;
      v181 += 8;
      int v87 = *v88;
      goto LABEL_140;
    case 'd':
    case 'i':
      if (v33)
      {
        uint64_t v69 = (unint64_t *)v181;
        v181 += 8;
        uint64_t v70 = v17;
        uint64_t v71 = conv_10_quad(*v69, 0, &v178, (uint64_t)&v187[3], &v180);
        uint64_t v17 = v70;
        p_n_4 = (char *)v71;
        if (v70) {
          goto LABEL_169;
        }
LABEL_165:
        unint64_t v102 = 511;
        if (v174 + 1 < 0x200) {
          unint64_t v102 = v174;
        }
        for (; v180 < v102; ++v180)
          *--p_n_4 = 48;
        goto LABEL_169;
      }
      uint64_t v98 = (unsigned int *)v181;
      v181 += 8;
      unsigned int v99 = *v98;
      if (v36) {
        unsigned int v100 = (__int16)v99;
      }
      else {
        unsigned int v100 = v99;
      }
      unsigned int v101 = v100 >> 31;
      if ((v100 & 0x80000000) != 0) {
        unsigned int v100 = -v100;
      }
      unsigned int v178 = v101;
      p_n_4 = &v187[3];
      do
      {
        *--p_n_4 = v100 % 0xA + 48;
        BOOL v79 = v100 > 9;
        v100 /= 0xAu;
      }
      while (v79);
      size_t v180 = &v187[3] - p_n_4;
      if ((v17 & 1) == 0) {
        goto LABEL_165;
      }
LABEL_169:
      unsigned int v171 = v5;
      if (v178)
      {
        int v103 = 45;
      }
      else if (v15)
      {
        int v103 = 43;
      }
      else
      {
        int v103 = 32 * (v14 != 0);
      }
      unint64_t v42 = flush_func;
LABEL_348:
      int v41 = v177;
      break;
    case 'e':
    case 'f':
      goto LABEL_86;
    case 'g':
      goto LABEL_104;
    case 'h':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'q':
    case 'r':
    case 't':
    case 'v':
    case 'w':
      goto LABEL_137;
    case 'n':
      if (v33)
      {
        LOBYTE(v36) = 0;
        uint64_t v89 = (void **)v181;
        v181 += 8;
        **uint64_t v89 = v8;
      }
      else if (v36)
      {
        LOBYTE(v36) = 0;
        uint64_t v126 = (_WORD **)v181;
        v181 += 8;
        **uint64_t v126 = v8;
      }
      else
      {
        float v142 = (_DWORD **)v181;
        v181 += 8;
        **float v142 = v8;
      }
      LOBYTE(v16) = 1;
      goto LABEL_297;
    case 'o':
      if (v33)
      {
        uint64_t v90 = (unint64_t *)v181;
        v181 += 8;
        unint64_t v91 = *v90;
        float v92 = "0123456789abcdef";
        if (*v4 == 88) {
          float v92 = "0123456789ABCDEF";
        }
        if (HIDWORD(v91))
        {
          p_n_4 = &v187[3];
          unint64_t v42 = flush_func;
          do
          {
            *--p_n_4 = v92[v91 & 7];
            BOOL v68 = v91 >= 8;
            v91 >>= 3;
          }
          while (v68);
        }
        else
        {
          p_n_4 = &v187[3];
          unint64_t v42 = flush_func;
          do
          {
            *--p_n_4 = v92[v91 & 7];
            BOOL v68 = v91 >= 8;
            LODWORD(v91) = v91 >> 3;
          }
          while (v68);
        }
      }
      else
      {
        uint64_t v127 = (unsigned int *)v181;
        v181 += 8;
        unsigned int v128 = *v127;
        if (v36) {
          unsigned int v128 = (unsigned __int16)v128;
        }
        uint64_t v129 = "0123456789abcdef";
        if (*v4 == 88) {
          uint64_t v129 = "0123456789ABCDEF";
        }
        unsigned int v172 = v128;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v129[v128 & 7];
          BOOL v79 = v128 > 7;
          v128 >>= 3;
        }
        while (v79);
        unint64_t v42 = flush_func;
      }
      int v41 = v177;
      size_t v180 = &v187[3] - p_n_4;
      if ((v17 & 1) == 0)
      {
        unint64_t v141 = 511;
        if (v174 + 1 < 0x200) {
          unint64_t v141 = v174;
        }
        if (&v187[3] - p_n_4 >= v141)
        {
          int v41 = v177;
        }
        else
        {
          int v41 = v177;
          do
          {
            *--p_n_4 = 48;
            ++v180;
          }
          while (v180 < v141);
        }
      }
      if (!v16)
      {
        LOBYTE(v36) = 0;
        goto LABEL_384;
      }
      if (*p_n_4 == 48) {
        goto LABEL_301;
      }
      LOBYTE(v36) = 0;
      LOBYTE(v16) = 0;
      *--p_n_4 = 48;
      size_t v136 = v180 + 1;
      goto LABEL_304;
    case 'p':
      int v39 = *++v4;
      int v38 = v39;
      int v10 = v39;
      if (!v39) {
        goto LABEL_3;
      }
      if (v38 <= 83)
      {
        int v41 = v177;
        unint64_t v42 = flush_func;
        fmt = (const char *)246;
        switch(v38)
        {
          case 'A':
            unsigned int v43 = (unsigned int **)v181;
            v181 += 8;
            unint64_t v36 = *v43;
            if (!v36) {
              goto LABEL_211;
            }
            unsigned int v44 = bswap32(*v36);
            unsigned int v45 = v44;
            uint64_t v46 = v187;
            uint64_t v47 = &v187[2];
            apr_vformatter_buff_t v48 = &v187[4];
            do
            {
              uint64_t v49 = v47;
              uint64_t v50 = v46;
              *(v48 - 2) = v45 % 0xA + 48;
              --v48;
              --v47;
              --v46;
              BOOL v79 = v45 > 9;
              v45 /= 0xAu;
            }
            while (v79);
            *(v48 - 2) = 46;
            unsigned int v51 = BYTE1(v44);
            do
            {
              unint64_t v52 = v50;
              *(v49 - 2) = v51 % 0xA + 48;
              --v49;
              --v50;
              BOOL v79 = v51 > 9;
              v51 /= 0xAu;
            }
            while (v79);
            *(v49 - 2) = 46;
            unsigned int v53 = BYTE2(v44);
            do
            {
              *(v52 - 2) = v53 % 0xA + 48;
              --v52;
              BOOL v79 = v53 > 9;
              v53 /= 0xAu;
            }
            while (v79);
            *(v52 - 2) = 46;
            p_n_4 = v52 - 2;
            unsigned int v54 = HIBYTE(v44);
            do
            {
              *--p_n_4 = v54 % 0xA + 48;
              BOOL v79 = v54 > 9;
              v54 /= 0xAu;
            }
            while (v79);
            goto LABEL_307;
          case 'B':
          case 'F':
            goto LABEL_191;
          case 'C':
          case 'D':
          case 'E':
          case 'G':
          case 'H':
            goto LABEL_202;
          case 'I':
            uint64_t v114 = (unsigned int **)v181;
            v181 += 8;
            unint64_t v36 = *v114;
            if (!v36) {
              goto LABEL_211;
            }
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            p_n_4 = 0;
            size_t v115 = v180;
            unint64_t v116 = v174;
            if (v174 >= v180) {
              int v117 = 1;
            }
            else {
              int v117 = v17;
            }
            goto LABEL_207;
          default:
            unint64_t v42 = flush_func;
            if (v38 != 83) {
              goto LABEL_202;
            }
LABEL_191:
            if (v10 == 66)
            {
              uint64_t v108 = (unsigned int **)v181;
              v181 += 8;
              uint64_t v109 = *v108;
              if (v109)
              {
                apr_off_t v110 = *v109;
                goto LABEL_197;
              }
            }
            else
            {
              uint64_t v111 = (apr_off_t **)v181;
              v181 += 8;
              uint64_t v112 = *v111;
              if (v112)
              {
                apr_off_t v110 = *v112;
                goto LABEL_197;
              }
            }
            apr_off_t v110 = 0;
LABEL_197:
            p_n_4 = __s;
            apr_strfsize(v110, __s);
            size_t v113 = strlen(__s);
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            size_t v180 = v113;
            int v18 = 32;
            break;
        }
        goto LABEL_313;
      }
      int v41 = v177;
      if (v38 <= 111)
      {
        if (v38 == 84)
        {
          uint64_t v118 = (unsigned int **)v181;
          v181 += 8;
          unint64_t v36 = *v118;
          unint64_t v42 = flush_func;
          if (!v36)
          {
LABEL_211:
            LOBYTE(v16) = 0;
            size_t v180 = 6;
            int v18 = 32;
            p_n_4 = "(null)";
            goto LABEL_384;
          }
          int v119 = v17;
          p_n_4 = (char *)conv_10_quad(*(void *)v36, 1, __s, (uint64_t)&v187[3], &v180);
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          size_t v115 = v180;
          unint64_t v116 = v174;
          if (v174 >= v180) {
            int v117 = 1;
          }
          else {
            int v117 = v119;
          }
LABEL_207:
          BOOL v35 = v117 == 0;
          int v41 = v177;
          if (v35) {
            size_t v115 = v116;
          }
          size_t v180 = v115;
        }
        else
        {
          unint64_t v42 = flush_func;
          if (v38 != 109) {
            goto LABEL_202;
          }
          uint64_t v56 = (apr_status_t **)v181;
          v181 += 8;
          unint64_t v57 = *v56;
          if (v57)
          {
            p_n_4 = &__n_4;
            apr_strerror(*v57, &__n_4, 0x1FFuLL);
            size_t v58 = strlen(&__n_4);
            int v41 = v177;
          }
          else
          {
            size_t v58 = 6;
            p_n_4 = "(null)";
          }
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          size_t v180 = v58;
        }
LABEL_352:
        int v18 = 32;
        goto LABEL_384;
      }
      if (v38 == 116)
      {
        uint64_t v120 = (unsigned int **)v181;
        v181 += 8;
        unint64_t v36 = *v120;
        unint64_t v42 = flush_func;
        if (!v36)
        {
          LOBYTE(v16) = 0;
          size_t v180 = 6;
          int v18 = 32;
          p_n_4 = "(null)";
          goto LABEL_313;
        }
        unint64_t v121 = *(void *)v36;
        if (HIDWORD(v121))
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v121 & 0xF];
            BOOL v79 = v121 > 0xF;
            v121 >>= 4;
          }
          while (v79);
        }
        else
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v121 & 0xF];
            BOOL v68 = v121 >= 0x10;
            LODWORD(v121) = v121 >> 4;
          }
          while (v68);
        }
LABEL_307:
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        uint64_t v137 = (unsigned char *)(&v187[3] - p_n_4);
        if (v174 >= &v187[3] - p_n_4) {
          int v143 = 1;
        }
        else {
          int v143 = v17;
        }
        if (!v143) {
          uint64_t v137 = (unsigned char *)v174;
        }
      }
      else
      {
        unint64_t v42 = flush_func;
        if (v38 != 112)
        {
LABEL_202:
          LOBYTE(v36) = 0;
          LOBYTE(v16) = 0;
          size_t v180 = 8;
          v181 += 8;
          p_n_4 = "bogus %p";
          goto LABEL_384;
        }
        uint64_t v84 = (unint64_t *)v181;
        v181 += 8;
        unint64_t v85 = *v84;
        if (HIDWORD(v85))
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v85 & 0xF];
            BOOL v79 = v85 > 0xF;
            v85 >>= 4;
          }
          while (v79);
        }
        else
        {
          p_n_4 = &v187[3];
          do
          {
            *--p_n_4 = conv_p2_low_digits[v85 & 0xF];
            BOOL v68 = v85 >= 0x10;
            LODWORD(v85) = v85 >> 4;
          }
          while (v68);
        }
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        uint64_t v137 = (unsigned char *)(&v187[3] - p_n_4);
      }
      size_t v180 = (size_t)v137;
      int v18 = 32;
      goto LABEL_313;
    case 's':
      uint64_t v93 = (const char **)v181;
      v181 += 8;
      p_n_4 = (char *)*v93;
      if (!*v93)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        size_t v180 = 6;
        int v18 = 32;
        p_n_4 = "(null)";
        goto LABEL_297;
      }
      if (v17)
      {
        size_t v94 = strlen(*v93);
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        size_t v180 = v94;
        goto LABEL_142;
      }
      size_t v180 = 0;
      unint64_t v42 = flush_func;
      LOBYTE(v36) = v174;
      int v41 = v177;
      if (v174)
      {
        uint64_t v140 = 0;
        while (p_n_4[v140])
        {
          size_t v180 = ++v140;
          int v18 = 32;
          if (v174 == v140)
          {
LABEL_301:
            LOBYTE(v36) = 0;
            LOBYTE(v16) = 0;
            goto LABEL_384;
          }
        }
        LOBYTE(v36) = 0;
      }
      else
      {
        unint64_t v174 = 0;
      }
      LOBYTE(v16) = 0;
      goto LABEL_352;
    case 'u':
      if (v33)
      {
        float v95 = (unint64_t *)v181;
        v181 += 8;
        uint64_t v96 = v17;
        uint64_t v97 = conv_10_quad(*v95, 1, &v178, (uint64_t)&v187[3], &v180);
        uint64_t v17 = v96;
        p_n_4 = (char *)v97;
      }
      else
      {
        uint64_t v130 = (unsigned int *)v181;
        v181 += 8;
        unsigned int v131 = *v130;
        if (v36) {
          unsigned int v132 = (unsigned __int16)v131;
        }
        else {
          unsigned int v132 = v131;
        }
        unsigned int v178 = 0;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v132 % 0xA + 48;
          BOOL v79 = v132 > 9;
          v132 /= 0xAu;
        }
        while (v79);
        size_t v180 = &v187[3] - p_n_4;
      }
      unint64_t v42 = flush_func;
      if (v17)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
      }
      else
      {
        unint64_t v133 = 511;
        if (v174 + 1 < 0x200) {
          unint64_t v133 = v174;
        }
        for (; v180 < v133; ++v180)
          *--p_n_4 = 48;
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
      }
      goto LABEL_313;
    case 'x':
      goto LABEL_94;
    default:
      if (v37 == 71)
      {
LABEL_104:
        unsigned int v171 = v5;
        uint64_t v72 = v174;
        if (v174 <= 1) {
          uint64_t v72 = 1;
        }
        if (v17) {
          uint64_t v73 = 6;
        }
        else {
          uint64_t v73 = v72;
        }
        uint64_t v74 = v181;
        v181 += 8;
        long double v75 = *(double *)v74;
        *(_DWORD *)&v187[3] = 0;
        int __n = 0;
        apr_cvt(v73, &__n, &v187[3], 1, __s, v75);
        uint64_t v76 = __n_5;
        if (*(_DWORD *)&v187[3])
        {
          __n_5[0] = 45;
          uint64_t v76 = &__n_6;
        }
        unint64_t v174 = v73;
        if ((int)v73 >= 2)
        {
          uint64_t v73 = v73;
          do
          {
            uint64_t v77 = v73 - 1;
            if (__s[(v73 - 1)] != 48) {
              goto LABEL_116;
            }
            --v73;
          }
          while ((unint64_t)(v77 + 1) > 2);
          LODWORD(v73) = 1;
        }
LABEL_116:
        int v78 = __n;
        BOOL v79 = __n < 0 || __n - (int)v73 <= 4;
        int v80 = !v79;
        if (__n >= -3 && v80 == 0)
        {
          if (__n <= 0)
          {
            if (__s[0] != 48) {
              *v76++ = 46;
            }
            if (v78 < 0)
            {
              do
              {
                int __n = v78 + 1;
                *v76++ = 48;
                int v78 = __n;
              }
              while (__n < 0);
            }
            else
            {
              int v78 = 0;
            }
          }
          if ((int)v73 >= 1)
          {
            uint64_t v145 = 0;
            do
            {
              *uint64_t v76 = __s[v145];
              if (v145 + 1 == __n)
              {
                v76[1] = 46;
                v76 += 2;
              }
              else
              {
                ++v76;
              }
              ++v145;
            }
            while ((v73 - 1) + 1 != v145);
            int v78 = __n;
          }
          if ((int)v73 < v78)
          {
            do
            {
              float v146 = v76;
              LODWORD(v73) = v73 + 1;
              *v76++ = 48;
            }
            while ((int)v73 < __n);
            *uint64_t v76 = 46;
            uint64_t v76 = v146 + 2;
          }
        }
        else
        {
          --__n;
          *uint64_t v76 = __s[0];
          uint64_t v82 = v76 + 2;
          v76[1] = 46;
          if ((int)v73 > 1)
          {
            int v170 = v78;
            memcpy(v82, &__s[1], (v73 - 1));
            int v78 = v170;
            uint64_t v82 = &v76[(v73 - 2) + 3];
          }
          *uint64_t v82 = 101;
          if (v78 < 1)
          {
            int __n = 1 - v78;
            char v83 = 45;
          }
          else
          {
            char v83 = 43;
          }
          v82[1] = v83;
          int v138 = __n;
          if (__n < 100)
          {
            float v139 = v82 + 2;
          }
          else
          {
            float v139 = v82 + 3;
            v82[2] = __n / 0x64u + 48;
            int v138 = __n;
          }
          if (v138 >= 10)
          {
            *v139++ = ((103 * (v138 % 0x64u)) >> 10) | 0x30;
            int v138 = __n;
          }
          *float v139 = v138 % 10 + 48;
          uint64_t v76 = v139 + 1;
        }
        float v147 = v76 - 1;
        if (*(v76 - 1) != 46 || v16 != 0) {
          float v147 = v76;
        }
        *float v147 = 0;
        int v149 = 32 * (v14 != 0);
        if (v15) {
          int v149 = 43;
        }
        if (__n_5[0] == 45) {
          int v103 = 45;
        }
        else {
          int v103 = v149;
        }
        if (__n_5[0] == 45) {
          p_n_4 = &__n_6;
        }
        else {
          p_n_4 = __n_5;
        }
        size_t v150 = strlen(p_n_4);
        size_t v180 = v150;
        if (v16)
        {
          size_t v151 = v150;
          if (!strchr(p_n_4, 46))
          {
            size_t v180 = v151 + 1;
            *(_WORD *)&p_n_4[v151] = 46;
          }
        }
        unint64_t v42 = flush_func;
        if (*v4 == 71)
        {
          float v152 = strchr(p_n_4, 101);
          if (v152) {
            *float v152 = 69;
          }
        }
        goto LABEL_348;
      }
      if (v37 != 88) {
        goto LABEL_137;
      }
LABEL_94:
      if (v33)
      {
        uint64_t v65 = (unint64_t *)v181;
        v181 += 8;
        unint64_t v66 = *v65;
        uint64_t v67 = "0123456789abcdef";
        if (*v4 == 88) {
          uint64_t v67 = "0123456789ABCDEF";
        }
        if (HIDWORD(v66))
        {
          p_n_4 = &v187[3];
          unint64_t v42 = flush_func;
          do
          {
            *--p_n_4 = v67[v66 & 0xF];
            BOOL v68 = v66 >= 0x10;
            v66 >>= 4;
          }
          while (v68);
        }
        else
        {
          p_n_4 = &v187[3];
          unint64_t v42 = flush_func;
          do
          {
            *--p_n_4 = v67[v66 & 0xF];
            BOOL v68 = v66 >= 0x10;
            LODWORD(v66) = v66 >> 4;
          }
          while (v68);
        }
      }
      else
      {
        uint64_t v105 = (unsigned int *)v181;
        v181 += 8;
        unsigned int v106 = *v105;
        if (v36) {
          unsigned int v106 = (unsigned __int16)v106;
        }
        uint64_t v107 = "0123456789abcdef";
        if (*v4 == 88) {
          uint64_t v107 = "0123456789ABCDEF";
        }
        unsigned int v172 = v106;
        p_n_4 = &v187[3];
        do
        {
          *--p_n_4 = v107[v106 & 0xF];
          BOOL v79 = v106 > 0xF;
          v106 >>= 4;
        }
        while (v79);
        unint64_t v42 = flush_func;
      }
      size_t v180 = &v187[3] - p_n_4;
      if (v17) {
        goto LABEL_259;
      }
      unint64_t v134 = 511;
      if (v174 + 1 < 0x200) {
        unint64_t v134 = v174;
      }
      if (&v187[3] - p_n_4 >= v134)
      {
LABEL_259:
        int v41 = v177;
      }
      else
      {
        int v41 = v177;
        do
        {
          *--p_n_4 = 48;
          ++v180;
        }
        while (v180 < v134);
      }
      LOBYTE(v36) = 0;
      if (v16 && v172)
      {
        LOBYTE(v36) = 0;
        LOBYTE(v16) = 0;
        char v135 = *v4;
        *(p_n_4 - 2) = 48;
        p_n_4 -= 2;
        p_n_4[1] = v135;
        size_t v136 = v180 + 2;
LABEL_304:
        size_t v180 = v136;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
      goto LABEL_384;
  }
LABEL_380:
  LOBYTE(v16) = 0;
  LOBYTE(v36) = v103 != 0;
  if (v103 && p_n_4 != "(null)")
  {
    LOBYTE(v16) = 0;
    *--p_n_4 = v103;
    ++v180;
    LOBYTE(v36) = 1;
  }
  unint64_t v5 = v171;
LABEL_384:
  size_t v165 = v180;
  if (!v176)
  {
    unint64_t v55 = endpos;
LABEL_405:
    if (v165) {
      char v167 = v16;
    }
    else {
      char v167 = 1;
    }
    if ((v167 & 1) == 0)
    {
      v8 += v165;
      do
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
            {
              return -1;
            }
            curpos = v5->curpos;
            unint64_t v55 = v5->endpos;
          }
          *curpos++ = *p_n_4;
        }
        ++p_n_4;
        --v165;
      }
      while (v165);
      size_t v165 = v180;
    }
    if (v176 && !v177)
    {
      while (v6 > v165)
      {
        if (curpos)
        {
          if (curpos >= v55)
          {
            v5->curpos = curpos;
            if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
            {
              return -1;
            }
            curpos = v5->curpos;
            unint64_t v55 = v5->endpos;
          }
          *curpos++ = v18;
          size_t v165 = v180;
        }
        ++v8;
        --v6;
      }
    }
    goto LABEL_426;
  }
  BOOL v35 = v41 == 1;
  unint64_t v55 = endpos;
  if (!v35 || v6 <= v180) {
    goto LABEL_405;
  }
  char v166 = v36 ^ 1;
  if (v18 != 48) {
    char v166 = 1;
  }
  if (v166)
  {
    do
    {
LABEL_397:
      if (curpos)
      {
        if (curpos >= v55)
        {
          v5->curpos = curpos;
          if (((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
          {
            return -1;
          }
          curpos = v5->curpos;
          unint64_t v55 = v5->endpos;
        }
        *curpos++ = v18;
        size_t v165 = v180;
      }
      ++v8;
      --v6;
    }
    while (v6 > v165);
    goto LABEL_405;
  }
  if (!curpos) {
    goto LABEL_396;
  }
  if (curpos < endpos) {
    goto LABEL_395;
  }
  v5->curpos = curpos;
  if (!((unsigned int (*)(apr_vformatter_buff_t *, uint64_t, const char *, uint64_t))v42)(v5, 10, fmt, v17))
  {
    curpos = v5->curpos;
    unint64_t v55 = v5->endpos;
LABEL_395:
    *curpos++ = *p_n_4;
    size_t v165 = v180;
LABEL_396:
    ++v8;
    ++p_n_4;
    size_t v180 = --v165;
    --v6;
    goto LABEL_397;
  }
  return -1;
}

uint64_t conv_10_quad(unint64_t a1, int a2, _DWORD *a3, uint64_t a4, void *a5)
{
  if ((HIDWORD(a1) || !a2) && (a1 != (int)a1 || a2))
  {
    if ((a1 & 0x8000000000000000) == 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = -(uint64_t)a1;
    }
    if (a2) {
      int v11 = 0;
    }
    else {
      int v11 = a1 >> 63;
    }
    if (a2) {
      unint64_t v12 = a1;
    }
    else {
      unint64_t v12 = v10;
    }
    *a3 = v11;
    uint64_t result = a4;
    do
    {
      *(unsigned char *)--uint64_t result = v12 % 0xA + 48;
      BOOL v13 = v12 > 9;
      v12 /= 0xAuLL;
    }
    while (v13);
  }
  else
  {
    if ((a1 & 0x80000000) == 0) {
      int v5 = a1;
    }
    else {
      int v5 = -(int)a1;
    }
    if (a2) {
      int v6 = 0;
    }
    else {
      int v6 = (a1 >> 31) & 1;
    }
    if (a2) {
      unsigned int v7 = a1;
    }
    else {
      unsigned int v7 = v5;
    }
    *a3 = v6;
    uint64_t result = a4;
    do
    {
      *(unsigned char *)--uint64_t result = v7 % 0xA + 48;
      BOOL v9 = v7 >= 0xA;
      v7 /= 0xAu;
    }
    while (v9);
  }
  *a5 = a4 - result;
  return result;
}

char *apr_cvt(int a1, int *a2, _DWORD *a3, int a4, char *a5, long double a6)
{
  if (a1 >= 78) {
    int v9 = 78;
  }
  else {
    int v9 = a1;
  }
  *a3 = 0;
  if (a6 < 0.0)
  {
    *a3 = 1;
    a6 = -a6;
  }
  double v31 = 0.0;
  double __y = 0.0;
  double v10 = modf(a6, &__y);
  double v11 = v10;
  double v12 = __y;
  if (__y == 0.0)
  {
    if (v10 > 0.0)
    {
      int v13 = 1;
      do
      {
        double v21 = v11;
        double v11 = v11 * 10.0;
        --v13;
      }
      while (v11 < 1.0);
      unint64_t v19 = 0;
      double v31 = v11;
      double v11 = v21;
      goto LABEL_20;
    }
    int v13 = 0;
  }
  else
  {
    int v13 = 0;
    uint64_t v14 = 80;
    uint64_t v15 = 1;
    do
    {
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      double v18 = modf(v12 / 10.0, &__y);
      ++v13;
      uint64_t v14 = v16 - 1;
      a5[v16 - 1] = (int)((v18 + 0.03) * 10.0) + 48;
      if (v16 == 1) {
        break;
      }
      double v12 = __y;
      uint64_t v15 = v17 + 1;
    }
    while (__y != 0.0);
    double v31 = v18;
    if (v16 <= 80)
    {
      unint64_t v19 = 81 - v16;
      unsigned int v20 = a5;
      do
      {
        *unsigned int v20 = v20[v14];
        ++v20;
        --v17;
      }
      while (v17);
      goto LABEL_20;
    }
  }
  unint64_t v19 = 0;
LABEL_20:
  if (a4) {
    int v22 = 0;
  }
  else {
    int v22 = v13;
  }
  uint64_t v23 = v22 + (uint64_t)v9;
  if (v23 < 0)
  {
    *a2 = -v9;
    int v27 = a5;
  }
  else
  {
    *a2 = v13;
    if ((uint64_t)v19 <= v23 && v19 <= 0x4F)
    {
      do
      {
        double v11 = modf(v11 * 10.0, &v31);
        a5[v19] = (int)v31 + 48;
        if ((uint64_t)v19 >= v23) {
          break;
        }
      }
      while (v19++ < 0x4F);
    }
    if (v23 >= 80)
    {
      int v27 = a5 + 79;
    }
    else
    {
      unsigned int v25 = &a5[v23];
      int v26 = (char)(a5[v23] + 5);
      a5[v23] += 5;
      if (v26 < 58)
      {
        int v27 = &a5[v23];
      }
      else
      {
        int v27 = &a5[v23];
        do
        {
          *unsigned int v25 = 48;
          if (v25 <= a5)
          {
            *unsigned int v25 = 49;
            ++*a2;
            if (!a4)
            {
              if (v27 > a5) {
                char *v27 = 48;
              }
              ++v27;
            }
            char v29 = *v25;
          }
          else
          {
            char v28 = *--v25;
            char v29 = v28 + 1;
            *unsigned int v25 = v28 + 1;
          }
        }
        while (v29 > 57);
      }
    }
  }
  char *v27 = 0;
  return a5;
}

int apr_snprintf(char *buf, apr_size_t len, const char *format, ...)
{
  va_start(va, format);
  apr_status_t v4 = &buf[len - 1];
  if (len) {
    int v5 = buf;
  }
  else {
    int v5 = 0;
  }
  if (!len) {
    apr_status_t v4 = 0;
  }
  c.curpos = v5;
  c.endpos = v4;
  va_copy(v8, va);
  int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &c, format, va);
  if (len) {
    *c.curpos = 0;
  }
  if (result == -1) {
    return len - 1;
  }
  return result;
}

uint64_t snprintf_flush()
{
  return 0xFFFFFFFFLL;
}

int apr_vsnprintf(char *buf, apr_size_t len, const char *format, va_list ap)
{
  int v4 = len;
  if (len)
  {
    v6.curpos = buf;
    v6.endpos = &buf[len - 1];
    int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
    *v6.curpos = 0;
  }
  else
  {
    v6.curpos = 0;
    v6.endpos = 0;
    int result = apr_vformatter((int (__cdecl *)(apr_vformatter_buff_t *))snprintf_flush, &v6, format, ap);
  }
  if (result == -1) {
    return v4 - 1;
  }
  return result;
}

char *__cdecl apr_pstrdup(apr_pool_t *p, const char *s)
{
  if (!s) {
    return 0;
  }
  apr_size_t v4 = strlen(s) + 1;
  int v5 = apr_palloc(p, v4);
  memcpy(v5, s, v4);
  return (char *)v5;
}

void *__cdecl apr_pmemdup(apr_pool_t *p, const void *m, apr_size_t n)
{
  if (!m) {
    return 0;
  }
  int v5 = apr_palloc(p, n);
  memcpy(v5, m, n);
  return v5;
}

char *__cdecl apr_pstrndup(apr_pool_t *p, const char *s, apr_size_t n)
{
  if (!s) {
    return 0;
  }
  size_t v3 = n;
  apr_vformatter_buff_t v6 = memchr((void *)s, 0, n);
  if (v6) {
    size_t v3 = v6 - s;
  }
  unsigned int v7 = apr_palloc(p, v3 + 1);
  memcpy(v7, s, v3);
  *((unsigned char *)v7 + v3) = 0;
  return (char *)v7;
}

char *__cdecl apr_pstrmemdup(apr_pool_t *p, const char *s, apr_size_t n)
{
  if (!s) {
    return 0;
  }
  int v5 = apr_palloc(p, n + 1);
  memcpy(v5, s, n);
  *((unsigned char *)v5 + n) = 0;
  return (char *)v5;
}

char *apr_pstrcat(apr_pool_t *p, ...)
{
  va_start(va, p);
  __s = va_arg(va, char *);
  uint64_t v19 = *MEMORY[0x263EF8340];
  memset(v18, 0, sizeof(v18));
  va_copy(v16, va);
  uint64_t v2 = __s;
  if (__s)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    int v5 = __s;
    do
    {
      size_t v6 = strlen(v5);
      if (v4 <= 5) {
        *((void *)v18 + v4++) = v6;
      }
      v3 += v6;
      unsigned int v7 = va_arg(v16, const char *);
      int v5 = v7;
    }
    while (v7);
    apr_size_t v8 = v3 + 1;
  }
  else
  {
    apr_size_t v8 = 1;
  }
  int v9 = (char *)apr_palloc(p, v8);
  double v10 = v9;
  va_copy(v17, va);
  double v11 = v9;
  if (__s)
  {
    int v12 = 0;
    double v11 = v9;
    do
    {
      if (v12 > 5) {
        size_t v13 = strlen(v2);
      }
      else {
        size_t v13 = *((void *)v18 + v12++);
      }
      memcpy(v11, v2, v13);
      v11 += v13;
      uint64_t v14 = (const char **)v17;
      v17 += 8;
      uint64_t v2 = *v14;
    }
    while (*v14);
  }
  *double v11 = 0;
  return v10;
}

char *__cdecl apr_pstrcatv(apr_pool_t *p, const iovec *vec, apr_size_t nvec, apr_size_t *nbytes)
{
  apr_size_t v4 = nvec;
  int v5 = vec;
  apr_size_t v6 = 0;
  if (nvec)
  {
    p_iov_len = &vec->iov_len;
    apr_size_t v8 = nvec;
    do
    {
      size_t v9 = *p_iov_len;
      p_iov_len += 2;
      v6 += v9;
      --v8;
    }
    while (v8);
  }
  if (nbytes) {
    *nbytes = v6;
  }
  double v10 = (char *)apr_palloc(p, v6 + 1);
  double v11 = v10;
  int v12 = v10;
  if (v4)
  {
    int v12 = v10;
    do
    {
      memcpy(v12, v5->iov_base, v5->iov_len);
      v12 += v5->iov_len;
      ++v5;
      --v4;
    }
    while (v4);
  }
  char *v12 = 0;
  return v11;
}

apr_status_t apr_strtoff(apr_off_t *offset, const char *buf, char **end, int base)
{
  *__error() = 0;
  *offset = strtol(buf, end, base);
  return *__error();
}

apr_int64_t apr_strtoi64(const char *buf, char **end, int base)
{
  *__error() = 0;

  return strtol(buf, end, base);
}

apr_int64_t apr_atoi64(const char *buf)
{
  *__error() = 0;

  return strtol(buf, 0, 10);
}

char *__cdecl apr_itoa(apr_pool_t *p, int n)
{
  uint64_t v3 = apr_palloc(p, 0xEuLL);
  if (n >= 0) {
    unsigned int v4 = n;
  }
  else {
    unsigned int v4 = -n;
  }
  v3[13] = 0;
  int v5 = v3 + 14;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAu;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_ltoa(apr_pool_t *p, uint64_t n)
{
  uint64_t v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0) {
    unint64_t v4 = n;
  }
  else {
    unint64_t v4 = -n;
  }
  v3[25] = 0;
  int v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAuLL;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_off_t_toa(apr_pool_t *p, apr_off_t n)
{
  uint64_t v3 = apr_palloc(p, 0x1AuLL);
  if (n >= 0) {
    unint64_t v4 = n;
  }
  else {
    unint64_t v4 = -n;
  }
  v3[25] = 0;
  int v5 = v3 + 26;
  do
  {
    *(v5 - 2) = (v4 % 0xA) | 0x30;
    int result = v5 - 2;
    --v5;
    BOOL v7 = v4 > 9;
    v4 /= 0xAuLL;
  }
  while (v7);
  if (n < 0)
  {
    *(v5 - 2) = 45;
    return v5 - 2;
  }
  return result;
}

char *__cdecl apr_strfsize(apr_off_t size, char *buf)
{
  if (size < 0)
  {
    unint64_t v4 = "  - ";
LABEL_14:
    *(_DWORD *)buf = *(_DWORD *)v4;
    uint8_t buf[4] = v4[4];
    return buf;
  }
  if ((unint64_t)size >= 0x3CD)
  {
    int v5 = "";
    do
    {
      __int16 v6 = size;
      size = (unint64_t)size >> 10;
      ++v5;
    }
    while ((unint64_t)size > 0x3CC);
    unsigned int v7 = v6 & 0x3FF;
    if ((unint64_t)size < 9 || size == 9 && v7 <= 0x3CC) {
      int v3 = apr_snprintf(buf, 5uLL, "%d.%d%c");
    }
    else {
      int v3 = apr_snprintf(buf, 5uLL, "%3d%c");
    }
  }
  else
  {
    int v3 = apr_snprintf(buf, 5uLL, "%3d ");
  }
  if (v3 < 0)
  {
    unint64_t v4 = "****";
    goto LABEL_14;
  }
  return buf;
}

apr_status_t apr_proc_kill(apr_proc_t *proc, int sig)
{
  if (kill(proc->pid, sig) == -1) {
    return *__error();
  }
  else {
    return 0;
  }
}

apr_sigfunc_t *__cdecl apr_signal(int signo, apr_sigfunc_t *func)
{
  v3.__sigaction_u.__sa_handler = 0;
  *(void *)&v3.sa_mask = 0;
  v4.__sigaction_u.__sa_handler = func;
  *(void *)&v4.sa_mask = 0;
  if (sigaction(signo, &v4, &v3) < 0) {
    return (apr_sigfunc_t *)-1;
  }
  else {
    return v3.__sigaction_u.__sa_handler;
  }
}

const char *__cdecl apr_signal_description_get(int signum)
{
  if (signum < 0) {
    return "unknown signal (number)";
  }
  else {
    return *(const char **)(MEMORY[0x263EF8AA8] + 8 * signum);
  }
}

apr_status_t apr_signal_thread(int (__cdecl *signal_handler)(int))
{
  sigset_t v4 = -1074077689;
  do
  {
    int v3 = 0;
    sigwait(&v4, &v3);
  }
  while (((unsigned int (*)(void))signal_handler)(v3) != 1);
  return 0;
}

apr_status_t apr_setup_signal_thread(void)
{
  sigset_t v1 = -1073749753;
  return pthread_sigmask(3, &v1, 0);
}

apr_status_t apr_signal_block(int signum)
{
  sigset_t v1 = 1 << (signum - 1);
  if (signum > 32) {
    sigset_t v1 = 0;
  }
  sigset_t v3 = v1;
  return pthread_sigmask(1, &v3, 0);
}

apr_status_t apr_signal_unblock(int signum)
{
  sigset_t v1 = 1 << (signum - 1);
  if (signum > 32) {
    sigset_t v1 = 0;
  }
  sigset_t v3 = v1;
  return pthread_sigmask(2, &v3, 0);
}

apr_status_t apr_thread_mutex_create(apr_thread_mutex_t **mutex, unsigned int flags, apr_pool_t *pool)
{
  char v4 = flags;
  uint64_t v12 = *MEMORY[0x263EF8340];
  __int16 v6 = (char *)apr_palloc(pool, 0x48uLL);
  unsigned int v7 = v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 8) = 0u;
  }
  *(void *)__int16 v6 = pool;
  if (v4)
  {
    v11.__sig = 0;
    *(void *)v11.__opaque = 0;
    apr_status_t v8 = pthread_mutexattr_init(&v11);
    if (v8) {
      return v8;
    }
    int v9 = pthread_mutexattr_settype(&v11, 2);
    if (v9)
    {
      apr_status_t v8 = v9;
      pthread_mutexattr_destroy(&v11);
      return v8;
    }
    apr_status_t v8 = pthread_mutex_init((pthread_mutex_t *)(v7 + 8), &v11);
    pthread_mutexattr_destroy(&v11);
    if (v8) {
      return v8;
    }
    goto LABEL_5;
  }
  apr_status_t v8 = pthread_mutex_init((pthread_mutex_t *)(v6 + 8), 0);
  if (!v8)
  {
LABEL_5:
    apr_pool_cleanup_register(*(apr_pool_t **)v7, v7, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup, apr_pool_cleanup_null);
    apr_thread_mutex_t *mutex = (apr_thread_mutex_t *)v7;
  }
  return v8;
}

uint64_t thread_mutex_cleanup(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

apr_status_t apr_thread_mutex_lock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_trylock(apr_thread_mutex_t *mutex)
{
  apr_status_t result = pthread_mutex_trylock((pthread_mutex_t *)((char *)mutex + 8));
  if (result == 16) {
    return 70025;
  }
  return result;
}

apr_status_t apr_thread_mutex_unlock(apr_thread_mutex_t *mutex)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)mutex + 8));
}

apr_status_t apr_thread_mutex_destroy(apr_thread_mutex_t *mutex)
{
  apr_pool_cleanup_kill(*(apr_pool_t **)mutex, mutex, (apr_status_t (__cdecl *)(void *))thread_mutex_cleanup);

  return thread_mutex_cleanup((uint64_t)mutex);
}

apr_pool_t *__cdecl apr_thread_mutex_pool_get(const apr_thread_mutex_t *thethread_mutex)
{
  return *(apr_pool_t **)thethread_mutex;
}

apr_status_t apr_time_ansi_put(apr_time_t *result, time_t input)
{
  char *result = 1000000 * input;
  return 0;
}

apr_time_t apr_time_now(void)
{
  v1.__darwin_time_t tv_sec = 0;
  *(void *)&v1.tv_useapr_vformatter_buff_t c = 0;
  gettimeofday(&v1, 0);
  return v1.tv_usec + 1000000 * v1.tv_sec;
}

apr_status_t apr_time_exp_tz(apr_time_exp_t *result, apr_time_t input, apr_int32_t offs)
{
  result->tm_gmtoff = offs;
  return 0;
}

double explode_time(uint64_t a1, uint64_t a2, int a3, int a4)
{
  memset(&v9, 0, sizeof(v9));
  time_t v8 = a2 / 1000000 + a3;
  *(_DWORD *)a1 = a2 % 1000000;
  if (a4) {
    localtime_r(&v8, &v9);
  }
  else {
    gmtime_r(&v8, &v9);
  }
  double result = *(double *)&v9.tm_sec;
  long long v6 = *(_OWORD *)&v9.tm_mon;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)&v9.tm_sec;
  *(_OWORD *)(a1 + 2explode_time((uint64_t)result, input, offs, 0) = v6;
  int tm_gmtoff = v9.tm_gmtoff;
  *(_DWORD *)(a1 + 36) = v9.tm_isdst;
  *(_DWORD *)(a1 + 4explode_time((uint64_t)result, input, offs, 0) = tm_gmtoff;
  return result;
}

apr_status_t apr_time_exp_gmt(apr_time_exp_t *result, apr_time_t input)
{
  memset(&v6, 0, sizeof(v6));
  time_t v5 = input / 1000000;
  result->tm_useapr_vformatter_buff_t c = input % 1000000;
  gmtime_r(&v5, &v6);
  long long v3 = *(_OWORD *)&v6.tm_mon;
  *(_OWORD *)&result->tm_seapr_vformatter_buff_t c = *(_OWORD *)&v6.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  *(void *)&result->tm_isdst = v6.tm_isdst;
  return 0;
}

apr_status_t apr_time_exp_lt(apr_time_exp_t *result, apr_time_t input)
{
  memset(&v7, 0, sizeof(v7));
  time_t v6 = input / 1000000;
  result->tm_useapr_vformatter_buff_t c = input % 1000000;
  localtime_r(&v6, &v7);
  long long v3 = *(_OWORD *)&v7.tm_mon;
  *(_OWORD *)&result->tm_seapr_vformatter_buff_t c = *(_OWORD *)&v7.tm_sec;
  *(_OWORD *)&result->tm_mon = v3;
  apr_int32_t tm_gmtoff = v7.tm_gmtoff;
  result->tm_isdst = v7.tm_isdst;
  result->apr_int32_t tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_time_exp_get(apr_time_t *result, apr_time_exp_t *input)
{
  uint64_t tm_mon = input->tm_mon;
  if (tm_mon > 0xB) {
    return 20004;
  }
  int64_t v3 = input->tm_year - (unint64_t)(tm_mon < 2);
  int64_t v4 = v3 + 3;
  if (v3 >= 0) {
    int64_t v4 = input->tm_year - (unint64_t)(tm_mon < 2);
  }
  uint64_t v5 = 365 * v3 + (v4 >> 2) - v3 / 100;
  int v6 = v3 / 100 + 3;
  int v7 = v3 / 100 + 6;
  if ((int)((uint64_t)(input->tm_year - (unint64_t)(tm_mon < 2)) / 100) >= -3) {
    int v7 = v6;
  }
  uint64_t v8 = input->tm_sec
     + 60
     * (input->tm_min
      + 60 * (input->tm_hour + 24 * (v5 + apr_time_exp_get_dayoffset[tm_mon] + input->tm_mday - 1 + (v7 >> 2))))
     - 2203891200;
  if (v8 < 0) {
    return 20004;
  }
  apr_status_t v9 = 0;
  char *result = input->tm_usec + 1000000 * v8;
  return v9;
}

apr_status_t apr_time_exp_gmt_get(apr_time_t *result, apr_time_exp_t *input)
{
  apr_status_t v4 = apr_time_exp_get(result, input);
  if (!v4) {
    *result -= 1000000 * input->tm_gmtoff;
  }
  return v4;
}

apr_status_t apr_os_imp_time_get(apr_os_imp_time_t **ostime, apr_time_t *aprtime)
{
  apr_time_t v2 = *aprtime / 1000000;
  int64_t v3 = *ostime;
  v3->tv_useapr_vformatter_buff_t c = *aprtime % 1000000;
  v3->__darwin_time_t tv_sec = v2;
  return 0;
}

apr_status_t apr_os_exp_time_get(apr_os_exp_time_t **ostime, apr_time_exp_t *aprtime)
{
  apr_time_t v2 = *ostime;
  *(_OWORD *)&v2->tm_seapr_vformatter_buff_t c = *(_OWORD *)&aprtime->tm_sec;
  *(_OWORD *)&v2->uint64_t tm_mon = *(_OWORD *)&aprtime->tm_mon;
  uint64_t tm_gmtoff = aprtime->tm_gmtoff;
  v2->tm_isdst = aprtime->tm_isdst;
  v2->uint64_t tm_gmtoff = tm_gmtoff;
  return 0;
}

apr_status_t apr_os_imp_time_put(apr_time_t *aprtime, apr_os_imp_time_t **ostime, apr_pool_t *cont)
{
  *aprtime = (*ostime)->tv_usec + 1000000 * (*ostime)->tv_sec;
  return 0;
}

apr_status_t apr_os_exp_time_put(apr_time_exp_t *aprtime, apr_os_exp_time_t **ostime, apr_pool_t *cont)
{
  int64_t v3 = *ostime;
  *(_OWORD *)&aprtime->tm_seapr_vformatter_buff_t c = *(_OWORD *)&(*ostime)->tm_sec;
  *(_OWORD *)&aprtime->uint64_t tm_mon = *(_OWORD *)&v3->tm_mon;
  apr_int32_t tm_isdst = v3->tm_isdst;
  uint64_t tm_gmtoff = v3->tm_gmtoff;
  aprtime->apr_int32_t tm_isdst = tm_isdst;
  aprtime->uint64_t tm_gmtoff = tm_gmtoff;
  return 0;
}

void apr_sleep(apr_interval_time_t t)
{
  v1.__darwin_time_t tv_sec = t / 1000000;
  *(void *)&v1.tv_useapr_vformatter_buff_t c = (t % 1000000);
  select(0, 0, 0, 0, &v1);
}

id gt_default_log()
{
  uint64_t v0 = (void *)s_defaultLog;
  if (s_defaultLog == &_os_log_internal)
  {
    if (gt_default_log_onceToken != -1) {
      dispatch_once(&gt_default_log_onceToken, &__block_literal_global_13);
    }
    uint64_t v0 = (void *)s_defaultLog;
  }

  return v0;
}

void __gt_default_log_block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v0 = 0;
    _os_log_impl(&dword_24F657000, &_os_log_internal, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v0, 2u);
  }
}

id gt_tagged_log(unint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (s_logCount <= a1)
  {
    if (s_logUsingOsLog)
    {
      uint64_t v5 = gt_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_fault_impl(&dword_24F657000, v5, OS_LOG_TYPE_FAULT, "fail: Invalid log tag: %llu", buf, 0xCu);
      }
    }
    else
    {
      int v6 = (FILE *)*MEMORY[0x263EF8348];
      objc_msgSend(NSString, "stringWithFormat:", @"fail: Invalid log tag: %llu", a1);
      id v7 = objc_claimAutoreleasedReturnValue();
      fprintf(v6, "%s\n", (const char *)[v7 UTF8String]);
    }
    id v4 = (id)&_os_log_internal;
    id v8 = &_os_log_internal;
  }
  else
  {
    *(_OWORD *)buf = 0u;
    long long v11 = 0u;
    __copy_constructor_8_8_s0_s8_s16_s24(buf, (id *)(s_logs + 32 * a1));
    int v2 = GTCoreLog_enabled((uint64_t)buf);
    int64_t v3 = (void *)*((void *)&v11 + 1);
    if (!v2) {
      int64_t v3 = (void *)MEMORY[0x263EF8440];
    }
    id v4 = v3;
    __destructor_8_s0_s8_s16_s24((uint64_t)buf);
  }

  return v4;
}

id __copy_constructor_8_8_s0_s8_s16_s24(void *a1, id *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  id result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t GTCoreLog_enabled(uint64_t a1)
{
  if (!*(void *)(a1 + 16)) {
    return 1;
  }
  int v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 BOOLForKey:*(void *)(a1 + 16)];

  return v3;
}

void __destructor_8_s0_s8_s16_s24(uint64_t a1)
{
  int v2 = *(void **)(a1 + 24);
}

uint64_t GTCoreLogUseOsLog()
{
  return s_logUsingOsLog;
}

void GTCoreLogInit(const char *a1, uint64_t a2, int a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (s_defaultLog == &_os_log_internal)
  {
    int v6 = a1;
    os_log_t v7 = os_log_create(a1, "");
    id v8 = (void *)s_defaultLog;
    s_defaultLog = (uint64_t)v7;

    apr_status_t v9 = &unk_269A29000;
    s_logs = (uint64_t)malloc_type_calloc(a3, 0x20uLL, 0x8004018A671A6uLL);
    s_logCount = a3;
    if (a3 >= 1)
    {
      double v10 = 0;
      unint64_t v11 = a3;
      uint64_t v12 = a2 + 8;
      uint64_t v13 = 16;
      unint64_t v14 = 0x263F08000uLL;
      id v36 = (id)v11;
      do
      {
        uint64_t v15 = *(const char **)v12;
        if (v10 == *(char **)(v12 - 8))
        {
          va_list v16 = v6;
          uint64_t v17 = *(unsigned __int8 *)(v12 + 8);
          uint64_t v18 = v9[44];
          uint64_t v19 = v18 + v13;
          unsigned int v20 = v16;
          uint64_t v21 = objc_msgSend(*(id *)(v14 + 2880), "stringWithUTF8String:");
          int v22 = *(void **)(v18 + v13 - 16);
          *(void *)(v19 - 16) = v21;

          uint64_t v23 = [*(id *)(v14 + 2880) stringWithUTF8String:v15];
          uint64_t v24 = *(void **)(v18 + v13 - 8);
          *(void *)(v19 - 8) = v23;

          if (v17)
          {
            uint64_t v25 = [*(id *)(v14 + 2880) stringWithFormat:@"%@.%@.enableLog", *(void *)(v19 - 16), *(void *)(v19 - 8)];
            int v26 = *(void **)(v18 + v13);
            *(void *)(v18 + v13) = v25;
          }
          else
          {
            int v26 = *(void **)(v18 + v13);
            *(void *)(v18 + v13) = 0;
          }

          int v6 = v20;
          os_log_t v28 = os_log_create(v20, v15);
          char v29 = *(void **)(v18 + v13 + 8);
          *(void *)(v18 + v13 + 8) = v28;

          GTCoreLog_enabled(v19 - 16);
          apr_status_t v9 = (void *)&unk_269A29000;
          unint64_t v11 = (unint64_t)v36;
          unint64_t v14 = 0x263F08000;
        }
        else
        {
          if (s_logUsingOsLog)
          {
            int v27 = gt_default_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              int v39 = v15;
              __int16 v40 = 1024;
              int v41 = (int)v10;
              _os_log_error_impl(&dword_24F657000, v27, OS_LOG_TYPE_ERROR, "warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", buf, 0x12u);
            }
          }
          else
          {
            uint64_t v30 = (FILE *)*MEMORY[0x263EF8348];
            int v27 = [*(id *)(v14 + 2880) stringWithFormat:@"warning: Invalid tag ID for %s, %d expected. Falling back to OS_LOG_DEFAULT", v15, v10];
            fprintf(v30, "%s\n", (const char *)[v27 UTF8String]);
          }

          objc_storeStrong((id *)(v9[44] + v13 + 8), &_os_log_internal);
        }
        ++v10;
        v13 += 32;
        v12 += 24;
      }
      while ((char *)v11 != v10);
    }
    double v31 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v32 = [v31 BOOLForKey:@"GPUToolsPerfLogging"];

    if (v32)
    {
      os_log_t v33 = os_log_create(v6, "");
      unint64_t v34 = (void *)g_signpostLog;
      g_signpostLog = (uint64_t)v33;
    }
  }
  else if (s_logUsingOsLog)
  {
    uint64_t v3 = gt_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v39 = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl(&dword_24F657000, v3, OS_LOG_TYPE_ERROR, "warning: %s", buf, 0xCu);
    }
  }
  else
  {
    BOOL v35 = (FILE *)*MEMORY[0x263EF8348];
    objc_msgSend(NSString, "stringWithFormat:", @"warning: %s", "Log already initialized, did you call GTCoreLogInit twice?");
    id v37 = objc_claimAutoreleasedReturnValue();
    fprintf(v35, "%s\n", (const char *)[v37 UTF8String]);
  }
}

uint64_t GTCoreLogTagEnabled(unint64_t a1)
{
  if (s_logCount <= a1) {
    return 0;
  }
  memset(v3, 0, sizeof(v3));
  __copy_constructor_8_8_s0_s8_s16_s24(v3, (id *)(s_logs + 32 * a1));
  uint64_t v1 = GTCoreLog_enabled((uint64_t)v3);
  __destructor_8_s0_s8_s16_s24((uint64_t)v3);
  return v1;
}

uint64_t GTCoreLogUseStandardOutputStreams(uint64_t result)
{
  s_logUsingOsLog = result ^ 1;
  return result;
}

void std::vector<GPUTools::FB::Fbuf>::vector(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  int v6 = a2;
  if (v5 != a2)
  {
    do
    {
      apr_status_t v9 = (void *)*((void *)v5 - 3);
      v5 -= 24;
      id v8 = v9;
      if (v9) {
        free(v8);
      }
      *(void *)uint64_t v5 = 0;
      *((void *)v5 + 1) = 0;
      *((_DWORD *)v5 + 4) = 0;
    }
    while (v5 != a2);
    int v6 = *a3;
  }
  *a1 = a2;

  operator delete(v6);
}

void _log_assert_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24F657000, a2, OS_LOG_TYPE_ERROR, "Error: %s", (uint8_t *)&v2, 0xCu);
}

void ___log_assert_block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_24F657000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create com.apple.gdt.assertions log component", v0, 2u);
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4550](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4B20](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x270EE51E8](string);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D88](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4DF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x270ED7C68](libraryName);
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

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x270EE5608]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987B8]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987C8]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987D8]();
}

{
  return MEMORY[0x270F987E0]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x270F98838](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x270F98848](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  return MEMORY[0x270ED7F38](a1, *(void *)&a2, a3, a4, a5);
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

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x270ED8648](client, msg, *(void *)&level, format);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x270ED8658](ident, facility, *(void *)&opts);
}

int atexit(void (*a1)(void))
{
  return MEMORY[0x270ED86D8](a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

int chdir(const char *a1)
{
  return MEMORY[0x270ED8EB8](a1);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x270ED9450]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x270ED9528](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
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

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

pid_t fork(void)
{
  return MEMORY[0x270ED99F8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x270ED9B90](*(void *)&a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270ED9DE0](a1, a2);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x270EDA180](*(void *)&target_task, size, offset, *(void *)&permission, object_handle, *(void *)&parent_entry);
}

kern_return_t mach_memory_entry_ownership(mem_entry_name_port_t mem_entry, task_t owner, int ledger_tag, int ledger_flags)
{
  return MEMORY[0x270EDA188](*(void *)&mem_entry, *(void *)&owner, *(void *)&ledger_tag, *(void *)&ledger_flags);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x270F9A518](m, imp);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x270F9AA48](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x270EDAC40](a1, *(void *)&a2, *(void *)&a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF68](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x270EDB058](*(void *)&a1, a2, a3);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x270EDB068](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x270F9AAE8](str);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int shm_open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDB470](a1, *(void *)&a2);
}

int shm_unlink(const char *a1)
{
  return MEMORY[0x270EDB478](a1);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x270EDB4B8](*(void *)&a1, a2, a3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  return MEMORY[0x270EDB4E0](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_suspend(task_read_t target_task)
{
  return MEMORY[0x270EDB8A0](*(void *)&target_task);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x270EDB9C8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x270EDBA88](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

kern_return_t vm_map(vm_map_t target_task, vm_address_t *address, vm_size_t size, vm_address_t mask, int flags, mem_entry_name_port_t object, vm_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDBA98](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

kern_return_t vm_protect(vm_map_t target_task, vm_address_t address, vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x270EDBAA0](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

kern_return_t vm_remap(vm_map_t target_task, vm_address_t *target_address, vm_size_t size, vm_address_t mask, int flags, vm_map_t src_task, vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDBAC8](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x270EDBB48](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x270EDBD48](xarray, index, length);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}