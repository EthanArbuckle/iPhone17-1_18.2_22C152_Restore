void HidPluginIUnknown::factoryAddRef(HidPluginIUnknown *this)
{
  CFUUIDRef v2;
  uint64_t vars8;

  if (!HidPluginIUnknown::factoryRefCount++)
  {
    v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xCAu, 0x3Au, 0x28u, 0xBDu, 0x6Au, 0x7Au, 0x40u, 0xCBu, 0x92u, 0x7Cu, 0xFAu, 0x67u, 0x17u, 0x70u, 0xD4u, 8u);
    CFPlugInAddInstanceForFactory(v2);
  }
}

void HidPluginIUnknown::factoryRelease(HidPluginIUnknown *this)
{
  int v1 = HidPluginIUnknown::factoryRefCount--;
  if (HidPluginIUnknown::factoryRefCount)
  {
    if (v1 <= 0) {
      HidPluginIUnknown::factoryRefCount = 0;
    }
  }
  else
  {
    CFUUIDRef v2 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xCAu, 0x3Au, 0x28u, 0xBDu, 0x6Au, 0x7Au, 0x40u, 0xCBu, 0x92u, 0x7Cu, 0xFAu, 0x67u, 0x17u, 0x70u, 0xD4u, 8u);
    CFPlugInRemoveInstanceForFactory(v2);
  }
}

void HidPluginIUnknown::HidPluginIUnknown(HidPluginIUnknown *this, void *a2)
{
  *(void *)this = off_144F8;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = this;
  HidPluginIUnknown::factoryAddRef(this);
}

void HidPluginIUnknown::~HidPluginIUnknown(HidPluginIUnknown *this)
{
  *(void *)this = off_144F8;
  HidPluginIUnknown::factoryRelease(this);
}

void sub_3F6C(void *a1)
{
}

uint64_t HidPluginIUnknown::addRef(HidPluginIUnknown *this)
{
  uint64_t v1 = (*((_DWORD *)this + 2) + 1);
  *((_DWORD *)this + 2) = v1;
  return v1;
}

uint64_t HidPluginIUnknown::release(HidPluginIUnknown *this)
{
  int v1 = *((_DWORD *)this + 2);
  uint64_t v2 = (v1 - 1);
  if (v1 == 1)
  {
    *((_DWORD *)this + 2) = 0;
    (*(void (**)(HidPluginIUnknown *))(*(void *)this + 8))(this);
  }
  else
  {
    *((_DWORD *)this + 2) = v2;
  }
  return v2;
}

uint64_t HidPluginIUnknown::genericQueryInterface(HidPluginIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(void, void *, void, void))(**((void **)this + 1) + 16))(*((void *)this + 1), a2, *(void *)&a3.byte0, *(void *)&a3.byte8);
}

uint64_t HidPluginIUnknown::genericAddRef(HidPluginIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 24))();
}

uint64_t HidPluginIUnknown::genericRelease(HidPluginIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 32))();
}

os_log_t init_default_corebrightness_log()
{
  os_log_t v0 = os_log_create("com.apple.CoreBrightness", "default");
  _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)v0;
  if (!v0)
  {
    os_log_t v0 = (os_log_t)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_F7B0();
    }
    _COREBRIGHTNESS_LOG_DEFAULT = (uint64_t)&_os_log_default;
  }
  return v0;
}

void DisplayPowerCallback(void *a1, unsigned int a2, int a3, void *a4)
{
  if (a1)
  {
    if (a4) {
      unint64_t v5 = a4[2];
    }
    else {
      unint64_t v5 = 0;
    }
    if (a3 == -536870352)
    {
      inited = a1[7];
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
        sub_F860();
      }
      *((unsigned char *)a1 + 248) = 0;
      int v7 = 1;
      if (!*((unsigned char *)a1 + 251)) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    if (a3 == -536870384)
    {
      v6 = a1[7];
      if (!v6)
      {
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v6 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_F7F8();
      }
      if (v5 <= 2)
      {
        int v7 = 0;
        *((unsigned char *)a1 + 248) = 1;
LABEL_20:
        AppleUSBALS::displayStateUpdate((AppleUSBALS *)a1, v7);
LABEL_21:
        *((unsigned char *)a1 + 250) = v7;
      }
    }
  }
}

void AppleUSBALS::displayStateUpdate(AppleUSBALS *this, int a2)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
  {
    int v5 = *((unsigned __int8 *)this + 249);
    int v6 = *((unsigned __int8 *)this + 288);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = a2;
    LOWORD(cf) = 1024;
    *(_DWORD *)((char *)&cf + 2) = v5;
    HIWORD(cf) = 1024;
    int v18 = v6;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "on=%d _currentDisp=%d _clamshellOpen=%d", buf, 0x14u);
  }
  if (*((unsigned __int8 *)this + 249) != a2 && (*((unsigned char *)this + 288) || (a2 & 1) == 0))
  {
    float v7 = 0.0;
    if (a2) {
      float v7 = 1.0;
    }
    float valuePtr = v7;
    int v13 = 1056964608;
    CFNumberRef v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, &valuePtr);
    CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, &v13);
    *(void *)buf = v8;
    CFTypeRef cf = v9;
    *(_OWORD *)keys = *(_OWORD *)off_14670;
    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      CFDictionaryRef v11 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)buf, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v11)
      {
        CFDictionaryRef v12 = v11;
        if ((*(unsigned int (**)(AppleUSBALS *, const __CFString *, CFDictionaryRef))(*(void *)this + 88))(this, @"DFRDisplayFactor", v11))
        {
          *((unsigned char *)this + 249) = a2;
        }
        CFRelease(v12);
      }
    }
    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

void clamshellStateCallback(void *a1, io_registry_entry_t a2, int a3, void *a4)
{
  inited = a1[7];
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_F8FC();
  }
  if (a3 == -536657664)
  {
    CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a2, @"AppleClamshellState", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFBooleanRef v9 = CFProperty;
      BOOL v10 = a1[7];
      *((unsigned char *)a1 + 288) = CFProperty == kCFBooleanFalse;
      if (CFProperty == kCFBooleanFalse)
      {
        if (!v10)
        {
          BOOL v10 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            BOOL v10 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_F894();
        }
        if (*((unsigned char *)a1 + 248)) {
          goto LABEL_21;
        }
      }
      else
      {
        if (!v10)
        {
          BOOL v10 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            BOOL v10 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_F8C8();
        }
      }
      AppleUSBALS::displayStateUpdate((AppleUSBALS *)a1, v9 == kCFBooleanFalse);
LABEL_21:
      CFRelease(v9);
    }
  }
}

void DisplayWranglerArrival(void *a1, io_iterator_t a2)
{
  if (a1)
  {
    inited = a1[7];
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[32];
      int v10 = 136315650;
      if (v5) {
        int v6 = "valid";
      }
      else {
        int v6 = "invalid";
      }
      CFDictionaryRef v11 = v6;
      __int16 v12 = 2048;
      int v13 = a1;
      __int16 v14 = 1024;
      io_iterator_t v15 = a2;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "display wrangler published notification (current %s, refcon=%p, iterator=0x%X)", (uint8_t *)&v10, 0x1Cu);
    }
    if (a2 && !a1[32])
    {
      io_service_t v7 = IOIteratorNext(a2);
      if (v7)
      {
        io_object_t v8 = v7;
        BOOL v9 = AppleUSBALS::initializeDisplayPowerMonitoring((AppleUSBALS *)a1, v7);
        IOObjectRelease(v8);
        *((unsigned char *)a1 + 248) = !v9;
        *((unsigned char *)a1 + 249) = !v9;
        AppleUSBALS::displayStateUpdate((AppleUSBALS *)a1, v9);
      }
    }
  }
}

BOOL AppleUSBALS::initializeDisplayPowerMonitoring(AppleUSBALS *this, io_service_t a2)
{
  v4 = IONotificationPortCreate(kIOMasterPortDefault);
  *((void *)this + 32) = v4;
  if (v4
    && !IOServiceAddInterestNotification(v4, a2, "IOGeneralInterest", (IOServiceInterestCallback)DisplayPowerCallback, this, (io_object_t *)this + 63))
  {
    IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 32), *((dispatch_queue_t *)this + 8));
  }
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_F964((uint64_t)this, (uint64_t *)this + 32, inited);
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a2, @"IOPowerManagement", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    io_service_t v7 = CFProperty;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v7)
      && (CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v7, @"CurrentPowerState")) != 0)
    {
      CFNumberRef v10 = Value;
      CFTypeID v11 = CFNumberGetTypeID();
      int v12 = 4;
      if (v11 == CFGetTypeID(v10))
      {
        v15[0] = 0;
        if (CFNumberGetValue(v10, kCFNumberIntType, v15)) {
          int v12 = v15[0];
        }
        else {
          int v12 = 4;
        }
      }
    }
    else
    {
      int v12 = 4;
    }
    CFRelease(v7);
  }
  else
  {
    int v12 = 4;
  }
  int v13 = *((void *)this + 7);
  if (!v13)
  {
    int v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      int v13 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v12;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "initial power state %d", (uint8_t *)v15, 8u);
  }
  return v12 > 2;
}

void SystemPowerStateUpdateCallback(void *a1, unsigned int a2, int a3, intptr_t notificationID)
{
  if (a1)
  {
    switch(a3)
    {
      case -536870144:
        inited = *((void *)a1 + 7);
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CFNumberRef v10 = 0;
          _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "system has powered on", v10, 2u);
        }
        AppleUSBALS::systemPowerStateUpdate((NSObject **)a1, 1);
        break;
      case -536870272:
        BOOL v9 = *((void *)a1 + 7);
        if (!v9)
        {
          BOOL v9 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            BOOL v9 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "system will go to sleep", buf, 2u);
        }
        AppleUSBALS::systemPowerStateUpdate((NSObject **)a1, 0);
        IOAllowPowerChange(*((_DWORD *)a1 + 79), notificationID);
        break;
      case -536870288:
        io_connect_t v6 = *((_DWORD *)a1 + 79);
        IOAllowPowerChange(v6, notificationID);
        break;
    }
  }
  else
  {
    io_service_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      io_service_t v7 = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_F9F4();
    }
  }
}

void AppleUSBALS::systemPowerStateUpdate(NSObject **this, int a2)
{
  if (*((unsigned __int8 *)this + 320) != a2)
  {
    char v2 = a2;
    if (a2)
    {
      AppleUSBALS::turnOnDevice(this);
      inited = this[7];
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (!os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v8 = 0;
      uint64_t v5 = "system wake - device turned on";
      io_connect_t v6 = (uint8_t *)&v8;
    }
    else
    {
      AppleUSBALS::turnOffDevice(this);
      inited = this[7];
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (!os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v7 = 0;
      uint64_t v5 = "system sleep - device turned off";
      io_connect_t v6 = (uint8_t *)&v7;
    }
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
LABEL_14:
    *((unsigned char *)this + 320) = v2;
  }
}

void handleExtHIDDeviceEventCallback(void *a1, int a2, void *a3, IOHIDValueRef value)
{
  if (a2) {
    return;
  }
  if (!a1) {
    return;
  }
  if (!value) {
    return;
  }
  Element = IOHIDValueGetElement(value);
  if (!Element) {
    return;
  }
  __int16 v7 = Element;
  uint32_t UsagePage = IOHIDElementGetUsagePage(Element);
  uint32_t Usage = IOHIDElementGetUsage(v7);
  inited = a1[7];
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FA90();
  }
  if (UsagePage != 65298)
  {
    if (UsagePage == 32 && Usage - 1233 <= 4 && Usage != 1235)
    {
      uint64_t TimeStamp = IOHIDValueGetTimeStamp(value);
      uint64_t v12 = TimeStamp;
      if (TimeStamp == a1[46])
      {
        int v13 = a1[7];
        if (!v13)
        {
          int v13 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            int v13 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_FA28();
        }
      }
      else
      {
        a1[46] = TimeStamp;
        v16 = a1[8];
        if (v16)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 0x40000000;
          v17[2] = sub_4DB8;
          v17[3] = &unk_14530;
          v17[4] = a1;
          v17[5] = v12;
          dispatch_async(v16, v17);
        }
      }
    }
    return;
  }
  if (Usage == 81)
  {
    __int16 v14 = a1[7];
    if (!v14)
    {
      __int16 v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        __int16 v14 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      IntegerCFNumberRef Value = IOHIDValueGetIntegerValue(value);
      io_iterator_t v15 = "burnin count update -> %ld";
      goto LABEL_34;
    }
  }
  else if (Usage == 49)
  {
    __int16 v14 = a1[7];
    if (!v14)
    {
      __int16 v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        __int16 v14 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      IntegerCFNumberRef Value = IOHIDValueGetIntegerValue(value);
      io_iterator_t v15 = "display state update -> %ld";
LABEL_34:
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, v15, buf, 0xCu);
    }
  }
}

void sub_4DB8(uint64_t a1)
{
  double v24 = 0.0;
  double v25 = 0.0;
  double v22 = 0.0;
  double v23 = 0.0;
  pCFNumberRef Value = 0;
  Element = AppleUSBALS::getElement(*(AppleUSBALS **)(a1 + 32), 32, 1233, kIOHIDElementTypeInput_Misc);
  if (Element)
  {
    if (!IOHIDDeviceGetValue(*(IOHIDDeviceRef *)(*(void *)(a1 + 32) + 144), Element, &pValue) && pValue != 0) {
      AppleUSBALS::retrieveScaledValue(*(AppleUSBALS **)(a1 + 32), pValue, &v23);
    }
  }
  pCFNumberRef Value = 0;
  v4 = *(AppleUSBALS **)(a1 + 32);
  double v5 = 0.0;
  if (*((unsigned char *)v4 + 82))
  {
    io_connect_t v6 = AppleUSBALS::getElement(v4, 32, 1236, kIOHIDElementTypeInput_Misc);
    if (v6)
    {
      if (!IOHIDDeviceGetValue(*(IOHIDDeviceRef *)(*(void *)(a1 + 32) + 144), v6, &pValue) && pValue != 0) {
        AppleUSBALS::retrieveScaledValue(*(AppleUSBALS **)(a1 + 32), pValue, &v25);
      }
    }
    pCFNumberRef Value = 0;
    __int16 v8 = AppleUSBALS::getElement(*(AppleUSBALS **)(a1 + 32), 32, 1237, kIOHIDElementTypeInput_Misc);
    if (v8)
    {
      if (!IOHIDDeviceGetValue(*(IOHIDDeviceRef *)(*(void *)(a1 + 32) + 144), v8, &pValue) && pValue != 0) {
        AppleUSBALS::retrieveScaledValue(*(AppleUSBALS **)(a1 + 32), pValue, &v24);
      }
    }
    pCFNumberRef Value = 0;
    CFNumberRef v10 = AppleUSBALS::getElement(*(AppleUSBALS **)(a1 + 32), 32, 1234, kIOHIDElementTypeInput_Misc);
    if (v10 && !IOHIDDeviceGetValue(*(IOHIDDeviceRef *)(*(void *)(a1 + 32) + 144), v10, &pValue) && pValue) {
      AppleUSBALS::retrieveScaledValue(*(AppleUSBALS **)(a1 + 32), pValue, &v22);
    }
    inited = *(NSObject **)(*(void *)(a1 + 32) + 56);
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
    {
      double v13 = v24;
      double v12 = v25;
      double v14 = v23;
      *(_DWORD *)buf = 134218752;
      double v27 = v25;
      __int16 v28 = 2048;
      double v29 = v24;
      __int16 v30 = 2048;
      double v31 = v22;
      __int16 v32 = 2048;
      double v33 = v23;
      _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "x=%f y=%f CCT=%f lux=%f", buf, 0x2Au);
      double v15 = v14;
      double v16 = v12;
      double v17 = v13;
    }
    else
    {
      double v15 = v23;
      double v17 = v24;
      double v16 = v25;
    }
    if (v16 != 0.0 && v17 != 0.0)
    {
      double v5 = v15 * (v16 / v17);
      double v18 = v15 * ((1.0 - v16 - v17) / v17);
      goto LABEL_35;
    }
  }
  else
  {
    double v15 = 0.0;
  }
  double v18 = 0.0;
LABEL_35:
  uint64_t v19 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v19 + 408))
  {
    if (*(unsigned char *)(v19 + 82) && *(unsigned char *)(v19 + 409))
    {
      double v5 = *(double *)(v19 + 416);
      double v15 = *(double *)(v19 + 424);
      double v18 = *(double *)(v19 + 432);
      double v22 = *(double *)(v19 + 440);
    }
    v20 = &v23;
    if (*(unsigned char *)(v19 + 392)) {
      v20 = (double *)(v19 + 400);
    }
    AppleUSBALS::dispatchAmbientLightSensorEvent((AppleUSBALS *)v19, *v20, v5, v15, v18, v22);
  }
}

__IOHIDElement *AppleUSBALS::getElement(AppleUSBALS *this, int a2, int a3, IOHIDElementType a4)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 67109632;
    int v19 = a3;
    __int16 v20 = 1024;
    int v21 = a2;
    __int16 v22 = 1024;
    IOHIDElementType v23 = a4;
    _os_log_debug_impl(&dword_0, inited, OS_LOG_TYPE_DEBUG, "look up element: usage=0x%X page=0x%X type=%d", (uint8_t *)&v18, 0x14u);
  }
  CFArrayRef v9 = (const __CFArray *)*((void *)this + 28);
  if (!v9 || CFArrayGetCount(v9) < 1) {
    return 0;
  }
  CFIndex v10 = 0;
  while (1)
  {
    ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 28), v10);
    if (ValueAtIndex)
    {
      double v12 = ValueAtIndex;
      CFTypeID v13 = CFGetTypeID(ValueAtIndex);
      if (v13 == IOHIDElementGetTypeID()
        && IOHIDElementGetUsage(v12) == a3
        && IOHIDElementGetUsagePage(v12) == a2
        && IOHIDElementGetType(v12) == a4)
      {
        break;
      }
    }
    if (CFArrayGetCount(*((CFArrayRef *)this + 28)) <= ++v10) {
      return 0;
    }
  }
  double v15 = *((void *)this + 7);
  if (!v15)
  {
    double v15 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      double v15 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    IOHIDElementCookie Cookie = IOHIDElementGetCookie(v12);
    IOHIDElementType Type = IOHIDElementGetType(v12);
    int v18 = 67109888;
    int v19 = a2;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 1024;
    IOHIDElementType v23 = Cookie;
    __int16 v24 = 1024;
    IOHIDElementType v25 = Type;
    _os_log_debug_impl(&dword_0, v15, OS_LOG_TYPE_DEBUG, "found element p=0x%X u=0x%X cookie=%u type=%d", (uint8_t *)&v18, 0x1Au);
  }
  return v12;
}

BOOL AppleUSBALS::retrieveScaledValue(AppleUSBALS *this, IOHIDValueRef value, double *a3)
{
  if (value)
  {
    Element = IOHIDValueGetElement(value);
    if (Element)
    {
      __int16 v7 = Element;
      CFIndex LogicalMax = IOHIDElementGetLogicalMax(Element);
      CFIndex LogicalMin = IOHIDElementGetLogicalMin(v7);
      CFIndex PhysicalMax = IOHIDElementGetPhysicalMax(v7);
      CFIndex PhysicalMin = IOHIDElementGetPhysicalMin(v7);
      uint32_t UnitExponent = IOHIDElementGetUnitExponent(v7);
      if (PhysicalMax == PhysicalMin)
      {
        inited = *((void *)this + 7);
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        BOOL result = os_log_type_enabled(inited, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_FB7C();
          return 0;
        }
      }
      else
      {
        double ScaledValueWithExponent = AppleUSBALS::getScaledValueWithExponent(this, (double)(LogicalMax - LogicalMin) / (double)(PhysicalMax - PhysicalMin), UnitExponent);
        *a3 = (double)(IOHIDValueGetIntegerValue(value) - LogicalMin) / ScaledValueWithExponent + (double)PhysicalMin;
        int v18 = *((void *)this + 7);
        if (!v18)
        {
          int v18 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            int v18 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          IntegerCFNumberRef Value = IOHIDValueGetIntegerValue(value);
          uint64_t v20 = *(void *)a3;
          int v21 = 134219520;
          CFIndex v22 = LogicalMax;
          __int16 v23 = 2048;
          CFIndex v24 = LogicalMin;
          __int16 v25 = 2048;
          CFIndex v26 = PhysicalMax;
          __int16 v27 = 2048;
          CFIndex v28 = PhysicalMin;
          __int16 v29 = 2048;
          double v30 = ScaledValueWithExponent;
          __int16 v31 = 2048;
          CFIndex v32 = IntegerValue - LogicalMin;
          __int16 v33 = 2048;
          uint64_t v34 = v20;
          _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "lMax=%lu lMin=%lu pMax=%lu pMin=%lu -> factor=%f | value=%lu -> scaled=%f", (uint8_t *)&v21, 0x48u);
        }
        return 1;
      }
    }
    else
    {
      double v16 = *((void *)this + 7);
      if (!v16)
      {
        double v16 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v16 = init_default_corebrightness_log();
        }
      }
      BOOL result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_FB48();
        return 0;
      }
    }
  }
  else
  {
    double v15 = *((void *)this + 7);
    if (!v15)
    {
      double v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        double v15 = init_default_corebrightness_log();
      }
    }
    BOOL result = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_FB14();
      return 0;
    }
  }
  return result;
}

void AppleUSBALS::dispatchAmbientLightSensorEvent(AppleUSBALS *this, double a2, double a3, double a4, double a5, double a6)
{
  AppleUSBALS::updateCurrentAmbient(this, a2);
  AppleUSBALS::updateCurrentColourInfo(this, a3, a4, a5, a6);
  if (*((void *)this + 14))
  {
    uint64_t AmbientLightSensorEvent = IOHIDEventCreateAmbientLightSensorEvent();
    if (AmbientLightSensorEvent)
    {
      double v12 = (const void *)AmbientLightSensorEvent;
      IOHIDEventSetDoubleValue();
      if (*((unsigned char *)this + 82))
      {
        IOHIDEventSetIntegerValue();
        IOHIDEventSetDoubleValue();
        IOHIDEventSetDoubleValue();
        IOHIDEventSetDoubleValue();
        IOHIDEventSetDoubleValue();
      }
      (*((void (**)(void, void, AppleUSBALS *, const void *, void))this + 14))(*((void *)this + 15), *((void *)this + 16), this, v12, 0);
      CFRelease(v12);
    }
  }
}

void handleExtHIDDeviceRemovalCallback(void *a1, int a2, void *a3)
{
  inited = a1[7];
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
}

uint64_t IOHIDPlugInFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 5u, 0x16u, 0xB5u, 0x63u, 0xB1u, 0x5Bu, 0x11u, 0xDAu, 0x96u, 0xEBu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  v4 = (AppleUSBALS *)CFEqual(a2, v3);
  if (v4)
  {
    AppleUSBALS::alloc(v4);
  }
  return 0;
}

void AppleUSBALS::alloc(AppleUSBALS *this)
{
}

void sub_57A8()
{
}

uint64_t AppleUSBALS::_probe(AppleUSBALS *this, void *a2, const __CFDictionary *a3, unsigned int a4, int *a5)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 40))(*((void *)this + 1), a2, a3);
}

uint64_t AppleUSBALS::_start(AppleUSBALS *this, void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(void, void *, const __CFDictionary *))(**((void **)this + 1) + 48))(*((void *)this + 1), a2, a3);
}

uint64_t AppleUSBALS::_stop(AppleUSBALS *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 56))();
}

uint64_t AppleUSBALS::_open(AppleUSBALS *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 64))(*((void *)this + 1), a2);
}

uint64_t AppleUSBALS::_close(AppleUSBALS *this, void *a2)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 72))(*((void *)this + 1), a2);
}

uint64_t AppleUSBALS::_copyProperty(AppleUSBALS *this, void *a2, const __CFString *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 80))(*((void *)this + 1), a2);
}

uint64_t AppleUSBALS::_setProperty(AppleUSBALS *this, void *a2, const __CFString *a3, const void *a4)
{
  return (*(uint64_t (**)(void, void *, const __CFString *))(**((void **)this + 1) + 88))(*((void *)this + 1), a2, a3);
}

uint64_t AppleUSBALS::_setEventCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 96))();
}

uint64_t AppleUSBALS::_scheduleWithDispatchQueue(AppleUSBALS *this, void *a2, dispatch_queue_s *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 104))(*((void *)this + 1), a2);
}

uint64_t AppleUSBALS::_unscheduleFromDispatchQueue(AppleUSBALS *this, void *a2, dispatch_queue_s *a3)
{
  return (*(uint64_t (**)(void, void *))(**((void **)this + 1) + 112))(*((void *)this + 1), a2);
}

uint64_t AppleUSBALS::_copyEvent(uint64_t a1, int a2)
{
  return AppleUSBALS::copyEvent(*(AppleUSBALS **)(a1 + 8), a2);
}

uint64_t AppleUSBALS::_setOutputEvent()
{
  return 3758097095;
}

void AppleUSBALS::AppleUSBALS(AppleUSBALS *this)
{
  HidPluginIUnknown::HidPluginIUnknown(this, &AppleUSBALS::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v2 = off_14560;
  *(_DWORD *)(v2 + 48) = 0;
  *(unsigned char *)(v2 + 84) = 0;
  *(void *)(v2 + 88) = 0;
  *(_DWORD *)(v2 + 96) = 0;
  *(void *)(v2 + 224) = 0;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(_DWORD *)(v2 + 79) = 0;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_DWORD *)(v2 + 232) = 1;
  *(_DWORD *)(v2 + 248) = 16843008;
  *(_DWORD *)(v2 + 284) = 0;
  *(_OWORD *)(v2 + 252) = 0u;
  *(_OWORD *)(v2 + 268) = 0u;
  *(unsigned char *)(v2 + 288) = 1;
  *(void *)(v2 + 304) = 0;
  *(void *)(v2 + 312) = 0;
  *(void *)(v2 + 296) = 0;
  *(unsigned char *)(v2 + 320) = 1;
  *(_DWORD *)(v2 + 324) = -1;
  *(void *)(v2 + 328) = 0x4072C00000000000;
  *(void *)(v2 + 400) = 0;
  *(_WORD *)(v2 + 408) = 0;
  *(void *)(v2 + 376) = 0;
  *(void *)(v2 + 384) = 0;
  *(void *)(v2 + 368) = 0;
  *(unsigned char *)(v2 + 392) = 0;
  *(_OWORD *)(v2 + 416) = 0u;
  *(_OWORD *)(v2 + 432) = 0u;
  *(void *)(v2 + 32) = &AppleUSBALS::sIOHIDServiceInterface;
  *(void *)(v2 + 40) = v2;
  *(_DWORD *)(v2 + 136) = 0;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_OWORD *)(v2 + 192) = 0u;
  *(_OWORD *)(v2 + 208) = 0u;
  inited = os_log_create("com.apple.CoreBrightness.AppleUSBALS", "default");
  *((void *)this + 7) = inited;
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
  notify_register_check("com.apple.DFRBrightness.displayStateUpdate", (int *)this + 81);
  *((void *)this + 30) = CFDictionaryCreateMutable(kCFAllocatorDefault, 10, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  AppleUSBALS::setDefaultProperties((NSObject **)this);
}

void sub_5B00(_Unwind_Exception *a1)
{
  std::thread::~thread(v1 + 47);
  HidPluginIUnknown::~HidPluginIUnknown((HidPluginIUnknown *)v1);
  _Unwind_Resume(a1);
}

void AppleUSBALS::setDefaultProperties(NSObject **this)
{
  CFDictionaryRef v2 = (const __CFDictionary *)IOHIDPreferencesCopyMultiple();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    AppleUSBALS::setKeyboardPreferences(this, v2, 0);
    AppleUSBALS::setDisplayPreferences(this, v3, 0);
    CFRelease(v3);
  }
}

void AppleUSBALS::~AppleUSBALS(AppleUSBALS *this)
{
  *(void *)this = off_14560;
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
  if (notify_is_valid_token(*((_DWORD *)this + 81)))
  {
    notify_cancel(*((_DWORD *)this + 81));
    *((_DWORD *)this + 81) = -1;
  }
  io_object_t v3 = *((_DWORD *)this + 12);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 12) = 0;
  }
  v4 = (void *)*((void *)this + 7);
  if (v4)
  {
    os_release(v4);
    *((void *)this + 7) = 0;
  }
  double v5 = (const void *)*((void *)this + 30);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 30) = 0;
  }
  io_connect_t v6 = *((void *)this + 48);
  if (v6)
  {
    dispatch_release(v6);
    *((void *)this + 48) = 0;
  }
  std::thread::~thread((std::thread *)this + 47);
  HidPluginIUnknown::~HidPluginIUnknown(this);
}

{
  uint64_t vars8;

  AppleUSBALS::~AppleUSBALS(this);

  operator delete();
}

uint64_t AppleUSBALS::copyEvent(AppleUSBALS *this, int a2)
{
  uint64_t v2 = 0;
  if (a2 != 12 || !*((unsigned char *)this + 84)) {
    return v2;
  }
  if (!AppleUSBALS::updateCurrentAmbientLightValues((IOHIDDeviceRef *)this))
  {
    inited = *((void *)this + 7);
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_FC18();
    }
    return 0;
  }
  mach_absolute_time();
  uint64_t AmbientLightSensorEvent = IOHIDEventCreateAmbientLightSensorEvent();
  if (!AmbientLightSensorEvent)
  {
    io_connect_t v6 = *((void *)this + 7);
    if (!v6)
    {
      io_connect_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        io_connect_t v6 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_FBE4();
    }
    return 0;
  }
  uint64_t v2 = AmbientLightSensorEvent;
  IOHIDEventSetDoubleValue();
  if (*((unsigned char *)this + 82))
  {
    IOHIDEventSetIntegerValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
    IOHIDEventSetDoubleValue();
  }
  return v2;
}

uint64_t AppleUSBALS::setOutputEvent()
{
  return 3758097095;
}

uint64_t AppleUSBALS::getHIDService(AppleUSBALS *this)
{
  return (uint64_t)this + 32;
}

uint64_t AppleUSBALS::queryInterface(AppleUSBALS *this, CFUUIDBytes a2, void **a3)
{
  uint64_t v4 = *(void *)&a2.byte8;
  uint64_t v5 = *(void *)&a2.byte0;
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
  *(void *)&v16.byte0 = v5;
  *(void *)&v16.byte8 = v4;
  CFUUIDRef v8 = CFUUIDCreateFromUUIDBytes(0, v16);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v8, v9)
    || (CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v8, v10)))
  {
    CFTypeID v11 = (char *)this + 16;
    uint64_t v12 = *(void *)this;
LABEL_9:
    *a3 = v11;
    (*(void (**)(AppleUSBALS *))(v12 + 24))(this);
    goto LABEL_10;
  }
  CFUUIDRef v15 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x6Fu, 0xE2u, 0x2Au, 0xBFu, 0x68u, 0xB9u, 0x11u, 0xDBu, 0xA7u, 0x1Fu, 0, 0x16u, 0xCBu, 0xC1u, 0x10u, 0xF7u);
  if (CFEqual(v8, v15))
  {
    CFTypeID v11 = (char *)this + 32;
    uint64_t v12 = *(void *)this;
    goto LABEL_9;
  }
  *a3 = 0;
LABEL_10:
  if (*a3) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = 2147483652;
  }
  CFRelease(v8);
  return v13;
}

uint64_t AppleUSBALS::probe(AppleUSBALS *this, const __CFDictionary *a2, io_registry_entry_t entry, int *a4)
{
  if (entry)
  {
    CFTypeRef v5 = IORegistryEntrySearchCFProperty(entry, "IOService", @"VersionNumber", kCFAllocatorDefault, 3u);
    if (v5)
    {
      io_connect_t v6 = v5;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        CFUUIDRef v8 = (int *)((char *)this + 88);
        if (CFNumberGetValue((CFNumberRef)v6, kCFNumberIntType, (char *)this + 88))
        {
          inited = *((void *)this + 7);
          if (!inited)
          {
            inited = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              inited = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = *v8;
            v22[0] = 67109120;
            v22[1] = v10;
            _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "device version: 0x%X", (uint8_t *)v22, 8u);
          }
          CFRelease(v6);
          return 0;
        }
      }
      CFRelease(v6);
    }
    else
    {
      uint64_t v12 = *((void *)this + 7);
      if (!v12)
      {
        uint64_t v12 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v12 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_FCC4();
      }
    }
  }
  uint64_t v13 = *((void *)this + 7);
  if (!v13)
  {
    uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v13 = init_default_corebrightness_log();
    }
  }
  uint64_t v11 = 3758097090;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_FC4C(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  return v11;
}

uint64_t AppleUSBALS::start(AppleUSBALS *this, const __CFDictionary *a2, io_object_t object)
{
  if (!object) {
    return 3758096385;
  }
  *((_DWORD *)this + 12) = object;
  IOObjectRetain(object);
  uint64_t entryID = 0;
  if (!IORegistryEntryGetRegistryEntryID(object, &entryID))
  {
    CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"0x%llX", entryID);
    if (v5)
    {
      CFStringRef v6 = v5;
      __int16 v7 = (void *)*((void *)this + 7);
      if (v7) {
        os_release(v7);
      }
      CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
      if (!CStringPtr)
      {
        if (CFStringGetCString(v6, buffer, 64, 0x600u)) {
          CStringPtr = buffer;
        }
        else {
          CStringPtr = 0;
        }
      }
      *((void *)this + 7) = os_log_create("com.apple.CoreBrightness.AppleUSBALS", CStringPtr);
      CFRelease(v6);
    }
  }
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 67109376;
    *(_DWORD *)&buffer[4] = object;
    *(_WORD *)&buffer[8] = 2048;
    *(void *)&buffer[10] = entryID;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "service=0x%X 0x%llX", buffer, 0x12u);
  }
  CFTypeRef v10 = IORegistryEntrySearchCFProperty(object, "IOService", @"DeviceUsagePairs", kCFAllocatorDefault, 2u);
  if (v10)
  {
    uint64_t v11 = v10;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"DeviceUsagePairs", v10);
    CFRelease(v11);
  }
  CFNumberRef v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty(object, "IOService", @"VendorID", kCFAllocatorDefault, 2u);
  if (v12)
  {
    CFNumberRef v13 = v12;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"VendorID", v12);
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v13)) {
      CFNumberGetValue(v13, kCFNumberIntType, (char *)this + 96);
    }
    CFRelease(v13);
  }
  CFNumberRef v15 = (const __CFNumber *)IORegistryEntrySearchCFProperty(object, "IOService", @"ProductID", kCFAllocatorDefault, 2u);
  if (v15)
  {
    CFNumberRef v16 = v15;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"ProductID", v15);
    CFTypeID v17 = CFNumberGetTypeID();
    if (v17 == CFGetTypeID(v16)) {
      CFNumberGetValue(v16, kCFNumberIntType, (char *)this + 92);
    }
    CFRelease(v16);
  }
  CFNumberRef v18 = (const __CFNumber *)IORegistryEntrySearchCFProperty(object, "IOService", @"VersionNumber", kCFAllocatorDefault, 2u);
  if (v18)
  {
    CFNumberRef v19 = v18;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"VersionNumber", v18);
    CFTypeID v20 = CFNumberGetTypeID();
    if (v20 == CFGetTypeID(v19)) {
      CFNumberGetValue(v19, kCFNumberIntType, (char *)this + 88);
    }
    CFRelease(v19);
  }
  CFTypeRef v21 = IORegistryEntrySearchCFProperty(object, "IOService", @"PrimaryUsagePage", kCFAllocatorDefault, 2u);
  if (v21)
  {
    CFIndex v22 = v21;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"PrimaryUsagePage", v21);
    CFRelease(v22);
  }
  CFTypeRef v23 = IORegistryEntrySearchCFProperty(object, "IOService", @"PrimaryUsage", kCFAllocatorDefault, 2u);
  if (v23)
  {
    CFIndex v24 = v23;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"PrimaryUsage", v23);
    CFRelease(v24);
  }
  CFTypeRef v25 = IORegistryEntrySearchCFProperty(object, "IOService", @"kUSBContainerID", kCFAllocatorDefault, 3u);
  if (v25)
  {
    CFIndex v26 = v25;
    __int16 v27 = *((void *)this + 7);
    if (!v27)
    {
      __int16 v27 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        __int16 v27 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buffer = 138543362;
      *(void *)&buffer[4] = v26;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "Found ContainerID: %{public}@", buffer, 0xCu);
    }
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"kUSBContainerID", v26);
    CFRelease(v26);
  }
  int valuePtr = 7;
  CFNumberRef v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v28)
  {
    CFNumberRef v29 = v28;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"als-lgp-version", v28);
    CFRelease(v29);
  }
  int v139 = 2;
  CFNumberRef v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v139);
  if (v30)
  {
    CFNumberRef v31 = v30;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"ALSVersionKey", v30);
    CFRelease(v31);
  }
  io_iterator_t iterator = 0;
  uint64_t v32 = IORegistryEntryCreateIterator(object, "IOService", 3u, &iterator);
  io_registry_entry_t v33 = 0;
  if (!v32 && iterator)
  {
    while (1)
    {
      io_object_t v34 = IOIteratorNext(iterator);
      io_registry_entry_t v33 = v34;
      if (!v34) {
        break;
      }
      if (IOObjectConformsTo(v34, "IOHIDDevice"))
      {
        uint64_t v146 = 0;
        IORegistryEntryGetRegistryEntryID(v33, &v146);
        CFStringRef v35 = IOObjectCopyClass(v33);
        v36 = *((void *)this + 7);
        if (!v36)
        {
          v36 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v36 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buffer = 138543874;
          *(void *)&buffer[4] = v35;
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = v33;
          *(_WORD *)&buffer[18] = 2048;
          *(void *)&buffer[20] = v146;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "found %{public}@ (%u) id=%llu", buffer, 0x1Cu);
        }
        CFRelease(v35);
        IOObjectRetain(v33);
        break;
      }
    }
    IOObjectRelease(iterator);
  }
  v37 = *((void *)this + 7);
  if (!v37)
  {
    v37 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      v37 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 67109120;
    *(_DWORD *)&buffer[4] = v33;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "hidDeviceService = %u", buffer, 8u);
  }
  if (v33)
  {
    *((_DWORD *)this + 34) = v33;
    v38 = IOHIDDeviceCreate(kCFAllocatorDefault, v33);
    *((void *)this + 18) = v38;
    if (v38)
    {
      uint64_t v32 = IOHIDDeviceOpen(v38, 0);
      if (v32
        || (CFArrayRef v41 = IOHIDDeviceCopyMatchingElements(*((IOHIDDeviceRef *)this + 18), 0, 0),
            (*((void *)this + 28) = v41) == 0))
      {
        v39 = *((void *)this + 7);
        if (!v39)
        {
          v39 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v39 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_FCF8();
        }
      }
      else
      {
        if (AppleUSBALS::getElement(this, 32, 1236, kIOHIDElementTypeInput_Misc)
          && AppleUSBALS::getElement(this, 32, 1237, kIOHIDElementTypeInput_Misc))
        {
          v42 = *((void *)this + 7);
          if (!v42)
          {
            v42 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v42 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buffer = 0;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "colour supported", buffer, 2u);
          }
          *((unsigned char *)this + 82) = 1;
          CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 30), @"ColorSupport", kCFBooleanTrue);
        }
        uint64_t v137 = 0;
        if (AppleUSBALS::getConnectionType(this, &v137))
        {
          uint64_t v43 = v137;
          BOOL v44 = v137 == 2096;
          *((unsigned char *)this + 83) = v137 == 2096;
          v45 = (const void **)&kCFBooleanTrue;
          if (!v44) {
            v45 = (const void **)&kCFBooleanFalse;
          }
          CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 30), @"Built-In", *v45);
          v46 = *((void *)this + 7);
          if (!v46)
          {
            v46 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v46 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            v47 = "built-in";
            if (!*((unsigned char *)this + 83)) {
              v47 = "external";
            }
            *(_DWORD *)buffer = 134218242;
            *(void *)&buffer[4] = v43;
            *(_WORD *)&buffer[12] = 2080;
            *(void *)&buffer[14] = v47;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_DEFAULT, "retrieved the connection type (%lu) - %s", buffer, 0x16u);
          }
        }
        else
        {
          v48 = *((void *)this + 7);
          if (!v48)
          {
            v48 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v48 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buffer = 0;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "unable to retrieve the connection type - defaulting to external", buffer, 2u);
          }
          *((unsigned char *)this + 83) = 0;
          CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 30), @"Built-In", kCFBooleanFalse);
        }
        if (*((unsigned char *)this + 83))
        {
          *(_DWORD *)buffer = 7;
          CFNumberRef v49 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, buffer);
          if (v49)
          {
            CFNumberRef v50 = v49;
            if (IORegistryEntrySetCFProperty(*((_DWORD *)this + 12), @"als-lgp-version", v49))
            {
              v51 = *((void *)this + 7);
              if (!v51)
              {
                v51 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  v51 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                sub_FE30();
              }
            }
            CFRelease(v50);
          }
          else
          {
            v52 = *((void *)this + 7);
            if (!v52)
            {
              v52 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v52 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
              sub_FDFC();
            }
          }
        }
        int Location = AppleUSBALS::getLocation(this);
        v54 = *((void *)this + 7);
        if (Location)
        {
          if (!v54)
          {
            v54 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v54 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v55 = *((void *)this + 13);
            *(_DWORD *)buffer = 134217984;
            *(void *)&buffer[4] = v55;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "location retrieved successfully %lu", buffer, 0xCu);
          }
          CFNumberRef v56 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, (char *)this + 104);
          if (v56)
          {
            CFNumberRef v57 = v56;
            CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 30), @"SensorLocation", v56);
            CFRelease(v57);
          }
        }
        else
        {
          if (!v54)
          {
            v54 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v54 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buffer = 0;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "unable to retrieve location - unknown", buffer, 2u);
          }
        }
        *((void *)this + 25) = AppleUSBALS::getElement(this, 65298, 96, kIOHIDElementTypeFeature);
        *((void *)this + 26) = AppleUSBALS::getElement(this, 65298, 97, kIOHIDElementTypeFeature);
        *((void *)this + 27) = AppleUSBALS::getElement(this, 65298, 98, kIOHIDElementTypeFeature);
        if (*((void *)this + 25) && *((void *)this + 26))
        {
          v58 = *((void *)this + 7);
          if (!v58)
          {
            v58 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v58 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buffer = 0;
            _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "WP supported", buffer, 2u);
          }
          *((unsigned char *)this + 81) = 1;
          CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 30), @"DFRWhitepointSupport", kCFBooleanTrue);
        }
        CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3, &kCFTypeArrayCallBacks);
        if (Mutable)
        {
          v60 = Mutable;
          *(_OWORD *)buffer = *(_OWORD *)off_145D8;
          LODWORD(v132) = 32;
          LODWORD(v131) = 1233;
          LODWORD(v130) = 32;
          uint64_t v146 = 0;
          CFTypeRef cf = 0;
          uint64_t v146 = (uint64_t)CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v131);
          CFNumberRef v61 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v130);
          CFTypeRef cf = v61;
          v62 = (const void *)v146;
          if (v146 && v61)
          {
            CFDictionaryRef v63 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buffer, (const void **)&v146, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v63)
            {
              CFDictionaryRef v64 = v63;
              CFArrayAppendValue(v60, v63);
              CFRelease(v64);
            }
            v62 = (const void *)v146;
          }
          if (v62) {
            CFRelease(v62);
          }
          if (cf) {
            CFRelease(cf);
          }
          if (*((unsigned char *)this + 82))
          {
            int v136 = 1236;
            *(double *)&values = 0.0;
            CFTypeRef v145 = 0;
            *(double *)&values = COERCE_DOUBLE(CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v136));
            CFNumberRef v65 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v132);
            CFTypeRef v145 = v65;
            v66 = values;
            if (*(double *)&values != 0.0 && v65)
            {
              CFDictionaryRef v67 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buffer, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              if (v67)
              {
                CFDictionaryRef v68 = v67;
                CFArrayAppendValue(v60, v67);
                CFRelease(v68);
              }
              v66 = values;
            }
            if (v66) {
              CFRelease(v66);
            }
            if (v145) {
              CFRelease(v145);
            }
            int v135 = 1237;
            CFTypeRef v142 = 0;
            CFTypeRef v143 = 0;
            CFTypeRef v142 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v135);
            CFNumberRef v69 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v132);
            CFTypeRef v143 = v69;
            CFTypeRef v70 = v142;
            if (v142 && v69)
            {
              CFDictionaryRef v71 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buffer, &v142, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              if (v71)
              {
                CFDictionaryRef v72 = v71;
                CFArrayAppendValue(v60, v71);
                CFRelease(v72);
              }
              CFTypeRef v70 = v142;
            }
            if (v70) {
              CFRelease(v70);
            }
            if (v143) {
              CFRelease(v143);
            }
          }
          int v135 = 49;
          int v136 = 65298;
          *(double *)&values = 0.0;
          CFTypeRef v145 = 0;
          *(double *)&values = COERCE_DOUBLE(CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v135));
          CFNumberRef v73 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v136);
          CFTypeRef v145 = v73;
          v74 = values;
          if (*(double *)&values != 0.0 && v73)
          {
            CFDictionaryRef v75 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buffer, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v75)
            {
              CFDictionaryRef v76 = v75;
              CFArrayAppendValue(v60, v75);
              CFRelease(v76);
            }
            v74 = values;
          }
          if (v74) {
            CFRelease(v74);
          }
          if (v145) {
            CFRelease(v145);
          }
          int v133 = 81;
          int v134 = 65298;
          CFTypeRef v142 = 0;
          CFTypeRef v143 = 0;
          CFTypeRef v142 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v133);
          CFNumberRef v77 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v134);
          CFTypeRef v143 = v77;
          CFTypeRef v78 = v142;
          if (v142 && v77)
          {
            CFDictionaryRef v79 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)buffer, &v142, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v79)
            {
              CFDictionaryRef v80 = v79;
              CFArrayAppendValue(v60, v79);
              CFRelease(v80);
            }
            CFTypeRef v78 = v142;
          }
          if (v78) {
            CFRelease(v78);
          }
          if (v143) {
            CFRelease(v143);
          }
          IOHIDDeviceSetInputValueMatchingMultiple(*((IOHIDDeviceRef *)this + 18), v60);
          CFRelease(v60);
        }
        IOHIDDeviceRegisterInputValueCallback(*((IOHIDDeviceRef *)this + 18), (IOHIDValueCallback)handleExtHIDDeviceEventCallback, this);
        IOHIDDeviceRegisterRemovalCallback(*((IOHIDDeviceRef *)this + 18), (IOHIDCallback)handleExtHIDDeviceRemovalCallback, this);
        CFArrayRef v81 = (const __CFArray *)*((void *)this + 28);
        if (v81 && CFArrayGetCount(v81) >= 1)
        {
          CFIndex v82 = 0;
          v126 = 0;
          v128 = 0;
          v83 = 0;
          v84 = 0;
          v85 = 0;
          v86 = 0;
          do
          {
            ValueAtIndex = (void *)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 28), v82);
            CFTypeID v88 = CFGetTypeID(ValueAtIndex);
            if (v88 == IOHIDElementGetTypeID())
            {
              if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 49
                && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
                && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                && !*((void *)this + 23))
              {
                *((void *)this + 23) = ValueAtIndex;
                v89 = *((void *)this + 7);
                if (!v89)
                {
                  v89 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    v89 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                {
                  v90 = (__IOHIDElement *)*((void *)this + 23);
                  uint32_t UsagePage = IOHIDElementGetUsagePage(v90);
                  uint32_t Usage = IOHIDElementGetUsage(*((IOHIDElementRef *)this + 23));
                  v125 = v86;
                  v91 = v84;
                  v92 = v83;
                  v93 = v85;
                  uint32_t ReportID = IOHIDElementGetReportID(*((IOHIDElementRef *)this + 23));
                  IOHIDElementCookie Cookie = IOHIDElementGetCookie(*((IOHIDElementRef *)this + 23));
                  *(_DWORD *)buffer = 134219008;
                  *(void *)&buffer[4] = v90;
                  *(_WORD *)&buffer[12] = 1024;
                  *(_DWORD *)&buffer[14] = UsagePage;
                  *(_WORD *)&buffer[18] = 1024;
                  *(_DWORD *)&buffer[20] = Usage;
                  *(_WORD *)&buffer[24] = 1024;
                  *(_DWORD *)&buffer[26] = ReportID;
                  v85 = v93;
                  v83 = v92;
                  v84 = v91;
                  v86 = v125;
                  *(_WORD *)&buffer[30] = 1024;
                  v149[0] = Cookie;
                  _os_log_impl(&dword_0, v89, OS_LOG_TYPE_DEFAULT, "_hidDFRDisplay.displayStateElement (0x%p): page=0x%X usage=0x%X ID=0x%X cookie=%u", buffer, 0x24u);
                }
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 50 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                     && !*((void *)this + 24))
              {
                *((void *)this + 24) = ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 33 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                     && !*((void *)this + 19))
              {
                *((void *)this + 19) = ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 32 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                     && !*((void *)this + 21))
              {
                *((void *)this + 21) = ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 34 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                     && !*((void *)this + 20))
              {
                *((void *)this + 20) = ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 35 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                     && !*((void *)this + 22))
              {
                *((void *)this + 22) = ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 1233 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 32
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeInput_Misc
                     && !v86)
              {
                *((unsigned char *)this + 84) = 1;
                v86 = (__IOHIDElement *)ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 64 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeFeature
                     && !v128)
              {
                v128 = (__IOHIDElement *)ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 1 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 65298
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeCollection
                     && !v85)
              {
                v85 = ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 1236 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 32
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeInput_Misc
                     && !v84)
              {
                v84 = (__IOHIDElement *)ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 1237 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 32
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeInput_Misc
                     && !v83)
              {
                v83 = (__IOHIDElement *)ValueAtIndex;
              }
              else if (IOHIDElementGetUsage((IOHIDElementRef)ValueAtIndex) == 1234 {
                     && IOHIDElementGetUsagePage((IOHIDElementRef)ValueAtIndex) == 32
              }
                     && IOHIDElementGetType((IOHIDElementRef)ValueAtIndex) == kIOHIDElementTypeInput_Misc
                     && !v126)
              {
                v126 = (__IOHIDElement *)ValueAtIndex;
              }
            }
            ++v82;
          }
          while (CFArrayGetCount(*((CFArrayRef *)this + 28)) > v82);
        }
        else
        {
          v86 = 0;
          v126 = 0;
          v128 = 0;
          v85 = 0;
          v84 = 0;
          v83 = 0;
        }
        v96 = *((void *)this + 7);
        if (!v96)
        {
          v96 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v96 = init_default_corebrightness_log();
          }
        }
        v97 = v83;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buffer = 134218496;
          *(void *)&buffer[4] = v86;
          *(_WORD *)&buffer[12] = 2048;
          *(void *)&buffer[14] = v128;
          *(_WORD *)&buffer[22] = 2048;
          *(void *)&buffer[24] = v85;
          _os_log_impl(&dword_0, v96, OS_LOG_TYPE_DEFAULT, "illumunanceElement=%p protocolVersionElement=%p dfrSupportElement=%p", buffer, 0x20u);
        }
        if (v128)
        {
          v98 = v84;
          int LogicalMax = IOHIDElementGetLogicalMax(v128);
          int v100 = LogicalMax;
          if (LogicalMax <= 0) {
            *((_DWORD *)this + 58) = LogicalMax;
          }
          v101 = *((void *)this + 7);
          if (!v101)
          {
            v101 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v101 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
          {
            int v102 = *((_DWORD *)this + 58);
            *(_DWORD *)buffer = 67109376;
            *(_DWORD *)&buffer[4] = v100;
            *(_WORD *)&buffer[8] = 1024;
            *(_DWORD *)&buffer[10] = v102;
            _os_log_impl(&dword_0, v101, OS_LOG_TYPE_DEFAULT, "protocol version max=%u used=%u", buffer, 0xEu);
          }
          CFIndex v103 = *((int *)this + 58);
          Element = AppleUSBALS::getElement(this, 65298, 64, kIOHIDElementTypeFeature);
          int v105 = AppleUSBALS::setElementIntValue((IOHIDDeviceRef *)this, Element, v103);
          v106 = *((void *)this + 7);
          if (!v106)
          {
            v106 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v106 = init_default_corebrightness_log();
            }
          }
          v84 = v98;
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
          {
            v107 = "failed";
            if (!v105) {
              v107 = "success";
            }
            *(_DWORD *)buffer = 136315394;
            *(void *)&buffer[4] = v107;
            *(_WORD *)&buffer[12] = 1024;
            *(_DWORD *)&buffer[14] = v105;
            _os_log_impl(&dword_0, v106, OS_LOG_TYPE_DEFAULT, "protocol version handshake: %s (0x%X)", buffer, 0x12u);
          }
        }
        if (v86)
        {
          uint64_t v146 = 0;
          values = *((void **)this + 41);
          IOReturn ValueWithOptions = IOHIDDeviceGetValueWithOptions(*((IOHIDDeviceRef *)this + 18), v86, (IOHIDValueRef *)&v146, 0x20000u);
          if (!ValueWithOptions && v146) {
            AppleUSBALS::retrieveScaledValue(this, (IOHIDValueRef)v146, (double *)&values);
          }
          v109 = *((void *)this + 7);
          if (!v109)
          {
            v109 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v109 = init_default_corebrightness_log();
            }
          }
          BOOL v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
          v111 = values;
          if (v110)
          {
            *(_DWORD *)buffer = 134218496;
            *(void *)&buffer[4] = v146;
            *(_WORD *)&buffer[12] = 1024;
            *(_DWORD *)&buffer[14] = *(double *)&values;
            *(_WORD *)&buffer[18] = 1024;
            *(_DWORD *)&buffer[20] = ValueWithOptions;
            _os_log_impl(&dword_0, v109, OS_LOG_TYPE_DEFAULT, "illuminance hid value = %p, initial lux = %u, BOOL result = 0x%X", buffer, 0x18u);
          }
          AppleUSBALS::updateCurrentAmbient(this, *(double *)&v111);
        }
        if (v84 && v97 && v126)
        {
          uint64_t v146 = 0;
          *(double *)&values = 0.0;
          CFTypeRef v142 = 0;
          if (IOHIDDeviceGetValue(*((IOHIDDeviceRef *)this + 18), v84, (IOHIDValueRef *)&v146)
            || IOHIDDeviceGetValue(*((IOHIDDeviceRef *)this + 18), v97, (IOHIDValueRef *)&values)
            || IOHIDDeviceGetValue(*((IOHIDDeviceRef *)this + 18), v126, (IOHIDValueRef *)&v142))
          {
            v112 = *((void *)this + 7);
            if (!v112)
            {
              v112 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v112 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
              sub_FD94();
            }
          }
          else
          {
            double v131 = 0.0;
            double v132 = 0.0;
            double v130 = 0.0;
            if (AppleUSBALS::retrieveScaledValue(this, (IOHIDValueRef)v146, &v132)
              && AppleUSBALS::retrieveScaledValue(this, (IOHIDValueRef)values, &v131)
              && AppleUSBALS::retrieveScaledValue(this, (IOHIDValueRef)v142, &v130))
            {
              double v116 = 0.0;
              if (v132 == 0.0)
              {
                double v117 = 0.0;
                double v118 = 0.0;
              }
              else
              {
                double v117 = 0.0;
                double v118 = 0.0;
                if (v131 != 0.0)
                {
                  double v117 = *((double *)this + 41);
                  double v116 = v132 / v131 * v117;
                  double v118 = (1.0 - v132 - v131) / v131 * v117;
                }
              }
              double v120 = v116;
              double v127 = v117;
              double v129 = v118;
              AppleUSBALS::updateCurrentColourInfo(this, v116, v117, v118, v130);
              v121 = *((void *)this + 7);
              if (!v121)
              {
                v121 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  v121 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v122 = *((void *)this + 41);
                *(_DWORD *)buffer = 134218752;
                *(double *)&buffer[4] = v120;
                *(_WORD *)&buffer[12] = 2048;
                *(double *)&buffer[14] = v127;
                *(_WORD *)&buffer[22] = 2048;
                *(double *)&buffer[24] = v129;
                LOWORD(v149[0]) = 2048;
                *(void *)((char *)v149 + 2) = v122;
                _os_log_impl(&dword_0, v121, OS_LOG_TYPE_DEFAULT, "initial color: [X=%f,Y=%f,Z=%f] (in %f lux)", buffer, 0x2Au);
              }
            }
            else
            {
              v119 = *((void *)this + 7);
              if (!v119)
              {
                v119 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  v119 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
                sub_FD60();
              }
            }
          }
        }
        if (v85)
        {
          v113 = *((void *)this + 7);
          if (!v113)
          {
            v113 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v113 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buffer = 0;
            _os_log_impl(&dword_0, v113, OS_LOG_TYPE_DEFAULT, "dfr supported", buffer, 2u);
          }
          *(_DWORD *)buffer = 1;
          CFNumberRef v114 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, buffer);
          if (v114)
          {
            CFNumberRef v115 = v114;
            CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"DFRSupport", v114);
            CFRelease(v115);
          }
          *((unsigned char *)this + 80) = 1;
        }
        return 0;
      }
    }
  }
  return v32;
}

BOOL AppleUSBALS::getConnectionType(AppleUSBALS *this, uint64_t *a2)
{
  uint64_t v4 = (__IOHIDDevice *)*((void *)this + 18);
  if (v4 && (IOHIDTransactionRef v5 = IOHIDTransactionCreate(kCFAllocatorDefault, v4, kIOHIDTransactionDirectionTypeInput, 0)) != 0)
  {
    CFStringRef v6 = v5;
    Element = AppleUSBALS::getElement(this, 32, 2096, kIOHIDElementTypeFeature);
    if (Element) {
      IOHIDTransactionAddElement(v6, Element);
    }
    CFUUIDRef v8 = AppleUSBALS::getElement(this, 32, 2097, kIOHIDElementTypeFeature);
    if (v8) {
      IOHIDTransactionAddElement(v6, v8);
    }
    CFUUIDRef v9 = AppleUSBALS::getElement(this, 32, 2098, kIOHIDElementTypeFeature);
    if (v9) {
      IOHIDTransactionAddElement(v6, v9);
    }
    IOReturn v10 = IOHIDTransactionCommit(v6);
    BOOL v11 = v10 == 0;
    if (v10)
    {
      inited = *((void *)this + 7);
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
        sub_FED8();
      }
    }
    else
    {
      if (Element)
      {
        CFNumberRef Value = IOHIDTransactionGetValue(v6, Element, 0);
        if (Value)
        {
          if (IOHIDValueGetIntegerValue(Value)) {
            *a2 = 2096;
          }
        }
      }
      if (v8)
      {
        CFNumberRef v16 = IOHIDTransactionGetValue(v6, v8, 0);
        if (v16)
        {
          if (IOHIDValueGetIntegerValue(v16)) {
            *a2 = 2097;
          }
        }
      }
      if (v9)
      {
        CFTypeID v17 = IOHIDTransactionGetValue(v6, v9, 0);
        if (v17)
        {
          if (IOHIDValueGetIntegerValue(v17)) {
            *a2 = 2098;
          }
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    CFNumberRef v13 = *((void *)this + 7);
    if (!v13)
    {
      CFNumberRef v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        CFNumberRef v13 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_FE64();
    }
    return 0;
  }
  return v11;
}

uint64_t AppleUSBALS::getLocation(AppleUSBALS *this)
{
  uint64_t v2 = (__IOHIDDevice *)*((void *)this + 18);
  if (v2)
  {
    IOHIDTransactionRef v3 = IOHIDTransactionCreate(kCFAllocatorDefault, v2, kIOHIDTransactionDirectionTypeInput, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      Element = AppleUSBALS::getElement(this, 65301, 257, kIOHIDElementTypeFeature);
      if (Element) {
        IOHIDTransactionAddElement(v4, Element);
      }
      CFStringRef v6 = AppleUSBALS::getElement(this, 65301, 258, kIOHIDElementTypeFeature);
      if (v6) {
        IOHIDTransactionAddElement(v4, v6);
      }
      if (IOHIDTransactionCommit(v4))
      {
        inited = *((void *)this + 7);
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
          sub_FED8();
        }
      }
      else
      {
        if (Element)
        {
          CFNumberRef Value = IOHIDTransactionGetValue(v4, Element, 0);
          if (Value)
          {
            if (IOHIDValueGetIntegerValue(Value)) {
              *((void *)this + 13) = 257;
            }
          }
        }
        if (v6)
        {
          BOOL v11 = IOHIDTransactionGetValue(v4, v6, 0);
          if (v11)
          {
            if (IOHIDValueGetIntegerValue(v11)) {
              *((void *)this + 13) = 258;
            }
          }
        }
        CFNumberRef v12 = *((void *)this + 7);
        if (*((void *)this + 13))
        {
          if (!v12)
          {
            CFNumberRef v12 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFNumberRef v12 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v13 = *((void *)this + 13);
            int v15 = 134217984;
            uint64_t v16 = v13;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "sensor location %lu", (uint8_t *)&v15, 0xCu);
          }
          uint64_t v8 = 1;
          goto LABEL_40;
        }
        if (!v12)
        {
          CFNumberRef v12 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            CFNumberRef v12 = init_default_corebrightness_log();
          }
        }
        uint64_t v8 = 0;
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_40;
        }
        LOWORD(v15) = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "location is not available", (uint8_t *)&v15, 2u);
      }
      uint64_t v8 = 0;
LABEL_40:
      CFRelease(v4);
      return v8;
    }
  }
  CFUUIDRef v9 = *((void *)this + 7);
  if (!v9)
  {
    CFUUIDRef v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFUUIDRef v9 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_FE64();
  }
  return 0;
}

uint64_t AppleUSBALS::setIntValueForUsage(AppleUSBALS *this, int a2, int a3, CFIndex a4)
{
  Element = AppleUSBALS::getElement(this, a2, a3, kIOHIDElementTypeFeature);

  return AppleUSBALS::setElementIntValue((IOHIDDeviceRef *)this, Element, a4);
}

void AppleUSBALS::updateCurrentAmbient(AppleUSBALS *this, double a2)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FF40();
  }
  *((double *)this + 41) = a2;
  float v5 = a2;
  float valuePtr = v5;
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
  if (v6)
  {
    CFNumberRef v7 = v6;
    uint64_t v8 = (__CFDictionary *)*((void *)this + 30);
    if (v8) {
      CFDictionarySetValue(v8, @"CurrentLuxValue", v7);
    }
    CFRelease(v7);
  }
}

void AppleUSBALS::updateCurrentColourInfo(AppleUSBALS *this, double a2, double a3, double a4, double a5)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 134218752;
    double v12 = a2;
    __int16 v13 = 2048;
    double v14 = a3;
    __int16 v15 = 2048;
    double v16 = a4;
    __int16 v17 = 2048;
    double v18 = a5;
    _os_log_debug_impl(&dword_0, inited, OS_LOG_TYPE_DEBUG, "X=%f Y=%f Z=%f CCT=%f", (uint8_t *)&v11, 0x2Au);
  }
  *((double *)this + 42) = a2;
  *((double *)this + 43) = a3;
  *((double *)this + 44) = a4;
  *((double *)this + 45) = a5;
}

uint64_t AppleUSBALS::stop(AppleUSBALS *this)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
  CFArrayRef v3 = (const __CFArray *)*((void *)this + 28);
  if (v3)
  {
    if (CFArrayGetCount(v3) >= 1)
    {
      CFIndex v4 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 28), v4);
        if (ValueAtIndex)
        {
          CFNumberRef v6 = ValueAtIndex;
          CFTypeID TypeID = IOHIDElementGetTypeID();
          if (TypeID == CFGetTypeID(v6)) {
            _IOHIDElementSetValue();
          }
        }
        ++v4;
      }
      while (CFArrayGetCount(*((CFArrayRef *)this + 28)) > v4);
    }
    *(_OWORD *)((char *)this + 184) = 0u;
    *(_OWORD *)((char *)this + 168) = 0u;
    *(_OWORD *)((char *)this + 152) = 0u;
    CFRelease(*((CFTypeRef *)this + 28));
    *((void *)this + 28) = 0;
  }
  uint64_t v8 = (__IOHIDDevice *)*((void *)this + 18);
  if (v8)
  {
    IOHIDDeviceClose(v8, 0);
    CFRelease(*((CFTypeRef *)this + 18));
    *((void *)this + 18) = 0;
  }
  io_object_t v9 = *((_DWORD *)this + 34);
  if (v9)
  {
    IOObjectRelease(v9);
    *((_DWORD *)this + 34) = 0;
  }
  return 0;
}

uint64_t AppleUSBALS::open(AppleUSBALS *this)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
  return 1;
}

void AppleUSBALS::close(AppleUSBALS *this)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
}

const void *AppleUSBALS::copyProperty(AppleUSBALS *this, const __CFString *a2)
{
  if (!a2) {
    return 0;
  }
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_1021C();
  }
  if (CFEqual(a2, @"FilterProperties"))
  {
    float v5 = (void *)CFRetain(*((CFTypeRef *)this + 30));
LABEL_100:
    v36 = v5;
    goto LABEL_101;
  }
  if (CFEqual(a2, @"SensorConnectionType"))
  {
    *(void *)&long long valuePtr = 2096;
    CFNumberRef v6 = (__IOHIDDevice *)*((void *)this + 18);
    CFAllocatorRef v7 = kCFAllocatorDefault;
    if (v6)
    {
      IOHIDTransactionRef v8 = IOHIDTransactionCreate(kCFAllocatorDefault, v6, kIOHIDTransactionDirectionTypeInput, 0);
      if (v8)
      {
        io_object_t v9 = v8;
        IOReturn v10 = AppleUSBALS::getElement(this, 32, 2096, kIOHIDElementTypeFeature);
        if (v10) {
          IOHIDTransactionAddElement(v9, v10);
        }
        int v11 = AppleUSBALS::getElement(this, 32, 2097, kIOHIDElementTypeFeature);
        if (v11) {
          IOHIDTransactionAddElement(v9, v11);
        }
        double v12 = AppleUSBALS::getElement(this, 32, 2098, kIOHIDElementTypeFeature);
        if (v12) {
          IOHIDTransactionAddElement(v9, v12);
        }
        if (IOHIDTransactionCommit(v9)) {
          goto LABEL_19;
        }
        if (v10)
        {
          CFNumberRef Value = IOHIDTransactionGetValue(v9, v10, 0);
          if (Value)
          {
            if (IOHIDValueGetIntegerValue(Value)) {
              *(void *)&long long valuePtr = 2096;
            }
          }
        }
        if (v11)
        {
          v39 = IOHIDTransactionGetValue(v9, v11, 0);
          if (v39)
          {
            if (IOHIDValueGetIntegerValue(v39)) {
              *(void *)&long long valuePtr = 2097;
            }
          }
        }
        if (!v12) {
          goto LABEL_19;
        }
        v40 = IOHIDTransactionGetValue(v9, v12, 0);
        if (!v40 || !IOHIDValueGetIntegerValue(v40)) {
          goto LABEL_19;
        }
        uint64_t v41 = 2098;
LABEL_81:
        *(void *)&long long valuePtr = v41;
LABEL_19:
        CFAllocatorRef v13 = v7;
LABEL_67:
        v36 = CFNumberCreate(v13, kCFNumberCFIndexType, &valuePtr);
        v37 = v9;
LABEL_68:
        CFRelease(v37);
        goto LABEL_101;
      }
    }
    goto LABEL_97;
  }
  if (CFEqual(a2, @"SensorState"))
  {
    *(void *)&long long valuePtr = 2048;
    double v14 = (__IOHIDDevice *)*((void *)this + 18);
    if (v14)
    {
      IOHIDTransactionRef v15 = IOHIDTransactionCreate(kCFAllocatorDefault, v14, kIOHIDTransactionDirectionTypeInput, 0);
      if (v15)
      {
        io_object_t v9 = v15;
        double v16 = AppleUSBALS::getElement(this, 32, 2048, kIOHIDElementTypeFeature);
        if (v16) {
          IOHIDTransactionAddElement(v9, v16);
        }
        __int16 v17 = AppleUSBALS::getElement(this, 32, 2054, kIOHIDElementTypeFeature);
        if (v17) {
          IOHIDTransactionAddElement(v9, v17);
        }
        double v18 = AppleUSBALS::getElement(this, 32, 2049, kIOHIDElementTypeFeature);
        if (v18) {
          IOHIDTransactionAddElement(v9, v18);
        }
        CFNumberRef v19 = AppleUSBALS::getElement(this, 32, 2051, kIOHIDElementTypeFeature);
        if (v19) {
          IOHIDTransactionAddElement(v9, v19);
        }
        CFTypeID v20 = AppleUSBALS::getElement(this, 32, 2053, kIOHIDElementTypeFeature);
        if (v20) {
          IOHIDTransactionAddElement(v9, v20);
        }
        element = v20;
        CFTypeRef v21 = AppleUSBALS::getElement(this, 32, 2052, kIOHIDElementTypeFeature);
        if (v21) {
          IOHIDTransactionAddElement(v9, v21);
        }
        CFIndex v22 = AppleUSBALS::getElement(this, 32, 2050, kIOHIDElementTypeFeature);
        if (v22) {
          IOHIDTransactionAddElement(v9, v22);
        }
        if (IOHIDTransactionCommit(v9))
        {
          CFTypeRef v23 = *((void *)this + 7);
          if (!v23)
          {
            CFTypeRef v23 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFTypeRef v23 = init_default_corebrightness_log();
            }
          }
          CFAllocatorRef v24 = kCFAllocatorDefault;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_101B4();
          }
        }
        else
        {
          if (v16)
          {
            v52 = IOHIDTransactionGetValue(v9, v16, 0);
            if (v52)
            {
              if (IOHIDValueGetIntegerValue(v52)) {
                *(void *)&long long valuePtr = 2048;
              }
            }
          }
          if (v17)
          {
            v53 = IOHIDTransactionGetValue(v9, v17, 0);
            if (v53)
            {
              if (IOHIDValueGetIntegerValue(v53)) {
                *(void *)&long long valuePtr = 2054;
              }
            }
          }
          if (v18)
          {
            v54 = IOHIDTransactionGetValue(v9, v18, 0);
            if (v54)
            {
              if (IOHIDValueGetIntegerValue(v54)) {
                *(void *)&long long valuePtr = 2049;
              }
            }
          }
          if (v19)
          {
            uint64_t v55 = IOHIDTransactionGetValue(v9, v19, 0);
            if (v55)
            {
              if (IOHIDValueGetIntegerValue(v55)) {
                *(void *)&long long valuePtr = 2051;
              }
            }
          }
          if (element)
          {
            CFNumberRef v56 = IOHIDTransactionGetValue(v9, element, 0);
            if (v56)
            {
              if (IOHIDValueGetIntegerValue(v56)) {
                *(void *)&long long valuePtr = 2053;
              }
            }
          }
          if (v21)
          {
            CFNumberRef v57 = IOHIDTransactionGetValue(v9, v21, 0);
            if (v57)
            {
              if (IOHIDValueGetIntegerValue(v57)) {
                *(void *)&long long valuePtr = 2052;
              }
            }
          }
          CFAllocatorRef v24 = kCFAllocatorDefault;
          if (v22)
          {
            v58 = IOHIDTransactionGetValue(v9, v22, 0);
            if (v58)
            {
              if (IOHIDValueGetIntegerValue(v58)) {
                *(void *)&long long valuePtr = 2050;
              }
            }
          }
        }
        CFAllocatorRef v13 = v24;
        goto LABEL_67;
      }
    }
    p_long long valuePtr = (void **)&valuePtr;
    CFAllocatorRef v26 = kCFAllocatorDefault;
    goto LABEL_98;
  }
  if (CFEqual(a2, @"SensorPowerState"))
  {
    *(void *)&long long valuePtr = 2128;
    __int16 v27 = (__IOHIDDevice *)*((void *)this + 18);
    CFAllocatorRef v7 = kCFAllocatorDefault;
    if (v27)
    {
      IOHIDTransactionRef v28 = IOHIDTransactionCreate(kCFAllocatorDefault, v27, kIOHIDTransactionDirectionTypeInput, 0);
      if (v28)
      {
        io_object_t v9 = v28;
        CFNumberRef v29 = AppleUSBALS::getElement(this, 32, 2128, kIOHIDElementTypeFeature);
        if (v29) {
          IOHIDTransactionAddElement(v9, v29);
        }
        CFNumberRef v30 = AppleUSBALS::getElement(this, 32, 2129, kIOHIDElementTypeFeature);
        if (v30) {
          IOHIDTransactionAddElement(v9, v30);
        }
        CFNumberRef v31 = AppleUSBALS::getElement(this, 32, 2130, kIOHIDElementTypeFeature);
        if (v31) {
          IOHIDTransactionAddElement(v9, v31);
        }
        uint64_t v32 = AppleUSBALS::getElement(this, 32, 2131, kIOHIDElementTypeFeature);
        if (v32) {
          IOHIDTransactionAddElement(v9, v32);
        }
        io_registry_entry_t v33 = AppleUSBALS::getElement(this, 32, 2132, kIOHIDElementTypeFeature);
        if (v33) {
          IOHIDTransactionAddElement(v9, v33);
        }
        io_object_t v34 = AppleUSBALS::getElement(this, 32, 2133, kIOHIDElementTypeFeature);
        if (v34) {
          IOHIDTransactionAddElement(v9, v34);
        }
        if (IOHIDTransactionCommit(v9))
        {
          CFStringRef v35 = *((void *)this + 7);
          if (!v35)
          {
            CFStringRef v35 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFStringRef v35 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_1014C();
          }
        }
        else
        {
          if (v29)
          {
            CFNumberRef v61 = IOHIDTransactionGetValue(v9, v29, 0);
            if (v61)
            {
              if (IOHIDValueGetIntegerValue(v61)) {
                *(void *)&long long valuePtr = 2128;
              }
            }
          }
          if (v30)
          {
            v62 = IOHIDTransactionGetValue(v9, v30, 0);
            if (v62)
            {
              if (IOHIDValueGetIntegerValue(v62)) {
                *(void *)&long long valuePtr = 2129;
              }
            }
          }
          if (v31)
          {
            CFDictionaryRef v63 = IOHIDTransactionGetValue(v9, v31, 0);
            if (v63)
            {
              if (IOHIDValueGetIntegerValue(v63)) {
                *(void *)&long long valuePtr = 2130;
              }
            }
          }
          if (v32)
          {
            CFDictionaryRef v64 = IOHIDTransactionGetValue(v9, v32, 0);
            if (v64)
            {
              if (IOHIDValueGetIntegerValue(v64)) {
                *(void *)&long long valuePtr = 2131;
              }
            }
          }
          if (v33)
          {
            CFNumberRef v65 = IOHIDTransactionGetValue(v9, v33, 0);
            if (v65)
            {
              if (IOHIDValueGetIntegerValue(v65)) {
                *(void *)&long long valuePtr = 2132;
              }
            }
          }
          if (v34)
          {
            v66 = IOHIDTransactionGetValue(v9, v34, 0);
            if (v66)
            {
              if (IOHIDValueGetIntegerValue(v66)) {
                *(void *)&long long valuePtr = 2133;
              }
            }
          }
        }
        CFAllocatorRef v13 = kCFAllocatorDefault;
        goto LABEL_67;
      }
    }
LABEL_97:
    p_long long valuePtr = (void **)&valuePtr;
    CFAllocatorRef v26 = v7;
LABEL_98:
    CFNumberType v48 = kCFNumberCFIndexType;
LABEL_99:
    float v5 = CFNumberCreate(v26, v48, p_valuePtr);
    goto LABEL_100;
  }
  if (CFEqual(a2, @"SensorReportingState"))
  {
    *(void *)&long long valuePtr = 2112;
    v42 = (__IOHIDDevice *)*((void *)this + 18);
    CFAllocatorRef v7 = kCFAllocatorDefault;
    if (v42)
    {
      IOHIDTransactionRef v43 = IOHIDTransactionCreate(kCFAllocatorDefault, v42, kIOHIDTransactionDirectionTypeInput, 0);
      if (v43)
      {
        io_object_t v9 = v43;
        BOOL v44 = AppleUSBALS::getElement(this, 32, 2112, kIOHIDElementTypeFeature);
        if (v44) {
          IOHIDTransactionAddElement(v9, v44);
        }
        v45 = AppleUSBALS::getElement(this, 32, 2113, kIOHIDElementTypeFeature);
        if (v45) {
          IOHIDTransactionAddElement(v9, v45);
        }
        v46 = AppleUSBALS::getElement(this, 32, 2114, kIOHIDElementTypeFeature);
        if (v46) {
          IOHIDTransactionAddElement(v9, v46);
        }
        if (IOHIDTransactionCommit(v9))
        {
          v47 = *((void *)this + 7);
          if (!v47)
          {
            v47 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v47 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            sub_100E4();
          }
          goto LABEL_19;
        }
        if (v44)
        {
          CFDictionaryRef v67 = IOHIDTransactionGetValue(v9, v44, 0);
          if (v67)
          {
            if (IOHIDValueGetIntegerValue(v67)) {
              *(void *)&long long valuePtr = 2112;
            }
          }
        }
        if (v45)
        {
          CFDictionaryRef v68 = IOHIDTransactionGetValue(v9, v45, 0);
          if (v68)
          {
            if (IOHIDValueGetIntegerValue(v68)) {
              *(void *)&long long valuePtr = 2113;
            }
          }
        }
        if (!v46) {
          goto LABEL_19;
        }
        CFNumberRef v69 = IOHIDTransactionGetValue(v9, v46, 0);
        if (!v69 || !IOHIDValueGetIntegerValue(v69)) {
          goto LABEL_19;
        }
        uint64_t v41 = 2114;
        goto LABEL_81;
      }
    }
    goto LABEL_97;
  }
  if (CFEqual(a2, @"SensorRelativeSensitivity"))
  {
    v59 = this;
    int v60 = 58577;
LABEL_183:
    CFTypeRef v70 = AppleUSBALS::getElement(v59, 32, v60, kIOHIDElementTypeFeature);
    if (!v70) {
      goto LABEL_102;
    }
    *(void *)&long long valuePtr = 0;
    v36 = 0;
    if (IOHIDDeviceGetValue(*((IOHIDDeviceRef *)this + 18), v70, (IOHIDValueRef *)&valuePtr)) {
      goto LABEL_101;
    }
    if (!(void)valuePtr) {
      goto LABEL_101;
    }
    values[0] = 0;
    v36 = 0;
    if (!AppleUSBALS::retrieveScaledValue(this, (IOHIDValueRef)valuePtr, (double *)values)) {
      goto LABEL_101;
    }
    CFAllocatorRef v26 = kCFAllocatorDefault;
    p_long long valuePtr = values;
    CFNumberType v48 = kCFNumberDoubleType;
    goto LABEL_99;
  }
  if (CFEqual(a2, @"SensorAbsoluteSensitivity"))
  {
    v59 = this;
    int v60 = 5329;
    goto LABEL_183;
  }
  if (CFEqual(a2, @"SensorAbsoluteColorSensitivity"))
  {
    v59 = this;
    int v60 = 5331;
    goto LABEL_183;
  }
  if (!*((unsigned char *)this + 80)) {
    goto LABEL_102;
  }
  if (CFEqual(a2, @"DFRDisplayBrightnessMin"))
  {
    LODWORD(valuePtr) = 0;
    CFDictionaryRef v71 = this;
    int v72 = 66;
    goto LABEL_195;
  }
  if (CFEqual(a2, @"DFRDisplayBrightnessMax"))
  {
    LODWORD(valuePtr) = 0;
    CFDictionaryRef v71 = this;
    int v72 = 67;
    goto LABEL_195;
  }
  if (CFEqual(a2, @"DFRBrightness"))
  {
    LODWORD(valuePtr) = 0;
    CFDictionaryRef v71 = this;
    int v72 = 18;
    goto LABEL_195;
  }
  if (CFEqual(a2, @"DFRAutoBrightness"))
  {
    *(void *)&long long valuePtr = 0;
    v36 = 0;
    if (!AppleUSBALS::getIntValueForUsage(this, 65298, 65, (uint64_t *)&valuePtr))
    {
      LODWORD(values[0]) = (void)valuePtr != 1;
      CFAllocatorRef v26 = kCFAllocatorDefault;
      p_long long valuePtr = values;
      CFNumberType v48 = kCFNumberIntType;
      goto LABEL_99;
    }
    goto LABEL_101;
  }
  if (CFEqual(a2, @"DFRTrustedLux"))
  {
    *(void *)&long long valuePtr = 0;
    CFNumberRef v73 = AppleUSBALS::getElement(this, 32, 1233, kIOHIDElementTypeInput_Misc);
    goto LABEL_202;
  }
  if (CFEqual(a2, @"DFRNits"))
  {
    LODWORD(valuePtr) = 0;
    CFDictionaryRef v71 = this;
    int v72 = 17;
LABEL_195:
    if (AppleUSBALS::getFloatValueForUsage(v71, 65298, v72, (float *)&valuePtr))
    {
LABEL_196:
      v36 = 0;
      goto LABEL_101;
    }
    goto LABEL_215;
  }
  if (!CFEqual(a2, @"DFRDisplayFactor"))
  {
    if (CFEqual(a2, @"DFRDisplayState"))
    {
      *(void *)&long long valuePtr = 0;
      CFNumberRef v73 = (__IOHIDElement *)*((void *)this + 23);
      goto LABEL_202;
    }
    if (CFEqual(a2, @"DFRDimmingFactor"))
    {
      LODWORD(valuePtr) = 0;
      if (AppleUSBALS::getElementFloatValue(this, *((__IOHIDElement **)this + 22), (float *)&valuePtr)) {
        goto LABEL_196;
      }
LABEL_215:
      CFAllocatorRef v26 = kCFAllocatorDefault;
      p_long long valuePtr = (void **)&valuePtr;
LABEL_216:
      CFNumberType v48 = kCFNumberFloatType;
      goto LABEL_99;
    }
    if (CFEqual(a2, @"DFRDimmingStep"))
    {
      *(void *)&long long valuePtr = 0;
      CFNumberRef v73 = (__IOHIDElement *)*((void *)this + 19);
LABEL_202:
      v36 = 0;
      if (!AppleUSBALS::getElementIntValue(this, v73, (uint64_t *)&valuePtr))
      {
        CFAllocatorRef v26 = kCFAllocatorDefault;
        p_long long valuePtr = (void **)&valuePtr;
        CFNumberType v48 = kCFNumberLongType;
        goto LABEL_99;
      }
      goto LABEL_101;
    }
    if (CFEqual(a2, @"DFRBurninCounter"))
    {
      *(void *)&long long valuePtr = 0;
      CFDictionaryRef v75 = AppleUSBALS::copyDataForUsage((__IOHIDDevice **)this, 65298, 81);
      if (v75)
      {
        CFDataRef v76 = v75;
        if (CFDataGetLength(v75) == 8)
        {
          *(void *)&long long valuePtr = *(void *)CFDataGetBytePtr(v76);
          CFNumberRef v77 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        }
        else
        {
          CFNumberRef v77 = 0;
        }
        CFRelease(v76);
      }
      else
      {
        CFNumberRef v77 = 0;
      }
      v36 = v77;
      goto LABEL_101;
    }
    if (CFEqual(a2, @"DFRCurve"))
    {
      CFTypeRef v78 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v78) {
        goto LABEL_102;
      }
      if (!*((void *)this + 28)) {
        goto LABEL_102;
      }
      IOHIDTransactionRef v79 = IOHIDTransactionCreate(kCFAllocatorDefault, v78, kIOHIDTransactionDirectionTypeInput, 0);
      if (!v79) {
        goto LABEL_102;
      }
      CFDictionaryRef v80 = v79;
      if (CFArrayGetCount(*((CFArrayRef *)this + 28)) < 1)
      {
        v83 = 0;
        CFIndex v82 = 0;
      }
      else
      {
        CFIndex v81 = 0;
        CFIndex v82 = 0;
        v83 = 0;
        do
        {
          ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 28), v81);
          CFTypeID TypeID = IOHIDElementGetTypeID();
          if (TypeID == CFGetTypeID(ValueAtIndex))
          {
            if (IOHIDElementGetUsage(ValueAtIndex) == 72
              && IOHIDElementGetUsagePage(ValueAtIndex) == 65298
              && IOHIDElementGetType(ValueAtIndex) == kIOHIDElementTypeFeature)
            {
              uint32_t ReportCount = IOHIDElementGetReportCount(ValueAtIndex);
              if (!v83 && ReportCount >= 2) {
                v83 = ValueAtIndex;
              }
            }
            if (IOHIDElementGetUsage(ValueAtIndex) == 71
              && IOHIDElementGetUsagePage(ValueAtIndex) == 65298
              && IOHIDElementGetType(ValueAtIndex) == kIOHIDElementTypeFeature)
            {
              uint32_t v88 = IOHIDElementGetReportCount(ValueAtIndex);
              if (!v82 && v88 >= 2) {
                CFIndex v82 = ValueAtIndex;
              }
            }
          }
          ++v81;
        }
        while (CFArrayGetCount(*((CFArrayRef *)this + 28)) > v81);
      }
      if (AppleUSBALS::addElementToTransaction(this, v80, v83)
        || AppleUSBALS::addElementToTransaction(this, v80, v82)
        || (int v105 = AppleUSBALS::getElement(this, 65298, 68, kIOHIDElementTypeFeature),
            AppleUSBALS::addElementToTransaction(this, v80, v105))
        || (v106 = AppleUSBALS::getElement(this, 65298, 69, kIOHIDElementTypeFeature),
            AppleUSBALS::addElementToTransaction(this, v80, v106))
        || IOHIDTransactionCommit(v80)
        || (CFMutableDictionaryRef v118 = CFDictionaryCreateMutable(kCFAllocatorDefault, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) == 0)
      {
        CFTypeRef v107 = 0;
      }
      else
      {
        v119 = v118;
        uint64_t LogicalMin = 0;
        CFIndex capacity = 0;
        double v120 = AppleUSBALS::getElement(this, 65298, 69, kIOHIDElementTypeFeature);
        CFTypeRef v107 = 0;
        if (!AppleUSBALS::getElementIntValueFromTransaction(v120, v80, v120, &capacity))
        {
          v121 = AppleUSBALS::getElement(this, 65298, 68, kIOHIDElementTypeFeature);
          CFTypeRef v107 = 0;
          if (!AppleUSBALS::getElementIntValueFromTransaction(v121, v80, v121, &LogicalMin)
            && capacity
            && capacity <= 12)
          {
            CFNumberRef v122 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &capacity);
            if (v122)
            {
              CFNumberRef v123 = v122;
              CFDictionarySetValue(v119, @"Count", v122);
              CFRelease(v123);
            }
            CFNumberRef v124 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &LogicalMin);
            if (v124)
            {
              CFNumberRef v125 = v124;
              CFDictionarySetValue(v119, @"Type", v124);
              CFRelease(v125);
            }
            CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, capacity, &kCFTypeArrayCallBacks);
            CFMutableArrayRef v127 = CFArrayCreateMutable(kCFAllocatorDefault, capacity, &kCFTypeArrayCallBacks);
            v128 = v127;
            CFTypeRef v107 = 0;
            if (Mutable && v127)
            {
              long long valuePtr = 0u;
              long long v153 = 0u;
              long long v154 = 0u;
              *(_OWORD *)values = 0u;
              long long v150 = 0u;
              long long v151 = 0u;
              double v129 = IOHIDTransactionGetValue(v80, v82, 0);
              if (v129)
              {
                double v130 = v129;
                unint64_t Length = IOHIDValueGetLength(v129);
                if (capacity <= Length >> 2)
                {
                  if (IOHIDValueGetBytePtr(v130))
                  {
                    BytePtr = IOHIDValueGetBytePtr(v130);
                    CFIndex v133 = capacity;
                    memcpy(values, BytePtr, 4 * capacity);
                    if (v133 >= 1)
                    {
                      CFIndex v134 = 0;
                      do
                      {
                        *(float *)&uint64_t v146 = (float)*((int *)values + v134) / 1000.0;
                        CFNumberRef v135 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &v146);
                        if (v135)
                        {
                          CFNumberRef v136 = v135;
                          CFArraySetValueAtIndex(v128, v134, v135);
                          CFRelease(v136);
                        }
                        ++v134;
                      }
                      while (capacity > v134);
                    }
                  }
                }
              }
              uint64_t v137 = IOHIDTransactionGetValue(v80, v83, 0);
              if (v137)
              {
                v138 = v137;
                unint64_t v139 = IOHIDValueGetLength(v137);
                if (capacity <= v139 >> 2)
                {
                  if (IOHIDValueGetBytePtr(v138))
                  {
                    v140 = IOHIDValueGetBytePtr(v138);
                    CFIndex v141 = capacity;
                    memcpy(&valuePtr, v140, 4 * capacity);
                    if (v141 >= 1)
                    {
                      CFIndex v142 = 0;
                      do
                      {
                        *(float *)&uint64_t v146 = (float)*((int *)&valuePtr + v142) / 1000.0;
                        CFNumberRef v143 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &v146);
                        if (v143)
                        {
                          CFNumberRef v144 = v143;
                          CFArraySetValueAtIndex(Mutable, v142, v143);
                          CFRelease(v144);
                        }
                        ++v142;
                      }
                      while (capacity > v142);
                    }
                  }
                }
              }
              CFDictionarySetValue(v119, @"L", Mutable);
              CFDictionarySetValue(v119, @"E", v128);
              CFTypeRef v107 = CFRetain(v119);
            }
            if (Mutable) {
              CFRelease(Mutable);
            }
            if (v128) {
              CFRelease(v128);
            }
          }
        }
        CFRelease(v119);
      }
      CFRelease(v80);
      v36 = v107;
      goto LABEL_101;
    }
    if (!CFEqual(a2, @"DFRWhitepoint"))
    {
      if (!CFEqual(a2, @"DFRProtocolVersion")) {
        goto LABEL_102;
      }
      v97 = AppleUSBALS::getElement(this, 65298, 64, kIOHIDElementTypeFeature);
      if (!v97) {
        goto LABEL_102;
      }
      v98 = v97;
      v99 = AppleUSBALS::getElement(this, 65298, 64, kIOHIDElementTypeFeature);
      CFIndex capacity = IOHIDElementGetLogicalMax(v99);
      int v100 = AppleUSBALS::getElement(this, 65298, 64, kIOHIDElementTypeFeature);
      uint64_t v146 = 0;
      uint64_t LogicalMin = IOHIDElementGetLogicalMin(v100);
      ElementIntCFNumberRef Value = AppleUSBALS::getElementIntValue(this, v98, &v146);
      v36 = 0;
      if (!ElementIntValue)
      {
        long long valuePtr = *(_OWORD *)off_145E8;
        *(void *)&long long v153 = @"value";
        CFNumberRef v102 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &capacity);
        values[0] = v102;
        CFNumberRef v103 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &LogicalMin);
        values[1] = v103;
        CFNumberRef v104 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &v146);
        v36 = 0;
        *(void *)&long long v150 = v104;
        if (v102 && v103 && v104)
        {
          v36 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&valuePtr, (const void **)values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFNumberRef v102 = (CFNumberRef)values[0];
        }
        if (v102) {
          CFRelease(v102);
        }
        if (values[1]) {
          CFRelease(values[1]);
        }
        v37 = (__IOHIDTransaction *)v150;
        if ((void)v150) {
          goto LABEL_68;
        }
      }
      goto LABEL_101;
    }
    v90 = (__IOHIDDevice *)*((void *)this + 18);
    if (!v90) {
      goto LABEL_102;
    }
    if (!*((void *)this + 28)) {
      goto LABEL_102;
    }
    IOHIDTransactionRef v91 = IOHIDTransactionCreate(kCFAllocatorDefault, v90, kIOHIDTransactionDirectionTypeInput, 0);
    if (!v91) {
      goto LABEL_102;
    }
    v92 = v91;
    v93 = AppleUSBALS::getElement(this, 65298, 96, kIOHIDElementTypeFeature);
    v94 = AppleUSBALS::getElement(this, 65298, 97, kIOHIDElementTypeFeature);
    if (!v93 || (v95 = v94) == 0)
    {
      v108 = *((void *)this + 7);
      if (!v108)
      {
        v108 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v108 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
        sub_100B0();
      }
      goto LABEL_303;
    }
    IOHIDTransactionAddElement(v92, v93);
    IOHIDTransactionAddElement(v92, v95);
    if (IOHIDTransactionCommit(v92))
    {
      v96 = *((void *)this + 7);
      if (!v96)
      {
        v96 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v96 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        sub_10048();
      }
LABEL_303:
      double v117 = 0;
LABEL_304:
      CFRelease(v92);
      v36 = v117;
      goto LABEL_101;
    }
    *(void *)&long long valuePtr = 0;
    values[0] = 0;
    v109 = IOHIDTransactionGetValue(v92, v93, 0);
    if (!AppleUSBALS::retrieveScaledValue(this, v109, (double *)&valuePtr)
      || (BOOL v110 = IOHIDTransactionGetValue(v92, v95, 0), !AppleUSBALS::retrieveScaledValue(this, v110, (double *)values)))
    {
      double v116 = *((void *)this + 7);
      if (!v116)
      {
        double v116 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v116 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        sub_10014();
      }
      goto LABEL_303;
    }
    CFNumberRef v111 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &valuePtr);
    CFNumberRef v112 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, values);
    CFNumberRef v113 = v112;
    if (v111 && v112)
    {
      CFNumberRef v114 = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFNumberRef v115 = v114;
      if (v114)
      {
        CFDictionarySetValue(v114, @"Target_x", v111);
        CFDictionarySetValue(v115, @"Target_y", v113);
      }
    }
    else
    {
      CFNumberRef v115 = 0;
      double v117 = 0;
      if (!v111) {
        goto LABEL_307;
      }
    }
    CFRelease(v111);
    double v117 = v115;
LABEL_307:
    if (v113) {
      CFRelease(v113);
    }
    goto LABEL_304;
  }
  *(void *)&long long valuePtr = 0;
  v36 = 0;
  if (!AppleUSBALS::getElementIntValue(this, *((__IOHIDElement **)this + 23), (uint64_t *)&valuePtr))
  {
    float v74 = 0.0;
    if ((void)valuePtr == 2) {
      float v74 = 1.0;
    }
    *(float *)values = v74;
    CFAllocatorRef v26 = kCFAllocatorDefault;
    p_long long valuePtr = values;
    goto LABEL_216;
  }
LABEL_101:
  if (v36) {
    return v36;
  }
LABEL_102:
  CFDictionaryRef v49 = (const __CFDictionary *)*((void *)this + 30);
  if (!v49) {
    return 0;
  }
  v36 = CFDictionaryGetValue(v49, a2);
  CFNumberRef v50 = *((void *)this + 7);
  if (!v50)
  {
    CFNumberRef v50 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFNumberRef v50 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    sub_FFAC();
    if (!v36) {
      return v36;
    }
    goto LABEL_108;
  }
  if (v36) {
LABEL_108:
  }
    CFRetain(v36);
  return v36;
}

uint64_t AppleUSBALS::getModifiedUsage(AppleUSBALS *this, int a2, int a3)
{
  return a2 | (a3 << 12);
}

uint64_t AppleUSBALS::getFloatValueForUsage(AppleUSBALS *this, int a2, int a3, float *a4)
{
  Element = AppleUSBALS::getElement(this, a2, a3, kIOHIDElementTypeFeature);
  if (!Element) {
    return 3758097095;
  }

  return AppleUSBALS::getElementFloatValue(this, Element, a4);
}

uint64_t AppleUSBALS::getIntValueForUsage(AppleUSBALS *this, int a2, int a3, uint64_t *a4)
{
  Element = AppleUSBALS::getElement(this, a2, a3, kIOHIDElementTypeFeature);
  if (!Element) {
    return 3758097095;
  }

  return AppleUSBALS::getElementIntValue(this, Element, a4);
}

uint64_t AppleUSBALS::getElementIntValue(AppleUSBALS *this, __IOHIDElement *a2, uint64_t *a3)
{
  uint64_t Value = 3758097095;
  if (a2)
  {
    float v5 = (__IOHIDDevice *)*((void *)this + 18);
    if (v5)
    {
      puint64_t Value = 0;
      uint64_t Value = IOHIDDeviceGetValue(v5, a2, &pValue);
      if (Value) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = pValue == 0;
      }
      if (v7)
      {
        inited = *((void *)this + 7);
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
          sub_102FC();
        }
      }
      else
      {
        *a3 = IOHIDValueGetIntegerValue(pValue);
        io_object_t v9 = *((void *)this + 7);
        if (!v9)
        {
          io_object_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            io_object_t v9 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_10284();
        }
      }
    }
  }
  return Value;
}

uint64_t AppleUSBALS::getElementFloatValue(AppleUSBALS *this, __IOHIDElement *a2, float *a3)
{
  uint64_t Value = 3758097095;
  if (a2)
  {
    float v5 = (__IOHIDDevice *)*((void *)this + 18);
    if (v5)
    {
      puint64_t Value = 0;
      uint64_t Value = IOHIDDeviceGetValue(v5, a2, &pValue);
      if (Value) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = pValue == 0;
      }
      if (!v8)
      {
        inited = *((void *)this + 7);
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
          sub_10378(a2, inited);
        }
        if (IOHIDElementGetUnitExponent(a2))
        {
          Integeruint64_t Value = (double)IOHIDValueGetIntegerValue(pValue);
          uint32_t UnitExponent = IOHIDElementGetUnitExponent(a2);
          double UnscaledValueWithExponent = AppleUSBALS::getUnscaledValueWithExponent(this, IntegerValue, UnitExponent);
        }
        else
        {
          double UnscaledValueWithExponent = IOHIDValueGetScaledValue(pValue, 1u);
        }
        float v13 = UnscaledValueWithExponent;
        *a3 = v13;
      }
      double v14 = *((void *)this + 7);
      if (!v14)
      {
        double v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v14 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        double v16 = *a3;
        *(_DWORD *)buf = 134218496;
        IOHIDValueRef v19 = pValue;
        __int16 v20 = 2048;
        double v21 = v16;
        __int16 v22 = 1024;
        BOOL v23 = Value == 0;
        _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "value=%p ret=%f success=%d", buf, 0x1Cu);
      }
    }
  }
  return Value;
}

__IOHIDDevice *AppleUSBALS::copyDataForUsage(__IOHIDDevice **this, int a2, int a3)
{
  BOOL result = AppleUSBALS::getElement((AppleUSBALS *)this, a2, a3, kIOHIDElementTypeFeature);
  if (result)
  {
    float v5 = result;
    BOOL result = this[18];
    if (result)
    {
      pIOReturn Value = 0;
      IOReturn Value = IOHIDDeviceGetValue(result, v5, &pValue);
      BOOL result = 0;
      if (Value) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = pValue == 0;
      }
      if (!v7)
      {
        BytePtr = IOHIDValueGetBytePtr(pValue);
        CFIndex Length = IOHIDValueGetLength(pValue);
        return CFDataCreate(kCFAllocatorDefault, BytePtr, Length);
      }
    }
  }
  return result;
}

uint64_t AppleUSBALS::addElementToTransaction(AppleUSBALS *this, __IOHIDTransaction *a2, __IOHIDElement *a3)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_10400();
  }
  uint64_t result = 3758097090;
  if (a2)
  {
    if (a3)
    {
      IOHIDTransactionAddElement(a2, a3);
      return 0;
    }
  }
  return result;
}

uint64_t AppleUSBALS::getElementIntValueFromTransaction(AppleUSBALS *this, IOHIDTransactionRef transaction, IOHIDElementRef element, uint64_t *a4)
{
  uint64_t result = 3758097090;
  if (transaction && element && a4)
  {
    IOReturn Value = IOHIDTransactionGetValue(transaction, element, 0);
    if (Value)
    {
      IntegerIOReturn Value = IOHIDValueGetIntegerValue(Value);
      uint64_t result = 0;
      *a4 = IntegerValue;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

BOOL AppleUSBALS::setProperty(AppleUSBALS *this, const __CFString *a2, const void *a3)
{
  BOOL v3 = 0;
  if (!a2 || !a3) {
    return v3;
  }
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_10B84();
  }
  if (CFEqual(a2, @"AmbientLightControlPreferences"))
  {
    CFTypeID v8 = CFGetTypeID(a3);
    if (v8 == CFDictionaryGetTypeID())
    {
      AppleUSBALS::setKeyboardPreferences((NSObject **)this, (CFDictionaryRef)a3, 1);
      AppleUSBALS::setDisplayPreferences((NSObject **)this, (CFDictionaryRef)a3, 1);
      return 1;
    }
  }
  if (CFEqual(a2, @"ReportInterval"))
  {
    valuePtr[0] = 0;
    CFTypeID v9 = CFGetTypeID(a3);
    if (v9 == CFNumberGetTypeID() && CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, valuePtr))
    {
      unsigned int v10 = valuePtr[0] / 0x3E8;
      valuePtr[0] /= 0x3E8u;
      int v11 = *((void *)this + 7);
      if (!v11)
      {
        int v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT)
        {
          int v11 = init_default_corebrightness_log();
          unsigned int v10 = valuePtr[0];
        }
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        buf[0] = 67109120;
        buf[1] = v10;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Setting %u ms report interval", (uint8_t *)buf, 8u);
        unsigned int v10 = valuePtr[0];
      }
      Element = AppleUSBALS::getElement(this, 32, 782, kIOHIDElementTypeFeature);
      if (!AppleUSBALS::setElementIntValue((IOHIDDeviceRef *)this, Element, v10)) {
        return 1;
      }
      float v13 = *((void *)this + 7);
      if (!v13)
      {
        float v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          float v13 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10B50();
      }
    }
    return 0;
  }
  if (CFEqual(a2, @"BatchInterval")) {
    return 1;
  }
  if (CFEqual(a2, @"SensorPowerState"))
  {
    if (*((_DWORD *)this + 22) == 257)
    {
      double v14 = *((void *)this + 7);
      if (!v14)
      {
        double v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          double v14 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10AAC();
      }
      return 0;
    }
    uint64_t v16 = mach_absolute_time();
    CFTypeID v17 = CFGetTypeID(a3);
    if (v17 == CFNumberGetTypeID())
    {
      buf[0] = 0;
      if (CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, buf))
      {
        if ((buf[0] - 2129) <= 4)
        {
          double v18 = IOHIDTransactionCreate(kCFAllocatorDefault, *((IOHIDDeviceRef *)this + 18), kIOHIDTransactionDirectionTypeOutput, 0);
          if (v18)
          {
            for (int i = 2128; i != 2134; ++i)
            {
              __int16 v20 = AppleUSBALS::getElement(this, 32, i, kIOHIDElementTypeFeature);
              if (v20)
              {
                double v21 = IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, v20, v16, i == buf[0]);
                if (v21)
                {
                  IOHIDTransactionAddElement(v18, v20);
                  IOHIDTransactionSetValue(v18, v20, v21, 0);
                  CFRelease(v21);
                }
              }
            }
            BOOL v3 = IOHIDTransactionCommit(v18) == 0;
            CFRelease(v18);
          }
          else
          {
            BOOL v3 = 0;
          }
          v37 = *((void *)this + 7);
          if (!v37)
          {
            v37 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v37 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            sub_10AE0((uint64_t)buf, v37, v38, v39, v40, v41, v42, v43);
          }
          return v3;
        }
      }
    }
    return 0;
  }
  if (!CFEqual(a2, @"SensorReportingState"))
  {
    if (CFEqual(a2, @"SensorRelativeSensitivity"))
    {
      CFTypeID v22 = CFGetTypeID(a3);
      if (v22 != CFNumberGetTypeID()) {
        return 0;
      }
      buf[0] = 0;
      if (!CFNumberGetValue((CFNumberRef)a3, kCFNumberFloatType, buf))
      {
        BOOL v44 = *((void *)this + 7);
        if (!v44)
        {
          BOOL v44 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            BOOL v44 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          sub_1096C();
        }
        return 0;
      }
      BOOL v23 = AppleUSBALS::getElement(this, 32, 58577, kIOHIDElementTypeFeature);
      if (!v23) {
        return 0;
      }
      CFAllocatorRef v24 = *((void *)this + 7);
      if (!v24)
      {
        CFAllocatorRef v24 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFAllocatorRef v24 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_109A0((uint64_t)buf);
      }
      ScaledCFNumberRef Value = AppleUSBALS::createScaledValue(this, v23, *(float *)buf);
      if (!ScaledValue) {
        return 0;
      }
      CFAllocatorRef v26 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v26)
      {
        BOOL v3 = 0;
        goto LABEL_523;
      }
      goto LABEL_96;
    }
    if (CFEqual(a2, @"SensorAbsoluteSensitivity"))
    {
      CFTypeID v33 = CFGetTypeID(a3);
      if (v33 != CFNumberGetTypeID()) {
        return 0;
      }
      buf[0] = 0;
      if (!CFNumberGetValue((CFNumberRef)a3, kCFNumberFloatType, buf)) {
        return 0;
      }
      BOOL v23 = AppleUSBALS::getElement(this, 32, 5329, kIOHIDElementTypeFeature);
      if (!v23) {
        return 0;
      }
      io_object_t v34 = *((void *)this + 7);
      if (!v34)
      {
        io_object_t v34 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          io_object_t v34 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        sub_10904((uint64_t)buf);
      }
      ScaledCFNumberRef Value = AppleUSBALS::createScaledValue(this, v23, *(float *)buf);
      if (!ScaledValue) {
        return 0;
      }
      CFAllocatorRef v26 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v26)
      {
        BOOL v3 = 0;
        goto LABEL_523;
      }
      goto LABEL_96;
    }
    if (CFEqual(a2, @"SensorAbsoluteColorSensitivity"))
    {
      CFTypeID v35 = CFGetTypeID(a3);
      if (v35 != CFNumberGetTypeID()) {
        return 0;
      }
      buf[0] = 0;
      if (!CFNumberGetValue((CFNumberRef)a3, kCFNumberFloatType, buf)) {
        return 0;
      }
      BOOL v23 = AppleUSBALS::getElement(this, 32, 5331, kIOHIDElementTypeFeature);
      if (!v23) {
        return 0;
      }
      v36 = *((void *)this + 7);
      if (!v36)
      {
        v36 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v36 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        sub_1089C((uint64_t)buf);
      }
      ScaledCFNumberRef Value = AppleUSBALS::createScaledValue(this, v23, *(float *)buf);
      if (!ScaledValue) {
        return 0;
      }
      CFAllocatorRef v26 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v26)
      {
        BOOL v3 = 0;
        goto LABEL_523;
      }
LABEL_96:
      BOOL v3 = IOHIDDeviceSetValue(v26, v23, ScaledValue) == 0;
      goto LABEL_523;
    }
    if (CFEqual(a2, @"ColorOverride"))
    {
      CFTypeID v45 = CFGetTypeID(a3);
      if (v45 != CFDictionaryGetTypeID()) {
        return 0;
      }
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OverrideValueCCT");
      CFNumberRef v47 = Value;
      if (Value)
      {
        CFTypeID v48 = CFGetTypeID(Value);
        if (v48 == CFNumberGetTypeID()) {
          CFNumberGetValue(v47, kCFNumberDoubleType, (char *)this + 440);
        }
      }
      CFNumberRef v49 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OverrideValueX");
      CFNumberRef v50 = v49;
      if (v49)
      {
        CFTypeID v51 = CFGetTypeID(v49);
        if (v51 == CFNumberGetTypeID()) {
          CFNumberGetValue(v50, kCFNumberDoubleType, (char *)this + 416);
        }
      }
      CFNumberRef v52 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OverrideValueY");
      CFNumberRef v53 = v52;
      if (v52)
      {
        CFTypeID v54 = CFGetTypeID(v52);
        if (v54 == CFNumberGetTypeID()) {
          CFNumberGetValue(v53, kCFNumberDoubleType, (char *)this + 424);
        }
      }
      CFNumberRef v55 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"OverrideValueZ");
      CFNumberRef v56 = v55;
      if (v55)
      {
        CFTypeID v57 = CFGetTypeID(v55);
        if (v57 == CFNumberGetTypeID()) {
          CFNumberGetValue(v56, kCFNumberDoubleType, (char *)this + 432);
        }
      }
      CFNumberRef v58 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Override");
      CFNumberRef v59 = v58;
      if (v58)
      {
        CFTypeID v60 = CFGetTypeID(v58);
        if (v60 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v59, kCFNumberIntType, (char *)this + 409);
        }
        else
        {
          CFTypeID v79 = CFGetTypeID(v59);
          if (v79 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 409) = CFBooleanGetValue(v59) != 0;
          }
        }
      }
      else
      {
        *((unsigned char *)this + 409) = 0;
      }
      CFNumberRef v80 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IgnoreEvents");
      CFNumberRef v81 = v80;
      if (v80)
      {
        CFTypeID v82 = CFGetTypeID(v80);
        if (v82 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v81, kCFNumberIntType, (char *)this + 408);
        }
        else
        {
          CFTypeID v83 = CFGetTypeID(v81);
          if (v83 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 408) = CFBooleanGetValue(v81) != 0;
          }
        }
      }
      else
      {
        *((unsigned char *)this + 408) = 0;
      }
      v84 = *((void *)this + 7);
      if (!v84)
      {
        v84 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v84 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        int v85 = *((unsigned __int8 *)this + 392);
        uint64_t v86 = *((void *)this + 52);
        uint64_t v87 = *((void *)this + 53);
        uint64_t v88 = *((void *)this + 54);
        uint64_t v89 = *((void *)this + 55);
        int v90 = *((unsigned __int8 *)this + 408);
        buf[0] = 67110400;
        buf[1] = v85;
        LOWORD(buf[2]) = 2048;
        *(void *)((char *)&buf[2] + 2) = v86;
        HIWORD(buf[4]) = 2048;
        *(void *)&buf[5] = v87;
        LOWORD(buf[7]) = 2048;
        *(void *)((char *)&buf[7] + 2) = v88;
        HIWORD(buf[9]) = 2048;
        *(void *)&buf[10] = v89;
        __int16 v261 = 1024;
        int v262 = v90;
        _os_log_impl(&dword_0, v84, OS_LOG_TYPE_DEFAULT, "override: %d; override values: X=%f Y=%f Z=%f CCT=%f; ignoreEvents: %d",
          (uint8_t *)buf,
          0x36u);
      }
      IOHIDTransactionRef v91 = (__CFDictionary *)*((void *)this + 30);
      if (v91) {
        CFDictionarySetValue(v91, a2, a3);
      }
LABEL_164:
      (*(void (**)(AppleUSBALS *, const __CFString *, const CFBooleanRef))(*(void *)this + 88))(this, @"InjectEvent", kCFBooleanTrue);
      return 1;
    }
    if (CFEqual(a2, @"LuxOverride"))
    {
      CFTypeID v68 = CFGetTypeID(a3);
      if (v68 != CFDictionaryGetTypeID()) {
        return 0;
      }
      CFNumberRef v69 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Value");
      CFNumberRef v70 = v69;
      if (v69)
      {
        CFTypeID v71 = CFGetTypeID(v69);
        if (v71 == CFNumberGetTypeID()) {
          CFNumberGetValue(v70, kCFNumberDoubleType, (char *)this + 400);
        }
      }
      CFNumberRef v72 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Override");
      CFNumberRef v73 = v72;
      if (v72)
      {
        CFTypeID v74 = CFGetTypeID(v72);
        if (v74 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v73, kCFNumberIntType, (char *)this + 392);
        }
        else
        {
          CFTypeID v94 = CFGetTypeID(v73);
          if (v94 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 392) = CFBooleanGetValue(v73) != 0;
          }
        }
      }
      else
      {
        *((unsigned char *)this + 392) = 0;
      }
      CFNumberRef v95 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"IgnoreEvents");
      CFNumberRef v96 = v95;
      if (v95)
      {
        CFTypeID v97 = CFGetTypeID(v95);
        if (v97 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v96, kCFNumberIntType, (char *)this + 408);
        }
        else
        {
          CFTypeID v98 = CFGetTypeID(v96);
          if (v98 == CFBooleanGetTypeID()) {
            *((unsigned char *)this + 408) = CFBooleanGetValue(v96) != 0;
          }
        }
      }
      else
      {
        *((unsigned char *)this + 408) = 0;
      }
      v99 = *((void *)this + 7);
      if (!v99)
      {
        v99 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v99 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      {
        int v100 = *((unsigned __int8 *)this + 392);
        unsigned int v101 = *((double *)this + 50);
        int v102 = *((unsigned __int8 *)this + 408);
        buf[0] = 67109632;
        buf[1] = v100;
        LOWORD(buf[2]) = 1024;
        *(_DWORD *)((char *)&buf[2] + 2) = v101;
        HIWORD(buf[3]) = 1024;
        uint8_t buf[4] = v102;
        _os_log_impl(&dword_0, v99, OS_LOG_TYPE_DEFAULT, "override: %d; override with value: %u; ignoreEvents: %d",
          (uint8_t *)buf,
          0x14u);
      }
      CFNumberRef v103 = (__CFDictionary *)*((void *)this + 30);
      if (v103) {
        CFDictionarySetValue(v103, a2, a3);
      }
      goto LABEL_164;
    }
    if (CFEqual(a2, @"InjectEvent"))
    {
      uint64_t v75 = 400;
      if (!*((unsigned char *)this + 392)) {
        uint64_t v75 = 328;
      }
      *(void *)buf = *(void *)((char *)this + v75);
      CFTypeID v76 = CFGetTypeID(a3);
      if (v76 == CFNumberGetTypeID()) {
        CFNumberGetValue((CFNumberRef)a3, kCFNumberDoubleType, buf);
      }
      BOOL v77 = *((unsigned char *)this + 409) == 0;
      double v78 = *(double *)buf;
      mach_absolute_time();
      if (v77) {
        AppleUSBALS::dispatchAmbientLightSensorEvent(this, v78, *((double *)this + 42), *((double *)this + 43), *((double *)this + 44), *((double *)this + 45));
      }
      else {
        AppleUSBALS::dispatchAmbientLightSensorEvent(this, v78, *((double *)this + 52), *((double *)this + 53), *((double *)this + 54), *((double *)this + 55));
      }
      return 1;
    }
    if (CFEqual(a2, @"kUSBContainerID"))
    {
      CFTypeID v92 = CFGetTypeID(a3);
      if (v92 != CFStringGetTypeID()) {
        return 0;
      }
      CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 30), @"kUSBContainerID", a3);
      v93 = *((void *)this + 7);
      if (!v93)
      {
        v93 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v93 = init_default_corebrightness_log();
        }
      }
      BOOL v3 = 0;
      if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 138543362;
        *(void *)&buf[1] = a3;
        _os_log_impl(&dword_0, v93, OS_LOG_TYPE_DEFAULT, "override container ID: %{public}@", (uint8_t *)buf, 0xCu);
        return 0;
      }
      return v3;
    }
    if (!*((unsigned char *)this + 80)) {
      return 0;
    }
    if (CFEqual(a2, @"DFRNits"))
    {
      CFNumberRef v104 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v104) {
        return 0;
      }
      int v105 = IOHIDTransactionCreate(kCFAllocatorDefault, v104, kIOHIDTransactionDirectionTypeOutput, 0);
      if (!v105) {
        return 0;
      }
      v106 = AppleUSBALS::getElement(this, 65298, 16, kIOHIDElementTypeFeature);
      AppleUSBALS::addElementValueToTransaction(this, v105, v106, 2);
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        buf[0] = 0;
        if (CFNumberGetValue((CFNumberRef)a3, kCFNumberFloat32Type, buf))
        {
          v108 = AppleUSBALS::getElement(this, 65298, 17, kIOHIDElementTypeFeature);
          AppleUSBALS::addElementValueToTransaction(this, v105, v108, (uint64_t)(float)(*(float *)buf * 1000.0));
        }
      }
      else
      {
        CFTypeID v118 = CFDictionaryGetTypeID();
        if (v118 == CFGetTypeID(a3))
        {
          buf[0] = 0;
          valuePtr[0] = 0;
          CFNumberRef v119 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Brightness");
          if (v119)
          {
            CFTypeID v120 = CFNumberGetTypeID();
            if (v120 == CFGetTypeID(v119))
            {
              CFNumberGetValue(v119, kCFNumberFloat32Type, buf);
              v121 = AppleUSBALS::getElement(this, 65298, 17, kIOHIDElementTypeFeature);
              AppleUSBALS::addElementValueToTransaction(this, v105, v121, (uint64_t)(float)(*(float *)buf * 1000.0));
            }
          }
          CFNumberRef v122 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
          if (v122)
          {
            CFTypeID v123 = CFNumberGetTypeID();
            if (v123 == CFGetTypeID(v122))
            {
              CFNumberGetValue(v122, kCFNumberFloat32Type, valuePtr);
              CFNumberRef v124 = AppleUSBALS::getElement(this, 65298, 19, kIOHIDElementTypeFeature);
              AppleUSBALS::addElementValueToTransaction(this, v105, v124, (uint64_t)(float)(*(float *)valuePtr * 1000.0));
            }
          }
        }
      }
      goto LABEL_232;
    }
    if (CFEqual(a2, @"DFRDisplayState"))
    {
      v109 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v109) {
        return 0;
      }
      if (!*((void *)this + 23)) {
        return 0;
      }
      BOOL v110 = IOHIDTransactionCreate(kCFAllocatorDefault, v109, kIOHIDTransactionDirectionTypeOutput, 0);
      if (!v110) {
        return 0;
      }
      CFNumberRef v111 = *((void *)this + 7);
      if (!v111)
      {
        CFNumberRef v111 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFNumberRef v111 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 138543362;
        *(void *)&buf[1] = a3;
        _os_log_impl(&dword_0, v111, OS_LOG_TYPE_DEFAULT, "display state input: %{public}@", (uint8_t *)buf, 0xCu);
      }
      *(void *)buf = 0;
      *(void *)&buf[2] = buf;
      *(void *)&uint8_t buf[4] = 0x2000000000;
      *(void *)&buf[6] = 0;
      CFTypeID v112 = CFNumberGetTypeID();
      if (v112 == CFGetTypeID(a3))
      {
        if (CFNumberGetValue((CFNumberRef)a3, kCFNumberLongType, (void *)(*(void *)&buf[2] + 24))) {
          AppleUSBALS::addElementValueToTransaction(this, v110, *((__IOHIDElement **)this + 23), *(void *)(*(void *)&buf[2] + 24));
        }
      }
      else
      {
        CFTypeID v129 = CFDictionaryGetTypeID();
        if (v129 == CFGetTypeID(a3))
        {
          valuePtr[0] = 0;
          CFNumberRef v130 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"State");
          if (v130)
          {
            CFTypeID v131 = CFNumberGetTypeID();
            if (v131 == CFGetTypeID(v130))
            {
              if (CFNumberGetValue(v130, kCFNumberLongType, (void *)(*(void *)&buf[2] + 24)))
              {
                AppleUSBALS::addElementValueToTransaction(this, v110, *((__IOHIDElement **)this + 23), *(void *)(*(void *)&buf[2] + 24));
                double v132 = *((void *)this + 7);
                if (!v132)
                {
                  double v132 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    double v132 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
                {
                  uint32_t ReportID = IOHIDElementGetReportID(*((IOHIDElementRef *)this + 23));
                  sub_10854(v258, ReportID, v132);
                }
              }
            }
          }
          CFNumberRef v134 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
          if (v134)
          {
            CFTypeID v135 = CFNumberGetTypeID();
            if (v135 == CFGetTypeID(v134))
            {
              CFNumberGetValue(v134, kCFNumberFloat32Type, valuePtr);
              AppleUSBALS::addElementValueToTransaction(this, v110, *((__IOHIDElement **)this + 24), (uint64_t)(float)(*(float *)valuePtr * 1000.0));
              CFNumberRef v136 = *((void *)this + 7);
              if (!v136)
              {
                CFNumberRef v136 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  CFNumberRef v136 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
              {
                uint32_t v137 = IOHIDElementGetReportID(*((IOHIDElementRef *)this + 24));
                sub_1080C(v257, v137, v136);
              }
            }
          }
        }
        else
        {
          CFIndex v142 = *((void *)this + 7);
          if (!v142)
          {
            CFIndex v142 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFIndex v142 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
            sub_107D8();
          }
        }
      }
      if (*(void *)(*(void *)&buf[2] + 24) == 2)
      {
        if (notify_is_valid_token(*((_DWORD *)this + 81)))
        {
          notify_set_state(*((_DWORD *)this + 81), 2uLL);
          notify_post("com.apple.DFRBrightness.displayStateUpdate");
        }
        else
        {
          CFNumberRef v143 = *((void *)this + 7);
          if (!v143)
          {
            CFNumberRef v143 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFNumberRef v143 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
            sub_10654();
          }
        }
      }
      CFNumberRef v144 = *((void *)this + 7);
      if (!v144)
      {
        CFNumberRef v144 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFNumberRef v144 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v145 = *(void *)(*(void *)&buf[2] + 24);
        valuePtr[0] = 134217984;
        *(void *)&valuePtr[1] = v145;
        _os_log_impl(&dword_0, v144, OS_LOG_TYPE_DEFAULT, "setting DFR state = %lu", (uint8_t *)valuePtr, 0xCu);
      }
      if (*((void *)this + 8))
      {
        CFRetain(v110);
        uint64_t v146 = *((void *)this + 8);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_D5E0;
        block[3] = &unk_14608;
        block[4] = buf;
        block[5] = this;
        block[6] = v110;
        dispatch_async(v146, block);
        BOOL v3 = 1;
      }
      else
      {
        v147 = *((void *)this + 7);
        if (!v147)
        {
          v147 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v147 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG)) {
          sub_10764();
        }
        kdebug_trace();
        IOReturn v148 = IOHIDTransactionCommit(v110);
        if (v148)
        {
          v149 = *((void *)this + 7);
          if (!v149)
          {
            v149 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v149 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR)) {
            sub_106FC();
          }
          BOOL v3 = 0;
        }
        else
        {
          BOOL v3 = 1;
        }
        v156 = *((void *)this + 7);
        if (!v156)
        {
          v156 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v156 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG)) {
          sub_10688();
        }
        kdebug_trace();
        if (!v148 && *(void *)(*(void *)&buf[2] + 24) == 1)
        {
          if (notify_is_valid_token(*((_DWORD *)this + 81)))
          {
            notify_set_state(*((_DWORD *)this + 81), 1uLL);
            notify_post("com.apple.DFRBrightness.displayStateUpdate");
          }
          else
          {
            v212 = *((void *)this + 7);
            if (!v212)
            {
              v212 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v212 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR)) {
              sub_10654();
            }
          }
        }
      }
      _Block_object_dispose(buf, 8);
      CFRelease(v110);
      return v3;
    }
    if (CFEqual(a2, @"DFRDisplayFactor"))
    {
      CFNumberRef v113 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v113) {
        return 0;
      }
      if (!*((void *)this + 23)) {
        return 0;
      }
      CFNumberRef v114 = IOHIDTransactionCreate(kCFAllocatorDefault, v113, kIOHIDTransactionDirectionTypeOutput, 0);
      if (!v114) {
        return 0;
      }
      CFNumberRef v115 = *((void *)this + 7);
      if (!v115)
      {
        CFNumberRef v115 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFNumberRef v115 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        buf[0] = 138543362;
        *(void *)&buf[1] = a3;
        _os_log_impl(&dword_0, v115, OS_LOG_TYPE_DEFAULT, "display factor input: %{public}@", (uint8_t *)buf, 0xCu);
      }
      *(void *)buf = 0;
      *(void *)&buf[2] = buf;
      *(void *)&uint8_t buf[4] = 0x2000000000;
      *(void *)&buf[6] = 0;
      CFTypeID v116 = CFNumberGetTypeID();
      if (v116 == CFGetTypeID(a3))
      {
        valuePtr[0] = 0;
        if (CFNumberGetValue((CFNumberRef)a3, kCFNumberFloat32Type, valuePtr))
        {
          if (*(float *)valuePtr <= 0.0) {
            CFIndex v117 = 1;
          }
          else {
            CFIndex v117 = 2;
          }
          *(void *)(*(void *)&buf[2] + 24) = v117;
          AppleUSBALS::addElementValueToTransaction(this, v114, *((__IOHIDElement **)this + 23), v117);
        }
      }
      else
      {
        CFTypeID v150 = CFDictionaryGetTypeID();
        if (v150 == CFGetTypeID(a3))
        {
          valuePtr[0] = 0;
          CFNumberRef v151 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Factor");
          if (v151)
          {
            CFTypeID v152 = CFNumberGetTypeID();
            if (v152 == CFGetTypeID(v151))
            {
              *(float *)v258 = 0.0;
              if (CFNumberGetValue(v151, kCFNumberFloat32Type, v258))
              {
                if (*(float *)v258 <= 0.0) {
                  CFIndex v153 = 1;
                }
                else {
                  CFIndex v153 = 2;
                }
                *(void *)(*(void *)&buf[2] + 24) = v153;
                AppleUSBALS::addElementValueToTransaction(this, v114, *((__IOHIDElement **)this + 23), v153);
              }
            }
          }
          CFNumberRef v154 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
          if (v154)
          {
            CFTypeID v155 = CFNumberGetTypeID();
            if (v155 == CFGetTypeID(v154))
            {
              CFNumberGetValue(v154, kCFNumberFloat32Type, valuePtr);
              AppleUSBALS::addElementValueToTransaction(this, v114, *((__IOHIDElement **)this + 24), (uint64_t)(float)(*(float *)valuePtr * 1000.0));
            }
          }
        }
        else
        {
          v184 = *((void *)this + 7);
          if (!v184)
          {
            v184 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v184 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR)) {
            sub_107D8();
          }
        }
      }
      v185 = *((void *)this + 7);
      if (!v185)
      {
        v185 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v185 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v186 = *(void *)(*(void *)&buf[2] + 24);
        valuePtr[0] = 134217984;
        *(void *)&valuePtr[1] = v186;
        _os_log_impl(&dword_0, v185, OS_LOG_TYPE_DEFAULT, "setting DFR state = %lu", (uint8_t *)valuePtr, 0xCu);
      }
      if (*(void *)(*(void *)&buf[2] + 24) == 2)
      {
        if (notify_is_valid_token(*((_DWORD *)this + 81)))
        {
          notify_set_state(*((_DWORD *)this + 81), 2uLL);
          notify_post("com.apple.DFRBrightness.displayStateUpdate");
        }
        else
        {
          v187 = *((void *)this + 7);
          if (!v187)
          {
            v187 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v187 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR)) {
            sub_10654();
          }
        }
      }
      if (*((void *)this + 8))
      {
        CFRetain(v114);
        v188 = *((void *)this + 8);
        v254[0] = _NSConcreteStackBlock;
        v254[1] = 0x40000000;
        v254[2] = sub_D7A4;
        v254[3] = &unk_14630;
        v254[4] = buf;
        v254[5] = this;
        v254[6] = v114;
        dispatch_async(v188, v254);
        BOOL v3 = 1;
      }
      else
      {
        v189 = *((void *)this + 7);
        if (!v189)
        {
          v189 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v189 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG)) {
          sub_10764();
        }
        kdebug_trace();
        IOReturn v190 = IOHIDTransactionCommit(v114);
        if (v190)
        {
          v191 = *((void *)this + 7);
          if (!v191)
          {
            v191 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v191 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR)) {
            sub_106FC();
          }
          BOOL v3 = 0;
        }
        else
        {
          BOOL v3 = 1;
        }
        v192 = *((void *)this + 7);
        if (!v192)
        {
          v192 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v192 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v192, OS_LOG_TYPE_DEBUG)) {
          sub_10688();
        }
        kdebug_trace();
        if (!v190 && *(void *)(*(void *)&buf[2] + 24) == 1)
        {
          if (notify_is_valid_token(*((_DWORD *)this + 81)))
          {
            notify_set_state(*((_DWORD *)this + 81), 1uLL);
            notify_post("com.apple.DFRBrightness.displayStateUpdate");
          }
          else
          {
            v217 = *((void *)this + 7);
            if (!v217)
            {
              v217 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v217 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR)) {
              sub_10654();
            }
          }
        }
      }
      _Block_object_dispose(buf, 8);
      CFRelease(v114);
      return v3;
    }
    if (CFEqual(a2, @"DFRAutoBrightness"))
    {
      CFTypeID v125 = CFNumberGetTypeID();
      if (v125 != CFGetTypeID(a3)) {
        return 0;
      }
      buf[0] = 0;
      if (!CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, buf)) {
        return 0;
      }
      v126 = IOHIDTransactionCreate(kCFAllocatorDefault, *((IOHIDDeviceRef *)this + 18), kIOHIDTransactionDirectionTypeOutput, 0);
      if (!v126) {
        return 0;
      }
      CFMutableArrayRef v127 = AppleUSBALS::getElement(this, 65298, 65, kIOHIDElementTypeFeature);
      if (buf[0]) {
        CFIndex v128 = 2;
      }
      else {
        CFIndex v128 = 1;
      }
      AppleUSBALS::addElementValueToTransaction(this, v126, v127, v128);
      BOOL v3 = IOHIDTransactionCommit(v126) == 0;
      CFRelease(v126);
      return v3;
    }
    if (CFEqual(a2, @"DFRDimmingStep"))
    {
      CFTypeID v138 = CFNumberGetTypeID();
      if (v138 == CFGetTypeID(a3))
      {
        unint64_t v139 = (__IOHIDDevice *)*((void *)this + 18);
        if (!v139) {
          return 0;
        }
        if (!*((void *)this + 19)) {
          return 0;
        }
        v140 = IOHIDTransactionCreate(kCFAllocatorDefault, v139, kIOHIDTransactionDirectionTypeOutput, 0);
        if (!v140) {
          return 0;
        }
        valuePtr[0] = 0;
        BOOL v3 = 0;
        if (CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, valuePtr) && valuePtr[0])
        {
          AppleUSBALS::addElementValueToTransaction(this, v140, *((__IOHIDElement **)this + 21), 1);
          AppleUSBALS::addElementValueToTransaction(this, v140, *((__IOHIDElement **)this + 19), valuePtr[0]);
          CFIndex v141 = *((void *)this + 7);
          if (!v141)
          {
            CFIndex v141 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFIndex v141 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG)) {
            sub_105E0();
          }
          kdebug_trace();
          if (IOHIDTransactionCommit(v140))
          {
            BOOL v3 = 0;
          }
          else
          {
            v228 = *((void *)this + 7);
            if (!v228)
            {
              v228 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v228 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
            {
              buf[0] = 67109120;
              buf[1] = valuePtr[0];
              _os_log_impl(&dword_0, v228, OS_LOG_TYPE_DEFAULT, "setting dimming step %u", (uint8_t *)buf, 8u);
            }
            BOOL v3 = 1;
          }
          v229 = *((void *)this + 7);
          if (!v229)
          {
            v229 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v229 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v229, OS_LOG_TYPE_DEBUG)) {
            sub_1056C();
          }
          kdebug_trace();
        }
      }
      else
      {
        CFTypeID v179 = CFDictionaryGetTypeID();
        if (v179 != CFGetTypeID(a3)) {
          return 0;
        }
        v180 = (__IOHIDDevice *)*((void *)this + 18);
        if (!v180) {
          return 0;
        }
        v140 = IOHIDTransactionCreate(kCFAllocatorDefault, v180, kIOHIDTransactionDirectionTypeOutput, 0);
        if (!v140) {
          return 0;
        }
        valuePtr[0] = 0;
        *(float *)v258 = 0.5;
        *(float *)v257 = -1.0;
        CFIndex v181 = (CFIndex)CFDictionaryGetValue((CFDictionaryRef)a3, @"Step");
        if (v181)
        {
          CFTypeID v182 = CFNumberGetTypeID();
          if (v182 == CFGetTypeID((CFTypeRef)v181))
          {
            int v183 = CFNumberGetValue((CFNumberRef)v181, kCFNumberIntType, valuePtr);
            CFIndex v181 = 0;
            if (v183 && valuePtr[0])
            {
              AppleUSBALS::addElementValueToTransaction(this, v140, *((__IOHIDElement **)this + 19), valuePtr[0]);
              CFIndex v181 = 1;
            }
          }
          else
          {
            CFIndex v181 = 0;
          }
        }
        CFNumberRef v223 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Factor");
        if (v223)
        {
          CFTypeID v224 = CFNumberGetTypeID();
          if (v224 == CFGetTypeID(v223))
          {
            CFNumberGetValue(v223, kCFNumberFloat32Type, v257);
            AppleUSBALS::addElementValueToTransaction(this, v140, *((__IOHIDElement **)this + 22), (uint64_t)(float)(*(float *)v257 * 1000.0));
            v181 |= 4uLL;
          }
        }
        CFNumberRef v225 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
        if (v225)
        {
          CFTypeID v226 = CFNumberGetTypeID();
          if (v226 == CFGetTypeID(v225))
          {
            CFNumberGetValue(v225, kCFNumberFloat32Type, v258);
            AppleUSBALS::addElementValueToTransaction(this, v140, *((__IOHIDElement **)this + 20), (uint64_t)(float)(*(float *)v258 * 1000.0));
            v181 |= 2uLL;
          }
        }
        if (v181)
        {
          AppleUSBALS::addElementValueToTransaction(this, v140, *((__IOHIDElement **)this + 21), v181);
          v227 = *((void *)this + 7);
          if (!v227)
          {
            v227 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v227 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v227, OS_LOG_TYPE_DEBUG)) {
            sub_105E0();
          }
          kdebug_trace();
          if (IOHIDTransactionCommit(v140))
          {
            BOOL v3 = 0;
          }
          else
          {
            v230 = *((void *)this + 7);
            if (!v230)
            {
              v230 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v230 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
            {
              buf[0] = 67109120;
              buf[1] = valuePtr[0];
              _os_log_impl(&dword_0, v230, OS_LOG_TYPE_DEFAULT, "setting dimming step %u", (uint8_t *)buf, 8u);
            }
            BOOL v3 = 1;
          }
          v231 = *((void *)this + 7);
          if (!v231)
          {
            v231 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v231 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v231, OS_LOG_TYPE_DEBUG)) {
            sub_1056C();
          }
          kdebug_trace();
        }
        else
        {
          BOOL v3 = 0;
        }
      }
LABEL_505:
      CFRelease(v140);
      return v3;
    }
    if (CFEqual(a2, @"DFRCurve"))
    {
      v157 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v157) {
        return 0;
      }
      v158 = IOHIDTransactionCreate(kCFAllocatorDefault, v157, kIOHIDTransactionDirectionTypeOutput, 0);
      if (!v158) {
        return 0;
      }
      CFTypeID v159 = CFDictionaryGetTypeID();
      if (v159 != CFGetTypeID(a3)) {
        goto LABEL_352;
      }
      *(float *)v257 = 0.0;
      CFNumberRef v160 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
      if (v160)
      {
        CFTypeID v161 = CFNumberGetTypeID();
        if (v161 == CFGetTypeID(v160)) {
          CFNumberGetValue(v160, kCFNumberFloat32Type, v257);
        }
      }
      v162 = CFDictionaryGetValue((CFDictionaryRef)a3, @"L");
      v163 = CFDictionaryGetValue((CFDictionaryRef)a3, @"E");
      if (!v162) {
        goto LABEL_352;
      }
      v164 = v163;
      CFTypeID v165 = CFArrayGetTypeID();
      if (v165 != CFGetTypeID(v162)) {
        goto LABEL_352;
      }
      if (!v164) {
        goto LABEL_352;
      }
      CFTypeID v166 = CFArrayGetTypeID();
      if (v166 != CFGetTypeID(v164) || CFArrayGetCount((CFArrayRef)v162) > 12) {
        goto LABEL_352;
      }
      unsigned __int16 Count = CFArrayGetCount((CFArrayRef)v162);
      memset(buf, 0, sizeof(buf));
      memset(valuePtr, 0, sizeof(valuePtr));
      v167 = *((void *)this + 7);
      if (!v167)
      {
        v167 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          v167 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG))
      {
        int v168 = Count;
        *(float *)v258 = 1.5047e-36;
        int v259 = Count;
        _os_log_debug_impl(&dword_0, v167, OS_LOG_TYPE_DEBUG, "set DFR curve with size = %d\n", v258, 8u);
        if (!Count) {
          goto LABEL_349;
        }
      }
      else
      {
        int v168 = Count;
        if (!Count) {
          goto LABEL_349;
        }
      }
      CFIndex v169 = 0;
      do
      {
        *(float *)v258 = 0.0;
        float v253 = 0.0;
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v162, v169);
        CFNumberRef v171 = ValueAtIndex;
        if (ValueAtIndex)
        {
          CFTypeID v172 = CFGetTypeID(ValueAtIndex);
          if (v172 == CFNumberGetTypeID())
          {
            CFNumberGetValue(v171, kCFNumberFloatType, v258);
            buf[v169] = (float)(*(float *)v258 * 1000.0);
          }
        }
        CFNumberRef v173 = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v164, v169);
        CFNumberRef v174 = v173;
        if (v173)
        {
          CFTypeID v175 = CFGetTypeID(v173);
          if (v175 == CFNumberGetTypeID())
          {
            CFNumberGetValue(v174, kCFNumberFloatType, &v253);
            valuePtr[v169] = (float)(v253 * 1000.0);
          }
        }
        ++v169;
      }
      while (v168 != v169);
LABEL_349:
      v176 = AppleUSBALS::getElement(this, 65298, 68, kIOHIDElementTypeFeature);
      if (AppleUSBALS::addElementValueToTransaction(this, v158, v176, 1)) {
        goto LABEL_352;
      }
      v177 = AppleUSBALS::getElement(this, 65298, 69, kIOHIDElementTypeFeature);
      if (AppleUSBALS::addElementValueToTransaction(this, v158, v177, Count)) {
        goto LABEL_352;
      }
      v178 = AppleUSBALS::getElement(this, 65298, 70, kIOHIDElementTypeFeature);
      if (AppleUSBALS::addElementValueToTransaction(this, v158, v178, (uint64_t)(float)(*(float *)v257 * 1000.0)))goto LABEL_352; {
      v244 = AppleUSBALS::getElement(this, 65298, 71, kIOHIDElementTypeFeature);
      }
      if (v244)
      {
        uint64_t v245 = mach_absolute_time();
        v246 = IOHIDValueCreateWithBytes(kCFAllocatorDefault, v244, v245, (const uint8_t *)valuePtr, 48);
        v247 = AppleUSBALS::getElement(this, 65298, 72, kIOHIDElementTypeFeature);
        if (!v247) {
          goto LABEL_551;
        }
        v248 = v246;
      }
      else
      {
        v247 = AppleUSBALS::getElement(this, 65298, 72, kIOHIDElementTypeFeature);
        if (!v247)
        {
LABEL_352:
          BOOL v3 = 0;
LABEL_353:
          CFRelease(v158);
          return v3;
        }
        v248 = 0;
      }
      uint64_t v249 = mach_absolute_time();
      IOHIDValueRef v250 = IOHIDValueCreateWithBytes(kCFAllocatorDefault, v247, v249, (const uint8_t *)buf, 48);
      v246 = v250;
      if (v248 && v250)
      {
        IOHIDTransactionAddElement(v158, v244);
        IOHIDTransactionAddElement(v158, v247);
        IOHIDTransactionSetValue(v158, v244, v248, 0);
        IOHIDTransactionSetValue(v158, v247, v246, 0);
        BOOL v3 = IOHIDTransactionCommit(v158) == 0;
        CFRelease(v248);
        goto LABEL_552;
      }
      if (v248)
      {
        BOOL v251 = v250 != 0;
        CFRelease(v248);
        BOOL v3 = 0;
        if (!v251) {
          goto LABEL_353;
        }
        goto LABEL_552;
      }
LABEL_551:
      BOOL v3 = 0;
      if (!v246) {
        goto LABEL_353;
      }
LABEL_552:
      CFRelease(v246);
      goto LABEL_353;
    }
    if (!CFEqual(a2, @"DFRWhitepoint"))
    {
      if (!CFEqual(a2, @"DFRBrightness"))
      {
        if (!CFEqual(a2, @"DFRBurninCounter"))
        {
          if (!CFEqual(a2, @"DFRProtocolVersion")) {
            return 0;
          }
          CFTypeID v232 = CFNumberGetTypeID();
          if (v232 != CFGetTypeID(a3)) {
            return 0;
          }
          v233 = *((void *)this + 7);
          if (!v233)
          {
            v233 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v233 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v233, OS_LOG_TYPE_ERROR)) {
            sub_10504();
          }
          buf[0] = 0;
          if (!CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, buf)) {
            return 0;
          }
          int v234 = AppleUSBALS::setIntValueForUsage(this, 65298, 64, buf[0]);
          v235 = *((void *)this + 7);
          if (!v235)
          {
            v235 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              v235 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR)) {
            sub_10474();
          }
          return v234 == 0;
        }
        ScaledCFNumberRef Value = IOHIDTransactionCreate(kCFAllocatorDefault, *((IOHIDDeviceRef *)this + 18), kIOHIDTransactionDirectionTypeOutput, 0);
        if (!ScaledValue) {
          return 0;
        }
        v218 = AppleUSBALS::getElement(this, 65298, 80, kIOHIDElementTypeFeature);
        if (!AppleUSBALS::addElementValueToTransaction(this, ScaledValue, v218, 1)
          && (CFTypeID v219 = CFNumberGetTypeID(), v219 == CFGetTypeID(a3))
          && (*(void *)buf = 0, CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, buf))
          && (v220 = AppleUSBALS::getElement(this, 65298, 81, kIOHIDElementTypeFeature)) != 0
          && (uint64_t v221 = mach_absolute_time(),
              (v222 = IOHIDValueCreateWithBytes(kCFAllocatorDefault, v220, v221, (const uint8_t *)buf, 8)) != 0))
        {
          IOHIDTransactionAddElement(ScaledValue, v220);
          IOHIDTransactionSetValue(ScaledValue, v220, v222, 0);
          BOOL v3 = IOHIDTransactionCommit(ScaledValue) == 0;
          CFRelease(v222);
        }
        else
        {
          BOOL v3 = 0;
        }
LABEL_523:
        CFRelease(ScaledValue);
        return v3;
      }
      v213 = (__IOHIDDevice *)*((void *)this + 18);
      if (!v213) {
        return 0;
      }
      int v105 = IOHIDTransactionCreate(kCFAllocatorDefault, v213, kIOHIDTransactionDirectionTypeOutput, 0);
      if (!v105) {
        return 0;
      }
      v214 = AppleUSBALS::getElement(this, 65298, 16, kIOHIDElementTypeFeature);
      AppleUSBALS::addElementValueToTransaction(this, v105, v214, 1);
      CFTypeID v215 = CFNumberGetTypeID();
      if (v215 == CFGetTypeID(a3))
      {
        buf[0] = 0;
        if (CFNumberGetValue((CFNumberRef)a3, kCFNumberFloat32Type, buf))
        {
          v216 = AppleUSBALS::getElement(this, 65298, 18, kIOHIDElementTypeFeature);
          AppleUSBALS::addElementValueToTransaction(this, v105, v216, (uint64_t)(float)(*(float *)buf * 1000.0));
        }
      }
      else
      {
        CFTypeID v237 = CFDictionaryGetTypeID();
        if (v237 == CFGetTypeID(a3))
        {
          buf[0] = 0;
          valuePtr[0] = 0;
          CFNumberRef v238 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Brightness");
          if (v238)
          {
            CFTypeID v239 = CFNumberGetTypeID();
            if (v239 == CFGetTypeID(v238))
            {
              CFNumberGetValue(v238, kCFNumberFloat32Type, buf);
              v240 = AppleUSBALS::getElement(this, 65298, 18, kIOHIDElementTypeFeature);
              AppleUSBALS::addElementValueToTransaction(this, v105, v240, (uint64_t)(float)(*(float *)buf * 1000.0));
            }
          }
          CFNumberRef v241 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
          if (v241)
          {
            CFTypeID v242 = CFNumberGetTypeID();
            if (v242 == CFGetTypeID(v241))
            {
              CFNumberGetValue(v241, kCFNumberFloat32Type, valuePtr);
              v243 = AppleUSBALS::getElement(this, 65298, 19, kIOHIDElementTypeFeature);
              AppleUSBALS::addElementValueToTransaction(this, v105, v243, (uint64_t)(float)(*(float *)valuePtr * 1000.0));
            }
          }
        }
      }
LABEL_232:
      BOOL v3 = IOHIDTransactionCommit(v105) == 0;
      CFRelease(v105);
      return v3;
    }
    v193 = (__IOHIDDevice *)*((void *)this + 18);
    if (!v193) {
      return 0;
    }
    v140 = IOHIDTransactionCreate(kCFAllocatorDefault, v193, kIOHIDTransactionDirectionTypeOutput, 0);
    if (!v140) {
      return 0;
    }
    CFTypeID v194 = CFDictionaryGetTypeID();
    if (v194 != CFGetTypeID(a3)) {
      goto LABEL_454;
    }
    v195 = *((void *)this + 7);
    if (!v195)
    {
      v195 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        v195 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
    {
      buf[0] = 138543362;
      *(void *)&buf[1] = a3;
      _os_log_impl(&dword_0, v195, OS_LOG_TYPE_DEFAULT, "whitepoint: %{public}@", (uint8_t *)buf, 0xCu);
    }
    buf[0] = 0;
    valuePtr[0] = 0;
    *(float *)v258 = 0.0;
    CFNumberRef v196 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a3, @"Period");
    if (v196)
    {
      CFTypeID v197 = CFNumberGetTypeID();
      if (v197 == CFGetTypeID(v196)) {
        CFNumberGetValue(v196, kCFNumberFloat32Type, buf);
      }
    }
    v198 = CFDictionaryGetValue((CFDictionaryRef)a3, @"Target_x");
    v199 = CFDictionaryGetValue((CFDictionaryRef)a3, @"Target_y");
    if (!v198) {
      goto LABEL_454;
    }
    v200 = v199;
    CFTypeID v201 = CFNumberGetTypeID();
    BOOL v3 = 0;
    if (v201 != CFGetTypeID(v198) || !v200) {
      goto LABEL_505;
    }
    CFTypeID v202 = CFNumberGetTypeID();
    if (v202 != CFGetTypeID(v200)
      || !CFNumberGetValue((CFNumberRef)v198, kCFNumberFloat32Type, valuePtr)
      || !CFNumberGetValue((CFNumberRef)v200, kCFNumberFloat32Type, v258))
    {
LABEL_454:
      BOOL v3 = 0;
      goto LABEL_505;
    }
    v203 = AppleUSBALS::getElement(this, 65298, 98, kIOHIDElementTypeFeature);
    if (v203)
    {
      v204 = AppleUSBALS::createScaledValue(this, v203, *(float *)buf);
      if (v204)
      {
        IOHIDTransactionAddElement(v140, v203);
        IOHIDTransactionSetValue(v140, v203, v204, 0);
        CFRelease(v204);
      }
    }
    v205 = AppleUSBALS::getElement(this, 65298, 96, kIOHIDElementTypeFeature);
    v206 = AppleUSBALS::getElement(this, 65298, 97, kIOHIDElementTypeFeature);
    BOOL v3 = 0;
    if (!v205) {
      goto LABEL_505;
    }
    v207 = v206;
    if (!v206) {
      goto LABEL_505;
    }
    v208 = AppleUSBALS::createScaledValue(this, v205, *(float *)valuePtr);
    IOHIDValueRef v209 = AppleUSBALS::createScaledValue(this, v207, *(float *)v258);
    v210 = v209;
    if (v208 && v209)
    {
      IOHIDTransactionAddElement(v140, v205);
      IOHIDTransactionSetValue(v140, v205, v208, 0);
      IOHIDTransactionAddElement(v140, v207);
      IOHIDTransactionSetValue(v140, v207, v210, 0);
      if (IOHIDTransactionCommit(v140))
      {
        v211 = *((void *)this + 7);
        if (!v211)
        {
          v211 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            v211 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v211, OS_LOG_TYPE_ERROR)) {
          sub_10538();
        }
        BOOL v3 = 0;
      }
      else
      {
        BOOL v3 = 1;
      }
    }
    else
    {
      BOOL v3 = 0;
      if (!v208)
      {
LABEL_541:
        if (v210) {
          CFRelease(v210);
        }
        goto LABEL_505;
      }
    }
    CFRelease(v208);
    goto LABEL_541;
  }
  if (*((_DWORD *)this + 22) == 257)
  {
    IOHIDTransactionRef v15 = *((void *)this + 7);
    if (!v15)
    {
      IOHIDTransactionRef v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        IOHIDTransactionRef v15 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10A08();
    }
    return 0;
  }
  uint64_t v27 = mach_absolute_time();
  CFTypeID v28 = CFGetTypeID(a3);
  if (v28 != CFNumberGetTypeID()) {
    return 0;
  }
  buf[0] = 0;
  if (!CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, buf) || (buf[0] - 2112) > 5) {
    return 0;
  }
  CFNumberRef v29 = IOHIDTransactionCreate(kCFAllocatorDefault, *((IOHIDDeviceRef *)this + 18), kIOHIDTransactionDirectionTypeOutput, 0);
  if (v29)
  {
    for (int j = 2112; j != 2118; ++j)
    {
      CFNumberRef v31 = AppleUSBALS::getElement(this, 32, j, kIOHIDElementTypeFeature);
      if (v31)
      {
        uint64_t v32 = IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, v31, v27, j == buf[0]);
        if (v32)
        {
          IOHIDTransactionAddElement(v29, v31);
          IOHIDTransactionSetValue(v29, v31, v32, 0);
          CFRelease(v32);
        }
      }
    }
    BOOL v3 = IOHIDTransactionCommit(v29) == 0;
    CFRelease(v29);
  }
  else
  {
    BOOL v3 = 0;
  }
  CFNumberRef v61 = *((void *)this + 7);
  if (!v61)
  {
    CFNumberRef v61 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFNumberRef v61 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
    sub_10A3C((uint64_t)buf, v61, v62, v63, v64, v65, v66, v67);
  }
  return v3;
}

void sub_CBB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void AppleUSBALS::setKeyboardPreferences(NSObject **this, CFDictionaryRef theDict, int a3)
{
  CFNumberRef Value = CFDictionaryGetValue(theDict, @"Automatic Keyboard Enabled");
  unsigned __int8 v24 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Automatic Keyboard Enabled", Value, a3);
  BOOL v7 = CFDictionaryGetValue(theDict, @"Keyboard Dim Time");
  unsigned __int8 v23 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Keyboard Dim Time", v7, a3);
  CFTypeID v8 = CFDictionaryGetValue(theDict, @"Keyboard Muted");
  unsigned __int8 v9 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Keyboard Muted", v8, a3);
  unsigned int v10 = CFDictionaryGetValue(theDict, @"Keyboard User Offset");
  unsigned __int8 v11 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Keyboard User Offset", v10, a3);
  double v12 = CFDictionaryGetValue(theDict, @"Keyboard Manual Brightness");
  unsigned __int8 v13 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Keyboard Manual Brightness", v12, a3);
  double v14 = CFDictionaryGetValue(theDict, @"Keyboard Version");
  unsigned __int8 v15 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Keyboard Version", v14, a3);
  uint64_t v16 = CFDictionaryGetValue(theDict, @"IncreasedKeyboardBrightness");
  unsigned __int8 v17 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"IncreasedKeyboardBrightness", v16, a3);
  double v18 = CFDictionaryGetValue(theDict, @"KeyboardAdjustedBrightnessCurve");
  unsigned __int8 v19 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"KeyboardAdjustedBrightnessCurve", v18, a3);
  __int16 v20 = CFDictionaryGetValue(theDict, @"KeyboardBacklightMaxUser");
  char v21 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"KeyboardBacklightMaxUser", v20, a3) | v19 | v17 | v15 | v13 | v11 | v9 | v23 | v24;
  inited = this[7];
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    sub_10BF8();
    if ((v21 & 1) == 0) {
      return;
    }
  }
  else if ((v21 & 1) == 0)
  {
    return;
  }
  IOHIDPreferencesSynchronize();
}

void AppleUSBALS::setDisplayPreferences(NSObject **this, CFDictionaryRef theDict, int a3)
{
  CFNumberRef Value = CFDictionaryGetValue(theDict, @"Backlight 1");
  unsigned __int8 v24 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Backlight 1", Value, a3);
  BOOL v7 = CFDictionaryGetValue(theDict, @"Backlight 2");
  unsigned __int8 v23 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Backlight 2", v7, a3);
  CFTypeID v8 = CFDictionaryGetValue(theDict, @"Lux 1");
  unsigned __int8 v9 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Lux 1", v8, a3);
  unsigned int v10 = CFDictionaryGetValue(theDict, @"Lux 2");
  unsigned __int8 v11 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Lux 2", v10, a3);
  double v12 = CFDictionaryGetValue(theDict, @"LuxSensor 1");
  unsigned __int8 v13 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"LuxSensor 1", v12, a3);
  double v14 = CFDictionaryGetValue(theDict, @"LuxSensor 2");
  unsigned __int8 v15 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"LuxSensor 2", v14, a3);
  uint64_t v16 = CFDictionaryGetValue(theDict, @"Lux Threshold");
  unsigned __int8 v17 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Lux Threshold", v16, a3);
  double v18 = CFDictionaryGetValue(theDict, @"Automatic Display Enabled");
  unsigned __int8 v19 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Automatic Display Enabled", v18, a3);
  __int16 v20 = CFDictionaryGetValue(theDict, @"Ambient User Offset");
  char v21 = AppleUSBALS::setPropertyInternal((AppleUSBALS *)this, @"Ambient User Offset", v20, a3) | v19 | v17 | v15 | v13 | v11 | v9 | v23 | v24;
  inited = this[7];
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    sub_10BF8();
    if ((v21 & 1) == 0) {
      return;
    }
  }
  else if ((v21 & 1) == 0)
  {
    return;
  }
  IOHIDPreferencesSynchronize();
}

IOHIDValueRef AppleUSBALS::createScaledValue(AppleUSBALS *this, IOHIDElementRef element, double a3)
{
  if (!element)
  {
    inited = *((void *)this + 7);
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_10C78();
    }
    return 0;
  }
  CFIndex LogicalMax = IOHIDElementGetLogicalMax(element);
  CFIndex LogicalMin = IOHIDElementGetLogicalMin(element);
  CFIndex PhysicalMax = IOHIDElementGetPhysicalMax(element);
  CFIndex PhysicalMin = IOHIDElementGetPhysicalMin(element);
  uint32_t UnitExponent = IOHIDElementGetUnitExponent(element);
  double UnscaledValueWithExponent = AppleUSBALS::getUnscaledValueWithExponent(this, (double)PhysicalMax, UnitExponent);
  if (AppleUSBALS::getUnscaledValueWithExponent(this, (double)PhysicalMin, UnitExponent) > a3
    || UnscaledValueWithExponent < a3)
  {
    unsigned __int8 v13 = *((void *)this + 7);
    if (!v13)
    {
      unsigned __int8 v13 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        unsigned __int8 v13 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10CAC();
    }
    return 0;
  }
  if (PhysicalMax == PhysicalMin)
  {
    unsigned __int8 v15 = *((void *)this + 7);
    if (!v15)
    {
      unsigned __int8 v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        unsigned __int8 v15 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_FB7C();
    }
    return 0;
  }
  double ScaledValueWithExponent = AppleUSBALS::getScaledValueWithExponent(this, (double)(LogicalMax - LogicalMin) / (double)(PhysicalMax - PhysicalMin), UnitExponent);
  unsigned __int8 v19 = *((void *)this + 7);
  if (!v19)
  {
    unsigned __int8 v19 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      unsigned __int8 v19 = init_default_corebrightness_log();
    }
  }
  double v18 = (double)LogicalMin + ScaledValueWithExponent * a3;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 134219520;
    CFIndex v22 = LogicalMax;
    __int16 v23 = 2048;
    CFIndex v24 = LogicalMin;
    __int16 v25 = 2048;
    CFIndex v26 = PhysicalMax;
    __int16 v27 = 2048;
    CFIndex v28 = PhysicalMin;
    __int16 v29 = 2048;
    double v30 = ScaledValueWithExponent;
    __int16 v31 = 2048;
    double v32 = a3;
    __int16 v33 = 2048;
    uint64_t v34 = (uint64_t)v18;
    _os_log_debug_impl(&dword_0, v19, OS_LOG_TYPE_DEBUG, "lMax=%lu lMin=%lu pMax=%lu pMin=%lu -> factor=%f | value=%f -> scaled=%lu", (uint8_t *)&v21, 0x48u);
  }
  uint64_t v20 = mach_absolute_time();
  return IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, element, v20, (uint64_t)v18);
}

__CFDictionary *AppleUSBALS::setPropertyInternal(AppleUSBALS *this, const __CFString *a2, const void *value, int a4)
{
  uint64_t result = 0;
  if (a2)
  {
    if (value)
    {
      uint64_t result = (__CFDictionary *)*((void *)this + 30);
      if (result)
      {
        CFDictionarySetValue(result, a2, value);
        if (a4) {
          IOHIDPreferencesSet();
        }
        return (__CFDictionary *)(&dword_0 + 1);
      }
    }
  }
  return result;
}

uint64_t AppleUSBALS::addElementValueToTransaction(AppleUSBALS *this, __IOHIDTransaction *a2, __IOHIDElement *a3, CFIndex a4)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218496;
    unsigned __int8 v15 = a3;
    __int16 v16 = 2048;
    unsigned __int8 v17 = a2;
    __int16 v18 = 2048;
    CFIndex v19 = a4;
    _os_log_debug_impl(&dword_0, inited, OS_LOG_TYPE_DEBUG, "element=%p transaction=%p value=%ld", (uint8_t *)&v14, 0x20u);
  }
  uint64_t result = 3758097090;
  if (a2 && a3)
  {
    uint64_t v10 = mach_absolute_time();
    IOHIDValueRef v11 = IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, a3, v10, a4);
    if (v11)
    {
      double v12 = v11;
      unsigned __int8 v13 = *((void *)this + 7);
      if (!v13)
      {
        unsigned __int8 v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          unsigned __int8 v13 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_10D24();
      }
      IOHIDTransactionAddElement(a2, a3);
      IOHIDTransactionSetValue(a2, a3, v12, 0);
      CFRelease(v12);
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

void sub_D5E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  inited = *(NSObject **)(v2 + 56);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_10E00();
  }
  kdebug_trace();
  IOReturn v4 = IOHIDTransactionCommit(*(IOHIDTransactionRef *)(a1 + 48));
  float v5 = *(NSObject **)(v2 + 56);
  if (v4)
  {
    if (!v5)
    {
      float v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v5 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_106FC();
    }
  }
  else
  {
    if (!v5)
    {
      float v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v5 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10D8C();
    }
    kdebug_trace();
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 1)
    {
      if (notify_is_valid_token(*(_DWORD *)(v2 + 324)))
      {
        notify_set_state(*(_DWORD *)(v2 + 324), 1uLL);
        notify_post("com.apple.DFRBrightness.displayStateUpdate");
      }
      else
      {
        CFNumberRef v6 = *(NSObject **)(v2 + 56);
        if (!v6)
        {
          CFNumberRef v6 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            CFNumberRef v6 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10654();
        }
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void sub_D7A4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  inited = *(NSObject **)(v2 + 56);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_10E00();
  }
  kdebug_trace();
  IOReturn v4 = IOHIDTransactionCommit(*(IOHIDTransactionRef *)(a1 + 48));
  float v5 = *(NSObject **)(v2 + 56);
  if (v4)
  {
    if (!v5)
    {
      float v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v5 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_106FC();
    }
  }
  else
  {
    if (!v5)
    {
      float v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v5 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10D8C();
    }
    kdebug_trace();
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 1)
    {
      if (notify_is_valid_token(*(_DWORD *)(v2 + 324)))
      {
        notify_set_state(*(_DWORD *)(v2 + 324), 1uLL);
        notify_post("com.apple.DFRBrightness.displayStateUpdate");
      }
      else
      {
        CFNumberRef v6 = *(NSObject **)(v2 + 56);
        if (!v6)
        {
          CFNumberRef v6 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            CFNumberRef v6 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10654();
        }
      }
    }
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void AppleUSBALS::scheduleWithDispatchQueue(AppleUSBALS *this, NSObject *a2)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG))
  {
    sub_FBB0();
    if (!a2) {
      return;
    }
  }
  else if (!a2)
  {
    return;
  }
  *((void *)this + 8) = a2;
  dispatch_retain(a2);
  if (*((_DWORD *)this + 22) == 257)
  {
    float v5 = *((void *)this + 7);
    if (!v5)
    {
      float v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        float v5 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "system power monitoring not required on this platform", buf, 2u);
    }
  }
  else
  {
    *(_DWORD *)buf = 2113;
    CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, buf);
    if (v6)
    {
      CFNumberRef v7 = v6;
      (*(void (**)(AppleUSBALS *, const __CFString *, CFNumberRef))(*(void *)this + 88))(this, @"SensorReportingState", v6);
      CFTypeID v8 = *((void *)this + 7);
      if (!v8)
      {
        CFTypeID v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFTypeID v8 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_110E0();
      }
      CFRelease(v7);
    }
    LODWORD(v27) = 1097859072;
    CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &v27);
    if (v9)
    {
      CFNumberRef v10 = v9;
      (*(void (**)(AppleUSBALS *, const __CFString *, CFNumberRef))(*(void *)this + 88))(this, @"SensorRelativeSensitivity", v9);
      IOHIDValueRef v11 = *((void *)this + 7);
      if (!v11)
      {
        IOHIDValueRef v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          IOHIDValueRef v11 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_11060();
      }
      CFRelease(v10);
    }
    int valuePtr = 0x40000000;
    CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
    if (v12)
    {
      CFNumberRef v13 = v12;
      (*(void (**)(AppleUSBALS *, const __CFString *, CFNumberRef))(*(void *)this + 88))(this, @"SensorAbsoluteSensitivity", v12);
      int v14 = *((void *)this + 7);
      if (!v14)
      {
        int v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          int v14 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10FE0();
      }
      CFRelease(v13);
    }
    if (*((void *)this + 18))
    {
      Element = AppleUSBALS::getElement(this, 32, 782, kIOHIDElementTypeFeature);
      if (Element)
      {
        __int16 v16 = Element;
        uint64_t v17 = mach_absolute_time();
        __int16 v18 = IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, v16, v17, 200);
        if (v18)
        {
          CFIndex v19 = v18;
          IOReturn v20 = IOHIDDeviceSetValue(*((IOHIDDeviceRef *)this + 18), v16, v18);
          CFRelease(v19);
          int v21 = *((void *)this + 7);
          if (v20)
          {
            if (!v21)
            {
              int v21 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                int v21 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_10FAC();
            }
          }
          else
          {
            if (!v21)
            {
              int v21 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                int v21 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
              sub_10F78();
            }
          }
        }
        else
        {
          CFIndex v24 = *((void *)this + 7);
          if (!v24)
          {
            CFIndex v24 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              CFIndex v24 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_10F44();
          }
        }
      }
      else
      {
        __int16 v23 = *((void *)this + 7);
        if (!v23)
        {
          __int16 v23 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            __int16 v23 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10F10();
        }
      }
    }
    else
    {
      CFIndex v22 = *((void *)this + 7);
      if (!v22)
      {
        CFIndex v22 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFIndex v22 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10EDC();
      }
    }
    AppleUSBALS::startSystemPowerStateMonitoring(this);
  }
  if (*((void *)this + 23))
  {
    AppleUSBALS::startClamshellStateMonitoring(this);
    AppleUSBALS::startDisplayPowerMonitoring(this);
  }
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  *((void *)this + 48) = v25;
  if (v25) {
    operator new();
  }
  CFIndex v26 = *((void *)this + 7);
  if (!v26)
  {
    CFIndex v26 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFIndex v26 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    sub_10E74();
  }
}

void sub_DF4C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  std::__thread_struct::~__thread_struct(v11);
  operator delete();
}

void AppleUSBALS::startSystemPowerStateMonitoring(AppleUSBALS *this)
{
  io_connect_t v2 = IORegisterForSystemPower(this, (IONotificationPortRef *)this + 38, (IOServiceInterestCallback)SystemPowerStateUpdateCallback, (io_object_t *)this + 78);
  *((_DWORD *)this + 79) = v2;
  if (v2)
  {
    IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 38), *((dispatch_queue_t *)this + 8));
  }
  else
  {
    inited = *((void *)this + 7);
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_11160();
    }
  }
  AppleUSBALS::turnOnDevice((NSObject **)this);
}

void AppleUSBALS::startClamshellStateMonitoring(AppleUSBALS *this)
{
  *((void *)this + 35) = 0;
  io_connect_t v2 = (io_object_t *)((char *)this + 276);
  *((_DWORD *)this + 69) = 0;
  *((unsigned char *)this + 288) = 1;
  IONotificationPortRef v3 = IONotificationPortCreate(kIOMasterPortDefault);
  *((void *)this + 35) = v3;
  if (v3)
  {
    CFDictionaryRef v4 = IOServiceMatching("IOPMrootDomain");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    if (MatchingService)
    {
      io_service_t v6 = MatchingService;
      uint64_t active = IOPMScheduleUserActiveChangedNotification();
      *((void *)this + 37) = active;
      if (active)
      {
        if (!IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 35), v6, "IOGeneralInterest", (IOServiceInterestCallback)clamshellStateCallback, this, v2))
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 35), *((dispatch_queue_t *)this + 8));
          return;
        }
        inited = *((void *)this + 7);
        if (!inited)
        {
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
          sub_11230();
        }
      }
      else
      {
        IOHIDValueRef v11 = *((void *)this + 7);
        if (!v11)
        {
          IOHIDValueRef v11 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            IOHIDValueRef v11 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_111FC();
        }
      }
    }
    else
    {
      CFNumberRef v10 = *((void *)this + 7);
      if (!v10)
      {
        CFNumberRef v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          CFNumberRef v10 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_111C8();
      }
    }
  }
  else
  {
    CFNumberRef v9 = *((void *)this + 7);
    if (!v9)
    {
      CFNumberRef v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        CFNumberRef v9 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_11194();
    }
  }
  CFNumberRef v12 = (IONotificationPort *)*((void *)this + 35);
  if (v12)
  {
    IONotificationPortDestroy(v12);
    *((void *)this + 35) = 0;
  }
  if (*v2)
  {
    IOObjectRelease(*v2);
    *io_connect_t v2 = 0;
  }
  if (*((void *)this + 37))
  {
    IOPMUnregisterNotification();
    *((void *)this + 37) = 0;
  }
}

void AppleUSBALS::startDisplayPowerMonitoring(AppleUSBALS *this)
{
  IONotificationPortRef v2 = IONotificationPortCreate(kIOMasterPortDefault);
  *((void *)this + 33) = v2;
  if (!v2) {
    goto LABEL_8;
  }
  IONotificationPortRef v3 = v2;
  CFDictionaryRef v4 = IOServiceMatching("IODisplayWrangler");
  if (IOServiceAddMatchingNotification(v3, "IOServiceFirstMatch", v4, (IOServiceMatchingCallback)DisplayWranglerArrival, this, (io_iterator_t *)this + 68))
  {
    inited = *((void *)this + 7);
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_11298();
    }
    goto LABEL_8;
  }
  IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 33), *((dispatch_queue_t *)this + 8));
  io_iterator_t v7 = *((_DWORD *)this + 68);
  if (!v7)
  {
LABEL_8:
    BOOL v6 = 1;
    goto LABEL_9;
  }
  io_object_t v8 = IOIteratorNext(v7);
  CFNumberRef v9 = *((void *)this + 7);
  if (!v8)
  {
    if (!v9)
    {
      CFNumberRef v9 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        CFNumberRef v9 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_11264();
    }
    goto LABEL_8;
  }
  io_service_t v10 = v8;
  if (!v9)
  {
    CFNumberRef v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      CFNumberRef v9 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v10;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "display wrangler found (0x%X)", (uint8_t *)v11, 8u);
  }
  BOOL v6 = AppleUSBALS::initializeDisplayPowerMonitoring(this, v10);
  IOObjectRelease(v10);
LABEL_9:
  *((unsigned char *)this + 248) = !v6;
  *((unsigned char *)this + 249) = !v6;
  AppleUSBALS::displayStateUpdate(this, v6);
}

void AppleUSBALS::unscheduleFromDispatchQueue(AppleUSBALS *this, dispatch_queue_s *a2)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_FBB0();
  }
  if (*((dispatch_queue_s **)this + 8) == a2)
  {
    float v5 = (__CFRunLoop *)*((void *)this + 9);
    if (v5)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_E5AC;
      block[3] = &unk_14650;
      block[4] = this;
      CFRunLoopPerformBlock(v5, kCFRunLoopDefaultMode, block);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 9));
      std::thread::join((std::thread *)this + 47);
      BOOL v6 = *((void *)this + 7);
      if (!v6)
      {
        BOOL v6 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          BOOL v6 = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_11300();
      }
      CFRelease(*((CFTypeRef *)this + 9));
      *((void *)this + 9) = 0;
    }
    AppleUSBALS::stopDisplayPowerMonitoring(this);
    AppleUSBALS::stopClamshellStateMonitoring(this);
    AppleUSBALS::stopSystemPowerStateMonitoring((io_object_t *)this);
    dispatch_release(*((dispatch_object_t *)this + 8));
    *((void *)this + 8) = 0;
  }
}

void sub_E5AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFRunLoopStop(*(CFRunLoopRef *)(v1 + 72));
  inited = *(NSObject **)(v1 + 56);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_11334();
  }
}

uint64_t AppleUSBALS::stopDisplayPowerMonitoring(AppleUSBALS *this)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_11368();
  }
  IONotificationPortRef v3 = (IONotificationPort *)*((void *)this + 33);
  if (v3)
  {
    IONotificationPortDestroy(v3);
    *((void *)this + 33) = 0;
  }
  io_object_t v4 = *((_DWORD *)this + 68);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 68) = 0;
  }
  float v5 = (IONotificationPort *)*((void *)this + 32);
  if (v5)
  {
    IONotificationPortDestroy(v5);
    *((void *)this + 32) = 0;
  }
  uint64_t result = *((unsigned int *)this + 63);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *((_DWORD *)this + 63) = 0;
  }
  return result;
}

uint64_t AppleUSBALS::stopClamshellStateMonitoring(AppleUSBALS *this)
{
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_11450();
  }
  IONotificationPortRef v3 = (IONotificationPort *)*((void *)this + 35);
  if (v3)
  {
    IONotificationPortDestroy(v3);
    *((void *)this + 35) = 0;
  }
  io_object_t v4 = *((_DWORD *)this + 69);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 69) = 0;
  }
  float v5 = *((void *)this + 7);
  if (!v5)
  {
    float v5 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      float v5 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_113E4();
  }
  uint64_t result = *((void *)this + 37);
  if (result)
  {
    uint64_t result = IOPMUnregisterNotification();
    *((void *)this + 37) = 0;
  }
  return result;
}

uint64_t AppleUSBALS::stopSystemPowerStateMonitoring(io_object_t *this)
{
  if (this[78])
  {
    IODeregisterForSystemPower(this + 78);
    this[78] = 0;
  }
  IONotificationPortRef v2 = (IONotificationPort *)*((void *)this + 38);
  if (v2)
  {
    IONotificationPortDestroy(v2);
    *((void *)this + 38) = 0;
  }
  uint64_t result = this[79];
  if (result)
  {
    uint64_t result = IOServiceClose(result);
    this[79] = 0;
  }
  return result;
}

void AppleUSBALS::setEventCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  inited = a1[7];
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218496;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    uint64_t v12 = a4;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_DEFAULT, "callback=%p refcon=%p target=%p", (uint8_t *)&v9, 0x20u);
  }
  a1[15] = a3;
  a1[16] = a4;
  a1[14] = a2;
}

__IOHIDElement *AppleUSBALS::updateCurrentAmbientLightValues(IOHIDDeviceRef *this)
{
  Element = AppleUSBALS::getElement((AppleUSBALS *)this, 32, 1233, kIOHIDElementTypeInput_Misc);
  IONotificationPortRef v3 = AppleUSBALS::getElement((AppleUSBALS *)this, 32, 1236, kIOHIDElementTypeInput_Misc);
  io_object_t v4 = AppleUSBALS::getElement((AppleUSBALS *)this, 32, 1237, kIOHIDElementTypeInput_Misc);
  float v5 = AppleUSBALS::getElement((AppleUSBALS *)this, 32, 1234, kIOHIDElementTypeInput_Misc);
  if (!Element)
  {
LABEL_9:
    if (!v3) {
      return Element;
    }
    goto LABEL_10;
  }
  pCFNumberRef Value = 0;
  IOHIDValueRef value = this[41];
  if (IOHIDDeviceGetValueWithOptions(this[18], Element, &pValue, 0x20000u))
  {
    inited = this[7];
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      sub_114CC();
    }
    goto LABEL_8;
  }
  if (!pValue)
  {
LABEL_8:
    Element = 0;
    goto LABEL_9;
  }
  AppleUSBALS::retrieveScaledValue((AppleUSBALS *)this, pValue, (double *)&value);
  int v9 = this[7];
  if (!v9)
  {
    int v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      int v9 = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    IOHIDValueRef v10 = value;
    *(_DWORD *)buf = 134217984;
    IOHIDValueRef v25 = value;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "current lux = %f", buf, 0xCu);
    IOHIDValueRef v11 = v10;
  }
  else
  {
    IOHIDValueRef v11 = value;
  }
  AppleUSBALS::updateCurrentAmbient((AppleUSBALS *)this, *(double *)&v11);
  Element = (__IOHIDElement *)(&dword_0 + 1);
  if (v3)
  {
LABEL_10:
    if (v4 && v5)
    {
      IOHIDValueRef value = 0;
      pCFNumberRef Value = 0;
      IOHIDValueRef v21 = 0;
      if (IOHIDDeviceGetValueWithOptions(this[18], v3, &pValue, 0x20000u)
        || IOHIDDeviceGetValueWithOptions(this[18], v4, &value, 0x20000u)
        || IOHIDDeviceGetValueWithOptions(this[18], v5, &v21, 0x20000u))
      {
        io_iterator_t v7 = this[7];
        if (!v7)
        {
          io_iterator_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            io_iterator_t v7 = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_FD94();
        }
      }
      else
      {
        double v19 = 0.0;
        double v20 = 0.0;
        double v18 = 0.0;
        if (AppleUSBALS::retrieveScaledValue((AppleUSBALS *)this, pValue, &v20)
          && AppleUSBALS::retrieveScaledValue((AppleUSBALS *)this, value, &v19)
          && AppleUSBALS::retrieveScaledValue((AppleUSBALS *)this, v21, &v18))
        {
          double v12 = 0.0;
          if (v20 == 0.0)
          {
            double v13 = 0.0;
            double v14 = 0.0;
          }
          else
          {
            double v13 = 0.0;
            double v14 = 0.0;
            if (v19 != 0.0)
            {
              double v13 = *((double *)this + 41);
              double v12 = v20 / v19 * v13;
              double v14 = (1.0 - v20 - v19) / v19 * v13;
            }
          }
          __int16 v16 = this[7];
          if (!v16)
          {
            __int16 v16 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              __int16 v16 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            IOHIDDeviceRef v17 = this[41];
            *(_DWORD *)buf = 134218752;
            IOHIDValueRef v25 = *(IOHIDValueRef *)&v12;
            __int16 v26 = 2048;
            double v27 = v13;
            __int16 v28 = 2048;
            double v29 = v14;
            __int16 v30 = 2048;
            IOHIDDeviceRef v31 = v17;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "current color: [X=%f,Y=%f,Z=%f] (in %f lux)", buf, 0x2Au);
          }
          AppleUSBALS::updateCurrentColourInfo((AppleUSBALS *)this, v12, v13, v14, v18);
          return (__IOHIDElement *)(&dword_0 + 1);
        }
        else
        {
          unsigned __int8 v15 = this[7];
          if (!v15)
          {
            unsigned __int8 v15 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (!_COREBRIGHTNESS_LOG_DEFAULT) {
              unsigned __int8 v15 = init_default_corebrightness_log();
            }
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_FD60();
          }
        }
      }
    }
  }
  return Element;
}

uint64_t AppleUSBALS::synchronizePreferences(AppleUSBALS *this)
{
  return IOHIDPreferencesSynchronize();
}

void sub_ECE8(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  inited = *(NSObject **)(v3 + 56);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
  {
    int v5 = *(unsigned __int8 *)(v3 + 251);
    v6[0] = 67109376;
    v6[1] = a2;
    __int16 v7 = 1024;
    int v8 = v5;
    _os_log_impl(&dword_0, inited, OS_LOG_TYPE_INFO, "user uint64_t active = %d (current=%d)", (uint8_t *)v6, 0xEu);
  }
  if (*(unsigned __int8 *)(v3 + 251) != a2)
  {
    if (a2)
    {
      if (*(unsigned char *)(v3 + 250)) {
        AppleUSBALS::displayStateUpdate((AppleUSBALS *)v3, 1);
      }
    }
    *(unsigned char *)(v3 + 251) = a2;
  }
}

void AppleUSBALS::turnOnDevice(NSObject **this)
{
  int valuePtr = 2129;
  CFNumberRef v2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    ((void (*)(NSObject **, const __CFString *, CFNumberRef))(*this)[11].isa)(this, @"SensorPowerState", v2);
    inited = this[7];
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
      sub_11534();
    }
    CFRelease(v3);
  }
}

void AppleUSBALS::turnOffDevice(NSObject **this)
{
  int valuePtr = 2133;
  CFNumberRef v2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v2)
  {
    CFNumberRef v3 = v2;
    ((void (*)(NSObject **, const __CFString *, CFNumberRef))(*this)[11].isa)(this, @"SensorPowerState", v2);
    inited = this[7];
    if (!inited)
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
      sub_115B4();
    }
    CFRelease(v3);
  }
}

double AppleUSBALS::getUnscaledValueWithExponent(AppleUSBALS *this, double a2, unsigned int a3)
{
  if (a3 > 7)
  {
    double v4 = a2;
    if (a3 <= 0xF) {
      double v4 = a2 / __exp10((double)(16 - a3));
    }
  }
  else
  {
    double v4 = __exp10((double)a3) * a2;
  }
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_11634();
  }
  return v4;
}

uint64_t AppleUSBALS::setElementIntValue(IOHIDDeviceRef *this, __IOHIDElement *a2, CFIndex a3)
{
  uint64_t result = 3758097090;
  if (a2 && this[18])
  {
    uint64_t v7 = mach_absolute_time();
    int v8 = IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, a2, v7, a3);
    if (v8)
    {
      int v9 = v8;
      uint64_t v10 = IOHIDDeviceSetValue(this[18], a2, v8);
      CFRelease(v9);
      return v10;
    }
    else
    {
      inited = this[7];
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
        sub_116AC();
      }
      return 3758097084;
    }
  }
  return result;
}

uint64_t AppleUSBALS::setElementFloatValue(IOHIDDeviceRef *this, __IOHIDElement *a2, double a3)
{
  uint64_t result = 3758097090;
  if (a2 && this[18])
  {
    uint64_t v7 = mach_absolute_time();
    ScaledCFNumberRef Value = AppleUSBALS::getScaledValue((AppleUSBALS *)this, a3, a2);
    int v9 = IOHIDValueCreateWithIntegerValue(kCFAllocatorDefault, a2, v7, (uint64_t)ScaledValue);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = IOHIDDeviceSetValue(this[18], a2, v9);
      CFRelease(v10);
      return v11;
    }
    else
    {
      inited = this[7];
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
        sub_116AC();
      }
      return 3758097084;
    }
  }
  return result;
}

double AppleUSBALS::getScaledValue(AppleUSBALS *this, double a2, __IOHIDElement *a3)
{
  if (IOHIDElementGetUnitExponent(a3))
  {
    uint32_t UnitExponent = IOHIDElementGetUnitExponent(a3);
    return AppleUSBALS::getScaledValueWithExponent(this, a2, UnitExponent);
  }
  else
  {
    CFIndex LogicalMax = IOHIDElementGetLogicalMax(a3);
    CFIndex v9 = LogicalMax - IOHIDElementGetLogicalMin(a3);
    CFIndex PhysicalMax = IOHIDElementGetPhysicalMax(a3);
    return (double)(v9 / (PhysicalMax - IOHIDElementGetPhysicalMin(a3))) * a2;
  }
}

uint64_t AppleUSBALS::setFloatValueForUsage(AppleUSBALS *this, int a2, int a3, double a4)
{
  Element = AppleUSBALS::getElement(this, a2, a3, kIOHIDElementTypeFeature);

  return AppleUSBALS::setElementFloatValue((IOHIDDeviceRef *)this, Element, a4);
}

uint64_t AppleUSBALS::getElementFloatValueFromTransaction(AppleUSBALS *this, IOHIDTransactionRef transaction, IOHIDElementRef element, float *a4)
{
  uint64_t result = 3758097090;
  if (transaction && element && a4)
  {
    CFNumberRef Value = IOHIDTransactionGetValue(transaction, element, 0);
    if (Value)
    {
      ScaledCFNumberRef Value = IOHIDValueGetScaledValue(Value, 1u);
      uint64_t result = 0;
      *(float *)&ScaledCFNumberRef Value = ScaledValue;
      *a4 = *(float *)&ScaledValue;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

double AppleUSBALS::getScaledValueWithExponent(AppleUSBALS *this, double a2, unsigned int a3)
{
  if (a3 > 7)
  {
    double v4 = a2;
    if (a3 <= 0xF) {
      double v4 = __exp10((double)(16 - a3)) * a2;
    }
  }
  else
  {
    double v4 = a2 / __exp10((double)a3);
  }
  inited = *((void *)this + 7);
  if (!inited)
  {
    inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = init_default_corebrightness_log();
    }
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEBUG)) {
    sub_11634();
  }
  return v4;
}

double AppleUSBALS::getScaledValuePhysical(AppleUSBALS *this, double a2, double a3)
{
  return a2 * a3;
}

uint64_t sub_F448(std::__thread_struct **a1)
{
  uint64_t v10 = a1;
  uint64_t v1 = std::__thread_local_data();
  CFNumberRef v2 = *v10;
  *uint64_t v10 = 0;
  pthread_setspecific(v1->__key_, v2);
  CFNumberRef v3 = v10[1];
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  v3[9].__p_ = Current;
  if (Current)
  {
    CFRetain(Current);
    p = v3[18].__p_;
    if (p)
    {
      IOHIDDeviceScheduleWithRunLoop(p, v3[9].__p_, kCFRunLoopDefaultMode);
    }
    else
    {
      inited = v3[7].__p_;
      if (!inited)
      {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
        if (!_COREBRIGHTNESS_LOG_DEFAULT) {
          inited = init_default_corebrightness_log();
        }
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
        sub_11714();
      }
    }
    uint64_t v7 = v3[7].__p_;
    if (!v7)
    {
      uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v7 = init_default_corebrightness_log();
      }
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_116E0();
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v3[48].__p_);
    CFRunLoopRun();
    int v8 = v3[18].__p_;
    if (v8)
    {
      IOHIDDeviceUnscheduleFromRunLoop(v8, v3[9].__p_, kCFRunLoopDefaultMode);
      IOHIDDeviceRegisterInputValueCallback(v3[18].__p_, 0, v3);
      IOHIDDeviceRegisterRemovalCallback(v3[18].__p_, 0, v3);
    }
  }
  sub_F5A0(&v10);
  return 0;
}

void sub_F58C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_F5A0((std::__thread_struct ***)va);
  _Unwind_Resume(a1);
}

std::__thread_struct ***sub_F5A0(std::__thread_struct ***result)
{
  uint64_t v1 = *result;
  *uint64_t result = 0;
  if (v1)
  {
    sub_F5F4(v1, 0);
    operator delete();
  }
  return result;
}

std::__thread_struct *sub_F5F4(std::__thread_struct **a1, std::__thread_struct *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    std::__thread_struct::~__thread_struct(result);
    operator delete();
  }
  return result;
}

void sub_F644(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_F66C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_F688(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_F6A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_F6C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_F700(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

double sub_F780@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 8) = a2;
  return *(float *)a1;
}

void sub_F7A4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_F7B0()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create CoreBrightness default log", v0, 2u);
}

void sub_F7F8()
{
  sub_F720();
  sub_F66C(&dword_0, v0, v1, "kIOMessageDeviceWillPowerOff: stateNumber = %lu", v2, v3, v4, v5, v6);
}

void sub_F860()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "kIOMessageDeviceHasPoweredOn", v2, v3, v4, v5, v6);
}

void sub_F894()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "Clamshell is open", v2, v3, v4, v5, v6);
}

void sub_F8C8()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "Clamshell is close", v2, v3, v4, v5, v6);
}

void sub_F8FC()
{
  sub_F6DC();
  sub_F6C0(&dword_0, v0, v1, "messageIOHIDElementType Type = %u", v2, v3, v4, v5, v6);
}

void sub_F964(uint64_t a1, uint64_t *a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 252);
  uint64_t v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "registered notification 0x%X on port %p", (uint8_t *)v5, 0x12u);
}

void sub_F9F4()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: refcon == NULL", v2, v3, v4, v5, v6);
}

void sub_FA28()
{
  sub_F720();
  sub_F66C(&dword_0, v0, v1, "report already processed with timestamp %llu", v2, v3, v4, v5, v6);
}

void sub_FA90()
{
  sub_F6DC();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "usage=0x%X page=0x%X", v2, 0xEu);
}

void sub_FB14()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: invalid value (valueRef = NULL)", v2, v3, v4, v5, v6);
}

void sub_FB48()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to retrieve element", v2, v3, v4, v5, v6);
}

void sub_FB7C()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: denominator is 0", v2, v3, v4, v5, v6);
}

void sub_FBB0()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, (const char *)&unk_12B4A, v2, v3, v4, v5, v6);
}

void sub_FBE4()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to create HID event", v2, v3, v4, v5, v6);
}

void sub_FC18()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to update current ambient values", v2, v3, v4, v5, v6);
}

void sub_FC4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FCC4()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "couldn't find the device version", v2, v3, v4, v5, v6);
}

void sub_FCF8()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error opening device: 0x%X", v2, v3, v4, v5, v6);
}

void sub_FD60()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "unable to retrieve scaled values for color", v2, v3, v4, v5, v6);
}

void sub_FD94()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "unable to get HID values for color (result=0x%X)", v2, v3, v4, v5, v6);
}

void sub_FDFC()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to create version object", v2, v3, v4, v5, v6);
}

void sub_FE30()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to publish LGP version", v2, v3, v4, v5, v6);
}

void sub_FE64()
{
  sub_F7A4(__stack_chk_guard);
  sub_F768();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "error: unable to setup transaction (transaction=%p ioHIDDeviceRef= %p)", v1, 0x16u);
}

void sub_FED8()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error: commit failed (0x%X)", v2, v3, v4, v5, v6);
}

void sub_FF40()
{
  sub_F72C();
  sub_F66C(&dword_0, v0, v1, "%f", v2, v3, v4, v5, v6);
}

void sub_FFAC()
{
  sub_F720();
  sub_F66C(&dword_0, v0, v1, "IOHIDValueRef value = %@", v2, v3, v4, v5, v6);
}

void sub_10014()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to retrieve rescaled values", v2, v3, v4, v5, v6);
}

void sub_10048()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error: failed to commit whitepoint transaction (0x%X)", v2, v3, v4, v5, v6);
}

void sub_100B0()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: missing whitepoint target element", v2, v3, v4, v5, v6);
}

void sub_100E4()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error (%d) committing transaction to retrieve sensor reporting state", v2, v3, v4, v5, v6);
}

void sub_1014C()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error (%d) committing transaction to retrieve sensor power state", v2, v3, v4, v5, v6);
}

void sub_101B4()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error (%d) committing transaction to retrieve sensor state", v2, v3, v4, v5, v6);
}

void sub_1021C()
{
  sub_F720();
  sub_F66C(&dword_0, v0, v1, "key=%@ \n", v2, v3, v4, v5, v6);
}

void sub_10284()
{
  sub_F7A4(__stack_chk_guard);
  sub_F6F4();
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  sub_F700(&dword_0, v1, v2, "value=%p ret=%ld success", v3, v4);
}

void sub_102FC()
{
  sub_F7A4(__stack_chk_guard);
  sub_F790();
  int v3 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "value=%p result=%d", v2, 0x12u);
}

void sub_10378(__IOHIDElement *a1, NSObject *a2)
{
  IOHIDElementGetUnitExponent(a1);
  sub_F6DC();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "exponent=0x%X", v3, 8u);
}

void sub_10400()
{
  sub_F720();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_F700(&dword_0, v0, v1, "element=%p transaction=%p", v2, v3);
}

void sub_10474()
{
  sub_F790();
  int v3 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "DFRProtocolVersion: protocol version handshake: %s (0x%X)", v2, 0x12u);
}

void sub_10504()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "DFRProtocolVersion: testing purposes only", v2, v3, v4, v5, v6);
}

void sub_10538()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to commit whitepoint updat", v2, v3, v4, v5, v6);
}

void sub_1056C()
{
  sub_F6E8();
  sub_F6C0(&dword_0, v0, v1, "logging ktrace end %X", v2, v3, v4, v5, 0);
}

void sub_105E0()
{
  sub_F6E8();
  sub_F6C0(&dword_0, v0, v1, "logging ktrace start %X", v2, v3, v4, v5, 0);
}

void sub_10654()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "invalid notification token", v2, v3, v4, v5, v6);
}

void sub_10688()
{
  sub_F6E8();
  sub_F6C0(&dword_0, v0, v1, "logging ktrace end %X (S)", v2, v3, v4, v5, 0);
}

void sub_106FC()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "commit failed with 0x%X", v2, v3, v4, v5, v6);
}

void sub_10764()
{
  sub_F6E8();
  sub_F6C0(&dword_0, v0, v1, "logging ktrace start %X (S)", v2, v3, v4, v5, 0);
}

void sub_107D8()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "unsupported type", v2, v3, v4, v5, v6);
}

void sub_1080C(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "displayStatePeriod reportID=0x%X", buf, 8u);
}

void sub_10854(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "displayState reportID=0x%X", buf, 8u);
}

void sub_1089C(uint64_t a1)
{
  sub_F780(a1, __stack_chk_guard);
  sub_F72C();
  sub_F66C(&dword_0, v1, v2, "sensor color sensitivity value: %f", v3, v4, v5, v6, v7);
}

void sub_10904(uint64_t a1)
{
  sub_F780(a1, __stack_chk_guard);
  sub_F72C();
  sub_F66C(&dword_0, v1, v2, "sensor absolute sensitivity value: %f", v3, v4, v5, v6, v7);
}

void sub_1096C()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to retrieve the sensitivity value", v2, v3, v4, v5, v6);
}

void sub_109A0(uint64_t a1)
{
  sub_F780(a1, __stack_chk_guard);
  sub_F72C();
  sub_F66C(&dword_0, v1, v2, "sensor sensitivity value: %f", v3, v4, v5, v6, v7);
}

void sub_10A08()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: setting sensor reporting state unsupported on this platform", v2, v3, v4, v5, v6);
}

void sub_10A3C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10AAC()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: setting sensor power state unsupported on this platform", v2, v3, v4, v5, v6);
}

void sub_10AE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10B50()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "Failed to set report interval.", v2, v3, v4, v5, v6);
}

void sub_10B84()
{
  sub_F720();
  sub_F700(&dword_0, v0, v1, "key=%@ value=%@");
}

void sub_10BF8()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "Preferences changed: %{public}s", v2, v3, v4, v5, v6);
}

void sub_10C78()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: invalid element", v2, v3, v4, v5, v6);
}

void sub_10CAC()
{
  sub_F72C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "error: value is outside the limits (IOHIDValueRef value = %f)", v1, 0xCu);
}

void sub_10D24()
{
  sub_F720();
  sub_F66C(&dword_0, v0, v1, "hidvalue=%p", v2, v3, v4, v5, v6);
}

void sub_10D8C()
{
  sub_F6E8();
  sub_F6C0(&dword_0, v0, v1, "logging ktrace end %X (A)", v2, v3, v4, v5, 0);
}

void sub_10E00()
{
  sub_F6E8();
  sub_F6C0(&dword_0, v0, v1, "logging ktrace start %X (A)", v2, v3, v4, v5, 0);
}

void sub_10E74()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to create semaphore for event thread", v2, v3, v4, v5, v6);
}

void sub_10EA8()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "timeout waiting for the event thread to start", v2, v3, v4, v5, v6);
}

void sub_10EDC()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: invalid hid device", v2, v3, v4, v5, v6);
}

void sub_10F10()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: missing interval element", v2, v3, v4, v5, v6);
}

void sub_10F44()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to create hid value", v2, v3, v4, v5, v6);
}

void sub_10F78()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "device interval set to 200ms", v2, v3, v4, v5, v6);
}

void sub_10FAC()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to set the report interval", v2, v3, v4, v5, v6);
}

void sub_10FE0()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "device absolute sensitivity set (%s)", v2, v3, v4, v5, v6);
}

void sub_11060()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "device sensitivity set (%s)", v2, v3, v4, v5, v6);
}

void sub_110E0()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "device reporting state on (%s)", v2, v3, v4, v5, v6);
}

void sub_11160()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: unable to register for system power", v2, v3, v4, v5, v6);
}

void sub_11194()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to create port for clamshell state notification", v2, v3, v4, v5, v6);
}

void sub_111C8()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to get service IOPMrootDomain", v2, v3, v4, v5, v6);
}

void sub_111FC()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "error: failed to add UserActiveChanged notification", v2, v3, v4, v5, v6);
}

void sub_11230()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "failed to add ClamshellState notification", v2, v3, v4, v5, v6);
}

void sub_11264()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "display wrangler missing -> notification armed", v2, v3, v4, v5, v6);
}

void sub_11298()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "error creating notification for display wrangler (0x%X)", v2, v3, v4, v5, v6);
}

void sub_11300()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "device runloop finished", v2, v3, v4, v5, v6);
}

void sub_11334()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "device callback runloop exit", v2, v3, v4, v5, v6);
}

void sub_11368()
{
  sub_F750();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "removing port %p and notification %u", v1, 0x12u);
}

void sub_113E4()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "AppleUSBALS::stopClamshellStateMonitoring: unregistering UserActiveChanged notification %lu", v2, v3, v4, v5, v6);
}

void sub_11450()
{
  sub_F750();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "AppleUSBALS::stopClamshellStateMonitoring: removing port %p and notification %u", v1, 0x12u);
}

void sub_114CC()
{
  sub_F6DC();
  sub_F688(&dword_0, v0, v1, "failed to retrieve illuminance (0x%X)", v2, v3, v4, v5, v6);
}

void sub_11534()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "device turned on (%{public}s)", v2, v3, v4, v5, v6);
}

void sub_115B4()
{
  sub_F6F4();
  sub_F66C(&dword_0, v0, v1, "device turned off (%{public}s)", v2, v3, v4, v5, v6);
}

void sub_11634()
{
  sub_F738();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%f -> %f", v1, 0x16u);
}

void sub_116AC()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "can not create IOHIDValue", v2, v3, v4, v5, v6);
}

void sub_116E0()
{
  sub_F660();
  sub_F6A4(&dword_0, v0, v1, "device callback runloop created", v2, v3, v4, v5, v6);
}

void sub_11714()
{
  sub_F660();
  sub_F644(&dword_0, v0, v1, "_hidDFRDisplay.ioHIDDeviceRef invalid", v2, v3, v4, v5, v6);
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

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
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

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceClose(device, options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return _IOHIDDeviceCopyMatchingElements(device, matching, options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return _IOHIDDeviceCreate(allocator, service);
}

IOReturn IOHIDDeviceGetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue)
{
  return _IOHIDDeviceGetValue(device, element, pValue);
}

IOReturn IOHIDDeviceGetValueWithOptions(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue, uint32_t options)
{
  return _IOHIDDeviceGetValueWithOptions(device, element, pValue, options);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceOpen(device, options);
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceScheduleWithRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void IOHIDDeviceSetInputValueMatchingMultiple(IOHIDDeviceRef device, CFArrayRef multiple)
{
}

IOReturn IOHIDDeviceSetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef value)
{
  return _IOHIDDeviceSetValue(device, element, value);
}

void IOHIDDeviceUnscheduleFromRunLoop(IOHIDDeviceRef device, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return _IOHIDElementGetCookie(element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return _IOHIDElementGetLogicalMax(element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return _IOHIDElementGetLogicalMin(element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return _IOHIDElementGetPhysicalMax(element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return _IOHIDElementGetPhysicalMin(element);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return _IOHIDElementGetReportCount(element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return _IOHIDElementGetReportID(element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return _IOHIDElementGetType(element);
}

CFTypeID IOHIDElementGetTypeID(void)
{
  return _IOHIDElementGetTypeID();
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return _IOHIDElementGetUnitExponent(element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return _IOHIDElementGetUsage(element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return _IOHIDElementGetUsagePage(element);
}

uint64_t IOHIDEventCreateAmbientLightSensorEvent()
{
  return _IOHIDEventCreateAmbientLightSensorEvent();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return _IOHIDEventSetDoubleValue();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

uint64_t IOHIDPreferencesCopyMultiple()
{
  return _IOHIDPreferencesCopyMultiple();
}

uint64_t IOHIDPreferencesSet()
{
  return _IOHIDPreferencesSet();
}

uint64_t IOHIDPreferencesSynchronize()
{
  return _IOHIDPreferencesSynchronize();
}

void IOHIDTransactionAddElement(IOHIDTransactionRef transaction, IOHIDElementRef element)
{
}

IOReturn IOHIDTransactionCommit(IOHIDTransactionRef transaction)
{
  return _IOHIDTransactionCommit(transaction);
}

IOHIDTransactionRef IOHIDTransactionCreate(CFAllocatorRef allocator, IOHIDDeviceRef device, IOHIDTransactionDirectionType direction, IOOptionBits options)
{
  return _IOHIDTransactionCreate(allocator, device, direction, options);
}

IOHIDValueRef IOHIDTransactionGetValue(IOHIDTransactionRef transaction, IOHIDElementRef element, IOOptionBits options)
{
  return _IOHIDTransactionGetValue(transaction, element, options);
}

void IOHIDTransactionSetValue(IOHIDTransactionRef transaction, IOHIDElementRef element, IOHIDValueRef value, IOOptionBits options)
{
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return _IOHIDValueCreateWithBytes(allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return _IOHIDValueCreateWithIntegerValue(allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return _IOHIDValueGetBytePtr(value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return _IOHIDValueGetElement(value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return _IOHIDValueGetIntegerValue(value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return _IOHIDValueGetLength(value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  return _IOHIDValueGetScaledValue(value, type);
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return _IOHIDValueGetTimeStamp(value);
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

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return _IOObjectCopyClass(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

uint64_t IOPMScheduleUserActiveChangedNotification()
{
  return _IOPMScheduleUserActiveChangedNotification();
}

uint64_t IOPMUnregisterNotification()
{
  return _IOPMUnregisterNotification();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IOHIDElementSetValue()
{
  return __IOHIDElementSetValue();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return std::__thread_struct::__thread_struct(this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return std::__thread_local_data();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}