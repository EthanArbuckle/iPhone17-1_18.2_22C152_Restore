uint64_t sub_240780D20(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_240780D30(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_240780D48()
{
  return 1000;
}

void AppleSPUAccCompassPlugin::alloc(AppleSPUAccCompassPlugin *this, const __CFAllocator *a2)
{
  v3 = (AppleSPUAccCompassPlugin *)CFAllocatorAllocate(this, 48, 0);

  AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(v3, this);
}

void AppleSPUAccCompassPlugin::operator delete(CFAllocatorRef *ptr)
{
}

void sub_240780DC0(void *a1)
{
}

void AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(AppleSPUAccCompassPlugin *this, const __CFAllocator *a2)
{
  *(void *)this = &AppleSPUAccCompassPlugin::vtbl;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 3) = 0;
  CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xEu, 0xB5u, 0xD7u, 0x69u, 0x3Du, 0x30u, 0x4Fu, 0x50u, 0x90u, 0xBBu, 0xCDu, 0xF5u, 0x27u, 0xA9u, 0xADu, 0xF3u);
  CFPlugInAddInstanceForFactory(v2);
}

void AppleSPUAccCompassPlugin::~AppleSPUAccCompassPlugin(AppleSPUAccCompassPlugin *this)
{
  os_release((void *)qword_26AFC85D8);
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xEu, 0xB5u, 0xD7u, 0x69u, 0x3Du, 0x30u, 0x4Fu, 0x50u, 0x90u, 0xBBu, 0xCDu, 0xF5u, 0x27u, 0xA9u, 0xADu, 0xF3u);
  CFPlugInRemoveInstanceForFactory(v1);
}

uint64_t AppleSPUAccCompassPlugin::QueryInterface(AppleSPUAccCompassPlugin *this, CFUUIDBytes a2, void **a3)
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

uint64_t AppleSPUAccCompassPlugin::AddRef(AppleSPUAccCompassPlugin *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUAccCompassPlugin::Release(AppleSPUAccCompassPlugin *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUAccCompassPlugin::~AppleSPUAccCompassPlugin(this);
    AppleSPUAccCompassPlugin::operator delete(v3);
  }
  return v2;
}

void AppleSPUAccCompassPlugin::open()
{
  if (qword_26AFC85D0 != -1) {
    dispatch_once(&qword_26AFC85D0, &unk_26F4E4B98);
  }
  operator new();
}

os_log_t sub_240781280()
{
  os_log_t result = os_log_create("AOP", "AppleSPUAccCompassPlugin");
  qword_26AFC85D8 = (uint64_t)result;
  return result;
}

uint64_t AppleSPUAccCompassPlugin::openInterface(uint64_t a1, uint64_t a2)
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
  CFNumberRef IOHIDServiceRegistryID = AppleSPUAccCompassPlugin::getIOHIDServiceRegistryID();
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

uint64_t AppleSPUAccCompassPlugin::checkForBatteryRepair(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int v3 = _hadHadAuthorizedBatteryRepair();
  mach_port_t v4 = qword_26AFC85D8;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v5) {
      return 0;
    }
    LOWORD(v16) = 0;
    CFUUIDRef v9 = "Authorized battery repair check returned False!";
LABEL_11:
    _os_log_impl(&dword_240780000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 2u);
    return 0;
  }
  if (v5)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_240780000, v4, OS_LOG_TYPE_DEFAULT, "Authorized battery repair check returned True!", (uint8_t *)&v16, 2u);
  }
  int BatteryChemID = _getBatteryChemID();
  io_service_t v7 = qword_26AFC85D8;
  if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 67109120;
    LODWORD(v17[0]) = BatteryChemID;
    _os_log_impl(&dword_240780000, v7, OS_LOG_TYPE_DEFAULT, "Got chemID 0x%x", (uint8_t *)&v16, 8u);
  }
  if (BatteryChemID > 6257)
  {
    if ((BatteryChemID - 6258) >= 2)
    {
      int v8 = 14357;
      goto LABEL_20;
    }
  }
  else if ((BatteryChemID - 6176) >= 2)
  {
    int v8 = 6249;
LABEL_20:
    if (BatteryChemID == v8)
    {
      v13 = qword_26AFC85D8;
      if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_240780000, v13, OS_LOG_TYPE_DEFAULT, "Murata batteries detected", (uint8_t *)&v16, 2u);
      }
      int v16 = 217;
      v17[0] = xmmword_240782AE8;
      *(_OWORD *)((char *)v17 + 12) = *(long long *)((char *)&xmmword_240782AE8 + 12);
      uint64_t v14 = *(void *)(a2 + 8);
      if (v14)
      {
        uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v14 + 80))(v14, 4, &v16, 32, 0, 0);
        if (!v10) {
          return v10;
        }
      }
      else
      {
        uint64_t v10 = 3758097112;
      }
      if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_ERROR))
      {
LABEL_33:
        sub_2407826F0();
        return v10;
      }
      return v10;
    }
    mach_port_t v4 = qword_26AFC85D8;
    uint64_t v10 = 0;
    if (!os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT)) {
      return v10;
    }
    LOWORD(v16) = 0;
    CFUUIDRef v9 = "Neither Murata nor ATL/SDI batteries found, ignoring...";
    goto LABEL_11;
  }
  v11 = qword_26AFC85D8;
  if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_240780000, v11, OS_LOG_TYPE_DEFAULT, "SDI/ATL batteries detected", (uint8_t *)&v16, 2u);
  }
  int v16 = 217;
  v17[0] = xmmword_240782B04;
  *(_OWORD *)((char *)v17 + 12) = *(long long *)((char *)&xmmword_240782B04 + 12);
  uint64_t v12 = *(void *)(a2 + 8);
  if (v12)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v12 + 80))(v12, 4, &v16, 32, 0, 0);
    if (!v10) {
      return v10;
    }
  }
  else
  {
    uint64_t v10 = 3758097112;
  }
  if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_ERROR)) {
    goto LABEL_33;
  }
  return v10;
}

uint64_t AppleSPUAccCompassPlugin::setProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = a5 + 4;
  MEMORY[0x270FA5388]();
  int v8 = (_DWORD *)((char *)v13 - ((v7 + 19) & 0xFFFFFFFFFFFFFFF0));
  *int v8 = v9;
  memcpy(v8 + 1, v10, v7);
  uint64_t v11 = *(void *)(a2 + 8);
  if (v11) {
    return (*(uint64_t (**)(uint64_t, uint64_t, _DWORD *, uint64_t, void, void))(*(void *)v11 + 80))(v11, 4, v8, v6, 0, 0);
  }
  else {
    return 3758097112;
  }
}

uint64_t AppleSPUAccCompassPlugin::addAccMatchingNotification(AppleSPUAccCompassPlugin *this)
{
  uint64_t v2 = 3758097115;
  int v21 = 11;
  int valuePtr = 65280;
  int v19 = 1452;
  int v20 = 5016;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *((void *)this + 4) = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v3, 4, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
LABEL_15:
    v17 = (const void *)*((void *)this + 4);
    if (v17) {
      CFRelease(v17);
    }
    return v2;
  }
  CFMutableDictionaryRef v5 = Mutable;
  CFNumberRef v6 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  if (!v6)
  {
LABEL_19:
    CFRelease(v5);
    goto LABEL_15;
  }
  CFNumberRef v7 = v6;
  CFNumberRef v8 = CFNumberCreate(v3, kCFNumberIntType, &v21);
  if (!v8)
  {
    CFRelease(v7);
    goto LABEL_19;
  }
  CFNumberRef v9 = v8;
  CFNumberRef v10 = CFNumberCreate(v3, kCFNumberIntType, &v20);
  if (!v10)
  {
    CFNumberRef v11 = 0;
    goto LABEL_21;
  }
  CFNumberRef v11 = CFNumberCreate(v3, kCFNumberIntType, &v19);
  if (!v11)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = CFDictionaryCreateMutable(v3, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  v13 = v12;
  if (v12)
  {
    CFDictionarySetValue(v12, @"DeviceUsagePage", v7);
    CFDictionarySetValue(v13, @"DeviceUsage", v9);
    CFDictionarySetValue(v5, @"DeviceUsagePairs", v13);
    CFDictionarySetValue(v5, @"ProductID", v10);
    CFDictionarySetValue(v5, @"VendorID", v11);
    IOHIDManagerSetDeviceMatching(*((IOHIDManagerRef *)this + 4), v5);
    IOHIDManagerRegisterDeviceMatchingCallback(*((IOHIDManagerRef *)this + 4), (IOHIDDeviceCallback)AppleSPUAccCompassPlugin::accAddedNotification, this);
    IOHIDManagerRegisterDeviceRemovalCallback(*((IOHIDManagerRef *)this + 4), (IOHIDDeviceCallback)AppleSPUAccCompassPlugin::accRemovalNotification, this);
    uint64_t v14 = (__IOHIDManager *)*((void *)this + 4);
    Main = CFRunLoopGetMain();
    IOHIDManagerScheduleWithRunLoop(v14, Main, (CFStringRef)*MEMORY[0x263EFFE88]);
    uint64_t v2 = 0;
    char v16 = 1;
    goto LABEL_8;
  }
LABEL_22:
  char v16 = 0;
LABEL_8:
  CFRelease(v7);
  CFRelease(v9);
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v13) {
    CFRelease(v13);
  }
  CFRelease(v5);
  if ((v16 & 1) == 0) {
    goto LABEL_15;
  }
  return v2;
}

uint64_t AppleSPUAccCompassPlugin::close(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    uint64_t result = MEMORY[0x2455F8930](result, 0x10B0C4017A8DECDLL);
    *(void *)(a1 + 24) = 0;
  }
  return result;
}

const __CFNumber *AppleSPUAccCompassPlugin::getIOHIDServiceRegistryID()
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

uint64_t AppleSPUAccCompassPlugin::match()
{
  return 1000;
}

__CFDictionary *AppleSPUAccCompassPlugin::copyPropertyForClient(AppleSPUAccCompassPlugin *this, CFTypeRef cf1, const void *a3)
{
  if (!CFEqual(cf1, @"ServiceFilterDebug")) {
    return 0;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"Class", @"AppleSPUAccCompassPlugin");
  return Mutable;
}

uint64_t AppleSPUAccCompassPlugin::filter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void AppleSPUAccCompassPlugin::accAddedNotification(AppleSPUAccCompassPlugin *this, void *a2, int a3, __IOHIDDevice *a4, __IOHIDDevice *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v17 = 0;
  if (this)
  {
    CFNumberRef v7 = qword_26AFC85D8;
    if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v21 = a4;
      _os_log_impl(&dword_240780000, v7, OS_LOG_TYPE_DEFAULT, "Accessory added %p\n", buf, 0xCu);
    }
    CFNumberRef v8 = (AppleSPUAccCompassPlugin *)AppleSPUAccCompassPlugin::verifyAccMatchedDevice(this, a4);
    if (!v8)
    {
      uint64_t v9 = 0;
      for (char i = 1; ; char i = 0)
      {
        char v11 = i;
        uint64_t v12 = (char *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 16 * v9;
        uint64_t AccCompassCompensationElementData = AppleSPUAccCompassPlugin::getAccCompassCompensationElementData(v8, a4, 65302, *((_DWORD *)v12 + 1), buf, &v17);
        if (AccCompassCompensationElementData) {
          return;
        }
        if (AppleSPUAccCompassPlugin::setProperty(AccCompassCompensationElementData, *((void *)this + 3), *((unsigned int *)v12 + 2), (uint64_t)buf, v17))
        {
          if (!os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_ERROR)) {
            return;
          }
          goto LABEL_15;
        }
        buf[0] = 1;
        unint64_t v17 = 1;
        uint64_t v14 = *((void *)this + 3);
        *(_DWORD *)uint64_t v18 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v9 + 3);
        char v19 = 1;
        uint64_t v15 = *(void *)(v14 + 8);
        if (!v15
          || (*(unsigned int (**)(uint64_t, uint64_t, uint8_t *, uint64_t, void, void))(*(void *)v15 + 80))(v15, 4, v18, 5, 0, 0))
        {
          break;
        }
        char v16 = qword_26AFC85D8;
        CFNumberRef v8 = (AppleSPUAccCompassPlugin *)os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl(&dword_240780000, v16, OS_LOG_TYPE_DEFAULT, "Accessory Compass Compensation enabled \n", v18, 2u);
        }
        uint64_t v9 = 1;
        if ((v11 & 1) == 0) {
          return;
        }
      }
      if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_240782724();
    }
  }
}

void AppleSPUAccCompassPlugin::accRemovalNotification(AppleSPUAccCompassPlugin *this, void *a2, int a3, void *a4, __IOHIDDevice *a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (this)
  {
    CFNumberRef v7 = (void *)*((void *)this + 5);
    CFNumberRef v8 = qword_26AFC85D8;
    BOOL v9 = os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT);
    if (v7 == a4)
    {
      if (v9)
      {
        int v19 = 134217984;
        int v20 = a4;
        _os_log_impl(&dword_240780000, v8, OS_LOG_TYPE_DEFAULT, "Accessory detached %p\n", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v10 = 0;
      *((void *)this + 5) = 0;
      char v11 = 1;
      do
      {
        char v12 = v11;
        uint64_t v13 = *((void *)this + 3);
        int v19 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v10 + 3);
        LOBYTE(v20) = 0;
        uint64_t v14 = *(void *)(v13 + 8);
        if (!v14
          || (*(unsigned int (**)(uint64_t, uint64_t, int *, uint64_t, void, void))(*(void *)v14 + 80))(v14, 4, &v19, 5, 0, 0))
        {
          if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_ERROR)) {
            sub_240782654();
          }
          return;
        }
        char v11 = 0;
        uint64_t v10 = 1;
      }
      while ((v12 & 1) != 0);
      uint64_t v15 = qword_26AFC85D8;
      if (!os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      LOWORD(v19) = 0;
      char v16 = "Accessory Compass compensation Disabled \n";
      unint64_t v17 = v15;
      uint32_t v18 = 2;
      goto LABEL_11;
    }
    if (v9)
    {
      int v19 = 134217984;
      int v20 = a4;
      char v16 = "Unexpected Accessory removed %p\n";
      unint64_t v17 = v8;
      uint32_t v18 = 12;
LABEL_11:
      _os_log_impl(&dword_240780000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    }
  }
}

uint64_t AppleSPUAccCompassPlugin::verifyAccMatchedDevice(AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device)
{
  CFAllocatorRef v3 = this;
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = 3758097109;
  if (!*((void *)this + 5)
    || (CFMutableDictionaryRef v5 = qword_26AFC85D8, os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT))
    && (int v12 = 134217984,
        IOHIDDeviceRef v13 = device,
        _os_log_impl(&dword_240780000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected Second Accessory Verified %p", (uint8_t *)&v12, 0xCu), !*((void *)v3 + 5)))
  {
    uint64_t v6 = 0;
    char v7 = 1;
    char v8 = 1;
    do
    {
      char v9 = v7;
      this = (AppleSPUAccCompassPlugin *)AppleSPUAccCompassPlugin::checkForAccCompassCompensationElements(this, device, 65302, *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable+ 4 * v6+ 1));
      char v7 = 0;
      v8 &= this == 0;
      uint64_t v6 = 1;
    }
    while ((v9 & 1) != 0);
    if (v8)
    {
      *((void *)v3 + 5) = device;
      uint64_t v10 = qword_26AFC85D8;
      uint64_t v4 = 0;
      if (os_log_type_enabled((os_log_t)qword_26AFC85D8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134217984;
        IOHIDDeviceRef v13 = device;
        _os_log_impl(&dword_240780000, v10, OS_LOG_TYPE_DEFAULT, "Accessory verified and attached %p\n", (uint8_t *)&v12, 0xCu);
        return 0;
      }
    }
    else
    {
      return 3758097136;
    }
  }
  return v4;
}

uint64_t AppleSPUAccCompassPlugin::checkForAccCompassCompensationElements(AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device, int a3, int a4)
{
  uint64_t v7 = 3758097136;
  if (IOHIDDeviceOpen(device, 0)) {
    return 3758097101;
  }
  CFArrayRef v8 = IOHIDDeviceCopyMatchingElements(device, 0, 0);
  if (v8)
  {
    CFArrayRef v9 = v8;
    if (CFArrayGetCount(v8) >= 1)
    {
      CFIndex v10 = 0;
      while (1)
      {
        ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(v9, v10);
        if (ValueAtIndex)
        {
          int v12 = ValueAtIndex;
          if (IOHIDElementGetUsage(ValueAtIndex) == a4
            && IOHIDElementGetUsagePage(v12) == a3
            && IOHIDElementGetType(v12) == kIOHIDElementTypeFeature)
          {
            break;
          }
        }
        if (CFArrayGetCount(v9) <= ++v10) {
          goto LABEL_10;
        }
      }
      uint64_t v7 = 0;
    }
LABEL_10:
    CFRelease(v9);
  }
  else
  {
    uint64_t v7 = 0;
  }
  IOHIDDeviceClose(device, 0);
  return v7;
}

uint64_t AppleSPUAccCompassPlugin::getAccCompassCompensationElementData(AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device, int a3, int a4, unsigned __int8 *a5, unint64_t *a6)
{
  IOHIDValueRef pValue = 0;
  if (IOHIDDeviceOpen(device, 0)) {
    return 3758097101;
  }
  CFArrayRef v11 = IOHIDDeviceCopyMatchingElements(device, 0, 0);
  if (v11)
  {
    CFArrayRef v12 = v11;
    if (CFArrayGetCount(v11) >= 1)
    {
      CFIndex v13 = 0;
      while (1)
      {
        ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(v12, v13);
        if (ValueAtIndex)
        {
          uint64_t v15 = ValueAtIndex;
          if (IOHIDElementGetUsage(ValueAtIndex) == a4
            && IOHIDElementGetUsagePage(v15) == a3
            && IOHIDElementGetType(v15) == kIOHIDElementTypeFeature)
          {
            break;
          }
        }
        if (CFArrayGetCount(v12) <= ++v13) {
          goto LABEL_10;
        }
      }
      IOHIDDeviceGetValue(device, v15, &pValue);
      if (pValue)
      {
        size_t Length = IOHIDValueGetLength(pValue);
        BytePtr = IOHIDValueGetBytePtr(pValue);
      }
      else
      {
        BytePtr = 0;
        size_t Length = 0;
      }
      *a6 = Length;
      memcpy(a5, BytePtr, Length);
    }
LABEL_10:
    CFRelease(v12);
  }
  IOHIDDeviceClose(device, 0);
  return 0;
}

void AppleSPUAccCompassServicePluginFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (CFEqual(a2, v4))
  {
    CFMutableDictionaryRef v5 = (AppleSPUAccCompassPlugin *)CFAllocatorAllocate(a1, 48, 0);
    AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(v5, a1);
  }
}

uint64_t AppleSPUAccCompassPlugin::performCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
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

uint64_t AppleSPUAccCompassPlugin::getProperty(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
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

void sub_240782570(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void *_hadHadAuthorizedBatteryRepair()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit", 1);
  if (result)
  {
    int v1 = result;
    uint64_t v2 = objc_msgSend(dlsym(result, "OBJC_CLASS_$_CRRepairStatus"), "hasHadAuthorizedRepairForComponent:", 0);
    dlclose(v1);
    return (void *)v2;
  }
  return result;
}

uint64_t _getBatteryChemID()
{
  v0 = dlopen("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit", 1);
  if (!v0) {
    return 0xFFFFFFFFLL;
  }
  int v1 = (void (*)(void))dlsym(v0, "getDeviceChemID");
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = v1();
  uint64_t v3 = [v2 intValue];

  return v3;
}

void sub_240782654()
{
  sub_24078258C();
  sub_240782570(&dword_240780000, v0, v1, "Error disabling compass compensation!", v2, v3, v4, v5, v6);
}

void sub_240782688()
{
  sub_24078258C();
  sub_240782570(&dword_240780000, v0, v1, "Error adding match notification!", v2, v3, v4, v5, v6);
}

void sub_2407826BC()
{
  sub_24078258C();
  sub_240782570(&dword_240780000, v0, v1, "Error connecting to compass service!", v2, v3, v4, v5, v6);
}

void sub_2407826F0()
{
  sub_24078258C();
  sub_240782570(&dword_240780000, v0, v1, "Error updating CBCC values!", v2, v3, v4, v5, v6);
}

void sub_240782724()
{
  sub_24078258C();
  sub_240782570(&dword_240780000, v0, v1, "Error enabling compass compensation!", v2, v3, v4, v5, v6);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
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

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
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

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF4050](device, *(void *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x270EF4060](device, matching, *(void *)&options);
}

IOReturn IOHIDDeviceGetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue)
{
  return MEMORY[0x270EF4098](device, element, pValue);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x270EF40A0](device, *(void *)&options);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x270EF4180](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A0](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A8](element);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x270EF4540](allocator, *(void *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x270EF4758](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x270EF4770](value);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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