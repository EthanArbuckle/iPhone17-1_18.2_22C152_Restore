CFTypeRef IOHIDEventSystemStatistics::getPropertyForClient(IOHIDEventSystemStatistics *this, CFTypeRef cf1, const void *a3)
{
  CFMutableArrayRef Mutable;
  const void *v5;
  CFTypeRef v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  CFTypeRef (*v11)(uint64_t, uint64_t);
  void *(*v12)(uint64_t);
  void v13[2];
  unint64_t v14;
  CFMutableDictionaryRef v15;

  if (!CFEqual(cf1, @"SessionFilterDebug")) {
    return 0;
  }
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407A2BB8(&v14, 0);
  CFDictionarySetValue(v15, @"Class", @"IOHIDEventSystemStatistics");
  if (*((void *)this + 16))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3802000000;
    v11 = sub_2407A2338;
    v12 = sub_2407A23A0;
    v13[0] = 0xAAAAAAAAAAAAAAAALL;
    v13[1] = 0xAAAAAAAAAAAAAAAALL;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    sub_2407A2DF0(v13, Mutable, 1);
    v13[0] = &unk_26F4E5F08;
    _IOHIDCFSetApplyBlock();
    v5 = (const void *)v9[6];
    if (v5) {
      CFDictionarySetValue(v15, @"KeyboardServices", v5);
    }
    _Block_object_dispose(&v8, 8);
    sub_2407A2DA0(v13);
  }
  v6 = CFRetain(v15);
  sub_2407A2CA0(&v14);
  return v6;
}

void sub_2407A10A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  sub_2407A2DA0(v6);
  sub_2407A2CA0((void *)(v7 - 32));
  _Unwind_Resume(a1);
}

void IOHIDEventSystemStatistics::unregisterService(uint64_t a1, void *value)
{
  CFSetRef v4 = *(const __CFSet **)(a1 + 128);
  if (v4)
  {
    if (CFSetGetValue(v4, value))
    {
      CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 128), value);
      v5 = _IOHIDLogCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_2407A307C();
      }
    }
  }
  CFDictionaryRef v6 = *(const __CFDictionary **)(a1 + 136);
  if (v6 && CFDictionaryContainsKey(v6, value))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 136), value);
    uint64_t v7 = _IOHIDLogCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_2407A2FF4((uint64_t)value, v7);
    }
  }
}

uint64_t IOHIDEventSystemStatistics::filter(uint64_t a1, const void *a2, uint64_t a3)
{
  if (!a3 || !*(void *)(a1 + 48)) {
    return a3;
  }
  if (IOHIDEventSystemStatistics::collectKeyStats(a1, a2)) {
    goto LABEL_4;
  }
  if (IOHIDEventGetType() != 3 || IOHIDEventGetIntegerValue() != 12)
  {
    if (*(const void **)(a1 + 144) != a2 || IOHIDEventGetType() != 6) {
      goto LABEL_18;
    }
    int IntegerValue = IOHIDEventGetIntegerValue();
    if (IntegerValue < 1)
    {
      if ((IntegerValue & 0x80000000) == 0) {
        goto LABEL_18;
      }
      *(_DWORD *)(a1 + 116) += IntegerValue;
    }
    else
    {
      *(_DWORD *)(a1 + 112) += IntegerValue;
    }
LABEL_16:
    *(unsigned char *)(a1 + 120) = 1;
LABEL_4:
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 48), 1uLL);
    goto LABEL_18;
  }
  if (IOHIDEventGetIntegerValue())
  {
    uint64_t v6 = IOHIDEventGetIntegerValue();
    if (v6 == 48)
    {
      if (*(void *)(a1 + 24)) {
        ++*(_DWORD *)(a1 + 76);
      }
      else {
        ++*(_DWORD *)(a1 + 72);
      }
      goto LABEL_4;
    }
    if (v6 == 64)
    {
      if (*(void *)(a1 + 24)) {
        ++*(_DWORD *)(a1 + 68);
      }
      else {
        ++*(_DWORD *)(a1 + 64);
      }
      if (*(const void **)(a1 + 152) != a2 || !*(void *)(a1 + 144)) {
        goto LABEL_4;
      }
      ++*(_DWORD *)(a1 + 108);
      goto LABEL_16;
    }
  }
LABEL_18:
  if (a2)
  {
    CFDictionaryRef v8 = *(const __CFDictionary **)(a1 + 136);
    if (v8)
    {
      if (CFDictionaryContainsKey(v8, a2))
      {
        Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), a2);
        CFTypeID v10 = CFGetTypeID(Value);
        if (v10 == CFDictionaryGetTypeID())
        {
          unint64_t v11 = IOHIDEventGetTimeStampOfType()
              * (unint64_t)*(unsigned int *)(a1 + 56)
              / *(unsigned int *)(a1 + 60);
          unint64_t v43 = v11;
          unint64_t v12 = IOHIDEventGetIntegerValue();
          unint64_t v42 = v12;
          uint64_t v13 = IOHIDEventGetIntegerValue();
          uint64_t v14 = IOHIDEventGetIntegerValue();
          uint64_t v15 = IOHIDEventGetIntegerValue();
          uint64_t v16 = IOHIDEventGetIntegerValue();
          char Phase = IOHIDEventGetPhase();
          v18 = CFDictionaryGetValue((CFDictionaryRef)Value, @"MultiPressUsages");
          if (v18)
          {
            v19 = v18;
            valuePtr[0] = v15 | (v14 << 16);
            CFNumberRef v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, valuePtr);
            CFTypeID v21 = CFGetTypeID(v19);
            if (v21 == CFArrayGetTypeID())
            {
              v44.length = CFArrayGetCount((CFArrayRef)v19);
              v44.location = 0;
              BOOL v22 = CFArrayContainsValue((CFArrayRef)v19, v44, v20) != 0;
            }
            else
            {
              BOOL v22 = 1;
            }
            CFRelease(v20);
          }
          else
          {
            BOOL v22 = 1;
          }
          if (v13 && v22 && (Phase & 4) == 0 && !v16)
          {
            uint64_t v41 = 0;
            unint64_t v40 = 0;
            CFNumberRef v23 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, @"PressCount");
            if (v23)
            {
              CFNumberRef v24 = v23;
              CFTypeID v25 = CFGetTypeID(v23);
              if (v25 == CFNumberGetTypeID()) {
                CFNumberGetValue(v24, kCFNumberLongLongType, &v40);
              }
            }
            CFNumberRef v26 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, @"MultiPressTime");
            if (v26 && (CFNumberRef v27 = v26, v28 = CFGetTypeID(v26), v28 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v27, kCFNumberLongLongType, &v41);
              uint64_t v29 = v41;
            }
            else
            {
              uint64_t v29 = 0;
            }
            unint64_t v30 = v11 - v29;
            if (v40) {
              BOOL v31 = v29 == 0;
            }
            else {
              BOOL v31 = 1;
            }
            int v32 = !v31;
            if (v31 || v40 != v12)
            {
              if (v40 >= v12) {
                int v32 = 0;
              }
              if (v32 != 1) {
                goto LABEL_59;
              }
              v34 = _IOHIDLogCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                sub_2407A33A8();
              }
            }
            else
            {
              if (v30 > 0x773593FF)
              {
LABEL_59:
                CFAllocatorRef v35 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
                CFNumberRef v36 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongLongType, &v42);
                CFNumberRef v37 = CFNumberCreate(v35, kCFNumberLongLongType, &v43);
                CFDictionarySetValue((CFMutableDictionaryRef)Value, @"PressCount", v36);
                CFDictionarySetValue((CFMutableDictionaryRef)Value, @"MultiPressTime", v37);
                CFRelease(v36);
                CFRelease(v37);
                return a3;
              }
              v33 = _IOHIDLogCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
                sub_2407A3334();
              }
            }
            valuePtr[0] = 0;
            valuePtr[1] = valuePtr;
            valuePtr[2] = 0x2000000000;
            valuePtr[3] = v30;
            analytics_send_event_lazy();
            _Block_object_dispose(valuePtr, 8);
            goto LABEL_59;
          }
        }
      }
    }
  }
  return a3;
}

void sub_2407A171C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IOHIDEventSystemStatistics::collectKeyStats(uint64_t a1, const void *a2)
{
  if (!a2) {
    return 0;
  }
  if (!*(void *)(a1 + 128) || IOHIDEventGetType() != 3) {
    return 0;
  }
  uint64_t result = IOHIDEventGetIntegerValue();
  if (result)
  {
    uint64_t result = (uint64_t)CFSetGetValue(*(CFSetRef *)(a1 + 128), a2);
    if (result)
    {
      int IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
      uint64_t v6 = (unsigned __int16)IOHIDEventGetIntegerValue();
      if (IntegerValue == 7 && (v6 - 4) <= 0x19)
      {
        uint64_t v7 = _IOHIDLogCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_2407A31FC();
        }
        ++*(_DWORD *)(a1 + 84);
        return 1;
      }
      if (IntegerValue == 7)
      {
        if ((v6 - 30) < 0xA)
        {
LABEL_18:
          CFDictionaryRef v8 = _IOHIDLogCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            sub_2407A3230();
          }
          ++*(_DWORD *)(a1 + 88);
          return 1;
        }
        if (v6 <= 0x38)
        {
          if (((1 << v6) & 0x1FBE00000000000) != 0) {
            goto LABEL_18;
          }
          if (v6 == 44)
          {
            CFTypeID v10 = _IOHIDLogCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              sub_2407A3300();
            }
            ++*(_DWORD *)(a1 + 92);
            return 1;
          }
        }
        if ((v6 - 79) <= 3)
        {
          unint64_t v11 = _IOHIDLogCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            sub_2407A3264();
          }
          ++*(_DWORD *)(a1 + 96);
          return 1;
        }
        if ((v6 - 224) > 7 || v6 == 228)
        {
          uint64_t result = 1;
          if (v6 <= 0x39 && ((1 << v6) & 0x2000D0000000000) != 0)
          {
            unint64_t v12 = _IOHIDLogCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              sub_2407A3298();
            }
            ++*(_DWORD *)(a1 + 100);
            return 1;
          }
          return result;
        }
      }
      else
      {
        uint64_t result = 1;
        if (IntegerValue != 12 || v6 != 669) {
          return result;
        }
      }
      v9 = _IOHIDLogCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_2407A32CC();
      }
      ++*(_DWORD *)(a1 + 104);
      return 1;
    }
  }
  return result;
}

void IOHIDEventSystemStatistics::registerButtonService(uint64_t a1, uint64_t a2)
{
  if (IOHIDServiceConformsTo())
  {
    *(void *)(a1 + 152) = a2;
    CFSetRef v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_2407A2FC0();
    }
  }
}

void IOHIDEventSystemStatistics::registerService(uint64_t a1, const void *a2)
{
  IOHIDEventSystemStatistics::registerKeyboardService(a1, a2);
  IOHIDEventSystemStatistics::registerMultiPressService(a1, a2);
  IOHIDEventSystemStatistics::registerCrownService(a1, (uint64_t)a2);

  IOHIDEventSystemStatistics::registerButtonService(a1, (uint64_t)a2);
}

void IOHIDEventSystemStatistics::registerMultiPressService(uint64_t a1, const void *a2)
{
  Property = (const void *)IOHIDServiceGetProperty();
  if (Property)
  {
    v5 = Property;
    CFTypeID v6 = CFGetTypeID(Property);
    if (v6 == CFBooleanGetTypeID())
    {
      if (v5 != (const void *)*MEMORY[0x263EFFB40]) {
        return;
      }
    }
    else
    {
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 != CFNumberGetTypeID()) {
        return;
      }
      uint64_t valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberLongLongType, &valuePtr);
      if (!valuePtr) {
        return;
      }
    }
    if (*(void *)(a1 + 136))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (Mutable)
      {
        v9 = Mutable;
        CFTypeID v10 = (const void *)IOHIDServiceGetProperty();
        if (v10) {
          CFDictionarySetValue(v9, @"MultiPressUsages", v10);
        }
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 136), a2, v9);
        unint64_t v11 = _IOHIDLogCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_2407A2EF4((uint64_t)a2, (uint64_t)v10, v11);
        }
        CFRelease(v9);
      }
    }
  }
}

void IOHIDEventSystemStatistics::registerKeyboardService(uint64_t a1, const void *a2)
{
  if (IOHIDServiceConformsTo())
  {
    int valuePtr = 0;
    CFNumberRef Property = (const __CFNumber *)IOHIDServiceGetProperty();
    if (Property)
    {
      CFNumberRef v5 = Property;
      CFTypeID v6 = CFGetTypeID(Property);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if (valuePtr == 1452)
        {
          CFTypeID v7 = (const void *)IOHIDServiceGetProperty();
          if (v7)
          {
            CFDictionaryRef v8 = v7;
            CFTypeID v9 = CFGetTypeID(v7);
            if (v9 == CFStringGetTypeID())
            {
              if (CFEqual(v8, @"AID"))
              {
                ++*(_DWORD *)(a1 + 80);
                CFTypeID v10 = *(__CFSet **)(a1 + 128);
                if (v10) {
                  CFSetAddValue(v10, a2);
                }
                unint64_t v11 = _IOHIDLogCategory();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
                  sub_2407A2EC0();
                }
              }
            }
          }
        }
      }
    }
  }
}

void IOHIDEventSystemStatistics::registerCrownService(uint64_t a1, uint64_t a2)
{
  if (IOHIDServiceConformsTo())
  {
    *(void *)(a1 + 144) = a2;
    CFSetRef v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_2407A2F8C();
    }
  }
}

IOHIDEventSystemStatistics *IOHIDEventSystemStatisticsFactory(uint64_t a1, const void *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (!CFEqual(a2, v4)) {
    return 0;
  }
  CFNumberRef v5 = (IOHIDEventSystemStatistics *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 168, 0);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(v3, 7u, 0x2Bu, 0xC0u, 0x77u, 0xE9u, 0x84u, 0x4Cu, 0x2Au, 0xBBu, 0x72u, 0xD4u, 0x76u, 0x9Cu, 0xE4u, 0x4Fu, 0xAFu);
  IOHIDEventSystemStatistics::IOHIDEventSystemStatistics(v5, v6);
  return v5;
}

uint64_t IOHIDEventSystemStatistics::AddRef(IOHIDEventSystemStatistics *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void IOHIDEventSystemStatistics::IOHIDEventSystemStatistics(IOHIDEventSystemStatistics *this, CFTypeRef cf)
{
  *(void *)this = &IOHIDEventSystemStatistics::sIOHIDEventSystemStatisticsFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((void *)this + 3) = 1;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  bzero((char *)this + 64, 0x10uLL);
  bzero((char *)this + 80, 0x1CuLL);
  bzero((char *)this + 108, 0x10uLL);
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
}

void IOHIDEventSystemStatistics::~IOHIDEventSystemStatistics(CFUUIDRef *this)
{
}

void sub_2407A1F2C(void *a1)
{
}

uint64_t IOHIDEventSystemStatistics::QueryInterface(IOHIDEventSystemStatistics *this, CFUUIDBytes a2, void **a3)
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

uint64_t IOHIDEventSystemStatistics::AddRef(IOHIDEventSystemStatistics *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDEventSystemStatistics::Release(IOHIDEventSystemStatistics *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDEventSystemStatistics::~IOHIDEventSystemStatistics((CFUUIDRef *)this);
    MEMORY[0x2455F9800]();
  }
  return v2;
}

BOOL IOHIDEventSystemStatistics::open(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  *(void *)(a1 + 128) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFFA0]);
  *(void *)(a1 + 160) = IOHIDEventCreateKeyboardEvent();
  *(void *)(a1 + 136) = CFDictionaryCreateMutable(v2, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  mach_timebase_info((mach_timebase_info_t)(a1 + 56));
  return *(void *)(a1 + 128) && *(void *)(a1 + 160) && *(void *)(a1 + 136) != 0;
}

void IOHIDEventSystemStatistics::close(void *a1)
{
  CFAllocatorRef v2 = (const void *)a1[16];
  if (v2)
  {
    CFRelease(v2);
    a1[16] = 0;
  }
  CFAllocatorRef v3 = (const void *)a1[20];
  if (v3)
  {
    CFRelease(v3);
    a1[20] = 0;
  }
  CFUUIDRef v4 = (const void *)a1[17];
  if (v4)
  {
    CFRelease(v4);
    a1[17] = 0;
  }
}

uint64_t IOHIDEventSystemStatistics::scheduleWithDispatchQueue(uint64_t this, dispatch_queue_s *a2)
{
  *(void *)(this + 40) = a2;
  if (a2)
  {
    uint64_t v2 = this;
    global_queue = dispatch_get_global_queue(-2, 0);
    CFUUIDRef v4 = dispatch_source_create(MEMORY[0x263EF83B0], 0, 0, global_queue);
    *(void *)(v2 + 48) = v4;
    dispatch_set_context(v4, (void *)v2);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v2 + 48), (dispatch_function_t)IOHIDEventSystemStatistics::handlePendingStats);
    dispatch_resume(*(dispatch_object_t *)(v2 + 48));
    CFUUIDRef v5 = *(NSObject **)(v2 + 40);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = sub_2407A22E4;
    handler[3] = &unk_2650D5DB8;
    handler[4] = v2;
    return notify_register_dispatch("com.apple.iokit.hid.displayStatus", (int *)(v2 + 32), v5, handler);
  }
  return this;
}

uint64_t sub_2407A22E4(uint64_t a1)
{
  return notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 32), (uint64_t *)(*(void *)(a1 + 32) + 24));
}

void IOHIDEventSystemStatistics::unscheduleFromDispatchQueue(IOHIDEventSystemStatistics *this, dispatch_queue_s *a2)
{
  if (*((dispatch_queue_s **)this + 5) == a2)
  {
    CFAllocatorRef v3 = *((void *)this + 6);
    if (v3)
    {
      dispatch_source_cancel(v3);
      dispatch_release(*((dispatch_object_t *)this + 6));
      *((void *)this + 6) = 0;
    }
  }
}

CFTypeRef sub_2407A2338(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v3 = (void *)(a1 + 40);
  CFTypeRef result = *(CFTypeRef *)(a2 + 48);
  *(void *)(a1 + 40) = &unk_26F4E5F88;
  *(void *)(a1 + 48) = result;
  if (result) {
    CFTypeRef result = CFRetain(result);
  }
  *CFAllocatorRef v3 = &unk_26F4E5F08;
  return result;
}

void *sub_2407A23A0(uint64_t a1)
{
  return sub_2407A2DA0((void *)(a1 + 40));
}

void sub_2407A23AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  RegistryID = (const void *)IOHIDServiceGetRegistryID();
  CFAllocatorRef v3 = *(__CFArray **)(v1 + 48);

  CFArrayAppendValue(v3, RegistryID);
}

void IOHIDEventSystemStatistics::handlePendingStats(IOHIDEventSystemStatistics *this)
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3802000000;
  v12[3] = sub_2407A2724;
  v12[5] = 0;
  v12[6] = 0;
  v12[4] = nullsub_1;
  uint64_t v9 = 0;
  v10[0] = &v9;
  v10[1] = 0x4802000000;
  v10[2] = sub_2407A2734;
  v10[3] = nullsub_2;
  memset(&v10[4], 0, 24);
  int v11 = 0;
  uint64_t v7 = 0;
  v8[0] = &v7;
  v8[1] = 0x3802000000;
  v8[2] = sub_2407A274C;
  v8[4] = 0;
  v8[5] = 0;
  v8[3] = nullsub_3;
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  sub_2407A2BB8(v6, 0);
  uint64_t v2 = *((void *)this + 5);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = sub_2407A275C;
  block[3] = &unk_2650D5E08;
  block[4] = v12;
  block[5] = &v9;
  block[6] = &v7;
  block[7] = this;
  dispatch_sync(v2, block);
  analytics_send_event_lazy();
  CFAllocatorRef v3 = _IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_2407A3148((uint64_t)v10, v3);
  }
  analytics_send_event_lazy();
  if (*(unsigned char *)(v8[0] + 52))
  {
    CFUUIDRef v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_2407A30B0((uint64_t)v8, v4);
    }
    analytics_send_event_lazy();
  }
  sub_2407A2CA0(v6);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v12, 8);
}

void sub_2407A26DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  sub_2407A2CA0(&a32);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

__n128 sub_2407A2724(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 sub_2407A2734(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(_OWORD *)(a1 + 52) = *(_OWORD *)(a2 + 52);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 sub_2407A274C(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_2407A275C(void *a1)
{
  uint64_t v2 = (_OWORD *)a1[7];
  *(_OWORD *)(*(void *)(a1[4] + 8) + 40) = v2[4];
  bzero(v2 + 4, 0x10uLL);
  uint64_t v3 = *(void *)(a1[5] + 8);
  long long v4 = v2[5];
  uint64_t v5 = *((void *)v2 + 12);
  *(_DWORD *)(v3 + 64) = *((_DWORD *)v2 + 26);
  *(void *)(v3 + 56) = v5;
  *(_OWORD *)(v3 + 40) = v4;
  bzero(v2 + 5, 0x1CuLL);
  *(_OWORD *)(*(void *)(a1[6] + 8) + 40) = *(_OWORD *)((char *)v2 + 108);

  bzero((char *)v2 + 108, 0x10uLL);
}

xpc_object_t sub_2407A27F0(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "homeButtonWakeCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  xpc_dictionary_set_uint64(v2, "homeButtonActionCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 44));
  xpc_dictionary_set_uint64(v2, "powerButtonWakeCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 48));
  xpc_dictionary_set_uint64(v2, "powerButtonSleepCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 52));
  return v2;
}

xpc_object_t sub_2407A2894(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "enumerationCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  xpc_dictionary_set_uint64(v2, "characterKeyCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 44));
  xpc_dictionary_set_uint64(v2, "symbolKeyCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 48));
  xpc_dictionary_set_uint64(v2, "spacebarKeyCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 52));
  xpc_dictionary_set_uint64(v2, "arrowKeyCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
  xpc_dictionary_set_uint64(v2, "cursorKeyCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 60));
  xpc_dictionary_set_uint64(v2, "modifierKeyCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 64));
  return v2;
}

xpc_object_t sub_2407A298C(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "clockwiseRotation", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 44));
  xpc_dictionary_set_int64(v2, "counterclockwiseRotation", *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 48));
  xpc_dictionary_set_uint64(v2, "pressCount", *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  return v2;
}

BOOL IOHIDEventSystemStatistics::isCharacterKey(IOHIDEventSystemStatistics *this, int a2)
{
  return this == 7 && (a2 - 4) < 0x1A;
}

uint64_t IOHIDEventSystemStatistics::isSymbolKey(IOHIDEventSystemStatistics *this, unsigned int a2)
{
  unint64_t v2 = (0x1FBE00000000000uLL >> a2) & 1;
  if (a2 > 0x38) {
    LODWORD(v2) = 0;
  }
  if (a2 - 30 >= 0xA) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 1;
  }
  if (this == 7) {
    return v3;
  }
  else {
    return 0;
  }
}

BOOL IOHIDEventSystemStatistics::isSpacebarKey(IOHIDEventSystemStatistics *this, int a2)
{
  return this == 7 && a2 == 44;
}

BOOL IOHIDEventSystemStatistics::isArrowKey(IOHIDEventSystemStatistics *this, int a2)
{
  return this == 7 && (a2 - 79) < 4;
}

uint64_t IOHIDEventSystemStatistics::isCursorKey(IOHIDEventSystemStatistics *this, unsigned int a2)
{
  unint64_t v2 = (0x2000D0000000000uLL >> a2) & 1;
  if (a2 > 0x39) {
    LODWORD(v2) = 0;
  }
  if (this == 7) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t IOHIDEventSystemStatistics::isModifierKey(IOHIDEventSystemStatistics *this, int a2)
{
  if (this == 12 && a2 == 669) {
    return 1;
  }
  unsigned int v3 = (0xEFu >> (a2 + 32)) & 1;
  if ((unsigned __int16)(a2 - 224) > 7u) {
    unsigned int v3 = 0;
  }
  if (this == 7) {
    return v3;
  }
  else {
    return 0;
  }
}

xpc_object_t sub_2407A2AE8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "PressFailureTime", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) / 0xF4240uLL);
  return v2;
}

xpc_object_t sub_2407A2B50(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "PressSuccessTime", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) / 0xF4240uLL);
  return v2;
}

void *sub_2407A2BB8(void *a1, int a2)
{
  *a1 = &unk_26F4E5E88;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return a1;
}

void sub_2407A2C18(_Unwind_Exception *a1)
{
  sub_2407A2CA0(v1);
  _Unwind_Resume(a1);
}

void sub_2407A2C2C(void *a1)
{
  sub_2407A2CA0(a1);

  JUMPOUT(0x2455F9800);
}

void sub_2407A2C68(void *a1)
{
  sub_2407A2CA0(a1);

  JUMPOUT(0x2455F9800);
}

void *sub_2407A2CA0(void *a1)
{
  xpc_object_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E5EE8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2407A2CF0(void *a1)
{
  sub_2407A2DA0(a1);

  JUMPOUT(0x2455F9800);
}

void sub_2407A2D2C(void *a1)
{
  sub_2407A2DA0(a1);

  JUMPOUT(0x2455F9800);
}

void sub_2407A2D68(void *a1)
{
  sub_2407A2DA0(a1);

  JUMPOUT(0x2455F9800);
}

void *sub_2407A2DA0(void *a1)
{
  xpc_object_t v2 = (const void *)a1[1];
  *a1 = &unk_26F4E5F88;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407A2DF0(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID()) {
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
  *a1 = &unk_26F4E5F88;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E5F68;
  return a1;
}

void sub_2407A2E8C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2407A2EC0()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard registered\n", v2, v3, v4, v5, v6);
}

void sub_2407A2EF4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  IOHIDServiceGetRegistryID();
  sub_2407A2EB4();
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_2407A0000, a3, OS_LOG_TYPE_DEBUG, "Added MultiPress Analytics for service:%@ %@\n", v5, 0x16u);
}

void sub_2407A2F8C()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Crown service registered\n", v2, v3, v4, v5, v6);
}

void sub_2407A2FC0()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Button service registered\n", v2, v3, v4, v5, v6);
}

void sub_2407A2FF4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  IOHIDServiceGetRegistryID();
  sub_2407A2EB4();
  _os_log_debug_impl(&dword_2407A0000, a2, OS_LOG_TYPE_DEBUG, "MultiPress service removed: %@\n", v3, 0xCu);
}

void sub_2407A307C()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard unregistered\n", v2, v3, v4, v5, v6);
}

void sub_2407A30B0(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(*(void *)a1 + 44);
  int v2 = *(_DWORD *)(*(void *)a1 + 48);
  int v4 = *(_DWORD *)(*(void *)a1 + 40);
  v5[0] = 67109632;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v2;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_debug_impl(&dword_2407A0000, a2, OS_LOG_TYPE_DEBUG, "Crown stats clockwise rotation: %d counterclockwise rotation: %d press count: %d\n", (uint8_t *)v5, 0x14u);
}

void sub_2407A3148(uint64_t a1, NSObject *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(*(void *)a1 + 44);
  int v3 = *(_DWORD *)(*(void *)a1 + 48);
  int v4 = *(_DWORD *)(*(void *)a1 + 52);
  int v5 = *(_DWORD *)(*(void *)a1 + 56);
  int v7 = *(_DWORD *)(*(void *)a1 + 60);
  int v6 = *(_DWORD *)(*(void *)a1 + 64);
  v8[0] = 67110400;
  v8[1] = v2;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 1024;
  int v16 = v7;
  __int16 v17 = 1024;
  int v18 = v6;
  _os_log_debug_impl(&dword_2407A0000, a2, OS_LOG_TYPE_DEBUG, "Apple Keyboard char: %d symbol: %d spacebar: %d arrow: %d cursor: %d modifier: %d \n", (uint8_t *)v8, 0x26u);
}

void sub_2407A31FC()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard character key\n", v2, v3, v4, v5, v6);
}

void sub_2407A3230()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard symbol key\n", v2, v3, v4, v5, v6);
}

void sub_2407A3264()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard arrow key\n", v2, v3, v4, v5, v6);
}

void sub_2407A3298()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard cursor key\n", v2, v3, v4, v5, v6);
}

void sub_2407A32CC()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard modifier key\n", v2, v3, v4, v5, v6);
}

void sub_2407A3300()
{
  sub_2407A2EA8();
  sub_2407A2E8C(&dword_2407A0000, v0, v1, "Apple Keyboard spacebar key\n", v2, v3, v4, v5, v6);
}

void sub_2407A3334()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2407A2EB4();
  _os_log_debug_impl(&dword_2407A0000, v0, OS_LOG_TYPE_DEBUG, "PressInterval Failed: %llu\n", v1, 0xCu);
}

void sub_2407A33A8()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2407A2EB4();
  _os_log_debug_impl(&dword_2407A0000, v0, OS_LOG_TYPE_DEBUG, "PressInterval Success: %llu\n", v1, 0xCu);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
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

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x270EE4F80](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
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

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x270EF4280]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x270EF4358]();
}

uint64_t IOHIDEventGetTimeStampOfType()
{
  return MEMORY[0x270EF4378]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x270EF4688]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x270EF4698]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x270EF46A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IOHIDCFSetApplyBlock()
{
  return MEMORY[0x270EF4B60]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x270F18A78]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}