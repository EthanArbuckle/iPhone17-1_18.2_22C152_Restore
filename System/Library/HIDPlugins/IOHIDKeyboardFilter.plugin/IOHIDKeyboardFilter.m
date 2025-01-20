BOOL Key::isModifier(Key *this)
{
  int v1;
  unsigned int v2;

  v1 = *((_DWORD *)this + 1);
  if (v1 == 65281 || v1 == 255)
  {
    if (*(_DWORD *)this == 3) {
      return 1;
    }
  }
  else if (v1 == 7)
  {
    v2 = *(_DWORD *)this;
    if (*(_DWORD *)this >= 0xE0u) {
      return v2 < 0xE8;
    }
    if (v2 == 57) {
      return 1;
    }
  }
  return 0;
}

uint64_t Key::modifierMask(Key *this)
{
  uint64_t result = Key::isModifier(this);
  if (result)
  {
    int v3 = *((_DWORD *)this + 1);
    if (v3 == 65281 || v3 == 255)
    {
      return (*(_DWORD *)this == 3) << 9;
    }
    else if (v3 == 7 && (int v4 = *(_DWORD *)this - 224, v4 < 8))
    {
      return dword_2407AE770[v4];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2407A5318(uint64_t a1)
{
  qword_268C8F790 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

void sub_2407A5428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2407A54BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

IOHIDKeyboardFilter *IOHIDKeyboardFilterFactory(uint64_t a1, const void *a2)
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (!CFEqual(a2, v4)) {
    return 0;
  }
  v5 = (IOHIDKeyboardFilter *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 536, 0);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0x55u, 0x12u, 0x66u, 0x8Eu, 0xFFu, 0x47u, 0x4Eu, 0x70u, 0xB3u, 0x3Eu, 0xE1u, 0xFFu, 0xFAu, 0xEFu, 1u, 0xA8u);
  IOHIDKeyboardFilter::IOHIDKeyboardFilter(v5, v6);
  return v5;
}

uint64_t IOHIDKeyboardFilter::AddRef(IOHIDKeyboardFilter *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void *IOHIDKeyboardFilter::setEventCallback(void *result, void (*a2)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4), uint64_t a3, uint64_t a4)
{
  if (a2) {
    CFUUIDRef v4 = a2;
  }
  else {
    CFUUIDRef v4 = IOHIDKeyboardFilter::defaultEventCallback;
  }
  result[4] = v4;
  result[5] = a3;
  result[6] = a4;
  return result;
}

{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (a2) {
    CFUUIDRef v4 = a2;
  }
  else {
    CFUUIDRef v4 = IOHIDKeyboardFilter::defaultEventCallback;
  }
  result[4] = v4;
  result[5] = a3;
  result[6] = a4;
  return result;
}

void IOHIDKeyboardFilter::IOHIDKeyboardFilter(IOHIDKeyboardFilter *this, CFTypeRef cf)
{
  unint64_t v23 = *MEMORY[0x263EF8340];
  *(void *)this = &IOHIDKeyboardFilter::sIOHIDKeyboardFilterFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((void *)this + 2) = 1;
  *((void *)this + 3) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 8) = (char *)this + 72;
  *((void *)this + 12) = 0;
  *((void *)this + 11) = (char *)this + 96;
  *((void *)this + 15) = 0;
  *((void *)this + 14) = (char *)this + 120;
  *((void *)this + 18) = 0;
  *((void *)this + 22) = 0;
  *((void *)this + 23) = 0;
  *((void *)this + 20) = (char *)this + 168;
  *((void *)this + 21) = (char *)this + 176;
  *((void *)this + 26) = 0;
  *((void *)this + 29) = 0;
  *((void *)this + 32) = 0;
  *((void *)this + 44) = 0;
  *((_DWORD *)this + 90) = 0;
  *((void *)this + 35) = 0;
  *((void *)this + 36) = 0;
  *((void *)this + 37) = 0;
  *((void *)this + 38) = 0;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((void *)this + 50) = -4294967221;
  *((_DWORD *)this + 102) = 0;
  *((void *)this + 52) = 0;
  *((_DWORD *)this + 106) = 150;
  *((_DWORD *)this + 112) = 0;
  *((void *)this + 54) = 0;
  *((void *)this + 55) = 0;
  *((void *)this + 57) = *MEMORY[0x263F0EC58];
  *((void *)this + 58) = 0;
  *((_DWORD *)this + 122) = 0;
  *((void *)this + 59) = 0;
  *((void *)this + 60) = 0;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((void *)this + 66) = 0;
  *((void *)this + 17) = (char *)this + 144;
  *((void *)this + 25) = 0;
  *((void *)this + 24) = (char *)this + 200;
  *((void *)this + 28) = 0;
  *((void *)this + 27) = (char *)this + 224;
  *((void *)this + 10) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 4) = IOHIDKeyboardFilter::defaultEventCallback;
  *((unsigned char *)this + 56) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 19) = 0;
  *((void *)this + 31) = 0;
  *((void *)this + 30) = (char *)this + 248;
  *((void *)this + 34) = 0;
  *((void *)this + 33) = (char *)this + 272;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
  memset_pattern16((char *)this + 312, &unk_2407AE930, 0x28uLL);
  unint64_t v7 = 0x70000004FLL;
  char v8 = 0;
  uint64_t v9 = 0x70000004DLL;
  char v10 = 0;
  uint64_t v11 = 0x700000050;
  char v12 = 0;
  uint64_t v13 = 0x70000004ALL;
  char v14 = 0;
  uint64_t v15 = 0x700000051;
  char v16 = 0;
  uint64_t v17 = 0x70000004ELL;
  char v18 = 0;
  uint64_t v19 = 0x700000052;
  char v20 = 0;
  uint64_t v21 = 0x70000004BLL;
  char v22 = 0;
  unsigned int v5 = 1;
  CFUUIDRef v6 = &v5;
  CFUUIDRef v4 = sub_2407AC330((uint64_t **)this + 24, &v5, (uint64_t)&std::piecewise_construct, &v6);
  sub_2407AC5F0(v4 + 5, &v7, &v23);
}

void sub_2407A58D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_2407AC27C(v18, *(void **)(v10 + 272));
  sub_2407AC27C(v16, *(void **)(v10 + 248));
  sub_2407AC27C(v15, *(void **)(v10 + 224));
  sub_2407AC2D0(v14, *(void **)(v10 + 200));
  sub_2407AC2D0(a10, *(void **)(v10 + 176));
  sub_2407AC27C(v17, *(void **)(v10 + 144));
  sub_2407AC27C(v13, *(void **)(v10 + 120));
  sub_2407AC27C(v12, *(void **)(v10 + 96));
  sub_2407AC27C(v11, *(void **)(v10 + 72));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::defaultEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_2407ADA24(a4, v5);
  }
}

void IOHIDKeyboardFilter::~IOHIDKeyboardFilter(IOHIDKeyboardFilter *this)
{
  sub_2407AC27C((uint64_t)this + 264, *((void **)this + 34));
  sub_2407AC27C((uint64_t)this + 240, *((void **)this + 31));
  sub_2407AC27C((uint64_t)this + 216, *((void **)this + 28));
  sub_2407AC2D0((uint64_t)this + 192, *((void **)this + 25));
  sub_2407AC2D0((uint64_t)this + 168, *((void **)this + 22));
  sub_2407AC27C((uint64_t)this + 136, *((void **)this + 18));
  sub_2407AC27C((uint64_t)this + 112, *((void **)this + 15));
  sub_2407AC27C((uint64_t)this + 88, *((void **)this + 12));
  sub_2407AC27C((uint64_t)this + 64, *((void **)this + 9));
}

void sub_2407A5AF0(void *a1)
{
}

uint64_t IOHIDKeyboardFilter::QueryInterface(IOHIDKeyboardFilter *this, CFUUIDBytes a2, void **a3)
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

uint64_t IOHIDKeyboardFilter::AddRef(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDKeyboardFilter::Release(IOHIDKeyboardFilter *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDKeyboardFilter::~IOHIDKeyboardFilter(this);
    MEMORY[0x2455F9DD0]();
  }
  return v2;
}

void IOHIDKeyboardFilter::setEjectKeyProperty(IOHIDKeyboardFilter *this, unsigned int a2)
{
  CFAllocatorRef v3 = (void *)IOHIDServiceCopyProperty();
  CFUUIDRef v4 = (void *)IOHIDServiceCopyProperty();
  CFUUIDRef v5 = (void *)IOHIDServiceCopyProperty();
  if ([v3 unsignedIntValue] == 1
    && [v4 unsignedIntValue] == 6
    && [v5 unsignedIntValue] == 1452)
  {
    uint64_t v6 = IOHIDServiceCopyProperty();
    if (v6) {
      goto LABEL_10;
    }
    if (a2 - 195 < 7 || a2 < 0x1F || a2 - 40 <= 2) {
      IOHIDServiceSetProperty();
    }
  }
  uint64_t v6 = 0;
LABEL_10:
  id v7 = (id)v6;
}

void sub_2407A5DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setDoNotDisturbState(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (IOHIDKeyboardFilter *)*((void *)this + 17);
  if (v2 == (IOHIDKeyboardFilter *)((char *)this + 144))
  {
LABEL_9:
    CFBooleanRef v6 = (const __CFBoolean *)IOHIDServiceCopyProperty();
    if (v6)
    {
      CFBooleanRef v7 = v6;
      *((_DWORD *)this + 122) = CFBooleanGetValue(v6);
      CFRelease(v7);
    }
  }
  else
  {
    while (*((void *)v2 + 6) != 0x10000009BLL)
    {
      CFAllocatorRef v3 = (IOHIDKeyboardFilter *)*((void *)v2 + 1);
      if (v3)
      {
        do
        {
          CFUUIDRef v4 = v3;
          CFAllocatorRef v3 = *(IOHIDKeyboardFilter **)v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          CFUUIDRef v4 = (IOHIDKeyboardFilter *)*((void *)v2 + 2);
          BOOL v5 = *(void *)v4 == (void)v2;
          uint64_t v2 = v4;
        }
        while (!v5);
      }
      uint64_t v2 = v4;
      if (v4 == (IOHIDKeyboardFilter *)((char *)this + 144)) {
        goto LABEL_9;
      }
    }
    *((_DWORD *)this + 122) = 1;
  }
}

void IOHIDKeyboardFilter::open(IOHIDKeyboardFilter *this, __IOHIDService *a2)
{
  *((void *)this + 3) = a2;
  uint64_t v3 = IOHIDServiceCopyProperty();
  CFUUIDRef v4 = (void *)*((void *)this + 58);
  *((void *)this + 58) = v3;

  uint64_t v5 = IOHIDServiceCopyProperty();
  CFBooleanRef v6 = (void *)*((void *)this + 59);
  *((void *)this + 59) = v5;

  int valuePtr = 0;
  CFNumberRef v7 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (!v7)
  {
    int valuePtr = IOHIDKeyboardFilter::getKeyboardID(this);
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    if (!v8) {
      goto LABEL_5;
    }
    CFNumberRef v7 = v8;
    IOHIDServiceSetProperty();
  }
  CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
  CFRelease(v7);
LABEL_5:
  CFNumberRef v9 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v9)
  {
    CFNumberRef v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFNumberGetTypeID()) {
      CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)this + 292);
    }
    CFRelease(v10);
  }
  CFStringRef v12 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v12)
  {
    CFStringRef v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v13, (uint64_t)&v74);
      uint64_t v15 = (char *)this + 144;
      sub_2407AC27C((uint64_t)this + 136, *((void **)this + 18));
      uint64_t v16 = v75;
      *((void *)this + 17) = v74;
      *((void *)this + 18) = v16;
      uint64_t v17 = v76;
      *((void *)this + 19) = v76;
      if (v17)
      {
        v16[2] = v15;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0;
        uint64_t v76 = 0;
        uint64_t v16 = 0;
      }
      else
      {
        *((void *)this + 17) = v15;
      }
      sub_2407AC27C((uint64_t)&v74, v16);
    }
    CFRelease(v13);
  }
  CFStringRef v18 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v18)
  {
    CFStringRef v19 = v18;
    CFTypeID v20 = CFGetTypeID(v18);
    if (v20 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v19, (uint64_t)&v74);
      unsigned int v73 = 512;
      v78 = &v73;
      uint64_t v21 = sub_2407AC330((uint64_t **)this + 21, &v73, (uint64_t)&std::piecewise_construct, &v78);
      char v22 = v21 + 6;
      unint64_t v23 = v21 + 5;
      sub_2407AC27C((uint64_t)(v21 + 5), v21[6]);
      v24 = v75;
      *(v22 - 1) = v74;
      *char v22 = v24;
      uint64_t v25 = v76;
      v22[1] = v76;
      if (v25)
      {
        v24[2] = v22;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0;
        uint64_t v76 = 0;
        v24 = 0;
      }
      else
      {
        *unint64_t v23 = v22;
      }
      sub_2407AC27C((uint64_t)&v74, v24);
      LODWORD(v78) = 512;
      unint64_t v74 = (unint64_t)&v78;
      v26 = sub_2407AC330((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74)[5];
      LODWORD(v78) = 512;
      unint64_t v74 = (unint64_t)&v78;
      if (v26 != (uint64_t *)(sub_2407AC330((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74)+ 6))
      {
        do
        {
          v27 = (uint64_t *)v26[1];
          v28 = v26;
          if (v27)
          {
            do
            {
              v29 = (uint64_t **)v27;
              v27 = (uint64_t *)*v27;
            }
            while (v27);
          }
          else
          {
            do
            {
              v29 = (uint64_t **)v28[2];
              BOOL v30 = *v29 == v28;
              v28 = (uint64_t *)v29;
            }
            while (!v30);
          }
          if (*((_DWORD *)v26 + 9) == 7 && (*((_DWORD *)v26 + 8) - 79) <= 3)
          {
            LODWORD(v78) = 512;
            unint64_t v74 = (unint64_t)&v78;
            v32 = sub_2407AC330((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74);
            sub_2407AC978(v32 + 5, v26);
            operator delete(v26);
          }
          LODWORD(v78) = 512;
          unint64_t v74 = (unint64_t)&v78;
          v26 = (uint64_t *)v29;
        }
        while (v29 != sub_2407AC330((uint64_t **)this + 21, (unsigned int *)&v78, (uint64_t)&std::piecewise_construct, (_DWORD **)&v74)+ 6);
      }
    }
    CFRelease(v19);
  }
  CFStringRef v33 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v33)
  {
    CFStringRef v34 = v33;
    CFTypeID v35 = CFGetTypeID(v33);
    if (v35 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v34, (uint64_t)&v74);
      unsigned int v73 = 1;
      v78 = &v73;
      v36 = sub_2407AC330((uint64_t **)this + 24, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v37 = v36 + 6;
      v38 = v36 + 5;
      sub_2407AC27C((uint64_t)(v36 + 5), v36[6]);
      v39 = v75;
      *(v37 - 1) = v74;
      void *v37 = v39;
      uint64_t v40 = v76;
      v37[1] = v76;
      if (v40)
      {
        v39[2] = v37;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0;
        uint64_t v76 = 0;
        v39 = 0;
      }
      else
      {
        void *v38 = v37;
      }
      sub_2407AC27C((uint64_t)&v74, v39);
    }
    CFRelease(v34);
  }
  CFStringRef v41 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v41)
  {
    CFStringRef v42 = v41;
    CFTypeID v43 = CFGetTypeID(v41);
    if (v43 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v42, (uint64_t)&v74);
      v44 = (char *)this + 248;
      sub_2407AC27C((uint64_t)this + 240, *((void **)this + 31));
      v45 = v75;
      *((void *)this + 30) = v74;
      *((void *)this + 31) = v45;
      uint64_t v46 = v76;
      *((void *)this + 32) = v76;
      if (v46)
      {
        v45[2] = v44;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0;
        uint64_t v76 = 0;
        v45 = 0;
      }
      else
      {
        *((void *)this + 30) = v44;
      }
      sub_2407AC27C((uint64_t)&v74, v45);
    }
    CFRelease(v42);
  }
  IOHIDKeyboardFilter::setDoNotDisturbState(this);
  CFBooleanRef v47 = (const __CFBoolean *)IOHIDPreferencesCopyDomain();
  if (v47)
  {
    CFBooleanRef v48 = v47;
    v49 = (int *)((char *)this + 452);
    *((_DWORD *)this + 113) = CFBooleanGetValue(v47);
    CFRelease(v48);
  }
  else
  {
    v49 = (int *)((char *)this + 452);
    *((_DWORD *)this + 113) = 1;
  }
  CFBooleanRef v50 = (const __CFBoolean *)IOHIDServiceCopyProperty();
  CFBooleanRef v51 = v50;
  if (*((_DWORD *)this + 113))
  {
    if (v50) {
      int Value = CFBooleanGetValue(v50);
    }
    else {
      int Value = 1;
    }
    int *v49 = Value;
  }
  if (v51) {
    CFRelease(v51);
  }
  CFDictionaryRef v53 = (const __CFDictionary *)IOHIDServiceCopyProperty();
  if (v53)
  {
    CFDictionaryRef v54 = v53;
    CFBooleanRef v55 = (const __CFBoolean *)CFDictionaryGetValue(v53, @"HIDCapsLockStateCache");
    if (v55) {
      LODWORD(v55) = CFBooleanGetValue(v55);
    }
    *((_DWORD *)this + 110) = v55;
    *((_DWORD *)this + 111) = v55;
    CFBooleanRef v56 = (const __CFBoolean *)CFDictionaryGetValue(v54, @"HIDCapsLockLEDInhibit");
    if (v56) {
      LODWORD(v56) = CFBooleanGetValue(v56);
    }
    v57 = (void *)MEMORY[0x263F0EC58];
    *((_DWORD *)this + 112) = v56;
    *((void *)this + 57) = *v57;
    v58 = CFDictionaryGetValue(v54, (const void *)*MEMORY[0x263F0EC50]);
    if (v58)
    {
      v59 = v58;
      uint64_t v60 = *MEMORY[0x263F0EC70];
      if (CFEqual(v58, (CFTypeRef)*MEMORY[0x263F0EC70])
        || (uint64_t v60 = *MEMORY[0x263F0EC68], CFEqual(v59, (CFTypeRef)*MEMORY[0x263F0EC68]))
        || (uint64_t v60 = *MEMORY[0x263F0EC60], CFEqual(v59, (CFTypeRef)*MEMORY[0x263F0EC60])))
      {
        *((void *)this + 57) = v60;
      }
    }
    CFArrayRef v61 = (const __CFArray *)CFDictionaryGetValue(v54, @"HIDKeyboardModifierMappingPairs");
    if (v61)
    {
      CFArrayRef v62 = v61;
      CFTypeID v63 = CFGetTypeID(v61);
      if (v63 == CFArrayGetTypeID())
      {
        IOHIDKeyboardFilter::createMapFromArrayOfPairs(v62, (uint64_t)&v74);
        v64 = (char *)this + 120;
        sub_2407AC27C((uint64_t)this + 112, *((void **)this + 15));
        v65 = v75;
        *((void *)this + 14) = v74;
        *((void *)this + 15) = v65;
        uint64_t v66 = v76;
        *((void *)this + 16) = v76;
        if (v66)
        {
          v65[2] = v64;
          unint64_t v74 = (unint64_t)&v75;
          v75 = 0;
          uint64_t v76 = 0;
          v65 = 0;
        }
        else
        {
          *((void *)this + 14) = v64;
        }
        sub_2407AC27C((uint64_t)&v74, v65);
      }
    }
    CFNumberRef v67 = (const __CFNumber *)CFDictionaryGetValue(v54, @"HIDSlowKeysDelay");
    if (v67) {
      CFNumberGetValue(v67, kCFNumberSInt32Type, (char *)this + 304);
    }
    CFNumberRef v68 = (const __CFNumber *)CFDictionaryGetValue(v54, @"HIDInitialKeyRepeat");
    if (v68)
    {
      unint64_t v74 = 0;
      CFNumberGetValue(v68, kCFNumberSInt64Type, &v74);
      *((void *)this + 47) = v74 / 0xF4240;
    }
    CFNumberRef v69 = (const __CFNumber *)CFDictionaryGetValue(v54, @"HIDKeyRepeat");
    if (v69)
    {
      unint64_t v74 = 0;
      CFNumberGetValue(v69, kCFNumberSInt64Type, &v74);
      *((void *)this + 48) = v74 / 0xF4240;
    }
    CFNumberRef v70 = (const __CFNumber *)CFDictionaryGetValue(v54, @"CapsLockDelay");
    if (v70) {
      CFNumberGetValue(v70, kCFNumberSInt32Type, (char *)this + 400);
    }
    CFNumberRef v71 = (const __CFNumber *)CFDictionaryGetValue(v54, @"CapsLockDelayOverride");
    if (v71) {
      CFNumberGetValue(v71, kCFNumberSInt32Type, (char *)this + 404);
    }
    CFNumberRef v72 = (const __CFNumber *)CFDictionaryGetValue(v54, @"LockKeyDelay");
    if (v72) {
      CFNumberGetValue(v72, kCFNumberSInt32Type, (char *)this + 424);
    }
    CFRelease(v54);
  }
}

void sub_2407A6680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t IOHIDKeyboardFilter::getKeyboardID(IOHIDKeyboardFilter *this)
{
  unsigned int valuePtr = 3;
  CFNumberRef v1 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v1 && (v2 = v1, CFTypeID v3 = CFGetTypeID(v1), v3 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }
  else
  {
    unsigned __int16 v13 = -1;
    unsigned __int16 v12 = -1;
    CFNumberRef v5 = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt16Type, &v13);
        CFRelease(v6);
      }
    }
    CFNumberRef TypeID = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (TypeID
      && (CFNumberRef v9 = TypeID,
          CFTypeID v10 = CFGetTypeID(TypeID),
          CFNumberRef TypeID = (const __CFNumber *)CFNumberGetTypeID(),
          (const __CFNumber *)v10 == TypeID))
    {
      CFNumberGetValue(v9, kCFNumberSInt16Type, &v12);
      CFRelease(v9);
      int v11 = v12;
    }
    else
    {
      int v11 = 0xFFFF;
    }
    return IOHIDKeyboardFilter::getKeyboardID(TypeID, v13, v11);
  }
}

void IOHIDKeyboardFilter::createMapFromStringMap(CFStringRef theString@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)a2 = a2 + 8;
  if (theString)
  {
    CStringPtr = (char *)CFStringGetCStringPtr(theString, 0);
    if (CStringPtr)
    {
      *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22[8] = v5;
      v22[9] = v5;
      v22[6] = v5;
      v22[7] = v5;
      v22[4] = v5;
      v22[5] = v5;
      v22[2] = v5;
      v22[3] = v5;
      v22[0] = v5;
      v22[1] = v5;
      *(_OWORD *)CFTypeID v20 = v5;
      long long v21 = v5;
      long long v18 = v5;
      long long v19 = v5;
      long long v16 = v5;
      long long v17 = v5;
      long long v15 = v5;
      sub_2407AC120(&__p, CStringPtr);
      sub_2407AA4D8((uint64_t *)&v15, &__p, 8);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      memset(&v14, 0, sizeof(v14));
      memset(&__str, 0, sizeof(__str));
      while (1)
      {
        CFNumberRef v6 = sub_2407AA65C(&v15, (uint64_t)&v14, 0x2Cu);
        if ((*((unsigned char *)v6 + *(void *)(*v6 - 24) + 32) & 5) != 0) {
          break;
        }
        CFTypeID v7 = sub_2407AA65C(&v15, (uint64_t)&__str, 0x2Cu);
        if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) != 0) {
          break;
        }
        unint64_t v8 = std::stoul(&__str, 0, 0);
        if (v8)
        {
          unint64_t v9 = std::stoul(&v14, 0, 0);
          LODWORD(__p.__r_.__value_.__l.__data_) = (unsigned __int16)v9;
          HIDWORD(__p.__r_.__value_.__r.__words[0]) = v9 >> 16;
          __p.__r_.__value_.__s.__data_[8] = 0;
          *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 1) = -1431655766;
          HIDWORD(__p.__r_.__value_.__r.__words[1]) = -1431655766;
          LODWORD(__p.__r_.__value_.__r.__words[2]) = (unsigned __int16)v8;
          HIDWORD(__p.__r_.__value_.__r.__words[2]) = v8 >> 16;
          char v11 = 0;
          memset(v12, 170, sizeof(v12));
          sub_2407AC850((uint64_t **)a2, (unint64_t *)&__p, &__p);
        }
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      *(void *)&long long v15 = *MEMORY[0x263F8C2C0];
      *(void *)((char *)&v15 + *(void *)(v15 - 24)) = *(void *)(MEMORY[0x263F8C2C0] + 24);
      *(void *)&long long v16 = MEMORY[0x263F8C318] + 16;
      if (SBYTE7(v21) < 0) {
        operator delete(v20[0]);
      }
      std::streambuf::~streambuf();
      std::istream::~istream();
      MEMORY[0x2455F9DA0]((char *)v22 + 8);
    }
  }
}

void sub_2407A6A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_2407AC27C(v28, *(void **)(v28 + 8));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::createMapFromArrayOfPairs(CFArrayRef theArray@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)a2 = a2 + 8;
  if (theArray && CFArrayGetCount(theArray))
  {
    for (CFIndex i = 0; i < CFArrayGetCount(theArray); ++i)
    {
      uint64_t v14 = 0;
      uint64_t valuePtr = 0;
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
      CFDictionaryRef v7 = ValueAtIndex;
      if (ValueAtIndex)
      {
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID())
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"HIDKeyboardModifierMappingSrc");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
            CFNumberRef v10 = (const __CFNumber *)CFDictionaryGetValue(v7, @"HIDKeyboardModifierMappingDst");
            if (v10)
            {
              CFNumberGetValue(v10, kCFNumberSInt64Type, &v14);
              *(void *)&long long v11 = valuePtr;
              BYTE8(v11) = 0;
              uint64_t v12 = v14;
              char v13 = 0;
              sub_2407AC850((uint64_t **)a2, (unint64_t *)&v11, &v11);
            }
          }
        }
      }
    }
  }
}

void sub_2407A6C00(_Unwind_Exception *a1)
{
  sub_2407AC27C(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::scheduleWithDispatchQueue(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 496), a2);
  long long v5 = [[StickyKeyHandler alloc] initWithFilter:a1 service:*(void *)(a1 + 24)];
  CFNumberRef v6 = *(void **)(a1 + 480);
  *(void *)(a1 + 480) = v5;

  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  CFTypeID v8 = *(void **)(a1 + 504);
  *(void *)(a1 + 504) = v7;

  unint64_t v9 = *(NSObject **)(a1 + 504);
  if (v9)
  {
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_2407A70C0;
    handler[3] = &unk_2650D5FC8;
    handler[4] = a1;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 504));
  }
  dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  long long v11 = *(void **)(a1 + 512);
  *(void *)(a1 + 512) = v10;

  uint64_t v12 = *(NSObject **)(a1 + 512);
  if (v12)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2407A70F8;
    v30[3] = &unk_2650D5FC8;
    v30[4] = a1;
    dispatch_source_set_event_handler(v12, v30);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 512));
  }
  dispatch_source_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  uint64_t v14 = *(void **)(a1 + 520);
  *(void *)(a1 + 520) = v13;

  long long v15 = *(NSObject **)(a1 + 520);
  if (v15)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_2407A71C8;
    v29[3] = &unk_2650D5FC8;
    v29[4] = a1;
    dispatch_source_set_event_handler(v15, v29);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 520), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 520));
  }
  dispatch_source_t v16 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  long long v17 = *(void **)(a1 + 528);
  *(void *)(a1 + 528) = v16;

  long long v18 = *(NSObject **)(a1 + 528);
  if (v18)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_2407A7284;
    v28[3] = &unk_2650D5FC8;
    v28[4] = a1;
    dispatch_source_set_event_handler(v18, v28);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 528), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 528));
  }
  dispatch_source_t v19 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 496));
  CFTypeID v20 = *(void **)(a1 + 432);
  *(void *)(a1 + 432) = v19;

  long long v21 = *(NSObject **)(a1 + 432);
  if (v21)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2407A732C;
    v27[3] = &unk_2650D5FC8;
    v27[4] = a1;
    dispatch_source_set_event_handler(v21, v27);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 432), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume(*(dispatch_object_t *)(a1 + 432));
  }
  if ([*(id *)(a1 + 464) BOOLValue])
  {
    char v22 = +[AppleKeyboardStateManager sharedManager];
    int v23 = [v22 isCapsLockEnabled:*(void *)(a1 + 472)];

    if (v23)
    {
      v24 = _IOHIDLogCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t RegistryID = *(void *)(a1 + 24);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = RegistryID;
        _os_log_impl(&dword_2407A4000, v24, OS_LOG_TYPE_INFO, "[%@] Restoring capslock state\n", buf, 0xCu);
      }

      mach_absolute_time();
      KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
      if (KeyboardEvent)
      {
        (*(void (**)(void, void, uint64_t, const void *, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), a1, KeyboardEvent, 0);
        CFRelease(KeyboardEvent);
      }
    }
  }
}

void sub_2407A7088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2407A70C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_set_timer(*(dispatch_source_t *)(v1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  *(_DWORD *)(v1 + 308) = 0;
}

void sub_2407A70F8(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[64], 0xFFFFFFFFFFFFFFFFLL, 0, 0);

  IOHIDKeyboardFilter::dispatchSlowKey((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchSlowKey(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 37);
  *((void *)this + 37) = 0;
  if (v1)
  {
    mach_absolute_time();
    IOHIDEventSetTimeStamp();
    IOHIDEventSetIntegerValue();
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void sub_2407A71C8(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[65], 0xFFFFFFFFFFFFFFFFLL, 0, 0);

  IOHIDKeyboardFilter::dispatchKeyRepeat((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchKeyRepeat(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 46);
  *((void *)this + 46) = 0;
  if (v1)
  {
    mach_absolute_time();
    IOHIDEventSetTimeStamp();
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void sub_2407A7284(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[66], 0xFFFFFFFFFFFFFFFFLL, 0, 0);

  IOHIDKeyboardFilter::dispatchCapsLock((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchCapsLock(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 49);
  *((void *)this + 49) = 0;
  if (v1)
  {
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void sub_2407A732C(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[54], 0xFFFFFFFFFFFFFFFFLL, 0, 0);

  IOHIDKeyboardFilter::dispatchLockKey((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchLockKey(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 52);
  *((void *)this + 52) = 0;
  if (v1)
  {
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, v1, 0);
    CFRelease(v1);
  }
}

void IOHIDKeyboardFilter::unscheduleFromDispatchQueue(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 504);
  if (v4) {
    dispatch_source_cancel(v4);
  }
  long long v5 = *(NSObject **)(a1 + 512);
  if (v5) {
    dispatch_source_cancel(v5);
  }
  CFNumberRef v6 = *(NSObject **)(a1 + 520);
  if (v6) {
    dispatch_source_cancel(v6);
  }
  dispatch_source_t v7 = *(NSObject **)(a1 + 528);
  if (v7) {
    dispatch_source_cancel(v7);
  }
  CFTypeID v8 = *(NSObject **)(a1 + 432);
  if (v8) {
    dispatch_source_cancel(v8);
  }
  [*(id *)(a1 + 480) removeObserver];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  CFTypeRef v12 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFTypeRef v12 = CFRetain(*(CFTypeRef *)(a1 + 24));
  unint64_t v9 = *(NSObject **)(a1 + 496);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_2407A74F0;
  v10[3] = &unk_2650D5FF0;
  v10[4] = v11;
  v10[5] = a1;
  dispatch_async(v9, v10);
  _Block_object_dispose(v11, 8);
}

void sub_2407A74DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2407A74F0(uint64_t a1)
{
  CFNumberRef v2 = *(IOHIDKeyboardFilter **)(a1 + 40);
  IOHIDKeyboardFilter::dispatchStickyKeys(v2, 14);
  id v3 = (const void *)*((void *)v2 + 37);
  if (v3)
  {
    CFRelease(v3);
    *((void *)v2 + 37) = 0;
  }
  id v4 = (const void *)*((void *)v2 + 49);
  if (v4)
  {
    CFRelease(v4);
    *((void *)v2 + 49) = 0;
  }
  long long v5 = (const void *)*((void *)v2 + 52);
  if (v5)
  {
    CFRelease(v5);
    *((void *)v2 + 52) = 0;
  }
  CFNumberRef v6 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  CFRelease(v6);
}

void IOHIDKeyboardFilter::stopStickyKey(IOHIDKeyboardFilter *this)
{
}

CFTypeRef IOHIDKeyboardFilter::copyPropertyForClient(IOHIDKeyboardFilter *this, CFTypeRef cf1, const void *a3)
{
  if (CFEqual(cf1, @"HIDCapsLockState"))
  {
    uint64_t v5 = MEMORY[0x263EFFB40];
    int v6 = *((_DWORD *)this + 110);
  }
  else
  {
    if (CFEqual(cf1, @"ServiceFilterDebug"))
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
      CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      sub_2407ABCE8(&v10, 0);
      if (cf)
      {
        IOHIDKeyboardFilter::serialize(this, (__CFDictionary *)cf);
        CFTypeRef v8 = CFRetain(cf);
      }
      else
      {
        CFTypeRef v8 = 0;
      }
      sub_2407ABE0C(&v10);
      return v8;
    }
    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F0EC50]))
    {
      uint64_t v5 = MEMORY[0x263F0EC70];
      int v6 = *((_DWORD *)this + 111);
      uint64_t v7 = MEMORY[0x263F0EC68];
      goto LABEL_4;
    }
    if (CFEqual(cf1, @"HIDStickyKeysOn"))
    {
      sub_2407ACD70(&v10, *((_DWORD *)this + 89));
      CFTypeRef v8 = cf;
      sub_2407ABE5C(&v10);
      return v8;
    }
    if (CFEqual(cf1, @"UnifiedKeyMapping"))
    {
      uint64_t v5 = MEMORY[0x263EFFB40];
      int v6 = *((unsigned __int8 *)this + 56);
    }
    else
    {
      if (!CFEqual(cf1, @"HIDKeyboardSupportsDoNotDisturbKey")) {
        return 0;
      }
      uint64_t v5 = MEMORY[0x263EFFB40];
      int v6 = *((_DWORD *)this + 122);
    }
  }
  uint64_t v7 = MEMORY[0x263EFFB38];
LABEL_4:
  if (!v6) {
    uint64_t v5 = v7;
  }
  return *(CFTypeRef *)v5;
}

void sub_2407A7704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDKeyboardFilter::serialize(IOHIDKeyboardFilter *this, __CFDictionary *a2)
{
  uint64_t v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_2407AC084(&v7, a2, 0);
  uint64_t v7 = &unk_26F4E64F8;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDKeyboardFilter");
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 136, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"FnFunctionUsageMap", value);
  }
  sub_2407AC034(&v5);
  id v3 = (const void **)MEMORY[0x263EFFB40];
  if (!*((unsigned char *)this + 56)) {
    id v3 = (const void **)MEMORY[0x263EFFB38];
  }
  if (*v3) {
    CFDictionarySetValue(theDict, @"UnifiedKeyMapping", *v3);
  }
  IOHIDKeyboardFilter::serializeModifierMappings((uint64_t)this + 192, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"UnifiedKeyMaps", value);
  }
  sub_2407AC034(&v5);
  IOHIDKeyboardFilter::serializeModifierMappings((uint64_t)this + 168, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"LegacyKeyMaps", value);
  }
  sub_2407AC034(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 112, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"HIDKeyboardModifierMappingPairs", value);
  }
  sub_2407AC034(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 240, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"NumLockKeyboardUsageMap", value);
  }
  sub_2407AC034(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 264, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"UserKeyMapping", value);
  }
  sub_2407AC034(&v5);
  sub_2407AB8CC((uint64_t)&v7, @"HIDInitialKeyRepeat", *((void *)this + 47));
  sub_2407AB8CC((uint64_t)&v7, @"HIDKeyRepeat", *((void *)this + 48));
  sub_2407AB8CC((uint64_t)&v7, @"LockKeyDelay", *((unsigned int *)this + 106));
  sub_2407AB8CC((uint64_t)&v7, @"CapsLockState", *((int *)this + 110));
  sub_2407AB8CC((uint64_t)&v7, @"CapsLockLEDState", *((int *)this + 111));
  sub_2407AB8CC((uint64_t)&v7, @"MatchScore", *((int *)this + 5));
  sub_2407AB8CC((uint64_t)&v7, @"FnKeyMode", *((unsigned int *)this + 72));
  return sub_2407ABE0C(&v7);
}

void sub_2407A7978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

uint64_t IOHIDKeyboardFilter::hasTCCPermissions()
{
  return IOHIDAccessCheckAuditToken();
}

uint64_t IOHIDKeyboardFilter::allowRemapping(IOHIDKeyboardFilter *this, const void *a2, const void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 1;
  }
  if (!_IOHIDIsRestrictedRemappingProperty()) {
    return 1;
  }
  if (IOHIDEventSystemConnectionHasEntitlement()) {
    return 1;
  }
  *(void *)&long long v3 = -1;
  *((void *)&v3 + 1) = -1;
  v7[0] = v3;
  v7[1] = v3;
  IOHIDEventSystemConnectionGetAuditToken();
  if (IOHIDAccessCheckAuditToken()) {
    return 1;
  }
  uint64_t v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t UUID = IOHIDEventSystemConnectionGetUUID();
    sub_2407ADA9C(UUID, (uint64_t)v7);
  }

  return 0;
}

void sub_2407A7AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setPropertyForClient(IOHIDKeyboardFilter *this, const __CFString *a2, const __CFBoolean *a3, __CFString *a4)
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  if (a3) {
    CFBooleanRef v4 = a3;
  }
  else {
    CFBooleanRef v4 = (const __CFBoolean *)*MEMORY[0x263EFFB38];
  }
  if (!a2) {
    return;
  }
  CFBooleanRef v6 = a3;
  int v9 = *((_DWORD *)this + 89);
  int v10 = *((_DWORD *)this + 90);
  long long v11 = _IOHIDLogCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = RegistryID;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 2112;
    CFBooleanRef v71 = v6;
    __int16 v72 = 2112;
    unsigned int v73 = a4;
    _os_log_debug_impl(&dword_2407A4000, v11, OS_LOG_TYPE_DEBUG, "[%@] IOHIDKeyboardFilter::setPropertyForClient: %@  %@  %@\n", buf, 0x2Au);
  }

  CFTypeRef v12 = (_DWORD *)((char *)this + 360);
  if (CFEqual(a2, @"HIDStickyKeysDisabled"))
  {
    if (v6) {
      int v10 = CFBooleanGetValue(v6) != 0;
    }
    else {
      int v10 = 0;
    }
    uint64_t v14 = _IOHIDLogCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407ADB1C();
    }
    goto LABEL_57;
  }
  if (CFEqual(a2, @"HIDStickyKeysOn"))
  {
    if (v6) {
      int v9 = CFBooleanGetValue(v6) != 0;
    }
    else {
      int v9 = 0;
    }
    goto LABEL_58;
  }
  if (CFEqual(a2, @"HIDStickyKeysShiftToggles"))
  {
    if (v6) {
      BOOL v16 = CFBooleanGetValue(v6) != 0;
    }
    else {
      BOOL v16 = 0;
    }
    *((_DWORD *)this + 88) = v16;
    *((_DWORD *)this + 77) = 0;
    uint64_t v14 = _IOHIDLogCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407ADB54();
    }
    goto LABEL_57;
  }
  if (CFEqual(a2, @"HIDInitialKeyRepeat"))
  {
    if (!v6) {
      goto LABEL_58;
    }
    valuePtr[0] = 0;
    CFNumberGetValue(v6, kCFNumberSInt64Type, valuePtr);
    *((void *)this + 47) = (unint64_t)valuePtr[0] / 0xF4240;
    long long v17 = _IOHIDLogCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *((void *)this + 3);
      if (v18) {
        uint64_t v18 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADB8C(v18, (uint64_t)this + 376, (uint64_t)buf);
    }
    goto LABEL_41;
  }
  if (CFEqual(a2, @"HIDKeyRepeat"))
  {
    if (!v6) {
      goto LABEL_58;
    }
    valuePtr[0] = 0;
    CFNumberGetValue(v6, kCFNumberSInt64Type, valuePtr);
    *((void *)this + 48) = (unint64_t)valuePtr[0] / 0xF4240;
    long long v17 = _IOHIDLogCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *((void *)this + 3);
      if (v20) {
        uint64_t v20 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADBCC(v20, (uint64_t)this + 384, (uint64_t)buf);
    }
LABEL_41:

    goto LABEL_58;
  }
  if (CFEqual(a2, @"HIDCapsLockState"))
  {
    if (v6)
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      LODWORD(v6) = TypeID == CFGetTypeID(v6) && CFBooleanGetValue(v6) != 0;
    }
    if (a4) {
      v29 = a4;
    }
    else {
      v29 = @"HIDCapsLockState";
    }
    IOHIDKeyboardFilter::setCapsLockState(this, (int)v6, v29);
    BOOL v30 = _IOHIDLogCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = *((void *)this + 3);
      if (v31) {
        uint64_t v31 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADC0C(v31, (uint64_t)buf, (int)v6);
    }

    goto LABEL_58;
  }
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x263F0EC50]))
  {
    if (v6)
    {
      *((void *)this + 57) = *MEMORY[0x263F0EC58];
      uint64_t v13 = *MEMORY[0x263F0EC70];
      if (CFEqual(v6, (CFTypeRef)*MEMORY[0x263F0EC70])
        || (uint64_t v13 = *MEMORY[0x263F0EC68], CFEqual(v6, (CFTypeRef)*MEMORY[0x263F0EC68]))
        || (uint64_t v13 = *MEMORY[0x263F0EC60], CFEqual(v6, (CFTypeRef)*MEMORY[0x263F0EC60])))
      {
        *((void *)this + 57) = v13;
      }
      IOHIDKeyboardFilter::updateCapslockLED(this, a4);
    }
    uint64_t v14 = _IOHIDLogCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *((void *)this + 3);
      if (v15) {
        uint64_t v15 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADE78(v15, (uint64_t)this, (uint64_t)buf, v14);
    }
LABEL_57:

    goto LABEL_58;
  }
  if (CFEqual(a2, @"HIDCapsLockLEDInhibit"))
  {
    *((_DWORD *)this + 112) = CFBooleanGetValue(v4);
    IOHIDKeyboardFilter::updateCapslockLED(this, a4);
    uint64_t v14 = _IOHIDLogCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407ADC48();
    }
    goto LABEL_57;
  }
  if (CFEqual(a2, @"HIDCapsLockLEDDarkWakeInhibit"))
  {
    *((_DWORD *)this + 113) = CFBooleanGetValue(v4);
    uint64_t v14 = _IOHIDLogCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407ADC80();
    }
    goto LABEL_57;
  }
  if (CFEqual(a2, @"HIDKeyboardModifierMappingPairs"))
  {
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v32 = CFGetTypeID(v6);
    uint64_t v33 = (IOHIDKeyboardFilter *)CFArrayGetTypeID();
    if ((IOHIDKeyboardFilter *)v32 != v33) {
      goto LABEL_58;
    }
    if (!IOHIDKeyboardFilter::allowRemapping(v33, v6, a4)) {
      return;
    }
    memset(buf, 170, sizeof(buf));
    IOHIDKeyboardFilter::createMapFromArrayOfPairs(v6, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState(this);
    sub_2407ACE24(v67, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v67);
    sub_2407AC27C((uint64_t)v67, (void *)v67[1]);
    if ((uint8_t *)((char *)this + 112) != buf) {
      sub_2407AD140((uint64_t **)this + 14, *(void **)buf, &buf[8]);
    }
    uint64_t v34 = (void *)*((void *)this + 15);
    if (v34)
    {
      CFTypeID v35 = (void *)((char *)this + 120);
      do
      {
        unint64_t v36 = v34[4];
        BOOL v37 = v36 >= 0x700000039;
        if (v36 >= 0x700000039) {
          v38 = v34;
        }
        else {
          v38 = v34 + 1;
        }
        if (v37) {
          CFTypeID v35 = v34;
        }
        uint64_t v34 = (void *)*v38;
      }
      while (*v38);
      if (v35 != (void *)((char *)this + 120) && v35[4] < 0x70000003AuLL)
      {
        if (a4) {
          v39 = a4;
        }
        else {
          v39 = @"HIDKeyboardModifierMappingPairs";
        }
        IOHIDKeyboardFilter::setCapsLockState(this, 0, v39);
      }
    }
    uint64_t v40 = _IOHIDLogCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = *((void *)this + 3);
      if (v41) {
        uint64_t v41 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADCB8(v41, (uint64_t)v69);
    }

    goto LABEL_151;
  }
  if (CFEqual(a2, @"HIDFKeyMode"))
  {
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v42 = CFGetTypeID(v6);
    if (v42 != CFNumberGetTypeID()) {
      goto LABEL_58;
    }
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 288);
    uint64_t v14 = _IOHIDLogCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407ADCF0();
    }
    goto LABEL_57;
  }
  if (CFEqual(a2, @"UserKeyMapping"))
  {
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v43 = CFGetTypeID(v6);
    v44 = (IOHIDKeyboardFilter *)CFArrayGetTypeID();
    if ((IOHIDKeyboardFilter *)v43 != v44) {
      goto LABEL_58;
    }
    if (!IOHIDKeyboardFilter::allowRemapping(v44, v6, a4)) {
      return;
    }
    memset(buf, 170, sizeof(buf));
    IOHIDKeyboardFilter::createMapFromArrayOfPairs(v6, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState(this);
    sub_2407ACE24(v66, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v66);
    sub_2407AC27C((uint64_t)v66, (void *)v66[1]);
    if ((uint8_t *)((char *)this + 264) != buf) {
      sub_2407AD140((uint64_t **)this + 33, *(void **)buf, &buf[8]);
    }
    v45 = _IOHIDLogCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = *((void *)this + 3);
      if (v46) {
        uint64_t v46 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADD28(v46, (uint64_t)v69);
    }

    goto LABEL_151;
  }
  if (CFStringCompare(a2, @"HIDSlowKeysDelay", 0))
  {
    if (CFStringCompare(a2, @"CapsLockDelay", 0))
    {
      if (CFEqual(a2, @"CapsLockDelayOverride"))
      {
        if (v6)
        {
          CFTypeID v52 = CFGetTypeID(v6);
          if (v52 == CFNumberGetTypeID())
          {
            CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 404);
            CFDictionaryRef v53 = _IOHIDLogCategory();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              if (*((void *)this + 3)) {
                IOHIDServiceGetRegistryID();
              }
              sub_2407ADDD0();
            }

            if (*((_DWORD *)this + 100) == *((_DWORD *)this + 101)) {
              *((_DWORD *)this + 101) = -1;
            }
          }
        }
        goto LABEL_58;
      }
      int v25 = CFEqual(a2, @"LockKeyDelay");
      BOOL v26 = v6 == 0;
      if (!v25) {
        BOOL v26 = 1;
      }
      if (!v26)
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 424);
        v27 = _IOHIDLogCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          if (*((void *)this + 3)) {
            IOHIDServiceGetRegistryID();
          }
          sub_2407ADE08();
        }

        if (!*((_DWORD *)this + 106))
        {
          uint64_t v28 = (const void *)*((void *)this + 52);
          if (v28)
          {
            CFRelease(v28);
            *((void *)this + 52) = 0;
          }
        }
        goto LABEL_58;
      }
      if (CFEqual(a2, @"UnifiedKeyMapping")) {
        BOOL v54 = v6 != 0;
      }
      else {
        BOOL v54 = 0;
      }
      if (v54) {
        goto LABEL_58;
      }
      int v55 = CFEqual(a2, @"CtrlKeyboardUsageMap");
      BOOL v56 = v6 == 0;
      if (!v55) {
        BOOL v56 = 1;
      }
      if (v56) {
        goto LABEL_58;
      }
      CFTypeID v57 = CFGetTypeID(v6);
      v58 = (IOHIDKeyboardFilter *)CFStringGetTypeID();
      if ((IOHIDKeyboardFilter *)v57 != v58) {
        goto LABEL_58;
      }
      if (!IOHIDKeyboardFilter::allowRemapping(v58, v6, a4)) {
        return;
      }
      memset(buf, 170, sizeof(buf));
      IOHIDKeyboardFilter::createMapFromStringMap((CFStringRef)v6, (uint64_t)buf);
      IOHIDKeyboardFilter::resetModifiedKeyState(this);
      sub_2407ACE24(v65, (uint64_t)buf);
      IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v65);
      sub_2407AC27C((uint64_t)v65, (void *)v65[1]);
      v69[0] = 1;
      valuePtr[0] = v69;
      v59 = sub_2407AC330((uint64_t **)this + 24, v69, (uint64_t)&std::piecewise_construct, valuePtr);
      sub_2407AC90C((uint64_t)(v59 + 5), buf);
      uint64_t v60 = _IOHIDLogCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v61 = *((void *)this + 3);
        if (v61) {
          uint64_t v61 = IOHIDServiceGetRegistryID();
        }
        sub_2407ADE40(v61, (uint64_t)v69);
      }

LABEL_151:
      sub_2407AC27C((uint64_t)buf, *(void **)&buf[8]);
      goto LABEL_58;
    }
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v50 = CFGetTypeID(v6);
    if (v50 != CFNumberGetTypeID()) {
      goto LABEL_58;
    }
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 400);
    CFBooleanRef v51 = _IOHIDLogCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_2407ADD98();
    }

    if (*((_DWORD *)this + 100)) {
      goto LABEL_58;
    }
    v49 = (const void *)*((void *)this + 49);
    if (!v49) {
      goto LABEL_58;
    }
    goto LABEL_169;
  }
  if (v6)
  {
    CFTypeID v47 = CFGetTypeID(v6);
    if (v47 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 304);
      CFBooleanRef v48 = _IOHIDLogCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        if (*((void *)this + 3)) {
          IOHIDServiceGetRegistryID();
        }
        sub_2407ADD60();
      }

      if (!*((_DWORD *)this + 76))
      {
        CFArrayRef v62 = (const void *)*((void *)this + 37);
        if (v62)
        {
          CFRelease(v62);
          *((void *)this + 37) = 0;
        }
        goto LABEL_58;
      }
      v49 = (const void *)*((void *)this + 49);
      if (v49)
      {
LABEL_169:
        CFRelease(v49);
        *((void *)this + 49) = 0;
      }
    }
  }
LABEL_58:
  if (v10 != *v12)
  {
    *CFTypeRef v12 = v10;
    if (v10) {
      int v9 = 0;
    }
  }
  if (v9 != *((_DWORD *)this + 89))
  {
    *((_DWORD *)this + 89) = v9;
    long long v21 = _IOHIDLogCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *((void *)this + 3);
      if (v22) {
        uint64_t v22 = IOHIDServiceGetRegistryID();
      }
      sub_2407ADAE0(v22, (uint64_t)valuePtr, v9);
    }

    int v23 = *((void *)this + 62);
    if (v23)
    {
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = sub_2407A8F08;
      v63[3] = &unk_2650D6010;
      v63[4] = this;
      int v64 = v9;
      dispatch_async(v23, v63);
    }
  }
}

void sub_2407A87DC(_Unwind_Exception *a1)
{
  sub_2407AC27C(v2 - 144, *(void **)(v2 - 136));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setCapsLockState(IOHIDKeyboardFilter *this, int a2, const void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 110) != a2)
  {
    *((_DWORD *)this + 110) = a2;
    CFBooleanRef v6 = +[AppleKeyboardStateManager sharedManager];
    [v6 setCapsLockEnabled:*((_DWORD *)this + 110) != 0 locationID:*((void *)this + 59)];

    uint64_t v7 = _IOHIDLogCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t RegistryID = *((void *)this + 3);
      if (RegistryID) {
        uint64_t RegistryID = IOHIDServiceGetRegistryID();
      }
      int v9 = 138412802;
      uint64_t v10 = RegistryID;
      __int16 v11 = 1024;
      int v12 = a2;
      __int16 v13 = 2112;
      uint64_t v14 = a3;
      _os_log_impl(&dword_2407A4000, v7, OS_LOG_TYPE_INFO, "[%@] Set capslock state: %d client: %@\n", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

void sub_2407A8A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::updateCapslockLED(IOHIDKeyboardFilter *this, const void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((*((unsigned char *)this + 295) & 1) == 0) {
    return;
  }
  int v4 = *((_DWORD *)this + 111);
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x263F0EC60])) {
    goto LABEL_17;
  }
  *((_DWORD *)this + 111) = *((_DWORD *)this + 110);
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x263F0EC70]))
  {
    int v5 = 1;
LABEL_8:
    *((_DWORD *)this + 111) = v5;
    goto LABEL_9;
  }
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x263F0EC68]) || *((_DWORD *)this + 112))
  {
    int v5 = 0;
    goto LABEL_8;
  }
LABEL_9:
  if (!*((void *)this + 3))
  {
LABEL_17:
    int v6 = 0;
    goto LABEL_11;
  }
  IOHIDServiceSetElementValue();
  IOHIDServiceSetProperty();
  int v6 = 1;
LABEL_11:
  uint64_t v7 = _IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    int v9 = *((_DWORD *)this + 111);
    uint64_t v10 = *((void *)this + 57);
    int v11 = *((_DWORD *)this + 110);
    int v12 = 138413826;
    uint64_t v13 = RegistryID;
    __int16 v14 = 1024;
    BOOL v15 = v4 != 0;
    __int16 v16 = 1024;
    int v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 2112;
    int v23 = a2;
    __int16 v24 = 1024;
    int v25 = v6;
    _os_log_impl(&dword_2407A4000, v7, OS_LOG_TYPE_INFO, "[%@] updateCapslockLED:%d->%d capsLockLED:%@ capsLockState:%d client:%@, didUpdateCapsLockLEDState:%d\n", (uint8_t *)&v12, 0x38u);
  }
}

void sub_2407A8C3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetModifiedKeyState(IOHIDKeyboardFilter *this)
{
  memset(v7, 170, sizeof(v7));
  sub_2407AD578((uint64_t)v7, (uint64_t)this + 64);
  uint64_t v2 = (void *)v7[0];
  if ((void *)v7[0] != &v7[1])
  {
    do
    {
      if (*((unsigned char *)v2 + 40))
      {
        mach_absolute_time();
        KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
        if (KeyboardEvent)
        {
          (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, KeyboardEvent, 0);
          CFRelease(KeyboardEvent);
        }
      }
      int v4 = (void *)v2[1];
      if (v4)
      {
        do
        {
          int v5 = v4;
          int v4 = (void *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          int v5 = (void *)v2[2];
          BOOL v6 = *v5 == (void)v2;
          uint64_t v2 = v5;
        }
        while (!v6);
      }
      uint64_t v2 = v5;
    }
    while (v5 != &v7[1]);
  }
  sub_2407AC27C((uint64_t)v7, (void *)v7[1]);
}

void sub_2407A8D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

void IOHIDKeyboardFilter::resetModifiedKeyState(uint64_t a1, void *a2)
{
  uint64_t v2 = a2 + 1;
  long long v3 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    int v5 = (void *)(a1 + 72);
    do
    {
      BOOL v6 = (void *)*v5;
      if (*v5)
      {
        unint64_t v7 = v3[4];
        uint64_t v8 = v5;
        do
        {
          unint64_t v9 = v6[4];
          BOOL v10 = v9 >= v7;
          if (v9 >= v7) {
            int v11 = v6;
          }
          else {
            int v11 = v6 + 1;
          }
          if (v10) {
            uint64_t v8 = v6;
          }
          BOOL v6 = (void *)*v11;
        }
        while (*v11);
        if (v8 != v5 && v7 >= v8[4])
        {
          mach_absolute_time();
          uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
          if (KeyboardEvent)
          {
            uint64_t v13 = (const void *)KeyboardEvent;
            (*(void (**)(void, void, uint64_t, uint64_t, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), a1, KeyboardEvent, 0);
            CFRelease(v13);
          }
        }
      }
      __int16 v14 = (void *)v3[1];
      if (v14)
      {
        do
        {
          BOOL v15 = v14;
          __int16 v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          BOOL v15 = (void *)v3[2];
          BOOL v16 = *v15 == (void)v3;
          long long v3 = v15;
        }
        while (!v16);
      }
      long long v3 = v15;
    }
    while (v15 != v2);
  }
}

void IOHIDKeyboardFilter::resetSlowKey(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 37);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 37) = 0;
  }
}

void IOHIDKeyboardFilter::resetCapsLockDelay(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 49);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 49) = 0;
  }
}

void IOHIDKeyboardFilter::resetLockKeyDelay(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 52);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 52) = 0;
  }
}

void sub_2407A8F08(uint64_t a1)
{
  uint64_t v2 = *(IOHIDKeyboardFilter **)(a1 + 32);
  if (*(_DWORD *)(a1 + 40)) {
    IOHIDKeyboardFilter::startStickyKey(v2);
  }
  else {
    IOHIDKeyboardFilter::dispatchStickyKeys(v2, 14);
  }
}

void IOHIDKeyboardFilter::startStickyKey(IOHIDKeyboardFilter *this)
{
  memset(v7, 170, sizeof(v7));
  sub_2407AD578((uint64_t)v7, (uint64_t)this + 64);
  uint64_t v2 = (void *)v7[0];
  if ((void *)v7[0] != &v7[1])
  {
    do
    {
      if (Key::isModifier((Key *)(v2 + 4)))
      {
        mach_absolute_time();
        uint64_t KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
        if (KeyboardEvent)
        {
          IOHIDEventSetIntegerValue();
          (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, KeyboardEvent, 0);
          CFRelease(KeyboardEvent);
        }
      }
      int v4 = (void *)v2[1];
      if (v4)
      {
        do
        {
          int v5 = v4;
          int v4 = (void *)*v4;
        }
        while (v4);
      }
      else
      {
        do
        {
          int v5 = (void *)v2[2];
          BOOL v6 = *v5 == (void)v2;
          uint64_t v2 = v5;
        }
        while (!v6);
      }
      uint64_t v2 = v5;
    }
    while (v5 != &v7[1]);
  }
  sub_2407AC27C((uint64_t)v7, (void *)v7[1]);
}

void sub_2407A903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t IOHIDKeyboardFilter::match(IOHIDKeyboardFilter *this, __IOHIDService *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = 300;
  if (!IOHIDServiceConformsTo())
  {
    if (IOHIDServiceConformsTo()) {
      int v3 = 300;
    }
    else {
      int v3 = 0;
    }
  }
  *((_DWORD *)this + 5) = v3;
  int v4 = _IOHIDLogCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = IOHIDServiceGetRegistryID();
    int v7 = *((_DWORD *)this + 5);
    int v8 = 134218498;
    unint64_t v9 = this;
    __int16 v10 = 2112;
    uint64_t v11 = RegistryID;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_debug_impl(&dword_2407A4000, v4, OS_LOG_TYPE_DEBUG, "(%p) for ServiceID %@ with score %d\n", (uint8_t *)&v8, 0x1Cu);
  }

  return *((unsigned int *)this + 5);
}

void sub_2407A916C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const void *IOHIDKeyboardFilter::filter(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  v12[3] = *MEMORY[0x263EF8340];
  if (a2 && IOHIDEventGetType() == 3)
  {
    __int16 EventFlags = IOHIDEventGetEventFlags();
    uint64_t v2 = (const void *)IOHIDKeyboardFilter::processKeyMappings(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::processModifiedKeyState(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::dispatchEventCopy(a1, (uint64_t)v2);
    if (!*(_DWORD *)(a1 + 304) || (uint64_t v2 = IOHIDKeyboardFilter::processSlowKeys(a1, v2), !*(_DWORD *)(a1 + 304)))
    {
      if (!*(_DWORD *)(a1 + 400)
        || !*(_DWORD *)(a1 + 404)
        || (uint64_t v2 = IOHIDKeyboardFilter::processCapsLockDelay(a1, v2), !*(_DWORD *)(a1 + 304)))
      {
        if (*(_DWORD *)(a1 + 424) && !IOHIDKeyboardFilter::isModifiersPressed((IOHIDKeyboardFilter *)a1)) {
          uint64_t v2 = IOHIDKeyboardFilter::processLockKeyDelay(a1, v2);
        }
      }
    }
    if (!*(_DWORD *)(a1 + 360)) {
      uint64_t v2 = (const void *)IOHIDKeyboardFilter::processStickyKeys(a1, (uint64_t)v2);
    }
    IOHIDKeyboardFilter::processCapsLockState(a1, (uint64_t)v2);
    uint64_t v5 = *(void *)(a1 + 376);
    if (v5 && (EventFlags & 0x100) == 0)
    {
      if (*(_DWORD *)(a1 + 304))
      {
        uint64_t v6 = a1;
        int v7 = v2;
        uint64_t v5 = 420;
        uint64_t v8 = 420;
      }
      else
      {
        uint64_t v8 = *(void *)(a1 + 384);
        uint64_t v6 = a1;
        int v7 = v2;
      }
      IOHIDKeyboardFilter::processKeyRepeats(v6, v7, v5, v8);
    }
    IOHIDKeyboardFilter::processKeyState(a1, (uint64_t)v2);
    if (!v2)
    {
      unint64_t v9 = _IOHIDLogCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t RegistryID = *(void *)(a1 + 24);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        sub_2407ADEC8(RegistryID, (uint64_t)v12);
      }

      return 0;
    }
  }
  return v2;
}

void sub_2407A9344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::dispatchEventCopy(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
    if (IOHIDEventGetIntegerValue() == 7 && IntegerValue == 57)
    {
      IOHIDEventGetIntegerValue();
      mach_absolute_time();
      uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
      if (VendorDefinedEvent)
      {
        uint64_t v5 = (const void *)VendorDefinedEvent;
        (*(void (**)(void, void, uint64_t, uint64_t, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), a1, VendorDefinedEvent, 0);
        CFRelease(v5);
      }
    }
  }
}

uint64_t IOHIDKeyboardFilter::processKeyMappings(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
    unsigned int v5 = IOHIDEventGetIntegerValue();
    int EventFlags = IOHIDEventGetEventFlags();
    if (!*(void *)(a1 + 368)
      || IntegerValue != IOHIDEventGetIntegerValue()
      || v5 != IOHIDEventGetIntegerValue())
    {
      int v7 = (const void *)_IOHIDEventCopyAttachment();
      Copy = v7;
      if (v7 == (const void *)*MEMORY[0x263EFFB40])
      {
LABEL_16:
        CFRelease(Copy);
        return v2;
      }
      if (v7) {
        CFRelease(v7);
      }
      if ((EventFlags & 0x6F0000) == 0 && !IOHIDEventGetIntegerValue() && !IOHIDKeyboardFilter::isDelayedEvent())
      {
        uint64_t v9 = IOHIDKeyboardFilter::remapKey(a1, IntegerValue | ((unint64_t)v5 << 32));
        if (!v9) {
          return 0;
        }
        if (v9 != __PAIR64__(v5, IntegerValue))
        {
          Copy = (const void *)IOHIDEventCreateCopy();
          Children = (__CFArray *)IOHIDEventGetChildren();
          if (Children) {
            CFArrayRemoveAllValues(Children);
          }
          IOHIDEventAppendEvent();
          _IOHIDEventSetAttachment();
          IOHIDEventSetIntegerValue();
          IOHIDEventSetIntegerValue();
          goto LABEL_16;
        }
      }
    }
  }
  return v2;
}

void IOHIDKeyboardFilter::processModifiedKeyState(uint64_t a1, uint64_t a2)
{
  if (a2 && !IOHIDEventGetIntegerValue())
  {
    IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
    int v4 = IOHIDEventGetIntegerValue();
    uint64_t v5 = 0;
    while (dword_2407AE7E0[v5] != v4 || dword_2407AE7E0[v5 + 1] != IntegerValue)
    {
      v5 += 2;
      if (v5 == 8) {
        return;
      }
    }
    if (v4 == 255 && IntegerValue == 3)
    {
      int v6 = 1;
    }
    else
    {
      BOOL v7 = v4 == 65281 && IntegerValue == 3;
      int v6 = v7;
    }
    memset(v20, 170, sizeof(v20));
    sub_2407AD578((uint64_t)v20, a1 + 64);
    uint64_t v8 = (void *)v20[0];
    if ((void *)v20[0] != &v20[1])
    {
      uint64_t v9 = (void *)(a1 + 96);
      do
      {
        __int16 v10 = v8 + 4;
        if (*((unsigned char *)v8 + 40) && !Key::modifierMask((Key *)(v8 + 4))
          || v6 && *((_DWORD *)v8 + 9) == 7 && (*(_DWORD *)v10 - 58) < 0xC)
        {
          uint64_t v11 = (void *)*v9;
          if (!*v9) {
            goto LABEL_35;
          }
          unint64_t v12 = *v10;
          int v13 = (void *)(a1 + 96);
          do
          {
            unint64_t v14 = v11[4];
            BOOL v15 = v14 >= v12;
            if (v14 >= v12) {
              BOOL v16 = v11;
            }
            else {
              BOOL v16 = v11 + 1;
            }
            if (v15) {
              int v13 = v11;
            }
            uint64_t v11 = (void *)*v16;
          }
          while (*v16);
          if (v13 == v9 || v12 < v13[4])
          {
LABEL_35:
            sub_2407AD6F4((uint64_t **)(a1 + 88), v8 + 4, (_OWORD *)v8 + 2);
            mach_absolute_time();
            uint64_t KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
            if (KeyboardEvent)
            {
              _IOHIDEventSetAttachment();
              (*(void (**)(void, void, uint64_t, const void *, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48), a1, KeyboardEvent, 0);
              CFRelease(KeyboardEvent);
            }
            sub_2407AD7B0(a1 + 88, v8 + 4);
          }
        }
        __int16 v18 = (void *)v8[1];
        if (v18)
        {
          do
          {
            uint64_t v19 = v18;
            __int16 v18 = (void *)*v18;
          }
          while (v18);
        }
        else
        {
          do
          {
            uint64_t v19 = (void *)v8[2];
            BOOL v7 = *v19 == (void)v8;
            uint64_t v8 = v19;
          }
          while (!v7);
        }
        uint64_t v8 = v19;
      }
      while (v19 != &v20[1]);
    }
    sub_2407AC27C((uint64_t)v20, (void *)v20[1]);
  }
}

void sub_2407A9874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

const void *IOHIDKeyboardFilter::processSlowKeys(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  if (a2 && IOHIDEventGetIntegerValue() != 3)
  {
    IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    if (IOHIDEventGetIntegerValue())
    {
      CFRetain(v2);
      int v6 = *(const void **)(a1 + 296);
      if (v6) {
        CFRelease(v6);
      }
      *(void *)(a1 + 296) = v2;
      BOOL v7 = *(NSObject **)(a1 + 512);
      dispatch_time_t v8 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 304));
      dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      return 0;
    }
    else if (*(void *)(a1 + 296) {
           && IOHIDEventGetIntegerValue() == IntegerValue
    }
           && IOHIDEventGetIntegerValue() == v5)
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      if ((IOHIDEventGetEventFlags() & 0x10000) == 0) {
        uint64_t v2 = 0;
      }
      __int16 v10 = *(const void **)(a1 + 296);
      if (v10)
      {
        CFRelease(v10);
        *(void *)(a1 + 296) = 0;
      }
    }
  }
  return v2;
}

const void *IOHIDKeyboardFilter::processCapsLockDelay(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    int v6 = IOHIDEventGetIntegerValue();
    if (v5 == 7 && IntegerValue == 57)
    {
      int v7 = v6;
      if (IOHIDKeyboardFilter::isDelayedEvent())
      {
        _IOHIDEventRemoveAttachment();
        return v2;
      }
      int v8 = *(_DWORD *)(a1 + 404);
      if (v8 <= 0)
      {
        int v8 = *(_DWORD *)(a1 + 400);
        if (!v7) {
          goto LABEL_11;
        }
      }
      else if (!v7)
      {
        goto LABEL_11;
      }
      if (!*(_DWORD *)(a1 + 440))
      {
        __int16 v10 = *(NSObject **)(a1 + 528);
        dispatch_time_t v11 = dispatch_time(0, 1000000 * v8);
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
        _IOHIDEventSetAttachment();
        *(void *)(a1 + 392) = v2;
        CFRetain(v2);
        return 0;
      }
LABEL_11:
      if (!*(void *)(a1 + 392)) {
        return v2;
      }
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 528), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      uint64_t v9 = *(const void **)(a1 + 392);
      if (v9)
      {
        CFRelease(v9);
        uint64_t v2 = 0;
        *(void *)(a1 + 392) = 0;
        return v2;
      }
      return 0;
    }
  }
  return v2;
}

BOOL IOHIDKeyboardFilter::isModifiersPressed(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (void *)*((void *)this + 8);
  uint64_t v2 = (char *)this + 72;
  if (v1 == (void *)((char *)this + 72)) {
    return 0;
  }
  while (1)
  {
    BOOL result = Key::isModifier((Key *)(v1 + 4));
    if (result) {
      break;
    }
    int v4 = (void *)v1[1];
    if (v4)
    {
      do
      {
        int v5 = v4;
        int v4 = (void *)*v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        int v5 = (void *)v1[2];
        BOOL v6 = *v5 == (void)v1;
        uint64_t v1 = v5;
      }
      while (!v6);
    }
    uint64_t v1 = v5;
    if (v5 == (void *)v2) {
      return result;
    }
  }
  return 1;
}

const void *IOHIDKeyboardFilter::processLockKeyDelay(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    if ((IntegerCFNumberRef Value = IOHIDEventGetIntegerValue(),
          int v5 = IOHIDEventGetIntegerValue(),
          int v6 = IOHIDEventGetIntegerValue(),
          v5 == 12)
      && IntegerValue == 414
      || (int v7 = IOHIDServiceConformsTo(), v5 == 12) && v7 && IntegerValue == 48)
    {
      if (IOHIDKeyboardFilter::isDelayedEvent())
      {
        _IOHIDEventRemoveAttachment();
      }
      else
      {
        if (v6)
        {
          int v8 = *(NSObject **)(a1 + 432);
          dispatch_time_t v9 = dispatch_time(0, 1000000 * *(unsigned int *)(a1 + 424));
          dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
          _IOHIDEventSetAttachment();
          *(void *)(a1 + 416) = v2;
          CFRetain(v2);
        }
        else
        {
          if (!*(void *)(a1 + 416)) {
            return v2;
          }
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 432), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
          dispatch_time_t v11 = *(const void **)(a1 + 416);
          if (v11)
          {
            CFRelease(v11);
            uint64_t v2 = 0;
            *(void *)(a1 + 416) = 0;
            return v2;
          }
        }
        return 0;
      }
    }
  }
  return v2;
}

uint64_t IOHIDKeyboardFilter::processStickyKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned int v12 = 0;
  if (a2)
  {
    int v4 = *(_DWORD *)(a1 + 356);
    if (IOHIDEventGetIntegerValue() != 3 && IOHIDEventGetIntegerValue() != 1 && IOHIDEventGetIntegerValue() != 2)
    {
      IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
      unsigned int v6 = IOHIDEventGetIntegerValue();
      uint64_t v7 = IOHIDEventGetIntegerValue();
      if (v6 == 7 && (IntegerValue & 0xFFFFFFFB) == 0xE1)
      {
        if (!v7) {
          IOHIDKeyboardFilter::processShiftKey((IOHIDKeyboardFilter *)a1);
        }
      }
      else
      {
        *(_DWORD *)(a1 + 308) = 0;
      }
      if (*(_DWORD *)(a1 + 356))
      {
        if (IntegerValue != 57 || v6 != 7)
        {
          unint64_t v13 = IntegerValue | ((unint64_t)v6 << 32);
          char v14 = 0;
          if (Key::isModifier((Key *)&v13))
          {
            if (*(_DWORD *)(a1 + 356) == (v4 != 0))
            {
              if (v7) {
                int v8 = IOHIDKeyboardFilter::processStickyKeyDown((IOHIDKeyboardFilter *)a1, v6, IntegerValue, &v12);
              }
              else {
                int v8 = IOHIDKeyboardFilter::processStickyKeyUp((IOHIDKeyboardFilter *)a1, v6, IntegerValue, &v12);
              }
              if (!v8) {
                return 0;
              }
              IOHIDEventSetIntegerValue();
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
            }
            else
            {
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
            }
            goto LABEL_28;
          }
        }
        if (*(_DWORD *)(a1 + 308)) {
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
        }
        if (!v7)
        {
          dispatch_time_t v9 = *(NSObject **)(a1 + 496);
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = sub_2407AB76C;
          void v11[3] = &unk_2650D5FC8;
          v11[4] = a1;
          dispatch_async(v9, v11);
          *(_DWORD *)(a1 + 308) = 0;
        }
        IOHIDKeyboardFilter::updateStickyKeysState((IOHIDKeyboardFilter *)a1, 8, 16);
      }
      else if (v4)
      {
        IOHIDEventGetEventFlags();
        IOHIDEventSetEventFlags();
LABEL_28:
        IOHIDEventSetIntegerValue();
      }
    }
  }
  return v2;
}

uint64_t IOHIDKeyboardFilter::processCapsLockState(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (IOHIDKeyboardFilter *)result;
    BOOL result = IOHIDEventGetIntegerValue();
    if (result != 1)
    {
      BOOL result = IOHIDEventGetIntegerValue();
      if (result != 2)
      {
        IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
        int v4 = IOHIDEventGetIntegerValue();
        BOOL result = IOHIDEventGetIntegerValue();
        if (v4 == 7 && IntegerValue == 57 && result)
        {
          IOHIDKeyboardFilter::setCapsLockState(v2, *((_DWORD *)v2 + 110) == 0, @"Keyboard");
          return IOHIDServiceSetProperty();
        }
      }
    }
  }
  return result;
}

const void *IOHIDKeyboardFilter::processKeyRepeats(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return a2;
  }
  if (IOHIDEventGetIntegerValue() == 1) {
    return a2;
  }
  if (IOHIDEventGetIntegerValue() == 2) {
    return a2;
  }
  IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
  int v9 = IOHIDEventGetIntegerValue();
  int v10 = IOHIDEventGetIntegerValue();
  unint64_t v18 = IntegerValue | ((unint64_t)v9 << 32);
  char v19 = 0;
  if (Key::isModifier((Key *)&v18)) {
    return a2;
  }
  if (v9 > 11)
  {
    if (v9 == 12)
    {
      if (IntegerValue - 48 <= 0x10 && ((1 << (IntegerValue - 48)) & 0x10005) != 0
        || IntegerValue - 176 <= 0x1D && ((1 << (IntegerValue + 80)) & 0x20000101) != 0)
      {
        return a2;
      }
      goto LABEL_29;
    }
    if (v9 != 255) {
      goto LABEL_21;
    }
    if ((IntegerValue & 0xFFFFFFFE) == 6) {
      return a2;
    }
  }
  else
  {
    if (v9 != 7)
    {
      if (v9 == 11) {
        return a2;
      }
LABEL_21:
      BOOL v13 = IntegerValue == 34 && v9 == 65281;
      if (v9 == 65289 || v13) {
        return a2;
      }
      goto LABEL_29;
    }
    if (IntegerValue - 83 <= 0x2C && ((1 << (IntegerValue - 83)) & 0x100000080001) != 0) {
      return a2;
    }
  }
LABEL_29:
  char v14 = *(const void **)(a1 + 368);
  if (v10)
  {
    if (v14) {
      CFRelease(v14);
    }
    CFGetAllocator(a2);
    mach_absolute_time();
    *(void *)(a1 + 368) = IOHIDEventCreateKeyboardEvent();
    BOOL v15 = *(NSObject **)(a1 + 520);
    if ((IOHIDEventGetEventFlags() & 0x10000) != 0) {
      uint64_t v16 = a4;
    }
    else {
      uint64_t v16 = a3;
    }
    dispatch_time_t v17 = dispatch_time(0, 1000000 * v16);
    dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else if (v14 {
         && IntegerValue == IOHIDEventGetIntegerValue()
  }
         && v9 == IOHIDEventGetIntegerValue())
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 520), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    CFRelease(*(CFTypeRef *)(a1 + 368));
    *(void *)(a1 + 368) = 0;
  }
  return a2;
}

void IOHIDKeyboardFilter::processKeyState(uint64_t a1, uint64_t a2)
{
  if (a2 && IOHIDEventGetIntegerValue() != 1 && IOHIDEventGetIntegerValue() != 2)
  {
    IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
    unsigned int v4 = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    int EventFlags = IOHIDEventGetEventFlags();
    uint64_t v7 = (const void *)_IOHIDEventCopyAttachment();
    BOOL v8 = v7 == (const void *)*MEMORY[0x263EFFB40];
    if (v7) {
      CFRelease(v7);
    }
    unint64_t v9 = IntegerValue | ((unint64_t)v4 << 32);
    int v10 = (uint64_t **)(a1 + 64);
    if (v5)
    {
      unint64_t v18 = v9;
      BOOL v19 = v8;
      v20[0] = -1431655766;
      *(_DWORD *)((char *)v20 + 3) = -1431655766;
      *(_DWORD *)((char *)&v20[1] + 3) = EventFlags;
      sub_2407AD82C(v10, &v18, (uint64_t)&v18);
    }
    else
    {
      BOOL v13 = *(void **)(a1 + 72);
      unsigned int v12 = (uint64_t *)(a1 + 72);
      dispatch_time_t v11 = v13;
      if (v13)
      {
        char v14 = v12;
        do
        {
          unint64_t v15 = v11[4];
          BOOL v16 = v15 >= v9;
          if (v15 >= v9) {
            dispatch_time_t v17 = v11;
          }
          else {
            dispatch_time_t v17 = v11 + 1;
          }
          if (v16) {
            char v14 = v11;
          }
          dispatch_time_t v11 = (void *)*v17;
        }
        while (*v17);
        if (v14 != v12 && v9 >= v14[4])
        {
          sub_2407AC978(v10, v14);
          operator delete(v14);
        }
      }
    }
  }
}

uint64_t *sub_2407AA4D8(uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C338] + 64;
  a1[15] = MEMORY[0x263F8C338] + 64;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2C0] + 16);
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2C0] + 8);
  *a1 = v9;
  *(uint64_t *)((char *)a1 + *(void *)(v9 - 24)) = v8;
  a1[1] = 0;
  int v10 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v10, a1 + 2);
  uint64_t v11 = MEMORY[0x263F8C338] + 24;
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  *a1 = v11;
  a1[15] = v6;
  sub_2407AD3C4(v7, a2, a3 | 8);
  return a1;
}

void sub_2407AA634(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x2455F9DA0](v1);
  _Unwind_Resume(a1);
}

void *sub_2407AA65C(void *a1, uint64_t a2, unsigned __int8 a3)
{
  char v11 = -86;
  MEMORY[0x2455F9D30](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      void v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_2407AA7C4(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x2407AA784);
  }
  __cxa_rethrow();
}

void sub_2407AA840(_Unwind_Exception *a1)
{
}

uint64_t sub_2407AA854(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C0];
  uint64_t v3 = *MEMORY[0x263F8C2C0];
  *(void *)a1 = *MEMORY[0x263F8C2C0];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x2455F9DA0](a1 + 120);
  return a1;
}

BOOL IOHIDKeyboardFilter::isKeyPressed(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = *(void **)(a1 + 72);
  uint64_t v2 = (void *)(a1 + 72);
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v5 = v2;
  do
  {
    unint64_t v6 = v3[4];
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = v3 + 1;
    }
    if (v7) {
      int v5 = v3;
    }
    uint64_t v3 = (void *)*v8;
  }
  while (*v8);
  if (v5 == v2 || a2 < v5[4]) {
LABEL_12:
  }
    int v5 = v2;
  return v5 != v2;
}

BOOL IOHIDKeyboardFilter::isDelayedEvent()
{
  v0 = (const void *)_IOHIDEventCopyAttachment();
  if (!v0) {
    return 0;
  }
  BOOL v1 = v0 == (const void *)*MEMORY[0x263EFFB40];
  CFRelease(v0);
  return v1;
}

uint64_t IOHIDKeyboardFilter::remapKey(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t result = 0x70000003ELL;
  if (a2 != 0x70000003ELL) {
    goto LABEL_22;
  }
  int v5 = (void *)(a1 + 72);
  unint64_t v6 = *(void **)(a1 + 72);
  if (!v6) {
    goto LABEL_22;
  }
  BOOL v7 = (void *)(a1 + 72);
  uint64_t v8 = (void *)(a1 + 72);
  int v9 = *(void **)(a1 + 72);
  do
  {
    unint64_t v10 = v9[4];
    BOOL v11 = v10 >= 0x7000000E3;
    if (v10 >= 0x7000000E3) {
      unsigned int v12 = v9;
    }
    else {
      unsigned int v12 = v9 + 1;
    }
    if (v11) {
      uint64_t v8 = v9;
    }
    int v9 = (void *)*v12;
  }
  while (*v12);
  if (v8 == v5 || v8[4] >= 0x7000000E4uLL)
  {
    do
    {
      unint64_t v13 = v6[4];
      BOOL v14 = v13 >= 0x7000000E7;
      if (v13 >= 0x7000000E7) {
        unint64_t v15 = v6;
      }
      else {
        unint64_t v15 = v6 + 1;
      }
      if (v14) {
        BOOL v7 = v6;
      }
      unint64_t v6 = (void *)*v15;
    }
    while (*v15);
    if (v7 == v5 || v7[4] >= 0x7000000E8uLL)
    {
LABEL_22:
      int ActiveModifiers = IOHIDKeyboardFilter::getActiveModifiers((IOHIDKeyboardFilter *)a1);
      if ((*(_DWORD *)(a1 + 288) == 0) != (unsigned __int16)(ActiveModifiers & 0x200) >> 9)
      {
        dispatch_time_t v17 = *(void **)(a1 + 144);
        if (v17)
        {
          unint64_t v18 = (void *)(a1 + 144);
          do
          {
            unint64_t v19 = v17[4];
            BOOL v20 = v19 >= v2;
            if (v19 >= v2) {
              int v21 = v17;
            }
            else {
              int v21 = v17 + 1;
            }
            if (v20) {
              unint64_t v18 = v17;
            }
            dispatch_time_t v17 = (void *)*v21;
          }
          while (*v21);
          if (v18 != (void *)(a1 + 144) && v2 >= v18[4]) {
            unint64_t v2 = v18[6];
          }
        }
      }
      __int16 v22 = *(void **)(a1 + 160);
      int v25 = (void *)*v22;
      int v23 = v22 + 1;
      __int16 v24 = v25;
      if (v25 != v23)
      {
        while (1)
        {
          if ((v24[4] & ActiveModifiers) != 0)
          {
            uint64_t v26 = (void *)v24[6];
            if (v26)
            {
              v27 = v24 + 6;
              do
              {
                unint64_t v28 = v26[4];
                BOOL v29 = v28 >= v2;
                if (v28 >= v2) {
                  BOOL v30 = v26;
                }
                else {
                  BOOL v30 = v26 + 1;
                }
                if (v29) {
                  v27 = v26;
                }
                uint64_t v26 = (void *)*v30;
              }
              while (*v30);
              if (v27 != v24 + 6 && v2 >= v27[4]) {
                break;
              }
            }
          }
          uint64_t v31 = (void *)v24[1];
          if (v31)
          {
            do
            {
              CFTypeID v32 = v31;
              uint64_t v31 = (void *)*v31;
            }
            while (v31);
          }
          else
          {
            do
            {
              CFTypeID v32 = (void *)v24[2];
              BOOL v33 = *v32 == (void)v24;
              __int16 v24 = v32;
            }
            while (!v33);
          }
          __int16 v24 = v32;
          if (v32 == v23) {
            goto LABEL_54;
          }
        }
        unint64_t v2 = v27[6];
      }
LABEL_54:
      if (*(_DWORD *)(a1 + 408))
      {
        uint64_t v34 = *(void **)(a1 + 248);
        if (v34)
        {
          CFTypeID v35 = (void *)(a1 + 248);
          do
          {
            unint64_t v36 = v34[4];
            BOOL v37 = v36 >= v2;
            if (v36 >= v2) {
              v38 = v34;
            }
            else {
              v38 = v34 + 1;
            }
            if (v37) {
              CFTypeID v35 = v34;
            }
            uint64_t v34 = (void *)*v38;
          }
          while (*v38);
          if (v35 != (void *)(a1 + 248) && v2 >= v35[4]) {
            unint64_t v2 = v35[6];
          }
        }
      }
      v39 = *(void **)(a1 + 120);
      if (v39)
      {
        uint64_t v40 = (void *)(a1 + 120);
        do
        {
          unint64_t v41 = v39[4];
          BOOL v42 = v41 >= v2;
          if (v41 >= v2) {
            CFTypeID v43 = v39;
          }
          else {
            CFTypeID v43 = v39 + 1;
          }
          if (v42) {
            uint64_t v40 = v39;
          }
          v39 = (void *)*v43;
        }
        while (*v43);
        if (v40 != (void *)(a1 + 120) && v2 >= v40[4]) {
          unint64_t v2 = v40[6];
        }
      }
      v44 = *(void **)(a1 + 272);
      if (!v44) {
        return v2;
      }
      v45 = (void *)(a1 + 272);
      do
      {
        unint64_t v46 = v44[4];
        BOOL v47 = v46 >= v2;
        if (v46 >= v2) {
          CFBooleanRef v48 = v44;
        }
        else {
          CFBooleanRef v48 = v44 + 1;
        }
        if (v47) {
          v45 = v44;
        }
        v44 = (void *)*v48;
      }
      while (*v48);
      if (v45 != (void *)(a1 + 272) && v2 >= v45[4]) {
        return v45[6];
      }
      else {
        return v2;
      }
    }
  }
  return result;
}

uint64_t IOHIDKeyboardFilter::getActiveModifiers(IOHIDKeyboardFilter *this)
{
  BOOL v1 = (char *)*((void *)this + 8);
  unint64_t v2 = (char *)this + 72;
  if (v1 == (char *)this + 72) {
    return 0;
  }
  LODWORD(v3) = 0;
  do
  {
    int v4 = Key::modifierMask((Key *)(v1 + 32));
    int v5 = (char *)*((void *)v1 + 1);
    if (v5)
    {
      do
      {
        unint64_t v6 = v5;
        int v5 = *(char **)v5;
      }
      while (v5);
    }
    else
    {
      do
      {
        unint64_t v6 = (char *)*((void *)v1 + 2);
        BOOL v7 = *(void *)v6 == (void)v1;
        BOOL v1 = v6;
      }
      while (!v7);
    }
    uint64_t v3 = v4 | v3;
    BOOL v1 = v6;
  }
  while (v6 != v2);
  return v3;
}

BOOL IOHIDKeyboardFilter::isNumLockMode(IOHIDKeyboardFilter *this)
{
  return *((_DWORD *)this + 102) != 0;
}

uint64_t IOHIDKeyboardFilter::getStickyKeyState(IOHIDKeyboardFilter *this, int a2, unsigned int a3)
{
  if (a3 == 57)
  {
    uint64_t v3 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v3 = 9;
  }
  else
  {
    char v4 = a3 - 4;
    if (a3 <= 0xE3) {
      char v4 = a3;
    }
    uint64_t v3 = (v4 + 33);
  }
  return *((unsigned int *)this + v3 + 78);
}

void IOHIDKeyboardFilter::setStickyKeyState(IOHIDKeyboardFilter *this, int a2, unsigned int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 == 57)
  {
    uint64_t v6 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v6 = 9;
  }
  else
  {
    char v7 = a3 - 4;
    if (a3 <= 0xE3) {
      char v7 = a3;
    }
    uint64_t v6 = (v7 + 33);
  }
  uint64_t v8 = _IOHIDLogCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    int v10 = *((_DWORD *)this + v6 + 78);
    int v11 = 138412802;
    uint64_t v12 = RegistryID;
    __int16 v13 = 1024;
    int v14 = v10;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_log_debug_impl(&dword_2407A4000, v8, OS_LOG_TYPE_DEBUG, "[%@] StickyKey state %x -> %x\n", (uint8_t *)&v11, 0x18u);
  }

  *((_DWORD *)this + v6 + 78) = a4;
}

void sub_2407AAEE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::processStickyKeyDown(IOHIDKeyboardFilter *this, int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a3 == 57)
  {
    uint64_t v7 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v7 = 9;
  }
  else
  {
    char v8 = a3 - 4;
    if (a3 <= 0xE3) {
      char v8 = a3;
    }
    uint64_t v7 = (v8 + 33);
  }
  int v9 = *((_DWORD *)this + v7 + 78);
  switch(v9)
  {
    case 4:
      uint64_t v10 = 0;
      int v9 = 1;
      break;
    case 2:
      *a4 = 0x40000;
      uint64_t v10 = 2;
      int v9 = 4;
      break;
    case 1:
      *a4 = 0x20000;
      uint64_t v10 = 1;
      int v9 = 8;
      break;
    default:
      int v11 = _IOHIDLogCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t RegistryID = *((void *)this + 3);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        int v16 = 138412802;
        uint64_t v17 = RegistryID;
        __int16 v18 = 1024;
        unsigned int v19 = a2;
        __int16 v20 = 1024;
        unsigned int v21 = a3;
        _os_log_error_impl(&dword_2407A4000, v11, OS_LOG_TYPE_ERROR, "[%@] StickyKey DOWN in bad state for 0x%x:0x%x\n", (uint8_t *)&v16, 0x18u);
      }

      uint64_t v10 = 0;
      break;
  }
  IOHIDKeyboardFilter::setStickyKeyState(this, a2, a3, v9);
  uint64_t v12 = _IOHIDLogCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *((void *)this + 3);
    if (v14) {
      uint64_t v14 = IOHIDServiceGetRegistryID();
    }
    int v16 = 138413058;
    uint64_t v17 = v14;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    __int16 v20 = 1024;
    unsigned int v21 = a2;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_debug_impl(&dword_2407A4000, v12, OS_LOG_TYPE_DEBUG, "[%@] StickyKey DOWN 0x%x:0x%x phase 0x%x\n", (uint8_t *)&v16, 0x1Eu);
  }

  return v10;
}

void sub_2407AB10C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::processStickyKeyUp(IOHIDKeyboardFilter *this, int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3 == 57)
  {
    uint64_t v7 = 0;
  }
  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v7 = 9;
  }
  else
  {
    char v8 = a3 - 4;
    if (a3 <= 0xE3) {
      char v8 = a3;
    }
    uint64_t v7 = (v8 + 33);
  }
  uint64_t v9 = 0;
  int v10 = *((_DWORD *)this + v7 + 78);
  if (v10 <= 7)
  {
    if (v10 == 1)
    {
      *a4 = 0x80000;
      uint64_t v9 = 3;
      goto LABEL_21;
    }
    if (v10 == 4) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v10 == 8)
  {
    int v11 = 2;
    goto LABEL_18;
  }
  if (v10 == 16)
  {
    *a4 = 0x80000;
    uint64_t v9 = 3;
    int v11 = 1;
LABEL_18:
    IOHIDKeyboardFilter::setStickyKeyState(this, a2, a3, v11);
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v12 = _IOHIDLogCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    int v17 = 138412802;
    uint64_t v18 = RegistryID;
    __int16 v19 = 1024;
    unsigned int v20 = a2;
    __int16 v21 = 1024;
    unsigned int v22 = a3;
    _os_log_error_impl(&dword_2407A4000, v12, OS_LOG_TYPE_ERROR, "[%@] StickyKey UP in bad state for 0x%x:0x%x\n", (uint8_t *)&v17, 0x18u);
  }

  uint64_t v9 = 0;
LABEL_21:
  __int16 v13 = _IOHIDLogCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *((void *)this + 3);
    if (v15) {
      uint64_t v15 = IOHIDServiceGetRegistryID();
    }
    int v17 = 138413058;
    uint64_t v18 = v15;
    __int16 v19 = 1024;
    unsigned int v20 = a3;
    __int16 v21 = 1024;
    unsigned int v22 = a2;
    __int16 v23 = 1024;
    int v24 = v9;
    _os_log_debug_impl(&dword_2407A4000, v13, OS_LOG_TYPE_DEBUG, "[%@] StickyKey UP 0x%x:0x%x phase 0x%x\n", (uint8_t *)&v17, 0x1Eu);
  }

  return v9;
}

void sub_2407AB34C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetStickyKeys(IOHIDKeyboardFilter *this)
{
  BOOL v1 = *((void *)this + 62);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2407AB3E4;
  block[3] = &unk_2650D5FC8;
  block[4] = this;
  dispatch_async(v1, block);
}

void sub_2407AB3E4(uint64_t a1)
{
  BOOL v1 = *(IOHIDKeyboardFilter **)(a1 + 32);
  IOHIDKeyboardFilter::updateStickyKeysState(v1, 8, 16);
  IOHIDKeyboardFilter::dispatchStickyKeys(v1, 2);
  *((_DWORD *)v1 + 77) = 0;
}

void IOHIDKeyboardFilter::updateStickyKeysState(IOHIDKeyboardFilter *this, int a2, int a3)
{
  for (unsigned int i = 0; i != 10; ++i)
  {
    int v7 = i + 223;
    char v8 = i - 37;
    if (i <= 4) {
      char v8 = i - 33;
    }
    uint64_t v9 = (v8 + 33);
    if (i <= 8)
    {
      int v10 = 7;
    }
    else
    {
      int v7 = 3;
      int v10 = 255;
    }
    if (i > 8) {
      uint64_t v9 = 9;
    }
    if (i) {
      unsigned int v11 = v7;
    }
    else {
      unsigned int v11 = 57;
    }
    if (i) {
      int v12 = v10;
    }
    else {
      int v12 = 7;
    }
    if (i) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = 0;
    }
    if (*((_DWORD *)this + v13 + 78) == a2) {
      IOHIDKeyboardFilter::setStickyKeyState(this, v12, v11, a3);
    }
  }
}

void IOHIDKeyboardFilter::dispatchStickyKeys(IOHIDKeyboardFilter *this, int a2)
{
  for (unsigned int i = 0; i != 10; ++i)
  {
    int v5 = i + 223;
    char v6 = i - 37;
    if (i <= 4) {
      char v6 = i - 33;
    }
    uint64_t v7 = (v6 + 33);
    if (i <= 8)
    {
      int v8 = 7;
    }
    else
    {
      int v5 = 3;
      int v8 = 255;
    }
    if (i > 8) {
      uint64_t v7 = 9;
    }
    if (i) {
      unsigned int v9 = v5;
    }
    else {
      unsigned int v9 = 57;
    }
    if (i) {
      int v10 = v8;
    }
    else {
      int v10 = 7;
    }
    if (i) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = 0;
    }
    if ((*((_DWORD *)this + v11 + 78) & a2) != 0)
    {
      mach_absolute_time();
      uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
      if (KeyboardEvent)
      {
        uint64_t v13 = (const void *)KeyboardEvent;
        IOHIDEventSetIntegerValue();
        (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))(*((void *)this + 5), *((void *)this + 6), this, v13, 0);
        CFRelease(v13);
        IOHIDKeyboardFilter::setStickyKeyState(this, v10, v9, 1);
      }
    }
  }
}

void IOHIDKeyboardFilter::processShiftKey(IOHIDKeyboardFilter *this)
{
  v8[3] = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 88))
  {
    int v2 = *((_DWORD *)this + 77);
    unsigned int v3 = v2 + 1;
    *((_DWORD *)this + 77) = v2 + 1;
    if (!v2)
    {
      char v4 = *((void *)this + 63);
      dispatch_time_t v5 = dispatch_time(0, 30000000000);
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
      unsigned int v3 = *((_DWORD *)this + 77);
    }
    if (v3 >= 5)
    {
      *((_DWORD *)this + 77) = 0;
      *((_DWORD *)this + 89) = *((_DWORD *)this + 89) == 0;
      char v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t RegistryID = *((void *)this + 3);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        sub_2407ADF00(RegistryID, (_DWORD *)this + 89, (uint64_t)v8, v6);
      }

      IOHIDServiceSetProperty();
      if (*((_DWORD *)this + 89)) {
        IOHIDKeyboardFilter::startStickyKey(this);
      }
      else {
        IOHIDKeyboardFilter::dispatchStickyKeys(this, 14);
      }
    }
  }
}

void sub_2407AB754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2407AB76C(uint64_t a1)
{
}

void *IOHIDKeyboardFilter::serializeMapper@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], *(int *)(a1 + 16), MEMORY[0x263EFFF70]);
  uint64_t result = sub_2407ABEE8((void *)a2, Mutable, 1);
  *(void *)a2 = &unk_26F4E65C8;
  char v6 = *(void **)a1;
  if (*(void *)a1 != a1 + 8)
  {
    do
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
      value = (void *)0xAAAAAAAAAAAAAAAALL;
      sub_2407ABCE8(&v10, 2);
      sub_2407AB8CC((uint64_t)&v10, @"Src", v6[4]);
      sub_2407AB8CC((uint64_t)&v10, @"Dst", v6[6]);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), value);
      uint64_t result = sub_2407ABE0C(&v10);
      uint64_t v7 = (void *)v6[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (void *)v6[2];
          BOOL v9 = *v8 == (void)v6;
          char v6 = v8;
        }
        while (!v9);
      }
      char v6 = v8;
    }
    while (v8 != (void *)(a1 + 8));
  }
  return result;
}

void sub_2407AB8A8(_Unwind_Exception *a1)
{
  sub_2407AC034(v1);
  _Unwind_Resume(a1);
}

void *sub_2407AB8CC(uint64_t a1, const void *a2, uint64_t a3)
{
  sub_2407AD8F0(&v6, a3);
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_2407ABE5C(&v6);
}

void sub_2407AB928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDKeyboardFilter::serializeModifierMappings@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], *(int *)(a1 + 16), MEMORY[0x263EFFF70]);
  uint64_t result = sub_2407ABEE8((void *)a2, Mutable, 1);
  *(void *)a2 = &unk_26F4E65C8;
  uint64_t v7 = *(void **)a1;
  if (*(void *)a1 != a1 + 8)
  {
    do
    {
      unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
      sub_2407ABCE8(&v14, *((_DWORD *)v7 + 14));
      CFStringRef v8 = CFStringCreateWithFormat(v4, 0, @"%#x", *((unsigned int *)v7 + 8));
      IOHIDKeyboardFilter::serializeMapper((uint64_t)(v7 + 5), (uint64_t)&v12);
      if (v8 && value) {
        CFDictionarySetValue(theDict, v8, value);
      }
      sub_2407AC034(&v12);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), theDict);
      uint64_t result = sub_2407ABE0C(&v14);
      BOOL v9 = (void *)v7[1];
      if (v9)
      {
        do
        {
          unint64_t v10 = v9;
          BOOL v9 = (void *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          unint64_t v10 = (void *)v7[2];
          BOOL v11 = *v10 == (void)v7;
          uint64_t v7 = v10;
        }
        while (!v11);
      }
      uint64_t v7 = v10;
    }
    while (v10 != (void *)(a1 + 8));
  }
  return result;
}

void sub_2407ABA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  sub_2407AC034((uint64_t *)va);
  sub_2407ABE0C((uint64_t *)va1);
  sub_2407AC034(v3);
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::getKeyboardID(IOHIDKeyboardFilter *this, int a2, int a3)
{
  if (a3 != 1452) {
    return 3;
  }
  if ((a2 - 514) > 0x11) {
    return 198;
  }
  return dword_2407AE8E4[(__int16)(a2 - 514)];
}

void sub_2407ABBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2407ABCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *sub_2407ABCE8(void *a1, int a2)
{
  *a1 = &unk_26F4E64F8;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  return a1;
}

void sub_2407ABD48(_Unwind_Exception *a1)
{
  sub_2407ABE0C(v1);
  _Unwind_Resume(a1);
}

void sub_2407ABD5C(void *a1)
{
  sub_2407ABE0C(a1);

  JUMPOUT(0x2455F9DD0);
}

void sub_2407ABD98(void *a1)
{
  sub_2407ABE0C(a1);

  JUMPOUT(0x2455F9DD0);
}

void sub_2407ABDD4(void *a1)
{
  sub_2407ABE0C(a1);

  JUMPOUT(0x2455F9DD0);
}

void *sub_2407ABE0C(void *a1)
{
  int v2 = (const void *)a1[1];
  *a1 = &unk_26F4E6578;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407ABE5C(void *a1)
{
  int v2 = (const void *)a1[1];
  *a1 = &unk_26F4E6598;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_2407ABEB0(void *a1)
{
  sub_2407ABE5C(a1);

  JUMPOUT(0x2455F9DD0);
}

void *sub_2407ABEE8(void *a1, CFTypeRef cf, char a3)
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
  *a1 = &unk_26F4E6648;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E6628;
  return a1;
}

void sub_2407ABF84(void *a1)
{
  sub_2407AC034(a1);

  JUMPOUT(0x2455F9DD0);
}

void sub_2407ABFC0(void *a1)
{
  sub_2407AC034(a1);

  JUMPOUT(0x2455F9DD0);
}

void sub_2407ABFFC(void *a1)
{
  sub_2407AC034(a1);

  JUMPOUT(0x2455F9DD0);
}

void *sub_2407AC034(void *a1)
{
  int v2 = (const void *)a1[1];
  *a1 = &unk_26F4E6648;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_2407AC084(void *a1, CFTypeRef cf, char a3)
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
  *a1 = &unk_26F4E6578;
  a1[1] = v7;
  if (v7 && (a3 & 1) == 0) {
    CFRetain(v7);
  }
  *a1 = &unk_26F4E6558;
  return a1;
}

void *sub_2407AC120(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_2407AC1D4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    CFTypeID v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFTypeID v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_2407AC1D4()
{
}

void sub_2407AC1EC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2407AC248(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2650D5F28, MEMORY[0x263F8C060]);
}

void sub_2407AC234(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2407AC248(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_2407AC27C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2407AC27C(a1, *a2);
    sub_2407AC27C(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_2407AC2D0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_2407AC2D0(a1, *a2);
    sub_2407AC2D0(a1, a2[1]);
    sub_2407AC27C((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }
}

uint64_t **sub_2407AC330(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  CFTypeID v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        BOOL v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        CFTypeID v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      CFTypeID v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    BOOL v9 = a1 + 1;
LABEL_10:
    BOOL v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 7) = 0;
    *((void *)v11 + 6) = 0;
    *((void *)v11 + 5) = v11 + 12;
    sub_2407AC400(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_2407AC400(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = sub_2407AC458(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_2407AC458(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unsigned int v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }
          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              unsigned int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *BOOL v9 = v2;
            v2[2] = (uint64_t)v9;
            unsigned int v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unsigned int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *int v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unsigned int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unsigned int v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *int v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t **sub_2407AC5F0(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  size_t v5 = result;
  if (result[2])
  {
    int v6 = *result;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    _OWORD v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      int v8 = (uint64_t *)v6[1];
    }
    else {
      int v8 = v6;
    }
    unsigned int v10 = result;
    uint64_t v11 = v8;
    uint64_t v12 = v8;
    if (v8)
    {
      uint64_t v11 = sub_2407AC7A4((uint64_t)v8);
      while (a2 != a3)
      {
        sub_2407AC6F8(v5, a2, (uint64_t)v8);
        if (v9)
        {
          int v8 = v11;
          uint64_t v12 = v11;
          if (!v11)
          {
            a2 += 4;
            break;
          }
          uint64_t v11 = sub_2407AC7A4((uint64_t)v11);
        }
        else
        {
          int v8 = v12;
        }
        a2 += 4;
        if (!v8) {
          break;
        }
      }
    }
    uint64_t result = (uint64_t **)sub_2407AC7F8((uint64_t)&v10);
  }
  while (a2 != a3)
  {
    uint64_t result = sub_2407AC850(v5, a2, a2);
    a2 += 4;
  }
  return result;
}

void sub_2407AC6E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2407AC7F8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_2407AC6F8(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  size_t v4 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    unint64_t v6 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v6 >= v8) {
          break;
        }
        size_t v5 = *v7;
        size_t v4 = v7;
        if (!*v7) {
          goto LABEL_10;
        }
      }
      if (v8 >= v6) {
        return v7;
      }
      size_t v5 = v7[1];
      if (!v5)
      {
        size_t v4 = v7 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v7 = a1 + 1;
LABEL_10:
    unint64_t v9 = *a2;
    *(unsigned char *)(a3 + 40) = *((unsigned char *)a2 + 8);
    *(void *)(a3 + 32) = v9;
    unint64_t v10 = a2[2];
    *(unsigned char *)(a3 + 56) = *((unsigned char *)a2 + 24);
    *(void *)(a3 + 48) = v10;
    sub_2407AC400(a1, (uint64_t)v7, v4, (uint64_t *)a3);
  }
  return (uint64_t **)a3;
}

void *sub_2407AC7A4(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    unsigned int v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0;
      while (1)
      {
        size_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          size_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; unsigned int v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          unsigned int v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t sub_2407AC7F8(uint64_t a1)
{
  sub_2407AC27C(*(void *)a1, *(void **)(a1 + 16));
  int v2 = *(void **)(a1 + 8);
  if (v2)
  {
    unsigned int v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        int v2 = v3;
        unsigned int v3 = (void *)v3[2];
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    sub_2407AC27C(*(void *)a1, v2);
  }
  return a1;
}

uint64_t **sub_2407AC850(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  unint64_t v6 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        size_t v5 = *v8;
        unint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      size_t v5 = v8[1];
      if (!v5)
      {
        unint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = (uint64_t *)operator new(0x40uLL);
    long long v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    sub_2407AC400(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void sub_2407AC90C(uint64_t a1, void *a2)
{
  size_t v4 = (void *)(a1 + 8);
  sub_2407AC27C(a1, *(void **)(a1 + 8));
  *(void *)a1 = *a2;
  size_t v5 = a2 + 1;
  uint64_t v6 = a2[1];
  *size_t v4 = v6;
  uint64_t v7 = a2[2];
  *(void *)(a1 + 16) = v7;
  if (v7)
  {
    *(void *)(v6 + 16) = v4;
    *a2 = v5;
    void *v5 = 0;
    a2[2] = 0;
  }
  else
  {
    *(void *)a1 = v4;
  }
}

uint64_t *sub_2407AC978(uint64_t **a1, uint64_t *a2)
{
  int v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unsigned int v3 = v2;
      int v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    size_t v4 = a2;
    do
    {
      unsigned int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      size_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_2407AC9EC(v6, a2);
  return v3;
}

uint64_t *sub_2407AC9EC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unsigned int v3 = a2;
  if (*a2)
  {
    size_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unsigned int v3 = a2;
      goto LABEL_7;
    }
    do
    {
      unsigned int v3 = v4;
      size_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *unsigned int v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      int v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        _OWORD v7[2] = (uint64_t)v15;
        int v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      int v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    int v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    _OWORD v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  __int16 v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  unsigned int v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    unsigned int v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *unsigned int v20 = (uint64_t)v7;
    _OWORD v7[2] = (uint64_t)v20;
    __int16 v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  int v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void *sub_2407ACD70(void *a1, int a2)
{
  int valuePtr = a2;
  *a1 = &unk_26F4E6668;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  return a1;
}

void sub_2407ACDD8(_Unwind_Exception *a1)
{
  sub_2407ABE5C(v1);
  _Unwind_Resume(a1);
}

void sub_2407ACDEC(void *a1)
{
  sub_2407ABE5C(a1);

  JUMPOUT(0x2455F9DD0);
}

uint64_t *sub_2407ACE24(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_2407ACE7C(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_2407ACE64(_Unwind_Exception *a1)
{
  sub_2407AC27C(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_2407ACE7C(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    size_t v4 = a2;
    int v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = sub_2407ACF08(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          int v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          size_t v4 = v8;
        }
        while (!v9);
      }
      size_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_2407ACF08(uint64_t **a1, void *a2, unint64_t *a3, _OWORD *a4)
{
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = (void **)sub_2407ACF98(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x40uLL);
    long long v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    sub_2407AC400(a1, v12, v8, v7);
  }
  return v7;
}

void *sub_2407ACF98(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      long long v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        long long v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    int v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          int v16 = (void *)*v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        int v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      int v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    uint64_t v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      uint64_t v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    __int16 v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      __int16 v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    unsigned int v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          BOOL v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          unsigned int v20 = (void *)*v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        unsigned int v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      BOOL v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t **sub_2407AD140(uint64_t **result, void *a2, void *a3)
{
  int v5 = result;
  if (result[2])
  {
    unint64_t v6 = *result;
    unint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    _OWORD v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    int v16 = result;
    int v17 = v8;
    unint64_t v18 = v8;
    if (v8)
    {
      int v17 = sub_2407AC7A4((uint64_t)v8);
      if (a2 != a3)
      {
        long long v9 = a2;
        do
        {
          uint64_t v10 = v9[4];
          *((unsigned char *)v8 + 40) = *((unsigned char *)v9 + 40);
          void v8[4] = v10;
          uint64_t v11 = v9[6];
          *((unsigned char *)v8 + 56) = *((unsigned char *)v9 + 56);
          v8[6] = v11;
          sub_2407AD2BC(v5, v8);
          uint64_t v8 = v17;
          unint64_t v18 = v17;
          if (v17) {
            int v17 = sub_2407AC7A4((uint64_t)v17);
          }
          uint64_t v12 = (void *)v9[1];
          if (v12)
          {
            do
            {
              a2 = v12;
              uint64_t v12 = (void *)*v12;
            }
            while (v12);
          }
          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v13 = *a2 == (void)v9;
              long long v9 = a2;
            }
            while (!v13);
          }
          if (!v8) {
            break;
          }
          long long v9 = a2;
        }
        while (a2 != a3);
      }
    }
    uint64_t result = (uint64_t **)sub_2407AC7F8((uint64_t)&v16);
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)sub_2407AD32C(v5, (_OWORD *)a2 + 2);
      BOOL v14 = (void *)a2[1];
      if (v14)
      {
        do
        {
          unint64_t v15 = v14;
          BOOL v14 = (void *)*v14;
        }
        while (v14);
      }
      else
      {
        do
        {
          unint64_t v15 = (void *)a2[2];
          BOOL v13 = *v15 == (void)a2;
          a2 = v15;
        }
        while (!v13);
      }
      a2 = v15;
    }
    while (v15 != a3);
  }
  return result;
}

void sub_2407AD2A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_2407AC7F8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *sub_2407AD2BC(uint64_t **a1, uint64_t *a2)
{
  unsigned int v3 = a1 + 1;
  size_t v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        unsigned int v3 = (uint64_t **)v4;
        if (a2[4] >= (unint64_t)v4[4]) {
          break;
        }
        size_t v4 = (uint64_t *)*v4;
        int v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }
      size_t v4 = (uint64_t *)v4[1];
    }
    while (v4);
    int v5 = v3 + 1;
  }
  else
  {
    int v5 = a1 + 1;
  }
LABEL_8:
  sub_2407AC400(a1, (uint64_t)v3, v5, a2);
  return a2;
}

_OWORD *sub_2407AD32C(uint64_t **a1, _OWORD *a2)
{
  size_t v4 = operator new(0x40uLL);
  int v5 = v4;
  long long v6 = a2[1];
  v4[2] = *a2;
  v4[3] = v6;
  unint64_t v7 = a1 + 1;
  uint64_t v8 = a1[1];
  if (v8)
  {
    do
    {
      while (1)
      {
        unint64_t v7 = (uint64_t **)v8;
        if (*((void *)v4 + 4) >= (unint64_t)v8[4]) {
          break;
        }
        uint64_t v8 = (uint64_t *)*v8;
        long long v9 = v7;
        if (!*v7) {
          goto LABEL_8;
        }
      }
      uint64_t v8 = (uint64_t *)v8[1];
    }
    while (v8);
    long long v9 = v7 + 1;
  }
  else
  {
    long long v9 = a1 + 1;
  }
LABEL_8:
  sub_2407AC400(a1, (uint64_t)v7, v9, (uint64_t *)v4);
  return v5;
}

uint64_t sub_2407AD3C4(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_2407AD464(a1);
  return a1;
}

void sub_2407AD440(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void sub_2407AD464(uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    size_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    size_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        size_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

uint64_t sub_2407AD578(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)a1 = a1 + 8;
  sub_2407AD5D0((_OWORD *)a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_2407AD5B8(_Unwind_Exception *a1)
{
  sub_2407AC27C(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

_OWORD *sub_2407AD5D0(_OWORD *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    size_t v4 = a2;
    unint64_t v5 = (uint64_t **)result;
    int v6 = (void *)result + 1;
    do
    {
      uint64_t result = sub_2407AD65C(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      std::string::size_type v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          std::string::size_type v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          size_t v4 = v8;
        }
        while (!v9);
      }
      size_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

_OWORD *sub_2407AD65C(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = (void **)sub_2407ACF98(a1, a2, &v11, &v10, a3);
  std::string::size_type v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    std::string::size_type v7 = operator new(0x38uLL);
    _OWORD v7[2] = *(_OWORD *)a4;
    *((void *)v7 + 6) = *(void *)(a4 + 16);
    sub_2407AC400(a1, v11, v8, (uint64_t *)v7);
  }
  return v7;
}

uint64_t **sub_2407AD6F4(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  int v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unint64_t v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    sub_2407AC400(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }
  return v8;
}

uint64_t sub_2407AD7B0(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  size_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v2 + 1;
    }
    if (v6) {
      size_t v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  sub_2407AC978((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t **sub_2407AD82C(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unint64_t v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = operator new(0x38uLL);
    v10[2] = *(_OWORD *)a3;
    *((_DWORD *)v10 + 12) = *(_DWORD *)(a3 + 16);
    sub_2407AC400(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }
  return v8;
}

void *sub_2407AD8F0(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_26F4E6668;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_2407AD958(_Unwind_Exception *a1)
{
  sub_2407ABE5C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2407AD96C(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  return result;
}

void sub_2407AD984(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

void sub_2407AD9B0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_2407AD9CC(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_2407AD9E8(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t sub_2407AD9F4(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = a3;
  return result;
}

uint64_t sub_2407ADA0C(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(void *)(a4 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  return result;
}

void sub_2407ADA24(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2407A4000, a2, OS_LOG_TYPE_DEBUG, "Event dropped: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_2407ADA9C(uint64_t a1, uint64_t a2)
{
  sub_2407AD9E8(a1, a2, 5.7779e-34);
  _os_log_error_impl(&dword_2407A4000, v2, OS_LOG_TYPE_ERROR, "Insufficient permissions to remap alphanumeric keys or special characters for UUID: %@\n", v3, 0xCu);
}

void sub_2407ADAE0(uint64_t a1, uint64_t a2, int a3)
{
  sub_2407AD9F4(a1, a2, a3, 5.778e-34);
  sub_2407AD984(&dword_2407A4000, "[%@] _stickyKeyOn: %d\n", v3, v4);
}

void sub_2407ADB1C()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _stickyKeyDisable: %d\n", v3, v4);
}

void sub_2407ADB54()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _stickyKeyToggle: %d\n", v3, v4);
}

void sub_2407ADB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2407ADA0C(a1, 5.778e-34, a2, a3);
  sub_2407AD9B0(&dword_2407A4000, "[%@] _keyRepeatInitialDelayMS: %lld\n", v3, v4);
}

void sub_2407ADBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2407ADA0C(a1, 5.778e-34, a2, a3);
  sub_2407AD9B0(&dword_2407A4000, "[%@] _keyRepeatDelayMS: %lld\n", v3, v4);
}

void sub_2407ADC0C(uint64_t a1, uint64_t a2, int a3)
{
  sub_2407AD9F4(a1, a2, a3, 5.778e-34);
  sub_2407AD984(&dword_2407A4000, "[%@] capsLockState: %d\n", v3, v4);
}

void sub_2407ADC48()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _capsLockLEDInhibit: %d\n", v3, v4);
}

void sub_2407ADC80()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _capsLockDarkWakeLEDInhibit: %d\n", v3, v4);
}

void sub_2407ADCB8(uint64_t a1, uint64_t a2)
{
  sub_2407AD9E8(a1, a2, 5.7779e-34);
  sub_2407AD9CC(&dword_2407A4000, v2, v3, "[%@] _modifiersKeyMap initialized\n", v4);
}

void sub_2407ADCF0()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _fnKeyMode: %x\n", v3, v4);
}

void sub_2407ADD28(uint64_t a1, uint64_t a2)
{
  sub_2407AD9E8(a1, a2, 5.7779e-34);
  sub_2407AD9CC(&dword_2407A4000, v2, v3, "[%@] _userKeyMap initialized\n", v4);
}

void sub_2407ADD60()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _slowKeysDelayMS = %d\n", v3, v4);
}

void sub_2407ADD98()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _capsLockDelayMS: %d\n", v3, v4);
}

void sub_2407ADDD0()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _capsLockDelayOverrideMS: %d\n", v3, v4);
}

void sub_2407ADE08()
{
  sub_2407AD9A0();
  sub_2407AD96C(v0, 5.778e-34, v1, v2);
  sub_2407AD984(&dword_2407A4000, "[%@] _lockKeyDelayMS: %d\n", v3, v4);
}

void sub_2407ADE40(uint64_t a1, uint64_t a2)
{
  sub_2407AD9E8(a1, a2, 5.7779e-34);
  sub_2407AD9CC(&dword_2407A4000, v2, v3, "[%@] _unifiedModifiedKeyMaps[kKeyMaskCtrl] updated\n", v4);
}

void sub_2407ADE78(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4 = *(void *)(a2 + 456);
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  sub_2407AD9B0(&dword_2407A4000, "[%@] _capsLockLED: %@\n", (uint8_t *)a3, a4);
}

void sub_2407ADEC8(uint64_t a1, uint64_t a2)
{
  sub_2407AD9E8(a1, a2, 5.7779e-34);
  sub_2407AD9CC(&dword_2407A4000, v2, v3, "[%@] Event cancelled\n", v4);
}

void sub_2407ADF00(uint64_t a1, _DWORD *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4 = "ON";
  if (!*a2) {
    uint64_t v4 = "OFF";
  }
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  sub_2407AD9B0(&dword_2407A4000, "[%@] StickyKey state change (5xSHIFT) to %s\n", (uint8_t *)a3, a4);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
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

uint64_t IOHIDAccessCheckAuditToken()
{
  return MEMORY[0x270EF4018]();
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x270EF41E8]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x270EF4228]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x270EF4280]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x270EF42F0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x270EF4310]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x270EF4330]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x270EF43C0]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x270EF43D0]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x270EF43F8]();
}

uint64_t IOHIDEventSystemConnectionGetAuditToken()
{
  return MEMORY[0x270EF44E8]();
}

uint64_t IOHIDEventSystemConnectionGetUUID()
{
  return MEMORY[0x270EF4510]();
}

uint64_t IOHIDEventSystemConnectionHasEntitlement()
{
  return MEMORY[0x270EF4518]();
}

uint64_t IOHIDPreferencesCopyDomain()
{
  return MEMORY[0x270EF45D0]();
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

uint64_t IOHIDServiceSetElementValue()
{
  return MEMORY[0x270EF46A8]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x270EF46B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x270EF4B98]();
}

uint64_t _IOHIDEventRemoveAttachment()
{
  return MEMORY[0x270EF4BA0]();
}

uint64_t _IOHIDEventSetAttachment()
{
  return MEMORY[0x270EF4BA8]();
}

uint64_t _IOHIDIsRestrictedRemappingProperty()
{
  return MEMORY[0x270EF4BC0]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x270EF4BC8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98BC8](__str, __idx, *(void *)&__base);
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

void __cxa_rethrow(void)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}