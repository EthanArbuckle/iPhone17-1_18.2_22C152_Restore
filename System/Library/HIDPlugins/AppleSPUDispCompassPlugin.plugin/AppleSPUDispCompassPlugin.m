uint64_t sub_24078414C(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_240784164()
{
  return 1000;
}

uint64_t sub_24078416C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void AppleSPUDispCompassPlugin::alloc(AppleSPUDispCompassPlugin *this, const __CFAllocator *a2)
{
  v3 = (AppleSPUDispCompassPlugin *)CFAllocatorAllocate(this, 32, 0);

  AppleSPUDispCompassPlugin::AppleSPUDispCompassPlugin(v3, this);
}

void AppleSPUDispCompassPlugin::operator delete(CFAllocatorRef *ptr)
{
}

void sub_2407841E4(void *a1)
{
}

void AppleSPUDispCompassPlugin::AppleSPUDispCompassPlugin(AppleSPUDispCompassPlugin *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUDispCompassPlugin::vtbl;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 3) = 0;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xAu, 0x5Fu, 0x53u, 0x71u, 0xC1u, 0x3Eu, 0x48u, 0xC6u, 0x8Eu, 0xBu, 0, 0xCu, 0x56u, 0xE8u, 0x35u, 0xF2u);
  CFPlugInAddInstanceForFactory(v2);
}

void AppleSPUDispCompassPlugin::~AppleSPUDispCompassPlugin(AppleSPUDispCompassPlugin *this)
{
  os_release((void *)qword_268C8F6E8);
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xAu, 0x5Fu, 0x53u, 0x71u, 0xC1u, 0x3Eu, 0x48u, 0xC6u, 0x8Eu, 0xBu, 0, 0xCu, 0x56u, 0xE8u, 0x35u, 0xF2u);
  CFPlugInRemoveInstanceForFactory(v1);
}

uint64_t AppleSPUDispCompassPlugin::QueryInterface(AppleSPUDispCompassPlugin *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
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

uint64_t AppleSPUDispCompassPlugin::AddRef(AppleSPUDispCompassPlugin *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUDispCompassPlugin::Release(AppleSPUDispCompassPlugin *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUDispCompassPlugin::~AppleSPUDispCompassPlugin(this);
    AppleSPUDispCompassPlugin::operator delete(v3);
  }
  return v2;
}

void AppleSPUDispCompassPlugin::open()
{
  if (qword_268C8F6F0 != -1) {
    dispatch_once(&qword_268C8F6F0, &unk_26F4E4DB8);
  }
  operator new();
}

os_log_t sub_2407845F8()
{
  os_log_t result = os_log_create("AOP", "AppleSPUDispCompassPlugin");
  qword_268C8F6E8 = (uint64_t)result;
  return result;
}

uint64_t AppleSPUDispCompassPlugin::openInterface(uint64_t a1, uint64_t a2)
{
  kern_return_t v11;
  IOCFPlugInInterface **v12;
  BOOL v13;
  uint64_t v14;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v16;
  CFUUIDBytes v17;
  uint64_t v18;
  int v19;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;

  theInterface = 0;
  CFNumberRef IOHIDServiceRegistryID = AppleSPUDispCompassPlugin::getIOHIDServiceRegistryID();
  mach_port_t v4 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v5 = IORegistryEntryIDMatching((uint64_t)IOHIDServiceRegistryID);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!a2) {
    return 3758097090;
  }
  io_service_t v7 = MatchingService;
  *(_DWORD *)a2 = MatchingService;
  if (!MatchingService) {
    return 3758097136;
  }
  theScore = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x3Bu, 0xC5u, 0xCCu, 0x87u, 0x84u, 0x5Eu, 0x48u, 0xABu, 0xA9u, 0xC2u, 0x94u, 0x36u, 0, 0x1Bu, 0xA6u, 0x8Au);
  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v11 = IOCreatePlugInInterfaceForService(v7, v9, v10, &theInterface, &theScore);
  v12 = theInterface;
  if (v11) {
    v13 = 1;
  }
  else {
    v13 = theInterface == 0;
  }
  if (v13)
  {
    v14 = 0;
    if (!theInterface) {
      return v14;
    }
    goto LABEL_14;
  }
  QueryInterface = (*theInterface)->QueryInterface;
  v16 = CFUUIDGetConstantUUIDWithBytes(v8, 0x59u, 0x79u, 0x99u, 0x3Cu, 0x85u, 0xF5u, 0x4Du, 0x59u, 0x85u, 0x93u, 0xFFu, 0x92u, 0x15u, 0xDAu, 0x47u, 0xADu);
  v17 = CFUUIDGetUUIDBytes(v16);
  ((void (*)(IOCFPlugInInterface **, void, void, uint64_t))QueryInterface)(v12, *(void *)&v17.byte0, *(void *)&v17.byte8, a2 + 8);
  v18 = *(void *)(a2 + 8);
  if (v18)
  {
    v19 = (*(uint64_t (**)(uint64_t, void))(*(void *)v18 + 64))(v18, 0);
    v12 = theInterface;
    if (v19)
    {
      v14 = 3758097101;
      if (!theInterface) {
        return v14;
      }
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_14;
  }
  v14 = 0;
  v12 = theInterface;
  if (theInterface) {
LABEL_14:
  }
    ((void (*)(IOCFPlugInInterface **))(*v12)->Release)(v12);
  return v14;
}

void sub_240784838(uint64_t a1, int token)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v7[0] = 0;
  notify_get_state(token, v7);
  if (v7[0]) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  uint64_t v4 = *(void *)(v2 + 24);
  LODWORD(v7[0]) = 89;
  HIDWORD(v7[0]) = v3;
  uint64_t v5 = *(void *)(v4 + 8);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, void, void))(*(void *)v5 + 80))(v5, 4, v7, 8, 0, 0);
  }
  CFAllocatorRef v6 = qword_268C8F6E8;
  if (os_log_type_enabled((os_log_t)qword_268C8F6E8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v7[0]) = 67109120;
    HIDWORD(v7[0]) = v3;
    _os_log_impl(&dword_240783000, v6, OS_LOG_TYPE_DEFAULT, "Forced compass power mode %d", (uint8_t *)v7, 8u);
  }
}

uint64_t AppleSPUDispCompassPlugin::setProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = a5 + 4;
  MEMORY[0x270FA5388]();
  CFAllocatorRef v8 = (_DWORD *)((char *)v13 - ((v7 + 19) & 0xFFFFFFFFFFFFFFF0));
  *CFAllocatorRef v8 = v9;
  memcpy(v8 + 1, v10, v7);
  uint64_t v11 = *(void *)(a2 + 8);
  if (v11) {
    return (*(uint64_t (**)(uint64_t, uint64_t, _DWORD *, uint64_t, void, void))(*(void *)v11 + 80))(v11, 4, v8, v6, 0, 0);
  }
  else {
    return 3758097112;
  }
}

uint64_t AppleSPUDispCompassPlugin::close(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    MEMORY[0x2455F8B20](v2, 0x10B0C4017A8DECDLL);
    *(void *)(a1 + 24) = 0;
  }
  int v3 = dword_268C8F6F8;

  return notify_cancel(v3);
}

const __CFNumber *AppleSPUDispCompassPlugin::getIOHIDServiceRegistryID()
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

uint64_t AppleSPUDispCompassPlugin::match()
{
  return 1000;
}

uint64_t AppleSPUDispCompassPlugin::filter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void AppleSPUDispCompassServicePluginFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (CFEqual(a2, v4))
  {
    uint64_t v5 = (AppleSPUDispCompassPlugin *)CFAllocatorAllocate(a1, 32, 0);
    AppleSPUDispCompassPlugin::AppleSPUDispCompassPlugin(v5, a1);
  }
}

uint64_t AppleSPUDispCompassPlugin::performCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7 = *(void *)(a2 + 8);
  if (!v7) {
    return 3758097112;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))(*(void *)v7 + 80))(v7, a3, a4, a5, a6, a7);
  if (result) {
    *a7 = 0;
  }
  return result;
}

uint64_t AppleSPUDispCompassPlugin::getProperty(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t result = 3758097090;
  int v11 = a3;
  uint64_t v10 = a5;
  if (a6)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    if (v7)
    {
      uint64_t result = (*(uint64_t (**)(void, uint64_t, int *, uint64_t, uint64_t, uint64_t *))(*(void *)v7 + 80))(*(void *)(a2 + 8), 10, &v11, 4, a4, &v10);
      uint64_t v9 = v10;
      if (result) {
        uint64_t v9 = 0;
      }
      *a6 = v9;
    }
    else
    {
      return 3758097112;
    }
  }
  return result;
}

void sub_240784C44(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_240783000, log, OS_LOG_TYPE_ERROR, "Error connecting to compass service!", v1, 2u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
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

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
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