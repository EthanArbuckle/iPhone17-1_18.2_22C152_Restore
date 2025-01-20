uint64_t IOHIDEventServiceFastPathClass::_copyEvent(uint64_t a1, const void *a2, unsigned int a3, uint64_t *a4)
{
  return IOHIDEventServiceFastPathClass::copyEvent(*(void *)(a1 + 8), a2, a3, a4);
}

uint64_t IOHIDEventServiceFastPathClass::_start(IOHIDEventServiceFastPathClass **this, const __CFDictionary *a2, const __CFDictionary *a3)
{
  return IOHIDEventServiceFastPathClass::start(this[1], a2, (io_object_t)a3);
}

uint64_t IOHIDEventServiceFastPathClass::_open(IOHIDEventServiceFastPathClass **this, void *a2, const void *a3, const __CFDictionary *a4)
{
  return IOHIDEventServiceFastPathClass::open(this[1], a2, a3);
}

uint64_t IOHIDIUnknown::genericQueryInterface(IOHIDIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(void, void *, void, void))(**((void **)this + 1) + 16))(*((void *)this + 1), a2, *(void *)&a3.byte0, *(void *)&a3.byte8);
}

uint64_t IOHIDEventServiceFastPathClass::copyEvent(uint64_t a1, CFTypeRef cf, unsigned int a3, uint64_t *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t input = a3;
  uint64_t v21 = 0;
  if (cf)
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 == CFDataGetTypeID())
    {
      CFDataRef v8 = (const __CFData *)CFRetain(cf);
      uint64_t v21 = 1;
      if (v8)
      {
LABEL_4:
        BytePtr = CFDataGetBytePtr(v8);
        CFIndex Length = CFDataGetLength(v8);
        goto LABEL_8;
      }
    }
    else
    {
      CFDataRef v8 = IOCFSerialize(cf, 1uLL);
      if (v8) {
        goto LABEL_4;
      }
    }
    BytePtr = 0;
    CFIndex Length = 0;
  }
  else
  {
    BytePtr = 0;
    CFIndex Length = 0;
    CFDataRef v8 = 0;
  }
LABEL_8:
  v11 = *(_DWORD **)(a1 + 64);
  if (v11)
  {
    if (a4)
    {
      _DWORD *v11 = 0;
      uint64_t v12 = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 2u, &input, 2u, BytePtr, Length, 0, 0, 0, 0);
      if (v12)
      {
        uint64_t v13 = v12;
        v14 = _IOHIDLogCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_240775474((uint64_t)cf, v13, v14);
        }
      }
      else
      {
        v17 = *(_DWORD **)(a1 + 64);
        if (*v17)
        {
          uint64_t v18 = MEMORY[0x2455F7DC0](*MEMORY[0x263EFFB08], v17 + 1);
          *a4 = v18;
        }
        else
        {
          uint64_t v18 = *a4;
        }
        if (v18) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = 3758097084;
        }
      }
    }
    else
    {
      v16 = _IOHIDLogCategory();
      uint64_t v13 = 3758097090;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_240775430(v16);
      }
    }
  }
  else
  {
    uint64_t v13 = 3758097084;
    v15 = _IOHIDLogCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_2407753EC(v15);
    }
  }
  if (v8) {
    CFRelease(v8);
  }
  return v13;
}

uint64_t IOHIDIUnknown::genericRelease(IOHIDIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 32))();
}

uint64_t IOHIDEventServiceFastPathClass::_probe(IOHIDEventServiceFastPathClass *this, void *a2, io_object_t object, unsigned int a4, int *a5)
{
  uint64_t v5 = 3758097090;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOHIDEventService")) {
      return 0;
    }
    else {
      return 3758097090;
    }
  }
  return v5;
}

uint64_t IOHIDEventServiceFastPathClass::start(IOHIDEventServiceFastPathClass *this, const __CFDictionary *a2, io_object_t object)
{
  uint64_t v5 = IOObjectRetain(object);
  if (v5)
  {
    uint64_t v7 = v5;
    v10 = _IOHIDLogCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2407751C0();
    }
  }
  else
  {
    *((_DWORD *)this + 12) = object;
    if (IOServiceOpen(object, *MEMORY[0x263EF8960], 2u, (io_connect_t *)this + 13))
    {
      v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_240775158();
      }
    }
    uint64_t v7 = MEMORY[0x2455F7C70](*((unsigned int *)this + 13), (char *)this + 56);
    if (v7)
    {
      CFDataRef v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_2407750F0();
      }
    }
  }
  return v7;
}

uint64_t IOHIDEventServiceFastPathClass::open(IOHIDEventServiceFastPathClass *this, unsigned int a2, CFTypeRef object)
{
  kern_return_t v9;
  NSObject *v10;
  BOOL v11;
  uint64_t result;
  CFNumberRef CFProperty;
  CFNumberRef v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int valuePtr;
  uint64_t input;

  CFDataRef v5 = IOCFSerialize(object, 1uLL);
  if (v5)
  {
    CFDataRef v6 = v5;
    BytePtr = CFDataGetBytePtr(v5);
    CFIndex Length = CFDataGetLength(v6);
    uint64_t input = a2;
    v9 = IOConnectCallMethod(*((_DWORD *)this + 13), 0, &input, 1u, BytePtr, Length, 0, 0, 0, 0);
    CFRelease(v6);
    if (v9)
    {
LABEL_3:
      v10 = _IOHIDLogCategory();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      result = 0;
      if (!v11) {
        return result;
      }
      sub_2407752B4();
      return 0;
    }
  }
  else
  {
    uint64_t input = a2;
    if (IOConnectCallMethod(*((_DWORD *)this + 13), 0, &input, 1u, 0, 0, 0, 0, 0, 0)) {
      goto LABEL_3;
    }
  }
  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 14), @"QueueSize", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (CFProperty)
  {
    v14 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v14);
    if (valuePtr)
    {
      v19 = 0;
      v20 = 0;
      v15 = MEMORY[0x2455F7C80](*((unsigned int *)this + 13), 0, *MEMORY[0x263EF8960], &v20, &v19, 1);
      v16 = v19;
      v17 = v20;
      *((void *)this + 8) = v20;
      *((void *)this + 9) = v16;
      if (v15 || !v17 || !v16)
      {
        uint64_t v18 = _IOHIDLogCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_240775228(&valuePtr, v15, v18);
        }
        return 0;
      }
    }
  }
  return 1;
}

uint64_t IOHIDLibFactory(uint64_t a1, const void *a2)
{
  uint64_t v16 = 0;
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xFAu, 0x12u, 0xFAu, 0x38u, 0x6Fu, 0x1Au, 0x11u, 0xD4u, 0xBAu, 0xCu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(a2, v3))
  {
    v4 = objc_alloc_init(IOHIDObsoleteDeviceClass);
    CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(0, 0x78u, 0xBDu, 0x42u, 0xCu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x94u, 0x74u, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
    CFUUIDBytes v6 = CFUUIDGetUUIDBytes(v5);
    objc_msgSend_queryInterface_outInterface_(v4, *(const char **)&v6.byte8, *(uint64_t *)&v6.byte0, *(uint64_t *)&v6.byte8, (uint64_t)&v16);
LABEL_7:

    return v16;
  }
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x7Du, 0xDEu, 0xECu, 0xA8u, 0xA7u, 0xB4u, 0x11u, 0xDAu, 0x8Au, 0xEu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  if (CFEqual(a2, v7))
  {
    v4 = objc_alloc_init(IOHIDDeviceClass);
    CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x47u, 0x4Bu, 0xDCu, 0x8Eu, 0x9Fu, 0x4Au, 0x11u, 0xDAu, 0xB3u, 0x66u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    CFUUIDBytes v9 = CFUUIDGetUUIDBytes(v8);
    objc_msgSend_queryInterface_outInterface_(v4, *(const char **)&v9.byte8, *(uint64_t *)&v9.byte0, *(uint64_t *)&v9.byte8, (uint64_t)&v16);
    goto LABEL_7;
  }
  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x40u, 0xA5u, 0x7Au, 0x4Eu, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x92u, 0x95u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
  if (CFEqual(a2, v10))
  {
    v4 = objc_alloc_init(IOHIDUPSClass);
    CFUUIDRef v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    CFUUIDBytes v12 = CFUUIDGetUUIDBytes(v11);
    objc_msgSend_queryInterface_outInterface_(v4, *(const char **)&v12.byte8, *(uint64_t *)&v12.byte0, *(uint64_t *)&v12.byte8, (uint64_t)&v16);
    goto LABEL_7;
  }
  CFUUIDRef v14 = CFUUIDGetConstantUUIDWithBytes(0, 0xBu, 0x84u, 0x2Au, 0xDDu, 0xC3u, 0x95u, 0x43u, 0x52u, 0x95u, 0xF6u, 0x65u, 0x85u, 0xEBu, 0x51u, 0x56u, 0x23u);
  v15 = (IOHIDEventServiceFastPathClass *)CFEqual(a2, v14);
  if (v15) {
    IOHIDEventServiceFastPathClass::alloc(v15);
  }
  return v16;
}

void sub_240768380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IOHIDEventServiceFastPathClass::queryInterface(IOHIDEventServiceFastPathClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v8)))
  {
    uint64_t v9 = *(void *)this;
    *a3 = (char *)this + 16;
LABEL_4:
    (*(void (**)(IOHIDEventServiceFastPathClass *))(v9 + 24))(this);
    goto LABEL_5;
  }
  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(v6, 0x27u, 0xBAu, 0xAEu, 0x90u, 0x2Fu, 0xE5u, 0x40u, 0x2Au, 0xBFu, 0x7Fu, 0x4Eu, 0xFAu, 0x27u, 0x7Du, 0x37u, 8u);
  if (CFEqual(v5, v12))
  {
    *((void *)this + 4) = &IOHIDEventServiceFastPathClass::sIOHIDServiceFastPathInterface;
    *((void *)this + 5) = this;
    *a3 = (char *)this + 32;
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

uint64_t IOHIDIUnknown::addRef(atomic_uint *this)
{
  return atomic_fetch_add(this + 2, 1u) + 1;
}

void IOHIDEventServiceFastPathClass::alloc(IOHIDEventServiceFastPathClass *this)
{
}

void sub_2407685C8(_Unwind_Exception *a1)
{
  MEMORY[0x2455F7FE0](v1, 0x10A1C40F1A87D79);
  _Unwind_Resume(a1);
}

void IOHIDIUnknown::IOHIDIUnknown(IOHIDIUnknown *this, void *a2)
{
  *(void *)this = &unk_26F4E2318;
  *((_DWORD *)this + 2) = 1;
  *((void *)this + 2) = a2;
  *((void *)this + 3) = this;
  IOHIDIUnknown::factoryAddRef(this);
}

void IOHIDIUnknown::factoryAddRef(IOHIDIUnknown *this)
{
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes(0, 0x13u, 0xAAu, 0x9Cu, 0x44u, 0x6Fu, 0x1Bu, 0x11u, 0xD4u, 0x90u, 0x7Cu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);

  CFPlugInAddInstanceForFactory(v1);
}

uint64_t IOHIDIUnknown::release(atomic_uint *this)
{
  unsigned int add = atomic_fetch_add(this + 2, 0xFFFFFFFF);
  if (add)
  {
    if (this && add == 1) {
      (*(void (**)(atomic_uint *))(*(void *)this + 8))(this);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    sub_240775064();
  }
  return add - 1;
}

uint64_t sub_2407687D4(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_queryInterface_outInterface_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_2407687EC(id **a1)
{
  id v1 = **a1;
  int v2 = CFGetRetainCount(v1);
  CFRetain(v1);

  return (v2 + 1);
}

uint64_t sub_240768830(id **a1)
{
  id v1 = **a1;
  int v2 = CFGetRetainCount(v1);
  CFRelease(v1);

  return (v2 - 1);
}

uint64_t sub_2407689F0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_probe_service_outScore_, a2, a3, a4);
}

uint64_t sub_240768A08(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_start_service_, a2, a3, a5);
}

uint64_t sub_240768A1C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

void sub_24076982C(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFUUIDRef v5 = *(void (**)(void, uint64_t, void))a1;
    if (*(void *)a1)
    {
      CFUUIDRef v8 = 0;
      if (a3)
      {
        if (a4)
        {
          uint64_t v9 = (void *)*((void *)a1 + 4);
          if (v9)
          {
            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id obj = v9;
            uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v43, (uint64_t)v47, 16);
            if (v11)
            {
              uint64_t v12 = v11;
              CFUUIDRef v8 = 0;
              unint64_t v13 = 0;
              uint64_t v14 = *(void *)v44;
              while (2)
              {
                uint64_t v15 = 0;
                uint64_t v16 = v8;
                do
                {
                  if (*(void *)v44 != v14) {
                    objc_enumerationMutation(obj);
                  }
                  CFUUIDRef v8 = *(id *)(*((void *)&v43 + 1) + 8 * v15);

                  uint64_t v21 = (int *)(a4 + v13);
                  unint64_t v22 = *(unsigned int *)(a4 + v13 + 4);
                  v13 += v22 >> 8;
                  if (v22 >> 10 < 5 || v13 > a3)
                  {
                    v34 = _IOHIDLogCategory();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                      sub_240774E94(v21 + 1, v34);
                    }
                    goto LABEL_26;
                  }
                  int v24 = *v21;
                  if (v24 != objc_msgSend_elementCookie(v8, v17, v18, v19, v20))
                  {
                    v34 = _IOHIDLogCategory();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                      sub_240774F14((uint64_t)v21, v8, (uint64_t)v34, v35, v36);
                    }
                    goto LABEL_26;
                  }
                  objc_msgSend_elementRef(v8, v25, v26, v27, v28);
                  v29 = (const void *)_IOHIDValueCreateWithElementValuePtr();
                  objc_msgSend_setValueRef_(v8, v30, (uint64_t)v29, v31, v32);
                  if (v29) {
                    CFRelease(v29);
                  }
                  ++v15;
                  uint64_t v16 = v8;
                }
                while (v12 != v15);
                uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v43, (uint64_t)v47, 16);
                if (v12) {
                  continue;
                }
                break;
              }
              v34 = v8;
              CFUUIDRef v8 = 0;
LABEL_26:
              a2 = a2;
            }
            else
            {
              CFUUIDRef v8 = 0;
            }

            objc_msgSend_releaseReport_(*((void **)a1 + 2), v37, a4, v38, v39);
            CFUUIDRef v5 = *(void (**)(void, uint64_t, void))a1;
          }
        }
      }
      v5(*((void *)a1 + 1), a2, *((void *)a1 + 3));
      v40 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = 0;

      free(a1);
    }
  }
}

uint64_t sub_240769C44(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_240769C54(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setDirection_, a2, a4, a5);
}

uint64_t sub_240769C64(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getDirection_, a2, a4, a5);
}

uint64_t sub_240769C74(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_240769C84(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_240769C94(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_containsElement_value_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_240769CA8(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setValue_value_options_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_240769CC0(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_getValue_value_options_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_240769CD8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_commit_timeout_callback_options_, a4, a2, a3);
}

uint64_t sub_240769CF4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_clear, a3, a4, a5);
}

uint64_t sub_24076A278(void ***a1, CFTypeRef *a2)
{
  if (!a2) {
    return 3758097090;
  }
  CFUUIDRef v3 = (id *)**a1;
  v4 = v3 + 5;
  CFUUIDRef v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  *a2 = (CFTypeRef)objc_msgSend_runLoopSource(WeakRetained, v7, v8, v9, v10);

  CFRetain(*a2);
  return 0;
}

uint64_t sub_24076A2F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(**(void **)a1 + 40));
  uint64_t v6 = objc_msgSend_runLoopSource(WeakRetained, v2, v3, v4, v5);

  return v6;
}

uint64_t sub_24076A340(uint64_t a1, _DWORD *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(**(void **)a1 + 40));
  *a2 = objc_msgSend_port(WeakRetained, v4, v5, v6, v7);

  return 0;
}

uint64_t sub_24076A38C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(**(void **)a1 + 40));
  uint64_t v6 = objc_msgSend_port(WeakRetained, v2, v3, v4, v5);

  return v6;
}

uint64_t sub_24076A3D4()
{
  return 0;
}

uint64_t sub_24076A3DC()
{
  return 0;
}

uint64_t sub_24076A3E4(void ***a1, uint64_t a2)
{
  uint64_t v3 = (id *)**a1;
  uint64_t v4 = v3 + 5;
  uint64_t v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  uint64_t v14 = objc_msgSend_addElement_(v5, v11, Element, v12, v13);

  return v14;
}

uint64_t sub_24076A458(void ***a1, uint64_t a2)
{
  uint64_t v3 = (id *)**a1;
  uint64_t v4 = v3 + 5;
  uint64_t v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  uint64_t v14 = objc_msgSend_removeElement_(v5, v11, Element, v12, v13);

  return v14;
}

uint64_t sub_24076A4CC(void ***a1, uint64_t a2)
{
  uint64_t v3 = (id *)**a1;
  unsigned __int8 v14 = 0;
  uint64_t v4 = v3 + 5;
  uint64_t v5 = v3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  objc_msgSend_containsElement_value_(v5, v11, Element, (uint64_t)&v14, v12);

  return v14;
}

uint64_t sub_24076A54C(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setElementValue_value_options_, a2, a3, 1);
}

uint64_t sub_24076A564(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getElementValue_value_options_, a2, a3, 1);
}

uint64_t sub_24076A57C(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setElementValue_value_options_, a2, a3, 0);
}

uint64_t sub_24076A594(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getElementValue_value_options_, a2, a3, 0);
}

uint64_t sub_24076A5AC(void **a1)
{
  return MEMORY[0x270F9A6D0](**a1, sel_commit_timeout_callback_options_, 0, 0, 0);
}

uint64_t sub_24076A5C8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_clear, a3, a4, a5);
}

void sub_24076A640(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_24076A660(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_24076A684(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void IOHIDIUnknown::factoryRelease(IOHIDIUnknown *this)
{
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes(0, 0x13u, 0xAAu, 0x9Cu, 0x44u, 0x6Fu, 0x1Bu, 0x11u, 0xD4u, 0x90u, 0x7Cu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);

  CFPlugInRemoveInstanceForFactory(v1);
}

void IOHIDIUnknown::~IOHIDIUnknown(IOHIDIUnknown *this)
{
  *(void *)this = &unk_26F4E2318;
  IOHIDIUnknown::factoryRelease(this);
}

uint64_t IOHIDIUnknown::genericAddRef(IOHIDIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(void))(**((void **)this + 1) + 24))();
}

void sub_24076B1C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B3C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B50C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076B8F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076BCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_24076BD08(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_24076BD18(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setDepth_, a2, a4, a5);
}

uint64_t sub_24076BD28(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getDepth_, a2, a4, a5);
}

uint64_t sub_24076BD38(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_24076BD48(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_24076BD58(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_containsElement_pValue_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_24076BD6C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(**a1, a2, a3, a4, a5);
}

uint64_t sub_24076BD78(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

uint64_t sub_24076BD84(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setValueAvailableCallback_context_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_24076BD98(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_copyNextValue_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_24076BDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](a4, sel_queueCallback_msg_size_info_, a1, a2, a3);
}

void sub_24076BEBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)IOHIDQueueClass;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_24076BEF4(void *a1)
{
}

void sub_24076C110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076C310(_Unwind_Exception *exception_object)
{
}

void sub_24076C540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_24076C58C(void *a1, uint64_t a2)
{
  uint64_t v4 = a1;
  uint64_t v3 = (void (*)(void, uint64_t, void, void *))v4[17];
  if (v3) {
    v3(v4[18], a2, v4[19], v4 + 16);
  }
}

void sub_24076C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_24076C7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_24076C7D4(id **a1, void *a2)
{
  id v3 = **a1;
  uint64_t v4 = v3;
  if (a2)
  {
    CFRetain(*((CFTypeRef *)v3 + 6));
    uint64_t v5 = 0;
    *a2 = v4[6];
  }
  else
  {
    uint64_t v5 = 3758097090;
  }

  return v5;
}

void sub_24076C844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_24076C854(uint64_t a1)
{
  return *(void *)(**(void **)a1 + 48);
}

uint64_t sub_24076C86C(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(**(void **)a1 + 36);
  return 0;
}

uint64_t sub_24076C88C(uint64_t a1)
{
  return *(unsigned int *)(**(void **)a1 + 36);
}

uint64_t sub_24076C8A4()
{
  return 0;
}

uint64_t sub_24076C8AC()
{
  return 0;
}

uint64_t sub_24076C8B4(id **a1, uint64_t a2)
{
  id v3 = (id *)**a1;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  uint64_t v12 = objc_msgSend_addElement_(v3, v9, Element, v10, v11);

  return v12;
}

void sub_24076C924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_24076C938(id **a1, uint64_t a2)
{
  id v3 = (id *)**a1;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  uint64_t v12 = objc_msgSend_removeElement_(v3, v9, Element, v10, v11);

  return v12;
}

void sub_24076C9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_24076C9BC(id **a1, uint64_t a2)
{
  id v3 = (id *)**a1;
  unsigned __int8 v13 = 0;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  uint64_t Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  objc_msgSend_containsElement_pValue_(v3, v9, Element, (uint64_t)&v13, v10);

  uint64_t v11 = v13;
  return v11;
}

void sub_24076CA3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_24076CA50(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(**a1, a2, a3, a4, a5);
}

uint64_t sub_24076CA5C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

uint64_t sub_24076CA68(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getNextEvent_, a2, a4, a5);
}

uint64_t sub_24076CA78(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setEventCallout_callbackTarget_callbackRefcon_, a2, a3, a4);
}

uint64_t sub_24076CA90()
{
  return 3758097095;
}

uint64_t IOHIDEventServiceFastPathClass::_stop(IOHIDEventServiceFastPathClass *this, void *a2)
{
  return 1;
}

void IOHIDEventServiceFastPathClass::_close(IOHIDEventServiceFastPathClass **this, void *a2)
{
}

CFTypeRef IOHIDEventServiceFastPathClass::_copyProperty(IOHIDEventServiceFastPathClass *this, const __CFString *a2, const __CFString *a3)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(*((void *)this + 1) + 56), a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

BOOL IOHIDEventServiceFastPathClass::_setProperty(IOHIDEventServiceFastPathClass **this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  return IOHIDEventServiceFastPathClass::setProperty(this[1], a2, a3);
}

void IOHIDEventServiceFastPathClass::IOHIDEventServiceFastPathClass(IOHIDEventServiceFastPathClass *this)
{
  IOHIDIUnknown::IOHIDIUnknown(this, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = &unk_26F4E2360;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
}

{
  uint64_t v1;

  IOHIDIUnknown::IOHIDIUnknown(this, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(void *)uint64_t v1 = &unk_26F4E2360;
  *(void *)(v1 + 32) = 0;
  *(void *)(v1 + 40) = v1;
  *(void *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = 0;
}

void IOHIDEventServiceFastPathClass::~IOHIDEventServiceFastPathClass(IOHIDEventServiceFastPathClass *this)
{
  *(void *)this = &unk_26F4E2360;
  int v2 = (void *)((char *)this + 64);
  if (*((void *)this + 8))
  {
    MEMORY[0x2455F7CA0](*((unsigned int *)this + 13), 0, *MEMORY[0x263EF8960], *((void *)this + 9));
    *int v2 = 0;
    v2[1] = 0;
  }
  io_object_t v3 = *((_DWORD *)this + 12);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 12) = 0;
  }
  io_object_t v4 = *((_DWORD *)this + 14);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 14) = 0;
  }
  io_connect_t v5 = *((_DWORD *)this + 13);
  if (v5)
  {
    IOServiceClose(v5);
    *((_DWORD *)this + 13) = 0;
  }

  IOHIDIUnknown::~IOHIDIUnknown(this);
}

{
  uint64_t vars8;

  IOHIDEventServiceFastPathClass::~IOHIDEventServiceFastPathClass(this);

  JUMPOUT(0x2455F7FE0);
}

void sub_24076CC68(_Unwind_Exception *a1)
{
  IOHIDIUnknown::~IOHIDIUnknown(v1);
  _Unwind_Resume(a1);
}

void sub_24076CCD0(_Unwind_Exception *a1)
{
  MEMORY[0x2455F7FE0](v1, 0x10A1C40F1A87D79);
  _Unwind_Resume(a1);
}

uint64_t IOHIDEventServiceFastPathClass::probe(IOHIDEventServiceFastPathClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4 = 3758097090;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOHIDEventService")) {
      return 0;
    }
    else {
      return 3758097090;
    }
  }
  return v4;
}

uint64_t IOHIDEventServiceFastPathClass::stop(IOHIDEventServiceFastPathClass *this)
{
  return 1;
}

void IOHIDEventServiceFastPathClass::close(IOHIDEventServiceFastPathClass *this, unsigned int a2)
{
  uint64_t input = a2;
  if (IOConnectCallScalarMethod(*((_DWORD *)this + 13), 1u, &input, 1u, 0, 0))
  {
    int v2 = _IOHIDLogCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_24077531C();
    }
  }
}

CFTypeRef IOHIDEventServiceFastPathClass::copyProperty(IOHIDEventServiceFastPathClass *this, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*((_DWORD *)this + 14), a2, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
}

BOOL IOHIDEventServiceFastPathClass::setProperty(IOHIDEventServiceFastPathClass *this, const __CFString *a2, const void *a3)
{
  kern_return_t v3;
  NSObject *v4;

  io_object_t v3 = IOConnectSetCFProperty(*((_DWORD *)this + 13), a2, a3);
  if (v3)
  {
    uint64_t v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_240775384();
    }
  }
  return v3 == 0;
}

void sub_24076CE2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t IOHIDAnalyticsGetConsoleModeStatus(void *a1)
{
  id v1 = a1;
  if (qword_268C8F6D8 != -1) {
    dispatch_once(&qword_268C8F6D8, &unk_26F4E23A0);
  }
  uint64_t v2 = 3758097084;
  if (qword_268C8F6D0)
  {
    Class v3 = NSClassFromString(&cfstr_Gpprocessmonit.isa);
    if (v3)
    {
      Class v4 = v3;
      SEL Uid = sel_getUid("monitorForCurrentProcess");
      uint64_t v9 = objc_msgSend_performSelector_(v4, v6, (uint64_t)Uid, v7, v8);
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = sub_24076CF6C;
        v15[3] = &unk_2650D3FA8;
        id v16 = v1;
        objc_msgSend_setUpdateHandler_(v10, v11, (uint64_t)v15, v12, v13);

        uint64_t v2 = 0;
      }
    }
  }

  return v2;
}

uint64_t sub_24076CF6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  SEL Uid = sel_getUid("isIdentifiedGame");
  objc_msgSend_performSelector_(v4, v6, (uint64_t)Uid, v7, v8);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v9();
}

void *sub_24076CFE0()
{
  result = dlopen("/System/Library/PrivateFrameworks/GamePolicy.framework/GamePolicy", 1);
  qword_268C8F6D0 = (uint64_t)result;
  return result;
}

void sub_24076E0F4(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(id *)(*((void *)&v30 + 1) + 8 * v7);
        if ((objc_msgSend_isConstant(v8, v9, v10, v11, v12, (void)v30) & 1) == 0)
        {

LABEL_12:
          if (objc_msgSend_pollEventUpdate(*(void **)(a1 + 32), v25, v26, v27, v28))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            if (*(void *)(v29 + 136))
            {
              sub_24076E2BC(*(void **)(v29 + 80), @"timer dispatchEvent");
              (*(void (**)(void, void, void, uint64_t, void))(*(void *)(a1 + 32) + 136))(*(void *)(*(void *)(a1 + 32) + 144), 0, *(void *)(*(void *)(a1 + 32) + 152), *(void *)(a1 + 32) + 24, *(void *)(*(void *)(a1 + 32) + 80));
            }
          }
          return;
        }
        int isUpdated = objc_msgSend_isUpdated(v8, v13, v14, v15, v16);

        if (!isUpdated) {
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v18, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_msgSend_invalidate(*(void **)(*(void *)(a1 + 32) + 160), v19, v20, v21, v22);
  uint64_t v23 = *(void *)(a1 + 32);
  int v24 = *(void **)(v23 + 160);
  *(void *)(v23 + 160) = 0;
}

void sub_24076E2BC(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1;
  id v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"Debug Information", v6, v7);
  uint64_t v13 = objc_msgSend_mutableCopy(v4, v9, v10, v11, v12);

  objc_msgSend_removeObjectForKey_(v13, v14, @"Debug Information", v15, v16);
  v17 = _IOHIDLogCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412546;
    id v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl(&dword_240766000, v17, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v8)
  {
    uint64_t v18 = _IOHIDLogCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_2407754FC((uint64_t)v3, (uint64_t)v8, v18);
    }
  }
}

uint64_t sub_2407701F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](a1, sel_valueAvailableCallback_, a2, a4, a5);
}

void sub_2407704EC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v9 = objc_msgSend_copyElements_psKey_(*(void **)(a1 + 32), v7, *(void *)(*(void *)(a1 + 32) + 120), (uint64_t)v5, v8);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v9;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v56;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = objc_msgSend_integerValue(v6, v16, v17, v18, v19);
          if ((objc_msgSend_isEqualToString_(v5, v21, @"Delayed Remove Power", v22, v23) & 1) != 0
            || objc_msgSend_isEqualToString_(v5, v24, @"Startup Delay", v25, v26))
          {
            objc_msgSend_setIntegerValue_(v15, v24, 60 * v20, v25, v26);
          }
          else
          {
            int isEqualToString = objc_msgSend_isEqualToString_(v5, v24, @"Enable Audible Alarm", v25, v26);
            uint64_t v38 = 1;
            if (v20) {
              uint64_t v38 = 2;
            }
            if (isEqualToString) {
              objc_msgSend_setIntegerValue_(v15, v35, v38, v36, v37);
            }
            else {
              objc_msgSend_setIntegerValue_(v15, v35, v20, v36, v37);
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_18;
          }
          objc_msgSend_setDataValue_(v15, v31, (uint64_t)v6, v32, v33);
        }
        uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 48);
        v40 = *(void (**)(uint64_t, uint64_t, void))(*(void *)v39 + 56);
        uint64_t v41 = objc_msgSend_elementRef(v15, v27, v28, v29, v30);
        v40(v39, v41, 0);
        uint64_t v42 = *(void *)(*(void *)(a1 + 32) + 48);
        long long v43 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v42 + 80);
        uint64_t v48 = objc_msgSend_elementRef(v15, v44, v45, v46, v47);
        uint64_t v53 = objc_msgSend_valueRef(v15, v49, v50, v51, v52);
        v43(v42, v48, v53, 0);
LABEL_18:
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v12);
  }
}

uint64_t sub_2407709D8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getProperties_, a2, a4, a5);
}

uint64_t sub_2407709E8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getCapabilities_, a2, a4, a5);
}

uint64_t sub_2407709F8(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getEvent_, a2, a4, a5);
}

uint64_t sub_240770A08(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setEventCallback_target_refcon_, a2, a3, a4);
}

uint64_t sub_240770A20(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_sendCommand_, a2, a4, a5);
}

uint64_t sub_240770A30(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_createAsyncEventSource_, a2, a4, a5);
}

void sub_240770BC4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 16);
}

void sub_240770C08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_2407717B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a2 + 20) == 53) {
    JUMPOUT(0x2455F7CF0);
  }
  return MEMORY[0x270F9A6D0](*(void *)(a4 + 80), sel_queueCallback_msg_size_info_, a1, a2, a3);
}

uint64_t sub_2407719F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](a1, sel_valueAvailableCallback_, a2, a4, a5);
}

void sub_240772A1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x2455F8130]();
  if (!objc_msgSend_isEqualToString_(v5, v8, @"UsageMin", v9, v10))
  {
    if (objc_msgSend_isEqualToString_(v5, v11, @"UsageMax", v12, v13))
    {
      objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v19, @"Usage", v20, v21);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v5, v19, @"ElementCookieMin", v20, v21))
      {
        objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v35, @"ElementCookie", v36, v37);
        goto LABEL_3;
      }
      int isEqualToString = objc_msgSend_isEqualToString_(v5, v35, @"ElementCookieMax", v36, v37);
      uint64_t v42 = *(void **)(a1 + 32);
      if (!isEqualToString)
      {
        uint64_t v14 = objc_msgSend_propertyForElementKey_(v42, v38, (uint64_t)v5, v39, v40);
        uint64_t v15 = 4;
        objc_msgSend_expressionForKeyPath_(MEMORY[0x263F087F0], v43, (uint64_t)v14, v44, v45);
        goto LABEL_7;
      }
      objc_msgSend_propertyForElementKey_(v42, v38, @"ElementCookie", v39, v40);
    uint64_t v14 = };
    uint64_t v15 = 1;
    objc_msgSend_expressionForKeyPath_(MEMORY[0x263F087F0], v22, (uint64_t)v14, v23, v24);
    goto LABEL_7;
  }
  objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v11, @"Usage", v12, v13);
  uint64_t v14 = LABEL_3:;
  uint64_t v15 = 3;
  objc_msgSend_expressionForKeyPath_(MEMORY[0x263F087F0], v16, (uint64_t)v14, v17, v18);
  uint64_t v25 = LABEL_7:;
  uint64_t v29 = objc_msgSend_expressionForConstantValue_(MEMORY[0x263F087F0], v26, (uint64_t)v6, v27, v28);
  long long v31 = objc_msgSend_predicateWithLeftExpression_rightExpression_modifier_type_options_(MEMORY[0x263F08720], v30, (uint64_t)v25, (uint64_t)v29, 0, v15, 0);
  objc_msgSend_filterUsingPredicate_(*(void **)(a1 + 40), v32, (uint64_t)v31, v33, v34);
}

void sub_240773674(unsigned int *a1, uint64_t a2, size_t __len, void *__src)
{
  if (a1)
  {
    id v5 = (void (*)(void, uint64_t, void, void, void, void, void))*((void *)a1 + 3);
    if (v5)
    {
      unsigned int v7 = __len;
      if (__src && *((void *)a1 + 5))
      {
        memmove(*((void **)a1 + 1), __src, __len);
        objc_msgSend_releaseReport_(*((void **)a1 + 5), v9, (uint64_t)__src, v10, v11);
        id v5 = (void (*)(void, uint64_t, void, void, void, void, void))*((void *)a1 + 3);
      }
      v5(*((void *)a1 + 4), a2, *((void *)a1 + 6), *a1, a1[4], *((void *)a1 + 1), v7);
      free(a1);
    }
  }
}

uint64_t sub_240773BFC(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_open_, a2, a4, a5);
}

uint64_t sub_240773C0C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_close_, a2, a4, a5);
}

uint64_t sub_240773C1C(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getProperty_property_, a2, a3, a5);
}

uint64_t sub_240773C30(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setProperty_property_, a2, a3, a5);
}

uint64_t sub_240773C44(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_240773C54(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_copyMatchingElements_elements_options_, a2, a3, a4);
}

uint64_t sub_240773C6C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_setValue_value_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7);
}

uint64_t sub_240773C90(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_getValue_value_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7);
}

uint64_t sub_240773CB4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setInputReportCallback_reportLength_callback_context_options_, a2, a3, a4);
}

uint64_t sub_240773CD4(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_240773D24(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_240773D74(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setInputReportWithTimeStampCallback_reportLength_callback_context_options_, a2, a3, a4);
}

uint64_t (*sub_240773F4C())()
{
  v0 = (void *)qword_268C8F6E0;
  if (!qword_268C8F6E0)
  {
    v0 = dlopen("/usr/lib/libRosetta.dylib", 2);
    qword_268C8F6E0 = (uint64_t)v0;
  }
  result = (uint64_t (*)())dlsym(v0, "rosetta_is_current_process_translated");
  off_26B9460F0 = result;
  if (result)
  {
    return (uint64_t (*)())result();
  }
  return result;
}

uint64_t sub_240773FBC(uint64_t a1)
{
  id v2 = (void *)qword_268C8F6E0;
  if (!qword_268C8F6E0)
  {
    id v2 = dlopen("/usr/lib/libRosetta.dylib", 2);
    qword_268C8F6E0 = (uint64_t)v2;
  }
  id v3 = (uint64_t (*)())dlsym(v2, "rosetta_convert_to_rosetta_absolute_time");
  off_26B9460F8 = v3;
  if (!v3) {
    return a1;
  }

  return ((uint64_t (*)(uint64_t))v3)(a1);
}

uint64_t sub_240774378(void *a1, uint64_t a2, int a3)
{
  id v4 = a1;
  if (v4)
  {
    if (a3 == -536870896)
    {
      id v5 = (void (*)(void, void, void, void *))v4[25];
      if (v5) {
        v5(v4[26], 0, v4[27], v4 + 22);
      }
    }
  }

  return MEMORY[0x270F9A758]();
}

void *sub_2407747F0(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unsigned int v7 = (uint64_t (*)(void, uint64_t, void, uint64_t, uint64_t))result[28];
  if (v7) {
    return (void *)v7(result[29], a2, result[30], a3, a7);
  }
  return result;
}

uint64_t sub_240774A5C(void ***a1, void *a2)
{
  if (!a2) {
    return 3758097090;
  }
  id v3 = **a1;
  id v4 = (const void *)v3[8];
  id v5 = v3;
  CFRetain(v4);
  uint64_t v6 = v5[8];

  uint64_t result = 0;
  *a2 = v6;
  return result;
}

uint64_t sub_240774AD4(uint64_t a1)
{
  return *(void *)(**(void **)a1 + 64);
}

uint64_t sub_240774AF0(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(**(void **)a1 + 48);
  return 0;
}

uint64_t sub_240774B14(uint64_t a1)
{
  return *(unsigned int *)(**(void **)a1 + 48);
}

uint64_t sub_240774B30(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_open_, a2, a4, a5);
}

uint64_t sub_240774B40(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_close_, 0, a4, a5);
}

uint64_t sub_240774B50(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setRemovalCallback_removalTarget_removalRefcon_, a2, a3, a4);
}

uint64_t sub_240774B68(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getElementValue_value_options_, a2, a3, 0);
}

uint64_t sub_240774B80(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setElementValue_value_, a2, a3, a5);
}

uint64_t sub_240774B94(void **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F9A6D0](**a1, sel_getElementValue_value_options_, a2, a3, 0x20000);
}

uint64_t sub_240774BAC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(*(void **)(**(void **)a1 + 80), a2, a3, a4, a5);
}

uint64_t sub_240774BC8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(*(void **)(**(void **)a1 + 80), a2, a3, a4, a5);
}

uint64_t sub_240774BE4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_allocQueue, a3, a4, a5);
}

uint64_t sub_240774BF0(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_allocOutputTransaction, a3, a4, a5);
}

uint64_t sub_240774BFC(void ***a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  int v7 = 0;
  return objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, 0, 0, v7);
}

uint64_t sub_240774C48(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6)
{
  uint64_t v10 = **a1;
  if (a5)
  {
    uint64_t v20 = *a5;
    id v12 = v10;
    int v18 = 0;
    uint64_t Report_reportID_report_reportLength_timeout_callback_context_options = objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_(v12, v13, a2, a3, a4, &v20, a6, 0, 0, v18);
    *a5 = v20;
  }
  else
  {
    uint64_t v20 = 0;
    id v15 = v10;
    int v19 = 0;
    uint64_t Report_reportID_report_reportLength_timeout_callback_context_options = objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_(v15, v16, a2, a3, a4, &v20, a6, 0, 0, v19);
  }

  return Report_reportID_report_reportLength_timeout_callback_context_options;
}

uint64_t sub_240774D14(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9A6D0](**a1, sel_copyMatchingElements_element_, a2, a3, a5);
}

uint64_t sub_240774D28(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](**a1, sel_setInterruptReportHandlerCallback_reportBufferSize_callback_callbackTarget_callbackRefcon_, a2, a3, a4);
}

void sub_240774DC4()
{
  sub_24076A660(*MEMORY[0x263EF8340]);
  sub_24076A628();
  sub_24076A640(&dword_240766000, v0, v1, "kIOHIDLibUserClientPostElementValues(%#llx):%#x\n", v2, v3);
}

void sub_240774E2C()
{
  sub_24076A660(*MEMORY[0x263EF8340]);
  sub_24076A628();
  sub_24076A640(&dword_240766000, v0, v1, "setValue(%#llx):%#x\n", v2, v3);
}

void sub_240774E94(_DWORD *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1 >> 8;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_240766000, a2, OS_LOG_TYPE_ERROR, "Unable to copy back value for element, unexpected size(%d)\n", (uint8_t *)v3, 8u);
}

void sub_240774F14(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_elementCookie(a2, (const char *)a2, a3, a4, a5);
  sub_24076A66C();
  sub_24076A684(&dword_240766000, v5, v6, "Unable to copy back value for element, unexpected cookie(%ld) expected:%d\n", v7, v8, v9, v10, v11);
}

void sub_240774F94()
{
  sub_24076A660(*MEMORY[0x263EF8340]);
  sub_24076A628();
  sub_24076A640(&dword_240766000, v0, v1, "kIOHIDLibUserClientUpdateElementValues(%#llx):%#x\n", v2, v3);
}

void sub_240774FFC()
{
  sub_24076A660(*MEMORY[0x263EF8340]);
  sub_24076A628();
  sub_24076A640(&dword_240766000, v0, v1, "getValue(%#llx):%#x\n", v2, v3);
}

void sub_240775064()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_240766000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Over Release IOHIDIUnknown Reference", v0, 2u);
}

void sub_2407750AC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "Unable to create queue analytics\n", v1, 2u);
}

void sub_2407750F0()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectGetService(kIOHIDEventServiceFastPathUserClientType): 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_240775158()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOServiceOpen(kIOHIDEventServiceFastPathUserClientType): 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_2407751C0()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOHIDEventServiceFastPathClass failed to retain service object with err %x\n", v2, v3, v4, v5, v6);
}

void sub_240775228(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "IOConnectMapMemory (sharedMemorySize:%d): 0x%x\n", (uint8_t *)v4, 0xEu);
}

void sub_2407752B4()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientOpen): 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_24077531C()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientClose): 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_240775384()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectSetCFProperty: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_2407753EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "No shared memory\n", v1, 2u);
}

void sub_240775430(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "Invalid argument (pEvent = null)\n", v1, 2u);
}

void sub_240775474(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientCopyEvent): 0x%x (copySpec = %@)\n", (uint8_t *)v3, 0x12u);
}

void sub_2407754FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_240766000, log, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_240775584()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "Invalid transaction", v2, v3, v4, v5, v6);
}

void sub_2407755B8()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to commit input element transaction with error %x", v2, v3, v4, v5, v6);
}

void sub_240775620()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to set transaction direction %x", v2, v3, v4, v5, v6);
}

void sub_240775688()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "deviceProperties not valid", v2, v3, v4, v5, v6);
}

void sub_2407756BC()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "Plugin not valid", v2, v3, v4, v5, v6);
}

void sub_2407756F0()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "Device not valid", v2, v3, v4, v5, v6);
}

void sub_240775724()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "Elements not valid", v2, v3, v4, v5, v6);
}

void sub_240775758()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "Queue not valid", v2, v3, v4, v5, v6);
}

void sub_24077578C()
{
  sub_240770C24();
  sub_240770C08(&dword_240766000, v0, v1, "Transaction not valid", v2, v3, v4, v5, v6);
}

void sub_2407757C0()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to get transaction interface with error %d", v2, v3, v4, v5, v6);
}

void sub_240775828()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to get queue interface with error %d", v2, v3, v4, v5, v6);
}

void sub_240775890()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to copy matching elements with error %x", v2, v3, v4, v5, v6);
}

void sub_2407758F8()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to open device with error %x", v2, v3, v4, v5, v6);
}

void sub_240775960()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to get device interface with error %d", v2, v3, v4, v5, v6);
}

void sub_2407759C8()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to create plugin interface with error %x", v2, v3, v4, v5, v6);
}

void sub_240775A30()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "Failed to query properties with error %x", v2, v3, v4, v5, v6);
}

void sub_240775A98()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectCallMethod(kIOHIDLibUserClientGetElements):%x\n", v2, v3, v4, v5, v6);
}

void sub_240775B00()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectCallScalarMethod(kIOHIDLibUserClientGetElementCount):%x\n", v2, v3, v4, v5, v6);
}

void sub_240775B68(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "Failed to create queue\n", v1, 2u);
}

void sub_240775BAC()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOServiceOpen failed: 0x%x\n", v2, v3, v4, v5, v6);
}

void sub_240775C14()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOHIDDeviceClass failed to retain service object with err %x\n", v2, v3, v4, v5, v6);
}

void sub_240775C7C()
{
  sub_24076CE48();
  sub_24076CE2C(&dword_240766000, v0, v1, "IOConnectCallMethod(kIOHIDLibUserClientOpen):%x\n", v2, v3, v4, v5, v6);
}

void sub_240775CE4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "Unsupported matching criteria: %@ %@\n", (uint8_t *)&v3, 0x16u);
}

void sub_240775D6C(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_240766000, log, OS_LOG_TYPE_ERROR, "kIOHIDLibUserClientPostElementValues(%llx):%x\n", (uint8_t *)&v4, 0x12u);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4AE8](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x270EE4AF0](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
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

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
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

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x270EF3EF0](object, options);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F18](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F20](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x270EF3F48](*(void *)&connect, service);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x270EF3F70](*(void *)&connect, propertyName, property);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x270EF3FD8]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x270EF3FE8](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x270EF3FF0](dataQueue);
}

void IODispatchCalloutFromMessage(void *unused, mach_msg_header_t *msg, void *reference)
{
}

uint64_t IOHIDAnalyticsEventActivate()
{
  return MEMORY[0x270EF4020]();
}

uint64_t IOHIDAnalyticsEventCancel()
{
  return MEMORY[0x270EF4028]();
}

uint64_t IOHIDAnalyticsHistogramEventCreate()
{
  return MEMORY[0x270EF4030]();
}

uint64_t IOHIDAnalyticsHistogramEventSetIntegerValue()
{
  return MEMORY[0x270EF4038]();
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x270EF4118](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x270EF4120](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x270EF4170](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x270EF4180](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x270EF4190](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x270EF4198](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A0](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x270EF41A8](element);
}

uint64_t IOHIDEventCreateWithBytesInternal()
{
  return MEMORY[0x270EF42F8]();
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x270EF4748](allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return (IOHIDValueRef)MEMORY[0x270EF4750](allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x270EF4758](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x270EF4760](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x270EF4768](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x270EF4770](value);
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x270EF4780](value);
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

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
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

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t _IOHIDElementCreateWithParentAndData()
{
  return MEMORY[0x270EF4B68]();
}

uint64_t _IOHIDElementGetLength()
{
  return MEMORY[0x270EF4B78]();
}

uint64_t _IOHIDElementSetDeviceInterface()
{
  return MEMORY[0x270EF4B88]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x270EF4BC8]();
}

uint64_t _IOHIDValueCopyToElementValueHeader()
{
  return MEMORY[0x270EF4BD8]();
}

uint64_t _IOHIDValueCreateWithElementValuePtr()
{
  return MEMORY[0x270EF4BE0]();
}

uint64_t _IOHIDValueCreateWithStruct()
{
  return MEMORY[0x270EF4BE8]();
}

uint64_t _IOHIDValueGetFlags()
{
  return MEMORY[0x270EF4BF0]();
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

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x270F9AAE8](str);
}