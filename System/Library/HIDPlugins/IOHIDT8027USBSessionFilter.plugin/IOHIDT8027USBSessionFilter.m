CFTypeRef IOHIDT8027USBSessionFilter::getPropertyForClient(IOHIDT8027USBSessionFilter *this, CFTypeRef cf1, const void *a3)
{
  CFTypeRef v4;
  unint64_t v6;
  CFTypeRef cf;

  if (!CFEqual(cf1, @"SessionFilterDebug")) {
    return 0;
  }
  v6 = 0xAAAAAAAAAAAAAAAALL;
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407BECF8(&v6, 0);
  IOHIDT8027USBSessionFilter::serialize(this, (__CFDictionary *)cf);
  if (cf) {
    v4 = CFRetain(cf);
  }
  else {
    v4 = 0;
  }
  sub_2407BEE1C(&v6);
  return v4;
}

void sub_2407BD788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDT8027USBSessionFilter::registerService(uint64_t a1, const void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  sub_2407BDD7C(&v13, "Transport");
  if (*(void *)(a1 + 56)) {
    BOOL v4 = v14 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4
    && (IOHIDServiceConformsTo()
     || IOHIDServiceConformsTo()
     || IOHIDServiceConformsTo()))
  {
    v5 = (const void *)IOHIDServiceCopyProperty();
    v6 = v5;
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFEqual(v6, @"USB"))
      {
        CFSetSetValue(*(CFMutableSetRef *)(a1 + 56), a2);
        if (*(unsigned char *)(a1 + 86))
        {
          v12 = _IOHIDLogCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2407BC000, v12, OS_LOG_TYPE_DEFAULT, "T8027 assertion previously timed out, not taking assertion\n", buf, 2u);
          }
        }
        else if (*(unsigned char *)(a1 + 84))
        {
          CFStringRef v8 = sub_2407BE1C8();
          v9 = _IOHIDLogCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 72);
            *(_DWORD *)buf = 138412546;
            CFStringRef v16 = v8;
            __int16 v17 = 2048;
            uint64_t v18 = v10;
            _os_log_impl(&dword_2407BC000, v9, OS_LOG_TYPE_DEFAULT, "Creating T8027USB assertion for %@ (timeout:%llus)\n", buf, 0x16u);
          }
          IOHIDT8027USBSessionFilter::preventIdleSleepAssertion((IOHIDT8027USBSessionFilter *)a1, v8);
          if (v8) {
            CFRelease(v8);
          }
        }
      }
      CFRelease(v6);
    }
  }
  return sub_2407BDD2C(&v13);
}

void sub_2407BD99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void IOHIDT8027USBSessionFilter::setPropertyForClient(IOHIDT8027USBSessionFilter *this, CFTypeRef cf1, __CFString *a3, const void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (CFEqual(cf1, @"T8027USBAssertionTimeout"))
  {
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFTypeID v7 = _IOHIDLogCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = (__CFString *)*((void *)this + 9);
      v9 = &stru_26F4E86C0;
      if (a3) {
        v9 = a3;
      }
      *(_DWORD *)buf = 134218242;
      v15 = v8;
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_impl(&dword_2407BC000, v7, OS_LOG_TYPE_DEFAULT, "Setting T8027 USB assertion timeout from %llu to %@\n", buf, 0x16u);
    }
    if (a3)
    {
      CFTypeID v10 = CFGetTypeID(a3);
      if (v10 == CFNumberGetTypeID())
      {
        CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
        *((void *)this + 9) = valuePtr;
      }
    }
  }
  else if (CFEqual(cf1, @"T8027USBSetAssertion"))
  {
    v11 = _IOHIDLogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = &stru_26F4E86C0;
      if (a3) {
        v12 = a3;
      }
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_2407BC000, v11, OS_LOG_TYPE_DEFAULT, "Setting T8027 USB assertion state %@\n", buf, 0xCu);
    }
    if ((__CFString *)*MEMORY[0x263EFFB40] == a3)
    {
      IOHIDT8027USBSessionFilter::preventIdleSleepAssertion(this, @"SetProperty");
    }
    else if (*((_DWORD *)this + 20))
    {
      IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion(this);
    }
  }
}

uint64_t IOHIDT8027USBSessionFilter::filter(uint64_t a1, const void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 56)) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = v4 || a3 == 0;
  if (!v5
    && IOHIDEventConformsTo()
    && IOHIDEventGetIntegerValue()
    && CFSetContainsValue(*(CFSetRef *)(a1 + 56), a2)
    && *(unsigned char *)(a1 + 84))
  {
    CFStringRef v8 = sub_2407BE1C8();
    v9 = _IOHIDLogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2407BC000, v9, OS_LOG_TYPE_INFO, "T8027USB HID activity\n", v11, 2u);
    }
    IOHIDT8027USBSessionFilter::preventIdleSleepAssertion((IOHIDT8027USBSessionFilter *)a1, v8);
    *(unsigned char *)(a1 + 86) = 0;
    if (v8) {
      CFRelease(v8);
    }
  }
  return a3;
}

void IOHIDT8027USBSessionFilter::unregisterService(uint64_t a1, const void *a2)
{
  CFSetRef v3 = *(const __CFSet **)(a1 + 56);
  if (v3)
  {
    if (CFSetContainsValue(v3, a2))
    {
      CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 56), a2);
      if (*(unsigned char *)(a1 + 84))
      {
        if (!CFSetGetCount(*(CFSetRef *)(a1 + 56)))
        {
          BOOL v5 = _IOHIDLogCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v6 = 0;
            _os_log_impl(&dword_2407BC000, v5, OS_LOG_TYPE_DEFAULT, "Removing T8027USB assertion\n", v6, 2u);
          }
          IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion((IOHIDT8027USBSessionFilter *)a1);
        }
      }
    }
  }
}

void *sub_2407BDD2C(void *a1)
{
  v2 = (const void *)a1[1];
  *a1 = &unk_26F4E8488;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407BDD7C(void *a1, const char *a2)
{
  *a1 = &unk_26F4E8440;
  a1[1] = CFStringCreateWithCString(0, a2, 0);
  return a1;
}

void sub_2407BDDCC(_Unwind_Exception *a1)
{
  sub_2407BDD2C(v1);
  _Unwind_Resume(a1);
}

IOHIDT8027USBSessionFilter *IOHIDT8027USBSessionFilterFactory(uint64_t a1, const void *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (!CFEqual(a2, v4)) {
    return 0;
  }
  BOOL v5 = (IOHIDT8027USBSessionFilter *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 88, 0);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0xC8u, 0x52u, 0xD4u, 0xBFu, 0x2Cu, 0x29u, 0x4Du, 0xCBu, 0xBBu, 0x7Eu, 0x88u, 0x54u, 0x8Fu, 0x66u, 0xAAu, 0x41u);
  IOHIDT8027USBSessionFilter::IOHIDT8027USBSessionFilter(v5, v6);
  return v5;
}

uint64_t IOHIDT8027USBSessionFilter::_AddRef(IOHIDT8027USBSessionFilter *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void IOHIDT8027USBSessionFilter::IOHIDT8027USBSessionFilter(IOHIDT8027USBSessionFilter *this, CFTypeRef cf)
{
  *(void *)this = &IOHIDT8027USBSessionFilter::sIOHIDT8027USBSessionFilterFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  sub_2407BEB4C((void *)this + 6, 0);
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 7200;
  *((_DWORD *)this + 20) = 0;
  *((_WORD *)this + 42) = 0;
  if (MGGetSInt32Answer() == 1) {
    *((void *)this + 9) = 480;
  }
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
}

void sub_2407BDF9C(_Unwind_Exception *a1)
{
  sub_2407BEC34(v1);
  _Unwind_Resume(a1);
}

void IOHIDT8027USBSessionFilter::~IOHIDT8027USBSessionFilter(CFUUIDRef *this)
{
}

void sub_2407BDFF4(void *a1)
{
}

uint64_t IOHIDT8027USBSessionFilter::QueryInterface(IOHIDT8027USBSessionFilter *this, CFUUIDBytes a2, void **a3)
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

uint64_t IOHIDT8027USBSessionFilter::AddRef(IOHIDT8027USBSessionFilter *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDT8027USBSessionFilter::Release(IOHIDT8027USBSessionFilter *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDT8027USBSessionFilter::~IOHIDT8027USBSessionFilter((CFUUIDRef *)this);
    MEMORY[0x2455FAA60]();
  }
  return v2;
}

CFStringRef sub_2407BE1C8()
{
  uint64_t valuePtr = 0;
  v0 = (__CFString *)IOHIDServiceCopyProperty();
  int v1 = &stru_26F4E86C0;
  if (v0)
  {
    uint64_t v2 = v0;
    CFTypeID v3 = CFGetTypeID(v0);
    if (v3 == CFStringGetTypeID()) {
      int v1 = v2;
    }
    CFRelease(v2);
  }
  CFNumberRef RegistryID = (const __CFNumber *)IOHIDServiceGetRegistryID();
  if (RegistryID && (CFNumberRef v5 = RegistryID, v6 = CFGetTypeID(RegistryID), v6 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
    uint64_t v7 = valuePtr;
  }
  else
  {
    uint64_t v7 = 0;
  }
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"RegID:0x%llx %@", v7, v1);
}

void IOHIDT8027USBSessionFilter::preventIdleSleepAssertion(IOHIDT8027USBSessionFilter *this, const __CFString *a2)
{
  int valuePtr = 255;
  CFTypeID v3 = (IOPMAssertionID *)((char *)this + 80);
  if (*((_DWORD *)this + 20))
  {
    CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (!v4) {
      return;
    }
    CFNumberRef v5 = v4;
    if (IOPMAssertionSetProperty(*v3, @"AssertLevel", v4))
    {
      CFTypeID v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_2407BF168();
      }
LABEL_9:
      CFRelease(v5);
      return;
    }
LABEL_8:
    CFUUIDRef v9 = *((void *)this + 8);
    dispatch_time_t v10 = dispatch_time(0, 1000000000 * *((void *)this + 9));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    *((unsigned char *)this + 85) = 1;
    if (!v5) {
      return;
    }
    goto LABEL_9;
  }
  if (!IOHIDT8027USBSessionFilter::initTimer(this)) {
    return;
  }
  IOReturn v8 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", @"IOHIDT8027USBAssertion", a2, 0, 0, 0.0, 0, v3);
  CFNumberRef v5 = 0;
  if (!v8) {
    goto LABEL_8;
  }
  v11 = _IOHIDLogCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_2407BF0F4();
  }
}

void IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion(IOHIDT8027USBSessionFilter *this)
{
  uint64_t v2 = *((void *)this + 8);
  if (v2)
  {
    dispatch_source_cancel(v2);
    *((void *)this + 8) = 0;
  }
  if (IOPMAssertionRelease(*((_DWORD *)this + 20)))
  {
    CFTypeID v3 = _IOHIDLogCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2407BF1DC();
    }
  }
  *((_DWORD *)this + 20) = 0;
  *((unsigned char *)this + 85) = 0;
}

void IOHIDT8027USBSessionFilter::scheduleWithDispatchQueue(IOHIDT8027USBSessionFilter *this, dispatch_queue_s *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v10 = xmmword_2650D6288;
  *(_OWORD *)keys = xmmword_2650D6278;
  *((void *)this + 3) = a2;
  IONotificationPortRef v3 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
  *((void *)this + 4) = v3;
  if (v3)
  {
    CFNumberRef v4 = v3;
    CFDictionaryRef v5 = IOServiceNameMatching("usb-drd,t8027");
    if (IOServiceAddMatchingNotification(v4, "IOServiceFirstPublish", v5, (IOServiceMatchingCallback)IOHIDT8027USBSessionFilter::_serviceNotificationCallback, this, (io_iterator_t *)this + 10))
    {
      IOReturn v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_2407BF250();
      }
    }
    else if (*((_DWORD *)this + 10))
    {
      CFDictionaryRef v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&v10, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v6)
      {
        uint64_t v7 = (io_iterator_t *)((char *)this + 44);
        if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 4), "IOServiceFirstPublish", v6, (IOServiceMatchingCallback)IOHIDT8027USBSessionFilter::_serviceNotificationCallback, this, (io_iterator_t *)this + 11))
        {
          CFUUIDRef v9 = _IOHIDLogCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_2407BF250();
          }
        }
        else if (*v7)
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 4), *((dispatch_queue_t *)this + 3));
          if (IOIteratorNext(*((_DWORD *)this + 10))) {
            *((unsigned char *)this + 84) = 1;
          }
          if (IOIteratorNext(*v7)) {
            *((unsigned char *)this + 84) = 1;
          }
        }
      }
    }
  }
}

uint64_t IOHIDT8027USBSessionFilter::_serviceNotificationCallback(IOHIDT8027USBSessionFilter *this, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result) {
    *((unsigned char *)this + 84) = 1;
  }
  return result;
}

uint64_t IOHIDT8027USBSessionFilter::serviceNotificationCallback(IOHIDT8027USBSessionFilter *this, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result) {
    *((unsigned char *)this + 84) = 1;
  }
  return result;
}

void IOHIDT8027USBSessionFilter::unscheduleFromDispatchQueue(IOHIDT8027USBSessionFilter *this, dispatch_queue_s *a2)
{
  if (*((_DWORD *)this + 20)) {
    IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion(this);
  }
  io_object_t v3 = *((_DWORD *)this + 10);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 10) = 0;
  }
  io_object_t v4 = *((_DWORD *)this + 11);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 11) = 0;
  }
  CFDictionaryRef v5 = (IONotificationPort *)*((void *)this + 4);
  if (v5)
  {
    IONotificationPortDestroy(v5);
    *((void *)this + 4) = 0;
  }
}

void *IOHIDT8027USBSessionFilter::serialize(IOHIDT8027USBSessionFilter *this, __CFDictionary *a2)
{
  unint64_t v13 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407BEE6C(&v13, a2, 0);
  unint64_t v13 = &unk_26F4E84A8;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDT8027USBSessionFilter");
  io_object_t v3 = (const void *)*MEMORY[0x263EFFB40];
  io_object_t v4 = (const void *)*MEMORY[0x263EFFB38];
  if (*((unsigned char *)this + 84)) {
    CFDictionaryRef v5 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    CFDictionaryRef v5 = (const void *)*MEMORY[0x263EFFB38];
  }
  if (v5) {
    CFDictionarySetValue(theDict, @"HasT8027USB", v5);
  }
  sub_2407BEF94(&v11, *((void *)this + 9));
  if (value) {
    CFDictionarySetValue(theDict, @"AssertionTimeout", value);
  }
  sub_2407BEF08(&v11);
  if (*((unsigned char *)this + 85)) {
    CFDictionaryRef v6 = v3;
  }
  else {
    CFDictionaryRef v6 = v4;
  }
  if (v6) {
    CFDictionarySetValue(theDict, @"Asserting", v6);
  }
  CFIndex Count = CFSetGetCount(*((CFSetRef *)this + 7));
  sub_2407BE890((uint64_t)&v13, @"USBHIDServiceCount", Count);
  IOPMAssertionID v8 = *((_DWORD *)this + 20);
  if (v8)
  {
    CFDictionaryRef v9 = IOPMAssertionCopyProperties(v8);
    if (v9)
    {
      CFDictionarySetValue(theDict, @"AssertionProperties", v9);
      CFRelease(v9);
    }
  }
  return sub_2407BEE1C(&v13);
}

void sub_2407BE860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

void *sub_2407BE890(uint64_t a1, const void *a2, uint64_t a3)
{
  sub_2407BF048(&v6, a3);
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_2407BEF08(&v6);
}

void sub_2407BE8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t IOHIDT8027USBSessionFilter::initTimer(IOHIDT8027USBSessionFilter *this)
{
  if (*((void *)this + 8)) {
    return 1;
  }
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    io_object_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, v2);
    if (v3)
    {
      io_object_t v4 = v3;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = sub_2407BEA4C;
      handler[3] = &unk_2650D6298;
      handler[4] = this;
      dispatch_source_set_event_handler(v3, handler);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 0x40000000;
      v8[2] = sub_2407BEB44;
      v8[3] = &unk_2650D62B8;
      v8[4] = v4;
      dispatch_source_set_cancel_handler(v4, v8);
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      dispatch_activate(v4);
      *((void *)this + 8) = v4;
      return 1;
    }
  }
  uint64_t v6 = _IOHIDLogCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  uint64_t result = 0;
  if (v7)
  {
    sub_2407BF2C4(v6);
    return 0;
  }
  return result;
}

void sub_2407BEA4C(uint64_t a1)
{
}

void IOHIDT8027USBSessionFilter::timerHandler(IOHIDT8027USBSessionFilter *this)
{
  int valuePtr = 0;
  if (*((_DWORD *)this + 20))
  {
    uint64_t v2 = _IOHIDLogCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_2407BC000, v2, OS_LOG_TYPE_DEFAULT, "T8027USB HID assertion timeout\n", v6, 2u);
    }
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      if (IOPMAssertionSetProperty(*((_DWORD *)this + 20), @"AssertLevel", v3))
      {
        CFDictionaryRef v5 = _IOHIDLogCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_2407BF348();
        }
      }
      else
      {
        *(_WORD *)((char *)this + 85) = 256;
      }
      CFRelease(v4);
    }
  }
}

void sub_2407BEB44(uint64_t a1)
{
}

void *sub_2407BEB4C(void *a1, int a2)
{
  *a1 = &unk_26F4E83C0;
  a1[1] = 0;
  a1[1] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, MEMORY[0x263EFFFA0]);
  return a1;
}

void sub_2407BEBAC(_Unwind_Exception *a1)
{
  sub_2407BEC34(v1);
  _Unwind_Resume(a1);
}

void sub_2407BEBC0(void *a1)
{
  sub_2407BEC34(a1);

  JUMPOUT(0x2455FAA60);
}

void sub_2407BEBFC(void *a1)
{
  sub_2407BEC34(a1);

  JUMPOUT(0x2455FAA60);
}

void *sub_2407BEC34(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E8420;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2407BEC84(void *a1)
{
  sub_2407BDD2C(a1);

  JUMPOUT(0x2455FAA60);
}

void sub_2407BECC0(void *a1)
{
  sub_2407BDD2C(a1);

  JUMPOUT(0x2455FAA60);
}

void *sub_2407BECF8(void *a1, int a2)
{
  *a1 = &unk_26F4E84A8;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return a1;
}

void sub_2407BED58(_Unwind_Exception *a1)
{
  sub_2407BEE1C(v1);
  _Unwind_Resume(a1);
}

void sub_2407BED6C(void *a1)
{
  sub_2407BEE1C(a1);

  JUMPOUT(0x2455FAA60);
}

void sub_2407BEDA8(void *a1)
{
  sub_2407BEE1C(a1);

  JUMPOUT(0x2455FAA60);
}

void sub_2407BEDE4(void *a1)
{
  sub_2407BEE1C(a1);

  JUMPOUT(0x2455FAA60);
}

void *sub_2407BEE1C(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E8528;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407BEE6C(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0;
    }
  }
  else
  {
    CFTypeRef v7 = 0;
  }
  *a1 = &unk_26F4E8528;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E8508;
  return a1;
}

void *sub_2407BEF08(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E8548;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2407BEF5C(void *a1)
{
  sub_2407BEF08(a1);

  JUMPOUT(0x2455FAA60);
}

void *sub_2407BEF94(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_26F4E8578;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_2407BEFFC(_Unwind_Exception *a1)
{
  sub_2407BEF08(v1);
  _Unwind_Resume(a1);
}

void sub_2407BF010(void *a1)
{
  sub_2407BEF08(a1);

  JUMPOUT(0x2455FAA60);
}

void *sub_2407BF048(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_26F4E8578;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_2407BF0B0(_Unwind_Exception *a1)
{
  sub_2407BEF08(v1);
  _Unwind_Resume(a1);
}

void sub_2407BF0D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_2407BF0F4()
{
  sub_2407BF0C4();
  sub_2407BF0D8(&dword_2407BC000, v0, v1, "%s error creating assertion 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_2407BF168()
{
  sub_2407BF0C4();
  sub_2407BF0D8(&dword_2407BC000, v0, v1, "%s error turning on assertion 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_2407BF1DC()
{
  sub_2407BF0C4();
  sub_2407BF0D8(&dword_2407BC000, v0, v1, "%s error releasing assertion 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_2407BF250()
{
  sub_2407BF0C4();
  sub_2407BF0D8(&dword_2407BC000, v0, v1, "%s adding matching notification 0x%x\n", v2, v3, v4, v5, 2u);
}

void sub_2407BF2C4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "BOOL IOHIDT8027USBSessionFilter::initTimer()";
  _os_log_error_impl(&dword_2407BC000, log, OS_LOG_TYPE_ERROR, "%s error\n", (uint8_t *)&v1, 0xCu);
}

void sub_2407BF348()
{
  sub_2407BF0C4();
  sub_2407BF0D8(&dword_2407BC000, v0, v1, "%s error turning off assertion 0x%x\n", v2, v3, v4, v5, 2u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
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

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x270EF41F0]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x270EF4688]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x270EF4690]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFDictionaryRef IOPMAssertionCopyProperties(IOPMAssertionID theAssertion)
{
  return (CFDictionaryRef)MEMORY[0x270EF4830](*(void *)&theAssertion);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4838](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x270EF4878](*(void *)&theAssertion, theProperty, theValue);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD8](name);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x270EF4BC8]();
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_release(dispatch_object_t object)
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}