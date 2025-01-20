__CFString *typeToKey(uint64_t a1)
{
  __CFString *result;

  switch(a1)
  {
    case 0:
      result = @"Default";
      break;
    case 1:
      result = @"Variant1.SingleClick.Normal";
      break;
    case 2:
      result = @"Variant1.SingleClick.Soft";
      break;
    case 3:
      result = @"Variant1.SecondClick.Normal";
      break;
    case 4:
      result = @"Variant1.SecondClick.Soft";
      break;
    case 5:
      result = @"Variant2.SingleClick.Normal";
      break;
    case 6:
      result = @"Variant2.SingleClick.Soft";
      break;
    case 7:
      result = @"Variant2.SecondClick.Normal";
      break;
    case 8:
      result = @"Variant2.SecondClick.Soft";
      break;
    case 9:
      result = @"Variant3.SingleClick.Normal";
      break;
    case 10:
      result = @"Variant3.SingleClick.Soft";
      break;
    case 11:
      result = @"Variant3.SecondClick.Normal";
      break;
    case 12:
      result = @"Variant3.SecondClick.Soft";
      break;
    case 13:
      result = @"Variant1.SingleClick.SemiSoft";
      break;
    case 14:
      result = @"Variant1.SecondClick.SemiSoft";
      break;
    case 15:
      result = @"Variant2.SingleClick.SemiSoft";
      break;
    case 16:
      result = @"Variant2.SecondClick.SemiSoft";
      break;
    case 17:
      result = @"Variant3.SingleClick.SemiSoft";
      break;
    case 18:
      result = @"Variant3.SecondClick.SemiSoft";
      break;
    default:
      if (a1 == 100) {
        result = @"Latch";
      }
      else {
        result = 0;
      }
      break;
  }
  return result;
}

const void *getDictionary(const __CFDictionary *a1, const __CFString *a2)
{
  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDictionaryGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *getString(const __CFDictionary *a1, const __CFString *a2)
{
  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFStringGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t getFloat64(const __CFDictionary *a1, const __CFString *a2, double *a3)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = (const __CFNumber *)result;
    CFTypeID v6 = CFGetTypeID((CFTypeRef)result);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberDoubleType, a3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t dictForType(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  TuningPListMgr::TuningPListMgr((TuningPListMgr *)v20, "/Library/Audio/Tunings");
  CFMutableStringRef v18 = PlatformUtilities::CopyHardwareModelShortName(v4);
  char v19 = 1;
  CFStringRef v16 = CFStringCreateWithCString(0, "ButtonHaptics", 0x600u);
  char v17 = 1;
  CFStringRef v14 = CFStringCreateWithCString(0, "buttonhapticsconfig", 0x600u);
  char v15 = 1;
  *(void *)buf = &v18;
  v22 = &v16;
  v23 = &v14;
  uint64_t TuningInSubdirs = TuningPListMgr::loadTuningInSubdirs_((uint64_t)v20, (const __CFString ***)buf, 3u, 2);
  CACFString::~CACFString((CACFString *)&v14);
  CACFString::~CACFString((CACFString *)&v16);
  if (!TuningInSubdirs)
  {
    AUPListByName = TuningPListMgr::getAUPListByName((TuningPListMgr *)v20, "buttonhapticsconfig");
    if (AUPListByName)
    {
      CFDictionaryRef Dictionary = (const __CFDictionary *)getDictionary((const __CFDictionary *)AUPListByName, @"States");
      if (Dictionary)
      {
        v11 = typeToKey(a1);
        if (v11)
        {
          v12 = getDictionary(Dictionary, v11);
          *a2 = v12;
          if (v12)
          {
            CFRetain(v12);
            uint64_t TuningInSubdirs = 0;
            goto LABEL_19;
          }
          uint64_t TuningInSubdirs = 1886155636;
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          *(_WORD *)buf = 0;
          CFTypeID v6 = &_os_log_internal;
          v7 = "get typeDictionary failed";
        }
        else
        {
          uint64_t TuningInSubdirs = 1954115617;
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          *(_WORD *)buf = 0;
          CFTypeID v6 = &_os_log_internal;
          v7 = "bad typeKey";
        }
      }
      else
      {
        uint64_t TuningInSubdirs = 1886155636;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_19;
        }
        *(_WORD *)buf = 0;
        CFTypeID v6 = &_os_log_internal;
        v7 = "get statesDictionary failed";
      }
    }
    else
    {
      uint64_t TuningInSubdirs = 1886155636;
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      CFTypeID v6 = &_os_log_internal;
      v7 = "getAUPListByName failed";
    }
    uint32_t v8 = 2;
    goto LABEL_18;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = TuningInSubdirs;
    CFTypeID v6 = &_os_log_internal;
    v7 = "loadTuning failed %d";
    uint32_t v8 = 8;
LABEL_18:
    _os_log_impl(&dword_2217BB000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
  }
LABEL_19:
  CACFString::~CACFString((CACFString *)&v18);
  TuningPListMgr::~TuningPListMgr((TuningPListMgr *)v20);
  return TuningInSubdirs;
}

void sub_2217BC4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  CACFString::~CACFString((CACFString *)va);
  TuningPListMgr::~TuningPListMgr((TuningPListMgr *)va1);
  _Unwind_Resume(a1);
}

void sub_2217BC534()
{
}

void MatchingNotificationHandler(void *a1, io_iterator_t iterator)
{
  kern_return_t v5;
  kern_return_t v6;
  kern_return_t v7;
  kern_return_t v8;
  NSObject *v9;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  kern_return_t v15;
  _OWORD v16[8];
  uint64_t v17;

  char v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = IOIteratorNext(iterator);
  if (v2)
  {
    io_service_t v3 = v2;
    memset(v16, 0, sizeof(v16));
    MEMORY[0x223C8AB20](v2, v16);
    CFTypeID v4 = (unsigned int *)MEMORY[0x263EF8960];
    CFNumberRef v5 = IOServiceOpen(v3, *MEMORY[0x263EF8960], 0, (io_connect_t *)&gButtonServiceConnection);
    if (v5)
    {
      CFTypeID v6 = v5;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "void MatchingNotificationHandler(void *, io_iterator_t)";
        CFStringRef v14 = 1024;
        char v15 = v6;
        _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s Unable to open user client err %d", buf, 0x12u);
      }
    }
    else if (!MEMORY[0x223C8AAE0](gButtonServiceConnection, 0, *v4, &_sharedMemoryAddress, &_sharedMemorySize, 1))
    {
      _sharedMemoryPtr = _sharedMemoryAddress;
      output = -999;
      outputCnt = 1;
      uint64_t v7 = IOConnectCallScalarMethod(gButtonServiceConnection, 1u, 0, 0, &output, &outputCnt);
      if (v7)
      {
        uint32_t v8 = v7;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v13 = "void MatchingNotificationHandler(void *, io_iterator_t)";
          CFStringRef v14 = 1024;
          char v15 = v8;
          _os_log_impl(&dword_2217BB000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s failed to send GetNumberOfSupportedAssets err %d", buf, 0x12u);
        }
      }
      else
      {
        gNumberOfSlots = output;
      }
      gServiceAvailable = 1;
      uint64_t v9 = dispatch_get_global_queue(17, 0);
      dispatch_async_f(v9, 0, (dispatch_function_t)serviceCameUp);
    }
  }
}

void serviceCameUp(void *a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  v1 = +[HAButtonHapticsLoader sharedInstance];
  [v2 postNotificationName:@"HAButtonHapticsLoaderServiceIsAvailableNotification" object:v1];
}

void sub_2217BC7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2217BCAE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16)
{
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_2217BD624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);

  _Unwind_Resume(a1);
}

void sub_2217BD8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2217BD954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2217BD9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2217BDA6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void sub_2217BDAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  CFDictionaryReleaser::~CFDictionaryReleaser((const void **)va);
  _Unwind_Resume(a1);
}

void TuningPListMgr::TuningPListMgr(TuningPListMgr *this, const char *a2)
{
  *(void *)this = CFStringCreateWithCString(0, a2, 0x600u);
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 6) = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v4 = 16;
  CFNumberRef v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  CFTypeID v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  do
  {
    *(void *)((char *)this + v4) = CFDictionaryCreateMutable(v3, 0, v5, v6);
    v4 += 8;
  }
  while (v4 != 48);
}

void sub_2217BDBB8(_Unwind_Exception *a1)
{
  CACFString::~CACFString(v1);
  _Unwind_Resume(a1);
}

void CACFString::~CACFString(CACFString *this)
{
  if (*((unsigned char *)this + 8))
  {
    id v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void __clang_call_terminate(void *a1)
{
}

void applesauce::CF::TypeRefPair::~TypeRefPair(applesauce::CF::TypeRefPair *this)
{
  id v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  keys = 0;
  v35 = 0;
  v36 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  v32 = 0;
  v33 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = *(void ***)a1;
    uint64_t v5 = *(void *)a1 + 16 * v3;
    do
    {
      CFTypeID v6 = *v4;
      uint64_t v7 = v35;
      if (v35 >= v36)
      {
        uint64_t v9 = v35 - keys;
        if ((unint64_t)(v9 + 1) >> 61) {
          std::vector<void const*>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1) {
          unint64_t v10 = v9 + 1;
        }
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v36, v11);
        }
        else {
          v12 = 0;
        }
        v13 = (void **)&v12[8 * v9];
        *v13 = v6;
        uint32_t v8 = v13 + 1;
        char v15 = keys;
        CFStringRef v14 = v35;
        if (v35 != keys)
        {
          do
          {
            CFStringRef v16 = *--v14;
            *--v13 = v16;
          }
          while (v14 != v15);
          CFStringRef v14 = keys;
        }
        keys = v13;
        v35 = v8;
        v36 = (void **)&v12[8 * v11];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *v35 = v6;
        uint32_t v8 = v7 + 1;
      }
      v35 = v8;
      char v17 = v4[1];
      CFMutableStringRef v18 = v32;
      if (v32 >= v33)
      {
        uint64_t v20 = v32 - values;
        if ((unint64_t)(v20 + 1) >> 61) {
          std::vector<void const*>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1) {
          unint64_t v21 = v20 + 1;
        }
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v22 = v21;
        }
        if (v22) {
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v33, v22);
        }
        else {
          v23 = 0;
        }
        uint64_t v24 = (void **)&v23[8 * v20];
        *uint64_t v24 = v17;
        char v19 = v24 + 1;
        v26 = values;
        v25 = v32;
        if (v32 != values)
        {
          do
          {
            v27 = *--v25;
            *--uint64_t v24 = v27;
          }
          while (v25 != v26);
          v25 = values;
        }
        values = v24;
        v32 = v19;
        v33 = (void **)&v23[8 * v22];
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        *v32 = v17;
        char v19 = v18 + 1;
      }
      v32 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  CFDictionaryRef v28 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v28)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x223C8AB80](exception, "Could not construct");
  }
  if (values)
  {
    v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    v35 = keys;
    operator delete(keys);
  }
  return v28;
}

void sub_2217BDEF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  __cxa_free_exception(v13);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<void const*>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    CFTypeID v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
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

void std::vector<void const*>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_2217BE054(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[31],int>(applesauce::CF::TypeRef *a1, char *a2, int *a3)
{
  applesauce::CF::TypeRef::TypeRef(a1, a2);
  int valuePtr = *a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *((void *)a1 + 1) = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x223C8AB80](exception, "Could not construct");
  }
  return a1;
}

void sub_2217BE1A0(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRef::TypeRef(applesauce::CF::TypeRef *this, char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  if ((v9 & 0x80u) == 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    CFIndex v4 = v9;
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *(void *)this = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x223C8AB80](exception, "Could not construct");
  }
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  return this;
}

void sub_2217BE29C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*v15) {
    CFRelease(*v15);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
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
    CFTypeID v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFTypeID v6 = a1;
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

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[16],applesauce::CF::DictionaryRef &>(applesauce::CF::TypeRef *a1, char *a2, const void **a3)
{
  applesauce::CF::TypeRef::TypeRef(a1, a2);
  size_t v5 = *a3;
  if (v5) {
    CFRetain(v5);
  }
  *((void *)a1 + 1) = v5;
  return a1;
}

void CFDictionaryReleaser::~CFDictionaryReleaser(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t CACFString::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(const void **)a2;
  if (*(void *)a2 != *(void *)a1)
  {
    if (*(void *)a1) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      CFRelease(*(CFTypeRef *)a1);
      uint64_t v3 = *(const void **)a2;
    }
    *(void *)a1 = v3;
    int v6 = *(unsigned __int8 *)(a2 + 8);
    *(unsigned char *)(a1 + 8) = v6;
    if (v6) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      CFRetain(v3);
    }
  }
  return a1;
}

uint64_t PListLogger::log(PListLogger *this, const char *a2, ...)
{
  va_start(va, a2);
  return vdprintf(*(_DWORD *)this, a2, va);
}

void TuningPListMgr::~TuningPListMgr(TuningPListMgr *this)
{
  for (uint64_t i = 16; i != 48; i += 8)
  {
    uint64_t v3 = *(const void **)((char *)this + i);
    if (v3)
    {
      CFRelease(v3);
      *(void *)((char *)this + i) = 0;
    }
  }
  size_t v4 = (int *)*((void *)this + 6);
  if (v4)
  {
    if (*v4 != -1)
    {
      PListLogger::log(*((PListLogger **)this + 6), "*** done.\n");
      close(*v4);
      *size_t v4 = -1;
    }
    MEMORY[0x223C8ABE0](v4, 0x1000C4005A209FELL);
  }
  CACFString::~CACFString(this);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>()
{
}

uint64_t TuningPListMgr::loadTuningInSubdirs_(uint64_t a1, const __CFString ***a2, unsigned int a3, int a4)
{
  if (a3 && (CFStringRef v8 = **a2) != 0 && CFStringHasPrefix(v8, @"/"))
  {
    uint64_t v41 = 1;
    MutableCopy = CFStringCreateMutableCopy(0, 0, &stru_26D3D4C90);
    CFMutableStringRef theString = MutableCopy;
  }
  else
  {
    CFStringRef v10 = *(const __CFString **)a1;
    uint64_t v41 = 1;
    MutableCopy = CFStringCreateMutableCopy(0, 0, v10);
    CFMutableStringRef theString = MutableCopy;
    if (!a3) {
      goto LABEL_12;
    }
  }
  uint64_t v11 = a3 - 1;
  v12 = a2;
  if (!MutableCopy) {
    goto LABEL_9;
  }
LABEL_7:
  CFStringAppend(MutableCopy, @"/");
  if (theString) {
    CFStringAppend(theString, **v12);
  }
LABEL_9:
  while (v11)
  {
    MutableCopy = theString;
    --v11;
    ++v12;
    if (theString) {
      goto LABEL_7;
    }
  }
LABEL_12:
  if (a4 <= 4) {
    uint64_t v13 = a4;
  }
  else {
    uint64_t v13 = 0;
  }
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v15 = strlen(TuningPListMgr::kTuningFileTypeSuffixMap[v13]);
  CFStringRef v16 = CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)TuningPListMgr::kTuningFileTypeSuffixMap[v13], v15, 0x600u, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (theString)
  {
    CFStringRef v17 = theString;
    if (!CFStringHasSuffix(theString, v16))
    {
      CFStringAppend(theString, v16);
      CFStringRef v17 = theString;
    }
  }
  else
  {
    CFStringRef v17 = 0;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable(v14, 512);
  CFURLRef v19 = CFURLCreateWithFileSystemPath(v14, v17, kCFURLPOSIXPathStyle, 0);
  if (v19
    && (uint64_t v20 = CFReadStreamCreateWithFile(v14, v19), CFRelease(v19), v20)
    && (CFReadStreamOpen(v20),
        CFDictionaryRef v21 = (const __CFDictionary *)CFPropertyListCreateWithStream(v14, v20, 0, 0, 0, 0),
        CFReadStreamClose(v20),
        CFRelease(v20),
        v21))
  {
    CFRelease(Mutable);
    unint64_t v22 = (const void **)a2[a3 - 1];
    v23 = *v22;
    if (v13)
    {
      CFMutableStringRef v38 = (CFMutableStringRef)*v22;
    }
    else
    {
      uint64_t v25 = 0;
      v26 = 0;
      v27 = 0;
      CFMutableStringRef v38 = theString;
      v42 = 0;
      do
      {
        CFDictionaryRef v28 = kLegacyStripNameKeys[v25];
        if (!CFDictionaryContainsKey(v21, v28))
        {
          if (!v27)
          {
            CFIndex Count = CFDictionaryGetCount(v21);
            v26 = CFDictionaryCreateMutableCopy(v14, Count + 2, v21);
            v42 = v26;
          }
          CFDictionaryAddValue(v26, v28, v23);
          v27 = v26;
        }
        ++v25;
      }
      while (v25 != 2);
      if (v26) {
        CFRelease(v21);
      }
      else {
        v26 = v21;
      }
      CFDictionaryRef v21 = v26;
    }
    Value = CFDictionaryGetValue(v21, @"name");
    if (Value)
    {
      CFTypeID TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(Value) && CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8 * v13 + 16)) >= 1) {
        operator new[]();
      }
    }
    uint64_t v32 = a1 + 8 * v13;
    v34 = *(__CFDictionary **)(v32 + 16);
    v33 = (const __CFString **)(v32 + 16);
    CFDictionarySetValue(v34, v38, v21);
    v36 = *(char **)(a1 + 48);
    if (v36) {
      PListLogger::logItemEntry(*v33, "@@ Strips Nov 10 2024 02:15:55", v36, v35);
    }
    uint64_t v24 = 0;
    if (v16) {
LABEL_45:
    }
      CFRelease(v16);
  }
  else
  {
    if (Mutable)
    {
      CFStringAppend(Mutable, @"Error loading plist file ");
      CFStringAppend(Mutable, v17);
      CFStringAppend(Mutable, @"\n");
    }
    CFRelease(Mutable);
    CFDictionaryRef v21 = 0;
    uint64_t v24 = 0xFFFFFFFFLL;
    if (v16) {
      goto LABEL_45;
    }
  }
  if (v21) {
    CFRelease(v21);
  }
  CACFMutableString::~CACFMutableString((CACFMutableString *)&theString);
  return v24;
}

void sub_2217BEAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef((const void **)va1);
  CACFMutableString::~CACFMutableString((CACFMutableString *)va);
  _Unwind_Resume(a1);
}

void CACFMutableString::~CACFMutableString(CACFMutableString *this)
{
  if (*((unsigned char *)this + 8))
  {
    unint64_t v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void PListLogger::logItemEntry(const __CFString *this, const char *a2, char *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  CFTypeID v7 = CFGetTypeID(this);
  if (CFStringGetTypeID() == v7)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long valuePtr = 0u;
    long long v31 = 0u;
    int v8 = *((_DWORD *)a3 + 1);
    if (v8 >= 127) {
      size_t v9 = 127;
    }
    else {
      size_t v9 = v8;
    }
    if (v9) {
      memset((char *)&valuePtr + (int)v9 - (v9 - 1) - 1, 32, v9);
    }
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    CFGetRetainCount(this);
    CFStringGetCStringPtr(this, 0);
    PListLogger::log((PListLogger *)a3, "'%s' | String{%d} | \"%s\"\n");
  }
  else if (CFNumberGetTypeID() == v7)
  {
    CFNumberType Type = CFNumberGetType((CFNumberRef)this);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long valuePtr = 0u;
    long long v31 = 0u;
    int v11 = *((_DWORD *)a3 + 1);
    if (v11 >= 127) {
      size_t v12 = 127;
    }
    else {
      size_t v12 = v11;
    }
    if (v12) {
      memset((char *)&valuePtr + (int)v12 - (v12 - 1) - 1, 32, v12);
    }
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    if ((unint64_t)Type <= kCFNumberDoubleType)
    {
      if (((1 << Type) & 0x3060) != 0)
      {
        *(void *)&long long valuePtr = 0;
        CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
        CFGetRetainCount(this);
        PListLogger::log((PListLogger *)a3, "'%s' | Number(float){%d} | %f\n");
        return;
      }
      if (((1 << Type) & 0x82) != 0)
      {
        LOBYTE(valuePtr) = 0;
        CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
        CFGetRetainCount(this);
        PListLogger::log((PListLogger *)a3, "'%s' | Number(SInt8){%d} | 0x%02x\n");
        return;
      }
      if (((1 << Type) & 0x104) != 0)
      {
        LOWORD(valuePtr) = 0;
        CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
        CFGetRetainCount(this);
        PListLogger::log((PListLogger *)a3, "'%s' | Number(SInt16){%d} | 0x%04x\n");
        return;
      }
    }
    LODWORD(valuePtr) = 0;
    CFNumberGetValue((CFNumberRef)this, Type, &valuePtr);
    CFIndex v29 = CFGetRetainCount(this);
    PListLogger::log((PListLogger *)a3, "'%s' | Number(SInt32){%d} | %-6d 0x%08x %c%c%c%c\n", a2, v29);
  }
  else if (CFDictionaryGetTypeID() == v7)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long valuePtr = 0u;
    long long v31 = 0u;
    int v13 = *((_DWORD *)a3 + 1);
    if (v13 >= 127) {
      size_t v14 = 127;
    }
    else {
      size_t v14 = v13;
    }
    if (v14) {
      memset((char *)&valuePtr + (int)v14 - (v14 - 1) - 1, 32, v14);
    }
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    int v15 = CFGetRetainCount(this);
    int Count = CFDictionaryGetCount((CFDictionaryRef)this);
    PListLogger::log((PListLogger *)a3, "'%s' | Dictionary{%d} | %d key/value pairs\n", a2, v15, Count);
    if (!strcmp("aupreset", a2)) {
      a3[8] = 1;
    }
    *((_DWORD *)a3 + 1) += 4;
    CFDictionaryApplyFunction((CFDictionaryRef)this, (CFDictionaryApplierFunction)PListLogger::logDictEntry, a3);
    *((_DWORD *)a3 + 1) -= 4;
    a3[8] = 0;
  }
  else if (CFArrayGetTypeID() == v7)
  {
    CFIndex v17 = CFArrayGetCount((CFArrayRef)this);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long valuePtr = 0u;
    long long v31 = 0u;
    int v18 = *((_DWORD *)a3 + 1);
    if (v18 >= 127) {
      size_t v19 = 127;
    }
    else {
      size_t v19 = v18;
    }
    if (v19) {
      memset((char *)&valuePtr + (int)v19 - (v19 - 1) - 1, 32, v19);
    }
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    int v20 = CFGetRetainCount(this);
    PListLogger::log((PListLogger *)a3, "'%s' | Array{%d} | %d ordered objects\n", a2, v20, v17);
    int v21 = *((_DWORD *)a3 + 1);
    *((_DWORD *)a3 + 1) = v21 + 4;
    if (v17 >= 1)
    {
      for (CFIndex i = 0; i != v17; ++i)
      {
        ValueAtIndex = (PListLogger *)CFArrayGetValueAtIndex((CFArrayRef)this, i);
        long long valuePtr = 0uLL;
        snprintf((char *)&valuePtr, 0x10uLL, "[%u]", i);
        PListLogger::logItemEntry(ValueAtIndex, &valuePtr, a3, v24);
      }
      int v21 = *((_DWORD *)a3 + 1) - 4;
    }
    *((_DWORD *)a3 + 1) = v21;
  }
  else if (CFDataGetTypeID() == v7)
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long valuePtr = 0uLL;
    long long v31 = 0uLL;
    int v25 = *((_DWORD *)a3 + 1);
    if (v25 >= 127) {
      size_t v26 = 127;
    }
    else {
      size_t v26 = v25;
    }
    if (v26) {
      memset((char *)&valuePtr + (int)v26 - (v26 - 1) - 1, 32, v26);
    }
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    CFGetRetainCount(this);
    CFDataGetLength((CFDataRef)this);
    PListLogger::log((PListLogger *)a3, "'%s' | %sData{%d} | %d bytes\n");
  }
  else
  {
    long long v36 = 0uLL;
    long long v37 = 0uLL;
    long long v34 = 0uLL;
    long long v35 = 0uLL;
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    long long valuePtr = 0uLL;
    long long v31 = 0uLL;
    int v27 = *((_DWORD *)a3 + 1);
    if (v27 >= 127) {
      size_t v28 = 127;
    }
    else {
      size_t v28 = v27;
    }
    if (v28) {
      memset((char *)&valuePtr + (int)v28 - (v28 - 1) - 1, 32, v28);
    }
    PListLogger::log((PListLogger *)a3, "%s", (const char *)&valuePtr);
    PListLogger::log((PListLogger *)a3, "'%s' | <unknown type id: %d)>\n");
  }
}

uint64_t PListLogger::logDictEntry(const __CFString *this, PListLogger *a2, const char *a3, void *a4)
{
  CStringPtr = CFStringGetCStringPtr(this, 0);
  return PListLogger::logItemEntry(a2, CStringPtr, a3, v7);
}

const void **applesauce::CF::ObjectRef<__CFDictionary *>::~ObjectRef(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

NSObject *TuningPListMgr::getAUPListByName(TuningPListMgr *this, const char *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!*((void *)this + 4)) {
    return 0;
  }
  CFStringRef v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, 0, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 4), v3);
  if (!Value || (int v6 = Value, TypeID = CFDictionaryGetTypeID(), TypeID != CFGetTypeID(v6)))
  {
    CFRelease(v4);
    if (atomic_load_explicit((atomic_ullong *volatile)&logSubsystem(void)::onceflag, memory_order_acquire) != -1)
    {
      *(void *)buf = &v9;
      CFStringRef v10 = buf;
      std::__call_once(&logSubsystem(void)::onceflag, &v10, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<logSubsystem(void)::$_0 &&>>);
    }
    if (logSubsystem(void)::scope)
    {
      int v6 = *(NSObject **)logSubsystem(void)::scope;
      if (!*(void *)logSubsystem(void)::scope) {
        return v6;
      }
    }
    else
    {
      int v6 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "TuningPListMgr.cpp";
      __int16 v12 = 1024;
      int v13 = 435;
      _os_log_impl(&dword_2217BB000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d return dictionary is null", buf, 0x12u);
    }
    return 0;
  }
  CFRelease(v4);
  return v6;
}

CFMutableStringRef PlatformUtilities::CopyHardwareModelShortName(PlatformUtilities *this)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!Mutable) {
    return 0;
  }
  CFStringRef v3 = Mutable;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)cStr = 0u;
  long long v13 = 0u;
  size_t v10 = 64;
  sysctlbyname("hw.model", cStr, &v10, 0, 0);
  CFStringAppendCString(v3, cStr, 0);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v1, 0, v3);
  CFRelease(v3);
  if (MutableCopy)
  {
    CFStringRef v5 = @"AP";
    if (CFStringHasSuffix(MutableCopy, @"AP")
      || (CFStringRef v5 = @"DEV", CFStringHasSuffix(MutableCopy, @"DEV"))
      || (CFStringRef v5 = @"ap", CFStringHasSuffix(MutableCopy, @"ap"))
      || (CFStringRef v5 = @"dev", CFStringHasSuffix(MutableCopy, @"dev")))
    {
      CFStringTrim(MutableCopy, v5);
    }
    *(void *)cStr = 0;
    *(void *)&cStr[8] = 1;
    uint64_t v6 = MGGetProductType();
    if (v6 == 952317141)
    {
      size_t v10 = (size_t)CFStringCreateWithCString(0, "u", 0x600u);
      char v11 = 1;
      CACFString::operator=((uint64_t)cStr, (uint64_t)&v10);
    }
    else
    {
      if (v6 != 2081274472 && v6 != 2468178735) {
        goto LABEL_16;
      }
      size_t v10 = (size_t)CFStringCreateWithCString(0, "m", 0x600u);
      char v11 = 1;
      CACFString::operator=((uint64_t)cStr, (uint64_t)&v10);
    }
    CACFString::~CACFString((CACFString *)&v10);
LABEL_16:
    CFStringRef v7 = *(const __CFString **)cStr;
    if (*(void *)cStr && CFStringHasSuffix(MutableCopy, *(CFStringRef *)cStr))
    {
      CFIndex Length = CFStringGetLength(MutableCopy);
      v17.length = CFStringGetLength(v7);
      v17.location = Length - v17.length;
      CFStringFindAndReplace(MutableCopy, v7, &stru_26D3D4C90, v17, 1uLL);
    }
    CACFString::~CACFString((CACFString *)cStr);
  }
  return MutableCopy;
}

void sub_2217BF5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return MEMORY[0x270EE20D8](inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return MEMORY[0x270EE20F0](inAudioFile, *(void *)&inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return MEMORY[0x270EE2118](inFileRef, inPermissions, *(void *)&inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadBytes(AudioFileID inAudioFile, Boolean inUseCache, SInt64 inStartingByte, UInt32 *ioNumBytes, void *outBuffer)
{
  return MEMORY[0x270EE2130](inAudioFile, inUseCache, inStartingByte, ioNumBytes, outBuffer);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
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

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
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

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50D8](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringTrim(CFMutableStringRef theString, CFStringRef trimString)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int vdprintf(int a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA68](*(void *)&a1, a2, a3);
}