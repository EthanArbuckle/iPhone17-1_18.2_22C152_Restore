void sub_248A69BE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_248A69DEC(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_248A6A008(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A6A154(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void sub_248A6A1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ASDTIOPAudioVTDevice;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_248A6A5B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);

  _Unwind_Resume(a1);
}

void sub_248A6A650(_Unwind_Exception *a1)
{
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
      MEMORY[0x24C5890D0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_248A6A7A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

ASDT::IOPAudio::VoiceTrigger::UserClient *ASDT::IOPAudio::VoiceTrigger::UserClient::UserClient(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  uint64_t v2 = ASDT::IOUserClient::IOUserClient(this);
  *(void *)uint64_t v2 = &unk_26FCB2578;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v2 + 376));
  *((unsigned char *)this + 544) = 0;
  *((void *)this + 69) = 0;
  return this;
}

void sub_248A6A828(_Unwind_Exception *a1)
{
  ASDT::IOUserClient::~IOUserClient(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_248A6AAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::IsolatedIOBuffer::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"identifier", 10, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    uint64_t v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier();
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A6ADC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
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

void sub_248A6AE6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, const AudioStreamBasicDescription *a2, unsigned int a3)
{
  unint64_t v8 = a3;
  ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionToIOAudio2();
  int v4 = ASDT::IOUserClient::CallMethod(this, 0, &v8, 1, v7, 40, 0, 0, 0, 0);
  if (v4)
  {
    uint64_t v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription();
    }
  }
  return v4 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, AudioStreamBasicDescription *a2)
{
  unint64_t v5 = 40;
  if (ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, v6, &v5))
  {
    uint64_t v2 = ASDTIOPLogType();
    BOOL result = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription();
    return 0;
  }
  if (v5 <= 0x27)
  {
    int v4 = ASDTIOPLogType();
    BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription();
    return 0;
  }
  ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionFromIOAudio2();
  return 1;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallMethod(this, 2, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1)
  {
    uint64_t v2 = ASDTIOPLogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO();
    }
  }
  return v1 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallMethod(this, 3, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1)
  {
    uint64_t v2 = ASDTIOPLogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO();
    }
  }
  return v1 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, unint64_t a2, unsigned int a3)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = a2;
  v6[1] = a3;
  int v3 = ASDT::IOUserClient::CallMethod(this, 4, v6, 2, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    int v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO();
    }
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this, unint64_t a2)
{
  unint64_t v5 = a2;
  int v2 = ASDT::IOUserClient::CallMethod(this, 5, &v5, 1, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO();
    }
  }
  return v2 == 0;
}

BOOL ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallTrap3(this);
  if (v1)
  {
    int v2 = ASDTIOPLogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput();
    }
  }
  return v1 == 0;
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  int v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void OUTLINED_FUNCTION_0_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::LPMic::UserClient::CopyIdentifier(ASDT::IOPAudio::LPMic::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"identifier", 10, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    unint64_t v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier();
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A6C098(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

CFStringRef *applesauce::CF::StringRef::StringRef(CFStringRef *a1, const UInt8 *a2, CFIndex a3)
{
  if (a2)
  {
    CFStringRef v4 = CFStringCreateWithBytes(0, a2, a3, 0x8000100u, 0);
    *a1 = v4;
    if (!v4)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5890D0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  else
  {
    *a1 = 0;
  }
  return a1;
}

void sub_248A6C164(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription(ASDT::IOPAudio::LPMic::UserClient *this, StreamDescription *a2)
{
  CFTypeRef v26 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"input stream description", 24, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v26);
  if (cf) {
    CFRelease(cf);
  }
  if (v26) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    v14 = ASDTIOPLogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription();
    }
    goto LABEL_35;
  }
  *(_OWORD *)&a2->var0 = 0u;
  *(_OWORD *)&a2->var3 = 0u;
  *(_OWORD *)&a2->var7 = 0u;
  a2->var1 = 1819304813;
  a2->var4 = 1;
  CFTypeRef cf = &v26;
  CFTypeRef v24 = CFStringCreateWithBytes(0, (const UInt8 *)"sample rate", 11, 0x8000100u, 0);
  if (!v24)
  {
    v17 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v17, "Could not construct");
    __cxa_throw(v17, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFDictionaryRef v6 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24);
  if (v24) {
    CFRelease(v24);
  }
  if (((unint64_t)v6 & 0xFF00000000) == 0) {
    goto LABEL_35;
  }
  a2->var0 = (double)v6;
  if (!v26)
  {
    v18 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v18, "Could not construct");
    __cxa_throw(v18, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeRef cf = &v26;
  CFTypeRef v24 = CFStringCreateWithBytes(0, (const UInt8 *)"format flags", 12, 0x8000100u, 0);
  if (!v24)
  {
    v19 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v19, "Could not construct");
    __cxa_throw(v19, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFDictionaryRef v7 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24);
  if (v24) {
    CFRelease(v24);
  }
  if (((unint64_t)v7 & 0xFF00000000) == 0) {
    goto LABEL_35;
  }
  a2->var2 = v7 & 0x1F;
  if (!v26)
  {
    v20 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v20, "Could not construct");
    __cxa_throw(v20, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeRef cf = &v26;
  CFTypeRef v24 = CFStringCreateWithBytes(0, (const UInt8 *)"channels per frame", 18, 0x8000100u, 0);
  if (!v24)
  {
    v21 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v21, "Could not construct");
    __cxa_throw(v21, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFDictionaryRef v8 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24);
  if (v24) {
    CFRelease(v24);
  }
  if (((unint64_t)v8 & 0xFF00000000) == 0) {
    goto LABEL_35;
  }
  a2->var6 = v8;
  if (!v26)
  {
    v22 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v22, "Could not construct");
    __cxa_throw(v22, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeRef cf = &v26;
  CFTypeRef v24 = CFStringCreateWithBytes(0, (const UInt8 *)"bits per channel", 16, 0x8000100u, 0);
  if (!v24)
  {
    v23 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](v23, "Could not construct");
    __cxa_throw(v23, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFDictionaryRef v9 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24);
  if (v24) {
    CFRelease(v24);
  }
  if (((unint64_t)v9 & 0xFF00000000) == 0
    || (a2->var7 = v9,
        CFTypeRef cf = applesauce::CF::DictionaryRef::operator->(&v26),
        applesauce::CF::StringRef::StringRef((CFStringRef *)&v24, (const UInt8 *)"bytes per frame", 15),
        CFDictionaryRef v10 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24), applesauce::CF::StringRef::~StringRef(&v24), ((unint64_t)v10 & 0xFF00000000) == 0))
  {
LABEL_35:
    uint64_t v13 = 0;
    goto LABEL_36;
  }
  a2->var5 = v10;
  a2->var3 = a2->var4 * v10;
  CFTypeRef cf = applesauce::CF::DictionaryRef::operator->(&v26);
  applesauce::CF::StringRef::StringRef((CFStringRef *)&v24, (const UInt8 *)"latency in frames", 17);
  CFDictionaryRef v11 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24);
  applesauce::CF::StringRef::~StringRef(&v24);
  if (((unint64_t)v11 & 0xFF00000000) != 0) {
    a2->var9 = v11;
  }
  CFTypeRef cf = applesauce::CF::DictionaryRef::operator->(&v26);
  applesauce::CF::StringRef::StringRef((CFStringRef *)&v24, (const UInt8 *)"driver safety offset in frames", 30);
  CFDictionaryRef v12 = applesauce::CF::DictionaryRef_proxy::at_as<unsigned int,applesauce::CF::StringRef>((const __CFDictionary ***)&cf, &v24);
  applesauce::CF::StringRef::~StringRef(&v24);
  if (((unint64_t)v12 & 0xFF00000000) != 0) {
    a2->var10 = v12;
  }
  uint64_t v13 = 1;
LABEL_36:
  if (v26) {
    CFRelease(v26);
  }
  return v13;
}

void sub_248A6C6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf, CFTypeRef a11, const void *a12)
{
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

void sub_248A6C850(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
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

void sub_248A6C89C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_248A6C8BC(_Unwind_Exception *a1)
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

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetClockDomain(ASDT::IOPAudio::LPMic::UserClient *this)
{
  unsigned int v7 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"clock domain", 12, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v2 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf) {
    CFRelease(cf);
  }
  if (v2) {
    return v7;
  }
  char v4 = ASDTIOPLogType();
  uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetClockDomain();
    return 0;
  }
  return result;
}

void sub_248A6C9EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
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

void sub_248A6CA78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval(ASDT::IOPAudio::LPMic::UserClient *this)
{
  unsigned int v7 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"zero timestamp wrap frames", 26, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v2 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf) {
    CFRelease(cf);
  }
  if (v2) {
    return v7;
  }
  char v4 = ASDTIOPLogType();
  uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval();
    return 0;
  }
  return result;
}

void sub_248A6CB6C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize(ASDT::IOPAudio::LPMic::UserClient *this)
{
  unsigned int v7 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"io buffer frame size", 20, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v2 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf) {
    CFRelease(cf);
  }
  if (v2) {
    return v7;
  }
  char v4 = ASDTIOPLogType();
  uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize();
    return 0;
  }
  return result;
}

void sub_248A6CC74(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported(ASDT::IOPAudio::LPMic::UserClient *this)
{
  char v7 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"historic data supported", 23, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v2 = ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v7);
  if (cf) {
    CFRelease(cf);
  }
  if (v2) {
    return v7 != 0;
  }
  char v4 = ASDTIOPLogType();
  BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported();
    return 0;
  }
  return result;
}

void sub_248A6CD84(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
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

void sub_248A6CE10(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::TypeRef::~TypeRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::StartIO(ASDT::IOPAudio::LPMic::UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1)
  {
    char v2 = ASDTIOPLogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::LPMic::UserClient::StartIO();
    }
  }
  return v1 == 0;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::StopIO(ASDT::IOPAudio::LPMic::UserClient *this)
{
  int v1 = ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v1)
  {
    char v2 = ASDTIOPLogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::LPMic::UserClient::StopIO();
    }
  }
  return v1 == 0;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetControlValue(ASDT::IOUserClient *a1, unsigned int a2, _DWORD *a3)
{
  unint64_t v9 = a2;
  unint64_t v8 = 0;
  unsigned int v7 = 1;
  if (ASDT::IOUserClient::CallMethod(a1, 2, &v9, 1, 0, 0, &v8, &v7, 0, 0))
  {
    char v4 = ASDTIOPLogType();
    BOOL result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ASDT::IOPAudio::LPMic::UserClient::GetControlValue();
    return 0;
  }
  if (v7 == 1)
  {
    *a3 = v8;
    return 1;
  }
  CFDictionaryRef v6 = ASDTIOPLogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::GetControlValue();
    return 0;
  }
  return result;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::SetControlValue(ASDT::IOUserClient *a1, unsigned int a2, unsigned int a3)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = a2;
  v6[1] = a3;
  int v3 = ASDT::IOUserClient::CallMethod(a1, 3, v6, 2, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    char v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::LPMic::UserClient::SetControlValue();
    }
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::LPMic::UserClient::SetSampleRate(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::SetControlValue(this, 0x53724368u, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetSupportedChannelMask(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int *a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::GetControlValue(this, 0x5375436Du, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::GetEnabledChannelMask(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int *a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::GetControlValue(this, 0x456E436Du, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::SetEnabledChannelMask(ASDT::IOPAudio::LPMic::UserClient *this, unsigned int a2)
{
  return ASDT::IOPAudio::LPMic::UserClient::SetControlValue(this, 0x456E436Du, a2);
}

BOOL ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus(ASDT::IOPAudio::LPMic::UserClient *this, ASDT::IOPAudio::LPMic::EngineStatus **a2)
{
  unsigned int v7 = 0;
  int v3 = (ASDT::IOPAudio::LPMic::EngineStatus *)ASDT::IOUserClient::MapMemory(this, 1098208116, 1, &v7);
  if (!v3)
  {
    uint64_t v5 = ASDTIOPLogType();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus();
    return 0;
  }
  if (v7 == 32)
  {
    *a2 = v3;
    return 1;
  }
  CFDictionaryRef v6 = ASDTIOPLogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus();
    return 0;
  }
  return result;
}

uint64_t ASDT::IOPAudio::LPMic::EngineStatus::Snapshot@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2 = *(void *)(this + 8);
  unint64_t v3 = *(void *)(this + 16);
  uint64_t v4 = *(void *)(this + 24);
  do
  {
    do
    {
      long long v5 = *(_OWORD *)(this + 16);
      *(_OWORD *)a2 = *(_OWORD *)this;
      *(_OWORD *)(a2 + 16) = v5;
    }
    while (*(_OWORD *)(a2 + 8) != __PAIR128__(v3, v2));
  }
  while (*(void *)(a2 + 24) != v4);
  return this;
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
}

const __CFDictionary *applesauce::CF::details::at_key<applesauce::CF::StringRef>(const __CFDictionary *result, const void **a2)
{
  if (result)
  {
    unint64_t v2 = *a2;
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

void sub_248A6DC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A6DE6C(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_248A6DFC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::IOBuffer::UserClient::~UserClient(ASDT::IOPAudio::IOBuffer::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x24C589180);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::UserClient(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = ASDT::IOUserClient::IOUserClient();
  *(void *)uint64_t v4 = &unk_26FCB2578;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)(v4 + 376));
  *(unsigned char *)(a1 + 544) = 0;
  *(unsigned char *)(a1 + 544) = *(unsigned char *)(a2 + 544);
  *(void *)(a1 + 552) = *(void *)(a2 + 552);
  *(unsigned char *)(a2 + 544) = 0;
  *(void *)(a2 + 552) = 0;
  return a1;
}

void sub_248A6E238(_Unwind_Exception *a1)
{
  ASDT::IOUserClient::~IOUserClient(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::MoveDataMembers(uint64_t this, UserClient *a2)
{
  *(unsigned char *)(this + 544) = *((unsigned char *)a2 + 544);
  *(void *)(this + 552) = *((void *)a2 + 69);
  *((unsigned char *)a2 + 544) = 0;
  *((void *)a2 + 69) = 0;
  return this;
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::~UserClient(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  *(void *)this = &unk_26FCB2578;
  CFNumberRef v2 = (const void *)*((void *)this + 69);
  if (v2) {
    _Block_release(v2);
  }
  ASDT::IOPAudio::VoiceTrigger::UserClient::Close(this);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 488));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)this + 440));
  std::mutex::~mutex((std::mutex *)((char *)this + 376));
  ASDT::IOUserClient::~IOUserClient(this);
}

{
  uint64_t vars8;

  ASDT::IOPAudio::VoiceTrigger::UserClient::~UserClient(this);
  JUMPOUT(0x24C589180);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::Close(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  uint64_t v4 = (char *)this + 376;
  char v5 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 376));
  if (*((unsigned char *)this + 544))
  {
    if (ASDT::IOUserClient::CallMethod(this, 1, 0, 0, 0, 0, 0, 0, 0, 0))
    {
      CFNumberRef v2 = ASDTIOPLogType();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        ASDT::IOPAudio::VoiceTrigger::UserClient::Close();
      }
    }
    *((unsigned char *)this + 544) = 0;
  }
  return std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v4);
}

void sub_248A6E390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::operator=(uint64_t a1, uint64_t a2)
{
  ASDT::IOUserClient::operator=();
  *(unsigned char *)(a1 + 544) = *(unsigned char *)(a2 + 544);
  *(void *)(a1 + 552) = *(void *)(a2 + 552);
  *(unsigned char *)(a2 + 544) = 0;
  *(void *)(a2 + 552) = 0;
  return a1;
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::VTExclusiveLock(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, uint64_t a2@<X8>)
{
  CFNumberRef v2 = (std::__shared_mutex_base *)((char *)this + 376);
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock(v2);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::VTSharedLock(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, uint64_t a2@<X8>)
{
  CFNumberRef v2 = (std::__shared_mutex_base *)((char *)this + 376);
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = 1;
  std::__shared_mutex_base::lock_shared(v2);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"identifier", 10, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    char v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier();
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A6E57C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  unsigned __int8 v10 = 0;
  int v9 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"VTConfigured", 12, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    goto LABEL_17;
  }
  int v2 = ASDT::IOUserClient::CopyProperty<BOOL>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v10);
  if (cf) {
    CFRelease(cf);
  }
  if (v2)
  {
    int v3 = v10;
    return v3 != 0;
  }
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"VTConfigured", 12, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
LABEL_17:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<unsigned int>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v9);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    int v3 = v9;
    return v3 != 0;
  }
  uint64_t v6 = ASDTIOPLogType();
  BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (result)
  {
    ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured();
    return 0;
  }
  return result;
}

void sub_248A6E718(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"VTConfiguration", 15, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    char v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo();
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A6E850(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::SetConfigurationInfo(ASDT::IOPAudio::VoiceTrigger::UserClient *this, const applesauce::CF::DictionaryRef *a2)
{
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"VTConfiguration", 15, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v4 = ASDT::IOUserClient::SetProperty(this, (const applesauce::CF::StringRef *)&cf, a2);
  if (cf) {
    CFRelease(cf);
  }
  return v4;
}

void sub_248A6E940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyEventInfo(ASDT::IOPAudio::VoiceTrigger::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"VTEventInfo", 11, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    char v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo();
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A6EA6C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::Open(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  char v5 = (char *)this + 376;
  uint64_t v2 = 1;
  char v6 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)((char *)this + 376));
  if (!*((unsigned char *)this + 544))
  {
    if (ASDT::IOUserClient::CallMethod(this, 0, 0, 0, 0, 0, 0, 0, 0, 0))
    {
      int v3 = ASDTIOPLogType();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        ASDT::IOPAudio::VoiceTrigger::UserClient::Open();
      }
      uint64_t v2 = 0;
    }
    else
    {
      *((unsigned char *)this + 544) = 1;
    }
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v5);
  return v2;
}

void sub_248A6EB58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(ASDT::IOUserClient *a1, unsigned int a2, _DWORD *a3)
{
  unint64_t v8 = 0;
  unint64_t v9 = a2;
  unsigned int v7 = 1;
  int v4 = ASDT::IOUserClient::CallMethod(a1, 2, &v9, 1, 0, 0, &v8, &v7, 0, 0);
  if (v4)
  {
    char v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::LPMic::UserClient::GetControlValue();
    }
  }
  else
  {
    *a3 = v8;
  }
  return v4 == 0;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::SetControlValue(ASDT::IOUserClient *a1, unsigned int a2, unsigned int a3)
{
  v6[2] = *MEMORY[0x263EF8340];
  v6[0] = a2;
  v6[1] = a3;
  int v3 = ASDT::IOUserClient::CallMethod(a1, 3, v6, 2, 0, 0, 0, 0, 0, 0);
  if (v3)
  {
    int v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::LPMic::UserClient::SetControlValue();
    }
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  int v6 = 0;
  Controlint Value = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 0, &v6);
  if (ControlValue)
  {
    *a2 = v6 != 0;
  }
  else
  {
    int v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled();
    }
  }
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, int a2)
{
  BOOL v2 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetControlValue(this, 0, a2 != 0);
  if (!v2)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled();
    }
  }
  return v2;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  Controlint Value = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 1u, a2);
  if (!ControlValue)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask();
    }
  }
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  Controlint Value = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 2u, a2);
  if (!ControlValue)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC();
    }
  }
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, unsigned int *a2)
{
  int v6 = 0;
  Controlint Value = ASDT::IOPAudio::VoiceTrigger::UserClient::GetControlValue(this, 3u, &v6);
  if (ControlValue)
  {
    *a2 = v6 != 0;
  }
  else
  {
    int v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled();
    }
  }
  return ControlValue;
}

BOOL ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled(ASDT::IOPAudio::VoiceTrigger::UserClient *this, int a2)
{
  BOOL v2 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetControlValue(this, 3u, a2 != 0);
  if (!v2)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled();
    }
  }
  return v2;
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::SetPhraseDetectEventBlock(uint64_t a1, const void *a2)
{
  uint64_t v9 = a1 + 376;
  char v10 = 1;
  std::__shared_mutex_base::lock((std::__shared_mutex_base *)(a1 + 376));
  int v4 = *(const void **)(a1 + 552);
  if (v4) {
    _Block_release(v4);
  }
  if (a2) {
    char v5 = _Block_copy(a2);
  }
  else {
    char v5 = 0;
  }
  *(void *)(a1 + 552) = v5;
  ASDT::IOUserClient::ExclusiveLock(v8, (ASDT::IOUserClient *)a1);
  (*(void (**)(uint64_t))(*(void *)a1 + 48))(a1);
  uint64_t v6 = ASDT::IOUserClient::SetInterestNotificationEnabled((ASDT::IOUserClient *)a1);
  if ((v6 & 1) == 0)
  {
    _Block_release(*(const void **)(a1 + 552));
    *(void *)(a1 + 552) = 0;
  }
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v8);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)&v9);
  return v6;
}

void sub_248A6F048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::ShouldEnableInterestNotification(ASDT::IOPAudio::VoiceTrigger::UserClient *this)
{
  if (*((void *)this + 69)) {
    return 1;
  }
  else {
    return MEMORY[0x270F0FC08]();
  }
}

uint64_t ASDT::IOPAudio::VoiceTrigger::UserClient::InterestNotification(ASDT::IOPAudio::VoiceTrigger::UserClient *this, int a2, void *a3)
{
  if (a2 == -469794559)
  {
    unsigned int v7 = (char *)this + 376;
    char v8 = 1;
    std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)((char *)this + 376));
    uint64_t v5 = *((void *)this + 69);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
    }
    return std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v7);
  }
  else
  {
    return MEMORY[0x270F0FA60]();
  }
}

void sub_248A6F110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

uint64_t std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::__shared_mutex_base::unlock_shared(*(std::__shared_mutex_base **)a1);
  }
  return a1;
}

uint64_t ASDT::IOPAudio::IOBuffer::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier(ASDT::IOPAudio::IOBuffer::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"identifier", 10, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    uint64_t v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier((uint64_t)this, v5);
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A6F7FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer(ASDT::IOPAudio::IOBuffer::UserClient *this, BufferDescriptor *a2)
{
  unsigned int v8 = 0;
  char v4 = (char *)ASDT::IOUserClient::MapMemory(this, 1768907381, 1, &v8);
  uint64_t v5 = v4;
  if (v4)
  {
    a2->mBuffer = v4;
    a2->mSizeBytes = v8;
  }
  else
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer((uint64_t)this, v6);
    }
  }
  return v5 != 0;
}

uint64_t ASDT::IOPAudio::ClientManager::UserClient::operator=(uint64_t a1)
{
  ASDT::IOUserClient::operator=();
  return a1;
}

void ASDT::IOPAudio::ClientManager::UserClient::CopyIdentifier(ASDT::IOPAudio::ClientManager::UserClient *this@<X0>, CFTypeRef *a2@<X8>)
{
  CFTypeRef v8 = 0;
  CFTypeRef cf = CFStringCreateWithBytes(0, (const UInt8 *)"identifier", 10, 0x8000100u, 0);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5890D0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v4 = ASDT::IOUserClient::CopyProperty<applesauce::CF::StringRef>(this, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v8);
  if (cf) {
    CFRelease(cf);
  }
  if (v4)
  {
    *a2 = v8;
  }
  else
  {
    uint64_t v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier();
    }
    *a2 = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
}

void sub_248A700D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::Enable(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2)
{
  unint64_t v5 = a2;
  int v2 = ASDT::IOUserClient::CallMethod(this, 0, &v5, 1, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::Enable();
    }
  }
  return v2 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::Disable(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2)
{
  unint64_t v5 = a2;
  int v2 = ASDT::IOUserClient::CallMethod(this, 1, &v5, 1, 0, 0, 0, 0, 0, 0);
  if (v2)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::Enable();
    }
  }
  return v2 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::GetEnableState(ASDT::IOPAudio::ClientManager::UserClient *this, BOOL *a2)
{
  unint64_t v7 = 0;
  unsigned int v6 = 1;
  int v3 = ASDT::IOUserClient::CallMethod(this, 2, 0, 0, 0, 0, &v7, &v6, 0, 0);
  if (v3)
  {
    char v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::GetEnableState();
    }
  }
  else
  {
    *a2 = v7 != 0;
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::GetCurrentPowerState(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int *a2)
{
  unint64_t v7 = 0;
  unsigned int v6 = 1;
  int v3 = ASDT::IOUserClient::CallMethod(this, 4, 0, 0, 0, 0, &v7, &v6, 0, 0);
  if (v3)
  {
    char v4 = ASDTIOPLogType();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::GetEnableState();
    }
  }
  else
  {
    *a2 = v7;
  }
  return v3 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::MakePowerRequest(ASDT::IOUserClient *a1, void *a2)
{
  int v2 = ASDT::IOUserClient::CallMethod(a1, 3, 0, 0, a2, 8, 0, 0, 0, 0);
  if (v2)
  {
    int v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::Enable();
    }
  }
  return v2 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2, unsigned int *a3, void *a4)
{
  unint64_t v8 = *a3;
  unint64_t v9 = a2;
  int v5 = ASDT::IOUserClient::CallMethod(this, 6, &v9, 1, 0, 0, 0, 0, a4, &v8);
  if (v5)
  {
    unsigned int v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty();
    }
  }
  else
  {
    *a3 = v8;
  }
  return v5 == 0;
}

BOOL ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty(ASDT::IOPAudio::ClientManager::UserClient *this, unsigned int a2, unsigned int a3, const void *a4)
{
  unint64_t v7 = a2;
  int v4 = ASDT::IOUserClient::CallMethod(this, 5, &v7, 1, a4, a3, 0, 0, 0, 0);
  if (v4)
  {
    int v5 = ASDTIOPLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty();
    }
  }
  return v4 == 0;
}

void sub_248A705A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A707C4(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void sub_248A7091C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::~UserClient(ASDT::IOPAudio::IsolatedIOBuffer::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x24C589180);
}

void sub_248A70C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A70E88(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void sub_248A70FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A71110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A711E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A712C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A713A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A71538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A7166C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A717D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::ClientManager::UserClient::~UserClient(ASDT::IOPAudio::ClientManager::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x24C589180);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_248A719C8(_Unwind_Exception *a1)
{
  int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_248A71AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A71F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A722B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A72520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A72834(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A729BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A72B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A72BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::LPMic::UserClient::~UserClient(ASDT::IOPAudio::LPMic::UserClient *this)
{
  ASDT::IOUserClient::~IOUserClient(this);
  JUMPOUT(0x24C589180);
}

uint64_t ASDTIOPLogType()
{
  if (ASDTIOPLogType_onceToken != -1) {
    dispatch_once(&ASDTIOPLogType_onceToken, &__block_literal_global);
  }
  return gASDTIOPLogType;
}

os_log_t __ASDTIOPLogType_block_invoke()
{
  os_log_t result = os_log_create("com.apple.audio.ASDT", "IOP");
  if (result) {
    gASDTIOPLogType = (uint64_t)result;
  }
  return result;
}

void sub_248A73584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A73C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_248A74064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74470(_Unwind_Exception *a1)
{
  unsigned int v6 = v2;

  _Unwind_Resume(a1);
}

void sub_248A7456C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A746EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_248A74E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::CopyIdentifier()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetIdentifier: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetStreamDescription()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetStreamDescription", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::GetStreamDescription()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Bad Data Size GetStreamDescription", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetStreamDescription", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupIO()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetupIO", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownIO()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed TeardownIO", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::SetupClientIO()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetupClientIO", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::TeardownClientIO()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed TeardownClientIO", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IsolatedIOBuffer::UserClient::ReadInput()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed ReadInput", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetStreamDescription: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::GetClockDomain()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetInputClockDomain: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetZeroTimeStampInterval: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetRingBufferSize: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetHistoricDataSupported: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::StartIO()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed StartIO", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::StopIO()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed StopIO", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::GetControlValue()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetControlValue: Bad valueCount.", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetControlValue", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::SetControlValue()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetControlValue", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::LPMic::UserClient::MapEngineStatus()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed MapStreamStatus", v2, v3, v4, v5, v6);
}

{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  uint64_t v3 = 1024;
  uint64_t v4 = v0;
  uint64_t v5 = 2048;
  uint8_t v6 = 32;
  _os_log_error_impl(&dword_248A68000, v1, OS_LOG_TYPE_ERROR, "%s: Unexpected EngineStatus memory map size: %u (expected %zu)", v2, 0x1Cu);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::Close()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed Close", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyIdentifier()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: CopyIdentifier: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: GetIsConfigured: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: CopyConfiguration: Property missing", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::Open()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed Open", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetVoiceTriggerEnabled", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetVoiceTriggerEnabled", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetActiveChannelMask", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetModelCRC", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetDebugEnabled", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetDebugEnabled", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::IOBuffer::UserClient::CopyIdentifier(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_248A68000, a2, OS_LOG_TYPE_ERROR, "%s: GetIdentifier: Property missing", (uint8_t *)&v3, 0xCu);
}

void ASDT::IOPAudio::IOBuffer::UserClient::MapIOBuffer(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(a1 + 32);
  if (*(char *)(a1 + 55) < 0) {
    uint64_t v2 = (void *)*v2;
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_248A68000, a2, OS_LOG_TYPE_ERROR, "%s: Failed MapIOBuffer", (uint8_t *)&v3, 0xCu);
}

void ASDT::IOPAudio::ClientManager::UserClient::Enable()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed PowerRequest", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::ClientManager::UserClient::GetEnableState()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetCurrentPowerState", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed GetNodeProperty", v2, v3, v4, v5, v6);
}

void ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty()
{
  OUTLINED_FUNCTION_0_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_248A68000, v0, v1, "%s: Failed SetNodeProperty", v2, v3, v4, v5, v6);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
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

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ASDT::IOUserClient::SetProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, const applesauce::CF::DictionaryRef *a3)
{
  return MEMORY[0x270F0F9E8](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::DictionaryRef *a3)
{
  return MEMORY[0x270F0F9F8](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, applesauce::CF::StringRef *a3)
{
  return MEMORY[0x270F0FA10](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, BOOL *a3)
{
  return MEMORY[0x270F0FA18](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ConvertValue(ASDT::IOUserClient *this, const applesauce::CF::TypeRef *a2, unsigned int *a3)
{
  return MEMORY[0x270F0FA28](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ReleaseMemory(ASDT::IOUserClient *this, void *a2)
{
  return MEMORY[0x270F0FA40](this, a2);
}

uint64_t ASDT::IOUserClient::OpenConnection(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA48](this);
}

uint64_t ASDT::IOUserClient::SetInterestNotificationEnabled(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA80](this);
}

uint64_t ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FA90](this);
}

uint64_t ASDT::IOUserClient::MapMemory(ASDT::IOUserClient *this, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x270F0FA98](this, a2, a3, a4);
}

uint64_t ASDT::IOUserClient::IOUserClient()
{
  return MEMORY[0x270F0FAA0]();
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
  return MEMORY[0x270F0FAC0]();
}

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

uint64_t ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionToIOAudio2()
{
  return MEMORY[0x270F0FAF0]();
}

uint64_t ASDT::IOAudio2::Helpers::AudioStreamBasicDescriptionFromIOAudio2()
{
  return MEMORY[0x270F0FAF8]();
}

uint64_t ASDTTime::machAbsoluteTime(ASDTTime *this)
{
  return MEMORY[0x270F0FB08](this);
}

uint64_t ASDT::IOUserClient::CallMethod(ASDT::IOUserClient *this, uint64_t a2, const unint64_t *a3, uint64_t a4, const void *a5, uint64_t a6, unint64_t *a7, unsigned int *a8, void *a9, unint64_t *a10)
{
  return MEMORY[0x270F0FBC8](this, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t ASDT::IOUserClient::CopyProperty(ASDT::IOUserClient *this, const applesauce::CF::StringRef *a2, applesauce::CF::TypeRef *a3)
{
  return MEMORY[0x270F0FBE0](this, a2, a3);
}

uint64_t ASDT::IOUserClient::ExclusiveLock(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FBE8](this);
}

uint64_t ASDT::IOUserClient::IsValid(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FC10](this);
}

uint64_t ASDT::IOUserClient::CallTrap3(ASDT::IOUserClient *this)
{
  return MEMORY[0x270F0FC18](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
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

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::terminate(void)
{
}

void operator delete()
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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