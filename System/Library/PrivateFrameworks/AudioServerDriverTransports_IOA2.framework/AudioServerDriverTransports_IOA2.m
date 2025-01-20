void sub_248A1CC5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_248A1CD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)ASDTIOA2BlockControl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_248A1CE78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A1D0C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  std::mutex::unlock(v3);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_248A1D320(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A1D510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  std::mutex::unlock(v4);
  _Unwind_Resume(a1);
}

void sub_248A1D6A8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_248A1D8F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

ASDT::IOA2UserClient *ASDT::IOA2UserClient::IOA2UserClient(ASDT::IOA2UserClient *this)
{
  v2 = (ASDT::IOUserClient *)ASDT::IOUserClient::IOUserClient(this);
  *(void *)v2 = &unk_26FCADD48;
  if ((ASDT::IOUserClient::ConformsTo(v2, "IOAudio2Device") & 1) == 0)
  {
    ASDT::IOUserClient::operator=();
  }
  return this;
}

void sub_248A1D988(_Unwind_Exception *a1)
{
  ASDT::IOUserClient::~IOUserClient(v1);
  _Unwind_Resume(a1);
}

void anonymous namespace'::LogBadDevice(_anonymous_namespace_ *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  IOObjectGetClass((io_object_t)this, (char *)v8);
  v1 = ASDTIOA2LogType();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
}
  }

uint64_t ASDT::IOA2UserClient::operator=(uint64_t a1, _anonymous_namespace_ *object)
{
  if (object && !IOObjectConformsTo((io_object_t)object, "IOAudio2Device")) {
  ASDT::IOUserClient::operator=();
  }
  return a1;
}

void *ASDT::IOA2UserClient::IOA2UserClient(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  result = (void *)ASDT::IOUserClient::IOUserClient(this, a2);
  void *result = &unk_26FCADD48;
  return result;
}

{
  void *result;

  result = (void *)ASDT::IOUserClient::IOUserClient(this, a2);
  void *result = &unk_26FCADD48;
  return result;
}

void ASDT::IOA2UserClient::CopyDeviceUID(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"device UID", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

{
  applesauce::CF::TypeRef *v4;
  CFTypeRef cf;

  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"device UID", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (uint64_t)&cf, a2, v4);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1DB50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1DBD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *applesauce::CF::make_StringRef@<X0>(CFStringRef format@<X0>, applesauce::CF::StringRef *a2@<X8>, ...)
{
  va_start(va, a2);
  CFStringRef v4 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  if (!v4)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return applesauce::CF::StringRef::StringRef(a2, v4);
}

void sub_248A1DC54()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A1DC74(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void ASDT::IOA2UserClient::CopyDeviceName(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"device name", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1DD1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyDeviceManufacturer(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"device manufacturer", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1DDA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetTransportType(ASDT::IOA2UserClient *this)
{
  unsigned int v4 = 0;
  applesauce::CF::make_StringRef(@"transport type", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1DE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOUserClient::CopyProperty<unsigned int>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1DE9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetClockDomain(ASDT::IOA2UserClient *this)
{
  unsigned int v4 = 0;
  applesauce::CF::make_StringRef(@"clock domain", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1DF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOA2UserClient::GetLatency(ASDT::IOA2UserClient *this, int a2)
{
  unsigned int v7 = 0;
  if (a2) {
    CFStringRef v3 = @"input latency";
  }
  else {
    CFStringRef v3 = @"output latency";
  }
  applesauce::CF::make_StringRef(v3, (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  uint64_t v4 = v7;
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1DF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOA2UserClient::GetRingBufferSize(ASDT::IOA2UserClient *this)
{
  unsigned int v4 = 0;
  applesauce::CF::make_StringRef(@"io buffer frame size", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1E00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOA2UserClient::GetSafetyOffset(ASDT::IOA2UserClient *this, int a2)
{
  unsigned int v7 = 0;
  if (a2) {
    CFStringRef v3 = @"input safety offset";
  }
  else {
    CFStringRef v3 = @"output safety offset";
  }
  applesauce::CF::make_StringRef(v3, (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  uint64_t v4 = v7;
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1E094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOA2UserClient::SupportsPreWarming(ASDT::IOA2UserClient *this)
{
  unsigned __int8 v4 = 0;
  applesauce::CF::make_StringRef(@"supports prewarming", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1E108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOUserClient::CopyProperty<BOOL>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1E180(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetNominalSampleRate(ASDT::IOA2UserClient *this)
{
  unsigned __int8 v4 = 0;
  applesauce::CF::make_StringRef(@"sample rate", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<long long>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return ASDT::IOAudio2::Helpers::Float64FromFixed64(v4);
}

void sub_248A1E1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOUserClient::CopyProperty<long long>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1E270(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::SetNominalSampleRate(ASDT::IOA2UserClient *this, double a2)
{
  uint64_t v6 = ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, a2);
  int v3 = ASDT::IOUserClient::CallMethod(this, 4, 0, 0, &v6, 8, 0, 0, 0, 0);
  if (v3)
  {
    unsigned __int8 v4 = ASDTIOA2LogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::SetNominalSampleRate();
    }
  }
  return v3 == 0;
}

uint64_t ASDT::IOA2UserClient::IsRunning(ASDT::IOA2UserClient *this)
{
  unsigned __int8 v4 = 0;
  applesauce::CF::make_StringRef(@"is running", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1E380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void ASDT::IOA2UserClient::CopyDefaultChannelLayout(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, const applesauce::CF::TypeRef *a3@<X8>)
{
  if (a2) {
    CFStringRef v5 = @"input channel layout";
  }
  else {
    CFStringRef v5 = @"output channel layout";
  }
  applesauce::CF::make_StringRef(v5, (applesauce::CF::StringRef *)&cf);
  *(void *)a3 = 0;
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a3);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1E404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::ArrayRef::~ArrayRef(v10);
  applesauce::CF::StringRef::~StringRef(&a10);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1E484(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void ASDT::IOA2UserClient::CopyDefaultChannelLayoutData(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, applesauce::CF::DataRef *a3@<X8>)
{
  ASDT::IOA2UserClient::CopyDefaultChannelLayout(this, a2, (const applesauce::CF::TypeRef *)&theArray);
  if (theArray)
  {
    unsigned int Count = CFArrayGetCount(theArray);
    unsigned int v5 = Count;
    if (Count <= 1) {
      unsigned int v6 = 1;
    }
    else {
      unsigned int v6 = Count;
    }
    __x[0] = 0;
    std::vector<char>::vector(&v24, 20 * v6 + 12, __x);
    std::vector<char>::pointer begin = v24.__begin_;
    *(void *)v24.__begin_ = 0;
    *((_DWORD *)begin + 2) = v5;
    v8 = (char *)(v24.__end_ - begin);
    if ((v24.__end_ - begin - 12) / 0x14uLL < v5) {
      __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
    }
    if (v5)
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      do
      {
        if (!theArray)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        int valuePtr = -1;
        CFTypeRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        if (!cf)
        {
          v17 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](v17, "Could not construct");
          __cxa_throw(v17, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        applesauce::CF::at_or<applesauce::CF::NumberRef>(theArray, v10, &cf, __x);
        if (!*(void *)__x)
        {
          v16 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](v16, "Could not construct");
          __cxa_throw(v16, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        int v11 = applesauce::CF::convert_to<unsigned int,0>(*(const __CFNumber **)__x);
        unint64_t v12 = *((unsigned int *)v24.__begin_ + 2);
        if (v12 > (v24.__end_ - v24.__begin_ - 12) / 0x14uLL) {
          __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
        }
        if (v10 >= v12)
        {
          v19 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v19, "accessing a CA::ChannelLayout with an out-of-range index");
          v19->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
          __cxa_throw(v19, (struct type_info *)off_265246140, MEMORY[0x263F8C068]);
        }
        *(_DWORD *)&v24.__begin_[v9 + 12] = v11;
        if (*(void *)__x) {
          CFRelease(*(CFTypeRef *)__x);
        }
        if (cf) {
          CFRelease(cf);
        }
        std::vector<char>::pointer begin = v24.__begin_;
        unint64_t v13 = *((unsigned int *)v24.__begin_ + 2);
        v8 = (char *)(v24.__end_ - v24.__begin_);
        if (v13 > (v24.__end_ - v24.__begin_ - 12) / 0x14uLL) {
          __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
        }
        if (v10 >= v13)
        {
          v20 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v20, "accessing a CA::ChannelLayout with an out-of-range index");
          v20->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
          __cxa_throw(v20, (struct type_info *)off_265246140, MEMORY[0x263F8C068]);
        }
        ++v10;
        v14 = &v24.__begin_[v9];
        *((void *)v14 + 2) = 0;
        *((void *)v14 + 3) = 0;
        v9 += 20;
      }
      while (v10 < v13);
    }
    CFDataRef v15 = CFDataCreate(0, (const UInt8 *)begin, (CFIndex)v8);
    if (!v15)
    {
      v21 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](v21, "Could not construct");
      __cxa_throw(v21, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    applesauce::CF::DataRef::DataRef(a3, v15);
    if (v24.__begin_)
    {
      v24.__end_ = v24.__begin_;
      operator delete(v24.__begin_);
    }
    if (theArray) {
      CFRelease(theArray);
    }
  }
  else
  {
    *(void *)a3 = 0;
  }
}

void sub_248A1E894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf, char a11, void *__p, uint64_t a13, uint64_t a14, const void *a15)
{
  __cxa_free_exception(v15);
  if (__p) {
    operator delete(__p);
  }
  applesauce::CF::ArrayRef::~ArrayRef(&a15);
  _Unwind_Resume(a1);
}

void applesauce::CF::NumberRef::~NumberRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

BOOL ASDT::IOA2UserClient::WantsDoIOTrapCall(ASDT::IOA2UserClient *this, int a2)
{
  if (a2) {
    CFStringRef v3 = @"wants input trap";
  }
  else {
    CFStringRef v3 = @"wants output trap";
  }
  applesauce::CF::make_StringRef(v3, (applesauce::CF::StringRef *)&cf);
  unsigned __int8 v6 = 0;
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v6);
  int v4 = v6;
  if (cf) {
    CFRelease(cf);
  }
  return v4 != 0;
}

void sub_248A1EA04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetHogModeOwner(ASDT::IOA2UserClient *this)
{
  unsigned int v7 = -1;
  applesauce::CF::make_StringRef(@"exclusive access owner", (applesauce::CF::StringRef *)cf);
  int v2 = ASDT::IOUserClient::CopyProperty<int>(this, (const applesauce::CF::StringRef *)cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (v2)
  {
    caulk::platform::process_name((caulk::platform *)v7);
    if (v6 < 0)
    {
      CFTypeRef v4 = cf[1];
      operator delete((void *)cf[0]);
      if (v4) {
        return v7;
      }
      goto LABEL_6;
    }
    if (!v6)
    {
LABEL_6:
      unsigned int v7 = -1;
      ASDT::IOA2UserClient::SetHogModeOwner(this);
    }
  }
  return v7;
}

void sub_248A1EAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOUserClient::CopyProperty<int>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1EB38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::SetHogModeOwner(ASDT::IOA2UserClient *this)
{
  applesauce::CF::make_StringRef(@"exclusive access owner", (applesauce::CF::StringRef *)&cf);
  uint64_t v2 = ASDT::IOUserClient::SetProperty(this, (const applesauce::CF::StringRef *)&cf);
  if (cf) {
    CFRelease(cf);
  }
  return v2;
}

void sub_248A1EBB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyHeadsetInfo(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"headset info", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1EC24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::DictionaryRef::~DictionaryRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1ECAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyCustomPropertyInfo(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"custom property info", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1ED20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::SupportsClientDescription(ASDT::IOA2UserClient *this)
{
  unsigned __int8 v4 = 0;
  applesauce::CF::make_StringRef(@"supports client description", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1EDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

BOOL ASDT::IOA2UserClient::SetClientDescription(ASDT::IOA2UserClient *this, unint64_t a2, double a3)
{
  v7[2] = *MEMORY[0x263EF8340];
  v7[0] = a2;
  v7[1] = ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, a3);
  int v4 = ASDT::IOUserClient::CallMethod(this, 12, v7, 2, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    uint64_t v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::SetClientDescription();
    }
  }
  return v4 == 0;
}

uint64_t ASDT::IOA2UserClient::SupportsInputStreamInjection(ASDT::IOA2UserClient *this)
{
  unsigned __int8 v4 = 0;
  applesauce::CF::make_StringRef(@"input stream injection", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v4);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A1EEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void sub_248A1EF50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::StringRef::~StringRef(v2);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(ASDT::IOUserClient *a1, uint64_t a2, const applesauce::CF::TypeRef *a3, applesauce::CF::TypeRef *a4)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (const applesauce::CF::StringRef *)&cf, a4)) {
    uint64_t v6 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v5);
  }
  else {
    uint64_t v6 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_248A1EFD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::IsPrivate(ASDT::IOA2UserClient *this)
{
  unsigned __int8 v5 = 0;
  applesauce::CF::make_StringRef(@"is private", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<BOOL>(this, (uint64_t)&cf, (const applesauce::CF::TypeRef *)&v5, v2);
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A1F04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

uint64_t ASDT::IOUserClient::CopyProperty<BOOL>(ASDT::IOUserClient *a1, uint64_t a2, const applesauce::CF::TypeRef *a3, applesauce::CF::TypeRef *a4)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (const applesauce::CF::StringRef *)&cf, a4)) {
    uint64_t v6 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v5);
  }
  else {
    uint64_t v6 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_248A1F0C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyStreamList(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, const applesauce::CF::TypeRef *a3@<X8>)
{
  *(void *)a3 = 0;
  if (a2) {
    CFStringRef v5 = @"input streams";
  }
  else {
    CFStringRef v5 = @"output streams";
  }
  applesauce::CF::make_StringRef(v5, (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a3);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A1F148(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

CFIndex ASDT::IOA2UserClient::GetNumberStreams(ASDT::IOA2UserClient *this, int a2)
{
  ASDT::IOA2UserClient::CopyStreamList(this, a2, (const applesauce::CF::TypeRef *)&theArray);
  if (!theArray) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (theArray) {
    CFRelease(theArray);
  }
  return Count;
}

void ASDT::IOA2UserClient::CopyStreamDictionaryByIndex(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, unsigned int a3@<W2>, void *a4@<X8>)
{
  uint64_t v10 = 0;
  ASDT::IOA2UserClient::CopyStreamList(this, a2, (const applesauce::CF::TypeRef *)&v9);
  if (v9)
  {
    applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>((const __CFArray *)v9, a3, &cf);
    if (v8)
    {
      CFTypeRef v6 = cf;
      if (cf) {
        CFRetain(cf);
      }
      *a4 = v6;
    }
    else
    {
      *a4 = 0;
      uint64_t v10 = 0;
    }
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    *a4 = 0;
  }
}

void sub_248A1F260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyStreamDictionaryByID(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  CFTypeRef v10 = 0;
  unsigned int v9 = 0;
  ASDT::IOA2UserClient::CopyStreamList(this, 1, (const applesauce::CF::TypeRef *)&v7);
  CopyStreamDictionaryByIDFromList(&v7, &v9, a2, (applesauce::CF::DictionaryRef *)&cf);
  CFTypeRef v6 = cf;
  CFTypeRef v10 = cf;
  CFTypeRef cf = 0;
  if (v7) {
    CFRelease(v7);
  }
  if (v6)
  {
    *(void *)a3 = v6;
  }
  else
  {
    ASDT::IOA2UserClient::CopyStreamList(this, 0, (const applesauce::CF::TypeRef *)&cf);
    CopyStreamDictionaryByIDFromList((CFArrayRef *)&cf, &v9, a2, a3);
    if (cf) {
      CFRelease(cf);
    }
  }
}

void sub_248A1F328(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  CFStringRef v3 = va_arg(va1, const void *);
  uint64_t v5 = va_arg(va1, void);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

const __CFArray *CopyStreamDictionaryByIDFromList@<X0>(CFArrayRef *a1@<X0>, unsigned int *a2@<X2>, int a3@<W1>, applesauce::CF::DictionaryRef *a4@<X8>)
{
  uint64_t v24 = 0;
  *a2 = -1;
  CFArrayRef result = *a1;
  if (result)
  {
    CFArrayRef v21 = result;
    CFArrayRef v22 = 0;
    unsigned int v9 = 0;
    CFIndex Count = CFArrayGetCount(result);
    while (1)
    {
      CFArrayRef v10 = *a1;
      CFArrayRef result = *a1 ? (const __CFArray *)CFArrayGetCount(*a1) : 0;
      if (!v21 || v22 == (const __CFArray *)Count) {
        break;
      }
      if (v21 == v10 && v22 == result) {
        break;
      }
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v21, &cf);
      BOOL v14 = 0;
      if (cf)
      {
        CFTypeID v13 = CFGetTypeID(cf);
        if (v13 == CFDictionaryGetTypeID()) {
          BOOL v14 = 1;
        }
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v14)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v21, (unint64_t)v22, &cf);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, a4);
        if (cf) {
          CFRelease(cf);
        }
        if (!*(void *)a4)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        applesauce::CF::make_StringRef(@"stream ID", (applesauce::CF::StringRef *)&v18);
        applesauce::CF::details::find_at_key_or_optional<applesauce::CF::NumberRef,applesauce::CF::StringRef>(*(const __CFDictionary **)a4, &v18, &cf);
        if (v18) {
          CFRelease(v18);
        }
        if (v20)
        {
          if (!cf)
          {
            v17 = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x24C588600](v17, "Could not construct");
            __cxa_throw(v17, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          uint64_t v15 = applesauce::CF::convert_as<unsigned int,0>((const __CFNumber *)cf);
          if ((v15 & 0xFF00000000) != 0 && v15 == a3)
          {
            *a2 = v9;
            return (const __CFArray *)std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
          }
        }
        std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
        if (*(void *)a4) {
          CFRelease(*(CFTypeRef *)a4);
        }
      }
      CFArrayRef v22 = (const __CFArray *)((char *)v22 + 1);
      ++v9;
    }
  }
  *(void *)a4 = 0;
  return result;
}

void sub_248A1F584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::DictionaryRef::~DictionaryRef(v3);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_ID(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  uint64_t v7 = this;
  applesauce::CF::make_StringRef(@"stream ID", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v7, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) == 0) {
    return 0;
  }
  *(_DWORD *)a2 = v4;
  return 1;
}

void *applesauce::CF::DictionaryRef::operator->(void *result)
{
  if (!*result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_248A1F6C0()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A1F6E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const __CFDictionary *applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(const __CFDictionary ***a1, const void **a2)
{
  CFDictionaryRef result = applesauce::CF::details::at_key<applesauce::CF::StringRef>(**a1, a2);
  if (result)
  {
    return (const __CFDictionary *)applesauce::CF::convert_as<unsigned int,0>(result);
  }
  return result;
}

void ASDT::IOA2UserClient::ConstructDictionaryFromASBD(ASDT::IOA2UserClient *this@<X0>, CFDictionaryRef *a2@<X8>)
{
  v20[0] = 0;
  v20[1] = 0;
  v19 = (uint64_t *)v20;
  uint64_t v5 = (const void *)ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, *(double *)this);
  applesauce::CF::make_StringRef(@"sample rate", (applesauce::CF::StringRef *)&v18);
  CFTypeRef valuePtr = v5;
  CFTypeRef cf = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &v18, &v18, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (v18) {
    CFRelease(v18);
  }
  applesauce::CF::make_StringRef(@"format ID", (applesauce::CF::StringRef *)&valuePtr, cf);
  LODWORD(cf) = *((_DWORD *)this + 2);
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    uint64_t v10 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v10, "Could not construct");
    __cxa_throw(v10, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  int v7 = *((_DWORD *)this + 2);
  int v6 = *((_DWORD *)this + 3);
  applesauce::CF::make_StringRef(@"format flags", (applesauce::CF::StringRef *)&valuePtr);
  int v8 = v6 | 0x40;
  if (v7 != 1819304813) {
    int v8 = v6;
  }
  LODWORD(cf) = v8;
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    int v11 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v11, "Could not construct");
    __cxa_throw(v11, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  applesauce::CF::make_StringRef(@"bytes per packet", (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 4);
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    unint64_t v12 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v12, "Could not construct");
    __cxa_throw(v12, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  applesauce::CF::make_StringRef(@"frames per packet", (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 5);
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    CFTypeID v13 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v13, "Could not construct");
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  applesauce::CF::make_StringRef(@"bytes per frame", (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 6);
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    BOOL v14 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v14, "Could not construct");
    __cxa_throw(v14, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  applesauce::CF::make_StringRef(@"channels per frame", (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 7);
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    uint64_t v15 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v15, "Could not construct");
    __cxa_throw(v15, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  applesauce::CF::make_StringRef(@"bits per channel", (applesauce::CF::StringRef *)&valuePtr);
  LODWORD(cf) = *((_DWORD *)this + 8);
  CFTypeRef v18 = CFNumberCreate(0, kCFNumberIntType, &cf);
  if (!v18)
  {
    v16 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v16, "Could not construct");
    __cxa_throw(v16, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(&v19, &valuePtr, &valuePtr, &v18);
  if (v18) {
    CFRelease(v18);
  }
  if (valuePtr) {
    CFRelease(valuePtr);
  }
  applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>((CFTypeRef **)&v19, a2);
  std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy((uint64_t)&v19, v20[0]);
}

void sub_248A1FC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef a9, CFTypeRef cf, char a11, void *a12, uint64_t a13, const void *a14)
{
}

void applesauce::CF::make_DictionaryRef<applesauce::CF::StringRef,applesauce::CF::TypeRef>(CFTypeRef **a1@<X0>, CFDictionaryRef *a2@<X8>)
{
  memset(v11, 0, sizeof(v11));
  std::vector<applesauce::CF::TypeRefPair>::reserve((uint64_t *)v11, (unint64_t)a1[2]);
  int v6 = *a1;
  CFDictionaryRef v4 = a1 + 1;
  uint64_t v5 = v6;
  if (v6 != (CFTypeRef *)v4)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>((uint64_t *)v11, v5 + 4, v5 + 5);
      int v7 = (CFTypeRef *)v5[1];
      if (v7)
      {
        do
        {
          int v8 = (CFTypeRef **)v7;
          int v7 = (CFTypeRef *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (CFTypeRef **)v5[2];
          BOOL v9 = *v8 == v5;
          uint64_t v5 = (CFTypeRef *)v8;
        }
        while (!v9);
      }
      uint64_t v5 = (CFTypeRef *)v8;
    }
    while (v8 != v4);
  }
  CFDictionaryRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef(v11);
  unint64_t v12 = v11;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  *a2 = CFDictionaryRef;
}

void sub_248A1FF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ConstructASBDFromDictionary(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, AudioStreamBasicDescription *a3)
{
  if (!*this) {
    return 0;
  }
  *((void *)a2 + 4) = 0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  if (!*this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(@"sample rate", (applesauce::CF::StringRef *)&cf);
  uint64_t v5 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(*this, &cf);
  char v7 = v6;
  if (cf) {
    CFRelease(cf);
  }
  if (!v7) {
    return 0;
  }
  ASDT::IOAudio2::Helpers::Float64FromFixed64(v5);
  *(void *)a2 = v8;
  return FillBasicFormatInfoFromDict(this, (AudioStreamBasicDescription *)a2);
}

void sub_248A20014()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A20034(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t FillBasicFormatInfoFromDict(const __CFDictionary **a1, AudioStreamBasicDescription *a2)
{
  if (!*a1)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(@"format ID", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mFormatID = v4;
  if (!*a1)
  {
    CFTypeID v13 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v13);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(@"format flags", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v5 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v5 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mFormatFlags = v5;
  if (!*a1)
  {
    BOOL v14 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v14);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(@"bytes per packet", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v6 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v6 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mBytesPerPacket = v6;
  if (!*a1)
  {
    uint64_t v15 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v15);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(@"frames per packet", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v7 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v7 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mFramesPerPacket = v7;
  if (!*a1)
  {
    v16 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v16);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(@"bytes per frame", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v8 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v8 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mBytesPerFrame = v8;
  if (!*a1)
  {
    v17 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v17);
  }
  v19 = a1;
  applesauce::CF::make_StringRef(@"channels per frame", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v9 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v9 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mChannelsPerFrame = v9;
  v19 = (const __CFDictionary **)applesauce::CF::DictionaryRef::operator->(a1);
  applesauce::CF::make_StringRef(@"bits per channel", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v10 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v19, &cf);
  applesauce::CF::StringRef::~StringRef(&cf);
  if (((unint64_t)v10 & 0xFF00000000) == 0) {
    return 0;
  }
  a2->mBitsPerChannel = v10;
  if (a2->mFormatID == 1819304813) {
    a2->mFormatFlags &= ~0x40u;
  }
  return 1;
}

void sub_248A20330(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ConstructASRDFromDictionary(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, AudioStreamRangedDescription *a3)
{
  if (!*this) {
    return 0;
  }
  *((void *)a2 + 6) = 0;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *(_OWORD *)a2 = 0u;
  if (!*this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(@"min sample rate", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v5 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(*this, &cf);
  char v7 = v6;
  if (cf) {
    CFRelease(cf);
  }
  if (!v7) {
    return 0;
  }
  ASDT::IOAudio2::Helpers::Float64FromFixed64(v5);
  *((void *)a2 + 5) = v8;
  if (!*this)
  {
    v17 = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(v17);
  }
  applesauce::CF::make_StringRef(@"max sample rate", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v9 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(*this, &cf);
  char v11 = v10;
  if (cf) {
    CFRelease(cf);
  }
  if (!v11) {
    return 0;
  }
  ASDT::IOAudio2::Helpers::Float64FromFixed64(v9);
  *((double *)a2 + 6) = v12;
  BOOL v13 = *((double *)a2 + 5) == v12;
  uint64_t v14 = 0;
  if (v13) {
    uint64_t v14 = *((void *)a2 + 5);
  }
  *(void *)a2 = v14;
  return FillBasicFormatInfoFromDict(this, (AudioStreamBasicDescription *)a2);
}

void sub_248A204C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::BestMatchForFormat(CFArrayRef *this, const applesauce::CF::ArrayRef *a2, AudioStreamRangedDescription *a3, AudioStreamBasicDescription *a4)
{
  long long v6 = *(_OWORD *)&a3->mFormat.mBytesPerPacket;
  long long v30 = *(_OWORD *)&a3->mFormat.mSampleRate;
  long long v31 = v6;
  uint64_t v32 = *(void *)&a3->mFormat.mBitsPerChannel;
  CFTypeRef v29 = 0;
  *(void *)&long long v30 = 0;
  if (a3->mFormat.mSampleRate == 0.0) {
    double mSampleRate = *(double *)a2;
  }
  else {
    double mSampleRate = a3->mFormat.mSampleRate;
  }
  CFArrayRef Count = *this;
  CFArrayRef v26 = Count;
  CFArrayRef v27 = 0;
  if (Count) {
    CFArrayRef Count = (const __CFArray *)CFArrayGetCount(Count);
  }
  char v9 = 0;
  CFArrayRef v28 = Count;
  while (1)
  {
    CFArrayRef v10 = *this;
    CFIndex v11 = *this ? CFArrayGetCount(*this) : 0;
    if (!v26 || v27 == v28) {
      break;
    }
    if (v26 == v10 && v27 == (const __CFArray *)v11) {
      break;
    }
    applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v26, &cf);
    BOOL v15 = 0;
    if (*(void *)&cf.mSampleRate)
    {
      CFTypeID v14 = CFGetTypeID(*(CFTypeRef *)&cf.mSampleRate);
      if (v14 == CFDictionaryGetTypeID()) {
        BOOL v15 = 1;
      }
    }
    if (*(void *)&cf.mSampleRate) {
      CFRelease(*(CFTypeRef *)&cf.mSampleRate);
    }
    if (v15)
    {
      applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v26, (unint64_t)v27, &cf);
      applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef((const void **)&cf, (applesauce::CF::DictionaryRef *)&v25);
      if (*(void *)&cf.mSampleRate) {
        CFRelease(*(CFTypeRef *)&cf.mSampleRate);
      }
      if (ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&v25, (const applesauce::CF::DictionaryRef *)&cf, v16))
      {
        if (!v29)
        {
          CFTypeRef v29 = v25;
          if (v25) {
            CFRetain(v25);
          }
        }
        if ((*(double *)&v30 == 0.0 || cf.mSampleRate == 0.0 || *(double *)&v30 == cf.mSampleRate)
          && (!DWORD2(v30) || !cf.mFormatID || DWORD2(v30) == cf.mFormatID)
          && (!v31 || !cf.mBytesPerPacket || v31 == cf.mBytesPerPacket)
          && (!DWORD1(v31) || !cf.mFramesPerPacket || DWORD1(v31) == cf.mFramesPerPacket)
          && (!DWORD2(v31) || !cf.mBytesPerFrame || DWORD2(v31) == cf.mBytesPerFrame)
          && (!HIDWORD(v31) || !cf.mChannelsPerFrame || HIDWORD(v31) == cf.mChannelsPerFrame)
          && (!v32 || !cf.mBitsPerChannel || v32 == cf.mBitsPerChannel)
          && CA::Implementation::EquivalentFormatFlags((CA::Implementation *)&v30, &cf, 0, 1)
          && v24[0] <= mSampleRate
          && v24[1] >= mSampleRate)
        {
          long long v17 = *(_OWORD *)&cf.mBytesPerPacket;
          *(_OWORD *)&a3->mFormat.double mSampleRate = *(_OWORD *)&cf.mSampleRate;
          *(_OWORD *)&a3->mFormat.mBytesPerPacket = v17;
          *(void *)&a3->mFormat.mBitsPerChannel = *(void *)&cf.mBitsPerChannel;
          a3->mFormat.double mSampleRate = mSampleRate;
          char v9 = 1;
        }
      }
      if (v25) {
        CFRelease(v25);
      }
    }
    CFArrayRef v27 = (const __CFArray *)((char *)v27 + 1);
  }
  if (v9) {
    goto LABEL_62;
  }
  if (ASDT::IOA2UserClient::ConstructASRDFromDictionary((const __CFDictionary **)&v29, (const applesauce::CF::DictionaryRef *)&cf, a3))
  {
    long long v19 = *(_OWORD *)&cf.mBytesPerPacket;
    *(_OWORD *)&a3->mFormat.double mSampleRate = *(_OWORD *)&cf.mSampleRate;
    *(_OWORD *)&a3->mFormat.mBytesPerPacket = v19;
    *(void *)&a3->mFormat.mBitsPerChannel = *(void *)&cf.mBitsPerChannel;
    ASDT::ValueRange::PickCommonSampleRate((ASDT::ValueRange *)v24, v18);
    a3->mFormat.double mSampleRate = v20;
LABEL_62:
    uint64_t v21 = 1;
    goto LABEL_64;
  }
  uint64_t v21 = 0;
LABEL_64:
  if (v29) {
    CFRelease(v29);
  }
  return v21;
}

void sub_248A20798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->(uint64_t a1@<X0>, void *a2@<X8>)
{
  applesauce::CF::details::at_to<applesauce::CF::TypeRef>(*(const __CFArray **)a1, *(void *)(a1 + 8), &cf);
  applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::iterator_proxy::iterator_proxy(a2, &cf);
  if (cf) {
    CFRelease(cf);
  }
}

applesauce::CF::DictionaryRef *applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef@<X0>(const void **a1@<X0>, applesauce::CF::DictionaryRef *a2@<X8>)
{
  CFDictionaryRef v4 = *a1;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(v4);
    if (v5 != CFDictionaryGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    long long v6 = *a1;
    if (v6) {
      CFRetain(v6);
    }
  }
  else
  {
    long long v6 = 0;
  }
  return applesauce::CF::DictionaryRef::DictionaryRef(a2, v6);
}

void sub_248A208D0()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A208F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, AudioStreamBasicDescription *a3)
{
  if (*this)
  {
    applesauce::CF::make_StringRef(@"current format", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::DictionaryRef,applesauce::CF::StringRef>(*this, &cf, &v11);
    if (cf) {
      CFRelease(cf);
    }
    if (v12)
    {
      if (ASDT::IOA2UserClient::ConstructASBDFromDictionary(&v11, a2, v5))
      {
        uint64_t v6 = 1;
LABEL_13:
        std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v11);
        return v6;
      }
      uint64_t v8 = ASDTIOA2LogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat();
      }
    }
    else
    {
      char v7 = ASDTIOA2LogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat();
      }
    }
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  return 0;
}

void sub_248A20A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v10 = 0;
  if (*this)
  {
    CFDictionaryRef v4 = this;
    applesauce::CF::make_StringRef(@"available formats", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v8);
    if (cf) {
      CFRelease(cf);
    }
    if (v9)
    {
      CFTypeRef v5 = v8;
      if (v8) {
        CFRetain(v8);
      }
    }
    else
    {
      uint64_t v6 = ASDTIOA2LogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats();
      }
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v8);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A20AF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va1);
  _Unwind_Resume(a1);
}

const __CFDictionary *ASDT::IOA2UserClient::GetStreamInfo_StartingChannel(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  uint64_t v6 = this;
  applesauce::CF::make_StringRef(@"starting channel", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v6, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) == 0)
  {
    uint64_t v3 = ASDTIOA2LogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::GetStreamInfo_StartingChannel();
    }
    return 0;
  }
  return v2;
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_Latency(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  return 0;
}

uint64_t ASDT::IOA2UserClient::GetStreamInfo_TerminalType(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  uint64_t v5 = this;
  applesauce::CF::make_StringRef(@"terminal type", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

BOOL ASDT::IOA2UserClient::GetStreamInfo_UsesIsolatedIO(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*(void *)this) {
    return 0;
  }
  CFTypeRef v9 = this;
  applesauce::CF::make_StringRef(@"uses isolated IO", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v3 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v9, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v3 & 0xFF00000000) != 0) {
    return v3 != 0;
  }
  if (!*(void *)this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(@"uses isolated IO", (applesauce::CF::StringRef *)&v9);
  unsigned __int16 v5 = applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(*(const __CFDictionary **)this, &v9);
  if (v9) {
    CFRelease(v9);
  }
  return (_BYTE)v5 && v5 > 0xFFu;
}

void sub_248A20CFC()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A20D1C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MapIOBufferForStream(ASDT::IOA2UserClient *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  ASDT::IOA2UserClient::CopyStreamDictionaryByID(this, a2, (applesauce::CF::DictionaryRef *)&v16);
  if (v16)
  {
    unsigned int v15 = 1;
    applesauce::CF::make_StringRef(@"buffer mapping options", (applesauce::CF::StringRef *)&cf);
    uint64_t v8 = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>((const __CFDictionary *)v16, &cf, &v15);
    unsigned int v15 = v8;
    if (cf)
    {
      CFRelease(cf);
      uint64_t v8 = v15;
    }
    CFTypeRef v9 = (unsigned __int8 *)ASDT::IOUserClient::MapMemory(this, (a2 + 0x10000000), v8, a3);
    *a4 = v9;
    BOOL v10 = v9 != 0;
    if (!v9)
    {
      CFDictionaryRef v11 = ASDTIOA2LogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::MapIOBufferForStream();
      }
    }
  }
  else
  {
    char v12 = ASDTIOA2LogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MapIOBufferForStream();
    }
    BOOL v10 = 0;
  }
  if (v16) {
    CFRelease(v16);
  }
  return v10;
}

void sub_248A20E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::SetStreamActive(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int a3)
{
  v16[2] = *MEMORY[0x263EF8340];
  v16[0] = a2;
  v16[1] = a3;
  int v6 = ASDT::IOUserClient::CallMethod(this, 6, v16, 2, 0, 0, 0, 0, 0, 0);
  if (v6)
  {
    char v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      CFTypeRef v9 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        CFTypeRef v9 = (void *)*v9;
      }
      *(_DWORD *)buf = 136315650;
      CFDictionaryRef v11 = v9;
      __int16 v12 = 1024;
      unsigned int v13 = a2;
      __int16 v14 = 1024;
      unsigned int v15 = a3;
      _os_log_error_impl(&dword_248A1B000, v7, OS_LOG_TYPE_ERROR, "%s: SetStreamActive(%u, %hhu)", buf, 0x18u);
    }
  }
  return v6 == 0;
}

void ASDT::IOA2UserClient::CopyControlList(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"controls", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A20FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyControlDictionaryByIndex(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, void *a3@<X8>)
{
  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&cf);
  ASDT::IOA2UserClient::CopyControlDictionaryByIndex((const __CFArray **)&cf, a2, a3);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A21068(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

const __CFArray *ASDT::IOA2UserClient::CopyControlDictionaryByIndex@<X0>(const __CFArray **this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, void *a3@<X8>)
{
  uint64_t v11 = 0;
  CFArrayRef result = *this;
  if (result
    && (unsigned int v6 = a2, result = (const __CFArray *)CFArrayGetCount(result), (unint64_t)result > v6))
  {
    if (!*this)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>(*this, v6, &cf);
    if (v10)
    {
      CFTypeRef v7 = cf;
      if (cf) {
        CFRetain(cf);
      }
    }
    else
    {
      CFTypeRef v7 = 0;
    }
    *a3 = v7;
    return (const __CFArray *)std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

void sub_248A21154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UserClient::CopyControlDictionaryByID(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  int v6 = 0;
  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&cf);
  ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&cf, a2, &v6, a3);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A211D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void ASDT::IOA2UserClient::CopyControlDictionaryByID(CFArrayRef *this@<X0>, const applesauce::CF::ArrayRef *a2@<X1>, _DWORD *a3@<X2>, applesauce::CF::DictionaryRef *a4@<X8>)
{
  uint64_t v24 = 0;
  *a3 = 0x7FFFFFFF;
  CFArrayRef v7 = *this;
  if (v7)
  {
    int v9 = (int)a2;
    CFArrayRef v21 = v7;
    unint64_t v22 = 0;
    int v10 = 0;
    CFIndex Count = CFArrayGetCount(v7);
    while (1)
    {
      CFArrayRef v11 = *this;
      CFIndex v12 = *this ? CFArrayGetCount(*this) : 0;
      if (!v21 || v22 == Count) {
        break;
      }
      if (v21 == v11 && v22 == v12) {
        break;
      }
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v21, &cf);
      BOOL v16 = 0;
      if (cf)
      {
        CFTypeID v15 = CFGetTypeID(cf);
        if (v15 == CFDictionaryGetTypeID()) {
          BOOL v16 = 1;
        }
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v16)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v21, v22, &cf);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, a4);
        if (cf) {
          CFRelease(cf);
        }
        if (!*(void *)a4)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        CFTypeRef cf = a4;
        applesauce::CF::make_StringRef(@"control ID", (applesauce::CF::StringRef *)&v19);
        CFDictionaryRef v17 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v19);
        if (v19) {
          CFRelease(v19);
        }
        if (((unint64_t)v17 & 0xFF00000000) != 0 && v17 == v9)
        {
          *a3 = v10;
          return;
        }
        if (*(void *)a4) {
          CFRelease(*(CFTypeRef *)a4);
        }
      }
      ++v22;
      ++v10;
    }
  }
  *(void *)a4 = 0;
}

void sub_248A213B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  applesauce::CF::DictionaryRef::~DictionaryRef(v6);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetControlDictionaryIndexByID(CFArrayRef *this, const applesauce::CF::ArrayRef *a2, _DWORD *a3, unsigned int *a4)
{
  ASDT::IOA2UserClient::CopyControlDictionaryByID(this, a2, a3, (applesauce::CF::DictionaryRef *)&cf);
  CFTypeRef v4 = cf;
  if (cf) {
    CFRelease(cf);
  }
  return v4 != 0;
}

const __CFDictionary *ASDT::IOA2UserClient::GetControlInfo_BaseClass(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  int v6 = this;
  applesauce::CF::make_StringRef(@"base class", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v6, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) == 0)
  {
    CFDictionaryRef v3 = ASDTIOA2LogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::GetControlInfo_BaseClass();
    }
    return 0;
  }
  return v2;
}

const __CFDictionary *ASDT::IOA2UserClient::GetControlInfo_Class(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  int v6 = this;
  applesauce::CF::make_StringRef(@"class", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v6, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) == 0)
  {
    CFDictionaryRef v3 = ASDTIOA2LogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::GetControlInfo_Class();
    }
    return 0;
  }
  return v2;
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Scope(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  uint64_t v2 = 1735159650;
  if (*this)
  {
    int v6 = this;
    applesauce::CF::make_StringRef(@"scope", (applesauce::CF::StringRef *)&cf);
    CFDictionaryRef v3 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v6, &cf);
    if (cf) {
      CFRelease(cf);
    }
    if (((unint64_t)v3 & 0xFF00000000) != 0) {
      return v3;
    }
    else {
      return 1735159650;
    }
  }
  return v2;
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Element(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  unsigned __int16 v5 = this;
  applesauce::CF::make_StringRef(@"element", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

BOOL ASDT::IOA2UserClient::GetControlInfo_IsReadOnly(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*(void *)this) {
    return 0;
  }
  CFTypeRef v9 = this;
  applesauce::CF::make_StringRef(@"read only", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v3 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v9, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v3 & 0xFF00000000) != 0) {
    return v3 != 0;
  }
  if (!*(void *)this)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(@"read only", (applesauce::CF::StringRef *)&v9);
  unsigned __int16 v5 = applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(*(const __CFDictionary **)this, &v9);
  if (v9) {
    CFRelease(v9);
  }
  return (_BYTE)v5 && v5 > 0xFFu;
}

void sub_248A21740()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A21760(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Variant(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  unsigned __int16 v5 = this;
  applesauce::CF::make_StringRef(@"variant", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

const __CFDictionary **ASDT::IOA2UserClient::CopyControlInfo_Name@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v9 = 0;
  if (*this)
  {
    CFTypeRef v4 = this;
    applesauce::CF::make_StringRef(@"name", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::StringRef,applesauce::CF::StringRef>(*v4, &cf, &v7);
    if (cf) {
      CFRelease(cf);
    }
    if (v8)
    {
      CFTypeRef v5 = v7;
      if (v7) {
        CFRetain(v7);
      }
    }
    else
    {
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v7);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A2188C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetControlInfo_Value(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*(void *)this) {
    return 0;
  }
  CFTypeRef v10 = this;
  applesauce::CF::make_StringRef(@"value", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v5 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v10, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v5 & 0xFF00000000) == 0)
  {
    if (!*(void *)this)
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    applesauce::CF::make_StringRef(@"value", (applesauce::CF::StringRef *)&v10);
    unsigned __int16 v6 = applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(*(const __CFDictionary **)this, &v10);
    if (v10) {
      CFRelease(v10);
    }
    if (v6 < 0x100u) {
      return 0;
    }
    LODWORD(v5) = v6;
  }
  *(_DWORD *)a2 = v5;
  return 1;
}

void sub_248A2197C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A2199C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopyControlInfo_PropertySelectors@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v9 = 0;
  if (*this)
  {
    CFTypeRef v4 = this;
    applesauce::CF::make_StringRef(@"property selectors", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v7);
    if (cf) {
      CFRelease(cf);
    }
    if (v8)
    {
      CFTypeRef v5 = v7;
      if (v7) {
        CFRetain(v7);
      }
    }
    else
    {
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v7);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A21A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  char v8 = this;
  applesauce::CF::make_StringRef(@"minimum value", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue();
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  char v8 = this;
  applesauce::CF::make_StringRef(@"maximum value", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue();
    return 0;
  }
  return result;
}

const __CFDictionary **ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v10 = 0;
  if (*this)
  {
    CFDictionaryRef v4 = this;
    applesauce::CF::make_StringRef(@"range map", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v8);
    if (cf) {
      CFRelease(cf);
    }
    if (v9)
    {
      CFTypeRef v5 = v8;
      if (v8) {
        CFRetain(v8);
      }
    }
    else
    {
      unsigned __int16 v6 = ASDTIOA2LogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap();
      }
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v8);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A21C54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetLevelControlInfo_TransferFunction(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2)
{
  if (!*this) {
    return 0;
  }
  uint64_t v5 = this;
  applesauce::CF::make_StringRef(@"transfer function", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v2 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v5, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v2 & 0xFF00000000) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

BOOL ASDT::IOA2UserClient::SetupVolumeCurve(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, ASDT::VolumeCurve *a3)
{
  ASDT::VolumeCurve::ResetRange(a2);
  ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap(this, &theArray);
  CFArrayRef v5 = theArray;
  if (theArray)
  {
    CFArrayRef v28 = theArray;
    int64_t v29 = 0;
    CFIndex Count = CFArrayGetCount(theArray);
    while (1)
    {
      CFArrayGetCount(v5);
      if (Count <= v29) {
        break;
      }
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v28, &cf);
      BOOL v8 = 0;
      if (cf)
      {
        CFTypeID v7 = CFGetTypeID(cf);
        if (v7 == CFDictionaryGetTypeID()) {
          BOOL v8 = 1;
        }
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v8)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v28, v29, &v26);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&v26, (applesauce::CF::DictionaryRef *)&cf);
        if (v26) {
          CFRelease(v26);
        }
        uint64_t v25 = 0;
        if (!cf)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        applesauce::CF::make_StringRef(@"start int value", (applesauce::CF::StringRef *)&v26);
        HIDWORD(v25) = applesauce::CF::at_or<int &,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26, (unsigned int *)&v25 + 1);
        if (v26) {
          CFRelease(v26);
        }
        if (!cf)
        {
          uint64_t v24 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](v24, "Could not construct");
          __cxa_throw(v24, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        applesauce::CF::make_StringRef(@"start db value", (applesauce::CF::StringRef *)&v26);
        CFBooleanRef v9 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26);
        if (v10) {
          CFArrayRef v11 = v9;
        }
        else {
          CFArrayRef v11 = 0;
        }
        if (v26) {
          CFRelease(v26);
        }
        if (!cf)
        {
          CFArrayRef v21 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](v21, "Could not construct");
          __cxa_throw(v21, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        applesauce::CF::make_StringRef(@"integer steps", (applesauce::CF::StringRef *)&v26);
        LODWORD(v25) = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26, (unsigned int *)&v25);
        if (v26) {
          CFRelease(v26);
        }
        if (!cf)
        {
          unint64_t v22 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](v22, "Could not construct");
          __cxa_throw(v22, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        applesauce::CF::make_StringRef(@"db per step", (applesauce::CF::StringRef *)&v26);
        CFBooleanRef v12 = applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>((const __CFDictionary *)cf, &v26);
        if (v13) {
          __int16 v14 = v12;
        }
        else {
          __int16 v14 = 0;
        }
        if (v26) {
          CFRelease(v26);
        }
        ASDT::IOAudio2::Helpers::Float64FromFixed64(v11);
        double v16 = v15;
        ASDT::IOAudio2::Helpers::Float64FromFixed64(v14);
        float v17 = v16;
        float v19 = v16 + (double)v25 * v18;
        ASDT::VolumeCurve::AddRange(a2, v17, v19);
        if (cf) {
          CFRelease(cf);
        }
      }
      ++v29;
    }
    ASDT::IOA2UserClient::GetLevelControlInfo_TransferFunction(this, v6);
    ASDT::VolumeCurve::SetTransferFunction(a2);
    CFRelease(v5);
  }
  return v5 != 0;
}

void sub_248A22050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v10 = 0;
  if (*this)
  {
    CFDictionaryRef v4 = this;
    applesauce::CF::make_StringRef(@"value", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v8);
    if (cf) {
      CFRelease(cf);
    }
    if (v9)
    {
      CFTypeRef v5 = v8;
      if (v8) {
        CFRetain(v8);
      }
    }
    else
    {
      unsigned __int16 v6 = ASDTIOA2LogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue();
      }
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v8);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A221AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va1);
  _Unwind_Resume(a1);
}

const __CFDictionary **ASDT::IOA2UserClient::CopySelectorControlInfo_SelectorMap@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v10 = 0;
  if (*this)
  {
    CFDictionaryRef v4 = this;
    applesauce::CF::make_StringRef(@"selectors", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(*v4, &cf, &v8);
    if (cf) {
      CFRelease(cf);
    }
    if (v9)
    {
      CFTypeRef v5 = v8;
      if (v8) {
        CFRetain(v8);
      }
    }
    else
    {
      unsigned __int16 v6 = ASDTIOA2LogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::CopySelectorControlInfo_SelectorMap();
      }
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v8);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A22290(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  CFTypeRef v8 = this;
  applesauce::CF::make_StringRef(@"left value", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftValue();
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_CenterValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  CFTypeRef v8 = this;
  applesauce::CF::make_StringRef(@"center value", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_CenterValue();
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_RightValue(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  CFTypeRef v8 = this;
  applesauce::CF::make_StringRef(@"right value", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_RightValue();
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftChannel(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  CFTypeRef v8 = this;
  applesauce::CF::make_StringRef(@"left channel", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftChannel();
    return 0;
  }
  return result;
}

BOOL ASDT::IOA2UserClient::GetStereoPanControlInfo_RightChannel(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  CFTypeRef v8 = this;
  applesauce::CF::make_StringRef(@"right channel", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v8, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) != 0)
  {
    *(_DWORD *)a2 = v4;
    return 1;
  }
  unsigned __int16 v6 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetStereoPanControlInfo_RightChannel();
    return 0;
  }
  return result;
}

const __CFDictionary **ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor@<X0>(const __CFDictionary **this@<X0>, void *a2@<X8>)
{
  uint64_t v10 = 0;
  if (*this)
  {
    CFDictionaryRef v4 = this;
    applesauce::CF::make_StringRef(@"descriptor", (applesauce::CF::StringRef *)&cf);
    applesauce::CF::details::find_at_key_or_optional<applesauce::CF::DictionaryRef,applesauce::CF::StringRef>(*v4, &cf, &v8);
    if (cf) {
      CFRelease(cf);
    }
    if (v9)
    {
      CFTypeRef v5 = v8;
      if (v8) {
        CFRetain(v8);
      }
    }
    else
    {
      unsigned __int16 v6 = ASDTIOA2LogType();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor();
      }
      CFTypeRef v5 = 0;
    }
    *a2 = v5;
    return (const __CFDictionary **)std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v8);
  }
  else
  {
    *a2 = 0;
  }
  return this;
}

void sub_248A2266C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)va);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MapBlockControlBuffer(ASDT::IOA2UserClient *this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3, unsigned __int8 **a4)
{
  if (!*(void *)a2)
  {
    char v13 = ASDTIOA2LogType();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MapBlockControlBuffer();
    }
    return 0;
  }
  CFTypeRef v18 = a2;
  applesauce::CF::make_StringRef(@"control ID", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v8 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&v18, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v8 & 0xFF00000000) == 0)
  {
    __int16 v14 = ASDTIOA2LogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MapBlockControlBuffer();
    }
    return 0;
  }
  LODWORD(cf) = 1;
  if (!*(void *)a2)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  applesauce::CF::make_StringRef(@"mapping options", (applesauce::CF::StringRef *)&v18, cf);
  uint64_t v9 = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>(*(const __CFDictionary **)a2, &v18, (unsigned int *)&cf);
  LODWORD(cf) = v9;
  if (v18)
  {
    CFRelease(v18);
    uint64_t v9 = cf;
  }
  uint64_t v10 = (unsigned __int8 *)ASDT::IOUserClient::MapMemory(this, v8 & 0xFFFFFFF | 0x30000000, v9, a3);
  *a4 = v10;
  BOOL v11 = v10 != 0;
  if (!v10)
  {
    CFBooleanRef v12 = ASDTIOA2LogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MapBlockControlBuffer();
    }
  }
  return v11;
}

void sub_248A22814()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A22834(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MoveBlockControlData(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unint64_t v7[3] = *MEMORY[0x263EF8340];
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  int v4 = ASDT::IOUserClient::CallMethod(this, 9, v7, 3, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    uint64_t v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MoveBlockControlData();
    }
  }
  return v4 == 0;
}

void ASDT::IOA2UserClient::CopyDataExchangeBlockList(ASDT::IOA2UserClient *this@<X0>, const applesauce::CF::TypeRef *a2@<X8>)
{
  *(void *)a2 = 0;
  applesauce::CF::make_StringRef(@"data exchange blocks", (applesauce::CF::StringRef *)&cf);
  ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_248A22978(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  applesauce::CF::ArrayRef::~ArrayRef(v2);
  _Unwind_Resume(a1);
}

CFIndex ASDT::IOA2UserClient::GetNumberDataExchangeBlocks(ASDT::IOA2UserClient *this)
{
  ASDT::IOA2UserClient::CopyDataExchangeBlockList(this, (const applesauce::CF::TypeRef *)&theArray);
  if (!theArray) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (theArray) {
    CFRelease(theArray);
  }
  return Count;
}

void ASDT::IOA2UserClient::CopyDataExchangeBlockDictionaryByIndex(ASDT::IOA2UserClient *this@<X0>, unsigned int a2@<W1>, void *a3@<X8>)
{
  uint64_t v10 = 0;
  ASDT::IOA2UserClient::CopyDataExchangeBlockList(this, (const applesauce::CF::TypeRef *)&theArray);
  if (theArray && CFArrayGetCount(theArray) > (unint64_t)a2)
  {
    if (!theArray)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>(theArray, a2, &cf);
    if (v8)
    {
      CFTypeRef v5 = cf;
      if (cf) {
        CFRetain(cf);
      }
      *a3 = v5;
    }
    else
    {
      *a3 = 0;
      uint64_t v10 = 0;
    }
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
  }
  else
  {
    *a3 = 0;
    uint64_t v10 = 0;
  }
  if (theArray) {
    CFRelease(theArray);
  }
}

void sub_248A22AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  int v4 = va_arg(va1, const void *);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::GetDataExchangeBlockID(const __CFDictionary **this, const applesauce::CF::DictionaryRef *a2, unsigned int *a3)
{
  if (!*this) {
    return 0;
  }
  CFTypeID v7 = this;
  applesauce::CF::make_StringRef(@"block ID", (applesauce::CF::StringRef *)&cf);
  CFDictionaryRef v4 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>(&v7, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (((unint64_t)v4 & 0xFF00000000) == 0) {
    return 0;
  }
  *(_DWORD *)a2 = v4;
  return 1;
}

void ASDT::IOA2UserClient::CopyDataExchangeBlockDictionaryByID(ASDT::IOA2UserClient *this@<X0>, int a2@<W1>, applesauce::CF::DictionaryRef *a3@<X8>)
{
  uint64_t v19 = 0;
  ASDT::IOA2UserClient::CopyDataExchangeBlockList(this, (const applesauce::CF::TypeRef *)&theArray);
  if (theArray)
  {
    CFArrayRef v15 = theArray;
    unint64_t v16 = 0;
    CFIndex Count = CFArrayGetCount(theArray);
    while (1)
    {
      CFArrayRef v5 = theArray;
      CFIndex v6 = theArray ? CFArrayGetCount(theArray) : 0;
      if (!v15 || v16 == Count) {
        break;
      }
      if (v15 == v5 && v16 == v6) {
        break;
      }
      applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::operator->((uint64_t)&v15, &cf);
      BOOL v10 = 0;
      if (cf)
      {
        CFTypeID v9 = CFGetTypeID(cf);
        if (v9 == CFDictionaryGetTypeID()) {
          BOOL v10 = 1;
        }
      }
      if (cf) {
        CFRelease(cf);
      }
      if (v10)
      {
        applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v15, v16, &cf);
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, a3);
        if (cf) {
          CFRelease(cf);
        }
        if (!*(void *)a3)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x24C588600](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
        CFTypeRef cf = a3;
        applesauce::CF::make_StringRef(@"block ID", (applesauce::CF::StringRef *)&v13);
        CFDictionaryRef v11 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v13);
        if (v13) {
          CFRelease(v13);
        }
        if (((unint64_t)v11 & 0xFF00000000) != 0 && v11 == a2) {
          goto LABEL_32;
        }
        if (*(void *)a3) {
          CFRelease(*(CFTypeRef *)a3);
        }
      }
      ++v16;
    }
    *(void *)a3 = 0;
    uint64_t v19 = 0;
LABEL_32:
    if (theArray) {
      CFRelease(theArray);
    }
  }
  else
  {
    *(void *)a3 = 0;
  }
}

void sub_248A22D54(_Unwind_Exception *a1)
{
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)(v1 - 40));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MapDataExchangeBlockBuffer(ASDT::IOA2UserClient *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  ASDT::IOA2UserClient::CopyDataExchangeBlockDictionaryByID(this, a2, (applesauce::CF::DictionaryRef *)&v16);
  if (v16)
  {
    unsigned int v15 = 1;
    applesauce::CF::make_StringRef(@"buffer mapping options", (applesauce::CF::StringRef *)&cf);
    uint64_t v8 = applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>((const __CFDictionary *)v16, &cf, &v15);
    unsigned int v15 = v8;
    if (cf)
    {
      CFRelease(cf);
      uint64_t v8 = v15;
    }
    CFTypeID v9 = (unsigned __int8 *)ASDT::IOUserClient::MapMemory(this, (a2 + 0x20000000), v8, a3);
    *a4 = v9;
    BOOL v10 = v9 != 0;
    if (!v9)
    {
      CFDictionaryRef v11 = ASDTIOA2LogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ASDT::IOA2UserClient::MapDataExchangeBlockBuffer();
      }
    }
  }
  else
  {
    CFBooleanRef v12 = ASDTIOA2LogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MapDataExchangeBlockBuffer();
    }
    BOOL v10 = 0;
  }
  if (v16) {
    CFRelease(v16);
  }
  return v10;
}

void sub_248A22EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::MoveDataExchangeBlockData(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unint64_t v7[3] = *MEMORY[0x263EF8340];
  v7[0] = a2;
  v7[1] = a4;
  v7[2] = a3;
  int v4 = ASDT::IOUserClient::CallMethod(this, 7, v7, 3, 0, 0, 0, 0, 0, 0);
  if (v4)
  {
    CFArrayRef v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::MoveDataExchangeBlockData();
    }
  }
  return v4 == 0;
}

BOOL ASDT::IOA2UserClient::StartIO(ASDT::IOA2UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1)
  {
    CFDictionaryRef v2 = ASDTIOA2LogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::StartIO();
    }
  }
  return v1 == 0;
}

BOOL ASDT::IOA2UserClient::StartIOWithFlags(ASDT::IOA2UserClient *this, unint64_t a2, unint64_t *a3)
{
  unint64_t v8 = 0;
  unint64_t v9 = a2;
  unsigned int v7 = 1;
  int v4 = ASDT::IOUserClient::CallMethod(this, 10, &v9, 1, 0, 0, &v8, &v7, 0, 0);
  if (v4)
  {
    CFArrayRef v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::StartIOWithFlags();
    }
  }
  else
  {
    *a3 = v8;
  }
  return v4 == 0;
}

BOOL ASDT::IOA2UserClient::StopIO(ASDT::IOA2UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1)
  {
    CFDictionaryRef v2 = ASDTIOA2LogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::StopIO();
    }
  }
  return v1 == 0;
}

BOOL ASDT::IOA2UserClient::StopIOWithFlags(ASDT::IOA2UserClient *this, unint64_t a2, unint64_t *a3)
{
  unint64_t v8 = 0;
  unint64_t v9 = a2;
  unsigned int v7 = 1;
  int v4 = ASDT::IOUserClient::CallMethod(this, 11, &v9, 1, 0, 0, &v8, &v7, 0, 0);
  if (v4)
  {
    CFArrayRef v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::StopIOWithFlags();
    }
  }
  else
  {
    *a3 = v8;
  }
  return v4 == 0;
}

BOOL ASDT::IOA2UserClient::DoIO(ASDT::IOA2UserClient *this, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v10 = ASDT::IOUserClient::CallTrap6(this);
  if (v10)
  {
    CFDictionaryRef v11 = ASDTIOA2LogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      CFTypeRef v13 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        CFTypeRef v13 = (void *)*v13;
      }
      int v14 = 136316162;
      unsigned int v15 = v13;
      __int16 v16 = 1024;
      int v17 = a2;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2048;
      uint64_t v21 = a4;
      __int16 v22 = 2048;
      uint64_t v23 = a5;
      _os_log_error_impl(&dword_248A1B000, v11, OS_LOG_TYPE_ERROR, "%s: DoIO(%hhu, %u, %llu, %llu) failed", (uint8_t *)&v14, 0x2Cu);
    }
  }
  return v10 == 0;
}

BOOL ASDT::IOA2UserClient::SetupForIsolatedIO(ASDT::IOA2UserClient *this, unsigned int a2, unint64_t a3, unsigned int a4)
{
  v20[3] = *MEMORY[0x263EF8340];
  v20[0] = a2;
  v20[1] = a3;
  v20[2] = a4;
  int v8 = ASDT::IOUserClient::CallMethod(this, 13, v20, 3, 0, 0, 0, 0, 0, 0);
  if (v8)
  {
    unint64_t v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CFDictionaryRef v11 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        CFDictionaryRef v11 = (void *)*v11;
      }
      *(_DWORD *)buf = 136315906;
      CFTypeRef v13 = v11;
      __int16 v14 = 1024;
      unsigned int v15 = a2;
      __int16 v16 = 2048;
      unint64_t v17 = a3;
      __int16 v18 = 1024;
      unsigned int v19 = a4;
      _os_log_error_impl(&dword_248A1B000, v9, OS_LOG_TYPE_ERROR, "%s: SetupForIsolatedIO(%u, %llu, %u) failed", buf, 0x22u);
    }
  }
  return v8 == 0;
}

BOOL ASDT::IOA2UserClient::TeardownForIsolatedIO(ASDT::IOA2UserClient *this, unsigned int a2, unint64_t a3)
{
  v16[2] = *MEMORY[0x263EF8340];
  v16[0] = a2;
  v16[1] = a3;
  int v6 = ASDT::IOUserClient::CallMethod(this, 14, v16, 2, 0, 0, 0, 0, 0, 0);
  if (v6)
  {
    unsigned int v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        unint64_t v9 = (void *)*v9;
      }
      *(_DWORD *)buf = 136315650;
      CFDictionaryRef v11 = v9;
      __int16 v12 = 1024;
      unsigned int v13 = a2;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_error_impl(&dword_248A1B000, v7, OS_LOG_TYPE_ERROR, "%s: TeardownForIsolatedIO(%u, %llu) failed", buf, 0x1Cu);
    }
  }
  return v6 == 0;
}

uint64_t ASDT::IOA2UserClient::DoIsolatedIO(ASDT::IOA2UserClient *this, int a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  ASDT::IOUserClient::SharedLock(v27, this);
  unsigned int v14 = 1937010544;
  if (*((_DWORD *)this + 3) && *((unsigned char *)this + 16) && (unsigned int v14 = MEMORY[0x24C587FD0]()) == 0)
  {
    uint64_t v16 = 1;
  }
  else
  {
    unint64_t v15 = ASDTIOA2LogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        __int16 v18 = (void *)*v18;
      }
      int v19 = HIBYTE(a4);
      *(_DWORD *)buf = 136318722;
      int64_t v29 = v18;
      __int16 v30 = 1024;
      if ((a4 - 0x20000000) >> 24 >= 0x5F) {
        int v19 = 32;
      }
      int v31 = a2;
      int v20 = BYTE2(a4);
      __int16 v32 = 2048;
      uint64_t v33 = a3;
      if (BYTE2(a4) - 32 >= 0x5F) {
        int v20 = 32;
      }
      __int16 v34 = 1024;
      int v35 = v19;
      if (BYTE1(a4) - 32 >= 0x5F) {
        int v21 = 32;
      }
      else {
        int v21 = BYTE1(a4);
      }
      __int16 v36 = 1024;
      int v37 = v20;
      if (a4 - 32 >= 0x5F) {
        int v22 = 32;
      }
      else {
        int v22 = a4;
      }
      __int16 v38 = 1024;
      int v39 = v21;
      if ((v14 - 0x20000000) >> 24 >= 0x5F) {
        int v23 = 32;
      }
      else {
        int v23 = HIBYTE(v14);
      }
      __int16 v40 = 1024;
      int v24 = BYTE2(v14);
      int v41 = v22;
      if (BYTE2(v14) - 32 >= 0x5F) {
        int v24 = 32;
      }
      __int16 v42 = 1024;
      int v25 = BYTE1(v14);
      int v43 = a5;
      if (BYTE1(v14) - 32 >= 0x5F) {
        int v25 = 32;
      }
      __int16 v44 = 2048;
      uint64_t v45 = a6;
      if (v14 - 32 >= 0x5F) {
        int v26 = 32;
      }
      else {
        int v26 = v14;
      }
      __int16 v46 = 2048;
      uint64_t v47 = a7;
      __int16 v48 = 1024;
      unsigned int v49 = v14;
      __int16 v50 = 1024;
      int v51 = v23;
      __int16 v52 = 1024;
      int v53 = v24;
      __int16 v54 = 1024;
      int v55 = v25;
      __int16 v56 = 1024;
      int v57 = v26;
      _os_log_error_impl(&dword_248A1B000, v15, OS_LOG_TYPE_ERROR, "%s: DoIsolatedIO(%u, %llu, %c%c%c%c, %u, %llu, %llu) failed: %x (%c%c%c%c)", buf, 0x6Cu);
    }
    uint64_t v16 = 0;
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)v27);
  return v16;
}

void sub_248A237F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ASDT::IOA2UserClient::SetStreamCurrentFormat(ASDT::IOA2UserClient *this, unsigned int a2, const AudioStreamBasicDescription *a3)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = ASDT::IOAudio2::Helpers::Fixed64FromFloat64(this, a3->mSampleRate);
  long long v10 = *(_OWORD *)&a3->mFormatID;
  uint64_t v11 = *(void *)&a3->mBytesPerFrame;
  UInt32 mBitsPerChannel = a3->mBitsPerChannel;
  v13[0] = a2;
  int v6 = ASDT::IOUserClient::CallMethod(this, 5, v13, 1, &v9, 40, 0, 0, 0, 0);
  if (v6)
  {
    unsigned int v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::SetStreamCurrentFormat();
    }
  }
  return v6 == 0;
}

BOOL ASDT::IOA2UserClient::SetControlValue(ASDT::IOA2UserClient *this, unsigned int a2, unsigned int *a3)
{
  v20[2] = *MEMORY[0x263EF8340];
  unint64_t v6 = *a3;
  v20[0] = a2;
  v20[1] = v6;
  unint64_t v19 = 0;
  unsigned int v12 = 1;
  int v7 = ASDT::IOUserClient::CallMethod(this, 2, v20, 2, 0, 0, &v19, &v12, 0, 0);
  if (v7)
  {
    int v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        uint64_t v9 = (void *)*v9;
      }
      int v10 = *a3;
      *(_DWORD *)buf = 136315650;
      unsigned int v14 = v9;
      __int16 v15 = 1024;
      unsigned int v16 = a2;
      __int16 v17 = 1024;
      int v18 = v10;
      _os_log_error_impl(&dword_248A1B000, v8, OS_LOG_TYPE_ERROR, "%s: SetControlValue(%u, %u): got an error when telling the hardware to change a control value", buf, 0x18u);
    }
  }
  else
  {
    *a3 = v19;
  }
  return v7 == 0;
}

BOOL ASDT::IOA2UserClient::SetMultiControlValue(ASDT::IOA2UserClient *this, unsigned int a2, const unsigned int *a3, int a4, unsigned int *a5, unsigned int *a6)
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = (a4 + 1);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v20 - v10;
  *(_DWORD *)((char *)v20 - v10) = v12;
  memcpy((char *)v20 - v10 + 4, v14, 4 * v13);
  if (a6)
  {
    uint64_t v15 = 4 * *a6;
    unsigned int v16 = v20;
  }
  else
  {
    unsigned int v16 = 0;
    uint64_t v15 = 0;
  }
  v20[0] = v15;
  int v17 = ASDT::IOUserClient::CallMethod(this, 8, 0, 0, v11, 4 * v9, 0, 0, a5, v16);
  if (v17)
  {
    int v18 = ASDTIOA2LogType();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::SetMultiControlValue();
    }
  }
  else if (a6)
  {
    *a6 = v20[0] >> 2;
  }
  return v17 == 0;
}

uint64_t ASDT::IOA2UserClient::UpdateControlInfo(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  CFTypeRef v3 = *a3;
  if (*a3)
  {
    CFRetain(*a3);
    CFRetain(v3);
  }
  uint64_t v4 = ASDT::IOUserClient::ArraySetValueAtIndex();
  if (v3)
  {
    CFRelease(v3);
    CFRelease(v3);
  }
  return v4;
}

void sub_248A23C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

uint64_t ASDT::IOA2UserClient::ReplaceControlInfo(ASDT::IOUserClient *a1, const applesauce::CF::ArrayRef *a2, uint64_t a3, CFTypeRef *a4)
{
  CFTypeRef v7 = *a4;
  if (*a4) {
    CFRetain(*a4);
  }
  CFTypeRef v12 = v7;
  char updated = ASDT::IOA2UserClient::UpdateControlInfo((uint64_t)a2, a3, &v12);
  if (v7) {
    CFRelease(v7);
  }
  if ((updated & 1) == 0) {
    return 0;
  }
  applesauce::CF::make_StringRef(@"controls", (applesauce::CF::StringRef *)&cf);
  uint64_t v9 = ASDT::IOUserClient::ReplaceProperty(a1, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

void sub_248A23D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

uint64_t ASDT::IOA2UserClient::UpdateControlValue(uint64_t a1, const void **a2)
{
  applesauce::CF::make_StringRef(@"value", (applesauce::CF::StringRef *)&v6);
  CFTypeRef v3 = *a2;
  if (v3) {
    CFRetain(v3);
  }
  uint64_t v4 = ASDT::IOUserClient::DictionarySetValueForKey();
  if (v3) {
    CFRelease(v3);
  }
  if (v6) {
    CFRelease(v6);
  }
  return v4;
}

void sub_248A23DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

uint64_t ASDT::IOA2UserClient::ReplaceControlValue(ASDT::IOUserClient *a1, const applesauce::CF::ArrayRef *a2, uint64_t a3, const void **a4, CFTypeRef *a5)
{
  CFTypeRef v9 = *a5;
  if (*a5) {
    CFRetain(*a5);
  }
  uint64_t v15 = v9;
  char updated = ASDT::IOA2UserClient::UpdateControlValue((uint64_t)a4, &v15);
  if (v9) {
    CFRelease(v9);
  }
  if ((updated & 1) == 0) {
    return 0;
  }
  uint64_t v11 = *a4;
  if (v11) {
    CFRetain(v11);
  }
  CFTypeRef v14 = v11;
  uint64_t v12 = ASDT::IOA2UserClient::ReplaceControlInfo(a1, a2, a3, &v14);
  if (v11) {
    CFRelease(v11);
  }
  return v12;
}

void sub_248A23EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
}

BOOL ASDT::IOA2UserClient::GetUpdatedControlValue(const __CFDictionary **a1, const applesauce::CF::DictionaryRef *a2, const void **a3, unsigned char *a4)
{
  int v6 = (int)a2;
  signed int ControlInfo_BaseClass = ASDT::IOA2UserClient::GetControlInfo_BaseClass(a1, a2);
  int v18 = 0;
  int ControlInfo_Value = ASDT::IOA2UserClient::GetControlInfo_Value((ASDT::IOA2UserClient *)a1, (const applesauce::CF::DictionaryRef *)&v18, v9);
  BOOL result = 0;
  if (!ControlInfo_Value) {
    return result;
  }
  *a4 = 0;
  if (ControlInfo_BaseClass <= 1936483441)
  {
    if (ControlInfo_BaseClass == 1818588780) {
      goto LABEL_9;
    }
    int v12 = 1936483188;
  }
  else
  {
    if (ControlInfo_BaseClass == 1936483442) {
      goto LABEL_9;
    }
    if (ControlInfo_BaseClass == 1953458028)
    {
      BOOL result = 1;
      if ((v6 != 0) != (v18 == 0)) {
        return result;
      }
      int v6 = v6 != 0;
      goto LABEL_13;
    }
    int v12 = 1936744814;
  }
  if (ControlInfo_BaseClass == v12)
  {
LABEL_9:
    BOOL result = 1;
    if (v18 == v6) {
      return result;
    }
LABEL_13:
    *a4 = 1;
    int valuePtr = v6;
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (!v13)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    CFNumberRef v14 = v13;
    CFRetain(v13);
    uint64_t v15 = *a3;
    *a3 = v14;
    if (v15) {
      CFRelease(v15);
    }
    CFRelease(v14);
    return 1;
  }
  unsigned int v16 = ASDTIOA2LogType();
  BOOL result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOA2UserClient::GetUpdatedControlValue(ControlInfo_BaseClass, v16);
    return 0;
  }
  return result;
}

void sub_248A24074(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ReplaceControlValue(ASDT::IOA2UserClient *this, const applesauce::CF::ArrayRef *a2, const applesauce::CF::DictionaryRef *a3)
{
  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&v18);
  unsigned int v17 = -1;
  ASDT::IOA2UserClient::CopyControlDictionaryByID(&v18, a2, &v17, (applesauce::CF::DictionaryRef *)&cf);
  CFTypeRef v6 = cf;
  if (!cf)
  {
    uint64_t v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::ReplaceControlValue();
    }
    uint64_t UpdatedControlValue = 0;
    goto LABEL_16;
  }
  CFTypeRef v15 = 0;
  char v14 = 0;
  CFRetain(cf);
  CFTypeRef v13 = v6;
  uint64_t UpdatedControlValue = ASDT::IOA2UserClient::GetUpdatedControlValue((const __CFDictionary **)&v13, a3, &v15, &v14);
  if (v13) {
    CFRelease(v13);
  }
  if ((UpdatedControlValue & 1) == 0)
  {
    CFTypeRef v8 = v15;
LABEL_14:
    if (!v8) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  CFTypeRef v8 = v15;
  if (!v14) {
    goto LABEL_14;
  }
  uint64_t v9 = v17;
  if (v15) {
    CFRetain(v15);
  }
  CFTypeRef v12 = v8;
  uint64_t UpdatedControlValue = ASDT::IOA2UserClient::ReplaceControlValue(this, (const applesauce::CF::ArrayRef *)&v18, v9, &cf, &v12);
  if (v8)
  {
    CFRelease(v8);
LABEL_15:
    CFRelease(v8);
  }
LABEL_16:
  if (cf) {
    CFRelease(cf);
  }
  if (v18) {
    CFRelease(v18);
  }
  return UpdatedControlValue;
}

void sub_248A241E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, const void *);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  va_copy(va2, va1);
  CFTypeRef v8 = va_arg(va2, const void *);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  applesauce::CF::TypeRef::~TypeRef((const void **)va1);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va2);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::GetUpdatedMultiControlValue(const __CFDictionary **a1, const void *a2, unsigned int a3, const void **a4, unsigned char *a5)
{
  if (a2 || !a3)
  {
    ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue(a1, &v26);
    CFArrayRef v11 = v26;
    BOOL v10 = v26 != 0;
    if (v26)
    {
      int v23 = 0;
      int v24 = 0;
      uint64_t v25 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v23, a2, (uint64_t)a2 + 4 * a3, a3);
      __p = 0;
      int v21 = 0;
      uint64_t v22 = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v23, (uint64_t)v24, (v24 - (unsigned char *)v23) >> 2);
      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
      std::vector<unsigned int>::size_type Count = CFArrayGetCount(v11);
      std::vector<unsigned int>::vector(&v19, Count);
      if (Count)
      {
        for (unint64_t i = 0; i != Count; ++i)
        {
          unint64_t v14 = applesauce::CF::details::at_as<unsigned int>(v11, i);
          if ((v14 & 0xFF00000000) != 0) {
            v19.__begin_[i] = v14;
          }
        }
      }
      std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
      if ((char *)v19.__end_ - (char *)v19.__begin_ == v24 - (unsigned char *)v23
        && !memcmp(v19.__begin_, v23, (char *)v19.__end_ - (char *)v19.__begin_))
      {
        *a5 = 0;
      }
      else
      {
        *a5 = 1;
        CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<unsigned int>(&__p);
        CFArrayRef v16 = CFArray;
        if (CFArray) {
          CFRetain(CFArray);
        }
        unsigned int v17 = *a4;
        *a4 = v16;
        if (v17) {
          CFRelease(v17);
        }
        if (v16) {
          CFRelease(v16);
        }
      }
      if (v19.__begin_)
      {
        v19.__end_ = v19.__begin_;
        operator delete(v19.__begin_);
      }
      if (__p)
      {
        int v21 = __p;
        operator delete(__p);
      }
      if (v23)
      {
        int v24 = v23;
        operator delete(v23);
      }
      CFRelease(v11);
    }
  }
  else
  {
    uint64_t v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::GetUpdatedMultiControlValue();
    }
    return 0;
  }
  return v10;
}

void sub_248A24414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a13) {
    operator delete(a13);
  }
  if (a16) {
    operator delete(a16);
  }
  applesauce::CF::ArrayRef::~ArrayRef((const void **)(v17 - 64));
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::ReplaceMultiControlValue(ASDT::IOA2UserClient *this, const applesauce::CF::ArrayRef *a2, const unsigned int *a3, unsigned int a4)
{
  ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&v20);
  unsigned int v19 = -1;
  ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&v20, a2, &v19, (applesauce::CF::DictionaryRef *)&cf);
  CFDictionaryRef v8 = (const __CFDictionary *)cf;
  if (!cf)
  {
    CFTypeRef v12 = ASDTIOA2LogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::ReplaceMultiControlValue();
    }
    uint64_t UpdatedMultiControlValue = 0;
    goto LABEL_14;
  }
  CFTypeRef v17 = 0;
  char v16 = 0;
  CFRetain(cf);
  CFDictionaryRef v15 = v8;
  uint64_t UpdatedMultiControlValue = ASDT::IOA2UserClient::GetUpdatedMultiControlValue(&v15, a3, a4, &v17, &v16);
  CFRelease(v8);
  if ((UpdatedMultiControlValue & 1) == 0)
  {
    CFTypeRef v10 = v17;
LABEL_12:
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  CFTypeRef v10 = v17;
  if (!v16) {
    goto LABEL_12;
  }
  uint64_t v11 = v19;
  if (v17) {
    CFRetain(v17);
  }
  CFTypeRef v14 = v10;
  uint64_t UpdatedMultiControlValue = ASDT::IOA2UserClient::ReplaceControlValue(this, (const applesauce::CF::ArrayRef *)&v20, v11, &cf, &v14);
  if (v10)
  {
    CFRelease(v10);
LABEL_13:
    CFRelease(v10);
  }
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  if (v20) {
    CFRelease(v20);
  }
  return UpdatedMultiControlValue;
}

void sub_248A245DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  CFTypeRef v3 = va_arg(va1, const void *);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v7 = va_arg(va2, const void *);
  va_copy(va3, va2);
  uint64_t v9 = va_arg(va3, const void *);
  uint64_t v11 = va_arg(va3, void);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  applesauce::CF::TypeRef::~TypeRef((const void **)va1);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va2);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va3);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::RefreshControlList(ASDT::IOA2UserClient *this)
{
  applesauce::CF::make_StringRef(@"controls", (applesauce::CF::StringRef *)&v7);
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>((ASDT::IOUserClient *)*((unsigned int *)this + 2), (uint64_t)&v7, (const applesauce::CF::TypeRef *)&cf, v2))
  {
    uint64_t v3 = ASDT::IOUserClient::ReplaceProperty(this, (const applesauce::CF::StringRef *)&v7, (const applesauce::CF::ArrayRef *)&cf);
  }
  else
  {
    uint64_t v4 = ASDTIOA2LogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::RefreshControlList();
    }
    uint64_t v3 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v3;
}

void sub_248A246E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>(ASDT::IOUserClient *a1, uint64_t a2, const applesauce::CF::TypeRef *a3, applesauce::CF::TypeRef *a4)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (const applesauce::CF::StringRef *)&cf, a4)) {
    uint64_t v6 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v5);
  }
  else {
    uint64_t v6 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_248A24774(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UserClient::RefreshControlInfo(ASDT::IOA2UserClient *this, const applesauce::CF::ArrayRef *a2)
{
  applesauce::CF::make_StringRef(@"controls", (applesauce::CF::StringRef *)&v17);
  CFTypeRef v16 = 0;
  if (ASDT::IOUserClient::CopyProperty<applesauce::CF::ArrayRef>((ASDT::IOUserClient *)*((unsigned int *)this + 2), (uint64_t)&v17, (const applesauce::CF::TypeRef *)&v16, v4))
  {
    int v15 = -1;
    ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&v16, a2, &v15, (applesauce::CF::DictionaryRef *)&cf);
    unsigned int v13 = -1;
    ASDT::IOA2UserClient::CopyControlList(this, (const applesauce::CF::TypeRef *)&v12);
    ASDT::IOA2UserClient::CopyControlDictionaryByID((CFArrayRef *)&v12, a2, &v13, (applesauce::CF::DictionaryRef *)&v11);
    uint64_t v5 = v13;
    CFTypeRef v6 = cf;
    if (cf) {
      CFRetain(cf);
    }
    CFTypeRef v10 = v6;
    uint64_t v7 = ASDT::IOA2UserClient::ReplaceControlInfo(this, (const applesauce::CF::ArrayRef *)&v12, v5, &v10);
    if (v6) {
      CFRelease(v6);
    }
    if (v11) {
      CFRelease(v11);
    }
    if (v12) {
      CFRelease(v12);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    CFDictionaryRef v8 = ASDTIOA2LogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::RefreshControlInfo();
    }
    uint64_t v7 = 0;
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v17) {
    CFRelease(v17);
  }
  return v7;
}

void sub_248A248E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va);
  applesauce::CF::StringRef::~StringRef((const void **)(v7 - 40));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UserClient::PerformConfigChange(ASDT::IOA2UserClient *this, const IOAudio2Notification *a2)
{
  int v2 = ASDT::IOUserClient::CallMethod(this, 3, 0, 0, a2, 32, 0, 0, 0, 0);
  if (v2)
  {
    uint64_t v3 = ASDTIOA2LogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UserClient::PerformConfigChange();
    }
  }
  return v2 == 0;
}

BOOL ASDT::IOA2UserClient::MapEngineStatus(ASDT::IOA2UserClient *this, IOAudio2EngineStatus **a2)
{
  unsigned int v8 = 0;
  uint64_t v4 = (IOAudio2EngineStatus *)ASDT::IOUserClient::MapMemory(this, 0, 1, &v8);
  if (!v4)
  {
    uint64_t v7 = ASDTIOA2LogType();
    BOOL result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    goto LABEL_6;
  }
  if (v8 <= 0x27)
  {
    ASDT::IOUserClient::ReleaseMemory(this, v4);
    uint64_t v5 = ASDTIOA2LogType();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
LABEL_6:
    ASDT::IOA2UserClient::MapEngineStatus();
    return 0;
  }
  *a2 = v4;
  return 1;
}

void ASDT::IOA2UserClient::~IOA2UserClient(ASDT::IOA2UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x24C588800);
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_248A24B54(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n, const std::vector<char>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<char>::size_type v5 = __n;
    std::vector<char>::__vallocate[abi:ne180100](this, __n);
    std::vector<char>::pointer end = this->__end_;
    uint64_t v7 = &end[v5];
    do
    {
      *end++ = *__x;
      --v5;
    }
    while (v5);
    this->__end_ = v7;
  }
  return this;
}

void sub_248A24BE8(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<char>::__throw_length_error[abi:ne180100]();
  }
  BOOL result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265246138, MEMORY[0x263F8C060]);
}

void sub_248A24CA8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

applesauce::CF::DataRef *applesauce::CF::DataRef::DataRef(applesauce::CF::DataRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDataGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C588600](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_248A24DAC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    int v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::NumberRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, unsigned char *a3@<X8>)
{
  CFDictionaryRef v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4) {
    goto LABEL_5;
  }
  CFDictionaryRef v5 = v4;
  CFRetain(v4);
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != CFNumberGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    char v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(void *)a3 = v5;
  char v7 = 1;
LABEL_6:
  a3[8] = v7;
}

const __CFDictionary *applesauce::CF::details::at_key<applesauce::CF::StringRef>(const __CFDictionary *result, const void **a2)
{
  if (result)
  {
    int v2 = *a2;
    if (v2) {
      return (const __CFDictionary *)CFDictionaryGetValue(result, v2);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t applesauce::CF::convert_as<unsigned int,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<unsigned int>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t Value = CFBooleanGetValue(a1);
    uint64_t v4 = 0x100000000;
  }
  else
  {
    uint64_t Value = 0;
    uint64_t v4 = 0;
  }
  return v4 | Value;
}

uint64_t applesauce::CF::details::number_convert_as<unsigned int>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      uint64_t v16 = Value != 0;
      if (Value) {
        unsigned __int8 v17 = LOBYTE(valuePtr);
      }
      else {
        unsigned __int8 v17 = 0;
      }
      int v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0) {
        int v18 = 0;
      }
      uint64_t v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      int v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr)) {
        uint64_t v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      }
      else {
        uint64_t v6 = 0;
      }
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_24:
      int v19 = CFNumberGetValue(v11, v12, &valuePtr);
      uint64_t v20 = *(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_28:
      int v19 = CFNumberGetValue(v9, v10, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_30:
      int v19 = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = valuePtr;
LABEL_31:
      uint64_t v6 = v20 | 0x100000000;
      if (!v19) {
        uint64_t v6 = 0;
      }
LABEL_33:
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

uint64_t std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    CFNumberRef v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

BOOL CA::Implementation::EquivalentFormatFlags(CA::Implementation *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3, int a4)
{
  if (a4)
  {
    int32x4_t v4 = *(int32x4_t *)&a2->mFormatID;
    v4.i64[1] = *((void *)this + 1);
    if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v4)))) {
      return 1;
    }
  }
  int v6 = *((_DWORD *)this + 3);
  if (*((_DWORD *)this + 2) != 1819304813) {
    return v6 == a2->mFormatFlags;
  }
  int v7 = v6 & 0x7FFFFFFF;
  if ((v6 & 0x7FFFFFFF) == 0) {
    int v7 = *((_DWORD *)this + 3);
  }
  if (a3) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = v7 & 0xFFFFFFBF;
  }
  unsigned int v9 = *((_DWORD *)this + 6);
  if (v9)
  {
    int v10 = *((_DWORD *)this + 7);
    if ((v6 & 0x20) != 0) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = *((_DWORD *)this + 7);
    }
    if (v11)
    {
      unsigned int v9 = 8 * (v9 / v11);
      unsigned int v12 = *((_DWORD *)this + 8);
      int v13 = v8 | 8;
      BOOL v14 = v9 == v12;
      goto LABEL_20;
    }
    unsigned int v9 = 0;
    unsigned int v12 = *((_DWORD *)this + 8);
    int v13 = v8 | 8;
  }
  else
  {
    int v13 = v8 | 8;
    int v10 = *((_DWORD *)this + 7);
    unsigned int v12 = *((_DWORD *)this + 8);
  }
  BOOL v14 = v12 == 0;
LABEL_20:
  if (v14) {
    unsigned int v8 = v13;
  }
  BOOL v16 = (v12 & 7) == 0 && v9 == v12;
  unsigned int v17 = v8 & 0xFFFFFFEF;
  if (!v16) {
    unsigned int v17 = v8;
  }
  if (v17) {
    v17 &= ~4u;
  }
  BOOL v18 = (v17 & 8) == 0 || v12 > 8;
  int v19 = v17 & 2;
  if (v18) {
    int v19 = v17;
  }
  if (v10 == 1) {
    unsigned int v20 = v19 & 0xFFFFFFDF;
  }
  else {
    unsigned int v20 = v19;
  }
  if (!v20) {
    unsigned int v20 = 0x80000000;
  }
  AudioFormatFlags mFormatFlags = a2->mFormatFlags;
  if (a2->mFormatID != 1819304813) {
    return v20 == mFormatFlags;
  }
  AudioFormatFlags v22 = mFormatFlags & 0x7FFFFFFF;
  if ((mFormatFlags & 0x7FFFFFFF) == 0) {
    AudioFormatFlags v22 = a2->mFormatFlags;
  }
  if (a3) {
    unsigned int v23 = v22;
  }
  else {
    unsigned int v23 = v22 & 0xFFFFFFBF;
  }
  UInt32 mBytesPerFrame = a2->mBytesPerFrame;
  if (!mBytesPerFrame)
  {
    int v28 = v23 | 8;
    UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
LABEL_53:
    BOOL v29 = mBitsPerChannel == 0;
    goto LABEL_54;
  }
  UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
  if ((mFormatFlags & 0x20) != 0) {
    UInt32 v26 = 1;
  }
  else {
    UInt32 v26 = a2->mChannelsPerFrame;
  }
  if (!v26)
  {
    UInt32 mBytesPerFrame = 0;
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
    int v28 = v23 | 8;
    goto LABEL_53;
  }
  UInt32 mBytesPerFrame = 8 * (mBytesPerFrame / v26);
  UInt32 mBitsPerChannel = a2->mBitsPerChannel;
  int v28 = v23 | 8;
  BOOL v29 = mBytesPerFrame == mBitsPerChannel;
LABEL_54:
  if (v29) {
    unsigned int v23 = v28;
  }
  BOOL v30 = (mBitsPerChannel & 7) == 0 && mBytesPerFrame == mBitsPerChannel;
  unsigned int v31 = v23 & 0xFFFFFFEF;
  if (!v30) {
    unsigned int v31 = v23;
  }
  if (v31) {
    v31 &= ~4u;
  }
  BOOL v32 = (v31 & 8) == 0 || mBitsPerChannel > 8;
  int v33 = v31 & 2;
  if (v32) {
    int v33 = v31;
  }
  if (mChannelsPerFrame == 1) {
    unsigned int v34 = v33 & 0xFFFFFFDF;
  }
  else {
    unsigned int v34 = v33;
  }
  if (v34) {
    AudioFormatFlags mFormatFlags = v34;
  }
  else {
    AudioFormatFlags mFormatFlags = 0x80000000;
  }
  return v20 == mFormatFlags;
}

uint64_t std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    CFNumberRef v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    CFNumberRef v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

CFTypeRef applesauce::CF::details::at_to<applesauce::CF::TypeRef>@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2), (int v7 = ValueAtIndex) == 0))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::not_found(exception);
  }
  CFTypeRef result = CFRetain(ValueAtIndex);
  *a3 = v7;
  return result;
}

void sub_248A254EC()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A25518(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::not_found(applesauce::CF *this)
{
}

uint64_t applesauce::CF::at_or<applesauce::CF::NumberRef>@<X0>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  applesauce::CF::details::at_as<applesauce::CF::NumberRef>(a1, a2, &cf);
  if (v9)
  {
    CFTypeRef v6 = cf;
    if (cf) {
      CFRetain(cf);
    }
    *a4 = v6;
  }
  else
  {
    *a4 = *a3;
    *a3 = 0;
  }
  return std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&cf);
}

void applesauce::CF::details::at_as<applesauce::CF::NumberRef>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (!a1) {
    goto LABEL_7;
  }
  if (CFArrayGetCount(a1) <= a2) {
    goto LABEL_7;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  int v7 = ValueAtIndex;
  if (!ValueAtIndex) {
    goto LABEL_7;
  }
  CFRetain(ValueAtIndex);
  CFTypeID v8 = CFGetTypeID(v7);
  if (v8 != CFNumberGetTypeID())
  {
    CFRelease(v7);
LABEL_7:
    char v9 = 0;
    *a3 = 0;
    goto LABEL_8;
  }
  *(void *)a3 = v7;
  char v9 = 1;
LABEL_8:
  a3[8] = v9;
}

uint64_t applesauce::CF::convert_to<unsigned int,0>(const __CFNumber *a1)
{
  uint64_t result = applesauce::CF::convert_as<unsigned int,0>(a1);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return result;
}

void sub_248A25690()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A256B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
}

void applesauce::CF::details::at_as<applesauce::CF::DictionaryRef>(const __CFArray *a1@<X0>, unint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (!a1) {
    goto LABEL_7;
  }
  if (CFArrayGetCount(a1) <= a2) {
    goto LABEL_7;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(a1, a2);
  int v7 = ValueAtIndex;
  if (!ValueAtIndex) {
    goto LABEL_7;
  }
  CFRetain(ValueAtIndex);
  CFTypeID v8 = CFGetTypeID(v7);
  if (v8 != CFDictionaryGetTypeID())
  {
    CFRelease(v7);
LABEL_7:
    char v9 = 0;
    *a3 = 0;
    goto LABEL_8;
  }
  *(void *)a3 = v7;
  char v9 = 1;
LABEL_8:
  a3[8] = v9;
}

void *applesauce::CF::ArrayRef_iterator<applesauce::CF::TypeRef>::iterator_proxy::iterator_proxy(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v3;
  return a1;
}

void std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>(uint64_t a1)
{
  CFNumberRef v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<applesauce::CF::StringRef,applesauce::CF::StringRef,applesauce::CF::NumberRef>(uint64_t **a1, CFTypeRef *a2, void *a3, CFTypeRef *a4)
{
  int v7 = (uint64_t **)std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<applesauce::CF::StringRef>((uint64_t)a1, &v13, a2);
  CFTypeID v8 = *v7;
  if (!*v7)
  {
    char v9 = v7;
    CFTypeID v8 = (uint64_t *)operator new(0x30uLL);
    v11[1] = a1 + 1;
    std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef,applesauce::CF::NumberRef,0>(v8 + 4, a3, a4);
    char v12 = 1;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, v13, v9, v8);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v11, 0);
  }
  return v8;
}

void *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__find_equal<applesauce::CF::StringRef>(uint64_t a1, void *a2, CFTypeRef *a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        int v7 = (void *)v4;
        CFTypeID v8 = (CFTypeRef *)(v4 + 32);
        if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(a3, (const __CFString **)(v4 + 32)) != kCFCompareLessThan)break; {
        uint64_t v4 = *v7;
        }
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(v8, (const __CFString **)a3) != kCFCompareLessThan) {
        break;
      }
      uint64_t v5 = v7 + 1;
      uint64_t v4 = v7[1];
    }
    while (v4);
  }
  else
  {
    int v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

CFComparisonResult applesauce::CF::compare<applesauce::CF::StringRef,0,applesauce::CF::StringRef,0>(CFTypeRef *a1, const __CFString **a2)
{
  CFStringRef v3 = (const __CFString *)*a1;
  if (*a1)
  {
    CFRetain(*a1);
    CFStringRef v4 = *a2;
    if (!v4)
    {
      CFComparisonResult v5 = kCFCompareGreaterThan;
LABEL_9:
      CFRelease(v3);
      return v5;
    }
  }
  else
  {
    CFStringRef v4 = *a2;
    if (!*a2) {
      return 0;
    }
  }
  CFRetain(v4);
  if (v3) {
    CFComparisonResult v5 = CFStringCompare(v3, v4, 0);
  }
  else {
    CFComparisonResult v5 = kCFCompareLessThan;
  }
  CFRelease(v4);
  if (v3) {
    goto LABEL_9;
  }
  return v5;
}

void *std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>::pair[abi:ne180100]<applesauce::CF::StringRef,applesauce::CF::NumberRef,0>(void *a1, void *a2, CFTypeRef *a3)
{
  *a1 = *a2;
  *a2 = 0;
  CFTypeRef v4 = *a3;
  if (*a3) {
    CFRetain(*a3);
  }
  a1[1] = v4;
  return a1;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      CFNumberRef v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      CFStringRef v3 = (uint64_t *)v2[2];
      CFTypeRef v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), CFComparisonResult v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            char v9 = (uint64_t **)a2[2];
          }
          else
          {
            char v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              CFStringRef v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            const void *v9 = v2;
            v2[2] = (uint64_t)v9;
            CFStringRef v3 = v9[2];
            CFNumberRef v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), CFComparisonResult v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            CFStringRef v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          CFStringRef v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        CFNumberRef v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *CFComparisonResult v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  CFNumberRef v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<applesauce::CF::StringRef const,applesauce::CF::TypeRef>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void **std::vector<applesauce::CF::TypeRefPair>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    unint64_t v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    unint64_t v7[3] = (char *)v7[0] + 16 * v6;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(v7);
  }
  return result;
}

void sub_248A25D68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::emplace_back<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(uint64_t *a1, CFTypeRef *a2, const void **a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  unint64_t v9 = *(void *)(v6 - 8);
  if (v9 >= v8)
  {
    uint64_t v11 = (uint64_t)(v9 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v21 = v6;
    if (v14) {
      int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v6, v14);
    }
    else {
      int v15 = 0;
    }
    unsigned int v17 = v15;
    BOOL v18 = &v15[16 * v11];
    unsigned int v20 = &v15[16 * v14];
    applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(v18, a2, a3);
    int v19 = v18 + 16;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, &v17);
    uint64_t v10 = a1[1];
    std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(&v17);
  }
  else
  {
    applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(*(void **)(v6 - 8), a2, a3);
    uint64_t v10 = v9 + 16;
    a1[1] = v9 + 16;
  }
  a1[1] = v10;
  return v10 - 16;
}

void sub_248A25E7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(void ***a1)
{
  uint64_t v2 = ((char *)a1[1] - (char *)*a1) >> 4;
  keys = 0;
  int v35 = 0;
  __int16 v36 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  BOOL v32 = 0;
  int v33 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  CFStringRef v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1 != v4)
  {
    do
    {
      uint64_t v5 = *v3;
      if (!*v3 || !v3[1])
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C588600](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      uint64_t v6 = v35;
      if (v35 >= v36)
      {
        uint64_t v8 = v35 - keys;
        if ((unint64_t)(v8 + 1) >> 61) {
          std::vector<char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v9 = ((char *)v36 - (char *)keys) >> 2;
        if (v9 <= v8 + 1) {
          unint64_t v9 = v8 + 1;
        }
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10) {
          uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v36, v10);
        }
        else {
          uint64_t v11 = 0;
        }
        uint64_t v12 = (void **)&v11[8 * v8];
        *uint64_t v12 = v5;
        unint64_t v7 = v12 + 1;
        unint64_t v14 = keys;
        uint64_t v13 = v35;
        if (v35 != keys)
        {
          do
          {
            int v15 = *--v13;
            *--uint64_t v12 = v15;
          }
          while (v13 != v14);
          uint64_t v13 = keys;
        }
        keys = v12;
        int v35 = v7;
        __int16 v36 = (void **)&v11[8 * v10];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *int v35 = v5;
        unint64_t v7 = v6 + 1;
      }
      int v35 = v7;
      BOOL v16 = v3[1];
      unsigned int v17 = v32;
      if (v32 >= v33)
      {
        uint64_t v19 = v32 - values;
        if ((unint64_t)(v19 + 1) >> 61) {
          std::vector<char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v20 = ((char *)v33 - (char *)values) >> 2;
        if (v20 <= v19 + 1) {
          unint64_t v20 = v19 + 1;
        }
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21) {
          AudioFormatFlags v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)&v33, v21);
        }
        else {
          AudioFormatFlags v22 = 0;
        }
        unsigned int v23 = (void **)&v22[8 * v19];
        *unsigned int v23 = v16;
        BOOL v18 = v23 + 1;
        uint64_t v25 = values;
        int v24 = v32;
        if (v32 != values)
        {
          do
          {
            UInt32 v26 = *--v24;
            *--unsigned int v23 = v26;
          }
          while (v24 != v25);
          int v24 = values;
        }
        values = v23;
        BOOL v32 = v18;
        int v33 = (void **)&v22[8 * v21];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        *BOOL v32 = v16;
        BOOL v18 = v17 + 1;
      }
      BOOL v32 = v18;
      v3 += 2;
    }
    while (v3 != v4);
  }
  CFDictionaryRef v27 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v27)
  {
    BOOL v30 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](v30, "Could not construct");
    __cxa_throw(v30, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (values)
  {
    BOOL v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    int v35 = keys;
    operator delete(keys);
  }
  return v27;
}

void sub_248A26170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
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

uint64_t std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
    uint64_t v8 = a7;
    do
    {
      uint64_t v9 = *(a3 - 2);
      a3 -= 2;
      *(void *)(v8 - 16) = v9;
      v8 -= 16;
      *a3 = 0;
      *(void *)(v8 + 8) = a3[1];
      a3[1] = 0;
      v7 -= 16;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::TypeRefPair>,std::reverse_iterator<applesauce::CF::TypeRefPair*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](v3, v1);
      v1 += 16;
    }
    while (v1 != v2);
  }
}

void std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(const void **)(a2 + 8);
  if (v3) {
    CFRelease(v3);
  }
  if (*(void *)a2) {
    CFRelease(*(CFTypeRef *)a2);
  }
}

void **std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<applesauce::CF::TypeRefPair>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 16;
    std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100](v4, i - 16);
  }
}

void *applesauce::CF::TypeRefPair::TypeRefPair<applesauce::CF::StringRef const&,applesauce::CF::TypeRef const&>(void *a1, CFTypeRef *a2, const void **a3)
{
  CFTypeRef v5 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  *a1 = v5;
  uint64_t v6 = *a3;
  if (v6) {
    CFRetain(v6);
  }
  a1[1] = v6;
  return a1;
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
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
      uint64_t v10 = (char *)*a1;
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    int64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::allocator<applesauce::CF::TypeRefPair>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      int64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

const __CFBoolean *applesauce::CF::details::find_at_key_or_optional<unsigned long long,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2)
{
  CFBooleanRef result = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (result) {
    return applesauce::CF::convert_as<unsigned long long,0>(result);
  }
  return result;
}

const __CFBoolean *applesauce::CF::convert_as<unsigned long long,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return (const __CFBoolean *)applesauce::CF::details::number_convert_as<unsigned long long>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned long long>(a1);
}

const __CFBoolean *applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned long long>(const __CFBoolean *result)
{
  if (result)
  {
    CFBooleanRef v1 = result;
    CFTypeID TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v1)) {
      return (const __CFBoolean *)CFBooleanGetValue(v1);
    }
    else {
      return 0;
    }
  }
  return result;
}

unint64_t applesauce::CF::details::number_convert_as<unsigned long long>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberSInt16Type;
      goto LABEL_18;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberSInt32Type;
      goto LABEL_20;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberSInt64Type;
      goto LABEL_31;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloat32Type;
      goto LABEL_27;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberFloat64Type;
      goto LABEL_33;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      if (Value) {
        char v17 = LOBYTE(valuePtr);
      }
      else {
        char v17 = 0;
      }
      if (Value != 0 && SLOBYTE(valuePtr) < 0) {
        unint64_t v4 = -256;
      }
      else {
        unint64_t v4 = 0;
      }
      LOBYTE(v5) = v17;
      return v5 | v4;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v6 = a1;
      CFNumberType v7 = kCFNumberShortType;
LABEL_18:
      BOOL v18 = CFNumberGetValue(v6, v7, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLOWORD(valuePtr);
      goto LABEL_21;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v8 = a1;
      CFNumberType v9 = kCFNumberIntType;
LABEL_20:
      BOOL v18 = CFNumberGetValue(v8, v9, &valuePtr) == 0;
      unsigned __int8 v19 = LOBYTE(valuePtr);
      uint64_t v20 = SLODWORD(valuePtr);
LABEL_21:
      unint64_t v21 = v20 & 0xFFFFFFFFFFFFFF00 | v19;
      if (v18) {
        unint64_t v5 = 0;
      }
      else {
        unint64_t v5 = v21;
      }
      goto LABEL_37;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongType;
      goto LABEL_31;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberLongLongType;
      goto LABEL_31;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v12 = a1;
      CFNumberType v13 = kCFNumberFloatType;
LABEL_27:
      BOOL v22 = CFNumberGetValue(v12, v13, &valuePtr) == 0;
      unint64_t v5 = (unint64_t)*(float *)&valuePtr;
      goto LABEL_34;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberDoubleType;
      goto LABEL_33;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberCFIndexType;
      goto LABEL_31;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v10 = a1;
      CFNumberType v11 = kCFNumberNSIntegerType;
LABEL_31:
      BOOL v22 = CFNumberGetValue(v10, v11, &valuePtr) == 0;
      unint64_t v5 = *(void *)&valuePtr;
      goto LABEL_34;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v14 = a1;
      CFNumberType v15 = kCFNumberCGFloatType;
LABEL_33:
      BOOL v22 = CFNumberGetValue(v14, v15, &valuePtr) == 0;
      unint64_t v5 = (unint64_t)valuePtr;
LABEL_34:
      if (v22) {
        unint64_t v5 = 0;
      }
LABEL_37:
      unint64_t v4 = v5 & 0xFFFFFFFFFFFFFF00;
      break;
    default:
      unint64_t v4 = 0;
      LOBYTE(v5) = 0;
      break;
  }
  return v5 | v4;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::DictionaryRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, unsigned char *a3@<X8>)
{
  CFDictionaryRef v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4) {
    goto LABEL_5;
  }
  CFDictionaryRef v5 = v4;
  CFRetain(v4);
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != CFDictionaryGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    char v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(void *)a3 = v5;
  char v7 = 1;
LABEL_6:
  a3[8] = v7;
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::ArrayRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, unsigned char *a3@<X8>)
{
  CFDictionaryRef v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4) {
    goto LABEL_5;
  }
  CFDictionaryRef v5 = v4;
  CFRetain(v4);
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != CFArrayGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    char v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(void *)a3 = v5;
  char v7 = 1;
LABEL_6:
  a3[8] = v7;
}

uint64_t applesauce::CF::details::find_at_key_or_optional<BOOL,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2)
{
  CFDictionaryRef v2 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (v2)
  {
    LOWORD(v2) = applesauce::CF::convert_as<BOOL,0>(v2);
    int v3 = BYTE1(v2);
  }
  else
  {
    int v3 = 0;
  }
  return v2 | (v3 << 8);
}

uint64_t applesauce::CF::convert_as<BOOL,0>(const __CFNumber *a1)
{
  if (!a1) {
    goto LABEL_7;
  }
  CFNumberRef v1 = a1;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v1))
  {
    CFTypeID v4 = CFNumberGetTypeID();
    if (v4 == CFGetTypeID(v1))
    {
      LOWORD(a1) = applesauce::CF::details::number_convert_as<BOOL>(v1);
      int v3 = BYTE1(a1);
      return a1 | (v3 << 8);
    }
    LOBYTE(a1) = 0;
LABEL_7:
    int v3 = 0;
    return a1 | (v3 << 8);
  }
  LOBYTE(a1) = CFBooleanGetValue(v1) != 0;
  int v3 = 1;
  return a1 | (v3 << 8);
}

uint64_t applesauce::CF::details::number_convert_as<BOOL>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v5 = a1;
      CFNumberType v6 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt32Type;
      goto LABEL_14;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_25;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_21;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_29;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOBYTE(valuePtr);
      goto LABEL_15;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v5 = a1;
      CFNumberType v6 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v5, v6, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LOWORD(valuePtr);
      goto LABEL_15;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberIntType;
LABEL_14:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      BOOL v16 = Value == 0;
      int v17 = LODWORD(valuePtr);
LABEL_15:
      BOOL v18 = v16 || v17 == 0;
      goto LABEL_33;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_25;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_25;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_21:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      BOOL v19 = *(float *)&valuePtr == 0.0;
      goto LABEL_30;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_29;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_25;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_25:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      if (Value) {
        BOOL v18 = *(void *)&valuePtr == 0;
      }
      else {
        BOOL v18 = 1;
      }
      goto LABEL_33;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_29:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      BOOL v19 = valuePtr == 0.0;
LABEL_30:
      BOOL v18 = v19 || Value == 0;
LABEL_33:
      int v4 = !v18;
      if (!Value) {
        goto LABEL_38;
      }
      int v20 = 256;
      break;
    default:
      int v4 = 0;
LABEL_38:
      int v20 = 0;
      break;
  }
  return v20 | v4;
}

uint64_t applesauce::CF::at_or<unsigned int &,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2, unsigned int *a3)
{
  CFDictionaryRef v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4) {
    return *a3;
  }
  uint64_t result = applesauce::CF::convert_as<unsigned int,0>(v4);
  if ((result & 0xFF00000000) != 0) {
    return result;
  }
  else {
    return *a3;
  }
}

void applesauce::CF::details::find_at_key_or_optional<applesauce::CF::StringRef,applesauce::CF::StringRef>(const __CFDictionary *a1@<X0>, const void **a2@<X1>, unsigned char *a3@<X8>)
{
  CFDictionaryRef v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4) {
    goto LABEL_5;
  }
  CFDictionaryRef v5 = v4;
  CFRetain(v4);
  CFTypeID v6 = CFGetTypeID(v5);
  if (v6 != CFStringGetTypeID())
  {
    CFRelease(v5);
LABEL_5:
    char v7 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  *(void *)a3 = v5;
  char v7 = 1;
LABEL_6:
  a3[8] = v7;
}

uint64_t applesauce::CF::at_or<int &,applesauce::CF::StringRef>(const __CFDictionary *a1, const void **a2, unsigned int *a3)
{
  CFDictionaryRef v4 = applesauce::CF::details::at_key<applesauce::CF::StringRef>(a1, a2);
  if (!v4) {
    return *a3;
  }
  uint64_t result = applesauce::CF::convert_as<int,0>(v4);
  if ((result & 0xFF00000000) != 0) {
    return result;
  }
  else {
    return *a3;
  }
}

uint64_t applesauce::CF::convert_as<int,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<int>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<unsigned int>(a1);
}

uint64_t applesauce::CF::details::number_convert_as<int>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      uint64_t v16 = Value != 0;
      if (Value) {
        unsigned __int8 v17 = LOBYTE(valuePtr);
      }
      else {
        unsigned __int8 v17 = 0;
      }
      int v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0) {
        int v18 = 0;
      }
      uint64_t v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      int v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr)) {
        uint64_t v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      }
      else {
        uint64_t v6 = 0;
      }
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberFloatType;
LABEL_24:
      int v19 = CFNumberGetValue(v11, v12, &valuePtr);
      uint64_t v20 = (int)*(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberNSIntegerType;
LABEL_28:
      int v19 = CFNumberGetValue(v9, v10, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberCGFloatType;
LABEL_30:
      int v19 = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = (int)valuePtr;
LABEL_31:
      uint64_t v6 = v20 | 0x100000000;
      if (!v19) {
        uint64_t v6 = 0;
      }
LABEL_33:
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<unsigned int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_248A27244(_Unwind_Exception *exception_object)
{
  CFNumberType v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<unsigned int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_248A2733C(_Unwind_Exception *exception_object)
{
  CFNumberType v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](this, __n);
    std::vector<unsigned int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_248A273B4(_Unwind_Exception *exception_object)
{
  CFNumberType v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t applesauce::CF::details::at_as<unsigned int>(const __CFArray *a1, unint64_t a2)
{
  if (a1 && CFArrayGetCount(a1) > a2 && (CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2)) != 0)
  {
    uint64_t v5 = applesauce::CF::convert_as<unsigned int,0>(ValueAtIndex);
    unint64_t v6 = v5 & 0xFFFFFF0000000000;
    uint64_t v7 = v5 & 0xFF00000000;
    uint64_t v8 = v5 & 0xFFFFFF00;
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  return v6 | v8 | v7 | v9;
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<unsigned int>(void *a1)
{
  unint64_t v2 = (uint64_t)(a1[1] - *a1) >> 2;
  memset(v7, 0, sizeof(v7));
  std::vector<applesauce::CF::NumberRef>::reserve((uint64_t *)v7, v2);
  uint64_t v4 = (_DWORD *)*a1;
  CFNumberType v3 = (_DWORD *)a1[1];
  while (v4 != v3)
  {
    LODWORD(v8) = *v4;
    std::vector<applesauce::CF::NumberRef>::emplace_back<unsigned int>((uint64_t *)v7, (int *)&v8);
    ++v4;
  }
  CFArrayRef v5 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(v7);
  uint64_t v8 = (void **)v7;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](&v8);
  return v5;
}

void sub_248A274DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void **std::vector<applesauce::CF::NumberRef>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    unint64_t v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    unint64_t v7[3] = (char *)v7[0] + 8 * v6;
    std::vector<applesauce::CF::NumberRef>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(v7);
  }
  return result;
}

void sub_248A2757C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

CFNumberRef *std::vector<applesauce::CF::NumberRef>::emplace_back<unsigned int>(uint64_t *a1, int *a2)
{
  uint64_t v5 = (uint64_t)(a1 + 2);
  unint64_t v4 = a1[2];
  uint64_t v6 = (CFNumberRef *)a1[1];
  if ((unint64_t)v6 >= v4)
  {
    uint64_t v8 = ((uint64_t)v6 - *a1) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v4 - *a1;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int v18 = a1 + 2;
    if (v11) {
      CFNumberType v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), v11);
    }
    else {
      CFNumberType v12 = 0;
    }
    CFNumberType v14 = v12;
    CFNumberType v15 = (CFNumberRef *)&v12[8 * v8];
    unsigned __int8 v17 = &v12[8 * v11];
    std::allocator<applesauce::CF::NumberRef>::construct[abi:ne180100]<applesauce::CF::NumberRef,unsigned int>(v5, v15, a2);
    uint64_t v16 = v15 + 1;
    std::vector<applesauce::CF::NumberRef>::__swap_out_circular_buffer(a1, &v14);
    uint64_t v7 = (CFNumberRef *)a1[1];
    std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(&v14);
  }
  else
  {
    std::allocator<applesauce::CF::NumberRef>::construct[abi:ne180100]<applesauce::CF::NumberRef,unsigned int>((uint64_t)(a1 + 2), v6, a2);
    uint64_t v7 = v6 + 1;
    a1[1] = (uint64_t)(v6 + 1);
  }
  a1[1] = (uint64_t)v7;
  return v7 - 1;
}

void sub_248A27698(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(__p, a1[1] - *a1);
  unint64_t v2 = *a1;
  CFNumberType v3 = a1[1];
  if (*a1 != v3)
  {
    unint64_t v4 = __p[0];
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((uint64_t)__p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return CFArray;
}

void sub_248A27734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<applesauce::CF::NumberRef>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>,std::reverse_iterator<applesauce::CF::NumberRef*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
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
    uint64_t v8 = a7;
    do
    {
      uint64_t v9 = *--a3;
      *(void *)(v8 - 8) = v9;
      v8 -= 8;
      *a3 = 0;
      v7 -= 8;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<applesauce::CF::NumberRef>,std::reverse_iterator<applesauce::CF::NumberRef*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *(CFTypeRef **)(a1[2] + 8);
  unint64_t v2 = *(CFTypeRef **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
      std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100](v3, v1++);
    while (v1 != v2);
  }
}

void std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100](uint64_t a1, CFTypeRef *a2)
{
  if (*a2) {
    CFRelease(*a2);
  }
}

void **std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<applesauce::CF::NumberRef>::clear[abi:ne180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 8;
    std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100](v4, (CFTypeRef *)(i - 8));
  }
}

CFNumberRef std::allocator<applesauce::CF::NumberRef>::construct[abi:ne180100]<applesauce::CF::NumberRef,unsigned int>(uint64_t a1, CFNumberRef *a2, int *a3)
{
  int valuePtr = *a3;
  CFNumberRef result = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a2 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C588600](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_248A27A10(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(uint64_t a1)
{
  CFArrayRef result = CFArrayCreate(0, *(const void ***)a1, (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3, MEMORY[0x263EFFF70]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_248A27A8C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A27AAC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::vector<void const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<void const*>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_248A27B1C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<void const*>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<char>::__throw_length_error[abi:ne180100]();
  }
  CFArrayRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<void const*>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (CFTypeRef *)**a1;
  if (v2)
  {
    uint64_t v4 = (CFTypeRef *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::allocator<applesauce::CF::NumberRef>::destroy[abi:ne180100]((uint64_t)(v1 + 2), --v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void OUTLINED_FUNCTION_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_248A27DF0(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_248A27E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A27EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2Stream;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_248A27FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_248A28274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2840C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A28888(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A28A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A28B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_248A28EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A29090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_248A291D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A29324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A29394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2945C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2961C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A299A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A29B58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A29D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2A2A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void sub_248A2A838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_248A2AAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2AB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2ACC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2AD40(_Unwind_Exception *a1)
{
  MEMORY[0x24C588800](v1, 0x10F3C4052DED294);
  _Unwind_Resume(a1);
}

void sub_248A2B494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  int v18 = v17;

  _Unwind_Resume(a1);
}

void sub_248A2B6E0(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_248A2B79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)ASDTIOA2Device;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_248A2B8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_248A2B958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2BD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_248A2BDD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2BEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10) {
    std::mutex::unlock(a9);
  }
  _Unwind_Resume(a1);
}

void sub_248A2C02C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A2C148(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A2C28C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A2C494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  _Unwind_Resume(a1);
}

void sub_248A2C538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2C770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_248A2CBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::shared_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "shared_lock::unlock: not locked");
    [(ASDTIOA2Device *)v2 handleTransportChanged:v4];
  }
}

void sub_248A2CE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2CEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2D08C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v6 = va_arg(va1, const void *);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_248A2D244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2D2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2D348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2D470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2D5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2D6A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2D7F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2DD0C(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, ...)
{
  va_start(va2, a8);
  va_start(va1, a8);
  va_start(va, a8);
  char v13 = va_arg(va1, const void *);
  va_copy(va2, va1);
  long long v15 = va_arg(va2, const void *);

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  applesauce::CF::TypeRef::~TypeRef((const void **)va1);
  applesauce::CF::ArrayRef::~ArrayRef((const void **)va2);

  _Unwind_Resume(a1);
}

void sub_248A2E020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2E278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2E4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2E614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2E9B8(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A2EDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL std::condition_variable_any::wait_until<std::unique_lock<std::shared_mutex>,std::chrono::system_clock,std::chrono::duration<double,std::ratio<1l,1000000l>>>(uint64_t a1, uint64_t a2, double *a3)
{
  uint64_t v7 = *(std::mutex **)(a1 + 48);
  uint64_t v6 = *(std::__shared_weak_count **)(a1 + 56);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v12.__m_ = v7;
  v12.__owns_ = 1;
  std::mutex::lock(v7);
  std::unique_lock<std::shared_mutex>::unlock(a2);
  if (*a3 > (double)std::chrono::system_clock::now().__d_.__rep_)
  {
    double v9 = *a3 * 1000.0;
    if (v9 >= 9.22337204e18)
    {
      v10.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (v9 <= -9.22337204e18)
    {
      v10.__d_.__rep_ = 0x8000000000000000;
    }
    else
    {
      v10.__d_.__rep_ = (uint64_t)v9;
    }
    std::condition_variable::__do_timed_wait((std::condition_variable *)a1, &v12, v10);
    BOOL v8 = *a3 <= (double)std::chrono::system_clock::now().__d_.__rep_;
  }
  else
  {
    BOOL v8 = 1;
  }
  std::unique_lock<std::mutex>::unlock(&v12);
  std::unique_lock<std::shared_mutex>::lock(a2);
  if (v12.__owns_) {
    std::mutex::unlock(v12.__m_);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v8;
}

void sub_248A2EF94(_Unwind_Exception *a1)
{
  std::mutex::unlock(v2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(a1);
}

void std::unique_lock<std::shared_mutex>::unlock(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    [(ASDTIOA2Device *)v2 _getCurrentFormatForStream:v4];
  }
}

void sub_248A2F100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_248A2F518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_248A2F84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A2F9D0(_Unwind_Exception *a1)
{
  MEMORY[0x24C588800](v1, 0x1081C40DA68619CLL);
  _Unwind_Resume(a1);
}

void sub_248A2FCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 8))(a15);
  }
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A2FDDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A2FF1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3006C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A30188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A302A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A305FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A306F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A307B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef(&a10);

  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::from_ns_noexcept(applesauce::CF::StringRef *this@<X0>, applesauce::CF::StringRef **a2@<X8>)
{
  unsigned int v4 = this;
  if (!v4 || (cf = v4, CFRetain(v4), v5 = CFGetTypeID(cf), v6 = v5 == CFStringGetTypeID(), unsigned int v4 = cf, v6))
  {
    *a2 = v4;
  }
  else
  {
    *a2 = 0;
    CFRelease(cf);
    unsigned int v4 = cf;
  }
}

void sub_248A308F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  applesauce::CF::StringRef::~StringRef(&a9);

  _Unwind_Resume(a1);
}

void sub_248A309B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  applesauce::CF::StringRef::~StringRef((const void **)&a9);
  applesauce::CF::DataRef::~DataRef(&a10);

  _Unwind_Resume(a1);
}

uint64_t ASDT::IOUserClient::CopyProperty<applesauce::CF::DataRef>(ASDT::IOUserClient *a1, const applesauce::CF::StringRef *a2, const applesauce::CF::TypeRef *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::IOUserClient::CopyProperty(a1, a2, (applesauce::CF::TypeRef *)&cf)) {
    uint64_t v5 = ASDT::IOUserClient::ConvertValue((ASDT::IOUserClient *)&cf, a3, v4);
  }
  else {
    uint64_t v5 = 0;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_248A30A38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::DataRef::~DataRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_248A30BBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A30D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A30FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10) {
    std::mutex::unlock(a9);
  }
  _Unwind_Resume(a1);
}

void std::unique_lock<std::mutex>::unlock(std::unique_lock<std::mutex> *this)
{
  if (this->__owns_)
  {
    std::mutex::unlock(this->__m_);
    this->__owns_ = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    [(ASDTIOA2Device *)v2 performPowerStatePrepare:v4];
  }
}

void sub_248A31340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a12) {
    std::mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

void sub_248A31438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_248A3158C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A317AC(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A31930(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A31BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A31C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A31FCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A320D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A32224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_248A322B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A32740(_Unwind_Exception *a1)
{
  std::condition_variable::~condition_variable(v1);
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__shared_ptr_emplace<std::mutex>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FCADDD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::mutex>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FCADDD0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C588800);
}

void std::__shared_ptr_emplace<std::mutex>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

void std::unique_lock<std::shared_mutex>::lock(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_mutex_base **)a1;
  if (v2)
  {
    if (!*(unsigned char *)(a1 + 8))
    {
      std::__shared_mutex_base::lock(v2);
      *(unsigned char *)(a1 + 8) = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  OUTLINED_FUNCTION_0_0(v3, v4, v5, v6, v7);
}

void OUTLINED_FUNCTION_0_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2080;
  return result;
}

void OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 14) = v4;
  *(_WORD *)(a3 + 22) = 1024;
  *(_DWORD *)(a3 + 24) = v3;
}

void OUTLINED_FUNCTION_6_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x1Cu);
}

ASDT::UCObject *ASDT::UCObject::UCObject(ASDT::UCObject *this)
{
  *(void *)this = &unk_26FCADE20;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((unsigned char *)this + 34) = 1;
  return this;
}

{
  *(void *)this = &unk_26FCADE20;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((unsigned char *)this + 34) = 1;
  return this;
}

ASDT::UCObject *ASDT::UCObject::UCObject(ASDT::UCObject *this, int a2)
{
  *(void *)this = &unk_26FCADE20;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((void *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((unsigned char *)this + 34) = 1;
  return this;
}

{
  *(void *)this = &unk_26FCADE20;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = 0;
  *((void *)this + 2) = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *((_WORD *)this + 12) = 257;
  *((_WORD *)this + 16) = 1;
  *((unsigned char *)this + 34) = 1;
  return this;
}

uint64_t ASDT::UCObject::UCObject(uint64_t this, const __CFDictionary *a2)
{
  *(void *)this = &unk_26FCADE20;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = a2;
  *(_WORD *)(this + 24) = 1;
  *(_WORD *)(this + 32) = 0;
  *(unsigned char *)(this + 34) = 0;
  return this;
}

{
  *(void *)this = &unk_26FCADE20;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = a2;
  *(_WORD *)(this + 24) = 1;
  *(_WORD *)(this + 32) = 0;
  *(unsigned char *)(this + 34) = 0;
  return this;
}

ASDT::UCObject *ASDT::UCObject::UCObject(ASDT::UCObject *this, const ASDT::UCObject *a2)
{
  uint64_t v4 = (void (**)(ASDT::UCObject *))&unk_26FCADE20;
  *(void *)this = &unk_26FCADE20;
  *((_DWORD *)this + 2) = *((_DWORD *)a2 + 2);
  *((_DWORD *)this + 3) = 0;
  uint64_t v5 = (const void *)*((void *)a2 + 2);
  *((void *)this + 2) = v5;
  int v6 = *((unsigned __int8 *)a2 + 24);
  *((unsigned char *)this + 24) = v6;
  *((unsigned char *)this + 25) = *((unsigned char *)a2 + 25);
  if (v6 && v5)
  {
    CFRetain(v5);
    uint64_t v4 = *(void (***)(ASDT::UCObject *))this;
  }
  *((_WORD *)this + 16) = *((_WORD *)a2 + 16);
  *((unsigned char *)this + 34) = *((unsigned char *)a2 + 34);
  v4[4](this);
  return this;
}

void sub_248A32C5C(_Unwind_Exception *a1)
{
  CACFDictionary::~CACFDictionary(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::operator=(uint64_t a1, int a2)
{
  io_connect_t v4 = *(_DWORD *)(a1 + 12);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 12) = 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  *(_DWORD *)(a1 + 8) = a2;
  *(unsigned char *)(a1 + 34) = 1;
  *(unsigned char *)(a1 + 32) = 1;
  return a1;
}

uint64_t ASDT::UCObject::CloseConnection(ASDT::UCObject *this)
{
  uint64_t result = *((unsigned int *)this + 3);
  if (result)
  {
    uint64_t result = IOServiceClose(result);
    *((_DWORD *)this + 3) = 0;
  }
  return result;
}

uint64_t ASDT::UCObject::operator=(uint64_t a1, uint64_t a2)
{
  io_connect_t v4 = *(_DWORD *)(a1 + 12);
  if (v4)
  {
    IOServiceClose(v4);
    *(_DWORD *)(a1 + 12) = 0;
  }
  (*(void (**)(uint64_t))(*(void *)a1 + 40))(a1);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  CACFDictionary::operator=(a1 + 16, a2 + 16);
  uint64_t v5 = *(const void **)(a1 + 16);
  if (v5) {
    CFRelease(v5);
  }
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  (*(void (**)(uint64_t))(*(void *)a1 + 32))(a1);
  return a1;
}

uint64_t CACFDictionary::operator=(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_connect_t v4 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v4);
    }
  }
  uint64_t v5 = *(const void **)a2;
  *(void *)a1 = *(void *)a2;
  int v6 = *(unsigned __int8 *)(a2 + 8);
  *(unsigned char *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    CFRetain(v5);
  }
  return a1;
}

void ASDT::UCObject::~UCObject(ASDT::UCObject *this)
{
  uint64_t v2 = (void (**)(ASDT::UCObject *))&unk_26FCADE20;
  *(void *)this = &unk_26FCADE20;
  io_connect_t v3 = *((_DWORD *)this + 3);
  if (v3)
  {
    IOServiceClose(v3);
    *((_DWORD *)this + 3) = 0;
    uint64_t v2 = *(void (***)(ASDT::UCObject *))this;
  }
  v2[6](this);
  CACFDictionary::~CACFDictionary((CACFDictionary *)this + 1);
}

{
  uint64_t vars8;

  ASDT::UCObject::~UCObject(this);
  JUMPOUT(0x24C588800);
}

uint64_t ASDT::UCObject::GetObject(ASDT::UCObject *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t ASDT::UCObject::CopyObject(ASDT::UCObject *this)
{
  return *((unsigned int *)this + 2);
}

BOOL ASDT::UCObject::IsValid(ASDT::UCObject *this)
{
  return *((_DWORD *)this + 2) != 0;
}

BOOL ASDT::UCObject::IsEqualTo(ASDT::UCObject *this, io_object_t a2)
{
  return IOObjectIsEqualTo(*((_DWORD *)this + 2), a2) != 0;
}

BOOL ASDT::UCObject::ConformsTo(ASDT::UCObject *this, const char *a2)
{
  return IOObjectConformsTo(*((_DWORD *)this + 2), a2) != 0;
}

uint64_t ASDT::UCObject::IsServiceAlive(ASDT::UCObject *this)
{
  return *((unsigned __int8 *)this + 34);
}

uint64_t ASDT::UCObject::ServiceWasTerminated(uint64_t this)
{
  *(unsigned char *)(this + 34) = 0;
  return this;
}

BOOL ASDT::UCObject::TestForLiveness(BOOL this)
{
  kern_return_t v1;
  CFMutableDictionaryRef properties;

  if (this)
  {
    properties = 0;
    uint64_t v1 = IORegistryEntryCreateCFProperties(this, &properties, 0, 0);
    if (properties) {
      CFRelease(properties);
    }
    return v1 == 0;
  }
  return this;
}

CFMutableDictionaryRef ASDT::UCObject::CopyProperties(ASDT::UCObject *this)
{
  kern_return_t v2;
  CFMutableDictionaryRef result;
  _DWORD *exception;
  kern_return_t v5;
  CFMutableDictionaryRef properties;

  properties = 0;
  if (*((unsigned char *)this + 33))
  {
    uint64_t v2 = IORegistryEntryCreateCFProperties(*((_DWORD *)this + 2), &properties, 0, 0);
    if (v2)
    {
      uint64_t v5 = v2;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        ASDT::UCObject::CopyProperties();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = v5;
    }
    return properties;
  }
  else
  {
    (*(void (**)(ASDT::UCObject *))(*(void *)this + 24))(this);
    uint64_t result = (CFMutableDictionaryRef)*((void *)this + 2);
    if (result)
    {
      CFRetain(result);
      return (CFMutableDictionaryRef)*((void *)this + 2);
    }
  }
  return result;
}

uint64_t ASDT::UCObject::HasProperty(ASDT::UCObject *this, const __CFString *a2)
{
  v5.var0 = ASDT::UCObject::CopyProperties(this);
  *(_WORD *)&v5.var1 = 1;
  uint64_t HasKey = CACFDictionary::HasKey(&v5, a2);
  CACFDictionary::~CACFDictionary(&v5);
  return HasKey;
}

void sub_248A3314C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CACFDictionary a9)
{
}

uint64_t ASDT::UCObject::CopyProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, BOOL *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::UCObject::CopyProperty_CFType(this, a2, &cf))
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFBooleanGetTypeID())
    {
      *a3 = CFBooleanGetValue((CFBooleanRef)cf) != 0;
    }
    else
    {
      CFTypeID v6 = CFGetTypeID(cf);
      if (v6 != CFNumberGetTypeID())
      {
        uint64_t v5 = 0;
LABEL_12:
        CFRelease(cf);
        return v5;
      }
      CFTypeRef v9 = cf;
      char v10 = 0;
      int valuePtr = 0;
      if (cf)
      {
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
        BOOL v7 = valuePtr != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
      *a3 = v7;
      CACFNumber::~CACFNumber((CACFNumber *)&v9);
    }
    uint64_t v5 = 1;
    goto LABEL_12;
  }
  return 0;
}

void sub_248A33240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ASDT::UCObject::CopyProperty_CFType(ASDT::UCObject *this, CFStringRef key, const void **a3)
{
  if (*((unsigned char *)this + 33))
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)this + 2), key, 0, 0);
    *a3 = CFProperty;
    return CFProperty != 0;
  }
  else
  {
    BOOL v7 = (CACFDictionary *)((char *)this + 16);
    (*(void (**)(ASDT::UCObject *))(*(void *)this + 24))(this);
    uint64_t CFType = CACFDictionary::GetCFType(v7, key, a3);
    if (*a3) {
      CFRetain(*a3);
    }
  }
  return CFType;
}

BOOL ASDT::UCObject::CopyProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, int *a3)
{
  CFTypeRef cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf)) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  BOOL v5 = v4 == CFNumberGetTypeID();
  BOOL v6 = v5;
  if (v5)
  {
    CFTypeRef v9 = cf;
    char v10 = 0;
    int valuePtr = 0;
    if (cf)
    {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
      int v7 = valuePtr;
    }
    else
    {
      int v7 = 0;
    }
    *a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_248A33398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ASDT::UCObject::CopyProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, unsigned int *a3)
{
  CFTypeRef cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf)) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  BOOL v5 = v4 == CFNumberGetTypeID();
  BOOL v6 = v5;
  if (v5)
  {
    CFTypeRef v9 = cf;
    char v10 = 0;
    unsigned int valuePtr = 0;
    if (cf)
    {
      CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt32Type, &valuePtr);
      unsigned int v7 = valuePtr;
    }
    else
    {
      unsigned int v7 = 0;
    }
    *a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_248A3344C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ASDT::UCObject::CopyProperty_Fixed32(ASDT::UCObject *this, const __CFString *a2, float *a3)
{
  CFTypeRef cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf)) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  BOOL v5 = v4 == CFNumberGetTypeID();
  BOOL v6 = v5;
  if (v5)
  {
    CFTypeRef v9 = cf;
    char v10 = 0;
    CACFNumber::GetFixed32((CACFNumber *)&v9);
    *(_DWORD *)a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_248A334E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_Fixed64(ASDT::UCObject *this, const __CFString *a2, double *a3)
{
  CFTypeRef cf = 0;
  if (!ASDT::UCObject::CopyProperty_CFType(this, a2, &cf)) {
    return 0;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  BOOL v5 = v4 == CFNumberGetTypeID();
  BOOL v6 = v5;
  if (v5)
  {
    CFTypeRef v9 = cf;
    char v10 = 0;
    CACFNumber::GetFixed64((CACFNumber *)&v9);
    *(void *)a3 = v7;
    CACFNumber::~CACFNumber((CACFNumber *)&v9);
  }
  CFRelease(cf);
  return v6;
}

void sub_248A33584(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_CFString(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  BOOL result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFStringGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

BOOL ASDT::UCObject::CopyProperty_CFArray(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  BOOL result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFArrayGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

BOOL ASDT::UCObject::CopyProperty_CFDictionary(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  BOOL result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFDictionaryGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

BOOL ASDT::UCObject::CopyProperty_CFData(ASDT::UCObject *this, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  BOOL result = ASDT::UCObject::CopyProperty_CFType(this, a2, &cf);
  if (result)
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFDataGetTypeID())
    {
      *a3 = cf;
      return 1;
    }
    else
    {
      CFRelease(cf);
      return 0;
    }
  }
  return result;
}

void ASDT::UCObject::CopyProperty_CACFString(ASDT::UCObject *this, const __CFString *a2, CACFString *a3)
{
  CFTypeRef cf = 0;
  if (ASDT::UCObject::CopyProperty_CFString(this, a2, &cf))
  {
    CFTypeRef v4 = cf;
    CACFString::operator=((uint64_t)a3, cf);
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

uint64_t CACFString::operator=(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v4 = *(CFTypeRef *)a1;
  if (v4 != cf)
  {
    if (v4) {
      BOOL v5 = *(unsigned char *)(a1 + 8) == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      CFRelease(v4);
    }
    *(void *)a1 = cf;
  }
  *(unsigned char *)(a1 + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void ASDT::UCObject::CopyProperty_CACFArray(ASDT::UCObject *this, const __CFString *a2, CACFArray *a3)
{
  BOOL v5 = 0;
  if (ASDT::UCObject::CopyProperty_CFArray(this, a2, (CFTypeRef *)&v5))
  {
    CFTypeRef v4 = v5;
    CACFArray::operator=((uint64_t)a3, v5);
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

uint64_t CACFArray::operator=(uint64_t a1, const void *a2)
{
  if (!*(unsigned char *)(a1 + 8))
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    return a1;
  }
  CFTypeRef v4 = *(const void **)a1;
  if (!*(void *)a1)
  {
    *(void *)a1 = a2;
    *(unsigned char *)(a1 + 9) = 0;
    if (!a2) {
      return a1;
    }
LABEL_8:
    CFRetain(a2);
    return a1;
  }
  CFRelease(v4);
  int v5 = *(unsigned __int8 *)(a1 + 8);
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 9) = 0;
  if (a2 && v5) {
    goto LABEL_8;
  }
  return a1;
}

void ASDT::UCObject::CopyProperty_CACFDictionary(ASDT::UCObject *this, const __CFString *a2, CACFDictionary *a3)
{
  int v5 = 0;
  if (ASDT::UCObject::CopyProperty_CFDictionary(this, a2, (CFTypeRef *)&v5))
  {
    CFTypeRef v4 = v5;
    CACFArray::operator=((uint64_t)a3, v5);
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

uint64_t ASDT::UCObject::CopyProperty_CACFType(CACFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  int v5 = a1 + 1;
  (*((void (**)(CACFDictionary *))a1->var0 + 3))(a1);
  CFTypeRef cf = 0;
  uint64_t result = CACFDictionary::GetCFType(v5, a2, &cf);
  if (result) {
    return CACFObject<void const*>::operator=(a3, cf);
  }
  return result;
}

uint64_t CACFObject<void const*>::operator=(uint64_t a1, CFTypeRef cf)
{
  if (*(unsigned char *)(a1 + 8))
  {
    CFTypeRef v4 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v4);
    }
  }
  *(void *)a1 = cf;
  *(unsigned char *)(a1 + 8) = 1;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

uint64_t ASDT::UCObject::SetProperty(ASDT::UCObject *this, const __CFString *a2, const void *a3)
{
  uint64_t result = IORegistryEntrySetCFProperty(*((_DWORD *)this + 2), a2, a3);
  if (result)
  {
    int v5 = result;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::UCObject::SetProperty();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = v5;
  }
  return result;
}

void ASDT::UCObject::SetProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v6 = 1;
  ASDT::UCObject::SetProperty(this, a2, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v5);
}

void sub_248A33B34(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v6 = 1;
  ASDT::UCObject::SetProperty(this, a2, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v5);
}

void sub_248A33BAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v6 = 1;
  ASDT::UCObject::SetProperty(this, a2, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v5);
}

void sub_248A33C24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::PropertiesChanged(uint64_t this)
{
  *(unsigned char *)(this + 32) = 1;
  return this;
}

void ASDT::UCObject::CacheProperties(ASDT::UCObject *this)
{
  kern_return_t v3;
  kern_return_t v4;
  _DWORD *exception;
  CFMutableDictionaryRef properties;

  if (!*((unsigned char *)this + 33))
  {
    io_registry_entry_t v2 = *((_DWORD *)this + 2);
    if (v2)
    {
      if (*((unsigned char *)this + 32))
      {
        properties = 0;
        io_connect_t v3 = IORegistryEntryCreateCFProperties(v2, &properties, 0, 0);
        if (v3)
        {
          CFTypeRef v4 = v3;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            ASDT::UCObject::CacheProperties();
          }
          exception = __cxa_allocate_exception(0x10uLL);
          *(void *)exception = &unk_26FCADEB8;
          exception[2] = v4;
        }
        CACFDictionary::SetCFMutableDictionaryFromCopy((CACFDictionary *)this + 1, properties, 1);
        if (properties) {
          CFRelease(properties);
        }
        *((unsigned char *)this + 32) = 0;
      }
    }
  }
}

__CFDictionary *CACFDictionary::SetCFMutableDictionaryFromCopy(CACFDictionary *this, CFDictionaryRef theDict, BOOL a3)
{
  if (this->var1)
  {
    var0 = this->var0;
    if (this->var0) {
      CFRelease(var0);
    }
  }
  uint64_t result = CFDictionaryCreateMutableCopy(0, 0, theDict);
  this->var0 = result;
  this->var2 = 1;
  this->var1 = a3;
  return result;
}

uint64_t ASDT::UCObject::CopyProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, BOOL *a4)
{
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (CFProperty)
  {
    CFBooleanRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFBooleanGetTypeID())
    {
      LOBYTE(a3->isa) = CFBooleanGetValue(v6) != 0;
    }
    else
    {
      CFTypeID v9 = CFGetTypeID(v6);
      if (v9 != CFNumberGetTypeID())
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      CFBooleanRef v11 = v6;
      char v12 = 0;
      int valuePtr = 0;
      CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
      LOBYTE(a3->isa) = valuePtr != 0;
      CACFNumber::~CACFNumber((CACFNumber *)&v11);
    }
    uint64_t v8 = 1;
LABEL_9:
    CFRelease(v6);
    return v8;
  }
  return 0;
}

void sub_248A33E64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, int *a4)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty) {
    return 0;
  }
  CFNumberRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  BOOL v8 = v7 == CFNumberGetTypeID();
  BOOL v9 = v8;
  if (v8)
  {
    CFNumberRef v11 = v6;
    char v12 = 0;
    int valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    LODWORD(a3->isa) = valuePtr;
    CACFNumber::~CACFNumber((CACFNumber *)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_248A33F14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::CopyProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, unsigned int *a4)
{
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (!CFProperty) {
    return 0;
  }
  CFNumberRef v6 = CFProperty;
  CFTypeID v7 = CFGetTypeID(CFProperty);
  BOOL v8 = v7 == CFNumberGetTypeID();
  BOOL v9 = v8;
  if (v8)
  {
    CFNumberRef v11 = v6;
    char v12 = 0;
    int valuePtr = 0;
    CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr);
    LODWORD(a3->isa) = valuePtr;
    CACFNumber::~CACFNumber((CACFNumber *)&v11);
  }
  CFRelease(v6);
  return v9;
}

void sub_248A33FC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::CopyProperty_CFString(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFString **a4)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    CFNumberRef v6 = (void *)result;
    CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFStringGetTypeID())
    {
      a3->isa = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

uint64_t ASDT::UCObject::CopyProperty_CFArray(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFArray **a4)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    CFNumberRef v6 = (void *)result;
    CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFArrayGetTypeID())
    {
      a3->isa = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

uint64_t ASDT::UCObject::CopyProperty_CFDictionary(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFDictionary **a4)
{
  uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, a2, 0, 0);
  if (result)
  {
    CFNumberRef v6 = (void *)result;
    CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFDictionaryGetTypeID())
    {
      a3->isa = v6;
      return 1;
    }
    else
    {
      CFRelease(v6);
      return 0;
    }
  }
  return result;
}

void ASDT::UCObject::CopyProperty_CACFString(io_registry_entry_t a1, const __CFString *a2, uint64_t a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a2, 0, 0);
  if (CFProperty)
  {
    CFNumberRef v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 == CFStringGetTypeID())
    {
      CACFString::operator=(a3, v5);
      CFRelease(v5);
      return;
    }
    CFRelease(v5);
  }
  if (*(void *)a3)
  {
    if (*(unsigned char *)(a3 + 8)) {
      CFRelease(*(CFTypeRef *)a3);
    }
    *(void *)a3 = 0;
  }
  *(unsigned char *)(a3 + 8) = 1;
}

uint64_t ASDT::UCObject::SetProperty(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  uint64_t result = IORegistryEntrySetCFProperty((io_registry_entry_t)this, a2, a3);
  if (result)
  {
    int v6 = result;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::UCObject::SetProperty();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = v6;
  }
  return result;
}

void ASDT::UCObject::SetProperty_BOOL(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3)
{
  int valuePtr = (int)a3;
  CFStringRef v6 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v7 = 1;
  ASDT::UCObject::SetProperty(this, a2, v6, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
}

void sub_248A342A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_SInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3)
{
  int valuePtr = (int)a3;
  CFStringRef v6 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v7 = 1;
  ASDT::UCObject::SetProperty(this, a2, v6, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
}

void sub_248A34320(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

void ASDT::UCObject::SetProperty_UInt32(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3)
{
  int valuePtr = (int)a3;
  CFStringRef v6 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  char v7 = 1;
  ASDT::UCObject::SetProperty(this, a2, v6, v5);
  CACFNumber::~CACFNumber((CACFNumber *)&v6);
}

void sub_248A34398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFNumber::~CACFNumber((CACFNumber *)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::UCObject::CopyMatchingObjectWithPropertyValue(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  uint64_t v4 = 0;
  if (this && a2 && a3)
  {
    mach_port_t v29 = 0;
    int v8 = MEMORY[0x24C588000](*MEMORY[0x263EF87F0], &v29, a3, a4);
    if (v8)
    {
      int v11 = v8;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        ASDT::UCObject::CopyMatchingObjectWithPropertyValue();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = v11;
    }
    CFRetain(this);
    unsigned int v23 = (void (**)(void **))&unk_26FCADE20;
    uint64_t v24 = 0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    __int16 v26 = 257;
    __int16 v27 = 1;
    char v28 = 1;
    io_iterator_t existing = 0;
    if (!IOServiceGetMatchingServices(v29, this, &existing) && existing)
    {
      io_iterator_t iterator = existing;
      char v21 = 1;
      v15.var0 = (__CFDictionary *)&unk_26FCADE20;
      *(_DWORD *)&v15.var1 = IOIteratorNext(existing);
      *(_DWORD *)(&v15.var2 + 3) = 0;
      CFMutableDictionaryRef v16 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      __int16 v17 = 257;
      __int16 v18 = 1;
      char v19 = 1;
      while (!v24 && *(_DWORD *)&v15.var1)
      {
        CFTypeRef cf1 = 0;
        char v14 = 1;
        ASDT::UCObject::CopyProperty_CACFType(&v15, a2, (uint64_t)&cf1);
        if (cf1 && CFEqual(cf1, a3))
        {
          (*((void (**)(CACFDictionary *))v15.var0 + 4))(&v15);
          ASDT::UCObject::operator=((uint64_t)&v23, *(int *)&v15.var1);
        }
        io_object_t v9 = IOIteratorNext(iterator);
        ASDT::UCObject::operator=((uint64_t)&v15, v9);
        CACFObject<void const*>::~CACFObject((uint64_t)&cf1);
      }
      ASDT::UCObject::~UCObject((ASDT::UCObject *)&v15);
      ASDT::UCIterator::~UCIterator(&iterator);
    }
    v23[4]((void **)&v23);
    uint64_t v4 = v24;
    ASDT::UCObject::~UCObject((ASDT::UCObject *)&v23);
  }
  return v4;
}

void sub_248A34648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, io_object_t a18, uint64_t a19, char a20)
{
}

uint64_t ASDT::UCIterator::UCIterator(uint64_t this, int a2, char a3)
{
  *(_DWORD *)this = a2;
  *(unsigned char *)(this + 4) = a3;
  return this;
}

{
  *(_DWORD *)this = a2;
  *(unsigned char *)(this + 4) = a3;
  return this;
}

uint64_t ASDT::UCIterator::Next(io_iterator_t *this)
{
  return IOIteratorNext(*this);
}

uint64_t ASDT::UCObject::CopyChildWithIntegerPropertyValues(ASDT::UCObject *this, const __CFString *a2, const __CFString *a3, const __CFString *a4, const __CFString *a5)
{
  uint64_t v5 = 0;
  if (this && a2 && a4)
  {
    int v8 = (int)a5;
    int v9 = (int)a3;
    __int16 v27 = (void (**)(void **))&unk_26FCADE20;
    uint64_t v28 = 0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    __int16 v30 = 257;
    __int16 v31 = 1;
    char v32 = 1;
    io_iterator_t iterator = 0;
    char v26 = 1;
    if (MEMORY[0x24C588080](this, "IOService", &iterator))
    {
      io_iterator_t iterator = 0;
    }
    else if (iterator)
    {
      __int16 v18 = (void (**)(void **))&unk_26FCADE20;
      io_object_t v19 = IOIteratorNext(iterator);
      int v20 = 0;
      CFMutableDictionaryRef v21 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      __int16 v22 = 257;
      __int16 v23 = 1;
      char v24 = 1;
      while (!v28 && v19)
      {
        unsigned int v17 = 0;
        BOOL v11 = ASDT::UCObject::CopyProperty_UInt32((ASDT::UCObject *)&v18, a2, &v17);
        unsigned int v16 = 0;
        if ((v11 & ASDT::UCObject::CopyProperty_UInt32((ASDT::UCObject *)&v18, a4, &v16)) == 1
          && v17 == v9
          && v16 == v8)
        {
          v18[4]((void **)&v18);
          ASDT::UCObject::operator=((uint64_t)&v27, v19);
        }
        io_object_t v14 = IOIteratorNext(iterator);
        ASDT::UCObject::operator=((uint64_t)&v18, v14);
      }
      ASDT::UCObject::~UCObject((ASDT::UCObject *)&v18);
    }
    v27[4]((void **)&v27);
    uint64_t v5 = v28;
    ASDT::UCIterator::~UCIterator(&iterator);
    ASDT::UCObject::~UCObject((ASDT::UCObject *)&v27);
  }
  return v5;
}

void sub_248A348D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  ASDT::UCIterator::~UCIterator((io_object_t *)va);
  ASDT::UCObject::~UCObject((ASDT::UCObject *)va1);
  _Unwind_Resume(a1);
}

ASDT::UCIterator *ASDT::UCIterator::UCIterator(ASDT::UCIterator *this, uint64_t a2, const char *a3)
{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 1;
  if (MEMORY[0x24C588080](a2, a3, this)) {
    *(_DWORD *)this = 0;
  }
  return this;
}

{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 1;
  if (MEMORY[0x24C588090](a2, a3, this)) {
    *(_DWORD *)this = 0;
  }
  return this;
}

{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 1;
  if (MEMORY[0x24C588080](a2, a3, this)) {
    *(_DWORD *)this = 0;
  }
  return this;
}

{
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 4) = 1;
  if (MEMORY[0x24C588090](a2, a3, this)) {
    *(_DWORD *)this = 0;
  }
  return this;
}

BOOL ASDT::UCIterator::IsValid(ASDT::UCIterator *this)
{
  return *(_DWORD *)this != 0;
}

uint64_t ASDT::UCObject::CopyParentByClassName(ASDT::UCObject *this, const char *a2, const char *a3, const char *a4)
{
  io_object_t v15 = 0;
  char v16 = 1;
  if (MEMORY[0x24C588090](this, a3, &v15, a4))
  {
    uint64_t v5 = 0;
    io_object_t v15 = 0;
  }
  else if (v15)
  {
    uint64_t v8 = (void (**)(void **))&unk_26FCADE20;
    io_object_t object = IOIteratorNext(v15);
    int v10 = 0;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    __int16 v12 = 257;
    __int16 v13 = 1;
    char v14 = 1;
    while (1)
    {
      if (!object)
      {
        uint64_t v5 = 0;
        goto LABEL_11;
      }
      if (IOObjectConformsTo(object, a2)) {
        break;
      }
      io_object_t v6 = IOIteratorNext(v15);
      ASDT::UCObject::operator=((uint64_t)&v8, v6);
    }
    v8[4]((void **)&v8);
    uint64_t v5 = object;
LABEL_11:
    ASDT::UCObject::~UCObject((ASDT::UCObject *)&v8);
  }
  else
  {
    uint64_t v5 = 0;
  }
  ASDT::UCIterator::~UCIterator(&v15);
  return v5;
}

void sub_248A34A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ASDT::UCObject::~UCObject((ASDT::UCObject *)&a9);
  ASDT::UCIterator::~UCIterator((io_object_t *)(v9 - 24));
  _Unwind_Resume(a1);
}

BOOL ASDT::UCObject::IsConnectionOpen(ASDT::UCObject *this)
{
  return *((_DWORD *)this + 3) != 0;
}

uint64_t ASDT::UCObject::OpenConnection(ASDT::UCObject *this, uint32_t type)
{
  uint64_t result = *((unsigned int *)this + 2);
  if (result)
  {
    int v5 = *((_DWORD *)this + 3);
    uint64_t v4 = (io_connect_t *)((char *)this + 12);
    if (!v5)
    {
      uint64_t result = IOServiceOpen(result, *MEMORY[0x263EF8960], type, v4);
      if (result)
      {
        int v7 = result;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          ASDT::UCObject::OpenConnection();
        }
        exception = __cxa_allocate_exception(0x10uLL);
        *(void *)exception = &unk_26FCADEB8;
        exception[2] = v7;
      }
    }
  }
  return result;
}

uint64_t ASDT::UCObject::SetConnectionNotificationPort(ASDT::UCObject *this, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = *((unsigned int *)this + 3);
  if (result)
  {
    int v5 = a3;
    uint64_t result = MEMORY[0x24C587FB0](result, a2, a3, a4);
    if (v5)
    {
      if (result)
      {
        int v7 = result;
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          ASDT::UCObject::SetConnectionNotificationPort();
        }
        exception = __cxa_allocate_exception(0x10uLL);
        *(void *)exception = &unk_26FCADEB8;
        exception[2] = v7;
      }
    }
  }
  return result;
}

uint64_t ASDT::UCObject::MapMemory(ASDT::UCObject *this, unsigned int a2, unsigned int a3, unsigned int *a4)
{
  if (*((_DWORD *)this + 3) && *((unsigned char *)this + 34))
  {
    int v4 = MEMORY[0x24C587FA0]();
    if (v4)
    {
      int v6 = v4;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        ASDT::UCObject::MapMemory();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = v6;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        ASDT::UCObject::MapMemory();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
  }
  return 0;
}

uint64_t ASDT::UCObject::ReleaseMemory(uint64_t this, void *a2)
{
  if (a2)
  {
    this = *(unsigned int *)(this + 12);
    if (this) {
      JUMPOUT(0x24C587FE0);
    }
  }
  return this;
}

uint64_t ASDT::UCObject::CallMethod(ASDT::UCObject *this, uint32_t a2, const unint64_t *a3, uint32_t a4, const void *a5, size_t a6, unint64_t *a7, unsigned int *a8, void *outputStruct, unint64_t *a10)
{
  mach_port_t v11 = *((_DWORD *)this + 3);
  if (v11 && *((unsigned char *)this + 34)) {
    return IOConnectCallMethod(v11, a2, a3, a4, a5, a6, a7, a8, outputStruct, a10);
  }
  else {
    return 1937010544;
  }
}

uint64_t ASDT::UCObject::CallTrap(ASDT::UCObject *this, uint32_t a2)
{
  io_connect_t v3 = *((_DWORD *)this + 3);
  if (v3 && *((unsigned char *)this + 34)) {
    return IOConnectTrap0(v3, a2);
  }
  else {
    return 1937010544;
  }
}

uint64_t ASDT::UCObject::Retain(ASDT::UCObject *this)
{
  uint64_t result = *((unsigned int *)this + 2);
  if (result) {
    return IOObjectRetain(result);
  }
  return result;
}

uint64_t ASDT::UCObject::Release(ASDT::UCObject *this)
{
  uint64_t result = *((unsigned int *)this + 2);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 2) = 0;
  }
  return result;
}

__CFDictionary *ASDT::UCObject::Clear(ASDT::UCObject *this)
{
  uint64_t v1 = (CACFDictionary *)((char *)this + 16);
  (*(void (**)(ASDT::UCObject *))(*(void *)this + 48))(this);
  return CACFDictionary::SetCFMutableDictionaryToEmpty(v1, 1);
}

__CFDictionary *CACFDictionary::SetCFMutableDictionaryToEmpty(CACFDictionary *this, BOOL a2)
{
  if (this->var1)
  {
    var0 = this->var0;
    if (this->var0) {
      CFRelease(var0);
    }
  }
  uint64_t result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  this->var0 = result;
  this->var2 = 1;
  this->var1 = a2;
  return result;
}

uint64_t ASDT::UCIterator::UCIterator(uint64_t this)
{
  *(_DWORD *)this = 0;
  *(unsigned char *)(this + 4) = 1;
  return this;
}

{
  *(_DWORD *)this = 0;
  *(unsigned char *)(this + 4) = 1;
  return this;
}

ASDT::UCIterator *ASDT::UCIterator::UCIterator(ASDT::UCIterator *this, io_object_t *a2)
{
  io_object_t v3 = *a2;
  *(_DWORD *)this = *a2;
  *((unsigned char *)this + 4) = *((unsigned char *)a2 + 4);
  if (v3) {
    IOObjectRetain(v3);
  }
  return this;
}

{
  io_object_t v3;

  io_object_t v3 = *a2;
  *(_DWORD *)this = *a2;
  *((unsigned char *)this + 4) = *((unsigned char *)a2 + 4);
  if (v3) {
    IOObjectRetain(v3);
  }
  return this;
}

uint64_t ASDT::UCIterator::Retain(ASDT::UCIterator *this)
{
  uint64_t result = *(unsigned int *)this;
  if (result) {
    return IOObjectRetain(result);
  }
  return result;
}

io_iterator_t *ASDT::UCIterator::UCIterator(io_iterator_t *existing, __CFDictionary *a2)
{
  *io_iterator_t existing = 0;
  *((unsigned char *)existing + 4) = 1;
  if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], a2, existing)) {
    *io_iterator_t existing = 0;
  }
  return existing;
}

{
  *io_iterator_t existing = 0;
  *((unsigned char *)existing + 4) = 1;
  if (IOServiceGetMatchingServices(*MEMORY[0x263F0EC88], a2, existing)) {
    *io_iterator_t existing = 0;
  }
  return existing;
}

uint64_t ASDT::UCIterator::operator=(uint64_t a1, io_object_t object)
{
  if (*(unsigned char *)(a1 + 4))
  {
    io_object_t v4 = *(_DWORD *)a1;
    if (v4) {
      IOObjectRelease(v4);
    }
  }
  *(_DWORD *)a1 = object;
  if (object) {
    IOObjectRetain(object);
  }
  return a1;
}

uint64_t ASDT::UCIterator::Release(uint64_t this)
{
  if (*(unsigned char *)(this + 4))
  {
    uint64_t v1 = (_DWORD *)this;
    this = *(unsigned int *)this;
    if (this)
    {
      this = IOObjectRelease(this);
      _DWORD *v1 = 0;
    }
  }
  return this;
}

uint64_t ASDT::UCIterator::operator=(uint64_t a1, io_object_t *a2)
{
  if (*(unsigned char *)(a1 + 4))
  {
    io_object_t v4 = *(_DWORD *)a1;
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)a1 = 0;
    }
  }
  io_object_t v5 = *a2;
  *(_DWORD *)a1 = *a2;
  if (v5) {
    IOObjectRetain(v5);
  }
  return a1;
}

void ASDT::UCIterator::~UCIterator(io_object_t *this)
{
  if (*((unsigned char *)this + 4))
  {
    io_object_t v2 = *this;
    if (v2)
    {
      IOObjectRelease(v2);
      *this = 0;
    }
  }
}

uint64_t ASDT::UCIterator::GetIterator(ASDT::UCIterator *this)
{
  return *(unsigned int *)this;
}

uint64_t ASDT::UCIterator::SetWillRelease(uint64_t this, char a2)
{
  *(unsigned char *)(this + 4) = a2;
  return this;
}

void CACFDictionary::~CACFDictionary(CACFDictionary *this)
{
  if (this->var1)
  {
    var0 = this->var0;
    if (this->var0) {
      CFRelease(var0);
    }
  }
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x24C588800);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

void CACFNumber::~CACFNumber(CACFNumber *this)
{
  if (*((unsigned char *)this + 8))
  {
    io_object_t v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

uint64_t CACFObject<void const*>::~CACFObject(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    io_object_t v2 = *(const void **)a1;
    if (*(void *)a1)
    {
      CFRelease(v2);
      *(void *)a1 = 0;
    }
  }
  return a1;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_248A35448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A35550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A35678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A35998(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A35A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A36234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,id location,std::recursive_mutex *a23,char a24)
{
  objc_destroyWeak(v28);

  objc_destroyWeak(&location);
  if (a24) {
    std::recursive_mutex::unlock(a23);
  }

  _Unwind_Resume(a1);
}

uint64_t ASDT::exceptionBarrierReturnSuccess(void *a1)
{
  uint64_t v1 = a1;
  v1[2]();

  return 1;
}

void sub_248A363DC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v14 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
      a11 = v14;
      io_object_t v15 = ASDTBaseLogType();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109634;
        DWORD1(buf) = v14;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        _os_log_impl(&dword_248A1B000, v15, OS_LOG_TYPE_DEFAULT, "Caught CAException %d %4.4s", (uint8_t *)&buf, 0x18u);
      }
    }
    else if (a2 == 3)
    {
      char v16 = __cxa_begin_catch(a1);
      io_object_t v15 = ASDTBaseLogType();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = (*(uint64_t (**)(void *))(*(void *)v16 + 16))(v16);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_248A1B000, v15, OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      __int16 v18 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v19 = *v18;
        a11 = *v18;
        io_object_t v15 = ASDTBaseLogType();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v19;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_248A1B000, v15, OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        io_object_t v15 = ASDTBaseLogType();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_248A1B000, v15, OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    JUMPOUT(0x248A363A4);
  }
  _Unwind_Resume(a1);
}

void sub_248A366FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c63_ZTSKZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__E3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(id *)(a2 + 32);
  objc_copyWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __destroy_helper_block_ea8_32c63_ZTSKZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__E3__0(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
  io_object_t v2 = *(void **)(a1 + 32);
}

void sub_248A367DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  int v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2LegacyDevice;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_248A36B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10) {
    std::mutex::unlock(a9);
  }
  _Unwind_Resume(a1);
}

void sub_248A36C78(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A36EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::mutex *a9, char a10)
{
  if (a10) {
    std::mutex::unlock(a9);
  }
  _Unwind_Resume(a1);
}

void sub_248A37008(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A3720C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_248A372CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_248A37554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::recursive_mutex *a11, char a12)
{
  _Unwind_Resume(a1);
}

void sub_248A37994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(a1);
}

void std::unique_lock<std::recursive_mutex>::unlock(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)a1);
    *(unsigned char *)(a1 + 8) = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    [(ASDTIOA2LegacyDevice *)v2 handleTransportChanged:v4];
  }
}

void sub_248A37B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A37B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A37D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  _Unwind_Resume(a1);
}

void sub_248A37F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CACFDictionary a13, char a14)
{
  CACFArray::~CACFArray((CACFArray *)&a14);
  uint64_t v16 = 0;
  while (1)
  {
    uint64_t v17 = *(void **)(v14 + v16 + 24);
    if (v17)
    {
      *(void *)(v14 + v16 + 32) = v17;
      operator delete(v17);
    }
    v16 -= 24;
    if (v16 == -48) {
      _Unwind_Resume(a1);
    }
  }
}

void sub_248A38124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3828C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A384BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3865C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A38830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v20 = 0;
  while (1)
  {
    CFMutableDictionaryRef v21 = *(void **)(&a15 + v20 + 24);
    if (v21)
    {
      *(void *)(&a15 + v20 + 32) = v21;
      operator delete(v21);
    }
    v20 -= 24;
    if (v20 == -48) {
      _Unwind_Resume(a1);
    }
  }
}

void clearMark(NSArray *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = a1;
  uint64_t v2 = [(NSArray *)v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        io_object_t v5 = *(void **)(*((void *)&v6 + 1) + 8 * v4);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v5, "setMarked:", 0, (void)v6);
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [(NSArray *)v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v2);
  }
}

void sub_248A38A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A38C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_248A38F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void std::unique_lock<std::recursive_mutex>::lock(uint64_t a1)
{
  uint64_t v2 = *(std::recursive_mutex **)a1;
  if (v2)
  {
    if (!*(unsigned char *)(a1 + 8))
    {
      std::recursive_mutex::lock(v2);
      *(unsigned char *)(a1 + 8) = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  [(ASDTIOA2LegacyDevice *)v3 deviceName];
}

void sub_248A390DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3916C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c47_ZTSKZ34__ASDTIOA2LegacyDevice_deviceName_E3__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A39288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A39318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c45_ZTSKZ32__ASDTIOA2LegacyDevice_modelUID_E3__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A39430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A394C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_manufacturerName_E3__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A395CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<double ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A39650(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_samplingRate_E3__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A39758(_Unwind_Exception *a1)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_248A39BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,std::mutex *a37,char a38,void *__p,char a40,int a41,int a42,__int16 a43,char a44,char a45)
{
  if (a45 < 0) {
    operator delete(__p);
  }
  if (a16 < 0) {
    operator delete(a11);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a22 < 0)
  {
    operator delete(a17);
    if ((v46 & 1) == 0)
    {
LABEL_14:
      if (a38) {
        std::mutex::unlock(a37);
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v46)
  {
    goto LABEL_14;
  }
  __cxa_free_exception(v45);
  goto LABEL_14;
}

__n128 __copy_helper_block_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_setSamplingRate__E3__6(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[2] = result;
  return result;
}

void sub_248A39EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_248A39FD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, std::recursive_mutex *a12, char a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  if (a2)
  {
    if (a13) {
      std::recursive_mutex::unlock(a12);
    }
    if (a2 == 4)
    {
      int v23 = *((_DWORD *)__cxa_begin_catch(exception_object) + 2);
      a11 = v23;
      char v24 = ASDTBaseLogType();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)(v20 - 48) = 67109634;
        *(_DWORD *)(v20 - 44) = v23;
        *(_WORD *)(v20 - 40) = 1040;
        *(_DWORD *)(v20 - 38) = 4;
        *(_WORD *)(v20 - 34) = 2080;
        *(void *)(v20 - 32) = &a11;
        _os_log_impl(&dword_248A1B000, v24, OS_LOG_TYPE_DEFAULT, "Caught CAException %d %4.4s", (uint8_t *)(v20 - 48), 0x18u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v25 = __cxa_begin_catch(exception_object);
      char v24 = ASDTBaseLogType();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = (*(uint64_t (**)(void *))(*(void *)v25 + 16))(v25);
        *(_DWORD *)(v20 - 48) = 136315138;
        *(void *)(v20 - 44) = v26;
        _os_log_impl(&dword_248A1B000, v24, OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)(v20 - 48), 0xCu);
      }
    }
    else
    {
      __int16 v27 = (int *)__cxa_begin_catch(exception_object);
      if (a2 == 2)
      {
        int v28 = *v27;
        a11 = *v27;
        char v24 = ASDTBaseLogType();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)(v20 - 48) = 67109634;
          *(_DWORD *)(v20 - 44) = v28;
          *(_WORD *)(v20 - 40) = 1040;
          *(_DWORD *)(v20 - 38) = 4;
          *(_WORD *)(v20 - 34) = 2080;
          *(void *)(v20 - 32) = &a11;
          _os_log_impl(&dword_248A1B000, v24, OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)(v20 - 48), 0x18u);
        }
      }
      else
      {
        char v24 = ASDTBaseLogType();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)(v20 - 48) = 0;
          _os_log_impl(&dword_248A1B000, v24, OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)(v20 - 48), 2u);
        }
      }
    }

    __cxa_end_catch();
    if (a20)
    {
      (*(void (**)(uint64_t))(*(void *)a20 + 48))(a20);
      JUMPOUT(0x248A39F98);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  _Unwind_Resume(exception_object);
}

void sub_248A3A360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3A3E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_inputLatency_E3__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3A4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3A568(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c50_ZTSKZ37__ASDTIOA2LegacyDevice_outputLatency_E3__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3A670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3A6F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c55_ZTSKZ41__ASDTIOA2LegacyDevice_inputSafetyOffset_E4__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3A7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3A878(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c56_ZTSKZ42__ASDTIOA2LegacyDevice_outputSafetyOffset_E4__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3A980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3A9FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c51_ZTSKZ37__ASDTIOA2LegacyDevice_transportType_E4__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3AB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_248A3AB80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  if (a10) {
    std::recursive_mutex::unlock(a9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __copy_helper_block_ea8_32c49_ZTSKZ35__ASDTIOA2LegacyDevice_clockDomain_E4__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3ADC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3AEFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B49C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B5B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3B6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3BA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_248A3BAF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3BD38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3BE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c47_ZTSKZ33__ASDTIOA2LegacyDevice_doStartIO_E4__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

uint64_t __copy_helper_block_ea8_32c46_ZTSKZ32__ASDTIOA2LegacyDevice_doStopIO_E4__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = *(void *)(a2 + 32);
  return result;
}

void sub_248A3C290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14) {
    std::mutex::unlock(a13);
  }
  _Unwind_Resume(a1);
}

void std::unique_lock<std::mutex>::lock(std::unique_lock<std::mutex> *this)
{
  m = this->__m_;
  if (m)
  {
    if (!this->__owns_)
    {
      std::mutex::lock(m);
      this->__owns_ = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  [(ASDTIOA2LegacyDevice *)v3 performStopIO];
}

void sub_248A3C598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::mutex *a13, char a14)
{
  if (a14) {
    std::mutex::unlock(a13);
  }
  _Unwind_Resume(a1);
}

void sub_248A3C72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A3C918(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A3CAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 __copy_helper_block_ea8_32c66_ZTSKZ52__ASDTIOA2LegacyDevice__setControlValue_forControl__E4__16(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[2];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  a1[2] = result;
  return result;
}

void sub_248A3CF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3D048(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3D17C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A3D1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__ENK3__0clEv_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleMachPortMessage];
}

void sub_248A3D588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void CACFArray::~CACFArray(CACFArray *this)
{
  if (*((unsigned char *)this + 8))
  {
    uint64_t v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

id ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1[2]();

  return v2;
}

void sub_248A3D668(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v15 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
      a11 = v15;
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109634;
        DWORD1(buf) = v15;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught CAException %d %4.4s", (uint8_t *)&buf, 0x18u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v17 = __cxa_begin_catch(a1);
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v17 + 16))(v17);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v19 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v20 = *v19;
        a11 = *v19;
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v20;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    std::function<objc_object * ()(void)>::operator()(v13);
    objc_claimAutoreleasedReturnValue();
    JUMPOUT(0x248A3D61CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<objc_object * ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x24C588800);
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::~__func(uint64_t a1)
{
  JUMPOUT(0x24C588800);
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  void *v2 = &unk_26FCAE1F0;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FCAE1F0;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::destroy(uint64_t a1)
{
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::destroy_deallocate(id *a1)
{
  operator delete(a1);
}

id std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::operator()(uint64_t a1)
{
  return std::__invoke_void_return_wrapper<objc_object * {__strong},false>::__call[abi:ne180100]<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1} &>((id *)(a1 + 8));
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::target_type()
{
}

id std::__invoke_void_return_wrapper<objc_object * {__strong},false>::__call[abi:ne180100]<decltype(({parm#1})()) ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1} &>(id *a1)
{
  return *a1;
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

void *std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

double ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  double v2 = v1[2]();

  return v2;
}

void sub_248A3DCC0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v15 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
      a11 = v15;
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109634;
        DWORD1(buf) = v15;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught CAException %d %4.4s", (uint8_t *)&buf, 0x18u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v17 = __cxa_begin_catch(a1);
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v17 + 16))(v17);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v19 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v20 = *v19;
        a11 = *v19;
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v20;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    std::function<double ()(void)>::operator()(v13);
    JUMPOUT(0x248A3DC80);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<double ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  double v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::~__func()
{
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26FCAE280;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26FCAE280;
  a2[1] = v2;
  return result;
}

double std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::operator()(uint64_t a1)
{
  return *(double *)(a1 + 8);
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(double({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,double ()(void)>::target_type()
{
}

void *std::__function::__value_func<double ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void ASDT::exceptionBarrier<void({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  v1[2]();
}

void sub_248A3E154(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v15 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
      a11 = v15;
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109634;
        DWORD1(buf) = v15;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught CAException %d %4.4s", (uint8_t *)&buf, 0x18u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v17 = __cxa_begin_catch(a1);
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v17 + 16))(v17);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v19 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v20 = *v19;
        a11 = *v19;
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v20;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    std::function<void ()(void)>::operator()(v13);
    JUMPOUT(0x248A3E120);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::~__func()
{
}

void *std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::__clone()
{
  id result = operator new(0x10uLL);
  void *result = &unk_26FCAE310;
  return result;
}

void std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FCAE310;
}

uint64_t std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDT::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::target_type()
{
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1[2]();

  return v2;
}

void sub_248A3E5D8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      int v15 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
      a11 = v15;
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109634;
        DWORD1(buf) = v15;
        WORD4(buf) = 1040;
        *(_DWORD *)((char *)&buf + 10) = 4;
        HIWORD(buf) = 2080;
        a13 = &a11;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught CAException %d %4.4s", (uint8_t *)&buf, 0x18u);
      }
    }
    else if (a2 == 3)
    {
      uint64_t v17 = __cxa_begin_catch(a1);
      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v17 + 16))(v17);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int v19 = (int *)__cxa_begin_catch(a1);
      if (a2 == 2)
      {
        int v20 = *v19;
        a11 = *v19;
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 67109634;
          DWORD1(buf) = v20;
          WORD4(buf) = 1040;
          *(_DWORD *)((char *)&buf + 10) = 4;
          HIWORD(buf) = 2080;
          a13 = &a11;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
        }
      }
      else
      {
        uint64_t v16 = ASDTBaseLogType();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
    }

    __cxa_end_catch();
    std::function<unsigned int ()(void)>::operator()(v13);
    JUMPOUT(0x248A3E59CLL);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<unsigned int ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::~__func()
{
}

_DWORD *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_26FCAE3A0;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26FCAE3A0;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::operator()(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::target_type()
{
}

void *std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const char *a2)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const char *a2, NSObject *a3)
{
  *(void *)this = &unk_26FCAE4B0;
  *(_OWORD *)((char *)this + 8) = 0u;
  long long v6 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  dispatch_queue_t v7 = dispatch_queue_create(a2, a3);
  *long long v6 = v7;
  if (!v7)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v9) {
      CADeprecated::CADispatchQueue::CADispatchQueue(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 2003329396;
  }
  return this;
}

void sub_248A3EC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CADeprecated::CAMutex::~CAMutex(v12);
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  CADeprecated::CAMutex::~CAMutex(v11);
  a10 = v10 + 16;
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  _Unwind_Resume(a1);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, __CFString *a2)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, __CFString *a2, NSObject *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26FCAE4B0;
  *(_OWORD *)((char *)this + 8) = 0u;
  long long v6 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  int v19 = a2;
  char v20 = 0;
  *(_DWORD *)uint64_t v18 = 256;
  CACFString::GetCString((CACFString *)a2, label, v18, (unsigned int *)0x8000100);
  dispatch_queue_t v7 = dispatch_queue_create((const char *)label, a3);
  *long long v6 = v7;
  if (!v7)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v9) {
      CADeprecated::CADispatchQueue::CADispatchQueue(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 2003329396;
  }
  CACFString::~CACFString((CACFString *)&v19);
  return this;
}

void sub_248A3EDF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const __CFString *a2, const __CFString *a3)
{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, a3, 0);
}

{
  return CADeprecated::CADispatchQueue::CADispatchQueue(this, a2, a3, 0);
}

CADeprecated::CADispatchQueue *CADeprecated::CADispatchQueue::CADispatchQueue(CADeprecated::CADispatchQueue *this, const __CFString *a2, const __CFString *a3, NSObject *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  *(void *)this = &unk_26FCAE4B0;
  *(_OWORD *)((char *)this + 8) = 0u;
  long long v8 = (dispatch_queue_t *)((char *)this + 8);
  *(_OWORD *)((char *)this + 24) = 0u;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40), "CADispatchQueue::PortDeathListMutex");
  *((void *)this + 16) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  CADeprecated::CAMutex::CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152), "CADispatchQueue::PortReceiverListMutex");
  CFMutableDictionaryRef v21 = (CACFString *)CFStringCreateWithFormat(0, 0, a2, a3);
  char v22 = 1;
  *(_DWORD *)char v20 = 256;
  CACFString::GetCString(v21, label, v20, (unsigned int *)0x8000100);
  dispatch_queue_t v9 = dispatch_queue_create((const char *)label, a4);
  dispatch_queue_t *v8 = v9;
  if (!v9)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v11) {
      CADeprecated::CADispatchQueue::CADispatchQueue(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 2003329396;
  }
  CACFString::~CACFString((CACFString *)&v21);
  return this;
}

void sub_248A3F008(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
}

void CADeprecated::CADispatchQueue::~CADispatchQueue(CADeprecated::CADispatchQueue *this)
{
  *(void *)this = &unk_26FCAE4B0;
  uint64_t v2 = (void **)((char *)this + 16);
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100]((uint64_t *)this + 2);
  if (*((void *)this + 17) != *((void *)this + 16))
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v3) {
      CADeprecated::CADispatchQueue::~CADispatchQueue(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100]((uint64_t *)this + 16);
  dispatch_release(*((dispatch_object_t *)this + 1));
  CADeprecated::CAMutex::~CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 152));
  BOOL v11 = (void **)((char *)this + 128);
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100](&v11);
  CADeprecated::CAMutex::~CAMutex((CADeprecated::CADispatchQueue *)((char *)this + 40));
  BOOL v11 = v2;
  std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100](&v11);
}

{
  uint64_t vars8;

  CADeprecated::CADispatchQueue::~CADispatchQueue(this);
  JUMPOUT(0x24C588800);
}

void CADeprecated::CADispatchQueue::Dispatch(uint64_t a1, int a2, dispatch_block_t block)
{
  BOOL v3 = *(NSObject **)(a1 + 8);
  if (a2) {
    dispatch_sync(v3, block);
  }
  else {
    dispatch_async(v3, block);
  }
}

void CADeprecated::CADispatchQueue::DispatchBarrier(uint64_t a1, int a2, dispatch_block_t block)
{
  BOOL v3 = *(NSObject **)(a1 + 8);
  if (a2) {
    dispatch_barrier_sync(v3, block);
  }
  else {
    dispatch_barrier_async(v3, block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(uint64_t a1, uint64_t a2, dispatch_block_t block)
{
  if (a2)
  {
    int64_t v5 = __udivti3();
    dispatch_time_t v6 = dispatch_time(0, v5);
    uint64_t v7 = *(NSObject **)(a1 + 8);
    dispatch_after(v6, v7, block);
  }
  else
  {
    uint64_t v8 = *(NSObject **)(a1 + 8);
    dispatch_async(v8, block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(CADeprecated::CADispatchQueue *this, int a2, void *context, dispatch_function_t work)
{
  uint64_t v4 = *((void *)this + 1);
  if (a2) {
    dispatch_sync_f(v4, context, work);
  }
  else {
    dispatch_async_f(v4, context, work);
  }
}

void CADeprecated::CADispatchQueue::DispatchBarrier(CADeprecated::CADispatchQueue *this, int a2, void *context, dispatch_function_t work)
{
  uint64_t v4 = *((void *)this + 1);
  if (a2) {
    dispatch_barrier_sync_f(v4, context, work);
  }
  else {
    dispatch_barrier_async_f(v4, context, work);
  }
}

void CADeprecated::CADispatchQueue::Dispatch(CADeprecated::CADispatchQueue *this, uint64_t a2, void *context, dispatch_function_t work)
{
  if (a2)
  {
    int64_t v7 = __udivti3();
    dispatch_time_t v8 = dispatch_time(0, v7);
    uint64_t v9 = *((void *)this + 1);
    dispatch_after_f(v8, v9, context, work);
  }
  else
  {
    uint64_t v10 = *((void *)this + 1);
    dispatch_async_f(v10, context, work);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Global(intptr_t a1, int a2, void *a3)
{
  global_queue = dispatch_get_global_queue(a1, 0);
  if (a2)
  {
    dispatch_sync(global_queue, a3);
  }
  else
  {
    dispatch_async(global_queue, a3);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Global(intptr_t a1, uint64_t a2, void *a3)
{
  global_queue = dispatch_get_global_queue(a1, 0);
  dispatch_time_t v6 = global_queue;
  if (a2)
  {
    int64_t v7 = __udivti3();
    dispatch_time_t v8 = dispatch_time(0, v7);
    dispatch_after(v8, v6, a3);
  }
  else
  {
    dispatch_async(global_queue, a3);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Global(CADeprecated::CADispatchQueue *this, int a2, void *a3, void (__cdecl *a4)(void *), void (*a5)(void *))
{
  global_queue = dispatch_get_global_queue((intptr_t)this, 0);
  if (a2)
  {
    dispatch_sync_f(global_queue, a3, a4);
  }
  else
  {
    dispatch_async_f(global_queue, a3, a4);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Global(CADeprecated::CADispatchQueue *this, uint64_t a2, void *a3, void (__cdecl *a4)(void *), void (*a5)(void *))
{
  global_queue = dispatch_get_global_queue((intptr_t)this, 0);
  uint64_t v9 = global_queue;
  if (a2)
  {
    int64_t v10 = __udivti3();
    dispatch_time_t v11 = dispatch_time(0, v10);
    dispatch_after_f(v11, v9, a3, a4);
  }
  else
  {
    dispatch_async_f(global_queue, a3, a4);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Main(int a1, void *a2)
{
  if (a1) {
    dispatch_sync(MEMORY[0x263EF83A0], a2);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], a2);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Main(uint64_t a1, dispatch_block_t block)
{
  if (a1)
  {
    int64_t v3 = __udivti3();
    dispatch_time_t v4 = dispatch_time(0, v3);
    int64_t v5 = MEMORY[0x263EF83A0];
    dispatch_after(v4, v5, block);
  }
  else
  {
    dispatch_time_t v6 = MEMORY[0x263EF83A0];
    dispatch_async(v6, block);
  }
}

void CADeprecated::CADispatchQueue::Dispatch_Main(CADeprecated::CADispatchQueue *this, void *a2, void (__cdecl *a3)(void *), void (*a4)(void *))
{
  if (this) {
    dispatch_sync_f(MEMORY[0x263EF83A0], a2, a3);
  }
  else {
    dispatch_async_f(MEMORY[0x263EF83A0], a2, a3);
  }
}

void CADeprecated::CADispatchQueue::DispatchAfter_Main(CADeprecated::CADispatchQueue *this, void *context, dispatch_function_t work, void (*a4)(void *))
{
  if (this)
  {
    int64_t v6 = __udivti3();
    dispatch_time_t v7 = dispatch_time(0, v6);
    dispatch_time_t v8 = MEMORY[0x263EF83A0];
    dispatch_after_f(v7, v8, context, work);
  }
  else
  {
    uint64_t v9 = MEMORY[0x263EF83A0];
    dispatch_async_f(v9, context, work);
  }
}

void CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a2)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v22) {
      CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v40 = a1 + 40;
  char v41 = (*(uint64_t (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(a1 + 16);
  dispatch_time_t v8 = (void *)(a1 + 16);
  while (v7 != *(void *)(a1 + 24))
  {
    int v9 = *(_DWORD *)(v7 + 8);
    v7 += 16;
    if (v9 == a2) {
      goto LABEL_17;
    }
  }
  int64_t v10 = dispatch_source_create(MEMORY[0x263EF83D0], a2, 1uLL, *(dispatch_queue_t *)(a1 + 8));
  if (!v10)
  {
    BOOL v31 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v31) {
      CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    int v39 = __cxa_allocate_exception(0x10uLL);
    *(void *)int v39 = &unk_26FCADEB8;
    v39[2] = 2003329396;
  }
  dispatch_time_t v11 = v10;
  dispatch_source_set_event_handler(v10, a3);
  unint64_t v12 = *(void *)(a1 + 32);
  unint64_t v13 = *(void *)(a1 + 24);
  if (v13 >= v12)
  {
    uint64_t v15 = (uint64_t)(v13 - *v8) >> 4;
    if ((unint64_t)(v15 + 1) >> 60) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = v12 - *v8;
    uint64_t v17 = v16 >> 3;
    if (v16 >> 3 <= (unint64_t)(v15 + 1)) {
      uint64_t v17 = v15 + 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v17;
    }
    v42[4] = a1 + 32;
    int v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a1 + 32, v18);
    char v20 = &v19[16 * v15];
    v42[0] = v19;
    v42[1] = v20;
    v42[3] = &v19[16 * v21];
    *(void *)char v20 = v11;
    *((_DWORD *)v20 + 2) = a2;
    dispatch_retain(v11);
    v42[2] = v20 + 16;
    std::vector<CADeprecated::CADispatchQueue::EventSource>::__swap_out_circular_buffer((uint64_t *)(a1 + 16), v42);
    unint64_t v14 = *(void *)(a1 + 24);
    std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)v42);
  }
  else
  {
    *(void *)unint64_t v13 = v11;
    *(_DWORD *)(v13 + 8) = a2;
    dispatch_retain(v11);
    unint64_t v14 = v13 + 16;
  }
  *(void *)(a1 + 24) = v14;
  dispatch_release(v11);
  dispatch_resume(v11);
LABEL_17:
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v40);
}

void sub_248A3F8E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)va1);
  dispatch_release(v2);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)va);
  _Unwind_Resume(a1);
}

void CADeprecated::CADispatchQueue::RemoveMachPortDeathNotification(CADeprecated::CADispatchQueue *this, int a2)
{
  int64_t v5 = (char *)this + 40;
  uint64_t v4 = *((void *)this + 5);
  uint64_t v17 = (char *)this + 40;
  uint64_t v6 = 0;
  char v18 = (*(uint64_t (**)(char *))(v4 + 16))((char *)this + 40);
  uint64_t v8 = *((void *)v5 - 3);
  uint64_t v7 = *((void *)v5 - 2);
  while (v8 + v6 != v7)
  {
    int v9 = *(_DWORD *)(v8 + v6 + 8);
    v6 += 16;
    if (v9 == a2)
    {
      int64_t v10 = *(NSObject **)(v8 + v6 - 16);
      if (v10)
      {
        dispatch_source_cancel(v10);
        uint64_t v7 = *((void *)this + 3);
      }
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *>((uint64_t)&v19, v8 + 16 * (v9 != a2) + v6, v7, v8 + 16 * (v9 != a2) + v6 - 16);
      uint64_t v12 = v11;
      uint64_t v13 = *((void *)this + 3);
      if (v13 != v11)
      {
        uint64_t v14 = *((void *)this + 3);
        do
        {
          uint64_t v16 = *(NSObject **)(v14 - 16);
          v14 -= 16;
          uint64_t v15 = v16;
          if (v16)
          {
            dispatch_release(v15);
            *(void *)(v13 - 16) = 0;
          }
          uint64_t v13 = v14;
        }
        while (v14 != v12);
      }
      *((void *)this + 3) = v12;
      break;
    }
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v17);
}

void sub_248A3FA30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)va);
  _Unwind_Resume(a1);
}

void CADeprecated::CADispatchQueue::InstallMachPortReceiver(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a2)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v22) {
      CADeprecated::CADispatchQueue::InstallMachPortReceiver(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  uint64_t v6 = *(void *)(a1 + 152);
  uint64_t v40 = a1 + 152;
  char v41 = (*(uint64_t (**)(void))(v6 + 16))();
  uint64_t v7 = *(void *)(a1 + 128);
  uint64_t v8 = (void *)(a1 + 128);
  while (v7 != *(void *)(a1 + 136))
  {
    int v9 = *(_DWORD *)(v7 + 8);
    v7 += 16;
    if (v9 == a2) {
      goto LABEL_17;
    }
  }
  int64_t v10 = dispatch_source_create(MEMORY[0x263EF83C8], a2, 0, *(dispatch_queue_t *)(a1 + 8));
  if (!v10)
  {
    BOOL v31 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v31) {
      CADeprecated::CADispatchQueue::InstallMachPortReceiver(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    int v39 = __cxa_allocate_exception(0x10uLL);
    *(void *)int v39 = &unk_26FCADEB8;
    v39[2] = 2003329396;
  }
  uint64_t v11 = v10;
  dispatch_source_set_event_handler(v10, a3);
  unint64_t v12 = *(void *)(a1 + 144);
  unint64_t v13 = *(void *)(a1 + 136);
  if (v13 >= v12)
  {
    uint64_t v15 = (uint64_t)(v13 - *v8) >> 4;
    if ((unint64_t)(v15 + 1) >> 60) {
      std::vector<char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = v12 - *v8;
    uint64_t v17 = v16 >> 3;
    if (v16 >> 3 <= (unint64_t)(v15 + 1)) {
      uint64_t v17 = v15 + 1;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v17;
    }
    v42[4] = a1 + 144;
    char v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a1 + 144, v18);
    char v20 = &v19[16 * v15];
    v42[0] = v19;
    v42[1] = v20;
    v42[3] = &v19[16 * v21];
    *(void *)char v20 = v11;
    *((_DWORD *)v20 + 2) = a2;
    dispatch_retain(v11);
    v42[2] = v20 + 16;
    std::vector<CADeprecated::CADispatchQueue::EventSource>::__swap_out_circular_buffer((uint64_t *)(a1 + 128), v42);
    unint64_t v14 = *(void *)(a1 + 136);
    std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)v42);
  }
  else
  {
    *(void *)unint64_t v13 = v11;
    *(_DWORD *)(v13 + 8) = a2;
    dispatch_retain(v11);
    unint64_t v14 = v13 + 16;
  }
  *(void *)(a1 + 136) = v14;
  dispatch_release(v11);
  dispatch_resume(v11);
LABEL_17:
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v40);
}

void sub_248A3FCA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer((uint64_t)va1);
  dispatch_release(v2);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)va);
  _Unwind_Resume(a1);
}

void CADeprecated::CADispatchQueue::RemoveMachPortReceiver(uint64_t a1, int a2, void *a3)
{
  uint64_t v7 = a1 + 152;
  uint64_t v6 = *(void *)(a1 + 152);
  uint64_t v19 = a1 + 152;
  uint64_t v8 = 0;
  char v20 = (*(uint64_t (**)(uint64_t))(v6 + 16))(a1 + 152);
  uint64_t v10 = *(void *)(v7 - 24);
  uint64_t v9 = *(void *)(v7 - 16);
  while (v10 + v8 != v9)
  {
    int v11 = *(_DWORD *)(v10 + v8 + 8);
    v8 += 16;
    if (v11 == a2)
    {
      unint64_t v12 = *(NSObject **)(v10 + v8 - 16);
      if (v12)
      {
        if (a3)
        {
          dispatch_source_set_cancel_handler(v12, a3);
          unint64_t v12 = *(NSObject **)(v10 + v8 - 16);
        }
        dispatch_source_cancel(v12);
        uint64_t v9 = *(void *)(a1 + 136);
      }
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *>((uint64_t)&v21, v10 + 16 * (v11 != a2) + v8, v9, v10 + 16 * (v11 != a2) + v8 - 16);
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)(a1 + 136);
      if (v15 != v13)
      {
        uint64_t v16 = *(void *)(a1 + 136);
        do
        {
          unint64_t v18 = *(NSObject **)(v16 - 16);
          v16 -= 16;
          uint64_t v17 = v18;
          if (v18)
          {
            dispatch_release(v17);
            *(void *)(v15 - 16) = 0;
          }
          uint64_t v15 = v16;
        }
        while (v16 != v14);
      }
      *(void *)(a1 + 136) = v14;
      break;
    }
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v19);
}

void sub_248A3FE04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)va);
  _Unwind_Resume(a1);
}

void CADeprecated::CADispatchQueue::RemoveMachPortReceiver(CADeprecated::CADispatchQueue *this, int a2, char a3, char a4)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke;
  v4[3] = &__block_descriptor_tmp;
  char v6 = a3;
  int v5 = a2;
  char v7 = a4;
  CADeprecated::CADispatchQueue::RemoveMachPortReceiver((uint64_t)this, a2, v4);
}

void ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke(uint64_t a1)
{
  kern_return_t v3;
  int v4;
  kern_return_t v5;
  int v6;

  uint64_t v2 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (*(unsigned char *)(a1 + 36))
  {
    int64_t v3 = mach_port_deallocate(*MEMORY[0x263EF8960], *(_DWORD *)(a1 + 32));
    if (v3)
    {
      uint64_t v4 = v3;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_2(v4);
      }
    }
  }
  if (*(unsigned char *)(a1 + 37))
  {
    int v5 = mach_port_mod_refs(*v2, *(_DWORD *)(a1 + 32), 1u, -1);
    if (v5)
    {
      char v6 = v5;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_1(v6);
      }
    }
  }
}

uint64_t CADeprecated::CADispatchQueue::GetGlobalSerialQueue(CADeprecated::CADispatchQueue *this)
{
  if (CADeprecated::CADispatchQueue::sGlobalSerialQueueInitialized != -1) {
    dispatch_once_f(&CADeprecated::CADispatchQueue::sGlobalSerialQueueInitialized, 0, (dispatch_function_t)CADeprecated::CADispatchQueue::InitializeGlobalSerialQueue);
  }
  uint64_t result = CADeprecated::CADispatchQueue::sGlobalSerialQueue;
  if (!CADeprecated::CADispatchQueue::sGlobalSerialQueue)
  {
    BOOL v2 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v2) {
      CADeprecated::CADispatchQueue::GetGlobalSerialQueue(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  return result;
}

void CADeprecated::CADispatchQueue::InitializeGlobalSerialQueue(CADeprecated::CADispatchQueue *this, void *a2)
{
}

void sub_248A40044(void *a1)
{
  MEMORY[0x24C588800](v1, 0x10F1C40885B0CF0);
  __cxa_begin_catch(a1);
  CADeprecated::CADispatchQueue::sGlobalSerialQueue = 0;
  __cxa_end_catch();
}

void CADeprecated::CADispatchQueue::EventSource::Retain(NSObject **this)
{
  uint64_t v1 = *this;
  if (v1) {
    dispatch_retain(v1);
  }
}

void CADeprecated::CADispatchQueue::EventSource::Release(NSObject **this)
{
  BOOL v2 = *this;
  if (v2)
  {
    dispatch_release(v2);
    *this = 0;
  }
}

void CACFString::~CACFString(CACFString *this)
{
  if (*((unsigned char *)this + 8))
  {
    BOOL v2 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v2);
    }
  }
}

void CADeprecated::CAMutex::Locker::~Locker(CADeprecated::CAMutex::Locker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 24))();
  }
}

void std::vector<CADeprecated::CADispatchQueue::EventSource>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  BOOL v2 = *a1;
  if (*v2)
  {
    std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<CADeprecated::CADispatchQueue::EventSource>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (v3 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(NSObject **)(v4 - 16);
      v4 -= 16;
      uint64_t v5 = v6;
      if (v6)
      {
        dispatch_release(v5);
        *(void *)(v3 - 16) = 0;
      }
      uint64_t v3 = v4;
    }
    while (v4 != v2);
  }
  a1[1] = v2;
}

uint64_t std::vector<CADeprecated::CADispatchQueue::EventSource>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v17 = a6;
  *((void *)&v17 + 1) = a7;
  long long v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  if (a3 == a5)
  {
    uint64_t v12 = a6;
  }
  else
  {
    uint64_t v9 = a3;
    do
    {
      int v11 = *(NSObject **)(v9 - 16);
      v9 -= 16;
      uint64_t v10 = v11;
      *(void *)(v7 - 16) = v11;
      *(_DWORD *)(v7 - 8) = *(_DWORD *)(v9 + 8);
      if (v11)
      {
        dispatch_retain(v10);
        uint64_t v7 = *((void *)&v17 + 1);
      }
      v7 -= 16;
      *((void *)&v17 + 1) = v7;
    }
    while (v9 != a5);
    uint64_t v12 = v17;
  }
  char v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<CADeprecated::CADispatchQueue::EventSource>,std::reverse_iterator<CADeprecated::CADispatchQueue::EventSource*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(dispatch_object_t **)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(dispatch_object_t **)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*v1)
    {
      dispatch_release(*v1);
      dispatch_object_t *v1 = 0;
    }
    v1 += 2;
  }
}

uint64_t std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<CADeprecated::CADispatchQueue::EventSource>::__destruct_at_end[abi:ne180100](uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v6 = *(v2 - 2);
    v2 -= 2;
    uint64_t v5 = v6;
    *(void *)(a1 + 16) = v2;
    if (v6)
    {
      dispatch_release(v5);
      void *v2 = 0;
      uint64_t v2 = *(void **)(a1 + 16);
    }
  }
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *,CADeprecated::CADispatchQueue::EventSource *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(void *)a4)
      {
        dispatch_release(*(dispatch_object_t *)a4);
        *(void *)a4 = 0;
      }
      uint64_t v7 = *(NSObject **)v5;
      *(void *)a4 = *(void *)v5;
      *(_DWORD *)(a4 + 8) = *(_DWORD *)(v5 + 8);
      if (v7) {
        dispatch_retain(v7);
      }
      a4 += 16;
      v5 += 16;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_248A40728(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_248A40A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);

  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

void sub_248A40B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A40C8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A40F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A410C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_248A41204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A41354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A413C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A41434(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A4167C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A418E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A41A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A41AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2SelectorControl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_248A41C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A42384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, std::recursive_mutex *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, void *a19)
{
  std::recursive_mutex::unlock(a12);
  _Unwind_Resume(a1);
}

void sub_248A42944(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A42E70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_248A43004(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A43190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_248A433C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A434C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A435A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A43728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A43E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  _Unwind_Resume(a1);
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<char>::__vallocate[abi:ne180100](this, __n);
    std::vector<char>::pointer end = this->__end_;
    uint64_t v5 = &end[__n];
    bzero(end, __n);
    this->__end_ = v5;
  }
  return this;
}

void sub_248A440E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A443BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A44514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A44668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::recursive_mutex *a11, char a12)
{
  if (a12) {
    std::recursive_mutex::unlock(a11);
  }
  _Unwind_Resume(a1);
}

void sub_248A44954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A44A3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::recursive_mutex *a10, char a11)
{
  if (a11) {
    std::recursive_mutex::unlock(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A44DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CACFDictionary a13, char a14, uint64_t a15, CACFDictionary a16)
{
  CACFArray::~CACFArray((CACFArray *)&a14);
  CACFDictionary::~CACFDictionary(&a16);
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(v17 + 8, *(void **)(v17 + 16));

  _Unwind_Resume(a1);
}

void sub_248A44FEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A451E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::recursive_mutex *a15, char a16)
{
  if (a16) {
    std::recursive_mutex::unlock(a15);
  }
  _Unwind_Resume(a1);
}

void sub_248A454F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A455FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::recursive_mutex *a10, char a11)
{
  if (a11) {
    std::recursive_mutex::unlock(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A457F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A45EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a69) {
    std::recursive_mutex::unlock(a68);
  }
  _Unwind_Resume(a1);
}

void sub_248A46450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A46598(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, std::recursive_mutex *a13, char a14)
{
  if (a14) {
    std::recursive_mutex::unlock(a13);
  }
  _Unwind_Resume(exception_object);
}

void sub_248A466D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A46858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_248A469E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A46A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A46B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::recursive_mutex *a9, char a10)
{
  _Unwind_Resume(a1);
}

uint64_t ASDTIOA2LogType()
{
  if (ASDTIOA2LogType_onceToken != -1) {
    dispatch_once(&ASDTIOA2LogType_onceToken, &__block_literal_global_0);
  }
  return gASDTIOA2LogType;
}

os_log_t __ASDTIOA2LogType_block_invoke()
{
  os_log_t result = os_log_create("com.apple.audio.ASDT", "IOA2");
  if (result) {
    gASDTIOA2LogType = (uint64_t)result;
  }
  return result;
}

void sub_248A46D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getValueAndRangeFromControlDict(NSDictionary *a1, const applesauce::CF::DictionaryRef *a2, _ASDSliderRange *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = v5;
  if (v5) {
    CFRetain(v5);
  }
  applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v6);

  uint64_t ControlInfo_Value = ASDT::IOA2UserClient::GetControlInfo_Value((ASDT::IOA2UserClient *)&cf, a2, v7);
  if ((ControlInfo_Value & 1) == 0)
  {
    uint64_t v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      getValueAndRangeFromControlDict();
    }
  }
  if (!ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)&a3->mMaximum, v8))
  {
    uint64_t v12 = ASDTIOA2LogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      getValueAndRangeFromControlDict();
    }

    uint64_t ControlInfo_Value = 0;
  }
  if (!ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue((const __CFDictionary **)&cf, (const applesauce::CF::DictionaryRef *)a3, v11))
  {
    uint64_t v13 = ASDTIOA2LogType();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      getValueAndRangeFromControlDict();
    }

    uint64_t ControlInfo_Value = 0;
  }
  if (cf) {
    CFRelease(cf);
  }

  return ControlInfo_Value;
}

void sub_248A46E70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void sub_248A46EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2SliderControl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_248A47034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A4717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A4748C(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A4755C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_248A4784C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A479A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy(v3 + 8, *(void **)(v3 + 16));

  _Unwind_Resume(a1);
}

void sub_248A47BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A47C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ASDTIOA2LevelControl;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_248A47E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48040(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v2);

  _Unwind_Resume(a1);
}

void sub_248A483B0(_Unwind_Exception *a1)
{
  std::recursive_mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A484B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A489FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A48AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48BC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48C74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A48FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A490E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v17 - 40));

  _Unwind_Resume(a1);
}

void sub_248A49228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_248A49310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CADeprecated::CAMutex *CADeprecated::CAMutex::CAMutex(CADeprecated::CAMutex *this, const char *a2)
{
  *(void *)this = &unk_26FCAE500;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = 0;
  int v3 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 24), 0);
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v6) {
      CADeprecated::CAMutex::CAMutex(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = v5;
  }
  return this;
}

void CADeprecated::CAMutex::~CAMutex(CADeprecated::CAMutex *this)
{
  *(void *)this = &unk_26FCAE500;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 24));
}

{
  uint64_t vars8;

  CADeprecated::CAMutex::~CAMutex(this);
  JUMPOUT(0x24C588800);
}

BOOL CADeprecated::CAMutex::Lock(CADeprecated::CAMutex *this)
{
  uint64_t v2 = pthread_self();
  int v3 = pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire));
  if (!v3)
  {
    int v4 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 24));
    if (v4)
    {
      int v6 = v4;
      BOOL v7 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v7) {
        CADeprecated::CAMutex::Lock(v7, v8, v9, v10, v11, v12, v13, v14);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = v6;
    }
    atomic_store((unint64_t)v2, (unint64_t *)this + 2);
  }
  return v3 == 0;
}

void CADeprecated::CAMutex::Unlock(CADeprecated::CAMutex *this)
{
  uint64_t v2 = pthread_self();
  if (pthread_equal(v2, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire)))
  {
    atomic_store(0, (unint64_t *)this + 2);
    int v3 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 24));
    if (v3)
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v5) {
        CADeprecated::CAMutex::Unlock(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = v4;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, " CAMutex::Unlock: A thread is attempting to unlock a Mutex it doesn't own", v14, 2u);
  }
}

uint64_t CADeprecated::CAMutex::Try(CADeprecated::CAMutex *this, BOOL *a2)
{
  *a2 = 0;
  int v4 = pthread_self();
  if (pthread_equal(v4, (pthread_t)atomic_load_explicit((atomic_ullong *volatile)this + 2, memory_order_acquire)))
  {
    BOOL v5 = 0;
  }
  else
  {
    int v6 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 24));
    if (v6 == 16)
    {
      BOOL v5 = 0;
      uint64_t result = 0;
      goto LABEL_7;
    }
    if (v6)
    {
      v10[0] = HIBYTE(v6);
      v10[1] = BYTE2(v6);
      v10[2] = BYTE1(v6);
      int v8 = v6;
      v10[3] = v6;
      v10[4] = 0;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        CADeprecated::CAMutex::Try((uint64_t)v10, v8);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = v8;
    }
    atomic_store((unint64_t)v4, (unint64_t *)this + 2);
    BOOL v5 = 1;
  }
  uint64_t result = 1;
LABEL_7:
  *a2 = v5;
  return result;
}

BOOL CADeprecated::CAMutex::IsFree(atomic_ullong *this)
{
  return atomic_load_explicit(this + 2, memory_order_acquire) == 0;
}

BOOL CADeprecated::CAMutex::IsOwnedByCurrentThread(atomic_ullong *this)
{
  uint64_t v2 = pthread_self();
  return pthread_equal(v2, (pthread_t)atomic_load_explicit(this + 2, memory_order_acquire)) != 0;
}

CADeprecated::CAMutex::Unlocker *CADeprecated::CAMutex::Unlocker::Unlocker(CADeprecated::CAMutex::Unlocker *this, CADeprecated::CAMutex *a2)
{
  *(void *)this = a2;
  *((unsigned char *)this + 8) = 0;
  if (((*(uint64_t (**)(CADeprecated::CAMutex *))(*(void *)a2 + 48))(a2) & 1) == 0)
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v3) {
      CADeprecated::CAMutex::Unlocker::Unlocker(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  (*(void (**)(void))(**(void **)this + 24))();
  *((unsigned char *)this + 8) = 1;
  return this;
}

void CADeprecated::CAMutex::Unlocker::~Unlocker(CADeprecated::CAMutex::Unlocker *this)
{
  if (*((unsigned char *)this + 8)) {
    (*(void (**)(void))(**(void **)this + 16))();
  }
}

ASDT::UCObject *ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this)
{
  uint64_t result = ASDT::UCObject::UCObject(this);
  *(void *)uint64_t result = &unk_26FCAE558;
  return result;
}

{
  ASDT::UCObject *result;

  uint64_t result = ASDT::UCObject::UCObject(this);
  *(void *)uint64_t result = &unk_26FCAE558;
  return result;
}

ASDT::IOA2UCDevice *ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this, ASDT::UCObject *a2)
{
  *(void *)ASDT::UCObject::UCObject(this, (int)a2) = &unk_26FCAE558;
  var11[0] = 0;
  ASDT::UCObject::CopyProperty_BOOL(a2, @"supports prewarming", (const __CFString *)var11, v4);
  *((unsigned char *)this + 35) = var11[0];
  if (ASDT::UCObject::IsValid(this) && !ASDT::UCObject::ConformsTo(this, "IOAudio2Device"))
  {
    BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v6) {
      ASDT::IOA2UCDevice::IOA2UCDevice(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  return this;
}

void sub_248A49A00(_Unwind_Exception *a1)
{
  ASDT::UCObject::~UCObject(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOA2UCDevice::SupportsPreWarming(ASDT::IOA2UCDevice *this, unsigned int a2, uint64_t a3, BOOL *a4)
{
  unsigned __int8 v5 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, @"supports prewarming", (const __CFString *)&v5, a4);
  return v5;
}

uint64_t ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  uint64_t result = ASDT::UCObject::UCObject((uint64_t)this, a2);
  *(void *)uint64_t result = &unk_26FCAE558;
  *(unsigned char *)(result + 35) = 0;
  return result;
}

{
  uint64_t result;

  uint64_t result = ASDT::UCObject::UCObject((uint64_t)this, a2);
  *(void *)uint64_t result = &unk_26FCAE558;
  *(unsigned char *)(result + 35) = 0;
  return result;
}

ASDT::UCObject *ASDT::IOA2UCDevice::IOA2UCDevice(ASDT::IOA2UCDevice *this, const ASDT::IOA2UCDevice *a2)
{
  uint64_t result = ASDT::UCObject::UCObject(this, a2);
  *(void *)uint64_t result = &unk_26FCAE558;
  *((unsigned char *)result + 35) = 0;
  return result;
}

{
  ASDT::UCObject *result;

  uint64_t result = ASDT::UCObject::UCObject(this, a2);
  *(void *)uint64_t result = &unk_26FCAE558;
  *((unsigned char *)result + 35) = 0;
  return result;
}

uint64_t ASDT::IOA2UCDevice::operator=(uint64_t a1, io_object_t object)
{
  if (!IOObjectConformsTo(object, "IOAudio2Device"))
  {
    BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v5) {
      ASDT::IOA2UCDevice::operator=(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  ASDT::UCObject::operator=(a1, object);
  return a1;
}

uint64_t ASDT::IOA2UCDevice::operator=(uint64_t a1, uint64_t a2)
{
  ASDT::UCObject::operator=(a1, a2);
  return a1;
}

void ASDT::IOA2UCDevice::~IOA2UCDevice(ASDT::IOA2UCDevice *this)
{
  ASDT::UCObject::~UCObject(this);
  JUMPOUT(0x24C588800);
}

__CFString *ASDT::IOA2UCDevice::CopyDeviceUID(ASDT::IOA2UCDevice *this)
{
  uint64_t v2 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, @"device UID", (CFTypeRef *)&v2);
  return v2;
}

__CFString *ASDT::IOA2UCDevice::CopyDeviceName(ASDT::IOA2UCDevice *this)
{
  uint64_t v2 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, @"device name", (CFTypeRef *)&v2);
  return v2;
}

__CFString *ASDT::IOA2UCDevice::CopyDeviceManufacturer(ASDT::IOA2UCDevice *this)
{
  uint64_t v2 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, @"device manufacturer", (CFTypeRef *)&v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::CopyChannelName(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyChannelCategoryName(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyChannelNumberName(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyResourceBundlePath(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::CopyConfigurationApplicationBundleID(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetTransportType(ASDT::IOA2UCDevice *this)
{
  unsigned int v2 = 0;
  ASDT::UCObject::CopyProperty_UInt32(this, @"transport type", &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::CopyModelUID(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetClockDomain(ASDT::IOA2UCDevice *this)
{
  unsigned int v2 = 0;
  ASDT::UCObject::CopyProperty_UInt32(this, @"clock domain", &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::CanBeDefaultDevice(ASDT::IOA2UCDevice *this)
{
  return 1;
}

uint64_t ASDT::IOA2UCDevice::GetLatency(ASDT::IOA2UCDevice *this, int a2)
{
  unsigned int v4 = 0;
  if (a2) {
    CFStringRef v2 = @"input latency";
  }
  else {
    CFStringRef v2 = @"output latency";
  }
  ASDT::UCObject::CopyProperty_UInt32(this, v2, &v4);
  return v4;
}

uint64_t ASDT::IOA2UCDevice::GetRingBufferSize(ASDT::IOA2UCDevice *this)
{
  unsigned int v2 = 0;
  ASDT::UCObject::CopyProperty_UInt32(this, @"io buffer frame size", &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::GetSafetyOffset(ASDT::IOA2UCDevice *this, int a2)
{
  unsigned int v4 = 0;
  if (a2) {
    CFStringRef v2 = @"input safety offset";
  }
  else {
    CFStringRef v2 = @"output safety offset";
  }
  ASDT::UCObject::CopyProperty_UInt32(this, v2, &v4);
  return v4;
}

double ASDT::IOA2UCDevice::GetNominalSampleRate(ASDT::IOA2UCDevice *this)
{
  double v2 = 0.0;
  ASDT::UCObject::CopyProperty_Fixed64(this, @"sample rate", &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::SetNominalSampleRate(ASDT::IOA2UCDevice *this, double a2)
{
  unint64_t v5 = vcvtd_n_s64_f64(a2 - (double)(uint64_t)floor(a2), 0x20uLL) + (vcvtmd_s64_f64(a2) << 32);
  uint64_t result = ASDT::UCObject::CallMethod(this, 4u, 0, 0, &v5, 8uLL, 0, 0, 0, 0);
  if (result)
  {
    int v4 = result;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::SetNominalSampleRate();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = v4;
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::IsHidden(ASDT::IOA2UCDevice *this)
{
  return 0;
}

BOOL ASDT::IOA2UCDevice::IsRunning(ASDT::IOA2UCDevice *this)
{
  BOOL v2 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, @"is running", &v2);
  return v2;
}

__CFArray *ASDT::IOA2UCDevice::CopyDefaultChannelLayout(ASDT::IOA2UCDevice *this, int a2)
{
  if (a2) {
    CFStringRef v2 = @"input channel layout";
  }
  else {
    CFStringRef v2 = @"output channel layout";
  }
  int v4 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, v2, (CFTypeRef *)&v4);
  return v4;
}

BOOL ASDT::IOA2UCDevice::WantsDoIOTrapCall(ASDT::IOA2UCDevice *this, int a2)
{
  if (a2) {
    CFStringRef v2 = @"wants input trap";
  }
  else {
    CFStringRef v2 = @"wants output trap";
  }
  BOOL v4 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, v2, &v4);
  return v4;
}

uint64_t ASDT::IOA2UCDevice::GetHogModeOwner(ASDT::IOA2UCDevice *this)
{
  LODWORD(v5) = -1;
  BOOL v2 = ASDT::UCObject::CopyProperty_SInt32(this, @"exclusive access owner", (int *)&v5);
  int v3 = (int)v5;
  if (v5 != -1
    && v3 != CAProcess::GetPID((CAProcess *)v2)
    && (CAProcess::ProcessExists((CAProcess *)v5) & 1) == 0)
  {
    LODWORD(v5) = -1;
    ASDT::UCObject::SetProperty_SInt32(this, @"exclusive access owner", -1);
  }
  return v5;
}

void ASDT::IOA2UCDevice::SetHogModeOwner(ASDT::IOA2UCDevice *this, int a2)
{
}

const __CFAllocator *ASDT::IOA2UCDevice::CopyHeadsetInfo(ASDT::IOA2UCDevice *this)
{
  CFAllocatorRef allocator = 0;
  ASDT::UCObject::CopyProperty_CFDictionary(this, @"headset info", (CFTypeRef *)&allocator);
  CFAllocatorRef result = allocator;
  if (!allocator)
  {
    CFAllocatorRef result = CFDictionaryCreate(0, 0, 0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFAllocatorRef allocator = result;
    if (!result)
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v2) {
        ASDT::IOA2UCDevice::CopyHeadsetInfo(v2, v3, v4, v5, v6, v7, v8, v9);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 2003329396;
    }
  }
  return result;
}

__CFArray *ASDT::IOA2UCDevice::CopyCustomPropertyInfo(ASDT::IOA2UCDevice *this)
{
  BOOL v2 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"custom property info", (CFTypeRef *)&v2);
  return v2;
}

BOOL ASDT::IOA2UCDevice::SupportsClientDescription(ASDT::IOA2UCDevice *this)
{
  BOOL v2 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, @"supports client description", &v2);
  return v2;
}

uint64_t ASDT::IOA2UCDevice::SetClientDescription(ASDT::IOA2UCDevice *this, unint64_t a2, double a3)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = a2;
  v6[1] = vcvtd_n_u64_f64(a3 - (double)(unint64_t)floor(a3), 0x20uLL) + (vcvtmd_u64_f64(a3) << 32);
  uint64_t result = ASDT::UCObject::CallMethod(this, 0xCu, v6, 2u, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    int v5 = result;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::SetClientDescription();
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = v5;
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::CopyDeviceUID(ASDT::IOA2UCDevice *this, unsigned int a2, uint64_t a3, const __CFString **a4)
{
  uint64_t v5 = 0;
  ASDT::UCObject::CopyProperty_CFString(this, @"device UID", (const __CFString *)&v5, a4);
  return v5;
}

uint64_t ASDT::IOA2UCDevice::IsPrivate(ASDT::IOA2UCDevice *this, unsigned int a2, uint64_t a3, BOOL *a4)
{
  unsigned __int8 v5 = 0;
  ASDT::UCObject::CopyProperty_BOOL(this, @"is private", (const __CFString *)&v5, a4);
  return v5;
}

__CFArray *ASDT::IOA2UCDevice::CopyStreamList(ASDT::IOA2UCDevice *this, int a2)
{
  uint64_t v4 = 0;
  if (a2) {
    CFStringRef v2 = @"input streams";
  }
  else {
    CFStringRef v2 = @"output streams";
  }
  ASDT::UCObject::CopyProperty_CFArray(this, v2, (CFTypeRef *)&v4);
  return v4;
}

CFIndex ASDT::IOA2UCDevice::GetNumberStreams(ASDT::IOA2UCDevice *this, int a2)
{
  CFArrayRef theArray = 0;
  if (a2) {
    CFStringRef v2 = @"input streams";
  }
  else {
    CFStringRef v2 = @"output streams";
  }
  ASDT::UCObject::CopyProperty_CFArray(this, v2, (CFTypeRef *)&theArray);
  CFArrayRef v5 = theArray;
  __int16 v6 = 1;
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v5);
  return Count;
}

void sub_248A4A3D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (a2) {
    CFStringRef v4 = @"input streams";
  }
  else {
    CFStringRef v4 = @"output streams";
  }
  ASDT::UCObject::CopyProperty_CFArray(this, v4, (CFTypeRef *)&theArray);
  CFArrayRef v7 = theArray;
  __int16 v8 = 1;
  if (theArray
    && CFArrayGetCount(theArray) > a3
    && (CACFArray::GetDictionary((CACFArray *)&v7, a3, (const __CFDictionary **)&cf), cf))
  {
    CFRetain(cf);
    CFTypeRef v5 = cf;
  }
  else
  {
    CFTypeRef v5 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v7);
  return v5;
}

void sub_248A4A48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

__CFDictionary *ASDT::IOA2UCDevice::CopyStreamDictionaryByID(ASDT::IOA2UCDevice *this, int a2)
{
  char v4 = 1;
  do
  {
    theArray.var0 = 0;
    if (v4) {
      CFStringRef v5 = @"output streams";
    }
    else {
      CFStringRef v5 = @"input streams";
    }
    ASDT::UCObject::CopyProperty_CFArray(this, v5, (CFTypeRef *)&theArray.var0);
    var0 = theArray.var0;
    __int16 v17 = 1;
    if (theArray.var0 && (unsigned int Count = CFArrayGetCount(theArray.var0)) != 0)
    {
      unsigned int v7 = 1;
      do
      {
        theArray.var0 = 0;
        *(_WORD *)&theArray.var1 = 0;
        CACFArray::GetCACFDictionary((CACFArray *)&var0, v7 - 1, &theArray);
        if (theArray.var0
          && ((unsigned int v14 = 0, UInt32 = CACFDictionary::GetUInt32(&theArray, @"stream ID", &v14), v14 == a2)
            ? (int v9 = UInt32)
            : (int v9 = 0),
              v9 == 1 && theArray.var0))
        {
          CFRetain(theArray.var0);
          uint64_t v10 = theArray.var0;
        }
        else
        {
          uint64_t v10 = 0;
        }
        CACFDictionary::~CACFDictionary(&theArray);
        if (v10) {
          break;
        }
      }
      while (v7++ < Count);
    }
    else
    {
      uint64_t v10 = 0;
    }
    CACFArray::~CACFArray((CACFArray *)&var0);
    char v12 = (v10 == 0) & v4;
    char v4 = 0;
  }
  while ((v12 & 1) != 0);
  return v10;
}

void sub_248A4A5E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_ID(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  unsigned int v15 = 0;
  v14.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v14.var1 = 1;
  if (v14.var0)
  {
    if (!CACFDictionary::GetUInt32(&v14, @"stream ID", &v15))
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v5) {
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_ID(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v3 = v15;
  }
  else
  {
    uint64_t v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v14);
  return v3;
}

void sub_248A4A6E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

__CFDictionary *ASDT::IOA2UCDevice::ConstructDictionaryFromASBD(ASDT::IOA2UCDevice *this, const AudioStreamBasicDescription *a2)
{
  v4.var0 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(_WORD *)&v4.var1 = 256;
  CACFDictionary::AddUInt64(&v4, @"sample rate");
  CACFDictionary::AddUInt32(&v4, @"format ID");
  CACFDictionary::AddUInt32(&v4, @"format flags");
  CACFDictionary::AddUInt32(&v4, @"bytes per packet");
  CACFDictionary::AddUInt32(&v4, @"frames per packet");
  CACFDictionary::AddUInt32(&v4, @"bytes per frame");
  CACFDictionary::AddUInt32(&v4, @"channels per frame");
  CACFDictionary::AddUInt32(&v4, @"bits per channel");
  var0 = v4.var0;
  CACFDictionary::~CACFDictionary(&v4);
  return var0;
}

void sub_248A4A828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, CACFDictionary a9)
{
}

uint64_t ASDT::IOA2UCDevice::ConstructASBDFromDictionary(ASDT::IOA2UCDevice *this, const __CFDictionary *a2, AudioStreamBasicDescription *a3)
{
  unint64_t v6 = 0;
  v7.var0 = this;
  *(_WORD *)&v7.var1 = 0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((void *)a2 + 4) = 0;
  if (CACFDictionary::GetUInt64(&v7, @"sample rate", &v6)
    && (*(double *)a2 = (double)v6 * 2.32830644e-10 + (double)HIDWORD(v6),
        CACFDictionary::GetUInt32(&v7, @"format ID", (unsigned int *)a2 + 2))
    && CACFDictionary::GetUInt32(&v7, @"format flags", (unsigned int *)a2 + 3)
    && CACFDictionary::GetUInt32(&v7, @"bytes per packet", (unsigned int *)a2 + 4)
    && CACFDictionary::GetUInt32(&v7, @"frames per packet", (unsigned int *)a2 + 5)
    && CACFDictionary::GetUInt32(&v7, @"bytes per frame", (unsigned int *)a2 + 6)
    && CACFDictionary::GetUInt32(&v7, @"channels per frame", (unsigned int *)a2 + 7))
  {
    uint64_t UInt32 = CACFDictionary::GetUInt32(&v7, @"bits per channel", (unsigned int *)a2 + 8);
  }
  else
  {
    uint64_t UInt32 = 0;
  }
  if (*((_DWORD *)a2 + 2) == 1819304813) {
    *((_DWORD *)a2 + 3) &= ~0x40u;
  }
  CACFDictionary::~CACFDictionary(&v7);
  return UInt32;
}

void sub_248A4A994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

uint64_t ASDT::IOA2UCDevice::ConstructASRDFromDictionary(ASDT::IOA2UCDevice *this, const __CFDictionary *a2, AudioStreamRangedDescription *a3)
{
  unint64_t v10 = 0;
  v11.var0 = this;
  *(_WORD *)&v11.var1 = 0;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  *((_OWORD *)a2 + 2) = 0u;
  *((void *)a2 + 6) = 0;
  if (CACFDictionary::GetUInt64(&v11, @"min sample rate", &v10)
    && (*((double *)a2 + 5) = (double)v10 * 2.32830644e-10 + (double)HIDWORD(v10),
        CACFDictionary::GetUInt64(&v11, @"max sample rate", &v10)))
  {
    double v4 = (double)v10 * 2.32830644e-10 + (double)HIDWORD(v10);
    *((double *)a2 + 6) = v4;
    BOOL v5 = *((double *)a2 + 5) == v4;
    uint64_t v6 = 0;
    if (v5) {
      uint64_t v6 = *((void *)a2 + 5);
    }
    *(void *)a2 = v6;
    if (CACFDictionary::GetUInt32(&v11, @"format ID", (unsigned int *)a2 + 2)
      && CACFDictionary::GetUInt32(&v11, @"format flags", (unsigned int *)a2 + 3)
      && CACFDictionary::GetUInt32(&v11, @"bytes per packet", (unsigned int *)a2 + 4)
      && CACFDictionary::GetUInt32(&v11, @"frames per packet", (unsigned int *)a2 + 5)
      && CACFDictionary::GetUInt32(&v11, @"bytes per frame", (unsigned int *)a2 + 6)
      && CACFDictionary::GetUInt32(&v11, @"channels per frame", (unsigned int *)a2 + 7))
    {
      uint64_t UInt32 = CACFDictionary::GetUInt32(&v11, @"bits per channel", (unsigned int *)a2 + 8);
    }
    else
    {
      uint64_t UInt32 = 0;
    }
  }
  else
  {
    uint64_t UInt32 = 0;
    double v8 = *((double *)a2 + 5);
    if (v8 != *((double *)a2 + 6)) {
      double v8 = 0.0;
    }
    *(double *)a2 = v8;
  }
  if (*((_DWORD *)a2 + 2) == 1819304813) {
    *((_DWORD *)a2 + 3) &= ~0x40u;
  }
  CACFDictionary::~CACFDictionary(&v11);
  return UInt32;
}

void sub_248A4AB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

void ASDT::IOA2UCDevice::BestMatchForFormat(ASDT::IOA2UCDevice *this, const __CFArray *a2, const AudioStreamBasicDescription *a3, AudioStreamBasicDescription *a4)
{
  uint64_t v5 = 0;
  long long v6 = *(_OWORD *)&a3->mBytesPerPacket;
  v21[0] = *(_OWORD *)&a3->mSampleRate;
  v21[1] = v6;
  uint64_t v22 = *(void *)&a3->mBitsPerChannel;
  *(void *)&v21[0] = 0;
  if (a3->mSampleRate == 0.0) {
    double mSampleRate = *(double *)a2;
  }
  else {
    double mSampleRate = a3->mSampleRate;
  }
  CFArrayRef theArray = this;
  __int16 v20 = 0;
  while (1)
  {
    unsigned int Count = theArray;
    if (theArray) {
      unsigned int Count = CFArrayGetCount(theArray);
    }
    if (v5 >= Count) {
      break;
    }
    unint64_t v18 = 0;
    CACFArray::GetDictionary((CACFArray *)&theArray, v5, &v18);
    ASDT::IOA2UCDevice::ConstructASRDFromDictionary(v18, (const __CFDictionary *)&v16, v9);
    if (CAStreamBasicDescription::IsEquivalent((CAStreamBasicDescription *)v21, &v16, (const AudioStreamBasicDescription *)3))
    {
      if (v17[0] <= mSampleRate && v17[1] >= mSampleRate)
      {
        long long v15 = *(_OWORD *)&v16.mBytesPerPacket;
        *(_OWORD *)&a3->double mSampleRate = *(_OWORD *)&v16.mSampleRate;
        *(_OWORD *)&a3->mBytesPerPacket = v15;
        *(void *)&a3->UInt32 mBitsPerChannel = *(void *)&v16.mBitsPerChannel;
        a3->double mSampleRate = mSampleRate;
        goto LABEL_16;
      }
    }
    uint64_t v5 = (v5 + 1);
  }
  unint64_t v18 = 0;
  CACFArray::GetDictionary((CACFArray *)&theArray, 1, &v18);
  ASDT::IOA2UCDevice::ConstructASRDFromDictionary(v18, (const __CFDictionary *)&v16, v11);
  long long v12 = *(_OWORD *)&v16.mBytesPerPacket;
  *(_OWORD *)&a3->double mSampleRate = *(_OWORD *)&v16.mSampleRate;
  *(_OWORD *)&a3->mBytesPerPacket = v12;
  *(void *)&a3->UInt32 mBitsPerChannel = *(void *)&v16.mBitsPerChannel;
  CAAudioValueRange::PickCommonSampleRate((CAAudioValueRange *)v17, v13);
  a3->double mSampleRate = v14;
LABEL_16:
  CACFArray::~CACFArray((CACFArray *)&theArray);
}

void sub_248A4ACA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(ASDT::IOA2UCDevice *this, int a2, uint64_t a3, AudioStreamBasicDescription *a4)
{
  v24.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v24.var1 = 1;
  if (v24.var0)
  {
    uint64_t v23 = 0;
    if (CACFDictionary::GetDictionary(&v24, @"current format", &v23))
    {
      if (ASDT::IOA2UCDevice::ConstructASBDFromDictionary(v23, (const __CFDictionary *)a4, v5)) {
        goto LABEL_4;
      }
      BOOL v14 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v14) {
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    else
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v6) {
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
LABEL_4:
  CACFDictionary::~CACFDictionary(&v24);
}

void sub_248A4ADC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

__CFArray *ASDT::IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  uint64_t v15 = 0;
  v14.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v14.var1 = 1;
  if (v14.var0)
  {
    if (!CACFDictionary::GetArray(&v14, @"available formats", &v15))
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v5) {
        ASDT::IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v3 = v15;
  }
  else
  {
    uint64_t v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v14);
  return v3;
}

void sub_248A4AEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_StartingChannel(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  unsigned int v15 = 0;
  v14.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v14.var1 = 1;
  if (v14.var0)
  {
    if (!CACFDictionary::GetUInt32(&v14, @"starting channel", &v15))
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v5) {
        ASDT::IOA2UCDevice::GetStreamInfoByIndex_StartingChannel(v5, v6, v7, v8, v9, v10, v11, v12);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v3 = v15;
  }
  else
  {
    uint64_t v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v14);
  return v3;
}

void sub_248A4AF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_Latency(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByIndex_TerminalType(ASDT::IOA2UCDevice *this, int a2, uint64_t a3)
{
  unsigned int v6 = 0;
  v5.var0 = (__CFDictionary *)ASDT::IOA2UCDevice::CopyStreamDictionaryByIndex(this, a2, a3);
  *(_WORD *)&v5.var1 = 1;
  if (v5.var0)
  {
    CACFDictionary::GetUInt32(&v5, @"terminal type", &v6);
    uint64_t v3 = v6;
  }
  else
  {
    uint64_t v3 = 0;
  }
  CACFDictionary::~CACFDictionary(&v5);
  return v3;
}

void sub_248A4B014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_Index(ASDT::IOA2UCDevice *this, int a2)
{
  char v4 = 1;
  do
  {
    theArray.var0 = 0;
    if (v4) {
      CFStringRef v5 = @"output streams";
    }
    else {
      CFStringRef v5 = @"input streams";
    }
    ASDT::UCObject::CopyProperty_CFArray(this, v5, (CFTypeRef *)&theArray.var0);
    var0 = theArray.var0;
    __int16 v16 = 1;
    if (theArray.var0 && (unsigned int Count = CFArrayGetCount(theArray.var0)) != 0)
    {
      unsigned int v7 = 1;
      do
      {
        LODWORD(v8) = v7 - 1;
        theArray.var0 = 0;
        *(_WORD *)&theArray.var1 = 0;
        CACFArray::GetCACFDictionary((CACFArray *)&var0, v7 - 1, &theArray);
        if (theArray.var0)
        {
          unsigned int v13 = 0;
          unsigned __int8 UInt32 = CACFDictionary::GetUInt32(&theArray, @"stream ID", &v13);
          if ((UInt32 & (v13 == a2)) != 0) {
            uint64_t v8 = v8;
          }
          else {
            uint64_t v8 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          uint64_t v8 = 0xFFFFFFFFLL;
        }
        CACFDictionary::~CACFDictionary(&theArray);
        if (v8 != -1) {
          break;
        }
      }
      while (v7++ < Count);
    }
    else
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }
    CACFArray::~CACFArray((CACFArray *)&var0);
    char v11 = (v8 == -1) & v4;
    char v4 = 0;
  }
  while ((v11 & 1) != 0);
  return v8;
}

void sub_248A4B168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
}

void ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(ASDT::IOA2UCDevice *this, int a2, AudioStreamBasicDescription *a3)
{
  v23.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v23.var1 = 1;
  if (v23.var0)
  {
    uint64_t v22 = 0;
    if (CACFDictionary::GetDictionary(&v23, @"current format", &v22))
    {
      if (ASDT::IOA2UCDevice::ConstructASBDFromDictionary(v22, (const __CFDictionary *)a3, v4)) {
        goto LABEL_4;
      }
      BOOL v13 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v13) {
        ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v5) {
        ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
LABEL_4:
  CACFDictionary::~CACFDictionary(&v23);
}

void sub_248A4B284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(ASDT::IOA2UCDevice *this, int a2)
{
  CFTypeRef cf = 0;
  v13.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v13.var1 = 1;
  if (!v13.var0) {
    goto LABEL_5;
  }
  if ((CACFDictionary::GetArray(&v13, @"available formats", (const __CFArray **)&cf) & 1) == 0)
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v4) {
      ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  if (cf)
  {
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
LABEL_5:
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4B378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(ASDT::IOA2UCDevice *this, int a2)
{
  unsigned int v14 = 0;
  v13.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v13.var1 = 1;
  if (v13.var0)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"starting channel", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4B460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_Latency(ASDT::IOA2UCDevice *this)
{
  return 0;
}

uint64_t ASDT::IOA2UCDevice::GetStreamInfoByID_TerminalType(ASDT::IOA2UCDevice *this, int a2)
{
  unsigned int v5 = 0;
  v4.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v4.var1 = 1;
  if (v4.var0)
  {
    CACFDictionary::GetUInt32(&v4, @"terminal type", &v5);
    uint64_t v2 = v5;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_248A4B4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

void ASDT::IOA2UCDevice::MapIOBufferForStream(ASDT::IOA2UCDevice *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  v18.var0 = ASDT::IOA2UCDevice::CopyStreamDictionaryByID(this, a2);
  *(_WORD *)&v18.var1 = 1;
  if (!v18.var0)
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v8) {
      ASDT::IOA2UCDevice::MapIOBufferForStream(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  unsigned int v17 = 1;
  CACFDictionary::GetUInt32(&v18, @"buffer mapping options", &v17);
  *a4 = (unsigned __int8 *)ASDT::UCObject::MapMemory(this, a2 + 0x10000000, v17, a3);
  CACFDictionary::~CACFDictionary(&v18);
}

void sub_248A4B5EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

uint64_t ASDT::IOA2UCDevice::ReleaseIOBufferForStream(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned __int8 *a3)
{
  return ASDT::UCObject::ReleaseMemory((uint64_t)this, a3);
}

void ASDT::IOA2UCDevice::SetStreamActive(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int a3)
{
  v3[2] = *MEMORY[0x263EF8340];
  v3[0] = a2;
  v3[1] = a3;
  if (ASDT::UCObject::CallMethod(this, 6u, v3, 2u, 0, 0, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::SetStreamActive();
    }
  }
}

__CFArray *ASDT::IOA2UCDevice::CopyControlList(ASDT::IOA2UCDevice *this)
{
  uint64_t v2 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"controls", (CFTypeRef *)&v2);
  return v2;
}

CFTypeRef ASDT::IOA2UCDevice::CopyControlDictionaryByIndex(ASDT::IOA2UCDevice *this, const __CFArray *a2)
{
  uint64_t v7 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"controls", (CFTypeRef *)&v7);
  unsigned int v5 = v7;
  __int16 v6 = 1;
  CFTypeRef v3 = ASDT::IOA2UCDevice::CopyControlDictionaryByIndex(v7, a2);
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

{
  CFTypeRef v3;
  ASDT::IOA2UCDevice *v5;
  __int16 v6;
  CFTypeRef cf;

  CFTypeRef cf = 0;
  unsigned int v5 = this;
  __int16 v6 = 0;
  if (this
    && CFArrayGetCount(this) > a2
    && (CACFArray::GetDictionary((CACFArray *)&v5, (uint64_t)a2, (const __CFDictionary **)&cf), cf))
  {
    CFRetain(cf);
    CFTypeRef v3 = cf;
  }
  else
  {
    CFTypeRef v3 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

void sub_248A4B75C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

void sub_248A4B7E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

__CFDictionary *ASDT::IOA2UCDevice::CopyControlDictionaryByID(ASDT::IOA2UCDevice *this, const __CFArray *a2)
{
  uint64_t v7 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"controls", (CFTypeRef *)&v7);
  unsigned int v5 = v7;
  __int16 v6 = 1;
  CFTypeRef v3 = ASDT::IOA2UCDevice::CopyControlDictionaryByID(v7, a2);
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

{
  int v2;
  unsigned int Count;
  unsigned int v4;
  int UInt32;
  int v6;
  __CFDictionary *var0;
  unsigned int v10;
  CACFDictionary cf;
  ASDT::IOA2UCDevice *v12;
  __int16 v13;

  uint64_t v12 = this;
  uint64_t v13 = 0;
  if (this && (uint64_t v2 = (int)a2, (Count = CFArrayGetCount(this)) != 0))
  {
    CACFDictionary v4 = 1;
    do
    {
      cf.var0 = 0;
      *(_WORD *)&cf.var1 = 0;
      CACFArray::GetCACFDictionary((CACFArray *)&v12, v4 - 1, &cf);
      if (cf.var0
        && ((uint64_t v10 = 0, UInt32 = CACFDictionary::GetUInt32(&cf, @"control ID", &v10), v10 == v2)
          ? (__int16 v6 = UInt32)
          : (__int16 v6 = 0),
            v6 == 1 && cf.var0))
      {
        CFRetain(cf.var0);
        var0 = cf.var0;
      }
      else
      {
        var0 = 0;
      }
      CACFDictionary::~CACFDictionary(&cf);
      if (var0) {
        break;
      }
    }
    while (v4++ < Count);
  }
  else
  {
    var0 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v12);
  return var0;
}

void sub_248A4B860(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

void sub_248A4B960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlDictionaryIndexByID(ASDT::IOA2UCDevice *this, const __CFArray *a2, _DWORD *a3, unsigned int *a4)
{
  *a3 = 0;
  uint64_t v13 = this;
  __int16 v14 = 0;
  if (this)
  {
    int v5 = (int)a2;
    unsigned int Count = CFArrayGetCount(this);
    if (Count)
    {
      uint64_t v7 = 0;
      do
      {
        v12.var0 = 0;
        *(_WORD *)&v12.var1 = 0;
        CACFArray::GetCACFDictionary((CACFArray *)&v13, v7, &v12);
        if (v12.var0)
        {
          unsigned int v11 = 0;
          int UInt32 = CACFDictionary::GetUInt32(&v12, @"control ID", &v11);
          if (v11 == v5) {
            int v9 = UInt32;
          }
          else {
            int v9 = 0;
          }
          if (v9 == 1) {
            *a3 = v7;
          }
        }
        else
        {
          LOBYTE(v9) = 0;
        }
        CACFDictionary::~CACFDictionary(&v12);
        if (v9) {
          break;
        }
        uint64_t v7 = (v7 + 1);
      }
      while (v7 < Count);
    }
  }
  CACFArray::~CACFArray((CACFArray *)&v13);
  return 0;
}

void sub_248A4BA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_BaseClass(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"base class", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetControlInfo_BaseClass(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4BB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Class(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"class", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetControlInfo_Class(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4BC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Scope(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"scope", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetControlInfo_Scope(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4BD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Element(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"element", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetControlInfo_Element(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4BDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

BOOL ASDT::IOA2UCDevice::GetControlInfo_IsReadOnly(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  BOOL v5 = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this)
  {
    CACFDictionary::GetBool(&v4, @"read only", &v5);
    BOOL v2 = v5;
  }
  else
  {
    BOOL v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_248A4BE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Variant(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v5 = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this)
  {
    CACFDictionary::GetUInt32(&v4, @"variant", &v5);
    uint64_t v2 = v5;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_248A4BEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopyControlInfo_Name(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef cf = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this && (CACFDictionary::GetString(&v4, @"name", (const __CFString **)&cf), cf))
  {
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_248A4BF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetControlInfo_Value(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"value", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetControlInfo_Value(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopyControlInfo_PropertySelectors(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef cf = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this && (CACFDictionary::GetArray(&v4, @"property selectors", (const __CFArray **)&cf), cf))
  {
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_248A4C0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetSliderControlInfo_MinimumValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"minimum value", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetSliderControlInfo_MinimumValue(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetSliderControlInfo_MaximumValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"maximum value", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetSliderControlInfo_MaximumValue(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopyLevelControlInfo_RangeMap(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if ((CACFDictionary::GetArray(&v13, @"range map", (const __CFArray **)&cf) & 1) == 0)
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::CopyLevelControlInfo_RangeMap(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetLevelControlInfo_TransferFunction(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v5 = 0;
  v4.var0 = this;
  *(_WORD *)&v4.var1 = 0;
  if (this)
  {
    CACFDictionary::GetUInt32(&v4, @"transfer function", &v5);
    uint64_t v2 = v5;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v4);
  return v2;
}

void sub_248A4C3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

void ASDT::IOA2UCDevice::SetupVolumeCurve(ASDT::IOA2UCDevice *this, CAVolumeCurve *a2, CAVolumeCurve *a3)
{
  CAVolumeCurve::ResetRange(a2);
  v16.var0 = this;
  *(_WORD *)&v16.var1 = 0;
  if (this)
  {
    CFArrayRef theArray = 0;
    __int16 v15 = 1;
    CACFDictionary::GetCACFArray(&v16, @"range map", (CACFArray *)&theArray);
    CFArrayRef v5 = theArray;
    if (theArray)
    {
      uint64_t v6 = 0;
LABEL_4:
      LODWORD(v5) = CFArrayGetCount(v5);
      while (v6 < v5)
      {
        v13.var0 = 0;
        *(_WORD *)&v13.var1 = 1;
        CACFArray::GetCACFDictionary((CACFArray *)&theArray, v6, &v13);
        if (v13.var0)
        {
          int v12 = 0;
          double v11 = 0.0;
          unsigned int v10 = 0;
          double v9 = 0.0;
          CACFDictionary::GetSInt32(&v13, @"start int value", &v12);
          CACFDictionary::GetFixed64(&v13, @"start db value", &v11);
          CACFDictionary::GetUInt32(&v13, @"integer steps", &v10);
          CACFDictionary::GetFixed64(&v13, @"db per step", &v9);
          float v7 = v11;
          float v8 = v11 + (double)v10 * v9;
          CAVolumeCurve::AddRange(a2, v12, v10 + v12, v7, v8);
        }
        CACFDictionary::~CACFDictionary(&v13);
        uint64_t v6 = (v6 + 1);
        CFArrayRef v5 = theArray;
        if (theArray) {
          goto LABEL_4;
        }
      }
    }
    LODWORD(v13.var0) = 0;
    if (CACFDictionary::GetUInt32(&v16, @"transfer function", (unsigned int *)&v13)) {
      CAVolumeCurve::SetTransferFunction(a2, (signed int)v13.var0);
    }
    CACFArray::~CACFArray((CACFArray *)&theArray);
  }
  CACFDictionary::~CACFDictionary(&v16);
}

void sub_248A4C59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CACFDictionary a13, char a14, uint64_t a15, CACFDictionary a16)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if ((CACFDictionary::GetArray(&v13, @"value", (const __CFArray **)&cf) & 1) == 0)
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C6A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopySelectorControlInfo_SelectorMap(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if ((CACFDictionary::GetArray(&v13, @"selectors", (const __CFArray **)&cf) & 1) == 0)
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::CopySelectorControlInfo_SelectorMap(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"left value", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftValue(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_CenterValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"center value", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_CenterValue(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4C950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightValue(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"right value", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightValue(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4CA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftChannel(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"left channel", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftChannel(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4CB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

uint64_t ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightChannel(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  unsigned int v14 = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (this)
  {
    if (!CACFDictionary::GetUInt32(&v13, @"right channel", &v14))
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v4) {
        ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightChannel(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26FCADEB8;
      exception[2] = 1852797029;
    }
    uint64_t v2 = v14;
  }
  else
  {
    uint64_t v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4CBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

CFTypeRef ASDT::IOA2UCDevice::CopyBlockControlInfo_Descriptor(ASDT::IOA2UCDevice *this, const __CFDictionary *a2)
{
  CFTypeRef cf = 0;
  v13.var0 = this;
  *(_WORD *)&v13.var1 = 0;
  if (!this) {
    goto LABEL_5;
  }
  if ((CACFDictionary::GetDictionary(&v13, @"descriptor", (const __CFDictionary **)&cf) & 1) == 0)
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v4) {
      ASDT::IOA2UCDevice::CopyBlockControlInfo_Descriptor(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  if (cf)
  {
    CFRetain(cf);
    CFTypeRef v2 = cf;
  }
  else
  {
LABEL_5:
    CFTypeRef v2 = 0;
  }
  CACFDictionary::~CACFDictionary(&v13);
  return v2;
}

void sub_248A4CCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10)
{
}

void ASDT::IOA2UCDevice::MapBlockControlBuffer(ASDT::IOA2UCDevice *this, const __CFDictionary *a2, int a3, unsigned int *a4, unsigned __int8 **a5)
{
  v19.var0 = a2;
  *(_WORD *)&v19.var1 = 0;
  if (!a2)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v9) {
      ASDT::IOA2UCDevice::MapBlockControlBuffer(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  unsigned int v18 = 1;
  CACFDictionary::GetUInt32(&v19, @"mapping options", &v18);
  *a5 = (unsigned __int8 *)ASDT::UCObject::MapMemory(this, a3 & 0xFFFFFFF | 0x30000000u, v18, a4);
  CACFDictionary::~CACFDictionary(&v19);
}

void sub_248A4CDE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

uint64_t ASDT::IOA2UCDevice::ReleaseBlockControlBuffer(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned __int8 *a3)
{
  return ASDT::UCObject::ReleaseMemory((uint64_t)this, a3);
}

void ASDT::IOA2UCDevice::MoveBlockControlData(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  if (ASDT::UCObject::CallMethod(this, 9u, v4, 3u, 0, 0, 0, 0, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::MoveBlockControlData();
    }
  }
}

__CFArray *ASDT::IOA2UCDevice::CopyDataExchangeBlockList(ASDT::IOA2UCDevice *this)
{
  CFTypeRef v2 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"data exchange blocks", (CFTypeRef *)&v2);
  return v2;
}

CFIndex ASDT::IOA2UCDevice::GetNumberDataExchangeBlocks(ASDT::IOA2UCDevice *this)
{
  CFArrayRef theArray = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"data exchange blocks", (CFTypeRef *)&theArray);
  CFArrayRef v3 = theArray;
  __int16 v4 = 1;
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v3);
  return Count;
}

void sub_248A4CF5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CACFArray::~CACFArray((CACFArray *)va);
  _Unwind_Resume(a1);
}

CFTypeRef ASDT::IOA2UCDevice::CopyDataExchangeBlockDictionaryByIndex(ASDT::IOA2UCDevice *this, uint64_t a2)
{
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"data exchange blocks", (CFTypeRef *)&theArray);
  CFArrayRef v5 = theArray;
  __int16 v6 = 1;
  if (theArray
    && CFArrayGetCount(theArray) > a2
    && (CACFArray::GetDictionary((CACFArray *)&v5, a2, (const __CFDictionary **)&cf), cf))
  {
    CFRetain(cf);
    CFTypeRef v3 = cf;
  }
  else
  {
    CFTypeRef v3 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&v5);
  return v3;
}

void sub_248A4D000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

__CFDictionary *ASDT::IOA2UCDevice::CopyDataExchangeBlockDictionaryByID(ASDT::IOA2UCDevice *this, int a2)
{
  theArray.var0 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"data exchange blocks", (CFTypeRef *)&theArray.var0);
  var0 = theArray.var0;
  __int16 v13 = 1;
  if (theArray.var0 && (unsigned int Count = CFArrayGetCount(theArray.var0)) != 0)
  {
    unsigned int v4 = 1;
    do
    {
      theArray.var0 = 0;
      *(_WORD *)&theArray.var1 = 0;
      CACFArray::GetCACFDictionary((CACFArray *)&var0, v4 - 1, &theArray);
      if (theArray.var0
        && ((unsigned int v10 = 0, UInt32 = CACFDictionary::GetUInt32(&theArray, @"block ID", &v10), v10 == a2)
          ? (int v6 = UInt32)
          : (int v6 = 0),
            v6 == 1 && theArray.var0))
      {
        CFRetain(theArray.var0);
        uint64_t v7 = theArray.var0;
      }
      else
      {
        uint64_t v7 = 0;
      }
      CACFDictionary::~CACFDictionary(&theArray);
      if (v7) {
        break;
      }
    }
    while (v4++ < Count);
  }
  else
  {
    uint64_t v7 = 0;
  }
  CACFArray::~CACFArray((CACFArray *)&var0);
  return v7;
}

void sub_248A4D11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, char a12)
{
}

void ASDT::IOA2UCDevice::MapDataExchangeBlockBuffer(ASDT::IOA2UCDevice *this, int a2, unsigned int *a3, unsigned __int8 **a4)
{
  v18.var0 = ASDT::IOA2UCDevice::CopyDataExchangeBlockDictionaryByID(this, a2);
  *(_WORD *)&v18.var1 = 1;
  if (!v18.var0)
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v8) {
      ASDT::IOA2UCDevice::MapDataExchangeBlockBuffer(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 1852797029;
  }
  unsigned int v17 = 1;
  CACFDictionary::GetUInt32(&v18, @"buffer mapping options", &v17);
  *a4 = (unsigned __int8 *)ASDT::UCObject::MapMemory(this, a2 + 0x20000000, v17, a3);
  CACFDictionary::~CACFDictionary(&v18);
}

void sub_248A4D238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

uint64_t ASDT::IOA2UCDevice::ReleaseDataExchangeBlockBuffer(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned __int8 *a3)
{
  return ASDT::UCObject::ReleaseMemory((uint64_t)this, a3);
}

uint64_t ASDT::IOA2UCDevice::MoveDataExchangeBlockData(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  unint64_t v6[3] = *MEMORY[0x263EF8340];
  v6[0] = a2;
  v6[1] = a4;
  v6[2] = a3;
  uint64_t v4 = ASDT::UCObject::CallMethod(this, 7u, v6, 3u, 0, 0, 0, 0, 0, 0);
  if (v4 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    ASDT::IOA2UCDevice::MoveDataExchangeBlockData();
  }
  return v4;
}

uint64_t ASDT::IOA2UCDevice::StartIO(ASDT::IOA2UCDevice *this)
{
  uint64_t result = ASDT::UCObject::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    int v3 = result;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::StartIO();
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = v3;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::StartIOWithFlags(ASDT::IOA2UCDevice *this, unint64_t a2)
{
  unint64_t v6 = a2;
  unint64_t v5 = 0;
  unsigned int v4 = 1;
  uint64_t v2 = ASDT::UCObject::CallMethod(this, 0xAu, &v6, 1u, 0, 0, &v5, &v4, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    ASDT::IOA2UCDevice::StartIOWithFlags();
  }
  return v2;
}

uint64_t ASDT::IOA2UCDevice::StopIO(ASDT::IOA2UCDevice *this)
{
  uint64_t result = ASDT::UCObject::CallMethod(this, 1u, 0, 0, 0, 0, 0, 0, 0, 0);
  if (result)
  {
    int v3 = result;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::StopIO();
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = v3;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  return result;
}

uint64_t ASDT::IOA2UCDevice::StopIOWithFlags(ASDT::IOA2UCDevice *this, unint64_t a2)
{
  unint64_t v6 = a2;
  unint64_t v5 = 0;
  unsigned int v4 = 1;
  uint64_t v2 = ASDT::UCObject::CallMethod(this, 0xBu, &v6, 1u, 0, 0, &v5, &v4, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    ASDT::IOA2UCDevice::StopIOWithFlags();
  }
  return v2;
}

uint64_t ASDT::IOA2UCDevice::DoIO(ASDT::IOA2UCDevice *this)
{
  if (*((_DWORD *)this + 3) && *((unsigned char *)this + 34)) {
    JUMPOUT(0x24C587FD0);
  }
  return 1937010544;
}

uint64_t ASDT::IOA2UCDevice::SetStreamCurrentFormat(ASDT::IOA2UCDevice *this, unsigned int a2, const AudioStreamBasicDescription *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = vcvtd_n_s64_f64(a3->mSampleRate - floor(a3->mSampleRate), 0x20uLL) | (vcvtmd_s64_f64(a3->mSampleRate) << 32);
  long long v6 = *(_OWORD *)&a3->mFormatID;
  uint64_t v7 = *(void *)&a3->mBytesPerFrame;
  UInt32 mBitsPerChannel = a3->mBitsPerChannel;
  v9[0] = a2;
  uint64_t v3 = ASDT::UCObject::CallMethod(this, 5u, v9, 1u, &v5, 0x28uLL, 0, 0, 0, 0);
  if (v3 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    ASDT::IOA2UCDevice::SetStreamCurrentFormat();
  }
  return v3;
}

uint64_t ASDT::IOA2UCDevice::SetControlValue(ASDT::IOA2UCDevice *this, unsigned int a2, unsigned int *a3)
{
  void v11[2] = *MEMORY[0x263EF8340];
  unint64_t v4 = *a3;
  v11[0] = a2;
  v11[1] = v4;
  unint64_t v10 = 0;
  unsigned int v9 = 1;
  int v5 = ASDT::UCObject::CallMethod(this, 2u, v11, 2u, 0, 0, &v10, &v9, 0, 0);
  if (v5)
  {
    int v7 = v5;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::SetControlValue();
    }
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = v7;
    __cxa_throw(exception, MEMORY[0x263F8C258], 0);
  }
  *a3 = v10;
  return 0;
}

uint64_t ASDT::IOA2UCDevice::SetMultiControlValue(ASDT::IOA2UCDevice *this, unsigned int a2, const unsigned int *a3, int a4, unsigned int *a5, unsigned int *a6)
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = (a4 + 1);
  MEMORY[0x270FA5388]();
  uint64_t v11 = (char *)v18 - v10;
  *(_DWORD *)((char *)v18 - v10) = v12;
  memcpy((char *)v18 - v10 + 4, v14, 4 * v13);
  if (a6) {
    uint64_t v15 = 4 * *a6;
  }
  else {
    uint64_t v15 = 0;
  }
  v18[0] = v15;
  uint64_t v16 = ASDT::UCObject::CallMethod(this, 8u, 0, 0, v11, 4 * v9, 0, 0, a5, v18);
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      ASDT::IOA2UCDevice::SetMultiControlValue();
    }
  }
  else if (a6)
  {
    *a6 = v18[0] >> 2;
  }
  return v16;
}

uint64_t ASDT::IOA2UCDevice::ReplaceControlValue(ASDT::IOA2UCDevice *this, int a2, int a3)
{
  theDict.var0 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"controls", (CFTypeRef *)&theDict.var0);
  uint64_t v6 = 0;
  CFArrayRef theArray = theDict.var0;
  __int16 v24 = 1;
  int v7 = (CACFDictionary *)((char *)this + 16);
  while (1)
  {
    unsigned int Count = theArray;
    if (theArray) {
      unsigned int Count = CFArrayGetCount(theArray);
    }
    if (v6 >= Count)
    {
      uint64_t v11 = 0;
      goto LABEL_26;
    }
    theDict.var0 = 0;
    *(_WORD *)&theDict.var1 = 0;
    CACFArray::GetCACFDictionary((CACFArray *)&theArray, v6, &theDict);
    if (theDict.var0)
    {
      unsigned int v21 = 0;
      int UInt32 = CACFDictionary::GetUInt32(&theDict, @"control ID", &v21);
      int v10 = v21 == a2 ? UInt32 : 0;
      if (v10 == 1) {
        break;
      }
    }
    CACFDictionary::~CACFDictionary(&theDict);
    uint64_t v6 = (v6 + 1);
  }
  unsigned int v20 = 0;
  CACFDictionary::GetUInt32(&theDict, @"base class", &v20);
  int v19 = 0;
  CACFDictionary::GetSInt32(&theDict, @"value", &v19);
  uint64_t v11 = 0;
  if ((int)v20 <= 1936483441)
  {
    if (v20 != 1818588780 && v20 != 1936483188) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  if (v20 == 1936483442 || v20 == 1936744814)
  {
LABEL_21:
    if (v19 != a3) {
      goto LABEL_17;
    }
LABEL_22:
    uint64_t v11 = 0;
    goto LABEL_25;
  }
  if (v20 == 1953458028)
  {
    if ((a3 != 0) == (v19 == 0))
    {
LABEL_17:
      v18.var0 = CFDictionaryCreateMutableCopy(0, 0, theDict.var0);
      *(_WORD *)&v18.var1 = 257;
      CACFDictionary::AddSInt32(&v18, @"value");
      if (theArray)
      {
        unsigned int v12 = CFArrayGetCount(theArray);
        CFArrayRef v13 = theArray;
        CFIndex v14 = v12;
      }
      else
      {
        CFArrayRef v13 = 0;
        CFIndex v14 = 0;
      }
      MutableCopy = CFArrayCreateMutableCopy(0, v14, v13);
      __int16 v17 = 257;
      MEMORY[0x24C5883E0](&MutableCopy, v6, v18.var0);
      CACFDictionary::AddArray(v7, @"controls", MutableCopy);
      CACFArray::~CACFArray((CACFArray *)&MutableCopy);
      CACFDictionary::~CACFDictionary(&v18);
      uint64_t v11 = 1;
      goto LABEL_25;
    }
    goto LABEL_22;
  }
LABEL_25:
  CACFDictionary::~CACFDictionary(&theDict);
LABEL_26:
  CACFArray::~CACFArray((CACFArray *)&theArray);
  return v11;
}

void sub_248A4DAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11, uint64_t a12, uint64_t a13, CACFDictionary a14, char a15)
{
}

uint64_t ASDT::IOA2UCDevice::ReplaceMultiControlValue(ASDT::IOA2UCDevice *this, int a2, const unsigned int *a3, unsigned int a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v40 = 0;
  ASDT::UCObject::CopyProperty_CFArray(this, @"controls", (CFTypeRef *)&v40);
  int v7 = 0;
  uint64_t v8 = 0;
  CFArrayRef v45 = v40;
  __int16 v46 = 1;
  uint64_t v9 = &a3[a4 >> 2];
  if (a4 >> 2 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = a4 >> 2;
  }
  uint64_t v30 = v10;
  while (1)
  {
    unsigned int Count = v45;
    if (v45) {
      unsigned int Count = CFArrayGetCount(v45);
    }
    if (v8 >= Count) {
      break;
    }
    v44.var0 = 0;
    *(_WORD *)&v44.var1 = 0;
    CACFArray::GetCACFDictionary((CACFArray *)&v45, v8, &v44);
    if (v44.var0)
    {
      unsigned int v43 = 0;
      int UInt32 = CACFDictionary::GetUInt32(&v44, @"control ID", &v43);
      if (v43 == a2) {
        int v13 = UInt32;
      }
      else {
        int v13 = 0;
      }
      if (v13 == 1)
      {
        uint64_t v40 = 0;
        char v41 = 0;
        uint64_t v42 = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v40, a3, (uint64_t)v9, a4 >> 2);
        std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
        int v39 = 0;
        CACFDictionary::GetArray(&v44, @"value", &v39);
        uint64_t v37 = v39;
        __int16 v38 = 0;
        int v29 = a2;
        uint64_t v28 = v9;
        if (v39)
        {
          CFArrayGetCount(v39);
          unsigned int v14 = MEMORY[0x270FA5388]();
          uint64_t v16 = (uint64_t *)&v26[-v15];
          unint64_t v17 = v14;
          if (v14)
          {
            int v27 = v7;
            uint64_t v18 = 0;
            int v19 = (unsigned int *)&v26[-v15];
            do
              CACFArray::GetUInt32((CACFArray *)&v37, v18++, v19++);
            while (v17 != v18);
            int v7 = v27;
          }
        }
        else
        {
          MEMORY[0x270FA5388]();
          uint64_t v16 = &v25;
          unint64_t v17 = 0;
        }
        uint64_t v34 = 0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v34, v16, (uint64_t)v16 + 4 * v17, v17);
        std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>();
        unsigned int v20 = v34;
        if (v35 - v34 != v41 - v40 || memcmp(v34, v40, v35 - v34))
        {
          v33.var0 = CFDictionaryCreateMutableCopy(0, 0, v44.var0);
          *(_WORD *)&v33.var1 = 257;
          CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
          CFArrayRef v31 = Mutable;
          __int16 v32 = 257;
          uint64_t v22 = v30;
          CACFDictionary v23 = a3;
          if (a4 >= 4)
          {
            do
            {
              ++v23;
              CACFArray::AppendUInt32((CACFArray *)&v31);
              --v22;
            }
            while (v22);
            CFArrayRef Mutable = v31;
          }
          CACFDictionary::AddArray(&v33, @"value", Mutable);
          MEMORY[0x24C5883E0](&v45, v8, v33.var0);
          CACFArray::~CACFArray((CACFArray *)&v31);
          CACFDictionary::~CACFDictionary(&v33);
          int v7 = 1;
          unsigned int v20 = v34;
        }
        if (v20)
        {
          uint64_t v35 = v20;
          operator delete(v20);
        }
        CACFArray::~CACFArray((CACFArray *)&v37);
        if (v40)
        {
          char v41 = v40;
          operator delete(v40);
        }
        a2 = v29;
        uint64_t v9 = v28;
      }
      CACFDictionary::~CACFDictionary(&v44);
      uint64_t v8 = (v8 + 1);
      if (v13) {
        break;
      }
    }
    else
    {
      CACFDictionary::~CACFDictionary(&v44);
      uint64_t v8 = (v8 + 1);
    }
  }
  CACFArray::~CACFArray((CACFArray *)&v45);
  return v7 & 1;
}

void sub_248A4DE9C(_Unwind_Exception *a1)
{
  CACFArray::~CACFArray((CACFArray *)(v1 - 184));
  uint64_t v3 = *(void **)(v1 - 160);
  if (v3)
  {
    *(void *)(v1 - 152) = v3;
    operator delete(v3);
  }
  CACFDictionary::~CACFDictionary((CACFDictionary *)(v1 - 128));
  CACFArray::~CACFArray((CACFArray *)(v1 - 112));
  _Unwind_Resume(a1);
}

BOOL ASDT::IOA2UCDevice::ReplaceMultiControlValue(ASDT::IOA2UCDevice *this, __CFDictionary *a2, const unsigned int *a3)
{
  v10.var0 = this;
  *(_WORD *)&v10.var1 = 256;
  if (this)
  {
    LODWORD(v4) = a3;
    CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    uint64_t v8 = Mutable;
    __int16 v9 = 257;
    if (v4)
    {
      uint64_t v4 = v4;
      do
      {
        a2 = (__CFDictionary *)((char *)a2 + 4);
        CACFArray::AppendUInt32((CACFArray *)&v8);
        --v4;
      }
      while (v4);
      CFArrayRef Mutable = v8;
    }
    CACFDictionary::AddArray(&v10, @"value", Mutable);
    CACFArray::~CACFArray((CACFArray *)&v8);
  }
  CACFDictionary::~CACFDictionary(&v10);
  return this != 0;
}

void sub_248A4DFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CACFDictionary a11)
{
}

void ASDT::IOA2UCDevice::ReplaceControlList(CFDictionaryRef *this, uint64_t a2, uint64_t a3, const __CFArray **a4)
{
  var18.isa = 0;
  if (ASDT::UCObject::CopyProperty_CFArray((ASDT::UCObject *)*((unsigned int *)this + 2), @"controls", &var18, a4))
  {
    isa = (__CFArray *)var18.isa;
    __int16 v7 = 1;
    v5.var0 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(_WORD *)&v5.var1 = 257;
    CACFDictionary::SetCFMutableDictionaryFromCopy(&v5, this[2], 1);
    CACFDictionary::AddArray(&v5, @"controls", isa);
    CACFDictionary::operator=((uint64_t)(this + 2), (uint64_t)&v5);
    CACFDictionary::~CACFDictionary(&v5);
    CACFArray::~CACFArray((CACFArray *)&isa);
  }
}

void sub_248A4E0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10, char a11)
{
}

void ASDT::IOA2UCDevice::ReplaceControlInfo(ASDT::IOA2UCDevice *this, const __CFArray *a2, uint64_t a3, const __CFArray **a4)
{
  v16.isa = 0;
  if (ASDT::UCObject::CopyProperty_CFArray((ASDT::UCObject *)*((unsigned int *)this + 2), @"controls", &v16, a4))
  {
    isa = v16.isa;
    __int16 v15 = 1;
    v13.var0 = ASDT::IOA2UCDevice::CopyControlDictionaryByID((ASDT::IOA2UCDevice *)v16.isa, a2);
    *(_WORD *)&v13.var1 = 1;
    CFArrayRef theArray = 0;
    CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    __int16 v12 = 257;
    uint64_t v6 = (CACFDictionary *)((char *)this + 16);
    CACFDictionary::GetArray(v6, @"controls", &theArray);
    if (theArray) {
      CACFArray::SetCFMutableArrayFromCopy((CACFArray *)&Mutable, theArray, 1);
    }
    ASDT::IOA2UCDevice::GetControlDictionaryIndexByID(Mutable, a2, &v9, v7);
    if (v13.var0) {
      CACFArray::AppendDictionary((CACFArray *)&Mutable, v13.var0);
    }
    v8.var0 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(_WORD *)&v8.var1 = 257;
    CACFDictionary::SetCFMutableDictionaryFromCopy(&v8, v6->var0, 1);
    CACFDictionary::AddArray(&v8, @"controls", Mutable);
    CACFDictionary::operator=((uint64_t)v6, (uint64_t)&v8);
    CACFDictionary::~CACFDictionary(&v8);
    CACFArray::~CACFArray((CACFArray *)&Mutable);
    CACFDictionary::~CACFDictionary(&v13);
    CACFArray::~CACFArray((CACFArray *)&isa);
  }
}

void sub_248A4E258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CACFDictionary a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, CACFDictionary a15)
{
  CACFArray::~CACFArray((CACFArray *)&a13);
  CACFDictionary::~CACFDictionary(&a15);
  CACFArray::~CACFArray((CACFArray *)(v15 - 56));
  _Unwind_Resume(a1);
}

CFMutableArrayRef CACFArray::SetCFMutableArrayFromCopy(CACFArray *this, CFArrayRef theArray, char a3)
{
  if (*((unsigned char *)this + 8))
  {
    uint64_t v6 = *(const void **)this;
    if (*(void *)this) {
      CFRelease(v6);
    }
  }
  CFMutableArrayRef result = CFArrayCreateMutableCopy(0, 0, theArray);
  *(void *)this = result;
  *((unsigned char *)this + 9) = 1;
  *((unsigned char *)this + 8) = a3;
  return result;
}

uint64_t ASDT::IOA2UCDevice::PerformConfigChange(ASDT::IOA2UCDevice *this, const IOAudio2Notification *a2)
{
  uint64_t v2 = ASDT::UCObject::CallMethod(this, 3u, 0, 0, a2, 0x20uLL, 0, 0, 0, 0);
  if (v2 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    ASDT::IOA2UCDevice::PerformConfigChange();
  }
  return v2;
}

IOAudio2EngineStatus *ASDT::IOA2UCDevice::MapEngineStatus(ASDT::IOA2UCDevice *this, IOAudio2EngineStatus **a2)
{
  unsigned int v13 = 0;
  CFMutableArrayRef result = (IOAudio2EngineStatus *)ASDT::UCObject::MapMemory(this, 0, 1u, &v13);
  if (v13 <= 0x27)
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v4) {
      ASDT::IOA2UCDevice::MapEngineStatus(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    *(void *)exception = &unk_26FCADEB8;
    exception[2] = 2003329396;
  }
  *a2 = result;
  return result;
}

uint64_t ASDT::IOA2UCDevice::ReleaseEngineStatus(uint64_t this, void *a2)
{
  return ASDT::UCObject::ReleaseMemory(this, a2);
}

uint64_t ASDT::IOA2UCDevice::SupportsPreWarming(ASDT::IOA2UCDevice *this)
{
  return *((unsigned __int8 *)this + 35);
}

void CAVolumeCurve::CAVolumeCurve(CAVolumeCurve *this)
{
  this->mTag = 0;
  this->mCurveMap.__tree_.__pair3_.__value_ = 0;
  this->mCurveMap.__tree_.__pair1_.__value_.__left_ = 0;
  this->mCurveMap.__tree_.__begin_node_ = &this->mCurveMap.__tree_.__pair1_;
  this->mIsApplyingTransferFunction = 1;
  this->mTransferFunction = 5;
  *(void *)&this->mRawToScalarExponentNumerator = 0x3F80000040000000;
}

{
  this->mTag = 0;
  this->mCurveMap.__tree_.__pair3_.__value_ = 0;
  this->mCurveMap.__tree_.__pair1_.__value_.__left_ = 0;
  this->mCurveMap.__tree_.__begin_node_ = &this->mCurveMap.__tree_.__pair1_;
  this->mIsApplyingTransferFunction = 1;
  this->mTransferFunction = 5;
  *(void *)&this->mRawToScalarExponentNumerator = 0x3F80000040000000;
}

uint64_t CAVolumeCurve::GetMinimumRaw(CAVolumeCurve *this)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_) {
    return *((unsigned int *)this->mCurveMap.__tree_.__begin_node_ + 7);
  }
  else {
    return 0;
  }
}

uint64_t CAVolumeCurve::GetMaximumRaw(CAVolumeCurve *this)
{
  unint64_t value = this->mCurveMap.__tree_.__pair3_.__value_;
  if (!value) {
    return 0;
  }
  begin_node = this->mCurveMap.__tree_.__begin_node_;
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(&begin_node, (int)value - 1);
  return *((unsigned int *)begin_node + 8);
}

double CAVolumeCurve::GetMinimumDB(CAVolumeCurve *this)
{
  if (!this->mCurveMap.__tree_.__pair3_.__value_) {
    return 0.0;
  }
  LODWORD(result) = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 9);
  return result;
}

double CAVolumeCurve::GetMaximumDB(CAVolumeCurve *this)
{
  unint64_t value = this->mCurveMap.__tree_.__pair3_.__value_;
  if (!value) {
    return 0.0;
  }
  begin_node = this->mCurveMap.__tree_.__begin_node_;
  std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(&begin_node, (int)value - 1);
  LODWORD(result) = *((_DWORD *)begin_node + 10);
  return result;
}

CAVolumeCurve *CAVolumeCurve::SetTransferFunction(CAVolumeCurve *this, signed int a2)
{
  this->mTransferFunction = a2;
  if (a2 > 0xF)
  {
    float v4 = 1.0;
    float v3 = 2.0;
    char v2 = 1;
  }
  else
  {
    char v2 = byte_248A5AC70[a2];
    float v3 = flt_248A5AC80[a2];
    float v4 = flt_248A5ACC0[a2];
  }
  this->mIsApplyingTransferFunction = v2;
  this->mRawToScalarExponentNumerator = v3;
  this->mRawToScalarExponentDenominator = v4;
  return this;
}

void CAVolumeCurve::AddRange(CAVolumeCurve *this, signed int a2, signed int a3, float a4, float a5)
{
  begin_node = (uint64_t **)this->mCurveMap.__tree_.__begin_node_;
  p_mCurveMap = (uint64_t **)&this->mCurveMap;
  uint64_t v6 = begin_node;
  if (begin_node == p_mCurveMap + 1) {
    goto LABEL_25;
  }
  do
  {
    int v8 = *((_DWORD *)v6 + 7);
    BOOL v9 = *((_DWORD *)v6 + 8) > a2 && v8 < a3;
    char v10 = v9;
    if (v9 || v8 <= a2)
    {
      __int16 v12 = v6;
    }
    else
    {
      uint64_t v11 = v6[1];
      if (v11)
      {
        do
        {
          __int16 v12 = (uint64_t **)v11;
          uint64_t v11 = (uint64_t *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          __int16 v12 = (uint64_t **)v6[2];
          BOOL v13 = *v12 == (uint64_t *)v6;
          uint64_t v6 = v12;
        }
        while (!v13);
      }
    }
    if (v12 == p_mCurveMap + 1) {
      char v14 = 1;
    }
    else {
      char v14 = v10;
    }
    if (v14) {
      break;
    }
    uint64_t v6 = v12;
  }
  while (v8 > a2);
  if ((v10 & 1) == 0)
  {
LABEL_25:
    unint64_t v15 = __PAIR64__(a3, a2);
    float v16 = a4;
    float v17 = a5;
    std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::__emplace_unique_key_args<CARawPoint,std::pair<CARawPoint const,CADBPoint>>(p_mCurveMap, (int *)&v15, (uint64_t *)&v15);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, " CAVolumeCurve::AddRange: new point overlaps", (uint8_t *)&v15, 2u);
  }
}

void CAVolumeCurve::ResetRange(CAVolumeCurve *this)
{
  p_pair1 = &this->mCurveMap.__tree_.__pair1_;
  std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::destroy((uint64_t)&this->mCurveMap, (void *)this->mCurveMap.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

BOOL CAVolumeCurve::CheckForContinuity(CAVolumeCurve *this)
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)this->mCurveMap.__tree_.__begin_node_;
  p_pair1 = &this->mCurveMap.__tree_.__pair1_;
  if (begin_node == &this->mCurveMap.__tree_.__pair1_) {
    return 1;
  }
  int left_high = HIDWORD(begin_node[3].__value_.__left_);
  float v4 = *((float *)&begin_node[4].__value_.__left_ + 1);
  do
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)begin_node[1].__value_.__left_;
    uint64_t v6 = begin_node;
    if (left)
    {
      do
      {
        uint64_t v7 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)left->__value_.__left_;
      }
      while (left);
    }
    else
    {
      do
      {
        uint64_t v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)v6[2].__value_.__left_;
        BOOL v10 = v7->__value_.__left_ == v6;
        uint64_t v6 = v7;
      }
      while (!v10);
    }
    int v8 = HIDWORD(begin_node[3].__value_.__left_);
    float v9 = *((float *)&begin_node[4].__value_.__left_ + 1);
    BOOL v10 = v4 == v9 && left_high == v8;
    BOOL result = v10;
    if (v7 == p_pair1) {
      break;
    }
    int left_high = left_high - v8 + LODWORD(begin_node[4].__value_.__left_);
    float v4 = v4 + (float)(*(float *)&begin_node[5].__value_.__left_ - v9);
    begin_node = v7;
  }
  while (result);
  return result;
}

uint64_t CAVolumeCurve::ConvertDBToRaw(CAVolumeCurve *this, float a2)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_) {
    float v4 = *((float *)this->mCurveMap.__tree_.__begin_node_ + 9);
  }
  else {
    float v4 = 0.0;
  }
  double MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  if (v4 <= a2) {
    float v6 = a2;
  }
  else {
    float v6 = v4;
  }
  if (v6 <= *(float *)&MaximumDB) {
    *(float *)&double MaximumDB = v6;
  }
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)this->mCurveMap.__tree_.__begin_node_;
  uint64_t result = HIDWORD(begin_node[3].__value_.__left_);
  if (begin_node != &this->mCurveMap.__tree_.__pair1_)
  {
    do
    {
      int v9 = LODWORD(begin_node[4].__value_.__left_) - HIDWORD(begin_node[3].__value_.__left_);
      float v10 = *(float *)&begin_node[5].__value_.__left_;
      if (*(float *)&MaximumDB <= v10) {
        int v9 = llroundf((float)(*(float *)&MaximumDB - *((float *)&begin_node[4].__value_.__left_ + 1))/ (float)((float)(v10 - *((float *)&begin_node[4].__value_.__left_ + 1)) / (float)v9));
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          __int16 v12 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          __int16 v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v13 = v12->__value_.__left_ == begin_node;
          begin_node = v12;
        }
        while (!v13);
      }
      uint64_t result = (v9 + result);
      BOOL v13 = *(float *)&MaximumDB <= v10 || v12 == &this->mCurveMap.__tree_.__pair1_;
      begin_node = v12;
    }
    while (!v13);
  }
  return result;
}

uint64_t CAVolumeCurve::ConvertRawToDB(CAVolumeCurve *this, int a2)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_) {
    int v4 = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 7);
  }
  else {
    int v4 = 0;
  }
  uint64_t result = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= (int)result) {
    int v6 = result;
  }
  int v7 = v6 - v4;
  begin_node = (float *)this->mCurveMap.__tree_.__begin_node_;
  float v9 = begin_node[9];
  p_pair1 = &this->mCurveMap.__tree_.__pair1_;
  BOOL v11 = v7 < 1 || begin_node == (float *)p_pair1;
  if (!v11)
  {
    do
    {
      int v12 = *((_DWORD *)begin_node + 8) - *((_DWORD *)begin_node + 7);
      if (v7 >= v12) {
        int v13 = *((_DWORD *)begin_node + 8) - *((_DWORD *)begin_node + 7);
      }
      else {
        int v13 = v7;
      }
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)*((void *)begin_node + 1);
      unint64_t v15 = begin_node;
      if (left)
      {
        do
        {
          float v16 = left;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)left->__value_.__left_;
        }
        while (left);
      }
      else
      {
        do
        {
          float v16 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CARawPoint, CADBPoint>, void *>>> *)*((void *)v15 + 2);
          BOOL v11 = v16->__value_.__left_ == v15;
          unint64_t v15 = (float *)v16;
        }
        while (!v11);
      }
      float v9 = v9 + (float)((float)v13 * (float)((float)(begin_node[10] - begin_node[9]) / (float)v12));
      v7 -= v13;
      if (v7 < 1) {
        break;
      }
      begin_node = (float *)v16;
    }
    while (v16 != p_pair1);
  }
  return result;
}

float CAVolumeCurve::ConvertRawToScalar(CAVolumeCurve *this, int a2)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_) {
    int v4 = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 7);
  }
  else {
    int v4 = 0;
  }
  int MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (v4 <= a2) {
    int v6 = a2;
  }
  else {
    int v6 = v4;
  }
  if (v6 >= MaximumRaw) {
    int v6 = MaximumRaw;
  }
  float v7 = (float)(v6 - v4) / (float)(MaximumRaw - v4);
  if (!CAVolumeCurve::GetIsApplyingTransferFunction(this)) {
    return v7;
  }
  float v8 = this->mRawToScalarExponentNumerator / this->mRawToScalarExponentDenominator;
  return powf(v7, v8);
}

BOOL CAVolumeCurve::GetIsApplyingTransferFunction(CAVolumeCurve *this)
{
  if (this->mCurveMap.__tree_.__pair3_.__value_) {
    float v2 = *((float *)this->mCurveMap.__tree_.__begin_node_ + 9);
  }
  else {
    float v2 = 0.0;
  }
  double MaximumDB = CAVolumeCurve::GetMaximumDB(this);
  return (float)(*(float *)&MaximumDB - v2) > 30.0 && this->mIsApplyingTransferFunction;
}

float CAVolumeCurve::ConvertDBToScalar(CAVolumeCurve *this, float a2)
{
  int v3 = CAVolumeCurve::ConvertDBToRaw(this, a2);
  return CAVolumeCurve::ConvertRawToScalar(this, v3);
}

uint64_t CAVolumeCurve::ConvertScalarToRaw(CAVolumeCurve *this, float a2)
{
  float v3 = fmaxf(a2, 0.0);
  if (this->mCurveMap.__tree_.__pair3_.__value_) {
    int v4 = *((_DWORD *)this->mCurveMap.__tree_.__begin_node_ + 7);
  }
  else {
    int v4 = 0;
  }
  float v5 = fminf(v3, 1.0);
  int MaximumRaw = CAVolumeCurve::GetMaximumRaw(this);
  if (CAVolumeCurve::GetIsApplyingTransferFunction(this)) {
    float v5 = powf(v5, this->mRawToScalarExponentDenominator / this->mRawToScalarExponentNumerator);
  }
  return v4 + llroundf(v5 * (float)(MaximumRaw - v4));
}

uint64_t CAVolumeCurve::ConvertScalarToDB(CAVolumeCurve *this, float a2)
{
  int v3 = CAVolumeCurve::ConvertScalarToRaw(this, a2);
  return CAVolumeCurve::ConvertRawToDB(this, v3);
}

void **std::__advance[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<CARawPoint,CADBPoint>,std::__tree_node<std::__value_type<CARawPoint,CADBPoint>,void *> *,long>>>(void **result, uint64_t a2)
{
  if (a2 < 0)
  {
    float v7 = *result;
    do
    {
      float v8 = (void *)*v7;
      if (*v7)
      {
        do
        {
          int v4 = v8;
          float v8 = (void *)v8[1];
        }
        while (v8);
      }
      else
      {
        do
        {
          int v4 = (void *)v7[2];
          BOOL v5 = *v4 == (void)v7;
          float v7 = v4;
        }
        while (v5);
      }
      float v7 = v4;
    }
    while (!__CFADD__(a2++, 1));
  }
  else
  {
    if (!a2) {
      return result;
    }
    float v2 = *result;
    do
    {
      int v3 = (void *)v2[1];
      if (v3)
      {
        do
        {
          int v4 = v3;
          int v3 = (void *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          int v4 = (void *)v2[2];
          BOOL v5 = *v4 == (void)v2;
          float v2 = v4;
        }
        while (!v5);
      }
      float v2 = v4;
    }
    while (a2-- > 1);
  }
  IOAudio2EngineStatus *result = v4;
  return result;
}

uint64_t *std::__tree<std::__value_type<CARawPoint,CADBPoint>,std::__map_value_compare<CARawPoint,std::__value_type<CARawPoint,CADBPoint>,std::less<CARawPoint>,true>,std::allocator<std::__value_type<CARawPoint,CADBPoint>>>::__emplace_unique_key_args<CARawPoint,std::pair<CARawPoint const,CADBPoint>>(uint64_t **a1, int *a2, uint64_t *a3)
{
  int v6 = a1 + 1;
  BOOL v5 = a1[1];
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        float v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 7);
        if (v7 >= v9) {
          break;
        }
        BOOL v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      BOOL v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    float v8 = a1 + 1;
LABEL_10:
    float v10 = (uint64_t *)operator new(0x30uLL);
    uint64_t v11 = a3[1];
    *(uint64_t *)((char *)v10 + 28) = *a3;
    *(uint64_t *)((char *)v10 + 36) = v11;
    std::__tree<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::__map_value_compare<applesauce::CF::StringRef,std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>,std::less<applesauce::CF::StringRef>,true>,std::allocator<std::__value_type<applesauce::CF::StringRef,applesauce::CF::TypeRef>>>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

void anonymous namespace'::LogBadDevice(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UserClient::SetNominalSampleRate()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: SetNominalSampleRate", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::SetClientDescription()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: SetClientDescription", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStreamInfo_CurrentFormat: there is no current format", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStreamInfo_CurrentFormat: bad format dictionary", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::CopyStreamInfo_AvailableFormats()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: CopyStreamInfo_AvailableFormats: there are no available formats", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStreamInfo_StartingChannel()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStreamInfo_StartingChannel: there is no starting channel", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::MapIOBufferForStream()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: MapIOBufferForStream: no stream for the given ID: %u", v2, v3);
}

{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: MapIOBufferForStream(%u) failed", v2, v3);
}

void ASDT::IOA2UserClient::GetControlInfo_BaseClass()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetControlInfo_BaseClass: there is no control base class", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetControlInfo_Class()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetControlInfo_Class: there is no control class", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetSliderControlInfo_MinimumValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetSliderControlInfo_MinimumValue: there is no minimum value", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetSliderControlInfo_MaximumValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetSliderControlInfo_MaximumValue: there is no maximum value", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::CopyLevelControlInfo_RangeMap()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: CopyLevelControlInfo_RangeMap: there is no range map", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::CopySelectorControlInfo_MultiSelectorValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: CopySelectorControlInfo_MultiSelectorValue: there is no selector value", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::CopySelectorControlInfo_SelectorMap()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: CopySelectorControlInfo_SelectorMap: there is no selector map", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStereoPanControlInfo_LeftValue: there is no left value", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_CenterValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStereoPanControlInfo_CenterValue: there is no center value", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_RightValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStereoPanControlInfo_RightValue: there is no right value", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_LeftChannel()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStereoPanControlInfo_LeftChannel: there is no left channel", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::GetStereoPanControlInfo_RightChannel()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetStereoPanControlInfo_RightChannel: there is no right channel", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::CopyBlockControlInfo_Descriptor()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: CopyBlockControlInfo_Descriptor: there is no descriptor", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::MapBlockControlBuffer()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: MapBlockControlBuffer: no control info", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: MapBlockControlBuffer: control ID missing", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: MapBlockControlBuffer(%u) failed", v2, v3);
}

void ASDT::IOA2UserClient::MoveBlockControlData()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: MoveBlockControlData failed", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::MapDataExchangeBlockBuffer()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: MapDataExchangeBlockBuffer: no data exchange block for the given ID", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: MapDataExchangeBlockBuffer(%u) failed", v2, v3);
}

void ASDT::IOA2UserClient::MoveDataExchangeBlockData()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: MoveDataExchangeBlockData(%u) failed", v2, v3);
}

void ASDT::IOA2UserClient::StartIO()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: StartIO failed", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::StartIOWithFlags()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_248A1B000, v0, v1, "%s: StartIOWithFlags(%llu) failed", v2, v3);
}

void ASDT::IOA2UserClient::StopIO()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: StopIO failed", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::StopIOWithFlags()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_248A1B000, v0, v1, "%s: StopIOWithFlags(%llu) failed", v2, v3);
}

void ASDT::IOA2UserClient::SetStreamCurrentFormat()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: SetStreamCurrentFormat(%u): got an error when telling the hardware to set the stream format", v2, v3);
}

void ASDT::IOA2UserClient::SetMultiControlValue()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: SetMultiControlValue(%u): Failed to set control multi-value", v2, v3);
}

void ASDT::IOA2UserClient::GetUpdatedControlValue(unsigned int a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v2 = HIBYTE(a1);
  if ((a1 - 0x20000000) >> 24 >= 0x5F) {
    int v2 = 32;
  }
  int v3 = BYTE2(a1);
  if (BYTE2(a1) - 32 >= 0x5F) {
    int v3 = 32;
  }
  int v4 = BYTE1(a1);
  if (BYTE1(a1) - 32 >= 0x5F) {
    int v4 = 32;
  }
  v6[0] = 67110144;
  v6[1] = v2;
  int v5 = a1;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 1024;
  if (a1 - 32 >= 0x5F) {
    int v5 = 32;
  }
  int v12 = v5;
  __int16 v13 = 1024;
  unsigned int v14 = a1;
}

void ASDT::IOA2UserClient::ReplaceControlValue()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: ReplaceControlValue: No control with ID %x", v2, v3);
}

void ASDT::IOA2UserClient::GetUpdatedMultiControlValue()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_248A1B000, v0, v1, "IOA2UserClient: GetUpdatedMultiControlValue: Invalid arguments.", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::ReplaceMultiControlValue()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_248A1B000, v0, v1, "%s: ReplaceMultiControlValue: No control with ID %x", v2, v3);
}

void ASDT::IOA2UserClient::RefreshControlList()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: RefreshControlList: Failed to copy property", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::RefreshControlInfo()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: RefreshControlInfo: Failed to copy property", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::PerformConfigChange()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: PerformConfigChange failed", v2, v3, v4, v5, v6);
}

void ASDT::IOA2UserClient::MapEngineStatus()
{
  OUTLINED_FUNCTION_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_248A1B000, v0, v1, "%s: MapEngineStatus memory not large enough", v2, v3, v4, v5, v6);
}

void ASDT::UCObject::CopyProperties()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::CopyProperties: failed to get the properties from the IO Registry, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::UCObject::SetProperty()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::SetProperty: got an error from the IORegistry, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::UCObject::CacheProperties()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::CacheProperties: failed to get the properties from the IO Registry, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::UCObject::CopyMatchingObjectWithPropertyValue()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::CopyMatchingObjectWithPropertyValue: IOMainPort failed, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::UCObject::OpenConnection()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::OpenConnection: failed to open a connection, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::UCObject::SetConnectionNotificationPort()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::SetConnectionNotificationPort: Cannot set the connection's's notification port., Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::UCObject::MapMemory()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, " UCObject::MapMemory: mapped in a NULL pointer", v0, 2u);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " UCObject::MapMemory: failed to map in the memory, Error: 0x%X", v1, v2, v3, v4, v5);
}

void CADeprecated::CADispatchQueue::CADispatchQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CADeprecated::CADispatchQueue::~CADispatchQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CADeprecated::CADispatchQueue::InstallMachPortDeathNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1(&dword_248A1B000, MEMORY[0x263EF8438], a3, " CADispatchQueue::InstallMachPortDeathNotification: failed to create the mach port event source", a5, a6, a7, a8, 0);
}

void CADeprecated::CADispatchQueue::InstallMachPortReceiver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1(&dword_248A1B000, MEMORY[0x263EF8438], a3, " CADispatchQueue::InstallMachPortReceiver: failed to create the mach port event source", a5, a6, a7, a8, 0);
}

void ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, " CADispatchQueue::RemoveMachPortReceiver: deallocating the receive right failed, Error: 0x%X", (uint8_t *)v1, 8u);
}

void ___ZN12CADeprecated15CADispatchQueue22RemoveMachPortReceiverEjbb_block_invoke_cold_2(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, " CADispatchQueue::RemoveMachPortReceiver: deallocating the send right failed, Error: 0x%X", (uint8_t *)v1, 8u);
}

void CADeprecated::CADispatchQueue::GetGlobalSerialQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void getValueAndRangeFromControlDict()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_248A1B000, v0, v1, "%s: Missing range min from control dict: %@", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_248A1B000, v0, v1, "%s: Missing range max from control dict: %@", v2, v3, v4, v5, 2u);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_248A1B000, v0, v1, "%s: Missing value from control dict: %@", v2, v3, v4, v5, 2u);
}

void CADeprecated::CAMutex::CAMutex(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CADeprecated::CAMutex::Lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CADeprecated::CAMutex::Unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CADeprecated::CAMutex::Try(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, " CAMutex::Try: call to pthread_mutex_trylock failed, Error: %d (%s)", (uint8_t *)v2, 0x12u);
}

void CADeprecated::CAMutex::Unlocker::Unlocker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::IOA2UCDevice(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::operator=(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_248A1B000, MEMORY[0x263EF8438], a3, " IOA2UCDevice::operator=: this is not an IOAudio2Device", a5, a6, a7, a8, 0);
}

void ASDT::IOA2UCDevice::SetNominalSampleRate()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::SetNominalSampleRate: got an error when telling the hardware to change a control value, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::CopyHeadsetInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::SetClientDescription()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::SetClientDescription: got an error when telling the hardware to change client description, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_ID(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1(&dword_248A1B000, MEMORY[0x263EF8438], a3, " IOA2UCDevice::GetStreamInfoByIndex_CurrentFormat: there is no current format", a5, a6, a7, a8, 0);
}

void ASDT::IOA2UCDevice::CopyStreamInfoByIndex_AvailableFormats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStreamInfoByIndex_StartingChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_1(&dword_248A1B000, MEMORY[0x263EF8438], a3, " IOA2UCDevice::GetStreamInfoByID_CurrentFormat: there is no current format", a5, a6, a7, a8, 0);
}

void ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::MapIOBufferForStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::SetStreamActive()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::SetStreamActive: got an error when telling the hardware to turn a stream on or off, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::GetControlInfo_BaseClass(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetControlInfo_Class(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetControlInfo_Scope(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetControlInfo_Element(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetControlInfo_Value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetSliderControlInfo_MinimumValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetSliderControlInfo_MaximumValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::CopyLevelControlInfo_RangeMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::CopySelectorControlInfo_MultiSelectorValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::CopySelectorControlInfo_SelectorMap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_CenterValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_LeftChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::GetStereoPanControlInfo_RightChannel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::CopyBlockControlInfo_Descriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::MapBlockControlBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::MoveBlockControlData()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::MoveBlockControlData: got an error when telling the hardware to move the block control data, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::MapDataExchangeBlockBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ASDT::IOA2UCDevice::MoveDataExchangeBlockData()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::MoveDataExchangeBlockData: got an error when telling the hardware to move the block control data, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::StartIO()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::StartIO: got an error when telling the hardware to start, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::StartIOWithFlags()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::StartIOWithFlags: got an error when telling the hardware to start, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::StopIO()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::StopIO: got an error when telling the hardware to stop, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::StopIOWithFlags()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::StopIOWithFlags: got an error when telling the hardware to stop, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::SetStreamCurrentFormat()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::SetStreamCurrentFormat: got an error when telling the hardware to set the stream format, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::SetControlValue()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::SetControlValue: got an error when telling the hardware to change a control value, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::SetMultiControlValue()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " HAL_IOA2PhysicalDevice::SetMultiControlValue: got an error when telling the hardware to change a multi control value, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::PerformConfigChange()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_248A1B000, MEMORY[0x263EF8438], v0, " IOA2UCDevice::PerformConfigChange: got an error from the call down to the driver, Error: 0x%X", v1, v2, v3, v4, v5);
}

void ASDT::IOA2UCDevice::MapEngineStatus(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t ASDTBaseLogType()
{
  return MEMORY[0x270F0F980]();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
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

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F58](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x270EF3F78](*(void *)&connect, *(void *)&type, *(void *)&port, reference);
}

kern_return_t IOConnectTrap0(io_connect_t connect, uint32_t index)
{
  return MEMORY[0x270EF3F80](*(void *)&connect, *(void *)&index);
}

kern_return_t IOConnectTrap6(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3, uintptr_t p4, uintptr_t p5, uintptr_t p6)
{
  return MEMORY[0x270EF3FB0](*(void *)&connect, *(void *)&index, p1, p2, p3, p4, p5, p6);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FC0](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return MEMORY[0x270EF4800](*(void *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x270EF4818](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF4A20](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF4A60](*(void *)&entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CACFString::GetCString(CACFString *this, const __CFString *a2, char *a3, unsigned int *a4)
{
  return MEMORY[0x270F0F988](this, a2, a3, a4);
}

uint64_t CACFDictionary::AddArray(CACFDictionary *this, const __CFString *a2, const __CFArray *a3)
{
  return MEMORY[0x270F0F990](this, a2, a3);
}

uint64_t CACFDictionary::AddSInt32(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x270F0F998](this, a2);
}

uint64_t CACFDictionary::AddUInt32(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x270F0F9A0](this, a2);
}

uint64_t CACFDictionary::AddUInt64(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x270F0F9A8](this, a2);
}

uint64_t CAAudioValueRange::PickCommonSampleRate(CAAudioValueRange *this, const AudioValueRange *a2)
{
  return MEMORY[0x270F0F9B0](this, a2);
}

uint64_t CAStreamBasicDescription::IsEquivalent(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  return MEMORY[0x270F0F9B8](this, a2, a3);
}

uint64_t ASDT::ValueRange::PickCommonSampleRate(ASDT::ValueRange *this, const AudioValueRange *a2)
{
  return MEMORY[0x270F0F9C0](this, a2);
}

uint64_t ASDT::VolumeCurve::ResetRange(ASDT::VolumeCurve *this)
{
  return MEMORY[0x270F0F9C8](this);
}

uint64_t ASDT::VolumeCurve::SetTransferFunction(ASDT::VolumeCurve *this)
{
  return MEMORY[0x270F0F9D0](this);
}

uint64_t ASDT::VolumeCurve::AddRange(ASDT::VolumeCurve *this, float a2, float a3)
{
  return MEMORY[0x270F0F9D8](this, a2, a3);
}

uint64_t ASDT::VolumeCurve::VolumeCurve(ASDT::VolumeCurve *this)
{
  return MEMORY[0x270F0F9E0](this);
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2)
{
  return MEMORY[0x270F0F9F0](this, a2);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::DictionaryRef *a3)
{
  return MEMORY[0x270F0F9F8](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::DataRef *a3)
{
  return MEMORY[0x270F0FA00](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::ArrayRef *a3)
{
  return MEMORY[0x270F0FA08](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::StringRef *a3)
{
  return MEMORY[0x270F0FA10](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, BOOL *a3)
{
  return MEMORY[0x270F0FA18](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, int *a3)
{
  return MEMORY[0x270F0FA20](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, unsigned int *a3)
{
  return MEMORY[0x270F0FA28](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, uint64_t *a3)
{
  return MEMORY[0x270F0FA30](this, a2, a3);
}

uint64_t ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, uint64_t a2, const applesauce::CF::StringRef *a3, applesauce::CF::TypeRef *a4)
{
  return MEMORY[0x270F0FA38](this, a2, a3, a4);
}

uint64_t ASDT::IOUserClient::ReleaseMemory(ASDT::IOUserClient *this, void *a2)
{
  return MEMORY[0x270F0FA40](this, a2);
}

uint64_t ASDT::IOUserClient::OpenConnection(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA48](this);
}

uint64_t ASDT::IOUserClient::ReplaceProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, const applesauce::CF::ArrayRef *a3)
{
  return MEMORY[0x270F0FA50](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ArraySetValueAtIndex()
{
  return MEMORY[0x270F0FA58]();
}

uint64_t ASDT::IOUserClient::DictionarySetValueForKey()
{
  return MEMORY[0x270F0FA68]();
}

uint64_t ASDT::IOUserClient::SetConnectionNotification()
{
  return MEMORY[0x270F0FA70]();
}

uint64_t ASDT::IOUserClient::GetConnectionNotificationPort(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA78](this);
}

uint64_t ASDT::IOUserClient::SetTerminationNotificationEnabled(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA88](this);
}

uint64_t ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA90](this);
}

uint64_t ASDT::IOUserClient::MapMemory(ASDT::IOUserClient *this, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x270F0FA98](this, a2, a3, a4);
}

uint64_t ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  return MEMORY[0x270F0FAA8](this, a2);
}

uint64_t ASDT::IOUserClient::IOUserClient(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FAB0](this);
}

void ASDT::IOUserClient::~IOUserClient(ASDT::IOUserClient *this)
{
}

uint64_t ASDT::IOUserClient::operator=()
{
  return MEMORY[0x270F0FAC8]();
}

uint64_t ASDT::Exclaves::AudioBuffer::Read()
{
  return MEMORY[0x270F0FAD0]();
}

uint64_t ASDT::Exclaves::StatusTracker::Push()
{
  return MEMORY[0x270F0FAD8]();
}

uint64_t ASDT::IOAudio2::Helpers::Fixed64FromFloat64(ASDT::IOAudio2::Helpers *this, double a2)
{
  return MEMORY[0x270F0FAE0](this, a2);
}

uint64_t ASDT::IOAudio2::Helpers::Float64FromFixed64(ASDT::IOAudio2::Helpers *this)
{
  return MEMORY[0x270F0FAE8](this);
}

uint64_t ASDT::MachPort::CreatePort(ASDT::MachPort *this)
{
  return MEMORY[0x270F0FB00](this);
}

uint64_t caulk::platform::process_name(caulk::platform *this)
{
  return MEMORY[0x270F87BF0](this);
}

uint64_t ASDTTime::machAbsoluteTime(ASDTTime *this)
{
  return MEMORY[0x270F0FB08](this);
}

uint64_t CACFArray::AppendUInt32(CACFArray *this)
{
  return MEMORY[0x270F0FB10](this);
}

uint64_t CACFArray::SetDictionary(CACFArray *this, uint64_t a2, const __CFDictionary *a3)
{
  return MEMORY[0x270F0FB18](this, a2, a3);
}

uint64_t CACFArray::AppendDictionary(CACFArray *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F0FB20](this, a2);
}

uint64_t CAProcess::ProcessExists(CAProcess *this)
{
  return MEMORY[0x270F0FB28](this);
}

uint64_t CAProcess::GetPID(CAProcess *this)
{
  return MEMORY[0x270F0FB30](this);
}

uint64_t CACFNumber::GetFixed32(CACFNumber *this)
{
  return MEMORY[0x270F0FB38](this);
}

uint64_t CACFNumber::GetFixed64(CACFNumber *this)
{
  return MEMORY[0x270F0FB40](this);
}

uint64_t CACFDictionary::GetFixed64(CACFDictionary *this, const __CFString *a2, double *a3)
{
  return MEMORY[0x270F0FB48](this, a2, a3);
}

uint64_t CACFDictionary::GetCACFArray(CACFDictionary *this, const __CFString *a2, CACFArray *a3)
{
  return MEMORY[0x270F0FB50](this, a2, a3);
}

uint64_t CACFDictionary::GetDictionary(CACFDictionary *this, const __CFString *a2, const __CFDictionary **a3)
{
  return MEMORY[0x270F0FB58](this, a2, a3);
}

uint64_t CACFDictionary::HasKey(CACFDictionary *this, const __CFString *a2)
{
  return MEMORY[0x270F0FB60](this, a2);
}

uint64_t CACFDictionary::GetBool(CACFDictionary *this, const __CFString *a2, BOOL *a3)
{
  return MEMORY[0x270F0FB68](this, a2, a3);
}

uint64_t CACFDictionary::GetArray(CACFDictionary *this, const __CFString *a2, const __CFArray **a3)
{
  return MEMORY[0x270F0FB70](this, a2, a3);
}

uint64_t CACFDictionary::GetCFType(CACFDictionary *this, const __CFString *a2, const void **a3)
{
  return MEMORY[0x270F0FB78](this, a2, a3);
}

uint64_t CACFDictionary::GetSInt32(CACFDictionary *this, const __CFString *a2, int *a3)
{
  return MEMORY[0x270F0FB80](this, a2, a3);
}

uint64_t CACFDictionary::GetString(CACFDictionary *this, const __CFString *a2, const __CFString **a3)
{
  return MEMORY[0x270F0FB88](this, a2, a3);
}

uint64_t CACFDictionary::GetUInt32(CACFDictionary *this, const __CFString *a2, unsigned int *a3)
{
  return MEMORY[0x270F0FB90](this, a2, a3);
}

uint64_t CACFDictionary::GetUInt64(CACFDictionary *this, const __CFString *a2, unint64_t *a3)
{
  return MEMORY[0x270F0FB98](this, a2, a3);
}

uint64_t ASDT::VolumeCurve::GetMaximumDB(ASDT::VolumeCurve *this)
{
  return MEMORY[0x270F0FBA0](this);
}

uint64_t ASDT::VolumeCurve::GetMinimumDB(ASDT::VolumeCurve *this)
{
  return MEMORY[0x270F0FBA8](this);
}

uint64_t ASDT::VolumeCurve::ConvertDBToRaw(ASDT::VolumeCurve *this, float a2)
{
  return MEMORY[0x270F0FBB0](this, a2);
}

uint64_t ASDT::VolumeCurve::ConvertRawToDB(ASDT::VolumeCurve *this)
{
  return MEMORY[0x270F0FBB8](this);
}

uint64_t ASDT::VolumeCurve::ConvertScalarToDB(ASDT::VolumeCurve *this, float a2)
{
  return MEMORY[0x270F0FBC0](this, a2);
}

uint64_t ASDT::IOUserClient::CallMethod(ASDT::IOUserClient *this, uint64_t a2, const unint64_t *a3, uint64_t a4, const void *a5, uint64_t a6, unint64_t *a7, unsigned int *a8, void *a9, unint64_t *a10)
{
  return MEMORY[0x270F0FBC8](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ASDT::IOUserClient::ConformsTo(ASDT::IOUserClient *this, const char *a2)
{
  return MEMORY[0x270F0FBD0](this, a2);
}

uint64_t ASDT::IOUserClient::SharedLock(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FBD8](this);
}

uint64_t ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, applesauce::CF::TypeRef *a3)
{
  return MEMORY[0x270F0FBE0](this, a2, a3);
}

uint64_t ASDT::IOUserClient::IsServiceAlive(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FBF0](this);
}

uint64_t ASDT::IOUserClient::GetConnectionRefCount(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FBF8](this);
}

uint64_t ASDT::IOUserClient::GetUserClientRefCount(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FC00](this);
}

uint64_t ASDT::IOUserClient::CallTrap6(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FC20](this);
}

uint64_t CACFArray::GetDictionary(CACFArray *this, uint64_t a2, const __CFDictionary **a3)
{
  return MEMORY[0x270F0FC28](this, a2, a3);
}

uint64_t CACFArray::GetCACFDictionary(CACFArray *this, uint64_t a2, CACFDictionary *a3)
{
  return MEMORY[0x270F0FC30](this, a2, a3);
}

uint64_t CACFArray::GetUInt32(CACFArray *this, uint64_t a2, unsigned int *a3)
{
  return MEMORY[0x270F0FC38](this, a2, a3);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return (std::recursive_mutex *)MEMORY[0x270F98900](this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_mutex_base::lock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock_shared(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::lock(std::__shared_mutex_base *this)
{
}

void std::__shared_mutex_base::unlock(std::__shared_mutex_base *this)
{
}

std::__shared_mutex_base *__cdecl std::__shared_mutex_base::__shared_mutex_base(std::__shared_mutex_base *this)
{
  return (std::__shared_mutex_base *)MEMORY[0x270F989D8](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x270F98BF0]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
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

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
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

uint64_t asdtPowerStateCompare()
{
  return MEMORY[0x270F0FC40]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_after_f(dispatch_time_t when, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x270EDAEB0](a1, a2);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}