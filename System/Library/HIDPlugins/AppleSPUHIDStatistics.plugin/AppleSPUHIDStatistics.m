uint64_t AppleSPUHIDStatistics::registerService()
{
  const void *v0;
  const void *v1;
  CFTypeID v2;
  CFNumberRef IOHIDServiceRegistryID;
  mach_port_t v4;
  CFDictionaryRef v5;

  v0 = (const void *)IOHIDServiceCopyProperty();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID()
      && CFEqual(v1, @"SPU")
      && AppleSPUHIDStatistics::IOHIDServiceSupportsAggregateDictionary())
    {
      IOHIDServiceRegistryID = AppleSPUHIDStatistics::getIOHIDServiceRegistryID();
      v4 = *MEMORY[0x263F0EC90];
      v5 = IORegistryEntryIDMatching((uint64_t)IOHIDServiceRegistryID);
      IOServiceGetMatchingService(v4, v5);
      operator new();
    }
    CFRelease(v1);
  }
  return 0;
}

uint64_t sub_24078726C(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_240787284(uint64_t a1)
{
  return 1;
}

uint64_t sub_2407872A4(uint64_t a1, dispatch_queue_t queue)
{
  *(void *)(a1 + 624) = queue;
  int out_token = 0;
  return notify_register_dispatch("com.apple.applespuhidstatistics.fault", &out_token, queue, &unk_26F4E5118);
}

uint64_t sub_2407872E4(uint64_t result)
{
  *(void *)(result + 624) = 0;
  return result;
}

void AppleSPUHIDStatistics::alloc(AppleSPUHIDStatistics *this, const __CFAllocator *a2)
{
  v3 = (AppleSPUHIDStatistics *)CFAllocatorAllocate(this, 632, 0);

  AppleSPUHIDStatistics::AppleSPUHIDStatistics(v3, this);
}

void AppleSPUHIDStatistics::operator delete(CFAllocatorRef *ptr)
{
}

void sub_240787354(void *a1)
{
}

void AppleSPUHIDStatistics::AppleSPUHIDStatistics(AppleSPUHIDStatistics *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUHIDStatistics::vtbl;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x75u, 0xF0u, 0x71u, 0x27u, 0xBBu, 6u, 0x49u, 0xAu, 0xB1u, 0xB9u, 0x81u, 0xAEu, 0x65u, 0xDFu, 6u, 0x46u);
  CFPlugInAddInstanceForFactory(v3);
  *((void *)this + 3) = CFArrayCreateMutable(*((CFAllocatorRef *)this + 1), 0, 0);
}

void AppleSPUHIDStatistics::~AppleSPUHIDStatistics(AppleSPUHIDStatistics *this)
{
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x75u, 0xF0u, 0x71u, 0x27u, 0xBBu, 6u, 0x49u, 0xAu, 0xB1u, 0xB9u, 0x81u, 0xAEu, 0x65u, 0xDFu, 6u, 0x46u);
  CFPlugInRemoveInstanceForFactory(v1);
  os_release((void *)qword_26AFC85E8);
}

uint64_t AppleSPUHIDStatistics::QueryInterface(AppleSPUHIDStatistics *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x19u, 0xD7u, 0x74u, 0x41u, 0xBBu, 0xC4u, 0x45u, 0x11u, 0x91u, 0x49u, 0x60u, 0x57u, 0x2Au, 0xBu, 1u, 0x5Cu);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0x3Du, 0xC3u, 0x5Au, 0xA6u, 0xD3u, 0x5Cu, 0x44u, 0x5Bu, 0x9Au, 0x59u, 0xCAu, 3u, 0xDAu, 0x40u, 0x8Bu, 0x97u), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    uint64_t v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    uint64_t v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t AppleSPUHIDStatistics::AddRef(AppleSPUHIDStatistics *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUHIDStatistics::Release(AppleSPUHIDStatistics *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDStatistics::~AppleSPUHIDStatistics(this);
    AppleSPUHIDStatistics::operator delete(v3);
  }
  return v2;
}

uint64_t AppleSPUHIDStatistics::open(uint64_t a1)
{
  if (qword_26AFC85E0 != -1) {
    dispatch_once(&qword_26AFC85E0, &unk_26F4E50F8);
  }
  uint64_t v2 = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v4 = a1 + 32;
  do
  {
    if (off_2650D47B8[v2]) {
      CFUUIDRef v5 = off_2650D47B8[v2];
    }
    else {
      CFUUIDRef v5 = "com.apple.aop.unknown";
    }
    *(void *)(v4 + v2 * 8) = CFStringCreateWithCString(v3, v5, 0);
    ++v2;
  }
  while (v2 != 74);
  return 1;
}

os_log_t sub_2407876E8()
{
  os_log_t result = os_log_create("AOP", "AppleSPUHIDStatistics");
  qword_26AFC85E8 = (uint64_t)result;
  return result;
}

const __CFBoolean *AppleSPUHIDStatistics::IOHIDServiceSupportsAggregateDictionary()
{
  CFBooleanRef result = (const __CFBoolean *)IOHIDServiceGetProperty();
  if (result)
  {
    CFBooleanRef v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v1) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

const __CFNumber *AppleSPUHIDStatistics::getIOHIDServiceRegistryID()
{
  CFNumberRef result = (const __CFNumber *)IOHIDServiceGetRegistryID();
  if (result)
  {
    uint64_t valuePtr = 0;
    if (CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr)) {
      return (const __CFNumber *)valuePtr;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t AppleSPUHIDStatistics::scheduleWithDispatchQueue(AppleSPUHIDStatistics *this, dispatch_queue_t queue)
{
  *((void *)this + 78) = queue;
  int out_token = 0;
  return notify_register_dispatch("com.apple.applespuhidstatistics.fault", &out_token, queue, &unk_26F4E5118);
}

void sub_240787804()
{
  v0 = qword_26AFC85E8;
  if (os_log_type_enabled((os_log_t)qword_26AFC85E8, OS_LOG_TYPE_FAULT)) {
    sub_240795018(v0);
  }
}

uint64_t AppleSPUHIDStatistics::unscheduleFromDispatchQueue(uint64_t this, dispatch_queue_s *a2)
{
  *(void *)(this + 624) = 0;
  return this;
}

__CFString *AppleSPUHIDStatistics::keyForIndex(uint64_t a1, int a2)
{
  if (a2 > 73) {
    return @"com.apple.aop.unknown";
  }
  else {
    return *(__CFString **)(a1 + 8 * a2 + 32);
  }
}

void AppleSPUHIDStatistics::publishADData(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unint64_t v4 = a2;
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0x26AFC8000uLL;
    do
    {
      int v8 = *(unsigned __int8 *)(v4 - v5 + 8 * v5);
      if (v8 == 74)
      {
        uint64_t v9 = v4 - v5 + 8 * v5;
        unsigned int v12 = *(unsigned __int16 *)(v9 + 1);
        v11 = (__int16 *)(v9 + 1);
        LOBYTE(v10) = v12;
        unint64_t v13 = (unint64_t)v12 >> 8;
        if (v12 >> 9 > 0x24) {
          v14 = @"com.apple.aop.unknown";
        }
        else {
          v14 = *(__CFString **)(a1 + 8 * v13 + 32);
        }
        unint64_t v15 = v7;
        v16 = *(NSObject **)(v7 + 1512);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "publishADData";
          __int16 v26 = 1024;
          int v27 = v10;
          __int16 v28 = 2112;
          v29 = v14;
          __int16 v30 = 1024;
          int v31 = v13;
          _os_log_debug_impl(&dword_240785000, v16, OS_LOG_TYPE_DEBUG, "%s op=%#x '%@' (%#x)", buf, 0x22u);
          __int16 v10 = *v11;
        }
        uint64_t v17 = v10;
        unint64_t v7 = v15;
        unint64_t v4 = a2;
        switch((char)v10)
        {
          case 0:
            break;
          case 1:
            ADClientClearScalarKey();
            break;
          case 2:
            ADClientSetValueForScalarKey();
            break;
          case 3:
            ADClientAddValueForScalarKey();
            break;
          case 4:
            ADClientClearDistributionKey();
            break;
          case 5:
            ADClientSetValueForDistributionKey();
            break;
          default:
            unint64_t v19 = v10 - 5;
            unint64_t v7 = a2;
            unint64_t v4 = a2;
            if (v17 != 5)
            {
              unsigned int v20 = 1;
              do
                ADClientPushValueForDistributionKey();
              while (v19 > v20++);
            }
            break;
        }
      }
      else
      {
        v18 = *(NSObject **)(v7 + 1512);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "publishADData";
          __int16 v26 = 1024;
          int v27 = v8;
          __int16 v28 = 1024;
          LODWORD(v29) = 74;
          _os_log_error_impl(&dword_240785000, v18, OS_LOG_TYPE_ERROR, "%s spuaggdkeys version mismatch (%#x/%#x)", buf, 0x18u);
        }
      }
      uint64_t v5 = ++v6;
    }
    while (v6 < a3);
  }
}

void AppleSPUHIDStatisticsFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (CFEqual(a2, v4))
  {
    uint64_t v5 = (AppleSPUHIDStatistics *)CFAllocatorAllocate(a1, 632, 0);
    AppleSPUHIDStatistics::AppleSPUHIDStatistics(v5, a1);
  }
}

void spu_profile_print(void *a1)
{
  CFStringRef v1 = CopyProfileDescription(a1);
  if (v1)
  {
    CFStringRef v2 = v1;
    CStringPtr = CFStringGetCStringPtr(v1, 0);
    puts(CStringPtr);
    CFRelease(v2);
  }
}

CFStringRef CopyProfileDescription(void *a1)
{
  AOPLogDecoder::to_string(a1);
  *(_OWORD *)__p = v4;
  uint64_t v7 = v5;
  if (v5 >= 0) {
    CFStringRef v1 = __p;
  }
  else {
    CFStringRef v1 = (void **)__p[0];
  }
  CFStringRef v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], (const char *)v1, 0x8000100u);
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  return v2;
}

void sub_240787CD8(void *a1)
{
}

void sub_240787CE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *profile_decoder::find_in_table@<X0>(const entry *a1@<X1>, unsigned int __val@<W3>, unsigned int a3@<W2>, std::string *a4@<X8>)
{
  if (!a3) {
    return std::to_string(a4, __val);
  }
  uint64_t v5 = a3;
  for (i = &a1->data; *((_DWORD *)i - 2) != __val; i += 2)
  {
    if (!--v5) {
      return std::to_string(a4, __val);
    }
  }
  return (std::string *)sub_240794060(a4, (char *)*i);
}

uint64_t profile_decoder::dump(profile_decoder *this, const void *a2, int a3)
{
  sub_240787F2C((uint64_t)v7);
  sub_2407941BC(v8, (uint64_t)"[", 1);
  if (a3)
  {
    uint64_t v4 = 0;
    do
    {
      if (v4) {
        sub_2407941BC(v8, (uint64_t)",", 1);
      }
      std::ostream::operator<<();
      ++v4;
    }
    while (a3 != v4);
  }
  sub_2407941BC(v8, (uint64_t)"]", 1);
  std::stringbuf::str();
  v7[0] = *MEMORY[0x263F8C2B8];
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v7 + *(void *)(v7[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v8[0] = v5;
  v8[1] = MEMORY[0x263F8C318] + 16;
  if (v9 < 0) {
    operator delete((void *)v8[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2455F8FF0](&v10);
}

void sub_240787F14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_240788204((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_240787F2C(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
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

void sub_2407881DC(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x2455F8FF0](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_240788204(uint64_t a1)
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
  MEMORY[0x2455F8FF0](a1 + 128);
  return a1;
}

std::string *profile_decoder::category_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4A28, __val, 0xEu, a2);
}

std::string *profile_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *profile_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

void profile_decoder::parse_datatype(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v409 = *MEMORY[0x263EF8340];
  switch(*(unsigned char *)a3)
  {
    case 1:
      sub_240794060(&v323, "subtype");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v5 = &v406;
      }
      else {
        uint64_t v5 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v406.__r_.__value_.__l.__size_;
      }
      uint64_t v7 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v5, size);
      *(void *)((char *)v7 + *(void *)(*v7 - 24) + 24) = 10;
      int v8 = (void *)std::ostream::operator<<();
      uint64_t v9 = sub_2407941BC(v8, (uint64_t)",", 1);
      sub_240794060(&v321, "packet-size");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v10 = &v403;
      }
      else {
        uint64_t v10 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v11 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v11 = v403.__r_.__value_.__l.__size_;
      }
      uint64_t v12 = sub_2407941BC(v9, (uint64_t)v10, v11);
      *(void *)((char *)v12 + *(void *)(*v12 - 24) + 24) = 10;
      unint64_t v13 = (void *)std::ostream::operator<<();
      v14 = sub_2407941BC(v13, (uint64_t)",", 1);
      sub_240794060(&v319, "data-length");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v15 = &v400;
      }
      else {
        unint64_t v15 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v16 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v16 = v400.__r_.__value_.__l.__size_;
      }
      uint64_t v17 = sub_2407941BC(v14, (uint64_t)v15, v16);
      *(void *)((char *)v17 + *(void *)(*v17 - 24) + 24) = 10;
      v18 = (void *)std::ostream::operator<<();
      unint64_t v19 = sub_2407941BC(v18, (uint64_t)",", 1);
      sub_240794060(&v317, "data-offset");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v20 = &v397;
      }
      else {
        unsigned int v20 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v21 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v21 = v397.__r_.__value_.__l.__size_;
      }
      v22 = sub_2407941BC(v19, (uint64_t)v20, v21);
      *(void *)((char *)v22 + *(void *)(*v22 - 24) + 24) = 10;
      v23 = (void *)std::ostream::operator<<();
      v24 = sub_2407941BC(v23, (uint64_t)",", 1);
      sub_240794060(&v315, "raw-data");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v25 = &v394;
      }
      else {
        v25 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v26 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v26 = v394.__r_.__value_.__l.__size_;
      }
      int v27 = (profile_decoder *)sub_2407941BC(v24, (uint64_t)v25, v26);
      __int16 v28 = v27;
      *(void *)((char *)v27 + *(void *)(*(void *)v27 - 24) + 24) = 10;
      if (*(unsigned __int16 *)(a3 + 20) >= 0x18u) {
        int v29 = 24;
      }
      else {
        int v29 = *(unsigned __int16 *)(a3 + 20);
      }
      profile_decoder::dump(v27, (const void *)(a3 + 24), v29);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v31 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v31 = __p.__r_.__value_.__l.__size_;
      }
      uint64_t v32 = sub_2407941BC(v28, (uint64_t)p_p, v31);
      sub_2407941BC(v32, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v316 < 0) {
        operator delete(v315);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v318 < 0) {
        operator delete(v317);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v320 < 0) {
        operator delete(v319);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v322 < 0) {
        operator delete(v321);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v324 < 0)
      {
        v33 = v323;
        goto LABEL_601;
      }
      break;
    case 2:
      sub_240794060(&v313, "subtype");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v34 = &v406;
      }
      else {
        v34 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v35 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v35 = v406.__r_.__value_.__l.__size_;
      }
      v36 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v34, v35);
      *(void *)((char *)v36 + *(void *)(*v36 - 24) + 24) = 10;
      v37 = (void *)std::ostream::operator<<();
      v38 = sub_2407941BC(v37, (uint64_t)",", 1);
      sub_240794060(&v311, "packet-size");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v39 = &v403;
      }
      else {
        v39 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v40 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v40 = v403.__r_.__value_.__l.__size_;
      }
      v41 = sub_2407941BC(v38, (uint64_t)v39, v40);
      *(void *)((char *)v41 + *(void *)(*v41 - 24) + 24) = 10;
      v42 = (void *)std::ostream::operator<<();
      v43 = sub_2407941BC(v42, (uint64_t)",", 1);
      sub_240794060(&v309, "data-length");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v44 = &v400;
      }
      else {
        v44 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v45 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v45 = v400.__r_.__value_.__l.__size_;
      }
      v46 = sub_2407941BC(v43, (uint64_t)v44, v45);
      *(void *)((char *)v46 + *(void *)(*v46 - 24) + 24) = 10;
      v47 = (void *)std::ostream::operator<<();
      v48 = sub_2407941BC(v47, (uint64_t)",", 1);
      sub_240794060(&v307, "data-offset");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v49 = &v397;
      }
      else {
        v49 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v50 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v50 = v397.__r_.__value_.__l.__size_;
      }
      v51 = sub_2407941BC(v48, (uint64_t)v49, v50);
      *(void *)((char *)v51 + *(void *)(*v51 - 24) + 24) = 10;
      v52 = (void *)std::ostream::operator<<();
      v53 = sub_2407941BC(v52, (uint64_t)",", 1);
      sub_240794060(&v305, "raw-data");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v54 = &v394;
      }
      else {
        v54 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v55 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v55 = v394.__r_.__value_.__l.__size_;
      }
      v56 = (profile_decoder *)sub_2407941BC(v53, (uint64_t)v54, v55);
      *(void *)((char *)v56 + *(void *)(*(void *)v56 - 24) + 24) = 10;
      profile_decoder::dump(v56, (const void *)(a3 + 18), 30);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v57 = &__p;
      }
      else {
        v57 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v58 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v58 = __p.__r_.__value_.__l.__size_;
      }
      v59 = sub_2407941BC(v56, (uint64_t)v57, v58);
      sub_2407941BC(v59, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v306 < 0) {
        operator delete(v305);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v308 < 0) {
        operator delete(v307);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v310 < 0) {
        operator delete(v309);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v312 < 0) {
        operator delete(v311);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v314 < 0)
      {
        v33 = v313;
        goto LABEL_601;
      }
      break;
    case 3:
      sub_240794060(&v404, "arg1");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v60 = &v406;
      }
      else {
        v60 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v61 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v61 = v406.__r_.__value_.__l.__size_;
      }
      v62 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v60, v61);
      *(void *)((char *)v62 + *(void *)(*v62 - 24) + 24) = 10;
      v63 = (void *)std::ostream::operator<<();
      v64 = sub_2407941BC(v63, (uint64_t)",", 1);
      sub_240794060(&v401, "arg2");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v65 = &v403;
      }
      else {
        v65 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v66 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v66 = v403.__r_.__value_.__l.__size_;
      }
      v67 = sub_2407941BC(v64, (uint64_t)v65, v66);
      *(void *)((char *)v67 + *(void *)(*v67 - 24) + 24) = 10;
      v68 = (void *)std::ostream::operator<<();
      v69 = sub_2407941BC(v68, (uint64_t)",", 1);
      sub_240794060(&v398, "arg3");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v70 = &v400;
      }
      else {
        v70 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v71 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v71 = v400.__r_.__value_.__l.__size_;
      }
      v72 = sub_2407941BC(v69, (uint64_t)v70, v71);
      *(void *)((char *)v72 + *(void *)(*v72 - 24) + 24) = 10;
      v73 = (void *)std::ostream::operator<<();
      v74 = sub_2407941BC(v73, (uint64_t)",", 1);
      sub_240794060(&v395, "arg4");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v75 = &v397;
      }
      else {
        v75 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v76 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v76 = v397.__r_.__value_.__l.__size_;
      }
      v77 = sub_2407941BC(v74, (uint64_t)v75, v76);
      *(void *)((char *)v77 + *(void *)(*v77 - 24) + 24) = 10;
      v78 = (void *)std::ostream::operator<<();
      v79 = sub_2407941BC(v78, (uint64_t)",", 1);
      sub_240794060(&v392, "arg5");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v80 = &v394;
      }
      else {
        v80 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v81 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v81 = v394.__r_.__value_.__l.__size_;
      }
      v82 = sub_2407941BC(v79, (uint64_t)v80, v81);
      *(void *)((char *)v82 + *(void *)(*v82 - 24) + 24) = 10;
      v83 = (void *)std::ostream::operator<<();
      v84 = sub_2407941BC(v83, (uint64_t)",", 1);
      sub_240794060(&v389, "arg6");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v85 = &__p;
      }
      else {
        v85 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v86 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v86 = __p.__r_.__value_.__l.__size_;
      }
      v87 = sub_2407941BC(v84, (uint64_t)v85, v86);
      *(void *)((char *)v87 + *(void *)(*v87 - 24) + 24) = 10;
      v88 = (void *)std::ostream::operator<<();
      v89 = sub_2407941BC(v88, (uint64_t)",", 1);
      *(_DWORD *)((char *)v89 + *(void *)(*v89 - 24) + 8) = *(_DWORD *)((unsigned char *)v89 + *(void *)(*v89 - 24) + 8) & 0xFFFFFFB5 | 8;
      sub_240794060(&v387, "xarg1");
      profile_decoder::key(&v408);
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v90 = &v408;
      }
      else {
        v90 = (std::string *)v408.__r_.__value_.__r.__words[0];
      }
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v91 = HIBYTE(v408.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v91 = v408.__r_.__value_.__l.__size_;
      }
      v92 = sub_2407941BC(v89, (uint64_t)v90, v91);
      *(void *)((char *)v92 + *(void *)(*v92 - 24) + 24) = 10;
      sub_2407941BC(v92, (uint64_t)"'", 1);
      v93 = (void *)std::ostream::operator<<();
      v94 = sub_2407941BC(v93, (uint64_t)"',", 2);
      sub_240794060(&v384, "xarg2");
      profile_decoder::key(&v386);
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v95 = &v386;
      }
      else {
        v95 = (std::string *)v386.__r_.__value_.__r.__words[0];
      }
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v96 = HIBYTE(v386.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v96 = v386.__r_.__value_.__l.__size_;
      }
      v97 = sub_2407941BC(v94, (uint64_t)v95, v96);
      *(void *)((char *)v97 + *(void *)(*v97 - 24) + 24) = 10;
      sub_2407941BC(v97, (uint64_t)"'", 1);
      v98 = (void *)std::ostream::operator<<();
      v99 = sub_2407941BC(v98, (uint64_t)"',", 2);
      sub_240794060(&v381, "xarg3");
      profile_decoder::key(&v383);
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v100 = &v383;
      }
      else {
        v100 = (std::string *)v383.__r_.__value_.__r.__words[0];
      }
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v101 = HIBYTE(v383.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v101 = v383.__r_.__value_.__l.__size_;
      }
      v102 = sub_2407941BC(v99, (uint64_t)v100, v101);
      *(void *)((char *)v102 + *(void *)(*v102 - 24) + 24) = 10;
      sub_2407941BC(v102, (uint64_t)"'", 1);
      v103 = (void *)std::ostream::operator<<();
      v104 = sub_2407941BC(v103, (uint64_t)"',", 2);
      sub_240794060(&v379, "xarg4");
      profile_decoder::key(&__s);
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_s = &__s;
      }
      else {
        p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
      }
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v106 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v106 = __s.__r_.__value_.__l.__size_;
      }
      v107 = sub_2407941BC(v104, (uint64_t)p_s, v106);
      *(void *)((char *)v107 + *(void *)(*v107 - 24) + 24) = 10;
      sub_2407941BC(v107, (uint64_t)"'", 1);
      v108 = (void *)std::ostream::operator<<();
      v109 = sub_2407941BC(v108, (uint64_t)"',", 2);
      sub_240794060(&v376, "xarg5");
      profile_decoder::key(&v378);
      if ((v378.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v110 = &v378;
      }
      else {
        v110 = (std::string *)v378.__r_.__value_.__r.__words[0];
      }
      if ((v378.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v111 = HIBYTE(v378.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v111 = v378.__r_.__value_.__l.__size_;
      }
      v112 = sub_2407941BC(v109, (uint64_t)v110, v111);
      *(void *)((char *)v112 + *(void *)(*v112 - 24) + 24) = 10;
      sub_2407941BC(v112, (uint64_t)"'", 1);
      v113 = (void *)std::ostream::operator<<();
      v114 = sub_2407941BC(v113, (uint64_t)"',", 2);
      sub_240794060(&v373, "xarg6");
      profile_decoder::key(&v375);
      if ((v375.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v115 = &v375;
      }
      else {
        v115 = (std::string *)v375.__r_.__value_.__r.__words[0];
      }
      if ((v375.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v116 = HIBYTE(v375.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v116 = v375.__r_.__value_.__l.__size_;
      }
      v117 = sub_2407941BC(v114, (uint64_t)v115, v116);
      *(void *)((char *)v117 + *(void *)(*v117 - 24) + 24) = 10;
      sub_2407941BC(v117, (uint64_t)"'", 1);
      v118 = (void *)std::ostream::operator<<();
      v119 = sub_2407941BC(v118, (uint64_t)"',", 2);
      *(_DWORD *)((char *)v119 + *(void *)(*v119 - 24) + 8) = *(_DWORD *)((unsigned char *)v119
                                                                            + *(void *)(*v119 - 24)
                                                                            + 8) & 0xFFFFFFB5 | 2;
      if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v375.__r_.__value_.__l.__data_);
      }
      if (v374 < 0) {
        operator delete(v373);
      }
      if (SHIBYTE(v378.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v378.__r_.__value_.__l.__data_);
      }
      if (v377 < 0) {
        operator delete(v376);
      }
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__s.__r_.__value_.__l.__data_);
      }
      if (v380 < 0) {
        operator delete(v379);
      }
      if (SHIBYTE(v383.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v383.__r_.__value_.__l.__data_);
      }
      if (v382 < 0) {
        operator delete(v381);
      }
      if (SHIBYTE(v386.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v386.__r_.__value_.__l.__data_);
      }
      if (v385 < 0) {
        operator delete(v384);
      }
      if (SHIBYTE(v408.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v408.__r_.__value_.__l.__data_);
      }
      if (v388 < 0) {
        operator delete(v387);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v390 < 0) {
        operator delete(v389);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v393 < 0) {
        operator delete(v392);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v396 < 0) {
        operator delete(v395);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v399 < 0) {
        operator delete(v398);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v402 < 0) {
        operator delete(v401);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v405 < 0)
      {
        v33 = v404;
        goto LABEL_601;
      }
      break;
    case 4:
      sub_240794060(&v371, "trigger");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v213 = &v406;
      }
      else {
        v213 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v214 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v214 = v406.__r_.__value_.__l.__size_;
      }
      sub_2407941BC((void *)(a2 + 16), (uint64_t)v213, v214);
      v215 = (void *)std::ostream::operator<<();
      v216 = sub_2407941BC(v215, (uint64_t)",", 1);
      sub_240794060(&v369, "thread-id");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v217 = &v403;
      }
      else {
        v217 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v218 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v218 = v403.__r_.__value_.__l.__size_;
      }
      v219 = sub_2407941BC(v216, (uint64_t)v217, v218);
      *(void *)((char *)v219 + *(void *)(*v219 - 24) + 24) = 10;
      v220 = (void *)std::ostream::operator<<();
      v221 = sub_2407941BC(v220, (uint64_t)",", 1);
      sub_240794060(&v367, "arg");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v222 = &v400;
      }
      else {
        v222 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v223 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v223 = v400.__r_.__value_.__l.__size_;
      }
      v224 = sub_2407941BC(v221, (uint64_t)v222, v223);
      *(void *)((char *)v224 + *(void *)(*v224 - 24) + 24) = 10;
      v225 = (void *)std::ostream::operator<<();
      sub_2407941BC(v225, (uint64_t)",", 1);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v368 < 0) {
        operator delete(v367);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v370 < 0) {
        operator delete(v369);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v372 < 0)
      {
        v33 = v371;
        goto LABEL_601;
      }
      break;
    case 5:
      sub_240794060(&v335, "function-id");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v226 = &v406;
      }
      else {
        v226 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v227 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v227 = v406.__r_.__value_.__l.__size_;
      }
      v228 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v226, v227);
      *(void *)((char *)v228 + *(void *)(*v228 - 24) + 24) = 10;
      v229 = (void *)std::ostream::operator<<();
      v230 = sub_2407941BC(v229, (uint64_t)",", 1);
      sub_240794060(&v333, "extra-id");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v231 = &v403;
      }
      else {
        v231 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v232 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v232 = v403.__r_.__value_.__l.__size_;
      }
      v233 = sub_2407941BC(v230, (uint64_t)v231, v232);
      *(void *)((char *)v233 + *(void *)(*v233 - 24) + 24) = 10;
      v234 = (void *)std::ostream::operator<<();
      v235 = sub_2407941BC(v234, (uint64_t)",", 1);
      sub_240794060(&v331, "thread-id");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v236 = &v400;
      }
      else {
        v236 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v237 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v237 = v400.__r_.__value_.__l.__size_;
      }
      v238 = sub_2407941BC(v235, (uint64_t)v236, v237);
      *(void *)((char *)v238 + *(void *)(*v238 - 24) + 24) = 10;
      v239 = (void *)std::ostream::operator<<();
      v240 = sub_2407941BC(v239, (uint64_t)",", 1);
      sub_240794060(&v329, "duration");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v241 = &v397;
      }
      else {
        v241 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v242 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v242 = v397.__r_.__value_.__l.__size_;
      }
      v243 = sub_2407941BC(v240, (uint64_t)v241, v242);
      *(void *)((char *)v243 + *(void *)(*v243 - 24) + 24) = 10;
      v244 = (void *)std::ostream::operator<<();
      v245 = sub_2407941BC(v244, (uint64_t)",", 1);
      sub_240794060(&v327, "depth");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v246 = &v394;
      }
      else {
        v246 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v247 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v247 = v394.__r_.__value_.__l.__size_;
      }
      v248 = sub_2407941BC(v245, (uint64_t)v246, v247);
      *(void *)((char *)v248 + *(void *)(*v248 - 24) + 24) = 10;
      v249 = (void *)std::ostream::operator<<();
      v250 = sub_2407941BC(v249, (uint64_t)",", 1);
      sub_240794060(&v325, "thread_duration");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v251 = &__p;
      }
      else {
        v251 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v252 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v252 = __p.__r_.__value_.__l.__size_;
      }
      v253 = sub_2407941BC(v250, (uint64_t)v251, v252);
      *(void *)((char *)v253 + *(void *)(*v253 - 24) + 24) = 10;
      v254 = (void *)std::ostream::operator<<();
      sub_2407941BC(v254, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v326 < 0) {
        operator delete(v325);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v328 < 0) {
        operator delete(v327);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v330 < 0) {
        operator delete(v329);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v332 < 0) {
        operator delete(v331);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v334 < 0) {
        operator delete(v333);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v336 < 0)
      {
        v33 = v335;
        goto LABEL_601;
      }
      break;
    case 8:
      __s.__r_.__value_.__s.__data_[12] = 0;
      __s.__r_.__value_.__r.__words[0] = *(void *)(a3 + 35);
      LODWORD(__s.__r_.__value_.__r.__words[1]) = *(_DWORD *)(a3 + 43);
      sub_240794060(&v365, "name");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v120 = &v406;
      }
      else {
        v120 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v121 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v121 = v406.__r_.__value_.__l.__size_;
      }
      v122 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v120, v121);
      *(void *)((char *)v122 + *(void *)(*v122 - 24) + 24) = 16;
      sub_240794060(&v363, (char *)&__s);
      profile_decoder::str(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v123 = &v403;
      }
      else {
        v123 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v124 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v124 = v403.__r_.__value_.__l.__size_;
      }
      v125 = sub_2407941BC(v122, (uint64_t)v123, v124);
      v126 = sub_2407941BC(v125, (uint64_t)",", 1);
      sub_240794060(&v361, "report-interval");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v127 = &v400;
      }
      else {
        v127 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v128 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v128 = v400.__r_.__value_.__l.__size_;
      }
      v129 = sub_2407941BC(v126, (uint64_t)v127, v128);
      *(void *)((char *)v129 + *(void *)(*v129 - 24) + 24) = 10;
      v130 = (void *)std::ostream::operator<<();
      v131 = sub_2407941BC(v130, (uint64_t)",", 1);
      sub_240794060(&v359, "batch-interval");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v132 = &v397;
      }
      else {
        v132 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v133 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v133 = v397.__r_.__value_.__l.__size_;
      }
      v134 = sub_2407941BC(v131, (uint64_t)v132, v133);
      *(void *)((char *)v134 + *(void *)(*v134 - 24) + 24) = 10;
      v135 = (void *)std::ostream::operator<<();
      v136 = sub_2407941BC(v135, (uint64_t)",", 1);
      sub_240794060(&v357, "threshold");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v137 = &v394;
      }
      else {
        v137 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v138 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v138 = v394.__r_.__value_.__l.__size_;
      }
      v139 = sub_2407941BC(v136, (uint64_t)v137, v138);
      *(void *)((char *)v139 + *(void *)(*v139 - 24) + 24) = 10;
      v140 = (void *)std::ostream::operator<<();
      v141 = sub_2407941BC(v140, (uint64_t)",", 1);
      sub_240794060(&v355, "time-limit");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v142 = &__p;
      }
      else {
        v142 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v143 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v143 = __p.__r_.__value_.__l.__size_;
      }
      v144 = sub_2407941BC(v141, (uint64_t)v142, v143);
      *(void *)((char *)v144 + *(void *)(*v144 - 24) + 24) = 10;
      v145 = (void *)std::ostream::operator<<();
      v146 = sub_2407941BC(v145, (uint64_t)",", 1);
      sub_240794060(&v353, "connected");
      profile_decoder::key(&v408);
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v147 = &v408;
      }
      else {
        v147 = (std::string *)v408.__r_.__value_.__r.__words[0];
      }
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v148 = HIBYTE(v408.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v148 = v408.__r_.__value_.__l.__size_;
      }
      v149 = sub_2407941BC(v146, (uint64_t)v147, v148);
      *(void *)((char *)v149 + *(void *)(*v149 - 24) + 24) = 10;
      v150 = (void *)std::ostream::operator<<();
      v151 = sub_2407941BC(v150, (uint64_t)",", 1);
      sub_240794060(&v351, "decimation");
      profile_decoder::key(&v386);
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v152 = &v386;
      }
      else {
        v152 = (std::string *)v386.__r_.__value_.__r.__words[0];
      }
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v153 = HIBYTE(v386.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v153 = v386.__r_.__value_.__l.__size_;
      }
      v154 = sub_2407941BC(v151, (uint64_t)v152, v153);
      *(void *)((char *)v154 + *(void *)(*v154 - 24) + 24) = 10;
      v155 = (void *)std::ostream::operator<<();
      v156 = sub_2407941BC(v155, (uint64_t)",", 1);
      sub_240794060(&v349, "gyroPowerMode");
      profile_decoder::key(&v383);
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v157 = &v383;
      }
      else {
        v157 = (std::string *)v383.__r_.__value_.__r.__words[0];
      }
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v158 = HIBYTE(v383.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v158 = v383.__r_.__value_.__l.__size_;
      }
      v159 = sub_2407941BC(v156, (uint64_t)v157, v158);
      *(void *)((char *)v159 + *(void *)(*v159 - 24) + 24) = 10;
      v160 = (void *)std::ostream::operator<<();
      sub_2407941BC(v160, (uint64_t)",", 1);
      if (SHIBYTE(v383.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v383.__r_.__value_.__l.__data_);
      }
      if (v350 < 0) {
        operator delete(v349);
      }
      if (SHIBYTE(v386.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v386.__r_.__value_.__l.__data_);
      }
      if (v352 < 0) {
        operator delete(v351);
      }
      if (SHIBYTE(v408.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v408.__r_.__value_.__l.__data_);
      }
      if (v354 < 0) {
        operator delete(v353);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v356 < 0) {
        operator delete(v355);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v358 < 0) {
        operator delete(v357);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v360 < 0) {
        operator delete(v359);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v362 < 0) {
        operator delete(v361);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v364 < 0) {
        operator delete(v363);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v366 < 0)
      {
        v33 = v365;
        goto LABEL_601;
      }
      break;
    case 9:
      v408.__r_.__value_.__s.__data_[16] = 0;
      *(_OWORD *)&v408.__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 32);
      sub_240794060(&v303, "function");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v161 = &v406;
      }
      else {
        v161 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v162 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v162 = v406.__r_.__value_.__l.__size_;
      }
      v163 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v161, v162);
      *(void *)((char *)v163 + *(void *)(*v163 - 24) + 24) = 10;
      sub_240794060(&v301, (char *)&v408);
      profile_decoder::str(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v164 = &v403;
      }
      else {
        v164 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v165 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v165 = v403.__r_.__value_.__l.__size_;
      }
      v166 = sub_2407941BC(v163, (uint64_t)v164, v165);
      v167 = sub_2407941BC(v166, (uint64_t)",", 1);
      sub_240794060(&v299, "arg");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v168 = &v400;
      }
      else {
        v168 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v169 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v169 = v400.__r_.__value_.__l.__size_;
      }
      v170 = sub_2407941BC(v167, (uint64_t)v168, v169);
      *(void *)((char *)v170 + *(void *)(*v170 - 24) + 24) = 10;
      v171 = (void *)std::ostream::operator<<();
      v172 = sub_2407941BC(v171, (uint64_t)",", 1);
      sub_240794060(&v297, "task");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v173 = &v397;
      }
      else {
        v173 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v174 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v174 = v397.__r_.__value_.__l.__size_;
      }
      v175 = sub_2407941BC(v172, (uint64_t)v173, v174);
      *(void *)((char *)v175 + *(void *)(*v175 - 24) + 24) = 10;
      v176 = (void *)std::ostream::operator<<();
      v177 = sub_2407941BC(v176, (uint64_t)",", 1);
      sub_240794060(&v295, "thread");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v178 = &v394;
      }
      else {
        v178 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v179 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v179 = v394.__r_.__value_.__l.__size_;
      }
      v180 = sub_2407941BC(v177, (uint64_t)v178, v179);
      *(void *)((char *)v180 + *(void *)(*v180 - 24) + 24) = 10;
      v181 = (void *)std::ostream::operator<<();
      v182 = sub_2407941BC(v181, (uint64_t)",", 1);
      sub_240794060(&v293, "duration");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v183 = &__p;
      }
      else {
        v183 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v184 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v184 = __p.__r_.__value_.__l.__size_;
      }
      v185 = sub_2407941BC(v182, (uint64_t)v183, v184);
      *(void *)((char *)v185 + *(void *)(*v185 - 24) + 24) = 10;
      v186 = (void *)std::ostream::operator<<();
      sub_2407941BC(v186, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v294 < 0) {
        operator delete(v293);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v296 < 0) {
        operator delete(v295);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v298 < 0) {
        operator delete(v297);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v300 < 0) {
        operator delete(v299);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v302 < 0) {
        operator delete(v301);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v304 < 0)
      {
        v33 = v303;
        goto LABEL_601;
      }
      break;
    case 0xB:
      v406.__r_.__value_.__r.__words[0] = *(void *)(a3 + 24);
      sub_240794060(&v291, "global-id");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v187 = &v403;
      }
      else {
        v187 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v188 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v188 = v403.__r_.__value_.__l.__size_;
      }
      v189 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v187, v188);
      *(void *)((char *)v189 + *(void *)(*v189 - 24) + 24) = 10;
      v190 = (void *)std::ostream::operator<<();
      v191 = sub_2407941BC(v190, (uint64_t)",", 1);
      sub_240794060(&v289, "entry-id");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v192 = &v400;
      }
      else {
        v192 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v193 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v193 = v400.__r_.__value_.__l.__size_;
      }
      v194 = sub_2407941BC(v191, (uint64_t)v192, v193);
      *(void *)((char *)v194 + *(void *)(*v194 - 24) + 24) = 10;
      v195 = (void *)std::ostream::operator<<();
      v196 = sub_2407941BC(v195, (uint64_t)",", 1);
      sub_240794060(&v287, "entry");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v197 = &v397;
      }
      else {
        v197 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v198 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v198 = v397.__r_.__value_.__l.__size_;
      }
      v199 = sub_2407941BC(v196, (uint64_t)v197, v198);
      *(void *)((char *)v199 + *(void *)(*v199 - 24) + 24) = 10;
      sub_240794060(&v285, (char *)&v406);
      profile_decoder::str(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v200 = &v394;
      }
      else {
        v200 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v201 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v201 = v394.__r_.__value_.__l.__size_;
      }
      v202 = sub_2407941BC(v199, (uint64_t)v200, v201);
      v203 = sub_2407941BC(v202, (uint64_t)",", 1);
      sub_240794060(&v283, "arg1");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v204 = &__p;
      }
      else {
        v204 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v205 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v205 = __p.__r_.__value_.__l.__size_;
      }
      v206 = sub_2407941BC(v203, (uint64_t)v204, v205);
      *(void *)((char *)v206 + *(void *)(*v206 - 24) + 24) = 10;
      v207 = (void *)std::ostream::operator<<();
      v208 = sub_2407941BC(v207, (uint64_t)",", 1);
      sub_240794060(&v281, "arg2");
      profile_decoder::key(&v408);
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v209 = &v408;
      }
      else {
        v209 = (std::string *)v408.__r_.__value_.__r.__words[0];
      }
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v210 = HIBYTE(v408.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v210 = v408.__r_.__value_.__l.__size_;
      }
      v211 = sub_2407941BC(v208, (uint64_t)v209, v210);
      *(void *)((char *)v211 + *(void *)(*v211 - 24) + 24) = 10;
      v212 = (void *)std::ostream::operator<<();
      sub_2407941BC(v212, (uint64_t)",", 1);
      if (SHIBYTE(v408.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v408.__r_.__value_.__l.__data_);
      }
      if (v282 < 0) {
        operator delete(v281);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v284 < 0) {
        operator delete(v283);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v286 < 0) {
        operator delete(v285);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v288 < 0) {
        operator delete(v287);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v290 < 0) {
        operator delete(v289);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v292 < 0)
      {
        v33 = v291;
        goto LABEL_601;
      }
      break;
    case 0xC:
      v408.__r_.__value_.__s.__data_[12] = 0;
      v408.__r_.__value_.__r.__words[0] = *(void *)(a3 + 36);
      LODWORD(v408.__r_.__value_.__r.__words[1]) = *(_DWORD *)(a3 + 44);
      sub_240794060(&v347, "name");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v255 = &v406;
      }
      else {
        v255 = (std::string *)v406.__r_.__value_.__r.__words[0];
      }
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v256 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v256 = v406.__r_.__value_.__l.__size_;
      }
      v257 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v255, v256);
      *(void *)((char *)v257 + *(void *)(*v257 - 24) + 24) = 16;
      sub_240794060(&v345, (char *)&v408);
      profile_decoder::str(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v258 = &v403;
      }
      else {
        v258 = (std::string *)v403.__r_.__value_.__r.__words[0];
      }
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v259 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v259 = v403.__r_.__value_.__l.__size_;
      }
      v260 = sub_2407941BC(v257, (uint64_t)v258, v259);
      v261 = sub_2407941BC(v260, (uint64_t)",", 1);
      sub_240794060(&v343, "sample-interval");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v262 = &v400;
      }
      else {
        v262 = (std::string *)v400.__r_.__value_.__r.__words[0];
      }
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v263 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v263 = v400.__r_.__value_.__l.__size_;
      }
      v264 = sub_2407941BC(v261, (uint64_t)v262, v263);
      *(void *)((char *)v264 + *(void *)(*v264 - 24) + 24) = 10;
      v265 = (void *)std::ostream::operator<<();
      v266 = sub_2407941BC(v265, (uint64_t)",", 1);
      sub_240794060(&v341, "report-interval");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v267 = &v397;
      }
      else {
        v267 = (std::string *)v397.__r_.__value_.__r.__words[0];
      }
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v268 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v268 = v397.__r_.__value_.__l.__size_;
      }
      v269 = sub_2407941BC(v266, (uint64_t)v267, v268);
      *(void *)((char *)v269 + *(void *)(*v269 - 24) + 24) = 10;
      v270 = (void *)std::ostream::operator<<();
      v271 = sub_2407941BC(v270, (uint64_t)",", 1);
      sub_240794060(&v339, "batch-interval");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v272 = &v394;
      }
      else {
        v272 = (std::string *)v394.__r_.__value_.__r.__words[0];
      }
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v273 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v273 = v394.__r_.__value_.__l.__size_;
      }
      v274 = sub_2407941BC(v271, (uint64_t)v272, v273);
      *(void *)((char *)v274 + *(void *)(*v274 - 24) + 24) = 10;
      v275 = (void *)std::ostream::operator<<();
      v276 = sub_2407941BC(v275, (uint64_t)",", 1);
      sub_240794060(&v337, "next-dispatch");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v277 = &__p;
      }
      else {
        v277 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v278 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v278 = __p.__r_.__value_.__l.__size_;
      }
      v279 = sub_2407941BC(v276, (uint64_t)v277, v278);
      *(void *)((char *)v279 + *(void *)(*v279 - 24) + 24) = 10;
      v280 = (void *)std::ostream::operator<<();
      sub_2407941BC(v280, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v338 < 0) {
        operator delete(v337);
      }
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v394.__r_.__value_.__l.__data_);
      }
      if (v340 < 0) {
        operator delete(v339);
      }
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v397.__r_.__value_.__l.__data_);
      }
      if (v342 < 0) {
        operator delete(v341);
      }
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v400.__r_.__value_.__l.__data_);
      }
      if (v344 < 0) {
        operator delete(v343);
      }
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v403.__r_.__value_.__l.__data_);
      }
      if (v346 < 0) {
        operator delete(v345);
      }
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v406.__r_.__value_.__l.__data_);
      }
      if (v348 < 0)
      {
        v33 = v347;
LABEL_601:
        operator delete(v33);
      }
      break;
    default:
      return;
  }
}

void sub_24078A7EC(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x56F]) < 0) {
    operator delete((void *)STACK[0x558]);
  }
  if (SLOBYTE(STACK[0x2B7]) < 0) {
    operator delete((void *)STACK[0x2A0]);
  }
  if (SLOBYTE(STACK[0x59F]) < 0) {
    operator delete((void *)STACK[0x588]);
  }
  if (SLOBYTE(STACK[0x2CF]) < 0) {
    operator delete((void *)STACK[0x2B8]);
  }
  if (SLOBYTE(STACK[0x5CF]) < 0) {
    operator delete((void *)STACK[0x5B8]);
  }
  if (SLOBYTE(STACK[0x2E7]) < 0) {
    operator delete((void *)STACK[0x2D0]);
  }
  if (*(char *)(v1 - 193) < 0) {
    operator delete(*(void **)(v1 - 216));
  }
  if (SLOBYTE(STACK[0x2FF]) < 0) {
    operator delete((void *)STACK[0x2E8]);
  }
  if (*(char *)(v1 - 145) < 0) {
    operator delete(*(void **)(v1 - 168));
  }
  if (SLOBYTE(STACK[0x317]) < 0) {
    operator delete((void *)STACK[0x300]);
  }
  if (*(char *)(v1 - 97) < 0) {
    operator delete(*(void **)(v1 - 120));
  }
  if (SLOBYTE(STACK[0x32F]) < 0) {
    operator delete((void *)STACK[0x318]);
  }
  _Unwind_Resume(a1);
}

void profile_decoder::key(std::string *a1@<X8>)
{
  std::operator+<char>();
  uint64_t v2 = std::string::append(&v3, "':");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
}

void sub_24078B510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void profile_decoder::str(std::string *a1@<X8>)
{
  std::operator+<char>();
  uint64_t v2 = std::string::append(&v3, "'");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v3.__r_.__value_.__l.__data_);
  }
}

void sub_24078B59C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t profile_decoder::spu_time_to_wall_time(uint64_t a1, uint64_t a2, uint64_t a3)
{
  valuePtr[4] = *MEMORY[0x263EF8340];
  mach_port_t v5 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v6 = IOServiceMatching("AppleSPUTimesync");
  uint64_t result = IOServiceGetMatchingService(v5, v6);
  if (result)
  {
    io_object_t v8 = result;
    valuePtr[0] = 0;
    *(void *)__str = 0;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(result, @"timesync", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFDictionaryRef v10 = CFProperty;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"spu");
      CFNumberGetValue(Value, kCFNumberLongLongType, valuePtr);
      CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"calendar");
      CFNumberGetValue(v12, kCFNumberLongLongType, __str);
      unint64_t v13 = *(void *)__str + 1000 * a2 - valuePtr[0];
      CFRelease(v10);
      IOObjectRelease(v8);
      time_t v15 = v13 / 0x3B9ACA00;
      v14 = localtime(&v15);
      strftime((char *)valuePtr, 0x1EuLL, "%b %d %T", v14);
      snprintf(__str, 0x1EuLL, "%s.%06lld", (const char *)valuePtr, v13 / 0x3E8 - 1000000 * ((unint64_t)((v13 / 0x3E8 * (unsigned __int128)0x431BDE82D7B635uLL) >> 64) >> 10));
      MEMORY[0x2455F8EF0](a3, __str);
      return 1;
    }
    else
    {
      IOObjectRelease(v8);
      return 0;
    }
  }
  return result;
}

BOOL profile_decoder::get_boot_time(profile_decoder *this, unint64_t *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  size_t v5 = 16;
  *(void *)io_object_t v8 = 0x1500000001;
  int v3 = sysctl(v8, 2u, &v6, &v5, 0, 0);
  if ((v3 & 0x80000000) == 0) {
    *a2 = v7 + 1000000 * v6;
  }
  return v3 >= 0;
}

std::string *profile_decoder::type_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4B08, __val, 0xDu, a2);
}

void profile_decoder::to_string(uint64_t a1, void *a2)
{
  int v4 = *(_DWORD *)a2;
  (*(void (**)(long long *__return_ptr))(*(void *)a1 + 8))(&v135);
  (*(void (**)(long long *__return_ptr, uint64_t, void))(*(void *)a1 + 16))(&v133, a1, BYTE2(v4));
  (*(void (**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a1 + 24))(&v131, a1, BYTE2(v4), BYTE1(v4));
  size_t v5 = profile_decoder::find_in_table((const entry *)&unk_2650D4B08, v4, 0xDu, &v130);
  long long v128 = 0uLL;
  uint64_t v129 = 0;
  uint64_t v6 = (profile_decoder *)profile_decoder::spu_time_to_wall_time((uint64_t)v5, a2[1], (uint64_t)&v128);
  int v77 = (int)v6;
  unint64_t v127 = 0;
  BOOL boot_time = profile_decoder::get_boot_time(v6, &v127);
  sub_240787F2C((uint64_t)v123);
  int v7 = sub_2407941BC(v124, (uint64_t)"{ ", 2);
  sub_240794060(&v120, "category");
  profile_decoder::key(&v122);
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    io_object_t v8 = &v122;
  }
  else {
    io_object_t v8 = (std::string *)v122.__r_.__value_.__r.__words[0];
  }
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v122.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v122.__r_.__value_.__l.__size_;
  }
  CFDictionaryRef v10 = sub_2407941BC(v7, (uint64_t)v8, size);
  *(void *)((char *)v10 + *(void *)(*v10 - 24) + 24) = 8;
  if (SHIBYTE(v136) < 0)
  {
    sub_240794594(&__dst, (void *)v135, *((unint64_t *)&v135 + 1));
  }
  else
  {
    long long __dst = v135;
    uint64_t v118 = v136;
  }
  profile_decoder::str(&v119);
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v11 = &v119;
  }
  else {
    std::string::size_type v11 = (std::string *)v119.__r_.__value_.__r.__words[0];
  }
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v12 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v12 = v119.__r_.__value_.__l.__size_;
  }
  unint64_t v13 = sub_2407941BC(v10, (uint64_t)v11, v12);
  v14 = sub_2407941BC(v13, (uint64_t)",", 1);
  sub_240794060(&v114, "component");
  profile_decoder::key(&v116);
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    time_t v15 = &v116;
  }
  else {
    time_t v15 = (std::string *)v116.__r_.__value_.__r.__words[0];
  }
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v16 = HIBYTE(v116.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v16 = v116.__r_.__value_.__l.__size_;
  }
  uint64_t v17 = sub_2407941BC(v14, (uint64_t)v15, v16);
  *(void *)((char *)v17 + *(void *)(*v17 - 24) + 24) = 8;
  if (SHIBYTE(v134) < 0)
  {
    sub_240794594(&v111, (void *)v133, *((unint64_t *)&v133 + 1));
  }
  else
  {
    long long v111 = v133;
    uint64_t v112 = v134;
  }
  profile_decoder::str(&v113);
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v18 = &v113;
  }
  else {
    v18 = (std::string *)v113.__r_.__value_.__r.__words[0];
  }
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v19 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v19 = v113.__r_.__value_.__l.__size_;
  }
  unsigned int v20 = sub_2407941BC(v17, (uint64_t)v18, v19);
  std::string::size_type v21 = sub_2407941BC(v20, (uint64_t)",", 1);
  sub_240794060(&v108, "event");
  profile_decoder::key(&v110);
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v22 = &v110;
  }
  else {
    v22 = (std::string *)v110.__r_.__value_.__r.__words[0];
  }
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v23 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v23 = v110.__r_.__value_.__l.__size_;
  }
  v24 = sub_2407941BC(v21, (uint64_t)v22, v23);
  *(void *)((char *)v24 + *(void *)(*v24 - 24) + 24) = 12;
  if (SHIBYTE(v132) < 0)
  {
    sub_240794594(&v105, (void *)v131, *((unint64_t *)&v131 + 1));
  }
  else
  {
    long long v105 = v131;
    uint64_t v106 = v132;
  }
  profile_decoder::str(&v107);
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v25 = &v107;
  }
  else {
    v25 = (std::string *)v107.__r_.__value_.__r.__words[0];
  }
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v26 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v26 = v107.__r_.__value_.__l.__size_;
  }
  int v27 = sub_2407941BC(v24, (uint64_t)v25, v26);
  __int16 v28 = sub_2407941BC(v27, (uint64_t)",", 1);
  sub_240794060(&v102, "type");
  profile_decoder::key(&v104);
  if ((v104.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v29 = &v104;
  }
  else {
    int v29 = (std::string *)v104.__r_.__value_.__r.__words[0];
  }
  if ((v104.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v30 = HIBYTE(v104.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v30 = v104.__r_.__value_.__l.__size_;
  }
  std::string::size_type v31 = sub_2407941BC(v28, (uint64_t)v29, v30);
  *(void *)((char *)v31 + *(void *)(*v31 - 24) + 24) = 12;
  if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0) {
    sub_240794594(&v100, v130.__r_.__value_.__l.__data_, v130.__r_.__value_.__l.__size_);
  }
  else {
    std::string v100 = v130;
  }
  profile_decoder::str(&v101);
  if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v32 = &v101;
  }
  else {
    uint64_t v32 = (std::string *)v101.__r_.__value_.__r.__words[0];
  }
  if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v33 = HIBYTE(v101.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v33 = v101.__r_.__value_.__l.__size_;
  }
  v34 = sub_2407941BC(v31, (uint64_t)v32, v33);
  std::string::size_type v35 = sub_2407941BC(v34, (uint64_t)",", 1);
  sub_240794060(&v97, "timestamp");
  profile_decoder::key(&v99);
  if ((v99.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v36 = &v99;
  }
  else {
    v36 = (std::string *)v99.__r_.__value_.__r.__words[0];
  }
  if ((v99.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v37 = HIBYTE(v99.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v37 = v99.__r_.__value_.__l.__size_;
  }
  v38 = sub_2407941BC(v35, (uint64_t)v36, v37);
  *(void *)((char *)v38 + *(void *)(*v38 - 24) + 24) = 10;
  v39 = (void *)std::ostream::operator<<();
  std::string::size_type v40 = sub_2407941BC(v39, (uint64_t)",", 1);
  sub_240794060(&v94, "sequence_num");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v42 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v42 = __p.__r_.__value_.__l.__size_;
  }
  v43 = sub_2407941BC(v40, (uint64_t)p_p, v42);
  *(void *)((char *)v43 + *(void *)(*v43 - 24) + 24) = 10;
  v44 = (void *)std::ostream::operator<<();
  sub_2407941BC(v44, (uint64_t)",", 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v95 < 0) {
    operator delete(v94);
  }
  if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v99.__r_.__value_.__l.__data_);
  }
  if (v98 < 0) {
    operator delete(v97);
  }
  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v101.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v100.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v104.__r_.__value_.__l.__data_);
  }
  if (v103 < 0) {
    operator delete(v102);
  }
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v107.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v106) < 0) {
    operator delete((void *)v105);
  }
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v110.__r_.__value_.__l.__data_);
  }
  if (v109 < 0) {
    operator delete(v108);
  }
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v113.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v112) < 0) {
    operator delete((void *)v111);
  }
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v116.__r_.__value_.__l.__data_);
  }
  if (v115 < 0) {
    operator delete(v114);
  }
  if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v119.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v118) < 0) {
    operator delete((void *)__dst);
  }
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v122.__r_.__value_.__l.__data_);
  }
  if (v121 < 0) {
    operator delete(v120);
  }
  (*(void (**)(uint64_t, void *, void *))(*(void *)a1 + 32))(a1, v123, a2);
  sub_240794060(&v92, "type-id");
  profile_decoder::key(&v122);
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v45 = &v122;
  }
  else {
    std::string::size_type v45 = (std::string *)v122.__r_.__value_.__r.__words[0];
  }
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v46 = HIBYTE(v122.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v46 = v122.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v124, (uint64_t)v45, v46);
  v47 = (void *)std::ostream::operator<<();
  v48 = sub_2407941BC(v47, (uint64_t)",", 1);
  sub_240794060(&v90, "category-id");
  profile_decoder::key(&v119);
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v49 = &v119;
  }
  else {
    v49 = (std::string *)v119.__r_.__value_.__r.__words[0];
  }
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v50 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v50 = v119.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v48, (uint64_t)v49, v50);
  v51 = (void *)std::ostream::operator<<();
  v52 = sub_2407941BC(v51, (uint64_t)",", 1);
  sub_240794060(&v88, "component-id");
  profile_decoder::key(&v116);
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v53 = &v116;
  }
  else {
    v53 = (std::string *)v116.__r_.__value_.__r.__words[0];
  }
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v54 = HIBYTE(v116.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v54 = v116.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v52, (uint64_t)v53, v54);
  std::string::size_type v55 = (void *)std::ostream::operator<<();
  v56 = sub_2407941BC(v55, (uint64_t)",", 1);
  sub_240794060(&v86, "event-id");
  profile_decoder::key(&v113);
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v57 = &v113;
  }
  else {
    v57 = (std::string *)v113.__r_.__value_.__r.__words[0];
  }
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v58 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v58 = v113.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v56, (uint64_t)v57, v58);
  v59 = (void *)std::ostream::operator<<();
  v60 = sub_2407941BC(v59, (uint64_t)",", 1);
  sub_240794060(&v84, "binary-data");
  profile_decoder::key(&v110);
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v61 = &v110;
  }
  else {
    std::string::size_type v61 = (std::string *)v110.__r_.__value_.__r.__words[0];
  }
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v62 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v62 = v110.__r_.__value_.__l.__size_;
  }
  v63 = (profile_decoder *)sub_2407941BC(v60, (uint64_t)v61, v62);
  profile_decoder::dump(v63, a2, 48);
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v64 = &v107;
  }
  else {
    v64 = (std::string *)v107.__r_.__value_.__r.__words[0];
  }
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v65 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v65 = v107.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v63, (uint64_t)v64, v65);
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v107.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v110.__r_.__value_.__l.__data_);
  }
  if (v85 < 0) {
    operator delete(v84);
  }
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v113.__r_.__value_.__l.__data_);
  }
  if (v87 < 0) {
    operator delete(v86);
  }
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v116.__r_.__value_.__l.__data_);
  }
  if (v89 < 0) {
    operator delete(v88);
  }
  if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v119.__r_.__value_.__l.__data_);
  }
  if (v91 < 0) {
    operator delete(v90);
  }
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v122.__r_.__value_.__l.__data_);
  }
  if (v93 < 0) {
    operator delete(v92);
  }
  if (v77)
  {
    std::string::size_type v66 = sub_2407941BC(v124, (uint64_t)",", 1);
    sub_240794060(&v82, "calendar-time");
    profile_decoder::key(&v122);
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v67 = &v122;
    }
    else {
      v67 = (std::string *)v122.__r_.__value_.__r.__words[0];
    }
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v68 = HIBYTE(v122.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v68 = v122.__r_.__value_.__l.__size_;
    }
    v69 = sub_2407941BC(v66, (uint64_t)v67, v68);
    if (SHIBYTE(v129) < 0)
    {
      sub_240794594(v80, (void *)v128, *((unint64_t *)&v128 + 1));
    }
    else
    {
      *(_OWORD *)v80 = v128;
      uint64_t v81 = v129;
    }
    profile_decoder::str(&v119);
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v70 = &v119;
    }
    else {
      v70 = (std::string *)v119.__r_.__value_.__r.__words[0];
    }
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v71 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v71 = v119.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v69, (uint64_t)v70, v71);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v119.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v81) < 0) {
      operator delete(v80[0]);
    }
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v122.__r_.__value_.__l.__data_);
    }
    if (v83 < 0) {
      operator delete(v82);
    }
  }
  if (boot_time)
  {
    v72 = sub_2407941BC(v124, (uint64_t)",", 1);
    sub_240794060(&v78, "boot-timestamp");
    profile_decoder::key(&v122);
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v73 = &v122;
    }
    else {
      v73 = (std::string *)v122.__r_.__value_.__r.__words[0];
    }
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v74 = HIBYTE(v122.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v74 = v122.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v72, (uint64_t)v73, v74);
    std::ostream::operator<<();
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v122.__r_.__value_.__l.__data_);
    }
    if (v79 < 0) {
      operator delete(v78);
    }
  }
  sub_2407941BC(v124, (uint64_t)"}", 1);
  std::stringbuf::str();
  v123[0] = *MEMORY[0x263F8C2B8];
  uint64_t v75 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v123 + *(void *)(v123[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v124[0] = v75;
  v124[1] = MEMORY[0x263F8C318] + 16;
  if (v125 < 0) {
    operator delete((void *)v124[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2455F8FF0](&v126);
  if (SHIBYTE(v129) < 0) {
    operator delete((void *)v128);
  }
  if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v130.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v132) < 0) {
    operator delete((void *)v131);
  }
  if (SHIBYTE(v134) < 0) {
    operator delete((void *)v133);
  }
  if (SHIBYTE(v136) < 0) {
    operator delete((void *)v135);
  }
}

void sub_24078C518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (SLOBYTE(STACK[0x2C7]) < 0) {
    operator delete((void *)STACK[0x2B0]);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  sub_240788204((uint64_t)&STACK[0x2C8]);
  if (*(char *)(v24 - 193) < 0) {
    operator delete(*(void **)(v24 - 216));
  }
  if (*(char *)(v24 - 169) < 0) {
    operator delete(*(void **)(v24 - 192));
  }
  if (*(char *)(v24 - 145) < 0) {
    operator delete(*(void **)(v24 - 168));
  }
  if (*(char *)(v24 - 121) < 0) {
    operator delete(*(void **)(v24 - 144));
  }
  if (*(char *)(v24 - 97) < 0) {
    operator delete(*(void **)(v24 - 120));
  }
  _Unwind_Resume(a1);
}

std::string *execution_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4BD8, __val, 6u, a2);
}

std::string *execution_decoder::event_name@<X0>(profile_decoder *a1@<X2>, int a2@<W1>, std::string *a3@<X8>)
{
  unsigned int v4 = a1;
  switch(a2)
  {
    case 0:
      size_t v5 = (const entry *)&unk_2650D4C38;
      unsigned int v6 = 3;
      goto LABEL_3;
    case 1:
      size_t v5 = (const entry *)&unk_2650D4C68;
      goto LABEL_9;
    case 2:
      size_t v5 = (const entry *)&unk_2650D4C78;
      unsigned int v6 = 2;
      goto LABEL_3;
    case 3:
      size_t v5 = (const entry *)&unk_2650D4C98;
      unsigned int v6 = 8;
      goto LABEL_3;
    case 4:
      size_t v5 = (const entry *)&unk_2650D4D18;
LABEL_9:
      unsigned int v6 = 1;
LABEL_3:
      uint64_t result = profile_decoder::find_in_table(v5, v4, v6, a3);
      break;
    default:
      uint64_t result = std::to_string(a3, a1);
      break;
  }
  return result;
}

std::string *trace_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4D28, __val, 4u, a2);
}

std::string *trace_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sensor_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4D68, __val, 7u, a2);
}

std::string *sensor_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4DD8, __val, 0xDu, a2);
}

std::string *sphere_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_2650D4EA8, __val, 1u, a2);
}

std::string *sphere_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4EB8, __val, 3u, a2);
}

std::string *cumulus_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_2650D4EE8, __val, 1u, a2);
}

std::string *cumulus_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4EF8, __val, 2u, a2);
}

void cumulus_decoder::parse_datatype(uint64_t a1, uint64_t a2, int *a3)
{
  int v6 = *a3;
  if (*a3 == 67108867)
  {
    sub_240794060(&v137, "arg1");
    profile_decoder::key(&v139);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v7 = &v139;
    }
    else {
      int v7 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v139.__r_.__value_.__l.__size_;
    }
    uint64_t v9 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v7, size);
    *(void *)((char *)v9 + *(void *)(*v9 - 24) + 24) = 10;
    CFDictionaryRef v10 = (void *)std::ostream::operator<<();
    std::string::size_type v11 = sub_2407941BC(v10, (uint64_t)",", 1);
    sub_240794060(&v134, "arg2");
    profile_decoder::key(&v136);
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v12 = &v136;
    }
    else {
      std::string::size_type v12 = (std::string *)v136.__r_.__value_.__r.__words[0];
    }
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v13 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v13 = v136.__r_.__value_.__l.__size_;
    }
    v14 = sub_2407941BC(v11, (uint64_t)v12, v13);
    *(void *)((char *)v14 + *(void *)(*v14 - 24) + 24) = 10;
    time_t v15 = (void *)std::ostream::operator<<();
    std::string::size_type v16 = sub_2407941BC(v15, (uint64_t)",", 1);
    sub_240794060(&v131, "arg3");
    profile_decoder::key(&v133);
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v17 = &v133;
    }
    else {
      uint64_t v17 = (std::string *)v133.__r_.__value_.__r.__words[0];
    }
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v18 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v18 = v133.__r_.__value_.__l.__size_;
    }
    std::string::size_type v19 = sub_2407941BC(v16, (uint64_t)v17, v18);
    *(void *)((char *)v19 + *(void *)(*v19 - 24) + 24) = 10;
    unsigned int v20 = (void *)std::ostream::operator<<();
    std::string::size_type v21 = sub_2407941BC(v20, (uint64_t)",", 1);
    sub_240794060(&v128, "arg4");
    profile_decoder::key(&v130);
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v22 = &v130;
    }
    else {
      v22 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v23 = HIBYTE(v130.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v23 = v130.__r_.__value_.__l.__size_;
    }
    uint64_t v24 = sub_2407941BC(v21, (uint64_t)v22, v23);
    *(void *)((char *)v24 + *(void *)(*v24 - 24) + 24) = 10;
    v25 = (void *)std::ostream::operator<<();
    std::string::size_type v26 = sub_2407941BC(v25, (uint64_t)",", 1);
    sub_240794060(&v125, "arg5");
    profile_decoder::key(&v127);
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v27 = &v127;
    }
    else {
      int v27 = (std::string *)v127.__r_.__value_.__r.__words[0];
    }
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v28 = HIBYTE(v127.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v28 = v127.__r_.__value_.__l.__size_;
    }
    int v29 = sub_2407941BC(v26, (uint64_t)v27, v28);
    *(void *)((char *)v29 + *(void *)(*v29 - 24) + 24) = 10;
    std::string::size_type v30 = (void *)std::ostream::operator<<();
    std::string::size_type v31 = sub_2407941BC(v30, (uint64_t)",", 1);
    sub_240794060(&v122, "arg6");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v32 = &v124;
    }
    else {
      uint64_t v32 = (std::string *)v124.__r_.__value_.__r.__words[0];
    }
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v33 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v33 = v124.__r_.__value_.__l.__size_;
    }
    v34 = sub_2407941BC(v31, (uint64_t)v32, v33);
    *(void *)((char *)v34 + *(void *)(*v34 - 24) + 24) = 10;
    std::string::size_type v35 = (void *)std::ostream::operator<<();
    v36 = sub_2407941BC(v35, (uint64_t)",", 1);
    sub_240794060(&v119, "x");
    profile_decoder::key(&v121);
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v37 = &v121;
    }
    else {
      std::string::size_type v37 = (std::string *)v121.__r_.__value_.__r.__words[0];
    }
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v38 = HIBYTE(v121.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v38 = v121.__r_.__value_.__l.__size_;
    }
    v39 = sub_2407941BC(v36, (uint64_t)v37, v38);
    *(void *)((char *)v39 + *(void *)(*v39 - 24) + 24) = 10;
    std::string::size_type v40 = (void *)std::ostream::operator<<();
    v41 = sub_2407941BC(v40, (uint64_t)",", 1);
    sub_240794060(&v116, "y");
    profile_decoder::key(&v118);
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v42 = &v118;
    }
    else {
      std::string::size_type v42 = (std::string *)v118.__r_.__value_.__r.__words[0];
    }
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v43 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v43 = v118.__r_.__value_.__l.__size_;
    }
    v44 = sub_2407941BC(v41, (uint64_t)v42, v43);
    *(void *)((char *)v44 + *(void *)(*v44 - 24) + 24) = 10;
    std::string::size_type v45 = (void *)std::ostream::operator<<();
    std::string::size_type v46 = sub_2407941BC(v45, (uint64_t)",", 1);
    sub_240794060(&v113, "z");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v48 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v48 = __p.__r_.__value_.__l.__size_;
    }
    v49 = sub_2407941BC(v46, (uint64_t)p_p, v48);
    *(void *)((char *)v49 + *(void *)(*v49 - 24) + 24) = 10;
    std::string::size_type v50 = (void *)std::ostream::operator<<();
    sub_2407941BC(v50, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v114 < 0) {
      operator delete(v113);
    }
    if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v118.__r_.__value_.__l.__data_);
    }
    if (v117 < 0) {
      operator delete(v116);
    }
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v121.__r_.__value_.__l.__data_);
    }
    if (v120 < 0) {
      operator delete(v119);
    }
    if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v124.__r_.__value_.__l.__data_);
    }
    if (v123 < 0) {
      operator delete(v122);
    }
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v127.__r_.__value_.__l.__data_);
    }
    if (v126 < 0) {
      operator delete(v125);
    }
    if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v130.__r_.__value_.__l.__data_);
    }
    if (v129 < 0) {
      operator delete(v128);
    }
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v133.__r_.__value_.__l.__data_);
    }
    if (v132 < 0) {
      operator delete(v131);
    }
    if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v136.__r_.__value_.__l.__data_);
    }
    if (v135 < 0) {
      operator delete(v134);
    }
    if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v139.__r_.__value_.__l.__data_);
    }
    if (v138 < 0) {
      operator delete(v137);
    }
    int v6 = *a3;
  }
  if (v6 == 67109123)
  {
    sub_240794060(&v111, "arg1");
    profile_decoder::key(&v139);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v51 = &v139;
    }
    else {
      v51 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v52 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v52 = v139.__r_.__value_.__l.__size_;
    }
    v53 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v51, v52);
    *(void *)((char *)v53 + *(void *)(*v53 - 24) + 24) = 10;
    std::string::size_type v54 = (void *)std::ostream::operator<<();
    std::string::size_type v55 = sub_2407941BC(v54, (uint64_t)",", 1);
    sub_240794060(&v109, "arg2");
    profile_decoder::key(&v136);
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v56 = &v136;
    }
    else {
      v56 = (std::string *)v136.__r_.__value_.__r.__words[0];
    }
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v57 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v57 = v136.__r_.__value_.__l.__size_;
    }
    std::string::size_type v58 = sub_2407941BC(v55, (uint64_t)v56, v57);
    *(void *)((char *)v58 + *(void *)(*v58 - 24) + 24) = 10;
    v59 = (void *)std::ostream::operator<<();
    v60 = sub_2407941BC(v59, (uint64_t)",", 1);
    sub_240794060(&v107, "arg3");
    profile_decoder::key(&v133);
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v61 = &v133;
    }
    else {
      std::string::size_type v61 = (std::string *)v133.__r_.__value_.__r.__words[0];
    }
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v62 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v62 = v133.__r_.__value_.__l.__size_;
    }
    v63 = sub_2407941BC(v60, (uint64_t)v61, v62);
    *(void *)((char *)v63 + *(void *)(*v63 - 24) + 24) = 10;
    v64 = (void *)std::ostream::operator<<();
    std::string::size_type v65 = sub_2407941BC(v64, (uint64_t)",", 1);
    sub_240794060(&v105, "arg4");
    profile_decoder::key(&v130);
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v66 = &v130;
    }
    else {
      std::string::size_type v66 = (std::string *)v130.__r_.__value_.__r.__words[0];
    }
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v67 = HIBYTE(v130.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v67 = v130.__r_.__value_.__l.__size_;
    }
    std::string::size_type v68 = sub_2407941BC(v65, (uint64_t)v66, v67);
    *(void *)((char *)v68 + *(void *)(*v68 - 24) + 24) = 10;
    v69 = (void *)std::ostream::operator<<();
    v70 = sub_2407941BC(v69, (uint64_t)",", 1);
    sub_240794060(&v103, "arg5");
    profile_decoder::key(&v127);
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v71 = &v127;
    }
    else {
      std::string::size_type v71 = (std::string *)v127.__r_.__value_.__r.__words[0];
    }
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v72 = HIBYTE(v127.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v72 = v127.__r_.__value_.__l.__size_;
    }
    v73 = sub_2407941BC(v70, (uint64_t)v71, v72);
    *(void *)((char *)v73 + *(void *)(*v73 - 24) + 24) = 10;
    std::string::size_type v74 = (void *)std::ostream::operator<<();
    uint64_t v75 = sub_2407941BC(v74, (uint64_t)",", 1);
    sub_240794060(&v101, "arg6");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v76 = &v124;
    }
    else {
      std::string::size_type v76 = (std::string *)v124.__r_.__value_.__r.__words[0];
    }
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v77 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v77 = v124.__r_.__value_.__l.__size_;
    }
    v78 = sub_2407941BC(v75, (uint64_t)v76, v77);
    *(void *)((char *)v78 + *(void *)(*v78 - 24) + 24) = 10;
    char v79 = (void *)std::ostream::operator<<();
    v80 = sub_2407941BC(v79, (uint64_t)",", 1);
    sub_240794060(&v99, "x");
    profile_decoder::key(&v121);
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v81 = &v121;
    }
    else {
      uint64_t v81 = (std::string *)v121.__r_.__value_.__r.__words[0];
    }
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v82 = HIBYTE(v121.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v82 = v121.__r_.__value_.__l.__size_;
    }
    char v83 = sub_2407941BC(v80, (uint64_t)v81, v82);
    *(void *)((char *)v83 + *(void *)(*v83 - 24) + 24) = 10;
    v84 = (void *)std::ostream::operator<<();
    char v85 = sub_2407941BC(v84, (uint64_t)",", 1);
    sub_240794060(&v97, "y");
    profile_decoder::key(&v118);
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v86 = &v118;
    }
    else {
      std::string::size_type v86 = (std::string *)v118.__r_.__value_.__r.__words[0];
    }
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v87 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v87 = v118.__r_.__value_.__l.__size_;
    }
    v88 = sub_2407941BC(v85, (uint64_t)v86, v87);
    *(void *)((char *)v88 + *(void *)(*v88 - 24) + 24) = 10;
    char v89 = (void *)std::ostream::operator<<();
    v90 = sub_2407941BC(v89, (uint64_t)",", 1);
    sub_240794060(&v95, "z");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v91 = &__p;
    }
    else {
      char v91 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v92 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v92 = __p.__r_.__value_.__l.__size_;
    }
    char v93 = sub_2407941BC(v90, (uint64_t)v91, v92);
    *(void *)((char *)v93 + *(void *)(*v93 - 24) + 24) = 10;
    v94 = (void *)std::ostream::operator<<();
    sub_2407941BC(v94, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v96 < 0) {
      operator delete(v95);
    }
    if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v118.__r_.__value_.__l.__data_);
    }
    if (v98 < 0) {
      operator delete(v97);
    }
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v121.__r_.__value_.__l.__data_);
    }
    if (v100 < 0) {
      operator delete(v99);
    }
    if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v124.__r_.__value_.__l.__data_);
    }
    if (v102 < 0) {
      operator delete(v101);
    }
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v127.__r_.__value_.__l.__data_);
    }
    if (v104 < 0) {
      operator delete(v103);
    }
    if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v130.__r_.__value_.__l.__data_);
    }
    if (v106 < 0) {
      operator delete(v105);
    }
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v133.__r_.__value_.__l.__data_);
    }
    if (v108 < 0) {
      operator delete(v107);
    }
    if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v136.__r_.__value_.__l.__data_);
    }
    if (v110 < 0) {
      operator delete(v109);
    }
    if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v139.__r_.__value_.__l.__data_);
    }
    if (v112 < 0) {
      operator delete(v111);
    }
  }
  else
  {
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
  }
}

void sub_24078D674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  if (a72 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a76 < 0) {
    operator delete(a75);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a78 < 0) {
    operator delete(a77);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a80 < 0) {
    operator delete(a79);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (*(char *)(v80 - 209) < 0) {
    operator delete(*(void **)(v80 - 232));
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (*(char *)(v80 - 161) < 0) {
    operator delete(*(void **)(v80 - 184));
  }
  if (a51 < 0) {
    operator delete(a46);
  }
  if (*(char *)(v80 - 113) < 0) {
    operator delete(*(void **)(v80 - 136));
  }
  if (a57 < 0) {
    operator delete(a52);
  }
  if (*(char *)(v80 - 65) < 0) {
    operator delete(*(void **)(v80 - 88));
  }
  if (a63 < 0) {
    operator delete(a58);
  }
  _Unwind_Resume(a1);
}

std::string *interrupt_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_2650D4F18, __val, 1u, a2);
}

std::string *interrupt_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_2650D4F28, __val, 1u, a2);
}

std::string *uart_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4F38, __val, 3u, a2);
}

std::string *uart_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4F68, __val, 8u, a2);
}

std::string *sshb_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D4FE8, __val, 8u, a2);
}

std::string *sshb_decoder::event_name@<X0>(unsigned int __val@<W2>, int a2@<W1>, std::string *a3@<X8>)
{
  if (a2 == 3) {
    unsigned int v4 = (const entry *)&unk_2650D5068;
  }
  else {
    unsigned int v4 = (const entry *)&unk_2650D50E8;
  }
  return profile_decoder::find_in_table(v4, __val, 8u, a3);
}

std::string *sshb_decoder::subtype_name@<X0>(sshb_decoder *this@<X0>, profile_decoder *a2@<X2>, int a3@<W1>, std::string *a4@<X8>)
{
  unsigned int v4 = a2;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
      size_t v5 = (const entry *)&unk_2650D5168;
      unsigned int v6 = 113;
      goto LABEL_3;
    case 3:
      uint64_t result = (std::string *)(*(uint64_t (**)(sshb_decoder *, uint64_t, profile_decoder *))(*(void *)this + 24))(this, 3, a2);
      break;
    case 7:
      size_t v5 = (const entry *)&unk_2650D5878;
      unsigned int v6 = 17;
LABEL_3:
      uint64_t result = profile_decoder::find_in_table(v5, v4, v6, a4);
      break;
    default:
      uint64_t result = std::to_string(a4, a2);
      break;
  }
  return result;
}

void sshb_decoder::parse_datatype(sshb_decoder *a1, uint64_t a2, int *a3)
{
  int v6 = *a3;
  int v7 = BYTE2(*a3);
  int v8 = *a3;
  if (v8 == 3)
  {
    sub_240794060(&v737, "trace");
    profile_decoder::key(&v739);
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &v739;
    }
    else {
      uint64_t v9 = (std::string *)v739.__r_.__value_.__r.__words[0];
    }
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v739.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v739.__r_.__value_.__l.__size_;
    }
    std::string::size_type v11 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v9, size);
    *(void *)((char *)v11 + *(void *)(*v11 - 24) + 24) = 25;
    sshb_decoder::subtype_name(a1, (profile_decoder *)a3[4], v7, &v735);
    profile_decoder::str(&v736);
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v12 = &v736;
    }
    else {
      std::string::size_type v12 = (std::string *)v736.__r_.__value_.__r.__words[0];
    }
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v13 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v13 = v736.__r_.__value_.__l.__size_;
    }
    v14 = sub_2407941BC(v11, (uint64_t)v12, v13);
    time_t v15 = sub_2407941BC(v14, (uint64_t)",", 1);
    sub_240794060(&v732, "thread");
    profile_decoder::key(&v734);
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v16 = &v734;
    }
    else {
      std::string::size_type v16 = (std::string *)v734.__r_.__value_.__r.__words[0];
    }
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v17 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v17 = v734.__r_.__value_.__l.__size_;
    }
    std::string::size_type v18 = sub_2407941BC(v15, (uint64_t)v16, v17);
    *(void *)((char *)v18 + *(void *)(*v18 - 24) + 24) = 10;
    std::string::size_type v19 = (void *)std::ostream::operator<<();
    unsigned int v20 = sub_2407941BC(v19, (uint64_t)",", 1);
    sub_240794060(&v729, "arg1");
    profile_decoder::key(&v731);
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v21 = &v731;
    }
    else {
      std::string::size_type v21 = (std::string *)v731.__r_.__value_.__r.__words[0];
    }
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v22 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v22 = v731.__r_.__value_.__l.__size_;
    }
    std::string::size_type v23 = sub_2407941BC(v20, (uint64_t)v21, v22);
    *(void *)((char *)v23 + *(void *)(*v23 - 24) + 24) = 10;
    uint64_t v24 = (void *)std::ostream::operator<<();
    v25 = sub_2407941BC(v24, (uint64_t)",", 1);
    sub_240794060(&v726, "arg2");
    profile_decoder::key(&v728);
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v26 = &v728;
    }
    else {
      std::string::size_type v26 = (std::string *)v728.__r_.__value_.__r.__words[0];
    }
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v27 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v27 = v728.__r_.__value_.__l.__size_;
    }
    std::string::size_type v28 = sub_2407941BC(v25, (uint64_t)v26, v27);
    *(void *)((char *)v28 + *(void *)(*v28 - 24) + 24) = 10;
    int v29 = (void *)std::ostream::operator<<();
    std::string::size_type v30 = sub_2407941BC(v29, (uint64_t)",", 1);
    sub_240794060(&v723, "arg3");
    profile_decoder::key(&v725);
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v31 = &v725;
    }
    else {
      std::string::size_type v31 = (std::string *)v725.__r_.__value_.__r.__words[0];
    }
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v32 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v32 = v725.__r_.__value_.__l.__size_;
    }
    std::string::size_type v33 = sub_2407941BC(v30, (uint64_t)v31, v32);
    *(void *)((char *)v33 + *(void *)(*v33 - 24) + 24) = 10;
    v34 = (void *)std::ostream::operator<<();
    std::string::size_type v35 = sub_2407941BC(v34, (uint64_t)",", 1);
    sub_240794060(&v720, "arg4");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v37 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v37 = __p.__r_.__value_.__l.__size_;
    }
    std::string::size_type v38 = sub_2407941BC(v35, (uint64_t)p_p, v37);
    *(void *)((char *)v38 + *(void *)(*v38 - 24) + 24) = 10;
    v39 = (void *)std::ostream::operator<<();
    sub_2407941BC(v39, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v721 < 0) {
      operator delete(v720);
    }
    if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v725.__r_.__value_.__l.__data_);
    }
    if (v724 < 0) {
      operator delete(v723);
    }
    if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v728.__r_.__value_.__l.__data_);
    }
    if (v727 < 0) {
      operator delete(v726);
    }
    if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v731.__r_.__value_.__l.__data_);
    }
    if (v730 < 0) {
      operator delete(v729);
    }
    if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v734.__r_.__value_.__l.__data_);
    }
    if (v733 < 0) {
      operator delete(v732);
    }
    if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v736.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v735.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v735.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v739.__r_.__value_.__l.__data_);
    }
    if (v738 < 0) {
      operator delete(v737);
    }
    if (v7 == 7)
    {
      sub_240794060(&v510, "trace");
      profile_decoder::key(&v739);
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v40 = &v739;
      }
      else {
        std::string::size_type v40 = (std::string *)v739.__r_.__value_.__r.__words[0];
      }
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v41 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v41 = v739.__r_.__value_.__l.__size_;
      }
      std::string::size_type v42 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v40, v41);
      *(void *)((char *)v42 + *(void *)(*v42 - 24) + 24) = 25;
      profile_decoder::find_in_table((const entry *)&unk_2650D5878, a3[4], 0x11u, &v509);
      profile_decoder::str(&v736);
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v43 = &v736;
      }
      else {
        std::string::size_type v43 = (std::string *)v736.__r_.__value_.__r.__words[0];
      }
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v44 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v44 = v736.__r_.__value_.__l.__size_;
      }
      std::string::size_type v45 = sub_2407941BC(v42, (uint64_t)v43, v44);
      std::string::size_type v46 = sub_2407941BC(v45, (uint64_t)",", 1);
      sub_240794060(&v507, "thread");
      profile_decoder::key(&v734);
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v47 = &v734;
      }
      else {
        v47 = (std::string *)v734.__r_.__value_.__r.__words[0];
      }
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v48 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v48 = v734.__r_.__value_.__l.__size_;
      }
      v49 = sub_2407941BC(v46, (uint64_t)v47, v48);
      *(void *)((char *)v49 + *(void *)(*v49 - 24) + 24) = 10;
      std::string::size_type v50 = (void *)std::ostream::operator<<();
      v51 = sub_2407941BC(v50, (uint64_t)",", 1);
      sub_240794060(&v505, "arg1");
      profile_decoder::key(&v731);
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v52 = &v731;
      }
      else {
        std::string::size_type v52 = (std::string *)v731.__r_.__value_.__r.__words[0];
      }
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v53 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v53 = v731.__r_.__value_.__l.__size_;
      }
      std::string::size_type v54 = sub_2407941BC(v51, (uint64_t)v52, v53);
      *(void *)((char *)v54 + *(void *)(*v54 - 24) + 24) = 10;
      std::string::size_type v55 = (void *)std::ostream::operator<<();
      v56 = sub_2407941BC(v55, (uint64_t)",", 1);
      sub_240794060(&v503, "arg2");
      profile_decoder::key(&v728);
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v57 = &v728;
      }
      else {
        std::string::size_type v57 = (std::string *)v728.__r_.__value_.__r.__words[0];
      }
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v58 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v58 = v728.__r_.__value_.__l.__size_;
      }
      v59 = sub_2407941BC(v56, (uint64_t)v57, v58);
      *(void *)((char *)v59 + *(void *)(*v59 - 24) + 24) = 10;
      v60 = (void *)std::ostream::operator<<();
      std::string::size_type v61 = sub_2407941BC(v60, (uint64_t)",", 1);
      sub_240794060(&v501, "arg3");
      profile_decoder::key(&v725);
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v62 = &v725;
      }
      else {
        std::string::size_type v62 = (std::string *)v725.__r_.__value_.__r.__words[0];
      }
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v63 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v63 = v725.__r_.__value_.__l.__size_;
      }
      v64 = sub_2407941BC(v61, (uint64_t)v62, v63);
      *(void *)((char *)v64 + *(void *)(*v64 - 24) + 24) = 10;
      std::string::size_type v65 = (void *)std::ostream::operator<<();
      std::string::size_type v66 = sub_2407941BC(v65, (uint64_t)",", 1);
      sub_240794060(&v499, "arg4");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v67 = &__p;
      }
      else {
        std::string::size_type v67 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v68 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v68 = __p.__r_.__value_.__l.__size_;
      }
      v69 = sub_2407941BC(v66, (uint64_t)v67, v68);
      *(void *)((char *)v69 + *(void *)(*v69 - 24) + 24) = 10;
      v70 = (void *)std::ostream::operator<<();
      sub_2407941BC(v70, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v500 < 0) {
        operator delete(v499);
      }
      if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v725.__r_.__value_.__l.__data_);
      }
      if (v502 < 0) {
        operator delete(v501);
      }
      if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v728.__r_.__value_.__l.__data_);
      }
      if (v504 < 0) {
        operator delete(v503);
      }
      if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v731.__r_.__value_.__l.__data_);
      }
      if (v506 < 0) {
        operator delete(v505);
      }
      if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v734.__r_.__value_.__l.__data_);
      }
      if (v508 < 0) {
        operator delete(v507);
      }
      if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v736.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v509.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v509.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v739.__r_.__value_.__l.__data_);
      }
      if (v511 < 0)
      {
        std::string::size_type v71 = v510;
LABEL_1162:
        operator delete(v71);
        return;
      }
      return;
    }
LABEL_1163:
    profile_decoder::parse_datatype((uint64_t)a1, a2, (uint64_t)a3);
    return;
  }
  int v72 = BYTE1(v6);
  if (v8 == 2 && BYTE1(v6) != 2)
  {
    if (BYTE1(v6) == 3)
    {
      sub_240794060(&v718, "status-timestamp");
      profile_decoder::key(&v739);
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string v139 = &v739;
      }
      else {
        std::string v139 = (std::string *)v739.__r_.__value_.__r.__words[0];
      }
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v140 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v140 = v739.__r_.__value_.__l.__size_;
      }
      v141 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v139, v140);
      *(void *)((char *)v141 + *(void *)(*v141 - 24) + 24) = 10;
      v142 = (void *)std::ostream::operator<<();
      std::string::size_type v143 = sub_2407941BC(v142, (uint64_t)",", 1);
      sub_240794060(&v716, "fingerState");
      profile_decoder::key(&v736);
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v144 = &v736;
      }
      else {
        v144 = (std::string *)v736.__r_.__value_.__r.__words[0];
      }
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v145 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v145 = v736.__r_.__value_.__l.__size_;
      }
      v146 = sub_2407941BC(v143, (uint64_t)v144, v145);
      *(void *)((char *)v146 + *(void *)(*v146 - 24) + 24) = 10;
      v147 = (void *)std::ostream::operator<<();
      std::string::size_type v148 = sub_2407941BC(v147, (uint64_t)",", 1);
      sub_240794060(&v714, "buttonState");
      profile_decoder::key(&v734);
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v149 = &v734;
      }
      else {
        v149 = (std::string *)v734.__r_.__value_.__r.__words[0];
      }
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v150 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v150 = v734.__r_.__value_.__l.__size_;
      }
      v151 = sub_2407941BC(v148, (uint64_t)v149, v150);
      *(void *)((char *)v151 + *(void *)(*v151 - 24) + 24) = 10;
      v152 = (void *)std::ostream::operator<<();
      std::string::size_type v153 = sub_2407941BC(v152, (uint64_t)",", 1);
      sub_240794060(&v712, "buttonProgress");
      profile_decoder::key(&v731);
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v154 = &v731;
      }
      else {
        v154 = (std::string *)v731.__r_.__value_.__r.__words[0];
      }
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v155 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v155 = v731.__r_.__value_.__l.__size_;
      }
      v156 = sub_2407941BC(v153, (uint64_t)v154, v155);
      *(void *)((char *)v156 + *(void *)(*v156 - 24) + 24) = 10;
      v157 = (void *)std::ostream::operator<<();
      std::string::size_type v158 = sub_2407941BC(v157, (uint64_t)",", 1);
      sub_240794060(&v710, "clickCount");
      profile_decoder::key(&v728);
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v159 = &v728;
      }
      else {
        v159 = (std::string *)v728.__r_.__value_.__r.__words[0];
      }
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v160 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v160 = v728.__r_.__value_.__l.__size_;
      }
      v161 = sub_2407941BC(v158, (uint64_t)v159, v160);
      *(void *)((char *)v161 + *(void *)(*v161 - 24) + 24) = 10;
      std::string::size_type v162 = (void *)std::ostream::operator<<();
      v163 = sub_2407941BC(v162, (uint64_t)",", 1);
      sub_240794060(&v708, "clickCountIsTerminal");
      profile_decoder::key(&v725);
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v164 = &v725;
      }
      else {
        v164 = (std::string *)v725.__r_.__value_.__r.__words[0];
      }
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v165 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v165 = v725.__r_.__value_.__l.__size_;
      }
      v166 = sub_2407941BC(v163, (uint64_t)v164, v165);
      *(void *)((char *)v166 + *(void *)(*v166 - 24) + 24) = 10;
      v167 = (void *)std::ostream::operator<<();
      v168 = sub_2407941BC(v167, (uint64_t)",", 1);
      sub_240794060(&v706, "clickIsLong");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v169 = &__p;
      }
      else {
        std::string::size_type v169 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v170 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v170 = __p.__r_.__value_.__l.__size_;
      }
      v171 = sub_2407941BC(v168, (uint64_t)v169, v170);
      *(void *)((char *)v171 + *(void *)(*v171 - 24) + 24) = 10;
      v172 = (void *)std::ostream::operator<<();
      v173 = sub_2407941BC(v172, (uint64_t)",", 1);
      sub_240794060(&v703, "clickSpeed");
      profile_decoder::key(&v705);
      if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v174 = &v705;
      }
      else {
        std::string::size_type v174 = (std::string *)v705.__r_.__value_.__r.__words[0];
      }
      if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v175 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v175 = v705.__r_.__value_.__l.__size_;
      }
      v176 = sub_2407941BC(v173, (uint64_t)v174, v175);
      *(void *)((char *)v176 + *(void *)(*v176 - 24) + 24) = 10;
      v177 = (void *)std::ostream::operator<<();
      sub_2407941BC(v177, (uint64_t)",", 1);
      if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v705.__r_.__value_.__l.__data_);
      }
      if (v704 < 0) {
        operator delete(v703);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v707 < 0) {
        operator delete(v706);
      }
      if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v725.__r_.__value_.__l.__data_);
      }
      if (v709 < 0) {
        operator delete(v708);
      }
      if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v728.__r_.__value_.__l.__data_);
      }
      if (v711 < 0) {
        operator delete(v710);
      }
      if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v731.__r_.__value_.__l.__data_);
      }
      if (v713 < 0) {
        operator delete(v712);
      }
      if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v734.__r_.__value_.__l.__data_);
      }
      if (v715 < 0) {
        operator delete(v714);
      }
      if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v736.__r_.__value_.__l.__data_);
      }
      if (v717 < 0) {
        operator delete(v716);
      }
      if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v739.__r_.__value_.__l.__data_);
      }
      if (v719 < 0)
      {
        v178 = v718;
LABEL_1087:
        operator delete(v178);
        goto LABEL_1088;
      }
      goto LABEL_1088;
    }
LABEL_826:
    profile_decoder::parse_datatype((uint64_t)a1, a2, (uint64_t)a3);
    goto LABEL_1088;
  }
  if (v8 != 10) {
    goto LABEL_1088;
  }
  int v74 = *((unsigned __int16 *)a3 + 8);
  if (v74 == 4)
  {
    sub_240794060(&v661, "context-version");
    profile_decoder::key(&v739);
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v179 = &v739;
    }
    else {
      std::string::size_type v179 = (std::string *)v739.__r_.__value_.__r.__words[0];
    }
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v180 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v180 = v739.__r_.__value_.__l.__size_;
    }
    sub_2407941BC((void *)(a2 + 16), (uint64_t)v179, v180);
    v181 = (void *)std::ostream::operator<<();
    v182 = sub_2407941BC(v181, (uint64_t)",", 1);
    sub_240794060(&v659, "mclk_aop_enabled");
    profile_decoder::key(&v736);
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v183 = &v736;
    }
    else {
      v183 = (std::string *)v736.__r_.__value_.__r.__words[0];
    }
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v184 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v184 = v736.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v182, (uint64_t)v183, v184);
    v185 = (void *)std::ostream::operator<<();
    v186 = sub_2407941BC(v185, (uint64_t)",", 1);
    sub_240794060(&v657, "mclk_ap_enabled");
    profile_decoder::key(&v734);
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v187 = &v734;
    }
    else {
      v187 = (std::string *)v734.__r_.__value_.__r.__words[0];
    }
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v188 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v188 = v734.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v186, (uint64_t)v187, v188);
    v189 = (void *)std::ostream::operator<<();
    v190 = sub_2407941BC(v189, (uint64_t)",", 1);
    sub_240794060(&v655, "maggie_aop_enabled");
    profile_decoder::key(&v731);
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v191 = &v731;
    }
    else {
      v191 = (std::string *)v731.__r_.__value_.__r.__words[0];
    }
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v192 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v192 = v731.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v190, (uint64_t)v191, v192);
    std::string::size_type v193 = (void *)std::ostream::operator<<();
    v194 = sub_2407941BC(v193, (uint64_t)",", 1);
    sub_240794060(&v653, "maggie_ap_enabled");
    profile_decoder::key(&v728);
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v195 = &v728;
    }
    else {
      v195 = (std::string *)v728.__r_.__value_.__r.__words[0];
    }
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v196 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v196 = v728.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v194, (uint64_t)v195, v196);
    v197 = (void *)std::ostream::operator<<();
    std::string::size_type v198 = sub_2407941BC(v197, (uint64_t)",", 1);
    sub_240794060(&v651, "maggieBusy");
    profile_decoder::key(&v725);
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v199 = &v725;
    }
    else {
      v199 = (std::string *)v725.__r_.__value_.__r.__words[0];
    }
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v200 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v200 = v725.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v198, (uint64_t)v199, v200);
    std::string::size_type v201 = (void *)std::ostream::operator<<();
    v202 = sub_2407941BC(v201, (uint64_t)",", 1);
    sub_240794060(&v649, "enableARC");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v203 = &__p;
    }
    else {
      v203 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v204 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v204 = __p.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v202, (uint64_t)v203, v204);
    std::string::size_type v205 = (void *)std::ostream::operator<<();
    v206 = sub_2407941BC(v205, (uint64_t)",", 1);
    sub_240794060(&v647, "enableSpkr");
    profile_decoder::key(&v705);
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v207 = &v705;
    }
    else {
      v207 = (std::string *)v705.__r_.__value_.__r.__words[0];
    }
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v208 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v208 = v705.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v206, (uint64_t)v207, v208);
    v209 = (void *)std::ostream::operator<<();
    std::string::size_type v210 = sub_2407941BC(v209, (uint64_t)",", 1);
    sub_240794060(&v645, "mclk_on");
    profile_decoder::key(&v686);
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v211 = &v686;
    }
    else {
      v211 = (std::string *)v686.__r_.__value_.__r.__words[0];
    }
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v212 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v212 = v686.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v210, (uint64_t)v211, v212);
    v213 = (void *)std::ostream::operator<<();
    std::string::size_type v214 = sub_2407941BC(v213, (uint64_t)",", 1);
    sub_240794060(&v643, "maggie_on");
    profile_decoder::key(&v683);
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v215 = &v683;
    }
    else {
      v215 = (std::string *)v683.__r_.__value_.__r.__words[0];
    }
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v216 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v216 = v683.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v214, (uint64_t)v215, v216);
    v217 = (void *)std::ostream::operator<<();
    std::string::size_type v218 = sub_2407941BC(v217, (uint64_t)",", 1);
    sub_240794060(&v641, "maggiePending");
    profile_decoder::key(&v680);
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v219 = &v680;
    }
    else {
      v219 = (std::string *)v680.__r_.__value_.__r.__words[0];
    }
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v220 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v220 = v680.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v218, (uint64_t)v219, v220);
    v221 = (void *)std::ostream::operator<<();
    v222 = sub_2407941BC(v221, (uint64_t)",", 1);
    sub_240794060(&v639, "ampsEnabling");
    profile_decoder::key(&v677);
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v223 = &v677;
    }
    else {
      std::string::size_type v223 = (std::string *)v677.__r_.__value_.__r.__words[0];
    }
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v224 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v224 = v677.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v222, (uint64_t)v223, v224);
    v225 = (void *)std::ostream::operator<<();
    v226 = sub_2407941BC(v225, (uint64_t)",", 1);
    sub_240794060(&v637, "mesa_ready");
    profile_decoder::key(&v674);
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v227 = &v674;
    }
    else {
      std::string::size_type v227 = (std::string *)v674.__r_.__value_.__r.__words[0];
    }
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v228 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v228 = v674.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v226, (uint64_t)v227, v228);
    v229 = (void *)std::ostream::operator<<();
    v230 = sub_2407941BC(v229, (uint64_t)",", 1);
    sub_240794060(&v635, "ampsPrewarming");
    profile_decoder::key(&v671);
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v231 = &v671;
    }
    else {
      v231 = (std::string *)v671.__r_.__value_.__r.__words[0];
    }
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v232 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v232 = v671.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v230, (uint64_t)v231, v232);
    v233 = (void *)std::ostream::operator<<();
    v234 = sub_2407941BC(v233, (uint64_t)",", 1);
    sub_240794060(&v633, "ampsDisabling");
    profile_decoder::key(&v668);
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v235 = &v668;
    }
    else {
      v235 = (std::string *)v668.__r_.__value_.__r.__words[0];
    }
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v236 = HIBYTE(v668.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v236 = v668.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v234, (uint64_t)v235, v236);
    std::string::size_type v237 = (void *)std::ostream::operator<<();
    v238 = sub_2407941BC(v237, (uint64_t)",", 1);
    sub_240794060(&v631, "ampsPending");
    profile_decoder::key(&v665);
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v239 = &v665;
    }
    else {
      v239 = (std::string *)v665.__r_.__value_.__r.__words[0];
    }
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v240 = HIBYTE(v665.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v240 = v665.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v238, (uint64_t)v239, v240);
    v241 = (void *)std::ostream::operator<<();
    std::string::size_type v242 = sub_2407941BC(v241, (uint64_t)",", 1);
    sub_240794060(&v628, "clickState");
    profile_decoder::key(&v630);
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v243 = &v630;
    }
    else {
      v243 = (std::string *)v630.__r_.__value_.__r.__words[0];
    }
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v244 = HIBYTE(v630.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v244 = v630.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v242, (uint64_t)v243, v244);
    v245 = (void *)std::ostream::operator<<();
    v246 = sub_2407941BC(v245, (uint64_t)",", 1);
    sub_240794060(&v625, "clickSpeed");
    profile_decoder::key(&v627);
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v247 = &v627;
    }
    else {
      std::string::size_type v247 = (std::string *)v627.__r_.__value_.__r.__words[0];
    }
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v248 = HIBYTE(v627.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v248 = v627.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v246, (uint64_t)v247, v248);
    v249 = (void *)std::ostream::operator<<();
    v250 = sub_2407941BC(v249, (uint64_t)",", 1);
    sub_240794060(&v622, "test_mode");
    profile_decoder::key(&v624);
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v251 = &v624;
    }
    else {
      v251 = (std::string *)v624.__r_.__value_.__r.__words[0];
    }
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v252 = HIBYTE(v624.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v252 = v624.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v250, (uint64_t)v251, v252);
    v253 = (void *)std::ostream::operator<<();
    v254 = sub_2407941BC(v253, (uint64_t)",", 1);
    sub_240794060(&v619, "cl_enable");
    profile_decoder::key(&v621);
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v255 = &v621;
    }
    else {
      v255 = (std::string *)v621.__r_.__value_.__r.__words[0];
    }
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v256 = HIBYTE(v621.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v256 = v621.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v254, (uint64_t)v255, v256);
    v257 = (void *)std::ostream::operator<<();
    v258 = sub_2407941BC(v257, (uint64_t)",", 1);
    sub_240794060(&v616, "cl_aop_enable");
    profile_decoder::key(&v618);
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v259 = &v618;
    }
    else {
      std::string::size_type v259 = (std::string *)v618.__r_.__value_.__r.__words[0];
    }
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v260 = HIBYTE(v618.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v260 = v618.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v258, (uint64_t)v259, v260);
    v261 = (void *)std::ostream::operator<<();
    v262 = sub_2407941BC(v261, (uint64_t)",", 1);
    sub_240794060(&v613, "cl_ap_enable");
    profile_decoder::key(&v615);
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v263 = &v615;
    }
    else {
      std::string::size_type v263 = (std::string *)v615.__r_.__value_.__r.__words[0];
    }
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v264 = HIBYTE(v615.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v264 = v615.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v262, (uint64_t)v263, v264);
    v265 = (void *)std::ostream::operator<<();
    v266 = sub_2407941BC(v265, (uint64_t)",", 1);
    sub_240794060(&v610, "maggie_ready");
    profile_decoder::key(&v612);
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v267 = &v612;
    }
    else {
      v267 = (std::string *)v612.__r_.__value_.__r.__words[0];
    }
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v268 = HIBYTE(v612.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v268 = v612.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v266, (uint64_t)v267, v268);
    v269 = (void *)std::ostream::operator<<();
    v270 = sub_2407941BC(v269, (uint64_t)",", 1);
    sub_240794060(&v607, "apState0");
    profile_decoder::key(&v609);
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v271 = &v609;
    }
    else {
      v271 = (std::string *)v609.__r_.__value_.__r.__words[0];
    }
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v272 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v272 = v609.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v270, (uint64_t)v271, v272);
    std::string::size_type v273 = (void *)std::ostream::operator<<();
    v274 = sub_2407941BC(v273, (uint64_t)",", 1);
    sub_240794060(&v604, "apState1");
    profile_decoder::key(&v606);
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v275 = &v606;
    }
    else {
      v275 = (std::string *)v606.__r_.__value_.__r.__words[0];
    }
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v276 = HIBYTE(v606.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v276 = v606.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v274, (uint64_t)v275, v276);
    v277 = (void *)std::ostream::operator<<();
    std::string::size_type v278 = sub_2407941BC(v277, (uint64_t)",", 1);
    sub_240794060(&v601, "aopState0");
    profile_decoder::key(&v603);
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v279 = &v603;
    }
    else {
      v279 = (std::string *)v603.__r_.__value_.__r.__words[0];
    }
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v280 = HIBYTE(v603.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v280 = v603.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v278, (uint64_t)v279, v280);
    v281 = (void *)std::ostream::operator<<();
    char v282 = sub_2407941BC(v281, (uint64_t)",", 1);
    sub_240794060(&v598, "aopState1");
    profile_decoder::key(&v600);
    if ((v600.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v283 = &v600;
    }
    else {
      v283 = (std::string *)v600.__r_.__value_.__r.__words[0];
    }
    if ((v600.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v284 = HIBYTE(v600.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v284 = v600.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v282, (uint64_t)v283, v284);
    v285 = (void *)std::ostream::operator<<();
    char v286 = sub_2407941BC(v285, (uint64_t)",", 1);
    sub_240794060(&v595, "state0");
    profile_decoder::key(&v597);
    if ((v597.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v287 = &v597;
    }
    else {
      v287 = (std::string *)v597.__r_.__value_.__r.__words[0];
    }
    if ((v597.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v288 = HIBYTE(v597.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v288 = v597.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v286, (uint64_t)v287, v288);
    v289 = (void *)std::ostream::operator<<();
    char v290 = sub_2407941BC(v289, (uint64_t)",", 1);
    sub_240794060(&v592, "state1");
    profile_decoder::key(&v594);
    if ((v594.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v291 = &v594;
    }
    else {
      v291 = (std::string *)v594.__r_.__value_.__r.__words[0];
    }
    if ((v594.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v292 = HIBYTE(v594.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v292 = v594.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v290, (uint64_t)v291, v292);
    v293 = (void *)std::ostream::operator<<();
    sub_2407941BC(v293, (uint64_t)",", 1);
    if (SHIBYTE(v594.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v594.__r_.__value_.__l.__data_);
    }
    if (v593 < 0) {
      operator delete(v592);
    }
    if (SHIBYTE(v597.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v597.__r_.__value_.__l.__data_);
    }
    if (v596 < 0) {
      operator delete(v595);
    }
    if (SHIBYTE(v600.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v600.__r_.__value_.__l.__data_);
    }
    if (v599 < 0) {
      operator delete(v598);
    }
    if (SHIBYTE(v603.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v603.__r_.__value_.__l.__data_);
    }
    if (v602 < 0) {
      operator delete(v601);
    }
    if (SHIBYTE(v606.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v606.__r_.__value_.__l.__data_);
    }
    if (v605 < 0) {
      operator delete(v604);
    }
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v609.__r_.__value_.__l.__data_);
    }
    if (v608 < 0) {
      operator delete(v607);
    }
    if (SHIBYTE(v612.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v612.__r_.__value_.__l.__data_);
    }
    if (v611 < 0) {
      operator delete(v610);
    }
    if (SHIBYTE(v615.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v615.__r_.__value_.__l.__data_);
    }
    if (v614 < 0) {
      operator delete(v613);
    }
    if (SHIBYTE(v618.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v618.__r_.__value_.__l.__data_);
    }
    if (v617 < 0) {
      operator delete(v616);
    }
    if (SHIBYTE(v621.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v621.__r_.__value_.__l.__data_);
    }
    if (v620 < 0) {
      operator delete(v619);
    }
    if (SHIBYTE(v624.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v624.__r_.__value_.__l.__data_);
    }
    if (v623 < 0) {
      operator delete(v622);
    }
    if (SHIBYTE(v627.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v627.__r_.__value_.__l.__data_);
    }
    if (v626 < 0) {
      operator delete(v625);
    }
    if (SHIBYTE(v630.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v630.__r_.__value_.__l.__data_);
    }
    if (v629 < 0) {
      operator delete(v628);
    }
    if (SHIBYTE(v665.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v665.__r_.__value_.__l.__data_);
    }
    if (v632 < 0) {
      operator delete(v631);
    }
    if (SHIBYTE(v668.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v668.__r_.__value_.__l.__data_);
    }
    if (v634 < 0) {
      operator delete(v633);
    }
    if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v671.__r_.__value_.__l.__data_);
    }
    if (v636 < 0) {
      operator delete(v635);
    }
    if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v674.__r_.__value_.__l.__data_);
    }
    if (v638 < 0) {
      operator delete(v637);
    }
    if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v677.__r_.__value_.__l.__data_);
    }
    if (v640 < 0) {
      operator delete(v639);
    }
    if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v680.__r_.__value_.__l.__data_);
    }
    if (v642 < 0) {
      operator delete(v641);
    }
    if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v683.__r_.__value_.__l.__data_);
    }
    if (v644 < 0) {
      operator delete(v643);
    }
    if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v686.__r_.__value_.__l.__data_);
    }
    if (v646 < 0) {
      operator delete(v645);
    }
    if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v705.__r_.__value_.__l.__data_);
    }
    if (v648 < 0) {
      operator delete(v647);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v650 < 0) {
      operator delete(v649);
    }
    if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v725.__r_.__value_.__l.__data_);
    }
    if (v652 < 0) {
      operator delete(v651);
    }
    if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v728.__r_.__value_.__l.__data_);
    }
    if (v654 < 0) {
      operator delete(v653);
    }
    if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v731.__r_.__value_.__l.__data_);
    }
    if (v656 < 0) {
      operator delete(v655);
    }
    if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v734.__r_.__value_.__l.__data_);
    }
    if (v658 < 0) {
      operator delete(v657);
    }
    if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v736.__r_.__value_.__l.__data_);
    }
    if (v660 < 0) {
      operator delete(v659);
    }
    if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v739.__r_.__value_.__l.__data_);
    }
    if ((v662 & 0x80000000) == 0) {
      goto LABEL_683;
    }
    char v138 = v661;
    goto LABEL_682;
  }
  if (v74 != 3) {
    goto LABEL_684;
  }
  sub_240794060(&v701, "context-version");
  profile_decoder::key(&v739);
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v75 = &v739;
  }
  else {
    uint64_t v75 = (std::string *)v739.__r_.__value_.__r.__words[0];
  }
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v76 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v76 = v739.__r_.__value_.__l.__size_;
  }
  sub_2407941BC((void *)(a2 + 16), (uint64_t)v75, v76);
  std::string::size_type v77 = (void *)std::ostream::operator<<();
  v78 = sub_2407941BC(v77, (uint64_t)",", 1);
  sub_240794060(&v699, "currentContext0");
  profile_decoder::key(&v736);
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v79 = &v736;
  }
  else {
    char v79 = (std::string *)v736.__r_.__value_.__r.__words[0];
  }
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v80 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v80 = v736.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v78, (uint64_t)v79, v80);
  uint64_t v81 = (void *)std::ostream::operator<<();
  std::string::size_type v82 = sub_2407941BC(v81, (uint64_t)",", 1);
  sub_240794060(&v697, "currentContext1");
  profile_decoder::key(&v734);
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v83 = &v734;
  }
  else {
    char v83 = (std::string *)v734.__r_.__value_.__r.__words[0];
  }
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v84 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v84 = v734.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v82, (uint64_t)v83, v84);
  char v85 = (void *)std::ostream::operator<<();
  std::string::size_type v86 = sub_2407941BC(v85, (uint64_t)",", 1);
  sub_240794060(&v695, "ampsEnabled");
  profile_decoder::key(&v731);
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v87 = &v731;
  }
  else {
    std::string::size_type v87 = (std::string *)v731.__r_.__value_.__r.__words[0];
  }
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v88 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v88 = v731.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v86, (uint64_t)v87, v88);
  char v89 = (void *)std::ostream::operator<<();
  v90 = sub_2407941BC(v89, (uint64_t)",", 1);
  sub_240794060(&v693, "enabled");
  profile_decoder::key(&v728);
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v91 = &v728;
  }
  else {
    char v91 = (std::string *)v728.__r_.__value_.__r.__words[0];
  }
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v92 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v92 = v728.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v90, (uint64_t)v91, v92);
  char v93 = (void *)std::ostream::operator<<();
  v94 = sub_2407941BC(v93, (uint64_t)",", 1);
  sub_240794060(&v691, "mode");
  profile_decoder::key(&v725);
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v95 = &v725;
  }
  else {
    char v95 = (std::string *)v725.__r_.__value_.__r.__words[0];
  }
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v96 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v96 = v725.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v94, (uint64_t)v95, v96);
  v97 = (void *)std::ostream::operator<<();
  char v98 = sub_2407941BC(v97, (uint64_t)",", 1);
  sub_240794060(&v689, "scan_time");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v99 = &__p;
  }
  else {
    std::string v99 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v100 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v100 = __p.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v98, (uint64_t)v99, v100);
  std::string v101 = (void *)std::ostream::operator<<();
  char v102 = sub_2407941BC(v101, (uint64_t)",", 1);
  sub_240794060(&v687, "active_scan_interval");
  profile_decoder::key(&v705);
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v103 = &v705;
  }
  else {
    char v103 = (std::string *)v705.__r_.__value_.__r.__words[0];
  }
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v104 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v104 = v705.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v102, (uint64_t)v103, v104);
  long long v105 = (void *)std::ostream::operator<<();
  char v106 = sub_2407941BC(v105, (uint64_t)",", 1);
  sub_240794060(&v684, "background_scan_interval");
  profile_decoder::key(&v686);
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v107 = &v686;
  }
  else {
    std::string v107 = (std::string *)v686.__r_.__value_.__r.__words[0];
  }
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v108 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v108 = v686.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v106, (uint64_t)v107, v108);
  char v109 = (void *)std::ostream::operator<<();
  char v110 = sub_2407941BC(v109, (uint64_t)",", 1);
  sub_240794060(&v681, "fingerDetect");
  profile_decoder::key(&v683);
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v111 = &v683;
  }
  else {
    long long v111 = (std::string *)v683.__r_.__value_.__r.__words[0];
  }
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v112 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v112 = v683.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v110, (uint64_t)v111, v112);
  std::string v113 = (void *)std::ostream::operator<<();
  char v114 = sub_2407941BC(v113, (uint64_t)",", 1);
  sub_240794060(&v678, "buttonState");
  profile_decoder::key(&v680);
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v115 = &v680;
  }
  else {
    char v115 = (std::string *)v680.__r_.__value_.__r.__words[0];
  }
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v116 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v116 = v680.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v114, (uint64_t)v115, v116);
  char v117 = (void *)std::ostream::operator<<();
  std::string v118 = sub_2407941BC(v117, (uint64_t)",", 1);
  sub_240794060(&v675, "pressCount");
  profile_decoder::key(&v677);
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v119 = &v677;
  }
  else {
    std::string v119 = (std::string *)v677.__r_.__value_.__r.__words[0];
  }
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v120 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v120 = v677.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v118, (uint64_t)v119, v120);
  std::string v121 = (void *)std::ostream::operator<<();
  std::string v122 = sub_2407941BC(v121, (uint64_t)",", 1);
  sub_240794060(&v672, "longPress");
  profile_decoder::key(&v674);
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v123 = &v674;
  }
  else {
    char v123 = (std::string *)v674.__r_.__value_.__r.__words[0];
  }
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v124 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v124 = v674.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v122, (uint64_t)v123, v124);
  char v125 = (void *)std::ostream::operator<<();
  char v126 = sub_2407941BC(v125, (uint64_t)",", 1);
  sub_240794060(&v669, "terminalEvent");
  profile_decoder::key(&v671);
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v127 = &v671;
  }
  else {
    std::string v127 = (std::string *)v671.__r_.__value_.__r.__words[0];
  }
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v128 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v128 = v671.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v126, (uint64_t)v127, v128);
  char v129 = (void *)std::ostream::operator<<();
  std::string v130 = sub_2407941BC(v129, (uint64_t)",", 1);
  sub_240794060(&v666, "speed");
  profile_decoder::key(&v668);
  if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v131 = &v668;
  }
  else {
    long long v131 = (std::string *)v668.__r_.__value_.__r.__words[0];
  }
  if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v132 = HIBYTE(v668.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v132 = v668.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v130, (uint64_t)v131, v132);
  std::string v133 = (void *)std::ostream::operator<<();
  uint64_t v134 = sub_2407941BC(v133, (uint64_t)",", 1);
  sub_240794060(&v663, "stage");
  profile_decoder::key(&v665);
  if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v135 = &v665;
  }
  else {
    char v135 = (std::string *)v665.__r_.__value_.__r.__words[0];
  }
  if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v136 = HIBYTE(v665.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v136 = v665.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v134, (uint64_t)v135, v136);
  v137 = (void *)std::ostream::operator<<();
  sub_2407941BC(v137, (uint64_t)",", 1);
  if (SHIBYTE(v665.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v665.__r_.__value_.__l.__data_);
  }
  if (v664 < 0) {
    operator delete(v663);
  }
  if (SHIBYTE(v668.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v668.__r_.__value_.__l.__data_);
  }
  if (v667 < 0) {
    operator delete(v666);
  }
  if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v671.__r_.__value_.__l.__data_);
  }
  if (v670 < 0) {
    operator delete(v669);
  }
  if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v674.__r_.__value_.__l.__data_);
  }
  if (v673 < 0) {
    operator delete(v672);
  }
  if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v677.__r_.__value_.__l.__data_);
  }
  if (v676 < 0) {
    operator delete(v675);
  }
  if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v680.__r_.__value_.__l.__data_);
  }
  if (v679 < 0) {
    operator delete(v678);
  }
  if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v683.__r_.__value_.__l.__data_);
  }
  if (v682 < 0) {
    operator delete(v681);
  }
  if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v686.__r_.__value_.__l.__data_);
  }
  if (v685 < 0) {
    operator delete(v684);
  }
  if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v705.__r_.__value_.__l.__data_);
  }
  if (v688 < 0) {
    operator delete(v687);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v690 < 0) {
    operator delete(v689);
  }
  if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v725.__r_.__value_.__l.__data_);
  }
  if (v692 < 0) {
    operator delete(v691);
  }
  if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v728.__r_.__value_.__l.__data_);
  }
  if (v694 < 0) {
    operator delete(v693);
  }
  if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v731.__r_.__value_.__l.__data_);
  }
  if (v696 < 0) {
    operator delete(v695);
  }
  if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v734.__r_.__value_.__l.__data_);
  }
  if (v698 < 0) {
    operator delete(v697);
  }
  if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v736.__r_.__value_.__l.__data_);
  }
  if (v700 < 0) {
    operator delete(v699);
  }
  if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v739.__r_.__value_.__l.__data_);
  }
  if (v702 < 0)
  {
    char v138 = v701;
LABEL_682:
    operator delete(v138);
  }
LABEL_683:
  int v74 = *((unsigned __int16 *)a3 + 8);
LABEL_684:
  if (v74 == 7)
  {
    sub_240794060(&v562, "context-version");
    profile_decoder::key(&v739);
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v349 = &v739;
    }
    else {
      v349 = (std::string *)v739.__r_.__value_.__r.__words[0];
    }
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v350 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v350 = v739.__r_.__value_.__l.__size_;
    }
    sub_2407941BC((void *)(a2 + 16), (uint64_t)v349, v350);
    v351 = (void *)std::ostream::operator<<();
    char v352 = sub_2407941BC(v351, (uint64_t)",", 1);
    sub_240794060(&v560, "mclk_aop_enabled");
    profile_decoder::key(&v736);
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v353 = &v736;
    }
    else {
      v353 = (std::string *)v736.__r_.__value_.__r.__words[0];
    }
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v354 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v354 = v736.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v352, (uint64_t)v353, v354);
    v355 = (void *)std::ostream::operator<<();
    char v356 = sub_2407941BC(v355, (uint64_t)",", 1);
    sub_240794060(&v558, "mclk_ap_enabled");
    profile_decoder::key(&v734);
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v357 = &v734;
    }
    else {
      v357 = (std::string *)v734.__r_.__value_.__r.__words[0];
    }
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v358 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v358 = v734.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v356, (uint64_t)v357, v358);
    v359 = (void *)std::ostream::operator<<();
    char v360 = sub_2407941BC(v359, (uint64_t)",", 1);
    sub_240794060(&v556, "maggie_aop_enabled");
    profile_decoder::key(&v731);
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v361 = &v731;
    }
    else {
      v361 = (std::string *)v731.__r_.__value_.__r.__words[0];
    }
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v362 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v362 = v731.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v360, (uint64_t)v361, v362);
    v363 = (void *)std::ostream::operator<<();
    char v364 = sub_2407941BC(v363, (uint64_t)",", 1);
    sub_240794060(&v554, "maggie_ap_enabled");
    profile_decoder::key(&v728);
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v365 = &v728;
    }
    else {
      v365 = (std::string *)v728.__r_.__value_.__r.__words[0];
    }
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v366 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v366 = v728.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v364, (uint64_t)v365, v366);
    v367 = (void *)std::ostream::operator<<();
    char v368 = sub_2407941BC(v367, (uint64_t)",", 1);
    sub_240794060(&v552, "maggieBusy");
    profile_decoder::key(&v725);
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v369 = &v725;
    }
    else {
      v369 = (std::string *)v725.__r_.__value_.__r.__words[0];
    }
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v370 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v370 = v725.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v368, (uint64_t)v369, v370);
    v371 = (void *)std::ostream::operator<<();
    char v372 = sub_2407941BC(v371, (uint64_t)",", 1);
    sub_240794060(&v550, "enableARC");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v373 = &__p;
    }
    else {
      v373 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v374 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v374 = __p.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v372, (uint64_t)v373, v374);
    std::string v375 = (void *)std::ostream::operator<<();
    v376 = sub_2407941BC(v375, (uint64_t)",", 1);
    sub_240794060(&v548, "enableSpkr");
    profile_decoder::key(&v705);
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v377 = &v705;
    }
    else {
      char v377 = (std::string *)v705.__r_.__value_.__r.__words[0];
    }
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v378 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v378 = v705.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v376, (uint64_t)v377, v378);
    v379 = (void *)std::ostream::operator<<();
    char v380 = sub_2407941BC(v379, (uint64_t)",", 1);
    sub_240794060(&v546, "mclk_on");
    profile_decoder::key(&v686);
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v381 = &v686;
    }
    else {
      v381 = (std::string *)v686.__r_.__value_.__r.__words[0];
    }
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v382 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v382 = v686.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v380, (uint64_t)v381, v382);
    std::string v383 = (void *)std::ostream::operator<<();
    v384 = sub_2407941BC(v383, (uint64_t)",", 1);
    sub_240794060(&v544, "maggie_on");
    profile_decoder::key(&v683);
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v385 = &v683;
    }
    else {
      char v385 = (std::string *)v683.__r_.__value_.__r.__words[0];
    }
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v386 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v386 = v683.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v384, (uint64_t)v385, v386);
    v387 = (void *)std::ostream::operator<<();
    char v388 = sub_2407941BC(v387, (uint64_t)",", 1);
    sub_240794060(&v542, "maggiePending");
    profile_decoder::key(&v680);
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v389 = &v680;
    }
    else {
      v389 = (std::string *)v680.__r_.__value_.__r.__words[0];
    }
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v390 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v390 = v680.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v388, (uint64_t)v389, v390);
    v391 = (void *)std::ostream::operator<<();
    v392 = sub_2407941BC(v391, (uint64_t)",", 1);
    sub_240794060(&v540, "mesa_ready");
    profile_decoder::key(&v677);
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v393 = &v677;
    }
    else {
      char v393 = (std::string *)v677.__r_.__value_.__r.__words[0];
    }
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v394 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v394 = v677.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v392, (uint64_t)v393, v394);
    v395 = (void *)std::ostream::operator<<();
    char v396 = sub_2407941BC(v395, (uint64_t)",", 1);
    sub_240794060(&v538, "ampsState");
    profile_decoder::key(&v674);
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string v397 = &v674;
    }
    else {
      std::string v397 = (std::string *)v674.__r_.__value_.__r.__words[0];
    }
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v398 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v398 = v674.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v396, (uint64_t)v397, v398);
    char v399 = (void *)std::ostream::operator<<();
    std::string v400 = sub_2407941BC(v399, (uint64_t)",", 1);
    sub_240794060(&v536, "clickState");
    profile_decoder::key(&v671);
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v401 = &v671;
    }
    else {
      v401 = (std::string *)v671.__r_.__value_.__r.__words[0];
    }
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v402 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v402 = v671.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v400, (uint64_t)v401, v402);
    std::string v403 = (void *)std::ostream::operator<<();
    v404 = sub_2407941BC(v403, (uint64_t)",", 1);
    sub_240794060(&v534, "clickSpeed");
    profile_decoder::key(&v668);
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v405 = &v668;
    }
    else {
      char v405 = (std::string *)v668.__r_.__value_.__r.__words[0];
    }
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v406 = HIBYTE(v668.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v406 = v668.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v404, (uint64_t)v405, v406);
    v407 = (void *)std::ostream::operator<<();
    std::string v408 = sub_2407941BC(v407, (uint64_t)",", 1);
    sub_240794060(&v532, "test_mode");
    profile_decoder::key(&v665);
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v409 = &v665;
    }
    else {
      uint64_t v409 = (std::string *)v665.__r_.__value_.__r.__words[0];
    }
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v410 = HIBYTE(v665.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v410 = v665.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v408, (uint64_t)v409, v410);
    v411 = (void *)std::ostream::operator<<();
    v412 = sub_2407941BC(v411, (uint64_t)",", 1);
    sub_240794060(&v530, "cl_enable");
    profile_decoder::key(&v630);
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v413 = &v630;
    }
    else {
      v413 = (std::string *)v630.__r_.__value_.__r.__words[0];
    }
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v414 = HIBYTE(v630.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v414 = v630.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v412, (uint64_t)v413, v414);
    v415 = (void *)std::ostream::operator<<();
    v416 = sub_2407941BC(v415, (uint64_t)",", 1);
    sub_240794060(&v528, "cl_aop_enable");
    profile_decoder::key(&v627);
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v417 = &v627;
    }
    else {
      v417 = (std::string *)v627.__r_.__value_.__r.__words[0];
    }
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v418 = HIBYTE(v627.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v418 = v627.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v416, (uint64_t)v417, v418);
    v419 = (void *)std::ostream::operator<<();
    v420 = sub_2407941BC(v419, (uint64_t)",", 1);
    sub_240794060(&v526, "cl_ap_enable");
    profile_decoder::key(&v624);
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v421 = &v624;
    }
    else {
      v421 = (std::string *)v624.__r_.__value_.__r.__words[0];
    }
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v422 = HIBYTE(v624.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v422 = v624.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v420, (uint64_t)v421, v422);
    v423 = (void *)std::ostream::operator<<();
    v424 = sub_2407941BC(v423, (uint64_t)",", 1);
    sub_240794060(&v524, "maggie_ready");
    profile_decoder::key(&v621);
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v425 = &v621;
    }
    else {
      v425 = (std::string *)v621.__r_.__value_.__r.__words[0];
    }
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v426 = HIBYTE(v621.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v426 = v621.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v424, (uint64_t)v425, v426);
    v427 = (void *)std::ostream::operator<<();
    v428 = sub_2407941BC(v427, (uint64_t)",", 1);
    sub_240794060(&v522, "apState0");
    profile_decoder::key(&v618);
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v429 = &v618;
    }
    else {
      v429 = (std::string *)v618.__r_.__value_.__r.__words[0];
    }
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v430 = HIBYTE(v618.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v430 = v618.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v428, (uint64_t)v429, v430);
    v431 = (void *)std::ostream::operator<<();
    v432 = sub_2407941BC(v431, (uint64_t)",", 1);
    sub_240794060(&v520, "apState1");
    profile_decoder::key(&v615);
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v433 = &v615;
    }
    else {
      v433 = (std::string *)v615.__r_.__value_.__r.__words[0];
    }
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v434 = HIBYTE(v615.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v434 = v615.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v432, (uint64_t)v433, v434);
    v435 = (void *)std::ostream::operator<<();
    v436 = sub_2407941BC(v435, (uint64_t)",", 1);
    sub_240794060(&v518, "aopState0");
    profile_decoder::key(&v612);
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v437 = &v612;
    }
    else {
      v437 = (std::string *)v612.__r_.__value_.__r.__words[0];
    }
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v438 = HIBYTE(v612.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v438 = v612.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v436, (uint64_t)v437, v438);
    v439 = (void *)std::ostream::operator<<();
    v440 = sub_2407941BC(v439, (uint64_t)",", 1);
    sub_240794060(&v516, "aopState1");
    profile_decoder::key(&v609);
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v441 = &v609;
    }
    else {
      v441 = (std::string *)v609.__r_.__value_.__r.__words[0];
    }
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v442 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v442 = v609.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v440, (uint64_t)v441, v442);
    v443 = (void *)std::ostream::operator<<();
    v444 = sub_2407941BC(v443, (uint64_t)",", 1);
    sub_240794060(&v514, "state0");
    profile_decoder::key(&v606);
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v445 = &v606;
    }
    else {
      v445 = (std::string *)v606.__r_.__value_.__r.__words[0];
    }
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v446 = HIBYTE(v606.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v446 = v606.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v444, (uint64_t)v445, v446);
    v447 = (void *)std::ostream::operator<<();
    v448 = sub_2407941BC(v447, (uint64_t)",", 1);
    sub_240794060(&v512, "state1");
    profile_decoder::key(&v603);
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v449 = &v603;
    }
    else {
      v449 = (std::string *)v603.__r_.__value_.__r.__words[0];
    }
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v450 = HIBYTE(v603.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v450 = v603.__r_.__value_.__l.__size_;
    }
    sub_2407941BC(v448, (uint64_t)v449, v450);
    v451 = (void *)std::ostream::operator<<();
    sub_2407941BC(v451, (uint64_t)",", 1);
    if (SHIBYTE(v603.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v603.__r_.__value_.__l.__data_);
    }
    if (v513 < 0) {
      operator delete(v512);
    }
    if (SHIBYTE(v606.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v606.__r_.__value_.__l.__data_);
    }
    if (v515 < 0) {
      operator delete(v514);
    }
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v609.__r_.__value_.__l.__data_);
    }
    if (v517 < 0) {
      operator delete(v516);
    }
    if (SHIBYTE(v612.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v612.__r_.__value_.__l.__data_);
    }
    if (v519 < 0) {
      operator delete(v518);
    }
    if (SHIBYTE(v615.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v615.__r_.__value_.__l.__data_);
    }
    if (v521 < 0) {
      operator delete(v520);
    }
    if (SHIBYTE(v618.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v618.__r_.__value_.__l.__data_);
    }
    if (v523 < 0) {
      operator delete(v522);
    }
    if (SHIBYTE(v621.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v621.__r_.__value_.__l.__data_);
    }
    if (v525 < 0) {
      operator delete(v524);
    }
    if (SHIBYTE(v624.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v624.__r_.__value_.__l.__data_);
    }
    if (v527 < 0) {
      operator delete(v526);
    }
    if (SHIBYTE(v627.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v627.__r_.__value_.__l.__data_);
    }
    if (v529 < 0) {
      operator delete(v528);
    }
    if (SHIBYTE(v630.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v630.__r_.__value_.__l.__data_);
    }
    if (v531 < 0) {
      operator delete(v530);
    }
    if (SHIBYTE(v665.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v665.__r_.__value_.__l.__data_);
    }
    if (v533 < 0) {
      operator delete(v532);
    }
    if (SHIBYTE(v668.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v668.__r_.__value_.__l.__data_);
    }
    if (v535 < 0) {
      operator delete(v534);
    }
    if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v671.__r_.__value_.__l.__data_);
    }
    if (v537 < 0) {
      operator delete(v536);
    }
    if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v674.__r_.__value_.__l.__data_);
    }
    if (v539 < 0) {
      operator delete(v538);
    }
    if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v677.__r_.__value_.__l.__data_);
    }
    if (v541 < 0) {
      operator delete(v540);
    }
    if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v680.__r_.__value_.__l.__data_);
    }
    if (v543 < 0) {
      operator delete(v542);
    }
    if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v683.__r_.__value_.__l.__data_);
    }
    if (v545 < 0) {
      operator delete(v544);
    }
    if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v686.__r_.__value_.__l.__data_);
    }
    if (v547 < 0) {
      operator delete(v546);
    }
    if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v705.__r_.__value_.__l.__data_);
    }
    if (v549 < 0) {
      operator delete(v548);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v551 < 0) {
      operator delete(v550);
    }
    if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v725.__r_.__value_.__l.__data_);
    }
    if (v553 < 0) {
      operator delete(v552);
    }
    if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v728.__r_.__value_.__l.__data_);
    }
    if (v555 < 0) {
      operator delete(v554);
    }
    if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v731.__r_.__value_.__l.__data_);
    }
    if (v557 < 0) {
      operator delete(v556);
    }
    if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v734.__r_.__value_.__l.__data_);
    }
    if (v559 < 0) {
      operator delete(v558);
    }
    if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v736.__r_.__value_.__l.__data_);
    }
    if (v561 < 0) {
      operator delete(v560);
    }
    if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v739.__r_.__value_.__l.__data_);
    }
    if (v563 < 0)
    {
      v178 = v562;
      goto LABEL_1087;
    }
    goto LABEL_1088;
  }
  if (v74 != 5) {
    goto LABEL_826;
  }
  sub_240794060(&v590, "context-version");
  profile_decoder::key(&v739);
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v294 = &v739;
  }
  else {
    char v294 = (std::string *)v739.__r_.__value_.__r.__words[0];
  }
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v295 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v295 = v739.__r_.__value_.__l.__size_;
  }
  sub_2407941BC((void *)(a2 + 16), (uint64_t)v294, v295);
  char v296 = (void *)std::ostream::operator<<();
  v297 = sub_2407941BC(v296, (uint64_t)",", 1);
  sub_240794060(&v588, "currentContext0");
  profile_decoder::key(&v736);
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v298 = &v736;
  }
  else {
    char v298 = (std::string *)v736.__r_.__value_.__r.__words[0];
  }
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v299 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v299 = v736.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v297, (uint64_t)v298, v299);
  char v300 = (void *)std::ostream::operator<<();
  v301 = sub_2407941BC(v300, (uint64_t)",", 1);
  sub_240794060(&v586, "currentContext1");
  profile_decoder::key(&v734);
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v302 = &v734;
  }
  else {
    char v302 = (std::string *)v734.__r_.__value_.__r.__words[0];
  }
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v303 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v303 = v734.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v301, (uint64_t)v302, v303);
  char v304 = (void *)std::ostream::operator<<();
  v305 = sub_2407941BC(v304, (uint64_t)",", 1);
  sub_240794060(&v584, "ampsEnabled");
  profile_decoder::key(&v731);
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v306 = &v731;
  }
  else {
    char v306 = (std::string *)v731.__r_.__value_.__r.__words[0];
  }
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v307 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v307 = v731.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v305, (uint64_t)v306, v307);
  char v308 = (void *)std::ostream::operator<<();
  v309 = sub_2407941BC(v308, (uint64_t)",", 1);
  sub_240794060(&v582, "enabled");
  profile_decoder::key(&v728);
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v310 = &v728;
  }
  else {
    char v310 = (std::string *)v728.__r_.__value_.__r.__words[0];
  }
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v311 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v311 = v728.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v309, (uint64_t)v310, v311);
  char v312 = (void *)std::ostream::operator<<();
  v313 = sub_2407941BC(v312, (uint64_t)",", 1);
  sub_240794060(&v580, "scan_period");
  profile_decoder::key(&v725);
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v314 = &v725;
  }
  else {
    char v314 = (std::string *)v725.__r_.__value_.__r.__words[0];
  }
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v315 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v315 = v725.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v313, (uint64_t)v314, v315);
  char v316 = (void *)std::ostream::operator<<();
  v317 = sub_2407941BC(v316, (uint64_t)",", 1);
  sub_240794060(&v578, "scan_time");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v318 = &__p;
  }
  else {
    char v318 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v319 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v319 = __p.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v317, (uint64_t)v318, v319);
  char v320 = (void *)std::ostream::operator<<();
  v321 = sub_2407941BC(v320, (uint64_t)",", 1);
  sub_240794060(&v576, "fingerDetect");
  profile_decoder::key(&v705);
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v322 = &v705;
  }
  else {
    char v322 = (std::string *)v705.__r_.__value_.__r.__words[0];
  }
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v323 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v323 = v705.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v321, (uint64_t)v322, v323);
  char v324 = (void *)std::ostream::operator<<();
  v325 = sub_2407941BC(v324, (uint64_t)",", 1);
  sub_240794060(&v574, "buttonState");
  profile_decoder::key(&v686);
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v326 = &v686;
  }
  else {
    char v326 = (std::string *)v686.__r_.__value_.__r.__words[0];
  }
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v327 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v327 = v686.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v325, (uint64_t)v326, v327);
  char v328 = (void *)std::ostream::operator<<();
  v329 = sub_2407941BC(v328, (uint64_t)",", 1);
  sub_240794060(&v572, "pressCount");
  profile_decoder::key(&v683);
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v330 = &v683;
  }
  else {
    char v330 = (std::string *)v683.__r_.__value_.__r.__words[0];
  }
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v331 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v331 = v683.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v329, (uint64_t)v330, v331);
  char v332 = (void *)std::ostream::operator<<();
  v333 = sub_2407941BC(v332, (uint64_t)",", 1);
  sub_240794060(&v570, "longPress");
  profile_decoder::key(&v680);
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v334 = &v680;
  }
  else {
    char v334 = (std::string *)v680.__r_.__value_.__r.__words[0];
  }
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v335 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v335 = v680.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v333, (uint64_t)v334, v335);
  char v336 = (void *)std::ostream::operator<<();
  v337 = sub_2407941BC(v336, (uint64_t)",", 1);
  sub_240794060(&v568, "terminalEvent");
  profile_decoder::key(&v677);
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v338 = &v677;
  }
  else {
    char v338 = (std::string *)v677.__r_.__value_.__r.__words[0];
  }
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v339 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v339 = v677.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v337, (uint64_t)v338, v339);
  char v340 = (void *)std::ostream::operator<<();
  v341 = sub_2407941BC(v340, (uint64_t)",", 1);
  sub_240794060(&v566, "speed");
  profile_decoder::key(&v674);
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v342 = &v674;
  }
  else {
    char v342 = (std::string *)v674.__r_.__value_.__r.__words[0];
  }
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v343 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v343 = v674.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v341, (uint64_t)v342, v343);
  char v344 = (void *)std::ostream::operator<<();
  v345 = sub_2407941BC(v344, (uint64_t)",", 1);
  sub_240794060(&v564, "stage");
  profile_decoder::key(&v671);
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v346 = &v671;
  }
  else {
    char v346 = (std::string *)v671.__r_.__value_.__r.__words[0];
  }
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v347 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v347 = v671.__r_.__value_.__l.__size_;
  }
  sub_2407941BC(v345, (uint64_t)v346, v347);
  char v348 = (void *)std::ostream::operator<<();
  sub_2407941BC(v348, (uint64_t)",", 1);
  if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v671.__r_.__value_.__l.__data_);
  }
  if (v565 < 0) {
    operator delete(v564);
  }
  if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v674.__r_.__value_.__l.__data_);
  }
  if (v567 < 0) {
    operator delete(v566);
  }
  if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v677.__r_.__value_.__l.__data_);
  }
  if (v569 < 0) {
    operator delete(v568);
  }
  if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v680.__r_.__value_.__l.__data_);
  }
  if (v571 < 0) {
    operator delete(v570);
  }
  if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v683.__r_.__value_.__l.__data_);
  }
  if (v573 < 0) {
    operator delete(v572);
  }
  if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v686.__r_.__value_.__l.__data_);
  }
  if (v575 < 0) {
    operator delete(v574);
  }
  if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v705.__r_.__value_.__l.__data_);
  }
  if (v577 < 0) {
    operator delete(v576);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v579 < 0) {
    operator delete(v578);
  }
  if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v725.__r_.__value_.__l.__data_);
  }
  if (v581 < 0) {
    operator delete(v580);
  }
  if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v728.__r_.__value_.__l.__data_);
  }
  if (v583 < 0) {
    operator delete(v582);
  }
  if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v731.__r_.__value_.__l.__data_);
  }
  if (v585 < 0) {
    operator delete(v584);
  }
  if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v734.__r_.__value_.__l.__data_);
  }
  if (v587 < 0) {
    operator delete(v586);
  }
  if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v736.__r_.__value_.__l.__data_);
  }
  if (v589 < 0) {
    operator delete(v588);
  }
  if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v739.__r_.__value_.__l.__data_);
  }
  if (v591 < 0)
  {
    v178 = v590;
    goto LABEL_1087;
  }
LABEL_1088:
  if (v7 != 7) {
    goto LABEL_1163;
  }
  if (v8 != 2) {
    return;
  }
  if (v72 != 1)
  {
    if (v72 == 2)
    {
      sub_240794060(&v491, "ampType");
      profile_decoder::key(&v739);
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v466 = &v739;
      }
      else {
        v466 = (std::string *)v739.__r_.__value_.__r.__words[0];
      }
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v467 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v467 = v739.__r_.__value_.__l.__size_;
      }
      v468 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v466, v467);
      *(void *)((char *)v468 + *(void *)(*v468 - 24) + 24) = 10;
      v469 = (void *)std::ostream::operator<<();
      v470 = sub_2407941BC(v469, (uint64_t)",", 1);
      sub_240794060(&v489, "index");
      profile_decoder::key(&v736);
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v471 = &v736;
      }
      else {
        v471 = (std::string *)v736.__r_.__value_.__r.__words[0];
      }
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v472 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v472 = v736.__r_.__value_.__l.__size_;
      }
      v473 = sub_2407941BC(v470, (uint64_t)v471, v472);
      *(void *)((char *)v473 + *(void *)(*v473 - 24) + 24) = 10;
      v474 = (void *)std::ostream::operator<<();
      v475 = sub_2407941BC(v474, (uint64_t)",", 1);
      sub_240794060(&v487, "presilence");
      profile_decoder::key(&v734);
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v476 = &v734;
      }
      else {
        v476 = (std::string *)v734.__r_.__value_.__r.__words[0];
      }
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v477 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v477 = v734.__r_.__value_.__l.__size_;
      }
      v478 = sub_2407941BC(v475, (uint64_t)v476, v477);
      *(void *)((char *)v478 + *(void *)(*v478 - 24) + 24) = 10;
      v479 = (void *)std::ostream::operator<<();
      v480 = sub_2407941BC(v479, (uint64_t)",", 1);
      sub_240794060(&v485, "gain");
      profile_decoder::key(&v731);
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v481 = &v731;
      }
      else {
        v481 = (std::string *)v731.__r_.__value_.__r.__words[0];
      }
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v482 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v482 = v731.__r_.__value_.__l.__size_;
      }
      v483 = sub_2407941BC(v480, (uint64_t)v481, v482);
      *(void *)((char *)v483 + *(void *)(*v483 - 24) + 24) = 10;
      v484 = (void *)std::ostream::operator<<();
      sub_2407941BC(v484, (uint64_t)",", 1);
      if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v731.__r_.__value_.__l.__data_);
      }
      if (v486 < 0) {
        operator delete(v485);
      }
      if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v734.__r_.__value_.__l.__data_);
      }
      if (v488 < 0) {
        operator delete(v487);
      }
      if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v736.__r_.__value_.__l.__data_);
      }
      if (v490 < 0) {
        operator delete(v489);
      }
      if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v739.__r_.__value_.__l.__data_);
      }
      if (v492 < 0)
      {
        std::string::size_type v71 = v491;
        goto LABEL_1162;
      }
      return;
    }
    goto LABEL_1163;
  }
  sub_240794060(&v497, "ampType");
  profile_decoder::key(&v739);
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v452 = &v739;
  }
  else {
    v452 = (std::string *)v739.__r_.__value_.__r.__words[0];
  }
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v453 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v453 = v739.__r_.__value_.__l.__size_;
  }
  v454 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v452, v453);
  *(void *)((char *)v454 + *(void *)(*v454 - 24) + 24) = 10;
  v455 = (void *)std::ostream::operator<<();
  v456 = sub_2407941BC(v455, (uint64_t)",", 1);
  sub_240794060(&v495, "state");
  profile_decoder::key(&v736);
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v457 = &v736;
  }
  else {
    v457 = (std::string *)v736.__r_.__value_.__r.__words[0];
  }
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v458 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v458 = v736.__r_.__value_.__l.__size_;
  }
  v459 = sub_2407941BC(v456, (uint64_t)v457, v458);
  *(void *)((char *)v459 + *(void *)(*v459 - 24) + 24) = 10;
  v460 = (void *)std::ostream::operator<<();
  v461 = sub_2407941BC(v460, (uint64_t)",", 1);
  sub_240794060(&v493, "refCount");
  profile_decoder::key(&v734);
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v462 = &v734;
  }
  else {
    v462 = (std::string *)v734.__r_.__value_.__r.__words[0];
  }
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v463 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v463 = v734.__r_.__value_.__l.__size_;
  }
  v464 = sub_2407941BC(v461, (uint64_t)v462, v463);
  *(void *)((char *)v464 + *(void *)(*v464 - 24) + 24) = 10;
  v465 = (void *)std::ostream::operator<<();
  sub_2407941BC(v465, (uint64_t)",", 1);
  if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v734.__r_.__value_.__l.__data_);
  }
  if (v494 < 0) {
    operator delete(v493);
  }
  if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v736.__r_.__value_.__l.__data_);
  }
  if (v496 < 0) {
    operator delete(v495);
  }
  if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v739.__r_.__value_.__l.__data_);
  }
  if (v498 < 0)
  {
    std::string::size_type v71 = v497;
    goto LABEL_1162;
  }
}

void sub_240791804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 225) < 0) {
    operator delete(*(void **)(v33 - 248));
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v33 - 177) < 0) {
    operator delete(*(void **)(v33 - 200));
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v33 - 129) < 0) {
    operator delete(*(void **)(v33 - 152));
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (*(char *)(v33 - 81) < 0) {
    operator delete(*(void **)(v33 - 104));
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(a1);
}

std::string *haptics_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D5988, __val, 4u, a2);
}

std::string *haptics_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D59C8, __val, 3u, a2);
}

void haptics_decoder::parse_datatype(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v5 = BYTE2(*a3);
  if ((v5 - 5) <= 1) {
    goto LABEL_106;
  }
  if (*a3 != 2)
  {
    if (*a3 == 3)
    {
      sub_240794060(&v103, "trace");
      profile_decoder::key(&v105);
      if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v6 = &v105;
      }
      else {
        int v6 = (std::string *)v105.__r_.__value_.__r.__words[0];
      }
      if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v105.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v105.__r_.__value_.__l.__size_;
      }
      int v8 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v6, size);
      *(void *)((char *)v8 + *(void *)(*v8 - 24) + 24) = 25;
      haptics_decoder::subtype_name((profile_decoder *)a3[4], v5, &v101);
      profile_decoder::str(&v102);
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v9 = &v102;
      }
      else {
        uint64_t v9 = (std::string *)v102.__r_.__value_.__r.__words[0];
      }
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v10 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v10 = v102.__r_.__value_.__l.__size_;
      }
      std::string::size_type v11 = sub_2407941BC(v8, (uint64_t)v9, v10);
      std::string::size_type v12 = sub_2407941BC(v11, (uint64_t)",", 1);
      sub_240794060(&v98, "thread");
      profile_decoder::key(&v100);
      if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v13 = &v100;
      }
      else {
        std::string::size_type v13 = (std::string *)v100.__r_.__value_.__r.__words[0];
      }
      if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v14 = HIBYTE(v100.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v14 = v100.__r_.__value_.__l.__size_;
      }
      time_t v15 = sub_2407941BC(v12, (uint64_t)v13, v14);
      *(void *)((char *)v15 + *(void *)(*v15 - 24) + 24) = 10;
      std::string::size_type v16 = (void *)std::ostream::operator<<();
      std::string::size_type v17 = sub_2407941BC(v16, (uint64_t)",", 1);
      sub_240794060(&v95, "arg1");
      profile_decoder::key(&v97);
      if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v18 = &v97;
      }
      else {
        std::string::size_type v18 = (std::string *)v97.__r_.__value_.__r.__words[0];
      }
      if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v19 = HIBYTE(v97.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v19 = v97.__r_.__value_.__l.__size_;
      }
      unsigned int v20 = sub_2407941BC(v17, (uint64_t)v18, v19);
      *(void *)((char *)v20 + *(void *)(*v20 - 24) + 24) = 10;
      std::string::size_type v21 = (void *)std::ostream::operator<<();
      std::string::size_type v22 = sub_2407941BC(v21, (uint64_t)",", 1);
      sub_240794060(&v92, "arg2");
      profile_decoder::key(&v94);
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v23 = &v94;
      }
      else {
        std::string::size_type v23 = (std::string *)v94.__r_.__value_.__r.__words[0];
      }
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v24 = HIBYTE(v94.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v24 = v94.__r_.__value_.__l.__size_;
      }
      v25 = sub_2407941BC(v22, (uint64_t)v23, v24);
      *(void *)((char *)v25 + *(void *)(*v25 - 24) + 24) = 10;
      std::string::size_type v26 = (void *)std::ostream::operator<<();
      std::string::size_type v27 = sub_2407941BC(v26, (uint64_t)",", 1);
      sub_240794060(&v89, "arg3");
      profile_decoder::key(&v91);
      if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v28 = &v91;
      }
      else {
        std::string::size_type v28 = (std::string *)v91.__r_.__value_.__r.__words[0];
      }
      if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v29 = HIBYTE(v91.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v29 = v91.__r_.__value_.__l.__size_;
      }
      std::string::size_type v30 = sub_2407941BC(v27, (uint64_t)v28, v29);
      *(void *)((char *)v30 + *(void *)(*v30 - 24) + 24) = 10;
      std::string::size_type v31 = (void *)std::ostream::operator<<();
      std::string::size_type v32 = sub_2407941BC(v31, (uint64_t)",", 1);
      sub_240794060(&v86, "arg4");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v34 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v34 = __p.__r_.__value_.__l.__size_;
      }
      std::string::size_type v35 = sub_2407941BC(v32, (uint64_t)p_p, v34);
      *(void *)((char *)v35 + *(void *)(*v35 - 24) + 24) = 10;
      v36 = (void *)std::ostream::operator<<();
      sub_2407941BC(v36, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v87 < 0) {
        operator delete(v86);
      }
      if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v91.__r_.__value_.__l.__data_);
      }
      if (v90 < 0) {
        operator delete(v89);
      }
      if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v94.__r_.__value_.__l.__data_);
      }
      if (v93 < 0) {
        operator delete(v92);
      }
      if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v97.__r_.__value_.__l.__data_);
      }
      if (v96 < 0) {
        operator delete(v95);
      }
      if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v100.__r_.__value_.__l.__data_);
      }
      if (v99 < 0) {
        operator delete(v98);
      }
      if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v102.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v101.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v105.__r_.__value_.__l.__data_);
      }
      if (v104 < 0)
      {
        std::string::size_type v37 = v103;
LABEL_149:
        operator delete(v37);
        return;
      }
      return;
    }
LABEL_106:
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
    return;
  }
  int v38 = BYTE1(*a3);
  if (v38 == 2)
  {
    sub_240794060(&v78, "ampType");
    profile_decoder::key(&v105);
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v53 = &v105;
    }
    else {
      std::string::size_type v53 = (std::string *)v105.__r_.__value_.__r.__words[0];
    }
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v54 = HIBYTE(v105.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v54 = v105.__r_.__value_.__l.__size_;
    }
    std::string::size_type v55 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v53, v54);
    *(void *)((char *)v55 + *(void *)(*v55 - 24) + 24) = 10;
    v56 = (void *)std::ostream::operator<<();
    std::string::size_type v57 = sub_2407941BC(v56, (uint64_t)",", 1);
    sub_240794060(&v76, "index");
    profile_decoder::key(&v102);
    if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v58 = &v102;
    }
    else {
      std::string::size_type v58 = (std::string *)v102.__r_.__value_.__r.__words[0];
    }
    if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v59 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v59 = v102.__r_.__value_.__l.__size_;
    }
    v60 = sub_2407941BC(v57, (uint64_t)v58, v59);
    *(void *)((char *)v60 + *(void *)(*v60 - 24) + 24) = 10;
    std::string::size_type v61 = (void *)std::ostream::operator<<();
    std::string::size_type v62 = sub_2407941BC(v61, (uint64_t)",", 1);
    sub_240794060(&v74, "presilence");
    profile_decoder::key(&v100);
    if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v63 = &v100;
    }
    else {
      std::string::size_type v63 = (std::string *)v100.__r_.__value_.__r.__words[0];
    }
    if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v64 = HIBYTE(v100.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v64 = v100.__r_.__value_.__l.__size_;
    }
    std::string::size_type v65 = sub_2407941BC(v62, (uint64_t)v63, v64);
    *(void *)((char *)v65 + *(void *)(*v65 - 24) + 24) = 10;
    std::string::size_type v66 = (void *)std::ostream::operator<<();
    std::string::size_type v67 = sub_2407941BC(v66, (uint64_t)",", 1);
    sub_240794060(&v72, "gain");
    profile_decoder::key(&v97);
    if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v68 = &v97;
    }
    else {
      std::string::size_type v68 = (std::string *)v97.__r_.__value_.__r.__words[0];
    }
    if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v69 = HIBYTE(v97.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v69 = v97.__r_.__value_.__l.__size_;
    }
    v70 = sub_2407941BC(v67, (uint64_t)v68, v69);
    *(void *)((char *)v70 + *(void *)(*v70 - 24) + 24) = 10;
    std::string::size_type v71 = (void *)std::ostream::operator<<();
    sub_2407941BC(v71, (uint64_t)",", 1);
    if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v97.__r_.__value_.__l.__data_);
    }
    if (v73 < 0) {
      operator delete(v72);
    }
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v100.__r_.__value_.__l.__data_);
    }
    if (v75 < 0) {
      operator delete(v74);
    }
    if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v102.__r_.__value_.__l.__data_);
    }
    if (v77 < 0) {
      operator delete(v76);
    }
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v79 < 0)
    {
      std::string::size_type v37 = v78;
      goto LABEL_149;
    }
    return;
  }
  if (v38 != 1) {
    goto LABEL_106;
  }
  sub_240794060(&v84, "ampType");
  profile_decoder::key(&v105);
  if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v39 = &v105;
  }
  else {
    v39 = (std::string *)v105.__r_.__value_.__r.__words[0];
  }
  if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v40 = HIBYTE(v105.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v40 = v105.__r_.__value_.__l.__size_;
  }
  std::string::size_type v41 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v39, v40);
  *(void *)((char *)v41 + *(void *)(*v41 - 24) + 24) = 10;
  std::string::size_type v42 = (void *)std::ostream::operator<<();
  std::string::size_type v43 = sub_2407941BC(v42, (uint64_t)",", 1);
  sub_240794060(&v82, "state");
  profile_decoder::key(&v102);
  if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v44 = &v102;
  }
  else {
    std::string::size_type v44 = (std::string *)v102.__r_.__value_.__r.__words[0];
  }
  if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v45 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v45 = v102.__r_.__value_.__l.__size_;
  }
  std::string::size_type v46 = sub_2407941BC(v43, (uint64_t)v44, v45);
  *(void *)((char *)v46 + *(void *)(*v46 - 24) + 24) = 10;
  v47 = (void *)std::ostream::operator<<();
  std::string::size_type v48 = sub_2407941BC(v47, (uint64_t)",", 1);
  sub_240794060(&v80, "refCount");
  profile_decoder::key(&v100);
  if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v49 = &v100;
  }
  else {
    v49 = (std::string *)v100.__r_.__value_.__r.__words[0];
  }
  if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v50 = HIBYTE(v100.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v50 = v100.__r_.__value_.__l.__size_;
  }
  v51 = sub_2407941BC(v48, (uint64_t)v49, v50);
  *(void *)((char *)v51 + *(void *)(*v51 - 24) + 24) = 10;
  std::string::size_type v52 = (void *)std::ostream::operator<<();
  sub_2407941BC(v52, (uint64_t)",", 1);
  if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v100.__r_.__value_.__l.__data_);
  }
  if (v81 < 0) {
    operator delete(v80);
  }
  if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v102.__r_.__value_.__l.__data_);
  }
  if (v83 < 0) {
    operator delete(v82);
  }
  if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v105.__r_.__value_.__l.__data_);
  }
  if (v85 < 0)
  {
    std::string::size_type v37 = v84;
    goto LABEL_149;
  }
}

void sub_24079385C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 193) < 0) {
    operator delete(*(void **)(v33 - 216));
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v33 - 145) < 0) {
    operator delete(*(void **)(v33 - 168));
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v33 - 97) < 0) {
    operator delete(*(void **)(v33 - 120));
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (*(char *)(v33 - 49) < 0) {
    operator delete(*(void **)(v33 - 72));
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(a1);
}

std::string *haptics_decoder::subtype_name@<X0>(profile_decoder *a1@<X2>, int a2@<W1>, std::string *a3@<X8>)
{
  if ((a2 - 7) > 2) {
    return std::to_string(a3, a1);
  }
  else {
    return profile_decoder::find_in_table((const entry *)&unk_2650D59F8, a1, 0x18u, a3);
  }
}

std::string *scm_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D5B78, __val, 6u, a2);
}

std::string *scm_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *wake_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_2650D5BD8, __val, 1u, a2);
}

std::string *wake_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_2650D5BE8, __val, 3u, a2);
}

void wake_decoder::parse_datatype(uint64_t a1, uint64_t a2, int *a3)
{
  int v6 = *a3;
  if (*a3 == 167772429)
  {
    sub_240794060(&v32, "wake_reason");
    profile_decoder::key(&v34);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v7 = &v34;
    }
    else {
      int v7 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v34.__r_.__value_.__l.__size_;
    }
    uint64_t v9 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v7, size);
    *(void *)((char *)v9 + *(void *)(*v9 - 24) + 24) = 10;
    std::string::size_type v10 = (void *)std::ostream::operator<<();
    std::string::size_type v11 = sub_2407941BC(v10, (uint64_t)",", 1);
    sub_240794060(&v29, "endpoint_ref");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v13 = __p.__r_.__value_.__l.__size_;
    }
    std::string::size_type v14 = sub_2407941BC(v11, (uint64_t)p_p, v13);
    *(void *)((char *)v14 + *(void *)(*v14 - 24) + 24) = 10;
    time_t v15 = (void *)std::ostream::operator<<();
    sub_2407941BC(v15, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v30 < 0) {
      operator delete(v29);
    }
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
    if (v33 < 0) {
      operator delete(v32);
    }
    int v6 = *a3;
  }
  if (v6 == 167772675)
  {
    sub_240794060(&v27, "wake_reason");
    profile_decoder::key(&v34);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v16 = &v34;
    }
    else {
      std::string::size_type v16 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v17 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v17 = v34.__r_.__value_.__l.__size_;
    }
    std::string::size_type v18 = sub_2407941BC((void *)(a2 + 16), (uint64_t)v16, v17);
    *(void *)((char *)v18 + *(void *)(*v18 - 24) + 24) = 10;
    std::string::size_type v19 = (void *)std::ostream::operator<<();
    unsigned int v20 = sub_2407941BC(v19, (uint64_t)",", 1);
    sub_240794060(&v25, "service_id");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v21 = &__p;
    }
    else {
      std::string::size_type v21 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v22 = __p.__r_.__value_.__l.__size_;
    }
    std::string::size_type v23 = sub_2407941BC(v20, (uint64_t)v21, v22);
    *(void *)((char *)v23 + *(void *)(*v23 - 24) + 24) = 10;
    std::string::size_type v24 = (void *)std::ostream::operator<<();
    sub_2407941BC(v24, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v26 < 0) {
      operator delete(v25);
    }
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }
    if (v28 < 0) {
      operator delete(v27);
    }
  }
  else
  {
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
  }
}

void sub_240793EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (*(char *)(v38 - 49) < 0) {
    operator delete(*(void **)(v38 - 72));
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void AOPLogDecoder::to_string(void *a1)
{
  unint64_t v2 = *(unsigned int *)a1;
  if (v2 >> 25 <= 6
    && (int v3 = *(void (****)(void, void *))((char *)&AOPLogDecoder::_decoders + ((v2 >> 21) & 0x7F8))) != 0)
  {
    (**v3)(v3, a1);
  }
  else
  {
    profile_decoder::to_string((uint64_t)&AOPLogDecoder::_default, a1);
  }
}

std::string *AOPLogDecoder::category_to_string@<X0>(AOPLogDecoder *this@<X0>, std::string *a2@<X8>)
{
  if (this <= 0xD && (int v3 = (&AOPLogDecoder::_decoders)[this]) != 0) {
    return (std::string *)((uint64_t (*)(uint64_t (***)(), AOPLogDecoder *))(*v3)[1])(v3, this);
  }
  else {
    return std::to_string(a2, this);
  }
}

std::string *AOPLogDecoder::component_to_string@<X0>(AOPLogDecoder *this@<X0>, uint64_t __val@<X1>, std::string *a3@<X8>)
{
  if (this <= 0xD && (int v3 = (&AOPLogDecoder::_decoders)[this]) != 0) {
    return (std::string *)((uint64_t (*)(uint64_t (***)(), uint64_t))(*v3)[2])(v3, __val);
  }
  else {
    return std::to_string(a3, __val);
  }
}

void *sub_240794060(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_240794114();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    int v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_240794114()
{
}

void sub_24079412C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_240794188(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2650D4740, MEMORY[0x263F8C060]);
}

void sub_240794174(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_240794188(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *sub_2407941BC(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2455F8F00](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      std::string::size_type v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
    if (!sub_240794360(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2455F8F10](v13);
  return a1;
}

void sub_2407942F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2455F8F10](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2407942D8);
}

void sub_24079434C(_Unwind_Exception *a1)
{
}

uint64_t sub_240794360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_2407944E8(__p, v12, __c);
      std::string::size_type v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_2407944CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_2407944E8(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    sub_240794114();
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
    *__b = v6;
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

void *sub_240794594(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_240794114();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    size_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t SPU_log_get_report_size(uint64_t a1)
{
  return ((*(void *)(a1 + 8) >> 2) & 0xF0) + 16;
}

uint64_t SPU_log_next_report(uint64_t a1)
{
  uint64_t v1 = a1 + ((*(void *)(a1 + 8) >> 2) & 0xF0);
  int v3 = *(_DWORD *)(v1 + 16);
  uint64_t v2 = v1 + 16;
  if (v3) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t SPU_log_end_iterator(uint64_t a1)
{
  return a1 + 256;
}

uint64_t SPU_log_get_num_reports(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = 0;
    uint64_t v2 = v1 + 256;
    do
    {
      if (!*(_DWORD *)v1) {
        break;
      }
      ++result;
      uint64_t v3 = v1 + ((*(void *)(v1 + 8) >> 2) & 0xF0);
      int v4 = *(_DWORD *)(v3 + 16);
      uint64_t v1 = v3 + 16;
      uint64_t v5 = v4 ? v1 : 0;
    }
    while (v5 && v5 != v2);
  }
  return result;
}

uint64_t spu_log_device_time_to_mach_time(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  mach_port_t v8 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v9 = IOServiceMatching("AppleSPUTimesync");
  io_service_t MatchingService = IOServiceGetMatchingService(v8, v9);
  if (MatchingService)
  {
    io_object_t v11 = MatchingService;
    uint64_t v26 = 0;
    uint64_t valuePtr = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, @"timesync", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      CFDictionaryRef v13 = CFProperty;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"ap");
      Boolean v15 = CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
      CFNumberRef v16 = (const __CFNumber *)CFDictionaryGetValue(v13, @"ap-cont");
      char v17 = v15 & CFNumberGetValue(v16, kCFNumberLongLongType, &v26);
      CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(v13, @"spu");
      unsigned __int8 v19 = v17 & CFNumberGetValue(v18, kCFNumberLongLongType, &v25);
      CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(v13, @"calendar");
      Boolean v21 = CFNumberGetValue(v20, kCFNumberLongLongType, &v24);
      if (a2) {
        *a2 = valuePtr + 1000 * a1 - v25;
      }
      if (a3) {
        *a3 = v26 + 1000 * a1 - v25;
      }
      uint64_t v22 = v19 & 1u & v21;
      if (a4) {
        *a4 = v24 + 1000 * a1 - v25;
      }
      CFRelease(v13);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "timesync != __null", "", "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 32, 0);
      uint64_t v22 = 0;
    }
    IOObjectRelease(v11);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "service != 0", "", "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 29, 0);
    return 0;
  }
  return v22;
}

uint64_t spu_log_calendar_time_to_walltime(unint64_t a1, char *a2, size_t a3)
{
  time_t v7 = a1 / 0x3B9ACA00;
  uint64_t v5 = localtime(&v7);
  strftime(a2, a3, "%b %d %T", v5);
  return 1;
}

unint64_t spu_log_ns_to_mach_time(unint64_t a1)
{
  double v2 = *(double *)&qword_268C8F778;
  if (*(double *)&qword_268C8F778 == 0.0)
  {
    mach_timebase_info(&info);
    LODWORD(v3) = info.numer;
    LODWORD(v4) = info.denom;
    double v2 = (double)v3 / (double)v4;
    qword_268C8F778 = *(void *)&v2;
  }
  return (unint64_t)((double)a1 / v2);
}

uint64_t spu_log_report_to_string(uint64_t result, unsigned char *a2, unint64_t a3, int a4, char *a5, size_t a6)
{
  if (result)
  {
    io_object_t v11 = (const char *)result;
    size_t v12 = strlen((const char *)result);
    uint64_t v13 = 2;
    if (a4) {
      uint64_t v13 = 3;
    }
    if (v12 + v13 * a3 + 2 >= a6)
    {
      return 0;
    }
    else
    {
      strlcpy(a5, v11, a6);
      strlcat(a5, " ", a6);
      uint64_t v14 = &a5[strlen(a5)];
      if (a3)
      {
        uint64_t v15 = 0;
        do
        {
          char *v14 = a0123456789abcd[(unint64_t)a2[v15] >> 4];
          v14[1] = a0123456789abcd[a2[v15] & 0xF];
          if (a4)
          {
            v14[2] = 32;
            v14 += 3;
          }
          else
          {
            v14 += 2;
          }
          ++v15;
        }
        while (a3 > v15);
      }
      char *v14 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t spu_log_print_report(void *a1, const char *a2, unsigned char *a3, unint64_t a4, int a5)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = spu_log_report_to_string((uint64_t)a2, a3, a4, a5, v6, 0x800uLL);
  if (result) {
    return puts(v6);
  }
  return result;
}

BOOL spu_log_get_aop_logs(int a1, uint64_t a2, void (*a3)(void *, const char *, const void *, unint64_t, BOOL), void *a4)
{
  kern_return_t v6;
  uint64_t v7;
  size_t v8;
  unsigned __int8 v9;
  char *v10;
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
  long long v21;
  long long v22;
  char *v23;
  char *v24;
  int v25;
  char *v26;
  int v27;
  char *v28;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  int v34;
  char *v35;
  BOOL v36;
  BOOL v37;
  BOOL v39;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
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
  unsigned char v63[184];
  size_t v64;
  void *v65;
  uint64_t v66[3];
  uint64_t v67;
  int inputStruct;
  uint64_t input[4];

  input[1] = *MEMORY[0x263EF8340];
  inputStruct = a1;
  std::string::size_type v65 = &unk_26F4E5500;
  sub_240794060(v66, "AOP_log");
  std::string::size_type v67 = 0;
  input[0] = 35;
  std::string::size_type v64 = a2 << 8;
  outputStruct = (char *)malloc_type_malloc(a2 << 8, 0x50856C2AuLL);
  if (outputStruct)
  {
    v39 = AOPServiceConnect::connect((AOPServiceConnect *)&v65);
    if (v39)
    {
      uint64_t v6 = IOConnectCallMethod(v67, 3u, input, 1u, &inputStruct, 4uLL, 0, 0, outputStruct, &v64);
      if (v6)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "kr == 0 ", "", "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 138, v6);
      }
      else if (v64 >= 0x100)
      {
        uint64_t v7 = 0;
        mach_port_t v8 = v64 >> 8;
        do
        {
          CFDictionaryRef v9 = 0;
          std::string::size_type v62 = 0u;
          memset(v63, 0, 176);
          v60 = 0u;
          std::string::size_type v61 = 0u;
          std::string::size_type v58 = 0u;
          std::string::size_type v59 = 0u;
          v56 = 0u;
          std::string::size_type v57 = 0u;
          std::string::size_type v54 = 0u;
          std::string::size_type v55 = 0u;
          std::string::size_type v52 = 0u;
          std::string::size_type v53 = 0u;
          std::string::size_type v50 = 0u;
          v51 = 0u;
          std::string::size_type v48 = 0u;
          v49 = 0u;
          std::string::size_type v46 = 0u;
          v47 = 0u;
          std::string::size_type v45 = 0u;
          std::string::size_type v43 = 0;
          std::string::size_type v44 = 0;
          std::string::size_type v42 = 0;
          std::string::size_type v10 = &outputStruct[256 * v7];
          io_object_t v11 = *((_OWORD *)v10 + 3);
          uint64_t v13 = *(_OWORD *)v10;
          size_t v12 = *((_OWORD *)v10 + 1);
          std::string::size_type v48 = *((_OWORD *)v10 + 2);
          v49 = v11;
          std::string::size_type v46 = v13;
          v47 = v12;
          uint64_t v14 = *((_OWORD *)v10 + 7);
          CFNumberRef v16 = *((_OWORD *)v10 + 4);
          uint64_t v15 = *((_OWORD *)v10 + 5);
          std::string::size_type v52 = *((_OWORD *)v10 + 6);
          std::string::size_type v53 = v14;
          std::string::size_type v50 = v16;
          v51 = v15;
          char v17 = *((_OWORD *)v10 + 11);
          unsigned __int8 v19 = *((_OWORD *)v10 + 8);
          CFNumberRef v18 = *((_OWORD *)v10 + 9);
          v56 = *((_OWORD *)v10 + 10);
          std::string::size_type v57 = v17;
          std::string::size_type v54 = v19;
          std::string::size_type v55 = v18;
          CFNumberRef v20 = *((_OWORD *)v10 + 15);
          uint64_t v22 = *((_OWORD *)v10 + 12);
          Boolean v21 = *((_OWORD *)v10 + 13);
          v60 = *((_OWORD *)v10 + 14);
          std::string::size_type v61 = v20;
          std::string::size_type v58 = v22;
          std::string::size_type v59 = v21;
          std::string::size_type v23 = v10 + 256;
          uint64_t v24 = v10;
          uint64_t v25 = *(_DWORD *)v10;
          do
          {
            if (!v25) {
              break;
            }
            ++v9;
            uint64_t v26 = &v24[(*((void *)v24 + 1) >> 2) & 0xF0];
            std::string::size_type v27 = *((_DWORD *)v26 + 4);
            uint64_t v24 = v26 + 16;
            uint64_t v25 = v27;
            char v28 = v27 ? v24 : 0;
          }
          while (v28 && v28 != v23);
          BYTE3(v45) = v9;
          LOWORD(v45) = 24 * v9 + 272;
          char v30 = (unint64_t *)v63;
          do
          {
            spu_log_device_time_to_mach_time(*((void *)v10 + 1) >> 10, &v44, &v43, &v42);
            *((_DWORD *)v30 - 4) = *((_DWORD *)v10 + 1);
            std::string::size_type v31 = spu_log_ns_to_mach_time(v43);
            std::string::size_type v32 = v42;
            *(v30 - 1) = v31;
            *char v30 = v32;
            char v33 = &v10[(*((void *)v10 + 1) >> 2) & 0xF0];
            std::string v34 = *((_DWORD *)v33 + 4);
            std::string::size_type v10 = v33 + 16;
            if (v34) {
              std::string::size_type v35 = v10;
            }
            else {
              std::string::size_type v35 = 0;
            }
            v30 += 3;
            if (v35) {
              v36 = v35 == v23;
            }
            else {
              v36 = 1;
            }
          }
          while (!v36);
          a3(a4, "AOPLOG", &v45, (unsigned __int16)v45, 0);
          ++v7;
        }
        while (v7 != v8);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "success", "", "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 135, 0);
    }
    free(outputStruct);
    std::string::size_type v37 = v39;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "aop_reports", "", "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 132, 0);
    std::string::size_type v37 = 0;
  }
  AOPServiceConnect::~AOPServiceConnect((AOPServiceConnect *)&v65);
  return v37;
}

void sub_240794EA4(_Unwind_Exception *exception_object)
{
}

void AOPServiceConnect::~AOPServiceConnect(void **this)
{
  *this = &unk_26F4E5500;
  AOPServiceConnect::disconnect((AOPServiceConnect *)this);
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

{
  uint64_t vars8;

  AOPServiceConnect::~AOPServiceConnect(this);

  JUMPOUT(0x2455F9040);
}

BOOL AOPServiceConnect::connect(AOPServiceConnect *this)
{
  mach_port_t v2 = *MEMORY[0x263F0EC90];
  unint64_t v3 = (char *)this + 8;
  if (*((char *)this + 31) < 0) {
    unint64_t v3 = *(const char **)v3;
  }
  CFDictionaryRef v4 = IOServiceNameMatching(v3);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v4);
  *((_DWORD *)this + 9) = MatchingService;
  return MatchingService && !IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)this + 8);
}

uint64_t AOPServiceConnect::disconnect(AOPServiceConnect *this)
{
  io_connect_t v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 8) = 0;
  }
  uint64_t result = *((unsigned int *)this + 9);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 9) = 0;
  }
  return result;
}

void sub_240795018(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_240785000, log, OS_LOG_TYPE_FAULT, "fault!", v1, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t ADClientClearDistributionKey()
{
  return MEMORY[0x270F0B6B8]();
}

uint64_t ADClientClearScalarKey()
{
  return MEMORY[0x270F0B6C0]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x270F0B6C8]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x270F0B6D0]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x270F0B6D8]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
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

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x270EF4690]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x270EF4698]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
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

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
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