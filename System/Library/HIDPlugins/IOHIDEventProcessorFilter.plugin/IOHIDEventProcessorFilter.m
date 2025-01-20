void *IOHIDEventProcessor::setEventCallback(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

uint64_t IOHIDEventProcessor::Release(IOHIDEventProcessor *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDEventProcessor::~IOHIDEventProcessor(this);
    MEMORY[0x2455F9440]();
  }
  return v2;
}

void IOHIDEventProcessor::~IOHIDEventProcessor(IOHIDEventProcessor *this)
{
  uint64_t v2 = (const void *)*((void *)this + 9);
  if (v2) {
    CFRelease(v2);
  }
  v3 = (void *)*((void *)this + 18);
  if (v3)
  {
    do
    {
      v4 = (void *)v3[2];
      (*(void (**)(void *))(*v3 + 8))(v3);
      v3 = v4;
    }
    while (v4);
  }
  v5 = (void *)*((void *)this + 19);
  if (v5)
  {
    do
    {
      v6 = (void *)v5[2];
      (*(void (**)(void *))(*v5 + 8))(v5);
      v5 = v6;
    }
    while (v6);
  }
  v7 = (void *)*((void *)this + 17);
  if (v7)
  {
    do
    {
      v8 = (void *)v7[2];
      (*(void (**)(void *))(*v7 + 8))(v7);
      v7 = v8;
    }
    while (v8);
  }
  uint64_t v9 = *((void *)this + 20);
  if (v9) {
    MEMORY[0x2455F9440](v9, 0x20C40960023A9);
  }
  CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)this + 1));
  CFRelease(*((CFTypeRef *)this + 1));
}

uint64_t IOHIDEventProcessor::match(uint64_t a1, uint64_t a2)
{
  CFNumberRef v4 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v4)
  {
    CFNumberRef v5 = v4;
    int valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr)
    {
      *(_DWORD *)(a1 + 20) = 200;
      *(void *)(a1 + 32) = a2;
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(a1 + 20) = 200;
    *(void *)(a1 + 32) = a2;
  }
  v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_24079EFC8(a1, a2, v6);
  }
  return *(unsigned int *)(a1 + 20);
}

void IOHIDEventProcessor::unscheduleFromDispatchQueue(IOHIDEventProcessor *this, void *a2, dispatch_queue_s *a3)
{
  if (*((void **)this + 3) == a2)
  {
    uint64_t v4 = *((void *)this + 20);
    if (*(void *)v4) {
      dispatch_source_cancel(*(dispatch_source_t *)v4);
    }
    *(void *)(v4 + 8) = 0;
    *((void *)this + 3) = 0;
  }
}

void IOHIDEventProcessor::open(IOHIDEventProcessor *a1)
{
  for (uint64_t i = 0; i != 9; ++i)
  {
    CFStringRef v3 = off_2650D5C60[i];
    uint64_t v4 = (const void *)IOHIDServiceCopyProperty();
    if (v4)
    {
      v6 = v4;
      IOHIDEventProcessor::setPropertyForClient(a1, v3, v4, v5);
      CFRelease(v6);
    }
  }
}

uint64_t IOHIDEventProcessorFactory(uint64_t a1, const void *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (CFEqual(a2, v4))
  {
    CFNumberRef v5 = (IOHIDEventProcessor *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 168, 0);
    CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0x7Du, 0xCFu, 0x18u, 0xB5u, 7u, 0xBEu, 0x4Fu, 0xF5u, 0x87u, 0xCFu, 0x44u, 0xB3u, 0xC1u, 0x7Cu, 0x92u, 0x16u);
    IOHIDEventProcessor::IOHIDEventProcessor(v5, v6);
  }
  return 0;
}

void IOHIDEventProcessor::IOHIDEventProcessor(IOHIDEventProcessor *this, CFTypeRef cf)
{
  *(void *)this = &IOHIDEventProcessor::sIOHIDEventProcessorFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 9) = 0;
  *((unsigned char *)this + 96) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((unsigned char *)this + 120) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  operator new();
}

uint64_t IOHIDEventProcessor::QueryInterface(IOHIDEventProcessor *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v8))|| (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
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

CFTypeRef IOHIDEventProcessor::copyPropertyForClient(IOHIDEventProcessor *this, CFTypeRef cf1, const void *a3)
{
  if (!CFEqual(cf1, @"ServiceFilterDebug")) {
    return 0;
  }
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_24079E774(&v6, 0);
  if (cf)
  {
    IOHIDEventProcessor::serialize(this, (__CFDictionary *)cf);
    CFTypeRef v4 = CFRetain(cf);
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  sub_24079E898(&v6);
  return v4;
}

void sub_24079BE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void Timer::init(Timer *this, dispatch_queue_t queue)
{
  *((void *)this + 1) = queue;
  if (!*(void *)this)
  {
    CFAllocatorRef v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, queue);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = sub_24079E56C;
    handler[3] = &unk_2650D5D28;
    handler[4] = this;
    dispatch_source_set_event_handler(v3, handler);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = sub_24079C788;
    v4[3] = &unk_2650D5D48;
    v4[4] = v3;
    dispatch_source_set_cancel_handler(v3, v4);
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    *(void *)this = v3;
    dispatch_resume(v3);
  }
}

uint64_t IOHIDEventProcessor::filter(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 24)) {
    return a2;
  }
  int Type = IOHIDEventGetType();
  int v5 = Type;
  if (Type == 3)
  {
    if (!*(unsigned char *)(a1 + 64)) {
      return a2;
    }
    unint64_t v6 = (unint64_t *)(a1 + 80);
    CFUUIDRef v7 = (unint64_t *)(a1 + 88);
    CFUUIDRef v8 = (uint64_t *)(a1 + 144);
  }
  else
  {
    if (Type != 29 || !*(unsigned char *)(a1 + 96)) {
      return a2;
    }
    unint64_t v6 = (unint64_t *)(a1 + 104);
    CFUUIDRef v7 = (unint64_t *)(a1 + 112);
    CFUUIDRef v8 = (uint64_t *)(a1 + 152);
  }
  v32 = v8;
  unint64_t v9 = *v7;
  unint64_t v10 = *v6;
  int IntegerValue = IOHIDEventGetIntegerValue();
  int v12 = IOHIDEventGetIntegerValue();
  v13 = _IOHIDLogCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(valuePtr) = 67109632;
    HIDWORD(valuePtr) = v5;
    __int16 v34 = 1024;
    int v35 = IntegerValue;
    __int16 v36 = 1024;
    int v37 = v12;
    _os_log_debug_impl(&dword_24079A000, v13, OS_LOG_TYPE_DEBUG, "filter: type = %d p = %d u = %d\n", (uint8_t *)&valuePtr, 0x14u);
  }
  if (v5 != 3) {
    goto LABEL_16;
  }
  CFArrayRef v14 = *(const __CFArray **)(a1 + 72);
  if (!v14) {
    goto LABEL_16;
  }
  CFIndex Count = CFArrayGetCount(v14);
  if (Count < 1) {
    goto LABEL_22;
  }
  CFIndex v16 = Count;
  unint64_t v31 = v9;
  CFIndex v17 = 0;
  char v18 = 0;
  do
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 72), v17);
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue(ValueAtIndex, kCFNumberLongLongType, &valuePtr);
    v18 |= (v12 | (IntegerValue << 16)) == valuePtr;
    ++v17;
  }
  while (v16 != v17);
  unint64_t v9 = v31;
  if ((v18 & 1) == 0)
  {
LABEL_22:
    v22 = _IOHIDLogCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_24079F120();
    }
  }
  else
  {
LABEL_16:
    if ((IOHIDEventGetPhase() & 4) != 0)
    {
      v21 = _IOHIDLogCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_24079F0EC();
      }
    }
    else
    {
      if (IOHIDEventGetIntegerValue())
      {
        v20 = _IOHIDLogCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_24079F0B8();
        }
        return a2;
      }
      uint64_t v23 = *(void *)(a1 + 136);
      if (v23)
      {
        while (*(_DWORD *)(v23 + 44) != v5 || *(_DWORD *)(v23 + 52) != v12 || *(_DWORD *)(v23 + 48) != IntegerValue)
        {
          uint64_t v23 = *(void *)(v23 + 16);
          if (!v23) {
            goto LABEL_29;
          }
        }
LABEL_36:
        int v26 = IOHIDEventGetType();
        if (v26 == 29)
        {
          IOHIDEventGetFloatValue();
          BOOL v27 = v28 == 1.0;
        }
        else
        {
          if (v26 != 3)
          {
            int v29 = 0;
LABEL_44:
            Event::stateHandler(v23, v29 ^ 1, a2);
            return a2;
          }
          BOOL v27 = IOHIDEventGetIntegerValue() == 1;
        }
        int v29 = v27;
        goto LABEL_44;
      }
LABEL_29:
      uint64_t v23 = *v32;
      if (*v32)
      {
        uint64_t *v32 = *(void *)(v23 + 16);
        if (v5 == 3) {
          unint64_t v24 = *(void *)(a1 + 128);
        }
        else {
          unint64_t v24 = 0;
        }
        Event::init((Event *)v23, (IOHIDEventProcessor *)a1, *(Timer **)(a1 + 160), v5, IntegerValue, v12, v10, v9, v24, *(unsigned char *)(a1 + 120));
        *(void *)(v23 + 16) = *(void *)(a1 + 136);
        *(void *)(a1 + 136) = v23;
        goto LABEL_36;
      }
      v25 = _IOHIDLogCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_24079F078();
      }
    }
  }
  return a2;
}

void IOHIDEventProcessor::setPropertyForClient(IOHIDEventProcessor *this, CFStringRef theString1, const void *a3, const void *a4)
{
  uint64_t valuePtr = 0;
  if (theString1 && a3)
  {
    if (CFEqual(theString1, @"PressCountTrackingEnabled"))
    {
      *((unsigned char *)this + 64) = *MEMORY[0x263EFFB40] == (void)a3;
      CFUUIDRef v7 = _IOHIDLogCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_24079EF44();
      }
      if (*((unsigned char *)this + 64) && !*((void *)this + 18)) {
        operator new();
      }
    }
    if (CFEqual(theString1, @"PressCountUsagePairs"))
    {
      CFUUIDRef v8 = (const void *)*((void *)this + 9);
      if (v8) {
        CFRelease(v8);
      }
      *((void *)this + 9) = a3;
      CFRetain(a3);
      unint64_t v9 = _IOHIDLogCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_24079EEDC();
      }
    }
    if (CFEqual(theString1, @"PressCountDoublePressTimeout"))
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 10) = valuePtr;
      unint64_t v10 = _IOHIDLogCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_24079EE74();
      }
    }
    if (CFEqual(theString1, @"PressCountTriplePressTimeout"))
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 11) = valuePtr;
      v11 = _IOHIDLogCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_24079EE0C();
      }
    }
    if (CFEqual(theString1, @"LongPressTimeout"))
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 16) = valuePtr;
      int v12 = _IOHIDLogCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_24079EDA4();
      }
    }
    if (CFEqual(theString1, @"AlternateLongPressHandling"))
    {
      *((unsigned char *)this + 120) = *MEMORY[0x263EFFB40] == (void)a3;
      v13 = _IOHIDLogCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_24079ED20();
      }
    }
    if (CFEqual(theString1, @"TapTrackingEnabled"))
    {
      *((unsigned char *)this + 96) = *MEMORY[0x263EFFB40] == (void)a3;
      CFIndex v16 = _IOHIDLogCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_24079EC9C();
      }
      if (*((unsigned char *)this + 96) && !*((void *)this + 19)) {
        operator new();
      }
    }
    if (CFEqual(theString1, @"DoubleTapTimeout"))
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 13) = valuePtr;
      CFArrayRef v14 = _IOHIDLogCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_24079EC34();
      }
    }
    if (CFEqual(theString1, @"TripleTapTimeout"))
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((void *)this + 14) = valuePtr;
      v15 = _IOHIDLogCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_24079EBCC();
      }
    }
  }
}

void IOHIDEventProcessor::scheduleWithDispatchQueue(IOHIDEventProcessor *this, NSObject *a2, dispatch_queue_s *a3)
{
  *((void *)this + 3) = a2;
  Timer::init(*((Timer **)this + 20), a2);
}

void sub_24079C788(uint64_t a1)
{
}

uint64_t IOHIDEventProcessor::AddRef(IOHIDEventProcessor *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

uint64_t IOHIDEventProcessor::filterCopyEvent(uint64_t a1, uint64_t a2)
{
  return a2;
}

{
  return a2;
}

void Timer::Timer(Timer *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

void sub_24079C7BC(void *a1)
{
}

uint64_t IOHIDEventProcessor::AddRef(IOHIDEventProcessor *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

void *IOHIDEventProcessor::serialize(IOHIDEventProcessor *this, __CFDictionary *a2)
{
  int v5 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_24079E8E8(&v5, a2, 0);
  int v5 = &unk_26F4E59B8;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDEventProcessor");
  sub_24079CE7C((uint64_t)&v5, @"PressCountTrackingEnabled", *((unsigned char *)this + 64));
  CFAllocatorRef v3 = (const void *)*((void *)this + 9);
  if (v3) {
    CFDictionarySetValue(theDict, @"PressCountUsagePairs", v3);
  }
  sub_24079CEEC((uint64_t)&v5, @"PressCountDoublePressTimeout", *((void *)this + 10));
  sub_24079CEEC((uint64_t)&v5, @"PressCountTriplePressTimeout", *((void *)this + 11));
  sub_24079CEEC((uint64_t)&v5, @"LongPressTimeout", *((void *)this + 16));
  sub_24079CE7C((uint64_t)&v5, @"AlternateLongPressHandling", *((unsigned char *)this + 120));
  sub_24079CEEC((uint64_t)&v5, @"TapTrackingEnabled", *((void *)this + 11));
  sub_24079CEEC((uint64_t)&v5, @"DoubleTapTimeout", *((void *)this + 13));
  sub_24079CEEC((uint64_t)&v5, @"TripleTapTimeout", *((void *)this + 14));
  sub_24079CEEC((uint64_t)&v5, @"MatchScore", *((int *)this + 5));
  return sub_24079E898(&v5);
}

void sub_24079C954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL Event::conformsTo(Event *this, int a2, int a3, int a4)
{
  return *((_DWORD *)this + 11) == a2 && *((_DWORD *)this + 13) == a4 && *((_DWORD *)this + 12) == a3;
}

void Event::init(Event *this, IOHIDEventProcessor *a2, Timer *a3, int a4, int a5, int a6, unint64_t a7, unint64_t a8, unint64_t a9, BOOL a10)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *((_DWORD *)this + 11) = a4;
  *((_DWORD *)this + 12) = a5;
  *((_DWORD *)this + 13) = a6;
  *((void *)this + 10) = a7;
  *((void *)this + 11) = a8;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = a9;
  *((unsigned char *)this + 40) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = a2;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 7) = a3;
  *((void *)this + 8) = 0;
  *(void *)((char *)this + 70) = 0;
  *((unsigned char *)this + 78) = a10;
  if (a9)
  {
    if (a9 == a7)
    {
      a7 = a9 + 1;
      *((void *)this + 10) = a9 + 1;
    }
    if (a9 == a8)
    {
      a8 = a9 + 1;
      *((void *)this + 11) = a9 + 1;
    }
  }
  if (a7 > a9 || a8 > a9)
  {
    v11 = _IOHIDLogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *((void *)this + 13);
      uint64_t v13 = *((void *)this + 10);
      uint64_t v14 = *((void *)this + 11);
      int v15 = 134218496;
      uint64_t v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_log_debug_impl(&dword_24079A000, v11, OS_LOG_TYPE_DEBUG, "long %llu second %llu third %llu\n\n", (uint8_t *)&v15, 0x20u);
    }
  }
}

BOOL Event::stateHandler(uint64_t a1, int a2, uint64_t a3)
{
  Timer::checkEventTimeouts(*(Timer **)(a1 + 56));
  unint64_t v6 = (void (*)(uint64_t, uint64_t))*(&_stateMap[3 * *(unsigned int *)(a1 + 64)] + a2);
  CFUUIDRef v7 = _IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_24079F258();
    if (v6)
    {
LABEL_3:
      v6(a1, a3);
      CFUUIDRef v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_24079F154();
      }
      return v6 != 0;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  unint64_t v9 = _IOHIDLogCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_24079F1CC((int *)(a1 + 64), a2, v9);
  }
  return v6 != 0;
}

void IOHIDEventProcessor::scheduleWithDispatchQueue(IOHIDEventProcessor *this, NSObject *a2)
{
  *((void *)this + 3) = a2;
  Timer::init(*((Timer **)this + 20), a2);
}

void IOHIDEventProcessor::unscheduleFromDispatchQueue(IOHIDEventProcessor *this, dispatch_queue_s *a2)
{
  if (*((dispatch_queue_s **)this + 3) == a2)
  {
    uint64_t v3 = *((void *)this + 20);
    if (*(void *)v3) {
      dispatch_source_cancel(*(dispatch_source_t *)v3);
    }
    *(void *)(v3 + 8) = 0;
    *((void *)this + 3) = 0;
  }
}

void Timer::cancel(NSObject **this, dispatch_queue_s *a2)
{
  uint64_t v3 = *this;
  if (v3) {
    dispatch_source_cancel(v3);
  }
  this[1] = 0;
}

void IOHIDEventProcessor::dispatchEvent(uint64_t a1, CFTypeRef cf, int a3)
{
  if (*(void *)(a1 + 24))
  {
    if (a3)
    {
      CFRetain(cf);
      int v5 = *(NSObject **)(a1 + 24);
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 0x40000000;
      v7[2] = sub_24079CD24;
      v7[3] = &unk_2650D5CA8;
      v7[4] = a1;
      v7[5] = cf;
      dispatch_async(v5, v7);
    }
    else
    {
      unint64_t v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_24079F2E8();
      }
      (*(void (**)(void, void, void, CFTypeRef, void))(a1 + 40))(*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 32), cf, 0);
    }
  }
}

void sub_24079CD24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = _IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_24079F350();
  }
  (*(void (**)(void, void, void, void, void))(v2 + 40))(*(void *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 32), *(void *)(a1 + 40), 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void IOHIDEventProcessor::returnToFreePool(IOHIDEventProcessor *this, Event *a2)
{
  uint64_t v4 = *((void *)this + 17);
  int v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_24079F3BC();
  }
  int v6 = *((_DWORD *)a2 + 11);
  CFUUIDRef v7 = (void *)((char *)this + 144);
  CFUUIDRef v8 = (char *)this + 152;
  if (v6 != 29) {
    CFUUIDRef v8 = 0;
  }
  if (v6 != 3) {
    CFUUIDRef v7 = v8;
  }
  if (v4)
  {
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = v9;
      uint64_t v9 = v4;
      if (*((_DWORD *)a2 + 12) == *(_DWORD *)(v4 + 48)
        && *((_DWORD *)a2 + 13) == *(_DWORD *)(v4 + 52)
        && v6 == *(_DWORD *)(v4 + 44))
      {
        break;
      }
      uint64_t v4 = *(void *)(v4 + 16);
      if (!v4) {
        goto LABEL_13;
      }
    }
    if (v10) {
      *(void *)(v10 + 16) = *((void *)a2 + 2);
    }
    else {
      *((void *)this + 17) = *(void *)(*((void *)this + 17) + 16);
    }
  }
LABEL_13:
  if (v7)
  {
    *((void *)a2 + 2) = *v7;
    void *v7 = a2;
  }
}

void *sub_24079CE7C(uint64_t a1, const void *a2, char a3)
{
  sub_24079E988(&v6, a3);
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_24079EA04(&v6);
}

void sub_24079CED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_24079CEEC(uint64_t a1, const void *a2, uint64_t a3)
{
  sub_24079EAC8(&v6, a3);
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_24079EA04(&v6);
}

void sub_24079CF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void Event::Event(Event *this)
{
  *(void *)this = &unk_26F4E57F8;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 1;
  *(_OWORD *)((char *)this + 44) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_DWORD *)((char *)this + 75) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

void Event::dispatchEvent(uint64_t a1, const void *a2, int a3)
{
}

void Event::completed(Event *this)
{
  *((unsigned char *)this + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(*((IOHIDEventProcessor **)this + 4), this);
}

uint64_t sub_24079CFC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 40))();
}

uint64_t sub_24079CFEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 48))();
}

uint64_t sub_24079D010(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 88))();
}

uint64_t sub_24079D034(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 56))();
}

uint64_t sub_24079D058(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 64))();
}

uint64_t sub_24079D07C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 72))();
}

uint64_t sub_24079D0A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 80))();
}

uint64_t sub_24079D0C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

void Timer::checkEventTimeouts(Timer *this)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = mach_absolute_time();
  if (v2)
  {
    uint64_t v4 = v3;
    do
    {
      uint64_t v5 = v2;
      uint64_t v2 = *(void *)(v2 + 24);
      if (*(void *)(v5 + 8) && !*(unsigned char *)(v5 + 40))
      {
        if (*(void *)(v5 + 8) < (v4 - *(void *)(v5 + 96))
                                 * dword_26AFC85F0
                                 / dword_26AFC85F4
                                 / 0x3E8)
        {
          uint64_t v6 = _IOHIDLogCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v7 = *(void *)(v5 + 8);
            unint64_t v8 = (v4 - *(void *)(v5 + 96)) * dword_26AFC85F0 / dword_26AFC85F4 / 0x3E8;
            *(_DWORD *)buf = 134218240;
            uint64_t v10 = v5;
            __int16 v11 = 2048;
            uint64_t v12 = v8 - v7;
            _os_log_debug_impl(&dword_24079A000, v6, OS_LOG_TYPE_DEBUG, "%p past deadline %lld us\n", buf, 0x16u);
          }
          Timer::removeEvent((uint64_t)this, (Event *)v5);
          Event::stateHandler(v5, 2, 0);
        }
      }
      else
      {
        Timer::removeEvent((uint64_t)this, (Event *)v5);
      }
    }
    while (v2);
  }
  Timer::updateTimeout(this);
}

uint64_t ButtonEvent::setMultiEventCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218496;
    uint64_t v9 = a1;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_debug_impl(&dword_24079A000, v6, OS_LOG_TYPE_DEBUG, "%p %p setting multi count = %d\n", (uint8_t *)&v8, 0x1Cu);
  }
  uint64_t result = IOHIDEventSetIntegerValue();
  if (!a3) {
    LODWORD(a3) = *(_DWORD *)(a1 + 72);
  }
  *(_DWORD *)(a1 + 72) = a3;
  return result;
}

uint64_t ButtonEvent::createSyntheticEvent(ButtonEvent *this, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
  if (KeyboardEvent) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    (*(void (**)(ButtonEvent *, uint64_t, void))(*(void *)this + 24))(this, KeyboardEvent, *((int *)this + 18));
    IOHIDEventGetPhase();
    IOHIDEventSetPhase();
    if (*((unsigned char *)this + 78)) {
      IOHIDEventSetIntegerValue();
    }
    *((unsigned char *)this + 76) = 1;
  }
  uint64_t v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = *((_DWORD *)this + 11);
    v9[0] = 67109632;
    v9[1] = a2;
    __int16 v10 = 2048;
    uint64_t v11 = KeyboardEvent;
    __int16 v12 = 1024;
    int v13 = v8;
    _os_log_debug_impl(&dword_24079A000, v6, OS_LOG_TYPE_DEBUG, "created terminal(%d) event %p type %d\n", (uint8_t *)v9, 0x18u);
  }
  return KeyboardEvent;
}

void ButtonEvent::NoneEnter(Timer **a1, uint64_t a2)
{
  if (a2)
  {
    Timer::registerEventTimeout(a1[7], (Event *)a1, 0);
    (*((void (**)(Timer **, uint64_t, void))*a1 + 3))(a1, a2, *((int *)a1 + 18));
  }
  *((unsigned char *)a1 + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(a1[4], (Event *)a1);
  *((_DWORD *)a1 + 16) = 0;
}

void Timer::registerEventTimeout(Timer *this, Event *a2, uint64_t a3)
{
  uint64_t v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_24079F424();
  }
  *((void *)a2 + 1) = a3;
  Timer::removeEvent((uint64_t)this, a2);
  if (a3)
  {
    *((void *)a2 + 3) = *((void *)this + 2);
    *((void *)this + 2) = a2;
  }
  Timer::updateTimeout(this);
}

void ButtonEvent::FDEnter(Event *a1, uint64_t a2)
{
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 1);
  *((unsigned char *)a1 + 77) = 0;
  *((_DWORD *)a1 + 16) = 1;
  unint64_t v4 = *((void *)a1 + 10);
  if (!v4)
  {
    (*(void (**)(Event *, uint64_t))(*(void *)a1 + 96))(a1, a2);
    unint64_t v4 = *((void *)a1 + 10);
  }
  uint64_t v5 = *((void *)a1 + 13);
  if (v5 - 1 >= v4) {
    int v6 = 7;
  }
  else {
    int v6 = 8;
  }
  if (v5 - 1 >= v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = *((void *)a1 + 13);
  }
  *((_DWORD *)a1 + 17) = v6;
  int v8 = (Timer *)*((void *)a1 + 7);

  Timer::registerEventTimeout(v8, a1, v7);
}

uint64_t ButtonEvent::FUEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 1);
  a1[16] = 2;
  return result;
}

void ButtonEvent::SDEnter(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 2);
  *(_DWORD *)(a1 + 64) = 3;
  *(unsigned char *)(a1 + 77) = 0;
  unint64_t v4 = *(void *)(a1 + 88);
  if (v4)
  {
    unint64_t v5 = *(void *)(a1 + 104);
    if (v5 - 1 >= v4)
    {
      *(_DWORD *)(a1 + 68) = 7;
      int v6 = *(Timer **)(a1 + 56);
      uint64_t v7 = (Event *)a1;
    }
    else
    {
      *(_DWORD *)(a1 + 68) = 8;
      int v6 = *(Timer **)(a1 + 56);
      uint64_t v7 = (Event *)a1;
      unint64_t v4 = v5;
    }
    Timer::registerEventTimeout(v6, v7, v4);
  }
  else
  {
    int v8 = *(void (**)(uint64_t, uint64_t))(*(void *)a1 + 96);
    v8(a1, a2);
  }
}

uint64_t ButtonEvent::SUEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 2);
  a1[16] = 4;
  return result;
}

uint64_t ButtonEvent::TDEnter(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 3);
  *(_DWORD *)(a1 + 64) = 5;
  *(unsigned char *)(a1 + 77) = 0;
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 96);

  return v4(a1, a2);
}

uint64_t ButtonEvent::TUEnter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 3);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 32);

  return v4(a1, a2);
}

_DWORD *ButtonEvent::TOEnter(_DWORD *result)
{
  int v1 = result[17];
  if (v1 == 8) {
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)result + 104))();
  }
  if (v1 == 7) {
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)result + 96))();
  }
  return result;
}

void ButtonEvent::TEEnter(_DWORD *a1, uint64_t a2)
{
  unsigned int v4 = a1[16];
  if (v4 > 8 || ((1 << v4) & 0x12A) == 0)
  {
    int v8 = 0;
    unint64_t v6 = 0;
    goto LABEL_18;
  }
  unint64_t v6 = *((void *)a1 + 13);
  if (v6)
  {
    if (v4 != 5)
    {
      if (v4 == 3)
      {
        unint64_t v7 = *((void *)a1 + 11);
LABEL_12:
        BOOL v9 = v6 >= v7;
        unint64_t v10 = v6 - v7;
        if (v9) {
          unint64_t v6 = v10;
        }
        else {
          unint64_t v6 = 0;
        }
        goto LABEL_16;
      }
      if (v4 == 1)
      {
        unint64_t v7 = *((void *)a1 + 10);
        goto LABEL_12;
      }
      unint64_t v6 = 0;
    }
LABEL_16:
    a1[17] = 8;
  }
  int v8 = 1;
LABEL_18:
  uint64_t v11 = (const void *)(*(uint64_t (**)(_DWORD *, uint64_t))(*(void *)a1 + 16))(a1, 1);
  IOHIDEventProcessor::dispatchEvent(*((void *)a1 + 4), v11, a2 != 0);
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  CFRelease(v11);
  Timer::registerEventTimeout(*((Timer **)a1 + 7), (Event *)a1, v6);
  if (v8)
  {
    a1[16] = 7;
  }
  else
  {
    __int16 v12 = *(void (**)(_DWORD *, void))(*(void *)a1 + 32);
    v12(a1, 0);
  }
}

void ButtonEvent::LPEnter(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 64);
  switch(v3)
  {
    case 2u:
      unint64_t v5 = (unint64_t *)(a1 + 80);
      goto LABEL_7;
    case 4u:
      unint64_t v5 = (unint64_t *)(a1 + 88);
LABEL_7:
      unint64_t v6 = *v5;
      unint64_t v7 = *(void *)(a1 + 104);
      BOOL v8 = v6 >= v7;
      uint64_t v9 = v6 - v7;
      if (v8) {
        uint64_t v4 = v9;
      }
      else {
        uint64_t v4 = 0;
      }
LABEL_10:
      *(_DWORD *)(a1 + 68) = 7;
      *(void *)(a1 + 96) = mach_absolute_time();
      unint64_t v10 = *(Timer **)(a1 + 56);
      Timer::registerEventTimeout(v10, (Event *)a1, v4);
      return;
    case 6u:
      uint64_t v4 = 0;
      goto LABEL_10;
  }
  __int16 v12 = (const void *)(*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 16))(a1, 0);
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  (*(void (**)(uint64_t, const void *, void))(*(void *)a1 + 24))(a1, v12, *(int *)(a1 + 72));
  IOHIDEventProcessor::dispatchEvent(*(void *)(a1 + 32), v12, a2 != 0);
  *(unsigned char *)(a1 + 77) = 1;
  if (!*(unsigned char *)(a1 + 78))
  {
    if (((v3 < 6) & v3) != 0)
    {
      *(_DWORD *)(a1 + 64) = 8;
      (*(void (**)(uint64_t, const void *))(*(void *)a1 + 96))(a1, v12);
    }
    goto LABEL_23;
  }
  int v13 = *(_DWORD *)(a1 + 64);
  if (v13 == 3)
  {
    unint64_t v14 = *(void *)(a1 + 88);
  }
  else
  {
    if (v13 != 1)
    {
LABEL_21:
      *(_DWORD *)(a1 + 64) = 8;
      (*(void (**)(uint64_t, const void *))(*(void *)a1 + 96))(a1, v12);
      uint64_t v16 = 0;
      goto LABEL_22;
    }
    unint64_t v14 = *(void *)(a1 + 80);
  }
  unint64_t v15 = *(void *)(a1 + 104);
  uint64_t v16 = v14 - v15;
  if (v14 <= v15) {
    goto LABEL_21;
  }
LABEL_22:
  *(_DWORD *)(a1 + 68) = 7;
  *(void *)(a1 + 96) = mach_absolute_time();
  Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, v16);
LABEL_23:

  CFRelease(v12);
}

uint64_t TapEvent::setMultiEventCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218496;
    uint64_t v9 = a1;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_debug_impl(&dword_24079A000, v6, OS_LOG_TYPE_DEBUG, "%p %p setting multi count = %d\n", (uint8_t *)&v8, 0x1Cu);
  }
  uint64_t result = IOHIDEventSetIntegerValue();
  if (!a3) {
    LODWORD(a3) = *(_DWORD *)(a1 + 72);
  }
  *(_DWORD *)(a1 + 72) = a3;
  return result;
}

uint64_t TapEvent::createSyntheticEvent(TapEvent *this, int a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  mach_absolute_time();
  uint64_t BiometricEvent = IOHIDEventCreateBiometricEvent();
  if (BiometricEvent)
  {
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    if (a2)
    {
      (*(void (**)(TapEvent *, uint64_t, void))(*(void *)this + 24))(this, BiometricEvent, *((int *)this + 18));
      IOHIDEventGetPhase();
      IOHIDEventSetPhase();
      if (*((unsigned char *)this + 78)) {
        IOHIDEventSetIntegerValue();
      }
      *((unsigned char *)this + 76) = 1;
    }
  }
  unint64_t v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = *((_DWORD *)this + 11);
    v8[0] = 67109632;
    v8[1] = a2;
    __int16 v9 = 2048;
    uint64_t v10 = BiometricEvent;
    __int16 v11 = 1024;
    int v12 = v7;
    _os_log_debug_impl(&dword_24079A000, v5, OS_LOG_TYPE_DEBUG, "created terminal(%d) event %p type %d\n", (uint8_t *)v8, 0x18u);
  }
  return BiometricEvent;
}

void TapEvent::NoneEnter(Timer **a1, uint64_t a2)
{
  if (a2)
  {
    Timer::registerEventTimeout(a1[7], (Event *)a1, 0);
    (*((void (**)(Timer **, uint64_t, void))*a1 + 3))(a1, a2, *((int *)a1 + 18));
  }
  *((unsigned char *)a1 + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(a1[4], (Event *)a1);
  *((_DWORD *)a1 + 16) = 0;
}

uint64_t TapEvent::FDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, void))(*(void *)a1 + 24))(a1, a2, 0);
  a1[16] = 1;
  return result;
}

void TapEvent::FUEnter(Event *a1, uint64_t a2)
{
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 1);
  *((_DWORD *)a1 + 16) = 2;
  uint64_t v4 = *((void *)a1 + 10);
  if (v4)
  {
    unint64_t v5 = (Timer *)*((void *)a1 + 7);
    Timer::registerEventTimeout(v5, a1, v4);
  }
  else
  {
    unint64_t v6 = *(void (**)(Event *, uint64_t))(*(void *)a1 + 96);
    v6(a1, a2);
  }
}

uint64_t TapEvent::SDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 1);
  a1[16] = 3;
  return result;
}

void TapEvent::SUEnter(Event *a1, uint64_t a2)
{
  *((void *)a1 + 12) = IOHIDEventGetTimeStamp();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 2);
  *((_DWORD *)a1 + 16) = 4;
  uint64_t v4 = *((void *)a1 + 11);
  if (v4)
  {
    unint64_t v5 = (Timer *)*((void *)a1 + 7);
    Timer::registerEventTimeout(v5, a1, v4);
  }
  else
  {
    unint64_t v6 = *(void (**)(Event *, uint64_t))(*(void *)a1 + 96);
    v6(a1, a2);
  }
}

uint64_t TapEvent::TDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 2);
  a1[16] = 5;
  return result;
}

uint64_t TapEvent::TUEnter(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, 3);
  *(_DWORD *)(a1 + 64) = 6;
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 96);

  return v4(a1, a2);
}

uint64_t TapEvent::TOEnter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 96))();
}

void TapEvent::TEEnter(uint64_t *a1, uint64_t a2)
{
  unsigned int v4 = *((_DWORD *)a1 + 16);
  unint64_t v5 = (const void *)(*(uint64_t (**)(uint64_t *, uint64_t))(*a1 + 16))(a1, 1);
  IOHIDEventProcessor::dispatchEvent(a1[4], v5, a2 != 0);
  CFRelease(v5);
  Timer::registerEventTimeout((Timer *)a1[7], (Event *)a1, 0);
  if (v4 > 5 || (v4 & 1) == 0)
  {
    int v7 = *(void (**)(uint64_t *, void))(*a1 + 32);
    v7(a1, 0);
  }
  else
  {
    *((_DWORD *)a1 + 16) = 1;
  }
}

uint64_t TapEvent::LPEnter(uint64_t result)
{
  *(_DWORD *)(result + 64) = 8;
  return result;
}

void sub_24079E56C(uint64_t a1)
{
}

void Timer::timeoutHandler(Timer *this)
{
  uint64_t v2 = _IOHIDLogCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_24079F498();
  }
  Timer::checkEventTimeouts(this);
}

uint64_t Timer::removeEvent(uint64_t this, Event *a2)
{
  uint64_t v2 = *(void *)(this + 16);
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(this + 16);
    while (*((_DWORD *)a2 + 12) != *(_DWORD *)(v4 + 48)
         || *((_DWORD *)a2 + 13) != *(_DWORD *)(v4 + 52)
         || *((_DWORD *)a2 + 11) != *(_DWORD *)(v4 + 44))
    {
      uint64_t v3 = v4;
      uint64_t v4 = *(void *)(v4 + 24);
      if (!v4) {
        goto LABEL_7;
      }
    }
    if (v3) {
      *(void *)(v3 + 24) = *((void *)a2 + 3);
    }
    else {
      *(void *)(this + 16) = *(void *)(v2 + 24);
    }
  }
LABEL_7:
  *((void *)a2 + 3) = 0;
  return this;
}

uint64_t Timer::insertEvent(Timer *this, Event *a2)
{
  uint64_t result = Timer::removeEvent((uint64_t)this, a2);
  *((void *)a2 + 3) = *((void *)this + 2);
  *((void *)this + 2) = a2;
  return result;
}

void Timer::updateTimeout(Timer *this)
{
  uint64_t v2 = mach_absolute_time();
  uint64_t v3 = (void *)*((void *)this + 2);
  if (v3)
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v4 >= (uint64_t)(v3[1] - (v2 - v3[12]) * dword_26AFC85F0 / dword_26AFC85F4 / 0x3E8)) {
        int64_t v4 = v3[1] - (v2 - v3[12]) * dword_26AFC85F0 / dword_26AFC85F4 / 0x3E8;
      }
      uint64_t v3 = (void *)v3[3];
    }
    while (v3);
  }
  else
  {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = v4 & ~(v4 >> 63);
  unint64_t v6 = *(NSObject **)this;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v7 = v6;
    dispatch_time_t v8 = -1;
    uint64_t v9 = 0;
  }
  else
  {
    dispatch_time_t v8 = dispatch_time(0, 1000 * v5);
    int v7 = v6;
    uint64_t v9 = -1;
  }

  dispatch_source_set_timer(v7, v8, v9, 0);
}

void sub_24079E748()
{
}

void sub_24079E760()
{
}

void *sub_24079E774(void *a1, int a2)
{
  *a1 = &unk_26F4E59B8;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return a1;
}

void sub_24079E7D4(_Unwind_Exception *a1)
{
  sub_24079E898(v1);
  _Unwind_Resume(a1);
}

void sub_24079E7E8(void *a1)
{
  sub_24079E898(a1);

  JUMPOUT(0x2455F9440);
}

void sub_24079E824(void *a1)
{
  sub_24079E898(a1);

  JUMPOUT(0x2455F9440);
}

void sub_24079E860(void *a1)
{
  sub_24079E898(a1);

  JUMPOUT(0x2455F9440);
}

void *sub_24079E898(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E5A38;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_24079E8E8(void *a1, CFTypeRef cf, char a3)
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
  *a1 = &unk_26F4E5A38;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E5A18;
  return a1;
}

void *sub_24079E988(void *a1, char a2)
{
  char valuePtr = a2;
  *a1 = &unk_26F4E5A58;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt8Type, &valuePtr);
  return a1;
}

void sub_24079E9F0(_Unwind_Exception *a1)
{
  sub_24079EA04(v1);
  _Unwind_Resume(a1);
}

void *sub_24079EA04(void *a1)
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E5AA0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_24079EA54(void *a1)
{
  sub_24079EA04(a1);

  JUMPOUT(0x2455F9440);
}

void sub_24079EA90(void *a1)
{
  sub_24079EA04(a1);

  JUMPOUT(0x2455F9440);
}

void *sub_24079EAC8(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_26F4E5A58;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_24079EB30(_Unwind_Exception *a1)
{
  sub_24079EA04(v1);
  _Unwind_Resume(a1);
}

void sub_24079EB44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_24079EB6C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_24079EB78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_24079EB94(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_24079EBCC()
{
  sub_24079EB6C(*MEMORY[0x263EF8340]);
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "triple tap timeout now %llu\n", v2, v3, v4, v5, v6);
}

void sub_24079EC34()
{
  sub_24079EB6C(*MEMORY[0x263EF8340]);
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "double tap timeout now %llu\n", v2, v3, v4, v5, v6);
}

void sub_24079EC9C()
{
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "Tap Count %s\n", v2, v3, v4, v5, v6);
}

void sub_24079ED20()
{
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "Alternate Long Press %s\n", v2, v3, v4, v5, v6);
}

void sub_24079EDA4()
{
  sub_24079EB6C(*MEMORY[0x263EF8340]);
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "LongPress now %llu\n", v2, v3, v4, v5, v6);
}

void sub_24079EE0C()
{
  sub_24079EB6C(*MEMORY[0x263EF8340]);
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "triplePressTimeout now %llu\n", v2, v3, v4, v5, v6);
}

void sub_24079EE74()
{
  sub_24079EB6C(*MEMORY[0x263EF8340]);
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "doublePressTimeout now %llu\n", v2, v3, v4, v5, v6);
}

void sub_24079EEDC()
{
  sub_24079EB6C(*MEMORY[0x263EF8340]);
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "Press Count Usage Pairs %@\n", v2, v3, v4, v5, v6);
}

void sub_24079EF44()
{
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "Press Count %s\n", v2, v3, v4, v5, v6);
}

void sub_24079EFC8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t RegistryID = IOHIDServiceGetRegistryID();
  int v6 = *(_DWORD *)(a1 + 20);
  int v7 = 134218498;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = RegistryID;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_debug_impl(&dword_24079A000, a3, OS_LOG_TYPE_DEBUG, "(%p) for ServiceID %@ with score %d\n", (uint8_t *)&v7, 0x1Cu);
}

void sub_24079F078()
{
  sub_24079EBC0();
  _os_log_error_impl(&dword_24079A000, v0, OS_LOG_TYPE_ERROR, "No more free events\n", v1, 2u);
}

void sub_24079F0B8()
{
  sub_24079EBC0();
  sub_24079EB78(&dword_24079A000, v0, v1, "letting long press event through\n", v2, v3, v4, v5, v6);
}

void sub_24079F0EC()
{
  sub_24079EBC0();
  sub_24079EB78(&dword_24079A000, v0, v1, "terminal event detected, letting through\n", v2, v3, v4, v5, v6);
}

void sub_24079F120()
{
  sub_24079EBC0();
  sub_24079EB78(&dword_24079A000, v0, v1, "usage pair should not be processed, letting through\n", v2, v3, v4, v5, v6);
}

void sub_24079F154()
{
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "new state = %s\n", v2, v3, v4, v5, v6);
}

void sub_24079F1CC(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_debug_impl(&dword_24079A000, log, OS_LOG_TYPE_DEBUG, "Invalid state transition: [%d][%d]\n", (uint8_t *)v4, 0xEu);
}

void sub_24079F258()
{
  sub_24079EB60();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_24079EB94(&dword_24079A000, v1, v2, "state = %s transition = %s\n", v3, v4);
}

void sub_24079F2E8()
{
  sub_24079EBB4();
  sub_24079EB44(&dword_24079A000, v0, v1, "synchronously dispatching event = %p\n", v2, v3, v4, v5, v6);
}

void sub_24079F350()
{
  sub_24079EB60();
  sub_24079EB44(&dword_24079A000, v0, v1, "asynchronously dispatching event = %p\n", v2, v3, v4, v5, v6);
}

void sub_24079F3BC()
{
  sub_24079EBB4();
  sub_24079EB44(&dword_24079A000, v0, v1, "returning event %p to free pool\n", v2, v3, v4, v5, v6);
}

void sub_24079F424()
{
  sub_24079EBB4();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_24079EB94(&dword_24079A000, v0, v1, "registering %p for timeout in %llu uS\n", v2, v3);
}

void sub_24079F498()
{
  sub_24079EBB4();
  sub_24079EB44(&dword_24079A000, v0, v1, "%p timeout occurred\n", v2, v3, v4, v5, v6);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

uint64_t IOHIDEventCreateBiometricEvent()
{
  return MEMORY[0x270EF4208]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x270EF4280]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x270EF4340]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x270EF4358]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x270EF43D0]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x270EF43D8]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x270EF4690]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
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

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}