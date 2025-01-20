uint64_t IOUSBLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  IOUSBDeviceClass *v4;
  CFUUIDRef v5;
  IOUSBInterfaceClass *v6;
  uint64_t vars8;

  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v4 = (IOUSBDeviceClass *)CFEqual(a2, v3);
  if (v4)
  {
    IOUSBDeviceClass::alloc(v4);
  }
  v5 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v6 = (IOUSBInterfaceClass *)CFEqual(a2, v5);
  if (v6)
  {
    IOUSBInterfaceClass::alloc(v6);
  }
  return 0;
}

void IOUSBIUnknown::factoryAddRef(IOUSBIUnknown *this)
{
  if (!atomic_fetch_add(&IOUSBIUnknown::factoryRefCount, 1u))
  {
    CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes(0, 0x45u, 0x47u, 0xA8u, 0xAAu, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xA9u, 0xBDu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    CFRetain(v1);
    CFPlugInAddInstanceForFactory(v1);
  }
}

void IOUSBIUnknown::factoryRelease(IOUSBIUnknown *this)
{
  if (atomic_fetch_add(&IOUSBIUnknown::factoryRefCount, 0xFFFFFFFF) == 1)
  {
    CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes(0, 0x45u, 0x47u, 0xA8u, 0xAAu, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xA9u, 0xBDu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    CFPlugInRemoveInstanceForFactory(v1);
    CFRelease(v1);
  }
}

void IOUSBIUnknown::IOUSBIUnknown(IOUSBIUnknown *this, void *a2)
{
  *(void *)this = off_C260;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = this;
  IOUSBIUnknown::factoryAddRef(this);
}

void IOUSBIUnknown::~IOUSBIUnknown(IOUSBIUnknown *this)
{
  *(void *)this = off_C260;
  IOUSBIUnknown::factoryRelease(this);
}

uint64_t IOUSBIUnknown::addRef(atomic_uint *this)
{
  return atomic_fetch_add(this + 2, 1u) + 1;
}

uint64_t IOUSBIUnknown::release(atomic_uint *this)
{
  uint64_t v1 = atomic_fetch_add(this + 2, 0xFFFFFFFF) - 1;
  if (this && !v1) {
    (*(void (**)(atomic_uint *))(*(void *)this + 8))(this);
  }
  return v1;
}

uint64_t IOUSBIUnknown::genericQueryInterface(IOUSBIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(void, void *, void, void))(**((void **)this + 1) + 16))(*((void *)this + 1), a2, *(void *)&a3.byte0, *(void *)&a3.byte8);
}

uint64_t IOUSBIUnknown::genericAddRef(IOUSBIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 24))();
}

uint64_t IOUSBIUnknown::genericRelease(IOUSBIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 32))();
}

uint64_t IOUSBIUnknown::GetIOUSBLibVersion(IOUSBIUnknown *this, NumVersion *a2, NumVersion *a3)
{
  CFURLRef v5 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/Extensions/IOUSBHostFamily.kext", kCFURLPOSIXPathStyle, 1u);
  v6 = CFBundleCreate(kCFAllocatorDefault, v5);
  CFBundleGetVersionNumber(v6);
  UInt32 VersionNumber = CFBundleGetVersionNumber(v6);
  if (!VersionNumber)
  {
    ValueForInfoDictionaryKey = (IOUSBIUnknown *)CFBundleGetValueForInfoDictionaryKey(v6, kCFBundleVersionKey);
    UInt32 VersionNumber = IOUSBIUnknown::_versionNumberFromString(ValueForInfoDictionaryKey, (CFStringRef)ValueForInfoDictionaryKey);
  }
  CFRelease(v5);
  CFRelease(v6);
  CFURLRef v9 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/System/Library/Extensions/IOUSBHostFamily.kext/PlugIns/IOUSBLib.bundle", kCFURLPOSIXPathStyle, 1u);
  v10 = CFBundleCreate(kCFAllocatorDefault, v9);
  CFBundleGetVersionNumber(v10);
  UInt32 v11 = CFBundleGetVersionNumber(v10);
  if (!v11)
  {
    v12 = (IOUSBIUnknown *)CFBundleGetValueForInfoDictionaryKey(v10, kCFBundleVersionKey);
    UInt32 v11 = IOUSBIUnknown::_versionNumberFromString(v12, (CFStringRef)v12);
  }
  CFRelease(v9);
  CFRelease(v10);
  if (a2) {
    *a2 = (NumVersion)v11;
  }
  if (a3) {
    *a3 = (NumVersion)VersionNumber;
  }
  return 0;
}

uint64_t IOUSBIUnknown::_versionNumberFromString(IOUSBIUnknown *this, CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(theString);
  if ((unint64_t)(Length - 21) < 0xFFFFFFFFFFFFFFECLL) {
    return 0;
  }
  unint64_t v5 = Length;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v6;
  v22[1] = v6;
  v7 = (__int16 *)v22;
  v24.location = 0;
  v24.length = Length;
  CFStringGetCharacters(theString, v24, (UniChar *)v22);
  __int16 v8 = v22[0];
  if ((unsigned __int16)(LOWORD(v22[0]) - 58) >= 0xFFF6u)
  {
    uint64_t v11 = 1;
    do
      int v12 = *((unsigned __int16 *)v22 + v11++);
    while (v12 != 46);
    uint64_t v13 = 0;
    unsigned int v14 = 0;
    v7 = (__int16 *)v22 + 1;
    while (1)
    {
      int v15 = (unsigned __int16)*(v7 - 1);
      if (v15 == 46) {
        break;
      }
      v14 += (v15 - 48) * __exp10((double)(v11 + v13 - 2));
      ++v7;
      --v13;
      if (!(v5 + v13))
      {
        unsigned int v16 = 0;
        unsigned int v9 = (v14 / 0x64) << 24;
        unsigned int v10 = (v14 + 65436 * (v14 / 0x64)) << 16;
        goto LABEL_26;
      }
    }
    unsigned int v9 = (v14 / 0x64) << 24;
    unsigned int v10 = (v14 + 65436 * (v14 / 0x64)) << 16;
    if ((uint64_t)(v5 + v13) >= 2)
    {
      unint64_t v5 = v5 + v13 - 1;
      __int16 v8 = *v7;
      goto LABEL_14;
    }
    unsigned int v16 = 0;
LABEL_26:
    int v18 = 0x8000;
  }
  else
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
LABEL_14:
    unsigned __int16 v17 = v8 - 49;
    if ((v17 & 0xFFFC) != 0) {
      int v18 = 0;
    }
    else {
      int v18 = (v17 << 13) + 0x2000;
    }
    if (v5 >= 3 && (int v19 = (unsigned __int16)v7[2], (v19 - 58) >= 0xFFFFFFF6))
    {
      unsigned int v16 = v19 - 48;
      if (v5 != 3)
      {
        int v20 = (unsigned __int16)v7[3];
        if ((v20 - 58) >= 0xFFFFFFF6)
        {
          unsigned int v16 = v20 + 10 * v16 - 48;
          if (v5 != 4)
          {
            int v21 = (unsigned __int16)v7[4];
            if ((v21 - 58) >= 0xFFFFFFF6) {
              unsigned int v16 = v21 + 10 * v16 - 48;
            }
          }
        }
      }
    }
    else
    {
      unsigned int v16 = 0;
    }
  }
  if (v16 >= 0xFF) {
    unsigned int v16 = 255;
  }
  return v10 + v18 + v9 + v16;
}

void IOUSBDeviceClass::alloc(IOUSBDeviceClass *this)
{
}

void sub_3544()
{
}

void IOUSBDeviceClass::IOUSBDeviceClass(IOUSBDeviceClass *this)
{
  IOUSBIUnknown::IOUSBIUnknown(this, &IOUSBDeviceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_C2B0;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_DWORD *)(v1 + 104) = 0;
  *(void *)(v1 + 112) = 0;
  *(_WORD *)(v1 + 120) = 0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(void *)(v1 + 93) = 0;
  *(void *)(v1 + 32) = &IOUSBDeviceClass::sUSBDeviceInterface;
}

{
  uint64_t v1;

  IOUSBIUnknown::IOUSBIUnknown(this, &IOUSBDeviceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_C2B0;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_DWORD *)(v1 + 104) = 0;
  *(void *)(v1 + 112) = 0;
  *(_WORD *)(v1 + 120) = 0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(void *)(v1 + 93) = 0;
  *(void *)(v1 + 32) = &IOUSBDeviceClass::sUSBDeviceInterface;
}

void IOUSBDeviceClass::~IOUSBDeviceClass(IOUSBDeviceClass *this)
{
  *(void *)this = off_C2B0;
  v2 = (void *)*((void *)this + 14);
  if (v2)
  {
    unsigned int v3 = *((unsigned __int8 *)this + 93);
    if (*((unsigned char *)this + 93))
    {
      unint64_t v4 = 0;
      do
      {
        unint64_t v5 = *(void **)(*((void *)this + 14) + 8 * v4);
        if (v5)
        {
          free(v5);
          unsigned int v3 = *((unsigned __int8 *)this + 93);
        }
        ++v4;
      }
      while (v4 < v3);
      v2 = (void *)*((void *)this + 14);
    }
    free(v2);
    *((void *)this + 14) = 0;
  }
  io_connect_t v6 = *((_DWORD *)this + 14);
  if (v6)
  {
    IOServiceClose(v6);
    *((_DWORD *)this + 14) = 0;
  }
  io_object_t v7 = *((_DWORD *)this + 12);
  if (v7)
  {
    IOObjectRelease(v7);
    *((_DWORD *)this + 12) = 0;
  }
  io_object_t v8 = *((_DWORD *)this + 13);
  if (v8)
  {
    IOObjectRelease(v8);
    *((_DWORD *)this + 13) = 0;
  }
  unsigned int v9 = (IONotificationPort *)*((void *)this + 8);
  if (v9)
  {
    IONotificationPortDestroy(v9);
    *((void *)this + 8) = 0;
  }

  IOUSBIUnknown::~IOUSBIUnknown(this);
}

{
  uint64_t vars8;

  IOUSBDeviceClass::~IOUSBDeviceClass(this);

  operator delete();
}

void sub_3708(_Unwind_Exception *a1)
{
  IOUSBIUnknown::~IOUSBIUnknown(v1);
  _Unwind_Resume(a1);
}

void sub_3720(void *a1)
{
}

void sub_3780()
{
}

uint64_t IOUSBDeviceClass::queryInterface(IOUSBDeviceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v7)))
  {
    io_object_t v8 = (char *)this + 16;
    uint64_t v9 = *(void *)this;
LABEL_4:
    *a3 = v8;
    (*(void (**)(IOUSBDeviceClass *))(v9 + 24))(this);
    goto LABEL_5;
  }
  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x5Cu, 0x81u, 0x87u, 0xD0u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0x8Bu, 0x45u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  if (CFEqual(v5, v12)) {
    goto LABEL_20;
  }
  CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(0, 0x15u, 0x2Fu, 0xC4u, 0x96u, 0x48u, 0x91u, 0x11u, 0xD5u, 0x9Du, 0x52u, 0, 0xAu, 0x27u, 0x80u, 0x1Eu, 0x86u);
  if (CFEqual(v5, v13)) {
    goto LABEL_20;
  }
  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x3Cu, 0x9Eu, 0xE1u, 0xEBu, 0x24u, 2u, 0x11u, 0xB2u, 0x8Eu, 0x7Eu, 0, 0xAu, 0x27u, 0x80u, 0x1Eu, 0x86u);
  if (CFEqual(v5, v14)) {
    goto LABEL_20;
  }
  CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0xC8u, 9u, 0xB8u, 0xD8u, 8u, 0x84u, 0x11u, 0xD7u, 0xBBu, 0x96u, 0, 3u, 0x93u, 0x3Eu, 0x3Eu, 0x3Eu);
  if (CFEqual(v5, v15)
    || (CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0xFEu, 0x2Fu, 0xD5u, 0x2Fu, 0x3Bu, 0x5Au, 0x47u, 0x3Bu, 0x97u, 0x7Bu, 0xADu, 0x99u, 0, 0x1Eu, 0xB3u, 0xEDu), CFEqual(v5, v16))|| (v17 = CFUUIDGetConstantUUIDWithBytes(
                0,
                0x39u,
                0x61u,
                4u,
                0xF7u,
                0x94u,
                0x3Du,
                0x48u,
                0x93u,
                0x90u,
                0xF1u,
                0x69u,
                0xBDu,
                0x6Cu,
                0xF5u,
                0xC2u,
                0xEBu),
        CFEqual(v5, v17))
    || (CFUUIDRef v18 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu), CFEqual(v5, v18))|| (v19 = CFUUIDGetConstantUUIDWithBytes(
                kCFAllocatorSystemDefault,
                0x81u,
                0x24u,
                0x93u,
                0xDCu,
                0x91u,
                0x89u,
                0x4Cu,
                0x11u,
                0xB1u,
                0x36u,
                0xC6u,
                0x10u,
                8u,
                0x6Fu,
                0xAEu,
                0x41u),
        CFEqual(v5, v19))
    || (CFUUIDRef v20 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xA3u, 0x3Cu, 0xF0u, 0x47u, 0x4Bu, 0x5Bu, 0x48u, 0xE2u, 0xB5u, 0x7Du, 2u, 7u, 0xFCu, 0xEAu, 0xE1u, 0x3Bu), CFEqual(v5, v20))|| (v21 = CFUUIDGetConstantUUIDWithBytes(
                kCFAllocatorSystemDefault,
                0x4Au,
                0xACu,
                0x1Bu,
                0x2Eu,
                0x24u,
                0xC2u,
                0x47u,
                0x6Au,
                0x96u,
                0x4Du,
                0x91u,
                0x33u,
                0x35u,
                0x34u,
                0xF2u,
                0xCCu),
        CFEqual(v5, v21))
    || (CFUUIDRef v22 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x56u, 0xADu, 8u, 0x9Du, 0x87u, 0x8Du, 0x4Bu, 0xEAu, 0xA1u, 0xF5u, 0x2Cu, 0x8Du, 0xC4u, 0x3Eu, 0x8Au, 0x98u), CFEqual(v5, v22)))
  {
LABEL_20:
    io_object_t v8 = (char *)this + 32;
    uint64_t v9 = *(void *)this;
    goto LABEL_4;
  }
  *a3 = 0;
LABEL_5:
  if (*a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 2147483652;
  }
  CFRelease(v5);
  return v10;
}

uint64_t IOUSBDeviceClass::probe(IOUSBDeviceClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4 = 3758097090;
  if (object && (IOObjectConformsTo(object, "IOUSBHostDevice") || IOObjectConformsTo(object, "IOUSBDevice"))) {
    return 0;
  }
  return v4;
}

uint64_t IOUSBDeviceClass::start(IOUSBDeviceClass *this, const __CFDictionary *a2, io_registry_entry_t entry)
{
  uint64_t valuePtr = 0;
  CFMutableDictionaryRef properties = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AppleUSBAlternateServiceRegistryID", kCFAllocatorDefault, 0);
  if (!CFProperty || (CFNumberRef v6 = CFProperty, !CFNumberGetValue(CFProperty, kCFNumberSInt64Type, &valuePtr)))
  {
    *((_DWORD *)this + 12) = entry;
    IOObjectRetain(entry);
    uint32_t v8 = 1;
LABEL_7:
    task_port_t v9 = mach_task_self_;
    uint64_t v10 = (io_connect_t *)((char *)this + 56);
    io_service_t v11 = entry;
    goto LABEL_8;
  }
  uint64_t v7 = 3758097085;
  mach_timespec_t waitTime = (mach_timespec_t)10;
  unint64_t v79 = 0;
  IOServiceWaitQuiet(entry, &waitTime);
  if (IOServiceGetState())
  {
    uint64_t v7 = 3758097088;
LABEL_5:
    CFRelease(v6);
    return v7;
  }
  if ((v79 & 2) != 0)
  {
    CFMutableDictionaryRef v44 = IORegistryEntryIDMatching(valuePtr);
    if (!v44) {
      goto LABEL_96;
    }
    int v47 = -41;
    while (!__CFADD__(v47++, 1))
    {
      if IOServiceGetState() || (v79)
      {
        CFRelease(v44);
        goto LABEL_56;
      }
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v44);
      if (MatchingService)
      {
        LODWORD(v44) = MatchingService;
        goto LABEL_96;
      }
      usleep(0x3D090u);
      CFMutableDictionaryRef v44 = IORegistryEntryIDMatching(valuePtr);
      if (!v44) {
        goto LABEL_96;
      }
    }
    goto LABEL_56;
  }
  v36 = (__CFDictionary *)IORegistryEntryCreateCFProperty(entry, @"locationID", kCFAllocatorDefault, 0);
  if (!v36)
  {
    uint64_t v7 = 3758097136;
    goto LABEL_5;
  }
  v37 = v36;
  CFMutableDictionaryRef v38 = IOServiceMatching("AppleUSBHostPort");
  if (!v38)
  {
    v39 = v37;
LABEL_92:
    CFRelease(v6);
    CFNumberRef v6 = v39;
    goto LABEL_5;
  }
  v39 = v38;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFRelease(v6);
    CFNumberRef v6 = v37;
    goto LABEL_92;
  }
  v41 = Mutable;
  CFDictionarySetValue(Mutable, @"locationID", v37);
  CFRelease(v37);
  CFDictionarySetValue(v39, @"IOPropertyMatch", v41);
  CFRelease(v41);
  io_service_t v42 = IOServiceGetMatchingService(kIOMainPortDefault, v39);
  if (!v42)
  {
LABEL_56:
    LODWORD(v44) = 0;
    goto LABEL_96;
  }
  io_object_t v43 = v42;
  io_iterator_t iterator = 0;
  LODWORD(v44) = 0;
  if (!IORegistryEntryGetChildIterator(v42, "IOService", &iterator))
  {
    io_iterator_t v45 = iterator;
    if (iterator)
    {
      while (1)
      {
        io_registry_entry_t v46 = IOIteratorNext(v45);
        LODWORD(v44) = v46;
        if (!v46) {
          break;
        }
        uint64_t v76 = 0;
        IORegistryEntryGetRegistryEntryID(v46, &v76);
        if (v76 == valuePtr) {
          break;
        }
        IOObjectRelease((io_object_t)v44);
        io_iterator_t v45 = iterator;
      }
      IOObjectRelease(iterator);
    }
  }
  IOObjectRelease(v43);
LABEL_96:
  CFRelease(v6);
  *((_DWORD *)this + 12) = entry;
  IOObjectRetain(entry);
  if (!v44)
  {
    uint32_t v8 = 2;
    goto LABEL_7;
  }
  *((_DWORD *)this + 13) = v44;
  task_port_t v9 = mach_task_self_;
  uint64_t v10 = (io_connect_t *)((char *)this + 56);
  io_service_t v11 = v44;
  uint32_t v8 = 2;
LABEL_8:
  uint64_t v7 = IOServiceOpen(v11, v9, v8, v10);
  if (!v7)
  {
    if (*((_DWORD *)this + 14))
    {
      *((unsigned char *)this + 121) = 1;
      uint64_t v7 = IORegistryEntryCreateCFProperties(*((_DWORD *)this + 12), &properties, 0, 0);
      if (!v7)
      {
        if (properties)
        {
          CFTypeID v13 = CFGetTypeID(properties);
          if (v13 == CFDictionaryGetTypeID())
          {
            unint64_t v79 = 0xAAAAAAAAAAAAAAAALL;
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"bDeviceClass");
            if (Value)
            {
              CFNumberRef v15 = Value;
              CFTypeID v16 = CFGetTypeID(Value);
              if (v16 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v15, kCFNumberLongLongType, &v79);
                *((unsigned char *)this + 81) = v79;
              }
            }
            CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bDeviceSubClass");
            if (v17)
            {
              CFNumberRef v18 = v17;
              CFTypeID v19 = CFGetTypeID(v17);
              if (v19 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v18, kCFNumberLongLongType, &v79);
                *((unsigned char *)this + 82) = v79;
              }
            }
            CFNumberRef v20 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bDeviceProtocol");
            if (v20)
            {
              CFNumberRef v21 = v20;
              CFTypeID v22 = CFGetTypeID(v20);
              if (v22 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v21, kCFNumberLongLongType, &v79);
                *((unsigned char *)this + 83) = v79;
              }
            }
            CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue(properties, @"idVendor");
            if (v23)
            {
              CFNumberRef v24 = v23;
              CFTypeID v25 = CFGetTypeID(v23);
              if (v25 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v24, kCFNumberLongLongType, &v79);
                *((_WORD *)this + 42) = v79;
              }
            }
            CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue(properties, @"idProduct");
            if (v26)
            {
              CFNumberRef v27 = v26;
              CFTypeID v28 = CFGetTypeID(v26);
              if (v28 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v27, kCFNumberLongLongType, &v79);
                *((_WORD *)this + 43) = v79;
              }
            }
            CFNumberRef v29 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bcdDevice");
            if (v29)
            {
              CFNumberRef v30 = v29;
              CFTypeID v31 = CFGetTypeID(v29);
              if (v31 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v30, kCFNumberLongLongType, &v79);
                *((_WORD *)this + 44) = v79;
              }
            }
            CFNumberRef v32 = (const __CFNumber *)CFDictionaryGetValue(properties, @"iManufacturer");
            if (v32 && (CFNumberRef v33 = v32, v34 = CFGetTypeID(v32), v34 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v33, kCFNumberLongLongType, &v79);
              char v35 = v79;
            }
            else
            {
              char v35 = 0;
            }
            *((unsigned char *)this + 90) = v35;
            CFNumberRef v50 = (const __CFNumber *)CFDictionaryGetValue(properties, @"iProduct");
            if (v50 && (CFNumberRef v51 = v50, v52 = CFGetTypeID(v50), v52 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v51, kCFNumberLongLongType, &v79);
              char v53 = v79;
            }
            else
            {
              char v53 = 0;
            }
            *((unsigned char *)this + 91) = v53;
            CFNumberRef v54 = (const __CFNumber *)CFDictionaryGetValue(properties, @"iSerialNumber");
            if (v54 && (CFNumberRef v55 = v54, v56 = CFGetTypeID(v54), v56 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v55, kCFNumberLongLongType, &v79);
              char v57 = v79;
            }
            else
            {
              char v57 = 0;
            }
            *((unsigned char *)this + 92) = v57;
            CFNumberRef v58 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bNumConfigurations");
            if (v58 && (CFNumberRef v59 = v58, v60 = CFGetTypeID(v58), v60 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v59, kCFNumberLongLongType, &v79);
              char v61 = v79;
            }
            else
            {
              char v61 = 0;
            }
            *((unsigned char *)this + 93) = v61;
            CFNumberRef v62 = (const __CFNumber *)CFDictionaryGetValue(properties, @"Device Speed");
            if (v62)
            {
              CFNumberRef v63 = v62;
              CFTypeID v64 = CFGetTypeID(v62);
              if (v64 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v63, kCFNumberLongLongType, &v79);
                *((unsigned char *)this + 100) = v79;
              }
            }
            if (*((unsigned __int8 *)this + 100) <= 2u) {
              int v65 = 250;
            }
            else {
              int v65 = 450;
            }
            *((_DWORD *)this + 24) = v65;
            CFNumberRef v66 = (const __CFNumber *)CFDictionaryGetValue(properties, @"kUSBAddress");
            if (v66 && (CFNumberRef v67 = v66, v68 = CFGetTypeID(v66), v68 == CFNumberGetTypeID())
              || (io_registry_entry_t v69 = *((_DWORD *)this + 13)) != 0
              && (v70 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v69, @"kUSBAddress", kCFAllocatorDefault, 0)) != 0&& (CFNumberRef v67 = v70, v71 = CFGetTypeID(v70), v71 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v67, kCFNumberLongLongType, &v79);
              *((_WORD *)this + 47) = v79;
            }
            CFNumberRef v72 = (const __CFNumber *)CFDictionaryGetValue(properties, @"locationID");
            if (v72)
            {
              CFNumberRef v73 = v72;
              CFTypeID v74 = CFGetTypeID(v72);
              if (v74 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v73, kCFNumberLongLongType, &v79);
                *((_DWORD *)this + 26) = v79;
              }
            }
            *((unsigned char *)this + 120) = 0;
            if (*((unsigned char *)this + 93))
            {
              v75 = malloc_type_malloc(8 * *((unsigned __int8 *)this + 93), 0x2004093837F09uLL);
              *((void *)this + 14) = v75;
              if (!v75) {
                return 3758097085;
              }
              bzero(v75, 8 * *((unsigned __int8 *)this + 93));
              IOUSBDeviceClass::CacheConfigDescriptor(this);
            }
            CFRelease(properties);
          }
        }
        return 0;
      }
    }
    else
    {
      return 3758097088;
    }
  }
  return v7;
}

uint64_t IOUSBDeviceClass::CacheConfigDescriptor(IOUSBDeviceClass *this)
{
  if (*((unsigned char *)this + 93))
  {
    uint64_t v2 = 0;
    while (1)
    {
      int outputStruct = -1431655766;
      *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v13 = v3;
      long long v14 = v3;
      uint64_t input = v2;
      mach_port_t v4 = *((_DWORD *)this + 14);
      size_t outputStructCnt = 4;
      uint64_t v5 = IOConnectCallMethod(v4, 4u, &input, 1u, 0, 0, 0, 0, &outputStruct, &outputStructCnt);
      if (v5) {
        return v5;
      }
      uint64_t input = v2;
      size_t outputStructCnt = HIWORD(outputStruct);
      CFNumberRef v6 = malloc_type_malloc(HIWORD(outputStruct) + 2, 0x3BF72DC1uLL);
      uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 14), 4u, &input, 1u, 0, 0, 0, 0, v6, &outputStructCnt);
      if (v7) {
        break;
      }
      *((unsigned char *)v6 + outputStructCnt) = 0;
      *((unsigned char *)v6 + outputStructCnt + 1) = 0;
      *(void *)(*((void *)this + 14) + 8 * v2++) = v6;
      if (v2 >= *((unsigned __int8 *)this + 93)) {
        goto LABEL_6;
      }
    }
    uint64_t v8 = v7;
    free(v6);
  }
  else
  {
LABEL_6:
    uint64_t v8 = 0;
    *((unsigned char *)this + 120) = 1;
  }
  return v8;
}

uint64_t IOUSBDeviceClass::stop(IOUSBDeviceClass *this)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  if (*((unsigned char *)this + 80)) {
    return (*(uint64_t (**)(void))(*(void *)this + 112))();
  }
  return 0;
}

uint64_t IOUSBDeviceClass::GetDeviceClass(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 81);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceSubClass(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 82);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceProtocol(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 83);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceVendor(IOUSBDeviceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 42);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceProduct(IOUSBDeviceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 43);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceReleaseNumber(IOUSBDeviceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 44);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceAddress(IOUSBDeviceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 47);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceBusPowerAvailable(IOUSBDeviceClass *this, unsigned int *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_DWORD *)this + 24);
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceSpeed(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 100);
  return result;
}

uint64_t IOUSBDeviceClass::GetNumberOfConfigurations(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 93);
  return result;
}

uint64_t IOUSBDeviceClass::GetLocationID(IOUSBDeviceClass *this, unsigned int *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_DWORD *)this + 26);
  return result;
}

uint64_t IOUSBDeviceClass::USBDeviceGetManufacturerStringIndex(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 90);
  return result;
}

uint64_t IOUSBDeviceClass::USBDeviceGetProductStringIndex(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 91);
  return result;
}

uint64_t IOUSBDeviceClass::USBDeviceGetSerialNumberStringIndex(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 121)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 92);
  return result;
}

uint64_t IOUSBDeviceClass::GetConfigurationDescriptorPtr(IOUSBDeviceClass *this, unsigned int a2, IOUSBConfigurationDescriptor **a3)
{
  if (!*((unsigned char *)this + 121))
  {
    unsigned __int16 v7 = 704;
    return v7 | 0xE0000000;
  }
  if (*((unsigned __int8 *)this + 93) <= a2)
  {
    unsigned __int16 v7 = 16470;
    return v7 | 0xE0000000;
  }
  if (*((unsigned char *)this + 120)) {
    LODWORD(result) = 0;
  }
  else {
    LODWORD(result) = IOUSBDeviceClass::CacheConfigDescriptor(this);
  }
  uint64_t v8 = *(IOUSBConfigurationDescriptor **)(*((void *)this + 14) + 8 * a2);
  if (v8) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = result;
  }
  *a3 = v8;
  return result;
}

uint64_t IOUSBDeviceClass::SetConfiguration(IOUSBDeviceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = 1;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 2u, input, 2u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::SetConfigurationV2(IOUSBDeviceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 2u, input, 2u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetConfiguration(IOUSBDeviceClass *this, unsigned __int8 *a2)
{
  uint64_t result = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 121))
  {
    uint64_t output = 0;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 3u, 0, 0, &output, &outputCnt);
    if (result)
    {
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      *a2 = output;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::CreateDeviceAsyncEventSource(IOUSBDeviceClass *this, __CFRunLoopSource **a2)
{
  mach_port_t v4 = (const void *)*((void *)this + 9);
  if (v4) {
    goto LABEL_2;
  }
  uint64_t result = 3758097085;
  if (!*((void *)this + 8))
  {
    uint64_t result = (*(uint64_t (**)(IOUSBDeviceClass *, void))(*(void *)this + 88))(this, 0);
    if (!result)
    {
      mach_port_t v4 = (const void *)*((void *)this + 9);
      uint64_t result = 3758097085;
      if (v4)
      {
        if (a2)
        {
LABEL_2:
          CFRetain(v4);
          uint64_t result = 0;
          *a2 = (__CFRunLoopSource *)*((void *)this + 9);
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceAsyncEventSource(IOUSBDeviceClass *this)
{
  return *((void *)this + 9);
}

IONotificationPort *IOUSBDeviceClass::CreateDeviceAsyncPort(IOUSBDeviceClass *this, unsigned int *a2)
{
  uint64_t result = (IONotificationPort *)3758097088;
  if (*((unsigned char *)this + 121))
  {
    uint64_t v5 = (IONotificationPort *)*((void *)this + 8);
    if (v5)
    {
      if (a2)
      {
        mach_port_t MachPort = IONotificationPortGetMachPort(v5);
        uint64_t result = 0;
        *a2 = MachPort;
        return result;
      }
      return 0;
    }
    uint64_t result = IONotificationPortCreate(kIOMainPortDefault);
    *((void *)this + 8) = result;
    if (!result) {
      return result;
    }
    *((void *)this + 9) = IONotificationPortGetRunLoopSource(result);
    if (a2) {
      *a2 = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 8));
    }
    if (!*((unsigned char *)this + 80)) {
      return 0;
    }
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v13 = v7;
    long long v14 = v7;
    *(_OWORD *)reference = v7;
    long long v12 = v7;
    uint32_t outputCnt = 0;
    mach_port_t v8 = *((_DWORD *)this + 14);
    mach_port_t v9 = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 8));
    uint64_t result = (IONotificationPort *)IOConnectCallAsyncScalarMethod(v8, 0xFu, v9, reference, 1u, 0, 0, 0, &outputCnt);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
      return (IONotificationPort *)3758097088;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetDeviceAsyncPort(IOUSBDeviceClass *this)
{
  uint64_t v1 = (IONotificationPort *)*((void *)this + 8);
  if (v1) {
    return IONotificationPortGetMachPort(v1);
  }
  else {
    return 268435459;
  }
}

uint64_t IOUSBDeviceClass::GetDeviceAsyncNotificationPort(IOUSBDeviceClass *this)
{
  return *((void *)this + 8);
}

uint64_t IOUSBDeviceClass::USBDeviceOpen(IOUSBDeviceClass *this, unsigned int a2)
{
  uint64_t v2 = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80)) {
      return 0;
    }
    io_service_t v6 = *((_DWORD *)this + 13);
    if (v6)
    {
      waitTime[0] = (mach_timespec_t)5;
      IOServiceWaitQuiet(v6, waitTime);
    }
    uint32_t outputCnt = 0;
    uint64_t input = a2;
    uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0, &input, 1u, 0, &outputCnt);
    if (!v2)
    {
      *((unsigned char *)this + 80) = 1;
      if (!*((unsigned char *)this + 120))
      {
        uint64_t v12 = IOUSBDeviceClass::CacheConfigDescriptor(this);
        if (v12)
        {
          uint64_t v2 = v12;
          (*(void (**)(IOUSBDeviceClass *))(*(void *)this + 112))(this);
          return v2;
        }
      }
      long long v7 = (IONotificationPort *)*((void *)this + 8);
      if (!v7) {
        return 0;
      }
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v17 = v8;
      long long v18 = v8;
      *(_OWORD *)&waitTime[0].tv_sec = v8;
      long long v16 = v8;
      mach_port_t v9 = *((_DWORD *)this + 14);
      mach_port_t MachPort = IONotificationPortGetMachPort(v7);
      uint64_t v11 = IOConnectCallAsyncScalarMethod(v9, 0xFu, MachPort, (uint64_t *)waitTime, 1u, 0, 0, 0, &outputCnt);
      uint64_t v2 = v11;
      if (v11 && v11 != 268435459) {
        (*(void (**)(IOUSBDeviceClass *))(*(void *)this + 112))(this);
      }
    }
    if (v2 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
      return 3758097088;
    }
  }
  return v2;
}

uint64_t IOUSBDeviceClass::USBDeviceClose(IOUSBDeviceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80))
    {
      *((unsigned char *)this + 80) = 0;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 1u, 0, 0, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::ResetDevice(IOUSBDeviceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 9u, 0, 0, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::USBDeviceReEnumerate(IOUSBDeviceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if ((a2 & 0x60000000) != 0)
  {
    if (!*((unsigned char *)this + 121)) {
      return result;
    }
    if ((a2 & 0x40000000) != 0)
    {
      mach_timespec_t waitTime = (mach_timespec_t)5;
      IOServiceWaitQuiet(*((_DWORD *)this + 12), &waitTime);
    }
  }
  else
  {
    if (!*((unsigned char *)this + 121)) {
      return result;
    }
    if (!*((unsigned char *)this + 80)) {
      return 3758097101;
    }
  }
  mach_timespec_t waitTime = (mach_timespec_t)a2;
  uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0xCu, (const uint64_t *)&waitTime, 1u, 0, 0);
  if (result == 268435459)
  {
    *((unsigned char *)this + 80) = 0;
    *((unsigned char *)this + 121) = 0;
    return 3758097088;
  }
  else if ((a2 & 0x40000000) != 0 && !result)
  {
    mach_timespec_t v5 = (mach_timespec_t)5;
    IOServiceWaitQuiet(*((_DWORD *)this + 12), &v5);
    return 0;
  }
  return result;
}

uint64_t IOUSBDeviceClass::USBDeviceSuspend(IOUSBDeviceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t v4 = a2;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0xAu, &v4, 1u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::USBDeviceAbortPipeZero(IOUSBDeviceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0xBu, 0, 0, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetUSBDeviceInformation(IOUSBDeviceClass *this, unsigned int *a2)
{
  uint64_t result = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 121))
  {
    uint64_t output = 0;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0x10u, 0, 0, &output, &outputCnt);
    if (result)
    {
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      *a2 = output;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::RequestExtraPower(IOUSBDeviceClass *this, unsigned int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t result = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 121))
  {
    input[0] = a2;
    input[1] = a3;
    uint64_t output = 0;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0x11u, input, 2u, &output, &outputCnt);
    if (result)
    {
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      *a4 = output;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::ReturnExtraPower(IOUSBDeviceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    input[0] = a2;
    input[1] = a3;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0x12u, input, 2u, 0, 0);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetExtraPowerAllocated(IOUSBDeviceClass *this, unsigned int a2, unsigned int *a3)
{
  uint64_t result = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 121))
  {
    uint64_t output = 0;
    uint64_t input = a2;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 0x13u, &input, 1u, &output, &outputCnt);
    if (result)
    {
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      *a3 = output;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetBandwidthAvailableForDevice(IOUSBDeviceClass *this, unsigned int *a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = 0;
      unint64_t v4 = *((char *)this + 100);
      if (v4 <= 4)
      {
        uint64_t result = 0;
        *a2 = *(_DWORD *)&a0[4 * v4];
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::RegisterForNotification(IOUSBDeviceClass *this, unint64_t a2, void (*a3)(void *, int, void *, void *), void *a4, unint64_t *a5)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80)) {
      return 3758097095;
    }
    else {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::UnregisterNotification(IOUSBDeviceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80)) {
      return 3758097095;
    }
    else {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::AcknowledgeNotification(IOUSBDeviceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    if (*((unsigned char *)this + 80)) {
      return 3758097095;
    }
    else {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::DeviceRequest(IOUSBDeviceClass *this, IOUSBDevRequestTO *a2)
{
  uint64_t v2 = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 121))
  {
    uint64_t bmRequestType = a2->bmRequestType;
    int v6 = (char)bmRequestType;
    input[0] = 0;
    input[1] = bmRequestType;
    wCFNumberRef Value = a2->wValue;
    uint64_t input[2] = a2->bRequest;
    input[3] = wValue;
    wCFIndex Length = a2->wLength;
    input[4] = a2->wIndex;
    input[5] = wLength;
    int outputStruct = a2->pData;
    input[6] = (uint64_t)outputStruct;
    UInt32 completionTimeout = a2->completionTimeout;
    if (!completionTimeout) {
      UInt32 completionTimeout = a2->noDataTimeout;
    }
    input[7] = completionTimeout;
    a2->wLenDone = 0;
    size_t v13 = wLength;
    if (v6 < 0)
    {
      uint64_t output = 0;
      uint64_t v11 = IOConnectCallMethod(*((_DWORD *)this + 14), 7u, input, 8u, 0, 0, &output, &outputCnt, outputStruct, &v13);
      if (!v11) {
        a2->wLenDone = v13;
      }
      if (output) {
        return 3758097128;
      }
      uint64_t v2 = v11;
    }
    else
    {
      uint64_t v2 = IOConnectCallMethod(*((_DWORD *)this + 14), 6u, input, 8u, outputStruct, wLength, 0, 0, 0, 0);
      if (!v2)
      {
        a2->wLenDone = a2->wLength;
        return v2;
      }
      a2->wLenDone = 0;
    }
    if (v2 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
      return 3758097088;
    }
  }
  return v2;
}

uint64_t IOUSBDeviceClass::DeviceRequestAsync(IOUSBDeviceClass *this, IOUSBDevRequestTO *a2, void (*a3)(void *, int, void *), void *a4)
{
  uint32_t outputCnt = 1;
  mach_timespec_t v5 = (IONotificationPort *)*((void *)this + 8);
  if (!v5)
  {
    unsigned __int16 v16 = 16479;
    return v16 | 0xE0000000;
  }
  uint64_t v6 = 3758097088;
  if (*((unsigned char *)this + 121))
  {
    uint64_t bmRequestType = a2->bmRequestType;
    int v8 = (char)bmRequestType;
    input[0] = 0;
    input[1] = bmRequestType;
    wCFNumberRef Value = a2->wValue;
    uint64_t input[2] = a2->bRequest;
    input[3] = wValue;
    wCFIndex Length = a2->wLength;
    input[4] = a2->wIndex;
    input[5] = wLength;
    input[6] = (uint64_t)a2->pData;
    UInt32 completionTimeout = a2->completionTimeout;
    if (!completionTimeout) {
      UInt32 completionTimeout = a2->noDataTimeout;
    }
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v24 = v12;
    long long v25 = v12;
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    input[7] = completionTimeout;
    reference[1] = (uint64_t)a3;
    CFTypeID v22 = a4;
    mach_port_t v13 = *((_DWORD *)this + 14);
    mach_port_t MachPort = IONotificationPortGetMachPort(v5);
    uint64_t v15 = v8 < 0
        ? IOConnectCallAsyncScalarMethod(v13, 7u, MachPort, reference, 3u, input, 8u, &output, &outputCnt)
        : IOConnectCallAsyncScalarMethod(v13, 6u, MachPort, reference, 3u, input, 8u, 0, 0);
    uint64_t v6 = v15;
    if (v15 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
      unsigned __int16 v16 = 704;
      return v16 | 0xE0000000;
    }
  }
  return v6;
}

uint64_t IOUSBDeviceClass::CreateInterfaceIterator(IOUSBDeviceClass *this, IOUSBFindInterfaceRequest *a2, unsigned int *a3)
{
  uint64_t result = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 121))
  {
    uint64_t bInterfaceClass = a2->bInterfaceClass;
    uint64_t bInterfaceSubClass = a2->bInterfaceSubClass;
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    input[0] = bInterfaceClass;
    input[1] = bInterfaceSubClass;
    uint64_t bAlternateSetting = a2->bAlternateSetting;
    uint64_t input[2] = a2->bInterfaceProtocol;
    input[3] = bAlternateSetting;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 14), 8u, input, 4u, &output, &outputCnt);
    if (result)
    {
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 121) = 0;
        return 3758097088;
      }
    }
    else
    {
      *a3 = output;
    }
  }
  return result;
}

uint64_t IOUSBDeviceClass::GetBusFrameNumber(IOUSBDeviceClass *this, unint64_t *a2, UnsignedWide *a3)
{
  uint64_t v3 = 3758097088;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (*((unsigned char *)this + 121))
  {
    size_t outputStructCnt = 16;
    uint64_t v7 = IOConnectCallStructMethod(*((_DWORD *)this + 14), 5u, 0, 0, &outputStruct, &outputStructCnt);
    if (v7 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7)
      {
        UnsignedWide v8 = (UnsignedWide)v12;
        *a2 = outputStruct;
        *a3 = v8;
      }
    }
  }
  return v3;
}

uint64_t IOUSBDeviceClass::GetBusMicroFrameNumber(IOUSBDeviceClass *this, unint64_t *a2, UnsignedWide *a3)
{
  uint64_t v3 = 3758097088;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (*((unsigned char *)this + 121))
  {
    size_t outputStructCnt = 16;
    uint64_t v7 = IOConnectCallStructMethod(*((_DWORD *)this + 14), 0xDu, 0, 0, &outputStruct, &outputStructCnt);
    if (v7 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7)
      {
        UnsignedWide v8 = (UnsignedWide)v12;
        *a2 = outputStruct;
        *a3 = v8;
      }
    }
  }
  return v3;
}

uint64_t IOUSBDeviceClass::GetBusFrameNumberWithTime(IOUSBDeviceClass *this, unint64_t *a2, UnsignedWide *a3)
{
  uint64_t v3 = 3758097088;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (*((unsigned char *)this + 121))
  {
    size_t outputStructCnt = 16;
    uint64_t v7 = IOConnectCallStructMethod(*((_DWORD *)this + 14), 0xEu, 0, 0, &outputStruct, &outputStructCnt);
    if (v7 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 121) = 0;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7)
      {
        UnsignedWide v8 = (UnsignedWide)v12;
        *a2 = outputStruct;
        *a3 = v8;
      }
    }
  }
  return v3;
}

uint64_t IOUSBDeviceClass::deviceProbe(IOUSBDeviceClass *this, void *a2, const __CFDictionary *a3, unsigned int a4, int *a5)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 48))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceStart(IOUSBDeviceClass *this, void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 56))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceStop(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 64))();
}

uint64_t IOUSBDeviceClass::deviceCreateDeviceAsyncEventSource(IOUSBDeviceClass *this, void *a2, __CFRunLoopSource **a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 72))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceAsyncEventSource(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 80))();
}

uint64_t IOUSBDeviceClass::deviceCreateDeviceAsyncPort(IOUSBDeviceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 88))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceAsyncPort(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 96))();
}

uint64_t IOUSBDeviceClass::deviceUSBDeviceOpen(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void))(**((void **)this + 1) + 104))(*((void *)this + 1), 0);
}

uint64_t IOUSBDeviceClass::deviceUSBDeviceClose(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 112))();
}

uint64_t IOUSBDeviceClass::deviceGetDeviceClass(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 120))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceSubClass(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 128))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceProtocol(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 136))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceVendor(IOUSBDeviceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 144))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceProduct(IOUSBDeviceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 152))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceReleaseNumber(IOUSBDeviceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 160))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceAddress(IOUSBDeviceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 168))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceBusPowerAvailable(IOUSBDeviceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 176))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceSpeed(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 184))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetNumberOfConfigurations(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 192))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetLocationID(IOUSBDeviceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 200))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetConfigurationDescriptorPtr(IOUSBDeviceClass *this, void *a2, unsigned __int8 a3, IOUSBConfigurationDescriptor **a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 208))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetConfiguration(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 216))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceSetConfiguration(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 224))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetBusFrameNumber(IOUSBDeviceClass *this, void *a2, unint64_t *a3, UnsignedWide *a4)
{
  return (*(uint64_t (**)(void, void *, unint64_t *))(**((void **)this + 1) + 232))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceResetDevice(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 240))();
}

uint64_t IOUSBDeviceClass::deviceDeviceRequest(IOUSBDeviceClass *this, _DWORD *a2, IOUSBDevRequest *a3)
{
  *(void *)&v9[4] = 0xAAAAAAAAAAAAAAAALL;
  int v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  uint64_t v7 = *((void *)a2 + 1);
  int v8 = a2[4];
  *(void *)mach_port_t v9 = 5000;
  uint64_t result = (*(uint64_t (**)(void, _DWORD *, IOUSBDevRequest *))(**((void **)this + 1) + 248))(*((void *)this + 1), v6, a3);
  a2[4] = v8;
  return result;
}

uint64_t IOUSBDeviceClass::deviceDeviceRequestAsync(IOUSBDeviceClass *this, _DWORD *a2, IOUSBDevRequest *a3, void (*a4)(void *, int, void *), void *a5)
{
  *(void *)&v10[4] = 0xAAAAAAAAAAAAAAAALL;
  int v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  uint64_t v8 = *((void *)a2 + 1);
  int v9 = a2[4];
  *(void *)uint64_t v10 = 5000;
  return (*(uint64_t (**)(void, _DWORD *, IOUSBDevRequest *, void (*)(void *, int, void *), void *))(**((void **)this + 1) + 256))(*((void *)this + 1), v7, a3, a4, a5);
}

uint64_t IOUSBDeviceClass::deviceCreateInterfaceIterator(IOUSBDeviceClass *this, void *a2, IOUSBFindInterfaceRequest *a3, unsigned int *a4)
{
  return (*(uint64_t (**)(void, void *, IOUSBFindInterfaceRequest *))(**((void **)this + 1) + 264))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceUSBDeviceOpenSeize(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 1) + 104))(*((void *)this + 1), 1);
}

uint64_t IOUSBDeviceClass::deviceDeviceRequestTO(IOUSBDeviceClass *this, void *a2, IOUSBDevRequestTO *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 248))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceDeviceRequestAsyncTO(IOUSBDeviceClass *this, void *a2, IOUSBDevRequestTO *a3, void (*a4)(void *, int, void *), void *a5)
{
  return (*(uint64_t (**)(void, void *, IOUSBDevRequestTO *, void (*)(void *, int, void *)))(**((void **)this + 1) + 256))(*((void *)this + 1), a2, a3, a4);
}

uint64_t IOUSBDeviceClass::deviceUSBDeviceSuspend(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, BOOL))(**((void **)this + 1) + 272))(*((void *)this + 1), a2 != 0);
}

uint64_t IOUSBDeviceClass::deviceUSBDeviceAbortPipeZero(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 280))();
}

uint64_t IOUSBDeviceClass::deviceGetManufacturerStringIndex(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 288))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetProductStringIndex(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 296))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetSerialNumberStringIndex(IOUSBDeviceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 304))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceReEnumerateDevice(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 312))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetBusMicroFrameNumber(IOUSBDeviceClass *this, void *a2, unint64_t *a3, UnsignedWide *a4)
{
  return (*(uint64_t (**)(void, void *, unint64_t *))(**((void **)this + 1) + 320))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceGetIOUSBLibVersion(IOUSBDeviceClass *this, void *a2, NumVersion *a3, NumVersion *a4)
{
  return (*(uint64_t (**)(void, void *, NumVersion *))(**((void **)this + 1) + 40))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceGetBusFrameNumberWithTime(IOUSBDeviceClass *this, void *a2, unint64_t *a3, UnsignedWide *a4)
{
  return (*(uint64_t (**)(void, void *, unint64_t *))(**((void **)this + 1) + 328))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceClass::deviceGetUSBDeviceInformation(IOUSBDeviceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 336))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceRequestExtraPower(IOUSBDeviceClass *this, void *a2, unsigned int a3, unsigned int a4, unsigned int *a5)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 344))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceReturnExtraPower(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 352))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetExtraPowerAllocated(IOUSBDeviceClass *this, void *a2, unsigned int a3, unsigned int *a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 360))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceGetDeviceAsyncNotificationPort(IOUSBDeviceClass *this, void *a2)
{
  return *(void *)(*((void *)this + 1) + 64);
}

uint64_t IOUSBDeviceClass::deviceGetBandwidthAvailableForDevice(IOUSBDeviceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 368))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceSetConfigurationV2(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 376))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceRegisterForNotification(IOUSBDeviceClass *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5, unint64_t *a6)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void (*)(void *, int, void *, void *), void *))(**((void **)this + 1) + 384))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBDeviceClass::deviceUnregisterNotification(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 392))(*((void *)this + 1), a2);
}

uint64_t IOUSBDeviceClass::deviceAcknowledgeNotification(IOUSBDeviceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 400))(*((void *)this + 1), a2);
}

void IOUSBInterfaceClass::alloc(IOUSBInterfaceClass *this)
{
}

void sub_64D4()
{
}

void IOUSBInterfaceClass::IOUSBInterfaceClass(IOUSBInterfaceClass *this)
{
  IOUSBIUnknown::IOUSBIUnknown(this, &IOUSBInterfaceClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = off_C470;
  *(_DWORD *)(v1 + 90) = 0;
  *(_WORD *)(v1 + 94) = 0;
  *(_DWORD *)(v1 + 100) = 0;
  *(unsigned char *)(v1 + 104) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 73) = 0u;
  *(void *)(v1 + 116) = 0;
  *(void *)(v1 + 108) = 0;
  *(void *)(v1 + 128) = 0;
  *(void *)(v1 + 136) = 0;
  *(_DWORD *)(v1 + 144) = 0;
  *(void *)(v1 + 32) = &IOUSBInterfaceClass::sUSBInterfaceInterface;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 152) = 0;
  *(_DWORD *)(v1 + 160) = 0;
}

void IOUSBInterfaceClass::~IOUSBInterfaceClass(IOUSBInterfaceClass *this)
{
  *(void *)this = off_C470;
  uint64_t v2 = (void *)*((void *)this + 17);
  if (v2)
  {
    unsigned int v3 = *((unsigned __int8 *)this + 104);
    if (*((unsigned char *)this + 104))
    {
      unint64_t v4 = 0;
      do
      {
        int v5 = *(void **)(*((void *)this + 17) + 8 * v4);
        if (v5)
        {
          free(v5);
          unsigned int v3 = *((unsigned __int8 *)this + 104);
        }
        ++v4;
      }
      while (v4 < v3);
      uint64_t v2 = (void *)*((void *)this + 17);
    }
    free(v2);
    *((void *)this + 17) = 0;
    *((unsigned char *)this + 144) = 0;
  }
  io_connect_t v6 = *((_DWORD *)this + 15);
  if (v6)
  {
    IOServiceClose(v6);
    *((_DWORD *)this + 15) = 0;
    *((unsigned char *)this + 147) = 0;
  }
  io_object_t v7 = *((_DWORD *)this + 12);
  if (v7)
  {
    IOObjectRelease(v7);
    *((_DWORD *)this + 12) = 0;
  }
  io_object_t v8 = *((_DWORD *)this + 13);
  if (v8)
  {
    IOObjectRelease(v8);
    *((_DWORD *)this + 13) = 0;
  }
  io_object_t v9 = *((_DWORD *)this + 14);
  if (v9)
  {
    IOObjectRelease(v9);
    *((_DWORD *)this + 14) = 0;
  }
  uint64_t v10 = (IONotificationPort *)*((void *)this + 8);
  if (v10)
  {
    IONotificationPortDestroy(v10);
    *((void *)this + 8) = 0;
  }

  IOUSBIUnknown::~IOUSBIUnknown(this);
}

{
  uint64_t vars8;

  IOUSBInterfaceClass::~IOUSBInterfaceClass(this);

  operator delete();
}

void sub_6660(_Unwind_Exception *a1)
{
  IOUSBIUnknown::~IOUSBIUnknown(v1);
  _Unwind_Resume(a1);
}

void sub_66C4()
{
}

uint64_t IOUSBInterfaceClass::queryInterface(IOUSBInterfaceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v7)))
  {
    io_object_t v8 = (char *)this + 16;
    uint64_t v9 = *(void *)this;
LABEL_4:
    *a3 = v8;
    (*(void (**)(IOUSBInterfaceClass *))(v9 + 24))(this);
    goto LABEL_5;
  }
  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x73u, 0xC9u, 0x7Au, 0xE8u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xB1u, 0xD0u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  if (CFEqual(v5, v12)) {
    goto LABEL_26;
  }
  CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(0, 0x49u, 0x23u, 0xACu, 0x4Cu, 0x48u, 0x96u, 0x11u, 0xD5u, 0x92u, 8u, 0, 0xAu, 0x27u, 0x80u, 0x1Eu, 0x86u);
  if (CFEqual(v5, v13)) {
    goto LABEL_26;
  }
  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Cu, 0x43u, 0x83u, 0x56u, 0x74u, 0xC4u, 0x11u, 0xD5u, 0x92u, 0xE6u, 0, 0xAu, 0x27u, 0x80u, 0x1Eu, 0x86u);
  if (CFEqual(v5, v14)) {
    goto LABEL_26;
  }
  CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(0, 0x8Fu, 0xDBu, 0x84u, 0x55u, 0x74u, 0xA6u, 0x11u, 0xD6u, 0x97u, 0xB1u, 0, 0x30u, 0x65u, 0xD3u, 0x60u, 0x8Eu);
  if (CFEqual(v5, v15)) {
    goto LABEL_26;
  }
  CFUUIDRef v16 = CFUUIDGetConstantUUIDWithBytes(0, 0x6Cu, 0x79u, 0x8Au, 0x6Eu, 0xD6u, 0xE9u, 0x11u, 0xD6u, 0xADu, 0xD6u, 0, 3u, 0x93u, 0x3Eu, 0x3Eu, 0x3Eu);
  if (CFEqual(v5, v16)) {
    goto LABEL_26;
  }
  CFUUIDRef v17 = CFUUIDGetConstantUUIDWithBytes(0, 0xC6u, 0x3Du, 0x3Cu, 0x92u, 8u, 0x84u, 0x11u, 0xD7u, 0x96u, 0x92u, 0, 3u, 0x93u, 0x3Eu, 0x3Eu, 0x3Eu);
  if (CFEqual(v5, v17)) {
    goto LABEL_26;
  }
  CFUUIDRef v18 = CFUUIDGetConstantUUIDWithBytes(0, 0x77u, 0xDu, 0xE6u, 0xCu, 0x2Fu, 0xE8u, 0x11u, 0xD8u, 0xA5u, 0x82u, 0, 3u, 0x93u, 0xDCu, 0xB1u, 0xD0u);
  if (CFEqual(v5, v18)) {
    goto LABEL_26;
  }
  CFUUIDRef v19 = CFUUIDGetConstantUUIDWithBytes(0, 0x64u, 0xBAu, 0xBDu, 0xD2u, 0xFu, 0x6Bu, 0x4Bu, 0x4Fu, 0x8Eu, 0x3Eu, 0xDCu, 0x36u, 4u, 0x69u, 0x87u, 0xADu);
  if (CFEqual(v5, v19)) {
    goto LABEL_26;
  }
  CFUUIDRef v20 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
  if (CFEqual(v5, v20)) {
    goto LABEL_26;
  }
  CFUUIDRef v21 = CFUUIDGetConstantUUIDWithBytes(0, 0x56u, 0x30u, 0x1Du, 0xF2u, 0x72u, 0xDEu, 0x40u, 0x4Bu, 0x91u, 0xEDu, 0xEDu, 0x30u, 0xBFu, 0x70u, 0x51u, 0x21u);
  if (CFEqual(v5, v21)
    || (v22 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Au, 0x41u, 0x5Au, 0x15u, 0x1Au, 0x7Bu, 0x4Bu, 0x5Bu, 0x86u, 0x9Cu, 0x69u, 0x4Fu, 0xEEu, 0xCu, 0x6Cu, 0x6Bu), CFEqual(v5, v22))|| (CFUUIDRef v23 = CFUUIDGetConstantUUIDWithBytes(
                kCFAllocatorSystemDefault,
                0x6Cu,
                0xDu,
                0x38u,
                0xC3u,
                0xB0u,
                0x93u,
                0x4Eu,
                0xA7u,
                0x80u,
                0x9Bu,
                9u,
                0xFBu,
                0x5Du,
                0xDDu,
                0xACu,
                0x16u),
        CFEqual(v5, v23))
    || (CFUUIDRef v24 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x6Au, 0xE4u, 0x4Du, 0x3Fu, 0xEBu, 0x45u, 0x48u, 0x7Fu, 0x8Eu, 0x8Eu, 0xB9u, 0x3Bu, 0x99u, 0xF8u, 0xEAu, 0x9Eu), CFEqual(v5, v24))|| (v25 = CFUUIDGetConstantUUIDWithBytes(
                kCFAllocatorSystemDefault,
                8u,
                0x15u,
                0x1Au,
                0x89u,
                0x80u,
                0x81u,
                0x40u,
                0x87u,
                0x8Fu,
                0x9Eu,
                0xAu,
                0xFEu,
                0xDFu,
                0xDBu,
                0x5Du,
                0x9Fu),
        CFEqual(v5, v25))
    || (CFUUIDRef v26 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x17u, 0xF9u, 0xE5u, 0x9Cu, 0xB0u, 0xA1u, 0x40u, 0x1Du, 0x9Au, 0xC0u, 0x8Du, 0xE2u, 0x7Au, 0xC6u, 4u, 0x7Eu), CFEqual(v5, v26))|| (v27 = CFUUIDGetConstantUUIDWithBytes(
                kCFAllocatorSystemDefault,
                0x33u,
                0xA8u,
                0x5Du,
                0xB0u,
                0xCu,
                0x3Bu,
                0x43u,
                0x28u,
                0x8Fu,
                2u,
                0xFDu,
                0xA8u,
                0x1Bu,
                0x11u,
                0x7Fu,
                0x4Cu),
        CFEqual(v5, v27))
    || (CFUUIDRef v28 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x87u, 0x52u, 0x66u, 0x3Bu, 0xC0u, 0x7Bu, 0x4Bu, 0xAEu, 0x95u, 0x84u, 0x22u, 3u, 0x2Fu, 0xABu, 0x9Cu, 0x5Au), CFEqual(v5, v28)))
  {
LABEL_26:
    io_object_t v8 = (char *)this + 32;
    uint64_t v9 = *(void *)this;
    goto LABEL_4;
  }
  *a3 = 0;
LABEL_5:
  if (*a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 2147483652;
  }
  CFRelease(v5);
  return v10;
}

uint64_t IOUSBInterfaceClass::probe(IOUSBInterfaceClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4 = 3758097090;
  if (object && (IOObjectConformsTo(object, "IOUSBHostInterface") || IOObjectConformsTo(object, "IOUSBInterface"))) {
    return 0;
  }
  return v4;
}

uint64_t IOUSBInterfaceClass::start(IOUSBInterfaceClass *this, const __CFDictionary *a2, io_registry_entry_t entry)
{
  kern_return_t v13;
  int v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  CFMutableDictionaryRef v17;
  __CFDictionary *v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  io_service_t v21;
  io_object_t v22;
  CFMutableDictionaryRef v23;
  io_registry_entry_t v24;
  io_object_t v25;
  kern_return_t ChildIterator;
  io_iterator_t v27;
  BOOL v28;
  io_registry_entry_t v29;
  int v31;
  io_service_t MatchingService;
  uint64_t v34;
  io_iterator_t object;
  io_iterator_t iterator;
  mach_timespec_t waitTime;
  uint64_t v38;
  uint64_t valuePtr;
  uint32_t outputCnt;
  uint64_t output;

  uint64_t output = 0xAAAAAAAAAAAAAAAALL;
  uint32_t outputCnt = 1;
  *((unsigned char *)this + 144) = 0;
  *((void *)this + 16) = 0;
  *(void *)((char *)this + 116) = 0;
  *(void *)((char *)this + 108) = 0;
  uint64_t valuePtr = 0;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(entry, @"AppleUSBAlternateServiceRegistryID", kCFAllocatorDefault, 0);
  if (!CFProperty || (CFNumberRef v6 = CFProperty, !CFNumberGetValue(CFProperty, kCFNumberSInt64Type, &valuePtr)))
  {
    *((_DWORD *)this + 12) = entry;
    IOObjectRetain(entry);
    uint32_t v8 = 1;
LABEL_6:
    task_port_t v9 = mach_task_self_;
    uint64_t v10 = (io_connect_t *)((char *)this + 60);
    io_service_t v11 = entry;
    goto LABEL_7;
  }
  uint64_t v7 = 3758097088;
  mach_timespec_t waitTime = (mach_timespec_t)10;
  CFMutableDictionaryRef v38 = 0;
  IOServiceWaitQuiet(entry, &waitTime);
  if (IOServiceGetState())
  {
LABEL_4:
    CFRelease(v6);
    return v7;
  }
  if ((v38 & 2) != 0)
  {
    CFUUIDRef v23 = IORegistryEntryIDMatching(valuePtr);
    if (!v23) {
      goto LABEL_50;
    }
    CFTypeID v31 = -41;
    while (!__CFADD__(v31++, 1))
    {
      if IOServiceGetState() || (v38)
      {
        CFRelease(v23);
        goto LABEL_42;
      }
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v23);
      if (MatchingService)
      {
        LODWORD(v23) = MatchingService;
        goto LABEL_50;
      }
      usleep(0x3D090u);
      CFUUIDRef v23 = IORegistryEntryIDMatching(valuePtr);
      if (!v23) {
        goto LABEL_50;
      }
    }
    goto LABEL_42;
  }
  CFUUIDRef v15 = (__CFDictionary *)IORegistryEntryCreateCFProperty(entry, @"locationID", kCFAllocatorDefault, 0);
  if (!v15)
  {
    uint64_t v7 = 3758097136;
    goto LABEL_4;
  }
  CFUUIDRef v16 = v15;
  CFUUIDRef v17 = IOServiceMatching("AppleUSBHostPort");
  if (!v17)
  {
    CFUUIDRef v18 = v16;
LABEL_45:
    CFRelease(v6);
    uint64_t v7 = 3758097085;
    CFNumberRef v6 = v18;
    goto LABEL_4;
  }
  CFUUIDRef v18 = v17;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFRelease(v6);
    CFNumberRef v6 = v16;
    goto LABEL_45;
  }
  CFUUIDRef v20 = Mutable;
  CFDictionarySetValue(Mutable, @"locationID", v16);
  CFRelease(v16);
  CFDictionarySetValue(v18, @"IOPropertyMatch", v20);
  CFRelease(v20);
  CFUUIDRef v21 = IOServiceGetMatchingService(kIOMainPortDefault, v18);
  if (!v21)
  {
LABEL_42:
    LODWORD(v23) = 0;
    goto LABEL_50;
  }
  CFUUIDRef v22 = v21;
  io_iterator_t iterator = 0;
  LODWORD(v23) = 0;
  if (!IORegistryEntryGetChildIterator(v21, "IOService", &iterator) && iterator)
  {
    while (1)
    {
      CFUUIDRef v24 = IOIteratorNext(iterator);
      if (!v24) {
        break;
      }
      CFUUIDRef v25 = v24;
      object = 0;
      ChildIterator = IORegistryEntryGetChildIterator(v24, "IOService", &object);
      LODWORD(v23) = 0;
      CFUUIDRef v27 = object;
      if (ChildIterator) {
        CFUUIDRef v28 = 1;
      }
      else {
        CFUUIDRef v28 = object == 0;
      }
      if (!v28)
      {
        while (1)
        {
          CFNumberRef v29 = IOIteratorNext(v27);
          LODWORD(v23) = v29;
          if (!v29) {
            break;
          }
          CFTypeID v34 = 0;
          IORegistryEntryGetRegistryEntryID(v29, &v34);
          if (v34 == valuePtr) {
            break;
          }
          IOObjectRelease((io_object_t)v23);
          CFUUIDRef v27 = object;
        }
        IOObjectRelease(object);
      }
      IOObjectRelease(v25);
      if (v23) {
        goto LABEL_48;
      }
    }
    LODWORD(v23) = 0;
LABEL_48:
    IOObjectRelease(iterator);
  }
  IOObjectRelease(v22);
LABEL_50:
  CFRelease(v6);
  *((_DWORD *)this + 12) = entry;
  IOObjectRetain(entry);
  if (!v23)
  {
    uint32_t v8 = 2;
    goto LABEL_6;
  }
  *((_DWORD *)this + 13) = v23;
  task_port_t v9 = mach_task_self_;
  uint64_t v10 = (io_connect_t *)((char *)this + 60);
  io_service_t v11 = v23;
  uint32_t v8 = 2;
LABEL_7:
  uint64_t v7 = IOServiceOpen(v11, v9, v8, v10);
  if (!v7)
  {
    mach_port_t v12 = *((_DWORD *)this + 15);
    if (v12)
    {
      *((unsigned char *)this + 147) = 1;
      uint64_t output = 0;
      CFUUIDRef v13 = IOConnectCallScalarMethod(v12, 2u, 0, 0, &output, &outputCnt);
      CFUUIDRef v14 = output;
      if (v13) {
        CFUUIDRef v14 = 0;
      }
      *((_DWORD *)this + 14) = v14;
      return (uint64_t)IOUSBInterfaceClass::GetPropertyInfo(this);
    }
    else
    {
      return 3758097088;
    }
  }
  return v7;
}

CFMutableDictionaryRef IOUSBInterfaceClass::GetPropertyInfo(IOUSBInterfaceClass *this)
{
  unint64_t v56 = 0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef properties = 0;
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)IORegistryEntryCreateCFProperties(*((_DWORD *)this + 12), &properties, 0, 0);
  if (!result)
  {
    if (properties)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"bInterfaceClass");
      if (Value)
      {
        CFNumberRef v4 = Value;
        CFTypeID v5 = CFGetTypeID(Value);
        if (v5 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v4, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 81) = v56;
        }
      }
      CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bInterfaceSubClass");
      if (v6)
      {
        CFNumberRef v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        if (v8 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v7, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 82) = v56;
        }
      }
      CFNumberRef v9 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bInterfaceProtocol");
      if (v9)
      {
        CFNumberRef v10 = v9;
        CFTypeID v11 = CFGetTypeID(v9);
        if (v11 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v10, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 83) = v56;
        }
      }
      CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(properties, @"idVendor");
      if (v12)
      {
        CFNumberRef v13 = v12;
        CFTypeID v14 = CFGetTypeID(v12);
        if (v14 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v13, kCFNumberLongLongType, &v56);
          *((_WORD *)this + 45) = v56;
        }
      }
      CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(properties, @"idProduct");
      if (v15)
      {
        CFNumberRef v16 = v15;
        CFTypeID v17 = CFGetTypeID(v15);
        if (v17 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v16, kCFNumberLongLongType, &v56);
          *((_WORD *)this + 46) = v56;
        }
      }
      CFNumberRef v18 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bcdDevice");
      if (v18)
      {
        CFNumberRef v19 = v18;
        CFTypeID v20 = CFGetTypeID(v18);
        if (v20 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v19, kCFNumberLongLongType, &v56);
          *((_WORD *)this + 47) = v56;
        }
      }
      CFNumberRef v21 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bConfigurationValue");
      if (v21)
      {
        CFNumberRef v22 = v21;
        CFTypeID v23 = CFGetTypeID(v21);
        if (v23 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v22, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 84) = v56;
        }
      }
      CFNumberRef v24 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bInterfaceNumber");
      if (v24)
      {
        CFNumberRef v25 = v24;
        CFTypeID v26 = CFGetTypeID(v24);
        if (v26 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v25, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 85) = v56;
        }
      }
      CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bAlternateSetting");
      if (v27)
      {
        CFNumberRef v28 = v27;
        CFTypeID v29 = CFGetTypeID(v27);
        if (v29 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v28, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 86) = v56;
        }
      }
      CFNumberRef v30 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bNumEndpoints");
      if (v30)
      {
        CFNumberRef v31 = v30;
        CFTypeID v32 = CFGetTypeID(v30);
        if (v32 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v31, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 87) = v56;
        }
      }
      CFNumberRef v33 = (const __CFNumber *)CFDictionaryGetValue(properties, @"iInterface");
      if (v33)
      {
        CFNumberRef v34 = v33;
        CFTypeID v35 = CFGetTypeID(v33);
        if (v35 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v34, kCFNumberLongLongType, &v56);
          *((unsigned char *)this + 88) = v56;
        }
      }
      CFNumberRef v36 = (const __CFNumber *)CFDictionaryGetValue(properties, @"locationID");
      if (v36)
      {
        CFNumberRef v37 = v36;
        CFTypeID v38 = CFGetTypeID(v36);
        if (v38 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v37, kCFNumberLongLongType, &v56);
          *((_DWORD *)this + 25) = v56;
        }
      }
      CFDataRef v39 = (const __CFData *)CFDictionaryGetValue(properties, @"InterfaceDescriptor");
      if (v39)
      {
        CFDataRef v40 = v39;
        CFTypeID v41 = CFGetTypeID(v39);
        if (v41 == CFDataGetTypeID()) {
          *((void *)this + 16) = CFDataGetBytePtr(v40);
        }
      }
      CFRelease(properties);
      CFMutableDictionaryRef properties = 0;
    }
    CFMutableDictionaryRef result = (CFMutableDictionaryRef)IORegistryEntryCreateCFProperties(*((_DWORD *)this + 14), &properties, 0, 0);
    if (!result)
    {
      CFMutableDictionaryRef result = properties;
      if (properties)
      {
        if (!*((void *)this + 17))
        {
          CFNumberRef v42 = (const __CFNumber *)CFDictionaryGetValue(properties, @"bNumConfigurations");
          if (v42 && (CFNumberRef v43 = v42, v44 = CFGetTypeID(v42), v44 == CFNumberGetTypeID()))
          {
            CFNumberGetValue(v43, kCFNumberLongLongType, &v56);
            unsigned __int8 v45 = v56;
            *((unsigned char *)this + 104) = v56;
            if (v45)
            {
              io_registry_entry_t v46 = malloc_type_malloc(8 * v45, 0x2004093837F09uLL);
              *((void *)this + 17) = v46;
              bzero(v46, 8 * *((unsigned __int8 *)this + 104));
            }
          }
          else
          {
            *((unsigned char *)this + 104) = 0;
          }
          CFBooleanRef v47 = (const __CFBoolean *)CFDictionaryGetValue(properties, @"kUSBIsochronousRequiresContiguous");
          *((unsigned char *)this + 146) = (v47 && (CFBooleanRef v48 = v47, v49 = CFGetTypeID(v47), v49 == CFBooleanGetTypeID())
                                 || (io_registry_entry_t v50 = *((_DWORD *)this + 13)) != 0
                                 && (CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v50, @"kUSBIsochronousRequiresContiguous", kCFAllocatorDefault, 0)) != 0&& (v48 = CFProperty, v52 = CFGetTypeID(CFProperty), v52 == CFBooleanGetTypeID()))&& CFBooleanGetValue(v48) != 0;
          CFNumberRef v53 = (const __CFNumber *)CFDictionaryGetValue(properties, @"Device Speed");
          if (v53)
          {
            CFNumberRef v54 = v53;
            CFTypeID v55 = CFGetTypeID(v53);
            if (v55 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v54, kCFNumberLongLongType, &v56);
              *((unsigned char *)this + 96) = v56;
            }
          }
        }
        CFRelease(properties);
        return 0;
      }
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::stop(IOUSBInterfaceClass *this)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  if (*((unsigned char *)this + 80)) {
    return (*(uint64_t (**)(void))(*(void *)this + 112))();
  }
  return 0;
}

uint64_t IOUSBInterfaceClass::GetInterfaceClass(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 81);
  return result;
}

uint64_t IOUSBInterfaceClass::GetInterfaceSubClass(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 82);
  return result;
}

uint64_t IOUSBInterfaceClass::GetInterfaceProtocol(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 83);
  return result;
}

uint64_t IOUSBInterfaceClass::GetInterfaceStringIndex(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 88);
  return result;
}

uint64_t IOUSBInterfaceClass::GetDeviceVendor(IOUSBInterfaceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 45);
  return result;
}

uint64_t IOUSBInterfaceClass::GetDeviceProduct(IOUSBInterfaceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 46);
  return result;
}

uint64_t IOUSBInterfaceClass::GetDeviceReleaseNumber(IOUSBInterfaceClass *this, unsigned __int16 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_WORD *)this + 47);
  return result;
}

uint64_t IOUSBInterfaceClass::GetConfigurationValue(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 84);
  return result;
}

uint64_t IOUSBInterfaceClass::GetInterfaceNumber(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 85);
  return result;
}

uint64_t IOUSBInterfaceClass::GetAlternateSetting(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 86);
  return result;
}

uint64_t IOUSBInterfaceClass::GetNumEndpoints(IOUSBInterfaceClass *this, unsigned __int8 *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((unsigned char *)this + 87);
  return result;
}

uint64_t IOUSBInterfaceClass::GetLocationID(IOUSBInterfaceClass *this, unsigned int *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_DWORD *)this + 25);
  return result;
}

uint64_t IOUSBInterfaceClass::GetDevice(IOUSBInterfaceClass *this, unsigned int *a2)
{
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  uint64_t result = 0;
  *a2 = *((_DWORD *)this + 14);
  return result;
}

uint64_t IOUSBInterfaceClass::CreateInterfaceAsyncEventSource(IOUSBInterfaceClass *this, __CFRunLoopSource **a2)
{
  CFNumberRef v4 = (const void *)*((void *)this + 9);
  if (v4) {
    goto LABEL_2;
  }
  uint64_t result = 3758097085;
  if (!*((void *)this + 8))
  {
    uint64_t result = (*(uint64_t (**)(IOUSBInterfaceClass *, void))(*(void *)this + 88))(this, 0);
    if (!result)
    {
      CFNumberRef v4 = (const void *)*((void *)this + 9);
      uint64_t result = 3758097085;
      if (v4)
      {
        if (a2)
        {
LABEL_2:
          CFRetain(v4);
          uint64_t result = 0;
          *a2 = (__CFRunLoopSource *)*((void *)this + 9);
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetInterfaceAsyncEventSource(IOUSBInterfaceClass *this)
{
  return *((void *)this + 9);
}

IONotificationPort *IOUSBInterfaceClass::CreateInterfaceAsyncPort(IOUSBInterfaceClass *this, unsigned int *a2)
{
  uint64_t result = (IONotificationPort *)3758097088;
  if (*((unsigned char *)this + 147))
  {
    CFTypeID v5 = (IONotificationPort *)*((void *)this + 8);
    if (v5)
    {
      if (a2)
      {
        mach_port_t MachPort = IONotificationPortGetMachPort(v5);
        uint64_t result = 0;
        *a2 = MachPort;
        return result;
      }
      return 0;
    }
    uint64_t result = IONotificationPortCreate(kIOMainPortDefault);
    *((void *)this + 8) = result;
    if (!result) {
      return result;
    }
    *((void *)this + 9) = IONotificationPortGetRunLoopSource(result);
    if (a2) {
      *a2 = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 8));
    }
    if (!*((unsigned char *)this + 80)) {
      return 0;
    }
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v13 = v7;
    long long v14 = v7;
    *(_OWORD *)reference = v7;
    long long v12 = v7;
    uint32_t outputCnt = 0;
    mach_port_t v8 = *((_DWORD *)this + 15);
    mach_port_t v9 = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 8));
    uint64_t result = (IONotificationPort *)IOConnectCallAsyncScalarMethod(v8, 0x13u, v9, reference, 1u, 0, 0, 0, &outputCnt);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return (IONotificationPort *)3758097088;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetInterfaceAsyncPort(IOUSBInterfaceClass *this)
{
  uint64_t v1 = (IONotificationPort *)*((void *)this + 8);
  if (v1) {
    return IONotificationPortGetMachPort(v1);
  }
  else {
    return 268435459;
  }
}

uint64_t IOUSBInterfaceClass::GetInterfaceAsyncNotificationPort(IOUSBInterfaceClass *this)
{
  return *((void *)this + 8);
}

uint64_t IOUSBInterfaceClass::USBInterfaceOpen(IOUSBInterfaceClass *this, unsigned int a2)
{
  uint64_t v2 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80)) {
      return 0;
    }
    io_service_t v6 = *((_DWORD *)this + 13);
    if (v6)
    {
      waitTime[0] = (mach_timespec_t)5;
      IOServiceWaitQuiet(v6, waitTime);
    }
    uint32_t outputCnt = 0;
    uint64_t input = a2;
    uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0, &input, 1u, 0, &outputCnt);
    if (!v2)
    {
      *((unsigned char *)this + 80) = 1;
      long long v7 = (IONotificationPort *)*((void *)this + 8);
      if (!v7) {
        return 0;
      }
      *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v16 = v8;
      long long v17 = v8;
      *(_OWORD *)&waitTime[0].tv_sec = v8;
      long long v15 = v8;
      mach_port_t v9 = *((_DWORD *)this + 15);
      mach_port_t MachPort = IONotificationPortGetMachPort(v7);
      uint64_t v11 = IOConnectCallAsyncScalarMethod(v9, 0x13u, MachPort, (uint64_t *)waitTime, 1u, 0, 0, 0, &outputCnt);
      uint64_t v2 = v11;
      if (v11 && v11 != 268435459) {
        (*(void (**)(IOUSBInterfaceClass *))(*(void *)this + 112))(this);
      }
    }
    if (v2 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return v2;
}

uint64_t IOUSBInterfaceClass::USBInterfaceClose(IOUSBInterfaceClass *this)
{
  uint64_t v5 = 0;
  *((unsigned char *)this + 80) = 0;
  if (*((unsigned char *)this + 147))
  {
    uint64_t v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 1u, 0, 0, 0, 0);
    if (v2 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      uint64_t v2 = 3758097088;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)this + 40);
  for (i = (unsigned int *)*((void *)this + 19); i; i = (unsigned int *)*((void *)this + 19))
  {
    *((void *)this + 19) = *((void *)i + 3);
    if (*i >= 2)
    {
      vm_deallocate(mach_task_self_, *((void *)i + 1), *((void *)i + 2));
    }
    else
    {
      IOConnectUnmapMemory64(*((_DWORD *)this + 15), i[1], mach_task_self_, *((void *)i + 1));
      uint64_t v5 = i[1];
      IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x10u, &v5, 1u, 0, 0);
    }
    free(i);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)this + 40);
  return v2;
}

uint64_t IOUSBInterfaceClass::RegisterDriver(IOUSBInterfaceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x21u, 0, 0, 0, 0);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::SetAlternateInterface(IOUSBInterfaceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t v4 = a2;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 3u, &v4, 1u, 0, 0);
      if (!result) {
        uint64_t result = (uint64_t)IOUSBInterfaceClass::GetPropertyInfo(this);
      }
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetBusMicroFrameNumber(IOUSBInterfaceClass *this, unint64_t *a2, UnsignedWide *a3)
{
  uint64_t v3 = 3758097088;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (*((unsigned char *)this + 147))
  {
    size_t outputStructCnt = 16;
    uint64_t v7 = IOConnectCallStructMethod(*((_DWORD *)this + 15), 0x11u, 0, 0, &outputStruct, &outputStructCnt);
    if (v7 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7)
      {
        UnsignedWide v8 = (UnsignedWide)v12;
        *a2 = outputStruct;
        *a3 = v8;
      }
    }
  }
  return v3;
}

uint64_t IOUSBInterfaceClass::GetBusFrameNumber(IOUSBInterfaceClass *this, unint64_t *a2, UnsignedWide *a3)
{
  uint64_t v3 = 3758097088;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (*((unsigned char *)this + 147))
  {
    size_t outputStructCnt = 16;
    uint64_t v7 = IOConnectCallStructMethod(*((_DWORD *)this + 15), 4u, 0, 0, &outputStruct, &outputStructCnt);
    if (v7 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7)
      {
        UnsignedWide v8 = (UnsignedWide)v12;
        *a2 = outputStruct;
        *a3 = v8;
      }
    }
  }
  return v3;
}

uint64_t IOUSBInterfaceClass::GetBusFrameNumberWithTime(IOUSBInterfaceClass *this, unint64_t *a2, UnsignedWide *a3)
{
  uint64_t v3 = 3758097088;
  unint64_t outputStruct = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (*((unsigned char *)this + 147))
  {
    size_t outputStructCnt = 16;
    uint64_t v7 = IOConnectCallStructMethod(*((_DWORD *)this + 15), 0x12u, 0, 0, &outputStruct, &outputStructCnt);
    if (v7 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
    }
    else
    {
      uint64_t v3 = v7;
      if (!v7)
      {
        UnsignedWide v8 = (UnsignedWide)v12;
        *a2 = outputStruct;
        *a3 = v8;
      }
    }
  }
  return v3;
}

uint64_t IOUSBInterfaceClass::GetFrameListTime(IOUSBInterfaceClass *this, unsigned int *a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (a2)
    {
      uint64_t result = 0;
      if (*((unsigned __int8 *)this + 96) >= 2u) {
        unsigned int v4 = 125;
      }
      else {
        unsigned int v4 = 1000;
      }
      *a2 = v4;
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetBandwidthAvailable(IOUSBInterfaceClass *this, unsigned int *a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = 0;
      unint64_t v4 = *((char *)this + 96);
      if (v4 <= 4)
      {
        uint64_t result = 0;
        *a2 = *(_DWORD *)&a0_0[4 * v4];
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::SetIdlePolicy(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    input[0] = a2;
    input[1] = a3;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x19u, input, 2u, 0, 0);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::OverrideIdlePolicy(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    v6[0] = a2;
    v6[1] = a3;
    _DWORD v6[2] = a4;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x1Au, v6, 3u, 0, 0);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::SetDeviceIdlePolicy(IOUSBInterfaceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    uint64_t v4 = a2;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x22u, &v4, 1u, 0, 0);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::SetPipeIdlePolicy(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    input[0] = a2;
    input[1] = a3;
    uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x23u, input, 2u, 0, 0);
    if (result == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetEndpointProperties(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int8 *a5, unsigned __int16 *a6, unsigned __int8 *a7)
{
  uint64_t v7 = 3758097088;
  uint32_t outputCnt = 3;
  if (*((unsigned char *)this + 147))
  {
    input[0] = a2;
    input[1] = a3;
    uint64_t input[2] = a4;
    uint64_t output = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v12 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0xEu, input, 3u, &output, &outputCnt);
    if (v12 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
    }
    else
    {
      uint64_t v7 = v12;
      if (!v12)
      {
        unsigned __int16 v13 = v18;
        *a5 = output;
        *a6 = v13;
        *a7 = v19;
      }
    }
  }
  return v7;
}

uint64_t IOUSBInterfaceClass::GetEndpointPropertiesV3(IOUSBInterfaceClass *this, IOUSBEndpointProperties *outputStruct)
{
  uint64_t result = 3758097088;
  size_t v5 = 15;
  if (*((unsigned char *)this + 147))
  {
    if (outputStruct->bVersion == 3)
    {
      uint64_t bEndpointNumber = outputStruct->bEndpointNumber;
      input[0] = outputStruct->bAlternateSetting;
      input[1] = bEndpointNumber;
      uint64_t input[2] = outputStruct->bDirection;
      uint64_t input[3] = 3;
      uint64_t result = IOConnectCallMethod(*((_DWORD *)this + 15), 0x1Du, input, 4u, 0, 0, 0, 0, outputStruct, &v5);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::ControlRequest(IOUSBInterfaceClass *this, unsigned int a2, IOUSBDevRequestTO *a3)
{
  uint64_t v3 = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 147))
  {
    uint64_t bmRequestType = a3->bmRequestType;
    input[0] = a2;
    input[1] = bmRequestType;
    wCFNumberRef Value = a3->wValue;
    uint64_t input[2] = a3->bRequest;
    uint64_t input[3] = wValue;
    wCFIndex Length = a3->wLength;
    uint64_t input[4] = a3->wIndex;
    input[5] = wLength;
    unint64_t outputStruct = a3->pData;
    input[6] = (uint64_t)outputStruct;
    UInt32 completionTimeout = a3->completionTimeout;
    if (!completionTimeout) {
      UInt32 completionTimeout = a3->noDataTimeout;
    }
    input[7] = completionTimeout;
    a3->wLenDone = 0;
    size_t v14 = wLength;
    if ((char)bmRequestType < 0)
    {
      uint64_t output = 0;
      uint64_t v11 = IOConnectCallMethod(*((_DWORD *)this + 15), 0xCu, input, 8u, 0, 0, &output, &outputCnt, outputStruct, &v14);
      UInt32 v12 = v14;
      if (v11) {
        UInt32 v12 = 0;
      }
      a3->wLenDone = v12;
      if (output) {
        return 3758097128;
      }
      uint64_t v3 = v11;
    }
    else
    {
      uint64_t v3 = IOConnectCallMethod(*((_DWORD *)this + 15), 0xBu, input, 8u, outputStruct, wLength, 0, 0, 0, 0);
      if (!v3)
      {
        a3->wLenDone = a3->wLength;
        return v3;
      }
      a3->wLenDone = 0;
    }
    if (v3 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      return 3758097088;
    }
  }
  return v3;
}

uint64_t IOUSBInterfaceClass::ControlRequestAsync(IOUSBInterfaceClass *this, unsigned int a2, IOUSBDevRequestTO *a3, void (*a4)(void *, int, void *), void *a5)
{
  uint32_t outputCnt = 1;
  io_service_t v6 = (IONotificationPort *)*((void *)this + 8);
  if (!v6)
  {
    unsigned __int16 v17 = 16479;
    return v17 | 0xE0000000;
  }
  uint64_t v7 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    uint64_t bmRequestType = a3->bmRequestType;
    input[0] = a2;
    input[1] = bmRequestType;
    int v9 = (char)bmRequestType;
    wCFNumberRef Value = a3->wValue;
    uint64_t input[2] = a3->bRequest;
    uint64_t input[3] = wValue;
    wCFIndex Length = a3->wLength;
    uint64_t input[4] = a3->wIndex;
    input[5] = wLength;
    input[6] = (uint64_t)a3->pData;
    UInt32 completionTimeout = a3->completionTimeout;
    if (!completionTimeout) {
      UInt32 completionTimeout = a3->noDataTimeout;
    }
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v13;
    long long v26 = v13;
    uint64_t output = 0xAAAAAAAAAAAAAAAALL;
    input[7] = completionTimeout;
    reference[1] = (uint64_t)a4;
    CFTypeID v23 = a5;
    mach_port_t v14 = *((_DWORD *)this + 15);
    mach_port_t MachPort = IONotificationPortGetMachPort(v6);
    uint64_t v16 = v9 < 0
        ? IOConnectCallAsyncScalarMethod(v14, 0xCu, MachPort, reference, 3u, input, 8u, &output, &outputCnt)
        : IOConnectCallAsyncScalarMethod(v14, 0xBu, MachPort, reference, 3u, input, 8u, 0, 0);
    uint64_t v7 = v16;
    if (v16 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      unsigned __int16 v17 = 704;
      return v17 | 0xE0000000;
    }
  }
  return v7;
}

uint64_t IOUSBInterfaceClass::ReadPipe(IOUSBInterfaceClass *this, unsigned int a2, void *outputStruct, unsigned int *a4, unsigned int a5, unsigned int a6)
{
  uint64_t v6 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      size_t v11 = *a4;
      input[0] = a2;
      input[1] = 0;
      uint64_t input[2] = a6;
      uint64_t input[3] = a5;
      uint64_t input[4] = (uint64_t)outputStruct;
      input[5] = v11;
      input[6] = 0;
      uint64_t v9 = IOConnectCallMethod(*((_DWORD *)this + 15), 6u, input, 7u, 0, 0, 0, 0, outputStruct, &v11);
      if (v9 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
      }
      else
      {
        uint64_t v6 = v9;
        if (!v9) {
          *a4 = v11;
        }
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v6;
}

uint64_t IOUSBInterfaceClass::ReadPipeAsync(IOUSBInterfaceClass *this, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, void (*a7)(void *, int, void *), void *a8)
{
  uint64_t v9 = (IONotificationPort *)*((void *)this + 8);
  if (!v9)
  {
    unsigned __int16 v14 = 16479;
    return v14 | 0xE0000000;
  }
  uint64_t v10 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (!*((unsigned char *)this + 80)) {
      return 3758097101;
    }
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v11;
    long long v21 = v11;
    input[0] = a2;
    input[1] = 0;
    uint64_t input[2] = a6;
    uint64_t input[3] = a5;
    uint64_t input[4] = a3;
    input[5] = a4;
    input[6] = 0;
    reference[1] = (uint64_t)a7;
    uint64_t v18 = a8;
    mach_port_t v12 = *((_DWORD *)this + 15);
    mach_port_t MachPort = IONotificationPortGetMachPort(v9);
    uint64_t v10 = IOConnectCallAsyncMethod(v12, 6u, MachPort, reference, 3u, input, 7u, 0, 0, 0, 0, 0, 0);
    if (v10 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      unsigned __int16 v14 = 704;
      return v14 | 0xE0000000;
    }
  }
  return v10;
}

uint64_t IOUSBInterfaceClass::WritePipe(IOUSBInterfaceClass *this, unsigned int a2, void *inputStruct, size_t inputStructCnt, unsigned int a5, unsigned int a6)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = 0;
      uint64_t input[2] = a6;
      uint64_t input[3] = a5;
      uint64_t input[4] = (uint64_t)inputStruct;
      input[5] = inputStructCnt;
      input[6] = 1;
      uint64_t result = IOConnectCallMethod(*((_DWORD *)this + 15), 7u, input, 7u, inputStruct, inputStructCnt, 0, 0, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::WritePipeAsync(IOUSBInterfaceClass *this, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, void (*a7)(void *, int, void *), void *a8)
{
  uint64_t v9 = (IONotificationPort *)*((void *)this + 8);
  if (!v9)
  {
    unsigned __int16 v14 = 16479;
    return v14 | 0xE0000000;
  }
  uint64_t v10 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (!*((unsigned char *)this + 80)) {
      return 3758097101;
    }
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v20 = v11;
    long long v21 = v11;
    input[0] = a2;
    input[1] = 0;
    uint64_t input[2] = a6;
    uint64_t input[3] = a5;
    uint64_t input[4] = a3;
    input[5] = a4;
    input[6] = 1;
    reference[1] = (uint64_t)a7;
    uint64_t v18 = a8;
    mach_port_t v12 = *((_DWORD *)this + 15);
    mach_port_t MachPort = IONotificationPortGetMachPort(v9);
    uint64_t v10 = IOConnectCallAsyncMethod(v12, 7u, MachPort, reference, 3u, input, 7u, 0, 0, 0, 0, 0, 0);
    if (v10 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      unsigned __int16 v14 = 704;
      return v14 | 0xE0000000;
    }
  }
  return v10;
}

uint64_t IOUSBInterfaceClass::GetPipeProperties(IOUSBInterfaceClass *this, unsigned int a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned __int16 *a6, unsigned __int8 *a7)
{
  uint64_t v7 = 3758097088;
  uint32_t outputCnt = 5;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t input = a2;
      *(_OWORD *)uint64_t output = 0u;
      long long v21 = 0u;
      uint64_t v22 = 0;
      uint64_t v14 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 5u, &input, 1u, output, &outputCnt);
      if (v14 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
      }
      else
      {
        uint64_t v7 = v14;
        if (!v14)
        {
          unsigned __int8 v15 = output[1];
          *a3 = output[0];
          *a4 = v15;
          unsigned __int16 v16 = WORD4(v21);
          *a5 = v21;
          *a6 = v16;
          *a7 = v22;
        }
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v7;
}

uint64_t IOUSBInterfaceClass::GetPipePropertiesV2(IOUSBInterfaceClass *this, unsigned int a2, unsigned __int8 *a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned __int16 *a6, unsigned __int8 *a7, unsigned __int8 *a8, unsigned __int8 *a9, unsigned __int16 *a10)
{
  uint64_t result = 3758097088;
  uint32_t outputCnt = 8;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t input = a2;
      *(_OWORD *)uint64_t output = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x1Bu, &input, 1u, output, &outputCnt);
      if (result)
      {
        *a3 = 0;
        *a4 = 0;
        *a5 = 0;
        *a6 = 0;
        *a7 = 0;
        *a8 = 0;
        *a9 = 0;
        *a10 = 0;
        if (result == 268435459)
        {
          *((unsigned char *)this + 80) = 0;
          *((unsigned char *)this + 147) = 0;
          return 3758097088;
        }
      }
      else
      {
        unsigned __int8 v18 = output[1];
        *a3 = output[0];
        *a4 = v18;
        unsigned __int16 v19 = WORD4(v24);
        *a5 = v24;
        *a6 = v19;
        LOBYTE(v19) = BYTE8(v25);
        *a7 = v25;
        *a8 = v19;
        unsigned __int16 v20 = WORD4(v26);
        *a9 = v26;
        *a10 = v20;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetPipePropertiesV3(IOUSBInterfaceClass *this, unsigned int a2, IOUSBEndpointProperties *outputStruct)
{
  uint64_t result = 3758097088;
  size_t v5 = 15;
  if (*((unsigned char *)this + 147))
  {
    if (outputStruct->bVersion == 3)
    {
      input[0] = a2;
      input[1] = 3;
      uint64_t result = IOConnectCallMethod(*((_DWORD *)this + 15), 0x1Cu, input, 2u, 0, 0, 0, 0, outputStruct, &v5);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetPipeStatus(IOUSBInterfaceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t v4 = a2;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 8u, &v4, 1u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::AbortPipe(IOUSBInterfaceClass *this, unsigned int a2)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = 0;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 9u, input, 2u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::ResetPipe(IOUSBInterfaceClass *this, uint64_t a2)
{
  return (*(uint64_t (**)(IOUSBInterfaceClass *, uint64_t, void))(*(void *)this + 296))(this, a2, 0);
}

uint64_t IOUSBInterfaceClass::ClearPipeStall(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0xAu, input, 2u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::SetPipePolicy(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      v6[0] = a2;
      v6[1] = a3;
      _DWORD v6[2] = a4;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0xDu, v6, 3u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::SupportsStreams(IOUSBInterfaceClass *this, unsigned int a2, unsigned int *a3)
{
  uint64_t v3 = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 147))
  {
    uint64_t output = 0;
    uint64_t input = a2;
    uint64_t v6 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x1Eu, &input, 1u, &output, &outputCnt);
    if (v6 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
    }
    else
    {
      uint64_t v3 = v6;
      if (!v6) {
        *a3 = output;
      }
    }
  }
  return v3;
}

uint64_t IOUSBInterfaceClass::CreateStreams(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x1Fu, input, 2u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::GetConfiguredStreams(IOUSBInterfaceClass *this, unsigned int a2, unsigned int *a3)
{
  uint64_t v3 = 3758097088;
  uint32_t outputCnt = 1;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      uint64_t output = 0;
      uint64_t input = a2;
      uint64_t v6 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x20u, &input, 1u, &output, &outputCnt);
      if (v6 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
      }
      else
      {
        uint64_t v3 = v6;
        if (!v6) {
          *a3 = output;
        }
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v3;
}

uint64_t IOUSBInterfaceClass::ReadStreamsPipeTO(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int *a5)
{
  uint64_t v5 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = 0;
      uint64_t input[3] = 0;
      uint64_t input[4] = (uint64_t)outputStruct;
      input[5] = (uint64_t)a5;
      input[6] = 0;
      size_t v10 = *a5;
      uint64_t v8 = IOConnectCallMethod(*((_DWORD *)this + 15), 6u, input, 7u, 0, 0, 0, 0, outputStruct, &v10);
      if (v8 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
      }
      else
      {
        uint64_t v5 = v8;
        if (!v8) {
          *a5 = v10;
        }
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v5;
}

uint64_t IOUSBInterfaceClass::WriteStreamsPipeTO(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = 0;
      uint64_t input[3] = 0;
      uint64_t input[4] = (uint64_t)inputStruct;
      input[5] = inputStructCnt;
      input[6] = 1;
      uint64_t result = IOConnectCallMethod(*((_DWORD *)this + 15), 7u, input, 7u, inputStruct, inputStructCnt, 0, 0, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::ReadStreamsPipeAsyncTO(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, void (*a8)(void *, int, void *), void *a9)
{
  size_t v10 = (IONotificationPort *)*((void *)this + 8);
  if (!v10)
  {
    unsigned __int16 v15 = 16479;
    return v15 | 0xE0000000;
  }
  uint64_t v11 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (!*((unsigned char *)this + 80)) {
      return 3758097101;
    }
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v12;
    long long v22 = v12;
    input[0] = a2;
    input[1] = a3;
    uint64_t input[2] = 0;
    uint64_t input[3] = 0;
    uint64_t input[4] = a4;
    input[5] = a5;
    input[6] = 0;
    reference[1] = (uint64_t)a8;
    unsigned __int16 v19 = a9;
    mach_port_t v13 = *((_DWORD *)this + 15);
    mach_port_t MachPort = IONotificationPortGetMachPort(v10);
    uint64_t v11 = IOConnectCallAsyncScalarMethod(v13, 6u, MachPort, reference, 3u, input, 7u, 0, 0);
    if (v11 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      unsigned __int16 v15 = 704;
      return v15 | 0xE0000000;
    }
  }
  return v11;
}

uint64_t IOUSBInterfaceClass::WriteStreamsPipeAsyncTO(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, void (*a8)(void *, int, void *), void *a9)
{
  size_t v10 = (IONotificationPort *)*((void *)this + 8);
  if (!v10)
  {
    unsigned __int16 v15 = 16479;
    return v15 | 0xE0000000;
  }
  uint64_t v11 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (!*((unsigned char *)this + 80)) {
      return 3758097101;
    }
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
    reference[0] = 0xAAAAAAAAAAAAAAAALL;
    long long v21 = v12;
    long long v22 = v12;
    input[0] = a2;
    input[1] = a3;
    uint64_t input[2] = 0;
    uint64_t input[3] = 0;
    uint64_t input[4] = a4;
    input[5] = a5;
    input[6] = 1;
    reference[1] = (uint64_t)a8;
    unsigned __int16 v19 = a9;
    mach_port_t v13 = *((_DWORD *)this + 15);
    mach_port_t MachPort = IONotificationPortGetMachPort(v10);
    uint64_t v11 = IOConnectCallAsyncScalarMethod(v13, 7u, MachPort, reference, 3u, input, 7u, 0, 0);
    if (v11 == 268435459)
    {
      *((unsigned char *)this + 80) = 0;
      *((unsigned char *)this + 147) = 0;
      unsigned __int16 v15 = 704;
      return v15 | 0xE0000000;
    }
  }
  return v11;
}

uint64_t IOUSBInterfaceClass::AbortStreamsPipe(IOUSBInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      input[0] = a2;
      input[1] = a3;
      uint64_t result = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 9u, input, 2u, 0, 0);
      if (result == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        return 3758097088;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::RegisterForNotification(IOUSBInterfaceClass *this, unint64_t a2, void (*a3)(void *, int, void *, void *), void *a4, unint64_t *a5)
{
  if (!*((void *)this + 8))
  {
    unsigned __int16 v7 = 16479;
    return v7 | 0xE0000000;
  }
  uint64_t result = 3758097090;
  if (a4 && a3 && a5)
  {
    if (*((unsigned char *)this + 147))
    {
      if (*((unsigned char *)this + 80)) {
        return 3758097095;
      }
      else {
        return 3758097101;
      }
    }
    unsigned __int16 v7 = 704;
    return v7 | 0xE0000000;
  }
  return result;
}

uint64_t IOUSBInterfaceClass::UnregisterNotification(IOUSBInterfaceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80)) {
      return 3758097095;
    }
    else {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::AcknowledgeNotification(IOUSBInterfaceClass *this)
{
  uint64_t result = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80)) {
      return 3758097095;
    }
    else {
      return 3758097101;
    }
  }
  return result;
}

uint64_t IOUSBInterfaceClass::ReadIsochPipeAsync(IOUSBInterfaceClass *this, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, IOUSBIsocFrame *a6, void (*a7)(void *, int, void *), void *a8)
{
  uint64_t v9 = (IONotificationPort *)*((void *)this + 8);
  if (!v9)
  {
    unsigned __int16 v16 = 16479;
    return v16 | 0xE0000000;
  }
  uint64_t v10 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      if (a5)
      {
        LODWORD(v11) = 0;
        uint64_t v12 = a5;
        p_frReqCount = &a6->frReqCount;
        uint64_t v14 = a5;
        do
        {
          int v15 = *p_frReqCount;
          p_frReqCount += 4;
          uint64_t v11 = (v11 + v15);
          --v14;
        }
        while (v14);
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v11 = 0;
      }
      *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      reference[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v25 = v17;
      long long v26 = v17;
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = v11;
      uint64_t input[3] = a4;
      uint64_t input[4] = v12;
      input[5] = (uint64_t)a6;
      input[6] = 0;
      reference[1] = (uint64_t)a7;
      CFTypeID v23 = a8;
      mach_port_t v18 = *((_DWORD *)this + 15);
      mach_port_t MachPort = IONotificationPortGetMachPort(v9);
      uint64_t v10 = IOConnectCallAsyncScalarMethod(v18, 0x14u, MachPort, reference, 3u, input, 7u, 0, 0);
      if (v10 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        unsigned __int16 v16 = 704;
        return v16 | 0xE0000000;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v10;
}

uint64_t IOUSBInterfaceClass::WriteIsochPipeAsync(IOUSBInterfaceClass *this, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, IOUSBIsocFrame *a6, void (*a7)(void *, int, void *), void *a8)
{
  uint64_t v9 = (IONotificationPort *)*((void *)this + 8);
  if (!v9)
  {
    unsigned __int16 v16 = 16479;
    return v16 | 0xE0000000;
  }
  uint64_t v10 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      if (a5)
      {
        LODWORD(v11) = 0;
        uint64_t v12 = a5;
        p_frReqCount = &a6->frReqCount;
        uint64_t v14 = a5;
        do
        {
          int v15 = *p_frReqCount;
          p_frReqCount += 4;
          uint64_t v11 = (v11 + v15);
          --v14;
        }
        while (v14);
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v11 = 0;
      }
      *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
      reference[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v25 = v17;
      long long v26 = v17;
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = v11;
      uint64_t input[3] = a4;
      uint64_t input[4] = v12;
      input[5] = (uint64_t)a6;
      input[6] = 1;
      reference[1] = (uint64_t)a7;
      CFTypeID v23 = a8;
      mach_port_t v18 = *((_DWORD *)this + 15);
      mach_port_t MachPort = IONotificationPortGetMachPort(v9);
      uint64_t v10 = IOConnectCallAsyncScalarMethod(v18, 0x15u, MachPort, reference, 3u, input, 7u, 0, 0);
      if (v10 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        unsigned __int16 v16 = 704;
        return v16 | 0xE0000000;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v10;
}

uint64_t IOUSBInterfaceClass::LowLatencyReadIsochPipeAsync(IOUSBInterfaceClass *this, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, IOUSBLowLatencyIsocFrame *a7, void (*a8)(void *, int, void *), void *a9)
{
  uint64_t v10 = (IONotificationPort *)*((void *)this + 8);
  if (!v10)
  {
    unsigned __int16 v17 = 16479;
    return v17 | 0xE0000000;
  }
  uint64_t v11 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      if (a5)
      {
        LODWORD(v12) = 0;
        uint64_t v13 = a5;
        p_frReqCount = &a7->frReqCount;
        uint64_t v15 = a5;
        do
        {
          int v16 = *p_frReqCount;
          p_frReqCount += 8;
          uint64_t v12 = (v12 + v16);
          --v15;
        }
        while (v15);
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v12 = 0;
      }
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
      reference[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v18;
      long long v27 = v18;
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = v12;
      uint64_t input[3] = a4;
      uint64_t input[4] = v13;
      input[5] = (uint64_t)a7;
      input[6] = 0;
      reference[1] = (uint64_t)a8;
      unint64_t v24 = a9;
      mach_port_t v19 = *((_DWORD *)this + 15);
      mach_port_t MachPort = IONotificationPortGetMachPort(v10);
      uint64_t v11 = IOConnectCallAsyncScalarMethod(v19, 0x16u, MachPort, reference, 3u, input, 7u, 0, 0);
      if (v11 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        unsigned __int16 v17 = 704;
        return v17 | 0xE0000000;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v11;
}

uint64_t IOUSBInterfaceClass::LowLatencyWriteIsochPipeAsync(IOUSBInterfaceClass *this, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, IOUSBLowLatencyIsocFrame *a7, void (*a8)(void *, int, void *), void *a9)
{
  uint64_t v10 = (IONotificationPort *)*((void *)this + 8);
  if (!v10)
  {
    unsigned __int16 v17 = 16479;
    return v17 | 0xE0000000;
  }
  uint64_t v11 = 3758097088;
  if (*((unsigned char *)this + 147))
  {
    if (*((unsigned char *)this + 80))
    {
      if (a5)
      {
        LODWORD(v12) = 0;
        uint64_t v13 = a5;
        p_frReqCount = &a7->frReqCount;
        uint64_t v15 = a5;
        do
        {
          int v16 = *p_frReqCount;
          p_frReqCount += 8;
          uint64_t v12 = (v12 + v16);
          --v15;
        }
        while (v15);
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v12 = 0;
      }
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
      reference[0] = 0xAAAAAAAAAAAAAAAALL;
      long long v26 = v18;
      long long v27 = v18;
      input[0] = a2;
      input[1] = a3;
      uint64_t input[2] = v12;
      uint64_t input[3] = a4;
      uint64_t input[4] = v13;
      input[5] = (uint64_t)a7;
      input[6] = 1;
      reference[1] = (uint64_t)a8;
      unint64_t v24 = a9;
      mach_port_t v19 = *((_DWORD *)this + 15);
      mach_port_t MachPort = IONotificationPortGetMachPort(v10);
      uint64_t v11 = IOConnectCallAsyncScalarMethod(v19, 0x17u, MachPort, reference, 3u, input, 7u, 0, 0);
      if (v11 == 268435459)
      {
        *((unsigned char *)this + 80) = 0;
        *((unsigned char *)this + 147) = 0;
        unsigned __int16 v17 = 704;
        return v17 | 0xE0000000;
      }
    }
    else
    {
      return 3758097101;
    }
  }
  return v11;
}

uint64_t IOUSBInterfaceClass::LowLatencyCreateBuffer(IOUSBInterfaceClass *this, void **a2, vm_size_t a3, unsigned int a4)
{
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)uint64_t input = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (!*((unsigned char *)this + 147)) {
    return 3758097088;
  }
  if (!*((unsigned char *)this + 80)) {
    return 3758097101;
  }
  uint64_t v6 = 3758097090;
  if (a2 && a3)
  {
    *a2 = 0;
    uint64_t v9 = malloc_type_malloc(0x20uLL, 0x1020040A5B76CDFuLL);
    if (!v9) {
      return 3758097085;
    }
    uint64_t v10 = (unsigned int *)v9;
    if (a4 > 1)
    {
      *((void *)v9 + 2) = a3;
      *((_DWORD *)v9 + 1) = 0;
      if (vm_allocate(mach_task_self_, (vm_address_t *)v9 + 1, a3, 1))
      {
LABEL_18:
        free(v10);
        return 3758097085;
      }
    }
    else
    {
      if (a4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      input[0] = v11;
      input[1] = a3;
      uint32_t outputCnt = 1;
      uint64_t output = 0;
      uint64_t v12 = IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0xFu, input, 2u, &output, &outputCnt);
      if (v12)
      {
        uint64_t v6 = v12;
        free(v10);
        return v6;
      }
      mach_vm_size_t v15 = 0;
      mach_vm_address_t atAddress = 0;
      if (IOConnectMapMemory64(*((_DWORD *)this + 15), output, mach_task_self_, &atAddress, &v15, 1u))
      {
        input[0] = output;
        IOConnectCallScalarMethod(*((_DWORD *)this + 15), 0x10u, input, 1u, 0, 0);
        goto LABEL_18;
      }
      v10[1] = output;
      mach_vm_size_t v13 = v15;
      *((void *)v10 + 1) = atAddress;
      *((void *)v10 + 2) = v13;
    }
    unsigned int *v10 = a4;
    os_unfair_lock_lock((os_unfair_lock_t)this + 40);
    *((void *)v10 + 3) = *((void *)this + 19);
    *((void *)this + 19) = v10;
    os_unfair_lock_unlock((os_unfair_lock_t)this + 40);
    uint64_t v6 = 0;
    *a2 = (void *)*((void *)v10 + 1);
  }
  return v6;
}

uint64_t IOUSBInterfaceClass::LowLatencyDestroyBuffer(os_unfair_lock_s *this, void *a2)
{
  uint64_t v4 = this + 40;
  os_unfair_lock_lock(this + 40);
  uint64_t v6 = this + 38;
  uint64_t v5 = *(os_unfair_lock_s **)&this[38]._os_unfair_lock_opaque;
  if (v5)
  {
    unsigned __int16 v7 = *(os_unfair_lock_s **)&this[38]._os_unfair_lock_opaque;
    while (*(void **)&v7[2]._os_unfair_lock_opaque != a2)
    {
      unsigned __int16 v7 = *(os_unfair_lock_s **)&v7[6]._os_unfair_lock_opaque;
      if (!v7) {
        goto LABEL_5;
      }
    }
    if (v5 != v7)
    {
      do
      {
        uint64_t v9 = v5;
        uint64_t v5 = *(os_unfair_lock_s **)&v5[6]._os_unfair_lock_opaque;
      }
      while (v5 != v7);
      uint64_t v6 = v9 + 6;
      uint64_t v5 = v7;
    }
    *(void *)&v6->_uint64_t os_unfair_lock_opaque = *(void *)&v5[6]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
    if (v7->_os_unfair_lock_opaque >= 2)
    {
      vm_deallocate(mach_task_self_, *(void *)&v7[2]._os_unfair_lock_opaque, *(void *)&v7[4]._os_unfair_lock_opaque);
    }
    else
    {
      IOConnectUnmapMemory64(this[15]._os_unfair_lock_opaque, v7[1]._os_unfair_lock_opaque, mach_task_self_, *(void *)&v7[2]._os_unfair_lock_opaque);
      uint64_t os_unfair_lock_opaque = v7[1]._os_unfair_lock_opaque;
      IOConnectCallScalarMethod(this[15]._os_unfair_lock_opaque, 0x10u, &os_unfair_lock_opaque, 1u, 0, 0);
    }
    free(v7);
    return 0;
  }
  else
  {
LABEL_5:
    os_unfair_lock_unlock(v4);
    return 3758097136;
  }
}

uint64_t IOUSBInterfaceClass::CacheConfigDescriptor(IOUSBInterfaceClass *this)
{
  if (*((unsigned char *)this + 104))
  {
    uint64_t v2 = 0;
    do
    {
      int outputStruct = -1431655766;
      *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v15 = v3;
      long long v16 = v3;
      uint64_t input = v2;
      mach_port_t v4 = *((_DWORD *)this + 15);
      size_t outputStructCnt = 4;
      uint64_t v5 = IOConnectCallMethod(v4, 0x18u, &input, 1u, 0, 0, 0, 0, &outputStruct, &outputStructCnt);
      if (v5) {
        return v5;
      }
      uint64_t input = v2;
      size_t outputStructCnt = HIWORD(outputStruct);
      uint64_t v6 = malloc_type_malloc(HIWORD(outputStruct) + 2, 0x78D28025uLL);
      uint64_t v7 = IOConnectCallMethod(*((_DWORD *)this + 15), 0x18u, &input, 1u, 0, 0, 0, 0, v6, &outputStructCnt);
      if (v7)
      {
        uint64_t v10 = v7;
        free(v6);
        return v10;
      }
      *((unsigned char *)v6 + outputStructCnt) = 0;
      *((unsigned char *)v6 + outputStructCnt + 1) = 0;
      *(void *)(*((void *)this + 17) + 8 * v2++) = v6;
      uint64_t v8 = *((unsigned __int8 *)this + 104);
    }
    while (v2 < v8);
    *((unsigned char *)this + 144) = 1;
    if (v8)
    {
      uint64_t v9 = 0;
      while (*(unsigned __int8 *)(*(void *)(*((void *)this + 17) + 8 * v9) + 5) != *((unsigned __int8 *)this + 84))
      {
        if (v8 == ++v9) {
          return 0;
        }
      }
      uint64_t v10 = 0;
      *((unsigned char *)this + 145) = v9;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    *((unsigned char *)this + 144) = 1;
  }
  return v10;
}

unsigned char *IOUSBInterfaceClass::NextDescriptor(IOUSBInterfaceClass *this, unsigned char *a2)
{
  if (*a2) {
    return &a2[*a2];
  }
  else {
    return 0;
  }
}

unsigned __int8 *IOUSBInterfaceClass::FindNextDescriptor(IOUSBInterfaceClass *this, char *a2, int a3)
{
  uint64_t v6 = *(unsigned __int16 **)(*((void *)this + 17) + 8 * *((unsigned __int8 *)this + 145));
  if (*((unsigned char *)this + 144)) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if ((*(unsigned int (**)(IOUSBInterfaceClass *))(*(void *)this + 432))(this)) {
      return 0;
    }
    uint64_t v6 = *(unsigned __int16 **)(*((void *)this + 17) + 8 * *((unsigned __int8 *)this + 145));
  }
  uint64_t v8 = (char *)v6[1];
  if (!a2)
  {
    a2 = (char *)v6;
    goto LABEL_16;
  }
  if (a2 < (char *)v6 || a2 - (char *)v6 >= (unint64_t)v8) {
    return 0;
  }
LABEL_16:
  while (1)
  {
    uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(IOUSBInterfaceClass *, char *))(*(void *)this + 448))(this, a2);
    BOOL v11 = !result || a2 == (char *)result;
    BOOL v12 = v11 || result - (unsigned __int8 *)v6 >= (unint64_t)v8;
    BOOL v13 = v12;
    if (v12 || !a3) {
      break;
    }
    a2 = (char *)result;
    if (result[1] == a3) {
      return result;
    }
  }
  if (v13) {
    return 0;
  }
  return result;
}

unsigned __int8 *IOUSBInterfaceClass::FindNextAssociatedDescriptor(IOUSBInterfaceClass *this, unsigned __int8 *a2, int a3)
{
  if (!*((_DWORD *)this + 15)
    || !*((unsigned char *)this + 144)
    && (*(unsigned int (**)(IOUSBInterfaceClass *))(*(void *)this + 432))(this))
  {
    return 0;
  }
  if (!a2)
  {
    do
    {
      BOOL v7 = (unsigned __int8 *)(*(uint64_t (**)(IOUSBInterfaceClass *, unsigned __int8 *, uint64_t))(*(void *)this + 440))(this, a2, 4);
      a2 = v7;
    }
    while (v7 && v7[2] != *((unsigned __int8 *)this + 85));
  }
  do
  {
    uint64_t v8 = (unsigned __int8 *)(*(uint64_t (**)(IOUSBInterfaceClass *, unsigned __int8 *, void))(*(void *)this + 440))(this, a2, 0);
    a2 = v8;
    if (!v8) {
      break;
    }
    int v9 = v8[1];
    if (v9 == 11 || a3 != 4 && v9 == 4 || v9 == 4 && v8[2] != *((unsigned __int8 *)this + 85)) {
      return 0;
    }
  }
  while (a3 && v9 != a3);
  return a2;
}

uint64_t IOUSBInterfaceClass::FindNextAltInterface(IOUSBInterfaceClass *this, const void *a2, IOUSBFindInterfaceRequest *a3)
{
  return 0;
}

uint64_t IOUSBInterfaceClass::interfaceProbe(IOUSBInterfaceClass *this, void *a2, const __CFDictionary *a3, unsigned int a4, int *a5)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 48))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceStart(IOUSBInterfaceClass *this, void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 56))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceStop(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 64))();
}

uint64_t IOUSBInterfaceClass::interfaceCreateInterfaceAsyncEventSource(IOUSBInterfaceClass *this, void *a2, __CFRunLoopSource **a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 72))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceAsyncEventSource(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 80))();
}

uint64_t IOUSBInterfaceClass::interfaceCreateInterfaceAsyncPort(IOUSBInterfaceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 88))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceAsyncPort(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 96))();
}

uint64_t IOUSBInterfaceClass::interfaceUSBInterfaceOpen(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void))(**((void **)this + 1) + 104))(*((void *)this + 1), 0);
}

uint64_t IOUSBInterfaceClass::interfaceUSBInterfaceClose(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 112))();
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceClass(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 120))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceSubClass(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 128))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceProtocol(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 136))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetDeviceVendor(IOUSBInterfaceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 144))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetDeviceProduct(IOUSBInterfaceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 152))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetDeviceReleaseNumber(IOUSBInterfaceClass *this, void *a2, unsigned __int16 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 160))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetConfigurationValue(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 168))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceNumber(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 176))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetAlternateSetting(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 184))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetNumEndpoints(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 192))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetLocationID(IOUSBInterfaceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 200))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetDevice(IOUSBInterfaceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 208))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceSetAlternateInterface(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 216))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetBusFrameNumber(IOUSBInterfaceClass *this, void *a2, unint64_t *a3, UnsignedWide *a4)
{
  return (*(uint64_t (**)(void, void *, unint64_t *))(**((void **)this + 1) + 224))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceControlRequest(IOUSBInterfaceClass *this, void *a2, int *a3, IOUSBDevRequest *a4)
{
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  int v5 = a3[1];
  int v8 = *a3;
  int v9 = v5;
  uint64_t v10 = *((void *)a3 + 1);
  if (a2) {
    int v6 = 0;
  }
  else {
    int v6 = 5000;
  }
  int v11 = a3[4];
  int v12 = v6;
  LODWORD(v13) = 0;
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 1) + 248))(*((void *)this + 1));
  a3[4] = v11;
  return result;
}

uint64_t IOUSBInterfaceClass::interfaceControlRequestAsync(IOUSBInterfaceClass *this, void *a2, int *a3, IOUSBDevRequest *a4, void (*a5)(void *, int, void *), void *a6)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = a3[1];
  int v9 = *a3;
  int v10 = v6;
  uint64_t v11 = *((void *)a3 + 1);
  if (a2) {
    int v7 = 0;
  }
  else {
    int v7 = 5000;
  }
  int v12 = a3[4];
  int v13 = v7;
  LODWORD(v14) = 0;
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 256))(*((void *)this + 1));
}

uint64_t IOUSBInterfaceClass::interfaceGetPipeProperties(IOUSBInterfaceClass *this, void *a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned __int8 *a6, unsigned __int16 *a7, unsigned __int8 *a8)
{
  return (*(uint64_t (**)(void, void *, uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 *, unsigned __int16 *))(**((void **)this + 1) + 264))(*((void *)this + 1), a2, a3, a4, a5, a6, a7);
}

uint64_t IOUSBInterfaceClass::interfaceGetPipeStatus(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 272))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceAbortPipe(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 280))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceResetPipe(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 288))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceClearPipeStall(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *, void))(**((void **)this + 1) + 296))(*((void *)this + 1), a2, 0);
}

uint64_t IOUSBInterfaceClass::interfaceReadPipe(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, unsigned int *a5)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, void, void))(**((void **)this + 1) + 312))(*((void *)this + 1), a2, a3, a4, 0, 0);
}

uint64_t IOUSBInterfaceClass::interfaceWritePipe(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, void, void))(**((void **)this + 1) + 320))(*((void *)this + 1), a2, a3, a4, 0, 0);
}

uint64_t IOUSBInterfaceClass::interfaceReadPipeAsync(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, void, void, uint64_t, void (*)(void *, int, void *)))(**((void **)this + 1) + 328))(*((void *)this + 1), a2, a3, a4, 0, 0, a5, a6);
}

uint64_t IOUSBInterfaceClass::interfaceWritePipeAsync(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, void, void, uint64_t, void (*)(void *, int, void *)))(**((void **)this + 1) + 336))(*((void *)this + 1), a2, a3, a4, 0, 0, a5, a6);
}

uint64_t IOUSBInterfaceClass::interfaceReadIsochPipeAsync(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, IOUSBIsocFrame *a7, void (*a8)(void *, int, void *), void *a9)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, uint64_t, uint64_t, IOUSBIsocFrame *, void (*)(void *, int, void *)))(**((void **)this + 1) + 344))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceWriteIsochPipeAsync(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, IOUSBIsocFrame *a7, void (*a8)(void *, int, void *), void *a9)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, uint64_t, uint64_t, IOUSBIsocFrame *, void (*)(void *, int, void *)))(**((void **)this + 1) + 352))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceControlRequestTO(IOUSBInterfaceClass *this, void *a2, unsigned __int8 a3, IOUSBDevRequestTO *a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 248))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceControlRequestAsyncTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, IOUSBDevRequestTO *a4, void (*a5)(void *, int, void *), void *a6)
{
  return (*(uint64_t (**)(void, void *, uint64_t, IOUSBDevRequestTO *, void (*)(void *, int, void *)))(**((void **)this + 1) + 256))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBInterfaceClass::interfaceReadPipeTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, unsigned int *a5)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, unsigned int *))(**((void **)this + 1) + 312))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBInterfaceClass::interfaceWritePipeTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *))(**((void **)this + 1) + 320))(*((void *)this + 1), a2, a3, a4);
}

uint64_t IOUSBInterfaceClass::interfaceReadPipeAsyncTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void *, int, void *), void *a9)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, void (*)(void *, int, void *)))(**((void **)this + 1) + 328))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceWritePipeAsyncTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(void *, int, void *), void *a9)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, void (*)(void *, int, void *)))(**((void **)this + 1) + 336))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceStringIndex(IOUSBInterfaceClass *this, void *a2, unsigned __int8 *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 424))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceUSBInterfaceOpenSeize(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 1) + 104))(*((void *)this + 1), 1);
}

uint64_t IOUSBInterfaceClass::interfaceClearPipeStallBothEnds(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *, uint64_t))(**((void **)this + 1) + 296))(*((void *)this + 1), a2, 1);
}

uint64_t IOUSBInterfaceClass::interfaceSetPipePolicy(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 304))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetBandwidthAvailable(IOUSBInterfaceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 232))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetEndpointProperties(IOUSBInterfaceClass *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, unsigned __int16 *a7, unsigned __int8 *a8)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t, uint64_t, unsigned __int8 *, unsigned __int16 *))(**((void **)this + 1) + 240))(*((void *)this + 1), a2, a3, a4, a5, a6, a7);
}

uint64_t IOUSBInterfaceClass::interfaceLowLatencyReadIsochPipeAsync(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, IOUSBLowLatencyIsocFrame *a8, void (*a9)(void *, int, void *), void *a10)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, IOUSBLowLatencyIsocFrame *))(**((void **)this + 1) + 360))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceLowLatencyWriteIsochPipeAsync(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, IOUSBLowLatencyIsocFrame *a8, void (*a9)(void *, int, void *), void *a10)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void *, uint64_t, uint64_t, uint64_t, IOUSBLowLatencyIsocFrame *))(**((void **)this + 1) + 368))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceLowLatencyCreateBuffer(IOUSBInterfaceClass *this, void *a2, void **a3)
{
  return (*(uint64_t (**)(void, void *, void **))(**((void **)this + 1) + 376))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceLowLatencyDestroyBuffer(IOUSBInterfaceClass *this, void *a2, void *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 384))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetBusMicroFrameNumber(IOUSBInterfaceClass *this, void *a2, unint64_t *a3, UnsignedWide *a4)
{
  return (*(uint64_t (**)(void, void *, unint64_t *))(**((void **)this + 1) + 392))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceGetFrameListTime(IOUSBInterfaceClass *this, void *a2, unsigned int *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 400))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetIOUSBLibVersion(IOUSBInterfaceClass *this, void *a2, NumVersion *a3, NumVersion *a4)
{
  return (*(uint64_t (**)(void, void *, NumVersion *))(**((void **)this + 1) + 40))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceFindNextAssociatedDescriptor(IOUSBInterfaceClass *this, void *a2, const void *a3)
{
  return (*(uint64_t (**)(void, void *, const void *))(**((void **)this + 1) + 408))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceFindNextAltInterface(IOUSBInterfaceClass *this, void *a2, const void *a3, IOUSBFindInterfaceRequest *a4)
{
  return (*(uint64_t (**)(void, void *, const void *))(**((void **)this + 1) + 416))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceGetBusFrameNumberWithTime(IOUSBInterfaceClass *this, void *a2, unint64_t *a3, UnsignedWide *a4)
{
  return (*(uint64_t (**)(void, void *, unint64_t *))(**((void **)this + 1) + 456))(*((void *)this + 1), a2, a3);
}

uint64_t IOUSBInterfaceClass::interfaceSetIdlePolicy(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 464))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceOverrideIdlePolicy(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 472))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetInterfaceAsyncNotificationPort(IOUSBInterfaceClass *this, void *a2)
{
  return *(void *)(*((void *)this + 1) + 64);
}

uint64_t IOUSBInterfaceClass::interfaceGetPipePropertiesV2(IOUSBInterfaceClass *this, void *a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned __int8 *a6, unsigned __int16 *a7, unsigned __int8 *a8, unsigned __int8 *a9, unsigned __int8 *a10, unsigned __int16 *a11)
{
  return (*(uint64_t (**)(void, void *, uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 *, unsigned __int16 *, unsigned __int8 *))(**((void **)this + 1) + 480))(*((void *)this + 1), a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOUSBInterfaceClass::interfaceGetPipePropertiesV3(IOUSBInterfaceClass *this, void *a2, unsigned __int8 a3, IOUSBEndpointProperties *a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 488))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetEndpointPropertiesV3(IOUSBInterfaceClass *this, void *a2, IOUSBEndpointProperties *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 496))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceSupportsStreams(IOUSBInterfaceClass *this, void *a2, unsigned __int8 a3, unsigned int *a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 504))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceCreateStreams(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 512))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceGetConfiguredStreams(IOUSBInterfaceClass *this, void *a2, unsigned __int8 a3, unsigned int *a4)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 520))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceReadStreamsPipeTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5, unsigned int *a6)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t, void *, unsigned int *))(**((void **)this + 1)
                                                                                             + 528))(*((void *)this + 1), a2, a3, a4, a5, a6);
}

uint64_t IOUSBInterfaceClass::interfaceWriteStreamsPipeTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t, void *))(**((void **)this + 1) + 536))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBInterfaceClass::interfaceReadStreamsPipeAsyncTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5, unsigned int a6, unsigned int a7, unsigned int a8, void (*a9)(void *, int, void *), void *a10)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t, void *))(**((void **)this + 1) + 544))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBInterfaceClass::interfaceWriteStreamsPipeAsyncTO(IOUSBInterfaceClass *this, void *a2, uint64_t a3, uint64_t a4, void *a5, unsigned int a6, unsigned int a7, unsigned int a8, void (*a9)(void *, int, void *), void *a10)
{
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t, void *))(**((void **)this + 1) + 552))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBInterfaceClass::interfaceAbortStreamsPipe(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 560))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceRegisterForNotification(IOUSBInterfaceClass *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5, unint64_t *a6)
{
  return (*(uint64_t (**)(void, void *, uint64_t, void (*)(void *, int, void *, void *), void *))(**((void **)this + 1) + 568))(*((void *)this + 1), a2, a3, a4, a5);
}

uint64_t IOUSBInterfaceClass::interfaceUnregisterNotification(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 576))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceAcknowledgeNotification(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 584))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceRegisterDriver(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 592))();
}

uint64_t IOUSBInterfaceClass::interfaceSetDeviceIdlePolicy(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 600))(*((void *)this + 1), a2);
}

uint64_t IOUSBInterfaceClass::interfaceSetPipeIdlePolicy(IOUSBInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 608))(*((void *)this + 1), a2);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

UInt32 CFBundleGetVersionNumber(CFBundleRef bundle)
{
  return _CFBundleGetVersionNumber(bundle);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallAsyncMethod(connection, selector, wake_port, reference, referenceCnt, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallAsyncScalarMethod(connection, selector, wake_port, reference, referenceCnt, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory64(connect, memoryType, intoTask, atAddress, ofSize, options);
}

kern_return_t IOConnectUnmapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return _IOConnectUnmapMemory64(connect, memoryType, fromTask, atAddress);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return _IONotificationPortGetMachPort(notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t IOServiceGetState()
{
  return _IOServiceGetState();
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return _IOServiceWaitQuiet(service, waitTime);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}